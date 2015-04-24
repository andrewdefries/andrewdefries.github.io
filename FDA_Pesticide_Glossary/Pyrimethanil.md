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
-3.211045, 0.7796762, -1.777249, 1, 0, 0, 1,
-2.965568, -0.9377941, -1.326369, 1, 0.007843138, 0, 1,
-2.918012, -1.217153, -1.750677, 1, 0.01176471, 0, 1,
-2.868458, -0.1019219, -1.097672, 1, 0.01960784, 0, 1,
-2.732921, 0.09510358, -0.007855821, 1, 0.02352941, 0, 1,
-2.694292, -0.8019469, -3.879657, 1, 0.03137255, 0, 1,
-2.580099, 0.2109761, -1.943246, 1, 0.03529412, 0, 1,
-2.5517, -0.4180062, -1.333181, 1, 0.04313726, 0, 1,
-2.445951, 0.7218347, -2.637979, 1, 0.04705882, 0, 1,
-2.394015, -0.2201236, -1.785076, 1, 0.05490196, 0, 1,
-2.338164, 1.066028, -0.9589629, 1, 0.05882353, 0, 1,
-2.294102, -0.7926366, -2.178563, 1, 0.06666667, 0, 1,
-2.285681, 0.4021603, -1.75296, 1, 0.07058824, 0, 1,
-2.279757, -0.174274, -1.814397, 1, 0.07843138, 0, 1,
-2.279327, 0.1836372, -1.126989, 1, 0.08235294, 0, 1,
-2.209267, -0.444715, -0.6816713, 1, 0.09019608, 0, 1,
-2.191339, 0.1966687, -0.6995559, 1, 0.09411765, 0, 1,
-2.157059, -0.2900778, -3.502874, 1, 0.1019608, 0, 1,
-2.137971, -0.2319904, -3.143961, 1, 0.1098039, 0, 1,
-2.074852, 0.2903493, -1.448068, 1, 0.1137255, 0, 1,
-2.064683, -1.900544, -3.123019, 1, 0.1215686, 0, 1,
-1.998344, -0.8851624, -2.105684, 1, 0.1254902, 0, 1,
-1.996778, -0.009521507, -2.955498, 1, 0.1333333, 0, 1,
-1.992099, -0.7947791, -0.5174558, 1, 0.1372549, 0, 1,
-1.981188, -0.1068913, -3.079068, 1, 0.145098, 0, 1,
-1.966719, 0.9690862, -1.497609, 1, 0.1490196, 0, 1,
-1.950779, -1.035814, -2.850448, 1, 0.1568628, 0, 1,
-1.947282, 1.913622, -1.885716, 1, 0.1607843, 0, 1,
-1.924582, -0.9319032, -2.031623, 1, 0.1686275, 0, 1,
-1.915801, 0.3205718, -2.021069, 1, 0.172549, 0, 1,
-1.902381, -0.4507793, -0.9267602, 1, 0.1803922, 0, 1,
-1.889327, -0.3421634, -2.630732, 1, 0.1843137, 0, 1,
-1.87616, 0.426056, -0.295067, 1, 0.1921569, 0, 1,
-1.876011, -1.031098, -0.4851249, 1, 0.1960784, 0, 1,
-1.86999, 1.971558, -0.9845662, 1, 0.2039216, 0, 1,
-1.841363, 0.4709831, -2.847704, 1, 0.2117647, 0, 1,
-1.813187, -1.627714, -2.808704, 1, 0.2156863, 0, 1,
-1.809865, 1.467806, -0.7687011, 1, 0.2235294, 0, 1,
-1.806999, 0.06108491, -0.4305297, 1, 0.227451, 0, 1,
-1.785563, -0.1662733, -1.080996, 1, 0.2352941, 0, 1,
-1.784608, 0.6997462, -3.054114, 1, 0.2392157, 0, 1,
-1.768931, 0.2109138, -2.499224, 1, 0.2470588, 0, 1,
-1.763427, 0.8040283, 0.3482715, 1, 0.2509804, 0, 1,
-1.742861, 3.291003, 1.035985, 1, 0.2588235, 0, 1,
-1.739566, 0.5641398, -1.813483, 1, 0.2627451, 0, 1,
-1.739208, 0.04826694, -1.873457, 1, 0.2705882, 0, 1,
-1.734773, -0.5852396, -2.028152, 1, 0.2745098, 0, 1,
-1.727521, 1.297192, 0.3670965, 1, 0.282353, 0, 1,
-1.703041, 0.6494601, -2.91752, 1, 0.2862745, 0, 1,
-1.687596, 0.07111821, -2.815964, 1, 0.2941177, 0, 1,
-1.683319, -1.022806, -1.967289, 1, 0.3019608, 0, 1,
-1.659173, -1.638818, -5.09312, 1, 0.3058824, 0, 1,
-1.648589, 1.816293, -1.002571, 1, 0.3137255, 0, 1,
-1.642239, 0.8653967, -0.7916117, 1, 0.3176471, 0, 1,
-1.635979, 0.1154727, -2.148552, 1, 0.3254902, 0, 1,
-1.627507, -0.7063815, -2.816189, 1, 0.3294118, 0, 1,
-1.623141, 0.1283442, -0.9761651, 1, 0.3372549, 0, 1,
-1.616917, -1.210939, -1.654089, 1, 0.3411765, 0, 1,
-1.616529, 1.061527, -2.0067, 1, 0.3490196, 0, 1,
-1.612061, 0.637237, -0.9988887, 1, 0.3529412, 0, 1,
-1.605928, 0.2932401, 0.06360432, 1, 0.3607843, 0, 1,
-1.604111, -0.9138263, -2.430175, 1, 0.3647059, 0, 1,
-1.596412, 0.6434684, -2.680146, 1, 0.372549, 0, 1,
-1.596234, 0.4075253, -2.307707, 1, 0.3764706, 0, 1,
-1.587867, -0.77994, -2.089173, 1, 0.3843137, 0, 1,
-1.584214, 0.7547238, 0.4065029, 1, 0.3882353, 0, 1,
-1.580996, -2.037477, -2.195671, 1, 0.3960784, 0, 1,
-1.578335, -0.7805657, -2.662425, 1, 0.4039216, 0, 1,
-1.558347, 0.2820635, -1.543658, 1, 0.4078431, 0, 1,
-1.557325, 0.009948242, -3.146418, 1, 0.4156863, 0, 1,
-1.547817, -0.7453416, -1.819209, 1, 0.4196078, 0, 1,
-1.542163, 1.150072, 0.1869328, 1, 0.427451, 0, 1,
-1.536004, -1.995414, -2.692055, 1, 0.4313726, 0, 1,
-1.533861, 0.2099794, -0.7724646, 1, 0.4392157, 0, 1,
-1.526659, 1.998838, -0.3932714, 1, 0.4431373, 0, 1,
-1.522533, 1.142148, 0.8868586, 1, 0.4509804, 0, 1,
-1.519096, -0.1615684, -2.618169, 1, 0.454902, 0, 1,
-1.518268, -2.261858, -2.484318, 1, 0.4627451, 0, 1,
-1.50524, -0.6922351, -1.542792, 1, 0.4666667, 0, 1,
-1.503938, -0.7641436, -3.351811, 1, 0.4745098, 0, 1,
-1.502422, 1.453146, -0.6082994, 1, 0.4784314, 0, 1,
-1.498025, 1.111307, -2.09346, 1, 0.4862745, 0, 1,
-1.49196, -0.7421305, -3.562845, 1, 0.4901961, 0, 1,
-1.488333, 0.8254786, -1.682317, 1, 0.4980392, 0, 1,
-1.47439, -0.4787025, -1.72986, 1, 0.5058824, 0, 1,
-1.474261, -0.7403631, -2.859559, 1, 0.509804, 0, 1,
-1.444893, -0.6016822, -2.120797, 1, 0.5176471, 0, 1,
-1.442306, 0.1499098, 0.556, 1, 0.5215687, 0, 1,
-1.439604, 0.6437978, -3.10898, 1, 0.5294118, 0, 1,
-1.437222, 0.8415815, -0.8164883, 1, 0.5333334, 0, 1,
-1.422834, -1.224866, -0.7029734, 1, 0.5411765, 0, 1,
-1.415737, 0.004801834, -1.212589, 1, 0.5450981, 0, 1,
-1.413247, 0.6062405, -1.000899, 1, 0.5529412, 0, 1,
-1.412179, 0.4815021, -0.5387412, 1, 0.5568628, 0, 1,
-1.390366, -0.1929126, -0.7814486, 1, 0.5647059, 0, 1,
-1.388565, -0.188086, -2.402658, 1, 0.5686275, 0, 1,
-1.377118, 0.7064521, -0.3179663, 1, 0.5764706, 0, 1,
-1.370453, -0.1497108, -1.965079, 1, 0.5803922, 0, 1,
-1.355729, 0.9520676, -0.09601379, 1, 0.5882353, 0, 1,
-1.35403, -0.7910967, -1.955478, 1, 0.5921569, 0, 1,
-1.353358, 0.366948, -2.876291, 1, 0.6, 0, 1,
-1.346119, 0.6777692, -0.4613337, 1, 0.6078432, 0, 1,
-1.331915, -0.483751, -1.947192, 1, 0.6117647, 0, 1,
-1.329572, 0.6265174, -1.638602, 1, 0.6196079, 0, 1,
-1.324541, 0.05003295, -2.197226, 1, 0.6235294, 0, 1,
-1.321509, 1.876821, -2.022519, 1, 0.6313726, 0, 1,
-1.319663, -0.7693214, -1.950643, 1, 0.6352941, 0, 1,
-1.312431, 1.143867, -1.646267, 1, 0.6431373, 0, 1,
-1.308384, 0.2922558, -1.138343, 1, 0.6470588, 0, 1,
-1.307824, -0.2144451, 0.2712627, 1, 0.654902, 0, 1,
-1.304393, 0.3925754, -1.492423, 1, 0.6588235, 0, 1,
-1.299439, -0.2733595, -1.024389, 1, 0.6666667, 0, 1,
-1.29026, -0.1513857, -2.3752, 1, 0.6705883, 0, 1,
-1.290251, 0.1318276, -1.325203, 1, 0.6784314, 0, 1,
-1.28832, -0.6648899, -0.9375305, 1, 0.682353, 0, 1,
-1.28609, -0.4128595, -2.534008, 1, 0.6901961, 0, 1,
-1.283011, 0.7299316, -2.186988, 1, 0.6941177, 0, 1,
-1.257097, -0.8790644, -3.593454, 1, 0.7019608, 0, 1,
-1.254627, -0.4531428, -2.410772, 1, 0.7098039, 0, 1,
-1.24824, -0.1544457, -1.320382, 1, 0.7137255, 0, 1,
-1.248018, -1.068031, -2.30897, 1, 0.7215686, 0, 1,
-1.24773, 0.5904338, -1.716411, 1, 0.7254902, 0, 1,
-1.246853, 1.50729, -1.403522, 1, 0.7333333, 0, 1,
-1.243338, 1.674413, -1.460816, 1, 0.7372549, 0, 1,
-1.239952, 2.37843, -1.724249, 1, 0.7450981, 0, 1,
-1.23512, 0.006541231, -1.075201, 1, 0.7490196, 0, 1,
-1.232002, -0.9713939, -3.942465, 1, 0.7568628, 0, 1,
-1.215033, 0.1508034, -1.626582, 1, 0.7607843, 0, 1,
-1.208124, -0.1684958, -0.9608793, 1, 0.7686275, 0, 1,
-1.205578, 0.554898, -0.5910347, 1, 0.772549, 0, 1,
-1.203146, -0.1108494, -2.222253, 1, 0.7803922, 0, 1,
-1.199765, -0.3420847, -3.434693, 1, 0.7843137, 0, 1,
-1.198955, -0.2286279, -0.9511598, 1, 0.7921569, 0, 1,
-1.19538, -1.38386, -2.763508, 1, 0.7960784, 0, 1,
-1.194626, 1.85955, 0.3129872, 1, 0.8039216, 0, 1,
-1.194514, -2.189032, -1.769599, 1, 0.8117647, 0, 1,
-1.194003, 0.261781, -2.677183, 1, 0.8156863, 0, 1,
-1.189113, -0.309073, 0.3079158, 1, 0.8235294, 0, 1,
-1.176372, 0.8577213, -0.8203419, 1, 0.827451, 0, 1,
-1.175835, -0.1804637, -1.168681, 1, 0.8352941, 0, 1,
-1.175729, -0.5311288, -0.6855668, 1, 0.8392157, 0, 1,
-1.168874, -0.03002529, -1.455684, 1, 0.8470588, 0, 1,
-1.16624, -1.178715, -2.24382, 1, 0.8509804, 0, 1,
-1.166105, 0.8008033, -1.596524, 1, 0.8588235, 0, 1,
-1.163242, 0.3869151, -0.2998028, 1, 0.8627451, 0, 1,
-1.15697, 1.522776, -0.5414149, 1, 0.8705882, 0, 1,
-1.152935, 0.8731996, -1.08037, 1, 0.8745098, 0, 1,
-1.150622, 0.3525069, -1.452505, 1, 0.8823529, 0, 1,
-1.136831, 0.3663741, 0.9072208, 1, 0.8862745, 0, 1,
-1.135204, -0.9833346, -1.93785, 1, 0.8941177, 0, 1,
-1.13311, 1.562685, -0.981048, 1, 0.8980392, 0, 1,
-1.131548, 1.437538, -1.419353, 1, 0.9058824, 0, 1,
-1.127808, 0.3264239, -1.678802, 1, 0.9137255, 0, 1,
-1.125464, 0.2337789, -0.9742159, 1, 0.9176471, 0, 1,
-1.121471, -0.5265552, -2.485376, 1, 0.9254902, 0, 1,
-1.116422, 0.7915103, -1.879387, 1, 0.9294118, 0, 1,
-1.113397, 1.812317, -1.602027, 1, 0.9372549, 0, 1,
-1.113215, -0.7598493, -2.839504, 1, 0.9411765, 0, 1,
-1.112237, 1.574551, -0.6853071, 1, 0.9490196, 0, 1,
-1.110901, -1.482196, -1.817985, 1, 0.9529412, 0, 1,
-1.103366, -1.137993, -3.885013, 1, 0.9607843, 0, 1,
-1.085114, 0.08782473, -0.6449072, 1, 0.9647059, 0, 1,
-1.082973, 0.150774, -0.415499, 1, 0.972549, 0, 1,
-1.077511, -0.9468066, -2.953895, 1, 0.9764706, 0, 1,
-1.073816, 0.2897316, 0.8995851, 1, 0.9843137, 0, 1,
-1.068759, 1.453404, -0.8925217, 1, 0.9882353, 0, 1,
-1.058312, 0.9678419, -0.9141255, 1, 0.9960784, 0, 1,
-1.058095, 1.115813, 0.3782468, 0.9960784, 1, 0, 1,
-1.056074, -1.266082, -2.842292, 0.9921569, 1, 0, 1,
-1.055689, -0.4989779, -1.012731, 0.9843137, 1, 0, 1,
-1.05515, 0.8007199, -0.6360639, 0.9803922, 1, 0, 1,
-1.042856, -0.08467648, -1.743967, 0.972549, 1, 0, 1,
-1.039978, 0.4253713, -1.91603, 0.9686275, 1, 0, 1,
-1.035145, -0.4438959, -2.053284, 0.9607843, 1, 0, 1,
-1.034521, 0.02022785, 1.050123, 0.9568627, 1, 0, 1,
-1.034003, -1.490356, -1.810536, 0.9490196, 1, 0, 1,
-1.030444, 0.2572908, -1.863714, 0.945098, 1, 0, 1,
-1.024827, 0.1783963, -2.572016, 0.9372549, 1, 0, 1,
-1.02227, -0.4462816, -0.8132436, 0.9333333, 1, 0, 1,
-1.017195, 0.5115932, -1.826078, 0.9254902, 1, 0, 1,
-1.017176, 1.153661, -0.2346745, 0.9215686, 1, 0, 1,
-1.013027, -0.8365583, -2.927488, 0.9137255, 1, 0, 1,
-1.012846, -0.3939508, -3.639977, 0.9098039, 1, 0, 1,
-1.01228, -0.5233203, -1.917247, 0.9019608, 1, 0, 1,
-1.00833, 0.534094, 0.5367408, 0.8941177, 1, 0, 1,
-1.00798, -0.7913402, -2.644433, 0.8901961, 1, 0, 1,
-1.003381, 0.1225669, -1.494264, 0.8823529, 1, 0, 1,
-0.9802917, -0.1891568, -2.194987, 0.8784314, 1, 0, 1,
-0.9778658, -0.4415582, -2.34071, 0.8705882, 1, 0, 1,
-0.9767732, 0.4519874, -0.6275518, 0.8666667, 1, 0, 1,
-0.9754269, 2.713877, 1.364107, 0.8588235, 1, 0, 1,
-0.9624612, 0.05724251, -2.138722, 0.854902, 1, 0, 1,
-0.9578797, -0.2057625, -1.965304, 0.8470588, 1, 0, 1,
-0.9551584, -0.02691015, -1.190173, 0.8431373, 1, 0, 1,
-0.9490536, -2.912947, -2.447611, 0.8352941, 1, 0, 1,
-0.9460275, -0.178035, -2.623115, 0.8313726, 1, 0, 1,
-0.9433971, 0.05985576, -1.876047, 0.8235294, 1, 0, 1,
-0.9404067, 0.6763199, -0.5752722, 0.8196079, 1, 0, 1,
-0.9394557, -0.007754233, -0.8014762, 0.8117647, 1, 0, 1,
-0.9390336, -0.8027199, -4.843353, 0.8078431, 1, 0, 1,
-0.9286746, 0.8125318, -1.739951, 0.8, 1, 0, 1,
-0.9241048, 0.8500101, -0.5095333, 0.7921569, 1, 0, 1,
-0.9201435, -1.925331, -3.613403, 0.7882353, 1, 0, 1,
-0.9029015, 2.365179, -0.3887819, 0.7803922, 1, 0, 1,
-0.9010178, -2.255417, -2.509721, 0.7764706, 1, 0, 1,
-0.8891658, -0.7692299, -2.558746, 0.7686275, 1, 0, 1,
-0.88504, -0.5268259, -1.504418, 0.7647059, 1, 0, 1,
-0.8827025, 0.1798776, -2.008775, 0.7568628, 1, 0, 1,
-0.8731813, 0.6952598, -1.113188, 0.7529412, 1, 0, 1,
-0.8666826, 1.307403, -0.1614357, 0.7450981, 1, 0, 1,
-0.8644835, -0.08469608, -0.4071831, 0.7411765, 1, 0, 1,
-0.8574786, -0.5587559, -2.18923, 0.7333333, 1, 0, 1,
-0.8561437, 1.969863, -0.6515597, 0.7294118, 1, 0, 1,
-0.8542004, -0.3082732, -3.896181, 0.7215686, 1, 0, 1,
-0.8536266, 1.325991, -0.7610807, 0.7176471, 1, 0, 1,
-0.8459435, -0.3265449, -2.257982, 0.7098039, 1, 0, 1,
-0.8440146, 0.4579577, -1.055226, 0.7058824, 1, 0, 1,
-0.8425573, -0.1324995, -1.645263, 0.6980392, 1, 0, 1,
-0.8323666, 1.187173, 1.108993, 0.6901961, 1, 0, 1,
-0.8319539, 0.9065201, -2.026386, 0.6862745, 1, 0, 1,
-0.8232708, -0.004441226, -1.392518, 0.6784314, 1, 0, 1,
-0.8212889, -1.583308, -1.969005, 0.6745098, 1, 0, 1,
-0.8204871, 1.842315, 0.4490787, 0.6666667, 1, 0, 1,
-0.8166878, -1.697988, -1.792393, 0.6627451, 1, 0, 1,
-0.8164464, -0.6818869, -3.21528, 0.654902, 1, 0, 1,
-0.8118457, -1.125605, -3.110973, 0.6509804, 1, 0, 1,
-0.8097441, -2.833032, -2.887265, 0.6431373, 1, 0, 1,
-0.8068711, -1.425598, -0.3336601, 0.6392157, 1, 0, 1,
-0.8017261, -0.3985615, -1.54303, 0.6313726, 1, 0, 1,
-0.7987589, -0.7030269, -2.841076, 0.627451, 1, 0, 1,
-0.7981018, -0.2535781, -3.055432, 0.6196079, 1, 0, 1,
-0.7945553, 0.4764358, -2.36449, 0.6156863, 1, 0, 1,
-0.7939774, 1.3971, -2.046726, 0.6078432, 1, 0, 1,
-0.7883531, 1.505988, -0.9275126, 0.6039216, 1, 0, 1,
-0.7769646, -0.9697741, -3.024689, 0.5960785, 1, 0, 1,
-0.7762716, 1.448557, 0.1451908, 0.5882353, 1, 0, 1,
-0.7757728, -0.8262902, -2.032973, 0.5843138, 1, 0, 1,
-0.7741772, 2.12541, -0.3726974, 0.5764706, 1, 0, 1,
-0.7733147, 0.2100953, -0.4472107, 0.572549, 1, 0, 1,
-0.7727665, -1.175771, -3.770204, 0.5647059, 1, 0, 1,
-0.7703219, 0.1644519, -1.958018, 0.5607843, 1, 0, 1,
-0.7689646, -0.422515, -2.292782, 0.5529412, 1, 0, 1,
-0.7660603, -1.023593, -2.629056, 0.5490196, 1, 0, 1,
-0.756838, -0.8370631, -2.049324, 0.5411765, 1, 0, 1,
-0.7563495, -0.4787778, -4.057123, 0.5372549, 1, 0, 1,
-0.7546057, -0.3602574, -2.80142, 0.5294118, 1, 0, 1,
-0.752775, 0.5084803, -0.9734077, 0.5254902, 1, 0, 1,
-0.7436113, 0.9876554, -0.9485064, 0.5176471, 1, 0, 1,
-0.7381438, 0.7819483, -2.870556, 0.5137255, 1, 0, 1,
-0.7362414, 0.3420527, -1.100812, 0.5058824, 1, 0, 1,
-0.7332688, -1.836683, -2.639686, 0.5019608, 1, 0, 1,
-0.7310601, -0.8207762, -1.167087, 0.4941176, 1, 0, 1,
-0.723923, -0.2063698, -0.7478373, 0.4862745, 1, 0, 1,
-0.7238654, -1.672548, -2.359848, 0.4823529, 1, 0, 1,
-0.7230645, 0.6480598, 0.3747746, 0.4745098, 1, 0, 1,
-0.7226613, -0.02394685, -1.899671, 0.4705882, 1, 0, 1,
-0.7200989, 0.9101007, 0.4070228, 0.4627451, 1, 0, 1,
-0.7195538, -1.412921, -1.575769, 0.4588235, 1, 0, 1,
-0.7165129, -0.3556136, -2.648752, 0.4509804, 1, 0, 1,
-0.7157774, -1.689799, -3.927345, 0.4470588, 1, 0, 1,
-0.7088238, 0.4464135, -0.5714078, 0.4392157, 1, 0, 1,
-0.7046412, 0.2628809, -1.831092, 0.4352941, 1, 0, 1,
-0.702161, 1.224543, 0.09123922, 0.427451, 1, 0, 1,
-0.6969175, -0.2886312, -1.027511, 0.4235294, 1, 0, 1,
-0.6957555, -1.206352, -2.958173, 0.4156863, 1, 0, 1,
-0.6924079, 0.07570331, -1.626566, 0.4117647, 1, 0, 1,
-0.6866598, -0.889838, -3.490949, 0.4039216, 1, 0, 1,
-0.6819564, 0.03683088, -1.134084, 0.3960784, 1, 0, 1,
-0.681752, -1.410755, -1.926206, 0.3921569, 1, 0, 1,
-0.676853, -0.4470274, -1.834665, 0.3843137, 1, 0, 1,
-0.6741691, 0.3493671, -1.710409, 0.3803922, 1, 0, 1,
-0.6741586, 1.604626, 0.1878976, 0.372549, 1, 0, 1,
-0.669942, -0.3604727, -1.461491, 0.3686275, 1, 0, 1,
-0.656467, -0.3565361, -0.1832937, 0.3607843, 1, 0, 1,
-0.6560659, -0.671168, -2.499896, 0.3568628, 1, 0, 1,
-0.6527471, 0.5036642, -1.225322, 0.3490196, 1, 0, 1,
-0.6520244, -0.623212, -2.02711, 0.345098, 1, 0, 1,
-0.6495737, 1.11702, -0.869172, 0.3372549, 1, 0, 1,
-0.6474568, -0.4282601, -1.742997, 0.3333333, 1, 0, 1,
-0.6378635, 1.949652, -0.5849019, 0.3254902, 1, 0, 1,
-0.6363906, 2.325593, 0.2266939, 0.3215686, 1, 0, 1,
-0.6354324, -0.4529974, -2.880457, 0.3137255, 1, 0, 1,
-0.6297164, 0.03406433, -1.388327, 0.3098039, 1, 0, 1,
-0.6289054, -0.9132956, -3.560788, 0.3019608, 1, 0, 1,
-0.6236566, -1.072611, -2.271254, 0.2941177, 1, 0, 1,
-0.6168758, -0.8173583, -3.004588, 0.2901961, 1, 0, 1,
-0.6112553, -0.0820007, -0.9244629, 0.282353, 1, 0, 1,
-0.6106231, 2.066789, 0.4766722, 0.2784314, 1, 0, 1,
-0.6014894, 0.8583438, 1.260596, 0.2705882, 1, 0, 1,
-0.59895, -2.16015, -2.252274, 0.2666667, 1, 0, 1,
-0.5976495, -0.3455364, 0.6374949, 0.2588235, 1, 0, 1,
-0.5967858, -1.227618, -1.936398, 0.254902, 1, 0, 1,
-0.5957906, 1.064151, -2.302206, 0.2470588, 1, 0, 1,
-0.594997, 0.8149754, -0.9046698, 0.2431373, 1, 0, 1,
-0.5945799, 1.079447, 0.2482806, 0.2352941, 1, 0, 1,
-0.5904328, 0.5217904, -2.994081, 0.2313726, 1, 0, 1,
-0.5901974, 1.612367, -0.9486703, 0.2235294, 1, 0, 1,
-0.5851978, -1.16967, -3.520776, 0.2196078, 1, 0, 1,
-0.5829781, -0.009708815, -0.06908607, 0.2117647, 1, 0, 1,
-0.5810966, -0.776808, -3.506951, 0.2078431, 1, 0, 1,
-0.579146, 0.4198641, -0.7751306, 0.2, 1, 0, 1,
-0.5771263, 0.6334556, -1.45308, 0.1921569, 1, 0, 1,
-0.5764459, -0.6496322, -1.864485, 0.1882353, 1, 0, 1,
-0.5735666, -0.2652999, -1.591463, 0.1803922, 1, 0, 1,
-0.5671577, 0.7629533, -1.014223, 0.1764706, 1, 0, 1,
-0.5663012, 1.05013, 0.9895147, 0.1686275, 1, 0, 1,
-0.559669, 2.406567, 0.1095001, 0.1647059, 1, 0, 1,
-0.5575711, -0.5895409, -1.083281, 0.1568628, 1, 0, 1,
-0.5533219, 0.6505705, -0.1243797, 0.1529412, 1, 0, 1,
-0.5511242, -1.516324, -3.760893, 0.145098, 1, 0, 1,
-0.5493356, -0.4126829, -1.994253, 0.1411765, 1, 0, 1,
-0.5487274, -0.8085779, -1.197545, 0.1333333, 1, 0, 1,
-0.5484741, 0.8515944, -0.1131907, 0.1294118, 1, 0, 1,
-0.5462945, 0.5384506, -0.2818236, 0.1215686, 1, 0, 1,
-0.5419173, -0.9112907, -3.142816, 0.1176471, 1, 0, 1,
-0.5401576, -1.083067, -1.214335, 0.1098039, 1, 0, 1,
-0.5388788, 0.6637, 1.419173, 0.1058824, 1, 0, 1,
-0.5388612, 0.2620136, -0.5203034, 0.09803922, 1, 0, 1,
-0.5363535, -0.2132597, -2.483232, 0.09019608, 1, 0, 1,
-0.5359861, 2.775313, -0.62681, 0.08627451, 1, 0, 1,
-0.5276197, -1.042387, -4.456609, 0.07843138, 1, 0, 1,
-0.5257553, 0.2193021, -1.515923, 0.07450981, 1, 0, 1,
-0.5252501, -0.3411282, -2.210287, 0.06666667, 1, 0, 1,
-0.5228447, -0.6148449, -1.523576, 0.0627451, 1, 0, 1,
-0.52166, -0.7439455, -1.585199, 0.05490196, 1, 0, 1,
-0.5204254, 0.3665618, 0.03244707, 0.05098039, 1, 0, 1,
-0.5202312, 0.001963994, -3.070207, 0.04313726, 1, 0, 1,
-0.5148841, -0.1477731, -2.622913, 0.03921569, 1, 0, 1,
-0.5136916, 0.07009251, -0.8196395, 0.03137255, 1, 0, 1,
-0.5048435, 1.443594, 0.292432, 0.02745098, 1, 0, 1,
-0.4993648, -0.003671635, -2.533819, 0.01960784, 1, 0, 1,
-0.496154, -0.4799757, -2.410419, 0.01568628, 1, 0, 1,
-0.4937914, 0.6156909, 0.3640141, 0.007843138, 1, 0, 1,
-0.4917587, -1.052805, -1.892037, 0.003921569, 1, 0, 1,
-0.4907106, -0.3263477, -1.421883, 0, 1, 0.003921569, 1,
-0.4867145, -0.7900215, -3.242776, 0, 1, 0.01176471, 1,
-0.4841735, -0.7211207, -3.122953, 0, 1, 0.01568628, 1,
-0.4839989, -0.8929418, -1.464318, 0, 1, 0.02352941, 1,
-0.4790127, 2.076473, 0.1241274, 0, 1, 0.02745098, 1,
-0.4785789, 0.4113074, -0.6748393, 0, 1, 0.03529412, 1,
-0.4762019, -0.7825286, -1.252679, 0, 1, 0.03921569, 1,
-0.4760152, 0.03000653, -2.386755, 0, 1, 0.04705882, 1,
-0.4755286, -0.6948835, -1.223958, 0, 1, 0.05098039, 1,
-0.4745187, -0.6571336, -3.809999, 0, 1, 0.05882353, 1,
-0.4720497, 0.7482122, -0.1181532, 0, 1, 0.0627451, 1,
-0.4696555, 0.0605323, -0.6794914, 0, 1, 0.07058824, 1,
-0.4624596, 1.828487, 0.5869188, 0, 1, 0.07450981, 1,
-0.4615575, 0.6940859, -0.4009797, 0, 1, 0.08235294, 1,
-0.4606846, 0.4670059, 0.3285529, 0, 1, 0.08627451, 1,
-0.4564253, -0.2123808, -1.087736, 0, 1, 0.09411765, 1,
-0.4527501, 1.329184, 0.5478715, 0, 1, 0.1019608, 1,
-0.4522896, -0.8085167, -3.265284, 0, 1, 0.1058824, 1,
-0.4497252, 0.2681434, -0.7741441, 0, 1, 0.1137255, 1,
-0.446632, -0.4927385, -2.249237, 0, 1, 0.1176471, 1,
-0.4450522, -0.04922429, -1.462806, 0, 1, 0.1254902, 1,
-0.44333, 1.087075, -0.2161377, 0, 1, 0.1294118, 1,
-0.4427757, 0.2319089, -1.61522, 0, 1, 0.1372549, 1,
-0.4418814, -1.76, -3.319909, 0, 1, 0.1411765, 1,
-0.4415392, -1.693429, -2.957935, 0, 1, 0.1490196, 1,
-0.4394997, -0.7494593, -1.255455, 0, 1, 0.1529412, 1,
-0.4382967, -1.48482, -3.234065, 0, 1, 0.1607843, 1,
-0.4357519, 0.5804617, -1.092078, 0, 1, 0.1647059, 1,
-0.4349367, -0.1809805, -0.9439304, 0, 1, 0.172549, 1,
-0.4330387, -1.196734, -2.262989, 0, 1, 0.1764706, 1,
-0.4321233, -1.889175, -0.8312508, 0, 1, 0.1843137, 1,
-0.4318746, 0.9273821, -0.6533812, 0, 1, 0.1882353, 1,
-0.4291175, 1.845337, -1.423701, 0, 1, 0.1960784, 1,
-0.4234066, -0.4092598, -1.327362, 0, 1, 0.2039216, 1,
-0.4186811, -1.613806, -3.427505, 0, 1, 0.2078431, 1,
-0.4156814, 0.5062762, -1.855798, 0, 1, 0.2156863, 1,
-0.4145246, -0.01763963, -0.7754772, 0, 1, 0.2196078, 1,
-0.4133176, 0.4340417, -0.743126, 0, 1, 0.227451, 1,
-0.4090102, -0.1536503, -1.000118, 0, 1, 0.2313726, 1,
-0.4087151, 0.1736499, -0.7937673, 0, 1, 0.2392157, 1,
-0.4084529, -1.86249, -3.011404, 0, 1, 0.2431373, 1,
-0.406357, 1.26679, -1.811254, 0, 1, 0.2509804, 1,
-0.4040944, -0.1134687, -1.388808, 0, 1, 0.254902, 1,
-0.4040627, -1.32513, -3.895464, 0, 1, 0.2627451, 1,
-0.402294, 0.06379271, -1.1523, 0, 1, 0.2666667, 1,
-0.4013261, -2.693674, -3.284276, 0, 1, 0.2745098, 1,
-0.4009579, -0.670054, -3.438559, 0, 1, 0.2784314, 1,
-0.4006902, 0.3908651, -3.18451, 0, 1, 0.2862745, 1,
-0.399716, 0.7176051, -0.5942509, 0, 1, 0.2901961, 1,
-0.3985699, -0.02395259, -1.437807, 0, 1, 0.2980392, 1,
-0.3984024, 0.7831616, -0.08241397, 0, 1, 0.3058824, 1,
-0.3961288, -0.6805434, -3.29329, 0, 1, 0.3098039, 1,
-0.3936332, 0.413213, -1.23052, 0, 1, 0.3176471, 1,
-0.3898908, -0.55379, -2.962912, 0, 1, 0.3215686, 1,
-0.3814209, -0.1455402, -2.022203, 0, 1, 0.3294118, 1,
-0.3794481, -0.3841962, -1.611803, 0, 1, 0.3333333, 1,
-0.3791153, 0.1104898, -2.020998, 0, 1, 0.3411765, 1,
-0.3783138, 0.6910154, -0.7611258, 0, 1, 0.345098, 1,
-0.3738024, -0.4133375, -2.619669, 0, 1, 0.3529412, 1,
-0.3728471, 1.952209, -1.695392, 0, 1, 0.3568628, 1,
-0.3711635, 0.2211966, -2.534908, 0, 1, 0.3647059, 1,
-0.3696685, -0.2367799, -0.8572086, 0, 1, 0.3686275, 1,
-0.3651806, -0.01527223, 0.8214852, 0, 1, 0.3764706, 1,
-0.3649371, 0.3005734, -0.6721318, 0, 1, 0.3803922, 1,
-0.3645191, 0.2681903, 0.6187433, 0, 1, 0.3882353, 1,
-0.3635705, 1.121222, -0.2524071, 0, 1, 0.3921569, 1,
-0.3633359, 0.08129293, -3.487029, 0, 1, 0.4, 1,
-0.3604829, 1.34036, 1.548463, 0, 1, 0.4078431, 1,
-0.3574849, -1.283193, -2.511083, 0, 1, 0.4117647, 1,
-0.35454, -1.858997, -2.548851, 0, 1, 0.4196078, 1,
-0.3543116, 0.3978594, -1.679619, 0, 1, 0.4235294, 1,
-0.349127, -1.651668, -4.992857, 0, 1, 0.4313726, 1,
-0.3479905, 1.026714, -1.561799, 0, 1, 0.4352941, 1,
-0.346749, -1.015468, -3.246149, 0, 1, 0.4431373, 1,
-0.3452851, 0.6769268, -0.6653555, 0, 1, 0.4470588, 1,
-0.345143, 0.1614123, -1.784633, 0, 1, 0.454902, 1,
-0.3420887, -0.2721572, -2.409805, 0, 1, 0.4588235, 1,
-0.341715, 0.239562, -0.05636626, 0, 1, 0.4666667, 1,
-0.3413696, -0.1389699, -1.358642, 0, 1, 0.4705882, 1,
-0.3410758, -0.3212902, -2.313643, 0, 1, 0.4784314, 1,
-0.3365236, -0.709069, -2.043897, 0, 1, 0.4823529, 1,
-0.3277904, -0.455465, -4.315855, 0, 1, 0.4901961, 1,
-0.3225122, -0.1168109, -1.016399, 0, 1, 0.4941176, 1,
-0.3218632, 0.07214141, -1.664837, 0, 1, 0.5019608, 1,
-0.3166901, 1.799657, 0.537659, 0, 1, 0.509804, 1,
-0.3161397, -0.4876476, -3.323453, 0, 1, 0.5137255, 1,
-0.3139852, 1.280435, -0.8472998, 0, 1, 0.5215687, 1,
-0.3132593, -0.3683501, -2.592622, 0, 1, 0.5254902, 1,
-0.3108194, 0.3067137, -0.7124159, 0, 1, 0.5333334, 1,
-0.3091766, 0.9613711, -1.379301, 0, 1, 0.5372549, 1,
-0.3084939, 0.2881895, -2.012062, 0, 1, 0.5450981, 1,
-0.3055655, 0.3842119, -0.6428725, 0, 1, 0.5490196, 1,
-0.305341, 0.03022204, -3.611584, 0, 1, 0.5568628, 1,
-0.3044991, -0.1839086, -3.489852, 0, 1, 0.5607843, 1,
-0.3016571, 1.635291, 0.4813253, 0, 1, 0.5686275, 1,
-0.3015071, 0.9581028, -2.839951, 0, 1, 0.572549, 1,
-0.301064, -1.070056, -3.190283, 0, 1, 0.5803922, 1,
-0.3002421, -0.5989782, -4.081618, 0, 1, 0.5843138, 1,
-0.2962207, 0.8227875, -1.089371, 0, 1, 0.5921569, 1,
-0.2907971, 0.3839253, -2.551952, 0, 1, 0.5960785, 1,
-0.2898803, 1.220853, -0.330995, 0, 1, 0.6039216, 1,
-0.2873568, -0.1018964, -0.5378287, 0, 1, 0.6117647, 1,
-0.2842308, 1.230319, -2.639807, 0, 1, 0.6156863, 1,
-0.2837582, 1.680791, -2.910764, 0, 1, 0.6235294, 1,
-0.280567, 0.8111904, 0.4294045, 0, 1, 0.627451, 1,
-0.2704513, -0.4041546, -2.492197, 0, 1, 0.6352941, 1,
-0.2676131, -0.3840275, -1.767725, 0, 1, 0.6392157, 1,
-0.2666191, 0.6990063, -0.459352, 0, 1, 0.6470588, 1,
-0.2636244, 0.3643305, -0.920616, 0, 1, 0.6509804, 1,
-0.2620273, 0.04067966, -1.707348, 0, 1, 0.6588235, 1,
-0.260205, 0.4507724, 0.3907458, 0, 1, 0.6627451, 1,
-0.2475547, 0.6017454, -2.14021, 0, 1, 0.6705883, 1,
-0.2466258, -1.46806, -4.366805, 0, 1, 0.6745098, 1,
-0.2465302, -1.218907, -3.661116, 0, 1, 0.682353, 1,
-0.2455153, -0.8820181, -3.251449, 0, 1, 0.6862745, 1,
-0.2451093, -0.05582128, -1.633447, 0, 1, 0.6941177, 1,
-0.2450152, 1.87009, 0.3222951, 0, 1, 0.7019608, 1,
-0.2432346, 0.5655611, -0.6219024, 0, 1, 0.7058824, 1,
-0.2418017, 1.123178, -0.4022896, 0, 1, 0.7137255, 1,
-0.2374048, 0.875881, 0.08964112, 0, 1, 0.7176471, 1,
-0.2367856, -0.2052841, -1.809924, 0, 1, 0.7254902, 1,
-0.2349287, 0.9579126, 0.6543038, 0, 1, 0.7294118, 1,
-0.2348735, -0.653467, -2.948095, 0, 1, 0.7372549, 1,
-0.234607, -0.3235944, -4.85511, 0, 1, 0.7411765, 1,
-0.2340588, -0.3842159, -2.280611, 0, 1, 0.7490196, 1,
-0.215692, 0.4363615, -0.5935637, 0, 1, 0.7529412, 1,
-0.2072714, -0.2680436, -2.442735, 0, 1, 0.7607843, 1,
-0.1974442, 1.101715, -0.6024039, 0, 1, 0.7647059, 1,
-0.1937212, 0.8436696, -0.5027089, 0, 1, 0.772549, 1,
-0.1916765, 0.33337, 0.3484869, 0, 1, 0.7764706, 1,
-0.1889676, 0.2176574, -0.1447233, 0, 1, 0.7843137, 1,
-0.187677, 1.587481, -1.963899, 0, 1, 0.7882353, 1,
-0.1868896, -9.006696e-05, 0.1270949, 0, 1, 0.7960784, 1,
-0.1859728, 0.07259022, -0.9927463, 0, 1, 0.8039216, 1,
-0.1802134, -1.027987, -3.586336, 0, 1, 0.8078431, 1,
-0.176201, 0.219209, 0.09553406, 0, 1, 0.8156863, 1,
-0.1755671, 1.343142, -1.325776, 0, 1, 0.8196079, 1,
-0.172224, -0.5552357, -2.015911, 0, 1, 0.827451, 1,
-0.1698075, -1.156024, -3.890271, 0, 1, 0.8313726, 1,
-0.1644518, -0.544126, -1.935753, 0, 1, 0.8392157, 1,
-0.1642169, -2.164513, -4.036299, 0, 1, 0.8431373, 1,
-0.1633459, -0.8678363, -1.494971, 0, 1, 0.8509804, 1,
-0.1585016, -0.1414689, -2.867311, 0, 1, 0.854902, 1,
-0.1581403, 0.497466, -1.616135, 0, 1, 0.8627451, 1,
-0.155722, 0.2756358, -1.09991, 0, 1, 0.8666667, 1,
-0.1471479, 0.7434927, -0.8491769, 0, 1, 0.8745098, 1,
-0.1455125, -1.91521, -2.971261, 0, 1, 0.8784314, 1,
-0.1429571, 1.037247, 0.3778341, 0, 1, 0.8862745, 1,
-0.1402948, 0.07183123, -0.7732408, 0, 1, 0.8901961, 1,
-0.1389851, 0.08792512, -1.079216, 0, 1, 0.8980392, 1,
-0.1348144, 0.5776321, 0.1273874, 0, 1, 0.9058824, 1,
-0.1307851, -0.4789764, -2.667771, 0, 1, 0.9098039, 1,
-0.1304823, 0.8084991, 0.1064566, 0, 1, 0.9176471, 1,
-0.1293428, -0.04781117, -2.210513, 0, 1, 0.9215686, 1,
-0.1277024, 0.4425395, -1.294504, 0, 1, 0.9294118, 1,
-0.1248403, -0.5150332, -3.739398, 0, 1, 0.9333333, 1,
-0.1239202, -0.6453191, -1.86633, 0, 1, 0.9411765, 1,
-0.1207194, 0.07735034, -0.6112303, 0, 1, 0.945098, 1,
-0.114066, -0.3018285, -1.96936, 0, 1, 0.9529412, 1,
-0.1104125, -1.097128, -2.929634, 0, 1, 0.9568627, 1,
-0.1076211, -0.8804661, -3.877606, 0, 1, 0.9647059, 1,
-0.1071014, -0.2928859, -2.748508, 0, 1, 0.9686275, 1,
-0.1028887, 0.2340971, -0.3827902, 0, 1, 0.9764706, 1,
-0.1020742, -1.297684, -3.872775, 0, 1, 0.9803922, 1,
-0.1006959, 0.009478061, -4.173401, 0, 1, 0.9882353, 1,
-0.09497067, 1.300283, 0.6774111, 0, 1, 0.9921569, 1,
-0.09341744, -1.018698, -2.501707, 0, 1, 1, 1,
-0.08933949, 0.439694, 0.8162675, 0, 0.9921569, 1, 1,
-0.08692473, 0.5389571, 2.042591, 0, 0.9882353, 1, 1,
-0.08440968, -0.4068636, -6.750165, 0, 0.9803922, 1, 1,
-0.07898781, 0.8854321, 0.5798769, 0, 0.9764706, 1, 1,
-0.07781106, 0.2023247, 0.773165, 0, 0.9686275, 1, 1,
-0.07489727, 0.01269945, -0.9523646, 0, 0.9647059, 1, 1,
-0.07380069, -0.6617049, -3.518663, 0, 0.9568627, 1, 1,
-0.07194817, 0.104992, -2.788176, 0, 0.9529412, 1, 1,
-0.06585566, 1.072989, 0.7045582, 0, 0.945098, 1, 1,
-0.06474815, -1.860179, -3.807282, 0, 0.9411765, 1, 1,
-0.06453473, 0.07842022, -0.9611412, 0, 0.9333333, 1, 1,
-0.06373361, 0.1761429, -0.4353358, 0, 0.9294118, 1, 1,
-0.05198352, -0.6166708, -1.525794, 0, 0.9215686, 1, 1,
-0.0455115, 2.406728, -1.061727, 0, 0.9176471, 1, 1,
-0.04498606, -0.6868503, -4.027369, 0, 0.9098039, 1, 1,
-0.03582524, -0.388189, -2.554855, 0, 0.9058824, 1, 1,
-0.03329324, 2.314728, -0.6981953, 0, 0.8980392, 1, 1,
-0.03218638, 1.110811, 1.190767, 0, 0.8901961, 1, 1,
-0.03173361, -2.649092, -3.534413, 0, 0.8862745, 1, 1,
-0.02320181, 0.3061474, -1.302204, 0, 0.8784314, 1, 1,
-0.02208369, 0.1181194, 0.4731132, 0, 0.8745098, 1, 1,
-0.02177253, -0.4611129, -4.138898, 0, 0.8666667, 1, 1,
-0.01592465, -1.276211, -3.428838, 0, 0.8627451, 1, 1,
-0.01416627, 1.301656, -0.6694561, 0, 0.854902, 1, 1,
-0.01308181, 1.730103, 0.4924918, 0, 0.8509804, 1, 1,
-0.01305212, 0.1081447, -1.114668, 0, 0.8431373, 1, 1,
-0.01152714, -1.494499, -3.153682, 0, 0.8392157, 1, 1,
-0.01094435, -0.7108291, -2.52112, 0, 0.8313726, 1, 1,
-0.007622353, 1.941205, -0.8421655, 0, 0.827451, 1, 1,
-0.007508495, 0.6979024, -0.6380594, 0, 0.8196079, 1, 1,
-0.006699171, -0.5539511, -2.855588, 0, 0.8156863, 1, 1,
-0.006541391, 0.9809769, 0.569135, 0, 0.8078431, 1, 1,
-0.005373019, -0.7731063, -3.081664, 0, 0.8039216, 1, 1,
-0.005060142, 0.8552321, 0.07400694, 0, 0.7960784, 1, 1,
0.004492503, -0.1209425, 2.435565, 0, 0.7882353, 1, 1,
0.007805498, 0.5849571, -1.985144, 0, 0.7843137, 1, 1,
0.008016428, -0.7967874, 2.994421, 0, 0.7764706, 1, 1,
0.009401382, -0.8660102, 3.577466, 0, 0.772549, 1, 1,
0.01402909, -0.02030755, 1.890941, 0, 0.7647059, 1, 1,
0.01720859, 0.07681054, -0.3073449, 0, 0.7607843, 1, 1,
0.0180038, -0.4298165, 1.259032, 0, 0.7529412, 1, 1,
0.02430128, -0.7982002, 2.562927, 0, 0.7490196, 1, 1,
0.02505248, -0.0350712, 3.568614, 0, 0.7411765, 1, 1,
0.02551463, -0.5027912, 1.858294, 0, 0.7372549, 1, 1,
0.02897397, -0.7623373, 4.9339, 0, 0.7294118, 1, 1,
0.03600424, 0.1904488, -1.104787, 0, 0.7254902, 1, 1,
0.03896029, 0.2426867, -1.913011, 0, 0.7176471, 1, 1,
0.04462626, 0.2164644, 2.184767, 0, 0.7137255, 1, 1,
0.04837843, 0.240422, 0.02511952, 0, 0.7058824, 1, 1,
0.05182736, 0.1976326, -0.4147892, 0, 0.6980392, 1, 1,
0.05290314, -0.181281, 2.279464, 0, 0.6941177, 1, 1,
0.05326201, -0.09676494, 3.789854, 0, 0.6862745, 1, 1,
0.05442231, -1.311363, 3.334718, 0, 0.682353, 1, 1,
0.05639462, 0.02768357, 1.268574, 0, 0.6745098, 1, 1,
0.05683531, 0.6912297, 0.8351056, 0, 0.6705883, 1, 1,
0.06267668, 1.606705, 0.1640915, 0, 0.6627451, 1, 1,
0.06451274, 0.03057223, 1.432339, 0, 0.6588235, 1, 1,
0.06988913, 2.218387, -0.3152275, 0, 0.6509804, 1, 1,
0.07508957, 0.1965813, 0.137788, 0, 0.6470588, 1, 1,
0.08236118, 0.01944862, 1.683613, 0, 0.6392157, 1, 1,
0.08583973, -0.868184, 3.959507, 0, 0.6352941, 1, 1,
0.08944532, -1.061612, 3.378336, 0, 0.627451, 1, 1,
0.08957029, 0.5251166, 1.801367, 0, 0.6235294, 1, 1,
0.09445916, -0.1503866, 4.444956, 0, 0.6156863, 1, 1,
0.09538743, 0.4375528, -0.8765314, 0, 0.6117647, 1, 1,
0.1023355, -0.3500667, 2.81981, 0, 0.6039216, 1, 1,
0.1035439, -0.1963283, 1.821455, 0, 0.5960785, 1, 1,
0.10442, 0.4974463, -0.1876206, 0, 0.5921569, 1, 1,
0.1116148, 2.064728, 0.825154, 0, 0.5843138, 1, 1,
0.1203066, -0.3543552, 2.228672, 0, 0.5803922, 1, 1,
0.1252534, 2.396976, -0.2382871, 0, 0.572549, 1, 1,
0.1255479, 1.449275, 0.5995257, 0, 0.5686275, 1, 1,
0.1295184, 0.04322413, -0.356946, 0, 0.5607843, 1, 1,
0.1306601, 0.62558, 1.115569, 0, 0.5568628, 1, 1,
0.1356589, 0.8112372, 0.309392, 0, 0.5490196, 1, 1,
0.1363009, -1.060254, 3.358182, 0, 0.5450981, 1, 1,
0.1389807, -0.3643764, 3.269946, 0, 0.5372549, 1, 1,
0.1399489, -1.860425, 2.165787, 0, 0.5333334, 1, 1,
0.1433174, -0.3883764, 1.941035, 0, 0.5254902, 1, 1,
0.1453777, -1.487769, 1.966623, 0, 0.5215687, 1, 1,
0.1455591, -1.012282, 3.436657, 0, 0.5137255, 1, 1,
0.150245, -0.1502202, 2.868785, 0, 0.509804, 1, 1,
0.1538002, -0.05944868, 2.368845, 0, 0.5019608, 1, 1,
0.1559647, 0.8973103, -1.733804, 0, 0.4941176, 1, 1,
0.1587283, 0.2703865, -0.1298977, 0, 0.4901961, 1, 1,
0.159033, 2.181581, -0.7500837, 0, 0.4823529, 1, 1,
0.168146, 0.5640614, 1.266283, 0, 0.4784314, 1, 1,
0.1698409, 0.04137645, 0.5741657, 0, 0.4705882, 1, 1,
0.1706395, -0.5730965, 2.370373, 0, 0.4666667, 1, 1,
0.1723339, 0.1395291, 1.437101, 0, 0.4588235, 1, 1,
0.1725716, 0.3232289, 0.8229106, 0, 0.454902, 1, 1,
0.175119, 1.983655, 0.3470332, 0, 0.4470588, 1, 1,
0.1762168, -0.6189795, 0.8306367, 0, 0.4431373, 1, 1,
0.1831654, -0.8557283, 2.733536, 0, 0.4352941, 1, 1,
0.1870803, 1.274847, -0.249294, 0, 0.4313726, 1, 1,
0.1885662, -0.4388372, 1.41632, 0, 0.4235294, 1, 1,
0.1904667, -1.314996, 1.780857, 0, 0.4196078, 1, 1,
0.1931621, -0.4766266, 2.284752, 0, 0.4117647, 1, 1,
0.1969867, 1.535805, -0.1182397, 0, 0.4078431, 1, 1,
0.1981339, -0.5605356, 2.937196, 0, 0.4, 1, 1,
0.2007893, 0.5180153, -0.7784806, 0, 0.3921569, 1, 1,
0.2133336, 1.285927, -0.4573374, 0, 0.3882353, 1, 1,
0.2146832, 0.55169, 1.860851, 0, 0.3803922, 1, 1,
0.2169213, -0.3460505, 3.558172, 0, 0.3764706, 1, 1,
0.2171203, 0.1070156, 2.754521, 0, 0.3686275, 1, 1,
0.2175988, -0.3507156, 2.42913, 0, 0.3647059, 1, 1,
0.2258266, -0.3373822, 1.720413, 0, 0.3568628, 1, 1,
0.2264184, 0.09314413, 1.713714, 0, 0.3529412, 1, 1,
0.230838, 0.9748338, 0.6470113, 0, 0.345098, 1, 1,
0.2336054, -0.8699193, 1.296157, 0, 0.3411765, 1, 1,
0.2352089, -0.9854857, 3.247186, 0, 0.3333333, 1, 1,
0.2362398, 0.8463073, 2.220517, 0, 0.3294118, 1, 1,
0.240555, -0.171749, 2.695167, 0, 0.3215686, 1, 1,
0.2440369, 0.3616059, 0.7687275, 0, 0.3176471, 1, 1,
0.2449044, -1.224608, 3.191354, 0, 0.3098039, 1, 1,
0.2455947, -1.618993, 2.530189, 0, 0.3058824, 1, 1,
0.2516138, 1.095892, -1.014995, 0, 0.2980392, 1, 1,
0.2549699, -0.4753077, 1.959558, 0, 0.2901961, 1, 1,
0.2575277, -0.4419877, 1.250504, 0, 0.2862745, 1, 1,
0.2587657, -0.4264536, 2.319655, 0, 0.2784314, 1, 1,
0.2590323, -0.149468, 3.498613, 0, 0.2745098, 1, 1,
0.2632914, -1.036303, 3.813816, 0, 0.2666667, 1, 1,
0.2634095, -0.05920255, 3.334682, 0, 0.2627451, 1, 1,
0.2645086, -0.570209, 2.369353, 0, 0.254902, 1, 1,
0.2661827, -0.8633395, 2.765968, 0, 0.2509804, 1, 1,
0.2670009, -0.5189582, 0.6337659, 0, 0.2431373, 1, 1,
0.2713231, 0.02191706, 1.128996, 0, 0.2392157, 1, 1,
0.2721378, -0.5532411, 2.402163, 0, 0.2313726, 1, 1,
0.2729986, 0.2230957, 0.1008954, 0, 0.227451, 1, 1,
0.2783123, -0.31305, 2.729856, 0, 0.2196078, 1, 1,
0.2838761, -1.115689, 2.543349, 0, 0.2156863, 1, 1,
0.28594, 0.5699136, 1.138247, 0, 0.2078431, 1, 1,
0.2875793, 0.7989365, -0.5609066, 0, 0.2039216, 1, 1,
0.2876847, -0.2464024, 3.644874, 0, 0.1960784, 1, 1,
0.2891653, -0.6422727, 0.704369, 0, 0.1882353, 1, 1,
0.2901763, 1.054367, -1.061656, 0, 0.1843137, 1, 1,
0.303028, 0.4243157, 1.69895, 0, 0.1764706, 1, 1,
0.3101988, 0.9534148, 0.006097888, 0, 0.172549, 1, 1,
0.3109426, 0.6786911, 0.01377503, 0, 0.1647059, 1, 1,
0.3123978, -0.2017387, 2.855096, 0, 0.1607843, 1, 1,
0.3128814, 3.151891, 0.9882641, 0, 0.1529412, 1, 1,
0.3201288, 0.1383077, 2.002322, 0, 0.1490196, 1, 1,
0.3221516, 2.170099, 0.03915251, 0, 0.1411765, 1, 1,
0.3290685, 0.8438886, 1.917221, 0, 0.1372549, 1, 1,
0.3317737, 0.809998, 0.7071835, 0, 0.1294118, 1, 1,
0.3349485, -0.1577763, 3.181967, 0, 0.1254902, 1, 1,
0.3360784, -3.244895, 2.493591, 0, 0.1176471, 1, 1,
0.3379394, -0.2903821, 2.004571, 0, 0.1137255, 1, 1,
0.3383942, 1.504839, -0.29487, 0, 0.1058824, 1, 1,
0.3387219, 0.5448702, 0.6271419, 0, 0.09803922, 1, 1,
0.3398037, -0.003968212, 4.485839, 0, 0.09411765, 1, 1,
0.3406332, 1.55249, -1.940251, 0, 0.08627451, 1, 1,
0.3411675, -0.4853263, 1.409041, 0, 0.08235294, 1, 1,
0.3439622, 0.3013411, -1.093548, 0, 0.07450981, 1, 1,
0.3503358, 0.4599603, 0.5694367, 0, 0.07058824, 1, 1,
0.3535602, -0.006245577, 1.389651, 0, 0.0627451, 1, 1,
0.3645993, 0.6335656, -0.1583704, 0, 0.05882353, 1, 1,
0.3658082, -0.4698859, 1.832467, 0, 0.05098039, 1, 1,
0.3702961, -0.2111517, 1.975443, 0, 0.04705882, 1, 1,
0.3707776, 0.2808507, 1.426902, 0, 0.03921569, 1, 1,
0.3756321, 0.3109868, 0.1886303, 0, 0.03529412, 1, 1,
0.3792024, 0.6860484, -0.01618149, 0, 0.02745098, 1, 1,
0.3827194, 1.16562, 0.4211117, 0, 0.02352941, 1, 1,
0.3897002, -0.2042472, 3.009673, 0, 0.01568628, 1, 1,
0.3899267, 0.01282735, 1.344705, 0, 0.01176471, 1, 1,
0.3958406, -1.642861, 2.772755, 0, 0.003921569, 1, 1,
0.3994038, -0.6800747, 0.5398213, 0.003921569, 0, 1, 1,
0.3999636, -0.9345632, 2.515234, 0.007843138, 0, 1, 1,
0.4040449, -1.313179, 3.333125, 0.01568628, 0, 1, 1,
0.4117113, 0.3470811, 2.015798, 0.01960784, 0, 1, 1,
0.4127003, -1.656462, 2.136181, 0.02745098, 0, 1, 1,
0.4131235, 1.472007, 0.2594514, 0.03137255, 0, 1, 1,
0.4168668, -0.1829747, 2.014823, 0.03921569, 0, 1, 1,
0.4181929, -0.4147592, 4.061671, 0.04313726, 0, 1, 1,
0.4191056, -1.859062, 1.723655, 0.05098039, 0, 1, 1,
0.42249, 0.0009565363, 2.629917, 0.05490196, 0, 1, 1,
0.4280624, 1.020343, -1.108791, 0.0627451, 0, 1, 1,
0.4300461, -0.2672609, -0.1319566, 0.06666667, 0, 1, 1,
0.430397, -1.253523, 2.662647, 0.07450981, 0, 1, 1,
0.4309715, 0.8298842, 0.09366579, 0.07843138, 0, 1, 1,
0.4333007, -0.02393279, 2.939382, 0.08627451, 0, 1, 1,
0.4350498, 0.43026, 0.1514605, 0.09019608, 0, 1, 1,
0.4362267, 0.2642821, -0.1534534, 0.09803922, 0, 1, 1,
0.4442366, 0.01255527, 0.5427129, 0.1058824, 0, 1, 1,
0.4451045, 0.03616336, 2.95661, 0.1098039, 0, 1, 1,
0.4453066, 1.130367, 0.9749322, 0.1176471, 0, 1, 1,
0.4457962, 1.119422, 1.429443, 0.1215686, 0, 1, 1,
0.4509287, 0.01106675, 2.314603, 0.1294118, 0, 1, 1,
0.4575301, 1.278966, 1.117515, 0.1333333, 0, 1, 1,
0.4578249, 0.7725421, -0.2590219, 0.1411765, 0, 1, 1,
0.4590482, -0.5154015, 3.785024, 0.145098, 0, 1, 1,
0.4647215, 0.09072621, 0.4523014, 0.1529412, 0, 1, 1,
0.4672879, -0.1430003, 2.107409, 0.1568628, 0, 1, 1,
0.4680029, 0.5959579, 0.7077381, 0.1647059, 0, 1, 1,
0.4786171, 2.192484, 1.216507, 0.1686275, 0, 1, 1,
0.4820814, 0.2922038, 1.973516, 0.1764706, 0, 1, 1,
0.4832927, 0.1569846, 1.442456, 0.1803922, 0, 1, 1,
0.4848678, -0.411138, 3.324116, 0.1882353, 0, 1, 1,
0.4851638, 0.03653835, 2.203964, 0.1921569, 0, 1, 1,
0.4859074, 0.4416533, 0.1136948, 0.2, 0, 1, 1,
0.4873356, -0.6294956, 2.520457, 0.2078431, 0, 1, 1,
0.4884758, -0.6454491, 2.635393, 0.2117647, 0, 1, 1,
0.4930817, -1.542938, 2.200826, 0.2196078, 0, 1, 1,
0.4954156, 0.7685173, -0.01741971, 0.2235294, 0, 1, 1,
0.4977423, -0.1600125, 1.033711, 0.2313726, 0, 1, 1,
0.5000643, 0.5414915, -0.1351623, 0.2352941, 0, 1, 1,
0.5026038, -0.3284431, 1.813348, 0.2431373, 0, 1, 1,
0.502917, 0.6978819, 2.025675, 0.2470588, 0, 1, 1,
0.5033152, 0.2666381, 1.412055, 0.254902, 0, 1, 1,
0.505178, 1.331831, 0.2903701, 0.2588235, 0, 1, 1,
0.5071231, 1.006371, -1.99886, 0.2666667, 0, 1, 1,
0.5084574, -0.2010606, 1.206542, 0.2705882, 0, 1, 1,
0.5110759, -0.8697191, 1.856308, 0.2784314, 0, 1, 1,
0.5130099, -0.9512367, 4.20992, 0.282353, 0, 1, 1,
0.5149039, -0.9358557, 1.463729, 0.2901961, 0, 1, 1,
0.5188744, -1.949557, 3.513323, 0.2941177, 0, 1, 1,
0.5191067, 0.09086299, 3.215212, 0.3019608, 0, 1, 1,
0.5262123, -0.6249053, 1.637445, 0.3098039, 0, 1, 1,
0.5301614, 1.55558, -0.1173342, 0.3137255, 0, 1, 1,
0.5327637, -0.2194622, 1.637274, 0.3215686, 0, 1, 1,
0.5334257, 1.607913, 0.3938512, 0.3254902, 0, 1, 1,
0.5419298, 0.3913393, 0.9359581, 0.3333333, 0, 1, 1,
0.5480173, 0.5799439, 0.991454, 0.3372549, 0, 1, 1,
0.5519547, 0.9828633, 0.6823294, 0.345098, 0, 1, 1,
0.5531445, -1.123182, 2.734992, 0.3490196, 0, 1, 1,
0.5547807, 0.2847806, 1.059342, 0.3568628, 0, 1, 1,
0.5568843, 1.914707, 0.09627277, 0.3607843, 0, 1, 1,
0.5570102, 1.771634, 0.2337909, 0.3686275, 0, 1, 1,
0.5580124, -0.9110643, 3.453396, 0.372549, 0, 1, 1,
0.5588187, -1.863522, 2.924902, 0.3803922, 0, 1, 1,
0.564321, -0.6355512, 2.643369, 0.3843137, 0, 1, 1,
0.5721369, 0.6550789, -0.4189083, 0.3921569, 0, 1, 1,
0.5774416, 1.171626, -0.13895, 0.3960784, 0, 1, 1,
0.577935, 0.266591, 0.5214596, 0.4039216, 0, 1, 1,
0.5871887, -0.8210155, 3.418165, 0.4117647, 0, 1, 1,
0.6022895, 0.8008447, 0.3042717, 0.4156863, 0, 1, 1,
0.6047012, -0.9199292, 3.068964, 0.4235294, 0, 1, 1,
0.6055694, -0.6027495, 4.742501, 0.427451, 0, 1, 1,
0.6061269, 0.5463514, 1.901788, 0.4352941, 0, 1, 1,
0.6070577, 1.064541, 0.5175201, 0.4392157, 0, 1, 1,
0.6084782, 1.101348, 1.327996, 0.4470588, 0, 1, 1,
0.6112148, 1.531007, 1.13097, 0.4509804, 0, 1, 1,
0.614099, -0.7387334, 1.184492, 0.4588235, 0, 1, 1,
0.6151152, -2.133702, 2.308593, 0.4627451, 0, 1, 1,
0.6183069, 0.8697595, 1.704607, 0.4705882, 0, 1, 1,
0.6223274, -0.1803899, 2.449815, 0.4745098, 0, 1, 1,
0.6231082, -0.2977382, 1.784935, 0.4823529, 0, 1, 1,
0.6285061, 0.8327292, 1.13235, 0.4862745, 0, 1, 1,
0.6324871, 0.585263, 0.002822834, 0.4941176, 0, 1, 1,
0.6327878, 2.611332, 0.9770858, 0.5019608, 0, 1, 1,
0.6376411, 0.7038183, 0.07565569, 0.5058824, 0, 1, 1,
0.6393405, 1.586354, 0.6047097, 0.5137255, 0, 1, 1,
0.6413512, -0.01625786, 2.215991, 0.5176471, 0, 1, 1,
0.6420761, 0.4569268, 1.098252, 0.5254902, 0, 1, 1,
0.6444256, 0.6490407, 1.03633, 0.5294118, 0, 1, 1,
0.645244, 0.1286813, 0.0991655, 0.5372549, 0, 1, 1,
0.6577031, -0.1647465, 2.226144, 0.5411765, 0, 1, 1,
0.6581571, -0.2444254, 2.71465, 0.5490196, 0, 1, 1,
0.6586673, -0.4077792, 2.897954, 0.5529412, 0, 1, 1,
0.6668759, -1.066531, 2.471014, 0.5607843, 0, 1, 1,
0.6765438, -0.6233931, 2.985474, 0.5647059, 0, 1, 1,
0.6770043, -1.134211, 1.976482, 0.572549, 0, 1, 1,
0.6788176, 1.583243, 1.918667, 0.5764706, 0, 1, 1,
0.6791354, -0.8332179, 2.352669, 0.5843138, 0, 1, 1,
0.6840471, -0.774278, 4.48408, 0.5882353, 0, 1, 1,
0.6944981, 0.3662233, 0.2918802, 0.5960785, 0, 1, 1,
0.6979598, 0.4471757, 1.728008, 0.6039216, 0, 1, 1,
0.6996007, 0.9595741, 0.05031881, 0.6078432, 0, 1, 1,
0.7057955, 0.3548894, -0.09552515, 0.6156863, 0, 1, 1,
0.7270911, 0.2298319, -0.1308022, 0.6196079, 0, 1, 1,
0.7280171, 2.235636, -0.2382269, 0.627451, 0, 1, 1,
0.7282412, 0.3771113, 0.1032749, 0.6313726, 0, 1, 1,
0.7307695, 0.3843687, 1.945265, 0.6392157, 0, 1, 1,
0.731796, 1.776114, -0.07392418, 0.6431373, 0, 1, 1,
0.7417018, 0.3208682, 2.87265, 0.6509804, 0, 1, 1,
0.7500488, -0.6152, 2.653247, 0.654902, 0, 1, 1,
0.7508098, 0.2447436, 0.3106959, 0.6627451, 0, 1, 1,
0.7629449, 0.6171379, 2.221414, 0.6666667, 0, 1, 1,
0.7689164, -0.5658684, 4.013056, 0.6745098, 0, 1, 1,
0.7725315, 0.6064397, 0.1780821, 0.6784314, 0, 1, 1,
0.7825117, 0.9192972, 1.44319, 0.6862745, 0, 1, 1,
0.7842852, 0.5358565, -0.496476, 0.6901961, 0, 1, 1,
0.78518, 0.9466974, 0.6491624, 0.6980392, 0, 1, 1,
0.7876981, 0.08496446, 0.9466939, 0.7058824, 0, 1, 1,
0.798532, -0.3866715, 1.724826, 0.7098039, 0, 1, 1,
0.8003709, 1.033878, 0.187626, 0.7176471, 0, 1, 1,
0.8008274, -0.3914552, 2.684822, 0.7215686, 0, 1, 1,
0.8025298, -0.007367613, 1.656484, 0.7294118, 0, 1, 1,
0.8033108, 0.06138917, 1.973476, 0.7333333, 0, 1, 1,
0.8058991, 1.806259, 1.327911, 0.7411765, 0, 1, 1,
0.8073437, -0.7972596, 1.173095, 0.7450981, 0, 1, 1,
0.8143358, -0.8294035, 1.122634, 0.7529412, 0, 1, 1,
0.8223058, 0.7682918, 0.1765014, 0.7568628, 0, 1, 1,
0.833872, 1.075459, -0.05754834, 0.7647059, 0, 1, 1,
0.8361966, -0.3896744, 2.75476, 0.7686275, 0, 1, 1,
0.8435878, -1.041966, 2.888463, 0.7764706, 0, 1, 1,
0.8442343, 0.8054796, -0.0790871, 0.7803922, 0, 1, 1,
0.8530299, 0.1144848, 1.036981, 0.7882353, 0, 1, 1,
0.8581153, 0.6473929, -1.668337, 0.7921569, 0, 1, 1,
0.8610079, -1.343891, 3.985406, 0.8, 0, 1, 1,
0.8698332, -1.806733, 4.930179, 0.8078431, 0, 1, 1,
0.8717232, -0.7005001, 2.278769, 0.8117647, 0, 1, 1,
0.874657, 0.5947471, 0.4112101, 0.8196079, 0, 1, 1,
0.8746998, -0.9875495, 2.532539, 0.8235294, 0, 1, 1,
0.8785884, 1.209185, -0.3058051, 0.8313726, 0, 1, 1,
0.8832231, 0.06456082, 1.275562, 0.8352941, 0, 1, 1,
0.8947671, -0.07470521, 2.814214, 0.8431373, 0, 1, 1,
0.8947756, 1.634724, 1.378165, 0.8470588, 0, 1, 1,
0.8986239, 1.030828, 0.164408, 0.854902, 0, 1, 1,
0.9034694, -1.172729, 3.433192, 0.8588235, 0, 1, 1,
0.9062226, -1.694388, 1.963573, 0.8666667, 0, 1, 1,
0.9081662, -0.2445719, 2.099651, 0.8705882, 0, 1, 1,
0.9133185, -0.8964468, 1.621366, 0.8784314, 0, 1, 1,
0.9199115, 1.922, 0.8373651, 0.8823529, 0, 1, 1,
0.9302319, 0.07623501, 2.65692, 0.8901961, 0, 1, 1,
0.9304102, -0.6561391, 3.049097, 0.8941177, 0, 1, 1,
0.9311258, -1.057277, 5.277599, 0.9019608, 0, 1, 1,
0.9330366, -0.3304034, 2.049548, 0.9098039, 0, 1, 1,
0.9420309, -0.4929677, 1.063709, 0.9137255, 0, 1, 1,
0.942768, -0.6803231, 0.4389294, 0.9215686, 0, 1, 1,
0.9470963, -0.2336473, 3.080088, 0.9254902, 0, 1, 1,
0.9484856, -1.390718, 2.115254, 0.9333333, 0, 1, 1,
0.9487759, -0.8801095, 3.203657, 0.9372549, 0, 1, 1,
0.9559799, -0.1584539, 1.047115, 0.945098, 0, 1, 1,
0.9652835, -0.7420748, 3.32378, 0.9490196, 0, 1, 1,
0.9702507, 0.468864, 1.073197, 0.9568627, 0, 1, 1,
0.9746626, -0.1407802, 4.017306, 0.9607843, 0, 1, 1,
0.9826083, -2.375324, 1.146399, 0.9686275, 0, 1, 1,
0.9897562, -3.136575, 1.648382, 0.972549, 0, 1, 1,
0.9902213, 0.8202373, 0.01157532, 0.9803922, 0, 1, 1,
0.9932412, 0.4381298, 0.4516159, 0.9843137, 0, 1, 1,
0.994809, 1.046454, -1.858869, 0.9921569, 0, 1, 1,
1.003216, -1.817763, 2.911749, 0.9960784, 0, 1, 1,
1.010229, 1.565844, 0.3944694, 1, 0, 0.9960784, 1,
1.014279, -2.551953, 3.163346, 1, 0, 0.9882353, 1,
1.021516, 0.9505157, 1.092055, 1, 0, 0.9843137, 1,
1.022163, 1.572198, 1.664916, 1, 0, 0.9764706, 1,
1.026449, -0.4782425, 3.179843, 1, 0, 0.972549, 1,
1.031262, -1.47961, 2.609936, 1, 0, 0.9647059, 1,
1.037017, 1.883623, 1.440553, 1, 0, 0.9607843, 1,
1.039182, -0.05743966, 0.9768479, 1, 0, 0.9529412, 1,
1.040727, -0.2969181, 1.911294, 1, 0, 0.9490196, 1,
1.041407, -1.544349, 2.241668, 1, 0, 0.9411765, 1,
1.043823, -1.711522, 2.440676, 1, 0, 0.9372549, 1,
1.046094, -0.8108103, 1.256539, 1, 0, 0.9294118, 1,
1.046963, -0.07375593, 2.094831, 1, 0, 0.9254902, 1,
1.047478, -0.3775272, 2.294479, 1, 0, 0.9176471, 1,
1.047951, 0.634286, 0.6515108, 1, 0, 0.9137255, 1,
1.048498, 1.295498, -0.2188494, 1, 0, 0.9058824, 1,
1.055756, -1.397891, 0.7161379, 1, 0, 0.9019608, 1,
1.061861, 0.8716894, 3.061721, 1, 0, 0.8941177, 1,
1.063478, 1.282449, 1.698554, 1, 0, 0.8862745, 1,
1.065658, 2.884369, -0.1168188, 1, 0, 0.8823529, 1,
1.065964, 0.1765094, -0.6370237, 1, 0, 0.8745098, 1,
1.072456, -1.128305, 2.378508, 1, 0, 0.8705882, 1,
1.072989, -0.6546024, 3.218302, 1, 0, 0.8627451, 1,
1.074022, 2.718986, -1.006912, 1, 0, 0.8588235, 1,
1.078974, -0.877557, 0.6006868, 1, 0, 0.8509804, 1,
1.085897, 0.3565271, 0.6502445, 1, 0, 0.8470588, 1,
1.086742, 1.165121, -0.1457706, 1, 0, 0.8392157, 1,
1.090829, -0.6293324, 1.216551, 1, 0, 0.8352941, 1,
1.098678, 0.42478, 0.8177206, 1, 0, 0.827451, 1,
1.102728, 1.118137, 1.381498, 1, 0, 0.8235294, 1,
1.102877, 1.072076, 1.841209, 1, 0, 0.8156863, 1,
1.114242, 0.6579086, 1.447593, 1, 0, 0.8117647, 1,
1.126034, 1.315498, 1.617584, 1, 0, 0.8039216, 1,
1.128951, -0.6001981, 3.326881, 1, 0, 0.7960784, 1,
1.130863, -0.8976818, 2.073556, 1, 0, 0.7921569, 1,
1.133347, 0.3479516, 1.225471, 1, 0, 0.7843137, 1,
1.134356, -0.7936053, 0.1973942, 1, 0, 0.7803922, 1,
1.14457, -1.186797, 1.805592, 1, 0, 0.772549, 1,
1.152608, -0.9880857, 1.489994, 1, 0, 0.7686275, 1,
1.156168, 0.689039, -0.4377704, 1, 0, 0.7607843, 1,
1.161116, -0.9560245, 4.604273, 1, 0, 0.7568628, 1,
1.179726, 0.5389387, 1.299688, 1, 0, 0.7490196, 1,
1.180429, 2.559562, 0.508638, 1, 0, 0.7450981, 1,
1.181826, 0.6756248, 1.776239, 1, 0, 0.7372549, 1,
1.185733, -0.1253426, 1.635411, 1, 0, 0.7333333, 1,
1.192987, -0.6134467, 1.202875, 1, 0, 0.7254902, 1,
1.20491, 0.2241746, -0.2848202, 1, 0, 0.7215686, 1,
1.212413, -0.9941333, 1.420281, 1, 0, 0.7137255, 1,
1.216055, 0.4165479, 0.4262862, 1, 0, 0.7098039, 1,
1.217145, -1.477304, 2.885975, 1, 0, 0.7019608, 1,
1.227456, 1.748813, 0.03221314, 1, 0, 0.6941177, 1,
1.236599, 0.102956, 1.210243, 1, 0, 0.6901961, 1,
1.242101, -1.069053, 2.976673, 1, 0, 0.682353, 1,
1.246325, 0.4848273, 2.34974, 1, 0, 0.6784314, 1,
1.246799, 0.3083596, 2.41496, 1, 0, 0.6705883, 1,
1.256182, -0.9138646, 2.107329, 1, 0, 0.6666667, 1,
1.258285, -0.1323132, 2.330548, 1, 0, 0.6588235, 1,
1.259956, -0.5039983, 1.845727, 1, 0, 0.654902, 1,
1.263984, -0.6855077, 2.90794, 1, 0, 0.6470588, 1,
1.273287, -0.174357, 2.753556, 1, 0, 0.6431373, 1,
1.291068, 0.02455984, -0.6478693, 1, 0, 0.6352941, 1,
1.309158, 2.555707, 1.077266, 1, 0, 0.6313726, 1,
1.320501, -1.362059, 2.448193, 1, 0, 0.6235294, 1,
1.334989, -1.404966, 0.001611104, 1, 0, 0.6196079, 1,
1.335069, -1.541633, 3.257649, 1, 0, 0.6117647, 1,
1.338262, 0.5102489, 1.33201, 1, 0, 0.6078432, 1,
1.350182, 1.78975, 1.116037, 1, 0, 0.6, 1,
1.351485, 0.402137, 1.866196, 1, 0, 0.5921569, 1,
1.354559, -0.442519, 1.352772, 1, 0, 0.5882353, 1,
1.35791, -0.7584565, 3.699063, 1, 0, 0.5803922, 1,
1.375419, -0.2195927, 2.589604, 1, 0, 0.5764706, 1,
1.377825, 0.7980371, 1.3141, 1, 0, 0.5686275, 1,
1.379792, -0.5550056, 0.7602268, 1, 0, 0.5647059, 1,
1.395864, -0.5731524, 1.431721, 1, 0, 0.5568628, 1,
1.412823, 1.648808, 1.621488, 1, 0, 0.5529412, 1,
1.416655, -0.306044, 1.797423, 1, 0, 0.5450981, 1,
1.4433, -0.7093359, 2.117769, 1, 0, 0.5411765, 1,
1.454321, 1.520702, 0.3398247, 1, 0, 0.5333334, 1,
1.460225, -0.1059493, 1.786366, 1, 0, 0.5294118, 1,
1.461177, 0.123024, 0.7679466, 1, 0, 0.5215687, 1,
1.462269, -0.1600274, 1.149352, 1, 0, 0.5176471, 1,
1.478961, 0.7277662, 2.506665, 1, 0, 0.509804, 1,
1.484376, -1.36209, 1.821256, 1, 0, 0.5058824, 1,
1.497571, 0.2765004, 1.869873, 1, 0, 0.4980392, 1,
1.501838, -0.1353811, 3.155496, 1, 0, 0.4901961, 1,
1.506847, -2.649882, 1.942413, 1, 0, 0.4862745, 1,
1.509958, 0.7888668, -1.042258, 1, 0, 0.4784314, 1,
1.513226, 0.1350615, 1.190885, 1, 0, 0.4745098, 1,
1.520981, -1.23452, 2.222855, 1, 0, 0.4666667, 1,
1.524334, -1.433365, 2.747627, 1, 0, 0.4627451, 1,
1.530064, 1.956137, 0.4735496, 1, 0, 0.454902, 1,
1.533509, -0.4310287, 3.088116, 1, 0, 0.4509804, 1,
1.535949, 1.769679, -0.06465875, 1, 0, 0.4431373, 1,
1.535967, -1.29184, 3.778417, 1, 0, 0.4392157, 1,
1.557143, -0.1805884, 3.172666, 1, 0, 0.4313726, 1,
1.558172, 0.410247, 1.79497, 1, 0, 0.427451, 1,
1.561846, 1.03392, 1.674304, 1, 0, 0.4196078, 1,
1.563627, -1.503256, 3.771108, 1, 0, 0.4156863, 1,
1.565953, -0.8849693, 3.485988, 1, 0, 0.4078431, 1,
1.576189, -0.5164475, 2.497629, 1, 0, 0.4039216, 1,
1.587023, 2.010573, -0.3868284, 1, 0, 0.3960784, 1,
1.592266, -0.4692502, 1.578327, 1, 0, 0.3882353, 1,
1.607951, -1.758318, 3.585407, 1, 0, 0.3843137, 1,
1.608336, -1.367204, 2.116128, 1, 0, 0.3764706, 1,
1.60988, -0.1718012, 1.781433, 1, 0, 0.372549, 1,
1.61096, 0.1903674, 2.430314, 1, 0, 0.3647059, 1,
1.621125, -1.732945, 3.772271, 1, 0, 0.3607843, 1,
1.632759, 1.132538, -0.598453, 1, 0, 0.3529412, 1,
1.634482, -0.3531809, 1.521337, 1, 0, 0.3490196, 1,
1.639408, 0.459061, -0.2381229, 1, 0, 0.3411765, 1,
1.650949, 0.009247694, 2.263406, 1, 0, 0.3372549, 1,
1.655653, 0.406339, 0.5592485, 1, 0, 0.3294118, 1,
1.660291, 0.7331724, 1.06551, 1, 0, 0.3254902, 1,
1.679125, 1.053289, 3.304802, 1, 0, 0.3176471, 1,
1.683639, -0.3082455, 1.983167, 1, 0, 0.3137255, 1,
1.701735, 0.1376699, 2.124048, 1, 0, 0.3058824, 1,
1.710705, 2.213356, 2.330942, 1, 0, 0.2980392, 1,
1.71782, 1.18328, 0.3913117, 1, 0, 0.2941177, 1,
1.734815, -0.6110337, 2.171602, 1, 0, 0.2862745, 1,
1.744564, -1.143883, 1.955829, 1, 0, 0.282353, 1,
1.754974, 0.3637387, 1.085406, 1, 0, 0.2745098, 1,
1.759738, 0.387863, 1.717656, 1, 0, 0.2705882, 1,
1.764622, 0.5627782, 0.5859545, 1, 0, 0.2627451, 1,
1.798168, -0.7270799, 2.152027, 1, 0, 0.2588235, 1,
1.809214, 1.46573, 1.44989, 1, 0, 0.2509804, 1,
1.810571, 0.7278667, 0.7542416, 1, 0, 0.2470588, 1,
1.828506, -0.8199788, 1.859155, 1, 0, 0.2392157, 1,
1.828749, 0.7980322, 0.2894228, 1, 0, 0.2352941, 1,
1.829561, -1.070291, 1.199265, 1, 0, 0.227451, 1,
1.834019, 0.7783718, 2.826564, 1, 0, 0.2235294, 1,
1.876136, -0.01709877, 1.905206, 1, 0, 0.2156863, 1,
1.880815, -0.4405761, 2.036613, 1, 0, 0.2117647, 1,
1.919978, 1.262668, -0.6067547, 1, 0, 0.2039216, 1,
1.929502, -0.4912056, 1.899117, 1, 0, 0.1960784, 1,
1.946126, 0.1246191, 2.832773, 1, 0, 0.1921569, 1,
1.947473, -0.01988739, 1.664717, 1, 0, 0.1843137, 1,
1.972381, -0.224591, 1.025951, 1, 0, 0.1803922, 1,
1.978278, -0.3447971, 0.03552676, 1, 0, 0.172549, 1,
2.019617, -1.137845, 3.580506, 1, 0, 0.1686275, 1,
2.048082, -0.4396093, 2.556633, 1, 0, 0.1607843, 1,
2.061188, -0.5601555, 1.028931, 1, 0, 0.1568628, 1,
2.06239, 1.834685, -0.75795, 1, 0, 0.1490196, 1,
2.071607, 0.0534904, 1.858089, 1, 0, 0.145098, 1,
2.07419, 0.3064029, 0.2936643, 1, 0, 0.1372549, 1,
2.083325, -0.9310877, 2.991019, 1, 0, 0.1333333, 1,
2.112536, -1.553853, 1.781046, 1, 0, 0.1254902, 1,
2.113789, -1.025543, 2.720929, 1, 0, 0.1215686, 1,
2.119682, -0.2902408, 1.543918, 1, 0, 0.1137255, 1,
2.148712, 0.9490767, 1.084235, 1, 0, 0.1098039, 1,
2.154152, 1.571299, 0.9384483, 1, 0, 0.1019608, 1,
2.178447, 0.02941375, 2.498389, 1, 0, 0.09411765, 1,
2.199698, -0.973451, 2.492611, 1, 0, 0.09019608, 1,
2.206117, -0.6027391, 1.279694, 1, 0, 0.08235294, 1,
2.225496, -2.548483, 1.626048, 1, 0, 0.07843138, 1,
2.24832, 0.006876326, -0.1256592, 1, 0, 0.07058824, 1,
2.31548, -0.4757296, 1.337996, 1, 0, 0.06666667, 1,
2.317037, -0.6086395, 2.977738, 1, 0, 0.05882353, 1,
2.45043, -0.154708, 0.7796165, 1, 0, 0.05490196, 1,
2.555115, 0.8113633, -0.5646912, 1, 0, 0.04705882, 1,
2.628303, -0.4531245, 1.504671, 1, 0, 0.04313726, 1,
2.684153, 0.4600797, -0.2078898, 1, 0, 0.03529412, 1,
2.808507, -1.200185, 4.609374, 1, 0, 0.03137255, 1,
2.845353, 0.8572221, 1.978184, 1, 0, 0.02352941, 1,
3.027664, 0.3295116, 0.8398469, 1, 0, 0.01960784, 1,
3.067275, -0.5477913, 2.825181, 1, 0, 0.01176471, 1,
3.29597, -1.023631, 3.181917, 1, 0, 0.007843138, 1
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
0.04246223, -4.35273, -8.788872, 0, -0.5, 0.5, 0.5,
0.04246223, -4.35273, -8.788872, 1, -0.5, 0.5, 0.5,
0.04246223, -4.35273, -8.788872, 1, 1.5, 0.5, 0.5,
0.04246223, -4.35273, -8.788872, 0, 1.5, 0.5, 0.5
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
-4.313984, 0.02305377, -8.788872, 0, -0.5, 0.5, 0.5,
-4.313984, 0.02305377, -8.788872, 1, -0.5, 0.5, 0.5,
-4.313984, 0.02305377, -8.788872, 1, 1.5, 0.5, 0.5,
-4.313984, 0.02305377, -8.788872, 0, 1.5, 0.5, 0.5
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
-4.313984, -4.35273, -0.7362833, 0, -0.5, 0.5, 0.5,
-4.313984, -4.35273, -0.7362833, 1, -0.5, 0.5, 0.5,
-4.313984, -4.35273, -0.7362833, 1, 1.5, 0.5, 0.5,
-4.313984, -4.35273, -0.7362833, 0, 1.5, 0.5, 0.5
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
-3, -3.342933, -6.930582,
3, -3.342933, -6.930582,
-3, -3.342933, -6.930582,
-3, -3.511233, -7.240297,
-2, -3.342933, -6.930582,
-2, -3.511233, -7.240297,
-1, -3.342933, -6.930582,
-1, -3.511233, -7.240297,
0, -3.342933, -6.930582,
0, -3.511233, -7.240297,
1, -3.342933, -6.930582,
1, -3.511233, -7.240297,
2, -3.342933, -6.930582,
2, -3.511233, -7.240297,
3, -3.342933, -6.930582,
3, -3.511233, -7.240297
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
-3, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
-3, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
-3, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
-3, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
-2, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
-2, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
-2, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
-2, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
-1, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
-1, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
-1, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
-1, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
0, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
0, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
0, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
0, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
1, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
1, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
1, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
1, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
2, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
2, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
2, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
2, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5,
3, -3.847831, -7.859727, 0, -0.5, 0.5, 0.5,
3, -3.847831, -7.859727, 1, -0.5, 0.5, 0.5,
3, -3.847831, -7.859727, 1, 1.5, 0.5, 0.5,
3, -3.847831, -7.859727, 0, 1.5, 0.5, 0.5
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
-3.30865, -3, -6.930582,
-3.30865, 3, -6.930582,
-3.30865, -3, -6.930582,
-3.476206, -3, -7.240297,
-3.30865, -2, -6.930582,
-3.476206, -2, -7.240297,
-3.30865, -1, -6.930582,
-3.476206, -1, -7.240297,
-3.30865, 0, -6.930582,
-3.476206, 0, -7.240297,
-3.30865, 1, -6.930582,
-3.476206, 1, -7.240297,
-3.30865, 2, -6.930582,
-3.476206, 2, -7.240297,
-3.30865, 3, -6.930582,
-3.476206, 3, -7.240297
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
-3.811317, -3, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, -3, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, -3, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, -3, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, -2, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, -2, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, -2, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, -2, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, -1, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, -1, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, -1, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, -1, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, 0, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, 0, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, 0, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, 0, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, 1, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, 1, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, 1, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, 1, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, 2, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, 2, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, 2, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, 2, -7.859727, 0, 1.5, 0.5, 0.5,
-3.811317, 3, -7.859727, 0, -0.5, 0.5, 0.5,
-3.811317, 3, -7.859727, 1, -0.5, 0.5, 0.5,
-3.811317, 3, -7.859727, 1, 1.5, 0.5, 0.5,
-3.811317, 3, -7.859727, 0, 1.5, 0.5, 0.5
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
-3.30865, -3.342933, -6,
-3.30865, -3.342933, 4,
-3.30865, -3.342933, -6,
-3.476206, -3.511233, -6,
-3.30865, -3.342933, -4,
-3.476206, -3.511233, -4,
-3.30865, -3.342933, -2,
-3.476206, -3.511233, -2,
-3.30865, -3.342933, 0,
-3.476206, -3.511233, 0,
-3.30865, -3.342933, 2,
-3.476206, -3.511233, 2,
-3.30865, -3.342933, 4,
-3.476206, -3.511233, 4
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
"-6",
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
-3.811317, -3.847831, -6, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -6, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -6, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, -6, 0, 1.5, 0.5, 0.5,
-3.811317, -3.847831, -4, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -4, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -4, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, -4, 0, 1.5, 0.5, 0.5,
-3.811317, -3.847831, -2, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -2, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, -2, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, -2, 0, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 0, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 0, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 0, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 0, 0, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 2, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 2, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 2, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 2, 0, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 4, 0, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 4, 1, -0.5, 0.5, 0.5,
-3.811317, -3.847831, 4, 1, 1.5, 0.5, 0.5,
-3.811317, -3.847831, 4, 0, 1.5, 0.5, 0.5
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
-3.30865, -3.342933, -6.930582,
-3.30865, 3.389041, -6.930582,
-3.30865, -3.342933, 5.458015,
-3.30865, 3.389041, 5.458015,
-3.30865, -3.342933, -6.930582,
-3.30865, -3.342933, 5.458015,
-3.30865, 3.389041, -6.930582,
-3.30865, 3.389041, 5.458015,
-3.30865, -3.342933, -6.930582,
3.393575, -3.342933, -6.930582,
-3.30865, -3.342933, 5.458015,
3.393575, -3.342933, 5.458015,
-3.30865, 3.389041, -6.930582,
3.393575, 3.389041, -6.930582,
-3.30865, 3.389041, 5.458015,
3.393575, 3.389041, 5.458015,
3.393575, -3.342933, -6.930582,
3.393575, 3.389041, -6.930582,
3.393575, -3.342933, 5.458015,
3.393575, 3.389041, 5.458015,
3.393575, -3.342933, -6.930582,
3.393575, -3.342933, 5.458015,
3.393575, 3.389041, -6.930582,
3.393575, 3.389041, 5.458015
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
var radius = 8.336199;
var distance = 37.08869;
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
mvMatrix.translate( -0.04246223, -0.02305377, 0.7362833 );
mvMatrix.scale( 1.344816, 1.338873, 0.727545 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.08869);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Pyrimethanil<-read.table("Pyrimethanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyrimethanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyrimethanil' not found
```

```r
y<-Pyrimethanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyrimethanil' not found
```

```r
z<-Pyrimethanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyrimethanil' not found
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
-3.211045, 0.7796762, -1.777249, 0, 0, 1, 1, 1,
-2.965568, -0.9377941, -1.326369, 1, 0, 0, 1, 1,
-2.918012, -1.217153, -1.750677, 1, 0, 0, 1, 1,
-2.868458, -0.1019219, -1.097672, 1, 0, 0, 1, 1,
-2.732921, 0.09510358, -0.007855821, 1, 0, 0, 1, 1,
-2.694292, -0.8019469, -3.879657, 1, 0, 0, 1, 1,
-2.580099, 0.2109761, -1.943246, 0, 0, 0, 1, 1,
-2.5517, -0.4180062, -1.333181, 0, 0, 0, 1, 1,
-2.445951, 0.7218347, -2.637979, 0, 0, 0, 1, 1,
-2.394015, -0.2201236, -1.785076, 0, 0, 0, 1, 1,
-2.338164, 1.066028, -0.9589629, 0, 0, 0, 1, 1,
-2.294102, -0.7926366, -2.178563, 0, 0, 0, 1, 1,
-2.285681, 0.4021603, -1.75296, 0, 0, 0, 1, 1,
-2.279757, -0.174274, -1.814397, 1, 1, 1, 1, 1,
-2.279327, 0.1836372, -1.126989, 1, 1, 1, 1, 1,
-2.209267, -0.444715, -0.6816713, 1, 1, 1, 1, 1,
-2.191339, 0.1966687, -0.6995559, 1, 1, 1, 1, 1,
-2.157059, -0.2900778, -3.502874, 1, 1, 1, 1, 1,
-2.137971, -0.2319904, -3.143961, 1, 1, 1, 1, 1,
-2.074852, 0.2903493, -1.448068, 1, 1, 1, 1, 1,
-2.064683, -1.900544, -3.123019, 1, 1, 1, 1, 1,
-1.998344, -0.8851624, -2.105684, 1, 1, 1, 1, 1,
-1.996778, -0.009521507, -2.955498, 1, 1, 1, 1, 1,
-1.992099, -0.7947791, -0.5174558, 1, 1, 1, 1, 1,
-1.981188, -0.1068913, -3.079068, 1, 1, 1, 1, 1,
-1.966719, 0.9690862, -1.497609, 1, 1, 1, 1, 1,
-1.950779, -1.035814, -2.850448, 1, 1, 1, 1, 1,
-1.947282, 1.913622, -1.885716, 1, 1, 1, 1, 1,
-1.924582, -0.9319032, -2.031623, 0, 0, 1, 1, 1,
-1.915801, 0.3205718, -2.021069, 1, 0, 0, 1, 1,
-1.902381, -0.4507793, -0.9267602, 1, 0, 0, 1, 1,
-1.889327, -0.3421634, -2.630732, 1, 0, 0, 1, 1,
-1.87616, 0.426056, -0.295067, 1, 0, 0, 1, 1,
-1.876011, -1.031098, -0.4851249, 1, 0, 0, 1, 1,
-1.86999, 1.971558, -0.9845662, 0, 0, 0, 1, 1,
-1.841363, 0.4709831, -2.847704, 0, 0, 0, 1, 1,
-1.813187, -1.627714, -2.808704, 0, 0, 0, 1, 1,
-1.809865, 1.467806, -0.7687011, 0, 0, 0, 1, 1,
-1.806999, 0.06108491, -0.4305297, 0, 0, 0, 1, 1,
-1.785563, -0.1662733, -1.080996, 0, 0, 0, 1, 1,
-1.784608, 0.6997462, -3.054114, 0, 0, 0, 1, 1,
-1.768931, 0.2109138, -2.499224, 1, 1, 1, 1, 1,
-1.763427, 0.8040283, 0.3482715, 1, 1, 1, 1, 1,
-1.742861, 3.291003, 1.035985, 1, 1, 1, 1, 1,
-1.739566, 0.5641398, -1.813483, 1, 1, 1, 1, 1,
-1.739208, 0.04826694, -1.873457, 1, 1, 1, 1, 1,
-1.734773, -0.5852396, -2.028152, 1, 1, 1, 1, 1,
-1.727521, 1.297192, 0.3670965, 1, 1, 1, 1, 1,
-1.703041, 0.6494601, -2.91752, 1, 1, 1, 1, 1,
-1.687596, 0.07111821, -2.815964, 1, 1, 1, 1, 1,
-1.683319, -1.022806, -1.967289, 1, 1, 1, 1, 1,
-1.659173, -1.638818, -5.09312, 1, 1, 1, 1, 1,
-1.648589, 1.816293, -1.002571, 1, 1, 1, 1, 1,
-1.642239, 0.8653967, -0.7916117, 1, 1, 1, 1, 1,
-1.635979, 0.1154727, -2.148552, 1, 1, 1, 1, 1,
-1.627507, -0.7063815, -2.816189, 1, 1, 1, 1, 1,
-1.623141, 0.1283442, -0.9761651, 0, 0, 1, 1, 1,
-1.616917, -1.210939, -1.654089, 1, 0, 0, 1, 1,
-1.616529, 1.061527, -2.0067, 1, 0, 0, 1, 1,
-1.612061, 0.637237, -0.9988887, 1, 0, 0, 1, 1,
-1.605928, 0.2932401, 0.06360432, 1, 0, 0, 1, 1,
-1.604111, -0.9138263, -2.430175, 1, 0, 0, 1, 1,
-1.596412, 0.6434684, -2.680146, 0, 0, 0, 1, 1,
-1.596234, 0.4075253, -2.307707, 0, 0, 0, 1, 1,
-1.587867, -0.77994, -2.089173, 0, 0, 0, 1, 1,
-1.584214, 0.7547238, 0.4065029, 0, 0, 0, 1, 1,
-1.580996, -2.037477, -2.195671, 0, 0, 0, 1, 1,
-1.578335, -0.7805657, -2.662425, 0, 0, 0, 1, 1,
-1.558347, 0.2820635, -1.543658, 0, 0, 0, 1, 1,
-1.557325, 0.009948242, -3.146418, 1, 1, 1, 1, 1,
-1.547817, -0.7453416, -1.819209, 1, 1, 1, 1, 1,
-1.542163, 1.150072, 0.1869328, 1, 1, 1, 1, 1,
-1.536004, -1.995414, -2.692055, 1, 1, 1, 1, 1,
-1.533861, 0.2099794, -0.7724646, 1, 1, 1, 1, 1,
-1.526659, 1.998838, -0.3932714, 1, 1, 1, 1, 1,
-1.522533, 1.142148, 0.8868586, 1, 1, 1, 1, 1,
-1.519096, -0.1615684, -2.618169, 1, 1, 1, 1, 1,
-1.518268, -2.261858, -2.484318, 1, 1, 1, 1, 1,
-1.50524, -0.6922351, -1.542792, 1, 1, 1, 1, 1,
-1.503938, -0.7641436, -3.351811, 1, 1, 1, 1, 1,
-1.502422, 1.453146, -0.6082994, 1, 1, 1, 1, 1,
-1.498025, 1.111307, -2.09346, 1, 1, 1, 1, 1,
-1.49196, -0.7421305, -3.562845, 1, 1, 1, 1, 1,
-1.488333, 0.8254786, -1.682317, 1, 1, 1, 1, 1,
-1.47439, -0.4787025, -1.72986, 0, 0, 1, 1, 1,
-1.474261, -0.7403631, -2.859559, 1, 0, 0, 1, 1,
-1.444893, -0.6016822, -2.120797, 1, 0, 0, 1, 1,
-1.442306, 0.1499098, 0.556, 1, 0, 0, 1, 1,
-1.439604, 0.6437978, -3.10898, 1, 0, 0, 1, 1,
-1.437222, 0.8415815, -0.8164883, 1, 0, 0, 1, 1,
-1.422834, -1.224866, -0.7029734, 0, 0, 0, 1, 1,
-1.415737, 0.004801834, -1.212589, 0, 0, 0, 1, 1,
-1.413247, 0.6062405, -1.000899, 0, 0, 0, 1, 1,
-1.412179, 0.4815021, -0.5387412, 0, 0, 0, 1, 1,
-1.390366, -0.1929126, -0.7814486, 0, 0, 0, 1, 1,
-1.388565, -0.188086, -2.402658, 0, 0, 0, 1, 1,
-1.377118, 0.7064521, -0.3179663, 0, 0, 0, 1, 1,
-1.370453, -0.1497108, -1.965079, 1, 1, 1, 1, 1,
-1.355729, 0.9520676, -0.09601379, 1, 1, 1, 1, 1,
-1.35403, -0.7910967, -1.955478, 1, 1, 1, 1, 1,
-1.353358, 0.366948, -2.876291, 1, 1, 1, 1, 1,
-1.346119, 0.6777692, -0.4613337, 1, 1, 1, 1, 1,
-1.331915, -0.483751, -1.947192, 1, 1, 1, 1, 1,
-1.329572, 0.6265174, -1.638602, 1, 1, 1, 1, 1,
-1.324541, 0.05003295, -2.197226, 1, 1, 1, 1, 1,
-1.321509, 1.876821, -2.022519, 1, 1, 1, 1, 1,
-1.319663, -0.7693214, -1.950643, 1, 1, 1, 1, 1,
-1.312431, 1.143867, -1.646267, 1, 1, 1, 1, 1,
-1.308384, 0.2922558, -1.138343, 1, 1, 1, 1, 1,
-1.307824, -0.2144451, 0.2712627, 1, 1, 1, 1, 1,
-1.304393, 0.3925754, -1.492423, 1, 1, 1, 1, 1,
-1.299439, -0.2733595, -1.024389, 1, 1, 1, 1, 1,
-1.29026, -0.1513857, -2.3752, 0, 0, 1, 1, 1,
-1.290251, 0.1318276, -1.325203, 1, 0, 0, 1, 1,
-1.28832, -0.6648899, -0.9375305, 1, 0, 0, 1, 1,
-1.28609, -0.4128595, -2.534008, 1, 0, 0, 1, 1,
-1.283011, 0.7299316, -2.186988, 1, 0, 0, 1, 1,
-1.257097, -0.8790644, -3.593454, 1, 0, 0, 1, 1,
-1.254627, -0.4531428, -2.410772, 0, 0, 0, 1, 1,
-1.24824, -0.1544457, -1.320382, 0, 0, 0, 1, 1,
-1.248018, -1.068031, -2.30897, 0, 0, 0, 1, 1,
-1.24773, 0.5904338, -1.716411, 0, 0, 0, 1, 1,
-1.246853, 1.50729, -1.403522, 0, 0, 0, 1, 1,
-1.243338, 1.674413, -1.460816, 0, 0, 0, 1, 1,
-1.239952, 2.37843, -1.724249, 0, 0, 0, 1, 1,
-1.23512, 0.006541231, -1.075201, 1, 1, 1, 1, 1,
-1.232002, -0.9713939, -3.942465, 1, 1, 1, 1, 1,
-1.215033, 0.1508034, -1.626582, 1, 1, 1, 1, 1,
-1.208124, -0.1684958, -0.9608793, 1, 1, 1, 1, 1,
-1.205578, 0.554898, -0.5910347, 1, 1, 1, 1, 1,
-1.203146, -0.1108494, -2.222253, 1, 1, 1, 1, 1,
-1.199765, -0.3420847, -3.434693, 1, 1, 1, 1, 1,
-1.198955, -0.2286279, -0.9511598, 1, 1, 1, 1, 1,
-1.19538, -1.38386, -2.763508, 1, 1, 1, 1, 1,
-1.194626, 1.85955, 0.3129872, 1, 1, 1, 1, 1,
-1.194514, -2.189032, -1.769599, 1, 1, 1, 1, 1,
-1.194003, 0.261781, -2.677183, 1, 1, 1, 1, 1,
-1.189113, -0.309073, 0.3079158, 1, 1, 1, 1, 1,
-1.176372, 0.8577213, -0.8203419, 1, 1, 1, 1, 1,
-1.175835, -0.1804637, -1.168681, 1, 1, 1, 1, 1,
-1.175729, -0.5311288, -0.6855668, 0, 0, 1, 1, 1,
-1.168874, -0.03002529, -1.455684, 1, 0, 0, 1, 1,
-1.16624, -1.178715, -2.24382, 1, 0, 0, 1, 1,
-1.166105, 0.8008033, -1.596524, 1, 0, 0, 1, 1,
-1.163242, 0.3869151, -0.2998028, 1, 0, 0, 1, 1,
-1.15697, 1.522776, -0.5414149, 1, 0, 0, 1, 1,
-1.152935, 0.8731996, -1.08037, 0, 0, 0, 1, 1,
-1.150622, 0.3525069, -1.452505, 0, 0, 0, 1, 1,
-1.136831, 0.3663741, 0.9072208, 0, 0, 0, 1, 1,
-1.135204, -0.9833346, -1.93785, 0, 0, 0, 1, 1,
-1.13311, 1.562685, -0.981048, 0, 0, 0, 1, 1,
-1.131548, 1.437538, -1.419353, 0, 0, 0, 1, 1,
-1.127808, 0.3264239, -1.678802, 0, 0, 0, 1, 1,
-1.125464, 0.2337789, -0.9742159, 1, 1, 1, 1, 1,
-1.121471, -0.5265552, -2.485376, 1, 1, 1, 1, 1,
-1.116422, 0.7915103, -1.879387, 1, 1, 1, 1, 1,
-1.113397, 1.812317, -1.602027, 1, 1, 1, 1, 1,
-1.113215, -0.7598493, -2.839504, 1, 1, 1, 1, 1,
-1.112237, 1.574551, -0.6853071, 1, 1, 1, 1, 1,
-1.110901, -1.482196, -1.817985, 1, 1, 1, 1, 1,
-1.103366, -1.137993, -3.885013, 1, 1, 1, 1, 1,
-1.085114, 0.08782473, -0.6449072, 1, 1, 1, 1, 1,
-1.082973, 0.150774, -0.415499, 1, 1, 1, 1, 1,
-1.077511, -0.9468066, -2.953895, 1, 1, 1, 1, 1,
-1.073816, 0.2897316, 0.8995851, 1, 1, 1, 1, 1,
-1.068759, 1.453404, -0.8925217, 1, 1, 1, 1, 1,
-1.058312, 0.9678419, -0.9141255, 1, 1, 1, 1, 1,
-1.058095, 1.115813, 0.3782468, 1, 1, 1, 1, 1,
-1.056074, -1.266082, -2.842292, 0, 0, 1, 1, 1,
-1.055689, -0.4989779, -1.012731, 1, 0, 0, 1, 1,
-1.05515, 0.8007199, -0.6360639, 1, 0, 0, 1, 1,
-1.042856, -0.08467648, -1.743967, 1, 0, 0, 1, 1,
-1.039978, 0.4253713, -1.91603, 1, 0, 0, 1, 1,
-1.035145, -0.4438959, -2.053284, 1, 0, 0, 1, 1,
-1.034521, 0.02022785, 1.050123, 0, 0, 0, 1, 1,
-1.034003, -1.490356, -1.810536, 0, 0, 0, 1, 1,
-1.030444, 0.2572908, -1.863714, 0, 0, 0, 1, 1,
-1.024827, 0.1783963, -2.572016, 0, 0, 0, 1, 1,
-1.02227, -0.4462816, -0.8132436, 0, 0, 0, 1, 1,
-1.017195, 0.5115932, -1.826078, 0, 0, 0, 1, 1,
-1.017176, 1.153661, -0.2346745, 0, 0, 0, 1, 1,
-1.013027, -0.8365583, -2.927488, 1, 1, 1, 1, 1,
-1.012846, -0.3939508, -3.639977, 1, 1, 1, 1, 1,
-1.01228, -0.5233203, -1.917247, 1, 1, 1, 1, 1,
-1.00833, 0.534094, 0.5367408, 1, 1, 1, 1, 1,
-1.00798, -0.7913402, -2.644433, 1, 1, 1, 1, 1,
-1.003381, 0.1225669, -1.494264, 1, 1, 1, 1, 1,
-0.9802917, -0.1891568, -2.194987, 1, 1, 1, 1, 1,
-0.9778658, -0.4415582, -2.34071, 1, 1, 1, 1, 1,
-0.9767732, 0.4519874, -0.6275518, 1, 1, 1, 1, 1,
-0.9754269, 2.713877, 1.364107, 1, 1, 1, 1, 1,
-0.9624612, 0.05724251, -2.138722, 1, 1, 1, 1, 1,
-0.9578797, -0.2057625, -1.965304, 1, 1, 1, 1, 1,
-0.9551584, -0.02691015, -1.190173, 1, 1, 1, 1, 1,
-0.9490536, -2.912947, -2.447611, 1, 1, 1, 1, 1,
-0.9460275, -0.178035, -2.623115, 1, 1, 1, 1, 1,
-0.9433971, 0.05985576, -1.876047, 0, 0, 1, 1, 1,
-0.9404067, 0.6763199, -0.5752722, 1, 0, 0, 1, 1,
-0.9394557, -0.007754233, -0.8014762, 1, 0, 0, 1, 1,
-0.9390336, -0.8027199, -4.843353, 1, 0, 0, 1, 1,
-0.9286746, 0.8125318, -1.739951, 1, 0, 0, 1, 1,
-0.9241048, 0.8500101, -0.5095333, 1, 0, 0, 1, 1,
-0.9201435, -1.925331, -3.613403, 0, 0, 0, 1, 1,
-0.9029015, 2.365179, -0.3887819, 0, 0, 0, 1, 1,
-0.9010178, -2.255417, -2.509721, 0, 0, 0, 1, 1,
-0.8891658, -0.7692299, -2.558746, 0, 0, 0, 1, 1,
-0.88504, -0.5268259, -1.504418, 0, 0, 0, 1, 1,
-0.8827025, 0.1798776, -2.008775, 0, 0, 0, 1, 1,
-0.8731813, 0.6952598, -1.113188, 0, 0, 0, 1, 1,
-0.8666826, 1.307403, -0.1614357, 1, 1, 1, 1, 1,
-0.8644835, -0.08469608, -0.4071831, 1, 1, 1, 1, 1,
-0.8574786, -0.5587559, -2.18923, 1, 1, 1, 1, 1,
-0.8561437, 1.969863, -0.6515597, 1, 1, 1, 1, 1,
-0.8542004, -0.3082732, -3.896181, 1, 1, 1, 1, 1,
-0.8536266, 1.325991, -0.7610807, 1, 1, 1, 1, 1,
-0.8459435, -0.3265449, -2.257982, 1, 1, 1, 1, 1,
-0.8440146, 0.4579577, -1.055226, 1, 1, 1, 1, 1,
-0.8425573, -0.1324995, -1.645263, 1, 1, 1, 1, 1,
-0.8323666, 1.187173, 1.108993, 1, 1, 1, 1, 1,
-0.8319539, 0.9065201, -2.026386, 1, 1, 1, 1, 1,
-0.8232708, -0.004441226, -1.392518, 1, 1, 1, 1, 1,
-0.8212889, -1.583308, -1.969005, 1, 1, 1, 1, 1,
-0.8204871, 1.842315, 0.4490787, 1, 1, 1, 1, 1,
-0.8166878, -1.697988, -1.792393, 1, 1, 1, 1, 1,
-0.8164464, -0.6818869, -3.21528, 0, 0, 1, 1, 1,
-0.8118457, -1.125605, -3.110973, 1, 0, 0, 1, 1,
-0.8097441, -2.833032, -2.887265, 1, 0, 0, 1, 1,
-0.8068711, -1.425598, -0.3336601, 1, 0, 0, 1, 1,
-0.8017261, -0.3985615, -1.54303, 1, 0, 0, 1, 1,
-0.7987589, -0.7030269, -2.841076, 1, 0, 0, 1, 1,
-0.7981018, -0.2535781, -3.055432, 0, 0, 0, 1, 1,
-0.7945553, 0.4764358, -2.36449, 0, 0, 0, 1, 1,
-0.7939774, 1.3971, -2.046726, 0, 0, 0, 1, 1,
-0.7883531, 1.505988, -0.9275126, 0, 0, 0, 1, 1,
-0.7769646, -0.9697741, -3.024689, 0, 0, 0, 1, 1,
-0.7762716, 1.448557, 0.1451908, 0, 0, 0, 1, 1,
-0.7757728, -0.8262902, -2.032973, 0, 0, 0, 1, 1,
-0.7741772, 2.12541, -0.3726974, 1, 1, 1, 1, 1,
-0.7733147, 0.2100953, -0.4472107, 1, 1, 1, 1, 1,
-0.7727665, -1.175771, -3.770204, 1, 1, 1, 1, 1,
-0.7703219, 0.1644519, -1.958018, 1, 1, 1, 1, 1,
-0.7689646, -0.422515, -2.292782, 1, 1, 1, 1, 1,
-0.7660603, -1.023593, -2.629056, 1, 1, 1, 1, 1,
-0.756838, -0.8370631, -2.049324, 1, 1, 1, 1, 1,
-0.7563495, -0.4787778, -4.057123, 1, 1, 1, 1, 1,
-0.7546057, -0.3602574, -2.80142, 1, 1, 1, 1, 1,
-0.752775, 0.5084803, -0.9734077, 1, 1, 1, 1, 1,
-0.7436113, 0.9876554, -0.9485064, 1, 1, 1, 1, 1,
-0.7381438, 0.7819483, -2.870556, 1, 1, 1, 1, 1,
-0.7362414, 0.3420527, -1.100812, 1, 1, 1, 1, 1,
-0.7332688, -1.836683, -2.639686, 1, 1, 1, 1, 1,
-0.7310601, -0.8207762, -1.167087, 1, 1, 1, 1, 1,
-0.723923, -0.2063698, -0.7478373, 0, 0, 1, 1, 1,
-0.7238654, -1.672548, -2.359848, 1, 0, 0, 1, 1,
-0.7230645, 0.6480598, 0.3747746, 1, 0, 0, 1, 1,
-0.7226613, -0.02394685, -1.899671, 1, 0, 0, 1, 1,
-0.7200989, 0.9101007, 0.4070228, 1, 0, 0, 1, 1,
-0.7195538, -1.412921, -1.575769, 1, 0, 0, 1, 1,
-0.7165129, -0.3556136, -2.648752, 0, 0, 0, 1, 1,
-0.7157774, -1.689799, -3.927345, 0, 0, 0, 1, 1,
-0.7088238, 0.4464135, -0.5714078, 0, 0, 0, 1, 1,
-0.7046412, 0.2628809, -1.831092, 0, 0, 0, 1, 1,
-0.702161, 1.224543, 0.09123922, 0, 0, 0, 1, 1,
-0.6969175, -0.2886312, -1.027511, 0, 0, 0, 1, 1,
-0.6957555, -1.206352, -2.958173, 0, 0, 0, 1, 1,
-0.6924079, 0.07570331, -1.626566, 1, 1, 1, 1, 1,
-0.6866598, -0.889838, -3.490949, 1, 1, 1, 1, 1,
-0.6819564, 0.03683088, -1.134084, 1, 1, 1, 1, 1,
-0.681752, -1.410755, -1.926206, 1, 1, 1, 1, 1,
-0.676853, -0.4470274, -1.834665, 1, 1, 1, 1, 1,
-0.6741691, 0.3493671, -1.710409, 1, 1, 1, 1, 1,
-0.6741586, 1.604626, 0.1878976, 1, 1, 1, 1, 1,
-0.669942, -0.3604727, -1.461491, 1, 1, 1, 1, 1,
-0.656467, -0.3565361, -0.1832937, 1, 1, 1, 1, 1,
-0.6560659, -0.671168, -2.499896, 1, 1, 1, 1, 1,
-0.6527471, 0.5036642, -1.225322, 1, 1, 1, 1, 1,
-0.6520244, -0.623212, -2.02711, 1, 1, 1, 1, 1,
-0.6495737, 1.11702, -0.869172, 1, 1, 1, 1, 1,
-0.6474568, -0.4282601, -1.742997, 1, 1, 1, 1, 1,
-0.6378635, 1.949652, -0.5849019, 1, 1, 1, 1, 1,
-0.6363906, 2.325593, 0.2266939, 0, 0, 1, 1, 1,
-0.6354324, -0.4529974, -2.880457, 1, 0, 0, 1, 1,
-0.6297164, 0.03406433, -1.388327, 1, 0, 0, 1, 1,
-0.6289054, -0.9132956, -3.560788, 1, 0, 0, 1, 1,
-0.6236566, -1.072611, -2.271254, 1, 0, 0, 1, 1,
-0.6168758, -0.8173583, -3.004588, 1, 0, 0, 1, 1,
-0.6112553, -0.0820007, -0.9244629, 0, 0, 0, 1, 1,
-0.6106231, 2.066789, 0.4766722, 0, 0, 0, 1, 1,
-0.6014894, 0.8583438, 1.260596, 0, 0, 0, 1, 1,
-0.59895, -2.16015, -2.252274, 0, 0, 0, 1, 1,
-0.5976495, -0.3455364, 0.6374949, 0, 0, 0, 1, 1,
-0.5967858, -1.227618, -1.936398, 0, 0, 0, 1, 1,
-0.5957906, 1.064151, -2.302206, 0, 0, 0, 1, 1,
-0.594997, 0.8149754, -0.9046698, 1, 1, 1, 1, 1,
-0.5945799, 1.079447, 0.2482806, 1, 1, 1, 1, 1,
-0.5904328, 0.5217904, -2.994081, 1, 1, 1, 1, 1,
-0.5901974, 1.612367, -0.9486703, 1, 1, 1, 1, 1,
-0.5851978, -1.16967, -3.520776, 1, 1, 1, 1, 1,
-0.5829781, -0.009708815, -0.06908607, 1, 1, 1, 1, 1,
-0.5810966, -0.776808, -3.506951, 1, 1, 1, 1, 1,
-0.579146, 0.4198641, -0.7751306, 1, 1, 1, 1, 1,
-0.5771263, 0.6334556, -1.45308, 1, 1, 1, 1, 1,
-0.5764459, -0.6496322, -1.864485, 1, 1, 1, 1, 1,
-0.5735666, -0.2652999, -1.591463, 1, 1, 1, 1, 1,
-0.5671577, 0.7629533, -1.014223, 1, 1, 1, 1, 1,
-0.5663012, 1.05013, 0.9895147, 1, 1, 1, 1, 1,
-0.559669, 2.406567, 0.1095001, 1, 1, 1, 1, 1,
-0.5575711, -0.5895409, -1.083281, 1, 1, 1, 1, 1,
-0.5533219, 0.6505705, -0.1243797, 0, 0, 1, 1, 1,
-0.5511242, -1.516324, -3.760893, 1, 0, 0, 1, 1,
-0.5493356, -0.4126829, -1.994253, 1, 0, 0, 1, 1,
-0.5487274, -0.8085779, -1.197545, 1, 0, 0, 1, 1,
-0.5484741, 0.8515944, -0.1131907, 1, 0, 0, 1, 1,
-0.5462945, 0.5384506, -0.2818236, 1, 0, 0, 1, 1,
-0.5419173, -0.9112907, -3.142816, 0, 0, 0, 1, 1,
-0.5401576, -1.083067, -1.214335, 0, 0, 0, 1, 1,
-0.5388788, 0.6637, 1.419173, 0, 0, 0, 1, 1,
-0.5388612, 0.2620136, -0.5203034, 0, 0, 0, 1, 1,
-0.5363535, -0.2132597, -2.483232, 0, 0, 0, 1, 1,
-0.5359861, 2.775313, -0.62681, 0, 0, 0, 1, 1,
-0.5276197, -1.042387, -4.456609, 0, 0, 0, 1, 1,
-0.5257553, 0.2193021, -1.515923, 1, 1, 1, 1, 1,
-0.5252501, -0.3411282, -2.210287, 1, 1, 1, 1, 1,
-0.5228447, -0.6148449, -1.523576, 1, 1, 1, 1, 1,
-0.52166, -0.7439455, -1.585199, 1, 1, 1, 1, 1,
-0.5204254, 0.3665618, 0.03244707, 1, 1, 1, 1, 1,
-0.5202312, 0.001963994, -3.070207, 1, 1, 1, 1, 1,
-0.5148841, -0.1477731, -2.622913, 1, 1, 1, 1, 1,
-0.5136916, 0.07009251, -0.8196395, 1, 1, 1, 1, 1,
-0.5048435, 1.443594, 0.292432, 1, 1, 1, 1, 1,
-0.4993648, -0.003671635, -2.533819, 1, 1, 1, 1, 1,
-0.496154, -0.4799757, -2.410419, 1, 1, 1, 1, 1,
-0.4937914, 0.6156909, 0.3640141, 1, 1, 1, 1, 1,
-0.4917587, -1.052805, -1.892037, 1, 1, 1, 1, 1,
-0.4907106, -0.3263477, -1.421883, 1, 1, 1, 1, 1,
-0.4867145, -0.7900215, -3.242776, 1, 1, 1, 1, 1,
-0.4841735, -0.7211207, -3.122953, 0, 0, 1, 1, 1,
-0.4839989, -0.8929418, -1.464318, 1, 0, 0, 1, 1,
-0.4790127, 2.076473, 0.1241274, 1, 0, 0, 1, 1,
-0.4785789, 0.4113074, -0.6748393, 1, 0, 0, 1, 1,
-0.4762019, -0.7825286, -1.252679, 1, 0, 0, 1, 1,
-0.4760152, 0.03000653, -2.386755, 1, 0, 0, 1, 1,
-0.4755286, -0.6948835, -1.223958, 0, 0, 0, 1, 1,
-0.4745187, -0.6571336, -3.809999, 0, 0, 0, 1, 1,
-0.4720497, 0.7482122, -0.1181532, 0, 0, 0, 1, 1,
-0.4696555, 0.0605323, -0.6794914, 0, 0, 0, 1, 1,
-0.4624596, 1.828487, 0.5869188, 0, 0, 0, 1, 1,
-0.4615575, 0.6940859, -0.4009797, 0, 0, 0, 1, 1,
-0.4606846, 0.4670059, 0.3285529, 0, 0, 0, 1, 1,
-0.4564253, -0.2123808, -1.087736, 1, 1, 1, 1, 1,
-0.4527501, 1.329184, 0.5478715, 1, 1, 1, 1, 1,
-0.4522896, -0.8085167, -3.265284, 1, 1, 1, 1, 1,
-0.4497252, 0.2681434, -0.7741441, 1, 1, 1, 1, 1,
-0.446632, -0.4927385, -2.249237, 1, 1, 1, 1, 1,
-0.4450522, -0.04922429, -1.462806, 1, 1, 1, 1, 1,
-0.44333, 1.087075, -0.2161377, 1, 1, 1, 1, 1,
-0.4427757, 0.2319089, -1.61522, 1, 1, 1, 1, 1,
-0.4418814, -1.76, -3.319909, 1, 1, 1, 1, 1,
-0.4415392, -1.693429, -2.957935, 1, 1, 1, 1, 1,
-0.4394997, -0.7494593, -1.255455, 1, 1, 1, 1, 1,
-0.4382967, -1.48482, -3.234065, 1, 1, 1, 1, 1,
-0.4357519, 0.5804617, -1.092078, 1, 1, 1, 1, 1,
-0.4349367, -0.1809805, -0.9439304, 1, 1, 1, 1, 1,
-0.4330387, -1.196734, -2.262989, 1, 1, 1, 1, 1,
-0.4321233, -1.889175, -0.8312508, 0, 0, 1, 1, 1,
-0.4318746, 0.9273821, -0.6533812, 1, 0, 0, 1, 1,
-0.4291175, 1.845337, -1.423701, 1, 0, 0, 1, 1,
-0.4234066, -0.4092598, -1.327362, 1, 0, 0, 1, 1,
-0.4186811, -1.613806, -3.427505, 1, 0, 0, 1, 1,
-0.4156814, 0.5062762, -1.855798, 1, 0, 0, 1, 1,
-0.4145246, -0.01763963, -0.7754772, 0, 0, 0, 1, 1,
-0.4133176, 0.4340417, -0.743126, 0, 0, 0, 1, 1,
-0.4090102, -0.1536503, -1.000118, 0, 0, 0, 1, 1,
-0.4087151, 0.1736499, -0.7937673, 0, 0, 0, 1, 1,
-0.4084529, -1.86249, -3.011404, 0, 0, 0, 1, 1,
-0.406357, 1.26679, -1.811254, 0, 0, 0, 1, 1,
-0.4040944, -0.1134687, -1.388808, 0, 0, 0, 1, 1,
-0.4040627, -1.32513, -3.895464, 1, 1, 1, 1, 1,
-0.402294, 0.06379271, -1.1523, 1, 1, 1, 1, 1,
-0.4013261, -2.693674, -3.284276, 1, 1, 1, 1, 1,
-0.4009579, -0.670054, -3.438559, 1, 1, 1, 1, 1,
-0.4006902, 0.3908651, -3.18451, 1, 1, 1, 1, 1,
-0.399716, 0.7176051, -0.5942509, 1, 1, 1, 1, 1,
-0.3985699, -0.02395259, -1.437807, 1, 1, 1, 1, 1,
-0.3984024, 0.7831616, -0.08241397, 1, 1, 1, 1, 1,
-0.3961288, -0.6805434, -3.29329, 1, 1, 1, 1, 1,
-0.3936332, 0.413213, -1.23052, 1, 1, 1, 1, 1,
-0.3898908, -0.55379, -2.962912, 1, 1, 1, 1, 1,
-0.3814209, -0.1455402, -2.022203, 1, 1, 1, 1, 1,
-0.3794481, -0.3841962, -1.611803, 1, 1, 1, 1, 1,
-0.3791153, 0.1104898, -2.020998, 1, 1, 1, 1, 1,
-0.3783138, 0.6910154, -0.7611258, 1, 1, 1, 1, 1,
-0.3738024, -0.4133375, -2.619669, 0, 0, 1, 1, 1,
-0.3728471, 1.952209, -1.695392, 1, 0, 0, 1, 1,
-0.3711635, 0.2211966, -2.534908, 1, 0, 0, 1, 1,
-0.3696685, -0.2367799, -0.8572086, 1, 0, 0, 1, 1,
-0.3651806, -0.01527223, 0.8214852, 1, 0, 0, 1, 1,
-0.3649371, 0.3005734, -0.6721318, 1, 0, 0, 1, 1,
-0.3645191, 0.2681903, 0.6187433, 0, 0, 0, 1, 1,
-0.3635705, 1.121222, -0.2524071, 0, 0, 0, 1, 1,
-0.3633359, 0.08129293, -3.487029, 0, 0, 0, 1, 1,
-0.3604829, 1.34036, 1.548463, 0, 0, 0, 1, 1,
-0.3574849, -1.283193, -2.511083, 0, 0, 0, 1, 1,
-0.35454, -1.858997, -2.548851, 0, 0, 0, 1, 1,
-0.3543116, 0.3978594, -1.679619, 0, 0, 0, 1, 1,
-0.349127, -1.651668, -4.992857, 1, 1, 1, 1, 1,
-0.3479905, 1.026714, -1.561799, 1, 1, 1, 1, 1,
-0.346749, -1.015468, -3.246149, 1, 1, 1, 1, 1,
-0.3452851, 0.6769268, -0.6653555, 1, 1, 1, 1, 1,
-0.345143, 0.1614123, -1.784633, 1, 1, 1, 1, 1,
-0.3420887, -0.2721572, -2.409805, 1, 1, 1, 1, 1,
-0.341715, 0.239562, -0.05636626, 1, 1, 1, 1, 1,
-0.3413696, -0.1389699, -1.358642, 1, 1, 1, 1, 1,
-0.3410758, -0.3212902, -2.313643, 1, 1, 1, 1, 1,
-0.3365236, -0.709069, -2.043897, 1, 1, 1, 1, 1,
-0.3277904, -0.455465, -4.315855, 1, 1, 1, 1, 1,
-0.3225122, -0.1168109, -1.016399, 1, 1, 1, 1, 1,
-0.3218632, 0.07214141, -1.664837, 1, 1, 1, 1, 1,
-0.3166901, 1.799657, 0.537659, 1, 1, 1, 1, 1,
-0.3161397, -0.4876476, -3.323453, 1, 1, 1, 1, 1,
-0.3139852, 1.280435, -0.8472998, 0, 0, 1, 1, 1,
-0.3132593, -0.3683501, -2.592622, 1, 0, 0, 1, 1,
-0.3108194, 0.3067137, -0.7124159, 1, 0, 0, 1, 1,
-0.3091766, 0.9613711, -1.379301, 1, 0, 0, 1, 1,
-0.3084939, 0.2881895, -2.012062, 1, 0, 0, 1, 1,
-0.3055655, 0.3842119, -0.6428725, 1, 0, 0, 1, 1,
-0.305341, 0.03022204, -3.611584, 0, 0, 0, 1, 1,
-0.3044991, -0.1839086, -3.489852, 0, 0, 0, 1, 1,
-0.3016571, 1.635291, 0.4813253, 0, 0, 0, 1, 1,
-0.3015071, 0.9581028, -2.839951, 0, 0, 0, 1, 1,
-0.301064, -1.070056, -3.190283, 0, 0, 0, 1, 1,
-0.3002421, -0.5989782, -4.081618, 0, 0, 0, 1, 1,
-0.2962207, 0.8227875, -1.089371, 0, 0, 0, 1, 1,
-0.2907971, 0.3839253, -2.551952, 1, 1, 1, 1, 1,
-0.2898803, 1.220853, -0.330995, 1, 1, 1, 1, 1,
-0.2873568, -0.1018964, -0.5378287, 1, 1, 1, 1, 1,
-0.2842308, 1.230319, -2.639807, 1, 1, 1, 1, 1,
-0.2837582, 1.680791, -2.910764, 1, 1, 1, 1, 1,
-0.280567, 0.8111904, 0.4294045, 1, 1, 1, 1, 1,
-0.2704513, -0.4041546, -2.492197, 1, 1, 1, 1, 1,
-0.2676131, -0.3840275, -1.767725, 1, 1, 1, 1, 1,
-0.2666191, 0.6990063, -0.459352, 1, 1, 1, 1, 1,
-0.2636244, 0.3643305, -0.920616, 1, 1, 1, 1, 1,
-0.2620273, 0.04067966, -1.707348, 1, 1, 1, 1, 1,
-0.260205, 0.4507724, 0.3907458, 1, 1, 1, 1, 1,
-0.2475547, 0.6017454, -2.14021, 1, 1, 1, 1, 1,
-0.2466258, -1.46806, -4.366805, 1, 1, 1, 1, 1,
-0.2465302, -1.218907, -3.661116, 1, 1, 1, 1, 1,
-0.2455153, -0.8820181, -3.251449, 0, 0, 1, 1, 1,
-0.2451093, -0.05582128, -1.633447, 1, 0, 0, 1, 1,
-0.2450152, 1.87009, 0.3222951, 1, 0, 0, 1, 1,
-0.2432346, 0.5655611, -0.6219024, 1, 0, 0, 1, 1,
-0.2418017, 1.123178, -0.4022896, 1, 0, 0, 1, 1,
-0.2374048, 0.875881, 0.08964112, 1, 0, 0, 1, 1,
-0.2367856, -0.2052841, -1.809924, 0, 0, 0, 1, 1,
-0.2349287, 0.9579126, 0.6543038, 0, 0, 0, 1, 1,
-0.2348735, -0.653467, -2.948095, 0, 0, 0, 1, 1,
-0.234607, -0.3235944, -4.85511, 0, 0, 0, 1, 1,
-0.2340588, -0.3842159, -2.280611, 0, 0, 0, 1, 1,
-0.215692, 0.4363615, -0.5935637, 0, 0, 0, 1, 1,
-0.2072714, -0.2680436, -2.442735, 0, 0, 0, 1, 1,
-0.1974442, 1.101715, -0.6024039, 1, 1, 1, 1, 1,
-0.1937212, 0.8436696, -0.5027089, 1, 1, 1, 1, 1,
-0.1916765, 0.33337, 0.3484869, 1, 1, 1, 1, 1,
-0.1889676, 0.2176574, -0.1447233, 1, 1, 1, 1, 1,
-0.187677, 1.587481, -1.963899, 1, 1, 1, 1, 1,
-0.1868896, -9.006696e-05, 0.1270949, 1, 1, 1, 1, 1,
-0.1859728, 0.07259022, -0.9927463, 1, 1, 1, 1, 1,
-0.1802134, -1.027987, -3.586336, 1, 1, 1, 1, 1,
-0.176201, 0.219209, 0.09553406, 1, 1, 1, 1, 1,
-0.1755671, 1.343142, -1.325776, 1, 1, 1, 1, 1,
-0.172224, -0.5552357, -2.015911, 1, 1, 1, 1, 1,
-0.1698075, -1.156024, -3.890271, 1, 1, 1, 1, 1,
-0.1644518, -0.544126, -1.935753, 1, 1, 1, 1, 1,
-0.1642169, -2.164513, -4.036299, 1, 1, 1, 1, 1,
-0.1633459, -0.8678363, -1.494971, 1, 1, 1, 1, 1,
-0.1585016, -0.1414689, -2.867311, 0, 0, 1, 1, 1,
-0.1581403, 0.497466, -1.616135, 1, 0, 0, 1, 1,
-0.155722, 0.2756358, -1.09991, 1, 0, 0, 1, 1,
-0.1471479, 0.7434927, -0.8491769, 1, 0, 0, 1, 1,
-0.1455125, -1.91521, -2.971261, 1, 0, 0, 1, 1,
-0.1429571, 1.037247, 0.3778341, 1, 0, 0, 1, 1,
-0.1402948, 0.07183123, -0.7732408, 0, 0, 0, 1, 1,
-0.1389851, 0.08792512, -1.079216, 0, 0, 0, 1, 1,
-0.1348144, 0.5776321, 0.1273874, 0, 0, 0, 1, 1,
-0.1307851, -0.4789764, -2.667771, 0, 0, 0, 1, 1,
-0.1304823, 0.8084991, 0.1064566, 0, 0, 0, 1, 1,
-0.1293428, -0.04781117, -2.210513, 0, 0, 0, 1, 1,
-0.1277024, 0.4425395, -1.294504, 0, 0, 0, 1, 1,
-0.1248403, -0.5150332, -3.739398, 1, 1, 1, 1, 1,
-0.1239202, -0.6453191, -1.86633, 1, 1, 1, 1, 1,
-0.1207194, 0.07735034, -0.6112303, 1, 1, 1, 1, 1,
-0.114066, -0.3018285, -1.96936, 1, 1, 1, 1, 1,
-0.1104125, -1.097128, -2.929634, 1, 1, 1, 1, 1,
-0.1076211, -0.8804661, -3.877606, 1, 1, 1, 1, 1,
-0.1071014, -0.2928859, -2.748508, 1, 1, 1, 1, 1,
-0.1028887, 0.2340971, -0.3827902, 1, 1, 1, 1, 1,
-0.1020742, -1.297684, -3.872775, 1, 1, 1, 1, 1,
-0.1006959, 0.009478061, -4.173401, 1, 1, 1, 1, 1,
-0.09497067, 1.300283, 0.6774111, 1, 1, 1, 1, 1,
-0.09341744, -1.018698, -2.501707, 1, 1, 1, 1, 1,
-0.08933949, 0.439694, 0.8162675, 1, 1, 1, 1, 1,
-0.08692473, 0.5389571, 2.042591, 1, 1, 1, 1, 1,
-0.08440968, -0.4068636, -6.750165, 1, 1, 1, 1, 1,
-0.07898781, 0.8854321, 0.5798769, 0, 0, 1, 1, 1,
-0.07781106, 0.2023247, 0.773165, 1, 0, 0, 1, 1,
-0.07489727, 0.01269945, -0.9523646, 1, 0, 0, 1, 1,
-0.07380069, -0.6617049, -3.518663, 1, 0, 0, 1, 1,
-0.07194817, 0.104992, -2.788176, 1, 0, 0, 1, 1,
-0.06585566, 1.072989, 0.7045582, 1, 0, 0, 1, 1,
-0.06474815, -1.860179, -3.807282, 0, 0, 0, 1, 1,
-0.06453473, 0.07842022, -0.9611412, 0, 0, 0, 1, 1,
-0.06373361, 0.1761429, -0.4353358, 0, 0, 0, 1, 1,
-0.05198352, -0.6166708, -1.525794, 0, 0, 0, 1, 1,
-0.0455115, 2.406728, -1.061727, 0, 0, 0, 1, 1,
-0.04498606, -0.6868503, -4.027369, 0, 0, 0, 1, 1,
-0.03582524, -0.388189, -2.554855, 0, 0, 0, 1, 1,
-0.03329324, 2.314728, -0.6981953, 1, 1, 1, 1, 1,
-0.03218638, 1.110811, 1.190767, 1, 1, 1, 1, 1,
-0.03173361, -2.649092, -3.534413, 1, 1, 1, 1, 1,
-0.02320181, 0.3061474, -1.302204, 1, 1, 1, 1, 1,
-0.02208369, 0.1181194, 0.4731132, 1, 1, 1, 1, 1,
-0.02177253, -0.4611129, -4.138898, 1, 1, 1, 1, 1,
-0.01592465, -1.276211, -3.428838, 1, 1, 1, 1, 1,
-0.01416627, 1.301656, -0.6694561, 1, 1, 1, 1, 1,
-0.01308181, 1.730103, 0.4924918, 1, 1, 1, 1, 1,
-0.01305212, 0.1081447, -1.114668, 1, 1, 1, 1, 1,
-0.01152714, -1.494499, -3.153682, 1, 1, 1, 1, 1,
-0.01094435, -0.7108291, -2.52112, 1, 1, 1, 1, 1,
-0.007622353, 1.941205, -0.8421655, 1, 1, 1, 1, 1,
-0.007508495, 0.6979024, -0.6380594, 1, 1, 1, 1, 1,
-0.006699171, -0.5539511, -2.855588, 1, 1, 1, 1, 1,
-0.006541391, 0.9809769, 0.569135, 0, 0, 1, 1, 1,
-0.005373019, -0.7731063, -3.081664, 1, 0, 0, 1, 1,
-0.005060142, 0.8552321, 0.07400694, 1, 0, 0, 1, 1,
0.004492503, -0.1209425, 2.435565, 1, 0, 0, 1, 1,
0.007805498, 0.5849571, -1.985144, 1, 0, 0, 1, 1,
0.008016428, -0.7967874, 2.994421, 1, 0, 0, 1, 1,
0.009401382, -0.8660102, 3.577466, 0, 0, 0, 1, 1,
0.01402909, -0.02030755, 1.890941, 0, 0, 0, 1, 1,
0.01720859, 0.07681054, -0.3073449, 0, 0, 0, 1, 1,
0.0180038, -0.4298165, 1.259032, 0, 0, 0, 1, 1,
0.02430128, -0.7982002, 2.562927, 0, 0, 0, 1, 1,
0.02505248, -0.0350712, 3.568614, 0, 0, 0, 1, 1,
0.02551463, -0.5027912, 1.858294, 0, 0, 0, 1, 1,
0.02897397, -0.7623373, 4.9339, 1, 1, 1, 1, 1,
0.03600424, 0.1904488, -1.104787, 1, 1, 1, 1, 1,
0.03896029, 0.2426867, -1.913011, 1, 1, 1, 1, 1,
0.04462626, 0.2164644, 2.184767, 1, 1, 1, 1, 1,
0.04837843, 0.240422, 0.02511952, 1, 1, 1, 1, 1,
0.05182736, 0.1976326, -0.4147892, 1, 1, 1, 1, 1,
0.05290314, -0.181281, 2.279464, 1, 1, 1, 1, 1,
0.05326201, -0.09676494, 3.789854, 1, 1, 1, 1, 1,
0.05442231, -1.311363, 3.334718, 1, 1, 1, 1, 1,
0.05639462, 0.02768357, 1.268574, 1, 1, 1, 1, 1,
0.05683531, 0.6912297, 0.8351056, 1, 1, 1, 1, 1,
0.06267668, 1.606705, 0.1640915, 1, 1, 1, 1, 1,
0.06451274, 0.03057223, 1.432339, 1, 1, 1, 1, 1,
0.06988913, 2.218387, -0.3152275, 1, 1, 1, 1, 1,
0.07508957, 0.1965813, 0.137788, 1, 1, 1, 1, 1,
0.08236118, 0.01944862, 1.683613, 0, 0, 1, 1, 1,
0.08583973, -0.868184, 3.959507, 1, 0, 0, 1, 1,
0.08944532, -1.061612, 3.378336, 1, 0, 0, 1, 1,
0.08957029, 0.5251166, 1.801367, 1, 0, 0, 1, 1,
0.09445916, -0.1503866, 4.444956, 1, 0, 0, 1, 1,
0.09538743, 0.4375528, -0.8765314, 1, 0, 0, 1, 1,
0.1023355, -0.3500667, 2.81981, 0, 0, 0, 1, 1,
0.1035439, -0.1963283, 1.821455, 0, 0, 0, 1, 1,
0.10442, 0.4974463, -0.1876206, 0, 0, 0, 1, 1,
0.1116148, 2.064728, 0.825154, 0, 0, 0, 1, 1,
0.1203066, -0.3543552, 2.228672, 0, 0, 0, 1, 1,
0.1252534, 2.396976, -0.2382871, 0, 0, 0, 1, 1,
0.1255479, 1.449275, 0.5995257, 0, 0, 0, 1, 1,
0.1295184, 0.04322413, -0.356946, 1, 1, 1, 1, 1,
0.1306601, 0.62558, 1.115569, 1, 1, 1, 1, 1,
0.1356589, 0.8112372, 0.309392, 1, 1, 1, 1, 1,
0.1363009, -1.060254, 3.358182, 1, 1, 1, 1, 1,
0.1389807, -0.3643764, 3.269946, 1, 1, 1, 1, 1,
0.1399489, -1.860425, 2.165787, 1, 1, 1, 1, 1,
0.1433174, -0.3883764, 1.941035, 1, 1, 1, 1, 1,
0.1453777, -1.487769, 1.966623, 1, 1, 1, 1, 1,
0.1455591, -1.012282, 3.436657, 1, 1, 1, 1, 1,
0.150245, -0.1502202, 2.868785, 1, 1, 1, 1, 1,
0.1538002, -0.05944868, 2.368845, 1, 1, 1, 1, 1,
0.1559647, 0.8973103, -1.733804, 1, 1, 1, 1, 1,
0.1587283, 0.2703865, -0.1298977, 1, 1, 1, 1, 1,
0.159033, 2.181581, -0.7500837, 1, 1, 1, 1, 1,
0.168146, 0.5640614, 1.266283, 1, 1, 1, 1, 1,
0.1698409, 0.04137645, 0.5741657, 0, 0, 1, 1, 1,
0.1706395, -0.5730965, 2.370373, 1, 0, 0, 1, 1,
0.1723339, 0.1395291, 1.437101, 1, 0, 0, 1, 1,
0.1725716, 0.3232289, 0.8229106, 1, 0, 0, 1, 1,
0.175119, 1.983655, 0.3470332, 1, 0, 0, 1, 1,
0.1762168, -0.6189795, 0.8306367, 1, 0, 0, 1, 1,
0.1831654, -0.8557283, 2.733536, 0, 0, 0, 1, 1,
0.1870803, 1.274847, -0.249294, 0, 0, 0, 1, 1,
0.1885662, -0.4388372, 1.41632, 0, 0, 0, 1, 1,
0.1904667, -1.314996, 1.780857, 0, 0, 0, 1, 1,
0.1931621, -0.4766266, 2.284752, 0, 0, 0, 1, 1,
0.1969867, 1.535805, -0.1182397, 0, 0, 0, 1, 1,
0.1981339, -0.5605356, 2.937196, 0, 0, 0, 1, 1,
0.2007893, 0.5180153, -0.7784806, 1, 1, 1, 1, 1,
0.2133336, 1.285927, -0.4573374, 1, 1, 1, 1, 1,
0.2146832, 0.55169, 1.860851, 1, 1, 1, 1, 1,
0.2169213, -0.3460505, 3.558172, 1, 1, 1, 1, 1,
0.2171203, 0.1070156, 2.754521, 1, 1, 1, 1, 1,
0.2175988, -0.3507156, 2.42913, 1, 1, 1, 1, 1,
0.2258266, -0.3373822, 1.720413, 1, 1, 1, 1, 1,
0.2264184, 0.09314413, 1.713714, 1, 1, 1, 1, 1,
0.230838, 0.9748338, 0.6470113, 1, 1, 1, 1, 1,
0.2336054, -0.8699193, 1.296157, 1, 1, 1, 1, 1,
0.2352089, -0.9854857, 3.247186, 1, 1, 1, 1, 1,
0.2362398, 0.8463073, 2.220517, 1, 1, 1, 1, 1,
0.240555, -0.171749, 2.695167, 1, 1, 1, 1, 1,
0.2440369, 0.3616059, 0.7687275, 1, 1, 1, 1, 1,
0.2449044, -1.224608, 3.191354, 1, 1, 1, 1, 1,
0.2455947, -1.618993, 2.530189, 0, 0, 1, 1, 1,
0.2516138, 1.095892, -1.014995, 1, 0, 0, 1, 1,
0.2549699, -0.4753077, 1.959558, 1, 0, 0, 1, 1,
0.2575277, -0.4419877, 1.250504, 1, 0, 0, 1, 1,
0.2587657, -0.4264536, 2.319655, 1, 0, 0, 1, 1,
0.2590323, -0.149468, 3.498613, 1, 0, 0, 1, 1,
0.2632914, -1.036303, 3.813816, 0, 0, 0, 1, 1,
0.2634095, -0.05920255, 3.334682, 0, 0, 0, 1, 1,
0.2645086, -0.570209, 2.369353, 0, 0, 0, 1, 1,
0.2661827, -0.8633395, 2.765968, 0, 0, 0, 1, 1,
0.2670009, -0.5189582, 0.6337659, 0, 0, 0, 1, 1,
0.2713231, 0.02191706, 1.128996, 0, 0, 0, 1, 1,
0.2721378, -0.5532411, 2.402163, 0, 0, 0, 1, 1,
0.2729986, 0.2230957, 0.1008954, 1, 1, 1, 1, 1,
0.2783123, -0.31305, 2.729856, 1, 1, 1, 1, 1,
0.2838761, -1.115689, 2.543349, 1, 1, 1, 1, 1,
0.28594, 0.5699136, 1.138247, 1, 1, 1, 1, 1,
0.2875793, 0.7989365, -0.5609066, 1, 1, 1, 1, 1,
0.2876847, -0.2464024, 3.644874, 1, 1, 1, 1, 1,
0.2891653, -0.6422727, 0.704369, 1, 1, 1, 1, 1,
0.2901763, 1.054367, -1.061656, 1, 1, 1, 1, 1,
0.303028, 0.4243157, 1.69895, 1, 1, 1, 1, 1,
0.3101988, 0.9534148, 0.006097888, 1, 1, 1, 1, 1,
0.3109426, 0.6786911, 0.01377503, 1, 1, 1, 1, 1,
0.3123978, -0.2017387, 2.855096, 1, 1, 1, 1, 1,
0.3128814, 3.151891, 0.9882641, 1, 1, 1, 1, 1,
0.3201288, 0.1383077, 2.002322, 1, 1, 1, 1, 1,
0.3221516, 2.170099, 0.03915251, 1, 1, 1, 1, 1,
0.3290685, 0.8438886, 1.917221, 0, 0, 1, 1, 1,
0.3317737, 0.809998, 0.7071835, 1, 0, 0, 1, 1,
0.3349485, -0.1577763, 3.181967, 1, 0, 0, 1, 1,
0.3360784, -3.244895, 2.493591, 1, 0, 0, 1, 1,
0.3379394, -0.2903821, 2.004571, 1, 0, 0, 1, 1,
0.3383942, 1.504839, -0.29487, 1, 0, 0, 1, 1,
0.3387219, 0.5448702, 0.6271419, 0, 0, 0, 1, 1,
0.3398037, -0.003968212, 4.485839, 0, 0, 0, 1, 1,
0.3406332, 1.55249, -1.940251, 0, 0, 0, 1, 1,
0.3411675, -0.4853263, 1.409041, 0, 0, 0, 1, 1,
0.3439622, 0.3013411, -1.093548, 0, 0, 0, 1, 1,
0.3503358, 0.4599603, 0.5694367, 0, 0, 0, 1, 1,
0.3535602, -0.006245577, 1.389651, 0, 0, 0, 1, 1,
0.3645993, 0.6335656, -0.1583704, 1, 1, 1, 1, 1,
0.3658082, -0.4698859, 1.832467, 1, 1, 1, 1, 1,
0.3702961, -0.2111517, 1.975443, 1, 1, 1, 1, 1,
0.3707776, 0.2808507, 1.426902, 1, 1, 1, 1, 1,
0.3756321, 0.3109868, 0.1886303, 1, 1, 1, 1, 1,
0.3792024, 0.6860484, -0.01618149, 1, 1, 1, 1, 1,
0.3827194, 1.16562, 0.4211117, 1, 1, 1, 1, 1,
0.3897002, -0.2042472, 3.009673, 1, 1, 1, 1, 1,
0.3899267, 0.01282735, 1.344705, 1, 1, 1, 1, 1,
0.3958406, -1.642861, 2.772755, 1, 1, 1, 1, 1,
0.3994038, -0.6800747, 0.5398213, 1, 1, 1, 1, 1,
0.3999636, -0.9345632, 2.515234, 1, 1, 1, 1, 1,
0.4040449, -1.313179, 3.333125, 1, 1, 1, 1, 1,
0.4117113, 0.3470811, 2.015798, 1, 1, 1, 1, 1,
0.4127003, -1.656462, 2.136181, 1, 1, 1, 1, 1,
0.4131235, 1.472007, 0.2594514, 0, 0, 1, 1, 1,
0.4168668, -0.1829747, 2.014823, 1, 0, 0, 1, 1,
0.4181929, -0.4147592, 4.061671, 1, 0, 0, 1, 1,
0.4191056, -1.859062, 1.723655, 1, 0, 0, 1, 1,
0.42249, 0.0009565363, 2.629917, 1, 0, 0, 1, 1,
0.4280624, 1.020343, -1.108791, 1, 0, 0, 1, 1,
0.4300461, -0.2672609, -0.1319566, 0, 0, 0, 1, 1,
0.430397, -1.253523, 2.662647, 0, 0, 0, 1, 1,
0.4309715, 0.8298842, 0.09366579, 0, 0, 0, 1, 1,
0.4333007, -0.02393279, 2.939382, 0, 0, 0, 1, 1,
0.4350498, 0.43026, 0.1514605, 0, 0, 0, 1, 1,
0.4362267, 0.2642821, -0.1534534, 0, 0, 0, 1, 1,
0.4442366, 0.01255527, 0.5427129, 0, 0, 0, 1, 1,
0.4451045, 0.03616336, 2.95661, 1, 1, 1, 1, 1,
0.4453066, 1.130367, 0.9749322, 1, 1, 1, 1, 1,
0.4457962, 1.119422, 1.429443, 1, 1, 1, 1, 1,
0.4509287, 0.01106675, 2.314603, 1, 1, 1, 1, 1,
0.4575301, 1.278966, 1.117515, 1, 1, 1, 1, 1,
0.4578249, 0.7725421, -0.2590219, 1, 1, 1, 1, 1,
0.4590482, -0.5154015, 3.785024, 1, 1, 1, 1, 1,
0.4647215, 0.09072621, 0.4523014, 1, 1, 1, 1, 1,
0.4672879, -0.1430003, 2.107409, 1, 1, 1, 1, 1,
0.4680029, 0.5959579, 0.7077381, 1, 1, 1, 1, 1,
0.4786171, 2.192484, 1.216507, 1, 1, 1, 1, 1,
0.4820814, 0.2922038, 1.973516, 1, 1, 1, 1, 1,
0.4832927, 0.1569846, 1.442456, 1, 1, 1, 1, 1,
0.4848678, -0.411138, 3.324116, 1, 1, 1, 1, 1,
0.4851638, 0.03653835, 2.203964, 1, 1, 1, 1, 1,
0.4859074, 0.4416533, 0.1136948, 0, 0, 1, 1, 1,
0.4873356, -0.6294956, 2.520457, 1, 0, 0, 1, 1,
0.4884758, -0.6454491, 2.635393, 1, 0, 0, 1, 1,
0.4930817, -1.542938, 2.200826, 1, 0, 0, 1, 1,
0.4954156, 0.7685173, -0.01741971, 1, 0, 0, 1, 1,
0.4977423, -0.1600125, 1.033711, 1, 0, 0, 1, 1,
0.5000643, 0.5414915, -0.1351623, 0, 0, 0, 1, 1,
0.5026038, -0.3284431, 1.813348, 0, 0, 0, 1, 1,
0.502917, 0.6978819, 2.025675, 0, 0, 0, 1, 1,
0.5033152, 0.2666381, 1.412055, 0, 0, 0, 1, 1,
0.505178, 1.331831, 0.2903701, 0, 0, 0, 1, 1,
0.5071231, 1.006371, -1.99886, 0, 0, 0, 1, 1,
0.5084574, -0.2010606, 1.206542, 0, 0, 0, 1, 1,
0.5110759, -0.8697191, 1.856308, 1, 1, 1, 1, 1,
0.5130099, -0.9512367, 4.20992, 1, 1, 1, 1, 1,
0.5149039, -0.9358557, 1.463729, 1, 1, 1, 1, 1,
0.5188744, -1.949557, 3.513323, 1, 1, 1, 1, 1,
0.5191067, 0.09086299, 3.215212, 1, 1, 1, 1, 1,
0.5262123, -0.6249053, 1.637445, 1, 1, 1, 1, 1,
0.5301614, 1.55558, -0.1173342, 1, 1, 1, 1, 1,
0.5327637, -0.2194622, 1.637274, 1, 1, 1, 1, 1,
0.5334257, 1.607913, 0.3938512, 1, 1, 1, 1, 1,
0.5419298, 0.3913393, 0.9359581, 1, 1, 1, 1, 1,
0.5480173, 0.5799439, 0.991454, 1, 1, 1, 1, 1,
0.5519547, 0.9828633, 0.6823294, 1, 1, 1, 1, 1,
0.5531445, -1.123182, 2.734992, 1, 1, 1, 1, 1,
0.5547807, 0.2847806, 1.059342, 1, 1, 1, 1, 1,
0.5568843, 1.914707, 0.09627277, 1, 1, 1, 1, 1,
0.5570102, 1.771634, 0.2337909, 0, 0, 1, 1, 1,
0.5580124, -0.9110643, 3.453396, 1, 0, 0, 1, 1,
0.5588187, -1.863522, 2.924902, 1, 0, 0, 1, 1,
0.564321, -0.6355512, 2.643369, 1, 0, 0, 1, 1,
0.5721369, 0.6550789, -0.4189083, 1, 0, 0, 1, 1,
0.5774416, 1.171626, -0.13895, 1, 0, 0, 1, 1,
0.577935, 0.266591, 0.5214596, 0, 0, 0, 1, 1,
0.5871887, -0.8210155, 3.418165, 0, 0, 0, 1, 1,
0.6022895, 0.8008447, 0.3042717, 0, 0, 0, 1, 1,
0.6047012, -0.9199292, 3.068964, 0, 0, 0, 1, 1,
0.6055694, -0.6027495, 4.742501, 0, 0, 0, 1, 1,
0.6061269, 0.5463514, 1.901788, 0, 0, 0, 1, 1,
0.6070577, 1.064541, 0.5175201, 0, 0, 0, 1, 1,
0.6084782, 1.101348, 1.327996, 1, 1, 1, 1, 1,
0.6112148, 1.531007, 1.13097, 1, 1, 1, 1, 1,
0.614099, -0.7387334, 1.184492, 1, 1, 1, 1, 1,
0.6151152, -2.133702, 2.308593, 1, 1, 1, 1, 1,
0.6183069, 0.8697595, 1.704607, 1, 1, 1, 1, 1,
0.6223274, -0.1803899, 2.449815, 1, 1, 1, 1, 1,
0.6231082, -0.2977382, 1.784935, 1, 1, 1, 1, 1,
0.6285061, 0.8327292, 1.13235, 1, 1, 1, 1, 1,
0.6324871, 0.585263, 0.002822834, 1, 1, 1, 1, 1,
0.6327878, 2.611332, 0.9770858, 1, 1, 1, 1, 1,
0.6376411, 0.7038183, 0.07565569, 1, 1, 1, 1, 1,
0.6393405, 1.586354, 0.6047097, 1, 1, 1, 1, 1,
0.6413512, -0.01625786, 2.215991, 1, 1, 1, 1, 1,
0.6420761, 0.4569268, 1.098252, 1, 1, 1, 1, 1,
0.6444256, 0.6490407, 1.03633, 1, 1, 1, 1, 1,
0.645244, 0.1286813, 0.0991655, 0, 0, 1, 1, 1,
0.6577031, -0.1647465, 2.226144, 1, 0, 0, 1, 1,
0.6581571, -0.2444254, 2.71465, 1, 0, 0, 1, 1,
0.6586673, -0.4077792, 2.897954, 1, 0, 0, 1, 1,
0.6668759, -1.066531, 2.471014, 1, 0, 0, 1, 1,
0.6765438, -0.6233931, 2.985474, 1, 0, 0, 1, 1,
0.6770043, -1.134211, 1.976482, 0, 0, 0, 1, 1,
0.6788176, 1.583243, 1.918667, 0, 0, 0, 1, 1,
0.6791354, -0.8332179, 2.352669, 0, 0, 0, 1, 1,
0.6840471, -0.774278, 4.48408, 0, 0, 0, 1, 1,
0.6944981, 0.3662233, 0.2918802, 0, 0, 0, 1, 1,
0.6979598, 0.4471757, 1.728008, 0, 0, 0, 1, 1,
0.6996007, 0.9595741, 0.05031881, 0, 0, 0, 1, 1,
0.7057955, 0.3548894, -0.09552515, 1, 1, 1, 1, 1,
0.7270911, 0.2298319, -0.1308022, 1, 1, 1, 1, 1,
0.7280171, 2.235636, -0.2382269, 1, 1, 1, 1, 1,
0.7282412, 0.3771113, 0.1032749, 1, 1, 1, 1, 1,
0.7307695, 0.3843687, 1.945265, 1, 1, 1, 1, 1,
0.731796, 1.776114, -0.07392418, 1, 1, 1, 1, 1,
0.7417018, 0.3208682, 2.87265, 1, 1, 1, 1, 1,
0.7500488, -0.6152, 2.653247, 1, 1, 1, 1, 1,
0.7508098, 0.2447436, 0.3106959, 1, 1, 1, 1, 1,
0.7629449, 0.6171379, 2.221414, 1, 1, 1, 1, 1,
0.7689164, -0.5658684, 4.013056, 1, 1, 1, 1, 1,
0.7725315, 0.6064397, 0.1780821, 1, 1, 1, 1, 1,
0.7825117, 0.9192972, 1.44319, 1, 1, 1, 1, 1,
0.7842852, 0.5358565, -0.496476, 1, 1, 1, 1, 1,
0.78518, 0.9466974, 0.6491624, 1, 1, 1, 1, 1,
0.7876981, 0.08496446, 0.9466939, 0, 0, 1, 1, 1,
0.798532, -0.3866715, 1.724826, 1, 0, 0, 1, 1,
0.8003709, 1.033878, 0.187626, 1, 0, 0, 1, 1,
0.8008274, -0.3914552, 2.684822, 1, 0, 0, 1, 1,
0.8025298, -0.007367613, 1.656484, 1, 0, 0, 1, 1,
0.8033108, 0.06138917, 1.973476, 1, 0, 0, 1, 1,
0.8058991, 1.806259, 1.327911, 0, 0, 0, 1, 1,
0.8073437, -0.7972596, 1.173095, 0, 0, 0, 1, 1,
0.8143358, -0.8294035, 1.122634, 0, 0, 0, 1, 1,
0.8223058, 0.7682918, 0.1765014, 0, 0, 0, 1, 1,
0.833872, 1.075459, -0.05754834, 0, 0, 0, 1, 1,
0.8361966, -0.3896744, 2.75476, 0, 0, 0, 1, 1,
0.8435878, -1.041966, 2.888463, 0, 0, 0, 1, 1,
0.8442343, 0.8054796, -0.0790871, 1, 1, 1, 1, 1,
0.8530299, 0.1144848, 1.036981, 1, 1, 1, 1, 1,
0.8581153, 0.6473929, -1.668337, 1, 1, 1, 1, 1,
0.8610079, -1.343891, 3.985406, 1, 1, 1, 1, 1,
0.8698332, -1.806733, 4.930179, 1, 1, 1, 1, 1,
0.8717232, -0.7005001, 2.278769, 1, 1, 1, 1, 1,
0.874657, 0.5947471, 0.4112101, 1, 1, 1, 1, 1,
0.8746998, -0.9875495, 2.532539, 1, 1, 1, 1, 1,
0.8785884, 1.209185, -0.3058051, 1, 1, 1, 1, 1,
0.8832231, 0.06456082, 1.275562, 1, 1, 1, 1, 1,
0.8947671, -0.07470521, 2.814214, 1, 1, 1, 1, 1,
0.8947756, 1.634724, 1.378165, 1, 1, 1, 1, 1,
0.8986239, 1.030828, 0.164408, 1, 1, 1, 1, 1,
0.9034694, -1.172729, 3.433192, 1, 1, 1, 1, 1,
0.9062226, -1.694388, 1.963573, 1, 1, 1, 1, 1,
0.9081662, -0.2445719, 2.099651, 0, 0, 1, 1, 1,
0.9133185, -0.8964468, 1.621366, 1, 0, 0, 1, 1,
0.9199115, 1.922, 0.8373651, 1, 0, 0, 1, 1,
0.9302319, 0.07623501, 2.65692, 1, 0, 0, 1, 1,
0.9304102, -0.6561391, 3.049097, 1, 0, 0, 1, 1,
0.9311258, -1.057277, 5.277599, 1, 0, 0, 1, 1,
0.9330366, -0.3304034, 2.049548, 0, 0, 0, 1, 1,
0.9420309, -0.4929677, 1.063709, 0, 0, 0, 1, 1,
0.942768, -0.6803231, 0.4389294, 0, 0, 0, 1, 1,
0.9470963, -0.2336473, 3.080088, 0, 0, 0, 1, 1,
0.9484856, -1.390718, 2.115254, 0, 0, 0, 1, 1,
0.9487759, -0.8801095, 3.203657, 0, 0, 0, 1, 1,
0.9559799, -0.1584539, 1.047115, 0, 0, 0, 1, 1,
0.9652835, -0.7420748, 3.32378, 1, 1, 1, 1, 1,
0.9702507, 0.468864, 1.073197, 1, 1, 1, 1, 1,
0.9746626, -0.1407802, 4.017306, 1, 1, 1, 1, 1,
0.9826083, -2.375324, 1.146399, 1, 1, 1, 1, 1,
0.9897562, -3.136575, 1.648382, 1, 1, 1, 1, 1,
0.9902213, 0.8202373, 0.01157532, 1, 1, 1, 1, 1,
0.9932412, 0.4381298, 0.4516159, 1, 1, 1, 1, 1,
0.994809, 1.046454, -1.858869, 1, 1, 1, 1, 1,
1.003216, -1.817763, 2.911749, 1, 1, 1, 1, 1,
1.010229, 1.565844, 0.3944694, 1, 1, 1, 1, 1,
1.014279, -2.551953, 3.163346, 1, 1, 1, 1, 1,
1.021516, 0.9505157, 1.092055, 1, 1, 1, 1, 1,
1.022163, 1.572198, 1.664916, 1, 1, 1, 1, 1,
1.026449, -0.4782425, 3.179843, 1, 1, 1, 1, 1,
1.031262, -1.47961, 2.609936, 1, 1, 1, 1, 1,
1.037017, 1.883623, 1.440553, 0, 0, 1, 1, 1,
1.039182, -0.05743966, 0.9768479, 1, 0, 0, 1, 1,
1.040727, -0.2969181, 1.911294, 1, 0, 0, 1, 1,
1.041407, -1.544349, 2.241668, 1, 0, 0, 1, 1,
1.043823, -1.711522, 2.440676, 1, 0, 0, 1, 1,
1.046094, -0.8108103, 1.256539, 1, 0, 0, 1, 1,
1.046963, -0.07375593, 2.094831, 0, 0, 0, 1, 1,
1.047478, -0.3775272, 2.294479, 0, 0, 0, 1, 1,
1.047951, 0.634286, 0.6515108, 0, 0, 0, 1, 1,
1.048498, 1.295498, -0.2188494, 0, 0, 0, 1, 1,
1.055756, -1.397891, 0.7161379, 0, 0, 0, 1, 1,
1.061861, 0.8716894, 3.061721, 0, 0, 0, 1, 1,
1.063478, 1.282449, 1.698554, 0, 0, 0, 1, 1,
1.065658, 2.884369, -0.1168188, 1, 1, 1, 1, 1,
1.065964, 0.1765094, -0.6370237, 1, 1, 1, 1, 1,
1.072456, -1.128305, 2.378508, 1, 1, 1, 1, 1,
1.072989, -0.6546024, 3.218302, 1, 1, 1, 1, 1,
1.074022, 2.718986, -1.006912, 1, 1, 1, 1, 1,
1.078974, -0.877557, 0.6006868, 1, 1, 1, 1, 1,
1.085897, 0.3565271, 0.6502445, 1, 1, 1, 1, 1,
1.086742, 1.165121, -0.1457706, 1, 1, 1, 1, 1,
1.090829, -0.6293324, 1.216551, 1, 1, 1, 1, 1,
1.098678, 0.42478, 0.8177206, 1, 1, 1, 1, 1,
1.102728, 1.118137, 1.381498, 1, 1, 1, 1, 1,
1.102877, 1.072076, 1.841209, 1, 1, 1, 1, 1,
1.114242, 0.6579086, 1.447593, 1, 1, 1, 1, 1,
1.126034, 1.315498, 1.617584, 1, 1, 1, 1, 1,
1.128951, -0.6001981, 3.326881, 1, 1, 1, 1, 1,
1.130863, -0.8976818, 2.073556, 0, 0, 1, 1, 1,
1.133347, 0.3479516, 1.225471, 1, 0, 0, 1, 1,
1.134356, -0.7936053, 0.1973942, 1, 0, 0, 1, 1,
1.14457, -1.186797, 1.805592, 1, 0, 0, 1, 1,
1.152608, -0.9880857, 1.489994, 1, 0, 0, 1, 1,
1.156168, 0.689039, -0.4377704, 1, 0, 0, 1, 1,
1.161116, -0.9560245, 4.604273, 0, 0, 0, 1, 1,
1.179726, 0.5389387, 1.299688, 0, 0, 0, 1, 1,
1.180429, 2.559562, 0.508638, 0, 0, 0, 1, 1,
1.181826, 0.6756248, 1.776239, 0, 0, 0, 1, 1,
1.185733, -0.1253426, 1.635411, 0, 0, 0, 1, 1,
1.192987, -0.6134467, 1.202875, 0, 0, 0, 1, 1,
1.20491, 0.2241746, -0.2848202, 0, 0, 0, 1, 1,
1.212413, -0.9941333, 1.420281, 1, 1, 1, 1, 1,
1.216055, 0.4165479, 0.4262862, 1, 1, 1, 1, 1,
1.217145, -1.477304, 2.885975, 1, 1, 1, 1, 1,
1.227456, 1.748813, 0.03221314, 1, 1, 1, 1, 1,
1.236599, 0.102956, 1.210243, 1, 1, 1, 1, 1,
1.242101, -1.069053, 2.976673, 1, 1, 1, 1, 1,
1.246325, 0.4848273, 2.34974, 1, 1, 1, 1, 1,
1.246799, 0.3083596, 2.41496, 1, 1, 1, 1, 1,
1.256182, -0.9138646, 2.107329, 1, 1, 1, 1, 1,
1.258285, -0.1323132, 2.330548, 1, 1, 1, 1, 1,
1.259956, -0.5039983, 1.845727, 1, 1, 1, 1, 1,
1.263984, -0.6855077, 2.90794, 1, 1, 1, 1, 1,
1.273287, -0.174357, 2.753556, 1, 1, 1, 1, 1,
1.291068, 0.02455984, -0.6478693, 1, 1, 1, 1, 1,
1.309158, 2.555707, 1.077266, 1, 1, 1, 1, 1,
1.320501, -1.362059, 2.448193, 0, 0, 1, 1, 1,
1.334989, -1.404966, 0.001611104, 1, 0, 0, 1, 1,
1.335069, -1.541633, 3.257649, 1, 0, 0, 1, 1,
1.338262, 0.5102489, 1.33201, 1, 0, 0, 1, 1,
1.350182, 1.78975, 1.116037, 1, 0, 0, 1, 1,
1.351485, 0.402137, 1.866196, 1, 0, 0, 1, 1,
1.354559, -0.442519, 1.352772, 0, 0, 0, 1, 1,
1.35791, -0.7584565, 3.699063, 0, 0, 0, 1, 1,
1.375419, -0.2195927, 2.589604, 0, 0, 0, 1, 1,
1.377825, 0.7980371, 1.3141, 0, 0, 0, 1, 1,
1.379792, -0.5550056, 0.7602268, 0, 0, 0, 1, 1,
1.395864, -0.5731524, 1.431721, 0, 0, 0, 1, 1,
1.412823, 1.648808, 1.621488, 0, 0, 0, 1, 1,
1.416655, -0.306044, 1.797423, 1, 1, 1, 1, 1,
1.4433, -0.7093359, 2.117769, 1, 1, 1, 1, 1,
1.454321, 1.520702, 0.3398247, 1, 1, 1, 1, 1,
1.460225, -0.1059493, 1.786366, 1, 1, 1, 1, 1,
1.461177, 0.123024, 0.7679466, 1, 1, 1, 1, 1,
1.462269, -0.1600274, 1.149352, 1, 1, 1, 1, 1,
1.478961, 0.7277662, 2.506665, 1, 1, 1, 1, 1,
1.484376, -1.36209, 1.821256, 1, 1, 1, 1, 1,
1.497571, 0.2765004, 1.869873, 1, 1, 1, 1, 1,
1.501838, -0.1353811, 3.155496, 1, 1, 1, 1, 1,
1.506847, -2.649882, 1.942413, 1, 1, 1, 1, 1,
1.509958, 0.7888668, -1.042258, 1, 1, 1, 1, 1,
1.513226, 0.1350615, 1.190885, 1, 1, 1, 1, 1,
1.520981, -1.23452, 2.222855, 1, 1, 1, 1, 1,
1.524334, -1.433365, 2.747627, 1, 1, 1, 1, 1,
1.530064, 1.956137, 0.4735496, 0, 0, 1, 1, 1,
1.533509, -0.4310287, 3.088116, 1, 0, 0, 1, 1,
1.535949, 1.769679, -0.06465875, 1, 0, 0, 1, 1,
1.535967, -1.29184, 3.778417, 1, 0, 0, 1, 1,
1.557143, -0.1805884, 3.172666, 1, 0, 0, 1, 1,
1.558172, 0.410247, 1.79497, 1, 0, 0, 1, 1,
1.561846, 1.03392, 1.674304, 0, 0, 0, 1, 1,
1.563627, -1.503256, 3.771108, 0, 0, 0, 1, 1,
1.565953, -0.8849693, 3.485988, 0, 0, 0, 1, 1,
1.576189, -0.5164475, 2.497629, 0, 0, 0, 1, 1,
1.587023, 2.010573, -0.3868284, 0, 0, 0, 1, 1,
1.592266, -0.4692502, 1.578327, 0, 0, 0, 1, 1,
1.607951, -1.758318, 3.585407, 0, 0, 0, 1, 1,
1.608336, -1.367204, 2.116128, 1, 1, 1, 1, 1,
1.60988, -0.1718012, 1.781433, 1, 1, 1, 1, 1,
1.61096, 0.1903674, 2.430314, 1, 1, 1, 1, 1,
1.621125, -1.732945, 3.772271, 1, 1, 1, 1, 1,
1.632759, 1.132538, -0.598453, 1, 1, 1, 1, 1,
1.634482, -0.3531809, 1.521337, 1, 1, 1, 1, 1,
1.639408, 0.459061, -0.2381229, 1, 1, 1, 1, 1,
1.650949, 0.009247694, 2.263406, 1, 1, 1, 1, 1,
1.655653, 0.406339, 0.5592485, 1, 1, 1, 1, 1,
1.660291, 0.7331724, 1.06551, 1, 1, 1, 1, 1,
1.679125, 1.053289, 3.304802, 1, 1, 1, 1, 1,
1.683639, -0.3082455, 1.983167, 1, 1, 1, 1, 1,
1.701735, 0.1376699, 2.124048, 1, 1, 1, 1, 1,
1.710705, 2.213356, 2.330942, 1, 1, 1, 1, 1,
1.71782, 1.18328, 0.3913117, 1, 1, 1, 1, 1,
1.734815, -0.6110337, 2.171602, 0, 0, 1, 1, 1,
1.744564, -1.143883, 1.955829, 1, 0, 0, 1, 1,
1.754974, 0.3637387, 1.085406, 1, 0, 0, 1, 1,
1.759738, 0.387863, 1.717656, 1, 0, 0, 1, 1,
1.764622, 0.5627782, 0.5859545, 1, 0, 0, 1, 1,
1.798168, -0.7270799, 2.152027, 1, 0, 0, 1, 1,
1.809214, 1.46573, 1.44989, 0, 0, 0, 1, 1,
1.810571, 0.7278667, 0.7542416, 0, 0, 0, 1, 1,
1.828506, -0.8199788, 1.859155, 0, 0, 0, 1, 1,
1.828749, 0.7980322, 0.2894228, 0, 0, 0, 1, 1,
1.829561, -1.070291, 1.199265, 0, 0, 0, 1, 1,
1.834019, 0.7783718, 2.826564, 0, 0, 0, 1, 1,
1.876136, -0.01709877, 1.905206, 0, 0, 0, 1, 1,
1.880815, -0.4405761, 2.036613, 1, 1, 1, 1, 1,
1.919978, 1.262668, -0.6067547, 1, 1, 1, 1, 1,
1.929502, -0.4912056, 1.899117, 1, 1, 1, 1, 1,
1.946126, 0.1246191, 2.832773, 1, 1, 1, 1, 1,
1.947473, -0.01988739, 1.664717, 1, 1, 1, 1, 1,
1.972381, -0.224591, 1.025951, 1, 1, 1, 1, 1,
1.978278, -0.3447971, 0.03552676, 1, 1, 1, 1, 1,
2.019617, -1.137845, 3.580506, 1, 1, 1, 1, 1,
2.048082, -0.4396093, 2.556633, 1, 1, 1, 1, 1,
2.061188, -0.5601555, 1.028931, 1, 1, 1, 1, 1,
2.06239, 1.834685, -0.75795, 1, 1, 1, 1, 1,
2.071607, 0.0534904, 1.858089, 1, 1, 1, 1, 1,
2.07419, 0.3064029, 0.2936643, 1, 1, 1, 1, 1,
2.083325, -0.9310877, 2.991019, 1, 1, 1, 1, 1,
2.112536, -1.553853, 1.781046, 1, 1, 1, 1, 1,
2.113789, -1.025543, 2.720929, 0, 0, 1, 1, 1,
2.119682, -0.2902408, 1.543918, 1, 0, 0, 1, 1,
2.148712, 0.9490767, 1.084235, 1, 0, 0, 1, 1,
2.154152, 1.571299, 0.9384483, 1, 0, 0, 1, 1,
2.178447, 0.02941375, 2.498389, 1, 0, 0, 1, 1,
2.199698, -0.973451, 2.492611, 1, 0, 0, 1, 1,
2.206117, -0.6027391, 1.279694, 0, 0, 0, 1, 1,
2.225496, -2.548483, 1.626048, 0, 0, 0, 1, 1,
2.24832, 0.006876326, -0.1256592, 0, 0, 0, 1, 1,
2.31548, -0.4757296, 1.337996, 0, 0, 0, 1, 1,
2.317037, -0.6086395, 2.977738, 0, 0, 0, 1, 1,
2.45043, -0.154708, 0.7796165, 0, 0, 0, 1, 1,
2.555115, 0.8113633, -0.5646912, 0, 0, 0, 1, 1,
2.628303, -0.4531245, 1.504671, 1, 1, 1, 1, 1,
2.684153, 0.4600797, -0.2078898, 1, 1, 1, 1, 1,
2.808507, -1.200185, 4.609374, 1, 1, 1, 1, 1,
2.845353, 0.8572221, 1.978184, 1, 1, 1, 1, 1,
3.027664, 0.3295116, 0.8398469, 1, 1, 1, 1, 1,
3.067275, -0.5477913, 2.825181, 1, 1, 1, 1, 1,
3.29597, -1.023631, 3.181917, 1, 1, 1, 1, 1
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
var radius = 10.17142;
var distance = 35.72667;
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
mvMatrix.translate( -0.04246235, -0.02305365, 0.7362833 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.72667);
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