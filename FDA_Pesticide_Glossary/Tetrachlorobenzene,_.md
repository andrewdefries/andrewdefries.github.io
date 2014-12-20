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
-3.594488, 0.1294702, -3.823552, 1, 0, 0, 1,
-3.409313, -0.8439617, -2.049321, 1, 0.007843138, 0, 1,
-3.051759, 2.0432, -1.865185, 1, 0.01176471, 0, 1,
-2.89858, -1.277519, -1.354763, 1, 0.01960784, 0, 1,
-2.890272, 0.7971365, -0.004096971, 1, 0.02352941, 0, 1,
-2.705657, 0.9171263, -0.9987069, 1, 0.03137255, 0, 1,
-2.648797, -0.2132169, -1.418756, 1, 0.03529412, 0, 1,
-2.546342, 1.059215, -2.145497, 1, 0.04313726, 0, 1,
-2.440655, -0.4608443, -1.536714, 1, 0.04705882, 0, 1,
-2.399139, 0.5156898, -2.075633, 1, 0.05490196, 0, 1,
-2.3758, -0.633314, -1.696135, 1, 0.05882353, 0, 1,
-2.36333, 1.100503, 0.001732995, 1, 0.06666667, 0, 1,
-2.338893, 1.769836, -1.697197, 1, 0.07058824, 0, 1,
-2.317916, 0.4766989, -1.864326, 1, 0.07843138, 0, 1,
-2.297978, 0.5097151, -1.036107, 1, 0.08235294, 0, 1,
-2.294088, -0.8414092, -0.8679425, 1, 0.09019608, 0, 1,
-2.265182, 0.7900015, -1.235432, 1, 0.09411765, 0, 1,
-2.250422, -0.5587898, -1.538132, 1, 0.1019608, 0, 1,
-2.168379, 1.572337, -1.530521, 1, 0.1098039, 0, 1,
-2.142698, 0.9677532, -1.81697, 1, 0.1137255, 0, 1,
-2.057186, 0.2220713, -0.3409274, 1, 0.1215686, 0, 1,
-2.021214, 0.8821936, 1.683152, 1, 0.1254902, 0, 1,
-1.981576, -0.9114846, -3.013745, 1, 0.1333333, 0, 1,
-1.902861, 1.318764, -1.526891, 1, 0.1372549, 0, 1,
-1.854394, -1.124658, -3.017709, 1, 0.145098, 0, 1,
-1.819589, 0.153569, -1.523478, 1, 0.1490196, 0, 1,
-1.816496, 0.3603754, -1.11204, 1, 0.1568628, 0, 1,
-1.798478, 0.3750931, 0.1521105, 1, 0.1607843, 0, 1,
-1.794653, 0.3084649, -0.6296025, 1, 0.1686275, 0, 1,
-1.790269, 1.24297, -2.185033, 1, 0.172549, 0, 1,
-1.785554, -0.7716622, -2.761351, 1, 0.1803922, 0, 1,
-1.779718, -0.4778424, -1.598842, 1, 0.1843137, 0, 1,
-1.773355, -0.2773031, -1.453134, 1, 0.1921569, 0, 1,
-1.739104, -2.317453, -3.323644, 1, 0.1960784, 0, 1,
-1.728983, 2.448914, -1.407338, 1, 0.2039216, 0, 1,
-1.685522, 0.7016926, -1.02843, 1, 0.2117647, 0, 1,
-1.673516, 0.09725305, -1.142761, 1, 0.2156863, 0, 1,
-1.659661, 0.0709728, -1.342282, 1, 0.2235294, 0, 1,
-1.636815, 1.005136, 0.3476541, 1, 0.227451, 0, 1,
-1.635341, -0.4635398, -1.842276, 1, 0.2352941, 0, 1,
-1.62438, 0.7277808, -2.034565, 1, 0.2392157, 0, 1,
-1.623504, 0.7636493, -0.5230345, 1, 0.2470588, 0, 1,
-1.618181, -0.6103823, -2.086636, 1, 0.2509804, 0, 1,
-1.600381, -0.8818944, -1.383343, 1, 0.2588235, 0, 1,
-1.599224, 0.9409202, -2.534946, 1, 0.2627451, 0, 1,
-1.599103, -2.281587, -1.095398, 1, 0.2705882, 0, 1,
-1.586902, 0.9184858, -1.461163, 1, 0.2745098, 0, 1,
-1.584731, 1.293845, -0.801437, 1, 0.282353, 0, 1,
-1.583401, -0.3625438, -1.702147, 1, 0.2862745, 0, 1,
-1.582938, 0.6371884, -2.805027, 1, 0.2941177, 0, 1,
-1.58039, 1.946654, -1.721643, 1, 0.3019608, 0, 1,
-1.541797, -0.4461442, -1.354858, 1, 0.3058824, 0, 1,
-1.52826, 0.1936095, -1.865126, 1, 0.3137255, 0, 1,
-1.522595, 0.5868157, -0.8256821, 1, 0.3176471, 0, 1,
-1.519167, -1.4172, -0.6940361, 1, 0.3254902, 0, 1,
-1.511472, 0.5832179, -1.47821, 1, 0.3294118, 0, 1,
-1.505859, -1.757661, -2.125898, 1, 0.3372549, 0, 1,
-1.505169, 1.25238, -0.8592061, 1, 0.3411765, 0, 1,
-1.496151, 1.410781, 0.4255186, 1, 0.3490196, 0, 1,
-1.49067, 1.915969, -1.243729, 1, 0.3529412, 0, 1,
-1.486387, 0.3921669, -1.586282, 1, 0.3607843, 0, 1,
-1.47883, -0.7378002, -1.986798, 1, 0.3647059, 0, 1,
-1.476347, -1.02954, -1.326088, 1, 0.372549, 0, 1,
-1.469106, -0.2669005, -2.095207, 1, 0.3764706, 0, 1,
-1.465793, -0.2161041, -0.5328292, 1, 0.3843137, 0, 1,
-1.463313, 0.4180966, -1.196276, 1, 0.3882353, 0, 1,
-1.453762, -0.8752732, -2.508467, 1, 0.3960784, 0, 1,
-1.443053, 0.8569476, -0.4457856, 1, 0.4039216, 0, 1,
-1.438716, 1.040121, -2.712069, 1, 0.4078431, 0, 1,
-1.430351, 1.330015, -0.5633705, 1, 0.4156863, 0, 1,
-1.392001, -1.118827, -3.185797, 1, 0.4196078, 0, 1,
-1.387163, -0.537971, -1.123592, 1, 0.427451, 0, 1,
-1.38429, 1.459683, -1.255581, 1, 0.4313726, 0, 1,
-1.374045, -0.4010173, -0.5470322, 1, 0.4392157, 0, 1,
-1.37282, -0.2226615, -1.357941, 1, 0.4431373, 0, 1,
-1.369957, -1.149724, -1.938502, 1, 0.4509804, 0, 1,
-1.358039, 0.7272722, -0.9427279, 1, 0.454902, 0, 1,
-1.357744, -0.3011713, -1.846755, 1, 0.4627451, 0, 1,
-1.35002, -0.4071432, -3.282776, 1, 0.4666667, 0, 1,
-1.347706, 0.06281005, -1.80346, 1, 0.4745098, 0, 1,
-1.347016, 0.5032796, -1.222406, 1, 0.4784314, 0, 1,
-1.341374, 0.6209926, -1.235047, 1, 0.4862745, 0, 1,
-1.336826, 1.803645, -0.1124497, 1, 0.4901961, 0, 1,
-1.3081, 0.5401089, -2.349347, 1, 0.4980392, 0, 1,
-1.289537, -1.644045, -1.14372, 1, 0.5058824, 0, 1,
-1.278714, 0.318765, -1.999149, 1, 0.509804, 0, 1,
-1.278229, -0.3678416, -0.9459013, 1, 0.5176471, 0, 1,
-1.27557, -0.9054268, -4.608889, 1, 0.5215687, 0, 1,
-1.266773, -0.5431262, -1.09835, 1, 0.5294118, 0, 1,
-1.260536, 1.891746, -1.331556, 1, 0.5333334, 0, 1,
-1.259691, 1.117629, -1.272149, 1, 0.5411765, 0, 1,
-1.25816, 1.566143, -0.3167306, 1, 0.5450981, 0, 1,
-1.250232, -0.6502648, -3.07003, 1, 0.5529412, 0, 1,
-1.248698, 1.282002, -1.293799, 1, 0.5568628, 0, 1,
-1.244352, 0.7915966, -1.327225, 1, 0.5647059, 0, 1,
-1.242477, -0.1864896, -2.099435, 1, 0.5686275, 0, 1,
-1.235487, 1.046143, -1.101031, 1, 0.5764706, 0, 1,
-1.232769, 0.5567391, -0.6978315, 1, 0.5803922, 0, 1,
-1.225688, -0.7932215, -1.702858, 1, 0.5882353, 0, 1,
-1.212317, 1.836886, 1.001656, 1, 0.5921569, 0, 1,
-1.204564, -0.9371946, -2.520269, 1, 0.6, 0, 1,
-1.204231, -1.950896, -2.310273, 1, 0.6078432, 0, 1,
-1.200218, -0.4133053, -2.653693, 1, 0.6117647, 0, 1,
-1.19623, -0.05348811, -1.345312, 1, 0.6196079, 0, 1,
-1.19065, 0.1288474, -3.260844, 1, 0.6235294, 0, 1,
-1.189808, -0.1603554, -1.90281, 1, 0.6313726, 0, 1,
-1.180701, 1.050061, 0.6297749, 1, 0.6352941, 0, 1,
-1.173918, 0.4790952, -0.5327431, 1, 0.6431373, 0, 1,
-1.17301, 0.644883, -3.411777, 1, 0.6470588, 0, 1,
-1.168615, -1.719018, -1.947803, 1, 0.654902, 0, 1,
-1.16688, 0.3666891, -3.151815, 1, 0.6588235, 0, 1,
-1.159284, 0.06098889, -1.356829, 1, 0.6666667, 0, 1,
-1.15576, -0.2560451, -1.173599, 1, 0.6705883, 0, 1,
-1.151382, 0.6274772, 0.2324062, 1, 0.6784314, 0, 1,
-1.143745, 0.9491524, -0.31556, 1, 0.682353, 0, 1,
-1.141764, 0.006276012, -1.186962, 1, 0.6901961, 0, 1,
-1.134734, -1.251926, -1.865357, 1, 0.6941177, 0, 1,
-1.129676, 3.130869, -2.243671, 1, 0.7019608, 0, 1,
-1.126434, 1.921463, -1.046539, 1, 0.7098039, 0, 1,
-1.125261, -1.445709, -2.273461, 1, 0.7137255, 0, 1,
-1.111801, 0.8195832, -0.9592761, 1, 0.7215686, 0, 1,
-1.107342, 0.1317179, -0.7143712, 1, 0.7254902, 0, 1,
-1.101107, 0.8383029, -0.8679425, 1, 0.7333333, 0, 1,
-1.099327, -0.7380634, -4.64774, 1, 0.7372549, 0, 1,
-1.09117, -0.6284944, -3.258619, 1, 0.7450981, 0, 1,
-1.077562, -0.6611652, -2.480152, 1, 0.7490196, 0, 1,
-1.072008, 0.4641084, -0.1756292, 1, 0.7568628, 0, 1,
-1.06932, 1.158688, 1.438238, 1, 0.7607843, 0, 1,
-1.068298, -0.2008311, -2.288822, 1, 0.7686275, 0, 1,
-1.060853, -1.008233, -2.402472, 1, 0.772549, 0, 1,
-1.056295, 1.280403, -1.229538, 1, 0.7803922, 0, 1,
-1.050054, 0.142212, -1.924744, 1, 0.7843137, 0, 1,
-1.045714, 1.590379, 1.254202, 1, 0.7921569, 0, 1,
-1.045635, 0.441482, -0.5807055, 1, 0.7960784, 0, 1,
-1.045323, 0.6496859, 0.361926, 1, 0.8039216, 0, 1,
-1.036353, 0.8517891, -0.200158, 1, 0.8117647, 0, 1,
-1.031676, 0.233233, 0.09551445, 1, 0.8156863, 0, 1,
-1.029972, -0.8812717, -2.670978, 1, 0.8235294, 0, 1,
-1.029058, 0.4557149, 0.4721359, 1, 0.827451, 0, 1,
-1.028186, -1.071007, -3.13006, 1, 0.8352941, 0, 1,
-1.023971, -0.09070113, -2.758697, 1, 0.8392157, 0, 1,
-1.022052, 0.2628553, -2.059524, 1, 0.8470588, 0, 1,
-1.017809, 0.7607543, -2.209049, 1, 0.8509804, 0, 1,
-1.016067, -0.4493868, -0.09976084, 1, 0.8588235, 0, 1,
-1.008141, 0.5527416, -1.224241, 1, 0.8627451, 0, 1,
-1.007785, 2.515487, -1.068491, 1, 0.8705882, 0, 1,
-0.9958155, -1.266204, -2.684795, 1, 0.8745098, 0, 1,
-0.9932725, 0.5127838, -1.844331, 1, 0.8823529, 0, 1,
-0.9928631, -0.02105699, -0.2436265, 1, 0.8862745, 0, 1,
-0.9915389, -0.4743882, -1.863485, 1, 0.8941177, 0, 1,
-0.9897611, -2.258335, -3.22597, 1, 0.8980392, 0, 1,
-0.9860891, 0.3141912, -4.484298, 1, 0.9058824, 0, 1,
-0.9819627, -0.5704899, -2.092961, 1, 0.9137255, 0, 1,
-0.9806759, -0.2635399, -1.316408, 1, 0.9176471, 0, 1,
-0.9803218, 1.274789, -1.117356, 1, 0.9254902, 0, 1,
-0.9753687, -0.125914, -2.310547, 1, 0.9294118, 0, 1,
-0.9707825, -1.063422, -1.944722, 1, 0.9372549, 0, 1,
-0.9689869, 1.639993, -0.2067758, 1, 0.9411765, 0, 1,
-0.9607909, 0.2409217, -0.2564767, 1, 0.9490196, 0, 1,
-0.9509455, 0.9786314, -1.501297, 1, 0.9529412, 0, 1,
-0.9375715, -1.207558, -2.419105, 1, 0.9607843, 0, 1,
-0.9372432, -1.088948, 0.04951677, 1, 0.9647059, 0, 1,
-0.9372131, 0.06437769, -2.627956, 1, 0.972549, 0, 1,
-0.9312199, -0.543267, -2.151156, 1, 0.9764706, 0, 1,
-0.9267579, 0.7012156, -0.4156656, 1, 0.9843137, 0, 1,
-0.9240538, -0.3507463, -2.0057, 1, 0.9882353, 0, 1,
-0.9195227, -0.4048901, -1.910377, 1, 0.9960784, 0, 1,
-0.9156502, -0.4156256, -2.345446, 0.9960784, 1, 0, 1,
-0.9134744, -0.4474316, -1.041263, 0.9921569, 1, 0, 1,
-0.908067, -0.2817754, -1.5921, 0.9843137, 1, 0, 1,
-0.9052639, 0.325401, 0.9092554, 0.9803922, 1, 0, 1,
-0.9032697, -0.5599462, -0.8677796, 0.972549, 1, 0, 1,
-0.9026833, 0.1611046, -2.466866, 0.9686275, 1, 0, 1,
-0.8958868, -1.632498, -1.817786, 0.9607843, 1, 0, 1,
-0.8877369, 0.2698726, -1.167693, 0.9568627, 1, 0, 1,
-0.8857582, 0.1837885, -0.004206752, 0.9490196, 1, 0, 1,
-0.8828278, 0.6272043, -0.2930649, 0.945098, 1, 0, 1,
-0.8692012, 0.9620308, 0.271777, 0.9372549, 1, 0, 1,
-0.8691552, -0.4325579, -0.4366377, 0.9333333, 1, 0, 1,
-0.8678066, 1.407251, -1.105127, 0.9254902, 1, 0, 1,
-0.8672569, 0.5879876, -1.129775, 0.9215686, 1, 0, 1,
-0.8588924, -0.4609011, -4.208396, 0.9137255, 1, 0, 1,
-0.8587114, -0.9090738, -3.261122, 0.9098039, 1, 0, 1,
-0.8544855, 0.5675519, -1.26986, 0.9019608, 1, 0, 1,
-0.8525564, -0.1113024, -1.242766, 0.8941177, 1, 0, 1,
-0.8465781, 2.11283, -1.456241, 0.8901961, 1, 0, 1,
-0.8456109, 0.81475, -0.01277142, 0.8823529, 1, 0, 1,
-0.8432727, 2.014384, 1.453349, 0.8784314, 1, 0, 1,
-0.8431103, 0.9957862, -0.3060614, 0.8705882, 1, 0, 1,
-0.8393508, -0.8973607, -1.172641, 0.8666667, 1, 0, 1,
-0.8310239, 0.3200782, 0.2990399, 0.8588235, 1, 0, 1,
-0.8275281, -0.201307, -3.577828, 0.854902, 1, 0, 1,
-0.8273514, -0.6650451, -1.142259, 0.8470588, 1, 0, 1,
-0.8272512, -0.7181745, -1.735653, 0.8431373, 1, 0, 1,
-0.8261901, 0.546594, -1.347668, 0.8352941, 1, 0, 1,
-0.8229893, -0.7173898, -1.851611, 0.8313726, 1, 0, 1,
-0.8227909, 1.83549, -0.2433551, 0.8235294, 1, 0, 1,
-0.8205781, 1.310434, -1.242229, 0.8196079, 1, 0, 1,
-0.8190719, 0.3830444, -0.8079098, 0.8117647, 1, 0, 1,
-0.8175668, -1.2465, -4.768456, 0.8078431, 1, 0, 1,
-0.8034836, -0.6957497, -2.174769, 0.8, 1, 0, 1,
-0.8025816, -0.373032, -2.799541, 0.7921569, 1, 0, 1,
-0.8022797, -1.090611, -4.534475, 0.7882353, 1, 0, 1,
-0.8003238, -0.5349591, -2.210366, 0.7803922, 1, 0, 1,
-0.7970941, -0.5365416, -1.824489, 0.7764706, 1, 0, 1,
-0.7913365, -1.223384, -2.539229, 0.7686275, 1, 0, 1,
-0.7904761, -0.5819186, -3.484635, 0.7647059, 1, 0, 1,
-0.7893558, 0.666972, -0.3356063, 0.7568628, 1, 0, 1,
-0.7858732, -2.171019, -2.443999, 0.7529412, 1, 0, 1,
-0.7807426, -0.4550512, -1.38888, 0.7450981, 1, 0, 1,
-0.7740983, 0.4911089, 1.564243, 0.7411765, 1, 0, 1,
-0.7693899, -0.47149, -2.715408, 0.7333333, 1, 0, 1,
-0.7672809, -0.3143323, -1.840405, 0.7294118, 1, 0, 1,
-0.7604007, -0.1891393, -2.59126, 0.7215686, 1, 0, 1,
-0.7595091, 0.1194252, -1.409123, 0.7176471, 1, 0, 1,
-0.7551237, 0.06301454, -2.471763, 0.7098039, 1, 0, 1,
-0.754226, -0.1277039, -2.523717, 0.7058824, 1, 0, 1,
-0.7523081, -0.4155261, -1.3979, 0.6980392, 1, 0, 1,
-0.7473305, -1.0332, -2.961112, 0.6901961, 1, 0, 1,
-0.7461732, 0.983939, -0.1014918, 0.6862745, 1, 0, 1,
-0.7429869, 0.01061063, -3.426838, 0.6784314, 1, 0, 1,
-0.7361388, 0.006689289, -1.217003, 0.6745098, 1, 0, 1,
-0.7326469, 0.5784793, -2.405008, 0.6666667, 1, 0, 1,
-0.7213145, 0.8847402, -1.817783, 0.6627451, 1, 0, 1,
-0.7170146, 0.04230421, -1.520542, 0.654902, 1, 0, 1,
-0.7164105, 0.7490367, -2.118514, 0.6509804, 1, 0, 1,
-0.712546, 2.563511, -0.8827713, 0.6431373, 1, 0, 1,
-0.7085758, -0.3783625, -2.396974, 0.6392157, 1, 0, 1,
-0.704729, -1.172856, -2.390975, 0.6313726, 1, 0, 1,
-0.7040371, -1.630506, -2.946098, 0.627451, 1, 0, 1,
-0.6939123, -0.5131359, -0.7218044, 0.6196079, 1, 0, 1,
-0.6884022, -1.72219, -3.190154, 0.6156863, 1, 0, 1,
-0.6820586, -0.9306948, -0.9138566, 0.6078432, 1, 0, 1,
-0.6780728, 0.8370653, -0.4407674, 0.6039216, 1, 0, 1,
-0.6779131, 0.4320549, -0.7107584, 0.5960785, 1, 0, 1,
-0.675704, -0.2736279, -2.019243, 0.5882353, 1, 0, 1,
-0.6748375, -0.5099842, -1.666064, 0.5843138, 1, 0, 1,
-0.6701907, -0.3745822, -2.057405, 0.5764706, 1, 0, 1,
-0.6641887, 0.1750397, -0.7479584, 0.572549, 1, 0, 1,
-0.663782, -1.019445, -3.277851, 0.5647059, 1, 0, 1,
-0.6567244, 1.948072, 0.7518695, 0.5607843, 1, 0, 1,
-0.6557985, 0.404732, -0.8131692, 0.5529412, 1, 0, 1,
-0.6544031, -2.189909, -3.291633, 0.5490196, 1, 0, 1,
-0.6529978, 0.108307, -2.242525, 0.5411765, 1, 0, 1,
-0.652194, 0.04145903, -0.799217, 0.5372549, 1, 0, 1,
-0.6498654, 1.189194, -2.06253, 0.5294118, 1, 0, 1,
-0.6495731, -0.1195242, -1.286534, 0.5254902, 1, 0, 1,
-0.6493948, -0.3212644, -0.9933788, 0.5176471, 1, 0, 1,
-0.6492335, -0.4166279, -3.401286, 0.5137255, 1, 0, 1,
-0.6437664, 0.435324, -2.158004, 0.5058824, 1, 0, 1,
-0.642652, -0.5428989, -2.557734, 0.5019608, 1, 0, 1,
-0.6396978, -0.06631304, -1.923431, 0.4941176, 1, 0, 1,
-0.6382614, 2.418994, 0.003386513, 0.4862745, 1, 0, 1,
-0.6370952, -0.9808401, -2.806314, 0.4823529, 1, 0, 1,
-0.6343132, -0.7811604, -2.026364, 0.4745098, 1, 0, 1,
-0.6337426, 0.629784, -0.6380607, 0.4705882, 1, 0, 1,
-0.6271905, 0.608469, -0.2558502, 0.4627451, 1, 0, 1,
-0.6178702, -0.2469418, -1.872613, 0.4588235, 1, 0, 1,
-0.6176005, -0.04348988, -1.626104, 0.4509804, 1, 0, 1,
-0.6154478, -0.3326801, -2.886133, 0.4470588, 1, 0, 1,
-0.6151318, 1.592213, -1.091035, 0.4392157, 1, 0, 1,
-0.6085002, -1.314794, -3.664904, 0.4352941, 1, 0, 1,
-0.6047631, 1.63827, 0.5421087, 0.427451, 1, 0, 1,
-0.603322, -0.250439, -1.752163, 0.4235294, 1, 0, 1,
-0.6009591, -0.5483547, -2.500096, 0.4156863, 1, 0, 1,
-0.5992677, -0.08900867, -2.997326, 0.4117647, 1, 0, 1,
-0.595791, -2.130623, -3.325656, 0.4039216, 1, 0, 1,
-0.5945799, 0.3715571, 0.5340244, 0.3960784, 1, 0, 1,
-0.5919076, 0.2668662, -2.713535, 0.3921569, 1, 0, 1,
-0.5911166, -1.500367, -3.307598, 0.3843137, 1, 0, 1,
-0.5884699, -0.01205837, -2.404038, 0.3803922, 1, 0, 1,
-0.5873028, 1.744686, -2.285084, 0.372549, 1, 0, 1,
-0.5712834, -0.8132001, -1.702274, 0.3686275, 1, 0, 1,
-0.5685815, 0.411092, -1.560026, 0.3607843, 1, 0, 1,
-0.5641084, 0.7228485, -1.188339, 0.3568628, 1, 0, 1,
-0.5533379, 0.007606504, -1.205133, 0.3490196, 1, 0, 1,
-0.5524905, 1.076193, -0.8111048, 0.345098, 1, 0, 1,
-0.551282, 0.2105307, -1.736448, 0.3372549, 1, 0, 1,
-0.5509875, -0.1674016, -2.490614, 0.3333333, 1, 0, 1,
-0.5481469, -2.120658, -3.94976, 0.3254902, 1, 0, 1,
-0.5474277, -0.9796751, -3.212472, 0.3215686, 1, 0, 1,
-0.5463911, 1.17242, -1.08095, 0.3137255, 1, 0, 1,
-0.5453388, 1.635985, -0.346051, 0.3098039, 1, 0, 1,
-0.545292, 0.8162533, 0.1475153, 0.3019608, 1, 0, 1,
-0.5424228, 0.4988293, -1.759824, 0.2941177, 1, 0, 1,
-0.5397258, -0.4354343, -3.28391, 0.2901961, 1, 0, 1,
-0.5386629, 0.9046534, -0.02252449, 0.282353, 1, 0, 1,
-0.5382355, -0.1090801, -1.916998, 0.2784314, 1, 0, 1,
-0.5323655, 1.147118, -1.327455, 0.2705882, 1, 0, 1,
-0.5298314, -0.6050364, -3.260885, 0.2666667, 1, 0, 1,
-0.5285697, -1.076171, -3.013017, 0.2588235, 1, 0, 1,
-0.5243369, 1.542285, -1.296074, 0.254902, 1, 0, 1,
-0.5226119, -0.7398665, -2.465093, 0.2470588, 1, 0, 1,
-0.5223992, -1.329477, -0.7850738, 0.2431373, 1, 0, 1,
-0.5218579, 0.475311, -0.9460636, 0.2352941, 1, 0, 1,
-0.5177847, 0.55158, -1.248895, 0.2313726, 1, 0, 1,
-0.5113962, -1.183799, -4.529177, 0.2235294, 1, 0, 1,
-0.5110047, 0.7675896, -0.7395103, 0.2196078, 1, 0, 1,
-0.5077947, -2.112528, -1.101085, 0.2117647, 1, 0, 1,
-0.5065948, 0.814263, -1.212429, 0.2078431, 1, 0, 1,
-0.5001521, 1.333743, 0.257404, 0.2, 1, 0, 1,
-0.4974125, -2.430041, -3.573889, 0.1921569, 1, 0, 1,
-0.4965039, 0.1774389, -2.062589, 0.1882353, 1, 0, 1,
-0.4892634, -0.08756126, -3.768463, 0.1803922, 1, 0, 1,
-0.4791326, 0.6908365, -1.911431, 0.1764706, 1, 0, 1,
-0.4779651, -0.4297428, -2.853792, 0.1686275, 1, 0, 1,
-0.4695104, 1.290222, 0.2280827, 0.1647059, 1, 0, 1,
-0.4672797, 0.904494, -0.4777524, 0.1568628, 1, 0, 1,
-0.4666354, -0.09410989, -1.692132, 0.1529412, 1, 0, 1,
-0.4664067, 0.08542698, -0.2944916, 0.145098, 1, 0, 1,
-0.4649111, -0.5435978, -1.322477, 0.1411765, 1, 0, 1,
-0.4641691, 0.6303372, 0.2297527, 0.1333333, 1, 0, 1,
-0.462106, 0.788619, -2.348451, 0.1294118, 1, 0, 1,
-0.4620509, 0.2884504, -0.8338265, 0.1215686, 1, 0, 1,
-0.4619293, -0.9275865, -3.335792, 0.1176471, 1, 0, 1,
-0.4528496, -0.4287759, -3.169268, 0.1098039, 1, 0, 1,
-0.4465371, 0.09968256, -3.07521, 0.1058824, 1, 0, 1,
-0.4425229, 1.265596, -1.415753, 0.09803922, 1, 0, 1,
-0.4404238, -0.111378, -2.626269, 0.09019608, 1, 0, 1,
-0.4387941, -0.191067, -1.498683, 0.08627451, 1, 0, 1,
-0.4380009, -1.573113, -2.73677, 0.07843138, 1, 0, 1,
-0.4369612, 0.67031, -0.831486, 0.07450981, 1, 0, 1,
-0.4349161, -1.149294, -2.473623, 0.06666667, 1, 0, 1,
-0.4308701, 0.1229227, -0.3891183, 0.0627451, 1, 0, 1,
-0.4272051, -0.5719734, -3.721715, 0.05490196, 1, 0, 1,
-0.4231225, -1.704638, -2.858387, 0.05098039, 1, 0, 1,
-0.4222327, -1.101161, -1.596399, 0.04313726, 1, 0, 1,
-0.417662, -1.143746, -2.288928, 0.03921569, 1, 0, 1,
-0.4146312, -1.066605, -3.196142, 0.03137255, 1, 0, 1,
-0.4145575, 0.6194392, -1.781593, 0.02745098, 1, 0, 1,
-0.4142933, -0.5878707, -2.598638, 0.01960784, 1, 0, 1,
-0.4137569, 1.501135, -1.208757, 0.01568628, 1, 0, 1,
-0.4087533, -0.5490509, -2.748527, 0.007843138, 1, 0, 1,
-0.4005321, 1.749679, -0.1017709, 0.003921569, 1, 0, 1,
-0.3967455, 0.141725, -1.263693, 0, 1, 0.003921569, 1,
-0.394327, 0.5968784, -1.298819, 0, 1, 0.01176471, 1,
-0.3909202, 0.4906079, -2.23378, 0, 1, 0.01568628, 1,
-0.3897954, 1.255823, -1.609286, 0, 1, 0.02352941, 1,
-0.3832879, 1.049876, -1.468715, 0, 1, 0.02745098, 1,
-0.3827002, 2.064453, -0.2217041, 0, 1, 0.03529412, 1,
-0.3825117, -0.4277386, -1.174443, 0, 1, 0.03921569, 1,
-0.3805698, 0.01014513, -0.3383808, 0, 1, 0.04705882, 1,
-0.3781904, 1.423712, -0.7248695, 0, 1, 0.05098039, 1,
-0.3714833, 0.4841676, 0.6693634, 0, 1, 0.05882353, 1,
-0.3669779, 1.475798, -0.01300403, 0, 1, 0.0627451, 1,
-0.3666906, -0.04133959, -1.30251, 0, 1, 0.07058824, 1,
-0.3661268, 0.6509122, 0.0633674, 0, 1, 0.07450981, 1,
-0.3652174, 1.051033, -1.701593, 0, 1, 0.08235294, 1,
-0.3583404, -1.051052, -1.459042, 0, 1, 0.08627451, 1,
-0.3577239, -0.7326514, -3.817049, 0, 1, 0.09411765, 1,
-0.3549032, 0.9446074, -0.4363635, 0, 1, 0.1019608, 1,
-0.3510411, -0.4747704, -2.130448, 0, 1, 0.1058824, 1,
-0.3471049, -0.1418492, -3.280303, 0, 1, 0.1137255, 1,
-0.3393135, 0.6002672, -1.276465, 0, 1, 0.1176471, 1,
-0.3351283, 0.2819173, 0.2843103, 0, 1, 0.1254902, 1,
-0.3346865, -0.8354664, -2.672634, 0, 1, 0.1294118, 1,
-0.3343801, 0.7231602, -0.2710938, 0, 1, 0.1372549, 1,
-0.3341182, 1.10025, -0.03440996, 0, 1, 0.1411765, 1,
-0.3320442, 0.1221429, -1.441449, 0, 1, 0.1490196, 1,
-0.3306279, 0.3418596, 0.1039593, 0, 1, 0.1529412, 1,
-0.3273616, -1.276443, -2.286509, 0, 1, 0.1607843, 1,
-0.3254111, -0.4088307, -2.294462, 0, 1, 0.1647059, 1,
-0.3187994, 0.6834943, -1.505243, 0, 1, 0.172549, 1,
-0.3180154, -1.789127, -2.538406, 0, 1, 0.1764706, 1,
-0.3137181, -0.03482683, -3.741101, 0, 1, 0.1843137, 1,
-0.3131269, 0.778271, 1.275901, 0, 1, 0.1882353, 1,
-0.3124833, 0.7888284, 0.8634771, 0, 1, 0.1960784, 1,
-0.3060939, -1.647092, -4.20963, 0, 1, 0.2039216, 1,
-0.3044411, -0.1237941, -1.525652, 0, 1, 0.2078431, 1,
-0.3030102, -0.2443997, -2.147796, 0, 1, 0.2156863, 1,
-0.3021376, -0.5041699, -2.072467, 0, 1, 0.2196078, 1,
-0.2997319, 0.06457114, -0.5320415, 0, 1, 0.227451, 1,
-0.2981458, -1.067168, -1.751928, 0, 1, 0.2313726, 1,
-0.2969767, 1.623714, -0.01205493, 0, 1, 0.2392157, 1,
-0.2943123, -0.8463112, -2.465079, 0, 1, 0.2431373, 1,
-0.2938688, -1.397994, -4.925841, 0, 1, 0.2509804, 1,
-0.2927489, -1.530339, -3.901157, 0, 1, 0.254902, 1,
-0.2922577, 0.09653649, -0.1749972, 0, 1, 0.2627451, 1,
-0.2912859, 0.8043081, -0.9590515, 0, 1, 0.2666667, 1,
-0.2886334, 0.03476178, -1.803403, 0, 1, 0.2745098, 1,
-0.2868461, 1.28997, 1.404222, 0, 1, 0.2784314, 1,
-0.2804426, -1.491057, -3.18376, 0, 1, 0.2862745, 1,
-0.2755527, 1.352445, 1.089014, 0, 1, 0.2901961, 1,
-0.2721231, 1.163865, -1.381199, 0, 1, 0.2980392, 1,
-0.2700791, 0.4874747, -0.1614455, 0, 1, 0.3058824, 1,
-0.2679396, -0.813433, -2.75172, 0, 1, 0.3098039, 1,
-0.2673845, 2.665705, 0.07163079, 0, 1, 0.3176471, 1,
-0.2664488, -0.3973033, -2.417947, 0, 1, 0.3215686, 1,
-0.264881, -0.04930982, -1.881457, 0, 1, 0.3294118, 1,
-0.2612335, -1.113195, -3.486091, 0, 1, 0.3333333, 1,
-0.26094, -1.381143, -2.963857, 0, 1, 0.3411765, 1,
-0.2590487, -1.225605, -3.52484, 0, 1, 0.345098, 1,
-0.2583064, -1.968477, -3.890162, 0, 1, 0.3529412, 1,
-0.2558706, -1.078844, -3.840175, 0, 1, 0.3568628, 1,
-0.2511557, -0.002637942, -0.8279985, 0, 1, 0.3647059, 1,
-0.2489243, -1.049455, -2.875262, 0, 1, 0.3686275, 1,
-0.2445198, -0.631271, -3.591631, 0, 1, 0.3764706, 1,
-0.2418533, 0.1218492, 0.1182042, 0, 1, 0.3803922, 1,
-0.2391999, 0.1422291, 0.2988072, 0, 1, 0.3882353, 1,
-0.2373473, -0.7666719, -2.780059, 0, 1, 0.3921569, 1,
-0.237308, -0.01950016, -2.160246, 0, 1, 0.4, 1,
-0.2247398, 1.798184, -1.083982, 0, 1, 0.4078431, 1,
-0.2210605, -0.3980057, -3.740162, 0, 1, 0.4117647, 1,
-0.2205922, -0.3350051, -1.869948, 0, 1, 0.4196078, 1,
-0.2168954, -0.08827084, 0.05461293, 0, 1, 0.4235294, 1,
-0.2135944, 0.2387644, -2.168109, 0, 1, 0.4313726, 1,
-0.2119212, -0.2215318, -4.063681, 0, 1, 0.4352941, 1,
-0.2023714, -0.6419112, -3.460006, 0, 1, 0.4431373, 1,
-0.2012983, -0.09763667, -0.1563836, 0, 1, 0.4470588, 1,
-0.1991346, 1.127515, -0.2031861, 0, 1, 0.454902, 1,
-0.1960131, -2.223286, -1.184246, 0, 1, 0.4588235, 1,
-0.1936214, -1.204538, -3.549167, 0, 1, 0.4666667, 1,
-0.1929007, 0.6314851, -0.02038307, 0, 1, 0.4705882, 1,
-0.1885265, 1.684753, -1.862257, 0, 1, 0.4784314, 1,
-0.1884148, -0.1483221, -2.415323, 0, 1, 0.4823529, 1,
-0.18736, -0.2286401, -1.121621, 0, 1, 0.4901961, 1,
-0.1836089, 1.048965, -0.2493833, 0, 1, 0.4941176, 1,
-0.1801797, -0.5394638, -3.970819, 0, 1, 0.5019608, 1,
-0.1789881, 0.5445592, -0.3508037, 0, 1, 0.509804, 1,
-0.177274, 0.6037778, 0.007635199, 0, 1, 0.5137255, 1,
-0.1763569, -0.3811375, -3.867178, 0, 1, 0.5215687, 1,
-0.1753233, 1.121656, 0.3765584, 0, 1, 0.5254902, 1,
-0.1740325, -1.500351, -3.856817, 0, 1, 0.5333334, 1,
-0.1693339, 0.7946105, -0.8886675, 0, 1, 0.5372549, 1,
-0.1692786, 0.3201139, -0.9903036, 0, 1, 0.5450981, 1,
-0.1681003, -0.7712545, -3.816483, 0, 1, 0.5490196, 1,
-0.1675402, 1.627504, 0.3605084, 0, 1, 0.5568628, 1,
-0.1657687, 0.6665515, 0.08580597, 0, 1, 0.5607843, 1,
-0.1629134, 0.2378127, 0.02369711, 0, 1, 0.5686275, 1,
-0.1593976, -0.2324129, -4.604858, 0, 1, 0.572549, 1,
-0.1575354, 2.24851, -0.6733408, 0, 1, 0.5803922, 1,
-0.1563893, -0.3478777, -1.851516, 0, 1, 0.5843138, 1,
-0.1549618, 1.784767, -0.8668744, 0, 1, 0.5921569, 1,
-0.151466, -1.074005, -4.500277, 0, 1, 0.5960785, 1,
-0.1513821, 1.016354, 0.7182051, 0, 1, 0.6039216, 1,
-0.1497494, 0.3598715, 0.01912748, 0, 1, 0.6117647, 1,
-0.1493476, 0.1568432, 0.7044512, 0, 1, 0.6156863, 1,
-0.1470539, -1.310486, -3.219216, 0, 1, 0.6235294, 1,
-0.1412947, 0.3154815, 2.338836, 0, 1, 0.627451, 1,
-0.1400486, 1.081957, -0.2984135, 0, 1, 0.6352941, 1,
-0.1397664, 1.321628, -0.52136, 0, 1, 0.6392157, 1,
-0.1362802, -1.861006, -2.789361, 0, 1, 0.6470588, 1,
-0.1350838, 0.3034377, -0.3089742, 0, 1, 0.6509804, 1,
-0.1312991, -2.862633, -5.059358, 0, 1, 0.6588235, 1,
-0.1288613, 0.0890017, -1.700578, 0, 1, 0.6627451, 1,
-0.1282455, 0.6034825, -1.154756, 0, 1, 0.6705883, 1,
-0.1167843, 0.5478592, 0.1253787, 0, 1, 0.6745098, 1,
-0.1151229, -0.01493152, -2.008613, 0, 1, 0.682353, 1,
-0.1074049, -0.1725706, -0.7810332, 0, 1, 0.6862745, 1,
-0.0995706, 0.8056906, 0.4086346, 0, 1, 0.6941177, 1,
-0.09750409, -0.6531411, -3.5967, 0, 1, 0.7019608, 1,
-0.09629634, 1.441767, -0.3176427, 0, 1, 0.7058824, 1,
-0.09381904, 0.1198184, -1.134337, 0, 1, 0.7137255, 1,
-0.09047768, 0.283704, -0.2830741, 0, 1, 0.7176471, 1,
-0.08665587, -0.1228724, -4.032872, 0, 1, 0.7254902, 1,
-0.08518715, 1.464367, -0.767799, 0, 1, 0.7294118, 1,
-0.08453323, -0.378812, -1.457223, 0, 1, 0.7372549, 1,
-0.08242518, -1.316671, -2.324674, 0, 1, 0.7411765, 1,
-0.07872188, -0.1082537, -1.107817, 0, 1, 0.7490196, 1,
-0.0763331, -0.9500089, -4.761218, 0, 1, 0.7529412, 1,
-0.07448094, 1.141949, -1.225158, 0, 1, 0.7607843, 1,
-0.07215893, 0.108363, 0.670018, 0, 1, 0.7647059, 1,
-0.07210826, -0.3915713, -3.269457, 0, 1, 0.772549, 1,
-0.07151397, 0.4190892, -0.5294909, 0, 1, 0.7764706, 1,
-0.06903004, -1.435545, -3.163349, 0, 1, 0.7843137, 1,
-0.06877068, -0.5657734, -2.329934, 0, 1, 0.7882353, 1,
-0.0651131, 0.2515502, -1.491058, 0, 1, 0.7960784, 1,
-0.05935447, 1.172709, -1.766101, 0, 1, 0.8039216, 1,
-0.05847497, 0.0345357, -2.563564, 0, 1, 0.8078431, 1,
-0.05058683, -1.11034, -1.930145, 0, 1, 0.8156863, 1,
-0.04941819, 1.577055, -1.834651, 0, 1, 0.8196079, 1,
-0.04743568, 0.4855321, -0.4493644, 0, 1, 0.827451, 1,
-0.04360893, -0.0708471, -3.987458, 0, 1, 0.8313726, 1,
-0.04035225, -0.5562278, -2.498012, 0, 1, 0.8392157, 1,
-0.03814666, -2.660834, -3.354555, 0, 1, 0.8431373, 1,
-0.03608361, -0.3426814, -0.7651578, 0, 1, 0.8509804, 1,
-0.0340193, -0.9916394, -3.326371, 0, 1, 0.854902, 1,
-0.03282535, -0.4722051, -2.657429, 0, 1, 0.8627451, 1,
-0.02808689, 0.5258962, 1.083348, 0, 1, 0.8666667, 1,
-0.0212632, -2.073563, -2.628088, 0, 1, 0.8745098, 1,
-0.02085407, -2.799488, -3.677171, 0, 1, 0.8784314, 1,
-0.01909439, -1.315732, -2.137832, 0, 1, 0.8862745, 1,
-0.01856468, -0.6604339, -3.316467, 0, 1, 0.8901961, 1,
-0.01800539, 0.8847011, 0.1180594, 0, 1, 0.8980392, 1,
-0.0179875, 0.7381216, 1.306895, 0, 1, 0.9058824, 1,
-0.01134624, 0.2034422, -0.6658409, 0, 1, 0.9098039, 1,
-0.008606795, -0.277999, -3.233038, 0, 1, 0.9176471, 1,
-0.008428723, 0.01924661, -0.7277421, 0, 1, 0.9215686, 1,
-0.007044764, -0.9749026, -3.268828, 0, 1, 0.9294118, 1,
-0.004934687, -0.5779471, -4.959692, 0, 1, 0.9333333, 1,
-0.003847691, -1.165794, -3.379438, 0, 1, 0.9411765, 1,
-0.003116473, 0.5574975, -0.003547976, 0, 1, 0.945098, 1,
-0.002235845, 2.024784, 2.298814, 0, 1, 0.9529412, 1,
0.0003901666, -0.6010641, 2.133628, 0, 1, 0.9568627, 1,
0.0008623742, 1.465254, -1.91751, 0, 1, 0.9647059, 1,
0.001594727, -0.01429037, 3.007695, 0, 1, 0.9686275, 1,
0.00349233, 0.5993214, 0.9521825, 0, 1, 0.9764706, 1,
0.006100887, -0.1422621, 3.557012, 0, 1, 0.9803922, 1,
0.008995978, -1.432979, 4.266258, 0, 1, 0.9882353, 1,
0.009245212, 1.306399, 0.2879337, 0, 1, 0.9921569, 1,
0.009682235, -1.259151, 4.637352, 0, 1, 1, 1,
0.01457509, -0.06227688, 3.671223, 0, 0.9921569, 1, 1,
0.01812438, -0.5460504, 4.832212, 0, 0.9882353, 1, 1,
0.0186658, 2.061409, 0.1062515, 0, 0.9803922, 1, 1,
0.02380601, -0.4526713, 1.818967, 0, 0.9764706, 1, 1,
0.02416339, -0.1034642, 3.615269, 0, 0.9686275, 1, 1,
0.02524555, 0.3511021, 2.504708, 0, 0.9647059, 1, 1,
0.02666855, 1.318122, 0.6933123, 0, 0.9568627, 1, 1,
0.02783353, -1.821847, 3.298303, 0, 0.9529412, 1, 1,
0.03505733, 1.734649, -2.168756, 0, 0.945098, 1, 1,
0.03762461, 0.0940586, 1.848876, 0, 0.9411765, 1, 1,
0.03958486, -0.8306044, 3.529411, 0, 0.9333333, 1, 1,
0.04283961, 0.2143071, 1.040404, 0, 0.9294118, 1, 1,
0.04338847, -0.5698812, 1.840273, 0, 0.9215686, 1, 1,
0.04577431, 1.272237, 1.152594, 0, 0.9176471, 1, 1,
0.04579104, 2.027945, -0.07659443, 0, 0.9098039, 1, 1,
0.04945558, 0.9842812, 0.01597758, 0, 0.9058824, 1, 1,
0.0509186, 0.5730581, 0.1479986, 0, 0.8980392, 1, 1,
0.05143731, 0.2602619, 0.06092583, 0, 0.8901961, 1, 1,
0.05341908, 0.7874622, 0.4588336, 0, 0.8862745, 1, 1,
0.05422634, -0.7131953, 1.070595, 0, 0.8784314, 1, 1,
0.05501346, 0.7722909, -0.1053295, 0, 0.8745098, 1, 1,
0.05560612, 0.009719378, 0.5737536, 0, 0.8666667, 1, 1,
0.05668639, -0.5928921, 4.150957, 0, 0.8627451, 1, 1,
0.05675076, -0.01139689, 2.490009, 0, 0.854902, 1, 1,
0.05697403, 1.303757, -0.5112458, 0, 0.8509804, 1, 1,
0.06336557, -0.7552779, 2.668183, 0, 0.8431373, 1, 1,
0.06573641, 1.660538, -1.279175, 0, 0.8392157, 1, 1,
0.06677276, 0.4494798, 0.5268373, 0, 0.8313726, 1, 1,
0.06688552, -0.7267367, 2.474643, 0, 0.827451, 1, 1,
0.06781179, -0.5261408, 4.642615, 0, 0.8196079, 1, 1,
0.06993239, -0.3824772, 0.8337165, 0, 0.8156863, 1, 1,
0.07113069, 0.8882957, -0.1933663, 0, 0.8078431, 1, 1,
0.07563616, 0.6842957, -0.180234, 0, 0.8039216, 1, 1,
0.07851306, 0.1403208, -0.5352847, 0, 0.7960784, 1, 1,
0.08045135, 0.05446023, 0.7293422, 0, 0.7882353, 1, 1,
0.08840463, -0.8269669, 2.726823, 0, 0.7843137, 1, 1,
0.09099392, 0.07710147, 0.2747749, 0, 0.7764706, 1, 1,
0.09198916, 1.301489, 1.572359, 0, 0.772549, 1, 1,
0.09253739, 0.2902378, 0.1128936, 0, 0.7647059, 1, 1,
0.09308819, -0.8328094, 3.602625, 0, 0.7607843, 1, 1,
0.0942703, -0.4238982, 1.5805, 0, 0.7529412, 1, 1,
0.0961997, 0.8770689, -0.3507623, 0, 0.7490196, 1, 1,
0.09672406, -0.0174901, 2.746387, 0, 0.7411765, 1, 1,
0.1002203, -1.876781, 5.78159, 0, 0.7372549, 1, 1,
0.101715, 0.1749005, 0.6117449, 0, 0.7294118, 1, 1,
0.1024462, -1.165961, 4.272659, 0, 0.7254902, 1, 1,
0.1075852, -1.185903, 2.741394, 0, 0.7176471, 1, 1,
0.1161514, 0.05978232, 1.250805, 0, 0.7137255, 1, 1,
0.1185253, -1.027102, 2.897114, 0, 0.7058824, 1, 1,
0.1192371, -0.1810404, 2.938823, 0, 0.6980392, 1, 1,
0.1201184, -0.07669193, 1.773868, 0, 0.6941177, 1, 1,
0.1232123, -0.8403366, 2.95751, 0, 0.6862745, 1, 1,
0.1264845, 2.022503, 1.328839, 0, 0.682353, 1, 1,
0.129872, -1.471828, 4.635076, 0, 0.6745098, 1, 1,
0.131101, -1.683429, 1.087273, 0, 0.6705883, 1, 1,
0.1334554, 0.1716071, 0.8084757, 0, 0.6627451, 1, 1,
0.1353277, -0.5006697, 3.27646, 0, 0.6588235, 1, 1,
0.1400398, -1.334353, 2.647837, 0, 0.6509804, 1, 1,
0.1407413, -0.6777481, 2.525781, 0, 0.6470588, 1, 1,
0.1466227, -1.010442, 4.68852, 0, 0.6392157, 1, 1,
0.1475291, 1.064496, 0.7315974, 0, 0.6352941, 1, 1,
0.1492273, 0.8996382, 0.6398479, 0, 0.627451, 1, 1,
0.1511975, -0.6338157, 3.315367, 0, 0.6235294, 1, 1,
0.1563169, -0.5187296, 1.468205, 0, 0.6156863, 1, 1,
0.1572506, -0.6008331, 1.620683, 0, 0.6117647, 1, 1,
0.1582229, 0.6672272, -0.1596842, 0, 0.6039216, 1, 1,
0.1606641, -0.7595328, 2.832702, 0, 0.5960785, 1, 1,
0.1610454, -1.203122, 1.497355, 0, 0.5921569, 1, 1,
0.1640912, -0.456538, 0.06448261, 0, 0.5843138, 1, 1,
0.1687176, -0.7186832, 2.661451, 0, 0.5803922, 1, 1,
0.1703614, 0.1177564, 1.002053, 0, 0.572549, 1, 1,
0.1724118, 0.1507059, 0.4216305, 0, 0.5686275, 1, 1,
0.1724646, -0.2271188, 1.481105, 0, 0.5607843, 1, 1,
0.1798476, -0.3237794, 1.287745, 0, 0.5568628, 1, 1,
0.1819459, -1.478341, 2.816775, 0, 0.5490196, 1, 1,
0.183777, 1.294876, -0.9466747, 0, 0.5450981, 1, 1,
0.1842759, -0.4257503, 2.556415, 0, 0.5372549, 1, 1,
0.1905828, 0.2251664, 2.523618, 0, 0.5333334, 1, 1,
0.1946698, 0.8014428, -0.1988547, 0, 0.5254902, 1, 1,
0.2015081, -0.1429159, 2.485224, 0, 0.5215687, 1, 1,
0.2039283, 0.6113864, 1.325242, 0, 0.5137255, 1, 1,
0.2041423, -0.6546387, 3.805742, 0, 0.509804, 1, 1,
0.2065284, 1.319139, 2.371489, 0, 0.5019608, 1, 1,
0.2072009, 3.591653, -0.8768263, 0, 0.4941176, 1, 1,
0.2137697, 0.4378896, 1.470133, 0, 0.4901961, 1, 1,
0.2219332, -0.5148588, 3.98033, 0, 0.4823529, 1, 1,
0.2259195, 1.799356, 0.9588557, 0, 0.4784314, 1, 1,
0.2281993, -1.313426, 3.910989, 0, 0.4705882, 1, 1,
0.2306933, 0.3944403, -0.5301996, 0, 0.4666667, 1, 1,
0.2362669, 1.059995, 0.1633194, 0, 0.4588235, 1, 1,
0.238901, 0.3906322, 0.9464111, 0, 0.454902, 1, 1,
0.2418716, -0.3995526, 2.173517, 0, 0.4470588, 1, 1,
0.2428253, -0.5912132, 0.3403231, 0, 0.4431373, 1, 1,
0.2431784, -1.25838, 3.970789, 0, 0.4352941, 1, 1,
0.2479068, -0.2036726, 1.408596, 0, 0.4313726, 1, 1,
0.2508388, -0.548418, 2.030732, 0, 0.4235294, 1, 1,
0.2520763, 0.6039085, 0.3905823, 0, 0.4196078, 1, 1,
0.2532929, 0.6794651, 0.4935906, 0, 0.4117647, 1, 1,
0.2555866, 1.367384, -0.7522606, 0, 0.4078431, 1, 1,
0.2583574, 0.6958179, 0.8984156, 0, 0.4, 1, 1,
0.2592203, -0.3998473, 1.040393, 0, 0.3921569, 1, 1,
0.2597356, -0.4257798, 4.467316, 0, 0.3882353, 1, 1,
0.2597403, -0.7420515, 2.993515, 0, 0.3803922, 1, 1,
0.2598985, 0.5170783, 0.9766307, 0, 0.3764706, 1, 1,
0.2618798, -0.4911176, 3.146733, 0, 0.3686275, 1, 1,
0.2632109, -0.09374458, 2.691531, 0, 0.3647059, 1, 1,
0.271086, -0.507298, 2.219313, 0, 0.3568628, 1, 1,
0.2729747, 1.746425, 0.4493561, 0, 0.3529412, 1, 1,
0.2754903, -0.3590751, 3.129559, 0, 0.345098, 1, 1,
0.2772584, 2.394666, 0.06312613, 0, 0.3411765, 1, 1,
0.2797271, 0.009732021, 0.6864464, 0, 0.3333333, 1, 1,
0.2819155, 0.04869974, 1.582951, 0, 0.3294118, 1, 1,
0.2845185, -0.7062461, 2.614685, 0, 0.3215686, 1, 1,
0.2848091, -0.4995557, 3.119619, 0, 0.3176471, 1, 1,
0.2855669, 0.6380601, 2.295528, 0, 0.3098039, 1, 1,
0.286681, -0.1376938, 3.548607, 0, 0.3058824, 1, 1,
0.2883568, -1.90464, 2.428319, 0, 0.2980392, 1, 1,
0.288654, 1.230216, -0.6456632, 0, 0.2901961, 1, 1,
0.2908602, 0.640847, -1.712447, 0, 0.2862745, 1, 1,
0.2969532, -0.1504676, 2.173007, 0, 0.2784314, 1, 1,
0.2999576, 0.3330435, 0.9078122, 0, 0.2745098, 1, 1,
0.3046766, -0.2322948, 1.60171, 0, 0.2666667, 1, 1,
0.3121147, 1.530513, 0.08026104, 0, 0.2627451, 1, 1,
0.31455, 0.06659654, 0.8838286, 0, 0.254902, 1, 1,
0.317461, 0.3428422, 1.643648, 0, 0.2509804, 1, 1,
0.3176658, 0.8093752, 1.848136, 0, 0.2431373, 1, 1,
0.3257572, -0.9370254, 1.295734, 0, 0.2392157, 1, 1,
0.3265974, 0.3279644, 0.4698163, 0, 0.2313726, 1, 1,
0.3272029, 1.368431, 3.038149, 0, 0.227451, 1, 1,
0.333489, -1.049822, 2.468068, 0, 0.2196078, 1, 1,
0.3341582, 1.223901, -0.1409533, 0, 0.2156863, 1, 1,
0.3385154, -0.3619348, 1.697988, 0, 0.2078431, 1, 1,
0.3425628, 0.02184943, 2.040031, 0, 0.2039216, 1, 1,
0.3436704, -0.1509888, 1.581839, 0, 0.1960784, 1, 1,
0.3490442, 0.5052766, 0.5994709, 0, 0.1882353, 1, 1,
0.3495394, -0.9281923, 3.845403, 0, 0.1843137, 1, 1,
0.3543779, 0.01982492, 1.493502, 0, 0.1764706, 1, 1,
0.35482, -0.4909514, 3.388913, 0, 0.172549, 1, 1,
0.3571022, 1.12693, -1.023877, 0, 0.1647059, 1, 1,
0.3606188, 0.6819597, 1.095538, 0, 0.1607843, 1, 1,
0.3649041, -0.1583521, 1.059554, 0, 0.1529412, 1, 1,
0.366055, -0.2962347, 1.768935, 0, 0.1490196, 1, 1,
0.3715104, 0.6126708, 0.7547607, 0, 0.1411765, 1, 1,
0.3737102, 0.0703331, 0.4198167, 0, 0.1372549, 1, 1,
0.374462, 0.414912, 1.099238, 0, 0.1294118, 1, 1,
0.3752674, -1.635316, 3.518952, 0, 0.1254902, 1, 1,
0.3779527, -0.7832878, 3.166769, 0, 0.1176471, 1, 1,
0.3791065, 0.6136939, -0.6568635, 0, 0.1137255, 1, 1,
0.3808489, 0.4919547, 1.890991, 0, 0.1058824, 1, 1,
0.3979974, 0.6817306, 0.6830572, 0, 0.09803922, 1, 1,
0.401223, -0.5369309, 1.67726, 0, 0.09411765, 1, 1,
0.4020149, -1.48442, 1.956081, 0, 0.08627451, 1, 1,
0.4138699, -0.8989936, 1.686377, 0, 0.08235294, 1, 1,
0.4151593, -0.5769382, 3.533403, 0, 0.07450981, 1, 1,
0.4153789, -0.9786323, 3.45522, 0, 0.07058824, 1, 1,
0.4156011, -0.2670226, 1.420249, 0, 0.0627451, 1, 1,
0.4159019, 0.1564814, 0.6989731, 0, 0.05882353, 1, 1,
0.4195601, 0.3276584, 0.7921826, 0, 0.05098039, 1, 1,
0.4221355, -0.3283682, 1.059779, 0, 0.04705882, 1, 1,
0.4280886, 0.6191468, -1.104058, 0, 0.03921569, 1, 1,
0.4301532, -0.8514768, 3.230525, 0, 0.03529412, 1, 1,
0.4312832, -0.227964, 2.27025, 0, 0.02745098, 1, 1,
0.4318343, -0.430049, 1.628588, 0, 0.02352941, 1, 1,
0.4357664, -0.0234647, 1.955472, 0, 0.01568628, 1, 1,
0.4402267, -1.68149, 1.815073, 0, 0.01176471, 1, 1,
0.4435008, -1.094965, 3.380602, 0, 0.003921569, 1, 1,
0.452191, -0.4993626, 1.202039, 0.003921569, 0, 1, 1,
0.4543906, -0.6143069, 2.807511, 0.007843138, 0, 1, 1,
0.4549565, -0.006860359, 0.7317208, 0.01568628, 0, 1, 1,
0.4611031, -0.6957172, 1.97862, 0.01960784, 0, 1, 1,
0.4629679, 1.119887, -0.5633917, 0.02745098, 0, 1, 1,
0.4649183, -0.5117304, 2.47922, 0.03137255, 0, 1, 1,
0.4699981, -1.099973, 2.9152, 0.03921569, 0, 1, 1,
0.4734409, 0.131323, 0.5379197, 0.04313726, 0, 1, 1,
0.4748122, -0.03438526, -0.2236893, 0.05098039, 0, 1, 1,
0.4748385, -0.9019348, 2.519522, 0.05490196, 0, 1, 1,
0.4790309, -1.087017, 3.530391, 0.0627451, 0, 1, 1,
0.4846623, -0.2620919, 1.965735, 0.06666667, 0, 1, 1,
0.4848634, 0.02226865, 1.337815, 0.07450981, 0, 1, 1,
0.4871096, 1.731068, 0.8415865, 0.07843138, 0, 1, 1,
0.4924734, -0.2952087, 2.59691, 0.08627451, 0, 1, 1,
0.4939634, 0.4233032, 2.253932, 0.09019608, 0, 1, 1,
0.4941274, 0.1244247, 1.206121, 0.09803922, 0, 1, 1,
0.5003019, -0.2493471, 3.366004, 0.1058824, 0, 1, 1,
0.50644, 0.3054096, 2.467863, 0.1098039, 0, 1, 1,
0.5090562, -0.4112616, 1.079356, 0.1176471, 0, 1, 1,
0.5112404, 0.616547, -0.2637045, 0.1215686, 0, 1, 1,
0.5124083, -0.985983, 2.54238, 0.1294118, 0, 1, 1,
0.5167399, 0.8234343, 1.651613, 0.1333333, 0, 1, 1,
0.5181686, 0.3983706, 1.81845, 0.1411765, 0, 1, 1,
0.5192342, -0.4052634, 1.191924, 0.145098, 0, 1, 1,
0.520341, 1.149507, -0.1901025, 0.1529412, 0, 1, 1,
0.5231518, -1.81206, 1.617997, 0.1568628, 0, 1, 1,
0.5233111, 1.128131, 1.380988, 0.1647059, 0, 1, 1,
0.523709, -0.04992533, 1.703776, 0.1686275, 0, 1, 1,
0.5245574, 1.066303, -0.2455608, 0.1764706, 0, 1, 1,
0.5249374, 0.3262057, 0.3774492, 0.1803922, 0, 1, 1,
0.5272474, 1.308745, 1.230077, 0.1882353, 0, 1, 1,
0.5293098, -0.5052653, 1.478231, 0.1921569, 0, 1, 1,
0.5302274, -1.002947, 3.055917, 0.2, 0, 1, 1,
0.5308722, -0.8765295, 2.002239, 0.2078431, 0, 1, 1,
0.5318892, -0.093555, 2.436689, 0.2117647, 0, 1, 1,
0.5350519, 1.780604, 0.02691345, 0.2196078, 0, 1, 1,
0.536133, 0.9444282, 0.4890242, 0.2235294, 0, 1, 1,
0.5417895, 0.2468429, 1.719882, 0.2313726, 0, 1, 1,
0.5449956, 1.32167, 0.3664375, 0.2352941, 0, 1, 1,
0.5460929, 0.249212, 0.5510818, 0.2431373, 0, 1, 1,
0.5470387, 0.04622912, 1.161648, 0.2470588, 0, 1, 1,
0.5520394, -0.2694484, 2.852272, 0.254902, 0, 1, 1,
0.552264, -0.5955865, 2.092318, 0.2588235, 0, 1, 1,
0.5524459, -0.1528214, 0.8022351, 0.2666667, 0, 1, 1,
0.556109, 0.2341163, 1.92793, 0.2705882, 0, 1, 1,
0.5565847, 0.9410214, 0.5812396, 0.2784314, 0, 1, 1,
0.5636623, -1.629033, 3.995432, 0.282353, 0, 1, 1,
0.5652605, -1.144816, 3.779175, 0.2901961, 0, 1, 1,
0.5663765, 0.6865311, 1.465547, 0.2941177, 0, 1, 1,
0.5696137, 0.5046762, -1.026161, 0.3019608, 0, 1, 1,
0.5737182, -0.3002478, 2.413922, 0.3098039, 0, 1, 1,
0.5776132, 0.4017426, 0.708779, 0.3137255, 0, 1, 1,
0.5801551, 1.662605, 1.556238, 0.3215686, 0, 1, 1,
0.5822928, 1.352266, 0.8928576, 0.3254902, 0, 1, 1,
0.5839524, 0.7031091, 1.194843, 0.3333333, 0, 1, 1,
0.5848269, 0.07998765, 0.5307058, 0.3372549, 0, 1, 1,
0.5895048, -1.000338, 3.488124, 0.345098, 0, 1, 1,
0.5939703, -0.9519884, 3.269951, 0.3490196, 0, 1, 1,
0.5946702, -1.72389, 3.852886, 0.3568628, 0, 1, 1,
0.5962944, 0.407205, 0.4357961, 0.3607843, 0, 1, 1,
0.6188436, -1.115008, 2.782026, 0.3686275, 0, 1, 1,
0.6195739, -0.1008841, 4.905695, 0.372549, 0, 1, 1,
0.6227948, 0.1791262, 1.523017, 0.3803922, 0, 1, 1,
0.6251522, 1.484442, 1.714524, 0.3843137, 0, 1, 1,
0.6257542, -1.842113, 2.85419, 0.3921569, 0, 1, 1,
0.6322266, 0.7901877, 0.2827878, 0.3960784, 0, 1, 1,
0.6361628, -0.06065491, 0.9937932, 0.4039216, 0, 1, 1,
0.6423921, 1.237852, 1.056861, 0.4117647, 0, 1, 1,
0.6479148, 0.7788697, 0.7350805, 0.4156863, 0, 1, 1,
0.6489971, 0.6619609, 1.352533, 0.4235294, 0, 1, 1,
0.6501386, -1.043185, 2.369034, 0.427451, 0, 1, 1,
0.6509901, 0.5967734, 0.6478467, 0.4352941, 0, 1, 1,
0.65504, -0.3761894, 2.840927, 0.4392157, 0, 1, 1,
0.6569142, -0.7457573, 4.937741, 0.4470588, 0, 1, 1,
0.6582658, 1.20109, 0.8230776, 0.4509804, 0, 1, 1,
0.6604828, -1.517354, 2.843298, 0.4588235, 0, 1, 1,
0.6731879, 1.024467, 2.161944, 0.4627451, 0, 1, 1,
0.6823927, 0.4349729, 0.187977, 0.4705882, 0, 1, 1,
0.6855178, 1.263507, -1.468656, 0.4745098, 0, 1, 1,
0.6872433, 0.3767415, 0.556803, 0.4823529, 0, 1, 1,
0.6955456, 1.187739, 0.5666507, 0.4862745, 0, 1, 1,
0.7083046, 1.121803, 0.8670451, 0.4941176, 0, 1, 1,
0.7096007, 0.007939933, 0.8174595, 0.5019608, 0, 1, 1,
0.7103419, 0.1692157, 1.251035, 0.5058824, 0, 1, 1,
0.7132314, -0.4146646, 4.218913, 0.5137255, 0, 1, 1,
0.71797, -0.275442, 3.069012, 0.5176471, 0, 1, 1,
0.7265021, -1.323973, 1.333818, 0.5254902, 0, 1, 1,
0.7383599, 1.575982, 1.466236, 0.5294118, 0, 1, 1,
0.7407117, -0.3557045, 3.370116, 0.5372549, 0, 1, 1,
0.7493865, -0.9092089, 4.471425, 0.5411765, 0, 1, 1,
0.7564256, -2.866453, 3.078448, 0.5490196, 0, 1, 1,
0.7626989, -0.8347335, 2.604168, 0.5529412, 0, 1, 1,
0.7696376, -0.4385477, 3.617327, 0.5607843, 0, 1, 1,
0.7854089, -0.2258918, 2.115658, 0.5647059, 0, 1, 1,
0.7881303, -0.9310951, 3.667476, 0.572549, 0, 1, 1,
0.7894041, -0.5426348, 2.188828, 0.5764706, 0, 1, 1,
0.7908194, -0.6443399, 3.777974, 0.5843138, 0, 1, 1,
0.793396, -0.1568853, 0.1038374, 0.5882353, 0, 1, 1,
0.7978443, -0.6918899, 1.03136, 0.5960785, 0, 1, 1,
0.8006102, -0.317093, 2.269989, 0.6039216, 0, 1, 1,
0.8074473, -0.6286224, 3.125069, 0.6078432, 0, 1, 1,
0.8124759, 0.4095088, 0.5796446, 0.6156863, 0, 1, 1,
0.8163667, -0.1417118, 2.757028, 0.6196079, 0, 1, 1,
0.8169317, 1.351791, -2.023447, 0.627451, 0, 1, 1,
0.8184987, -0.7279467, 0.56674, 0.6313726, 0, 1, 1,
0.8191076, 0.3272872, 1.641706, 0.6392157, 0, 1, 1,
0.8233182, 0.5461236, -0.4140684, 0.6431373, 0, 1, 1,
0.8247926, 0.1376836, 0.5740334, 0.6509804, 0, 1, 1,
0.8284475, 0.2917065, 1.659929, 0.654902, 0, 1, 1,
0.8337542, -1.674388, 2.824608, 0.6627451, 0, 1, 1,
0.8422717, -1.62404, 3.234708, 0.6666667, 0, 1, 1,
0.8479, -2.723928, 2.533802, 0.6745098, 0, 1, 1,
0.8480485, -0.8571389, 1.512013, 0.6784314, 0, 1, 1,
0.8534027, 0.2443968, 1.660909, 0.6862745, 0, 1, 1,
0.8590609, -1.323589, 4.339233, 0.6901961, 0, 1, 1,
0.8598061, -0.05976033, 2.936868, 0.6980392, 0, 1, 1,
0.8605279, -0.9188628, 1.594028, 0.7058824, 0, 1, 1,
0.8649157, -1.189182, 1.881468, 0.7098039, 0, 1, 1,
0.8735732, 1.185143, 0.9939772, 0.7176471, 0, 1, 1,
0.8744079, 3.486145, 0.1708057, 0.7215686, 0, 1, 1,
0.8754062, 0.2341506, 0.6583477, 0.7294118, 0, 1, 1,
0.8809302, -0.3887343, 3.311276, 0.7333333, 0, 1, 1,
0.884707, 0.0960241, -0.6253191, 0.7411765, 0, 1, 1,
0.8873992, -1.280731, 2.777809, 0.7450981, 0, 1, 1,
0.8877154, 1.09111, 1.685451, 0.7529412, 0, 1, 1,
0.8877273, 0.8651996, -0.2744769, 0.7568628, 0, 1, 1,
0.889201, 2.097506, 0.291459, 0.7647059, 0, 1, 1,
0.8903093, 1.100476, -1.596071, 0.7686275, 0, 1, 1,
0.8918531, 0.3963576, 1.106845, 0.7764706, 0, 1, 1,
0.892163, -0.3511524, 1.591555, 0.7803922, 0, 1, 1,
0.8932011, -0.437697, 2.223259, 0.7882353, 0, 1, 1,
0.8951823, -0.4604446, 1.448183, 0.7921569, 0, 1, 1,
0.8977967, 0.7356364, 2.240901, 0.8, 0, 1, 1,
0.8987468, 0.6277753, 2.052871, 0.8078431, 0, 1, 1,
0.910182, -0.5537823, 2.117443, 0.8117647, 0, 1, 1,
0.9179446, -1.299177, 0.7998913, 0.8196079, 0, 1, 1,
0.9191446, -1.061989, 2.764454, 0.8235294, 0, 1, 1,
0.9218014, -0.1730802, 2.586235, 0.8313726, 0, 1, 1,
0.9222671, -1.645925, 1.858771, 0.8352941, 0, 1, 1,
0.922859, -1.714383, 2.142678, 0.8431373, 0, 1, 1,
0.9296034, 0.05441478, -0.0857136, 0.8470588, 0, 1, 1,
0.9333177, -0.1357502, 1.426202, 0.854902, 0, 1, 1,
0.9380715, -1.869616, 2.992711, 0.8588235, 0, 1, 1,
0.9419997, 0.4985836, 1.238306, 0.8666667, 0, 1, 1,
0.9441823, 0.5327665, 2.427594, 0.8705882, 0, 1, 1,
0.9452683, 0.3292716, 1.610941, 0.8784314, 0, 1, 1,
0.9507091, -1.088839, 3.059698, 0.8823529, 0, 1, 1,
0.9525307, -0.7360002, 1.789255, 0.8901961, 0, 1, 1,
0.9604082, 0.1857738, 1.559337, 0.8941177, 0, 1, 1,
0.9611088, -1.531284, 3.902101, 0.9019608, 0, 1, 1,
0.9614516, -1.370745, 2.905358, 0.9098039, 0, 1, 1,
0.9628428, 0.1964349, 2.289124, 0.9137255, 0, 1, 1,
0.9632506, 0.100095, 2.217172, 0.9215686, 0, 1, 1,
0.9656606, -0.1598265, 1.143603, 0.9254902, 0, 1, 1,
0.9658892, -0.7790377, 1.727643, 0.9333333, 0, 1, 1,
0.9694064, -0.5114514, 1.80495, 0.9372549, 0, 1, 1,
0.9699309, 0.1951465, 0.7107192, 0.945098, 0, 1, 1,
0.97012, -2.339052, 3.463284, 0.9490196, 0, 1, 1,
0.9728338, -0.9888853, 1.420528, 0.9568627, 0, 1, 1,
0.9753324, -2.065216, 3.189433, 0.9607843, 0, 1, 1,
0.9768093, 0.6798277, 2.123441, 0.9686275, 0, 1, 1,
0.984031, -2.022729, 3.396476, 0.972549, 0, 1, 1,
0.9848027, 0.7859908, -0.2760242, 0.9803922, 0, 1, 1,
0.9864998, -0.341992, 0.1400701, 0.9843137, 0, 1, 1,
0.9887958, -0.5909063, 1.711738, 0.9921569, 0, 1, 1,
0.9903006, -1.91966, 2.2203, 0.9960784, 0, 1, 1,
0.9914556, 0.7828324, 0.01925077, 1, 0, 0.9960784, 1,
0.9928601, 1.698886, 0.6850477, 1, 0, 0.9882353, 1,
0.9954194, 0.8464518, 0.7283161, 1, 0, 0.9843137, 1,
0.9959455, -0.7591546, 2.433897, 1, 0, 0.9764706, 1,
1.004305, 0.1616585, 0.5572754, 1, 0, 0.972549, 1,
1.007367, -2.113825, 2.476, 1, 0, 0.9647059, 1,
1.00771, 0.2484418, 1.682393, 1, 0, 0.9607843, 1,
1.012285, 0.8722008, -2.084587, 1, 0, 0.9529412, 1,
1.015194, -1.58667, 4.094997, 1, 0, 0.9490196, 1,
1.018959, 0.7625331, -0.239216, 1, 0, 0.9411765, 1,
1.020455, 1.883928, 0.4992057, 1, 0, 0.9372549, 1,
1.022373, -0.9313009, 3.294137, 1, 0, 0.9294118, 1,
1.042509, 0.6634445, 2.817655, 1, 0, 0.9254902, 1,
1.04361, 0.2792558, 1.445683, 1, 0, 0.9176471, 1,
1.04809, 1.105789, 0.9219851, 1, 0, 0.9137255, 1,
1.056702, 2.198428, 0.5882521, 1, 0, 0.9058824, 1,
1.060011, 0.8714101, -0.1938068, 1, 0, 0.9019608, 1,
1.060107, 0.2673184, 3.240669, 1, 0, 0.8941177, 1,
1.062759, -0.8307206, 2.891034, 1, 0, 0.8862745, 1,
1.064823, 1.491679, 0.5395092, 1, 0, 0.8823529, 1,
1.064983, 1.039465, -0.8970161, 1, 0, 0.8745098, 1,
1.065009, -0.8290541, 2.134721, 1, 0, 0.8705882, 1,
1.067372, 1.676721, -0.8362275, 1, 0, 0.8627451, 1,
1.067589, 1.434167, 1.137092, 1, 0, 0.8588235, 1,
1.068478, -1.433734, 1.861234, 1, 0, 0.8509804, 1,
1.073992, 0.2265064, 1.537284, 1, 0, 0.8470588, 1,
1.074106, 1.737294, 1.870805, 1, 0, 0.8392157, 1,
1.083176, 0.4444499, 2.312085, 1, 0, 0.8352941, 1,
1.083927, -0.8367979, 2.590434, 1, 0, 0.827451, 1,
1.084257, -1.537722, 3.078553, 1, 0, 0.8235294, 1,
1.084292, -0.4348028, 2.507318, 1, 0, 0.8156863, 1,
1.086352, 0.2892486, 0.1342883, 1, 0, 0.8117647, 1,
1.093197, 0.310555, 1.805362, 1, 0, 0.8039216, 1,
1.094059, -0.6534283, 1.605128, 1, 0, 0.7960784, 1,
1.094201, 0.4675384, 0.7487996, 1, 0, 0.7921569, 1,
1.095785, -0.9410096, 3.637058, 1, 0, 0.7843137, 1,
1.104983, 1.903613, -0.4103134, 1, 0, 0.7803922, 1,
1.106582, -0.5524694, 3.064052, 1, 0, 0.772549, 1,
1.10874, 0.8136346, 3.381035, 1, 0, 0.7686275, 1,
1.111774, 0.8155242, -0.1661815, 1, 0, 0.7607843, 1,
1.113124, 0.23638, 0.2148047, 1, 0, 0.7568628, 1,
1.116909, 0.04509178, 2.03622, 1, 0, 0.7490196, 1,
1.124867, -0.03410335, -0.57665, 1, 0, 0.7450981, 1,
1.128388, -0.8691239, 1.739623, 1, 0, 0.7372549, 1,
1.133291, -1.566341, 2.229559, 1, 0, 0.7333333, 1,
1.13449, -1.026638, 1.859608, 1, 0, 0.7254902, 1,
1.136776, -0.211951, 2.987656, 1, 0, 0.7215686, 1,
1.142142, -0.1792193, 1.574255, 1, 0, 0.7137255, 1,
1.169307, -1.04522, 1.119622, 1, 0, 0.7098039, 1,
1.17407, -1.010392, 1.647371, 1, 0, 0.7019608, 1,
1.182366, 1.4964, 1.735159, 1, 0, 0.6941177, 1,
1.183353, -0.005364699, 1.703275, 1, 0, 0.6901961, 1,
1.185801, 1.158498, 2.032394, 1, 0, 0.682353, 1,
1.191972, -0.4169579, 0.3622344, 1, 0, 0.6784314, 1,
1.193951, 2.616994, 0.2032522, 1, 0, 0.6705883, 1,
1.194559, 1.421406, -1.006536, 1, 0, 0.6666667, 1,
1.19857, 0.3508419, 0.08646789, 1, 0, 0.6588235, 1,
1.199205, 0.6364588, 2.25105, 1, 0, 0.654902, 1,
1.201077, -0.3264149, 1.234208, 1, 0, 0.6470588, 1,
1.218822, -0.1441578, 2.678842, 1, 0, 0.6431373, 1,
1.225032, -2.642931, 3.009523, 1, 0, 0.6352941, 1,
1.225836, 2.201161, 0.9314823, 1, 0, 0.6313726, 1,
1.227258, -0.138476, 2.445297, 1, 0, 0.6235294, 1,
1.22869, 0.4336062, 1.616507, 1, 0, 0.6196079, 1,
1.233994, -0.6515164, 2.593527, 1, 0, 0.6117647, 1,
1.237702, -0.3950234, -0.07301614, 1, 0, 0.6078432, 1,
1.238884, -1.223437, 2.708956, 1, 0, 0.6, 1,
1.239163, 0.5515876, 2.456032, 1, 0, 0.5921569, 1,
1.261225, 0.03094082, 2.350142, 1, 0, 0.5882353, 1,
1.272114, -0.9773829, 2.786358, 1, 0, 0.5803922, 1,
1.273183, 0.07904165, 2.646102, 1, 0, 0.5764706, 1,
1.280266, -0.4276538, 1.214062, 1, 0, 0.5686275, 1,
1.292596, -0.6433819, 1.883669, 1, 0, 0.5647059, 1,
1.300348, 0.8214314, 1.263101, 1, 0, 0.5568628, 1,
1.309053, -0.8914787, 1.976094, 1, 0, 0.5529412, 1,
1.312185, 0.03706723, 2.195107, 1, 0, 0.5450981, 1,
1.313195, -0.7378693, 1.822994, 1, 0, 0.5411765, 1,
1.316708, -0.4463971, 2.069165, 1, 0, 0.5333334, 1,
1.321952, -0.1875404, -0.7946764, 1, 0, 0.5294118, 1,
1.32303, 0.01291022, 1.615718, 1, 0, 0.5215687, 1,
1.326201, -0.9555635, 1.931524, 1, 0, 0.5176471, 1,
1.33021, -0.946242, 3.847254, 1, 0, 0.509804, 1,
1.342938, 0.4515696, 0.5842198, 1, 0, 0.5058824, 1,
1.355628, -0.6057354, 2.065109, 1, 0, 0.4980392, 1,
1.356629, -0.609598, 3.015563, 1, 0, 0.4901961, 1,
1.360794, 0.3093937, 2.276923, 1, 0, 0.4862745, 1,
1.361594, -0.5057982, 1.165977, 1, 0, 0.4784314, 1,
1.361758, 0.2239648, 0.8328578, 1, 0, 0.4745098, 1,
1.378379, 0.5515805, 0.281512, 1, 0, 0.4666667, 1,
1.378829, -0.7467489, 0.2639124, 1, 0, 0.4627451, 1,
1.37956, -0.9521343, 2.125576, 1, 0, 0.454902, 1,
1.396372, 0.9778257, -0.4495517, 1, 0, 0.4509804, 1,
1.418229, -0.2914377, 0.8918738, 1, 0, 0.4431373, 1,
1.428547, 0.4983219, 1.450799, 1, 0, 0.4392157, 1,
1.458029, -1.456908, 3.224644, 1, 0, 0.4313726, 1,
1.45821, 1.593617, 2.469061, 1, 0, 0.427451, 1,
1.460403, -1.187441, 2.144022, 1, 0, 0.4196078, 1,
1.467272, 0.2890767, 2.262811, 1, 0, 0.4156863, 1,
1.486127, 1.275768, 2.14897, 1, 0, 0.4078431, 1,
1.495248, -0.8259153, 3.019261, 1, 0, 0.4039216, 1,
1.514272, 1.55748, 1.274468, 1, 0, 0.3960784, 1,
1.515379, 0.08392191, -0.008086019, 1, 0, 0.3882353, 1,
1.524539, 0.91533, 1.463114, 1, 0, 0.3843137, 1,
1.536477, -2.614879, 3.47354, 1, 0, 0.3764706, 1,
1.565044, 1.324646, 0.769041, 1, 0, 0.372549, 1,
1.581966, -0.571794, 1.29061, 1, 0, 0.3647059, 1,
1.601606, -1.978022, 1.62513, 1, 0, 0.3607843, 1,
1.611262, -1.007622, 2.792464, 1, 0, 0.3529412, 1,
1.617042, -0.1097292, 2.628946, 1, 0, 0.3490196, 1,
1.622678, -1.06036, 2.911114, 1, 0, 0.3411765, 1,
1.645112, -0.1536158, 2.289724, 1, 0, 0.3372549, 1,
1.657941, -0.5065016, 2.032815, 1, 0, 0.3294118, 1,
1.658334, -0.4522836, 1.603164, 1, 0, 0.3254902, 1,
1.678601, -1.447286, 0.1440155, 1, 0, 0.3176471, 1,
1.707063, -0.2031581, 2.494711, 1, 0, 0.3137255, 1,
1.713912, 0.2032315, 3.314885, 1, 0, 0.3058824, 1,
1.71449, -0.2542448, 0.1172489, 1, 0, 0.2980392, 1,
1.727582, 0.400564, 1.620442, 1, 0, 0.2941177, 1,
1.747709, 1.443938, 1.99224, 1, 0, 0.2862745, 1,
1.754298, 0.5424146, 0.06074435, 1, 0, 0.282353, 1,
1.754912, 0.9366133, 0.4078585, 1, 0, 0.2745098, 1,
1.756359, 0.1286872, 2.97994, 1, 0, 0.2705882, 1,
1.772371, -2.177008, 3.219093, 1, 0, 0.2627451, 1,
1.807598, -0.5385787, 1.381097, 1, 0, 0.2588235, 1,
1.817923, -0.8964738, 0.8172071, 1, 0, 0.2509804, 1,
1.825969, -0.3989055, 2.177464, 1, 0, 0.2470588, 1,
1.836433, 0.6139073, -0.2811008, 1, 0, 0.2392157, 1,
1.868829, -1.173692, 3.351475, 1, 0, 0.2352941, 1,
1.872344, -0.3153086, 2.486178, 1, 0, 0.227451, 1,
1.877021, 0.0239263, 2.737478, 1, 0, 0.2235294, 1,
1.889539, -0.253233, 1.644984, 1, 0, 0.2156863, 1,
1.905882, -0.4777601, 1.509151, 1, 0, 0.2117647, 1,
1.90961, -0.7638123, 3.635129, 1, 0, 0.2039216, 1,
1.914015, -0.1363021, 2.449839, 1, 0, 0.1960784, 1,
1.922814, 0.0011645, 1.126105, 1, 0, 0.1921569, 1,
1.930223, 2.414527, 0.587284, 1, 0, 0.1843137, 1,
1.976121, 0.8527901, 1.432837, 1, 0, 0.1803922, 1,
1.981353, -0.5468298, -0.4424538, 1, 0, 0.172549, 1,
1.998658, 0.4946684, 0.3956845, 1, 0, 0.1686275, 1,
2.015893, -0.7833432, 1.977358, 1, 0, 0.1607843, 1,
2.091202, -1.047838, 3.179342, 1, 0, 0.1568628, 1,
2.106714, -1.115738, 2.669073, 1, 0, 0.1490196, 1,
2.107166, 0.5275545, 1.146768, 1, 0, 0.145098, 1,
2.215057, -0.1825195, 1.887532, 1, 0, 0.1372549, 1,
2.217364, -0.2063488, 0.3799056, 1, 0, 0.1333333, 1,
2.248118, 0.4563031, 1.824064, 1, 0, 0.1254902, 1,
2.273297, 0.5472122, -0.7206098, 1, 0, 0.1215686, 1,
2.282327, 1.195495, 1.008706, 1, 0, 0.1137255, 1,
2.333508, 0.9938014, 1.830354, 1, 0, 0.1098039, 1,
2.387398, -1.096038, 2.334034, 1, 0, 0.1019608, 1,
2.422427, 0.6480591, 1.89726, 1, 0, 0.09411765, 1,
2.533249, 0.726284, -0.1609529, 1, 0, 0.09019608, 1,
2.568253, -1.680587, 2.794277, 1, 0, 0.08235294, 1,
2.584196, -0.04586631, 2.976633, 1, 0, 0.07843138, 1,
2.588969, -0.1825808, 2.682967, 1, 0, 0.07058824, 1,
2.605003, -1.73135, 1.855332, 1, 0, 0.06666667, 1,
2.609207, -0.4688127, 1.891414, 1, 0, 0.05882353, 1,
2.673756, -0.1574064, 1.862224, 1, 0, 0.05490196, 1,
2.747362, -0.820429, 1.738562, 1, 0, 0.04705882, 1,
2.837103, 0.2008808, 1.97714, 1, 0, 0.04313726, 1,
2.904187, 0.5648321, 2.23593, 1, 0, 0.03529412, 1,
2.926864, -0.3196338, 3.014124, 1, 0, 0.03137255, 1,
2.927392, 0.2585059, 1.088911, 1, 0, 0.02352941, 1,
2.947384, 1.475906, 1.657109, 1, 0, 0.01960784, 1,
3.043173, -0.43747, 0.1599152, 1, 0, 0.01176471, 1,
3.101763, -0.1320747, -0.4902575, 1, 0, 0.007843138, 1
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
-0.2463627, -3.961102, -6.896898, 0, -0.5, 0.5, 0.5,
-0.2463627, -3.961102, -6.896898, 1, -0.5, 0.5, 0.5,
-0.2463627, -3.961102, -6.896898, 1, 1.5, 0.5, 0.5,
-0.2463627, -3.961102, -6.896898, 0, 1.5, 0.5, 0.5
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
-4.729502, 0.3626001, -6.896898, 0, -0.5, 0.5, 0.5,
-4.729502, 0.3626001, -6.896898, 1, -0.5, 0.5, 0.5,
-4.729502, 0.3626001, -6.896898, 1, 1.5, 0.5, 0.5,
-4.729502, 0.3626001, -6.896898, 0, 1.5, 0.5, 0.5
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
-4.729502, -3.961102, 0.3611162, 0, -0.5, 0.5, 0.5,
-4.729502, -3.961102, 0.3611162, 1, -0.5, 0.5, 0.5,
-4.729502, -3.961102, 0.3611162, 1, 1.5, 0.5, 0.5,
-4.729502, -3.961102, 0.3611162, 0, 1.5, 0.5, 0.5
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
-3, -2.963324, -5.221972,
3, -2.963324, -5.221972,
-3, -2.963324, -5.221972,
-3, -3.129621, -5.501126,
-2, -2.963324, -5.221972,
-2, -3.129621, -5.501126,
-1, -2.963324, -5.221972,
-1, -3.129621, -5.501126,
0, -2.963324, -5.221972,
0, -3.129621, -5.501126,
1, -2.963324, -5.221972,
1, -3.129621, -5.501126,
2, -2.963324, -5.221972,
2, -3.129621, -5.501126,
3, -2.963324, -5.221972,
3, -3.129621, -5.501126
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
-3, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
-3, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
-3, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
-3, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
-2, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
-2, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
-2, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
-2, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
-1, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
-1, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
-1, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
-1, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
0, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
0, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
0, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
0, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
1, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
1, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
1, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
1, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
2, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
2, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
2, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
2, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5,
3, -3.462213, -6.059435, 0, -0.5, 0.5, 0.5,
3, -3.462213, -6.059435, 1, -0.5, 0.5, 0.5,
3, -3.462213, -6.059435, 1, 1.5, 0.5, 0.5,
3, -3.462213, -6.059435, 0, 1.5, 0.5, 0.5
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
-3.694932, -2, -5.221972,
-3.694932, 3, -5.221972,
-3.694932, -2, -5.221972,
-3.86736, -2, -5.501126,
-3.694932, -1, -5.221972,
-3.86736, -1, -5.501126,
-3.694932, 0, -5.221972,
-3.86736, 0, -5.501126,
-3.694932, 1, -5.221972,
-3.86736, 1, -5.501126,
-3.694932, 2, -5.221972,
-3.86736, 2, -5.501126,
-3.694932, 3, -5.221972,
-3.86736, 3, -5.501126
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
-4.212217, -2, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, -2, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, -2, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, -2, -6.059435, 0, 1.5, 0.5, 0.5,
-4.212217, -1, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, -1, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, -1, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, -1, -6.059435, 0, 1.5, 0.5, 0.5,
-4.212217, 0, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, 0, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, 0, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, 0, -6.059435, 0, 1.5, 0.5, 0.5,
-4.212217, 1, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, 1, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, 1, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, 1, -6.059435, 0, 1.5, 0.5, 0.5,
-4.212217, 2, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, 2, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, 2, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, 2, -6.059435, 0, 1.5, 0.5, 0.5,
-4.212217, 3, -6.059435, 0, -0.5, 0.5, 0.5,
-4.212217, 3, -6.059435, 1, -0.5, 0.5, 0.5,
-4.212217, 3, -6.059435, 1, 1.5, 0.5, 0.5,
-4.212217, 3, -6.059435, 0, 1.5, 0.5, 0.5
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
-3.694932, -2.963324, -4,
-3.694932, -2.963324, 4,
-3.694932, -2.963324, -4,
-3.86736, -3.129621, -4,
-3.694932, -2.963324, -2,
-3.86736, -3.129621, -2,
-3.694932, -2.963324, 0,
-3.86736, -3.129621, 0,
-3.694932, -2.963324, 2,
-3.86736, -3.129621, 2,
-3.694932, -2.963324, 4,
-3.86736, -3.129621, 4
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
-4.212217, -3.462213, -4, 0, -0.5, 0.5, 0.5,
-4.212217, -3.462213, -4, 1, -0.5, 0.5, 0.5,
-4.212217, -3.462213, -4, 1, 1.5, 0.5, 0.5,
-4.212217, -3.462213, -4, 0, 1.5, 0.5, 0.5,
-4.212217, -3.462213, -2, 0, -0.5, 0.5, 0.5,
-4.212217, -3.462213, -2, 1, -0.5, 0.5, 0.5,
-4.212217, -3.462213, -2, 1, 1.5, 0.5, 0.5,
-4.212217, -3.462213, -2, 0, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 0, 0, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 0, 1, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 0, 1, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 0, 0, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 2, 0, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 2, 1, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 2, 1, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 2, 0, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 4, 0, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 4, 1, -0.5, 0.5, 0.5,
-4.212217, -3.462213, 4, 1, 1.5, 0.5, 0.5,
-4.212217, -3.462213, 4, 0, 1.5, 0.5, 0.5
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
-3.694932, -2.963324, -5.221972,
-3.694932, 3.688524, -5.221972,
-3.694932, -2.963324, 5.944204,
-3.694932, 3.688524, 5.944204,
-3.694932, -2.963324, -5.221972,
-3.694932, -2.963324, 5.944204,
-3.694932, 3.688524, -5.221972,
-3.694932, 3.688524, 5.944204,
-3.694932, -2.963324, -5.221972,
3.202206, -2.963324, -5.221972,
-3.694932, -2.963324, 5.944204,
3.202206, -2.963324, 5.944204,
-3.694932, 3.688524, -5.221972,
3.202206, 3.688524, -5.221972,
-3.694932, 3.688524, 5.944204,
3.202206, 3.688524, 5.944204,
3.202206, -2.963324, -5.221972,
3.202206, 3.688524, -5.221972,
3.202206, -2.963324, 5.944204,
3.202206, 3.688524, 5.944204,
3.202206, -2.963324, -5.221972,
3.202206, -2.963324, 5.944204,
3.202206, 3.688524, -5.221972,
3.202206, 3.688524, 5.944204
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
var radius = 7.856978;
var distance = 34.95658;
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
mvMatrix.translate( 0.2463627, -0.3626001, -0.3611162 );
mvMatrix.scale( 1.231687, 1.277106, 0.7607903 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.95658);
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


