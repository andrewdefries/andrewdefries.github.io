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
-3.182986, -0.2644853, -1.406901, 1, 0, 0, 1,
-2.694354, 0.3808614, -0.7067081, 1, 0.007843138, 0, 1,
-2.537144, 0.9540869, -0.04008474, 1, 0.01176471, 0, 1,
-2.530269, -0.1385204, -2.024557, 1, 0.01960784, 0, 1,
-2.524246, -1.196126, -1.668069, 1, 0.02352941, 0, 1,
-2.396812, 0.3118431, -0.6544274, 1, 0.03137255, 0, 1,
-2.285901, 1.901309, -0.4230334, 1, 0.03529412, 0, 1,
-2.275108, 1.327053, -1.103475, 1, 0.04313726, 0, 1,
-2.272415, 0.6525297, -3.585622, 1, 0.04705882, 0, 1,
-2.25345, -0.8006142, -1.806704, 1, 0.05490196, 0, 1,
-2.22708, -0.120341, -3.132666, 1, 0.05882353, 0, 1,
-2.217503, -1.089646, -1.533729, 1, 0.06666667, 0, 1,
-2.205053, 1.339447, 0.3297056, 1, 0.07058824, 0, 1,
-2.158273, -0.5938974, -1.649033, 1, 0.07843138, 0, 1,
-2.09977, 0.03571405, -0.0986478, 1, 0.08235294, 0, 1,
-2.090403, -2.261558, -2.031338, 1, 0.09019608, 0, 1,
-2.085636, 0.7628285, -0.7932287, 1, 0.09411765, 0, 1,
-2.068402, 1.025445, 0.3044975, 1, 0.1019608, 0, 1,
-2.059142, -0.02201934, 0.02686413, 1, 0.1098039, 0, 1,
-2.057851, 0.5197197, -2.007122, 1, 0.1137255, 0, 1,
-2.054929, -1.184848, -1.020927, 1, 0.1215686, 0, 1,
-2.045568, -0.1000734, -1.275613, 1, 0.1254902, 0, 1,
-2.008842, 0.2909109, 0.4573292, 1, 0.1333333, 0, 1,
-1.995026, 0.9838375, -0.7814202, 1, 0.1372549, 0, 1,
-1.964084, -1.717428, -2.11572, 1, 0.145098, 0, 1,
-1.927374, -1.020437, -3.08147, 1, 0.1490196, 0, 1,
-1.895074, 1.17436, -1.07865, 1, 0.1568628, 0, 1,
-1.890506, 0.02667317, -2.587436, 1, 0.1607843, 0, 1,
-1.8755, 0.5246578, -1.789233, 1, 0.1686275, 0, 1,
-1.873197, -0.7978684, -1.151165, 1, 0.172549, 0, 1,
-1.869147, -1.078254, -1.734632, 1, 0.1803922, 0, 1,
-1.861488, -0.7121351, -1.699117, 1, 0.1843137, 0, 1,
-1.810187, 0.6667566, -2.603825, 1, 0.1921569, 0, 1,
-1.804408, 0.6071381, -0.1098151, 1, 0.1960784, 0, 1,
-1.80108, 0.725475, -2.985175, 1, 0.2039216, 0, 1,
-1.787141, 0.8332337, -0.5299465, 1, 0.2117647, 0, 1,
-1.773944, 0.1190103, -2.509214, 1, 0.2156863, 0, 1,
-1.770089, -0.6177635, -1.622981, 1, 0.2235294, 0, 1,
-1.757735, 0.5398392, -1.236233, 1, 0.227451, 0, 1,
-1.731149, -0.1735868, -3.01177, 1, 0.2352941, 0, 1,
-1.726021, 1.438007, 0.3855773, 1, 0.2392157, 0, 1,
-1.719121, 1.834613, 1.011999, 1, 0.2470588, 0, 1,
-1.710982, 1.546709, 0.07852101, 1, 0.2509804, 0, 1,
-1.710593, -0.4634635, 0.2274532, 1, 0.2588235, 0, 1,
-1.704186, 0.1662041, -0.8551981, 1, 0.2627451, 0, 1,
-1.693295, -0.6703799, -1.750867, 1, 0.2705882, 0, 1,
-1.689365, 0.770307, -1.539829, 1, 0.2745098, 0, 1,
-1.687328, 0.4139242, -1.991988, 1, 0.282353, 0, 1,
-1.684225, -0.5647007, -1.893593, 1, 0.2862745, 0, 1,
-1.680393, 0.3402349, -1.580673, 1, 0.2941177, 0, 1,
-1.677126, -1.614099, -0.9190376, 1, 0.3019608, 0, 1,
-1.65015, -2.122229, -2.323807, 1, 0.3058824, 0, 1,
-1.648743, -2.036294, -3.477327, 1, 0.3137255, 0, 1,
-1.635431, -0.2126592, -1.337639, 1, 0.3176471, 0, 1,
-1.634761, 0.7435245, -1.834131, 1, 0.3254902, 0, 1,
-1.621112, -0.9428966, -1.637373, 1, 0.3294118, 0, 1,
-1.616536, 0.008318476, -1.232985, 1, 0.3372549, 0, 1,
-1.578333, 1.239866, 1.103234, 1, 0.3411765, 0, 1,
-1.573133, 0.2846524, -2.996556, 1, 0.3490196, 0, 1,
-1.569714, 0.7862, -0.7988818, 1, 0.3529412, 0, 1,
-1.568555, 1.868231, -1.017503, 1, 0.3607843, 0, 1,
-1.560723, -0.2104691, -0.2156253, 1, 0.3647059, 0, 1,
-1.554668, -0.1527073, -1.642532, 1, 0.372549, 0, 1,
-1.540528, 0.2908407, -1.542388, 1, 0.3764706, 0, 1,
-1.533562, 0.0657572, -1.792623, 1, 0.3843137, 0, 1,
-1.523434, -0.9047604, -1.995026, 1, 0.3882353, 0, 1,
-1.499405, 0.1806474, -1.100118, 1, 0.3960784, 0, 1,
-1.489161, 0.5417711, -2.081029, 1, 0.4039216, 0, 1,
-1.488182, 0.2781452, 0.8912746, 1, 0.4078431, 0, 1,
-1.473136, 1.183662, -2.599988, 1, 0.4156863, 0, 1,
-1.471494, -1.452048, -3.134084, 1, 0.4196078, 0, 1,
-1.469363, -0.03476527, -1.947518, 1, 0.427451, 0, 1,
-1.449237, -0.1629869, 0.06081923, 1, 0.4313726, 0, 1,
-1.442086, 1.46582, -1.907299, 1, 0.4392157, 0, 1,
-1.42696, 1.101484, -0.450361, 1, 0.4431373, 0, 1,
-1.424489, 0.7222825, 0.6600389, 1, 0.4509804, 0, 1,
-1.421129, -0.09952389, -2.281096, 1, 0.454902, 0, 1,
-1.416852, -0.09793399, -2.656383, 1, 0.4627451, 0, 1,
-1.407497, -0.680218, -2.830434, 1, 0.4666667, 0, 1,
-1.395369, 1.80323, -0.4484184, 1, 0.4745098, 0, 1,
-1.395291, -0.1247178, -2.410358, 1, 0.4784314, 0, 1,
-1.390949, -0.5928812, -2.340636, 1, 0.4862745, 0, 1,
-1.387955, 0.6064968, 1.240391, 1, 0.4901961, 0, 1,
-1.384294, -2.347078, -1.360653, 1, 0.4980392, 0, 1,
-1.383981, 0.07493383, -2.238775, 1, 0.5058824, 0, 1,
-1.383401, 0.2047462, -0.4721445, 1, 0.509804, 0, 1,
-1.376225, 1.185175, -2.759763, 1, 0.5176471, 0, 1,
-1.368595, 0.3895494, -0.2697313, 1, 0.5215687, 0, 1,
-1.368247, -0.635094, -1.885243, 1, 0.5294118, 0, 1,
-1.357249, -0.188325, -1.179858, 1, 0.5333334, 0, 1,
-1.348206, -0.4257035, -0.4061105, 1, 0.5411765, 0, 1,
-1.347612, 1.480554, 0.3568577, 1, 0.5450981, 0, 1,
-1.344507, 1.69892, -0.9389959, 1, 0.5529412, 0, 1,
-1.344172, 0.1843354, -0.8900849, 1, 0.5568628, 0, 1,
-1.342968, 0.1908102, -0.9841613, 1, 0.5647059, 0, 1,
-1.340733, 0.915953, -0.003550637, 1, 0.5686275, 0, 1,
-1.33698, 1.532872, -0.3481414, 1, 0.5764706, 0, 1,
-1.326786, 0.5028103, -0.2547348, 1, 0.5803922, 0, 1,
-1.324303, 0.3344899, -1.751383, 1, 0.5882353, 0, 1,
-1.313681, 0.9447491, -1.537428, 1, 0.5921569, 0, 1,
-1.307516, -1.198491, -2.989167, 1, 0.6, 0, 1,
-1.305702, -2.228681, -4.292152, 1, 0.6078432, 0, 1,
-1.299125, 1.54222, -1.241279, 1, 0.6117647, 0, 1,
-1.294021, 0.9538988, -1.20577, 1, 0.6196079, 0, 1,
-1.291193, -0.3707697, -3.218605, 1, 0.6235294, 0, 1,
-1.290655, -0.9647692, -3.195143, 1, 0.6313726, 0, 1,
-1.289999, -2.289404, -3.384077, 1, 0.6352941, 0, 1,
-1.289053, 0.1648887, -1.88344, 1, 0.6431373, 0, 1,
-1.287426, 0.1553919, -1.606284, 1, 0.6470588, 0, 1,
-1.276077, 0.7832714, -0.2151057, 1, 0.654902, 0, 1,
-1.273712, -0.156764, -1.709726, 1, 0.6588235, 0, 1,
-1.261213, -0.1066693, -1.569109, 1, 0.6666667, 0, 1,
-1.259414, -1.159229, -3.215946, 1, 0.6705883, 0, 1,
-1.258428, 0.008799522, -0.620468, 1, 0.6784314, 0, 1,
-1.251599, 0.1435685, 0.1058741, 1, 0.682353, 0, 1,
-1.250808, -1.360191, -2.689176, 1, 0.6901961, 0, 1,
-1.249446, -0.2403286, -0.2862005, 1, 0.6941177, 0, 1,
-1.247999, 1.84924, -0.7733611, 1, 0.7019608, 0, 1,
-1.241924, 0.8271959, -1.321914, 1, 0.7098039, 0, 1,
-1.231835, 0.3426038, -1.92369, 1, 0.7137255, 0, 1,
-1.224438, 0.9476796, 0.6247333, 1, 0.7215686, 0, 1,
-1.21884, 0.6615361, 0.09472522, 1, 0.7254902, 0, 1,
-1.216937, -0.8084953, -2.835914, 1, 0.7333333, 0, 1,
-1.214995, 0.7700764, -1.904087, 1, 0.7372549, 0, 1,
-1.212852, -0.2199228, -1.189837, 1, 0.7450981, 0, 1,
-1.210497, 0.4590896, 1.632591, 1, 0.7490196, 0, 1,
-1.208338, 0.8681284, -1.458781, 1, 0.7568628, 0, 1,
-1.202232, 0.9089013, -1.281829, 1, 0.7607843, 0, 1,
-1.200902, -0.1162506, -1.128117, 1, 0.7686275, 0, 1,
-1.200873, 1.544084, -1.643505, 1, 0.772549, 0, 1,
-1.199258, -1.305334, -2.350611, 1, 0.7803922, 0, 1,
-1.196288, 0.4517592, -1.335472, 1, 0.7843137, 0, 1,
-1.195502, 0.2664409, -1.657339, 1, 0.7921569, 0, 1,
-1.195487, 1.005092, 0.6534107, 1, 0.7960784, 0, 1,
-1.194903, 0.6552607, -0.9734273, 1, 0.8039216, 0, 1,
-1.194436, 1.586637, -0.7800747, 1, 0.8117647, 0, 1,
-1.186959, 0.82487, 1.191208, 1, 0.8156863, 0, 1,
-1.176652, 0.5421438, 0.2141213, 1, 0.8235294, 0, 1,
-1.172226, -0.2130659, -1.874453, 1, 0.827451, 0, 1,
-1.171594, -2.192227, -2.214057, 1, 0.8352941, 0, 1,
-1.171392, -0.6934611, -2.373844, 1, 0.8392157, 0, 1,
-1.170517, 1.082193, 0.3332108, 1, 0.8470588, 0, 1,
-1.160513, 0.8066282, -2.216201, 1, 0.8509804, 0, 1,
-1.157363, -0.3985902, -2.796755, 1, 0.8588235, 0, 1,
-1.150292, 0.05796827, -3.090572, 1, 0.8627451, 0, 1,
-1.141719, -0.3824765, -1.974095, 1, 0.8705882, 0, 1,
-1.135684, -1.020118, -1.380042, 1, 0.8745098, 0, 1,
-1.132977, 0.9582125, -0.366876, 1, 0.8823529, 0, 1,
-1.129274, -0.9921849, -1.900297, 1, 0.8862745, 0, 1,
-1.12845, 1.337398, -1.415835, 1, 0.8941177, 0, 1,
-1.115521, -1.311495, -1.449041, 1, 0.8980392, 0, 1,
-1.105982, -0.3339381, -3.469256, 1, 0.9058824, 0, 1,
-1.103527, 0.07058351, -0.4300235, 1, 0.9137255, 0, 1,
-1.094692, 0.08856908, -1.603553, 1, 0.9176471, 0, 1,
-1.093874, -1.100511, -1.759767, 1, 0.9254902, 0, 1,
-1.079146, 1.1469, 0.04218134, 1, 0.9294118, 0, 1,
-1.073552, 0.9794712, -0.3859034, 1, 0.9372549, 0, 1,
-1.069, -0.7993674, -2.689396, 1, 0.9411765, 0, 1,
-1.068541, -0.1535846, -1.858935, 1, 0.9490196, 0, 1,
-1.066441, 0.1801981, -2.102698, 1, 0.9529412, 0, 1,
-1.063627, -0.8528949, -2.792356, 1, 0.9607843, 0, 1,
-1.061939, -2.842943, -0.8187331, 1, 0.9647059, 0, 1,
-1.053232, 0.7215782, -1.742988, 1, 0.972549, 0, 1,
-1.04988, -0.560807, -4.109788, 1, 0.9764706, 0, 1,
-1.049162, -0.8322016, -2.509672, 1, 0.9843137, 0, 1,
-1.048919, -2.716846, -5.649415, 1, 0.9882353, 0, 1,
-1.046568, 0.04279419, -1.954056, 1, 0.9960784, 0, 1,
-1.044033, -0.492025, -1.275498, 0.9960784, 1, 0, 1,
-1.018885, -2.36819, -2.695663, 0.9921569, 1, 0, 1,
-1.018061, 0.6661301, 0.1290336, 0.9843137, 1, 0, 1,
-1.009143, -0.1661501, -2.277674, 0.9803922, 1, 0, 1,
-1.001967, -1.314985, -2.547601, 0.972549, 1, 0, 1,
-0.9987607, -0.4220875, -2.112159, 0.9686275, 1, 0, 1,
-0.9975954, -1.483827, -2.538198, 0.9607843, 1, 0, 1,
-0.990522, -0.6919798, -3.484712, 0.9568627, 1, 0, 1,
-0.9802178, 0.4712416, -1.702258, 0.9490196, 1, 0, 1,
-0.977229, -0.03991402, -0.5155758, 0.945098, 1, 0, 1,
-0.9701928, 1.89884, -1.384839, 0.9372549, 1, 0, 1,
-0.9700537, -0.1812309, -1.548144, 0.9333333, 1, 0, 1,
-0.9609772, -1.120546, -4.217807, 0.9254902, 1, 0, 1,
-0.9465675, -0.007697043, -4.23052, 0.9215686, 1, 0, 1,
-0.938669, -0.2826126, -1.996802, 0.9137255, 1, 0, 1,
-0.9348843, 1.624181, -0.2608917, 0.9098039, 1, 0, 1,
-0.9278216, 1.047329, -1.428988, 0.9019608, 1, 0, 1,
-0.9233552, -0.6231349, -2.10183, 0.8941177, 1, 0, 1,
-0.9167967, 2.165537, 0.4282468, 0.8901961, 1, 0, 1,
-0.9154867, -0.3448576, -0.4410405, 0.8823529, 1, 0, 1,
-0.9102101, 0.6738718, -0.6915832, 0.8784314, 1, 0, 1,
-0.9060429, 0.5363329, -0.4932215, 0.8705882, 1, 0, 1,
-0.9030758, 0.7406344, -1.280036, 0.8666667, 1, 0, 1,
-0.9013165, -0.3125649, -1.800207, 0.8588235, 1, 0, 1,
-0.8951997, 0.7908313, -1.339483, 0.854902, 1, 0, 1,
-0.8925318, -0.2418951, -0.9188219, 0.8470588, 1, 0, 1,
-0.8889813, -1.441884, -2.557976, 0.8431373, 1, 0, 1,
-0.8863279, 0.7427938, 0.6578363, 0.8352941, 1, 0, 1,
-0.8824801, -0.2340101, -1.602668, 0.8313726, 1, 0, 1,
-0.8819999, -0.2928136, -0.2489333, 0.8235294, 1, 0, 1,
-0.8778239, 1.494298, -0.3986441, 0.8196079, 1, 0, 1,
-0.8633828, -0.7238864, -1.431935, 0.8117647, 1, 0, 1,
-0.8602742, 0.2066426, -2.479951, 0.8078431, 1, 0, 1,
-0.8566903, 0.1366327, -3.684304, 0.8, 1, 0, 1,
-0.8488185, -0.2446552, -2.213867, 0.7921569, 1, 0, 1,
-0.8441871, -1.739302, -4.952377, 0.7882353, 1, 0, 1,
-0.8397278, -0.3245764, -1.021438, 0.7803922, 1, 0, 1,
-0.8380647, 0.3441692, -1.989602, 0.7764706, 1, 0, 1,
-0.8324945, 1.217385, -0.5018015, 0.7686275, 1, 0, 1,
-0.8267853, 1.377501, -0.1878212, 0.7647059, 1, 0, 1,
-0.8259392, -0.9303536, -3.444352, 0.7568628, 1, 0, 1,
-0.8255866, -0.8618383, -1.843383, 0.7529412, 1, 0, 1,
-0.819325, 1.10707, -1.016793, 0.7450981, 1, 0, 1,
-0.8143811, 0.778953, -0.3502064, 0.7411765, 1, 0, 1,
-0.8090241, -0.5597066, -2.233805, 0.7333333, 1, 0, 1,
-0.8064536, 0.3114683, -1.000497, 0.7294118, 1, 0, 1,
-0.8026453, 0.4182128, -1.684155, 0.7215686, 1, 0, 1,
-0.8011992, -0.2389865, -1.831218, 0.7176471, 1, 0, 1,
-0.7964079, -1.006037, -1.453989, 0.7098039, 1, 0, 1,
-0.7955165, 1.043115, -1.180507, 0.7058824, 1, 0, 1,
-0.7945951, 0.374369, -1.99854, 0.6980392, 1, 0, 1,
-0.7927995, -2.28757, -3.050303, 0.6901961, 1, 0, 1,
-0.78248, 0.370321, -0.9348887, 0.6862745, 1, 0, 1,
-0.7762514, 0.3056746, -0.9817696, 0.6784314, 1, 0, 1,
-0.7750684, -1.283157, -4.234965, 0.6745098, 1, 0, 1,
-0.7696041, -0.7408817, -1.154489, 0.6666667, 1, 0, 1,
-0.7676412, -0.3938862, -2.822901, 0.6627451, 1, 0, 1,
-0.766653, 0.1106665, -0.2948126, 0.654902, 1, 0, 1,
-0.7592265, -0.6364009, -3.521484, 0.6509804, 1, 0, 1,
-0.7532747, 0.1311921, -0.7849163, 0.6431373, 1, 0, 1,
-0.7510773, -0.4105259, -2.424629, 0.6392157, 1, 0, 1,
-0.7478313, 0.4745827, -0.2215735, 0.6313726, 1, 0, 1,
-0.7473043, 0.5821217, 0.9747057, 0.627451, 1, 0, 1,
-0.7455142, 0.7560194, -2.494814, 0.6196079, 1, 0, 1,
-0.7430005, 2.68638, 0.8530098, 0.6156863, 1, 0, 1,
-0.7413085, 1.769675, 1.957685, 0.6078432, 1, 0, 1,
-0.7375472, -1.202278, -1.921316, 0.6039216, 1, 0, 1,
-0.7367675, 0.5244886, -1.747617, 0.5960785, 1, 0, 1,
-0.735465, 0.7035238, -0.8631348, 0.5882353, 1, 0, 1,
-0.7336043, -1.483215, -1.469095, 0.5843138, 1, 0, 1,
-0.7333766, -1.93519, -2.296493, 0.5764706, 1, 0, 1,
-0.7331606, -0.2941256, -3.370109, 0.572549, 1, 0, 1,
-0.7323588, 0.3886842, -1.05151, 0.5647059, 1, 0, 1,
-0.7316352, 0.1110464, -1.828863, 0.5607843, 1, 0, 1,
-0.7271805, 0.8583801, 1.079091, 0.5529412, 1, 0, 1,
-0.7257544, -1.867751, -3.527097, 0.5490196, 1, 0, 1,
-0.7247113, 1.162188, -0.03032437, 0.5411765, 1, 0, 1,
-0.722685, -0.2249362, -3.602601, 0.5372549, 1, 0, 1,
-0.7181222, -1.581034, -2.111695, 0.5294118, 1, 0, 1,
-0.716995, 0.2407274, -1.470747, 0.5254902, 1, 0, 1,
-0.7087915, -0.4046479, -3.054882, 0.5176471, 1, 0, 1,
-0.7072877, -1.500478, -3.238422, 0.5137255, 1, 0, 1,
-0.7065856, -0.2795241, -3.446001, 0.5058824, 1, 0, 1,
-0.70619, 0.6641946, -0.2452361, 0.5019608, 1, 0, 1,
-0.7011383, -0.05677284, -3.469312, 0.4941176, 1, 0, 1,
-0.6976851, 0.190803, -1.621892, 0.4862745, 1, 0, 1,
-0.6906725, -1.1271, -1.692062, 0.4823529, 1, 0, 1,
-0.6902708, 1.207957, -0.2927614, 0.4745098, 1, 0, 1,
-0.6843575, -0.7521595, -1.227853, 0.4705882, 1, 0, 1,
-0.6688491, -1.776324, -2.898878, 0.4627451, 1, 0, 1,
-0.6671593, 0.7489385, 0.9679343, 0.4588235, 1, 0, 1,
-0.66151, 0.1217013, -2.135634, 0.4509804, 1, 0, 1,
-0.6520877, -0.1158787, -4.776407, 0.4470588, 1, 0, 1,
-0.6516601, 1.559259, 0.685742, 0.4392157, 1, 0, 1,
-0.6463773, 0.3232697, -1.502354, 0.4352941, 1, 0, 1,
-0.642736, -1.633505, -1.273011, 0.427451, 1, 0, 1,
-0.6326075, 0.9977956, -0.9041994, 0.4235294, 1, 0, 1,
-0.6305557, 0.3641402, -0.8546594, 0.4156863, 1, 0, 1,
-0.6302883, 1.741059, 0.04607361, 0.4117647, 1, 0, 1,
-0.6281095, 1.179799, -0.8699207, 0.4039216, 1, 0, 1,
-0.6274258, -0.3376287, -3.172891, 0.3960784, 1, 0, 1,
-0.6262966, 0.8215744, -1.54147, 0.3921569, 1, 0, 1,
-0.6178312, -0.8333788, -3.186843, 0.3843137, 1, 0, 1,
-0.6173931, -0.1323213, 1.083658, 0.3803922, 1, 0, 1,
-0.6079718, 0.1119587, -1.560743, 0.372549, 1, 0, 1,
-0.6058469, 1.058679, -1.217075, 0.3686275, 1, 0, 1,
-0.5991243, -0.5642557, -2.70092, 0.3607843, 1, 0, 1,
-0.5976123, 0.656607, -1.161201, 0.3568628, 1, 0, 1,
-0.5948223, -0.05985013, -1.302603, 0.3490196, 1, 0, 1,
-0.5931529, 0.6834122, -1.616483, 0.345098, 1, 0, 1,
-0.5921285, -0.0342126, -2.829962, 0.3372549, 1, 0, 1,
-0.590157, 0.8521671, -0.5278934, 0.3333333, 1, 0, 1,
-0.5791861, 0.7900987, -0.1537405, 0.3254902, 1, 0, 1,
-0.5688905, 0.7232445, -1.364835, 0.3215686, 1, 0, 1,
-0.5679047, 0.4373827, -1.961674, 0.3137255, 1, 0, 1,
-0.5644883, -0.09239374, -1.169301, 0.3098039, 1, 0, 1,
-0.5610177, 0.4365865, -1.97484, 0.3019608, 1, 0, 1,
-0.5600945, -0.6915805, -2.659326, 0.2941177, 1, 0, 1,
-0.5598391, 0.5555131, -1.817515, 0.2901961, 1, 0, 1,
-0.559179, 0.1873442, -1.495876, 0.282353, 1, 0, 1,
-0.558066, 0.8442156, -0.7209294, 0.2784314, 1, 0, 1,
-0.5481193, -0.3097154, -2.591009, 0.2705882, 1, 0, 1,
-0.5472128, 0.04377174, -3.725431, 0.2666667, 1, 0, 1,
-0.5469112, 0.2073619, -1.373926, 0.2588235, 1, 0, 1,
-0.5457675, -1.19135, -2.322526, 0.254902, 1, 0, 1,
-0.5435258, -0.2596928, -1.678475, 0.2470588, 1, 0, 1,
-0.5424913, 0.471045, 0.08315658, 0.2431373, 1, 0, 1,
-0.5423254, -0.3829199, -2.8279, 0.2352941, 1, 0, 1,
-0.5408484, -0.4037634, -2.544676, 0.2313726, 1, 0, 1,
-0.5395792, 1.531749, -0.9386748, 0.2235294, 1, 0, 1,
-0.5354025, 2.325054, 0.01122256, 0.2196078, 1, 0, 1,
-0.5345079, -0.8251978, -2.904432, 0.2117647, 1, 0, 1,
-0.534012, -0.8648186, -3.528714, 0.2078431, 1, 0, 1,
-0.5339549, 0.18013, -0.4377808, 0.2, 1, 0, 1,
-0.5335787, 0.7781951, 0.08698672, 0.1921569, 1, 0, 1,
-0.532257, -0.1935872, -0.7952399, 0.1882353, 1, 0, 1,
-0.5314846, 0.3873512, -0.2583212, 0.1803922, 1, 0, 1,
-0.530444, 0.4466856, 0.03398563, 0.1764706, 1, 0, 1,
-0.526082, -1.284464, -0.9860283, 0.1686275, 1, 0, 1,
-0.5258144, 1.861087, -0.4753992, 0.1647059, 1, 0, 1,
-0.5249184, -0.2977792, -3.550081, 0.1568628, 1, 0, 1,
-0.5191419, 0.03329584, -0.2062534, 0.1529412, 1, 0, 1,
-0.5167779, 1.123051, -0.3130762, 0.145098, 1, 0, 1,
-0.5153998, -0.2928927, -1.800297, 0.1411765, 1, 0, 1,
-0.5128566, -0.6818361, -3.668345, 0.1333333, 1, 0, 1,
-0.5106441, -0.0237365, -1.122022, 0.1294118, 1, 0, 1,
-0.5104473, 1.135725, 0.2521013, 0.1215686, 1, 0, 1,
-0.5083884, 0.01194069, -0.6187862, 0.1176471, 1, 0, 1,
-0.5027314, -0.2353668, -2.398701, 0.1098039, 1, 0, 1,
-0.5011878, -0.6964436, -2.726443, 0.1058824, 1, 0, 1,
-0.4955263, 0.7697288, 0.66598, 0.09803922, 1, 0, 1,
-0.4945318, -0.6218491, -2.092554, 0.09019608, 1, 0, 1,
-0.494516, 0.5111246, -1.964151, 0.08627451, 1, 0, 1,
-0.4821553, 1.32488, 0.1755891, 0.07843138, 1, 0, 1,
-0.4819697, -1.06913, -3.046018, 0.07450981, 1, 0, 1,
-0.4800182, -1.496516, -2.060197, 0.06666667, 1, 0, 1,
-0.4768443, -0.08714452, -3.767494, 0.0627451, 1, 0, 1,
-0.4758003, 0.4725319, -0.109887, 0.05490196, 1, 0, 1,
-0.4739802, -1.016718, -4.740154, 0.05098039, 1, 0, 1,
-0.4733017, -0.5163472, -1.974532, 0.04313726, 1, 0, 1,
-0.4715286, -0.1162055, -1.424037, 0.03921569, 1, 0, 1,
-0.4691612, -1.04483, -2.733133, 0.03137255, 1, 0, 1,
-0.4636413, 0.4671417, -0.5619489, 0.02745098, 1, 0, 1,
-0.4623045, 0.4777977, -0.6972254, 0.01960784, 1, 0, 1,
-0.4595779, -0.8356446, -2.681552, 0.01568628, 1, 0, 1,
-0.4592538, 0.5401753, 0.09469914, 0.007843138, 1, 0, 1,
-0.4588152, -0.8264307, -2.389277, 0.003921569, 1, 0, 1,
-0.4587664, -0.02256946, -2.697323, 0, 1, 0.003921569, 1,
-0.4526796, 0.6998383, -0.02718389, 0, 1, 0.01176471, 1,
-0.4525192, 0.9047305, -1.31813, 0, 1, 0.01568628, 1,
-0.452068, -1.904728, -2.356823, 0, 1, 0.02352941, 1,
-0.4468868, -0.2281203, 0.458836, 0, 1, 0.02745098, 1,
-0.4360675, 0.01840787, -0.2672345, 0, 1, 0.03529412, 1,
-0.4242598, -1.330036, -3.710275, 0, 1, 0.03921569, 1,
-0.4217961, -0.7297223, -2.554672, 0, 1, 0.04705882, 1,
-0.4169528, 0.2102202, -0.4498663, 0, 1, 0.05098039, 1,
-0.4165264, 1.555721, -0.06788384, 0, 1, 0.05882353, 1,
-0.4141676, 0.6379759, -1.201508, 0, 1, 0.0627451, 1,
-0.4103729, 0.6343207, -0.9662299, 0, 1, 0.07058824, 1,
-0.4100484, 0.9889756, 0.43537, 0, 1, 0.07450981, 1,
-0.4071061, -1.011994, -3.346106, 0, 1, 0.08235294, 1,
-0.4061787, 0.5349816, -0.9577396, 0, 1, 0.08627451, 1,
-0.4050354, 0.835053, -1.543237, 0, 1, 0.09411765, 1,
-0.4043332, -0.177379, -0.8806711, 0, 1, 0.1019608, 1,
-0.4041328, -0.7501087, -2.660903, 0, 1, 0.1058824, 1,
-0.4005633, -0.125172, -2.538069, 0, 1, 0.1137255, 1,
-0.3929581, 1.896493, 0.1729866, 0, 1, 0.1176471, 1,
-0.3911435, 0.7031798, -0.577914, 0, 1, 0.1254902, 1,
-0.3873896, -0.199369, -0.3316633, 0, 1, 0.1294118, 1,
-0.3831432, -0.6188506, -3.379483, 0, 1, 0.1372549, 1,
-0.3829631, 0.8836045, -0.4227132, 0, 1, 0.1411765, 1,
-0.3827669, -0.5503737, -3.135359, 0, 1, 0.1490196, 1,
-0.3822877, -0.08358218, -1.402019, 0, 1, 0.1529412, 1,
-0.380601, 0.3469496, -1.868325, 0, 1, 0.1607843, 1,
-0.3803069, 1.068956, 0.7080027, 0, 1, 0.1647059, 1,
-0.378305, -2.275381, -1.89047, 0, 1, 0.172549, 1,
-0.3779867, 1.033025, -0.5114473, 0, 1, 0.1764706, 1,
-0.376091, -0.1377765, -0.08365129, 0, 1, 0.1843137, 1,
-0.374267, -0.2161588, -1.962006, 0, 1, 0.1882353, 1,
-0.3742627, 0.8164036, -0.8208252, 0, 1, 0.1960784, 1,
-0.3732297, 0.2522845, -0.2390568, 0, 1, 0.2039216, 1,
-0.365893, 0.7950961, -1.474464, 0, 1, 0.2078431, 1,
-0.3657298, -0.01786796, -1.374382, 0, 1, 0.2156863, 1,
-0.3598124, -0.7308663, -1.388121, 0, 1, 0.2196078, 1,
-0.3553015, 0.8375547, -0.6467551, 0, 1, 0.227451, 1,
-0.3518533, -0.6230991, -3.288961, 0, 1, 0.2313726, 1,
-0.3516353, 1.369264, -0.182921, 0, 1, 0.2392157, 1,
-0.3505655, 0.3812534, -1.454591, 0, 1, 0.2431373, 1,
-0.3472958, 1.301712, -0.6680654, 0, 1, 0.2509804, 1,
-0.3461348, 0.6202387, 0.3914264, 0, 1, 0.254902, 1,
-0.3418189, 0.865631, -1.23192, 0, 1, 0.2627451, 1,
-0.3386133, 1.255914, -1.369136, 0, 1, 0.2666667, 1,
-0.3343854, 0.5271417, 0.7516953, 0, 1, 0.2745098, 1,
-0.3334571, -0.8548172, -3.08848, 0, 1, 0.2784314, 1,
-0.3307441, 1.314788, -0.04228019, 0, 1, 0.2862745, 1,
-0.3279757, -0.3105209, -0.6191655, 0, 1, 0.2901961, 1,
-0.3270512, -0.2333116, -2.942173, 0, 1, 0.2980392, 1,
-0.3261032, -2.550211, -4.849922, 0, 1, 0.3058824, 1,
-0.3247736, -1.609715, -1.727407, 0, 1, 0.3098039, 1,
-0.3221491, 0.2016861, -0.4325032, 0, 1, 0.3176471, 1,
-0.308423, 1.427705, -2.562582, 0, 1, 0.3215686, 1,
-0.3073653, 0.6889724, -1.275358, 0, 1, 0.3294118, 1,
-0.3063126, -0.6005936, -2.294534, 0, 1, 0.3333333, 1,
-0.3056944, -0.7635645, -3.694609, 0, 1, 0.3411765, 1,
-0.3046752, -0.6484514, -2.496167, 0, 1, 0.345098, 1,
-0.3019534, 0.2127666, -2.556497, 0, 1, 0.3529412, 1,
-0.2995752, 0.1273857, -1.384228, 0, 1, 0.3568628, 1,
-0.2990512, -0.9141554, -4.835149, 0, 1, 0.3647059, 1,
-0.296052, -0.1663639, -1.613459, 0, 1, 0.3686275, 1,
-0.2955562, -2.008832, -1.200566, 0, 1, 0.3764706, 1,
-0.2944825, -0.922776, -1.83678, 0, 1, 0.3803922, 1,
-0.2936126, 0.07331136, -0.701084, 0, 1, 0.3882353, 1,
-0.2916111, -0.7735313, -4.516305, 0, 1, 0.3921569, 1,
-0.2852151, -0.05994407, -0.6297803, 0, 1, 0.4, 1,
-0.2814589, 1.112353, -1.548566, 0, 1, 0.4078431, 1,
-0.2790898, -2.742846, -2.319478, 0, 1, 0.4117647, 1,
-0.2789077, -0.5763819, -3.917882, 0, 1, 0.4196078, 1,
-0.2781592, -0.1795132, -1.183588, 0, 1, 0.4235294, 1,
-0.2775196, -0.5235943, -2.816541, 0, 1, 0.4313726, 1,
-0.2764813, 0.4379479, -1.516021, 0, 1, 0.4352941, 1,
-0.2735737, -0.1235814, -2.211, 0, 1, 0.4431373, 1,
-0.2711253, 0.829325, -0.4574546, 0, 1, 0.4470588, 1,
-0.2657529, 0.5805817, -0.6731488, 0, 1, 0.454902, 1,
-0.2604741, -1.406085, -3.100513, 0, 1, 0.4588235, 1,
-0.259745, -0.1564034, -2.565208, 0, 1, 0.4666667, 1,
-0.2589498, 1.277044, -0.8422012, 0, 1, 0.4705882, 1,
-0.2564917, -0.493802, -2.805792, 0, 1, 0.4784314, 1,
-0.251396, -0.178542, -1.124746, 0, 1, 0.4823529, 1,
-0.2508046, -1.106286, -3.187271, 0, 1, 0.4901961, 1,
-0.2494426, 0.2918569, -0.6677769, 0, 1, 0.4941176, 1,
-0.247455, 0.6022661, -1.055159, 0, 1, 0.5019608, 1,
-0.2473744, -2.07982, -0.1380464, 0, 1, 0.509804, 1,
-0.2462681, -1.941742, -2.548393, 0, 1, 0.5137255, 1,
-0.2398988, -0.5130449, -2.1601, 0, 1, 0.5215687, 1,
-0.2362059, 0.3740799, -1.578378, 0, 1, 0.5254902, 1,
-0.2340188, 1.095916, -1.771457, 0, 1, 0.5333334, 1,
-0.2277546, -0.4090312, -3.371834, 0, 1, 0.5372549, 1,
-0.2247663, -1.665439, -3.659216, 0, 1, 0.5450981, 1,
-0.2222052, 0.2602751, -1.468562, 0, 1, 0.5490196, 1,
-0.2065778, -0.07888135, -2.756884, 0, 1, 0.5568628, 1,
-0.1981108, 0.824368, 1.629809, 0, 1, 0.5607843, 1,
-0.1972222, -0.5915219, -1.799405, 0, 1, 0.5686275, 1,
-0.1952043, -0.5147711, -0.7512566, 0, 1, 0.572549, 1,
-0.1872293, 0.124488, -2.006311, 0, 1, 0.5803922, 1,
-0.1846343, 0.3474225, 1.165845, 0, 1, 0.5843138, 1,
-0.1823152, 1.422119, 1.343683, 0, 1, 0.5921569, 1,
-0.1802968, 0.4528371, -0.437435, 0, 1, 0.5960785, 1,
-0.1725032, -0.60014, -1.725865, 0, 1, 0.6039216, 1,
-0.1716017, 1.408205, -0.7186986, 0, 1, 0.6117647, 1,
-0.1710141, -0.6629135, -3.591406, 0, 1, 0.6156863, 1,
-0.1668244, -0.4921899, -3.184242, 0, 1, 0.6235294, 1,
-0.1665046, 1.266483, 0.4445759, 0, 1, 0.627451, 1,
-0.1594894, 0.5603288, -0.01282432, 0, 1, 0.6352941, 1,
-0.1581343, 1.565658, 0.7761186, 0, 1, 0.6392157, 1,
-0.1519357, 0.9612086, -0.6583728, 0, 1, 0.6470588, 1,
-0.1462204, -0.3092251, -2.331598, 0, 1, 0.6509804, 1,
-0.1443294, 1.060382, -0.1741598, 0, 1, 0.6588235, 1,
-0.1354405, 0.5592271, 0.4877702, 0, 1, 0.6627451, 1,
-0.1353485, -1.373436, -2.554353, 0, 1, 0.6705883, 1,
-0.1308551, -1.152887, -3.75432, 0, 1, 0.6745098, 1,
-0.1306145, 1.185975, 0.03098973, 0, 1, 0.682353, 1,
-0.129534, 0.4479805, -1.452381, 0, 1, 0.6862745, 1,
-0.1284846, 0.6269307, -0.9640446, 0, 1, 0.6941177, 1,
-0.1252082, -0.5849079, -4.370254, 0, 1, 0.7019608, 1,
-0.1208545, 1.000493, 1.544701, 0, 1, 0.7058824, 1,
-0.1175296, 1.532748, 1.946172, 0, 1, 0.7137255, 1,
-0.1111188, 1.171717, -1.163554, 0, 1, 0.7176471, 1,
-0.1110755, 0.665538, -1.569118, 0, 1, 0.7254902, 1,
-0.1064688, 1.046552, -0.56598, 0, 1, 0.7294118, 1,
-0.1062725, -0.3632835, -4.363208, 0, 1, 0.7372549, 1,
-0.1056796, 0.3812742, -2.479707, 0, 1, 0.7411765, 1,
-0.1040506, 0.793702, -0.8950433, 0, 1, 0.7490196, 1,
-0.0940235, 0.9468006, -1.060829, 0, 1, 0.7529412, 1,
-0.09361976, -0.4241041, -2.950719, 0, 1, 0.7607843, 1,
-0.09337615, -1.225711, -4.474453, 0, 1, 0.7647059, 1,
-0.09299129, 1.828324, -0.3560263, 0, 1, 0.772549, 1,
-0.09021053, 0.2614337, 0.3611121, 0, 1, 0.7764706, 1,
-0.08939526, -0.25554, -1.68444, 0, 1, 0.7843137, 1,
-0.08763566, 0.8378127, 2.476562, 0, 1, 0.7882353, 1,
-0.08453854, 0.2800921, -1.171127, 0, 1, 0.7960784, 1,
-0.08319172, -1.692694, -1.373886, 0, 1, 0.8039216, 1,
-0.07740577, 1.08478, -0.5222325, 0, 1, 0.8078431, 1,
-0.07665677, -0.3091951, -5.54067, 0, 1, 0.8156863, 1,
-0.07603947, -0.2424489, -2.337429, 0, 1, 0.8196079, 1,
-0.07601536, -0.240176, -1.33942, 0, 1, 0.827451, 1,
-0.07551929, -0.4425337, -4.597034, 0, 1, 0.8313726, 1,
-0.07505732, -1.38769, -4.154365, 0, 1, 0.8392157, 1,
-0.07324688, -0.6353822, -3.856661, 0, 1, 0.8431373, 1,
-0.06858804, -0.5285033, -2.050227, 0, 1, 0.8509804, 1,
-0.06682742, -0.02550337, -0.9558034, 0, 1, 0.854902, 1,
-0.06355716, 1.253127, -1.049226, 0, 1, 0.8627451, 1,
-0.05945225, 0.1331143, -1.218537, 0, 1, 0.8666667, 1,
-0.05565701, -0.3060757, -2.96201, 0, 1, 0.8745098, 1,
-0.05541123, 0.09976228, -0.5979094, 0, 1, 0.8784314, 1,
-0.05449755, -0.3579438, -3.816345, 0, 1, 0.8862745, 1,
-0.05407921, 1.693342, -1.126213, 0, 1, 0.8901961, 1,
-0.05383503, -1.584756, -2.426128, 0, 1, 0.8980392, 1,
-0.05024196, 0.5981097, -1.003623, 0, 1, 0.9058824, 1,
-0.04815901, 1.080617, 0.166552, 0, 1, 0.9098039, 1,
-0.04476537, 1.157549, 0.1559901, 0, 1, 0.9176471, 1,
-0.04297248, 2.001717, -0.7139093, 0, 1, 0.9215686, 1,
-0.04188958, -0.7558146, -4.571622, 0, 1, 0.9294118, 1,
-0.04187886, 1.559318, -0.9934019, 0, 1, 0.9333333, 1,
-0.03865081, 1.270099, 0.5690361, 0, 1, 0.9411765, 1,
-0.03859273, 0.8355585, 1.261765, 0, 1, 0.945098, 1,
-0.03852306, 1.215518, 1.325717, 0, 1, 0.9529412, 1,
-0.03655882, -1.204092, -4.372912, 0, 1, 0.9568627, 1,
-0.03437143, -0.3314275, -1.423331, 0, 1, 0.9647059, 1,
-0.03421882, -1.220686, -4.279828, 0, 1, 0.9686275, 1,
-0.02997764, 0.4360485, 0.793092, 0, 1, 0.9764706, 1,
-0.02924286, 1.743269, -0.6010529, 0, 1, 0.9803922, 1,
-0.02792633, 0.3186909, -0.8022403, 0, 1, 0.9882353, 1,
-0.02158663, -1.076919, -4.064866, 0, 1, 0.9921569, 1,
-0.0204079, 0.7162703, 1.379179, 0, 1, 1, 1,
-0.01530545, 0.02812835, -1.038061, 0, 0.9921569, 1, 1,
-0.01160258, -1.644858, -4.235419, 0, 0.9882353, 1, 1,
-0.01153602, 0.8840054, 0.3844686, 0, 0.9803922, 1, 1,
-0.01143458, -1.750496, -3.292288, 0, 0.9764706, 1, 1,
-0.009336798, 0.4744987, -0.4830981, 0, 0.9686275, 1, 1,
-0.008597304, 0.3808042, -0.6807001, 0, 0.9647059, 1, 1,
-0.003407901, -1.026858, -4.123895, 0, 0.9568627, 1, 1,
-0.0006626288, 1.005459, 1.663679, 0, 0.9529412, 1, 1,
0.0003534968, -0.1023526, 3.78947, 0, 0.945098, 1, 1,
0.001934289, -0.7574238, 2.563951, 0, 0.9411765, 1, 1,
0.002566509, -0.3203824, 2.220574, 0, 0.9333333, 1, 1,
0.00573445, 1.027301, 1.090809, 0, 0.9294118, 1, 1,
0.00583113, 1.2664, 1.81212, 0, 0.9215686, 1, 1,
0.006445882, -0.00920303, 4.26277, 0, 0.9176471, 1, 1,
0.006694857, -1.668106, 1.160596, 0, 0.9098039, 1, 1,
0.01153954, 0.9913058, 0.8434703, 0, 0.9058824, 1, 1,
0.01185583, 0.06325023, 1.229176, 0, 0.8980392, 1, 1,
0.01396486, -0.1696295, 2.68441, 0, 0.8901961, 1, 1,
0.01613208, 0.3941888, -0.7723287, 0, 0.8862745, 1, 1,
0.01644853, 0.4251331, -0.5166483, 0, 0.8784314, 1, 1,
0.01686931, -0.8192723, 3.141984, 0, 0.8745098, 1, 1,
0.01971894, -0.8017225, 4.082598, 0, 0.8666667, 1, 1,
0.02024657, -0.01557104, 1.626091, 0, 0.8627451, 1, 1,
0.02827388, -0.9695609, 3.850763, 0, 0.854902, 1, 1,
0.02993163, 0.5518337, -0.410408, 0, 0.8509804, 1, 1,
0.03385564, 0.8710648, -0.4165542, 0, 0.8431373, 1, 1,
0.03572952, 0.272789, 1.583972, 0, 0.8392157, 1, 1,
0.03718082, -1.334218, 4.236718, 0, 0.8313726, 1, 1,
0.03978538, -2.586209, 2.912668, 0, 0.827451, 1, 1,
0.04041445, -1.099684, 2.214652, 0, 0.8196079, 1, 1,
0.04292953, -0.6009504, 0.9689858, 0, 0.8156863, 1, 1,
0.04305592, -0.01656372, -0.6010215, 0, 0.8078431, 1, 1,
0.04396077, 0.9316712, -0.540366, 0, 0.8039216, 1, 1,
0.04719196, 0.8896294, 2.180222, 0, 0.7960784, 1, 1,
0.04879116, 0.1234809, 1.845888, 0, 0.7882353, 1, 1,
0.05436284, -1.171737, 3.315834, 0, 0.7843137, 1, 1,
0.05459329, 0.5351214, 0.4484047, 0, 0.7764706, 1, 1,
0.05547275, 0.4873142, 2.064802, 0, 0.772549, 1, 1,
0.05734637, 0.93569, -0.162026, 0, 0.7647059, 1, 1,
0.05802927, -0.7184142, 2.417584, 0, 0.7607843, 1, 1,
0.0646881, 1.471828, -0.3562768, 0, 0.7529412, 1, 1,
0.06984527, -0.4597642, 4.168666, 0, 0.7490196, 1, 1,
0.07394548, -1.456035, 4.329416, 0, 0.7411765, 1, 1,
0.07444756, -0.3330586, 3.571016, 0, 0.7372549, 1, 1,
0.07721616, 0.3870764, 0.7734558, 0, 0.7294118, 1, 1,
0.08137734, 2.032897, 0.7644777, 0, 0.7254902, 1, 1,
0.08161894, 1.727198, 1.345382, 0, 0.7176471, 1, 1,
0.08245628, -0.6481579, 2.715227, 0, 0.7137255, 1, 1,
0.08391654, -0.30011, 3.350973, 0, 0.7058824, 1, 1,
0.08476353, 0.8415714, 0.1684675, 0, 0.6980392, 1, 1,
0.08490065, -0.2521227, 2.172247, 0, 0.6941177, 1, 1,
0.08564164, 0.6846123, 1.89791, 0, 0.6862745, 1, 1,
0.08632064, 1.39413, 0.1276105, 0, 0.682353, 1, 1,
0.08689275, -0.8253981, 4.026394, 0, 0.6745098, 1, 1,
0.08788902, -1.531681, 3.107252, 0, 0.6705883, 1, 1,
0.09907074, -0.7613365, 3.718827, 0, 0.6627451, 1, 1,
0.09935738, 1.60354, 0.9252877, 0, 0.6588235, 1, 1,
0.1072159, 0.2283787, 1.45528, 0, 0.6509804, 1, 1,
0.1103595, 0.937876, -0.7533789, 0, 0.6470588, 1, 1,
0.1133562, 0.7565109, 0.02776986, 0, 0.6392157, 1, 1,
0.1147309, 0.145771, 1.221579, 0, 0.6352941, 1, 1,
0.1156528, 0.01397172, 2.443308, 0, 0.627451, 1, 1,
0.1177233, -2.793543, 3.128241, 0, 0.6235294, 1, 1,
0.1206291, 0.1149324, 0.189414, 0, 0.6156863, 1, 1,
0.1273791, 0.8284199, 1.643234, 0, 0.6117647, 1, 1,
0.1359511, 0.410951, 1.022261, 0, 0.6039216, 1, 1,
0.1391965, -1.211697, 3.137916, 0, 0.5960785, 1, 1,
0.1408685, 0.2558831, 0.9593214, 0, 0.5921569, 1, 1,
0.1429857, 0.08907481, 0.6910079, 0, 0.5843138, 1, 1,
0.1538536, -0.7082919, 1.451661, 0, 0.5803922, 1, 1,
0.1546679, -0.3206225, 2.358678, 0, 0.572549, 1, 1,
0.1600247, -0.4795987, 4.77622, 0, 0.5686275, 1, 1,
0.1637489, -0.03174631, 4.000594, 0, 0.5607843, 1, 1,
0.1638464, 0.09683881, 0.7376587, 0, 0.5568628, 1, 1,
0.1640073, -0.9890515, 2.962315, 0, 0.5490196, 1, 1,
0.168656, 0.08548669, 2.631254, 0, 0.5450981, 1, 1,
0.1693556, 1.752739, -1.104037, 0, 0.5372549, 1, 1,
0.1702506, 0.7834456, -0.6844578, 0, 0.5333334, 1, 1,
0.1702959, 1.27177, 0.5918406, 0, 0.5254902, 1, 1,
0.1719505, -0.8686529, 2.915567, 0, 0.5215687, 1, 1,
0.1798724, -0.6278211, 2.907053, 0, 0.5137255, 1, 1,
0.1844137, -0.7052054, 3.421332, 0, 0.509804, 1, 1,
0.1903377, 0.3141837, 3.030299, 0, 0.5019608, 1, 1,
0.1914217, 0.2094278, 0.01485043, 0, 0.4941176, 1, 1,
0.1921768, 0.3381686, 0.7522613, 0, 0.4901961, 1, 1,
0.1949678, 1.206651, 0.5055861, 0, 0.4823529, 1, 1,
0.1953023, 2.266548, -1.016355, 0, 0.4784314, 1, 1,
0.1970387, 0.07144319, 1.378832, 0, 0.4705882, 1, 1,
0.1991204, -1.346987, 4.619047, 0, 0.4666667, 1, 1,
0.1996799, -0.6426599, 2.857478, 0, 0.4588235, 1, 1,
0.2000768, 0.9688182, 0.05450924, 0, 0.454902, 1, 1,
0.2004147, 0.9626977, -1.537735, 0, 0.4470588, 1, 1,
0.2058415, 1.166243, 1.109039, 0, 0.4431373, 1, 1,
0.2089188, 2.295528, -0.3034067, 0, 0.4352941, 1, 1,
0.2089735, 1.915107, 0.7483675, 0, 0.4313726, 1, 1,
0.213824, -0.2332392, 4.07675, 0, 0.4235294, 1, 1,
0.2155698, 1.176214, 0.9643313, 0, 0.4196078, 1, 1,
0.215889, 1.866154, -0.2829674, 0, 0.4117647, 1, 1,
0.2167837, 0.08339161, 1.637458, 0, 0.4078431, 1, 1,
0.2218437, -0.5334539, 1.510427, 0, 0.4, 1, 1,
0.2236544, -0.7095811, 3.538845, 0, 0.3921569, 1, 1,
0.2289298, -0.08613368, 2.312914, 0, 0.3882353, 1, 1,
0.230771, 0.826748, -0.8926754, 0, 0.3803922, 1, 1,
0.2314156, 0.7007035, -0.7955799, 0, 0.3764706, 1, 1,
0.2325201, -0.7451444, 3.824795, 0, 0.3686275, 1, 1,
0.2354262, 1.254826, -1.182666, 0, 0.3647059, 1, 1,
0.2372932, -0.3984601, 1.486549, 0, 0.3568628, 1, 1,
0.2387046, 0.2291039, 0.8390253, 0, 0.3529412, 1, 1,
0.2442515, -1.557953, 2.880618, 0, 0.345098, 1, 1,
0.2505318, 1.695247, 1.243518, 0, 0.3411765, 1, 1,
0.2510884, 0.2304429, -0.4576071, 0, 0.3333333, 1, 1,
0.2625871, 0.2018574, 0.4385557, 0, 0.3294118, 1, 1,
0.267215, -0.5035003, 2.402214, 0, 0.3215686, 1, 1,
0.2672859, -0.7640446, 2.64898, 0, 0.3176471, 1, 1,
0.2701464, -0.729916, 1.588606, 0, 0.3098039, 1, 1,
0.2718148, -0.6086251, 3.769972, 0, 0.3058824, 1, 1,
0.2739763, 0.5510314, 2.34989, 0, 0.2980392, 1, 1,
0.2770649, -2.208557, 3.16912, 0, 0.2901961, 1, 1,
0.2772254, 1.43587, -0.5282641, 0, 0.2862745, 1, 1,
0.2813929, 1.460237, 0.2186431, 0, 0.2784314, 1, 1,
0.2827301, 0.6333637, 0.9892558, 0, 0.2745098, 1, 1,
0.2861809, -0.2180345, 1.978476, 0, 0.2666667, 1, 1,
0.2863214, -1.037945, 3.762753, 0, 0.2627451, 1, 1,
0.2888225, 1.221653, -0.6735926, 0, 0.254902, 1, 1,
0.2888806, 0.1684712, 1.166603, 0, 0.2509804, 1, 1,
0.2989251, -0.8605988, 2.68765, 0, 0.2431373, 1, 1,
0.3013764, -0.7356677, 3.341844, 0, 0.2392157, 1, 1,
0.302049, -1.476226, 2.284141, 0, 0.2313726, 1, 1,
0.3064821, -0.4563164, 1.459681, 0, 0.227451, 1, 1,
0.3111309, 2.287707, -0.2356391, 0, 0.2196078, 1, 1,
0.314584, -0.02570848, 1.810938, 0, 0.2156863, 1, 1,
0.3146811, -0.1043897, 2.01216, 0, 0.2078431, 1, 1,
0.3152931, 1.151922, -0.5374576, 0, 0.2039216, 1, 1,
0.3165811, -1.109555, 3.687944, 0, 0.1960784, 1, 1,
0.3188079, 0.03204359, 1.674202, 0, 0.1882353, 1, 1,
0.3192398, -1.196129, 3.72713, 0, 0.1843137, 1, 1,
0.322153, -0.2563263, 1.097033, 0, 0.1764706, 1, 1,
0.3247834, -0.4130274, 2.807196, 0, 0.172549, 1, 1,
0.3356051, -0.3048806, 3.657429, 0, 0.1647059, 1, 1,
0.337254, 0.8643225, -0.8286192, 0, 0.1607843, 1, 1,
0.3402944, 0.9103089, -0.03109221, 0, 0.1529412, 1, 1,
0.342747, -0.8905619, 2.31136, 0, 0.1490196, 1, 1,
0.3431287, -0.07663288, 2.816016, 0, 0.1411765, 1, 1,
0.3522703, 0.5301784, 0.7421528, 0, 0.1372549, 1, 1,
0.3529005, 0.04815137, 2.814438, 0, 0.1294118, 1, 1,
0.3569643, -0.326391, 3.313554, 0, 0.1254902, 1, 1,
0.3588634, -0.522193, 1.683791, 0, 0.1176471, 1, 1,
0.3593954, -0.7893659, 1.842612, 0, 0.1137255, 1, 1,
0.3605405, 0.7410381, -0.07821279, 0, 0.1058824, 1, 1,
0.3627358, -0.9269281, 5.618593, 0, 0.09803922, 1, 1,
0.3643421, -0.9285239, 2.521466, 0, 0.09411765, 1, 1,
0.3647114, 1.160612, -1.481441, 0, 0.08627451, 1, 1,
0.367007, 0.5520511, 1.291738, 0, 0.08235294, 1, 1,
0.3710399, -2.407377, 3.395195, 0, 0.07450981, 1, 1,
0.3716045, -0.09586412, 1.181622, 0, 0.07058824, 1, 1,
0.3716112, -0.1063358, 0.9186492, 0, 0.0627451, 1, 1,
0.3756814, -1.054145, 1.719614, 0, 0.05882353, 1, 1,
0.3764361, -2.512521, 4.189692, 0, 0.05098039, 1, 1,
0.3769125, -0.1804021, 3.53785, 0, 0.04705882, 1, 1,
0.3779601, 0.958694, -0.2599659, 0, 0.03921569, 1, 1,
0.3789523, -0.1711287, 1.602854, 0, 0.03529412, 1, 1,
0.38375, -0.8488119, 1.431944, 0, 0.02745098, 1, 1,
0.3866787, -0.3154443, 2.350291, 0, 0.02352941, 1, 1,
0.3896351, 0.3731537, 1.12311, 0, 0.01568628, 1, 1,
0.3938315, 0.5624303, 1.723366, 0, 0.01176471, 1, 1,
0.3944144, 1.116253, -0.39699, 0, 0.003921569, 1, 1,
0.4012863, 1.071118, -1.0446, 0.003921569, 0, 1, 1,
0.4018982, -1.539564, 3.07387, 0.007843138, 0, 1, 1,
0.4036058, -1.066285, 3.414325, 0.01568628, 0, 1, 1,
0.4141232, 0.2723846, 1.381847, 0.01960784, 0, 1, 1,
0.4155644, -0.6767843, 3.525721, 0.02745098, 0, 1, 1,
0.4165927, 1.446984, 0.6116744, 0.03137255, 0, 1, 1,
0.4207526, -0.5322794, 0.8095642, 0.03921569, 0, 1, 1,
0.4265725, 2.467258, 0.04875767, 0.04313726, 0, 1, 1,
0.435602, 0.1767576, 0.9680247, 0.05098039, 0, 1, 1,
0.4389333, 0.1683911, 1.781972, 0.05490196, 0, 1, 1,
0.4400192, -0.1135361, 3.929378, 0.0627451, 0, 1, 1,
0.4423945, -1.478227, 2.110127, 0.06666667, 0, 1, 1,
0.4456039, 1.396458, 2.193331, 0.07450981, 0, 1, 1,
0.4459581, -0.5564907, 3.148271, 0.07843138, 0, 1, 1,
0.4485131, -1.946391, 1.997924, 0.08627451, 0, 1, 1,
0.4513371, 1.223163, 0.5868239, 0.09019608, 0, 1, 1,
0.4583947, -0.6338881, 2.30959, 0.09803922, 0, 1, 1,
0.4591157, 0.5499158, 0.1716944, 0.1058824, 0, 1, 1,
0.460343, -0.2673446, 4.813051, 0.1098039, 0, 1, 1,
0.4610274, 0.8742126, 1.49923, 0.1176471, 0, 1, 1,
0.4616765, -0.2591106, 0.9244946, 0.1215686, 0, 1, 1,
0.4629119, 0.5066921, 0.7319264, 0.1294118, 0, 1, 1,
0.464519, 1.080047, 1.38372, 0.1333333, 0, 1, 1,
0.4677887, 1.677341, -0.3129696, 0.1411765, 0, 1, 1,
0.4681524, 0.1601031, 1.990493, 0.145098, 0, 1, 1,
0.4683122, -0.2771907, 1.503407, 0.1529412, 0, 1, 1,
0.4708624, 2.394698, 0.5268011, 0.1568628, 0, 1, 1,
0.4748369, 1.565585, -0.5136808, 0.1647059, 0, 1, 1,
0.4783117, -0.04829902, 0.7883447, 0.1686275, 0, 1, 1,
0.4789197, -1.962404, 3.675249, 0.1764706, 0, 1, 1,
0.4814851, 0.1329306, 1.652379, 0.1803922, 0, 1, 1,
0.4871685, 1.33902, 1.631209, 0.1882353, 0, 1, 1,
0.4878914, 0.8652821, -0.3674709, 0.1921569, 0, 1, 1,
0.4882666, -0.3662007, 2.787968, 0.2, 0, 1, 1,
0.4904485, -0.4530088, 2.434566, 0.2078431, 0, 1, 1,
0.4926394, 0.08518501, 1.063861, 0.2117647, 0, 1, 1,
0.4939648, -0.7428377, 5.251355, 0.2196078, 0, 1, 1,
0.4959742, 1.261209, 1.343277, 0.2235294, 0, 1, 1,
0.5002507, 0.6478788, 0.9183776, 0.2313726, 0, 1, 1,
0.5003319, 1.383248, 0.5104119, 0.2352941, 0, 1, 1,
0.5017298, 0.04397825, 1.862411, 0.2431373, 0, 1, 1,
0.5214981, 1.246347, -0.3854072, 0.2470588, 0, 1, 1,
0.5225689, -2.076028, 4.130722, 0.254902, 0, 1, 1,
0.5261068, 0.04266318, 1.890793, 0.2588235, 0, 1, 1,
0.5376556, -0.02788523, 0.3611024, 0.2666667, 0, 1, 1,
0.5401521, -0.05804734, 0.5083235, 0.2705882, 0, 1, 1,
0.5435736, -0.1423873, 1.811199, 0.2784314, 0, 1, 1,
0.5451995, 1.540797, -0.6551614, 0.282353, 0, 1, 1,
0.5487034, 0.2290933, 0.03729055, 0.2901961, 0, 1, 1,
0.5490427, 0.2915111, 2.719712, 0.2941177, 0, 1, 1,
0.549237, -0.5425642, 1.812699, 0.3019608, 0, 1, 1,
0.5497536, 1.235438, -0.8989513, 0.3098039, 0, 1, 1,
0.5590801, 0.1917498, -2.893281, 0.3137255, 0, 1, 1,
0.5611822, -0.9665104, 1.997897, 0.3215686, 0, 1, 1,
0.5631897, -1.47249, 2.9759, 0.3254902, 0, 1, 1,
0.5771597, -0.1836445, 2.119871, 0.3333333, 0, 1, 1,
0.5819819, -1.264259, 4.46989, 0.3372549, 0, 1, 1,
0.5822951, 0.1869921, 0.5904424, 0.345098, 0, 1, 1,
0.5849323, 0.3049064, 2.713362, 0.3490196, 0, 1, 1,
0.585236, 0.1423515, 1.472652, 0.3568628, 0, 1, 1,
0.5899141, -0.3300503, 2.340499, 0.3607843, 0, 1, 1,
0.5936415, 1.525811, 1.803133, 0.3686275, 0, 1, 1,
0.5944721, -1.59591, 2.115025, 0.372549, 0, 1, 1,
0.5967745, -0.4752218, 2.170918, 0.3803922, 0, 1, 1,
0.5987868, -0.9729562, 2.222265, 0.3843137, 0, 1, 1,
0.6060313, 0.2469746, 0.9550219, 0.3921569, 0, 1, 1,
0.6068461, -0.6660958, 2.459375, 0.3960784, 0, 1, 1,
0.6085834, 0.7491016, 1.691728, 0.4039216, 0, 1, 1,
0.6143827, -1.442797, 3.838217, 0.4117647, 0, 1, 1,
0.6155345, 1.382333, 0.1733874, 0.4156863, 0, 1, 1,
0.6170513, -0.5524426, 2.282769, 0.4235294, 0, 1, 1,
0.6222168, -1.934983, 3.047113, 0.427451, 0, 1, 1,
0.6226043, -0.0385583, 0.4346837, 0.4352941, 0, 1, 1,
0.6258054, 0.01127798, 1.38998, 0.4392157, 0, 1, 1,
0.6292488, 1.031508, 0.2647475, 0.4470588, 0, 1, 1,
0.6293262, -0.4292412, 3.092059, 0.4509804, 0, 1, 1,
0.6334762, -0.5698665, 2.430025, 0.4588235, 0, 1, 1,
0.6356314, -0.4288122, 2.126186, 0.4627451, 0, 1, 1,
0.6359833, 1.353242, 0.7941347, 0.4705882, 0, 1, 1,
0.6377042, -0.4266183, 1.963365, 0.4745098, 0, 1, 1,
0.6386086, 1.259884, -0.1932168, 0.4823529, 0, 1, 1,
0.648759, 0.5535905, 0.287419, 0.4862745, 0, 1, 1,
0.649812, 0.9402726, 0.9182669, 0.4941176, 0, 1, 1,
0.6572764, -0.890218, 2.981895, 0.5019608, 0, 1, 1,
0.6656312, -0.08697551, 4.309691, 0.5058824, 0, 1, 1,
0.6739025, -0.06018965, 1.411848, 0.5137255, 0, 1, 1,
0.6745154, -0.8730399, 2.784428, 0.5176471, 0, 1, 1,
0.6755276, 0.4288733, -0.1528767, 0.5254902, 0, 1, 1,
0.67813, 2.665851, -0.1658102, 0.5294118, 0, 1, 1,
0.6819981, -1.093016, 2.867979, 0.5372549, 0, 1, 1,
0.6846086, -0.6319541, 2.828131, 0.5411765, 0, 1, 1,
0.690662, 0.3194892, 2.536155, 0.5490196, 0, 1, 1,
0.692342, 1.012483, 1.882628, 0.5529412, 0, 1, 1,
0.6936858, -0.3247517, 3.575088, 0.5607843, 0, 1, 1,
0.7003847, -1.314438, 2.158251, 0.5647059, 0, 1, 1,
0.7033213, 0.5845895, 1.941994, 0.572549, 0, 1, 1,
0.7050915, -0.8064194, 2.467285, 0.5764706, 0, 1, 1,
0.7053104, 1.967456, -0.1115819, 0.5843138, 0, 1, 1,
0.7056015, 0.8438844, 0.7336402, 0.5882353, 0, 1, 1,
0.7085198, -0.3895932, 2.25233, 0.5960785, 0, 1, 1,
0.7086803, 0.7979531, 0.09301615, 0.6039216, 0, 1, 1,
0.7135638, -1.512665, 3.753289, 0.6078432, 0, 1, 1,
0.7161408, 0.4710411, 0.6862914, 0.6156863, 0, 1, 1,
0.7204084, 0.7511488, 1.320188, 0.6196079, 0, 1, 1,
0.732869, -0.7527345, 0.2158984, 0.627451, 0, 1, 1,
0.735236, 0.8443277, 2.454173, 0.6313726, 0, 1, 1,
0.7388391, -1.323348, 3.299741, 0.6392157, 0, 1, 1,
0.7401798, 1.145677, -0.03912702, 0.6431373, 0, 1, 1,
0.7451054, -0.6403162, 1.781084, 0.6509804, 0, 1, 1,
0.7457761, -0.2555797, 2.82881, 0.654902, 0, 1, 1,
0.7470042, 0.5936164, 1.150372, 0.6627451, 0, 1, 1,
0.7517862, -0.372476, 1.451899, 0.6666667, 0, 1, 1,
0.7551648, 0.03401116, 1.099382, 0.6745098, 0, 1, 1,
0.7555557, -1.309261, 1.703904, 0.6784314, 0, 1, 1,
0.7615584, -1.029603, 2.763125, 0.6862745, 0, 1, 1,
0.7616195, 0.1440483, 2.112199, 0.6901961, 0, 1, 1,
0.7638796, -0.7721543, 1.042425, 0.6980392, 0, 1, 1,
0.7678234, -2.81782, 2.595147, 0.7058824, 0, 1, 1,
0.7701952, 2.285208, -1.686743, 0.7098039, 0, 1, 1,
0.7704449, -0.6666226, 2.991291, 0.7176471, 0, 1, 1,
0.7726924, -0.4431902, 2.903579, 0.7215686, 0, 1, 1,
0.7728722, 1.394119, 1.922557, 0.7294118, 0, 1, 1,
0.7730873, -0.4930967, 2.389136, 0.7333333, 0, 1, 1,
0.7737688, -0.4572714, 1.998316, 0.7411765, 0, 1, 1,
0.7739821, 0.8722183, 1.959923, 0.7450981, 0, 1, 1,
0.7756653, -0.133119, 2.202971, 0.7529412, 0, 1, 1,
0.7761291, 0.9176412, 0.464093, 0.7568628, 0, 1, 1,
0.7818367, -0.5079068, 0.8054286, 0.7647059, 0, 1, 1,
0.7855315, 2.228229, -1.170489, 0.7686275, 0, 1, 1,
0.8099404, -0.8528866, 0.6581254, 0.7764706, 0, 1, 1,
0.8104697, 0.4559125, 2.018667, 0.7803922, 0, 1, 1,
0.8139253, -0.8929582, 2.578426, 0.7882353, 0, 1, 1,
0.8173911, -0.06788433, 1.804993, 0.7921569, 0, 1, 1,
0.8180694, 1.782088, -0.226823, 0.8, 0, 1, 1,
0.8203922, 0.635199, 1.215999, 0.8078431, 0, 1, 1,
0.8209491, 0.8177366, 0.9648736, 0.8117647, 0, 1, 1,
0.8221496, -0.5332093, 1.1182, 0.8196079, 0, 1, 1,
0.8225495, 1.13206, -0.03458177, 0.8235294, 0, 1, 1,
0.8277341, 0.2175749, 2.085398, 0.8313726, 0, 1, 1,
0.8293781, 0.6611865, -0.4007933, 0.8352941, 0, 1, 1,
0.8376647, -1.126288, 1.65566, 0.8431373, 0, 1, 1,
0.8461348, -0.5320216, 1.141553, 0.8470588, 0, 1, 1,
0.8461619, 0.5729351, -0.09631509, 0.854902, 0, 1, 1,
0.8466413, -0.2739257, 0.1379156, 0.8588235, 0, 1, 1,
0.8547574, 2.295019, 0.9955969, 0.8666667, 0, 1, 1,
0.860135, -0.691616, 2.644444, 0.8705882, 0, 1, 1,
0.8608286, -0.5029566, 2.531814, 0.8784314, 0, 1, 1,
0.8611536, 1.191024, 0.7844025, 0.8823529, 0, 1, 1,
0.8618903, -0.6162174, 2.892738, 0.8901961, 0, 1, 1,
0.8626209, 1.270793, 0.8902042, 0.8941177, 0, 1, 1,
0.8631931, -0.553185, 2.276193, 0.9019608, 0, 1, 1,
0.8668373, 0.8941057, 1.856515, 0.9098039, 0, 1, 1,
0.8688033, -0.3770801, 1.981928, 0.9137255, 0, 1, 1,
0.8714966, 0.04949973, 1.667118, 0.9215686, 0, 1, 1,
0.8753587, 0.9013888, 1.71471, 0.9254902, 0, 1, 1,
0.8782216, 1.486169, -1.529235, 0.9333333, 0, 1, 1,
0.8783148, 0.5360774, 2.004785, 0.9372549, 0, 1, 1,
0.8869696, -1.51278, 2.266042, 0.945098, 0, 1, 1,
0.8878255, 0.7662838, 0.4769381, 0.9490196, 0, 1, 1,
0.8889749, 0.07837301, 0.5936221, 0.9568627, 0, 1, 1,
0.8934753, 1.280581, 0.6341035, 0.9607843, 0, 1, 1,
0.9006784, -0.5828965, 2.745566, 0.9686275, 0, 1, 1,
0.9062688, -0.3019032, 2.935457, 0.972549, 0, 1, 1,
0.9159505, -1.299319, 2.455569, 0.9803922, 0, 1, 1,
0.9259331, -0.5518692, 3.22643, 0.9843137, 0, 1, 1,
0.9322976, 0.2220173, 1.536069, 0.9921569, 0, 1, 1,
0.93262, -1.643285, 1.304253, 0.9960784, 0, 1, 1,
0.9380418, 0.8196104, 1.920512, 1, 0, 0.9960784, 1,
0.9431742, -3.32019, 2.136721, 1, 0, 0.9882353, 1,
0.9438639, 1.112306, -0.6788822, 1, 0, 0.9843137, 1,
0.9548959, 0.05556812, 2.349631, 1, 0, 0.9764706, 1,
0.9549976, 0.2774269, 1.066027, 1, 0, 0.972549, 1,
0.9553314, 0.9106866, 1.449576, 1, 0, 0.9647059, 1,
0.9590977, 1.196815, 0.4784313, 1, 0, 0.9607843, 1,
0.9622681, -0.7486775, 1.446326, 1, 0, 0.9529412, 1,
0.9658965, -2.427379, 3.83859, 1, 0, 0.9490196, 1,
0.9790792, 0.5726375, 1.389439, 1, 0, 0.9411765, 1,
0.9797594, -0.6587746, 1.885628, 1, 0, 0.9372549, 1,
0.9845281, 1.563136, 1.616443, 1, 0, 0.9294118, 1,
0.9847569, 2.383888, -0.001619679, 1, 0, 0.9254902, 1,
0.9868912, -0.04262559, 2.265381, 1, 0, 0.9176471, 1,
0.9911237, -0.2954466, 2.411194, 1, 0, 0.9137255, 1,
1.001264, 0.25668, 2.014044, 1, 0, 0.9058824, 1,
1.007932, -0.2326143, 0.546799, 1, 0, 0.9019608, 1,
1.01648, 0.5550861, 0.4729789, 1, 0, 0.8941177, 1,
1.018233, -0.03699095, 1.664329, 1, 0, 0.8862745, 1,
1.024028, 0.5249274, 0.3481329, 1, 0, 0.8823529, 1,
1.038597, -1.165147, 3.390166, 1, 0, 0.8745098, 1,
1.049397, -0.09837968, 2.045005, 1, 0, 0.8705882, 1,
1.054959, 0.2820486, 1.068462, 1, 0, 0.8627451, 1,
1.056087, -0.4973442, 2.147416, 1, 0, 0.8588235, 1,
1.063907, -0.0791475, 0.8938162, 1, 0, 0.8509804, 1,
1.067792, 0.008002257, 0.810561, 1, 0, 0.8470588, 1,
1.069118, -0.7804646, 2.944944, 1, 0, 0.8392157, 1,
1.07091, -0.6635748, 2.786998, 1, 0, 0.8352941, 1,
1.074357, -0.1205955, 0.02500955, 1, 0, 0.827451, 1,
1.074499, 0.4266509, 0.5157296, 1, 0, 0.8235294, 1,
1.079716, 0.5774936, 1.187107, 1, 0, 0.8156863, 1,
1.083702, 0.8568217, 0.01968484, 1, 0, 0.8117647, 1,
1.085158, 0.1689679, 1.293733, 1, 0, 0.8039216, 1,
1.08584, 0.4621726, 2.35735, 1, 0, 0.7960784, 1,
1.100058, -0.1502612, 0.400035, 1, 0, 0.7921569, 1,
1.10022, -0.3037671, 1.205299, 1, 0, 0.7843137, 1,
1.10272, -1.568816, 2.438215, 1, 0, 0.7803922, 1,
1.104577, 0.244869, 1.656621, 1, 0, 0.772549, 1,
1.115894, -0.5704612, 2.676981, 1, 0, 0.7686275, 1,
1.120142, -1.016529, 0.8762257, 1, 0, 0.7607843, 1,
1.137829, -0.4091472, 1.06257, 1, 0, 0.7568628, 1,
1.145802, -1.92119, 1.943845, 1, 0, 0.7490196, 1,
1.152264, 0.4294574, 0.5444883, 1, 0, 0.7450981, 1,
1.156483, -2.101552, 4.174231, 1, 0, 0.7372549, 1,
1.166938, 1.179127, 2.02629, 1, 0, 0.7333333, 1,
1.168841, 1.079059, 0.8472971, 1, 0, 0.7254902, 1,
1.172442, -0.9492866, 3.212246, 1, 0, 0.7215686, 1,
1.173877, -0.7396364, 2.509156, 1, 0, 0.7137255, 1,
1.173937, 1.181907, -1.000657, 1, 0, 0.7098039, 1,
1.183418, 1.923362, 0.3772261, 1, 0, 0.7019608, 1,
1.183611, 1.68286, -0.5920604, 1, 0, 0.6941177, 1,
1.184244, -0.9259821, 1.106464, 1, 0, 0.6901961, 1,
1.184912, -0.6657865, 0.9007615, 1, 0, 0.682353, 1,
1.200728, 3.297569, -2.407178, 1, 0, 0.6784314, 1,
1.201348, 0.310955, 0.8264938, 1, 0, 0.6705883, 1,
1.209248, -1.258636, 2.931469, 1, 0, 0.6666667, 1,
1.219633, -0.1886623, 2.098553, 1, 0, 0.6588235, 1,
1.224996, 0.8141519, 1.835082, 1, 0, 0.654902, 1,
1.228031, 0.7446944, -0.5324743, 1, 0, 0.6470588, 1,
1.235681, -0.5072449, 2.795581, 1, 0, 0.6431373, 1,
1.239428, -1.33999, 2.968119, 1, 0, 0.6352941, 1,
1.253948, -1.163199, 2.939341, 1, 0, 0.6313726, 1,
1.26704, 0.05812779, 2.724367, 1, 0, 0.6235294, 1,
1.275589, -0.6908557, 1.850378, 1, 0, 0.6196079, 1,
1.276448, 0.05140786, 1.175127, 1, 0, 0.6117647, 1,
1.281748, 0.9191074, 1.344668, 1, 0, 0.6078432, 1,
1.292187, 0.5554513, -0.4541692, 1, 0, 0.6, 1,
1.29358, 0.2220242, 1.606877, 1, 0, 0.5921569, 1,
1.308922, 0.9255083, 1.053944, 1, 0, 0.5882353, 1,
1.313757, 0.4578615, 0.9659783, 1, 0, 0.5803922, 1,
1.318702, 0.5515777, 2.329018, 1, 0, 0.5764706, 1,
1.321064, -0.5306599, 2.994706, 1, 0, 0.5686275, 1,
1.322799, -1.418893, 3.524305, 1, 0, 0.5647059, 1,
1.340017, 0.5654433, 1.841822, 1, 0, 0.5568628, 1,
1.349886, 1.723604, -1.887332, 1, 0, 0.5529412, 1,
1.352936, -1.002083, 0.6407316, 1, 0, 0.5450981, 1,
1.355167, -1.8217, 2.804043, 1, 0, 0.5411765, 1,
1.355887, 0.6498794, 1.558942, 1, 0, 0.5333334, 1,
1.368118, -0.9452732, 1.571419, 1, 0, 0.5294118, 1,
1.369941, 0.8757089, 0.2103443, 1, 0, 0.5215687, 1,
1.375406, -0.8732867, 2.611794, 1, 0, 0.5176471, 1,
1.379761, -0.1673765, 2.141958, 1, 0, 0.509804, 1,
1.381956, -1.525862, 3.844013, 1, 0, 0.5058824, 1,
1.396454, 0.1800478, 1.619134, 1, 0, 0.4980392, 1,
1.39752, 1.013927, 2.582178, 1, 0, 0.4901961, 1,
1.398424, 2.269531, -0.01127089, 1, 0, 0.4862745, 1,
1.403393, 0.8570966, -0.01227029, 1, 0, 0.4784314, 1,
1.409138, -0.8299647, 1.43327, 1, 0, 0.4745098, 1,
1.420826, -1.616804, 2.506525, 1, 0, 0.4666667, 1,
1.430804, -0.7935141, 0.4304748, 1, 0, 0.4627451, 1,
1.432702, -1.120481, 1.863219, 1, 0, 0.454902, 1,
1.45626, 0.5872284, -0.7889591, 1, 0, 0.4509804, 1,
1.470426, 0.1072681, 2.071638, 1, 0, 0.4431373, 1,
1.471853, 0.693708, 1.395053, 1, 0, 0.4392157, 1,
1.49439, 0.9591054, 0.7012619, 1, 0, 0.4313726, 1,
1.498251, 0.3969265, 1.563325, 1, 0, 0.427451, 1,
1.500436, -0.3678753, 2.693938, 1, 0, 0.4196078, 1,
1.509017, -0.4186436, -0.4091751, 1, 0, 0.4156863, 1,
1.510864, -0.2049331, 0.784921, 1, 0, 0.4078431, 1,
1.515316, 0.516876, 1.432387, 1, 0, 0.4039216, 1,
1.534539, -0.8832804, 0.5128545, 1, 0, 0.3960784, 1,
1.543961, 0.9952304, -0.2891735, 1, 0, 0.3882353, 1,
1.547845, 0.912829, 1.04428, 1, 0, 0.3843137, 1,
1.547899, -0.4397761, -0.5768923, 1, 0, 0.3764706, 1,
1.557634, -0.5533398, 1.422576, 1, 0, 0.372549, 1,
1.57858, -0.01568596, 1.453651, 1, 0, 0.3647059, 1,
1.591568, 0.005034598, 2.470088, 1, 0, 0.3607843, 1,
1.593581, -1.303013, 2.736627, 1, 0, 0.3529412, 1,
1.594214, -0.02263631, 2.782693, 1, 0, 0.3490196, 1,
1.606775, 1.608939, 0.6438118, 1, 0, 0.3411765, 1,
1.625745, -0.1904841, 1.489223, 1, 0, 0.3372549, 1,
1.631068, -0.1949569, 0.3720625, 1, 0, 0.3294118, 1,
1.636486, -0.5848646, 1.063434, 1, 0, 0.3254902, 1,
1.646646, -1.435284, 2.402263, 1, 0, 0.3176471, 1,
1.656641, 0.04402602, 3.74752, 1, 0, 0.3137255, 1,
1.656976, -1.114964, 1.919823, 1, 0, 0.3058824, 1,
1.657673, 1.366129, 0.1018569, 1, 0, 0.2980392, 1,
1.667345, 0.4987091, 1.696236, 1, 0, 0.2941177, 1,
1.668674, -0.5710272, 1.921979, 1, 0, 0.2862745, 1,
1.686155, -0.1537279, 1.893694, 1, 0, 0.282353, 1,
1.691772, 0.9433351, 1.400021, 1, 0, 0.2745098, 1,
1.700649, -1.726673, 2.368302, 1, 0, 0.2705882, 1,
1.74225, -1.576285, 2.557518, 1, 0, 0.2627451, 1,
1.743785, -0.2408623, 0.447497, 1, 0, 0.2588235, 1,
1.772071, 0.009953001, 0.9302347, 1, 0, 0.2509804, 1,
1.77325, -0.6647261, 1.74887, 1, 0, 0.2470588, 1,
1.798606, -1.437081, 1.845444, 1, 0, 0.2392157, 1,
1.805323, 1.921412, 1.196128, 1, 0, 0.2352941, 1,
1.805835, -1.635617, 2.698116, 1, 0, 0.227451, 1,
1.826916, -0.1487021, 2.386977, 1, 0, 0.2235294, 1,
1.837072, 1.193335, 2.599457, 1, 0, 0.2156863, 1,
1.840701, 0.4973519, 2.218261, 1, 0, 0.2117647, 1,
1.842899, 0.5761282, -0.03758407, 1, 0, 0.2039216, 1,
1.843054, 0.5011322, 1.862997, 1, 0, 0.1960784, 1,
1.851995, 0.5740384, 1.436915, 1, 0, 0.1921569, 1,
1.918628, 1.481158, 1.275302, 1, 0, 0.1843137, 1,
1.92678, -0.6680164, 1.379936, 1, 0, 0.1803922, 1,
1.935408, 0.6187155, 0.7735323, 1, 0, 0.172549, 1,
1.936291, 0.8763079, 0.2432649, 1, 0, 0.1686275, 1,
1.950336, 1.849781, 0.5939021, 1, 0, 0.1607843, 1,
1.980694, -0.167221, 2.075772, 1, 0, 0.1568628, 1,
1.999562, 0.5884764, 0.7370474, 1, 0, 0.1490196, 1,
2.021953, -1.085278, 1.567042, 1, 0, 0.145098, 1,
2.048661, 0.8308174, 2.13554, 1, 0, 0.1372549, 1,
2.057811, -0.03539455, 2.028141, 1, 0, 0.1333333, 1,
2.060854, -0.9782352, 1.288026, 1, 0, 0.1254902, 1,
2.068504, 0.005682368, 0.3312112, 1, 0, 0.1215686, 1,
2.072646, 0.9506285, 1.156001, 1, 0, 0.1137255, 1,
2.148483, -0.01742301, 1.41473, 1, 0, 0.1098039, 1,
2.215711, -0.01475975, 0.7643417, 1, 0, 0.1019608, 1,
2.233632, 2.30863, 1.713254, 1, 0, 0.09411765, 1,
2.254811, -0.8124036, 1.681282, 1, 0, 0.09019608, 1,
2.256693, -2.135141, 1.411833, 1, 0, 0.08235294, 1,
2.337337, 1.365618, 1.564566, 1, 0, 0.07843138, 1,
2.36859, 0.2658708, 2.885217, 1, 0, 0.07058824, 1,
2.377102, -0.09412225, 2.187566, 1, 0, 0.06666667, 1,
2.380465, -0.3367942, 1.503776, 1, 0, 0.05882353, 1,
2.431538, 0.5102208, 1.00395, 1, 0, 0.05490196, 1,
2.444691, -0.5897712, 0.2174625, 1, 0, 0.04705882, 1,
2.476992, -1.385838, 2.964858, 1, 0, 0.04313726, 1,
2.544543, 0.02463303, -0.04851203, 1, 0, 0.03529412, 1,
2.555094, -1.169792, 2.492491, 1, 0, 0.03137255, 1,
2.607772, -0.4460806, 2.103334, 1, 0, 0.02352941, 1,
2.623419, -0.9572675, 2.813786, 1, 0, 0.01960784, 1,
2.638945, 0.3475668, 1.958088, 1, 0, 0.01176471, 1,
3.080872, -0.3547199, 2.790651, 1, 0, 0.007843138, 1
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
-0.0510571, -4.4419, -7.559342, 0, -0.5, 0.5, 0.5,
-0.0510571, -4.4419, -7.559342, 1, -0.5, 0.5, 0.5,
-0.0510571, -4.4419, -7.559342, 1, 1.5, 0.5, 0.5,
-0.0510571, -4.4419, -7.559342, 0, 1.5, 0.5, 0.5
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
-4.24471, -0.01131046, -7.559342, 0, -0.5, 0.5, 0.5,
-4.24471, -0.01131046, -7.559342, 1, -0.5, 0.5, 0.5,
-4.24471, -0.01131046, -7.559342, 1, 1.5, 0.5, 0.5,
-4.24471, -0.01131046, -7.559342, 0, 1.5, 0.5, 0.5
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
-4.24471, -4.4419, -0.01541114, 0, -0.5, 0.5, 0.5,
-4.24471, -4.4419, -0.01541114, 1, -0.5, 0.5, 0.5,
-4.24471, -4.4419, -0.01541114, 1, 1.5, 0.5, 0.5,
-4.24471, -4.4419, -0.01541114, 0, 1.5, 0.5, 0.5
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
-3, -3.419456, -5.818435,
3, -3.419456, -5.818435,
-3, -3.419456, -5.818435,
-3, -3.589863, -6.108586,
-2, -3.419456, -5.818435,
-2, -3.589863, -6.108586,
-1, -3.419456, -5.818435,
-1, -3.589863, -6.108586,
0, -3.419456, -5.818435,
0, -3.589863, -6.108586,
1, -3.419456, -5.818435,
1, -3.589863, -6.108586,
2, -3.419456, -5.818435,
2, -3.589863, -6.108586,
3, -3.419456, -5.818435,
3, -3.589863, -6.108586
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
"2",
"3"
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
-3, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
-3, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
-3, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
-3, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
-2, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
-2, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
-2, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
-2, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
-1, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
-1, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
-1, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
-1, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
0, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
0, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
0, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
0, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
1, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
1, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
1, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
1, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
2, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
2, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
2, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
2, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5,
3, -3.930678, -6.688889, 0, -0.5, 0.5, 0.5,
3, -3.930678, -6.688889, 1, -0.5, 0.5, 0.5,
3, -3.930678, -6.688889, 1, 1.5, 0.5, 0.5,
3, -3.930678, -6.688889, 0, 1.5, 0.5, 0.5
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
-3.276944, -3, -5.818435,
-3.276944, 3, -5.818435,
-3.276944, -3, -5.818435,
-3.438239, -3, -6.108586,
-3.276944, -2, -5.818435,
-3.438239, -2, -6.108586,
-3.276944, -1, -5.818435,
-3.438239, -1, -6.108586,
-3.276944, 0, -5.818435,
-3.438239, 0, -6.108586,
-3.276944, 1, -5.818435,
-3.438239, 1, -6.108586,
-3.276944, 2, -5.818435,
-3.438239, 2, -6.108586,
-3.276944, 3, -5.818435,
-3.438239, 3, -6.108586
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
-3.760828, -3, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, -3, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, -3, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, -3, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, -2, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, -2, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, -2, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, -2, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, -1, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, -1, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, -1, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, -1, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, 0, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, 0, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, 0, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, 0, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, 1, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, 1, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, 1, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, 1, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, 2, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, 2, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, 2, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, 2, -6.688889, 0, 1.5, 0.5, 0.5,
-3.760828, 3, -6.688889, 0, -0.5, 0.5, 0.5,
-3.760828, 3, -6.688889, 1, -0.5, 0.5, 0.5,
-3.760828, 3, -6.688889, 1, 1.5, 0.5, 0.5,
-3.760828, 3, -6.688889, 0, 1.5, 0.5, 0.5
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
-3.276944, -3.419456, -4,
-3.276944, -3.419456, 4,
-3.276944, -3.419456, -4,
-3.438239, -3.589863, -4,
-3.276944, -3.419456, -2,
-3.438239, -3.589863, -2,
-3.276944, -3.419456, 0,
-3.438239, -3.589863, 0,
-3.276944, -3.419456, 2,
-3.438239, -3.589863, 2,
-3.276944, -3.419456, 4,
-3.438239, -3.589863, 4
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
-3.760828, -3.930678, -4, 0, -0.5, 0.5, 0.5,
-3.760828, -3.930678, -4, 1, -0.5, 0.5, 0.5,
-3.760828, -3.930678, -4, 1, 1.5, 0.5, 0.5,
-3.760828, -3.930678, -4, 0, 1.5, 0.5, 0.5,
-3.760828, -3.930678, -2, 0, -0.5, 0.5, 0.5,
-3.760828, -3.930678, -2, 1, -0.5, 0.5, 0.5,
-3.760828, -3.930678, -2, 1, 1.5, 0.5, 0.5,
-3.760828, -3.930678, -2, 0, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 0, 0, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 0, 1, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 0, 1, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 0, 0, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 2, 0, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 2, 1, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 2, 1, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 2, 0, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 4, 0, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 4, 1, -0.5, 0.5, 0.5,
-3.760828, -3.930678, 4, 1, 1.5, 0.5, 0.5,
-3.760828, -3.930678, 4, 0, 1.5, 0.5, 0.5
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
-3.276944, -3.419456, -5.818435,
-3.276944, 3.396835, -5.818435,
-3.276944, -3.419456, 5.787613,
-3.276944, 3.396835, 5.787613,
-3.276944, -3.419456, -5.818435,
-3.276944, -3.419456, 5.787613,
-3.276944, 3.396835, -5.818435,
-3.276944, 3.396835, 5.787613,
-3.276944, -3.419456, -5.818435,
3.17483, -3.419456, -5.818435,
-3.276944, -3.419456, 5.787613,
3.17483, -3.419456, 5.787613,
-3.276944, 3.396835, -5.818435,
3.17483, 3.396835, -5.818435,
-3.276944, 3.396835, 5.787613,
3.17483, 3.396835, 5.787613,
3.17483, -3.419456, -5.818435,
3.17483, 3.396835, -5.818435,
3.17483, -3.419456, 5.787613,
3.17483, 3.396835, 5.787613,
3.17483, -3.419456, -5.818435,
3.17483, -3.419456, 5.787613,
3.17483, 3.396835, -5.818435,
3.17483, 3.396835, 5.787613
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
var radius = 7.970232;
var distance = 35.46046;
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
mvMatrix.translate( 0.0510571, 0.01131046, 0.01541114 );
mvMatrix.scale( 1.33569, 1.264261, 0.7425069 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.46046);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Oryzalin<-read.table("Oryzalin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Oryzalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
y<-Oryzalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
```

```r
z<-Oryzalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oryzalin' not found
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
-3.182986, -0.2644853, -1.406901, 0, 0, 1, 1, 1,
-2.694354, 0.3808614, -0.7067081, 1, 0, 0, 1, 1,
-2.537144, 0.9540869, -0.04008474, 1, 0, 0, 1, 1,
-2.530269, -0.1385204, -2.024557, 1, 0, 0, 1, 1,
-2.524246, -1.196126, -1.668069, 1, 0, 0, 1, 1,
-2.396812, 0.3118431, -0.6544274, 1, 0, 0, 1, 1,
-2.285901, 1.901309, -0.4230334, 0, 0, 0, 1, 1,
-2.275108, 1.327053, -1.103475, 0, 0, 0, 1, 1,
-2.272415, 0.6525297, -3.585622, 0, 0, 0, 1, 1,
-2.25345, -0.8006142, -1.806704, 0, 0, 0, 1, 1,
-2.22708, -0.120341, -3.132666, 0, 0, 0, 1, 1,
-2.217503, -1.089646, -1.533729, 0, 0, 0, 1, 1,
-2.205053, 1.339447, 0.3297056, 0, 0, 0, 1, 1,
-2.158273, -0.5938974, -1.649033, 1, 1, 1, 1, 1,
-2.09977, 0.03571405, -0.0986478, 1, 1, 1, 1, 1,
-2.090403, -2.261558, -2.031338, 1, 1, 1, 1, 1,
-2.085636, 0.7628285, -0.7932287, 1, 1, 1, 1, 1,
-2.068402, 1.025445, 0.3044975, 1, 1, 1, 1, 1,
-2.059142, -0.02201934, 0.02686413, 1, 1, 1, 1, 1,
-2.057851, 0.5197197, -2.007122, 1, 1, 1, 1, 1,
-2.054929, -1.184848, -1.020927, 1, 1, 1, 1, 1,
-2.045568, -0.1000734, -1.275613, 1, 1, 1, 1, 1,
-2.008842, 0.2909109, 0.4573292, 1, 1, 1, 1, 1,
-1.995026, 0.9838375, -0.7814202, 1, 1, 1, 1, 1,
-1.964084, -1.717428, -2.11572, 1, 1, 1, 1, 1,
-1.927374, -1.020437, -3.08147, 1, 1, 1, 1, 1,
-1.895074, 1.17436, -1.07865, 1, 1, 1, 1, 1,
-1.890506, 0.02667317, -2.587436, 1, 1, 1, 1, 1,
-1.8755, 0.5246578, -1.789233, 0, 0, 1, 1, 1,
-1.873197, -0.7978684, -1.151165, 1, 0, 0, 1, 1,
-1.869147, -1.078254, -1.734632, 1, 0, 0, 1, 1,
-1.861488, -0.7121351, -1.699117, 1, 0, 0, 1, 1,
-1.810187, 0.6667566, -2.603825, 1, 0, 0, 1, 1,
-1.804408, 0.6071381, -0.1098151, 1, 0, 0, 1, 1,
-1.80108, 0.725475, -2.985175, 0, 0, 0, 1, 1,
-1.787141, 0.8332337, -0.5299465, 0, 0, 0, 1, 1,
-1.773944, 0.1190103, -2.509214, 0, 0, 0, 1, 1,
-1.770089, -0.6177635, -1.622981, 0, 0, 0, 1, 1,
-1.757735, 0.5398392, -1.236233, 0, 0, 0, 1, 1,
-1.731149, -0.1735868, -3.01177, 0, 0, 0, 1, 1,
-1.726021, 1.438007, 0.3855773, 0, 0, 0, 1, 1,
-1.719121, 1.834613, 1.011999, 1, 1, 1, 1, 1,
-1.710982, 1.546709, 0.07852101, 1, 1, 1, 1, 1,
-1.710593, -0.4634635, 0.2274532, 1, 1, 1, 1, 1,
-1.704186, 0.1662041, -0.8551981, 1, 1, 1, 1, 1,
-1.693295, -0.6703799, -1.750867, 1, 1, 1, 1, 1,
-1.689365, 0.770307, -1.539829, 1, 1, 1, 1, 1,
-1.687328, 0.4139242, -1.991988, 1, 1, 1, 1, 1,
-1.684225, -0.5647007, -1.893593, 1, 1, 1, 1, 1,
-1.680393, 0.3402349, -1.580673, 1, 1, 1, 1, 1,
-1.677126, -1.614099, -0.9190376, 1, 1, 1, 1, 1,
-1.65015, -2.122229, -2.323807, 1, 1, 1, 1, 1,
-1.648743, -2.036294, -3.477327, 1, 1, 1, 1, 1,
-1.635431, -0.2126592, -1.337639, 1, 1, 1, 1, 1,
-1.634761, 0.7435245, -1.834131, 1, 1, 1, 1, 1,
-1.621112, -0.9428966, -1.637373, 1, 1, 1, 1, 1,
-1.616536, 0.008318476, -1.232985, 0, 0, 1, 1, 1,
-1.578333, 1.239866, 1.103234, 1, 0, 0, 1, 1,
-1.573133, 0.2846524, -2.996556, 1, 0, 0, 1, 1,
-1.569714, 0.7862, -0.7988818, 1, 0, 0, 1, 1,
-1.568555, 1.868231, -1.017503, 1, 0, 0, 1, 1,
-1.560723, -0.2104691, -0.2156253, 1, 0, 0, 1, 1,
-1.554668, -0.1527073, -1.642532, 0, 0, 0, 1, 1,
-1.540528, 0.2908407, -1.542388, 0, 0, 0, 1, 1,
-1.533562, 0.0657572, -1.792623, 0, 0, 0, 1, 1,
-1.523434, -0.9047604, -1.995026, 0, 0, 0, 1, 1,
-1.499405, 0.1806474, -1.100118, 0, 0, 0, 1, 1,
-1.489161, 0.5417711, -2.081029, 0, 0, 0, 1, 1,
-1.488182, 0.2781452, 0.8912746, 0, 0, 0, 1, 1,
-1.473136, 1.183662, -2.599988, 1, 1, 1, 1, 1,
-1.471494, -1.452048, -3.134084, 1, 1, 1, 1, 1,
-1.469363, -0.03476527, -1.947518, 1, 1, 1, 1, 1,
-1.449237, -0.1629869, 0.06081923, 1, 1, 1, 1, 1,
-1.442086, 1.46582, -1.907299, 1, 1, 1, 1, 1,
-1.42696, 1.101484, -0.450361, 1, 1, 1, 1, 1,
-1.424489, 0.7222825, 0.6600389, 1, 1, 1, 1, 1,
-1.421129, -0.09952389, -2.281096, 1, 1, 1, 1, 1,
-1.416852, -0.09793399, -2.656383, 1, 1, 1, 1, 1,
-1.407497, -0.680218, -2.830434, 1, 1, 1, 1, 1,
-1.395369, 1.80323, -0.4484184, 1, 1, 1, 1, 1,
-1.395291, -0.1247178, -2.410358, 1, 1, 1, 1, 1,
-1.390949, -0.5928812, -2.340636, 1, 1, 1, 1, 1,
-1.387955, 0.6064968, 1.240391, 1, 1, 1, 1, 1,
-1.384294, -2.347078, -1.360653, 1, 1, 1, 1, 1,
-1.383981, 0.07493383, -2.238775, 0, 0, 1, 1, 1,
-1.383401, 0.2047462, -0.4721445, 1, 0, 0, 1, 1,
-1.376225, 1.185175, -2.759763, 1, 0, 0, 1, 1,
-1.368595, 0.3895494, -0.2697313, 1, 0, 0, 1, 1,
-1.368247, -0.635094, -1.885243, 1, 0, 0, 1, 1,
-1.357249, -0.188325, -1.179858, 1, 0, 0, 1, 1,
-1.348206, -0.4257035, -0.4061105, 0, 0, 0, 1, 1,
-1.347612, 1.480554, 0.3568577, 0, 0, 0, 1, 1,
-1.344507, 1.69892, -0.9389959, 0, 0, 0, 1, 1,
-1.344172, 0.1843354, -0.8900849, 0, 0, 0, 1, 1,
-1.342968, 0.1908102, -0.9841613, 0, 0, 0, 1, 1,
-1.340733, 0.915953, -0.003550637, 0, 0, 0, 1, 1,
-1.33698, 1.532872, -0.3481414, 0, 0, 0, 1, 1,
-1.326786, 0.5028103, -0.2547348, 1, 1, 1, 1, 1,
-1.324303, 0.3344899, -1.751383, 1, 1, 1, 1, 1,
-1.313681, 0.9447491, -1.537428, 1, 1, 1, 1, 1,
-1.307516, -1.198491, -2.989167, 1, 1, 1, 1, 1,
-1.305702, -2.228681, -4.292152, 1, 1, 1, 1, 1,
-1.299125, 1.54222, -1.241279, 1, 1, 1, 1, 1,
-1.294021, 0.9538988, -1.20577, 1, 1, 1, 1, 1,
-1.291193, -0.3707697, -3.218605, 1, 1, 1, 1, 1,
-1.290655, -0.9647692, -3.195143, 1, 1, 1, 1, 1,
-1.289999, -2.289404, -3.384077, 1, 1, 1, 1, 1,
-1.289053, 0.1648887, -1.88344, 1, 1, 1, 1, 1,
-1.287426, 0.1553919, -1.606284, 1, 1, 1, 1, 1,
-1.276077, 0.7832714, -0.2151057, 1, 1, 1, 1, 1,
-1.273712, -0.156764, -1.709726, 1, 1, 1, 1, 1,
-1.261213, -0.1066693, -1.569109, 1, 1, 1, 1, 1,
-1.259414, -1.159229, -3.215946, 0, 0, 1, 1, 1,
-1.258428, 0.008799522, -0.620468, 1, 0, 0, 1, 1,
-1.251599, 0.1435685, 0.1058741, 1, 0, 0, 1, 1,
-1.250808, -1.360191, -2.689176, 1, 0, 0, 1, 1,
-1.249446, -0.2403286, -0.2862005, 1, 0, 0, 1, 1,
-1.247999, 1.84924, -0.7733611, 1, 0, 0, 1, 1,
-1.241924, 0.8271959, -1.321914, 0, 0, 0, 1, 1,
-1.231835, 0.3426038, -1.92369, 0, 0, 0, 1, 1,
-1.224438, 0.9476796, 0.6247333, 0, 0, 0, 1, 1,
-1.21884, 0.6615361, 0.09472522, 0, 0, 0, 1, 1,
-1.216937, -0.8084953, -2.835914, 0, 0, 0, 1, 1,
-1.214995, 0.7700764, -1.904087, 0, 0, 0, 1, 1,
-1.212852, -0.2199228, -1.189837, 0, 0, 0, 1, 1,
-1.210497, 0.4590896, 1.632591, 1, 1, 1, 1, 1,
-1.208338, 0.8681284, -1.458781, 1, 1, 1, 1, 1,
-1.202232, 0.9089013, -1.281829, 1, 1, 1, 1, 1,
-1.200902, -0.1162506, -1.128117, 1, 1, 1, 1, 1,
-1.200873, 1.544084, -1.643505, 1, 1, 1, 1, 1,
-1.199258, -1.305334, -2.350611, 1, 1, 1, 1, 1,
-1.196288, 0.4517592, -1.335472, 1, 1, 1, 1, 1,
-1.195502, 0.2664409, -1.657339, 1, 1, 1, 1, 1,
-1.195487, 1.005092, 0.6534107, 1, 1, 1, 1, 1,
-1.194903, 0.6552607, -0.9734273, 1, 1, 1, 1, 1,
-1.194436, 1.586637, -0.7800747, 1, 1, 1, 1, 1,
-1.186959, 0.82487, 1.191208, 1, 1, 1, 1, 1,
-1.176652, 0.5421438, 0.2141213, 1, 1, 1, 1, 1,
-1.172226, -0.2130659, -1.874453, 1, 1, 1, 1, 1,
-1.171594, -2.192227, -2.214057, 1, 1, 1, 1, 1,
-1.171392, -0.6934611, -2.373844, 0, 0, 1, 1, 1,
-1.170517, 1.082193, 0.3332108, 1, 0, 0, 1, 1,
-1.160513, 0.8066282, -2.216201, 1, 0, 0, 1, 1,
-1.157363, -0.3985902, -2.796755, 1, 0, 0, 1, 1,
-1.150292, 0.05796827, -3.090572, 1, 0, 0, 1, 1,
-1.141719, -0.3824765, -1.974095, 1, 0, 0, 1, 1,
-1.135684, -1.020118, -1.380042, 0, 0, 0, 1, 1,
-1.132977, 0.9582125, -0.366876, 0, 0, 0, 1, 1,
-1.129274, -0.9921849, -1.900297, 0, 0, 0, 1, 1,
-1.12845, 1.337398, -1.415835, 0, 0, 0, 1, 1,
-1.115521, -1.311495, -1.449041, 0, 0, 0, 1, 1,
-1.105982, -0.3339381, -3.469256, 0, 0, 0, 1, 1,
-1.103527, 0.07058351, -0.4300235, 0, 0, 0, 1, 1,
-1.094692, 0.08856908, -1.603553, 1, 1, 1, 1, 1,
-1.093874, -1.100511, -1.759767, 1, 1, 1, 1, 1,
-1.079146, 1.1469, 0.04218134, 1, 1, 1, 1, 1,
-1.073552, 0.9794712, -0.3859034, 1, 1, 1, 1, 1,
-1.069, -0.7993674, -2.689396, 1, 1, 1, 1, 1,
-1.068541, -0.1535846, -1.858935, 1, 1, 1, 1, 1,
-1.066441, 0.1801981, -2.102698, 1, 1, 1, 1, 1,
-1.063627, -0.8528949, -2.792356, 1, 1, 1, 1, 1,
-1.061939, -2.842943, -0.8187331, 1, 1, 1, 1, 1,
-1.053232, 0.7215782, -1.742988, 1, 1, 1, 1, 1,
-1.04988, -0.560807, -4.109788, 1, 1, 1, 1, 1,
-1.049162, -0.8322016, -2.509672, 1, 1, 1, 1, 1,
-1.048919, -2.716846, -5.649415, 1, 1, 1, 1, 1,
-1.046568, 0.04279419, -1.954056, 1, 1, 1, 1, 1,
-1.044033, -0.492025, -1.275498, 1, 1, 1, 1, 1,
-1.018885, -2.36819, -2.695663, 0, 0, 1, 1, 1,
-1.018061, 0.6661301, 0.1290336, 1, 0, 0, 1, 1,
-1.009143, -0.1661501, -2.277674, 1, 0, 0, 1, 1,
-1.001967, -1.314985, -2.547601, 1, 0, 0, 1, 1,
-0.9987607, -0.4220875, -2.112159, 1, 0, 0, 1, 1,
-0.9975954, -1.483827, -2.538198, 1, 0, 0, 1, 1,
-0.990522, -0.6919798, -3.484712, 0, 0, 0, 1, 1,
-0.9802178, 0.4712416, -1.702258, 0, 0, 0, 1, 1,
-0.977229, -0.03991402, -0.5155758, 0, 0, 0, 1, 1,
-0.9701928, 1.89884, -1.384839, 0, 0, 0, 1, 1,
-0.9700537, -0.1812309, -1.548144, 0, 0, 0, 1, 1,
-0.9609772, -1.120546, -4.217807, 0, 0, 0, 1, 1,
-0.9465675, -0.007697043, -4.23052, 0, 0, 0, 1, 1,
-0.938669, -0.2826126, -1.996802, 1, 1, 1, 1, 1,
-0.9348843, 1.624181, -0.2608917, 1, 1, 1, 1, 1,
-0.9278216, 1.047329, -1.428988, 1, 1, 1, 1, 1,
-0.9233552, -0.6231349, -2.10183, 1, 1, 1, 1, 1,
-0.9167967, 2.165537, 0.4282468, 1, 1, 1, 1, 1,
-0.9154867, -0.3448576, -0.4410405, 1, 1, 1, 1, 1,
-0.9102101, 0.6738718, -0.6915832, 1, 1, 1, 1, 1,
-0.9060429, 0.5363329, -0.4932215, 1, 1, 1, 1, 1,
-0.9030758, 0.7406344, -1.280036, 1, 1, 1, 1, 1,
-0.9013165, -0.3125649, -1.800207, 1, 1, 1, 1, 1,
-0.8951997, 0.7908313, -1.339483, 1, 1, 1, 1, 1,
-0.8925318, -0.2418951, -0.9188219, 1, 1, 1, 1, 1,
-0.8889813, -1.441884, -2.557976, 1, 1, 1, 1, 1,
-0.8863279, 0.7427938, 0.6578363, 1, 1, 1, 1, 1,
-0.8824801, -0.2340101, -1.602668, 1, 1, 1, 1, 1,
-0.8819999, -0.2928136, -0.2489333, 0, 0, 1, 1, 1,
-0.8778239, 1.494298, -0.3986441, 1, 0, 0, 1, 1,
-0.8633828, -0.7238864, -1.431935, 1, 0, 0, 1, 1,
-0.8602742, 0.2066426, -2.479951, 1, 0, 0, 1, 1,
-0.8566903, 0.1366327, -3.684304, 1, 0, 0, 1, 1,
-0.8488185, -0.2446552, -2.213867, 1, 0, 0, 1, 1,
-0.8441871, -1.739302, -4.952377, 0, 0, 0, 1, 1,
-0.8397278, -0.3245764, -1.021438, 0, 0, 0, 1, 1,
-0.8380647, 0.3441692, -1.989602, 0, 0, 0, 1, 1,
-0.8324945, 1.217385, -0.5018015, 0, 0, 0, 1, 1,
-0.8267853, 1.377501, -0.1878212, 0, 0, 0, 1, 1,
-0.8259392, -0.9303536, -3.444352, 0, 0, 0, 1, 1,
-0.8255866, -0.8618383, -1.843383, 0, 0, 0, 1, 1,
-0.819325, 1.10707, -1.016793, 1, 1, 1, 1, 1,
-0.8143811, 0.778953, -0.3502064, 1, 1, 1, 1, 1,
-0.8090241, -0.5597066, -2.233805, 1, 1, 1, 1, 1,
-0.8064536, 0.3114683, -1.000497, 1, 1, 1, 1, 1,
-0.8026453, 0.4182128, -1.684155, 1, 1, 1, 1, 1,
-0.8011992, -0.2389865, -1.831218, 1, 1, 1, 1, 1,
-0.7964079, -1.006037, -1.453989, 1, 1, 1, 1, 1,
-0.7955165, 1.043115, -1.180507, 1, 1, 1, 1, 1,
-0.7945951, 0.374369, -1.99854, 1, 1, 1, 1, 1,
-0.7927995, -2.28757, -3.050303, 1, 1, 1, 1, 1,
-0.78248, 0.370321, -0.9348887, 1, 1, 1, 1, 1,
-0.7762514, 0.3056746, -0.9817696, 1, 1, 1, 1, 1,
-0.7750684, -1.283157, -4.234965, 1, 1, 1, 1, 1,
-0.7696041, -0.7408817, -1.154489, 1, 1, 1, 1, 1,
-0.7676412, -0.3938862, -2.822901, 1, 1, 1, 1, 1,
-0.766653, 0.1106665, -0.2948126, 0, 0, 1, 1, 1,
-0.7592265, -0.6364009, -3.521484, 1, 0, 0, 1, 1,
-0.7532747, 0.1311921, -0.7849163, 1, 0, 0, 1, 1,
-0.7510773, -0.4105259, -2.424629, 1, 0, 0, 1, 1,
-0.7478313, 0.4745827, -0.2215735, 1, 0, 0, 1, 1,
-0.7473043, 0.5821217, 0.9747057, 1, 0, 0, 1, 1,
-0.7455142, 0.7560194, -2.494814, 0, 0, 0, 1, 1,
-0.7430005, 2.68638, 0.8530098, 0, 0, 0, 1, 1,
-0.7413085, 1.769675, 1.957685, 0, 0, 0, 1, 1,
-0.7375472, -1.202278, -1.921316, 0, 0, 0, 1, 1,
-0.7367675, 0.5244886, -1.747617, 0, 0, 0, 1, 1,
-0.735465, 0.7035238, -0.8631348, 0, 0, 0, 1, 1,
-0.7336043, -1.483215, -1.469095, 0, 0, 0, 1, 1,
-0.7333766, -1.93519, -2.296493, 1, 1, 1, 1, 1,
-0.7331606, -0.2941256, -3.370109, 1, 1, 1, 1, 1,
-0.7323588, 0.3886842, -1.05151, 1, 1, 1, 1, 1,
-0.7316352, 0.1110464, -1.828863, 1, 1, 1, 1, 1,
-0.7271805, 0.8583801, 1.079091, 1, 1, 1, 1, 1,
-0.7257544, -1.867751, -3.527097, 1, 1, 1, 1, 1,
-0.7247113, 1.162188, -0.03032437, 1, 1, 1, 1, 1,
-0.722685, -0.2249362, -3.602601, 1, 1, 1, 1, 1,
-0.7181222, -1.581034, -2.111695, 1, 1, 1, 1, 1,
-0.716995, 0.2407274, -1.470747, 1, 1, 1, 1, 1,
-0.7087915, -0.4046479, -3.054882, 1, 1, 1, 1, 1,
-0.7072877, -1.500478, -3.238422, 1, 1, 1, 1, 1,
-0.7065856, -0.2795241, -3.446001, 1, 1, 1, 1, 1,
-0.70619, 0.6641946, -0.2452361, 1, 1, 1, 1, 1,
-0.7011383, -0.05677284, -3.469312, 1, 1, 1, 1, 1,
-0.6976851, 0.190803, -1.621892, 0, 0, 1, 1, 1,
-0.6906725, -1.1271, -1.692062, 1, 0, 0, 1, 1,
-0.6902708, 1.207957, -0.2927614, 1, 0, 0, 1, 1,
-0.6843575, -0.7521595, -1.227853, 1, 0, 0, 1, 1,
-0.6688491, -1.776324, -2.898878, 1, 0, 0, 1, 1,
-0.6671593, 0.7489385, 0.9679343, 1, 0, 0, 1, 1,
-0.66151, 0.1217013, -2.135634, 0, 0, 0, 1, 1,
-0.6520877, -0.1158787, -4.776407, 0, 0, 0, 1, 1,
-0.6516601, 1.559259, 0.685742, 0, 0, 0, 1, 1,
-0.6463773, 0.3232697, -1.502354, 0, 0, 0, 1, 1,
-0.642736, -1.633505, -1.273011, 0, 0, 0, 1, 1,
-0.6326075, 0.9977956, -0.9041994, 0, 0, 0, 1, 1,
-0.6305557, 0.3641402, -0.8546594, 0, 0, 0, 1, 1,
-0.6302883, 1.741059, 0.04607361, 1, 1, 1, 1, 1,
-0.6281095, 1.179799, -0.8699207, 1, 1, 1, 1, 1,
-0.6274258, -0.3376287, -3.172891, 1, 1, 1, 1, 1,
-0.6262966, 0.8215744, -1.54147, 1, 1, 1, 1, 1,
-0.6178312, -0.8333788, -3.186843, 1, 1, 1, 1, 1,
-0.6173931, -0.1323213, 1.083658, 1, 1, 1, 1, 1,
-0.6079718, 0.1119587, -1.560743, 1, 1, 1, 1, 1,
-0.6058469, 1.058679, -1.217075, 1, 1, 1, 1, 1,
-0.5991243, -0.5642557, -2.70092, 1, 1, 1, 1, 1,
-0.5976123, 0.656607, -1.161201, 1, 1, 1, 1, 1,
-0.5948223, -0.05985013, -1.302603, 1, 1, 1, 1, 1,
-0.5931529, 0.6834122, -1.616483, 1, 1, 1, 1, 1,
-0.5921285, -0.0342126, -2.829962, 1, 1, 1, 1, 1,
-0.590157, 0.8521671, -0.5278934, 1, 1, 1, 1, 1,
-0.5791861, 0.7900987, -0.1537405, 1, 1, 1, 1, 1,
-0.5688905, 0.7232445, -1.364835, 0, 0, 1, 1, 1,
-0.5679047, 0.4373827, -1.961674, 1, 0, 0, 1, 1,
-0.5644883, -0.09239374, -1.169301, 1, 0, 0, 1, 1,
-0.5610177, 0.4365865, -1.97484, 1, 0, 0, 1, 1,
-0.5600945, -0.6915805, -2.659326, 1, 0, 0, 1, 1,
-0.5598391, 0.5555131, -1.817515, 1, 0, 0, 1, 1,
-0.559179, 0.1873442, -1.495876, 0, 0, 0, 1, 1,
-0.558066, 0.8442156, -0.7209294, 0, 0, 0, 1, 1,
-0.5481193, -0.3097154, -2.591009, 0, 0, 0, 1, 1,
-0.5472128, 0.04377174, -3.725431, 0, 0, 0, 1, 1,
-0.5469112, 0.2073619, -1.373926, 0, 0, 0, 1, 1,
-0.5457675, -1.19135, -2.322526, 0, 0, 0, 1, 1,
-0.5435258, -0.2596928, -1.678475, 0, 0, 0, 1, 1,
-0.5424913, 0.471045, 0.08315658, 1, 1, 1, 1, 1,
-0.5423254, -0.3829199, -2.8279, 1, 1, 1, 1, 1,
-0.5408484, -0.4037634, -2.544676, 1, 1, 1, 1, 1,
-0.5395792, 1.531749, -0.9386748, 1, 1, 1, 1, 1,
-0.5354025, 2.325054, 0.01122256, 1, 1, 1, 1, 1,
-0.5345079, -0.8251978, -2.904432, 1, 1, 1, 1, 1,
-0.534012, -0.8648186, -3.528714, 1, 1, 1, 1, 1,
-0.5339549, 0.18013, -0.4377808, 1, 1, 1, 1, 1,
-0.5335787, 0.7781951, 0.08698672, 1, 1, 1, 1, 1,
-0.532257, -0.1935872, -0.7952399, 1, 1, 1, 1, 1,
-0.5314846, 0.3873512, -0.2583212, 1, 1, 1, 1, 1,
-0.530444, 0.4466856, 0.03398563, 1, 1, 1, 1, 1,
-0.526082, -1.284464, -0.9860283, 1, 1, 1, 1, 1,
-0.5258144, 1.861087, -0.4753992, 1, 1, 1, 1, 1,
-0.5249184, -0.2977792, -3.550081, 1, 1, 1, 1, 1,
-0.5191419, 0.03329584, -0.2062534, 0, 0, 1, 1, 1,
-0.5167779, 1.123051, -0.3130762, 1, 0, 0, 1, 1,
-0.5153998, -0.2928927, -1.800297, 1, 0, 0, 1, 1,
-0.5128566, -0.6818361, -3.668345, 1, 0, 0, 1, 1,
-0.5106441, -0.0237365, -1.122022, 1, 0, 0, 1, 1,
-0.5104473, 1.135725, 0.2521013, 1, 0, 0, 1, 1,
-0.5083884, 0.01194069, -0.6187862, 0, 0, 0, 1, 1,
-0.5027314, -0.2353668, -2.398701, 0, 0, 0, 1, 1,
-0.5011878, -0.6964436, -2.726443, 0, 0, 0, 1, 1,
-0.4955263, 0.7697288, 0.66598, 0, 0, 0, 1, 1,
-0.4945318, -0.6218491, -2.092554, 0, 0, 0, 1, 1,
-0.494516, 0.5111246, -1.964151, 0, 0, 0, 1, 1,
-0.4821553, 1.32488, 0.1755891, 0, 0, 0, 1, 1,
-0.4819697, -1.06913, -3.046018, 1, 1, 1, 1, 1,
-0.4800182, -1.496516, -2.060197, 1, 1, 1, 1, 1,
-0.4768443, -0.08714452, -3.767494, 1, 1, 1, 1, 1,
-0.4758003, 0.4725319, -0.109887, 1, 1, 1, 1, 1,
-0.4739802, -1.016718, -4.740154, 1, 1, 1, 1, 1,
-0.4733017, -0.5163472, -1.974532, 1, 1, 1, 1, 1,
-0.4715286, -0.1162055, -1.424037, 1, 1, 1, 1, 1,
-0.4691612, -1.04483, -2.733133, 1, 1, 1, 1, 1,
-0.4636413, 0.4671417, -0.5619489, 1, 1, 1, 1, 1,
-0.4623045, 0.4777977, -0.6972254, 1, 1, 1, 1, 1,
-0.4595779, -0.8356446, -2.681552, 1, 1, 1, 1, 1,
-0.4592538, 0.5401753, 0.09469914, 1, 1, 1, 1, 1,
-0.4588152, -0.8264307, -2.389277, 1, 1, 1, 1, 1,
-0.4587664, -0.02256946, -2.697323, 1, 1, 1, 1, 1,
-0.4526796, 0.6998383, -0.02718389, 1, 1, 1, 1, 1,
-0.4525192, 0.9047305, -1.31813, 0, 0, 1, 1, 1,
-0.452068, -1.904728, -2.356823, 1, 0, 0, 1, 1,
-0.4468868, -0.2281203, 0.458836, 1, 0, 0, 1, 1,
-0.4360675, 0.01840787, -0.2672345, 1, 0, 0, 1, 1,
-0.4242598, -1.330036, -3.710275, 1, 0, 0, 1, 1,
-0.4217961, -0.7297223, -2.554672, 1, 0, 0, 1, 1,
-0.4169528, 0.2102202, -0.4498663, 0, 0, 0, 1, 1,
-0.4165264, 1.555721, -0.06788384, 0, 0, 0, 1, 1,
-0.4141676, 0.6379759, -1.201508, 0, 0, 0, 1, 1,
-0.4103729, 0.6343207, -0.9662299, 0, 0, 0, 1, 1,
-0.4100484, 0.9889756, 0.43537, 0, 0, 0, 1, 1,
-0.4071061, -1.011994, -3.346106, 0, 0, 0, 1, 1,
-0.4061787, 0.5349816, -0.9577396, 0, 0, 0, 1, 1,
-0.4050354, 0.835053, -1.543237, 1, 1, 1, 1, 1,
-0.4043332, -0.177379, -0.8806711, 1, 1, 1, 1, 1,
-0.4041328, -0.7501087, -2.660903, 1, 1, 1, 1, 1,
-0.4005633, -0.125172, -2.538069, 1, 1, 1, 1, 1,
-0.3929581, 1.896493, 0.1729866, 1, 1, 1, 1, 1,
-0.3911435, 0.7031798, -0.577914, 1, 1, 1, 1, 1,
-0.3873896, -0.199369, -0.3316633, 1, 1, 1, 1, 1,
-0.3831432, -0.6188506, -3.379483, 1, 1, 1, 1, 1,
-0.3829631, 0.8836045, -0.4227132, 1, 1, 1, 1, 1,
-0.3827669, -0.5503737, -3.135359, 1, 1, 1, 1, 1,
-0.3822877, -0.08358218, -1.402019, 1, 1, 1, 1, 1,
-0.380601, 0.3469496, -1.868325, 1, 1, 1, 1, 1,
-0.3803069, 1.068956, 0.7080027, 1, 1, 1, 1, 1,
-0.378305, -2.275381, -1.89047, 1, 1, 1, 1, 1,
-0.3779867, 1.033025, -0.5114473, 1, 1, 1, 1, 1,
-0.376091, -0.1377765, -0.08365129, 0, 0, 1, 1, 1,
-0.374267, -0.2161588, -1.962006, 1, 0, 0, 1, 1,
-0.3742627, 0.8164036, -0.8208252, 1, 0, 0, 1, 1,
-0.3732297, 0.2522845, -0.2390568, 1, 0, 0, 1, 1,
-0.365893, 0.7950961, -1.474464, 1, 0, 0, 1, 1,
-0.3657298, -0.01786796, -1.374382, 1, 0, 0, 1, 1,
-0.3598124, -0.7308663, -1.388121, 0, 0, 0, 1, 1,
-0.3553015, 0.8375547, -0.6467551, 0, 0, 0, 1, 1,
-0.3518533, -0.6230991, -3.288961, 0, 0, 0, 1, 1,
-0.3516353, 1.369264, -0.182921, 0, 0, 0, 1, 1,
-0.3505655, 0.3812534, -1.454591, 0, 0, 0, 1, 1,
-0.3472958, 1.301712, -0.6680654, 0, 0, 0, 1, 1,
-0.3461348, 0.6202387, 0.3914264, 0, 0, 0, 1, 1,
-0.3418189, 0.865631, -1.23192, 1, 1, 1, 1, 1,
-0.3386133, 1.255914, -1.369136, 1, 1, 1, 1, 1,
-0.3343854, 0.5271417, 0.7516953, 1, 1, 1, 1, 1,
-0.3334571, -0.8548172, -3.08848, 1, 1, 1, 1, 1,
-0.3307441, 1.314788, -0.04228019, 1, 1, 1, 1, 1,
-0.3279757, -0.3105209, -0.6191655, 1, 1, 1, 1, 1,
-0.3270512, -0.2333116, -2.942173, 1, 1, 1, 1, 1,
-0.3261032, -2.550211, -4.849922, 1, 1, 1, 1, 1,
-0.3247736, -1.609715, -1.727407, 1, 1, 1, 1, 1,
-0.3221491, 0.2016861, -0.4325032, 1, 1, 1, 1, 1,
-0.308423, 1.427705, -2.562582, 1, 1, 1, 1, 1,
-0.3073653, 0.6889724, -1.275358, 1, 1, 1, 1, 1,
-0.3063126, -0.6005936, -2.294534, 1, 1, 1, 1, 1,
-0.3056944, -0.7635645, -3.694609, 1, 1, 1, 1, 1,
-0.3046752, -0.6484514, -2.496167, 1, 1, 1, 1, 1,
-0.3019534, 0.2127666, -2.556497, 0, 0, 1, 1, 1,
-0.2995752, 0.1273857, -1.384228, 1, 0, 0, 1, 1,
-0.2990512, -0.9141554, -4.835149, 1, 0, 0, 1, 1,
-0.296052, -0.1663639, -1.613459, 1, 0, 0, 1, 1,
-0.2955562, -2.008832, -1.200566, 1, 0, 0, 1, 1,
-0.2944825, -0.922776, -1.83678, 1, 0, 0, 1, 1,
-0.2936126, 0.07331136, -0.701084, 0, 0, 0, 1, 1,
-0.2916111, -0.7735313, -4.516305, 0, 0, 0, 1, 1,
-0.2852151, -0.05994407, -0.6297803, 0, 0, 0, 1, 1,
-0.2814589, 1.112353, -1.548566, 0, 0, 0, 1, 1,
-0.2790898, -2.742846, -2.319478, 0, 0, 0, 1, 1,
-0.2789077, -0.5763819, -3.917882, 0, 0, 0, 1, 1,
-0.2781592, -0.1795132, -1.183588, 0, 0, 0, 1, 1,
-0.2775196, -0.5235943, -2.816541, 1, 1, 1, 1, 1,
-0.2764813, 0.4379479, -1.516021, 1, 1, 1, 1, 1,
-0.2735737, -0.1235814, -2.211, 1, 1, 1, 1, 1,
-0.2711253, 0.829325, -0.4574546, 1, 1, 1, 1, 1,
-0.2657529, 0.5805817, -0.6731488, 1, 1, 1, 1, 1,
-0.2604741, -1.406085, -3.100513, 1, 1, 1, 1, 1,
-0.259745, -0.1564034, -2.565208, 1, 1, 1, 1, 1,
-0.2589498, 1.277044, -0.8422012, 1, 1, 1, 1, 1,
-0.2564917, -0.493802, -2.805792, 1, 1, 1, 1, 1,
-0.251396, -0.178542, -1.124746, 1, 1, 1, 1, 1,
-0.2508046, -1.106286, -3.187271, 1, 1, 1, 1, 1,
-0.2494426, 0.2918569, -0.6677769, 1, 1, 1, 1, 1,
-0.247455, 0.6022661, -1.055159, 1, 1, 1, 1, 1,
-0.2473744, -2.07982, -0.1380464, 1, 1, 1, 1, 1,
-0.2462681, -1.941742, -2.548393, 1, 1, 1, 1, 1,
-0.2398988, -0.5130449, -2.1601, 0, 0, 1, 1, 1,
-0.2362059, 0.3740799, -1.578378, 1, 0, 0, 1, 1,
-0.2340188, 1.095916, -1.771457, 1, 0, 0, 1, 1,
-0.2277546, -0.4090312, -3.371834, 1, 0, 0, 1, 1,
-0.2247663, -1.665439, -3.659216, 1, 0, 0, 1, 1,
-0.2222052, 0.2602751, -1.468562, 1, 0, 0, 1, 1,
-0.2065778, -0.07888135, -2.756884, 0, 0, 0, 1, 1,
-0.1981108, 0.824368, 1.629809, 0, 0, 0, 1, 1,
-0.1972222, -0.5915219, -1.799405, 0, 0, 0, 1, 1,
-0.1952043, -0.5147711, -0.7512566, 0, 0, 0, 1, 1,
-0.1872293, 0.124488, -2.006311, 0, 0, 0, 1, 1,
-0.1846343, 0.3474225, 1.165845, 0, 0, 0, 1, 1,
-0.1823152, 1.422119, 1.343683, 0, 0, 0, 1, 1,
-0.1802968, 0.4528371, -0.437435, 1, 1, 1, 1, 1,
-0.1725032, -0.60014, -1.725865, 1, 1, 1, 1, 1,
-0.1716017, 1.408205, -0.7186986, 1, 1, 1, 1, 1,
-0.1710141, -0.6629135, -3.591406, 1, 1, 1, 1, 1,
-0.1668244, -0.4921899, -3.184242, 1, 1, 1, 1, 1,
-0.1665046, 1.266483, 0.4445759, 1, 1, 1, 1, 1,
-0.1594894, 0.5603288, -0.01282432, 1, 1, 1, 1, 1,
-0.1581343, 1.565658, 0.7761186, 1, 1, 1, 1, 1,
-0.1519357, 0.9612086, -0.6583728, 1, 1, 1, 1, 1,
-0.1462204, -0.3092251, -2.331598, 1, 1, 1, 1, 1,
-0.1443294, 1.060382, -0.1741598, 1, 1, 1, 1, 1,
-0.1354405, 0.5592271, 0.4877702, 1, 1, 1, 1, 1,
-0.1353485, -1.373436, -2.554353, 1, 1, 1, 1, 1,
-0.1308551, -1.152887, -3.75432, 1, 1, 1, 1, 1,
-0.1306145, 1.185975, 0.03098973, 1, 1, 1, 1, 1,
-0.129534, 0.4479805, -1.452381, 0, 0, 1, 1, 1,
-0.1284846, 0.6269307, -0.9640446, 1, 0, 0, 1, 1,
-0.1252082, -0.5849079, -4.370254, 1, 0, 0, 1, 1,
-0.1208545, 1.000493, 1.544701, 1, 0, 0, 1, 1,
-0.1175296, 1.532748, 1.946172, 1, 0, 0, 1, 1,
-0.1111188, 1.171717, -1.163554, 1, 0, 0, 1, 1,
-0.1110755, 0.665538, -1.569118, 0, 0, 0, 1, 1,
-0.1064688, 1.046552, -0.56598, 0, 0, 0, 1, 1,
-0.1062725, -0.3632835, -4.363208, 0, 0, 0, 1, 1,
-0.1056796, 0.3812742, -2.479707, 0, 0, 0, 1, 1,
-0.1040506, 0.793702, -0.8950433, 0, 0, 0, 1, 1,
-0.0940235, 0.9468006, -1.060829, 0, 0, 0, 1, 1,
-0.09361976, -0.4241041, -2.950719, 0, 0, 0, 1, 1,
-0.09337615, -1.225711, -4.474453, 1, 1, 1, 1, 1,
-0.09299129, 1.828324, -0.3560263, 1, 1, 1, 1, 1,
-0.09021053, 0.2614337, 0.3611121, 1, 1, 1, 1, 1,
-0.08939526, -0.25554, -1.68444, 1, 1, 1, 1, 1,
-0.08763566, 0.8378127, 2.476562, 1, 1, 1, 1, 1,
-0.08453854, 0.2800921, -1.171127, 1, 1, 1, 1, 1,
-0.08319172, -1.692694, -1.373886, 1, 1, 1, 1, 1,
-0.07740577, 1.08478, -0.5222325, 1, 1, 1, 1, 1,
-0.07665677, -0.3091951, -5.54067, 1, 1, 1, 1, 1,
-0.07603947, -0.2424489, -2.337429, 1, 1, 1, 1, 1,
-0.07601536, -0.240176, -1.33942, 1, 1, 1, 1, 1,
-0.07551929, -0.4425337, -4.597034, 1, 1, 1, 1, 1,
-0.07505732, -1.38769, -4.154365, 1, 1, 1, 1, 1,
-0.07324688, -0.6353822, -3.856661, 1, 1, 1, 1, 1,
-0.06858804, -0.5285033, -2.050227, 1, 1, 1, 1, 1,
-0.06682742, -0.02550337, -0.9558034, 0, 0, 1, 1, 1,
-0.06355716, 1.253127, -1.049226, 1, 0, 0, 1, 1,
-0.05945225, 0.1331143, -1.218537, 1, 0, 0, 1, 1,
-0.05565701, -0.3060757, -2.96201, 1, 0, 0, 1, 1,
-0.05541123, 0.09976228, -0.5979094, 1, 0, 0, 1, 1,
-0.05449755, -0.3579438, -3.816345, 1, 0, 0, 1, 1,
-0.05407921, 1.693342, -1.126213, 0, 0, 0, 1, 1,
-0.05383503, -1.584756, -2.426128, 0, 0, 0, 1, 1,
-0.05024196, 0.5981097, -1.003623, 0, 0, 0, 1, 1,
-0.04815901, 1.080617, 0.166552, 0, 0, 0, 1, 1,
-0.04476537, 1.157549, 0.1559901, 0, 0, 0, 1, 1,
-0.04297248, 2.001717, -0.7139093, 0, 0, 0, 1, 1,
-0.04188958, -0.7558146, -4.571622, 0, 0, 0, 1, 1,
-0.04187886, 1.559318, -0.9934019, 1, 1, 1, 1, 1,
-0.03865081, 1.270099, 0.5690361, 1, 1, 1, 1, 1,
-0.03859273, 0.8355585, 1.261765, 1, 1, 1, 1, 1,
-0.03852306, 1.215518, 1.325717, 1, 1, 1, 1, 1,
-0.03655882, -1.204092, -4.372912, 1, 1, 1, 1, 1,
-0.03437143, -0.3314275, -1.423331, 1, 1, 1, 1, 1,
-0.03421882, -1.220686, -4.279828, 1, 1, 1, 1, 1,
-0.02997764, 0.4360485, 0.793092, 1, 1, 1, 1, 1,
-0.02924286, 1.743269, -0.6010529, 1, 1, 1, 1, 1,
-0.02792633, 0.3186909, -0.8022403, 1, 1, 1, 1, 1,
-0.02158663, -1.076919, -4.064866, 1, 1, 1, 1, 1,
-0.0204079, 0.7162703, 1.379179, 1, 1, 1, 1, 1,
-0.01530545, 0.02812835, -1.038061, 1, 1, 1, 1, 1,
-0.01160258, -1.644858, -4.235419, 1, 1, 1, 1, 1,
-0.01153602, 0.8840054, 0.3844686, 1, 1, 1, 1, 1,
-0.01143458, -1.750496, -3.292288, 0, 0, 1, 1, 1,
-0.009336798, 0.4744987, -0.4830981, 1, 0, 0, 1, 1,
-0.008597304, 0.3808042, -0.6807001, 1, 0, 0, 1, 1,
-0.003407901, -1.026858, -4.123895, 1, 0, 0, 1, 1,
-0.0006626288, 1.005459, 1.663679, 1, 0, 0, 1, 1,
0.0003534968, -0.1023526, 3.78947, 1, 0, 0, 1, 1,
0.001934289, -0.7574238, 2.563951, 0, 0, 0, 1, 1,
0.002566509, -0.3203824, 2.220574, 0, 0, 0, 1, 1,
0.00573445, 1.027301, 1.090809, 0, 0, 0, 1, 1,
0.00583113, 1.2664, 1.81212, 0, 0, 0, 1, 1,
0.006445882, -0.00920303, 4.26277, 0, 0, 0, 1, 1,
0.006694857, -1.668106, 1.160596, 0, 0, 0, 1, 1,
0.01153954, 0.9913058, 0.8434703, 0, 0, 0, 1, 1,
0.01185583, 0.06325023, 1.229176, 1, 1, 1, 1, 1,
0.01396486, -0.1696295, 2.68441, 1, 1, 1, 1, 1,
0.01613208, 0.3941888, -0.7723287, 1, 1, 1, 1, 1,
0.01644853, 0.4251331, -0.5166483, 1, 1, 1, 1, 1,
0.01686931, -0.8192723, 3.141984, 1, 1, 1, 1, 1,
0.01971894, -0.8017225, 4.082598, 1, 1, 1, 1, 1,
0.02024657, -0.01557104, 1.626091, 1, 1, 1, 1, 1,
0.02827388, -0.9695609, 3.850763, 1, 1, 1, 1, 1,
0.02993163, 0.5518337, -0.410408, 1, 1, 1, 1, 1,
0.03385564, 0.8710648, -0.4165542, 1, 1, 1, 1, 1,
0.03572952, 0.272789, 1.583972, 1, 1, 1, 1, 1,
0.03718082, -1.334218, 4.236718, 1, 1, 1, 1, 1,
0.03978538, -2.586209, 2.912668, 1, 1, 1, 1, 1,
0.04041445, -1.099684, 2.214652, 1, 1, 1, 1, 1,
0.04292953, -0.6009504, 0.9689858, 1, 1, 1, 1, 1,
0.04305592, -0.01656372, -0.6010215, 0, 0, 1, 1, 1,
0.04396077, 0.9316712, -0.540366, 1, 0, 0, 1, 1,
0.04719196, 0.8896294, 2.180222, 1, 0, 0, 1, 1,
0.04879116, 0.1234809, 1.845888, 1, 0, 0, 1, 1,
0.05436284, -1.171737, 3.315834, 1, 0, 0, 1, 1,
0.05459329, 0.5351214, 0.4484047, 1, 0, 0, 1, 1,
0.05547275, 0.4873142, 2.064802, 0, 0, 0, 1, 1,
0.05734637, 0.93569, -0.162026, 0, 0, 0, 1, 1,
0.05802927, -0.7184142, 2.417584, 0, 0, 0, 1, 1,
0.0646881, 1.471828, -0.3562768, 0, 0, 0, 1, 1,
0.06984527, -0.4597642, 4.168666, 0, 0, 0, 1, 1,
0.07394548, -1.456035, 4.329416, 0, 0, 0, 1, 1,
0.07444756, -0.3330586, 3.571016, 0, 0, 0, 1, 1,
0.07721616, 0.3870764, 0.7734558, 1, 1, 1, 1, 1,
0.08137734, 2.032897, 0.7644777, 1, 1, 1, 1, 1,
0.08161894, 1.727198, 1.345382, 1, 1, 1, 1, 1,
0.08245628, -0.6481579, 2.715227, 1, 1, 1, 1, 1,
0.08391654, -0.30011, 3.350973, 1, 1, 1, 1, 1,
0.08476353, 0.8415714, 0.1684675, 1, 1, 1, 1, 1,
0.08490065, -0.2521227, 2.172247, 1, 1, 1, 1, 1,
0.08564164, 0.6846123, 1.89791, 1, 1, 1, 1, 1,
0.08632064, 1.39413, 0.1276105, 1, 1, 1, 1, 1,
0.08689275, -0.8253981, 4.026394, 1, 1, 1, 1, 1,
0.08788902, -1.531681, 3.107252, 1, 1, 1, 1, 1,
0.09907074, -0.7613365, 3.718827, 1, 1, 1, 1, 1,
0.09935738, 1.60354, 0.9252877, 1, 1, 1, 1, 1,
0.1072159, 0.2283787, 1.45528, 1, 1, 1, 1, 1,
0.1103595, 0.937876, -0.7533789, 1, 1, 1, 1, 1,
0.1133562, 0.7565109, 0.02776986, 0, 0, 1, 1, 1,
0.1147309, 0.145771, 1.221579, 1, 0, 0, 1, 1,
0.1156528, 0.01397172, 2.443308, 1, 0, 0, 1, 1,
0.1177233, -2.793543, 3.128241, 1, 0, 0, 1, 1,
0.1206291, 0.1149324, 0.189414, 1, 0, 0, 1, 1,
0.1273791, 0.8284199, 1.643234, 1, 0, 0, 1, 1,
0.1359511, 0.410951, 1.022261, 0, 0, 0, 1, 1,
0.1391965, -1.211697, 3.137916, 0, 0, 0, 1, 1,
0.1408685, 0.2558831, 0.9593214, 0, 0, 0, 1, 1,
0.1429857, 0.08907481, 0.6910079, 0, 0, 0, 1, 1,
0.1538536, -0.7082919, 1.451661, 0, 0, 0, 1, 1,
0.1546679, -0.3206225, 2.358678, 0, 0, 0, 1, 1,
0.1600247, -0.4795987, 4.77622, 0, 0, 0, 1, 1,
0.1637489, -0.03174631, 4.000594, 1, 1, 1, 1, 1,
0.1638464, 0.09683881, 0.7376587, 1, 1, 1, 1, 1,
0.1640073, -0.9890515, 2.962315, 1, 1, 1, 1, 1,
0.168656, 0.08548669, 2.631254, 1, 1, 1, 1, 1,
0.1693556, 1.752739, -1.104037, 1, 1, 1, 1, 1,
0.1702506, 0.7834456, -0.6844578, 1, 1, 1, 1, 1,
0.1702959, 1.27177, 0.5918406, 1, 1, 1, 1, 1,
0.1719505, -0.8686529, 2.915567, 1, 1, 1, 1, 1,
0.1798724, -0.6278211, 2.907053, 1, 1, 1, 1, 1,
0.1844137, -0.7052054, 3.421332, 1, 1, 1, 1, 1,
0.1903377, 0.3141837, 3.030299, 1, 1, 1, 1, 1,
0.1914217, 0.2094278, 0.01485043, 1, 1, 1, 1, 1,
0.1921768, 0.3381686, 0.7522613, 1, 1, 1, 1, 1,
0.1949678, 1.206651, 0.5055861, 1, 1, 1, 1, 1,
0.1953023, 2.266548, -1.016355, 1, 1, 1, 1, 1,
0.1970387, 0.07144319, 1.378832, 0, 0, 1, 1, 1,
0.1991204, -1.346987, 4.619047, 1, 0, 0, 1, 1,
0.1996799, -0.6426599, 2.857478, 1, 0, 0, 1, 1,
0.2000768, 0.9688182, 0.05450924, 1, 0, 0, 1, 1,
0.2004147, 0.9626977, -1.537735, 1, 0, 0, 1, 1,
0.2058415, 1.166243, 1.109039, 1, 0, 0, 1, 1,
0.2089188, 2.295528, -0.3034067, 0, 0, 0, 1, 1,
0.2089735, 1.915107, 0.7483675, 0, 0, 0, 1, 1,
0.213824, -0.2332392, 4.07675, 0, 0, 0, 1, 1,
0.2155698, 1.176214, 0.9643313, 0, 0, 0, 1, 1,
0.215889, 1.866154, -0.2829674, 0, 0, 0, 1, 1,
0.2167837, 0.08339161, 1.637458, 0, 0, 0, 1, 1,
0.2218437, -0.5334539, 1.510427, 0, 0, 0, 1, 1,
0.2236544, -0.7095811, 3.538845, 1, 1, 1, 1, 1,
0.2289298, -0.08613368, 2.312914, 1, 1, 1, 1, 1,
0.230771, 0.826748, -0.8926754, 1, 1, 1, 1, 1,
0.2314156, 0.7007035, -0.7955799, 1, 1, 1, 1, 1,
0.2325201, -0.7451444, 3.824795, 1, 1, 1, 1, 1,
0.2354262, 1.254826, -1.182666, 1, 1, 1, 1, 1,
0.2372932, -0.3984601, 1.486549, 1, 1, 1, 1, 1,
0.2387046, 0.2291039, 0.8390253, 1, 1, 1, 1, 1,
0.2442515, -1.557953, 2.880618, 1, 1, 1, 1, 1,
0.2505318, 1.695247, 1.243518, 1, 1, 1, 1, 1,
0.2510884, 0.2304429, -0.4576071, 1, 1, 1, 1, 1,
0.2625871, 0.2018574, 0.4385557, 1, 1, 1, 1, 1,
0.267215, -0.5035003, 2.402214, 1, 1, 1, 1, 1,
0.2672859, -0.7640446, 2.64898, 1, 1, 1, 1, 1,
0.2701464, -0.729916, 1.588606, 1, 1, 1, 1, 1,
0.2718148, -0.6086251, 3.769972, 0, 0, 1, 1, 1,
0.2739763, 0.5510314, 2.34989, 1, 0, 0, 1, 1,
0.2770649, -2.208557, 3.16912, 1, 0, 0, 1, 1,
0.2772254, 1.43587, -0.5282641, 1, 0, 0, 1, 1,
0.2813929, 1.460237, 0.2186431, 1, 0, 0, 1, 1,
0.2827301, 0.6333637, 0.9892558, 1, 0, 0, 1, 1,
0.2861809, -0.2180345, 1.978476, 0, 0, 0, 1, 1,
0.2863214, -1.037945, 3.762753, 0, 0, 0, 1, 1,
0.2888225, 1.221653, -0.6735926, 0, 0, 0, 1, 1,
0.2888806, 0.1684712, 1.166603, 0, 0, 0, 1, 1,
0.2989251, -0.8605988, 2.68765, 0, 0, 0, 1, 1,
0.3013764, -0.7356677, 3.341844, 0, 0, 0, 1, 1,
0.302049, -1.476226, 2.284141, 0, 0, 0, 1, 1,
0.3064821, -0.4563164, 1.459681, 1, 1, 1, 1, 1,
0.3111309, 2.287707, -0.2356391, 1, 1, 1, 1, 1,
0.314584, -0.02570848, 1.810938, 1, 1, 1, 1, 1,
0.3146811, -0.1043897, 2.01216, 1, 1, 1, 1, 1,
0.3152931, 1.151922, -0.5374576, 1, 1, 1, 1, 1,
0.3165811, -1.109555, 3.687944, 1, 1, 1, 1, 1,
0.3188079, 0.03204359, 1.674202, 1, 1, 1, 1, 1,
0.3192398, -1.196129, 3.72713, 1, 1, 1, 1, 1,
0.322153, -0.2563263, 1.097033, 1, 1, 1, 1, 1,
0.3247834, -0.4130274, 2.807196, 1, 1, 1, 1, 1,
0.3356051, -0.3048806, 3.657429, 1, 1, 1, 1, 1,
0.337254, 0.8643225, -0.8286192, 1, 1, 1, 1, 1,
0.3402944, 0.9103089, -0.03109221, 1, 1, 1, 1, 1,
0.342747, -0.8905619, 2.31136, 1, 1, 1, 1, 1,
0.3431287, -0.07663288, 2.816016, 1, 1, 1, 1, 1,
0.3522703, 0.5301784, 0.7421528, 0, 0, 1, 1, 1,
0.3529005, 0.04815137, 2.814438, 1, 0, 0, 1, 1,
0.3569643, -0.326391, 3.313554, 1, 0, 0, 1, 1,
0.3588634, -0.522193, 1.683791, 1, 0, 0, 1, 1,
0.3593954, -0.7893659, 1.842612, 1, 0, 0, 1, 1,
0.3605405, 0.7410381, -0.07821279, 1, 0, 0, 1, 1,
0.3627358, -0.9269281, 5.618593, 0, 0, 0, 1, 1,
0.3643421, -0.9285239, 2.521466, 0, 0, 0, 1, 1,
0.3647114, 1.160612, -1.481441, 0, 0, 0, 1, 1,
0.367007, 0.5520511, 1.291738, 0, 0, 0, 1, 1,
0.3710399, -2.407377, 3.395195, 0, 0, 0, 1, 1,
0.3716045, -0.09586412, 1.181622, 0, 0, 0, 1, 1,
0.3716112, -0.1063358, 0.9186492, 0, 0, 0, 1, 1,
0.3756814, -1.054145, 1.719614, 1, 1, 1, 1, 1,
0.3764361, -2.512521, 4.189692, 1, 1, 1, 1, 1,
0.3769125, -0.1804021, 3.53785, 1, 1, 1, 1, 1,
0.3779601, 0.958694, -0.2599659, 1, 1, 1, 1, 1,
0.3789523, -0.1711287, 1.602854, 1, 1, 1, 1, 1,
0.38375, -0.8488119, 1.431944, 1, 1, 1, 1, 1,
0.3866787, -0.3154443, 2.350291, 1, 1, 1, 1, 1,
0.3896351, 0.3731537, 1.12311, 1, 1, 1, 1, 1,
0.3938315, 0.5624303, 1.723366, 1, 1, 1, 1, 1,
0.3944144, 1.116253, -0.39699, 1, 1, 1, 1, 1,
0.4012863, 1.071118, -1.0446, 1, 1, 1, 1, 1,
0.4018982, -1.539564, 3.07387, 1, 1, 1, 1, 1,
0.4036058, -1.066285, 3.414325, 1, 1, 1, 1, 1,
0.4141232, 0.2723846, 1.381847, 1, 1, 1, 1, 1,
0.4155644, -0.6767843, 3.525721, 1, 1, 1, 1, 1,
0.4165927, 1.446984, 0.6116744, 0, 0, 1, 1, 1,
0.4207526, -0.5322794, 0.8095642, 1, 0, 0, 1, 1,
0.4265725, 2.467258, 0.04875767, 1, 0, 0, 1, 1,
0.435602, 0.1767576, 0.9680247, 1, 0, 0, 1, 1,
0.4389333, 0.1683911, 1.781972, 1, 0, 0, 1, 1,
0.4400192, -0.1135361, 3.929378, 1, 0, 0, 1, 1,
0.4423945, -1.478227, 2.110127, 0, 0, 0, 1, 1,
0.4456039, 1.396458, 2.193331, 0, 0, 0, 1, 1,
0.4459581, -0.5564907, 3.148271, 0, 0, 0, 1, 1,
0.4485131, -1.946391, 1.997924, 0, 0, 0, 1, 1,
0.4513371, 1.223163, 0.5868239, 0, 0, 0, 1, 1,
0.4583947, -0.6338881, 2.30959, 0, 0, 0, 1, 1,
0.4591157, 0.5499158, 0.1716944, 0, 0, 0, 1, 1,
0.460343, -0.2673446, 4.813051, 1, 1, 1, 1, 1,
0.4610274, 0.8742126, 1.49923, 1, 1, 1, 1, 1,
0.4616765, -0.2591106, 0.9244946, 1, 1, 1, 1, 1,
0.4629119, 0.5066921, 0.7319264, 1, 1, 1, 1, 1,
0.464519, 1.080047, 1.38372, 1, 1, 1, 1, 1,
0.4677887, 1.677341, -0.3129696, 1, 1, 1, 1, 1,
0.4681524, 0.1601031, 1.990493, 1, 1, 1, 1, 1,
0.4683122, -0.2771907, 1.503407, 1, 1, 1, 1, 1,
0.4708624, 2.394698, 0.5268011, 1, 1, 1, 1, 1,
0.4748369, 1.565585, -0.5136808, 1, 1, 1, 1, 1,
0.4783117, -0.04829902, 0.7883447, 1, 1, 1, 1, 1,
0.4789197, -1.962404, 3.675249, 1, 1, 1, 1, 1,
0.4814851, 0.1329306, 1.652379, 1, 1, 1, 1, 1,
0.4871685, 1.33902, 1.631209, 1, 1, 1, 1, 1,
0.4878914, 0.8652821, -0.3674709, 1, 1, 1, 1, 1,
0.4882666, -0.3662007, 2.787968, 0, 0, 1, 1, 1,
0.4904485, -0.4530088, 2.434566, 1, 0, 0, 1, 1,
0.4926394, 0.08518501, 1.063861, 1, 0, 0, 1, 1,
0.4939648, -0.7428377, 5.251355, 1, 0, 0, 1, 1,
0.4959742, 1.261209, 1.343277, 1, 0, 0, 1, 1,
0.5002507, 0.6478788, 0.9183776, 1, 0, 0, 1, 1,
0.5003319, 1.383248, 0.5104119, 0, 0, 0, 1, 1,
0.5017298, 0.04397825, 1.862411, 0, 0, 0, 1, 1,
0.5214981, 1.246347, -0.3854072, 0, 0, 0, 1, 1,
0.5225689, -2.076028, 4.130722, 0, 0, 0, 1, 1,
0.5261068, 0.04266318, 1.890793, 0, 0, 0, 1, 1,
0.5376556, -0.02788523, 0.3611024, 0, 0, 0, 1, 1,
0.5401521, -0.05804734, 0.5083235, 0, 0, 0, 1, 1,
0.5435736, -0.1423873, 1.811199, 1, 1, 1, 1, 1,
0.5451995, 1.540797, -0.6551614, 1, 1, 1, 1, 1,
0.5487034, 0.2290933, 0.03729055, 1, 1, 1, 1, 1,
0.5490427, 0.2915111, 2.719712, 1, 1, 1, 1, 1,
0.549237, -0.5425642, 1.812699, 1, 1, 1, 1, 1,
0.5497536, 1.235438, -0.8989513, 1, 1, 1, 1, 1,
0.5590801, 0.1917498, -2.893281, 1, 1, 1, 1, 1,
0.5611822, -0.9665104, 1.997897, 1, 1, 1, 1, 1,
0.5631897, -1.47249, 2.9759, 1, 1, 1, 1, 1,
0.5771597, -0.1836445, 2.119871, 1, 1, 1, 1, 1,
0.5819819, -1.264259, 4.46989, 1, 1, 1, 1, 1,
0.5822951, 0.1869921, 0.5904424, 1, 1, 1, 1, 1,
0.5849323, 0.3049064, 2.713362, 1, 1, 1, 1, 1,
0.585236, 0.1423515, 1.472652, 1, 1, 1, 1, 1,
0.5899141, -0.3300503, 2.340499, 1, 1, 1, 1, 1,
0.5936415, 1.525811, 1.803133, 0, 0, 1, 1, 1,
0.5944721, -1.59591, 2.115025, 1, 0, 0, 1, 1,
0.5967745, -0.4752218, 2.170918, 1, 0, 0, 1, 1,
0.5987868, -0.9729562, 2.222265, 1, 0, 0, 1, 1,
0.6060313, 0.2469746, 0.9550219, 1, 0, 0, 1, 1,
0.6068461, -0.6660958, 2.459375, 1, 0, 0, 1, 1,
0.6085834, 0.7491016, 1.691728, 0, 0, 0, 1, 1,
0.6143827, -1.442797, 3.838217, 0, 0, 0, 1, 1,
0.6155345, 1.382333, 0.1733874, 0, 0, 0, 1, 1,
0.6170513, -0.5524426, 2.282769, 0, 0, 0, 1, 1,
0.6222168, -1.934983, 3.047113, 0, 0, 0, 1, 1,
0.6226043, -0.0385583, 0.4346837, 0, 0, 0, 1, 1,
0.6258054, 0.01127798, 1.38998, 0, 0, 0, 1, 1,
0.6292488, 1.031508, 0.2647475, 1, 1, 1, 1, 1,
0.6293262, -0.4292412, 3.092059, 1, 1, 1, 1, 1,
0.6334762, -0.5698665, 2.430025, 1, 1, 1, 1, 1,
0.6356314, -0.4288122, 2.126186, 1, 1, 1, 1, 1,
0.6359833, 1.353242, 0.7941347, 1, 1, 1, 1, 1,
0.6377042, -0.4266183, 1.963365, 1, 1, 1, 1, 1,
0.6386086, 1.259884, -0.1932168, 1, 1, 1, 1, 1,
0.648759, 0.5535905, 0.287419, 1, 1, 1, 1, 1,
0.649812, 0.9402726, 0.9182669, 1, 1, 1, 1, 1,
0.6572764, -0.890218, 2.981895, 1, 1, 1, 1, 1,
0.6656312, -0.08697551, 4.309691, 1, 1, 1, 1, 1,
0.6739025, -0.06018965, 1.411848, 1, 1, 1, 1, 1,
0.6745154, -0.8730399, 2.784428, 1, 1, 1, 1, 1,
0.6755276, 0.4288733, -0.1528767, 1, 1, 1, 1, 1,
0.67813, 2.665851, -0.1658102, 1, 1, 1, 1, 1,
0.6819981, -1.093016, 2.867979, 0, 0, 1, 1, 1,
0.6846086, -0.6319541, 2.828131, 1, 0, 0, 1, 1,
0.690662, 0.3194892, 2.536155, 1, 0, 0, 1, 1,
0.692342, 1.012483, 1.882628, 1, 0, 0, 1, 1,
0.6936858, -0.3247517, 3.575088, 1, 0, 0, 1, 1,
0.7003847, -1.314438, 2.158251, 1, 0, 0, 1, 1,
0.7033213, 0.5845895, 1.941994, 0, 0, 0, 1, 1,
0.7050915, -0.8064194, 2.467285, 0, 0, 0, 1, 1,
0.7053104, 1.967456, -0.1115819, 0, 0, 0, 1, 1,
0.7056015, 0.8438844, 0.7336402, 0, 0, 0, 1, 1,
0.7085198, -0.3895932, 2.25233, 0, 0, 0, 1, 1,
0.7086803, 0.7979531, 0.09301615, 0, 0, 0, 1, 1,
0.7135638, -1.512665, 3.753289, 0, 0, 0, 1, 1,
0.7161408, 0.4710411, 0.6862914, 1, 1, 1, 1, 1,
0.7204084, 0.7511488, 1.320188, 1, 1, 1, 1, 1,
0.732869, -0.7527345, 0.2158984, 1, 1, 1, 1, 1,
0.735236, 0.8443277, 2.454173, 1, 1, 1, 1, 1,
0.7388391, -1.323348, 3.299741, 1, 1, 1, 1, 1,
0.7401798, 1.145677, -0.03912702, 1, 1, 1, 1, 1,
0.7451054, -0.6403162, 1.781084, 1, 1, 1, 1, 1,
0.7457761, -0.2555797, 2.82881, 1, 1, 1, 1, 1,
0.7470042, 0.5936164, 1.150372, 1, 1, 1, 1, 1,
0.7517862, -0.372476, 1.451899, 1, 1, 1, 1, 1,
0.7551648, 0.03401116, 1.099382, 1, 1, 1, 1, 1,
0.7555557, -1.309261, 1.703904, 1, 1, 1, 1, 1,
0.7615584, -1.029603, 2.763125, 1, 1, 1, 1, 1,
0.7616195, 0.1440483, 2.112199, 1, 1, 1, 1, 1,
0.7638796, -0.7721543, 1.042425, 1, 1, 1, 1, 1,
0.7678234, -2.81782, 2.595147, 0, 0, 1, 1, 1,
0.7701952, 2.285208, -1.686743, 1, 0, 0, 1, 1,
0.7704449, -0.6666226, 2.991291, 1, 0, 0, 1, 1,
0.7726924, -0.4431902, 2.903579, 1, 0, 0, 1, 1,
0.7728722, 1.394119, 1.922557, 1, 0, 0, 1, 1,
0.7730873, -0.4930967, 2.389136, 1, 0, 0, 1, 1,
0.7737688, -0.4572714, 1.998316, 0, 0, 0, 1, 1,
0.7739821, 0.8722183, 1.959923, 0, 0, 0, 1, 1,
0.7756653, -0.133119, 2.202971, 0, 0, 0, 1, 1,
0.7761291, 0.9176412, 0.464093, 0, 0, 0, 1, 1,
0.7818367, -0.5079068, 0.8054286, 0, 0, 0, 1, 1,
0.7855315, 2.228229, -1.170489, 0, 0, 0, 1, 1,
0.8099404, -0.8528866, 0.6581254, 0, 0, 0, 1, 1,
0.8104697, 0.4559125, 2.018667, 1, 1, 1, 1, 1,
0.8139253, -0.8929582, 2.578426, 1, 1, 1, 1, 1,
0.8173911, -0.06788433, 1.804993, 1, 1, 1, 1, 1,
0.8180694, 1.782088, -0.226823, 1, 1, 1, 1, 1,
0.8203922, 0.635199, 1.215999, 1, 1, 1, 1, 1,
0.8209491, 0.8177366, 0.9648736, 1, 1, 1, 1, 1,
0.8221496, -0.5332093, 1.1182, 1, 1, 1, 1, 1,
0.8225495, 1.13206, -0.03458177, 1, 1, 1, 1, 1,
0.8277341, 0.2175749, 2.085398, 1, 1, 1, 1, 1,
0.8293781, 0.6611865, -0.4007933, 1, 1, 1, 1, 1,
0.8376647, -1.126288, 1.65566, 1, 1, 1, 1, 1,
0.8461348, -0.5320216, 1.141553, 1, 1, 1, 1, 1,
0.8461619, 0.5729351, -0.09631509, 1, 1, 1, 1, 1,
0.8466413, -0.2739257, 0.1379156, 1, 1, 1, 1, 1,
0.8547574, 2.295019, 0.9955969, 1, 1, 1, 1, 1,
0.860135, -0.691616, 2.644444, 0, 0, 1, 1, 1,
0.8608286, -0.5029566, 2.531814, 1, 0, 0, 1, 1,
0.8611536, 1.191024, 0.7844025, 1, 0, 0, 1, 1,
0.8618903, -0.6162174, 2.892738, 1, 0, 0, 1, 1,
0.8626209, 1.270793, 0.8902042, 1, 0, 0, 1, 1,
0.8631931, -0.553185, 2.276193, 1, 0, 0, 1, 1,
0.8668373, 0.8941057, 1.856515, 0, 0, 0, 1, 1,
0.8688033, -0.3770801, 1.981928, 0, 0, 0, 1, 1,
0.8714966, 0.04949973, 1.667118, 0, 0, 0, 1, 1,
0.8753587, 0.9013888, 1.71471, 0, 0, 0, 1, 1,
0.8782216, 1.486169, -1.529235, 0, 0, 0, 1, 1,
0.8783148, 0.5360774, 2.004785, 0, 0, 0, 1, 1,
0.8869696, -1.51278, 2.266042, 0, 0, 0, 1, 1,
0.8878255, 0.7662838, 0.4769381, 1, 1, 1, 1, 1,
0.8889749, 0.07837301, 0.5936221, 1, 1, 1, 1, 1,
0.8934753, 1.280581, 0.6341035, 1, 1, 1, 1, 1,
0.9006784, -0.5828965, 2.745566, 1, 1, 1, 1, 1,
0.9062688, -0.3019032, 2.935457, 1, 1, 1, 1, 1,
0.9159505, -1.299319, 2.455569, 1, 1, 1, 1, 1,
0.9259331, -0.5518692, 3.22643, 1, 1, 1, 1, 1,
0.9322976, 0.2220173, 1.536069, 1, 1, 1, 1, 1,
0.93262, -1.643285, 1.304253, 1, 1, 1, 1, 1,
0.9380418, 0.8196104, 1.920512, 1, 1, 1, 1, 1,
0.9431742, -3.32019, 2.136721, 1, 1, 1, 1, 1,
0.9438639, 1.112306, -0.6788822, 1, 1, 1, 1, 1,
0.9548959, 0.05556812, 2.349631, 1, 1, 1, 1, 1,
0.9549976, 0.2774269, 1.066027, 1, 1, 1, 1, 1,
0.9553314, 0.9106866, 1.449576, 1, 1, 1, 1, 1,
0.9590977, 1.196815, 0.4784313, 0, 0, 1, 1, 1,
0.9622681, -0.7486775, 1.446326, 1, 0, 0, 1, 1,
0.9658965, -2.427379, 3.83859, 1, 0, 0, 1, 1,
0.9790792, 0.5726375, 1.389439, 1, 0, 0, 1, 1,
0.9797594, -0.6587746, 1.885628, 1, 0, 0, 1, 1,
0.9845281, 1.563136, 1.616443, 1, 0, 0, 1, 1,
0.9847569, 2.383888, -0.001619679, 0, 0, 0, 1, 1,
0.9868912, -0.04262559, 2.265381, 0, 0, 0, 1, 1,
0.9911237, -0.2954466, 2.411194, 0, 0, 0, 1, 1,
1.001264, 0.25668, 2.014044, 0, 0, 0, 1, 1,
1.007932, -0.2326143, 0.546799, 0, 0, 0, 1, 1,
1.01648, 0.5550861, 0.4729789, 0, 0, 0, 1, 1,
1.018233, -0.03699095, 1.664329, 0, 0, 0, 1, 1,
1.024028, 0.5249274, 0.3481329, 1, 1, 1, 1, 1,
1.038597, -1.165147, 3.390166, 1, 1, 1, 1, 1,
1.049397, -0.09837968, 2.045005, 1, 1, 1, 1, 1,
1.054959, 0.2820486, 1.068462, 1, 1, 1, 1, 1,
1.056087, -0.4973442, 2.147416, 1, 1, 1, 1, 1,
1.063907, -0.0791475, 0.8938162, 1, 1, 1, 1, 1,
1.067792, 0.008002257, 0.810561, 1, 1, 1, 1, 1,
1.069118, -0.7804646, 2.944944, 1, 1, 1, 1, 1,
1.07091, -0.6635748, 2.786998, 1, 1, 1, 1, 1,
1.074357, -0.1205955, 0.02500955, 1, 1, 1, 1, 1,
1.074499, 0.4266509, 0.5157296, 1, 1, 1, 1, 1,
1.079716, 0.5774936, 1.187107, 1, 1, 1, 1, 1,
1.083702, 0.8568217, 0.01968484, 1, 1, 1, 1, 1,
1.085158, 0.1689679, 1.293733, 1, 1, 1, 1, 1,
1.08584, 0.4621726, 2.35735, 1, 1, 1, 1, 1,
1.100058, -0.1502612, 0.400035, 0, 0, 1, 1, 1,
1.10022, -0.3037671, 1.205299, 1, 0, 0, 1, 1,
1.10272, -1.568816, 2.438215, 1, 0, 0, 1, 1,
1.104577, 0.244869, 1.656621, 1, 0, 0, 1, 1,
1.115894, -0.5704612, 2.676981, 1, 0, 0, 1, 1,
1.120142, -1.016529, 0.8762257, 1, 0, 0, 1, 1,
1.137829, -0.4091472, 1.06257, 0, 0, 0, 1, 1,
1.145802, -1.92119, 1.943845, 0, 0, 0, 1, 1,
1.152264, 0.4294574, 0.5444883, 0, 0, 0, 1, 1,
1.156483, -2.101552, 4.174231, 0, 0, 0, 1, 1,
1.166938, 1.179127, 2.02629, 0, 0, 0, 1, 1,
1.168841, 1.079059, 0.8472971, 0, 0, 0, 1, 1,
1.172442, -0.9492866, 3.212246, 0, 0, 0, 1, 1,
1.173877, -0.7396364, 2.509156, 1, 1, 1, 1, 1,
1.173937, 1.181907, -1.000657, 1, 1, 1, 1, 1,
1.183418, 1.923362, 0.3772261, 1, 1, 1, 1, 1,
1.183611, 1.68286, -0.5920604, 1, 1, 1, 1, 1,
1.184244, -0.9259821, 1.106464, 1, 1, 1, 1, 1,
1.184912, -0.6657865, 0.9007615, 1, 1, 1, 1, 1,
1.200728, 3.297569, -2.407178, 1, 1, 1, 1, 1,
1.201348, 0.310955, 0.8264938, 1, 1, 1, 1, 1,
1.209248, -1.258636, 2.931469, 1, 1, 1, 1, 1,
1.219633, -0.1886623, 2.098553, 1, 1, 1, 1, 1,
1.224996, 0.8141519, 1.835082, 1, 1, 1, 1, 1,
1.228031, 0.7446944, -0.5324743, 1, 1, 1, 1, 1,
1.235681, -0.5072449, 2.795581, 1, 1, 1, 1, 1,
1.239428, -1.33999, 2.968119, 1, 1, 1, 1, 1,
1.253948, -1.163199, 2.939341, 1, 1, 1, 1, 1,
1.26704, 0.05812779, 2.724367, 0, 0, 1, 1, 1,
1.275589, -0.6908557, 1.850378, 1, 0, 0, 1, 1,
1.276448, 0.05140786, 1.175127, 1, 0, 0, 1, 1,
1.281748, 0.9191074, 1.344668, 1, 0, 0, 1, 1,
1.292187, 0.5554513, -0.4541692, 1, 0, 0, 1, 1,
1.29358, 0.2220242, 1.606877, 1, 0, 0, 1, 1,
1.308922, 0.9255083, 1.053944, 0, 0, 0, 1, 1,
1.313757, 0.4578615, 0.9659783, 0, 0, 0, 1, 1,
1.318702, 0.5515777, 2.329018, 0, 0, 0, 1, 1,
1.321064, -0.5306599, 2.994706, 0, 0, 0, 1, 1,
1.322799, -1.418893, 3.524305, 0, 0, 0, 1, 1,
1.340017, 0.5654433, 1.841822, 0, 0, 0, 1, 1,
1.349886, 1.723604, -1.887332, 0, 0, 0, 1, 1,
1.352936, -1.002083, 0.6407316, 1, 1, 1, 1, 1,
1.355167, -1.8217, 2.804043, 1, 1, 1, 1, 1,
1.355887, 0.6498794, 1.558942, 1, 1, 1, 1, 1,
1.368118, -0.9452732, 1.571419, 1, 1, 1, 1, 1,
1.369941, 0.8757089, 0.2103443, 1, 1, 1, 1, 1,
1.375406, -0.8732867, 2.611794, 1, 1, 1, 1, 1,
1.379761, -0.1673765, 2.141958, 1, 1, 1, 1, 1,
1.381956, -1.525862, 3.844013, 1, 1, 1, 1, 1,
1.396454, 0.1800478, 1.619134, 1, 1, 1, 1, 1,
1.39752, 1.013927, 2.582178, 1, 1, 1, 1, 1,
1.398424, 2.269531, -0.01127089, 1, 1, 1, 1, 1,
1.403393, 0.8570966, -0.01227029, 1, 1, 1, 1, 1,
1.409138, -0.8299647, 1.43327, 1, 1, 1, 1, 1,
1.420826, -1.616804, 2.506525, 1, 1, 1, 1, 1,
1.430804, -0.7935141, 0.4304748, 1, 1, 1, 1, 1,
1.432702, -1.120481, 1.863219, 0, 0, 1, 1, 1,
1.45626, 0.5872284, -0.7889591, 1, 0, 0, 1, 1,
1.470426, 0.1072681, 2.071638, 1, 0, 0, 1, 1,
1.471853, 0.693708, 1.395053, 1, 0, 0, 1, 1,
1.49439, 0.9591054, 0.7012619, 1, 0, 0, 1, 1,
1.498251, 0.3969265, 1.563325, 1, 0, 0, 1, 1,
1.500436, -0.3678753, 2.693938, 0, 0, 0, 1, 1,
1.509017, -0.4186436, -0.4091751, 0, 0, 0, 1, 1,
1.510864, -0.2049331, 0.784921, 0, 0, 0, 1, 1,
1.515316, 0.516876, 1.432387, 0, 0, 0, 1, 1,
1.534539, -0.8832804, 0.5128545, 0, 0, 0, 1, 1,
1.543961, 0.9952304, -0.2891735, 0, 0, 0, 1, 1,
1.547845, 0.912829, 1.04428, 0, 0, 0, 1, 1,
1.547899, -0.4397761, -0.5768923, 1, 1, 1, 1, 1,
1.557634, -0.5533398, 1.422576, 1, 1, 1, 1, 1,
1.57858, -0.01568596, 1.453651, 1, 1, 1, 1, 1,
1.591568, 0.005034598, 2.470088, 1, 1, 1, 1, 1,
1.593581, -1.303013, 2.736627, 1, 1, 1, 1, 1,
1.594214, -0.02263631, 2.782693, 1, 1, 1, 1, 1,
1.606775, 1.608939, 0.6438118, 1, 1, 1, 1, 1,
1.625745, -0.1904841, 1.489223, 1, 1, 1, 1, 1,
1.631068, -0.1949569, 0.3720625, 1, 1, 1, 1, 1,
1.636486, -0.5848646, 1.063434, 1, 1, 1, 1, 1,
1.646646, -1.435284, 2.402263, 1, 1, 1, 1, 1,
1.656641, 0.04402602, 3.74752, 1, 1, 1, 1, 1,
1.656976, -1.114964, 1.919823, 1, 1, 1, 1, 1,
1.657673, 1.366129, 0.1018569, 1, 1, 1, 1, 1,
1.667345, 0.4987091, 1.696236, 1, 1, 1, 1, 1,
1.668674, -0.5710272, 1.921979, 0, 0, 1, 1, 1,
1.686155, -0.1537279, 1.893694, 1, 0, 0, 1, 1,
1.691772, 0.9433351, 1.400021, 1, 0, 0, 1, 1,
1.700649, -1.726673, 2.368302, 1, 0, 0, 1, 1,
1.74225, -1.576285, 2.557518, 1, 0, 0, 1, 1,
1.743785, -0.2408623, 0.447497, 1, 0, 0, 1, 1,
1.772071, 0.009953001, 0.9302347, 0, 0, 0, 1, 1,
1.77325, -0.6647261, 1.74887, 0, 0, 0, 1, 1,
1.798606, -1.437081, 1.845444, 0, 0, 0, 1, 1,
1.805323, 1.921412, 1.196128, 0, 0, 0, 1, 1,
1.805835, -1.635617, 2.698116, 0, 0, 0, 1, 1,
1.826916, -0.1487021, 2.386977, 0, 0, 0, 1, 1,
1.837072, 1.193335, 2.599457, 0, 0, 0, 1, 1,
1.840701, 0.4973519, 2.218261, 1, 1, 1, 1, 1,
1.842899, 0.5761282, -0.03758407, 1, 1, 1, 1, 1,
1.843054, 0.5011322, 1.862997, 1, 1, 1, 1, 1,
1.851995, 0.5740384, 1.436915, 1, 1, 1, 1, 1,
1.918628, 1.481158, 1.275302, 1, 1, 1, 1, 1,
1.92678, -0.6680164, 1.379936, 1, 1, 1, 1, 1,
1.935408, 0.6187155, 0.7735323, 1, 1, 1, 1, 1,
1.936291, 0.8763079, 0.2432649, 1, 1, 1, 1, 1,
1.950336, 1.849781, 0.5939021, 1, 1, 1, 1, 1,
1.980694, -0.167221, 2.075772, 1, 1, 1, 1, 1,
1.999562, 0.5884764, 0.7370474, 1, 1, 1, 1, 1,
2.021953, -1.085278, 1.567042, 1, 1, 1, 1, 1,
2.048661, 0.8308174, 2.13554, 1, 1, 1, 1, 1,
2.057811, -0.03539455, 2.028141, 1, 1, 1, 1, 1,
2.060854, -0.9782352, 1.288026, 1, 1, 1, 1, 1,
2.068504, 0.005682368, 0.3312112, 0, 0, 1, 1, 1,
2.072646, 0.9506285, 1.156001, 1, 0, 0, 1, 1,
2.148483, -0.01742301, 1.41473, 1, 0, 0, 1, 1,
2.215711, -0.01475975, 0.7643417, 1, 0, 0, 1, 1,
2.233632, 2.30863, 1.713254, 1, 0, 0, 1, 1,
2.254811, -0.8124036, 1.681282, 1, 0, 0, 1, 1,
2.256693, -2.135141, 1.411833, 0, 0, 0, 1, 1,
2.337337, 1.365618, 1.564566, 0, 0, 0, 1, 1,
2.36859, 0.2658708, 2.885217, 0, 0, 0, 1, 1,
2.377102, -0.09412225, 2.187566, 0, 0, 0, 1, 1,
2.380465, -0.3367942, 1.503776, 0, 0, 0, 1, 1,
2.431538, 0.5102208, 1.00395, 0, 0, 0, 1, 1,
2.444691, -0.5897712, 0.2174625, 0, 0, 0, 1, 1,
2.476992, -1.385838, 2.964858, 1, 1, 1, 1, 1,
2.544543, 0.02463303, -0.04851203, 1, 1, 1, 1, 1,
2.555094, -1.169792, 2.492491, 1, 1, 1, 1, 1,
2.607772, -0.4460806, 2.103334, 1, 1, 1, 1, 1,
2.623419, -0.9572675, 2.813786, 1, 1, 1, 1, 1,
2.638945, 0.3475668, 1.958088, 1, 1, 1, 1, 1,
3.080872, -0.3547199, 2.790651, 1, 1, 1, 1, 1
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
var radius = 9.817109;
var distance = 34.48218;
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
mvMatrix.translate( 0.05105686, 0.01131034, 0.01541114 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.48218);
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
