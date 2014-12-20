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
-3.827831, -0.475409, -2.138248, 1, 0, 0, 1,
-3.244529, 0.1129202, -1.913738, 1, 0.007843138, 0, 1,
-2.745687, 1.065511, -1.411273, 1, 0.01176471, 0, 1,
-2.631758, -0.2661236, -4.216662, 1, 0.01960784, 0, 1,
-2.564965, 1.905136, -2.275486, 1, 0.02352941, 0, 1,
-2.525165, 0.5661619, -1.296536, 1, 0.03137255, 0, 1,
-2.49916, 2.052184, -2.096073, 1, 0.03529412, 0, 1,
-2.489043, -0.6806458, -2.200608, 1, 0.04313726, 0, 1,
-2.473609, -1.015664, -1.525757, 1, 0.04705882, 0, 1,
-2.386366, -0.8390867, -0.0951867, 1, 0.05490196, 0, 1,
-2.369722, 0.1589261, -0.5552138, 1, 0.05882353, 0, 1,
-2.301406, 1.207987, -1.663829, 1, 0.06666667, 0, 1,
-2.300474, -0.9949516, -0.3024848, 1, 0.07058824, 0, 1,
-2.294388, 0.554063, -2.23932, 1, 0.07843138, 0, 1,
-2.261693, 0.5469557, -4.086737, 1, 0.08235294, 0, 1,
-2.234652, 0.03014967, -2.088471, 1, 0.09019608, 0, 1,
-2.174129, -1.437195, -4.211042, 1, 0.09411765, 0, 1,
-2.154547, -1.74649, -3.563828, 1, 0.1019608, 0, 1,
-2.122846, -1.097372, -2.588479, 1, 0.1098039, 0, 1,
-2.099999, 0.04996492, -2.021049, 1, 0.1137255, 0, 1,
-2.091646, -0.9418252, -0.7853907, 1, 0.1215686, 0, 1,
-2.030247, 0.9468222, 0.3596345, 1, 0.1254902, 0, 1,
-1.95682, -0.6202952, -1.624028, 1, 0.1333333, 0, 1,
-1.951417, -0.6799765, -2.133917, 1, 0.1372549, 0, 1,
-1.897158, 0.3736573, -1.820493, 1, 0.145098, 0, 1,
-1.884172, 2.031439, 0.3646559, 1, 0.1490196, 0, 1,
-1.8696, 0.2230107, -0.765458, 1, 0.1568628, 0, 1,
-1.868058, -0.196948, -1.803781, 1, 0.1607843, 0, 1,
-1.858421, 0.05793333, -0.6646703, 1, 0.1686275, 0, 1,
-1.856365, -1.089616, -0.8266304, 1, 0.172549, 0, 1,
-1.83207, -1.276369, -1.908508, 1, 0.1803922, 0, 1,
-1.804731, -1.494967, -1.825156, 1, 0.1843137, 0, 1,
-1.804423, -0.04963358, -0.6815399, 1, 0.1921569, 0, 1,
-1.783995, 1.060709, 0.3174796, 1, 0.1960784, 0, 1,
-1.779495, -0.4893503, -1.277756, 1, 0.2039216, 0, 1,
-1.776915, 0.9925858, 0.3300593, 1, 0.2117647, 0, 1,
-1.77338, -1.798733, -2.921956, 1, 0.2156863, 0, 1,
-1.762595, 0.8852521, -1.67883, 1, 0.2235294, 0, 1,
-1.758482, -0.3559386, -2.116161, 1, 0.227451, 0, 1,
-1.747412, 1.366592, 0.7101178, 1, 0.2352941, 0, 1,
-1.727665, 0.4151489, -1.802326, 1, 0.2392157, 0, 1,
-1.721741, -0.641359, -0.7643414, 1, 0.2470588, 0, 1,
-1.715587, 0.5961016, -0.5239538, 1, 0.2509804, 0, 1,
-1.707968, 0.9536296, -1.81258, 1, 0.2588235, 0, 1,
-1.705201, 0.9821593, -1.387217, 1, 0.2627451, 0, 1,
-1.701426, 0.2933645, 0.5353855, 1, 0.2705882, 0, 1,
-1.684047, -1.31621, -1.431968, 1, 0.2745098, 0, 1,
-1.676167, -0.3715103, -2.421252, 1, 0.282353, 0, 1,
-1.675735, -0.206181, -1.543621, 1, 0.2862745, 0, 1,
-1.671066, -0.3921019, -0.7255419, 1, 0.2941177, 0, 1,
-1.666862, -1.492111, -2.50855, 1, 0.3019608, 0, 1,
-1.658442, 1.092992, -1.2721, 1, 0.3058824, 0, 1,
-1.649336, 0.4786499, -0.7723892, 1, 0.3137255, 0, 1,
-1.643815, -0.2972592, -0.628794, 1, 0.3176471, 0, 1,
-1.59814, -0.1619575, -2.432108, 1, 0.3254902, 0, 1,
-1.590395, -1.361767, -2.337319, 1, 0.3294118, 0, 1,
-1.586163, 0.2486904, -2.598984, 1, 0.3372549, 0, 1,
-1.584453, -0.9548595, -1.380589, 1, 0.3411765, 0, 1,
-1.5828, -0.275081, -0.4167262, 1, 0.3490196, 0, 1,
-1.58143, 0.3434147, -0.3706291, 1, 0.3529412, 0, 1,
-1.577535, -1.957296, -2.66206, 1, 0.3607843, 0, 1,
-1.572326, 0.4911379, -0.938664, 1, 0.3647059, 0, 1,
-1.546936, 0.1088246, -1.502896, 1, 0.372549, 0, 1,
-1.541215, -2.172874, -3.465459, 1, 0.3764706, 0, 1,
-1.533612, -0.7693055, -2.954678, 1, 0.3843137, 0, 1,
-1.52881, -0.7558476, -0.5975703, 1, 0.3882353, 0, 1,
-1.475452, -0.8435538, -2.531872, 1, 0.3960784, 0, 1,
-1.469455, -0.933049, -3.25473, 1, 0.4039216, 0, 1,
-1.462226, -0.5963467, -0.2964982, 1, 0.4078431, 0, 1,
-1.446749, 0.4601266, -2.300747, 1, 0.4156863, 0, 1,
-1.434664, -1.219854, -3.150329, 1, 0.4196078, 0, 1,
-1.434004, -0.4914029, -3.31997, 1, 0.427451, 0, 1,
-1.422602, -0.01158812, -1.310063, 1, 0.4313726, 0, 1,
-1.422536, -0.7344981, -1.029998, 1, 0.4392157, 0, 1,
-1.415874, 1.869462, -1.180239, 1, 0.4431373, 0, 1,
-1.410671, 1.315812, -0.7707266, 1, 0.4509804, 0, 1,
-1.410035, -0.4035359, -2.231612, 1, 0.454902, 0, 1,
-1.408322, -0.6129233, -0.2457718, 1, 0.4627451, 0, 1,
-1.392562, -0.4549031, 0.3105521, 1, 0.4666667, 0, 1,
-1.371502, -0.54669, -0.4689524, 1, 0.4745098, 0, 1,
-1.37038, 0.2747064, -0.1251466, 1, 0.4784314, 0, 1,
-1.367871, -1.195163, -1.96268, 1, 0.4862745, 0, 1,
-1.363903, -1.147816, -0.798922, 1, 0.4901961, 0, 1,
-1.362203, 0.8941192, 0.3558468, 1, 0.4980392, 0, 1,
-1.357245, 0.4557049, -3.010425, 1, 0.5058824, 0, 1,
-1.34324, -1.31397, -3.219168, 1, 0.509804, 0, 1,
-1.323153, 0.9156165, -0.8671995, 1, 0.5176471, 0, 1,
-1.301982, -1.61911, -2.757612, 1, 0.5215687, 0, 1,
-1.295745, -1.839819, -1.591799, 1, 0.5294118, 0, 1,
-1.287438, -0.3692668, -2.461736, 1, 0.5333334, 0, 1,
-1.285877, 0.1457718, -1.715384, 1, 0.5411765, 0, 1,
-1.284478, 0.108511, -0.8698288, 1, 0.5450981, 0, 1,
-1.277952, -0.7767369, -1.669184, 1, 0.5529412, 0, 1,
-1.270893, -1.479421, -2.517532, 1, 0.5568628, 0, 1,
-1.263923, 0.9636011, -1.984797, 1, 0.5647059, 0, 1,
-1.26278, -0.2069861, -1.117678, 1, 0.5686275, 0, 1,
-1.258301, -0.1170137, -1.836024, 1, 0.5764706, 0, 1,
-1.244717, 0.3279519, 0.8362322, 1, 0.5803922, 0, 1,
-1.236141, -1.240991, -3.319475, 1, 0.5882353, 0, 1,
-1.229755, 0.5350437, -2.037168, 1, 0.5921569, 0, 1,
-1.21988, -2.35786, -1.602951, 1, 0.6, 0, 1,
-1.219096, 0.3841576, -0.4870713, 1, 0.6078432, 0, 1,
-1.216828, 0.5288551, -0.3654928, 1, 0.6117647, 0, 1,
-1.215107, 0.2524889, -0.5044104, 1, 0.6196079, 0, 1,
-1.211335, -0.3365167, -1.48401, 1, 0.6235294, 0, 1,
-1.21045, 0.8593253, -1.75513, 1, 0.6313726, 0, 1,
-1.205975, -1.376583, -2.191169, 1, 0.6352941, 0, 1,
-1.199358, 0.1384336, -0.3856434, 1, 0.6431373, 0, 1,
-1.195575, 1.089249, -1.366727, 1, 0.6470588, 0, 1,
-1.189527, 0.5841125, -1.347089, 1, 0.654902, 0, 1,
-1.186008, 1.010209, 1.246101, 1, 0.6588235, 0, 1,
-1.18237, 0.1302077, 0.06853313, 1, 0.6666667, 0, 1,
-1.182195, 0.5887973, 0.2800296, 1, 0.6705883, 0, 1,
-1.168799, 0.3727292, -2.041128, 1, 0.6784314, 0, 1,
-1.168502, -0.2526616, -2.866672, 1, 0.682353, 0, 1,
-1.167656, -1.228623, -2.383685, 1, 0.6901961, 0, 1,
-1.161448, 0.1925603, -1.154753, 1, 0.6941177, 0, 1,
-1.160988, -0.7266616, -0.487543, 1, 0.7019608, 0, 1,
-1.156818, 0.4700042, -2.473602, 1, 0.7098039, 0, 1,
-1.153556, -1.263121, -1.874928, 1, 0.7137255, 0, 1,
-1.153091, -0.5342203, -2.10432, 1, 0.7215686, 0, 1,
-1.147712, 2.141867, -1.935985, 1, 0.7254902, 0, 1,
-1.147331, 0.2651485, -1.054364, 1, 0.7333333, 0, 1,
-1.145193, 0.9632786, -1.783312, 1, 0.7372549, 0, 1,
-1.145088, 0.1213286, 0.01669695, 1, 0.7450981, 0, 1,
-1.125866, 1.035823, 0.4087731, 1, 0.7490196, 0, 1,
-1.123053, 0.1050734, -3.216754, 1, 0.7568628, 0, 1,
-1.117804, -0.2063187, -1.778921, 1, 0.7607843, 0, 1,
-1.114263, 1.92739, 0.179887, 1, 0.7686275, 0, 1,
-1.113242, -0.08957903, -0.3162451, 1, 0.772549, 0, 1,
-1.108454, -0.8103384, -2.374649, 1, 0.7803922, 0, 1,
-1.107477, 0.5959231, -0.8110956, 1, 0.7843137, 0, 1,
-1.105107, 0.5711055, -2.00848, 1, 0.7921569, 0, 1,
-1.095218, -0.4039768, -1.108367, 1, 0.7960784, 0, 1,
-1.093224, -0.6571623, -3.083322, 1, 0.8039216, 0, 1,
-1.078818, 0.8274406, -2.763316, 1, 0.8117647, 0, 1,
-1.074247, 0.3639081, -2.153818, 1, 0.8156863, 0, 1,
-1.072745, 0.09925098, 0.3765826, 1, 0.8235294, 0, 1,
-1.068729, -1.674146, -4.659644, 1, 0.827451, 0, 1,
-1.068018, -1.356181, -4.483368, 1, 0.8352941, 0, 1,
-1.06732, -0.03596844, -1.570813, 1, 0.8392157, 0, 1,
-1.058609, -0.9404797, -2.429964, 1, 0.8470588, 0, 1,
-1.057757, 1.678147, -1.081762, 1, 0.8509804, 0, 1,
-1.056761, 0.006827187, -0.8322808, 1, 0.8588235, 0, 1,
-1.050139, -0.1264763, -1.442438, 1, 0.8627451, 0, 1,
-1.049439, 1.87818, -0.9806046, 1, 0.8705882, 0, 1,
-1.049134, -0.5565341, -1.741367, 1, 0.8745098, 0, 1,
-1.044664, 0.2396333, -1.395385, 1, 0.8823529, 0, 1,
-1.043515, -0.1465566, -1.886363, 1, 0.8862745, 0, 1,
-1.041797, 0.7864016, -0.8577811, 1, 0.8941177, 0, 1,
-1.040415, 0.8909989, -1.062118, 1, 0.8980392, 0, 1,
-1.038247, 0.5166209, -1.127503, 1, 0.9058824, 0, 1,
-1.035344, 0.03839945, -1.088456, 1, 0.9137255, 0, 1,
-1.032452, -0.24399, -1.950672, 1, 0.9176471, 0, 1,
-1.029647, -0.3833635, -4.141838, 1, 0.9254902, 0, 1,
-1.028543, 1.250983, -0.3845416, 1, 0.9294118, 0, 1,
-1.015855, -1.208054, -2.094705, 1, 0.9372549, 0, 1,
-1.006918, 1.724765, -0.503983, 1, 0.9411765, 0, 1,
-1.004132, -0.1249794, -1.080249, 1, 0.9490196, 0, 1,
-1.002548, -0.2813205, -0.6405978, 1, 0.9529412, 0, 1,
-0.9964812, 1.190992, 0.4085793, 1, 0.9607843, 0, 1,
-0.9926967, 0.687039, -1.74084, 1, 0.9647059, 0, 1,
-0.9912624, -0.5620285, -0.8554324, 1, 0.972549, 0, 1,
-0.987841, -1.193478, -3.301558, 1, 0.9764706, 0, 1,
-0.9855555, 1.167171, -1.871115, 1, 0.9843137, 0, 1,
-0.9800358, 2.257555, -1.265272, 1, 0.9882353, 0, 1,
-0.9791313, 0.02864753, -1.413216, 1, 0.9960784, 0, 1,
-0.9733101, -0.6714844, -3.811133, 0.9960784, 1, 0, 1,
-0.9725037, -0.06169613, -1.514936, 0.9921569, 1, 0, 1,
-0.9724601, 0.1284276, 0.02907198, 0.9843137, 1, 0, 1,
-0.9615299, 1.114254, -1.563519, 0.9803922, 1, 0, 1,
-0.9554437, 0.7162648, -0.1529869, 0.972549, 1, 0, 1,
-0.9509906, -0.3860033, -3.224259, 0.9686275, 1, 0, 1,
-0.9442803, 0.01668711, -2.342567, 0.9607843, 1, 0, 1,
-0.9435773, 0.4826068, -0.895267, 0.9568627, 1, 0, 1,
-0.9422728, 1.374236, -0.1675525, 0.9490196, 1, 0, 1,
-0.9302388, 0.5250981, 0.2641102, 0.945098, 1, 0, 1,
-0.929011, 1.79877, 0.708808, 0.9372549, 1, 0, 1,
-0.9253401, 1.881596, -1.220657, 0.9333333, 1, 0, 1,
-0.9167058, 0.3118324, -1.69708, 0.9254902, 1, 0, 1,
-0.9141226, 0.4670815, 0.01067596, 0.9215686, 1, 0, 1,
-0.9099826, 0.4388149, -0.3675897, 0.9137255, 1, 0, 1,
-0.9088525, -1.150425, -1.784578, 0.9098039, 1, 0, 1,
-0.9045678, 1.016119, 0.8010964, 0.9019608, 1, 0, 1,
-0.8921227, 1.78762, -0.039928, 0.8941177, 1, 0, 1,
-0.8911988, -1.428367, -1.147749, 0.8901961, 1, 0, 1,
-0.8911181, 0.9702014, -2.675287, 0.8823529, 1, 0, 1,
-0.8856116, -0.1604663, -0.9161109, 0.8784314, 1, 0, 1,
-0.8790461, 1.360887, -0.9956883, 0.8705882, 1, 0, 1,
-0.8786853, 0.3655619, -0.9154182, 0.8666667, 1, 0, 1,
-0.856956, 0.3655364, 0.4239402, 0.8588235, 1, 0, 1,
-0.8552526, 2.660998, -1.544157, 0.854902, 1, 0, 1,
-0.8481571, -0.1446499, -3.276094, 0.8470588, 1, 0, 1,
-0.8393384, 0.1364362, -1.6014, 0.8431373, 1, 0, 1,
-0.8334547, 0.812267, -0.3283745, 0.8352941, 1, 0, 1,
-0.8313503, -1.566377, -2.748074, 0.8313726, 1, 0, 1,
-0.8308163, 1.178422, -0.5725071, 0.8235294, 1, 0, 1,
-0.8286776, 0.1149462, -0.5615049, 0.8196079, 1, 0, 1,
-0.8227457, 1.064977, 0.4302925, 0.8117647, 1, 0, 1,
-0.8226563, 0.2730045, -1.188723, 0.8078431, 1, 0, 1,
-0.8213016, 0.04015945, 0.2610081, 0.8, 1, 0, 1,
-0.8181144, 0.8971918, -0.6764621, 0.7921569, 1, 0, 1,
-0.8128186, -0.05228639, -2.027917, 0.7882353, 1, 0, 1,
-0.812608, 1.456833, 0.7978975, 0.7803922, 1, 0, 1,
-0.8124322, 2.300827, 0.5062708, 0.7764706, 1, 0, 1,
-0.8105687, 0.6500597, 0.3673622, 0.7686275, 1, 0, 1,
-0.8088158, 2.320675, 0.742434, 0.7647059, 1, 0, 1,
-0.8031216, 1.624843, 0.4144454, 0.7568628, 1, 0, 1,
-0.8029643, -0.6128814, -1.152201, 0.7529412, 1, 0, 1,
-0.8007241, 1.198208, -0.5868304, 0.7450981, 1, 0, 1,
-0.8006234, 0.1457348, -1.482608, 0.7411765, 1, 0, 1,
-0.7938172, -0.559895, -0.6654246, 0.7333333, 1, 0, 1,
-0.7915198, 0.6357159, -0.5710512, 0.7294118, 1, 0, 1,
-0.7903317, 1.217088, -2.065278, 0.7215686, 1, 0, 1,
-0.7744087, -0.4106609, -2.771587, 0.7176471, 1, 0, 1,
-0.7632354, 2.336096, -1.686263, 0.7098039, 1, 0, 1,
-0.7469577, 0.4294849, 0.7822593, 0.7058824, 1, 0, 1,
-0.7403266, 0.120249, 0.3980007, 0.6980392, 1, 0, 1,
-0.7400023, -0.3452934, -0.4856813, 0.6901961, 1, 0, 1,
-0.7391869, -0.08375753, 0.02994058, 0.6862745, 1, 0, 1,
-0.7362247, 0.6677555, -0.7654291, 0.6784314, 1, 0, 1,
-0.7350799, -0.5531949, -3.295814, 0.6745098, 1, 0, 1,
-0.7333635, -0.7132013, -1.803075, 0.6666667, 1, 0, 1,
-0.7330813, -0.634851, -4.380095, 0.6627451, 1, 0, 1,
-0.731864, 1.351255, -0.5587279, 0.654902, 1, 0, 1,
-0.7292032, 0.4729495, -0.9878495, 0.6509804, 1, 0, 1,
-0.7291316, 0.3741658, -0.9655334, 0.6431373, 1, 0, 1,
-0.7282582, -1.954517, -3.414358, 0.6392157, 1, 0, 1,
-0.7272723, -0.9478176, -2.093701, 0.6313726, 1, 0, 1,
-0.7243913, -0.2412834, -1.114114, 0.627451, 1, 0, 1,
-0.7243363, -1.143048, -2.866185, 0.6196079, 1, 0, 1,
-0.7232164, -0.9743232, -4.335592, 0.6156863, 1, 0, 1,
-0.7172641, -0.3344635, -0.9768969, 0.6078432, 1, 0, 1,
-0.7157592, 0.1002191, -2.232599, 0.6039216, 1, 0, 1,
-0.7140071, -0.7208327, -3.396043, 0.5960785, 1, 0, 1,
-0.7128145, -0.3040474, -3.508448, 0.5882353, 1, 0, 1,
-0.6974537, -1.503033, -2.718653, 0.5843138, 1, 0, 1,
-0.6969451, 2.181343, 0.2690321, 0.5764706, 1, 0, 1,
-0.6963509, 0.7089626, 0.8276553, 0.572549, 1, 0, 1,
-0.6935026, 0.7849504, 0.8247576, 0.5647059, 1, 0, 1,
-0.6854024, 0.4753991, 1.011534, 0.5607843, 1, 0, 1,
-0.6850498, -0.4850149, -2.745093, 0.5529412, 1, 0, 1,
-0.6820313, -0.1311669, -1.828179, 0.5490196, 1, 0, 1,
-0.6741064, -0.4616749, -2.092368, 0.5411765, 1, 0, 1,
-0.672753, 0.9805678, 0.02138664, 0.5372549, 1, 0, 1,
-0.6687617, 0.1033949, -0.3953753, 0.5294118, 1, 0, 1,
-0.6671194, -1.741471, -2.75234, 0.5254902, 1, 0, 1,
-0.6668183, -1.707362, -2.058002, 0.5176471, 1, 0, 1,
-0.6662217, -1.701498, -4.673814, 0.5137255, 1, 0, 1,
-0.6647869, -0.6209097, -2.831537, 0.5058824, 1, 0, 1,
-0.6620901, -0.7651006, -1.463969, 0.5019608, 1, 0, 1,
-0.6605582, -0.56699, -2.210184, 0.4941176, 1, 0, 1,
-0.6588901, 1.411056, -0.9374313, 0.4862745, 1, 0, 1,
-0.6539736, -0.812825, -2.403434, 0.4823529, 1, 0, 1,
-0.6409819, -0.2285589, -0.9883837, 0.4745098, 1, 0, 1,
-0.640208, -0.2239223, -2.58964, 0.4705882, 1, 0, 1,
-0.639025, -0.179683, -3.923528, 0.4627451, 1, 0, 1,
-0.6373217, 1.564067, -3.12631, 0.4588235, 1, 0, 1,
-0.6300027, 1.372939, -1.145361, 0.4509804, 1, 0, 1,
-0.6291118, -1.459864, -4.072429, 0.4470588, 1, 0, 1,
-0.6290179, -1.556681, -2.438143, 0.4392157, 1, 0, 1,
-0.6264693, -1.364162, -2.460071, 0.4352941, 1, 0, 1,
-0.6240451, 0.1803837, -2.183636, 0.427451, 1, 0, 1,
-0.6219656, -0.2874378, -1.899955, 0.4235294, 1, 0, 1,
-0.6139868, -0.5764608, -1.501251, 0.4156863, 1, 0, 1,
-0.6118121, 0.01868446, -2.149808, 0.4117647, 1, 0, 1,
-0.6078598, 0.2214493, -0.5502759, 0.4039216, 1, 0, 1,
-0.6054615, -0.8102808, -2.775839, 0.3960784, 1, 0, 1,
-0.6021827, 0.1177726, -0.6340362, 0.3921569, 1, 0, 1,
-0.6020705, 0.6638409, 0.2786744, 0.3843137, 1, 0, 1,
-0.600064, -0.4417173, -0.1168349, 0.3803922, 1, 0, 1,
-0.5991112, -1.010299, -1.080544, 0.372549, 1, 0, 1,
-0.5980095, -0.0893046, -2.696927, 0.3686275, 1, 0, 1,
-0.597805, -1.032304, -2.506508, 0.3607843, 1, 0, 1,
-0.5931135, 1.086469, -1.384912, 0.3568628, 1, 0, 1,
-0.5909945, -0.5140771, -1.981292, 0.3490196, 1, 0, 1,
-0.5869807, 0.6741401, -0.8565621, 0.345098, 1, 0, 1,
-0.5798674, 0.2918618, -1.029462, 0.3372549, 1, 0, 1,
-0.5797547, -0.2407048, -1.390135, 0.3333333, 1, 0, 1,
-0.5789117, -0.08783149, -1.76698, 0.3254902, 1, 0, 1,
-0.5736806, 0.8223279, -2.177576, 0.3215686, 1, 0, 1,
-0.5622041, -0.08293892, -1.203016, 0.3137255, 1, 0, 1,
-0.5592405, 1.116214, 0.5869058, 0.3098039, 1, 0, 1,
-0.5570167, -0.6170929, -4.856514, 0.3019608, 1, 0, 1,
-0.5422471, -1.219758, -4.057735, 0.2941177, 1, 0, 1,
-0.5395073, 0.3932138, -0.9773962, 0.2901961, 1, 0, 1,
-0.533082, 0.1080201, -0.9738548, 0.282353, 1, 0, 1,
-0.526472, 1.399548, -1.520636, 0.2784314, 1, 0, 1,
-0.5251576, -0.0578778, -2.036843, 0.2705882, 1, 0, 1,
-0.5224884, 1.130648, 1.320717, 0.2666667, 1, 0, 1,
-0.5192186, -1.337165, -3.460455, 0.2588235, 1, 0, 1,
-0.5160325, -0.5399589, -2.961406, 0.254902, 1, 0, 1,
-0.5095746, 0.4797786, -0.3075093, 0.2470588, 1, 0, 1,
-0.5091653, 0.3771143, -1.918923, 0.2431373, 1, 0, 1,
-0.5027422, 0.7073785, -0.3433049, 0.2352941, 1, 0, 1,
-0.500935, -1.173003, -2.892744, 0.2313726, 1, 0, 1,
-0.4998829, 0.6628075, 0.6235152, 0.2235294, 1, 0, 1,
-0.4979857, -0.01701399, -1.164661, 0.2196078, 1, 0, 1,
-0.4969788, 1.349288, 0.4356698, 0.2117647, 1, 0, 1,
-0.494645, 2.096834, -0.8259003, 0.2078431, 1, 0, 1,
-0.4941061, -0.9533858, -4.561473, 0.2, 1, 0, 1,
-0.4941031, -1.544235, -1.960787, 0.1921569, 1, 0, 1,
-0.4932288, 1.935562, 0.3374113, 0.1882353, 1, 0, 1,
-0.4890921, 1.08355, -0.1154923, 0.1803922, 1, 0, 1,
-0.4872309, -1.059086, -3.348083, 0.1764706, 1, 0, 1,
-0.4862112, 0.8489615, -0.6983715, 0.1686275, 1, 0, 1,
-0.4823383, -0.7228907, -3.511827, 0.1647059, 1, 0, 1,
-0.4819496, -0.5957888, -3.505685, 0.1568628, 1, 0, 1,
-0.481148, -0.1478866, -1.140533, 0.1529412, 1, 0, 1,
-0.4806527, 0.8123714, -0.1237823, 0.145098, 1, 0, 1,
-0.4782227, -1.424888, -3.788309, 0.1411765, 1, 0, 1,
-0.4747001, 0.6195608, -0.5997898, 0.1333333, 1, 0, 1,
-0.4705359, -1.117664, -2.096313, 0.1294118, 1, 0, 1,
-0.4685082, -0.5887412, -2.983148, 0.1215686, 1, 0, 1,
-0.466818, 1.106153, -1.733612, 0.1176471, 1, 0, 1,
-0.4645353, -2.078122, -2.449617, 0.1098039, 1, 0, 1,
-0.4641186, -0.5769758, -1.553164, 0.1058824, 1, 0, 1,
-0.4634645, -1.086436, -2.914118, 0.09803922, 1, 0, 1,
-0.46235, 1.217312, 0.1043013, 0.09019608, 1, 0, 1,
-0.4586701, -0.2394392, -2.723413, 0.08627451, 1, 0, 1,
-0.4553148, -0.6428337, -0.8692751, 0.07843138, 1, 0, 1,
-0.4537334, -1.682009, -2.847961, 0.07450981, 1, 0, 1,
-0.4460644, -2.697011, -2.227318, 0.06666667, 1, 0, 1,
-0.4425945, -0.8288741, -0.7730823, 0.0627451, 1, 0, 1,
-0.4422866, -0.8291125, -3.614933, 0.05490196, 1, 0, 1,
-0.4325934, 1.493897, -0.2193099, 0.05098039, 1, 0, 1,
-0.4304037, -1.072648, -3.012984, 0.04313726, 1, 0, 1,
-0.4254417, 1.075606, 2.028659, 0.03921569, 1, 0, 1,
-0.4239691, -0.1703697, 0.2449064, 0.03137255, 1, 0, 1,
-0.4211272, -0.574151, -3.649215, 0.02745098, 1, 0, 1,
-0.4164081, 1.261374, -0.1639139, 0.01960784, 1, 0, 1,
-0.4154316, 0.1802898, -1.996206, 0.01568628, 1, 0, 1,
-0.4137099, 1.176661, 0.06142432, 0.007843138, 1, 0, 1,
-0.4110954, 1.01024, -0.4461768, 0.003921569, 1, 0, 1,
-0.410256, 0.6152506, -1.12004, 0, 1, 0.003921569, 1,
-0.4100888, -0.07429183, -2.779844, 0, 1, 0.01176471, 1,
-0.4079992, 0.309599, 0.06972001, 0, 1, 0.01568628, 1,
-0.3998207, -0.01739497, -1.4386, 0, 1, 0.02352941, 1,
-0.3932267, 0.01001642, -0.6970815, 0, 1, 0.02745098, 1,
-0.3921331, -1.15977, -2.146353, 0, 1, 0.03529412, 1,
-0.3913946, -1.039735, -3.108112, 0, 1, 0.03921569, 1,
-0.3887498, -0.781857, -3.561186, 0, 1, 0.04705882, 1,
-0.3847428, -0.06716254, -2.229029, 0, 1, 0.05098039, 1,
-0.3839719, -1.15566, -3.20332, 0, 1, 0.05882353, 1,
-0.3833563, 0.04845225, -3.070573, 0, 1, 0.0627451, 1,
-0.3812482, -1.99876, -3.219167, 0, 1, 0.07058824, 1,
-0.3791399, 0.2044519, -2.235291, 0, 1, 0.07450981, 1,
-0.3770696, -0.2955184, -0.9057996, 0, 1, 0.08235294, 1,
-0.3737953, 0.2032094, -2.566832, 0, 1, 0.08627451, 1,
-0.3661639, 0.2366764, -1.276148, 0, 1, 0.09411765, 1,
-0.3660116, 0.4732555, -0.2107808, 0, 1, 0.1019608, 1,
-0.3616646, 0.3623571, -3.064398, 0, 1, 0.1058824, 1,
-0.3585438, 1.234324, -2.103919, 0, 1, 0.1137255, 1,
-0.3504652, -0.6351452, -3.560964, 0, 1, 0.1176471, 1,
-0.3483219, 0.6822997, -2.483997, 0, 1, 0.1254902, 1,
-0.3473313, 0.7906905, 0.4517282, 0, 1, 0.1294118, 1,
-0.3458371, 1.239248, -1.110132, 0, 1, 0.1372549, 1,
-0.3420478, -0.5879171, -3.651243, 0, 1, 0.1411765, 1,
-0.3407722, 0.6698387, -1.440345, 0, 1, 0.1490196, 1,
-0.340499, -0.7935876, -0.8969992, 0, 1, 0.1529412, 1,
-0.3374893, 0.2999744, 0.4564989, 0, 1, 0.1607843, 1,
-0.3365331, 1.277466, -0.09531462, 0, 1, 0.1647059, 1,
-0.3364863, 1.340031, 0.9691666, 0, 1, 0.172549, 1,
-0.3362616, -0.2613539, -2.820584, 0, 1, 0.1764706, 1,
-0.3326298, -1.730383, -2.179979, 0, 1, 0.1843137, 1,
-0.3319615, -0.04616047, -2.753672, 0, 1, 0.1882353, 1,
-0.3294643, 0.704726, 0.4428291, 0, 1, 0.1960784, 1,
-0.3272631, 0.7789589, -0.1998186, 0, 1, 0.2039216, 1,
-0.3256453, -1.68839, -0.7221943, 0, 1, 0.2078431, 1,
-0.3174132, 0.2324308, -2.934582, 0, 1, 0.2156863, 1,
-0.3063592, 0.01498866, -1.690386, 0, 1, 0.2196078, 1,
-0.3057583, -0.7842945, -1.348063, 0, 1, 0.227451, 1,
-0.3033946, -0.4749512, -1.707017, 0, 1, 0.2313726, 1,
-0.296687, 2.058139, -0.5056729, 0, 1, 0.2392157, 1,
-0.2928728, 1.396863, -0.6893128, 0, 1, 0.2431373, 1,
-0.2905546, -0.005582605, -1.230205, 0, 1, 0.2509804, 1,
-0.2882009, -1.236809, -2.314887, 0, 1, 0.254902, 1,
-0.2869179, -0.6802164, -3.017359, 0, 1, 0.2627451, 1,
-0.2849139, -1.121013, -3.551744, 0, 1, 0.2666667, 1,
-0.2835251, 1.404988, 0.7769405, 0, 1, 0.2745098, 1,
-0.2793029, 0.1260073, -1.557558, 0, 1, 0.2784314, 1,
-0.2766436, 0.07220501, -1.072518, 0, 1, 0.2862745, 1,
-0.2727476, 0.213682, -1.724999, 0, 1, 0.2901961, 1,
-0.2720767, -1.977253, -3.140647, 0, 1, 0.2980392, 1,
-0.2671024, -0.07229088, -1.553413, 0, 1, 0.3058824, 1,
-0.2651473, 1.003966, -0.7329613, 0, 1, 0.3098039, 1,
-0.2620308, -1.53526, -2.89441, 0, 1, 0.3176471, 1,
-0.2609389, -0.02470426, -1.170587, 0, 1, 0.3215686, 1,
-0.2586978, -1.709267, -4.64648, 0, 1, 0.3294118, 1,
-0.2561382, 1.090496, -2.037686, 0, 1, 0.3333333, 1,
-0.2517419, 0.5917175, -1.306805, 0, 1, 0.3411765, 1,
-0.2515323, 0.5320803, -0.4488221, 0, 1, 0.345098, 1,
-0.2479876, -0.741742, -2.593959, 0, 1, 0.3529412, 1,
-0.243597, -0.5022497, -2.112879, 0, 1, 0.3568628, 1,
-0.238801, -0.541586, -2.807379, 0, 1, 0.3647059, 1,
-0.2379928, 0.8694155, 1.589357, 0, 1, 0.3686275, 1,
-0.2372125, -0.03649545, -2.364518, 0, 1, 0.3764706, 1,
-0.2366776, -1.08008, -1.45821, 0, 1, 0.3803922, 1,
-0.2341145, -1.208895, -4.696345, 0, 1, 0.3882353, 1,
-0.2336285, 0.3774885, 1.020878, 0, 1, 0.3921569, 1,
-0.232399, 1.795659, -0.4177722, 0, 1, 0.4, 1,
-0.2267409, -1.328763, -2.171932, 0, 1, 0.4078431, 1,
-0.2257886, 0.9992025, -1.892308, 0, 1, 0.4117647, 1,
-0.2220105, 1.444224, -0.5583353, 0, 1, 0.4196078, 1,
-0.2215329, 0.5948244, -1.134624, 0, 1, 0.4235294, 1,
-0.2208548, 0.0907692, 0.05941932, 0, 1, 0.4313726, 1,
-0.2181001, -1.043355, -5.592232, 0, 1, 0.4352941, 1,
-0.2138043, -0.5685602, -3.025325, 0, 1, 0.4431373, 1,
-0.2136447, -0.1123756, -0.411018, 0, 1, 0.4470588, 1,
-0.2120049, -1.320306, -2.388671, 0, 1, 0.454902, 1,
-0.2118062, 0.4726571, -2.567077, 0, 1, 0.4588235, 1,
-0.2084261, 0.490216, 0.7685921, 0, 1, 0.4666667, 1,
-0.2057444, 0.8077426, -0.6246092, 0, 1, 0.4705882, 1,
-0.2034657, -0.394252, -1.187838, 0, 1, 0.4784314, 1,
-0.2033292, 0.2974309, -3.385317, 0, 1, 0.4823529, 1,
-0.1975612, -1.935476, -2.661508, 0, 1, 0.4901961, 1,
-0.1963364, 0.2870854, 0.2181356, 0, 1, 0.4941176, 1,
-0.19389, -0.792121, -3.905674, 0, 1, 0.5019608, 1,
-0.1933501, -0.6966624, -3.011301, 0, 1, 0.509804, 1,
-0.1925808, 1.003732, -0.37447, 0, 1, 0.5137255, 1,
-0.191283, 0.9699696, -1.353431, 0, 1, 0.5215687, 1,
-0.1910098, -0.320899, -2.374445, 0, 1, 0.5254902, 1,
-0.1889208, -2.324048, -0.9066928, 0, 1, 0.5333334, 1,
-0.1880002, -1.224395, -2.652647, 0, 1, 0.5372549, 1,
-0.1875045, -0.6773829, -2.400058, 0, 1, 0.5450981, 1,
-0.1869008, -1.600191, -4.412678, 0, 1, 0.5490196, 1,
-0.1808415, 0.930085, 1.688915, 0, 1, 0.5568628, 1,
-0.1803823, -0.9960745, -3.160835, 0, 1, 0.5607843, 1,
-0.175351, -0.4912241, -2.817219, 0, 1, 0.5686275, 1,
-0.1748546, 0.3183514, 1.49176, 0, 1, 0.572549, 1,
-0.1727145, 1.134532, 0.8990102, 0, 1, 0.5803922, 1,
-0.1721065, 0.1207916, 1.708544, 0, 1, 0.5843138, 1,
-0.1719286, 0.8544897, -0.4831804, 0, 1, 0.5921569, 1,
-0.1693054, 0.1273376, -0.6709862, 0, 1, 0.5960785, 1,
-0.1677608, 0.474506, 0.08712355, 0, 1, 0.6039216, 1,
-0.1627555, 1.624886, -0.8483937, 0, 1, 0.6117647, 1,
-0.1601693, -1.112788, -1.582838, 0, 1, 0.6156863, 1,
-0.1595716, 0.2955202, 0.02874474, 0, 1, 0.6235294, 1,
-0.1579012, -0.5234007, -2.312195, 0, 1, 0.627451, 1,
-0.1573721, 1.792058, 0.1757705, 0, 1, 0.6352941, 1,
-0.1564407, 0.07442515, -2.740487, 0, 1, 0.6392157, 1,
-0.1510942, 0.3457313, -1.394605, 0, 1, 0.6470588, 1,
-0.1464582, 1.702249, -0.4520734, 0, 1, 0.6509804, 1,
-0.1444146, -0.2154238, -1.303428, 0, 1, 0.6588235, 1,
-0.1398791, -1.350885, -2.517491, 0, 1, 0.6627451, 1,
-0.1391177, -0.2443243, -2.074825, 0, 1, 0.6705883, 1,
-0.1368703, 1.196413, 1.242334, 0, 1, 0.6745098, 1,
-0.1368206, 1.774035, -0.7930516, 0, 1, 0.682353, 1,
-0.1339866, 1.695979, -0.828486, 0, 1, 0.6862745, 1,
-0.1328007, 1.65583, 0.8596872, 0, 1, 0.6941177, 1,
-0.1307677, -0.4343244, -3.414727, 0, 1, 0.7019608, 1,
-0.1263484, 0.1462696, 0.7084968, 0, 1, 0.7058824, 1,
-0.1244984, 1.031329, 0.02157512, 0, 1, 0.7137255, 1,
-0.1240497, -0.8857527, -4.166568, 0, 1, 0.7176471, 1,
-0.1232783, 1.320495, -1.474439, 0, 1, 0.7254902, 1,
-0.1191769, -0.1256165, -3.047086, 0, 1, 0.7294118, 1,
-0.1160751, 2.694639, 1.139234, 0, 1, 0.7372549, 1,
-0.1131571, -0.6982296, -4.159644, 0, 1, 0.7411765, 1,
-0.1128569, -1.865953, -4.031171, 0, 1, 0.7490196, 1,
-0.1120723, 0.9916425, -2.062056, 0, 1, 0.7529412, 1,
-0.1085555, -0.9281589, -0.9314088, 0, 1, 0.7607843, 1,
-0.1040556, 0.287406, -1.925095, 0, 1, 0.7647059, 1,
-0.1022066, 0.8277102, 1.073524, 0, 1, 0.772549, 1,
-0.09942181, -0.7736182, -3.568771, 0, 1, 0.7764706, 1,
-0.09759302, 0.6337107, -0.09800629, 0, 1, 0.7843137, 1,
-0.09299225, -1.612023, -2.307675, 0, 1, 0.7882353, 1,
-0.09158475, -0.4157616, -3.238986, 0, 1, 0.7960784, 1,
-0.08997972, -0.1461194, -3.357589, 0, 1, 0.8039216, 1,
-0.08685613, -2.068718, -2.169202, 0, 1, 0.8078431, 1,
-0.08649774, 0.4607467, -0.07080166, 0, 1, 0.8156863, 1,
-0.08116182, 0.922635, 0.4374167, 0, 1, 0.8196079, 1,
-0.07960537, 0.9085705, -1.117518, 0, 1, 0.827451, 1,
-0.07406002, -1.441061, -2.300466, 0, 1, 0.8313726, 1,
-0.07355008, 0.6823481, -0.6285508, 0, 1, 0.8392157, 1,
-0.07018669, 0.8091404, -1.200526, 0, 1, 0.8431373, 1,
-0.06956988, 0.9294038, -1.752321, 0, 1, 0.8509804, 1,
-0.06714567, -0.2209067, -2.563213, 0, 1, 0.854902, 1,
-0.06687769, 0.8113414, -2.799987, 0, 1, 0.8627451, 1,
-0.06654103, 0.3752586, -2.7953, 0, 1, 0.8666667, 1,
-0.06648265, -0.4229184, -3.674101, 0, 1, 0.8745098, 1,
-0.0655135, -1.363899, -4.062217, 0, 1, 0.8784314, 1,
-0.06450254, 0.3625973, 1.109046, 0, 1, 0.8862745, 1,
-0.06261322, -0.8039077, -3.67104, 0, 1, 0.8901961, 1,
-0.06259689, 2.212375, 0.7094314, 0, 1, 0.8980392, 1,
-0.06256176, -0.1895347, -1.295585, 0, 1, 0.9058824, 1,
-0.05738975, -0.2522562, -2.888149, 0, 1, 0.9098039, 1,
-0.05512763, 0.1533233, 2.342467, 0, 1, 0.9176471, 1,
-0.05374346, 0.5841614, -0.2619703, 0, 1, 0.9215686, 1,
-0.05292909, -0.05232946, -2.307371, 0, 1, 0.9294118, 1,
-0.05002919, 0.08576442, -0.6775859, 0, 1, 0.9333333, 1,
-0.04993661, 0.6419559, 1.415291, 0, 1, 0.9411765, 1,
-0.0415372, -0.6856691, -1.916103, 0, 1, 0.945098, 1,
-0.03973298, -0.7974758, -2.88006, 0, 1, 0.9529412, 1,
-0.0335046, -0.007677797, -1.662688, 0, 1, 0.9568627, 1,
-0.03245206, -1.694172, -1.87, 0, 1, 0.9647059, 1,
-0.02448482, -0.006649164, -0.307151, 0, 1, 0.9686275, 1,
-0.02398618, 1.213837, -1.828477, 0, 1, 0.9764706, 1,
-0.02187137, -0.3176145, -3.901106, 0, 1, 0.9803922, 1,
-0.02017786, 0.9527014, -0.03326097, 0, 1, 0.9882353, 1,
-0.01966139, -0.8193156, -1.908939, 0, 1, 0.9921569, 1,
-0.01927476, -0.7118243, -4.322732, 0, 1, 1, 1,
-0.0192692, -1.999141, -2.338495, 0, 0.9921569, 1, 1,
-0.01621706, 0.8329635, -1.052264, 0, 0.9882353, 1, 1,
-0.01546773, -0.6835301, -5.669801, 0, 0.9803922, 1, 1,
-0.01380545, -1.700257, -2.770343, 0, 0.9764706, 1, 1,
-0.01329807, -1.094012, -2.496806, 0, 0.9686275, 1, 1,
-0.01313276, -0.9616092, -1.944499, 0, 0.9647059, 1, 1,
-0.01172081, -0.3906619, -3.286124, 0, 0.9568627, 1, 1,
-0.01091541, 1.371064, 0.02097848, 0, 0.9529412, 1, 1,
-0.007956172, 0.02166343, -1.247304, 0, 0.945098, 1, 1,
-0.005404594, 0.6971276, 0.7248123, 0, 0.9411765, 1, 1,
-0.003088651, 0.5949078, 0.6485675, 0, 0.9333333, 1, 1,
-0.001747615, -0.1280433, -1.251409, 0, 0.9294118, 1, 1,
-0.001461894, 0.1722657, 0.2291872, 0, 0.9215686, 1, 1,
0.0008708054, -0.4311602, 3.255142, 0, 0.9176471, 1, 1,
0.002447725, 1.671184, -1.211087, 0, 0.9098039, 1, 1,
0.003434291, 0.2473134, 0.0246076, 0, 0.9058824, 1, 1,
0.005438214, 0.04818947, 0.1707413, 0, 0.8980392, 1, 1,
0.00602631, 0.2095907, -0.3920489, 0, 0.8901961, 1, 1,
0.007811862, -0.9425733, 2.278226, 0, 0.8862745, 1, 1,
0.008016918, 1.121022, 1.471947, 0, 0.8784314, 1, 1,
0.01105457, -0.6851432, 2.988536, 0, 0.8745098, 1, 1,
0.01320351, -1.195237, 3.028602, 0, 0.8666667, 1, 1,
0.0163703, -1.56973, 3.80385, 0, 0.8627451, 1, 1,
0.01751844, 1.181649, 0.03940528, 0, 0.854902, 1, 1,
0.01909062, 0.4261082, -0.3985214, 0, 0.8509804, 1, 1,
0.02062764, -0.5256284, 4.991159, 0, 0.8431373, 1, 1,
0.02503664, -1.102733, 2.470981, 0, 0.8392157, 1, 1,
0.02760606, 1.359378, -0.6432217, 0, 0.8313726, 1, 1,
0.02767861, -0.6001466, 2.095866, 0, 0.827451, 1, 1,
0.02775456, -0.6955715, 4.070615, 0, 0.8196079, 1, 1,
0.02952642, 0.5298702, 0.5425286, 0, 0.8156863, 1, 1,
0.03119246, -0.716667, 1.956241, 0, 0.8078431, 1, 1,
0.0322771, 0.09238709, -0.7952816, 0, 0.8039216, 1, 1,
0.03557291, 0.5016283, -1.724515, 0, 0.7960784, 1, 1,
0.04840892, -0.4207909, 2.230016, 0, 0.7882353, 1, 1,
0.05080679, -0.2647297, 3.381548, 0, 0.7843137, 1, 1,
0.05565487, 0.7769302, 0.348181, 0, 0.7764706, 1, 1,
0.05984249, -0.7487007, 2.462294, 0, 0.772549, 1, 1,
0.06005594, -1.368582, 2.105747, 0, 0.7647059, 1, 1,
0.06106126, -0.2570781, 3.08875, 0, 0.7607843, 1, 1,
0.06280955, -0.7305533, 2.365349, 0, 0.7529412, 1, 1,
0.06290523, -1.796531, 4.171307, 0, 0.7490196, 1, 1,
0.07553709, 0.2490256, 0.02141412, 0, 0.7411765, 1, 1,
0.07903998, 0.8616062, 2.516531, 0, 0.7372549, 1, 1,
0.07942312, -0.7346496, 2.463268, 0, 0.7294118, 1, 1,
0.07990929, 0.3668953, -0.7742515, 0, 0.7254902, 1, 1,
0.08245909, 1.433022, -1.088006, 0, 0.7176471, 1, 1,
0.08247306, -0.7488798, 3.714994, 0, 0.7137255, 1, 1,
0.08368203, 1.930165, 0.2618141, 0, 0.7058824, 1, 1,
0.0909934, -0.6605371, 2.539258, 0, 0.6980392, 1, 1,
0.09116982, 1.222242, 0.7970927, 0, 0.6941177, 1, 1,
0.0913639, -0.2248673, 3.394357, 0, 0.6862745, 1, 1,
0.09577206, -0.006466115, 1.375734, 0, 0.682353, 1, 1,
0.09728627, -0.3407249, 2.904101, 0, 0.6745098, 1, 1,
0.09917823, 0.6574093, 1.665397, 0, 0.6705883, 1, 1,
0.1043126, -0.9425143, 3.011533, 0, 0.6627451, 1, 1,
0.1079613, -0.1496109, 2.660223, 0, 0.6588235, 1, 1,
0.114597, -0.7927456, 2.937917, 0, 0.6509804, 1, 1,
0.1178762, 0.6752762, -0.1016471, 0, 0.6470588, 1, 1,
0.1179479, -0.7875412, 2.0782, 0, 0.6392157, 1, 1,
0.1187684, 0.9514879, -0.1408251, 0, 0.6352941, 1, 1,
0.1196003, 0.4590408, 0.9834343, 0, 0.627451, 1, 1,
0.1251117, 0.5719092, -0.5826721, 0, 0.6235294, 1, 1,
0.125112, -1.485014, 2.718837, 0, 0.6156863, 1, 1,
0.1308102, -0.5055283, 3.365383, 0, 0.6117647, 1, 1,
0.1390622, -0.06916268, 0.9361872, 0, 0.6039216, 1, 1,
0.1446044, -1.189676, 2.960319, 0, 0.5960785, 1, 1,
0.1462786, -1.057818, 0.3168507, 0, 0.5921569, 1, 1,
0.1496905, 1.061525, 0.1919932, 0, 0.5843138, 1, 1,
0.1501052, 0.281419, -0.4345947, 0, 0.5803922, 1, 1,
0.1524934, -0.4295813, 1.392966, 0, 0.572549, 1, 1,
0.1531131, 0.04161115, 0.9115554, 0, 0.5686275, 1, 1,
0.1545599, 3.020559, -1.254128, 0, 0.5607843, 1, 1,
0.1549793, 1.667287, -0.6245488, 0, 0.5568628, 1, 1,
0.1560857, -0.1036913, 4.199376, 0, 0.5490196, 1, 1,
0.1572009, 0.5162592, 2.039214, 0, 0.5450981, 1, 1,
0.1576526, -0.1069853, 1.100399, 0, 0.5372549, 1, 1,
0.1595235, -1.384212, 4.331482, 0, 0.5333334, 1, 1,
0.166877, -0.260657, 2.883745, 0, 0.5254902, 1, 1,
0.1717157, 1.039963, -1.471091, 0, 0.5215687, 1, 1,
0.1739256, 0.1889679, 1.541833, 0, 0.5137255, 1, 1,
0.1741488, 0.2027862, 1.439366, 0, 0.509804, 1, 1,
0.1759125, 0.6519169, 0.8357476, 0, 0.5019608, 1, 1,
0.1779704, -2.541259, 4.163867, 0, 0.4941176, 1, 1,
0.1814441, 1.175194, 0.1329318, 0, 0.4901961, 1, 1,
0.181829, -0.7222363, 2.795637, 0, 0.4823529, 1, 1,
0.1857561, 0.3932855, 1.409265, 0, 0.4784314, 1, 1,
0.1873201, 0.5357022, 0.5449459, 0, 0.4705882, 1, 1,
0.1887157, 1.374482, -0.03379633, 0, 0.4666667, 1, 1,
0.1934821, -0.1400368, 1.12099, 0, 0.4588235, 1, 1,
0.1995838, 1.015826, 1.717253, 0, 0.454902, 1, 1,
0.2007409, -0.4218338, 3.235747, 0, 0.4470588, 1, 1,
0.201187, 0.909682, 0.2341994, 0, 0.4431373, 1, 1,
0.202874, 0.180108, 0.08428846, 0, 0.4352941, 1, 1,
0.211068, -0.3728307, 2.118845, 0, 0.4313726, 1, 1,
0.2133078, -1.092976, 1.495997, 0, 0.4235294, 1, 1,
0.2135851, -0.4815578, 0.0002134907, 0, 0.4196078, 1, 1,
0.2155952, -0.7267389, 2.077631, 0, 0.4117647, 1, 1,
0.2218446, -1.340604, 4.369387, 0, 0.4078431, 1, 1,
0.2230855, 1.477687, 0.3583919, 0, 0.4, 1, 1,
0.2234281, -1.047139, 1.157752, 0, 0.3921569, 1, 1,
0.2289068, 0.01274871, 4.490028, 0, 0.3882353, 1, 1,
0.2316677, 0.7373103, -0.6858349, 0, 0.3803922, 1, 1,
0.2336433, -1.497189, 2.793147, 0, 0.3764706, 1, 1,
0.2344949, -1.889972, 3.811125, 0, 0.3686275, 1, 1,
0.2358462, -0.5125691, 3.243964, 0, 0.3647059, 1, 1,
0.2387984, 1.413934, -0.543865, 0, 0.3568628, 1, 1,
0.2399871, -0.8173963, 3.862999, 0, 0.3529412, 1, 1,
0.2403792, 0.3512328, -0.1819516, 0, 0.345098, 1, 1,
0.240504, -0.3847491, 1.831383, 0, 0.3411765, 1, 1,
0.2449942, -0.07706703, 0.9195173, 0, 0.3333333, 1, 1,
0.2479651, -0.1365309, 1.022326, 0, 0.3294118, 1, 1,
0.2519307, -0.1032046, 2.685096, 0, 0.3215686, 1, 1,
0.2523055, -0.1339858, 3.2655, 0, 0.3176471, 1, 1,
0.2605306, 1.519191, 0.862729, 0, 0.3098039, 1, 1,
0.2694023, -0.1366937, 1.679998, 0, 0.3058824, 1, 1,
0.2698877, -2.050515, 2.324365, 0, 0.2980392, 1, 1,
0.271823, -0.6262722, 4.151983, 0, 0.2901961, 1, 1,
0.2771867, -0.3764277, 1.856039, 0, 0.2862745, 1, 1,
0.2776229, -0.5796493, 3.120063, 0, 0.2784314, 1, 1,
0.278345, 1.428674, 0.7858436, 0, 0.2745098, 1, 1,
0.2816105, -1.198879, 2.931328, 0, 0.2666667, 1, 1,
0.2839249, -0.8486673, 2.910019, 0, 0.2627451, 1, 1,
0.2843625, -1.169151, 4.264034, 0, 0.254902, 1, 1,
0.2856698, -0.3860247, 1.775892, 0, 0.2509804, 1, 1,
0.2886824, -2.087912, 2.523445, 0, 0.2431373, 1, 1,
0.2887036, 0.5294889, 0.1122363, 0, 0.2392157, 1, 1,
0.2900428, -0.1243113, 3.216447, 0, 0.2313726, 1, 1,
0.291951, 0.3264649, 1.453854, 0, 0.227451, 1, 1,
0.2980128, -0.4133263, 1.401498, 0, 0.2196078, 1, 1,
0.3019419, 1.190546, 0.2792839, 0, 0.2156863, 1, 1,
0.3024908, -0.07643109, 1.33529, 0, 0.2078431, 1, 1,
0.3039003, 0.1869543, 1.179223, 0, 0.2039216, 1, 1,
0.3089394, -2.410258, 3.701576, 0, 0.1960784, 1, 1,
0.3157998, -0.8210098, 5.491623, 0, 0.1882353, 1, 1,
0.317721, 0.2466253, 1.343148, 0, 0.1843137, 1, 1,
0.3208012, 1.018104, -1.350062, 0, 0.1764706, 1, 1,
0.3267457, 0.4857182, 0.4621527, 0, 0.172549, 1, 1,
0.3343834, -0.7890791, 2.660529, 0, 0.1647059, 1, 1,
0.3344256, 2.598119, 0.3313418, 0, 0.1607843, 1, 1,
0.3384472, 0.3030152, -0.6946638, 0, 0.1529412, 1, 1,
0.3456671, -0.2086134, 0.9997188, 0, 0.1490196, 1, 1,
0.3478444, 1.356806, -0.3723487, 0, 0.1411765, 1, 1,
0.3479744, -0.1412482, 4.515398, 0, 0.1372549, 1, 1,
0.3499493, -0.1078858, 1.592036, 0, 0.1294118, 1, 1,
0.3502977, 1.062146, -0.5529803, 0, 0.1254902, 1, 1,
0.3512877, 0.6556977, 1.56503, 0, 0.1176471, 1, 1,
0.3514024, 1.179341, 0.6448076, 0, 0.1137255, 1, 1,
0.3549529, 0.6056343, 1.12639, 0, 0.1058824, 1, 1,
0.3557719, 0.3290016, 0.6821077, 0, 0.09803922, 1, 1,
0.3559279, 0.4647682, -1.067797, 0, 0.09411765, 1, 1,
0.356887, 0.2061383, 0.5742723, 0, 0.08627451, 1, 1,
0.3576762, -0.611066, 3.158876, 0, 0.08235294, 1, 1,
0.361824, 0.7656474, 1.272557, 0, 0.07450981, 1, 1,
0.3623757, -0.792471, 2.84759, 0, 0.07058824, 1, 1,
0.363343, 0.3551745, 1.781666, 0, 0.0627451, 1, 1,
0.3652225, -1.034849, 1.887195, 0, 0.05882353, 1, 1,
0.3661511, 0.7710779, 0.9868201, 0, 0.05098039, 1, 1,
0.3686561, 1.249372, 0.9589668, 0, 0.04705882, 1, 1,
0.3693071, 0.2059189, 2.577895, 0, 0.03921569, 1, 1,
0.3695598, 1.14536, 0.3538918, 0, 0.03529412, 1, 1,
0.3778032, -0.7642846, 3.485568, 0, 0.02745098, 1, 1,
0.3820122, -0.5287747, 1.910012, 0, 0.02352941, 1, 1,
0.3863755, -1.506045, 3.445135, 0, 0.01568628, 1, 1,
0.388879, -1.775602, 3.76965, 0, 0.01176471, 1, 1,
0.3907359, -0.4597487, 2.74872, 0, 0.003921569, 1, 1,
0.3974969, -1.640356, 2.693465, 0.003921569, 0, 1, 1,
0.3998374, 1.299284, 0.5229549, 0.007843138, 0, 1, 1,
0.4050666, 0.07356277, 0.9269488, 0.01568628, 0, 1, 1,
0.4050678, 1.046142, 1.058759, 0.01960784, 0, 1, 1,
0.4101495, 1.464471, -0.07015522, 0.02745098, 0, 1, 1,
0.413469, 0.7427702, 0.8084787, 0.03137255, 0, 1, 1,
0.4144642, 0.6897513, 0.7808816, 0.03921569, 0, 1, 1,
0.4146748, 0.1495216, 1.951076, 0.04313726, 0, 1, 1,
0.4169892, 0.8929944, 0.8444186, 0.05098039, 0, 1, 1,
0.4195912, -1.371979, 0.9326441, 0.05490196, 0, 1, 1,
0.4238693, -0.6068514, 1.059549, 0.0627451, 0, 1, 1,
0.4246916, -0.1743753, 3.512761, 0.06666667, 0, 1, 1,
0.4257708, 1.389808, 0.02307815, 0.07450981, 0, 1, 1,
0.4264962, 0.2286153, -0.190828, 0.07843138, 0, 1, 1,
0.4276006, -0.4783433, 1.873703, 0.08627451, 0, 1, 1,
0.4283275, 0.04563272, 0.4758965, 0.09019608, 0, 1, 1,
0.4302715, 0.4842846, 0.8484045, 0.09803922, 0, 1, 1,
0.4360519, 1.161284, -0.08009084, 0.1058824, 0, 1, 1,
0.4380361, 1.549844, -0.7293931, 0.1098039, 0, 1, 1,
0.43881, 0.1529267, -0.009659834, 0.1176471, 0, 1, 1,
0.4413115, -0.2334029, 2.835456, 0.1215686, 0, 1, 1,
0.4492889, 0.1582046, -1.113972, 0.1294118, 0, 1, 1,
0.4503194, -1.371964, 3.456984, 0.1333333, 0, 1, 1,
0.453678, 0.2488141, 0.7392473, 0.1411765, 0, 1, 1,
0.4541617, -0.7260414, 2.988708, 0.145098, 0, 1, 1,
0.4690407, -0.562907, 2.863374, 0.1529412, 0, 1, 1,
0.4696592, 0.3477829, 0.6159051, 0.1568628, 0, 1, 1,
0.4730386, -0.3276692, 1.680922, 0.1647059, 0, 1, 1,
0.4744369, -0.9084997, 1.999839, 0.1686275, 0, 1, 1,
0.4763967, 0.3663988, 1.153126, 0.1764706, 0, 1, 1,
0.4777871, 0.3965078, 0.8201775, 0.1803922, 0, 1, 1,
0.4789532, -1.344539, 3.366209, 0.1882353, 0, 1, 1,
0.4803016, 0.21096, 0.5840114, 0.1921569, 0, 1, 1,
0.4845524, 1.912451, 0.8567989, 0.2, 0, 1, 1,
0.4855761, -0.1802164, 1.700953, 0.2078431, 0, 1, 1,
0.493391, -1.08939, 5.532843, 0.2117647, 0, 1, 1,
0.4991055, -0.1469039, 2.227767, 0.2196078, 0, 1, 1,
0.5051593, -0.491582, 3.362122, 0.2235294, 0, 1, 1,
0.5103192, 0.7278814, 0.7273264, 0.2313726, 0, 1, 1,
0.5106897, -0.9397365, 2.948947, 0.2352941, 0, 1, 1,
0.5116725, -0.1014446, 1.513163, 0.2431373, 0, 1, 1,
0.5119252, 0.2462664, 2.508614, 0.2470588, 0, 1, 1,
0.5166689, 0.1524174, 0.9791654, 0.254902, 0, 1, 1,
0.5194733, 1.528052, 0.9708794, 0.2588235, 0, 1, 1,
0.5348158, -0.276441, 1.774779, 0.2666667, 0, 1, 1,
0.5426396, 0.06013013, 0.2400435, 0.2705882, 0, 1, 1,
0.5437969, -0.7779522, 2.943233, 0.2784314, 0, 1, 1,
0.5453447, -0.6116061, 3.849274, 0.282353, 0, 1, 1,
0.5500255, 1.155268, -0.2186389, 0.2901961, 0, 1, 1,
0.5541828, 1.61903, -0.7159197, 0.2941177, 0, 1, 1,
0.5585545, -2.084461, 4.13724, 0.3019608, 0, 1, 1,
0.5669012, -0.2744554, 1.349854, 0.3098039, 0, 1, 1,
0.5676549, -0.689705, 0.8562635, 0.3137255, 0, 1, 1,
0.5681094, 0.1667812, 3.140939, 0.3215686, 0, 1, 1,
0.5719401, 0.1254767, 0.7779632, 0.3254902, 0, 1, 1,
0.5731648, 1.283551, 0.06951103, 0.3333333, 0, 1, 1,
0.5761892, 0.5941997, 1.454522, 0.3372549, 0, 1, 1,
0.5775069, -0.7108465, 4.752931, 0.345098, 0, 1, 1,
0.5808805, -1.452329, 2.192172, 0.3490196, 0, 1, 1,
0.5820978, 0.1244676, 2.495028, 0.3568628, 0, 1, 1,
0.5891488, -0.5626535, 1.334716, 0.3607843, 0, 1, 1,
0.5895491, -0.8551608, 4.32621, 0.3686275, 0, 1, 1,
0.5909769, 1.618799, -1.484992, 0.372549, 0, 1, 1,
0.5995306, 1.173813, -0.5104984, 0.3803922, 0, 1, 1,
0.6012309, 0.3544127, 0.4856556, 0.3843137, 0, 1, 1,
0.6012838, -1.090112, 4.058093, 0.3921569, 0, 1, 1,
0.605617, 1.439553, 0.4632143, 0.3960784, 0, 1, 1,
0.6083222, -0.4527031, 1.61301, 0.4039216, 0, 1, 1,
0.6111786, -0.1881779, 2.583036, 0.4117647, 0, 1, 1,
0.612601, 0.8164349, 1.698244, 0.4156863, 0, 1, 1,
0.6129423, -1.248708, 2.964373, 0.4235294, 0, 1, 1,
0.6140513, -1.126815, 2.657723, 0.427451, 0, 1, 1,
0.6191205, -0.2216994, 0.6660796, 0.4352941, 0, 1, 1,
0.6208929, -1.540961, 3.417055, 0.4392157, 0, 1, 1,
0.6209468, 0.65204, 2.607903, 0.4470588, 0, 1, 1,
0.6211036, 0.5740552, 1.814274, 0.4509804, 0, 1, 1,
0.6248415, -1.244355, 2.492636, 0.4588235, 0, 1, 1,
0.6259968, 0.8202825, -0.4529011, 0.4627451, 0, 1, 1,
0.6268717, 0.6357954, 1.685626, 0.4705882, 0, 1, 1,
0.6275949, 1.329844, -0.6294316, 0.4745098, 0, 1, 1,
0.6362203, -0.7469464, 1.139516, 0.4823529, 0, 1, 1,
0.6384385, 1.789232, 0.6473268, 0.4862745, 0, 1, 1,
0.6409615, 0.2350205, 0.6405064, 0.4941176, 0, 1, 1,
0.6419334, -0.02004927, 2.03528, 0.5019608, 0, 1, 1,
0.6492368, -0.8718587, 3.210664, 0.5058824, 0, 1, 1,
0.6513807, 1.471284, 0.4509056, 0.5137255, 0, 1, 1,
0.6528487, 0.2652925, 0.5494952, 0.5176471, 0, 1, 1,
0.6532769, 0.5818102, -0.5001671, 0.5254902, 0, 1, 1,
0.657326, -0.4080725, 1.194882, 0.5294118, 0, 1, 1,
0.6579784, 1.203334, -0.369389, 0.5372549, 0, 1, 1,
0.6616043, 1.125287, -0.9888287, 0.5411765, 0, 1, 1,
0.6687734, -1.356707, 3.194826, 0.5490196, 0, 1, 1,
0.6758443, 1.030654, 1.137213, 0.5529412, 0, 1, 1,
0.676444, -0.4036383, 2.768034, 0.5607843, 0, 1, 1,
0.6849222, -1.160586, 1.205677, 0.5647059, 0, 1, 1,
0.687966, 0.5380901, 0.5236998, 0.572549, 0, 1, 1,
0.6884502, -0.5094444, 0.234412, 0.5764706, 0, 1, 1,
0.6981499, 1.110064, -0.2737775, 0.5843138, 0, 1, 1,
0.6983905, -1.07607, 3.421349, 0.5882353, 0, 1, 1,
0.7025632, 0.4777277, 0.244139, 0.5960785, 0, 1, 1,
0.7033425, -0.09104401, 0.4470139, 0.6039216, 0, 1, 1,
0.7096605, -0.01595642, 0.6340835, 0.6078432, 0, 1, 1,
0.7118132, 0.4093094, 0.00765217, 0.6156863, 0, 1, 1,
0.7124729, 1.794696, 1.545198, 0.6196079, 0, 1, 1,
0.7134755, -1.157242, 2.188961, 0.627451, 0, 1, 1,
0.7185516, -0.8927654, 2.997502, 0.6313726, 0, 1, 1,
0.7191893, -0.3170094, 0.514374, 0.6392157, 0, 1, 1,
0.719546, 0.8609017, 1.287499, 0.6431373, 0, 1, 1,
0.720165, -1.088275, 2.082215, 0.6509804, 0, 1, 1,
0.7233732, 2.550694, 0.1412164, 0.654902, 0, 1, 1,
0.7240583, -0.4087725, 0.02155348, 0.6627451, 0, 1, 1,
0.7290828, 0.4839009, 2.915694, 0.6666667, 0, 1, 1,
0.7294281, 0.3167153, 2.442649, 0.6745098, 0, 1, 1,
0.7300425, 1.2264, 0.1025085, 0.6784314, 0, 1, 1,
0.7330352, -1.39528, 3.773739, 0.6862745, 0, 1, 1,
0.7389672, 1.709391, 1.764662, 0.6901961, 0, 1, 1,
0.7437449, -0.560728, 2.320828, 0.6980392, 0, 1, 1,
0.7466617, 1.394097, 1.219895, 0.7058824, 0, 1, 1,
0.7498674, -0.5906418, 2.487909, 0.7098039, 0, 1, 1,
0.7499159, 0.6177054, 0.2852831, 0.7176471, 0, 1, 1,
0.7508627, -0.7692439, 2.316645, 0.7215686, 0, 1, 1,
0.7552739, -0.5954193, 2.428089, 0.7294118, 0, 1, 1,
0.7559596, 0.9731501, 0.7885211, 0.7333333, 0, 1, 1,
0.7637268, 0.7742066, 0.446667, 0.7411765, 0, 1, 1,
0.7685514, -0.6153001, 1.450573, 0.7450981, 0, 1, 1,
0.7693696, 1.301257, 1.820785, 0.7529412, 0, 1, 1,
0.7694219, 0.7013208, 0.1304512, 0.7568628, 0, 1, 1,
0.7766101, 1.273056, 0.6016594, 0.7647059, 0, 1, 1,
0.7781016, -0.214999, 1.4604, 0.7686275, 0, 1, 1,
0.7784469, -0.8281374, 2.819382, 0.7764706, 0, 1, 1,
0.778492, -1.477967, 2.054596, 0.7803922, 0, 1, 1,
0.7831054, -0.8530689, 3.226214, 0.7882353, 0, 1, 1,
0.783601, -0.2085625, 0.8406899, 0.7921569, 0, 1, 1,
0.7843047, -1.18769, 3.686606, 0.8, 0, 1, 1,
0.7869091, 0.1916467, 4.6376, 0.8078431, 0, 1, 1,
0.7961695, 0.02335378, 2.261659, 0.8117647, 0, 1, 1,
0.7981164, 0.05196641, 1.171678, 0.8196079, 0, 1, 1,
0.799275, -0.271159, 0.009947245, 0.8235294, 0, 1, 1,
0.8056834, -1.265472, 2.829164, 0.8313726, 0, 1, 1,
0.8074609, 0.4181696, 0.5709221, 0.8352941, 0, 1, 1,
0.807951, -0.1690357, 0.7030259, 0.8431373, 0, 1, 1,
0.820318, -0.6826851, 2.266861, 0.8470588, 0, 1, 1,
0.826198, -0.8174624, 3.629883, 0.854902, 0, 1, 1,
0.8273385, 0.03586163, 0.7314518, 0.8588235, 0, 1, 1,
0.8324139, 0.4023365, 1.761371, 0.8666667, 0, 1, 1,
0.8427973, -0.08711562, 1.005416, 0.8705882, 0, 1, 1,
0.8510501, 0.04286785, 2.554196, 0.8784314, 0, 1, 1,
0.8517241, -1.228719, 2.55368, 0.8823529, 0, 1, 1,
0.852761, -0.06655007, 1.195586, 0.8901961, 0, 1, 1,
0.8567775, 0.7700996, 0.3955621, 0.8941177, 0, 1, 1,
0.857169, 1.134262, -0.1233041, 0.9019608, 0, 1, 1,
0.8595218, -0.223447, 1.915552, 0.9098039, 0, 1, 1,
0.8608079, 0.003432055, 1.736895, 0.9137255, 0, 1, 1,
0.8637317, -0.06409021, 1.804059, 0.9215686, 0, 1, 1,
0.8687654, -0.9264871, 2.871009, 0.9254902, 0, 1, 1,
0.8774092, 0.2130353, -0.4115694, 0.9333333, 0, 1, 1,
0.8798518, -1.425965, 4.832303, 0.9372549, 0, 1, 1,
0.8818667, 1.273981, 1.434896, 0.945098, 0, 1, 1,
0.8949363, 0.02066719, 2.420238, 0.9490196, 0, 1, 1,
0.8989938, -2.283848, 2.294427, 0.9568627, 0, 1, 1,
0.8993858, -0.3707721, 0.7227976, 0.9607843, 0, 1, 1,
0.8996674, 1.929618, 1.921835, 0.9686275, 0, 1, 1,
0.9103508, 0.6072668, 1.086447, 0.972549, 0, 1, 1,
0.9140178, 2.501146, -0.2359912, 0.9803922, 0, 1, 1,
0.9206071, 1.276901, -0.0157028, 0.9843137, 0, 1, 1,
0.9207899, 0.8692375, 1.457938, 0.9921569, 0, 1, 1,
0.9304194, -1.008224, 0.9948884, 0.9960784, 0, 1, 1,
0.9318234, -1.192468, 0.5833475, 1, 0, 0.9960784, 1,
0.9326422, 1.145, 1.242825, 1, 0, 0.9882353, 1,
0.940905, 0.2155092, 1.095299, 1, 0, 0.9843137, 1,
0.9435528, 0.07444974, 0.4641708, 1, 0, 0.9764706, 1,
0.9474599, -1.251317, 1.982823, 1, 0, 0.972549, 1,
0.9576553, -1.085555, 3.029768, 1, 0, 0.9647059, 1,
0.9591494, 0.1082956, 3.331831, 1, 0, 0.9607843, 1,
0.9644949, -0.03902209, 2.008373, 1, 0, 0.9529412, 1,
0.969715, -0.5722913, 2.193001, 1, 0, 0.9490196, 1,
0.9707068, 1.344003, -0.2804076, 1, 0, 0.9411765, 1,
0.9719328, 0.488801, 0.7196833, 1, 0, 0.9372549, 1,
0.9738667, -1.857804, -0.05918555, 1, 0, 0.9294118, 1,
0.9742182, -0.44315, 0.06764484, 1, 0, 0.9254902, 1,
0.9754736, -1.100813, 2.487559, 1, 0, 0.9176471, 1,
0.9765109, 0.7734944, 1.172171, 1, 0, 0.9137255, 1,
0.9773241, 1.301535, 0.9962658, 1, 0, 0.9058824, 1,
0.984009, -2.00557, 2.642925, 1, 0, 0.9019608, 1,
0.9940886, -2.733669, 3.735941, 1, 0, 0.8941177, 1,
1.013241, 0.7956122, -1.150777, 1, 0, 0.8862745, 1,
1.026875, 0.9134528, 2.574062, 1, 0, 0.8823529, 1,
1.0351, 1.216457, 2.233557, 1, 0, 0.8745098, 1,
1.044983, 0.1338517, 2.334806, 1, 0, 0.8705882, 1,
1.051725, 1.157518, 0.8204266, 1, 0, 0.8627451, 1,
1.053102, -0.09030907, 3.939169, 1, 0, 0.8588235, 1,
1.066387, 0.007698193, 1.306586, 1, 0, 0.8509804, 1,
1.077724, 1.192247, -0.394742, 1, 0, 0.8470588, 1,
1.081475, 0.3617385, 0.5943534, 1, 0, 0.8392157, 1,
1.0828, 0.3371674, -0.9857868, 1, 0, 0.8352941, 1,
1.083787, 0.008521582, 1.760441, 1, 0, 0.827451, 1,
1.084716, 0.09050862, -0.3927664, 1, 0, 0.8235294, 1,
1.088975, -1.114535, 2.649415, 1, 0, 0.8156863, 1,
1.093186, -0.4413494, 3.774363, 1, 0, 0.8117647, 1,
1.093187, 0.5194486, 0.1240135, 1, 0, 0.8039216, 1,
1.095717, -0.7742528, 1.197257, 1, 0, 0.7960784, 1,
1.096801, -0.627021, 3.217023, 1, 0, 0.7921569, 1,
1.097549, -0.06792393, 3.392253, 1, 0, 0.7843137, 1,
1.099425, -0.3384244, 3.533861, 1, 0, 0.7803922, 1,
1.104995, -0.005819677, 1.234231, 1, 0, 0.772549, 1,
1.107747, -0.03112162, 1.690168, 1, 0, 0.7686275, 1,
1.111227, 1.569269, 0.8825942, 1, 0, 0.7607843, 1,
1.117118, -0.05399241, 3.695931, 1, 0, 0.7568628, 1,
1.128373, -1.13651, 2.346177, 1, 0, 0.7490196, 1,
1.129144, -1.902807, 4.606905, 1, 0, 0.7450981, 1,
1.129626, -0.2005872, 3.059367, 1, 0, 0.7372549, 1,
1.13704, -0.3069233, 1.476588, 1, 0, 0.7333333, 1,
1.147093, -0.8462743, 2.879793, 1, 0, 0.7254902, 1,
1.150225, 1.622565, 0.7119984, 1, 0, 0.7215686, 1,
1.150733, -2.835592, 1.903656, 1, 0, 0.7137255, 1,
1.152141, -0.5724484, 3.533278, 1, 0, 0.7098039, 1,
1.152578, -0.1149949, 1.021885, 1, 0, 0.7019608, 1,
1.158373, 0.3426378, 0.767606, 1, 0, 0.6941177, 1,
1.15874, 1.537888, 1.988001, 1, 0, 0.6901961, 1,
1.161501, 0.03743882, 4.464383, 1, 0, 0.682353, 1,
1.174258, -0.9506926, 2.454175, 1, 0, 0.6784314, 1,
1.17766, -0.02468964, 2.992024, 1, 0, 0.6705883, 1,
1.182197, 0.3389676, 0.4862067, 1, 0, 0.6666667, 1,
1.188221, 1.222651, 0.1687158, 1, 0, 0.6588235, 1,
1.197412, -0.6994923, 2.496409, 1, 0, 0.654902, 1,
1.197462, -0.4781134, 2.463531, 1, 0, 0.6470588, 1,
1.19778, 0.6856979, -0.1092697, 1, 0, 0.6431373, 1,
1.200876, 0.1738653, 2.381704, 1, 0, 0.6352941, 1,
1.203395, -0.1698904, 2.212684, 1, 0, 0.6313726, 1,
1.20782, -0.6397428, 3.302605, 1, 0, 0.6235294, 1,
1.216356, -1.107242, 2.605944, 1, 0, 0.6196079, 1,
1.230393, -2.482196, 2.91791, 1, 0, 0.6117647, 1,
1.237337, 0.3768961, 0.5652674, 1, 0, 0.6078432, 1,
1.24287, -0.04639632, 2.203458, 1, 0, 0.6, 1,
1.24335, -0.8019894, 3.055858, 1, 0, 0.5921569, 1,
1.250901, -0.6891633, 1.128386, 1, 0, 0.5882353, 1,
1.256004, 0.4232755, 0.2752103, 1, 0, 0.5803922, 1,
1.261138, 0.120556, 1.165489, 1, 0, 0.5764706, 1,
1.263382, -0.101129, 2.073504, 1, 0, 0.5686275, 1,
1.265757, 0.2055796, 0.7127454, 1, 0, 0.5647059, 1,
1.267259, -0.1734785, 2.293511, 1, 0, 0.5568628, 1,
1.283555, 1.094444, 1.652187, 1, 0, 0.5529412, 1,
1.285558, 1.050625, 0.6442965, 1, 0, 0.5450981, 1,
1.29359, -1.339688, 2.965993, 1, 0, 0.5411765, 1,
1.294428, -0.03348796, 2.056354, 1, 0, 0.5333334, 1,
1.312531, -0.746644, 1.741286, 1, 0, 0.5294118, 1,
1.323978, 0.8856871, 0.8201256, 1, 0, 0.5215687, 1,
1.326225, -0.03291885, 0.8749436, 1, 0, 0.5176471, 1,
1.340892, 0.4140326, -0.5914057, 1, 0, 0.509804, 1,
1.341928, 1.026487, 1.864959, 1, 0, 0.5058824, 1,
1.350784, -1.772703, 2.383486, 1, 0, 0.4980392, 1,
1.352057, -0.4614574, 3.029834, 1, 0, 0.4901961, 1,
1.353911, -0.2977709, 1.740796, 1, 0, 0.4862745, 1,
1.357773, -0.7943892, 2.218593, 1, 0, 0.4784314, 1,
1.367064, 0.3058205, 0.2156487, 1, 0, 0.4745098, 1,
1.372214, -0.827025, 3.009802, 1, 0, 0.4666667, 1,
1.382632, -1.070225, 1.695752, 1, 0, 0.4627451, 1,
1.386782, -0.2256398, 2.202408, 1, 0, 0.454902, 1,
1.393759, 0.2504026, 2.850368, 1, 0, 0.4509804, 1,
1.394571, -0.4776788, 1.538547, 1, 0, 0.4431373, 1,
1.423621, 0.5641657, 1.842737, 1, 0, 0.4392157, 1,
1.438773, 0.8738273, 1.723759, 1, 0, 0.4313726, 1,
1.450873, 1.312985, 0.07627842, 1, 0, 0.427451, 1,
1.452479, 3.228098, 1.606913, 1, 0, 0.4196078, 1,
1.460084, -0.8590217, 3.100705, 1, 0, 0.4156863, 1,
1.464152, -0.397341, 1.031741, 1, 0, 0.4078431, 1,
1.466167, -0.5607361, 0.8909278, 1, 0, 0.4039216, 1,
1.483069, -0.3543997, 2.483275, 1, 0, 0.3960784, 1,
1.487534, -0.3615578, 1.319007, 1, 0, 0.3882353, 1,
1.490009, -0.4968656, 2.066094, 1, 0, 0.3843137, 1,
1.492265, 1.79724, 0.4885644, 1, 0, 0.3764706, 1,
1.498958, 0.2855422, 2.175008, 1, 0, 0.372549, 1,
1.508043, 0.3694429, 1.488309, 1, 0, 0.3647059, 1,
1.512025, -0.8394278, 3.135051, 1, 0, 0.3607843, 1,
1.513969, 0.9228127, 0.6448368, 1, 0, 0.3529412, 1,
1.539668, -0.5822742, 0.4617839, 1, 0, 0.3490196, 1,
1.544356, 0.410181, 1.352987, 1, 0, 0.3411765, 1,
1.545628, 0.06760389, 0.5913287, 1, 0, 0.3372549, 1,
1.548231, -0.4399426, 2.034731, 1, 0, 0.3294118, 1,
1.552615, -0.527882, 2.545987, 1, 0, 0.3254902, 1,
1.553486, 0.0381911, 0.6682509, 1, 0, 0.3176471, 1,
1.564956, 0.9453244, -1.654526, 1, 0, 0.3137255, 1,
1.57185, -0.9166216, 3.366306, 1, 0, 0.3058824, 1,
1.582937, -1.261298, 2.654656, 1, 0, 0.2980392, 1,
1.588314, -1.574973, 2.397262, 1, 0, 0.2941177, 1,
1.593666, 0.04278327, 0.5154782, 1, 0, 0.2862745, 1,
1.630294, 0.8576182, 0.01968469, 1, 0, 0.282353, 1,
1.633676, -1.319278, 1.445043, 1, 0, 0.2745098, 1,
1.640765, 0.8082358, -0.6084612, 1, 0, 0.2705882, 1,
1.650681, -0.09474546, 0.5745653, 1, 0, 0.2627451, 1,
1.667068, 2.214396, 0.3111702, 1, 0, 0.2588235, 1,
1.674425, -1.251816, 3.115509, 1, 0, 0.2509804, 1,
1.675786, -0.0405757, 2.612813, 1, 0, 0.2470588, 1,
1.68438, -0.6980833, 2.435969, 1, 0, 0.2392157, 1,
1.685038, 0.7202682, 1.235834, 1, 0, 0.2352941, 1,
1.701158, 0.1529727, 1.477944, 1, 0, 0.227451, 1,
1.701463, 0.2972834, 0.7339349, 1, 0, 0.2235294, 1,
1.727162, -1.715043, 2.52539, 1, 0, 0.2156863, 1,
1.732553, 0.9617175, 1.299187, 1, 0, 0.2117647, 1,
1.774491, -0.4005826, 0.3312098, 1, 0, 0.2039216, 1,
1.797775, -0.2357178, 2.795393, 1, 0, 0.1960784, 1,
1.813242, -0.06116515, 2.065624, 1, 0, 0.1921569, 1,
1.833654, -1.182548, 1.576289, 1, 0, 0.1843137, 1,
1.837957, -0.4111705, 2.722237, 1, 0, 0.1803922, 1,
1.85357, -1.020861, 3.368354, 1, 0, 0.172549, 1,
1.857114, -0.07071179, 1.770942, 1, 0, 0.1686275, 1,
1.862738, 1.232787, 3.994072, 1, 0, 0.1607843, 1,
1.881852, 0.6615014, 0.7277521, 1, 0, 0.1568628, 1,
1.882, -0.2559386, 4.178458, 1, 0, 0.1490196, 1,
1.911026, 0.2736526, 1.307466, 1, 0, 0.145098, 1,
1.958311, -0.2397094, 2.742939, 1, 0, 0.1372549, 1,
1.974072, -1.197506, 2.550116, 1, 0, 0.1333333, 1,
1.983809, 1.59379, 2.513622, 1, 0, 0.1254902, 1,
1.986379, 0.1502197, 1.884359, 1, 0, 0.1215686, 1,
2.028514, -1.80209, 1.209777, 1, 0, 0.1137255, 1,
2.031326, 0.694953, 1.659162, 1, 0, 0.1098039, 1,
2.037227, 0.8238667, -0.873234, 1, 0, 0.1019608, 1,
2.064882, 0.9746654, 0.7331053, 1, 0, 0.09411765, 1,
2.08145, 0.3726327, 0.8733131, 1, 0, 0.09019608, 1,
2.152627, -1.30164, 1.380276, 1, 0, 0.08235294, 1,
2.226843, -0.9101939, 1.358599, 1, 0, 0.07843138, 1,
2.253959, -1.27155, 2.933577, 1, 0, 0.07058824, 1,
2.271894, 1.450916, 2.003336, 1, 0, 0.06666667, 1,
2.312357, -0.58709, -1.074306, 1, 0, 0.05882353, 1,
2.356112, -0.8546917, 1.88963, 1, 0, 0.05490196, 1,
2.377161, -0.5188681, 3.6466, 1, 0, 0.04705882, 1,
2.397099, -0.7470916, 0.8227981, 1, 0, 0.04313726, 1,
2.405343, 0.86524, 2.864416, 1, 0, 0.03529412, 1,
2.417531, 0.6257775, 0.1791423, 1, 0, 0.03137255, 1,
2.419257, 3.196506, 1.73027, 1, 0, 0.02352941, 1,
2.498667, -1.413746, 2.123828, 1, 0, 0.01960784, 1,
2.5489, -0.3065509, 2.824541, 1, 0, 0.01176471, 1,
2.706658, 1.441095, 0.3683472, 1, 0, 0.007843138, 1
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
-0.5605865, -3.863388, -7.568649, 0, -0.5, 0.5, 0.5,
-0.5605865, -3.863388, -7.568649, 1, -0.5, 0.5, 0.5,
-0.5605865, -3.863388, -7.568649, 1, 1.5, 0.5, 0.5,
-0.5605865, -3.863388, -7.568649, 0, 1.5, 0.5, 0.5
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
-4.935427, 0.1962529, -7.568649, 0, -0.5, 0.5, 0.5,
-4.935427, 0.1962529, -7.568649, 1, -0.5, 0.5, 0.5,
-4.935427, 0.1962529, -7.568649, 1, 1.5, 0.5, 0.5,
-4.935427, 0.1962529, -7.568649, 0, 1.5, 0.5, 0.5
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
-4.935427, -3.863388, -0.0684793, 0, -0.5, 0.5, 0.5,
-4.935427, -3.863388, -0.0684793, 1, -0.5, 0.5, 0.5,
-4.935427, -3.863388, -0.0684793, 1, 1.5, 0.5, 0.5,
-4.935427, -3.863388, -0.0684793, 0, 1.5, 0.5, 0.5
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
-3, -2.926548, -5.837841,
2, -2.926548, -5.837841,
-3, -2.926548, -5.837841,
-3, -3.082688, -6.126309,
-2, -2.926548, -5.837841,
-2, -3.082688, -6.126309,
-1, -2.926548, -5.837841,
-1, -3.082688, -6.126309,
0, -2.926548, -5.837841,
0, -3.082688, -6.126309,
1, -2.926548, -5.837841,
1, -3.082688, -6.126309,
2, -2.926548, -5.837841,
2, -3.082688, -6.126309
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
-3, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
-3, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
-3, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
-3, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5,
-2, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
-2, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
-2, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
-2, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5,
-1, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
-1, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
-1, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
-1, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5,
0, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
0, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
0, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
0, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5,
1, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
1, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
1, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
1, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5,
2, -3.394968, -6.703245, 0, -0.5, 0.5, 0.5,
2, -3.394968, -6.703245, 1, -0.5, 0.5, 0.5,
2, -3.394968, -6.703245, 1, 1.5, 0.5, 0.5,
2, -3.394968, -6.703245, 0, 1.5, 0.5, 0.5
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
-3.925848, -2, -5.837841,
-3.925848, 3, -5.837841,
-3.925848, -2, -5.837841,
-4.094111, -2, -6.126309,
-3.925848, -1, -5.837841,
-4.094111, -1, -6.126309,
-3.925848, 0, -5.837841,
-4.094111, 0, -6.126309,
-3.925848, 1, -5.837841,
-4.094111, 1, -6.126309,
-3.925848, 2, -5.837841,
-4.094111, 2, -6.126309,
-3.925848, 3, -5.837841,
-4.094111, 3, -6.126309
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
-4.430637, -2, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, -2, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, -2, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, -2, -6.703245, 0, 1.5, 0.5, 0.5,
-4.430637, -1, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, -1, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, -1, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, -1, -6.703245, 0, 1.5, 0.5, 0.5,
-4.430637, 0, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, 0, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, 0, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, 0, -6.703245, 0, 1.5, 0.5, 0.5,
-4.430637, 1, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, 1, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, 1, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, 1, -6.703245, 0, 1.5, 0.5, 0.5,
-4.430637, 2, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, 2, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, 2, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, 2, -6.703245, 0, 1.5, 0.5, 0.5,
-4.430637, 3, -6.703245, 0, -0.5, 0.5, 0.5,
-4.430637, 3, -6.703245, 1, -0.5, 0.5, 0.5,
-4.430637, 3, -6.703245, 1, 1.5, 0.5, 0.5,
-4.430637, 3, -6.703245, 0, 1.5, 0.5, 0.5
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
-3.925848, -2.926548, -4,
-3.925848, -2.926548, 4,
-3.925848, -2.926548, -4,
-4.094111, -3.082688, -4,
-3.925848, -2.926548, -2,
-4.094111, -3.082688, -2,
-3.925848, -2.926548, 0,
-4.094111, -3.082688, 0,
-3.925848, -2.926548, 2,
-4.094111, -3.082688, 2,
-3.925848, -2.926548, 4,
-4.094111, -3.082688, 4
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
-4.430637, -3.394968, -4, 0, -0.5, 0.5, 0.5,
-4.430637, -3.394968, -4, 1, -0.5, 0.5, 0.5,
-4.430637, -3.394968, -4, 1, 1.5, 0.5, 0.5,
-4.430637, -3.394968, -4, 0, 1.5, 0.5, 0.5,
-4.430637, -3.394968, -2, 0, -0.5, 0.5, 0.5,
-4.430637, -3.394968, -2, 1, -0.5, 0.5, 0.5,
-4.430637, -3.394968, -2, 1, 1.5, 0.5, 0.5,
-4.430637, -3.394968, -2, 0, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 0, 0, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 0, 1, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 0, 1, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 0, 0, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 2, 0, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 2, 1, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 2, 1, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 2, 0, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 4, 0, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 4, 1, -0.5, 0.5, 0.5,
-4.430637, -3.394968, 4, 1, 1.5, 0.5, 0.5,
-4.430637, -3.394968, 4, 0, 1.5, 0.5, 0.5
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
-3.925848, -2.926548, -5.837841,
-3.925848, 3.319053, -5.837841,
-3.925848, -2.926548, 5.700882,
-3.925848, 3.319053, 5.700882,
-3.925848, -2.926548, -5.837841,
-3.925848, -2.926548, 5.700882,
-3.925848, 3.319053, -5.837841,
-3.925848, 3.319053, 5.700882,
-3.925848, -2.926548, -5.837841,
2.804675, -2.926548, -5.837841,
-3.925848, -2.926548, 5.700882,
2.804675, -2.926548, 5.700882,
-3.925848, 3.319053, -5.837841,
2.804675, 3.319053, -5.837841,
-3.925848, 3.319053, 5.700882,
2.804675, 3.319053, 5.700882,
2.804675, -2.926548, -5.837841,
2.804675, 3.319053, -5.837841,
2.804675, -2.926548, 5.700882,
2.804675, 3.319053, 5.700882,
2.804675, -2.926548, -5.837841,
2.804675, -2.926548, 5.700882,
2.804675, 3.319053, -5.837841,
2.804675, 3.319053, 5.700882
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
var radius = 7.87417;
var distance = 35.03307;
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
mvMatrix.translate( 0.5605865, -0.1962529, 0.0684793 );
mvMatrix.scale( 1.26494, 1.363153, 0.7378379 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03307);
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
Prallethrin<-read.table("Prallethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Prallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
y<-Prallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
```

```r
z<-Prallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prallethrin' not found
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
-3.827831, -0.475409, -2.138248, 0, 0, 1, 1, 1,
-3.244529, 0.1129202, -1.913738, 1, 0, 0, 1, 1,
-2.745687, 1.065511, -1.411273, 1, 0, 0, 1, 1,
-2.631758, -0.2661236, -4.216662, 1, 0, 0, 1, 1,
-2.564965, 1.905136, -2.275486, 1, 0, 0, 1, 1,
-2.525165, 0.5661619, -1.296536, 1, 0, 0, 1, 1,
-2.49916, 2.052184, -2.096073, 0, 0, 0, 1, 1,
-2.489043, -0.6806458, -2.200608, 0, 0, 0, 1, 1,
-2.473609, -1.015664, -1.525757, 0, 0, 0, 1, 1,
-2.386366, -0.8390867, -0.0951867, 0, 0, 0, 1, 1,
-2.369722, 0.1589261, -0.5552138, 0, 0, 0, 1, 1,
-2.301406, 1.207987, -1.663829, 0, 0, 0, 1, 1,
-2.300474, -0.9949516, -0.3024848, 0, 0, 0, 1, 1,
-2.294388, 0.554063, -2.23932, 1, 1, 1, 1, 1,
-2.261693, 0.5469557, -4.086737, 1, 1, 1, 1, 1,
-2.234652, 0.03014967, -2.088471, 1, 1, 1, 1, 1,
-2.174129, -1.437195, -4.211042, 1, 1, 1, 1, 1,
-2.154547, -1.74649, -3.563828, 1, 1, 1, 1, 1,
-2.122846, -1.097372, -2.588479, 1, 1, 1, 1, 1,
-2.099999, 0.04996492, -2.021049, 1, 1, 1, 1, 1,
-2.091646, -0.9418252, -0.7853907, 1, 1, 1, 1, 1,
-2.030247, 0.9468222, 0.3596345, 1, 1, 1, 1, 1,
-1.95682, -0.6202952, -1.624028, 1, 1, 1, 1, 1,
-1.951417, -0.6799765, -2.133917, 1, 1, 1, 1, 1,
-1.897158, 0.3736573, -1.820493, 1, 1, 1, 1, 1,
-1.884172, 2.031439, 0.3646559, 1, 1, 1, 1, 1,
-1.8696, 0.2230107, -0.765458, 1, 1, 1, 1, 1,
-1.868058, -0.196948, -1.803781, 1, 1, 1, 1, 1,
-1.858421, 0.05793333, -0.6646703, 0, 0, 1, 1, 1,
-1.856365, -1.089616, -0.8266304, 1, 0, 0, 1, 1,
-1.83207, -1.276369, -1.908508, 1, 0, 0, 1, 1,
-1.804731, -1.494967, -1.825156, 1, 0, 0, 1, 1,
-1.804423, -0.04963358, -0.6815399, 1, 0, 0, 1, 1,
-1.783995, 1.060709, 0.3174796, 1, 0, 0, 1, 1,
-1.779495, -0.4893503, -1.277756, 0, 0, 0, 1, 1,
-1.776915, 0.9925858, 0.3300593, 0, 0, 0, 1, 1,
-1.77338, -1.798733, -2.921956, 0, 0, 0, 1, 1,
-1.762595, 0.8852521, -1.67883, 0, 0, 0, 1, 1,
-1.758482, -0.3559386, -2.116161, 0, 0, 0, 1, 1,
-1.747412, 1.366592, 0.7101178, 0, 0, 0, 1, 1,
-1.727665, 0.4151489, -1.802326, 0, 0, 0, 1, 1,
-1.721741, -0.641359, -0.7643414, 1, 1, 1, 1, 1,
-1.715587, 0.5961016, -0.5239538, 1, 1, 1, 1, 1,
-1.707968, 0.9536296, -1.81258, 1, 1, 1, 1, 1,
-1.705201, 0.9821593, -1.387217, 1, 1, 1, 1, 1,
-1.701426, 0.2933645, 0.5353855, 1, 1, 1, 1, 1,
-1.684047, -1.31621, -1.431968, 1, 1, 1, 1, 1,
-1.676167, -0.3715103, -2.421252, 1, 1, 1, 1, 1,
-1.675735, -0.206181, -1.543621, 1, 1, 1, 1, 1,
-1.671066, -0.3921019, -0.7255419, 1, 1, 1, 1, 1,
-1.666862, -1.492111, -2.50855, 1, 1, 1, 1, 1,
-1.658442, 1.092992, -1.2721, 1, 1, 1, 1, 1,
-1.649336, 0.4786499, -0.7723892, 1, 1, 1, 1, 1,
-1.643815, -0.2972592, -0.628794, 1, 1, 1, 1, 1,
-1.59814, -0.1619575, -2.432108, 1, 1, 1, 1, 1,
-1.590395, -1.361767, -2.337319, 1, 1, 1, 1, 1,
-1.586163, 0.2486904, -2.598984, 0, 0, 1, 1, 1,
-1.584453, -0.9548595, -1.380589, 1, 0, 0, 1, 1,
-1.5828, -0.275081, -0.4167262, 1, 0, 0, 1, 1,
-1.58143, 0.3434147, -0.3706291, 1, 0, 0, 1, 1,
-1.577535, -1.957296, -2.66206, 1, 0, 0, 1, 1,
-1.572326, 0.4911379, -0.938664, 1, 0, 0, 1, 1,
-1.546936, 0.1088246, -1.502896, 0, 0, 0, 1, 1,
-1.541215, -2.172874, -3.465459, 0, 0, 0, 1, 1,
-1.533612, -0.7693055, -2.954678, 0, 0, 0, 1, 1,
-1.52881, -0.7558476, -0.5975703, 0, 0, 0, 1, 1,
-1.475452, -0.8435538, -2.531872, 0, 0, 0, 1, 1,
-1.469455, -0.933049, -3.25473, 0, 0, 0, 1, 1,
-1.462226, -0.5963467, -0.2964982, 0, 0, 0, 1, 1,
-1.446749, 0.4601266, -2.300747, 1, 1, 1, 1, 1,
-1.434664, -1.219854, -3.150329, 1, 1, 1, 1, 1,
-1.434004, -0.4914029, -3.31997, 1, 1, 1, 1, 1,
-1.422602, -0.01158812, -1.310063, 1, 1, 1, 1, 1,
-1.422536, -0.7344981, -1.029998, 1, 1, 1, 1, 1,
-1.415874, 1.869462, -1.180239, 1, 1, 1, 1, 1,
-1.410671, 1.315812, -0.7707266, 1, 1, 1, 1, 1,
-1.410035, -0.4035359, -2.231612, 1, 1, 1, 1, 1,
-1.408322, -0.6129233, -0.2457718, 1, 1, 1, 1, 1,
-1.392562, -0.4549031, 0.3105521, 1, 1, 1, 1, 1,
-1.371502, -0.54669, -0.4689524, 1, 1, 1, 1, 1,
-1.37038, 0.2747064, -0.1251466, 1, 1, 1, 1, 1,
-1.367871, -1.195163, -1.96268, 1, 1, 1, 1, 1,
-1.363903, -1.147816, -0.798922, 1, 1, 1, 1, 1,
-1.362203, 0.8941192, 0.3558468, 1, 1, 1, 1, 1,
-1.357245, 0.4557049, -3.010425, 0, 0, 1, 1, 1,
-1.34324, -1.31397, -3.219168, 1, 0, 0, 1, 1,
-1.323153, 0.9156165, -0.8671995, 1, 0, 0, 1, 1,
-1.301982, -1.61911, -2.757612, 1, 0, 0, 1, 1,
-1.295745, -1.839819, -1.591799, 1, 0, 0, 1, 1,
-1.287438, -0.3692668, -2.461736, 1, 0, 0, 1, 1,
-1.285877, 0.1457718, -1.715384, 0, 0, 0, 1, 1,
-1.284478, 0.108511, -0.8698288, 0, 0, 0, 1, 1,
-1.277952, -0.7767369, -1.669184, 0, 0, 0, 1, 1,
-1.270893, -1.479421, -2.517532, 0, 0, 0, 1, 1,
-1.263923, 0.9636011, -1.984797, 0, 0, 0, 1, 1,
-1.26278, -0.2069861, -1.117678, 0, 0, 0, 1, 1,
-1.258301, -0.1170137, -1.836024, 0, 0, 0, 1, 1,
-1.244717, 0.3279519, 0.8362322, 1, 1, 1, 1, 1,
-1.236141, -1.240991, -3.319475, 1, 1, 1, 1, 1,
-1.229755, 0.5350437, -2.037168, 1, 1, 1, 1, 1,
-1.21988, -2.35786, -1.602951, 1, 1, 1, 1, 1,
-1.219096, 0.3841576, -0.4870713, 1, 1, 1, 1, 1,
-1.216828, 0.5288551, -0.3654928, 1, 1, 1, 1, 1,
-1.215107, 0.2524889, -0.5044104, 1, 1, 1, 1, 1,
-1.211335, -0.3365167, -1.48401, 1, 1, 1, 1, 1,
-1.21045, 0.8593253, -1.75513, 1, 1, 1, 1, 1,
-1.205975, -1.376583, -2.191169, 1, 1, 1, 1, 1,
-1.199358, 0.1384336, -0.3856434, 1, 1, 1, 1, 1,
-1.195575, 1.089249, -1.366727, 1, 1, 1, 1, 1,
-1.189527, 0.5841125, -1.347089, 1, 1, 1, 1, 1,
-1.186008, 1.010209, 1.246101, 1, 1, 1, 1, 1,
-1.18237, 0.1302077, 0.06853313, 1, 1, 1, 1, 1,
-1.182195, 0.5887973, 0.2800296, 0, 0, 1, 1, 1,
-1.168799, 0.3727292, -2.041128, 1, 0, 0, 1, 1,
-1.168502, -0.2526616, -2.866672, 1, 0, 0, 1, 1,
-1.167656, -1.228623, -2.383685, 1, 0, 0, 1, 1,
-1.161448, 0.1925603, -1.154753, 1, 0, 0, 1, 1,
-1.160988, -0.7266616, -0.487543, 1, 0, 0, 1, 1,
-1.156818, 0.4700042, -2.473602, 0, 0, 0, 1, 1,
-1.153556, -1.263121, -1.874928, 0, 0, 0, 1, 1,
-1.153091, -0.5342203, -2.10432, 0, 0, 0, 1, 1,
-1.147712, 2.141867, -1.935985, 0, 0, 0, 1, 1,
-1.147331, 0.2651485, -1.054364, 0, 0, 0, 1, 1,
-1.145193, 0.9632786, -1.783312, 0, 0, 0, 1, 1,
-1.145088, 0.1213286, 0.01669695, 0, 0, 0, 1, 1,
-1.125866, 1.035823, 0.4087731, 1, 1, 1, 1, 1,
-1.123053, 0.1050734, -3.216754, 1, 1, 1, 1, 1,
-1.117804, -0.2063187, -1.778921, 1, 1, 1, 1, 1,
-1.114263, 1.92739, 0.179887, 1, 1, 1, 1, 1,
-1.113242, -0.08957903, -0.3162451, 1, 1, 1, 1, 1,
-1.108454, -0.8103384, -2.374649, 1, 1, 1, 1, 1,
-1.107477, 0.5959231, -0.8110956, 1, 1, 1, 1, 1,
-1.105107, 0.5711055, -2.00848, 1, 1, 1, 1, 1,
-1.095218, -0.4039768, -1.108367, 1, 1, 1, 1, 1,
-1.093224, -0.6571623, -3.083322, 1, 1, 1, 1, 1,
-1.078818, 0.8274406, -2.763316, 1, 1, 1, 1, 1,
-1.074247, 0.3639081, -2.153818, 1, 1, 1, 1, 1,
-1.072745, 0.09925098, 0.3765826, 1, 1, 1, 1, 1,
-1.068729, -1.674146, -4.659644, 1, 1, 1, 1, 1,
-1.068018, -1.356181, -4.483368, 1, 1, 1, 1, 1,
-1.06732, -0.03596844, -1.570813, 0, 0, 1, 1, 1,
-1.058609, -0.9404797, -2.429964, 1, 0, 0, 1, 1,
-1.057757, 1.678147, -1.081762, 1, 0, 0, 1, 1,
-1.056761, 0.006827187, -0.8322808, 1, 0, 0, 1, 1,
-1.050139, -0.1264763, -1.442438, 1, 0, 0, 1, 1,
-1.049439, 1.87818, -0.9806046, 1, 0, 0, 1, 1,
-1.049134, -0.5565341, -1.741367, 0, 0, 0, 1, 1,
-1.044664, 0.2396333, -1.395385, 0, 0, 0, 1, 1,
-1.043515, -0.1465566, -1.886363, 0, 0, 0, 1, 1,
-1.041797, 0.7864016, -0.8577811, 0, 0, 0, 1, 1,
-1.040415, 0.8909989, -1.062118, 0, 0, 0, 1, 1,
-1.038247, 0.5166209, -1.127503, 0, 0, 0, 1, 1,
-1.035344, 0.03839945, -1.088456, 0, 0, 0, 1, 1,
-1.032452, -0.24399, -1.950672, 1, 1, 1, 1, 1,
-1.029647, -0.3833635, -4.141838, 1, 1, 1, 1, 1,
-1.028543, 1.250983, -0.3845416, 1, 1, 1, 1, 1,
-1.015855, -1.208054, -2.094705, 1, 1, 1, 1, 1,
-1.006918, 1.724765, -0.503983, 1, 1, 1, 1, 1,
-1.004132, -0.1249794, -1.080249, 1, 1, 1, 1, 1,
-1.002548, -0.2813205, -0.6405978, 1, 1, 1, 1, 1,
-0.9964812, 1.190992, 0.4085793, 1, 1, 1, 1, 1,
-0.9926967, 0.687039, -1.74084, 1, 1, 1, 1, 1,
-0.9912624, -0.5620285, -0.8554324, 1, 1, 1, 1, 1,
-0.987841, -1.193478, -3.301558, 1, 1, 1, 1, 1,
-0.9855555, 1.167171, -1.871115, 1, 1, 1, 1, 1,
-0.9800358, 2.257555, -1.265272, 1, 1, 1, 1, 1,
-0.9791313, 0.02864753, -1.413216, 1, 1, 1, 1, 1,
-0.9733101, -0.6714844, -3.811133, 1, 1, 1, 1, 1,
-0.9725037, -0.06169613, -1.514936, 0, 0, 1, 1, 1,
-0.9724601, 0.1284276, 0.02907198, 1, 0, 0, 1, 1,
-0.9615299, 1.114254, -1.563519, 1, 0, 0, 1, 1,
-0.9554437, 0.7162648, -0.1529869, 1, 0, 0, 1, 1,
-0.9509906, -0.3860033, -3.224259, 1, 0, 0, 1, 1,
-0.9442803, 0.01668711, -2.342567, 1, 0, 0, 1, 1,
-0.9435773, 0.4826068, -0.895267, 0, 0, 0, 1, 1,
-0.9422728, 1.374236, -0.1675525, 0, 0, 0, 1, 1,
-0.9302388, 0.5250981, 0.2641102, 0, 0, 0, 1, 1,
-0.929011, 1.79877, 0.708808, 0, 0, 0, 1, 1,
-0.9253401, 1.881596, -1.220657, 0, 0, 0, 1, 1,
-0.9167058, 0.3118324, -1.69708, 0, 0, 0, 1, 1,
-0.9141226, 0.4670815, 0.01067596, 0, 0, 0, 1, 1,
-0.9099826, 0.4388149, -0.3675897, 1, 1, 1, 1, 1,
-0.9088525, -1.150425, -1.784578, 1, 1, 1, 1, 1,
-0.9045678, 1.016119, 0.8010964, 1, 1, 1, 1, 1,
-0.8921227, 1.78762, -0.039928, 1, 1, 1, 1, 1,
-0.8911988, -1.428367, -1.147749, 1, 1, 1, 1, 1,
-0.8911181, 0.9702014, -2.675287, 1, 1, 1, 1, 1,
-0.8856116, -0.1604663, -0.9161109, 1, 1, 1, 1, 1,
-0.8790461, 1.360887, -0.9956883, 1, 1, 1, 1, 1,
-0.8786853, 0.3655619, -0.9154182, 1, 1, 1, 1, 1,
-0.856956, 0.3655364, 0.4239402, 1, 1, 1, 1, 1,
-0.8552526, 2.660998, -1.544157, 1, 1, 1, 1, 1,
-0.8481571, -0.1446499, -3.276094, 1, 1, 1, 1, 1,
-0.8393384, 0.1364362, -1.6014, 1, 1, 1, 1, 1,
-0.8334547, 0.812267, -0.3283745, 1, 1, 1, 1, 1,
-0.8313503, -1.566377, -2.748074, 1, 1, 1, 1, 1,
-0.8308163, 1.178422, -0.5725071, 0, 0, 1, 1, 1,
-0.8286776, 0.1149462, -0.5615049, 1, 0, 0, 1, 1,
-0.8227457, 1.064977, 0.4302925, 1, 0, 0, 1, 1,
-0.8226563, 0.2730045, -1.188723, 1, 0, 0, 1, 1,
-0.8213016, 0.04015945, 0.2610081, 1, 0, 0, 1, 1,
-0.8181144, 0.8971918, -0.6764621, 1, 0, 0, 1, 1,
-0.8128186, -0.05228639, -2.027917, 0, 0, 0, 1, 1,
-0.812608, 1.456833, 0.7978975, 0, 0, 0, 1, 1,
-0.8124322, 2.300827, 0.5062708, 0, 0, 0, 1, 1,
-0.8105687, 0.6500597, 0.3673622, 0, 0, 0, 1, 1,
-0.8088158, 2.320675, 0.742434, 0, 0, 0, 1, 1,
-0.8031216, 1.624843, 0.4144454, 0, 0, 0, 1, 1,
-0.8029643, -0.6128814, -1.152201, 0, 0, 0, 1, 1,
-0.8007241, 1.198208, -0.5868304, 1, 1, 1, 1, 1,
-0.8006234, 0.1457348, -1.482608, 1, 1, 1, 1, 1,
-0.7938172, -0.559895, -0.6654246, 1, 1, 1, 1, 1,
-0.7915198, 0.6357159, -0.5710512, 1, 1, 1, 1, 1,
-0.7903317, 1.217088, -2.065278, 1, 1, 1, 1, 1,
-0.7744087, -0.4106609, -2.771587, 1, 1, 1, 1, 1,
-0.7632354, 2.336096, -1.686263, 1, 1, 1, 1, 1,
-0.7469577, 0.4294849, 0.7822593, 1, 1, 1, 1, 1,
-0.7403266, 0.120249, 0.3980007, 1, 1, 1, 1, 1,
-0.7400023, -0.3452934, -0.4856813, 1, 1, 1, 1, 1,
-0.7391869, -0.08375753, 0.02994058, 1, 1, 1, 1, 1,
-0.7362247, 0.6677555, -0.7654291, 1, 1, 1, 1, 1,
-0.7350799, -0.5531949, -3.295814, 1, 1, 1, 1, 1,
-0.7333635, -0.7132013, -1.803075, 1, 1, 1, 1, 1,
-0.7330813, -0.634851, -4.380095, 1, 1, 1, 1, 1,
-0.731864, 1.351255, -0.5587279, 0, 0, 1, 1, 1,
-0.7292032, 0.4729495, -0.9878495, 1, 0, 0, 1, 1,
-0.7291316, 0.3741658, -0.9655334, 1, 0, 0, 1, 1,
-0.7282582, -1.954517, -3.414358, 1, 0, 0, 1, 1,
-0.7272723, -0.9478176, -2.093701, 1, 0, 0, 1, 1,
-0.7243913, -0.2412834, -1.114114, 1, 0, 0, 1, 1,
-0.7243363, -1.143048, -2.866185, 0, 0, 0, 1, 1,
-0.7232164, -0.9743232, -4.335592, 0, 0, 0, 1, 1,
-0.7172641, -0.3344635, -0.9768969, 0, 0, 0, 1, 1,
-0.7157592, 0.1002191, -2.232599, 0, 0, 0, 1, 1,
-0.7140071, -0.7208327, -3.396043, 0, 0, 0, 1, 1,
-0.7128145, -0.3040474, -3.508448, 0, 0, 0, 1, 1,
-0.6974537, -1.503033, -2.718653, 0, 0, 0, 1, 1,
-0.6969451, 2.181343, 0.2690321, 1, 1, 1, 1, 1,
-0.6963509, 0.7089626, 0.8276553, 1, 1, 1, 1, 1,
-0.6935026, 0.7849504, 0.8247576, 1, 1, 1, 1, 1,
-0.6854024, 0.4753991, 1.011534, 1, 1, 1, 1, 1,
-0.6850498, -0.4850149, -2.745093, 1, 1, 1, 1, 1,
-0.6820313, -0.1311669, -1.828179, 1, 1, 1, 1, 1,
-0.6741064, -0.4616749, -2.092368, 1, 1, 1, 1, 1,
-0.672753, 0.9805678, 0.02138664, 1, 1, 1, 1, 1,
-0.6687617, 0.1033949, -0.3953753, 1, 1, 1, 1, 1,
-0.6671194, -1.741471, -2.75234, 1, 1, 1, 1, 1,
-0.6668183, -1.707362, -2.058002, 1, 1, 1, 1, 1,
-0.6662217, -1.701498, -4.673814, 1, 1, 1, 1, 1,
-0.6647869, -0.6209097, -2.831537, 1, 1, 1, 1, 1,
-0.6620901, -0.7651006, -1.463969, 1, 1, 1, 1, 1,
-0.6605582, -0.56699, -2.210184, 1, 1, 1, 1, 1,
-0.6588901, 1.411056, -0.9374313, 0, 0, 1, 1, 1,
-0.6539736, -0.812825, -2.403434, 1, 0, 0, 1, 1,
-0.6409819, -0.2285589, -0.9883837, 1, 0, 0, 1, 1,
-0.640208, -0.2239223, -2.58964, 1, 0, 0, 1, 1,
-0.639025, -0.179683, -3.923528, 1, 0, 0, 1, 1,
-0.6373217, 1.564067, -3.12631, 1, 0, 0, 1, 1,
-0.6300027, 1.372939, -1.145361, 0, 0, 0, 1, 1,
-0.6291118, -1.459864, -4.072429, 0, 0, 0, 1, 1,
-0.6290179, -1.556681, -2.438143, 0, 0, 0, 1, 1,
-0.6264693, -1.364162, -2.460071, 0, 0, 0, 1, 1,
-0.6240451, 0.1803837, -2.183636, 0, 0, 0, 1, 1,
-0.6219656, -0.2874378, -1.899955, 0, 0, 0, 1, 1,
-0.6139868, -0.5764608, -1.501251, 0, 0, 0, 1, 1,
-0.6118121, 0.01868446, -2.149808, 1, 1, 1, 1, 1,
-0.6078598, 0.2214493, -0.5502759, 1, 1, 1, 1, 1,
-0.6054615, -0.8102808, -2.775839, 1, 1, 1, 1, 1,
-0.6021827, 0.1177726, -0.6340362, 1, 1, 1, 1, 1,
-0.6020705, 0.6638409, 0.2786744, 1, 1, 1, 1, 1,
-0.600064, -0.4417173, -0.1168349, 1, 1, 1, 1, 1,
-0.5991112, -1.010299, -1.080544, 1, 1, 1, 1, 1,
-0.5980095, -0.0893046, -2.696927, 1, 1, 1, 1, 1,
-0.597805, -1.032304, -2.506508, 1, 1, 1, 1, 1,
-0.5931135, 1.086469, -1.384912, 1, 1, 1, 1, 1,
-0.5909945, -0.5140771, -1.981292, 1, 1, 1, 1, 1,
-0.5869807, 0.6741401, -0.8565621, 1, 1, 1, 1, 1,
-0.5798674, 0.2918618, -1.029462, 1, 1, 1, 1, 1,
-0.5797547, -0.2407048, -1.390135, 1, 1, 1, 1, 1,
-0.5789117, -0.08783149, -1.76698, 1, 1, 1, 1, 1,
-0.5736806, 0.8223279, -2.177576, 0, 0, 1, 1, 1,
-0.5622041, -0.08293892, -1.203016, 1, 0, 0, 1, 1,
-0.5592405, 1.116214, 0.5869058, 1, 0, 0, 1, 1,
-0.5570167, -0.6170929, -4.856514, 1, 0, 0, 1, 1,
-0.5422471, -1.219758, -4.057735, 1, 0, 0, 1, 1,
-0.5395073, 0.3932138, -0.9773962, 1, 0, 0, 1, 1,
-0.533082, 0.1080201, -0.9738548, 0, 0, 0, 1, 1,
-0.526472, 1.399548, -1.520636, 0, 0, 0, 1, 1,
-0.5251576, -0.0578778, -2.036843, 0, 0, 0, 1, 1,
-0.5224884, 1.130648, 1.320717, 0, 0, 0, 1, 1,
-0.5192186, -1.337165, -3.460455, 0, 0, 0, 1, 1,
-0.5160325, -0.5399589, -2.961406, 0, 0, 0, 1, 1,
-0.5095746, 0.4797786, -0.3075093, 0, 0, 0, 1, 1,
-0.5091653, 0.3771143, -1.918923, 1, 1, 1, 1, 1,
-0.5027422, 0.7073785, -0.3433049, 1, 1, 1, 1, 1,
-0.500935, -1.173003, -2.892744, 1, 1, 1, 1, 1,
-0.4998829, 0.6628075, 0.6235152, 1, 1, 1, 1, 1,
-0.4979857, -0.01701399, -1.164661, 1, 1, 1, 1, 1,
-0.4969788, 1.349288, 0.4356698, 1, 1, 1, 1, 1,
-0.494645, 2.096834, -0.8259003, 1, 1, 1, 1, 1,
-0.4941061, -0.9533858, -4.561473, 1, 1, 1, 1, 1,
-0.4941031, -1.544235, -1.960787, 1, 1, 1, 1, 1,
-0.4932288, 1.935562, 0.3374113, 1, 1, 1, 1, 1,
-0.4890921, 1.08355, -0.1154923, 1, 1, 1, 1, 1,
-0.4872309, -1.059086, -3.348083, 1, 1, 1, 1, 1,
-0.4862112, 0.8489615, -0.6983715, 1, 1, 1, 1, 1,
-0.4823383, -0.7228907, -3.511827, 1, 1, 1, 1, 1,
-0.4819496, -0.5957888, -3.505685, 1, 1, 1, 1, 1,
-0.481148, -0.1478866, -1.140533, 0, 0, 1, 1, 1,
-0.4806527, 0.8123714, -0.1237823, 1, 0, 0, 1, 1,
-0.4782227, -1.424888, -3.788309, 1, 0, 0, 1, 1,
-0.4747001, 0.6195608, -0.5997898, 1, 0, 0, 1, 1,
-0.4705359, -1.117664, -2.096313, 1, 0, 0, 1, 1,
-0.4685082, -0.5887412, -2.983148, 1, 0, 0, 1, 1,
-0.466818, 1.106153, -1.733612, 0, 0, 0, 1, 1,
-0.4645353, -2.078122, -2.449617, 0, 0, 0, 1, 1,
-0.4641186, -0.5769758, -1.553164, 0, 0, 0, 1, 1,
-0.4634645, -1.086436, -2.914118, 0, 0, 0, 1, 1,
-0.46235, 1.217312, 0.1043013, 0, 0, 0, 1, 1,
-0.4586701, -0.2394392, -2.723413, 0, 0, 0, 1, 1,
-0.4553148, -0.6428337, -0.8692751, 0, 0, 0, 1, 1,
-0.4537334, -1.682009, -2.847961, 1, 1, 1, 1, 1,
-0.4460644, -2.697011, -2.227318, 1, 1, 1, 1, 1,
-0.4425945, -0.8288741, -0.7730823, 1, 1, 1, 1, 1,
-0.4422866, -0.8291125, -3.614933, 1, 1, 1, 1, 1,
-0.4325934, 1.493897, -0.2193099, 1, 1, 1, 1, 1,
-0.4304037, -1.072648, -3.012984, 1, 1, 1, 1, 1,
-0.4254417, 1.075606, 2.028659, 1, 1, 1, 1, 1,
-0.4239691, -0.1703697, 0.2449064, 1, 1, 1, 1, 1,
-0.4211272, -0.574151, -3.649215, 1, 1, 1, 1, 1,
-0.4164081, 1.261374, -0.1639139, 1, 1, 1, 1, 1,
-0.4154316, 0.1802898, -1.996206, 1, 1, 1, 1, 1,
-0.4137099, 1.176661, 0.06142432, 1, 1, 1, 1, 1,
-0.4110954, 1.01024, -0.4461768, 1, 1, 1, 1, 1,
-0.410256, 0.6152506, -1.12004, 1, 1, 1, 1, 1,
-0.4100888, -0.07429183, -2.779844, 1, 1, 1, 1, 1,
-0.4079992, 0.309599, 0.06972001, 0, 0, 1, 1, 1,
-0.3998207, -0.01739497, -1.4386, 1, 0, 0, 1, 1,
-0.3932267, 0.01001642, -0.6970815, 1, 0, 0, 1, 1,
-0.3921331, -1.15977, -2.146353, 1, 0, 0, 1, 1,
-0.3913946, -1.039735, -3.108112, 1, 0, 0, 1, 1,
-0.3887498, -0.781857, -3.561186, 1, 0, 0, 1, 1,
-0.3847428, -0.06716254, -2.229029, 0, 0, 0, 1, 1,
-0.3839719, -1.15566, -3.20332, 0, 0, 0, 1, 1,
-0.3833563, 0.04845225, -3.070573, 0, 0, 0, 1, 1,
-0.3812482, -1.99876, -3.219167, 0, 0, 0, 1, 1,
-0.3791399, 0.2044519, -2.235291, 0, 0, 0, 1, 1,
-0.3770696, -0.2955184, -0.9057996, 0, 0, 0, 1, 1,
-0.3737953, 0.2032094, -2.566832, 0, 0, 0, 1, 1,
-0.3661639, 0.2366764, -1.276148, 1, 1, 1, 1, 1,
-0.3660116, 0.4732555, -0.2107808, 1, 1, 1, 1, 1,
-0.3616646, 0.3623571, -3.064398, 1, 1, 1, 1, 1,
-0.3585438, 1.234324, -2.103919, 1, 1, 1, 1, 1,
-0.3504652, -0.6351452, -3.560964, 1, 1, 1, 1, 1,
-0.3483219, 0.6822997, -2.483997, 1, 1, 1, 1, 1,
-0.3473313, 0.7906905, 0.4517282, 1, 1, 1, 1, 1,
-0.3458371, 1.239248, -1.110132, 1, 1, 1, 1, 1,
-0.3420478, -0.5879171, -3.651243, 1, 1, 1, 1, 1,
-0.3407722, 0.6698387, -1.440345, 1, 1, 1, 1, 1,
-0.340499, -0.7935876, -0.8969992, 1, 1, 1, 1, 1,
-0.3374893, 0.2999744, 0.4564989, 1, 1, 1, 1, 1,
-0.3365331, 1.277466, -0.09531462, 1, 1, 1, 1, 1,
-0.3364863, 1.340031, 0.9691666, 1, 1, 1, 1, 1,
-0.3362616, -0.2613539, -2.820584, 1, 1, 1, 1, 1,
-0.3326298, -1.730383, -2.179979, 0, 0, 1, 1, 1,
-0.3319615, -0.04616047, -2.753672, 1, 0, 0, 1, 1,
-0.3294643, 0.704726, 0.4428291, 1, 0, 0, 1, 1,
-0.3272631, 0.7789589, -0.1998186, 1, 0, 0, 1, 1,
-0.3256453, -1.68839, -0.7221943, 1, 0, 0, 1, 1,
-0.3174132, 0.2324308, -2.934582, 1, 0, 0, 1, 1,
-0.3063592, 0.01498866, -1.690386, 0, 0, 0, 1, 1,
-0.3057583, -0.7842945, -1.348063, 0, 0, 0, 1, 1,
-0.3033946, -0.4749512, -1.707017, 0, 0, 0, 1, 1,
-0.296687, 2.058139, -0.5056729, 0, 0, 0, 1, 1,
-0.2928728, 1.396863, -0.6893128, 0, 0, 0, 1, 1,
-0.2905546, -0.005582605, -1.230205, 0, 0, 0, 1, 1,
-0.2882009, -1.236809, -2.314887, 0, 0, 0, 1, 1,
-0.2869179, -0.6802164, -3.017359, 1, 1, 1, 1, 1,
-0.2849139, -1.121013, -3.551744, 1, 1, 1, 1, 1,
-0.2835251, 1.404988, 0.7769405, 1, 1, 1, 1, 1,
-0.2793029, 0.1260073, -1.557558, 1, 1, 1, 1, 1,
-0.2766436, 0.07220501, -1.072518, 1, 1, 1, 1, 1,
-0.2727476, 0.213682, -1.724999, 1, 1, 1, 1, 1,
-0.2720767, -1.977253, -3.140647, 1, 1, 1, 1, 1,
-0.2671024, -0.07229088, -1.553413, 1, 1, 1, 1, 1,
-0.2651473, 1.003966, -0.7329613, 1, 1, 1, 1, 1,
-0.2620308, -1.53526, -2.89441, 1, 1, 1, 1, 1,
-0.2609389, -0.02470426, -1.170587, 1, 1, 1, 1, 1,
-0.2586978, -1.709267, -4.64648, 1, 1, 1, 1, 1,
-0.2561382, 1.090496, -2.037686, 1, 1, 1, 1, 1,
-0.2517419, 0.5917175, -1.306805, 1, 1, 1, 1, 1,
-0.2515323, 0.5320803, -0.4488221, 1, 1, 1, 1, 1,
-0.2479876, -0.741742, -2.593959, 0, 0, 1, 1, 1,
-0.243597, -0.5022497, -2.112879, 1, 0, 0, 1, 1,
-0.238801, -0.541586, -2.807379, 1, 0, 0, 1, 1,
-0.2379928, 0.8694155, 1.589357, 1, 0, 0, 1, 1,
-0.2372125, -0.03649545, -2.364518, 1, 0, 0, 1, 1,
-0.2366776, -1.08008, -1.45821, 1, 0, 0, 1, 1,
-0.2341145, -1.208895, -4.696345, 0, 0, 0, 1, 1,
-0.2336285, 0.3774885, 1.020878, 0, 0, 0, 1, 1,
-0.232399, 1.795659, -0.4177722, 0, 0, 0, 1, 1,
-0.2267409, -1.328763, -2.171932, 0, 0, 0, 1, 1,
-0.2257886, 0.9992025, -1.892308, 0, 0, 0, 1, 1,
-0.2220105, 1.444224, -0.5583353, 0, 0, 0, 1, 1,
-0.2215329, 0.5948244, -1.134624, 0, 0, 0, 1, 1,
-0.2208548, 0.0907692, 0.05941932, 1, 1, 1, 1, 1,
-0.2181001, -1.043355, -5.592232, 1, 1, 1, 1, 1,
-0.2138043, -0.5685602, -3.025325, 1, 1, 1, 1, 1,
-0.2136447, -0.1123756, -0.411018, 1, 1, 1, 1, 1,
-0.2120049, -1.320306, -2.388671, 1, 1, 1, 1, 1,
-0.2118062, 0.4726571, -2.567077, 1, 1, 1, 1, 1,
-0.2084261, 0.490216, 0.7685921, 1, 1, 1, 1, 1,
-0.2057444, 0.8077426, -0.6246092, 1, 1, 1, 1, 1,
-0.2034657, -0.394252, -1.187838, 1, 1, 1, 1, 1,
-0.2033292, 0.2974309, -3.385317, 1, 1, 1, 1, 1,
-0.1975612, -1.935476, -2.661508, 1, 1, 1, 1, 1,
-0.1963364, 0.2870854, 0.2181356, 1, 1, 1, 1, 1,
-0.19389, -0.792121, -3.905674, 1, 1, 1, 1, 1,
-0.1933501, -0.6966624, -3.011301, 1, 1, 1, 1, 1,
-0.1925808, 1.003732, -0.37447, 1, 1, 1, 1, 1,
-0.191283, 0.9699696, -1.353431, 0, 0, 1, 1, 1,
-0.1910098, -0.320899, -2.374445, 1, 0, 0, 1, 1,
-0.1889208, -2.324048, -0.9066928, 1, 0, 0, 1, 1,
-0.1880002, -1.224395, -2.652647, 1, 0, 0, 1, 1,
-0.1875045, -0.6773829, -2.400058, 1, 0, 0, 1, 1,
-0.1869008, -1.600191, -4.412678, 1, 0, 0, 1, 1,
-0.1808415, 0.930085, 1.688915, 0, 0, 0, 1, 1,
-0.1803823, -0.9960745, -3.160835, 0, 0, 0, 1, 1,
-0.175351, -0.4912241, -2.817219, 0, 0, 0, 1, 1,
-0.1748546, 0.3183514, 1.49176, 0, 0, 0, 1, 1,
-0.1727145, 1.134532, 0.8990102, 0, 0, 0, 1, 1,
-0.1721065, 0.1207916, 1.708544, 0, 0, 0, 1, 1,
-0.1719286, 0.8544897, -0.4831804, 0, 0, 0, 1, 1,
-0.1693054, 0.1273376, -0.6709862, 1, 1, 1, 1, 1,
-0.1677608, 0.474506, 0.08712355, 1, 1, 1, 1, 1,
-0.1627555, 1.624886, -0.8483937, 1, 1, 1, 1, 1,
-0.1601693, -1.112788, -1.582838, 1, 1, 1, 1, 1,
-0.1595716, 0.2955202, 0.02874474, 1, 1, 1, 1, 1,
-0.1579012, -0.5234007, -2.312195, 1, 1, 1, 1, 1,
-0.1573721, 1.792058, 0.1757705, 1, 1, 1, 1, 1,
-0.1564407, 0.07442515, -2.740487, 1, 1, 1, 1, 1,
-0.1510942, 0.3457313, -1.394605, 1, 1, 1, 1, 1,
-0.1464582, 1.702249, -0.4520734, 1, 1, 1, 1, 1,
-0.1444146, -0.2154238, -1.303428, 1, 1, 1, 1, 1,
-0.1398791, -1.350885, -2.517491, 1, 1, 1, 1, 1,
-0.1391177, -0.2443243, -2.074825, 1, 1, 1, 1, 1,
-0.1368703, 1.196413, 1.242334, 1, 1, 1, 1, 1,
-0.1368206, 1.774035, -0.7930516, 1, 1, 1, 1, 1,
-0.1339866, 1.695979, -0.828486, 0, 0, 1, 1, 1,
-0.1328007, 1.65583, 0.8596872, 1, 0, 0, 1, 1,
-0.1307677, -0.4343244, -3.414727, 1, 0, 0, 1, 1,
-0.1263484, 0.1462696, 0.7084968, 1, 0, 0, 1, 1,
-0.1244984, 1.031329, 0.02157512, 1, 0, 0, 1, 1,
-0.1240497, -0.8857527, -4.166568, 1, 0, 0, 1, 1,
-0.1232783, 1.320495, -1.474439, 0, 0, 0, 1, 1,
-0.1191769, -0.1256165, -3.047086, 0, 0, 0, 1, 1,
-0.1160751, 2.694639, 1.139234, 0, 0, 0, 1, 1,
-0.1131571, -0.6982296, -4.159644, 0, 0, 0, 1, 1,
-0.1128569, -1.865953, -4.031171, 0, 0, 0, 1, 1,
-0.1120723, 0.9916425, -2.062056, 0, 0, 0, 1, 1,
-0.1085555, -0.9281589, -0.9314088, 0, 0, 0, 1, 1,
-0.1040556, 0.287406, -1.925095, 1, 1, 1, 1, 1,
-0.1022066, 0.8277102, 1.073524, 1, 1, 1, 1, 1,
-0.09942181, -0.7736182, -3.568771, 1, 1, 1, 1, 1,
-0.09759302, 0.6337107, -0.09800629, 1, 1, 1, 1, 1,
-0.09299225, -1.612023, -2.307675, 1, 1, 1, 1, 1,
-0.09158475, -0.4157616, -3.238986, 1, 1, 1, 1, 1,
-0.08997972, -0.1461194, -3.357589, 1, 1, 1, 1, 1,
-0.08685613, -2.068718, -2.169202, 1, 1, 1, 1, 1,
-0.08649774, 0.4607467, -0.07080166, 1, 1, 1, 1, 1,
-0.08116182, 0.922635, 0.4374167, 1, 1, 1, 1, 1,
-0.07960537, 0.9085705, -1.117518, 1, 1, 1, 1, 1,
-0.07406002, -1.441061, -2.300466, 1, 1, 1, 1, 1,
-0.07355008, 0.6823481, -0.6285508, 1, 1, 1, 1, 1,
-0.07018669, 0.8091404, -1.200526, 1, 1, 1, 1, 1,
-0.06956988, 0.9294038, -1.752321, 1, 1, 1, 1, 1,
-0.06714567, -0.2209067, -2.563213, 0, 0, 1, 1, 1,
-0.06687769, 0.8113414, -2.799987, 1, 0, 0, 1, 1,
-0.06654103, 0.3752586, -2.7953, 1, 0, 0, 1, 1,
-0.06648265, -0.4229184, -3.674101, 1, 0, 0, 1, 1,
-0.0655135, -1.363899, -4.062217, 1, 0, 0, 1, 1,
-0.06450254, 0.3625973, 1.109046, 1, 0, 0, 1, 1,
-0.06261322, -0.8039077, -3.67104, 0, 0, 0, 1, 1,
-0.06259689, 2.212375, 0.7094314, 0, 0, 0, 1, 1,
-0.06256176, -0.1895347, -1.295585, 0, 0, 0, 1, 1,
-0.05738975, -0.2522562, -2.888149, 0, 0, 0, 1, 1,
-0.05512763, 0.1533233, 2.342467, 0, 0, 0, 1, 1,
-0.05374346, 0.5841614, -0.2619703, 0, 0, 0, 1, 1,
-0.05292909, -0.05232946, -2.307371, 0, 0, 0, 1, 1,
-0.05002919, 0.08576442, -0.6775859, 1, 1, 1, 1, 1,
-0.04993661, 0.6419559, 1.415291, 1, 1, 1, 1, 1,
-0.0415372, -0.6856691, -1.916103, 1, 1, 1, 1, 1,
-0.03973298, -0.7974758, -2.88006, 1, 1, 1, 1, 1,
-0.0335046, -0.007677797, -1.662688, 1, 1, 1, 1, 1,
-0.03245206, -1.694172, -1.87, 1, 1, 1, 1, 1,
-0.02448482, -0.006649164, -0.307151, 1, 1, 1, 1, 1,
-0.02398618, 1.213837, -1.828477, 1, 1, 1, 1, 1,
-0.02187137, -0.3176145, -3.901106, 1, 1, 1, 1, 1,
-0.02017786, 0.9527014, -0.03326097, 1, 1, 1, 1, 1,
-0.01966139, -0.8193156, -1.908939, 1, 1, 1, 1, 1,
-0.01927476, -0.7118243, -4.322732, 1, 1, 1, 1, 1,
-0.0192692, -1.999141, -2.338495, 1, 1, 1, 1, 1,
-0.01621706, 0.8329635, -1.052264, 1, 1, 1, 1, 1,
-0.01546773, -0.6835301, -5.669801, 1, 1, 1, 1, 1,
-0.01380545, -1.700257, -2.770343, 0, 0, 1, 1, 1,
-0.01329807, -1.094012, -2.496806, 1, 0, 0, 1, 1,
-0.01313276, -0.9616092, -1.944499, 1, 0, 0, 1, 1,
-0.01172081, -0.3906619, -3.286124, 1, 0, 0, 1, 1,
-0.01091541, 1.371064, 0.02097848, 1, 0, 0, 1, 1,
-0.007956172, 0.02166343, -1.247304, 1, 0, 0, 1, 1,
-0.005404594, 0.6971276, 0.7248123, 0, 0, 0, 1, 1,
-0.003088651, 0.5949078, 0.6485675, 0, 0, 0, 1, 1,
-0.001747615, -0.1280433, -1.251409, 0, 0, 0, 1, 1,
-0.001461894, 0.1722657, 0.2291872, 0, 0, 0, 1, 1,
0.0008708054, -0.4311602, 3.255142, 0, 0, 0, 1, 1,
0.002447725, 1.671184, -1.211087, 0, 0, 0, 1, 1,
0.003434291, 0.2473134, 0.0246076, 0, 0, 0, 1, 1,
0.005438214, 0.04818947, 0.1707413, 1, 1, 1, 1, 1,
0.00602631, 0.2095907, -0.3920489, 1, 1, 1, 1, 1,
0.007811862, -0.9425733, 2.278226, 1, 1, 1, 1, 1,
0.008016918, 1.121022, 1.471947, 1, 1, 1, 1, 1,
0.01105457, -0.6851432, 2.988536, 1, 1, 1, 1, 1,
0.01320351, -1.195237, 3.028602, 1, 1, 1, 1, 1,
0.0163703, -1.56973, 3.80385, 1, 1, 1, 1, 1,
0.01751844, 1.181649, 0.03940528, 1, 1, 1, 1, 1,
0.01909062, 0.4261082, -0.3985214, 1, 1, 1, 1, 1,
0.02062764, -0.5256284, 4.991159, 1, 1, 1, 1, 1,
0.02503664, -1.102733, 2.470981, 1, 1, 1, 1, 1,
0.02760606, 1.359378, -0.6432217, 1, 1, 1, 1, 1,
0.02767861, -0.6001466, 2.095866, 1, 1, 1, 1, 1,
0.02775456, -0.6955715, 4.070615, 1, 1, 1, 1, 1,
0.02952642, 0.5298702, 0.5425286, 1, 1, 1, 1, 1,
0.03119246, -0.716667, 1.956241, 0, 0, 1, 1, 1,
0.0322771, 0.09238709, -0.7952816, 1, 0, 0, 1, 1,
0.03557291, 0.5016283, -1.724515, 1, 0, 0, 1, 1,
0.04840892, -0.4207909, 2.230016, 1, 0, 0, 1, 1,
0.05080679, -0.2647297, 3.381548, 1, 0, 0, 1, 1,
0.05565487, 0.7769302, 0.348181, 1, 0, 0, 1, 1,
0.05984249, -0.7487007, 2.462294, 0, 0, 0, 1, 1,
0.06005594, -1.368582, 2.105747, 0, 0, 0, 1, 1,
0.06106126, -0.2570781, 3.08875, 0, 0, 0, 1, 1,
0.06280955, -0.7305533, 2.365349, 0, 0, 0, 1, 1,
0.06290523, -1.796531, 4.171307, 0, 0, 0, 1, 1,
0.07553709, 0.2490256, 0.02141412, 0, 0, 0, 1, 1,
0.07903998, 0.8616062, 2.516531, 0, 0, 0, 1, 1,
0.07942312, -0.7346496, 2.463268, 1, 1, 1, 1, 1,
0.07990929, 0.3668953, -0.7742515, 1, 1, 1, 1, 1,
0.08245909, 1.433022, -1.088006, 1, 1, 1, 1, 1,
0.08247306, -0.7488798, 3.714994, 1, 1, 1, 1, 1,
0.08368203, 1.930165, 0.2618141, 1, 1, 1, 1, 1,
0.0909934, -0.6605371, 2.539258, 1, 1, 1, 1, 1,
0.09116982, 1.222242, 0.7970927, 1, 1, 1, 1, 1,
0.0913639, -0.2248673, 3.394357, 1, 1, 1, 1, 1,
0.09577206, -0.006466115, 1.375734, 1, 1, 1, 1, 1,
0.09728627, -0.3407249, 2.904101, 1, 1, 1, 1, 1,
0.09917823, 0.6574093, 1.665397, 1, 1, 1, 1, 1,
0.1043126, -0.9425143, 3.011533, 1, 1, 1, 1, 1,
0.1079613, -0.1496109, 2.660223, 1, 1, 1, 1, 1,
0.114597, -0.7927456, 2.937917, 1, 1, 1, 1, 1,
0.1178762, 0.6752762, -0.1016471, 1, 1, 1, 1, 1,
0.1179479, -0.7875412, 2.0782, 0, 0, 1, 1, 1,
0.1187684, 0.9514879, -0.1408251, 1, 0, 0, 1, 1,
0.1196003, 0.4590408, 0.9834343, 1, 0, 0, 1, 1,
0.1251117, 0.5719092, -0.5826721, 1, 0, 0, 1, 1,
0.125112, -1.485014, 2.718837, 1, 0, 0, 1, 1,
0.1308102, -0.5055283, 3.365383, 1, 0, 0, 1, 1,
0.1390622, -0.06916268, 0.9361872, 0, 0, 0, 1, 1,
0.1446044, -1.189676, 2.960319, 0, 0, 0, 1, 1,
0.1462786, -1.057818, 0.3168507, 0, 0, 0, 1, 1,
0.1496905, 1.061525, 0.1919932, 0, 0, 0, 1, 1,
0.1501052, 0.281419, -0.4345947, 0, 0, 0, 1, 1,
0.1524934, -0.4295813, 1.392966, 0, 0, 0, 1, 1,
0.1531131, 0.04161115, 0.9115554, 0, 0, 0, 1, 1,
0.1545599, 3.020559, -1.254128, 1, 1, 1, 1, 1,
0.1549793, 1.667287, -0.6245488, 1, 1, 1, 1, 1,
0.1560857, -0.1036913, 4.199376, 1, 1, 1, 1, 1,
0.1572009, 0.5162592, 2.039214, 1, 1, 1, 1, 1,
0.1576526, -0.1069853, 1.100399, 1, 1, 1, 1, 1,
0.1595235, -1.384212, 4.331482, 1, 1, 1, 1, 1,
0.166877, -0.260657, 2.883745, 1, 1, 1, 1, 1,
0.1717157, 1.039963, -1.471091, 1, 1, 1, 1, 1,
0.1739256, 0.1889679, 1.541833, 1, 1, 1, 1, 1,
0.1741488, 0.2027862, 1.439366, 1, 1, 1, 1, 1,
0.1759125, 0.6519169, 0.8357476, 1, 1, 1, 1, 1,
0.1779704, -2.541259, 4.163867, 1, 1, 1, 1, 1,
0.1814441, 1.175194, 0.1329318, 1, 1, 1, 1, 1,
0.181829, -0.7222363, 2.795637, 1, 1, 1, 1, 1,
0.1857561, 0.3932855, 1.409265, 1, 1, 1, 1, 1,
0.1873201, 0.5357022, 0.5449459, 0, 0, 1, 1, 1,
0.1887157, 1.374482, -0.03379633, 1, 0, 0, 1, 1,
0.1934821, -0.1400368, 1.12099, 1, 0, 0, 1, 1,
0.1995838, 1.015826, 1.717253, 1, 0, 0, 1, 1,
0.2007409, -0.4218338, 3.235747, 1, 0, 0, 1, 1,
0.201187, 0.909682, 0.2341994, 1, 0, 0, 1, 1,
0.202874, 0.180108, 0.08428846, 0, 0, 0, 1, 1,
0.211068, -0.3728307, 2.118845, 0, 0, 0, 1, 1,
0.2133078, -1.092976, 1.495997, 0, 0, 0, 1, 1,
0.2135851, -0.4815578, 0.0002134907, 0, 0, 0, 1, 1,
0.2155952, -0.7267389, 2.077631, 0, 0, 0, 1, 1,
0.2218446, -1.340604, 4.369387, 0, 0, 0, 1, 1,
0.2230855, 1.477687, 0.3583919, 0, 0, 0, 1, 1,
0.2234281, -1.047139, 1.157752, 1, 1, 1, 1, 1,
0.2289068, 0.01274871, 4.490028, 1, 1, 1, 1, 1,
0.2316677, 0.7373103, -0.6858349, 1, 1, 1, 1, 1,
0.2336433, -1.497189, 2.793147, 1, 1, 1, 1, 1,
0.2344949, -1.889972, 3.811125, 1, 1, 1, 1, 1,
0.2358462, -0.5125691, 3.243964, 1, 1, 1, 1, 1,
0.2387984, 1.413934, -0.543865, 1, 1, 1, 1, 1,
0.2399871, -0.8173963, 3.862999, 1, 1, 1, 1, 1,
0.2403792, 0.3512328, -0.1819516, 1, 1, 1, 1, 1,
0.240504, -0.3847491, 1.831383, 1, 1, 1, 1, 1,
0.2449942, -0.07706703, 0.9195173, 1, 1, 1, 1, 1,
0.2479651, -0.1365309, 1.022326, 1, 1, 1, 1, 1,
0.2519307, -0.1032046, 2.685096, 1, 1, 1, 1, 1,
0.2523055, -0.1339858, 3.2655, 1, 1, 1, 1, 1,
0.2605306, 1.519191, 0.862729, 1, 1, 1, 1, 1,
0.2694023, -0.1366937, 1.679998, 0, 0, 1, 1, 1,
0.2698877, -2.050515, 2.324365, 1, 0, 0, 1, 1,
0.271823, -0.6262722, 4.151983, 1, 0, 0, 1, 1,
0.2771867, -0.3764277, 1.856039, 1, 0, 0, 1, 1,
0.2776229, -0.5796493, 3.120063, 1, 0, 0, 1, 1,
0.278345, 1.428674, 0.7858436, 1, 0, 0, 1, 1,
0.2816105, -1.198879, 2.931328, 0, 0, 0, 1, 1,
0.2839249, -0.8486673, 2.910019, 0, 0, 0, 1, 1,
0.2843625, -1.169151, 4.264034, 0, 0, 0, 1, 1,
0.2856698, -0.3860247, 1.775892, 0, 0, 0, 1, 1,
0.2886824, -2.087912, 2.523445, 0, 0, 0, 1, 1,
0.2887036, 0.5294889, 0.1122363, 0, 0, 0, 1, 1,
0.2900428, -0.1243113, 3.216447, 0, 0, 0, 1, 1,
0.291951, 0.3264649, 1.453854, 1, 1, 1, 1, 1,
0.2980128, -0.4133263, 1.401498, 1, 1, 1, 1, 1,
0.3019419, 1.190546, 0.2792839, 1, 1, 1, 1, 1,
0.3024908, -0.07643109, 1.33529, 1, 1, 1, 1, 1,
0.3039003, 0.1869543, 1.179223, 1, 1, 1, 1, 1,
0.3089394, -2.410258, 3.701576, 1, 1, 1, 1, 1,
0.3157998, -0.8210098, 5.491623, 1, 1, 1, 1, 1,
0.317721, 0.2466253, 1.343148, 1, 1, 1, 1, 1,
0.3208012, 1.018104, -1.350062, 1, 1, 1, 1, 1,
0.3267457, 0.4857182, 0.4621527, 1, 1, 1, 1, 1,
0.3343834, -0.7890791, 2.660529, 1, 1, 1, 1, 1,
0.3344256, 2.598119, 0.3313418, 1, 1, 1, 1, 1,
0.3384472, 0.3030152, -0.6946638, 1, 1, 1, 1, 1,
0.3456671, -0.2086134, 0.9997188, 1, 1, 1, 1, 1,
0.3478444, 1.356806, -0.3723487, 1, 1, 1, 1, 1,
0.3479744, -0.1412482, 4.515398, 0, 0, 1, 1, 1,
0.3499493, -0.1078858, 1.592036, 1, 0, 0, 1, 1,
0.3502977, 1.062146, -0.5529803, 1, 0, 0, 1, 1,
0.3512877, 0.6556977, 1.56503, 1, 0, 0, 1, 1,
0.3514024, 1.179341, 0.6448076, 1, 0, 0, 1, 1,
0.3549529, 0.6056343, 1.12639, 1, 0, 0, 1, 1,
0.3557719, 0.3290016, 0.6821077, 0, 0, 0, 1, 1,
0.3559279, 0.4647682, -1.067797, 0, 0, 0, 1, 1,
0.356887, 0.2061383, 0.5742723, 0, 0, 0, 1, 1,
0.3576762, -0.611066, 3.158876, 0, 0, 0, 1, 1,
0.361824, 0.7656474, 1.272557, 0, 0, 0, 1, 1,
0.3623757, -0.792471, 2.84759, 0, 0, 0, 1, 1,
0.363343, 0.3551745, 1.781666, 0, 0, 0, 1, 1,
0.3652225, -1.034849, 1.887195, 1, 1, 1, 1, 1,
0.3661511, 0.7710779, 0.9868201, 1, 1, 1, 1, 1,
0.3686561, 1.249372, 0.9589668, 1, 1, 1, 1, 1,
0.3693071, 0.2059189, 2.577895, 1, 1, 1, 1, 1,
0.3695598, 1.14536, 0.3538918, 1, 1, 1, 1, 1,
0.3778032, -0.7642846, 3.485568, 1, 1, 1, 1, 1,
0.3820122, -0.5287747, 1.910012, 1, 1, 1, 1, 1,
0.3863755, -1.506045, 3.445135, 1, 1, 1, 1, 1,
0.388879, -1.775602, 3.76965, 1, 1, 1, 1, 1,
0.3907359, -0.4597487, 2.74872, 1, 1, 1, 1, 1,
0.3974969, -1.640356, 2.693465, 1, 1, 1, 1, 1,
0.3998374, 1.299284, 0.5229549, 1, 1, 1, 1, 1,
0.4050666, 0.07356277, 0.9269488, 1, 1, 1, 1, 1,
0.4050678, 1.046142, 1.058759, 1, 1, 1, 1, 1,
0.4101495, 1.464471, -0.07015522, 1, 1, 1, 1, 1,
0.413469, 0.7427702, 0.8084787, 0, 0, 1, 1, 1,
0.4144642, 0.6897513, 0.7808816, 1, 0, 0, 1, 1,
0.4146748, 0.1495216, 1.951076, 1, 0, 0, 1, 1,
0.4169892, 0.8929944, 0.8444186, 1, 0, 0, 1, 1,
0.4195912, -1.371979, 0.9326441, 1, 0, 0, 1, 1,
0.4238693, -0.6068514, 1.059549, 1, 0, 0, 1, 1,
0.4246916, -0.1743753, 3.512761, 0, 0, 0, 1, 1,
0.4257708, 1.389808, 0.02307815, 0, 0, 0, 1, 1,
0.4264962, 0.2286153, -0.190828, 0, 0, 0, 1, 1,
0.4276006, -0.4783433, 1.873703, 0, 0, 0, 1, 1,
0.4283275, 0.04563272, 0.4758965, 0, 0, 0, 1, 1,
0.4302715, 0.4842846, 0.8484045, 0, 0, 0, 1, 1,
0.4360519, 1.161284, -0.08009084, 0, 0, 0, 1, 1,
0.4380361, 1.549844, -0.7293931, 1, 1, 1, 1, 1,
0.43881, 0.1529267, -0.009659834, 1, 1, 1, 1, 1,
0.4413115, -0.2334029, 2.835456, 1, 1, 1, 1, 1,
0.4492889, 0.1582046, -1.113972, 1, 1, 1, 1, 1,
0.4503194, -1.371964, 3.456984, 1, 1, 1, 1, 1,
0.453678, 0.2488141, 0.7392473, 1, 1, 1, 1, 1,
0.4541617, -0.7260414, 2.988708, 1, 1, 1, 1, 1,
0.4690407, -0.562907, 2.863374, 1, 1, 1, 1, 1,
0.4696592, 0.3477829, 0.6159051, 1, 1, 1, 1, 1,
0.4730386, -0.3276692, 1.680922, 1, 1, 1, 1, 1,
0.4744369, -0.9084997, 1.999839, 1, 1, 1, 1, 1,
0.4763967, 0.3663988, 1.153126, 1, 1, 1, 1, 1,
0.4777871, 0.3965078, 0.8201775, 1, 1, 1, 1, 1,
0.4789532, -1.344539, 3.366209, 1, 1, 1, 1, 1,
0.4803016, 0.21096, 0.5840114, 1, 1, 1, 1, 1,
0.4845524, 1.912451, 0.8567989, 0, 0, 1, 1, 1,
0.4855761, -0.1802164, 1.700953, 1, 0, 0, 1, 1,
0.493391, -1.08939, 5.532843, 1, 0, 0, 1, 1,
0.4991055, -0.1469039, 2.227767, 1, 0, 0, 1, 1,
0.5051593, -0.491582, 3.362122, 1, 0, 0, 1, 1,
0.5103192, 0.7278814, 0.7273264, 1, 0, 0, 1, 1,
0.5106897, -0.9397365, 2.948947, 0, 0, 0, 1, 1,
0.5116725, -0.1014446, 1.513163, 0, 0, 0, 1, 1,
0.5119252, 0.2462664, 2.508614, 0, 0, 0, 1, 1,
0.5166689, 0.1524174, 0.9791654, 0, 0, 0, 1, 1,
0.5194733, 1.528052, 0.9708794, 0, 0, 0, 1, 1,
0.5348158, -0.276441, 1.774779, 0, 0, 0, 1, 1,
0.5426396, 0.06013013, 0.2400435, 0, 0, 0, 1, 1,
0.5437969, -0.7779522, 2.943233, 1, 1, 1, 1, 1,
0.5453447, -0.6116061, 3.849274, 1, 1, 1, 1, 1,
0.5500255, 1.155268, -0.2186389, 1, 1, 1, 1, 1,
0.5541828, 1.61903, -0.7159197, 1, 1, 1, 1, 1,
0.5585545, -2.084461, 4.13724, 1, 1, 1, 1, 1,
0.5669012, -0.2744554, 1.349854, 1, 1, 1, 1, 1,
0.5676549, -0.689705, 0.8562635, 1, 1, 1, 1, 1,
0.5681094, 0.1667812, 3.140939, 1, 1, 1, 1, 1,
0.5719401, 0.1254767, 0.7779632, 1, 1, 1, 1, 1,
0.5731648, 1.283551, 0.06951103, 1, 1, 1, 1, 1,
0.5761892, 0.5941997, 1.454522, 1, 1, 1, 1, 1,
0.5775069, -0.7108465, 4.752931, 1, 1, 1, 1, 1,
0.5808805, -1.452329, 2.192172, 1, 1, 1, 1, 1,
0.5820978, 0.1244676, 2.495028, 1, 1, 1, 1, 1,
0.5891488, -0.5626535, 1.334716, 1, 1, 1, 1, 1,
0.5895491, -0.8551608, 4.32621, 0, 0, 1, 1, 1,
0.5909769, 1.618799, -1.484992, 1, 0, 0, 1, 1,
0.5995306, 1.173813, -0.5104984, 1, 0, 0, 1, 1,
0.6012309, 0.3544127, 0.4856556, 1, 0, 0, 1, 1,
0.6012838, -1.090112, 4.058093, 1, 0, 0, 1, 1,
0.605617, 1.439553, 0.4632143, 1, 0, 0, 1, 1,
0.6083222, -0.4527031, 1.61301, 0, 0, 0, 1, 1,
0.6111786, -0.1881779, 2.583036, 0, 0, 0, 1, 1,
0.612601, 0.8164349, 1.698244, 0, 0, 0, 1, 1,
0.6129423, -1.248708, 2.964373, 0, 0, 0, 1, 1,
0.6140513, -1.126815, 2.657723, 0, 0, 0, 1, 1,
0.6191205, -0.2216994, 0.6660796, 0, 0, 0, 1, 1,
0.6208929, -1.540961, 3.417055, 0, 0, 0, 1, 1,
0.6209468, 0.65204, 2.607903, 1, 1, 1, 1, 1,
0.6211036, 0.5740552, 1.814274, 1, 1, 1, 1, 1,
0.6248415, -1.244355, 2.492636, 1, 1, 1, 1, 1,
0.6259968, 0.8202825, -0.4529011, 1, 1, 1, 1, 1,
0.6268717, 0.6357954, 1.685626, 1, 1, 1, 1, 1,
0.6275949, 1.329844, -0.6294316, 1, 1, 1, 1, 1,
0.6362203, -0.7469464, 1.139516, 1, 1, 1, 1, 1,
0.6384385, 1.789232, 0.6473268, 1, 1, 1, 1, 1,
0.6409615, 0.2350205, 0.6405064, 1, 1, 1, 1, 1,
0.6419334, -0.02004927, 2.03528, 1, 1, 1, 1, 1,
0.6492368, -0.8718587, 3.210664, 1, 1, 1, 1, 1,
0.6513807, 1.471284, 0.4509056, 1, 1, 1, 1, 1,
0.6528487, 0.2652925, 0.5494952, 1, 1, 1, 1, 1,
0.6532769, 0.5818102, -0.5001671, 1, 1, 1, 1, 1,
0.657326, -0.4080725, 1.194882, 1, 1, 1, 1, 1,
0.6579784, 1.203334, -0.369389, 0, 0, 1, 1, 1,
0.6616043, 1.125287, -0.9888287, 1, 0, 0, 1, 1,
0.6687734, -1.356707, 3.194826, 1, 0, 0, 1, 1,
0.6758443, 1.030654, 1.137213, 1, 0, 0, 1, 1,
0.676444, -0.4036383, 2.768034, 1, 0, 0, 1, 1,
0.6849222, -1.160586, 1.205677, 1, 0, 0, 1, 1,
0.687966, 0.5380901, 0.5236998, 0, 0, 0, 1, 1,
0.6884502, -0.5094444, 0.234412, 0, 0, 0, 1, 1,
0.6981499, 1.110064, -0.2737775, 0, 0, 0, 1, 1,
0.6983905, -1.07607, 3.421349, 0, 0, 0, 1, 1,
0.7025632, 0.4777277, 0.244139, 0, 0, 0, 1, 1,
0.7033425, -0.09104401, 0.4470139, 0, 0, 0, 1, 1,
0.7096605, -0.01595642, 0.6340835, 0, 0, 0, 1, 1,
0.7118132, 0.4093094, 0.00765217, 1, 1, 1, 1, 1,
0.7124729, 1.794696, 1.545198, 1, 1, 1, 1, 1,
0.7134755, -1.157242, 2.188961, 1, 1, 1, 1, 1,
0.7185516, -0.8927654, 2.997502, 1, 1, 1, 1, 1,
0.7191893, -0.3170094, 0.514374, 1, 1, 1, 1, 1,
0.719546, 0.8609017, 1.287499, 1, 1, 1, 1, 1,
0.720165, -1.088275, 2.082215, 1, 1, 1, 1, 1,
0.7233732, 2.550694, 0.1412164, 1, 1, 1, 1, 1,
0.7240583, -0.4087725, 0.02155348, 1, 1, 1, 1, 1,
0.7290828, 0.4839009, 2.915694, 1, 1, 1, 1, 1,
0.7294281, 0.3167153, 2.442649, 1, 1, 1, 1, 1,
0.7300425, 1.2264, 0.1025085, 1, 1, 1, 1, 1,
0.7330352, -1.39528, 3.773739, 1, 1, 1, 1, 1,
0.7389672, 1.709391, 1.764662, 1, 1, 1, 1, 1,
0.7437449, -0.560728, 2.320828, 1, 1, 1, 1, 1,
0.7466617, 1.394097, 1.219895, 0, 0, 1, 1, 1,
0.7498674, -0.5906418, 2.487909, 1, 0, 0, 1, 1,
0.7499159, 0.6177054, 0.2852831, 1, 0, 0, 1, 1,
0.7508627, -0.7692439, 2.316645, 1, 0, 0, 1, 1,
0.7552739, -0.5954193, 2.428089, 1, 0, 0, 1, 1,
0.7559596, 0.9731501, 0.7885211, 1, 0, 0, 1, 1,
0.7637268, 0.7742066, 0.446667, 0, 0, 0, 1, 1,
0.7685514, -0.6153001, 1.450573, 0, 0, 0, 1, 1,
0.7693696, 1.301257, 1.820785, 0, 0, 0, 1, 1,
0.7694219, 0.7013208, 0.1304512, 0, 0, 0, 1, 1,
0.7766101, 1.273056, 0.6016594, 0, 0, 0, 1, 1,
0.7781016, -0.214999, 1.4604, 0, 0, 0, 1, 1,
0.7784469, -0.8281374, 2.819382, 0, 0, 0, 1, 1,
0.778492, -1.477967, 2.054596, 1, 1, 1, 1, 1,
0.7831054, -0.8530689, 3.226214, 1, 1, 1, 1, 1,
0.783601, -0.2085625, 0.8406899, 1, 1, 1, 1, 1,
0.7843047, -1.18769, 3.686606, 1, 1, 1, 1, 1,
0.7869091, 0.1916467, 4.6376, 1, 1, 1, 1, 1,
0.7961695, 0.02335378, 2.261659, 1, 1, 1, 1, 1,
0.7981164, 0.05196641, 1.171678, 1, 1, 1, 1, 1,
0.799275, -0.271159, 0.009947245, 1, 1, 1, 1, 1,
0.8056834, -1.265472, 2.829164, 1, 1, 1, 1, 1,
0.8074609, 0.4181696, 0.5709221, 1, 1, 1, 1, 1,
0.807951, -0.1690357, 0.7030259, 1, 1, 1, 1, 1,
0.820318, -0.6826851, 2.266861, 1, 1, 1, 1, 1,
0.826198, -0.8174624, 3.629883, 1, 1, 1, 1, 1,
0.8273385, 0.03586163, 0.7314518, 1, 1, 1, 1, 1,
0.8324139, 0.4023365, 1.761371, 1, 1, 1, 1, 1,
0.8427973, -0.08711562, 1.005416, 0, 0, 1, 1, 1,
0.8510501, 0.04286785, 2.554196, 1, 0, 0, 1, 1,
0.8517241, -1.228719, 2.55368, 1, 0, 0, 1, 1,
0.852761, -0.06655007, 1.195586, 1, 0, 0, 1, 1,
0.8567775, 0.7700996, 0.3955621, 1, 0, 0, 1, 1,
0.857169, 1.134262, -0.1233041, 1, 0, 0, 1, 1,
0.8595218, -0.223447, 1.915552, 0, 0, 0, 1, 1,
0.8608079, 0.003432055, 1.736895, 0, 0, 0, 1, 1,
0.8637317, -0.06409021, 1.804059, 0, 0, 0, 1, 1,
0.8687654, -0.9264871, 2.871009, 0, 0, 0, 1, 1,
0.8774092, 0.2130353, -0.4115694, 0, 0, 0, 1, 1,
0.8798518, -1.425965, 4.832303, 0, 0, 0, 1, 1,
0.8818667, 1.273981, 1.434896, 0, 0, 0, 1, 1,
0.8949363, 0.02066719, 2.420238, 1, 1, 1, 1, 1,
0.8989938, -2.283848, 2.294427, 1, 1, 1, 1, 1,
0.8993858, -0.3707721, 0.7227976, 1, 1, 1, 1, 1,
0.8996674, 1.929618, 1.921835, 1, 1, 1, 1, 1,
0.9103508, 0.6072668, 1.086447, 1, 1, 1, 1, 1,
0.9140178, 2.501146, -0.2359912, 1, 1, 1, 1, 1,
0.9206071, 1.276901, -0.0157028, 1, 1, 1, 1, 1,
0.9207899, 0.8692375, 1.457938, 1, 1, 1, 1, 1,
0.9304194, -1.008224, 0.9948884, 1, 1, 1, 1, 1,
0.9318234, -1.192468, 0.5833475, 1, 1, 1, 1, 1,
0.9326422, 1.145, 1.242825, 1, 1, 1, 1, 1,
0.940905, 0.2155092, 1.095299, 1, 1, 1, 1, 1,
0.9435528, 0.07444974, 0.4641708, 1, 1, 1, 1, 1,
0.9474599, -1.251317, 1.982823, 1, 1, 1, 1, 1,
0.9576553, -1.085555, 3.029768, 1, 1, 1, 1, 1,
0.9591494, 0.1082956, 3.331831, 0, 0, 1, 1, 1,
0.9644949, -0.03902209, 2.008373, 1, 0, 0, 1, 1,
0.969715, -0.5722913, 2.193001, 1, 0, 0, 1, 1,
0.9707068, 1.344003, -0.2804076, 1, 0, 0, 1, 1,
0.9719328, 0.488801, 0.7196833, 1, 0, 0, 1, 1,
0.9738667, -1.857804, -0.05918555, 1, 0, 0, 1, 1,
0.9742182, -0.44315, 0.06764484, 0, 0, 0, 1, 1,
0.9754736, -1.100813, 2.487559, 0, 0, 0, 1, 1,
0.9765109, 0.7734944, 1.172171, 0, 0, 0, 1, 1,
0.9773241, 1.301535, 0.9962658, 0, 0, 0, 1, 1,
0.984009, -2.00557, 2.642925, 0, 0, 0, 1, 1,
0.9940886, -2.733669, 3.735941, 0, 0, 0, 1, 1,
1.013241, 0.7956122, -1.150777, 0, 0, 0, 1, 1,
1.026875, 0.9134528, 2.574062, 1, 1, 1, 1, 1,
1.0351, 1.216457, 2.233557, 1, 1, 1, 1, 1,
1.044983, 0.1338517, 2.334806, 1, 1, 1, 1, 1,
1.051725, 1.157518, 0.8204266, 1, 1, 1, 1, 1,
1.053102, -0.09030907, 3.939169, 1, 1, 1, 1, 1,
1.066387, 0.007698193, 1.306586, 1, 1, 1, 1, 1,
1.077724, 1.192247, -0.394742, 1, 1, 1, 1, 1,
1.081475, 0.3617385, 0.5943534, 1, 1, 1, 1, 1,
1.0828, 0.3371674, -0.9857868, 1, 1, 1, 1, 1,
1.083787, 0.008521582, 1.760441, 1, 1, 1, 1, 1,
1.084716, 0.09050862, -0.3927664, 1, 1, 1, 1, 1,
1.088975, -1.114535, 2.649415, 1, 1, 1, 1, 1,
1.093186, -0.4413494, 3.774363, 1, 1, 1, 1, 1,
1.093187, 0.5194486, 0.1240135, 1, 1, 1, 1, 1,
1.095717, -0.7742528, 1.197257, 1, 1, 1, 1, 1,
1.096801, -0.627021, 3.217023, 0, 0, 1, 1, 1,
1.097549, -0.06792393, 3.392253, 1, 0, 0, 1, 1,
1.099425, -0.3384244, 3.533861, 1, 0, 0, 1, 1,
1.104995, -0.005819677, 1.234231, 1, 0, 0, 1, 1,
1.107747, -0.03112162, 1.690168, 1, 0, 0, 1, 1,
1.111227, 1.569269, 0.8825942, 1, 0, 0, 1, 1,
1.117118, -0.05399241, 3.695931, 0, 0, 0, 1, 1,
1.128373, -1.13651, 2.346177, 0, 0, 0, 1, 1,
1.129144, -1.902807, 4.606905, 0, 0, 0, 1, 1,
1.129626, -0.2005872, 3.059367, 0, 0, 0, 1, 1,
1.13704, -0.3069233, 1.476588, 0, 0, 0, 1, 1,
1.147093, -0.8462743, 2.879793, 0, 0, 0, 1, 1,
1.150225, 1.622565, 0.7119984, 0, 0, 0, 1, 1,
1.150733, -2.835592, 1.903656, 1, 1, 1, 1, 1,
1.152141, -0.5724484, 3.533278, 1, 1, 1, 1, 1,
1.152578, -0.1149949, 1.021885, 1, 1, 1, 1, 1,
1.158373, 0.3426378, 0.767606, 1, 1, 1, 1, 1,
1.15874, 1.537888, 1.988001, 1, 1, 1, 1, 1,
1.161501, 0.03743882, 4.464383, 1, 1, 1, 1, 1,
1.174258, -0.9506926, 2.454175, 1, 1, 1, 1, 1,
1.17766, -0.02468964, 2.992024, 1, 1, 1, 1, 1,
1.182197, 0.3389676, 0.4862067, 1, 1, 1, 1, 1,
1.188221, 1.222651, 0.1687158, 1, 1, 1, 1, 1,
1.197412, -0.6994923, 2.496409, 1, 1, 1, 1, 1,
1.197462, -0.4781134, 2.463531, 1, 1, 1, 1, 1,
1.19778, 0.6856979, -0.1092697, 1, 1, 1, 1, 1,
1.200876, 0.1738653, 2.381704, 1, 1, 1, 1, 1,
1.203395, -0.1698904, 2.212684, 1, 1, 1, 1, 1,
1.20782, -0.6397428, 3.302605, 0, 0, 1, 1, 1,
1.216356, -1.107242, 2.605944, 1, 0, 0, 1, 1,
1.230393, -2.482196, 2.91791, 1, 0, 0, 1, 1,
1.237337, 0.3768961, 0.5652674, 1, 0, 0, 1, 1,
1.24287, -0.04639632, 2.203458, 1, 0, 0, 1, 1,
1.24335, -0.8019894, 3.055858, 1, 0, 0, 1, 1,
1.250901, -0.6891633, 1.128386, 0, 0, 0, 1, 1,
1.256004, 0.4232755, 0.2752103, 0, 0, 0, 1, 1,
1.261138, 0.120556, 1.165489, 0, 0, 0, 1, 1,
1.263382, -0.101129, 2.073504, 0, 0, 0, 1, 1,
1.265757, 0.2055796, 0.7127454, 0, 0, 0, 1, 1,
1.267259, -0.1734785, 2.293511, 0, 0, 0, 1, 1,
1.283555, 1.094444, 1.652187, 0, 0, 0, 1, 1,
1.285558, 1.050625, 0.6442965, 1, 1, 1, 1, 1,
1.29359, -1.339688, 2.965993, 1, 1, 1, 1, 1,
1.294428, -0.03348796, 2.056354, 1, 1, 1, 1, 1,
1.312531, -0.746644, 1.741286, 1, 1, 1, 1, 1,
1.323978, 0.8856871, 0.8201256, 1, 1, 1, 1, 1,
1.326225, -0.03291885, 0.8749436, 1, 1, 1, 1, 1,
1.340892, 0.4140326, -0.5914057, 1, 1, 1, 1, 1,
1.341928, 1.026487, 1.864959, 1, 1, 1, 1, 1,
1.350784, -1.772703, 2.383486, 1, 1, 1, 1, 1,
1.352057, -0.4614574, 3.029834, 1, 1, 1, 1, 1,
1.353911, -0.2977709, 1.740796, 1, 1, 1, 1, 1,
1.357773, -0.7943892, 2.218593, 1, 1, 1, 1, 1,
1.367064, 0.3058205, 0.2156487, 1, 1, 1, 1, 1,
1.372214, -0.827025, 3.009802, 1, 1, 1, 1, 1,
1.382632, -1.070225, 1.695752, 1, 1, 1, 1, 1,
1.386782, -0.2256398, 2.202408, 0, 0, 1, 1, 1,
1.393759, 0.2504026, 2.850368, 1, 0, 0, 1, 1,
1.394571, -0.4776788, 1.538547, 1, 0, 0, 1, 1,
1.423621, 0.5641657, 1.842737, 1, 0, 0, 1, 1,
1.438773, 0.8738273, 1.723759, 1, 0, 0, 1, 1,
1.450873, 1.312985, 0.07627842, 1, 0, 0, 1, 1,
1.452479, 3.228098, 1.606913, 0, 0, 0, 1, 1,
1.460084, -0.8590217, 3.100705, 0, 0, 0, 1, 1,
1.464152, -0.397341, 1.031741, 0, 0, 0, 1, 1,
1.466167, -0.5607361, 0.8909278, 0, 0, 0, 1, 1,
1.483069, -0.3543997, 2.483275, 0, 0, 0, 1, 1,
1.487534, -0.3615578, 1.319007, 0, 0, 0, 1, 1,
1.490009, -0.4968656, 2.066094, 0, 0, 0, 1, 1,
1.492265, 1.79724, 0.4885644, 1, 1, 1, 1, 1,
1.498958, 0.2855422, 2.175008, 1, 1, 1, 1, 1,
1.508043, 0.3694429, 1.488309, 1, 1, 1, 1, 1,
1.512025, -0.8394278, 3.135051, 1, 1, 1, 1, 1,
1.513969, 0.9228127, 0.6448368, 1, 1, 1, 1, 1,
1.539668, -0.5822742, 0.4617839, 1, 1, 1, 1, 1,
1.544356, 0.410181, 1.352987, 1, 1, 1, 1, 1,
1.545628, 0.06760389, 0.5913287, 1, 1, 1, 1, 1,
1.548231, -0.4399426, 2.034731, 1, 1, 1, 1, 1,
1.552615, -0.527882, 2.545987, 1, 1, 1, 1, 1,
1.553486, 0.0381911, 0.6682509, 1, 1, 1, 1, 1,
1.564956, 0.9453244, -1.654526, 1, 1, 1, 1, 1,
1.57185, -0.9166216, 3.366306, 1, 1, 1, 1, 1,
1.582937, -1.261298, 2.654656, 1, 1, 1, 1, 1,
1.588314, -1.574973, 2.397262, 1, 1, 1, 1, 1,
1.593666, 0.04278327, 0.5154782, 0, 0, 1, 1, 1,
1.630294, 0.8576182, 0.01968469, 1, 0, 0, 1, 1,
1.633676, -1.319278, 1.445043, 1, 0, 0, 1, 1,
1.640765, 0.8082358, -0.6084612, 1, 0, 0, 1, 1,
1.650681, -0.09474546, 0.5745653, 1, 0, 0, 1, 1,
1.667068, 2.214396, 0.3111702, 1, 0, 0, 1, 1,
1.674425, -1.251816, 3.115509, 0, 0, 0, 1, 1,
1.675786, -0.0405757, 2.612813, 0, 0, 0, 1, 1,
1.68438, -0.6980833, 2.435969, 0, 0, 0, 1, 1,
1.685038, 0.7202682, 1.235834, 0, 0, 0, 1, 1,
1.701158, 0.1529727, 1.477944, 0, 0, 0, 1, 1,
1.701463, 0.2972834, 0.7339349, 0, 0, 0, 1, 1,
1.727162, -1.715043, 2.52539, 0, 0, 0, 1, 1,
1.732553, 0.9617175, 1.299187, 1, 1, 1, 1, 1,
1.774491, -0.4005826, 0.3312098, 1, 1, 1, 1, 1,
1.797775, -0.2357178, 2.795393, 1, 1, 1, 1, 1,
1.813242, -0.06116515, 2.065624, 1, 1, 1, 1, 1,
1.833654, -1.182548, 1.576289, 1, 1, 1, 1, 1,
1.837957, -0.4111705, 2.722237, 1, 1, 1, 1, 1,
1.85357, -1.020861, 3.368354, 1, 1, 1, 1, 1,
1.857114, -0.07071179, 1.770942, 1, 1, 1, 1, 1,
1.862738, 1.232787, 3.994072, 1, 1, 1, 1, 1,
1.881852, 0.6615014, 0.7277521, 1, 1, 1, 1, 1,
1.882, -0.2559386, 4.178458, 1, 1, 1, 1, 1,
1.911026, 0.2736526, 1.307466, 1, 1, 1, 1, 1,
1.958311, -0.2397094, 2.742939, 1, 1, 1, 1, 1,
1.974072, -1.197506, 2.550116, 1, 1, 1, 1, 1,
1.983809, 1.59379, 2.513622, 1, 1, 1, 1, 1,
1.986379, 0.1502197, 1.884359, 0, 0, 1, 1, 1,
2.028514, -1.80209, 1.209777, 1, 0, 0, 1, 1,
2.031326, 0.694953, 1.659162, 1, 0, 0, 1, 1,
2.037227, 0.8238667, -0.873234, 1, 0, 0, 1, 1,
2.064882, 0.9746654, 0.7331053, 1, 0, 0, 1, 1,
2.08145, 0.3726327, 0.8733131, 1, 0, 0, 1, 1,
2.152627, -1.30164, 1.380276, 0, 0, 0, 1, 1,
2.226843, -0.9101939, 1.358599, 0, 0, 0, 1, 1,
2.253959, -1.27155, 2.933577, 0, 0, 0, 1, 1,
2.271894, 1.450916, 2.003336, 0, 0, 0, 1, 1,
2.312357, -0.58709, -1.074306, 0, 0, 0, 1, 1,
2.356112, -0.8546917, 1.88963, 0, 0, 0, 1, 1,
2.377161, -0.5188681, 3.6466, 0, 0, 0, 1, 1,
2.397099, -0.7470916, 0.8227981, 1, 1, 1, 1, 1,
2.405343, 0.86524, 2.864416, 1, 1, 1, 1, 1,
2.417531, 0.6257775, 0.1791423, 1, 1, 1, 1, 1,
2.419257, 3.196506, 1.73027, 1, 1, 1, 1, 1,
2.498667, -1.413746, 2.123828, 1, 1, 1, 1, 1,
2.5489, -0.3065509, 2.824541, 1, 1, 1, 1, 1,
2.706658, 1.441095, 0.3683472, 1, 1, 1, 1, 1
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
var radius = 9.71759;
var distance = 34.13262;
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
mvMatrix.translate( 0.5605865, -0.1962528, 0.0684793 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.13262);
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
