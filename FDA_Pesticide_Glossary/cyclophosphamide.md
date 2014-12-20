---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.613717, -0.130542, -1.928188, 1, 0, 0, 1,
-3.214183, -1.526338, -2.252353, 1, 0.007843138, 0, 1,
-2.747983, 0.5732384, -2.482727, 1, 0.01176471, 0, 1,
-2.590748, 0.7630576, -0.4263175, 1, 0.01960784, 0, 1,
-2.474239, -0.4193302, -1.545338, 1, 0.02352941, 0, 1,
-2.410574, -0.4604124, -2.635524, 1, 0.03137255, 0, 1,
-2.392208, -0.3868588, -3.187451, 1, 0.03529412, 0, 1,
-2.387304, 0.3607829, -1.574732, 1, 0.04313726, 0, 1,
-2.383514, 0.1730436, -0.7100793, 1, 0.04705882, 0, 1,
-2.355793, -0.4156063, -2.596918, 1, 0.05490196, 0, 1,
-2.278919, 0.4965922, -1.567911, 1, 0.05882353, 0, 1,
-2.277676, 1.148645, -2.208589, 1, 0.06666667, 0, 1,
-2.276382, 0.1425744, -2.607621, 1, 0.07058824, 0, 1,
-2.23928, 0.8536478, -1.1888, 1, 0.07843138, 0, 1,
-2.233538, 0.5941797, -1.731709, 1, 0.08235294, 0, 1,
-2.216183, -1.528778, -1.756725, 1, 0.09019608, 0, 1,
-2.18518, -0.1484172, -0.4628835, 1, 0.09411765, 0, 1,
-2.18237, 0.1334035, -1.710203, 1, 0.1019608, 0, 1,
-2.179831, 1.419179, -0.462452, 1, 0.1098039, 0, 1,
-2.166395, -0.8618274, -3.860573, 1, 0.1137255, 0, 1,
-2.156446, -1.960866, -2.849057, 1, 0.1215686, 0, 1,
-2.138131, 0.5486347, -0.8323807, 1, 0.1254902, 0, 1,
-2.095694, 0.5424314, -1.376639, 1, 0.1333333, 0, 1,
-2.058913, 0.897447, 0.237943, 1, 0.1372549, 0, 1,
-2.049069, -1.120088, -1.557519, 1, 0.145098, 0, 1,
-2.001507, -0.003479999, -2.754199, 1, 0.1490196, 0, 1,
-1.994341, -0.5253398, -2.653213, 1, 0.1568628, 0, 1,
-1.986646, 0.08478384, -1.073686, 1, 0.1607843, 0, 1,
-1.977239, -0.04157853, -1.394218, 1, 0.1686275, 0, 1,
-1.950007, -0.3821026, -0.9746925, 1, 0.172549, 0, 1,
-1.949745, 0.1724656, -2.002453, 1, 0.1803922, 0, 1,
-1.941051, 1.183296, 1.172257, 1, 0.1843137, 0, 1,
-1.874432, -0.6064854, -3.256358, 1, 0.1921569, 0, 1,
-1.854167, -1.240569, -1.547529, 1, 0.1960784, 0, 1,
-1.838741, 0.02328226, -1.045004, 1, 0.2039216, 0, 1,
-1.776229, -1.133659, -3.678443, 1, 0.2117647, 0, 1,
-1.760084, -0.1089561, -4.552808, 1, 0.2156863, 0, 1,
-1.757986, 1.172979, -1.916511, 1, 0.2235294, 0, 1,
-1.743203, 1.663218, -1.06341, 1, 0.227451, 0, 1,
-1.680253, -1.124505, -2.01213, 1, 0.2352941, 0, 1,
-1.678075, 0.7152418, -2.277257, 1, 0.2392157, 0, 1,
-1.671278, -0.3661762, -1.83541, 1, 0.2470588, 0, 1,
-1.665329, 1.971672, -0.3451663, 1, 0.2509804, 0, 1,
-1.657208, 0.2263569, -0.4952579, 1, 0.2588235, 0, 1,
-1.651405, -0.9456241, -2.188967, 1, 0.2627451, 0, 1,
-1.651029, 1.113347, -0.1829281, 1, 0.2705882, 0, 1,
-1.650266, 0.3191668, -0.7831515, 1, 0.2745098, 0, 1,
-1.645681, -2.302865, -4.401658, 1, 0.282353, 0, 1,
-1.62326, -0.9094057, -1.501688, 1, 0.2862745, 0, 1,
-1.601752, 1.666994, -0.1985518, 1, 0.2941177, 0, 1,
-1.60108, -0.2766926, -4.045356, 1, 0.3019608, 0, 1,
-1.588969, -1.527953, -4.313583, 1, 0.3058824, 0, 1,
-1.582031, -1.168706, -4.610604, 1, 0.3137255, 0, 1,
-1.579402, 1.190243, -0.3579513, 1, 0.3176471, 0, 1,
-1.573615, 0.4154946, -1.164785, 1, 0.3254902, 0, 1,
-1.571214, -0.07703328, -1.206432, 1, 0.3294118, 0, 1,
-1.555426, -0.3845778, -1.140317, 1, 0.3372549, 0, 1,
-1.54991, -1.434208, -3.62979, 1, 0.3411765, 0, 1,
-1.539027, 0.2629753, -1.558365, 1, 0.3490196, 0, 1,
-1.532039, -0.5194725, -3.511696, 1, 0.3529412, 0, 1,
-1.528667, -0.1493236, -2.156624, 1, 0.3607843, 0, 1,
-1.521752, 1.082771, -0.2100034, 1, 0.3647059, 0, 1,
-1.520096, -0.1022851, -0.5806652, 1, 0.372549, 0, 1,
-1.508643, 0.3657394, -1.309592, 1, 0.3764706, 0, 1,
-1.508564, 0.6701584, -1.873155, 1, 0.3843137, 0, 1,
-1.493809, 0.1312356, -1.663473, 1, 0.3882353, 0, 1,
-1.492372, -0.9134529, -0.6696005, 1, 0.3960784, 0, 1,
-1.490975, -0.9650946, -0.8501697, 1, 0.4039216, 0, 1,
-1.488945, 0.1085747, -1.388245, 1, 0.4078431, 0, 1,
-1.476239, -2.747866, -2.254849, 1, 0.4156863, 0, 1,
-1.47164, -0.7807618, -2.110531, 1, 0.4196078, 0, 1,
-1.468063, 1.969807, -2.032081, 1, 0.427451, 0, 1,
-1.465819, 1.440061, -0.5723947, 1, 0.4313726, 0, 1,
-1.455112, -0.5470732, -0.8017998, 1, 0.4392157, 0, 1,
-1.452611, -1.332986, -2.485872, 1, 0.4431373, 0, 1,
-1.451463, 1.282379, -2.211796, 1, 0.4509804, 0, 1,
-1.449847, 0.8791571, -0.431793, 1, 0.454902, 0, 1,
-1.447715, 1.752288, 0.3666585, 1, 0.4627451, 0, 1,
-1.434686, -0.6323555, -3.478382, 1, 0.4666667, 0, 1,
-1.425607, 0.3526974, -1.461535, 1, 0.4745098, 0, 1,
-1.42037, 0.08908528, -0.7910829, 1, 0.4784314, 0, 1,
-1.413071, -0.2226986, -1.199908, 1, 0.4862745, 0, 1,
-1.408606, 0.855211, -1.21068, 1, 0.4901961, 0, 1,
-1.400246, -1.749061, -2.125887, 1, 0.4980392, 0, 1,
-1.394077, -1.664774, -5.51141, 1, 0.5058824, 0, 1,
-1.393685, -1.519108, -1.853022, 1, 0.509804, 0, 1,
-1.390667, -1.063319, -1.819958, 1, 0.5176471, 0, 1,
-1.390034, -0.3097453, -2.791124, 1, 0.5215687, 0, 1,
-1.382143, 1.506859, 1.096135, 1, 0.5294118, 0, 1,
-1.37716, 0.2965697, 0.6987637, 1, 0.5333334, 0, 1,
-1.369438, 2.278473, -0.9727402, 1, 0.5411765, 0, 1,
-1.366466, 1.324846, -1.565702, 1, 0.5450981, 0, 1,
-1.358261, -2.266858, -0.7641996, 1, 0.5529412, 0, 1,
-1.355092, -0.3066943, -1.632486, 1, 0.5568628, 0, 1,
-1.349922, -0.6285092, -3.20801, 1, 0.5647059, 0, 1,
-1.347429, 0.172574, -0.6902166, 1, 0.5686275, 0, 1,
-1.3447, -0.7053338, -0.9542651, 1, 0.5764706, 0, 1,
-1.332161, 2.013027, -1.292308, 1, 0.5803922, 0, 1,
-1.331646, 0.42756, -0.4676621, 1, 0.5882353, 0, 1,
-1.326856, -1.061944, -1.141456, 1, 0.5921569, 0, 1,
-1.326301, 0.6382131, -1.420587, 1, 0.6, 0, 1,
-1.326164, 0.9910562, 0.830517, 1, 0.6078432, 0, 1,
-1.325668, -2.237844, -4.036706, 1, 0.6117647, 0, 1,
-1.323945, 0.09300862, -1.568515, 1, 0.6196079, 0, 1,
-1.322765, -1.790773, -0.9427755, 1, 0.6235294, 0, 1,
-1.320413, -0.4428461, -1.094527, 1, 0.6313726, 0, 1,
-1.319196, -1.192484, -2.517976, 1, 0.6352941, 0, 1,
-1.310153, 0.7055144, -1.060099, 1, 0.6431373, 0, 1,
-1.306863, -2.245155, -3.265718, 1, 0.6470588, 0, 1,
-1.29426, -0.6977002, -0.9624634, 1, 0.654902, 0, 1,
-1.266919, -0.9146807, -2.155289, 1, 0.6588235, 0, 1,
-1.245243, 0.3219284, -1.911488, 1, 0.6666667, 0, 1,
-1.237108, 0.7878439, -0.6854637, 1, 0.6705883, 0, 1,
-1.233379, 1.503119, -1.335086, 1, 0.6784314, 0, 1,
-1.230676, -0.9939857, -1.616894, 1, 0.682353, 0, 1,
-1.226879, -0.343117, -1.148368, 1, 0.6901961, 0, 1,
-1.226395, -0.6954588, -0.2229914, 1, 0.6941177, 0, 1,
-1.222131, 0.7895591, 0.8009405, 1, 0.7019608, 0, 1,
-1.200243, -0.2505739, -0.2221496, 1, 0.7098039, 0, 1,
-1.182461, -0.4163142, -0.5600405, 1, 0.7137255, 0, 1,
-1.179235, -1.363577, -1.302538, 1, 0.7215686, 0, 1,
-1.162859, 0.4658545, -1.033845, 1, 0.7254902, 0, 1,
-1.162785, 0.4740061, -1.837392, 1, 0.7333333, 0, 1,
-1.159162, -0.01277385, -2.586244, 1, 0.7372549, 0, 1,
-1.157621, -0.7508612, -0.9027205, 1, 0.7450981, 0, 1,
-1.155914, -0.1441204, -2.319522, 1, 0.7490196, 0, 1,
-1.154918, -1.282596, -3.631579, 1, 0.7568628, 0, 1,
-1.15253, 1.82544, -0.2364943, 1, 0.7607843, 0, 1,
-1.152404, 1.166939, -0.5810648, 1, 0.7686275, 0, 1,
-1.147258, 0.926129, -0.5768942, 1, 0.772549, 0, 1,
-1.142271, 1.216153, 0.71008, 1, 0.7803922, 0, 1,
-1.134282, 0.3743245, -1.858675, 1, 0.7843137, 0, 1,
-1.133269, 0.2380692, -1.412644, 1, 0.7921569, 0, 1,
-1.130692, 1.162246, -0.6674632, 1, 0.7960784, 0, 1,
-1.123742, 1.078215, 0.4362271, 1, 0.8039216, 0, 1,
-1.120051, 1.578377, -0.6726952, 1, 0.8117647, 0, 1,
-1.119216, -0.3774263, -1.377654, 1, 0.8156863, 0, 1,
-1.116745, 0.9944509, -0.7164077, 1, 0.8235294, 0, 1,
-1.112579, -0.7430006, -4.082457, 1, 0.827451, 0, 1,
-1.108179, -0.01947631, -3.55194, 1, 0.8352941, 0, 1,
-1.104003, -0.007603819, -1.504013, 1, 0.8392157, 0, 1,
-1.103025, 0.04750714, -1.54384, 1, 0.8470588, 0, 1,
-1.095508, -1.439717, -2.788056, 1, 0.8509804, 0, 1,
-1.092054, 1.308753, -0.7975743, 1, 0.8588235, 0, 1,
-1.091517, 0.4412181, -1.19006, 1, 0.8627451, 0, 1,
-1.090811, 2.31372, -0.7223528, 1, 0.8705882, 0, 1,
-1.089144, 1.393397, -1.750851, 1, 0.8745098, 0, 1,
-1.087782, 0.1929738, 0.04618252, 1, 0.8823529, 0, 1,
-1.086375, 3.405777, 1.101563, 1, 0.8862745, 0, 1,
-1.080457, -2.064069, -3.172727, 1, 0.8941177, 0, 1,
-1.063994, 0.4654198, -1.086648, 1, 0.8980392, 0, 1,
-1.063821, 0.4760894, -1.885649, 1, 0.9058824, 0, 1,
-1.059181, 1.466245, -0.4295537, 1, 0.9137255, 0, 1,
-1.042246, 1.52053, -1.142447, 1, 0.9176471, 0, 1,
-1.040433, -2.174364, -3.440908, 1, 0.9254902, 0, 1,
-1.037954, -0.190471, -1.501486, 1, 0.9294118, 0, 1,
-1.034672, -0.2860072, -2.981751, 1, 0.9372549, 0, 1,
-1.034233, 2.393572, 0.4493272, 1, 0.9411765, 0, 1,
-1.033222, 0.8039918, -0.3992468, 1, 0.9490196, 0, 1,
-1.029861, 1.148762, -1.508192, 1, 0.9529412, 0, 1,
-1.023342, -0.1661264, -2.886391, 1, 0.9607843, 0, 1,
-1.014158, 0.8350164, 0.7301216, 1, 0.9647059, 0, 1,
-1.000041, 1.647171, -0.1157828, 1, 0.972549, 0, 1,
-0.9978962, 0.05031082, -1.581277, 1, 0.9764706, 0, 1,
-0.9967042, 0.03776092, -1.734581, 1, 0.9843137, 0, 1,
-0.9919213, 2.341328, -1.181206, 1, 0.9882353, 0, 1,
-0.9899452, 1.43092, 0.2386099, 1, 0.9960784, 0, 1,
-0.9864389, 1.879037, -2.185646, 0.9960784, 1, 0, 1,
-0.980351, -0.1920579, -0.7205904, 0.9921569, 1, 0, 1,
-0.9766591, 0.4935981, -3.027923, 0.9843137, 1, 0, 1,
-0.958489, -0.05394016, -1.469131, 0.9803922, 1, 0, 1,
-0.9563455, -0.3678273, -1.587609, 0.972549, 1, 0, 1,
-0.9558783, 0.4653337, -2.983432, 0.9686275, 1, 0, 1,
-0.9481025, 1.281837, -1.329092, 0.9607843, 1, 0, 1,
-0.9382825, 0.7973524, 0.4989691, 0.9568627, 1, 0, 1,
-0.937858, 0.2293177, -2.213883, 0.9490196, 1, 0, 1,
-0.9240825, 0.9398259, 1.417176, 0.945098, 1, 0, 1,
-0.9221331, 0.9674764, -1.295394, 0.9372549, 1, 0, 1,
-0.9169813, 0.2149481, -2.645629, 0.9333333, 1, 0, 1,
-0.916276, -1.729717, -3.863693, 0.9254902, 1, 0, 1,
-0.9161659, 0.176245, -2.867233, 0.9215686, 1, 0, 1,
-0.9148498, 0.716284, -0.7913553, 0.9137255, 1, 0, 1,
-0.9131709, -0.3349884, -1.296851, 0.9098039, 1, 0, 1,
-0.9112544, -0.3394713, -2.716279, 0.9019608, 1, 0, 1,
-0.9072878, -0.6361871, -3.784648, 0.8941177, 1, 0, 1,
-0.9029781, 1.24878, -2.333486, 0.8901961, 1, 0, 1,
-0.882411, -0.172517, -1.994438, 0.8823529, 1, 0, 1,
-0.8782333, 0.1956996, -1.873579, 0.8784314, 1, 0, 1,
-0.8737804, 2.521521, -1.383869, 0.8705882, 1, 0, 1,
-0.8707849, 1.663619, -0.02677317, 0.8666667, 1, 0, 1,
-0.8682687, -1.051549, -1.912356, 0.8588235, 1, 0, 1,
-0.8677314, -0.5992147, -2.578206, 0.854902, 1, 0, 1,
-0.8656369, -0.3613434, -2.629948, 0.8470588, 1, 0, 1,
-0.8644283, 0.6688704, -0.1759724, 0.8431373, 1, 0, 1,
-0.8614406, -0.4740639, -0.5824407, 0.8352941, 1, 0, 1,
-0.8582776, -0.1841482, -1.094567, 0.8313726, 1, 0, 1,
-0.8581878, -0.2870149, -3.692939, 0.8235294, 1, 0, 1,
-0.8547073, -0.6262892, -2.046845, 0.8196079, 1, 0, 1,
-0.850418, -1.631404, -3.495569, 0.8117647, 1, 0, 1,
-0.8456079, 1.671158, -1.221467, 0.8078431, 1, 0, 1,
-0.8368114, 1.848521, -0.2173281, 0.8, 1, 0, 1,
-0.836761, 0.661139, -0.2948989, 0.7921569, 1, 0, 1,
-0.8334899, -0.717419, -2.18567, 0.7882353, 1, 0, 1,
-0.8332548, -1.421074, -2.517286, 0.7803922, 1, 0, 1,
-0.8295494, -1.15125, -3.131721, 0.7764706, 1, 0, 1,
-0.8268591, 1.104911, 0.4632867, 0.7686275, 1, 0, 1,
-0.8267208, -0.3811363, -3.425625, 0.7647059, 1, 0, 1,
-0.8211771, -0.2359942, -2.758249, 0.7568628, 1, 0, 1,
-0.8173869, -0.1967548, -3.239877, 0.7529412, 1, 0, 1,
-0.8162962, -1.094377, -2.358179, 0.7450981, 1, 0, 1,
-0.8055789, -1.813657, -2.885265, 0.7411765, 1, 0, 1,
-0.7987395, -1.907806, -3.407734, 0.7333333, 1, 0, 1,
-0.7986379, 0.315143, -0.3531494, 0.7294118, 1, 0, 1,
-0.7983114, 0.3773954, -1.410501, 0.7215686, 1, 0, 1,
-0.7973483, -1.350515, -2.596835, 0.7176471, 1, 0, 1,
-0.7928158, 0.01310618, -2.848989, 0.7098039, 1, 0, 1,
-0.7847419, -1.101315, -2.963599, 0.7058824, 1, 0, 1,
-0.7821742, 0.05933442, -0.9628617, 0.6980392, 1, 0, 1,
-0.7751878, -0.09182315, -1.694224, 0.6901961, 1, 0, 1,
-0.7741273, -0.5823496, -3.242913, 0.6862745, 1, 0, 1,
-0.7704712, -1.019514, -2.293296, 0.6784314, 1, 0, 1,
-0.7687783, -2.021964, -1.573464, 0.6745098, 1, 0, 1,
-0.7656656, -2.907776, -1.30307, 0.6666667, 1, 0, 1,
-0.7655149, -0.04188844, -2.623348, 0.6627451, 1, 0, 1,
-0.7618924, 0.4035165, -1.10024, 0.654902, 1, 0, 1,
-0.7609267, 0.7256687, -2.499768, 0.6509804, 1, 0, 1,
-0.7561223, 0.06273492, -2.865671, 0.6431373, 1, 0, 1,
-0.7518271, -0.05780076, -2.806658, 0.6392157, 1, 0, 1,
-0.7479973, 1.388357, -0.8733085, 0.6313726, 1, 0, 1,
-0.7474018, -1.245724, -2.664685, 0.627451, 1, 0, 1,
-0.7458405, -0.9270065, -1.844808, 0.6196079, 1, 0, 1,
-0.7435991, 1.860674, -0.8306339, 0.6156863, 1, 0, 1,
-0.7419707, -1.162416, -2.734308, 0.6078432, 1, 0, 1,
-0.7342438, -1.068034, -4.484124, 0.6039216, 1, 0, 1,
-0.7332032, -0.7796042, -4.404684, 0.5960785, 1, 0, 1,
-0.7316909, -0.6346456, -2.367695, 0.5882353, 1, 0, 1,
-0.7313797, 0.755245, 0.2453051, 0.5843138, 1, 0, 1,
-0.7311384, 0.4126634, -1.886907, 0.5764706, 1, 0, 1,
-0.7221711, 0.4717859, -2.651233, 0.572549, 1, 0, 1,
-0.7202906, -1.902725, -4.090606, 0.5647059, 1, 0, 1,
-0.7198163, -1.354056, -0.07370395, 0.5607843, 1, 0, 1,
-0.7097391, 1.520232, 0.008906946, 0.5529412, 1, 0, 1,
-0.7078648, 0.6122763, -0.2562585, 0.5490196, 1, 0, 1,
-0.7058853, 0.7865222, -0.1432983, 0.5411765, 1, 0, 1,
-0.7017338, 0.7930757, 1.684091, 0.5372549, 1, 0, 1,
-0.6910807, 0.2346346, -1.161744, 0.5294118, 1, 0, 1,
-0.6868006, -0.3173429, -0.9411125, 0.5254902, 1, 0, 1,
-0.6839298, -0.4599466, -2.251855, 0.5176471, 1, 0, 1,
-0.6831211, 0.1785668, -2.095613, 0.5137255, 1, 0, 1,
-0.6828737, -1.135568, -0.8348991, 0.5058824, 1, 0, 1,
-0.6790286, 0.3529055, -0.8821127, 0.5019608, 1, 0, 1,
-0.6771106, -0.590637, -2.998863, 0.4941176, 1, 0, 1,
-0.6711478, -2.484528, -3.74238, 0.4862745, 1, 0, 1,
-0.6683354, 0.4405057, -0.8914775, 0.4823529, 1, 0, 1,
-0.6654963, 0.1223694, -1.200919, 0.4745098, 1, 0, 1,
-0.6626766, 0.5606285, -0.615795, 0.4705882, 1, 0, 1,
-0.6591802, 1.401335, -0.9222088, 0.4627451, 1, 0, 1,
-0.6528311, -0.08187758, -2.352056, 0.4588235, 1, 0, 1,
-0.6471032, -1.101209, -1.216545, 0.4509804, 1, 0, 1,
-0.6466065, 0.709124, 1.631363, 0.4470588, 1, 0, 1,
-0.6461786, -1.511397, -2.089218, 0.4392157, 1, 0, 1,
-0.6449938, -0.3271017, -0.1616508, 0.4352941, 1, 0, 1,
-0.6429901, -0.5534315, -4.181198, 0.427451, 1, 0, 1,
-0.6421626, -0.5796638, -1.883149, 0.4235294, 1, 0, 1,
-0.63894, -0.2378366, -1.563274, 0.4156863, 1, 0, 1,
-0.6328013, 0.8089658, -0.3838789, 0.4117647, 1, 0, 1,
-0.6318996, 2.330598, 0.1120551, 0.4039216, 1, 0, 1,
-0.6308407, 1.396584, -0.2099134, 0.3960784, 1, 0, 1,
-0.6270088, -1.052159, -3.111708, 0.3921569, 1, 0, 1,
-0.6265065, -0.3441402, -3.576178, 0.3843137, 1, 0, 1,
-0.619836, 0.2777385, 0.1596462, 0.3803922, 1, 0, 1,
-0.6193436, 3.089877, 1.047575, 0.372549, 1, 0, 1,
-0.6156995, -0.6823025, -2.526375, 0.3686275, 1, 0, 1,
-0.6086963, -0.9379095, -3.170913, 0.3607843, 1, 0, 1,
-0.6072763, 0.85897, -0.2650542, 0.3568628, 1, 0, 1,
-0.6061044, -1.243822, -2.865802, 0.3490196, 1, 0, 1,
-0.6036136, 0.5425957, -1.009469, 0.345098, 1, 0, 1,
-0.6021623, -0.3504151, -3.794685, 0.3372549, 1, 0, 1,
-0.5962634, 0.4590345, -2.717553, 0.3333333, 1, 0, 1,
-0.5958466, -0.203771, -2.821854, 0.3254902, 1, 0, 1,
-0.5947124, 0.2181105, -1.658315, 0.3215686, 1, 0, 1,
-0.5901837, -0.04010833, -1.64954, 0.3137255, 1, 0, 1,
-0.5893699, -0.4735089, -3.065883, 0.3098039, 1, 0, 1,
-0.5849972, 0.6555211, 0.5053678, 0.3019608, 1, 0, 1,
-0.5742672, 0.3841749, 0.5006462, 0.2941177, 1, 0, 1,
-0.5737539, 0.8754274, -3.135162, 0.2901961, 1, 0, 1,
-0.572778, 1.451791, 0.2785169, 0.282353, 1, 0, 1,
-0.5709355, 0.3428478, -1.781899, 0.2784314, 1, 0, 1,
-0.5595932, 0.8955157, 0.07552816, 0.2705882, 1, 0, 1,
-0.5584157, 0.3346409, -1.180977, 0.2666667, 1, 0, 1,
-0.5565957, 0.9685057, -0.7216122, 0.2588235, 1, 0, 1,
-0.5546456, 0.6264492, -1.481206, 0.254902, 1, 0, 1,
-0.5546062, 0.7008572, 0.55164, 0.2470588, 1, 0, 1,
-0.5530441, -0.2359377, -1.787725, 0.2431373, 1, 0, 1,
-0.5519667, -0.8851866, -2.446817, 0.2352941, 1, 0, 1,
-0.5448067, -1.327163, -3.800051, 0.2313726, 1, 0, 1,
-0.5432175, -0.6079738, -2.091958, 0.2235294, 1, 0, 1,
-0.5414904, -0.6778781, -2.708762, 0.2196078, 1, 0, 1,
-0.5389887, 2.087851, 0.966148, 0.2117647, 1, 0, 1,
-0.5385032, -0.5557819, -1.961486, 0.2078431, 1, 0, 1,
-0.5324212, -1.144022, -3.615229, 0.2, 1, 0, 1,
-0.5323616, 0.8863757, -0.2248192, 0.1921569, 1, 0, 1,
-0.5302986, -0.8367144, -2.859793, 0.1882353, 1, 0, 1,
-0.5296097, 0.4101867, 1.142081, 0.1803922, 1, 0, 1,
-0.5295274, 2.977348, 0.3139847, 0.1764706, 1, 0, 1,
-0.5282878, -0.8246354, -3.447729, 0.1686275, 1, 0, 1,
-0.5277195, -0.6545026, -0.2737192, 0.1647059, 1, 0, 1,
-0.5273107, 0.03214523, -0.3003293, 0.1568628, 1, 0, 1,
-0.5232812, -0.6571934, -1.286213, 0.1529412, 1, 0, 1,
-0.5215665, 2.122718, 1.429798, 0.145098, 1, 0, 1,
-0.5205648, -0.5046527, -1.629347, 0.1411765, 1, 0, 1,
-0.5153469, 2.524345, -0.4081423, 0.1333333, 1, 0, 1,
-0.5128939, 0.8492382, -0.4543624, 0.1294118, 1, 0, 1,
-0.5127532, 0.6166522, -0.305268, 0.1215686, 1, 0, 1,
-0.5122806, -0.2457263, -0.5478774, 0.1176471, 1, 0, 1,
-0.510343, -1.224895, -3.472515, 0.1098039, 1, 0, 1,
-0.5087389, 1.220456, -0.8462515, 0.1058824, 1, 0, 1,
-0.5066988, -0.4512312, -2.711096, 0.09803922, 1, 0, 1,
-0.5040617, 0.9688628, -0.1365564, 0.09019608, 1, 0, 1,
-0.4994302, -1.671855, -3.34949, 0.08627451, 1, 0, 1,
-0.4976636, -0.5213707, -1.658985, 0.07843138, 1, 0, 1,
-0.4932477, -0.3532087, -3.646935, 0.07450981, 1, 0, 1,
-0.490784, 0.2957489, -1.289618, 0.06666667, 1, 0, 1,
-0.4845232, 0.9173445, -0.1885468, 0.0627451, 1, 0, 1,
-0.482883, -0.02103373, -2.668968, 0.05490196, 1, 0, 1,
-0.482207, -0.6610283, -3.013348, 0.05098039, 1, 0, 1,
-0.4818284, -1.049177, -3.932309, 0.04313726, 1, 0, 1,
-0.4817413, -1.365791, -3.348015, 0.03921569, 1, 0, 1,
-0.4776048, 0.4365237, -0.5473565, 0.03137255, 1, 0, 1,
-0.4754609, 1.087326, -1.745739, 0.02745098, 1, 0, 1,
-0.4739038, -0.9565721, -4.74283, 0.01960784, 1, 0, 1,
-0.4737707, -0.6072962, -3.318646, 0.01568628, 1, 0, 1,
-0.4693064, -0.03665687, -0.9620131, 0.007843138, 1, 0, 1,
-0.4639552, 0.7681831, -0.9835557, 0.003921569, 1, 0, 1,
-0.4629967, -0.9501418, -3.723284, 0, 1, 0.003921569, 1,
-0.4629397, 0.9425377, 0.4402052, 0, 1, 0.01176471, 1,
-0.4600959, -0.1499223, -4.204102, 0, 1, 0.01568628, 1,
-0.4502803, 1.03089, -0.6799715, 0, 1, 0.02352941, 1,
-0.4493164, 0.9288729, 0.3911267, 0, 1, 0.02745098, 1,
-0.445409, -1.793581, -4.283955, 0, 1, 0.03529412, 1,
-0.443792, -1.587206, -1.691714, 0, 1, 0.03921569, 1,
-0.4412577, -0.3119026, -1.879027, 0, 1, 0.04705882, 1,
-0.4384723, -1.120917, -4.088973, 0, 1, 0.05098039, 1,
-0.4347979, -0.853985, -2.518297, 0, 1, 0.05882353, 1,
-0.4324506, 1.440712, 0.3837509, 0, 1, 0.0627451, 1,
-0.4301386, 0.149772, -2.668798, 0, 1, 0.07058824, 1,
-0.4280244, 1.26758, 0.3515707, 0, 1, 0.07450981, 1,
-0.4265409, -0.3159542, -0.8849568, 0, 1, 0.08235294, 1,
-0.4228065, 0.6335941, -1.005797, 0, 1, 0.08627451, 1,
-0.4156998, 0.3280247, 1.115348, 0, 1, 0.09411765, 1,
-0.4094643, 0.5507852, -0.2279618, 0, 1, 0.1019608, 1,
-0.403012, 1.14494, -1.488605, 0, 1, 0.1058824, 1,
-0.401699, 0.3623925, -1.185278, 0, 1, 0.1137255, 1,
-0.4016929, 0.1387256, -0.4182317, 0, 1, 0.1176471, 1,
-0.4016135, 0.5274905, -0.7551066, 0, 1, 0.1254902, 1,
-0.4009931, 0.2431754, -0.7385492, 0, 1, 0.1294118, 1,
-0.3916815, 0.2801203, -1.22303, 0, 1, 0.1372549, 1,
-0.3897513, 0.6057358, 0.1183793, 0, 1, 0.1411765, 1,
-0.3867275, -0.7183958, -4.618368, 0, 1, 0.1490196, 1,
-0.3846583, -2.017494, -3.39782, 0, 1, 0.1529412, 1,
-0.378244, -0.786671, -0.8418361, 0, 1, 0.1607843, 1,
-0.375954, -0.7276967, -2.391453, 0, 1, 0.1647059, 1,
-0.3722841, 1.314772, -0.2996538, 0, 1, 0.172549, 1,
-0.3715246, 1.736415, 0.4016684, 0, 1, 0.1764706, 1,
-0.3662044, -1.936749, -3.509296, 0, 1, 0.1843137, 1,
-0.3639861, -1.643897, -3.056185, 0, 1, 0.1882353, 1,
-0.3634661, 0.9873794, 0.07905377, 0, 1, 0.1960784, 1,
-0.3607056, 0.2221628, -2.385942, 0, 1, 0.2039216, 1,
-0.3575659, -0.01631526, 0.3173222, 0, 1, 0.2078431, 1,
-0.3570537, -0.009668551, -2.463852, 0, 1, 0.2156863, 1,
-0.3535201, -1.418316, -3.389292, 0, 1, 0.2196078, 1,
-0.3522234, 2.169284, -1.291216, 0, 1, 0.227451, 1,
-0.3513768, -1.057257, -2.8886, 0, 1, 0.2313726, 1,
-0.3505888, -1.582816, -3.798624, 0, 1, 0.2392157, 1,
-0.3471777, 0.4539289, -1.521861, 0, 1, 0.2431373, 1,
-0.3379967, -1.134948, -2.87326, 0, 1, 0.2509804, 1,
-0.3378259, -0.5809935, -1.574173, 0, 1, 0.254902, 1,
-0.3335005, -0.07351708, -2.847212, 0, 1, 0.2627451, 1,
-0.3243516, 0.1223901, -1.175164, 0, 1, 0.2666667, 1,
-0.3209695, -0.2230112, -2.317861, 0, 1, 0.2745098, 1,
-0.3167418, 0.9105129, -0.3232316, 0, 1, 0.2784314, 1,
-0.3156771, -0.2861761, -0.3970592, 0, 1, 0.2862745, 1,
-0.3153192, 2.642269, 1.323465, 0, 1, 0.2901961, 1,
-0.3143215, 0.1006093, -1.659235, 0, 1, 0.2980392, 1,
-0.3130352, -0.3893338, -2.888226, 0, 1, 0.3058824, 1,
-0.303872, -1.430362, -3.207396, 0, 1, 0.3098039, 1,
-0.2982107, -0.2374435, -2.534023, 0, 1, 0.3176471, 1,
-0.2968389, -0.8315926, -4.587525, 0, 1, 0.3215686, 1,
-0.2913179, 0.6997618, -1.340534, 0, 1, 0.3294118, 1,
-0.2781247, 2.876204, -0.216424, 0, 1, 0.3333333, 1,
-0.2753359, 0.4852057, -1.369674, 0, 1, 0.3411765, 1,
-0.2693657, -1.617471, -2.27309, 0, 1, 0.345098, 1,
-0.2687776, 0.3728414, -0.1730797, 0, 1, 0.3529412, 1,
-0.2590312, 0.1746231, -0.831221, 0, 1, 0.3568628, 1,
-0.2539643, 1.39324, -1.624999, 0, 1, 0.3647059, 1,
-0.2520762, -0.1187593, -2.485496, 0, 1, 0.3686275, 1,
-0.2494906, 1.837982, -0.6988853, 0, 1, 0.3764706, 1,
-0.2466872, 0.4732644, -1.128293, 0, 1, 0.3803922, 1,
-0.2437536, 0.2347633, -1.513201, 0, 1, 0.3882353, 1,
-0.2407483, -0.8877335, -2.850065, 0, 1, 0.3921569, 1,
-0.2224744, 0.1996762, -0.6447524, 0, 1, 0.4, 1,
-0.2168902, -1.078325, -3.278215, 0, 1, 0.4078431, 1,
-0.2147101, 1.363186, -0.5985147, 0, 1, 0.4117647, 1,
-0.2081504, 0.3035122, -0.2123084, 0, 1, 0.4196078, 1,
-0.2071844, 0.3158478, -0.8803337, 0, 1, 0.4235294, 1,
-0.2071174, 1.034946, -0.5557626, 0, 1, 0.4313726, 1,
-0.2052282, -0.06963244, -1.114605, 0, 1, 0.4352941, 1,
-0.2023423, -0.1263771, -2.447876, 0, 1, 0.4431373, 1,
-0.1967112, 0.5892625, 1.775028, 0, 1, 0.4470588, 1,
-0.1941786, 0.5758926, -1.119333, 0, 1, 0.454902, 1,
-0.1933085, 0.7016883, 1.061645, 0, 1, 0.4588235, 1,
-0.1882378, 0.7924204, 0.8508682, 0, 1, 0.4666667, 1,
-0.1881871, 1.298134, 0.5748319, 0, 1, 0.4705882, 1,
-0.1845678, 0.5619759, -0.9420245, 0, 1, 0.4784314, 1,
-0.183898, -0.5077311, -1.679825, 0, 1, 0.4823529, 1,
-0.1819602, -0.7962412, -3.88481, 0, 1, 0.4901961, 1,
-0.1816262, 1.597056, -0.2730295, 0, 1, 0.4941176, 1,
-0.1800228, -0.9660352, -1.45282, 0, 1, 0.5019608, 1,
-0.1772534, 1.83794, 0.01603345, 0, 1, 0.509804, 1,
-0.1741638, -0.389933, -2.80887, 0, 1, 0.5137255, 1,
-0.172476, -0.9635431, -3.327143, 0, 1, 0.5215687, 1,
-0.170005, 0.3713335, -0.5140884, 0, 1, 0.5254902, 1,
-0.1693202, -1.603424, -3.972864, 0, 1, 0.5333334, 1,
-0.1667514, -0.5435915, -3.245739, 0, 1, 0.5372549, 1,
-0.1656663, 1.686642, 0.8089621, 0, 1, 0.5450981, 1,
-0.162569, 1.202566, -0.42596, 0, 1, 0.5490196, 1,
-0.1583075, -0.1224359, -3.766759, 0, 1, 0.5568628, 1,
-0.1571926, 0.2324195, 1.643391, 0, 1, 0.5607843, 1,
-0.1570637, -1.508491, -0.8829421, 0, 1, 0.5686275, 1,
-0.1535206, 0.9794751, 2.384465, 0, 1, 0.572549, 1,
-0.1534896, 0.003701611, -1.649154, 0, 1, 0.5803922, 1,
-0.1517406, 1.560068, 0.2515927, 0, 1, 0.5843138, 1,
-0.1503043, -0.9224522, -3.270031, 0, 1, 0.5921569, 1,
-0.144667, -0.5715919, -3.883034, 0, 1, 0.5960785, 1,
-0.1446095, -1.373645, -3.499719, 0, 1, 0.6039216, 1,
-0.1391601, -0.7498363, -2.984744, 0, 1, 0.6117647, 1,
-0.1349922, -0.3605285, -3.755311, 0, 1, 0.6156863, 1,
-0.1348944, -0.2057849, -1.494372, 0, 1, 0.6235294, 1,
-0.1329011, 1.07669, 0.06016617, 0, 1, 0.627451, 1,
-0.1297281, -1.057633, -3.5275, 0, 1, 0.6352941, 1,
-0.1287116, 0.7754865, -0.2527068, 0, 1, 0.6392157, 1,
-0.1283422, 0.07479355, -0.1490602, 0, 1, 0.6470588, 1,
-0.1269205, -0.1005032, -1.9975, 0, 1, 0.6509804, 1,
-0.1223133, -0.009662121, -0.9711512, 0, 1, 0.6588235, 1,
-0.1207233, 0.7122043, -0.1629511, 0, 1, 0.6627451, 1,
-0.1166755, -0.2207812, -4.661835, 0, 1, 0.6705883, 1,
-0.1129489, -0.6868464, -1.396448, 0, 1, 0.6745098, 1,
-0.1011695, -1.827915, -3.37286, 0, 1, 0.682353, 1,
-0.09976888, 0.5832059, 2.383454, 0, 1, 0.6862745, 1,
-0.09002178, -0.2919494, -2.136129, 0, 1, 0.6941177, 1,
-0.08894122, -1.706298, -2.634917, 0, 1, 0.7019608, 1,
-0.07723048, 1.561994, 0.4518688, 0, 1, 0.7058824, 1,
-0.07706967, 1.148885, -0.6072859, 0, 1, 0.7137255, 1,
-0.07658336, -0.07149021, -1.574474, 0, 1, 0.7176471, 1,
-0.07522836, -1.273032, -2.590295, 0, 1, 0.7254902, 1,
-0.07426942, 1.075892, -2.246661, 0, 1, 0.7294118, 1,
-0.07366131, 1.318519, -1.029748, 0, 1, 0.7372549, 1,
-0.07331648, 0.6685118, -0.5089687, 0, 1, 0.7411765, 1,
-0.07263742, 0.7239313, 1.556886, 0, 1, 0.7490196, 1,
-0.07161048, -0.4733385, -3.174984, 0, 1, 0.7529412, 1,
-0.07061265, -0.3455373, -3.288144, 0, 1, 0.7607843, 1,
-0.07000578, 0.6554108, -1.939115, 0, 1, 0.7647059, 1,
-0.06990212, -0.4126033, -2.914981, 0, 1, 0.772549, 1,
-0.06782094, 0.9592767, -0.6557169, 0, 1, 0.7764706, 1,
-0.06314872, -1.193763, -2.881304, 0, 1, 0.7843137, 1,
-0.06300682, 1.454838, -0.2380146, 0, 1, 0.7882353, 1,
-0.06270014, -0.05788081, -3.765382, 0, 1, 0.7960784, 1,
-0.0621147, 1.267607, -1.675254, 0, 1, 0.8039216, 1,
-0.06209154, 0.7863679, -1.256677, 0, 1, 0.8078431, 1,
-0.06074806, -0.791221, -2.448404, 0, 1, 0.8156863, 1,
-0.05876383, 0.86759, 0.06587915, 0, 1, 0.8196079, 1,
-0.05557842, -0.7156152, -4.050671, 0, 1, 0.827451, 1,
-0.05546131, 1.152601, 0.9135948, 0, 1, 0.8313726, 1,
-0.05266733, 1.036472, 0.8340625, 0, 1, 0.8392157, 1,
-0.05078897, -0.5426288, -2.841202, 0, 1, 0.8431373, 1,
-0.05070384, 0.07194951, -0.9219128, 0, 1, 0.8509804, 1,
-0.04786834, -0.02390308, -2.7259, 0, 1, 0.854902, 1,
-0.04659778, -0.1714213, -5.186941, 0, 1, 0.8627451, 1,
-0.04560138, 0.5689967, -0.07870136, 0, 1, 0.8666667, 1,
-0.04501652, -0.4044068, -3.431986, 0, 1, 0.8745098, 1,
-0.04211885, -0.601011, -3.311084, 0, 1, 0.8784314, 1,
-0.04149036, -0.54545, -3.863369, 0, 1, 0.8862745, 1,
-0.04100081, -0.01508905, -3.556089, 0, 1, 0.8901961, 1,
-0.03993424, -0.1871767, -3.69571, 0, 1, 0.8980392, 1,
-0.03949261, -2.523157, 0.5491257, 0, 1, 0.9058824, 1,
-0.03691687, 0.9696974, -0.7824048, 0, 1, 0.9098039, 1,
-0.03593647, 0.05002109, -0.5475805, 0, 1, 0.9176471, 1,
-0.03315607, 0.5141805, 0.382245, 0, 1, 0.9215686, 1,
-0.03264259, -0.1125261, -3.896893, 0, 1, 0.9294118, 1,
-0.03024813, 0.4577568, 1.778144, 0, 1, 0.9333333, 1,
-0.02745612, 1.895316, 1.008869, 0, 1, 0.9411765, 1,
-0.02661834, -0.7506004, -2.713355, 0, 1, 0.945098, 1,
-0.02595087, 1.115294, 1.571268, 0, 1, 0.9529412, 1,
-0.02563274, 0.8508747, -1.488245, 0, 1, 0.9568627, 1,
-0.02555858, -0.09470573, -1.76528, 0, 1, 0.9647059, 1,
-0.02053461, -0.4171584, -3.811638, 0, 1, 0.9686275, 1,
-0.01412006, 0.7785072, -0.7428931, 0, 1, 0.9764706, 1,
-0.01275645, 2.337034e-05, -1.280895, 0, 1, 0.9803922, 1,
-0.01110439, -1.166284, -2.52628, 0, 1, 0.9882353, 1,
-0.0109989, 0.05465952, 1.853182, 0, 1, 0.9921569, 1,
-0.007297602, 0.1863343, -0.3365892, 0, 1, 1, 1,
-0.006883047, 2.048695, 0.7086564, 0, 0.9921569, 1, 1,
-0.006869858, 0.03918295, -0.6567836, 0, 0.9882353, 1, 1,
-0.005664703, 2.347434, -0.1421415, 0, 0.9803922, 1, 1,
-0.001806474, 0.5350832, 0.6233116, 0, 0.9764706, 1, 1,
-0.001353649, 0.3818272, 0.1717806, 0, 0.9686275, 1, 1,
-0.0009699463, -1.052387, -2.696615, 0, 0.9647059, 1, 1,
0.004728042, -0.7303602, 3.30514, 0, 0.9568627, 1, 1,
0.00657698, 1.491074, 1.391882, 0, 0.9529412, 1, 1,
0.007619397, -0.1725888, 1.638315, 0, 0.945098, 1, 1,
0.008256873, -0.3884498, 2.827694, 0, 0.9411765, 1, 1,
0.008727394, -0.5263298, 0.8176104, 0, 0.9333333, 1, 1,
0.008759755, -1.509207, 2.779131, 0, 0.9294118, 1, 1,
0.00946942, -1.722203, 4.517028, 0, 0.9215686, 1, 1,
0.01132427, 0.05930183, -0.07541846, 0, 0.9176471, 1, 1,
0.01161086, 0.2679814, 0.6955747, 0, 0.9098039, 1, 1,
0.01383691, -2.801552, 1.81352, 0, 0.9058824, 1, 1,
0.01425367, -0.8737185, 2.786931, 0, 0.8980392, 1, 1,
0.01453076, 0.3325943, 0.509703, 0, 0.8901961, 1, 1,
0.0203902, -0.2593688, 3.16571, 0, 0.8862745, 1, 1,
0.02251511, 1.868635, 0.625565, 0, 0.8784314, 1, 1,
0.02251788, -0.7773598, 4.205828, 0, 0.8745098, 1, 1,
0.02886397, -1.615671, 3.885699, 0, 0.8666667, 1, 1,
0.02927454, -1.089486, 2.816534, 0, 0.8627451, 1, 1,
0.0306729, -2.835436, 5.509712, 0, 0.854902, 1, 1,
0.03501395, -0.5428979, 4.05879, 0, 0.8509804, 1, 1,
0.0354874, 0.8447553, -0.5852195, 0, 0.8431373, 1, 1,
0.03577514, 0.2870711, 0.08743136, 0, 0.8392157, 1, 1,
0.03595782, -0.5398872, 1.651358, 0, 0.8313726, 1, 1,
0.04272897, 1.054025, -0.8518716, 0, 0.827451, 1, 1,
0.04497087, -0.7748768, 3.218894, 0, 0.8196079, 1, 1,
0.04698774, 0.9091215, -0.6540828, 0, 0.8156863, 1, 1,
0.04782527, -0.3735606, 3.243747, 0, 0.8078431, 1, 1,
0.04926956, 0.6141361, -0.4276666, 0, 0.8039216, 1, 1,
0.06060074, 1.127192, -1.169469, 0, 0.7960784, 1, 1,
0.06128984, -0.597964, 4.694956, 0, 0.7882353, 1, 1,
0.06355189, -0.5864786, 2.467752, 0, 0.7843137, 1, 1,
0.06690819, -0.09663458, 1.833769, 0, 0.7764706, 1, 1,
0.07735591, -0.6630116, 5.237535, 0, 0.772549, 1, 1,
0.0796124, -1.149476, 2.869136, 0, 0.7647059, 1, 1,
0.08118583, 0.402871, 1.486594, 0, 0.7607843, 1, 1,
0.0858585, 0.3272772, 1.722668, 0, 0.7529412, 1, 1,
0.08603986, -0.8627617, 3.036213, 0, 0.7490196, 1, 1,
0.08658808, -2.258554, 2.937057, 0, 0.7411765, 1, 1,
0.09532889, -1.213197, 4.767211, 0, 0.7372549, 1, 1,
0.09729454, -0.3979314, 2.637166, 0, 0.7294118, 1, 1,
0.1029748, 1.427461, 2.940738, 0, 0.7254902, 1, 1,
0.1036826, -1.156324, 4.562809, 0, 0.7176471, 1, 1,
0.1044437, -0.2687336, 2.962906, 0, 0.7137255, 1, 1,
0.108644, -0.7576066, 0.9971463, 0, 0.7058824, 1, 1,
0.1097811, -0.702741, 2.443855, 0, 0.6980392, 1, 1,
0.1121987, -0.6528332, 4.441811, 0, 0.6941177, 1, 1,
0.1122778, 0.8931941, -1.114496, 0, 0.6862745, 1, 1,
0.1169847, -1.227752, 4.222327, 0, 0.682353, 1, 1,
0.1182038, 0.2029562, -0.5721676, 0, 0.6745098, 1, 1,
0.1182505, 1.008052, 1.124488, 0, 0.6705883, 1, 1,
0.1189063, 0.785365, 0.05817602, 0, 0.6627451, 1, 1,
0.1209402, -0.3418898, 1.057508, 0, 0.6588235, 1, 1,
0.1216488, -0.3629363, 2.537781, 0, 0.6509804, 1, 1,
0.121847, 2.618311, 0.900818, 0, 0.6470588, 1, 1,
0.1219054, -0.1553643, 1.837312, 0, 0.6392157, 1, 1,
0.1230794, -1.128551, 4.961189, 0, 0.6352941, 1, 1,
0.124821, -0.3485014, 3.713949, 0, 0.627451, 1, 1,
0.1251946, 0.8663054, 0.546753, 0, 0.6235294, 1, 1,
0.1265858, 0.4976338, -1.691208, 0, 0.6156863, 1, 1,
0.1266994, -1.008543, 3.17203, 0, 0.6117647, 1, 1,
0.1288566, 0.1033269, 1.490311, 0, 0.6039216, 1, 1,
0.1334113, -1.447692, 3.284643, 0, 0.5960785, 1, 1,
0.1343519, 1.717532, 0.1665224, 0, 0.5921569, 1, 1,
0.1372566, -1.327319, 2.621859, 0, 0.5843138, 1, 1,
0.1383661, -1.180327, 1.713162, 0, 0.5803922, 1, 1,
0.1427152, -1.949319, 3.431185, 0, 0.572549, 1, 1,
0.1436475, 1.656385, 0.488862, 0, 0.5686275, 1, 1,
0.1451997, -0.3398127, 1.684694, 0, 0.5607843, 1, 1,
0.1500514, -0.334372, 1.181874, 0, 0.5568628, 1, 1,
0.1513586, -0.8238168, 2.703517, 0, 0.5490196, 1, 1,
0.1513798, -1.157162, 3.623268, 0, 0.5450981, 1, 1,
0.1516658, 0.6616995, 1.936206, 0, 0.5372549, 1, 1,
0.1538512, -1.559118, 1.425009, 0, 0.5333334, 1, 1,
0.1541496, -0.01059537, 2.520444, 0, 0.5254902, 1, 1,
0.1588151, -0.5163761, 3.79061, 0, 0.5215687, 1, 1,
0.1624405, 0.9190291, 0.501062, 0, 0.5137255, 1, 1,
0.1633224, 0.1192348, 3.107614, 0, 0.509804, 1, 1,
0.1710729, 0.3474196, -1.533678, 0, 0.5019608, 1, 1,
0.171716, 0.3657109, 0.6611722, 0, 0.4941176, 1, 1,
0.1840852, 0.2823029, 0.670399, 0, 0.4901961, 1, 1,
0.1877251, -0.578974, 2.909917, 0, 0.4823529, 1, 1,
0.196076, -2.346186, 4.959647, 0, 0.4784314, 1, 1,
0.1976724, 0.9671456, -0.7729948, 0, 0.4705882, 1, 1,
0.1978475, 1.506003, 2.004617, 0, 0.4666667, 1, 1,
0.2014682, -1.094795, 2.052229, 0, 0.4588235, 1, 1,
0.2033687, 0.9486471, 0.7386421, 0, 0.454902, 1, 1,
0.204286, 0.3563065, 0.6516792, 0, 0.4470588, 1, 1,
0.2089324, -0.6718715, 4.211854, 0, 0.4431373, 1, 1,
0.2110017, -2.858618, 1.559651, 0, 0.4352941, 1, 1,
0.215247, 0.2781287, 0.2818712, 0, 0.4313726, 1, 1,
0.2159424, 0.9648519, 0.830359, 0, 0.4235294, 1, 1,
0.2193771, -1.009747, 0.4735041, 0, 0.4196078, 1, 1,
0.2209888, 1.58426, 0.8342461, 0, 0.4117647, 1, 1,
0.2218636, -0.8259889, 2.019328, 0, 0.4078431, 1, 1,
0.2223992, -0.6051848, 2.671013, 0, 0.4, 1, 1,
0.2225841, -0.05681825, 2.168733, 0, 0.3921569, 1, 1,
0.2256247, -0.4963624, 2.252088, 0, 0.3882353, 1, 1,
0.2290668, -0.02177332, 2.191769, 0, 0.3803922, 1, 1,
0.2300607, 0.3667205, 2.472692, 0, 0.3764706, 1, 1,
0.2326373, -1.00482, 1.465385, 0, 0.3686275, 1, 1,
0.2341846, -0.9031438, 3.330627, 0, 0.3647059, 1, 1,
0.2359287, -0.6982512, 3.443954, 0, 0.3568628, 1, 1,
0.2369984, -0.8360237, 3.018035, 0, 0.3529412, 1, 1,
0.2372917, 0.4055417, -0.6580948, 0, 0.345098, 1, 1,
0.2373636, -0.8179913, 2.80033, 0, 0.3411765, 1, 1,
0.2374342, -1.525457, 2.929002, 0, 0.3333333, 1, 1,
0.23963, 0.2656406, 1.521882, 0, 0.3294118, 1, 1,
0.2408146, 0.02449125, 1.006713, 0, 0.3215686, 1, 1,
0.2444473, -0.9537703, 2.244643, 0, 0.3176471, 1, 1,
0.2456492, 0.8425338, 0.6886023, 0, 0.3098039, 1, 1,
0.2472584, -0.8431001, 2.337214, 0, 0.3058824, 1, 1,
0.2474439, -0.9204018, 2.885921, 0, 0.2980392, 1, 1,
0.2505398, 1.079324, 0.6721036, 0, 0.2901961, 1, 1,
0.2514996, -0.8735396, 3.217867, 0, 0.2862745, 1, 1,
0.255115, -1.252072, 2.399993, 0, 0.2784314, 1, 1,
0.2582199, -0.8463196, 3.129889, 0, 0.2745098, 1, 1,
0.2589, 0.9767505, -0.7512802, 0, 0.2666667, 1, 1,
0.260314, -0.2192617, 2.109364, 0, 0.2627451, 1, 1,
0.2605181, 1.26202, 0.2405496, 0, 0.254902, 1, 1,
0.2633568, -0.8766788, 3.801611, 0, 0.2509804, 1, 1,
0.2672068, 1.228233, 0.7629354, 0, 0.2431373, 1, 1,
0.2717203, 1.733522, 0.1603726, 0, 0.2392157, 1, 1,
0.2734435, 0.6099057, 0.5905593, 0, 0.2313726, 1, 1,
0.2735319, 1.074082, 0.6337266, 0, 0.227451, 1, 1,
0.2756002, -0.4761546, 5.011446, 0, 0.2196078, 1, 1,
0.2790459, 1.340581, 1.075, 0, 0.2156863, 1, 1,
0.2812979, -0.9620689, 1.7955, 0, 0.2078431, 1, 1,
0.2830701, 0.62706, 0.7937291, 0, 0.2039216, 1, 1,
0.2837784, 0.3659062, 0.391747, 0, 0.1960784, 1, 1,
0.2884912, 1.299084, 0.2872678, 0, 0.1882353, 1, 1,
0.2971113, 1.573493, -0.5180784, 0, 0.1843137, 1, 1,
0.3009987, 0.4581403, -0.4556828, 0, 0.1764706, 1, 1,
0.3011235, -0.3342557, 2.176428, 0, 0.172549, 1, 1,
0.3034836, 1.73887, -0.3362214, 0, 0.1647059, 1, 1,
0.3076648, 1.443677, -0.176712, 0, 0.1607843, 1, 1,
0.3116623, 0.3824386, 1.192548, 0, 0.1529412, 1, 1,
0.313554, 0.9772294, 0.4872875, 0, 0.1490196, 1, 1,
0.3138904, -0.7169287, 2.166507, 0, 0.1411765, 1, 1,
0.3200674, -0.6574991, 1.439905, 0, 0.1372549, 1, 1,
0.3276563, 0.9146776, 1.357315, 0, 0.1294118, 1, 1,
0.3332018, -0.6802269, 4.529846, 0, 0.1254902, 1, 1,
0.3487677, 0.6605906, 0.8873317, 0, 0.1176471, 1, 1,
0.3516604, -1.681952, 2.800042, 0, 0.1137255, 1, 1,
0.3534713, 0.1955864, 0.1336292, 0, 0.1058824, 1, 1,
0.3552763, 0.4101242, 1.625491, 0, 0.09803922, 1, 1,
0.3602678, -0.5095198, 3.847184, 0, 0.09411765, 1, 1,
0.360617, -0.9707831, 2.620869, 0, 0.08627451, 1, 1,
0.3607834, 0.7507827, 0.7232748, 0, 0.08235294, 1, 1,
0.3630198, 1.331143, -1.15411, 0, 0.07450981, 1, 1,
0.3672929, 0.3454373, -0.5994642, 0, 0.07058824, 1, 1,
0.3721339, 0.9758638, -0.09179017, 0, 0.0627451, 1, 1,
0.3743263, -0.318313, 2.547079, 0, 0.05882353, 1, 1,
0.3766357, 0.7660863, 0.3626315, 0, 0.05098039, 1, 1,
0.3797475, -0.1591931, 1.449398, 0, 0.04705882, 1, 1,
0.3804547, 0.3213832, 2.047432, 0, 0.03921569, 1, 1,
0.3826447, 1.781413, 2.188043, 0, 0.03529412, 1, 1,
0.3921964, 1.427443, 0.3825149, 0, 0.02745098, 1, 1,
0.3941341, -0.7154515, 2.98432, 0, 0.02352941, 1, 1,
0.4109214, -2.424371, 1.815077, 0, 0.01568628, 1, 1,
0.4137876, -1.044057, 3.006155, 0, 0.01176471, 1, 1,
0.4213077, 0.4555338, 3.63469, 0, 0.003921569, 1, 1,
0.4258766, -0.3652334, 2.511815, 0.003921569, 0, 1, 1,
0.4259017, 0.5974571, -0.2347094, 0.007843138, 0, 1, 1,
0.4364114, -1.694674, 3.126985, 0.01568628, 0, 1, 1,
0.4366129, 0.845192, -1.09807, 0.01960784, 0, 1, 1,
0.4385208, 1.089054, 0.6443132, 0.02745098, 0, 1, 1,
0.4387557, -1.374844, 3.323345, 0.03137255, 0, 1, 1,
0.4405659, -0.009610965, 1.218307, 0.03921569, 0, 1, 1,
0.4418846, 2.210602, 0.8171939, 0.04313726, 0, 1, 1,
0.4419255, -0.6078129, 3.911334, 0.05098039, 0, 1, 1,
0.447275, -1.671171, 3.122213, 0.05490196, 0, 1, 1,
0.4498131, -0.5241112, 2.487418, 0.0627451, 0, 1, 1,
0.4584877, 0.08921842, 2.768169, 0.06666667, 0, 1, 1,
0.4588316, 0.06243604, 0.8673182, 0.07450981, 0, 1, 1,
0.4610821, -1.510204, 3.070246, 0.07843138, 0, 1, 1,
0.4614596, -0.02456282, 2.34719, 0.08627451, 0, 1, 1,
0.4632955, -1.148609, 1.89648, 0.09019608, 0, 1, 1,
0.4639233, -0.4707216, 2.908929, 0.09803922, 0, 1, 1,
0.4652397, 0.9580625, 0.02591799, 0.1058824, 0, 1, 1,
0.4670219, -0.2252529, 3.299673, 0.1098039, 0, 1, 1,
0.469409, -1.971553, 3.857488, 0.1176471, 0, 1, 1,
0.4703529, 1.482928, 1.011151, 0.1215686, 0, 1, 1,
0.4721185, 0.511108, 1.499699, 0.1294118, 0, 1, 1,
0.4753376, 1.02039, 1.749721, 0.1333333, 0, 1, 1,
0.4765958, 0.3097634, 1.143853, 0.1411765, 0, 1, 1,
0.481308, -1.229653, 3.883088, 0.145098, 0, 1, 1,
0.4827655, -0.125961, 1.586066, 0.1529412, 0, 1, 1,
0.4895948, -0.2334152, 2.364227, 0.1568628, 0, 1, 1,
0.4906859, 0.1992726, 1.602583, 0.1647059, 0, 1, 1,
0.4945982, -0.4347988, 2.574147, 0.1686275, 0, 1, 1,
0.4978632, -0.7908404, 2.173922, 0.1764706, 0, 1, 1,
0.5016735, 0.5431958, 1.643665, 0.1803922, 0, 1, 1,
0.5026109, -0.301076, 1.418641, 0.1882353, 0, 1, 1,
0.5071015, 1.428022, -0.1869711, 0.1921569, 0, 1, 1,
0.5092153, -0.1476299, 4.917645, 0.2, 0, 1, 1,
0.5093158, 0.3469448, 0.3162129, 0.2078431, 0, 1, 1,
0.5095522, -0.9429943, 1.648659, 0.2117647, 0, 1, 1,
0.5140316, 0.1405251, 2.188526, 0.2196078, 0, 1, 1,
0.5152926, -2.706939, 2.862729, 0.2235294, 0, 1, 1,
0.5170405, -1.95571, 2.120397, 0.2313726, 0, 1, 1,
0.523685, 0.5653804, 1.609334, 0.2352941, 0, 1, 1,
0.5266555, 0.1319019, 1.136713, 0.2431373, 0, 1, 1,
0.5301067, -0.1853339, 0.05239912, 0.2470588, 0, 1, 1,
0.5370747, -0.6223101, 2.647047, 0.254902, 0, 1, 1,
0.5375043, -0.104561, 2.674037, 0.2588235, 0, 1, 1,
0.543094, -1.512941, 2.008289, 0.2666667, 0, 1, 1,
0.5447699, -2.557613, 1.565024, 0.2705882, 0, 1, 1,
0.5476291, 0.974039, 1.292033, 0.2784314, 0, 1, 1,
0.5498505, -0.09452119, 3.192769, 0.282353, 0, 1, 1,
0.5568821, 0.1796956, 1.862008, 0.2901961, 0, 1, 1,
0.557102, -0.9807063, 2.702351, 0.2941177, 0, 1, 1,
0.5585767, 0.1946055, 1.415634, 0.3019608, 0, 1, 1,
0.5597906, -1.017676, 3.093861, 0.3098039, 0, 1, 1,
0.5653738, 0.02914949, 2.632491, 0.3137255, 0, 1, 1,
0.5659212, 0.2413263, 1.40475, 0.3215686, 0, 1, 1,
0.5678468, 3.610096, -1.667574, 0.3254902, 0, 1, 1,
0.5703852, 0.9167798, 0.1195421, 0.3333333, 0, 1, 1,
0.5767038, -0.4126945, 1.70973, 0.3372549, 0, 1, 1,
0.5782063, 1.011023, 0.2761826, 0.345098, 0, 1, 1,
0.5794584, -0.9350749, 2.172479, 0.3490196, 0, 1, 1,
0.5823071, 0.7102553, 1.928448, 0.3568628, 0, 1, 1,
0.5892239, -2.002424, 1.930753, 0.3607843, 0, 1, 1,
0.5910357, -1.594287, 5.306262, 0.3686275, 0, 1, 1,
0.6030099, 0.5693064, 0.5363353, 0.372549, 0, 1, 1,
0.6049497, 0.9766384, 0.3581968, 0.3803922, 0, 1, 1,
0.6100355, -0.9682228, 4.075783, 0.3843137, 0, 1, 1,
0.610292, -0.4774735, 1.263037, 0.3921569, 0, 1, 1,
0.6193411, -0.7427754, 1.566186, 0.3960784, 0, 1, 1,
0.6213396, 1.37471, 0.7744532, 0.4039216, 0, 1, 1,
0.6245476, -0.9746045, 2.044774, 0.4117647, 0, 1, 1,
0.6266599, -0.871286, 3.729123, 0.4156863, 0, 1, 1,
0.6273351, 0.3180465, 1.89817, 0.4235294, 0, 1, 1,
0.6315455, -0.7338035, 2.683855, 0.427451, 0, 1, 1,
0.6361524, -1.705003, 3.222073, 0.4352941, 0, 1, 1,
0.6400272, -2.400845, 2.99063, 0.4392157, 0, 1, 1,
0.6405068, 0.0302454, 2.446102, 0.4470588, 0, 1, 1,
0.6413069, -0.04229993, 1.524219, 0.4509804, 0, 1, 1,
0.6494392, -0.5005153, 1.002659, 0.4588235, 0, 1, 1,
0.6503553, -0.05009567, 2.954822, 0.4627451, 0, 1, 1,
0.6539274, -0.4222089, 4.411574, 0.4705882, 0, 1, 1,
0.6557429, -0.3663067, 0.6340801, 0.4745098, 0, 1, 1,
0.6606513, -0.6924062, 1.603161, 0.4823529, 0, 1, 1,
0.6624246, 0.767397, 0.9427695, 0.4862745, 0, 1, 1,
0.6650767, -0.9860023, 2.476768, 0.4941176, 0, 1, 1,
0.6667844, -1.158185, 2.713349, 0.5019608, 0, 1, 1,
0.6670988, -1.150939, 4.226149, 0.5058824, 0, 1, 1,
0.6676515, 0.1499016, 2.096758, 0.5137255, 0, 1, 1,
0.6724896, -0.92482, 3.235121, 0.5176471, 0, 1, 1,
0.6744555, -0.1722614, 1.145068, 0.5254902, 0, 1, 1,
0.6785121, -0.2140822, 3.108828, 0.5294118, 0, 1, 1,
0.6814106, 0.1175249, 0.7024716, 0.5372549, 0, 1, 1,
0.6867236, -0.8301767, 0.6933574, 0.5411765, 0, 1, 1,
0.6878911, -1.447131, 1.794657, 0.5490196, 0, 1, 1,
0.6878984, 0.6739234, 0.8241269, 0.5529412, 0, 1, 1,
0.6881859, -0.3751667, 1.724176, 0.5607843, 0, 1, 1,
0.6943166, 0.2176562, 1.330067, 0.5647059, 0, 1, 1,
0.695181, 1.978944, 0.9257047, 0.572549, 0, 1, 1,
0.6953544, 0.4504043, 1.075859, 0.5764706, 0, 1, 1,
0.6972705, -0.4607836, 2.175638, 0.5843138, 0, 1, 1,
0.7006782, 3.243917, 0.6112784, 0.5882353, 0, 1, 1,
0.7146441, 0.9014155, 0.2731008, 0.5960785, 0, 1, 1,
0.7170101, 0.1101146, -0.3039338, 0.6039216, 0, 1, 1,
0.7171648, -0.5962392, 0.9185826, 0.6078432, 0, 1, 1,
0.7216956, 1.381435, 0.8631549, 0.6156863, 0, 1, 1,
0.7223659, -0.9906663, 3.971524, 0.6196079, 0, 1, 1,
0.7252151, 1.057378, -0.167384, 0.627451, 0, 1, 1,
0.7264235, 1.20595, 0.5425633, 0.6313726, 0, 1, 1,
0.7284356, -0.1355008, 1.645582, 0.6392157, 0, 1, 1,
0.7361053, 1.468602, -1.420378, 0.6431373, 0, 1, 1,
0.739913, -0.9674979, 3.710618, 0.6509804, 0, 1, 1,
0.7452481, -0.4486043, 2.538606, 0.654902, 0, 1, 1,
0.7473239, 1.301747, -1.24813, 0.6627451, 0, 1, 1,
0.7484554, 0.5376023, 1.455784, 0.6666667, 0, 1, 1,
0.7512092, -1.421778, 4.113363, 0.6745098, 0, 1, 1,
0.7514878, 0.7934842, 0.4127568, 0.6784314, 0, 1, 1,
0.7516189, -0.04507928, -0.1248862, 0.6862745, 0, 1, 1,
0.752429, 0.08535532, 1.333004, 0.6901961, 0, 1, 1,
0.7525058, -0.3279762, 1.955449, 0.6980392, 0, 1, 1,
0.7570814, 0.231683, 1.175833, 0.7058824, 0, 1, 1,
0.764821, -1.090821, 3.564724, 0.7098039, 0, 1, 1,
0.7740712, -0.4367316, 3.414276, 0.7176471, 0, 1, 1,
0.7767774, 0.9333293, 0.5540126, 0.7215686, 0, 1, 1,
0.7780795, -1.459171, 3.652703, 0.7294118, 0, 1, 1,
0.7929305, -1.357062, 1.567208, 0.7333333, 0, 1, 1,
0.7935513, 0.7717381, 2.290775, 0.7411765, 0, 1, 1,
0.8020542, 0.03788552, 2.504827, 0.7450981, 0, 1, 1,
0.8041283, 0.1981885, 2.096557, 0.7529412, 0, 1, 1,
0.8079843, 0.2109918, -0.2536191, 0.7568628, 0, 1, 1,
0.8122127, 0.9708226, -0.5638947, 0.7647059, 0, 1, 1,
0.8231787, -0.3037996, 2.230775, 0.7686275, 0, 1, 1,
0.8240404, 2.607645, 0.5040063, 0.7764706, 0, 1, 1,
0.82605, 0.5992931, 0.8171735, 0.7803922, 0, 1, 1,
0.8286824, -0.9487398, 2.355942, 0.7882353, 0, 1, 1,
0.8307589, -0.7893721, 1.59494, 0.7921569, 0, 1, 1,
0.8376808, 0.6463907, 0.3745004, 0.8, 0, 1, 1,
0.8381587, 0.2644401, 0.6862034, 0.8078431, 0, 1, 1,
0.8446244, -0.9833065, 3.037909, 0.8117647, 0, 1, 1,
0.84606, -0.614384, 1.187977, 0.8196079, 0, 1, 1,
0.8476484, 1.128976, 1.988941, 0.8235294, 0, 1, 1,
0.8535461, -1.56837, 3.414954, 0.8313726, 0, 1, 1,
0.8551927, 0.4506822, 0.5403, 0.8352941, 0, 1, 1,
0.8597941, 0.09356003, 1.322538, 0.8431373, 0, 1, 1,
0.8615471, -0.6958328, 0.9750519, 0.8470588, 0, 1, 1,
0.8622728, -1.646895, 1.792194, 0.854902, 0, 1, 1,
0.8625824, 1.417675, 0.1947236, 0.8588235, 0, 1, 1,
0.8655338, -0.1880716, 3.168056, 0.8666667, 0, 1, 1,
0.8696483, 0.1067803, 3.685786, 0.8705882, 0, 1, 1,
0.891896, -1.918643, 3.146682, 0.8784314, 0, 1, 1,
0.8935872, 0.007637082, 0.1338646, 0.8823529, 0, 1, 1,
0.8968551, -0.4824847, 5.001135, 0.8901961, 0, 1, 1,
0.9006698, -0.7729888, 1.235707, 0.8941177, 0, 1, 1,
0.9075146, 0.02461723, 2.240618, 0.9019608, 0, 1, 1,
0.9085379, 0.4922194, 0.1636607, 0.9098039, 0, 1, 1,
0.9214696, -0.8836548, 1.847143, 0.9137255, 0, 1, 1,
0.9291397, -1.285858, 2.952741, 0.9215686, 0, 1, 1,
0.9342758, 0.8756797, 0.3798787, 0.9254902, 0, 1, 1,
0.9374554, -2.059448, 2.044556, 0.9333333, 0, 1, 1,
0.9406565, 0.7968155, 0.2171535, 0.9372549, 0, 1, 1,
0.9415658, -0.3645018, 1.508478, 0.945098, 0, 1, 1,
0.9431721, 1.679746, -1.204536, 0.9490196, 0, 1, 1,
0.9555429, 0.3783087, 1.546268, 0.9568627, 0, 1, 1,
0.9578899, 1.49891, 1.280497, 0.9607843, 0, 1, 1,
0.9676906, 0.08821262, -0.3734373, 0.9686275, 0, 1, 1,
0.970831, 1.145286, 1.420568, 0.972549, 0, 1, 1,
0.9708874, -0.5580588, -0.8670272, 0.9803922, 0, 1, 1,
0.9741338, 1.028749, 2.300939, 0.9843137, 0, 1, 1,
0.9893691, -0.8886692, 1.825939, 0.9921569, 0, 1, 1,
0.9977235, -0.5792497, 2.367997, 0.9960784, 0, 1, 1,
1.000401, 0.412867, 0.9218163, 1, 0, 0.9960784, 1,
1.001074, 0.1107837, 1.905826, 1, 0, 0.9882353, 1,
1.013542, -0.05403045, 1.840765, 1, 0, 0.9843137, 1,
1.01449, -0.8835215, 2.357327, 1, 0, 0.9764706, 1,
1.032305, -0.3226604, 1.729801, 1, 0, 0.972549, 1,
1.034767, -1.144019, 2.783711, 1, 0, 0.9647059, 1,
1.035536, 0.08558029, 1.841814, 1, 0, 0.9607843, 1,
1.037133, 0.269468, 0.7915888, 1, 0, 0.9529412, 1,
1.038763, -0.9380012, 2.027576, 1, 0, 0.9490196, 1,
1.039325, -0.6388353, 0.9945505, 1, 0, 0.9411765, 1,
1.054184, 0.4789308, 2.65328, 1, 0, 0.9372549, 1,
1.055092, -0.7604137, 1.375873, 1, 0, 0.9294118, 1,
1.057631, 0.6482036, 2.073134, 1, 0, 0.9254902, 1,
1.059313, -0.05471442, 2.283325, 1, 0, 0.9176471, 1,
1.059468, 0.1609906, 2.691557, 1, 0, 0.9137255, 1,
1.061863, 0.3669934, 1.016466, 1, 0, 0.9058824, 1,
1.067913, -1.062027, 3.945854, 1, 0, 0.9019608, 1,
1.075556, 0.4778849, 0.07762589, 1, 0, 0.8941177, 1,
1.080997, -1.066891, 3.469588, 1, 0, 0.8862745, 1,
1.083299, -0.865881, 3.058076, 1, 0, 0.8823529, 1,
1.094682, 1.345391, 0.6006238, 1, 0, 0.8745098, 1,
1.101389, 0.9011211, -0.2584679, 1, 0, 0.8705882, 1,
1.111686, 2.243476, -0.9239008, 1, 0, 0.8627451, 1,
1.123041, -0.5729013, 1.339724, 1, 0, 0.8588235, 1,
1.123522, -0.1137584, 2.184576, 1, 0, 0.8509804, 1,
1.132526, 0.2984498, 2.746828, 1, 0, 0.8470588, 1,
1.143062, 0.3062931, 1.016861, 1, 0, 0.8392157, 1,
1.156821, -0.8296282, 1.724286, 1, 0, 0.8352941, 1,
1.15822, 1.011623, 0.7576631, 1, 0, 0.827451, 1,
1.166445, 0.3989733, -0.01149403, 1, 0, 0.8235294, 1,
1.179583, -1.065386, 2.68558, 1, 0, 0.8156863, 1,
1.183313, 0.09974068, 0.8169834, 1, 0, 0.8117647, 1,
1.190452, -1.09311, 3.43556, 1, 0, 0.8039216, 1,
1.19139, 0.8796309, 1.466618, 1, 0, 0.7960784, 1,
1.194701, 0.1961541, 0.4668246, 1, 0, 0.7921569, 1,
1.194954, 1.54721, 1.780186, 1, 0, 0.7843137, 1,
1.198459, 1.309778, 0.9753751, 1, 0, 0.7803922, 1,
1.205481, -0.6982594, 1.240029, 1, 0, 0.772549, 1,
1.2069, 0.2048266, 2.33222, 1, 0, 0.7686275, 1,
1.208699, -1.849034, 3.311826, 1, 0, 0.7607843, 1,
1.212048, -0.6135604, 3.033135, 1, 0, 0.7568628, 1,
1.215982, 0.2445822, 0.8073826, 1, 0, 0.7490196, 1,
1.220287, -0.3829952, 3.237333, 1, 0, 0.7450981, 1,
1.224991, -0.166476, 0.7151204, 1, 0, 0.7372549, 1,
1.225301, -0.3513274, 2.601611, 1, 0, 0.7333333, 1,
1.230652, -1.205572, 2.437625, 1, 0, 0.7254902, 1,
1.233462, -1.116347, 2.050169, 1, 0, 0.7215686, 1,
1.236319, -0.7812896, 3.078592, 1, 0, 0.7137255, 1,
1.240207, 0.7690343, 1.30966, 1, 0, 0.7098039, 1,
1.244084, 0.2575331, 1.171681, 1, 0, 0.7019608, 1,
1.255297, 0.1726779, 1.04457, 1, 0, 0.6941177, 1,
1.260028, -1.064821, 1.955238, 1, 0, 0.6901961, 1,
1.269925, 1.154291, 0.4091589, 1, 0, 0.682353, 1,
1.273122, -0.755929, 0.8771583, 1, 0, 0.6784314, 1,
1.289862, 0.1112917, 2.637924, 1, 0, 0.6705883, 1,
1.296337, -0.3083847, 2.390699, 1, 0, 0.6666667, 1,
1.306562, -0.5468902, 2.119333, 1, 0, 0.6588235, 1,
1.307636, 0.3304468, 1.601851, 1, 0, 0.654902, 1,
1.31063, 0.2895024, 0.2153749, 1, 0, 0.6470588, 1,
1.312386, 1.589378, -0.9961904, 1, 0, 0.6431373, 1,
1.313417, 0.03795901, 1.179115, 1, 0, 0.6352941, 1,
1.322384, 1.120122, 1.527149, 1, 0, 0.6313726, 1,
1.323171, 0.4944759, 1.767348, 1, 0, 0.6235294, 1,
1.323734, 1.091433, 1.559612, 1, 0, 0.6196079, 1,
1.325377, -0.7853755, 1.214453, 1, 0, 0.6117647, 1,
1.327821, -0.1402629, 1.297826, 1, 0, 0.6078432, 1,
1.331929, -0.2790062, -1.062453, 1, 0, 0.6, 1,
1.332965, -0.5349854, 3.37305, 1, 0, 0.5921569, 1,
1.333012, -0.6306913, 2.825502, 1, 0, 0.5882353, 1,
1.334107, 0.6590951, -0.1059911, 1, 0, 0.5803922, 1,
1.349436, 1.228791, 0.6938834, 1, 0, 0.5764706, 1,
1.356402, -0.6469749, 1.648834, 1, 0, 0.5686275, 1,
1.363178, 0.8435836, 2.687247, 1, 0, 0.5647059, 1,
1.366971, -1.221631, 1.287076, 1, 0, 0.5568628, 1,
1.369355, -0.1445297, 1.332253, 1, 0, 0.5529412, 1,
1.378393, 0.3736139, 0.536962, 1, 0, 0.5450981, 1,
1.37969, -0.8451536, 1.90772, 1, 0, 0.5411765, 1,
1.385859, -1.776753, 4.513819, 1, 0, 0.5333334, 1,
1.400283, -0.7162561, 2.233, 1, 0, 0.5294118, 1,
1.403071, -0.4629957, 1.871284, 1, 0, 0.5215687, 1,
1.403818, 0.9195062, 1.986319, 1, 0, 0.5176471, 1,
1.404206, -1.293365, 1.158812, 1, 0, 0.509804, 1,
1.405198, -0.1950515, 2.416856, 1, 0, 0.5058824, 1,
1.407703, -0.8876662, 1.031796, 1, 0, 0.4980392, 1,
1.411962, -0.1154298, 1.194509, 1, 0, 0.4901961, 1,
1.427034, -0.3187162, 2.718835, 1, 0, 0.4862745, 1,
1.438743, 0.7700047, 2.272319, 1, 0, 0.4784314, 1,
1.442635, -0.7409125, 2.749235, 1, 0, 0.4745098, 1,
1.44452, -0.2083334, -0.386365, 1, 0, 0.4666667, 1,
1.453528, -0.2871435, -0.3796294, 1, 0, 0.4627451, 1,
1.45393, 0.02893249, 0.2082938, 1, 0, 0.454902, 1,
1.47117, 0.5705629, 1.169426, 1, 0, 0.4509804, 1,
1.477072, -1.322903, 2.760319, 1, 0, 0.4431373, 1,
1.478415, 0.1635864, 1.326747, 1, 0, 0.4392157, 1,
1.481225, -0.5609268, 1.514876, 1, 0, 0.4313726, 1,
1.502474, -0.4230617, 2.137655, 1, 0, 0.427451, 1,
1.514684, -0.3286425, 2.936669, 1, 0, 0.4196078, 1,
1.520694, 1.446018, 2.365013, 1, 0, 0.4156863, 1,
1.529957, 0.02468009, 1.938996, 1, 0, 0.4078431, 1,
1.53931, -2.509897, 4.296259, 1, 0, 0.4039216, 1,
1.552784, -0.2633203, -0.4586486, 1, 0, 0.3960784, 1,
1.557547, -0.4118452, 2.196979, 1, 0, 0.3882353, 1,
1.565789, 1.283977, 0.1740552, 1, 0, 0.3843137, 1,
1.580279, 1.217818, 2.441831, 1, 0, 0.3764706, 1,
1.589585, -1.03176, 2.568736, 1, 0, 0.372549, 1,
1.592273, 0.3203307, 2.245074, 1, 0, 0.3647059, 1,
1.615809, -0.0393161, 1.811787, 1, 0, 0.3607843, 1,
1.642561, 0.2893544, 1.459912, 1, 0, 0.3529412, 1,
1.643762, 0.8579434, 0.6518844, 1, 0, 0.3490196, 1,
1.674295, 0.2836821, 0.4286851, 1, 0, 0.3411765, 1,
1.679367, -1.857799, 3.693475, 1, 0, 0.3372549, 1,
1.680682, 0.313271, 0.8402641, 1, 0, 0.3294118, 1,
1.68201, -0.3702076, 2.29404, 1, 0, 0.3254902, 1,
1.691064, 1.04516, 0.4680853, 1, 0, 0.3176471, 1,
1.691308, -0.480155, 2.181768, 1, 0, 0.3137255, 1,
1.695696, -0.1096825, 2.117465, 1, 0, 0.3058824, 1,
1.698814, -0.1715501, 1.066975, 1, 0, 0.2980392, 1,
1.714496, -0.1416871, 0.8194046, 1, 0, 0.2941177, 1,
1.722113, 0.8991753, -0.2770385, 1, 0, 0.2862745, 1,
1.724398, -0.4720994, 0.7446619, 1, 0, 0.282353, 1,
1.726267, 0.399755, 2.716056, 1, 0, 0.2745098, 1,
1.74676, -0.08240499, 1.491809, 1, 0, 0.2705882, 1,
1.756752, 0.2975026, 1.719337, 1, 0, 0.2627451, 1,
1.769771, 0.2031548, 2.565805, 1, 0, 0.2588235, 1,
1.773151, 0.06657599, 0.01054299, 1, 0, 0.2509804, 1,
1.791539, 1.06305, 0.9417488, 1, 0, 0.2470588, 1,
1.800954, 0.1590779, 2.593194, 1, 0, 0.2392157, 1,
1.818902, 0.2442664, 0.810384, 1, 0, 0.2352941, 1,
1.825412, 1.349341, 0.2187161, 1, 0, 0.227451, 1,
1.826194, -2.304786, 1.48073, 1, 0, 0.2235294, 1,
1.850484, 1.233815, 3.139187, 1, 0, 0.2156863, 1,
1.862069, -1.619303, 0.7367998, 1, 0, 0.2117647, 1,
1.8636, 0.01117651, 0.5461217, 1, 0, 0.2039216, 1,
1.875005, -1.322642, 0.7503073, 1, 0, 0.1960784, 1,
1.881782, -2.144314, 2.090416, 1, 0, 0.1921569, 1,
1.905468, -0.3633696, 1.061134, 1, 0, 0.1843137, 1,
1.91147, -0.9382485, 2.27373, 1, 0, 0.1803922, 1,
1.926, 0.6997147, 2.035123, 1, 0, 0.172549, 1,
1.937193, -0.1294078, 1.750092, 1, 0, 0.1686275, 1,
1.940064, 0.1571645, 1.660286, 1, 0, 0.1607843, 1,
1.948172, 0.05256368, 1.214286, 1, 0, 0.1568628, 1,
1.956819, -0.4554279, 0.09379947, 1, 0, 0.1490196, 1,
2.01706, 1.092267, 1.618053, 1, 0, 0.145098, 1,
2.071218, 1.27412, 2.056428, 1, 0, 0.1372549, 1,
2.089335, 0.4930722, 1.669276, 1, 0, 0.1333333, 1,
2.092711, 0.5301203, 1.421834, 1, 0, 0.1254902, 1,
2.109136, 1.477932, 0.9442019, 1, 0, 0.1215686, 1,
2.112918, -0.5262724, 3.142318, 1, 0, 0.1137255, 1,
2.134388, 1.363651, 0.05574384, 1, 0, 0.1098039, 1,
2.162583, -0.1255843, 1.950517, 1, 0, 0.1019608, 1,
2.170479, 1.441988, 0.633169, 1, 0, 0.09411765, 1,
2.177682, 0.3953435, 2.258382, 1, 0, 0.09019608, 1,
2.181093, -0.7983125, 3.283208, 1, 0, 0.08235294, 1,
2.183588, -0.06748176, 1.425933, 1, 0, 0.07843138, 1,
2.222094, 0.8795104, 0.4291617, 1, 0, 0.07058824, 1,
2.234566, -1.24201, 1.975636, 1, 0, 0.06666667, 1,
2.247539, 0.5054979, -0.06851456, 1, 0, 0.05882353, 1,
2.248318, -1.630445, 2.027784, 1, 0, 0.05490196, 1,
2.261258, -1.221291, 3.729688, 1, 0, 0.04705882, 1,
2.305043, 1.846143, 0.9555645, 1, 0, 0.04313726, 1,
2.309449, 0.6821136, -0.2342703, 1, 0, 0.03529412, 1,
2.333467, 0.1580036, 1.461543, 1, 0, 0.03137255, 1,
2.352564, -1.153566, 2.300681, 1, 0, 0.02352941, 1,
2.444201, -0.9854869, 2.924786, 1, 0, 0.01960784, 1,
2.720071, -1.095742, 1.621216, 1, 0, 0.01176471, 1,
2.73451, 1.569066, 2.151042, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.4396031, -4.012555, -7.37949, 0, -0.5, 0.5, 0.5,
-0.4396031, -4.012555, -7.37949, 1, -0.5, 0.5, 0.5,
-0.4396031, -4.012555, -7.37949, 1, 1.5, 0.5, 0.5,
-0.4396031, -4.012555, -7.37949, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.689741, 0.3511604, -7.37949, 0, -0.5, 0.5, 0.5,
-4.689741, 0.3511604, -7.37949, 1, -0.5, 0.5, 0.5,
-4.689741, 0.3511604, -7.37949, 1, 1.5, 0.5, 0.5,
-4.689741, 0.3511604, -7.37949, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.689741, -4.012555, -0.0008490086, 0, -0.5, 0.5, 0.5,
-4.689741, -4.012555, -0.0008490086, 1, -0.5, 0.5, 0.5,
-4.689741, -4.012555, -0.0008490086, 1, 1.5, 0.5, 0.5,
-4.689741, -4.012555, -0.0008490086, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.005544, -5.676727,
2, -3.005544, -5.676727,
-3, -3.005544, -5.676727,
-3, -3.173379, -5.96052,
-2, -3.005544, -5.676727,
-2, -3.173379, -5.96052,
-1, -3.005544, -5.676727,
-1, -3.173379, -5.96052,
0, -3.005544, -5.676727,
0, -3.173379, -5.96052,
1, -3.005544, -5.676727,
1, -3.173379, -5.96052,
2, -3.005544, -5.676727,
2, -3.173379, -5.96052
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
-3, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
-3, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
-3, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5,
-2, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
-2, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
-2, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
-2, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5,
-1, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
-1, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
-1, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
-1, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5,
0, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
0, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
0, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
0, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5,
1, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
1, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
1, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
1, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5,
2, -3.509049, -6.528108, 0, -0.5, 0.5, 0.5,
2, -3.509049, -6.528108, 1, -0.5, 0.5, 0.5,
2, -3.509049, -6.528108, 1, 1.5, 0.5, 0.5,
2, -3.509049, -6.528108, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.70894, -2, -5.676727,
-3.70894, 3, -5.676727,
-3.70894, -2, -5.676727,
-3.872407, -2, -5.96052,
-3.70894, -1, -5.676727,
-3.872407, -1, -5.96052,
-3.70894, 0, -5.676727,
-3.872407, 0, -5.96052,
-3.70894, 1, -5.676727,
-3.872407, 1, -5.96052,
-3.70894, 2, -5.676727,
-3.872407, 2, -5.96052,
-3.70894, 3, -5.676727,
-3.872407, 3, -5.96052
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.19934, -2, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, -2, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, -2, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, -2, -6.528108, 0, 1.5, 0.5, 0.5,
-4.19934, -1, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, -1, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, -1, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, -1, -6.528108, 0, 1.5, 0.5, 0.5,
-4.19934, 0, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, 0, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, 0, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, 0, -6.528108, 0, 1.5, 0.5, 0.5,
-4.19934, 1, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, 1, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, 1, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, 1, -6.528108, 0, 1.5, 0.5, 0.5,
-4.19934, 2, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, 2, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, 2, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, 2, -6.528108, 0, 1.5, 0.5, 0.5,
-4.19934, 3, -6.528108, 0, -0.5, 0.5, 0.5,
-4.19934, 3, -6.528108, 1, -0.5, 0.5, 0.5,
-4.19934, 3, -6.528108, 1, 1.5, 0.5, 0.5,
-4.19934, 3, -6.528108, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.70894, -3.005544, -4,
-3.70894, -3.005544, 4,
-3.70894, -3.005544, -4,
-3.872407, -3.173379, -4,
-3.70894, -3.005544, -2,
-3.872407, -3.173379, -2,
-3.70894, -3.005544, 0,
-3.872407, -3.173379, 0,
-3.70894, -3.005544, 2,
-3.872407, -3.173379, 2,
-3.70894, -3.005544, 4,
-3.872407, -3.173379, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.19934, -3.509049, -4, 0, -0.5, 0.5, 0.5,
-4.19934, -3.509049, -4, 1, -0.5, 0.5, 0.5,
-4.19934, -3.509049, -4, 1, 1.5, 0.5, 0.5,
-4.19934, -3.509049, -4, 0, 1.5, 0.5, 0.5,
-4.19934, -3.509049, -2, 0, -0.5, 0.5, 0.5,
-4.19934, -3.509049, -2, 1, -0.5, 0.5, 0.5,
-4.19934, -3.509049, -2, 1, 1.5, 0.5, 0.5,
-4.19934, -3.509049, -2, 0, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 0, 0, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 0, 1, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 0, 1, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 0, 0, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 2, 0, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 2, 1, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 2, 1, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 2, 0, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 4, 0, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 4, 1, -0.5, 0.5, 0.5,
-4.19934, -3.509049, 4, 1, 1.5, 0.5, 0.5,
-4.19934, -3.509049, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.70894, -3.005544, -5.676727,
-3.70894, 3.707865, -5.676727,
-3.70894, -3.005544, 5.675029,
-3.70894, 3.707865, 5.675029,
-3.70894, -3.005544, -5.676727,
-3.70894, -3.005544, 5.675029,
-3.70894, 3.707865, -5.676727,
-3.70894, 3.707865, 5.675029,
-3.70894, -3.005544, -5.676727,
2.829734, -3.005544, -5.676727,
-3.70894, -3.005544, 5.675029,
2.829734, -3.005544, 5.675029,
-3.70894, 3.707865, -5.676727,
2.829734, 3.707865, -5.676727,
-3.70894, 3.707865, 5.675029,
2.829734, 3.707865, 5.675029,
2.829734, -3.005544, -5.676727,
2.829734, 3.707865, -5.676727,
2.829734, -3.005544, 5.675029,
2.829734, 3.707865, 5.675029,
2.829734, -3.005544, -5.676727,
2.829734, -3.005544, 5.675029,
2.829734, 3.707865, -5.676727,
2.829734, 3.707865, 5.675029
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.86034;
var distance = 34.97154;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.4396031, -0.3511604, 0.0008490086 );
mvMatrix.scale( 1.299767, 1.265937, 0.7486731 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97154);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
cyclophosphamide<-read.table("cyclophosphamide.xyz")
```

```
## Error in read.table("cyclophosphamide.xyz"): no lines available in input
```

```r
x<-cyclophosphamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
y<-cyclophosphamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
z<-cyclophosphamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclophosphamide' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.613717, -0.130542, -1.928188, 0, 0, 1, 1, 1,
-3.214183, -1.526338, -2.252353, 1, 0, 0, 1, 1,
-2.747983, 0.5732384, -2.482727, 1, 0, 0, 1, 1,
-2.590748, 0.7630576, -0.4263175, 1, 0, 0, 1, 1,
-2.474239, -0.4193302, -1.545338, 1, 0, 0, 1, 1,
-2.410574, -0.4604124, -2.635524, 1, 0, 0, 1, 1,
-2.392208, -0.3868588, -3.187451, 0, 0, 0, 1, 1,
-2.387304, 0.3607829, -1.574732, 0, 0, 0, 1, 1,
-2.383514, 0.1730436, -0.7100793, 0, 0, 0, 1, 1,
-2.355793, -0.4156063, -2.596918, 0, 0, 0, 1, 1,
-2.278919, 0.4965922, -1.567911, 0, 0, 0, 1, 1,
-2.277676, 1.148645, -2.208589, 0, 0, 0, 1, 1,
-2.276382, 0.1425744, -2.607621, 0, 0, 0, 1, 1,
-2.23928, 0.8536478, -1.1888, 1, 1, 1, 1, 1,
-2.233538, 0.5941797, -1.731709, 1, 1, 1, 1, 1,
-2.216183, -1.528778, -1.756725, 1, 1, 1, 1, 1,
-2.18518, -0.1484172, -0.4628835, 1, 1, 1, 1, 1,
-2.18237, 0.1334035, -1.710203, 1, 1, 1, 1, 1,
-2.179831, 1.419179, -0.462452, 1, 1, 1, 1, 1,
-2.166395, -0.8618274, -3.860573, 1, 1, 1, 1, 1,
-2.156446, -1.960866, -2.849057, 1, 1, 1, 1, 1,
-2.138131, 0.5486347, -0.8323807, 1, 1, 1, 1, 1,
-2.095694, 0.5424314, -1.376639, 1, 1, 1, 1, 1,
-2.058913, 0.897447, 0.237943, 1, 1, 1, 1, 1,
-2.049069, -1.120088, -1.557519, 1, 1, 1, 1, 1,
-2.001507, -0.003479999, -2.754199, 1, 1, 1, 1, 1,
-1.994341, -0.5253398, -2.653213, 1, 1, 1, 1, 1,
-1.986646, 0.08478384, -1.073686, 1, 1, 1, 1, 1,
-1.977239, -0.04157853, -1.394218, 0, 0, 1, 1, 1,
-1.950007, -0.3821026, -0.9746925, 1, 0, 0, 1, 1,
-1.949745, 0.1724656, -2.002453, 1, 0, 0, 1, 1,
-1.941051, 1.183296, 1.172257, 1, 0, 0, 1, 1,
-1.874432, -0.6064854, -3.256358, 1, 0, 0, 1, 1,
-1.854167, -1.240569, -1.547529, 1, 0, 0, 1, 1,
-1.838741, 0.02328226, -1.045004, 0, 0, 0, 1, 1,
-1.776229, -1.133659, -3.678443, 0, 0, 0, 1, 1,
-1.760084, -0.1089561, -4.552808, 0, 0, 0, 1, 1,
-1.757986, 1.172979, -1.916511, 0, 0, 0, 1, 1,
-1.743203, 1.663218, -1.06341, 0, 0, 0, 1, 1,
-1.680253, -1.124505, -2.01213, 0, 0, 0, 1, 1,
-1.678075, 0.7152418, -2.277257, 0, 0, 0, 1, 1,
-1.671278, -0.3661762, -1.83541, 1, 1, 1, 1, 1,
-1.665329, 1.971672, -0.3451663, 1, 1, 1, 1, 1,
-1.657208, 0.2263569, -0.4952579, 1, 1, 1, 1, 1,
-1.651405, -0.9456241, -2.188967, 1, 1, 1, 1, 1,
-1.651029, 1.113347, -0.1829281, 1, 1, 1, 1, 1,
-1.650266, 0.3191668, -0.7831515, 1, 1, 1, 1, 1,
-1.645681, -2.302865, -4.401658, 1, 1, 1, 1, 1,
-1.62326, -0.9094057, -1.501688, 1, 1, 1, 1, 1,
-1.601752, 1.666994, -0.1985518, 1, 1, 1, 1, 1,
-1.60108, -0.2766926, -4.045356, 1, 1, 1, 1, 1,
-1.588969, -1.527953, -4.313583, 1, 1, 1, 1, 1,
-1.582031, -1.168706, -4.610604, 1, 1, 1, 1, 1,
-1.579402, 1.190243, -0.3579513, 1, 1, 1, 1, 1,
-1.573615, 0.4154946, -1.164785, 1, 1, 1, 1, 1,
-1.571214, -0.07703328, -1.206432, 1, 1, 1, 1, 1,
-1.555426, -0.3845778, -1.140317, 0, 0, 1, 1, 1,
-1.54991, -1.434208, -3.62979, 1, 0, 0, 1, 1,
-1.539027, 0.2629753, -1.558365, 1, 0, 0, 1, 1,
-1.532039, -0.5194725, -3.511696, 1, 0, 0, 1, 1,
-1.528667, -0.1493236, -2.156624, 1, 0, 0, 1, 1,
-1.521752, 1.082771, -0.2100034, 1, 0, 0, 1, 1,
-1.520096, -0.1022851, -0.5806652, 0, 0, 0, 1, 1,
-1.508643, 0.3657394, -1.309592, 0, 0, 0, 1, 1,
-1.508564, 0.6701584, -1.873155, 0, 0, 0, 1, 1,
-1.493809, 0.1312356, -1.663473, 0, 0, 0, 1, 1,
-1.492372, -0.9134529, -0.6696005, 0, 0, 0, 1, 1,
-1.490975, -0.9650946, -0.8501697, 0, 0, 0, 1, 1,
-1.488945, 0.1085747, -1.388245, 0, 0, 0, 1, 1,
-1.476239, -2.747866, -2.254849, 1, 1, 1, 1, 1,
-1.47164, -0.7807618, -2.110531, 1, 1, 1, 1, 1,
-1.468063, 1.969807, -2.032081, 1, 1, 1, 1, 1,
-1.465819, 1.440061, -0.5723947, 1, 1, 1, 1, 1,
-1.455112, -0.5470732, -0.8017998, 1, 1, 1, 1, 1,
-1.452611, -1.332986, -2.485872, 1, 1, 1, 1, 1,
-1.451463, 1.282379, -2.211796, 1, 1, 1, 1, 1,
-1.449847, 0.8791571, -0.431793, 1, 1, 1, 1, 1,
-1.447715, 1.752288, 0.3666585, 1, 1, 1, 1, 1,
-1.434686, -0.6323555, -3.478382, 1, 1, 1, 1, 1,
-1.425607, 0.3526974, -1.461535, 1, 1, 1, 1, 1,
-1.42037, 0.08908528, -0.7910829, 1, 1, 1, 1, 1,
-1.413071, -0.2226986, -1.199908, 1, 1, 1, 1, 1,
-1.408606, 0.855211, -1.21068, 1, 1, 1, 1, 1,
-1.400246, -1.749061, -2.125887, 1, 1, 1, 1, 1,
-1.394077, -1.664774, -5.51141, 0, 0, 1, 1, 1,
-1.393685, -1.519108, -1.853022, 1, 0, 0, 1, 1,
-1.390667, -1.063319, -1.819958, 1, 0, 0, 1, 1,
-1.390034, -0.3097453, -2.791124, 1, 0, 0, 1, 1,
-1.382143, 1.506859, 1.096135, 1, 0, 0, 1, 1,
-1.37716, 0.2965697, 0.6987637, 1, 0, 0, 1, 1,
-1.369438, 2.278473, -0.9727402, 0, 0, 0, 1, 1,
-1.366466, 1.324846, -1.565702, 0, 0, 0, 1, 1,
-1.358261, -2.266858, -0.7641996, 0, 0, 0, 1, 1,
-1.355092, -0.3066943, -1.632486, 0, 0, 0, 1, 1,
-1.349922, -0.6285092, -3.20801, 0, 0, 0, 1, 1,
-1.347429, 0.172574, -0.6902166, 0, 0, 0, 1, 1,
-1.3447, -0.7053338, -0.9542651, 0, 0, 0, 1, 1,
-1.332161, 2.013027, -1.292308, 1, 1, 1, 1, 1,
-1.331646, 0.42756, -0.4676621, 1, 1, 1, 1, 1,
-1.326856, -1.061944, -1.141456, 1, 1, 1, 1, 1,
-1.326301, 0.6382131, -1.420587, 1, 1, 1, 1, 1,
-1.326164, 0.9910562, 0.830517, 1, 1, 1, 1, 1,
-1.325668, -2.237844, -4.036706, 1, 1, 1, 1, 1,
-1.323945, 0.09300862, -1.568515, 1, 1, 1, 1, 1,
-1.322765, -1.790773, -0.9427755, 1, 1, 1, 1, 1,
-1.320413, -0.4428461, -1.094527, 1, 1, 1, 1, 1,
-1.319196, -1.192484, -2.517976, 1, 1, 1, 1, 1,
-1.310153, 0.7055144, -1.060099, 1, 1, 1, 1, 1,
-1.306863, -2.245155, -3.265718, 1, 1, 1, 1, 1,
-1.29426, -0.6977002, -0.9624634, 1, 1, 1, 1, 1,
-1.266919, -0.9146807, -2.155289, 1, 1, 1, 1, 1,
-1.245243, 0.3219284, -1.911488, 1, 1, 1, 1, 1,
-1.237108, 0.7878439, -0.6854637, 0, 0, 1, 1, 1,
-1.233379, 1.503119, -1.335086, 1, 0, 0, 1, 1,
-1.230676, -0.9939857, -1.616894, 1, 0, 0, 1, 1,
-1.226879, -0.343117, -1.148368, 1, 0, 0, 1, 1,
-1.226395, -0.6954588, -0.2229914, 1, 0, 0, 1, 1,
-1.222131, 0.7895591, 0.8009405, 1, 0, 0, 1, 1,
-1.200243, -0.2505739, -0.2221496, 0, 0, 0, 1, 1,
-1.182461, -0.4163142, -0.5600405, 0, 0, 0, 1, 1,
-1.179235, -1.363577, -1.302538, 0, 0, 0, 1, 1,
-1.162859, 0.4658545, -1.033845, 0, 0, 0, 1, 1,
-1.162785, 0.4740061, -1.837392, 0, 0, 0, 1, 1,
-1.159162, -0.01277385, -2.586244, 0, 0, 0, 1, 1,
-1.157621, -0.7508612, -0.9027205, 0, 0, 0, 1, 1,
-1.155914, -0.1441204, -2.319522, 1, 1, 1, 1, 1,
-1.154918, -1.282596, -3.631579, 1, 1, 1, 1, 1,
-1.15253, 1.82544, -0.2364943, 1, 1, 1, 1, 1,
-1.152404, 1.166939, -0.5810648, 1, 1, 1, 1, 1,
-1.147258, 0.926129, -0.5768942, 1, 1, 1, 1, 1,
-1.142271, 1.216153, 0.71008, 1, 1, 1, 1, 1,
-1.134282, 0.3743245, -1.858675, 1, 1, 1, 1, 1,
-1.133269, 0.2380692, -1.412644, 1, 1, 1, 1, 1,
-1.130692, 1.162246, -0.6674632, 1, 1, 1, 1, 1,
-1.123742, 1.078215, 0.4362271, 1, 1, 1, 1, 1,
-1.120051, 1.578377, -0.6726952, 1, 1, 1, 1, 1,
-1.119216, -0.3774263, -1.377654, 1, 1, 1, 1, 1,
-1.116745, 0.9944509, -0.7164077, 1, 1, 1, 1, 1,
-1.112579, -0.7430006, -4.082457, 1, 1, 1, 1, 1,
-1.108179, -0.01947631, -3.55194, 1, 1, 1, 1, 1,
-1.104003, -0.007603819, -1.504013, 0, 0, 1, 1, 1,
-1.103025, 0.04750714, -1.54384, 1, 0, 0, 1, 1,
-1.095508, -1.439717, -2.788056, 1, 0, 0, 1, 1,
-1.092054, 1.308753, -0.7975743, 1, 0, 0, 1, 1,
-1.091517, 0.4412181, -1.19006, 1, 0, 0, 1, 1,
-1.090811, 2.31372, -0.7223528, 1, 0, 0, 1, 1,
-1.089144, 1.393397, -1.750851, 0, 0, 0, 1, 1,
-1.087782, 0.1929738, 0.04618252, 0, 0, 0, 1, 1,
-1.086375, 3.405777, 1.101563, 0, 0, 0, 1, 1,
-1.080457, -2.064069, -3.172727, 0, 0, 0, 1, 1,
-1.063994, 0.4654198, -1.086648, 0, 0, 0, 1, 1,
-1.063821, 0.4760894, -1.885649, 0, 0, 0, 1, 1,
-1.059181, 1.466245, -0.4295537, 0, 0, 0, 1, 1,
-1.042246, 1.52053, -1.142447, 1, 1, 1, 1, 1,
-1.040433, -2.174364, -3.440908, 1, 1, 1, 1, 1,
-1.037954, -0.190471, -1.501486, 1, 1, 1, 1, 1,
-1.034672, -0.2860072, -2.981751, 1, 1, 1, 1, 1,
-1.034233, 2.393572, 0.4493272, 1, 1, 1, 1, 1,
-1.033222, 0.8039918, -0.3992468, 1, 1, 1, 1, 1,
-1.029861, 1.148762, -1.508192, 1, 1, 1, 1, 1,
-1.023342, -0.1661264, -2.886391, 1, 1, 1, 1, 1,
-1.014158, 0.8350164, 0.7301216, 1, 1, 1, 1, 1,
-1.000041, 1.647171, -0.1157828, 1, 1, 1, 1, 1,
-0.9978962, 0.05031082, -1.581277, 1, 1, 1, 1, 1,
-0.9967042, 0.03776092, -1.734581, 1, 1, 1, 1, 1,
-0.9919213, 2.341328, -1.181206, 1, 1, 1, 1, 1,
-0.9899452, 1.43092, 0.2386099, 1, 1, 1, 1, 1,
-0.9864389, 1.879037, -2.185646, 1, 1, 1, 1, 1,
-0.980351, -0.1920579, -0.7205904, 0, 0, 1, 1, 1,
-0.9766591, 0.4935981, -3.027923, 1, 0, 0, 1, 1,
-0.958489, -0.05394016, -1.469131, 1, 0, 0, 1, 1,
-0.9563455, -0.3678273, -1.587609, 1, 0, 0, 1, 1,
-0.9558783, 0.4653337, -2.983432, 1, 0, 0, 1, 1,
-0.9481025, 1.281837, -1.329092, 1, 0, 0, 1, 1,
-0.9382825, 0.7973524, 0.4989691, 0, 0, 0, 1, 1,
-0.937858, 0.2293177, -2.213883, 0, 0, 0, 1, 1,
-0.9240825, 0.9398259, 1.417176, 0, 0, 0, 1, 1,
-0.9221331, 0.9674764, -1.295394, 0, 0, 0, 1, 1,
-0.9169813, 0.2149481, -2.645629, 0, 0, 0, 1, 1,
-0.916276, -1.729717, -3.863693, 0, 0, 0, 1, 1,
-0.9161659, 0.176245, -2.867233, 0, 0, 0, 1, 1,
-0.9148498, 0.716284, -0.7913553, 1, 1, 1, 1, 1,
-0.9131709, -0.3349884, -1.296851, 1, 1, 1, 1, 1,
-0.9112544, -0.3394713, -2.716279, 1, 1, 1, 1, 1,
-0.9072878, -0.6361871, -3.784648, 1, 1, 1, 1, 1,
-0.9029781, 1.24878, -2.333486, 1, 1, 1, 1, 1,
-0.882411, -0.172517, -1.994438, 1, 1, 1, 1, 1,
-0.8782333, 0.1956996, -1.873579, 1, 1, 1, 1, 1,
-0.8737804, 2.521521, -1.383869, 1, 1, 1, 1, 1,
-0.8707849, 1.663619, -0.02677317, 1, 1, 1, 1, 1,
-0.8682687, -1.051549, -1.912356, 1, 1, 1, 1, 1,
-0.8677314, -0.5992147, -2.578206, 1, 1, 1, 1, 1,
-0.8656369, -0.3613434, -2.629948, 1, 1, 1, 1, 1,
-0.8644283, 0.6688704, -0.1759724, 1, 1, 1, 1, 1,
-0.8614406, -0.4740639, -0.5824407, 1, 1, 1, 1, 1,
-0.8582776, -0.1841482, -1.094567, 1, 1, 1, 1, 1,
-0.8581878, -0.2870149, -3.692939, 0, 0, 1, 1, 1,
-0.8547073, -0.6262892, -2.046845, 1, 0, 0, 1, 1,
-0.850418, -1.631404, -3.495569, 1, 0, 0, 1, 1,
-0.8456079, 1.671158, -1.221467, 1, 0, 0, 1, 1,
-0.8368114, 1.848521, -0.2173281, 1, 0, 0, 1, 1,
-0.836761, 0.661139, -0.2948989, 1, 0, 0, 1, 1,
-0.8334899, -0.717419, -2.18567, 0, 0, 0, 1, 1,
-0.8332548, -1.421074, -2.517286, 0, 0, 0, 1, 1,
-0.8295494, -1.15125, -3.131721, 0, 0, 0, 1, 1,
-0.8268591, 1.104911, 0.4632867, 0, 0, 0, 1, 1,
-0.8267208, -0.3811363, -3.425625, 0, 0, 0, 1, 1,
-0.8211771, -0.2359942, -2.758249, 0, 0, 0, 1, 1,
-0.8173869, -0.1967548, -3.239877, 0, 0, 0, 1, 1,
-0.8162962, -1.094377, -2.358179, 1, 1, 1, 1, 1,
-0.8055789, -1.813657, -2.885265, 1, 1, 1, 1, 1,
-0.7987395, -1.907806, -3.407734, 1, 1, 1, 1, 1,
-0.7986379, 0.315143, -0.3531494, 1, 1, 1, 1, 1,
-0.7983114, 0.3773954, -1.410501, 1, 1, 1, 1, 1,
-0.7973483, -1.350515, -2.596835, 1, 1, 1, 1, 1,
-0.7928158, 0.01310618, -2.848989, 1, 1, 1, 1, 1,
-0.7847419, -1.101315, -2.963599, 1, 1, 1, 1, 1,
-0.7821742, 0.05933442, -0.9628617, 1, 1, 1, 1, 1,
-0.7751878, -0.09182315, -1.694224, 1, 1, 1, 1, 1,
-0.7741273, -0.5823496, -3.242913, 1, 1, 1, 1, 1,
-0.7704712, -1.019514, -2.293296, 1, 1, 1, 1, 1,
-0.7687783, -2.021964, -1.573464, 1, 1, 1, 1, 1,
-0.7656656, -2.907776, -1.30307, 1, 1, 1, 1, 1,
-0.7655149, -0.04188844, -2.623348, 1, 1, 1, 1, 1,
-0.7618924, 0.4035165, -1.10024, 0, 0, 1, 1, 1,
-0.7609267, 0.7256687, -2.499768, 1, 0, 0, 1, 1,
-0.7561223, 0.06273492, -2.865671, 1, 0, 0, 1, 1,
-0.7518271, -0.05780076, -2.806658, 1, 0, 0, 1, 1,
-0.7479973, 1.388357, -0.8733085, 1, 0, 0, 1, 1,
-0.7474018, -1.245724, -2.664685, 1, 0, 0, 1, 1,
-0.7458405, -0.9270065, -1.844808, 0, 0, 0, 1, 1,
-0.7435991, 1.860674, -0.8306339, 0, 0, 0, 1, 1,
-0.7419707, -1.162416, -2.734308, 0, 0, 0, 1, 1,
-0.7342438, -1.068034, -4.484124, 0, 0, 0, 1, 1,
-0.7332032, -0.7796042, -4.404684, 0, 0, 0, 1, 1,
-0.7316909, -0.6346456, -2.367695, 0, 0, 0, 1, 1,
-0.7313797, 0.755245, 0.2453051, 0, 0, 0, 1, 1,
-0.7311384, 0.4126634, -1.886907, 1, 1, 1, 1, 1,
-0.7221711, 0.4717859, -2.651233, 1, 1, 1, 1, 1,
-0.7202906, -1.902725, -4.090606, 1, 1, 1, 1, 1,
-0.7198163, -1.354056, -0.07370395, 1, 1, 1, 1, 1,
-0.7097391, 1.520232, 0.008906946, 1, 1, 1, 1, 1,
-0.7078648, 0.6122763, -0.2562585, 1, 1, 1, 1, 1,
-0.7058853, 0.7865222, -0.1432983, 1, 1, 1, 1, 1,
-0.7017338, 0.7930757, 1.684091, 1, 1, 1, 1, 1,
-0.6910807, 0.2346346, -1.161744, 1, 1, 1, 1, 1,
-0.6868006, -0.3173429, -0.9411125, 1, 1, 1, 1, 1,
-0.6839298, -0.4599466, -2.251855, 1, 1, 1, 1, 1,
-0.6831211, 0.1785668, -2.095613, 1, 1, 1, 1, 1,
-0.6828737, -1.135568, -0.8348991, 1, 1, 1, 1, 1,
-0.6790286, 0.3529055, -0.8821127, 1, 1, 1, 1, 1,
-0.6771106, -0.590637, -2.998863, 1, 1, 1, 1, 1,
-0.6711478, -2.484528, -3.74238, 0, 0, 1, 1, 1,
-0.6683354, 0.4405057, -0.8914775, 1, 0, 0, 1, 1,
-0.6654963, 0.1223694, -1.200919, 1, 0, 0, 1, 1,
-0.6626766, 0.5606285, -0.615795, 1, 0, 0, 1, 1,
-0.6591802, 1.401335, -0.9222088, 1, 0, 0, 1, 1,
-0.6528311, -0.08187758, -2.352056, 1, 0, 0, 1, 1,
-0.6471032, -1.101209, -1.216545, 0, 0, 0, 1, 1,
-0.6466065, 0.709124, 1.631363, 0, 0, 0, 1, 1,
-0.6461786, -1.511397, -2.089218, 0, 0, 0, 1, 1,
-0.6449938, -0.3271017, -0.1616508, 0, 0, 0, 1, 1,
-0.6429901, -0.5534315, -4.181198, 0, 0, 0, 1, 1,
-0.6421626, -0.5796638, -1.883149, 0, 0, 0, 1, 1,
-0.63894, -0.2378366, -1.563274, 0, 0, 0, 1, 1,
-0.6328013, 0.8089658, -0.3838789, 1, 1, 1, 1, 1,
-0.6318996, 2.330598, 0.1120551, 1, 1, 1, 1, 1,
-0.6308407, 1.396584, -0.2099134, 1, 1, 1, 1, 1,
-0.6270088, -1.052159, -3.111708, 1, 1, 1, 1, 1,
-0.6265065, -0.3441402, -3.576178, 1, 1, 1, 1, 1,
-0.619836, 0.2777385, 0.1596462, 1, 1, 1, 1, 1,
-0.6193436, 3.089877, 1.047575, 1, 1, 1, 1, 1,
-0.6156995, -0.6823025, -2.526375, 1, 1, 1, 1, 1,
-0.6086963, -0.9379095, -3.170913, 1, 1, 1, 1, 1,
-0.6072763, 0.85897, -0.2650542, 1, 1, 1, 1, 1,
-0.6061044, -1.243822, -2.865802, 1, 1, 1, 1, 1,
-0.6036136, 0.5425957, -1.009469, 1, 1, 1, 1, 1,
-0.6021623, -0.3504151, -3.794685, 1, 1, 1, 1, 1,
-0.5962634, 0.4590345, -2.717553, 1, 1, 1, 1, 1,
-0.5958466, -0.203771, -2.821854, 1, 1, 1, 1, 1,
-0.5947124, 0.2181105, -1.658315, 0, 0, 1, 1, 1,
-0.5901837, -0.04010833, -1.64954, 1, 0, 0, 1, 1,
-0.5893699, -0.4735089, -3.065883, 1, 0, 0, 1, 1,
-0.5849972, 0.6555211, 0.5053678, 1, 0, 0, 1, 1,
-0.5742672, 0.3841749, 0.5006462, 1, 0, 0, 1, 1,
-0.5737539, 0.8754274, -3.135162, 1, 0, 0, 1, 1,
-0.572778, 1.451791, 0.2785169, 0, 0, 0, 1, 1,
-0.5709355, 0.3428478, -1.781899, 0, 0, 0, 1, 1,
-0.5595932, 0.8955157, 0.07552816, 0, 0, 0, 1, 1,
-0.5584157, 0.3346409, -1.180977, 0, 0, 0, 1, 1,
-0.5565957, 0.9685057, -0.7216122, 0, 0, 0, 1, 1,
-0.5546456, 0.6264492, -1.481206, 0, 0, 0, 1, 1,
-0.5546062, 0.7008572, 0.55164, 0, 0, 0, 1, 1,
-0.5530441, -0.2359377, -1.787725, 1, 1, 1, 1, 1,
-0.5519667, -0.8851866, -2.446817, 1, 1, 1, 1, 1,
-0.5448067, -1.327163, -3.800051, 1, 1, 1, 1, 1,
-0.5432175, -0.6079738, -2.091958, 1, 1, 1, 1, 1,
-0.5414904, -0.6778781, -2.708762, 1, 1, 1, 1, 1,
-0.5389887, 2.087851, 0.966148, 1, 1, 1, 1, 1,
-0.5385032, -0.5557819, -1.961486, 1, 1, 1, 1, 1,
-0.5324212, -1.144022, -3.615229, 1, 1, 1, 1, 1,
-0.5323616, 0.8863757, -0.2248192, 1, 1, 1, 1, 1,
-0.5302986, -0.8367144, -2.859793, 1, 1, 1, 1, 1,
-0.5296097, 0.4101867, 1.142081, 1, 1, 1, 1, 1,
-0.5295274, 2.977348, 0.3139847, 1, 1, 1, 1, 1,
-0.5282878, -0.8246354, -3.447729, 1, 1, 1, 1, 1,
-0.5277195, -0.6545026, -0.2737192, 1, 1, 1, 1, 1,
-0.5273107, 0.03214523, -0.3003293, 1, 1, 1, 1, 1,
-0.5232812, -0.6571934, -1.286213, 0, 0, 1, 1, 1,
-0.5215665, 2.122718, 1.429798, 1, 0, 0, 1, 1,
-0.5205648, -0.5046527, -1.629347, 1, 0, 0, 1, 1,
-0.5153469, 2.524345, -0.4081423, 1, 0, 0, 1, 1,
-0.5128939, 0.8492382, -0.4543624, 1, 0, 0, 1, 1,
-0.5127532, 0.6166522, -0.305268, 1, 0, 0, 1, 1,
-0.5122806, -0.2457263, -0.5478774, 0, 0, 0, 1, 1,
-0.510343, -1.224895, -3.472515, 0, 0, 0, 1, 1,
-0.5087389, 1.220456, -0.8462515, 0, 0, 0, 1, 1,
-0.5066988, -0.4512312, -2.711096, 0, 0, 0, 1, 1,
-0.5040617, 0.9688628, -0.1365564, 0, 0, 0, 1, 1,
-0.4994302, -1.671855, -3.34949, 0, 0, 0, 1, 1,
-0.4976636, -0.5213707, -1.658985, 0, 0, 0, 1, 1,
-0.4932477, -0.3532087, -3.646935, 1, 1, 1, 1, 1,
-0.490784, 0.2957489, -1.289618, 1, 1, 1, 1, 1,
-0.4845232, 0.9173445, -0.1885468, 1, 1, 1, 1, 1,
-0.482883, -0.02103373, -2.668968, 1, 1, 1, 1, 1,
-0.482207, -0.6610283, -3.013348, 1, 1, 1, 1, 1,
-0.4818284, -1.049177, -3.932309, 1, 1, 1, 1, 1,
-0.4817413, -1.365791, -3.348015, 1, 1, 1, 1, 1,
-0.4776048, 0.4365237, -0.5473565, 1, 1, 1, 1, 1,
-0.4754609, 1.087326, -1.745739, 1, 1, 1, 1, 1,
-0.4739038, -0.9565721, -4.74283, 1, 1, 1, 1, 1,
-0.4737707, -0.6072962, -3.318646, 1, 1, 1, 1, 1,
-0.4693064, -0.03665687, -0.9620131, 1, 1, 1, 1, 1,
-0.4639552, 0.7681831, -0.9835557, 1, 1, 1, 1, 1,
-0.4629967, -0.9501418, -3.723284, 1, 1, 1, 1, 1,
-0.4629397, 0.9425377, 0.4402052, 1, 1, 1, 1, 1,
-0.4600959, -0.1499223, -4.204102, 0, 0, 1, 1, 1,
-0.4502803, 1.03089, -0.6799715, 1, 0, 0, 1, 1,
-0.4493164, 0.9288729, 0.3911267, 1, 0, 0, 1, 1,
-0.445409, -1.793581, -4.283955, 1, 0, 0, 1, 1,
-0.443792, -1.587206, -1.691714, 1, 0, 0, 1, 1,
-0.4412577, -0.3119026, -1.879027, 1, 0, 0, 1, 1,
-0.4384723, -1.120917, -4.088973, 0, 0, 0, 1, 1,
-0.4347979, -0.853985, -2.518297, 0, 0, 0, 1, 1,
-0.4324506, 1.440712, 0.3837509, 0, 0, 0, 1, 1,
-0.4301386, 0.149772, -2.668798, 0, 0, 0, 1, 1,
-0.4280244, 1.26758, 0.3515707, 0, 0, 0, 1, 1,
-0.4265409, -0.3159542, -0.8849568, 0, 0, 0, 1, 1,
-0.4228065, 0.6335941, -1.005797, 0, 0, 0, 1, 1,
-0.4156998, 0.3280247, 1.115348, 1, 1, 1, 1, 1,
-0.4094643, 0.5507852, -0.2279618, 1, 1, 1, 1, 1,
-0.403012, 1.14494, -1.488605, 1, 1, 1, 1, 1,
-0.401699, 0.3623925, -1.185278, 1, 1, 1, 1, 1,
-0.4016929, 0.1387256, -0.4182317, 1, 1, 1, 1, 1,
-0.4016135, 0.5274905, -0.7551066, 1, 1, 1, 1, 1,
-0.4009931, 0.2431754, -0.7385492, 1, 1, 1, 1, 1,
-0.3916815, 0.2801203, -1.22303, 1, 1, 1, 1, 1,
-0.3897513, 0.6057358, 0.1183793, 1, 1, 1, 1, 1,
-0.3867275, -0.7183958, -4.618368, 1, 1, 1, 1, 1,
-0.3846583, -2.017494, -3.39782, 1, 1, 1, 1, 1,
-0.378244, -0.786671, -0.8418361, 1, 1, 1, 1, 1,
-0.375954, -0.7276967, -2.391453, 1, 1, 1, 1, 1,
-0.3722841, 1.314772, -0.2996538, 1, 1, 1, 1, 1,
-0.3715246, 1.736415, 0.4016684, 1, 1, 1, 1, 1,
-0.3662044, -1.936749, -3.509296, 0, 0, 1, 1, 1,
-0.3639861, -1.643897, -3.056185, 1, 0, 0, 1, 1,
-0.3634661, 0.9873794, 0.07905377, 1, 0, 0, 1, 1,
-0.3607056, 0.2221628, -2.385942, 1, 0, 0, 1, 1,
-0.3575659, -0.01631526, 0.3173222, 1, 0, 0, 1, 1,
-0.3570537, -0.009668551, -2.463852, 1, 0, 0, 1, 1,
-0.3535201, -1.418316, -3.389292, 0, 0, 0, 1, 1,
-0.3522234, 2.169284, -1.291216, 0, 0, 0, 1, 1,
-0.3513768, -1.057257, -2.8886, 0, 0, 0, 1, 1,
-0.3505888, -1.582816, -3.798624, 0, 0, 0, 1, 1,
-0.3471777, 0.4539289, -1.521861, 0, 0, 0, 1, 1,
-0.3379967, -1.134948, -2.87326, 0, 0, 0, 1, 1,
-0.3378259, -0.5809935, -1.574173, 0, 0, 0, 1, 1,
-0.3335005, -0.07351708, -2.847212, 1, 1, 1, 1, 1,
-0.3243516, 0.1223901, -1.175164, 1, 1, 1, 1, 1,
-0.3209695, -0.2230112, -2.317861, 1, 1, 1, 1, 1,
-0.3167418, 0.9105129, -0.3232316, 1, 1, 1, 1, 1,
-0.3156771, -0.2861761, -0.3970592, 1, 1, 1, 1, 1,
-0.3153192, 2.642269, 1.323465, 1, 1, 1, 1, 1,
-0.3143215, 0.1006093, -1.659235, 1, 1, 1, 1, 1,
-0.3130352, -0.3893338, -2.888226, 1, 1, 1, 1, 1,
-0.303872, -1.430362, -3.207396, 1, 1, 1, 1, 1,
-0.2982107, -0.2374435, -2.534023, 1, 1, 1, 1, 1,
-0.2968389, -0.8315926, -4.587525, 1, 1, 1, 1, 1,
-0.2913179, 0.6997618, -1.340534, 1, 1, 1, 1, 1,
-0.2781247, 2.876204, -0.216424, 1, 1, 1, 1, 1,
-0.2753359, 0.4852057, -1.369674, 1, 1, 1, 1, 1,
-0.2693657, -1.617471, -2.27309, 1, 1, 1, 1, 1,
-0.2687776, 0.3728414, -0.1730797, 0, 0, 1, 1, 1,
-0.2590312, 0.1746231, -0.831221, 1, 0, 0, 1, 1,
-0.2539643, 1.39324, -1.624999, 1, 0, 0, 1, 1,
-0.2520762, -0.1187593, -2.485496, 1, 0, 0, 1, 1,
-0.2494906, 1.837982, -0.6988853, 1, 0, 0, 1, 1,
-0.2466872, 0.4732644, -1.128293, 1, 0, 0, 1, 1,
-0.2437536, 0.2347633, -1.513201, 0, 0, 0, 1, 1,
-0.2407483, -0.8877335, -2.850065, 0, 0, 0, 1, 1,
-0.2224744, 0.1996762, -0.6447524, 0, 0, 0, 1, 1,
-0.2168902, -1.078325, -3.278215, 0, 0, 0, 1, 1,
-0.2147101, 1.363186, -0.5985147, 0, 0, 0, 1, 1,
-0.2081504, 0.3035122, -0.2123084, 0, 0, 0, 1, 1,
-0.2071844, 0.3158478, -0.8803337, 0, 0, 0, 1, 1,
-0.2071174, 1.034946, -0.5557626, 1, 1, 1, 1, 1,
-0.2052282, -0.06963244, -1.114605, 1, 1, 1, 1, 1,
-0.2023423, -0.1263771, -2.447876, 1, 1, 1, 1, 1,
-0.1967112, 0.5892625, 1.775028, 1, 1, 1, 1, 1,
-0.1941786, 0.5758926, -1.119333, 1, 1, 1, 1, 1,
-0.1933085, 0.7016883, 1.061645, 1, 1, 1, 1, 1,
-0.1882378, 0.7924204, 0.8508682, 1, 1, 1, 1, 1,
-0.1881871, 1.298134, 0.5748319, 1, 1, 1, 1, 1,
-0.1845678, 0.5619759, -0.9420245, 1, 1, 1, 1, 1,
-0.183898, -0.5077311, -1.679825, 1, 1, 1, 1, 1,
-0.1819602, -0.7962412, -3.88481, 1, 1, 1, 1, 1,
-0.1816262, 1.597056, -0.2730295, 1, 1, 1, 1, 1,
-0.1800228, -0.9660352, -1.45282, 1, 1, 1, 1, 1,
-0.1772534, 1.83794, 0.01603345, 1, 1, 1, 1, 1,
-0.1741638, -0.389933, -2.80887, 1, 1, 1, 1, 1,
-0.172476, -0.9635431, -3.327143, 0, 0, 1, 1, 1,
-0.170005, 0.3713335, -0.5140884, 1, 0, 0, 1, 1,
-0.1693202, -1.603424, -3.972864, 1, 0, 0, 1, 1,
-0.1667514, -0.5435915, -3.245739, 1, 0, 0, 1, 1,
-0.1656663, 1.686642, 0.8089621, 1, 0, 0, 1, 1,
-0.162569, 1.202566, -0.42596, 1, 0, 0, 1, 1,
-0.1583075, -0.1224359, -3.766759, 0, 0, 0, 1, 1,
-0.1571926, 0.2324195, 1.643391, 0, 0, 0, 1, 1,
-0.1570637, -1.508491, -0.8829421, 0, 0, 0, 1, 1,
-0.1535206, 0.9794751, 2.384465, 0, 0, 0, 1, 1,
-0.1534896, 0.003701611, -1.649154, 0, 0, 0, 1, 1,
-0.1517406, 1.560068, 0.2515927, 0, 0, 0, 1, 1,
-0.1503043, -0.9224522, -3.270031, 0, 0, 0, 1, 1,
-0.144667, -0.5715919, -3.883034, 1, 1, 1, 1, 1,
-0.1446095, -1.373645, -3.499719, 1, 1, 1, 1, 1,
-0.1391601, -0.7498363, -2.984744, 1, 1, 1, 1, 1,
-0.1349922, -0.3605285, -3.755311, 1, 1, 1, 1, 1,
-0.1348944, -0.2057849, -1.494372, 1, 1, 1, 1, 1,
-0.1329011, 1.07669, 0.06016617, 1, 1, 1, 1, 1,
-0.1297281, -1.057633, -3.5275, 1, 1, 1, 1, 1,
-0.1287116, 0.7754865, -0.2527068, 1, 1, 1, 1, 1,
-0.1283422, 0.07479355, -0.1490602, 1, 1, 1, 1, 1,
-0.1269205, -0.1005032, -1.9975, 1, 1, 1, 1, 1,
-0.1223133, -0.009662121, -0.9711512, 1, 1, 1, 1, 1,
-0.1207233, 0.7122043, -0.1629511, 1, 1, 1, 1, 1,
-0.1166755, -0.2207812, -4.661835, 1, 1, 1, 1, 1,
-0.1129489, -0.6868464, -1.396448, 1, 1, 1, 1, 1,
-0.1011695, -1.827915, -3.37286, 1, 1, 1, 1, 1,
-0.09976888, 0.5832059, 2.383454, 0, 0, 1, 1, 1,
-0.09002178, -0.2919494, -2.136129, 1, 0, 0, 1, 1,
-0.08894122, -1.706298, -2.634917, 1, 0, 0, 1, 1,
-0.07723048, 1.561994, 0.4518688, 1, 0, 0, 1, 1,
-0.07706967, 1.148885, -0.6072859, 1, 0, 0, 1, 1,
-0.07658336, -0.07149021, -1.574474, 1, 0, 0, 1, 1,
-0.07522836, -1.273032, -2.590295, 0, 0, 0, 1, 1,
-0.07426942, 1.075892, -2.246661, 0, 0, 0, 1, 1,
-0.07366131, 1.318519, -1.029748, 0, 0, 0, 1, 1,
-0.07331648, 0.6685118, -0.5089687, 0, 0, 0, 1, 1,
-0.07263742, 0.7239313, 1.556886, 0, 0, 0, 1, 1,
-0.07161048, -0.4733385, -3.174984, 0, 0, 0, 1, 1,
-0.07061265, -0.3455373, -3.288144, 0, 0, 0, 1, 1,
-0.07000578, 0.6554108, -1.939115, 1, 1, 1, 1, 1,
-0.06990212, -0.4126033, -2.914981, 1, 1, 1, 1, 1,
-0.06782094, 0.9592767, -0.6557169, 1, 1, 1, 1, 1,
-0.06314872, -1.193763, -2.881304, 1, 1, 1, 1, 1,
-0.06300682, 1.454838, -0.2380146, 1, 1, 1, 1, 1,
-0.06270014, -0.05788081, -3.765382, 1, 1, 1, 1, 1,
-0.0621147, 1.267607, -1.675254, 1, 1, 1, 1, 1,
-0.06209154, 0.7863679, -1.256677, 1, 1, 1, 1, 1,
-0.06074806, -0.791221, -2.448404, 1, 1, 1, 1, 1,
-0.05876383, 0.86759, 0.06587915, 1, 1, 1, 1, 1,
-0.05557842, -0.7156152, -4.050671, 1, 1, 1, 1, 1,
-0.05546131, 1.152601, 0.9135948, 1, 1, 1, 1, 1,
-0.05266733, 1.036472, 0.8340625, 1, 1, 1, 1, 1,
-0.05078897, -0.5426288, -2.841202, 1, 1, 1, 1, 1,
-0.05070384, 0.07194951, -0.9219128, 1, 1, 1, 1, 1,
-0.04786834, -0.02390308, -2.7259, 0, 0, 1, 1, 1,
-0.04659778, -0.1714213, -5.186941, 1, 0, 0, 1, 1,
-0.04560138, 0.5689967, -0.07870136, 1, 0, 0, 1, 1,
-0.04501652, -0.4044068, -3.431986, 1, 0, 0, 1, 1,
-0.04211885, -0.601011, -3.311084, 1, 0, 0, 1, 1,
-0.04149036, -0.54545, -3.863369, 1, 0, 0, 1, 1,
-0.04100081, -0.01508905, -3.556089, 0, 0, 0, 1, 1,
-0.03993424, -0.1871767, -3.69571, 0, 0, 0, 1, 1,
-0.03949261, -2.523157, 0.5491257, 0, 0, 0, 1, 1,
-0.03691687, 0.9696974, -0.7824048, 0, 0, 0, 1, 1,
-0.03593647, 0.05002109, -0.5475805, 0, 0, 0, 1, 1,
-0.03315607, 0.5141805, 0.382245, 0, 0, 0, 1, 1,
-0.03264259, -0.1125261, -3.896893, 0, 0, 0, 1, 1,
-0.03024813, 0.4577568, 1.778144, 1, 1, 1, 1, 1,
-0.02745612, 1.895316, 1.008869, 1, 1, 1, 1, 1,
-0.02661834, -0.7506004, -2.713355, 1, 1, 1, 1, 1,
-0.02595087, 1.115294, 1.571268, 1, 1, 1, 1, 1,
-0.02563274, 0.8508747, -1.488245, 1, 1, 1, 1, 1,
-0.02555858, -0.09470573, -1.76528, 1, 1, 1, 1, 1,
-0.02053461, -0.4171584, -3.811638, 1, 1, 1, 1, 1,
-0.01412006, 0.7785072, -0.7428931, 1, 1, 1, 1, 1,
-0.01275645, 2.337034e-05, -1.280895, 1, 1, 1, 1, 1,
-0.01110439, -1.166284, -2.52628, 1, 1, 1, 1, 1,
-0.0109989, 0.05465952, 1.853182, 1, 1, 1, 1, 1,
-0.007297602, 0.1863343, -0.3365892, 1, 1, 1, 1, 1,
-0.006883047, 2.048695, 0.7086564, 1, 1, 1, 1, 1,
-0.006869858, 0.03918295, -0.6567836, 1, 1, 1, 1, 1,
-0.005664703, 2.347434, -0.1421415, 1, 1, 1, 1, 1,
-0.001806474, 0.5350832, 0.6233116, 0, 0, 1, 1, 1,
-0.001353649, 0.3818272, 0.1717806, 1, 0, 0, 1, 1,
-0.0009699463, -1.052387, -2.696615, 1, 0, 0, 1, 1,
0.004728042, -0.7303602, 3.30514, 1, 0, 0, 1, 1,
0.00657698, 1.491074, 1.391882, 1, 0, 0, 1, 1,
0.007619397, -0.1725888, 1.638315, 1, 0, 0, 1, 1,
0.008256873, -0.3884498, 2.827694, 0, 0, 0, 1, 1,
0.008727394, -0.5263298, 0.8176104, 0, 0, 0, 1, 1,
0.008759755, -1.509207, 2.779131, 0, 0, 0, 1, 1,
0.00946942, -1.722203, 4.517028, 0, 0, 0, 1, 1,
0.01132427, 0.05930183, -0.07541846, 0, 0, 0, 1, 1,
0.01161086, 0.2679814, 0.6955747, 0, 0, 0, 1, 1,
0.01383691, -2.801552, 1.81352, 0, 0, 0, 1, 1,
0.01425367, -0.8737185, 2.786931, 1, 1, 1, 1, 1,
0.01453076, 0.3325943, 0.509703, 1, 1, 1, 1, 1,
0.0203902, -0.2593688, 3.16571, 1, 1, 1, 1, 1,
0.02251511, 1.868635, 0.625565, 1, 1, 1, 1, 1,
0.02251788, -0.7773598, 4.205828, 1, 1, 1, 1, 1,
0.02886397, -1.615671, 3.885699, 1, 1, 1, 1, 1,
0.02927454, -1.089486, 2.816534, 1, 1, 1, 1, 1,
0.0306729, -2.835436, 5.509712, 1, 1, 1, 1, 1,
0.03501395, -0.5428979, 4.05879, 1, 1, 1, 1, 1,
0.0354874, 0.8447553, -0.5852195, 1, 1, 1, 1, 1,
0.03577514, 0.2870711, 0.08743136, 1, 1, 1, 1, 1,
0.03595782, -0.5398872, 1.651358, 1, 1, 1, 1, 1,
0.04272897, 1.054025, -0.8518716, 1, 1, 1, 1, 1,
0.04497087, -0.7748768, 3.218894, 1, 1, 1, 1, 1,
0.04698774, 0.9091215, -0.6540828, 1, 1, 1, 1, 1,
0.04782527, -0.3735606, 3.243747, 0, 0, 1, 1, 1,
0.04926956, 0.6141361, -0.4276666, 1, 0, 0, 1, 1,
0.06060074, 1.127192, -1.169469, 1, 0, 0, 1, 1,
0.06128984, -0.597964, 4.694956, 1, 0, 0, 1, 1,
0.06355189, -0.5864786, 2.467752, 1, 0, 0, 1, 1,
0.06690819, -0.09663458, 1.833769, 1, 0, 0, 1, 1,
0.07735591, -0.6630116, 5.237535, 0, 0, 0, 1, 1,
0.0796124, -1.149476, 2.869136, 0, 0, 0, 1, 1,
0.08118583, 0.402871, 1.486594, 0, 0, 0, 1, 1,
0.0858585, 0.3272772, 1.722668, 0, 0, 0, 1, 1,
0.08603986, -0.8627617, 3.036213, 0, 0, 0, 1, 1,
0.08658808, -2.258554, 2.937057, 0, 0, 0, 1, 1,
0.09532889, -1.213197, 4.767211, 0, 0, 0, 1, 1,
0.09729454, -0.3979314, 2.637166, 1, 1, 1, 1, 1,
0.1029748, 1.427461, 2.940738, 1, 1, 1, 1, 1,
0.1036826, -1.156324, 4.562809, 1, 1, 1, 1, 1,
0.1044437, -0.2687336, 2.962906, 1, 1, 1, 1, 1,
0.108644, -0.7576066, 0.9971463, 1, 1, 1, 1, 1,
0.1097811, -0.702741, 2.443855, 1, 1, 1, 1, 1,
0.1121987, -0.6528332, 4.441811, 1, 1, 1, 1, 1,
0.1122778, 0.8931941, -1.114496, 1, 1, 1, 1, 1,
0.1169847, -1.227752, 4.222327, 1, 1, 1, 1, 1,
0.1182038, 0.2029562, -0.5721676, 1, 1, 1, 1, 1,
0.1182505, 1.008052, 1.124488, 1, 1, 1, 1, 1,
0.1189063, 0.785365, 0.05817602, 1, 1, 1, 1, 1,
0.1209402, -0.3418898, 1.057508, 1, 1, 1, 1, 1,
0.1216488, -0.3629363, 2.537781, 1, 1, 1, 1, 1,
0.121847, 2.618311, 0.900818, 1, 1, 1, 1, 1,
0.1219054, -0.1553643, 1.837312, 0, 0, 1, 1, 1,
0.1230794, -1.128551, 4.961189, 1, 0, 0, 1, 1,
0.124821, -0.3485014, 3.713949, 1, 0, 0, 1, 1,
0.1251946, 0.8663054, 0.546753, 1, 0, 0, 1, 1,
0.1265858, 0.4976338, -1.691208, 1, 0, 0, 1, 1,
0.1266994, -1.008543, 3.17203, 1, 0, 0, 1, 1,
0.1288566, 0.1033269, 1.490311, 0, 0, 0, 1, 1,
0.1334113, -1.447692, 3.284643, 0, 0, 0, 1, 1,
0.1343519, 1.717532, 0.1665224, 0, 0, 0, 1, 1,
0.1372566, -1.327319, 2.621859, 0, 0, 0, 1, 1,
0.1383661, -1.180327, 1.713162, 0, 0, 0, 1, 1,
0.1427152, -1.949319, 3.431185, 0, 0, 0, 1, 1,
0.1436475, 1.656385, 0.488862, 0, 0, 0, 1, 1,
0.1451997, -0.3398127, 1.684694, 1, 1, 1, 1, 1,
0.1500514, -0.334372, 1.181874, 1, 1, 1, 1, 1,
0.1513586, -0.8238168, 2.703517, 1, 1, 1, 1, 1,
0.1513798, -1.157162, 3.623268, 1, 1, 1, 1, 1,
0.1516658, 0.6616995, 1.936206, 1, 1, 1, 1, 1,
0.1538512, -1.559118, 1.425009, 1, 1, 1, 1, 1,
0.1541496, -0.01059537, 2.520444, 1, 1, 1, 1, 1,
0.1588151, -0.5163761, 3.79061, 1, 1, 1, 1, 1,
0.1624405, 0.9190291, 0.501062, 1, 1, 1, 1, 1,
0.1633224, 0.1192348, 3.107614, 1, 1, 1, 1, 1,
0.1710729, 0.3474196, -1.533678, 1, 1, 1, 1, 1,
0.171716, 0.3657109, 0.6611722, 1, 1, 1, 1, 1,
0.1840852, 0.2823029, 0.670399, 1, 1, 1, 1, 1,
0.1877251, -0.578974, 2.909917, 1, 1, 1, 1, 1,
0.196076, -2.346186, 4.959647, 1, 1, 1, 1, 1,
0.1976724, 0.9671456, -0.7729948, 0, 0, 1, 1, 1,
0.1978475, 1.506003, 2.004617, 1, 0, 0, 1, 1,
0.2014682, -1.094795, 2.052229, 1, 0, 0, 1, 1,
0.2033687, 0.9486471, 0.7386421, 1, 0, 0, 1, 1,
0.204286, 0.3563065, 0.6516792, 1, 0, 0, 1, 1,
0.2089324, -0.6718715, 4.211854, 1, 0, 0, 1, 1,
0.2110017, -2.858618, 1.559651, 0, 0, 0, 1, 1,
0.215247, 0.2781287, 0.2818712, 0, 0, 0, 1, 1,
0.2159424, 0.9648519, 0.830359, 0, 0, 0, 1, 1,
0.2193771, -1.009747, 0.4735041, 0, 0, 0, 1, 1,
0.2209888, 1.58426, 0.8342461, 0, 0, 0, 1, 1,
0.2218636, -0.8259889, 2.019328, 0, 0, 0, 1, 1,
0.2223992, -0.6051848, 2.671013, 0, 0, 0, 1, 1,
0.2225841, -0.05681825, 2.168733, 1, 1, 1, 1, 1,
0.2256247, -0.4963624, 2.252088, 1, 1, 1, 1, 1,
0.2290668, -0.02177332, 2.191769, 1, 1, 1, 1, 1,
0.2300607, 0.3667205, 2.472692, 1, 1, 1, 1, 1,
0.2326373, -1.00482, 1.465385, 1, 1, 1, 1, 1,
0.2341846, -0.9031438, 3.330627, 1, 1, 1, 1, 1,
0.2359287, -0.6982512, 3.443954, 1, 1, 1, 1, 1,
0.2369984, -0.8360237, 3.018035, 1, 1, 1, 1, 1,
0.2372917, 0.4055417, -0.6580948, 1, 1, 1, 1, 1,
0.2373636, -0.8179913, 2.80033, 1, 1, 1, 1, 1,
0.2374342, -1.525457, 2.929002, 1, 1, 1, 1, 1,
0.23963, 0.2656406, 1.521882, 1, 1, 1, 1, 1,
0.2408146, 0.02449125, 1.006713, 1, 1, 1, 1, 1,
0.2444473, -0.9537703, 2.244643, 1, 1, 1, 1, 1,
0.2456492, 0.8425338, 0.6886023, 1, 1, 1, 1, 1,
0.2472584, -0.8431001, 2.337214, 0, 0, 1, 1, 1,
0.2474439, -0.9204018, 2.885921, 1, 0, 0, 1, 1,
0.2505398, 1.079324, 0.6721036, 1, 0, 0, 1, 1,
0.2514996, -0.8735396, 3.217867, 1, 0, 0, 1, 1,
0.255115, -1.252072, 2.399993, 1, 0, 0, 1, 1,
0.2582199, -0.8463196, 3.129889, 1, 0, 0, 1, 1,
0.2589, 0.9767505, -0.7512802, 0, 0, 0, 1, 1,
0.260314, -0.2192617, 2.109364, 0, 0, 0, 1, 1,
0.2605181, 1.26202, 0.2405496, 0, 0, 0, 1, 1,
0.2633568, -0.8766788, 3.801611, 0, 0, 0, 1, 1,
0.2672068, 1.228233, 0.7629354, 0, 0, 0, 1, 1,
0.2717203, 1.733522, 0.1603726, 0, 0, 0, 1, 1,
0.2734435, 0.6099057, 0.5905593, 0, 0, 0, 1, 1,
0.2735319, 1.074082, 0.6337266, 1, 1, 1, 1, 1,
0.2756002, -0.4761546, 5.011446, 1, 1, 1, 1, 1,
0.2790459, 1.340581, 1.075, 1, 1, 1, 1, 1,
0.2812979, -0.9620689, 1.7955, 1, 1, 1, 1, 1,
0.2830701, 0.62706, 0.7937291, 1, 1, 1, 1, 1,
0.2837784, 0.3659062, 0.391747, 1, 1, 1, 1, 1,
0.2884912, 1.299084, 0.2872678, 1, 1, 1, 1, 1,
0.2971113, 1.573493, -0.5180784, 1, 1, 1, 1, 1,
0.3009987, 0.4581403, -0.4556828, 1, 1, 1, 1, 1,
0.3011235, -0.3342557, 2.176428, 1, 1, 1, 1, 1,
0.3034836, 1.73887, -0.3362214, 1, 1, 1, 1, 1,
0.3076648, 1.443677, -0.176712, 1, 1, 1, 1, 1,
0.3116623, 0.3824386, 1.192548, 1, 1, 1, 1, 1,
0.313554, 0.9772294, 0.4872875, 1, 1, 1, 1, 1,
0.3138904, -0.7169287, 2.166507, 1, 1, 1, 1, 1,
0.3200674, -0.6574991, 1.439905, 0, 0, 1, 1, 1,
0.3276563, 0.9146776, 1.357315, 1, 0, 0, 1, 1,
0.3332018, -0.6802269, 4.529846, 1, 0, 0, 1, 1,
0.3487677, 0.6605906, 0.8873317, 1, 0, 0, 1, 1,
0.3516604, -1.681952, 2.800042, 1, 0, 0, 1, 1,
0.3534713, 0.1955864, 0.1336292, 1, 0, 0, 1, 1,
0.3552763, 0.4101242, 1.625491, 0, 0, 0, 1, 1,
0.3602678, -0.5095198, 3.847184, 0, 0, 0, 1, 1,
0.360617, -0.9707831, 2.620869, 0, 0, 0, 1, 1,
0.3607834, 0.7507827, 0.7232748, 0, 0, 0, 1, 1,
0.3630198, 1.331143, -1.15411, 0, 0, 0, 1, 1,
0.3672929, 0.3454373, -0.5994642, 0, 0, 0, 1, 1,
0.3721339, 0.9758638, -0.09179017, 0, 0, 0, 1, 1,
0.3743263, -0.318313, 2.547079, 1, 1, 1, 1, 1,
0.3766357, 0.7660863, 0.3626315, 1, 1, 1, 1, 1,
0.3797475, -0.1591931, 1.449398, 1, 1, 1, 1, 1,
0.3804547, 0.3213832, 2.047432, 1, 1, 1, 1, 1,
0.3826447, 1.781413, 2.188043, 1, 1, 1, 1, 1,
0.3921964, 1.427443, 0.3825149, 1, 1, 1, 1, 1,
0.3941341, -0.7154515, 2.98432, 1, 1, 1, 1, 1,
0.4109214, -2.424371, 1.815077, 1, 1, 1, 1, 1,
0.4137876, -1.044057, 3.006155, 1, 1, 1, 1, 1,
0.4213077, 0.4555338, 3.63469, 1, 1, 1, 1, 1,
0.4258766, -0.3652334, 2.511815, 1, 1, 1, 1, 1,
0.4259017, 0.5974571, -0.2347094, 1, 1, 1, 1, 1,
0.4364114, -1.694674, 3.126985, 1, 1, 1, 1, 1,
0.4366129, 0.845192, -1.09807, 1, 1, 1, 1, 1,
0.4385208, 1.089054, 0.6443132, 1, 1, 1, 1, 1,
0.4387557, -1.374844, 3.323345, 0, 0, 1, 1, 1,
0.4405659, -0.009610965, 1.218307, 1, 0, 0, 1, 1,
0.4418846, 2.210602, 0.8171939, 1, 0, 0, 1, 1,
0.4419255, -0.6078129, 3.911334, 1, 0, 0, 1, 1,
0.447275, -1.671171, 3.122213, 1, 0, 0, 1, 1,
0.4498131, -0.5241112, 2.487418, 1, 0, 0, 1, 1,
0.4584877, 0.08921842, 2.768169, 0, 0, 0, 1, 1,
0.4588316, 0.06243604, 0.8673182, 0, 0, 0, 1, 1,
0.4610821, -1.510204, 3.070246, 0, 0, 0, 1, 1,
0.4614596, -0.02456282, 2.34719, 0, 0, 0, 1, 1,
0.4632955, -1.148609, 1.89648, 0, 0, 0, 1, 1,
0.4639233, -0.4707216, 2.908929, 0, 0, 0, 1, 1,
0.4652397, 0.9580625, 0.02591799, 0, 0, 0, 1, 1,
0.4670219, -0.2252529, 3.299673, 1, 1, 1, 1, 1,
0.469409, -1.971553, 3.857488, 1, 1, 1, 1, 1,
0.4703529, 1.482928, 1.011151, 1, 1, 1, 1, 1,
0.4721185, 0.511108, 1.499699, 1, 1, 1, 1, 1,
0.4753376, 1.02039, 1.749721, 1, 1, 1, 1, 1,
0.4765958, 0.3097634, 1.143853, 1, 1, 1, 1, 1,
0.481308, -1.229653, 3.883088, 1, 1, 1, 1, 1,
0.4827655, -0.125961, 1.586066, 1, 1, 1, 1, 1,
0.4895948, -0.2334152, 2.364227, 1, 1, 1, 1, 1,
0.4906859, 0.1992726, 1.602583, 1, 1, 1, 1, 1,
0.4945982, -0.4347988, 2.574147, 1, 1, 1, 1, 1,
0.4978632, -0.7908404, 2.173922, 1, 1, 1, 1, 1,
0.5016735, 0.5431958, 1.643665, 1, 1, 1, 1, 1,
0.5026109, -0.301076, 1.418641, 1, 1, 1, 1, 1,
0.5071015, 1.428022, -0.1869711, 1, 1, 1, 1, 1,
0.5092153, -0.1476299, 4.917645, 0, 0, 1, 1, 1,
0.5093158, 0.3469448, 0.3162129, 1, 0, 0, 1, 1,
0.5095522, -0.9429943, 1.648659, 1, 0, 0, 1, 1,
0.5140316, 0.1405251, 2.188526, 1, 0, 0, 1, 1,
0.5152926, -2.706939, 2.862729, 1, 0, 0, 1, 1,
0.5170405, -1.95571, 2.120397, 1, 0, 0, 1, 1,
0.523685, 0.5653804, 1.609334, 0, 0, 0, 1, 1,
0.5266555, 0.1319019, 1.136713, 0, 0, 0, 1, 1,
0.5301067, -0.1853339, 0.05239912, 0, 0, 0, 1, 1,
0.5370747, -0.6223101, 2.647047, 0, 0, 0, 1, 1,
0.5375043, -0.104561, 2.674037, 0, 0, 0, 1, 1,
0.543094, -1.512941, 2.008289, 0, 0, 0, 1, 1,
0.5447699, -2.557613, 1.565024, 0, 0, 0, 1, 1,
0.5476291, 0.974039, 1.292033, 1, 1, 1, 1, 1,
0.5498505, -0.09452119, 3.192769, 1, 1, 1, 1, 1,
0.5568821, 0.1796956, 1.862008, 1, 1, 1, 1, 1,
0.557102, -0.9807063, 2.702351, 1, 1, 1, 1, 1,
0.5585767, 0.1946055, 1.415634, 1, 1, 1, 1, 1,
0.5597906, -1.017676, 3.093861, 1, 1, 1, 1, 1,
0.5653738, 0.02914949, 2.632491, 1, 1, 1, 1, 1,
0.5659212, 0.2413263, 1.40475, 1, 1, 1, 1, 1,
0.5678468, 3.610096, -1.667574, 1, 1, 1, 1, 1,
0.5703852, 0.9167798, 0.1195421, 1, 1, 1, 1, 1,
0.5767038, -0.4126945, 1.70973, 1, 1, 1, 1, 1,
0.5782063, 1.011023, 0.2761826, 1, 1, 1, 1, 1,
0.5794584, -0.9350749, 2.172479, 1, 1, 1, 1, 1,
0.5823071, 0.7102553, 1.928448, 1, 1, 1, 1, 1,
0.5892239, -2.002424, 1.930753, 1, 1, 1, 1, 1,
0.5910357, -1.594287, 5.306262, 0, 0, 1, 1, 1,
0.6030099, 0.5693064, 0.5363353, 1, 0, 0, 1, 1,
0.6049497, 0.9766384, 0.3581968, 1, 0, 0, 1, 1,
0.6100355, -0.9682228, 4.075783, 1, 0, 0, 1, 1,
0.610292, -0.4774735, 1.263037, 1, 0, 0, 1, 1,
0.6193411, -0.7427754, 1.566186, 1, 0, 0, 1, 1,
0.6213396, 1.37471, 0.7744532, 0, 0, 0, 1, 1,
0.6245476, -0.9746045, 2.044774, 0, 0, 0, 1, 1,
0.6266599, -0.871286, 3.729123, 0, 0, 0, 1, 1,
0.6273351, 0.3180465, 1.89817, 0, 0, 0, 1, 1,
0.6315455, -0.7338035, 2.683855, 0, 0, 0, 1, 1,
0.6361524, -1.705003, 3.222073, 0, 0, 0, 1, 1,
0.6400272, -2.400845, 2.99063, 0, 0, 0, 1, 1,
0.6405068, 0.0302454, 2.446102, 1, 1, 1, 1, 1,
0.6413069, -0.04229993, 1.524219, 1, 1, 1, 1, 1,
0.6494392, -0.5005153, 1.002659, 1, 1, 1, 1, 1,
0.6503553, -0.05009567, 2.954822, 1, 1, 1, 1, 1,
0.6539274, -0.4222089, 4.411574, 1, 1, 1, 1, 1,
0.6557429, -0.3663067, 0.6340801, 1, 1, 1, 1, 1,
0.6606513, -0.6924062, 1.603161, 1, 1, 1, 1, 1,
0.6624246, 0.767397, 0.9427695, 1, 1, 1, 1, 1,
0.6650767, -0.9860023, 2.476768, 1, 1, 1, 1, 1,
0.6667844, -1.158185, 2.713349, 1, 1, 1, 1, 1,
0.6670988, -1.150939, 4.226149, 1, 1, 1, 1, 1,
0.6676515, 0.1499016, 2.096758, 1, 1, 1, 1, 1,
0.6724896, -0.92482, 3.235121, 1, 1, 1, 1, 1,
0.6744555, -0.1722614, 1.145068, 1, 1, 1, 1, 1,
0.6785121, -0.2140822, 3.108828, 1, 1, 1, 1, 1,
0.6814106, 0.1175249, 0.7024716, 0, 0, 1, 1, 1,
0.6867236, -0.8301767, 0.6933574, 1, 0, 0, 1, 1,
0.6878911, -1.447131, 1.794657, 1, 0, 0, 1, 1,
0.6878984, 0.6739234, 0.8241269, 1, 0, 0, 1, 1,
0.6881859, -0.3751667, 1.724176, 1, 0, 0, 1, 1,
0.6943166, 0.2176562, 1.330067, 1, 0, 0, 1, 1,
0.695181, 1.978944, 0.9257047, 0, 0, 0, 1, 1,
0.6953544, 0.4504043, 1.075859, 0, 0, 0, 1, 1,
0.6972705, -0.4607836, 2.175638, 0, 0, 0, 1, 1,
0.7006782, 3.243917, 0.6112784, 0, 0, 0, 1, 1,
0.7146441, 0.9014155, 0.2731008, 0, 0, 0, 1, 1,
0.7170101, 0.1101146, -0.3039338, 0, 0, 0, 1, 1,
0.7171648, -0.5962392, 0.9185826, 0, 0, 0, 1, 1,
0.7216956, 1.381435, 0.8631549, 1, 1, 1, 1, 1,
0.7223659, -0.9906663, 3.971524, 1, 1, 1, 1, 1,
0.7252151, 1.057378, -0.167384, 1, 1, 1, 1, 1,
0.7264235, 1.20595, 0.5425633, 1, 1, 1, 1, 1,
0.7284356, -0.1355008, 1.645582, 1, 1, 1, 1, 1,
0.7361053, 1.468602, -1.420378, 1, 1, 1, 1, 1,
0.739913, -0.9674979, 3.710618, 1, 1, 1, 1, 1,
0.7452481, -0.4486043, 2.538606, 1, 1, 1, 1, 1,
0.7473239, 1.301747, -1.24813, 1, 1, 1, 1, 1,
0.7484554, 0.5376023, 1.455784, 1, 1, 1, 1, 1,
0.7512092, -1.421778, 4.113363, 1, 1, 1, 1, 1,
0.7514878, 0.7934842, 0.4127568, 1, 1, 1, 1, 1,
0.7516189, -0.04507928, -0.1248862, 1, 1, 1, 1, 1,
0.752429, 0.08535532, 1.333004, 1, 1, 1, 1, 1,
0.7525058, -0.3279762, 1.955449, 1, 1, 1, 1, 1,
0.7570814, 0.231683, 1.175833, 0, 0, 1, 1, 1,
0.764821, -1.090821, 3.564724, 1, 0, 0, 1, 1,
0.7740712, -0.4367316, 3.414276, 1, 0, 0, 1, 1,
0.7767774, 0.9333293, 0.5540126, 1, 0, 0, 1, 1,
0.7780795, -1.459171, 3.652703, 1, 0, 0, 1, 1,
0.7929305, -1.357062, 1.567208, 1, 0, 0, 1, 1,
0.7935513, 0.7717381, 2.290775, 0, 0, 0, 1, 1,
0.8020542, 0.03788552, 2.504827, 0, 0, 0, 1, 1,
0.8041283, 0.1981885, 2.096557, 0, 0, 0, 1, 1,
0.8079843, 0.2109918, -0.2536191, 0, 0, 0, 1, 1,
0.8122127, 0.9708226, -0.5638947, 0, 0, 0, 1, 1,
0.8231787, -0.3037996, 2.230775, 0, 0, 0, 1, 1,
0.8240404, 2.607645, 0.5040063, 0, 0, 0, 1, 1,
0.82605, 0.5992931, 0.8171735, 1, 1, 1, 1, 1,
0.8286824, -0.9487398, 2.355942, 1, 1, 1, 1, 1,
0.8307589, -0.7893721, 1.59494, 1, 1, 1, 1, 1,
0.8376808, 0.6463907, 0.3745004, 1, 1, 1, 1, 1,
0.8381587, 0.2644401, 0.6862034, 1, 1, 1, 1, 1,
0.8446244, -0.9833065, 3.037909, 1, 1, 1, 1, 1,
0.84606, -0.614384, 1.187977, 1, 1, 1, 1, 1,
0.8476484, 1.128976, 1.988941, 1, 1, 1, 1, 1,
0.8535461, -1.56837, 3.414954, 1, 1, 1, 1, 1,
0.8551927, 0.4506822, 0.5403, 1, 1, 1, 1, 1,
0.8597941, 0.09356003, 1.322538, 1, 1, 1, 1, 1,
0.8615471, -0.6958328, 0.9750519, 1, 1, 1, 1, 1,
0.8622728, -1.646895, 1.792194, 1, 1, 1, 1, 1,
0.8625824, 1.417675, 0.1947236, 1, 1, 1, 1, 1,
0.8655338, -0.1880716, 3.168056, 1, 1, 1, 1, 1,
0.8696483, 0.1067803, 3.685786, 0, 0, 1, 1, 1,
0.891896, -1.918643, 3.146682, 1, 0, 0, 1, 1,
0.8935872, 0.007637082, 0.1338646, 1, 0, 0, 1, 1,
0.8968551, -0.4824847, 5.001135, 1, 0, 0, 1, 1,
0.9006698, -0.7729888, 1.235707, 1, 0, 0, 1, 1,
0.9075146, 0.02461723, 2.240618, 1, 0, 0, 1, 1,
0.9085379, 0.4922194, 0.1636607, 0, 0, 0, 1, 1,
0.9214696, -0.8836548, 1.847143, 0, 0, 0, 1, 1,
0.9291397, -1.285858, 2.952741, 0, 0, 0, 1, 1,
0.9342758, 0.8756797, 0.3798787, 0, 0, 0, 1, 1,
0.9374554, -2.059448, 2.044556, 0, 0, 0, 1, 1,
0.9406565, 0.7968155, 0.2171535, 0, 0, 0, 1, 1,
0.9415658, -0.3645018, 1.508478, 0, 0, 0, 1, 1,
0.9431721, 1.679746, -1.204536, 1, 1, 1, 1, 1,
0.9555429, 0.3783087, 1.546268, 1, 1, 1, 1, 1,
0.9578899, 1.49891, 1.280497, 1, 1, 1, 1, 1,
0.9676906, 0.08821262, -0.3734373, 1, 1, 1, 1, 1,
0.970831, 1.145286, 1.420568, 1, 1, 1, 1, 1,
0.9708874, -0.5580588, -0.8670272, 1, 1, 1, 1, 1,
0.9741338, 1.028749, 2.300939, 1, 1, 1, 1, 1,
0.9893691, -0.8886692, 1.825939, 1, 1, 1, 1, 1,
0.9977235, -0.5792497, 2.367997, 1, 1, 1, 1, 1,
1.000401, 0.412867, 0.9218163, 1, 1, 1, 1, 1,
1.001074, 0.1107837, 1.905826, 1, 1, 1, 1, 1,
1.013542, -0.05403045, 1.840765, 1, 1, 1, 1, 1,
1.01449, -0.8835215, 2.357327, 1, 1, 1, 1, 1,
1.032305, -0.3226604, 1.729801, 1, 1, 1, 1, 1,
1.034767, -1.144019, 2.783711, 1, 1, 1, 1, 1,
1.035536, 0.08558029, 1.841814, 0, 0, 1, 1, 1,
1.037133, 0.269468, 0.7915888, 1, 0, 0, 1, 1,
1.038763, -0.9380012, 2.027576, 1, 0, 0, 1, 1,
1.039325, -0.6388353, 0.9945505, 1, 0, 0, 1, 1,
1.054184, 0.4789308, 2.65328, 1, 0, 0, 1, 1,
1.055092, -0.7604137, 1.375873, 1, 0, 0, 1, 1,
1.057631, 0.6482036, 2.073134, 0, 0, 0, 1, 1,
1.059313, -0.05471442, 2.283325, 0, 0, 0, 1, 1,
1.059468, 0.1609906, 2.691557, 0, 0, 0, 1, 1,
1.061863, 0.3669934, 1.016466, 0, 0, 0, 1, 1,
1.067913, -1.062027, 3.945854, 0, 0, 0, 1, 1,
1.075556, 0.4778849, 0.07762589, 0, 0, 0, 1, 1,
1.080997, -1.066891, 3.469588, 0, 0, 0, 1, 1,
1.083299, -0.865881, 3.058076, 1, 1, 1, 1, 1,
1.094682, 1.345391, 0.6006238, 1, 1, 1, 1, 1,
1.101389, 0.9011211, -0.2584679, 1, 1, 1, 1, 1,
1.111686, 2.243476, -0.9239008, 1, 1, 1, 1, 1,
1.123041, -0.5729013, 1.339724, 1, 1, 1, 1, 1,
1.123522, -0.1137584, 2.184576, 1, 1, 1, 1, 1,
1.132526, 0.2984498, 2.746828, 1, 1, 1, 1, 1,
1.143062, 0.3062931, 1.016861, 1, 1, 1, 1, 1,
1.156821, -0.8296282, 1.724286, 1, 1, 1, 1, 1,
1.15822, 1.011623, 0.7576631, 1, 1, 1, 1, 1,
1.166445, 0.3989733, -0.01149403, 1, 1, 1, 1, 1,
1.179583, -1.065386, 2.68558, 1, 1, 1, 1, 1,
1.183313, 0.09974068, 0.8169834, 1, 1, 1, 1, 1,
1.190452, -1.09311, 3.43556, 1, 1, 1, 1, 1,
1.19139, 0.8796309, 1.466618, 1, 1, 1, 1, 1,
1.194701, 0.1961541, 0.4668246, 0, 0, 1, 1, 1,
1.194954, 1.54721, 1.780186, 1, 0, 0, 1, 1,
1.198459, 1.309778, 0.9753751, 1, 0, 0, 1, 1,
1.205481, -0.6982594, 1.240029, 1, 0, 0, 1, 1,
1.2069, 0.2048266, 2.33222, 1, 0, 0, 1, 1,
1.208699, -1.849034, 3.311826, 1, 0, 0, 1, 1,
1.212048, -0.6135604, 3.033135, 0, 0, 0, 1, 1,
1.215982, 0.2445822, 0.8073826, 0, 0, 0, 1, 1,
1.220287, -0.3829952, 3.237333, 0, 0, 0, 1, 1,
1.224991, -0.166476, 0.7151204, 0, 0, 0, 1, 1,
1.225301, -0.3513274, 2.601611, 0, 0, 0, 1, 1,
1.230652, -1.205572, 2.437625, 0, 0, 0, 1, 1,
1.233462, -1.116347, 2.050169, 0, 0, 0, 1, 1,
1.236319, -0.7812896, 3.078592, 1, 1, 1, 1, 1,
1.240207, 0.7690343, 1.30966, 1, 1, 1, 1, 1,
1.244084, 0.2575331, 1.171681, 1, 1, 1, 1, 1,
1.255297, 0.1726779, 1.04457, 1, 1, 1, 1, 1,
1.260028, -1.064821, 1.955238, 1, 1, 1, 1, 1,
1.269925, 1.154291, 0.4091589, 1, 1, 1, 1, 1,
1.273122, -0.755929, 0.8771583, 1, 1, 1, 1, 1,
1.289862, 0.1112917, 2.637924, 1, 1, 1, 1, 1,
1.296337, -0.3083847, 2.390699, 1, 1, 1, 1, 1,
1.306562, -0.5468902, 2.119333, 1, 1, 1, 1, 1,
1.307636, 0.3304468, 1.601851, 1, 1, 1, 1, 1,
1.31063, 0.2895024, 0.2153749, 1, 1, 1, 1, 1,
1.312386, 1.589378, -0.9961904, 1, 1, 1, 1, 1,
1.313417, 0.03795901, 1.179115, 1, 1, 1, 1, 1,
1.322384, 1.120122, 1.527149, 1, 1, 1, 1, 1,
1.323171, 0.4944759, 1.767348, 0, 0, 1, 1, 1,
1.323734, 1.091433, 1.559612, 1, 0, 0, 1, 1,
1.325377, -0.7853755, 1.214453, 1, 0, 0, 1, 1,
1.327821, -0.1402629, 1.297826, 1, 0, 0, 1, 1,
1.331929, -0.2790062, -1.062453, 1, 0, 0, 1, 1,
1.332965, -0.5349854, 3.37305, 1, 0, 0, 1, 1,
1.333012, -0.6306913, 2.825502, 0, 0, 0, 1, 1,
1.334107, 0.6590951, -0.1059911, 0, 0, 0, 1, 1,
1.349436, 1.228791, 0.6938834, 0, 0, 0, 1, 1,
1.356402, -0.6469749, 1.648834, 0, 0, 0, 1, 1,
1.363178, 0.8435836, 2.687247, 0, 0, 0, 1, 1,
1.366971, -1.221631, 1.287076, 0, 0, 0, 1, 1,
1.369355, -0.1445297, 1.332253, 0, 0, 0, 1, 1,
1.378393, 0.3736139, 0.536962, 1, 1, 1, 1, 1,
1.37969, -0.8451536, 1.90772, 1, 1, 1, 1, 1,
1.385859, -1.776753, 4.513819, 1, 1, 1, 1, 1,
1.400283, -0.7162561, 2.233, 1, 1, 1, 1, 1,
1.403071, -0.4629957, 1.871284, 1, 1, 1, 1, 1,
1.403818, 0.9195062, 1.986319, 1, 1, 1, 1, 1,
1.404206, -1.293365, 1.158812, 1, 1, 1, 1, 1,
1.405198, -0.1950515, 2.416856, 1, 1, 1, 1, 1,
1.407703, -0.8876662, 1.031796, 1, 1, 1, 1, 1,
1.411962, -0.1154298, 1.194509, 1, 1, 1, 1, 1,
1.427034, -0.3187162, 2.718835, 1, 1, 1, 1, 1,
1.438743, 0.7700047, 2.272319, 1, 1, 1, 1, 1,
1.442635, -0.7409125, 2.749235, 1, 1, 1, 1, 1,
1.44452, -0.2083334, -0.386365, 1, 1, 1, 1, 1,
1.453528, -0.2871435, -0.3796294, 1, 1, 1, 1, 1,
1.45393, 0.02893249, 0.2082938, 0, 0, 1, 1, 1,
1.47117, 0.5705629, 1.169426, 1, 0, 0, 1, 1,
1.477072, -1.322903, 2.760319, 1, 0, 0, 1, 1,
1.478415, 0.1635864, 1.326747, 1, 0, 0, 1, 1,
1.481225, -0.5609268, 1.514876, 1, 0, 0, 1, 1,
1.502474, -0.4230617, 2.137655, 1, 0, 0, 1, 1,
1.514684, -0.3286425, 2.936669, 0, 0, 0, 1, 1,
1.520694, 1.446018, 2.365013, 0, 0, 0, 1, 1,
1.529957, 0.02468009, 1.938996, 0, 0, 0, 1, 1,
1.53931, -2.509897, 4.296259, 0, 0, 0, 1, 1,
1.552784, -0.2633203, -0.4586486, 0, 0, 0, 1, 1,
1.557547, -0.4118452, 2.196979, 0, 0, 0, 1, 1,
1.565789, 1.283977, 0.1740552, 0, 0, 0, 1, 1,
1.580279, 1.217818, 2.441831, 1, 1, 1, 1, 1,
1.589585, -1.03176, 2.568736, 1, 1, 1, 1, 1,
1.592273, 0.3203307, 2.245074, 1, 1, 1, 1, 1,
1.615809, -0.0393161, 1.811787, 1, 1, 1, 1, 1,
1.642561, 0.2893544, 1.459912, 1, 1, 1, 1, 1,
1.643762, 0.8579434, 0.6518844, 1, 1, 1, 1, 1,
1.674295, 0.2836821, 0.4286851, 1, 1, 1, 1, 1,
1.679367, -1.857799, 3.693475, 1, 1, 1, 1, 1,
1.680682, 0.313271, 0.8402641, 1, 1, 1, 1, 1,
1.68201, -0.3702076, 2.29404, 1, 1, 1, 1, 1,
1.691064, 1.04516, 0.4680853, 1, 1, 1, 1, 1,
1.691308, -0.480155, 2.181768, 1, 1, 1, 1, 1,
1.695696, -0.1096825, 2.117465, 1, 1, 1, 1, 1,
1.698814, -0.1715501, 1.066975, 1, 1, 1, 1, 1,
1.714496, -0.1416871, 0.8194046, 1, 1, 1, 1, 1,
1.722113, 0.8991753, -0.2770385, 0, 0, 1, 1, 1,
1.724398, -0.4720994, 0.7446619, 1, 0, 0, 1, 1,
1.726267, 0.399755, 2.716056, 1, 0, 0, 1, 1,
1.74676, -0.08240499, 1.491809, 1, 0, 0, 1, 1,
1.756752, 0.2975026, 1.719337, 1, 0, 0, 1, 1,
1.769771, 0.2031548, 2.565805, 1, 0, 0, 1, 1,
1.773151, 0.06657599, 0.01054299, 0, 0, 0, 1, 1,
1.791539, 1.06305, 0.9417488, 0, 0, 0, 1, 1,
1.800954, 0.1590779, 2.593194, 0, 0, 0, 1, 1,
1.818902, 0.2442664, 0.810384, 0, 0, 0, 1, 1,
1.825412, 1.349341, 0.2187161, 0, 0, 0, 1, 1,
1.826194, -2.304786, 1.48073, 0, 0, 0, 1, 1,
1.850484, 1.233815, 3.139187, 0, 0, 0, 1, 1,
1.862069, -1.619303, 0.7367998, 1, 1, 1, 1, 1,
1.8636, 0.01117651, 0.5461217, 1, 1, 1, 1, 1,
1.875005, -1.322642, 0.7503073, 1, 1, 1, 1, 1,
1.881782, -2.144314, 2.090416, 1, 1, 1, 1, 1,
1.905468, -0.3633696, 1.061134, 1, 1, 1, 1, 1,
1.91147, -0.9382485, 2.27373, 1, 1, 1, 1, 1,
1.926, 0.6997147, 2.035123, 1, 1, 1, 1, 1,
1.937193, -0.1294078, 1.750092, 1, 1, 1, 1, 1,
1.940064, 0.1571645, 1.660286, 1, 1, 1, 1, 1,
1.948172, 0.05256368, 1.214286, 1, 1, 1, 1, 1,
1.956819, -0.4554279, 0.09379947, 1, 1, 1, 1, 1,
2.01706, 1.092267, 1.618053, 1, 1, 1, 1, 1,
2.071218, 1.27412, 2.056428, 1, 1, 1, 1, 1,
2.089335, 0.4930722, 1.669276, 1, 1, 1, 1, 1,
2.092711, 0.5301203, 1.421834, 1, 1, 1, 1, 1,
2.109136, 1.477932, 0.9442019, 0, 0, 1, 1, 1,
2.112918, -0.5262724, 3.142318, 1, 0, 0, 1, 1,
2.134388, 1.363651, 0.05574384, 1, 0, 0, 1, 1,
2.162583, -0.1255843, 1.950517, 1, 0, 0, 1, 1,
2.170479, 1.441988, 0.633169, 1, 0, 0, 1, 1,
2.177682, 0.3953435, 2.258382, 1, 0, 0, 1, 1,
2.181093, -0.7983125, 3.283208, 0, 0, 0, 1, 1,
2.183588, -0.06748176, 1.425933, 0, 0, 0, 1, 1,
2.222094, 0.8795104, 0.4291617, 0, 0, 0, 1, 1,
2.234566, -1.24201, 1.975636, 0, 0, 0, 1, 1,
2.247539, 0.5054979, -0.06851456, 0, 0, 0, 1, 1,
2.248318, -1.630445, 2.027784, 0, 0, 0, 1, 1,
2.261258, -1.221291, 3.729688, 0, 0, 0, 1, 1,
2.305043, 1.846143, 0.9555645, 1, 1, 1, 1, 1,
2.309449, 0.6821136, -0.2342703, 1, 1, 1, 1, 1,
2.333467, 0.1580036, 1.461543, 1, 1, 1, 1, 1,
2.352564, -1.153566, 2.300681, 1, 1, 1, 1, 1,
2.444201, -0.9854869, 2.924786, 1, 1, 1, 1, 1,
2.720071, -1.095742, 1.621216, 1, 1, 1, 1, 1,
2.73451, 1.569066, 2.151042, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.71177;
var distance = 34.11218;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.4396031, -0.3511604, 0.0008490086 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11218);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
