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
-3.291136, -0.972971, -2.383743, 1, 0, 0, 1,
-2.760587, 1.264693, -0.07602882, 1, 0.007843138, 0, 1,
-2.570101, -1.782556, -2.076474, 1, 0.01176471, 0, 1,
-2.560691, 0.09333025, -0.7863654, 1, 0.01960784, 0, 1,
-2.514338, -0.310198, -2.798404, 1, 0.02352941, 0, 1,
-2.513447, 0.2822617, -0.1922915, 1, 0.03137255, 0, 1,
-2.511679, -0.691273, -0.7501145, 1, 0.03529412, 0, 1,
-2.423502, -0.5628911, -2.134933, 1, 0.04313726, 0, 1,
-2.408736, 0.8378773, -1.772128, 1, 0.04705882, 0, 1,
-2.39207, 1.453439, -1.997428, 1, 0.05490196, 0, 1,
-2.365927, -0.4508599, -2.35344, 1, 0.05882353, 0, 1,
-2.287028, -0.7557448, -0.4545653, 1, 0.06666667, 0, 1,
-2.227816, 0.2163991, -2.020247, 1, 0.07058824, 0, 1,
-2.212611, 0.5416455, -2.704471, 1, 0.07843138, 0, 1,
-2.175032, 2.502155, 0.2313885, 1, 0.08235294, 0, 1,
-2.164557, 0.7417303, -2.991041, 1, 0.09019608, 0, 1,
-2.103947, -0.6925004, -2.507523, 1, 0.09411765, 0, 1,
-2.101628, -0.9399964, -3.620974, 1, 0.1019608, 0, 1,
-2.076712, -0.6926732, -3.266347, 1, 0.1098039, 0, 1,
-2.038967, -1.307707, -1.192876, 1, 0.1137255, 0, 1,
-2.025165, 0.9435784, -1.015653, 1, 0.1215686, 0, 1,
-2.01253, -0.1886745, -1.971228, 1, 0.1254902, 0, 1,
-1.966724, 0.4722215, -2.877804, 1, 0.1333333, 0, 1,
-1.966271, -0.3636313, -0.8031179, 1, 0.1372549, 0, 1,
-1.943388, -1.164672, -0.8414371, 1, 0.145098, 0, 1,
-1.884159, -0.8739794, -1.578214, 1, 0.1490196, 0, 1,
-1.865337, 1.275437, -0.8645644, 1, 0.1568628, 0, 1,
-1.865306, -0.2952689, -1.628566, 1, 0.1607843, 0, 1,
-1.860909, 0.4415894, -3.591242, 1, 0.1686275, 0, 1,
-1.859152, -0.05218056, -1.640196, 1, 0.172549, 0, 1,
-1.852364, 0.06338935, -0.3357301, 1, 0.1803922, 0, 1,
-1.84849, 0.384564, -2.231866, 1, 0.1843137, 0, 1,
-1.846598, 0.6004006, -2.271773, 1, 0.1921569, 0, 1,
-1.830357, -0.3572946, -2.60791, 1, 0.1960784, 0, 1,
-1.828981, 1.546263, -0.4999196, 1, 0.2039216, 0, 1,
-1.817454, 0.2948932, -0.4635588, 1, 0.2117647, 0, 1,
-1.800491, 1.276006, -0.8207413, 1, 0.2156863, 0, 1,
-1.782576, -0.6921159, -0.4132908, 1, 0.2235294, 0, 1,
-1.761779, 0.03910093, -1.301977, 1, 0.227451, 0, 1,
-1.734108, 0.4727929, -1.495245, 1, 0.2352941, 0, 1,
-1.720578, 1.717905, 0.3989375, 1, 0.2392157, 0, 1,
-1.718686, -0.7824352, -3.549512, 1, 0.2470588, 0, 1,
-1.713777, 0.4987195, -0.005229254, 1, 0.2509804, 0, 1,
-1.690398, -0.4308312, -1.827648, 1, 0.2588235, 0, 1,
-1.664294, -2.688824, -2.259369, 1, 0.2627451, 0, 1,
-1.65947, -1.729575, -2.854794, 1, 0.2705882, 0, 1,
-1.653584, -0.4606874, -1.425108, 1, 0.2745098, 0, 1,
-1.649086, 1.04489, -1.157161, 1, 0.282353, 0, 1,
-1.635926, -0.7523547, -1.14415, 1, 0.2862745, 0, 1,
-1.633476, -1.391293, -2.476585, 1, 0.2941177, 0, 1,
-1.628691, 0.4191568, -0.9054813, 1, 0.3019608, 0, 1,
-1.619352, 0.6331096, -2.355565, 1, 0.3058824, 0, 1,
-1.605498, -0.06716315, -1.602134, 1, 0.3137255, 0, 1,
-1.599684, -0.2377451, -2.131208, 1, 0.3176471, 0, 1,
-1.591682, 0.1793159, -2.744738, 1, 0.3254902, 0, 1,
-1.588435, -2.042982, -2.830827, 1, 0.3294118, 0, 1,
-1.584725, -0.1562633, -1.24858, 1, 0.3372549, 0, 1,
-1.571761, -1.141139, -3.160002, 1, 0.3411765, 0, 1,
-1.5681, -1.11481, -2.821382, 1, 0.3490196, 0, 1,
-1.55455, -0.8368284, -1.22168, 1, 0.3529412, 0, 1,
-1.550858, 0.6467159, -1.304638, 1, 0.3607843, 0, 1,
-1.540721, -0.0526604, -1.665714, 1, 0.3647059, 0, 1,
-1.539844, 0.2089741, -1.997917, 1, 0.372549, 0, 1,
-1.532485, -0.652819, -2.062587, 1, 0.3764706, 0, 1,
-1.532215, -0.6714009, -4.520156, 1, 0.3843137, 0, 1,
-1.52394, 2.568681, 0.6901143, 1, 0.3882353, 0, 1,
-1.522713, 1.375066, -1.3194, 1, 0.3960784, 0, 1,
-1.489108, 0.8832157, -0.0711237, 1, 0.4039216, 0, 1,
-1.475487, 0.8199105, -1.378029, 1, 0.4078431, 0, 1,
-1.471393, 1.657232, -0.4496335, 1, 0.4156863, 0, 1,
-1.471001, 0.584505, -1.653664, 1, 0.4196078, 0, 1,
-1.469344, -0.2242826, 0.8888775, 1, 0.427451, 0, 1,
-1.461541, 0.4018134, -1.920918, 1, 0.4313726, 0, 1,
-1.448562, -0.2472332, -3.146551, 1, 0.4392157, 0, 1,
-1.446375, 0.1784451, -3.778595, 1, 0.4431373, 0, 1,
-1.441993, -0.2207715, -2.967347, 1, 0.4509804, 0, 1,
-1.441822, -0.09020336, -2.531011, 1, 0.454902, 0, 1,
-1.437789, 2.793231, -2.406749, 1, 0.4627451, 0, 1,
-1.434317, -0.3553878, -2.159944, 1, 0.4666667, 0, 1,
-1.428738, -0.5677103, -2.219525, 1, 0.4745098, 0, 1,
-1.427254, -0.06091717, -3.002717, 1, 0.4784314, 0, 1,
-1.422023, -0.1292061, -2.113189, 1, 0.4862745, 0, 1,
-1.402734, 0.75621, -0.8183699, 1, 0.4901961, 0, 1,
-1.392733, -1.285431, -3.404589, 1, 0.4980392, 0, 1,
-1.392552, -1.55272, -1.946743, 1, 0.5058824, 0, 1,
-1.389156, 1.675533, -0.4618916, 1, 0.509804, 0, 1,
-1.359229, 0.129384, -3.798228, 1, 0.5176471, 0, 1,
-1.358007, 1.166642, -3.257958, 1, 0.5215687, 0, 1,
-1.337457, -0.142313, -2.164147, 1, 0.5294118, 0, 1,
-1.326831, 0.7313715, -1.585946, 1, 0.5333334, 0, 1,
-1.322297, -1.592438, -1.86977, 1, 0.5411765, 0, 1,
-1.310271, 0.1592724, 0.4596232, 1, 0.5450981, 0, 1,
-1.306383, -0.01666188, -1.821726, 1, 0.5529412, 0, 1,
-1.306001, 0.2259889, -0.3523673, 1, 0.5568628, 0, 1,
-1.30018, -0.5892918, -2.317198, 1, 0.5647059, 0, 1,
-1.294108, -0.9135618, -2.45313, 1, 0.5686275, 0, 1,
-1.281835, -0.4433689, -1.706635, 1, 0.5764706, 0, 1,
-1.277401, -0.223737, -2.21122, 1, 0.5803922, 0, 1,
-1.275131, 0.2007735, -1.799097, 1, 0.5882353, 0, 1,
-1.274053, 0.6215317, -1.360191, 1, 0.5921569, 0, 1,
-1.248578, 1.950706, -2.057432, 1, 0.6, 0, 1,
-1.238911, -1.154079, -2.933256, 1, 0.6078432, 0, 1,
-1.238225, 1.273996, 0.6361962, 1, 0.6117647, 0, 1,
-1.236232, 1.193079, 0.2357279, 1, 0.6196079, 0, 1,
-1.234111, 1.224272, -0.6854059, 1, 0.6235294, 0, 1,
-1.231525, -0.7736574, -1.914485, 1, 0.6313726, 0, 1,
-1.230072, -0.7630365, -2.113382, 1, 0.6352941, 0, 1,
-1.222242, 1.000178, -1.275114, 1, 0.6431373, 0, 1,
-1.221254, -0.2077765, -2.66971, 1, 0.6470588, 0, 1,
-1.215675, -0.08744368, -1.993039, 1, 0.654902, 0, 1,
-1.213461, 0.499863, -0.721835, 1, 0.6588235, 0, 1,
-1.20407, 1.519509, 1.724935, 1, 0.6666667, 0, 1,
-1.202222, -0.6735496, -2.089048, 1, 0.6705883, 0, 1,
-1.200928, 0.3562817, -1.460305, 1, 0.6784314, 0, 1,
-1.19925, -0.8721064, -2.342721, 1, 0.682353, 0, 1,
-1.195753, 0.3813226, -1.878901, 1, 0.6901961, 0, 1,
-1.195695, 1.288234, -1.503668, 1, 0.6941177, 0, 1,
-1.191297, -0.7069086, -4.036243, 1, 0.7019608, 0, 1,
-1.186124, -0.2168351, -0.3128593, 1, 0.7098039, 0, 1,
-1.179757, -0.380877, -0.4075894, 1, 0.7137255, 0, 1,
-1.178035, -0.7545485, -0.3218975, 1, 0.7215686, 0, 1,
-1.177512, 0.4958554, -0.1014497, 1, 0.7254902, 0, 1,
-1.17621, -1.980269, -1.402909, 1, 0.7333333, 0, 1,
-1.170923, 0.976391, -0.9865355, 1, 0.7372549, 0, 1,
-1.164429, 0.219136, -3.218529, 1, 0.7450981, 0, 1,
-1.162335, 1.030098, 0.249672, 1, 0.7490196, 0, 1,
-1.154448, -1.43976, -3.578597, 1, 0.7568628, 0, 1,
-1.15063, -0.1434832, -1.576314, 1, 0.7607843, 0, 1,
-1.147459, 0.7099555, -2.539343, 1, 0.7686275, 0, 1,
-1.135274, -1.791963, -3.056859, 1, 0.772549, 0, 1,
-1.128162, 1.145991, -0.4117629, 1, 0.7803922, 0, 1,
-1.124867, -1.395382, -2.00515, 1, 0.7843137, 0, 1,
-1.124571, -0.6810475, -2.091579, 1, 0.7921569, 0, 1,
-1.113258, 0.5733001, -0.7149243, 1, 0.7960784, 0, 1,
-1.112792, -0.6374198, -0.9953512, 1, 0.8039216, 0, 1,
-1.102976, -0.7739893, -1.681675, 1, 0.8117647, 0, 1,
-1.094976, -0.03876001, -0.2954784, 1, 0.8156863, 0, 1,
-1.080683, 0.01789356, -2.378592, 1, 0.8235294, 0, 1,
-1.078451, 1.037278, -1.21866, 1, 0.827451, 0, 1,
-1.076287, 0.04790474, -3.422412, 1, 0.8352941, 0, 1,
-1.075512, 0.5948297, -1.29604, 1, 0.8392157, 0, 1,
-1.073813, -0.2884072, -2.6353, 1, 0.8470588, 0, 1,
-1.068571, -0.3180103, -0.1027815, 1, 0.8509804, 0, 1,
-1.067838, 0.01102143, -1.374583, 1, 0.8588235, 0, 1,
-1.055851, -1.799886, -2.757321, 1, 0.8627451, 0, 1,
-1.041214, -0.1849916, -3.052578, 1, 0.8705882, 0, 1,
-1.018037, -0.9080913, -1.20053, 1, 0.8745098, 0, 1,
-1.015502, -0.3218063, -1.76042, 1, 0.8823529, 0, 1,
-1.007432, -0.3909238, -0.425951, 1, 0.8862745, 0, 1,
-1.00607, -0.8036982, -2.067993, 1, 0.8941177, 0, 1,
-1.005944, 2.218442, 0.2857438, 1, 0.8980392, 0, 1,
-1.00272, 0.7182243, -1.846369, 1, 0.9058824, 0, 1,
-1.002527, 0.2642972, -1.12107, 1, 0.9137255, 0, 1,
-0.9976521, -0.2764454, -2.08454, 1, 0.9176471, 0, 1,
-0.9957573, 1.287667, 0.1213642, 1, 0.9254902, 0, 1,
-0.9938816, 0.4612793, -0.02154861, 1, 0.9294118, 0, 1,
-0.9897006, 0.8661488, -2.454507, 1, 0.9372549, 0, 1,
-0.9859696, 0.4854118, -0.6176523, 1, 0.9411765, 0, 1,
-0.9752017, -1.65014, -2.966516, 1, 0.9490196, 0, 1,
-0.9714574, 0.2157447, -1.792333, 1, 0.9529412, 0, 1,
-0.9644511, -1.607334, -2.908341, 1, 0.9607843, 0, 1,
-0.9642419, 0.7059744, -1.696727, 1, 0.9647059, 0, 1,
-0.9579612, 1.966907, 0.7222654, 1, 0.972549, 0, 1,
-0.9508984, 0.2691016, -3.321896, 1, 0.9764706, 0, 1,
-0.9346358, -0.807227, -2.261801, 1, 0.9843137, 0, 1,
-0.9345345, 1.652659, -0.187056, 1, 0.9882353, 0, 1,
-0.9337463, -0.7444285, -2.414346, 1, 0.9960784, 0, 1,
-0.9317176, 0.03579776, -0.8241166, 0.9960784, 1, 0, 1,
-0.9286764, 0.7327746, -2.222916, 0.9921569, 1, 0, 1,
-0.9273189, 0.2662988, -1.386852, 0.9843137, 1, 0, 1,
-0.9264913, -0.1704272, -0.7733431, 0.9803922, 1, 0, 1,
-0.9255303, -0.3331898, -1.240391, 0.972549, 1, 0, 1,
-0.9246221, 0.4790285, -0.3457031, 0.9686275, 1, 0, 1,
-0.9198897, 0.8384842, 0.04358324, 0.9607843, 1, 0, 1,
-0.9189665, -2.729272, -1.900334, 0.9568627, 1, 0, 1,
-0.9181268, -0.3003819, -3.222671, 0.9490196, 1, 0, 1,
-0.9160651, -1.154576, -3.892288, 0.945098, 1, 0, 1,
-0.9158008, 1.110484, -0.794216, 0.9372549, 1, 0, 1,
-0.9133787, 0.7061664, -0.7441242, 0.9333333, 1, 0, 1,
-0.9122788, 0.4607945, -0.3396809, 0.9254902, 1, 0, 1,
-0.911257, -0.6108876, -2.579122, 0.9215686, 1, 0, 1,
-0.9062502, 1.640469, -1.549011, 0.9137255, 1, 0, 1,
-0.906064, -0.5329872, -2.802748, 0.9098039, 1, 0, 1,
-0.9007983, -0.1843416, -2.480779, 0.9019608, 1, 0, 1,
-0.8994975, 1.64104, -0.8716347, 0.8941177, 1, 0, 1,
-0.8948875, 1.5053, 0.4268771, 0.8901961, 1, 0, 1,
-0.8911983, 1.562655, -0.5423371, 0.8823529, 1, 0, 1,
-0.8828293, 0.5122895, 0.4852052, 0.8784314, 1, 0, 1,
-0.8714498, 0.5586834, -2.502454, 0.8705882, 1, 0, 1,
-0.870186, -1.223606, -1.532453, 0.8666667, 1, 0, 1,
-0.8695545, 0.5322897, -1.346802, 0.8588235, 1, 0, 1,
-0.8623345, -1.177043, -3.234006, 0.854902, 1, 0, 1,
-0.8587079, 0.2203089, -1.215904, 0.8470588, 1, 0, 1,
-0.8511208, -1.027822, -1.510282, 0.8431373, 1, 0, 1,
-0.8474706, 0.3931025, -1.334848, 0.8352941, 1, 0, 1,
-0.8448236, 0.1132458, -2.234481, 0.8313726, 1, 0, 1,
-0.8410689, -1.482607, -3.436932, 0.8235294, 1, 0, 1,
-0.8382393, -1.408888, -3.920194, 0.8196079, 1, 0, 1,
-0.8323075, -0.9841193, -3.40694, 0.8117647, 1, 0, 1,
-0.83152, 0.3032926, -2.866684, 0.8078431, 1, 0, 1,
-0.8308598, -1.542865, -2.736885, 0.8, 1, 0, 1,
-0.8266727, 1.302734, -0.9502088, 0.7921569, 1, 0, 1,
-0.8239373, 0.7878248, -1.44937, 0.7882353, 1, 0, 1,
-0.819959, 0.01050569, -2.085136, 0.7803922, 1, 0, 1,
-0.8124452, 0.2651775, -1.969056, 0.7764706, 1, 0, 1,
-0.8038249, 0.4901816, -2.08207, 0.7686275, 1, 0, 1,
-0.8001834, 0.5490501, -1.70087, 0.7647059, 1, 0, 1,
-0.7903115, -0.4560664, -1.661348, 0.7568628, 1, 0, 1,
-0.7857034, -0.1410651, 0.305538, 0.7529412, 1, 0, 1,
-0.7777763, -0.1180543, 0.2867302, 0.7450981, 1, 0, 1,
-0.7769183, 0.8036757, -0.5321721, 0.7411765, 1, 0, 1,
-0.7764922, -1.217711, -3.582285, 0.7333333, 1, 0, 1,
-0.7724971, 1.53378, -0.9164074, 0.7294118, 1, 0, 1,
-0.7686692, -0.4863666, -1.846519, 0.7215686, 1, 0, 1,
-0.7655624, -0.5519763, -0.9356228, 0.7176471, 1, 0, 1,
-0.7632518, -0.8620877, -3.877301, 0.7098039, 1, 0, 1,
-0.7623404, 0.5063903, -2.100146, 0.7058824, 1, 0, 1,
-0.7464191, -1.39922, -1.791139, 0.6980392, 1, 0, 1,
-0.7457829, 1.471068, 0.07007109, 0.6901961, 1, 0, 1,
-0.7442427, -0.105873, -2.977249, 0.6862745, 1, 0, 1,
-0.7352241, -0.5445181, -3.399241, 0.6784314, 1, 0, 1,
-0.7350227, 0.2739475, -0.4949794, 0.6745098, 1, 0, 1,
-0.7326161, 0.6371137, 0.1953538, 0.6666667, 1, 0, 1,
-0.7302576, -0.1654502, -2.399976, 0.6627451, 1, 0, 1,
-0.7300497, -0.8505538, -3.991686, 0.654902, 1, 0, 1,
-0.7300151, -0.07109777, -1.022656, 0.6509804, 1, 0, 1,
-0.7172356, 1.061586, -0.1911116, 0.6431373, 1, 0, 1,
-0.7167835, 0.1098835, -4.15364, 0.6392157, 1, 0, 1,
-0.7076248, -0.2790605, -1.296072, 0.6313726, 1, 0, 1,
-0.7046071, 2.077744, -1.855779, 0.627451, 1, 0, 1,
-0.6958737, -1.082734, -3.285611, 0.6196079, 1, 0, 1,
-0.6939237, -1.26244, -3.012701, 0.6156863, 1, 0, 1,
-0.6913118, 0.3402899, -2.22634, 0.6078432, 1, 0, 1,
-0.6881582, -1.359823, -2.480286, 0.6039216, 1, 0, 1,
-0.6873353, 0.4160912, 0.9666187, 0.5960785, 1, 0, 1,
-0.6860398, -0.6807802, -2.221393, 0.5882353, 1, 0, 1,
-0.6854745, 0.8913054, 0.5181171, 0.5843138, 1, 0, 1,
-0.6823586, -0.3706858, -3.310122, 0.5764706, 1, 0, 1,
-0.6763483, -0.1027227, -1.198791, 0.572549, 1, 0, 1,
-0.6692542, 0.7703666, -1.109785, 0.5647059, 1, 0, 1,
-0.6684278, -1.160477, -3.023809, 0.5607843, 1, 0, 1,
-0.6647443, 0.5034538, -1.416297, 0.5529412, 1, 0, 1,
-0.6620333, 0.6339903, -1.324793, 0.5490196, 1, 0, 1,
-0.6616007, 1.242559, -0.8582643, 0.5411765, 1, 0, 1,
-0.6615322, 0.4634922, 0.4144924, 0.5372549, 1, 0, 1,
-0.6591904, 1.212301, -1.161801, 0.5294118, 1, 0, 1,
-0.6580546, -1.781264, -2.721476, 0.5254902, 1, 0, 1,
-0.6534405, -0.7064092, -2.734545, 0.5176471, 1, 0, 1,
-0.6526769, -0.07683569, -1.096243, 0.5137255, 1, 0, 1,
-0.6492383, -1.438203, -1.808047, 0.5058824, 1, 0, 1,
-0.6484806, 2.52775, -0.4810832, 0.5019608, 1, 0, 1,
-0.6482567, -1.960211, -3.252181, 0.4941176, 1, 0, 1,
-0.6459463, 1.051857, 1.120646, 0.4862745, 1, 0, 1,
-0.6405667, -1.351318, -1.071635, 0.4823529, 1, 0, 1,
-0.6403681, 0.1029536, -0.3257443, 0.4745098, 1, 0, 1,
-0.6373342, -1.246438, -2.660814, 0.4705882, 1, 0, 1,
-0.636542, -1.802671, -3.248172, 0.4627451, 1, 0, 1,
-0.6324728, -1.105189, -2.327231, 0.4588235, 1, 0, 1,
-0.6300967, 0.8468071, 0.6255034, 0.4509804, 1, 0, 1,
-0.6250036, 0.820677, -2.140136, 0.4470588, 1, 0, 1,
-0.622532, -1.092367, -3.934997, 0.4392157, 1, 0, 1,
-0.6183213, -1.025156, -2.03051, 0.4352941, 1, 0, 1,
-0.6181542, -0.3307323, -0.6120723, 0.427451, 1, 0, 1,
-0.6111526, -0.4052585, -1.222453, 0.4235294, 1, 0, 1,
-0.6089574, 1.171786, -0.1039902, 0.4156863, 1, 0, 1,
-0.6080897, 0.07663333, -1.763762, 0.4117647, 1, 0, 1,
-0.6054427, -0.8955417, -2.742602, 0.4039216, 1, 0, 1,
-0.6052432, 0.638966, -1.107767, 0.3960784, 1, 0, 1,
-0.6040773, -1.334625, -4.051258, 0.3921569, 1, 0, 1,
-0.6035339, 1.634214, -1.050295, 0.3843137, 1, 0, 1,
-0.6029534, -1.164626, -3.796173, 0.3803922, 1, 0, 1,
-0.5990866, 0.4418416, -1.178098, 0.372549, 1, 0, 1,
-0.5945923, 1.864348, -0.1527463, 0.3686275, 1, 0, 1,
-0.5937256, 1.876678, 0.6350715, 0.3607843, 1, 0, 1,
-0.593487, -0.695087, -1.882303, 0.3568628, 1, 0, 1,
-0.5906426, 1.268311, -0.01649204, 0.3490196, 1, 0, 1,
-0.588923, -3.097172, -2.678971, 0.345098, 1, 0, 1,
-0.5800411, -0.08233706, -2.454236, 0.3372549, 1, 0, 1,
-0.576717, 0.3688532, -1.805593, 0.3333333, 1, 0, 1,
-0.5765826, 0.721502, -1.042275, 0.3254902, 1, 0, 1,
-0.5716836, -0.7236388, -3.000609, 0.3215686, 1, 0, 1,
-0.5633448, -0.8783083, -1.493351, 0.3137255, 1, 0, 1,
-0.5591613, -2.48569, -1.364824, 0.3098039, 1, 0, 1,
-0.5568448, -0.6556231, -3.661992, 0.3019608, 1, 0, 1,
-0.5510135, -1.0366, -3.929863, 0.2941177, 1, 0, 1,
-0.5491236, 0.09826992, -2.028387, 0.2901961, 1, 0, 1,
-0.5468966, 0.3319624, -0.4765575, 0.282353, 1, 0, 1,
-0.5468171, -0.1748373, -2.275173, 0.2784314, 1, 0, 1,
-0.5460529, -0.2017319, -3.536103, 0.2705882, 1, 0, 1,
-0.5451961, 0.4640883, -1.020124, 0.2666667, 1, 0, 1,
-0.5441968, -0.2752658, -1.438245, 0.2588235, 1, 0, 1,
-0.5402067, 0.2499679, -2.590998, 0.254902, 1, 0, 1,
-0.5333998, 0.220628, -0.5760095, 0.2470588, 1, 0, 1,
-0.5308135, 0.6232825, -0.1135629, 0.2431373, 1, 0, 1,
-0.5282276, 0.1106315, -0.8965355, 0.2352941, 1, 0, 1,
-0.5236226, -0.08046093, -1.276982, 0.2313726, 1, 0, 1,
-0.5202405, 0.5429462, -1.037792, 0.2235294, 1, 0, 1,
-0.5177859, -0.4132464, -0.3891973, 0.2196078, 1, 0, 1,
-0.5115967, 1.635399, 0.5329319, 0.2117647, 1, 0, 1,
-0.5107432, 1.011118, -2.700162, 0.2078431, 1, 0, 1,
-0.500305, 1.427371, -1.485797, 0.2, 1, 0, 1,
-0.499894, -0.1174105, -1.6211, 0.1921569, 1, 0, 1,
-0.4970892, -0.2265285, -1.583068, 0.1882353, 1, 0, 1,
-0.4969573, 0.7888792, -0.3392673, 0.1803922, 1, 0, 1,
-0.4956149, -0.6356536, -3.803546, 0.1764706, 1, 0, 1,
-0.4930218, 0.7326698, -1.360507, 0.1686275, 1, 0, 1,
-0.4911631, 0.1673564, -1.850884, 0.1647059, 1, 0, 1,
-0.4893334, 0.3017167, -0.8638586, 0.1568628, 1, 0, 1,
-0.4885764, -0.08892627, -2.272386, 0.1529412, 1, 0, 1,
-0.4870657, 0.5796347, -1.076476, 0.145098, 1, 0, 1,
-0.4870261, -0.07189325, -0.5601027, 0.1411765, 1, 0, 1,
-0.4817204, 0.5001847, -2.406209, 0.1333333, 1, 0, 1,
-0.4816373, 0.3835321, -1.87054, 0.1294118, 1, 0, 1,
-0.481117, 0.1538727, -3.461013, 0.1215686, 1, 0, 1,
-0.474517, 1.661949, -0.6198667, 0.1176471, 1, 0, 1,
-0.4736235, -0.7397264, -2.635674, 0.1098039, 1, 0, 1,
-0.4678999, -0.8226684, -1.987116, 0.1058824, 1, 0, 1,
-0.4654996, 1.146372, -0.0269086, 0.09803922, 1, 0, 1,
-0.4615959, -1.715079, -4.273056, 0.09019608, 1, 0, 1,
-0.4597251, -0.3595686, -3.103382, 0.08627451, 1, 0, 1,
-0.4521038, -1.852115, -2.604112, 0.07843138, 1, 0, 1,
-0.4509929, -0.0418624, -3.595072, 0.07450981, 1, 0, 1,
-0.4489039, 0.4287997, -1.48276, 0.06666667, 1, 0, 1,
-0.4479269, -0.1709293, -1.452932, 0.0627451, 1, 0, 1,
-0.4456158, 1.138137, 0.6474565, 0.05490196, 1, 0, 1,
-0.4453588, -0.6076397, -1.414739, 0.05098039, 1, 0, 1,
-0.439844, -0.170994, -2.677222, 0.04313726, 1, 0, 1,
-0.4387477, -0.7730302, -3.806344, 0.03921569, 1, 0, 1,
-0.432621, 0.3798422, -0.6222361, 0.03137255, 1, 0, 1,
-0.431023, -0.387273, -1.861695, 0.02745098, 1, 0, 1,
-0.4284407, 1.704325, -0.8640287, 0.01960784, 1, 0, 1,
-0.4274154, -0.2017935, -2.08791, 0.01568628, 1, 0, 1,
-0.4255207, -0.1705739, -2.863518, 0.007843138, 1, 0, 1,
-0.418445, 0.4743367, -0.5772401, 0.003921569, 1, 0, 1,
-0.4156293, 0.7731308, -1.270972, 0, 1, 0.003921569, 1,
-0.4141662, 0.9998001, 1.175273, 0, 1, 0.01176471, 1,
-0.4035694, -0.794983, -3.695706, 0, 1, 0.01568628, 1,
-0.4019632, -0.2656916, -3.231863, 0, 1, 0.02352941, 1,
-0.3932567, 1.307528, -0.6108399, 0, 1, 0.02745098, 1,
-0.3910242, -0.2969375, -3.068623, 0, 1, 0.03529412, 1,
-0.3888429, 1.23632, -0.3122105, 0, 1, 0.03921569, 1,
-0.3848506, 0.5608086, -2.111956, 0, 1, 0.04705882, 1,
-0.3832572, 0.8978972, -3.407718, 0, 1, 0.05098039, 1,
-0.3796389, 0.9268303, -0.8871416, 0, 1, 0.05882353, 1,
-0.3758582, 1.063287, -0.8934574, 0, 1, 0.0627451, 1,
-0.3741369, -0.9406519, -3.645297, 0, 1, 0.07058824, 1,
-0.3719186, 0.3584464, -0.5472428, 0, 1, 0.07450981, 1,
-0.3703143, 0.3610047, 1.542211, 0, 1, 0.08235294, 1,
-0.3682355, -0.07797658, -3.469724, 0, 1, 0.08627451, 1,
-0.3574596, 0.7263764, 1.024155, 0, 1, 0.09411765, 1,
-0.3558538, 0.0340278, 0.05269527, 0, 1, 0.1019608, 1,
-0.3536113, 1.556112, -2.224181, 0, 1, 0.1058824, 1,
-0.3515769, 0.05363391, -2.614587, 0, 1, 0.1137255, 1,
-0.3493139, 0.5813355, -0.9181783, 0, 1, 0.1176471, 1,
-0.3431604, -1.218992, -1.994244, 0, 1, 0.1254902, 1,
-0.3332384, 0.9419174, -0.8410528, 0, 1, 0.1294118, 1,
-0.3324895, 1.393389, 0.4843809, 0, 1, 0.1372549, 1,
-0.3311285, 1.522341, 0.8922324, 0, 1, 0.1411765, 1,
-0.329717, -0.7654419, -0.7709084, 0, 1, 0.1490196, 1,
-0.3254056, 1.095755, -1.369129, 0, 1, 0.1529412, 1,
-0.3202573, -0.20437, -2.503114, 0, 1, 0.1607843, 1,
-0.3108919, -0.9354962, -2.132229, 0, 1, 0.1647059, 1,
-0.3103261, -0.8080234, -1.465338, 0, 1, 0.172549, 1,
-0.3091383, 0.248887, -2.664301, 0, 1, 0.1764706, 1,
-0.3078903, -1.197782, -2.074537, 0, 1, 0.1843137, 1,
-0.3073052, 0.7503409, 0.4184155, 0, 1, 0.1882353, 1,
-0.3051154, 0.544606, -0.7029191, 0, 1, 0.1960784, 1,
-0.3046857, -0.3091584, -5.506839, 0, 1, 0.2039216, 1,
-0.2998975, 1.083346, -0.07703893, 0, 1, 0.2078431, 1,
-0.2966249, 1.275301, -0.2944384, 0, 1, 0.2156863, 1,
-0.2929329, 1.034994, -0.3470444, 0, 1, 0.2196078, 1,
-0.2893005, 0.5082317, -0.7956126, 0, 1, 0.227451, 1,
-0.2891424, -1.072958, -2.395033, 0, 1, 0.2313726, 1,
-0.2870002, 0.06606615, -1.062887, 0, 1, 0.2392157, 1,
-0.2842652, 0.5829679, -1.379272, 0, 1, 0.2431373, 1,
-0.2838233, 0.9021898, -0.02343151, 0, 1, 0.2509804, 1,
-0.2790538, 0.2225142, -0.628506, 0, 1, 0.254902, 1,
-0.276917, 0.2572919, 0.01784267, 0, 1, 0.2627451, 1,
-0.2718801, 1.596816, 1.701906, 0, 1, 0.2666667, 1,
-0.2713423, 0.6084585, -0.659243, 0, 1, 0.2745098, 1,
-0.26473, 0.4017758, -1.462847, 0, 1, 0.2784314, 1,
-0.262691, -2.341279, -3.951747, 0, 1, 0.2862745, 1,
-0.2625301, -0.948012, -2.868071, 0, 1, 0.2901961, 1,
-0.2599966, 0.2641815, -2.795893, 0, 1, 0.2980392, 1,
-0.2575511, 0.2426791, -1.547739, 0, 1, 0.3058824, 1,
-0.2545414, -0.6207007, -2.193744, 0, 1, 0.3098039, 1,
-0.2472347, -0.5777531, -2.519734, 0, 1, 0.3176471, 1,
-0.2438655, 2.142992, -0.4373385, 0, 1, 0.3215686, 1,
-0.242921, 0.1876781, -1.190866, 0, 1, 0.3294118, 1,
-0.2427234, 1.944494, -2.936404, 0, 1, 0.3333333, 1,
-0.2419273, -0.4786114, -2.759031, 0, 1, 0.3411765, 1,
-0.2407283, -1.133038, -4.285054, 0, 1, 0.345098, 1,
-0.2385811, -0.1820024, -2.861298, 0, 1, 0.3529412, 1,
-0.237865, 0.2470528, 0.6765298, 0, 1, 0.3568628, 1,
-0.2337394, -0.07107281, -2.126149, 0, 1, 0.3647059, 1,
-0.2298535, -1.081968, -2.5492, 0, 1, 0.3686275, 1,
-0.2298114, 0.2951252, 0.09339309, 0, 1, 0.3764706, 1,
-0.2252097, -0.1269298, -4.757169, 0, 1, 0.3803922, 1,
-0.2215814, -0.3175033, -2.124668, 0, 1, 0.3882353, 1,
-0.2179843, 1.493338, 0.002986691, 0, 1, 0.3921569, 1,
-0.2152783, -0.3532624, -2.335462, 0, 1, 0.4, 1,
-0.2139121, 0.5240857, -0.735161, 0, 1, 0.4078431, 1,
-0.2131041, -1.467445, -1.486883, 0, 1, 0.4117647, 1,
-0.2116295, -0.3199045, -1.968724, 0, 1, 0.4196078, 1,
-0.2106633, 2.015152, 0.5712051, 0, 1, 0.4235294, 1,
-0.2021986, 1.235623, 0.7140778, 0, 1, 0.4313726, 1,
-0.1915905, -1.213282, -1.328557, 0, 1, 0.4352941, 1,
-0.1897283, 0.6352761, 0.3854847, 0, 1, 0.4431373, 1,
-0.1854381, -1.373519, -4.254137, 0, 1, 0.4470588, 1,
-0.1839034, 0.4471497, -0.2035324, 0, 1, 0.454902, 1,
-0.1836776, 2.39711, -1.277297, 0, 1, 0.4588235, 1,
-0.183676, 0.9585554, -1.215785, 0, 1, 0.4666667, 1,
-0.1826493, 1.685417, -0.1154838, 0, 1, 0.4705882, 1,
-0.1807943, -0.6882363, -1.413564, 0, 1, 0.4784314, 1,
-0.1785679, -1.181527, -1.230993, 0, 1, 0.4823529, 1,
-0.1766253, 0.525171, 0.6563038, 0, 1, 0.4901961, 1,
-0.1759001, 0.7714067, 0.0744151, 0, 1, 0.4941176, 1,
-0.1742678, 1.53463, 1.44444, 0, 1, 0.5019608, 1,
-0.1715341, -0.4964901, -3.102955, 0, 1, 0.509804, 1,
-0.1692294, 0.1597535, -2.747452, 0, 1, 0.5137255, 1,
-0.1680254, -0.02640502, -2.170826, 0, 1, 0.5215687, 1,
-0.1666782, -1.231315, -1.828439, 0, 1, 0.5254902, 1,
-0.1666112, -0.6918774, -2.785549, 0, 1, 0.5333334, 1,
-0.166391, -0.2378366, -3.018909, 0, 1, 0.5372549, 1,
-0.1585146, -1.033089, -4.189891, 0, 1, 0.5450981, 1,
-0.1584639, -0.03233625, -2.364955, 0, 1, 0.5490196, 1,
-0.1557516, -1.716893, -4.34709, 0, 1, 0.5568628, 1,
-0.1497093, -1.664101, -1.105924, 0, 1, 0.5607843, 1,
-0.1494878, -0.4664071, -3.086042, 0, 1, 0.5686275, 1,
-0.1484743, -0.8145992, -3.346959, 0, 1, 0.572549, 1,
-0.1437284, 1.311528, 1.082582, 0, 1, 0.5803922, 1,
-0.143241, 0.869147, -1.049289, 0, 1, 0.5843138, 1,
-0.1378715, -1.646213, -3.365759, 0, 1, 0.5921569, 1,
-0.1323985, 0.5114506, 1.726653, 0, 1, 0.5960785, 1,
-0.1319321, 1.353006, 0.3433956, 0, 1, 0.6039216, 1,
-0.1284145, -1.756717, -3.058784, 0, 1, 0.6117647, 1,
-0.121882, -0.9514251, -4.100466, 0, 1, 0.6156863, 1,
-0.1188841, 2.511299, 0.5773187, 0, 1, 0.6235294, 1,
-0.1174462, 1.04652, 0.1194732, 0, 1, 0.627451, 1,
-0.1142971, -1.199137, -2.077609, 0, 1, 0.6352941, 1,
-0.1083691, 1.054787, -1.355258, 0, 1, 0.6392157, 1,
-0.1022475, 0.48874, 0.1201232, 0, 1, 0.6470588, 1,
-0.09812629, 0.4760818, -1.267281, 0, 1, 0.6509804, 1,
-0.09179606, -1.605092, -2.646945, 0, 1, 0.6588235, 1,
-0.09034854, -0.5091808, -4.061278, 0, 1, 0.6627451, 1,
-0.08783029, -0.3654318, -3.007675, 0, 1, 0.6705883, 1,
-0.0871598, -0.4161884, -1.364576, 0, 1, 0.6745098, 1,
-0.08509111, 0.5471768, -1.197634, 0, 1, 0.682353, 1,
-0.07836123, 1.353868, 0.4097985, 0, 1, 0.6862745, 1,
-0.07564652, 0.6055647, -0.3430601, 0, 1, 0.6941177, 1,
-0.07317876, -0.6525134, -2.096317, 0, 1, 0.7019608, 1,
-0.07016043, 1.291643, -0.3088673, 0, 1, 0.7058824, 1,
-0.06707879, 0.09877279, -0.5637902, 0, 1, 0.7137255, 1,
-0.06337965, -0.6237844, -2.705192, 0, 1, 0.7176471, 1,
-0.06152497, -0.4524755, -3.763999, 0, 1, 0.7254902, 1,
-0.05837169, 0.3742689, 0.6336271, 0, 1, 0.7294118, 1,
-0.05650443, -0.2607097, -3.604784, 0, 1, 0.7372549, 1,
-0.05428424, 0.4254263, -1.112803, 0, 1, 0.7411765, 1,
-0.05167144, 0.02092555, -1.527855, 0, 1, 0.7490196, 1,
-0.04994323, -0.596888, -4.662529, 0, 1, 0.7529412, 1,
-0.04397388, 0.8443909, 0.2470691, 0, 1, 0.7607843, 1,
-0.03876518, -0.3373318, -3.299296, 0, 1, 0.7647059, 1,
-0.03816637, -0.6881194, -3.317625, 0, 1, 0.772549, 1,
-0.03754822, -0.6090439, -4.452249, 0, 1, 0.7764706, 1,
-0.03682487, 0.722445, 0.1749016, 0, 1, 0.7843137, 1,
-0.03399919, -0.2335596, -1.36576, 0, 1, 0.7882353, 1,
-0.0303793, -0.4799971, -3.218661, 0, 1, 0.7960784, 1,
-0.02750518, 0.009109343, 0.06699257, 0, 1, 0.8039216, 1,
-0.02681589, 0.00614439, -0.642502, 0, 1, 0.8078431, 1,
-0.02124641, -0.7498978, -3.408168, 0, 1, 0.8156863, 1,
-0.01375268, -1.009959, -3.225887, 0, 1, 0.8196079, 1,
-0.01362441, 0.1365318, 1.804193, 0, 1, 0.827451, 1,
-0.01258622, -1.558372, -3.36869, 0, 1, 0.8313726, 1,
-0.01145318, 0.03555281, -2.203798, 0, 1, 0.8392157, 1,
-0.007154444, 0.3791923, -1.260893, 0, 1, 0.8431373, 1,
-0.003557966, 0.3944347, -1.203084, 0, 1, 0.8509804, 1,
-0.003186748, -0.4337908, -5.319043, 0, 1, 0.854902, 1,
-0.0006610384, 1.03685, 1.784405, 0, 1, 0.8627451, 1,
-0.0005218129, 1.274843, 0.3443555, 0, 1, 0.8666667, 1,
0.001215045, 0.118569, -0.7974061, 0, 1, 0.8745098, 1,
0.003648793, 1.365114, -0.1589738, 0, 1, 0.8784314, 1,
0.00383576, -0.2533425, 4.616313, 0, 1, 0.8862745, 1,
0.008036547, 0.1519979, -0.007288402, 0, 1, 0.8901961, 1,
0.008440412, 0.5783736, -0.4746195, 0, 1, 0.8980392, 1,
0.01035881, -0.1648886, 3.922025, 0, 1, 0.9058824, 1,
0.01132885, 1.096251, 1.200702, 0, 1, 0.9098039, 1,
0.01329004, -0.5470496, 2.860781, 0, 1, 0.9176471, 1,
0.01476322, 0.5712236, 0.5953065, 0, 1, 0.9215686, 1,
0.01490215, 0.5281099, -1.499245, 0, 1, 0.9294118, 1,
0.01560407, -0.4225779, 2.998524, 0, 1, 0.9333333, 1,
0.01594866, -0.1670265, 2.808054, 0, 1, 0.9411765, 1,
0.01847725, -1.96443, 4.170624, 0, 1, 0.945098, 1,
0.01947097, -0.6549098, 2.47436, 0, 1, 0.9529412, 1,
0.01966741, -0.5582747, 2.127977, 0, 1, 0.9568627, 1,
0.02334538, 0.486589, -0.3759404, 0, 1, 0.9647059, 1,
0.02584366, -0.6218116, 4.354318, 0, 1, 0.9686275, 1,
0.02861735, -1.500095, 2.468308, 0, 1, 0.9764706, 1,
0.02957357, -0.9560317, 2.086491, 0, 1, 0.9803922, 1,
0.03286859, -1.767566, 1.394707, 0, 1, 0.9882353, 1,
0.03399026, -0.06589299, 2.20249, 0, 1, 0.9921569, 1,
0.04040041, 1.128358, -2.173784, 0, 1, 1, 1,
0.04170841, -0.03968914, 1.018768, 0, 0.9921569, 1, 1,
0.04642968, -1.883083, 3.41495, 0, 0.9882353, 1, 1,
0.05033479, 0.1964092, -1.374716, 0, 0.9803922, 1, 1,
0.05099496, -1.144047, 2.573044, 0, 0.9764706, 1, 1,
0.05131896, 0.06712384, 1.105638, 0, 0.9686275, 1, 1,
0.05275929, -1.405282, 3.344522, 0, 0.9647059, 1, 1,
0.05298274, 1.587649, -0.3832577, 0, 0.9568627, 1, 1,
0.0564779, 0.846912, -0.7771932, 0, 0.9529412, 1, 1,
0.05858598, 0.5391603, 0.5413921, 0, 0.945098, 1, 1,
0.05934013, -0.9125675, 4.084356, 0, 0.9411765, 1, 1,
0.06233304, -1.730039, 2.282024, 0, 0.9333333, 1, 1,
0.06782208, 1.501961, -0.642498, 0, 0.9294118, 1, 1,
0.07040204, 0.4621269, -0.6062531, 0, 0.9215686, 1, 1,
0.07329628, 0.5165885, -1.190927, 0, 0.9176471, 1, 1,
0.07349101, 0.4066858, -2.12374, 0, 0.9098039, 1, 1,
0.07799656, 0.6241189, 1.589402, 0, 0.9058824, 1, 1,
0.08043235, 1.654668, -0.9794418, 0, 0.8980392, 1, 1,
0.08048326, 0.404145, 0.4615335, 0, 0.8901961, 1, 1,
0.08200505, -0.1548415, 2.349122, 0, 0.8862745, 1, 1,
0.08251546, -0.0975344, 3.426221, 0, 0.8784314, 1, 1,
0.08309606, 0.06309927, 1.700204, 0, 0.8745098, 1, 1,
0.08335335, -0.9760476, 3.322661, 0, 0.8666667, 1, 1,
0.08644255, -1.194746, 3.498368, 0, 0.8627451, 1, 1,
0.08699234, -0.08676293, 2.07074, 0, 0.854902, 1, 1,
0.08769851, 0.6452763, -0.4272949, 0, 0.8509804, 1, 1,
0.08775407, 1.054039, -0.09556778, 0, 0.8431373, 1, 1,
0.08865874, -0.6608284, 2.710286, 0, 0.8392157, 1, 1,
0.08898476, -0.3808478, 1.83613, 0, 0.8313726, 1, 1,
0.0997215, -0.4897538, 3.386762, 0, 0.827451, 1, 1,
0.1017694, 0.8963107, -2.469345, 0, 0.8196079, 1, 1,
0.1025512, -0.1892679, 5.384214, 0, 0.8156863, 1, 1,
0.1044394, -0.04278023, -0.2418726, 0, 0.8078431, 1, 1,
0.1093495, 0.251476, -0.3533964, 0, 0.8039216, 1, 1,
0.1106648, -1.505751, 2.299568, 0, 0.7960784, 1, 1,
0.1200457, -0.9398759, 4.155797, 0, 0.7882353, 1, 1,
0.1204364, -1.065355, 1.856197, 0, 0.7843137, 1, 1,
0.1312915, 0.2343695, -0.4376369, 0, 0.7764706, 1, 1,
0.1324183, -1.226747, 4.244534, 0, 0.772549, 1, 1,
0.133334, 1.118503, 0.6965179, 0, 0.7647059, 1, 1,
0.1386672, 0.407192, 0.04365889, 0, 0.7607843, 1, 1,
0.1398659, 0.8481112, 1.309118, 0, 0.7529412, 1, 1,
0.1416855, 0.5785457, 1.268012, 0, 0.7490196, 1, 1,
0.1453082, -0.06070985, 0.1251411, 0, 0.7411765, 1, 1,
0.1463769, -0.6253417, 3.349482, 0, 0.7372549, 1, 1,
0.1474447, -0.6794967, 4.077775, 0, 0.7294118, 1, 1,
0.1483834, -1.154182, 2.22869, 0, 0.7254902, 1, 1,
0.1494139, -1.671829, 3.167701, 0, 0.7176471, 1, 1,
0.1499415, -0.858183, 3.091144, 0, 0.7137255, 1, 1,
0.1509282, 1.333976, 1.243892, 0, 0.7058824, 1, 1,
0.154648, -0.2990355, 0.9398265, 0, 0.6980392, 1, 1,
0.1615184, 0.4587302, -0.4633354, 0, 0.6941177, 1, 1,
0.1632505, 0.5244817, 1.429476, 0, 0.6862745, 1, 1,
0.1640482, 0.7660217, 0.6360286, 0, 0.682353, 1, 1,
0.1741955, 0.06849542, -0.7353032, 0, 0.6745098, 1, 1,
0.1751592, 0.8197318, 1.504633, 0, 0.6705883, 1, 1,
0.1756734, 0.4750105, 0.8356752, 0, 0.6627451, 1, 1,
0.1759327, -0.9597237, 2.768871, 0, 0.6588235, 1, 1,
0.1846165, -0.3681155, 2.690434, 0, 0.6509804, 1, 1,
0.1880706, -0.09978712, 2.391118, 0, 0.6470588, 1, 1,
0.1956235, 1.232839, 1.388128, 0, 0.6392157, 1, 1,
0.1959594, -0.7442904, 1.922565, 0, 0.6352941, 1, 1,
0.1988902, -0.2457255, 3.752318, 0, 0.627451, 1, 1,
0.2129898, -1.741889, 4.437057, 0, 0.6235294, 1, 1,
0.2193904, 0.1847575, 0.8771002, 0, 0.6156863, 1, 1,
0.2295782, 0.4041083, 0.3718016, 0, 0.6117647, 1, 1,
0.2373276, -0.7205669, 3.79646, 0, 0.6039216, 1, 1,
0.238037, 0.1903612, 0.6605462, 0, 0.5960785, 1, 1,
0.2395159, -0.135899, 1.732983, 0, 0.5921569, 1, 1,
0.2401752, -0.2664031, 2.763701, 0, 0.5843138, 1, 1,
0.2414335, 2.810324, -1.60584, 0, 0.5803922, 1, 1,
0.2609752, 1.434188, 0.4892742, 0, 0.572549, 1, 1,
0.2704658, 1.707001, -0.8538701, 0, 0.5686275, 1, 1,
0.2715575, 0.7965447, 2.274079, 0, 0.5607843, 1, 1,
0.2740318, 0.9184983, -1.037406, 0, 0.5568628, 1, 1,
0.2748947, -0.3230467, 0.5418372, 0, 0.5490196, 1, 1,
0.2752669, 0.1457075, 2.618155, 0, 0.5450981, 1, 1,
0.2766659, -1.044662, 1.567892, 0, 0.5372549, 1, 1,
0.2787774, 0.1783254, 0.8289698, 0, 0.5333334, 1, 1,
0.2809468, 0.8809675, -0.7048188, 0, 0.5254902, 1, 1,
0.2832409, 0.7136267, 1.789519, 0, 0.5215687, 1, 1,
0.2838759, 1.705025, -0.1506189, 0, 0.5137255, 1, 1,
0.2872374, 0.4788135, 1.506306, 0, 0.509804, 1, 1,
0.2909098, -0.7375396, 3.272797, 0, 0.5019608, 1, 1,
0.2911991, -1.204108, 3.831181, 0, 0.4941176, 1, 1,
0.294257, -0.0438836, 1.965519, 0, 0.4901961, 1, 1,
0.2947152, 1.532612, 0.4217893, 0, 0.4823529, 1, 1,
0.3004096, 0.4515094, 0.6084799, 0, 0.4784314, 1, 1,
0.3014327, 1.671533, -0.4822893, 0, 0.4705882, 1, 1,
0.3019589, 1.308226, 0.6739966, 0, 0.4666667, 1, 1,
0.3029391, -0.7548965, 1.418771, 0, 0.4588235, 1, 1,
0.3068161, -1.02405, 3.729232, 0, 0.454902, 1, 1,
0.3089857, 1.215081, -1.354866, 0, 0.4470588, 1, 1,
0.3092752, -0.3722188, 2.579801, 0, 0.4431373, 1, 1,
0.3098894, -1.194804, 2.189851, 0, 0.4352941, 1, 1,
0.3127139, -0.4952892, 3.044945, 0, 0.4313726, 1, 1,
0.3169804, 0.4466412, 1.146205, 0, 0.4235294, 1, 1,
0.3270822, -0.4244787, 2.821475, 0, 0.4196078, 1, 1,
0.328227, -0.6676632, 2.537268, 0, 0.4117647, 1, 1,
0.33875, 0.7966837, 0.02410339, 0, 0.4078431, 1, 1,
0.3397416, 0.1790668, -0.1040529, 0, 0.4, 1, 1,
0.3399554, 0.03862141, 3.030405, 0, 0.3921569, 1, 1,
0.3414733, 0.6230575, 1.346097, 0, 0.3882353, 1, 1,
0.343825, 1.478496, 0.4743986, 0, 0.3803922, 1, 1,
0.3457274, -0.4626269, 3.76897, 0, 0.3764706, 1, 1,
0.3507003, -0.3784023, 2.322924, 0, 0.3686275, 1, 1,
0.356081, 1.281959, 1.820903, 0, 0.3647059, 1, 1,
0.3599373, 1.864964, 0.6461662, 0, 0.3568628, 1, 1,
0.3630687, -0.9818127, 4.519089, 0, 0.3529412, 1, 1,
0.3649572, -0.9664825, 2.944289, 0, 0.345098, 1, 1,
0.3749954, 0.3173687, 2.45451, 0, 0.3411765, 1, 1,
0.3814256, 0.9888059, 0.23644, 0, 0.3333333, 1, 1,
0.3857328, 1.626719, -1.044782, 0, 0.3294118, 1, 1,
0.3888048, -0.8847171, 3.514248, 0, 0.3215686, 1, 1,
0.3917871, 1.029257, 0.1506904, 0, 0.3176471, 1, 1,
0.3994424, 0.4649217, 1.373175, 0, 0.3098039, 1, 1,
0.4015946, -0.3793546, 1.017567, 0, 0.3058824, 1, 1,
0.4018606, 0.6735865, 2.339047, 0, 0.2980392, 1, 1,
0.4025804, 1.25947, 0.02415089, 0, 0.2901961, 1, 1,
0.4042084, -0.9238822, 1.901875, 0, 0.2862745, 1, 1,
0.4084499, 0.03071712, 1.812069, 0, 0.2784314, 1, 1,
0.4088004, -1.836348, 2.871177, 0, 0.2745098, 1, 1,
0.4107193, -0.848489, 3.660488, 0, 0.2666667, 1, 1,
0.4135252, -0.2578624, 2.174721, 0, 0.2627451, 1, 1,
0.4152437, 1.668221, -0.6910125, 0, 0.254902, 1, 1,
0.42009, -1.285289, 2.801509, 0, 0.2509804, 1, 1,
0.4221196, 1.047524, -1.812825, 0, 0.2431373, 1, 1,
0.4303531, -0.002670962, 1.99646, 0, 0.2392157, 1, 1,
0.4369569, 0.6017331, -0.5381814, 0, 0.2313726, 1, 1,
0.4408704, 2.291, 0.896085, 0, 0.227451, 1, 1,
0.4491239, 1.558079, -0.7271537, 0, 0.2196078, 1, 1,
0.449308, 0.3071577, 1.934404, 0, 0.2156863, 1, 1,
0.4496396, -0.3193241, 1.929364, 0, 0.2078431, 1, 1,
0.4503684, 0.3937473, 2.62729, 0, 0.2039216, 1, 1,
0.4586203, -0.4514467, 3.183205, 0, 0.1960784, 1, 1,
0.4662323, 1.80241, 0.6373203, 0, 0.1882353, 1, 1,
0.4694407, -1.078121, 1.35467, 0, 0.1843137, 1, 1,
0.4710937, -0.09377483, 2.303127, 0, 0.1764706, 1, 1,
0.4757882, -1.167291, 2.312927, 0, 0.172549, 1, 1,
0.4777279, -0.4638845, 1.612075, 0, 0.1647059, 1, 1,
0.4794823, -0.5819623, 2.830638, 0, 0.1607843, 1, 1,
0.4828453, 0.1086051, 3.406333, 0, 0.1529412, 1, 1,
0.4859826, -1.035963, 1.916865, 0, 0.1490196, 1, 1,
0.4861251, 0.8539891, -2.370293, 0, 0.1411765, 1, 1,
0.4863485, 2.221693, -0.8990726, 0, 0.1372549, 1, 1,
0.4865429, -2.071792, 3.470582, 0, 0.1294118, 1, 1,
0.4890517, 1.089417, 0.5319101, 0, 0.1254902, 1, 1,
0.4898202, 0.817505, 0.5232866, 0, 0.1176471, 1, 1,
0.4928508, -0.6811777, 2.179317, 0, 0.1137255, 1, 1,
0.4948125, 0.5133896, 1.819936, 0, 0.1058824, 1, 1,
0.5007048, 1.518927, 0.8402372, 0, 0.09803922, 1, 1,
0.5072914, 0.2862282, 1.68193, 0, 0.09411765, 1, 1,
0.5087513, -0.5733297, 1.888995, 0, 0.08627451, 1, 1,
0.5151207, -0.2666914, 2.471382, 0, 0.08235294, 1, 1,
0.518208, -0.7441112, 3.139892, 0, 0.07450981, 1, 1,
0.5211296, -1.258215, 1.609957, 0, 0.07058824, 1, 1,
0.5213879, 0.341089, 1.419339, 0, 0.0627451, 1, 1,
0.521508, 2.308426, -1.493756, 0, 0.05882353, 1, 1,
0.5268295, 0.2748621, 2.051772, 0, 0.05098039, 1, 1,
0.530937, 1.068497, -1.580113, 0, 0.04705882, 1, 1,
0.5346429, 2.024926, -0.2998711, 0, 0.03921569, 1, 1,
0.5377289, 1.576694, 0.6592713, 0, 0.03529412, 1, 1,
0.5428309, 0.4657744, 0.8905666, 0, 0.02745098, 1, 1,
0.553124, 1.05384, -0.4102908, 0, 0.02352941, 1, 1,
0.5536811, -0.0385878, 1.455113, 0, 0.01568628, 1, 1,
0.5540861, 0.3967061, 1.389596, 0, 0.01176471, 1, 1,
0.5549355, -0.6730493, 0.7321468, 0, 0.003921569, 1, 1,
0.5553326, -0.4371748, 1.74881, 0.003921569, 0, 1, 1,
0.5626811, 1.502285, -0.4314508, 0.007843138, 0, 1, 1,
0.5660266, 0.3758496, 0.4177207, 0.01568628, 0, 1, 1,
0.5747746, 0.7847528, -0.4580395, 0.01960784, 0, 1, 1,
0.5795126, -0.5624645, 3.746979, 0.02745098, 0, 1, 1,
0.5795338, 0.02247648, 2.306831, 0.03137255, 0, 1, 1,
0.5799191, -0.8045418, 2.243341, 0.03921569, 0, 1, 1,
0.5816693, 0.4803244, 2.333545, 0.04313726, 0, 1, 1,
0.5832653, 1.869076, -0.2894653, 0.05098039, 0, 1, 1,
0.5886229, -1.83828, 3.366895, 0.05490196, 0, 1, 1,
0.5917507, 0.5326342, 1.816633, 0.0627451, 0, 1, 1,
0.5923212, -0.2793976, 3.567838, 0.06666667, 0, 1, 1,
0.5937395, 1.211064, 3.648119, 0.07450981, 0, 1, 1,
0.5943831, -0.3257225, 2.245802, 0.07843138, 0, 1, 1,
0.5970982, -0.4015435, 3.602564, 0.08627451, 0, 1, 1,
0.5981129, -1.501487, 3.488524, 0.09019608, 0, 1, 1,
0.5992797, 0.08477643, 3.516178, 0.09803922, 0, 1, 1,
0.6005985, 0.5349779, 0.806452, 0.1058824, 0, 1, 1,
0.6009189, 2.061772, -0.9459664, 0.1098039, 0, 1, 1,
0.6015158, -0.1767795, 2.312448, 0.1176471, 0, 1, 1,
0.6049489, 0.3907213, 1.288857, 0.1215686, 0, 1, 1,
0.6058968, -0.4095114, 4.296855, 0.1294118, 0, 1, 1,
0.6103119, 1.904988, -0.5619822, 0.1333333, 0, 1, 1,
0.6163877, -0.946763, -0.2918219, 0.1411765, 0, 1, 1,
0.6232429, -0.6342853, 3.5624, 0.145098, 0, 1, 1,
0.6255943, -0.1305574, 1.242172, 0.1529412, 0, 1, 1,
0.6259593, 1.308358, 1.515454, 0.1568628, 0, 1, 1,
0.6259932, -1.245245, 2.959391, 0.1647059, 0, 1, 1,
0.6268641, 1.370832, 2.01265, 0.1686275, 0, 1, 1,
0.6279037, 0.02212397, 1.526047, 0.1764706, 0, 1, 1,
0.6328948, 0.9289798, -0.533021, 0.1803922, 0, 1, 1,
0.6334333, 0.0001538465, 1.475008, 0.1882353, 0, 1, 1,
0.6371585, -0.318106, 0.4812999, 0.1921569, 0, 1, 1,
0.6382052, -0.2120592, -0.1839873, 0.2, 0, 1, 1,
0.6387099, -1.518903, 4.437596, 0.2078431, 0, 1, 1,
0.640232, 1.451111, -0.9002012, 0.2117647, 0, 1, 1,
0.6425416, 0.6147205, 1.045149, 0.2196078, 0, 1, 1,
0.6516184, 1.385567, 0.3290026, 0.2235294, 0, 1, 1,
0.6524614, 0.5834868, 0.5242394, 0.2313726, 0, 1, 1,
0.6527512, 0.3776837, 1.423243, 0.2352941, 0, 1, 1,
0.6611918, -0.7618465, 4.153986, 0.2431373, 0, 1, 1,
0.6612917, 0.1155642, 1.679605, 0.2470588, 0, 1, 1,
0.6618805, 0.2060043, 2.202807, 0.254902, 0, 1, 1,
0.6622022, -0.5999559, 2.333931, 0.2588235, 0, 1, 1,
0.6630733, 0.4227243, -0.1729643, 0.2666667, 0, 1, 1,
0.6709229, 0.08243097, 2.37344, 0.2705882, 0, 1, 1,
0.6738389, 0.4619594, -0.5774246, 0.2784314, 0, 1, 1,
0.6789569, -0.5234036, 0.9386198, 0.282353, 0, 1, 1,
0.685499, -0.4263913, 2.950615, 0.2901961, 0, 1, 1,
0.6913737, -0.9522015, 2.770578, 0.2941177, 0, 1, 1,
0.6969412, -0.7225618, 2.552872, 0.3019608, 0, 1, 1,
0.705983, -2.411912, 2.742396, 0.3098039, 0, 1, 1,
0.7120457, -0.04857183, 2.109744, 0.3137255, 0, 1, 1,
0.7187234, 1.590081, 0.2283703, 0.3215686, 0, 1, 1,
0.7194009, -1.122463, 3.100715, 0.3254902, 0, 1, 1,
0.7220522, 0.1533085, 1.232202, 0.3333333, 0, 1, 1,
0.7230766, -0.723231, 4.702672, 0.3372549, 0, 1, 1,
0.7262395, -0.2744506, 1.718437, 0.345098, 0, 1, 1,
0.7296472, -0.2791174, 2.33171, 0.3490196, 0, 1, 1,
0.7335771, 0.3772544, 0.01549221, 0.3568628, 0, 1, 1,
0.7386601, -2.399182, 3.360371, 0.3607843, 0, 1, 1,
0.740327, 1.093118, -0.4344768, 0.3686275, 0, 1, 1,
0.7411892, 2.355771, 0.8302199, 0.372549, 0, 1, 1,
0.7443764, 0.5828143, 0.7770026, 0.3803922, 0, 1, 1,
0.7467273, -1.067911, 1.835698, 0.3843137, 0, 1, 1,
0.7478389, -1.522145, 3.884975, 0.3921569, 0, 1, 1,
0.7501354, -1.490976, 2.778499, 0.3960784, 0, 1, 1,
0.7541974, -1.119968, 3.062005, 0.4039216, 0, 1, 1,
0.757996, 0.795571, -0.4971432, 0.4117647, 0, 1, 1,
0.7622162, -0.1338204, 1.935772, 0.4156863, 0, 1, 1,
0.7692719, -0.3226359, 1.704299, 0.4235294, 0, 1, 1,
0.772005, -1.104521, 2.44618, 0.427451, 0, 1, 1,
0.7720963, 1.248109, 1.840911, 0.4352941, 0, 1, 1,
0.7721795, 0.4980419, 2.067869, 0.4392157, 0, 1, 1,
0.7762891, 0.730205, 1.694699, 0.4470588, 0, 1, 1,
0.777517, -0.6941217, 2.423134, 0.4509804, 0, 1, 1,
0.7776074, 0.6865685, 1.294431, 0.4588235, 0, 1, 1,
0.7839472, -0.5172166, 2.736836, 0.4627451, 0, 1, 1,
0.7843608, 0.1327361, 1.07294, 0.4705882, 0, 1, 1,
0.7846502, 0.3416048, 2.453825, 0.4745098, 0, 1, 1,
0.7866128, -0.6199421, 2.072959, 0.4823529, 0, 1, 1,
0.7870369, 0.9561771, 0.965187, 0.4862745, 0, 1, 1,
0.7904509, -1.903819, 3.427259, 0.4941176, 0, 1, 1,
0.7908317, -0.9679341, 0.3714735, 0.5019608, 0, 1, 1,
0.7981865, 0.3498919, 0.4724872, 0.5058824, 0, 1, 1,
0.8037428, 0.4716123, 1.458102, 0.5137255, 0, 1, 1,
0.8074797, 0.1097004, 3.904693, 0.5176471, 0, 1, 1,
0.810251, 0.8173283, -0.5217391, 0.5254902, 0, 1, 1,
0.8158246, -1.100933, 3.221438, 0.5294118, 0, 1, 1,
0.8195434, -0.5961837, 2.599082, 0.5372549, 0, 1, 1,
0.8295118, -0.7182635, 1.393013, 0.5411765, 0, 1, 1,
0.8315139, -0.1299892, 0.7584311, 0.5490196, 0, 1, 1,
0.8342577, 0.5224309, 1.345307, 0.5529412, 0, 1, 1,
0.8361898, 0.5469319, -0.5201514, 0.5607843, 0, 1, 1,
0.8376735, 1.543829, 0.9958726, 0.5647059, 0, 1, 1,
0.8382963, -0.6286574, 3.417302, 0.572549, 0, 1, 1,
0.84372, -0.2747771, 0.5159929, 0.5764706, 0, 1, 1,
0.8494886, 0.5199461, 1.738407, 0.5843138, 0, 1, 1,
0.8543139, 0.1040639, 1.6866, 0.5882353, 0, 1, 1,
0.8549551, -0.6703641, 3.442902, 0.5960785, 0, 1, 1,
0.8554173, 1.81302, -0.02166929, 0.6039216, 0, 1, 1,
0.8587469, -0.3720395, 1.896153, 0.6078432, 0, 1, 1,
0.8610425, -0.1102794, 3.960865, 0.6156863, 0, 1, 1,
0.8646195, -0.5741114, 1.58139, 0.6196079, 0, 1, 1,
0.8821733, 0.1241223, -0.1476239, 0.627451, 0, 1, 1,
0.8836595, 0.06470796, 1.987134, 0.6313726, 0, 1, 1,
0.8864282, 0.9225383, 0.7252797, 0.6392157, 0, 1, 1,
0.8899117, 0.9939477, -2.181079, 0.6431373, 0, 1, 1,
0.8926958, 0.2137433, 0.2225983, 0.6509804, 0, 1, 1,
0.8972379, 1.260106, -0.05877399, 0.654902, 0, 1, 1,
0.8998212, -0.3928242, 2.69472, 0.6627451, 0, 1, 1,
0.9058505, 0.5072166, 1.366367, 0.6666667, 0, 1, 1,
0.9077436, -1.346041, 1.739288, 0.6745098, 0, 1, 1,
0.9083181, -1.728953, 1.008933, 0.6784314, 0, 1, 1,
0.91967, 0.1375582, 2.378328, 0.6862745, 0, 1, 1,
0.9215375, -1.479687, 1.984775, 0.6901961, 0, 1, 1,
0.9228632, -2.413185, 3.785968, 0.6980392, 0, 1, 1,
0.9243135, 0.5654774, 0.09667125, 0.7058824, 0, 1, 1,
0.9243767, -0.4724514, 3.916307, 0.7098039, 0, 1, 1,
0.9264054, -1.704376, 3.061946, 0.7176471, 0, 1, 1,
0.9288298, 0.1594322, 2.506525, 0.7215686, 0, 1, 1,
0.933302, 0.9240279, 0.03787671, 0.7294118, 0, 1, 1,
0.9336278, -0.1243941, 1.790926, 0.7333333, 0, 1, 1,
0.9336685, 1.033227, 0.6586519, 0.7411765, 0, 1, 1,
0.9345874, -2.610279, 3.855768, 0.7450981, 0, 1, 1,
0.9384112, 0.2329424, 1.435776, 0.7529412, 0, 1, 1,
0.9397142, -1.668463, 2.108549, 0.7568628, 0, 1, 1,
0.943235, 0.561361, 1.326258, 0.7647059, 0, 1, 1,
0.943644, 0.8239675, 1.300471, 0.7686275, 0, 1, 1,
0.944647, -2.250575, 4.168724, 0.7764706, 0, 1, 1,
0.9447437, -0.8509693, 2.661974, 0.7803922, 0, 1, 1,
0.9449269, -1.07971, 0.9960487, 0.7882353, 0, 1, 1,
0.945167, 0.6464986, 1.227646, 0.7921569, 0, 1, 1,
0.9473362, 1.159165, 1.007014, 0.8, 0, 1, 1,
0.9492187, 0.4503157, 2.447221, 0.8078431, 0, 1, 1,
0.9504919, -0.3574756, 2.927969, 0.8117647, 0, 1, 1,
0.9518682, -0.7347361, 2.531124, 0.8196079, 0, 1, 1,
0.9532024, 2.100197, 0.9740019, 0.8235294, 0, 1, 1,
0.9579935, -0.2042825, 0.8723486, 0.8313726, 0, 1, 1,
0.9617202, -1.087245, 3.535539, 0.8352941, 0, 1, 1,
0.9709854, 0.6043829, 1.12501, 0.8431373, 0, 1, 1,
0.9733641, -1.083378, 3.231017, 0.8470588, 0, 1, 1,
0.9745442, 1.208145, 2.035348, 0.854902, 0, 1, 1,
0.9823191, -0.150044, 1.723552, 0.8588235, 0, 1, 1,
0.985827, -1.516945, 1.679701, 0.8666667, 0, 1, 1,
0.9880595, -0.7068453, 1.465014, 0.8705882, 0, 1, 1,
0.9885913, -0.04502853, 2.879533, 0.8784314, 0, 1, 1,
0.9951318, 0.584575, 0.9599199, 0.8823529, 0, 1, 1,
0.9951985, 1.103506, 1.242143, 0.8901961, 0, 1, 1,
0.9978425, 0.8472652, -0.4317705, 0.8941177, 0, 1, 1,
0.9993255, -0.3601682, 1.353542, 0.9019608, 0, 1, 1,
1.001236, 1.24672, 1.747006, 0.9098039, 0, 1, 1,
1.012175, 0.5000157, 1.213271, 0.9137255, 0, 1, 1,
1.018776, 0.2890647, 1.166213, 0.9215686, 0, 1, 1,
1.027289, -0.5601367, 0.691065, 0.9254902, 0, 1, 1,
1.032384, -1.093768, 1.7028, 0.9333333, 0, 1, 1,
1.033177, 0.3608734, 1.648744, 0.9372549, 0, 1, 1,
1.039512, 1.031465, 0.7416816, 0.945098, 0, 1, 1,
1.040605, -0.1701489, 1.545978, 0.9490196, 0, 1, 1,
1.043892, 1.668797, -0.3161449, 0.9568627, 0, 1, 1,
1.046419, -0.3560783, 1.338989, 0.9607843, 0, 1, 1,
1.047437, -1.593431, 2.371967, 0.9686275, 0, 1, 1,
1.052678, -0.8237188, 2.317491, 0.972549, 0, 1, 1,
1.059321, -0.1537914, 0.4800918, 0.9803922, 0, 1, 1,
1.071184, -0.2080971, 1.16388, 0.9843137, 0, 1, 1,
1.074919, -0.5947895, 1.468611, 0.9921569, 0, 1, 1,
1.075455, -0.6692152, 3.66406, 0.9960784, 0, 1, 1,
1.082478, -0.6356235, 2.407893, 1, 0, 0.9960784, 1,
1.085333, 0.3541983, 0.3821158, 1, 0, 0.9882353, 1,
1.086599, 0.5859886, 2.578395, 1, 0, 0.9843137, 1,
1.086774, 1.700328, 0.2648274, 1, 0, 0.9764706, 1,
1.09209, 0.9537346, 2.024318, 1, 0, 0.972549, 1,
1.094998, 1.092168, 0.2949855, 1, 0, 0.9647059, 1,
1.107575, -0.1688048, 3.07018, 1, 0, 0.9607843, 1,
1.108623, -1.365973, 0.929706, 1, 0, 0.9529412, 1,
1.109842, 0.5429716, 2.322873, 1, 0, 0.9490196, 1,
1.110502, -0.0550907, 2.076025, 1, 0, 0.9411765, 1,
1.1173, -0.2857806, 3.188736, 1, 0, 0.9372549, 1,
1.117862, 1.978738, 0.336786, 1, 0, 0.9294118, 1,
1.123973, 0.2712862, 0.219812, 1, 0, 0.9254902, 1,
1.126685, -0.1194939, 2.63265, 1, 0, 0.9176471, 1,
1.13335, -0.3354116, 2.372549, 1, 0, 0.9137255, 1,
1.139145, 0.2973874, 2.619398, 1, 0, 0.9058824, 1,
1.139388, 0.4143086, 1.078143, 1, 0, 0.9019608, 1,
1.150823, 1.171434, -1.172785, 1, 0, 0.8941177, 1,
1.152744, -0.2075221, 1.559352, 1, 0, 0.8862745, 1,
1.160987, -0.0579486, 0.7391552, 1, 0, 0.8823529, 1,
1.162888, 1.410139, 1.834622, 1, 0, 0.8745098, 1,
1.165084, -2.04667, 2.398185, 1, 0, 0.8705882, 1,
1.175331, -0.5885867, 0.1899504, 1, 0, 0.8627451, 1,
1.178205, 1.513925, 0.04161745, 1, 0, 0.8588235, 1,
1.179918, -0.2471246, 1.262751, 1, 0, 0.8509804, 1,
1.180112, -0.04116904, 2.847172, 1, 0, 0.8470588, 1,
1.181883, 1.113526, 1.225381, 1, 0, 0.8392157, 1,
1.186756, -0.4052021, 2.019338, 1, 0, 0.8352941, 1,
1.193382, 0.314844, 2.372575, 1, 0, 0.827451, 1,
1.201507, -0.3224581, 2.944278, 1, 0, 0.8235294, 1,
1.205292, -0.1191371, 2.824221, 1, 0, 0.8156863, 1,
1.21718, -3.431495, 3.190812, 1, 0, 0.8117647, 1,
1.220889, -0.1707784, 1.535791, 1, 0, 0.8039216, 1,
1.224035, -0.6489699, 3.882233, 1, 0, 0.7960784, 1,
1.227982, -0.1092865, 2.219822, 1, 0, 0.7921569, 1,
1.228817, 0.2134719, 1.048495, 1, 0, 0.7843137, 1,
1.229745, 1.19236, 1.123166, 1, 0, 0.7803922, 1,
1.231493, -0.4088122, 1.889059, 1, 0, 0.772549, 1,
1.237824, 0.7458186, 1.711349, 1, 0, 0.7686275, 1,
1.24446, -0.6257368, 0.09936673, 1, 0, 0.7607843, 1,
1.246156, -1.093256, 0.680744, 1, 0, 0.7568628, 1,
1.251673, 0.6142288, 1.961124, 1, 0, 0.7490196, 1,
1.253007, 1.591265, -0.6300477, 1, 0, 0.7450981, 1,
1.25541, 1.372942, -0.8806304, 1, 0, 0.7372549, 1,
1.255419, 0.5434095, 1.949347, 1, 0, 0.7333333, 1,
1.2555, 0.06482474, 0.2379003, 1, 0, 0.7254902, 1,
1.258654, 0.05890584, 1.253412, 1, 0, 0.7215686, 1,
1.263202, 0.875832, 0.5667701, 1, 0, 0.7137255, 1,
1.266292, 1.40531, 2.152737, 1, 0, 0.7098039, 1,
1.268917, 0.9892048, 2.102563, 1, 0, 0.7019608, 1,
1.278101, -1.078185, 1.185307, 1, 0, 0.6941177, 1,
1.28125, -0.8284916, 0.8212063, 1, 0, 0.6901961, 1,
1.286108, -0.1600634, 2.586044, 1, 0, 0.682353, 1,
1.2928, -0.6285284, 1.727694, 1, 0, 0.6784314, 1,
1.307174, 1.200266, 2.153035, 1, 0, 0.6705883, 1,
1.307433, -1.04643, 2.389377, 1, 0, 0.6666667, 1,
1.308762, 1.257598, 0.07948839, 1, 0, 0.6588235, 1,
1.316845, 1.026553, 0.7145083, 1, 0, 0.654902, 1,
1.322413, -0.01989286, -1.107618, 1, 0, 0.6470588, 1,
1.336148, -0.5572107, 1.161228, 1, 0, 0.6431373, 1,
1.345354, 0.03113653, 2.736637, 1, 0, 0.6352941, 1,
1.354035, 1.351784, 0.0826415, 1, 0, 0.6313726, 1,
1.35652, 0.335385, 0.5624187, 1, 0, 0.6235294, 1,
1.37829, 0.07766465, 2.082911, 1, 0, 0.6196079, 1,
1.384816, -1.043957, 3.47648, 1, 0, 0.6117647, 1,
1.388405, -0.6903989, 3.183146, 1, 0, 0.6078432, 1,
1.390532, 1.151879, 1.4577, 1, 0, 0.6, 1,
1.402324, 0.7022228, -0.07641424, 1, 0, 0.5921569, 1,
1.405456, -0.78127, 2.295283, 1, 0, 0.5882353, 1,
1.411872, -0.5049493, 1.846888, 1, 0, 0.5803922, 1,
1.417286, 0.6715407, 1.23942, 1, 0, 0.5764706, 1,
1.418576, 0.9307852, 0.8447894, 1, 0, 0.5686275, 1,
1.425832, -1.878721, 1.264348, 1, 0, 0.5647059, 1,
1.427109, 0.3492201, 0.1977329, 1, 0, 0.5568628, 1,
1.443868, -0.2864715, 3.058842, 1, 0, 0.5529412, 1,
1.449205, 1.091272, 2.573915, 1, 0, 0.5450981, 1,
1.461391, -0.8253253, 2.290537, 1, 0, 0.5411765, 1,
1.476229, -1.331074, 2.843484, 1, 0, 0.5333334, 1,
1.483316, -0.427795, 0.4278731, 1, 0, 0.5294118, 1,
1.490734, -1.249611, 3.274017, 1, 0, 0.5215687, 1,
1.493208, -0.6726099, 2.375771, 1, 0, 0.5176471, 1,
1.498729, 0.01044067, -0.2883196, 1, 0, 0.509804, 1,
1.499333, 0.7208763, 0.06382018, 1, 0, 0.5058824, 1,
1.521419, -0.2204314, 1.628729, 1, 0, 0.4980392, 1,
1.522377, 0.8215271, 1.634862, 1, 0, 0.4901961, 1,
1.522926, 0.4297294, 1.246225, 1, 0, 0.4862745, 1,
1.526908, -0.7481115, 1.209628, 1, 0, 0.4784314, 1,
1.528437, -0.2966784, 2.94702, 1, 0, 0.4745098, 1,
1.528834, -1.152079, 1.357162, 1, 0, 0.4666667, 1,
1.540035, 0.4066005, 4.099844, 1, 0, 0.4627451, 1,
1.551918, 0.1911813, 1.204723, 1, 0, 0.454902, 1,
1.554185, 1.971416, 0.2667733, 1, 0, 0.4509804, 1,
1.568532, 0.1360971, 3.022254, 1, 0, 0.4431373, 1,
1.570168, 0.4237776, 1.421526, 1, 0, 0.4392157, 1,
1.579793, 0.07816572, 3.297366, 1, 0, 0.4313726, 1,
1.580649, 0.5857882, 0.02374092, 1, 0, 0.427451, 1,
1.58811, 0.01530283, -0.239472, 1, 0, 0.4196078, 1,
1.602194, -2.351759, 2.655399, 1, 0, 0.4156863, 1,
1.603075, -1.325721, 3.114757, 1, 0, 0.4078431, 1,
1.616728, 0.5629067, 0.3631583, 1, 0, 0.4039216, 1,
1.616869, 1.937957, 0.1099969, 1, 0, 0.3960784, 1,
1.618168, 0.2471104, 1.041732, 1, 0, 0.3882353, 1,
1.629348, 0.652915, 1.815526, 1, 0, 0.3843137, 1,
1.629459, -1.41011, 3.932892, 1, 0, 0.3764706, 1,
1.643572, -0.959177, 2.468967, 1, 0, 0.372549, 1,
1.645636, 0.6526224, 0.1961576, 1, 0, 0.3647059, 1,
1.655821, 0.1377584, 0.8940831, 1, 0, 0.3607843, 1,
1.658314, -0.5713061, 1.174969, 1, 0, 0.3529412, 1,
1.658854, -1.340129, 1.369687, 1, 0, 0.3490196, 1,
1.663156, 0.2601664, 4.207302, 1, 0, 0.3411765, 1,
1.663629, 1.160834, 0.9552896, 1, 0, 0.3372549, 1,
1.667869, 0.2057521, 2.914789, 1, 0, 0.3294118, 1,
1.66811, 0.1036498, 1.701846, 1, 0, 0.3254902, 1,
1.678847, -0.8702035, 1.651398, 1, 0, 0.3176471, 1,
1.700271, -0.5855587, 1.519374, 1, 0, 0.3137255, 1,
1.705873, 0.6820005, -0.03208823, 1, 0, 0.3058824, 1,
1.721346, -2.343817, 0.5410589, 1, 0, 0.2980392, 1,
1.730717, -0.4882328, 3.42289, 1, 0, 0.2941177, 1,
1.733428, 0.9695798, 0.8458865, 1, 0, 0.2862745, 1,
1.743661, -0.255454, 0.5882218, 1, 0, 0.282353, 1,
1.756305, 0.8234574, 1.997536, 1, 0, 0.2745098, 1,
1.793724, -0.09529492, 0.07454819, 1, 0, 0.2705882, 1,
1.806626, -0.4405796, 2.105339, 1, 0, 0.2627451, 1,
1.814959, -1.465984, 0.1033274, 1, 0, 0.2588235, 1,
1.828689, -0.8740724, 3.953599, 1, 0, 0.2509804, 1,
1.834868, 0.07784437, 1.920023, 1, 0, 0.2470588, 1,
1.853393, -1.330199, 3.992073, 1, 0, 0.2392157, 1,
1.855977, 0.2782757, 1.065009, 1, 0, 0.2352941, 1,
1.864706, 1.513934, 1.914563, 1, 0, 0.227451, 1,
1.888026, -0.5623824, -0.2496175, 1, 0, 0.2235294, 1,
1.895015, -0.5629317, 2.601983, 1, 0, 0.2156863, 1,
1.91224, 0.839466, 1.921001, 1, 0, 0.2117647, 1,
1.915411, 0.6801831, 0.2393982, 1, 0, 0.2039216, 1,
1.949577, -0.04758777, 0.4075312, 1, 0, 0.1960784, 1,
1.96561, 0.001352484, 2.035041, 1, 0, 0.1921569, 1,
1.975725, -1.526051, 0.2512148, 1, 0, 0.1843137, 1,
1.976235, -0.08676097, 1.757908, 1, 0, 0.1803922, 1,
1.992619, 0.5189673, 0.4492394, 1, 0, 0.172549, 1,
2.027141, -0.2540993, 4.048282, 1, 0, 0.1686275, 1,
2.046009, -0.413329, 3.368798, 1, 0, 0.1607843, 1,
2.05487, 0.414294, 0.8436031, 1, 0, 0.1568628, 1,
2.08222, 0.1081305, 1.275399, 1, 0, 0.1490196, 1,
2.083196, 0.7349151, -0.04764852, 1, 0, 0.145098, 1,
2.105571, -0.253903, 1.862454, 1, 0, 0.1372549, 1,
2.118807, -0.1873829, 1.751103, 1, 0, 0.1333333, 1,
2.121929, 1.909441, 0.9224356, 1, 0, 0.1254902, 1,
2.145199, -0.26316, 0.3963382, 1, 0, 0.1215686, 1,
2.252656, 0.7880328, 2.678097, 1, 0, 0.1137255, 1,
2.254652, -0.09165914, 2.588259, 1, 0, 0.1098039, 1,
2.262429, -0.593872, 0.695325, 1, 0, 0.1019608, 1,
2.304518, -0.1453782, 1.248358, 1, 0, 0.09411765, 1,
2.324983, -0.3533538, -0.3409277, 1, 0, 0.09019608, 1,
2.34865, 1.905768, 0.5267457, 1, 0, 0.08235294, 1,
2.450854, 1.12347, 0.6249172, 1, 0, 0.07843138, 1,
2.532215, -0.02371557, 1.295234, 1, 0, 0.07058824, 1,
2.533436, 1.13952, 1.369314, 1, 0, 0.06666667, 1,
2.556916, -0.1067262, 1.504214, 1, 0, 0.05882353, 1,
2.666507, 0.36056, 2.551374, 1, 0, 0.05490196, 1,
2.768358, 0.502564, 1.963546, 1, 0, 0.04705882, 1,
2.81685, -1.23217, 2.923414, 1, 0, 0.04313726, 1,
2.822848, -0.8887948, 0.9838242, 1, 0, 0.03529412, 1,
2.908862, 0.005718273, 0.7561152, 1, 0, 0.03137255, 1,
2.943507, 0.5185395, 2.134064, 1, 0, 0.02352941, 1,
2.943927, -0.5179821, 1.154511, 1, 0, 0.01960784, 1,
3.105099, 0.02515933, 2.43933, 1, 0, 0.01176471, 1,
3.74328, 0.5925351, 1.127382, 1, 0, 0.007843138, 1
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
0.2260723, -4.489483, -7.352873, 0, -0.5, 0.5, 0.5,
0.2260723, -4.489483, -7.352873, 1, -0.5, 0.5, 0.5,
0.2260723, -4.489483, -7.352873, 1, 1.5, 0.5, 0.5,
0.2260723, -4.489483, -7.352873, 0, 1.5, 0.5, 0.5
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
-4.483469, -0.3105856, -7.352873, 0, -0.5, 0.5, 0.5,
-4.483469, -0.3105856, -7.352873, 1, -0.5, 0.5, 0.5,
-4.483469, -0.3105856, -7.352873, 1, 1.5, 0.5, 0.5,
-4.483469, -0.3105856, -7.352873, 0, 1.5, 0.5, 0.5
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
-4.483469, -4.489483, -0.06131268, 0, -0.5, 0.5, 0.5,
-4.483469, -4.489483, -0.06131268, 1, -0.5, 0.5, 0.5,
-4.483469, -4.489483, -0.06131268, 1, 1.5, 0.5, 0.5,
-4.483469, -4.489483, -0.06131268, 0, 1.5, 0.5, 0.5
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
-2, -3.525122, -5.670205,
2, -3.525122, -5.670205,
-2, -3.525122, -5.670205,
-2, -3.685849, -5.95065,
0, -3.525122, -5.670205,
0, -3.685849, -5.95065,
2, -3.525122, -5.670205,
2, -3.685849, -5.95065
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
-2, -4.007303, -6.511539, 0, -0.5, 0.5, 0.5,
-2, -4.007303, -6.511539, 1, -0.5, 0.5, 0.5,
-2, -4.007303, -6.511539, 1, 1.5, 0.5, 0.5,
-2, -4.007303, -6.511539, 0, 1.5, 0.5, 0.5,
0, -4.007303, -6.511539, 0, -0.5, 0.5, 0.5,
0, -4.007303, -6.511539, 1, -0.5, 0.5, 0.5,
0, -4.007303, -6.511539, 1, 1.5, 0.5, 0.5,
0, -4.007303, -6.511539, 0, 1.5, 0.5, 0.5,
2, -4.007303, -6.511539, 0, -0.5, 0.5, 0.5,
2, -4.007303, -6.511539, 1, -0.5, 0.5, 0.5,
2, -4.007303, -6.511539, 1, 1.5, 0.5, 0.5,
2, -4.007303, -6.511539, 0, 1.5, 0.5, 0.5
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
-3.396652, -3, -5.670205,
-3.396652, 2, -5.670205,
-3.396652, -3, -5.670205,
-3.577788, -3, -5.95065,
-3.396652, -2, -5.670205,
-3.577788, -2, -5.95065,
-3.396652, -1, -5.670205,
-3.577788, -1, -5.95065,
-3.396652, 0, -5.670205,
-3.577788, 0, -5.95065,
-3.396652, 1, -5.670205,
-3.577788, 1, -5.95065,
-3.396652, 2, -5.670205,
-3.577788, 2, -5.95065
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
"2"
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
-3.940061, -3, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, -3, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, -3, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, -3, -6.511539, 0, 1.5, 0.5, 0.5,
-3.940061, -2, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, -2, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, -2, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, -2, -6.511539, 0, 1.5, 0.5, 0.5,
-3.940061, -1, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, -1, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, -1, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, -1, -6.511539, 0, 1.5, 0.5, 0.5,
-3.940061, 0, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, 0, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, 0, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, 0, -6.511539, 0, 1.5, 0.5, 0.5,
-3.940061, 1, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, 1, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, 1, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, 1, -6.511539, 0, 1.5, 0.5, 0.5,
-3.940061, 2, -6.511539, 0, -0.5, 0.5, 0.5,
-3.940061, 2, -6.511539, 1, -0.5, 0.5, 0.5,
-3.940061, 2, -6.511539, 1, 1.5, 0.5, 0.5,
-3.940061, 2, -6.511539, 0, 1.5, 0.5, 0.5
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
-3.396652, -3.525122, -4,
-3.396652, -3.525122, 4,
-3.396652, -3.525122, -4,
-3.577788, -3.685849, -4,
-3.396652, -3.525122, -2,
-3.577788, -3.685849, -2,
-3.396652, -3.525122, 0,
-3.577788, -3.685849, 0,
-3.396652, -3.525122, 2,
-3.577788, -3.685849, 2,
-3.396652, -3.525122, 4,
-3.577788, -3.685849, 4
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
-3.940061, -4.007303, -4, 0, -0.5, 0.5, 0.5,
-3.940061, -4.007303, -4, 1, -0.5, 0.5, 0.5,
-3.940061, -4.007303, -4, 1, 1.5, 0.5, 0.5,
-3.940061, -4.007303, -4, 0, 1.5, 0.5, 0.5,
-3.940061, -4.007303, -2, 0, -0.5, 0.5, 0.5,
-3.940061, -4.007303, -2, 1, -0.5, 0.5, 0.5,
-3.940061, -4.007303, -2, 1, 1.5, 0.5, 0.5,
-3.940061, -4.007303, -2, 0, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 0, 0, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 0, 1, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 0, 1, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 0, 0, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 2, 0, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 2, 1, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 2, 1, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 2, 0, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 4, 0, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 4, 1, -0.5, 0.5, 0.5,
-3.940061, -4.007303, 4, 1, 1.5, 0.5, 0.5,
-3.940061, -4.007303, 4, 0, 1.5, 0.5, 0.5
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
-3.396652, -3.525122, -5.670205,
-3.396652, 2.903951, -5.670205,
-3.396652, -3.525122, 5.54758,
-3.396652, 2.903951, 5.54758,
-3.396652, -3.525122, -5.670205,
-3.396652, -3.525122, 5.54758,
-3.396652, 2.903951, -5.670205,
-3.396652, 2.903951, 5.54758,
-3.396652, -3.525122, -5.670205,
3.848797, -3.525122, -5.670205,
-3.396652, -3.525122, 5.54758,
3.848797, -3.525122, 5.54758,
-3.396652, 2.903951, -5.670205,
3.848797, 2.903951, -5.670205,
-3.396652, 2.903951, 5.54758,
3.848797, 2.903951, 5.54758,
3.848797, -3.525122, -5.670205,
3.848797, 2.903951, -5.670205,
3.848797, -3.525122, 5.54758,
3.848797, 2.903951, 5.54758,
3.848797, -3.525122, -5.670205,
3.848797, -3.525122, 5.54758,
3.848797, 2.903951, -5.670205,
3.848797, 2.903951, 5.54758
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
var radius = 7.914237;
var distance = 35.21133;
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
mvMatrix.translate( -0.2260723, 0.3105856, 0.06131268 );
mvMatrix.scale( 1.181021, 1.330989, 0.7628091 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21133);
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
NOXA<-read.table("NOXA.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-NOXA$V2
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
```

```r
y<-NOXA$V3
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
```

```r
z<-NOXA$V4
```

```
## Error in eval(expr, envir, enclos): object 'NOXA' not found
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
-3.291136, -0.972971, -2.383743, 0, 0, 1, 1, 1,
-2.760587, 1.264693, -0.07602882, 1, 0, 0, 1, 1,
-2.570101, -1.782556, -2.076474, 1, 0, 0, 1, 1,
-2.560691, 0.09333025, -0.7863654, 1, 0, 0, 1, 1,
-2.514338, -0.310198, -2.798404, 1, 0, 0, 1, 1,
-2.513447, 0.2822617, -0.1922915, 1, 0, 0, 1, 1,
-2.511679, -0.691273, -0.7501145, 0, 0, 0, 1, 1,
-2.423502, -0.5628911, -2.134933, 0, 0, 0, 1, 1,
-2.408736, 0.8378773, -1.772128, 0, 0, 0, 1, 1,
-2.39207, 1.453439, -1.997428, 0, 0, 0, 1, 1,
-2.365927, -0.4508599, -2.35344, 0, 0, 0, 1, 1,
-2.287028, -0.7557448, -0.4545653, 0, 0, 0, 1, 1,
-2.227816, 0.2163991, -2.020247, 0, 0, 0, 1, 1,
-2.212611, 0.5416455, -2.704471, 1, 1, 1, 1, 1,
-2.175032, 2.502155, 0.2313885, 1, 1, 1, 1, 1,
-2.164557, 0.7417303, -2.991041, 1, 1, 1, 1, 1,
-2.103947, -0.6925004, -2.507523, 1, 1, 1, 1, 1,
-2.101628, -0.9399964, -3.620974, 1, 1, 1, 1, 1,
-2.076712, -0.6926732, -3.266347, 1, 1, 1, 1, 1,
-2.038967, -1.307707, -1.192876, 1, 1, 1, 1, 1,
-2.025165, 0.9435784, -1.015653, 1, 1, 1, 1, 1,
-2.01253, -0.1886745, -1.971228, 1, 1, 1, 1, 1,
-1.966724, 0.4722215, -2.877804, 1, 1, 1, 1, 1,
-1.966271, -0.3636313, -0.8031179, 1, 1, 1, 1, 1,
-1.943388, -1.164672, -0.8414371, 1, 1, 1, 1, 1,
-1.884159, -0.8739794, -1.578214, 1, 1, 1, 1, 1,
-1.865337, 1.275437, -0.8645644, 1, 1, 1, 1, 1,
-1.865306, -0.2952689, -1.628566, 1, 1, 1, 1, 1,
-1.860909, 0.4415894, -3.591242, 0, 0, 1, 1, 1,
-1.859152, -0.05218056, -1.640196, 1, 0, 0, 1, 1,
-1.852364, 0.06338935, -0.3357301, 1, 0, 0, 1, 1,
-1.84849, 0.384564, -2.231866, 1, 0, 0, 1, 1,
-1.846598, 0.6004006, -2.271773, 1, 0, 0, 1, 1,
-1.830357, -0.3572946, -2.60791, 1, 0, 0, 1, 1,
-1.828981, 1.546263, -0.4999196, 0, 0, 0, 1, 1,
-1.817454, 0.2948932, -0.4635588, 0, 0, 0, 1, 1,
-1.800491, 1.276006, -0.8207413, 0, 0, 0, 1, 1,
-1.782576, -0.6921159, -0.4132908, 0, 0, 0, 1, 1,
-1.761779, 0.03910093, -1.301977, 0, 0, 0, 1, 1,
-1.734108, 0.4727929, -1.495245, 0, 0, 0, 1, 1,
-1.720578, 1.717905, 0.3989375, 0, 0, 0, 1, 1,
-1.718686, -0.7824352, -3.549512, 1, 1, 1, 1, 1,
-1.713777, 0.4987195, -0.005229254, 1, 1, 1, 1, 1,
-1.690398, -0.4308312, -1.827648, 1, 1, 1, 1, 1,
-1.664294, -2.688824, -2.259369, 1, 1, 1, 1, 1,
-1.65947, -1.729575, -2.854794, 1, 1, 1, 1, 1,
-1.653584, -0.4606874, -1.425108, 1, 1, 1, 1, 1,
-1.649086, 1.04489, -1.157161, 1, 1, 1, 1, 1,
-1.635926, -0.7523547, -1.14415, 1, 1, 1, 1, 1,
-1.633476, -1.391293, -2.476585, 1, 1, 1, 1, 1,
-1.628691, 0.4191568, -0.9054813, 1, 1, 1, 1, 1,
-1.619352, 0.6331096, -2.355565, 1, 1, 1, 1, 1,
-1.605498, -0.06716315, -1.602134, 1, 1, 1, 1, 1,
-1.599684, -0.2377451, -2.131208, 1, 1, 1, 1, 1,
-1.591682, 0.1793159, -2.744738, 1, 1, 1, 1, 1,
-1.588435, -2.042982, -2.830827, 1, 1, 1, 1, 1,
-1.584725, -0.1562633, -1.24858, 0, 0, 1, 1, 1,
-1.571761, -1.141139, -3.160002, 1, 0, 0, 1, 1,
-1.5681, -1.11481, -2.821382, 1, 0, 0, 1, 1,
-1.55455, -0.8368284, -1.22168, 1, 0, 0, 1, 1,
-1.550858, 0.6467159, -1.304638, 1, 0, 0, 1, 1,
-1.540721, -0.0526604, -1.665714, 1, 0, 0, 1, 1,
-1.539844, 0.2089741, -1.997917, 0, 0, 0, 1, 1,
-1.532485, -0.652819, -2.062587, 0, 0, 0, 1, 1,
-1.532215, -0.6714009, -4.520156, 0, 0, 0, 1, 1,
-1.52394, 2.568681, 0.6901143, 0, 0, 0, 1, 1,
-1.522713, 1.375066, -1.3194, 0, 0, 0, 1, 1,
-1.489108, 0.8832157, -0.0711237, 0, 0, 0, 1, 1,
-1.475487, 0.8199105, -1.378029, 0, 0, 0, 1, 1,
-1.471393, 1.657232, -0.4496335, 1, 1, 1, 1, 1,
-1.471001, 0.584505, -1.653664, 1, 1, 1, 1, 1,
-1.469344, -0.2242826, 0.8888775, 1, 1, 1, 1, 1,
-1.461541, 0.4018134, -1.920918, 1, 1, 1, 1, 1,
-1.448562, -0.2472332, -3.146551, 1, 1, 1, 1, 1,
-1.446375, 0.1784451, -3.778595, 1, 1, 1, 1, 1,
-1.441993, -0.2207715, -2.967347, 1, 1, 1, 1, 1,
-1.441822, -0.09020336, -2.531011, 1, 1, 1, 1, 1,
-1.437789, 2.793231, -2.406749, 1, 1, 1, 1, 1,
-1.434317, -0.3553878, -2.159944, 1, 1, 1, 1, 1,
-1.428738, -0.5677103, -2.219525, 1, 1, 1, 1, 1,
-1.427254, -0.06091717, -3.002717, 1, 1, 1, 1, 1,
-1.422023, -0.1292061, -2.113189, 1, 1, 1, 1, 1,
-1.402734, 0.75621, -0.8183699, 1, 1, 1, 1, 1,
-1.392733, -1.285431, -3.404589, 1, 1, 1, 1, 1,
-1.392552, -1.55272, -1.946743, 0, 0, 1, 1, 1,
-1.389156, 1.675533, -0.4618916, 1, 0, 0, 1, 1,
-1.359229, 0.129384, -3.798228, 1, 0, 0, 1, 1,
-1.358007, 1.166642, -3.257958, 1, 0, 0, 1, 1,
-1.337457, -0.142313, -2.164147, 1, 0, 0, 1, 1,
-1.326831, 0.7313715, -1.585946, 1, 0, 0, 1, 1,
-1.322297, -1.592438, -1.86977, 0, 0, 0, 1, 1,
-1.310271, 0.1592724, 0.4596232, 0, 0, 0, 1, 1,
-1.306383, -0.01666188, -1.821726, 0, 0, 0, 1, 1,
-1.306001, 0.2259889, -0.3523673, 0, 0, 0, 1, 1,
-1.30018, -0.5892918, -2.317198, 0, 0, 0, 1, 1,
-1.294108, -0.9135618, -2.45313, 0, 0, 0, 1, 1,
-1.281835, -0.4433689, -1.706635, 0, 0, 0, 1, 1,
-1.277401, -0.223737, -2.21122, 1, 1, 1, 1, 1,
-1.275131, 0.2007735, -1.799097, 1, 1, 1, 1, 1,
-1.274053, 0.6215317, -1.360191, 1, 1, 1, 1, 1,
-1.248578, 1.950706, -2.057432, 1, 1, 1, 1, 1,
-1.238911, -1.154079, -2.933256, 1, 1, 1, 1, 1,
-1.238225, 1.273996, 0.6361962, 1, 1, 1, 1, 1,
-1.236232, 1.193079, 0.2357279, 1, 1, 1, 1, 1,
-1.234111, 1.224272, -0.6854059, 1, 1, 1, 1, 1,
-1.231525, -0.7736574, -1.914485, 1, 1, 1, 1, 1,
-1.230072, -0.7630365, -2.113382, 1, 1, 1, 1, 1,
-1.222242, 1.000178, -1.275114, 1, 1, 1, 1, 1,
-1.221254, -0.2077765, -2.66971, 1, 1, 1, 1, 1,
-1.215675, -0.08744368, -1.993039, 1, 1, 1, 1, 1,
-1.213461, 0.499863, -0.721835, 1, 1, 1, 1, 1,
-1.20407, 1.519509, 1.724935, 1, 1, 1, 1, 1,
-1.202222, -0.6735496, -2.089048, 0, 0, 1, 1, 1,
-1.200928, 0.3562817, -1.460305, 1, 0, 0, 1, 1,
-1.19925, -0.8721064, -2.342721, 1, 0, 0, 1, 1,
-1.195753, 0.3813226, -1.878901, 1, 0, 0, 1, 1,
-1.195695, 1.288234, -1.503668, 1, 0, 0, 1, 1,
-1.191297, -0.7069086, -4.036243, 1, 0, 0, 1, 1,
-1.186124, -0.2168351, -0.3128593, 0, 0, 0, 1, 1,
-1.179757, -0.380877, -0.4075894, 0, 0, 0, 1, 1,
-1.178035, -0.7545485, -0.3218975, 0, 0, 0, 1, 1,
-1.177512, 0.4958554, -0.1014497, 0, 0, 0, 1, 1,
-1.17621, -1.980269, -1.402909, 0, 0, 0, 1, 1,
-1.170923, 0.976391, -0.9865355, 0, 0, 0, 1, 1,
-1.164429, 0.219136, -3.218529, 0, 0, 0, 1, 1,
-1.162335, 1.030098, 0.249672, 1, 1, 1, 1, 1,
-1.154448, -1.43976, -3.578597, 1, 1, 1, 1, 1,
-1.15063, -0.1434832, -1.576314, 1, 1, 1, 1, 1,
-1.147459, 0.7099555, -2.539343, 1, 1, 1, 1, 1,
-1.135274, -1.791963, -3.056859, 1, 1, 1, 1, 1,
-1.128162, 1.145991, -0.4117629, 1, 1, 1, 1, 1,
-1.124867, -1.395382, -2.00515, 1, 1, 1, 1, 1,
-1.124571, -0.6810475, -2.091579, 1, 1, 1, 1, 1,
-1.113258, 0.5733001, -0.7149243, 1, 1, 1, 1, 1,
-1.112792, -0.6374198, -0.9953512, 1, 1, 1, 1, 1,
-1.102976, -0.7739893, -1.681675, 1, 1, 1, 1, 1,
-1.094976, -0.03876001, -0.2954784, 1, 1, 1, 1, 1,
-1.080683, 0.01789356, -2.378592, 1, 1, 1, 1, 1,
-1.078451, 1.037278, -1.21866, 1, 1, 1, 1, 1,
-1.076287, 0.04790474, -3.422412, 1, 1, 1, 1, 1,
-1.075512, 0.5948297, -1.29604, 0, 0, 1, 1, 1,
-1.073813, -0.2884072, -2.6353, 1, 0, 0, 1, 1,
-1.068571, -0.3180103, -0.1027815, 1, 0, 0, 1, 1,
-1.067838, 0.01102143, -1.374583, 1, 0, 0, 1, 1,
-1.055851, -1.799886, -2.757321, 1, 0, 0, 1, 1,
-1.041214, -0.1849916, -3.052578, 1, 0, 0, 1, 1,
-1.018037, -0.9080913, -1.20053, 0, 0, 0, 1, 1,
-1.015502, -0.3218063, -1.76042, 0, 0, 0, 1, 1,
-1.007432, -0.3909238, -0.425951, 0, 0, 0, 1, 1,
-1.00607, -0.8036982, -2.067993, 0, 0, 0, 1, 1,
-1.005944, 2.218442, 0.2857438, 0, 0, 0, 1, 1,
-1.00272, 0.7182243, -1.846369, 0, 0, 0, 1, 1,
-1.002527, 0.2642972, -1.12107, 0, 0, 0, 1, 1,
-0.9976521, -0.2764454, -2.08454, 1, 1, 1, 1, 1,
-0.9957573, 1.287667, 0.1213642, 1, 1, 1, 1, 1,
-0.9938816, 0.4612793, -0.02154861, 1, 1, 1, 1, 1,
-0.9897006, 0.8661488, -2.454507, 1, 1, 1, 1, 1,
-0.9859696, 0.4854118, -0.6176523, 1, 1, 1, 1, 1,
-0.9752017, -1.65014, -2.966516, 1, 1, 1, 1, 1,
-0.9714574, 0.2157447, -1.792333, 1, 1, 1, 1, 1,
-0.9644511, -1.607334, -2.908341, 1, 1, 1, 1, 1,
-0.9642419, 0.7059744, -1.696727, 1, 1, 1, 1, 1,
-0.9579612, 1.966907, 0.7222654, 1, 1, 1, 1, 1,
-0.9508984, 0.2691016, -3.321896, 1, 1, 1, 1, 1,
-0.9346358, -0.807227, -2.261801, 1, 1, 1, 1, 1,
-0.9345345, 1.652659, -0.187056, 1, 1, 1, 1, 1,
-0.9337463, -0.7444285, -2.414346, 1, 1, 1, 1, 1,
-0.9317176, 0.03579776, -0.8241166, 1, 1, 1, 1, 1,
-0.9286764, 0.7327746, -2.222916, 0, 0, 1, 1, 1,
-0.9273189, 0.2662988, -1.386852, 1, 0, 0, 1, 1,
-0.9264913, -0.1704272, -0.7733431, 1, 0, 0, 1, 1,
-0.9255303, -0.3331898, -1.240391, 1, 0, 0, 1, 1,
-0.9246221, 0.4790285, -0.3457031, 1, 0, 0, 1, 1,
-0.9198897, 0.8384842, 0.04358324, 1, 0, 0, 1, 1,
-0.9189665, -2.729272, -1.900334, 0, 0, 0, 1, 1,
-0.9181268, -0.3003819, -3.222671, 0, 0, 0, 1, 1,
-0.9160651, -1.154576, -3.892288, 0, 0, 0, 1, 1,
-0.9158008, 1.110484, -0.794216, 0, 0, 0, 1, 1,
-0.9133787, 0.7061664, -0.7441242, 0, 0, 0, 1, 1,
-0.9122788, 0.4607945, -0.3396809, 0, 0, 0, 1, 1,
-0.911257, -0.6108876, -2.579122, 0, 0, 0, 1, 1,
-0.9062502, 1.640469, -1.549011, 1, 1, 1, 1, 1,
-0.906064, -0.5329872, -2.802748, 1, 1, 1, 1, 1,
-0.9007983, -0.1843416, -2.480779, 1, 1, 1, 1, 1,
-0.8994975, 1.64104, -0.8716347, 1, 1, 1, 1, 1,
-0.8948875, 1.5053, 0.4268771, 1, 1, 1, 1, 1,
-0.8911983, 1.562655, -0.5423371, 1, 1, 1, 1, 1,
-0.8828293, 0.5122895, 0.4852052, 1, 1, 1, 1, 1,
-0.8714498, 0.5586834, -2.502454, 1, 1, 1, 1, 1,
-0.870186, -1.223606, -1.532453, 1, 1, 1, 1, 1,
-0.8695545, 0.5322897, -1.346802, 1, 1, 1, 1, 1,
-0.8623345, -1.177043, -3.234006, 1, 1, 1, 1, 1,
-0.8587079, 0.2203089, -1.215904, 1, 1, 1, 1, 1,
-0.8511208, -1.027822, -1.510282, 1, 1, 1, 1, 1,
-0.8474706, 0.3931025, -1.334848, 1, 1, 1, 1, 1,
-0.8448236, 0.1132458, -2.234481, 1, 1, 1, 1, 1,
-0.8410689, -1.482607, -3.436932, 0, 0, 1, 1, 1,
-0.8382393, -1.408888, -3.920194, 1, 0, 0, 1, 1,
-0.8323075, -0.9841193, -3.40694, 1, 0, 0, 1, 1,
-0.83152, 0.3032926, -2.866684, 1, 0, 0, 1, 1,
-0.8308598, -1.542865, -2.736885, 1, 0, 0, 1, 1,
-0.8266727, 1.302734, -0.9502088, 1, 0, 0, 1, 1,
-0.8239373, 0.7878248, -1.44937, 0, 0, 0, 1, 1,
-0.819959, 0.01050569, -2.085136, 0, 0, 0, 1, 1,
-0.8124452, 0.2651775, -1.969056, 0, 0, 0, 1, 1,
-0.8038249, 0.4901816, -2.08207, 0, 0, 0, 1, 1,
-0.8001834, 0.5490501, -1.70087, 0, 0, 0, 1, 1,
-0.7903115, -0.4560664, -1.661348, 0, 0, 0, 1, 1,
-0.7857034, -0.1410651, 0.305538, 0, 0, 0, 1, 1,
-0.7777763, -0.1180543, 0.2867302, 1, 1, 1, 1, 1,
-0.7769183, 0.8036757, -0.5321721, 1, 1, 1, 1, 1,
-0.7764922, -1.217711, -3.582285, 1, 1, 1, 1, 1,
-0.7724971, 1.53378, -0.9164074, 1, 1, 1, 1, 1,
-0.7686692, -0.4863666, -1.846519, 1, 1, 1, 1, 1,
-0.7655624, -0.5519763, -0.9356228, 1, 1, 1, 1, 1,
-0.7632518, -0.8620877, -3.877301, 1, 1, 1, 1, 1,
-0.7623404, 0.5063903, -2.100146, 1, 1, 1, 1, 1,
-0.7464191, -1.39922, -1.791139, 1, 1, 1, 1, 1,
-0.7457829, 1.471068, 0.07007109, 1, 1, 1, 1, 1,
-0.7442427, -0.105873, -2.977249, 1, 1, 1, 1, 1,
-0.7352241, -0.5445181, -3.399241, 1, 1, 1, 1, 1,
-0.7350227, 0.2739475, -0.4949794, 1, 1, 1, 1, 1,
-0.7326161, 0.6371137, 0.1953538, 1, 1, 1, 1, 1,
-0.7302576, -0.1654502, -2.399976, 1, 1, 1, 1, 1,
-0.7300497, -0.8505538, -3.991686, 0, 0, 1, 1, 1,
-0.7300151, -0.07109777, -1.022656, 1, 0, 0, 1, 1,
-0.7172356, 1.061586, -0.1911116, 1, 0, 0, 1, 1,
-0.7167835, 0.1098835, -4.15364, 1, 0, 0, 1, 1,
-0.7076248, -0.2790605, -1.296072, 1, 0, 0, 1, 1,
-0.7046071, 2.077744, -1.855779, 1, 0, 0, 1, 1,
-0.6958737, -1.082734, -3.285611, 0, 0, 0, 1, 1,
-0.6939237, -1.26244, -3.012701, 0, 0, 0, 1, 1,
-0.6913118, 0.3402899, -2.22634, 0, 0, 0, 1, 1,
-0.6881582, -1.359823, -2.480286, 0, 0, 0, 1, 1,
-0.6873353, 0.4160912, 0.9666187, 0, 0, 0, 1, 1,
-0.6860398, -0.6807802, -2.221393, 0, 0, 0, 1, 1,
-0.6854745, 0.8913054, 0.5181171, 0, 0, 0, 1, 1,
-0.6823586, -0.3706858, -3.310122, 1, 1, 1, 1, 1,
-0.6763483, -0.1027227, -1.198791, 1, 1, 1, 1, 1,
-0.6692542, 0.7703666, -1.109785, 1, 1, 1, 1, 1,
-0.6684278, -1.160477, -3.023809, 1, 1, 1, 1, 1,
-0.6647443, 0.5034538, -1.416297, 1, 1, 1, 1, 1,
-0.6620333, 0.6339903, -1.324793, 1, 1, 1, 1, 1,
-0.6616007, 1.242559, -0.8582643, 1, 1, 1, 1, 1,
-0.6615322, 0.4634922, 0.4144924, 1, 1, 1, 1, 1,
-0.6591904, 1.212301, -1.161801, 1, 1, 1, 1, 1,
-0.6580546, -1.781264, -2.721476, 1, 1, 1, 1, 1,
-0.6534405, -0.7064092, -2.734545, 1, 1, 1, 1, 1,
-0.6526769, -0.07683569, -1.096243, 1, 1, 1, 1, 1,
-0.6492383, -1.438203, -1.808047, 1, 1, 1, 1, 1,
-0.6484806, 2.52775, -0.4810832, 1, 1, 1, 1, 1,
-0.6482567, -1.960211, -3.252181, 1, 1, 1, 1, 1,
-0.6459463, 1.051857, 1.120646, 0, 0, 1, 1, 1,
-0.6405667, -1.351318, -1.071635, 1, 0, 0, 1, 1,
-0.6403681, 0.1029536, -0.3257443, 1, 0, 0, 1, 1,
-0.6373342, -1.246438, -2.660814, 1, 0, 0, 1, 1,
-0.636542, -1.802671, -3.248172, 1, 0, 0, 1, 1,
-0.6324728, -1.105189, -2.327231, 1, 0, 0, 1, 1,
-0.6300967, 0.8468071, 0.6255034, 0, 0, 0, 1, 1,
-0.6250036, 0.820677, -2.140136, 0, 0, 0, 1, 1,
-0.622532, -1.092367, -3.934997, 0, 0, 0, 1, 1,
-0.6183213, -1.025156, -2.03051, 0, 0, 0, 1, 1,
-0.6181542, -0.3307323, -0.6120723, 0, 0, 0, 1, 1,
-0.6111526, -0.4052585, -1.222453, 0, 0, 0, 1, 1,
-0.6089574, 1.171786, -0.1039902, 0, 0, 0, 1, 1,
-0.6080897, 0.07663333, -1.763762, 1, 1, 1, 1, 1,
-0.6054427, -0.8955417, -2.742602, 1, 1, 1, 1, 1,
-0.6052432, 0.638966, -1.107767, 1, 1, 1, 1, 1,
-0.6040773, -1.334625, -4.051258, 1, 1, 1, 1, 1,
-0.6035339, 1.634214, -1.050295, 1, 1, 1, 1, 1,
-0.6029534, -1.164626, -3.796173, 1, 1, 1, 1, 1,
-0.5990866, 0.4418416, -1.178098, 1, 1, 1, 1, 1,
-0.5945923, 1.864348, -0.1527463, 1, 1, 1, 1, 1,
-0.5937256, 1.876678, 0.6350715, 1, 1, 1, 1, 1,
-0.593487, -0.695087, -1.882303, 1, 1, 1, 1, 1,
-0.5906426, 1.268311, -0.01649204, 1, 1, 1, 1, 1,
-0.588923, -3.097172, -2.678971, 1, 1, 1, 1, 1,
-0.5800411, -0.08233706, -2.454236, 1, 1, 1, 1, 1,
-0.576717, 0.3688532, -1.805593, 1, 1, 1, 1, 1,
-0.5765826, 0.721502, -1.042275, 1, 1, 1, 1, 1,
-0.5716836, -0.7236388, -3.000609, 0, 0, 1, 1, 1,
-0.5633448, -0.8783083, -1.493351, 1, 0, 0, 1, 1,
-0.5591613, -2.48569, -1.364824, 1, 0, 0, 1, 1,
-0.5568448, -0.6556231, -3.661992, 1, 0, 0, 1, 1,
-0.5510135, -1.0366, -3.929863, 1, 0, 0, 1, 1,
-0.5491236, 0.09826992, -2.028387, 1, 0, 0, 1, 1,
-0.5468966, 0.3319624, -0.4765575, 0, 0, 0, 1, 1,
-0.5468171, -0.1748373, -2.275173, 0, 0, 0, 1, 1,
-0.5460529, -0.2017319, -3.536103, 0, 0, 0, 1, 1,
-0.5451961, 0.4640883, -1.020124, 0, 0, 0, 1, 1,
-0.5441968, -0.2752658, -1.438245, 0, 0, 0, 1, 1,
-0.5402067, 0.2499679, -2.590998, 0, 0, 0, 1, 1,
-0.5333998, 0.220628, -0.5760095, 0, 0, 0, 1, 1,
-0.5308135, 0.6232825, -0.1135629, 1, 1, 1, 1, 1,
-0.5282276, 0.1106315, -0.8965355, 1, 1, 1, 1, 1,
-0.5236226, -0.08046093, -1.276982, 1, 1, 1, 1, 1,
-0.5202405, 0.5429462, -1.037792, 1, 1, 1, 1, 1,
-0.5177859, -0.4132464, -0.3891973, 1, 1, 1, 1, 1,
-0.5115967, 1.635399, 0.5329319, 1, 1, 1, 1, 1,
-0.5107432, 1.011118, -2.700162, 1, 1, 1, 1, 1,
-0.500305, 1.427371, -1.485797, 1, 1, 1, 1, 1,
-0.499894, -0.1174105, -1.6211, 1, 1, 1, 1, 1,
-0.4970892, -0.2265285, -1.583068, 1, 1, 1, 1, 1,
-0.4969573, 0.7888792, -0.3392673, 1, 1, 1, 1, 1,
-0.4956149, -0.6356536, -3.803546, 1, 1, 1, 1, 1,
-0.4930218, 0.7326698, -1.360507, 1, 1, 1, 1, 1,
-0.4911631, 0.1673564, -1.850884, 1, 1, 1, 1, 1,
-0.4893334, 0.3017167, -0.8638586, 1, 1, 1, 1, 1,
-0.4885764, -0.08892627, -2.272386, 0, 0, 1, 1, 1,
-0.4870657, 0.5796347, -1.076476, 1, 0, 0, 1, 1,
-0.4870261, -0.07189325, -0.5601027, 1, 0, 0, 1, 1,
-0.4817204, 0.5001847, -2.406209, 1, 0, 0, 1, 1,
-0.4816373, 0.3835321, -1.87054, 1, 0, 0, 1, 1,
-0.481117, 0.1538727, -3.461013, 1, 0, 0, 1, 1,
-0.474517, 1.661949, -0.6198667, 0, 0, 0, 1, 1,
-0.4736235, -0.7397264, -2.635674, 0, 0, 0, 1, 1,
-0.4678999, -0.8226684, -1.987116, 0, 0, 0, 1, 1,
-0.4654996, 1.146372, -0.0269086, 0, 0, 0, 1, 1,
-0.4615959, -1.715079, -4.273056, 0, 0, 0, 1, 1,
-0.4597251, -0.3595686, -3.103382, 0, 0, 0, 1, 1,
-0.4521038, -1.852115, -2.604112, 0, 0, 0, 1, 1,
-0.4509929, -0.0418624, -3.595072, 1, 1, 1, 1, 1,
-0.4489039, 0.4287997, -1.48276, 1, 1, 1, 1, 1,
-0.4479269, -0.1709293, -1.452932, 1, 1, 1, 1, 1,
-0.4456158, 1.138137, 0.6474565, 1, 1, 1, 1, 1,
-0.4453588, -0.6076397, -1.414739, 1, 1, 1, 1, 1,
-0.439844, -0.170994, -2.677222, 1, 1, 1, 1, 1,
-0.4387477, -0.7730302, -3.806344, 1, 1, 1, 1, 1,
-0.432621, 0.3798422, -0.6222361, 1, 1, 1, 1, 1,
-0.431023, -0.387273, -1.861695, 1, 1, 1, 1, 1,
-0.4284407, 1.704325, -0.8640287, 1, 1, 1, 1, 1,
-0.4274154, -0.2017935, -2.08791, 1, 1, 1, 1, 1,
-0.4255207, -0.1705739, -2.863518, 1, 1, 1, 1, 1,
-0.418445, 0.4743367, -0.5772401, 1, 1, 1, 1, 1,
-0.4156293, 0.7731308, -1.270972, 1, 1, 1, 1, 1,
-0.4141662, 0.9998001, 1.175273, 1, 1, 1, 1, 1,
-0.4035694, -0.794983, -3.695706, 0, 0, 1, 1, 1,
-0.4019632, -0.2656916, -3.231863, 1, 0, 0, 1, 1,
-0.3932567, 1.307528, -0.6108399, 1, 0, 0, 1, 1,
-0.3910242, -0.2969375, -3.068623, 1, 0, 0, 1, 1,
-0.3888429, 1.23632, -0.3122105, 1, 0, 0, 1, 1,
-0.3848506, 0.5608086, -2.111956, 1, 0, 0, 1, 1,
-0.3832572, 0.8978972, -3.407718, 0, 0, 0, 1, 1,
-0.3796389, 0.9268303, -0.8871416, 0, 0, 0, 1, 1,
-0.3758582, 1.063287, -0.8934574, 0, 0, 0, 1, 1,
-0.3741369, -0.9406519, -3.645297, 0, 0, 0, 1, 1,
-0.3719186, 0.3584464, -0.5472428, 0, 0, 0, 1, 1,
-0.3703143, 0.3610047, 1.542211, 0, 0, 0, 1, 1,
-0.3682355, -0.07797658, -3.469724, 0, 0, 0, 1, 1,
-0.3574596, 0.7263764, 1.024155, 1, 1, 1, 1, 1,
-0.3558538, 0.0340278, 0.05269527, 1, 1, 1, 1, 1,
-0.3536113, 1.556112, -2.224181, 1, 1, 1, 1, 1,
-0.3515769, 0.05363391, -2.614587, 1, 1, 1, 1, 1,
-0.3493139, 0.5813355, -0.9181783, 1, 1, 1, 1, 1,
-0.3431604, -1.218992, -1.994244, 1, 1, 1, 1, 1,
-0.3332384, 0.9419174, -0.8410528, 1, 1, 1, 1, 1,
-0.3324895, 1.393389, 0.4843809, 1, 1, 1, 1, 1,
-0.3311285, 1.522341, 0.8922324, 1, 1, 1, 1, 1,
-0.329717, -0.7654419, -0.7709084, 1, 1, 1, 1, 1,
-0.3254056, 1.095755, -1.369129, 1, 1, 1, 1, 1,
-0.3202573, -0.20437, -2.503114, 1, 1, 1, 1, 1,
-0.3108919, -0.9354962, -2.132229, 1, 1, 1, 1, 1,
-0.3103261, -0.8080234, -1.465338, 1, 1, 1, 1, 1,
-0.3091383, 0.248887, -2.664301, 1, 1, 1, 1, 1,
-0.3078903, -1.197782, -2.074537, 0, 0, 1, 1, 1,
-0.3073052, 0.7503409, 0.4184155, 1, 0, 0, 1, 1,
-0.3051154, 0.544606, -0.7029191, 1, 0, 0, 1, 1,
-0.3046857, -0.3091584, -5.506839, 1, 0, 0, 1, 1,
-0.2998975, 1.083346, -0.07703893, 1, 0, 0, 1, 1,
-0.2966249, 1.275301, -0.2944384, 1, 0, 0, 1, 1,
-0.2929329, 1.034994, -0.3470444, 0, 0, 0, 1, 1,
-0.2893005, 0.5082317, -0.7956126, 0, 0, 0, 1, 1,
-0.2891424, -1.072958, -2.395033, 0, 0, 0, 1, 1,
-0.2870002, 0.06606615, -1.062887, 0, 0, 0, 1, 1,
-0.2842652, 0.5829679, -1.379272, 0, 0, 0, 1, 1,
-0.2838233, 0.9021898, -0.02343151, 0, 0, 0, 1, 1,
-0.2790538, 0.2225142, -0.628506, 0, 0, 0, 1, 1,
-0.276917, 0.2572919, 0.01784267, 1, 1, 1, 1, 1,
-0.2718801, 1.596816, 1.701906, 1, 1, 1, 1, 1,
-0.2713423, 0.6084585, -0.659243, 1, 1, 1, 1, 1,
-0.26473, 0.4017758, -1.462847, 1, 1, 1, 1, 1,
-0.262691, -2.341279, -3.951747, 1, 1, 1, 1, 1,
-0.2625301, -0.948012, -2.868071, 1, 1, 1, 1, 1,
-0.2599966, 0.2641815, -2.795893, 1, 1, 1, 1, 1,
-0.2575511, 0.2426791, -1.547739, 1, 1, 1, 1, 1,
-0.2545414, -0.6207007, -2.193744, 1, 1, 1, 1, 1,
-0.2472347, -0.5777531, -2.519734, 1, 1, 1, 1, 1,
-0.2438655, 2.142992, -0.4373385, 1, 1, 1, 1, 1,
-0.242921, 0.1876781, -1.190866, 1, 1, 1, 1, 1,
-0.2427234, 1.944494, -2.936404, 1, 1, 1, 1, 1,
-0.2419273, -0.4786114, -2.759031, 1, 1, 1, 1, 1,
-0.2407283, -1.133038, -4.285054, 1, 1, 1, 1, 1,
-0.2385811, -0.1820024, -2.861298, 0, 0, 1, 1, 1,
-0.237865, 0.2470528, 0.6765298, 1, 0, 0, 1, 1,
-0.2337394, -0.07107281, -2.126149, 1, 0, 0, 1, 1,
-0.2298535, -1.081968, -2.5492, 1, 0, 0, 1, 1,
-0.2298114, 0.2951252, 0.09339309, 1, 0, 0, 1, 1,
-0.2252097, -0.1269298, -4.757169, 1, 0, 0, 1, 1,
-0.2215814, -0.3175033, -2.124668, 0, 0, 0, 1, 1,
-0.2179843, 1.493338, 0.002986691, 0, 0, 0, 1, 1,
-0.2152783, -0.3532624, -2.335462, 0, 0, 0, 1, 1,
-0.2139121, 0.5240857, -0.735161, 0, 0, 0, 1, 1,
-0.2131041, -1.467445, -1.486883, 0, 0, 0, 1, 1,
-0.2116295, -0.3199045, -1.968724, 0, 0, 0, 1, 1,
-0.2106633, 2.015152, 0.5712051, 0, 0, 0, 1, 1,
-0.2021986, 1.235623, 0.7140778, 1, 1, 1, 1, 1,
-0.1915905, -1.213282, -1.328557, 1, 1, 1, 1, 1,
-0.1897283, 0.6352761, 0.3854847, 1, 1, 1, 1, 1,
-0.1854381, -1.373519, -4.254137, 1, 1, 1, 1, 1,
-0.1839034, 0.4471497, -0.2035324, 1, 1, 1, 1, 1,
-0.1836776, 2.39711, -1.277297, 1, 1, 1, 1, 1,
-0.183676, 0.9585554, -1.215785, 1, 1, 1, 1, 1,
-0.1826493, 1.685417, -0.1154838, 1, 1, 1, 1, 1,
-0.1807943, -0.6882363, -1.413564, 1, 1, 1, 1, 1,
-0.1785679, -1.181527, -1.230993, 1, 1, 1, 1, 1,
-0.1766253, 0.525171, 0.6563038, 1, 1, 1, 1, 1,
-0.1759001, 0.7714067, 0.0744151, 1, 1, 1, 1, 1,
-0.1742678, 1.53463, 1.44444, 1, 1, 1, 1, 1,
-0.1715341, -0.4964901, -3.102955, 1, 1, 1, 1, 1,
-0.1692294, 0.1597535, -2.747452, 1, 1, 1, 1, 1,
-0.1680254, -0.02640502, -2.170826, 0, 0, 1, 1, 1,
-0.1666782, -1.231315, -1.828439, 1, 0, 0, 1, 1,
-0.1666112, -0.6918774, -2.785549, 1, 0, 0, 1, 1,
-0.166391, -0.2378366, -3.018909, 1, 0, 0, 1, 1,
-0.1585146, -1.033089, -4.189891, 1, 0, 0, 1, 1,
-0.1584639, -0.03233625, -2.364955, 1, 0, 0, 1, 1,
-0.1557516, -1.716893, -4.34709, 0, 0, 0, 1, 1,
-0.1497093, -1.664101, -1.105924, 0, 0, 0, 1, 1,
-0.1494878, -0.4664071, -3.086042, 0, 0, 0, 1, 1,
-0.1484743, -0.8145992, -3.346959, 0, 0, 0, 1, 1,
-0.1437284, 1.311528, 1.082582, 0, 0, 0, 1, 1,
-0.143241, 0.869147, -1.049289, 0, 0, 0, 1, 1,
-0.1378715, -1.646213, -3.365759, 0, 0, 0, 1, 1,
-0.1323985, 0.5114506, 1.726653, 1, 1, 1, 1, 1,
-0.1319321, 1.353006, 0.3433956, 1, 1, 1, 1, 1,
-0.1284145, -1.756717, -3.058784, 1, 1, 1, 1, 1,
-0.121882, -0.9514251, -4.100466, 1, 1, 1, 1, 1,
-0.1188841, 2.511299, 0.5773187, 1, 1, 1, 1, 1,
-0.1174462, 1.04652, 0.1194732, 1, 1, 1, 1, 1,
-0.1142971, -1.199137, -2.077609, 1, 1, 1, 1, 1,
-0.1083691, 1.054787, -1.355258, 1, 1, 1, 1, 1,
-0.1022475, 0.48874, 0.1201232, 1, 1, 1, 1, 1,
-0.09812629, 0.4760818, -1.267281, 1, 1, 1, 1, 1,
-0.09179606, -1.605092, -2.646945, 1, 1, 1, 1, 1,
-0.09034854, -0.5091808, -4.061278, 1, 1, 1, 1, 1,
-0.08783029, -0.3654318, -3.007675, 1, 1, 1, 1, 1,
-0.0871598, -0.4161884, -1.364576, 1, 1, 1, 1, 1,
-0.08509111, 0.5471768, -1.197634, 1, 1, 1, 1, 1,
-0.07836123, 1.353868, 0.4097985, 0, 0, 1, 1, 1,
-0.07564652, 0.6055647, -0.3430601, 1, 0, 0, 1, 1,
-0.07317876, -0.6525134, -2.096317, 1, 0, 0, 1, 1,
-0.07016043, 1.291643, -0.3088673, 1, 0, 0, 1, 1,
-0.06707879, 0.09877279, -0.5637902, 1, 0, 0, 1, 1,
-0.06337965, -0.6237844, -2.705192, 1, 0, 0, 1, 1,
-0.06152497, -0.4524755, -3.763999, 0, 0, 0, 1, 1,
-0.05837169, 0.3742689, 0.6336271, 0, 0, 0, 1, 1,
-0.05650443, -0.2607097, -3.604784, 0, 0, 0, 1, 1,
-0.05428424, 0.4254263, -1.112803, 0, 0, 0, 1, 1,
-0.05167144, 0.02092555, -1.527855, 0, 0, 0, 1, 1,
-0.04994323, -0.596888, -4.662529, 0, 0, 0, 1, 1,
-0.04397388, 0.8443909, 0.2470691, 0, 0, 0, 1, 1,
-0.03876518, -0.3373318, -3.299296, 1, 1, 1, 1, 1,
-0.03816637, -0.6881194, -3.317625, 1, 1, 1, 1, 1,
-0.03754822, -0.6090439, -4.452249, 1, 1, 1, 1, 1,
-0.03682487, 0.722445, 0.1749016, 1, 1, 1, 1, 1,
-0.03399919, -0.2335596, -1.36576, 1, 1, 1, 1, 1,
-0.0303793, -0.4799971, -3.218661, 1, 1, 1, 1, 1,
-0.02750518, 0.009109343, 0.06699257, 1, 1, 1, 1, 1,
-0.02681589, 0.00614439, -0.642502, 1, 1, 1, 1, 1,
-0.02124641, -0.7498978, -3.408168, 1, 1, 1, 1, 1,
-0.01375268, -1.009959, -3.225887, 1, 1, 1, 1, 1,
-0.01362441, 0.1365318, 1.804193, 1, 1, 1, 1, 1,
-0.01258622, -1.558372, -3.36869, 1, 1, 1, 1, 1,
-0.01145318, 0.03555281, -2.203798, 1, 1, 1, 1, 1,
-0.007154444, 0.3791923, -1.260893, 1, 1, 1, 1, 1,
-0.003557966, 0.3944347, -1.203084, 1, 1, 1, 1, 1,
-0.003186748, -0.4337908, -5.319043, 0, 0, 1, 1, 1,
-0.0006610384, 1.03685, 1.784405, 1, 0, 0, 1, 1,
-0.0005218129, 1.274843, 0.3443555, 1, 0, 0, 1, 1,
0.001215045, 0.118569, -0.7974061, 1, 0, 0, 1, 1,
0.003648793, 1.365114, -0.1589738, 1, 0, 0, 1, 1,
0.00383576, -0.2533425, 4.616313, 1, 0, 0, 1, 1,
0.008036547, 0.1519979, -0.007288402, 0, 0, 0, 1, 1,
0.008440412, 0.5783736, -0.4746195, 0, 0, 0, 1, 1,
0.01035881, -0.1648886, 3.922025, 0, 0, 0, 1, 1,
0.01132885, 1.096251, 1.200702, 0, 0, 0, 1, 1,
0.01329004, -0.5470496, 2.860781, 0, 0, 0, 1, 1,
0.01476322, 0.5712236, 0.5953065, 0, 0, 0, 1, 1,
0.01490215, 0.5281099, -1.499245, 0, 0, 0, 1, 1,
0.01560407, -0.4225779, 2.998524, 1, 1, 1, 1, 1,
0.01594866, -0.1670265, 2.808054, 1, 1, 1, 1, 1,
0.01847725, -1.96443, 4.170624, 1, 1, 1, 1, 1,
0.01947097, -0.6549098, 2.47436, 1, 1, 1, 1, 1,
0.01966741, -0.5582747, 2.127977, 1, 1, 1, 1, 1,
0.02334538, 0.486589, -0.3759404, 1, 1, 1, 1, 1,
0.02584366, -0.6218116, 4.354318, 1, 1, 1, 1, 1,
0.02861735, -1.500095, 2.468308, 1, 1, 1, 1, 1,
0.02957357, -0.9560317, 2.086491, 1, 1, 1, 1, 1,
0.03286859, -1.767566, 1.394707, 1, 1, 1, 1, 1,
0.03399026, -0.06589299, 2.20249, 1, 1, 1, 1, 1,
0.04040041, 1.128358, -2.173784, 1, 1, 1, 1, 1,
0.04170841, -0.03968914, 1.018768, 1, 1, 1, 1, 1,
0.04642968, -1.883083, 3.41495, 1, 1, 1, 1, 1,
0.05033479, 0.1964092, -1.374716, 1, 1, 1, 1, 1,
0.05099496, -1.144047, 2.573044, 0, 0, 1, 1, 1,
0.05131896, 0.06712384, 1.105638, 1, 0, 0, 1, 1,
0.05275929, -1.405282, 3.344522, 1, 0, 0, 1, 1,
0.05298274, 1.587649, -0.3832577, 1, 0, 0, 1, 1,
0.0564779, 0.846912, -0.7771932, 1, 0, 0, 1, 1,
0.05858598, 0.5391603, 0.5413921, 1, 0, 0, 1, 1,
0.05934013, -0.9125675, 4.084356, 0, 0, 0, 1, 1,
0.06233304, -1.730039, 2.282024, 0, 0, 0, 1, 1,
0.06782208, 1.501961, -0.642498, 0, 0, 0, 1, 1,
0.07040204, 0.4621269, -0.6062531, 0, 0, 0, 1, 1,
0.07329628, 0.5165885, -1.190927, 0, 0, 0, 1, 1,
0.07349101, 0.4066858, -2.12374, 0, 0, 0, 1, 1,
0.07799656, 0.6241189, 1.589402, 0, 0, 0, 1, 1,
0.08043235, 1.654668, -0.9794418, 1, 1, 1, 1, 1,
0.08048326, 0.404145, 0.4615335, 1, 1, 1, 1, 1,
0.08200505, -0.1548415, 2.349122, 1, 1, 1, 1, 1,
0.08251546, -0.0975344, 3.426221, 1, 1, 1, 1, 1,
0.08309606, 0.06309927, 1.700204, 1, 1, 1, 1, 1,
0.08335335, -0.9760476, 3.322661, 1, 1, 1, 1, 1,
0.08644255, -1.194746, 3.498368, 1, 1, 1, 1, 1,
0.08699234, -0.08676293, 2.07074, 1, 1, 1, 1, 1,
0.08769851, 0.6452763, -0.4272949, 1, 1, 1, 1, 1,
0.08775407, 1.054039, -0.09556778, 1, 1, 1, 1, 1,
0.08865874, -0.6608284, 2.710286, 1, 1, 1, 1, 1,
0.08898476, -0.3808478, 1.83613, 1, 1, 1, 1, 1,
0.0997215, -0.4897538, 3.386762, 1, 1, 1, 1, 1,
0.1017694, 0.8963107, -2.469345, 1, 1, 1, 1, 1,
0.1025512, -0.1892679, 5.384214, 1, 1, 1, 1, 1,
0.1044394, -0.04278023, -0.2418726, 0, 0, 1, 1, 1,
0.1093495, 0.251476, -0.3533964, 1, 0, 0, 1, 1,
0.1106648, -1.505751, 2.299568, 1, 0, 0, 1, 1,
0.1200457, -0.9398759, 4.155797, 1, 0, 0, 1, 1,
0.1204364, -1.065355, 1.856197, 1, 0, 0, 1, 1,
0.1312915, 0.2343695, -0.4376369, 1, 0, 0, 1, 1,
0.1324183, -1.226747, 4.244534, 0, 0, 0, 1, 1,
0.133334, 1.118503, 0.6965179, 0, 0, 0, 1, 1,
0.1386672, 0.407192, 0.04365889, 0, 0, 0, 1, 1,
0.1398659, 0.8481112, 1.309118, 0, 0, 0, 1, 1,
0.1416855, 0.5785457, 1.268012, 0, 0, 0, 1, 1,
0.1453082, -0.06070985, 0.1251411, 0, 0, 0, 1, 1,
0.1463769, -0.6253417, 3.349482, 0, 0, 0, 1, 1,
0.1474447, -0.6794967, 4.077775, 1, 1, 1, 1, 1,
0.1483834, -1.154182, 2.22869, 1, 1, 1, 1, 1,
0.1494139, -1.671829, 3.167701, 1, 1, 1, 1, 1,
0.1499415, -0.858183, 3.091144, 1, 1, 1, 1, 1,
0.1509282, 1.333976, 1.243892, 1, 1, 1, 1, 1,
0.154648, -0.2990355, 0.9398265, 1, 1, 1, 1, 1,
0.1615184, 0.4587302, -0.4633354, 1, 1, 1, 1, 1,
0.1632505, 0.5244817, 1.429476, 1, 1, 1, 1, 1,
0.1640482, 0.7660217, 0.6360286, 1, 1, 1, 1, 1,
0.1741955, 0.06849542, -0.7353032, 1, 1, 1, 1, 1,
0.1751592, 0.8197318, 1.504633, 1, 1, 1, 1, 1,
0.1756734, 0.4750105, 0.8356752, 1, 1, 1, 1, 1,
0.1759327, -0.9597237, 2.768871, 1, 1, 1, 1, 1,
0.1846165, -0.3681155, 2.690434, 1, 1, 1, 1, 1,
0.1880706, -0.09978712, 2.391118, 1, 1, 1, 1, 1,
0.1956235, 1.232839, 1.388128, 0, 0, 1, 1, 1,
0.1959594, -0.7442904, 1.922565, 1, 0, 0, 1, 1,
0.1988902, -0.2457255, 3.752318, 1, 0, 0, 1, 1,
0.2129898, -1.741889, 4.437057, 1, 0, 0, 1, 1,
0.2193904, 0.1847575, 0.8771002, 1, 0, 0, 1, 1,
0.2295782, 0.4041083, 0.3718016, 1, 0, 0, 1, 1,
0.2373276, -0.7205669, 3.79646, 0, 0, 0, 1, 1,
0.238037, 0.1903612, 0.6605462, 0, 0, 0, 1, 1,
0.2395159, -0.135899, 1.732983, 0, 0, 0, 1, 1,
0.2401752, -0.2664031, 2.763701, 0, 0, 0, 1, 1,
0.2414335, 2.810324, -1.60584, 0, 0, 0, 1, 1,
0.2609752, 1.434188, 0.4892742, 0, 0, 0, 1, 1,
0.2704658, 1.707001, -0.8538701, 0, 0, 0, 1, 1,
0.2715575, 0.7965447, 2.274079, 1, 1, 1, 1, 1,
0.2740318, 0.9184983, -1.037406, 1, 1, 1, 1, 1,
0.2748947, -0.3230467, 0.5418372, 1, 1, 1, 1, 1,
0.2752669, 0.1457075, 2.618155, 1, 1, 1, 1, 1,
0.2766659, -1.044662, 1.567892, 1, 1, 1, 1, 1,
0.2787774, 0.1783254, 0.8289698, 1, 1, 1, 1, 1,
0.2809468, 0.8809675, -0.7048188, 1, 1, 1, 1, 1,
0.2832409, 0.7136267, 1.789519, 1, 1, 1, 1, 1,
0.2838759, 1.705025, -0.1506189, 1, 1, 1, 1, 1,
0.2872374, 0.4788135, 1.506306, 1, 1, 1, 1, 1,
0.2909098, -0.7375396, 3.272797, 1, 1, 1, 1, 1,
0.2911991, -1.204108, 3.831181, 1, 1, 1, 1, 1,
0.294257, -0.0438836, 1.965519, 1, 1, 1, 1, 1,
0.2947152, 1.532612, 0.4217893, 1, 1, 1, 1, 1,
0.3004096, 0.4515094, 0.6084799, 1, 1, 1, 1, 1,
0.3014327, 1.671533, -0.4822893, 0, 0, 1, 1, 1,
0.3019589, 1.308226, 0.6739966, 1, 0, 0, 1, 1,
0.3029391, -0.7548965, 1.418771, 1, 0, 0, 1, 1,
0.3068161, -1.02405, 3.729232, 1, 0, 0, 1, 1,
0.3089857, 1.215081, -1.354866, 1, 0, 0, 1, 1,
0.3092752, -0.3722188, 2.579801, 1, 0, 0, 1, 1,
0.3098894, -1.194804, 2.189851, 0, 0, 0, 1, 1,
0.3127139, -0.4952892, 3.044945, 0, 0, 0, 1, 1,
0.3169804, 0.4466412, 1.146205, 0, 0, 0, 1, 1,
0.3270822, -0.4244787, 2.821475, 0, 0, 0, 1, 1,
0.328227, -0.6676632, 2.537268, 0, 0, 0, 1, 1,
0.33875, 0.7966837, 0.02410339, 0, 0, 0, 1, 1,
0.3397416, 0.1790668, -0.1040529, 0, 0, 0, 1, 1,
0.3399554, 0.03862141, 3.030405, 1, 1, 1, 1, 1,
0.3414733, 0.6230575, 1.346097, 1, 1, 1, 1, 1,
0.343825, 1.478496, 0.4743986, 1, 1, 1, 1, 1,
0.3457274, -0.4626269, 3.76897, 1, 1, 1, 1, 1,
0.3507003, -0.3784023, 2.322924, 1, 1, 1, 1, 1,
0.356081, 1.281959, 1.820903, 1, 1, 1, 1, 1,
0.3599373, 1.864964, 0.6461662, 1, 1, 1, 1, 1,
0.3630687, -0.9818127, 4.519089, 1, 1, 1, 1, 1,
0.3649572, -0.9664825, 2.944289, 1, 1, 1, 1, 1,
0.3749954, 0.3173687, 2.45451, 1, 1, 1, 1, 1,
0.3814256, 0.9888059, 0.23644, 1, 1, 1, 1, 1,
0.3857328, 1.626719, -1.044782, 1, 1, 1, 1, 1,
0.3888048, -0.8847171, 3.514248, 1, 1, 1, 1, 1,
0.3917871, 1.029257, 0.1506904, 1, 1, 1, 1, 1,
0.3994424, 0.4649217, 1.373175, 1, 1, 1, 1, 1,
0.4015946, -0.3793546, 1.017567, 0, 0, 1, 1, 1,
0.4018606, 0.6735865, 2.339047, 1, 0, 0, 1, 1,
0.4025804, 1.25947, 0.02415089, 1, 0, 0, 1, 1,
0.4042084, -0.9238822, 1.901875, 1, 0, 0, 1, 1,
0.4084499, 0.03071712, 1.812069, 1, 0, 0, 1, 1,
0.4088004, -1.836348, 2.871177, 1, 0, 0, 1, 1,
0.4107193, -0.848489, 3.660488, 0, 0, 0, 1, 1,
0.4135252, -0.2578624, 2.174721, 0, 0, 0, 1, 1,
0.4152437, 1.668221, -0.6910125, 0, 0, 0, 1, 1,
0.42009, -1.285289, 2.801509, 0, 0, 0, 1, 1,
0.4221196, 1.047524, -1.812825, 0, 0, 0, 1, 1,
0.4303531, -0.002670962, 1.99646, 0, 0, 0, 1, 1,
0.4369569, 0.6017331, -0.5381814, 0, 0, 0, 1, 1,
0.4408704, 2.291, 0.896085, 1, 1, 1, 1, 1,
0.4491239, 1.558079, -0.7271537, 1, 1, 1, 1, 1,
0.449308, 0.3071577, 1.934404, 1, 1, 1, 1, 1,
0.4496396, -0.3193241, 1.929364, 1, 1, 1, 1, 1,
0.4503684, 0.3937473, 2.62729, 1, 1, 1, 1, 1,
0.4586203, -0.4514467, 3.183205, 1, 1, 1, 1, 1,
0.4662323, 1.80241, 0.6373203, 1, 1, 1, 1, 1,
0.4694407, -1.078121, 1.35467, 1, 1, 1, 1, 1,
0.4710937, -0.09377483, 2.303127, 1, 1, 1, 1, 1,
0.4757882, -1.167291, 2.312927, 1, 1, 1, 1, 1,
0.4777279, -0.4638845, 1.612075, 1, 1, 1, 1, 1,
0.4794823, -0.5819623, 2.830638, 1, 1, 1, 1, 1,
0.4828453, 0.1086051, 3.406333, 1, 1, 1, 1, 1,
0.4859826, -1.035963, 1.916865, 1, 1, 1, 1, 1,
0.4861251, 0.8539891, -2.370293, 1, 1, 1, 1, 1,
0.4863485, 2.221693, -0.8990726, 0, 0, 1, 1, 1,
0.4865429, -2.071792, 3.470582, 1, 0, 0, 1, 1,
0.4890517, 1.089417, 0.5319101, 1, 0, 0, 1, 1,
0.4898202, 0.817505, 0.5232866, 1, 0, 0, 1, 1,
0.4928508, -0.6811777, 2.179317, 1, 0, 0, 1, 1,
0.4948125, 0.5133896, 1.819936, 1, 0, 0, 1, 1,
0.5007048, 1.518927, 0.8402372, 0, 0, 0, 1, 1,
0.5072914, 0.2862282, 1.68193, 0, 0, 0, 1, 1,
0.5087513, -0.5733297, 1.888995, 0, 0, 0, 1, 1,
0.5151207, -0.2666914, 2.471382, 0, 0, 0, 1, 1,
0.518208, -0.7441112, 3.139892, 0, 0, 0, 1, 1,
0.5211296, -1.258215, 1.609957, 0, 0, 0, 1, 1,
0.5213879, 0.341089, 1.419339, 0, 0, 0, 1, 1,
0.521508, 2.308426, -1.493756, 1, 1, 1, 1, 1,
0.5268295, 0.2748621, 2.051772, 1, 1, 1, 1, 1,
0.530937, 1.068497, -1.580113, 1, 1, 1, 1, 1,
0.5346429, 2.024926, -0.2998711, 1, 1, 1, 1, 1,
0.5377289, 1.576694, 0.6592713, 1, 1, 1, 1, 1,
0.5428309, 0.4657744, 0.8905666, 1, 1, 1, 1, 1,
0.553124, 1.05384, -0.4102908, 1, 1, 1, 1, 1,
0.5536811, -0.0385878, 1.455113, 1, 1, 1, 1, 1,
0.5540861, 0.3967061, 1.389596, 1, 1, 1, 1, 1,
0.5549355, -0.6730493, 0.7321468, 1, 1, 1, 1, 1,
0.5553326, -0.4371748, 1.74881, 1, 1, 1, 1, 1,
0.5626811, 1.502285, -0.4314508, 1, 1, 1, 1, 1,
0.5660266, 0.3758496, 0.4177207, 1, 1, 1, 1, 1,
0.5747746, 0.7847528, -0.4580395, 1, 1, 1, 1, 1,
0.5795126, -0.5624645, 3.746979, 1, 1, 1, 1, 1,
0.5795338, 0.02247648, 2.306831, 0, 0, 1, 1, 1,
0.5799191, -0.8045418, 2.243341, 1, 0, 0, 1, 1,
0.5816693, 0.4803244, 2.333545, 1, 0, 0, 1, 1,
0.5832653, 1.869076, -0.2894653, 1, 0, 0, 1, 1,
0.5886229, -1.83828, 3.366895, 1, 0, 0, 1, 1,
0.5917507, 0.5326342, 1.816633, 1, 0, 0, 1, 1,
0.5923212, -0.2793976, 3.567838, 0, 0, 0, 1, 1,
0.5937395, 1.211064, 3.648119, 0, 0, 0, 1, 1,
0.5943831, -0.3257225, 2.245802, 0, 0, 0, 1, 1,
0.5970982, -0.4015435, 3.602564, 0, 0, 0, 1, 1,
0.5981129, -1.501487, 3.488524, 0, 0, 0, 1, 1,
0.5992797, 0.08477643, 3.516178, 0, 0, 0, 1, 1,
0.6005985, 0.5349779, 0.806452, 0, 0, 0, 1, 1,
0.6009189, 2.061772, -0.9459664, 1, 1, 1, 1, 1,
0.6015158, -0.1767795, 2.312448, 1, 1, 1, 1, 1,
0.6049489, 0.3907213, 1.288857, 1, 1, 1, 1, 1,
0.6058968, -0.4095114, 4.296855, 1, 1, 1, 1, 1,
0.6103119, 1.904988, -0.5619822, 1, 1, 1, 1, 1,
0.6163877, -0.946763, -0.2918219, 1, 1, 1, 1, 1,
0.6232429, -0.6342853, 3.5624, 1, 1, 1, 1, 1,
0.6255943, -0.1305574, 1.242172, 1, 1, 1, 1, 1,
0.6259593, 1.308358, 1.515454, 1, 1, 1, 1, 1,
0.6259932, -1.245245, 2.959391, 1, 1, 1, 1, 1,
0.6268641, 1.370832, 2.01265, 1, 1, 1, 1, 1,
0.6279037, 0.02212397, 1.526047, 1, 1, 1, 1, 1,
0.6328948, 0.9289798, -0.533021, 1, 1, 1, 1, 1,
0.6334333, 0.0001538465, 1.475008, 1, 1, 1, 1, 1,
0.6371585, -0.318106, 0.4812999, 1, 1, 1, 1, 1,
0.6382052, -0.2120592, -0.1839873, 0, 0, 1, 1, 1,
0.6387099, -1.518903, 4.437596, 1, 0, 0, 1, 1,
0.640232, 1.451111, -0.9002012, 1, 0, 0, 1, 1,
0.6425416, 0.6147205, 1.045149, 1, 0, 0, 1, 1,
0.6516184, 1.385567, 0.3290026, 1, 0, 0, 1, 1,
0.6524614, 0.5834868, 0.5242394, 1, 0, 0, 1, 1,
0.6527512, 0.3776837, 1.423243, 0, 0, 0, 1, 1,
0.6611918, -0.7618465, 4.153986, 0, 0, 0, 1, 1,
0.6612917, 0.1155642, 1.679605, 0, 0, 0, 1, 1,
0.6618805, 0.2060043, 2.202807, 0, 0, 0, 1, 1,
0.6622022, -0.5999559, 2.333931, 0, 0, 0, 1, 1,
0.6630733, 0.4227243, -0.1729643, 0, 0, 0, 1, 1,
0.6709229, 0.08243097, 2.37344, 0, 0, 0, 1, 1,
0.6738389, 0.4619594, -0.5774246, 1, 1, 1, 1, 1,
0.6789569, -0.5234036, 0.9386198, 1, 1, 1, 1, 1,
0.685499, -0.4263913, 2.950615, 1, 1, 1, 1, 1,
0.6913737, -0.9522015, 2.770578, 1, 1, 1, 1, 1,
0.6969412, -0.7225618, 2.552872, 1, 1, 1, 1, 1,
0.705983, -2.411912, 2.742396, 1, 1, 1, 1, 1,
0.7120457, -0.04857183, 2.109744, 1, 1, 1, 1, 1,
0.7187234, 1.590081, 0.2283703, 1, 1, 1, 1, 1,
0.7194009, -1.122463, 3.100715, 1, 1, 1, 1, 1,
0.7220522, 0.1533085, 1.232202, 1, 1, 1, 1, 1,
0.7230766, -0.723231, 4.702672, 1, 1, 1, 1, 1,
0.7262395, -0.2744506, 1.718437, 1, 1, 1, 1, 1,
0.7296472, -0.2791174, 2.33171, 1, 1, 1, 1, 1,
0.7335771, 0.3772544, 0.01549221, 1, 1, 1, 1, 1,
0.7386601, -2.399182, 3.360371, 1, 1, 1, 1, 1,
0.740327, 1.093118, -0.4344768, 0, 0, 1, 1, 1,
0.7411892, 2.355771, 0.8302199, 1, 0, 0, 1, 1,
0.7443764, 0.5828143, 0.7770026, 1, 0, 0, 1, 1,
0.7467273, -1.067911, 1.835698, 1, 0, 0, 1, 1,
0.7478389, -1.522145, 3.884975, 1, 0, 0, 1, 1,
0.7501354, -1.490976, 2.778499, 1, 0, 0, 1, 1,
0.7541974, -1.119968, 3.062005, 0, 0, 0, 1, 1,
0.757996, 0.795571, -0.4971432, 0, 0, 0, 1, 1,
0.7622162, -0.1338204, 1.935772, 0, 0, 0, 1, 1,
0.7692719, -0.3226359, 1.704299, 0, 0, 0, 1, 1,
0.772005, -1.104521, 2.44618, 0, 0, 0, 1, 1,
0.7720963, 1.248109, 1.840911, 0, 0, 0, 1, 1,
0.7721795, 0.4980419, 2.067869, 0, 0, 0, 1, 1,
0.7762891, 0.730205, 1.694699, 1, 1, 1, 1, 1,
0.777517, -0.6941217, 2.423134, 1, 1, 1, 1, 1,
0.7776074, 0.6865685, 1.294431, 1, 1, 1, 1, 1,
0.7839472, -0.5172166, 2.736836, 1, 1, 1, 1, 1,
0.7843608, 0.1327361, 1.07294, 1, 1, 1, 1, 1,
0.7846502, 0.3416048, 2.453825, 1, 1, 1, 1, 1,
0.7866128, -0.6199421, 2.072959, 1, 1, 1, 1, 1,
0.7870369, 0.9561771, 0.965187, 1, 1, 1, 1, 1,
0.7904509, -1.903819, 3.427259, 1, 1, 1, 1, 1,
0.7908317, -0.9679341, 0.3714735, 1, 1, 1, 1, 1,
0.7981865, 0.3498919, 0.4724872, 1, 1, 1, 1, 1,
0.8037428, 0.4716123, 1.458102, 1, 1, 1, 1, 1,
0.8074797, 0.1097004, 3.904693, 1, 1, 1, 1, 1,
0.810251, 0.8173283, -0.5217391, 1, 1, 1, 1, 1,
0.8158246, -1.100933, 3.221438, 1, 1, 1, 1, 1,
0.8195434, -0.5961837, 2.599082, 0, 0, 1, 1, 1,
0.8295118, -0.7182635, 1.393013, 1, 0, 0, 1, 1,
0.8315139, -0.1299892, 0.7584311, 1, 0, 0, 1, 1,
0.8342577, 0.5224309, 1.345307, 1, 0, 0, 1, 1,
0.8361898, 0.5469319, -0.5201514, 1, 0, 0, 1, 1,
0.8376735, 1.543829, 0.9958726, 1, 0, 0, 1, 1,
0.8382963, -0.6286574, 3.417302, 0, 0, 0, 1, 1,
0.84372, -0.2747771, 0.5159929, 0, 0, 0, 1, 1,
0.8494886, 0.5199461, 1.738407, 0, 0, 0, 1, 1,
0.8543139, 0.1040639, 1.6866, 0, 0, 0, 1, 1,
0.8549551, -0.6703641, 3.442902, 0, 0, 0, 1, 1,
0.8554173, 1.81302, -0.02166929, 0, 0, 0, 1, 1,
0.8587469, -0.3720395, 1.896153, 0, 0, 0, 1, 1,
0.8610425, -0.1102794, 3.960865, 1, 1, 1, 1, 1,
0.8646195, -0.5741114, 1.58139, 1, 1, 1, 1, 1,
0.8821733, 0.1241223, -0.1476239, 1, 1, 1, 1, 1,
0.8836595, 0.06470796, 1.987134, 1, 1, 1, 1, 1,
0.8864282, 0.9225383, 0.7252797, 1, 1, 1, 1, 1,
0.8899117, 0.9939477, -2.181079, 1, 1, 1, 1, 1,
0.8926958, 0.2137433, 0.2225983, 1, 1, 1, 1, 1,
0.8972379, 1.260106, -0.05877399, 1, 1, 1, 1, 1,
0.8998212, -0.3928242, 2.69472, 1, 1, 1, 1, 1,
0.9058505, 0.5072166, 1.366367, 1, 1, 1, 1, 1,
0.9077436, -1.346041, 1.739288, 1, 1, 1, 1, 1,
0.9083181, -1.728953, 1.008933, 1, 1, 1, 1, 1,
0.91967, 0.1375582, 2.378328, 1, 1, 1, 1, 1,
0.9215375, -1.479687, 1.984775, 1, 1, 1, 1, 1,
0.9228632, -2.413185, 3.785968, 1, 1, 1, 1, 1,
0.9243135, 0.5654774, 0.09667125, 0, 0, 1, 1, 1,
0.9243767, -0.4724514, 3.916307, 1, 0, 0, 1, 1,
0.9264054, -1.704376, 3.061946, 1, 0, 0, 1, 1,
0.9288298, 0.1594322, 2.506525, 1, 0, 0, 1, 1,
0.933302, 0.9240279, 0.03787671, 1, 0, 0, 1, 1,
0.9336278, -0.1243941, 1.790926, 1, 0, 0, 1, 1,
0.9336685, 1.033227, 0.6586519, 0, 0, 0, 1, 1,
0.9345874, -2.610279, 3.855768, 0, 0, 0, 1, 1,
0.9384112, 0.2329424, 1.435776, 0, 0, 0, 1, 1,
0.9397142, -1.668463, 2.108549, 0, 0, 0, 1, 1,
0.943235, 0.561361, 1.326258, 0, 0, 0, 1, 1,
0.943644, 0.8239675, 1.300471, 0, 0, 0, 1, 1,
0.944647, -2.250575, 4.168724, 0, 0, 0, 1, 1,
0.9447437, -0.8509693, 2.661974, 1, 1, 1, 1, 1,
0.9449269, -1.07971, 0.9960487, 1, 1, 1, 1, 1,
0.945167, 0.6464986, 1.227646, 1, 1, 1, 1, 1,
0.9473362, 1.159165, 1.007014, 1, 1, 1, 1, 1,
0.9492187, 0.4503157, 2.447221, 1, 1, 1, 1, 1,
0.9504919, -0.3574756, 2.927969, 1, 1, 1, 1, 1,
0.9518682, -0.7347361, 2.531124, 1, 1, 1, 1, 1,
0.9532024, 2.100197, 0.9740019, 1, 1, 1, 1, 1,
0.9579935, -0.2042825, 0.8723486, 1, 1, 1, 1, 1,
0.9617202, -1.087245, 3.535539, 1, 1, 1, 1, 1,
0.9709854, 0.6043829, 1.12501, 1, 1, 1, 1, 1,
0.9733641, -1.083378, 3.231017, 1, 1, 1, 1, 1,
0.9745442, 1.208145, 2.035348, 1, 1, 1, 1, 1,
0.9823191, -0.150044, 1.723552, 1, 1, 1, 1, 1,
0.985827, -1.516945, 1.679701, 1, 1, 1, 1, 1,
0.9880595, -0.7068453, 1.465014, 0, 0, 1, 1, 1,
0.9885913, -0.04502853, 2.879533, 1, 0, 0, 1, 1,
0.9951318, 0.584575, 0.9599199, 1, 0, 0, 1, 1,
0.9951985, 1.103506, 1.242143, 1, 0, 0, 1, 1,
0.9978425, 0.8472652, -0.4317705, 1, 0, 0, 1, 1,
0.9993255, -0.3601682, 1.353542, 1, 0, 0, 1, 1,
1.001236, 1.24672, 1.747006, 0, 0, 0, 1, 1,
1.012175, 0.5000157, 1.213271, 0, 0, 0, 1, 1,
1.018776, 0.2890647, 1.166213, 0, 0, 0, 1, 1,
1.027289, -0.5601367, 0.691065, 0, 0, 0, 1, 1,
1.032384, -1.093768, 1.7028, 0, 0, 0, 1, 1,
1.033177, 0.3608734, 1.648744, 0, 0, 0, 1, 1,
1.039512, 1.031465, 0.7416816, 0, 0, 0, 1, 1,
1.040605, -0.1701489, 1.545978, 1, 1, 1, 1, 1,
1.043892, 1.668797, -0.3161449, 1, 1, 1, 1, 1,
1.046419, -0.3560783, 1.338989, 1, 1, 1, 1, 1,
1.047437, -1.593431, 2.371967, 1, 1, 1, 1, 1,
1.052678, -0.8237188, 2.317491, 1, 1, 1, 1, 1,
1.059321, -0.1537914, 0.4800918, 1, 1, 1, 1, 1,
1.071184, -0.2080971, 1.16388, 1, 1, 1, 1, 1,
1.074919, -0.5947895, 1.468611, 1, 1, 1, 1, 1,
1.075455, -0.6692152, 3.66406, 1, 1, 1, 1, 1,
1.082478, -0.6356235, 2.407893, 1, 1, 1, 1, 1,
1.085333, 0.3541983, 0.3821158, 1, 1, 1, 1, 1,
1.086599, 0.5859886, 2.578395, 1, 1, 1, 1, 1,
1.086774, 1.700328, 0.2648274, 1, 1, 1, 1, 1,
1.09209, 0.9537346, 2.024318, 1, 1, 1, 1, 1,
1.094998, 1.092168, 0.2949855, 1, 1, 1, 1, 1,
1.107575, -0.1688048, 3.07018, 0, 0, 1, 1, 1,
1.108623, -1.365973, 0.929706, 1, 0, 0, 1, 1,
1.109842, 0.5429716, 2.322873, 1, 0, 0, 1, 1,
1.110502, -0.0550907, 2.076025, 1, 0, 0, 1, 1,
1.1173, -0.2857806, 3.188736, 1, 0, 0, 1, 1,
1.117862, 1.978738, 0.336786, 1, 0, 0, 1, 1,
1.123973, 0.2712862, 0.219812, 0, 0, 0, 1, 1,
1.126685, -0.1194939, 2.63265, 0, 0, 0, 1, 1,
1.13335, -0.3354116, 2.372549, 0, 0, 0, 1, 1,
1.139145, 0.2973874, 2.619398, 0, 0, 0, 1, 1,
1.139388, 0.4143086, 1.078143, 0, 0, 0, 1, 1,
1.150823, 1.171434, -1.172785, 0, 0, 0, 1, 1,
1.152744, -0.2075221, 1.559352, 0, 0, 0, 1, 1,
1.160987, -0.0579486, 0.7391552, 1, 1, 1, 1, 1,
1.162888, 1.410139, 1.834622, 1, 1, 1, 1, 1,
1.165084, -2.04667, 2.398185, 1, 1, 1, 1, 1,
1.175331, -0.5885867, 0.1899504, 1, 1, 1, 1, 1,
1.178205, 1.513925, 0.04161745, 1, 1, 1, 1, 1,
1.179918, -0.2471246, 1.262751, 1, 1, 1, 1, 1,
1.180112, -0.04116904, 2.847172, 1, 1, 1, 1, 1,
1.181883, 1.113526, 1.225381, 1, 1, 1, 1, 1,
1.186756, -0.4052021, 2.019338, 1, 1, 1, 1, 1,
1.193382, 0.314844, 2.372575, 1, 1, 1, 1, 1,
1.201507, -0.3224581, 2.944278, 1, 1, 1, 1, 1,
1.205292, -0.1191371, 2.824221, 1, 1, 1, 1, 1,
1.21718, -3.431495, 3.190812, 1, 1, 1, 1, 1,
1.220889, -0.1707784, 1.535791, 1, 1, 1, 1, 1,
1.224035, -0.6489699, 3.882233, 1, 1, 1, 1, 1,
1.227982, -0.1092865, 2.219822, 0, 0, 1, 1, 1,
1.228817, 0.2134719, 1.048495, 1, 0, 0, 1, 1,
1.229745, 1.19236, 1.123166, 1, 0, 0, 1, 1,
1.231493, -0.4088122, 1.889059, 1, 0, 0, 1, 1,
1.237824, 0.7458186, 1.711349, 1, 0, 0, 1, 1,
1.24446, -0.6257368, 0.09936673, 1, 0, 0, 1, 1,
1.246156, -1.093256, 0.680744, 0, 0, 0, 1, 1,
1.251673, 0.6142288, 1.961124, 0, 0, 0, 1, 1,
1.253007, 1.591265, -0.6300477, 0, 0, 0, 1, 1,
1.25541, 1.372942, -0.8806304, 0, 0, 0, 1, 1,
1.255419, 0.5434095, 1.949347, 0, 0, 0, 1, 1,
1.2555, 0.06482474, 0.2379003, 0, 0, 0, 1, 1,
1.258654, 0.05890584, 1.253412, 0, 0, 0, 1, 1,
1.263202, 0.875832, 0.5667701, 1, 1, 1, 1, 1,
1.266292, 1.40531, 2.152737, 1, 1, 1, 1, 1,
1.268917, 0.9892048, 2.102563, 1, 1, 1, 1, 1,
1.278101, -1.078185, 1.185307, 1, 1, 1, 1, 1,
1.28125, -0.8284916, 0.8212063, 1, 1, 1, 1, 1,
1.286108, -0.1600634, 2.586044, 1, 1, 1, 1, 1,
1.2928, -0.6285284, 1.727694, 1, 1, 1, 1, 1,
1.307174, 1.200266, 2.153035, 1, 1, 1, 1, 1,
1.307433, -1.04643, 2.389377, 1, 1, 1, 1, 1,
1.308762, 1.257598, 0.07948839, 1, 1, 1, 1, 1,
1.316845, 1.026553, 0.7145083, 1, 1, 1, 1, 1,
1.322413, -0.01989286, -1.107618, 1, 1, 1, 1, 1,
1.336148, -0.5572107, 1.161228, 1, 1, 1, 1, 1,
1.345354, 0.03113653, 2.736637, 1, 1, 1, 1, 1,
1.354035, 1.351784, 0.0826415, 1, 1, 1, 1, 1,
1.35652, 0.335385, 0.5624187, 0, 0, 1, 1, 1,
1.37829, 0.07766465, 2.082911, 1, 0, 0, 1, 1,
1.384816, -1.043957, 3.47648, 1, 0, 0, 1, 1,
1.388405, -0.6903989, 3.183146, 1, 0, 0, 1, 1,
1.390532, 1.151879, 1.4577, 1, 0, 0, 1, 1,
1.402324, 0.7022228, -0.07641424, 1, 0, 0, 1, 1,
1.405456, -0.78127, 2.295283, 0, 0, 0, 1, 1,
1.411872, -0.5049493, 1.846888, 0, 0, 0, 1, 1,
1.417286, 0.6715407, 1.23942, 0, 0, 0, 1, 1,
1.418576, 0.9307852, 0.8447894, 0, 0, 0, 1, 1,
1.425832, -1.878721, 1.264348, 0, 0, 0, 1, 1,
1.427109, 0.3492201, 0.1977329, 0, 0, 0, 1, 1,
1.443868, -0.2864715, 3.058842, 0, 0, 0, 1, 1,
1.449205, 1.091272, 2.573915, 1, 1, 1, 1, 1,
1.461391, -0.8253253, 2.290537, 1, 1, 1, 1, 1,
1.476229, -1.331074, 2.843484, 1, 1, 1, 1, 1,
1.483316, -0.427795, 0.4278731, 1, 1, 1, 1, 1,
1.490734, -1.249611, 3.274017, 1, 1, 1, 1, 1,
1.493208, -0.6726099, 2.375771, 1, 1, 1, 1, 1,
1.498729, 0.01044067, -0.2883196, 1, 1, 1, 1, 1,
1.499333, 0.7208763, 0.06382018, 1, 1, 1, 1, 1,
1.521419, -0.2204314, 1.628729, 1, 1, 1, 1, 1,
1.522377, 0.8215271, 1.634862, 1, 1, 1, 1, 1,
1.522926, 0.4297294, 1.246225, 1, 1, 1, 1, 1,
1.526908, -0.7481115, 1.209628, 1, 1, 1, 1, 1,
1.528437, -0.2966784, 2.94702, 1, 1, 1, 1, 1,
1.528834, -1.152079, 1.357162, 1, 1, 1, 1, 1,
1.540035, 0.4066005, 4.099844, 1, 1, 1, 1, 1,
1.551918, 0.1911813, 1.204723, 0, 0, 1, 1, 1,
1.554185, 1.971416, 0.2667733, 1, 0, 0, 1, 1,
1.568532, 0.1360971, 3.022254, 1, 0, 0, 1, 1,
1.570168, 0.4237776, 1.421526, 1, 0, 0, 1, 1,
1.579793, 0.07816572, 3.297366, 1, 0, 0, 1, 1,
1.580649, 0.5857882, 0.02374092, 1, 0, 0, 1, 1,
1.58811, 0.01530283, -0.239472, 0, 0, 0, 1, 1,
1.602194, -2.351759, 2.655399, 0, 0, 0, 1, 1,
1.603075, -1.325721, 3.114757, 0, 0, 0, 1, 1,
1.616728, 0.5629067, 0.3631583, 0, 0, 0, 1, 1,
1.616869, 1.937957, 0.1099969, 0, 0, 0, 1, 1,
1.618168, 0.2471104, 1.041732, 0, 0, 0, 1, 1,
1.629348, 0.652915, 1.815526, 0, 0, 0, 1, 1,
1.629459, -1.41011, 3.932892, 1, 1, 1, 1, 1,
1.643572, -0.959177, 2.468967, 1, 1, 1, 1, 1,
1.645636, 0.6526224, 0.1961576, 1, 1, 1, 1, 1,
1.655821, 0.1377584, 0.8940831, 1, 1, 1, 1, 1,
1.658314, -0.5713061, 1.174969, 1, 1, 1, 1, 1,
1.658854, -1.340129, 1.369687, 1, 1, 1, 1, 1,
1.663156, 0.2601664, 4.207302, 1, 1, 1, 1, 1,
1.663629, 1.160834, 0.9552896, 1, 1, 1, 1, 1,
1.667869, 0.2057521, 2.914789, 1, 1, 1, 1, 1,
1.66811, 0.1036498, 1.701846, 1, 1, 1, 1, 1,
1.678847, -0.8702035, 1.651398, 1, 1, 1, 1, 1,
1.700271, -0.5855587, 1.519374, 1, 1, 1, 1, 1,
1.705873, 0.6820005, -0.03208823, 1, 1, 1, 1, 1,
1.721346, -2.343817, 0.5410589, 1, 1, 1, 1, 1,
1.730717, -0.4882328, 3.42289, 1, 1, 1, 1, 1,
1.733428, 0.9695798, 0.8458865, 0, 0, 1, 1, 1,
1.743661, -0.255454, 0.5882218, 1, 0, 0, 1, 1,
1.756305, 0.8234574, 1.997536, 1, 0, 0, 1, 1,
1.793724, -0.09529492, 0.07454819, 1, 0, 0, 1, 1,
1.806626, -0.4405796, 2.105339, 1, 0, 0, 1, 1,
1.814959, -1.465984, 0.1033274, 1, 0, 0, 1, 1,
1.828689, -0.8740724, 3.953599, 0, 0, 0, 1, 1,
1.834868, 0.07784437, 1.920023, 0, 0, 0, 1, 1,
1.853393, -1.330199, 3.992073, 0, 0, 0, 1, 1,
1.855977, 0.2782757, 1.065009, 0, 0, 0, 1, 1,
1.864706, 1.513934, 1.914563, 0, 0, 0, 1, 1,
1.888026, -0.5623824, -0.2496175, 0, 0, 0, 1, 1,
1.895015, -0.5629317, 2.601983, 0, 0, 0, 1, 1,
1.91224, 0.839466, 1.921001, 1, 1, 1, 1, 1,
1.915411, 0.6801831, 0.2393982, 1, 1, 1, 1, 1,
1.949577, -0.04758777, 0.4075312, 1, 1, 1, 1, 1,
1.96561, 0.001352484, 2.035041, 1, 1, 1, 1, 1,
1.975725, -1.526051, 0.2512148, 1, 1, 1, 1, 1,
1.976235, -0.08676097, 1.757908, 1, 1, 1, 1, 1,
1.992619, 0.5189673, 0.4492394, 1, 1, 1, 1, 1,
2.027141, -0.2540993, 4.048282, 1, 1, 1, 1, 1,
2.046009, -0.413329, 3.368798, 1, 1, 1, 1, 1,
2.05487, 0.414294, 0.8436031, 1, 1, 1, 1, 1,
2.08222, 0.1081305, 1.275399, 1, 1, 1, 1, 1,
2.083196, 0.7349151, -0.04764852, 1, 1, 1, 1, 1,
2.105571, -0.253903, 1.862454, 1, 1, 1, 1, 1,
2.118807, -0.1873829, 1.751103, 1, 1, 1, 1, 1,
2.121929, 1.909441, 0.9224356, 1, 1, 1, 1, 1,
2.145199, -0.26316, 0.3963382, 0, 0, 1, 1, 1,
2.252656, 0.7880328, 2.678097, 1, 0, 0, 1, 1,
2.254652, -0.09165914, 2.588259, 1, 0, 0, 1, 1,
2.262429, -0.593872, 0.695325, 1, 0, 0, 1, 1,
2.304518, -0.1453782, 1.248358, 1, 0, 0, 1, 1,
2.324983, -0.3533538, -0.3409277, 1, 0, 0, 1, 1,
2.34865, 1.905768, 0.5267457, 0, 0, 0, 1, 1,
2.450854, 1.12347, 0.6249172, 0, 0, 0, 1, 1,
2.532215, -0.02371557, 1.295234, 0, 0, 0, 1, 1,
2.533436, 1.13952, 1.369314, 0, 0, 0, 1, 1,
2.556916, -0.1067262, 1.504214, 0, 0, 0, 1, 1,
2.666507, 0.36056, 2.551374, 0, 0, 0, 1, 1,
2.768358, 0.502564, 1.963546, 0, 0, 0, 1, 1,
2.81685, -1.23217, 2.923414, 1, 1, 1, 1, 1,
2.822848, -0.8887948, 0.9838242, 1, 1, 1, 1, 1,
2.908862, 0.005718273, 0.7561152, 1, 1, 1, 1, 1,
2.943507, 0.5185395, 2.134064, 1, 1, 1, 1, 1,
2.943927, -0.5179821, 1.154511, 1, 1, 1, 1, 1,
3.105099, 0.02515933, 2.43933, 1, 1, 1, 1, 1,
3.74328, 0.5925351, 1.127382, 1, 1, 1, 1, 1
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
var radius = 9.772798;
var distance = 34.32654;
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
mvMatrix.translate( -0.2260723, 0.3105856, 0.06131268 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32654);
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
