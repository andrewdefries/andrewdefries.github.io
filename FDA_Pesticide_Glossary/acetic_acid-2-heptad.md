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
-2.958918, 0.2967956, -2.268924, 1, 0, 0, 1,
-2.838554, 1.110265, 0.09596006, 1, 0.007843138, 0, 1,
-2.799183, 1.202094, -1.542553, 1, 0.01176471, 0, 1,
-2.640487, -1.536018, -2.459304, 1, 0.01960784, 0, 1,
-2.597002, -0.1500908, -0.3784279, 1, 0.02352941, 0, 1,
-2.585011, 0.7874181, 0.1555947, 1, 0.03137255, 0, 1,
-2.544318, 1.079657, -0.3942524, 1, 0.03529412, 0, 1,
-2.450711, 1.381494, -0.3166707, 1, 0.04313726, 0, 1,
-2.276969, 0.4933694, -1.196731, 1, 0.04705882, 0, 1,
-2.267706, 0.1033659, -2.323485, 1, 0.05490196, 0, 1,
-2.258827, 0.5875925, -1.197951, 1, 0.05882353, 0, 1,
-2.227335, 1.100961, -3.107054, 1, 0.06666667, 0, 1,
-2.211518, 1.26063, 0.01500467, 1, 0.07058824, 0, 1,
-2.178931, -0.9941252, -2.454513, 1, 0.07843138, 0, 1,
-2.090871, -0.06303496, -2.105895, 1, 0.08235294, 0, 1,
-2.085128, 0.2957621, -1.338119, 1, 0.09019608, 0, 1,
-2.063159, 0.6650914, -1.152619, 1, 0.09411765, 0, 1,
-2.015643, 0.3704304, -2.233449, 1, 0.1019608, 0, 1,
-1.996121, 0.1224847, -0.6423478, 1, 0.1098039, 0, 1,
-1.98164, 0.4132931, -2.077178, 1, 0.1137255, 0, 1,
-1.97041, -0.1681394, -0.6971971, 1, 0.1215686, 0, 1,
-1.967534, 0.5042049, -1.41864, 1, 0.1254902, 0, 1,
-1.965083, -0.7511433, -2.55477, 1, 0.1333333, 0, 1,
-1.939686, 0.19543, -0.3023896, 1, 0.1372549, 0, 1,
-1.918117, -0.257257, -1.345376, 1, 0.145098, 0, 1,
-1.878485, 1.09056, -0.05788456, 1, 0.1490196, 0, 1,
-1.860967, 1.40507, -0.353094, 1, 0.1568628, 0, 1,
-1.845172, 2.029598, -2.331652, 1, 0.1607843, 0, 1,
-1.839205, -0.09981073, -2.357983, 1, 0.1686275, 0, 1,
-1.838331, 0.6821603, -1.442177, 1, 0.172549, 0, 1,
-1.820748, 0.05708951, -0.9613001, 1, 0.1803922, 0, 1,
-1.820684, 0.1554384, -1.453841, 1, 0.1843137, 0, 1,
-1.816063, 0.4610372, -2.80658, 1, 0.1921569, 0, 1,
-1.773198, -0.3073102, -2.616318, 1, 0.1960784, 0, 1,
-1.754362, -0.9118034, -2.675957, 1, 0.2039216, 0, 1,
-1.715612, 2.234599, 1.104095, 1, 0.2117647, 0, 1,
-1.712842, 0.8306128, -1.327356, 1, 0.2156863, 0, 1,
-1.706477, 0.5033494, 0.7280571, 1, 0.2235294, 0, 1,
-1.700467, 0.8083208, -0.01695667, 1, 0.227451, 0, 1,
-1.680415, -0.3944464, -1.50978, 1, 0.2352941, 0, 1,
-1.677885, -0.9907802, -0.1361792, 1, 0.2392157, 0, 1,
-1.670961, -2.823581, -2.82996, 1, 0.2470588, 0, 1,
-1.638041, 0.04265909, -0.2164935, 1, 0.2509804, 0, 1,
-1.610855, -0.7342984, -1.946838, 1, 0.2588235, 0, 1,
-1.606822, -0.1280176, -0.6139357, 1, 0.2627451, 0, 1,
-1.59613, 0.04390166, -1.134282, 1, 0.2705882, 0, 1,
-1.57768, 0.2685579, -0.761789, 1, 0.2745098, 0, 1,
-1.5762, -0.8387838, -2.110727, 1, 0.282353, 0, 1,
-1.560757, 0.5832158, 2.163246, 1, 0.2862745, 0, 1,
-1.539022, 0.7404346, -1.008919, 1, 0.2941177, 0, 1,
-1.524132, -1.191831, -2.748115, 1, 0.3019608, 0, 1,
-1.523581, -0.4852532, -1.798497, 1, 0.3058824, 0, 1,
-1.522731, -0.7220237, -0.1172177, 1, 0.3137255, 0, 1,
-1.515952, 1.054466, -1.116545, 1, 0.3176471, 0, 1,
-1.515613, 0.2894572, -1.330455, 1, 0.3254902, 0, 1,
-1.508565, -1.408624, -3.411427, 1, 0.3294118, 0, 1,
-1.505174, 0.5860047, -0.828515, 1, 0.3372549, 0, 1,
-1.499168, 0.07076577, -1.790038, 1, 0.3411765, 0, 1,
-1.485044, -1.149922, -2.127656, 1, 0.3490196, 0, 1,
-1.478812, -1.823116, -3.35173, 1, 0.3529412, 0, 1,
-1.475033, -1.458078, -1.725985, 1, 0.3607843, 0, 1,
-1.474771, -1.432055, -2.280604, 1, 0.3647059, 0, 1,
-1.464446, -0.5019004, -1.529303, 1, 0.372549, 0, 1,
-1.447637, 0.7151486, -2.497728, 1, 0.3764706, 0, 1,
-1.447459, 1.386544, -0.3790332, 1, 0.3843137, 0, 1,
-1.431837, -0.02010191, -0.3662533, 1, 0.3882353, 0, 1,
-1.42126, -0.004477038, -2.129141, 1, 0.3960784, 0, 1,
-1.420274, -1.322317, -2.912124, 1, 0.4039216, 0, 1,
-1.419812, -2.680537, -2.607437, 1, 0.4078431, 0, 1,
-1.406316, 0.6111175, -1.37617, 1, 0.4156863, 0, 1,
-1.406049, -0.08835219, -2.384472, 1, 0.4196078, 0, 1,
-1.376869, -1.952185, -4.018081, 1, 0.427451, 0, 1,
-1.364781, 0.7475314, -1.859045, 1, 0.4313726, 0, 1,
-1.36389, -1.129314, -2.399079, 1, 0.4392157, 0, 1,
-1.355787, 0.163445, 0.5431403, 1, 0.4431373, 0, 1,
-1.352016, -0.04282581, -0.8716334, 1, 0.4509804, 0, 1,
-1.332206, 1.058107, -1.041199, 1, 0.454902, 0, 1,
-1.315828, 0.07538343, -2.235096, 1, 0.4627451, 0, 1,
-1.308179, 1.276946, -2.777785, 1, 0.4666667, 0, 1,
-1.300295, -0.8593104, -2.070899, 1, 0.4745098, 0, 1,
-1.284124, -0.5461754, -1.797109, 1, 0.4784314, 0, 1,
-1.280933, -0.137136, -1.922137, 1, 0.4862745, 0, 1,
-1.270882, -0.8976389, -2.761946, 1, 0.4901961, 0, 1,
-1.261025, 0.09494095, -1.522603, 1, 0.4980392, 0, 1,
-1.250063, 0.7558796, -1.853006, 1, 0.5058824, 0, 1,
-1.247887, 0.1667603, -0.08716825, 1, 0.509804, 0, 1,
-1.242797, -1.729042, -2.903934, 1, 0.5176471, 0, 1,
-1.235927, -1.130445, -0.154537, 1, 0.5215687, 0, 1,
-1.232049, -0.8549792, -2.417846, 1, 0.5294118, 0, 1,
-1.228316, 1.489888, -1.109291, 1, 0.5333334, 0, 1,
-1.217618, 0.1794952, -1.732844, 1, 0.5411765, 0, 1,
-1.214461, -0.3533427, -2.011111, 1, 0.5450981, 0, 1,
-1.212948, -0.6708719, -1.410027, 1, 0.5529412, 0, 1,
-1.212942, -1.816545, -2.704533, 1, 0.5568628, 0, 1,
-1.211672, 0.2913958, -1.000477, 1, 0.5647059, 0, 1,
-1.210798, 0.05661022, -2.55356, 1, 0.5686275, 0, 1,
-1.20926, 0.01103849, -0.9524982, 1, 0.5764706, 0, 1,
-1.195604, 0.4888155, -0.5296416, 1, 0.5803922, 0, 1,
-1.191681, -0.1281837, -1.835243, 1, 0.5882353, 0, 1,
-1.190507, 0.7416098, -0.5274734, 1, 0.5921569, 0, 1,
-1.190031, -0.3357065, -1.132916, 1, 0.6, 0, 1,
-1.18904, -1.464282, -1.093277, 1, 0.6078432, 0, 1,
-1.18593, 0.405237, -3.269769, 1, 0.6117647, 0, 1,
-1.185926, -0.05130634, -1.42551, 1, 0.6196079, 0, 1,
-1.177639, -0.4497035, -1.174927, 1, 0.6235294, 0, 1,
-1.174657, 0.3295269, -1.683835, 1, 0.6313726, 0, 1,
-1.174195, 0.4594686, -1.298347, 1, 0.6352941, 0, 1,
-1.172019, -0.7285011, -2.270175, 1, 0.6431373, 0, 1,
-1.167895, 1.797621, -0.191716, 1, 0.6470588, 0, 1,
-1.166954, -0.4286143, -2.511043, 1, 0.654902, 0, 1,
-1.15118, 0.1599143, -2.495673, 1, 0.6588235, 0, 1,
-1.150655, -0.2186211, -1.197635, 1, 0.6666667, 0, 1,
-1.144757, -0.2088254, -2.041475, 1, 0.6705883, 0, 1,
-1.138002, 1.456681, -0.6890729, 1, 0.6784314, 0, 1,
-1.133234, 0.4942075, 0.03636045, 1, 0.682353, 0, 1,
-1.122002, 0.545409, -0.8166388, 1, 0.6901961, 0, 1,
-1.121012, -1.43205, -2.812191, 1, 0.6941177, 0, 1,
-1.120973, -0.2141898, -1.781619, 1, 0.7019608, 0, 1,
-1.116076, -0.3222198, -1.496776, 1, 0.7098039, 0, 1,
-1.113765, -0.3763464, -1.482376, 1, 0.7137255, 0, 1,
-1.100597, 0.9984605, -0.7331958, 1, 0.7215686, 0, 1,
-1.09957, 0.5627257, -2.920725, 1, 0.7254902, 0, 1,
-1.095607, -3.65299, -3.306041, 1, 0.7333333, 0, 1,
-1.095453, -0.2408804, -3.881175, 1, 0.7372549, 0, 1,
-1.093544, 2.226973, -2.477801, 1, 0.7450981, 0, 1,
-1.082668, -0.2728571, -2.261382, 1, 0.7490196, 0, 1,
-1.078095, 0.05265589, -2.645404, 1, 0.7568628, 0, 1,
-1.075588, -1.530659, -1.284274, 1, 0.7607843, 0, 1,
-1.072234, -0.6734163, -3.407003, 1, 0.7686275, 0, 1,
-1.070293, -0.7279641, -2.309796, 1, 0.772549, 0, 1,
-1.063235, -1.915414, -4.141738, 1, 0.7803922, 0, 1,
-1.0515, 0.3550786, -2.123657, 1, 0.7843137, 0, 1,
-1.049943, 0.2006415, -0.9664321, 1, 0.7921569, 0, 1,
-1.044593, 1.286659, -1.059771, 1, 0.7960784, 0, 1,
-1.031812, 0.9713669, -0.4004778, 1, 0.8039216, 0, 1,
-1.028407, -0.2546047, -1.591563, 1, 0.8117647, 0, 1,
-1.02676, 0.4988714, -0.6830615, 1, 0.8156863, 0, 1,
-1.022262, -0.05024691, -1.165432, 1, 0.8235294, 0, 1,
-1.020324, -0.06790114, -2.187375, 1, 0.827451, 0, 1,
-1.002786, -1.002005, -2.404559, 1, 0.8352941, 0, 1,
-1.002431, -1.280498, -2.134034, 1, 0.8392157, 0, 1,
-1.000136, -2.504269, -2.807813, 1, 0.8470588, 0, 1,
-0.99826, 0.03990922, -2.544125, 1, 0.8509804, 0, 1,
-0.9974166, -0.1072399, -1.309763, 1, 0.8588235, 0, 1,
-0.9967841, -0.378787, 0.04869368, 1, 0.8627451, 0, 1,
-0.9880319, -1.821171, -2.978699, 1, 0.8705882, 0, 1,
-0.9879024, -0.9512038, -2.88323, 1, 0.8745098, 0, 1,
-0.986422, -0.109717, -1.64128, 1, 0.8823529, 0, 1,
-0.9863633, 0.6143346, -1.109754, 1, 0.8862745, 0, 1,
-0.9771313, -1.677968, -2.931738, 1, 0.8941177, 0, 1,
-0.9732889, -0.5141534, -2.131917, 1, 0.8980392, 0, 1,
-0.9645305, 0.7772577, -1.413268, 1, 0.9058824, 0, 1,
-0.9628599, -1.054521, -1.633395, 1, 0.9137255, 0, 1,
-0.9621696, -0.70171, -3.201555, 1, 0.9176471, 0, 1,
-0.9570193, 0.107148, -1.856552, 1, 0.9254902, 0, 1,
-0.9569924, 0.3592128, -3.253283, 1, 0.9294118, 0, 1,
-0.9545003, -1.33449, -3.163037, 1, 0.9372549, 0, 1,
-0.9537318, -0.9001154, -3.93273, 1, 0.9411765, 0, 1,
-0.9439853, -0.5630646, -1.427543, 1, 0.9490196, 0, 1,
-0.9423437, 0.1278024, -0.7291068, 1, 0.9529412, 0, 1,
-0.9398921, 1.095534, -0.02560415, 1, 0.9607843, 0, 1,
-0.9381932, -1.004614, -2.304937, 1, 0.9647059, 0, 1,
-0.9381463, -1.771966, -4.55682, 1, 0.972549, 0, 1,
-0.9300056, 0.1318287, -1.859396, 1, 0.9764706, 0, 1,
-0.9176637, 0.3828534, -0.7946456, 1, 0.9843137, 0, 1,
-0.9162156, 0.4489377, -2.31309, 1, 0.9882353, 0, 1,
-0.9142537, -2.018489, -4.347408, 1, 0.9960784, 0, 1,
-0.9073662, 0.5675527, -1.63569, 0.9960784, 1, 0, 1,
-0.9035971, 0.9433206, -0.6128671, 0.9921569, 1, 0, 1,
-0.9020316, -1.099307, -1.667718, 0.9843137, 1, 0, 1,
-0.8982282, -0.06874949, -1.410121, 0.9803922, 1, 0, 1,
-0.8922131, -2.106727, -1.608021, 0.972549, 1, 0, 1,
-0.8895232, 0.6329822, -3.63563, 0.9686275, 1, 0, 1,
-0.8855877, 0.5001324, -0.5208198, 0.9607843, 1, 0, 1,
-0.8847827, 0.01958207, -2.337815, 0.9568627, 1, 0, 1,
-0.8814527, -0.9310694, -2.411629, 0.9490196, 1, 0, 1,
-0.8781511, -0.3609451, -1.481753, 0.945098, 1, 0, 1,
-0.8710616, -0.931855, -1.934085, 0.9372549, 1, 0, 1,
-0.8664234, 0.7161837, -1.877586, 0.9333333, 1, 0, 1,
-0.8661093, 0.05439291, -1.01764, 0.9254902, 1, 0, 1,
-0.8633303, 0.4434055, -1.811527, 0.9215686, 1, 0, 1,
-0.8623521, 0.6713543, -0.3417528, 0.9137255, 1, 0, 1,
-0.854988, -0.1044682, -0.7615376, 0.9098039, 1, 0, 1,
-0.8543295, 0.3389909, -2.747287, 0.9019608, 1, 0, 1,
-0.8540326, 1.087076, -0.4974419, 0.8941177, 1, 0, 1,
-0.8495373, -2.271823, -2.655908, 0.8901961, 1, 0, 1,
-0.8491573, -0.6518618, -1.410352, 0.8823529, 1, 0, 1,
-0.8431165, -1.675437, -1.177868, 0.8784314, 1, 0, 1,
-0.839581, 0.03669381, -1.758905, 0.8705882, 1, 0, 1,
-0.8380891, 0.3816007, 0.8643159, 0.8666667, 1, 0, 1,
-0.835708, -0.6010717, -2.581325, 0.8588235, 1, 0, 1,
-0.834536, 1.406202, -0.8206407, 0.854902, 1, 0, 1,
-0.8290937, -0.2297149, -2.76149, 0.8470588, 1, 0, 1,
-0.8254481, 2.087628, -2.250005, 0.8431373, 1, 0, 1,
-0.8210536, 0.4189667, -2.642805, 0.8352941, 1, 0, 1,
-0.8035847, 1.46467, 1.427311, 0.8313726, 1, 0, 1,
-0.8017862, -0.8781449, -3.259689, 0.8235294, 1, 0, 1,
-0.7977274, 0.946799, -2.107037, 0.8196079, 1, 0, 1,
-0.7941537, 0.9931251, -2.461316, 0.8117647, 1, 0, 1,
-0.7863081, -0.5814704, -0.2955746, 0.8078431, 1, 0, 1,
-0.7860745, 1.365893, -1.039567, 0.8, 1, 0, 1,
-0.7814032, 0.06875998, -3.286155, 0.7921569, 1, 0, 1,
-0.7808683, 0.1251869, -1.327105, 0.7882353, 1, 0, 1,
-0.7801144, 0.07030599, -2.126572, 0.7803922, 1, 0, 1,
-0.7794988, 1.661642, -0.2915822, 0.7764706, 1, 0, 1,
-0.7769591, -1.399666, -2.657156, 0.7686275, 1, 0, 1,
-0.7767006, -0.4871488, -1.215272, 0.7647059, 1, 0, 1,
-0.7753983, -0.5992076, -2.010569, 0.7568628, 1, 0, 1,
-0.7708433, -1.107806, -2.297397, 0.7529412, 1, 0, 1,
-0.7697607, 1.001152, 0.03575257, 0.7450981, 1, 0, 1,
-0.7659721, 1.574752, -0.288169, 0.7411765, 1, 0, 1,
-0.7618374, 0.1042928, -0.2184185, 0.7333333, 1, 0, 1,
-0.7574415, -0.5825365, -2.543207, 0.7294118, 1, 0, 1,
-0.7537139, -2.06121, -1.547204, 0.7215686, 1, 0, 1,
-0.7488463, -0.4661557, -2.757951, 0.7176471, 1, 0, 1,
-0.7365949, -0.4462901, -2.034309, 0.7098039, 1, 0, 1,
-0.7258413, 0.2412564, -2.155189, 0.7058824, 1, 0, 1,
-0.7233145, 1.409546, -0.3523709, 0.6980392, 1, 0, 1,
-0.7164822, 0.7946924, -0.2487196, 0.6901961, 1, 0, 1,
-0.7112613, -1.07032, -2.553628, 0.6862745, 1, 0, 1,
-0.7100945, 1.844451, 2.763717, 0.6784314, 1, 0, 1,
-0.7093775, 0.5103597, 0.7855598, 0.6745098, 1, 0, 1,
-0.7067795, 0.3214416, -2.510088, 0.6666667, 1, 0, 1,
-0.7056168, -1.478371, -2.714358, 0.6627451, 1, 0, 1,
-0.700937, 1.380185, -3.009015, 0.654902, 1, 0, 1,
-0.697419, 0.2928781, -2.588889, 0.6509804, 1, 0, 1,
-0.6940874, 1.01502, -1.127722, 0.6431373, 1, 0, 1,
-0.6907533, 0.808163, -1.684556, 0.6392157, 1, 0, 1,
-0.689635, 0.05680408, -2.507496, 0.6313726, 1, 0, 1,
-0.688652, -0.7142116, -3.168921, 0.627451, 1, 0, 1,
-0.6873907, -0.2547502, -2.233637, 0.6196079, 1, 0, 1,
-0.6840034, -0.1910809, -2.389692, 0.6156863, 1, 0, 1,
-0.6789997, 0.2093411, -0.1655664, 0.6078432, 1, 0, 1,
-0.6773093, -0.5686417, -3.140162, 0.6039216, 1, 0, 1,
-0.676878, -0.4976338, -1.433206, 0.5960785, 1, 0, 1,
-0.6723849, -0.7407234, -3.402009, 0.5882353, 1, 0, 1,
-0.6719311, 0.1473444, -2.075682, 0.5843138, 1, 0, 1,
-0.6705728, -0.1250733, -2.074925, 0.5764706, 1, 0, 1,
-0.6701163, -1.729593, -1.302231, 0.572549, 1, 0, 1,
-0.6683148, -0.1779186, -2.521887, 0.5647059, 1, 0, 1,
-0.6552871, -0.3654775, -2.88806, 0.5607843, 1, 0, 1,
-0.6543734, -0.7571207, -1.23959, 0.5529412, 1, 0, 1,
-0.6528342, -1.333874, -1.431268, 0.5490196, 1, 0, 1,
-0.6516402, 0.6148677, 0.001391217, 0.5411765, 1, 0, 1,
-0.6438684, 1.607929, 0.5591421, 0.5372549, 1, 0, 1,
-0.6432312, 0.1091329, -0.9325076, 0.5294118, 1, 0, 1,
-0.6419408, 0.6049154, -1.693724, 0.5254902, 1, 0, 1,
-0.6383181, 1.213765, 0.1683546, 0.5176471, 1, 0, 1,
-0.635927, -0.1104781, -0.3651547, 0.5137255, 1, 0, 1,
-0.635579, -0.008002257, -0.865543, 0.5058824, 1, 0, 1,
-0.6343852, -0.3372736, -3.16028, 0.5019608, 1, 0, 1,
-0.6306453, 0.5540115, 0.6538534, 0.4941176, 1, 0, 1,
-0.6282457, 0.3786371, -2.953984, 0.4862745, 1, 0, 1,
-0.6251541, 0.1360553, -0.5487581, 0.4823529, 1, 0, 1,
-0.6244016, -0.2328777, -4.153461, 0.4745098, 1, 0, 1,
-0.6167905, -0.7480975, -2.869107, 0.4705882, 1, 0, 1,
-0.6091011, -0.3947366, -3.136214, 0.4627451, 1, 0, 1,
-0.60566, 2.005994, -0.1653298, 0.4588235, 1, 0, 1,
-0.6019884, 3.07922, -1.136204, 0.4509804, 1, 0, 1,
-0.6008173, 1.360966, 0.1487359, 0.4470588, 1, 0, 1,
-0.59881, -0.7949975, -1.188652, 0.4392157, 1, 0, 1,
-0.5957223, 0.4040951, -0.8597638, 0.4352941, 1, 0, 1,
-0.5877037, -0.8017184, -3.456416, 0.427451, 1, 0, 1,
-0.5791874, -1.029208, -2.706577, 0.4235294, 1, 0, 1,
-0.5790184, 0.8317938, -1.28564, 0.4156863, 1, 0, 1,
-0.5783271, 0.08164828, 0.2525224, 0.4117647, 1, 0, 1,
-0.5764934, -0.3395211, -2.941315, 0.4039216, 1, 0, 1,
-0.5576558, 0.2154211, -0.5966106, 0.3960784, 1, 0, 1,
-0.5549607, -1.70064, -1.985973, 0.3921569, 1, 0, 1,
-0.5483159, 0.1186139, -0.7216949, 0.3843137, 1, 0, 1,
-0.5433636, 0.1569663, -2.237673, 0.3803922, 1, 0, 1,
-0.5432851, -0.07781544, -3.93544, 0.372549, 1, 0, 1,
-0.5354108, -0.697604, -2.623537, 0.3686275, 1, 0, 1,
-0.5350227, 0.3088026, -1.677054, 0.3607843, 1, 0, 1,
-0.5323769, 1.802911, -0.224636, 0.3568628, 1, 0, 1,
-0.5320033, 1.537269, -1.680574, 0.3490196, 1, 0, 1,
-0.5280516, 1.235692, -0.7827515, 0.345098, 1, 0, 1,
-0.5267969, -1.158724, -4.084792, 0.3372549, 1, 0, 1,
-0.5252855, 0.2904648, -0.6605313, 0.3333333, 1, 0, 1,
-0.5196871, -0.4877543, -1.614574, 0.3254902, 1, 0, 1,
-0.5176585, -0.8931758, -2.235026, 0.3215686, 1, 0, 1,
-0.5171655, 0.1375463, -0.2248794, 0.3137255, 1, 0, 1,
-0.5148304, 0.01279059, -2.377776, 0.3098039, 1, 0, 1,
-0.5051903, -1.021541, -2.399392, 0.3019608, 1, 0, 1,
-0.5030975, 0.5866106, -0.9910785, 0.2941177, 1, 0, 1,
-0.4960767, 2.360883, -1.025851, 0.2901961, 1, 0, 1,
-0.4944866, -1.118352, -2.535597, 0.282353, 1, 0, 1,
-0.4927187, 0.02227014, -3.171875, 0.2784314, 1, 0, 1,
-0.4912079, 0.3842312, -0.5836087, 0.2705882, 1, 0, 1,
-0.4862882, -1.769956, -1.887605, 0.2666667, 1, 0, 1,
-0.483784, -0.08811553, -2.281173, 0.2588235, 1, 0, 1,
-0.4836507, 1.620324, -0.06984143, 0.254902, 1, 0, 1,
-0.4827838, -1.421779, -1.590293, 0.2470588, 1, 0, 1,
-0.4819216, -1.196469, -0.7925861, 0.2431373, 1, 0, 1,
-0.4778647, -1.06693, -3.497628, 0.2352941, 1, 0, 1,
-0.4743798, -2.064655, -2.308565, 0.2313726, 1, 0, 1,
-0.4694358, 0.9207317, -0.2711658, 0.2235294, 1, 0, 1,
-0.469223, -1.611656, -3.714478, 0.2196078, 1, 0, 1,
-0.4677762, 0.2834931, -1.171579, 0.2117647, 1, 0, 1,
-0.4606124, 0.4512834, 1.228309, 0.2078431, 1, 0, 1,
-0.4557482, -0.5898771, -1.081822, 0.2, 1, 0, 1,
-0.4557234, -1.148305, -0.8719688, 0.1921569, 1, 0, 1,
-0.4553891, -0.1821855, -2.252583, 0.1882353, 1, 0, 1,
-0.4508612, 0.7777193, -1.220557, 0.1803922, 1, 0, 1,
-0.4500954, 0.5204191, -0.1091467, 0.1764706, 1, 0, 1,
-0.4489111, 1.459551, -1.366593, 0.1686275, 1, 0, 1,
-0.4483702, -0.2147718, -2.151672, 0.1647059, 1, 0, 1,
-0.4479201, -0.3015961, -2.24862, 0.1568628, 1, 0, 1,
-0.447065, 1.963584, -0.2883734, 0.1529412, 1, 0, 1,
-0.4466164, -1.291925, -1.679303, 0.145098, 1, 0, 1,
-0.4352322, -0.1053667, -0.402637, 0.1411765, 1, 0, 1,
-0.4338789, -0.3919903, -1.49585, 0.1333333, 1, 0, 1,
-0.4300844, 0.4833365, -0.1529824, 0.1294118, 1, 0, 1,
-0.4277339, 1.378146, -0.6237957, 0.1215686, 1, 0, 1,
-0.4263131, 0.1182457, -0.3186342, 0.1176471, 1, 0, 1,
-0.4223326, -0.6028976, -1.235252, 0.1098039, 1, 0, 1,
-0.4179124, -0.8817053, -2.676822, 0.1058824, 1, 0, 1,
-0.4099899, 1.64919, 1.960286, 0.09803922, 1, 0, 1,
-0.4060242, 0.9510522, -0.4797907, 0.09019608, 1, 0, 1,
-0.4059423, -0.4454867, -1.898587, 0.08627451, 1, 0, 1,
-0.4040501, 0.2272372, -0.2000641, 0.07843138, 1, 0, 1,
-0.4026192, -0.6226667, -1.72576, 0.07450981, 1, 0, 1,
-0.40225, -0.04312667, -0.7653054, 0.06666667, 1, 0, 1,
-0.3953765, 1.500125, -0.2560616, 0.0627451, 1, 0, 1,
-0.39384, -0.7367782, -3.780818, 0.05490196, 1, 0, 1,
-0.3879914, -0.7994539, -3.19035, 0.05098039, 1, 0, 1,
-0.3769082, -0.6466585, -2.814973, 0.04313726, 1, 0, 1,
-0.3766823, -1.141349, -2.081791, 0.03921569, 1, 0, 1,
-0.3762474, 0.5557614, -2.683066, 0.03137255, 1, 0, 1,
-0.3750501, 0.3565214, -0.06266597, 0.02745098, 1, 0, 1,
-0.3679554, -2.665973, -2.174332, 0.01960784, 1, 0, 1,
-0.3671267, 0.2018004, -0.8851227, 0.01568628, 1, 0, 1,
-0.3662297, 0.1498215, -1.315999, 0.007843138, 1, 0, 1,
-0.36513, 0.3015563, 1.0688, 0.003921569, 1, 0, 1,
-0.3644268, 0.463802, -1.058547, 0, 1, 0.003921569, 1,
-0.3608047, -0.9754057, -2.500114, 0, 1, 0.01176471, 1,
-0.3607546, -0.5331905, -2.152385, 0, 1, 0.01568628, 1,
-0.3578387, -1.481239, -4.57499, 0, 1, 0.02352941, 1,
-0.3493216, -0.4371667, -0.9598155, 0, 1, 0.02745098, 1,
-0.3488954, -0.901957, -4.220302, 0, 1, 0.03529412, 1,
-0.3419934, -0.4143861, -1.928785, 0, 1, 0.03921569, 1,
-0.3389879, 0.1459572, 0.1278581, 0, 1, 0.04705882, 1,
-0.3367842, -1.830798, -4.355817, 0, 1, 0.05098039, 1,
-0.335584, 1.259342, -1.469623, 0, 1, 0.05882353, 1,
-0.3348238, -0.1314484, -0.05190955, 0, 1, 0.0627451, 1,
-0.3275129, 0.7101833, -0.4021414, 0, 1, 0.07058824, 1,
-0.3273364, -0.1540497, -0.6503878, 0, 1, 0.07450981, 1,
-0.3257114, -0.9069994, -3.012083, 0, 1, 0.08235294, 1,
-0.3254868, 0.1316187, -1.212592, 0, 1, 0.08627451, 1,
-0.3241488, -0.1240493, -1.922102, 0, 1, 0.09411765, 1,
-0.3234419, -0.6765049, -3.636684, 0, 1, 0.1019608, 1,
-0.3197386, -1.572195, -2.208902, 0, 1, 0.1058824, 1,
-0.3154415, 0.4811415, -1.264319, 0, 1, 0.1137255, 1,
-0.3132476, -0.2793067, -0.2390269, 0, 1, 0.1176471, 1,
-0.3119422, 0.6113645, 0.5145878, 0, 1, 0.1254902, 1,
-0.3093178, -0.07740577, -3.737991, 0, 1, 0.1294118, 1,
-0.3062309, 0.9786616, -1.764798, 0, 1, 0.1372549, 1,
-0.3043, -0.7577152, -2.654207, 0, 1, 0.1411765, 1,
-0.2981384, 0.2732721, -0.9181533, 0, 1, 0.1490196, 1,
-0.2965685, -1.183371, -3.573951, 0, 1, 0.1529412, 1,
-0.2946652, -1.930837, -2.920874, 0, 1, 0.1607843, 1,
-0.291762, -0.1056195, -2.490753, 0, 1, 0.1647059, 1,
-0.2914483, 1.70548, 0.03467615, 0, 1, 0.172549, 1,
-0.2912585, -0.1503999, -3.689416, 0, 1, 0.1764706, 1,
-0.2910349, 1.04668, -0.03997856, 0, 1, 0.1843137, 1,
-0.2886274, -0.4232922, -4.509089, 0, 1, 0.1882353, 1,
-0.2877638, 0.4221669, -0.1431283, 0, 1, 0.1960784, 1,
-0.2876183, -0.8048421, -2.4766, 0, 1, 0.2039216, 1,
-0.2824291, -1.177783, -2.844944, 0, 1, 0.2078431, 1,
-0.2809304, -0.2906698, -1.685764, 0, 1, 0.2156863, 1,
-0.2797669, -1.558225, -0.9189053, 0, 1, 0.2196078, 1,
-0.2705795, -0.06417289, -2.365103, 0, 1, 0.227451, 1,
-0.2677836, 0.3457914, -1.545197, 0, 1, 0.2313726, 1,
-0.2662043, -1.998559, -2.418576, 0, 1, 0.2392157, 1,
-0.2637439, -0.6194208, -2.229459, 0, 1, 0.2431373, 1,
-0.2609925, -1.490125, -1.620517, 0, 1, 0.2509804, 1,
-0.257349, -0.5871257, -2.903629, 0, 1, 0.254902, 1,
-0.2512589, 1.148346, 1.411696, 0, 1, 0.2627451, 1,
-0.250216, -0.7490479, -2.776978, 0, 1, 0.2666667, 1,
-0.2430641, 1.719556, -0.1179671, 0, 1, 0.2745098, 1,
-0.2401235, 1.116567, -0.7651411, 0, 1, 0.2784314, 1,
-0.2365925, -1.316416, -2.749472, 0, 1, 0.2862745, 1,
-0.2334558, 1.157025, 0.1428596, 0, 1, 0.2901961, 1,
-0.2324129, 3.466824, 0.5680122, 0, 1, 0.2980392, 1,
-0.2311948, -0.08904097, -0.5906428, 0, 1, 0.3058824, 1,
-0.2287446, 0.3339051, 0.6043746, 0, 1, 0.3098039, 1,
-0.2236366, -0.7470294, -3.828786, 0, 1, 0.3176471, 1,
-0.2213559, 2.81489, -0.7130761, 0, 1, 0.3215686, 1,
-0.2202217, 1.260996, -0.04506471, 0, 1, 0.3294118, 1,
-0.2183245, 1.081036, -0.04931759, 0, 1, 0.3333333, 1,
-0.2140351, 1.667295, -0.7858201, 0, 1, 0.3411765, 1,
-0.2133574, -0.1851521, -3.052752, 0, 1, 0.345098, 1,
-0.2087071, 0.8523087, 1.238837, 0, 1, 0.3529412, 1,
-0.2066383, -1.162886, -3.605836, 0, 1, 0.3568628, 1,
-0.2051654, -0.6730658, -1.92944, 0, 1, 0.3647059, 1,
-0.204718, -0.9722455, -1.341783, 0, 1, 0.3686275, 1,
-0.203142, -0.8901993, -3.713897, 0, 1, 0.3764706, 1,
-0.2001634, -0.3548543, -1.937256, 0, 1, 0.3803922, 1,
-0.1960429, -0.3682906, -3.106945, 0, 1, 0.3882353, 1,
-0.1938836, -0.9631791, -3.156041, 0, 1, 0.3921569, 1,
-0.1937591, -0.3459911, -4.360883, 0, 1, 0.4, 1,
-0.1935858, 1.616168, 0.4118678, 0, 1, 0.4078431, 1,
-0.192176, 1.785571, -0.7279413, 0, 1, 0.4117647, 1,
-0.1910331, -0.2446139, -1.766552, 0, 1, 0.4196078, 1,
-0.1859325, 3.139877, 1.101543, 0, 1, 0.4235294, 1,
-0.1846858, 0.2323366, -1.681968, 0, 1, 0.4313726, 1,
-0.1844513, 1.119937, -0.8156229, 0, 1, 0.4352941, 1,
-0.1802231, 0.3426576, -1.125193, 0, 1, 0.4431373, 1,
-0.1785347, 1.312448, 1.110578, 0, 1, 0.4470588, 1,
-0.1775614, 1.210914, -0.05228108, 0, 1, 0.454902, 1,
-0.1754965, 1.963845, 0.2793267, 0, 1, 0.4588235, 1,
-0.1726282, -0.6831934, -3.771499, 0, 1, 0.4666667, 1,
-0.1699861, -0.09065456, -1.243491, 0, 1, 0.4705882, 1,
-0.169056, -0.743524, -1.783211, 0, 1, 0.4784314, 1,
-0.1666963, 0.3475439, -0.7328448, 0, 1, 0.4823529, 1,
-0.1624812, 1.945723, -0.147196, 0, 1, 0.4901961, 1,
-0.1595306, -0.6694161, -2.166531, 0, 1, 0.4941176, 1,
-0.1570211, 0.4204982, -0.201652, 0, 1, 0.5019608, 1,
-0.1459857, -0.02082941, -0.9861874, 0, 1, 0.509804, 1,
-0.1449681, -1.127481, -3.187575, 0, 1, 0.5137255, 1,
-0.1441643, -1.350389, -1.440479, 0, 1, 0.5215687, 1,
-0.1366312, 0.672744, 1.710489, 0, 1, 0.5254902, 1,
-0.1351374, -2.107175, -3.249463, 0, 1, 0.5333334, 1,
-0.1298595, -1.307911, -3.337753, 0, 1, 0.5372549, 1,
-0.1289034, 0.5585257, -0.3388605, 0, 1, 0.5450981, 1,
-0.1270474, -0.01869076, -2.653015, 0, 1, 0.5490196, 1,
-0.1244752, -0.535182, -3.116797, 0, 1, 0.5568628, 1,
-0.1243228, 0.04939149, -1.01241, 0, 1, 0.5607843, 1,
-0.1241278, -0.4231421, -2.007077, 0, 1, 0.5686275, 1,
-0.1226098, 2.166417, 1.140937, 0, 1, 0.572549, 1,
-0.1207556, 0.5582713, 0.1649792, 0, 1, 0.5803922, 1,
-0.1184535, -0.6841128, -0.6530073, 0, 1, 0.5843138, 1,
-0.1138277, 1.243409, -0.3360317, 0, 1, 0.5921569, 1,
-0.1106118, 0.6836624, -0.3885345, 0, 1, 0.5960785, 1,
-0.1098341, 0.8146778, -0.2464859, 0, 1, 0.6039216, 1,
-0.1094958, -1.381393, -3.748129, 0, 1, 0.6117647, 1,
-0.1076123, 0.4221628, 0.7504346, 0, 1, 0.6156863, 1,
-0.1066173, 3.776203, -1.397939, 0, 1, 0.6235294, 1,
-0.1028174, 0.4460625, 0.3789555, 0, 1, 0.627451, 1,
-0.09999628, -1.270903, -3.231377, 0, 1, 0.6352941, 1,
-0.09784125, 0.596091, 0.1834788, 0, 1, 0.6392157, 1,
-0.09767574, 0.4264815, -1.130093, 0, 1, 0.6470588, 1,
-0.09734391, 1.856696, 2.0519, 0, 1, 0.6509804, 1,
-0.09666003, 0.7480258, -0.6486951, 0, 1, 0.6588235, 1,
-0.09630843, -0.3487019, -2.802604, 0, 1, 0.6627451, 1,
-0.08988935, -0.5472987, -4.496077, 0, 1, 0.6705883, 1,
-0.08454063, -1.73423, -2.80469, 0, 1, 0.6745098, 1,
-0.08359964, -1.372988, -3.431012, 0, 1, 0.682353, 1,
-0.08329296, -0.02397443, -2.60098, 0, 1, 0.6862745, 1,
-0.08265211, 0.5825961, 0.2867695, 0, 1, 0.6941177, 1,
-0.08134522, -0.3335263, -3.243966, 0, 1, 0.7019608, 1,
-0.08085369, -0.2893777, -4.463078, 0, 1, 0.7058824, 1,
-0.08001205, 0.0265031, -0.6120642, 0, 1, 0.7137255, 1,
-0.07667995, 0.4106301, -0.1642003, 0, 1, 0.7176471, 1,
-0.07657953, 2.006588, -0.5082415, 0, 1, 0.7254902, 1,
-0.07653967, 0.2938793, -1.061067, 0, 1, 0.7294118, 1,
-0.07490135, 2.24991, -0.4417438, 0, 1, 0.7372549, 1,
-0.07322211, -0.3296727, -2.18764, 0, 1, 0.7411765, 1,
-0.07277293, 0.7650096, 2.584704, 0, 1, 0.7490196, 1,
-0.07066946, 0.5824765, 0.07128134, 0, 1, 0.7529412, 1,
-0.07059728, 0.8509043, -0.640036, 0, 1, 0.7607843, 1,
-0.06781785, -2.366558, -5.180273, 0, 1, 0.7647059, 1,
-0.06620987, 1.482065, -0.2880222, 0, 1, 0.772549, 1,
-0.06033616, -1.2525, -4.609471, 0, 1, 0.7764706, 1,
-0.0602876, -0.6771892, -2.939718, 0, 1, 0.7843137, 1,
-0.05867734, 1.21877, 0.2245469, 0, 1, 0.7882353, 1,
-0.05543375, 1.383743, 1.318375, 0, 1, 0.7960784, 1,
-0.05394195, -0.7446883, -2.55848, 0, 1, 0.8039216, 1,
-0.05244935, 2.243911, 0.5928391, 0, 1, 0.8078431, 1,
-0.0499971, 0.2631424, 0.07493525, 0, 1, 0.8156863, 1,
-0.04934106, -0.7749472, -4.595816, 0, 1, 0.8196079, 1,
-0.04591802, 0.6241165, 0.8414654, 0, 1, 0.827451, 1,
-0.04419046, 1.711631, -0.158588, 0, 1, 0.8313726, 1,
-0.04132541, 1.813145, 0.9854068, 0, 1, 0.8392157, 1,
-0.03855009, 0.9510066, 0.35144, 0, 1, 0.8431373, 1,
-0.034245, 1.121787, -0.885249, 0, 1, 0.8509804, 1,
-0.03387789, 2.115031, 0.536704, 0, 1, 0.854902, 1,
-0.03373231, -0.445058, -2.901255, 0, 1, 0.8627451, 1,
-0.02975053, 1.495591, -1.10971, 0, 1, 0.8666667, 1,
-0.02886946, 0.2840143, 1.024309, 0, 1, 0.8745098, 1,
-0.02694046, 0.1623622, 0.5665621, 0, 1, 0.8784314, 1,
-0.02617584, 0.466731, 1.259745, 0, 1, 0.8862745, 1,
-0.02369125, 1.62878, 0.6154554, 0, 1, 0.8901961, 1,
-0.02088997, -0.2378581, -1.587933, 0, 1, 0.8980392, 1,
-0.0172755, 0.530163, -0.7706471, 0, 1, 0.9058824, 1,
-0.01430781, 1.005249, -0.8905736, 0, 1, 0.9098039, 1,
-0.01374579, 0.5212868, 0.9603354, 0, 1, 0.9176471, 1,
-0.008934098, 0.5160722, -0.03140369, 0, 1, 0.9215686, 1,
-0.00687514, -0.1685714, -1.606548, 0, 1, 0.9294118, 1,
-0.004005964, -2.459828, -1.694036, 0, 1, 0.9333333, 1,
-0.00299926, -1.108319, -4.185461, 0, 1, 0.9411765, 1,
-0.002361105, -1.134163, -3.884756, 0, 1, 0.945098, 1,
0.0001235208, 0.07127018, -0.05828939, 0, 1, 0.9529412, 1,
0.002318192, -0.4482495, 0.3512461, 0, 1, 0.9568627, 1,
0.004616725, 0.1465755, 0.1757087, 0, 1, 0.9647059, 1,
0.01306307, -1.28674, 3.16559, 0, 1, 0.9686275, 1,
0.01458564, -1.06178, 2.376012, 0, 1, 0.9764706, 1,
0.01480284, -0.3252939, 2.616276, 0, 1, 0.9803922, 1,
0.01686215, -0.4631388, 3.562808, 0, 1, 0.9882353, 1,
0.02098609, -0.486154, 2.445752, 0, 1, 0.9921569, 1,
0.02893401, 0.2791339, 2.154884, 0, 1, 1, 1,
0.02903091, 0.3421459, 0.7311483, 0, 0.9921569, 1, 1,
0.03362073, -1.720766, 4.729226, 0, 0.9882353, 1, 1,
0.03449069, -0.7730827, 3.2379, 0, 0.9803922, 1, 1,
0.03619464, 1.569997, 1.042552, 0, 0.9764706, 1, 1,
0.03837261, 0.7182412, -0.2537823, 0, 0.9686275, 1, 1,
0.04286112, 0.4479211, -0.06134025, 0, 0.9647059, 1, 1,
0.04518294, 0.2776361, -1.221334, 0, 0.9568627, 1, 1,
0.05142207, 0.2635806, -1.236391, 0, 0.9529412, 1, 1,
0.05146996, -0.2542011, 2.203081, 0, 0.945098, 1, 1,
0.05798303, -0.4368118, 2.933084, 0, 0.9411765, 1, 1,
0.05854646, -0.5602237, 3.399292, 0, 0.9333333, 1, 1,
0.05937003, 0.09681202, 0.1509612, 0, 0.9294118, 1, 1,
0.06079849, -0.2933516, 3.399979, 0, 0.9215686, 1, 1,
0.06298594, 0.8689849, 0.5794321, 0, 0.9176471, 1, 1,
0.06396297, -0.2052428, 3.662996, 0, 0.9098039, 1, 1,
0.06412872, -0.2828652, 2.39494, 0, 0.9058824, 1, 1,
0.06608921, 0.07499813, 0.5319529, 0, 0.8980392, 1, 1,
0.06819642, -0.7495781, 2.636952, 0, 0.8901961, 1, 1,
0.07157087, -0.06926671, 0.7793679, 0, 0.8862745, 1, 1,
0.07600064, -1.693678, 3.142232, 0, 0.8784314, 1, 1,
0.07763231, 1.516285, 0.9738386, 0, 0.8745098, 1, 1,
0.0843439, -0.7571914, 0.4072683, 0, 0.8666667, 1, 1,
0.09141572, 0.3761792, -0.01787269, 0, 0.8627451, 1, 1,
0.09490354, -0.4386943, 5.158605, 0, 0.854902, 1, 1,
0.09570564, -0.4048007, 2.794185, 0, 0.8509804, 1, 1,
0.09795949, -0.6209415, 4.39399, 0, 0.8431373, 1, 1,
0.1024758, -0.2317472, 1.559913, 0, 0.8392157, 1, 1,
0.1029038, 2.261798, 1.105236, 0, 0.8313726, 1, 1,
0.1033505, 1.124026, 1.186456, 0, 0.827451, 1, 1,
0.1108846, 1.975687, -0.6560276, 0, 0.8196079, 1, 1,
0.116529, 0.9839563, 0.1992114, 0, 0.8156863, 1, 1,
0.1189438, -1.184451, 4.925804, 0, 0.8078431, 1, 1,
0.1231671, -0.359474, 1.55352, 0, 0.8039216, 1, 1,
0.1288132, -0.195253, 3.742196, 0, 0.7960784, 1, 1,
0.1294524, 0.870111, -0.7055652, 0, 0.7882353, 1, 1,
0.1303184, 1.631131, -0.3628299, 0, 0.7843137, 1, 1,
0.1306308, -2.099123, 3.790394, 0, 0.7764706, 1, 1,
0.1395152, 0.06994461, 0.4938276, 0, 0.772549, 1, 1,
0.1400124, 0.7710862, 0.276187, 0, 0.7647059, 1, 1,
0.1457968, 0.8962839, 0.929866, 0, 0.7607843, 1, 1,
0.1495909, -0.5065505, 2.987664, 0, 0.7529412, 1, 1,
0.1507935, 0.4568431, 0.6819646, 0, 0.7490196, 1, 1,
0.1538332, -0.6425784, 1.749504, 0, 0.7411765, 1, 1,
0.1587237, 0.8056208, -1.702302, 0, 0.7372549, 1, 1,
0.1629927, 0.6642538, -1.120259, 0, 0.7294118, 1, 1,
0.1634387, -1.006249, 2.198324, 0, 0.7254902, 1, 1,
0.1642551, 1.740101, 0.2139081, 0, 0.7176471, 1, 1,
0.1657997, -0.4310423, 4.399849, 0, 0.7137255, 1, 1,
0.1669218, -1.855227, 3.779326, 0, 0.7058824, 1, 1,
0.1685027, -0.5019938, 3.030883, 0, 0.6980392, 1, 1,
0.1686707, -0.2699737, 2.074223, 0, 0.6941177, 1, 1,
0.171041, 0.8800736, -0.1635033, 0, 0.6862745, 1, 1,
0.1736745, -0.6739265, 3.701509, 0, 0.682353, 1, 1,
0.1792265, 3.538031, 1.675087, 0, 0.6745098, 1, 1,
0.1815648, 0.1469707, -0.5043327, 0, 0.6705883, 1, 1,
0.1815678, 1.23539, 0.198052, 0, 0.6627451, 1, 1,
0.1892446, 0.8041196, 0.001109667, 0, 0.6588235, 1, 1,
0.1894373, -2.209764, 1.428355, 0, 0.6509804, 1, 1,
0.1905219, 0.9997212, -1.313691, 0, 0.6470588, 1, 1,
0.1940812, -0.8977761, 3.791389, 0, 0.6392157, 1, 1,
0.199026, -0.4028269, 3.494128, 0, 0.6352941, 1, 1,
0.1990937, 1.113186, -1.722443, 0, 0.627451, 1, 1,
0.2067964, -0.03379738, 2.634187, 0, 0.6235294, 1, 1,
0.2093092, 1.30601, 0.7289922, 0, 0.6156863, 1, 1,
0.2108174, -2.371658, 3.043148, 0, 0.6117647, 1, 1,
0.2111377, -0.6785388, 4.0055, 0, 0.6039216, 1, 1,
0.2127281, 1.094726, 2.690494, 0, 0.5960785, 1, 1,
0.2148097, 1.767164, 2.814489, 0, 0.5921569, 1, 1,
0.2150686, -0.6116759, 1.839297, 0, 0.5843138, 1, 1,
0.2186333, -0.2252021, 3.044205, 0, 0.5803922, 1, 1,
0.2205879, 1.721693, 1.377321, 0, 0.572549, 1, 1,
0.2224907, 0.8884521, -1.071277, 0, 0.5686275, 1, 1,
0.2287497, 0.8476427, 1.436278, 0, 0.5607843, 1, 1,
0.2299933, 0.956451, -1.092391, 0, 0.5568628, 1, 1,
0.2327643, 0.6042047, 1.304098, 0, 0.5490196, 1, 1,
0.233253, -0.5508875, 2.043615, 0, 0.5450981, 1, 1,
0.2347807, -2.324396, 4.0105, 0, 0.5372549, 1, 1,
0.2409606, -0.3130885, 2.86535, 0, 0.5333334, 1, 1,
0.2426838, 0.202133, 1.389465, 0, 0.5254902, 1, 1,
0.2449163, 0.7769248, 0.5886524, 0, 0.5215687, 1, 1,
0.246003, -0.3057629, 4.132053, 0, 0.5137255, 1, 1,
0.2478514, -1.290669, 3.867109, 0, 0.509804, 1, 1,
0.2486073, 0.8961757, 0.571665, 0, 0.5019608, 1, 1,
0.2519928, 1.093386, -0.1304537, 0, 0.4941176, 1, 1,
0.253759, -1.981261, 3.73401, 0, 0.4901961, 1, 1,
0.2566848, -0.03909757, 1.106535, 0, 0.4823529, 1, 1,
0.2606957, -0.5436789, 3.133203, 0, 0.4784314, 1, 1,
0.2710871, 0.2052502, 0.8082417, 0, 0.4705882, 1, 1,
0.2734306, 0.865868, -1.178007, 0, 0.4666667, 1, 1,
0.273812, -0.597371, 3.574597, 0, 0.4588235, 1, 1,
0.2747072, -0.1375052, 1.643078, 0, 0.454902, 1, 1,
0.2755343, -0.9908341, 1.361393, 0, 0.4470588, 1, 1,
0.2786733, 0.3433889, 0.5423127, 0, 0.4431373, 1, 1,
0.2791759, -0.03435567, -0.4735995, 0, 0.4352941, 1, 1,
0.2794383, 0.2595048, 1.263936, 0, 0.4313726, 1, 1,
0.2812517, 0.4971304, 1.048593, 0, 0.4235294, 1, 1,
0.2831532, -0.7031917, 2.969905, 0, 0.4196078, 1, 1,
0.2942562, -1.946582, 3.156641, 0, 0.4117647, 1, 1,
0.3036882, 0.8170451, -0.6378912, 0, 0.4078431, 1, 1,
0.3094695, -2.851411, 3.277815, 0, 0.4, 1, 1,
0.3107504, 0.06418285, 2.663574, 0, 0.3921569, 1, 1,
0.319834, 0.6318549, 0.07487312, 0, 0.3882353, 1, 1,
0.3215804, -0.6862053, 2.603174, 0, 0.3803922, 1, 1,
0.3217879, -0.179904, 2.218062, 0, 0.3764706, 1, 1,
0.3240012, -2.241337, 2.678786, 0, 0.3686275, 1, 1,
0.3254251, 0.7378425, -1.473802, 0, 0.3647059, 1, 1,
0.3292324, -0.5653346, 1.335682, 0, 0.3568628, 1, 1,
0.3293383, 0.3797871, 0.6739523, 0, 0.3529412, 1, 1,
0.3295185, 0.1226174, -0.985357, 0, 0.345098, 1, 1,
0.3337955, -0.1923738, 0.7320358, 0, 0.3411765, 1, 1,
0.3349535, 0.297545, 1.017124, 0, 0.3333333, 1, 1,
0.3461649, -0.3957103, 1.335155, 0, 0.3294118, 1, 1,
0.3505196, 1.018677, 0.7303521, 0, 0.3215686, 1, 1,
0.3511087, 0.09302118, 1.968847, 0, 0.3176471, 1, 1,
0.3513911, -0.6676322, 1.395132, 0, 0.3098039, 1, 1,
0.3527666, 0.9675139, -0.06535764, 0, 0.3058824, 1, 1,
0.3540029, 1.292455, 0.7499915, 0, 0.2980392, 1, 1,
0.3542436, 0.6379573, 1.552284, 0, 0.2901961, 1, 1,
0.3550029, 1.859516, 1.167822, 0, 0.2862745, 1, 1,
0.3618422, 1.843325, -0.7972814, 0, 0.2784314, 1, 1,
0.3643218, -2.067832, 3.844883, 0, 0.2745098, 1, 1,
0.3684421, 0.6272677, 0.8809937, 0, 0.2666667, 1, 1,
0.3719188, -0.745069, 1.612343, 0, 0.2627451, 1, 1,
0.3733197, 0.09842379, 1.179785, 0, 0.254902, 1, 1,
0.3788992, 0.1479541, 0.6404277, 0, 0.2509804, 1, 1,
0.3791466, 0.2785582, 1.14409, 0, 0.2431373, 1, 1,
0.3848056, 1.014945, -0.08683854, 0, 0.2392157, 1, 1,
0.3884987, 0.2325267, -0.7185335, 0, 0.2313726, 1, 1,
0.3887995, 1.437449, -0.4302559, 0, 0.227451, 1, 1,
0.3897136, 0.184248, 1.789777, 0, 0.2196078, 1, 1,
0.3916218, 2.175727, 0.07536595, 0, 0.2156863, 1, 1,
0.3932135, 0.5031726, 1.766865, 0, 0.2078431, 1, 1,
0.3934308, 1.716922, 0.1883323, 0, 0.2039216, 1, 1,
0.3938803, 2.184811, 0.3266706, 0, 0.1960784, 1, 1,
0.3953816, 1.553859, 1.082311, 0, 0.1882353, 1, 1,
0.3961495, -0.0004496858, 0.3531334, 0, 0.1843137, 1, 1,
0.3962263, 1.055373, 0.7637972, 0, 0.1764706, 1, 1,
0.4073906, 0.04242964, 0.7471109, 0, 0.172549, 1, 1,
0.4156227, 1.221695, 1.977699, 0, 0.1647059, 1, 1,
0.4178095, 1.952234, -0.5915229, 0, 0.1607843, 1, 1,
0.418662, -0.02141653, 1.270237, 0, 0.1529412, 1, 1,
0.4266919, -2.43423, 3.285559, 0, 0.1490196, 1, 1,
0.4283992, -1.13626, 3.683037, 0, 0.1411765, 1, 1,
0.42894, -0.2871463, 1.407923, 0, 0.1372549, 1, 1,
0.4292451, -2.835694, 2.081484, 0, 0.1294118, 1, 1,
0.430735, -0.2550871, 2.900618, 0, 0.1254902, 1, 1,
0.431701, -0.1109721, 1.451597, 0, 0.1176471, 1, 1,
0.4349538, -0.7295942, 1.470289, 0, 0.1137255, 1, 1,
0.4380094, 0.2531204, 0.8143846, 0, 0.1058824, 1, 1,
0.4410965, -0.09293664, 1.03579, 0, 0.09803922, 1, 1,
0.4419867, -0.8915778, 2.49244, 0, 0.09411765, 1, 1,
0.4474732, -0.8213105, 3.160356, 0, 0.08627451, 1, 1,
0.4477035, 0.02570778, 1.16676, 0, 0.08235294, 1, 1,
0.4482781, -0.3985899, 1.196264, 0, 0.07450981, 1, 1,
0.4496683, -0.8556921, 4.067564, 0, 0.07058824, 1, 1,
0.4499085, 0.570159, -0.505215, 0, 0.0627451, 1, 1,
0.4506636, -2.459918, 2.718005, 0, 0.05882353, 1, 1,
0.4531052, -0.4041701, 2.17818, 0, 0.05098039, 1, 1,
0.4546162, -1.020028, 4.992098, 0, 0.04705882, 1, 1,
0.4596124, -0.9230137, 3.070053, 0, 0.03921569, 1, 1,
0.4649927, -0.7108004, 3.068135, 0, 0.03529412, 1, 1,
0.4690317, -0.3471459, 1.273798, 0, 0.02745098, 1, 1,
0.4805564, -0.479491, 2.301689, 0, 0.02352941, 1, 1,
0.4851188, 0.3776272, -0.4431759, 0, 0.01568628, 1, 1,
0.4868249, -1.476808, 1.230024, 0, 0.01176471, 1, 1,
0.4869713, 1.514915, 2.374695, 0, 0.003921569, 1, 1,
0.4874551, 0.6912403, -0.8506024, 0.003921569, 0, 1, 1,
0.4879651, -0.1368553, 2.674039, 0.007843138, 0, 1, 1,
0.4893251, -1.225673, 3.521165, 0.01568628, 0, 1, 1,
0.491325, 0.8558921, 1.880266, 0.01960784, 0, 1, 1,
0.4934298, -0.8450938, 2.794389, 0.02745098, 0, 1, 1,
0.494509, -0.1442392, 2.41364, 0.03137255, 0, 1, 1,
0.4991539, -1.525706, 4.161138, 0.03921569, 0, 1, 1,
0.5020034, -0.3275992, 1.30348, 0.04313726, 0, 1, 1,
0.5038849, 1.057371, -1.068152, 0.05098039, 0, 1, 1,
0.5040385, -0.6029037, 0.5007649, 0.05490196, 0, 1, 1,
0.5122333, 0.8187388, -0.1128602, 0.0627451, 0, 1, 1,
0.5132581, -0.772891, 2.250673, 0.06666667, 0, 1, 1,
0.5145631, 0.315609, 0.7618564, 0.07450981, 0, 1, 1,
0.5149862, 1.981634, -0.3193842, 0.07843138, 0, 1, 1,
0.5150304, 1.672076, -0.3087156, 0.08627451, 0, 1, 1,
0.5227442, 1.322782, 0.5879232, 0.09019608, 0, 1, 1,
0.5238929, 1.000053, -1.387917, 0.09803922, 0, 1, 1,
0.5239509, -0.2994367, 1.469625, 0.1058824, 0, 1, 1,
0.5243378, -0.06642019, 1.831571, 0.1098039, 0, 1, 1,
0.5245958, -2.095551, 2.489541, 0.1176471, 0, 1, 1,
0.5257239, -0.08987952, 1.462789, 0.1215686, 0, 1, 1,
0.5327235, -0.2341239, 1.811386, 0.1294118, 0, 1, 1,
0.5360014, 0.674024, 0.6855508, 0.1333333, 0, 1, 1,
0.5392684, -1.991785, 2.840806, 0.1411765, 0, 1, 1,
0.551744, 0.09454053, 0.6244562, 0.145098, 0, 1, 1,
0.5540149, -0.4620647, 1.311365, 0.1529412, 0, 1, 1,
0.558897, 0.3468451, 1.58491, 0.1568628, 0, 1, 1,
0.5608898, -0.2995507, 0.7134551, 0.1647059, 0, 1, 1,
0.5624967, -2.330871, 2.961356, 0.1686275, 0, 1, 1,
0.5659595, -1.060972, 2.126295, 0.1764706, 0, 1, 1,
0.57234, 2.150965, 0.3818724, 0.1803922, 0, 1, 1,
0.5750108, 0.09355316, -0.4419351, 0.1882353, 0, 1, 1,
0.5755524, 0.2290614, 2.174415, 0.1921569, 0, 1, 1,
0.5788236, 0.2478744, -0.9225466, 0.2, 0, 1, 1,
0.5802736, 1.617788, 1.150362, 0.2078431, 0, 1, 1,
0.5821037, 0.6118439, 1.721541, 0.2117647, 0, 1, 1,
0.5853476, -0.03675295, 0.2600542, 0.2196078, 0, 1, 1,
0.5861398, 1.738709, 1.184812, 0.2235294, 0, 1, 1,
0.5874575, 0.7391654, 0.9744397, 0.2313726, 0, 1, 1,
0.5879242, -1.197609, 3.314249, 0.2352941, 0, 1, 1,
0.5903412, -2.174407, 1.05661, 0.2431373, 0, 1, 1,
0.5958406, -0.9506607, 4.326073, 0.2470588, 0, 1, 1,
0.5964248, 0.771498, 1.823208, 0.254902, 0, 1, 1,
0.5983807, -0.2460556, 2.463527, 0.2588235, 0, 1, 1,
0.6053122, 0.4366493, 1.678042, 0.2666667, 0, 1, 1,
0.6193843, 0.8075333, -0.3728213, 0.2705882, 0, 1, 1,
0.6223243, -0.2634024, 2.232703, 0.2784314, 0, 1, 1,
0.6224062, -0.3390565, 1.202339, 0.282353, 0, 1, 1,
0.6239791, 1.702755, -0.41289, 0.2901961, 0, 1, 1,
0.627966, 0.006602525, 0.6014888, 0.2941177, 0, 1, 1,
0.6295362, -1.210492, 3.517672, 0.3019608, 0, 1, 1,
0.6316425, -0.4702303, 2.258533, 0.3098039, 0, 1, 1,
0.6322992, 0.3631096, 2.122738, 0.3137255, 0, 1, 1,
0.6333137, -0.8367881, 2.617718, 0.3215686, 0, 1, 1,
0.6414897, -1.837787, 5.006108, 0.3254902, 0, 1, 1,
0.6415531, -2.809507, 2.638389, 0.3333333, 0, 1, 1,
0.6421208, 0.2407842, -0.3846279, 0.3372549, 0, 1, 1,
0.6450624, -1.307178, 2.92331, 0.345098, 0, 1, 1,
0.6458627, -1.750245, 1.869935, 0.3490196, 0, 1, 1,
0.6468025, 0.6081958, 0.1317829, 0.3568628, 0, 1, 1,
0.6481046, -0.4765106, 3.039985, 0.3607843, 0, 1, 1,
0.6515208, -0.9816952, 1.674843, 0.3686275, 0, 1, 1,
0.6518897, 0.809687, 0.7883359, 0.372549, 0, 1, 1,
0.6528623, 0.6302792, 1.365971, 0.3803922, 0, 1, 1,
0.65522, 0.3686191, 1.422166, 0.3843137, 0, 1, 1,
0.655734, -0.5563916, 2.858233, 0.3921569, 0, 1, 1,
0.6559452, 0.4618106, 1.787943, 0.3960784, 0, 1, 1,
0.6595675, 1.373454, 0.14093, 0.4039216, 0, 1, 1,
0.6669081, -0.764324, 2.129957, 0.4117647, 0, 1, 1,
0.6692883, -0.4126624, 3.26308, 0.4156863, 0, 1, 1,
0.6692892, -1.675363, 3.413653, 0.4235294, 0, 1, 1,
0.6694517, 0.7118621, 0.6895711, 0.427451, 0, 1, 1,
0.6733263, 2.103333, -0.3259487, 0.4352941, 0, 1, 1,
0.6756959, -0.2326115, 1.457635, 0.4392157, 0, 1, 1,
0.6759716, -0.657579, 3.249277, 0.4470588, 0, 1, 1,
0.6797979, -0.1719983, 3.468289, 0.4509804, 0, 1, 1,
0.6799025, 0.1552255, 0.749811, 0.4588235, 0, 1, 1,
0.6808788, -0.3508202, 3.283949, 0.4627451, 0, 1, 1,
0.6863816, 3.148512, 0.2055082, 0.4705882, 0, 1, 1,
0.6903271, 0.2417939, 1.495607, 0.4745098, 0, 1, 1,
0.6956567, 0.4919839, 2.062937, 0.4823529, 0, 1, 1,
0.6983607, 1.117052, 1.012633, 0.4862745, 0, 1, 1,
0.6998056, -0.3695655, 0.8150007, 0.4941176, 0, 1, 1,
0.7001022, -0.109018, 0.9596189, 0.5019608, 0, 1, 1,
0.7009712, -0.1758165, 1.722624, 0.5058824, 0, 1, 1,
0.7012389, -1.136806, 3.143467, 0.5137255, 0, 1, 1,
0.7014344, 1.571773, -0.3854596, 0.5176471, 0, 1, 1,
0.7018034, -0.9297275, 4.795261, 0.5254902, 0, 1, 1,
0.7041637, 0.2137561, 1.11669, 0.5294118, 0, 1, 1,
0.708989, 0.1840618, 0.549764, 0.5372549, 0, 1, 1,
0.711109, 0.02832153, 1.034594, 0.5411765, 0, 1, 1,
0.7142801, 1.954248, 1.559161, 0.5490196, 0, 1, 1,
0.7191845, -0.4977823, 1.590046, 0.5529412, 0, 1, 1,
0.7228336, 1.018451, 2.209734, 0.5607843, 0, 1, 1,
0.7262478, -0.04458085, 0.4238556, 0.5647059, 0, 1, 1,
0.726308, -0.6146599, 3.033362, 0.572549, 0, 1, 1,
0.7272034, -1.078511, 3.410137, 0.5764706, 0, 1, 1,
0.7313026, 1.347833, 0.8007225, 0.5843138, 0, 1, 1,
0.7359728, 1.259735, 1.093093, 0.5882353, 0, 1, 1,
0.7378643, -0.410942, 1.314509, 0.5960785, 0, 1, 1,
0.7379078, 1.06341, -0.7607519, 0.6039216, 0, 1, 1,
0.7423502, 0.4837415, 1.076023, 0.6078432, 0, 1, 1,
0.7429962, -0.01930318, 2.922336, 0.6156863, 0, 1, 1,
0.7463405, -0.4029164, 2.371647, 0.6196079, 0, 1, 1,
0.7464176, 0.05064382, 1.414523, 0.627451, 0, 1, 1,
0.7593671, 0.01189958, -1.380145, 0.6313726, 0, 1, 1,
0.7595006, -0.6350387, 2.292757, 0.6392157, 0, 1, 1,
0.7654231, -0.34381, 2.667575, 0.6431373, 0, 1, 1,
0.7722331, -1.586811, 2.046811, 0.6509804, 0, 1, 1,
0.7807335, -0.9187517, 0.5611721, 0.654902, 0, 1, 1,
0.7869184, 1.503841, 0.2192467, 0.6627451, 0, 1, 1,
0.7896065, 0.9835449, 0.5300168, 0.6666667, 0, 1, 1,
0.8053082, 0.1970443, 1.267877, 0.6745098, 0, 1, 1,
0.8087355, 0.808648, 1.307011, 0.6784314, 0, 1, 1,
0.8090153, -0.3334013, 0.7282279, 0.6862745, 0, 1, 1,
0.8109605, -0.5045482, 1.370322, 0.6901961, 0, 1, 1,
0.8143511, -0.4337186, 3.09514, 0.6980392, 0, 1, 1,
0.8146416, 0.04399371, 1.187674, 0.7058824, 0, 1, 1,
0.8180339, 2.121238, 3.487155, 0.7098039, 0, 1, 1,
0.823153, -0.4443077, 1.354947, 0.7176471, 0, 1, 1,
0.8294243, -0.720212, 2.732117, 0.7215686, 0, 1, 1,
0.8298127, -0.01628741, 1.229936, 0.7294118, 0, 1, 1,
0.830429, -1.175419, 2.286359, 0.7333333, 0, 1, 1,
0.8317996, 0.9338456, 0.2100818, 0.7411765, 0, 1, 1,
0.8331612, -0.2996439, 1.942768, 0.7450981, 0, 1, 1,
0.8336368, -1.111141, 2.706011, 0.7529412, 0, 1, 1,
0.8453774, -0.147127, 3.114455, 0.7568628, 0, 1, 1,
0.8486351, 0.2223797, 2.002748, 0.7647059, 0, 1, 1,
0.8575508, 0.1688965, 0.5302156, 0.7686275, 0, 1, 1,
0.8577707, 0.09033337, 0.793693, 0.7764706, 0, 1, 1,
0.858636, 1.328376, 1.034621, 0.7803922, 0, 1, 1,
0.8604401, 0.7557396, 0.8636216, 0.7882353, 0, 1, 1,
0.8660206, 2.303611, 0.02642846, 0.7921569, 0, 1, 1,
0.8676583, 0.7662036, 2.192393, 0.8, 0, 1, 1,
0.8761226, -0.8813149, 1.137477, 0.8078431, 0, 1, 1,
0.8791503, -0.5852295, 2.024736, 0.8117647, 0, 1, 1,
0.8807528, -1.422214, 2.45588, 0.8196079, 0, 1, 1,
0.8831118, 1.36553, 0.5555915, 0.8235294, 0, 1, 1,
0.883774, 1.209052, 0.5802327, 0.8313726, 0, 1, 1,
0.8861324, 1.342001, 1.225138, 0.8352941, 0, 1, 1,
0.8881676, -1.870089, 4.551698, 0.8431373, 0, 1, 1,
0.8925782, -0.09298745, 0.3183376, 0.8470588, 0, 1, 1,
0.8951754, -2.141123, 1.194656, 0.854902, 0, 1, 1,
0.8995632, 0.8323745, -0.4654889, 0.8588235, 0, 1, 1,
0.9037036, 2.015093, 0.4295079, 0.8666667, 0, 1, 1,
0.9056128, -0.4624741, 1.31903, 0.8705882, 0, 1, 1,
0.9086397, -0.09595689, -0.5699086, 0.8784314, 0, 1, 1,
0.9219826, 1.063302, -0.2598372, 0.8823529, 0, 1, 1,
0.9233352, -0.3683573, 2.697577, 0.8901961, 0, 1, 1,
0.924208, 1.256647, 1.723781, 0.8941177, 0, 1, 1,
0.9345253, -0.5515749, 0.2832838, 0.9019608, 0, 1, 1,
0.9383597, -0.3008979, 1.516066, 0.9098039, 0, 1, 1,
0.938457, -0.2521022, 1.184203, 0.9137255, 0, 1, 1,
0.9432902, 1.129171, 1.790499, 0.9215686, 0, 1, 1,
0.9575199, 0.9568685, 2.446184, 0.9254902, 0, 1, 1,
0.9580535, -0.281238, 0.3311052, 0.9333333, 0, 1, 1,
0.9600748, 0.509074, 0.4286699, 0.9372549, 0, 1, 1,
0.9639044, 0.6394483, 1.431101, 0.945098, 0, 1, 1,
0.9732293, -0.4188073, 2.588245, 0.9490196, 0, 1, 1,
0.983532, -0.8889536, 1.196149, 0.9568627, 0, 1, 1,
0.9847194, 0.8123718, -1.453304, 0.9607843, 0, 1, 1,
0.9857304, -1.890625, 3.583984, 0.9686275, 0, 1, 1,
0.9858869, 1.798561, 0.6958011, 0.972549, 0, 1, 1,
0.9926702, -0.1499173, 2.615803, 0.9803922, 0, 1, 1,
0.9976075, 0.005728578, 2.93028, 0.9843137, 0, 1, 1,
1.004674, 2.159964, 0.7881067, 0.9921569, 0, 1, 1,
1.007565, 0.2371915, 0.5971158, 0.9960784, 0, 1, 1,
1.007727, -0.9530587, 3.284082, 1, 0, 0.9960784, 1,
1.008777, -0.3062096, 2.789032, 1, 0, 0.9882353, 1,
1.011706, -1.062167, 3.361943, 1, 0, 0.9843137, 1,
1.01668, -0.4101616, 2.888126, 1, 0, 0.9764706, 1,
1.018663, 0.4125011, -0.6834361, 1, 0, 0.972549, 1,
1.031373, -0.3015342, 3.036493, 1, 0, 0.9647059, 1,
1.033595, 0.196218, 1.242746, 1, 0, 0.9607843, 1,
1.046107, -0.4366128, 3.050359, 1, 0, 0.9529412, 1,
1.054327, -0.05020082, 0.7705479, 1, 0, 0.9490196, 1,
1.060526, -0.5366687, 2.543066, 1, 0, 0.9411765, 1,
1.060751, 0.005799697, 1.963272, 1, 0, 0.9372549, 1,
1.061112, 1.283348, 0.5791726, 1, 0, 0.9294118, 1,
1.062221, -0.3210926, 2.228904, 1, 0, 0.9254902, 1,
1.072356, 0.4133377, 0.3665613, 1, 0, 0.9176471, 1,
1.073903, 0.9730269, -0.7494315, 1, 0, 0.9137255, 1,
1.074025, 0.7795649, 0.852617, 1, 0, 0.9058824, 1,
1.075562, 0.5075073, 0.03612583, 1, 0, 0.9019608, 1,
1.079748, 0.7886298, 0.6428741, 1, 0, 0.8941177, 1,
1.081611, -1.717647, 2.892206, 1, 0, 0.8862745, 1,
1.082278, 0.8277425, 2.325253, 1, 0, 0.8823529, 1,
1.092121, -0.163853, 0.8517572, 1, 0, 0.8745098, 1,
1.092829, 0.3552022, 0.1558505, 1, 0, 0.8705882, 1,
1.099382, -0.7652312, 3.221107, 1, 0, 0.8627451, 1,
1.102763, 0.8322517, 1.250901, 1, 0, 0.8588235, 1,
1.107952, 2.360441, 0.997591, 1, 0, 0.8509804, 1,
1.110288, 0.4583656, 0.5441085, 1, 0, 0.8470588, 1,
1.114348, -0.4458439, 0.9627004, 1, 0, 0.8392157, 1,
1.116655, -0.20191, 3.210181, 1, 0, 0.8352941, 1,
1.121395, 0.3657512, 0.4533339, 1, 0, 0.827451, 1,
1.131397, -1.066053, 0.6982687, 1, 0, 0.8235294, 1,
1.135127, -0.7821835, 3.689516, 1, 0, 0.8156863, 1,
1.135839, 0.8940181, 2.469946, 1, 0, 0.8117647, 1,
1.13781, -0.03726912, 0.5686985, 1, 0, 0.8039216, 1,
1.15445, -1.188772, 1.063023, 1, 0, 0.7960784, 1,
1.163093, 1.135925, 0.6745707, 1, 0, 0.7921569, 1,
1.166006, -1.776736, 2.854798, 1, 0, 0.7843137, 1,
1.169984, 1.174414, 0.7969711, 1, 0, 0.7803922, 1,
1.172962, -1.218175, 0.9906026, 1, 0, 0.772549, 1,
1.181187, 1.433178, 1.44017, 1, 0, 0.7686275, 1,
1.183434, 0.1607631, 2.029417, 1, 0, 0.7607843, 1,
1.194704, -1.107548, 3.163314, 1, 0, 0.7568628, 1,
1.199726, -0.6027393, 3.446423, 1, 0, 0.7490196, 1,
1.200637, -0.7879696, 2.895685, 1, 0, 0.7450981, 1,
1.203516, -0.07665449, 3.053957, 1, 0, 0.7372549, 1,
1.21326, -0.5219448, 1.68794, 1, 0, 0.7333333, 1,
1.223715, -0.4867394, 2.907979, 1, 0, 0.7254902, 1,
1.224738, -1.595249, 2.901583, 1, 0, 0.7215686, 1,
1.22916, -0.06454373, 0.6944052, 1, 0, 0.7137255, 1,
1.235229, 0.8563177, 1.14777, 1, 0, 0.7098039, 1,
1.235485, -0.8422327, 2.488058, 1, 0, 0.7019608, 1,
1.240405, -1.08635, 2.735429, 1, 0, 0.6941177, 1,
1.245684, -0.1297135, 0.4527147, 1, 0, 0.6901961, 1,
1.24896, 1.467412, -0.1863296, 1, 0, 0.682353, 1,
1.253881, 0.4747689, 1.231677, 1, 0, 0.6784314, 1,
1.256557, 1.088326, 0.4617802, 1, 0, 0.6705883, 1,
1.257966, 0.2100919, 1.271382, 1, 0, 0.6666667, 1,
1.259411, 1.168695, 2.70452, 1, 0, 0.6588235, 1,
1.265909, 0.4932973, 3.473603, 1, 0, 0.654902, 1,
1.268571, -0.7827064, 2.108976, 1, 0, 0.6470588, 1,
1.271888, -2.5281, 1.556248, 1, 0, 0.6431373, 1,
1.275995, 1.046551, -1.128165, 1, 0, 0.6352941, 1,
1.285579, -0.511549, 2.809897, 1, 0, 0.6313726, 1,
1.293086, 0.2289186, 1.213716, 1, 0, 0.6235294, 1,
1.295007, 0.769323, 0.8313395, 1, 0, 0.6196079, 1,
1.295297, 1.856791, -1.247637, 1, 0, 0.6117647, 1,
1.295908, 0.843587, -0.4333301, 1, 0, 0.6078432, 1,
1.301389, -1.217112, 1.213606, 1, 0, 0.6, 1,
1.315475, -0.6430089, 2.38264, 1, 0, 0.5921569, 1,
1.318583, 0.2980288, 3.034878, 1, 0, 0.5882353, 1,
1.320091, -0.1471947, 2.302159, 1, 0, 0.5803922, 1,
1.32035, -0.02934418, 2.432959, 1, 0, 0.5764706, 1,
1.326789, 1.947136, 0.6825982, 1, 0, 0.5686275, 1,
1.332419, 1.405171, 1.662103, 1, 0, 0.5647059, 1,
1.349805, -0.6679813, 1.668038, 1, 0, 0.5568628, 1,
1.353873, -1.632223, 3.274035, 1, 0, 0.5529412, 1,
1.368311, -0.7100502, 3.71933, 1, 0, 0.5450981, 1,
1.373815, 0.2713052, 1.051265, 1, 0, 0.5411765, 1,
1.37438, -0.1760972, 1.513028, 1, 0, 0.5333334, 1,
1.386061, -0.3395184, 3.395139, 1, 0, 0.5294118, 1,
1.392421, -1.443473, 3.36355, 1, 0, 0.5215687, 1,
1.395907, 1.607647, 1.726963, 1, 0, 0.5176471, 1,
1.401883, -1.332785, 1.003015, 1, 0, 0.509804, 1,
1.424976, 0.391926, 2.339546, 1, 0, 0.5058824, 1,
1.425699, -0.3604057, 1.646187, 1, 0, 0.4980392, 1,
1.429949, -0.8571441, 3.002297, 1, 0, 0.4901961, 1,
1.438225, -0.5264322, 2.816598, 1, 0, 0.4862745, 1,
1.446014, -0.9052313, 1.643755, 1, 0, 0.4784314, 1,
1.446358, -0.6698993, 2.622598, 1, 0, 0.4745098, 1,
1.451049, 0.5515499, 0.781987, 1, 0, 0.4666667, 1,
1.458237, 0.9558953, 0.3185766, 1, 0, 0.4627451, 1,
1.464788, 0.8922057, 1.746662, 1, 0, 0.454902, 1,
1.475481, 0.1560161, 1.390044, 1, 0, 0.4509804, 1,
1.482989, 0.7871979, 1.840485, 1, 0, 0.4431373, 1,
1.488587, 0.6268503, 2.905854, 1, 0, 0.4392157, 1,
1.495267, 0.163795, 2.101439, 1, 0, 0.4313726, 1,
1.505178, 1.579568, 0.3722775, 1, 0, 0.427451, 1,
1.505424, -0.03734325, -0.02915991, 1, 0, 0.4196078, 1,
1.509938, 0.004175402, 0.6726257, 1, 0, 0.4156863, 1,
1.51675, 0.4719085, 0.6075501, 1, 0, 0.4078431, 1,
1.526844, 0.9776993, 1.040318, 1, 0, 0.4039216, 1,
1.532346, -1.36167, 1.724262, 1, 0, 0.3960784, 1,
1.541523, 0.07797582, 2.056981, 1, 0, 0.3882353, 1,
1.541855, 0.2279631, 0.2935372, 1, 0, 0.3843137, 1,
1.552558, -0.9066491, 1.511268, 1, 0, 0.3764706, 1,
1.557001, 0.5551701, -0.1692976, 1, 0, 0.372549, 1,
1.562618, 1.098211, 2.376836, 1, 0, 0.3647059, 1,
1.566087, 0.5344944, 0.6782575, 1, 0, 0.3607843, 1,
1.568209, 0.05993722, 1.650461, 1, 0, 0.3529412, 1,
1.57249, -0.4464346, 0.5001107, 1, 0, 0.3490196, 1,
1.577058, -0.3487069, 2.805643, 1, 0, 0.3411765, 1,
1.610578, -0.736366, -0.04576664, 1, 0, 0.3372549, 1,
1.611315, 0.5152842, 1.00413, 1, 0, 0.3294118, 1,
1.618955, 0.6000248, 2.391844, 1, 0, 0.3254902, 1,
1.656855, -1.503931, 2.23894, 1, 0, 0.3176471, 1,
1.666305, 0.9794261, 1.552341, 1, 0, 0.3137255, 1,
1.674797, 0.4559008, 1.722408, 1, 0, 0.3058824, 1,
1.678749, -0.3160866, 0.8563574, 1, 0, 0.2980392, 1,
1.678825, -0.1228924, 3.132771, 1, 0, 0.2941177, 1,
1.681513, -0.3037724, 0.159237, 1, 0, 0.2862745, 1,
1.681899, -1.4197, 1.781337, 1, 0, 0.282353, 1,
1.693995, -0.02287845, 0.8530352, 1, 0, 0.2745098, 1,
1.702836, 0.1890025, 1.912563, 1, 0, 0.2705882, 1,
1.714978, 0.426247, 1.715494, 1, 0, 0.2627451, 1,
1.721752, 1.618747, 0.02406211, 1, 0, 0.2588235, 1,
1.736911, -0.3899788, 1.751669, 1, 0, 0.2509804, 1,
1.751906, -0.2634885, 2.041685, 1, 0, 0.2470588, 1,
1.758556, 0.6580973, 0.6395136, 1, 0, 0.2392157, 1,
1.782504, 1.111009, 1.618022, 1, 0, 0.2352941, 1,
1.782731, 1.002638, -0.6285932, 1, 0, 0.227451, 1,
1.809813, -0.5594253, -0.09404629, 1, 0, 0.2235294, 1,
1.813751, 0.06313987, 3.009259, 1, 0, 0.2156863, 1,
1.816234, -0.1160498, 0.2780984, 1, 0, 0.2117647, 1,
1.825408, 0.8137457, 2.047369, 1, 0, 0.2039216, 1,
1.837508, -0.6266329, 3.610897, 1, 0, 0.1960784, 1,
1.838692, 0.2039307, 0.7376513, 1, 0, 0.1921569, 1,
1.84739, 0.9948043, -0.3303423, 1, 0, 0.1843137, 1,
1.851733, -0.03442117, 2.808318, 1, 0, 0.1803922, 1,
1.899145, -1.047669, 1.504337, 1, 0, 0.172549, 1,
1.938581, 1.368217, 1.248803, 1, 0, 0.1686275, 1,
1.941484, -1.436126, 1.203183, 1, 0, 0.1607843, 1,
1.94772, 0.4489531, 1.990763, 1, 0, 0.1568628, 1,
1.963549, 1.617996, 1.659932, 1, 0, 0.1490196, 1,
1.996257, 1.35224, -0.1688919, 1, 0, 0.145098, 1,
2.00297, -0.4682884, -1.059255, 1, 0, 0.1372549, 1,
2.035073, -0.03702005, 0.8546942, 1, 0, 0.1333333, 1,
2.074506, 0.3482526, 1.729285, 1, 0, 0.1254902, 1,
2.12607, -1.482259, 1.227286, 1, 0, 0.1215686, 1,
2.147328, 1.328785, 1.310708, 1, 0, 0.1137255, 1,
2.153635, -1.167683, 2.970067, 1, 0, 0.1098039, 1,
2.211825, -0.6532139, 1.573007, 1, 0, 0.1019608, 1,
2.222436, 0.3022729, 1.469462, 1, 0, 0.09411765, 1,
2.247071, -0.09651124, 1.943815, 1, 0, 0.09019608, 1,
2.259043, -1.204514, 1.972957, 1, 0, 0.08235294, 1,
2.304767, -1.266926, 2.462613, 1, 0, 0.07843138, 1,
2.328305, -0.8745061, 3.287104, 1, 0, 0.07058824, 1,
2.358682, 0.06009969, 1.584423, 1, 0, 0.06666667, 1,
2.360855, 0.6053564, 1.176092, 1, 0, 0.05882353, 1,
2.38022, -1.481739, 1.193101, 1, 0, 0.05490196, 1,
2.402324, -0.3175189, 1.481925, 1, 0, 0.04705882, 1,
2.427536, 1.259969, 1.308016, 1, 0, 0.04313726, 1,
2.514534, -0.1641901, 0.5419996, 1, 0, 0.03529412, 1,
2.520234, 0.3746118, 2.087174, 1, 0, 0.03137255, 1,
2.568054, -0.6802016, 2.197678, 1, 0, 0.02352941, 1,
2.599879, 0.02233671, 1.110976, 1, 0, 0.01960784, 1,
2.696317, 0.4140722, -0.3158672, 1, 0, 0.01176471, 1,
2.849928, -1.161475, 1.003763, 1, 0, 0.007843138, 1
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
-0.05449486, -4.912238, -6.932713, 0, -0.5, 0.5, 0.5,
-0.05449486, -4.912238, -6.932713, 1, -0.5, 0.5, 0.5,
-0.05449486, -4.912238, -6.932713, 1, 1.5, 0.5, 0.5,
-0.05449486, -4.912238, -6.932713, 0, 1.5, 0.5, 0.5
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
-3.943518, 0.06160665, -6.932713, 0, -0.5, 0.5, 0.5,
-3.943518, 0.06160665, -6.932713, 1, -0.5, 0.5, 0.5,
-3.943518, 0.06160665, -6.932713, 1, 1.5, 0.5, 0.5,
-3.943518, 0.06160665, -6.932713, 0, 1.5, 0.5, 0.5
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
-3.943518, -4.912238, -0.01083422, 0, -0.5, 0.5, 0.5,
-3.943518, -4.912238, -0.01083422, 1, -0.5, 0.5, 0.5,
-3.943518, -4.912238, -0.01083422, 1, 1.5, 0.5, 0.5,
-3.943518, -4.912238, -0.01083422, 0, 1.5, 0.5, 0.5
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
-2, -3.764428, -5.335356,
2, -3.764428, -5.335356,
-2, -3.764428, -5.335356,
-2, -3.955729, -5.601583,
-1, -3.764428, -5.335356,
-1, -3.955729, -5.601583,
0, -3.764428, -5.335356,
0, -3.955729, -5.601583,
1, -3.764428, -5.335356,
1, -3.955729, -5.601583,
2, -3.764428, -5.335356,
2, -3.955729, -5.601583
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
-2, -4.338333, -6.134035, 0, -0.5, 0.5, 0.5,
-2, -4.338333, -6.134035, 1, -0.5, 0.5, 0.5,
-2, -4.338333, -6.134035, 1, 1.5, 0.5, 0.5,
-2, -4.338333, -6.134035, 0, 1.5, 0.5, 0.5,
-1, -4.338333, -6.134035, 0, -0.5, 0.5, 0.5,
-1, -4.338333, -6.134035, 1, -0.5, 0.5, 0.5,
-1, -4.338333, -6.134035, 1, 1.5, 0.5, 0.5,
-1, -4.338333, -6.134035, 0, 1.5, 0.5, 0.5,
0, -4.338333, -6.134035, 0, -0.5, 0.5, 0.5,
0, -4.338333, -6.134035, 1, -0.5, 0.5, 0.5,
0, -4.338333, -6.134035, 1, 1.5, 0.5, 0.5,
0, -4.338333, -6.134035, 0, 1.5, 0.5, 0.5,
1, -4.338333, -6.134035, 0, -0.5, 0.5, 0.5,
1, -4.338333, -6.134035, 1, -0.5, 0.5, 0.5,
1, -4.338333, -6.134035, 1, 1.5, 0.5, 0.5,
1, -4.338333, -6.134035, 0, 1.5, 0.5, 0.5,
2, -4.338333, -6.134035, 0, -0.5, 0.5, 0.5,
2, -4.338333, -6.134035, 1, -0.5, 0.5, 0.5,
2, -4.338333, -6.134035, 1, 1.5, 0.5, 0.5,
2, -4.338333, -6.134035, 0, 1.5, 0.5, 0.5
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
-3.046051, -2, -5.335356,
-3.046051, 2, -5.335356,
-3.046051, -2, -5.335356,
-3.195629, -2, -5.601583,
-3.046051, 0, -5.335356,
-3.195629, 0, -5.601583,
-3.046051, 2, -5.335356,
-3.195629, 2, -5.601583
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
"0",
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
-3.494784, -2, -6.134035, 0, -0.5, 0.5, 0.5,
-3.494784, -2, -6.134035, 1, -0.5, 0.5, 0.5,
-3.494784, -2, -6.134035, 1, 1.5, 0.5, 0.5,
-3.494784, -2, -6.134035, 0, 1.5, 0.5, 0.5,
-3.494784, 0, -6.134035, 0, -0.5, 0.5, 0.5,
-3.494784, 0, -6.134035, 1, -0.5, 0.5, 0.5,
-3.494784, 0, -6.134035, 1, 1.5, 0.5, 0.5,
-3.494784, 0, -6.134035, 0, 1.5, 0.5, 0.5,
-3.494784, 2, -6.134035, 0, -0.5, 0.5, 0.5,
-3.494784, 2, -6.134035, 1, -0.5, 0.5, 0.5,
-3.494784, 2, -6.134035, 1, 1.5, 0.5, 0.5,
-3.494784, 2, -6.134035, 0, 1.5, 0.5, 0.5
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
-3.046051, -3.764428, -4,
-3.046051, -3.764428, 4,
-3.046051, -3.764428, -4,
-3.195629, -3.955729, -4,
-3.046051, -3.764428, -2,
-3.195629, -3.955729, -2,
-3.046051, -3.764428, 0,
-3.195629, -3.955729, 0,
-3.046051, -3.764428, 2,
-3.195629, -3.955729, 2,
-3.046051, -3.764428, 4,
-3.195629, -3.955729, 4
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
-3.494784, -4.338333, -4, 0, -0.5, 0.5, 0.5,
-3.494784, -4.338333, -4, 1, -0.5, 0.5, 0.5,
-3.494784, -4.338333, -4, 1, 1.5, 0.5, 0.5,
-3.494784, -4.338333, -4, 0, 1.5, 0.5, 0.5,
-3.494784, -4.338333, -2, 0, -0.5, 0.5, 0.5,
-3.494784, -4.338333, -2, 1, -0.5, 0.5, 0.5,
-3.494784, -4.338333, -2, 1, 1.5, 0.5, 0.5,
-3.494784, -4.338333, -2, 0, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 0, 0, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 0, 1, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 0, 1, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 0, 0, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 2, 0, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 2, 1, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 2, 1, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 2, 0, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 4, 0, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 4, 1, -0.5, 0.5, 0.5,
-3.494784, -4.338333, 4, 1, 1.5, 0.5, 0.5,
-3.494784, -4.338333, 4, 0, 1.5, 0.5, 0.5
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
-3.046051, -3.764428, -5.335356,
-3.046051, 3.887641, -5.335356,
-3.046051, -3.764428, 5.313688,
-3.046051, 3.887641, 5.313688,
-3.046051, -3.764428, -5.335356,
-3.046051, -3.764428, 5.313688,
-3.046051, 3.887641, -5.335356,
-3.046051, 3.887641, 5.313688,
-3.046051, -3.764428, -5.335356,
2.937061, -3.764428, -5.335356,
-3.046051, -3.764428, 5.313688,
2.937061, -3.764428, 5.313688,
-3.046051, 3.887641, -5.335356,
2.937061, 3.887641, -5.335356,
-3.046051, 3.887641, 5.313688,
2.937061, 3.887641, 5.313688,
2.937061, -3.764428, -5.335356,
2.937061, 3.887641, -5.335356,
2.937061, -3.764428, 5.313688,
2.937061, 3.887641, 5.313688,
2.937061, -3.764428, -5.335356,
2.937061, -3.764428, 5.313688,
2.937061, 3.887641, -5.335356,
2.937061, 3.887641, 5.313688
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
var radius = 7.696621;
var distance = 34.24313;
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
mvMatrix.translate( 0.05449486, -0.06160665, 0.01083422 );
mvMatrix.scale( 1.390871, 1.087515, 0.7814539 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.24313);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
acetic_acid-2-heptad<-read.table("acetic_acid-2-heptad.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acetic_acid-2-heptad$V2
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
y<-acetic_acid-2-heptad$V3
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
```

```r
z<-acetic_acid-2-heptad$V4
```

```
## Error in eval(expr, envir, enclos): object 'acetic_acid' not found
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
-2.958918, 0.2967956, -2.268924, 0, 0, 1, 1, 1,
-2.838554, 1.110265, 0.09596006, 1, 0, 0, 1, 1,
-2.799183, 1.202094, -1.542553, 1, 0, 0, 1, 1,
-2.640487, -1.536018, -2.459304, 1, 0, 0, 1, 1,
-2.597002, -0.1500908, -0.3784279, 1, 0, 0, 1, 1,
-2.585011, 0.7874181, 0.1555947, 1, 0, 0, 1, 1,
-2.544318, 1.079657, -0.3942524, 0, 0, 0, 1, 1,
-2.450711, 1.381494, -0.3166707, 0, 0, 0, 1, 1,
-2.276969, 0.4933694, -1.196731, 0, 0, 0, 1, 1,
-2.267706, 0.1033659, -2.323485, 0, 0, 0, 1, 1,
-2.258827, 0.5875925, -1.197951, 0, 0, 0, 1, 1,
-2.227335, 1.100961, -3.107054, 0, 0, 0, 1, 1,
-2.211518, 1.26063, 0.01500467, 0, 0, 0, 1, 1,
-2.178931, -0.9941252, -2.454513, 1, 1, 1, 1, 1,
-2.090871, -0.06303496, -2.105895, 1, 1, 1, 1, 1,
-2.085128, 0.2957621, -1.338119, 1, 1, 1, 1, 1,
-2.063159, 0.6650914, -1.152619, 1, 1, 1, 1, 1,
-2.015643, 0.3704304, -2.233449, 1, 1, 1, 1, 1,
-1.996121, 0.1224847, -0.6423478, 1, 1, 1, 1, 1,
-1.98164, 0.4132931, -2.077178, 1, 1, 1, 1, 1,
-1.97041, -0.1681394, -0.6971971, 1, 1, 1, 1, 1,
-1.967534, 0.5042049, -1.41864, 1, 1, 1, 1, 1,
-1.965083, -0.7511433, -2.55477, 1, 1, 1, 1, 1,
-1.939686, 0.19543, -0.3023896, 1, 1, 1, 1, 1,
-1.918117, -0.257257, -1.345376, 1, 1, 1, 1, 1,
-1.878485, 1.09056, -0.05788456, 1, 1, 1, 1, 1,
-1.860967, 1.40507, -0.353094, 1, 1, 1, 1, 1,
-1.845172, 2.029598, -2.331652, 1, 1, 1, 1, 1,
-1.839205, -0.09981073, -2.357983, 0, 0, 1, 1, 1,
-1.838331, 0.6821603, -1.442177, 1, 0, 0, 1, 1,
-1.820748, 0.05708951, -0.9613001, 1, 0, 0, 1, 1,
-1.820684, 0.1554384, -1.453841, 1, 0, 0, 1, 1,
-1.816063, 0.4610372, -2.80658, 1, 0, 0, 1, 1,
-1.773198, -0.3073102, -2.616318, 1, 0, 0, 1, 1,
-1.754362, -0.9118034, -2.675957, 0, 0, 0, 1, 1,
-1.715612, 2.234599, 1.104095, 0, 0, 0, 1, 1,
-1.712842, 0.8306128, -1.327356, 0, 0, 0, 1, 1,
-1.706477, 0.5033494, 0.7280571, 0, 0, 0, 1, 1,
-1.700467, 0.8083208, -0.01695667, 0, 0, 0, 1, 1,
-1.680415, -0.3944464, -1.50978, 0, 0, 0, 1, 1,
-1.677885, -0.9907802, -0.1361792, 0, 0, 0, 1, 1,
-1.670961, -2.823581, -2.82996, 1, 1, 1, 1, 1,
-1.638041, 0.04265909, -0.2164935, 1, 1, 1, 1, 1,
-1.610855, -0.7342984, -1.946838, 1, 1, 1, 1, 1,
-1.606822, -0.1280176, -0.6139357, 1, 1, 1, 1, 1,
-1.59613, 0.04390166, -1.134282, 1, 1, 1, 1, 1,
-1.57768, 0.2685579, -0.761789, 1, 1, 1, 1, 1,
-1.5762, -0.8387838, -2.110727, 1, 1, 1, 1, 1,
-1.560757, 0.5832158, 2.163246, 1, 1, 1, 1, 1,
-1.539022, 0.7404346, -1.008919, 1, 1, 1, 1, 1,
-1.524132, -1.191831, -2.748115, 1, 1, 1, 1, 1,
-1.523581, -0.4852532, -1.798497, 1, 1, 1, 1, 1,
-1.522731, -0.7220237, -0.1172177, 1, 1, 1, 1, 1,
-1.515952, 1.054466, -1.116545, 1, 1, 1, 1, 1,
-1.515613, 0.2894572, -1.330455, 1, 1, 1, 1, 1,
-1.508565, -1.408624, -3.411427, 1, 1, 1, 1, 1,
-1.505174, 0.5860047, -0.828515, 0, 0, 1, 1, 1,
-1.499168, 0.07076577, -1.790038, 1, 0, 0, 1, 1,
-1.485044, -1.149922, -2.127656, 1, 0, 0, 1, 1,
-1.478812, -1.823116, -3.35173, 1, 0, 0, 1, 1,
-1.475033, -1.458078, -1.725985, 1, 0, 0, 1, 1,
-1.474771, -1.432055, -2.280604, 1, 0, 0, 1, 1,
-1.464446, -0.5019004, -1.529303, 0, 0, 0, 1, 1,
-1.447637, 0.7151486, -2.497728, 0, 0, 0, 1, 1,
-1.447459, 1.386544, -0.3790332, 0, 0, 0, 1, 1,
-1.431837, -0.02010191, -0.3662533, 0, 0, 0, 1, 1,
-1.42126, -0.004477038, -2.129141, 0, 0, 0, 1, 1,
-1.420274, -1.322317, -2.912124, 0, 0, 0, 1, 1,
-1.419812, -2.680537, -2.607437, 0, 0, 0, 1, 1,
-1.406316, 0.6111175, -1.37617, 1, 1, 1, 1, 1,
-1.406049, -0.08835219, -2.384472, 1, 1, 1, 1, 1,
-1.376869, -1.952185, -4.018081, 1, 1, 1, 1, 1,
-1.364781, 0.7475314, -1.859045, 1, 1, 1, 1, 1,
-1.36389, -1.129314, -2.399079, 1, 1, 1, 1, 1,
-1.355787, 0.163445, 0.5431403, 1, 1, 1, 1, 1,
-1.352016, -0.04282581, -0.8716334, 1, 1, 1, 1, 1,
-1.332206, 1.058107, -1.041199, 1, 1, 1, 1, 1,
-1.315828, 0.07538343, -2.235096, 1, 1, 1, 1, 1,
-1.308179, 1.276946, -2.777785, 1, 1, 1, 1, 1,
-1.300295, -0.8593104, -2.070899, 1, 1, 1, 1, 1,
-1.284124, -0.5461754, -1.797109, 1, 1, 1, 1, 1,
-1.280933, -0.137136, -1.922137, 1, 1, 1, 1, 1,
-1.270882, -0.8976389, -2.761946, 1, 1, 1, 1, 1,
-1.261025, 0.09494095, -1.522603, 1, 1, 1, 1, 1,
-1.250063, 0.7558796, -1.853006, 0, 0, 1, 1, 1,
-1.247887, 0.1667603, -0.08716825, 1, 0, 0, 1, 1,
-1.242797, -1.729042, -2.903934, 1, 0, 0, 1, 1,
-1.235927, -1.130445, -0.154537, 1, 0, 0, 1, 1,
-1.232049, -0.8549792, -2.417846, 1, 0, 0, 1, 1,
-1.228316, 1.489888, -1.109291, 1, 0, 0, 1, 1,
-1.217618, 0.1794952, -1.732844, 0, 0, 0, 1, 1,
-1.214461, -0.3533427, -2.011111, 0, 0, 0, 1, 1,
-1.212948, -0.6708719, -1.410027, 0, 0, 0, 1, 1,
-1.212942, -1.816545, -2.704533, 0, 0, 0, 1, 1,
-1.211672, 0.2913958, -1.000477, 0, 0, 0, 1, 1,
-1.210798, 0.05661022, -2.55356, 0, 0, 0, 1, 1,
-1.20926, 0.01103849, -0.9524982, 0, 0, 0, 1, 1,
-1.195604, 0.4888155, -0.5296416, 1, 1, 1, 1, 1,
-1.191681, -0.1281837, -1.835243, 1, 1, 1, 1, 1,
-1.190507, 0.7416098, -0.5274734, 1, 1, 1, 1, 1,
-1.190031, -0.3357065, -1.132916, 1, 1, 1, 1, 1,
-1.18904, -1.464282, -1.093277, 1, 1, 1, 1, 1,
-1.18593, 0.405237, -3.269769, 1, 1, 1, 1, 1,
-1.185926, -0.05130634, -1.42551, 1, 1, 1, 1, 1,
-1.177639, -0.4497035, -1.174927, 1, 1, 1, 1, 1,
-1.174657, 0.3295269, -1.683835, 1, 1, 1, 1, 1,
-1.174195, 0.4594686, -1.298347, 1, 1, 1, 1, 1,
-1.172019, -0.7285011, -2.270175, 1, 1, 1, 1, 1,
-1.167895, 1.797621, -0.191716, 1, 1, 1, 1, 1,
-1.166954, -0.4286143, -2.511043, 1, 1, 1, 1, 1,
-1.15118, 0.1599143, -2.495673, 1, 1, 1, 1, 1,
-1.150655, -0.2186211, -1.197635, 1, 1, 1, 1, 1,
-1.144757, -0.2088254, -2.041475, 0, 0, 1, 1, 1,
-1.138002, 1.456681, -0.6890729, 1, 0, 0, 1, 1,
-1.133234, 0.4942075, 0.03636045, 1, 0, 0, 1, 1,
-1.122002, 0.545409, -0.8166388, 1, 0, 0, 1, 1,
-1.121012, -1.43205, -2.812191, 1, 0, 0, 1, 1,
-1.120973, -0.2141898, -1.781619, 1, 0, 0, 1, 1,
-1.116076, -0.3222198, -1.496776, 0, 0, 0, 1, 1,
-1.113765, -0.3763464, -1.482376, 0, 0, 0, 1, 1,
-1.100597, 0.9984605, -0.7331958, 0, 0, 0, 1, 1,
-1.09957, 0.5627257, -2.920725, 0, 0, 0, 1, 1,
-1.095607, -3.65299, -3.306041, 0, 0, 0, 1, 1,
-1.095453, -0.2408804, -3.881175, 0, 0, 0, 1, 1,
-1.093544, 2.226973, -2.477801, 0, 0, 0, 1, 1,
-1.082668, -0.2728571, -2.261382, 1, 1, 1, 1, 1,
-1.078095, 0.05265589, -2.645404, 1, 1, 1, 1, 1,
-1.075588, -1.530659, -1.284274, 1, 1, 1, 1, 1,
-1.072234, -0.6734163, -3.407003, 1, 1, 1, 1, 1,
-1.070293, -0.7279641, -2.309796, 1, 1, 1, 1, 1,
-1.063235, -1.915414, -4.141738, 1, 1, 1, 1, 1,
-1.0515, 0.3550786, -2.123657, 1, 1, 1, 1, 1,
-1.049943, 0.2006415, -0.9664321, 1, 1, 1, 1, 1,
-1.044593, 1.286659, -1.059771, 1, 1, 1, 1, 1,
-1.031812, 0.9713669, -0.4004778, 1, 1, 1, 1, 1,
-1.028407, -0.2546047, -1.591563, 1, 1, 1, 1, 1,
-1.02676, 0.4988714, -0.6830615, 1, 1, 1, 1, 1,
-1.022262, -0.05024691, -1.165432, 1, 1, 1, 1, 1,
-1.020324, -0.06790114, -2.187375, 1, 1, 1, 1, 1,
-1.002786, -1.002005, -2.404559, 1, 1, 1, 1, 1,
-1.002431, -1.280498, -2.134034, 0, 0, 1, 1, 1,
-1.000136, -2.504269, -2.807813, 1, 0, 0, 1, 1,
-0.99826, 0.03990922, -2.544125, 1, 0, 0, 1, 1,
-0.9974166, -0.1072399, -1.309763, 1, 0, 0, 1, 1,
-0.9967841, -0.378787, 0.04869368, 1, 0, 0, 1, 1,
-0.9880319, -1.821171, -2.978699, 1, 0, 0, 1, 1,
-0.9879024, -0.9512038, -2.88323, 0, 0, 0, 1, 1,
-0.986422, -0.109717, -1.64128, 0, 0, 0, 1, 1,
-0.9863633, 0.6143346, -1.109754, 0, 0, 0, 1, 1,
-0.9771313, -1.677968, -2.931738, 0, 0, 0, 1, 1,
-0.9732889, -0.5141534, -2.131917, 0, 0, 0, 1, 1,
-0.9645305, 0.7772577, -1.413268, 0, 0, 0, 1, 1,
-0.9628599, -1.054521, -1.633395, 0, 0, 0, 1, 1,
-0.9621696, -0.70171, -3.201555, 1, 1, 1, 1, 1,
-0.9570193, 0.107148, -1.856552, 1, 1, 1, 1, 1,
-0.9569924, 0.3592128, -3.253283, 1, 1, 1, 1, 1,
-0.9545003, -1.33449, -3.163037, 1, 1, 1, 1, 1,
-0.9537318, -0.9001154, -3.93273, 1, 1, 1, 1, 1,
-0.9439853, -0.5630646, -1.427543, 1, 1, 1, 1, 1,
-0.9423437, 0.1278024, -0.7291068, 1, 1, 1, 1, 1,
-0.9398921, 1.095534, -0.02560415, 1, 1, 1, 1, 1,
-0.9381932, -1.004614, -2.304937, 1, 1, 1, 1, 1,
-0.9381463, -1.771966, -4.55682, 1, 1, 1, 1, 1,
-0.9300056, 0.1318287, -1.859396, 1, 1, 1, 1, 1,
-0.9176637, 0.3828534, -0.7946456, 1, 1, 1, 1, 1,
-0.9162156, 0.4489377, -2.31309, 1, 1, 1, 1, 1,
-0.9142537, -2.018489, -4.347408, 1, 1, 1, 1, 1,
-0.9073662, 0.5675527, -1.63569, 1, 1, 1, 1, 1,
-0.9035971, 0.9433206, -0.6128671, 0, 0, 1, 1, 1,
-0.9020316, -1.099307, -1.667718, 1, 0, 0, 1, 1,
-0.8982282, -0.06874949, -1.410121, 1, 0, 0, 1, 1,
-0.8922131, -2.106727, -1.608021, 1, 0, 0, 1, 1,
-0.8895232, 0.6329822, -3.63563, 1, 0, 0, 1, 1,
-0.8855877, 0.5001324, -0.5208198, 1, 0, 0, 1, 1,
-0.8847827, 0.01958207, -2.337815, 0, 0, 0, 1, 1,
-0.8814527, -0.9310694, -2.411629, 0, 0, 0, 1, 1,
-0.8781511, -0.3609451, -1.481753, 0, 0, 0, 1, 1,
-0.8710616, -0.931855, -1.934085, 0, 0, 0, 1, 1,
-0.8664234, 0.7161837, -1.877586, 0, 0, 0, 1, 1,
-0.8661093, 0.05439291, -1.01764, 0, 0, 0, 1, 1,
-0.8633303, 0.4434055, -1.811527, 0, 0, 0, 1, 1,
-0.8623521, 0.6713543, -0.3417528, 1, 1, 1, 1, 1,
-0.854988, -0.1044682, -0.7615376, 1, 1, 1, 1, 1,
-0.8543295, 0.3389909, -2.747287, 1, 1, 1, 1, 1,
-0.8540326, 1.087076, -0.4974419, 1, 1, 1, 1, 1,
-0.8495373, -2.271823, -2.655908, 1, 1, 1, 1, 1,
-0.8491573, -0.6518618, -1.410352, 1, 1, 1, 1, 1,
-0.8431165, -1.675437, -1.177868, 1, 1, 1, 1, 1,
-0.839581, 0.03669381, -1.758905, 1, 1, 1, 1, 1,
-0.8380891, 0.3816007, 0.8643159, 1, 1, 1, 1, 1,
-0.835708, -0.6010717, -2.581325, 1, 1, 1, 1, 1,
-0.834536, 1.406202, -0.8206407, 1, 1, 1, 1, 1,
-0.8290937, -0.2297149, -2.76149, 1, 1, 1, 1, 1,
-0.8254481, 2.087628, -2.250005, 1, 1, 1, 1, 1,
-0.8210536, 0.4189667, -2.642805, 1, 1, 1, 1, 1,
-0.8035847, 1.46467, 1.427311, 1, 1, 1, 1, 1,
-0.8017862, -0.8781449, -3.259689, 0, 0, 1, 1, 1,
-0.7977274, 0.946799, -2.107037, 1, 0, 0, 1, 1,
-0.7941537, 0.9931251, -2.461316, 1, 0, 0, 1, 1,
-0.7863081, -0.5814704, -0.2955746, 1, 0, 0, 1, 1,
-0.7860745, 1.365893, -1.039567, 1, 0, 0, 1, 1,
-0.7814032, 0.06875998, -3.286155, 1, 0, 0, 1, 1,
-0.7808683, 0.1251869, -1.327105, 0, 0, 0, 1, 1,
-0.7801144, 0.07030599, -2.126572, 0, 0, 0, 1, 1,
-0.7794988, 1.661642, -0.2915822, 0, 0, 0, 1, 1,
-0.7769591, -1.399666, -2.657156, 0, 0, 0, 1, 1,
-0.7767006, -0.4871488, -1.215272, 0, 0, 0, 1, 1,
-0.7753983, -0.5992076, -2.010569, 0, 0, 0, 1, 1,
-0.7708433, -1.107806, -2.297397, 0, 0, 0, 1, 1,
-0.7697607, 1.001152, 0.03575257, 1, 1, 1, 1, 1,
-0.7659721, 1.574752, -0.288169, 1, 1, 1, 1, 1,
-0.7618374, 0.1042928, -0.2184185, 1, 1, 1, 1, 1,
-0.7574415, -0.5825365, -2.543207, 1, 1, 1, 1, 1,
-0.7537139, -2.06121, -1.547204, 1, 1, 1, 1, 1,
-0.7488463, -0.4661557, -2.757951, 1, 1, 1, 1, 1,
-0.7365949, -0.4462901, -2.034309, 1, 1, 1, 1, 1,
-0.7258413, 0.2412564, -2.155189, 1, 1, 1, 1, 1,
-0.7233145, 1.409546, -0.3523709, 1, 1, 1, 1, 1,
-0.7164822, 0.7946924, -0.2487196, 1, 1, 1, 1, 1,
-0.7112613, -1.07032, -2.553628, 1, 1, 1, 1, 1,
-0.7100945, 1.844451, 2.763717, 1, 1, 1, 1, 1,
-0.7093775, 0.5103597, 0.7855598, 1, 1, 1, 1, 1,
-0.7067795, 0.3214416, -2.510088, 1, 1, 1, 1, 1,
-0.7056168, -1.478371, -2.714358, 1, 1, 1, 1, 1,
-0.700937, 1.380185, -3.009015, 0, 0, 1, 1, 1,
-0.697419, 0.2928781, -2.588889, 1, 0, 0, 1, 1,
-0.6940874, 1.01502, -1.127722, 1, 0, 0, 1, 1,
-0.6907533, 0.808163, -1.684556, 1, 0, 0, 1, 1,
-0.689635, 0.05680408, -2.507496, 1, 0, 0, 1, 1,
-0.688652, -0.7142116, -3.168921, 1, 0, 0, 1, 1,
-0.6873907, -0.2547502, -2.233637, 0, 0, 0, 1, 1,
-0.6840034, -0.1910809, -2.389692, 0, 0, 0, 1, 1,
-0.6789997, 0.2093411, -0.1655664, 0, 0, 0, 1, 1,
-0.6773093, -0.5686417, -3.140162, 0, 0, 0, 1, 1,
-0.676878, -0.4976338, -1.433206, 0, 0, 0, 1, 1,
-0.6723849, -0.7407234, -3.402009, 0, 0, 0, 1, 1,
-0.6719311, 0.1473444, -2.075682, 0, 0, 0, 1, 1,
-0.6705728, -0.1250733, -2.074925, 1, 1, 1, 1, 1,
-0.6701163, -1.729593, -1.302231, 1, 1, 1, 1, 1,
-0.6683148, -0.1779186, -2.521887, 1, 1, 1, 1, 1,
-0.6552871, -0.3654775, -2.88806, 1, 1, 1, 1, 1,
-0.6543734, -0.7571207, -1.23959, 1, 1, 1, 1, 1,
-0.6528342, -1.333874, -1.431268, 1, 1, 1, 1, 1,
-0.6516402, 0.6148677, 0.001391217, 1, 1, 1, 1, 1,
-0.6438684, 1.607929, 0.5591421, 1, 1, 1, 1, 1,
-0.6432312, 0.1091329, -0.9325076, 1, 1, 1, 1, 1,
-0.6419408, 0.6049154, -1.693724, 1, 1, 1, 1, 1,
-0.6383181, 1.213765, 0.1683546, 1, 1, 1, 1, 1,
-0.635927, -0.1104781, -0.3651547, 1, 1, 1, 1, 1,
-0.635579, -0.008002257, -0.865543, 1, 1, 1, 1, 1,
-0.6343852, -0.3372736, -3.16028, 1, 1, 1, 1, 1,
-0.6306453, 0.5540115, 0.6538534, 1, 1, 1, 1, 1,
-0.6282457, 0.3786371, -2.953984, 0, 0, 1, 1, 1,
-0.6251541, 0.1360553, -0.5487581, 1, 0, 0, 1, 1,
-0.6244016, -0.2328777, -4.153461, 1, 0, 0, 1, 1,
-0.6167905, -0.7480975, -2.869107, 1, 0, 0, 1, 1,
-0.6091011, -0.3947366, -3.136214, 1, 0, 0, 1, 1,
-0.60566, 2.005994, -0.1653298, 1, 0, 0, 1, 1,
-0.6019884, 3.07922, -1.136204, 0, 0, 0, 1, 1,
-0.6008173, 1.360966, 0.1487359, 0, 0, 0, 1, 1,
-0.59881, -0.7949975, -1.188652, 0, 0, 0, 1, 1,
-0.5957223, 0.4040951, -0.8597638, 0, 0, 0, 1, 1,
-0.5877037, -0.8017184, -3.456416, 0, 0, 0, 1, 1,
-0.5791874, -1.029208, -2.706577, 0, 0, 0, 1, 1,
-0.5790184, 0.8317938, -1.28564, 0, 0, 0, 1, 1,
-0.5783271, 0.08164828, 0.2525224, 1, 1, 1, 1, 1,
-0.5764934, -0.3395211, -2.941315, 1, 1, 1, 1, 1,
-0.5576558, 0.2154211, -0.5966106, 1, 1, 1, 1, 1,
-0.5549607, -1.70064, -1.985973, 1, 1, 1, 1, 1,
-0.5483159, 0.1186139, -0.7216949, 1, 1, 1, 1, 1,
-0.5433636, 0.1569663, -2.237673, 1, 1, 1, 1, 1,
-0.5432851, -0.07781544, -3.93544, 1, 1, 1, 1, 1,
-0.5354108, -0.697604, -2.623537, 1, 1, 1, 1, 1,
-0.5350227, 0.3088026, -1.677054, 1, 1, 1, 1, 1,
-0.5323769, 1.802911, -0.224636, 1, 1, 1, 1, 1,
-0.5320033, 1.537269, -1.680574, 1, 1, 1, 1, 1,
-0.5280516, 1.235692, -0.7827515, 1, 1, 1, 1, 1,
-0.5267969, -1.158724, -4.084792, 1, 1, 1, 1, 1,
-0.5252855, 0.2904648, -0.6605313, 1, 1, 1, 1, 1,
-0.5196871, -0.4877543, -1.614574, 1, 1, 1, 1, 1,
-0.5176585, -0.8931758, -2.235026, 0, 0, 1, 1, 1,
-0.5171655, 0.1375463, -0.2248794, 1, 0, 0, 1, 1,
-0.5148304, 0.01279059, -2.377776, 1, 0, 0, 1, 1,
-0.5051903, -1.021541, -2.399392, 1, 0, 0, 1, 1,
-0.5030975, 0.5866106, -0.9910785, 1, 0, 0, 1, 1,
-0.4960767, 2.360883, -1.025851, 1, 0, 0, 1, 1,
-0.4944866, -1.118352, -2.535597, 0, 0, 0, 1, 1,
-0.4927187, 0.02227014, -3.171875, 0, 0, 0, 1, 1,
-0.4912079, 0.3842312, -0.5836087, 0, 0, 0, 1, 1,
-0.4862882, -1.769956, -1.887605, 0, 0, 0, 1, 1,
-0.483784, -0.08811553, -2.281173, 0, 0, 0, 1, 1,
-0.4836507, 1.620324, -0.06984143, 0, 0, 0, 1, 1,
-0.4827838, -1.421779, -1.590293, 0, 0, 0, 1, 1,
-0.4819216, -1.196469, -0.7925861, 1, 1, 1, 1, 1,
-0.4778647, -1.06693, -3.497628, 1, 1, 1, 1, 1,
-0.4743798, -2.064655, -2.308565, 1, 1, 1, 1, 1,
-0.4694358, 0.9207317, -0.2711658, 1, 1, 1, 1, 1,
-0.469223, -1.611656, -3.714478, 1, 1, 1, 1, 1,
-0.4677762, 0.2834931, -1.171579, 1, 1, 1, 1, 1,
-0.4606124, 0.4512834, 1.228309, 1, 1, 1, 1, 1,
-0.4557482, -0.5898771, -1.081822, 1, 1, 1, 1, 1,
-0.4557234, -1.148305, -0.8719688, 1, 1, 1, 1, 1,
-0.4553891, -0.1821855, -2.252583, 1, 1, 1, 1, 1,
-0.4508612, 0.7777193, -1.220557, 1, 1, 1, 1, 1,
-0.4500954, 0.5204191, -0.1091467, 1, 1, 1, 1, 1,
-0.4489111, 1.459551, -1.366593, 1, 1, 1, 1, 1,
-0.4483702, -0.2147718, -2.151672, 1, 1, 1, 1, 1,
-0.4479201, -0.3015961, -2.24862, 1, 1, 1, 1, 1,
-0.447065, 1.963584, -0.2883734, 0, 0, 1, 1, 1,
-0.4466164, -1.291925, -1.679303, 1, 0, 0, 1, 1,
-0.4352322, -0.1053667, -0.402637, 1, 0, 0, 1, 1,
-0.4338789, -0.3919903, -1.49585, 1, 0, 0, 1, 1,
-0.4300844, 0.4833365, -0.1529824, 1, 0, 0, 1, 1,
-0.4277339, 1.378146, -0.6237957, 1, 0, 0, 1, 1,
-0.4263131, 0.1182457, -0.3186342, 0, 0, 0, 1, 1,
-0.4223326, -0.6028976, -1.235252, 0, 0, 0, 1, 1,
-0.4179124, -0.8817053, -2.676822, 0, 0, 0, 1, 1,
-0.4099899, 1.64919, 1.960286, 0, 0, 0, 1, 1,
-0.4060242, 0.9510522, -0.4797907, 0, 0, 0, 1, 1,
-0.4059423, -0.4454867, -1.898587, 0, 0, 0, 1, 1,
-0.4040501, 0.2272372, -0.2000641, 0, 0, 0, 1, 1,
-0.4026192, -0.6226667, -1.72576, 1, 1, 1, 1, 1,
-0.40225, -0.04312667, -0.7653054, 1, 1, 1, 1, 1,
-0.3953765, 1.500125, -0.2560616, 1, 1, 1, 1, 1,
-0.39384, -0.7367782, -3.780818, 1, 1, 1, 1, 1,
-0.3879914, -0.7994539, -3.19035, 1, 1, 1, 1, 1,
-0.3769082, -0.6466585, -2.814973, 1, 1, 1, 1, 1,
-0.3766823, -1.141349, -2.081791, 1, 1, 1, 1, 1,
-0.3762474, 0.5557614, -2.683066, 1, 1, 1, 1, 1,
-0.3750501, 0.3565214, -0.06266597, 1, 1, 1, 1, 1,
-0.3679554, -2.665973, -2.174332, 1, 1, 1, 1, 1,
-0.3671267, 0.2018004, -0.8851227, 1, 1, 1, 1, 1,
-0.3662297, 0.1498215, -1.315999, 1, 1, 1, 1, 1,
-0.36513, 0.3015563, 1.0688, 1, 1, 1, 1, 1,
-0.3644268, 0.463802, -1.058547, 1, 1, 1, 1, 1,
-0.3608047, -0.9754057, -2.500114, 1, 1, 1, 1, 1,
-0.3607546, -0.5331905, -2.152385, 0, 0, 1, 1, 1,
-0.3578387, -1.481239, -4.57499, 1, 0, 0, 1, 1,
-0.3493216, -0.4371667, -0.9598155, 1, 0, 0, 1, 1,
-0.3488954, -0.901957, -4.220302, 1, 0, 0, 1, 1,
-0.3419934, -0.4143861, -1.928785, 1, 0, 0, 1, 1,
-0.3389879, 0.1459572, 0.1278581, 1, 0, 0, 1, 1,
-0.3367842, -1.830798, -4.355817, 0, 0, 0, 1, 1,
-0.335584, 1.259342, -1.469623, 0, 0, 0, 1, 1,
-0.3348238, -0.1314484, -0.05190955, 0, 0, 0, 1, 1,
-0.3275129, 0.7101833, -0.4021414, 0, 0, 0, 1, 1,
-0.3273364, -0.1540497, -0.6503878, 0, 0, 0, 1, 1,
-0.3257114, -0.9069994, -3.012083, 0, 0, 0, 1, 1,
-0.3254868, 0.1316187, -1.212592, 0, 0, 0, 1, 1,
-0.3241488, -0.1240493, -1.922102, 1, 1, 1, 1, 1,
-0.3234419, -0.6765049, -3.636684, 1, 1, 1, 1, 1,
-0.3197386, -1.572195, -2.208902, 1, 1, 1, 1, 1,
-0.3154415, 0.4811415, -1.264319, 1, 1, 1, 1, 1,
-0.3132476, -0.2793067, -0.2390269, 1, 1, 1, 1, 1,
-0.3119422, 0.6113645, 0.5145878, 1, 1, 1, 1, 1,
-0.3093178, -0.07740577, -3.737991, 1, 1, 1, 1, 1,
-0.3062309, 0.9786616, -1.764798, 1, 1, 1, 1, 1,
-0.3043, -0.7577152, -2.654207, 1, 1, 1, 1, 1,
-0.2981384, 0.2732721, -0.9181533, 1, 1, 1, 1, 1,
-0.2965685, -1.183371, -3.573951, 1, 1, 1, 1, 1,
-0.2946652, -1.930837, -2.920874, 1, 1, 1, 1, 1,
-0.291762, -0.1056195, -2.490753, 1, 1, 1, 1, 1,
-0.2914483, 1.70548, 0.03467615, 1, 1, 1, 1, 1,
-0.2912585, -0.1503999, -3.689416, 1, 1, 1, 1, 1,
-0.2910349, 1.04668, -0.03997856, 0, 0, 1, 1, 1,
-0.2886274, -0.4232922, -4.509089, 1, 0, 0, 1, 1,
-0.2877638, 0.4221669, -0.1431283, 1, 0, 0, 1, 1,
-0.2876183, -0.8048421, -2.4766, 1, 0, 0, 1, 1,
-0.2824291, -1.177783, -2.844944, 1, 0, 0, 1, 1,
-0.2809304, -0.2906698, -1.685764, 1, 0, 0, 1, 1,
-0.2797669, -1.558225, -0.9189053, 0, 0, 0, 1, 1,
-0.2705795, -0.06417289, -2.365103, 0, 0, 0, 1, 1,
-0.2677836, 0.3457914, -1.545197, 0, 0, 0, 1, 1,
-0.2662043, -1.998559, -2.418576, 0, 0, 0, 1, 1,
-0.2637439, -0.6194208, -2.229459, 0, 0, 0, 1, 1,
-0.2609925, -1.490125, -1.620517, 0, 0, 0, 1, 1,
-0.257349, -0.5871257, -2.903629, 0, 0, 0, 1, 1,
-0.2512589, 1.148346, 1.411696, 1, 1, 1, 1, 1,
-0.250216, -0.7490479, -2.776978, 1, 1, 1, 1, 1,
-0.2430641, 1.719556, -0.1179671, 1, 1, 1, 1, 1,
-0.2401235, 1.116567, -0.7651411, 1, 1, 1, 1, 1,
-0.2365925, -1.316416, -2.749472, 1, 1, 1, 1, 1,
-0.2334558, 1.157025, 0.1428596, 1, 1, 1, 1, 1,
-0.2324129, 3.466824, 0.5680122, 1, 1, 1, 1, 1,
-0.2311948, -0.08904097, -0.5906428, 1, 1, 1, 1, 1,
-0.2287446, 0.3339051, 0.6043746, 1, 1, 1, 1, 1,
-0.2236366, -0.7470294, -3.828786, 1, 1, 1, 1, 1,
-0.2213559, 2.81489, -0.7130761, 1, 1, 1, 1, 1,
-0.2202217, 1.260996, -0.04506471, 1, 1, 1, 1, 1,
-0.2183245, 1.081036, -0.04931759, 1, 1, 1, 1, 1,
-0.2140351, 1.667295, -0.7858201, 1, 1, 1, 1, 1,
-0.2133574, -0.1851521, -3.052752, 1, 1, 1, 1, 1,
-0.2087071, 0.8523087, 1.238837, 0, 0, 1, 1, 1,
-0.2066383, -1.162886, -3.605836, 1, 0, 0, 1, 1,
-0.2051654, -0.6730658, -1.92944, 1, 0, 0, 1, 1,
-0.204718, -0.9722455, -1.341783, 1, 0, 0, 1, 1,
-0.203142, -0.8901993, -3.713897, 1, 0, 0, 1, 1,
-0.2001634, -0.3548543, -1.937256, 1, 0, 0, 1, 1,
-0.1960429, -0.3682906, -3.106945, 0, 0, 0, 1, 1,
-0.1938836, -0.9631791, -3.156041, 0, 0, 0, 1, 1,
-0.1937591, -0.3459911, -4.360883, 0, 0, 0, 1, 1,
-0.1935858, 1.616168, 0.4118678, 0, 0, 0, 1, 1,
-0.192176, 1.785571, -0.7279413, 0, 0, 0, 1, 1,
-0.1910331, -0.2446139, -1.766552, 0, 0, 0, 1, 1,
-0.1859325, 3.139877, 1.101543, 0, 0, 0, 1, 1,
-0.1846858, 0.2323366, -1.681968, 1, 1, 1, 1, 1,
-0.1844513, 1.119937, -0.8156229, 1, 1, 1, 1, 1,
-0.1802231, 0.3426576, -1.125193, 1, 1, 1, 1, 1,
-0.1785347, 1.312448, 1.110578, 1, 1, 1, 1, 1,
-0.1775614, 1.210914, -0.05228108, 1, 1, 1, 1, 1,
-0.1754965, 1.963845, 0.2793267, 1, 1, 1, 1, 1,
-0.1726282, -0.6831934, -3.771499, 1, 1, 1, 1, 1,
-0.1699861, -0.09065456, -1.243491, 1, 1, 1, 1, 1,
-0.169056, -0.743524, -1.783211, 1, 1, 1, 1, 1,
-0.1666963, 0.3475439, -0.7328448, 1, 1, 1, 1, 1,
-0.1624812, 1.945723, -0.147196, 1, 1, 1, 1, 1,
-0.1595306, -0.6694161, -2.166531, 1, 1, 1, 1, 1,
-0.1570211, 0.4204982, -0.201652, 1, 1, 1, 1, 1,
-0.1459857, -0.02082941, -0.9861874, 1, 1, 1, 1, 1,
-0.1449681, -1.127481, -3.187575, 1, 1, 1, 1, 1,
-0.1441643, -1.350389, -1.440479, 0, 0, 1, 1, 1,
-0.1366312, 0.672744, 1.710489, 1, 0, 0, 1, 1,
-0.1351374, -2.107175, -3.249463, 1, 0, 0, 1, 1,
-0.1298595, -1.307911, -3.337753, 1, 0, 0, 1, 1,
-0.1289034, 0.5585257, -0.3388605, 1, 0, 0, 1, 1,
-0.1270474, -0.01869076, -2.653015, 1, 0, 0, 1, 1,
-0.1244752, -0.535182, -3.116797, 0, 0, 0, 1, 1,
-0.1243228, 0.04939149, -1.01241, 0, 0, 0, 1, 1,
-0.1241278, -0.4231421, -2.007077, 0, 0, 0, 1, 1,
-0.1226098, 2.166417, 1.140937, 0, 0, 0, 1, 1,
-0.1207556, 0.5582713, 0.1649792, 0, 0, 0, 1, 1,
-0.1184535, -0.6841128, -0.6530073, 0, 0, 0, 1, 1,
-0.1138277, 1.243409, -0.3360317, 0, 0, 0, 1, 1,
-0.1106118, 0.6836624, -0.3885345, 1, 1, 1, 1, 1,
-0.1098341, 0.8146778, -0.2464859, 1, 1, 1, 1, 1,
-0.1094958, -1.381393, -3.748129, 1, 1, 1, 1, 1,
-0.1076123, 0.4221628, 0.7504346, 1, 1, 1, 1, 1,
-0.1066173, 3.776203, -1.397939, 1, 1, 1, 1, 1,
-0.1028174, 0.4460625, 0.3789555, 1, 1, 1, 1, 1,
-0.09999628, -1.270903, -3.231377, 1, 1, 1, 1, 1,
-0.09784125, 0.596091, 0.1834788, 1, 1, 1, 1, 1,
-0.09767574, 0.4264815, -1.130093, 1, 1, 1, 1, 1,
-0.09734391, 1.856696, 2.0519, 1, 1, 1, 1, 1,
-0.09666003, 0.7480258, -0.6486951, 1, 1, 1, 1, 1,
-0.09630843, -0.3487019, -2.802604, 1, 1, 1, 1, 1,
-0.08988935, -0.5472987, -4.496077, 1, 1, 1, 1, 1,
-0.08454063, -1.73423, -2.80469, 1, 1, 1, 1, 1,
-0.08359964, -1.372988, -3.431012, 1, 1, 1, 1, 1,
-0.08329296, -0.02397443, -2.60098, 0, 0, 1, 1, 1,
-0.08265211, 0.5825961, 0.2867695, 1, 0, 0, 1, 1,
-0.08134522, -0.3335263, -3.243966, 1, 0, 0, 1, 1,
-0.08085369, -0.2893777, -4.463078, 1, 0, 0, 1, 1,
-0.08001205, 0.0265031, -0.6120642, 1, 0, 0, 1, 1,
-0.07667995, 0.4106301, -0.1642003, 1, 0, 0, 1, 1,
-0.07657953, 2.006588, -0.5082415, 0, 0, 0, 1, 1,
-0.07653967, 0.2938793, -1.061067, 0, 0, 0, 1, 1,
-0.07490135, 2.24991, -0.4417438, 0, 0, 0, 1, 1,
-0.07322211, -0.3296727, -2.18764, 0, 0, 0, 1, 1,
-0.07277293, 0.7650096, 2.584704, 0, 0, 0, 1, 1,
-0.07066946, 0.5824765, 0.07128134, 0, 0, 0, 1, 1,
-0.07059728, 0.8509043, -0.640036, 0, 0, 0, 1, 1,
-0.06781785, -2.366558, -5.180273, 1, 1, 1, 1, 1,
-0.06620987, 1.482065, -0.2880222, 1, 1, 1, 1, 1,
-0.06033616, -1.2525, -4.609471, 1, 1, 1, 1, 1,
-0.0602876, -0.6771892, -2.939718, 1, 1, 1, 1, 1,
-0.05867734, 1.21877, 0.2245469, 1, 1, 1, 1, 1,
-0.05543375, 1.383743, 1.318375, 1, 1, 1, 1, 1,
-0.05394195, -0.7446883, -2.55848, 1, 1, 1, 1, 1,
-0.05244935, 2.243911, 0.5928391, 1, 1, 1, 1, 1,
-0.0499971, 0.2631424, 0.07493525, 1, 1, 1, 1, 1,
-0.04934106, -0.7749472, -4.595816, 1, 1, 1, 1, 1,
-0.04591802, 0.6241165, 0.8414654, 1, 1, 1, 1, 1,
-0.04419046, 1.711631, -0.158588, 1, 1, 1, 1, 1,
-0.04132541, 1.813145, 0.9854068, 1, 1, 1, 1, 1,
-0.03855009, 0.9510066, 0.35144, 1, 1, 1, 1, 1,
-0.034245, 1.121787, -0.885249, 1, 1, 1, 1, 1,
-0.03387789, 2.115031, 0.536704, 0, 0, 1, 1, 1,
-0.03373231, -0.445058, -2.901255, 1, 0, 0, 1, 1,
-0.02975053, 1.495591, -1.10971, 1, 0, 0, 1, 1,
-0.02886946, 0.2840143, 1.024309, 1, 0, 0, 1, 1,
-0.02694046, 0.1623622, 0.5665621, 1, 0, 0, 1, 1,
-0.02617584, 0.466731, 1.259745, 1, 0, 0, 1, 1,
-0.02369125, 1.62878, 0.6154554, 0, 0, 0, 1, 1,
-0.02088997, -0.2378581, -1.587933, 0, 0, 0, 1, 1,
-0.0172755, 0.530163, -0.7706471, 0, 0, 0, 1, 1,
-0.01430781, 1.005249, -0.8905736, 0, 0, 0, 1, 1,
-0.01374579, 0.5212868, 0.9603354, 0, 0, 0, 1, 1,
-0.008934098, 0.5160722, -0.03140369, 0, 0, 0, 1, 1,
-0.00687514, -0.1685714, -1.606548, 0, 0, 0, 1, 1,
-0.004005964, -2.459828, -1.694036, 1, 1, 1, 1, 1,
-0.00299926, -1.108319, -4.185461, 1, 1, 1, 1, 1,
-0.002361105, -1.134163, -3.884756, 1, 1, 1, 1, 1,
0.0001235208, 0.07127018, -0.05828939, 1, 1, 1, 1, 1,
0.002318192, -0.4482495, 0.3512461, 1, 1, 1, 1, 1,
0.004616725, 0.1465755, 0.1757087, 1, 1, 1, 1, 1,
0.01306307, -1.28674, 3.16559, 1, 1, 1, 1, 1,
0.01458564, -1.06178, 2.376012, 1, 1, 1, 1, 1,
0.01480284, -0.3252939, 2.616276, 1, 1, 1, 1, 1,
0.01686215, -0.4631388, 3.562808, 1, 1, 1, 1, 1,
0.02098609, -0.486154, 2.445752, 1, 1, 1, 1, 1,
0.02893401, 0.2791339, 2.154884, 1, 1, 1, 1, 1,
0.02903091, 0.3421459, 0.7311483, 1, 1, 1, 1, 1,
0.03362073, -1.720766, 4.729226, 1, 1, 1, 1, 1,
0.03449069, -0.7730827, 3.2379, 1, 1, 1, 1, 1,
0.03619464, 1.569997, 1.042552, 0, 0, 1, 1, 1,
0.03837261, 0.7182412, -0.2537823, 1, 0, 0, 1, 1,
0.04286112, 0.4479211, -0.06134025, 1, 0, 0, 1, 1,
0.04518294, 0.2776361, -1.221334, 1, 0, 0, 1, 1,
0.05142207, 0.2635806, -1.236391, 1, 0, 0, 1, 1,
0.05146996, -0.2542011, 2.203081, 1, 0, 0, 1, 1,
0.05798303, -0.4368118, 2.933084, 0, 0, 0, 1, 1,
0.05854646, -0.5602237, 3.399292, 0, 0, 0, 1, 1,
0.05937003, 0.09681202, 0.1509612, 0, 0, 0, 1, 1,
0.06079849, -0.2933516, 3.399979, 0, 0, 0, 1, 1,
0.06298594, 0.8689849, 0.5794321, 0, 0, 0, 1, 1,
0.06396297, -0.2052428, 3.662996, 0, 0, 0, 1, 1,
0.06412872, -0.2828652, 2.39494, 0, 0, 0, 1, 1,
0.06608921, 0.07499813, 0.5319529, 1, 1, 1, 1, 1,
0.06819642, -0.7495781, 2.636952, 1, 1, 1, 1, 1,
0.07157087, -0.06926671, 0.7793679, 1, 1, 1, 1, 1,
0.07600064, -1.693678, 3.142232, 1, 1, 1, 1, 1,
0.07763231, 1.516285, 0.9738386, 1, 1, 1, 1, 1,
0.0843439, -0.7571914, 0.4072683, 1, 1, 1, 1, 1,
0.09141572, 0.3761792, -0.01787269, 1, 1, 1, 1, 1,
0.09490354, -0.4386943, 5.158605, 1, 1, 1, 1, 1,
0.09570564, -0.4048007, 2.794185, 1, 1, 1, 1, 1,
0.09795949, -0.6209415, 4.39399, 1, 1, 1, 1, 1,
0.1024758, -0.2317472, 1.559913, 1, 1, 1, 1, 1,
0.1029038, 2.261798, 1.105236, 1, 1, 1, 1, 1,
0.1033505, 1.124026, 1.186456, 1, 1, 1, 1, 1,
0.1108846, 1.975687, -0.6560276, 1, 1, 1, 1, 1,
0.116529, 0.9839563, 0.1992114, 1, 1, 1, 1, 1,
0.1189438, -1.184451, 4.925804, 0, 0, 1, 1, 1,
0.1231671, -0.359474, 1.55352, 1, 0, 0, 1, 1,
0.1288132, -0.195253, 3.742196, 1, 0, 0, 1, 1,
0.1294524, 0.870111, -0.7055652, 1, 0, 0, 1, 1,
0.1303184, 1.631131, -0.3628299, 1, 0, 0, 1, 1,
0.1306308, -2.099123, 3.790394, 1, 0, 0, 1, 1,
0.1395152, 0.06994461, 0.4938276, 0, 0, 0, 1, 1,
0.1400124, 0.7710862, 0.276187, 0, 0, 0, 1, 1,
0.1457968, 0.8962839, 0.929866, 0, 0, 0, 1, 1,
0.1495909, -0.5065505, 2.987664, 0, 0, 0, 1, 1,
0.1507935, 0.4568431, 0.6819646, 0, 0, 0, 1, 1,
0.1538332, -0.6425784, 1.749504, 0, 0, 0, 1, 1,
0.1587237, 0.8056208, -1.702302, 0, 0, 0, 1, 1,
0.1629927, 0.6642538, -1.120259, 1, 1, 1, 1, 1,
0.1634387, -1.006249, 2.198324, 1, 1, 1, 1, 1,
0.1642551, 1.740101, 0.2139081, 1, 1, 1, 1, 1,
0.1657997, -0.4310423, 4.399849, 1, 1, 1, 1, 1,
0.1669218, -1.855227, 3.779326, 1, 1, 1, 1, 1,
0.1685027, -0.5019938, 3.030883, 1, 1, 1, 1, 1,
0.1686707, -0.2699737, 2.074223, 1, 1, 1, 1, 1,
0.171041, 0.8800736, -0.1635033, 1, 1, 1, 1, 1,
0.1736745, -0.6739265, 3.701509, 1, 1, 1, 1, 1,
0.1792265, 3.538031, 1.675087, 1, 1, 1, 1, 1,
0.1815648, 0.1469707, -0.5043327, 1, 1, 1, 1, 1,
0.1815678, 1.23539, 0.198052, 1, 1, 1, 1, 1,
0.1892446, 0.8041196, 0.001109667, 1, 1, 1, 1, 1,
0.1894373, -2.209764, 1.428355, 1, 1, 1, 1, 1,
0.1905219, 0.9997212, -1.313691, 1, 1, 1, 1, 1,
0.1940812, -0.8977761, 3.791389, 0, 0, 1, 1, 1,
0.199026, -0.4028269, 3.494128, 1, 0, 0, 1, 1,
0.1990937, 1.113186, -1.722443, 1, 0, 0, 1, 1,
0.2067964, -0.03379738, 2.634187, 1, 0, 0, 1, 1,
0.2093092, 1.30601, 0.7289922, 1, 0, 0, 1, 1,
0.2108174, -2.371658, 3.043148, 1, 0, 0, 1, 1,
0.2111377, -0.6785388, 4.0055, 0, 0, 0, 1, 1,
0.2127281, 1.094726, 2.690494, 0, 0, 0, 1, 1,
0.2148097, 1.767164, 2.814489, 0, 0, 0, 1, 1,
0.2150686, -0.6116759, 1.839297, 0, 0, 0, 1, 1,
0.2186333, -0.2252021, 3.044205, 0, 0, 0, 1, 1,
0.2205879, 1.721693, 1.377321, 0, 0, 0, 1, 1,
0.2224907, 0.8884521, -1.071277, 0, 0, 0, 1, 1,
0.2287497, 0.8476427, 1.436278, 1, 1, 1, 1, 1,
0.2299933, 0.956451, -1.092391, 1, 1, 1, 1, 1,
0.2327643, 0.6042047, 1.304098, 1, 1, 1, 1, 1,
0.233253, -0.5508875, 2.043615, 1, 1, 1, 1, 1,
0.2347807, -2.324396, 4.0105, 1, 1, 1, 1, 1,
0.2409606, -0.3130885, 2.86535, 1, 1, 1, 1, 1,
0.2426838, 0.202133, 1.389465, 1, 1, 1, 1, 1,
0.2449163, 0.7769248, 0.5886524, 1, 1, 1, 1, 1,
0.246003, -0.3057629, 4.132053, 1, 1, 1, 1, 1,
0.2478514, -1.290669, 3.867109, 1, 1, 1, 1, 1,
0.2486073, 0.8961757, 0.571665, 1, 1, 1, 1, 1,
0.2519928, 1.093386, -0.1304537, 1, 1, 1, 1, 1,
0.253759, -1.981261, 3.73401, 1, 1, 1, 1, 1,
0.2566848, -0.03909757, 1.106535, 1, 1, 1, 1, 1,
0.2606957, -0.5436789, 3.133203, 1, 1, 1, 1, 1,
0.2710871, 0.2052502, 0.8082417, 0, 0, 1, 1, 1,
0.2734306, 0.865868, -1.178007, 1, 0, 0, 1, 1,
0.273812, -0.597371, 3.574597, 1, 0, 0, 1, 1,
0.2747072, -0.1375052, 1.643078, 1, 0, 0, 1, 1,
0.2755343, -0.9908341, 1.361393, 1, 0, 0, 1, 1,
0.2786733, 0.3433889, 0.5423127, 1, 0, 0, 1, 1,
0.2791759, -0.03435567, -0.4735995, 0, 0, 0, 1, 1,
0.2794383, 0.2595048, 1.263936, 0, 0, 0, 1, 1,
0.2812517, 0.4971304, 1.048593, 0, 0, 0, 1, 1,
0.2831532, -0.7031917, 2.969905, 0, 0, 0, 1, 1,
0.2942562, -1.946582, 3.156641, 0, 0, 0, 1, 1,
0.3036882, 0.8170451, -0.6378912, 0, 0, 0, 1, 1,
0.3094695, -2.851411, 3.277815, 0, 0, 0, 1, 1,
0.3107504, 0.06418285, 2.663574, 1, 1, 1, 1, 1,
0.319834, 0.6318549, 0.07487312, 1, 1, 1, 1, 1,
0.3215804, -0.6862053, 2.603174, 1, 1, 1, 1, 1,
0.3217879, -0.179904, 2.218062, 1, 1, 1, 1, 1,
0.3240012, -2.241337, 2.678786, 1, 1, 1, 1, 1,
0.3254251, 0.7378425, -1.473802, 1, 1, 1, 1, 1,
0.3292324, -0.5653346, 1.335682, 1, 1, 1, 1, 1,
0.3293383, 0.3797871, 0.6739523, 1, 1, 1, 1, 1,
0.3295185, 0.1226174, -0.985357, 1, 1, 1, 1, 1,
0.3337955, -0.1923738, 0.7320358, 1, 1, 1, 1, 1,
0.3349535, 0.297545, 1.017124, 1, 1, 1, 1, 1,
0.3461649, -0.3957103, 1.335155, 1, 1, 1, 1, 1,
0.3505196, 1.018677, 0.7303521, 1, 1, 1, 1, 1,
0.3511087, 0.09302118, 1.968847, 1, 1, 1, 1, 1,
0.3513911, -0.6676322, 1.395132, 1, 1, 1, 1, 1,
0.3527666, 0.9675139, -0.06535764, 0, 0, 1, 1, 1,
0.3540029, 1.292455, 0.7499915, 1, 0, 0, 1, 1,
0.3542436, 0.6379573, 1.552284, 1, 0, 0, 1, 1,
0.3550029, 1.859516, 1.167822, 1, 0, 0, 1, 1,
0.3618422, 1.843325, -0.7972814, 1, 0, 0, 1, 1,
0.3643218, -2.067832, 3.844883, 1, 0, 0, 1, 1,
0.3684421, 0.6272677, 0.8809937, 0, 0, 0, 1, 1,
0.3719188, -0.745069, 1.612343, 0, 0, 0, 1, 1,
0.3733197, 0.09842379, 1.179785, 0, 0, 0, 1, 1,
0.3788992, 0.1479541, 0.6404277, 0, 0, 0, 1, 1,
0.3791466, 0.2785582, 1.14409, 0, 0, 0, 1, 1,
0.3848056, 1.014945, -0.08683854, 0, 0, 0, 1, 1,
0.3884987, 0.2325267, -0.7185335, 0, 0, 0, 1, 1,
0.3887995, 1.437449, -0.4302559, 1, 1, 1, 1, 1,
0.3897136, 0.184248, 1.789777, 1, 1, 1, 1, 1,
0.3916218, 2.175727, 0.07536595, 1, 1, 1, 1, 1,
0.3932135, 0.5031726, 1.766865, 1, 1, 1, 1, 1,
0.3934308, 1.716922, 0.1883323, 1, 1, 1, 1, 1,
0.3938803, 2.184811, 0.3266706, 1, 1, 1, 1, 1,
0.3953816, 1.553859, 1.082311, 1, 1, 1, 1, 1,
0.3961495, -0.0004496858, 0.3531334, 1, 1, 1, 1, 1,
0.3962263, 1.055373, 0.7637972, 1, 1, 1, 1, 1,
0.4073906, 0.04242964, 0.7471109, 1, 1, 1, 1, 1,
0.4156227, 1.221695, 1.977699, 1, 1, 1, 1, 1,
0.4178095, 1.952234, -0.5915229, 1, 1, 1, 1, 1,
0.418662, -0.02141653, 1.270237, 1, 1, 1, 1, 1,
0.4266919, -2.43423, 3.285559, 1, 1, 1, 1, 1,
0.4283992, -1.13626, 3.683037, 1, 1, 1, 1, 1,
0.42894, -0.2871463, 1.407923, 0, 0, 1, 1, 1,
0.4292451, -2.835694, 2.081484, 1, 0, 0, 1, 1,
0.430735, -0.2550871, 2.900618, 1, 0, 0, 1, 1,
0.431701, -0.1109721, 1.451597, 1, 0, 0, 1, 1,
0.4349538, -0.7295942, 1.470289, 1, 0, 0, 1, 1,
0.4380094, 0.2531204, 0.8143846, 1, 0, 0, 1, 1,
0.4410965, -0.09293664, 1.03579, 0, 0, 0, 1, 1,
0.4419867, -0.8915778, 2.49244, 0, 0, 0, 1, 1,
0.4474732, -0.8213105, 3.160356, 0, 0, 0, 1, 1,
0.4477035, 0.02570778, 1.16676, 0, 0, 0, 1, 1,
0.4482781, -0.3985899, 1.196264, 0, 0, 0, 1, 1,
0.4496683, -0.8556921, 4.067564, 0, 0, 0, 1, 1,
0.4499085, 0.570159, -0.505215, 0, 0, 0, 1, 1,
0.4506636, -2.459918, 2.718005, 1, 1, 1, 1, 1,
0.4531052, -0.4041701, 2.17818, 1, 1, 1, 1, 1,
0.4546162, -1.020028, 4.992098, 1, 1, 1, 1, 1,
0.4596124, -0.9230137, 3.070053, 1, 1, 1, 1, 1,
0.4649927, -0.7108004, 3.068135, 1, 1, 1, 1, 1,
0.4690317, -0.3471459, 1.273798, 1, 1, 1, 1, 1,
0.4805564, -0.479491, 2.301689, 1, 1, 1, 1, 1,
0.4851188, 0.3776272, -0.4431759, 1, 1, 1, 1, 1,
0.4868249, -1.476808, 1.230024, 1, 1, 1, 1, 1,
0.4869713, 1.514915, 2.374695, 1, 1, 1, 1, 1,
0.4874551, 0.6912403, -0.8506024, 1, 1, 1, 1, 1,
0.4879651, -0.1368553, 2.674039, 1, 1, 1, 1, 1,
0.4893251, -1.225673, 3.521165, 1, 1, 1, 1, 1,
0.491325, 0.8558921, 1.880266, 1, 1, 1, 1, 1,
0.4934298, -0.8450938, 2.794389, 1, 1, 1, 1, 1,
0.494509, -0.1442392, 2.41364, 0, 0, 1, 1, 1,
0.4991539, -1.525706, 4.161138, 1, 0, 0, 1, 1,
0.5020034, -0.3275992, 1.30348, 1, 0, 0, 1, 1,
0.5038849, 1.057371, -1.068152, 1, 0, 0, 1, 1,
0.5040385, -0.6029037, 0.5007649, 1, 0, 0, 1, 1,
0.5122333, 0.8187388, -0.1128602, 1, 0, 0, 1, 1,
0.5132581, -0.772891, 2.250673, 0, 0, 0, 1, 1,
0.5145631, 0.315609, 0.7618564, 0, 0, 0, 1, 1,
0.5149862, 1.981634, -0.3193842, 0, 0, 0, 1, 1,
0.5150304, 1.672076, -0.3087156, 0, 0, 0, 1, 1,
0.5227442, 1.322782, 0.5879232, 0, 0, 0, 1, 1,
0.5238929, 1.000053, -1.387917, 0, 0, 0, 1, 1,
0.5239509, -0.2994367, 1.469625, 0, 0, 0, 1, 1,
0.5243378, -0.06642019, 1.831571, 1, 1, 1, 1, 1,
0.5245958, -2.095551, 2.489541, 1, 1, 1, 1, 1,
0.5257239, -0.08987952, 1.462789, 1, 1, 1, 1, 1,
0.5327235, -0.2341239, 1.811386, 1, 1, 1, 1, 1,
0.5360014, 0.674024, 0.6855508, 1, 1, 1, 1, 1,
0.5392684, -1.991785, 2.840806, 1, 1, 1, 1, 1,
0.551744, 0.09454053, 0.6244562, 1, 1, 1, 1, 1,
0.5540149, -0.4620647, 1.311365, 1, 1, 1, 1, 1,
0.558897, 0.3468451, 1.58491, 1, 1, 1, 1, 1,
0.5608898, -0.2995507, 0.7134551, 1, 1, 1, 1, 1,
0.5624967, -2.330871, 2.961356, 1, 1, 1, 1, 1,
0.5659595, -1.060972, 2.126295, 1, 1, 1, 1, 1,
0.57234, 2.150965, 0.3818724, 1, 1, 1, 1, 1,
0.5750108, 0.09355316, -0.4419351, 1, 1, 1, 1, 1,
0.5755524, 0.2290614, 2.174415, 1, 1, 1, 1, 1,
0.5788236, 0.2478744, -0.9225466, 0, 0, 1, 1, 1,
0.5802736, 1.617788, 1.150362, 1, 0, 0, 1, 1,
0.5821037, 0.6118439, 1.721541, 1, 0, 0, 1, 1,
0.5853476, -0.03675295, 0.2600542, 1, 0, 0, 1, 1,
0.5861398, 1.738709, 1.184812, 1, 0, 0, 1, 1,
0.5874575, 0.7391654, 0.9744397, 1, 0, 0, 1, 1,
0.5879242, -1.197609, 3.314249, 0, 0, 0, 1, 1,
0.5903412, -2.174407, 1.05661, 0, 0, 0, 1, 1,
0.5958406, -0.9506607, 4.326073, 0, 0, 0, 1, 1,
0.5964248, 0.771498, 1.823208, 0, 0, 0, 1, 1,
0.5983807, -0.2460556, 2.463527, 0, 0, 0, 1, 1,
0.6053122, 0.4366493, 1.678042, 0, 0, 0, 1, 1,
0.6193843, 0.8075333, -0.3728213, 0, 0, 0, 1, 1,
0.6223243, -0.2634024, 2.232703, 1, 1, 1, 1, 1,
0.6224062, -0.3390565, 1.202339, 1, 1, 1, 1, 1,
0.6239791, 1.702755, -0.41289, 1, 1, 1, 1, 1,
0.627966, 0.006602525, 0.6014888, 1, 1, 1, 1, 1,
0.6295362, -1.210492, 3.517672, 1, 1, 1, 1, 1,
0.6316425, -0.4702303, 2.258533, 1, 1, 1, 1, 1,
0.6322992, 0.3631096, 2.122738, 1, 1, 1, 1, 1,
0.6333137, -0.8367881, 2.617718, 1, 1, 1, 1, 1,
0.6414897, -1.837787, 5.006108, 1, 1, 1, 1, 1,
0.6415531, -2.809507, 2.638389, 1, 1, 1, 1, 1,
0.6421208, 0.2407842, -0.3846279, 1, 1, 1, 1, 1,
0.6450624, -1.307178, 2.92331, 1, 1, 1, 1, 1,
0.6458627, -1.750245, 1.869935, 1, 1, 1, 1, 1,
0.6468025, 0.6081958, 0.1317829, 1, 1, 1, 1, 1,
0.6481046, -0.4765106, 3.039985, 1, 1, 1, 1, 1,
0.6515208, -0.9816952, 1.674843, 0, 0, 1, 1, 1,
0.6518897, 0.809687, 0.7883359, 1, 0, 0, 1, 1,
0.6528623, 0.6302792, 1.365971, 1, 0, 0, 1, 1,
0.65522, 0.3686191, 1.422166, 1, 0, 0, 1, 1,
0.655734, -0.5563916, 2.858233, 1, 0, 0, 1, 1,
0.6559452, 0.4618106, 1.787943, 1, 0, 0, 1, 1,
0.6595675, 1.373454, 0.14093, 0, 0, 0, 1, 1,
0.6669081, -0.764324, 2.129957, 0, 0, 0, 1, 1,
0.6692883, -0.4126624, 3.26308, 0, 0, 0, 1, 1,
0.6692892, -1.675363, 3.413653, 0, 0, 0, 1, 1,
0.6694517, 0.7118621, 0.6895711, 0, 0, 0, 1, 1,
0.6733263, 2.103333, -0.3259487, 0, 0, 0, 1, 1,
0.6756959, -0.2326115, 1.457635, 0, 0, 0, 1, 1,
0.6759716, -0.657579, 3.249277, 1, 1, 1, 1, 1,
0.6797979, -0.1719983, 3.468289, 1, 1, 1, 1, 1,
0.6799025, 0.1552255, 0.749811, 1, 1, 1, 1, 1,
0.6808788, -0.3508202, 3.283949, 1, 1, 1, 1, 1,
0.6863816, 3.148512, 0.2055082, 1, 1, 1, 1, 1,
0.6903271, 0.2417939, 1.495607, 1, 1, 1, 1, 1,
0.6956567, 0.4919839, 2.062937, 1, 1, 1, 1, 1,
0.6983607, 1.117052, 1.012633, 1, 1, 1, 1, 1,
0.6998056, -0.3695655, 0.8150007, 1, 1, 1, 1, 1,
0.7001022, -0.109018, 0.9596189, 1, 1, 1, 1, 1,
0.7009712, -0.1758165, 1.722624, 1, 1, 1, 1, 1,
0.7012389, -1.136806, 3.143467, 1, 1, 1, 1, 1,
0.7014344, 1.571773, -0.3854596, 1, 1, 1, 1, 1,
0.7018034, -0.9297275, 4.795261, 1, 1, 1, 1, 1,
0.7041637, 0.2137561, 1.11669, 1, 1, 1, 1, 1,
0.708989, 0.1840618, 0.549764, 0, 0, 1, 1, 1,
0.711109, 0.02832153, 1.034594, 1, 0, 0, 1, 1,
0.7142801, 1.954248, 1.559161, 1, 0, 0, 1, 1,
0.7191845, -0.4977823, 1.590046, 1, 0, 0, 1, 1,
0.7228336, 1.018451, 2.209734, 1, 0, 0, 1, 1,
0.7262478, -0.04458085, 0.4238556, 1, 0, 0, 1, 1,
0.726308, -0.6146599, 3.033362, 0, 0, 0, 1, 1,
0.7272034, -1.078511, 3.410137, 0, 0, 0, 1, 1,
0.7313026, 1.347833, 0.8007225, 0, 0, 0, 1, 1,
0.7359728, 1.259735, 1.093093, 0, 0, 0, 1, 1,
0.7378643, -0.410942, 1.314509, 0, 0, 0, 1, 1,
0.7379078, 1.06341, -0.7607519, 0, 0, 0, 1, 1,
0.7423502, 0.4837415, 1.076023, 0, 0, 0, 1, 1,
0.7429962, -0.01930318, 2.922336, 1, 1, 1, 1, 1,
0.7463405, -0.4029164, 2.371647, 1, 1, 1, 1, 1,
0.7464176, 0.05064382, 1.414523, 1, 1, 1, 1, 1,
0.7593671, 0.01189958, -1.380145, 1, 1, 1, 1, 1,
0.7595006, -0.6350387, 2.292757, 1, 1, 1, 1, 1,
0.7654231, -0.34381, 2.667575, 1, 1, 1, 1, 1,
0.7722331, -1.586811, 2.046811, 1, 1, 1, 1, 1,
0.7807335, -0.9187517, 0.5611721, 1, 1, 1, 1, 1,
0.7869184, 1.503841, 0.2192467, 1, 1, 1, 1, 1,
0.7896065, 0.9835449, 0.5300168, 1, 1, 1, 1, 1,
0.8053082, 0.1970443, 1.267877, 1, 1, 1, 1, 1,
0.8087355, 0.808648, 1.307011, 1, 1, 1, 1, 1,
0.8090153, -0.3334013, 0.7282279, 1, 1, 1, 1, 1,
0.8109605, -0.5045482, 1.370322, 1, 1, 1, 1, 1,
0.8143511, -0.4337186, 3.09514, 1, 1, 1, 1, 1,
0.8146416, 0.04399371, 1.187674, 0, 0, 1, 1, 1,
0.8180339, 2.121238, 3.487155, 1, 0, 0, 1, 1,
0.823153, -0.4443077, 1.354947, 1, 0, 0, 1, 1,
0.8294243, -0.720212, 2.732117, 1, 0, 0, 1, 1,
0.8298127, -0.01628741, 1.229936, 1, 0, 0, 1, 1,
0.830429, -1.175419, 2.286359, 1, 0, 0, 1, 1,
0.8317996, 0.9338456, 0.2100818, 0, 0, 0, 1, 1,
0.8331612, -0.2996439, 1.942768, 0, 0, 0, 1, 1,
0.8336368, -1.111141, 2.706011, 0, 0, 0, 1, 1,
0.8453774, -0.147127, 3.114455, 0, 0, 0, 1, 1,
0.8486351, 0.2223797, 2.002748, 0, 0, 0, 1, 1,
0.8575508, 0.1688965, 0.5302156, 0, 0, 0, 1, 1,
0.8577707, 0.09033337, 0.793693, 0, 0, 0, 1, 1,
0.858636, 1.328376, 1.034621, 1, 1, 1, 1, 1,
0.8604401, 0.7557396, 0.8636216, 1, 1, 1, 1, 1,
0.8660206, 2.303611, 0.02642846, 1, 1, 1, 1, 1,
0.8676583, 0.7662036, 2.192393, 1, 1, 1, 1, 1,
0.8761226, -0.8813149, 1.137477, 1, 1, 1, 1, 1,
0.8791503, -0.5852295, 2.024736, 1, 1, 1, 1, 1,
0.8807528, -1.422214, 2.45588, 1, 1, 1, 1, 1,
0.8831118, 1.36553, 0.5555915, 1, 1, 1, 1, 1,
0.883774, 1.209052, 0.5802327, 1, 1, 1, 1, 1,
0.8861324, 1.342001, 1.225138, 1, 1, 1, 1, 1,
0.8881676, -1.870089, 4.551698, 1, 1, 1, 1, 1,
0.8925782, -0.09298745, 0.3183376, 1, 1, 1, 1, 1,
0.8951754, -2.141123, 1.194656, 1, 1, 1, 1, 1,
0.8995632, 0.8323745, -0.4654889, 1, 1, 1, 1, 1,
0.9037036, 2.015093, 0.4295079, 1, 1, 1, 1, 1,
0.9056128, -0.4624741, 1.31903, 0, 0, 1, 1, 1,
0.9086397, -0.09595689, -0.5699086, 1, 0, 0, 1, 1,
0.9219826, 1.063302, -0.2598372, 1, 0, 0, 1, 1,
0.9233352, -0.3683573, 2.697577, 1, 0, 0, 1, 1,
0.924208, 1.256647, 1.723781, 1, 0, 0, 1, 1,
0.9345253, -0.5515749, 0.2832838, 1, 0, 0, 1, 1,
0.9383597, -0.3008979, 1.516066, 0, 0, 0, 1, 1,
0.938457, -0.2521022, 1.184203, 0, 0, 0, 1, 1,
0.9432902, 1.129171, 1.790499, 0, 0, 0, 1, 1,
0.9575199, 0.9568685, 2.446184, 0, 0, 0, 1, 1,
0.9580535, -0.281238, 0.3311052, 0, 0, 0, 1, 1,
0.9600748, 0.509074, 0.4286699, 0, 0, 0, 1, 1,
0.9639044, 0.6394483, 1.431101, 0, 0, 0, 1, 1,
0.9732293, -0.4188073, 2.588245, 1, 1, 1, 1, 1,
0.983532, -0.8889536, 1.196149, 1, 1, 1, 1, 1,
0.9847194, 0.8123718, -1.453304, 1, 1, 1, 1, 1,
0.9857304, -1.890625, 3.583984, 1, 1, 1, 1, 1,
0.9858869, 1.798561, 0.6958011, 1, 1, 1, 1, 1,
0.9926702, -0.1499173, 2.615803, 1, 1, 1, 1, 1,
0.9976075, 0.005728578, 2.93028, 1, 1, 1, 1, 1,
1.004674, 2.159964, 0.7881067, 1, 1, 1, 1, 1,
1.007565, 0.2371915, 0.5971158, 1, 1, 1, 1, 1,
1.007727, -0.9530587, 3.284082, 1, 1, 1, 1, 1,
1.008777, -0.3062096, 2.789032, 1, 1, 1, 1, 1,
1.011706, -1.062167, 3.361943, 1, 1, 1, 1, 1,
1.01668, -0.4101616, 2.888126, 1, 1, 1, 1, 1,
1.018663, 0.4125011, -0.6834361, 1, 1, 1, 1, 1,
1.031373, -0.3015342, 3.036493, 1, 1, 1, 1, 1,
1.033595, 0.196218, 1.242746, 0, 0, 1, 1, 1,
1.046107, -0.4366128, 3.050359, 1, 0, 0, 1, 1,
1.054327, -0.05020082, 0.7705479, 1, 0, 0, 1, 1,
1.060526, -0.5366687, 2.543066, 1, 0, 0, 1, 1,
1.060751, 0.005799697, 1.963272, 1, 0, 0, 1, 1,
1.061112, 1.283348, 0.5791726, 1, 0, 0, 1, 1,
1.062221, -0.3210926, 2.228904, 0, 0, 0, 1, 1,
1.072356, 0.4133377, 0.3665613, 0, 0, 0, 1, 1,
1.073903, 0.9730269, -0.7494315, 0, 0, 0, 1, 1,
1.074025, 0.7795649, 0.852617, 0, 0, 0, 1, 1,
1.075562, 0.5075073, 0.03612583, 0, 0, 0, 1, 1,
1.079748, 0.7886298, 0.6428741, 0, 0, 0, 1, 1,
1.081611, -1.717647, 2.892206, 0, 0, 0, 1, 1,
1.082278, 0.8277425, 2.325253, 1, 1, 1, 1, 1,
1.092121, -0.163853, 0.8517572, 1, 1, 1, 1, 1,
1.092829, 0.3552022, 0.1558505, 1, 1, 1, 1, 1,
1.099382, -0.7652312, 3.221107, 1, 1, 1, 1, 1,
1.102763, 0.8322517, 1.250901, 1, 1, 1, 1, 1,
1.107952, 2.360441, 0.997591, 1, 1, 1, 1, 1,
1.110288, 0.4583656, 0.5441085, 1, 1, 1, 1, 1,
1.114348, -0.4458439, 0.9627004, 1, 1, 1, 1, 1,
1.116655, -0.20191, 3.210181, 1, 1, 1, 1, 1,
1.121395, 0.3657512, 0.4533339, 1, 1, 1, 1, 1,
1.131397, -1.066053, 0.6982687, 1, 1, 1, 1, 1,
1.135127, -0.7821835, 3.689516, 1, 1, 1, 1, 1,
1.135839, 0.8940181, 2.469946, 1, 1, 1, 1, 1,
1.13781, -0.03726912, 0.5686985, 1, 1, 1, 1, 1,
1.15445, -1.188772, 1.063023, 1, 1, 1, 1, 1,
1.163093, 1.135925, 0.6745707, 0, 0, 1, 1, 1,
1.166006, -1.776736, 2.854798, 1, 0, 0, 1, 1,
1.169984, 1.174414, 0.7969711, 1, 0, 0, 1, 1,
1.172962, -1.218175, 0.9906026, 1, 0, 0, 1, 1,
1.181187, 1.433178, 1.44017, 1, 0, 0, 1, 1,
1.183434, 0.1607631, 2.029417, 1, 0, 0, 1, 1,
1.194704, -1.107548, 3.163314, 0, 0, 0, 1, 1,
1.199726, -0.6027393, 3.446423, 0, 0, 0, 1, 1,
1.200637, -0.7879696, 2.895685, 0, 0, 0, 1, 1,
1.203516, -0.07665449, 3.053957, 0, 0, 0, 1, 1,
1.21326, -0.5219448, 1.68794, 0, 0, 0, 1, 1,
1.223715, -0.4867394, 2.907979, 0, 0, 0, 1, 1,
1.224738, -1.595249, 2.901583, 0, 0, 0, 1, 1,
1.22916, -0.06454373, 0.6944052, 1, 1, 1, 1, 1,
1.235229, 0.8563177, 1.14777, 1, 1, 1, 1, 1,
1.235485, -0.8422327, 2.488058, 1, 1, 1, 1, 1,
1.240405, -1.08635, 2.735429, 1, 1, 1, 1, 1,
1.245684, -0.1297135, 0.4527147, 1, 1, 1, 1, 1,
1.24896, 1.467412, -0.1863296, 1, 1, 1, 1, 1,
1.253881, 0.4747689, 1.231677, 1, 1, 1, 1, 1,
1.256557, 1.088326, 0.4617802, 1, 1, 1, 1, 1,
1.257966, 0.2100919, 1.271382, 1, 1, 1, 1, 1,
1.259411, 1.168695, 2.70452, 1, 1, 1, 1, 1,
1.265909, 0.4932973, 3.473603, 1, 1, 1, 1, 1,
1.268571, -0.7827064, 2.108976, 1, 1, 1, 1, 1,
1.271888, -2.5281, 1.556248, 1, 1, 1, 1, 1,
1.275995, 1.046551, -1.128165, 1, 1, 1, 1, 1,
1.285579, -0.511549, 2.809897, 1, 1, 1, 1, 1,
1.293086, 0.2289186, 1.213716, 0, 0, 1, 1, 1,
1.295007, 0.769323, 0.8313395, 1, 0, 0, 1, 1,
1.295297, 1.856791, -1.247637, 1, 0, 0, 1, 1,
1.295908, 0.843587, -0.4333301, 1, 0, 0, 1, 1,
1.301389, -1.217112, 1.213606, 1, 0, 0, 1, 1,
1.315475, -0.6430089, 2.38264, 1, 0, 0, 1, 1,
1.318583, 0.2980288, 3.034878, 0, 0, 0, 1, 1,
1.320091, -0.1471947, 2.302159, 0, 0, 0, 1, 1,
1.32035, -0.02934418, 2.432959, 0, 0, 0, 1, 1,
1.326789, 1.947136, 0.6825982, 0, 0, 0, 1, 1,
1.332419, 1.405171, 1.662103, 0, 0, 0, 1, 1,
1.349805, -0.6679813, 1.668038, 0, 0, 0, 1, 1,
1.353873, -1.632223, 3.274035, 0, 0, 0, 1, 1,
1.368311, -0.7100502, 3.71933, 1, 1, 1, 1, 1,
1.373815, 0.2713052, 1.051265, 1, 1, 1, 1, 1,
1.37438, -0.1760972, 1.513028, 1, 1, 1, 1, 1,
1.386061, -0.3395184, 3.395139, 1, 1, 1, 1, 1,
1.392421, -1.443473, 3.36355, 1, 1, 1, 1, 1,
1.395907, 1.607647, 1.726963, 1, 1, 1, 1, 1,
1.401883, -1.332785, 1.003015, 1, 1, 1, 1, 1,
1.424976, 0.391926, 2.339546, 1, 1, 1, 1, 1,
1.425699, -0.3604057, 1.646187, 1, 1, 1, 1, 1,
1.429949, -0.8571441, 3.002297, 1, 1, 1, 1, 1,
1.438225, -0.5264322, 2.816598, 1, 1, 1, 1, 1,
1.446014, -0.9052313, 1.643755, 1, 1, 1, 1, 1,
1.446358, -0.6698993, 2.622598, 1, 1, 1, 1, 1,
1.451049, 0.5515499, 0.781987, 1, 1, 1, 1, 1,
1.458237, 0.9558953, 0.3185766, 1, 1, 1, 1, 1,
1.464788, 0.8922057, 1.746662, 0, 0, 1, 1, 1,
1.475481, 0.1560161, 1.390044, 1, 0, 0, 1, 1,
1.482989, 0.7871979, 1.840485, 1, 0, 0, 1, 1,
1.488587, 0.6268503, 2.905854, 1, 0, 0, 1, 1,
1.495267, 0.163795, 2.101439, 1, 0, 0, 1, 1,
1.505178, 1.579568, 0.3722775, 1, 0, 0, 1, 1,
1.505424, -0.03734325, -0.02915991, 0, 0, 0, 1, 1,
1.509938, 0.004175402, 0.6726257, 0, 0, 0, 1, 1,
1.51675, 0.4719085, 0.6075501, 0, 0, 0, 1, 1,
1.526844, 0.9776993, 1.040318, 0, 0, 0, 1, 1,
1.532346, -1.36167, 1.724262, 0, 0, 0, 1, 1,
1.541523, 0.07797582, 2.056981, 0, 0, 0, 1, 1,
1.541855, 0.2279631, 0.2935372, 0, 0, 0, 1, 1,
1.552558, -0.9066491, 1.511268, 1, 1, 1, 1, 1,
1.557001, 0.5551701, -0.1692976, 1, 1, 1, 1, 1,
1.562618, 1.098211, 2.376836, 1, 1, 1, 1, 1,
1.566087, 0.5344944, 0.6782575, 1, 1, 1, 1, 1,
1.568209, 0.05993722, 1.650461, 1, 1, 1, 1, 1,
1.57249, -0.4464346, 0.5001107, 1, 1, 1, 1, 1,
1.577058, -0.3487069, 2.805643, 1, 1, 1, 1, 1,
1.610578, -0.736366, -0.04576664, 1, 1, 1, 1, 1,
1.611315, 0.5152842, 1.00413, 1, 1, 1, 1, 1,
1.618955, 0.6000248, 2.391844, 1, 1, 1, 1, 1,
1.656855, -1.503931, 2.23894, 1, 1, 1, 1, 1,
1.666305, 0.9794261, 1.552341, 1, 1, 1, 1, 1,
1.674797, 0.4559008, 1.722408, 1, 1, 1, 1, 1,
1.678749, -0.3160866, 0.8563574, 1, 1, 1, 1, 1,
1.678825, -0.1228924, 3.132771, 1, 1, 1, 1, 1,
1.681513, -0.3037724, 0.159237, 0, 0, 1, 1, 1,
1.681899, -1.4197, 1.781337, 1, 0, 0, 1, 1,
1.693995, -0.02287845, 0.8530352, 1, 0, 0, 1, 1,
1.702836, 0.1890025, 1.912563, 1, 0, 0, 1, 1,
1.714978, 0.426247, 1.715494, 1, 0, 0, 1, 1,
1.721752, 1.618747, 0.02406211, 1, 0, 0, 1, 1,
1.736911, -0.3899788, 1.751669, 0, 0, 0, 1, 1,
1.751906, -0.2634885, 2.041685, 0, 0, 0, 1, 1,
1.758556, 0.6580973, 0.6395136, 0, 0, 0, 1, 1,
1.782504, 1.111009, 1.618022, 0, 0, 0, 1, 1,
1.782731, 1.002638, -0.6285932, 0, 0, 0, 1, 1,
1.809813, -0.5594253, -0.09404629, 0, 0, 0, 1, 1,
1.813751, 0.06313987, 3.009259, 0, 0, 0, 1, 1,
1.816234, -0.1160498, 0.2780984, 1, 1, 1, 1, 1,
1.825408, 0.8137457, 2.047369, 1, 1, 1, 1, 1,
1.837508, -0.6266329, 3.610897, 1, 1, 1, 1, 1,
1.838692, 0.2039307, 0.7376513, 1, 1, 1, 1, 1,
1.84739, 0.9948043, -0.3303423, 1, 1, 1, 1, 1,
1.851733, -0.03442117, 2.808318, 1, 1, 1, 1, 1,
1.899145, -1.047669, 1.504337, 1, 1, 1, 1, 1,
1.938581, 1.368217, 1.248803, 1, 1, 1, 1, 1,
1.941484, -1.436126, 1.203183, 1, 1, 1, 1, 1,
1.94772, 0.4489531, 1.990763, 1, 1, 1, 1, 1,
1.963549, 1.617996, 1.659932, 1, 1, 1, 1, 1,
1.996257, 1.35224, -0.1688919, 1, 1, 1, 1, 1,
2.00297, -0.4682884, -1.059255, 1, 1, 1, 1, 1,
2.035073, -0.03702005, 0.8546942, 1, 1, 1, 1, 1,
2.074506, 0.3482526, 1.729285, 1, 1, 1, 1, 1,
2.12607, -1.482259, 1.227286, 0, 0, 1, 1, 1,
2.147328, 1.328785, 1.310708, 1, 0, 0, 1, 1,
2.153635, -1.167683, 2.970067, 1, 0, 0, 1, 1,
2.211825, -0.6532139, 1.573007, 1, 0, 0, 1, 1,
2.222436, 0.3022729, 1.469462, 1, 0, 0, 1, 1,
2.247071, -0.09651124, 1.943815, 1, 0, 0, 1, 1,
2.259043, -1.204514, 1.972957, 0, 0, 0, 1, 1,
2.304767, -1.266926, 2.462613, 0, 0, 0, 1, 1,
2.328305, -0.8745061, 3.287104, 0, 0, 0, 1, 1,
2.358682, 0.06009969, 1.584423, 0, 0, 0, 1, 1,
2.360855, 0.6053564, 1.176092, 0, 0, 0, 1, 1,
2.38022, -1.481739, 1.193101, 0, 0, 0, 1, 1,
2.402324, -0.3175189, 1.481925, 0, 0, 0, 1, 1,
2.427536, 1.259969, 1.308016, 1, 1, 1, 1, 1,
2.514534, -0.1641901, 0.5419996, 1, 1, 1, 1, 1,
2.520234, 0.3746118, 2.087174, 1, 1, 1, 1, 1,
2.568054, -0.6802016, 2.197678, 1, 1, 1, 1, 1,
2.599879, 0.02233671, 1.110976, 1, 1, 1, 1, 1,
2.696317, 0.4140722, -0.3158672, 1, 1, 1, 1, 1,
2.849928, -1.161475, 1.003763, 1, 1, 1, 1, 1
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
var radius = 9.560128;
var distance = 33.57954;
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
mvMatrix.translate( 0.05449486, -0.06160665, 0.01083422 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57954);
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