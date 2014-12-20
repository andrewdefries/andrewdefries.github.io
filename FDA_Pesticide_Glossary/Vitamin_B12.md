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
-3.098431, 0.2327405, -1.160265, 1, 0, 0, 1,
-3.026266, 0.9967565, -1.759104, 1, 0.007843138, 0, 1,
-2.779926, 1.586808, -2.269418, 1, 0.01176471, 0, 1,
-2.764026, 2.893213, -2.15905, 1, 0.01960784, 0, 1,
-2.63354, -2.490278, -1.28241, 1, 0.02352941, 0, 1,
-2.610883, -1.925045, -0.6628145, 1, 0.03137255, 0, 1,
-2.603064, 1.62939, -0.648509, 1, 0.03529412, 0, 1,
-2.536408, -0.05065953, -2.605102, 1, 0.04313726, 0, 1,
-2.479425, -0.7013103, -0.67077, 1, 0.04705882, 0, 1,
-2.411199, -1.68544, -2.889193, 1, 0.05490196, 0, 1,
-2.321805, -2.668237, -1.749102, 1, 0.05882353, 0, 1,
-2.284704, 0.7563416, -2.215544, 1, 0.06666667, 0, 1,
-2.252045, -0.1393107, -1.308194, 1, 0.07058824, 0, 1,
-2.24878, 1.181394, 0.4063981, 1, 0.07843138, 0, 1,
-2.212183, 0.4516267, -1.100082, 1, 0.08235294, 0, 1,
-2.181512, -0.7077755, -2.665753, 1, 0.09019608, 0, 1,
-2.157367, 0.579165, -0.5220409, 1, 0.09411765, 0, 1,
-2.110089, 0.2600379, -3.224072, 1, 0.1019608, 0, 1,
-2.10004, 0.9619077, -0.8724951, 1, 0.1098039, 0, 1,
-2.055667, 0.3305766, -3.881681, 1, 0.1137255, 0, 1,
-2.001662, 0.3266116, -1.935907, 1, 0.1215686, 0, 1,
-1.995182, 0.2143001, -2.013475, 1, 0.1254902, 0, 1,
-1.990279, -1.825438, -1.578153, 1, 0.1333333, 0, 1,
-1.984169, -0.8173442, -1.270018, 1, 0.1372549, 0, 1,
-1.945604, 0.9715594, -0.9075652, 1, 0.145098, 0, 1,
-1.937975, -0.3579989, -1.059911, 1, 0.1490196, 0, 1,
-1.904647, 0.2728057, -2.401166, 1, 0.1568628, 0, 1,
-1.882286, -0.375014, -1.843975, 1, 0.1607843, 0, 1,
-1.879753, -0.37836, -1.005831, 1, 0.1686275, 0, 1,
-1.870457, 1.35209, -0.7082914, 1, 0.172549, 0, 1,
-1.862936, 0.02307599, -2.128633, 1, 0.1803922, 0, 1,
-1.856341, -1.151735, -1.38129, 1, 0.1843137, 0, 1,
-1.853673, 0.7332196, -2.276452, 1, 0.1921569, 0, 1,
-1.821447, 0.1771628, -2.694976, 1, 0.1960784, 0, 1,
-1.819099, -0.6409284, -2.165089, 1, 0.2039216, 0, 1,
-1.814228, 1.6927, -0.8639443, 1, 0.2117647, 0, 1,
-1.813553, 0.1236025, -1.194178, 1, 0.2156863, 0, 1,
-1.810697, -1.027025, -2.427517, 1, 0.2235294, 0, 1,
-1.798383, 1.360968, -0.3690835, 1, 0.227451, 0, 1,
-1.798244, -0.8937374, -0.9553474, 1, 0.2352941, 0, 1,
-1.795285, -1.038576, -2.893187, 1, 0.2392157, 0, 1,
-1.792003, 0.4790097, -2.656559, 1, 0.2470588, 0, 1,
-1.791317, 0.6397975, -1.044009, 1, 0.2509804, 0, 1,
-1.777651, 0.4690262, -1.89252, 1, 0.2588235, 0, 1,
-1.768544, 0.3006063, -0.0273533, 1, 0.2627451, 0, 1,
-1.76805, -1.79667, -2.480519, 1, 0.2705882, 0, 1,
-1.765423, 0.7370012, -0.381972, 1, 0.2745098, 0, 1,
-1.757608, -0.4334982, -0.9701972, 1, 0.282353, 0, 1,
-1.745405, -0.2321966, -1.466427, 1, 0.2862745, 0, 1,
-1.734348, 0.8254341, 0.09127287, 1, 0.2941177, 0, 1,
-1.73243, 0.1560276, -1.887516, 1, 0.3019608, 0, 1,
-1.704024, -0.1195666, -0.7011607, 1, 0.3058824, 0, 1,
-1.686482, -1.312499, -2.098989, 1, 0.3137255, 0, 1,
-1.685224, -0.2424358, -2.08258, 1, 0.3176471, 0, 1,
-1.681611, -0.7528871, -1.970464, 1, 0.3254902, 0, 1,
-1.67599, -1.053123, -2.136623, 1, 0.3294118, 0, 1,
-1.675288, 1.976831, -1.09527, 1, 0.3372549, 0, 1,
-1.66236, -1.378758, -2.85126, 1, 0.3411765, 0, 1,
-1.648934, -0.9018748, -3.154322, 1, 0.3490196, 0, 1,
-1.645549, 0.2378318, -1.481823, 1, 0.3529412, 0, 1,
-1.643463, 0.3293768, -1.442889, 1, 0.3607843, 0, 1,
-1.613222, 0.5467514, -1.60526, 1, 0.3647059, 0, 1,
-1.60539, -0.2704378, -2.18765, 1, 0.372549, 0, 1,
-1.59807, -0.9243048, -1.755506, 1, 0.3764706, 0, 1,
-1.597539, -0.3058039, -3.18045, 1, 0.3843137, 0, 1,
-1.597425, 0.4040946, -1.120956, 1, 0.3882353, 0, 1,
-1.58735, 0.8343264, 0.7146206, 1, 0.3960784, 0, 1,
-1.563118, 0.00696715, -0.5262725, 1, 0.4039216, 0, 1,
-1.562072, -1.355519, -3.016206, 1, 0.4078431, 0, 1,
-1.556753, 0.3224452, -1.641356, 1, 0.4156863, 0, 1,
-1.554573, 1.018142, 0.270271, 1, 0.4196078, 0, 1,
-1.530004, 0.8463213, -1.863573, 1, 0.427451, 0, 1,
-1.516473, -0.1004798, -1.677676, 1, 0.4313726, 0, 1,
-1.497771, -0.3688364, -2.262483, 1, 0.4392157, 0, 1,
-1.49586, -0.4200341, -0.9341649, 1, 0.4431373, 0, 1,
-1.493728, 0.6067608, -0.4122547, 1, 0.4509804, 0, 1,
-1.490561, -0.01151864, -1.582089, 1, 0.454902, 0, 1,
-1.483618, 0.1985165, -0.4641446, 1, 0.4627451, 0, 1,
-1.473644, -0.3763243, -2.070543, 1, 0.4666667, 0, 1,
-1.465675, -0.0869754, -2.205485, 1, 0.4745098, 0, 1,
-1.464963, -0.01598956, -1.96769, 1, 0.4784314, 0, 1,
-1.462864, 1.293322, -1.225117, 1, 0.4862745, 0, 1,
-1.451876, 0.08505815, 0.03315155, 1, 0.4901961, 0, 1,
-1.449093, 0.1470699, -2.430756, 1, 0.4980392, 0, 1,
-1.44087, 0.3868898, -1.263059, 1, 0.5058824, 0, 1,
-1.417209, -0.9247509, -2.98985, 1, 0.509804, 0, 1,
-1.411551, 1.294587, -1.153233, 1, 0.5176471, 0, 1,
-1.40501, 0.4602531, 0.7880917, 1, 0.5215687, 0, 1,
-1.391301, -0.0008469154, -2.027061, 1, 0.5294118, 0, 1,
-1.384461, 1.362701, -0.5972928, 1, 0.5333334, 0, 1,
-1.37285, 0.05619857, -1.513071, 1, 0.5411765, 0, 1,
-1.351968, 0.07108964, -2.324145, 1, 0.5450981, 0, 1,
-1.350724, -1.227003, -0.1207525, 1, 0.5529412, 0, 1,
-1.348155, 0.2019016, -1.053563, 1, 0.5568628, 0, 1,
-1.347932, -1.165324, -3.072406, 1, 0.5647059, 0, 1,
-1.339259, 0.1902894, -1.855417, 1, 0.5686275, 0, 1,
-1.333828, 0.1891264, -0.2439752, 1, 0.5764706, 0, 1,
-1.329307, -1.588687, -1.340684, 1, 0.5803922, 0, 1,
-1.32767, 0.4439266, -1.521352, 1, 0.5882353, 0, 1,
-1.323175, 1.133264, -0.3567109, 1, 0.5921569, 0, 1,
-1.323142, -1.340228, -0.9072924, 1, 0.6, 0, 1,
-1.318776, 0.6343637, -2.046367, 1, 0.6078432, 0, 1,
-1.309171, 0.8547453, -1.313927, 1, 0.6117647, 0, 1,
-1.299666, 1.24102, -0.7142836, 1, 0.6196079, 0, 1,
-1.292698, 0.1534127, -0.4362641, 1, 0.6235294, 0, 1,
-1.292251, 1.512157, -0.9443954, 1, 0.6313726, 0, 1,
-1.291267, 0.860297, -1.593632, 1, 0.6352941, 0, 1,
-1.2885, -1.193249, -4.70476, 1, 0.6431373, 0, 1,
-1.272758, 0.1658475, -2.230533, 1, 0.6470588, 0, 1,
-1.26335, -0.2132992, -2.739143, 1, 0.654902, 0, 1,
-1.262988, -0.8386117, -3.218108, 1, 0.6588235, 0, 1,
-1.247903, -0.945467, -2.791928, 1, 0.6666667, 0, 1,
-1.246439, 0.8554957, -1.561194, 1, 0.6705883, 0, 1,
-1.241725, 1.064848, -1.592745, 1, 0.6784314, 0, 1,
-1.239164, 0.5293605, -0.5979343, 1, 0.682353, 0, 1,
-1.237561, -0.2119786, -1.471617, 1, 0.6901961, 0, 1,
-1.23616, 0.1596755, -0.7503903, 1, 0.6941177, 0, 1,
-1.236092, 0.5169726, -0.854711, 1, 0.7019608, 0, 1,
-1.232574, 0.5883672, -0.5181952, 1, 0.7098039, 0, 1,
-1.216517, -0.4742115, -3.012255, 1, 0.7137255, 0, 1,
-1.216008, -0.8479055, -2.219019, 1, 0.7215686, 0, 1,
-1.209732, -1.316384, -1.465402, 1, 0.7254902, 0, 1,
-1.193993, 0.0906077, -2.622552, 1, 0.7333333, 0, 1,
-1.185637, 1.404779, -0.4277832, 1, 0.7372549, 0, 1,
-1.183421, -0.5247249, -1.09012, 1, 0.7450981, 0, 1,
-1.160997, 0.7577798, -1.929397, 1, 0.7490196, 0, 1,
-1.153918, -1.142848, -3.285091, 1, 0.7568628, 0, 1,
-1.153412, 1.879287, 0.02210847, 1, 0.7607843, 0, 1,
-1.144827, -2.026729, -2.203401, 1, 0.7686275, 0, 1,
-1.144216, -0.4279826, -1.822803, 1, 0.772549, 0, 1,
-1.138525, 0.334087, -0.3454044, 1, 0.7803922, 0, 1,
-1.137624, 1.543023, -1.673883, 1, 0.7843137, 0, 1,
-1.130524, -0.5144019, -0.6247396, 1, 0.7921569, 0, 1,
-1.12079, 0.01492341, -1.42828, 1, 0.7960784, 0, 1,
-1.119975, -1.685459, -1.913206, 1, 0.8039216, 0, 1,
-1.114895, -0.3188424, -1.437466, 1, 0.8117647, 0, 1,
-1.110201, 2.608455, -0.310537, 1, 0.8156863, 0, 1,
-1.099374, -0.8216397, -3.032682, 1, 0.8235294, 0, 1,
-1.098867, 0.8859114, -1.5426, 1, 0.827451, 0, 1,
-1.095422, -0.8745528, -2.431742, 1, 0.8352941, 0, 1,
-1.094728, -0.3629111, -1.683714, 1, 0.8392157, 0, 1,
-1.087479, -2.558509, -1.489319, 1, 0.8470588, 0, 1,
-1.08314, 0.01852078, -1.578233, 1, 0.8509804, 0, 1,
-1.076006, -0.4779487, -1.81419, 1, 0.8588235, 0, 1,
-1.072417, -1.080429, -3.492392, 1, 0.8627451, 0, 1,
-1.064728, -1.210866, -2.227466, 1, 0.8705882, 0, 1,
-1.063664, -1.403062, -3.216322, 1, 0.8745098, 0, 1,
-1.061074, 0.690486, -1.566077, 1, 0.8823529, 0, 1,
-1.048686, -0.602847, -2.478492, 1, 0.8862745, 0, 1,
-1.046823, 0.7704493, -0.9287316, 1, 0.8941177, 0, 1,
-1.046563, -1.09277, -1.492124, 1, 0.8980392, 0, 1,
-1.044534, -0.06220006, -2.222966, 1, 0.9058824, 0, 1,
-1.043981, 0.1295176, -2.222669, 1, 0.9137255, 0, 1,
-1.036579, -1.147744, 0.1967707, 1, 0.9176471, 0, 1,
-1.031634, -0.637242, -0.3310907, 1, 0.9254902, 0, 1,
-1.031283, -0.1029795, -1.915904, 1, 0.9294118, 0, 1,
-1.029736, 1.370834, -2.228864, 1, 0.9372549, 0, 1,
-1.027581, -1.150327, -2.548989, 1, 0.9411765, 0, 1,
-1.022571, 2.288804, -0.1871546, 1, 0.9490196, 0, 1,
-1.019936, 1.258987, -1.852067, 1, 0.9529412, 0, 1,
-1.019159, 1.517835, -0.9099132, 1, 0.9607843, 0, 1,
-1.013986, -1.26148, -3.867289, 1, 0.9647059, 0, 1,
-1.007998, 1.188474, 0.1094547, 1, 0.972549, 0, 1,
-1.004032, 0.3891509, -0.3414895, 1, 0.9764706, 0, 1,
-0.9943586, -0.5007459, -2.152313, 1, 0.9843137, 0, 1,
-0.9889457, 0.3446669, -1.864369, 1, 0.9882353, 0, 1,
-0.982097, -0.04519667, -1.266309, 1, 0.9960784, 0, 1,
-0.9766349, 0.08089623, -2.793682, 0.9960784, 1, 0, 1,
-0.9752942, 0.02200661, -2.485203, 0.9921569, 1, 0, 1,
-0.9745116, 2.099284, -1.158731, 0.9843137, 1, 0, 1,
-0.9737682, 0.3662719, -1.13054, 0.9803922, 1, 0, 1,
-0.9737025, 0.9428492, -1.118316, 0.972549, 1, 0, 1,
-0.9679925, -0.1669122, -0.1155451, 0.9686275, 1, 0, 1,
-0.9644933, 0.5069354, -0.4126014, 0.9607843, 1, 0, 1,
-0.9627817, -1.676191, -2.916439, 0.9568627, 1, 0, 1,
-0.9619245, 0.7480497, -0.5759354, 0.9490196, 1, 0, 1,
-0.9618809, 2.099898, -1.293463, 0.945098, 1, 0, 1,
-0.9606086, -1.708382, -1.888168, 0.9372549, 1, 0, 1,
-0.9603263, 0.5889266, 0.8483825, 0.9333333, 1, 0, 1,
-0.9588469, 0.5440891, -2.604042, 0.9254902, 1, 0, 1,
-0.9573113, -0.1124865, -1.431785, 0.9215686, 1, 0, 1,
-0.9527171, 2.763175, -1.213299, 0.9137255, 1, 0, 1,
-0.9486972, -0.5449065, -3.516247, 0.9098039, 1, 0, 1,
-0.9458033, 0.4473804, -0.1855037, 0.9019608, 1, 0, 1,
-0.9421857, 0.6160941, -2.920408, 0.8941177, 1, 0, 1,
-0.9298398, 0.2392537, -0.02588969, 0.8901961, 1, 0, 1,
-0.9288502, 1.601236, 0.3118114, 0.8823529, 1, 0, 1,
-0.9286623, -0.5645667, -3.004787, 0.8784314, 1, 0, 1,
-0.9216227, 0.9166868, -0.4030365, 0.8705882, 1, 0, 1,
-0.9137961, 0.8670062, -0.6078947, 0.8666667, 1, 0, 1,
-0.9134524, -1.563766, -3.454735, 0.8588235, 1, 0, 1,
-0.9123663, 1.607383, -1.481255, 0.854902, 1, 0, 1,
-0.9043878, -0.5635443, -2.747617, 0.8470588, 1, 0, 1,
-0.9030371, 1.805807, -0.1417285, 0.8431373, 1, 0, 1,
-0.9009811, 0.07781909, -2.00078, 0.8352941, 1, 0, 1,
-0.9004115, 1.279911, -0.1100212, 0.8313726, 1, 0, 1,
-0.8948092, -0.5906866, -0.4927107, 0.8235294, 1, 0, 1,
-0.8922444, 1.557439, -1.403287, 0.8196079, 1, 0, 1,
-0.8922379, 0.3081649, -1.595005, 0.8117647, 1, 0, 1,
-0.8921338, 0.4807802, -1.211383, 0.8078431, 1, 0, 1,
-0.8907638, 0.839572, -0.8372452, 0.8, 1, 0, 1,
-0.8888847, 0.9008257, -0.7072107, 0.7921569, 1, 0, 1,
-0.8888641, 1.434238, 0.7063279, 0.7882353, 1, 0, 1,
-0.887361, -1.095111, -1.059898, 0.7803922, 1, 0, 1,
-0.8805013, 0.8863443, 0.4376934, 0.7764706, 1, 0, 1,
-0.8800531, -0.1816139, -0.9469696, 0.7686275, 1, 0, 1,
-0.878308, -0.2175048, -0.9012883, 0.7647059, 1, 0, 1,
-0.8772339, 0.4885947, -0.8270909, 0.7568628, 1, 0, 1,
-0.8732806, -0.7418597, -5.192761, 0.7529412, 1, 0, 1,
-0.8682361, 0.5889332, -0.5521387, 0.7450981, 1, 0, 1,
-0.8671058, 0.4464688, -0.2580551, 0.7411765, 1, 0, 1,
-0.8625782, -0.02958412, -1.289083, 0.7333333, 1, 0, 1,
-0.8615628, 2.366224, -1.377871, 0.7294118, 1, 0, 1,
-0.8598061, -0.9604349, -2.504034, 0.7215686, 1, 0, 1,
-0.8576569, -0.3806672, -2.469182, 0.7176471, 1, 0, 1,
-0.8541203, 0.6836843, 0.1359405, 0.7098039, 1, 0, 1,
-0.8533656, 0.5748817, -0.7462892, 0.7058824, 1, 0, 1,
-0.85251, 1.860509, -1.961557, 0.6980392, 1, 0, 1,
-0.8474938, -0.5841002, -0.6888688, 0.6901961, 1, 0, 1,
-0.8453996, -0.8984888, -2.505329, 0.6862745, 1, 0, 1,
-0.838475, 0.4137312, -0.8505232, 0.6784314, 1, 0, 1,
-0.8351411, 0.1607581, -2.183464, 0.6745098, 1, 0, 1,
-0.8312336, -1.369665, -2.654388, 0.6666667, 1, 0, 1,
-0.8269548, -0.4850824, -1.68467, 0.6627451, 1, 0, 1,
-0.8253949, -0.1699288, -2.110809, 0.654902, 1, 0, 1,
-0.8246742, 0.2946789, -1.119013, 0.6509804, 1, 0, 1,
-0.8163897, 1.862112, -0.4642739, 0.6431373, 1, 0, 1,
-0.8147807, 0.9334303, 0.09980925, 0.6392157, 1, 0, 1,
-0.8143177, -1.008286, -4.226797, 0.6313726, 1, 0, 1,
-0.8052571, -0.1949405, -0.4453533, 0.627451, 1, 0, 1,
-0.7975857, 2.29537, 0.7622954, 0.6196079, 1, 0, 1,
-0.7954105, -0.4212638, -0.6500465, 0.6156863, 1, 0, 1,
-0.7946477, -0.8025998, -2.0149, 0.6078432, 1, 0, 1,
-0.7920848, -1.578046, -1.843481, 0.6039216, 1, 0, 1,
-0.7911612, 0.3070321, -1.303187, 0.5960785, 1, 0, 1,
-0.7832425, 1.422489, -0.9827378, 0.5882353, 1, 0, 1,
-0.7776698, 1.35171, 1.502881, 0.5843138, 1, 0, 1,
-0.7694049, 1.158518, -0.6517229, 0.5764706, 1, 0, 1,
-0.7679306, 0.2022589, -0.1464837, 0.572549, 1, 0, 1,
-0.762543, 0.522516, 0.6615562, 0.5647059, 1, 0, 1,
-0.7590396, -0.1202543, -3.36834, 0.5607843, 1, 0, 1,
-0.758721, 0.03806419, -2.210361, 0.5529412, 1, 0, 1,
-0.7582351, -1.076856, -2.771973, 0.5490196, 1, 0, 1,
-0.7574715, 0.4178281, -1.360886, 0.5411765, 1, 0, 1,
-0.7497542, 0.1058332, -1.398976, 0.5372549, 1, 0, 1,
-0.7483887, 0.2360652, -0.4425198, 0.5294118, 1, 0, 1,
-0.7435875, 2.443455, 0.3386109, 0.5254902, 1, 0, 1,
-0.7405782, 0.5329012, -0.1136667, 0.5176471, 1, 0, 1,
-0.7369595, -0.4083449, -0.8627399, 0.5137255, 1, 0, 1,
-0.7273923, -0.1918322, -2.190725, 0.5058824, 1, 0, 1,
-0.727111, -0.3991619, -4.250005, 0.5019608, 1, 0, 1,
-0.722911, 0.04971871, 0.566255, 0.4941176, 1, 0, 1,
-0.7151968, -0.6575596, -2.256596, 0.4862745, 1, 0, 1,
-0.7137033, 2.387959, -1.015228, 0.4823529, 1, 0, 1,
-0.7081496, -0.295977, -0.4169058, 0.4745098, 1, 0, 1,
-0.703473, -0.08036656, -0.2416296, 0.4705882, 1, 0, 1,
-0.7019879, 1.127165, -0.3575224, 0.4627451, 1, 0, 1,
-0.697336, -0.1692743, -1.548208, 0.4588235, 1, 0, 1,
-0.6957198, 1.89839, 0.359979, 0.4509804, 1, 0, 1,
-0.694573, 0.6595138, -0.6613314, 0.4470588, 1, 0, 1,
-0.684031, 1.046157, -1.028663, 0.4392157, 1, 0, 1,
-0.6832978, -0.7609053, -0.657564, 0.4352941, 1, 0, 1,
-0.6816083, -0.4243166, -1.553953, 0.427451, 1, 0, 1,
-0.6799822, 0.2127597, -2.073496, 0.4235294, 1, 0, 1,
-0.6784098, 0.1970053, -0.06187362, 0.4156863, 1, 0, 1,
-0.6754962, -0.8427716, -3.536793, 0.4117647, 1, 0, 1,
-0.6688478, 0.2081137, 0.2344723, 0.4039216, 1, 0, 1,
-0.6683475, 0.2830366, -1.834479, 0.3960784, 1, 0, 1,
-0.6669666, -0.1621712, -3.687441, 0.3921569, 1, 0, 1,
-0.6654618, -0.8480074, -1.690769, 0.3843137, 1, 0, 1,
-0.663107, -0.1301132, -1.022388, 0.3803922, 1, 0, 1,
-0.6612639, -0.7088569, -2.665001, 0.372549, 1, 0, 1,
-0.6607835, 2.207624, -1.327595, 0.3686275, 1, 0, 1,
-0.6563109, -0.226595, -3.487182, 0.3607843, 1, 0, 1,
-0.6529309, 0.8728709, -2.385272, 0.3568628, 1, 0, 1,
-0.6519794, -0.1945935, -2.417265, 0.3490196, 1, 0, 1,
-0.643527, -1.920632, -1.700199, 0.345098, 1, 0, 1,
-0.6410568, -0.6338221, -3.188362, 0.3372549, 1, 0, 1,
-0.6375015, 1.281018, -0.08620587, 0.3333333, 1, 0, 1,
-0.6365733, 0.9563777, -1.163246, 0.3254902, 1, 0, 1,
-0.6316187, -1.987966, -1.031352, 0.3215686, 1, 0, 1,
-0.6247963, 0.4351961, -1.682093, 0.3137255, 1, 0, 1,
-0.6205759, 0.6999227, 0.5783959, 0.3098039, 1, 0, 1,
-0.6185622, -0.4160562, -1.23022, 0.3019608, 1, 0, 1,
-0.6160221, -1.859478, -2.73977, 0.2941177, 1, 0, 1,
-0.6137052, 0.6883159, 0.2483376, 0.2901961, 1, 0, 1,
-0.6099054, 0.8967056, 0.963096, 0.282353, 1, 0, 1,
-0.6082666, -0.7576349, -3.283901, 0.2784314, 1, 0, 1,
-0.60194, -0.2891055, -2.201402, 0.2705882, 1, 0, 1,
-0.6008909, 1.114267, -1.824355, 0.2666667, 1, 0, 1,
-0.5973201, 0.5527132, -1.885432, 0.2588235, 1, 0, 1,
-0.5938271, -0.3239694, 0.2432481, 0.254902, 1, 0, 1,
-0.5919104, 0.6124124, -1.403289, 0.2470588, 1, 0, 1,
-0.59001, -0.8296522, -3.297214, 0.2431373, 1, 0, 1,
-0.5860509, -0.4541167, -3.698348, 0.2352941, 1, 0, 1,
-0.5820773, 0.008226543, -1.56648, 0.2313726, 1, 0, 1,
-0.5818776, 1.80177, 0.5616445, 0.2235294, 1, 0, 1,
-0.5790123, -0.6633324, -2.278259, 0.2196078, 1, 0, 1,
-0.5754517, 2.084482, 0.5888247, 0.2117647, 1, 0, 1,
-0.5747815, 0.2505162, -0.2770199, 0.2078431, 1, 0, 1,
-0.5739915, 0.3608881, -1.578802, 0.2, 1, 0, 1,
-0.5738915, 0.2779485, -0.3086275, 0.1921569, 1, 0, 1,
-0.5700668, -0.2910023, -1.328015, 0.1882353, 1, 0, 1,
-0.5696138, -1.105266, -3.67697, 0.1803922, 1, 0, 1,
-0.5688971, -0.6072962, -2.519248, 0.1764706, 1, 0, 1,
-0.5518154, -1.130259, -2.038238, 0.1686275, 1, 0, 1,
-0.5431675, 1.801355, 0.495301, 0.1647059, 1, 0, 1,
-0.5376238, 1.493191, -1.385594, 0.1568628, 1, 0, 1,
-0.536396, -1.149985, -2.898681, 0.1529412, 1, 0, 1,
-0.5330233, 0.939648, 0.5733919, 0.145098, 1, 0, 1,
-0.5196731, 1.352078, 0.6195669, 0.1411765, 1, 0, 1,
-0.515503, 0.07416736, -2.936955, 0.1333333, 1, 0, 1,
-0.5135961, -1.148191, -4.307743, 0.1294118, 1, 0, 1,
-0.5089676, -0.006471016, -3.982727, 0.1215686, 1, 0, 1,
-0.5045235, 1.181649, -0.6157646, 0.1176471, 1, 0, 1,
-0.5025757, 1.021316, 0.002479442, 0.1098039, 1, 0, 1,
-0.5014378, -0.09131501, -1.513299, 0.1058824, 1, 0, 1,
-0.4921056, -0.5895828, -1.954015, 0.09803922, 1, 0, 1,
-0.4917016, -0.5664188, -2.365845, 0.09019608, 1, 0, 1,
-0.490579, -0.09985901, 0.1910489, 0.08627451, 1, 0, 1,
-0.4879052, -1.352002, -4.427238, 0.07843138, 1, 0, 1,
-0.4848966, -0.4334193, -3.590913, 0.07450981, 1, 0, 1,
-0.4748123, 0.3235533, -1.003953, 0.06666667, 1, 0, 1,
-0.4740862, -0.768616, -4.041764, 0.0627451, 1, 0, 1,
-0.4738917, 0.8452255, -0.4158381, 0.05490196, 1, 0, 1,
-0.4738802, 0.1964005, -0.9756658, 0.05098039, 1, 0, 1,
-0.4721453, 0.278659, 0.3164585, 0.04313726, 1, 0, 1,
-0.4692487, 0.3642714, -0.7581806, 0.03921569, 1, 0, 1,
-0.4686327, 0.373309, -0.04369826, 0.03137255, 1, 0, 1,
-0.4630858, 0.3843335, -1.417331, 0.02745098, 1, 0, 1,
-0.4615936, 1.892154, 0.4903647, 0.01960784, 1, 0, 1,
-0.4598099, -0.8432449, -2.024918, 0.01568628, 1, 0, 1,
-0.4582409, -0.1848634, -4.281589, 0.007843138, 1, 0, 1,
-0.4572524, 0.519649, -1.180458, 0.003921569, 1, 0, 1,
-0.4571714, -3.307253, -3.527211, 0, 1, 0.003921569, 1,
-0.4548143, 0.3564481, -0.7998291, 0, 1, 0.01176471, 1,
-0.453687, -0.2717176, -0.7797269, 0, 1, 0.01568628, 1,
-0.4458172, 1.577104, -1.174586, 0, 1, 0.02352941, 1,
-0.4394372, -0.2789129, -1.26682, 0, 1, 0.02745098, 1,
-0.4376646, -1.022727, -2.898966, 0, 1, 0.03529412, 1,
-0.4350928, 0.693487, -2.067851, 0, 1, 0.03921569, 1,
-0.4345579, 1.23083, -2.395361, 0, 1, 0.04705882, 1,
-0.4320175, 0.09873069, -1.436057, 0, 1, 0.05098039, 1,
-0.4293587, -0.4247268, -1.216177, 0, 1, 0.05882353, 1,
-0.4280467, -0.03155849, -2.312747, 0, 1, 0.0627451, 1,
-0.4211456, -1.361449, -3.13833, 0, 1, 0.07058824, 1,
-0.4176442, 0.8472685, -1.763851, 0, 1, 0.07450981, 1,
-0.4031347, -0.3896453, -1.677019, 0, 1, 0.08235294, 1,
-0.4019534, 1.385081, -0.02634748, 0, 1, 0.08627451, 1,
-0.4018146, -0.3232996, -2.76434, 0, 1, 0.09411765, 1,
-0.3997883, 0.6826176, -1.723534, 0, 1, 0.1019608, 1,
-0.3948701, -0.06615538, -1.918428, 0, 1, 0.1058824, 1,
-0.3900456, -0.8178262, -2.387497, 0, 1, 0.1137255, 1,
-0.3847752, -1.631127, -2.286933, 0, 1, 0.1176471, 1,
-0.3756032, 1.42408, -0.7003141, 0, 1, 0.1254902, 1,
-0.3720821, 0.4550463, -2.300802, 0, 1, 0.1294118, 1,
-0.369835, 0.2728779, -0.5449471, 0, 1, 0.1372549, 1,
-0.3644147, -1.072471, -3.015438, 0, 1, 0.1411765, 1,
-0.363197, 1.607443, 0.5974181, 0, 1, 0.1490196, 1,
-0.360364, -2.123461, -3.000556, 0, 1, 0.1529412, 1,
-0.3553321, 1.086519, 0.5146787, 0, 1, 0.1607843, 1,
-0.3512283, -0.4914647, -4.020647, 0, 1, 0.1647059, 1,
-0.3432726, -1.539942, -3.663528, 0, 1, 0.172549, 1,
-0.3402316, 1.252051, -0.7572628, 0, 1, 0.1764706, 1,
-0.3385942, -0.8559897, -3.126871, 0, 1, 0.1843137, 1,
-0.3363956, -0.4712631, -2.978283, 0, 1, 0.1882353, 1,
-0.3357565, 1.400629, -0.8458531, 0, 1, 0.1960784, 1,
-0.330216, -1.230373, -3.196095, 0, 1, 0.2039216, 1,
-0.3286167, -0.2263765, -2.619743, 0, 1, 0.2078431, 1,
-0.3222237, 0.477668, 0.7046671, 0, 1, 0.2156863, 1,
-0.3215089, 1.982218, 0.2898062, 0, 1, 0.2196078, 1,
-0.3191315, -1.447757, -0.8228264, 0, 1, 0.227451, 1,
-0.317573, -1.584845, -2.977105, 0, 1, 0.2313726, 1,
-0.316811, 0.5378988, -0.8616052, 0, 1, 0.2392157, 1,
-0.3121927, 1.1926, -2.419135, 0, 1, 0.2431373, 1,
-0.30331, 0.8289006, -0.783843, 0, 1, 0.2509804, 1,
-0.3025534, 1.377571, -1.318699, 0, 1, 0.254902, 1,
-0.3016721, -1.07305, -0.5862965, 0, 1, 0.2627451, 1,
-0.2992434, -0.9628241, -2.114498, 0, 1, 0.2666667, 1,
-0.2984861, -1.40562, -2.984268, 0, 1, 0.2745098, 1,
-0.2969332, 0.3004944, -0.3736602, 0, 1, 0.2784314, 1,
-0.2917802, -0.3746701, -3.225502, 0, 1, 0.2862745, 1,
-0.2906951, -0.6489487, -3.3745, 0, 1, 0.2901961, 1,
-0.286988, 0.8447632, -1.403542, 0, 1, 0.2980392, 1,
-0.2849838, 0.9218566, -1.12416, 0, 1, 0.3058824, 1,
-0.2839446, -0.8723675, -2.432277, 0, 1, 0.3098039, 1,
-0.2800344, -0.2339141, -4.501762, 0, 1, 0.3176471, 1,
-0.2799723, 1.580003, 0.3345447, 0, 1, 0.3215686, 1,
-0.2710015, -0.2721341, -2.496407, 0, 1, 0.3294118, 1,
-0.2657841, 1.053658, -0.2234183, 0, 1, 0.3333333, 1,
-0.2654663, 0.6852498, -0.681491, 0, 1, 0.3411765, 1,
-0.2608066, 1.215422, 1.297931, 0, 1, 0.345098, 1,
-0.2598682, 0.04741056, -2.307305, 0, 1, 0.3529412, 1,
-0.2553125, 0.3600231, 0.5934039, 0, 1, 0.3568628, 1,
-0.2481658, 1.577514, 0.8500648, 0, 1, 0.3647059, 1,
-0.2478105, 1.877429, -0.003191076, 0, 1, 0.3686275, 1,
-0.2467447, 1.36884, -0.380867, 0, 1, 0.3764706, 1,
-0.2450636, -1.069271, -2.604138, 0, 1, 0.3803922, 1,
-0.2444128, -0.3800406, -3.854702, 0, 1, 0.3882353, 1,
-0.2388482, -0.463397, -3.432992, 0, 1, 0.3921569, 1,
-0.2348988, -0.5567589, -2.641052, 0, 1, 0.4, 1,
-0.2334058, -1.172921, -3.705625, 0, 1, 0.4078431, 1,
-0.231033, -0.3097099, -3.145683, 0, 1, 0.4117647, 1,
-0.224735, -0.2877622, -2.479987, 0, 1, 0.4196078, 1,
-0.2208101, 0.425291, -0.8873502, 0, 1, 0.4235294, 1,
-0.2161476, -0.3656673, -3.375441, 0, 1, 0.4313726, 1,
-0.2151884, 0.5457045, -0.8661556, 0, 1, 0.4352941, 1,
-0.2122494, -1.942924, -3.640156, 0, 1, 0.4431373, 1,
-0.2105293, 0.6215798, 0.3748156, 0, 1, 0.4470588, 1,
-0.2053258, 0.2274438, -1.750902, 0, 1, 0.454902, 1,
-0.201574, 0.8835176, 0.2525018, 0, 1, 0.4588235, 1,
-0.2003965, 1.002666, -0.1837488, 0, 1, 0.4666667, 1,
-0.1984523, -1.060858, -2.52535, 0, 1, 0.4705882, 1,
-0.1921499, 1.711381, -2.447517, 0, 1, 0.4784314, 1,
-0.1911782, -1.028271, -1.462896, 0, 1, 0.4823529, 1,
-0.1882492, 1.419038, -0.09238298, 0, 1, 0.4901961, 1,
-0.1878171, 0.2727301, -0.4266341, 0, 1, 0.4941176, 1,
-0.1850318, 0.4473382, 1.238566, 0, 1, 0.5019608, 1,
-0.1827417, 0.8647766, -0.02167279, 0, 1, 0.509804, 1,
-0.1800071, 0.2138747, -0.4961294, 0, 1, 0.5137255, 1,
-0.1760202, -0.877315, -2.561444, 0, 1, 0.5215687, 1,
-0.1752739, 0.07233985, -1.767917, 0, 1, 0.5254902, 1,
-0.173585, -0.539188, -1.684107, 0, 1, 0.5333334, 1,
-0.1729388, -0.5712192, -3.431906, 0, 1, 0.5372549, 1,
-0.1704554, 0.06588117, -0.3448142, 0, 1, 0.5450981, 1,
-0.1692275, -1.604487, -3.898435, 0, 1, 0.5490196, 1,
-0.1658292, 0.1399665, -0.09535165, 0, 1, 0.5568628, 1,
-0.1640988, -0.1903151, -3.103376, 0, 1, 0.5607843, 1,
-0.1638715, -0.6161816, -5.466431, 0, 1, 0.5686275, 1,
-0.162678, 1.061369, -0.8587972, 0, 1, 0.572549, 1,
-0.1621235, -1.041128, -2.75238, 0, 1, 0.5803922, 1,
-0.1615578, 1.245828, 0.7897496, 0, 1, 0.5843138, 1,
-0.1611573, 1.571116, -0.5979083, 0, 1, 0.5921569, 1,
-0.1569927, -0.9752615, -4.453739, 0, 1, 0.5960785, 1,
-0.1553185, -0.3918305, -2.840494, 0, 1, 0.6039216, 1,
-0.1508113, 0.4525446, -2.33406, 0, 1, 0.6117647, 1,
-0.1487849, 0.5272307, 0.3946582, 0, 1, 0.6156863, 1,
-0.1441941, 0.04668716, 0.1107046, 0, 1, 0.6235294, 1,
-0.1441533, -0.624928, -3.332404, 0, 1, 0.627451, 1,
-0.1428088, -0.4188257, -3.410883, 0, 1, 0.6352941, 1,
-0.1399062, 2.314573, -0.2075933, 0, 1, 0.6392157, 1,
-0.1353932, 0.9630113, 0.7573019, 0, 1, 0.6470588, 1,
-0.1323488, -0.8686572, -2.058548, 0, 1, 0.6509804, 1,
-0.1316106, -0.07695016, -1.253406, 0, 1, 0.6588235, 1,
-0.1298725, 0.7888039, -0.1856003, 0, 1, 0.6627451, 1,
-0.1281006, 0.5535975, 1.325945, 0, 1, 0.6705883, 1,
-0.1180881, 0.8794577, 2.015237, 0, 1, 0.6745098, 1,
-0.11449, 0.2959488, 0.2138436, 0, 1, 0.682353, 1,
-0.1135756, 1.808799, 1.939688, 0, 1, 0.6862745, 1,
-0.109012, 1.442976, -0.5602078, 0, 1, 0.6941177, 1,
-0.1076284, 0.2527659, -0.4022013, 0, 1, 0.7019608, 1,
-0.1045817, -1.06633, -2.968002, 0, 1, 0.7058824, 1,
-0.1045076, -0.7285733, -3.08098, 0, 1, 0.7137255, 1,
-0.1021512, -0.3733282, -2.548725, 0, 1, 0.7176471, 1,
-0.1019994, 1.715757, -0.1590649, 0, 1, 0.7254902, 1,
-0.100882, 0.1077131, -1.949692, 0, 1, 0.7294118, 1,
-0.09919011, 0.0775148, -0.3193967, 0, 1, 0.7372549, 1,
-0.09734473, 0.02333604, -1.694993, 0, 1, 0.7411765, 1,
-0.09552263, -0.6956385, -1.364131, 0, 1, 0.7490196, 1,
-0.09111438, -0.6006977, -3.492852, 0, 1, 0.7529412, 1,
-0.0867838, 0.09791509, -0.4205999, 0, 1, 0.7607843, 1,
-0.08519237, 0.5131335, 0.1959402, 0, 1, 0.7647059, 1,
-0.08343735, -0.1629348, -3.376585, 0, 1, 0.772549, 1,
-0.07790454, 0.01711387, 0.2769092, 0, 1, 0.7764706, 1,
-0.07142346, -2.196806, -3.787736, 0, 1, 0.7843137, 1,
-0.0697219, 0.03327608, -1.473088, 0, 1, 0.7882353, 1,
-0.06587952, -0.5128626, -2.115212, 0, 1, 0.7960784, 1,
-0.05961091, -0.1974774, -4.10381, 0, 1, 0.8039216, 1,
-0.05722921, 1.488502, -2.292643, 0, 1, 0.8078431, 1,
-0.0485297, 0.8275674, 2.481115, 0, 1, 0.8156863, 1,
-0.04828092, -0.6884255, -2.941123, 0, 1, 0.8196079, 1,
-0.0472651, 1.092394, -0.7844855, 0, 1, 0.827451, 1,
-0.044088, -0.3337181, -3.3639, 0, 1, 0.8313726, 1,
-0.04035492, -1.621073, -3.502398, 0, 1, 0.8392157, 1,
-0.0397657, -1.73864, -2.676777, 0, 1, 0.8431373, 1,
-0.03897345, 2.572472, -0.428415, 0, 1, 0.8509804, 1,
-0.03339377, 1.417759, -0.7431806, 0, 1, 0.854902, 1,
-0.02831741, 0.4606576, 0.2141507, 0, 1, 0.8627451, 1,
-0.02791456, 0.5570138, -1.468772, 0, 1, 0.8666667, 1,
-0.02675322, -1.482943, -3.35558, 0, 1, 0.8745098, 1,
-0.02600075, 2.017112, 0.1858813, 0, 1, 0.8784314, 1,
-0.01876857, -0.9850005, -3.660275, 0, 1, 0.8862745, 1,
-0.01395794, 0.4807509, -0.9076448, 0, 1, 0.8901961, 1,
-0.01370467, 0.7118379, -0.02861821, 0, 1, 0.8980392, 1,
-0.01280232, 2.243395, -1.108083, 0, 1, 0.9058824, 1,
-0.009978971, 0.9904301, 0.7936513, 0, 1, 0.9098039, 1,
-0.00924608, 0.3874838, 0.127565, 0, 1, 0.9176471, 1,
-0.008215684, -0.04837615, -3.294248, 0, 1, 0.9215686, 1,
-0.005294881, 0.6343996, -0.7269443, 0, 1, 0.9294118, 1,
-0.002162097, 1.704339, -0.5082017, 0, 1, 0.9333333, 1,
-0.0009395895, -0.8952479, -3.944187, 0, 1, 0.9411765, 1,
-0.000626119, -1.198185, -3.592999, 0, 1, 0.945098, 1,
0.004498117, 1.569179, 0.5534693, 0, 1, 0.9529412, 1,
0.006551704, -1.126106, 2.543859, 0, 1, 0.9568627, 1,
0.008641543, 0.8737418, 1.588678, 0, 1, 0.9647059, 1,
0.01310871, -0.7183654, 4.884958, 0, 1, 0.9686275, 1,
0.01448033, -0.5887653, 5.097816, 0, 1, 0.9764706, 1,
0.01574196, 0.4082744, -0.9486659, 0, 1, 0.9803922, 1,
0.01597522, 0.8682595, 0.8337935, 0, 1, 0.9882353, 1,
0.02281278, 0.7872292, -0.6987178, 0, 1, 0.9921569, 1,
0.02562723, 0.7709125, 0.9846139, 0, 1, 1, 1,
0.02865368, 0.7765724, 0.6115016, 0, 0.9921569, 1, 1,
0.03460091, -1.152279, 4.739994, 0, 0.9882353, 1, 1,
0.03626932, -0.3401805, 1.670206, 0, 0.9803922, 1, 1,
0.03631901, 0.6962776, 0.9187301, 0, 0.9764706, 1, 1,
0.04209948, -1.639639, 3.830525, 0, 0.9686275, 1, 1,
0.04273418, -1.153002, 2.298721, 0, 0.9647059, 1, 1,
0.0464524, 0.1730112, 0.1381538, 0, 0.9568627, 1, 1,
0.04962878, 0.6464684, 1.821428, 0, 0.9529412, 1, 1,
0.04965875, -1.267321, 2.206393, 0, 0.945098, 1, 1,
0.05466332, 0.442642, 0.03000037, 0, 0.9411765, 1, 1,
0.05610883, -0.3814268, 2.24302, 0, 0.9333333, 1, 1,
0.06335033, -0.2173775, 2.817874, 0, 0.9294118, 1, 1,
0.0657414, 0.1132257, 0.8855984, 0, 0.9215686, 1, 1,
0.06640878, -1.235991, 2.2209, 0, 0.9176471, 1, 1,
0.06975511, 0.3702605, -0.1340393, 0, 0.9098039, 1, 1,
0.07321853, -1.568377, 3.963048, 0, 0.9058824, 1, 1,
0.07332786, -0.5177428, 2.233063, 0, 0.8980392, 1, 1,
0.07353418, 0.8431947, 0.6979765, 0, 0.8901961, 1, 1,
0.07364766, -0.2705726, 3.034063, 0, 0.8862745, 1, 1,
0.07762387, -0.2191168, 2.207697, 0, 0.8784314, 1, 1,
0.07889175, 0.7743535, -1.387374, 0, 0.8745098, 1, 1,
0.07970151, 0.2729147, 2.21247, 0, 0.8666667, 1, 1,
0.08191629, 0.1933347, 1.149006, 0, 0.8627451, 1, 1,
0.08221047, -0.5064569, 3.073885, 0, 0.854902, 1, 1,
0.08504602, 0.02463223, 1.276937, 0, 0.8509804, 1, 1,
0.09278494, -0.6631792, 2.61226, 0, 0.8431373, 1, 1,
0.1001729, -1.110286, 2.329822, 0, 0.8392157, 1, 1,
0.1026066, -0.9418517, 1.391996, 0, 0.8313726, 1, 1,
0.1035831, 0.1061744, -1.162396, 0, 0.827451, 1, 1,
0.1067861, -0.78982, 3.289066, 0, 0.8196079, 1, 1,
0.110797, -1.656314, 0.5002845, 0, 0.8156863, 1, 1,
0.1109198, 0.001456729, 2.270012, 0, 0.8078431, 1, 1,
0.112016, -1.288229, 3.492942, 0, 0.8039216, 1, 1,
0.1137388, 1.43246, -0.8282321, 0, 0.7960784, 1, 1,
0.1139295, -1.478302, 3.583457, 0, 0.7882353, 1, 1,
0.115529, -1.700533, 3.409088, 0, 0.7843137, 1, 1,
0.1175875, -0.1299047, 1.73146, 0, 0.7764706, 1, 1,
0.1241014, 1.18284, -0.8353357, 0, 0.772549, 1, 1,
0.1250348, 0.4617022, -1.266093, 0, 0.7647059, 1, 1,
0.1345672, 0.6448454, -0.9942938, 0, 0.7607843, 1, 1,
0.1377479, 1.461593, -1.627616, 0, 0.7529412, 1, 1,
0.1400771, -0.7860259, 2.716118, 0, 0.7490196, 1, 1,
0.1451963, 0.5631381, 1.779048, 0, 0.7411765, 1, 1,
0.1572467, 1.136325, 2.44952, 0, 0.7372549, 1, 1,
0.1589937, -1.821939, 2.538852, 0, 0.7294118, 1, 1,
0.159075, -1.911199, 2.867999, 0, 0.7254902, 1, 1,
0.1641139, 1.732885, -0.4775358, 0, 0.7176471, 1, 1,
0.1705279, -0.3541758, 2.305651, 0, 0.7137255, 1, 1,
0.1712081, 0.6323712, -1.22004, 0, 0.7058824, 1, 1,
0.1724939, 0.3011919, 1.656269, 0, 0.6980392, 1, 1,
0.1746049, -1.448652, 3.003189, 0, 0.6941177, 1, 1,
0.1785303, -0.6639371, 3.835883, 0, 0.6862745, 1, 1,
0.180874, -0.964623, 1.115852, 0, 0.682353, 1, 1,
0.1820704, -0.1594167, 3.039093, 0, 0.6745098, 1, 1,
0.1852445, -0.4156768, 2.520816, 0, 0.6705883, 1, 1,
0.1890998, -1.770392, 3.293958, 0, 0.6627451, 1, 1,
0.1892457, 1.048402, -1.003994, 0, 0.6588235, 1, 1,
0.1893782, -0.5671459, 3.513925, 0, 0.6509804, 1, 1,
0.1912082, -0.7407749, 2.854942, 0, 0.6470588, 1, 1,
0.1991356, -0.516681, 2.01781, 0, 0.6392157, 1, 1,
0.2005029, 0.3979726, 1.419709, 0, 0.6352941, 1, 1,
0.2009972, 0.5020286, 0.0491202, 0, 0.627451, 1, 1,
0.2025013, 1.991643, 0.9773674, 0, 0.6235294, 1, 1,
0.2029391, -1.795998, 4.240814, 0, 0.6156863, 1, 1,
0.2057348, -0.5076857, 1.958617, 0, 0.6117647, 1, 1,
0.2094507, -1.150222, 3.595283, 0, 0.6039216, 1, 1,
0.2130662, -1.341289, 2.299119, 0, 0.5960785, 1, 1,
0.2153371, 0.3928502, -0.1661618, 0, 0.5921569, 1, 1,
0.2158881, 0.3834366, 1.10264, 0, 0.5843138, 1, 1,
0.2174492, 1.672306, -0.09619372, 0, 0.5803922, 1, 1,
0.2178484, -1.351828, 2.880935, 0, 0.572549, 1, 1,
0.21812, 0.3383788, -0.001021477, 0, 0.5686275, 1, 1,
0.2190364, -0.2227538, 1.357877, 0, 0.5607843, 1, 1,
0.2211428, -0.1103803, 1.10379, 0, 0.5568628, 1, 1,
0.2227871, 0.05985168, 1.459262, 0, 0.5490196, 1, 1,
0.2295883, -0.03967851, 2.844697, 0, 0.5450981, 1, 1,
0.2311624, 0.6863169, -0.2290743, 0, 0.5372549, 1, 1,
0.2328696, 0.0538591, 1.873975, 0, 0.5333334, 1, 1,
0.2352227, -0.1761451, 1.861077, 0, 0.5254902, 1, 1,
0.2366512, -0.4454888, 2.86643, 0, 0.5215687, 1, 1,
0.2374258, -0.7230682, 3.98509, 0, 0.5137255, 1, 1,
0.2394687, 0.5249535, -1.404075, 0, 0.509804, 1, 1,
0.249279, 1.257714, -0.0899304, 0, 0.5019608, 1, 1,
0.2501114, -0.2131573, 2.824684, 0, 0.4941176, 1, 1,
0.2585517, 0.4730159, 1.882083, 0, 0.4901961, 1, 1,
0.2593639, 1.315053, 0.6988485, 0, 0.4823529, 1, 1,
0.2797014, -1.496458, 2.690989, 0, 0.4784314, 1, 1,
0.2840869, -0.107766, 0.798468, 0, 0.4705882, 1, 1,
0.2879485, -0.4281877, 1.570314, 0, 0.4666667, 1, 1,
0.288789, -0.643432, 3.231584, 0, 0.4588235, 1, 1,
0.291998, -1.548593, 0.8731998, 0, 0.454902, 1, 1,
0.2951463, 0.6672452, 0.01752272, 0, 0.4470588, 1, 1,
0.2965511, 0.1376871, -0.3223038, 0, 0.4431373, 1, 1,
0.2966643, 0.9269634, -0.5761219, 0, 0.4352941, 1, 1,
0.2970451, 0.1666993, -0.07362849, 0, 0.4313726, 1, 1,
0.2988303, -0.9688681, 2.026701, 0, 0.4235294, 1, 1,
0.3000289, 0.2125858, -0.9158803, 0, 0.4196078, 1, 1,
0.3007551, -0.9115958, 4.068984, 0, 0.4117647, 1, 1,
0.3036672, 0.6084338, -0.3414311, 0, 0.4078431, 1, 1,
0.3110356, 0.6261014, -1.681137, 0, 0.4, 1, 1,
0.3214869, -0.3363149, 2.755101, 0, 0.3921569, 1, 1,
0.327399, 0.5567045, 0.08645038, 0, 0.3882353, 1, 1,
0.3317128, -0.8338083, 0.6121388, 0, 0.3803922, 1, 1,
0.3320285, -0.09436336, -0.619534, 0, 0.3764706, 1, 1,
0.335137, 0.08364916, 0.8236941, 0, 0.3686275, 1, 1,
0.3358233, -1.443259, 2.973874, 0, 0.3647059, 1, 1,
0.335876, 0.9322673, 1.118265, 0, 0.3568628, 1, 1,
0.3401473, -0.307693, 3.193754, 0, 0.3529412, 1, 1,
0.344161, -1.576043, 1.153771, 0, 0.345098, 1, 1,
0.3455746, 1.209506, 0.4354525, 0, 0.3411765, 1, 1,
0.3469027, 1.227311, 0.3842121, 0, 0.3333333, 1, 1,
0.3495485, 0.03149327, 3.109828, 0, 0.3294118, 1, 1,
0.3529383, -0.6293209, 2.049864, 0, 0.3215686, 1, 1,
0.3570966, -1.256886, 4.515668, 0, 0.3176471, 1, 1,
0.3574305, -0.09589104, 2.319956, 0, 0.3098039, 1, 1,
0.3683604, -0.9705896, 4.007274, 0, 0.3058824, 1, 1,
0.3748681, 0.003308271, 1.69028, 0, 0.2980392, 1, 1,
0.3788274, -0.5064688, 2.266549, 0, 0.2901961, 1, 1,
0.3788437, 0.6603561, 0.4188657, 0, 0.2862745, 1, 1,
0.3817367, 0.601173, 0.1953385, 0, 0.2784314, 1, 1,
0.3850893, 2.21867, 2.983534, 0, 0.2745098, 1, 1,
0.3865168, 0.3601874, 1.054543, 0, 0.2666667, 1, 1,
0.3887104, -0.6062025, 1.970243, 0, 0.2627451, 1, 1,
0.3926555, -0.6206859, 3.585631, 0, 0.254902, 1, 1,
0.3929596, 0.6429216, -0.2886511, 0, 0.2509804, 1, 1,
0.396255, -1.165304, 2.352628, 0, 0.2431373, 1, 1,
0.396733, -0.5367948, 3.362812, 0, 0.2392157, 1, 1,
0.3982477, -0.2238429, 2.833954, 0, 0.2313726, 1, 1,
0.4029436, 0.248371, 1.926673, 0, 0.227451, 1, 1,
0.404244, -1.455735, 3.719368, 0, 0.2196078, 1, 1,
0.4088827, -0.1762215, 1.749622, 0, 0.2156863, 1, 1,
0.4133876, -0.282521, 2.632719, 0, 0.2078431, 1, 1,
0.4138004, -1.581522, 1.895235, 0, 0.2039216, 1, 1,
0.4144166, -0.007902398, 2.156402, 0, 0.1960784, 1, 1,
0.415038, -1.422489, 3.197833, 0, 0.1882353, 1, 1,
0.4162497, 0.7783436, -0.6589622, 0, 0.1843137, 1, 1,
0.4167089, -0.6073051, 1.975596, 0, 0.1764706, 1, 1,
0.4231417, -2.227777, 1.416801, 0, 0.172549, 1, 1,
0.423891, -0.02622971, 0.5449499, 0, 0.1647059, 1, 1,
0.4247631, 0.5827171, -0.9706576, 0, 0.1607843, 1, 1,
0.424784, 0.3802308, 0.9387474, 0, 0.1529412, 1, 1,
0.4259068, -1.454522, 1.947076, 0, 0.1490196, 1, 1,
0.4335715, 1.210144, -0.2801267, 0, 0.1411765, 1, 1,
0.4342807, -0.2609768, 2.801393, 0, 0.1372549, 1, 1,
0.4349054, -0.2876604, 2.075355, 0, 0.1294118, 1, 1,
0.4398492, -0.1503135, 0.7253665, 0, 0.1254902, 1, 1,
0.4413968, 0.5477372, 0.8760944, 0, 0.1176471, 1, 1,
0.4481696, 0.3499939, 1.340051, 0, 0.1137255, 1, 1,
0.4496807, 0.2620753, 0.6920856, 0, 0.1058824, 1, 1,
0.4531678, 0.530501, 1.101169, 0, 0.09803922, 1, 1,
0.4559044, 1.411453, -1.00701, 0, 0.09411765, 1, 1,
0.4559901, 1.852316, -0.8617873, 0, 0.08627451, 1, 1,
0.4588992, 1.287742, 0.9099113, 0, 0.08235294, 1, 1,
0.4601627, 1.058331, -0.1641999, 0, 0.07450981, 1, 1,
0.4619363, -0.1376418, 1.215337, 0, 0.07058824, 1, 1,
0.463799, -1.444318, 2.455099, 0, 0.0627451, 1, 1,
0.4724994, 0.8786355, 0.9576651, 0, 0.05882353, 1, 1,
0.4764472, -0.1829046, 3.026561, 0, 0.05098039, 1, 1,
0.4774027, -0.04294854, 0.2027656, 0, 0.04705882, 1, 1,
0.4817805, -0.1235235, 1.126812, 0, 0.03921569, 1, 1,
0.4833793, -0.09822934, 2.460864, 0, 0.03529412, 1, 1,
0.4866805, 0.145125, 0.5138584, 0, 0.02745098, 1, 1,
0.4878547, 0.3291498, 0.8528606, 0, 0.02352941, 1, 1,
0.4890307, -0.2650131, 2.904312, 0, 0.01568628, 1, 1,
0.4905984, -0.3212585, 1.818358, 0, 0.01176471, 1, 1,
0.4915627, -0.2226274, 1.26951, 0, 0.003921569, 1, 1,
0.4934671, -0.6498905, 1.862854, 0.003921569, 0, 1, 1,
0.4938141, -0.4558877, 4.157367, 0.007843138, 0, 1, 1,
0.4945425, -0.2064592, 3.717306, 0.01568628, 0, 1, 1,
0.4954029, 1.272612, 1.086182, 0.01960784, 0, 1, 1,
0.5005398, -1.707046, 2.2798, 0.02745098, 0, 1, 1,
0.5066419, -0.2670991, 1.663684, 0.03137255, 0, 1, 1,
0.5071084, 0.2277164, -0.3311724, 0.03921569, 0, 1, 1,
0.507934, -0.8366206, 1.935785, 0.04313726, 0, 1, 1,
0.5186284, -0.4079187, 1.42909, 0.05098039, 0, 1, 1,
0.5224472, 0.8611905, -1.119499, 0.05490196, 0, 1, 1,
0.5242925, 0.2214442, 2.458256, 0.0627451, 0, 1, 1,
0.5255134, 2.711661, -0.9437369, 0.06666667, 0, 1, 1,
0.5292412, -1.486573, 3.186211, 0.07450981, 0, 1, 1,
0.539841, 0.4127942, 2.509023, 0.07843138, 0, 1, 1,
0.5425636, 0.9450358, -0.6396782, 0.08627451, 0, 1, 1,
0.5447218, 0.4625186, -1.487772, 0.09019608, 0, 1, 1,
0.5448966, 0.4184918, 0.9809899, 0.09803922, 0, 1, 1,
0.548862, -0.5123551, 2.274363, 0.1058824, 0, 1, 1,
0.5511772, -0.9866449, 1.794158, 0.1098039, 0, 1, 1,
0.5516567, 0.09462408, 1.687693, 0.1176471, 0, 1, 1,
0.5528406, 0.01075841, 1.389677, 0.1215686, 0, 1, 1,
0.5556713, -1.289773, 2.401727, 0.1294118, 0, 1, 1,
0.556219, 1.489722, -0.3673954, 0.1333333, 0, 1, 1,
0.5625057, -1.511369, 3.603926, 0.1411765, 0, 1, 1,
0.5669346, 0.8920864, 0.5141518, 0.145098, 0, 1, 1,
0.5670451, 1.058047, 0.8926532, 0.1529412, 0, 1, 1,
0.5679217, -0.08281742, 1.16689, 0.1568628, 0, 1, 1,
0.5688756, -0.8418658, 2.413939, 0.1647059, 0, 1, 1,
0.5779151, -1.147372, 2.75675, 0.1686275, 0, 1, 1,
0.5813245, -0.8998613, 2.52129, 0.1764706, 0, 1, 1,
0.5818141, 0.3567201, 1.086743, 0.1803922, 0, 1, 1,
0.5831158, 0.3246921, -0.1369168, 0.1882353, 0, 1, 1,
0.5868518, -0.8144822, 2.393943, 0.1921569, 0, 1, 1,
0.5896248, -1.359293, 2.899646, 0.2, 0, 1, 1,
0.5935019, -1.056655, 2.46916, 0.2078431, 0, 1, 1,
0.5941285, -0.2908381, 2.256655, 0.2117647, 0, 1, 1,
0.5982758, -0.1192372, 0.8893405, 0.2196078, 0, 1, 1,
0.6079676, 2.250119, 0.3148865, 0.2235294, 0, 1, 1,
0.6130458, -1.047477, 3.144609, 0.2313726, 0, 1, 1,
0.6153466, -0.631776, 0.7019733, 0.2352941, 0, 1, 1,
0.6248184, -1.927778, 3.664871, 0.2431373, 0, 1, 1,
0.6292698, -2.102703, 2.472707, 0.2470588, 0, 1, 1,
0.6297929, -1.023389, 2.684919, 0.254902, 0, 1, 1,
0.6322697, 0.398287, -0.8235818, 0.2588235, 0, 1, 1,
0.6355986, -0.03128166, 2.786557, 0.2666667, 0, 1, 1,
0.6372495, -0.4979382, 2.770019, 0.2705882, 0, 1, 1,
0.6394364, 0.7353379, 0.9084955, 0.2784314, 0, 1, 1,
0.64346, -0.3844912, 1.943111, 0.282353, 0, 1, 1,
0.6441823, 0.1925336, 0.958233, 0.2901961, 0, 1, 1,
0.6473663, -0.9680445, 1.929794, 0.2941177, 0, 1, 1,
0.6476018, -1.667826, 1.257709, 0.3019608, 0, 1, 1,
0.6517183, 0.5499159, 0.1927719, 0.3098039, 0, 1, 1,
0.6522419, -1.938094, 3.528614, 0.3137255, 0, 1, 1,
0.6572927, -1.023676, 4.460795, 0.3215686, 0, 1, 1,
0.6591603, 0.4236774, 2.246192, 0.3254902, 0, 1, 1,
0.6628473, -0.218547, 2.555473, 0.3333333, 0, 1, 1,
0.6632574, -0.3759706, 2.664703, 0.3372549, 0, 1, 1,
0.6656994, -0.5369568, 0.9424892, 0.345098, 0, 1, 1,
0.6692109, -0.8246592, 2.155222, 0.3490196, 0, 1, 1,
0.669418, 0.06485444, 2.001664, 0.3568628, 0, 1, 1,
0.6806124, -0.4102845, 4.204919, 0.3607843, 0, 1, 1,
0.6823749, -1.236223, 2.707252, 0.3686275, 0, 1, 1,
0.6865424, -0.067009, 2.885698, 0.372549, 0, 1, 1,
0.6888228, -1.660479, 2.477277, 0.3803922, 0, 1, 1,
0.6929898, 1.837514, 1.654836, 0.3843137, 0, 1, 1,
0.6951137, -0.04024271, 2.210639, 0.3921569, 0, 1, 1,
0.6954822, -2.449286, 3.000289, 0.3960784, 0, 1, 1,
0.6966944, 0.1615829, 0.6563552, 0.4039216, 0, 1, 1,
0.6983334, -0.4760306, 0.1458061, 0.4117647, 0, 1, 1,
0.7079507, -0.2937722, 2.197958, 0.4156863, 0, 1, 1,
0.7089965, -0.4514651, 3.244999, 0.4235294, 0, 1, 1,
0.7118133, 1.264407, 0.2953091, 0.427451, 0, 1, 1,
0.7162125, -0.2027074, 1.16628, 0.4352941, 0, 1, 1,
0.7170879, 0.9959177, -1.001403, 0.4392157, 0, 1, 1,
0.7171449, -1.226817, 2.083802, 0.4470588, 0, 1, 1,
0.7173023, -0.6956061, 3.770085, 0.4509804, 0, 1, 1,
0.7211974, 0.9444588, 0.05282705, 0.4588235, 0, 1, 1,
0.7229603, -0.3327201, 2.179214, 0.4627451, 0, 1, 1,
0.723017, -0.4063937, 2.445548, 0.4705882, 0, 1, 1,
0.727118, -0.4342169, 1.78176, 0.4745098, 0, 1, 1,
0.7316391, 0.2766, 0.01647959, 0.4823529, 0, 1, 1,
0.7338139, 1.669946, 2.265399, 0.4862745, 0, 1, 1,
0.7338748, -0.8409217, 1.487293, 0.4941176, 0, 1, 1,
0.7345591, 0.1248658, 2.437114, 0.5019608, 0, 1, 1,
0.7354909, -0.422595, 1.320376, 0.5058824, 0, 1, 1,
0.7396606, 0.1211511, 1.991184, 0.5137255, 0, 1, 1,
0.7412369, 0.4781249, 3.710875, 0.5176471, 0, 1, 1,
0.7466778, 1.655464, 0.6244475, 0.5254902, 0, 1, 1,
0.7467721, 1.026317, 2.743971, 0.5294118, 0, 1, 1,
0.7475033, 0.2249616, 0.4468032, 0.5372549, 0, 1, 1,
0.7489777, 0.2440969, 1.576071, 0.5411765, 0, 1, 1,
0.7544262, 1.065481, 0.1451297, 0.5490196, 0, 1, 1,
0.7564583, 0.1540858, 2.340376, 0.5529412, 0, 1, 1,
0.7584308, 0.3527925, 0.5061916, 0.5607843, 0, 1, 1,
0.7601345, -1.742386, 2.690441, 0.5647059, 0, 1, 1,
0.7617375, 0.6711215, 1.168502, 0.572549, 0, 1, 1,
0.7625751, 1.231884, 1.043981, 0.5764706, 0, 1, 1,
0.7654517, -1.512976, 2.985949, 0.5843138, 0, 1, 1,
0.7675112, -1.774896, 2.545631, 0.5882353, 0, 1, 1,
0.7676642, 0.2652019, 1.580789, 0.5960785, 0, 1, 1,
0.770647, -1.274659, 4.23392, 0.6039216, 0, 1, 1,
0.7768919, -1.491691, 2.522216, 0.6078432, 0, 1, 1,
0.7907709, -1.530079, 2.16726, 0.6156863, 0, 1, 1,
0.7943143, 0.551514, 1.931865, 0.6196079, 0, 1, 1,
0.7946739, -0.9328822, 1.618363, 0.627451, 0, 1, 1,
0.7952846, -2.594726, 2.225677, 0.6313726, 0, 1, 1,
0.7978444, 3.441147, 0.3679581, 0.6392157, 0, 1, 1,
0.798165, 0.06914146, 2.935026, 0.6431373, 0, 1, 1,
0.7982749, -2.203347, 3.063489, 0.6509804, 0, 1, 1,
0.7999404, -0.1066477, 1.473358, 0.654902, 0, 1, 1,
0.8013352, -0.4900558, 1.900144, 0.6627451, 0, 1, 1,
0.8069954, 0.8060459, -1.291209, 0.6666667, 0, 1, 1,
0.8071618, 1.403617, -0.4122329, 0.6745098, 0, 1, 1,
0.8091058, 1.183519, 0.8403229, 0.6784314, 0, 1, 1,
0.8091322, -0.3853928, 3.566271, 0.6862745, 0, 1, 1,
0.8108691, -0.8563302, 3.581886, 0.6901961, 0, 1, 1,
0.8121504, -0.7048466, 2.195158, 0.6980392, 0, 1, 1,
0.8132803, 1.980865, -0.1723364, 0.7058824, 0, 1, 1,
0.8163806, 0.01837044, 1.925683, 0.7098039, 0, 1, 1,
0.8232486, -0.1499023, 2.504318, 0.7176471, 0, 1, 1,
0.8272037, 1.153109, -0.9209366, 0.7215686, 0, 1, 1,
0.8326656, 0.8686358, 0.4791918, 0.7294118, 0, 1, 1,
0.8384199, 0.213676, -0.799955, 0.7333333, 0, 1, 1,
0.8394522, 1.03576, 0.1682034, 0.7411765, 0, 1, 1,
0.8406085, 0.1202893, 2.151652, 0.7450981, 0, 1, 1,
0.8523586, -0.8761136, 1.56452, 0.7529412, 0, 1, 1,
0.8535302, -0.6536921, 2.360674, 0.7568628, 0, 1, 1,
0.8540334, -0.08051256, 1.832096, 0.7647059, 0, 1, 1,
0.8550349, 0.57547, -0.3095405, 0.7686275, 0, 1, 1,
0.8566062, -0.4368609, 1.05161, 0.7764706, 0, 1, 1,
0.858452, -0.5349017, 2.378591, 0.7803922, 0, 1, 1,
0.8602358, 0.7530683, -0.1386003, 0.7882353, 0, 1, 1,
0.8635968, 0.5568646, 0.3340018, 0.7921569, 0, 1, 1,
0.8800741, 0.9427977, 1.334043, 0.8, 0, 1, 1,
0.8819246, -0.7519374, 2.419485, 0.8078431, 0, 1, 1,
0.8879389, 0.9360381, 0.02284595, 0.8117647, 0, 1, 1,
0.8949797, 1.40208, 1.996209, 0.8196079, 0, 1, 1,
0.895745, -0.9317298, 4.203005, 0.8235294, 0, 1, 1,
0.902824, 2.922449, -0.4566201, 0.8313726, 0, 1, 1,
0.9033095, 0.8698472, -0.502921, 0.8352941, 0, 1, 1,
0.9080822, -1.217896, 3.189285, 0.8431373, 0, 1, 1,
0.9082394, -1.661388, 1.274051, 0.8470588, 0, 1, 1,
0.9087555, 1.356557, 1.08206, 0.854902, 0, 1, 1,
0.9164909, -0.9052691, 1.301087, 0.8588235, 0, 1, 1,
0.9176489, 1.646492, -0.05169625, 0.8666667, 0, 1, 1,
0.9217533, 1.296313, 0.7639133, 0.8705882, 0, 1, 1,
0.9229048, 1.321022, 0.951187, 0.8784314, 0, 1, 1,
0.9237287, 0.264856, 0.2585137, 0.8823529, 0, 1, 1,
0.9253315, 1.67241, 2.282363, 0.8901961, 0, 1, 1,
0.93727, -1.14478, 2.733221, 0.8941177, 0, 1, 1,
0.9448754, -0.5930533, 3.874018, 0.9019608, 0, 1, 1,
0.9474651, 1.204262, 0.5802374, 0.9098039, 0, 1, 1,
0.9514509, -0.509235, 2.598723, 0.9137255, 0, 1, 1,
0.9580682, 0.09629789, 3.433439, 0.9215686, 0, 1, 1,
0.9605128, -0.7033737, 1.808749, 0.9254902, 0, 1, 1,
0.9642129, -0.5167526, 2.570531, 0.9333333, 0, 1, 1,
0.9680217, 0.1772864, 1.178249, 0.9372549, 0, 1, 1,
0.9692728, 0.1284167, -0.126064, 0.945098, 0, 1, 1,
0.9728364, -1.727455, 2.180813, 0.9490196, 0, 1, 1,
0.9738826, -0.3449195, 2.486991, 0.9568627, 0, 1, 1,
0.9760423, 0.01935992, -0.1475236, 0.9607843, 0, 1, 1,
0.9801037, -0.1675244, 0.9148062, 0.9686275, 0, 1, 1,
0.9872349, 0.2205085, 0.502342, 0.972549, 0, 1, 1,
0.9879063, 0.1991862, 1.755766, 0.9803922, 0, 1, 1,
0.994355, -2.357369, 1.80722, 0.9843137, 0, 1, 1,
0.9977649, -1.07094, 1.568294, 0.9921569, 0, 1, 1,
1.001081, -0.9685947, 3.252243, 0.9960784, 0, 1, 1,
1.001536, -0.8539333, 3.358832, 1, 0, 0.9960784, 1,
1.019282, 0.3380184, 1.605286, 1, 0, 0.9882353, 1,
1.026781, -0.4880527, 2.625323, 1, 0, 0.9843137, 1,
1.027771, -0.566554, 1.949561, 1, 0, 0.9764706, 1,
1.032592, -1.334586, 1.74895, 1, 0, 0.972549, 1,
1.036388, 0.8619663, 1.603768, 1, 0, 0.9647059, 1,
1.03972, 0.02832051, 0.6204027, 1, 0, 0.9607843, 1,
1.045444, 0.4580233, -0.04160186, 1, 0, 0.9529412, 1,
1.04798, -0.2456592, 2.330179, 1, 0, 0.9490196, 1,
1.049598, -0.6753891, 2.079513, 1, 0, 0.9411765, 1,
1.050427, -0.487643, 2.024814, 1, 0, 0.9372549, 1,
1.05784, 0.1043261, 0.7140594, 1, 0, 0.9294118, 1,
1.058487, -0.8218573, 2.481695, 1, 0, 0.9254902, 1,
1.062726, -0.7358834, 2.373303, 1, 0, 0.9176471, 1,
1.066132, 2.003283, 0.3811549, 1, 0, 0.9137255, 1,
1.067855, -1.03151, 1.328785, 1, 0, 0.9058824, 1,
1.073021, 1.535402, 1.520096, 1, 0, 0.9019608, 1,
1.074101, 0.05040617, 0.9186482, 1, 0, 0.8941177, 1,
1.074454, 1.042626, 1.38711, 1, 0, 0.8862745, 1,
1.079651, 0.4548385, 2.402301, 1, 0, 0.8823529, 1,
1.080459, 1.740447, 0.9426185, 1, 0, 0.8745098, 1,
1.081616, 0.2829649, 1.677873, 1, 0, 0.8705882, 1,
1.086882, -0.01632071, 0.6804634, 1, 0, 0.8627451, 1,
1.092133, -0.4371513, 2.304132, 1, 0, 0.8588235, 1,
1.098866, 0.6553669, -1.988533, 1, 0, 0.8509804, 1,
1.103623, -1.552868, 2.90972, 1, 0, 0.8470588, 1,
1.108925, -0.5802944, 3.316154, 1, 0, 0.8392157, 1,
1.113281, 2.406374, -0.5717973, 1, 0, 0.8352941, 1,
1.116454, 0.01836685, 0.8767773, 1, 0, 0.827451, 1,
1.123841, -0.3305129, 2.929116, 1, 0, 0.8235294, 1,
1.145924, 0.8173142, 1.298722, 1, 0, 0.8156863, 1,
1.1527, -0.4061425, 1.141071, 1, 0, 0.8117647, 1,
1.166609, -0.6397908, 3.435539, 1, 0, 0.8039216, 1,
1.173845, -0.7436962, 2.604062, 1, 0, 0.7960784, 1,
1.176238, 0.7295565, -0.02511407, 1, 0, 0.7921569, 1,
1.179181, -1.438456, 2.515949, 1, 0, 0.7843137, 1,
1.185067, -1.005003, 2.638214, 1, 0, 0.7803922, 1,
1.198826, 0.1864844, 0.7454134, 1, 0, 0.772549, 1,
1.201363, -0.6218117, 1.819255, 1, 0, 0.7686275, 1,
1.225537, -1.428015, 2.201037, 1, 0, 0.7607843, 1,
1.237824, 0.4035046, -0.1411723, 1, 0, 0.7568628, 1,
1.24034, -1.581354, 3.486873, 1, 0, 0.7490196, 1,
1.241966, -1.129348, 2.519064, 1, 0, 0.7450981, 1,
1.258812, 0.07531126, 2.261286, 1, 0, 0.7372549, 1,
1.260465, 0.1587755, 0.5645757, 1, 0, 0.7333333, 1,
1.266274, -0.5490284, 3.109078, 1, 0, 0.7254902, 1,
1.269435, 1.561298, 0.8656967, 1, 0, 0.7215686, 1,
1.272092, 1.262057, 2.58601, 1, 0, 0.7137255, 1,
1.275763, -1.775821, 2.495069, 1, 0, 0.7098039, 1,
1.278591, -0.6981415, 3.582762, 1, 0, 0.7019608, 1,
1.283957, -0.5198624, -0.06712338, 1, 0, 0.6941177, 1,
1.287038, 0.5221256, 2.247269, 1, 0, 0.6901961, 1,
1.29782, -0.2061042, 3.181766, 1, 0, 0.682353, 1,
1.299962, 1.867905, 0.1961904, 1, 0, 0.6784314, 1,
1.305537, -0.6106014, 1.37349, 1, 0, 0.6705883, 1,
1.311041, -0.1069107, 1.987193, 1, 0, 0.6666667, 1,
1.313434, 0.4072121, 0.1794111, 1, 0, 0.6588235, 1,
1.316066, 0.5904632, 0.02095461, 1, 0, 0.654902, 1,
1.317657, -0.09354281, 1.601495, 1, 0, 0.6470588, 1,
1.319205, -1.548935, 2.701053, 1, 0, 0.6431373, 1,
1.323684, -0.7480676, 2.772759, 1, 0, 0.6352941, 1,
1.325373, -2.028541, 2.246958, 1, 0, 0.6313726, 1,
1.344805, -0.9657818, 1.470399, 1, 0, 0.6235294, 1,
1.355307, -1.725776, 3.68189, 1, 0, 0.6196079, 1,
1.355828, 1.20809, 1.519512, 1, 0, 0.6117647, 1,
1.356926, 0.8759512, 0.3659653, 1, 0, 0.6078432, 1,
1.356947, -0.7519413, 1.453621, 1, 0, 0.6, 1,
1.357193, 1.527155, 0.8424516, 1, 0, 0.5921569, 1,
1.358121, -0.8677402, 2.129132, 1, 0, 0.5882353, 1,
1.358168, -1.126746, 3.247509, 1, 0, 0.5803922, 1,
1.365233, 0.7179867, -0.2903805, 1, 0, 0.5764706, 1,
1.381009, -1.078539, 2.0483, 1, 0, 0.5686275, 1,
1.382983, -0.1727948, 2.261742, 1, 0, 0.5647059, 1,
1.390514, 1.444334, 1.634658, 1, 0, 0.5568628, 1,
1.394362, 1.374811, 2.301302, 1, 0, 0.5529412, 1,
1.397452, 1.328688, 0.5637683, 1, 0, 0.5450981, 1,
1.398706, 0.364196, 2.139965, 1, 0, 0.5411765, 1,
1.400787, 0.4840991, 1.818252, 1, 0, 0.5333334, 1,
1.406645, 2.246423, 1.402646, 1, 0, 0.5294118, 1,
1.41637, -1.169957, 4.203146, 1, 0, 0.5215687, 1,
1.42022, -1.684592, 1.71617, 1, 0, 0.5176471, 1,
1.421692, -0.3665493, 2.132763, 1, 0, 0.509804, 1,
1.425314, -0.6410534, 2.819007, 1, 0, 0.5058824, 1,
1.439116, -0.8856609, 0.03628463, 1, 0, 0.4980392, 1,
1.443575, 2.256594, 0.02623064, 1, 0, 0.4901961, 1,
1.454331, -0.05682897, 3.628023, 1, 0, 0.4862745, 1,
1.457148, -0.6439549, 2.020876, 1, 0, 0.4784314, 1,
1.463853, 0.1441634, 2.804643, 1, 0, 0.4745098, 1,
1.467909, -1.128765, 1.512325, 1, 0, 0.4666667, 1,
1.478036, -0.4393362, 1.552813, 1, 0, 0.4627451, 1,
1.479659, -0.9964024, 1.608886, 1, 0, 0.454902, 1,
1.485307, 1.424272, 1.537582, 1, 0, 0.4509804, 1,
1.488014, -1.63513, 2.278141, 1, 0, 0.4431373, 1,
1.489211, 1.505806, 0.37736, 1, 0, 0.4392157, 1,
1.49454, 0.2470128, 1.456088, 1, 0, 0.4313726, 1,
1.50355, 1.053244, 1.673084, 1, 0, 0.427451, 1,
1.517693, -0.4750054, 1.304841, 1, 0, 0.4196078, 1,
1.519675, -0.8432533, 2.868608, 1, 0, 0.4156863, 1,
1.535251, -0.05243, 0.3748677, 1, 0, 0.4078431, 1,
1.539257, 1.261441, 1.000231, 1, 0, 0.4039216, 1,
1.539418, -0.54648, 3.37007, 1, 0, 0.3960784, 1,
1.545026, 0.5794073, -0.157386, 1, 0, 0.3882353, 1,
1.547866, -0.182894, 0.4794199, 1, 0, 0.3843137, 1,
1.559805, -0.6073362, 2.849124, 1, 0, 0.3764706, 1,
1.563543, -0.7948888, 2.319725, 1, 0, 0.372549, 1,
1.5818, -0.4790752, 3.997778, 1, 0, 0.3647059, 1,
1.58388, -0.8998688, 2.53368, 1, 0, 0.3607843, 1,
1.628444, 0.136386, 3.054219, 1, 0, 0.3529412, 1,
1.632825, -0.7063864, 1.862941, 1, 0, 0.3490196, 1,
1.635087, 1.067612, 0.4834457, 1, 0, 0.3411765, 1,
1.65733, -0.6077208, 2.387239, 1, 0, 0.3372549, 1,
1.662741, 0.2891571, 3.287325, 1, 0, 0.3294118, 1,
1.667931, 0.3004133, 0.937442, 1, 0, 0.3254902, 1,
1.678049, -1.682791, 2.486301, 1, 0, 0.3176471, 1,
1.693589, 0.04149103, 2.261678, 1, 0, 0.3137255, 1,
1.699465, 1.002525, 2.993668, 1, 0, 0.3058824, 1,
1.711971, -0.9202201, 2.774559, 1, 0, 0.2980392, 1,
1.717864, 0.0840065, 1.936985, 1, 0, 0.2941177, 1,
1.752321, 0.2119641, 2.045769, 1, 0, 0.2862745, 1,
1.756324, -1.400112, 1.169616, 1, 0, 0.282353, 1,
1.75644, 1.512933, 1.633725, 1, 0, 0.2745098, 1,
1.757686, -1.459657, 2.377378, 1, 0, 0.2705882, 1,
1.772689, -0.369782, 3.479598, 1, 0, 0.2627451, 1,
1.814284, -0.8100433, 2.776361, 1, 0, 0.2588235, 1,
1.815696, 0.383136, 2.014696, 1, 0, 0.2509804, 1,
1.840412, 0.1248019, 2.377876, 1, 0, 0.2470588, 1,
1.844555, -0.5424476, 3.269784, 1, 0, 0.2392157, 1,
1.848764, -1.500693, 1.392221, 1, 0, 0.2352941, 1,
1.905224, -1.409238, 0.6593319, 1, 0, 0.227451, 1,
1.906258, 0.3031724, 1.093918, 1, 0, 0.2235294, 1,
1.90629, 0.4241505, 1.430391, 1, 0, 0.2156863, 1,
1.918238, 0.8399577, -0.525736, 1, 0, 0.2117647, 1,
1.925486, -0.8721678, 1.197491, 1, 0, 0.2039216, 1,
1.930662, 1.316906, 2.276315, 1, 0, 0.1960784, 1,
1.946614, 0.07659389, 2.042912, 1, 0, 0.1921569, 1,
1.952446, -0.09492402, 4.120857, 1, 0, 0.1843137, 1,
1.994718, 0.9404095, 1.285326, 1, 0, 0.1803922, 1,
2.000371, 0.6125897, 2.216324, 1, 0, 0.172549, 1,
2.026401, -0.08587783, 1.351335, 1, 0, 0.1686275, 1,
2.027316, 0.6269937, 1.770654, 1, 0, 0.1607843, 1,
2.059454, -1.888081, 2.015799, 1, 0, 0.1568628, 1,
2.063172, 0.8331116, 1.185444, 1, 0, 0.1490196, 1,
2.081689, 0.299017, 0.4618121, 1, 0, 0.145098, 1,
2.171391, 1.706024, 1.367425, 1, 0, 0.1372549, 1,
2.179295, -1.404398, 2.947441, 1, 0, 0.1333333, 1,
2.180083, -0.34464, 1.425795, 1, 0, 0.1254902, 1,
2.203447, 1.555677, 0.5681774, 1, 0, 0.1215686, 1,
2.232512, 1.528226, 1.422704, 1, 0, 0.1137255, 1,
2.298482, -1.443667, 2.51622, 1, 0, 0.1098039, 1,
2.309674, 1.233426, -0.09700707, 1, 0, 0.1019608, 1,
2.330814, -0.8258312, 3.698876, 1, 0, 0.09411765, 1,
2.335912, 1.091551, 1.635313, 1, 0, 0.09019608, 1,
2.366562, 1.307359, -0.5537905, 1, 0, 0.08235294, 1,
2.367726, -0.01653268, 1.195587, 1, 0, 0.07843138, 1,
2.37993, -0.221927, 2.07532, 1, 0, 0.07058824, 1,
2.388716, 0.8678931, 2.2674, 1, 0, 0.06666667, 1,
2.442067, 1.442107, 1.672075, 1, 0, 0.05882353, 1,
2.455891, 1.405313, 1.875093, 1, 0, 0.05490196, 1,
2.488384, 1.221919, 0.4536789, 1, 0, 0.04705882, 1,
2.490281, -0.587504, 2.704602, 1, 0, 0.04313726, 1,
2.625638, -0.3337583, 1.875953, 1, 0, 0.03529412, 1,
2.640844, -0.006134347, 2.994002, 1, 0, 0.03137255, 1,
2.676413, -0.02658345, 1.522764, 1, 0, 0.02352941, 1,
2.712202, 0.4168119, -0.06333429, 1, 0, 0.01960784, 1,
2.843933, 0.0391423, 1.367204, 1, 0, 0.01176471, 1,
3.347737, 0.4774502, 2.175714, 1, 0, 0.007843138, 1
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
0.124653, -4.451107, -7.257071, 0, -0.5, 0.5, 0.5,
0.124653, -4.451107, -7.257071, 1, -0.5, 0.5, 0.5,
0.124653, -4.451107, -7.257071, 1, 1.5, 0.5, 0.5,
0.124653, -4.451107, -7.257071, 0, 1.5, 0.5, 0.5
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
-4.191057, 0.06694674, -7.257071, 0, -0.5, 0.5, 0.5,
-4.191057, 0.06694674, -7.257071, 1, -0.5, 0.5, 0.5,
-4.191057, 0.06694674, -7.257071, 1, 1.5, 0.5, 0.5,
-4.191057, 0.06694674, -7.257071, 0, 1.5, 0.5, 0.5
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
-4.191057, -4.451107, -0.1843073, 0, -0.5, 0.5, 0.5,
-4.191057, -4.451107, -0.1843073, 1, -0.5, 0.5, 0.5,
-4.191057, -4.451107, -0.1843073, 1, 1.5, 0.5, 0.5,
-4.191057, -4.451107, -0.1843073, 0, 1.5, 0.5, 0.5
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
-3, -3.408479, -5.624894,
3, -3.408479, -5.624894,
-3, -3.408479, -5.624894,
-3, -3.582251, -5.896924,
-2, -3.408479, -5.624894,
-2, -3.582251, -5.896924,
-1, -3.408479, -5.624894,
-1, -3.582251, -5.896924,
0, -3.408479, -5.624894,
0, -3.582251, -5.896924,
1, -3.408479, -5.624894,
1, -3.582251, -5.896924,
2, -3.408479, -5.624894,
2, -3.582251, -5.896924,
3, -3.408479, -5.624894,
3, -3.582251, -5.896924
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
-3, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
-3, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
-3, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
-3, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
-2, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
-2, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
-2, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
-2, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
-1, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
-1, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
-1, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
-1, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
0, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
0, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
0, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
0, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
1, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
1, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
1, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
1, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
2, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
2, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
2, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
2, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5,
3, -3.929793, -6.440982, 0, -0.5, 0.5, 0.5,
3, -3.929793, -6.440982, 1, -0.5, 0.5, 0.5,
3, -3.929793, -6.440982, 1, 1.5, 0.5, 0.5,
3, -3.929793, -6.440982, 0, 1.5, 0.5, 0.5
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
-3.195124, -3, -5.624894,
-3.195124, 3, -5.624894,
-3.195124, -3, -5.624894,
-3.361113, -3, -5.896924,
-3.195124, -2, -5.624894,
-3.361113, -2, -5.896924,
-3.195124, -1, -5.624894,
-3.361113, -1, -5.896924,
-3.195124, 0, -5.624894,
-3.361113, 0, -5.896924,
-3.195124, 1, -5.624894,
-3.361113, 1, -5.896924,
-3.195124, 2, -5.624894,
-3.361113, 2, -5.896924,
-3.195124, 3, -5.624894,
-3.361113, 3, -5.896924
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
-3.69309, -3, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, -3, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, -3, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, -3, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, -2, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, -2, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, -2, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, -2, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, -1, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, -1, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, -1, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, -1, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, 0, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, 0, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, 0, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, 0, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, 1, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, 1, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, 1, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, 1, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, 2, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, 2, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, 2, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, 2, -6.440982, 0, 1.5, 0.5, 0.5,
-3.69309, 3, -6.440982, 0, -0.5, 0.5, 0.5,
-3.69309, 3, -6.440982, 1, -0.5, 0.5, 0.5,
-3.69309, 3, -6.440982, 1, 1.5, 0.5, 0.5,
-3.69309, 3, -6.440982, 0, 1.5, 0.5, 0.5
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
-3.195124, -3.408479, -4,
-3.195124, -3.408479, 4,
-3.195124, -3.408479, -4,
-3.361113, -3.582251, -4,
-3.195124, -3.408479, -2,
-3.361113, -3.582251, -2,
-3.195124, -3.408479, 0,
-3.361113, -3.582251, 0,
-3.195124, -3.408479, 2,
-3.361113, -3.582251, 2,
-3.195124, -3.408479, 4,
-3.361113, -3.582251, 4
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
-3.69309, -3.929793, -4, 0, -0.5, 0.5, 0.5,
-3.69309, -3.929793, -4, 1, -0.5, 0.5, 0.5,
-3.69309, -3.929793, -4, 1, 1.5, 0.5, 0.5,
-3.69309, -3.929793, -4, 0, 1.5, 0.5, 0.5,
-3.69309, -3.929793, -2, 0, -0.5, 0.5, 0.5,
-3.69309, -3.929793, -2, 1, -0.5, 0.5, 0.5,
-3.69309, -3.929793, -2, 1, 1.5, 0.5, 0.5,
-3.69309, -3.929793, -2, 0, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 0, 0, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 0, 1, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 0, 1, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 0, 0, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 2, 0, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 2, 1, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 2, 1, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 2, 0, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 4, 0, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 4, 1, -0.5, 0.5, 0.5,
-3.69309, -3.929793, 4, 1, 1.5, 0.5, 0.5,
-3.69309, -3.929793, 4, 0, 1.5, 0.5, 0.5
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
-3.195124, -3.408479, -5.624894,
-3.195124, 3.542373, -5.624894,
-3.195124, -3.408479, 5.256279,
-3.195124, 3.542373, 5.256279,
-3.195124, -3.408479, -5.624894,
-3.195124, -3.408479, 5.256279,
-3.195124, 3.542373, -5.624894,
-3.195124, 3.542373, 5.256279,
-3.195124, -3.408479, -5.624894,
3.44443, -3.408479, -5.624894,
-3.195124, -3.408479, 5.256279,
3.44443, -3.408479, 5.256279,
-3.195124, 3.542373, -5.624894,
3.44443, 3.542373, -5.624894,
-3.195124, 3.542373, 5.256279,
3.44443, 3.542373, 5.256279,
3.44443, -3.408479, -5.624894,
3.44443, 3.542373, -5.624894,
3.44443, -3.408479, 5.256279,
3.44443, 3.542373, 5.256279,
3.44443, -3.408479, -5.624894,
3.44443, -3.408479, 5.256279,
3.44443, 3.542373, -5.624894,
3.44443, 3.542373, 5.256279
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
var radius = 7.752802;
var distance = 34.49309;
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
mvMatrix.translate( -0.124653, -0.06694674, 0.1843073 );
mvMatrix.scale( 1.262507, 1.205965, 0.7703655 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49309);
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
Vitamin_B12<-read.table("Vitamin_B12.xyz")
```

```
## Error in read.table("Vitamin_B12.xyz"): no lines available in input
```

```r
x<-Vitamin_B12$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
y<-Vitamin_B12$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
```

```r
z<-Vitamin_B12$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vitamin_B12' not found
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
-3.098431, 0.2327405, -1.160265, 0, 0, 1, 1, 1,
-3.026266, 0.9967565, -1.759104, 1, 0, 0, 1, 1,
-2.779926, 1.586808, -2.269418, 1, 0, 0, 1, 1,
-2.764026, 2.893213, -2.15905, 1, 0, 0, 1, 1,
-2.63354, -2.490278, -1.28241, 1, 0, 0, 1, 1,
-2.610883, -1.925045, -0.6628145, 1, 0, 0, 1, 1,
-2.603064, 1.62939, -0.648509, 0, 0, 0, 1, 1,
-2.536408, -0.05065953, -2.605102, 0, 0, 0, 1, 1,
-2.479425, -0.7013103, -0.67077, 0, 0, 0, 1, 1,
-2.411199, -1.68544, -2.889193, 0, 0, 0, 1, 1,
-2.321805, -2.668237, -1.749102, 0, 0, 0, 1, 1,
-2.284704, 0.7563416, -2.215544, 0, 0, 0, 1, 1,
-2.252045, -0.1393107, -1.308194, 0, 0, 0, 1, 1,
-2.24878, 1.181394, 0.4063981, 1, 1, 1, 1, 1,
-2.212183, 0.4516267, -1.100082, 1, 1, 1, 1, 1,
-2.181512, -0.7077755, -2.665753, 1, 1, 1, 1, 1,
-2.157367, 0.579165, -0.5220409, 1, 1, 1, 1, 1,
-2.110089, 0.2600379, -3.224072, 1, 1, 1, 1, 1,
-2.10004, 0.9619077, -0.8724951, 1, 1, 1, 1, 1,
-2.055667, 0.3305766, -3.881681, 1, 1, 1, 1, 1,
-2.001662, 0.3266116, -1.935907, 1, 1, 1, 1, 1,
-1.995182, 0.2143001, -2.013475, 1, 1, 1, 1, 1,
-1.990279, -1.825438, -1.578153, 1, 1, 1, 1, 1,
-1.984169, -0.8173442, -1.270018, 1, 1, 1, 1, 1,
-1.945604, 0.9715594, -0.9075652, 1, 1, 1, 1, 1,
-1.937975, -0.3579989, -1.059911, 1, 1, 1, 1, 1,
-1.904647, 0.2728057, -2.401166, 1, 1, 1, 1, 1,
-1.882286, -0.375014, -1.843975, 1, 1, 1, 1, 1,
-1.879753, -0.37836, -1.005831, 0, 0, 1, 1, 1,
-1.870457, 1.35209, -0.7082914, 1, 0, 0, 1, 1,
-1.862936, 0.02307599, -2.128633, 1, 0, 0, 1, 1,
-1.856341, -1.151735, -1.38129, 1, 0, 0, 1, 1,
-1.853673, 0.7332196, -2.276452, 1, 0, 0, 1, 1,
-1.821447, 0.1771628, -2.694976, 1, 0, 0, 1, 1,
-1.819099, -0.6409284, -2.165089, 0, 0, 0, 1, 1,
-1.814228, 1.6927, -0.8639443, 0, 0, 0, 1, 1,
-1.813553, 0.1236025, -1.194178, 0, 0, 0, 1, 1,
-1.810697, -1.027025, -2.427517, 0, 0, 0, 1, 1,
-1.798383, 1.360968, -0.3690835, 0, 0, 0, 1, 1,
-1.798244, -0.8937374, -0.9553474, 0, 0, 0, 1, 1,
-1.795285, -1.038576, -2.893187, 0, 0, 0, 1, 1,
-1.792003, 0.4790097, -2.656559, 1, 1, 1, 1, 1,
-1.791317, 0.6397975, -1.044009, 1, 1, 1, 1, 1,
-1.777651, 0.4690262, -1.89252, 1, 1, 1, 1, 1,
-1.768544, 0.3006063, -0.0273533, 1, 1, 1, 1, 1,
-1.76805, -1.79667, -2.480519, 1, 1, 1, 1, 1,
-1.765423, 0.7370012, -0.381972, 1, 1, 1, 1, 1,
-1.757608, -0.4334982, -0.9701972, 1, 1, 1, 1, 1,
-1.745405, -0.2321966, -1.466427, 1, 1, 1, 1, 1,
-1.734348, 0.8254341, 0.09127287, 1, 1, 1, 1, 1,
-1.73243, 0.1560276, -1.887516, 1, 1, 1, 1, 1,
-1.704024, -0.1195666, -0.7011607, 1, 1, 1, 1, 1,
-1.686482, -1.312499, -2.098989, 1, 1, 1, 1, 1,
-1.685224, -0.2424358, -2.08258, 1, 1, 1, 1, 1,
-1.681611, -0.7528871, -1.970464, 1, 1, 1, 1, 1,
-1.67599, -1.053123, -2.136623, 1, 1, 1, 1, 1,
-1.675288, 1.976831, -1.09527, 0, 0, 1, 1, 1,
-1.66236, -1.378758, -2.85126, 1, 0, 0, 1, 1,
-1.648934, -0.9018748, -3.154322, 1, 0, 0, 1, 1,
-1.645549, 0.2378318, -1.481823, 1, 0, 0, 1, 1,
-1.643463, 0.3293768, -1.442889, 1, 0, 0, 1, 1,
-1.613222, 0.5467514, -1.60526, 1, 0, 0, 1, 1,
-1.60539, -0.2704378, -2.18765, 0, 0, 0, 1, 1,
-1.59807, -0.9243048, -1.755506, 0, 0, 0, 1, 1,
-1.597539, -0.3058039, -3.18045, 0, 0, 0, 1, 1,
-1.597425, 0.4040946, -1.120956, 0, 0, 0, 1, 1,
-1.58735, 0.8343264, 0.7146206, 0, 0, 0, 1, 1,
-1.563118, 0.00696715, -0.5262725, 0, 0, 0, 1, 1,
-1.562072, -1.355519, -3.016206, 0, 0, 0, 1, 1,
-1.556753, 0.3224452, -1.641356, 1, 1, 1, 1, 1,
-1.554573, 1.018142, 0.270271, 1, 1, 1, 1, 1,
-1.530004, 0.8463213, -1.863573, 1, 1, 1, 1, 1,
-1.516473, -0.1004798, -1.677676, 1, 1, 1, 1, 1,
-1.497771, -0.3688364, -2.262483, 1, 1, 1, 1, 1,
-1.49586, -0.4200341, -0.9341649, 1, 1, 1, 1, 1,
-1.493728, 0.6067608, -0.4122547, 1, 1, 1, 1, 1,
-1.490561, -0.01151864, -1.582089, 1, 1, 1, 1, 1,
-1.483618, 0.1985165, -0.4641446, 1, 1, 1, 1, 1,
-1.473644, -0.3763243, -2.070543, 1, 1, 1, 1, 1,
-1.465675, -0.0869754, -2.205485, 1, 1, 1, 1, 1,
-1.464963, -0.01598956, -1.96769, 1, 1, 1, 1, 1,
-1.462864, 1.293322, -1.225117, 1, 1, 1, 1, 1,
-1.451876, 0.08505815, 0.03315155, 1, 1, 1, 1, 1,
-1.449093, 0.1470699, -2.430756, 1, 1, 1, 1, 1,
-1.44087, 0.3868898, -1.263059, 0, 0, 1, 1, 1,
-1.417209, -0.9247509, -2.98985, 1, 0, 0, 1, 1,
-1.411551, 1.294587, -1.153233, 1, 0, 0, 1, 1,
-1.40501, 0.4602531, 0.7880917, 1, 0, 0, 1, 1,
-1.391301, -0.0008469154, -2.027061, 1, 0, 0, 1, 1,
-1.384461, 1.362701, -0.5972928, 1, 0, 0, 1, 1,
-1.37285, 0.05619857, -1.513071, 0, 0, 0, 1, 1,
-1.351968, 0.07108964, -2.324145, 0, 0, 0, 1, 1,
-1.350724, -1.227003, -0.1207525, 0, 0, 0, 1, 1,
-1.348155, 0.2019016, -1.053563, 0, 0, 0, 1, 1,
-1.347932, -1.165324, -3.072406, 0, 0, 0, 1, 1,
-1.339259, 0.1902894, -1.855417, 0, 0, 0, 1, 1,
-1.333828, 0.1891264, -0.2439752, 0, 0, 0, 1, 1,
-1.329307, -1.588687, -1.340684, 1, 1, 1, 1, 1,
-1.32767, 0.4439266, -1.521352, 1, 1, 1, 1, 1,
-1.323175, 1.133264, -0.3567109, 1, 1, 1, 1, 1,
-1.323142, -1.340228, -0.9072924, 1, 1, 1, 1, 1,
-1.318776, 0.6343637, -2.046367, 1, 1, 1, 1, 1,
-1.309171, 0.8547453, -1.313927, 1, 1, 1, 1, 1,
-1.299666, 1.24102, -0.7142836, 1, 1, 1, 1, 1,
-1.292698, 0.1534127, -0.4362641, 1, 1, 1, 1, 1,
-1.292251, 1.512157, -0.9443954, 1, 1, 1, 1, 1,
-1.291267, 0.860297, -1.593632, 1, 1, 1, 1, 1,
-1.2885, -1.193249, -4.70476, 1, 1, 1, 1, 1,
-1.272758, 0.1658475, -2.230533, 1, 1, 1, 1, 1,
-1.26335, -0.2132992, -2.739143, 1, 1, 1, 1, 1,
-1.262988, -0.8386117, -3.218108, 1, 1, 1, 1, 1,
-1.247903, -0.945467, -2.791928, 1, 1, 1, 1, 1,
-1.246439, 0.8554957, -1.561194, 0, 0, 1, 1, 1,
-1.241725, 1.064848, -1.592745, 1, 0, 0, 1, 1,
-1.239164, 0.5293605, -0.5979343, 1, 0, 0, 1, 1,
-1.237561, -0.2119786, -1.471617, 1, 0, 0, 1, 1,
-1.23616, 0.1596755, -0.7503903, 1, 0, 0, 1, 1,
-1.236092, 0.5169726, -0.854711, 1, 0, 0, 1, 1,
-1.232574, 0.5883672, -0.5181952, 0, 0, 0, 1, 1,
-1.216517, -0.4742115, -3.012255, 0, 0, 0, 1, 1,
-1.216008, -0.8479055, -2.219019, 0, 0, 0, 1, 1,
-1.209732, -1.316384, -1.465402, 0, 0, 0, 1, 1,
-1.193993, 0.0906077, -2.622552, 0, 0, 0, 1, 1,
-1.185637, 1.404779, -0.4277832, 0, 0, 0, 1, 1,
-1.183421, -0.5247249, -1.09012, 0, 0, 0, 1, 1,
-1.160997, 0.7577798, -1.929397, 1, 1, 1, 1, 1,
-1.153918, -1.142848, -3.285091, 1, 1, 1, 1, 1,
-1.153412, 1.879287, 0.02210847, 1, 1, 1, 1, 1,
-1.144827, -2.026729, -2.203401, 1, 1, 1, 1, 1,
-1.144216, -0.4279826, -1.822803, 1, 1, 1, 1, 1,
-1.138525, 0.334087, -0.3454044, 1, 1, 1, 1, 1,
-1.137624, 1.543023, -1.673883, 1, 1, 1, 1, 1,
-1.130524, -0.5144019, -0.6247396, 1, 1, 1, 1, 1,
-1.12079, 0.01492341, -1.42828, 1, 1, 1, 1, 1,
-1.119975, -1.685459, -1.913206, 1, 1, 1, 1, 1,
-1.114895, -0.3188424, -1.437466, 1, 1, 1, 1, 1,
-1.110201, 2.608455, -0.310537, 1, 1, 1, 1, 1,
-1.099374, -0.8216397, -3.032682, 1, 1, 1, 1, 1,
-1.098867, 0.8859114, -1.5426, 1, 1, 1, 1, 1,
-1.095422, -0.8745528, -2.431742, 1, 1, 1, 1, 1,
-1.094728, -0.3629111, -1.683714, 0, 0, 1, 1, 1,
-1.087479, -2.558509, -1.489319, 1, 0, 0, 1, 1,
-1.08314, 0.01852078, -1.578233, 1, 0, 0, 1, 1,
-1.076006, -0.4779487, -1.81419, 1, 0, 0, 1, 1,
-1.072417, -1.080429, -3.492392, 1, 0, 0, 1, 1,
-1.064728, -1.210866, -2.227466, 1, 0, 0, 1, 1,
-1.063664, -1.403062, -3.216322, 0, 0, 0, 1, 1,
-1.061074, 0.690486, -1.566077, 0, 0, 0, 1, 1,
-1.048686, -0.602847, -2.478492, 0, 0, 0, 1, 1,
-1.046823, 0.7704493, -0.9287316, 0, 0, 0, 1, 1,
-1.046563, -1.09277, -1.492124, 0, 0, 0, 1, 1,
-1.044534, -0.06220006, -2.222966, 0, 0, 0, 1, 1,
-1.043981, 0.1295176, -2.222669, 0, 0, 0, 1, 1,
-1.036579, -1.147744, 0.1967707, 1, 1, 1, 1, 1,
-1.031634, -0.637242, -0.3310907, 1, 1, 1, 1, 1,
-1.031283, -0.1029795, -1.915904, 1, 1, 1, 1, 1,
-1.029736, 1.370834, -2.228864, 1, 1, 1, 1, 1,
-1.027581, -1.150327, -2.548989, 1, 1, 1, 1, 1,
-1.022571, 2.288804, -0.1871546, 1, 1, 1, 1, 1,
-1.019936, 1.258987, -1.852067, 1, 1, 1, 1, 1,
-1.019159, 1.517835, -0.9099132, 1, 1, 1, 1, 1,
-1.013986, -1.26148, -3.867289, 1, 1, 1, 1, 1,
-1.007998, 1.188474, 0.1094547, 1, 1, 1, 1, 1,
-1.004032, 0.3891509, -0.3414895, 1, 1, 1, 1, 1,
-0.9943586, -0.5007459, -2.152313, 1, 1, 1, 1, 1,
-0.9889457, 0.3446669, -1.864369, 1, 1, 1, 1, 1,
-0.982097, -0.04519667, -1.266309, 1, 1, 1, 1, 1,
-0.9766349, 0.08089623, -2.793682, 1, 1, 1, 1, 1,
-0.9752942, 0.02200661, -2.485203, 0, 0, 1, 1, 1,
-0.9745116, 2.099284, -1.158731, 1, 0, 0, 1, 1,
-0.9737682, 0.3662719, -1.13054, 1, 0, 0, 1, 1,
-0.9737025, 0.9428492, -1.118316, 1, 0, 0, 1, 1,
-0.9679925, -0.1669122, -0.1155451, 1, 0, 0, 1, 1,
-0.9644933, 0.5069354, -0.4126014, 1, 0, 0, 1, 1,
-0.9627817, -1.676191, -2.916439, 0, 0, 0, 1, 1,
-0.9619245, 0.7480497, -0.5759354, 0, 0, 0, 1, 1,
-0.9618809, 2.099898, -1.293463, 0, 0, 0, 1, 1,
-0.9606086, -1.708382, -1.888168, 0, 0, 0, 1, 1,
-0.9603263, 0.5889266, 0.8483825, 0, 0, 0, 1, 1,
-0.9588469, 0.5440891, -2.604042, 0, 0, 0, 1, 1,
-0.9573113, -0.1124865, -1.431785, 0, 0, 0, 1, 1,
-0.9527171, 2.763175, -1.213299, 1, 1, 1, 1, 1,
-0.9486972, -0.5449065, -3.516247, 1, 1, 1, 1, 1,
-0.9458033, 0.4473804, -0.1855037, 1, 1, 1, 1, 1,
-0.9421857, 0.6160941, -2.920408, 1, 1, 1, 1, 1,
-0.9298398, 0.2392537, -0.02588969, 1, 1, 1, 1, 1,
-0.9288502, 1.601236, 0.3118114, 1, 1, 1, 1, 1,
-0.9286623, -0.5645667, -3.004787, 1, 1, 1, 1, 1,
-0.9216227, 0.9166868, -0.4030365, 1, 1, 1, 1, 1,
-0.9137961, 0.8670062, -0.6078947, 1, 1, 1, 1, 1,
-0.9134524, -1.563766, -3.454735, 1, 1, 1, 1, 1,
-0.9123663, 1.607383, -1.481255, 1, 1, 1, 1, 1,
-0.9043878, -0.5635443, -2.747617, 1, 1, 1, 1, 1,
-0.9030371, 1.805807, -0.1417285, 1, 1, 1, 1, 1,
-0.9009811, 0.07781909, -2.00078, 1, 1, 1, 1, 1,
-0.9004115, 1.279911, -0.1100212, 1, 1, 1, 1, 1,
-0.8948092, -0.5906866, -0.4927107, 0, 0, 1, 1, 1,
-0.8922444, 1.557439, -1.403287, 1, 0, 0, 1, 1,
-0.8922379, 0.3081649, -1.595005, 1, 0, 0, 1, 1,
-0.8921338, 0.4807802, -1.211383, 1, 0, 0, 1, 1,
-0.8907638, 0.839572, -0.8372452, 1, 0, 0, 1, 1,
-0.8888847, 0.9008257, -0.7072107, 1, 0, 0, 1, 1,
-0.8888641, 1.434238, 0.7063279, 0, 0, 0, 1, 1,
-0.887361, -1.095111, -1.059898, 0, 0, 0, 1, 1,
-0.8805013, 0.8863443, 0.4376934, 0, 0, 0, 1, 1,
-0.8800531, -0.1816139, -0.9469696, 0, 0, 0, 1, 1,
-0.878308, -0.2175048, -0.9012883, 0, 0, 0, 1, 1,
-0.8772339, 0.4885947, -0.8270909, 0, 0, 0, 1, 1,
-0.8732806, -0.7418597, -5.192761, 0, 0, 0, 1, 1,
-0.8682361, 0.5889332, -0.5521387, 1, 1, 1, 1, 1,
-0.8671058, 0.4464688, -0.2580551, 1, 1, 1, 1, 1,
-0.8625782, -0.02958412, -1.289083, 1, 1, 1, 1, 1,
-0.8615628, 2.366224, -1.377871, 1, 1, 1, 1, 1,
-0.8598061, -0.9604349, -2.504034, 1, 1, 1, 1, 1,
-0.8576569, -0.3806672, -2.469182, 1, 1, 1, 1, 1,
-0.8541203, 0.6836843, 0.1359405, 1, 1, 1, 1, 1,
-0.8533656, 0.5748817, -0.7462892, 1, 1, 1, 1, 1,
-0.85251, 1.860509, -1.961557, 1, 1, 1, 1, 1,
-0.8474938, -0.5841002, -0.6888688, 1, 1, 1, 1, 1,
-0.8453996, -0.8984888, -2.505329, 1, 1, 1, 1, 1,
-0.838475, 0.4137312, -0.8505232, 1, 1, 1, 1, 1,
-0.8351411, 0.1607581, -2.183464, 1, 1, 1, 1, 1,
-0.8312336, -1.369665, -2.654388, 1, 1, 1, 1, 1,
-0.8269548, -0.4850824, -1.68467, 1, 1, 1, 1, 1,
-0.8253949, -0.1699288, -2.110809, 0, 0, 1, 1, 1,
-0.8246742, 0.2946789, -1.119013, 1, 0, 0, 1, 1,
-0.8163897, 1.862112, -0.4642739, 1, 0, 0, 1, 1,
-0.8147807, 0.9334303, 0.09980925, 1, 0, 0, 1, 1,
-0.8143177, -1.008286, -4.226797, 1, 0, 0, 1, 1,
-0.8052571, -0.1949405, -0.4453533, 1, 0, 0, 1, 1,
-0.7975857, 2.29537, 0.7622954, 0, 0, 0, 1, 1,
-0.7954105, -0.4212638, -0.6500465, 0, 0, 0, 1, 1,
-0.7946477, -0.8025998, -2.0149, 0, 0, 0, 1, 1,
-0.7920848, -1.578046, -1.843481, 0, 0, 0, 1, 1,
-0.7911612, 0.3070321, -1.303187, 0, 0, 0, 1, 1,
-0.7832425, 1.422489, -0.9827378, 0, 0, 0, 1, 1,
-0.7776698, 1.35171, 1.502881, 0, 0, 0, 1, 1,
-0.7694049, 1.158518, -0.6517229, 1, 1, 1, 1, 1,
-0.7679306, 0.2022589, -0.1464837, 1, 1, 1, 1, 1,
-0.762543, 0.522516, 0.6615562, 1, 1, 1, 1, 1,
-0.7590396, -0.1202543, -3.36834, 1, 1, 1, 1, 1,
-0.758721, 0.03806419, -2.210361, 1, 1, 1, 1, 1,
-0.7582351, -1.076856, -2.771973, 1, 1, 1, 1, 1,
-0.7574715, 0.4178281, -1.360886, 1, 1, 1, 1, 1,
-0.7497542, 0.1058332, -1.398976, 1, 1, 1, 1, 1,
-0.7483887, 0.2360652, -0.4425198, 1, 1, 1, 1, 1,
-0.7435875, 2.443455, 0.3386109, 1, 1, 1, 1, 1,
-0.7405782, 0.5329012, -0.1136667, 1, 1, 1, 1, 1,
-0.7369595, -0.4083449, -0.8627399, 1, 1, 1, 1, 1,
-0.7273923, -0.1918322, -2.190725, 1, 1, 1, 1, 1,
-0.727111, -0.3991619, -4.250005, 1, 1, 1, 1, 1,
-0.722911, 0.04971871, 0.566255, 1, 1, 1, 1, 1,
-0.7151968, -0.6575596, -2.256596, 0, 0, 1, 1, 1,
-0.7137033, 2.387959, -1.015228, 1, 0, 0, 1, 1,
-0.7081496, -0.295977, -0.4169058, 1, 0, 0, 1, 1,
-0.703473, -0.08036656, -0.2416296, 1, 0, 0, 1, 1,
-0.7019879, 1.127165, -0.3575224, 1, 0, 0, 1, 1,
-0.697336, -0.1692743, -1.548208, 1, 0, 0, 1, 1,
-0.6957198, 1.89839, 0.359979, 0, 0, 0, 1, 1,
-0.694573, 0.6595138, -0.6613314, 0, 0, 0, 1, 1,
-0.684031, 1.046157, -1.028663, 0, 0, 0, 1, 1,
-0.6832978, -0.7609053, -0.657564, 0, 0, 0, 1, 1,
-0.6816083, -0.4243166, -1.553953, 0, 0, 0, 1, 1,
-0.6799822, 0.2127597, -2.073496, 0, 0, 0, 1, 1,
-0.6784098, 0.1970053, -0.06187362, 0, 0, 0, 1, 1,
-0.6754962, -0.8427716, -3.536793, 1, 1, 1, 1, 1,
-0.6688478, 0.2081137, 0.2344723, 1, 1, 1, 1, 1,
-0.6683475, 0.2830366, -1.834479, 1, 1, 1, 1, 1,
-0.6669666, -0.1621712, -3.687441, 1, 1, 1, 1, 1,
-0.6654618, -0.8480074, -1.690769, 1, 1, 1, 1, 1,
-0.663107, -0.1301132, -1.022388, 1, 1, 1, 1, 1,
-0.6612639, -0.7088569, -2.665001, 1, 1, 1, 1, 1,
-0.6607835, 2.207624, -1.327595, 1, 1, 1, 1, 1,
-0.6563109, -0.226595, -3.487182, 1, 1, 1, 1, 1,
-0.6529309, 0.8728709, -2.385272, 1, 1, 1, 1, 1,
-0.6519794, -0.1945935, -2.417265, 1, 1, 1, 1, 1,
-0.643527, -1.920632, -1.700199, 1, 1, 1, 1, 1,
-0.6410568, -0.6338221, -3.188362, 1, 1, 1, 1, 1,
-0.6375015, 1.281018, -0.08620587, 1, 1, 1, 1, 1,
-0.6365733, 0.9563777, -1.163246, 1, 1, 1, 1, 1,
-0.6316187, -1.987966, -1.031352, 0, 0, 1, 1, 1,
-0.6247963, 0.4351961, -1.682093, 1, 0, 0, 1, 1,
-0.6205759, 0.6999227, 0.5783959, 1, 0, 0, 1, 1,
-0.6185622, -0.4160562, -1.23022, 1, 0, 0, 1, 1,
-0.6160221, -1.859478, -2.73977, 1, 0, 0, 1, 1,
-0.6137052, 0.6883159, 0.2483376, 1, 0, 0, 1, 1,
-0.6099054, 0.8967056, 0.963096, 0, 0, 0, 1, 1,
-0.6082666, -0.7576349, -3.283901, 0, 0, 0, 1, 1,
-0.60194, -0.2891055, -2.201402, 0, 0, 0, 1, 1,
-0.6008909, 1.114267, -1.824355, 0, 0, 0, 1, 1,
-0.5973201, 0.5527132, -1.885432, 0, 0, 0, 1, 1,
-0.5938271, -0.3239694, 0.2432481, 0, 0, 0, 1, 1,
-0.5919104, 0.6124124, -1.403289, 0, 0, 0, 1, 1,
-0.59001, -0.8296522, -3.297214, 1, 1, 1, 1, 1,
-0.5860509, -0.4541167, -3.698348, 1, 1, 1, 1, 1,
-0.5820773, 0.008226543, -1.56648, 1, 1, 1, 1, 1,
-0.5818776, 1.80177, 0.5616445, 1, 1, 1, 1, 1,
-0.5790123, -0.6633324, -2.278259, 1, 1, 1, 1, 1,
-0.5754517, 2.084482, 0.5888247, 1, 1, 1, 1, 1,
-0.5747815, 0.2505162, -0.2770199, 1, 1, 1, 1, 1,
-0.5739915, 0.3608881, -1.578802, 1, 1, 1, 1, 1,
-0.5738915, 0.2779485, -0.3086275, 1, 1, 1, 1, 1,
-0.5700668, -0.2910023, -1.328015, 1, 1, 1, 1, 1,
-0.5696138, -1.105266, -3.67697, 1, 1, 1, 1, 1,
-0.5688971, -0.6072962, -2.519248, 1, 1, 1, 1, 1,
-0.5518154, -1.130259, -2.038238, 1, 1, 1, 1, 1,
-0.5431675, 1.801355, 0.495301, 1, 1, 1, 1, 1,
-0.5376238, 1.493191, -1.385594, 1, 1, 1, 1, 1,
-0.536396, -1.149985, -2.898681, 0, 0, 1, 1, 1,
-0.5330233, 0.939648, 0.5733919, 1, 0, 0, 1, 1,
-0.5196731, 1.352078, 0.6195669, 1, 0, 0, 1, 1,
-0.515503, 0.07416736, -2.936955, 1, 0, 0, 1, 1,
-0.5135961, -1.148191, -4.307743, 1, 0, 0, 1, 1,
-0.5089676, -0.006471016, -3.982727, 1, 0, 0, 1, 1,
-0.5045235, 1.181649, -0.6157646, 0, 0, 0, 1, 1,
-0.5025757, 1.021316, 0.002479442, 0, 0, 0, 1, 1,
-0.5014378, -0.09131501, -1.513299, 0, 0, 0, 1, 1,
-0.4921056, -0.5895828, -1.954015, 0, 0, 0, 1, 1,
-0.4917016, -0.5664188, -2.365845, 0, 0, 0, 1, 1,
-0.490579, -0.09985901, 0.1910489, 0, 0, 0, 1, 1,
-0.4879052, -1.352002, -4.427238, 0, 0, 0, 1, 1,
-0.4848966, -0.4334193, -3.590913, 1, 1, 1, 1, 1,
-0.4748123, 0.3235533, -1.003953, 1, 1, 1, 1, 1,
-0.4740862, -0.768616, -4.041764, 1, 1, 1, 1, 1,
-0.4738917, 0.8452255, -0.4158381, 1, 1, 1, 1, 1,
-0.4738802, 0.1964005, -0.9756658, 1, 1, 1, 1, 1,
-0.4721453, 0.278659, 0.3164585, 1, 1, 1, 1, 1,
-0.4692487, 0.3642714, -0.7581806, 1, 1, 1, 1, 1,
-0.4686327, 0.373309, -0.04369826, 1, 1, 1, 1, 1,
-0.4630858, 0.3843335, -1.417331, 1, 1, 1, 1, 1,
-0.4615936, 1.892154, 0.4903647, 1, 1, 1, 1, 1,
-0.4598099, -0.8432449, -2.024918, 1, 1, 1, 1, 1,
-0.4582409, -0.1848634, -4.281589, 1, 1, 1, 1, 1,
-0.4572524, 0.519649, -1.180458, 1, 1, 1, 1, 1,
-0.4571714, -3.307253, -3.527211, 1, 1, 1, 1, 1,
-0.4548143, 0.3564481, -0.7998291, 1, 1, 1, 1, 1,
-0.453687, -0.2717176, -0.7797269, 0, 0, 1, 1, 1,
-0.4458172, 1.577104, -1.174586, 1, 0, 0, 1, 1,
-0.4394372, -0.2789129, -1.26682, 1, 0, 0, 1, 1,
-0.4376646, -1.022727, -2.898966, 1, 0, 0, 1, 1,
-0.4350928, 0.693487, -2.067851, 1, 0, 0, 1, 1,
-0.4345579, 1.23083, -2.395361, 1, 0, 0, 1, 1,
-0.4320175, 0.09873069, -1.436057, 0, 0, 0, 1, 1,
-0.4293587, -0.4247268, -1.216177, 0, 0, 0, 1, 1,
-0.4280467, -0.03155849, -2.312747, 0, 0, 0, 1, 1,
-0.4211456, -1.361449, -3.13833, 0, 0, 0, 1, 1,
-0.4176442, 0.8472685, -1.763851, 0, 0, 0, 1, 1,
-0.4031347, -0.3896453, -1.677019, 0, 0, 0, 1, 1,
-0.4019534, 1.385081, -0.02634748, 0, 0, 0, 1, 1,
-0.4018146, -0.3232996, -2.76434, 1, 1, 1, 1, 1,
-0.3997883, 0.6826176, -1.723534, 1, 1, 1, 1, 1,
-0.3948701, -0.06615538, -1.918428, 1, 1, 1, 1, 1,
-0.3900456, -0.8178262, -2.387497, 1, 1, 1, 1, 1,
-0.3847752, -1.631127, -2.286933, 1, 1, 1, 1, 1,
-0.3756032, 1.42408, -0.7003141, 1, 1, 1, 1, 1,
-0.3720821, 0.4550463, -2.300802, 1, 1, 1, 1, 1,
-0.369835, 0.2728779, -0.5449471, 1, 1, 1, 1, 1,
-0.3644147, -1.072471, -3.015438, 1, 1, 1, 1, 1,
-0.363197, 1.607443, 0.5974181, 1, 1, 1, 1, 1,
-0.360364, -2.123461, -3.000556, 1, 1, 1, 1, 1,
-0.3553321, 1.086519, 0.5146787, 1, 1, 1, 1, 1,
-0.3512283, -0.4914647, -4.020647, 1, 1, 1, 1, 1,
-0.3432726, -1.539942, -3.663528, 1, 1, 1, 1, 1,
-0.3402316, 1.252051, -0.7572628, 1, 1, 1, 1, 1,
-0.3385942, -0.8559897, -3.126871, 0, 0, 1, 1, 1,
-0.3363956, -0.4712631, -2.978283, 1, 0, 0, 1, 1,
-0.3357565, 1.400629, -0.8458531, 1, 0, 0, 1, 1,
-0.330216, -1.230373, -3.196095, 1, 0, 0, 1, 1,
-0.3286167, -0.2263765, -2.619743, 1, 0, 0, 1, 1,
-0.3222237, 0.477668, 0.7046671, 1, 0, 0, 1, 1,
-0.3215089, 1.982218, 0.2898062, 0, 0, 0, 1, 1,
-0.3191315, -1.447757, -0.8228264, 0, 0, 0, 1, 1,
-0.317573, -1.584845, -2.977105, 0, 0, 0, 1, 1,
-0.316811, 0.5378988, -0.8616052, 0, 0, 0, 1, 1,
-0.3121927, 1.1926, -2.419135, 0, 0, 0, 1, 1,
-0.30331, 0.8289006, -0.783843, 0, 0, 0, 1, 1,
-0.3025534, 1.377571, -1.318699, 0, 0, 0, 1, 1,
-0.3016721, -1.07305, -0.5862965, 1, 1, 1, 1, 1,
-0.2992434, -0.9628241, -2.114498, 1, 1, 1, 1, 1,
-0.2984861, -1.40562, -2.984268, 1, 1, 1, 1, 1,
-0.2969332, 0.3004944, -0.3736602, 1, 1, 1, 1, 1,
-0.2917802, -0.3746701, -3.225502, 1, 1, 1, 1, 1,
-0.2906951, -0.6489487, -3.3745, 1, 1, 1, 1, 1,
-0.286988, 0.8447632, -1.403542, 1, 1, 1, 1, 1,
-0.2849838, 0.9218566, -1.12416, 1, 1, 1, 1, 1,
-0.2839446, -0.8723675, -2.432277, 1, 1, 1, 1, 1,
-0.2800344, -0.2339141, -4.501762, 1, 1, 1, 1, 1,
-0.2799723, 1.580003, 0.3345447, 1, 1, 1, 1, 1,
-0.2710015, -0.2721341, -2.496407, 1, 1, 1, 1, 1,
-0.2657841, 1.053658, -0.2234183, 1, 1, 1, 1, 1,
-0.2654663, 0.6852498, -0.681491, 1, 1, 1, 1, 1,
-0.2608066, 1.215422, 1.297931, 1, 1, 1, 1, 1,
-0.2598682, 0.04741056, -2.307305, 0, 0, 1, 1, 1,
-0.2553125, 0.3600231, 0.5934039, 1, 0, 0, 1, 1,
-0.2481658, 1.577514, 0.8500648, 1, 0, 0, 1, 1,
-0.2478105, 1.877429, -0.003191076, 1, 0, 0, 1, 1,
-0.2467447, 1.36884, -0.380867, 1, 0, 0, 1, 1,
-0.2450636, -1.069271, -2.604138, 1, 0, 0, 1, 1,
-0.2444128, -0.3800406, -3.854702, 0, 0, 0, 1, 1,
-0.2388482, -0.463397, -3.432992, 0, 0, 0, 1, 1,
-0.2348988, -0.5567589, -2.641052, 0, 0, 0, 1, 1,
-0.2334058, -1.172921, -3.705625, 0, 0, 0, 1, 1,
-0.231033, -0.3097099, -3.145683, 0, 0, 0, 1, 1,
-0.224735, -0.2877622, -2.479987, 0, 0, 0, 1, 1,
-0.2208101, 0.425291, -0.8873502, 0, 0, 0, 1, 1,
-0.2161476, -0.3656673, -3.375441, 1, 1, 1, 1, 1,
-0.2151884, 0.5457045, -0.8661556, 1, 1, 1, 1, 1,
-0.2122494, -1.942924, -3.640156, 1, 1, 1, 1, 1,
-0.2105293, 0.6215798, 0.3748156, 1, 1, 1, 1, 1,
-0.2053258, 0.2274438, -1.750902, 1, 1, 1, 1, 1,
-0.201574, 0.8835176, 0.2525018, 1, 1, 1, 1, 1,
-0.2003965, 1.002666, -0.1837488, 1, 1, 1, 1, 1,
-0.1984523, -1.060858, -2.52535, 1, 1, 1, 1, 1,
-0.1921499, 1.711381, -2.447517, 1, 1, 1, 1, 1,
-0.1911782, -1.028271, -1.462896, 1, 1, 1, 1, 1,
-0.1882492, 1.419038, -0.09238298, 1, 1, 1, 1, 1,
-0.1878171, 0.2727301, -0.4266341, 1, 1, 1, 1, 1,
-0.1850318, 0.4473382, 1.238566, 1, 1, 1, 1, 1,
-0.1827417, 0.8647766, -0.02167279, 1, 1, 1, 1, 1,
-0.1800071, 0.2138747, -0.4961294, 1, 1, 1, 1, 1,
-0.1760202, -0.877315, -2.561444, 0, 0, 1, 1, 1,
-0.1752739, 0.07233985, -1.767917, 1, 0, 0, 1, 1,
-0.173585, -0.539188, -1.684107, 1, 0, 0, 1, 1,
-0.1729388, -0.5712192, -3.431906, 1, 0, 0, 1, 1,
-0.1704554, 0.06588117, -0.3448142, 1, 0, 0, 1, 1,
-0.1692275, -1.604487, -3.898435, 1, 0, 0, 1, 1,
-0.1658292, 0.1399665, -0.09535165, 0, 0, 0, 1, 1,
-0.1640988, -0.1903151, -3.103376, 0, 0, 0, 1, 1,
-0.1638715, -0.6161816, -5.466431, 0, 0, 0, 1, 1,
-0.162678, 1.061369, -0.8587972, 0, 0, 0, 1, 1,
-0.1621235, -1.041128, -2.75238, 0, 0, 0, 1, 1,
-0.1615578, 1.245828, 0.7897496, 0, 0, 0, 1, 1,
-0.1611573, 1.571116, -0.5979083, 0, 0, 0, 1, 1,
-0.1569927, -0.9752615, -4.453739, 1, 1, 1, 1, 1,
-0.1553185, -0.3918305, -2.840494, 1, 1, 1, 1, 1,
-0.1508113, 0.4525446, -2.33406, 1, 1, 1, 1, 1,
-0.1487849, 0.5272307, 0.3946582, 1, 1, 1, 1, 1,
-0.1441941, 0.04668716, 0.1107046, 1, 1, 1, 1, 1,
-0.1441533, -0.624928, -3.332404, 1, 1, 1, 1, 1,
-0.1428088, -0.4188257, -3.410883, 1, 1, 1, 1, 1,
-0.1399062, 2.314573, -0.2075933, 1, 1, 1, 1, 1,
-0.1353932, 0.9630113, 0.7573019, 1, 1, 1, 1, 1,
-0.1323488, -0.8686572, -2.058548, 1, 1, 1, 1, 1,
-0.1316106, -0.07695016, -1.253406, 1, 1, 1, 1, 1,
-0.1298725, 0.7888039, -0.1856003, 1, 1, 1, 1, 1,
-0.1281006, 0.5535975, 1.325945, 1, 1, 1, 1, 1,
-0.1180881, 0.8794577, 2.015237, 1, 1, 1, 1, 1,
-0.11449, 0.2959488, 0.2138436, 1, 1, 1, 1, 1,
-0.1135756, 1.808799, 1.939688, 0, 0, 1, 1, 1,
-0.109012, 1.442976, -0.5602078, 1, 0, 0, 1, 1,
-0.1076284, 0.2527659, -0.4022013, 1, 0, 0, 1, 1,
-0.1045817, -1.06633, -2.968002, 1, 0, 0, 1, 1,
-0.1045076, -0.7285733, -3.08098, 1, 0, 0, 1, 1,
-0.1021512, -0.3733282, -2.548725, 1, 0, 0, 1, 1,
-0.1019994, 1.715757, -0.1590649, 0, 0, 0, 1, 1,
-0.100882, 0.1077131, -1.949692, 0, 0, 0, 1, 1,
-0.09919011, 0.0775148, -0.3193967, 0, 0, 0, 1, 1,
-0.09734473, 0.02333604, -1.694993, 0, 0, 0, 1, 1,
-0.09552263, -0.6956385, -1.364131, 0, 0, 0, 1, 1,
-0.09111438, -0.6006977, -3.492852, 0, 0, 0, 1, 1,
-0.0867838, 0.09791509, -0.4205999, 0, 0, 0, 1, 1,
-0.08519237, 0.5131335, 0.1959402, 1, 1, 1, 1, 1,
-0.08343735, -0.1629348, -3.376585, 1, 1, 1, 1, 1,
-0.07790454, 0.01711387, 0.2769092, 1, 1, 1, 1, 1,
-0.07142346, -2.196806, -3.787736, 1, 1, 1, 1, 1,
-0.0697219, 0.03327608, -1.473088, 1, 1, 1, 1, 1,
-0.06587952, -0.5128626, -2.115212, 1, 1, 1, 1, 1,
-0.05961091, -0.1974774, -4.10381, 1, 1, 1, 1, 1,
-0.05722921, 1.488502, -2.292643, 1, 1, 1, 1, 1,
-0.0485297, 0.8275674, 2.481115, 1, 1, 1, 1, 1,
-0.04828092, -0.6884255, -2.941123, 1, 1, 1, 1, 1,
-0.0472651, 1.092394, -0.7844855, 1, 1, 1, 1, 1,
-0.044088, -0.3337181, -3.3639, 1, 1, 1, 1, 1,
-0.04035492, -1.621073, -3.502398, 1, 1, 1, 1, 1,
-0.0397657, -1.73864, -2.676777, 1, 1, 1, 1, 1,
-0.03897345, 2.572472, -0.428415, 1, 1, 1, 1, 1,
-0.03339377, 1.417759, -0.7431806, 0, 0, 1, 1, 1,
-0.02831741, 0.4606576, 0.2141507, 1, 0, 0, 1, 1,
-0.02791456, 0.5570138, -1.468772, 1, 0, 0, 1, 1,
-0.02675322, -1.482943, -3.35558, 1, 0, 0, 1, 1,
-0.02600075, 2.017112, 0.1858813, 1, 0, 0, 1, 1,
-0.01876857, -0.9850005, -3.660275, 1, 0, 0, 1, 1,
-0.01395794, 0.4807509, -0.9076448, 0, 0, 0, 1, 1,
-0.01370467, 0.7118379, -0.02861821, 0, 0, 0, 1, 1,
-0.01280232, 2.243395, -1.108083, 0, 0, 0, 1, 1,
-0.009978971, 0.9904301, 0.7936513, 0, 0, 0, 1, 1,
-0.00924608, 0.3874838, 0.127565, 0, 0, 0, 1, 1,
-0.008215684, -0.04837615, -3.294248, 0, 0, 0, 1, 1,
-0.005294881, 0.6343996, -0.7269443, 0, 0, 0, 1, 1,
-0.002162097, 1.704339, -0.5082017, 1, 1, 1, 1, 1,
-0.0009395895, -0.8952479, -3.944187, 1, 1, 1, 1, 1,
-0.000626119, -1.198185, -3.592999, 1, 1, 1, 1, 1,
0.004498117, 1.569179, 0.5534693, 1, 1, 1, 1, 1,
0.006551704, -1.126106, 2.543859, 1, 1, 1, 1, 1,
0.008641543, 0.8737418, 1.588678, 1, 1, 1, 1, 1,
0.01310871, -0.7183654, 4.884958, 1, 1, 1, 1, 1,
0.01448033, -0.5887653, 5.097816, 1, 1, 1, 1, 1,
0.01574196, 0.4082744, -0.9486659, 1, 1, 1, 1, 1,
0.01597522, 0.8682595, 0.8337935, 1, 1, 1, 1, 1,
0.02281278, 0.7872292, -0.6987178, 1, 1, 1, 1, 1,
0.02562723, 0.7709125, 0.9846139, 1, 1, 1, 1, 1,
0.02865368, 0.7765724, 0.6115016, 1, 1, 1, 1, 1,
0.03460091, -1.152279, 4.739994, 1, 1, 1, 1, 1,
0.03626932, -0.3401805, 1.670206, 1, 1, 1, 1, 1,
0.03631901, 0.6962776, 0.9187301, 0, 0, 1, 1, 1,
0.04209948, -1.639639, 3.830525, 1, 0, 0, 1, 1,
0.04273418, -1.153002, 2.298721, 1, 0, 0, 1, 1,
0.0464524, 0.1730112, 0.1381538, 1, 0, 0, 1, 1,
0.04962878, 0.6464684, 1.821428, 1, 0, 0, 1, 1,
0.04965875, -1.267321, 2.206393, 1, 0, 0, 1, 1,
0.05466332, 0.442642, 0.03000037, 0, 0, 0, 1, 1,
0.05610883, -0.3814268, 2.24302, 0, 0, 0, 1, 1,
0.06335033, -0.2173775, 2.817874, 0, 0, 0, 1, 1,
0.0657414, 0.1132257, 0.8855984, 0, 0, 0, 1, 1,
0.06640878, -1.235991, 2.2209, 0, 0, 0, 1, 1,
0.06975511, 0.3702605, -0.1340393, 0, 0, 0, 1, 1,
0.07321853, -1.568377, 3.963048, 0, 0, 0, 1, 1,
0.07332786, -0.5177428, 2.233063, 1, 1, 1, 1, 1,
0.07353418, 0.8431947, 0.6979765, 1, 1, 1, 1, 1,
0.07364766, -0.2705726, 3.034063, 1, 1, 1, 1, 1,
0.07762387, -0.2191168, 2.207697, 1, 1, 1, 1, 1,
0.07889175, 0.7743535, -1.387374, 1, 1, 1, 1, 1,
0.07970151, 0.2729147, 2.21247, 1, 1, 1, 1, 1,
0.08191629, 0.1933347, 1.149006, 1, 1, 1, 1, 1,
0.08221047, -0.5064569, 3.073885, 1, 1, 1, 1, 1,
0.08504602, 0.02463223, 1.276937, 1, 1, 1, 1, 1,
0.09278494, -0.6631792, 2.61226, 1, 1, 1, 1, 1,
0.1001729, -1.110286, 2.329822, 1, 1, 1, 1, 1,
0.1026066, -0.9418517, 1.391996, 1, 1, 1, 1, 1,
0.1035831, 0.1061744, -1.162396, 1, 1, 1, 1, 1,
0.1067861, -0.78982, 3.289066, 1, 1, 1, 1, 1,
0.110797, -1.656314, 0.5002845, 1, 1, 1, 1, 1,
0.1109198, 0.001456729, 2.270012, 0, 0, 1, 1, 1,
0.112016, -1.288229, 3.492942, 1, 0, 0, 1, 1,
0.1137388, 1.43246, -0.8282321, 1, 0, 0, 1, 1,
0.1139295, -1.478302, 3.583457, 1, 0, 0, 1, 1,
0.115529, -1.700533, 3.409088, 1, 0, 0, 1, 1,
0.1175875, -0.1299047, 1.73146, 1, 0, 0, 1, 1,
0.1241014, 1.18284, -0.8353357, 0, 0, 0, 1, 1,
0.1250348, 0.4617022, -1.266093, 0, 0, 0, 1, 1,
0.1345672, 0.6448454, -0.9942938, 0, 0, 0, 1, 1,
0.1377479, 1.461593, -1.627616, 0, 0, 0, 1, 1,
0.1400771, -0.7860259, 2.716118, 0, 0, 0, 1, 1,
0.1451963, 0.5631381, 1.779048, 0, 0, 0, 1, 1,
0.1572467, 1.136325, 2.44952, 0, 0, 0, 1, 1,
0.1589937, -1.821939, 2.538852, 1, 1, 1, 1, 1,
0.159075, -1.911199, 2.867999, 1, 1, 1, 1, 1,
0.1641139, 1.732885, -0.4775358, 1, 1, 1, 1, 1,
0.1705279, -0.3541758, 2.305651, 1, 1, 1, 1, 1,
0.1712081, 0.6323712, -1.22004, 1, 1, 1, 1, 1,
0.1724939, 0.3011919, 1.656269, 1, 1, 1, 1, 1,
0.1746049, -1.448652, 3.003189, 1, 1, 1, 1, 1,
0.1785303, -0.6639371, 3.835883, 1, 1, 1, 1, 1,
0.180874, -0.964623, 1.115852, 1, 1, 1, 1, 1,
0.1820704, -0.1594167, 3.039093, 1, 1, 1, 1, 1,
0.1852445, -0.4156768, 2.520816, 1, 1, 1, 1, 1,
0.1890998, -1.770392, 3.293958, 1, 1, 1, 1, 1,
0.1892457, 1.048402, -1.003994, 1, 1, 1, 1, 1,
0.1893782, -0.5671459, 3.513925, 1, 1, 1, 1, 1,
0.1912082, -0.7407749, 2.854942, 1, 1, 1, 1, 1,
0.1991356, -0.516681, 2.01781, 0, 0, 1, 1, 1,
0.2005029, 0.3979726, 1.419709, 1, 0, 0, 1, 1,
0.2009972, 0.5020286, 0.0491202, 1, 0, 0, 1, 1,
0.2025013, 1.991643, 0.9773674, 1, 0, 0, 1, 1,
0.2029391, -1.795998, 4.240814, 1, 0, 0, 1, 1,
0.2057348, -0.5076857, 1.958617, 1, 0, 0, 1, 1,
0.2094507, -1.150222, 3.595283, 0, 0, 0, 1, 1,
0.2130662, -1.341289, 2.299119, 0, 0, 0, 1, 1,
0.2153371, 0.3928502, -0.1661618, 0, 0, 0, 1, 1,
0.2158881, 0.3834366, 1.10264, 0, 0, 0, 1, 1,
0.2174492, 1.672306, -0.09619372, 0, 0, 0, 1, 1,
0.2178484, -1.351828, 2.880935, 0, 0, 0, 1, 1,
0.21812, 0.3383788, -0.001021477, 0, 0, 0, 1, 1,
0.2190364, -0.2227538, 1.357877, 1, 1, 1, 1, 1,
0.2211428, -0.1103803, 1.10379, 1, 1, 1, 1, 1,
0.2227871, 0.05985168, 1.459262, 1, 1, 1, 1, 1,
0.2295883, -0.03967851, 2.844697, 1, 1, 1, 1, 1,
0.2311624, 0.6863169, -0.2290743, 1, 1, 1, 1, 1,
0.2328696, 0.0538591, 1.873975, 1, 1, 1, 1, 1,
0.2352227, -0.1761451, 1.861077, 1, 1, 1, 1, 1,
0.2366512, -0.4454888, 2.86643, 1, 1, 1, 1, 1,
0.2374258, -0.7230682, 3.98509, 1, 1, 1, 1, 1,
0.2394687, 0.5249535, -1.404075, 1, 1, 1, 1, 1,
0.249279, 1.257714, -0.0899304, 1, 1, 1, 1, 1,
0.2501114, -0.2131573, 2.824684, 1, 1, 1, 1, 1,
0.2585517, 0.4730159, 1.882083, 1, 1, 1, 1, 1,
0.2593639, 1.315053, 0.6988485, 1, 1, 1, 1, 1,
0.2797014, -1.496458, 2.690989, 1, 1, 1, 1, 1,
0.2840869, -0.107766, 0.798468, 0, 0, 1, 1, 1,
0.2879485, -0.4281877, 1.570314, 1, 0, 0, 1, 1,
0.288789, -0.643432, 3.231584, 1, 0, 0, 1, 1,
0.291998, -1.548593, 0.8731998, 1, 0, 0, 1, 1,
0.2951463, 0.6672452, 0.01752272, 1, 0, 0, 1, 1,
0.2965511, 0.1376871, -0.3223038, 1, 0, 0, 1, 1,
0.2966643, 0.9269634, -0.5761219, 0, 0, 0, 1, 1,
0.2970451, 0.1666993, -0.07362849, 0, 0, 0, 1, 1,
0.2988303, -0.9688681, 2.026701, 0, 0, 0, 1, 1,
0.3000289, 0.2125858, -0.9158803, 0, 0, 0, 1, 1,
0.3007551, -0.9115958, 4.068984, 0, 0, 0, 1, 1,
0.3036672, 0.6084338, -0.3414311, 0, 0, 0, 1, 1,
0.3110356, 0.6261014, -1.681137, 0, 0, 0, 1, 1,
0.3214869, -0.3363149, 2.755101, 1, 1, 1, 1, 1,
0.327399, 0.5567045, 0.08645038, 1, 1, 1, 1, 1,
0.3317128, -0.8338083, 0.6121388, 1, 1, 1, 1, 1,
0.3320285, -0.09436336, -0.619534, 1, 1, 1, 1, 1,
0.335137, 0.08364916, 0.8236941, 1, 1, 1, 1, 1,
0.3358233, -1.443259, 2.973874, 1, 1, 1, 1, 1,
0.335876, 0.9322673, 1.118265, 1, 1, 1, 1, 1,
0.3401473, -0.307693, 3.193754, 1, 1, 1, 1, 1,
0.344161, -1.576043, 1.153771, 1, 1, 1, 1, 1,
0.3455746, 1.209506, 0.4354525, 1, 1, 1, 1, 1,
0.3469027, 1.227311, 0.3842121, 1, 1, 1, 1, 1,
0.3495485, 0.03149327, 3.109828, 1, 1, 1, 1, 1,
0.3529383, -0.6293209, 2.049864, 1, 1, 1, 1, 1,
0.3570966, -1.256886, 4.515668, 1, 1, 1, 1, 1,
0.3574305, -0.09589104, 2.319956, 1, 1, 1, 1, 1,
0.3683604, -0.9705896, 4.007274, 0, 0, 1, 1, 1,
0.3748681, 0.003308271, 1.69028, 1, 0, 0, 1, 1,
0.3788274, -0.5064688, 2.266549, 1, 0, 0, 1, 1,
0.3788437, 0.6603561, 0.4188657, 1, 0, 0, 1, 1,
0.3817367, 0.601173, 0.1953385, 1, 0, 0, 1, 1,
0.3850893, 2.21867, 2.983534, 1, 0, 0, 1, 1,
0.3865168, 0.3601874, 1.054543, 0, 0, 0, 1, 1,
0.3887104, -0.6062025, 1.970243, 0, 0, 0, 1, 1,
0.3926555, -0.6206859, 3.585631, 0, 0, 0, 1, 1,
0.3929596, 0.6429216, -0.2886511, 0, 0, 0, 1, 1,
0.396255, -1.165304, 2.352628, 0, 0, 0, 1, 1,
0.396733, -0.5367948, 3.362812, 0, 0, 0, 1, 1,
0.3982477, -0.2238429, 2.833954, 0, 0, 0, 1, 1,
0.4029436, 0.248371, 1.926673, 1, 1, 1, 1, 1,
0.404244, -1.455735, 3.719368, 1, 1, 1, 1, 1,
0.4088827, -0.1762215, 1.749622, 1, 1, 1, 1, 1,
0.4133876, -0.282521, 2.632719, 1, 1, 1, 1, 1,
0.4138004, -1.581522, 1.895235, 1, 1, 1, 1, 1,
0.4144166, -0.007902398, 2.156402, 1, 1, 1, 1, 1,
0.415038, -1.422489, 3.197833, 1, 1, 1, 1, 1,
0.4162497, 0.7783436, -0.6589622, 1, 1, 1, 1, 1,
0.4167089, -0.6073051, 1.975596, 1, 1, 1, 1, 1,
0.4231417, -2.227777, 1.416801, 1, 1, 1, 1, 1,
0.423891, -0.02622971, 0.5449499, 1, 1, 1, 1, 1,
0.4247631, 0.5827171, -0.9706576, 1, 1, 1, 1, 1,
0.424784, 0.3802308, 0.9387474, 1, 1, 1, 1, 1,
0.4259068, -1.454522, 1.947076, 1, 1, 1, 1, 1,
0.4335715, 1.210144, -0.2801267, 1, 1, 1, 1, 1,
0.4342807, -0.2609768, 2.801393, 0, 0, 1, 1, 1,
0.4349054, -0.2876604, 2.075355, 1, 0, 0, 1, 1,
0.4398492, -0.1503135, 0.7253665, 1, 0, 0, 1, 1,
0.4413968, 0.5477372, 0.8760944, 1, 0, 0, 1, 1,
0.4481696, 0.3499939, 1.340051, 1, 0, 0, 1, 1,
0.4496807, 0.2620753, 0.6920856, 1, 0, 0, 1, 1,
0.4531678, 0.530501, 1.101169, 0, 0, 0, 1, 1,
0.4559044, 1.411453, -1.00701, 0, 0, 0, 1, 1,
0.4559901, 1.852316, -0.8617873, 0, 0, 0, 1, 1,
0.4588992, 1.287742, 0.9099113, 0, 0, 0, 1, 1,
0.4601627, 1.058331, -0.1641999, 0, 0, 0, 1, 1,
0.4619363, -0.1376418, 1.215337, 0, 0, 0, 1, 1,
0.463799, -1.444318, 2.455099, 0, 0, 0, 1, 1,
0.4724994, 0.8786355, 0.9576651, 1, 1, 1, 1, 1,
0.4764472, -0.1829046, 3.026561, 1, 1, 1, 1, 1,
0.4774027, -0.04294854, 0.2027656, 1, 1, 1, 1, 1,
0.4817805, -0.1235235, 1.126812, 1, 1, 1, 1, 1,
0.4833793, -0.09822934, 2.460864, 1, 1, 1, 1, 1,
0.4866805, 0.145125, 0.5138584, 1, 1, 1, 1, 1,
0.4878547, 0.3291498, 0.8528606, 1, 1, 1, 1, 1,
0.4890307, -0.2650131, 2.904312, 1, 1, 1, 1, 1,
0.4905984, -0.3212585, 1.818358, 1, 1, 1, 1, 1,
0.4915627, -0.2226274, 1.26951, 1, 1, 1, 1, 1,
0.4934671, -0.6498905, 1.862854, 1, 1, 1, 1, 1,
0.4938141, -0.4558877, 4.157367, 1, 1, 1, 1, 1,
0.4945425, -0.2064592, 3.717306, 1, 1, 1, 1, 1,
0.4954029, 1.272612, 1.086182, 1, 1, 1, 1, 1,
0.5005398, -1.707046, 2.2798, 1, 1, 1, 1, 1,
0.5066419, -0.2670991, 1.663684, 0, 0, 1, 1, 1,
0.5071084, 0.2277164, -0.3311724, 1, 0, 0, 1, 1,
0.507934, -0.8366206, 1.935785, 1, 0, 0, 1, 1,
0.5186284, -0.4079187, 1.42909, 1, 0, 0, 1, 1,
0.5224472, 0.8611905, -1.119499, 1, 0, 0, 1, 1,
0.5242925, 0.2214442, 2.458256, 1, 0, 0, 1, 1,
0.5255134, 2.711661, -0.9437369, 0, 0, 0, 1, 1,
0.5292412, -1.486573, 3.186211, 0, 0, 0, 1, 1,
0.539841, 0.4127942, 2.509023, 0, 0, 0, 1, 1,
0.5425636, 0.9450358, -0.6396782, 0, 0, 0, 1, 1,
0.5447218, 0.4625186, -1.487772, 0, 0, 0, 1, 1,
0.5448966, 0.4184918, 0.9809899, 0, 0, 0, 1, 1,
0.548862, -0.5123551, 2.274363, 0, 0, 0, 1, 1,
0.5511772, -0.9866449, 1.794158, 1, 1, 1, 1, 1,
0.5516567, 0.09462408, 1.687693, 1, 1, 1, 1, 1,
0.5528406, 0.01075841, 1.389677, 1, 1, 1, 1, 1,
0.5556713, -1.289773, 2.401727, 1, 1, 1, 1, 1,
0.556219, 1.489722, -0.3673954, 1, 1, 1, 1, 1,
0.5625057, -1.511369, 3.603926, 1, 1, 1, 1, 1,
0.5669346, 0.8920864, 0.5141518, 1, 1, 1, 1, 1,
0.5670451, 1.058047, 0.8926532, 1, 1, 1, 1, 1,
0.5679217, -0.08281742, 1.16689, 1, 1, 1, 1, 1,
0.5688756, -0.8418658, 2.413939, 1, 1, 1, 1, 1,
0.5779151, -1.147372, 2.75675, 1, 1, 1, 1, 1,
0.5813245, -0.8998613, 2.52129, 1, 1, 1, 1, 1,
0.5818141, 0.3567201, 1.086743, 1, 1, 1, 1, 1,
0.5831158, 0.3246921, -0.1369168, 1, 1, 1, 1, 1,
0.5868518, -0.8144822, 2.393943, 1, 1, 1, 1, 1,
0.5896248, -1.359293, 2.899646, 0, 0, 1, 1, 1,
0.5935019, -1.056655, 2.46916, 1, 0, 0, 1, 1,
0.5941285, -0.2908381, 2.256655, 1, 0, 0, 1, 1,
0.5982758, -0.1192372, 0.8893405, 1, 0, 0, 1, 1,
0.6079676, 2.250119, 0.3148865, 1, 0, 0, 1, 1,
0.6130458, -1.047477, 3.144609, 1, 0, 0, 1, 1,
0.6153466, -0.631776, 0.7019733, 0, 0, 0, 1, 1,
0.6248184, -1.927778, 3.664871, 0, 0, 0, 1, 1,
0.6292698, -2.102703, 2.472707, 0, 0, 0, 1, 1,
0.6297929, -1.023389, 2.684919, 0, 0, 0, 1, 1,
0.6322697, 0.398287, -0.8235818, 0, 0, 0, 1, 1,
0.6355986, -0.03128166, 2.786557, 0, 0, 0, 1, 1,
0.6372495, -0.4979382, 2.770019, 0, 0, 0, 1, 1,
0.6394364, 0.7353379, 0.9084955, 1, 1, 1, 1, 1,
0.64346, -0.3844912, 1.943111, 1, 1, 1, 1, 1,
0.6441823, 0.1925336, 0.958233, 1, 1, 1, 1, 1,
0.6473663, -0.9680445, 1.929794, 1, 1, 1, 1, 1,
0.6476018, -1.667826, 1.257709, 1, 1, 1, 1, 1,
0.6517183, 0.5499159, 0.1927719, 1, 1, 1, 1, 1,
0.6522419, -1.938094, 3.528614, 1, 1, 1, 1, 1,
0.6572927, -1.023676, 4.460795, 1, 1, 1, 1, 1,
0.6591603, 0.4236774, 2.246192, 1, 1, 1, 1, 1,
0.6628473, -0.218547, 2.555473, 1, 1, 1, 1, 1,
0.6632574, -0.3759706, 2.664703, 1, 1, 1, 1, 1,
0.6656994, -0.5369568, 0.9424892, 1, 1, 1, 1, 1,
0.6692109, -0.8246592, 2.155222, 1, 1, 1, 1, 1,
0.669418, 0.06485444, 2.001664, 1, 1, 1, 1, 1,
0.6806124, -0.4102845, 4.204919, 1, 1, 1, 1, 1,
0.6823749, -1.236223, 2.707252, 0, 0, 1, 1, 1,
0.6865424, -0.067009, 2.885698, 1, 0, 0, 1, 1,
0.6888228, -1.660479, 2.477277, 1, 0, 0, 1, 1,
0.6929898, 1.837514, 1.654836, 1, 0, 0, 1, 1,
0.6951137, -0.04024271, 2.210639, 1, 0, 0, 1, 1,
0.6954822, -2.449286, 3.000289, 1, 0, 0, 1, 1,
0.6966944, 0.1615829, 0.6563552, 0, 0, 0, 1, 1,
0.6983334, -0.4760306, 0.1458061, 0, 0, 0, 1, 1,
0.7079507, -0.2937722, 2.197958, 0, 0, 0, 1, 1,
0.7089965, -0.4514651, 3.244999, 0, 0, 0, 1, 1,
0.7118133, 1.264407, 0.2953091, 0, 0, 0, 1, 1,
0.7162125, -0.2027074, 1.16628, 0, 0, 0, 1, 1,
0.7170879, 0.9959177, -1.001403, 0, 0, 0, 1, 1,
0.7171449, -1.226817, 2.083802, 1, 1, 1, 1, 1,
0.7173023, -0.6956061, 3.770085, 1, 1, 1, 1, 1,
0.7211974, 0.9444588, 0.05282705, 1, 1, 1, 1, 1,
0.7229603, -0.3327201, 2.179214, 1, 1, 1, 1, 1,
0.723017, -0.4063937, 2.445548, 1, 1, 1, 1, 1,
0.727118, -0.4342169, 1.78176, 1, 1, 1, 1, 1,
0.7316391, 0.2766, 0.01647959, 1, 1, 1, 1, 1,
0.7338139, 1.669946, 2.265399, 1, 1, 1, 1, 1,
0.7338748, -0.8409217, 1.487293, 1, 1, 1, 1, 1,
0.7345591, 0.1248658, 2.437114, 1, 1, 1, 1, 1,
0.7354909, -0.422595, 1.320376, 1, 1, 1, 1, 1,
0.7396606, 0.1211511, 1.991184, 1, 1, 1, 1, 1,
0.7412369, 0.4781249, 3.710875, 1, 1, 1, 1, 1,
0.7466778, 1.655464, 0.6244475, 1, 1, 1, 1, 1,
0.7467721, 1.026317, 2.743971, 1, 1, 1, 1, 1,
0.7475033, 0.2249616, 0.4468032, 0, 0, 1, 1, 1,
0.7489777, 0.2440969, 1.576071, 1, 0, 0, 1, 1,
0.7544262, 1.065481, 0.1451297, 1, 0, 0, 1, 1,
0.7564583, 0.1540858, 2.340376, 1, 0, 0, 1, 1,
0.7584308, 0.3527925, 0.5061916, 1, 0, 0, 1, 1,
0.7601345, -1.742386, 2.690441, 1, 0, 0, 1, 1,
0.7617375, 0.6711215, 1.168502, 0, 0, 0, 1, 1,
0.7625751, 1.231884, 1.043981, 0, 0, 0, 1, 1,
0.7654517, -1.512976, 2.985949, 0, 0, 0, 1, 1,
0.7675112, -1.774896, 2.545631, 0, 0, 0, 1, 1,
0.7676642, 0.2652019, 1.580789, 0, 0, 0, 1, 1,
0.770647, -1.274659, 4.23392, 0, 0, 0, 1, 1,
0.7768919, -1.491691, 2.522216, 0, 0, 0, 1, 1,
0.7907709, -1.530079, 2.16726, 1, 1, 1, 1, 1,
0.7943143, 0.551514, 1.931865, 1, 1, 1, 1, 1,
0.7946739, -0.9328822, 1.618363, 1, 1, 1, 1, 1,
0.7952846, -2.594726, 2.225677, 1, 1, 1, 1, 1,
0.7978444, 3.441147, 0.3679581, 1, 1, 1, 1, 1,
0.798165, 0.06914146, 2.935026, 1, 1, 1, 1, 1,
0.7982749, -2.203347, 3.063489, 1, 1, 1, 1, 1,
0.7999404, -0.1066477, 1.473358, 1, 1, 1, 1, 1,
0.8013352, -0.4900558, 1.900144, 1, 1, 1, 1, 1,
0.8069954, 0.8060459, -1.291209, 1, 1, 1, 1, 1,
0.8071618, 1.403617, -0.4122329, 1, 1, 1, 1, 1,
0.8091058, 1.183519, 0.8403229, 1, 1, 1, 1, 1,
0.8091322, -0.3853928, 3.566271, 1, 1, 1, 1, 1,
0.8108691, -0.8563302, 3.581886, 1, 1, 1, 1, 1,
0.8121504, -0.7048466, 2.195158, 1, 1, 1, 1, 1,
0.8132803, 1.980865, -0.1723364, 0, 0, 1, 1, 1,
0.8163806, 0.01837044, 1.925683, 1, 0, 0, 1, 1,
0.8232486, -0.1499023, 2.504318, 1, 0, 0, 1, 1,
0.8272037, 1.153109, -0.9209366, 1, 0, 0, 1, 1,
0.8326656, 0.8686358, 0.4791918, 1, 0, 0, 1, 1,
0.8384199, 0.213676, -0.799955, 1, 0, 0, 1, 1,
0.8394522, 1.03576, 0.1682034, 0, 0, 0, 1, 1,
0.8406085, 0.1202893, 2.151652, 0, 0, 0, 1, 1,
0.8523586, -0.8761136, 1.56452, 0, 0, 0, 1, 1,
0.8535302, -0.6536921, 2.360674, 0, 0, 0, 1, 1,
0.8540334, -0.08051256, 1.832096, 0, 0, 0, 1, 1,
0.8550349, 0.57547, -0.3095405, 0, 0, 0, 1, 1,
0.8566062, -0.4368609, 1.05161, 0, 0, 0, 1, 1,
0.858452, -0.5349017, 2.378591, 1, 1, 1, 1, 1,
0.8602358, 0.7530683, -0.1386003, 1, 1, 1, 1, 1,
0.8635968, 0.5568646, 0.3340018, 1, 1, 1, 1, 1,
0.8800741, 0.9427977, 1.334043, 1, 1, 1, 1, 1,
0.8819246, -0.7519374, 2.419485, 1, 1, 1, 1, 1,
0.8879389, 0.9360381, 0.02284595, 1, 1, 1, 1, 1,
0.8949797, 1.40208, 1.996209, 1, 1, 1, 1, 1,
0.895745, -0.9317298, 4.203005, 1, 1, 1, 1, 1,
0.902824, 2.922449, -0.4566201, 1, 1, 1, 1, 1,
0.9033095, 0.8698472, -0.502921, 1, 1, 1, 1, 1,
0.9080822, -1.217896, 3.189285, 1, 1, 1, 1, 1,
0.9082394, -1.661388, 1.274051, 1, 1, 1, 1, 1,
0.9087555, 1.356557, 1.08206, 1, 1, 1, 1, 1,
0.9164909, -0.9052691, 1.301087, 1, 1, 1, 1, 1,
0.9176489, 1.646492, -0.05169625, 1, 1, 1, 1, 1,
0.9217533, 1.296313, 0.7639133, 0, 0, 1, 1, 1,
0.9229048, 1.321022, 0.951187, 1, 0, 0, 1, 1,
0.9237287, 0.264856, 0.2585137, 1, 0, 0, 1, 1,
0.9253315, 1.67241, 2.282363, 1, 0, 0, 1, 1,
0.93727, -1.14478, 2.733221, 1, 0, 0, 1, 1,
0.9448754, -0.5930533, 3.874018, 1, 0, 0, 1, 1,
0.9474651, 1.204262, 0.5802374, 0, 0, 0, 1, 1,
0.9514509, -0.509235, 2.598723, 0, 0, 0, 1, 1,
0.9580682, 0.09629789, 3.433439, 0, 0, 0, 1, 1,
0.9605128, -0.7033737, 1.808749, 0, 0, 0, 1, 1,
0.9642129, -0.5167526, 2.570531, 0, 0, 0, 1, 1,
0.9680217, 0.1772864, 1.178249, 0, 0, 0, 1, 1,
0.9692728, 0.1284167, -0.126064, 0, 0, 0, 1, 1,
0.9728364, -1.727455, 2.180813, 1, 1, 1, 1, 1,
0.9738826, -0.3449195, 2.486991, 1, 1, 1, 1, 1,
0.9760423, 0.01935992, -0.1475236, 1, 1, 1, 1, 1,
0.9801037, -0.1675244, 0.9148062, 1, 1, 1, 1, 1,
0.9872349, 0.2205085, 0.502342, 1, 1, 1, 1, 1,
0.9879063, 0.1991862, 1.755766, 1, 1, 1, 1, 1,
0.994355, -2.357369, 1.80722, 1, 1, 1, 1, 1,
0.9977649, -1.07094, 1.568294, 1, 1, 1, 1, 1,
1.001081, -0.9685947, 3.252243, 1, 1, 1, 1, 1,
1.001536, -0.8539333, 3.358832, 1, 1, 1, 1, 1,
1.019282, 0.3380184, 1.605286, 1, 1, 1, 1, 1,
1.026781, -0.4880527, 2.625323, 1, 1, 1, 1, 1,
1.027771, -0.566554, 1.949561, 1, 1, 1, 1, 1,
1.032592, -1.334586, 1.74895, 1, 1, 1, 1, 1,
1.036388, 0.8619663, 1.603768, 1, 1, 1, 1, 1,
1.03972, 0.02832051, 0.6204027, 0, 0, 1, 1, 1,
1.045444, 0.4580233, -0.04160186, 1, 0, 0, 1, 1,
1.04798, -0.2456592, 2.330179, 1, 0, 0, 1, 1,
1.049598, -0.6753891, 2.079513, 1, 0, 0, 1, 1,
1.050427, -0.487643, 2.024814, 1, 0, 0, 1, 1,
1.05784, 0.1043261, 0.7140594, 1, 0, 0, 1, 1,
1.058487, -0.8218573, 2.481695, 0, 0, 0, 1, 1,
1.062726, -0.7358834, 2.373303, 0, 0, 0, 1, 1,
1.066132, 2.003283, 0.3811549, 0, 0, 0, 1, 1,
1.067855, -1.03151, 1.328785, 0, 0, 0, 1, 1,
1.073021, 1.535402, 1.520096, 0, 0, 0, 1, 1,
1.074101, 0.05040617, 0.9186482, 0, 0, 0, 1, 1,
1.074454, 1.042626, 1.38711, 0, 0, 0, 1, 1,
1.079651, 0.4548385, 2.402301, 1, 1, 1, 1, 1,
1.080459, 1.740447, 0.9426185, 1, 1, 1, 1, 1,
1.081616, 0.2829649, 1.677873, 1, 1, 1, 1, 1,
1.086882, -0.01632071, 0.6804634, 1, 1, 1, 1, 1,
1.092133, -0.4371513, 2.304132, 1, 1, 1, 1, 1,
1.098866, 0.6553669, -1.988533, 1, 1, 1, 1, 1,
1.103623, -1.552868, 2.90972, 1, 1, 1, 1, 1,
1.108925, -0.5802944, 3.316154, 1, 1, 1, 1, 1,
1.113281, 2.406374, -0.5717973, 1, 1, 1, 1, 1,
1.116454, 0.01836685, 0.8767773, 1, 1, 1, 1, 1,
1.123841, -0.3305129, 2.929116, 1, 1, 1, 1, 1,
1.145924, 0.8173142, 1.298722, 1, 1, 1, 1, 1,
1.1527, -0.4061425, 1.141071, 1, 1, 1, 1, 1,
1.166609, -0.6397908, 3.435539, 1, 1, 1, 1, 1,
1.173845, -0.7436962, 2.604062, 1, 1, 1, 1, 1,
1.176238, 0.7295565, -0.02511407, 0, 0, 1, 1, 1,
1.179181, -1.438456, 2.515949, 1, 0, 0, 1, 1,
1.185067, -1.005003, 2.638214, 1, 0, 0, 1, 1,
1.198826, 0.1864844, 0.7454134, 1, 0, 0, 1, 1,
1.201363, -0.6218117, 1.819255, 1, 0, 0, 1, 1,
1.225537, -1.428015, 2.201037, 1, 0, 0, 1, 1,
1.237824, 0.4035046, -0.1411723, 0, 0, 0, 1, 1,
1.24034, -1.581354, 3.486873, 0, 0, 0, 1, 1,
1.241966, -1.129348, 2.519064, 0, 0, 0, 1, 1,
1.258812, 0.07531126, 2.261286, 0, 0, 0, 1, 1,
1.260465, 0.1587755, 0.5645757, 0, 0, 0, 1, 1,
1.266274, -0.5490284, 3.109078, 0, 0, 0, 1, 1,
1.269435, 1.561298, 0.8656967, 0, 0, 0, 1, 1,
1.272092, 1.262057, 2.58601, 1, 1, 1, 1, 1,
1.275763, -1.775821, 2.495069, 1, 1, 1, 1, 1,
1.278591, -0.6981415, 3.582762, 1, 1, 1, 1, 1,
1.283957, -0.5198624, -0.06712338, 1, 1, 1, 1, 1,
1.287038, 0.5221256, 2.247269, 1, 1, 1, 1, 1,
1.29782, -0.2061042, 3.181766, 1, 1, 1, 1, 1,
1.299962, 1.867905, 0.1961904, 1, 1, 1, 1, 1,
1.305537, -0.6106014, 1.37349, 1, 1, 1, 1, 1,
1.311041, -0.1069107, 1.987193, 1, 1, 1, 1, 1,
1.313434, 0.4072121, 0.1794111, 1, 1, 1, 1, 1,
1.316066, 0.5904632, 0.02095461, 1, 1, 1, 1, 1,
1.317657, -0.09354281, 1.601495, 1, 1, 1, 1, 1,
1.319205, -1.548935, 2.701053, 1, 1, 1, 1, 1,
1.323684, -0.7480676, 2.772759, 1, 1, 1, 1, 1,
1.325373, -2.028541, 2.246958, 1, 1, 1, 1, 1,
1.344805, -0.9657818, 1.470399, 0, 0, 1, 1, 1,
1.355307, -1.725776, 3.68189, 1, 0, 0, 1, 1,
1.355828, 1.20809, 1.519512, 1, 0, 0, 1, 1,
1.356926, 0.8759512, 0.3659653, 1, 0, 0, 1, 1,
1.356947, -0.7519413, 1.453621, 1, 0, 0, 1, 1,
1.357193, 1.527155, 0.8424516, 1, 0, 0, 1, 1,
1.358121, -0.8677402, 2.129132, 0, 0, 0, 1, 1,
1.358168, -1.126746, 3.247509, 0, 0, 0, 1, 1,
1.365233, 0.7179867, -0.2903805, 0, 0, 0, 1, 1,
1.381009, -1.078539, 2.0483, 0, 0, 0, 1, 1,
1.382983, -0.1727948, 2.261742, 0, 0, 0, 1, 1,
1.390514, 1.444334, 1.634658, 0, 0, 0, 1, 1,
1.394362, 1.374811, 2.301302, 0, 0, 0, 1, 1,
1.397452, 1.328688, 0.5637683, 1, 1, 1, 1, 1,
1.398706, 0.364196, 2.139965, 1, 1, 1, 1, 1,
1.400787, 0.4840991, 1.818252, 1, 1, 1, 1, 1,
1.406645, 2.246423, 1.402646, 1, 1, 1, 1, 1,
1.41637, -1.169957, 4.203146, 1, 1, 1, 1, 1,
1.42022, -1.684592, 1.71617, 1, 1, 1, 1, 1,
1.421692, -0.3665493, 2.132763, 1, 1, 1, 1, 1,
1.425314, -0.6410534, 2.819007, 1, 1, 1, 1, 1,
1.439116, -0.8856609, 0.03628463, 1, 1, 1, 1, 1,
1.443575, 2.256594, 0.02623064, 1, 1, 1, 1, 1,
1.454331, -0.05682897, 3.628023, 1, 1, 1, 1, 1,
1.457148, -0.6439549, 2.020876, 1, 1, 1, 1, 1,
1.463853, 0.1441634, 2.804643, 1, 1, 1, 1, 1,
1.467909, -1.128765, 1.512325, 1, 1, 1, 1, 1,
1.478036, -0.4393362, 1.552813, 1, 1, 1, 1, 1,
1.479659, -0.9964024, 1.608886, 0, 0, 1, 1, 1,
1.485307, 1.424272, 1.537582, 1, 0, 0, 1, 1,
1.488014, -1.63513, 2.278141, 1, 0, 0, 1, 1,
1.489211, 1.505806, 0.37736, 1, 0, 0, 1, 1,
1.49454, 0.2470128, 1.456088, 1, 0, 0, 1, 1,
1.50355, 1.053244, 1.673084, 1, 0, 0, 1, 1,
1.517693, -0.4750054, 1.304841, 0, 0, 0, 1, 1,
1.519675, -0.8432533, 2.868608, 0, 0, 0, 1, 1,
1.535251, -0.05243, 0.3748677, 0, 0, 0, 1, 1,
1.539257, 1.261441, 1.000231, 0, 0, 0, 1, 1,
1.539418, -0.54648, 3.37007, 0, 0, 0, 1, 1,
1.545026, 0.5794073, -0.157386, 0, 0, 0, 1, 1,
1.547866, -0.182894, 0.4794199, 0, 0, 0, 1, 1,
1.559805, -0.6073362, 2.849124, 1, 1, 1, 1, 1,
1.563543, -0.7948888, 2.319725, 1, 1, 1, 1, 1,
1.5818, -0.4790752, 3.997778, 1, 1, 1, 1, 1,
1.58388, -0.8998688, 2.53368, 1, 1, 1, 1, 1,
1.628444, 0.136386, 3.054219, 1, 1, 1, 1, 1,
1.632825, -0.7063864, 1.862941, 1, 1, 1, 1, 1,
1.635087, 1.067612, 0.4834457, 1, 1, 1, 1, 1,
1.65733, -0.6077208, 2.387239, 1, 1, 1, 1, 1,
1.662741, 0.2891571, 3.287325, 1, 1, 1, 1, 1,
1.667931, 0.3004133, 0.937442, 1, 1, 1, 1, 1,
1.678049, -1.682791, 2.486301, 1, 1, 1, 1, 1,
1.693589, 0.04149103, 2.261678, 1, 1, 1, 1, 1,
1.699465, 1.002525, 2.993668, 1, 1, 1, 1, 1,
1.711971, -0.9202201, 2.774559, 1, 1, 1, 1, 1,
1.717864, 0.0840065, 1.936985, 1, 1, 1, 1, 1,
1.752321, 0.2119641, 2.045769, 0, 0, 1, 1, 1,
1.756324, -1.400112, 1.169616, 1, 0, 0, 1, 1,
1.75644, 1.512933, 1.633725, 1, 0, 0, 1, 1,
1.757686, -1.459657, 2.377378, 1, 0, 0, 1, 1,
1.772689, -0.369782, 3.479598, 1, 0, 0, 1, 1,
1.814284, -0.8100433, 2.776361, 1, 0, 0, 1, 1,
1.815696, 0.383136, 2.014696, 0, 0, 0, 1, 1,
1.840412, 0.1248019, 2.377876, 0, 0, 0, 1, 1,
1.844555, -0.5424476, 3.269784, 0, 0, 0, 1, 1,
1.848764, -1.500693, 1.392221, 0, 0, 0, 1, 1,
1.905224, -1.409238, 0.6593319, 0, 0, 0, 1, 1,
1.906258, 0.3031724, 1.093918, 0, 0, 0, 1, 1,
1.90629, 0.4241505, 1.430391, 0, 0, 0, 1, 1,
1.918238, 0.8399577, -0.525736, 1, 1, 1, 1, 1,
1.925486, -0.8721678, 1.197491, 1, 1, 1, 1, 1,
1.930662, 1.316906, 2.276315, 1, 1, 1, 1, 1,
1.946614, 0.07659389, 2.042912, 1, 1, 1, 1, 1,
1.952446, -0.09492402, 4.120857, 1, 1, 1, 1, 1,
1.994718, 0.9404095, 1.285326, 1, 1, 1, 1, 1,
2.000371, 0.6125897, 2.216324, 1, 1, 1, 1, 1,
2.026401, -0.08587783, 1.351335, 1, 1, 1, 1, 1,
2.027316, 0.6269937, 1.770654, 1, 1, 1, 1, 1,
2.059454, -1.888081, 2.015799, 1, 1, 1, 1, 1,
2.063172, 0.8331116, 1.185444, 1, 1, 1, 1, 1,
2.081689, 0.299017, 0.4618121, 1, 1, 1, 1, 1,
2.171391, 1.706024, 1.367425, 1, 1, 1, 1, 1,
2.179295, -1.404398, 2.947441, 1, 1, 1, 1, 1,
2.180083, -0.34464, 1.425795, 1, 1, 1, 1, 1,
2.203447, 1.555677, 0.5681774, 0, 0, 1, 1, 1,
2.232512, 1.528226, 1.422704, 1, 0, 0, 1, 1,
2.298482, -1.443667, 2.51622, 1, 0, 0, 1, 1,
2.309674, 1.233426, -0.09700707, 1, 0, 0, 1, 1,
2.330814, -0.8258312, 3.698876, 1, 0, 0, 1, 1,
2.335912, 1.091551, 1.635313, 1, 0, 0, 1, 1,
2.366562, 1.307359, -0.5537905, 0, 0, 0, 1, 1,
2.367726, -0.01653268, 1.195587, 0, 0, 0, 1, 1,
2.37993, -0.221927, 2.07532, 0, 0, 0, 1, 1,
2.388716, 0.8678931, 2.2674, 0, 0, 0, 1, 1,
2.442067, 1.442107, 1.672075, 0, 0, 0, 1, 1,
2.455891, 1.405313, 1.875093, 0, 0, 0, 1, 1,
2.488384, 1.221919, 0.4536789, 0, 0, 0, 1, 1,
2.490281, -0.587504, 2.704602, 1, 1, 1, 1, 1,
2.625638, -0.3337583, 1.875953, 1, 1, 1, 1, 1,
2.640844, -0.006134347, 2.994002, 1, 1, 1, 1, 1,
2.676413, -0.02658345, 1.522764, 1, 1, 1, 1, 1,
2.712202, 0.4168119, -0.06333429, 1, 1, 1, 1, 1,
2.843933, 0.0391423, 1.367204, 1, 1, 1, 1, 1,
3.347737, 0.4774502, 2.175714, 1, 1, 1, 1, 1
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
var radius = 9.616866;
var distance = 33.77883;
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
mvMatrix.translate( -0.1246529, -0.06694674, 0.1843073 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77883);
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
