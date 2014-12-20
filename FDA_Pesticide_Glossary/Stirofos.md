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
-2.848726, 0.8624097, -1.323498, 1, 0, 0, 1,
-2.806233, -0.676821, -1.907585, 1, 0.007843138, 0, 1,
-2.767309, 0.9931942, -2.089554, 1, 0.01176471, 0, 1,
-2.484659, 1.04163, -2.096718, 1, 0.01960784, 0, 1,
-2.41585, -0.9850495, -2.394864, 1, 0.02352941, 0, 1,
-2.292964, -0.3696809, -2.96771, 1, 0.03137255, 0, 1,
-2.291563, -1.107701, -0.8770375, 1, 0.03529412, 0, 1,
-2.235608, -0.6801787, -1.817735, 1, 0.04313726, 0, 1,
-2.220283, -0.03588347, -0.9463407, 1, 0.04705882, 0, 1,
-2.16768, 0.3397355, -1.601812, 1, 0.05490196, 0, 1,
-2.122154, 1.815181, -1.656605, 1, 0.05882353, 0, 1,
-2.082448, -1.011461, -0.1822096, 1, 0.06666667, 0, 1,
-2.068019, -0.05198029, -1.466731, 1, 0.07058824, 0, 1,
-2.065506, 0.6479739, -1.766438, 1, 0.07843138, 0, 1,
-2.041193, -0.5752931, -1.318637, 1, 0.08235294, 0, 1,
-2.025301, 2.509305, 0.2405505, 1, 0.09019608, 0, 1,
-2.020912, 1.68531, 0.7074357, 1, 0.09411765, 0, 1,
-1.991572, -0.382758, -0.4796053, 1, 0.1019608, 0, 1,
-1.985225, -0.5946755, -0.8307906, 1, 0.1098039, 0, 1,
-1.981542, -0.09426804, -1.201803, 1, 0.1137255, 0, 1,
-1.954829, -0.2549416, -2.950344, 1, 0.1215686, 0, 1,
-1.948551, -0.08709013, -1.178819, 1, 0.1254902, 0, 1,
-1.909378, 0.5861441, -2.749056, 1, 0.1333333, 0, 1,
-1.870932, -0.7436148, -0.8110799, 1, 0.1372549, 0, 1,
-1.850739, 1.135658, -2.338321, 1, 0.145098, 0, 1,
-1.835625, 0.6377125, -2.060358, 1, 0.1490196, 0, 1,
-1.832697, 1.710379, -2.242386, 1, 0.1568628, 0, 1,
-1.789289, -0.6917505, -2.627, 1, 0.1607843, 0, 1,
-1.762929, 0.8767567, -1.508082, 1, 0.1686275, 0, 1,
-1.754849, 0.7251428, -0.8068476, 1, 0.172549, 0, 1,
-1.739665, 1.426597, 0.2431824, 1, 0.1803922, 0, 1,
-1.729034, -0.3098798, -0.6041593, 1, 0.1843137, 0, 1,
-1.727465, -0.3644874, -1.758682, 1, 0.1921569, 0, 1,
-1.71911, 0.6965448, -2.192434, 1, 0.1960784, 0, 1,
-1.692107, 0.894919, -2.03527, 1, 0.2039216, 0, 1,
-1.689641, -1.088523, -1.35919, 1, 0.2117647, 0, 1,
-1.681228, 1.701351, -0.9168971, 1, 0.2156863, 0, 1,
-1.680724, -0.3328176, -1.188936, 1, 0.2235294, 0, 1,
-1.679488, -2.11673, -1.756513, 1, 0.227451, 0, 1,
-1.660665, -0.7281394, -3.238137, 1, 0.2352941, 0, 1,
-1.653371, -0.6467662, -1.763698, 1, 0.2392157, 0, 1,
-1.640721, -1.704628, -1.525933, 1, 0.2470588, 0, 1,
-1.63393, 1.574306, -1.12021, 1, 0.2509804, 0, 1,
-1.621566, 1.562728, -2.598532, 1, 0.2588235, 0, 1,
-1.619838, 1.372378, -1.65642, 1, 0.2627451, 0, 1,
-1.616957, -0.4854645, -0.798314, 1, 0.2705882, 0, 1,
-1.610494, 0.8079283, -0.1839207, 1, 0.2745098, 0, 1,
-1.606647, 0.1852404, -2.762208, 1, 0.282353, 0, 1,
-1.597307, -0.05469992, -1.476683, 1, 0.2862745, 0, 1,
-1.584645, 0.9669924, -1.961531, 1, 0.2941177, 0, 1,
-1.561946, 0.9873829, -0.1782936, 1, 0.3019608, 0, 1,
-1.55496, 0.1213951, -2.174844, 1, 0.3058824, 0, 1,
-1.542776, -1.320306, -2.63684, 1, 0.3137255, 0, 1,
-1.526797, 0.805446, -1.907158, 1, 0.3176471, 0, 1,
-1.524681, -0.8032175, -3.083584, 1, 0.3254902, 0, 1,
-1.51775, 0.4460061, -1.853004, 1, 0.3294118, 0, 1,
-1.51767, -0.4296093, -3.625674, 1, 0.3372549, 0, 1,
-1.513944, -0.5313388, -2.407614, 1, 0.3411765, 0, 1,
-1.493444, -0.1832801, 0.1831389, 1, 0.3490196, 0, 1,
-1.489967, 0.2111364, -1.127747, 1, 0.3529412, 0, 1,
-1.489601, -0.3049344, -0.9085233, 1, 0.3607843, 0, 1,
-1.485236, -0.006920577, -1.891064, 1, 0.3647059, 0, 1,
-1.48141, 0.3291526, -1.692264, 1, 0.372549, 0, 1,
-1.47823, -0.1348923, -1.466385, 1, 0.3764706, 0, 1,
-1.473843, 0.4270092, -0.5294949, 1, 0.3843137, 0, 1,
-1.473419, 0.4508321, -0.5730001, 1, 0.3882353, 0, 1,
-1.460613, 0.7161503, -1.994687, 1, 0.3960784, 0, 1,
-1.457509, -0.7656717, -1.030436, 1, 0.4039216, 0, 1,
-1.446926, -0.6270923, -3.467815, 1, 0.4078431, 0, 1,
-1.416815, 0.4008157, -2.162327, 1, 0.4156863, 0, 1,
-1.409483, -0.7636422, -0.3932551, 1, 0.4196078, 0, 1,
-1.403125, 0.8080719, -0.5884839, 1, 0.427451, 0, 1,
-1.399049, 0.05150128, -0.501222, 1, 0.4313726, 0, 1,
-1.392786, -0.1773844, -2.202086, 1, 0.4392157, 0, 1,
-1.38682, 0.4023143, -2.509744, 1, 0.4431373, 0, 1,
-1.378735, -1.520308, -0.4393202, 1, 0.4509804, 0, 1,
-1.363322, 0.5941392, -0.9012491, 1, 0.454902, 0, 1,
-1.361787, -0.172406, -1.998696, 1, 0.4627451, 0, 1,
-1.358114, 0.7377081, -0.2352291, 1, 0.4666667, 0, 1,
-1.349377, -0.5189239, -2.660461, 1, 0.4745098, 0, 1,
-1.335026, -0.54245, -1.882493, 1, 0.4784314, 0, 1,
-1.334809, -0.2427298, -0.2135451, 1, 0.4862745, 0, 1,
-1.325808, 0.4890825, -1.657454, 1, 0.4901961, 0, 1,
-1.311108, -0.04849265, -0.7144765, 1, 0.4980392, 0, 1,
-1.305857, -0.06045843, -0.9251639, 1, 0.5058824, 0, 1,
-1.302905, -1.585525, -2.5526, 1, 0.509804, 0, 1,
-1.295129, 0.8915796, -0.5528647, 1, 0.5176471, 0, 1,
-1.294195, 0.2594872, -0.4337544, 1, 0.5215687, 0, 1,
-1.274876, 0.8851808, -1.525817, 1, 0.5294118, 0, 1,
-1.272302, 0.9326689, -0.983803, 1, 0.5333334, 0, 1,
-1.271677, -1.411857, -1.851429, 1, 0.5411765, 0, 1,
-1.270374, 0.5381433, -1.203413, 1, 0.5450981, 0, 1,
-1.269998, 0.7914375, 0.04271097, 1, 0.5529412, 0, 1,
-1.268836, 0.2654529, -0.8955756, 1, 0.5568628, 0, 1,
-1.257012, 0.2114607, -1.509752, 1, 0.5647059, 0, 1,
-1.249372, 0.4127696, -1.06816, 1, 0.5686275, 0, 1,
-1.226146, 1.30668, -1.981889, 1, 0.5764706, 0, 1,
-1.221339, 0.5234838, -2.009441, 1, 0.5803922, 0, 1,
-1.213963, 0.2641927, -2.229884, 1, 0.5882353, 0, 1,
-1.207141, -1.67838, -2.832692, 1, 0.5921569, 0, 1,
-1.207136, 1.538909, -0.3150771, 1, 0.6, 0, 1,
-1.176048, -0.8614188, -3.068946, 1, 0.6078432, 0, 1,
-1.17582, -0.9650895, -3.465594, 1, 0.6117647, 0, 1,
-1.175178, -0.0470574, -1.1669, 1, 0.6196079, 0, 1,
-1.160969, 0.05058753, -1.817, 1, 0.6235294, 0, 1,
-1.156055, 1.533689, -1.511127, 1, 0.6313726, 0, 1,
-1.151118, 0.1780663, -0.2042907, 1, 0.6352941, 0, 1,
-1.150437, -0.4349077, -2.737142, 1, 0.6431373, 0, 1,
-1.147844, -2.459818, -2.825333, 1, 0.6470588, 0, 1,
-1.147685, 0.07086261, -1.953671, 1, 0.654902, 0, 1,
-1.145372, -0.02992461, -3.071761, 1, 0.6588235, 0, 1,
-1.136888, 1.048539, -2.180045, 1, 0.6666667, 0, 1,
-1.135761, -3.037272, -2.331698, 1, 0.6705883, 0, 1,
-1.12773, 1.57385, -1.010352, 1, 0.6784314, 0, 1,
-1.125618, 0.1528006, -0.0143605, 1, 0.682353, 0, 1,
-1.124524, 0.7973956, -0.37384, 1, 0.6901961, 0, 1,
-1.113847, -0.1289085, -1.816648, 1, 0.6941177, 0, 1,
-1.112455, 0.9673279, 0.2120026, 1, 0.7019608, 0, 1,
-1.108811, -0.5600957, -4.642139, 1, 0.7098039, 0, 1,
-1.108239, -0.9722847, -2.69281, 1, 0.7137255, 0, 1,
-1.098021, 0.5857965, -0.2576972, 1, 0.7215686, 0, 1,
-1.091012, -1.730428, -2.984614, 1, 0.7254902, 0, 1,
-1.089642, 1.805077, -2.075387, 1, 0.7333333, 0, 1,
-1.087366, 0.8968136, -1.258938, 1, 0.7372549, 0, 1,
-1.072584, -0.02773765, -2.536616, 1, 0.7450981, 0, 1,
-1.072477, 0.005728797, -0.9636461, 1, 0.7490196, 0, 1,
-1.05599, 0.8253694, -1.17599, 1, 0.7568628, 0, 1,
-1.050522, 0.4934761, -1.066812, 1, 0.7607843, 0, 1,
-1.049442, 0.7463329, -0.5377727, 1, 0.7686275, 0, 1,
-1.043803, -1.28422, -0.6650611, 1, 0.772549, 0, 1,
-1.041658, -0.7157509, -2.393437, 1, 0.7803922, 0, 1,
-1.039819, -0.2602254, -2.111648, 1, 0.7843137, 0, 1,
-1.035447, -0.08438919, -2.890814, 1, 0.7921569, 0, 1,
-1.027643, 0.4311778, 0.8237296, 1, 0.7960784, 0, 1,
-1.026776, 0.3465834, -1.210842, 1, 0.8039216, 0, 1,
-1.026425, -0.2283321, -1.704141, 1, 0.8117647, 0, 1,
-1.019886, 1.912381, 0.876358, 1, 0.8156863, 0, 1,
-1.016202, -1.324971, -2.265522, 1, 0.8235294, 0, 1,
-1.010775, -0.05656896, -0.1498355, 1, 0.827451, 0, 1,
-0.9975438, 0.9999912, -1.944591, 1, 0.8352941, 0, 1,
-0.9828848, -0.9296426, -2.252487, 1, 0.8392157, 0, 1,
-0.9793288, -1.240613, -2.889669, 1, 0.8470588, 0, 1,
-0.9785137, -1.245884, -2.599976, 1, 0.8509804, 0, 1,
-0.9741018, 0.876128, 0.3342409, 1, 0.8588235, 0, 1,
-0.963266, 0.2204193, -2.433161, 1, 0.8627451, 0, 1,
-0.9608699, 0.4727057, -2.288897, 1, 0.8705882, 0, 1,
-0.9599497, -0.1228283, -1.437823, 1, 0.8745098, 0, 1,
-0.9584031, 0.2609169, -0.2556261, 1, 0.8823529, 0, 1,
-0.9542494, 1.03748, 0.05128635, 1, 0.8862745, 0, 1,
-0.9487482, -0.3216277, -2.697109, 1, 0.8941177, 0, 1,
-0.9408945, -1.105241, -2.383641, 1, 0.8980392, 0, 1,
-0.9399865, 1.221888, -1.549189, 1, 0.9058824, 0, 1,
-0.9394307, -1.847516, -1.733277, 1, 0.9137255, 0, 1,
-0.9381385, -1.278645, -3.058035, 1, 0.9176471, 0, 1,
-0.9380815, -0.1873826, -1.991567, 1, 0.9254902, 0, 1,
-0.9298032, 0.5103043, -1.466766, 1, 0.9294118, 0, 1,
-0.9250431, 2.252258, -1.434615, 1, 0.9372549, 0, 1,
-0.9182159, -0.2502277, -0.6331261, 1, 0.9411765, 0, 1,
-0.9120717, 0.525661, -1.858539, 1, 0.9490196, 0, 1,
-0.9098298, -0.9540877, -1.557374, 1, 0.9529412, 0, 1,
-0.9028925, -0.01539914, -1.766222, 1, 0.9607843, 0, 1,
-0.9005368, 1.455087, -0.2662771, 1, 0.9647059, 0, 1,
-0.8992391, 0.04398542, -0.6896755, 1, 0.972549, 0, 1,
-0.893477, -0.01038882, -1.870642, 1, 0.9764706, 0, 1,
-0.8924106, -0.1144465, -2.143282, 1, 0.9843137, 0, 1,
-0.8909305, -0.4930982, -2.624333, 1, 0.9882353, 0, 1,
-0.8892104, 0.2586561, -2.749653, 1, 0.9960784, 0, 1,
-0.8891293, 0.7096097, -1.842818, 0.9960784, 1, 0, 1,
-0.88866, 0.929238, -1.084089, 0.9921569, 1, 0, 1,
-0.8743145, -0.1887584, -1.804094, 0.9843137, 1, 0, 1,
-0.873316, 1.878485, 1.445953, 0.9803922, 1, 0, 1,
-0.869978, 0.803173, -0.9158514, 0.972549, 1, 0, 1,
-0.866004, 1.013088, -1.565095, 0.9686275, 1, 0, 1,
-0.8641613, -0.3576863, -2.132208, 0.9607843, 1, 0, 1,
-0.86178, 0.2638538, -2.614901, 0.9568627, 1, 0, 1,
-0.8505657, -1.669386, -2.724852, 0.9490196, 1, 0, 1,
-0.8426256, -0.8563445, -1.20552, 0.945098, 1, 0, 1,
-0.842568, -0.4011534, -2.391662, 0.9372549, 1, 0, 1,
-0.8250245, -0.4261997, -1.771619, 0.9333333, 1, 0, 1,
-0.8241296, 0.4941948, -0.4105872, 0.9254902, 1, 0, 1,
-0.8230196, -0.3539444, -2.171979, 0.9215686, 1, 0, 1,
-0.8168781, -0.7295229, -1.345612, 0.9137255, 1, 0, 1,
-0.8043808, 0.5140617, 1.438751, 0.9098039, 1, 0, 1,
-0.8043197, 1.31351, -0.3064499, 0.9019608, 1, 0, 1,
-0.802185, 0.6110184, -0.7001492, 0.8941177, 1, 0, 1,
-0.8005996, -0.4748084, -3.811556, 0.8901961, 1, 0, 1,
-0.8001543, 1.266889, -0.5416813, 0.8823529, 1, 0, 1,
-0.7990378, -1.104383, -2.416283, 0.8784314, 1, 0, 1,
-0.7920561, 0.1789411, -1.21456, 0.8705882, 1, 0, 1,
-0.791231, 0.7643404, 0.7298303, 0.8666667, 1, 0, 1,
-0.7904198, -1.798893, -3.790599, 0.8588235, 1, 0, 1,
-0.7892848, -1.916235, -2.722948, 0.854902, 1, 0, 1,
-0.7880833, -1.790172, -3.044295, 0.8470588, 1, 0, 1,
-0.7802534, 0.3007933, -2.17209, 0.8431373, 1, 0, 1,
-0.7800695, 0.7416008, -3.008732, 0.8352941, 1, 0, 1,
-0.7733154, 0.3231967, -1.676777, 0.8313726, 1, 0, 1,
-0.7722613, -1.176134, -3.025075, 0.8235294, 1, 0, 1,
-0.7713005, -0.918654, -3.9328, 0.8196079, 1, 0, 1,
-0.7707192, -2.536011, -4.038558, 0.8117647, 1, 0, 1,
-0.7671599, 0.828687, -0.1334721, 0.8078431, 1, 0, 1,
-0.7648668, -0.8515588, -2.685511, 0.8, 1, 0, 1,
-0.762969, 0.06811143, -0.875781, 0.7921569, 1, 0, 1,
-0.7576167, -0.6226672, 0.05200199, 0.7882353, 1, 0, 1,
-0.7551123, -1.274504, -2.177632, 0.7803922, 1, 0, 1,
-0.7471595, -2.003003, -3.169635, 0.7764706, 1, 0, 1,
-0.7368472, -0.09256439, 0.07359547, 0.7686275, 1, 0, 1,
-0.7365724, -0.3278673, -0.8373704, 0.7647059, 1, 0, 1,
-0.7259773, 0.4031967, -1.606578, 0.7568628, 1, 0, 1,
-0.7246242, -0.9200398, -1.063016, 0.7529412, 1, 0, 1,
-0.7235379, 1.010349, -0.2920419, 0.7450981, 1, 0, 1,
-0.7211028, 0.03488891, -3.564766, 0.7411765, 1, 0, 1,
-0.7188681, 0.4809822, -0.4218832, 0.7333333, 1, 0, 1,
-0.7133498, -0.735375, -2.167715, 0.7294118, 1, 0, 1,
-0.7120084, 0.1225895, 0.02092995, 0.7215686, 1, 0, 1,
-0.705514, 0.9567457, -1.456207, 0.7176471, 1, 0, 1,
-0.7020903, 1.44178, -0.1623227, 0.7098039, 1, 0, 1,
-0.7013506, -1.133123, -1.26816, 0.7058824, 1, 0, 1,
-0.6967406, 0.2678628, -1.587422, 0.6980392, 1, 0, 1,
-0.6959384, -0.9330968, -2.945469, 0.6901961, 1, 0, 1,
-0.6958809, -0.3437985, -2.135831, 0.6862745, 1, 0, 1,
-0.6878151, -0.2872981, -3.695027, 0.6784314, 1, 0, 1,
-0.6797357, -0.7330434, -5.466887, 0.6745098, 1, 0, 1,
-0.6788487, 0.007015373, -1.452167, 0.6666667, 1, 0, 1,
-0.6766596, 0.63932, -0.2974893, 0.6627451, 1, 0, 1,
-0.6735958, -0.2822057, -2.548731, 0.654902, 1, 0, 1,
-0.6732658, 1.249699, -1.001079, 0.6509804, 1, 0, 1,
-0.6673821, -1.069554, -2.0973, 0.6431373, 1, 0, 1,
-0.6659364, 0.2237134, -0.9986615, 0.6392157, 1, 0, 1,
-0.6645554, 0.5423697, -2.550472, 0.6313726, 1, 0, 1,
-0.6505494, 1.310985, -1.430899, 0.627451, 1, 0, 1,
-0.6501855, 0.5669284, 0.02609354, 0.6196079, 1, 0, 1,
-0.6473926, 0.5881658, 0.1365826, 0.6156863, 1, 0, 1,
-0.6468223, 1.229484, -0.5929553, 0.6078432, 1, 0, 1,
-0.6428993, 0.3462886, -0.7659515, 0.6039216, 1, 0, 1,
-0.641001, -0.147096, -0.06232195, 0.5960785, 1, 0, 1,
-0.6399686, 0.5456725, -1.385193, 0.5882353, 1, 0, 1,
-0.6372223, 0.1231901, -2.985294, 0.5843138, 1, 0, 1,
-0.6364307, -1.34354, -3.656049, 0.5764706, 1, 0, 1,
-0.6353368, 0.09885757, -2.180946, 0.572549, 1, 0, 1,
-0.6337201, -0.4789118, -1.868596, 0.5647059, 1, 0, 1,
-0.6330704, 2.708697, 0.9709849, 0.5607843, 1, 0, 1,
-0.632941, -0.6390342, -2.820512, 0.5529412, 1, 0, 1,
-0.6314863, -0.04717365, -1.413377, 0.5490196, 1, 0, 1,
-0.6299553, -1.353099, -3.189118, 0.5411765, 1, 0, 1,
-0.6295477, 0.3729746, 0.1358751, 0.5372549, 1, 0, 1,
-0.628249, 0.9826465, 0.184806, 0.5294118, 1, 0, 1,
-0.6277223, -1.1969, -1.546984, 0.5254902, 1, 0, 1,
-0.6275615, -1.922791, -4.191157, 0.5176471, 1, 0, 1,
-0.6233259, -0.761004, -2.545535, 0.5137255, 1, 0, 1,
-0.6212576, -0.1316706, -2.773, 0.5058824, 1, 0, 1,
-0.6200075, -1.883142, -2.191658, 0.5019608, 1, 0, 1,
-0.6194412, 0.6982878, -1.861196, 0.4941176, 1, 0, 1,
-0.6193222, -0.4174591, -2.380117, 0.4862745, 1, 0, 1,
-0.6182578, 0.4727191, -1.702199, 0.4823529, 1, 0, 1,
-0.617599, -0.2523341, -3.319086, 0.4745098, 1, 0, 1,
-0.6108531, -0.4537441, -1.024803, 0.4705882, 1, 0, 1,
-0.6102272, 1.820421, -0.3109343, 0.4627451, 1, 0, 1,
-0.600478, -1.594675, -3.712081, 0.4588235, 1, 0, 1,
-0.5998145, 0.5012487, -0.9858882, 0.4509804, 1, 0, 1,
-0.5990504, 1.198515, 0.3445006, 0.4470588, 1, 0, 1,
-0.5940081, 0.3425879, -1.799316, 0.4392157, 1, 0, 1,
-0.5914934, 1.624764, -0.6075594, 0.4352941, 1, 0, 1,
-0.5910311, 0.7053061, -1.092118, 0.427451, 1, 0, 1,
-0.5896056, -0.4809063, -3.241566, 0.4235294, 1, 0, 1,
-0.5873431, 0.3261282, -1.760321, 0.4156863, 1, 0, 1,
-0.5859572, 0.6973481, -0.2559159, 0.4117647, 1, 0, 1,
-0.5842429, 0.1132057, -1.217581, 0.4039216, 1, 0, 1,
-0.5814376, -0.4019615, -0.07245719, 0.3960784, 1, 0, 1,
-0.5768036, -0.6617908, -1.375384, 0.3921569, 1, 0, 1,
-0.5734794, 0.6246061, -0.7834272, 0.3843137, 1, 0, 1,
-0.5696163, -1.911952, -3.040926, 0.3803922, 1, 0, 1,
-0.5637732, -1.019897, -2.163626, 0.372549, 1, 0, 1,
-0.5610154, -0.4706711, -2.339348, 0.3686275, 1, 0, 1,
-0.5569624, 0.1491922, -2.585205, 0.3607843, 1, 0, 1,
-0.5562249, 0.8915446, -1.217753, 0.3568628, 1, 0, 1,
-0.5561073, -0.6782452, -1.884014, 0.3490196, 1, 0, 1,
-0.5537238, 1.154653, -1.638312, 0.345098, 1, 0, 1,
-0.5535155, -0.2023722, -3.324132, 0.3372549, 1, 0, 1,
-0.5494769, 2.174172, -1.153751, 0.3333333, 1, 0, 1,
-0.5456371, 1.58739, 0.3732934, 0.3254902, 1, 0, 1,
-0.5434009, 1.29598, -0.1956666, 0.3215686, 1, 0, 1,
-0.5427734, -2.309886, -4.833826, 0.3137255, 1, 0, 1,
-0.5421177, 0.895694, -0.5745549, 0.3098039, 1, 0, 1,
-0.5408701, 0.5279257, 0.7824037, 0.3019608, 1, 0, 1,
-0.5393009, 1.225918, -2.726069, 0.2941177, 1, 0, 1,
-0.535298, -0.8106983, -3.507974, 0.2901961, 1, 0, 1,
-0.5344723, 1.289553, 0.4653823, 0.282353, 1, 0, 1,
-0.5216824, 1.757968, -0.8892764, 0.2784314, 1, 0, 1,
-0.5149112, 0.2379419, -1.763139, 0.2705882, 1, 0, 1,
-0.5147898, -0.0290259, -2.790328, 0.2666667, 1, 0, 1,
-0.5142613, -1.407807, -6.151221, 0.2588235, 1, 0, 1,
-0.5131599, 0.4617266, -2.275443, 0.254902, 1, 0, 1,
-0.5097513, -0.5884994, -2.265859, 0.2470588, 1, 0, 1,
-0.5066747, 1.362561, -2.116867, 0.2431373, 1, 0, 1,
-0.505767, 0.8490735, -0.3385836, 0.2352941, 1, 0, 1,
-0.5011727, -0.1557978, -0.8065408, 0.2313726, 1, 0, 1,
-0.4975954, 0.1023264, -2.230597, 0.2235294, 1, 0, 1,
-0.4894124, -0.8648428, -3.217017, 0.2196078, 1, 0, 1,
-0.488839, 0.3112765, -0.7661155, 0.2117647, 1, 0, 1,
-0.4860703, 0.1526168, -0.1277404, 0.2078431, 1, 0, 1,
-0.4818558, 0.1905183, -0.1837722, 0.2, 1, 0, 1,
-0.4813254, -0.3577852, -3.093697, 0.1921569, 1, 0, 1,
-0.476207, -0.4097126, -1.667132, 0.1882353, 1, 0, 1,
-0.4762009, 2.098479, 0.35943, 0.1803922, 1, 0, 1,
-0.4747124, -1.574795, -2.041426, 0.1764706, 1, 0, 1,
-0.4708846, 0.6899211, 0.8085755, 0.1686275, 1, 0, 1,
-0.4693229, 0.2218538, -1.320115, 0.1647059, 1, 0, 1,
-0.4666918, 1.511151, -0.5281969, 0.1568628, 1, 0, 1,
-0.464723, -0.7388204, -2.885126, 0.1529412, 1, 0, 1,
-0.4633556, 2.244625, 0.6124349, 0.145098, 1, 0, 1,
-0.4628195, -0.01520968, -2.031822, 0.1411765, 1, 0, 1,
-0.4583534, -0.08852813, -2.100817, 0.1333333, 1, 0, 1,
-0.4533393, 1.195636, -0.2665625, 0.1294118, 1, 0, 1,
-0.4473604, -1.442248, -2.631546, 0.1215686, 1, 0, 1,
-0.4469315, -0.641289, -2.266072, 0.1176471, 1, 0, 1,
-0.4457196, -0.08405732, -0.788458, 0.1098039, 1, 0, 1,
-0.4431818, 0.6232358, -0.7262799, 0.1058824, 1, 0, 1,
-0.4401985, 1.557076, -1.68551, 0.09803922, 1, 0, 1,
-0.4278639, -1.203266, -2.857495, 0.09019608, 1, 0, 1,
-0.42205, -0.5775145, -0.8491123, 0.08627451, 1, 0, 1,
-0.4187739, -1.187793, -2.003645, 0.07843138, 1, 0, 1,
-0.4163526, 0.7476934, -0.7640948, 0.07450981, 1, 0, 1,
-0.4152653, 0.4620971, -2.263755, 0.06666667, 1, 0, 1,
-0.4148691, 0.08374717, -2.132244, 0.0627451, 1, 0, 1,
-0.4134779, -1.206143, -3.51512, 0.05490196, 1, 0, 1,
-0.4133308, -0.2969396, -1.767268, 0.05098039, 1, 0, 1,
-0.4081442, 0.9624442, 0.9431855, 0.04313726, 1, 0, 1,
-0.4081159, -1.68732, -1.849, 0.03921569, 1, 0, 1,
-0.404218, -0.5719906, -2.9123, 0.03137255, 1, 0, 1,
-0.3994445, 0.9307016, -2.720265, 0.02745098, 1, 0, 1,
-0.3967433, 1.05498, 1.505501, 0.01960784, 1, 0, 1,
-0.3951659, -1.282395, -3.556393, 0.01568628, 1, 0, 1,
-0.3946603, -0.4383804, -2.622068, 0.007843138, 1, 0, 1,
-0.3860639, 0.3390786, -0.2606449, 0.003921569, 1, 0, 1,
-0.3793168, 0.9267737, -0.9956962, 0, 1, 0.003921569, 1,
-0.3785444, 0.03104499, -1.32609, 0, 1, 0.01176471, 1,
-0.3785051, 0.8789027, 1.304269, 0, 1, 0.01568628, 1,
-0.378272, 0.597814, -1.201775, 0, 1, 0.02352941, 1,
-0.3727886, 1.260518, -0.4141212, 0, 1, 0.02745098, 1,
-0.3714132, 0.5764101, 0.750297, 0, 1, 0.03529412, 1,
-0.3706195, -0.1128747, -3.029984, 0, 1, 0.03921569, 1,
-0.3695722, -2.672602, -2.685789, 0, 1, 0.04705882, 1,
-0.3628971, -1.380011, -1.303327, 0, 1, 0.05098039, 1,
-0.3623988, 0.1647642, -1.949485, 0, 1, 0.05882353, 1,
-0.3611669, 1.661175, 0.4808477, 0, 1, 0.0627451, 1,
-0.3605421, 0.7072471, -0.04348243, 0, 1, 0.07058824, 1,
-0.358214, -1.376451, -1.797803, 0, 1, 0.07450981, 1,
-0.3489547, 1.005567, -1.781744, 0, 1, 0.08235294, 1,
-0.3489133, -0.1758146, -0.182224, 0, 1, 0.08627451, 1,
-0.3485578, 1.097815, 0.6115443, 0, 1, 0.09411765, 1,
-0.3471154, -0.002121445, -0.9470541, 0, 1, 0.1019608, 1,
-0.3456706, -0.6673386, -2.129757, 0, 1, 0.1058824, 1,
-0.3432038, -0.278437, -0.3337375, 0, 1, 0.1137255, 1,
-0.3418772, 0.2243679, -2.119023, 0, 1, 0.1176471, 1,
-0.3402042, -1.082537, -3.638125, 0, 1, 0.1254902, 1,
-0.3382304, 0.4631375, 1.186167, 0, 1, 0.1294118, 1,
-0.3369129, -1.582824, -3.570909, 0, 1, 0.1372549, 1,
-0.3343429, -1.796341, -2.158504, 0, 1, 0.1411765, 1,
-0.3318889, -0.05762057, -1.020732, 0, 1, 0.1490196, 1,
-0.3276119, -0.4950325, -3.396857, 0, 1, 0.1529412, 1,
-0.3269989, 0.64562, -0.9813538, 0, 1, 0.1607843, 1,
-0.3243147, 0.2839116, -2.279806, 0, 1, 0.1647059, 1,
-0.3242603, 0.3998921, -1.703584, 0, 1, 0.172549, 1,
-0.3237712, 1.627745, -0.5687904, 0, 1, 0.1764706, 1,
-0.3223405, -2.253492, -2.378235, 0, 1, 0.1843137, 1,
-0.3222354, 1.262396, -1.101397, 0, 1, 0.1882353, 1,
-0.3208891, -0.1025851, -1.347833, 0, 1, 0.1960784, 1,
-0.3181877, -0.593853, -2.059285, 0, 1, 0.2039216, 1,
-0.3129078, -1.210175, -2.255564, 0, 1, 0.2078431, 1,
-0.3109507, -0.8591951, -4.35176, 0, 1, 0.2156863, 1,
-0.3095298, 0.7346298, -1.643176, 0, 1, 0.2196078, 1,
-0.3060388, 2.110883, -0.3881524, 0, 1, 0.227451, 1,
-0.3052728, 0.09746282, -0.7619613, 0, 1, 0.2313726, 1,
-0.2989153, 1.256192, -0.2760708, 0, 1, 0.2392157, 1,
-0.298605, -0.4961024, -1.329943, 0, 1, 0.2431373, 1,
-0.2975876, 0.4736691, -1.756318, 0, 1, 0.2509804, 1,
-0.2938654, 0.6146474, 0.9154559, 0, 1, 0.254902, 1,
-0.2938243, 0.9319746, 0.9120066, 0, 1, 0.2627451, 1,
-0.2930217, -0.6937546, -0.5821322, 0, 1, 0.2666667, 1,
-0.2898891, 0.223407, -1.353437, 0, 1, 0.2745098, 1,
-0.2874064, 1.198965, 0.5012116, 0, 1, 0.2784314, 1,
-0.2853741, 0.5522245, 0.2211079, 0, 1, 0.2862745, 1,
-0.2794472, 1.934971, 1.395787, 0, 1, 0.2901961, 1,
-0.2783097, -0.7887474, -3.118947, 0, 1, 0.2980392, 1,
-0.2778456, -0.6971581, -4.216506, 0, 1, 0.3058824, 1,
-0.2762402, -1.207681, -2.596082, 0, 1, 0.3098039, 1,
-0.2741003, -1.288402, -1.239845, 0, 1, 0.3176471, 1,
-0.2714164, -1.759707, -2.979154, 0, 1, 0.3215686, 1,
-0.2706193, 1.229278, 1.100555, 0, 1, 0.3294118, 1,
-0.2693704, -0.6988803, -4.104104, 0, 1, 0.3333333, 1,
-0.2664934, -1.39077, -2.929962, 0, 1, 0.3411765, 1,
-0.2590894, 0.9688663, -0.3563406, 0, 1, 0.345098, 1,
-0.2570157, 1.645422, -0.8828189, 0, 1, 0.3529412, 1,
-0.2532248, 0.5254298, -1.850946, 0, 1, 0.3568628, 1,
-0.2525186, 0.1638391, -1.384215, 0, 1, 0.3647059, 1,
-0.2473344, 0.9993812, 0.1011876, 0, 1, 0.3686275, 1,
-0.2470228, 0.1338997, -1.216325, 0, 1, 0.3764706, 1,
-0.2462926, -0.4004348, -1.608551, 0, 1, 0.3803922, 1,
-0.2378698, -0.5611519, -3.002548, 0, 1, 0.3882353, 1,
-0.2349179, 1.996599, -0.6042376, 0, 1, 0.3921569, 1,
-0.2318851, -0.09092744, -1.827884, 0, 1, 0.4, 1,
-0.2291926, 0.6131316, 0.05162701, 0, 1, 0.4078431, 1,
-0.2248773, -0.9461167, -1.181196, 0, 1, 0.4117647, 1,
-0.2242858, -0.8417072, -4.398241, 0, 1, 0.4196078, 1,
-0.2170979, -0.5404566, -3.7328, 0, 1, 0.4235294, 1,
-0.2161623, 0.8781143, 0.8451428, 0, 1, 0.4313726, 1,
-0.2152531, -1.610226, -1.828032, 0, 1, 0.4352941, 1,
-0.2126343, 0.3154616, -1.261398, 0, 1, 0.4431373, 1,
-0.2116336, 0.7276617, 0.6599689, 0, 1, 0.4470588, 1,
-0.209425, -0.7197024, -4.091233, 0, 1, 0.454902, 1,
-0.2092287, 0.4214208, -2.225496, 0, 1, 0.4588235, 1,
-0.2089566, 1.891343, 0.02905307, 0, 1, 0.4666667, 1,
-0.2017169, -1.319928, -2.726396, 0, 1, 0.4705882, 1,
-0.1935018, -1.873092, -4.211799, 0, 1, 0.4784314, 1,
-0.1893671, 1.347929, -1.790074, 0, 1, 0.4823529, 1,
-0.188566, -0.2694714, -3.578379, 0, 1, 0.4901961, 1,
-0.1884207, 0.5224882, -1.085252, 0, 1, 0.4941176, 1,
-0.1869062, 0.7821987, -2.52645, 0, 1, 0.5019608, 1,
-0.1840248, 1.194199, -0.03498416, 0, 1, 0.509804, 1,
-0.180666, 0.2444951, -1.636179, 0, 1, 0.5137255, 1,
-0.1792474, -2.744559, -1.89043, 0, 1, 0.5215687, 1,
-0.1786771, 1.014403, -0.4665653, 0, 1, 0.5254902, 1,
-0.1783806, 0.7628044, 0.04138829, 0, 1, 0.5333334, 1,
-0.1750992, 1.005886, -0.5094211, 0, 1, 0.5372549, 1,
-0.1724468, -0.4610953, -1.885204, 0, 1, 0.5450981, 1,
-0.1702392, 0.6393917, -0.9802994, 0, 1, 0.5490196, 1,
-0.1686998, -0.202669, -1.382403, 0, 1, 0.5568628, 1,
-0.1638353, 0.7703905, 1.576826, 0, 1, 0.5607843, 1,
-0.159995, -1.217157, -1.783136, 0, 1, 0.5686275, 1,
-0.1596385, 1.243042, 0.799941, 0, 1, 0.572549, 1,
-0.1545134, -0.9268743, -1.110483, 0, 1, 0.5803922, 1,
-0.1515506, -0.8248346, -1.301376, 0, 1, 0.5843138, 1,
-0.1499873, 0.2511849, -0.6584101, 0, 1, 0.5921569, 1,
-0.1438282, 0.2145755, -1.216152, 0, 1, 0.5960785, 1,
-0.1435892, -1.213067, -0.6272247, 0, 1, 0.6039216, 1,
-0.1415934, 1.344141, -0.6746253, 0, 1, 0.6117647, 1,
-0.13532, -1.912297, -4.29477, 0, 1, 0.6156863, 1,
-0.1342448, 0.8751341, -0.5613726, 0, 1, 0.6235294, 1,
-0.1319339, 0.6613378, -1.038179, 0, 1, 0.627451, 1,
-0.1289534, -1.305116, -1.41451, 0, 1, 0.6352941, 1,
-0.1281582, 0.1442494, -0.02473893, 0, 1, 0.6392157, 1,
-0.116309, -0.370899, -4.300368, 0, 1, 0.6470588, 1,
-0.1093462, -1.12899, -2.232919, 0, 1, 0.6509804, 1,
-0.107663, -0.483562, -5.438238, 0, 1, 0.6588235, 1,
-0.1065163, -1.626903, -2.093216, 0, 1, 0.6627451, 1,
-0.1061266, -0.867348, -4.370359, 0, 1, 0.6705883, 1,
-0.1038389, 0.4586907, -0.4632063, 0, 1, 0.6745098, 1,
-0.1035071, -0.2795386, -3.188495, 0, 1, 0.682353, 1,
-0.1027723, 0.1999011, 0.5616541, 0, 1, 0.6862745, 1,
-0.1023457, 0.4600354, 0.6124073, 0, 1, 0.6941177, 1,
-0.09746407, 0.05600439, -1.793218, 0, 1, 0.7019608, 1,
-0.093393, -1.615365, -2.843528, 0, 1, 0.7058824, 1,
-0.0924596, -1.361717, -2.380018, 0, 1, 0.7137255, 1,
-0.09174138, 0.4029115, 0.5677822, 0, 1, 0.7176471, 1,
-0.08936606, 0.2720305, 0.2805547, 0, 1, 0.7254902, 1,
-0.08900764, -1.203171, -3.763664, 0, 1, 0.7294118, 1,
-0.08193097, -0.1587567, -2.290001, 0, 1, 0.7372549, 1,
-0.07838279, -0.2336682, -2.375079, 0, 1, 0.7411765, 1,
-0.07698999, -2.271977, -2.077786, 0, 1, 0.7490196, 1,
-0.07513082, 0.4438076, -1.15688, 0, 1, 0.7529412, 1,
-0.07132376, 0.6694146, 0.2243145, 0, 1, 0.7607843, 1,
-0.06869122, 1.395492, 0.9160845, 0, 1, 0.7647059, 1,
-0.0644834, -0.1709523, -2.982188, 0, 1, 0.772549, 1,
-0.05220513, -0.6175197, -3.533026, 0, 1, 0.7764706, 1,
-0.05030369, -1.029761, -1.543223, 0, 1, 0.7843137, 1,
-0.04951933, 0.4159094, -1.294311, 0, 1, 0.7882353, 1,
-0.04688992, -1.81312, -4.093093, 0, 1, 0.7960784, 1,
-0.04279735, -2.897185, -3.528531, 0, 1, 0.8039216, 1,
-0.04239593, -1.047333, -4.763594, 0, 1, 0.8078431, 1,
-0.04112698, -1.520113, -2.234637, 0, 1, 0.8156863, 1,
-0.03998972, 1.319528, 0.8117151, 0, 1, 0.8196079, 1,
-0.03959334, -0.0001715874, -0.9563437, 0, 1, 0.827451, 1,
-0.03922804, -0.2643164, -1.409451, 0, 1, 0.8313726, 1,
-0.03706357, 0.6243187, -0.3361814, 0, 1, 0.8392157, 1,
-0.03232845, -0.1446094, -2.463179, 0, 1, 0.8431373, 1,
-0.02446887, 0.2472442, -0.7938273, 0, 1, 0.8509804, 1,
-0.02101091, 0.8194203, -0.4078994, 0, 1, 0.854902, 1,
-0.01874472, 0.5265477, 1.67356, 0, 1, 0.8627451, 1,
-0.01655582, 1.958287, 2.282689, 0, 1, 0.8666667, 1,
-0.01165831, 0.1824896, 0.2353426, 0, 1, 0.8745098, 1,
-0.009820178, 0.7361851, 0.1802867, 0, 1, 0.8784314, 1,
-0.007977426, -0.4156222, -4.978451, 0, 1, 0.8862745, 1,
-0.006345131, -1.803958, -2.422473, 0, 1, 0.8901961, 1,
-0.004953129, 0.4320055, -1.179908, 0, 1, 0.8980392, 1,
-0.002628079, 0.1660294, 1.762459, 0, 1, 0.9058824, 1,
0.005507313, -0.003114845, 0.727365, 0, 1, 0.9098039, 1,
0.006101604, -0.8083329, 4.385885, 0, 1, 0.9176471, 1,
0.007698332, 0.222366, 0.3129433, 0, 1, 0.9215686, 1,
0.007932237, -0.01962153, 3.010687, 0, 1, 0.9294118, 1,
0.01284152, 0.6839643, -0.3106056, 0, 1, 0.9333333, 1,
0.01609841, 1.889762, 0.5033392, 0, 1, 0.9411765, 1,
0.0210444, 0.4375555, -0.7520676, 0, 1, 0.945098, 1,
0.02113947, 0.9906498, 1.427204, 0, 1, 0.9529412, 1,
0.02748267, -0.4918176, 1.980922, 0, 1, 0.9568627, 1,
0.02895739, -0.2294062, 1.175951, 0, 1, 0.9647059, 1,
0.04194517, 1.242574, -0.2729918, 0, 1, 0.9686275, 1,
0.04336293, 0.8539761, -0.1555453, 0, 1, 0.9764706, 1,
0.04552232, -0.4361856, 3.410447, 0, 1, 0.9803922, 1,
0.05041251, -1.929269, 4.30826, 0, 1, 0.9882353, 1,
0.05085902, -1.681752, 4.058048, 0, 1, 0.9921569, 1,
0.05132556, 0.08746231, 0.5881446, 0, 1, 1, 1,
0.05364908, -0.6800867, 3.392121, 0, 0.9921569, 1, 1,
0.05625104, 0.6195518, -0.940302, 0, 0.9882353, 1, 1,
0.05943581, 1.471955, -0.3212509, 0, 0.9803922, 1, 1,
0.05955382, -0.8199738, 4.649785, 0, 0.9764706, 1, 1,
0.06080353, -0.09431583, 2.103599, 0, 0.9686275, 1, 1,
0.06190126, 1.497984, 0.3755566, 0, 0.9647059, 1, 1,
0.06861739, 0.4077983, 0.1634393, 0, 0.9568627, 1, 1,
0.07192077, 0.3458901, 0.6318964, 0, 0.9529412, 1, 1,
0.07236449, -0.06302976, 5.072093, 0, 0.945098, 1, 1,
0.07343803, 0.15632, 1.730646, 0, 0.9411765, 1, 1,
0.07408989, 0.8283616, -0.08291721, 0, 0.9333333, 1, 1,
0.07582648, -0.5000792, 4.096481, 0, 0.9294118, 1, 1,
0.0760477, -0.8701408, 3.588208, 0, 0.9215686, 1, 1,
0.07801712, 1.871553, -1.250889, 0, 0.9176471, 1, 1,
0.07973034, -0.8541986, 2.487175, 0, 0.9098039, 1, 1,
0.08088559, -0.7384998, 1.586114, 0, 0.9058824, 1, 1,
0.08120951, 1.444831, 0.2511609, 0, 0.8980392, 1, 1,
0.08477233, -0.6175148, 4.212844, 0, 0.8901961, 1, 1,
0.08951586, 2.379775, -0.6285005, 0, 0.8862745, 1, 1,
0.09040684, 0.1913579, -1.070225, 0, 0.8784314, 1, 1,
0.09371928, -0.8036991, 2.955174, 0, 0.8745098, 1, 1,
0.09373356, 0.4624524, 0.1453548, 0, 0.8666667, 1, 1,
0.09892962, -1.131911, 3.401377, 0, 0.8627451, 1, 1,
0.0997467, 0.5619701, -0.1575357, 0, 0.854902, 1, 1,
0.1067371, 0.05935155, 0.8342611, 0, 0.8509804, 1, 1,
0.1109549, 0.1190381, 1.331711, 0, 0.8431373, 1, 1,
0.1135992, -0.4187479, 3.551819, 0, 0.8392157, 1, 1,
0.1275599, -0.6839797, 2.747174, 0, 0.8313726, 1, 1,
0.1284442, 0.2183348, 0.2660258, 0, 0.827451, 1, 1,
0.1338742, -0.3064028, 3.423346, 0, 0.8196079, 1, 1,
0.1371301, 0.3657041, 0.7591318, 0, 0.8156863, 1, 1,
0.1371589, -0.03320473, 1.97696, 0, 0.8078431, 1, 1,
0.1453238, 0.2782468, -1.043471, 0, 0.8039216, 1, 1,
0.1473204, -1.344059, 2.587462, 0, 0.7960784, 1, 1,
0.1500808, 0.5195979, 1.67587, 0, 0.7882353, 1, 1,
0.1607289, 2.580955, -0.2613052, 0, 0.7843137, 1, 1,
0.163765, -0.1719116, 4.282867, 0, 0.7764706, 1, 1,
0.1656265, -0.0591845, 1.021925, 0, 0.772549, 1, 1,
0.1679122, 1.620175, 0.8901375, 0, 0.7647059, 1, 1,
0.1687829, 1.46548, -0.9226592, 0, 0.7607843, 1, 1,
0.1716352, 1.760988, 0.1499384, 0, 0.7529412, 1, 1,
0.1717275, 0.3422127, -0.5009008, 0, 0.7490196, 1, 1,
0.1723541, 0.1873913, -0.0327196, 0, 0.7411765, 1, 1,
0.1731303, 0.2052333, 0.4032247, 0, 0.7372549, 1, 1,
0.1738991, 0.250537, 0.1429474, 0, 0.7294118, 1, 1,
0.1784005, -0.7628577, 2.657619, 0, 0.7254902, 1, 1,
0.1801424, -0.3761214, 1.661433, 0, 0.7176471, 1, 1,
0.1808086, -2.020498, 3.485437, 0, 0.7137255, 1, 1,
0.1883811, 0.482228, -0.634132, 0, 0.7058824, 1, 1,
0.1884261, 0.4288226, 1.611309, 0, 0.6980392, 1, 1,
0.1889379, 0.5271976, -1.627017, 0, 0.6941177, 1, 1,
0.191922, -1.398098, 3.133674, 0, 0.6862745, 1, 1,
0.1949584, -0.6399936, 1.851385, 0, 0.682353, 1, 1,
0.1971144, -0.8627096, 3.12918, 0, 0.6745098, 1, 1,
0.1990848, 0.841536, -0.5006016, 0, 0.6705883, 1, 1,
0.2000285, -1.160321, 3.689595, 0, 0.6627451, 1, 1,
0.2043865, 0.6117864, -0.7073805, 0, 0.6588235, 1, 1,
0.2045616, 0.2297754, -0.4263498, 0, 0.6509804, 1, 1,
0.2060874, -1.458075, 2.624795, 0, 0.6470588, 1, 1,
0.2068635, -0.2128471, 3.038307, 0, 0.6392157, 1, 1,
0.2106377, 0.9320227, -1.001869, 0, 0.6352941, 1, 1,
0.2126791, 0.55665, 0.06581882, 0, 0.627451, 1, 1,
0.2171106, -0.1384205, 3.953645, 0, 0.6235294, 1, 1,
0.220215, -0.6612881, 3.929444, 0, 0.6156863, 1, 1,
0.2235974, 1.27425, 0.9591995, 0, 0.6117647, 1, 1,
0.2257057, -0.2098193, 2.621036, 0, 0.6039216, 1, 1,
0.2352952, -1.094491, 2.149006, 0, 0.5960785, 1, 1,
0.2385567, -1.760377, 1.91448, 0, 0.5921569, 1, 1,
0.2400963, 1.825882, 0.6916395, 0, 0.5843138, 1, 1,
0.240475, -0.4096768, 2.628644, 0, 0.5803922, 1, 1,
0.2450951, 0.9720497, 1.002269, 0, 0.572549, 1, 1,
0.2456072, 1.553827, 1.352648, 0, 0.5686275, 1, 1,
0.2473818, -1.384933, 2.871789, 0, 0.5607843, 1, 1,
0.2522483, 0.4902114, 3.084185, 0, 0.5568628, 1, 1,
0.2540322, 1.813255, 0.6157401, 0, 0.5490196, 1, 1,
0.2577187, -0.2054579, 1.744243, 0, 0.5450981, 1, 1,
0.2624392, 1.529449, -0.5308698, 0, 0.5372549, 1, 1,
0.2636874, 0.09296108, 0.6111558, 0, 0.5333334, 1, 1,
0.2640755, -1.441458, 3.669982, 0, 0.5254902, 1, 1,
0.2663438, 1.824652, -2.015283, 0, 0.5215687, 1, 1,
0.2668014, -0.8547555, 3.239277, 0, 0.5137255, 1, 1,
0.2673194, -0.1703415, 2.60572, 0, 0.509804, 1, 1,
0.2678964, -0.7869674, 4.430371, 0, 0.5019608, 1, 1,
0.2681049, -0.3039552, 1.316709, 0, 0.4941176, 1, 1,
0.2696222, 0.2764777, 0.1196768, 0, 0.4901961, 1, 1,
0.2703542, -0.1571382, 0.561288, 0, 0.4823529, 1, 1,
0.2715616, 1.183344, 0.6511654, 0, 0.4784314, 1, 1,
0.2723896, 1.010809, -0.543882, 0, 0.4705882, 1, 1,
0.2745494, -0.460063, 1.217922, 0, 0.4666667, 1, 1,
0.2747011, -0.837926, -0.6769361, 0, 0.4588235, 1, 1,
0.2748944, 0.8900139, -1.799794, 0, 0.454902, 1, 1,
0.2862464, -0.08514909, 0.6536749, 0, 0.4470588, 1, 1,
0.2875544, 0.9883506, 0.2511436, 0, 0.4431373, 1, 1,
0.2942317, 0.9330366, 0.4409334, 0, 0.4352941, 1, 1,
0.2945001, -0.9056461, 3.590133, 0, 0.4313726, 1, 1,
0.2976128, 0.6735221, 1.310112, 0, 0.4235294, 1, 1,
0.3008215, -0.5922964, 0.5997815, 0, 0.4196078, 1, 1,
0.3063496, -0.2570042, 1.599584, 0, 0.4117647, 1, 1,
0.3139881, -0.2550495, 3.389994, 0, 0.4078431, 1, 1,
0.3169263, 0.5025257, 0.7319999, 0, 0.4, 1, 1,
0.3169888, -0.3099471, 1.16811, 0, 0.3921569, 1, 1,
0.3227409, 0.7017344, 0.6482311, 0, 0.3882353, 1, 1,
0.3266965, 0.9592827, 1.442274, 0, 0.3803922, 1, 1,
0.3270484, -0.4100817, 3.617535, 0, 0.3764706, 1, 1,
0.3288258, -0.01655013, 2.047376, 0, 0.3686275, 1, 1,
0.3292431, -0.4967638, 2.19601, 0, 0.3647059, 1, 1,
0.3306713, 0.1648194, -0.2862512, 0, 0.3568628, 1, 1,
0.3330778, -0.7361224, 2.955216, 0, 0.3529412, 1, 1,
0.3351154, 1.258468, 0.2156934, 0, 0.345098, 1, 1,
0.3355918, -0.1379, 1.683118, 0, 0.3411765, 1, 1,
0.3383922, -1.031924, 3.041871, 0, 0.3333333, 1, 1,
0.3397147, 1.380125, 0.7152052, 0, 0.3294118, 1, 1,
0.3410276, -2.042939, 2.21187, 0, 0.3215686, 1, 1,
0.3414959, 1.975221, 0.1911454, 0, 0.3176471, 1, 1,
0.3428281, 0.6972317, 1.124701, 0, 0.3098039, 1, 1,
0.3441283, 1.102455, 1.370843, 0, 0.3058824, 1, 1,
0.3457597, -1.75553, 3.359677, 0, 0.2980392, 1, 1,
0.3466974, -0.3330726, 0.7228413, 0, 0.2901961, 1, 1,
0.3479311, -1.845881, 3.098881, 0, 0.2862745, 1, 1,
0.3598414, -0.9508697, 4.298691, 0, 0.2784314, 1, 1,
0.3648579, 0.61833, -0.4032252, 0, 0.2745098, 1, 1,
0.367332, -0.31208, 3.743409, 0, 0.2666667, 1, 1,
0.3687856, -0.8902308, 1.820035, 0, 0.2627451, 1, 1,
0.371339, 0.3567211, 1.390201, 0, 0.254902, 1, 1,
0.3729753, -0.5793422, 2.705004, 0, 0.2509804, 1, 1,
0.3746095, 2.130382, 0.8290559, 0, 0.2431373, 1, 1,
0.3760948, 0.1739873, 0.8048372, 0, 0.2392157, 1, 1,
0.3840537, -0.05740052, -0.05267265, 0, 0.2313726, 1, 1,
0.3899657, -0.781307, 0.7303912, 0, 0.227451, 1, 1,
0.3908274, 0.3205338, -0.8044718, 0, 0.2196078, 1, 1,
0.391151, 0.4730512, 2.197161, 0, 0.2156863, 1, 1,
0.3945399, 0.111546, 0.6528296, 0, 0.2078431, 1, 1,
0.4021895, -0.46312, 1.177477, 0, 0.2039216, 1, 1,
0.4030449, 0.8763583, 1.145715, 0, 0.1960784, 1, 1,
0.4044327, 0.6586573, 0.04920927, 0, 0.1882353, 1, 1,
0.4066166, -0.4115021, 1.125803, 0, 0.1843137, 1, 1,
0.4093701, 0.5249306, 0.4152809, 0, 0.1764706, 1, 1,
0.4102969, -0.3839244, 2.809133, 0, 0.172549, 1, 1,
0.4110494, -0.3212045, 2.506932, 0, 0.1647059, 1, 1,
0.4132315, -0.5049789, 1.628634, 0, 0.1607843, 1, 1,
0.4286763, -0.1253339, 2.440215, 0, 0.1529412, 1, 1,
0.4293683, -0.4628565, 3.010001, 0, 0.1490196, 1, 1,
0.4342294, 0.3352971, 2.242625, 0, 0.1411765, 1, 1,
0.4370438, 0.8632925, 0.6516591, 0, 0.1372549, 1, 1,
0.4384832, -0.5732318, 2.135421, 0, 0.1294118, 1, 1,
0.4392682, -0.8400002, 2.720446, 0, 0.1254902, 1, 1,
0.4469824, -0.8314932, 1.641368, 0, 0.1176471, 1, 1,
0.4477659, 1.620621, -0.09606842, 0, 0.1137255, 1, 1,
0.4482595, -1.108168, 4.760465, 0, 0.1058824, 1, 1,
0.4483855, 1.284768, -1.419723, 0, 0.09803922, 1, 1,
0.4492677, -0.3230426, 2.404176, 0, 0.09411765, 1, 1,
0.4515561, -1.165612, 2.604912, 0, 0.08627451, 1, 1,
0.4534021, 0.2104367, 1.514205, 0, 0.08235294, 1, 1,
0.45795, 0.4561209, -1.080486, 0, 0.07450981, 1, 1,
0.4607972, 1.170744, -0.3120885, 0, 0.07058824, 1, 1,
0.4658614, 1.601336, -1.351546, 0, 0.0627451, 1, 1,
0.4723888, 0.9995565, -0.2377863, 0, 0.05882353, 1, 1,
0.4731427, -1.084625, 2.179161, 0, 0.05098039, 1, 1,
0.475233, -0.04918494, 1.350677, 0, 0.04705882, 1, 1,
0.4770257, 0.634149, -0.3483945, 0, 0.03921569, 1, 1,
0.4803199, 0.5638337, 0.5134846, 0, 0.03529412, 1, 1,
0.4806804, 0.4697482, 0.607054, 0, 0.02745098, 1, 1,
0.4811662, -0.1492786, 2.95242, 0, 0.02352941, 1, 1,
0.4846601, 0.6027999, 0.5189081, 0, 0.01568628, 1, 1,
0.4856633, -1.004381, 2.260962, 0, 0.01176471, 1, 1,
0.4870463, 2.179344, 0.5945826, 0, 0.003921569, 1, 1,
0.4883676, -0.6152302, 1.642265, 0.003921569, 0, 1, 1,
0.4947734, 1.254924, 0.6300569, 0.007843138, 0, 1, 1,
0.4969343, -0.1025487, 2.81972, 0.01568628, 0, 1, 1,
0.4979122, -0.3150596, 2.91396, 0.01960784, 0, 1, 1,
0.4979677, 0.2419018, 0.9805797, 0.02745098, 0, 1, 1,
0.5029094, 1.040504, -0.2090036, 0.03137255, 0, 1, 1,
0.5072829, 0.6297891, 1.373173, 0.03921569, 0, 1, 1,
0.5077062, -0.2491079, 0.6147985, 0.04313726, 0, 1, 1,
0.5116661, 0.5709532, 1.74237, 0.05098039, 0, 1, 1,
0.5147294, -1.275068, 2.20712, 0.05490196, 0, 1, 1,
0.5168625, 1.310544, -1.073897, 0.0627451, 0, 1, 1,
0.517707, 0.2370347, 1.007029, 0.06666667, 0, 1, 1,
0.5182367, 1.918408, 0.3352067, 0.07450981, 0, 1, 1,
0.5206475, 0.4335685, 0.4198881, 0.07843138, 0, 1, 1,
0.5233412, -1.510774, 1.975291, 0.08627451, 0, 1, 1,
0.5259459, 2.975987, 0.3889254, 0.09019608, 0, 1, 1,
0.5284076, 0.454929, 0.6423113, 0.09803922, 0, 1, 1,
0.5322515, -0.2994788, 3.345111, 0.1058824, 0, 1, 1,
0.5322775, 0.3103535, 3.106007, 0.1098039, 0, 1, 1,
0.5323954, 0.3668033, 1.892723, 0.1176471, 0, 1, 1,
0.5356686, 0.5582721, 0.2631962, 0.1215686, 0, 1, 1,
0.53754, 0.5157235, -0.3373772, 0.1294118, 0, 1, 1,
0.5388576, 0.5006517, 0.848968, 0.1333333, 0, 1, 1,
0.5404872, -0.8981208, 0.484865, 0.1411765, 0, 1, 1,
0.5436291, 2.701364, -1.666989, 0.145098, 0, 1, 1,
0.5450781, -1.687216, 2.881006, 0.1529412, 0, 1, 1,
0.5459805, 0.3669981, 1.105069, 0.1568628, 0, 1, 1,
0.5643758, -0.7920511, 1.902478, 0.1647059, 0, 1, 1,
0.5668887, 0.6022367, 1.564928, 0.1686275, 0, 1, 1,
0.5672246, 0.6525028, 0.2026807, 0.1764706, 0, 1, 1,
0.5743024, -1.355155, 3.793908, 0.1803922, 0, 1, 1,
0.5807338, 0.6038541, -1.88118, 0.1882353, 0, 1, 1,
0.581263, -0.1248379, 0.3912744, 0.1921569, 0, 1, 1,
0.5874208, 0.2680562, -0.03667609, 0.2, 0, 1, 1,
0.5890685, 0.3566484, 1.260307, 0.2078431, 0, 1, 1,
0.5957157, -1.34469, 3.473987, 0.2117647, 0, 1, 1,
0.5967895, -0.5859495, 2.006576, 0.2196078, 0, 1, 1,
0.5971002, -0.3716184, 4.106875, 0.2235294, 0, 1, 1,
0.5985386, 0.8364487, -0.20724, 0.2313726, 0, 1, 1,
0.6008561, 0.01942934, 1.495337, 0.2352941, 0, 1, 1,
0.6025256, -1.198561, 2.629066, 0.2431373, 0, 1, 1,
0.6100557, 1.232367, 1.322131, 0.2470588, 0, 1, 1,
0.6117782, -0.6648295, 3.204851, 0.254902, 0, 1, 1,
0.6242848, 0.3205777, 0.3767447, 0.2588235, 0, 1, 1,
0.6273626, -1.490178, 1.805998, 0.2666667, 0, 1, 1,
0.6283517, 1.974055, 0.9747022, 0.2705882, 0, 1, 1,
0.6357738, 0.340177, 2.554587, 0.2784314, 0, 1, 1,
0.636117, -1.035362, 1.519402, 0.282353, 0, 1, 1,
0.6396704, -0.360337, 2.267226, 0.2901961, 0, 1, 1,
0.6430295, 0.5900729, 0.2980093, 0.2941177, 0, 1, 1,
0.6436372, -0.6467255, 1.180107, 0.3019608, 0, 1, 1,
0.6467805, -0.7777117, 2.444749, 0.3098039, 0, 1, 1,
0.6468161, 0.8504025, -0.6246921, 0.3137255, 0, 1, 1,
0.6475264, 0.0809467, 1.075433, 0.3215686, 0, 1, 1,
0.6477144, -0.2932182, 1.440709, 0.3254902, 0, 1, 1,
0.6553752, -0.971799, 3.298256, 0.3333333, 0, 1, 1,
0.6567385, 1.037907, -0.2114473, 0.3372549, 0, 1, 1,
0.6584204, -0.3972543, 1.933622, 0.345098, 0, 1, 1,
0.6607494, 0.0446027, -0.5192774, 0.3490196, 0, 1, 1,
0.6610612, -0.3374536, 0.5700582, 0.3568628, 0, 1, 1,
0.6610824, -0.513487, 0.9691434, 0.3607843, 0, 1, 1,
0.6619394, -0.5647253, 2.627713, 0.3686275, 0, 1, 1,
0.6636369, -1.48048, 3.004887, 0.372549, 0, 1, 1,
0.6662539, -0.552168, 1.041816, 0.3803922, 0, 1, 1,
0.666267, 0.4944675, 1.145363, 0.3843137, 0, 1, 1,
0.667686, -0.7296776, 2.263023, 0.3921569, 0, 1, 1,
0.6705906, -0.4241502, 2.384398, 0.3960784, 0, 1, 1,
0.6717825, -0.9371526, 3.123815, 0.4039216, 0, 1, 1,
0.6746176, 1.512846, -0.01159861, 0.4117647, 0, 1, 1,
0.6748183, -0.303603, 3.340326, 0.4156863, 0, 1, 1,
0.6771846, 0.6249011, -0.7339001, 0.4235294, 0, 1, 1,
0.6783509, 2.954096, -0.2586434, 0.427451, 0, 1, 1,
0.6783863, -0.3451778, 2.228512, 0.4352941, 0, 1, 1,
0.6798425, -0.287421, 2.964753, 0.4392157, 0, 1, 1,
0.6890274, -0.3076934, 1.985562, 0.4470588, 0, 1, 1,
0.6894944, -0.1437659, 0.9474526, 0.4509804, 0, 1, 1,
0.6962163, 0.04439626, 1.556053, 0.4588235, 0, 1, 1,
0.6963205, -1.150102, 3.375063, 0.4627451, 0, 1, 1,
0.6979641, -2.70401, 3.266452, 0.4705882, 0, 1, 1,
0.6984372, 0.7855513, 0.7359021, 0.4745098, 0, 1, 1,
0.7025021, 0.4965828, 1.8278, 0.4823529, 0, 1, 1,
0.703365, 2.252245, -1.036346, 0.4862745, 0, 1, 1,
0.7095323, 0.3880524, 1.352566, 0.4941176, 0, 1, 1,
0.7152413, 0.1000388, 1.71236, 0.5019608, 0, 1, 1,
0.716326, -0.8999256, 1.321185, 0.5058824, 0, 1, 1,
0.7166036, 0.3956599, 1.441402, 0.5137255, 0, 1, 1,
0.7176812, -0.1532022, 2.744316, 0.5176471, 0, 1, 1,
0.7250265, -0.4489403, 2.456147, 0.5254902, 0, 1, 1,
0.7326723, -1.041219, 3.41476, 0.5294118, 0, 1, 1,
0.7329307, 0.1494288, 0.08902208, 0.5372549, 0, 1, 1,
0.7402812, 0.7152029, 2.35059, 0.5411765, 0, 1, 1,
0.7448167, 0.9556682, 0.06329223, 0.5490196, 0, 1, 1,
0.7485937, -0.1895391, 0.6551263, 0.5529412, 0, 1, 1,
0.749492, -0.880307, 1.57473, 0.5607843, 0, 1, 1,
0.7499388, -0.1564867, 2.357455, 0.5647059, 0, 1, 1,
0.7532472, 0.7294292, 1.424195, 0.572549, 0, 1, 1,
0.7570768, -0.6862299, 2.424292, 0.5764706, 0, 1, 1,
0.7600713, -0.5021365, 2.05668, 0.5843138, 0, 1, 1,
0.760883, 0.6794065, 1.901608, 0.5882353, 0, 1, 1,
0.7625075, -1.346635, 2.831269, 0.5960785, 0, 1, 1,
0.7664758, 1.50683, 1.198331, 0.6039216, 0, 1, 1,
0.7669984, -2.684962, 3.855705, 0.6078432, 0, 1, 1,
0.7678829, -0.5894621, 2.630438, 0.6156863, 0, 1, 1,
0.7687787, 1.41345, -0.2953328, 0.6196079, 0, 1, 1,
0.7781228, 0.6172742, 0.6761716, 0.627451, 0, 1, 1,
0.7787134, -0.9867628, 2.730892, 0.6313726, 0, 1, 1,
0.7823408, 0.5849127, 1.998754, 0.6392157, 0, 1, 1,
0.7837744, 1.515805, 1.223132, 0.6431373, 0, 1, 1,
0.7882171, -0.4073156, 3.539749, 0.6509804, 0, 1, 1,
0.7910368, 0.1943545, 0.1568676, 0.654902, 0, 1, 1,
0.800473, 0.5179448, 1.109341, 0.6627451, 0, 1, 1,
0.8044732, -0.228539, 3.439753, 0.6666667, 0, 1, 1,
0.8052863, -0.3172474, 1.122098, 0.6745098, 0, 1, 1,
0.8064005, -0.794719, 3.59079, 0.6784314, 0, 1, 1,
0.8202021, 0.8933259, 0.1399787, 0.6862745, 0, 1, 1,
0.8212174, -0.6968386, 1.458255, 0.6901961, 0, 1, 1,
0.8237583, -0.2665874, -0.3700957, 0.6980392, 0, 1, 1,
0.8246322, -1.199296, 2.213607, 0.7058824, 0, 1, 1,
0.8295342, -0.260812, 2.077657, 0.7098039, 0, 1, 1,
0.8313987, 0.04849268, 0.1583172, 0.7176471, 0, 1, 1,
0.8333666, 1.270701, 1.652697, 0.7215686, 0, 1, 1,
0.8393178, -0.826719, 3.008103, 0.7294118, 0, 1, 1,
0.8447109, 0.5553045, 0.06676428, 0.7333333, 0, 1, 1,
0.848061, 0.5436839, 0.3480277, 0.7411765, 0, 1, 1,
0.8481246, 1.803043, 0.9953653, 0.7450981, 0, 1, 1,
0.8617736, 1.740895, 0.3114016, 0.7529412, 0, 1, 1,
0.8625386, 1.069074, 0.766586, 0.7568628, 0, 1, 1,
0.8648288, -0.7507498, 2.207148, 0.7647059, 0, 1, 1,
0.86726, 0.005724833, 0.9002776, 0.7686275, 0, 1, 1,
0.8690289, 0.790479, 1.501123, 0.7764706, 0, 1, 1,
0.8719358, 0.8264689, -1.547763, 0.7803922, 0, 1, 1,
0.8738912, 0.09436304, 2.318302, 0.7882353, 0, 1, 1,
0.888517, 0.8268859, 0.1988082, 0.7921569, 0, 1, 1,
0.8895516, 0.5017183, 1.229761, 0.8, 0, 1, 1,
0.8947557, -0.7076532, 2.916491, 0.8078431, 0, 1, 1,
0.8977548, -3.740547, 5.095072, 0.8117647, 0, 1, 1,
0.9079568, 0.19076, 0.3165573, 0.8196079, 0, 1, 1,
0.9100028, -0.008057684, 1.124841, 0.8235294, 0, 1, 1,
0.9122329, 0.3912046, 1.138538, 0.8313726, 0, 1, 1,
0.916592, 2.076537, 1.039377, 0.8352941, 0, 1, 1,
0.9223346, 0.8621977, 1.180929, 0.8431373, 0, 1, 1,
0.9227203, -1.958229, 2.645647, 0.8470588, 0, 1, 1,
0.9245487, -0.3239911, 4.984573, 0.854902, 0, 1, 1,
0.9247974, -0.09875658, 1.886695, 0.8588235, 0, 1, 1,
0.9248929, -1.393462, 2.737516, 0.8666667, 0, 1, 1,
0.9267322, 1.274392, 0.320979, 0.8705882, 0, 1, 1,
0.9298052, -0.07653424, 2.944181, 0.8784314, 0, 1, 1,
0.9453157, -0.955888, 2.289551, 0.8823529, 0, 1, 1,
0.9462869, 0.6611803, 1.746763, 0.8901961, 0, 1, 1,
0.9511562, -1.636666, 1.500504, 0.8941177, 0, 1, 1,
0.9511788, -1.470209, 0.563045, 0.9019608, 0, 1, 1,
0.955395, -0.1572275, 3.627314, 0.9098039, 0, 1, 1,
0.9584949, 0.8135536, 2.286002, 0.9137255, 0, 1, 1,
0.9586721, -0.2106705, 3.567861, 0.9215686, 0, 1, 1,
0.9597575, -2.154351, 1.104805, 0.9254902, 0, 1, 1,
0.9654466, -2.26532, 1.040573, 0.9333333, 0, 1, 1,
0.9667928, 0.00181331, -0.6604273, 0.9372549, 0, 1, 1,
0.9680824, 0.8786142, 0.0388397, 0.945098, 0, 1, 1,
0.9783494, -0.6347201, 2.82846, 0.9490196, 0, 1, 1,
0.979158, -0.5314764, 3.689115, 0.9568627, 0, 1, 1,
0.9845767, -0.06317711, 3.778582, 0.9607843, 0, 1, 1,
0.9883221, -0.3693165, -0.2022527, 0.9686275, 0, 1, 1,
0.9931786, 0.7561777, 1.42384, 0.972549, 0, 1, 1,
1.002285, -0.6577383, 1.493284, 0.9803922, 0, 1, 1,
1.004792, 0.05340407, 1.202628, 0.9843137, 0, 1, 1,
1.007268, 0.1595883, 1.717637, 0.9921569, 0, 1, 1,
1.008063, 0.07858559, 2.035223, 0.9960784, 0, 1, 1,
1.00837, 0.3428881, 0.9853908, 1, 0, 0.9960784, 1,
1.016877, 0.4121279, 2.022106, 1, 0, 0.9882353, 1,
1.017015, 1.24262, 0.4190966, 1, 0, 0.9843137, 1,
1.021233, -1.180821, 3.498309, 1, 0, 0.9764706, 1,
1.023568, -0.136756, 2.774287, 1, 0, 0.972549, 1,
1.025347, 1.295172, 0.1526084, 1, 0, 0.9647059, 1,
1.03016, 1.107918, 1.128691, 1, 0, 0.9607843, 1,
1.030982, 0.6547122, 0.8925699, 1, 0, 0.9529412, 1,
1.032054, -1.963513, 0.8441312, 1, 0, 0.9490196, 1,
1.042655, 0.7535953, 3.161795, 1, 0, 0.9411765, 1,
1.043461, 0.7458809, 2.093224, 1, 0, 0.9372549, 1,
1.049688, 1.004834, -0.6571362, 1, 0, 0.9294118, 1,
1.057354, 0.3581305, 0.5754653, 1, 0, 0.9254902, 1,
1.064703, 0.9654468, 1.784719, 1, 0, 0.9176471, 1,
1.06916, 0.7223789, 1.924805, 1, 0, 0.9137255, 1,
1.080959, 0.2689332, 2.405236, 1, 0, 0.9058824, 1,
1.081631, 0.9811807, 0.5747863, 1, 0, 0.9019608, 1,
1.082598, -0.352177, 3.478958, 1, 0, 0.8941177, 1,
1.084321, -1.433815, 5.588756, 1, 0, 0.8862745, 1,
1.093606, 1.011298, 0.6154549, 1, 0, 0.8823529, 1,
1.098631, 0.06484875, 0.8067644, 1, 0, 0.8745098, 1,
1.098673, -1.407182, 1.993105, 1, 0, 0.8705882, 1,
1.09883, -0.4942731, 3.204687, 1, 0, 0.8627451, 1,
1.10595, 1.060189, 0.788537, 1, 0, 0.8588235, 1,
1.110984, -0.1405092, 1.048134, 1, 0, 0.8509804, 1,
1.111868, 0.02841231, 2.069088, 1, 0, 0.8470588, 1,
1.115229, 0.4695841, 0.5114821, 1, 0, 0.8392157, 1,
1.116214, 0.6893447, 0.2786194, 1, 0, 0.8352941, 1,
1.117875, -0.8304337, 1.00637, 1, 0, 0.827451, 1,
1.119338, 0.7937204, 1.82682, 1, 0, 0.8235294, 1,
1.121508, -0.9481024, 3.347336, 1, 0, 0.8156863, 1,
1.123069, 0.7308348, 0.134938, 1, 0, 0.8117647, 1,
1.127581, -1.796293, 0.7270802, 1, 0, 0.8039216, 1,
1.1357, -1.992253, 2.52199, 1, 0, 0.7960784, 1,
1.138047, -0.1879868, 1.244775, 1, 0, 0.7921569, 1,
1.14856, 0.7847724, 0.413018, 1, 0, 0.7843137, 1,
1.15034, 0.6991286, 1.139634, 1, 0, 0.7803922, 1,
1.157334, 0.3362233, 0.3726619, 1, 0, 0.772549, 1,
1.158993, 0.8634752, 1.783587, 1, 0, 0.7686275, 1,
1.168021, 0.2614847, 1.340472, 1, 0, 0.7607843, 1,
1.179383, -0.281153, -0.172636, 1, 0, 0.7568628, 1,
1.180344, -0.5799703, 2.144253, 1, 0, 0.7490196, 1,
1.180418, -1.654767, 2.409106, 1, 0, 0.7450981, 1,
1.199397, -1.109407, 1.605958, 1, 0, 0.7372549, 1,
1.199561, 1.902645, 0.05193869, 1, 0, 0.7333333, 1,
1.20532, -0.7303092, 1.770156, 1, 0, 0.7254902, 1,
1.211168, -1.056322, 3.601322, 1, 0, 0.7215686, 1,
1.212206, 0.5639647, 1.475733, 1, 0, 0.7137255, 1,
1.224292, 1.010651, 1.823739, 1, 0, 0.7098039, 1,
1.227043, -0.3233968, 2.234792, 1, 0, 0.7019608, 1,
1.233739, -0.2038447, 2.181097, 1, 0, 0.6941177, 1,
1.240982, 0.2502777, 0.7696187, 1, 0, 0.6901961, 1,
1.250526, -0.9826505, 2.720957, 1, 0, 0.682353, 1,
1.256558, -0.8282288, 1.399827, 1, 0, 0.6784314, 1,
1.257116, -0.7394146, 3.255315, 1, 0, 0.6705883, 1,
1.259223, -0.9580313, 1.541791, 1, 0, 0.6666667, 1,
1.262084, 0.072565, 2.263865, 1, 0, 0.6588235, 1,
1.263426, 0.2453275, 1.188391, 1, 0, 0.654902, 1,
1.269165, 0.04037348, 0.9461223, 1, 0, 0.6470588, 1,
1.274081, -0.09297769, 3.866498, 1, 0, 0.6431373, 1,
1.27499, -0.2081406, 1.586233, 1, 0, 0.6352941, 1,
1.2769, -1.476004, 1.874354, 1, 0, 0.6313726, 1,
1.288934, -0.9133386, 3.440144, 1, 0, 0.6235294, 1,
1.291901, 0.08724784, 2.469806, 1, 0, 0.6196079, 1,
1.292396, -2.306451, 0.9781947, 1, 0, 0.6117647, 1,
1.306221, 0.6592911, -0.0172368, 1, 0, 0.6078432, 1,
1.307966, 1.119637, 0.4043277, 1, 0, 0.6, 1,
1.313872, -0.5298738, 1.329533, 1, 0, 0.5921569, 1,
1.318099, 0.2082219, 2.252624, 1, 0, 0.5882353, 1,
1.320028, 1.7124, 0.7669886, 1, 0, 0.5803922, 1,
1.321398, 0.6576154, 0.9625925, 1, 0, 0.5764706, 1,
1.323995, 0.4629236, 1.373879, 1, 0, 0.5686275, 1,
1.328212, -1.291237, 2.248609, 1, 0, 0.5647059, 1,
1.349622, 2.125728, 0.2879744, 1, 0, 0.5568628, 1,
1.374058, -0.4610692, 1.223486, 1, 0, 0.5529412, 1,
1.375598, 0.02989455, 1.799217, 1, 0, 0.5450981, 1,
1.406681, -0.6254757, 2.100698, 1, 0, 0.5411765, 1,
1.408786, 0.9814566, 1.864566, 1, 0, 0.5333334, 1,
1.411572, 0.6428366, 1.275668, 1, 0, 0.5294118, 1,
1.434997, 2.019881, 0.5542102, 1, 0, 0.5215687, 1,
1.435854, -0.2745358, 2.398918, 1, 0, 0.5176471, 1,
1.437866, 0.003016618, 2.159537, 1, 0, 0.509804, 1,
1.448411, 0.9900731, 1.887719, 1, 0, 0.5058824, 1,
1.463786, -1.307706, 1.95925, 1, 0, 0.4980392, 1,
1.475117, 1.714707, 1.6435, 1, 0, 0.4901961, 1,
1.484106, 0.3344143, 1.496858, 1, 0, 0.4862745, 1,
1.494809, 1.111233, 0.02901198, 1, 0, 0.4784314, 1,
1.515645, -1.47412, 3.114135, 1, 0, 0.4745098, 1,
1.521935, -0.04917533, 1.422989, 1, 0, 0.4666667, 1,
1.532035, 0.7345958, -0.8979525, 1, 0, 0.4627451, 1,
1.53261, 0.4188243, 3.219031, 1, 0, 0.454902, 1,
1.539948, -0.1016203, 1.291005, 1, 0, 0.4509804, 1,
1.540978, -0.1552325, 1.804083, 1, 0, 0.4431373, 1,
1.542364, 0.8732163, 1.35708, 1, 0, 0.4392157, 1,
1.576659, 0.7992184, 0.6385431, 1, 0, 0.4313726, 1,
1.58065, 0.4391436, 0.8346086, 1, 0, 0.427451, 1,
1.586573, 0.8253409, 0.5077101, 1, 0, 0.4196078, 1,
1.587476, -0.4832242, 2.802119, 1, 0, 0.4156863, 1,
1.603937, -0.1577602, 0.5266505, 1, 0, 0.4078431, 1,
1.625356, 0.7655914, 1.389949, 1, 0, 0.4039216, 1,
1.637091, -0.7377379, 1.602061, 1, 0, 0.3960784, 1,
1.640487, -0.3895472, 2.12503, 1, 0, 0.3882353, 1,
1.64219, 0.6797156, 2.708869, 1, 0, 0.3843137, 1,
1.646589, -0.07572242, 1.508543, 1, 0, 0.3764706, 1,
1.651397, 0.9792465, 2.468302, 1, 0, 0.372549, 1,
1.663816, -1.407742, 2.717107, 1, 0, 0.3647059, 1,
1.667227, -1.397221, 1.523457, 1, 0, 0.3607843, 1,
1.667482, -1.050373, 2.943726, 1, 0, 0.3529412, 1,
1.672093, -0.3280058, 1.59263, 1, 0, 0.3490196, 1,
1.676902, -0.8916766, 1.330893, 1, 0, 0.3411765, 1,
1.678724, -0.7445356, 1.390466, 1, 0, 0.3372549, 1,
1.686594, -0.5319205, 1.758284, 1, 0, 0.3294118, 1,
1.694952, -1.694145, 3.299204, 1, 0, 0.3254902, 1,
1.721276, -0.3858444, -0.2332955, 1, 0, 0.3176471, 1,
1.741747, 0.9205151, 2.157788, 1, 0, 0.3137255, 1,
1.743304, -0.4399895, 1.61789, 1, 0, 0.3058824, 1,
1.748906, 1.967097, -0.5702748, 1, 0, 0.2980392, 1,
1.769753, 0.2272069, -0.6735975, 1, 0, 0.2941177, 1,
1.782521, -1.440962, 2.569097, 1, 0, 0.2862745, 1,
1.803327, -1.118535, 1.324146, 1, 0, 0.282353, 1,
1.810596, -0.7786048, 3.05278, 1, 0, 0.2745098, 1,
1.813634, 0.553435, 1.106802, 1, 0, 0.2705882, 1,
1.818868, -0.2985742, 2.185695, 1, 0, 0.2627451, 1,
1.828277, 0.7668264, 0.9730108, 1, 0, 0.2588235, 1,
1.829227, 0.2825788, 0.03809767, 1, 0, 0.2509804, 1,
1.838835, -1.469168, 3.886123, 1, 0, 0.2470588, 1,
1.866383, -0.7976823, -0.06554893, 1, 0, 0.2392157, 1,
1.893183, -0.8963771, 1.186005, 1, 0, 0.2352941, 1,
1.901609, -0.1756175, 1.484606, 1, 0, 0.227451, 1,
1.904433, -0.7927688, 1.62695, 1, 0, 0.2235294, 1,
1.912124, 1.231887, 2.290991, 1, 0, 0.2156863, 1,
1.918369, -0.444596, 0.2207986, 1, 0, 0.2117647, 1,
1.925648, -0.9288064, 1.579607, 1, 0, 0.2039216, 1,
1.95554, -0.5997783, 0.3806747, 1, 0, 0.1960784, 1,
1.966885, -0.9535372, 2.021004, 1, 0, 0.1921569, 1,
1.986803, 1.047702, 1.314616, 1, 0, 0.1843137, 1,
1.988517, -2.279817, 2.243684, 1, 0, 0.1803922, 1,
1.988632, 0.6626927, 4.148842, 1, 0, 0.172549, 1,
1.999777, -0.1235254, 2.948138, 1, 0, 0.1686275, 1,
2.01145, -1.520921, 1.077274, 1, 0, 0.1607843, 1,
2.042073, -0.9028932, 3.272398, 1, 0, 0.1568628, 1,
2.046022, 0.707172, 2.822269, 1, 0, 0.1490196, 1,
2.047424, 0.007926501, 2.931173, 1, 0, 0.145098, 1,
2.168744, -0.5470084, 2.032951, 1, 0, 0.1372549, 1,
2.202575, 0.5079702, 1.245148, 1, 0, 0.1333333, 1,
2.20458, 0.1115724, 2.947747, 1, 0, 0.1254902, 1,
2.216716, -1.662635, 4.169431, 1, 0, 0.1215686, 1,
2.225606, 0.1082697, 1.810593, 1, 0, 0.1137255, 1,
2.284919, -0.6176085, 1.696969, 1, 0, 0.1098039, 1,
2.293958, 0.02409744, 1.782308, 1, 0, 0.1019608, 1,
2.32846, 0.1935746, 1.540745, 1, 0, 0.09411765, 1,
2.393534, 2.431177, 0.3407015, 1, 0, 0.09019608, 1,
2.395311, 0.8218467, 0.7839965, 1, 0, 0.08235294, 1,
2.490211, 0.3834516, 0.9088204, 1, 0, 0.07843138, 1,
2.490658, 0.767195, 0.9845924, 1, 0, 0.07058824, 1,
2.494958, 0.1375154, 2.845657, 1, 0, 0.06666667, 1,
2.550419, -0.2080206, 0.3619069, 1, 0, 0.05882353, 1,
2.684047, -0.003252225, 1.627897, 1, 0, 0.05490196, 1,
2.713399, -0.2576188, 1.98709, 1, 0, 0.04705882, 1,
2.720161, 1.276425, 0.9146597, 1, 0, 0.04313726, 1,
2.807055, 0.2768932, 0.9605888, 1, 0, 0.03529412, 1,
2.820832, -0.1347097, 0.7580342, 1, 0, 0.03137255, 1,
2.875379, 0.9413655, 0.9886643, 1, 0, 0.02352941, 1,
3.022914, 0.7295496, 2.029158, 1, 0, 0.01960784, 1,
3.044562, 0.8722796, 0.8832923, 1, 0, 0.01176471, 1,
3.221002, 0.16333, 1.229723, 1, 0, 0.007843138, 1
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
0.1861377, -4.879, -8.141148, 0, -0.5, 0.5, 0.5,
0.1861377, -4.879, -8.141148, 1, -0.5, 0.5, 0.5,
0.1861377, -4.879, -8.141148, 1, 1.5, 0.5, 0.5,
0.1861377, -4.879, -8.141148, 0, 1.5, 0.5, 0.5
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
-3.877545, -0.38228, -8.141148, 0, -0.5, 0.5, 0.5,
-3.877545, -0.38228, -8.141148, 1, -0.5, 0.5, 0.5,
-3.877545, -0.38228, -8.141148, 1, 1.5, 0.5, 0.5,
-3.877545, -0.38228, -8.141148, 0, 1.5, 0.5, 0.5
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
-3.877545, -4.879, -0.2812328, 0, -0.5, 0.5, 0.5,
-3.877545, -4.879, -0.2812328, 1, -0.5, 0.5, 0.5,
-3.877545, -4.879, -0.2812328, 1, 1.5, 0.5, 0.5,
-3.877545, -4.879, -0.2812328, 0, 1.5, 0.5, 0.5
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
-2, -3.841295, -6.327321,
3, -3.841295, -6.327321,
-2, -3.841295, -6.327321,
-2, -4.014246, -6.629625,
-1, -3.841295, -6.327321,
-1, -4.014246, -6.629625,
0, -3.841295, -6.327321,
0, -4.014246, -6.629625,
1, -3.841295, -6.327321,
1, -4.014246, -6.629625,
2, -3.841295, -6.327321,
2, -4.014246, -6.629625,
3, -3.841295, -6.327321,
3, -4.014246, -6.629625
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
-2, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
-2, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
-2, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
-2, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5,
-1, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
-1, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
-1, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
-1, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5,
0, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
0, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
0, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
0, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5,
1, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
1, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
1, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
1, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5,
2, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
2, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
2, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
2, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5,
3, -4.360148, -7.234234, 0, -0.5, 0.5, 0.5,
3, -4.360148, -7.234234, 1, -0.5, 0.5, 0.5,
3, -4.360148, -7.234234, 1, 1.5, 0.5, 0.5,
3, -4.360148, -7.234234, 0, 1.5, 0.5, 0.5
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
-2.939772, -3, -6.327321,
-2.939772, 2, -6.327321,
-2.939772, -3, -6.327321,
-3.096068, -3, -6.629625,
-2.939772, -2, -6.327321,
-3.096068, -2, -6.629625,
-2.939772, -1, -6.327321,
-3.096068, -1, -6.629625,
-2.939772, 0, -6.327321,
-3.096068, 0, -6.629625,
-2.939772, 1, -6.327321,
-3.096068, 1, -6.629625,
-2.939772, 2, -6.327321,
-3.096068, 2, -6.629625
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
-3.408659, -3, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, -3, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, -3, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, -3, -7.234234, 0, 1.5, 0.5, 0.5,
-3.408659, -2, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, -2, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, -2, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, -2, -7.234234, 0, 1.5, 0.5, 0.5,
-3.408659, -1, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, -1, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, -1, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, -1, -7.234234, 0, 1.5, 0.5, 0.5,
-3.408659, 0, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, 0, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, 0, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, 0, -7.234234, 0, 1.5, 0.5, 0.5,
-3.408659, 1, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, 1, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, 1, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, 1, -7.234234, 0, 1.5, 0.5, 0.5,
-3.408659, 2, -7.234234, 0, -0.5, 0.5, 0.5,
-3.408659, 2, -7.234234, 1, -0.5, 0.5, 0.5,
-3.408659, 2, -7.234234, 1, 1.5, 0.5, 0.5,
-3.408659, 2, -7.234234, 0, 1.5, 0.5, 0.5
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
-2.939772, -3.841295, -6,
-2.939772, -3.841295, 4,
-2.939772, -3.841295, -6,
-3.096068, -4.014246, -6,
-2.939772, -3.841295, -4,
-3.096068, -4.014246, -4,
-2.939772, -3.841295, -2,
-3.096068, -4.014246, -2,
-2.939772, -3.841295, 0,
-3.096068, -4.014246, 0,
-2.939772, -3.841295, 2,
-3.096068, -4.014246, 2,
-2.939772, -3.841295, 4,
-3.096068, -4.014246, 4
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
-3.408659, -4.360148, -6, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -6, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -6, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, -6, 0, 1.5, 0.5, 0.5,
-3.408659, -4.360148, -4, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -4, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -4, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, -4, 0, 1.5, 0.5, 0.5,
-3.408659, -4.360148, -2, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -2, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, -2, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, -2, 0, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 0, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 0, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 0, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 0, 0, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 2, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 2, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 2, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 2, 0, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 4, 0, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 4, 1, -0.5, 0.5, 0.5,
-3.408659, -4.360148, 4, 1, 1.5, 0.5, 0.5,
-3.408659, -4.360148, 4, 0, 1.5, 0.5, 0.5
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
-2.939772, -3.841295, -6.327321,
-2.939772, 3.076735, -6.327321,
-2.939772, -3.841295, 5.764855,
-2.939772, 3.076735, 5.764855,
-2.939772, -3.841295, -6.327321,
-2.939772, -3.841295, 5.764855,
-2.939772, 3.076735, -6.327321,
-2.939772, 3.076735, 5.764855,
-2.939772, -3.841295, -6.327321,
3.312047, -3.841295, -6.327321,
-2.939772, -3.841295, 5.764855,
3.312047, -3.841295, 5.764855,
-2.939772, 3.076735, -6.327321,
3.312047, 3.076735, -6.327321,
-2.939772, 3.076735, 5.764855,
3.312047, 3.076735, 5.764855,
3.312047, -3.841295, -6.327321,
3.312047, 3.076735, -6.327321,
3.312047, -3.841295, 5.764855,
3.312047, 3.076735, 5.764855,
3.312047, -3.841295, -6.327321,
3.312047, -3.841295, 5.764855,
3.312047, 3.076735, -6.327321,
3.312047, 3.076735, 5.764855
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
var radius = 8.153748;
var distance = 36.27694;
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
mvMatrix.translate( -0.1861377, 0.38228, 0.2812328 );
mvMatrix.scale( 1.410148, 1.27435, 0.7290658 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.27694);
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
Stirofos<-read.table("Stirofos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Stirofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
```

```r
y<-Stirofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
```

```r
z<-Stirofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Stirofos' not found
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
-2.848726, 0.8624097, -1.323498, 0, 0, 1, 1, 1,
-2.806233, -0.676821, -1.907585, 1, 0, 0, 1, 1,
-2.767309, 0.9931942, -2.089554, 1, 0, 0, 1, 1,
-2.484659, 1.04163, -2.096718, 1, 0, 0, 1, 1,
-2.41585, -0.9850495, -2.394864, 1, 0, 0, 1, 1,
-2.292964, -0.3696809, -2.96771, 1, 0, 0, 1, 1,
-2.291563, -1.107701, -0.8770375, 0, 0, 0, 1, 1,
-2.235608, -0.6801787, -1.817735, 0, 0, 0, 1, 1,
-2.220283, -0.03588347, -0.9463407, 0, 0, 0, 1, 1,
-2.16768, 0.3397355, -1.601812, 0, 0, 0, 1, 1,
-2.122154, 1.815181, -1.656605, 0, 0, 0, 1, 1,
-2.082448, -1.011461, -0.1822096, 0, 0, 0, 1, 1,
-2.068019, -0.05198029, -1.466731, 0, 0, 0, 1, 1,
-2.065506, 0.6479739, -1.766438, 1, 1, 1, 1, 1,
-2.041193, -0.5752931, -1.318637, 1, 1, 1, 1, 1,
-2.025301, 2.509305, 0.2405505, 1, 1, 1, 1, 1,
-2.020912, 1.68531, 0.7074357, 1, 1, 1, 1, 1,
-1.991572, -0.382758, -0.4796053, 1, 1, 1, 1, 1,
-1.985225, -0.5946755, -0.8307906, 1, 1, 1, 1, 1,
-1.981542, -0.09426804, -1.201803, 1, 1, 1, 1, 1,
-1.954829, -0.2549416, -2.950344, 1, 1, 1, 1, 1,
-1.948551, -0.08709013, -1.178819, 1, 1, 1, 1, 1,
-1.909378, 0.5861441, -2.749056, 1, 1, 1, 1, 1,
-1.870932, -0.7436148, -0.8110799, 1, 1, 1, 1, 1,
-1.850739, 1.135658, -2.338321, 1, 1, 1, 1, 1,
-1.835625, 0.6377125, -2.060358, 1, 1, 1, 1, 1,
-1.832697, 1.710379, -2.242386, 1, 1, 1, 1, 1,
-1.789289, -0.6917505, -2.627, 1, 1, 1, 1, 1,
-1.762929, 0.8767567, -1.508082, 0, 0, 1, 1, 1,
-1.754849, 0.7251428, -0.8068476, 1, 0, 0, 1, 1,
-1.739665, 1.426597, 0.2431824, 1, 0, 0, 1, 1,
-1.729034, -0.3098798, -0.6041593, 1, 0, 0, 1, 1,
-1.727465, -0.3644874, -1.758682, 1, 0, 0, 1, 1,
-1.71911, 0.6965448, -2.192434, 1, 0, 0, 1, 1,
-1.692107, 0.894919, -2.03527, 0, 0, 0, 1, 1,
-1.689641, -1.088523, -1.35919, 0, 0, 0, 1, 1,
-1.681228, 1.701351, -0.9168971, 0, 0, 0, 1, 1,
-1.680724, -0.3328176, -1.188936, 0, 0, 0, 1, 1,
-1.679488, -2.11673, -1.756513, 0, 0, 0, 1, 1,
-1.660665, -0.7281394, -3.238137, 0, 0, 0, 1, 1,
-1.653371, -0.6467662, -1.763698, 0, 0, 0, 1, 1,
-1.640721, -1.704628, -1.525933, 1, 1, 1, 1, 1,
-1.63393, 1.574306, -1.12021, 1, 1, 1, 1, 1,
-1.621566, 1.562728, -2.598532, 1, 1, 1, 1, 1,
-1.619838, 1.372378, -1.65642, 1, 1, 1, 1, 1,
-1.616957, -0.4854645, -0.798314, 1, 1, 1, 1, 1,
-1.610494, 0.8079283, -0.1839207, 1, 1, 1, 1, 1,
-1.606647, 0.1852404, -2.762208, 1, 1, 1, 1, 1,
-1.597307, -0.05469992, -1.476683, 1, 1, 1, 1, 1,
-1.584645, 0.9669924, -1.961531, 1, 1, 1, 1, 1,
-1.561946, 0.9873829, -0.1782936, 1, 1, 1, 1, 1,
-1.55496, 0.1213951, -2.174844, 1, 1, 1, 1, 1,
-1.542776, -1.320306, -2.63684, 1, 1, 1, 1, 1,
-1.526797, 0.805446, -1.907158, 1, 1, 1, 1, 1,
-1.524681, -0.8032175, -3.083584, 1, 1, 1, 1, 1,
-1.51775, 0.4460061, -1.853004, 1, 1, 1, 1, 1,
-1.51767, -0.4296093, -3.625674, 0, 0, 1, 1, 1,
-1.513944, -0.5313388, -2.407614, 1, 0, 0, 1, 1,
-1.493444, -0.1832801, 0.1831389, 1, 0, 0, 1, 1,
-1.489967, 0.2111364, -1.127747, 1, 0, 0, 1, 1,
-1.489601, -0.3049344, -0.9085233, 1, 0, 0, 1, 1,
-1.485236, -0.006920577, -1.891064, 1, 0, 0, 1, 1,
-1.48141, 0.3291526, -1.692264, 0, 0, 0, 1, 1,
-1.47823, -0.1348923, -1.466385, 0, 0, 0, 1, 1,
-1.473843, 0.4270092, -0.5294949, 0, 0, 0, 1, 1,
-1.473419, 0.4508321, -0.5730001, 0, 0, 0, 1, 1,
-1.460613, 0.7161503, -1.994687, 0, 0, 0, 1, 1,
-1.457509, -0.7656717, -1.030436, 0, 0, 0, 1, 1,
-1.446926, -0.6270923, -3.467815, 0, 0, 0, 1, 1,
-1.416815, 0.4008157, -2.162327, 1, 1, 1, 1, 1,
-1.409483, -0.7636422, -0.3932551, 1, 1, 1, 1, 1,
-1.403125, 0.8080719, -0.5884839, 1, 1, 1, 1, 1,
-1.399049, 0.05150128, -0.501222, 1, 1, 1, 1, 1,
-1.392786, -0.1773844, -2.202086, 1, 1, 1, 1, 1,
-1.38682, 0.4023143, -2.509744, 1, 1, 1, 1, 1,
-1.378735, -1.520308, -0.4393202, 1, 1, 1, 1, 1,
-1.363322, 0.5941392, -0.9012491, 1, 1, 1, 1, 1,
-1.361787, -0.172406, -1.998696, 1, 1, 1, 1, 1,
-1.358114, 0.7377081, -0.2352291, 1, 1, 1, 1, 1,
-1.349377, -0.5189239, -2.660461, 1, 1, 1, 1, 1,
-1.335026, -0.54245, -1.882493, 1, 1, 1, 1, 1,
-1.334809, -0.2427298, -0.2135451, 1, 1, 1, 1, 1,
-1.325808, 0.4890825, -1.657454, 1, 1, 1, 1, 1,
-1.311108, -0.04849265, -0.7144765, 1, 1, 1, 1, 1,
-1.305857, -0.06045843, -0.9251639, 0, 0, 1, 1, 1,
-1.302905, -1.585525, -2.5526, 1, 0, 0, 1, 1,
-1.295129, 0.8915796, -0.5528647, 1, 0, 0, 1, 1,
-1.294195, 0.2594872, -0.4337544, 1, 0, 0, 1, 1,
-1.274876, 0.8851808, -1.525817, 1, 0, 0, 1, 1,
-1.272302, 0.9326689, -0.983803, 1, 0, 0, 1, 1,
-1.271677, -1.411857, -1.851429, 0, 0, 0, 1, 1,
-1.270374, 0.5381433, -1.203413, 0, 0, 0, 1, 1,
-1.269998, 0.7914375, 0.04271097, 0, 0, 0, 1, 1,
-1.268836, 0.2654529, -0.8955756, 0, 0, 0, 1, 1,
-1.257012, 0.2114607, -1.509752, 0, 0, 0, 1, 1,
-1.249372, 0.4127696, -1.06816, 0, 0, 0, 1, 1,
-1.226146, 1.30668, -1.981889, 0, 0, 0, 1, 1,
-1.221339, 0.5234838, -2.009441, 1, 1, 1, 1, 1,
-1.213963, 0.2641927, -2.229884, 1, 1, 1, 1, 1,
-1.207141, -1.67838, -2.832692, 1, 1, 1, 1, 1,
-1.207136, 1.538909, -0.3150771, 1, 1, 1, 1, 1,
-1.176048, -0.8614188, -3.068946, 1, 1, 1, 1, 1,
-1.17582, -0.9650895, -3.465594, 1, 1, 1, 1, 1,
-1.175178, -0.0470574, -1.1669, 1, 1, 1, 1, 1,
-1.160969, 0.05058753, -1.817, 1, 1, 1, 1, 1,
-1.156055, 1.533689, -1.511127, 1, 1, 1, 1, 1,
-1.151118, 0.1780663, -0.2042907, 1, 1, 1, 1, 1,
-1.150437, -0.4349077, -2.737142, 1, 1, 1, 1, 1,
-1.147844, -2.459818, -2.825333, 1, 1, 1, 1, 1,
-1.147685, 0.07086261, -1.953671, 1, 1, 1, 1, 1,
-1.145372, -0.02992461, -3.071761, 1, 1, 1, 1, 1,
-1.136888, 1.048539, -2.180045, 1, 1, 1, 1, 1,
-1.135761, -3.037272, -2.331698, 0, 0, 1, 1, 1,
-1.12773, 1.57385, -1.010352, 1, 0, 0, 1, 1,
-1.125618, 0.1528006, -0.0143605, 1, 0, 0, 1, 1,
-1.124524, 0.7973956, -0.37384, 1, 0, 0, 1, 1,
-1.113847, -0.1289085, -1.816648, 1, 0, 0, 1, 1,
-1.112455, 0.9673279, 0.2120026, 1, 0, 0, 1, 1,
-1.108811, -0.5600957, -4.642139, 0, 0, 0, 1, 1,
-1.108239, -0.9722847, -2.69281, 0, 0, 0, 1, 1,
-1.098021, 0.5857965, -0.2576972, 0, 0, 0, 1, 1,
-1.091012, -1.730428, -2.984614, 0, 0, 0, 1, 1,
-1.089642, 1.805077, -2.075387, 0, 0, 0, 1, 1,
-1.087366, 0.8968136, -1.258938, 0, 0, 0, 1, 1,
-1.072584, -0.02773765, -2.536616, 0, 0, 0, 1, 1,
-1.072477, 0.005728797, -0.9636461, 1, 1, 1, 1, 1,
-1.05599, 0.8253694, -1.17599, 1, 1, 1, 1, 1,
-1.050522, 0.4934761, -1.066812, 1, 1, 1, 1, 1,
-1.049442, 0.7463329, -0.5377727, 1, 1, 1, 1, 1,
-1.043803, -1.28422, -0.6650611, 1, 1, 1, 1, 1,
-1.041658, -0.7157509, -2.393437, 1, 1, 1, 1, 1,
-1.039819, -0.2602254, -2.111648, 1, 1, 1, 1, 1,
-1.035447, -0.08438919, -2.890814, 1, 1, 1, 1, 1,
-1.027643, 0.4311778, 0.8237296, 1, 1, 1, 1, 1,
-1.026776, 0.3465834, -1.210842, 1, 1, 1, 1, 1,
-1.026425, -0.2283321, -1.704141, 1, 1, 1, 1, 1,
-1.019886, 1.912381, 0.876358, 1, 1, 1, 1, 1,
-1.016202, -1.324971, -2.265522, 1, 1, 1, 1, 1,
-1.010775, -0.05656896, -0.1498355, 1, 1, 1, 1, 1,
-0.9975438, 0.9999912, -1.944591, 1, 1, 1, 1, 1,
-0.9828848, -0.9296426, -2.252487, 0, 0, 1, 1, 1,
-0.9793288, -1.240613, -2.889669, 1, 0, 0, 1, 1,
-0.9785137, -1.245884, -2.599976, 1, 0, 0, 1, 1,
-0.9741018, 0.876128, 0.3342409, 1, 0, 0, 1, 1,
-0.963266, 0.2204193, -2.433161, 1, 0, 0, 1, 1,
-0.9608699, 0.4727057, -2.288897, 1, 0, 0, 1, 1,
-0.9599497, -0.1228283, -1.437823, 0, 0, 0, 1, 1,
-0.9584031, 0.2609169, -0.2556261, 0, 0, 0, 1, 1,
-0.9542494, 1.03748, 0.05128635, 0, 0, 0, 1, 1,
-0.9487482, -0.3216277, -2.697109, 0, 0, 0, 1, 1,
-0.9408945, -1.105241, -2.383641, 0, 0, 0, 1, 1,
-0.9399865, 1.221888, -1.549189, 0, 0, 0, 1, 1,
-0.9394307, -1.847516, -1.733277, 0, 0, 0, 1, 1,
-0.9381385, -1.278645, -3.058035, 1, 1, 1, 1, 1,
-0.9380815, -0.1873826, -1.991567, 1, 1, 1, 1, 1,
-0.9298032, 0.5103043, -1.466766, 1, 1, 1, 1, 1,
-0.9250431, 2.252258, -1.434615, 1, 1, 1, 1, 1,
-0.9182159, -0.2502277, -0.6331261, 1, 1, 1, 1, 1,
-0.9120717, 0.525661, -1.858539, 1, 1, 1, 1, 1,
-0.9098298, -0.9540877, -1.557374, 1, 1, 1, 1, 1,
-0.9028925, -0.01539914, -1.766222, 1, 1, 1, 1, 1,
-0.9005368, 1.455087, -0.2662771, 1, 1, 1, 1, 1,
-0.8992391, 0.04398542, -0.6896755, 1, 1, 1, 1, 1,
-0.893477, -0.01038882, -1.870642, 1, 1, 1, 1, 1,
-0.8924106, -0.1144465, -2.143282, 1, 1, 1, 1, 1,
-0.8909305, -0.4930982, -2.624333, 1, 1, 1, 1, 1,
-0.8892104, 0.2586561, -2.749653, 1, 1, 1, 1, 1,
-0.8891293, 0.7096097, -1.842818, 1, 1, 1, 1, 1,
-0.88866, 0.929238, -1.084089, 0, 0, 1, 1, 1,
-0.8743145, -0.1887584, -1.804094, 1, 0, 0, 1, 1,
-0.873316, 1.878485, 1.445953, 1, 0, 0, 1, 1,
-0.869978, 0.803173, -0.9158514, 1, 0, 0, 1, 1,
-0.866004, 1.013088, -1.565095, 1, 0, 0, 1, 1,
-0.8641613, -0.3576863, -2.132208, 1, 0, 0, 1, 1,
-0.86178, 0.2638538, -2.614901, 0, 0, 0, 1, 1,
-0.8505657, -1.669386, -2.724852, 0, 0, 0, 1, 1,
-0.8426256, -0.8563445, -1.20552, 0, 0, 0, 1, 1,
-0.842568, -0.4011534, -2.391662, 0, 0, 0, 1, 1,
-0.8250245, -0.4261997, -1.771619, 0, 0, 0, 1, 1,
-0.8241296, 0.4941948, -0.4105872, 0, 0, 0, 1, 1,
-0.8230196, -0.3539444, -2.171979, 0, 0, 0, 1, 1,
-0.8168781, -0.7295229, -1.345612, 1, 1, 1, 1, 1,
-0.8043808, 0.5140617, 1.438751, 1, 1, 1, 1, 1,
-0.8043197, 1.31351, -0.3064499, 1, 1, 1, 1, 1,
-0.802185, 0.6110184, -0.7001492, 1, 1, 1, 1, 1,
-0.8005996, -0.4748084, -3.811556, 1, 1, 1, 1, 1,
-0.8001543, 1.266889, -0.5416813, 1, 1, 1, 1, 1,
-0.7990378, -1.104383, -2.416283, 1, 1, 1, 1, 1,
-0.7920561, 0.1789411, -1.21456, 1, 1, 1, 1, 1,
-0.791231, 0.7643404, 0.7298303, 1, 1, 1, 1, 1,
-0.7904198, -1.798893, -3.790599, 1, 1, 1, 1, 1,
-0.7892848, -1.916235, -2.722948, 1, 1, 1, 1, 1,
-0.7880833, -1.790172, -3.044295, 1, 1, 1, 1, 1,
-0.7802534, 0.3007933, -2.17209, 1, 1, 1, 1, 1,
-0.7800695, 0.7416008, -3.008732, 1, 1, 1, 1, 1,
-0.7733154, 0.3231967, -1.676777, 1, 1, 1, 1, 1,
-0.7722613, -1.176134, -3.025075, 0, 0, 1, 1, 1,
-0.7713005, -0.918654, -3.9328, 1, 0, 0, 1, 1,
-0.7707192, -2.536011, -4.038558, 1, 0, 0, 1, 1,
-0.7671599, 0.828687, -0.1334721, 1, 0, 0, 1, 1,
-0.7648668, -0.8515588, -2.685511, 1, 0, 0, 1, 1,
-0.762969, 0.06811143, -0.875781, 1, 0, 0, 1, 1,
-0.7576167, -0.6226672, 0.05200199, 0, 0, 0, 1, 1,
-0.7551123, -1.274504, -2.177632, 0, 0, 0, 1, 1,
-0.7471595, -2.003003, -3.169635, 0, 0, 0, 1, 1,
-0.7368472, -0.09256439, 0.07359547, 0, 0, 0, 1, 1,
-0.7365724, -0.3278673, -0.8373704, 0, 0, 0, 1, 1,
-0.7259773, 0.4031967, -1.606578, 0, 0, 0, 1, 1,
-0.7246242, -0.9200398, -1.063016, 0, 0, 0, 1, 1,
-0.7235379, 1.010349, -0.2920419, 1, 1, 1, 1, 1,
-0.7211028, 0.03488891, -3.564766, 1, 1, 1, 1, 1,
-0.7188681, 0.4809822, -0.4218832, 1, 1, 1, 1, 1,
-0.7133498, -0.735375, -2.167715, 1, 1, 1, 1, 1,
-0.7120084, 0.1225895, 0.02092995, 1, 1, 1, 1, 1,
-0.705514, 0.9567457, -1.456207, 1, 1, 1, 1, 1,
-0.7020903, 1.44178, -0.1623227, 1, 1, 1, 1, 1,
-0.7013506, -1.133123, -1.26816, 1, 1, 1, 1, 1,
-0.6967406, 0.2678628, -1.587422, 1, 1, 1, 1, 1,
-0.6959384, -0.9330968, -2.945469, 1, 1, 1, 1, 1,
-0.6958809, -0.3437985, -2.135831, 1, 1, 1, 1, 1,
-0.6878151, -0.2872981, -3.695027, 1, 1, 1, 1, 1,
-0.6797357, -0.7330434, -5.466887, 1, 1, 1, 1, 1,
-0.6788487, 0.007015373, -1.452167, 1, 1, 1, 1, 1,
-0.6766596, 0.63932, -0.2974893, 1, 1, 1, 1, 1,
-0.6735958, -0.2822057, -2.548731, 0, 0, 1, 1, 1,
-0.6732658, 1.249699, -1.001079, 1, 0, 0, 1, 1,
-0.6673821, -1.069554, -2.0973, 1, 0, 0, 1, 1,
-0.6659364, 0.2237134, -0.9986615, 1, 0, 0, 1, 1,
-0.6645554, 0.5423697, -2.550472, 1, 0, 0, 1, 1,
-0.6505494, 1.310985, -1.430899, 1, 0, 0, 1, 1,
-0.6501855, 0.5669284, 0.02609354, 0, 0, 0, 1, 1,
-0.6473926, 0.5881658, 0.1365826, 0, 0, 0, 1, 1,
-0.6468223, 1.229484, -0.5929553, 0, 0, 0, 1, 1,
-0.6428993, 0.3462886, -0.7659515, 0, 0, 0, 1, 1,
-0.641001, -0.147096, -0.06232195, 0, 0, 0, 1, 1,
-0.6399686, 0.5456725, -1.385193, 0, 0, 0, 1, 1,
-0.6372223, 0.1231901, -2.985294, 0, 0, 0, 1, 1,
-0.6364307, -1.34354, -3.656049, 1, 1, 1, 1, 1,
-0.6353368, 0.09885757, -2.180946, 1, 1, 1, 1, 1,
-0.6337201, -0.4789118, -1.868596, 1, 1, 1, 1, 1,
-0.6330704, 2.708697, 0.9709849, 1, 1, 1, 1, 1,
-0.632941, -0.6390342, -2.820512, 1, 1, 1, 1, 1,
-0.6314863, -0.04717365, -1.413377, 1, 1, 1, 1, 1,
-0.6299553, -1.353099, -3.189118, 1, 1, 1, 1, 1,
-0.6295477, 0.3729746, 0.1358751, 1, 1, 1, 1, 1,
-0.628249, 0.9826465, 0.184806, 1, 1, 1, 1, 1,
-0.6277223, -1.1969, -1.546984, 1, 1, 1, 1, 1,
-0.6275615, -1.922791, -4.191157, 1, 1, 1, 1, 1,
-0.6233259, -0.761004, -2.545535, 1, 1, 1, 1, 1,
-0.6212576, -0.1316706, -2.773, 1, 1, 1, 1, 1,
-0.6200075, -1.883142, -2.191658, 1, 1, 1, 1, 1,
-0.6194412, 0.6982878, -1.861196, 1, 1, 1, 1, 1,
-0.6193222, -0.4174591, -2.380117, 0, 0, 1, 1, 1,
-0.6182578, 0.4727191, -1.702199, 1, 0, 0, 1, 1,
-0.617599, -0.2523341, -3.319086, 1, 0, 0, 1, 1,
-0.6108531, -0.4537441, -1.024803, 1, 0, 0, 1, 1,
-0.6102272, 1.820421, -0.3109343, 1, 0, 0, 1, 1,
-0.600478, -1.594675, -3.712081, 1, 0, 0, 1, 1,
-0.5998145, 0.5012487, -0.9858882, 0, 0, 0, 1, 1,
-0.5990504, 1.198515, 0.3445006, 0, 0, 0, 1, 1,
-0.5940081, 0.3425879, -1.799316, 0, 0, 0, 1, 1,
-0.5914934, 1.624764, -0.6075594, 0, 0, 0, 1, 1,
-0.5910311, 0.7053061, -1.092118, 0, 0, 0, 1, 1,
-0.5896056, -0.4809063, -3.241566, 0, 0, 0, 1, 1,
-0.5873431, 0.3261282, -1.760321, 0, 0, 0, 1, 1,
-0.5859572, 0.6973481, -0.2559159, 1, 1, 1, 1, 1,
-0.5842429, 0.1132057, -1.217581, 1, 1, 1, 1, 1,
-0.5814376, -0.4019615, -0.07245719, 1, 1, 1, 1, 1,
-0.5768036, -0.6617908, -1.375384, 1, 1, 1, 1, 1,
-0.5734794, 0.6246061, -0.7834272, 1, 1, 1, 1, 1,
-0.5696163, -1.911952, -3.040926, 1, 1, 1, 1, 1,
-0.5637732, -1.019897, -2.163626, 1, 1, 1, 1, 1,
-0.5610154, -0.4706711, -2.339348, 1, 1, 1, 1, 1,
-0.5569624, 0.1491922, -2.585205, 1, 1, 1, 1, 1,
-0.5562249, 0.8915446, -1.217753, 1, 1, 1, 1, 1,
-0.5561073, -0.6782452, -1.884014, 1, 1, 1, 1, 1,
-0.5537238, 1.154653, -1.638312, 1, 1, 1, 1, 1,
-0.5535155, -0.2023722, -3.324132, 1, 1, 1, 1, 1,
-0.5494769, 2.174172, -1.153751, 1, 1, 1, 1, 1,
-0.5456371, 1.58739, 0.3732934, 1, 1, 1, 1, 1,
-0.5434009, 1.29598, -0.1956666, 0, 0, 1, 1, 1,
-0.5427734, -2.309886, -4.833826, 1, 0, 0, 1, 1,
-0.5421177, 0.895694, -0.5745549, 1, 0, 0, 1, 1,
-0.5408701, 0.5279257, 0.7824037, 1, 0, 0, 1, 1,
-0.5393009, 1.225918, -2.726069, 1, 0, 0, 1, 1,
-0.535298, -0.8106983, -3.507974, 1, 0, 0, 1, 1,
-0.5344723, 1.289553, 0.4653823, 0, 0, 0, 1, 1,
-0.5216824, 1.757968, -0.8892764, 0, 0, 0, 1, 1,
-0.5149112, 0.2379419, -1.763139, 0, 0, 0, 1, 1,
-0.5147898, -0.0290259, -2.790328, 0, 0, 0, 1, 1,
-0.5142613, -1.407807, -6.151221, 0, 0, 0, 1, 1,
-0.5131599, 0.4617266, -2.275443, 0, 0, 0, 1, 1,
-0.5097513, -0.5884994, -2.265859, 0, 0, 0, 1, 1,
-0.5066747, 1.362561, -2.116867, 1, 1, 1, 1, 1,
-0.505767, 0.8490735, -0.3385836, 1, 1, 1, 1, 1,
-0.5011727, -0.1557978, -0.8065408, 1, 1, 1, 1, 1,
-0.4975954, 0.1023264, -2.230597, 1, 1, 1, 1, 1,
-0.4894124, -0.8648428, -3.217017, 1, 1, 1, 1, 1,
-0.488839, 0.3112765, -0.7661155, 1, 1, 1, 1, 1,
-0.4860703, 0.1526168, -0.1277404, 1, 1, 1, 1, 1,
-0.4818558, 0.1905183, -0.1837722, 1, 1, 1, 1, 1,
-0.4813254, -0.3577852, -3.093697, 1, 1, 1, 1, 1,
-0.476207, -0.4097126, -1.667132, 1, 1, 1, 1, 1,
-0.4762009, 2.098479, 0.35943, 1, 1, 1, 1, 1,
-0.4747124, -1.574795, -2.041426, 1, 1, 1, 1, 1,
-0.4708846, 0.6899211, 0.8085755, 1, 1, 1, 1, 1,
-0.4693229, 0.2218538, -1.320115, 1, 1, 1, 1, 1,
-0.4666918, 1.511151, -0.5281969, 1, 1, 1, 1, 1,
-0.464723, -0.7388204, -2.885126, 0, 0, 1, 1, 1,
-0.4633556, 2.244625, 0.6124349, 1, 0, 0, 1, 1,
-0.4628195, -0.01520968, -2.031822, 1, 0, 0, 1, 1,
-0.4583534, -0.08852813, -2.100817, 1, 0, 0, 1, 1,
-0.4533393, 1.195636, -0.2665625, 1, 0, 0, 1, 1,
-0.4473604, -1.442248, -2.631546, 1, 0, 0, 1, 1,
-0.4469315, -0.641289, -2.266072, 0, 0, 0, 1, 1,
-0.4457196, -0.08405732, -0.788458, 0, 0, 0, 1, 1,
-0.4431818, 0.6232358, -0.7262799, 0, 0, 0, 1, 1,
-0.4401985, 1.557076, -1.68551, 0, 0, 0, 1, 1,
-0.4278639, -1.203266, -2.857495, 0, 0, 0, 1, 1,
-0.42205, -0.5775145, -0.8491123, 0, 0, 0, 1, 1,
-0.4187739, -1.187793, -2.003645, 0, 0, 0, 1, 1,
-0.4163526, 0.7476934, -0.7640948, 1, 1, 1, 1, 1,
-0.4152653, 0.4620971, -2.263755, 1, 1, 1, 1, 1,
-0.4148691, 0.08374717, -2.132244, 1, 1, 1, 1, 1,
-0.4134779, -1.206143, -3.51512, 1, 1, 1, 1, 1,
-0.4133308, -0.2969396, -1.767268, 1, 1, 1, 1, 1,
-0.4081442, 0.9624442, 0.9431855, 1, 1, 1, 1, 1,
-0.4081159, -1.68732, -1.849, 1, 1, 1, 1, 1,
-0.404218, -0.5719906, -2.9123, 1, 1, 1, 1, 1,
-0.3994445, 0.9307016, -2.720265, 1, 1, 1, 1, 1,
-0.3967433, 1.05498, 1.505501, 1, 1, 1, 1, 1,
-0.3951659, -1.282395, -3.556393, 1, 1, 1, 1, 1,
-0.3946603, -0.4383804, -2.622068, 1, 1, 1, 1, 1,
-0.3860639, 0.3390786, -0.2606449, 1, 1, 1, 1, 1,
-0.3793168, 0.9267737, -0.9956962, 1, 1, 1, 1, 1,
-0.3785444, 0.03104499, -1.32609, 1, 1, 1, 1, 1,
-0.3785051, 0.8789027, 1.304269, 0, 0, 1, 1, 1,
-0.378272, 0.597814, -1.201775, 1, 0, 0, 1, 1,
-0.3727886, 1.260518, -0.4141212, 1, 0, 0, 1, 1,
-0.3714132, 0.5764101, 0.750297, 1, 0, 0, 1, 1,
-0.3706195, -0.1128747, -3.029984, 1, 0, 0, 1, 1,
-0.3695722, -2.672602, -2.685789, 1, 0, 0, 1, 1,
-0.3628971, -1.380011, -1.303327, 0, 0, 0, 1, 1,
-0.3623988, 0.1647642, -1.949485, 0, 0, 0, 1, 1,
-0.3611669, 1.661175, 0.4808477, 0, 0, 0, 1, 1,
-0.3605421, 0.7072471, -0.04348243, 0, 0, 0, 1, 1,
-0.358214, -1.376451, -1.797803, 0, 0, 0, 1, 1,
-0.3489547, 1.005567, -1.781744, 0, 0, 0, 1, 1,
-0.3489133, -0.1758146, -0.182224, 0, 0, 0, 1, 1,
-0.3485578, 1.097815, 0.6115443, 1, 1, 1, 1, 1,
-0.3471154, -0.002121445, -0.9470541, 1, 1, 1, 1, 1,
-0.3456706, -0.6673386, -2.129757, 1, 1, 1, 1, 1,
-0.3432038, -0.278437, -0.3337375, 1, 1, 1, 1, 1,
-0.3418772, 0.2243679, -2.119023, 1, 1, 1, 1, 1,
-0.3402042, -1.082537, -3.638125, 1, 1, 1, 1, 1,
-0.3382304, 0.4631375, 1.186167, 1, 1, 1, 1, 1,
-0.3369129, -1.582824, -3.570909, 1, 1, 1, 1, 1,
-0.3343429, -1.796341, -2.158504, 1, 1, 1, 1, 1,
-0.3318889, -0.05762057, -1.020732, 1, 1, 1, 1, 1,
-0.3276119, -0.4950325, -3.396857, 1, 1, 1, 1, 1,
-0.3269989, 0.64562, -0.9813538, 1, 1, 1, 1, 1,
-0.3243147, 0.2839116, -2.279806, 1, 1, 1, 1, 1,
-0.3242603, 0.3998921, -1.703584, 1, 1, 1, 1, 1,
-0.3237712, 1.627745, -0.5687904, 1, 1, 1, 1, 1,
-0.3223405, -2.253492, -2.378235, 0, 0, 1, 1, 1,
-0.3222354, 1.262396, -1.101397, 1, 0, 0, 1, 1,
-0.3208891, -0.1025851, -1.347833, 1, 0, 0, 1, 1,
-0.3181877, -0.593853, -2.059285, 1, 0, 0, 1, 1,
-0.3129078, -1.210175, -2.255564, 1, 0, 0, 1, 1,
-0.3109507, -0.8591951, -4.35176, 1, 0, 0, 1, 1,
-0.3095298, 0.7346298, -1.643176, 0, 0, 0, 1, 1,
-0.3060388, 2.110883, -0.3881524, 0, 0, 0, 1, 1,
-0.3052728, 0.09746282, -0.7619613, 0, 0, 0, 1, 1,
-0.2989153, 1.256192, -0.2760708, 0, 0, 0, 1, 1,
-0.298605, -0.4961024, -1.329943, 0, 0, 0, 1, 1,
-0.2975876, 0.4736691, -1.756318, 0, 0, 0, 1, 1,
-0.2938654, 0.6146474, 0.9154559, 0, 0, 0, 1, 1,
-0.2938243, 0.9319746, 0.9120066, 1, 1, 1, 1, 1,
-0.2930217, -0.6937546, -0.5821322, 1, 1, 1, 1, 1,
-0.2898891, 0.223407, -1.353437, 1, 1, 1, 1, 1,
-0.2874064, 1.198965, 0.5012116, 1, 1, 1, 1, 1,
-0.2853741, 0.5522245, 0.2211079, 1, 1, 1, 1, 1,
-0.2794472, 1.934971, 1.395787, 1, 1, 1, 1, 1,
-0.2783097, -0.7887474, -3.118947, 1, 1, 1, 1, 1,
-0.2778456, -0.6971581, -4.216506, 1, 1, 1, 1, 1,
-0.2762402, -1.207681, -2.596082, 1, 1, 1, 1, 1,
-0.2741003, -1.288402, -1.239845, 1, 1, 1, 1, 1,
-0.2714164, -1.759707, -2.979154, 1, 1, 1, 1, 1,
-0.2706193, 1.229278, 1.100555, 1, 1, 1, 1, 1,
-0.2693704, -0.6988803, -4.104104, 1, 1, 1, 1, 1,
-0.2664934, -1.39077, -2.929962, 1, 1, 1, 1, 1,
-0.2590894, 0.9688663, -0.3563406, 1, 1, 1, 1, 1,
-0.2570157, 1.645422, -0.8828189, 0, 0, 1, 1, 1,
-0.2532248, 0.5254298, -1.850946, 1, 0, 0, 1, 1,
-0.2525186, 0.1638391, -1.384215, 1, 0, 0, 1, 1,
-0.2473344, 0.9993812, 0.1011876, 1, 0, 0, 1, 1,
-0.2470228, 0.1338997, -1.216325, 1, 0, 0, 1, 1,
-0.2462926, -0.4004348, -1.608551, 1, 0, 0, 1, 1,
-0.2378698, -0.5611519, -3.002548, 0, 0, 0, 1, 1,
-0.2349179, 1.996599, -0.6042376, 0, 0, 0, 1, 1,
-0.2318851, -0.09092744, -1.827884, 0, 0, 0, 1, 1,
-0.2291926, 0.6131316, 0.05162701, 0, 0, 0, 1, 1,
-0.2248773, -0.9461167, -1.181196, 0, 0, 0, 1, 1,
-0.2242858, -0.8417072, -4.398241, 0, 0, 0, 1, 1,
-0.2170979, -0.5404566, -3.7328, 0, 0, 0, 1, 1,
-0.2161623, 0.8781143, 0.8451428, 1, 1, 1, 1, 1,
-0.2152531, -1.610226, -1.828032, 1, 1, 1, 1, 1,
-0.2126343, 0.3154616, -1.261398, 1, 1, 1, 1, 1,
-0.2116336, 0.7276617, 0.6599689, 1, 1, 1, 1, 1,
-0.209425, -0.7197024, -4.091233, 1, 1, 1, 1, 1,
-0.2092287, 0.4214208, -2.225496, 1, 1, 1, 1, 1,
-0.2089566, 1.891343, 0.02905307, 1, 1, 1, 1, 1,
-0.2017169, -1.319928, -2.726396, 1, 1, 1, 1, 1,
-0.1935018, -1.873092, -4.211799, 1, 1, 1, 1, 1,
-0.1893671, 1.347929, -1.790074, 1, 1, 1, 1, 1,
-0.188566, -0.2694714, -3.578379, 1, 1, 1, 1, 1,
-0.1884207, 0.5224882, -1.085252, 1, 1, 1, 1, 1,
-0.1869062, 0.7821987, -2.52645, 1, 1, 1, 1, 1,
-0.1840248, 1.194199, -0.03498416, 1, 1, 1, 1, 1,
-0.180666, 0.2444951, -1.636179, 1, 1, 1, 1, 1,
-0.1792474, -2.744559, -1.89043, 0, 0, 1, 1, 1,
-0.1786771, 1.014403, -0.4665653, 1, 0, 0, 1, 1,
-0.1783806, 0.7628044, 0.04138829, 1, 0, 0, 1, 1,
-0.1750992, 1.005886, -0.5094211, 1, 0, 0, 1, 1,
-0.1724468, -0.4610953, -1.885204, 1, 0, 0, 1, 1,
-0.1702392, 0.6393917, -0.9802994, 1, 0, 0, 1, 1,
-0.1686998, -0.202669, -1.382403, 0, 0, 0, 1, 1,
-0.1638353, 0.7703905, 1.576826, 0, 0, 0, 1, 1,
-0.159995, -1.217157, -1.783136, 0, 0, 0, 1, 1,
-0.1596385, 1.243042, 0.799941, 0, 0, 0, 1, 1,
-0.1545134, -0.9268743, -1.110483, 0, 0, 0, 1, 1,
-0.1515506, -0.8248346, -1.301376, 0, 0, 0, 1, 1,
-0.1499873, 0.2511849, -0.6584101, 0, 0, 0, 1, 1,
-0.1438282, 0.2145755, -1.216152, 1, 1, 1, 1, 1,
-0.1435892, -1.213067, -0.6272247, 1, 1, 1, 1, 1,
-0.1415934, 1.344141, -0.6746253, 1, 1, 1, 1, 1,
-0.13532, -1.912297, -4.29477, 1, 1, 1, 1, 1,
-0.1342448, 0.8751341, -0.5613726, 1, 1, 1, 1, 1,
-0.1319339, 0.6613378, -1.038179, 1, 1, 1, 1, 1,
-0.1289534, -1.305116, -1.41451, 1, 1, 1, 1, 1,
-0.1281582, 0.1442494, -0.02473893, 1, 1, 1, 1, 1,
-0.116309, -0.370899, -4.300368, 1, 1, 1, 1, 1,
-0.1093462, -1.12899, -2.232919, 1, 1, 1, 1, 1,
-0.107663, -0.483562, -5.438238, 1, 1, 1, 1, 1,
-0.1065163, -1.626903, -2.093216, 1, 1, 1, 1, 1,
-0.1061266, -0.867348, -4.370359, 1, 1, 1, 1, 1,
-0.1038389, 0.4586907, -0.4632063, 1, 1, 1, 1, 1,
-0.1035071, -0.2795386, -3.188495, 1, 1, 1, 1, 1,
-0.1027723, 0.1999011, 0.5616541, 0, 0, 1, 1, 1,
-0.1023457, 0.4600354, 0.6124073, 1, 0, 0, 1, 1,
-0.09746407, 0.05600439, -1.793218, 1, 0, 0, 1, 1,
-0.093393, -1.615365, -2.843528, 1, 0, 0, 1, 1,
-0.0924596, -1.361717, -2.380018, 1, 0, 0, 1, 1,
-0.09174138, 0.4029115, 0.5677822, 1, 0, 0, 1, 1,
-0.08936606, 0.2720305, 0.2805547, 0, 0, 0, 1, 1,
-0.08900764, -1.203171, -3.763664, 0, 0, 0, 1, 1,
-0.08193097, -0.1587567, -2.290001, 0, 0, 0, 1, 1,
-0.07838279, -0.2336682, -2.375079, 0, 0, 0, 1, 1,
-0.07698999, -2.271977, -2.077786, 0, 0, 0, 1, 1,
-0.07513082, 0.4438076, -1.15688, 0, 0, 0, 1, 1,
-0.07132376, 0.6694146, 0.2243145, 0, 0, 0, 1, 1,
-0.06869122, 1.395492, 0.9160845, 1, 1, 1, 1, 1,
-0.0644834, -0.1709523, -2.982188, 1, 1, 1, 1, 1,
-0.05220513, -0.6175197, -3.533026, 1, 1, 1, 1, 1,
-0.05030369, -1.029761, -1.543223, 1, 1, 1, 1, 1,
-0.04951933, 0.4159094, -1.294311, 1, 1, 1, 1, 1,
-0.04688992, -1.81312, -4.093093, 1, 1, 1, 1, 1,
-0.04279735, -2.897185, -3.528531, 1, 1, 1, 1, 1,
-0.04239593, -1.047333, -4.763594, 1, 1, 1, 1, 1,
-0.04112698, -1.520113, -2.234637, 1, 1, 1, 1, 1,
-0.03998972, 1.319528, 0.8117151, 1, 1, 1, 1, 1,
-0.03959334, -0.0001715874, -0.9563437, 1, 1, 1, 1, 1,
-0.03922804, -0.2643164, -1.409451, 1, 1, 1, 1, 1,
-0.03706357, 0.6243187, -0.3361814, 1, 1, 1, 1, 1,
-0.03232845, -0.1446094, -2.463179, 1, 1, 1, 1, 1,
-0.02446887, 0.2472442, -0.7938273, 1, 1, 1, 1, 1,
-0.02101091, 0.8194203, -0.4078994, 0, 0, 1, 1, 1,
-0.01874472, 0.5265477, 1.67356, 1, 0, 0, 1, 1,
-0.01655582, 1.958287, 2.282689, 1, 0, 0, 1, 1,
-0.01165831, 0.1824896, 0.2353426, 1, 0, 0, 1, 1,
-0.009820178, 0.7361851, 0.1802867, 1, 0, 0, 1, 1,
-0.007977426, -0.4156222, -4.978451, 1, 0, 0, 1, 1,
-0.006345131, -1.803958, -2.422473, 0, 0, 0, 1, 1,
-0.004953129, 0.4320055, -1.179908, 0, 0, 0, 1, 1,
-0.002628079, 0.1660294, 1.762459, 0, 0, 0, 1, 1,
0.005507313, -0.003114845, 0.727365, 0, 0, 0, 1, 1,
0.006101604, -0.8083329, 4.385885, 0, 0, 0, 1, 1,
0.007698332, 0.222366, 0.3129433, 0, 0, 0, 1, 1,
0.007932237, -0.01962153, 3.010687, 0, 0, 0, 1, 1,
0.01284152, 0.6839643, -0.3106056, 1, 1, 1, 1, 1,
0.01609841, 1.889762, 0.5033392, 1, 1, 1, 1, 1,
0.0210444, 0.4375555, -0.7520676, 1, 1, 1, 1, 1,
0.02113947, 0.9906498, 1.427204, 1, 1, 1, 1, 1,
0.02748267, -0.4918176, 1.980922, 1, 1, 1, 1, 1,
0.02895739, -0.2294062, 1.175951, 1, 1, 1, 1, 1,
0.04194517, 1.242574, -0.2729918, 1, 1, 1, 1, 1,
0.04336293, 0.8539761, -0.1555453, 1, 1, 1, 1, 1,
0.04552232, -0.4361856, 3.410447, 1, 1, 1, 1, 1,
0.05041251, -1.929269, 4.30826, 1, 1, 1, 1, 1,
0.05085902, -1.681752, 4.058048, 1, 1, 1, 1, 1,
0.05132556, 0.08746231, 0.5881446, 1, 1, 1, 1, 1,
0.05364908, -0.6800867, 3.392121, 1, 1, 1, 1, 1,
0.05625104, 0.6195518, -0.940302, 1, 1, 1, 1, 1,
0.05943581, 1.471955, -0.3212509, 1, 1, 1, 1, 1,
0.05955382, -0.8199738, 4.649785, 0, 0, 1, 1, 1,
0.06080353, -0.09431583, 2.103599, 1, 0, 0, 1, 1,
0.06190126, 1.497984, 0.3755566, 1, 0, 0, 1, 1,
0.06861739, 0.4077983, 0.1634393, 1, 0, 0, 1, 1,
0.07192077, 0.3458901, 0.6318964, 1, 0, 0, 1, 1,
0.07236449, -0.06302976, 5.072093, 1, 0, 0, 1, 1,
0.07343803, 0.15632, 1.730646, 0, 0, 0, 1, 1,
0.07408989, 0.8283616, -0.08291721, 0, 0, 0, 1, 1,
0.07582648, -0.5000792, 4.096481, 0, 0, 0, 1, 1,
0.0760477, -0.8701408, 3.588208, 0, 0, 0, 1, 1,
0.07801712, 1.871553, -1.250889, 0, 0, 0, 1, 1,
0.07973034, -0.8541986, 2.487175, 0, 0, 0, 1, 1,
0.08088559, -0.7384998, 1.586114, 0, 0, 0, 1, 1,
0.08120951, 1.444831, 0.2511609, 1, 1, 1, 1, 1,
0.08477233, -0.6175148, 4.212844, 1, 1, 1, 1, 1,
0.08951586, 2.379775, -0.6285005, 1, 1, 1, 1, 1,
0.09040684, 0.1913579, -1.070225, 1, 1, 1, 1, 1,
0.09371928, -0.8036991, 2.955174, 1, 1, 1, 1, 1,
0.09373356, 0.4624524, 0.1453548, 1, 1, 1, 1, 1,
0.09892962, -1.131911, 3.401377, 1, 1, 1, 1, 1,
0.0997467, 0.5619701, -0.1575357, 1, 1, 1, 1, 1,
0.1067371, 0.05935155, 0.8342611, 1, 1, 1, 1, 1,
0.1109549, 0.1190381, 1.331711, 1, 1, 1, 1, 1,
0.1135992, -0.4187479, 3.551819, 1, 1, 1, 1, 1,
0.1275599, -0.6839797, 2.747174, 1, 1, 1, 1, 1,
0.1284442, 0.2183348, 0.2660258, 1, 1, 1, 1, 1,
0.1338742, -0.3064028, 3.423346, 1, 1, 1, 1, 1,
0.1371301, 0.3657041, 0.7591318, 1, 1, 1, 1, 1,
0.1371589, -0.03320473, 1.97696, 0, 0, 1, 1, 1,
0.1453238, 0.2782468, -1.043471, 1, 0, 0, 1, 1,
0.1473204, -1.344059, 2.587462, 1, 0, 0, 1, 1,
0.1500808, 0.5195979, 1.67587, 1, 0, 0, 1, 1,
0.1607289, 2.580955, -0.2613052, 1, 0, 0, 1, 1,
0.163765, -0.1719116, 4.282867, 1, 0, 0, 1, 1,
0.1656265, -0.0591845, 1.021925, 0, 0, 0, 1, 1,
0.1679122, 1.620175, 0.8901375, 0, 0, 0, 1, 1,
0.1687829, 1.46548, -0.9226592, 0, 0, 0, 1, 1,
0.1716352, 1.760988, 0.1499384, 0, 0, 0, 1, 1,
0.1717275, 0.3422127, -0.5009008, 0, 0, 0, 1, 1,
0.1723541, 0.1873913, -0.0327196, 0, 0, 0, 1, 1,
0.1731303, 0.2052333, 0.4032247, 0, 0, 0, 1, 1,
0.1738991, 0.250537, 0.1429474, 1, 1, 1, 1, 1,
0.1784005, -0.7628577, 2.657619, 1, 1, 1, 1, 1,
0.1801424, -0.3761214, 1.661433, 1, 1, 1, 1, 1,
0.1808086, -2.020498, 3.485437, 1, 1, 1, 1, 1,
0.1883811, 0.482228, -0.634132, 1, 1, 1, 1, 1,
0.1884261, 0.4288226, 1.611309, 1, 1, 1, 1, 1,
0.1889379, 0.5271976, -1.627017, 1, 1, 1, 1, 1,
0.191922, -1.398098, 3.133674, 1, 1, 1, 1, 1,
0.1949584, -0.6399936, 1.851385, 1, 1, 1, 1, 1,
0.1971144, -0.8627096, 3.12918, 1, 1, 1, 1, 1,
0.1990848, 0.841536, -0.5006016, 1, 1, 1, 1, 1,
0.2000285, -1.160321, 3.689595, 1, 1, 1, 1, 1,
0.2043865, 0.6117864, -0.7073805, 1, 1, 1, 1, 1,
0.2045616, 0.2297754, -0.4263498, 1, 1, 1, 1, 1,
0.2060874, -1.458075, 2.624795, 1, 1, 1, 1, 1,
0.2068635, -0.2128471, 3.038307, 0, 0, 1, 1, 1,
0.2106377, 0.9320227, -1.001869, 1, 0, 0, 1, 1,
0.2126791, 0.55665, 0.06581882, 1, 0, 0, 1, 1,
0.2171106, -0.1384205, 3.953645, 1, 0, 0, 1, 1,
0.220215, -0.6612881, 3.929444, 1, 0, 0, 1, 1,
0.2235974, 1.27425, 0.9591995, 1, 0, 0, 1, 1,
0.2257057, -0.2098193, 2.621036, 0, 0, 0, 1, 1,
0.2352952, -1.094491, 2.149006, 0, 0, 0, 1, 1,
0.2385567, -1.760377, 1.91448, 0, 0, 0, 1, 1,
0.2400963, 1.825882, 0.6916395, 0, 0, 0, 1, 1,
0.240475, -0.4096768, 2.628644, 0, 0, 0, 1, 1,
0.2450951, 0.9720497, 1.002269, 0, 0, 0, 1, 1,
0.2456072, 1.553827, 1.352648, 0, 0, 0, 1, 1,
0.2473818, -1.384933, 2.871789, 1, 1, 1, 1, 1,
0.2522483, 0.4902114, 3.084185, 1, 1, 1, 1, 1,
0.2540322, 1.813255, 0.6157401, 1, 1, 1, 1, 1,
0.2577187, -0.2054579, 1.744243, 1, 1, 1, 1, 1,
0.2624392, 1.529449, -0.5308698, 1, 1, 1, 1, 1,
0.2636874, 0.09296108, 0.6111558, 1, 1, 1, 1, 1,
0.2640755, -1.441458, 3.669982, 1, 1, 1, 1, 1,
0.2663438, 1.824652, -2.015283, 1, 1, 1, 1, 1,
0.2668014, -0.8547555, 3.239277, 1, 1, 1, 1, 1,
0.2673194, -0.1703415, 2.60572, 1, 1, 1, 1, 1,
0.2678964, -0.7869674, 4.430371, 1, 1, 1, 1, 1,
0.2681049, -0.3039552, 1.316709, 1, 1, 1, 1, 1,
0.2696222, 0.2764777, 0.1196768, 1, 1, 1, 1, 1,
0.2703542, -0.1571382, 0.561288, 1, 1, 1, 1, 1,
0.2715616, 1.183344, 0.6511654, 1, 1, 1, 1, 1,
0.2723896, 1.010809, -0.543882, 0, 0, 1, 1, 1,
0.2745494, -0.460063, 1.217922, 1, 0, 0, 1, 1,
0.2747011, -0.837926, -0.6769361, 1, 0, 0, 1, 1,
0.2748944, 0.8900139, -1.799794, 1, 0, 0, 1, 1,
0.2862464, -0.08514909, 0.6536749, 1, 0, 0, 1, 1,
0.2875544, 0.9883506, 0.2511436, 1, 0, 0, 1, 1,
0.2942317, 0.9330366, 0.4409334, 0, 0, 0, 1, 1,
0.2945001, -0.9056461, 3.590133, 0, 0, 0, 1, 1,
0.2976128, 0.6735221, 1.310112, 0, 0, 0, 1, 1,
0.3008215, -0.5922964, 0.5997815, 0, 0, 0, 1, 1,
0.3063496, -0.2570042, 1.599584, 0, 0, 0, 1, 1,
0.3139881, -0.2550495, 3.389994, 0, 0, 0, 1, 1,
0.3169263, 0.5025257, 0.7319999, 0, 0, 0, 1, 1,
0.3169888, -0.3099471, 1.16811, 1, 1, 1, 1, 1,
0.3227409, 0.7017344, 0.6482311, 1, 1, 1, 1, 1,
0.3266965, 0.9592827, 1.442274, 1, 1, 1, 1, 1,
0.3270484, -0.4100817, 3.617535, 1, 1, 1, 1, 1,
0.3288258, -0.01655013, 2.047376, 1, 1, 1, 1, 1,
0.3292431, -0.4967638, 2.19601, 1, 1, 1, 1, 1,
0.3306713, 0.1648194, -0.2862512, 1, 1, 1, 1, 1,
0.3330778, -0.7361224, 2.955216, 1, 1, 1, 1, 1,
0.3351154, 1.258468, 0.2156934, 1, 1, 1, 1, 1,
0.3355918, -0.1379, 1.683118, 1, 1, 1, 1, 1,
0.3383922, -1.031924, 3.041871, 1, 1, 1, 1, 1,
0.3397147, 1.380125, 0.7152052, 1, 1, 1, 1, 1,
0.3410276, -2.042939, 2.21187, 1, 1, 1, 1, 1,
0.3414959, 1.975221, 0.1911454, 1, 1, 1, 1, 1,
0.3428281, 0.6972317, 1.124701, 1, 1, 1, 1, 1,
0.3441283, 1.102455, 1.370843, 0, 0, 1, 1, 1,
0.3457597, -1.75553, 3.359677, 1, 0, 0, 1, 1,
0.3466974, -0.3330726, 0.7228413, 1, 0, 0, 1, 1,
0.3479311, -1.845881, 3.098881, 1, 0, 0, 1, 1,
0.3598414, -0.9508697, 4.298691, 1, 0, 0, 1, 1,
0.3648579, 0.61833, -0.4032252, 1, 0, 0, 1, 1,
0.367332, -0.31208, 3.743409, 0, 0, 0, 1, 1,
0.3687856, -0.8902308, 1.820035, 0, 0, 0, 1, 1,
0.371339, 0.3567211, 1.390201, 0, 0, 0, 1, 1,
0.3729753, -0.5793422, 2.705004, 0, 0, 0, 1, 1,
0.3746095, 2.130382, 0.8290559, 0, 0, 0, 1, 1,
0.3760948, 0.1739873, 0.8048372, 0, 0, 0, 1, 1,
0.3840537, -0.05740052, -0.05267265, 0, 0, 0, 1, 1,
0.3899657, -0.781307, 0.7303912, 1, 1, 1, 1, 1,
0.3908274, 0.3205338, -0.8044718, 1, 1, 1, 1, 1,
0.391151, 0.4730512, 2.197161, 1, 1, 1, 1, 1,
0.3945399, 0.111546, 0.6528296, 1, 1, 1, 1, 1,
0.4021895, -0.46312, 1.177477, 1, 1, 1, 1, 1,
0.4030449, 0.8763583, 1.145715, 1, 1, 1, 1, 1,
0.4044327, 0.6586573, 0.04920927, 1, 1, 1, 1, 1,
0.4066166, -0.4115021, 1.125803, 1, 1, 1, 1, 1,
0.4093701, 0.5249306, 0.4152809, 1, 1, 1, 1, 1,
0.4102969, -0.3839244, 2.809133, 1, 1, 1, 1, 1,
0.4110494, -0.3212045, 2.506932, 1, 1, 1, 1, 1,
0.4132315, -0.5049789, 1.628634, 1, 1, 1, 1, 1,
0.4286763, -0.1253339, 2.440215, 1, 1, 1, 1, 1,
0.4293683, -0.4628565, 3.010001, 1, 1, 1, 1, 1,
0.4342294, 0.3352971, 2.242625, 1, 1, 1, 1, 1,
0.4370438, 0.8632925, 0.6516591, 0, 0, 1, 1, 1,
0.4384832, -0.5732318, 2.135421, 1, 0, 0, 1, 1,
0.4392682, -0.8400002, 2.720446, 1, 0, 0, 1, 1,
0.4469824, -0.8314932, 1.641368, 1, 0, 0, 1, 1,
0.4477659, 1.620621, -0.09606842, 1, 0, 0, 1, 1,
0.4482595, -1.108168, 4.760465, 1, 0, 0, 1, 1,
0.4483855, 1.284768, -1.419723, 0, 0, 0, 1, 1,
0.4492677, -0.3230426, 2.404176, 0, 0, 0, 1, 1,
0.4515561, -1.165612, 2.604912, 0, 0, 0, 1, 1,
0.4534021, 0.2104367, 1.514205, 0, 0, 0, 1, 1,
0.45795, 0.4561209, -1.080486, 0, 0, 0, 1, 1,
0.4607972, 1.170744, -0.3120885, 0, 0, 0, 1, 1,
0.4658614, 1.601336, -1.351546, 0, 0, 0, 1, 1,
0.4723888, 0.9995565, -0.2377863, 1, 1, 1, 1, 1,
0.4731427, -1.084625, 2.179161, 1, 1, 1, 1, 1,
0.475233, -0.04918494, 1.350677, 1, 1, 1, 1, 1,
0.4770257, 0.634149, -0.3483945, 1, 1, 1, 1, 1,
0.4803199, 0.5638337, 0.5134846, 1, 1, 1, 1, 1,
0.4806804, 0.4697482, 0.607054, 1, 1, 1, 1, 1,
0.4811662, -0.1492786, 2.95242, 1, 1, 1, 1, 1,
0.4846601, 0.6027999, 0.5189081, 1, 1, 1, 1, 1,
0.4856633, -1.004381, 2.260962, 1, 1, 1, 1, 1,
0.4870463, 2.179344, 0.5945826, 1, 1, 1, 1, 1,
0.4883676, -0.6152302, 1.642265, 1, 1, 1, 1, 1,
0.4947734, 1.254924, 0.6300569, 1, 1, 1, 1, 1,
0.4969343, -0.1025487, 2.81972, 1, 1, 1, 1, 1,
0.4979122, -0.3150596, 2.91396, 1, 1, 1, 1, 1,
0.4979677, 0.2419018, 0.9805797, 1, 1, 1, 1, 1,
0.5029094, 1.040504, -0.2090036, 0, 0, 1, 1, 1,
0.5072829, 0.6297891, 1.373173, 1, 0, 0, 1, 1,
0.5077062, -0.2491079, 0.6147985, 1, 0, 0, 1, 1,
0.5116661, 0.5709532, 1.74237, 1, 0, 0, 1, 1,
0.5147294, -1.275068, 2.20712, 1, 0, 0, 1, 1,
0.5168625, 1.310544, -1.073897, 1, 0, 0, 1, 1,
0.517707, 0.2370347, 1.007029, 0, 0, 0, 1, 1,
0.5182367, 1.918408, 0.3352067, 0, 0, 0, 1, 1,
0.5206475, 0.4335685, 0.4198881, 0, 0, 0, 1, 1,
0.5233412, -1.510774, 1.975291, 0, 0, 0, 1, 1,
0.5259459, 2.975987, 0.3889254, 0, 0, 0, 1, 1,
0.5284076, 0.454929, 0.6423113, 0, 0, 0, 1, 1,
0.5322515, -0.2994788, 3.345111, 0, 0, 0, 1, 1,
0.5322775, 0.3103535, 3.106007, 1, 1, 1, 1, 1,
0.5323954, 0.3668033, 1.892723, 1, 1, 1, 1, 1,
0.5356686, 0.5582721, 0.2631962, 1, 1, 1, 1, 1,
0.53754, 0.5157235, -0.3373772, 1, 1, 1, 1, 1,
0.5388576, 0.5006517, 0.848968, 1, 1, 1, 1, 1,
0.5404872, -0.8981208, 0.484865, 1, 1, 1, 1, 1,
0.5436291, 2.701364, -1.666989, 1, 1, 1, 1, 1,
0.5450781, -1.687216, 2.881006, 1, 1, 1, 1, 1,
0.5459805, 0.3669981, 1.105069, 1, 1, 1, 1, 1,
0.5643758, -0.7920511, 1.902478, 1, 1, 1, 1, 1,
0.5668887, 0.6022367, 1.564928, 1, 1, 1, 1, 1,
0.5672246, 0.6525028, 0.2026807, 1, 1, 1, 1, 1,
0.5743024, -1.355155, 3.793908, 1, 1, 1, 1, 1,
0.5807338, 0.6038541, -1.88118, 1, 1, 1, 1, 1,
0.581263, -0.1248379, 0.3912744, 1, 1, 1, 1, 1,
0.5874208, 0.2680562, -0.03667609, 0, 0, 1, 1, 1,
0.5890685, 0.3566484, 1.260307, 1, 0, 0, 1, 1,
0.5957157, -1.34469, 3.473987, 1, 0, 0, 1, 1,
0.5967895, -0.5859495, 2.006576, 1, 0, 0, 1, 1,
0.5971002, -0.3716184, 4.106875, 1, 0, 0, 1, 1,
0.5985386, 0.8364487, -0.20724, 1, 0, 0, 1, 1,
0.6008561, 0.01942934, 1.495337, 0, 0, 0, 1, 1,
0.6025256, -1.198561, 2.629066, 0, 0, 0, 1, 1,
0.6100557, 1.232367, 1.322131, 0, 0, 0, 1, 1,
0.6117782, -0.6648295, 3.204851, 0, 0, 0, 1, 1,
0.6242848, 0.3205777, 0.3767447, 0, 0, 0, 1, 1,
0.6273626, -1.490178, 1.805998, 0, 0, 0, 1, 1,
0.6283517, 1.974055, 0.9747022, 0, 0, 0, 1, 1,
0.6357738, 0.340177, 2.554587, 1, 1, 1, 1, 1,
0.636117, -1.035362, 1.519402, 1, 1, 1, 1, 1,
0.6396704, -0.360337, 2.267226, 1, 1, 1, 1, 1,
0.6430295, 0.5900729, 0.2980093, 1, 1, 1, 1, 1,
0.6436372, -0.6467255, 1.180107, 1, 1, 1, 1, 1,
0.6467805, -0.7777117, 2.444749, 1, 1, 1, 1, 1,
0.6468161, 0.8504025, -0.6246921, 1, 1, 1, 1, 1,
0.6475264, 0.0809467, 1.075433, 1, 1, 1, 1, 1,
0.6477144, -0.2932182, 1.440709, 1, 1, 1, 1, 1,
0.6553752, -0.971799, 3.298256, 1, 1, 1, 1, 1,
0.6567385, 1.037907, -0.2114473, 1, 1, 1, 1, 1,
0.6584204, -0.3972543, 1.933622, 1, 1, 1, 1, 1,
0.6607494, 0.0446027, -0.5192774, 1, 1, 1, 1, 1,
0.6610612, -0.3374536, 0.5700582, 1, 1, 1, 1, 1,
0.6610824, -0.513487, 0.9691434, 1, 1, 1, 1, 1,
0.6619394, -0.5647253, 2.627713, 0, 0, 1, 1, 1,
0.6636369, -1.48048, 3.004887, 1, 0, 0, 1, 1,
0.6662539, -0.552168, 1.041816, 1, 0, 0, 1, 1,
0.666267, 0.4944675, 1.145363, 1, 0, 0, 1, 1,
0.667686, -0.7296776, 2.263023, 1, 0, 0, 1, 1,
0.6705906, -0.4241502, 2.384398, 1, 0, 0, 1, 1,
0.6717825, -0.9371526, 3.123815, 0, 0, 0, 1, 1,
0.6746176, 1.512846, -0.01159861, 0, 0, 0, 1, 1,
0.6748183, -0.303603, 3.340326, 0, 0, 0, 1, 1,
0.6771846, 0.6249011, -0.7339001, 0, 0, 0, 1, 1,
0.6783509, 2.954096, -0.2586434, 0, 0, 0, 1, 1,
0.6783863, -0.3451778, 2.228512, 0, 0, 0, 1, 1,
0.6798425, -0.287421, 2.964753, 0, 0, 0, 1, 1,
0.6890274, -0.3076934, 1.985562, 1, 1, 1, 1, 1,
0.6894944, -0.1437659, 0.9474526, 1, 1, 1, 1, 1,
0.6962163, 0.04439626, 1.556053, 1, 1, 1, 1, 1,
0.6963205, -1.150102, 3.375063, 1, 1, 1, 1, 1,
0.6979641, -2.70401, 3.266452, 1, 1, 1, 1, 1,
0.6984372, 0.7855513, 0.7359021, 1, 1, 1, 1, 1,
0.7025021, 0.4965828, 1.8278, 1, 1, 1, 1, 1,
0.703365, 2.252245, -1.036346, 1, 1, 1, 1, 1,
0.7095323, 0.3880524, 1.352566, 1, 1, 1, 1, 1,
0.7152413, 0.1000388, 1.71236, 1, 1, 1, 1, 1,
0.716326, -0.8999256, 1.321185, 1, 1, 1, 1, 1,
0.7166036, 0.3956599, 1.441402, 1, 1, 1, 1, 1,
0.7176812, -0.1532022, 2.744316, 1, 1, 1, 1, 1,
0.7250265, -0.4489403, 2.456147, 1, 1, 1, 1, 1,
0.7326723, -1.041219, 3.41476, 1, 1, 1, 1, 1,
0.7329307, 0.1494288, 0.08902208, 0, 0, 1, 1, 1,
0.7402812, 0.7152029, 2.35059, 1, 0, 0, 1, 1,
0.7448167, 0.9556682, 0.06329223, 1, 0, 0, 1, 1,
0.7485937, -0.1895391, 0.6551263, 1, 0, 0, 1, 1,
0.749492, -0.880307, 1.57473, 1, 0, 0, 1, 1,
0.7499388, -0.1564867, 2.357455, 1, 0, 0, 1, 1,
0.7532472, 0.7294292, 1.424195, 0, 0, 0, 1, 1,
0.7570768, -0.6862299, 2.424292, 0, 0, 0, 1, 1,
0.7600713, -0.5021365, 2.05668, 0, 0, 0, 1, 1,
0.760883, 0.6794065, 1.901608, 0, 0, 0, 1, 1,
0.7625075, -1.346635, 2.831269, 0, 0, 0, 1, 1,
0.7664758, 1.50683, 1.198331, 0, 0, 0, 1, 1,
0.7669984, -2.684962, 3.855705, 0, 0, 0, 1, 1,
0.7678829, -0.5894621, 2.630438, 1, 1, 1, 1, 1,
0.7687787, 1.41345, -0.2953328, 1, 1, 1, 1, 1,
0.7781228, 0.6172742, 0.6761716, 1, 1, 1, 1, 1,
0.7787134, -0.9867628, 2.730892, 1, 1, 1, 1, 1,
0.7823408, 0.5849127, 1.998754, 1, 1, 1, 1, 1,
0.7837744, 1.515805, 1.223132, 1, 1, 1, 1, 1,
0.7882171, -0.4073156, 3.539749, 1, 1, 1, 1, 1,
0.7910368, 0.1943545, 0.1568676, 1, 1, 1, 1, 1,
0.800473, 0.5179448, 1.109341, 1, 1, 1, 1, 1,
0.8044732, -0.228539, 3.439753, 1, 1, 1, 1, 1,
0.8052863, -0.3172474, 1.122098, 1, 1, 1, 1, 1,
0.8064005, -0.794719, 3.59079, 1, 1, 1, 1, 1,
0.8202021, 0.8933259, 0.1399787, 1, 1, 1, 1, 1,
0.8212174, -0.6968386, 1.458255, 1, 1, 1, 1, 1,
0.8237583, -0.2665874, -0.3700957, 1, 1, 1, 1, 1,
0.8246322, -1.199296, 2.213607, 0, 0, 1, 1, 1,
0.8295342, -0.260812, 2.077657, 1, 0, 0, 1, 1,
0.8313987, 0.04849268, 0.1583172, 1, 0, 0, 1, 1,
0.8333666, 1.270701, 1.652697, 1, 0, 0, 1, 1,
0.8393178, -0.826719, 3.008103, 1, 0, 0, 1, 1,
0.8447109, 0.5553045, 0.06676428, 1, 0, 0, 1, 1,
0.848061, 0.5436839, 0.3480277, 0, 0, 0, 1, 1,
0.8481246, 1.803043, 0.9953653, 0, 0, 0, 1, 1,
0.8617736, 1.740895, 0.3114016, 0, 0, 0, 1, 1,
0.8625386, 1.069074, 0.766586, 0, 0, 0, 1, 1,
0.8648288, -0.7507498, 2.207148, 0, 0, 0, 1, 1,
0.86726, 0.005724833, 0.9002776, 0, 0, 0, 1, 1,
0.8690289, 0.790479, 1.501123, 0, 0, 0, 1, 1,
0.8719358, 0.8264689, -1.547763, 1, 1, 1, 1, 1,
0.8738912, 0.09436304, 2.318302, 1, 1, 1, 1, 1,
0.888517, 0.8268859, 0.1988082, 1, 1, 1, 1, 1,
0.8895516, 0.5017183, 1.229761, 1, 1, 1, 1, 1,
0.8947557, -0.7076532, 2.916491, 1, 1, 1, 1, 1,
0.8977548, -3.740547, 5.095072, 1, 1, 1, 1, 1,
0.9079568, 0.19076, 0.3165573, 1, 1, 1, 1, 1,
0.9100028, -0.008057684, 1.124841, 1, 1, 1, 1, 1,
0.9122329, 0.3912046, 1.138538, 1, 1, 1, 1, 1,
0.916592, 2.076537, 1.039377, 1, 1, 1, 1, 1,
0.9223346, 0.8621977, 1.180929, 1, 1, 1, 1, 1,
0.9227203, -1.958229, 2.645647, 1, 1, 1, 1, 1,
0.9245487, -0.3239911, 4.984573, 1, 1, 1, 1, 1,
0.9247974, -0.09875658, 1.886695, 1, 1, 1, 1, 1,
0.9248929, -1.393462, 2.737516, 1, 1, 1, 1, 1,
0.9267322, 1.274392, 0.320979, 0, 0, 1, 1, 1,
0.9298052, -0.07653424, 2.944181, 1, 0, 0, 1, 1,
0.9453157, -0.955888, 2.289551, 1, 0, 0, 1, 1,
0.9462869, 0.6611803, 1.746763, 1, 0, 0, 1, 1,
0.9511562, -1.636666, 1.500504, 1, 0, 0, 1, 1,
0.9511788, -1.470209, 0.563045, 1, 0, 0, 1, 1,
0.955395, -0.1572275, 3.627314, 0, 0, 0, 1, 1,
0.9584949, 0.8135536, 2.286002, 0, 0, 0, 1, 1,
0.9586721, -0.2106705, 3.567861, 0, 0, 0, 1, 1,
0.9597575, -2.154351, 1.104805, 0, 0, 0, 1, 1,
0.9654466, -2.26532, 1.040573, 0, 0, 0, 1, 1,
0.9667928, 0.00181331, -0.6604273, 0, 0, 0, 1, 1,
0.9680824, 0.8786142, 0.0388397, 0, 0, 0, 1, 1,
0.9783494, -0.6347201, 2.82846, 1, 1, 1, 1, 1,
0.979158, -0.5314764, 3.689115, 1, 1, 1, 1, 1,
0.9845767, -0.06317711, 3.778582, 1, 1, 1, 1, 1,
0.9883221, -0.3693165, -0.2022527, 1, 1, 1, 1, 1,
0.9931786, 0.7561777, 1.42384, 1, 1, 1, 1, 1,
1.002285, -0.6577383, 1.493284, 1, 1, 1, 1, 1,
1.004792, 0.05340407, 1.202628, 1, 1, 1, 1, 1,
1.007268, 0.1595883, 1.717637, 1, 1, 1, 1, 1,
1.008063, 0.07858559, 2.035223, 1, 1, 1, 1, 1,
1.00837, 0.3428881, 0.9853908, 1, 1, 1, 1, 1,
1.016877, 0.4121279, 2.022106, 1, 1, 1, 1, 1,
1.017015, 1.24262, 0.4190966, 1, 1, 1, 1, 1,
1.021233, -1.180821, 3.498309, 1, 1, 1, 1, 1,
1.023568, -0.136756, 2.774287, 1, 1, 1, 1, 1,
1.025347, 1.295172, 0.1526084, 1, 1, 1, 1, 1,
1.03016, 1.107918, 1.128691, 0, 0, 1, 1, 1,
1.030982, 0.6547122, 0.8925699, 1, 0, 0, 1, 1,
1.032054, -1.963513, 0.8441312, 1, 0, 0, 1, 1,
1.042655, 0.7535953, 3.161795, 1, 0, 0, 1, 1,
1.043461, 0.7458809, 2.093224, 1, 0, 0, 1, 1,
1.049688, 1.004834, -0.6571362, 1, 0, 0, 1, 1,
1.057354, 0.3581305, 0.5754653, 0, 0, 0, 1, 1,
1.064703, 0.9654468, 1.784719, 0, 0, 0, 1, 1,
1.06916, 0.7223789, 1.924805, 0, 0, 0, 1, 1,
1.080959, 0.2689332, 2.405236, 0, 0, 0, 1, 1,
1.081631, 0.9811807, 0.5747863, 0, 0, 0, 1, 1,
1.082598, -0.352177, 3.478958, 0, 0, 0, 1, 1,
1.084321, -1.433815, 5.588756, 0, 0, 0, 1, 1,
1.093606, 1.011298, 0.6154549, 1, 1, 1, 1, 1,
1.098631, 0.06484875, 0.8067644, 1, 1, 1, 1, 1,
1.098673, -1.407182, 1.993105, 1, 1, 1, 1, 1,
1.09883, -0.4942731, 3.204687, 1, 1, 1, 1, 1,
1.10595, 1.060189, 0.788537, 1, 1, 1, 1, 1,
1.110984, -0.1405092, 1.048134, 1, 1, 1, 1, 1,
1.111868, 0.02841231, 2.069088, 1, 1, 1, 1, 1,
1.115229, 0.4695841, 0.5114821, 1, 1, 1, 1, 1,
1.116214, 0.6893447, 0.2786194, 1, 1, 1, 1, 1,
1.117875, -0.8304337, 1.00637, 1, 1, 1, 1, 1,
1.119338, 0.7937204, 1.82682, 1, 1, 1, 1, 1,
1.121508, -0.9481024, 3.347336, 1, 1, 1, 1, 1,
1.123069, 0.7308348, 0.134938, 1, 1, 1, 1, 1,
1.127581, -1.796293, 0.7270802, 1, 1, 1, 1, 1,
1.1357, -1.992253, 2.52199, 1, 1, 1, 1, 1,
1.138047, -0.1879868, 1.244775, 0, 0, 1, 1, 1,
1.14856, 0.7847724, 0.413018, 1, 0, 0, 1, 1,
1.15034, 0.6991286, 1.139634, 1, 0, 0, 1, 1,
1.157334, 0.3362233, 0.3726619, 1, 0, 0, 1, 1,
1.158993, 0.8634752, 1.783587, 1, 0, 0, 1, 1,
1.168021, 0.2614847, 1.340472, 1, 0, 0, 1, 1,
1.179383, -0.281153, -0.172636, 0, 0, 0, 1, 1,
1.180344, -0.5799703, 2.144253, 0, 0, 0, 1, 1,
1.180418, -1.654767, 2.409106, 0, 0, 0, 1, 1,
1.199397, -1.109407, 1.605958, 0, 0, 0, 1, 1,
1.199561, 1.902645, 0.05193869, 0, 0, 0, 1, 1,
1.20532, -0.7303092, 1.770156, 0, 0, 0, 1, 1,
1.211168, -1.056322, 3.601322, 0, 0, 0, 1, 1,
1.212206, 0.5639647, 1.475733, 1, 1, 1, 1, 1,
1.224292, 1.010651, 1.823739, 1, 1, 1, 1, 1,
1.227043, -0.3233968, 2.234792, 1, 1, 1, 1, 1,
1.233739, -0.2038447, 2.181097, 1, 1, 1, 1, 1,
1.240982, 0.2502777, 0.7696187, 1, 1, 1, 1, 1,
1.250526, -0.9826505, 2.720957, 1, 1, 1, 1, 1,
1.256558, -0.8282288, 1.399827, 1, 1, 1, 1, 1,
1.257116, -0.7394146, 3.255315, 1, 1, 1, 1, 1,
1.259223, -0.9580313, 1.541791, 1, 1, 1, 1, 1,
1.262084, 0.072565, 2.263865, 1, 1, 1, 1, 1,
1.263426, 0.2453275, 1.188391, 1, 1, 1, 1, 1,
1.269165, 0.04037348, 0.9461223, 1, 1, 1, 1, 1,
1.274081, -0.09297769, 3.866498, 1, 1, 1, 1, 1,
1.27499, -0.2081406, 1.586233, 1, 1, 1, 1, 1,
1.2769, -1.476004, 1.874354, 1, 1, 1, 1, 1,
1.288934, -0.9133386, 3.440144, 0, 0, 1, 1, 1,
1.291901, 0.08724784, 2.469806, 1, 0, 0, 1, 1,
1.292396, -2.306451, 0.9781947, 1, 0, 0, 1, 1,
1.306221, 0.6592911, -0.0172368, 1, 0, 0, 1, 1,
1.307966, 1.119637, 0.4043277, 1, 0, 0, 1, 1,
1.313872, -0.5298738, 1.329533, 1, 0, 0, 1, 1,
1.318099, 0.2082219, 2.252624, 0, 0, 0, 1, 1,
1.320028, 1.7124, 0.7669886, 0, 0, 0, 1, 1,
1.321398, 0.6576154, 0.9625925, 0, 0, 0, 1, 1,
1.323995, 0.4629236, 1.373879, 0, 0, 0, 1, 1,
1.328212, -1.291237, 2.248609, 0, 0, 0, 1, 1,
1.349622, 2.125728, 0.2879744, 0, 0, 0, 1, 1,
1.374058, -0.4610692, 1.223486, 0, 0, 0, 1, 1,
1.375598, 0.02989455, 1.799217, 1, 1, 1, 1, 1,
1.406681, -0.6254757, 2.100698, 1, 1, 1, 1, 1,
1.408786, 0.9814566, 1.864566, 1, 1, 1, 1, 1,
1.411572, 0.6428366, 1.275668, 1, 1, 1, 1, 1,
1.434997, 2.019881, 0.5542102, 1, 1, 1, 1, 1,
1.435854, -0.2745358, 2.398918, 1, 1, 1, 1, 1,
1.437866, 0.003016618, 2.159537, 1, 1, 1, 1, 1,
1.448411, 0.9900731, 1.887719, 1, 1, 1, 1, 1,
1.463786, -1.307706, 1.95925, 1, 1, 1, 1, 1,
1.475117, 1.714707, 1.6435, 1, 1, 1, 1, 1,
1.484106, 0.3344143, 1.496858, 1, 1, 1, 1, 1,
1.494809, 1.111233, 0.02901198, 1, 1, 1, 1, 1,
1.515645, -1.47412, 3.114135, 1, 1, 1, 1, 1,
1.521935, -0.04917533, 1.422989, 1, 1, 1, 1, 1,
1.532035, 0.7345958, -0.8979525, 1, 1, 1, 1, 1,
1.53261, 0.4188243, 3.219031, 0, 0, 1, 1, 1,
1.539948, -0.1016203, 1.291005, 1, 0, 0, 1, 1,
1.540978, -0.1552325, 1.804083, 1, 0, 0, 1, 1,
1.542364, 0.8732163, 1.35708, 1, 0, 0, 1, 1,
1.576659, 0.7992184, 0.6385431, 1, 0, 0, 1, 1,
1.58065, 0.4391436, 0.8346086, 1, 0, 0, 1, 1,
1.586573, 0.8253409, 0.5077101, 0, 0, 0, 1, 1,
1.587476, -0.4832242, 2.802119, 0, 0, 0, 1, 1,
1.603937, -0.1577602, 0.5266505, 0, 0, 0, 1, 1,
1.625356, 0.7655914, 1.389949, 0, 0, 0, 1, 1,
1.637091, -0.7377379, 1.602061, 0, 0, 0, 1, 1,
1.640487, -0.3895472, 2.12503, 0, 0, 0, 1, 1,
1.64219, 0.6797156, 2.708869, 0, 0, 0, 1, 1,
1.646589, -0.07572242, 1.508543, 1, 1, 1, 1, 1,
1.651397, 0.9792465, 2.468302, 1, 1, 1, 1, 1,
1.663816, -1.407742, 2.717107, 1, 1, 1, 1, 1,
1.667227, -1.397221, 1.523457, 1, 1, 1, 1, 1,
1.667482, -1.050373, 2.943726, 1, 1, 1, 1, 1,
1.672093, -0.3280058, 1.59263, 1, 1, 1, 1, 1,
1.676902, -0.8916766, 1.330893, 1, 1, 1, 1, 1,
1.678724, -0.7445356, 1.390466, 1, 1, 1, 1, 1,
1.686594, -0.5319205, 1.758284, 1, 1, 1, 1, 1,
1.694952, -1.694145, 3.299204, 1, 1, 1, 1, 1,
1.721276, -0.3858444, -0.2332955, 1, 1, 1, 1, 1,
1.741747, 0.9205151, 2.157788, 1, 1, 1, 1, 1,
1.743304, -0.4399895, 1.61789, 1, 1, 1, 1, 1,
1.748906, 1.967097, -0.5702748, 1, 1, 1, 1, 1,
1.769753, 0.2272069, -0.6735975, 1, 1, 1, 1, 1,
1.782521, -1.440962, 2.569097, 0, 0, 1, 1, 1,
1.803327, -1.118535, 1.324146, 1, 0, 0, 1, 1,
1.810596, -0.7786048, 3.05278, 1, 0, 0, 1, 1,
1.813634, 0.553435, 1.106802, 1, 0, 0, 1, 1,
1.818868, -0.2985742, 2.185695, 1, 0, 0, 1, 1,
1.828277, 0.7668264, 0.9730108, 1, 0, 0, 1, 1,
1.829227, 0.2825788, 0.03809767, 0, 0, 0, 1, 1,
1.838835, -1.469168, 3.886123, 0, 0, 0, 1, 1,
1.866383, -0.7976823, -0.06554893, 0, 0, 0, 1, 1,
1.893183, -0.8963771, 1.186005, 0, 0, 0, 1, 1,
1.901609, -0.1756175, 1.484606, 0, 0, 0, 1, 1,
1.904433, -0.7927688, 1.62695, 0, 0, 0, 1, 1,
1.912124, 1.231887, 2.290991, 0, 0, 0, 1, 1,
1.918369, -0.444596, 0.2207986, 1, 1, 1, 1, 1,
1.925648, -0.9288064, 1.579607, 1, 1, 1, 1, 1,
1.95554, -0.5997783, 0.3806747, 1, 1, 1, 1, 1,
1.966885, -0.9535372, 2.021004, 1, 1, 1, 1, 1,
1.986803, 1.047702, 1.314616, 1, 1, 1, 1, 1,
1.988517, -2.279817, 2.243684, 1, 1, 1, 1, 1,
1.988632, 0.6626927, 4.148842, 1, 1, 1, 1, 1,
1.999777, -0.1235254, 2.948138, 1, 1, 1, 1, 1,
2.01145, -1.520921, 1.077274, 1, 1, 1, 1, 1,
2.042073, -0.9028932, 3.272398, 1, 1, 1, 1, 1,
2.046022, 0.707172, 2.822269, 1, 1, 1, 1, 1,
2.047424, 0.007926501, 2.931173, 1, 1, 1, 1, 1,
2.168744, -0.5470084, 2.032951, 1, 1, 1, 1, 1,
2.202575, 0.5079702, 1.245148, 1, 1, 1, 1, 1,
2.20458, 0.1115724, 2.947747, 1, 1, 1, 1, 1,
2.216716, -1.662635, 4.169431, 0, 0, 1, 1, 1,
2.225606, 0.1082697, 1.810593, 1, 0, 0, 1, 1,
2.284919, -0.6176085, 1.696969, 1, 0, 0, 1, 1,
2.293958, 0.02409744, 1.782308, 1, 0, 0, 1, 1,
2.32846, 0.1935746, 1.540745, 1, 0, 0, 1, 1,
2.393534, 2.431177, 0.3407015, 1, 0, 0, 1, 1,
2.395311, 0.8218467, 0.7839965, 0, 0, 0, 1, 1,
2.490211, 0.3834516, 0.9088204, 0, 0, 0, 1, 1,
2.490658, 0.767195, 0.9845924, 0, 0, 0, 1, 1,
2.494958, 0.1375154, 2.845657, 0, 0, 0, 1, 1,
2.550419, -0.2080206, 0.3619069, 0, 0, 0, 1, 1,
2.684047, -0.003252225, 1.627897, 0, 0, 0, 1, 1,
2.713399, -0.2576188, 1.98709, 0, 0, 0, 1, 1,
2.720161, 1.276425, 0.9146597, 1, 1, 1, 1, 1,
2.807055, 0.2768932, 0.9605888, 1, 1, 1, 1, 1,
2.820832, -0.1347097, 0.7580342, 1, 1, 1, 1, 1,
2.875379, 0.9413655, 0.9886643, 1, 1, 1, 1, 1,
3.022914, 0.7295496, 2.029158, 1, 1, 1, 1, 1,
3.044562, 0.8722796, 0.8832923, 1, 1, 1, 1, 1,
3.221002, 0.16333, 1.229723, 1, 1, 1, 1, 1
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
var radius = 9.989512;
var distance = 35.08773;
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
mvMatrix.translate( -0.1861377, 0.3822799, 0.2812328 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.08773);
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
