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
-2.97914, -0.9520583, -1.675562, 1, 0, 0, 1,
-2.865367, -1.707204, -2.002574, 1, 0.007843138, 0, 1,
-2.828258, 0.389443, -2.248647, 1, 0.01176471, 0, 1,
-2.823919, -0.6615212, -2.696786, 1, 0.01960784, 0, 1,
-2.653057, -0.1468717, -2.353757, 1, 0.02352941, 0, 1,
-2.650463, -0.2266076, -1.944045, 1, 0.03137255, 0, 1,
-2.560178, 0.279001, -3.556563, 1, 0.03529412, 0, 1,
-2.526559, 1.797457, -0.6814495, 1, 0.04313726, 0, 1,
-2.422814, 0.6638887, -1.56902, 1, 0.04705882, 0, 1,
-2.415572, -0.7011346, -2.391063, 1, 0.05490196, 0, 1,
-2.38645, -0.07866323, -3.253676, 1, 0.05882353, 0, 1,
-2.314207, -1.000427, -3.104819, 1, 0.06666667, 0, 1,
-2.118487, -0.8760203, -3.093, 1, 0.07058824, 0, 1,
-2.095772, 1.717403, -0.8391592, 1, 0.07843138, 0, 1,
-2.072789, 0.2612399, -2.606834, 1, 0.08235294, 0, 1,
-2.025635, 0.5840821, -1.679573, 1, 0.09019608, 0, 1,
-2.005664, -0.3755813, -2.968429, 1, 0.09411765, 0, 1,
-1.979503, 0.4700112, -0.235271, 1, 0.1019608, 0, 1,
-1.970745, 1.170073, -1.972742, 1, 0.1098039, 0, 1,
-1.967288, -0.6541425, -1.797562, 1, 0.1137255, 0, 1,
-1.962506, 1.584386, 0.2843887, 1, 0.1215686, 0, 1,
-1.956076, -1.557181, -2.272438, 1, 0.1254902, 0, 1,
-1.954277, -1.326931, -2.664233, 1, 0.1333333, 0, 1,
-1.950394, -0.02333116, -2.496947, 1, 0.1372549, 0, 1,
-1.91902, 0.2691468, 0.2872726, 1, 0.145098, 0, 1,
-1.881339, 0.2117239, -2.140827, 1, 0.1490196, 0, 1,
-1.876194, -0.07918029, -0.7543606, 1, 0.1568628, 0, 1,
-1.856197, -1.08241, -2.845998, 1, 0.1607843, 0, 1,
-1.832861, 1.544089, 0.3613096, 1, 0.1686275, 0, 1,
-1.824768, 1.380742, -2.476445, 1, 0.172549, 0, 1,
-1.822381, -0.9262536, -3.501646, 1, 0.1803922, 0, 1,
-1.816262, 0.8743331, -2.354287, 1, 0.1843137, 0, 1,
-1.79582, 1.660739, 0.9613764, 1, 0.1921569, 0, 1,
-1.788861, -0.9481035, -0.445162, 1, 0.1960784, 0, 1,
-1.783372, 1.198464, -0.8290007, 1, 0.2039216, 0, 1,
-1.781222, 2.635304, -2.108257, 1, 0.2117647, 0, 1,
-1.766126, 1.330616, -1.116914, 1, 0.2156863, 0, 1,
-1.748516, 0.6699806, -1.180781, 1, 0.2235294, 0, 1,
-1.745566, -0.3297456, -1.792064, 1, 0.227451, 0, 1,
-1.745262, 1.182125, 0.4428439, 1, 0.2352941, 0, 1,
-1.701594, -0.07867331, -4.093057, 1, 0.2392157, 0, 1,
-1.700111, 1.798482, -1.131932, 1, 0.2470588, 0, 1,
-1.691299, -0.05093345, -3.108905, 1, 0.2509804, 0, 1,
-1.688061, 0.1515466, -0.9592918, 1, 0.2588235, 0, 1,
-1.677364, -0.04143474, -1.303097, 1, 0.2627451, 0, 1,
-1.677005, 1.092873, -1.013006, 1, 0.2705882, 0, 1,
-1.665729, -0.8143455, -2.419131, 1, 0.2745098, 0, 1,
-1.654194, 0.7159885, 1.357034, 1, 0.282353, 0, 1,
-1.646608, 1.036662, 0.3740459, 1, 0.2862745, 0, 1,
-1.644314, -0.3304271, -2.96892, 1, 0.2941177, 0, 1,
-1.642893, -1.385423, -1.328236, 1, 0.3019608, 0, 1,
-1.634609, 0.3727995, -2.998547, 1, 0.3058824, 0, 1,
-1.629761, -0.8668973, -0.592801, 1, 0.3137255, 0, 1,
-1.629542, -0.3096629, -2.222535, 1, 0.3176471, 0, 1,
-1.627957, 1.243568, -1.399717, 1, 0.3254902, 0, 1,
-1.625134, 0.5305176, -1.338543, 1, 0.3294118, 0, 1,
-1.624442, -0.1240901, -1.948557, 1, 0.3372549, 0, 1,
-1.619834, -1.545473, -3.001757, 1, 0.3411765, 0, 1,
-1.613802, -1.311201, -4.108364, 1, 0.3490196, 0, 1,
-1.606668, 1.382366, -0.02024431, 1, 0.3529412, 0, 1,
-1.599046, 2.36248, -1.580373, 1, 0.3607843, 0, 1,
-1.58987, -0.8201258, -3.973583, 1, 0.3647059, 0, 1,
-1.589666, -0.4471717, -0.6883184, 1, 0.372549, 0, 1,
-1.588712, 2.528119, 0.6249816, 1, 0.3764706, 0, 1,
-1.570328, -1.742884, -5.789719, 1, 0.3843137, 0, 1,
-1.566001, -0.7766081, -0.9743039, 1, 0.3882353, 0, 1,
-1.549568, 2.71681, 0.5730227, 1, 0.3960784, 0, 1,
-1.537789, 1.319456, -3.152914, 1, 0.4039216, 0, 1,
-1.53191, -0.8479987, -2.407471, 1, 0.4078431, 0, 1,
-1.529055, -0.04936468, -2.049298, 1, 0.4156863, 0, 1,
-1.527599, -0.9543696, -1.932114, 1, 0.4196078, 0, 1,
-1.485487, -0.08478624, -2.478867, 1, 0.427451, 0, 1,
-1.485263, 0.3761058, -1.061855, 1, 0.4313726, 0, 1,
-1.484486, -0.2870724, -2.989092, 1, 0.4392157, 0, 1,
-1.475192, 0.4720966, -2.791595, 1, 0.4431373, 0, 1,
-1.459165, 1.263294, 1.166099, 1, 0.4509804, 0, 1,
-1.453306, 1.033061, 0.01384782, 1, 0.454902, 0, 1,
-1.449728, -0.07689408, -1.981897, 1, 0.4627451, 0, 1,
-1.445727, -0.3340414, -2.998946, 1, 0.4666667, 0, 1,
-1.429759, 0.6453579, -0.3308292, 1, 0.4745098, 0, 1,
-1.411956, -0.5555537, -1.780018, 1, 0.4784314, 0, 1,
-1.401756, 0.6975246, -1.853256, 1, 0.4862745, 0, 1,
-1.400473, 1.473319, -0.9217731, 1, 0.4901961, 0, 1,
-1.392375, -0.6831008, -2.598969, 1, 0.4980392, 0, 1,
-1.389994, 1.083619, -1.946083, 1, 0.5058824, 0, 1,
-1.389668, -1.223159, -0.7327253, 1, 0.509804, 0, 1,
-1.387607, 1.041553, 0.1657046, 1, 0.5176471, 0, 1,
-1.385119, -0.559173, -3.047802, 1, 0.5215687, 0, 1,
-1.384109, -1.407801, -2.497912, 1, 0.5294118, 0, 1,
-1.378575, -0.6213785, -1.798071, 1, 0.5333334, 0, 1,
-1.374886, -0.7713757, -0.55472, 1, 0.5411765, 0, 1,
-1.371227, -0.4116932, -2.883281, 1, 0.5450981, 0, 1,
-1.369815, 0.9258975, -2.182996, 1, 0.5529412, 0, 1,
-1.365925, -1.600353, -1.915443, 1, 0.5568628, 0, 1,
-1.353951, -0.9508514, -1.786891, 1, 0.5647059, 0, 1,
-1.34303, 0.4491968, -1.18998, 1, 0.5686275, 0, 1,
-1.340926, 2.096235, -0.7383518, 1, 0.5764706, 0, 1,
-1.340064, -0.09994946, -2.879157, 1, 0.5803922, 0, 1,
-1.33897, -0.6114541, -3.314072, 1, 0.5882353, 0, 1,
-1.330043, -1.044991, -2.143303, 1, 0.5921569, 0, 1,
-1.321612, -0.1756142, -2.771561, 1, 0.6, 0, 1,
-1.308823, 1.891276, -1.028073, 1, 0.6078432, 0, 1,
-1.306271, 1.032956, -1.088296, 1, 0.6117647, 0, 1,
-1.294685, -1.739898, -1.121649, 1, 0.6196079, 0, 1,
-1.292044, -0.9243028, -3.099118, 1, 0.6235294, 0, 1,
-1.291046, -0.05447648, -0.4093994, 1, 0.6313726, 0, 1,
-1.288736, 0.2503684, -0.8057761, 1, 0.6352941, 0, 1,
-1.282995, -0.0559899, -3.461075, 1, 0.6431373, 0, 1,
-1.277038, -0.03913318, -1.4057, 1, 0.6470588, 0, 1,
-1.274116, -2.724374, -1.620624, 1, 0.654902, 0, 1,
-1.271091, 0.2853825, 0.9741704, 1, 0.6588235, 0, 1,
-1.270746, 1.256683, -0.1940986, 1, 0.6666667, 0, 1,
-1.269933, 0.5365409, -1.768707, 1, 0.6705883, 0, 1,
-1.261233, -1.338464, -3.440303, 1, 0.6784314, 0, 1,
-1.258725, 1.035405, -1.061696, 1, 0.682353, 0, 1,
-1.255224, -1.430282, -1.755964, 1, 0.6901961, 0, 1,
-1.25156, -0.7902374, -2.818555, 1, 0.6941177, 0, 1,
-1.251213, 0.561009, 0.1370926, 1, 0.7019608, 0, 1,
-1.250362, 0.09703426, -1.769815, 1, 0.7098039, 0, 1,
-1.249009, 1.121382, -3.882792, 1, 0.7137255, 0, 1,
-1.248453, 0.7437168, -2.108654, 1, 0.7215686, 0, 1,
-1.242196, 1.777692, -1.314388, 1, 0.7254902, 0, 1,
-1.234194, -1.398134, -1.263676, 1, 0.7333333, 0, 1,
-1.219274, -0.4787947, -0.2137342, 1, 0.7372549, 0, 1,
-1.218078, -1.48329, -1.24423, 1, 0.7450981, 0, 1,
-1.201146, 0.2745688, 1.89767, 1, 0.7490196, 0, 1,
-1.200202, 0.03575526, -1.334807, 1, 0.7568628, 0, 1,
-1.198173, 0.4274841, -0.4624935, 1, 0.7607843, 0, 1,
-1.197363, 0.1442023, -1.5616, 1, 0.7686275, 0, 1,
-1.194379, -0.416372, -1.401791, 1, 0.772549, 0, 1,
-1.173329, -0.7522249, -2.971492, 1, 0.7803922, 0, 1,
-1.155379, -0.6366277, -3.602988, 1, 0.7843137, 0, 1,
-1.147546, 0.3921453, -1.030534, 1, 0.7921569, 0, 1,
-1.136549, -0.3675815, -1.487957, 1, 0.7960784, 0, 1,
-1.135538, 0.9837032, -1.496848, 1, 0.8039216, 0, 1,
-1.124501, -2.56593, -3.957857, 1, 0.8117647, 0, 1,
-1.121112, 0.7880531, 0.02735418, 1, 0.8156863, 0, 1,
-1.099678, 1.553707, -1.767855, 1, 0.8235294, 0, 1,
-1.098523, -0.7135755, -3.01264, 1, 0.827451, 0, 1,
-1.096873, -1.026505, -3.718338, 1, 0.8352941, 0, 1,
-1.089067, -0.03619245, -4.049304, 1, 0.8392157, 0, 1,
-1.082653, -0.7527493, -1.858831, 1, 0.8470588, 0, 1,
-1.08107, -0.2277594, -1.500998, 1, 0.8509804, 0, 1,
-1.070677, -0.03631494, -1.278046, 1, 0.8588235, 0, 1,
-1.070295, 0.2710469, -1.024956, 1, 0.8627451, 0, 1,
-1.069446, -0.310237, -2.610046, 1, 0.8705882, 0, 1,
-1.067188, 1.123527, -0.05656724, 1, 0.8745098, 0, 1,
-1.066356, -1.280125, -2.015356, 1, 0.8823529, 0, 1,
-1.064906, 0.1057659, -1.144747, 1, 0.8862745, 0, 1,
-1.061931, -1.885885, -2.809755, 1, 0.8941177, 0, 1,
-1.053647, -0.9854289, -2.711943, 1, 0.8980392, 0, 1,
-1.044546, 1.144753, -0.9090176, 1, 0.9058824, 0, 1,
-1.038062, -0.5002543, -3.002861, 1, 0.9137255, 0, 1,
-1.032802, -0.7690565, -1.862013, 1, 0.9176471, 0, 1,
-1.03073, -0.6066247, -1.711373, 1, 0.9254902, 0, 1,
-1.029981, -1.398901, -2.407744, 1, 0.9294118, 0, 1,
-1.023408, 0.1136743, 0.2455988, 1, 0.9372549, 0, 1,
-1.02212, 0.8964241, 0.1842093, 1, 0.9411765, 0, 1,
-1.020417, -0.0694357, -2.611883, 1, 0.9490196, 0, 1,
-1.011743, -1.572753, -3.74756, 1, 0.9529412, 0, 1,
-1.006443, 0.4392727, -2.189064, 1, 0.9607843, 0, 1,
-1.00334, -1.967266, -4.420068, 1, 0.9647059, 0, 1,
-1.002307, -2.185848, -1.69091, 1, 0.972549, 0, 1,
-1.001487, -0.5408226, -1.328939, 1, 0.9764706, 0, 1,
-0.9936804, 0.1268419, -2.59529, 1, 0.9843137, 0, 1,
-0.9922222, 0.1284839, -0.6613873, 1, 0.9882353, 0, 1,
-0.9905371, -0.9468292, -2.251549, 1, 0.9960784, 0, 1,
-0.9891824, -0.07082859, 0.5604318, 0.9960784, 1, 0, 1,
-0.987219, 0.2018842, -1.079294, 0.9921569, 1, 0, 1,
-0.9600176, 0.06795363, -2.298093, 0.9843137, 1, 0, 1,
-0.9245822, 0.6155918, -1.316749, 0.9803922, 1, 0, 1,
-0.9236177, -0.5164946, -1.194186, 0.972549, 1, 0, 1,
-0.9180308, -1.107898, -2.831079, 0.9686275, 1, 0, 1,
-0.917505, 0.8804522, -2.554564, 0.9607843, 1, 0, 1,
-0.9111879, 1.491803, -1.043386, 0.9568627, 1, 0, 1,
-0.9046988, 0.407038, -2.003542, 0.9490196, 1, 0, 1,
-0.903195, 0.1141079, -2.444177, 0.945098, 1, 0, 1,
-0.8993546, -0.6562346, -3.17963, 0.9372549, 1, 0, 1,
-0.8957069, -0.276313, -2.410944, 0.9333333, 1, 0, 1,
-0.8938698, -0.8569696, -2.087403, 0.9254902, 1, 0, 1,
-0.8916149, -0.310169, -3.080465, 0.9215686, 1, 0, 1,
-0.8879846, 0.8514971, -1.556, 0.9137255, 1, 0, 1,
-0.8845101, -0.698541, -2.979577, 0.9098039, 1, 0, 1,
-0.8836952, 0.9538925, -0.322575, 0.9019608, 1, 0, 1,
-0.8795657, 0.09934137, -1.498974, 0.8941177, 1, 0, 1,
-0.87753, -2.179807, -1.925101, 0.8901961, 1, 0, 1,
-0.8774223, 1.75993, -0.5694968, 0.8823529, 1, 0, 1,
-0.8705615, -0.7360573, -3.688817, 0.8784314, 1, 0, 1,
-0.8700456, -0.9214203, -1.93213, 0.8705882, 1, 0, 1,
-0.8695764, 0.7509764, -1.910387, 0.8666667, 1, 0, 1,
-0.8615831, 0.1980884, -0.000512834, 0.8588235, 1, 0, 1,
-0.8554797, 1.568497, 1.706712, 0.854902, 1, 0, 1,
-0.8549814, 2.236897, 0.6332352, 0.8470588, 1, 0, 1,
-0.8531197, -0.8225768, -2.048393, 0.8431373, 1, 0, 1,
-0.8518988, 0.6927398, 0.3154688, 0.8352941, 1, 0, 1,
-0.8508505, 0.3218706, 0.4423079, 0.8313726, 1, 0, 1,
-0.8487609, -0.9747409, -1.954031, 0.8235294, 1, 0, 1,
-0.8483365, -1.245177, -2.502499, 0.8196079, 1, 0, 1,
-0.8263547, 0.06038621, -0.3091028, 0.8117647, 1, 0, 1,
-0.8249967, 0.01603622, -0.9638304, 0.8078431, 1, 0, 1,
-0.8222927, -0.685572, -0.9708335, 0.8, 1, 0, 1,
-0.820351, -1.249955, -1.214264, 0.7921569, 1, 0, 1,
-0.8097634, -0.03264071, -1.571567, 0.7882353, 1, 0, 1,
-0.809754, -1.003846, -0.08702065, 0.7803922, 1, 0, 1,
-0.8056554, -0.151618, -1.327583, 0.7764706, 1, 0, 1,
-0.8008616, -0.2598188, -2.670107, 0.7686275, 1, 0, 1,
-0.7997469, -0.2181506, -1.43054, 0.7647059, 1, 0, 1,
-0.7991388, 0.1740646, -1.259143, 0.7568628, 1, 0, 1,
-0.795802, -0.1607213, -3.959454, 0.7529412, 1, 0, 1,
-0.7923856, -0.1085247, -2.111228, 0.7450981, 1, 0, 1,
-0.7913102, 0.1984683, -2.693779, 0.7411765, 1, 0, 1,
-0.7861674, 0.2666789, -0.09516365, 0.7333333, 1, 0, 1,
-0.7845606, 1.370986, 0.9995417, 0.7294118, 1, 0, 1,
-0.7829129, -1.375574, -2.676497, 0.7215686, 1, 0, 1,
-0.7785794, 0.1830213, -2.117127, 0.7176471, 1, 0, 1,
-0.77195, 0.8497341, -0.1229596, 0.7098039, 1, 0, 1,
-0.7706347, 0.9071673, -0.2256816, 0.7058824, 1, 0, 1,
-0.767271, -1.811494, -2.599929, 0.6980392, 1, 0, 1,
-0.7575206, 0.4765366, -0.8104424, 0.6901961, 1, 0, 1,
-0.7567174, 0.04860507, -0.9936666, 0.6862745, 1, 0, 1,
-0.7495992, 0.6065831, -0.455465, 0.6784314, 1, 0, 1,
-0.74299, -0.6506227, -2.570929, 0.6745098, 1, 0, 1,
-0.7428427, 0.4021119, -0.7453935, 0.6666667, 1, 0, 1,
-0.7420602, -0.01481211, -1.914552, 0.6627451, 1, 0, 1,
-0.7344174, -0.0355332, 0.4379426, 0.654902, 1, 0, 1,
-0.7313724, 1.363987, -0.034856, 0.6509804, 1, 0, 1,
-0.7283604, -0.3120891, -2.372952, 0.6431373, 1, 0, 1,
-0.7262457, 1.279024, -0.5409277, 0.6392157, 1, 0, 1,
-0.725621, -0.700941, -2.171736, 0.6313726, 1, 0, 1,
-0.7175988, 1.109275, -1.468927, 0.627451, 1, 0, 1,
-0.7165805, -0.8454363, -2.171702, 0.6196079, 1, 0, 1,
-0.7130975, 0.9131093, 0.09350116, 0.6156863, 1, 0, 1,
-0.7073331, 0.8026674, -0.5957894, 0.6078432, 1, 0, 1,
-0.706156, 0.4019318, -1.25811, 0.6039216, 1, 0, 1,
-0.7044884, 0.8020238, -1.472849, 0.5960785, 1, 0, 1,
-0.6995991, 1.402204, -1.078554, 0.5882353, 1, 0, 1,
-0.6976386, 0.3540487, 1.288454, 0.5843138, 1, 0, 1,
-0.6966599, 0.4271534, -3.371102, 0.5764706, 1, 0, 1,
-0.6869851, -0.7629036, -2.575325, 0.572549, 1, 0, 1,
-0.6826026, 1.487041, -0.2423819, 0.5647059, 1, 0, 1,
-0.6763384, 1.459244, -0.2780841, 0.5607843, 1, 0, 1,
-0.6759292, 0.6500503, -1.257154, 0.5529412, 1, 0, 1,
-0.6734114, 0.7081856, -1.064928, 0.5490196, 1, 0, 1,
-0.6701148, 0.1946317, -0.5550682, 0.5411765, 1, 0, 1,
-0.6678026, -1.452339, -2.624743, 0.5372549, 1, 0, 1,
-0.6668105, -0.6595803, -2.110364, 0.5294118, 1, 0, 1,
-0.666302, 0.2272697, -1.460219, 0.5254902, 1, 0, 1,
-0.6652193, -0.6843135, -3.146345, 0.5176471, 1, 0, 1,
-0.6637791, -0.4516256, -2.987405, 0.5137255, 1, 0, 1,
-0.6628348, 0.8735416, -1.209728, 0.5058824, 1, 0, 1,
-0.6616908, 0.260529, -0.9338271, 0.5019608, 1, 0, 1,
-0.6609186, 1.504439, -0.0278728, 0.4941176, 1, 0, 1,
-0.652079, -0.5217031, -1.39373, 0.4862745, 1, 0, 1,
-0.6510774, -0.3551231, -2.285366, 0.4823529, 1, 0, 1,
-0.6445874, 1.234594, -0.3814498, 0.4745098, 1, 0, 1,
-0.6435136, 0.350451, 0.3394382, 0.4705882, 1, 0, 1,
-0.643503, -0.532725, -2.437927, 0.4627451, 1, 0, 1,
-0.641995, 0.2083986, -0.814683, 0.4588235, 1, 0, 1,
-0.6404589, -0.2785287, -3.29748, 0.4509804, 1, 0, 1,
-0.6372556, 0.7692325, -1.496979, 0.4470588, 1, 0, 1,
-0.6292544, 0.5198835, 1.25624, 0.4392157, 1, 0, 1,
-0.6223062, 0.3728, -1.762998, 0.4352941, 1, 0, 1,
-0.6077533, -1.107746, -1.509953, 0.427451, 1, 0, 1,
-0.6049499, -0.645778, -2.050333, 0.4235294, 1, 0, 1,
-0.6034955, 1.675555, -0.330545, 0.4156863, 1, 0, 1,
-0.6022429, -0.8685833, -2.857599, 0.4117647, 1, 0, 1,
-0.5995104, -0.01396758, -0.004326727, 0.4039216, 1, 0, 1,
-0.5913668, -0.2226954, -2.173553, 0.3960784, 1, 0, 1,
-0.5910306, -0.1752765, -1.444895, 0.3921569, 1, 0, 1,
-0.5866922, -0.7909821, -0.07340534, 0.3843137, 1, 0, 1,
-0.5859122, 1.504489, -1.04141, 0.3803922, 1, 0, 1,
-0.585395, 0.1274648, -2.480379, 0.372549, 1, 0, 1,
-0.5805364, 2.813085, 0.9530398, 0.3686275, 1, 0, 1,
-0.5780361, 0.6988327, -2.025505, 0.3607843, 1, 0, 1,
-0.572427, -0.961933, -1.405758, 0.3568628, 1, 0, 1,
-0.5716831, -0.3810973, -4.184034, 0.3490196, 1, 0, 1,
-0.5716611, -0.9347181, -0.8520226, 0.345098, 1, 0, 1,
-0.5597745, 0.5856866, -1.482854, 0.3372549, 1, 0, 1,
-0.559643, 0.4464949, -2.204773, 0.3333333, 1, 0, 1,
-0.5583608, 0.5917525, -0.04965576, 0.3254902, 1, 0, 1,
-0.5578179, -1.897022, -2.480374, 0.3215686, 1, 0, 1,
-0.5549871, 0.470501, -2.379213, 0.3137255, 1, 0, 1,
-0.5382906, 1.88991, -0.9652517, 0.3098039, 1, 0, 1,
-0.5356032, -0.7060656, -3.986929, 0.3019608, 1, 0, 1,
-0.5350599, -0.7537587, -1.936382, 0.2941177, 1, 0, 1,
-0.5286782, 0.559768, 0.425797, 0.2901961, 1, 0, 1,
-0.5275816, -2.357965, -3.054395, 0.282353, 1, 0, 1,
-0.5193399, 1.157738, -1.837548, 0.2784314, 1, 0, 1,
-0.5190157, -1.086266, -1.752993, 0.2705882, 1, 0, 1,
-0.5185688, -0.8840427, -4.96789, 0.2666667, 1, 0, 1,
-0.5161644, 1.142032, -0.7637628, 0.2588235, 1, 0, 1,
-0.5151438, 1.293043, 0.7179202, 0.254902, 1, 0, 1,
-0.5150725, 0.2388213, -1.027339, 0.2470588, 1, 0, 1,
-0.5121815, 0.559656, 0.2343882, 0.2431373, 1, 0, 1,
-0.5065645, 0.2843942, 0.7642365, 0.2352941, 1, 0, 1,
-0.5028815, 1.362776, 0.2177336, 0.2313726, 1, 0, 1,
-0.4968057, 0.1671063, -0.6244792, 0.2235294, 1, 0, 1,
-0.4957202, 0.3615053, -1.719899, 0.2196078, 1, 0, 1,
-0.4912706, 0.07268383, -0.5918005, 0.2117647, 1, 0, 1,
-0.4912703, -0.02732784, -0.5448602, 0.2078431, 1, 0, 1,
-0.4807465, -0.2338796, -2.536987, 0.2, 1, 0, 1,
-0.4744079, -0.3844104, -3.052589, 0.1921569, 1, 0, 1,
-0.4730795, -0.3536749, -0.9053552, 0.1882353, 1, 0, 1,
-0.4690705, -0.6959983, -2.686905, 0.1803922, 1, 0, 1,
-0.4680279, -0.495082, -1.492174, 0.1764706, 1, 0, 1,
-0.4675606, 0.1696867, -3.113703, 0.1686275, 1, 0, 1,
-0.4628678, -2.496535, -1.44024, 0.1647059, 1, 0, 1,
-0.4627909, 0.3247692, -1.421919, 0.1568628, 1, 0, 1,
-0.4616966, -0.6045612, -4.302026, 0.1529412, 1, 0, 1,
-0.4607961, -2.053552, -2.678385, 0.145098, 1, 0, 1,
-0.4571532, -1.757399, -4.01753, 0.1411765, 1, 0, 1,
-0.4549013, 0.1067303, -1.500598, 0.1333333, 1, 0, 1,
-0.4542379, -0.547092, -2.103811, 0.1294118, 1, 0, 1,
-0.4476914, 0.2732207, -0.3986239, 0.1215686, 1, 0, 1,
-0.4454457, -0.02172979, -3.37364, 0.1176471, 1, 0, 1,
-0.444512, -0.03977725, -1.743635, 0.1098039, 1, 0, 1,
-0.4417165, 0.5321072, 0.3492, 0.1058824, 1, 0, 1,
-0.4403733, -0.1899154, -3.445625, 0.09803922, 1, 0, 1,
-0.4394474, -0.1113376, -3.761193, 0.09019608, 1, 0, 1,
-0.4370149, 2.044269e-05, -0.6254855, 0.08627451, 1, 0, 1,
-0.4367593, -1.166106, -2.676916, 0.07843138, 1, 0, 1,
-0.4357261, 0.6732609, 1.700101, 0.07450981, 1, 0, 1,
-0.4335138, -0.5054157, -3.749197, 0.06666667, 1, 0, 1,
-0.4188764, -1.632091, -2.936918, 0.0627451, 1, 0, 1,
-0.4124567, 0.6531447, -0.9854628, 0.05490196, 1, 0, 1,
-0.4122717, -1.14102, -3.417029, 0.05098039, 1, 0, 1,
-0.4116751, -0.3579535, -2.344874, 0.04313726, 1, 0, 1,
-0.394303, -0.08926737, -1.19899, 0.03921569, 1, 0, 1,
-0.3923876, -0.3397188, -4.974392, 0.03137255, 1, 0, 1,
-0.3909659, 1.278139, -0.8480711, 0.02745098, 1, 0, 1,
-0.3898804, -1.245015, -5.205272, 0.01960784, 1, 0, 1,
-0.3880547, 0.5851784, -0.4226991, 0.01568628, 1, 0, 1,
-0.3851528, 0.724732, -0.3386552, 0.007843138, 1, 0, 1,
-0.382517, 0.4895779, 1.337036, 0.003921569, 1, 0, 1,
-0.3792017, 0.5928116, -0.1249664, 0, 1, 0.003921569, 1,
-0.3772385, -1.639602, -2.750698, 0, 1, 0.01176471, 1,
-0.3686593, -0.04469991, -1.785507, 0, 1, 0.01568628, 1,
-0.3684998, -0.9514861, -1.791055, 0, 1, 0.02352941, 1,
-0.3663434, -0.214562, -2.336513, 0, 1, 0.02745098, 1,
-0.361712, -0.6910048, -3.411411, 0, 1, 0.03529412, 1,
-0.3586104, -1.009723, -5.076634, 0, 1, 0.03921569, 1,
-0.3542434, 0.5660375, -0.1091644, 0, 1, 0.04705882, 1,
-0.353415, 0.9894089, -0.3565512, 0, 1, 0.05098039, 1,
-0.3496079, -0.3399834, -1.147442, 0, 1, 0.05882353, 1,
-0.3475003, -0.7740251, -1.744755, 0, 1, 0.0627451, 1,
-0.3446145, -0.168554, -3.324697, 0, 1, 0.07058824, 1,
-0.3438586, 0.9982572, -0.0409421, 0, 1, 0.07450981, 1,
-0.3429808, 0.6408631, -0.1685151, 0, 1, 0.08235294, 1,
-0.3401871, -0.5993502, -2.054066, 0, 1, 0.08627451, 1,
-0.339665, 1.026624, -0.1764449, 0, 1, 0.09411765, 1,
-0.3394897, 1.110297, -0.6737847, 0, 1, 0.1019608, 1,
-0.3306915, -0.5282289, -4.30628, 0, 1, 0.1058824, 1,
-0.3277023, -1.856925, -3.17361, 0, 1, 0.1137255, 1,
-0.3251222, -0.275431, -1.47991, 0, 1, 0.1176471, 1,
-0.3196346, -1.111249, -3.086537, 0, 1, 0.1254902, 1,
-0.3179756, 1.442881, -0.1127281, 0, 1, 0.1294118, 1,
-0.3159275, -0.4160455, -4.389738, 0, 1, 0.1372549, 1,
-0.3051361, 1.907681, 0.5718151, 0, 1, 0.1411765, 1,
-0.3040338, -2.892838, -2.607722, 0, 1, 0.1490196, 1,
-0.3039782, 0.03432161, -1.757565, 0, 1, 0.1529412, 1,
-0.303336, -1.120265, 0.1508475, 0, 1, 0.1607843, 1,
-0.2945029, 0.4385738, -0.8757998, 0, 1, 0.1647059, 1,
-0.293085, 0.25889, 0.428198, 0, 1, 0.172549, 1,
-0.2880267, -0.4320798, -2.076583, 0, 1, 0.1764706, 1,
-0.2864222, -0.9865668, -2.263704, 0, 1, 0.1843137, 1,
-0.2849886, 0.9041655, -0.198381, 0, 1, 0.1882353, 1,
-0.2818134, 1.305265, 0.5108891, 0, 1, 0.1960784, 1,
-0.2751063, 0.2974455, -1.537524, 0, 1, 0.2039216, 1,
-0.2741911, 1.201402, 1.106255, 0, 1, 0.2078431, 1,
-0.2736354, -1.350394, -2.740062, 0, 1, 0.2156863, 1,
-0.2721583, -1.225471, -3.077681, 0, 1, 0.2196078, 1,
-0.2720651, -0.9596713, -2.888699, 0, 1, 0.227451, 1,
-0.2686306, -1.539098, -2.691342, 0, 1, 0.2313726, 1,
-0.2646277, 2.752555, 0.5360321, 0, 1, 0.2392157, 1,
-0.2619825, -0.05172319, 0.1720978, 0, 1, 0.2431373, 1,
-0.2603295, -0.158802, -2.892674, 0, 1, 0.2509804, 1,
-0.2603051, -0.2579888, -4.30263, 0, 1, 0.254902, 1,
-0.2597857, -0.6403415, -2.785491, 0, 1, 0.2627451, 1,
-0.2576896, 1.433784, 0.770123, 0, 1, 0.2666667, 1,
-0.2530367, 1.004696, -0.5774644, 0, 1, 0.2745098, 1,
-0.2490113, 0.9331321, -0.4503746, 0, 1, 0.2784314, 1,
-0.2452495, 0.3232968, 0.08756027, 0, 1, 0.2862745, 1,
-0.2425724, 1.124599, -0.5092454, 0, 1, 0.2901961, 1,
-0.2417707, 1.527523, -0.5847287, 0, 1, 0.2980392, 1,
-0.2388775, 0.5492389, 0.02199056, 0, 1, 0.3058824, 1,
-0.2370482, -0.9745955, -4.073464, 0, 1, 0.3098039, 1,
-0.2347522, 1.644129, 0.7000062, 0, 1, 0.3176471, 1,
-0.2298246, -0.463372, -3.773624, 0, 1, 0.3215686, 1,
-0.2291478, 0.08698878, -1.284646, 0, 1, 0.3294118, 1,
-0.2258047, -0.7219055, -3.589475, 0, 1, 0.3333333, 1,
-0.2239454, -0.503507, -0.6137686, 0, 1, 0.3411765, 1,
-0.2213064, 0.7334574, 0.5023779, 0, 1, 0.345098, 1,
-0.2194178, -1.25691, -2.887995, 0, 1, 0.3529412, 1,
-0.2163553, -0.002262627, -3.393631, 0, 1, 0.3568628, 1,
-0.2146215, 0.5536293, -0.5063388, 0, 1, 0.3647059, 1,
-0.2128318, -0.4539348, -4.253443, 0, 1, 0.3686275, 1,
-0.2121951, 0.7676654, -0.710684, 0, 1, 0.3764706, 1,
-0.2089448, -0.5848288, -2.57, 0, 1, 0.3803922, 1,
-0.205117, 0.840471, 0.3329174, 0, 1, 0.3882353, 1,
-0.2050141, -0.5317738, -2.448182, 0, 1, 0.3921569, 1,
-0.2040022, 0.09429683, -1.761538, 0, 1, 0.4, 1,
-0.2026099, -0.5084417, -2.328178, 0, 1, 0.4078431, 1,
-0.2016068, 0.07480966, -1.675582, 0, 1, 0.4117647, 1,
-0.1941498, 1.802249, -0.3995733, 0, 1, 0.4196078, 1,
-0.1896742, 0.1410222, 0.6950213, 0, 1, 0.4235294, 1,
-0.1870215, -1.279022, -3.585354, 0, 1, 0.4313726, 1,
-0.183356, 0.5351018, -0.1363282, 0, 1, 0.4352941, 1,
-0.182573, -0.05037441, -1.457171, 0, 1, 0.4431373, 1,
-0.1823391, 1.837009, 0.4864311, 0, 1, 0.4470588, 1,
-0.1775357, -1.701206, -2.254956, 0, 1, 0.454902, 1,
-0.1725347, -1.218495, -0.1608541, 0, 1, 0.4588235, 1,
-0.1717502, -2.101405, -4.767052, 0, 1, 0.4666667, 1,
-0.1693341, -0.2200051, -2.177885, 0, 1, 0.4705882, 1,
-0.169304, 1.265631, 0.3140939, 0, 1, 0.4784314, 1,
-0.1660663, 1.86038, -0.979984, 0, 1, 0.4823529, 1,
-0.1636851, 1.202105, -1.662146, 0, 1, 0.4901961, 1,
-0.1603612, 1.00919, -1.716188, 0, 1, 0.4941176, 1,
-0.1588367, -0.5318716, -2.388113, 0, 1, 0.5019608, 1,
-0.158051, -1.757181, -2.51125, 0, 1, 0.509804, 1,
-0.15703, 1.590207, 2.234969, 0, 1, 0.5137255, 1,
-0.1566872, -1.376078, -2.006422, 0, 1, 0.5215687, 1,
-0.1544505, -1.635442, -1.398769, 0, 1, 0.5254902, 1,
-0.1525934, 0.4709792, -0.6261265, 0, 1, 0.5333334, 1,
-0.1508316, 1.770845, -1.06393, 0, 1, 0.5372549, 1,
-0.1437775, -0.9422564, -3.368843, 0, 1, 0.5450981, 1,
-0.1436472, -0.5075446, -4.615013, 0, 1, 0.5490196, 1,
-0.1420864, -0.713365, -3.621114, 0, 1, 0.5568628, 1,
-0.1409269, 0.9598854, 0.3311383, 0, 1, 0.5607843, 1,
-0.1375865, 0.5026622, 0.6122233, 0, 1, 0.5686275, 1,
-0.1344833, -0.675526, -1.892393, 0, 1, 0.572549, 1,
-0.1336672, 0.5019497, -1.04789, 0, 1, 0.5803922, 1,
-0.1318723, -0.2625534, -3.504593, 0, 1, 0.5843138, 1,
-0.1306284, -0.9355391, -2.522265, 0, 1, 0.5921569, 1,
-0.1233333, -1.395433, -3.646196, 0, 1, 0.5960785, 1,
-0.1218009, -0.3505287, -4.601007, 0, 1, 0.6039216, 1,
-0.1212616, 1.773838, 0.389803, 0, 1, 0.6117647, 1,
-0.1207349, -2.350486, -1.565741, 0, 1, 0.6156863, 1,
-0.1189536, -0.5800601, -1.927701, 0, 1, 0.6235294, 1,
-0.117629, -0.6266977, -3.783338, 0, 1, 0.627451, 1,
-0.1158308, -0.1691848, -3.435459, 0, 1, 0.6352941, 1,
-0.1143989, -0.01655422, -3.554456, 0, 1, 0.6392157, 1,
-0.1143642, -1.597994, -3.712802, 0, 1, 0.6470588, 1,
-0.1140223, 1.809442, 2.017261, 0, 1, 0.6509804, 1,
-0.1079107, 0.5847631, 0.5334732, 0, 1, 0.6588235, 1,
-0.09748181, 1.228948, -1.257506, 0, 1, 0.6627451, 1,
-0.09486389, -0.4302773, -2.489307, 0, 1, 0.6705883, 1,
-0.09249062, 1.379585, 0.1118262, 0, 1, 0.6745098, 1,
-0.09031554, 1.092688, -2.87501, 0, 1, 0.682353, 1,
-0.08727372, -0.9266537, -4.883535, 0, 1, 0.6862745, 1,
-0.08378748, -0.7941517, -2.908563, 0, 1, 0.6941177, 1,
-0.08155641, 0.2794074, -0.11254, 0, 1, 0.7019608, 1,
-0.07883706, -0.9356304, -3.055161, 0, 1, 0.7058824, 1,
-0.07870879, 1.700868, -0.1577169, 0, 1, 0.7137255, 1,
-0.07406102, 0.5640931, 1.081853, 0, 1, 0.7176471, 1,
-0.07340157, -0.00639906, -0.4487172, 0, 1, 0.7254902, 1,
-0.07014129, 0.1301497, -0.5869052, 0, 1, 0.7294118, 1,
-0.07008819, 0.4420301, -0.03029132, 0, 1, 0.7372549, 1,
-0.06890326, -0.7221758, -2.412066, 0, 1, 0.7411765, 1,
-0.06207245, -0.7463405, -2.900399, 0, 1, 0.7490196, 1,
-0.05621566, -1.843225, -4.516531, 0, 1, 0.7529412, 1,
-0.05518508, -0.004714184, -2.475335, 0, 1, 0.7607843, 1,
-0.0512477, 0.6048016, 0.4423488, 0, 1, 0.7647059, 1,
-0.04745436, -0.4521768, -3.312221, 0, 1, 0.772549, 1,
-0.04346053, -1.254969, -2.813641, 0, 1, 0.7764706, 1,
-0.04287006, -0.2736564, -2.884597, 0, 1, 0.7843137, 1,
-0.03547489, -1.282576, -3.639708, 0, 1, 0.7882353, 1,
-0.03452704, 0.1999918, -0.8751422, 0, 1, 0.7960784, 1,
-0.03361025, -2.827521, -4.445271, 0, 1, 0.8039216, 1,
-0.03276392, 0.4958749, 0.2915629, 0, 1, 0.8078431, 1,
-0.03211111, 0.1365306, -0.02679315, 0, 1, 0.8156863, 1,
-0.03043673, -0.3687938, -3.346127, 0, 1, 0.8196079, 1,
-0.02912763, 1.172939, 0.4356546, 0, 1, 0.827451, 1,
-0.02726407, -0.6190066, -2.070518, 0, 1, 0.8313726, 1,
-0.0212631, 0.478834, -0.06111876, 0, 1, 0.8392157, 1,
-0.01496719, 0.9387865, 1.08688, 0, 1, 0.8431373, 1,
-0.01300037, 1.148866, 0.0623513, 0, 1, 0.8509804, 1,
-0.01155293, -0.6751869, -3.686981, 0, 1, 0.854902, 1,
-0.009501884, -0.3643135, -1.459257, 0, 1, 0.8627451, 1,
-0.005776327, -0.05548302, -3.365718, 0, 1, 0.8666667, 1,
-0.0007445686, 0.1529699, -0.4547101, 0, 1, 0.8745098, 1,
0.002067119, -1.04919, 3.347788, 0, 1, 0.8784314, 1,
0.006119038, -0.1060671, 1.938525, 0, 1, 0.8862745, 1,
0.007812076, 0.03686984, 0.204169, 0, 1, 0.8901961, 1,
0.01132672, 0.3378758, 1.533572, 0, 1, 0.8980392, 1,
0.0113321, -1.144956, 2.699958, 0, 1, 0.9058824, 1,
0.01208784, 1.470245, -0.8965442, 0, 1, 0.9098039, 1,
0.01263116, -0.1502408, 3.502909, 0, 1, 0.9176471, 1,
0.01323778, -1.521296, 3.692086, 0, 1, 0.9215686, 1,
0.01423717, 1.091144, 1.490196, 0, 1, 0.9294118, 1,
0.01498891, -0.3038033, 2.18962, 0, 1, 0.9333333, 1,
0.01881345, -0.5214604, 1.626398, 0, 1, 0.9411765, 1,
0.02064003, 1.009363, 0.02789854, 0, 1, 0.945098, 1,
0.02316115, 0.6648929, -0.7574708, 0, 1, 0.9529412, 1,
0.02650722, -0.2603084, 2.314934, 0, 1, 0.9568627, 1,
0.02901229, -0.1704609, 2.901484, 0, 1, 0.9647059, 1,
0.0447754, -0.75863, 2.631584, 0, 1, 0.9686275, 1,
0.04740157, 1.275352, 0.2553113, 0, 1, 0.9764706, 1,
0.06117691, 1.022551, -0.1400543, 0, 1, 0.9803922, 1,
0.06328581, 1.137538, -0.02627396, 0, 1, 0.9882353, 1,
0.06432682, -1.288277, 2.600292, 0, 1, 0.9921569, 1,
0.07009895, 0.5329989, 0.2931167, 0, 1, 1, 1,
0.07155158, -0.01123472, 1.118494, 0, 0.9921569, 1, 1,
0.07165824, -0.1097056, 2.695278, 0, 0.9882353, 1, 1,
0.0739347, -0.2920376, 0.5929998, 0, 0.9803922, 1, 1,
0.07397141, -0.6053365, 0.9993995, 0, 0.9764706, 1, 1,
0.0740857, 0.403745, 0.6411677, 0, 0.9686275, 1, 1,
0.07684404, -2.40696, 3.304527, 0, 0.9647059, 1, 1,
0.08126295, -0.5562046, 1.836779, 0, 0.9568627, 1, 1,
0.08360729, 1.295863, -1.750781, 0, 0.9529412, 1, 1,
0.0894754, 0.8195803, -1.093359, 0, 0.945098, 1, 1,
0.08978609, -0.8870503, 1.866036, 0, 0.9411765, 1, 1,
0.09020123, 1.252578, 0.9491916, 0, 0.9333333, 1, 1,
0.09035883, 0.8985958, -0.7839242, 0, 0.9294118, 1, 1,
0.09861287, 0.6098238, 1.275944, 0, 0.9215686, 1, 1,
0.09946518, -1.016306, 1.860146, 0, 0.9176471, 1, 1,
0.1000272, 0.1044545, 1.442824, 0, 0.9098039, 1, 1,
0.1016404, -1.099077, 1.853926, 0, 0.9058824, 1, 1,
0.1016461, 0.2118225, -0.8180784, 0, 0.8980392, 1, 1,
0.10388, -0.01763152, 2.777173, 0, 0.8901961, 1, 1,
0.1055152, -0.7244868, 2.003947, 0, 0.8862745, 1, 1,
0.1076068, 1.212692, -1.458304, 0, 0.8784314, 1, 1,
0.1169132, -0.9776667, 3.55145, 0, 0.8745098, 1, 1,
0.1190235, 1.010709, 1.19202, 0, 0.8666667, 1, 1,
0.1259277, 0.1883012, 1.097367, 0, 0.8627451, 1, 1,
0.1313034, 0.4196039, 0.2154305, 0, 0.854902, 1, 1,
0.1315979, 0.6447413, 0.4847616, 0, 0.8509804, 1, 1,
0.1335486, -0.5204824, 2.037498, 0, 0.8431373, 1, 1,
0.1465732, -1.066746, 1.809991, 0, 0.8392157, 1, 1,
0.1484766, 0.5449234, 0.8951702, 0, 0.8313726, 1, 1,
0.1490621, -2.59715, 3.998279, 0, 0.827451, 1, 1,
0.1497767, 0.1858025, -1.241348, 0, 0.8196079, 1, 1,
0.1511917, -0.6474666, 1.632417, 0, 0.8156863, 1, 1,
0.1512619, 1.164162, -0.3271126, 0, 0.8078431, 1, 1,
0.1536965, 0.4380606, 0.005572852, 0, 0.8039216, 1, 1,
0.1594489, -1.219977, 2.175313, 0, 0.7960784, 1, 1,
0.1603493, 2.032959, -0.4862785, 0, 0.7882353, 1, 1,
0.1609661, -0.3039913, 2.746752, 0, 0.7843137, 1, 1,
0.1611589, 1.076032, -1.393902, 0, 0.7764706, 1, 1,
0.1728158, 1.211872, 0.6322879, 0, 0.772549, 1, 1,
0.178615, -1.575577, 4.01197, 0, 0.7647059, 1, 1,
0.1822094, 0.4563689, -0.02934024, 0, 0.7607843, 1, 1,
0.1844564, -0.6172035, 4.053245, 0, 0.7529412, 1, 1,
0.1847259, 1.345965, 0.5631142, 0, 0.7490196, 1, 1,
0.190283, -0.6156623, 3.659896, 0, 0.7411765, 1, 1,
0.190936, 1.516815, -0.890734, 0, 0.7372549, 1, 1,
0.1924158, 0.7163843, 0.3427333, 0, 0.7294118, 1, 1,
0.1926631, -0.2098245, 1.814113, 0, 0.7254902, 1, 1,
0.1940841, -0.8828501, 2.852221, 0, 0.7176471, 1, 1,
0.1947716, -0.9172239, 4.753253, 0, 0.7137255, 1, 1,
0.2029286, -0.3475759, 3.049064, 0, 0.7058824, 1, 1,
0.2040493, 0.2161794, 0.2384071, 0, 0.6980392, 1, 1,
0.2078454, 0.9157123, 0.2992667, 0, 0.6941177, 1, 1,
0.2105633, -0.03417625, 1.779237, 0, 0.6862745, 1, 1,
0.2146903, 0.2639325, 0.9540485, 0, 0.682353, 1, 1,
0.2151636, 1.957745, -0.3523689, 0, 0.6745098, 1, 1,
0.2170931, -0.6444784, 4.119818, 0, 0.6705883, 1, 1,
0.2207121, 0.2849286, 1.457386, 0, 0.6627451, 1, 1,
0.2243365, -0.09678735, 1.087155, 0, 0.6588235, 1, 1,
0.2254257, -0.3484372, 4.057199, 0, 0.6509804, 1, 1,
0.2257909, 0.9294291, 0.1882717, 0, 0.6470588, 1, 1,
0.2300887, -1.821599, 3.745174, 0, 0.6392157, 1, 1,
0.2322607, 1.194653, 0.7792404, 0, 0.6352941, 1, 1,
0.2345753, 1.284968, -0.02191061, 0, 0.627451, 1, 1,
0.2408012, -0.1855389, 1.422287, 0, 0.6235294, 1, 1,
0.244621, 1.151309, 1.127608, 0, 0.6156863, 1, 1,
0.2452193, -0.5225086, 2.802278, 0, 0.6117647, 1, 1,
0.2461629, 1.750501, 0.0187126, 0, 0.6039216, 1, 1,
0.2561224, 1.395437, -0.150603, 0, 0.5960785, 1, 1,
0.2594779, -1.029803, 3.113324, 0, 0.5921569, 1, 1,
0.2595451, -0.05954212, 1.208129, 0, 0.5843138, 1, 1,
0.2605961, -0.40808, 3.022951, 0, 0.5803922, 1, 1,
0.2624526, -1.525263, 5.313388, 0, 0.572549, 1, 1,
0.2631562, -0.9025491, 3.129681, 0, 0.5686275, 1, 1,
0.2642522, -0.41647, 2.88069, 0, 0.5607843, 1, 1,
0.2653617, 0.2925943, 1.24604, 0, 0.5568628, 1, 1,
0.2722495, 1.61779, -1.98658, 0, 0.5490196, 1, 1,
0.2852792, -0.5345513, 2.420987, 0, 0.5450981, 1, 1,
0.2903703, 0.8074424, 0.8002691, 0, 0.5372549, 1, 1,
0.2942113, -1.553968, 3.912513, 0, 0.5333334, 1, 1,
0.2967196, 0.6653533, -0.04320592, 0, 0.5254902, 1, 1,
0.2977311, -0.8239622, 2.542604, 0, 0.5215687, 1, 1,
0.2995806, 0.8836443, -0.4883445, 0, 0.5137255, 1, 1,
0.299661, -1.530584, 2.432517, 0, 0.509804, 1, 1,
0.2998808, 0.282927, -0.9894405, 0, 0.5019608, 1, 1,
0.3027256, 0.006633155, 2.873672, 0, 0.4941176, 1, 1,
0.3144983, -0.1832306, 2.94519, 0, 0.4901961, 1, 1,
0.3229931, -0.007223777, 2.072084, 0, 0.4823529, 1, 1,
0.3242828, 0.9251297, 1.120871, 0, 0.4784314, 1, 1,
0.3285283, 2.156531, -0.1581354, 0, 0.4705882, 1, 1,
0.3286664, -0.6254882, 1.226617, 0, 0.4666667, 1, 1,
0.3286696, -1.816808, 3.895758, 0, 0.4588235, 1, 1,
0.3399519, 0.6197208, 1.031934, 0, 0.454902, 1, 1,
0.3419706, -1.238482, 3.08159, 0, 0.4470588, 1, 1,
0.3434483, -0.5879025, 2.626053, 0, 0.4431373, 1, 1,
0.3506334, -0.1070534, 1.102505, 0, 0.4352941, 1, 1,
0.3567312, -0.2476772, 2.927271, 0, 0.4313726, 1, 1,
0.3590896, -0.7448857, 2.41993, 0, 0.4235294, 1, 1,
0.3591125, 1.366672, 1.223442, 0, 0.4196078, 1, 1,
0.3593884, 1.129487, 0.2586712, 0, 0.4117647, 1, 1,
0.3598031, -0.6120453, 0.5430129, 0, 0.4078431, 1, 1,
0.3599015, 0.8348731, -1.204319, 0, 0.4, 1, 1,
0.3599346, -1.734608, 1.527024, 0, 0.3921569, 1, 1,
0.3606004, -1.802977, 2.132367, 0, 0.3882353, 1, 1,
0.3608397, 0.912271, -0.8088445, 0, 0.3803922, 1, 1,
0.3627646, -0.1595671, 0.830744, 0, 0.3764706, 1, 1,
0.3644985, -1.541401, 1.909711, 0, 0.3686275, 1, 1,
0.3671935, -1.801491, 3.510748, 0, 0.3647059, 1, 1,
0.3678051, 0.8927132, -0.7148769, 0, 0.3568628, 1, 1,
0.3719743, -1.171492, 4.225202, 0, 0.3529412, 1, 1,
0.3720389, 0.1310147, -0.2845743, 0, 0.345098, 1, 1,
0.37266, -0.4291554, 3.81722, 0, 0.3411765, 1, 1,
0.3834287, -0.6410091, 1.153545, 0, 0.3333333, 1, 1,
0.3899897, 0.648275, 1.653062, 0, 0.3294118, 1, 1,
0.3915269, 0.8783972, 1.034047, 0, 0.3215686, 1, 1,
0.3927971, 0.361513, 1.851558, 0, 0.3176471, 1, 1,
0.393366, 0.4538819, 2.094449, 0, 0.3098039, 1, 1,
0.3936317, -1.531381, 2.850161, 0, 0.3058824, 1, 1,
0.3968017, 1.885804, -1.750589, 0, 0.2980392, 1, 1,
0.3968388, -1.687428, 2.194426, 0, 0.2901961, 1, 1,
0.3969859, 1.164121, -0.427554, 0, 0.2862745, 1, 1,
0.3993432, -0.6222519, 3.621626, 0, 0.2784314, 1, 1,
0.4052617, 0.2599081, 2.223502, 0, 0.2745098, 1, 1,
0.4056277, -0.5580141, 1.005509, 0, 0.2666667, 1, 1,
0.407317, 0.5873063, 1.315805, 0, 0.2627451, 1, 1,
0.4074229, -1.521145, 3.226051, 0, 0.254902, 1, 1,
0.40991, 0.04369996, 1.588903, 0, 0.2509804, 1, 1,
0.411287, -0.2487213, 2.281749, 0, 0.2431373, 1, 1,
0.4132352, -0.2790366, 3.080213, 0, 0.2392157, 1, 1,
0.413277, -0.9350653, 3.400847, 0, 0.2313726, 1, 1,
0.4169577, 0.7262763, 1.753242, 0, 0.227451, 1, 1,
0.4183972, 0.03197925, 1.311662, 0, 0.2196078, 1, 1,
0.4304259, -0.01816037, 1.451464, 0, 0.2156863, 1, 1,
0.4368699, 0.163287, 0.47192, 0, 0.2078431, 1, 1,
0.4370537, 0.8806809, 0.7650033, 0, 0.2039216, 1, 1,
0.4388506, -0.004802981, 0.7123308, 0, 0.1960784, 1, 1,
0.4493967, -0.790274, 2.255096, 0, 0.1882353, 1, 1,
0.4504402, 1.450916, 0.1287579, 0, 0.1843137, 1, 1,
0.4507765, -0.1331254, 2.757634, 0, 0.1764706, 1, 1,
0.4524775, 0.7767861, 1.56984, 0, 0.172549, 1, 1,
0.4543391, 1.212396, 0.7160844, 0, 0.1647059, 1, 1,
0.4572962, 0.6659085, 1.548111, 0, 0.1607843, 1, 1,
0.4591921, 0.4219529, 0.02433443, 0, 0.1529412, 1, 1,
0.4598025, 0.5350267, 2.007016, 0, 0.1490196, 1, 1,
0.4601663, 1.443342, -1.790604, 0, 0.1411765, 1, 1,
0.4642087, -1.738597, 3.25832, 0, 0.1372549, 1, 1,
0.4680485, -1.678072, 1.253456, 0, 0.1294118, 1, 1,
0.4738523, 0.3577401, 1.2654, 0, 0.1254902, 1, 1,
0.4741222, 1.024793, -0.9424796, 0, 0.1176471, 1, 1,
0.4792312, -0.3899261, 3.512402, 0, 0.1137255, 1, 1,
0.4794794, 2.261852, 1.716412, 0, 0.1058824, 1, 1,
0.4798701, 0.2039596, -0.6983383, 0, 0.09803922, 1, 1,
0.480135, -0.1152749, 0.7304389, 0, 0.09411765, 1, 1,
0.4887975, 0.155644, 1.446817, 0, 0.08627451, 1, 1,
0.4936752, -1.191668, 3.574108, 0, 0.08235294, 1, 1,
0.495592, 1.078207, -1.263399, 0, 0.07450981, 1, 1,
0.4965982, -2.220814, 2.420672, 0, 0.07058824, 1, 1,
0.4978308, 0.9728759, 0.3813274, 0, 0.0627451, 1, 1,
0.498006, -0.7778047, 1.505556, 0, 0.05882353, 1, 1,
0.499469, 1.323119, -1.186536, 0, 0.05098039, 1, 1,
0.5015759, -0.6819353, 2.202112, 0, 0.04705882, 1, 1,
0.5022674, 1.004619, -0.9324732, 0, 0.03921569, 1, 1,
0.5048209, 0.2095781, 1.842742, 0, 0.03529412, 1, 1,
0.5064888, -0.1418208, 1.84689, 0, 0.02745098, 1, 1,
0.5239203, -0.9988821, 2.675799, 0, 0.02352941, 1, 1,
0.5290694, 0.7592946, 0.971657, 0, 0.01568628, 1, 1,
0.5298219, -0.1651244, 2.597198, 0, 0.01176471, 1, 1,
0.5328881, -1.847892, 4.19561, 0, 0.003921569, 1, 1,
0.5348109, -1.831504, 0.8854648, 0.003921569, 0, 1, 1,
0.5405822, -0.3133718, 1.885132, 0.007843138, 0, 1, 1,
0.5406299, 0.1701012, 1.541798, 0.01568628, 0, 1, 1,
0.5407774, -0.3356372, 2.75032, 0.01960784, 0, 1, 1,
0.5448455, -0.5445703, 2.543534, 0.02745098, 0, 1, 1,
0.547574, -0.3817038, 1.913318, 0.03137255, 0, 1, 1,
0.5540521, -0.2128099, 1.495621, 0.03921569, 0, 1, 1,
0.5555197, -0.4674555, 3.332483, 0.04313726, 0, 1, 1,
0.5588143, 0.08112383, 0.07530214, 0.05098039, 0, 1, 1,
0.5600352, -1.367016, -0.02488075, 0.05490196, 0, 1, 1,
0.5601989, -0.7752122, -0.03441435, 0.0627451, 0, 1, 1,
0.5626365, 1.749044, 3.252512, 0.06666667, 0, 1, 1,
0.5644498, 0.6874899, 1.584849, 0.07450981, 0, 1, 1,
0.5653684, -0.6000462, 2.971743, 0.07843138, 0, 1, 1,
0.5654731, -0.1286193, 0.1243565, 0.08627451, 0, 1, 1,
0.5695158, 1.410617, -0.3683656, 0.09019608, 0, 1, 1,
0.5738824, 0.7099026, -0.9925431, 0.09803922, 0, 1, 1,
0.5746005, -0.3293079, 2.80656, 0.1058824, 0, 1, 1,
0.5754076, 0.8994502, 1.301893, 0.1098039, 0, 1, 1,
0.5802683, -1.552923, 3.834824, 0.1176471, 0, 1, 1,
0.5812511, -0.4386646, 2.878216, 0.1215686, 0, 1, 1,
0.5825595, -0.01549519, 1.391025, 0.1294118, 0, 1, 1,
0.5858421, 1.02753, -0.3602601, 0.1333333, 0, 1, 1,
0.5863017, -0.4980356, 1.512376, 0.1411765, 0, 1, 1,
0.5882418, 0.2267442, 0.9854074, 0.145098, 0, 1, 1,
0.5893687, -0.1062244, -0.04050199, 0.1529412, 0, 1, 1,
0.5929513, -0.7018164, 2.87812, 0.1568628, 0, 1, 1,
0.5979857, -0.5667915, 2.323443, 0.1647059, 0, 1, 1,
0.5996127, -0.7967547, 2.549499, 0.1686275, 0, 1, 1,
0.6046497, 1.202662, -0.3529025, 0.1764706, 0, 1, 1,
0.6049811, -0.5012378, 3.107558, 0.1803922, 0, 1, 1,
0.6114048, 0.0438252, 1.944289, 0.1882353, 0, 1, 1,
0.6155381, 1.699872, -0.1967424, 0.1921569, 0, 1, 1,
0.6162312, 0.5983148, 3.335427, 0.2, 0, 1, 1,
0.6164234, -0.2230406, 2.712953, 0.2078431, 0, 1, 1,
0.6197619, 1.053273, 1.10259, 0.2117647, 0, 1, 1,
0.6217773, -0.5212962, 2.132709, 0.2196078, 0, 1, 1,
0.6258125, 0.01508303, -1.23734, 0.2235294, 0, 1, 1,
0.6298109, -0.764879, 2.792904, 0.2313726, 0, 1, 1,
0.6353971, -1.222562, 1.687449, 0.2352941, 0, 1, 1,
0.6363747, 0.3816495, 2.387393, 0.2431373, 0, 1, 1,
0.6365697, 1.148152, 1.858477, 0.2470588, 0, 1, 1,
0.6367196, -0.203861, 2.150058, 0.254902, 0, 1, 1,
0.6367374, -1.512454, 1.187972, 0.2588235, 0, 1, 1,
0.6372556, -1.257569, 2.5182, 0.2666667, 0, 1, 1,
0.6408153, -0.9576814, 3.513969, 0.2705882, 0, 1, 1,
0.6446313, -1.150923, 2.693545, 0.2784314, 0, 1, 1,
0.6492777, -0.3708085, 4.123656, 0.282353, 0, 1, 1,
0.6507928, -1.747942, 3.184403, 0.2901961, 0, 1, 1,
0.6560444, 0.8943757, 0.4666573, 0.2941177, 0, 1, 1,
0.6586597, 1.265351, -0.5391287, 0.3019608, 0, 1, 1,
0.6594459, 0.4152626, 2.377495, 0.3098039, 0, 1, 1,
0.6633145, -0.9053879, 2.824682, 0.3137255, 0, 1, 1,
0.6640281, 0.5393147, 0.706076, 0.3215686, 0, 1, 1,
0.6674259, -0.2040742, 0.171152, 0.3254902, 0, 1, 1,
0.6688703, -0.1402081, 1.511805, 0.3333333, 0, 1, 1,
0.6697575, 0.4709154, 1.016037, 0.3372549, 0, 1, 1,
0.6697818, -1.240561, 1.560893, 0.345098, 0, 1, 1,
0.6714433, -0.07027933, 3.249743, 0.3490196, 0, 1, 1,
0.6746647, 0.2066447, 1.660484, 0.3568628, 0, 1, 1,
0.6757025, 0.8492322, 0.4691802, 0.3607843, 0, 1, 1,
0.6829407, 0.2706403, 0.7588981, 0.3686275, 0, 1, 1,
0.6855302, 1.604201, -0.6148188, 0.372549, 0, 1, 1,
0.686788, 1.210245, 1.478104, 0.3803922, 0, 1, 1,
0.6945078, -2.197271, 3.53042, 0.3843137, 0, 1, 1,
0.6959811, -0.1328921, 1.493601, 0.3921569, 0, 1, 1,
0.7046257, -0.5887997, 1.453337, 0.3960784, 0, 1, 1,
0.7088123, -1.366318, 0.966328, 0.4039216, 0, 1, 1,
0.7109438, -0.2269963, 1.125013, 0.4117647, 0, 1, 1,
0.7234631, 0.0568718, 1.936156, 0.4156863, 0, 1, 1,
0.7263649, 0.570739, 2.491735, 0.4235294, 0, 1, 1,
0.7300573, 0.1831806, 2.580226, 0.427451, 0, 1, 1,
0.7337232, 0.4185885, 0.5184183, 0.4352941, 0, 1, 1,
0.7345282, 1.094499, 1.468625, 0.4392157, 0, 1, 1,
0.7397271, 0.9814951, 0.1781273, 0.4470588, 0, 1, 1,
0.741019, -1.338806, 4.451734, 0.4509804, 0, 1, 1,
0.7431297, 0.3958751, 1.690799, 0.4588235, 0, 1, 1,
0.7446001, -0.05884146, 1.279437, 0.4627451, 0, 1, 1,
0.7505389, 0.2770678, 1.337477, 0.4705882, 0, 1, 1,
0.7512231, -1.016939, 3.064732, 0.4745098, 0, 1, 1,
0.7545662, -0.5354227, 3.294865, 0.4823529, 0, 1, 1,
0.759634, 0.1553988, 2.838586, 0.4862745, 0, 1, 1,
0.7601857, -1.591768, 2.752633, 0.4941176, 0, 1, 1,
0.7604473, -0.6228766, 0.4556935, 0.5019608, 0, 1, 1,
0.7618842, -0.3926665, 0.3516644, 0.5058824, 0, 1, 1,
0.7701412, 0.1758691, -0.9845516, 0.5137255, 0, 1, 1,
0.7717555, 0.2339117, -1.078563, 0.5176471, 0, 1, 1,
0.7747825, 1.66598, -0.01860346, 0.5254902, 0, 1, 1,
0.7780929, -0.460266, 2.643367, 0.5294118, 0, 1, 1,
0.7811512, -0.7337324, 2.406799, 0.5372549, 0, 1, 1,
0.7935403, -0.1741481, 0.7445093, 0.5411765, 0, 1, 1,
0.7962999, 0.05577529, 1.786647, 0.5490196, 0, 1, 1,
0.8024561, 0.147887, -0.4266908, 0.5529412, 0, 1, 1,
0.8091071, 0.2998657, 1.799099, 0.5607843, 0, 1, 1,
0.8136196, 1.054184, 0.5632432, 0.5647059, 0, 1, 1,
0.8163104, 1.418594, 0.007891403, 0.572549, 0, 1, 1,
0.8183545, 0.8294213, 2.478578, 0.5764706, 0, 1, 1,
0.8186917, -0.5137909, 3.835625, 0.5843138, 0, 1, 1,
0.8213343, 0.7482716, 1.866609, 0.5882353, 0, 1, 1,
0.8235165, 1.014882, -1.0359, 0.5960785, 0, 1, 1,
0.8280206, -0.4360186, 0.8125424, 0.6039216, 0, 1, 1,
0.8282415, 0.6105664, -0.4037911, 0.6078432, 0, 1, 1,
0.828414, -0.5302437, 2.473965, 0.6156863, 0, 1, 1,
0.8292663, -1.15814, 1.551066, 0.6196079, 0, 1, 1,
0.8304662, 0.5000221, 1.165429, 0.627451, 0, 1, 1,
0.8310545, 0.4551175, 0.7362527, 0.6313726, 0, 1, 1,
0.8320211, 0.01313483, 0.5528105, 0.6392157, 0, 1, 1,
0.8364816, 0.8165843, -0.1771591, 0.6431373, 0, 1, 1,
0.8368879, -1.785356, 1.105332, 0.6509804, 0, 1, 1,
0.8390124, 0.2232312, 1.024441, 0.654902, 0, 1, 1,
0.8465819, 0.1436753, 1.072468, 0.6627451, 0, 1, 1,
0.8491917, -0.1942983, 2.166487, 0.6666667, 0, 1, 1,
0.8494743, -2.225721, 4.271149, 0.6745098, 0, 1, 1,
0.8497022, -0.6298203, 3.159891, 0.6784314, 0, 1, 1,
0.8500858, -0.05135481, 2.360744, 0.6862745, 0, 1, 1,
0.8504269, 0.8532485, 1.221015, 0.6901961, 0, 1, 1,
0.8572078, 1.613303, 2.217794, 0.6980392, 0, 1, 1,
0.8624941, -0.4247017, 0.5301582, 0.7058824, 0, 1, 1,
0.8627852, -0.5434579, 1.118257, 0.7098039, 0, 1, 1,
0.86318, -0.8416525, 2.938808, 0.7176471, 0, 1, 1,
0.8654904, -0.9366243, 1.904139, 0.7215686, 0, 1, 1,
0.8682265, -1.992793, 4.127149, 0.7294118, 0, 1, 1,
0.8810632, 0.8271949, 1.006975, 0.7333333, 0, 1, 1,
0.8824853, -2.865928, 0.9750904, 0.7411765, 0, 1, 1,
0.8836465, 0.7635989, -0.7200878, 0.7450981, 0, 1, 1,
0.8838031, -0.0237017, 0.5820397, 0.7529412, 0, 1, 1,
0.8851198, 3.128961, 1.090292, 0.7568628, 0, 1, 1,
0.8853035, -0.6961505, 3.092079, 0.7647059, 0, 1, 1,
0.8870282, 0.1655165, 0.9279746, 0.7686275, 0, 1, 1,
0.8895615, -0.5317996, 2.82261, 0.7764706, 0, 1, 1,
0.8909798, 1.343961, 1.389297, 0.7803922, 0, 1, 1,
0.8923914, 0.3205832, 1.48302, 0.7882353, 0, 1, 1,
0.8951326, -2.578861, 2.321862, 0.7921569, 0, 1, 1,
0.896704, -2.151287, 4.125463, 0.8, 0, 1, 1,
0.8988566, 2.598866, 0.3410946, 0.8078431, 0, 1, 1,
0.8989468, -0.6289613, 1.310426, 0.8117647, 0, 1, 1,
0.8999014, 0.09522276, 4.138965, 0.8196079, 0, 1, 1,
0.9016898, -0.4906483, 1.408618, 0.8235294, 0, 1, 1,
0.9035161, -0.5618856, 3.226183, 0.8313726, 0, 1, 1,
0.9046019, -0.2552941, 3.458626, 0.8352941, 0, 1, 1,
0.9047197, 0.6002153, 0.7438914, 0.8431373, 0, 1, 1,
0.9091998, -1.133922, 2.738905, 0.8470588, 0, 1, 1,
0.9100172, 3.279526, -0.4283926, 0.854902, 0, 1, 1,
0.9126636, 0.06996616, 0.9124781, 0.8588235, 0, 1, 1,
0.9165965, 1.229617, -0.2971945, 0.8666667, 0, 1, 1,
0.9180688, -0.4782433, 0.8019806, 0.8705882, 0, 1, 1,
0.9238335, 0.7082632, 1.424853, 0.8784314, 0, 1, 1,
0.9240228, -0.6186417, 3.034836, 0.8823529, 0, 1, 1,
0.9252344, -0.5438576, -0.1413081, 0.8901961, 0, 1, 1,
0.9271784, -1.59036, 3.154322, 0.8941177, 0, 1, 1,
0.9272503, 0.1834699, -0.1954407, 0.9019608, 0, 1, 1,
0.9273043, 0.01220756, 1.774741, 0.9098039, 0, 1, 1,
0.9295108, -1.134049, 2.612715, 0.9137255, 0, 1, 1,
0.9325992, 0.404008, 1.967278, 0.9215686, 0, 1, 1,
0.9426777, 1.174054, -0.3350837, 0.9254902, 0, 1, 1,
0.9581898, 0.2241679, 0.8071917, 0.9333333, 0, 1, 1,
0.9636188, -1.465813, 1.183865, 0.9372549, 0, 1, 1,
0.9654797, 0.9580406, 1.982439, 0.945098, 0, 1, 1,
0.9672222, -0.5576341, 0.7779692, 0.9490196, 0, 1, 1,
0.9739006, -0.1017636, -0.8382662, 0.9568627, 0, 1, 1,
0.9743513, 0.7113857, -0.1094764, 0.9607843, 0, 1, 1,
0.9867475, 0.7463594, 1.092751, 0.9686275, 0, 1, 1,
0.9875363, 1.805026, -0.04573431, 0.972549, 0, 1, 1,
0.9879287, 0.9501538, 2.010484, 0.9803922, 0, 1, 1,
0.9994282, 0.3708403, 2.3389, 0.9843137, 0, 1, 1,
1.000812, 0.3906258, 0.9268343, 0.9921569, 0, 1, 1,
1.002046, -0.8413164, 2.688825, 0.9960784, 0, 1, 1,
1.010805, -0.9263537, 2.707166, 1, 0, 0.9960784, 1,
1.012933, 0.7282894, -1.128563, 1, 0, 0.9882353, 1,
1.015715, -0.3382816, 2.499624, 1, 0, 0.9843137, 1,
1.021071, -0.9444667, 2.252559, 1, 0, 0.9764706, 1,
1.023433, 0.2707073, 0.402916, 1, 0, 0.972549, 1,
1.024702, -0.3904217, 0.7246214, 1, 0, 0.9647059, 1,
1.031659, -0.7865173, 0.15643, 1, 0, 0.9607843, 1,
1.031931, 0.3101476, 1.403337, 1, 0, 0.9529412, 1,
1.052155, -0.4361117, 3.257837, 1, 0, 0.9490196, 1,
1.057348, 1.195101, 0.677632, 1, 0, 0.9411765, 1,
1.060701, 0.1240468, 1.828296, 1, 0, 0.9372549, 1,
1.06186, 1.989567, 2.182873, 1, 0, 0.9294118, 1,
1.063869, 0.7638147, 2.04849, 1, 0, 0.9254902, 1,
1.063947, 0.4430803, 1.879603, 1, 0, 0.9176471, 1,
1.063962, -0.4534876, 1.718447, 1, 0, 0.9137255, 1,
1.068805, -0.2539543, -0.4508272, 1, 0, 0.9058824, 1,
1.07224, -1.168652, 2.775925, 1, 0, 0.9019608, 1,
1.082024, -0.548534, 2.795839, 1, 0, 0.8941177, 1,
1.082547, -0.8710515, 3.451124, 1, 0, 0.8862745, 1,
1.085523, -1.259897, 3.240504, 1, 0, 0.8823529, 1,
1.086637, 2.448649, 1.23906, 1, 0, 0.8745098, 1,
1.096153, -0.2728728, 1.024891, 1, 0, 0.8705882, 1,
1.099679, 0.660841, 2.167789, 1, 0, 0.8627451, 1,
1.100744, 0.7880294, 0.7771401, 1, 0, 0.8588235, 1,
1.10148, -0.8722238, 2.991239, 1, 0, 0.8509804, 1,
1.108245, -1.7307, 2.291458, 1, 0, 0.8470588, 1,
1.108249, 0.214712, 2.113961, 1, 0, 0.8392157, 1,
1.112107, -0.7279983, 0.8715351, 1, 0, 0.8352941, 1,
1.119312, 2.46027, -1.941237, 1, 0, 0.827451, 1,
1.123617, -1.250471, 0.6642218, 1, 0, 0.8235294, 1,
1.124114, 0.8373853, -0.1896818, 1, 0, 0.8156863, 1,
1.129202, -0.3312679, 2.508209, 1, 0, 0.8117647, 1,
1.138164, -1.377655, 2.476922, 1, 0, 0.8039216, 1,
1.13847, -0.376855, 1.942603, 1, 0, 0.7960784, 1,
1.151957, -0.6512383, 1.7943, 1, 0, 0.7921569, 1,
1.152197, 0.5509264, 0.3340516, 1, 0, 0.7843137, 1,
1.153451, -0.6045731, 2.217395, 1, 0, 0.7803922, 1,
1.163831, 2.267349, 0.126158, 1, 0, 0.772549, 1,
1.167954, 0.6064492, 1.712945, 1, 0, 0.7686275, 1,
1.169697, 1.212481, 1.612438, 1, 0, 0.7607843, 1,
1.174843, -1.083236, 2.474779, 1, 0, 0.7568628, 1,
1.176862, -1.441996, 3.132627, 1, 0, 0.7490196, 1,
1.177783, -0.5508813, 2.321227, 1, 0, 0.7450981, 1,
1.185061, 0.1427139, 1.768048, 1, 0, 0.7372549, 1,
1.185864, 1.432625, 0.1606282, 1, 0, 0.7333333, 1,
1.19005, 2.550484, 0.9339812, 1, 0, 0.7254902, 1,
1.197432, -0.08688421, 1.180051, 1, 0, 0.7215686, 1,
1.211708, -1.17054, 2.400909, 1, 0, 0.7137255, 1,
1.21647, -1.788644, 2.609542, 1, 0, 0.7098039, 1,
1.219343, -0.001870996, 0.3764268, 1, 0, 0.7019608, 1,
1.219689, 0.7850348, 0.5465316, 1, 0, 0.6941177, 1,
1.227477, -1.627167, 3.827229, 1, 0, 0.6901961, 1,
1.22772, 0.5823179, 2.260587, 1, 0, 0.682353, 1,
1.238097, 0.2415741, 2.225069, 1, 0, 0.6784314, 1,
1.240012, 1.559374, 0.03054995, 1, 0, 0.6705883, 1,
1.244129, 0.4420137, 0.7478428, 1, 0, 0.6666667, 1,
1.245894, 0.00660424, 2.438225, 1, 0, 0.6588235, 1,
1.263269, 1.119338, 1.261488, 1, 0, 0.654902, 1,
1.269035, 0.1265296, 1.955915, 1, 0, 0.6470588, 1,
1.273433, -0.6648096, 2.489882, 1, 0, 0.6431373, 1,
1.274398, 1.246538, 1.879822, 1, 0, 0.6352941, 1,
1.275135, 0.9914986, -0.2565243, 1, 0, 0.6313726, 1,
1.276094, 0.09272212, 2.266789, 1, 0, 0.6235294, 1,
1.285518, -1.1489, 2.619617, 1, 0, 0.6196079, 1,
1.288478, 0.3483015, 2.090844, 1, 0, 0.6117647, 1,
1.289739, -0.1194223, 2.148207, 1, 0, 0.6078432, 1,
1.296146, 0.7688221, 0.7277133, 1, 0, 0.6, 1,
1.298808, 0.8794804, 2.379945, 1, 0, 0.5921569, 1,
1.299476, -0.962777, 2.01771, 1, 0, 0.5882353, 1,
1.314813, 0.1869939, 1.366576, 1, 0, 0.5803922, 1,
1.31941, -0.7404123, 0.7101416, 1, 0, 0.5764706, 1,
1.326388, -1.002712, 2.323594, 1, 0, 0.5686275, 1,
1.332814, 1.613722, -0.2410578, 1, 0, 0.5647059, 1,
1.336084, 0.9760199, 0.7702017, 1, 0, 0.5568628, 1,
1.337787, -0.5051198, 0.9940085, 1, 0, 0.5529412, 1,
1.341331, -0.179828, 1.90192, 1, 0, 0.5450981, 1,
1.348103, -1.75281, 0.8578445, 1, 0, 0.5411765, 1,
1.352431, 0.8540614, 3.010226, 1, 0, 0.5333334, 1,
1.363998, 0.7863867, 2.313068, 1, 0, 0.5294118, 1,
1.371907, -0.4290134, 1.626894, 1, 0, 0.5215687, 1,
1.374471, -0.6481093, 2.096381, 1, 0, 0.5176471, 1,
1.376876, 0.109487, 1.591476, 1, 0, 0.509804, 1,
1.379046, 2.467359, 1.424159, 1, 0, 0.5058824, 1,
1.39854, 0.5359183, 0.8341885, 1, 0, 0.4980392, 1,
1.409405, -0.2581509, 3.137986, 1, 0, 0.4901961, 1,
1.411842, 0.8338736, -0.07804042, 1, 0, 0.4862745, 1,
1.412892, 1.763155, 0.8072328, 1, 0, 0.4784314, 1,
1.416975, -0.02258818, -1.238412, 1, 0, 0.4745098, 1,
1.425215, -0.4463016, 0.3759651, 1, 0, 0.4666667, 1,
1.427188, 0.1092442, 2.730967, 1, 0, 0.4627451, 1,
1.436484, 0.4013636, 0.6439295, 1, 0, 0.454902, 1,
1.436783, 0.4107419, 0.7434346, 1, 0, 0.4509804, 1,
1.443552, -0.4667525, 1.359723, 1, 0, 0.4431373, 1,
1.466179, 1.125648, 1.457482, 1, 0, 0.4392157, 1,
1.472709, -1.813739, 2.429525, 1, 0, 0.4313726, 1,
1.47538, 1.10399, 1.685037, 1, 0, 0.427451, 1,
1.4775, -0.9995925, 1.231791, 1, 0, 0.4196078, 1,
1.480011, 0.3959706, 0.4982798, 1, 0, 0.4156863, 1,
1.491359, 0.4767731, 1.105034, 1, 0, 0.4078431, 1,
1.493477, 0.279853, 2.085893, 1, 0, 0.4039216, 1,
1.506594, 0.06039194, 0.6910782, 1, 0, 0.3960784, 1,
1.511797, -0.8158178, 3.193946, 1, 0, 0.3882353, 1,
1.520337, -0.2555208, 3.34725, 1, 0, 0.3843137, 1,
1.530511, -2.538097, 4.292337, 1, 0, 0.3764706, 1,
1.550985, 1.196008, -0.4320118, 1, 0, 0.372549, 1,
1.551574, -1.374277, 0.9409555, 1, 0, 0.3647059, 1,
1.56928, -0.2194628, 0.9491423, 1, 0, 0.3607843, 1,
1.57511, -0.35714, 0.8982983, 1, 0, 0.3529412, 1,
1.576343, -1.807189, 2.088905, 1, 0, 0.3490196, 1,
1.577225, -1.305895, 2.712197, 1, 0, 0.3411765, 1,
1.583346, -1.801251, 2.599149, 1, 0, 0.3372549, 1,
1.585026, -1.235462, 1.196261, 1, 0, 0.3294118, 1,
1.59391, 0.3791851, 2.510111, 1, 0, 0.3254902, 1,
1.612986, 1.383398, 0.3139881, 1, 0, 0.3176471, 1,
1.628941, -0.7011679, 1.536539, 1, 0, 0.3137255, 1,
1.644996, 1.349074, 1.912341, 1, 0, 0.3058824, 1,
1.647869, -0.1017758, 1.548794, 1, 0, 0.2980392, 1,
1.650824, 1.543185, 0.7915819, 1, 0, 0.2941177, 1,
1.658605, -0.6908318, 1.352573, 1, 0, 0.2862745, 1,
1.66447, 0.119367, 2.619064, 1, 0, 0.282353, 1,
1.671449, 1.075788, -0.2436678, 1, 0, 0.2745098, 1,
1.696333, 1.180847, 0.9784585, 1, 0, 0.2705882, 1,
1.736867, -0.07276201, 2.079036, 1, 0, 0.2627451, 1,
1.763843, 2.597812, 0.05717292, 1, 0, 0.2588235, 1,
1.772815, 0.5316085, 2.867869, 1, 0, 0.2509804, 1,
1.794274, -0.4259581, 0.652328, 1, 0, 0.2470588, 1,
1.797701, -0.3806329, 1.069621, 1, 0, 0.2392157, 1,
1.804366, -1.355982, 1.494104, 1, 0, 0.2352941, 1,
1.812149, -0.6664745, 3.292249, 1, 0, 0.227451, 1,
1.81335, 0.9029654, 1.81571, 1, 0, 0.2235294, 1,
1.818377, 0.09195277, 3.006637, 1, 0, 0.2156863, 1,
1.833794, -0.7785142, 1.829958, 1, 0, 0.2117647, 1,
1.869579, -0.3899315, 0.7285798, 1, 0, 0.2039216, 1,
1.879436, 0.09611122, 0.5108944, 1, 0, 0.1960784, 1,
1.885239, -1.194168, 2.333079, 1, 0, 0.1921569, 1,
1.908248, 0.8503219, 2.399346, 1, 0, 0.1843137, 1,
1.910501, 0.4942782, 1.430769, 1, 0, 0.1803922, 1,
1.925767, 0.3917572, 1.024235, 1, 0, 0.172549, 1,
1.957842, 0.7777384, -0.501521, 1, 0, 0.1686275, 1,
1.965697, -0.7526572, 3.584121, 1, 0, 0.1607843, 1,
1.972571, -2.732516, 1.444271, 1, 0, 0.1568628, 1,
1.995158, -0.3198656, 0.8493947, 1, 0, 0.1490196, 1,
2.011526, 0.4543555, 2.686783, 1, 0, 0.145098, 1,
2.020847, -0.3375461, -0.00405804, 1, 0, 0.1372549, 1,
2.028291, 1.457609, 0.8355747, 1, 0, 0.1333333, 1,
2.058181, -1.803267, 2.451467, 1, 0, 0.1254902, 1,
2.104325, 0.5939406, 1.236179, 1, 0, 0.1215686, 1,
2.108635, 0.01309237, 2.859216, 1, 0, 0.1137255, 1,
2.14887, 0.9085327, 1.945841, 1, 0, 0.1098039, 1,
2.15895, 0.5306976, 1.726586, 1, 0, 0.1019608, 1,
2.193113, 0.5312031, 1.397919, 1, 0, 0.09411765, 1,
2.197718, -0.006970862, 1.920058, 1, 0, 0.09019608, 1,
2.227531, -1.909364, 1.478294, 1, 0, 0.08235294, 1,
2.321185, 1.447905, 3.579362, 1, 0, 0.07843138, 1,
2.413539, 0.7304786, 3.219048, 1, 0, 0.07058824, 1,
2.465197, -0.1235503, 1.599918, 1, 0, 0.06666667, 1,
2.483868, 0.5163649, 2.513789, 1, 0, 0.05882353, 1,
2.49633, -0.04729157, 0.1693124, 1, 0, 0.05490196, 1,
2.508487, 0.3561995, 1.72522, 1, 0, 0.04705882, 1,
2.519485, -0.5291051, 1.582057, 1, 0, 0.04313726, 1,
2.529873, -0.1949975, 0.829493, 1, 0, 0.03529412, 1,
2.541746, 0.3096088, 1.032142, 1, 0, 0.03137255, 1,
2.613346, -1.004187, 2.173887, 1, 0, 0.02352941, 1,
2.65335, 0.7707725, 0.6536594, 1, 0, 0.01960784, 1,
2.827854, -0.2279136, 1.951866, 1, 0, 0.01176471, 1,
3.153245, -0.8494784, 1.517428, 1, 0, 0.007843138, 1
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
0.0870527, -3.939054, -7.671696, 0, -0.5, 0.5, 0.5,
0.0870527, -3.939054, -7.671696, 1, -0.5, 0.5, 0.5,
0.0870527, -3.939054, -7.671696, 1, 1.5, 0.5, 0.5,
0.0870527, -3.939054, -7.671696, 0, 1.5, 0.5, 0.5
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
-4.018579, 0.193344, -7.671696, 0, -0.5, 0.5, 0.5,
-4.018579, 0.193344, -7.671696, 1, -0.5, 0.5, 0.5,
-4.018579, 0.193344, -7.671696, 1, 1.5, 0.5, 0.5,
-4.018579, 0.193344, -7.671696, 0, 1.5, 0.5, 0.5
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
-4.018579, -3.939054, -0.2381656, 0, -0.5, 0.5, 0.5,
-4.018579, -3.939054, -0.2381656, 1, -0.5, 0.5, 0.5,
-4.018579, -3.939054, -0.2381656, 1, 1.5, 0.5, 0.5,
-4.018579, -3.939054, -0.2381656, 0, 1.5, 0.5, 0.5
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
-2, -2.985424, -5.956266,
3, -2.985424, -5.956266,
-2, -2.985424, -5.956266,
-2, -3.144362, -6.242171,
-1, -2.985424, -5.956266,
-1, -3.144362, -6.242171,
0, -2.985424, -5.956266,
0, -3.144362, -6.242171,
1, -2.985424, -5.956266,
1, -3.144362, -6.242171,
2, -2.985424, -5.956266,
2, -3.144362, -6.242171,
3, -2.985424, -5.956266,
3, -3.144362, -6.242171
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
-2, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
-2, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
-2, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
-2, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5,
-1, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
-1, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
-1, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
-1, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5,
0, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
0, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
0, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
0, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5,
1, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
1, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
1, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
1, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5,
2, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
2, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
2, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
2, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5,
3, -3.462239, -6.813981, 0, -0.5, 0.5, 0.5,
3, -3.462239, -6.813981, 1, -0.5, 0.5, 0.5,
3, -3.462239, -6.813981, 1, 1.5, 0.5, 0.5,
3, -3.462239, -6.813981, 0, 1.5, 0.5, 0.5
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
-3.071126, -2, -5.956266,
-3.071126, 3, -5.956266,
-3.071126, -2, -5.956266,
-3.229035, -2, -6.242171,
-3.071126, -1, -5.956266,
-3.229035, -1, -6.242171,
-3.071126, 0, -5.956266,
-3.229035, 0, -6.242171,
-3.071126, 1, -5.956266,
-3.229035, 1, -6.242171,
-3.071126, 2, -5.956266,
-3.229035, 2, -6.242171,
-3.071126, 3, -5.956266,
-3.229035, 3, -6.242171
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
-3.544852, -2, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, -2, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, -2, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, -2, -6.813981, 0, 1.5, 0.5, 0.5,
-3.544852, -1, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, -1, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, -1, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, -1, -6.813981, 0, 1.5, 0.5, 0.5,
-3.544852, 0, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, 0, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, 0, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, 0, -6.813981, 0, 1.5, 0.5, 0.5,
-3.544852, 1, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, 1, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, 1, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, 1, -6.813981, 0, 1.5, 0.5, 0.5,
-3.544852, 2, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, 2, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, 2, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, 2, -6.813981, 0, 1.5, 0.5, 0.5,
-3.544852, 3, -6.813981, 0, -0.5, 0.5, 0.5,
-3.544852, 3, -6.813981, 1, -0.5, 0.5, 0.5,
-3.544852, 3, -6.813981, 1, 1.5, 0.5, 0.5,
-3.544852, 3, -6.813981, 0, 1.5, 0.5, 0.5
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
-3.071126, -2.985424, -4,
-3.071126, -2.985424, 4,
-3.071126, -2.985424, -4,
-3.229035, -3.144362, -4,
-3.071126, -2.985424, -2,
-3.229035, -3.144362, -2,
-3.071126, -2.985424, 0,
-3.229035, -3.144362, 0,
-3.071126, -2.985424, 2,
-3.229035, -3.144362, 2,
-3.071126, -2.985424, 4,
-3.229035, -3.144362, 4
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
-3.544852, -3.462239, -4, 0, -0.5, 0.5, 0.5,
-3.544852, -3.462239, -4, 1, -0.5, 0.5, 0.5,
-3.544852, -3.462239, -4, 1, 1.5, 0.5, 0.5,
-3.544852, -3.462239, -4, 0, 1.5, 0.5, 0.5,
-3.544852, -3.462239, -2, 0, -0.5, 0.5, 0.5,
-3.544852, -3.462239, -2, 1, -0.5, 0.5, 0.5,
-3.544852, -3.462239, -2, 1, 1.5, 0.5, 0.5,
-3.544852, -3.462239, -2, 0, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 0, 0, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 0, 1, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 0, 1, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 0, 0, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 2, 0, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 2, 1, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 2, 1, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 2, 0, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 4, 0, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 4, 1, -0.5, 0.5, 0.5,
-3.544852, -3.462239, 4, 1, 1.5, 0.5, 0.5,
-3.544852, -3.462239, 4, 0, 1.5, 0.5, 0.5
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
-3.071126, -2.985424, -5.956266,
-3.071126, 3.372112, -5.956266,
-3.071126, -2.985424, 5.479935,
-3.071126, 3.372112, 5.479935,
-3.071126, -2.985424, -5.956266,
-3.071126, -2.985424, 5.479935,
-3.071126, 3.372112, -5.956266,
-3.071126, 3.372112, 5.479935,
-3.071126, -2.985424, -5.956266,
3.245231, -2.985424, -5.956266,
-3.071126, -2.985424, 5.479935,
3.245231, -2.985424, 5.479935,
-3.071126, 3.372112, -5.956266,
3.245231, 3.372112, -5.956266,
-3.071126, 3.372112, 5.479935,
3.245231, 3.372112, 5.479935,
3.245231, -2.985424, -5.956266,
3.245231, 3.372112, -5.956266,
3.245231, -2.985424, 5.479935,
3.245231, 3.372112, 5.479935,
3.245231, -2.985424, -5.956266,
3.245231, -2.985424, 5.479935,
3.245231, 3.372112, -5.956266,
3.245231, 3.372112, 5.479935
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
var radius = 7.758378;
var distance = 34.5179;
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
mvMatrix.translate( -0.0870527, -0.193344, 0.2381656 );
mvMatrix.scale( 1.328061, 1.319459, 0.733505 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.5179);
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
Phenoxypropionate<-read.table("Phenoxypropionate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenoxypropionate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
y<-Phenoxypropionate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
```

```r
z<-Phenoxypropionate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenoxypropionate' not found
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
-2.97914, -0.9520583, -1.675562, 0, 0, 1, 1, 1,
-2.865367, -1.707204, -2.002574, 1, 0, 0, 1, 1,
-2.828258, 0.389443, -2.248647, 1, 0, 0, 1, 1,
-2.823919, -0.6615212, -2.696786, 1, 0, 0, 1, 1,
-2.653057, -0.1468717, -2.353757, 1, 0, 0, 1, 1,
-2.650463, -0.2266076, -1.944045, 1, 0, 0, 1, 1,
-2.560178, 0.279001, -3.556563, 0, 0, 0, 1, 1,
-2.526559, 1.797457, -0.6814495, 0, 0, 0, 1, 1,
-2.422814, 0.6638887, -1.56902, 0, 0, 0, 1, 1,
-2.415572, -0.7011346, -2.391063, 0, 0, 0, 1, 1,
-2.38645, -0.07866323, -3.253676, 0, 0, 0, 1, 1,
-2.314207, -1.000427, -3.104819, 0, 0, 0, 1, 1,
-2.118487, -0.8760203, -3.093, 0, 0, 0, 1, 1,
-2.095772, 1.717403, -0.8391592, 1, 1, 1, 1, 1,
-2.072789, 0.2612399, -2.606834, 1, 1, 1, 1, 1,
-2.025635, 0.5840821, -1.679573, 1, 1, 1, 1, 1,
-2.005664, -0.3755813, -2.968429, 1, 1, 1, 1, 1,
-1.979503, 0.4700112, -0.235271, 1, 1, 1, 1, 1,
-1.970745, 1.170073, -1.972742, 1, 1, 1, 1, 1,
-1.967288, -0.6541425, -1.797562, 1, 1, 1, 1, 1,
-1.962506, 1.584386, 0.2843887, 1, 1, 1, 1, 1,
-1.956076, -1.557181, -2.272438, 1, 1, 1, 1, 1,
-1.954277, -1.326931, -2.664233, 1, 1, 1, 1, 1,
-1.950394, -0.02333116, -2.496947, 1, 1, 1, 1, 1,
-1.91902, 0.2691468, 0.2872726, 1, 1, 1, 1, 1,
-1.881339, 0.2117239, -2.140827, 1, 1, 1, 1, 1,
-1.876194, -0.07918029, -0.7543606, 1, 1, 1, 1, 1,
-1.856197, -1.08241, -2.845998, 1, 1, 1, 1, 1,
-1.832861, 1.544089, 0.3613096, 0, 0, 1, 1, 1,
-1.824768, 1.380742, -2.476445, 1, 0, 0, 1, 1,
-1.822381, -0.9262536, -3.501646, 1, 0, 0, 1, 1,
-1.816262, 0.8743331, -2.354287, 1, 0, 0, 1, 1,
-1.79582, 1.660739, 0.9613764, 1, 0, 0, 1, 1,
-1.788861, -0.9481035, -0.445162, 1, 0, 0, 1, 1,
-1.783372, 1.198464, -0.8290007, 0, 0, 0, 1, 1,
-1.781222, 2.635304, -2.108257, 0, 0, 0, 1, 1,
-1.766126, 1.330616, -1.116914, 0, 0, 0, 1, 1,
-1.748516, 0.6699806, -1.180781, 0, 0, 0, 1, 1,
-1.745566, -0.3297456, -1.792064, 0, 0, 0, 1, 1,
-1.745262, 1.182125, 0.4428439, 0, 0, 0, 1, 1,
-1.701594, -0.07867331, -4.093057, 0, 0, 0, 1, 1,
-1.700111, 1.798482, -1.131932, 1, 1, 1, 1, 1,
-1.691299, -0.05093345, -3.108905, 1, 1, 1, 1, 1,
-1.688061, 0.1515466, -0.9592918, 1, 1, 1, 1, 1,
-1.677364, -0.04143474, -1.303097, 1, 1, 1, 1, 1,
-1.677005, 1.092873, -1.013006, 1, 1, 1, 1, 1,
-1.665729, -0.8143455, -2.419131, 1, 1, 1, 1, 1,
-1.654194, 0.7159885, 1.357034, 1, 1, 1, 1, 1,
-1.646608, 1.036662, 0.3740459, 1, 1, 1, 1, 1,
-1.644314, -0.3304271, -2.96892, 1, 1, 1, 1, 1,
-1.642893, -1.385423, -1.328236, 1, 1, 1, 1, 1,
-1.634609, 0.3727995, -2.998547, 1, 1, 1, 1, 1,
-1.629761, -0.8668973, -0.592801, 1, 1, 1, 1, 1,
-1.629542, -0.3096629, -2.222535, 1, 1, 1, 1, 1,
-1.627957, 1.243568, -1.399717, 1, 1, 1, 1, 1,
-1.625134, 0.5305176, -1.338543, 1, 1, 1, 1, 1,
-1.624442, -0.1240901, -1.948557, 0, 0, 1, 1, 1,
-1.619834, -1.545473, -3.001757, 1, 0, 0, 1, 1,
-1.613802, -1.311201, -4.108364, 1, 0, 0, 1, 1,
-1.606668, 1.382366, -0.02024431, 1, 0, 0, 1, 1,
-1.599046, 2.36248, -1.580373, 1, 0, 0, 1, 1,
-1.58987, -0.8201258, -3.973583, 1, 0, 0, 1, 1,
-1.589666, -0.4471717, -0.6883184, 0, 0, 0, 1, 1,
-1.588712, 2.528119, 0.6249816, 0, 0, 0, 1, 1,
-1.570328, -1.742884, -5.789719, 0, 0, 0, 1, 1,
-1.566001, -0.7766081, -0.9743039, 0, 0, 0, 1, 1,
-1.549568, 2.71681, 0.5730227, 0, 0, 0, 1, 1,
-1.537789, 1.319456, -3.152914, 0, 0, 0, 1, 1,
-1.53191, -0.8479987, -2.407471, 0, 0, 0, 1, 1,
-1.529055, -0.04936468, -2.049298, 1, 1, 1, 1, 1,
-1.527599, -0.9543696, -1.932114, 1, 1, 1, 1, 1,
-1.485487, -0.08478624, -2.478867, 1, 1, 1, 1, 1,
-1.485263, 0.3761058, -1.061855, 1, 1, 1, 1, 1,
-1.484486, -0.2870724, -2.989092, 1, 1, 1, 1, 1,
-1.475192, 0.4720966, -2.791595, 1, 1, 1, 1, 1,
-1.459165, 1.263294, 1.166099, 1, 1, 1, 1, 1,
-1.453306, 1.033061, 0.01384782, 1, 1, 1, 1, 1,
-1.449728, -0.07689408, -1.981897, 1, 1, 1, 1, 1,
-1.445727, -0.3340414, -2.998946, 1, 1, 1, 1, 1,
-1.429759, 0.6453579, -0.3308292, 1, 1, 1, 1, 1,
-1.411956, -0.5555537, -1.780018, 1, 1, 1, 1, 1,
-1.401756, 0.6975246, -1.853256, 1, 1, 1, 1, 1,
-1.400473, 1.473319, -0.9217731, 1, 1, 1, 1, 1,
-1.392375, -0.6831008, -2.598969, 1, 1, 1, 1, 1,
-1.389994, 1.083619, -1.946083, 0, 0, 1, 1, 1,
-1.389668, -1.223159, -0.7327253, 1, 0, 0, 1, 1,
-1.387607, 1.041553, 0.1657046, 1, 0, 0, 1, 1,
-1.385119, -0.559173, -3.047802, 1, 0, 0, 1, 1,
-1.384109, -1.407801, -2.497912, 1, 0, 0, 1, 1,
-1.378575, -0.6213785, -1.798071, 1, 0, 0, 1, 1,
-1.374886, -0.7713757, -0.55472, 0, 0, 0, 1, 1,
-1.371227, -0.4116932, -2.883281, 0, 0, 0, 1, 1,
-1.369815, 0.9258975, -2.182996, 0, 0, 0, 1, 1,
-1.365925, -1.600353, -1.915443, 0, 0, 0, 1, 1,
-1.353951, -0.9508514, -1.786891, 0, 0, 0, 1, 1,
-1.34303, 0.4491968, -1.18998, 0, 0, 0, 1, 1,
-1.340926, 2.096235, -0.7383518, 0, 0, 0, 1, 1,
-1.340064, -0.09994946, -2.879157, 1, 1, 1, 1, 1,
-1.33897, -0.6114541, -3.314072, 1, 1, 1, 1, 1,
-1.330043, -1.044991, -2.143303, 1, 1, 1, 1, 1,
-1.321612, -0.1756142, -2.771561, 1, 1, 1, 1, 1,
-1.308823, 1.891276, -1.028073, 1, 1, 1, 1, 1,
-1.306271, 1.032956, -1.088296, 1, 1, 1, 1, 1,
-1.294685, -1.739898, -1.121649, 1, 1, 1, 1, 1,
-1.292044, -0.9243028, -3.099118, 1, 1, 1, 1, 1,
-1.291046, -0.05447648, -0.4093994, 1, 1, 1, 1, 1,
-1.288736, 0.2503684, -0.8057761, 1, 1, 1, 1, 1,
-1.282995, -0.0559899, -3.461075, 1, 1, 1, 1, 1,
-1.277038, -0.03913318, -1.4057, 1, 1, 1, 1, 1,
-1.274116, -2.724374, -1.620624, 1, 1, 1, 1, 1,
-1.271091, 0.2853825, 0.9741704, 1, 1, 1, 1, 1,
-1.270746, 1.256683, -0.1940986, 1, 1, 1, 1, 1,
-1.269933, 0.5365409, -1.768707, 0, 0, 1, 1, 1,
-1.261233, -1.338464, -3.440303, 1, 0, 0, 1, 1,
-1.258725, 1.035405, -1.061696, 1, 0, 0, 1, 1,
-1.255224, -1.430282, -1.755964, 1, 0, 0, 1, 1,
-1.25156, -0.7902374, -2.818555, 1, 0, 0, 1, 1,
-1.251213, 0.561009, 0.1370926, 1, 0, 0, 1, 1,
-1.250362, 0.09703426, -1.769815, 0, 0, 0, 1, 1,
-1.249009, 1.121382, -3.882792, 0, 0, 0, 1, 1,
-1.248453, 0.7437168, -2.108654, 0, 0, 0, 1, 1,
-1.242196, 1.777692, -1.314388, 0, 0, 0, 1, 1,
-1.234194, -1.398134, -1.263676, 0, 0, 0, 1, 1,
-1.219274, -0.4787947, -0.2137342, 0, 0, 0, 1, 1,
-1.218078, -1.48329, -1.24423, 0, 0, 0, 1, 1,
-1.201146, 0.2745688, 1.89767, 1, 1, 1, 1, 1,
-1.200202, 0.03575526, -1.334807, 1, 1, 1, 1, 1,
-1.198173, 0.4274841, -0.4624935, 1, 1, 1, 1, 1,
-1.197363, 0.1442023, -1.5616, 1, 1, 1, 1, 1,
-1.194379, -0.416372, -1.401791, 1, 1, 1, 1, 1,
-1.173329, -0.7522249, -2.971492, 1, 1, 1, 1, 1,
-1.155379, -0.6366277, -3.602988, 1, 1, 1, 1, 1,
-1.147546, 0.3921453, -1.030534, 1, 1, 1, 1, 1,
-1.136549, -0.3675815, -1.487957, 1, 1, 1, 1, 1,
-1.135538, 0.9837032, -1.496848, 1, 1, 1, 1, 1,
-1.124501, -2.56593, -3.957857, 1, 1, 1, 1, 1,
-1.121112, 0.7880531, 0.02735418, 1, 1, 1, 1, 1,
-1.099678, 1.553707, -1.767855, 1, 1, 1, 1, 1,
-1.098523, -0.7135755, -3.01264, 1, 1, 1, 1, 1,
-1.096873, -1.026505, -3.718338, 1, 1, 1, 1, 1,
-1.089067, -0.03619245, -4.049304, 0, 0, 1, 1, 1,
-1.082653, -0.7527493, -1.858831, 1, 0, 0, 1, 1,
-1.08107, -0.2277594, -1.500998, 1, 0, 0, 1, 1,
-1.070677, -0.03631494, -1.278046, 1, 0, 0, 1, 1,
-1.070295, 0.2710469, -1.024956, 1, 0, 0, 1, 1,
-1.069446, -0.310237, -2.610046, 1, 0, 0, 1, 1,
-1.067188, 1.123527, -0.05656724, 0, 0, 0, 1, 1,
-1.066356, -1.280125, -2.015356, 0, 0, 0, 1, 1,
-1.064906, 0.1057659, -1.144747, 0, 0, 0, 1, 1,
-1.061931, -1.885885, -2.809755, 0, 0, 0, 1, 1,
-1.053647, -0.9854289, -2.711943, 0, 0, 0, 1, 1,
-1.044546, 1.144753, -0.9090176, 0, 0, 0, 1, 1,
-1.038062, -0.5002543, -3.002861, 0, 0, 0, 1, 1,
-1.032802, -0.7690565, -1.862013, 1, 1, 1, 1, 1,
-1.03073, -0.6066247, -1.711373, 1, 1, 1, 1, 1,
-1.029981, -1.398901, -2.407744, 1, 1, 1, 1, 1,
-1.023408, 0.1136743, 0.2455988, 1, 1, 1, 1, 1,
-1.02212, 0.8964241, 0.1842093, 1, 1, 1, 1, 1,
-1.020417, -0.0694357, -2.611883, 1, 1, 1, 1, 1,
-1.011743, -1.572753, -3.74756, 1, 1, 1, 1, 1,
-1.006443, 0.4392727, -2.189064, 1, 1, 1, 1, 1,
-1.00334, -1.967266, -4.420068, 1, 1, 1, 1, 1,
-1.002307, -2.185848, -1.69091, 1, 1, 1, 1, 1,
-1.001487, -0.5408226, -1.328939, 1, 1, 1, 1, 1,
-0.9936804, 0.1268419, -2.59529, 1, 1, 1, 1, 1,
-0.9922222, 0.1284839, -0.6613873, 1, 1, 1, 1, 1,
-0.9905371, -0.9468292, -2.251549, 1, 1, 1, 1, 1,
-0.9891824, -0.07082859, 0.5604318, 1, 1, 1, 1, 1,
-0.987219, 0.2018842, -1.079294, 0, 0, 1, 1, 1,
-0.9600176, 0.06795363, -2.298093, 1, 0, 0, 1, 1,
-0.9245822, 0.6155918, -1.316749, 1, 0, 0, 1, 1,
-0.9236177, -0.5164946, -1.194186, 1, 0, 0, 1, 1,
-0.9180308, -1.107898, -2.831079, 1, 0, 0, 1, 1,
-0.917505, 0.8804522, -2.554564, 1, 0, 0, 1, 1,
-0.9111879, 1.491803, -1.043386, 0, 0, 0, 1, 1,
-0.9046988, 0.407038, -2.003542, 0, 0, 0, 1, 1,
-0.903195, 0.1141079, -2.444177, 0, 0, 0, 1, 1,
-0.8993546, -0.6562346, -3.17963, 0, 0, 0, 1, 1,
-0.8957069, -0.276313, -2.410944, 0, 0, 0, 1, 1,
-0.8938698, -0.8569696, -2.087403, 0, 0, 0, 1, 1,
-0.8916149, -0.310169, -3.080465, 0, 0, 0, 1, 1,
-0.8879846, 0.8514971, -1.556, 1, 1, 1, 1, 1,
-0.8845101, -0.698541, -2.979577, 1, 1, 1, 1, 1,
-0.8836952, 0.9538925, -0.322575, 1, 1, 1, 1, 1,
-0.8795657, 0.09934137, -1.498974, 1, 1, 1, 1, 1,
-0.87753, -2.179807, -1.925101, 1, 1, 1, 1, 1,
-0.8774223, 1.75993, -0.5694968, 1, 1, 1, 1, 1,
-0.8705615, -0.7360573, -3.688817, 1, 1, 1, 1, 1,
-0.8700456, -0.9214203, -1.93213, 1, 1, 1, 1, 1,
-0.8695764, 0.7509764, -1.910387, 1, 1, 1, 1, 1,
-0.8615831, 0.1980884, -0.000512834, 1, 1, 1, 1, 1,
-0.8554797, 1.568497, 1.706712, 1, 1, 1, 1, 1,
-0.8549814, 2.236897, 0.6332352, 1, 1, 1, 1, 1,
-0.8531197, -0.8225768, -2.048393, 1, 1, 1, 1, 1,
-0.8518988, 0.6927398, 0.3154688, 1, 1, 1, 1, 1,
-0.8508505, 0.3218706, 0.4423079, 1, 1, 1, 1, 1,
-0.8487609, -0.9747409, -1.954031, 0, 0, 1, 1, 1,
-0.8483365, -1.245177, -2.502499, 1, 0, 0, 1, 1,
-0.8263547, 0.06038621, -0.3091028, 1, 0, 0, 1, 1,
-0.8249967, 0.01603622, -0.9638304, 1, 0, 0, 1, 1,
-0.8222927, -0.685572, -0.9708335, 1, 0, 0, 1, 1,
-0.820351, -1.249955, -1.214264, 1, 0, 0, 1, 1,
-0.8097634, -0.03264071, -1.571567, 0, 0, 0, 1, 1,
-0.809754, -1.003846, -0.08702065, 0, 0, 0, 1, 1,
-0.8056554, -0.151618, -1.327583, 0, 0, 0, 1, 1,
-0.8008616, -0.2598188, -2.670107, 0, 0, 0, 1, 1,
-0.7997469, -0.2181506, -1.43054, 0, 0, 0, 1, 1,
-0.7991388, 0.1740646, -1.259143, 0, 0, 0, 1, 1,
-0.795802, -0.1607213, -3.959454, 0, 0, 0, 1, 1,
-0.7923856, -0.1085247, -2.111228, 1, 1, 1, 1, 1,
-0.7913102, 0.1984683, -2.693779, 1, 1, 1, 1, 1,
-0.7861674, 0.2666789, -0.09516365, 1, 1, 1, 1, 1,
-0.7845606, 1.370986, 0.9995417, 1, 1, 1, 1, 1,
-0.7829129, -1.375574, -2.676497, 1, 1, 1, 1, 1,
-0.7785794, 0.1830213, -2.117127, 1, 1, 1, 1, 1,
-0.77195, 0.8497341, -0.1229596, 1, 1, 1, 1, 1,
-0.7706347, 0.9071673, -0.2256816, 1, 1, 1, 1, 1,
-0.767271, -1.811494, -2.599929, 1, 1, 1, 1, 1,
-0.7575206, 0.4765366, -0.8104424, 1, 1, 1, 1, 1,
-0.7567174, 0.04860507, -0.9936666, 1, 1, 1, 1, 1,
-0.7495992, 0.6065831, -0.455465, 1, 1, 1, 1, 1,
-0.74299, -0.6506227, -2.570929, 1, 1, 1, 1, 1,
-0.7428427, 0.4021119, -0.7453935, 1, 1, 1, 1, 1,
-0.7420602, -0.01481211, -1.914552, 1, 1, 1, 1, 1,
-0.7344174, -0.0355332, 0.4379426, 0, 0, 1, 1, 1,
-0.7313724, 1.363987, -0.034856, 1, 0, 0, 1, 1,
-0.7283604, -0.3120891, -2.372952, 1, 0, 0, 1, 1,
-0.7262457, 1.279024, -0.5409277, 1, 0, 0, 1, 1,
-0.725621, -0.700941, -2.171736, 1, 0, 0, 1, 1,
-0.7175988, 1.109275, -1.468927, 1, 0, 0, 1, 1,
-0.7165805, -0.8454363, -2.171702, 0, 0, 0, 1, 1,
-0.7130975, 0.9131093, 0.09350116, 0, 0, 0, 1, 1,
-0.7073331, 0.8026674, -0.5957894, 0, 0, 0, 1, 1,
-0.706156, 0.4019318, -1.25811, 0, 0, 0, 1, 1,
-0.7044884, 0.8020238, -1.472849, 0, 0, 0, 1, 1,
-0.6995991, 1.402204, -1.078554, 0, 0, 0, 1, 1,
-0.6976386, 0.3540487, 1.288454, 0, 0, 0, 1, 1,
-0.6966599, 0.4271534, -3.371102, 1, 1, 1, 1, 1,
-0.6869851, -0.7629036, -2.575325, 1, 1, 1, 1, 1,
-0.6826026, 1.487041, -0.2423819, 1, 1, 1, 1, 1,
-0.6763384, 1.459244, -0.2780841, 1, 1, 1, 1, 1,
-0.6759292, 0.6500503, -1.257154, 1, 1, 1, 1, 1,
-0.6734114, 0.7081856, -1.064928, 1, 1, 1, 1, 1,
-0.6701148, 0.1946317, -0.5550682, 1, 1, 1, 1, 1,
-0.6678026, -1.452339, -2.624743, 1, 1, 1, 1, 1,
-0.6668105, -0.6595803, -2.110364, 1, 1, 1, 1, 1,
-0.666302, 0.2272697, -1.460219, 1, 1, 1, 1, 1,
-0.6652193, -0.6843135, -3.146345, 1, 1, 1, 1, 1,
-0.6637791, -0.4516256, -2.987405, 1, 1, 1, 1, 1,
-0.6628348, 0.8735416, -1.209728, 1, 1, 1, 1, 1,
-0.6616908, 0.260529, -0.9338271, 1, 1, 1, 1, 1,
-0.6609186, 1.504439, -0.0278728, 1, 1, 1, 1, 1,
-0.652079, -0.5217031, -1.39373, 0, 0, 1, 1, 1,
-0.6510774, -0.3551231, -2.285366, 1, 0, 0, 1, 1,
-0.6445874, 1.234594, -0.3814498, 1, 0, 0, 1, 1,
-0.6435136, 0.350451, 0.3394382, 1, 0, 0, 1, 1,
-0.643503, -0.532725, -2.437927, 1, 0, 0, 1, 1,
-0.641995, 0.2083986, -0.814683, 1, 0, 0, 1, 1,
-0.6404589, -0.2785287, -3.29748, 0, 0, 0, 1, 1,
-0.6372556, 0.7692325, -1.496979, 0, 0, 0, 1, 1,
-0.6292544, 0.5198835, 1.25624, 0, 0, 0, 1, 1,
-0.6223062, 0.3728, -1.762998, 0, 0, 0, 1, 1,
-0.6077533, -1.107746, -1.509953, 0, 0, 0, 1, 1,
-0.6049499, -0.645778, -2.050333, 0, 0, 0, 1, 1,
-0.6034955, 1.675555, -0.330545, 0, 0, 0, 1, 1,
-0.6022429, -0.8685833, -2.857599, 1, 1, 1, 1, 1,
-0.5995104, -0.01396758, -0.004326727, 1, 1, 1, 1, 1,
-0.5913668, -0.2226954, -2.173553, 1, 1, 1, 1, 1,
-0.5910306, -0.1752765, -1.444895, 1, 1, 1, 1, 1,
-0.5866922, -0.7909821, -0.07340534, 1, 1, 1, 1, 1,
-0.5859122, 1.504489, -1.04141, 1, 1, 1, 1, 1,
-0.585395, 0.1274648, -2.480379, 1, 1, 1, 1, 1,
-0.5805364, 2.813085, 0.9530398, 1, 1, 1, 1, 1,
-0.5780361, 0.6988327, -2.025505, 1, 1, 1, 1, 1,
-0.572427, -0.961933, -1.405758, 1, 1, 1, 1, 1,
-0.5716831, -0.3810973, -4.184034, 1, 1, 1, 1, 1,
-0.5716611, -0.9347181, -0.8520226, 1, 1, 1, 1, 1,
-0.5597745, 0.5856866, -1.482854, 1, 1, 1, 1, 1,
-0.559643, 0.4464949, -2.204773, 1, 1, 1, 1, 1,
-0.5583608, 0.5917525, -0.04965576, 1, 1, 1, 1, 1,
-0.5578179, -1.897022, -2.480374, 0, 0, 1, 1, 1,
-0.5549871, 0.470501, -2.379213, 1, 0, 0, 1, 1,
-0.5382906, 1.88991, -0.9652517, 1, 0, 0, 1, 1,
-0.5356032, -0.7060656, -3.986929, 1, 0, 0, 1, 1,
-0.5350599, -0.7537587, -1.936382, 1, 0, 0, 1, 1,
-0.5286782, 0.559768, 0.425797, 1, 0, 0, 1, 1,
-0.5275816, -2.357965, -3.054395, 0, 0, 0, 1, 1,
-0.5193399, 1.157738, -1.837548, 0, 0, 0, 1, 1,
-0.5190157, -1.086266, -1.752993, 0, 0, 0, 1, 1,
-0.5185688, -0.8840427, -4.96789, 0, 0, 0, 1, 1,
-0.5161644, 1.142032, -0.7637628, 0, 0, 0, 1, 1,
-0.5151438, 1.293043, 0.7179202, 0, 0, 0, 1, 1,
-0.5150725, 0.2388213, -1.027339, 0, 0, 0, 1, 1,
-0.5121815, 0.559656, 0.2343882, 1, 1, 1, 1, 1,
-0.5065645, 0.2843942, 0.7642365, 1, 1, 1, 1, 1,
-0.5028815, 1.362776, 0.2177336, 1, 1, 1, 1, 1,
-0.4968057, 0.1671063, -0.6244792, 1, 1, 1, 1, 1,
-0.4957202, 0.3615053, -1.719899, 1, 1, 1, 1, 1,
-0.4912706, 0.07268383, -0.5918005, 1, 1, 1, 1, 1,
-0.4912703, -0.02732784, -0.5448602, 1, 1, 1, 1, 1,
-0.4807465, -0.2338796, -2.536987, 1, 1, 1, 1, 1,
-0.4744079, -0.3844104, -3.052589, 1, 1, 1, 1, 1,
-0.4730795, -0.3536749, -0.9053552, 1, 1, 1, 1, 1,
-0.4690705, -0.6959983, -2.686905, 1, 1, 1, 1, 1,
-0.4680279, -0.495082, -1.492174, 1, 1, 1, 1, 1,
-0.4675606, 0.1696867, -3.113703, 1, 1, 1, 1, 1,
-0.4628678, -2.496535, -1.44024, 1, 1, 1, 1, 1,
-0.4627909, 0.3247692, -1.421919, 1, 1, 1, 1, 1,
-0.4616966, -0.6045612, -4.302026, 0, 0, 1, 1, 1,
-0.4607961, -2.053552, -2.678385, 1, 0, 0, 1, 1,
-0.4571532, -1.757399, -4.01753, 1, 0, 0, 1, 1,
-0.4549013, 0.1067303, -1.500598, 1, 0, 0, 1, 1,
-0.4542379, -0.547092, -2.103811, 1, 0, 0, 1, 1,
-0.4476914, 0.2732207, -0.3986239, 1, 0, 0, 1, 1,
-0.4454457, -0.02172979, -3.37364, 0, 0, 0, 1, 1,
-0.444512, -0.03977725, -1.743635, 0, 0, 0, 1, 1,
-0.4417165, 0.5321072, 0.3492, 0, 0, 0, 1, 1,
-0.4403733, -0.1899154, -3.445625, 0, 0, 0, 1, 1,
-0.4394474, -0.1113376, -3.761193, 0, 0, 0, 1, 1,
-0.4370149, 2.044269e-05, -0.6254855, 0, 0, 0, 1, 1,
-0.4367593, -1.166106, -2.676916, 0, 0, 0, 1, 1,
-0.4357261, 0.6732609, 1.700101, 1, 1, 1, 1, 1,
-0.4335138, -0.5054157, -3.749197, 1, 1, 1, 1, 1,
-0.4188764, -1.632091, -2.936918, 1, 1, 1, 1, 1,
-0.4124567, 0.6531447, -0.9854628, 1, 1, 1, 1, 1,
-0.4122717, -1.14102, -3.417029, 1, 1, 1, 1, 1,
-0.4116751, -0.3579535, -2.344874, 1, 1, 1, 1, 1,
-0.394303, -0.08926737, -1.19899, 1, 1, 1, 1, 1,
-0.3923876, -0.3397188, -4.974392, 1, 1, 1, 1, 1,
-0.3909659, 1.278139, -0.8480711, 1, 1, 1, 1, 1,
-0.3898804, -1.245015, -5.205272, 1, 1, 1, 1, 1,
-0.3880547, 0.5851784, -0.4226991, 1, 1, 1, 1, 1,
-0.3851528, 0.724732, -0.3386552, 1, 1, 1, 1, 1,
-0.382517, 0.4895779, 1.337036, 1, 1, 1, 1, 1,
-0.3792017, 0.5928116, -0.1249664, 1, 1, 1, 1, 1,
-0.3772385, -1.639602, -2.750698, 1, 1, 1, 1, 1,
-0.3686593, -0.04469991, -1.785507, 0, 0, 1, 1, 1,
-0.3684998, -0.9514861, -1.791055, 1, 0, 0, 1, 1,
-0.3663434, -0.214562, -2.336513, 1, 0, 0, 1, 1,
-0.361712, -0.6910048, -3.411411, 1, 0, 0, 1, 1,
-0.3586104, -1.009723, -5.076634, 1, 0, 0, 1, 1,
-0.3542434, 0.5660375, -0.1091644, 1, 0, 0, 1, 1,
-0.353415, 0.9894089, -0.3565512, 0, 0, 0, 1, 1,
-0.3496079, -0.3399834, -1.147442, 0, 0, 0, 1, 1,
-0.3475003, -0.7740251, -1.744755, 0, 0, 0, 1, 1,
-0.3446145, -0.168554, -3.324697, 0, 0, 0, 1, 1,
-0.3438586, 0.9982572, -0.0409421, 0, 0, 0, 1, 1,
-0.3429808, 0.6408631, -0.1685151, 0, 0, 0, 1, 1,
-0.3401871, -0.5993502, -2.054066, 0, 0, 0, 1, 1,
-0.339665, 1.026624, -0.1764449, 1, 1, 1, 1, 1,
-0.3394897, 1.110297, -0.6737847, 1, 1, 1, 1, 1,
-0.3306915, -0.5282289, -4.30628, 1, 1, 1, 1, 1,
-0.3277023, -1.856925, -3.17361, 1, 1, 1, 1, 1,
-0.3251222, -0.275431, -1.47991, 1, 1, 1, 1, 1,
-0.3196346, -1.111249, -3.086537, 1, 1, 1, 1, 1,
-0.3179756, 1.442881, -0.1127281, 1, 1, 1, 1, 1,
-0.3159275, -0.4160455, -4.389738, 1, 1, 1, 1, 1,
-0.3051361, 1.907681, 0.5718151, 1, 1, 1, 1, 1,
-0.3040338, -2.892838, -2.607722, 1, 1, 1, 1, 1,
-0.3039782, 0.03432161, -1.757565, 1, 1, 1, 1, 1,
-0.303336, -1.120265, 0.1508475, 1, 1, 1, 1, 1,
-0.2945029, 0.4385738, -0.8757998, 1, 1, 1, 1, 1,
-0.293085, 0.25889, 0.428198, 1, 1, 1, 1, 1,
-0.2880267, -0.4320798, -2.076583, 1, 1, 1, 1, 1,
-0.2864222, -0.9865668, -2.263704, 0, 0, 1, 1, 1,
-0.2849886, 0.9041655, -0.198381, 1, 0, 0, 1, 1,
-0.2818134, 1.305265, 0.5108891, 1, 0, 0, 1, 1,
-0.2751063, 0.2974455, -1.537524, 1, 0, 0, 1, 1,
-0.2741911, 1.201402, 1.106255, 1, 0, 0, 1, 1,
-0.2736354, -1.350394, -2.740062, 1, 0, 0, 1, 1,
-0.2721583, -1.225471, -3.077681, 0, 0, 0, 1, 1,
-0.2720651, -0.9596713, -2.888699, 0, 0, 0, 1, 1,
-0.2686306, -1.539098, -2.691342, 0, 0, 0, 1, 1,
-0.2646277, 2.752555, 0.5360321, 0, 0, 0, 1, 1,
-0.2619825, -0.05172319, 0.1720978, 0, 0, 0, 1, 1,
-0.2603295, -0.158802, -2.892674, 0, 0, 0, 1, 1,
-0.2603051, -0.2579888, -4.30263, 0, 0, 0, 1, 1,
-0.2597857, -0.6403415, -2.785491, 1, 1, 1, 1, 1,
-0.2576896, 1.433784, 0.770123, 1, 1, 1, 1, 1,
-0.2530367, 1.004696, -0.5774644, 1, 1, 1, 1, 1,
-0.2490113, 0.9331321, -0.4503746, 1, 1, 1, 1, 1,
-0.2452495, 0.3232968, 0.08756027, 1, 1, 1, 1, 1,
-0.2425724, 1.124599, -0.5092454, 1, 1, 1, 1, 1,
-0.2417707, 1.527523, -0.5847287, 1, 1, 1, 1, 1,
-0.2388775, 0.5492389, 0.02199056, 1, 1, 1, 1, 1,
-0.2370482, -0.9745955, -4.073464, 1, 1, 1, 1, 1,
-0.2347522, 1.644129, 0.7000062, 1, 1, 1, 1, 1,
-0.2298246, -0.463372, -3.773624, 1, 1, 1, 1, 1,
-0.2291478, 0.08698878, -1.284646, 1, 1, 1, 1, 1,
-0.2258047, -0.7219055, -3.589475, 1, 1, 1, 1, 1,
-0.2239454, -0.503507, -0.6137686, 1, 1, 1, 1, 1,
-0.2213064, 0.7334574, 0.5023779, 1, 1, 1, 1, 1,
-0.2194178, -1.25691, -2.887995, 0, 0, 1, 1, 1,
-0.2163553, -0.002262627, -3.393631, 1, 0, 0, 1, 1,
-0.2146215, 0.5536293, -0.5063388, 1, 0, 0, 1, 1,
-0.2128318, -0.4539348, -4.253443, 1, 0, 0, 1, 1,
-0.2121951, 0.7676654, -0.710684, 1, 0, 0, 1, 1,
-0.2089448, -0.5848288, -2.57, 1, 0, 0, 1, 1,
-0.205117, 0.840471, 0.3329174, 0, 0, 0, 1, 1,
-0.2050141, -0.5317738, -2.448182, 0, 0, 0, 1, 1,
-0.2040022, 0.09429683, -1.761538, 0, 0, 0, 1, 1,
-0.2026099, -0.5084417, -2.328178, 0, 0, 0, 1, 1,
-0.2016068, 0.07480966, -1.675582, 0, 0, 0, 1, 1,
-0.1941498, 1.802249, -0.3995733, 0, 0, 0, 1, 1,
-0.1896742, 0.1410222, 0.6950213, 0, 0, 0, 1, 1,
-0.1870215, -1.279022, -3.585354, 1, 1, 1, 1, 1,
-0.183356, 0.5351018, -0.1363282, 1, 1, 1, 1, 1,
-0.182573, -0.05037441, -1.457171, 1, 1, 1, 1, 1,
-0.1823391, 1.837009, 0.4864311, 1, 1, 1, 1, 1,
-0.1775357, -1.701206, -2.254956, 1, 1, 1, 1, 1,
-0.1725347, -1.218495, -0.1608541, 1, 1, 1, 1, 1,
-0.1717502, -2.101405, -4.767052, 1, 1, 1, 1, 1,
-0.1693341, -0.2200051, -2.177885, 1, 1, 1, 1, 1,
-0.169304, 1.265631, 0.3140939, 1, 1, 1, 1, 1,
-0.1660663, 1.86038, -0.979984, 1, 1, 1, 1, 1,
-0.1636851, 1.202105, -1.662146, 1, 1, 1, 1, 1,
-0.1603612, 1.00919, -1.716188, 1, 1, 1, 1, 1,
-0.1588367, -0.5318716, -2.388113, 1, 1, 1, 1, 1,
-0.158051, -1.757181, -2.51125, 1, 1, 1, 1, 1,
-0.15703, 1.590207, 2.234969, 1, 1, 1, 1, 1,
-0.1566872, -1.376078, -2.006422, 0, 0, 1, 1, 1,
-0.1544505, -1.635442, -1.398769, 1, 0, 0, 1, 1,
-0.1525934, 0.4709792, -0.6261265, 1, 0, 0, 1, 1,
-0.1508316, 1.770845, -1.06393, 1, 0, 0, 1, 1,
-0.1437775, -0.9422564, -3.368843, 1, 0, 0, 1, 1,
-0.1436472, -0.5075446, -4.615013, 1, 0, 0, 1, 1,
-0.1420864, -0.713365, -3.621114, 0, 0, 0, 1, 1,
-0.1409269, 0.9598854, 0.3311383, 0, 0, 0, 1, 1,
-0.1375865, 0.5026622, 0.6122233, 0, 0, 0, 1, 1,
-0.1344833, -0.675526, -1.892393, 0, 0, 0, 1, 1,
-0.1336672, 0.5019497, -1.04789, 0, 0, 0, 1, 1,
-0.1318723, -0.2625534, -3.504593, 0, 0, 0, 1, 1,
-0.1306284, -0.9355391, -2.522265, 0, 0, 0, 1, 1,
-0.1233333, -1.395433, -3.646196, 1, 1, 1, 1, 1,
-0.1218009, -0.3505287, -4.601007, 1, 1, 1, 1, 1,
-0.1212616, 1.773838, 0.389803, 1, 1, 1, 1, 1,
-0.1207349, -2.350486, -1.565741, 1, 1, 1, 1, 1,
-0.1189536, -0.5800601, -1.927701, 1, 1, 1, 1, 1,
-0.117629, -0.6266977, -3.783338, 1, 1, 1, 1, 1,
-0.1158308, -0.1691848, -3.435459, 1, 1, 1, 1, 1,
-0.1143989, -0.01655422, -3.554456, 1, 1, 1, 1, 1,
-0.1143642, -1.597994, -3.712802, 1, 1, 1, 1, 1,
-0.1140223, 1.809442, 2.017261, 1, 1, 1, 1, 1,
-0.1079107, 0.5847631, 0.5334732, 1, 1, 1, 1, 1,
-0.09748181, 1.228948, -1.257506, 1, 1, 1, 1, 1,
-0.09486389, -0.4302773, -2.489307, 1, 1, 1, 1, 1,
-0.09249062, 1.379585, 0.1118262, 1, 1, 1, 1, 1,
-0.09031554, 1.092688, -2.87501, 1, 1, 1, 1, 1,
-0.08727372, -0.9266537, -4.883535, 0, 0, 1, 1, 1,
-0.08378748, -0.7941517, -2.908563, 1, 0, 0, 1, 1,
-0.08155641, 0.2794074, -0.11254, 1, 0, 0, 1, 1,
-0.07883706, -0.9356304, -3.055161, 1, 0, 0, 1, 1,
-0.07870879, 1.700868, -0.1577169, 1, 0, 0, 1, 1,
-0.07406102, 0.5640931, 1.081853, 1, 0, 0, 1, 1,
-0.07340157, -0.00639906, -0.4487172, 0, 0, 0, 1, 1,
-0.07014129, 0.1301497, -0.5869052, 0, 0, 0, 1, 1,
-0.07008819, 0.4420301, -0.03029132, 0, 0, 0, 1, 1,
-0.06890326, -0.7221758, -2.412066, 0, 0, 0, 1, 1,
-0.06207245, -0.7463405, -2.900399, 0, 0, 0, 1, 1,
-0.05621566, -1.843225, -4.516531, 0, 0, 0, 1, 1,
-0.05518508, -0.004714184, -2.475335, 0, 0, 0, 1, 1,
-0.0512477, 0.6048016, 0.4423488, 1, 1, 1, 1, 1,
-0.04745436, -0.4521768, -3.312221, 1, 1, 1, 1, 1,
-0.04346053, -1.254969, -2.813641, 1, 1, 1, 1, 1,
-0.04287006, -0.2736564, -2.884597, 1, 1, 1, 1, 1,
-0.03547489, -1.282576, -3.639708, 1, 1, 1, 1, 1,
-0.03452704, 0.1999918, -0.8751422, 1, 1, 1, 1, 1,
-0.03361025, -2.827521, -4.445271, 1, 1, 1, 1, 1,
-0.03276392, 0.4958749, 0.2915629, 1, 1, 1, 1, 1,
-0.03211111, 0.1365306, -0.02679315, 1, 1, 1, 1, 1,
-0.03043673, -0.3687938, -3.346127, 1, 1, 1, 1, 1,
-0.02912763, 1.172939, 0.4356546, 1, 1, 1, 1, 1,
-0.02726407, -0.6190066, -2.070518, 1, 1, 1, 1, 1,
-0.0212631, 0.478834, -0.06111876, 1, 1, 1, 1, 1,
-0.01496719, 0.9387865, 1.08688, 1, 1, 1, 1, 1,
-0.01300037, 1.148866, 0.0623513, 1, 1, 1, 1, 1,
-0.01155293, -0.6751869, -3.686981, 0, 0, 1, 1, 1,
-0.009501884, -0.3643135, -1.459257, 1, 0, 0, 1, 1,
-0.005776327, -0.05548302, -3.365718, 1, 0, 0, 1, 1,
-0.0007445686, 0.1529699, -0.4547101, 1, 0, 0, 1, 1,
0.002067119, -1.04919, 3.347788, 1, 0, 0, 1, 1,
0.006119038, -0.1060671, 1.938525, 1, 0, 0, 1, 1,
0.007812076, 0.03686984, 0.204169, 0, 0, 0, 1, 1,
0.01132672, 0.3378758, 1.533572, 0, 0, 0, 1, 1,
0.0113321, -1.144956, 2.699958, 0, 0, 0, 1, 1,
0.01208784, 1.470245, -0.8965442, 0, 0, 0, 1, 1,
0.01263116, -0.1502408, 3.502909, 0, 0, 0, 1, 1,
0.01323778, -1.521296, 3.692086, 0, 0, 0, 1, 1,
0.01423717, 1.091144, 1.490196, 0, 0, 0, 1, 1,
0.01498891, -0.3038033, 2.18962, 1, 1, 1, 1, 1,
0.01881345, -0.5214604, 1.626398, 1, 1, 1, 1, 1,
0.02064003, 1.009363, 0.02789854, 1, 1, 1, 1, 1,
0.02316115, 0.6648929, -0.7574708, 1, 1, 1, 1, 1,
0.02650722, -0.2603084, 2.314934, 1, 1, 1, 1, 1,
0.02901229, -0.1704609, 2.901484, 1, 1, 1, 1, 1,
0.0447754, -0.75863, 2.631584, 1, 1, 1, 1, 1,
0.04740157, 1.275352, 0.2553113, 1, 1, 1, 1, 1,
0.06117691, 1.022551, -0.1400543, 1, 1, 1, 1, 1,
0.06328581, 1.137538, -0.02627396, 1, 1, 1, 1, 1,
0.06432682, -1.288277, 2.600292, 1, 1, 1, 1, 1,
0.07009895, 0.5329989, 0.2931167, 1, 1, 1, 1, 1,
0.07155158, -0.01123472, 1.118494, 1, 1, 1, 1, 1,
0.07165824, -0.1097056, 2.695278, 1, 1, 1, 1, 1,
0.0739347, -0.2920376, 0.5929998, 1, 1, 1, 1, 1,
0.07397141, -0.6053365, 0.9993995, 0, 0, 1, 1, 1,
0.0740857, 0.403745, 0.6411677, 1, 0, 0, 1, 1,
0.07684404, -2.40696, 3.304527, 1, 0, 0, 1, 1,
0.08126295, -0.5562046, 1.836779, 1, 0, 0, 1, 1,
0.08360729, 1.295863, -1.750781, 1, 0, 0, 1, 1,
0.0894754, 0.8195803, -1.093359, 1, 0, 0, 1, 1,
0.08978609, -0.8870503, 1.866036, 0, 0, 0, 1, 1,
0.09020123, 1.252578, 0.9491916, 0, 0, 0, 1, 1,
0.09035883, 0.8985958, -0.7839242, 0, 0, 0, 1, 1,
0.09861287, 0.6098238, 1.275944, 0, 0, 0, 1, 1,
0.09946518, -1.016306, 1.860146, 0, 0, 0, 1, 1,
0.1000272, 0.1044545, 1.442824, 0, 0, 0, 1, 1,
0.1016404, -1.099077, 1.853926, 0, 0, 0, 1, 1,
0.1016461, 0.2118225, -0.8180784, 1, 1, 1, 1, 1,
0.10388, -0.01763152, 2.777173, 1, 1, 1, 1, 1,
0.1055152, -0.7244868, 2.003947, 1, 1, 1, 1, 1,
0.1076068, 1.212692, -1.458304, 1, 1, 1, 1, 1,
0.1169132, -0.9776667, 3.55145, 1, 1, 1, 1, 1,
0.1190235, 1.010709, 1.19202, 1, 1, 1, 1, 1,
0.1259277, 0.1883012, 1.097367, 1, 1, 1, 1, 1,
0.1313034, 0.4196039, 0.2154305, 1, 1, 1, 1, 1,
0.1315979, 0.6447413, 0.4847616, 1, 1, 1, 1, 1,
0.1335486, -0.5204824, 2.037498, 1, 1, 1, 1, 1,
0.1465732, -1.066746, 1.809991, 1, 1, 1, 1, 1,
0.1484766, 0.5449234, 0.8951702, 1, 1, 1, 1, 1,
0.1490621, -2.59715, 3.998279, 1, 1, 1, 1, 1,
0.1497767, 0.1858025, -1.241348, 1, 1, 1, 1, 1,
0.1511917, -0.6474666, 1.632417, 1, 1, 1, 1, 1,
0.1512619, 1.164162, -0.3271126, 0, 0, 1, 1, 1,
0.1536965, 0.4380606, 0.005572852, 1, 0, 0, 1, 1,
0.1594489, -1.219977, 2.175313, 1, 0, 0, 1, 1,
0.1603493, 2.032959, -0.4862785, 1, 0, 0, 1, 1,
0.1609661, -0.3039913, 2.746752, 1, 0, 0, 1, 1,
0.1611589, 1.076032, -1.393902, 1, 0, 0, 1, 1,
0.1728158, 1.211872, 0.6322879, 0, 0, 0, 1, 1,
0.178615, -1.575577, 4.01197, 0, 0, 0, 1, 1,
0.1822094, 0.4563689, -0.02934024, 0, 0, 0, 1, 1,
0.1844564, -0.6172035, 4.053245, 0, 0, 0, 1, 1,
0.1847259, 1.345965, 0.5631142, 0, 0, 0, 1, 1,
0.190283, -0.6156623, 3.659896, 0, 0, 0, 1, 1,
0.190936, 1.516815, -0.890734, 0, 0, 0, 1, 1,
0.1924158, 0.7163843, 0.3427333, 1, 1, 1, 1, 1,
0.1926631, -0.2098245, 1.814113, 1, 1, 1, 1, 1,
0.1940841, -0.8828501, 2.852221, 1, 1, 1, 1, 1,
0.1947716, -0.9172239, 4.753253, 1, 1, 1, 1, 1,
0.2029286, -0.3475759, 3.049064, 1, 1, 1, 1, 1,
0.2040493, 0.2161794, 0.2384071, 1, 1, 1, 1, 1,
0.2078454, 0.9157123, 0.2992667, 1, 1, 1, 1, 1,
0.2105633, -0.03417625, 1.779237, 1, 1, 1, 1, 1,
0.2146903, 0.2639325, 0.9540485, 1, 1, 1, 1, 1,
0.2151636, 1.957745, -0.3523689, 1, 1, 1, 1, 1,
0.2170931, -0.6444784, 4.119818, 1, 1, 1, 1, 1,
0.2207121, 0.2849286, 1.457386, 1, 1, 1, 1, 1,
0.2243365, -0.09678735, 1.087155, 1, 1, 1, 1, 1,
0.2254257, -0.3484372, 4.057199, 1, 1, 1, 1, 1,
0.2257909, 0.9294291, 0.1882717, 1, 1, 1, 1, 1,
0.2300887, -1.821599, 3.745174, 0, 0, 1, 1, 1,
0.2322607, 1.194653, 0.7792404, 1, 0, 0, 1, 1,
0.2345753, 1.284968, -0.02191061, 1, 0, 0, 1, 1,
0.2408012, -0.1855389, 1.422287, 1, 0, 0, 1, 1,
0.244621, 1.151309, 1.127608, 1, 0, 0, 1, 1,
0.2452193, -0.5225086, 2.802278, 1, 0, 0, 1, 1,
0.2461629, 1.750501, 0.0187126, 0, 0, 0, 1, 1,
0.2561224, 1.395437, -0.150603, 0, 0, 0, 1, 1,
0.2594779, -1.029803, 3.113324, 0, 0, 0, 1, 1,
0.2595451, -0.05954212, 1.208129, 0, 0, 0, 1, 1,
0.2605961, -0.40808, 3.022951, 0, 0, 0, 1, 1,
0.2624526, -1.525263, 5.313388, 0, 0, 0, 1, 1,
0.2631562, -0.9025491, 3.129681, 0, 0, 0, 1, 1,
0.2642522, -0.41647, 2.88069, 1, 1, 1, 1, 1,
0.2653617, 0.2925943, 1.24604, 1, 1, 1, 1, 1,
0.2722495, 1.61779, -1.98658, 1, 1, 1, 1, 1,
0.2852792, -0.5345513, 2.420987, 1, 1, 1, 1, 1,
0.2903703, 0.8074424, 0.8002691, 1, 1, 1, 1, 1,
0.2942113, -1.553968, 3.912513, 1, 1, 1, 1, 1,
0.2967196, 0.6653533, -0.04320592, 1, 1, 1, 1, 1,
0.2977311, -0.8239622, 2.542604, 1, 1, 1, 1, 1,
0.2995806, 0.8836443, -0.4883445, 1, 1, 1, 1, 1,
0.299661, -1.530584, 2.432517, 1, 1, 1, 1, 1,
0.2998808, 0.282927, -0.9894405, 1, 1, 1, 1, 1,
0.3027256, 0.006633155, 2.873672, 1, 1, 1, 1, 1,
0.3144983, -0.1832306, 2.94519, 1, 1, 1, 1, 1,
0.3229931, -0.007223777, 2.072084, 1, 1, 1, 1, 1,
0.3242828, 0.9251297, 1.120871, 1, 1, 1, 1, 1,
0.3285283, 2.156531, -0.1581354, 0, 0, 1, 1, 1,
0.3286664, -0.6254882, 1.226617, 1, 0, 0, 1, 1,
0.3286696, -1.816808, 3.895758, 1, 0, 0, 1, 1,
0.3399519, 0.6197208, 1.031934, 1, 0, 0, 1, 1,
0.3419706, -1.238482, 3.08159, 1, 0, 0, 1, 1,
0.3434483, -0.5879025, 2.626053, 1, 0, 0, 1, 1,
0.3506334, -0.1070534, 1.102505, 0, 0, 0, 1, 1,
0.3567312, -0.2476772, 2.927271, 0, 0, 0, 1, 1,
0.3590896, -0.7448857, 2.41993, 0, 0, 0, 1, 1,
0.3591125, 1.366672, 1.223442, 0, 0, 0, 1, 1,
0.3593884, 1.129487, 0.2586712, 0, 0, 0, 1, 1,
0.3598031, -0.6120453, 0.5430129, 0, 0, 0, 1, 1,
0.3599015, 0.8348731, -1.204319, 0, 0, 0, 1, 1,
0.3599346, -1.734608, 1.527024, 1, 1, 1, 1, 1,
0.3606004, -1.802977, 2.132367, 1, 1, 1, 1, 1,
0.3608397, 0.912271, -0.8088445, 1, 1, 1, 1, 1,
0.3627646, -0.1595671, 0.830744, 1, 1, 1, 1, 1,
0.3644985, -1.541401, 1.909711, 1, 1, 1, 1, 1,
0.3671935, -1.801491, 3.510748, 1, 1, 1, 1, 1,
0.3678051, 0.8927132, -0.7148769, 1, 1, 1, 1, 1,
0.3719743, -1.171492, 4.225202, 1, 1, 1, 1, 1,
0.3720389, 0.1310147, -0.2845743, 1, 1, 1, 1, 1,
0.37266, -0.4291554, 3.81722, 1, 1, 1, 1, 1,
0.3834287, -0.6410091, 1.153545, 1, 1, 1, 1, 1,
0.3899897, 0.648275, 1.653062, 1, 1, 1, 1, 1,
0.3915269, 0.8783972, 1.034047, 1, 1, 1, 1, 1,
0.3927971, 0.361513, 1.851558, 1, 1, 1, 1, 1,
0.393366, 0.4538819, 2.094449, 1, 1, 1, 1, 1,
0.3936317, -1.531381, 2.850161, 0, 0, 1, 1, 1,
0.3968017, 1.885804, -1.750589, 1, 0, 0, 1, 1,
0.3968388, -1.687428, 2.194426, 1, 0, 0, 1, 1,
0.3969859, 1.164121, -0.427554, 1, 0, 0, 1, 1,
0.3993432, -0.6222519, 3.621626, 1, 0, 0, 1, 1,
0.4052617, 0.2599081, 2.223502, 1, 0, 0, 1, 1,
0.4056277, -0.5580141, 1.005509, 0, 0, 0, 1, 1,
0.407317, 0.5873063, 1.315805, 0, 0, 0, 1, 1,
0.4074229, -1.521145, 3.226051, 0, 0, 0, 1, 1,
0.40991, 0.04369996, 1.588903, 0, 0, 0, 1, 1,
0.411287, -0.2487213, 2.281749, 0, 0, 0, 1, 1,
0.4132352, -0.2790366, 3.080213, 0, 0, 0, 1, 1,
0.413277, -0.9350653, 3.400847, 0, 0, 0, 1, 1,
0.4169577, 0.7262763, 1.753242, 1, 1, 1, 1, 1,
0.4183972, 0.03197925, 1.311662, 1, 1, 1, 1, 1,
0.4304259, -0.01816037, 1.451464, 1, 1, 1, 1, 1,
0.4368699, 0.163287, 0.47192, 1, 1, 1, 1, 1,
0.4370537, 0.8806809, 0.7650033, 1, 1, 1, 1, 1,
0.4388506, -0.004802981, 0.7123308, 1, 1, 1, 1, 1,
0.4493967, -0.790274, 2.255096, 1, 1, 1, 1, 1,
0.4504402, 1.450916, 0.1287579, 1, 1, 1, 1, 1,
0.4507765, -0.1331254, 2.757634, 1, 1, 1, 1, 1,
0.4524775, 0.7767861, 1.56984, 1, 1, 1, 1, 1,
0.4543391, 1.212396, 0.7160844, 1, 1, 1, 1, 1,
0.4572962, 0.6659085, 1.548111, 1, 1, 1, 1, 1,
0.4591921, 0.4219529, 0.02433443, 1, 1, 1, 1, 1,
0.4598025, 0.5350267, 2.007016, 1, 1, 1, 1, 1,
0.4601663, 1.443342, -1.790604, 1, 1, 1, 1, 1,
0.4642087, -1.738597, 3.25832, 0, 0, 1, 1, 1,
0.4680485, -1.678072, 1.253456, 1, 0, 0, 1, 1,
0.4738523, 0.3577401, 1.2654, 1, 0, 0, 1, 1,
0.4741222, 1.024793, -0.9424796, 1, 0, 0, 1, 1,
0.4792312, -0.3899261, 3.512402, 1, 0, 0, 1, 1,
0.4794794, 2.261852, 1.716412, 1, 0, 0, 1, 1,
0.4798701, 0.2039596, -0.6983383, 0, 0, 0, 1, 1,
0.480135, -0.1152749, 0.7304389, 0, 0, 0, 1, 1,
0.4887975, 0.155644, 1.446817, 0, 0, 0, 1, 1,
0.4936752, -1.191668, 3.574108, 0, 0, 0, 1, 1,
0.495592, 1.078207, -1.263399, 0, 0, 0, 1, 1,
0.4965982, -2.220814, 2.420672, 0, 0, 0, 1, 1,
0.4978308, 0.9728759, 0.3813274, 0, 0, 0, 1, 1,
0.498006, -0.7778047, 1.505556, 1, 1, 1, 1, 1,
0.499469, 1.323119, -1.186536, 1, 1, 1, 1, 1,
0.5015759, -0.6819353, 2.202112, 1, 1, 1, 1, 1,
0.5022674, 1.004619, -0.9324732, 1, 1, 1, 1, 1,
0.5048209, 0.2095781, 1.842742, 1, 1, 1, 1, 1,
0.5064888, -0.1418208, 1.84689, 1, 1, 1, 1, 1,
0.5239203, -0.9988821, 2.675799, 1, 1, 1, 1, 1,
0.5290694, 0.7592946, 0.971657, 1, 1, 1, 1, 1,
0.5298219, -0.1651244, 2.597198, 1, 1, 1, 1, 1,
0.5328881, -1.847892, 4.19561, 1, 1, 1, 1, 1,
0.5348109, -1.831504, 0.8854648, 1, 1, 1, 1, 1,
0.5405822, -0.3133718, 1.885132, 1, 1, 1, 1, 1,
0.5406299, 0.1701012, 1.541798, 1, 1, 1, 1, 1,
0.5407774, -0.3356372, 2.75032, 1, 1, 1, 1, 1,
0.5448455, -0.5445703, 2.543534, 1, 1, 1, 1, 1,
0.547574, -0.3817038, 1.913318, 0, 0, 1, 1, 1,
0.5540521, -0.2128099, 1.495621, 1, 0, 0, 1, 1,
0.5555197, -0.4674555, 3.332483, 1, 0, 0, 1, 1,
0.5588143, 0.08112383, 0.07530214, 1, 0, 0, 1, 1,
0.5600352, -1.367016, -0.02488075, 1, 0, 0, 1, 1,
0.5601989, -0.7752122, -0.03441435, 1, 0, 0, 1, 1,
0.5626365, 1.749044, 3.252512, 0, 0, 0, 1, 1,
0.5644498, 0.6874899, 1.584849, 0, 0, 0, 1, 1,
0.5653684, -0.6000462, 2.971743, 0, 0, 0, 1, 1,
0.5654731, -0.1286193, 0.1243565, 0, 0, 0, 1, 1,
0.5695158, 1.410617, -0.3683656, 0, 0, 0, 1, 1,
0.5738824, 0.7099026, -0.9925431, 0, 0, 0, 1, 1,
0.5746005, -0.3293079, 2.80656, 0, 0, 0, 1, 1,
0.5754076, 0.8994502, 1.301893, 1, 1, 1, 1, 1,
0.5802683, -1.552923, 3.834824, 1, 1, 1, 1, 1,
0.5812511, -0.4386646, 2.878216, 1, 1, 1, 1, 1,
0.5825595, -0.01549519, 1.391025, 1, 1, 1, 1, 1,
0.5858421, 1.02753, -0.3602601, 1, 1, 1, 1, 1,
0.5863017, -0.4980356, 1.512376, 1, 1, 1, 1, 1,
0.5882418, 0.2267442, 0.9854074, 1, 1, 1, 1, 1,
0.5893687, -0.1062244, -0.04050199, 1, 1, 1, 1, 1,
0.5929513, -0.7018164, 2.87812, 1, 1, 1, 1, 1,
0.5979857, -0.5667915, 2.323443, 1, 1, 1, 1, 1,
0.5996127, -0.7967547, 2.549499, 1, 1, 1, 1, 1,
0.6046497, 1.202662, -0.3529025, 1, 1, 1, 1, 1,
0.6049811, -0.5012378, 3.107558, 1, 1, 1, 1, 1,
0.6114048, 0.0438252, 1.944289, 1, 1, 1, 1, 1,
0.6155381, 1.699872, -0.1967424, 1, 1, 1, 1, 1,
0.6162312, 0.5983148, 3.335427, 0, 0, 1, 1, 1,
0.6164234, -0.2230406, 2.712953, 1, 0, 0, 1, 1,
0.6197619, 1.053273, 1.10259, 1, 0, 0, 1, 1,
0.6217773, -0.5212962, 2.132709, 1, 0, 0, 1, 1,
0.6258125, 0.01508303, -1.23734, 1, 0, 0, 1, 1,
0.6298109, -0.764879, 2.792904, 1, 0, 0, 1, 1,
0.6353971, -1.222562, 1.687449, 0, 0, 0, 1, 1,
0.6363747, 0.3816495, 2.387393, 0, 0, 0, 1, 1,
0.6365697, 1.148152, 1.858477, 0, 0, 0, 1, 1,
0.6367196, -0.203861, 2.150058, 0, 0, 0, 1, 1,
0.6367374, -1.512454, 1.187972, 0, 0, 0, 1, 1,
0.6372556, -1.257569, 2.5182, 0, 0, 0, 1, 1,
0.6408153, -0.9576814, 3.513969, 0, 0, 0, 1, 1,
0.6446313, -1.150923, 2.693545, 1, 1, 1, 1, 1,
0.6492777, -0.3708085, 4.123656, 1, 1, 1, 1, 1,
0.6507928, -1.747942, 3.184403, 1, 1, 1, 1, 1,
0.6560444, 0.8943757, 0.4666573, 1, 1, 1, 1, 1,
0.6586597, 1.265351, -0.5391287, 1, 1, 1, 1, 1,
0.6594459, 0.4152626, 2.377495, 1, 1, 1, 1, 1,
0.6633145, -0.9053879, 2.824682, 1, 1, 1, 1, 1,
0.6640281, 0.5393147, 0.706076, 1, 1, 1, 1, 1,
0.6674259, -0.2040742, 0.171152, 1, 1, 1, 1, 1,
0.6688703, -0.1402081, 1.511805, 1, 1, 1, 1, 1,
0.6697575, 0.4709154, 1.016037, 1, 1, 1, 1, 1,
0.6697818, -1.240561, 1.560893, 1, 1, 1, 1, 1,
0.6714433, -0.07027933, 3.249743, 1, 1, 1, 1, 1,
0.6746647, 0.2066447, 1.660484, 1, 1, 1, 1, 1,
0.6757025, 0.8492322, 0.4691802, 1, 1, 1, 1, 1,
0.6829407, 0.2706403, 0.7588981, 0, 0, 1, 1, 1,
0.6855302, 1.604201, -0.6148188, 1, 0, 0, 1, 1,
0.686788, 1.210245, 1.478104, 1, 0, 0, 1, 1,
0.6945078, -2.197271, 3.53042, 1, 0, 0, 1, 1,
0.6959811, -0.1328921, 1.493601, 1, 0, 0, 1, 1,
0.7046257, -0.5887997, 1.453337, 1, 0, 0, 1, 1,
0.7088123, -1.366318, 0.966328, 0, 0, 0, 1, 1,
0.7109438, -0.2269963, 1.125013, 0, 0, 0, 1, 1,
0.7234631, 0.0568718, 1.936156, 0, 0, 0, 1, 1,
0.7263649, 0.570739, 2.491735, 0, 0, 0, 1, 1,
0.7300573, 0.1831806, 2.580226, 0, 0, 0, 1, 1,
0.7337232, 0.4185885, 0.5184183, 0, 0, 0, 1, 1,
0.7345282, 1.094499, 1.468625, 0, 0, 0, 1, 1,
0.7397271, 0.9814951, 0.1781273, 1, 1, 1, 1, 1,
0.741019, -1.338806, 4.451734, 1, 1, 1, 1, 1,
0.7431297, 0.3958751, 1.690799, 1, 1, 1, 1, 1,
0.7446001, -0.05884146, 1.279437, 1, 1, 1, 1, 1,
0.7505389, 0.2770678, 1.337477, 1, 1, 1, 1, 1,
0.7512231, -1.016939, 3.064732, 1, 1, 1, 1, 1,
0.7545662, -0.5354227, 3.294865, 1, 1, 1, 1, 1,
0.759634, 0.1553988, 2.838586, 1, 1, 1, 1, 1,
0.7601857, -1.591768, 2.752633, 1, 1, 1, 1, 1,
0.7604473, -0.6228766, 0.4556935, 1, 1, 1, 1, 1,
0.7618842, -0.3926665, 0.3516644, 1, 1, 1, 1, 1,
0.7701412, 0.1758691, -0.9845516, 1, 1, 1, 1, 1,
0.7717555, 0.2339117, -1.078563, 1, 1, 1, 1, 1,
0.7747825, 1.66598, -0.01860346, 1, 1, 1, 1, 1,
0.7780929, -0.460266, 2.643367, 1, 1, 1, 1, 1,
0.7811512, -0.7337324, 2.406799, 0, 0, 1, 1, 1,
0.7935403, -0.1741481, 0.7445093, 1, 0, 0, 1, 1,
0.7962999, 0.05577529, 1.786647, 1, 0, 0, 1, 1,
0.8024561, 0.147887, -0.4266908, 1, 0, 0, 1, 1,
0.8091071, 0.2998657, 1.799099, 1, 0, 0, 1, 1,
0.8136196, 1.054184, 0.5632432, 1, 0, 0, 1, 1,
0.8163104, 1.418594, 0.007891403, 0, 0, 0, 1, 1,
0.8183545, 0.8294213, 2.478578, 0, 0, 0, 1, 1,
0.8186917, -0.5137909, 3.835625, 0, 0, 0, 1, 1,
0.8213343, 0.7482716, 1.866609, 0, 0, 0, 1, 1,
0.8235165, 1.014882, -1.0359, 0, 0, 0, 1, 1,
0.8280206, -0.4360186, 0.8125424, 0, 0, 0, 1, 1,
0.8282415, 0.6105664, -0.4037911, 0, 0, 0, 1, 1,
0.828414, -0.5302437, 2.473965, 1, 1, 1, 1, 1,
0.8292663, -1.15814, 1.551066, 1, 1, 1, 1, 1,
0.8304662, 0.5000221, 1.165429, 1, 1, 1, 1, 1,
0.8310545, 0.4551175, 0.7362527, 1, 1, 1, 1, 1,
0.8320211, 0.01313483, 0.5528105, 1, 1, 1, 1, 1,
0.8364816, 0.8165843, -0.1771591, 1, 1, 1, 1, 1,
0.8368879, -1.785356, 1.105332, 1, 1, 1, 1, 1,
0.8390124, 0.2232312, 1.024441, 1, 1, 1, 1, 1,
0.8465819, 0.1436753, 1.072468, 1, 1, 1, 1, 1,
0.8491917, -0.1942983, 2.166487, 1, 1, 1, 1, 1,
0.8494743, -2.225721, 4.271149, 1, 1, 1, 1, 1,
0.8497022, -0.6298203, 3.159891, 1, 1, 1, 1, 1,
0.8500858, -0.05135481, 2.360744, 1, 1, 1, 1, 1,
0.8504269, 0.8532485, 1.221015, 1, 1, 1, 1, 1,
0.8572078, 1.613303, 2.217794, 1, 1, 1, 1, 1,
0.8624941, -0.4247017, 0.5301582, 0, 0, 1, 1, 1,
0.8627852, -0.5434579, 1.118257, 1, 0, 0, 1, 1,
0.86318, -0.8416525, 2.938808, 1, 0, 0, 1, 1,
0.8654904, -0.9366243, 1.904139, 1, 0, 0, 1, 1,
0.8682265, -1.992793, 4.127149, 1, 0, 0, 1, 1,
0.8810632, 0.8271949, 1.006975, 1, 0, 0, 1, 1,
0.8824853, -2.865928, 0.9750904, 0, 0, 0, 1, 1,
0.8836465, 0.7635989, -0.7200878, 0, 0, 0, 1, 1,
0.8838031, -0.0237017, 0.5820397, 0, 0, 0, 1, 1,
0.8851198, 3.128961, 1.090292, 0, 0, 0, 1, 1,
0.8853035, -0.6961505, 3.092079, 0, 0, 0, 1, 1,
0.8870282, 0.1655165, 0.9279746, 0, 0, 0, 1, 1,
0.8895615, -0.5317996, 2.82261, 0, 0, 0, 1, 1,
0.8909798, 1.343961, 1.389297, 1, 1, 1, 1, 1,
0.8923914, 0.3205832, 1.48302, 1, 1, 1, 1, 1,
0.8951326, -2.578861, 2.321862, 1, 1, 1, 1, 1,
0.896704, -2.151287, 4.125463, 1, 1, 1, 1, 1,
0.8988566, 2.598866, 0.3410946, 1, 1, 1, 1, 1,
0.8989468, -0.6289613, 1.310426, 1, 1, 1, 1, 1,
0.8999014, 0.09522276, 4.138965, 1, 1, 1, 1, 1,
0.9016898, -0.4906483, 1.408618, 1, 1, 1, 1, 1,
0.9035161, -0.5618856, 3.226183, 1, 1, 1, 1, 1,
0.9046019, -0.2552941, 3.458626, 1, 1, 1, 1, 1,
0.9047197, 0.6002153, 0.7438914, 1, 1, 1, 1, 1,
0.9091998, -1.133922, 2.738905, 1, 1, 1, 1, 1,
0.9100172, 3.279526, -0.4283926, 1, 1, 1, 1, 1,
0.9126636, 0.06996616, 0.9124781, 1, 1, 1, 1, 1,
0.9165965, 1.229617, -0.2971945, 1, 1, 1, 1, 1,
0.9180688, -0.4782433, 0.8019806, 0, 0, 1, 1, 1,
0.9238335, 0.7082632, 1.424853, 1, 0, 0, 1, 1,
0.9240228, -0.6186417, 3.034836, 1, 0, 0, 1, 1,
0.9252344, -0.5438576, -0.1413081, 1, 0, 0, 1, 1,
0.9271784, -1.59036, 3.154322, 1, 0, 0, 1, 1,
0.9272503, 0.1834699, -0.1954407, 1, 0, 0, 1, 1,
0.9273043, 0.01220756, 1.774741, 0, 0, 0, 1, 1,
0.9295108, -1.134049, 2.612715, 0, 0, 0, 1, 1,
0.9325992, 0.404008, 1.967278, 0, 0, 0, 1, 1,
0.9426777, 1.174054, -0.3350837, 0, 0, 0, 1, 1,
0.9581898, 0.2241679, 0.8071917, 0, 0, 0, 1, 1,
0.9636188, -1.465813, 1.183865, 0, 0, 0, 1, 1,
0.9654797, 0.9580406, 1.982439, 0, 0, 0, 1, 1,
0.9672222, -0.5576341, 0.7779692, 1, 1, 1, 1, 1,
0.9739006, -0.1017636, -0.8382662, 1, 1, 1, 1, 1,
0.9743513, 0.7113857, -0.1094764, 1, 1, 1, 1, 1,
0.9867475, 0.7463594, 1.092751, 1, 1, 1, 1, 1,
0.9875363, 1.805026, -0.04573431, 1, 1, 1, 1, 1,
0.9879287, 0.9501538, 2.010484, 1, 1, 1, 1, 1,
0.9994282, 0.3708403, 2.3389, 1, 1, 1, 1, 1,
1.000812, 0.3906258, 0.9268343, 1, 1, 1, 1, 1,
1.002046, -0.8413164, 2.688825, 1, 1, 1, 1, 1,
1.010805, -0.9263537, 2.707166, 1, 1, 1, 1, 1,
1.012933, 0.7282894, -1.128563, 1, 1, 1, 1, 1,
1.015715, -0.3382816, 2.499624, 1, 1, 1, 1, 1,
1.021071, -0.9444667, 2.252559, 1, 1, 1, 1, 1,
1.023433, 0.2707073, 0.402916, 1, 1, 1, 1, 1,
1.024702, -0.3904217, 0.7246214, 1, 1, 1, 1, 1,
1.031659, -0.7865173, 0.15643, 0, 0, 1, 1, 1,
1.031931, 0.3101476, 1.403337, 1, 0, 0, 1, 1,
1.052155, -0.4361117, 3.257837, 1, 0, 0, 1, 1,
1.057348, 1.195101, 0.677632, 1, 0, 0, 1, 1,
1.060701, 0.1240468, 1.828296, 1, 0, 0, 1, 1,
1.06186, 1.989567, 2.182873, 1, 0, 0, 1, 1,
1.063869, 0.7638147, 2.04849, 0, 0, 0, 1, 1,
1.063947, 0.4430803, 1.879603, 0, 0, 0, 1, 1,
1.063962, -0.4534876, 1.718447, 0, 0, 0, 1, 1,
1.068805, -0.2539543, -0.4508272, 0, 0, 0, 1, 1,
1.07224, -1.168652, 2.775925, 0, 0, 0, 1, 1,
1.082024, -0.548534, 2.795839, 0, 0, 0, 1, 1,
1.082547, -0.8710515, 3.451124, 0, 0, 0, 1, 1,
1.085523, -1.259897, 3.240504, 1, 1, 1, 1, 1,
1.086637, 2.448649, 1.23906, 1, 1, 1, 1, 1,
1.096153, -0.2728728, 1.024891, 1, 1, 1, 1, 1,
1.099679, 0.660841, 2.167789, 1, 1, 1, 1, 1,
1.100744, 0.7880294, 0.7771401, 1, 1, 1, 1, 1,
1.10148, -0.8722238, 2.991239, 1, 1, 1, 1, 1,
1.108245, -1.7307, 2.291458, 1, 1, 1, 1, 1,
1.108249, 0.214712, 2.113961, 1, 1, 1, 1, 1,
1.112107, -0.7279983, 0.8715351, 1, 1, 1, 1, 1,
1.119312, 2.46027, -1.941237, 1, 1, 1, 1, 1,
1.123617, -1.250471, 0.6642218, 1, 1, 1, 1, 1,
1.124114, 0.8373853, -0.1896818, 1, 1, 1, 1, 1,
1.129202, -0.3312679, 2.508209, 1, 1, 1, 1, 1,
1.138164, -1.377655, 2.476922, 1, 1, 1, 1, 1,
1.13847, -0.376855, 1.942603, 1, 1, 1, 1, 1,
1.151957, -0.6512383, 1.7943, 0, 0, 1, 1, 1,
1.152197, 0.5509264, 0.3340516, 1, 0, 0, 1, 1,
1.153451, -0.6045731, 2.217395, 1, 0, 0, 1, 1,
1.163831, 2.267349, 0.126158, 1, 0, 0, 1, 1,
1.167954, 0.6064492, 1.712945, 1, 0, 0, 1, 1,
1.169697, 1.212481, 1.612438, 1, 0, 0, 1, 1,
1.174843, -1.083236, 2.474779, 0, 0, 0, 1, 1,
1.176862, -1.441996, 3.132627, 0, 0, 0, 1, 1,
1.177783, -0.5508813, 2.321227, 0, 0, 0, 1, 1,
1.185061, 0.1427139, 1.768048, 0, 0, 0, 1, 1,
1.185864, 1.432625, 0.1606282, 0, 0, 0, 1, 1,
1.19005, 2.550484, 0.9339812, 0, 0, 0, 1, 1,
1.197432, -0.08688421, 1.180051, 0, 0, 0, 1, 1,
1.211708, -1.17054, 2.400909, 1, 1, 1, 1, 1,
1.21647, -1.788644, 2.609542, 1, 1, 1, 1, 1,
1.219343, -0.001870996, 0.3764268, 1, 1, 1, 1, 1,
1.219689, 0.7850348, 0.5465316, 1, 1, 1, 1, 1,
1.227477, -1.627167, 3.827229, 1, 1, 1, 1, 1,
1.22772, 0.5823179, 2.260587, 1, 1, 1, 1, 1,
1.238097, 0.2415741, 2.225069, 1, 1, 1, 1, 1,
1.240012, 1.559374, 0.03054995, 1, 1, 1, 1, 1,
1.244129, 0.4420137, 0.7478428, 1, 1, 1, 1, 1,
1.245894, 0.00660424, 2.438225, 1, 1, 1, 1, 1,
1.263269, 1.119338, 1.261488, 1, 1, 1, 1, 1,
1.269035, 0.1265296, 1.955915, 1, 1, 1, 1, 1,
1.273433, -0.6648096, 2.489882, 1, 1, 1, 1, 1,
1.274398, 1.246538, 1.879822, 1, 1, 1, 1, 1,
1.275135, 0.9914986, -0.2565243, 1, 1, 1, 1, 1,
1.276094, 0.09272212, 2.266789, 0, 0, 1, 1, 1,
1.285518, -1.1489, 2.619617, 1, 0, 0, 1, 1,
1.288478, 0.3483015, 2.090844, 1, 0, 0, 1, 1,
1.289739, -0.1194223, 2.148207, 1, 0, 0, 1, 1,
1.296146, 0.7688221, 0.7277133, 1, 0, 0, 1, 1,
1.298808, 0.8794804, 2.379945, 1, 0, 0, 1, 1,
1.299476, -0.962777, 2.01771, 0, 0, 0, 1, 1,
1.314813, 0.1869939, 1.366576, 0, 0, 0, 1, 1,
1.31941, -0.7404123, 0.7101416, 0, 0, 0, 1, 1,
1.326388, -1.002712, 2.323594, 0, 0, 0, 1, 1,
1.332814, 1.613722, -0.2410578, 0, 0, 0, 1, 1,
1.336084, 0.9760199, 0.7702017, 0, 0, 0, 1, 1,
1.337787, -0.5051198, 0.9940085, 0, 0, 0, 1, 1,
1.341331, -0.179828, 1.90192, 1, 1, 1, 1, 1,
1.348103, -1.75281, 0.8578445, 1, 1, 1, 1, 1,
1.352431, 0.8540614, 3.010226, 1, 1, 1, 1, 1,
1.363998, 0.7863867, 2.313068, 1, 1, 1, 1, 1,
1.371907, -0.4290134, 1.626894, 1, 1, 1, 1, 1,
1.374471, -0.6481093, 2.096381, 1, 1, 1, 1, 1,
1.376876, 0.109487, 1.591476, 1, 1, 1, 1, 1,
1.379046, 2.467359, 1.424159, 1, 1, 1, 1, 1,
1.39854, 0.5359183, 0.8341885, 1, 1, 1, 1, 1,
1.409405, -0.2581509, 3.137986, 1, 1, 1, 1, 1,
1.411842, 0.8338736, -0.07804042, 1, 1, 1, 1, 1,
1.412892, 1.763155, 0.8072328, 1, 1, 1, 1, 1,
1.416975, -0.02258818, -1.238412, 1, 1, 1, 1, 1,
1.425215, -0.4463016, 0.3759651, 1, 1, 1, 1, 1,
1.427188, 0.1092442, 2.730967, 1, 1, 1, 1, 1,
1.436484, 0.4013636, 0.6439295, 0, 0, 1, 1, 1,
1.436783, 0.4107419, 0.7434346, 1, 0, 0, 1, 1,
1.443552, -0.4667525, 1.359723, 1, 0, 0, 1, 1,
1.466179, 1.125648, 1.457482, 1, 0, 0, 1, 1,
1.472709, -1.813739, 2.429525, 1, 0, 0, 1, 1,
1.47538, 1.10399, 1.685037, 1, 0, 0, 1, 1,
1.4775, -0.9995925, 1.231791, 0, 0, 0, 1, 1,
1.480011, 0.3959706, 0.4982798, 0, 0, 0, 1, 1,
1.491359, 0.4767731, 1.105034, 0, 0, 0, 1, 1,
1.493477, 0.279853, 2.085893, 0, 0, 0, 1, 1,
1.506594, 0.06039194, 0.6910782, 0, 0, 0, 1, 1,
1.511797, -0.8158178, 3.193946, 0, 0, 0, 1, 1,
1.520337, -0.2555208, 3.34725, 0, 0, 0, 1, 1,
1.530511, -2.538097, 4.292337, 1, 1, 1, 1, 1,
1.550985, 1.196008, -0.4320118, 1, 1, 1, 1, 1,
1.551574, -1.374277, 0.9409555, 1, 1, 1, 1, 1,
1.56928, -0.2194628, 0.9491423, 1, 1, 1, 1, 1,
1.57511, -0.35714, 0.8982983, 1, 1, 1, 1, 1,
1.576343, -1.807189, 2.088905, 1, 1, 1, 1, 1,
1.577225, -1.305895, 2.712197, 1, 1, 1, 1, 1,
1.583346, -1.801251, 2.599149, 1, 1, 1, 1, 1,
1.585026, -1.235462, 1.196261, 1, 1, 1, 1, 1,
1.59391, 0.3791851, 2.510111, 1, 1, 1, 1, 1,
1.612986, 1.383398, 0.3139881, 1, 1, 1, 1, 1,
1.628941, -0.7011679, 1.536539, 1, 1, 1, 1, 1,
1.644996, 1.349074, 1.912341, 1, 1, 1, 1, 1,
1.647869, -0.1017758, 1.548794, 1, 1, 1, 1, 1,
1.650824, 1.543185, 0.7915819, 1, 1, 1, 1, 1,
1.658605, -0.6908318, 1.352573, 0, 0, 1, 1, 1,
1.66447, 0.119367, 2.619064, 1, 0, 0, 1, 1,
1.671449, 1.075788, -0.2436678, 1, 0, 0, 1, 1,
1.696333, 1.180847, 0.9784585, 1, 0, 0, 1, 1,
1.736867, -0.07276201, 2.079036, 1, 0, 0, 1, 1,
1.763843, 2.597812, 0.05717292, 1, 0, 0, 1, 1,
1.772815, 0.5316085, 2.867869, 0, 0, 0, 1, 1,
1.794274, -0.4259581, 0.652328, 0, 0, 0, 1, 1,
1.797701, -0.3806329, 1.069621, 0, 0, 0, 1, 1,
1.804366, -1.355982, 1.494104, 0, 0, 0, 1, 1,
1.812149, -0.6664745, 3.292249, 0, 0, 0, 1, 1,
1.81335, 0.9029654, 1.81571, 0, 0, 0, 1, 1,
1.818377, 0.09195277, 3.006637, 0, 0, 0, 1, 1,
1.833794, -0.7785142, 1.829958, 1, 1, 1, 1, 1,
1.869579, -0.3899315, 0.7285798, 1, 1, 1, 1, 1,
1.879436, 0.09611122, 0.5108944, 1, 1, 1, 1, 1,
1.885239, -1.194168, 2.333079, 1, 1, 1, 1, 1,
1.908248, 0.8503219, 2.399346, 1, 1, 1, 1, 1,
1.910501, 0.4942782, 1.430769, 1, 1, 1, 1, 1,
1.925767, 0.3917572, 1.024235, 1, 1, 1, 1, 1,
1.957842, 0.7777384, -0.501521, 1, 1, 1, 1, 1,
1.965697, -0.7526572, 3.584121, 1, 1, 1, 1, 1,
1.972571, -2.732516, 1.444271, 1, 1, 1, 1, 1,
1.995158, -0.3198656, 0.8493947, 1, 1, 1, 1, 1,
2.011526, 0.4543555, 2.686783, 1, 1, 1, 1, 1,
2.020847, -0.3375461, -0.00405804, 1, 1, 1, 1, 1,
2.028291, 1.457609, 0.8355747, 1, 1, 1, 1, 1,
2.058181, -1.803267, 2.451467, 1, 1, 1, 1, 1,
2.104325, 0.5939406, 1.236179, 0, 0, 1, 1, 1,
2.108635, 0.01309237, 2.859216, 1, 0, 0, 1, 1,
2.14887, 0.9085327, 1.945841, 1, 0, 0, 1, 1,
2.15895, 0.5306976, 1.726586, 1, 0, 0, 1, 1,
2.193113, 0.5312031, 1.397919, 1, 0, 0, 1, 1,
2.197718, -0.006970862, 1.920058, 1, 0, 0, 1, 1,
2.227531, -1.909364, 1.478294, 0, 0, 0, 1, 1,
2.321185, 1.447905, 3.579362, 0, 0, 0, 1, 1,
2.413539, 0.7304786, 3.219048, 0, 0, 0, 1, 1,
2.465197, -0.1235503, 1.599918, 0, 0, 0, 1, 1,
2.483868, 0.5163649, 2.513789, 0, 0, 0, 1, 1,
2.49633, -0.04729157, 0.1693124, 0, 0, 0, 1, 1,
2.508487, 0.3561995, 1.72522, 0, 0, 0, 1, 1,
2.519485, -0.5291051, 1.582057, 1, 1, 1, 1, 1,
2.529873, -0.1949975, 0.829493, 1, 1, 1, 1, 1,
2.541746, 0.3096088, 1.032142, 1, 1, 1, 1, 1,
2.613346, -1.004187, 2.173887, 1, 1, 1, 1, 1,
2.65335, 0.7707725, 0.6536594, 1, 1, 1, 1, 1,
2.827854, -0.2279136, 1.951866, 1, 1, 1, 1, 1,
3.153245, -0.8494784, 1.517428, 1, 1, 1, 1, 1
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
var radius = 9.599267;
var distance = 33.71702;
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
mvMatrix.translate( -0.0870527, -0.193344, 0.2381656 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71702);
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
