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
-3.425528, 1.357621, -2.433336, 1, 0, 0, 1,
-3.017058, 0.3434762, -2.281128, 1, 0.007843138, 0, 1,
-2.626415, -0.6082813, -1.246709, 1, 0.01176471, 0, 1,
-2.592127, 0.3906605, -2.027526, 1, 0.01960784, 0, 1,
-2.575865, 0.9295418, -0.61704, 1, 0.02352941, 0, 1,
-2.554538, 0.4439653, -1.534828, 1, 0.03137255, 0, 1,
-2.543548, 1.437754, -3.195704, 1, 0.03529412, 0, 1,
-2.514112, -0.08966854, -1.734982, 1, 0.04313726, 0, 1,
-2.462943, -1.5989, -1.75016, 1, 0.04705882, 0, 1,
-2.428962, 1.977534, -0.4409429, 1, 0.05490196, 0, 1,
-2.345881, 2.102225, -1.077034, 1, 0.05882353, 0, 1,
-2.187104, -1.591105, -1.665058, 1, 0.06666667, 0, 1,
-2.148355, -1.420666, -3.297029, 1, 0.07058824, 0, 1,
-2.145831, 0.2849851, 0.2356921, 1, 0.07843138, 0, 1,
-2.092899, 0.9446799, -1.364361, 1, 0.08235294, 0, 1,
-2.014829, -0.5796651, -1.641922, 1, 0.09019608, 0, 1,
-2.010152, 0.0301307, -1.172171, 1, 0.09411765, 0, 1,
-1.936485, 0.4993897, -2.283323, 1, 0.1019608, 0, 1,
-1.930248, -1.276217, -1.797608, 1, 0.1098039, 0, 1,
-1.928137, 1.015675, -0.8907226, 1, 0.1137255, 0, 1,
-1.899338, 0.6082944, -1.270876, 1, 0.1215686, 0, 1,
-1.896998, 0.190068, -3.311796, 1, 0.1254902, 0, 1,
-1.896749, -0.8900185, -2.128664, 1, 0.1333333, 0, 1,
-1.892843, 0.9765047, -3.282542, 1, 0.1372549, 0, 1,
-1.870749, -1.874705, -2.721197, 1, 0.145098, 0, 1,
-1.870177, -0.7568976, 0.6278518, 1, 0.1490196, 0, 1,
-1.86272, 0.002115631, 0.766253, 1, 0.1568628, 0, 1,
-1.859943, -0.8102995, -2.514489, 1, 0.1607843, 0, 1,
-1.852565, -1.691208, -0.627007, 1, 0.1686275, 0, 1,
-1.828005, -2.186753, -3.151909, 1, 0.172549, 0, 1,
-1.824158, 1.362188, -2.691081, 1, 0.1803922, 0, 1,
-1.800679, 0.9832581, -0.9974759, 1, 0.1843137, 0, 1,
-1.79546, -0.01407177, -2.075942, 1, 0.1921569, 0, 1,
-1.780392, -0.5294625, -0.2785474, 1, 0.1960784, 0, 1,
-1.744206, 0.6835197, -2.72963, 1, 0.2039216, 0, 1,
-1.726077, 0.05824959, -0.7318816, 1, 0.2117647, 0, 1,
-1.72376, -0.03929414, -1.801213, 1, 0.2156863, 0, 1,
-1.70975, -0.8791837, -0.9047645, 1, 0.2235294, 0, 1,
-1.707846, -0.984444, -1.340212, 1, 0.227451, 0, 1,
-1.7029, 0.6078366, -3.672355, 1, 0.2352941, 0, 1,
-1.692385, -0.6156896, 0.3347879, 1, 0.2392157, 0, 1,
-1.652803, 0.1774673, -0.9419786, 1, 0.2470588, 0, 1,
-1.652784, -0.5050443, -3.356181, 1, 0.2509804, 0, 1,
-1.586582, -0.3199804, -2.589651, 1, 0.2588235, 0, 1,
-1.579987, 0.205681, -2.191691, 1, 0.2627451, 0, 1,
-1.568668, 0.5019062, -0.929792, 1, 0.2705882, 0, 1,
-1.555607, -0.7165828, -0.3277181, 1, 0.2745098, 0, 1,
-1.550319, 0.04718367, -1.332968, 1, 0.282353, 0, 1,
-1.543012, 0.9189456, 0.003977257, 1, 0.2862745, 0, 1,
-1.531846, -1.165508, -3.347719, 1, 0.2941177, 0, 1,
-1.530446, 1.667928, -0.4714646, 1, 0.3019608, 0, 1,
-1.509116, -1.687985, -2.161592, 1, 0.3058824, 0, 1,
-1.497217, -1.18257, 0.1559767, 1, 0.3137255, 0, 1,
-1.486323, 0.6535804, -0.1119021, 1, 0.3176471, 0, 1,
-1.484588, 0.2191548, -0.9258741, 1, 0.3254902, 0, 1,
-1.48362, -1.183639, -2.023256, 1, 0.3294118, 0, 1,
-1.483541, -0.7457467, -1.369075, 1, 0.3372549, 0, 1,
-1.479129, 0.6120532, -0.5866966, 1, 0.3411765, 0, 1,
-1.470243, 0.3217301, -0.4685179, 1, 0.3490196, 0, 1,
-1.469872, 0.02193596, 0.3366556, 1, 0.3529412, 0, 1,
-1.468878, -0.3218746, -3.24854, 1, 0.3607843, 0, 1,
-1.463184, -0.09247447, 0.4951245, 1, 0.3647059, 0, 1,
-1.455521, 0.4790663, -1.782175, 1, 0.372549, 0, 1,
-1.454297, 0.7489579, -1.258642, 1, 0.3764706, 0, 1,
-1.429282, 0.9362894, -0.4586648, 1, 0.3843137, 0, 1,
-1.427695, -0.7212124, -3.197507, 1, 0.3882353, 0, 1,
-1.422281, -0.519299, -1.297468, 1, 0.3960784, 0, 1,
-1.415115, -0.1300517, -0.5816031, 1, 0.4039216, 0, 1,
-1.414723, 1.108075, -0.6576638, 1, 0.4078431, 0, 1,
-1.409383, -0.9573648, -1.856982, 1, 0.4156863, 0, 1,
-1.405583, 0.2671246, -1.83241, 1, 0.4196078, 0, 1,
-1.405141, 3.061936, -0.0961946, 1, 0.427451, 0, 1,
-1.400935, -1.381813, -3.062927, 1, 0.4313726, 0, 1,
-1.396968, -0.4105693, -2.735733, 1, 0.4392157, 0, 1,
-1.390274, 0.2219296, -2.513256, 1, 0.4431373, 0, 1,
-1.388201, -0.8156897, -1.571475, 1, 0.4509804, 0, 1,
-1.385477, -1.641659, -1.946674, 1, 0.454902, 0, 1,
-1.384424, 0.4650855, -1.36287, 1, 0.4627451, 0, 1,
-1.376912, 2.377801, -0.9116698, 1, 0.4666667, 0, 1,
-1.362491, -0.05597068, -0.9986914, 1, 0.4745098, 0, 1,
-1.362113, 0.2137238, -3.209913, 1, 0.4784314, 0, 1,
-1.352049, -0.7322866, -1.52557, 1, 0.4862745, 0, 1,
-1.346662, 1.375993, 1.013668, 1, 0.4901961, 0, 1,
-1.344355, 0.8618653, -1.357749, 1, 0.4980392, 0, 1,
-1.339564, 0.08594418, -1.227567, 1, 0.5058824, 0, 1,
-1.339467, -1.76709, -2.28529, 1, 0.509804, 0, 1,
-1.316863, 0.2752571, -0.6476398, 1, 0.5176471, 0, 1,
-1.311162, 1.288098, -0.3695884, 1, 0.5215687, 0, 1,
-1.31061, -0.2565914, -1.071576, 1, 0.5294118, 0, 1,
-1.303913, 0.7163863, -1.619558, 1, 0.5333334, 0, 1,
-1.297062, -0.128844, -1.264055, 1, 0.5411765, 0, 1,
-1.295307, 0.6620755, 0.2633466, 1, 0.5450981, 0, 1,
-1.292411, 0.296386, -1.979447, 1, 0.5529412, 0, 1,
-1.291032, -1.414037, -2.981023, 1, 0.5568628, 0, 1,
-1.265359, -1.238803, -0.8169203, 1, 0.5647059, 0, 1,
-1.263001, 1.520083, 0.6029916, 1, 0.5686275, 0, 1,
-1.253752, -1.176289, -2.24738, 1, 0.5764706, 0, 1,
-1.247508, 0.8690423, 0.6174511, 1, 0.5803922, 0, 1,
-1.247037, 0.2584151, -2.401576, 1, 0.5882353, 0, 1,
-1.245366, -0.2779285, -0.8295229, 1, 0.5921569, 0, 1,
-1.24407, 0.5220446, -1.308884, 1, 0.6, 0, 1,
-1.242852, 0.6870839, 0.3548628, 1, 0.6078432, 0, 1,
-1.241461, -1.145437, -1.607437, 1, 0.6117647, 0, 1,
-1.213328, -1.392526, -3.204789, 1, 0.6196079, 0, 1,
-1.211887, -0.4181325, -0.9958456, 1, 0.6235294, 0, 1,
-1.206484, -0.3050667, -3.241619, 1, 0.6313726, 0, 1,
-1.205704, 0.7971947, -1.48043, 1, 0.6352941, 0, 1,
-1.205369, 1.727973, 0.3692432, 1, 0.6431373, 0, 1,
-1.203927, -1.131199, -3.190921, 1, 0.6470588, 0, 1,
-1.202648, 0.05674627, 0.3991637, 1, 0.654902, 0, 1,
-1.202076, 1.07629, -1.568342, 1, 0.6588235, 0, 1,
-1.194711, -2.169993, -2.801426, 1, 0.6666667, 0, 1,
-1.194467, -1.782062, -2.596708, 1, 0.6705883, 0, 1,
-1.180547, 2.252959, 0.361761, 1, 0.6784314, 0, 1,
-1.180163, -0.6026196, -1.313403, 1, 0.682353, 0, 1,
-1.177287, 1.159277, 0.4551924, 1, 0.6901961, 0, 1,
-1.172321, 1.227317, 0.3902509, 1, 0.6941177, 0, 1,
-1.165568, 0.7213166, 0.1314478, 1, 0.7019608, 0, 1,
-1.157594, 0.2309691, -1.981886, 1, 0.7098039, 0, 1,
-1.155875, -0.3161699, -2.197782, 1, 0.7137255, 0, 1,
-1.155363, -1.978867, -2.965818, 1, 0.7215686, 0, 1,
-1.150635, -0.3787328, -2.34086, 1, 0.7254902, 0, 1,
-1.145216, 0.08592285, -0.2782294, 1, 0.7333333, 0, 1,
-1.12797, 0.2722939, -1.554672, 1, 0.7372549, 0, 1,
-1.120425, -0.9295464, -2.697842, 1, 0.7450981, 0, 1,
-1.118127, 0.5942138, -0.422946, 1, 0.7490196, 0, 1,
-1.112728, 0.2644456, -2.026373, 1, 0.7568628, 0, 1,
-1.10289, -1.575632, -2.037625, 1, 0.7607843, 0, 1,
-1.099157, 0.4690009, -1.128924, 1, 0.7686275, 0, 1,
-1.09902, 1.602346, 0.7071853, 1, 0.772549, 0, 1,
-1.081129, 0.1491466, -2.874366, 1, 0.7803922, 0, 1,
-1.067869, 0.7186272, -2.254038, 1, 0.7843137, 0, 1,
-1.067079, 0.01241645, -1.138808, 1, 0.7921569, 0, 1,
-1.066317, -0.1257173, -2.481472, 1, 0.7960784, 0, 1,
-1.065465, -0.7993557, -1.406758, 1, 0.8039216, 0, 1,
-1.062028, -0.3265992, -1.135105, 1, 0.8117647, 0, 1,
-1.061447, 0.5913339, -0.7830525, 1, 0.8156863, 0, 1,
-1.05791, -2.14206, -2.820554, 1, 0.8235294, 0, 1,
-1.056889, -0.5036671, -1.967726, 1, 0.827451, 0, 1,
-1.049179, -1.165795, -4.548291, 1, 0.8352941, 0, 1,
-1.047617, 1.084724, -1.040905, 1, 0.8392157, 0, 1,
-1.040206, 0.1029846, -1.747205, 1, 0.8470588, 0, 1,
-1.039516, 1.137538, -0.9424468, 1, 0.8509804, 0, 1,
-1.03561, 0.8229749, -0.1173864, 1, 0.8588235, 0, 1,
-1.034804, 0.05293283, -2.346616, 1, 0.8627451, 0, 1,
-1.018, 0.01406351, 0.7754811, 1, 0.8705882, 0, 1,
-1.010393, -0.113255, -1.600671, 1, 0.8745098, 0, 1,
-1.008095, -0.1531138, -1.971573, 1, 0.8823529, 0, 1,
-1.007483, -0.2611407, -2.944166, 1, 0.8862745, 0, 1,
-1.005461, 1.897928, -1.744481, 1, 0.8941177, 0, 1,
-1.003593, -0.2187586, -0.9538736, 1, 0.8980392, 0, 1,
-1.002971, 0.8170043, -3.082386, 1, 0.9058824, 0, 1,
-1.002948, 0.5412667, -1.240928, 1, 0.9137255, 0, 1,
-0.9997296, -1.442254, -3.394111, 1, 0.9176471, 0, 1,
-0.9898966, 0.495797, 1.013621, 1, 0.9254902, 0, 1,
-0.9885185, -0.5224103, -2.268277, 1, 0.9294118, 0, 1,
-0.9870583, 0.6241599, -0.7354579, 1, 0.9372549, 0, 1,
-0.98692, 0.6314837, -0.9922245, 1, 0.9411765, 0, 1,
-0.982243, 0.5696533, -1.433488, 1, 0.9490196, 0, 1,
-0.9820721, -0.5923185, -0.7031335, 1, 0.9529412, 0, 1,
-0.9807181, 2.34193, 0.156912, 1, 0.9607843, 0, 1,
-0.9762638, 1.402654, -1.302564, 1, 0.9647059, 0, 1,
-0.9704256, -1.037354, -1.573205, 1, 0.972549, 0, 1,
-0.9664639, 1.308597, -1.184243, 1, 0.9764706, 0, 1,
-0.9657388, -0.7668004, -1.216668, 1, 0.9843137, 0, 1,
-0.959505, -0.1850964, -1.867549, 1, 0.9882353, 0, 1,
-0.9539746, 1.447384, 0.612928, 1, 0.9960784, 0, 1,
-0.9538487, 0.8954508, -0.5799181, 0.9960784, 1, 0, 1,
-0.946204, 0.4290851, -0.3424736, 0.9921569, 1, 0, 1,
-0.9430284, 0.7086254, -0.9185808, 0.9843137, 1, 0, 1,
-0.9415308, 1.777439, -0.8540349, 0.9803922, 1, 0, 1,
-0.9386356, -0.9841549, -2.842077, 0.972549, 1, 0, 1,
-0.9356093, -1.188509, -3.561021, 0.9686275, 1, 0, 1,
-0.9280432, 0.7418113, -1.376968, 0.9607843, 1, 0, 1,
-0.9075198, 0.1664823, -0.7365755, 0.9568627, 1, 0, 1,
-0.9073667, -0.1676545, -1.025075, 0.9490196, 1, 0, 1,
-0.9057224, 1.838498, 0.08348318, 0.945098, 1, 0, 1,
-0.8963776, 0.1693442, -0.1046599, 0.9372549, 1, 0, 1,
-0.8958318, 0.01946497, -1.006338, 0.9333333, 1, 0, 1,
-0.8954623, -0.9887978, -1.933926, 0.9254902, 1, 0, 1,
-0.8936673, -1.439407, -4.087371, 0.9215686, 1, 0, 1,
-0.8936294, -1.224884, -2.426746, 0.9137255, 1, 0, 1,
-0.8935597, -0.1149331, 0.4554001, 0.9098039, 1, 0, 1,
-0.8866046, -2.30777, -3.149838, 0.9019608, 1, 0, 1,
-0.8864759, -0.5070549, -3.399562, 0.8941177, 1, 0, 1,
-0.8858585, 1.953275, -0.6466961, 0.8901961, 1, 0, 1,
-0.8839118, -1.192253, -1.332893, 0.8823529, 1, 0, 1,
-0.8808889, 1.512489, -0.3370501, 0.8784314, 1, 0, 1,
-0.8792923, 1.716224, -1.411414, 0.8705882, 1, 0, 1,
-0.8786553, 1.255932, 0.3935682, 0.8666667, 1, 0, 1,
-0.8729816, -1.893808, -1.175487, 0.8588235, 1, 0, 1,
-0.8727836, -1.123869, -3.225349, 0.854902, 1, 0, 1,
-0.8709532, 1.519742, 1.21786, 0.8470588, 1, 0, 1,
-0.8677533, 0.9712195, -1.08042, 0.8431373, 1, 0, 1,
-0.8571624, -1.695444, -4.470161, 0.8352941, 1, 0, 1,
-0.8486728, 1.487233, -0.7828249, 0.8313726, 1, 0, 1,
-0.8458357, -1.390218, -5.392043, 0.8235294, 1, 0, 1,
-0.845421, -1.382578, -4.219983, 0.8196079, 1, 0, 1,
-0.8425475, -1.25159, -2.627385, 0.8117647, 1, 0, 1,
-0.8419379, 1.001998, -0.5072513, 0.8078431, 1, 0, 1,
-0.8416172, 1.245685, -1.381317, 0.8, 1, 0, 1,
-0.8377087, 0.2453744, -0.9946038, 0.7921569, 1, 0, 1,
-0.8316937, -0.8494201, -2.377017, 0.7882353, 1, 0, 1,
-0.831596, 1.525944, 0.2487867, 0.7803922, 1, 0, 1,
-0.8296494, -2.13041, -2.758502, 0.7764706, 1, 0, 1,
-0.8296319, 1.307078, -2.279124, 0.7686275, 1, 0, 1,
-0.8270132, 0.6633474, -3.153385, 0.7647059, 1, 0, 1,
-0.8266275, 1.876632, -0.2440957, 0.7568628, 1, 0, 1,
-0.8209641, 0.1527616, -1.717199, 0.7529412, 1, 0, 1,
-0.8138366, -0.6409774, -1.127427, 0.7450981, 1, 0, 1,
-0.8123621, -0.7882032, -2.077552, 0.7411765, 1, 0, 1,
-0.8098292, -0.120645, -1.917221, 0.7333333, 1, 0, 1,
-0.8096887, 0.07355964, -1.778347, 0.7294118, 1, 0, 1,
-0.8092672, 0.3281087, 0.7063459, 0.7215686, 1, 0, 1,
-0.8076782, -0.6328394, -2.781392, 0.7176471, 1, 0, 1,
-0.8075413, 0.2625534, -0.5097155, 0.7098039, 1, 0, 1,
-0.806211, 1.042935, -0.9543509, 0.7058824, 1, 0, 1,
-0.8009531, -0.2889792, -2.353785, 0.6980392, 1, 0, 1,
-0.797334, 0.4798645, 0.0043719, 0.6901961, 1, 0, 1,
-0.7973019, 0.2524541, -0.5689263, 0.6862745, 1, 0, 1,
-0.7956434, 0.8981014, -1.12339, 0.6784314, 1, 0, 1,
-0.7941824, 1.786289, -0.2617632, 0.6745098, 1, 0, 1,
-0.7938414, 1.012911, -0.9528431, 0.6666667, 1, 0, 1,
-0.7932226, -0.3364627, -1.415791, 0.6627451, 1, 0, 1,
-0.7855842, -0.1648011, -0.5940501, 0.654902, 1, 0, 1,
-0.7854756, -0.4647063, -0.6194158, 0.6509804, 1, 0, 1,
-0.7830319, -0.7654533, -1.497806, 0.6431373, 1, 0, 1,
-0.7811886, 0.8208056, -0.5385419, 0.6392157, 1, 0, 1,
-0.7741125, 0.2355461, -0.9998524, 0.6313726, 1, 0, 1,
-0.7669143, -1.708208, -1.213535, 0.627451, 1, 0, 1,
-0.7594293, -1.781026, -4.203841, 0.6196079, 1, 0, 1,
-0.7539595, -0.2737699, -3.374778, 0.6156863, 1, 0, 1,
-0.7370278, 0.6936911, 0.4221675, 0.6078432, 1, 0, 1,
-0.7363799, 0.2400341, -1.58234, 0.6039216, 1, 0, 1,
-0.7302614, -1.279474, -1.778198, 0.5960785, 1, 0, 1,
-0.7297248, 0.5102417, -1.226761, 0.5882353, 1, 0, 1,
-0.7235555, -1.837804, -1.262333, 0.5843138, 1, 0, 1,
-0.7231646, 1.614525, -1.054789, 0.5764706, 1, 0, 1,
-0.716906, 1.383491, -0.643747, 0.572549, 1, 0, 1,
-0.7135016, -0.9173524, -2.758171, 0.5647059, 1, 0, 1,
-0.7131523, 0.3442127, -0.9218838, 0.5607843, 1, 0, 1,
-0.711809, 0.03629362, -1.792219, 0.5529412, 1, 0, 1,
-0.7112479, 0.1568466, -0.7698706, 0.5490196, 1, 0, 1,
-0.7095833, -1.175316, -1.821187, 0.5411765, 1, 0, 1,
-0.7093479, -1.162022, -3.15057, 0.5372549, 1, 0, 1,
-0.7054847, -1.302284, -1.238986, 0.5294118, 1, 0, 1,
-0.7016617, 0.2054837, -0.8878045, 0.5254902, 1, 0, 1,
-0.7003433, -0.1940313, -2.149283, 0.5176471, 1, 0, 1,
-0.6998122, 0.5253899, 1.329259, 0.5137255, 1, 0, 1,
-0.6985561, 1.279714, -1.792283, 0.5058824, 1, 0, 1,
-0.697448, -1.232431, -0.9492473, 0.5019608, 1, 0, 1,
-0.6954629, -0.3501643, -1.73915, 0.4941176, 1, 0, 1,
-0.693703, -0.121375, -0.3143535, 0.4862745, 1, 0, 1,
-0.6897061, -0.2335204, -1.019605, 0.4823529, 1, 0, 1,
-0.6891838, -2.605156, -4.826184, 0.4745098, 1, 0, 1,
-0.6886714, 0.2412401, -0.7141405, 0.4705882, 1, 0, 1,
-0.6873681, 0.1708336, -1.723462, 0.4627451, 1, 0, 1,
-0.6848402, -0.7931641, -1.777425, 0.4588235, 1, 0, 1,
-0.6826571, 0.6056843, -0.6661419, 0.4509804, 1, 0, 1,
-0.6810471, 0.954038, 1.07286, 0.4470588, 1, 0, 1,
-0.6793156, 0.06450368, -1.53634, 0.4392157, 1, 0, 1,
-0.6710346, 1.474469, -1.274628, 0.4352941, 1, 0, 1,
-0.66984, -1.01076, -2.494756, 0.427451, 1, 0, 1,
-0.6666508, 1.737508, 0.4320874, 0.4235294, 1, 0, 1,
-0.6635329, 1.09531, 1.500569, 0.4156863, 1, 0, 1,
-0.6632202, -0.5763937, -2.289385, 0.4117647, 1, 0, 1,
-0.6628124, 1.372638, -0.05429215, 0.4039216, 1, 0, 1,
-0.6616203, 1.240772, -0.4617107, 0.3960784, 1, 0, 1,
-0.6572376, 1.141078, -0.7508904, 0.3921569, 1, 0, 1,
-0.6508874, -0.2306591, -1.960988, 0.3843137, 1, 0, 1,
-0.6484625, -1.308095, -3.5144, 0.3803922, 1, 0, 1,
-0.6481654, -0.4544487, -1.557768, 0.372549, 1, 0, 1,
-0.6480595, 0.7475842, -0.6956131, 0.3686275, 1, 0, 1,
-0.6430199, 1.011485, 0.6345519, 0.3607843, 1, 0, 1,
-0.6412417, 0.2780876, 0.06540552, 0.3568628, 1, 0, 1,
-0.6372948, -1.080059, -3.607779, 0.3490196, 1, 0, 1,
-0.6344478, -0.465052, -1.647983, 0.345098, 1, 0, 1,
-0.6318724, -0.938364, -0.9573032, 0.3372549, 1, 0, 1,
-0.6225787, 0.6926157, 0.3217149, 0.3333333, 1, 0, 1,
-0.6144817, 0.4238593, -0.2107873, 0.3254902, 1, 0, 1,
-0.6088745, 1.383362, 1.397027, 0.3215686, 1, 0, 1,
-0.6081308, -0.5954974, -4.525221, 0.3137255, 1, 0, 1,
-0.6046689, -0.3743822, -2.197282, 0.3098039, 1, 0, 1,
-0.6038129, 2.408994, 0.8242344, 0.3019608, 1, 0, 1,
-0.6027686, 1.024236, 0.257873, 0.2941177, 1, 0, 1,
-0.6027142, -0.7054664, -3.932813, 0.2901961, 1, 0, 1,
-0.6023722, -0.7177823, -3.010649, 0.282353, 1, 0, 1,
-0.6007596, 1.188514, -0.5445901, 0.2784314, 1, 0, 1,
-0.6005765, 1.071709, 0.5984191, 0.2705882, 1, 0, 1,
-0.5977319, -0.6857182, -4.306599, 0.2666667, 1, 0, 1,
-0.5975326, -2.459651, -1.976905, 0.2588235, 1, 0, 1,
-0.5973448, -0.3419602, -2.676212, 0.254902, 1, 0, 1,
-0.5920727, -0.6872255, -2.200352, 0.2470588, 1, 0, 1,
-0.5818079, -0.3288207, -1.673796, 0.2431373, 1, 0, 1,
-0.5739359, 1.079712, -1.720695, 0.2352941, 1, 0, 1,
-0.5729663, 0.7475277, -2.937082, 0.2313726, 1, 0, 1,
-0.5691978, -0.523033, -1.263789, 0.2235294, 1, 0, 1,
-0.5646034, 0.6160323, -0.8741308, 0.2196078, 1, 0, 1,
-0.5619251, -0.3437807, -2.838262, 0.2117647, 1, 0, 1,
-0.560782, 1.428741, -1.541343, 0.2078431, 1, 0, 1,
-0.5497805, -0.9353087, -1.772611, 0.2, 1, 0, 1,
-0.5496648, -2.866578, -1.529086, 0.1921569, 1, 0, 1,
-0.5451492, 0.7751542, 1.466028, 0.1882353, 1, 0, 1,
-0.5436613, 0.5166172, -0.6695125, 0.1803922, 1, 0, 1,
-0.5420039, -0.8937919, -2.14929, 0.1764706, 1, 0, 1,
-0.5402976, -0.7028213, -1.23672, 0.1686275, 1, 0, 1,
-0.5374871, 0.7622078, 0.9249438, 0.1647059, 1, 0, 1,
-0.5354465, 0.3694394, 0.2306399, 0.1568628, 1, 0, 1,
-0.5312495, -1.642922, -2.278277, 0.1529412, 1, 0, 1,
-0.53027, -1.092793, -3.127665, 0.145098, 1, 0, 1,
-0.5273615, 0.9418291, -1.248675, 0.1411765, 1, 0, 1,
-0.5238633, -1.36781, -2.862016, 0.1333333, 1, 0, 1,
-0.5235685, -0.7416439, -2.992172, 0.1294118, 1, 0, 1,
-0.5231656, -0.8301017, -2.914752, 0.1215686, 1, 0, 1,
-0.5174939, 0.1448947, -0.4762329, 0.1176471, 1, 0, 1,
-0.5113335, -0.8824396, -3.639492, 0.1098039, 1, 0, 1,
-0.5081975, 0.1890062, -1.327657, 0.1058824, 1, 0, 1,
-0.5039409, 0.714831, -1.130761, 0.09803922, 1, 0, 1,
-0.5018336, 0.2519476, 0.7453512, 0.09019608, 1, 0, 1,
-0.4920222, 1.168996, 0.1452406, 0.08627451, 1, 0, 1,
-0.4845534, -0.1942442, -2.512266, 0.07843138, 1, 0, 1,
-0.4845117, -2.316329, -3.703052, 0.07450981, 1, 0, 1,
-0.4838926, -1.297561, -3.01544, 0.06666667, 1, 0, 1,
-0.4837637, -0.9938784, -2.229872, 0.0627451, 1, 0, 1,
-0.4822214, 0.7074433, 0.5731444, 0.05490196, 1, 0, 1,
-0.4820156, 2.310945, 0.8926088, 0.05098039, 1, 0, 1,
-0.4779912, -0.04300104, -2.472191, 0.04313726, 1, 0, 1,
-0.4742411, -0.9997795, -2.322407, 0.03921569, 1, 0, 1,
-0.471875, -0.1091093, -0.8120568, 0.03137255, 1, 0, 1,
-0.4713627, 1.435737, -1.329474, 0.02745098, 1, 0, 1,
-0.4691379, -0.8406197, -3.38067, 0.01960784, 1, 0, 1,
-0.4681929, 0.2645096, -1.928173, 0.01568628, 1, 0, 1,
-0.4654337, 1.089134, -0.315333, 0.007843138, 1, 0, 1,
-0.4653534, -2.803927, -2.645205, 0.003921569, 1, 0, 1,
-0.4574559, -1.495543, -2.739328, 0, 1, 0.003921569, 1,
-0.4550465, -2.201705, -1.336141, 0, 1, 0.01176471, 1,
-0.4549665, 0.9325057, -0.608441, 0, 1, 0.01568628, 1,
-0.4475988, -0.5275789, -2.850969, 0, 1, 0.02352941, 1,
-0.4472785, -0.6867614, -1.596745, 0, 1, 0.02745098, 1,
-0.44361, -0.6067051, -5.318479, 0, 1, 0.03529412, 1,
-0.4405865, 0.6934568, -1.348194, 0, 1, 0.03921569, 1,
-0.4401953, 1.74063, 1.252171, 0, 1, 0.04705882, 1,
-0.4377748, -1.687384, -3.664981, 0, 1, 0.05098039, 1,
-0.4353887, -0.3192492, -1.226788, 0, 1, 0.05882353, 1,
-0.4298828, -0.0285134, -0.472795, 0, 1, 0.0627451, 1,
-0.424021, 0.6732913, -0.9231555, 0, 1, 0.07058824, 1,
-0.4239635, -1.082884, -3.382536, 0, 1, 0.07450981, 1,
-0.4238765, 0.2233749, -1.968142, 0, 1, 0.08235294, 1,
-0.4205307, 1.530354, 0.3550652, 0, 1, 0.08627451, 1,
-0.419944, 1.729224, 0.09299781, 0, 1, 0.09411765, 1,
-0.4141958, 1.563575, -2.114837, 0, 1, 0.1019608, 1,
-0.4135593, -0.3778219, -2.570338, 0, 1, 0.1058824, 1,
-0.4097356, 0.7007023, -0.7677668, 0, 1, 0.1137255, 1,
-0.4078436, 0.5036852, -0.5595229, 0, 1, 0.1176471, 1,
-0.4074405, 0.7573778, 0.4271306, 0, 1, 0.1254902, 1,
-0.4043816, -1.149896, -3.345988, 0, 1, 0.1294118, 1,
-0.3966671, 0.6076099, -0.434842, 0, 1, 0.1372549, 1,
-0.396024, -0.1807566, -1.462191, 0, 1, 0.1411765, 1,
-0.3925449, 1.975032, 1.702517, 0, 1, 0.1490196, 1,
-0.3923924, -0.650705, -1.824833, 0, 1, 0.1529412, 1,
-0.3914934, 0.09706031, -0.8813919, 0, 1, 0.1607843, 1,
-0.3874865, 0.2317454, -1.552445, 0, 1, 0.1647059, 1,
-0.3854162, -0.9007692, -3.38175, 0, 1, 0.172549, 1,
-0.3843721, 0.4577873, 2.368431, 0, 1, 0.1764706, 1,
-0.381215, -0.7103202, -2.521047, 0, 1, 0.1843137, 1,
-0.3812001, 1.523786, 1.038169, 0, 1, 0.1882353, 1,
-0.3796978, 0.113005, 0.9658979, 0, 1, 0.1960784, 1,
-0.3729901, -0.5079126, -3.963485, 0, 1, 0.2039216, 1,
-0.3714522, -0.4281522, -1.020489, 0, 1, 0.2078431, 1,
-0.3692971, 1.201862, 1.155413, 0, 1, 0.2156863, 1,
-0.3663148, -0.3183145, -0.586693, 0, 1, 0.2196078, 1,
-0.3615457, -1.044372, -4.032627, 0, 1, 0.227451, 1,
-0.3577093, -0.3777685, -1.554773, 0, 1, 0.2313726, 1,
-0.3514655, 0.7051795, -0.8311758, 0, 1, 0.2392157, 1,
-0.3510517, 0.1086101, -0.6001363, 0, 1, 0.2431373, 1,
-0.3495661, -1.066829, -2.525939, 0, 1, 0.2509804, 1,
-0.3458549, 0.2977615, -1.77284, 0, 1, 0.254902, 1,
-0.3448597, 0.3316849, -1.248623, 0, 1, 0.2627451, 1,
-0.3432164, -0.5092344, -3.146673, 0, 1, 0.2666667, 1,
-0.3414627, -1.161498, -3.055209, 0, 1, 0.2745098, 1,
-0.3404046, 0.03866976, -1.963443, 0, 1, 0.2784314, 1,
-0.3392936, 0.8460382, -2.491226, 0, 1, 0.2862745, 1,
-0.3349805, -0.210797, -2.683088, 0, 1, 0.2901961, 1,
-0.3340574, -0.2306157, -3.234424, 0, 1, 0.2980392, 1,
-0.3302866, -0.4660231, -3.010572, 0, 1, 0.3058824, 1,
-0.3262053, 0.116072, -1.0005, 0, 1, 0.3098039, 1,
-0.3163474, -0.02598227, -4.148268, 0, 1, 0.3176471, 1,
-0.3120103, 1.200385, 1.013292, 0, 1, 0.3215686, 1,
-0.3107168, -0.5020179, -2.821205, 0, 1, 0.3294118, 1,
-0.3103811, -0.9811553, -2.547003, 0, 1, 0.3333333, 1,
-0.3061451, 0.2023922, 0.4225799, 0, 1, 0.3411765, 1,
-0.3005254, 1.729891, 0.4340017, 0, 1, 0.345098, 1,
-0.2991914, 0.6969817, -0.1384106, 0, 1, 0.3529412, 1,
-0.2956037, -0.6257085, -3.990792, 0, 1, 0.3568628, 1,
-0.2938309, -1.175858, -3.712383, 0, 1, 0.3647059, 1,
-0.2901498, -0.8350562, -2.338939, 0, 1, 0.3686275, 1,
-0.2891396, 1.490423, -0.483455, 0, 1, 0.3764706, 1,
-0.2839811, 0.4080739, -0.9276825, 0, 1, 0.3803922, 1,
-0.2790397, 0.474674, -0.251359, 0, 1, 0.3882353, 1,
-0.271547, -0.1796573, -2.752016, 0, 1, 0.3921569, 1,
-0.2686244, -1.890907, -2.279257, 0, 1, 0.4, 1,
-0.2673585, -1.832351, -3.477968, 0, 1, 0.4078431, 1,
-0.265177, -0.514489, -2.738041, 0, 1, 0.4117647, 1,
-0.260561, -1.320782, -3.889515, 0, 1, 0.4196078, 1,
-0.2598174, -0.5825883, -1.77653, 0, 1, 0.4235294, 1,
-0.2555089, -0.2461121, -4.434465, 0, 1, 0.4313726, 1,
-0.2543769, 2.240948, 1.996878, 0, 1, 0.4352941, 1,
-0.2516871, 0.9046386, -1.009714, 0, 1, 0.4431373, 1,
-0.2506544, 0.332707, -1.096883, 0, 1, 0.4470588, 1,
-0.2503503, -0.6198965, -1.736318, 0, 1, 0.454902, 1,
-0.2494691, -0.2291312, -3.997823, 0, 1, 0.4588235, 1,
-0.2484642, 2.011298, -0.2207726, 0, 1, 0.4666667, 1,
-0.2447691, 0.2105003, -0.7002805, 0, 1, 0.4705882, 1,
-0.2421429, -0.8893318, -3.179873, 0, 1, 0.4784314, 1,
-0.2407537, -0.6368896, -2.364539, 0, 1, 0.4823529, 1,
-0.2329374, -0.4934368, -1.946551, 0, 1, 0.4901961, 1,
-0.2318836, -0.4536558, -3.75613, 0, 1, 0.4941176, 1,
-0.2283898, -0.9880863, -3.08315, 0, 1, 0.5019608, 1,
-0.2278919, 0.6464264, 0.06155549, 0, 1, 0.509804, 1,
-0.2213689, 0.3866162, -0.9598644, 0, 1, 0.5137255, 1,
-0.2197183, -0.8405201, -4.409993, 0, 1, 0.5215687, 1,
-0.2165504, -0.4970669, -3.043378, 0, 1, 0.5254902, 1,
-0.2139491, -0.006206525, -0.03179592, 0, 1, 0.5333334, 1,
-0.2135877, 0.4427058, 0.7402495, 0, 1, 0.5372549, 1,
-0.207307, 1.203519, -0.7092251, 0, 1, 0.5450981, 1,
-0.207051, -1.074771, -3.523396, 0, 1, 0.5490196, 1,
-0.2050277, -1.109886, -0.9342317, 0, 1, 0.5568628, 1,
-0.204754, 0.2505444, -0.8202281, 0, 1, 0.5607843, 1,
-0.2034881, 1.209612, -0.3134185, 0, 1, 0.5686275, 1,
-0.2010868, 2.853353, 0.6237729, 0, 1, 0.572549, 1,
-0.1936202, 1.123985, -0.9622489, 0, 1, 0.5803922, 1,
-0.1935704, 0.4797248, 0.5649738, 0, 1, 0.5843138, 1,
-0.1846716, -0.8759745, -4.540783, 0, 1, 0.5921569, 1,
-0.18416, 0.8037766, 0.6188412, 0, 1, 0.5960785, 1,
-0.183178, 2.685856, 0.174902, 0, 1, 0.6039216, 1,
-0.1815311, -0.002618983, -0.9303496, 0, 1, 0.6117647, 1,
-0.1815113, -1.410994, -3.925353, 0, 1, 0.6156863, 1,
-0.1807011, -0.5973749, -4.038745, 0, 1, 0.6235294, 1,
-0.1772272, 1.843467, 0.02253166, 0, 1, 0.627451, 1,
-0.1690407, 0.7813946, -1.539844, 0, 1, 0.6352941, 1,
-0.1677553, 1.544291, 0.5464447, 0, 1, 0.6392157, 1,
-0.1668421, 0.1442194, -0.8454065, 0, 1, 0.6470588, 1,
-0.1613222, 0.9894512, 0.7324213, 0, 1, 0.6509804, 1,
-0.1608127, -1.833947, -3.320366, 0, 1, 0.6588235, 1,
-0.1515879, -1.617678, -3.549704, 0, 1, 0.6627451, 1,
-0.1424085, 0.611318, 0.5263461, 0, 1, 0.6705883, 1,
-0.1411842, 0.3194112, -0.1863673, 0, 1, 0.6745098, 1,
-0.1395967, -0.7244222, -3.729772, 0, 1, 0.682353, 1,
-0.1383006, -0.1319986, -2.465807, 0, 1, 0.6862745, 1,
-0.1355998, -1.738216, -3.424124, 0, 1, 0.6941177, 1,
-0.1297732, 1.699762, 0.2025992, 0, 1, 0.7019608, 1,
-0.1272175, 0.3870164, -1.414964, 0, 1, 0.7058824, 1,
-0.1255455, 1.101478, 0.44353, 0, 1, 0.7137255, 1,
-0.1254275, 1.249499, 0.01476999, 0, 1, 0.7176471, 1,
-0.1193852, 0.355213, -1.612959, 0, 1, 0.7254902, 1,
-0.1176631, 0.1645004, -0.8470254, 0, 1, 0.7294118, 1,
-0.1125444, 0.5342023, 0.6267442, 0, 1, 0.7372549, 1,
-0.1124527, -0.4513187, -2.349391, 0, 1, 0.7411765, 1,
-0.1067014, 0.09372385, -1.287994, 0, 1, 0.7490196, 1,
-0.1061806, -1.159186, -5.248657, 0, 1, 0.7529412, 1,
-0.1060615, -0.7209216, -3.562648, 0, 1, 0.7607843, 1,
-0.1009142, -1.621242, -5.675226, 0, 1, 0.7647059, 1,
-0.09890637, -0.538861, -3.338748, 0, 1, 0.772549, 1,
-0.09684931, -1.964679, -0.8602589, 0, 1, 0.7764706, 1,
-0.09676135, 1.490444, -0.383316, 0, 1, 0.7843137, 1,
-0.09507717, 0.3812968, -0.7224803, 0, 1, 0.7882353, 1,
-0.09430726, 0.5840854, 0.2876706, 0, 1, 0.7960784, 1,
-0.09299082, 0.5762682, -0.4503297, 0, 1, 0.8039216, 1,
-0.09204459, -1.011732, -3.4411, 0, 1, 0.8078431, 1,
-0.09024753, -1.037568, -4.752608, 0, 1, 0.8156863, 1,
-0.08926427, 1.004237, 0.8100479, 0, 1, 0.8196079, 1,
-0.08304919, -0.3171946, -1.665168, 0, 1, 0.827451, 1,
-0.08268712, 1.406597, -0.1278033, 0, 1, 0.8313726, 1,
-0.07924579, -0.07745131, -2.266908, 0, 1, 0.8392157, 1,
-0.07615387, -0.02928573, -2.03038, 0, 1, 0.8431373, 1,
-0.07588831, -1.847444, -2.078552, 0, 1, 0.8509804, 1,
-0.07435336, 0.1131157, -1.901224, 0, 1, 0.854902, 1,
-0.07260133, 0.6579182, -1.49287, 0, 1, 0.8627451, 1,
-0.06767144, 0.09555204, 1.093344, 0, 1, 0.8666667, 1,
-0.06045011, 0.7567006, 0.3700653, 0, 1, 0.8745098, 1,
-0.06019571, 0.7854857, 0.5087131, 0, 1, 0.8784314, 1,
-0.05877458, 0.5091744, 0.8332877, 0, 1, 0.8862745, 1,
-0.05708369, 0.4005651, 0.4322887, 0, 1, 0.8901961, 1,
-0.05389795, 1.299215, -0.09221468, 0, 1, 0.8980392, 1,
-0.04759001, -0.5127197, -3.044269, 0, 1, 0.9058824, 1,
-0.04441657, 0.7254814, -0.5434799, 0, 1, 0.9098039, 1,
-0.04188551, -1.169661, -3.573068, 0, 1, 0.9176471, 1,
-0.04059864, -0.572304, -4.101992, 0, 1, 0.9215686, 1,
-0.03717251, 0.1987117, -0.8123196, 0, 1, 0.9294118, 1,
-0.0344283, -0.4934898, -1.930181, 0, 1, 0.9333333, 1,
-0.03399833, 1.682313, -0.3978078, 0, 1, 0.9411765, 1,
-0.03375724, -0.4622204, -3.957753, 0, 1, 0.945098, 1,
-0.03113423, 1.147066, -1.535198, 0, 1, 0.9529412, 1,
-0.03100409, 0.05318243, -0.7554495, 0, 1, 0.9568627, 1,
-0.03091075, 0.8176422, -1.032024, 0, 1, 0.9647059, 1,
-0.02891625, -2.026153, -0.1153315, 0, 1, 0.9686275, 1,
-0.02596664, -1.360029, -3.450557, 0, 1, 0.9764706, 1,
-0.02557236, -1.197238, 0.5667294, 0, 1, 0.9803922, 1,
-0.02193957, 0.7855626, -0.2501696, 0, 1, 0.9882353, 1,
-0.01832031, 0.08303025, -1.235518, 0, 1, 0.9921569, 1,
-0.003261745, 0.4881653, -0.6391001, 0, 1, 1, 1,
0.0003470355, -1.829771, 4.068126, 0, 0.9921569, 1, 1,
0.002324377, 1.263378, -0.1471959, 0, 0.9882353, 1, 1,
0.00300472, -0.0172732, 3.546119, 0, 0.9803922, 1, 1,
0.003129141, -0.02967557, 3.553172, 0, 0.9764706, 1, 1,
0.006645289, 0.06280733, -1.231759, 0, 0.9686275, 1, 1,
0.007873044, 0.09537111, 1.479133, 0, 0.9647059, 1, 1,
0.01599021, 1.687993, 2.331031, 0, 0.9568627, 1, 1,
0.01805369, -0.09979195, 3.082168, 0, 0.9529412, 1, 1,
0.02201461, 0.8658257, -1.792523, 0, 0.945098, 1, 1,
0.02637405, 0.3479626, 1.05486, 0, 0.9411765, 1, 1,
0.02808229, 0.4491756, -0.8449019, 0, 0.9333333, 1, 1,
0.03619393, 2.040147, -2.179706, 0, 0.9294118, 1, 1,
0.04057382, -0.9018328, 2.351488, 0, 0.9215686, 1, 1,
0.04821036, -0.1531239, 2.467252, 0, 0.9176471, 1, 1,
0.04870002, 0.6529503, 0.3945272, 0, 0.9098039, 1, 1,
0.05298736, -0.2888569, 3.485776, 0, 0.9058824, 1, 1,
0.05573008, 0.1234914, 0.3998591, 0, 0.8980392, 1, 1,
0.05603251, 1.18326, -1.64274, 0, 0.8901961, 1, 1,
0.05672928, 0.7227203, -0.8146054, 0, 0.8862745, 1, 1,
0.05709996, 1.133843, -0.7183679, 0, 0.8784314, 1, 1,
0.0572102, 0.2847519, -0.08790041, 0, 0.8745098, 1, 1,
0.06318566, -0.6276924, 2.718379, 0, 0.8666667, 1, 1,
0.06521167, 1.437461, -0.111907, 0, 0.8627451, 1, 1,
0.06795026, -0.2101929, 3.379163, 0, 0.854902, 1, 1,
0.07021657, -0.07579686, 3.592079, 0, 0.8509804, 1, 1,
0.07411009, -0.7555736, 3.759296, 0, 0.8431373, 1, 1,
0.07696618, 0.2124098, 0.07114796, 0, 0.8392157, 1, 1,
0.08094291, -0.2246698, 3.656754, 0, 0.8313726, 1, 1,
0.08281674, 0.4936717, -0.7585478, 0, 0.827451, 1, 1,
0.08560368, 0.06404047, 1.908279, 0, 0.8196079, 1, 1,
0.08775876, -0.8019496, 3.563169, 0, 0.8156863, 1, 1,
0.09079423, 0.6487037, -0.5177541, 0, 0.8078431, 1, 1,
0.09291572, -0.8383019, 2.081008, 0, 0.8039216, 1, 1,
0.09383462, 0.610542, -0.3908449, 0, 0.7960784, 1, 1,
0.09471224, 0.963553, 1.497885, 0, 0.7882353, 1, 1,
0.09619273, 0.2584533, -0.8591184, 0, 0.7843137, 1, 1,
0.09634639, 1.235856, 0.6377897, 0, 0.7764706, 1, 1,
0.09883741, -0.497925, 2.469546, 0, 0.772549, 1, 1,
0.09901322, -2.428235, 3.335899, 0, 0.7647059, 1, 1,
0.101252, 0.2409486, -1.020772, 0, 0.7607843, 1, 1,
0.1052857, -0.5533289, 1.540359, 0, 0.7529412, 1, 1,
0.1061288, -0.6477451, 2.174779, 0, 0.7490196, 1, 1,
0.1088408, -1.443662, 1.560899, 0, 0.7411765, 1, 1,
0.1099639, 0.7601159, -0.2345675, 0, 0.7372549, 1, 1,
0.1119923, 0.3465782, 2.651175, 0, 0.7294118, 1, 1,
0.1134729, -0.04860368, 2.532028, 0, 0.7254902, 1, 1,
0.1150361, -0.9671499, 4.173596, 0, 0.7176471, 1, 1,
0.1168775, -0.5298817, 3.677651, 0, 0.7137255, 1, 1,
0.1187169, 0.9266303, 0.4120406, 0, 0.7058824, 1, 1,
0.1187195, 0.3798139, 0.792668, 0, 0.6980392, 1, 1,
0.121382, -1.277553, 2.802181, 0, 0.6941177, 1, 1,
0.1232753, 0.403527, 2.786252, 0, 0.6862745, 1, 1,
0.1259684, -0.4965403, 3.092153, 0, 0.682353, 1, 1,
0.1268479, -0.6746418, 3.712427, 0, 0.6745098, 1, 1,
0.133772, 0.6949953, -0.8292985, 0, 0.6705883, 1, 1,
0.1338636, 1.1069, -0.4667428, 0, 0.6627451, 1, 1,
0.1342914, 0.596168, 0.3726998, 0, 0.6588235, 1, 1,
0.1363402, -0.7988743, 2.004205, 0, 0.6509804, 1, 1,
0.1403343, 0.7203732, 1.338444, 0, 0.6470588, 1, 1,
0.1404724, 0.4804553, -0.4095987, 0, 0.6392157, 1, 1,
0.1427231, 1.00059, 1.772078, 0, 0.6352941, 1, 1,
0.1461538, -0.8524874, 3.846843, 0, 0.627451, 1, 1,
0.1512468, -0.4932046, 3.027011, 0, 0.6235294, 1, 1,
0.1567639, -0.2399824, 2.420594, 0, 0.6156863, 1, 1,
0.1584014, 0.3462644, 0.3130376, 0, 0.6117647, 1, 1,
0.1592609, -1.075081, 2.949163, 0, 0.6039216, 1, 1,
0.1609567, 0.1437074, 0.993582, 0, 0.5960785, 1, 1,
0.1618602, -0.391888, 2.195161, 0, 0.5921569, 1, 1,
0.1698568, -1.145559, 2.250935, 0, 0.5843138, 1, 1,
0.1700553, -0.9797075, 1.573579, 0, 0.5803922, 1, 1,
0.1710705, 0.711242, -1.370196, 0, 0.572549, 1, 1,
0.1730053, 0.3108806, -0.5509629, 0, 0.5686275, 1, 1,
0.1737595, -3.179879, 4.474932, 0, 0.5607843, 1, 1,
0.1737604, 1.309754, -0.8388485, 0, 0.5568628, 1, 1,
0.1765746, -2.364228, 2.816941, 0, 0.5490196, 1, 1,
0.1786357, -0.08903205, 3.010327, 0, 0.5450981, 1, 1,
0.1804758, 1.39156, 1.175017, 0, 0.5372549, 1, 1,
0.1830211, -0.03275992, 2.722028, 0, 0.5333334, 1, 1,
0.1844865, 0.3418474, 1.0967, 0, 0.5254902, 1, 1,
0.187981, 0.7885486, -0.3193073, 0, 0.5215687, 1, 1,
0.1885374, -0.9097688, 1.305933, 0, 0.5137255, 1, 1,
0.189888, -1.240053, 3.877137, 0, 0.509804, 1, 1,
0.1922294, 0.4473578, 0.8382158, 0, 0.5019608, 1, 1,
0.195714, -2.375403, 3.533617, 0, 0.4941176, 1, 1,
0.1957201, -0.7460688, 0.4507408, 0, 0.4901961, 1, 1,
0.1976841, 0.1589082, 1.448379, 0, 0.4823529, 1, 1,
0.1981129, -2.402923, 2.893887, 0, 0.4784314, 1, 1,
0.1982342, -0.2514414, 2.291996, 0, 0.4705882, 1, 1,
0.1991203, 2.025729, 0.6916066, 0, 0.4666667, 1, 1,
0.2001868, -1.702932, 2.344414, 0, 0.4588235, 1, 1,
0.200367, 0.4900714, 0.7289252, 0, 0.454902, 1, 1,
0.2011723, 0.2580775, 2.155033, 0, 0.4470588, 1, 1,
0.2030663, -0.1464229, 1.4858, 0, 0.4431373, 1, 1,
0.2035305, -1.479107, 1.906099, 0, 0.4352941, 1, 1,
0.2041826, -1.086474, 3.579988, 0, 0.4313726, 1, 1,
0.2153432, 0.7611596, 1.389115, 0, 0.4235294, 1, 1,
0.2159622, 0.8005422, 1.278334, 0, 0.4196078, 1, 1,
0.217817, 0.2480218, 1.07827, 0, 0.4117647, 1, 1,
0.2189648, -0.01168715, 2.548986, 0, 0.4078431, 1, 1,
0.222768, 0.2507294, 0.8834881, 0, 0.4, 1, 1,
0.2270865, -1.281481, 3.163979, 0, 0.3921569, 1, 1,
0.230636, -0.7507881, 2.155367, 0, 0.3882353, 1, 1,
0.2319458, 0.3789811, -1.197406, 0, 0.3803922, 1, 1,
0.2349813, 1.376498, -0.9111652, 0, 0.3764706, 1, 1,
0.235336, -0.6012969, 3.806774, 0, 0.3686275, 1, 1,
0.2398511, 0.5673503, 0.5842077, 0, 0.3647059, 1, 1,
0.2434421, 0.1470183, 1.676755, 0, 0.3568628, 1, 1,
0.2527313, -1.529634, 1.45763, 0, 0.3529412, 1, 1,
0.2571161, 0.9275178, 0.8123657, 0, 0.345098, 1, 1,
0.2609295, -1.638245, 3.297478, 0, 0.3411765, 1, 1,
0.2629054, -0.9651898, 3.129313, 0, 0.3333333, 1, 1,
0.2703013, 0.3666051, -0.1465266, 0, 0.3294118, 1, 1,
0.2706143, 1.086991, -0.654436, 0, 0.3215686, 1, 1,
0.2744922, 1.123373, -0.3396869, 0, 0.3176471, 1, 1,
0.2778338, -0.596763, 1.363283, 0, 0.3098039, 1, 1,
0.2789146, -0.8950056, 1.809428, 0, 0.3058824, 1, 1,
0.2804414, 0.2373361, -0.5198078, 0, 0.2980392, 1, 1,
0.2827043, 1.006231, -0.3306495, 0, 0.2901961, 1, 1,
0.2944011, -1.294262, 2.649393, 0, 0.2862745, 1, 1,
0.3000709, 0.762549, 0.5159184, 0, 0.2784314, 1, 1,
0.3029173, -1.033576, 2.016396, 0, 0.2745098, 1, 1,
0.3048745, -0.4265415, 1.423765, 0, 0.2666667, 1, 1,
0.3087285, 0.7741678, 0.3528652, 0, 0.2627451, 1, 1,
0.31067, 0.2479628, -0.5979103, 0, 0.254902, 1, 1,
0.3119859, 0.249255, -0.02456926, 0, 0.2509804, 1, 1,
0.314234, 0.4755831, 1.383992, 0, 0.2431373, 1, 1,
0.3144751, 0.2929064, 0.9184004, 0, 0.2392157, 1, 1,
0.3184532, 2.759179, -0.3452663, 0, 0.2313726, 1, 1,
0.3191238, 0.2941974, 0.7532378, 0, 0.227451, 1, 1,
0.3193312, 0.5618109, 0.1108068, 0, 0.2196078, 1, 1,
0.3225884, -0.02811801, 2.030737, 0, 0.2156863, 1, 1,
0.3230211, -0.9042463, 3.090928, 0, 0.2078431, 1, 1,
0.3258994, 1.312355, 0.5206559, 0, 0.2039216, 1, 1,
0.3264296, 0.5982647, 0.2796966, 0, 0.1960784, 1, 1,
0.326433, 0.8186483, 0.4629299, 0, 0.1882353, 1, 1,
0.3290282, 0.8756115, -1.687962, 0, 0.1843137, 1, 1,
0.330106, 0.7900284, -1.275886, 0, 0.1764706, 1, 1,
0.331969, 0.8336365, -0.728862, 0, 0.172549, 1, 1,
0.3331721, -1.042089, 3.044174, 0, 0.1647059, 1, 1,
0.3349484, 1.504694, -0.01016549, 0, 0.1607843, 1, 1,
0.3423749, 0.2058157, 1.633319, 0, 0.1529412, 1, 1,
0.3438381, -0.1519657, 0.9358109, 0, 0.1490196, 1, 1,
0.3525827, 0.83349, -0.6658285, 0, 0.1411765, 1, 1,
0.3567145, 0.6664779, -0.6596503, 0, 0.1372549, 1, 1,
0.3590289, 0.8698779, -0.2852853, 0, 0.1294118, 1, 1,
0.3625883, 0.1187633, 1.022109, 0, 0.1254902, 1, 1,
0.3643689, -0.006694617, 1.680369, 0, 0.1176471, 1, 1,
0.3663674, 0.08557715, 3.334198, 0, 0.1137255, 1, 1,
0.3711044, 1.194773, -0.552568, 0, 0.1058824, 1, 1,
0.3781058, 0.9724365, -0.8890616, 0, 0.09803922, 1, 1,
0.3781977, 1.341859, -0.3270067, 0, 0.09411765, 1, 1,
0.3825048, 0.2272631, 0.8389677, 0, 0.08627451, 1, 1,
0.3837045, -2.184012, 1.278111, 0, 0.08235294, 1, 1,
0.3862446, -0.2133638, 3.785863, 0, 0.07450981, 1, 1,
0.3927601, 0.6670131, -0.5157264, 0, 0.07058824, 1, 1,
0.3954302, -0.07774314, 1.664819, 0, 0.0627451, 1, 1,
0.4021159, -1.781541, 3.124047, 0, 0.05882353, 1, 1,
0.4063288, -1.169411, 3.099276, 0, 0.05098039, 1, 1,
0.4082415, 1.418147, -0.02704382, 0, 0.04705882, 1, 1,
0.4123986, -1.67133, 2.925522, 0, 0.03921569, 1, 1,
0.4151447, 0.4147186, 2.405174, 0, 0.03529412, 1, 1,
0.4163161, -0.4438573, 3.154173, 0, 0.02745098, 1, 1,
0.4203275, 0.05521265, 3.275295, 0, 0.02352941, 1, 1,
0.4222818, -0.01391349, 0.3276927, 0, 0.01568628, 1, 1,
0.4319235, -0.285262, 2.423635, 0, 0.01176471, 1, 1,
0.4339179, -1.791627, 1.734853, 0, 0.003921569, 1, 1,
0.4353459, 0.6487783, 1.395205, 0.003921569, 0, 1, 1,
0.4361122, 0.6635081, 1.585265, 0.007843138, 0, 1, 1,
0.4364188, 1.83776, -0.971925, 0.01568628, 0, 1, 1,
0.4369377, -1.045716, 3.666812, 0.01960784, 0, 1, 1,
0.4376762, -1.029358, 3.157248, 0.02745098, 0, 1, 1,
0.4378901, -1.196161, 1.340391, 0.03137255, 0, 1, 1,
0.4443852, -0.7123192, 2.471005, 0.03921569, 0, 1, 1,
0.4450191, -0.7036237, 2.945292, 0.04313726, 0, 1, 1,
0.4461124, -1.072612, 0.4687034, 0.05098039, 0, 1, 1,
0.4483665, -1.84311, 2.215738, 0.05490196, 0, 1, 1,
0.4487044, 0.4304862, 1.03945, 0.0627451, 0, 1, 1,
0.4515756, -0.258209, 3.230095, 0.06666667, 0, 1, 1,
0.4528928, -1.191538, 2.345809, 0.07450981, 0, 1, 1,
0.4541983, 0.1717338, 1.271167, 0.07843138, 0, 1, 1,
0.4555906, -2.926839, 2.833522, 0.08627451, 0, 1, 1,
0.4581546, -0.5698851, 2.865232, 0.09019608, 0, 1, 1,
0.4624593, 0.6535948, 1.575869, 0.09803922, 0, 1, 1,
0.4646783, -0.1072047, 0.5583455, 0.1058824, 0, 1, 1,
0.4659013, -0.7220563, 2.025969, 0.1098039, 0, 1, 1,
0.4699039, 0.5191693, 1.2862, 0.1176471, 0, 1, 1,
0.4751365, -2.037642, 1.968699, 0.1215686, 0, 1, 1,
0.4760054, -1.53219, 3.51884, 0.1294118, 0, 1, 1,
0.4773222, -1.474281, 1.16364, 0.1333333, 0, 1, 1,
0.477335, -1.272982, 3.089704, 0.1411765, 0, 1, 1,
0.477769, 0.863605, 1.13094, 0.145098, 0, 1, 1,
0.4781527, 0.7919555, 0.6563168, 0.1529412, 0, 1, 1,
0.4784766, -0.4602547, 0.6069031, 0.1568628, 0, 1, 1,
0.4788028, 0.3071957, 1.078279, 0.1647059, 0, 1, 1,
0.4790117, -0.3189419, 1.735009, 0.1686275, 0, 1, 1,
0.4813995, -0.238806, 2.430786, 0.1764706, 0, 1, 1,
0.4844877, -0.343517, 1.381977, 0.1803922, 0, 1, 1,
0.4874207, -1.109404, 2.533246, 0.1882353, 0, 1, 1,
0.4983158, -0.03822535, 2.507868, 0.1921569, 0, 1, 1,
0.4990373, 0.146511, 1.562788, 0.2, 0, 1, 1,
0.5009719, -0.09880608, 1.616363, 0.2078431, 0, 1, 1,
0.5010586, 0.1025171, 2.025587, 0.2117647, 0, 1, 1,
0.5014434, 2.184838, 0.8543745, 0.2196078, 0, 1, 1,
0.5069125, -0.3094848, 4.513222, 0.2235294, 0, 1, 1,
0.5140421, 0.9308287, 1.644566, 0.2313726, 0, 1, 1,
0.5213577, 0.2637797, 0.548121, 0.2352941, 0, 1, 1,
0.5226129, -1.211347, 3.157006, 0.2431373, 0, 1, 1,
0.5290734, -1.190749, 3.813028, 0.2470588, 0, 1, 1,
0.5297784, -0.7179645, 2.562657, 0.254902, 0, 1, 1,
0.5297831, -0.9049634, 1.216119, 0.2588235, 0, 1, 1,
0.5313033, 0.9027297, 1.414553, 0.2666667, 0, 1, 1,
0.533824, -1.069363, 2.190685, 0.2705882, 0, 1, 1,
0.5348358, 0.4549816, -0.01930573, 0.2784314, 0, 1, 1,
0.5386985, 1.175754, -0.6698541, 0.282353, 0, 1, 1,
0.5401674, -1.316487, 3.456459, 0.2901961, 0, 1, 1,
0.5412259, -1.377277, 1.660001, 0.2941177, 0, 1, 1,
0.5499493, -0.6707636, 3.138221, 0.3019608, 0, 1, 1,
0.5559592, -1.05647, 2.070683, 0.3098039, 0, 1, 1,
0.5560296, -1.567057, 3.973851, 0.3137255, 0, 1, 1,
0.5600263, -1.227806, 1.512907, 0.3215686, 0, 1, 1,
0.5622855, -0.5437804, 1.41556, 0.3254902, 0, 1, 1,
0.5630051, 2.415941, -0.7900607, 0.3333333, 0, 1, 1,
0.5653713, 1.490005, 1.093082, 0.3372549, 0, 1, 1,
0.5679075, 0.6170662, 0.8086711, 0.345098, 0, 1, 1,
0.5768351, -0.4565588, 3.091599, 0.3490196, 0, 1, 1,
0.5770857, 0.6135061, 0.7188122, 0.3568628, 0, 1, 1,
0.5799195, -0.04207782, 0.4552188, 0.3607843, 0, 1, 1,
0.5810546, 0.9047959, 1.865933, 0.3686275, 0, 1, 1,
0.5815724, 1.073274, 0.5675449, 0.372549, 0, 1, 1,
0.5886102, -0.4317657, 3.14118, 0.3803922, 0, 1, 1,
0.5895376, 0.8427151, 1.086933, 0.3843137, 0, 1, 1,
0.5946655, -0.1387378, 1.806486, 0.3921569, 0, 1, 1,
0.6009594, -0.6977552, 2.323735, 0.3960784, 0, 1, 1,
0.6034095, -1.303704, 2.519354, 0.4039216, 0, 1, 1,
0.604513, -0.176634, 2.094479, 0.4117647, 0, 1, 1,
0.6072493, 1.513654, 1.460467, 0.4156863, 0, 1, 1,
0.608739, -0.2719195, 0.9296541, 0.4235294, 0, 1, 1,
0.6146332, 1.441107, 0.8300213, 0.427451, 0, 1, 1,
0.6190103, -0.4537247, 2.360116, 0.4352941, 0, 1, 1,
0.6209797, -0.1495986, 1.201417, 0.4392157, 0, 1, 1,
0.6319116, -0.4730661, 2.279641, 0.4470588, 0, 1, 1,
0.6358436, 0.5179361, 0.1768292, 0.4509804, 0, 1, 1,
0.6408515, -0.5309286, 0.3449861, 0.4588235, 0, 1, 1,
0.647345, 0.4449141, 0.8873244, 0.4627451, 0, 1, 1,
0.6597777, -0.6414544, 1.33739, 0.4705882, 0, 1, 1,
0.6605339, 0.2921093, 1.556614, 0.4745098, 0, 1, 1,
0.661782, 0.7052895, 0.1840225, 0.4823529, 0, 1, 1,
0.6619129, -0.9503099, 3.049213, 0.4862745, 0, 1, 1,
0.6651998, -0.4603359, 4.038185, 0.4941176, 0, 1, 1,
0.6663078, 0.3812459, 0.4440398, 0.5019608, 0, 1, 1,
0.6681006, 0.03899053, -0.06580373, 0.5058824, 0, 1, 1,
0.6682827, -1.306603, 3.508552, 0.5137255, 0, 1, 1,
0.6686597, -1.729786, 3.832578, 0.5176471, 0, 1, 1,
0.67097, -0.6798047, 2.113775, 0.5254902, 0, 1, 1,
0.6790168, 0.2902583, -0.07667048, 0.5294118, 0, 1, 1,
0.6806748, -1.011919, 3.863243, 0.5372549, 0, 1, 1,
0.6834739, -0.02547182, 1.432594, 0.5411765, 0, 1, 1,
0.6848112, -0.3819429, 4.043506, 0.5490196, 0, 1, 1,
0.6860717, -1.31075, 1.707555, 0.5529412, 0, 1, 1,
0.6865614, 1.439466, 1.386742, 0.5607843, 0, 1, 1,
0.6885868, 0.3511234, 1.222661, 0.5647059, 0, 1, 1,
0.6898459, 0.8039934, 0.3221137, 0.572549, 0, 1, 1,
0.6948617, 0.4704482, 0.2340463, 0.5764706, 0, 1, 1,
0.7000738, -0.5581344, 3.226669, 0.5843138, 0, 1, 1,
0.7021514, -0.940361, 3.993773, 0.5882353, 0, 1, 1,
0.7070808, 1.443093, 2.893403, 0.5960785, 0, 1, 1,
0.7167639, -0.2481523, 1.789201, 0.6039216, 0, 1, 1,
0.719754, -0.5338699, 2.485953, 0.6078432, 0, 1, 1,
0.724914, -0.3473448, 2.107791, 0.6156863, 0, 1, 1,
0.7263146, -0.2781614, 1.423113, 0.6196079, 0, 1, 1,
0.7291154, -0.463148, 1.0686, 0.627451, 0, 1, 1,
0.7377823, 0.4350343, 0.7359117, 0.6313726, 0, 1, 1,
0.738562, 0.5874091, 2.124262, 0.6392157, 0, 1, 1,
0.7391724, 0.372809, 1.013266, 0.6431373, 0, 1, 1,
0.7409971, 0.9422286, 0.0211009, 0.6509804, 0, 1, 1,
0.7412747, -0.3368238, 0.5315349, 0.654902, 0, 1, 1,
0.7500159, 2.211055, 0.6617661, 0.6627451, 0, 1, 1,
0.7522554, 0.9310918, 2.122579, 0.6666667, 0, 1, 1,
0.7526558, 1.090842, 0.1914913, 0.6745098, 0, 1, 1,
0.7528334, -0.4140521, 1.288265, 0.6784314, 0, 1, 1,
0.7586408, 0.2330675, 0.6871957, 0.6862745, 0, 1, 1,
0.7595888, -1.416354, 3.117666, 0.6901961, 0, 1, 1,
0.7603036, 0.5453556, 1.655704, 0.6980392, 0, 1, 1,
0.7654229, -0.1796359, 1.826317, 0.7058824, 0, 1, 1,
0.7673724, 1.433698, 0.2991076, 0.7098039, 0, 1, 1,
0.7703802, -0.6804693, 1.809057, 0.7176471, 0, 1, 1,
0.7712989, -0.1766041, 0.2756743, 0.7215686, 0, 1, 1,
0.7749239, -1.078334, 3.991853, 0.7294118, 0, 1, 1,
0.7916031, 0.1845794, 1.293614, 0.7333333, 0, 1, 1,
0.7930562, -1.167363, 2.306227, 0.7411765, 0, 1, 1,
0.7939136, -1.918694, 1.871731, 0.7450981, 0, 1, 1,
0.7951986, 0.921128, 2.152084, 0.7529412, 0, 1, 1,
0.7977938, 0.3648208, 1.396599, 0.7568628, 0, 1, 1,
0.7983747, -1.233667, 1.197879, 0.7647059, 0, 1, 1,
0.7986597, 0.3409568, 3.564018, 0.7686275, 0, 1, 1,
0.8006331, -2.192129, 3.265196, 0.7764706, 0, 1, 1,
0.8018774, 0.3468937, -0.09694325, 0.7803922, 0, 1, 1,
0.8088461, -0.5831424, 2.863362, 0.7882353, 0, 1, 1,
0.8100908, 1.556571, -0.8764467, 0.7921569, 0, 1, 1,
0.8169925, -0.3546652, 0.009693695, 0.8, 0, 1, 1,
0.8191821, 0.2086604, -0.04897285, 0.8078431, 0, 1, 1,
0.821689, -1.027808, 2.231011, 0.8117647, 0, 1, 1,
0.8278767, -0.6224837, 2.118469, 0.8196079, 0, 1, 1,
0.8318962, 0.7626386, 1.066439, 0.8235294, 0, 1, 1,
0.834556, 0.6092145, 1.380068, 0.8313726, 0, 1, 1,
0.8453657, 0.6655675, 0.7136251, 0.8352941, 0, 1, 1,
0.862289, -0.04622108, 2.197794, 0.8431373, 0, 1, 1,
0.8630421, 0.9401374, 1.950646, 0.8470588, 0, 1, 1,
0.8658692, -2.034151, 2.685407, 0.854902, 0, 1, 1,
0.8684582, -1.174055, 2.110121, 0.8588235, 0, 1, 1,
0.868763, 1.316141, 1.748138, 0.8666667, 0, 1, 1,
0.8696628, -0.9274332, 2.339303, 0.8705882, 0, 1, 1,
0.8752007, -0.5765347, 2.059513, 0.8784314, 0, 1, 1,
0.8759423, 1.284848, 0.957229, 0.8823529, 0, 1, 1,
0.8776405, -0.3005595, 1.451792, 0.8901961, 0, 1, 1,
0.8776554, 1.442127, 1.172771, 0.8941177, 0, 1, 1,
0.8857002, -0.5307227, 3.149726, 0.9019608, 0, 1, 1,
0.8904445, -0.1875145, 0.7808675, 0.9098039, 0, 1, 1,
0.8913447, -1.781065, 1.967586, 0.9137255, 0, 1, 1,
0.8921271, 0.9194542, -0.01454901, 0.9215686, 0, 1, 1,
0.8934515, -2.332852, 3.248719, 0.9254902, 0, 1, 1,
0.8980866, -1.045283, 2.982802, 0.9333333, 0, 1, 1,
0.9031165, 0.2159536, 0.09744901, 0.9372549, 0, 1, 1,
0.9054104, -0.129169, 1.256348, 0.945098, 0, 1, 1,
0.9076858, -0.4810015, 2.327193, 0.9490196, 0, 1, 1,
0.9087318, 0.5721758, 1.461549, 0.9568627, 0, 1, 1,
0.913536, -1.985839, 1.67851, 0.9607843, 0, 1, 1,
0.9220031, -0.0168016, 0.6332683, 0.9686275, 0, 1, 1,
0.9254141, 1.022362, 0.9663748, 0.972549, 0, 1, 1,
0.9255831, 0.4019853, 1.243082, 0.9803922, 0, 1, 1,
0.9273119, 0.3929588, 0.3237567, 0.9843137, 0, 1, 1,
0.9299561, -0.2320689, 1.482159, 0.9921569, 0, 1, 1,
0.9337569, -0.9298181, 2.494586, 0.9960784, 0, 1, 1,
0.9343999, 0.6788107, 0.632209, 1, 0, 0.9960784, 1,
0.9356262, -0.231478, -1.053721, 1, 0, 0.9882353, 1,
0.9424751, 2.001174, 1.092283, 1, 0, 0.9843137, 1,
0.942738, 2.350598, -0.6203119, 1, 0, 0.9764706, 1,
0.9457806, 1.005122, -0.1043346, 1, 0, 0.972549, 1,
0.9526231, 0.2356599, 1.211043, 1, 0, 0.9647059, 1,
0.9615061, 0.4477984, 1.572831, 1, 0, 0.9607843, 1,
0.965337, -0.2711314, 1.796242, 1, 0, 0.9529412, 1,
0.972297, -0.5234441, 1.157895, 1, 0, 0.9490196, 1,
0.975275, -0.4803868, 0.657205, 1, 0, 0.9411765, 1,
0.9776466, -0.2209808, 1.444159, 1, 0, 0.9372549, 1,
0.9812526, 1.23606, 1.528906, 1, 0, 0.9294118, 1,
0.9826733, -0.06800904, 1.386215, 1, 0, 0.9254902, 1,
0.9867789, 1.73025, 0.8755899, 1, 0, 0.9176471, 1,
0.9944832, 1.405772, 2.19867, 1, 0, 0.9137255, 1,
0.9963785, -0.2686029, 1.099401, 1, 0, 0.9058824, 1,
0.9979922, -1.226515, 3.180956, 1, 0, 0.9019608, 1,
1.000733, 0.5282395, 0.2204016, 1, 0, 0.8941177, 1,
1.010307, 2.350806, -0.1756001, 1, 0, 0.8862745, 1,
1.019348, 0.8238635, 0.200186, 1, 0, 0.8823529, 1,
1.024797, -0.8924519, 1.596981, 1, 0, 0.8745098, 1,
1.028896, -0.002079495, 2.411617, 1, 0, 0.8705882, 1,
1.040403, 0.5170531, 0.7712972, 1, 0, 0.8627451, 1,
1.045731, -0.137572, 2.761548, 1, 0, 0.8588235, 1,
1.047443, 1.598754, -1.178482, 1, 0, 0.8509804, 1,
1.050613, -0.5002409, 1.87484, 1, 0, 0.8470588, 1,
1.053574, -1.91388, 3.395154, 1, 0, 0.8392157, 1,
1.063888, -1.454045, 3.851919, 1, 0, 0.8352941, 1,
1.068811, -0.7913313, 4.333811, 1, 0, 0.827451, 1,
1.070001, -0.6848646, 2.420851, 1, 0, 0.8235294, 1,
1.08043, 1.618293, -0.6426223, 1, 0, 0.8156863, 1,
1.084818, -1.384128, 3.163413, 1, 0, 0.8117647, 1,
1.107665, 0.3440445, 1.388955, 1, 0, 0.8039216, 1,
1.108032, 0.5773141, 1.76111, 1, 0, 0.7960784, 1,
1.117185, 0.4370169, 1.530716, 1, 0, 0.7921569, 1,
1.1236, -0.5071826, 3.589469, 1, 0, 0.7843137, 1,
1.12548, -0.7324143, 2.095333, 1, 0, 0.7803922, 1,
1.134029, -1.452869, 1.269954, 1, 0, 0.772549, 1,
1.140327, -1.793321, 1.778917, 1, 0, 0.7686275, 1,
1.144761, -1.053151, 2.239762, 1, 0, 0.7607843, 1,
1.151267, -0.8321936, 1.900576, 1, 0, 0.7568628, 1,
1.158303, 0.187092, 0.7229703, 1, 0, 0.7490196, 1,
1.166793, -0.1499934, 0.920354, 1, 0, 0.7450981, 1,
1.171474, -1.620597, 0.8590649, 1, 0, 0.7372549, 1,
1.171917, -1.07576, 2.465078, 1, 0, 0.7333333, 1,
1.184724, -0.5027321, 1.32488, 1, 0, 0.7254902, 1,
1.187792, -2.693315, 1.990347, 1, 0, 0.7215686, 1,
1.189082, -0.6927269, 2.343168, 1, 0, 0.7137255, 1,
1.196823, 0.8818765, 0.5155092, 1, 0, 0.7098039, 1,
1.243125, 2.023652, -1.311335, 1, 0, 0.7019608, 1,
1.244349, -1.104407, 3.499292, 1, 0, 0.6941177, 1,
1.24575, 0.3005283, 0.516975, 1, 0, 0.6901961, 1,
1.257884, -0.1575239, 0.6536661, 1, 0, 0.682353, 1,
1.272484, -1.804292, 2.493447, 1, 0, 0.6784314, 1,
1.275739, -0.1607398, 2.498119, 1, 0, 0.6705883, 1,
1.276279, -0.9546614, 1.765718, 1, 0, 0.6666667, 1,
1.276386, -2.236139, 2.853642, 1, 0, 0.6588235, 1,
1.281878, 0.6591607, -0.4226195, 1, 0, 0.654902, 1,
1.282249, -1.095703, 2.038747, 1, 0, 0.6470588, 1,
1.291184, 0.8177586, 1.63049, 1, 0, 0.6431373, 1,
1.295882, -0.7418275, 1.469019, 1, 0, 0.6352941, 1,
1.301674, -1.177874, 4.228698, 1, 0, 0.6313726, 1,
1.303618, 0.08279096, 3.138047, 1, 0, 0.6235294, 1,
1.323327, 0.7421181, 1.676911, 1, 0, 0.6196079, 1,
1.327443, 1.383962, 0.7737995, 1, 0, 0.6117647, 1,
1.336517, -1.091528, 2.070871, 1, 0, 0.6078432, 1,
1.338971, 0.3727776, 1.682729, 1, 0, 0.6, 1,
1.340124, 1.349162, 0.1687273, 1, 0, 0.5921569, 1,
1.341487, -1.245254, 0.8788412, 1, 0, 0.5882353, 1,
1.342452, 1.074173, 1.419155, 1, 0, 0.5803922, 1,
1.343926, -2.522218, 4.053446, 1, 0, 0.5764706, 1,
1.344205, 0.4328508, 1.170695, 1, 0, 0.5686275, 1,
1.355034, -0.1823185, 2.684674, 1, 0, 0.5647059, 1,
1.355543, -0.3805927, 1.393804, 1, 0, 0.5568628, 1,
1.359492, 0.6034787, -0.1522499, 1, 0, 0.5529412, 1,
1.368925, 1.401041, 2.237247, 1, 0, 0.5450981, 1,
1.371796, 0.454465, 1.685143, 1, 0, 0.5411765, 1,
1.379639, -2.008806, 2.46689, 1, 0, 0.5333334, 1,
1.380622, 0.1231851, 3.188905, 1, 0, 0.5294118, 1,
1.390719, 1.116568, -1.453761, 1, 0, 0.5215687, 1,
1.393426, -0.5796402, 1.995694, 1, 0, 0.5176471, 1,
1.394048, -1.111404, 2.198659, 1, 0, 0.509804, 1,
1.395832, 0.3006808, 3.284962, 1, 0, 0.5058824, 1,
1.398559, -1.017316, 1.932685, 1, 0, 0.4980392, 1,
1.402822, -1.444916, 1.146174, 1, 0, 0.4901961, 1,
1.403014, 1.599165, 1.225116, 1, 0, 0.4862745, 1,
1.413998, 0.4167768, 1.398239, 1, 0, 0.4784314, 1,
1.426116, 1.771903, 0.4144655, 1, 0, 0.4745098, 1,
1.44829, -0.2578971, 1.776897, 1, 0, 0.4666667, 1,
1.465925, -1.312962, 3.213451, 1, 0, 0.4627451, 1,
1.474154, -0.1374846, 1.330435, 1, 0, 0.454902, 1,
1.483468, 0.6879143, 0.5711638, 1, 0, 0.4509804, 1,
1.49239, 0.8427891, 0.8181199, 1, 0, 0.4431373, 1,
1.496362, 0.2076684, 1.613359, 1, 0, 0.4392157, 1,
1.51624, -1.111964, 3.690536, 1, 0, 0.4313726, 1,
1.51895, 0.5781159, 1.057764, 1, 0, 0.427451, 1,
1.518969, -0.6228024, 4.336095, 1, 0, 0.4196078, 1,
1.520277, 2.261067, -0.3642132, 1, 0, 0.4156863, 1,
1.521881, -2.228293, 2.910822, 1, 0, 0.4078431, 1,
1.527944, 0.8765658, 1.305547, 1, 0, 0.4039216, 1,
1.528679, 0.9231889, 1.810174, 1, 0, 0.3960784, 1,
1.533564, -0.8867113, 2.004051, 1, 0, 0.3882353, 1,
1.54008, -0.4473691, 2.797264, 1, 0, 0.3843137, 1,
1.54658, 0.3874678, 1.944133, 1, 0, 0.3764706, 1,
1.547655, 1.729327, 0.4349626, 1, 0, 0.372549, 1,
1.555978, 2.598465, 1.121561, 1, 0, 0.3647059, 1,
1.578517, -0.8055215, 2.233769, 1, 0, 0.3607843, 1,
1.59314, -0.6820111, 0.9290411, 1, 0, 0.3529412, 1,
1.601163, 0.4939978, 0.7511867, 1, 0, 0.3490196, 1,
1.619551, 0.2105483, 1.694228, 1, 0, 0.3411765, 1,
1.623828, -0.5100562, 1.581205, 1, 0, 0.3372549, 1,
1.627179, 0.5806068, 1.16398, 1, 0, 0.3294118, 1,
1.63099, -1.62221, 1.060751, 1, 0, 0.3254902, 1,
1.635584, 0.4881059, 1.389686, 1, 0, 0.3176471, 1,
1.642616, 1.720465, 0.4956405, 1, 0, 0.3137255, 1,
1.661624, -0.4822001, 2.527105, 1, 0, 0.3058824, 1,
1.681144, -0.6430427, 1.763424, 1, 0, 0.2980392, 1,
1.683843, -0.1181992, 1.43391, 1, 0, 0.2941177, 1,
1.707565, -0.6151354, 1.982109, 1, 0, 0.2862745, 1,
1.709787, -1.46306, 2.410506, 1, 0, 0.282353, 1,
1.742374, 1.47293, 1.471349, 1, 0, 0.2745098, 1,
1.7675, -0.9274451, 3.647007, 1, 0, 0.2705882, 1,
1.772866, 0.3392044, 1.684766, 1, 0, 0.2627451, 1,
1.79246, 0.1156972, 1.118059, 1, 0, 0.2588235, 1,
1.805756, 1.484867, 1.839746, 1, 0, 0.2509804, 1,
1.830621, -1.625209, 2.187464, 1, 0, 0.2470588, 1,
1.834235, 0.9644988, 0.8124927, 1, 0, 0.2392157, 1,
1.838025, 1.383084, 0.8216057, 1, 0, 0.2352941, 1,
1.844714, 1.931057, -0.2783788, 1, 0, 0.227451, 1,
1.869659, 0.7150328, 2.06975, 1, 0, 0.2235294, 1,
1.879724, -0.2815084, 3.135707, 1, 0, 0.2156863, 1,
1.891784, -3.081247, 1.491583, 1, 0, 0.2117647, 1,
1.914638, 0.6071504, 2.558995, 1, 0, 0.2039216, 1,
1.924452, -0.142535, 2.190034, 1, 0, 0.1960784, 1,
1.938691, -0.7592291, 3.167078, 1, 0, 0.1921569, 1,
1.944667, -0.5312419, 0.6250601, 1, 0, 0.1843137, 1,
1.945586, -0.2432272, 2.07218, 1, 0, 0.1803922, 1,
1.95732, 0.7785828, 0.2824164, 1, 0, 0.172549, 1,
1.959228, -0.5522232, 2.725767, 1, 0, 0.1686275, 1,
1.963042, 0.1135305, 2.65453, 1, 0, 0.1607843, 1,
1.977699, 0.1353362, 1.001833, 1, 0, 0.1568628, 1,
1.994212, 0.4027271, 3.06967, 1, 0, 0.1490196, 1,
2.021179, -1.1586, 2.973381, 1, 0, 0.145098, 1,
2.082448, 0.6707549, 0.7431561, 1, 0, 0.1372549, 1,
2.083001, -0.4086736, 1.255573, 1, 0, 0.1333333, 1,
2.101739, 0.3600051, 1.470806, 1, 0, 0.1254902, 1,
2.111192, 0.2304995, 2.37994, 1, 0, 0.1215686, 1,
2.115799, -1.402416, 1.833547, 1, 0, 0.1137255, 1,
2.131802, -0.7979743, 3.405628, 1, 0, 0.1098039, 1,
2.142859, 0.8703742, -0.1114447, 1, 0, 0.1019608, 1,
2.163215, 1.71111, -0.7736129, 1, 0, 0.09411765, 1,
2.216439, -0.4679571, 1.366847, 1, 0, 0.09019608, 1,
2.269618, 0.1094934, 3.1607, 1, 0, 0.08235294, 1,
2.287108, 1.505667, 0.6752294, 1, 0, 0.07843138, 1,
2.305485, 0.4078646, 0.4628121, 1, 0, 0.07058824, 1,
2.420133, -1.054647, 1.835464, 1, 0, 0.06666667, 1,
2.473651, 1.243171, 3.216542, 1, 0, 0.05882353, 1,
2.639166, 0.3537523, 1.250539, 1, 0, 0.05490196, 1,
2.660689, -0.1189247, 2.164541, 1, 0, 0.04705882, 1,
2.760576, 0.6691457, 2.105438, 1, 0, 0.04313726, 1,
2.764139, 1.700195, 0.5433818, 1, 0, 0.03529412, 1,
2.791135, -2.39403, 1.503599, 1, 0, 0.03137255, 1,
2.858922, 0.8827776, 1.596962, 1, 0, 0.02352941, 1,
2.976986, 0.8819445, 1.480473, 1, 0, 0.01960784, 1,
3.66947, 2.09505, 1.88529, 1, 0, 0.01176471, 1,
3.955287, -0.7859051, -1.028751, 1, 0, 0.007843138, 1
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
0.2648797, -4.237867, -7.402168, 0, -0.5, 0.5, 0.5,
0.2648797, -4.237867, -7.402168, 1, -0.5, 0.5, 0.5,
0.2648797, -4.237867, -7.402168, 1, 1.5, 0.5, 0.5,
0.2648797, -4.237867, -7.402168, 0, 1.5, 0.5, 0.5
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
-4.676576, -0.05897164, -7.402168, 0, -0.5, 0.5, 0.5,
-4.676576, -0.05897164, -7.402168, 1, -0.5, 0.5, 0.5,
-4.676576, -0.05897164, -7.402168, 1, 1.5, 0.5, 0.5,
-4.676576, -0.05897164, -7.402168, 0, 1.5, 0.5, 0.5
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
-4.676576, -4.237867, -0.5810018, 0, -0.5, 0.5, 0.5,
-4.676576, -4.237867, -0.5810018, 1, -0.5, 0.5, 0.5,
-4.676576, -4.237867, -0.5810018, 1, 1.5, 0.5, 0.5,
-4.676576, -4.237867, -0.5810018, 0, 1.5, 0.5, 0.5
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
-2, -3.273506, -5.828053,
2, -3.273506, -5.828053,
-2, -3.273506, -5.828053,
-2, -3.434233, -6.090405,
0, -3.273506, -5.828053,
0, -3.434233, -6.090405,
2, -3.273506, -5.828053,
2, -3.434233, -6.090405
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
"-2",
"0",
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
-2, -3.755687, -6.61511, 0, -0.5, 0.5, 0.5,
-2, -3.755687, -6.61511, 1, -0.5, 0.5, 0.5,
-2, -3.755687, -6.61511, 1, 1.5, 0.5, 0.5,
-2, -3.755687, -6.61511, 0, 1.5, 0.5, 0.5,
0, -3.755687, -6.61511, 0, -0.5, 0.5, 0.5,
0, -3.755687, -6.61511, 1, -0.5, 0.5, 0.5,
0, -3.755687, -6.61511, 1, 1.5, 0.5, 0.5,
0, -3.755687, -6.61511, 0, 1.5, 0.5, 0.5,
2, -3.755687, -6.61511, 0, -0.5, 0.5, 0.5,
2, -3.755687, -6.61511, 1, -0.5, 0.5, 0.5,
2, -3.755687, -6.61511, 1, 1.5, 0.5, 0.5,
2, -3.755687, -6.61511, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.53624, -3, -5.828053,
-3.53624, 3, -5.828053,
-3.53624, -3, -5.828053,
-3.726296, -3, -6.090405,
-3.53624, -2, -5.828053,
-3.726296, -2, -6.090405,
-3.53624, -1, -5.828053,
-3.726296, -1, -6.090405,
-3.53624, 0, -5.828053,
-3.726296, 0, -6.090405,
-3.53624, 1, -5.828053,
-3.726296, 1, -6.090405,
-3.53624, 2, -5.828053,
-3.726296, 2, -6.090405,
-3.53624, 3, -5.828053,
-3.726296, 3, -6.090405
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
"-3",
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
-4.106408, -3, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, -3, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, -3, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, -3, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, -2, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, -2, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, -2, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, -2, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, -1, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, -1, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, -1, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, -1, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, 0, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, 0, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, 0, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, 0, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, 1, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, 1, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, 1, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, 1, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, 2, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, 2, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, 2, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, 2, -6.61511, 0, 1.5, 0.5, 0.5,
-4.106408, 3, -6.61511, 0, -0.5, 0.5, 0.5,
-4.106408, 3, -6.61511, 1, -0.5, 0.5, 0.5,
-4.106408, 3, -6.61511, 1, 1.5, 0.5, 0.5,
-4.106408, 3, -6.61511, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.53624, -3.273506, -4,
-3.53624, -3.273506, 4,
-3.53624, -3.273506, -4,
-3.726296, -3.434233, -4,
-3.53624, -3.273506, -2,
-3.726296, -3.434233, -2,
-3.53624, -3.273506, 0,
-3.726296, -3.434233, 0,
-3.53624, -3.273506, 2,
-3.726296, -3.434233, 2,
-3.53624, -3.273506, 4,
-3.726296, -3.434233, 4
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
-4.106408, -3.755687, -4, 0, -0.5, 0.5, 0.5,
-4.106408, -3.755687, -4, 1, -0.5, 0.5, 0.5,
-4.106408, -3.755687, -4, 1, 1.5, 0.5, 0.5,
-4.106408, -3.755687, -4, 0, 1.5, 0.5, 0.5,
-4.106408, -3.755687, -2, 0, -0.5, 0.5, 0.5,
-4.106408, -3.755687, -2, 1, -0.5, 0.5, 0.5,
-4.106408, -3.755687, -2, 1, 1.5, 0.5, 0.5,
-4.106408, -3.755687, -2, 0, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 0, 0, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 0, 1, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 0, 1, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 0, 0, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 2, 0, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 2, 1, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 2, 1, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 2, 0, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 4, 0, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 4, 1, -0.5, 0.5, 0.5,
-4.106408, -3.755687, 4, 1, 1.5, 0.5, 0.5,
-4.106408, -3.755687, 4, 0, 1.5, 0.5, 0.5
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
-3.53624, -3.273506, -5.828053,
-3.53624, 3.155563, -5.828053,
-3.53624, -3.273506, 4.666049,
-3.53624, 3.155563, 4.666049,
-3.53624, -3.273506, -5.828053,
-3.53624, -3.273506, 4.666049,
-3.53624, 3.155563, -5.828053,
-3.53624, 3.155563, 4.666049,
-3.53624, -3.273506, -5.828053,
4.065999, -3.273506, -5.828053,
-3.53624, -3.273506, 4.666049,
4.065999, -3.273506, 4.666049,
-3.53624, 3.155563, -5.828053,
4.065999, 3.155563, -5.828053,
-3.53624, 3.155563, 4.666049,
4.065999, 3.155563, 4.666049,
4.065999, -3.273506, -5.828053,
4.065999, 3.155563, -5.828053,
4.065999, -3.273506, 4.666049,
4.065999, 3.155563, 4.666049,
4.065999, -3.273506, -5.828053,
4.065999, -3.273506, 4.666049,
4.065999, 3.155563, -5.828053,
4.065999, 3.155563, 4.666049
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
var radius = 7.724341;
var distance = 34.36647;
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
mvMatrix.translate( -0.2648797, 0.05897164, 0.5810018 );
mvMatrix.scale( 1.098585, 1.299054, 0.795848 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36647);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
NAA<-read.table("NAA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-NAA$V2
```

```
## Error in eval(expr, envir, enclos): object 'NAA' not found
```

```r
y<-NAA$V3
```

```
## Error in eval(expr, envir, enclos): object 'NAA' not found
```

```r
z<-NAA$V4
```

```
## Error in eval(expr, envir, enclos): object 'NAA' not found
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
-3.425528, 1.357621, -2.433336, 0, 0, 1, 1, 1,
-3.017058, 0.3434762, -2.281128, 1, 0, 0, 1, 1,
-2.626415, -0.6082813, -1.246709, 1, 0, 0, 1, 1,
-2.592127, 0.3906605, -2.027526, 1, 0, 0, 1, 1,
-2.575865, 0.9295418, -0.61704, 1, 0, 0, 1, 1,
-2.554538, 0.4439653, -1.534828, 1, 0, 0, 1, 1,
-2.543548, 1.437754, -3.195704, 0, 0, 0, 1, 1,
-2.514112, -0.08966854, -1.734982, 0, 0, 0, 1, 1,
-2.462943, -1.5989, -1.75016, 0, 0, 0, 1, 1,
-2.428962, 1.977534, -0.4409429, 0, 0, 0, 1, 1,
-2.345881, 2.102225, -1.077034, 0, 0, 0, 1, 1,
-2.187104, -1.591105, -1.665058, 0, 0, 0, 1, 1,
-2.148355, -1.420666, -3.297029, 0, 0, 0, 1, 1,
-2.145831, 0.2849851, 0.2356921, 1, 1, 1, 1, 1,
-2.092899, 0.9446799, -1.364361, 1, 1, 1, 1, 1,
-2.014829, -0.5796651, -1.641922, 1, 1, 1, 1, 1,
-2.010152, 0.0301307, -1.172171, 1, 1, 1, 1, 1,
-1.936485, 0.4993897, -2.283323, 1, 1, 1, 1, 1,
-1.930248, -1.276217, -1.797608, 1, 1, 1, 1, 1,
-1.928137, 1.015675, -0.8907226, 1, 1, 1, 1, 1,
-1.899338, 0.6082944, -1.270876, 1, 1, 1, 1, 1,
-1.896998, 0.190068, -3.311796, 1, 1, 1, 1, 1,
-1.896749, -0.8900185, -2.128664, 1, 1, 1, 1, 1,
-1.892843, 0.9765047, -3.282542, 1, 1, 1, 1, 1,
-1.870749, -1.874705, -2.721197, 1, 1, 1, 1, 1,
-1.870177, -0.7568976, 0.6278518, 1, 1, 1, 1, 1,
-1.86272, 0.002115631, 0.766253, 1, 1, 1, 1, 1,
-1.859943, -0.8102995, -2.514489, 1, 1, 1, 1, 1,
-1.852565, -1.691208, -0.627007, 0, 0, 1, 1, 1,
-1.828005, -2.186753, -3.151909, 1, 0, 0, 1, 1,
-1.824158, 1.362188, -2.691081, 1, 0, 0, 1, 1,
-1.800679, 0.9832581, -0.9974759, 1, 0, 0, 1, 1,
-1.79546, -0.01407177, -2.075942, 1, 0, 0, 1, 1,
-1.780392, -0.5294625, -0.2785474, 1, 0, 0, 1, 1,
-1.744206, 0.6835197, -2.72963, 0, 0, 0, 1, 1,
-1.726077, 0.05824959, -0.7318816, 0, 0, 0, 1, 1,
-1.72376, -0.03929414, -1.801213, 0, 0, 0, 1, 1,
-1.70975, -0.8791837, -0.9047645, 0, 0, 0, 1, 1,
-1.707846, -0.984444, -1.340212, 0, 0, 0, 1, 1,
-1.7029, 0.6078366, -3.672355, 0, 0, 0, 1, 1,
-1.692385, -0.6156896, 0.3347879, 0, 0, 0, 1, 1,
-1.652803, 0.1774673, -0.9419786, 1, 1, 1, 1, 1,
-1.652784, -0.5050443, -3.356181, 1, 1, 1, 1, 1,
-1.586582, -0.3199804, -2.589651, 1, 1, 1, 1, 1,
-1.579987, 0.205681, -2.191691, 1, 1, 1, 1, 1,
-1.568668, 0.5019062, -0.929792, 1, 1, 1, 1, 1,
-1.555607, -0.7165828, -0.3277181, 1, 1, 1, 1, 1,
-1.550319, 0.04718367, -1.332968, 1, 1, 1, 1, 1,
-1.543012, 0.9189456, 0.003977257, 1, 1, 1, 1, 1,
-1.531846, -1.165508, -3.347719, 1, 1, 1, 1, 1,
-1.530446, 1.667928, -0.4714646, 1, 1, 1, 1, 1,
-1.509116, -1.687985, -2.161592, 1, 1, 1, 1, 1,
-1.497217, -1.18257, 0.1559767, 1, 1, 1, 1, 1,
-1.486323, 0.6535804, -0.1119021, 1, 1, 1, 1, 1,
-1.484588, 0.2191548, -0.9258741, 1, 1, 1, 1, 1,
-1.48362, -1.183639, -2.023256, 1, 1, 1, 1, 1,
-1.483541, -0.7457467, -1.369075, 0, 0, 1, 1, 1,
-1.479129, 0.6120532, -0.5866966, 1, 0, 0, 1, 1,
-1.470243, 0.3217301, -0.4685179, 1, 0, 0, 1, 1,
-1.469872, 0.02193596, 0.3366556, 1, 0, 0, 1, 1,
-1.468878, -0.3218746, -3.24854, 1, 0, 0, 1, 1,
-1.463184, -0.09247447, 0.4951245, 1, 0, 0, 1, 1,
-1.455521, 0.4790663, -1.782175, 0, 0, 0, 1, 1,
-1.454297, 0.7489579, -1.258642, 0, 0, 0, 1, 1,
-1.429282, 0.9362894, -0.4586648, 0, 0, 0, 1, 1,
-1.427695, -0.7212124, -3.197507, 0, 0, 0, 1, 1,
-1.422281, -0.519299, -1.297468, 0, 0, 0, 1, 1,
-1.415115, -0.1300517, -0.5816031, 0, 0, 0, 1, 1,
-1.414723, 1.108075, -0.6576638, 0, 0, 0, 1, 1,
-1.409383, -0.9573648, -1.856982, 1, 1, 1, 1, 1,
-1.405583, 0.2671246, -1.83241, 1, 1, 1, 1, 1,
-1.405141, 3.061936, -0.0961946, 1, 1, 1, 1, 1,
-1.400935, -1.381813, -3.062927, 1, 1, 1, 1, 1,
-1.396968, -0.4105693, -2.735733, 1, 1, 1, 1, 1,
-1.390274, 0.2219296, -2.513256, 1, 1, 1, 1, 1,
-1.388201, -0.8156897, -1.571475, 1, 1, 1, 1, 1,
-1.385477, -1.641659, -1.946674, 1, 1, 1, 1, 1,
-1.384424, 0.4650855, -1.36287, 1, 1, 1, 1, 1,
-1.376912, 2.377801, -0.9116698, 1, 1, 1, 1, 1,
-1.362491, -0.05597068, -0.9986914, 1, 1, 1, 1, 1,
-1.362113, 0.2137238, -3.209913, 1, 1, 1, 1, 1,
-1.352049, -0.7322866, -1.52557, 1, 1, 1, 1, 1,
-1.346662, 1.375993, 1.013668, 1, 1, 1, 1, 1,
-1.344355, 0.8618653, -1.357749, 1, 1, 1, 1, 1,
-1.339564, 0.08594418, -1.227567, 0, 0, 1, 1, 1,
-1.339467, -1.76709, -2.28529, 1, 0, 0, 1, 1,
-1.316863, 0.2752571, -0.6476398, 1, 0, 0, 1, 1,
-1.311162, 1.288098, -0.3695884, 1, 0, 0, 1, 1,
-1.31061, -0.2565914, -1.071576, 1, 0, 0, 1, 1,
-1.303913, 0.7163863, -1.619558, 1, 0, 0, 1, 1,
-1.297062, -0.128844, -1.264055, 0, 0, 0, 1, 1,
-1.295307, 0.6620755, 0.2633466, 0, 0, 0, 1, 1,
-1.292411, 0.296386, -1.979447, 0, 0, 0, 1, 1,
-1.291032, -1.414037, -2.981023, 0, 0, 0, 1, 1,
-1.265359, -1.238803, -0.8169203, 0, 0, 0, 1, 1,
-1.263001, 1.520083, 0.6029916, 0, 0, 0, 1, 1,
-1.253752, -1.176289, -2.24738, 0, 0, 0, 1, 1,
-1.247508, 0.8690423, 0.6174511, 1, 1, 1, 1, 1,
-1.247037, 0.2584151, -2.401576, 1, 1, 1, 1, 1,
-1.245366, -0.2779285, -0.8295229, 1, 1, 1, 1, 1,
-1.24407, 0.5220446, -1.308884, 1, 1, 1, 1, 1,
-1.242852, 0.6870839, 0.3548628, 1, 1, 1, 1, 1,
-1.241461, -1.145437, -1.607437, 1, 1, 1, 1, 1,
-1.213328, -1.392526, -3.204789, 1, 1, 1, 1, 1,
-1.211887, -0.4181325, -0.9958456, 1, 1, 1, 1, 1,
-1.206484, -0.3050667, -3.241619, 1, 1, 1, 1, 1,
-1.205704, 0.7971947, -1.48043, 1, 1, 1, 1, 1,
-1.205369, 1.727973, 0.3692432, 1, 1, 1, 1, 1,
-1.203927, -1.131199, -3.190921, 1, 1, 1, 1, 1,
-1.202648, 0.05674627, 0.3991637, 1, 1, 1, 1, 1,
-1.202076, 1.07629, -1.568342, 1, 1, 1, 1, 1,
-1.194711, -2.169993, -2.801426, 1, 1, 1, 1, 1,
-1.194467, -1.782062, -2.596708, 0, 0, 1, 1, 1,
-1.180547, 2.252959, 0.361761, 1, 0, 0, 1, 1,
-1.180163, -0.6026196, -1.313403, 1, 0, 0, 1, 1,
-1.177287, 1.159277, 0.4551924, 1, 0, 0, 1, 1,
-1.172321, 1.227317, 0.3902509, 1, 0, 0, 1, 1,
-1.165568, 0.7213166, 0.1314478, 1, 0, 0, 1, 1,
-1.157594, 0.2309691, -1.981886, 0, 0, 0, 1, 1,
-1.155875, -0.3161699, -2.197782, 0, 0, 0, 1, 1,
-1.155363, -1.978867, -2.965818, 0, 0, 0, 1, 1,
-1.150635, -0.3787328, -2.34086, 0, 0, 0, 1, 1,
-1.145216, 0.08592285, -0.2782294, 0, 0, 0, 1, 1,
-1.12797, 0.2722939, -1.554672, 0, 0, 0, 1, 1,
-1.120425, -0.9295464, -2.697842, 0, 0, 0, 1, 1,
-1.118127, 0.5942138, -0.422946, 1, 1, 1, 1, 1,
-1.112728, 0.2644456, -2.026373, 1, 1, 1, 1, 1,
-1.10289, -1.575632, -2.037625, 1, 1, 1, 1, 1,
-1.099157, 0.4690009, -1.128924, 1, 1, 1, 1, 1,
-1.09902, 1.602346, 0.7071853, 1, 1, 1, 1, 1,
-1.081129, 0.1491466, -2.874366, 1, 1, 1, 1, 1,
-1.067869, 0.7186272, -2.254038, 1, 1, 1, 1, 1,
-1.067079, 0.01241645, -1.138808, 1, 1, 1, 1, 1,
-1.066317, -0.1257173, -2.481472, 1, 1, 1, 1, 1,
-1.065465, -0.7993557, -1.406758, 1, 1, 1, 1, 1,
-1.062028, -0.3265992, -1.135105, 1, 1, 1, 1, 1,
-1.061447, 0.5913339, -0.7830525, 1, 1, 1, 1, 1,
-1.05791, -2.14206, -2.820554, 1, 1, 1, 1, 1,
-1.056889, -0.5036671, -1.967726, 1, 1, 1, 1, 1,
-1.049179, -1.165795, -4.548291, 1, 1, 1, 1, 1,
-1.047617, 1.084724, -1.040905, 0, 0, 1, 1, 1,
-1.040206, 0.1029846, -1.747205, 1, 0, 0, 1, 1,
-1.039516, 1.137538, -0.9424468, 1, 0, 0, 1, 1,
-1.03561, 0.8229749, -0.1173864, 1, 0, 0, 1, 1,
-1.034804, 0.05293283, -2.346616, 1, 0, 0, 1, 1,
-1.018, 0.01406351, 0.7754811, 1, 0, 0, 1, 1,
-1.010393, -0.113255, -1.600671, 0, 0, 0, 1, 1,
-1.008095, -0.1531138, -1.971573, 0, 0, 0, 1, 1,
-1.007483, -0.2611407, -2.944166, 0, 0, 0, 1, 1,
-1.005461, 1.897928, -1.744481, 0, 0, 0, 1, 1,
-1.003593, -0.2187586, -0.9538736, 0, 0, 0, 1, 1,
-1.002971, 0.8170043, -3.082386, 0, 0, 0, 1, 1,
-1.002948, 0.5412667, -1.240928, 0, 0, 0, 1, 1,
-0.9997296, -1.442254, -3.394111, 1, 1, 1, 1, 1,
-0.9898966, 0.495797, 1.013621, 1, 1, 1, 1, 1,
-0.9885185, -0.5224103, -2.268277, 1, 1, 1, 1, 1,
-0.9870583, 0.6241599, -0.7354579, 1, 1, 1, 1, 1,
-0.98692, 0.6314837, -0.9922245, 1, 1, 1, 1, 1,
-0.982243, 0.5696533, -1.433488, 1, 1, 1, 1, 1,
-0.9820721, -0.5923185, -0.7031335, 1, 1, 1, 1, 1,
-0.9807181, 2.34193, 0.156912, 1, 1, 1, 1, 1,
-0.9762638, 1.402654, -1.302564, 1, 1, 1, 1, 1,
-0.9704256, -1.037354, -1.573205, 1, 1, 1, 1, 1,
-0.9664639, 1.308597, -1.184243, 1, 1, 1, 1, 1,
-0.9657388, -0.7668004, -1.216668, 1, 1, 1, 1, 1,
-0.959505, -0.1850964, -1.867549, 1, 1, 1, 1, 1,
-0.9539746, 1.447384, 0.612928, 1, 1, 1, 1, 1,
-0.9538487, 0.8954508, -0.5799181, 1, 1, 1, 1, 1,
-0.946204, 0.4290851, -0.3424736, 0, 0, 1, 1, 1,
-0.9430284, 0.7086254, -0.9185808, 1, 0, 0, 1, 1,
-0.9415308, 1.777439, -0.8540349, 1, 0, 0, 1, 1,
-0.9386356, -0.9841549, -2.842077, 1, 0, 0, 1, 1,
-0.9356093, -1.188509, -3.561021, 1, 0, 0, 1, 1,
-0.9280432, 0.7418113, -1.376968, 1, 0, 0, 1, 1,
-0.9075198, 0.1664823, -0.7365755, 0, 0, 0, 1, 1,
-0.9073667, -0.1676545, -1.025075, 0, 0, 0, 1, 1,
-0.9057224, 1.838498, 0.08348318, 0, 0, 0, 1, 1,
-0.8963776, 0.1693442, -0.1046599, 0, 0, 0, 1, 1,
-0.8958318, 0.01946497, -1.006338, 0, 0, 0, 1, 1,
-0.8954623, -0.9887978, -1.933926, 0, 0, 0, 1, 1,
-0.8936673, -1.439407, -4.087371, 0, 0, 0, 1, 1,
-0.8936294, -1.224884, -2.426746, 1, 1, 1, 1, 1,
-0.8935597, -0.1149331, 0.4554001, 1, 1, 1, 1, 1,
-0.8866046, -2.30777, -3.149838, 1, 1, 1, 1, 1,
-0.8864759, -0.5070549, -3.399562, 1, 1, 1, 1, 1,
-0.8858585, 1.953275, -0.6466961, 1, 1, 1, 1, 1,
-0.8839118, -1.192253, -1.332893, 1, 1, 1, 1, 1,
-0.8808889, 1.512489, -0.3370501, 1, 1, 1, 1, 1,
-0.8792923, 1.716224, -1.411414, 1, 1, 1, 1, 1,
-0.8786553, 1.255932, 0.3935682, 1, 1, 1, 1, 1,
-0.8729816, -1.893808, -1.175487, 1, 1, 1, 1, 1,
-0.8727836, -1.123869, -3.225349, 1, 1, 1, 1, 1,
-0.8709532, 1.519742, 1.21786, 1, 1, 1, 1, 1,
-0.8677533, 0.9712195, -1.08042, 1, 1, 1, 1, 1,
-0.8571624, -1.695444, -4.470161, 1, 1, 1, 1, 1,
-0.8486728, 1.487233, -0.7828249, 1, 1, 1, 1, 1,
-0.8458357, -1.390218, -5.392043, 0, 0, 1, 1, 1,
-0.845421, -1.382578, -4.219983, 1, 0, 0, 1, 1,
-0.8425475, -1.25159, -2.627385, 1, 0, 0, 1, 1,
-0.8419379, 1.001998, -0.5072513, 1, 0, 0, 1, 1,
-0.8416172, 1.245685, -1.381317, 1, 0, 0, 1, 1,
-0.8377087, 0.2453744, -0.9946038, 1, 0, 0, 1, 1,
-0.8316937, -0.8494201, -2.377017, 0, 0, 0, 1, 1,
-0.831596, 1.525944, 0.2487867, 0, 0, 0, 1, 1,
-0.8296494, -2.13041, -2.758502, 0, 0, 0, 1, 1,
-0.8296319, 1.307078, -2.279124, 0, 0, 0, 1, 1,
-0.8270132, 0.6633474, -3.153385, 0, 0, 0, 1, 1,
-0.8266275, 1.876632, -0.2440957, 0, 0, 0, 1, 1,
-0.8209641, 0.1527616, -1.717199, 0, 0, 0, 1, 1,
-0.8138366, -0.6409774, -1.127427, 1, 1, 1, 1, 1,
-0.8123621, -0.7882032, -2.077552, 1, 1, 1, 1, 1,
-0.8098292, -0.120645, -1.917221, 1, 1, 1, 1, 1,
-0.8096887, 0.07355964, -1.778347, 1, 1, 1, 1, 1,
-0.8092672, 0.3281087, 0.7063459, 1, 1, 1, 1, 1,
-0.8076782, -0.6328394, -2.781392, 1, 1, 1, 1, 1,
-0.8075413, 0.2625534, -0.5097155, 1, 1, 1, 1, 1,
-0.806211, 1.042935, -0.9543509, 1, 1, 1, 1, 1,
-0.8009531, -0.2889792, -2.353785, 1, 1, 1, 1, 1,
-0.797334, 0.4798645, 0.0043719, 1, 1, 1, 1, 1,
-0.7973019, 0.2524541, -0.5689263, 1, 1, 1, 1, 1,
-0.7956434, 0.8981014, -1.12339, 1, 1, 1, 1, 1,
-0.7941824, 1.786289, -0.2617632, 1, 1, 1, 1, 1,
-0.7938414, 1.012911, -0.9528431, 1, 1, 1, 1, 1,
-0.7932226, -0.3364627, -1.415791, 1, 1, 1, 1, 1,
-0.7855842, -0.1648011, -0.5940501, 0, 0, 1, 1, 1,
-0.7854756, -0.4647063, -0.6194158, 1, 0, 0, 1, 1,
-0.7830319, -0.7654533, -1.497806, 1, 0, 0, 1, 1,
-0.7811886, 0.8208056, -0.5385419, 1, 0, 0, 1, 1,
-0.7741125, 0.2355461, -0.9998524, 1, 0, 0, 1, 1,
-0.7669143, -1.708208, -1.213535, 1, 0, 0, 1, 1,
-0.7594293, -1.781026, -4.203841, 0, 0, 0, 1, 1,
-0.7539595, -0.2737699, -3.374778, 0, 0, 0, 1, 1,
-0.7370278, 0.6936911, 0.4221675, 0, 0, 0, 1, 1,
-0.7363799, 0.2400341, -1.58234, 0, 0, 0, 1, 1,
-0.7302614, -1.279474, -1.778198, 0, 0, 0, 1, 1,
-0.7297248, 0.5102417, -1.226761, 0, 0, 0, 1, 1,
-0.7235555, -1.837804, -1.262333, 0, 0, 0, 1, 1,
-0.7231646, 1.614525, -1.054789, 1, 1, 1, 1, 1,
-0.716906, 1.383491, -0.643747, 1, 1, 1, 1, 1,
-0.7135016, -0.9173524, -2.758171, 1, 1, 1, 1, 1,
-0.7131523, 0.3442127, -0.9218838, 1, 1, 1, 1, 1,
-0.711809, 0.03629362, -1.792219, 1, 1, 1, 1, 1,
-0.7112479, 0.1568466, -0.7698706, 1, 1, 1, 1, 1,
-0.7095833, -1.175316, -1.821187, 1, 1, 1, 1, 1,
-0.7093479, -1.162022, -3.15057, 1, 1, 1, 1, 1,
-0.7054847, -1.302284, -1.238986, 1, 1, 1, 1, 1,
-0.7016617, 0.2054837, -0.8878045, 1, 1, 1, 1, 1,
-0.7003433, -0.1940313, -2.149283, 1, 1, 1, 1, 1,
-0.6998122, 0.5253899, 1.329259, 1, 1, 1, 1, 1,
-0.6985561, 1.279714, -1.792283, 1, 1, 1, 1, 1,
-0.697448, -1.232431, -0.9492473, 1, 1, 1, 1, 1,
-0.6954629, -0.3501643, -1.73915, 1, 1, 1, 1, 1,
-0.693703, -0.121375, -0.3143535, 0, 0, 1, 1, 1,
-0.6897061, -0.2335204, -1.019605, 1, 0, 0, 1, 1,
-0.6891838, -2.605156, -4.826184, 1, 0, 0, 1, 1,
-0.6886714, 0.2412401, -0.7141405, 1, 0, 0, 1, 1,
-0.6873681, 0.1708336, -1.723462, 1, 0, 0, 1, 1,
-0.6848402, -0.7931641, -1.777425, 1, 0, 0, 1, 1,
-0.6826571, 0.6056843, -0.6661419, 0, 0, 0, 1, 1,
-0.6810471, 0.954038, 1.07286, 0, 0, 0, 1, 1,
-0.6793156, 0.06450368, -1.53634, 0, 0, 0, 1, 1,
-0.6710346, 1.474469, -1.274628, 0, 0, 0, 1, 1,
-0.66984, -1.01076, -2.494756, 0, 0, 0, 1, 1,
-0.6666508, 1.737508, 0.4320874, 0, 0, 0, 1, 1,
-0.6635329, 1.09531, 1.500569, 0, 0, 0, 1, 1,
-0.6632202, -0.5763937, -2.289385, 1, 1, 1, 1, 1,
-0.6628124, 1.372638, -0.05429215, 1, 1, 1, 1, 1,
-0.6616203, 1.240772, -0.4617107, 1, 1, 1, 1, 1,
-0.6572376, 1.141078, -0.7508904, 1, 1, 1, 1, 1,
-0.6508874, -0.2306591, -1.960988, 1, 1, 1, 1, 1,
-0.6484625, -1.308095, -3.5144, 1, 1, 1, 1, 1,
-0.6481654, -0.4544487, -1.557768, 1, 1, 1, 1, 1,
-0.6480595, 0.7475842, -0.6956131, 1, 1, 1, 1, 1,
-0.6430199, 1.011485, 0.6345519, 1, 1, 1, 1, 1,
-0.6412417, 0.2780876, 0.06540552, 1, 1, 1, 1, 1,
-0.6372948, -1.080059, -3.607779, 1, 1, 1, 1, 1,
-0.6344478, -0.465052, -1.647983, 1, 1, 1, 1, 1,
-0.6318724, -0.938364, -0.9573032, 1, 1, 1, 1, 1,
-0.6225787, 0.6926157, 0.3217149, 1, 1, 1, 1, 1,
-0.6144817, 0.4238593, -0.2107873, 1, 1, 1, 1, 1,
-0.6088745, 1.383362, 1.397027, 0, 0, 1, 1, 1,
-0.6081308, -0.5954974, -4.525221, 1, 0, 0, 1, 1,
-0.6046689, -0.3743822, -2.197282, 1, 0, 0, 1, 1,
-0.6038129, 2.408994, 0.8242344, 1, 0, 0, 1, 1,
-0.6027686, 1.024236, 0.257873, 1, 0, 0, 1, 1,
-0.6027142, -0.7054664, -3.932813, 1, 0, 0, 1, 1,
-0.6023722, -0.7177823, -3.010649, 0, 0, 0, 1, 1,
-0.6007596, 1.188514, -0.5445901, 0, 0, 0, 1, 1,
-0.6005765, 1.071709, 0.5984191, 0, 0, 0, 1, 1,
-0.5977319, -0.6857182, -4.306599, 0, 0, 0, 1, 1,
-0.5975326, -2.459651, -1.976905, 0, 0, 0, 1, 1,
-0.5973448, -0.3419602, -2.676212, 0, 0, 0, 1, 1,
-0.5920727, -0.6872255, -2.200352, 0, 0, 0, 1, 1,
-0.5818079, -0.3288207, -1.673796, 1, 1, 1, 1, 1,
-0.5739359, 1.079712, -1.720695, 1, 1, 1, 1, 1,
-0.5729663, 0.7475277, -2.937082, 1, 1, 1, 1, 1,
-0.5691978, -0.523033, -1.263789, 1, 1, 1, 1, 1,
-0.5646034, 0.6160323, -0.8741308, 1, 1, 1, 1, 1,
-0.5619251, -0.3437807, -2.838262, 1, 1, 1, 1, 1,
-0.560782, 1.428741, -1.541343, 1, 1, 1, 1, 1,
-0.5497805, -0.9353087, -1.772611, 1, 1, 1, 1, 1,
-0.5496648, -2.866578, -1.529086, 1, 1, 1, 1, 1,
-0.5451492, 0.7751542, 1.466028, 1, 1, 1, 1, 1,
-0.5436613, 0.5166172, -0.6695125, 1, 1, 1, 1, 1,
-0.5420039, -0.8937919, -2.14929, 1, 1, 1, 1, 1,
-0.5402976, -0.7028213, -1.23672, 1, 1, 1, 1, 1,
-0.5374871, 0.7622078, 0.9249438, 1, 1, 1, 1, 1,
-0.5354465, 0.3694394, 0.2306399, 1, 1, 1, 1, 1,
-0.5312495, -1.642922, -2.278277, 0, 0, 1, 1, 1,
-0.53027, -1.092793, -3.127665, 1, 0, 0, 1, 1,
-0.5273615, 0.9418291, -1.248675, 1, 0, 0, 1, 1,
-0.5238633, -1.36781, -2.862016, 1, 0, 0, 1, 1,
-0.5235685, -0.7416439, -2.992172, 1, 0, 0, 1, 1,
-0.5231656, -0.8301017, -2.914752, 1, 0, 0, 1, 1,
-0.5174939, 0.1448947, -0.4762329, 0, 0, 0, 1, 1,
-0.5113335, -0.8824396, -3.639492, 0, 0, 0, 1, 1,
-0.5081975, 0.1890062, -1.327657, 0, 0, 0, 1, 1,
-0.5039409, 0.714831, -1.130761, 0, 0, 0, 1, 1,
-0.5018336, 0.2519476, 0.7453512, 0, 0, 0, 1, 1,
-0.4920222, 1.168996, 0.1452406, 0, 0, 0, 1, 1,
-0.4845534, -0.1942442, -2.512266, 0, 0, 0, 1, 1,
-0.4845117, -2.316329, -3.703052, 1, 1, 1, 1, 1,
-0.4838926, -1.297561, -3.01544, 1, 1, 1, 1, 1,
-0.4837637, -0.9938784, -2.229872, 1, 1, 1, 1, 1,
-0.4822214, 0.7074433, 0.5731444, 1, 1, 1, 1, 1,
-0.4820156, 2.310945, 0.8926088, 1, 1, 1, 1, 1,
-0.4779912, -0.04300104, -2.472191, 1, 1, 1, 1, 1,
-0.4742411, -0.9997795, -2.322407, 1, 1, 1, 1, 1,
-0.471875, -0.1091093, -0.8120568, 1, 1, 1, 1, 1,
-0.4713627, 1.435737, -1.329474, 1, 1, 1, 1, 1,
-0.4691379, -0.8406197, -3.38067, 1, 1, 1, 1, 1,
-0.4681929, 0.2645096, -1.928173, 1, 1, 1, 1, 1,
-0.4654337, 1.089134, -0.315333, 1, 1, 1, 1, 1,
-0.4653534, -2.803927, -2.645205, 1, 1, 1, 1, 1,
-0.4574559, -1.495543, -2.739328, 1, 1, 1, 1, 1,
-0.4550465, -2.201705, -1.336141, 1, 1, 1, 1, 1,
-0.4549665, 0.9325057, -0.608441, 0, 0, 1, 1, 1,
-0.4475988, -0.5275789, -2.850969, 1, 0, 0, 1, 1,
-0.4472785, -0.6867614, -1.596745, 1, 0, 0, 1, 1,
-0.44361, -0.6067051, -5.318479, 1, 0, 0, 1, 1,
-0.4405865, 0.6934568, -1.348194, 1, 0, 0, 1, 1,
-0.4401953, 1.74063, 1.252171, 1, 0, 0, 1, 1,
-0.4377748, -1.687384, -3.664981, 0, 0, 0, 1, 1,
-0.4353887, -0.3192492, -1.226788, 0, 0, 0, 1, 1,
-0.4298828, -0.0285134, -0.472795, 0, 0, 0, 1, 1,
-0.424021, 0.6732913, -0.9231555, 0, 0, 0, 1, 1,
-0.4239635, -1.082884, -3.382536, 0, 0, 0, 1, 1,
-0.4238765, 0.2233749, -1.968142, 0, 0, 0, 1, 1,
-0.4205307, 1.530354, 0.3550652, 0, 0, 0, 1, 1,
-0.419944, 1.729224, 0.09299781, 1, 1, 1, 1, 1,
-0.4141958, 1.563575, -2.114837, 1, 1, 1, 1, 1,
-0.4135593, -0.3778219, -2.570338, 1, 1, 1, 1, 1,
-0.4097356, 0.7007023, -0.7677668, 1, 1, 1, 1, 1,
-0.4078436, 0.5036852, -0.5595229, 1, 1, 1, 1, 1,
-0.4074405, 0.7573778, 0.4271306, 1, 1, 1, 1, 1,
-0.4043816, -1.149896, -3.345988, 1, 1, 1, 1, 1,
-0.3966671, 0.6076099, -0.434842, 1, 1, 1, 1, 1,
-0.396024, -0.1807566, -1.462191, 1, 1, 1, 1, 1,
-0.3925449, 1.975032, 1.702517, 1, 1, 1, 1, 1,
-0.3923924, -0.650705, -1.824833, 1, 1, 1, 1, 1,
-0.3914934, 0.09706031, -0.8813919, 1, 1, 1, 1, 1,
-0.3874865, 0.2317454, -1.552445, 1, 1, 1, 1, 1,
-0.3854162, -0.9007692, -3.38175, 1, 1, 1, 1, 1,
-0.3843721, 0.4577873, 2.368431, 1, 1, 1, 1, 1,
-0.381215, -0.7103202, -2.521047, 0, 0, 1, 1, 1,
-0.3812001, 1.523786, 1.038169, 1, 0, 0, 1, 1,
-0.3796978, 0.113005, 0.9658979, 1, 0, 0, 1, 1,
-0.3729901, -0.5079126, -3.963485, 1, 0, 0, 1, 1,
-0.3714522, -0.4281522, -1.020489, 1, 0, 0, 1, 1,
-0.3692971, 1.201862, 1.155413, 1, 0, 0, 1, 1,
-0.3663148, -0.3183145, -0.586693, 0, 0, 0, 1, 1,
-0.3615457, -1.044372, -4.032627, 0, 0, 0, 1, 1,
-0.3577093, -0.3777685, -1.554773, 0, 0, 0, 1, 1,
-0.3514655, 0.7051795, -0.8311758, 0, 0, 0, 1, 1,
-0.3510517, 0.1086101, -0.6001363, 0, 0, 0, 1, 1,
-0.3495661, -1.066829, -2.525939, 0, 0, 0, 1, 1,
-0.3458549, 0.2977615, -1.77284, 0, 0, 0, 1, 1,
-0.3448597, 0.3316849, -1.248623, 1, 1, 1, 1, 1,
-0.3432164, -0.5092344, -3.146673, 1, 1, 1, 1, 1,
-0.3414627, -1.161498, -3.055209, 1, 1, 1, 1, 1,
-0.3404046, 0.03866976, -1.963443, 1, 1, 1, 1, 1,
-0.3392936, 0.8460382, -2.491226, 1, 1, 1, 1, 1,
-0.3349805, -0.210797, -2.683088, 1, 1, 1, 1, 1,
-0.3340574, -0.2306157, -3.234424, 1, 1, 1, 1, 1,
-0.3302866, -0.4660231, -3.010572, 1, 1, 1, 1, 1,
-0.3262053, 0.116072, -1.0005, 1, 1, 1, 1, 1,
-0.3163474, -0.02598227, -4.148268, 1, 1, 1, 1, 1,
-0.3120103, 1.200385, 1.013292, 1, 1, 1, 1, 1,
-0.3107168, -0.5020179, -2.821205, 1, 1, 1, 1, 1,
-0.3103811, -0.9811553, -2.547003, 1, 1, 1, 1, 1,
-0.3061451, 0.2023922, 0.4225799, 1, 1, 1, 1, 1,
-0.3005254, 1.729891, 0.4340017, 1, 1, 1, 1, 1,
-0.2991914, 0.6969817, -0.1384106, 0, 0, 1, 1, 1,
-0.2956037, -0.6257085, -3.990792, 1, 0, 0, 1, 1,
-0.2938309, -1.175858, -3.712383, 1, 0, 0, 1, 1,
-0.2901498, -0.8350562, -2.338939, 1, 0, 0, 1, 1,
-0.2891396, 1.490423, -0.483455, 1, 0, 0, 1, 1,
-0.2839811, 0.4080739, -0.9276825, 1, 0, 0, 1, 1,
-0.2790397, 0.474674, -0.251359, 0, 0, 0, 1, 1,
-0.271547, -0.1796573, -2.752016, 0, 0, 0, 1, 1,
-0.2686244, -1.890907, -2.279257, 0, 0, 0, 1, 1,
-0.2673585, -1.832351, -3.477968, 0, 0, 0, 1, 1,
-0.265177, -0.514489, -2.738041, 0, 0, 0, 1, 1,
-0.260561, -1.320782, -3.889515, 0, 0, 0, 1, 1,
-0.2598174, -0.5825883, -1.77653, 0, 0, 0, 1, 1,
-0.2555089, -0.2461121, -4.434465, 1, 1, 1, 1, 1,
-0.2543769, 2.240948, 1.996878, 1, 1, 1, 1, 1,
-0.2516871, 0.9046386, -1.009714, 1, 1, 1, 1, 1,
-0.2506544, 0.332707, -1.096883, 1, 1, 1, 1, 1,
-0.2503503, -0.6198965, -1.736318, 1, 1, 1, 1, 1,
-0.2494691, -0.2291312, -3.997823, 1, 1, 1, 1, 1,
-0.2484642, 2.011298, -0.2207726, 1, 1, 1, 1, 1,
-0.2447691, 0.2105003, -0.7002805, 1, 1, 1, 1, 1,
-0.2421429, -0.8893318, -3.179873, 1, 1, 1, 1, 1,
-0.2407537, -0.6368896, -2.364539, 1, 1, 1, 1, 1,
-0.2329374, -0.4934368, -1.946551, 1, 1, 1, 1, 1,
-0.2318836, -0.4536558, -3.75613, 1, 1, 1, 1, 1,
-0.2283898, -0.9880863, -3.08315, 1, 1, 1, 1, 1,
-0.2278919, 0.6464264, 0.06155549, 1, 1, 1, 1, 1,
-0.2213689, 0.3866162, -0.9598644, 1, 1, 1, 1, 1,
-0.2197183, -0.8405201, -4.409993, 0, 0, 1, 1, 1,
-0.2165504, -0.4970669, -3.043378, 1, 0, 0, 1, 1,
-0.2139491, -0.006206525, -0.03179592, 1, 0, 0, 1, 1,
-0.2135877, 0.4427058, 0.7402495, 1, 0, 0, 1, 1,
-0.207307, 1.203519, -0.7092251, 1, 0, 0, 1, 1,
-0.207051, -1.074771, -3.523396, 1, 0, 0, 1, 1,
-0.2050277, -1.109886, -0.9342317, 0, 0, 0, 1, 1,
-0.204754, 0.2505444, -0.8202281, 0, 0, 0, 1, 1,
-0.2034881, 1.209612, -0.3134185, 0, 0, 0, 1, 1,
-0.2010868, 2.853353, 0.6237729, 0, 0, 0, 1, 1,
-0.1936202, 1.123985, -0.9622489, 0, 0, 0, 1, 1,
-0.1935704, 0.4797248, 0.5649738, 0, 0, 0, 1, 1,
-0.1846716, -0.8759745, -4.540783, 0, 0, 0, 1, 1,
-0.18416, 0.8037766, 0.6188412, 1, 1, 1, 1, 1,
-0.183178, 2.685856, 0.174902, 1, 1, 1, 1, 1,
-0.1815311, -0.002618983, -0.9303496, 1, 1, 1, 1, 1,
-0.1815113, -1.410994, -3.925353, 1, 1, 1, 1, 1,
-0.1807011, -0.5973749, -4.038745, 1, 1, 1, 1, 1,
-0.1772272, 1.843467, 0.02253166, 1, 1, 1, 1, 1,
-0.1690407, 0.7813946, -1.539844, 1, 1, 1, 1, 1,
-0.1677553, 1.544291, 0.5464447, 1, 1, 1, 1, 1,
-0.1668421, 0.1442194, -0.8454065, 1, 1, 1, 1, 1,
-0.1613222, 0.9894512, 0.7324213, 1, 1, 1, 1, 1,
-0.1608127, -1.833947, -3.320366, 1, 1, 1, 1, 1,
-0.1515879, -1.617678, -3.549704, 1, 1, 1, 1, 1,
-0.1424085, 0.611318, 0.5263461, 1, 1, 1, 1, 1,
-0.1411842, 0.3194112, -0.1863673, 1, 1, 1, 1, 1,
-0.1395967, -0.7244222, -3.729772, 1, 1, 1, 1, 1,
-0.1383006, -0.1319986, -2.465807, 0, 0, 1, 1, 1,
-0.1355998, -1.738216, -3.424124, 1, 0, 0, 1, 1,
-0.1297732, 1.699762, 0.2025992, 1, 0, 0, 1, 1,
-0.1272175, 0.3870164, -1.414964, 1, 0, 0, 1, 1,
-0.1255455, 1.101478, 0.44353, 1, 0, 0, 1, 1,
-0.1254275, 1.249499, 0.01476999, 1, 0, 0, 1, 1,
-0.1193852, 0.355213, -1.612959, 0, 0, 0, 1, 1,
-0.1176631, 0.1645004, -0.8470254, 0, 0, 0, 1, 1,
-0.1125444, 0.5342023, 0.6267442, 0, 0, 0, 1, 1,
-0.1124527, -0.4513187, -2.349391, 0, 0, 0, 1, 1,
-0.1067014, 0.09372385, -1.287994, 0, 0, 0, 1, 1,
-0.1061806, -1.159186, -5.248657, 0, 0, 0, 1, 1,
-0.1060615, -0.7209216, -3.562648, 0, 0, 0, 1, 1,
-0.1009142, -1.621242, -5.675226, 1, 1, 1, 1, 1,
-0.09890637, -0.538861, -3.338748, 1, 1, 1, 1, 1,
-0.09684931, -1.964679, -0.8602589, 1, 1, 1, 1, 1,
-0.09676135, 1.490444, -0.383316, 1, 1, 1, 1, 1,
-0.09507717, 0.3812968, -0.7224803, 1, 1, 1, 1, 1,
-0.09430726, 0.5840854, 0.2876706, 1, 1, 1, 1, 1,
-0.09299082, 0.5762682, -0.4503297, 1, 1, 1, 1, 1,
-0.09204459, -1.011732, -3.4411, 1, 1, 1, 1, 1,
-0.09024753, -1.037568, -4.752608, 1, 1, 1, 1, 1,
-0.08926427, 1.004237, 0.8100479, 1, 1, 1, 1, 1,
-0.08304919, -0.3171946, -1.665168, 1, 1, 1, 1, 1,
-0.08268712, 1.406597, -0.1278033, 1, 1, 1, 1, 1,
-0.07924579, -0.07745131, -2.266908, 1, 1, 1, 1, 1,
-0.07615387, -0.02928573, -2.03038, 1, 1, 1, 1, 1,
-0.07588831, -1.847444, -2.078552, 1, 1, 1, 1, 1,
-0.07435336, 0.1131157, -1.901224, 0, 0, 1, 1, 1,
-0.07260133, 0.6579182, -1.49287, 1, 0, 0, 1, 1,
-0.06767144, 0.09555204, 1.093344, 1, 0, 0, 1, 1,
-0.06045011, 0.7567006, 0.3700653, 1, 0, 0, 1, 1,
-0.06019571, 0.7854857, 0.5087131, 1, 0, 0, 1, 1,
-0.05877458, 0.5091744, 0.8332877, 1, 0, 0, 1, 1,
-0.05708369, 0.4005651, 0.4322887, 0, 0, 0, 1, 1,
-0.05389795, 1.299215, -0.09221468, 0, 0, 0, 1, 1,
-0.04759001, -0.5127197, -3.044269, 0, 0, 0, 1, 1,
-0.04441657, 0.7254814, -0.5434799, 0, 0, 0, 1, 1,
-0.04188551, -1.169661, -3.573068, 0, 0, 0, 1, 1,
-0.04059864, -0.572304, -4.101992, 0, 0, 0, 1, 1,
-0.03717251, 0.1987117, -0.8123196, 0, 0, 0, 1, 1,
-0.0344283, -0.4934898, -1.930181, 1, 1, 1, 1, 1,
-0.03399833, 1.682313, -0.3978078, 1, 1, 1, 1, 1,
-0.03375724, -0.4622204, -3.957753, 1, 1, 1, 1, 1,
-0.03113423, 1.147066, -1.535198, 1, 1, 1, 1, 1,
-0.03100409, 0.05318243, -0.7554495, 1, 1, 1, 1, 1,
-0.03091075, 0.8176422, -1.032024, 1, 1, 1, 1, 1,
-0.02891625, -2.026153, -0.1153315, 1, 1, 1, 1, 1,
-0.02596664, -1.360029, -3.450557, 1, 1, 1, 1, 1,
-0.02557236, -1.197238, 0.5667294, 1, 1, 1, 1, 1,
-0.02193957, 0.7855626, -0.2501696, 1, 1, 1, 1, 1,
-0.01832031, 0.08303025, -1.235518, 1, 1, 1, 1, 1,
-0.003261745, 0.4881653, -0.6391001, 1, 1, 1, 1, 1,
0.0003470355, -1.829771, 4.068126, 1, 1, 1, 1, 1,
0.002324377, 1.263378, -0.1471959, 1, 1, 1, 1, 1,
0.00300472, -0.0172732, 3.546119, 1, 1, 1, 1, 1,
0.003129141, -0.02967557, 3.553172, 0, 0, 1, 1, 1,
0.006645289, 0.06280733, -1.231759, 1, 0, 0, 1, 1,
0.007873044, 0.09537111, 1.479133, 1, 0, 0, 1, 1,
0.01599021, 1.687993, 2.331031, 1, 0, 0, 1, 1,
0.01805369, -0.09979195, 3.082168, 1, 0, 0, 1, 1,
0.02201461, 0.8658257, -1.792523, 1, 0, 0, 1, 1,
0.02637405, 0.3479626, 1.05486, 0, 0, 0, 1, 1,
0.02808229, 0.4491756, -0.8449019, 0, 0, 0, 1, 1,
0.03619393, 2.040147, -2.179706, 0, 0, 0, 1, 1,
0.04057382, -0.9018328, 2.351488, 0, 0, 0, 1, 1,
0.04821036, -0.1531239, 2.467252, 0, 0, 0, 1, 1,
0.04870002, 0.6529503, 0.3945272, 0, 0, 0, 1, 1,
0.05298736, -0.2888569, 3.485776, 0, 0, 0, 1, 1,
0.05573008, 0.1234914, 0.3998591, 1, 1, 1, 1, 1,
0.05603251, 1.18326, -1.64274, 1, 1, 1, 1, 1,
0.05672928, 0.7227203, -0.8146054, 1, 1, 1, 1, 1,
0.05709996, 1.133843, -0.7183679, 1, 1, 1, 1, 1,
0.0572102, 0.2847519, -0.08790041, 1, 1, 1, 1, 1,
0.06318566, -0.6276924, 2.718379, 1, 1, 1, 1, 1,
0.06521167, 1.437461, -0.111907, 1, 1, 1, 1, 1,
0.06795026, -0.2101929, 3.379163, 1, 1, 1, 1, 1,
0.07021657, -0.07579686, 3.592079, 1, 1, 1, 1, 1,
0.07411009, -0.7555736, 3.759296, 1, 1, 1, 1, 1,
0.07696618, 0.2124098, 0.07114796, 1, 1, 1, 1, 1,
0.08094291, -0.2246698, 3.656754, 1, 1, 1, 1, 1,
0.08281674, 0.4936717, -0.7585478, 1, 1, 1, 1, 1,
0.08560368, 0.06404047, 1.908279, 1, 1, 1, 1, 1,
0.08775876, -0.8019496, 3.563169, 1, 1, 1, 1, 1,
0.09079423, 0.6487037, -0.5177541, 0, 0, 1, 1, 1,
0.09291572, -0.8383019, 2.081008, 1, 0, 0, 1, 1,
0.09383462, 0.610542, -0.3908449, 1, 0, 0, 1, 1,
0.09471224, 0.963553, 1.497885, 1, 0, 0, 1, 1,
0.09619273, 0.2584533, -0.8591184, 1, 0, 0, 1, 1,
0.09634639, 1.235856, 0.6377897, 1, 0, 0, 1, 1,
0.09883741, -0.497925, 2.469546, 0, 0, 0, 1, 1,
0.09901322, -2.428235, 3.335899, 0, 0, 0, 1, 1,
0.101252, 0.2409486, -1.020772, 0, 0, 0, 1, 1,
0.1052857, -0.5533289, 1.540359, 0, 0, 0, 1, 1,
0.1061288, -0.6477451, 2.174779, 0, 0, 0, 1, 1,
0.1088408, -1.443662, 1.560899, 0, 0, 0, 1, 1,
0.1099639, 0.7601159, -0.2345675, 0, 0, 0, 1, 1,
0.1119923, 0.3465782, 2.651175, 1, 1, 1, 1, 1,
0.1134729, -0.04860368, 2.532028, 1, 1, 1, 1, 1,
0.1150361, -0.9671499, 4.173596, 1, 1, 1, 1, 1,
0.1168775, -0.5298817, 3.677651, 1, 1, 1, 1, 1,
0.1187169, 0.9266303, 0.4120406, 1, 1, 1, 1, 1,
0.1187195, 0.3798139, 0.792668, 1, 1, 1, 1, 1,
0.121382, -1.277553, 2.802181, 1, 1, 1, 1, 1,
0.1232753, 0.403527, 2.786252, 1, 1, 1, 1, 1,
0.1259684, -0.4965403, 3.092153, 1, 1, 1, 1, 1,
0.1268479, -0.6746418, 3.712427, 1, 1, 1, 1, 1,
0.133772, 0.6949953, -0.8292985, 1, 1, 1, 1, 1,
0.1338636, 1.1069, -0.4667428, 1, 1, 1, 1, 1,
0.1342914, 0.596168, 0.3726998, 1, 1, 1, 1, 1,
0.1363402, -0.7988743, 2.004205, 1, 1, 1, 1, 1,
0.1403343, 0.7203732, 1.338444, 1, 1, 1, 1, 1,
0.1404724, 0.4804553, -0.4095987, 0, 0, 1, 1, 1,
0.1427231, 1.00059, 1.772078, 1, 0, 0, 1, 1,
0.1461538, -0.8524874, 3.846843, 1, 0, 0, 1, 1,
0.1512468, -0.4932046, 3.027011, 1, 0, 0, 1, 1,
0.1567639, -0.2399824, 2.420594, 1, 0, 0, 1, 1,
0.1584014, 0.3462644, 0.3130376, 1, 0, 0, 1, 1,
0.1592609, -1.075081, 2.949163, 0, 0, 0, 1, 1,
0.1609567, 0.1437074, 0.993582, 0, 0, 0, 1, 1,
0.1618602, -0.391888, 2.195161, 0, 0, 0, 1, 1,
0.1698568, -1.145559, 2.250935, 0, 0, 0, 1, 1,
0.1700553, -0.9797075, 1.573579, 0, 0, 0, 1, 1,
0.1710705, 0.711242, -1.370196, 0, 0, 0, 1, 1,
0.1730053, 0.3108806, -0.5509629, 0, 0, 0, 1, 1,
0.1737595, -3.179879, 4.474932, 1, 1, 1, 1, 1,
0.1737604, 1.309754, -0.8388485, 1, 1, 1, 1, 1,
0.1765746, -2.364228, 2.816941, 1, 1, 1, 1, 1,
0.1786357, -0.08903205, 3.010327, 1, 1, 1, 1, 1,
0.1804758, 1.39156, 1.175017, 1, 1, 1, 1, 1,
0.1830211, -0.03275992, 2.722028, 1, 1, 1, 1, 1,
0.1844865, 0.3418474, 1.0967, 1, 1, 1, 1, 1,
0.187981, 0.7885486, -0.3193073, 1, 1, 1, 1, 1,
0.1885374, -0.9097688, 1.305933, 1, 1, 1, 1, 1,
0.189888, -1.240053, 3.877137, 1, 1, 1, 1, 1,
0.1922294, 0.4473578, 0.8382158, 1, 1, 1, 1, 1,
0.195714, -2.375403, 3.533617, 1, 1, 1, 1, 1,
0.1957201, -0.7460688, 0.4507408, 1, 1, 1, 1, 1,
0.1976841, 0.1589082, 1.448379, 1, 1, 1, 1, 1,
0.1981129, -2.402923, 2.893887, 1, 1, 1, 1, 1,
0.1982342, -0.2514414, 2.291996, 0, 0, 1, 1, 1,
0.1991203, 2.025729, 0.6916066, 1, 0, 0, 1, 1,
0.2001868, -1.702932, 2.344414, 1, 0, 0, 1, 1,
0.200367, 0.4900714, 0.7289252, 1, 0, 0, 1, 1,
0.2011723, 0.2580775, 2.155033, 1, 0, 0, 1, 1,
0.2030663, -0.1464229, 1.4858, 1, 0, 0, 1, 1,
0.2035305, -1.479107, 1.906099, 0, 0, 0, 1, 1,
0.2041826, -1.086474, 3.579988, 0, 0, 0, 1, 1,
0.2153432, 0.7611596, 1.389115, 0, 0, 0, 1, 1,
0.2159622, 0.8005422, 1.278334, 0, 0, 0, 1, 1,
0.217817, 0.2480218, 1.07827, 0, 0, 0, 1, 1,
0.2189648, -0.01168715, 2.548986, 0, 0, 0, 1, 1,
0.222768, 0.2507294, 0.8834881, 0, 0, 0, 1, 1,
0.2270865, -1.281481, 3.163979, 1, 1, 1, 1, 1,
0.230636, -0.7507881, 2.155367, 1, 1, 1, 1, 1,
0.2319458, 0.3789811, -1.197406, 1, 1, 1, 1, 1,
0.2349813, 1.376498, -0.9111652, 1, 1, 1, 1, 1,
0.235336, -0.6012969, 3.806774, 1, 1, 1, 1, 1,
0.2398511, 0.5673503, 0.5842077, 1, 1, 1, 1, 1,
0.2434421, 0.1470183, 1.676755, 1, 1, 1, 1, 1,
0.2527313, -1.529634, 1.45763, 1, 1, 1, 1, 1,
0.2571161, 0.9275178, 0.8123657, 1, 1, 1, 1, 1,
0.2609295, -1.638245, 3.297478, 1, 1, 1, 1, 1,
0.2629054, -0.9651898, 3.129313, 1, 1, 1, 1, 1,
0.2703013, 0.3666051, -0.1465266, 1, 1, 1, 1, 1,
0.2706143, 1.086991, -0.654436, 1, 1, 1, 1, 1,
0.2744922, 1.123373, -0.3396869, 1, 1, 1, 1, 1,
0.2778338, -0.596763, 1.363283, 1, 1, 1, 1, 1,
0.2789146, -0.8950056, 1.809428, 0, 0, 1, 1, 1,
0.2804414, 0.2373361, -0.5198078, 1, 0, 0, 1, 1,
0.2827043, 1.006231, -0.3306495, 1, 0, 0, 1, 1,
0.2944011, -1.294262, 2.649393, 1, 0, 0, 1, 1,
0.3000709, 0.762549, 0.5159184, 1, 0, 0, 1, 1,
0.3029173, -1.033576, 2.016396, 1, 0, 0, 1, 1,
0.3048745, -0.4265415, 1.423765, 0, 0, 0, 1, 1,
0.3087285, 0.7741678, 0.3528652, 0, 0, 0, 1, 1,
0.31067, 0.2479628, -0.5979103, 0, 0, 0, 1, 1,
0.3119859, 0.249255, -0.02456926, 0, 0, 0, 1, 1,
0.314234, 0.4755831, 1.383992, 0, 0, 0, 1, 1,
0.3144751, 0.2929064, 0.9184004, 0, 0, 0, 1, 1,
0.3184532, 2.759179, -0.3452663, 0, 0, 0, 1, 1,
0.3191238, 0.2941974, 0.7532378, 1, 1, 1, 1, 1,
0.3193312, 0.5618109, 0.1108068, 1, 1, 1, 1, 1,
0.3225884, -0.02811801, 2.030737, 1, 1, 1, 1, 1,
0.3230211, -0.9042463, 3.090928, 1, 1, 1, 1, 1,
0.3258994, 1.312355, 0.5206559, 1, 1, 1, 1, 1,
0.3264296, 0.5982647, 0.2796966, 1, 1, 1, 1, 1,
0.326433, 0.8186483, 0.4629299, 1, 1, 1, 1, 1,
0.3290282, 0.8756115, -1.687962, 1, 1, 1, 1, 1,
0.330106, 0.7900284, -1.275886, 1, 1, 1, 1, 1,
0.331969, 0.8336365, -0.728862, 1, 1, 1, 1, 1,
0.3331721, -1.042089, 3.044174, 1, 1, 1, 1, 1,
0.3349484, 1.504694, -0.01016549, 1, 1, 1, 1, 1,
0.3423749, 0.2058157, 1.633319, 1, 1, 1, 1, 1,
0.3438381, -0.1519657, 0.9358109, 1, 1, 1, 1, 1,
0.3525827, 0.83349, -0.6658285, 1, 1, 1, 1, 1,
0.3567145, 0.6664779, -0.6596503, 0, 0, 1, 1, 1,
0.3590289, 0.8698779, -0.2852853, 1, 0, 0, 1, 1,
0.3625883, 0.1187633, 1.022109, 1, 0, 0, 1, 1,
0.3643689, -0.006694617, 1.680369, 1, 0, 0, 1, 1,
0.3663674, 0.08557715, 3.334198, 1, 0, 0, 1, 1,
0.3711044, 1.194773, -0.552568, 1, 0, 0, 1, 1,
0.3781058, 0.9724365, -0.8890616, 0, 0, 0, 1, 1,
0.3781977, 1.341859, -0.3270067, 0, 0, 0, 1, 1,
0.3825048, 0.2272631, 0.8389677, 0, 0, 0, 1, 1,
0.3837045, -2.184012, 1.278111, 0, 0, 0, 1, 1,
0.3862446, -0.2133638, 3.785863, 0, 0, 0, 1, 1,
0.3927601, 0.6670131, -0.5157264, 0, 0, 0, 1, 1,
0.3954302, -0.07774314, 1.664819, 0, 0, 0, 1, 1,
0.4021159, -1.781541, 3.124047, 1, 1, 1, 1, 1,
0.4063288, -1.169411, 3.099276, 1, 1, 1, 1, 1,
0.4082415, 1.418147, -0.02704382, 1, 1, 1, 1, 1,
0.4123986, -1.67133, 2.925522, 1, 1, 1, 1, 1,
0.4151447, 0.4147186, 2.405174, 1, 1, 1, 1, 1,
0.4163161, -0.4438573, 3.154173, 1, 1, 1, 1, 1,
0.4203275, 0.05521265, 3.275295, 1, 1, 1, 1, 1,
0.4222818, -0.01391349, 0.3276927, 1, 1, 1, 1, 1,
0.4319235, -0.285262, 2.423635, 1, 1, 1, 1, 1,
0.4339179, -1.791627, 1.734853, 1, 1, 1, 1, 1,
0.4353459, 0.6487783, 1.395205, 1, 1, 1, 1, 1,
0.4361122, 0.6635081, 1.585265, 1, 1, 1, 1, 1,
0.4364188, 1.83776, -0.971925, 1, 1, 1, 1, 1,
0.4369377, -1.045716, 3.666812, 1, 1, 1, 1, 1,
0.4376762, -1.029358, 3.157248, 1, 1, 1, 1, 1,
0.4378901, -1.196161, 1.340391, 0, 0, 1, 1, 1,
0.4443852, -0.7123192, 2.471005, 1, 0, 0, 1, 1,
0.4450191, -0.7036237, 2.945292, 1, 0, 0, 1, 1,
0.4461124, -1.072612, 0.4687034, 1, 0, 0, 1, 1,
0.4483665, -1.84311, 2.215738, 1, 0, 0, 1, 1,
0.4487044, 0.4304862, 1.03945, 1, 0, 0, 1, 1,
0.4515756, -0.258209, 3.230095, 0, 0, 0, 1, 1,
0.4528928, -1.191538, 2.345809, 0, 0, 0, 1, 1,
0.4541983, 0.1717338, 1.271167, 0, 0, 0, 1, 1,
0.4555906, -2.926839, 2.833522, 0, 0, 0, 1, 1,
0.4581546, -0.5698851, 2.865232, 0, 0, 0, 1, 1,
0.4624593, 0.6535948, 1.575869, 0, 0, 0, 1, 1,
0.4646783, -0.1072047, 0.5583455, 0, 0, 0, 1, 1,
0.4659013, -0.7220563, 2.025969, 1, 1, 1, 1, 1,
0.4699039, 0.5191693, 1.2862, 1, 1, 1, 1, 1,
0.4751365, -2.037642, 1.968699, 1, 1, 1, 1, 1,
0.4760054, -1.53219, 3.51884, 1, 1, 1, 1, 1,
0.4773222, -1.474281, 1.16364, 1, 1, 1, 1, 1,
0.477335, -1.272982, 3.089704, 1, 1, 1, 1, 1,
0.477769, 0.863605, 1.13094, 1, 1, 1, 1, 1,
0.4781527, 0.7919555, 0.6563168, 1, 1, 1, 1, 1,
0.4784766, -0.4602547, 0.6069031, 1, 1, 1, 1, 1,
0.4788028, 0.3071957, 1.078279, 1, 1, 1, 1, 1,
0.4790117, -0.3189419, 1.735009, 1, 1, 1, 1, 1,
0.4813995, -0.238806, 2.430786, 1, 1, 1, 1, 1,
0.4844877, -0.343517, 1.381977, 1, 1, 1, 1, 1,
0.4874207, -1.109404, 2.533246, 1, 1, 1, 1, 1,
0.4983158, -0.03822535, 2.507868, 1, 1, 1, 1, 1,
0.4990373, 0.146511, 1.562788, 0, 0, 1, 1, 1,
0.5009719, -0.09880608, 1.616363, 1, 0, 0, 1, 1,
0.5010586, 0.1025171, 2.025587, 1, 0, 0, 1, 1,
0.5014434, 2.184838, 0.8543745, 1, 0, 0, 1, 1,
0.5069125, -0.3094848, 4.513222, 1, 0, 0, 1, 1,
0.5140421, 0.9308287, 1.644566, 1, 0, 0, 1, 1,
0.5213577, 0.2637797, 0.548121, 0, 0, 0, 1, 1,
0.5226129, -1.211347, 3.157006, 0, 0, 0, 1, 1,
0.5290734, -1.190749, 3.813028, 0, 0, 0, 1, 1,
0.5297784, -0.7179645, 2.562657, 0, 0, 0, 1, 1,
0.5297831, -0.9049634, 1.216119, 0, 0, 0, 1, 1,
0.5313033, 0.9027297, 1.414553, 0, 0, 0, 1, 1,
0.533824, -1.069363, 2.190685, 0, 0, 0, 1, 1,
0.5348358, 0.4549816, -0.01930573, 1, 1, 1, 1, 1,
0.5386985, 1.175754, -0.6698541, 1, 1, 1, 1, 1,
0.5401674, -1.316487, 3.456459, 1, 1, 1, 1, 1,
0.5412259, -1.377277, 1.660001, 1, 1, 1, 1, 1,
0.5499493, -0.6707636, 3.138221, 1, 1, 1, 1, 1,
0.5559592, -1.05647, 2.070683, 1, 1, 1, 1, 1,
0.5560296, -1.567057, 3.973851, 1, 1, 1, 1, 1,
0.5600263, -1.227806, 1.512907, 1, 1, 1, 1, 1,
0.5622855, -0.5437804, 1.41556, 1, 1, 1, 1, 1,
0.5630051, 2.415941, -0.7900607, 1, 1, 1, 1, 1,
0.5653713, 1.490005, 1.093082, 1, 1, 1, 1, 1,
0.5679075, 0.6170662, 0.8086711, 1, 1, 1, 1, 1,
0.5768351, -0.4565588, 3.091599, 1, 1, 1, 1, 1,
0.5770857, 0.6135061, 0.7188122, 1, 1, 1, 1, 1,
0.5799195, -0.04207782, 0.4552188, 1, 1, 1, 1, 1,
0.5810546, 0.9047959, 1.865933, 0, 0, 1, 1, 1,
0.5815724, 1.073274, 0.5675449, 1, 0, 0, 1, 1,
0.5886102, -0.4317657, 3.14118, 1, 0, 0, 1, 1,
0.5895376, 0.8427151, 1.086933, 1, 0, 0, 1, 1,
0.5946655, -0.1387378, 1.806486, 1, 0, 0, 1, 1,
0.6009594, -0.6977552, 2.323735, 1, 0, 0, 1, 1,
0.6034095, -1.303704, 2.519354, 0, 0, 0, 1, 1,
0.604513, -0.176634, 2.094479, 0, 0, 0, 1, 1,
0.6072493, 1.513654, 1.460467, 0, 0, 0, 1, 1,
0.608739, -0.2719195, 0.9296541, 0, 0, 0, 1, 1,
0.6146332, 1.441107, 0.8300213, 0, 0, 0, 1, 1,
0.6190103, -0.4537247, 2.360116, 0, 0, 0, 1, 1,
0.6209797, -0.1495986, 1.201417, 0, 0, 0, 1, 1,
0.6319116, -0.4730661, 2.279641, 1, 1, 1, 1, 1,
0.6358436, 0.5179361, 0.1768292, 1, 1, 1, 1, 1,
0.6408515, -0.5309286, 0.3449861, 1, 1, 1, 1, 1,
0.647345, 0.4449141, 0.8873244, 1, 1, 1, 1, 1,
0.6597777, -0.6414544, 1.33739, 1, 1, 1, 1, 1,
0.6605339, 0.2921093, 1.556614, 1, 1, 1, 1, 1,
0.661782, 0.7052895, 0.1840225, 1, 1, 1, 1, 1,
0.6619129, -0.9503099, 3.049213, 1, 1, 1, 1, 1,
0.6651998, -0.4603359, 4.038185, 1, 1, 1, 1, 1,
0.6663078, 0.3812459, 0.4440398, 1, 1, 1, 1, 1,
0.6681006, 0.03899053, -0.06580373, 1, 1, 1, 1, 1,
0.6682827, -1.306603, 3.508552, 1, 1, 1, 1, 1,
0.6686597, -1.729786, 3.832578, 1, 1, 1, 1, 1,
0.67097, -0.6798047, 2.113775, 1, 1, 1, 1, 1,
0.6790168, 0.2902583, -0.07667048, 1, 1, 1, 1, 1,
0.6806748, -1.011919, 3.863243, 0, 0, 1, 1, 1,
0.6834739, -0.02547182, 1.432594, 1, 0, 0, 1, 1,
0.6848112, -0.3819429, 4.043506, 1, 0, 0, 1, 1,
0.6860717, -1.31075, 1.707555, 1, 0, 0, 1, 1,
0.6865614, 1.439466, 1.386742, 1, 0, 0, 1, 1,
0.6885868, 0.3511234, 1.222661, 1, 0, 0, 1, 1,
0.6898459, 0.8039934, 0.3221137, 0, 0, 0, 1, 1,
0.6948617, 0.4704482, 0.2340463, 0, 0, 0, 1, 1,
0.7000738, -0.5581344, 3.226669, 0, 0, 0, 1, 1,
0.7021514, -0.940361, 3.993773, 0, 0, 0, 1, 1,
0.7070808, 1.443093, 2.893403, 0, 0, 0, 1, 1,
0.7167639, -0.2481523, 1.789201, 0, 0, 0, 1, 1,
0.719754, -0.5338699, 2.485953, 0, 0, 0, 1, 1,
0.724914, -0.3473448, 2.107791, 1, 1, 1, 1, 1,
0.7263146, -0.2781614, 1.423113, 1, 1, 1, 1, 1,
0.7291154, -0.463148, 1.0686, 1, 1, 1, 1, 1,
0.7377823, 0.4350343, 0.7359117, 1, 1, 1, 1, 1,
0.738562, 0.5874091, 2.124262, 1, 1, 1, 1, 1,
0.7391724, 0.372809, 1.013266, 1, 1, 1, 1, 1,
0.7409971, 0.9422286, 0.0211009, 1, 1, 1, 1, 1,
0.7412747, -0.3368238, 0.5315349, 1, 1, 1, 1, 1,
0.7500159, 2.211055, 0.6617661, 1, 1, 1, 1, 1,
0.7522554, 0.9310918, 2.122579, 1, 1, 1, 1, 1,
0.7526558, 1.090842, 0.1914913, 1, 1, 1, 1, 1,
0.7528334, -0.4140521, 1.288265, 1, 1, 1, 1, 1,
0.7586408, 0.2330675, 0.6871957, 1, 1, 1, 1, 1,
0.7595888, -1.416354, 3.117666, 1, 1, 1, 1, 1,
0.7603036, 0.5453556, 1.655704, 1, 1, 1, 1, 1,
0.7654229, -0.1796359, 1.826317, 0, 0, 1, 1, 1,
0.7673724, 1.433698, 0.2991076, 1, 0, 0, 1, 1,
0.7703802, -0.6804693, 1.809057, 1, 0, 0, 1, 1,
0.7712989, -0.1766041, 0.2756743, 1, 0, 0, 1, 1,
0.7749239, -1.078334, 3.991853, 1, 0, 0, 1, 1,
0.7916031, 0.1845794, 1.293614, 1, 0, 0, 1, 1,
0.7930562, -1.167363, 2.306227, 0, 0, 0, 1, 1,
0.7939136, -1.918694, 1.871731, 0, 0, 0, 1, 1,
0.7951986, 0.921128, 2.152084, 0, 0, 0, 1, 1,
0.7977938, 0.3648208, 1.396599, 0, 0, 0, 1, 1,
0.7983747, -1.233667, 1.197879, 0, 0, 0, 1, 1,
0.7986597, 0.3409568, 3.564018, 0, 0, 0, 1, 1,
0.8006331, -2.192129, 3.265196, 0, 0, 0, 1, 1,
0.8018774, 0.3468937, -0.09694325, 1, 1, 1, 1, 1,
0.8088461, -0.5831424, 2.863362, 1, 1, 1, 1, 1,
0.8100908, 1.556571, -0.8764467, 1, 1, 1, 1, 1,
0.8169925, -0.3546652, 0.009693695, 1, 1, 1, 1, 1,
0.8191821, 0.2086604, -0.04897285, 1, 1, 1, 1, 1,
0.821689, -1.027808, 2.231011, 1, 1, 1, 1, 1,
0.8278767, -0.6224837, 2.118469, 1, 1, 1, 1, 1,
0.8318962, 0.7626386, 1.066439, 1, 1, 1, 1, 1,
0.834556, 0.6092145, 1.380068, 1, 1, 1, 1, 1,
0.8453657, 0.6655675, 0.7136251, 1, 1, 1, 1, 1,
0.862289, -0.04622108, 2.197794, 1, 1, 1, 1, 1,
0.8630421, 0.9401374, 1.950646, 1, 1, 1, 1, 1,
0.8658692, -2.034151, 2.685407, 1, 1, 1, 1, 1,
0.8684582, -1.174055, 2.110121, 1, 1, 1, 1, 1,
0.868763, 1.316141, 1.748138, 1, 1, 1, 1, 1,
0.8696628, -0.9274332, 2.339303, 0, 0, 1, 1, 1,
0.8752007, -0.5765347, 2.059513, 1, 0, 0, 1, 1,
0.8759423, 1.284848, 0.957229, 1, 0, 0, 1, 1,
0.8776405, -0.3005595, 1.451792, 1, 0, 0, 1, 1,
0.8776554, 1.442127, 1.172771, 1, 0, 0, 1, 1,
0.8857002, -0.5307227, 3.149726, 1, 0, 0, 1, 1,
0.8904445, -0.1875145, 0.7808675, 0, 0, 0, 1, 1,
0.8913447, -1.781065, 1.967586, 0, 0, 0, 1, 1,
0.8921271, 0.9194542, -0.01454901, 0, 0, 0, 1, 1,
0.8934515, -2.332852, 3.248719, 0, 0, 0, 1, 1,
0.8980866, -1.045283, 2.982802, 0, 0, 0, 1, 1,
0.9031165, 0.2159536, 0.09744901, 0, 0, 0, 1, 1,
0.9054104, -0.129169, 1.256348, 0, 0, 0, 1, 1,
0.9076858, -0.4810015, 2.327193, 1, 1, 1, 1, 1,
0.9087318, 0.5721758, 1.461549, 1, 1, 1, 1, 1,
0.913536, -1.985839, 1.67851, 1, 1, 1, 1, 1,
0.9220031, -0.0168016, 0.6332683, 1, 1, 1, 1, 1,
0.9254141, 1.022362, 0.9663748, 1, 1, 1, 1, 1,
0.9255831, 0.4019853, 1.243082, 1, 1, 1, 1, 1,
0.9273119, 0.3929588, 0.3237567, 1, 1, 1, 1, 1,
0.9299561, -0.2320689, 1.482159, 1, 1, 1, 1, 1,
0.9337569, -0.9298181, 2.494586, 1, 1, 1, 1, 1,
0.9343999, 0.6788107, 0.632209, 1, 1, 1, 1, 1,
0.9356262, -0.231478, -1.053721, 1, 1, 1, 1, 1,
0.9424751, 2.001174, 1.092283, 1, 1, 1, 1, 1,
0.942738, 2.350598, -0.6203119, 1, 1, 1, 1, 1,
0.9457806, 1.005122, -0.1043346, 1, 1, 1, 1, 1,
0.9526231, 0.2356599, 1.211043, 1, 1, 1, 1, 1,
0.9615061, 0.4477984, 1.572831, 0, 0, 1, 1, 1,
0.965337, -0.2711314, 1.796242, 1, 0, 0, 1, 1,
0.972297, -0.5234441, 1.157895, 1, 0, 0, 1, 1,
0.975275, -0.4803868, 0.657205, 1, 0, 0, 1, 1,
0.9776466, -0.2209808, 1.444159, 1, 0, 0, 1, 1,
0.9812526, 1.23606, 1.528906, 1, 0, 0, 1, 1,
0.9826733, -0.06800904, 1.386215, 0, 0, 0, 1, 1,
0.9867789, 1.73025, 0.8755899, 0, 0, 0, 1, 1,
0.9944832, 1.405772, 2.19867, 0, 0, 0, 1, 1,
0.9963785, -0.2686029, 1.099401, 0, 0, 0, 1, 1,
0.9979922, -1.226515, 3.180956, 0, 0, 0, 1, 1,
1.000733, 0.5282395, 0.2204016, 0, 0, 0, 1, 1,
1.010307, 2.350806, -0.1756001, 0, 0, 0, 1, 1,
1.019348, 0.8238635, 0.200186, 1, 1, 1, 1, 1,
1.024797, -0.8924519, 1.596981, 1, 1, 1, 1, 1,
1.028896, -0.002079495, 2.411617, 1, 1, 1, 1, 1,
1.040403, 0.5170531, 0.7712972, 1, 1, 1, 1, 1,
1.045731, -0.137572, 2.761548, 1, 1, 1, 1, 1,
1.047443, 1.598754, -1.178482, 1, 1, 1, 1, 1,
1.050613, -0.5002409, 1.87484, 1, 1, 1, 1, 1,
1.053574, -1.91388, 3.395154, 1, 1, 1, 1, 1,
1.063888, -1.454045, 3.851919, 1, 1, 1, 1, 1,
1.068811, -0.7913313, 4.333811, 1, 1, 1, 1, 1,
1.070001, -0.6848646, 2.420851, 1, 1, 1, 1, 1,
1.08043, 1.618293, -0.6426223, 1, 1, 1, 1, 1,
1.084818, -1.384128, 3.163413, 1, 1, 1, 1, 1,
1.107665, 0.3440445, 1.388955, 1, 1, 1, 1, 1,
1.108032, 0.5773141, 1.76111, 1, 1, 1, 1, 1,
1.117185, 0.4370169, 1.530716, 0, 0, 1, 1, 1,
1.1236, -0.5071826, 3.589469, 1, 0, 0, 1, 1,
1.12548, -0.7324143, 2.095333, 1, 0, 0, 1, 1,
1.134029, -1.452869, 1.269954, 1, 0, 0, 1, 1,
1.140327, -1.793321, 1.778917, 1, 0, 0, 1, 1,
1.144761, -1.053151, 2.239762, 1, 0, 0, 1, 1,
1.151267, -0.8321936, 1.900576, 0, 0, 0, 1, 1,
1.158303, 0.187092, 0.7229703, 0, 0, 0, 1, 1,
1.166793, -0.1499934, 0.920354, 0, 0, 0, 1, 1,
1.171474, -1.620597, 0.8590649, 0, 0, 0, 1, 1,
1.171917, -1.07576, 2.465078, 0, 0, 0, 1, 1,
1.184724, -0.5027321, 1.32488, 0, 0, 0, 1, 1,
1.187792, -2.693315, 1.990347, 0, 0, 0, 1, 1,
1.189082, -0.6927269, 2.343168, 1, 1, 1, 1, 1,
1.196823, 0.8818765, 0.5155092, 1, 1, 1, 1, 1,
1.243125, 2.023652, -1.311335, 1, 1, 1, 1, 1,
1.244349, -1.104407, 3.499292, 1, 1, 1, 1, 1,
1.24575, 0.3005283, 0.516975, 1, 1, 1, 1, 1,
1.257884, -0.1575239, 0.6536661, 1, 1, 1, 1, 1,
1.272484, -1.804292, 2.493447, 1, 1, 1, 1, 1,
1.275739, -0.1607398, 2.498119, 1, 1, 1, 1, 1,
1.276279, -0.9546614, 1.765718, 1, 1, 1, 1, 1,
1.276386, -2.236139, 2.853642, 1, 1, 1, 1, 1,
1.281878, 0.6591607, -0.4226195, 1, 1, 1, 1, 1,
1.282249, -1.095703, 2.038747, 1, 1, 1, 1, 1,
1.291184, 0.8177586, 1.63049, 1, 1, 1, 1, 1,
1.295882, -0.7418275, 1.469019, 1, 1, 1, 1, 1,
1.301674, -1.177874, 4.228698, 1, 1, 1, 1, 1,
1.303618, 0.08279096, 3.138047, 0, 0, 1, 1, 1,
1.323327, 0.7421181, 1.676911, 1, 0, 0, 1, 1,
1.327443, 1.383962, 0.7737995, 1, 0, 0, 1, 1,
1.336517, -1.091528, 2.070871, 1, 0, 0, 1, 1,
1.338971, 0.3727776, 1.682729, 1, 0, 0, 1, 1,
1.340124, 1.349162, 0.1687273, 1, 0, 0, 1, 1,
1.341487, -1.245254, 0.8788412, 0, 0, 0, 1, 1,
1.342452, 1.074173, 1.419155, 0, 0, 0, 1, 1,
1.343926, -2.522218, 4.053446, 0, 0, 0, 1, 1,
1.344205, 0.4328508, 1.170695, 0, 0, 0, 1, 1,
1.355034, -0.1823185, 2.684674, 0, 0, 0, 1, 1,
1.355543, -0.3805927, 1.393804, 0, 0, 0, 1, 1,
1.359492, 0.6034787, -0.1522499, 0, 0, 0, 1, 1,
1.368925, 1.401041, 2.237247, 1, 1, 1, 1, 1,
1.371796, 0.454465, 1.685143, 1, 1, 1, 1, 1,
1.379639, -2.008806, 2.46689, 1, 1, 1, 1, 1,
1.380622, 0.1231851, 3.188905, 1, 1, 1, 1, 1,
1.390719, 1.116568, -1.453761, 1, 1, 1, 1, 1,
1.393426, -0.5796402, 1.995694, 1, 1, 1, 1, 1,
1.394048, -1.111404, 2.198659, 1, 1, 1, 1, 1,
1.395832, 0.3006808, 3.284962, 1, 1, 1, 1, 1,
1.398559, -1.017316, 1.932685, 1, 1, 1, 1, 1,
1.402822, -1.444916, 1.146174, 1, 1, 1, 1, 1,
1.403014, 1.599165, 1.225116, 1, 1, 1, 1, 1,
1.413998, 0.4167768, 1.398239, 1, 1, 1, 1, 1,
1.426116, 1.771903, 0.4144655, 1, 1, 1, 1, 1,
1.44829, -0.2578971, 1.776897, 1, 1, 1, 1, 1,
1.465925, -1.312962, 3.213451, 1, 1, 1, 1, 1,
1.474154, -0.1374846, 1.330435, 0, 0, 1, 1, 1,
1.483468, 0.6879143, 0.5711638, 1, 0, 0, 1, 1,
1.49239, 0.8427891, 0.8181199, 1, 0, 0, 1, 1,
1.496362, 0.2076684, 1.613359, 1, 0, 0, 1, 1,
1.51624, -1.111964, 3.690536, 1, 0, 0, 1, 1,
1.51895, 0.5781159, 1.057764, 1, 0, 0, 1, 1,
1.518969, -0.6228024, 4.336095, 0, 0, 0, 1, 1,
1.520277, 2.261067, -0.3642132, 0, 0, 0, 1, 1,
1.521881, -2.228293, 2.910822, 0, 0, 0, 1, 1,
1.527944, 0.8765658, 1.305547, 0, 0, 0, 1, 1,
1.528679, 0.9231889, 1.810174, 0, 0, 0, 1, 1,
1.533564, -0.8867113, 2.004051, 0, 0, 0, 1, 1,
1.54008, -0.4473691, 2.797264, 0, 0, 0, 1, 1,
1.54658, 0.3874678, 1.944133, 1, 1, 1, 1, 1,
1.547655, 1.729327, 0.4349626, 1, 1, 1, 1, 1,
1.555978, 2.598465, 1.121561, 1, 1, 1, 1, 1,
1.578517, -0.8055215, 2.233769, 1, 1, 1, 1, 1,
1.59314, -0.6820111, 0.9290411, 1, 1, 1, 1, 1,
1.601163, 0.4939978, 0.7511867, 1, 1, 1, 1, 1,
1.619551, 0.2105483, 1.694228, 1, 1, 1, 1, 1,
1.623828, -0.5100562, 1.581205, 1, 1, 1, 1, 1,
1.627179, 0.5806068, 1.16398, 1, 1, 1, 1, 1,
1.63099, -1.62221, 1.060751, 1, 1, 1, 1, 1,
1.635584, 0.4881059, 1.389686, 1, 1, 1, 1, 1,
1.642616, 1.720465, 0.4956405, 1, 1, 1, 1, 1,
1.661624, -0.4822001, 2.527105, 1, 1, 1, 1, 1,
1.681144, -0.6430427, 1.763424, 1, 1, 1, 1, 1,
1.683843, -0.1181992, 1.43391, 1, 1, 1, 1, 1,
1.707565, -0.6151354, 1.982109, 0, 0, 1, 1, 1,
1.709787, -1.46306, 2.410506, 1, 0, 0, 1, 1,
1.742374, 1.47293, 1.471349, 1, 0, 0, 1, 1,
1.7675, -0.9274451, 3.647007, 1, 0, 0, 1, 1,
1.772866, 0.3392044, 1.684766, 1, 0, 0, 1, 1,
1.79246, 0.1156972, 1.118059, 1, 0, 0, 1, 1,
1.805756, 1.484867, 1.839746, 0, 0, 0, 1, 1,
1.830621, -1.625209, 2.187464, 0, 0, 0, 1, 1,
1.834235, 0.9644988, 0.8124927, 0, 0, 0, 1, 1,
1.838025, 1.383084, 0.8216057, 0, 0, 0, 1, 1,
1.844714, 1.931057, -0.2783788, 0, 0, 0, 1, 1,
1.869659, 0.7150328, 2.06975, 0, 0, 0, 1, 1,
1.879724, -0.2815084, 3.135707, 0, 0, 0, 1, 1,
1.891784, -3.081247, 1.491583, 1, 1, 1, 1, 1,
1.914638, 0.6071504, 2.558995, 1, 1, 1, 1, 1,
1.924452, -0.142535, 2.190034, 1, 1, 1, 1, 1,
1.938691, -0.7592291, 3.167078, 1, 1, 1, 1, 1,
1.944667, -0.5312419, 0.6250601, 1, 1, 1, 1, 1,
1.945586, -0.2432272, 2.07218, 1, 1, 1, 1, 1,
1.95732, 0.7785828, 0.2824164, 1, 1, 1, 1, 1,
1.959228, -0.5522232, 2.725767, 1, 1, 1, 1, 1,
1.963042, 0.1135305, 2.65453, 1, 1, 1, 1, 1,
1.977699, 0.1353362, 1.001833, 1, 1, 1, 1, 1,
1.994212, 0.4027271, 3.06967, 1, 1, 1, 1, 1,
2.021179, -1.1586, 2.973381, 1, 1, 1, 1, 1,
2.082448, 0.6707549, 0.7431561, 1, 1, 1, 1, 1,
2.083001, -0.4086736, 1.255573, 1, 1, 1, 1, 1,
2.101739, 0.3600051, 1.470806, 1, 1, 1, 1, 1,
2.111192, 0.2304995, 2.37994, 0, 0, 1, 1, 1,
2.115799, -1.402416, 1.833547, 1, 0, 0, 1, 1,
2.131802, -0.7979743, 3.405628, 1, 0, 0, 1, 1,
2.142859, 0.8703742, -0.1114447, 1, 0, 0, 1, 1,
2.163215, 1.71111, -0.7736129, 1, 0, 0, 1, 1,
2.216439, -0.4679571, 1.366847, 1, 0, 0, 1, 1,
2.269618, 0.1094934, 3.1607, 0, 0, 0, 1, 1,
2.287108, 1.505667, 0.6752294, 0, 0, 0, 1, 1,
2.305485, 0.4078646, 0.4628121, 0, 0, 0, 1, 1,
2.420133, -1.054647, 1.835464, 0, 0, 0, 1, 1,
2.473651, 1.243171, 3.216542, 0, 0, 0, 1, 1,
2.639166, 0.3537523, 1.250539, 0, 0, 0, 1, 1,
2.660689, -0.1189247, 2.164541, 0, 0, 0, 1, 1,
2.760576, 0.6691457, 2.105438, 1, 1, 1, 1, 1,
2.764139, 1.700195, 0.5433818, 1, 1, 1, 1, 1,
2.791135, -2.39403, 1.503599, 1, 1, 1, 1, 1,
2.858922, 0.8827776, 1.596962, 1, 1, 1, 1, 1,
2.976986, 0.8819445, 1.480473, 1, 1, 1, 1, 1,
3.66947, 2.09505, 1.88529, 1, 1, 1, 1, 1,
3.955287, -0.7859051, -1.028751, 1, 1, 1, 1, 1
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
var radius = 9.597231;
var distance = 33.70987;
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
mvMatrix.translate( -0.2648797, 0.05897164, 0.5810018 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70987);
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
