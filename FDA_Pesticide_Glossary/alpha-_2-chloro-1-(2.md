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
-3.127349, -0.03668598, -1.846193, 1, 0, 0, 1,
-3.015566, -0.3344434, -1.78063, 1, 0.007843138, 0, 1,
-2.869597, -0.510466, -0.04017391, 1, 0.01176471, 0, 1,
-2.843609, 0.3298731, 0.8169077, 1, 0.01960784, 0, 1,
-2.759581, 0.8265339, -0.2760693, 1, 0.02352941, 0, 1,
-2.666049, -1.348862, -2.575386, 1, 0.03137255, 0, 1,
-2.606158, -0.716131, -1.867821, 1, 0.03529412, 0, 1,
-2.591232, 0.8806394, -0.3690239, 1, 0.04313726, 0, 1,
-2.435088, -0.8547941, -1.322162, 1, 0.04705882, 0, 1,
-2.360759, 0.5915432, -1.371637, 1, 0.05490196, 0, 1,
-2.290874, 0.1865974, -2.602603, 1, 0.05882353, 0, 1,
-2.217373, -0.8532885, -4.549503, 1, 0.06666667, 0, 1,
-2.154486, 2.106627, -0.8279366, 1, 0.07058824, 0, 1,
-2.065145, 0.943615, -0.6123938, 1, 0.07843138, 0, 1,
-2.060012, 0.7123764, 0.4327675, 1, 0.08235294, 0, 1,
-2.056431, 0.3368962, -3.998657, 1, 0.09019608, 0, 1,
-2.034451, 0.09599826, -2.866252, 1, 0.09411765, 0, 1,
-2.007983, 0.05417177, 0.2225852, 1, 0.1019608, 0, 1,
-2.000225, -1.589374, -3.493468, 1, 0.1098039, 0, 1,
-1.977023, -0.2248379, -2.185359, 1, 0.1137255, 0, 1,
-1.951625, 0.5047391, -2.026338, 1, 0.1215686, 0, 1,
-1.951079, 0.8381876, -2.499836, 1, 0.1254902, 0, 1,
-1.951059, -0.3054103, -0.9473667, 1, 0.1333333, 0, 1,
-1.939572, -1.418093, -2.13395, 1, 0.1372549, 0, 1,
-1.919714, -1.377194, -3.586677, 1, 0.145098, 0, 1,
-1.903806, -0.436153, 0.2664792, 1, 0.1490196, 0, 1,
-1.894265, 0.00325021, -3.210023, 1, 0.1568628, 0, 1,
-1.878652, 0.2882285, -1.641625, 1, 0.1607843, 0, 1,
-1.858055, 0.4031025, -1.356568, 1, 0.1686275, 0, 1,
-1.848318, 0.2112282, -0.4398492, 1, 0.172549, 0, 1,
-1.841087, 0.6362332, 0.7839142, 1, 0.1803922, 0, 1,
-1.840229, 0.2860709, -0.7587329, 1, 0.1843137, 0, 1,
-1.83472, -1.772785, -3.257051, 1, 0.1921569, 0, 1,
-1.830602, 1.782878, 0.8637748, 1, 0.1960784, 0, 1,
-1.824896, 0.1864045, -1.570281, 1, 0.2039216, 0, 1,
-1.796407, 0.5693871, 0.7629732, 1, 0.2117647, 0, 1,
-1.794794, -0.2557007, -0.6718436, 1, 0.2156863, 0, 1,
-1.784514, 0.9164627, -2.062338, 1, 0.2235294, 0, 1,
-1.76491, -1.987886, -3.330457, 1, 0.227451, 0, 1,
-1.758089, 0.2519981, -1.376969, 1, 0.2352941, 0, 1,
-1.753509, 1.206983, -1.56742, 1, 0.2392157, 0, 1,
-1.745647, 0.8271943, -2.002773, 1, 0.2470588, 0, 1,
-1.738764, -1.416367, -1.203417, 1, 0.2509804, 0, 1,
-1.717747, -1.175232, -3.753788, 1, 0.2588235, 0, 1,
-1.698756, -0.6874066, -3.533462, 1, 0.2627451, 0, 1,
-1.68806, -1.000202, -4.668926, 1, 0.2705882, 0, 1,
-1.662065, 0.504091, -1.05623, 1, 0.2745098, 0, 1,
-1.644229, 0.2667424, -0.8448721, 1, 0.282353, 0, 1,
-1.641875, -0.2338945, -1.982771, 1, 0.2862745, 0, 1,
-1.64146, -0.8985102, -2.411258, 1, 0.2941177, 0, 1,
-1.6398, 0.07977234, -1.288486, 1, 0.3019608, 0, 1,
-1.621081, 0.4481739, -1.114464, 1, 0.3058824, 0, 1,
-1.603287, 1.039636, 0.4950885, 1, 0.3137255, 0, 1,
-1.582604, -0.7728363, -2.893399, 1, 0.3176471, 0, 1,
-1.566311, -0.3421718, -1.277537, 1, 0.3254902, 0, 1,
-1.54548, 1.106525, -1.798308, 1, 0.3294118, 0, 1,
-1.544076, 0.7750691, -1.370575, 1, 0.3372549, 0, 1,
-1.530059, 1.456792, -0.9459244, 1, 0.3411765, 0, 1,
-1.529052, 0.3699883, -1.639253, 1, 0.3490196, 0, 1,
-1.52459, 0.4753635, 0.4469689, 1, 0.3529412, 0, 1,
-1.511381, -0.1629183, -0.8217298, 1, 0.3607843, 0, 1,
-1.495087, 0.1089829, -2.208322, 1, 0.3647059, 0, 1,
-1.490323, 0.4774661, -1.495607, 1, 0.372549, 0, 1,
-1.486044, 0.8293008, 0.0008535096, 1, 0.3764706, 0, 1,
-1.484148, -0.3370791, -1.388729, 1, 0.3843137, 0, 1,
-1.482116, 0.3326015, -1.669703, 1, 0.3882353, 0, 1,
-1.467126, -0.7528386, -2.174957, 1, 0.3960784, 0, 1,
-1.429349, -0.4466364, -1.486237, 1, 0.4039216, 0, 1,
-1.423527, -1.330254, -2.979622, 1, 0.4078431, 0, 1,
-1.421857, 1.243345, -0.9017724, 1, 0.4156863, 0, 1,
-1.419351, -0.1310576, -2.141428, 1, 0.4196078, 0, 1,
-1.416564, 1.465737, -1.801839, 1, 0.427451, 0, 1,
-1.416546, 0.414176, -1.612577, 1, 0.4313726, 0, 1,
-1.412661, 1.194388, -1.865417, 1, 0.4392157, 0, 1,
-1.405338, -0.1756279, -2.060662, 1, 0.4431373, 0, 1,
-1.404042, -0.5676984, 0.05490573, 1, 0.4509804, 0, 1,
-1.384962, 0.4564144, -1.234852, 1, 0.454902, 0, 1,
-1.369622, -1.799873, -1.541172, 1, 0.4627451, 0, 1,
-1.366314, 0.4891781, -0.9196381, 1, 0.4666667, 0, 1,
-1.353004, 0.2933199, 0.3997017, 1, 0.4745098, 0, 1,
-1.351016, -1.436452, -2.595403, 1, 0.4784314, 0, 1,
-1.347905, 0.0923657, -1.588347, 1, 0.4862745, 0, 1,
-1.346969, -0.8473923, -2.988096, 1, 0.4901961, 0, 1,
-1.346807, 0.5121143, -0.5033571, 1, 0.4980392, 0, 1,
-1.341695, -1.834361, -1.667883, 1, 0.5058824, 0, 1,
-1.340271, -0.4140909, -1.815583, 1, 0.509804, 0, 1,
-1.33856, -0.3633234, 0.102388, 1, 0.5176471, 0, 1,
-1.336372, -1.122702, -1.924273, 1, 0.5215687, 0, 1,
-1.3342, -0.1576439, -0.8518656, 1, 0.5294118, 0, 1,
-1.323827, 1.031193, -0.155496, 1, 0.5333334, 0, 1,
-1.313291, -0.03091453, -3.469108, 1, 0.5411765, 0, 1,
-1.311971, 1.683747, -2.101445, 1, 0.5450981, 0, 1,
-1.311273, -1.106574, -1.580657, 1, 0.5529412, 0, 1,
-1.309498, -1.971112, -3.715572, 1, 0.5568628, 0, 1,
-1.307305, -0.4579058, -2.674177, 1, 0.5647059, 0, 1,
-1.305961, 0.2067418, -2.112963, 1, 0.5686275, 0, 1,
-1.304093, -0.5199115, -1.890977, 1, 0.5764706, 0, 1,
-1.291107, -0.9009647, -0.9189076, 1, 0.5803922, 0, 1,
-1.285354, -0.1864824, -2.14284, 1, 0.5882353, 0, 1,
-1.281753, -0.4793487, -0.2405415, 1, 0.5921569, 0, 1,
-1.273049, -0.6484537, -0.1358558, 1, 0.6, 0, 1,
-1.261149, 0.4377781, -3.560414, 1, 0.6078432, 0, 1,
-1.257162, 0.1240528, -1.982683, 1, 0.6117647, 0, 1,
-1.251674, 0.6242967, -1.763592, 1, 0.6196079, 0, 1,
-1.249242, -1.022608, -1.539812, 1, 0.6235294, 0, 1,
-1.243457, -0.9240888, -2.14033, 1, 0.6313726, 0, 1,
-1.242797, -1.489964, -4.57329, 1, 0.6352941, 0, 1,
-1.242362, -0.08315215, -0.395801, 1, 0.6431373, 0, 1,
-1.226446, 1.561792, -0.7899273, 1, 0.6470588, 0, 1,
-1.223843, -0.4737205, -2.223178, 1, 0.654902, 0, 1,
-1.211044, -0.1292084, -2.285619, 1, 0.6588235, 0, 1,
-1.209006, 0.5097753, -1.225717, 1, 0.6666667, 0, 1,
-1.204618, 0.8388535, -1.123488, 1, 0.6705883, 0, 1,
-1.19725, 0.5157351, -1.836969, 1, 0.6784314, 0, 1,
-1.190675, 0.5218839, -0.6191043, 1, 0.682353, 0, 1,
-1.188035, 1.976005, -1.1908, 1, 0.6901961, 0, 1,
-1.169263, -1.424949, -2.643448, 1, 0.6941177, 0, 1,
-1.168913, -0.1769737, -2.283677, 1, 0.7019608, 0, 1,
-1.160868, -1.508111, -2.943146, 1, 0.7098039, 0, 1,
-1.155877, -0.1308526, -1.825543, 1, 0.7137255, 0, 1,
-1.154657, -0.5119107, -1.983676, 1, 0.7215686, 0, 1,
-1.152185, -0.3237667, -2.397855, 1, 0.7254902, 0, 1,
-1.149433, 0.3621987, -0.0955264, 1, 0.7333333, 0, 1,
-1.148282, 0.2013196, -1.414777, 1, 0.7372549, 0, 1,
-1.138798, -0.6599984, -1.186465, 1, 0.7450981, 0, 1,
-1.134984, 0.4423259, -0.7560809, 1, 0.7490196, 0, 1,
-1.133851, 0.3113211, -0.7135829, 1, 0.7568628, 0, 1,
-1.13302, 0.5177262, -0.8649178, 1, 0.7607843, 0, 1,
-1.127185, -0.08645204, -0.8306196, 1, 0.7686275, 0, 1,
-1.119578, 1.081943, 0.3036699, 1, 0.772549, 0, 1,
-1.117383, -0.0229436, -1.54415, 1, 0.7803922, 0, 1,
-1.111582, -1.280759, -1.392523, 1, 0.7843137, 0, 1,
-1.111563, -0.4381555, -1.447544, 1, 0.7921569, 0, 1,
-1.103586, -1.195438, -3.232495, 1, 0.7960784, 0, 1,
-1.100023, 0.9026772, -1.619138, 1, 0.8039216, 0, 1,
-1.093815, -1.107442, -4.33722, 1, 0.8117647, 0, 1,
-1.092052, -1.784178, -2.600834, 1, 0.8156863, 0, 1,
-1.087001, 0.1376672, -0.354306, 1, 0.8235294, 0, 1,
-1.082774, -0.9447536, -2.431117, 1, 0.827451, 0, 1,
-1.082509, -0.1577456, -1.228508, 1, 0.8352941, 0, 1,
-1.074936, -0.3838408, -0.5828582, 1, 0.8392157, 0, 1,
-1.069704, -0.6661357, -0.2102206, 1, 0.8470588, 0, 1,
-1.068162, -0.3018338, -1.505653, 1, 0.8509804, 0, 1,
-1.060945, 2.171106, 0.5218466, 1, 0.8588235, 0, 1,
-1.039552, 0.007343656, -1.416839, 1, 0.8627451, 0, 1,
-1.031397, 0.4510121, -0.5639587, 1, 0.8705882, 0, 1,
-1.031311, 0.4563215, -1.34736, 1, 0.8745098, 0, 1,
-1.017118, 2.169137, -0.6665212, 1, 0.8823529, 0, 1,
-1.015893, -0.1547782, -1.586918, 1, 0.8862745, 0, 1,
-1.015032, -1.619554, -2.158053, 1, 0.8941177, 0, 1,
-1.014903, 0.3270187, -0.5190932, 1, 0.8980392, 0, 1,
-1.013287, 0.7151701, 0.06831469, 1, 0.9058824, 0, 1,
-1.013004, 0.2817199, -0.5637703, 1, 0.9137255, 0, 1,
-1.012156, 1.079291, -0.637239, 1, 0.9176471, 0, 1,
-1.008072, -0.812661, -1.902329, 1, 0.9254902, 0, 1,
-1.000839, -0.09307383, -0.701543, 1, 0.9294118, 0, 1,
-1.000528, 0.5019908, 0.4170067, 1, 0.9372549, 0, 1,
-0.9961229, -0.1818761, -2.136443, 1, 0.9411765, 0, 1,
-0.9825214, -0.0485737, -1.145988, 1, 0.9490196, 0, 1,
-0.9806197, -2.974298, -3.709486, 1, 0.9529412, 0, 1,
-0.9769966, -0.4197832, -2.354448, 1, 0.9607843, 0, 1,
-0.9751275, -0.03629692, -0.7196234, 1, 0.9647059, 0, 1,
-0.9712902, -0.1659699, -2.427021, 1, 0.972549, 0, 1,
-0.9672968, 0.08475349, -0.6568921, 1, 0.9764706, 0, 1,
-0.9619079, 0.7433949, -1.694882, 1, 0.9843137, 0, 1,
-0.9476632, -0.207851, -1.029679, 1, 0.9882353, 0, 1,
-0.9262369, 1.923296, -1.238011, 1, 0.9960784, 0, 1,
-0.9256567, 0.7024875, -2.302708, 0.9960784, 1, 0, 1,
-0.9212425, 1.582824, -1.090971, 0.9921569, 1, 0, 1,
-0.9144737, -0.1801199, -1.039624, 0.9843137, 1, 0, 1,
-0.9099013, 0.270116, -1.647951, 0.9803922, 1, 0, 1,
-0.9084823, 0.4262484, -0.07842197, 0.972549, 1, 0, 1,
-0.9036726, 0.6538517, -1.893603, 0.9686275, 1, 0, 1,
-0.9035192, -0.4916033, -2.182623, 0.9607843, 1, 0, 1,
-0.9004343, -0.1974924, -1.595237, 0.9568627, 1, 0, 1,
-0.8912277, 0.5068378, -2.185382, 0.9490196, 1, 0, 1,
-0.8911916, 0.07859816, -2.287757, 0.945098, 1, 0, 1,
-0.8780167, -0.006667894, 0.53, 0.9372549, 1, 0, 1,
-0.8702223, 0.9754944, 1.018691, 0.9333333, 1, 0, 1,
-0.8624107, 1.050028, -2.075246, 0.9254902, 1, 0, 1,
-0.8593891, 2.099326, -0.288317, 0.9215686, 1, 0, 1,
-0.8567554, -0.5424712, -2.335442, 0.9137255, 1, 0, 1,
-0.8562106, -0.4807157, -0.8594069, 0.9098039, 1, 0, 1,
-0.8492849, 0.27027, -2.05511, 0.9019608, 1, 0, 1,
-0.8491081, 1.029913, 0.13902, 0.8941177, 1, 0, 1,
-0.8488618, -1.365294, -0.880311, 0.8901961, 1, 0, 1,
-0.8473037, -2.36952, -2.393662, 0.8823529, 1, 0, 1,
-0.8430228, -0.1497076, -0.2137659, 0.8784314, 1, 0, 1,
-0.8422611, 0.4013012, -1.805701, 0.8705882, 1, 0, 1,
-0.8403097, 0.8375778, -1.648692, 0.8666667, 1, 0, 1,
-0.8388532, 1.263301, -1.348019, 0.8588235, 1, 0, 1,
-0.8339666, -0.04235699, -1.861155, 0.854902, 1, 0, 1,
-0.8301876, 0.2557542, -2.886825, 0.8470588, 1, 0, 1,
-0.8293902, 1.091175, -0.3948887, 0.8431373, 1, 0, 1,
-0.8217362, -0.3525218, -3.151018, 0.8352941, 1, 0, 1,
-0.8216233, -0.1260072, -2.404284, 0.8313726, 1, 0, 1,
-0.8208458, 0.1142401, -2.977288, 0.8235294, 1, 0, 1,
-0.8190099, 1.356259, -1.731708, 0.8196079, 1, 0, 1,
-0.8127641, -2.126585, -1.809439, 0.8117647, 1, 0, 1,
-0.8084734, 0.313933, -1.389137, 0.8078431, 1, 0, 1,
-0.8074545, 0.2133938, -1.820101, 0.8, 1, 0, 1,
-0.8061066, 1.008854, -0.738391, 0.7921569, 1, 0, 1,
-0.8032493, -0.2786239, -2.016476, 0.7882353, 1, 0, 1,
-0.8003889, -0.3975937, -0.3897283, 0.7803922, 1, 0, 1,
-0.7996055, -0.844425, -2.148583, 0.7764706, 1, 0, 1,
-0.7935417, -0.585493, -2.016538, 0.7686275, 1, 0, 1,
-0.7930135, -0.3288534, -1.041286, 0.7647059, 1, 0, 1,
-0.7919627, -1.854381, -2.982795, 0.7568628, 1, 0, 1,
-0.7821505, -0.9540869, -1.193357, 0.7529412, 1, 0, 1,
-0.7789429, 0.9836271, -0.7635224, 0.7450981, 1, 0, 1,
-0.7753291, 0.969975, 0.6693154, 0.7411765, 1, 0, 1,
-0.7726498, -0.3953487, -3.185108, 0.7333333, 1, 0, 1,
-0.7659931, -0.04444129, -0.5994211, 0.7294118, 1, 0, 1,
-0.764325, -0.6515845, -3.376932, 0.7215686, 1, 0, 1,
-0.7578882, -1.219961, -3.118602, 0.7176471, 1, 0, 1,
-0.7562367, 0.9190587, -2.371712, 0.7098039, 1, 0, 1,
-0.7461357, 1.341354, 1.2725, 0.7058824, 1, 0, 1,
-0.7441595, -0.3172838, -2.494941, 0.6980392, 1, 0, 1,
-0.7437387, 1.253554, -0.7357312, 0.6901961, 1, 0, 1,
-0.7423128, -1.438299, -3.262215, 0.6862745, 1, 0, 1,
-0.7362906, -1.186894, -1.221053, 0.6784314, 1, 0, 1,
-0.734192, -0.9791533, -3.171073, 0.6745098, 1, 0, 1,
-0.7324944, -0.724986, -1.316582, 0.6666667, 1, 0, 1,
-0.7321708, -0.2084719, -2.757282, 0.6627451, 1, 0, 1,
-0.7271633, 1.208063, 0.63274, 0.654902, 1, 0, 1,
-0.7189434, 0.0449208, -2.303238, 0.6509804, 1, 0, 1,
-0.7146716, 0.3440602, -1.941831, 0.6431373, 1, 0, 1,
-0.7137398, 1.419245, -0.695322, 0.6392157, 1, 0, 1,
-0.7122765, 0.3665063, -0.7152497, 0.6313726, 1, 0, 1,
-0.7070455, 0.43071, -0.5883691, 0.627451, 1, 0, 1,
-0.7047795, 0.1834804, -0.6362025, 0.6196079, 1, 0, 1,
-0.698342, -1.86052, -2.207439, 0.6156863, 1, 0, 1,
-0.6966272, 1.612239, -0.762409, 0.6078432, 1, 0, 1,
-0.6943558, 0.2566749, -2.295314, 0.6039216, 1, 0, 1,
-0.6900692, -1.412709, -3.505313, 0.5960785, 1, 0, 1,
-0.6842723, -1.205784, -2.414412, 0.5882353, 1, 0, 1,
-0.6831428, 0.3944787, -0.6279605, 0.5843138, 1, 0, 1,
-0.6829342, 0.2108638, -0.3521882, 0.5764706, 1, 0, 1,
-0.6829035, -0.412669, -1.651445, 0.572549, 1, 0, 1,
-0.6805382, 1.779425, -0.5596384, 0.5647059, 1, 0, 1,
-0.6790325, 0.6444373, -1.046605, 0.5607843, 1, 0, 1,
-0.6787554, -0.8077242, -3.844061, 0.5529412, 1, 0, 1,
-0.6770211, 0.8945944, 0.02644784, 0.5490196, 1, 0, 1,
-0.6742328, -1.021388, -3.108904, 0.5411765, 1, 0, 1,
-0.6695418, -0.3679998, -0.423516, 0.5372549, 1, 0, 1,
-0.6689686, -0.1669776, 0.5197365, 0.5294118, 1, 0, 1,
-0.6683608, -1.439401, -3.609545, 0.5254902, 1, 0, 1,
-0.6647531, -0.8006573, -2.408524, 0.5176471, 1, 0, 1,
-0.6550593, 0.6733261, -1.641111, 0.5137255, 1, 0, 1,
-0.652945, 0.09580754, -1.265819, 0.5058824, 1, 0, 1,
-0.6488044, 1.092973, 1.319932, 0.5019608, 1, 0, 1,
-0.6477149, -1.369511, -1.140455, 0.4941176, 1, 0, 1,
-0.644712, -0.619661, -3.590934, 0.4862745, 1, 0, 1,
-0.6430104, 0.1151527, -1.35498, 0.4823529, 1, 0, 1,
-0.642836, -1.053436, -2.179648, 0.4745098, 1, 0, 1,
-0.636059, 0.4971044, -1.417718, 0.4705882, 1, 0, 1,
-0.6345749, -1.225705, -5.120265, 0.4627451, 1, 0, 1,
-0.6318532, -1.060981, -2.463278, 0.4588235, 1, 0, 1,
-0.6299641, -1.150139, -3.38908, 0.4509804, 1, 0, 1,
-0.6287337, -1.817674, -1.867639, 0.4470588, 1, 0, 1,
-0.6242201, -2.625175, -2.922156, 0.4392157, 1, 0, 1,
-0.6218251, 1.551458, -1.169545, 0.4352941, 1, 0, 1,
-0.6193891, -1.224153, -2.642436, 0.427451, 1, 0, 1,
-0.608896, 0.5943286, -1.379924, 0.4235294, 1, 0, 1,
-0.6061259, 2.680309, 0.6986979, 0.4156863, 1, 0, 1,
-0.6033505, 0.4055319, -1.443857, 0.4117647, 1, 0, 1,
-0.6028444, -1.126761, -2.06832, 0.4039216, 1, 0, 1,
-0.6019652, 0.956765, -0.4983785, 0.3960784, 1, 0, 1,
-0.5972146, 0.8871029, -1.185417, 0.3921569, 1, 0, 1,
-0.5954189, 0.434957, -0.9422448, 0.3843137, 1, 0, 1,
-0.5953665, 0.3363436, -0.9000698, 0.3803922, 1, 0, 1,
-0.5885358, -1.0904, -4.218096, 0.372549, 1, 0, 1,
-0.5803941, 0.1968014, -0.2101619, 0.3686275, 1, 0, 1,
-0.5780306, 0.8423506, -0.7519891, 0.3607843, 1, 0, 1,
-0.5770854, 1.38785, -0.9108692, 0.3568628, 1, 0, 1,
-0.5592449, 0.2313285, 0.4772037, 0.3490196, 1, 0, 1,
-0.5542297, -0.6281157, -2.671814, 0.345098, 1, 0, 1,
-0.5504432, -0.3513503, -1.802446, 0.3372549, 1, 0, 1,
-0.547344, 0.7934077, -1.627799, 0.3333333, 1, 0, 1,
-0.5423114, 1.608977, -1.538485, 0.3254902, 1, 0, 1,
-0.5379416, -1.015448, -2.986115, 0.3215686, 1, 0, 1,
-0.5321217, 1.464823, -1.444617, 0.3137255, 1, 0, 1,
-0.5260909, 0.3037546, -1.283577, 0.3098039, 1, 0, 1,
-0.5249025, 0.839733, -1.578186, 0.3019608, 1, 0, 1,
-0.5222893, -0.8034377, -3.452556, 0.2941177, 1, 0, 1,
-0.5206526, -0.8114365, -2.274937, 0.2901961, 1, 0, 1,
-0.518434, 1.731552, 0.3697435, 0.282353, 1, 0, 1,
-0.5170888, -0.1331109, -0.5183423, 0.2784314, 1, 0, 1,
-0.5142443, 0.5995176, -1.892391, 0.2705882, 1, 0, 1,
-0.5113316, -0.4429553, -1.425902, 0.2666667, 1, 0, 1,
-0.507642, -0.3435412, -3.139609, 0.2588235, 1, 0, 1,
-0.5038745, 0.08339773, 0.1771779, 0.254902, 1, 0, 1,
-0.4991536, -0.6698594, -2.1843, 0.2470588, 1, 0, 1,
-0.4990772, -0.7381316, -0.9715629, 0.2431373, 1, 0, 1,
-0.4958527, -0.8907506, -2.713709, 0.2352941, 1, 0, 1,
-0.4952359, 0.6123838, -1.009902, 0.2313726, 1, 0, 1,
-0.4949965, -2.160226, -2.862174, 0.2235294, 1, 0, 1,
-0.4923841, 0.5532919, -0.5705882, 0.2196078, 1, 0, 1,
-0.4890189, 0.0565779, -2.175931, 0.2117647, 1, 0, 1,
-0.4887492, -0.3769582, -1.58433, 0.2078431, 1, 0, 1,
-0.4875334, 1.297072, 0.6473659, 0.2, 1, 0, 1,
-0.4865878, -0.3124504, -2.659443, 0.1921569, 1, 0, 1,
-0.4848388, 0.7524881, -1.786818, 0.1882353, 1, 0, 1,
-0.4837536, -0.7997044, -2.219433, 0.1803922, 1, 0, 1,
-0.4827257, -1.622259, -4.174751, 0.1764706, 1, 0, 1,
-0.4810298, 1.015228, -1.320456, 0.1686275, 1, 0, 1,
-0.4755809, -0.611346, -2.431758, 0.1647059, 1, 0, 1,
-0.4655682, -0.4239297, -0.8114313, 0.1568628, 1, 0, 1,
-0.4639854, -1.572313, -2.539139, 0.1529412, 1, 0, 1,
-0.4625048, 1.188652, 1.418246, 0.145098, 1, 0, 1,
-0.4546884, -0.05438805, -1.449447, 0.1411765, 1, 0, 1,
-0.4469059, 0.7969317, -0.9481613, 0.1333333, 1, 0, 1,
-0.4457333, -0.4558536, -3.206716, 0.1294118, 1, 0, 1,
-0.4455359, -0.8239147, -3.904283, 0.1215686, 1, 0, 1,
-0.4432941, 0.1072707, -2.204275, 0.1176471, 1, 0, 1,
-0.4427026, 0.3961056, -1.02083, 0.1098039, 1, 0, 1,
-0.4405867, -1.398718, -2.173554, 0.1058824, 1, 0, 1,
-0.4396491, 0.6399229, -0.4622404, 0.09803922, 1, 0, 1,
-0.439622, -2.691996, -2.616259, 0.09019608, 1, 0, 1,
-0.4347624, -0.6236709, -3.332736, 0.08627451, 1, 0, 1,
-0.4339702, 2.263334, 0.01690596, 0.07843138, 1, 0, 1,
-0.4336508, -0.2732823, -2.270272, 0.07450981, 1, 0, 1,
-0.4228291, 0.4456184, -1.563968, 0.06666667, 1, 0, 1,
-0.4125681, -0.1755292, -3.25269, 0.0627451, 1, 0, 1,
-0.4114546, 2.115952, 0.3076791, 0.05490196, 1, 0, 1,
-0.4087996, -0.08379417, -1.911697, 0.05098039, 1, 0, 1,
-0.407914, 1.339049, -0.8739668, 0.04313726, 1, 0, 1,
-0.4054301, 1.267991, 0.1214096, 0.03921569, 1, 0, 1,
-0.4049018, 0.06560073, -0.0202371, 0.03137255, 1, 0, 1,
-0.4043558, -1.220198, -1.39558, 0.02745098, 1, 0, 1,
-0.3989536, 0.4876913, -0.9146857, 0.01960784, 1, 0, 1,
-0.3955019, -0.2748511, -0.8800526, 0.01568628, 1, 0, 1,
-0.3920906, -0.3189884, -2.773988, 0.007843138, 1, 0, 1,
-0.3908281, 0.7787672, -0.5983762, 0.003921569, 1, 0, 1,
-0.3881853, -0.7823343, -2.760598, 0, 1, 0.003921569, 1,
-0.3873975, -0.9014689, -1.720141, 0, 1, 0.01176471, 1,
-0.3852803, -1.142272, -3.018437, 0, 1, 0.01568628, 1,
-0.3844743, -0.5835412, -2.748663, 0, 1, 0.02352941, 1,
-0.3825268, -2.041282, -3.812236, 0, 1, 0.02745098, 1,
-0.3811008, -0.3039405, -2.177843, 0, 1, 0.03529412, 1,
-0.3799981, 0.8077688, 0.5171335, 0, 1, 0.03921569, 1,
-0.3767305, 0.4878533, 0.7076632, 0, 1, 0.04705882, 1,
-0.3715186, -1.134844, -4.043123, 0, 1, 0.05098039, 1,
-0.3703003, 1.878202, 0.480895, 0, 1, 0.05882353, 1,
-0.3700143, 0.2720908, -1.531454, 0, 1, 0.0627451, 1,
-0.3690157, 0.723049, -0.3361406, 0, 1, 0.07058824, 1,
-0.3673859, 0.3230286, -1.187101, 0, 1, 0.07450981, 1,
-0.3658548, -0.1321743, -1.734189, 0, 1, 0.08235294, 1,
-0.3631437, -0.4934571, -1.528073, 0, 1, 0.08627451, 1,
-0.3621645, 0.4153899, -0.8318626, 0, 1, 0.09411765, 1,
-0.3597948, 0.3930649, -1.161291, 0, 1, 0.1019608, 1,
-0.3567673, 0.2394313, -0.447178, 0, 1, 0.1058824, 1,
-0.3561872, -1.124483, -2.554718, 0, 1, 0.1137255, 1,
-0.3559487, -0.3855478, -3.083614, 0, 1, 0.1176471, 1,
-0.351964, -0.7160888, -4.305053, 0, 1, 0.1254902, 1,
-0.3516147, 0.8235329, -0.4780549, 0, 1, 0.1294118, 1,
-0.3514563, 0.462746, 0.8483914, 0, 1, 0.1372549, 1,
-0.3474886, -0.4914499, -2.030493, 0, 1, 0.1411765, 1,
-0.340301, -1.574513, -4.447971, 0, 1, 0.1490196, 1,
-0.3395377, -0.1398791, -2.768701, 0, 1, 0.1529412, 1,
-0.3383374, -1.083684, -2.123882, 0, 1, 0.1607843, 1,
-0.3357983, -1.278195, -1.6467, 0, 1, 0.1647059, 1,
-0.3330862, -0.6953099, -2.695739, 0, 1, 0.172549, 1,
-0.3325421, -0.3252791, -3.648172, 0, 1, 0.1764706, 1,
-0.3294164, -0.5576889, -3.387339, 0, 1, 0.1843137, 1,
-0.3267338, 0.07147806, -0.1482053, 0, 1, 0.1882353, 1,
-0.3201328, -0.06766602, -2.703778, 0, 1, 0.1960784, 1,
-0.3164669, -0.140249, -2.649412, 0, 1, 0.2039216, 1,
-0.31628, -0.6035151, -4.482508, 0, 1, 0.2078431, 1,
-0.3158704, -1.258731, -2.993826, 0, 1, 0.2156863, 1,
-0.3149264, 0.017092, -0.7734873, 0, 1, 0.2196078, 1,
-0.3127365, 1.029223, 0.1053797, 0, 1, 0.227451, 1,
-0.3116195, 1.448128, -1.830424, 0, 1, 0.2313726, 1,
-0.3101718, 0.4331887, -0.05728316, 0, 1, 0.2392157, 1,
-0.3090295, -1.468001, -1.656389, 0, 1, 0.2431373, 1,
-0.3081984, -0.4924905, -2.95707, 0, 1, 0.2509804, 1,
-0.3063193, 0.8867128, -0.9322078, 0, 1, 0.254902, 1,
-0.3047361, 0.9253139, -4.278243, 0, 1, 0.2627451, 1,
-0.2997294, -0.6018607, -2.175579, 0, 1, 0.2666667, 1,
-0.2975676, 0.4237918, 0.7162737, 0, 1, 0.2745098, 1,
-0.2952319, 0.1165974, -3.277094, 0, 1, 0.2784314, 1,
-0.2885313, 0.5940884, -0.6539791, 0, 1, 0.2862745, 1,
-0.2884145, 0.1141655, -1.934094, 0, 1, 0.2901961, 1,
-0.2883317, 1.606777, 0.4229975, 0, 1, 0.2980392, 1,
-0.2876853, 1.182953, -1.348325, 0, 1, 0.3058824, 1,
-0.2867214, -0.2911811, -3.646684, 0, 1, 0.3098039, 1,
-0.2828759, -0.685092, -1.277098, 0, 1, 0.3176471, 1,
-0.2792552, -0.562464, -2.368699, 0, 1, 0.3215686, 1,
-0.2787595, -0.462898, -4.013532, 0, 1, 0.3294118, 1,
-0.2787411, 0.5887712, -0.6810412, 0, 1, 0.3333333, 1,
-0.2785677, -0.5163945, -2.395887, 0, 1, 0.3411765, 1,
-0.2777329, 0.9356444, -1.179373, 0, 1, 0.345098, 1,
-0.2777131, -0.1626266, -3.71075, 0, 1, 0.3529412, 1,
-0.2732634, -1.16498, -1.429248, 0, 1, 0.3568628, 1,
-0.271065, -1.249833, -3.780494, 0, 1, 0.3647059, 1,
-0.2708698, 0.2655472, 0.1349623, 0, 1, 0.3686275, 1,
-0.268239, 0.3266986, 0.024134, 0, 1, 0.3764706, 1,
-0.267581, 1.179093, -0.6770465, 0, 1, 0.3803922, 1,
-0.2649733, -1.032587, -2.33805, 0, 1, 0.3882353, 1,
-0.2622708, -0.9456026, -4.019105, 0, 1, 0.3921569, 1,
-0.2603954, 0.2858718, -1.581724, 0, 1, 0.4, 1,
-0.2574499, -1.028847, -4.061317, 0, 1, 0.4078431, 1,
-0.2518522, 2.26787, -0.3659416, 0, 1, 0.4117647, 1,
-0.2507986, 1.235557, 1.553834, 0, 1, 0.4196078, 1,
-0.2482725, 0.2604794, -0.271544, 0, 1, 0.4235294, 1,
-0.2467417, 1.421886, 0.05446953, 0, 1, 0.4313726, 1,
-0.2378843, -1.627139, -3.343468, 0, 1, 0.4352941, 1,
-0.2377785, -0.6361839, -2.910592, 0, 1, 0.4431373, 1,
-0.237684, 0.1321324, 0.3406709, 0, 1, 0.4470588, 1,
-0.2366349, 0.8583317, -0.58578, 0, 1, 0.454902, 1,
-0.235696, 0.7431533, -1.830742, 0, 1, 0.4588235, 1,
-0.2295323, -1.370835, -5.272178, 0, 1, 0.4666667, 1,
-0.2259479, 0.5895081, -0.7693052, 0, 1, 0.4705882, 1,
-0.2252322, -1.455713, -3.75227, 0, 1, 0.4784314, 1,
-0.2244566, 0.9893776, -0.6566466, 0, 1, 0.4823529, 1,
-0.2206443, -1.700814, -2.0602, 0, 1, 0.4901961, 1,
-0.2186751, -0.4967157, -0.9090829, 0, 1, 0.4941176, 1,
-0.2162635, 0.3571578, -1.8308, 0, 1, 0.5019608, 1,
-0.2152183, -1.415523, -4.395811, 0, 1, 0.509804, 1,
-0.2148795, 0.5066505, -1.837023, 0, 1, 0.5137255, 1,
-0.2147966, -0.7373997, -2.40248, 0, 1, 0.5215687, 1,
-0.2106204, 0.1653677, -0.04556293, 0, 1, 0.5254902, 1,
-0.2100826, -0.354277, -2.383683, 0, 1, 0.5333334, 1,
-0.2035565, 1.617135, 0.04401969, 0, 1, 0.5372549, 1,
-0.203423, 0.337981, -2.156623, 0, 1, 0.5450981, 1,
-0.2027552, -0.08807222, -0.9009862, 0, 1, 0.5490196, 1,
-0.2003953, -0.0397941, -2.448786, 0, 1, 0.5568628, 1,
-0.2001231, -0.2211004, -2.986165, 0, 1, 0.5607843, 1,
-0.1972897, 0.2751929, -0.2606532, 0, 1, 0.5686275, 1,
-0.193023, -0.9485392, -3.730251, 0, 1, 0.572549, 1,
-0.1866681, -0.5895102, -1.368924, 0, 1, 0.5803922, 1,
-0.1859306, -0.7322026, -2.464542, 0, 1, 0.5843138, 1,
-0.1777861, 1.576793, -0.322408, 0, 1, 0.5921569, 1,
-0.1774965, -1.030344, -2.960309, 0, 1, 0.5960785, 1,
-0.1754246, 0.8211591, 0.01289499, 0, 1, 0.6039216, 1,
-0.1749416, -0.6381155, -3.700367, 0, 1, 0.6117647, 1,
-0.1744397, -0.1532389, -1.667356, 0, 1, 0.6156863, 1,
-0.172719, -0.9130785, -2.954897, 0, 1, 0.6235294, 1,
-0.1697808, 0.02186803, -1.763839, 0, 1, 0.627451, 1,
-0.1675436, -0.009799053, -1.132072, 0, 1, 0.6352941, 1,
-0.1650987, 0.5904488, 1.668824, 0, 1, 0.6392157, 1,
-0.162709, -0.2438526, -2.679626, 0, 1, 0.6470588, 1,
-0.162225, 0.9784874, -0.4867492, 0, 1, 0.6509804, 1,
-0.1603653, -1.490834, -3.451848, 0, 1, 0.6588235, 1,
-0.157542, -1.494936, -3.09816, 0, 1, 0.6627451, 1,
-0.1575302, 1.488093, -1.766962, 0, 1, 0.6705883, 1,
-0.1573343, -0.1933896, 0.09272841, 0, 1, 0.6745098, 1,
-0.157278, 0.6138424, -0.7296099, 0, 1, 0.682353, 1,
-0.1533932, -1.323147, -2.977662, 0, 1, 0.6862745, 1,
-0.1497716, -0.2811984, -3.746308, 0, 1, 0.6941177, 1,
-0.1456912, -0.0733381, -3.306083, 0, 1, 0.7019608, 1,
-0.1434054, -0.143703, -1.95288, 0, 1, 0.7058824, 1,
-0.1417871, -0.3592319, -2.293759, 0, 1, 0.7137255, 1,
-0.1403719, -0.193999, -2.364048, 0, 1, 0.7176471, 1,
-0.1360494, 0.4629869, -1.171359, 0, 1, 0.7254902, 1,
-0.1355877, 1.475079, -1.33938, 0, 1, 0.7294118, 1,
-0.1343116, 0.6541618, 0.2419655, 0, 1, 0.7372549, 1,
-0.1279981, -0.3000841, -2.718605, 0, 1, 0.7411765, 1,
-0.1274539, 0.2612637, -0.292515, 0, 1, 0.7490196, 1,
-0.1212106, 0.4899308, -1.494052, 0, 1, 0.7529412, 1,
-0.1211709, 0.8526314, -1.868123, 0, 1, 0.7607843, 1,
-0.1198572, -0.5550956, -4.515649, 0, 1, 0.7647059, 1,
-0.1187932, 1.975253, 1.812551, 0, 1, 0.772549, 1,
-0.1178824, -1.184952, -2.190138, 0, 1, 0.7764706, 1,
-0.1158472, -1.663078, -2.377186, 0, 1, 0.7843137, 1,
-0.1153298, -0.3809458, -2.58054, 0, 1, 0.7882353, 1,
-0.1151807, 0.7331693, 0.4141743, 0, 1, 0.7960784, 1,
-0.1124153, -0.2207264, -2.934743, 0, 1, 0.8039216, 1,
-0.1108194, 1.518769, 0.5565821, 0, 1, 0.8078431, 1,
-0.1046713, 1.485384, -0.9615782, 0, 1, 0.8156863, 1,
-0.1045247, -1.296041, -3.270356, 0, 1, 0.8196079, 1,
-0.104423, -0.497595, -3.534833, 0, 1, 0.827451, 1,
-0.1039098, -0.286841, -3.47695, 0, 1, 0.8313726, 1,
-0.09947016, -0.6395848, -3.935664, 0, 1, 0.8392157, 1,
-0.0983807, -0.4506527, -2.753217, 0, 1, 0.8431373, 1,
-0.09604286, 1.375157, -0.4698219, 0, 1, 0.8509804, 1,
-0.09583979, 0.9310362, 0.5557638, 0, 1, 0.854902, 1,
-0.09440374, -0.780728, -2.77604, 0, 1, 0.8627451, 1,
-0.09396654, 0.648551, -0.1885188, 0, 1, 0.8666667, 1,
-0.09152059, -0.4475976, -2.830904, 0, 1, 0.8745098, 1,
-0.08604565, 1.41576, 1.733398, 0, 1, 0.8784314, 1,
-0.08465631, 0.3154286, 0.06176383, 0, 1, 0.8862745, 1,
-0.08035419, 1.140807, -0.280232, 0, 1, 0.8901961, 1,
-0.07969756, -0.4588145, -3.26748, 0, 1, 0.8980392, 1,
-0.07817622, 0.1506851, -1.696025, 0, 1, 0.9058824, 1,
-0.07641067, 0.02002633, -0.4062314, 0, 1, 0.9098039, 1,
-0.07300432, 0.7630799, -0.8006435, 0, 1, 0.9176471, 1,
-0.07219167, 1.4369, -0.5187001, 0, 1, 0.9215686, 1,
-0.07149889, 0.8900763, -0.2164245, 0, 1, 0.9294118, 1,
-0.06865878, 0.4628649, 0.1362092, 0, 1, 0.9333333, 1,
-0.06628657, 0.1871667, -0.8054017, 0, 1, 0.9411765, 1,
-0.06473237, -0.449034, -2.48372, 0, 1, 0.945098, 1,
-0.06092987, 1.775275, -0.1641652, 0, 1, 0.9529412, 1,
-0.05629944, 0.6230385, 1.335041, 0, 1, 0.9568627, 1,
-0.05353057, -0.514055, -4.527996, 0, 1, 0.9647059, 1,
-0.05194652, -0.2787518, -2.235382, 0, 1, 0.9686275, 1,
-0.05073972, -0.5552009, -2.336644, 0, 1, 0.9764706, 1,
-0.04962326, -0.4504429, -1.115002, 0, 1, 0.9803922, 1,
-0.04916558, 1.701419, 1.067685, 0, 1, 0.9882353, 1,
-0.04742874, 0.1785709, -0.05116913, 0, 1, 0.9921569, 1,
-0.04722068, -1.032436, -1.954969, 0, 1, 1, 1,
-0.04704771, 2.654201, -0.5412906, 0, 0.9921569, 1, 1,
-0.04677173, 1.678581, -0.4527306, 0, 0.9882353, 1, 1,
-0.03804367, 1.445823, 1.148858, 0, 0.9803922, 1, 1,
-0.03612947, 0.02112085, -2.008438, 0, 0.9764706, 1, 1,
-0.02897806, -0.05437087, -2.853342, 0, 0.9686275, 1, 1,
-0.0232146, 0.4090728, -0.9132935, 0, 0.9647059, 1, 1,
-0.01911993, 1.210994, 0.5781774, 0, 0.9568627, 1, 1,
-0.009045654, 0.0177841, 0.6043985, 0, 0.9529412, 1, 1,
-0.007342852, 0.4563873, 1.060403, 0, 0.945098, 1, 1,
-0.006624359, -0.0135409, -1.462897, 0, 0.9411765, 1, 1,
-0.006278351, 0.8207329, 0.6487266, 0, 0.9333333, 1, 1,
-0.004249239, -0.9201009, -1.23315, 0, 0.9294118, 1, 1,
-0.001219929, -0.4496758, -2.841475, 0, 0.9215686, 1, 1,
-0.0007071006, 0.01763494, 2.468528, 0, 0.9176471, 1, 1,
-6.38428e-05, 0.1082348, 1.051265, 0, 0.9098039, 1, 1,
8.789791e-05, -0.5789953, 4.014503, 0, 0.9058824, 1, 1,
0.009728368, 0.1788544, 0.240928, 0, 0.8980392, 1, 1,
0.01183776, -0.4125783, 4.800843, 0, 0.8901961, 1, 1,
0.01273251, -0.6505335, 2.706587, 0, 0.8862745, 1, 1,
0.01471047, -1.659789, 2.314006, 0, 0.8784314, 1, 1,
0.01494488, -0.1856665, 5.18452, 0, 0.8745098, 1, 1,
0.01627657, 0.522239, -0.2183056, 0, 0.8666667, 1, 1,
0.01912379, -0.9007424, 1.875494, 0, 0.8627451, 1, 1,
0.02197485, -1.043663, 1.675104, 0, 0.854902, 1, 1,
0.03348913, -0.7207413, 2.391572, 0, 0.8509804, 1, 1,
0.03395813, -0.7453944, 2.766556, 0, 0.8431373, 1, 1,
0.04625018, 0.1116307, -1.264442, 0, 0.8392157, 1, 1,
0.0471318, -0.08239545, 2.388616, 0, 0.8313726, 1, 1,
0.05060923, -2.256368, 3.060073, 0, 0.827451, 1, 1,
0.05085964, -0.02757134, 0.9734431, 0, 0.8196079, 1, 1,
0.05478315, -0.5452977, 3.354826, 0, 0.8156863, 1, 1,
0.06295141, 0.404391, 2.055448, 0, 0.8078431, 1, 1,
0.06894071, 1.367756, 0.04800062, 0, 0.8039216, 1, 1,
0.06954469, -0.5288869, 1.708683, 0, 0.7960784, 1, 1,
0.07595827, -0.7699178, 3.09228, 0, 0.7882353, 1, 1,
0.07883234, 0.07168264, -0.08499151, 0, 0.7843137, 1, 1,
0.08130777, 2.046629, -1.102253, 0, 0.7764706, 1, 1,
0.08203588, -0.5960122, 3.200337, 0, 0.772549, 1, 1,
0.0828783, 0.8829787, -0.2512984, 0, 0.7647059, 1, 1,
0.08360264, -8.388376e-05, 0.5351899, 0, 0.7607843, 1, 1,
0.0855771, 0.3225538, 0.5390816, 0, 0.7529412, 1, 1,
0.08817527, 0.1974457, -1.012531, 0, 0.7490196, 1, 1,
0.09049077, 0.1734348, 1.477399, 0, 0.7411765, 1, 1,
0.09125172, -0.707063, 3.851125, 0, 0.7372549, 1, 1,
0.09275715, -0.03762132, 1.195669, 0, 0.7294118, 1, 1,
0.1003544, 0.6459523, 1.676695, 0, 0.7254902, 1, 1,
0.1033902, 0.230366, -0.2623773, 0, 0.7176471, 1, 1,
0.1060943, -0.2817841, 2.937641, 0, 0.7137255, 1, 1,
0.1070296, 1.453297, 1.971937, 0, 0.7058824, 1, 1,
0.1071514, -0.7496647, 3.12453, 0, 0.6980392, 1, 1,
0.112226, 0.8827046, 1.475434, 0, 0.6941177, 1, 1,
0.1154906, 1.491969, 0.6236696, 0, 0.6862745, 1, 1,
0.1166293, -1.18178, 1.47238, 0, 0.682353, 1, 1,
0.1239429, 0.2636536, -0.4047613, 0, 0.6745098, 1, 1,
0.1291104, -0.2124745, 1.07944, 0, 0.6705883, 1, 1,
0.1293097, 0.0818496, 0.2845298, 0, 0.6627451, 1, 1,
0.1300693, 0.8070195, 1.521883, 0, 0.6588235, 1, 1,
0.1344913, 0.6908082, -0.593474, 0, 0.6509804, 1, 1,
0.1397399, -0.9128976, 2.709327, 0, 0.6470588, 1, 1,
0.1415059, 0.5885515, 0.2074343, 0, 0.6392157, 1, 1,
0.145327, -0.07902304, 2.614657, 0, 0.6352941, 1, 1,
0.1458775, 0.4734854, -1.298124, 0, 0.627451, 1, 1,
0.1496095, -0.08856161, 1.569558, 0, 0.6235294, 1, 1,
0.1513867, 0.2818038, 2.359544, 0, 0.6156863, 1, 1,
0.1528302, 0.8952484, 1.130313, 0, 0.6117647, 1, 1,
0.155096, -0.3472265, 1.892, 0, 0.6039216, 1, 1,
0.1588591, -0.4719947, 3.319368, 0, 0.5960785, 1, 1,
0.1693655, -1.474777, 1.89183, 0, 0.5921569, 1, 1,
0.1709149, 1.489186, -0.6688815, 0, 0.5843138, 1, 1,
0.1716496, -0.7538562, 3.779166, 0, 0.5803922, 1, 1,
0.1748495, 0.8435861, 1.664485, 0, 0.572549, 1, 1,
0.1751966, 0.9665429, 0.5328248, 0, 0.5686275, 1, 1,
0.1757519, -0.5649753, 3.437069, 0, 0.5607843, 1, 1,
0.1779107, -1.060986, 3.316803, 0, 0.5568628, 1, 1,
0.1870087, 0.835249, 0.4848719, 0, 0.5490196, 1, 1,
0.1880847, 0.9275194, -0.1237359, 0, 0.5450981, 1, 1,
0.1889003, -0.2655089, 0.717784, 0, 0.5372549, 1, 1,
0.1890644, 1.761069, 1.061247, 0, 0.5333334, 1, 1,
0.1893776, -1.666511, 4.464523, 0, 0.5254902, 1, 1,
0.1925394, -1.426736, 2.466641, 0, 0.5215687, 1, 1,
0.1942288, -0.3682745, 2.743421, 0, 0.5137255, 1, 1,
0.1948333, -0.5523746, 2.991289, 0, 0.509804, 1, 1,
0.1992984, -2.350208, 1.915749, 0, 0.5019608, 1, 1,
0.2058115, 0.9179925, -1.32883, 0, 0.4941176, 1, 1,
0.2114776, -0.5406567, 2.889597, 0, 0.4901961, 1, 1,
0.2134846, -0.2836137, 1.607719, 0, 0.4823529, 1, 1,
0.2180728, -0.6159077, 1.311645, 0, 0.4784314, 1, 1,
0.2194305, 0.2157326, 0.8093432, 0, 0.4705882, 1, 1,
0.224292, 0.4677413, 0.6313682, 0, 0.4666667, 1, 1,
0.2253553, 1.561943, 0.05599964, 0, 0.4588235, 1, 1,
0.2299603, 0.2122651, 1.24173, 0, 0.454902, 1, 1,
0.2307919, 1.056485, -0.07615861, 0, 0.4470588, 1, 1,
0.2337997, -3.034086, 4.522429, 0, 0.4431373, 1, 1,
0.2345929, -0.5368612, 2.951132, 0, 0.4352941, 1, 1,
0.2376074, 0.8717116, -0.8181319, 0, 0.4313726, 1, 1,
0.2391387, -0.5356488, 2.800799, 0, 0.4235294, 1, 1,
0.2396876, 1.737074, -0.4443255, 0, 0.4196078, 1, 1,
0.2398673, 0.8581896, -0.1235243, 0, 0.4117647, 1, 1,
0.2435715, -1.845512, 5.1792, 0, 0.4078431, 1, 1,
0.2459959, -0.1764698, 1.197741, 0, 0.4, 1, 1,
0.2467141, 0.8497049, -0.1951313, 0, 0.3921569, 1, 1,
0.2492102, 1.245853, -0.1736441, 0, 0.3882353, 1, 1,
0.2525404, -0.03960314, 1.067247, 0, 0.3803922, 1, 1,
0.256153, -0.754038, 3.372648, 0, 0.3764706, 1, 1,
0.2668836, 1.256631, 1.904887, 0, 0.3686275, 1, 1,
0.2753239, -0.6326325, 1.568199, 0, 0.3647059, 1, 1,
0.2765111, 0.05549209, 1.898896, 0, 0.3568628, 1, 1,
0.2768576, -0.8831364, 3.76562, 0, 0.3529412, 1, 1,
0.2828624, 0.08770842, 0.1528205, 0, 0.345098, 1, 1,
0.2849397, -1.381839, 3.530753, 0, 0.3411765, 1, 1,
0.2856779, 0.7227632, -0.5056573, 0, 0.3333333, 1, 1,
0.2871424, 0.2475964, 3.114955, 0, 0.3294118, 1, 1,
0.289448, -0.7940851, 1.354517, 0, 0.3215686, 1, 1,
0.2943732, -1.543083, 2.907661, 0, 0.3176471, 1, 1,
0.294634, 0.5387849, -1.466457, 0, 0.3098039, 1, 1,
0.3010988, 0.0646717, 3.550762, 0, 0.3058824, 1, 1,
0.3044146, 0.01725028, 0.08148772, 0, 0.2980392, 1, 1,
0.3081857, -0.3665652, 2.812542, 0, 0.2901961, 1, 1,
0.3115404, 1.830788, -1.086233, 0, 0.2862745, 1, 1,
0.3121003, -0.02222391, 0.6952126, 0, 0.2784314, 1, 1,
0.3207663, 0.6976526, -1.112454, 0, 0.2745098, 1, 1,
0.3309906, 0.9279546, 2.206202, 0, 0.2666667, 1, 1,
0.3343259, -0.5035326, 0.9128528, 0, 0.2627451, 1, 1,
0.3363662, -0.3950505, 2.426375, 0, 0.254902, 1, 1,
0.3375514, -0.7777147, 1.604722, 0, 0.2509804, 1, 1,
0.3388721, -1.45217, 3.395375, 0, 0.2431373, 1, 1,
0.3394558, -1.939058, 3.071858, 0, 0.2392157, 1, 1,
0.3405478, 1.031154, -0.6876435, 0, 0.2313726, 1, 1,
0.3425862, -0.5936391, 3.0781, 0, 0.227451, 1, 1,
0.347172, -1.502695, 4.374402, 0, 0.2196078, 1, 1,
0.3478105, 0.6725768, -0.1972562, 0, 0.2156863, 1, 1,
0.3479277, -1.1199, 3.46402, 0, 0.2078431, 1, 1,
0.349807, 0.1869003, 1.43251, 0, 0.2039216, 1, 1,
0.3525243, -0.5853983, 2.575181, 0, 0.1960784, 1, 1,
0.3527648, 1.031163, 1.674777, 0, 0.1882353, 1, 1,
0.3548471, -0.6575488, 2.098053, 0, 0.1843137, 1, 1,
0.35524, 0.7482356, 0.7522989, 0, 0.1764706, 1, 1,
0.3569245, -0.7198423, 1.8629, 0, 0.172549, 1, 1,
0.3601806, -0.7224236, 4.345655, 0, 0.1647059, 1, 1,
0.3602936, -1.089009, 1.92576, 0, 0.1607843, 1, 1,
0.3645727, -0.2308766, 2.268123, 0, 0.1529412, 1, 1,
0.3653536, -0.3646693, 3.895602, 0, 0.1490196, 1, 1,
0.3665857, -2.365901, 3.026717, 0, 0.1411765, 1, 1,
0.3720561, 0.3692257, 0.8389177, 0, 0.1372549, 1, 1,
0.3739939, -0.04179376, -0.5556197, 0, 0.1294118, 1, 1,
0.3761662, -1.073907, 3.384049, 0, 0.1254902, 1, 1,
0.378753, 1.140517, 1.260285, 0, 0.1176471, 1, 1,
0.3810297, 1.407267, 1.095119, 0, 0.1137255, 1, 1,
0.3839904, 0.3399943, 0.6724135, 0, 0.1058824, 1, 1,
0.3854952, -1.305459, 4.216889, 0, 0.09803922, 1, 1,
0.3883926, 0.9454969, -0.8840412, 0, 0.09411765, 1, 1,
0.3900234, -0.5607657, 2.742546, 0, 0.08627451, 1, 1,
0.3976449, 0.1002407, 1.67265, 0, 0.08235294, 1, 1,
0.4065678, -0.02008599, 1.242258, 0, 0.07450981, 1, 1,
0.4075385, -0.05986061, 0.437599, 0, 0.07058824, 1, 1,
0.4104741, -0.03608929, -0.5110213, 0, 0.0627451, 1, 1,
0.4105048, 0.1006285, -0.008980077, 0, 0.05882353, 1, 1,
0.4112348, 1.180146, 1.843724, 0, 0.05098039, 1, 1,
0.411596, -1.213576, 3.909367, 0, 0.04705882, 1, 1,
0.424149, 2.575799, 0.8800765, 0, 0.03921569, 1, 1,
0.425829, -0.4598161, 3.216419, 0, 0.03529412, 1, 1,
0.4321382, 0.9066395, 1.274725, 0, 0.02745098, 1, 1,
0.433181, 0.4672534, 1.228063, 0, 0.02352941, 1, 1,
0.4335843, 1.040452, 0.5981552, 0, 0.01568628, 1, 1,
0.434244, -0.8714814, 2.396371, 0, 0.01176471, 1, 1,
0.4362619, -0.7201905, 3.402776, 0, 0.003921569, 1, 1,
0.4396358, -0.5443597, 2.670774, 0.003921569, 0, 1, 1,
0.4483318, -1.062277, 1.823804, 0.007843138, 0, 1, 1,
0.4498562, 0.3967672, 0.3403909, 0.01568628, 0, 1, 1,
0.4502053, 0.192437, 0.8602331, 0.01960784, 0, 1, 1,
0.457918, -0.6596482, 1.795004, 0.02745098, 0, 1, 1,
0.458187, -0.8567966, 0.9308811, 0.03137255, 0, 1, 1,
0.461197, -1.837757, 2.897741, 0.03921569, 0, 1, 1,
0.4623004, 1.941033, -3.266475, 0.04313726, 0, 1, 1,
0.4659033, 2.013056, -0.01442827, 0.05098039, 0, 1, 1,
0.4659162, 1.302376, 0.08094033, 0.05490196, 0, 1, 1,
0.4660082, 0.1404095, 2.213647, 0.0627451, 0, 1, 1,
0.4671943, 1.486044, -1.937674, 0.06666667, 0, 1, 1,
0.4687545, 0.4309962, 0.2155569, 0.07450981, 0, 1, 1,
0.4747103, -0.7996799, 2.208754, 0.07843138, 0, 1, 1,
0.4772657, 1.006694, -0.8439574, 0.08627451, 0, 1, 1,
0.4792795, 1.397083, 0.3419199, 0.09019608, 0, 1, 1,
0.4816495, -1.003485, 2.557161, 0.09803922, 0, 1, 1,
0.4842304, 0.8180317, -0.1148602, 0.1058824, 0, 1, 1,
0.4888194, 0.4663632, 0.7230992, 0.1098039, 0, 1, 1,
0.4947416, -0.5958555, 2.741602, 0.1176471, 0, 1, 1,
0.4955857, -1.284377, 1.58295, 0.1215686, 0, 1, 1,
0.4989668, 0.6549729, 1.182401, 0.1294118, 0, 1, 1,
0.4995592, 0.8731208, 0.2230106, 0.1333333, 0, 1, 1,
0.4995905, -0.6727322, 4.31485, 0.1411765, 0, 1, 1,
0.5010905, -0.9025124, 1.675635, 0.145098, 0, 1, 1,
0.5053142, -0.9358109, 4.453761, 0.1529412, 0, 1, 1,
0.5095128, -0.1143244, 1.958515, 0.1568628, 0, 1, 1,
0.5108857, -2.059677, 3.203895, 0.1647059, 0, 1, 1,
0.5144954, 0.08160473, 1.063112, 0.1686275, 0, 1, 1,
0.5148536, 0.04419165, 1.027571, 0.1764706, 0, 1, 1,
0.515413, 0.7032194, 2.193373, 0.1803922, 0, 1, 1,
0.5173085, 1.61059, 1.23338, 0.1882353, 0, 1, 1,
0.5193402, 0.6572195, 0.3392556, 0.1921569, 0, 1, 1,
0.5198436, -0.8697791, 2.271752, 0.2, 0, 1, 1,
0.5199682, -0.5504307, 1.369929, 0.2078431, 0, 1, 1,
0.520034, 1.876481, -1.286139, 0.2117647, 0, 1, 1,
0.5240399, 0.09962529, 1.507674, 0.2196078, 0, 1, 1,
0.5286092, -0.8268015, 4.28728, 0.2235294, 0, 1, 1,
0.5337937, -0.09964674, 0.5473236, 0.2313726, 0, 1, 1,
0.5343243, -0.7763033, 2.597551, 0.2352941, 0, 1, 1,
0.5356023, 0.5118904, -0.08113285, 0.2431373, 0, 1, 1,
0.5412793, 0.7073242, 0.3633575, 0.2470588, 0, 1, 1,
0.5420936, 0.8868769, -0.1878668, 0.254902, 0, 1, 1,
0.5461308, 0.04057816, 2.072436, 0.2588235, 0, 1, 1,
0.54877, 1.288398, -0.6479948, 0.2666667, 0, 1, 1,
0.5491931, -0.2585916, 2.928751, 0.2705882, 0, 1, 1,
0.5507875, -0.6813808, 3.090957, 0.2784314, 0, 1, 1,
0.5559547, -0.2981679, 2.088611, 0.282353, 0, 1, 1,
0.5569337, -1.182562, 2.745623, 0.2901961, 0, 1, 1,
0.5659826, -0.7971724, 2.8141, 0.2941177, 0, 1, 1,
0.569769, 0.7425206, 1.140791, 0.3019608, 0, 1, 1,
0.5738198, 1.656545, -1.022487, 0.3098039, 0, 1, 1,
0.5754437, -2.280545, 4.260226, 0.3137255, 0, 1, 1,
0.5774999, -0.6580874, 1.302055, 0.3215686, 0, 1, 1,
0.5803271, 0.5316788, 0.4357353, 0.3254902, 0, 1, 1,
0.5832542, -1.147863, 2.809417, 0.3333333, 0, 1, 1,
0.58414, 1.564204, 0.525814, 0.3372549, 0, 1, 1,
0.6059666, -0.3336304, 1.947127, 0.345098, 0, 1, 1,
0.6065189, -1.702057, 3.744415, 0.3490196, 0, 1, 1,
0.6074309, 0.1500769, 2.028319, 0.3568628, 0, 1, 1,
0.6078124, 0.626339, 0.3278378, 0.3607843, 0, 1, 1,
0.611804, 1.050241, 1.011676, 0.3686275, 0, 1, 1,
0.6124641, -0.570364, 3.429087, 0.372549, 0, 1, 1,
0.6183959, -2.012498, 1.921621, 0.3803922, 0, 1, 1,
0.6311962, -1.305349, 3.184824, 0.3843137, 0, 1, 1,
0.6363504, 0.5782939, 1.135739, 0.3921569, 0, 1, 1,
0.6451662, 0.1676396, -1.368768, 0.3960784, 0, 1, 1,
0.6491017, -1.652751, 3.85069, 0.4039216, 0, 1, 1,
0.6506032, 1.191324, 1.65952, 0.4117647, 0, 1, 1,
0.6542928, 1.65684, -0.1214298, 0.4156863, 0, 1, 1,
0.6549425, -1.146166, 1.025131, 0.4235294, 0, 1, 1,
0.6569039, 0.3317937, 2.798047, 0.427451, 0, 1, 1,
0.6599095, 1.855761, -0.1589369, 0.4352941, 0, 1, 1,
0.6655945, -1.464835, 3.415785, 0.4392157, 0, 1, 1,
0.6687228, 0.001698978, 1.289818, 0.4470588, 0, 1, 1,
0.6712529, -0.2484376, 3.21809, 0.4509804, 0, 1, 1,
0.6720608, -2.834651, 2.098687, 0.4588235, 0, 1, 1,
0.6721329, 0.93929, 0.3083569, 0.4627451, 0, 1, 1,
0.6771397, -1.575061, 3.046629, 0.4705882, 0, 1, 1,
0.6772961, -0.3250347, 1.286089, 0.4745098, 0, 1, 1,
0.6782305, 0.6628615, 1.764659, 0.4823529, 0, 1, 1,
0.679453, 0.4893724, 1.713751, 0.4862745, 0, 1, 1,
0.6798488, -0.7667181, 2.538117, 0.4941176, 0, 1, 1,
0.6821015, 0.8499105, 0.1004289, 0.5019608, 0, 1, 1,
0.6836662, 0.8303648, 0.4521148, 0.5058824, 0, 1, 1,
0.6874673, 0.5384496, 1.789952, 0.5137255, 0, 1, 1,
0.6885883, 0.839801, 1.261999, 0.5176471, 0, 1, 1,
0.6918817, 1.655114, 0.2133648, 0.5254902, 0, 1, 1,
0.6943108, -2.443898, 2.864206, 0.5294118, 0, 1, 1,
0.6949176, -1.158921, 1.825147, 0.5372549, 0, 1, 1,
0.6970781, -0.3457235, 3.166009, 0.5411765, 0, 1, 1,
0.6973605, -0.3743988, 1.357583, 0.5490196, 0, 1, 1,
0.7021002, 0.1701868, 1.034203, 0.5529412, 0, 1, 1,
0.7071009, -0.06204431, 3.140218, 0.5607843, 0, 1, 1,
0.7080791, -2.028981, 2.878353, 0.5647059, 0, 1, 1,
0.7103567, -0.6188353, 0.377665, 0.572549, 0, 1, 1,
0.7117617, -2.253644, 2.799888, 0.5764706, 0, 1, 1,
0.7125139, 2.471833, 0.2315586, 0.5843138, 0, 1, 1,
0.7180936, -0.04014254, 1.948016, 0.5882353, 0, 1, 1,
0.7284764, 1.333508, -0.7307259, 0.5960785, 0, 1, 1,
0.7326788, -0.6095759, 2.287187, 0.6039216, 0, 1, 1,
0.7367134, -0.8469642, 4.4937, 0.6078432, 0, 1, 1,
0.7398376, -0.5204126, 0.4017122, 0.6156863, 0, 1, 1,
0.7436654, 2.149707, -0.8532158, 0.6196079, 0, 1, 1,
0.7451103, 0.7589773, -0.1639471, 0.627451, 0, 1, 1,
0.7479684, -0.4067536, -0.1407404, 0.6313726, 0, 1, 1,
0.7521755, 0.02376115, 0.823078, 0.6392157, 0, 1, 1,
0.7524281, -0.7582864, 2.265901, 0.6431373, 0, 1, 1,
0.7530489, 0.9679909, -0.1539152, 0.6509804, 0, 1, 1,
0.7558479, -0.3135256, 1.921123, 0.654902, 0, 1, 1,
0.7567272, 1.920175, 0.3522594, 0.6627451, 0, 1, 1,
0.7587246, 0.2713618, 0.1266344, 0.6666667, 0, 1, 1,
0.7610121, 0.8046694, 0.05240054, 0.6745098, 0, 1, 1,
0.7635437, 0.9714746, 0.5379998, 0.6784314, 0, 1, 1,
0.7642586, 0.7864581, -0.5091699, 0.6862745, 0, 1, 1,
0.7769544, 0.04530658, 1.485357, 0.6901961, 0, 1, 1,
0.7788484, -0.9965695, 1.576242, 0.6980392, 0, 1, 1,
0.7795298, -0.3054329, 0.2781481, 0.7058824, 0, 1, 1,
0.7885212, 1.038382, -0.6453292, 0.7098039, 0, 1, 1,
0.7985312, 0.1161364, 1.153735, 0.7176471, 0, 1, 1,
0.8027229, 1.269922, -1.063226, 0.7215686, 0, 1, 1,
0.8028135, -1.230276, 4.378518, 0.7294118, 0, 1, 1,
0.8066394, -0.8772071, 4.063783, 0.7333333, 0, 1, 1,
0.8112592, 1.376152, -0.083467, 0.7411765, 0, 1, 1,
0.8129486, -1.079599, 1.86333, 0.7450981, 0, 1, 1,
0.8177548, -0.9673216, 2.441196, 0.7529412, 0, 1, 1,
0.8210104, 0.7009988, 1.663982, 0.7568628, 0, 1, 1,
0.8259369, -1.130088, 0.4723085, 0.7647059, 0, 1, 1,
0.8294247, 2.935298, 2.808619, 0.7686275, 0, 1, 1,
0.8384188, 0.6218116, 0.9424574, 0.7764706, 0, 1, 1,
0.839183, -1.063246, 3.880178, 0.7803922, 0, 1, 1,
0.8398868, 0.1440838, 1.874292, 0.7882353, 0, 1, 1,
0.8414423, 0.7877567, 1.97852, 0.7921569, 0, 1, 1,
0.8417366, -0.6685736, 2.178065, 0.8, 0, 1, 1,
0.8426808, 0.5047647, 0.7191958, 0.8078431, 0, 1, 1,
0.8453057, 1.046473, 1.259694, 0.8117647, 0, 1, 1,
0.8468233, 2.106475, 0.4910515, 0.8196079, 0, 1, 1,
0.8475965, -0.1081876, 2.619854, 0.8235294, 0, 1, 1,
0.8486086, 1.864444, 1.445042, 0.8313726, 0, 1, 1,
0.8577343, 1.257708, 0.5603072, 0.8352941, 0, 1, 1,
0.858946, -0.6123496, 3.540387, 0.8431373, 0, 1, 1,
0.8610098, -1.588947, 2.894607, 0.8470588, 0, 1, 1,
0.8632514, 0.9171857, 1.496975, 0.854902, 0, 1, 1,
0.8676811, -1.107473, 1.183794, 0.8588235, 0, 1, 1,
0.8687825, -1.920598, 4.533739, 0.8666667, 0, 1, 1,
0.8750178, 1.196981, -0.5234057, 0.8705882, 0, 1, 1,
0.8819796, 1.750092, -0.9017588, 0.8784314, 0, 1, 1,
0.8861085, -0.6390817, 3.030536, 0.8823529, 0, 1, 1,
0.8932747, 0.1858642, 0.3160178, 0.8901961, 0, 1, 1,
0.9034793, -0.8060515, 2.192127, 0.8941177, 0, 1, 1,
0.9049996, -0.842896, 2.137362, 0.9019608, 0, 1, 1,
0.9148417, 0.2366438, 1.080545, 0.9098039, 0, 1, 1,
0.9204996, 0.5717199, -0.9213024, 0.9137255, 0, 1, 1,
0.9233523, 1.991833, -0.5770763, 0.9215686, 0, 1, 1,
0.9270184, 0.8232496, 1.518094, 0.9254902, 0, 1, 1,
0.9319724, -0.8292395, 2.726214, 0.9333333, 0, 1, 1,
0.9332055, -0.443807, 4.245992, 0.9372549, 0, 1, 1,
0.9469216, -1.266643, 2.348263, 0.945098, 0, 1, 1,
0.9482876, -0.3086596, 0.8073395, 0.9490196, 0, 1, 1,
0.9527987, -1.215385, 3.644487, 0.9568627, 0, 1, 1,
0.9530335, -0.3897882, 1.024283, 0.9607843, 0, 1, 1,
0.9591488, -1.493284, 3.007324, 0.9686275, 0, 1, 1,
0.9626443, -0.9286829, 1.177151, 0.972549, 0, 1, 1,
0.9668992, 0.5168087, 2.129873, 0.9803922, 0, 1, 1,
0.9676816, -0.6054336, 1.865183, 0.9843137, 0, 1, 1,
0.9708694, 0.3368755, 1.699433, 0.9921569, 0, 1, 1,
0.9759019, 0.8887749, 0.7536919, 0.9960784, 0, 1, 1,
0.9797818, -1.032598, 1.008008, 1, 0, 0.9960784, 1,
0.9803883, 0.2370007, 1.006867, 1, 0, 0.9882353, 1,
0.9807858, -1.040987, 1.17462, 1, 0, 0.9843137, 1,
0.9852068, -0.4858924, 1.880295, 1, 0, 0.9764706, 1,
0.9946986, 0.4738511, 1.660939, 1, 0, 0.972549, 1,
0.9958943, 0.4595626, -0.1486678, 1, 0, 0.9647059, 1,
0.9971405, -0.250055, 1.431087, 1, 0, 0.9607843, 1,
1.002181, -0.3952554, 2.359802, 1, 0, 0.9529412, 1,
1.003024, -0.03003062, 1.271309, 1, 0, 0.9490196, 1,
1.014343, 0.06197814, 2.277318, 1, 0, 0.9411765, 1,
1.016253, -0.8990062, 1.930042, 1, 0, 0.9372549, 1,
1.022668, 0.9280706, 0.5389491, 1, 0, 0.9294118, 1,
1.023842, -1.425294, 2.14981, 1, 0, 0.9254902, 1,
1.025795, -0.2999223, 1.401045, 1, 0, 0.9176471, 1,
1.029637, -1.876903, 3.7382, 1, 0, 0.9137255, 1,
1.03857, 0.1919962, 1.144528, 1, 0, 0.9058824, 1,
1.041076, -0.1825715, 0.7686629, 1, 0, 0.9019608, 1,
1.043203, 0.854353, 0.61314, 1, 0, 0.8941177, 1,
1.049937, -0.8937809, 2.282374, 1, 0, 0.8862745, 1,
1.054096, 0.9498934, 1.993495, 1, 0, 0.8823529, 1,
1.056921, -1.540953, 2.758039, 1, 0, 0.8745098, 1,
1.065474, 0.1838278, 0.5399024, 1, 0, 0.8705882, 1,
1.067394, -0.3721625, 0.5639102, 1, 0, 0.8627451, 1,
1.074533, -0.8286355, 1.515673, 1, 0, 0.8588235, 1,
1.074762, 0.7218869, -0.02072157, 1, 0, 0.8509804, 1,
1.079753, -0.9047323, 2.834554, 1, 0, 0.8470588, 1,
1.080246, -1.43538, 1.659184, 1, 0, 0.8392157, 1,
1.08209, -0.4092103, 1.320218, 1, 0, 0.8352941, 1,
1.082949, -0.3881661, 1.992177, 1, 0, 0.827451, 1,
1.092031, -0.6355764, 1.745079, 1, 0, 0.8235294, 1,
1.093237, -0.8252229, 3.070202, 1, 0, 0.8156863, 1,
1.094696, 1.868095, 2.2146, 1, 0, 0.8117647, 1,
1.097011, -0.3576901, 2.786165, 1, 0, 0.8039216, 1,
1.098019, -0.8622244, 2.83756, 1, 0, 0.7960784, 1,
1.098435, 0.5168352, -0.2788009, 1, 0, 0.7921569, 1,
1.104798, 0.2811488, 3.754714, 1, 0, 0.7843137, 1,
1.114804, -1.107439, 1.6676, 1, 0, 0.7803922, 1,
1.131822, 0.627503, 2.056609, 1, 0, 0.772549, 1,
1.134889, -0.2822046, 0.7558221, 1, 0, 0.7686275, 1,
1.135569, -1.014482, 2.031288, 1, 0, 0.7607843, 1,
1.139393, 0.8880409, 0.2038858, 1, 0, 0.7568628, 1,
1.141055, -0.4449306, 1.936644, 1, 0, 0.7490196, 1,
1.159559, -0.5514911, 1.586087, 1, 0, 0.7450981, 1,
1.163722, 1.204201, -0.5900278, 1, 0, 0.7372549, 1,
1.165555, -0.6382492, 0.8917542, 1, 0, 0.7333333, 1,
1.168025, 1.491317, 1.908155, 1, 0, 0.7254902, 1,
1.171745, 0.8224483, 0.04924703, 1, 0, 0.7215686, 1,
1.179887, -0.8675581, 3.349464, 1, 0, 0.7137255, 1,
1.1852, 0.7206695, 0.7279443, 1, 0, 0.7098039, 1,
1.186604, -0.3094434, 1.927395, 1, 0, 0.7019608, 1,
1.186888, -0.8880194, 2.137819, 1, 0, 0.6941177, 1,
1.187652, -0.7283751, 1.999386, 1, 0, 0.6901961, 1,
1.19178, 0.7236431, 0.6207504, 1, 0, 0.682353, 1,
1.198978, -0.9184011, 2.816653, 1, 0, 0.6784314, 1,
1.205921, 1.348654, 0.7533167, 1, 0, 0.6705883, 1,
1.206127, 1.779453, 0.09057575, 1, 0, 0.6666667, 1,
1.211519, -1.111845, 3.152131, 1, 0, 0.6588235, 1,
1.241291, 1.14781, 3.076119, 1, 0, 0.654902, 1,
1.242236, 1.066374, 0.1236515, 1, 0, 0.6470588, 1,
1.248645, -1.770733, 0.09104201, 1, 0, 0.6431373, 1,
1.25098, -0.5965186, 4.36554, 1, 0, 0.6352941, 1,
1.257211, -1.421148, 5.004787, 1, 0, 0.6313726, 1,
1.262972, -1.862772, 1.756323, 1, 0, 0.6235294, 1,
1.266685, -0.7274232, 1.655177, 1, 0, 0.6196079, 1,
1.268934, 0.8609048, -0.2511458, 1, 0, 0.6117647, 1,
1.272379, 0.63724, 0.4827552, 1, 0, 0.6078432, 1,
1.278662, 0.563542, 2.399136, 1, 0, 0.6, 1,
1.285555, -1.221764, 4.826025, 1, 0, 0.5921569, 1,
1.285677, 1.532075, 1.389966, 1, 0, 0.5882353, 1,
1.303662, -0.5523273, 1.710042, 1, 0, 0.5803922, 1,
1.308886, -2.214385, 4.112602, 1, 0, 0.5764706, 1,
1.311969, 0.6866562, 0.4192753, 1, 0, 0.5686275, 1,
1.316084, 0.1677072, 3.120434, 1, 0, 0.5647059, 1,
1.328127, -0.222002, 2.727392, 1, 0, 0.5568628, 1,
1.333299, -0.2487499, 1.813401, 1, 0, 0.5529412, 1,
1.335316, -0.2018283, 1.62887, 1, 0, 0.5450981, 1,
1.354697, 0.8620045, 0.06328819, 1, 0, 0.5411765, 1,
1.366876, 1.360171, -0.8244017, 1, 0, 0.5333334, 1,
1.367309, 0.2872676, 0.5702541, 1, 0, 0.5294118, 1,
1.369438, -0.3739228, -0.2084798, 1, 0, 0.5215687, 1,
1.370482, 3.511073, 0.1478122, 1, 0, 0.5176471, 1,
1.375161, 0.7269425, 2.948569, 1, 0, 0.509804, 1,
1.388374, -0.04811207, -0.2575408, 1, 0, 0.5058824, 1,
1.388821, -0.8783534, 1.070052, 1, 0, 0.4980392, 1,
1.403383, -1.209124, 3.210005, 1, 0, 0.4901961, 1,
1.405587, 1.217297, 0.1022791, 1, 0, 0.4862745, 1,
1.428645, 1.729012, 0.3870493, 1, 0, 0.4784314, 1,
1.432584, 0.4829091, 0.8429559, 1, 0, 0.4745098, 1,
1.434853, -0.1086179, -0.9335588, 1, 0, 0.4666667, 1,
1.451472, 0.06806124, 0.2650378, 1, 0, 0.4627451, 1,
1.46268, 0.008962531, 1.847838, 1, 0, 0.454902, 1,
1.474339, 0.5906475, 0.4901748, 1, 0, 0.4509804, 1,
1.48151, 0.685008, 0.4918217, 1, 0, 0.4431373, 1,
1.492926, -0.933262, 0.3446211, 1, 0, 0.4392157, 1,
1.500421, -0.4433439, 0.8323784, 1, 0, 0.4313726, 1,
1.507184, -0.5620729, 2.797085, 1, 0, 0.427451, 1,
1.508512, 1.82225, -0.004569395, 1, 0, 0.4196078, 1,
1.50885, -0.02367744, 2.539961, 1, 0, 0.4156863, 1,
1.51499, 0.3854547, 2.486857, 1, 0, 0.4078431, 1,
1.515391, -0.7666236, 3.436553, 1, 0, 0.4039216, 1,
1.519641, 1.312027, 2.741883, 1, 0, 0.3960784, 1,
1.520226, -2.263917, 3.0287, 1, 0, 0.3882353, 1,
1.521967, -0.4877199, 4.277716, 1, 0, 0.3843137, 1,
1.522381, -1.494217, 0.450656, 1, 0, 0.3764706, 1,
1.525387, 0.5265383, 3.02929, 1, 0, 0.372549, 1,
1.543413, -0.5045922, 1.842549, 1, 0, 0.3647059, 1,
1.544322, 0.4991485, 1.334913, 1, 0, 0.3607843, 1,
1.550803, 0.7350646, 2.634631, 1, 0, 0.3529412, 1,
1.553392, 0.1025137, 2.026678, 1, 0, 0.3490196, 1,
1.588052, -0.04176309, 1.442622, 1, 0, 0.3411765, 1,
1.598473, -0.05498155, 3.317888, 1, 0, 0.3372549, 1,
1.59911, -2.19857, 2.743451, 1, 0, 0.3294118, 1,
1.602542, 1.679875, 1.1944, 1, 0, 0.3254902, 1,
1.604406, 1.341201, 1.72108, 1, 0, 0.3176471, 1,
1.641325, 0.3575511, 1.165997, 1, 0, 0.3137255, 1,
1.642509, 0.4464501, 1.96351, 1, 0, 0.3058824, 1,
1.643388, 0.3110394, 1.743088, 1, 0, 0.2980392, 1,
1.661463, 0.05349038, 0.03697728, 1, 0, 0.2941177, 1,
1.666063, 0.5439048, 1.57465, 1, 0, 0.2862745, 1,
1.666644, -1.249612, 1.20157, 1, 0, 0.282353, 1,
1.677347, 1.306515, 0.7337794, 1, 0, 0.2745098, 1,
1.689198, -0.01322807, 3.515528, 1, 0, 0.2705882, 1,
1.697125, 0.5574056, 0.157948, 1, 0, 0.2627451, 1,
1.703705, 0.9306552, 1.393677, 1, 0, 0.2588235, 1,
1.708882, 0.5074537, 0.7544918, 1, 0, 0.2509804, 1,
1.724488, 1.369689, 3.977707, 1, 0, 0.2470588, 1,
1.761694, -0.06026389, 1.098551, 1, 0, 0.2392157, 1,
1.783602, 0.3184392, 0.8165281, 1, 0, 0.2352941, 1,
1.793447, 1.479847, 0.6258318, 1, 0, 0.227451, 1,
1.795603, 0.2720047, 1.164658, 1, 0, 0.2235294, 1,
1.811633, 0.6737988, 3.333837, 1, 0, 0.2156863, 1,
1.847846, 1.220944, 2.72576, 1, 0, 0.2117647, 1,
1.861451, -0.4906259, 3.519248, 1, 0, 0.2039216, 1,
1.866477, -0.4215823, 3.738799, 1, 0, 0.1960784, 1,
1.872357, 0.2159459, 1.17986, 1, 0, 0.1921569, 1,
1.8767, 0.7644518, 1.197651, 1, 0, 0.1843137, 1,
1.889927, 1.013639, 1.646967, 1, 0, 0.1803922, 1,
1.928136, 0.2350437, 2.844662, 1, 0, 0.172549, 1,
1.930807, 0.535167, 2.8032, 1, 0, 0.1686275, 1,
1.951992, 0.4691326, 1.772539, 1, 0, 0.1607843, 1,
1.986906, -0.1995482, 1.443445, 1, 0, 0.1568628, 1,
1.989609, -0.1717824, 1.935592, 1, 0, 0.1490196, 1,
2.000302, 0.9707567, 1.505478, 1, 0, 0.145098, 1,
2.00097, -1.724237, 0.3280732, 1, 0, 0.1372549, 1,
2.071692, 1.83214, 1.557446, 1, 0, 0.1333333, 1,
2.104772, 0.8757089, 1.478192, 1, 0, 0.1254902, 1,
2.16312, 0.547195, -0.2730743, 1, 0, 0.1215686, 1,
2.163849, 0.4225989, 2.350807, 1, 0, 0.1137255, 1,
2.181041, 0.9887387, -0.4866823, 1, 0, 0.1098039, 1,
2.181811, 0.0159413, 3.705303, 1, 0, 0.1019608, 1,
2.188323, -1.06506, 3.966363, 1, 0, 0.09411765, 1,
2.214224, -0.1506623, 0.7098213, 1, 0, 0.09019608, 1,
2.250124, 1.576517, 1.702485, 1, 0, 0.08235294, 1,
2.283855, -0.724051, 0.8396075, 1, 0, 0.07843138, 1,
2.303085, 0.1288095, 1.212381, 1, 0, 0.07058824, 1,
2.35224, -1.326307, 1.606501, 1, 0, 0.06666667, 1,
2.396458, -0.5533655, 2.026143, 1, 0, 0.05882353, 1,
2.396983, -1.962401, 1.507818, 1, 0, 0.05490196, 1,
2.460966, 0.6849387, 0.7449402, 1, 0, 0.04705882, 1,
2.592111, 0.5741051, -0.8089496, 1, 0, 0.04313726, 1,
2.699743, 0.6544628, -0.1241429, 1, 0, 0.03529412, 1,
2.757798, 0.4124885, 2.445254, 1, 0, 0.03137255, 1,
2.826283, -0.5478183, 1.56322, 1, 0, 0.02352941, 1,
2.831739, -0.4111813, 2.741336, 1, 0, 0.01960784, 1,
2.949957, -0.4112649, 0.6465732, 1, 0, 0.01176471, 1,
3.089886, -0.1165845, 3.7647, 1, 0, 0.007843138, 1
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
-0.01873124, -4.143491, -7.044589, 0, -0.5, 0.5, 0.5,
-0.01873124, -4.143491, -7.044589, 1, -0.5, 0.5, 0.5,
-0.01873124, -4.143491, -7.044589, 1, 1.5, 0.5, 0.5,
-0.01873124, -4.143491, -7.044589, 0, 1.5, 0.5, 0.5
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
-4.18117, 0.2384932, -7.044589, 0, -0.5, 0.5, 0.5,
-4.18117, 0.2384932, -7.044589, 1, -0.5, 0.5, 0.5,
-4.18117, 0.2384932, -7.044589, 1, 1.5, 0.5, 0.5,
-4.18117, 0.2384932, -7.044589, 0, 1.5, 0.5, 0.5
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
-4.18117, -4.143491, -0.04382896, 0, -0.5, 0.5, 0.5,
-4.18117, -4.143491, -0.04382896, 1, -0.5, 0.5, 0.5,
-4.18117, -4.143491, -0.04382896, 1, 1.5, 0.5, 0.5,
-4.18117, -4.143491, -0.04382896, 0, 1.5, 0.5, 0.5
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
-3, -3.132264, -5.429029,
3, -3.132264, -5.429029,
-3, -3.132264, -5.429029,
-3, -3.300802, -5.698288,
-2, -3.132264, -5.429029,
-2, -3.300802, -5.698288,
-1, -3.132264, -5.429029,
-1, -3.300802, -5.698288,
0, -3.132264, -5.429029,
0, -3.300802, -5.698288,
1, -3.132264, -5.429029,
1, -3.300802, -5.698288,
2, -3.132264, -5.429029,
2, -3.300802, -5.698288,
3, -3.132264, -5.429029,
3, -3.300802, -5.698288
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
-3, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
-3, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
-3, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
-3, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
-2, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
-2, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
-2, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
-2, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
-1, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
-1, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
-1, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
-1, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
0, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
0, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
0, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
0, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
1, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
1, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
1, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
1, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
2, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
2, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
2, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
2, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5,
3, -3.637877, -6.236809, 0, -0.5, 0.5, 0.5,
3, -3.637877, -6.236809, 1, -0.5, 0.5, 0.5,
3, -3.637877, -6.236809, 1, 1.5, 0.5, 0.5,
3, -3.637877, -6.236809, 0, 1.5, 0.5, 0.5
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
-3.220607, -3, -5.429029,
-3.220607, 3, -5.429029,
-3.220607, -3, -5.429029,
-3.380701, -3, -5.698288,
-3.220607, -2, -5.429029,
-3.380701, -2, -5.698288,
-3.220607, -1, -5.429029,
-3.380701, -1, -5.698288,
-3.220607, 0, -5.429029,
-3.380701, 0, -5.698288,
-3.220607, 1, -5.429029,
-3.380701, 1, -5.698288,
-3.220607, 2, -5.429029,
-3.380701, 2, -5.698288,
-3.220607, 3, -5.429029,
-3.380701, 3, -5.698288
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
-3.700889, -3, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, -3, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, -3, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, -3, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, -2, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, -2, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, -2, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, -2, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, -1, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, -1, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, -1, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, -1, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, 0, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, 0, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, 0, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, 0, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, 1, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, 1, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, 1, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, 1, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, 2, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, 2, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, 2, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, 2, -6.236809, 0, 1.5, 0.5, 0.5,
-3.700889, 3, -6.236809, 0, -0.5, 0.5, 0.5,
-3.700889, 3, -6.236809, 1, -0.5, 0.5, 0.5,
-3.700889, 3, -6.236809, 1, 1.5, 0.5, 0.5,
-3.700889, 3, -6.236809, 0, 1.5, 0.5, 0.5
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
-3.220607, -3.132264, -4,
-3.220607, -3.132264, 4,
-3.220607, -3.132264, -4,
-3.380701, -3.300802, -4,
-3.220607, -3.132264, -2,
-3.380701, -3.300802, -2,
-3.220607, -3.132264, 0,
-3.380701, -3.300802, 0,
-3.220607, -3.132264, 2,
-3.380701, -3.300802, 2,
-3.220607, -3.132264, 4,
-3.380701, -3.300802, 4
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
-3.700889, -3.637877, -4, 0, -0.5, 0.5, 0.5,
-3.700889, -3.637877, -4, 1, -0.5, 0.5, 0.5,
-3.700889, -3.637877, -4, 1, 1.5, 0.5, 0.5,
-3.700889, -3.637877, -4, 0, 1.5, 0.5, 0.5,
-3.700889, -3.637877, -2, 0, -0.5, 0.5, 0.5,
-3.700889, -3.637877, -2, 1, -0.5, 0.5, 0.5,
-3.700889, -3.637877, -2, 1, 1.5, 0.5, 0.5,
-3.700889, -3.637877, -2, 0, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 0, 0, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 0, 1, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 0, 1, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 0, 0, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 2, 0, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 2, 1, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 2, 1, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 2, 0, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 4, 0, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 4, 1, -0.5, 0.5, 0.5,
-3.700889, -3.637877, 4, 1, 1.5, 0.5, 0.5,
-3.700889, -3.637877, 4, 0, 1.5, 0.5, 0.5
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
-3.220607, -3.132264, -5.429029,
-3.220607, 3.60925, -5.429029,
-3.220607, -3.132264, 5.341371,
-3.220607, 3.60925, 5.341371,
-3.220607, -3.132264, -5.429029,
-3.220607, -3.132264, 5.341371,
-3.220607, 3.60925, -5.429029,
-3.220607, 3.60925, 5.341371,
-3.220607, -3.132264, -5.429029,
3.183145, -3.132264, -5.429029,
-3.220607, -3.132264, 5.341371,
3.183145, -3.132264, 5.341371,
-3.220607, 3.60925, -5.429029,
3.183145, 3.60925, -5.429029,
-3.220607, 3.60925, 5.341371,
3.183145, 3.60925, 5.341371,
3.183145, -3.132264, -5.429029,
3.183145, 3.60925, -5.429029,
3.183145, -3.132264, 5.341371,
3.183145, 3.60925, 5.341371,
3.183145, -3.132264, -5.429029,
3.183145, -3.132264, 5.341371,
3.183145, 3.60925, -5.429029,
3.183145, 3.60925, 5.341371
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
var radius = 7.59788;
var distance = 33.80383;
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
mvMatrix.translate( 0.01873124, -0.2384932, 0.04382896 );
mvMatrix.scale( 1.282838, 1.218566, 0.7627366 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80383);
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


