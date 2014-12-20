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
-3.479307, -0.4977309, -2.272332, 1, 0, 0, 1,
-3.373946, 1.45649, -0.5416018, 1, 0.007843138, 0, 1,
-3.157979, -0.1520541, -1.771611, 1, 0.01176471, 0, 1,
-3.090711, 1.967971, -0.1711589, 1, 0.01960784, 0, 1,
-2.980852, -0.1925659, -2.740341, 1, 0.02352941, 0, 1,
-2.92619, 0.2950532, -1.649503, 1, 0.03137255, 0, 1,
-2.823853, 0.5206393, -0.8127973, 1, 0.03529412, 0, 1,
-2.801117, -1.07691, -0.4566872, 1, 0.04313726, 0, 1,
-2.731272, -0.1382497, -2.119938, 1, 0.04705882, 0, 1,
-2.729843, 2.905757, -0.1430764, 1, 0.05490196, 0, 1,
-2.713069, 1.060308, -1.989727, 1, 0.05882353, 0, 1,
-2.711465, 0.6029819, 0.04674334, 1, 0.06666667, 0, 1,
-2.660971, 1.121671, -1.875273, 1, 0.07058824, 0, 1,
-2.657918, 1.05284, -0.002717642, 1, 0.07843138, 0, 1,
-2.611267, -2.250245, -0.32168, 1, 0.08235294, 0, 1,
-2.510581, 1.672901, -0.02218724, 1, 0.09019608, 0, 1,
-2.397217, -2.297227, -3.419612, 1, 0.09411765, 0, 1,
-2.355611, -1.074251, -2.79864, 1, 0.1019608, 0, 1,
-2.355287, -1.022813, -2.129116, 1, 0.1098039, 0, 1,
-2.352932, 1.058005, -1.389076, 1, 0.1137255, 0, 1,
-2.300163, -0.0357435, -2.335079, 1, 0.1215686, 0, 1,
-2.290289, -0.9601648, -3.00625, 1, 0.1254902, 0, 1,
-2.267237, 2.10002, -1.093812, 1, 0.1333333, 0, 1,
-2.238456, 0.9043363, -0.2944502, 1, 0.1372549, 0, 1,
-2.231011, 0.5281075, 0.09554262, 1, 0.145098, 0, 1,
-2.2305, -1.717074, -1.692061, 1, 0.1490196, 0, 1,
-2.210457, 0.7236341, -0.8524236, 1, 0.1568628, 0, 1,
-2.168111, -0.2130157, -1.794171, 1, 0.1607843, 0, 1,
-2.139772, 1.782329, -1.969612, 1, 0.1686275, 0, 1,
-2.129318, -1.384278, -4.36346, 1, 0.172549, 0, 1,
-2.110568, -0.1364453, -1.06608, 1, 0.1803922, 0, 1,
-2.066797, -0.8848585, -1.586021, 1, 0.1843137, 0, 1,
-2.031831, -1.193554, -1.781697, 1, 0.1921569, 0, 1,
-2.014932, 0.6210793, -0.5973835, 1, 0.1960784, 0, 1,
-1.968597, -0.4318284, -1.956102, 1, 0.2039216, 0, 1,
-1.960722, 0.1698751, -1.420309, 1, 0.2117647, 0, 1,
-1.886885, -0.3528477, -2.77547, 1, 0.2156863, 0, 1,
-1.885933, 0.5776013, 0.1328261, 1, 0.2235294, 0, 1,
-1.869556, -0.4240017, -1.424237, 1, 0.227451, 0, 1,
-1.861132, 1.233433, 0.01595833, 1, 0.2352941, 0, 1,
-1.847389, -2.229107, -0.9803054, 1, 0.2392157, 0, 1,
-1.84011, 1.027243, -2.680166, 1, 0.2470588, 0, 1,
-1.799843, -0.1946601, -1.425722, 1, 0.2509804, 0, 1,
-1.799396, 0.9878836, -1.097992, 1, 0.2588235, 0, 1,
-1.792371, -0.8222526, -3.841284, 1, 0.2627451, 0, 1,
-1.78201, -1.05563, -0.1884985, 1, 0.2705882, 0, 1,
-1.775685, -0.4470319, -2.760981, 1, 0.2745098, 0, 1,
-1.773818, 0.8461823, 0.2925866, 1, 0.282353, 0, 1,
-1.771226, -2.863777, -3.454155, 1, 0.2862745, 0, 1,
-1.72989, 1.458976, -1.266436, 1, 0.2941177, 0, 1,
-1.726065, -0.246345, -3.609961, 1, 0.3019608, 0, 1,
-1.716105, 0.9245226, -2.019136, 1, 0.3058824, 0, 1,
-1.704639, -1.320931, -1.164725, 1, 0.3137255, 0, 1,
-1.702576, 0.4292757, -0.3436855, 1, 0.3176471, 0, 1,
-1.699816, -1.510551, -2.512168, 1, 0.3254902, 0, 1,
-1.686062, 1.359186, -0.791324, 1, 0.3294118, 0, 1,
-1.676579, -0.05846502, -1.662976, 1, 0.3372549, 0, 1,
-1.673213, 0.659093, -1.621423, 1, 0.3411765, 0, 1,
-1.663173, 0.8506915, -2.046869, 1, 0.3490196, 0, 1,
-1.663012, 0.1047861, -1.081998, 1, 0.3529412, 0, 1,
-1.659368, 0.208511, -1.42557, 1, 0.3607843, 0, 1,
-1.656645, 0.3952721, -1.170751, 1, 0.3647059, 0, 1,
-1.650821, -0.5507932, -1.59031, 1, 0.372549, 0, 1,
-1.646778, -0.4253501, -1.530609, 1, 0.3764706, 0, 1,
-1.632887, -0.8629249, -3.588285, 1, 0.3843137, 0, 1,
-1.624521, 0.7632093, -0.4682035, 1, 0.3882353, 0, 1,
-1.608856, 0.5243638, -1.90459, 1, 0.3960784, 0, 1,
-1.604729, -2.190231, -2.617729, 1, 0.4039216, 0, 1,
-1.583172, 0.2379006, -1.197725, 1, 0.4078431, 0, 1,
-1.555906, -1.308468, -1.961168, 1, 0.4156863, 0, 1,
-1.553562, 0.7929476, -2.469846, 1, 0.4196078, 0, 1,
-1.545037, 2.374274, -1.424201, 1, 0.427451, 0, 1,
-1.535583, 0.6595693, -0.5723016, 1, 0.4313726, 0, 1,
-1.530048, -0.4986643, -1.457827, 1, 0.4392157, 0, 1,
-1.529558, -1.221071, -2.387907, 1, 0.4431373, 0, 1,
-1.512742, 0.3974801, -2.339501, 1, 0.4509804, 0, 1,
-1.501118, 0.2336861, -0.8846728, 1, 0.454902, 0, 1,
-1.495457, 0.8733969, -0.8710505, 1, 0.4627451, 0, 1,
-1.483217, 0.8826618, -2.160772, 1, 0.4666667, 0, 1,
-1.481507, -2.415814, -2.087644, 1, 0.4745098, 0, 1,
-1.476609, -1.930951, -3.381546, 1, 0.4784314, 0, 1,
-1.471274, -1.740338, -1.179176, 1, 0.4862745, 0, 1,
-1.470925, 0.2659104, -2.798624, 1, 0.4901961, 0, 1,
-1.46672, 0.5324972, -0.02109006, 1, 0.4980392, 0, 1,
-1.4579, 1.361824, -2.416583, 1, 0.5058824, 0, 1,
-1.427555, -0.3358632, -1.61339, 1, 0.509804, 0, 1,
-1.423858, 0.3417214, -0.1992891, 1, 0.5176471, 0, 1,
-1.400598, -0.8231189, -1.586322, 1, 0.5215687, 0, 1,
-1.400458, -0.04076301, -0.9134399, 1, 0.5294118, 0, 1,
-1.390271, -0.05276103, -2.272701, 1, 0.5333334, 0, 1,
-1.38927, 0.2220882, -0.3867405, 1, 0.5411765, 0, 1,
-1.386324, 2.303417, -0.545705, 1, 0.5450981, 0, 1,
-1.381576, 0.8430506, -2.079419, 1, 0.5529412, 0, 1,
-1.361578, 0.3665359, -1.422009, 1, 0.5568628, 0, 1,
-1.354274, 2.584597, -0.4022593, 1, 0.5647059, 0, 1,
-1.338368, 0.6769089, -0.2554969, 1, 0.5686275, 0, 1,
-1.333414, -0.3892676, -1.092222, 1, 0.5764706, 0, 1,
-1.327563, 0.7433525, -2.229255, 1, 0.5803922, 0, 1,
-1.322456, 0.979371, -1.329718, 1, 0.5882353, 0, 1,
-1.315268, -0.160671, -1.2492, 1, 0.5921569, 0, 1,
-1.313349, 0.6058519, 0.5505031, 1, 0.6, 0, 1,
-1.307339, 0.1737991, -1.580735, 1, 0.6078432, 0, 1,
-1.306801, -2.126253, -2.533456, 1, 0.6117647, 0, 1,
-1.304216, 1.175572, -0.6211513, 1, 0.6196079, 0, 1,
-1.303804, 0.8320401, -2.212924, 1, 0.6235294, 0, 1,
-1.302174, -2.431444, -1.594611, 1, 0.6313726, 0, 1,
-1.297957, -0.6794748, -2.669143, 1, 0.6352941, 0, 1,
-1.294324, 0.2711576, -0.7993255, 1, 0.6431373, 0, 1,
-1.291021, 2.241521, -0.1299235, 1, 0.6470588, 0, 1,
-1.290058, 2.054906, -1.093543, 1, 0.654902, 0, 1,
-1.26676, -0.1795575, -2.097846, 1, 0.6588235, 0, 1,
-1.266126, -0.7484498, -2.655592, 1, 0.6666667, 0, 1,
-1.252706, 0.911499, -1.485922, 1, 0.6705883, 0, 1,
-1.243235, 0.6800431, 0.2274366, 1, 0.6784314, 0, 1,
-1.238691, -0.2280167, -4.008578, 1, 0.682353, 0, 1,
-1.231475, 0.02655426, -2.282955, 1, 0.6901961, 0, 1,
-1.228476, 0.1328772, 0.2365902, 1, 0.6941177, 0, 1,
-1.222674, 1.090307, -0.384327, 1, 0.7019608, 0, 1,
-1.221481, 0.03729369, -1.161903, 1, 0.7098039, 0, 1,
-1.219596, -0.6864088, -4.378746, 1, 0.7137255, 0, 1,
-1.213241, -1.845695, -0.6008122, 1, 0.7215686, 0, 1,
-1.200252, 0.5279314, -1.205908, 1, 0.7254902, 0, 1,
-1.198293, 0.05863439, -2.756748, 1, 0.7333333, 0, 1,
-1.195307, -0.7306793, -1.421812, 1, 0.7372549, 0, 1,
-1.189167, -0.4128432, -0.6536335, 1, 0.7450981, 0, 1,
-1.18631, -1.306827, -1.579376, 1, 0.7490196, 0, 1,
-1.183604, -0.3659659, -1.671303, 1, 0.7568628, 0, 1,
-1.182229, 0.06466305, -2.574161, 1, 0.7607843, 0, 1,
-1.179799, -0.7596187, -1.844834, 1, 0.7686275, 0, 1,
-1.175414, -0.1954386, -2.41886, 1, 0.772549, 0, 1,
-1.173771, -2.161788, -3.935071, 1, 0.7803922, 0, 1,
-1.169692, -0.7021965, -3.279782, 1, 0.7843137, 0, 1,
-1.166298, -0.4241593, -3.033742, 1, 0.7921569, 0, 1,
-1.162568, 0.6746752, -0.9672636, 1, 0.7960784, 0, 1,
-1.156797, 0.2236803, -1.819513, 1, 0.8039216, 0, 1,
-1.147753, 1.174119, -1.165047, 1, 0.8117647, 0, 1,
-1.140057, 2.068066, -1.964425, 1, 0.8156863, 0, 1,
-1.131564, 0.04643768, -2.271312, 1, 0.8235294, 0, 1,
-1.121685, 0.7972911, -0.8693595, 1, 0.827451, 0, 1,
-1.118739, 0.08530287, -0.480035, 1, 0.8352941, 0, 1,
-1.106458, -1.307705, -1.876371, 1, 0.8392157, 0, 1,
-1.103403, 0.3084877, -0.5777375, 1, 0.8470588, 0, 1,
-1.102099, 1.076225, -2.368587, 1, 0.8509804, 0, 1,
-1.098208, 1.084454, 0.007646861, 1, 0.8588235, 0, 1,
-1.097247, -1.738472, -1.763346, 1, 0.8627451, 0, 1,
-1.093196, -3.112271, -2.589903, 1, 0.8705882, 0, 1,
-1.088493, 1.376304, -1.820729, 1, 0.8745098, 0, 1,
-1.087574, -2.211065, -3.469868, 1, 0.8823529, 0, 1,
-1.077239, -0.481634, -2.986337, 1, 0.8862745, 0, 1,
-1.075056, -0.09884449, -0.5870807, 1, 0.8941177, 0, 1,
-1.073719, 1.249833, -0.6021796, 1, 0.8980392, 0, 1,
-1.072238, 0.5570933, -0.2794994, 1, 0.9058824, 0, 1,
-1.068309, -0.758707, -1.762481, 1, 0.9137255, 0, 1,
-1.067896, 1.045344, -1.395806, 1, 0.9176471, 0, 1,
-1.064705, -1.38936, -2.011596, 1, 0.9254902, 0, 1,
-1.053791, 1.778937, 0.9179233, 1, 0.9294118, 0, 1,
-1.046128, 0.5528236, -0.4125388, 1, 0.9372549, 0, 1,
-1.042982, -0.7836822, -1.647448, 1, 0.9411765, 0, 1,
-1.038605, 1.636708, -0.541235, 1, 0.9490196, 0, 1,
-1.036429, 0.1988111, -0.7780389, 1, 0.9529412, 0, 1,
-1.036269, -0.9036991, -1.653348, 1, 0.9607843, 0, 1,
-1.033545, 1.236263, -2.403109, 1, 0.9647059, 0, 1,
-1.032255, 0.3820584, 0.07342789, 1, 0.972549, 0, 1,
-1.03007, 0.5909567, 0.3610606, 1, 0.9764706, 0, 1,
-1.029021, -0.152121, -3.264753, 1, 0.9843137, 0, 1,
-1.008344, 0.0908134, -0.5704613, 1, 0.9882353, 0, 1,
-1.003695, -1.129419, -1.770472, 1, 0.9960784, 0, 1,
-0.9960988, 0.04179027, -2.696496, 0.9960784, 1, 0, 1,
-0.9902874, 1.278298, 0.08765988, 0.9921569, 1, 0, 1,
-0.9818915, -1.982561, -1.504899, 0.9843137, 1, 0, 1,
-0.9752573, 0.0557335, -1.799971, 0.9803922, 1, 0, 1,
-0.9722672, -0.7856822, -1.189885, 0.972549, 1, 0, 1,
-0.9721189, 1.652264, -0.009943321, 0.9686275, 1, 0, 1,
-0.9704223, 1.05557, -1.034618, 0.9607843, 1, 0, 1,
-0.9702358, -1.510805, -2.855963, 0.9568627, 1, 0, 1,
-0.9658701, -2.37511, -1.411271, 0.9490196, 1, 0, 1,
-0.9632806, 1.240055, -1.137273, 0.945098, 1, 0, 1,
-0.9619363, -1.201122, -3.219058, 0.9372549, 1, 0, 1,
-0.9603397, 0.4175039, -1.150668, 0.9333333, 1, 0, 1,
-0.9547054, -0.4712448, -3.015486, 0.9254902, 1, 0, 1,
-0.9515222, -0.03458849, -3.191641, 0.9215686, 1, 0, 1,
-0.9474682, 0.5433807, -0.7846412, 0.9137255, 1, 0, 1,
-0.9443619, -0.3289734, -2.320114, 0.9098039, 1, 0, 1,
-0.9289917, -0.1178766, -2.3719, 0.9019608, 1, 0, 1,
-0.9271621, 1.014199, -1.525231, 0.8941177, 1, 0, 1,
-0.9252688, -1.039033, -3.392071, 0.8901961, 1, 0, 1,
-0.9214855, -0.3517778, -1.727981, 0.8823529, 1, 0, 1,
-0.918229, 0.8486549, 0.120368, 0.8784314, 1, 0, 1,
-0.9180306, -2.395112, -3.264325, 0.8705882, 1, 0, 1,
-0.916653, -0.4338907, -1.403082, 0.8666667, 1, 0, 1,
-0.9120609, -0.264805, -2.070075, 0.8588235, 1, 0, 1,
-0.9092415, -0.7514187, -2.154239, 0.854902, 1, 0, 1,
-0.9036356, 1.245229, -0.6417479, 0.8470588, 1, 0, 1,
-0.9027494, -1.410037, -1.80851, 0.8431373, 1, 0, 1,
-0.902508, 1.434191, -1.078453, 0.8352941, 1, 0, 1,
-0.8995841, 1.009469, 0.1283203, 0.8313726, 1, 0, 1,
-0.8959374, 1.571975, 1.080445, 0.8235294, 1, 0, 1,
-0.894324, 0.5501124, -0.5737644, 0.8196079, 1, 0, 1,
-0.8928742, -0.2899055, -1.679509, 0.8117647, 1, 0, 1,
-0.8845421, -0.362027, -1.6425, 0.8078431, 1, 0, 1,
-0.8808921, 1.823758, 0.3054477, 0.8, 1, 0, 1,
-0.8683941, -0.3615309, -1.35288, 0.7921569, 1, 0, 1,
-0.8663752, -1.324937, -1.937677, 0.7882353, 1, 0, 1,
-0.8564389, -0.1908222, -3.204906, 0.7803922, 1, 0, 1,
-0.8554841, -0.08920075, -0.7112063, 0.7764706, 1, 0, 1,
-0.8475368, -0.3123711, -1.966087, 0.7686275, 1, 0, 1,
-0.8429245, 0.5407625, -0.1722832, 0.7647059, 1, 0, 1,
-0.8367142, 1.31786, -0.07768084, 0.7568628, 1, 0, 1,
-0.8337929, 0.8118925, -0.9558744, 0.7529412, 1, 0, 1,
-0.8291973, 1.139407, -2.446671, 0.7450981, 1, 0, 1,
-0.8279184, 0.95203, -1.975598, 0.7411765, 1, 0, 1,
-0.8249391, 1.637787, 1.707575, 0.7333333, 1, 0, 1,
-0.8242579, 0.5725601, -1.115828, 0.7294118, 1, 0, 1,
-0.8237862, -1.225223, -0.9968721, 0.7215686, 1, 0, 1,
-0.8193602, 0.7659826, -0.5996582, 0.7176471, 1, 0, 1,
-0.8048749, -0.6776091, -1.933649, 0.7098039, 1, 0, 1,
-0.804087, -0.2183182, -0.93129, 0.7058824, 1, 0, 1,
-0.7993273, -0.365035, -2.090766, 0.6980392, 1, 0, 1,
-0.7927237, 1.340673, -1.562708, 0.6901961, 1, 0, 1,
-0.7924982, 0.6516836, -1.473754, 0.6862745, 1, 0, 1,
-0.7878627, 1.703335, -3.804377, 0.6784314, 1, 0, 1,
-0.7860824, 0.2792753, -2.225381, 0.6745098, 1, 0, 1,
-0.7836944, -0.9678847, -1.802628, 0.6666667, 1, 0, 1,
-0.7824107, -0.1760901, -2.038163, 0.6627451, 1, 0, 1,
-0.7772752, -1.746988, -2.787216, 0.654902, 1, 0, 1,
-0.7738857, 0.1009543, -2.284758, 0.6509804, 1, 0, 1,
-0.7734072, 0.8868725, -0.00267483, 0.6431373, 1, 0, 1,
-0.7668794, -1.19113, -1.906418, 0.6392157, 1, 0, 1,
-0.7651963, -0.2388363, -2.761419, 0.6313726, 1, 0, 1,
-0.7637564, -0.6694073, -2.598627, 0.627451, 1, 0, 1,
-0.7626927, 1.979567, -0.9588763, 0.6196079, 1, 0, 1,
-0.7608409, -0.383031, -1.74137, 0.6156863, 1, 0, 1,
-0.7604248, -0.2869085, -2.076434, 0.6078432, 1, 0, 1,
-0.75969, -0.5052602, -0.1142083, 0.6039216, 1, 0, 1,
-0.7591174, -1.492589, -2.937324, 0.5960785, 1, 0, 1,
-0.7491501, 1.053511, -1.272879, 0.5882353, 1, 0, 1,
-0.7486606, -1.007845, -2.788444, 0.5843138, 1, 0, 1,
-0.7282546, -0.7410179, -0.8394505, 0.5764706, 1, 0, 1,
-0.7270343, -0.5631567, -1.6192, 0.572549, 1, 0, 1,
-0.7253352, -0.3804108, -1.799412, 0.5647059, 1, 0, 1,
-0.7069157, 0.6596698, -2.295175, 0.5607843, 1, 0, 1,
-0.704583, 1.698176, 0.008888778, 0.5529412, 1, 0, 1,
-0.6992796, -1.105433, -4.14648, 0.5490196, 1, 0, 1,
-0.6985902, 0.2468104, 0.66668, 0.5411765, 1, 0, 1,
-0.6965705, -1.97836, -3.63272, 0.5372549, 1, 0, 1,
-0.6944259, -0.9459442, -1.853805, 0.5294118, 1, 0, 1,
-0.6910468, -0.3322478, -2.236375, 0.5254902, 1, 0, 1,
-0.6910033, -0.3729936, -1.115307, 0.5176471, 1, 0, 1,
-0.6895677, -0.5532661, -3.27869, 0.5137255, 1, 0, 1,
-0.6891163, 1.897835, -0.02016062, 0.5058824, 1, 0, 1,
-0.6861386, 0.4962655, -1.403492, 0.5019608, 1, 0, 1,
-0.682498, 0.1456453, -0.1628671, 0.4941176, 1, 0, 1,
-0.6792008, -0.215389, -2.782331, 0.4862745, 1, 0, 1,
-0.6790739, 2.072474, -2.408196, 0.4823529, 1, 0, 1,
-0.6730569, 1.039296, -0.5023018, 0.4745098, 1, 0, 1,
-0.6729598, -0.4111572, -1.190822, 0.4705882, 1, 0, 1,
-0.6725861, -0.2052277, -2.168411, 0.4627451, 1, 0, 1,
-0.6700527, -0.6808913, -1.574281, 0.4588235, 1, 0, 1,
-0.6646596, -0.5432209, -3.708342, 0.4509804, 1, 0, 1,
-0.6626791, 0.8182657, 0.01932727, 0.4470588, 1, 0, 1,
-0.6603827, -2.051848, -2.999885, 0.4392157, 1, 0, 1,
-0.660365, 0.006246403, -0.6906105, 0.4352941, 1, 0, 1,
-0.6602702, 0.6644586, -0.1871475, 0.427451, 1, 0, 1,
-0.6584778, -0.494769, -1.405456, 0.4235294, 1, 0, 1,
-0.654295, 0.1207313, 0.1658372, 0.4156863, 1, 0, 1,
-0.6524903, -0.3567337, -0.349556, 0.4117647, 1, 0, 1,
-0.6464471, -1.17303, -2.18329, 0.4039216, 1, 0, 1,
-0.6442991, -0.06260283, -0.655793, 0.3960784, 1, 0, 1,
-0.6380394, 1.009098, -0.04921233, 0.3921569, 1, 0, 1,
-0.6324779, -0.1479042, -1.912031, 0.3843137, 1, 0, 1,
-0.628976, 0.1408313, -0.611109, 0.3803922, 1, 0, 1,
-0.6281393, -0.787042, -4.344672, 0.372549, 1, 0, 1,
-0.6277953, -1.128446, -4.420236, 0.3686275, 1, 0, 1,
-0.6270491, -1.487463, -4.181088, 0.3607843, 1, 0, 1,
-0.622, 1.099728, -0.685661, 0.3568628, 1, 0, 1,
-0.619626, -0.7179729, -1.5124, 0.3490196, 1, 0, 1,
-0.6170237, 1.316912, -0.07705542, 0.345098, 1, 0, 1,
-0.6167676, -0.03369211, -0.1167712, 0.3372549, 1, 0, 1,
-0.6149172, 0.1523744, -0.805537, 0.3333333, 1, 0, 1,
-0.6066383, -1.777648, -4.365156, 0.3254902, 1, 0, 1,
-0.6004248, 0.6145177, 0.4487075, 0.3215686, 1, 0, 1,
-0.5949047, 1.023141, 0.5001197, 0.3137255, 1, 0, 1,
-0.593866, 0.4911183, -1.288174, 0.3098039, 1, 0, 1,
-0.5875776, -0.7483006, -0.2051558, 0.3019608, 1, 0, 1,
-0.5871046, 0.4899314, -0.2432891, 0.2941177, 1, 0, 1,
-0.5815548, 1.260445, -0.3901408, 0.2901961, 1, 0, 1,
-0.5774149, -0.582662, -2.740768, 0.282353, 1, 0, 1,
-0.57105, 0.2002798, -1.032097, 0.2784314, 1, 0, 1,
-0.5698465, 1.541348, 0.412217, 0.2705882, 1, 0, 1,
-0.5630432, 1.133595, -1.391827, 0.2666667, 1, 0, 1,
-0.5572885, 0.6657944, 0.5818707, 0.2588235, 1, 0, 1,
-0.5566207, -0.7598547, -2.427471, 0.254902, 1, 0, 1,
-0.5525585, -1.136809, -0.2725476, 0.2470588, 1, 0, 1,
-0.5522591, 0.1098125, -0.6999382, 0.2431373, 1, 0, 1,
-0.549243, -0.06769477, -2.268751, 0.2352941, 1, 0, 1,
-0.5477567, -0.7093803, -2.241067, 0.2313726, 1, 0, 1,
-0.5473849, 0.4952607, -1.01023, 0.2235294, 1, 0, 1,
-0.5463222, 1.506376, 0.6687739, 0.2196078, 1, 0, 1,
-0.5447828, -1.2941, -4.845625, 0.2117647, 1, 0, 1,
-0.538913, 1.793119, 1.143278, 0.2078431, 1, 0, 1,
-0.5320195, -0.6877092, -0.08872719, 0.2, 1, 0, 1,
-0.5303963, -0.680107, -1.124982, 0.1921569, 1, 0, 1,
-0.5301985, -0.3587071, -2.246577, 0.1882353, 1, 0, 1,
-0.5263439, 0.8921522, -0.6001526, 0.1803922, 1, 0, 1,
-0.5242824, 0.8696092, 0.4500444, 0.1764706, 1, 0, 1,
-0.5206211, -1.276681, -3.079025, 0.1686275, 1, 0, 1,
-0.5205633, -0.1557999, -1.023929, 0.1647059, 1, 0, 1,
-0.5184918, -0.3135991, -1.631958, 0.1568628, 1, 0, 1,
-0.5166883, -1.078057, -2.02637, 0.1529412, 1, 0, 1,
-0.5127574, -0.1315021, -2.454566, 0.145098, 1, 0, 1,
-0.5082562, 0.2575632, -0.6579526, 0.1411765, 1, 0, 1,
-0.5061486, 2.12517, -0.02191182, 0.1333333, 1, 0, 1,
-0.5034168, -0.03787559, -1.089507, 0.1294118, 1, 0, 1,
-0.5017387, 2.130796, -1.154021, 0.1215686, 1, 0, 1,
-0.5010917, -0.7220362, -0.9710918, 0.1176471, 1, 0, 1,
-0.4998729, 0.124863, -0.6055524, 0.1098039, 1, 0, 1,
-0.497268, 0.4274414, -1.044359, 0.1058824, 1, 0, 1,
-0.495218, -2.019249, -3.423023, 0.09803922, 1, 0, 1,
-0.491543, -2.04617, -3.167077, 0.09019608, 1, 0, 1,
-0.4871455, 0.3695215, -0.7666041, 0.08627451, 1, 0, 1,
-0.48296, -0.850897, -1.783928, 0.07843138, 1, 0, 1,
-0.4814538, 2.022153, -0.1445759, 0.07450981, 1, 0, 1,
-0.4793697, 0.2697415, -2.430375, 0.06666667, 1, 0, 1,
-0.4764258, -1.493202, -1.974866, 0.0627451, 1, 0, 1,
-0.4758306, -0.7279679, -1.941121, 0.05490196, 1, 0, 1,
-0.4747102, 0.1251229, -3.347566, 0.05098039, 1, 0, 1,
-0.4736657, -1.528412, -2.194258, 0.04313726, 1, 0, 1,
-0.4592448, -0.0299638, -2.316957, 0.03921569, 1, 0, 1,
-0.4591772, 1.10111, -0.1523336, 0.03137255, 1, 0, 1,
-0.4572765, 0.2072003, 0.4019535, 0.02745098, 1, 0, 1,
-0.4534951, -0.9298868, -1.584157, 0.01960784, 1, 0, 1,
-0.4519475, 0.01450759, -2.081437, 0.01568628, 1, 0, 1,
-0.4519321, 0.1439312, -0.7790987, 0.007843138, 1, 0, 1,
-0.4511212, -0.5257879, -3.160163, 0.003921569, 1, 0, 1,
-0.4449537, 0.003228999, 0.1818473, 0, 1, 0.003921569, 1,
-0.4443534, -0.1440945, -1.251924, 0, 1, 0.01176471, 1,
-0.4378989, -0.5511532, -2.798415, 0, 1, 0.01568628, 1,
-0.4346811, 0.6718846, 1.144252, 0, 1, 0.02352941, 1,
-0.4321739, 1.037917, -0.2295476, 0, 1, 0.02745098, 1,
-0.4289724, -0.7320955, -1.961565, 0, 1, 0.03529412, 1,
-0.4287932, -1.441095, -2.515537, 0, 1, 0.03921569, 1,
-0.428738, 0.4548458, -0.9609292, 0, 1, 0.04705882, 1,
-0.4286317, 1.602751, -1.081353, 0, 1, 0.05098039, 1,
-0.4274128, -0.163267, -2.451417, 0, 1, 0.05882353, 1,
-0.421369, -0.06509941, -2.38366, 0, 1, 0.0627451, 1,
-0.4164141, 0.5360537, -1.711047, 0, 1, 0.07058824, 1,
-0.4154533, -0.8824289, -2.296028, 0, 1, 0.07450981, 1,
-0.4129676, 1.310446, 0.7832736, 0, 1, 0.08235294, 1,
-0.4106007, -0.8828065, -3.290824, 0, 1, 0.08627451, 1,
-0.4087254, -1.861517, -1.244499, 0, 1, 0.09411765, 1,
-0.4086177, 0.4737979, -0.4044212, 0, 1, 0.1019608, 1,
-0.4073115, 1.911996, -1.276362, 0, 1, 0.1058824, 1,
-0.4020851, 0.5810753, 0.1830682, 0, 1, 0.1137255, 1,
-0.398283, -0.8388273, -4.617732, 0, 1, 0.1176471, 1,
-0.3926668, 0.1607227, -1.020784, 0, 1, 0.1254902, 1,
-0.3918529, -0.1232892, -2.557826, 0, 1, 0.1294118, 1,
-0.3859699, -0.5365918, -1.123929, 0, 1, 0.1372549, 1,
-0.381938, 0.9493931, 1.110803, 0, 1, 0.1411765, 1,
-0.376568, 0.3253312, -0.7473074, 0, 1, 0.1490196, 1,
-0.375454, -1.413859, -2.196634, 0, 1, 0.1529412, 1,
-0.3727522, 0.1393401, -1.007472, 0, 1, 0.1607843, 1,
-0.369728, -0.8333178, -2.213014, 0, 1, 0.1647059, 1,
-0.3640937, -1.15913, -1.838531, 0, 1, 0.172549, 1,
-0.363927, 0.1577857, -3.11116, 0, 1, 0.1764706, 1,
-0.36148, -0.0711432, -1.397084, 0, 1, 0.1843137, 1,
-0.3593807, -0.2160651, -2.788623, 0, 1, 0.1882353, 1,
-0.3582546, 0.9410616, -0.4404438, 0, 1, 0.1960784, 1,
-0.3524012, -0.2166048, -2.626224, 0, 1, 0.2039216, 1,
-0.3485215, 0.1310025, -3.0658, 0, 1, 0.2078431, 1,
-0.3465031, -1.681532, -3.996043, 0, 1, 0.2156863, 1,
-0.342564, 2.109026, -0.02678923, 0, 1, 0.2196078, 1,
-0.3384703, 1.739584, -0.1038632, 0, 1, 0.227451, 1,
-0.3351653, 0.8306547, -0.2609173, 0, 1, 0.2313726, 1,
-0.3317392, -0.5748598, -2.92824, 0, 1, 0.2392157, 1,
-0.3302087, 2.290447, 0.5280579, 0, 1, 0.2431373, 1,
-0.3292083, -0.02348119, 0.5811601, 0, 1, 0.2509804, 1,
-0.3289815, -0.5495827, -1.482094, 0, 1, 0.254902, 1,
-0.3265884, 0.4086038, -0.5921286, 0, 1, 0.2627451, 1,
-0.3235499, 0.3811857, -2.086387, 0, 1, 0.2666667, 1,
-0.3229096, -0.8067479, -4.24578, 0, 1, 0.2745098, 1,
-0.3215888, -0.1539254, -2.994913, 0, 1, 0.2784314, 1,
-0.3207127, -0.6787528, -1.497656, 0, 1, 0.2862745, 1,
-0.3171057, -1.357679, -3.229994, 0, 1, 0.2901961, 1,
-0.3168926, -0.1202501, -1.581503, 0, 1, 0.2980392, 1,
-0.3094231, -1.056131, -2.137887, 0, 1, 0.3058824, 1,
-0.3081192, -1.230556, -3.145725, 0, 1, 0.3098039, 1,
-0.3079554, -0.350775, -1.979694, 0, 1, 0.3176471, 1,
-0.3042526, 1.49814, 0.9406397, 0, 1, 0.3215686, 1,
-0.3022305, 0.9131885, -0.2443564, 0, 1, 0.3294118, 1,
-0.2982899, -0.7434871, -2.979643, 0, 1, 0.3333333, 1,
-0.2980686, -0.9840924, -2.691803, 0, 1, 0.3411765, 1,
-0.296957, -0.2084054, -2.531482, 0, 1, 0.345098, 1,
-0.2967194, 0.9595259, 0.05963377, 0, 1, 0.3529412, 1,
-0.2951001, -0.5145833, -1.743818, 0, 1, 0.3568628, 1,
-0.2938993, -0.07865728, -2.918002, 0, 1, 0.3647059, 1,
-0.29303, 0.5992589, 0.6566765, 0, 1, 0.3686275, 1,
-0.2916852, 1.303449, -0.3414563, 0, 1, 0.3764706, 1,
-0.2845267, 1.067193, -1.0504, 0, 1, 0.3803922, 1,
-0.2840583, -0.6957359, -2.296634, 0, 1, 0.3882353, 1,
-0.2821932, -0.2037899, -1.913153, 0, 1, 0.3921569, 1,
-0.2770241, 2.303589, -0.833707, 0, 1, 0.4, 1,
-0.2769423, -0.5711075, -2.075872, 0, 1, 0.4078431, 1,
-0.2729571, -0.6908413, -4.446259, 0, 1, 0.4117647, 1,
-0.2704245, 0.5378239, -1.585764, 0, 1, 0.4196078, 1,
-0.2704016, -0.01630589, -0.7091476, 0, 1, 0.4235294, 1,
-0.2693807, 0.6939319, 2.610682, 0, 1, 0.4313726, 1,
-0.2640217, -0.4663875, -1.271958, 0, 1, 0.4352941, 1,
-0.2624525, 0.6258402, -1.423492, 0, 1, 0.4431373, 1,
-0.259691, -0.01425953, -1.042637, 0, 1, 0.4470588, 1,
-0.2587816, -1.038889, -3.0262, 0, 1, 0.454902, 1,
-0.256244, -1.04981, -3.065946, 0, 1, 0.4588235, 1,
-0.2494995, 0.1533289, -2.114518, 0, 1, 0.4666667, 1,
-0.2438923, -0.2122105, -0.7037238, 0, 1, 0.4705882, 1,
-0.2437592, 0.4001724, 0.0929269, 0, 1, 0.4784314, 1,
-0.2422464, 0.9268569, 0.4791937, 0, 1, 0.4823529, 1,
-0.2403986, 2.236699, 0.5064166, 0, 1, 0.4901961, 1,
-0.2341698, 1.28321, 0.8213984, 0, 1, 0.4941176, 1,
-0.2263649, 2.051112, -0.4011608, 0, 1, 0.5019608, 1,
-0.2202426, -0.6941078, -5.006873, 0, 1, 0.509804, 1,
-0.219006, -0.5335419, -3.021248, 0, 1, 0.5137255, 1,
-0.2183478, -0.828591, -1.743024, 0, 1, 0.5215687, 1,
-0.2178663, -0.4929247, -1.78522, 0, 1, 0.5254902, 1,
-0.2163458, -0.8188289, -3.057068, 0, 1, 0.5333334, 1,
-0.2117652, 0.1440664, -1.624579, 0, 1, 0.5372549, 1,
-0.2113249, 0.5731258, 0.9054762, 0, 1, 0.5450981, 1,
-0.2105345, 0.3646329, 1.396132, 0, 1, 0.5490196, 1,
-0.2033152, 1.211995, 1.063516, 0, 1, 0.5568628, 1,
-0.2004476, 0.8653659, 0.2155839, 0, 1, 0.5607843, 1,
-0.1960752, 0.1698066, 0.2034465, 0, 1, 0.5686275, 1,
-0.195139, 1.057982, 0.3419778, 0, 1, 0.572549, 1,
-0.1939438, 0.447896, -0.4992952, 0, 1, 0.5803922, 1,
-0.1934553, -2.223486, -5.039565, 0, 1, 0.5843138, 1,
-0.1862587, 0.2459453, 0.04685428, 0, 1, 0.5921569, 1,
-0.1859292, -2.249765, -4.695072, 0, 1, 0.5960785, 1,
-0.1802026, -0.7885003, -4.273978, 0, 1, 0.6039216, 1,
-0.1727018, -0.2858864, -2.768546, 0, 1, 0.6117647, 1,
-0.1704207, 0.5672126, 0.1355248, 0, 1, 0.6156863, 1,
-0.1647201, 0.2841036, 0.8145705, 0, 1, 0.6235294, 1,
-0.1623274, -0.02850701, -1.668535, 0, 1, 0.627451, 1,
-0.1614569, -2.263545, -2.565306, 0, 1, 0.6352941, 1,
-0.153743, -0.04595976, -3.215375, 0, 1, 0.6392157, 1,
-0.1506015, -0.7317215, -3.61522, 0, 1, 0.6470588, 1,
-0.1471247, 0.377279, 1.40307, 0, 1, 0.6509804, 1,
-0.1459015, 0.5845423, 0.05814296, 0, 1, 0.6588235, 1,
-0.1458766, -0.08529525, -2.174306, 0, 1, 0.6627451, 1,
-0.1458053, -0.01115589, -1.696265, 0, 1, 0.6705883, 1,
-0.1434779, -2.389394, -4.771723, 0, 1, 0.6745098, 1,
-0.1425827, -0.3148289, -1.990625, 0, 1, 0.682353, 1,
-0.1410305, -0.235468, -2.149478, 0, 1, 0.6862745, 1,
-0.1386342, 1.48395, -0.1653007, 0, 1, 0.6941177, 1,
-0.1382733, -0.1221435, -3.32681, 0, 1, 0.7019608, 1,
-0.1357154, -1.434298, -1.047594, 0, 1, 0.7058824, 1,
-0.1339573, 0.4291387, 0.1197855, 0, 1, 0.7137255, 1,
-0.1327048, -0.5860607, -5.026894, 0, 1, 0.7176471, 1,
-0.1245113, 1.190019, -0.1259909, 0, 1, 0.7254902, 1,
-0.1223308, -0.975153, -1.660817, 0, 1, 0.7294118, 1,
-0.1221254, -0.277292, -2.623936, 0, 1, 0.7372549, 1,
-0.1201787, -1.435529, -5.058839, 0, 1, 0.7411765, 1,
-0.1192801, 1.688318, -0.2129379, 0, 1, 0.7490196, 1,
-0.1191005, 0.5737037, -0.6351274, 0, 1, 0.7529412, 1,
-0.1150597, 0.3990366, -0.8966128, 0, 1, 0.7607843, 1,
-0.1099347, -0.1564858, -3.762761, 0, 1, 0.7647059, 1,
-0.1093358, 0.4397579, -0.6535619, 0, 1, 0.772549, 1,
-0.107477, -0.0870189, -0.8055496, 0, 1, 0.7764706, 1,
-0.1040119, -0.2072533, -3.795177, 0, 1, 0.7843137, 1,
-0.1027371, -1.796598, -2.179775, 0, 1, 0.7882353, 1,
-0.102081, 1.022612, 0.6468626, 0, 1, 0.7960784, 1,
-0.08989768, 0.5177964, 0.5745724, 0, 1, 0.8039216, 1,
-0.08617145, 0.7873692, -0.535401, 0, 1, 0.8078431, 1,
-0.08165258, -1.126223, -2.767425, 0, 1, 0.8156863, 1,
-0.08092056, -0.1410893, -2.1603, 0, 1, 0.8196079, 1,
-0.07629747, -0.1293882, -3.126866, 0, 1, 0.827451, 1,
-0.07607837, 1.329046, -1.334203, 0, 1, 0.8313726, 1,
-0.07473534, 0.2541957, -0.9388888, 0, 1, 0.8392157, 1,
-0.07324614, 0.3854208, -0.05871464, 0, 1, 0.8431373, 1,
-0.0722314, -0.6276801, -2.503157, 0, 1, 0.8509804, 1,
-0.07054438, 0.4366438, -0.6080624, 0, 1, 0.854902, 1,
-0.067435, 0.1489044, -1.59374, 0, 1, 0.8627451, 1,
-0.061531, -0.1204802, -3.567703, 0, 1, 0.8666667, 1,
-0.06124894, -1.375364, -3.211483, 0, 1, 0.8745098, 1,
-0.05784446, 0.03069525, -1.691343, 0, 1, 0.8784314, 1,
-0.05587651, -0.4557087, -3.186352, 0, 1, 0.8862745, 1,
-0.05357029, -0.4102469, -5.28064, 0, 1, 0.8901961, 1,
-0.05332348, -1.712239, -2.60657, 0, 1, 0.8980392, 1,
-0.05310194, 1.019176, -0.5585096, 0, 1, 0.9058824, 1,
-0.04759466, -1.401132, -1.997117, 0, 1, 0.9098039, 1,
-0.04594003, -0.0134028, -2.06283, 0, 1, 0.9176471, 1,
-0.03808531, -2.252128, -1.24747, 0, 1, 0.9215686, 1,
-0.03444566, 1.338085, 0.8122027, 0, 1, 0.9294118, 1,
-0.0330926, -0.7127444, -2.277724, 0, 1, 0.9333333, 1,
-0.02472994, -0.9710586, -3.772236, 0, 1, 0.9411765, 1,
-0.01893703, 0.7240839, -0.02621906, 0, 1, 0.945098, 1,
-0.0170205, 0.7966614, 0.9345942, 0, 1, 0.9529412, 1,
-0.01689539, 0.3932979, -0.2244765, 0, 1, 0.9568627, 1,
-0.01578859, 0.07278247, 0.6186586, 0, 1, 0.9647059, 1,
-0.01220162, 0.1953874, -0.2412315, 0, 1, 0.9686275, 1,
-0.009364478, -0.3792671, -1.646014, 0, 1, 0.9764706, 1,
-0.004494434, 0.1719305, -0.1353185, 0, 1, 0.9803922, 1,
0.0004663483, 0.4896053, -0.4166749, 0, 1, 0.9882353, 1,
0.01250069, -1.548488, 2.385899, 0, 1, 0.9921569, 1,
0.01304108, 0.5033153, 0.01102826, 0, 1, 1, 1,
0.01366661, -0.3764737, 3.014001, 0, 0.9921569, 1, 1,
0.01466939, 0.4759456, -0.1127423, 0, 0.9882353, 1, 1,
0.01648299, 1.211953, -0.45193, 0, 0.9803922, 1, 1,
0.01733899, -3.335294, 2.03015, 0, 0.9764706, 1, 1,
0.01820727, -0.7407321, 3.570152, 0, 0.9686275, 1, 1,
0.0183619, 0.2412028, -0.06053964, 0, 0.9647059, 1, 1,
0.02174207, -0.05474512, 2.484286, 0, 0.9568627, 1, 1,
0.02723982, -1.135277, 3.094781, 0, 0.9529412, 1, 1,
0.03292475, 1.469408, -0.7698093, 0, 0.945098, 1, 1,
0.03328363, 0.5272119, 2.503266, 0, 0.9411765, 1, 1,
0.03546546, -0.05781399, 3.180066, 0, 0.9333333, 1, 1,
0.03580581, 0.2641651, 0.4347558, 0, 0.9294118, 1, 1,
0.03691973, 0.9460623, -0.9592216, 0, 0.9215686, 1, 1,
0.03783898, 1.653959, -0.2158645, 0, 0.9176471, 1, 1,
0.04245901, 0.6929536, 0.6043893, 0, 0.9098039, 1, 1,
0.0450236, -0.3071741, 3.386217, 0, 0.9058824, 1, 1,
0.04830612, -1.256626, 4.281505, 0, 0.8980392, 1, 1,
0.05439487, -0.05315717, 3.077928, 0, 0.8901961, 1, 1,
0.05455174, -1.180938, 2.022511, 0, 0.8862745, 1, 1,
0.05872511, -1.406349, 3.022278, 0, 0.8784314, 1, 1,
0.06028683, 0.6348096, -1.668481, 0, 0.8745098, 1, 1,
0.06737234, 1.223991, 0.9915106, 0, 0.8666667, 1, 1,
0.07032412, 0.533215, 1.360831, 0, 0.8627451, 1, 1,
0.07580353, -0.1366477, 3.392712, 0, 0.854902, 1, 1,
0.07582774, -0.8827983, 2.257663, 0, 0.8509804, 1, 1,
0.0785104, 1.448179, -1.160897, 0, 0.8431373, 1, 1,
0.08033436, -0.2205979, 2.06128, 0, 0.8392157, 1, 1,
0.0826346, -0.5649148, 2.233409, 0, 0.8313726, 1, 1,
0.0852104, 0.6923498, -0.5358395, 0, 0.827451, 1, 1,
0.0876691, 0.3311045, -0.1302099, 0, 0.8196079, 1, 1,
0.09258003, 1.713183, -2.328994, 0, 0.8156863, 1, 1,
0.09860697, -0.1304533, 2.716225, 0, 0.8078431, 1, 1,
0.09883959, 1.910874, -1.432735, 0, 0.8039216, 1, 1,
0.09892604, 1.487741, 0.1642596, 0, 0.7960784, 1, 1,
0.0992369, 0.4541624, -0.1557067, 0, 0.7882353, 1, 1,
0.1045491, 0.9657538, -0.5116948, 0, 0.7843137, 1, 1,
0.1051007, 1.666873, 0.03609657, 0, 0.7764706, 1, 1,
0.1070326, 0.03003109, -0.0569305, 0, 0.772549, 1, 1,
0.1087496, -0.9561949, 2.636057, 0, 0.7647059, 1, 1,
0.1092922, -0.7307361, 4.594111, 0, 0.7607843, 1, 1,
0.1097167, 0.2992447, 0.03700091, 0, 0.7529412, 1, 1,
0.1134984, 0.4479403, -0.3205448, 0, 0.7490196, 1, 1,
0.1151713, -0.7123218, 2.226762, 0, 0.7411765, 1, 1,
0.1158365, 0.5769923, 0.8171738, 0, 0.7372549, 1, 1,
0.1185192, 1.390255, 0.1701534, 0, 0.7294118, 1, 1,
0.1240294, -1.584097, 1.9523, 0, 0.7254902, 1, 1,
0.1261204, 2.252488, 1.034926, 0, 0.7176471, 1, 1,
0.1344968, -0.5327283, 3.558517, 0, 0.7137255, 1, 1,
0.1388145, -1.542668, 4.083186, 0, 0.7058824, 1, 1,
0.1400462, 0.4949532, -0.1470497, 0, 0.6980392, 1, 1,
0.1402393, -0.2418136, 3.269269, 0, 0.6941177, 1, 1,
0.1425063, 0.7766232, 0.8239722, 0, 0.6862745, 1, 1,
0.1444126, 2.425872, 0.6964954, 0, 0.682353, 1, 1,
0.145304, -0.4289782, 3.114479, 0, 0.6745098, 1, 1,
0.1477407, -0.2850245, 1.657867, 0, 0.6705883, 1, 1,
0.1481936, -0.225689, 2.962458, 0, 0.6627451, 1, 1,
0.1531763, 1.306869, 0.5574463, 0, 0.6588235, 1, 1,
0.1563691, 0.2206608, 1.05152, 0, 0.6509804, 1, 1,
0.1654826, 1.073331, 0.5608323, 0, 0.6470588, 1, 1,
0.1692972, 1.454148, -0.1779336, 0, 0.6392157, 1, 1,
0.1693088, 0.9681941, 0.3288146, 0, 0.6352941, 1, 1,
0.1789603, 1.629561, -0.5344242, 0, 0.627451, 1, 1,
0.1816868, -0.7907646, 1.957185, 0, 0.6235294, 1, 1,
0.1830825, -0.05307797, 2.087272, 0, 0.6156863, 1, 1,
0.1904374, 0.06725357, 2.794326, 0, 0.6117647, 1, 1,
0.190974, -0.4490165, 2.682527, 0, 0.6039216, 1, 1,
0.1916236, -0.2134183, 1.057778, 0, 0.5960785, 1, 1,
0.1916347, 0.9698871, -1.369421, 0, 0.5921569, 1, 1,
0.1952966, -0.3077551, 2.40319, 0, 0.5843138, 1, 1,
0.1954897, 0.8249109, 1.639729, 0, 0.5803922, 1, 1,
0.1963876, 0.2811442, 1.325634, 0, 0.572549, 1, 1,
0.1970236, 1.089349, 0.1159462, 0, 0.5686275, 1, 1,
0.1986879, -0.8560686, 2.842302, 0, 0.5607843, 1, 1,
0.2007927, 1.609905, -1.017671, 0, 0.5568628, 1, 1,
0.2099014, -0.141098, 2.674887, 0, 0.5490196, 1, 1,
0.2105451, -1.936552, 2.413728, 0, 0.5450981, 1, 1,
0.2168998, 1.786706, 1.510151, 0, 0.5372549, 1, 1,
0.2172472, -0.1908551, 0.5433297, 0, 0.5333334, 1, 1,
0.2184034, -2.295971, 3.33002, 0, 0.5254902, 1, 1,
0.2190362, -0.1317599, 0.4239262, 0, 0.5215687, 1, 1,
0.2254159, 0.2432539, 1.003352, 0, 0.5137255, 1, 1,
0.2281399, 0.6115429, 0.8641857, 0, 0.509804, 1, 1,
0.2283792, -0.8435602, 2.226824, 0, 0.5019608, 1, 1,
0.228708, 2.383363, -2.638246, 0, 0.4941176, 1, 1,
0.2287923, -0.7638477, 1.759987, 0, 0.4901961, 1, 1,
0.230315, 0.3065863, 1.045275, 0, 0.4823529, 1, 1,
0.2325303, 0.4225113, 1.398501, 0, 0.4784314, 1, 1,
0.2332847, -1.430727, 2.237315, 0, 0.4705882, 1, 1,
0.2362699, 1.426424, -0.415207, 0, 0.4666667, 1, 1,
0.2386041, 1.323051, -0.6376914, 0, 0.4588235, 1, 1,
0.2394609, 0.255565, -0.3675864, 0, 0.454902, 1, 1,
0.2487552, 2.088259, 0.05149265, 0, 0.4470588, 1, 1,
0.2493915, 0.4510965, 0.2083346, 0, 0.4431373, 1, 1,
0.2511998, -0.5343438, 3.332536, 0, 0.4352941, 1, 1,
0.252579, -0.06203324, 2.458524, 0, 0.4313726, 1, 1,
0.2534548, 0.07196653, 1.504193, 0, 0.4235294, 1, 1,
0.2536229, 2.719636, 1.366822, 0, 0.4196078, 1, 1,
0.2547679, -1.929881, 3.00483, 0, 0.4117647, 1, 1,
0.2555036, -0.09628606, 4.231762, 0, 0.4078431, 1, 1,
0.2558441, 0.03368647, 1.60381, 0, 0.4, 1, 1,
0.2577672, 0.4261388, 2.229421, 0, 0.3921569, 1, 1,
0.2581155, -0.3864223, 4.405647, 0, 0.3882353, 1, 1,
0.2592497, 0.8218403, 0.2087927, 0, 0.3803922, 1, 1,
0.2597327, 0.1241654, 1.612561, 0, 0.3764706, 1, 1,
0.2603646, 0.8399269, -0.9066226, 0, 0.3686275, 1, 1,
0.2613687, -0.2599999, 2.575533, 0, 0.3647059, 1, 1,
0.2623866, 0.0410535, 1.992244, 0, 0.3568628, 1, 1,
0.2636552, 0.2011844, 2.485006, 0, 0.3529412, 1, 1,
0.2655591, 1.367383, 1.576118, 0, 0.345098, 1, 1,
0.2687695, -1.881178, 2.693434, 0, 0.3411765, 1, 1,
0.2732802, 1.652418, 0.9055095, 0, 0.3333333, 1, 1,
0.2763022, -0.177896, 2.92638, 0, 0.3294118, 1, 1,
0.2765013, 0.5748439, -1.21727, 0, 0.3215686, 1, 1,
0.2801394, -0.143091, 1.015956, 0, 0.3176471, 1, 1,
0.282841, 0.5143285, 0.03643587, 0, 0.3098039, 1, 1,
0.285039, 0.5284014, 1.630997, 0, 0.3058824, 1, 1,
0.2853225, -0.3903327, 3.31798, 0, 0.2980392, 1, 1,
0.2853925, -0.866383, 3.157083, 0, 0.2901961, 1, 1,
0.2964303, 0.3742546, -0.7561268, 0, 0.2862745, 1, 1,
0.298718, 2.063495, 1.272274, 0, 0.2784314, 1, 1,
0.299383, 0.4751155, -0.948315, 0, 0.2745098, 1, 1,
0.3000067, -1.380243, 2.468502, 0, 0.2666667, 1, 1,
0.3023381, 0.8254867, 0.9797094, 0, 0.2627451, 1, 1,
0.3025417, -0.04167883, 1.671583, 0, 0.254902, 1, 1,
0.3037531, -1.560312, 3.35238, 0, 0.2509804, 1, 1,
0.3136417, -1.116575, 4.198949, 0, 0.2431373, 1, 1,
0.3140835, -0.4708732, 2.100879, 0, 0.2392157, 1, 1,
0.3240043, 0.1598094, 2.59134, 0, 0.2313726, 1, 1,
0.3269713, 0.5376781, 1.248048, 0, 0.227451, 1, 1,
0.3329968, 1.388554, 0.3757625, 0, 0.2196078, 1, 1,
0.3353439, -0.7146253, 1.529247, 0, 0.2156863, 1, 1,
0.3377605, -0.9279984, 1.800409, 0, 0.2078431, 1, 1,
0.3418649, 0.2418577, 2.399228, 0, 0.2039216, 1, 1,
0.3419814, 0.5413421, 2.718068, 0, 0.1960784, 1, 1,
0.3427884, 0.6001323, -0.2150724, 0, 0.1882353, 1, 1,
0.3442179, -0.57047, 1.884407, 0, 0.1843137, 1, 1,
0.3459221, 1.302838, 0.1552853, 0, 0.1764706, 1, 1,
0.3461474, 1.283557, 0.7503477, 0, 0.172549, 1, 1,
0.3517406, 0.07041983, 0.3321858, 0, 0.1647059, 1, 1,
0.3553153, -2.63255, 3.180238, 0, 0.1607843, 1, 1,
0.3555638, 2.128285, -0.6756769, 0, 0.1529412, 1, 1,
0.3558457, 1.645068, -0.2943903, 0, 0.1490196, 1, 1,
0.3585561, -0.6723232, 4.716194, 0, 0.1411765, 1, 1,
0.3702256, -1.623435, 3.913062, 0, 0.1372549, 1, 1,
0.3723612, 0.2835393, -0.6598838, 0, 0.1294118, 1, 1,
0.3750187, -0.1847925, 2.515249, 0, 0.1254902, 1, 1,
0.3763542, -0.1342515, 1.984277, 0, 0.1176471, 1, 1,
0.3806834, -0.9998898, 1.276567, 0, 0.1137255, 1, 1,
0.3819532, 2.997327, -1.369942, 0, 0.1058824, 1, 1,
0.3820219, -1.099092, 3.625885, 0, 0.09803922, 1, 1,
0.3830559, 1.133608, 0.6771173, 0, 0.09411765, 1, 1,
0.3849341, 0.5959039, 1.128453, 0, 0.08627451, 1, 1,
0.3863202, -0.3127659, 2.33545, 0, 0.08235294, 1, 1,
0.3877553, -0.114153, 0.6829636, 0, 0.07450981, 1, 1,
0.3888582, -1.076779, 3.560454, 0, 0.07058824, 1, 1,
0.3953205, -0.5205478, 3.064707, 0, 0.0627451, 1, 1,
0.395722, 0.135524, 1.620587, 0, 0.05882353, 1, 1,
0.3965973, -0.6907138, 1.500405, 0, 0.05098039, 1, 1,
0.3966485, 0.6694654, 0.7030113, 0, 0.04705882, 1, 1,
0.3976876, 0.08010069, 2.510198, 0, 0.03921569, 1, 1,
0.3986317, -0.3174073, 2.081789, 0, 0.03529412, 1, 1,
0.4045027, 0.1221277, 1.347284, 0, 0.02745098, 1, 1,
0.4176961, 0.8203161, 0.5507941, 0, 0.02352941, 1, 1,
0.4219364, 1.522899, 0.3053188, 0, 0.01568628, 1, 1,
0.4228525, 0.04273773, 1.062591, 0, 0.01176471, 1, 1,
0.4234185, -1.832047, 3.568696, 0, 0.003921569, 1, 1,
0.4249924, -1.210331, 4.045954, 0.003921569, 0, 1, 1,
0.4347927, 1.409706, 0.6154056, 0.007843138, 0, 1, 1,
0.4379355, 0.09916353, 1.199202, 0.01568628, 0, 1, 1,
0.4423242, 1.498501, 1.977979, 0.01960784, 0, 1, 1,
0.4481533, -0.1060837, 1.240712, 0.02745098, 0, 1, 1,
0.4482117, -1.428599, 4.197056, 0.03137255, 0, 1, 1,
0.4513597, -0.7659374, 3.080536, 0.03921569, 0, 1, 1,
0.4572851, 2.72244, -1.563258, 0.04313726, 0, 1, 1,
0.4599861, 0.1068725, 1.561687, 0.05098039, 0, 1, 1,
0.4612696, -1.696081, 2.628662, 0.05490196, 0, 1, 1,
0.4628414, 1.602126, 0.7763124, 0.0627451, 0, 1, 1,
0.4646941, -0.891773, 3.292458, 0.06666667, 0, 1, 1,
0.4651216, -0.2532483, 1.419674, 0.07450981, 0, 1, 1,
0.4658465, -1.239216, 2.465414, 0.07843138, 0, 1, 1,
0.4706692, 0.7791756, 0.8538948, 0.08627451, 0, 1, 1,
0.4709359, -0.1168208, 1.708308, 0.09019608, 0, 1, 1,
0.4767328, -0.6317341, 2.528193, 0.09803922, 0, 1, 1,
0.4769501, 0.1802483, 1.437747, 0.1058824, 0, 1, 1,
0.47759, 1.383782, 1.984106, 0.1098039, 0, 1, 1,
0.4789873, -0.1921572, 2.57146, 0.1176471, 0, 1, 1,
0.4848322, 0.04947941, 1.34016, 0.1215686, 0, 1, 1,
0.4851162, -0.1303322, 0.9669794, 0.1294118, 0, 1, 1,
0.4855797, 0.2607916, 1.252708, 0.1333333, 0, 1, 1,
0.4860598, -0.4978032, 1.761296, 0.1411765, 0, 1, 1,
0.4869856, 0.8026177, 1.027841, 0.145098, 0, 1, 1,
0.4964783, -0.7781047, 3.499312, 0.1529412, 0, 1, 1,
0.4978667, -0.08752898, 1.188915, 0.1568628, 0, 1, 1,
0.504009, -0.1636075, 4.585756, 0.1647059, 0, 1, 1,
0.5063841, -0.120423, 2.280452, 0.1686275, 0, 1, 1,
0.5128038, 1.09509, 0.9741686, 0.1764706, 0, 1, 1,
0.5170005, -0.4832278, 2.291228, 0.1803922, 0, 1, 1,
0.5227355, 0.9803596, 1.018849, 0.1882353, 0, 1, 1,
0.5263494, -1.697163, 2.333826, 0.1921569, 0, 1, 1,
0.5322856, -1.033335, 2.642487, 0.2, 0, 1, 1,
0.5330324, 0.422979, 1.016248, 0.2078431, 0, 1, 1,
0.533656, 0.9197456, -0.5267098, 0.2117647, 0, 1, 1,
0.5359986, 0.09168912, 0.1919025, 0.2196078, 0, 1, 1,
0.5444824, -0.777189, 4.006956, 0.2235294, 0, 1, 1,
0.5501063, -0.05944535, 0.8737897, 0.2313726, 0, 1, 1,
0.5505829, -0.0132537, 0.9281645, 0.2352941, 0, 1, 1,
0.5516986, 0.1414185, 0.6284477, 0.2431373, 0, 1, 1,
0.5573596, -0.1775873, 2.361713, 0.2470588, 0, 1, 1,
0.5612284, 1.547898, -0.9350433, 0.254902, 0, 1, 1,
0.5633312, 1.118405, -0.5528313, 0.2588235, 0, 1, 1,
0.571552, -1.647774, 3.868488, 0.2666667, 0, 1, 1,
0.5942551, -0.3857833, 2.369102, 0.2705882, 0, 1, 1,
0.600113, -0.2303698, 1.295578, 0.2784314, 0, 1, 1,
0.6005256, -1.088218, 2.510204, 0.282353, 0, 1, 1,
0.6024292, -0.4539971, 2.362705, 0.2901961, 0, 1, 1,
0.6073635, 1.170117, 2.151368, 0.2941177, 0, 1, 1,
0.6145017, -0.883051, 1.008966, 0.3019608, 0, 1, 1,
0.6198947, -0.291824, 1.762573, 0.3098039, 0, 1, 1,
0.6216553, 0.4725101, 0.9955148, 0.3137255, 0, 1, 1,
0.6222664, 0.6500083, 1.129909, 0.3215686, 0, 1, 1,
0.6234561, -0.09295536, 2.178132, 0.3254902, 0, 1, 1,
0.628309, -0.1099297, 1.22773, 0.3333333, 0, 1, 1,
0.6346352, -0.7171382, 0.8151248, 0.3372549, 0, 1, 1,
0.6368551, -0.6863996, 3.466086, 0.345098, 0, 1, 1,
0.6375997, -0.6670991, 2.443844, 0.3490196, 0, 1, 1,
0.6460367, -0.2098725, 0.6820144, 0.3568628, 0, 1, 1,
0.648598, -1.990966, 3.353428, 0.3607843, 0, 1, 1,
0.6487722, -1.350657, 2.715265, 0.3686275, 0, 1, 1,
0.6540134, 1.612407, -0.3095685, 0.372549, 0, 1, 1,
0.6569784, -1.064005, 3.988877, 0.3803922, 0, 1, 1,
0.6570179, -2.619916, 4.611553, 0.3843137, 0, 1, 1,
0.6570438, -1.450209, 1.790169, 0.3921569, 0, 1, 1,
0.6650837, -0.1063978, 1.782879, 0.3960784, 0, 1, 1,
0.6667539, -0.6676977, 1.466628, 0.4039216, 0, 1, 1,
0.66964, 0.2619452, 1.065996, 0.4117647, 0, 1, 1,
0.6704624, 0.5026418, 1.076011, 0.4156863, 0, 1, 1,
0.6769819, -0.01753842, 1.227295, 0.4235294, 0, 1, 1,
0.6776388, 1.182322, 0.7075482, 0.427451, 0, 1, 1,
0.6781859, 2.375951, 0.7141567, 0.4352941, 0, 1, 1,
0.680792, 1.185457, 2.589993, 0.4392157, 0, 1, 1,
0.6827507, -0.8410264, 2.512438, 0.4470588, 0, 1, 1,
0.6833848, 1.433827, 1.469398, 0.4509804, 0, 1, 1,
0.6856861, 0.019026, 4.478078, 0.4588235, 0, 1, 1,
0.6909803, 1.622944, -0.177764, 0.4627451, 0, 1, 1,
0.6943949, 0.6081206, -1.016911, 0.4705882, 0, 1, 1,
0.6972312, -0.584507, 0.3947534, 0.4745098, 0, 1, 1,
0.7019511, 1.450345, -0.4651288, 0.4823529, 0, 1, 1,
0.7020342, 0.05186262, 2.335855, 0.4862745, 0, 1, 1,
0.7026403, 0.8918742, 0.5489308, 0.4941176, 0, 1, 1,
0.7075967, 0.2232403, 0.9177923, 0.5019608, 0, 1, 1,
0.7084522, -0.1937684, 2.05604, 0.5058824, 0, 1, 1,
0.7147307, -1.419401, 2.993749, 0.5137255, 0, 1, 1,
0.7157432, -0.6097223, 2.605709, 0.5176471, 0, 1, 1,
0.7166317, -0.1662088, 2.777565, 0.5254902, 0, 1, 1,
0.717511, -0.566802, 1.668195, 0.5294118, 0, 1, 1,
0.7252989, -0.2265786, 0.441122, 0.5372549, 0, 1, 1,
0.7254267, 0.8764297, -1.680644, 0.5411765, 0, 1, 1,
0.7283646, -1.360991, 1.344677, 0.5490196, 0, 1, 1,
0.7318023, 0.0711743, 0.7484415, 0.5529412, 0, 1, 1,
0.7347591, -1.734734, 3.706616, 0.5607843, 0, 1, 1,
0.7449783, -0.4760875, 1.631051, 0.5647059, 0, 1, 1,
0.7456088, 0.5638708, -0.1193866, 0.572549, 0, 1, 1,
0.7479923, 1.495741, -0.5712693, 0.5764706, 0, 1, 1,
0.7547016, 0.3864833, 0.8310984, 0.5843138, 0, 1, 1,
0.7550685, -0.5713729, 2.335579, 0.5882353, 0, 1, 1,
0.7557185, 0.6670436, -0.4284804, 0.5960785, 0, 1, 1,
0.7620406, 0.9128001, 1.512985, 0.6039216, 0, 1, 1,
0.7620465, 0.9583526, -0.24355, 0.6078432, 0, 1, 1,
0.764409, 0.1836041, 2.013998, 0.6156863, 0, 1, 1,
0.7649935, -0.6615861, 2.571207, 0.6196079, 0, 1, 1,
0.7675259, -0.3299339, 2.308367, 0.627451, 0, 1, 1,
0.771001, 0.0907501, 0.5546082, 0.6313726, 0, 1, 1,
0.7764065, -1.071714, 2.839706, 0.6392157, 0, 1, 1,
0.776682, 0.3961785, -0.3394295, 0.6431373, 0, 1, 1,
0.7783508, -0.3841161, 3.144286, 0.6509804, 0, 1, 1,
0.7784216, 0.06267816, 2.018069, 0.654902, 0, 1, 1,
0.7825067, 0.09268308, 3.159986, 0.6627451, 0, 1, 1,
0.7880984, -0.604513, 1.541262, 0.6666667, 0, 1, 1,
0.7899417, -1.768723, 2.722296, 0.6745098, 0, 1, 1,
0.7907313, 1.393628, 0.450974, 0.6784314, 0, 1, 1,
0.7944283, 1.000308, 0.7198142, 0.6862745, 0, 1, 1,
0.8064018, -0.2928983, 1.191018, 0.6901961, 0, 1, 1,
0.8084845, 0.4099949, 0.3282117, 0.6980392, 0, 1, 1,
0.8090099, -1.185693, 2.526745, 0.7058824, 0, 1, 1,
0.8109606, -1.140393, 3.359678, 0.7098039, 0, 1, 1,
0.8170784, -0.674313, 2.286824, 0.7176471, 0, 1, 1,
0.8191919, 0.03526073, 2.615469, 0.7215686, 0, 1, 1,
0.8256481, 0.270915, 0.5826868, 0.7294118, 0, 1, 1,
0.8293574, -0.8746295, 3.358045, 0.7333333, 0, 1, 1,
0.8294969, -0.0776647, 2.854557, 0.7411765, 0, 1, 1,
0.8318022, -1.61857, 3.68788, 0.7450981, 0, 1, 1,
0.8407124, 2.771018, 2.166953, 0.7529412, 0, 1, 1,
0.8431914, -0.3091057, 3.317345, 0.7568628, 0, 1, 1,
0.8432252, 1.434899, 1.1227, 0.7647059, 0, 1, 1,
0.8438208, -1.633257, 1.587178, 0.7686275, 0, 1, 1,
0.8469409, -0.6782815, 2.323689, 0.7764706, 0, 1, 1,
0.8488733, -0.4461873, 2.097347, 0.7803922, 0, 1, 1,
0.8503815, 1.423032, 1.518773, 0.7882353, 0, 1, 1,
0.8526122, 0.8851955, -0.7100216, 0.7921569, 0, 1, 1,
0.854257, -1.240926, 1.766075, 0.8, 0, 1, 1,
0.8558197, 0.8643117, 1.816066, 0.8078431, 0, 1, 1,
0.8566632, -0.9589688, 1.850018, 0.8117647, 0, 1, 1,
0.8591861, 0.4522534, 1.658842, 0.8196079, 0, 1, 1,
0.859346, -1.690609, 4.409715, 0.8235294, 0, 1, 1,
0.8622129, 0.5527973, -0.3472156, 0.8313726, 0, 1, 1,
0.8673066, -1.990531, 1.683375, 0.8352941, 0, 1, 1,
0.8683418, -0.8972559, 1.791381, 0.8431373, 0, 1, 1,
0.8722526, 0.3218936, 0.973633, 0.8470588, 0, 1, 1,
0.8740892, -0.4344413, 2.053056, 0.854902, 0, 1, 1,
0.8758199, -0.2927204, 1.984185, 0.8588235, 0, 1, 1,
0.8806852, -1.181181, 2.472492, 0.8666667, 0, 1, 1,
0.8812395, 1.572365, 1.913385, 0.8705882, 0, 1, 1,
0.8825976, 0.200435, -0.2982676, 0.8784314, 0, 1, 1,
0.884446, -0.2247733, 0.5562171, 0.8823529, 0, 1, 1,
0.8849363, 0.8622637, 1.331525, 0.8901961, 0, 1, 1,
0.8893721, -1.142282, 2.171503, 0.8941177, 0, 1, 1,
0.8898532, -0.5995647, 1.379742, 0.9019608, 0, 1, 1,
0.8923663, 1.241458, 0.4279245, 0.9098039, 0, 1, 1,
0.897535, -0.5975804, 0.8149188, 0.9137255, 0, 1, 1,
0.9047519, -0.2797272, 3.712953, 0.9215686, 0, 1, 1,
0.9064533, -0.2928166, 1.004208, 0.9254902, 0, 1, 1,
0.9066325, -0.1030284, 2.035367, 0.9333333, 0, 1, 1,
0.9078872, 1.072665, 1.166377, 0.9372549, 0, 1, 1,
0.9087443, -1.749382, 2.134793, 0.945098, 0, 1, 1,
0.921801, -0.1207897, 0.8933091, 0.9490196, 0, 1, 1,
0.9242475, -0.5821358, 2.170576, 0.9568627, 0, 1, 1,
0.9297932, 0.7975829, 2.149099, 0.9607843, 0, 1, 1,
0.9299644, 1.161547, 0.3300943, 0.9686275, 0, 1, 1,
0.9303814, -0.7469251, 0.7283557, 0.972549, 0, 1, 1,
0.9404109, -0.362665, -0.1570997, 0.9803922, 0, 1, 1,
0.9404604, 1.311343, -0.2487192, 0.9843137, 0, 1, 1,
0.9424194, 1.5501, 0.8899373, 0.9921569, 0, 1, 1,
0.9424471, -1.288932, 3.831259, 0.9960784, 0, 1, 1,
0.9426361, -1.651673, 2.79208, 1, 0, 0.9960784, 1,
0.9445635, -1.130069, 2.584955, 1, 0, 0.9882353, 1,
0.9469698, 0.6430034, 2.527267, 1, 0, 0.9843137, 1,
0.948546, 0.6947332, 0.4069635, 1, 0, 0.9764706, 1,
0.9495176, -0.6639991, 2.296025, 1, 0, 0.972549, 1,
0.9511633, 1.950046, 0.5561613, 1, 0, 0.9647059, 1,
0.9512413, -0.5634044, 3.963314, 1, 0, 0.9607843, 1,
0.9551759, -0.9837056, 0.269492, 1, 0, 0.9529412, 1,
0.9629957, 0.3647903, 1.081632, 1, 0, 0.9490196, 1,
0.9673858, -0.1969614, 1.524267, 1, 0, 0.9411765, 1,
0.9736158, -1.244745, 1.761756, 1, 0, 0.9372549, 1,
0.979464, 0.012512, 1.407066, 1, 0, 0.9294118, 1,
0.9814172, -0.2785755, 2.707251, 1, 0, 0.9254902, 1,
0.9817396, -0.286327, 0.8172873, 1, 0, 0.9176471, 1,
0.9840106, 0.1303681, 0.6553602, 1, 0, 0.9137255, 1,
0.9861916, -0.01223735, 2.687528, 1, 0, 0.9058824, 1,
0.9896103, 0.2491085, 1.628718, 1, 0, 0.9019608, 1,
0.9961512, 1.093785, 1.167708, 1, 0, 0.8941177, 1,
0.9997202, 0.05413559, 0.9991172, 1, 0, 0.8862745, 1,
1.001534, -0.2760169, 3.41031, 1, 0, 0.8823529, 1,
1.009484, 0.9303709, 0.5904011, 1, 0, 0.8745098, 1,
1.010685, -1.940375, 3.889928, 1, 0, 0.8705882, 1,
1.011963, -0.09806852, 2.748686, 1, 0, 0.8627451, 1,
1.014809, 1.340091, 0.7557988, 1, 0, 0.8588235, 1,
1.016429, -0.1452687, 2.182772, 1, 0, 0.8509804, 1,
1.019516, -0.9833031, 4.087719, 1, 0, 0.8470588, 1,
1.024498, 1.794962, 0.5039651, 1, 0, 0.8392157, 1,
1.028094, 0.7530673, 1.124745, 1, 0, 0.8352941, 1,
1.032063, 0.6016378, 0.04009417, 1, 0, 0.827451, 1,
1.033666, -0.7160227, 3.830746, 1, 0, 0.8235294, 1,
1.038395, -1.214541, 3.040636, 1, 0, 0.8156863, 1,
1.041587, 1.491209, -1.308985, 1, 0, 0.8117647, 1,
1.059747, -0.9981937, 3.949669, 1, 0, 0.8039216, 1,
1.060578, -0.6486645, 4.059349, 1, 0, 0.7960784, 1,
1.064584, 0.4349216, 0.6121238, 1, 0, 0.7921569, 1,
1.066948, -2.033826, 3.36821, 1, 0, 0.7843137, 1,
1.082336, 0.1922436, 0.3146952, 1, 0, 0.7803922, 1,
1.101274, 1.206195, -1.283032, 1, 0, 0.772549, 1,
1.104984, 0.5005418, -0.7535805, 1, 0, 0.7686275, 1,
1.116682, -0.9632793, 2.306914, 1, 0, 0.7607843, 1,
1.117524, -1.063159, 2.211288, 1, 0, 0.7568628, 1,
1.118794, -0.3689449, 2.693317, 1, 0, 0.7490196, 1,
1.123921, 0.1864603, 0.1234305, 1, 0, 0.7450981, 1,
1.134984, -0.08676001, 1.93289, 1, 0, 0.7372549, 1,
1.13995, 0.05277164, 1.741879, 1, 0, 0.7333333, 1,
1.146456, 0.2565153, 1.8461, 1, 0, 0.7254902, 1,
1.148167, -1.343231, 1.261349, 1, 0, 0.7215686, 1,
1.154641, -0.9344174, 2.228288, 1, 0, 0.7137255, 1,
1.157746, -1.451288, 3.251196, 1, 0, 0.7098039, 1,
1.166551, -0.5870517, 2.15492, 1, 0, 0.7019608, 1,
1.170202, -1.0498, 2.058397, 1, 0, 0.6941177, 1,
1.173913, 0.02854912, 0.5452169, 1, 0, 0.6901961, 1,
1.173972, -0.9470044, 2.665353, 1, 0, 0.682353, 1,
1.175563, 0.4294609, 1.302728, 1, 0, 0.6784314, 1,
1.17615, 0.3899098, 1.310388, 1, 0, 0.6705883, 1,
1.177845, 0.2272249, 2.078047, 1, 0, 0.6666667, 1,
1.191692, 0.7458129, -1.088387, 1, 0, 0.6588235, 1,
1.193923, -0.110751, -0.3053041, 1, 0, 0.654902, 1,
1.194906, -1.184606, 2.076315, 1, 0, 0.6470588, 1,
1.200012, -1.992401, 3.003806, 1, 0, 0.6431373, 1,
1.201319, 0.4796472, 0.9888845, 1, 0, 0.6352941, 1,
1.204789, 0.2841459, 2.324565, 1, 0, 0.6313726, 1,
1.206322, -1.338345, 1.016086, 1, 0, 0.6235294, 1,
1.208637, 0.1262925, 0.8899677, 1, 0, 0.6196079, 1,
1.212003, -0.4655557, 3.678576, 1, 0, 0.6117647, 1,
1.212119, -0.09995155, 1.833704, 1, 0, 0.6078432, 1,
1.222903, -0.9747537, 1.743881, 1, 0, 0.6, 1,
1.223527, -2.286615, 1.073023, 1, 0, 0.5921569, 1,
1.235523, -0.04349624, 2.206084, 1, 0, 0.5882353, 1,
1.23712, -0.7077606, 2.797729, 1, 0, 0.5803922, 1,
1.25669, 1.019791, 1.670858, 1, 0, 0.5764706, 1,
1.260218, -1.215042, 0.9357869, 1, 0, 0.5686275, 1,
1.278103, -1.247268, 2.973395, 1, 0, 0.5647059, 1,
1.282128, 0.3733853, 2.93566, 1, 0, 0.5568628, 1,
1.288207, 1.271577, 2.493608, 1, 0, 0.5529412, 1,
1.292956, -1.821936, 3.472896, 1, 0, 0.5450981, 1,
1.29503, -0.02965626, 1.676705, 1, 0, 0.5411765, 1,
1.306279, 1.064991, 1.238783, 1, 0, 0.5333334, 1,
1.307404, 1.096851, 0.9664018, 1, 0, 0.5294118, 1,
1.317423, 0.4454535, 1.432001, 1, 0, 0.5215687, 1,
1.319206, 1.025048, 1.427909, 1, 0, 0.5176471, 1,
1.347262, -1.480544, 3.356375, 1, 0, 0.509804, 1,
1.350324, -1.413722, 2.957259, 1, 0, 0.5058824, 1,
1.360154, 0.3577025, 1.264333, 1, 0, 0.4980392, 1,
1.361829, -0.3491592, 1.065873, 1, 0, 0.4901961, 1,
1.370308, -0.1925707, 1.302878, 1, 0, 0.4862745, 1,
1.374421, 0.374738, 1.706441, 1, 0, 0.4784314, 1,
1.384352, -0.5266999, 1.136674, 1, 0, 0.4745098, 1,
1.393456, -0.3486929, 1.824129, 1, 0, 0.4666667, 1,
1.396524, 0.9909882, 0.25254, 1, 0, 0.4627451, 1,
1.402229, 0.0671212, 2.376925, 1, 0, 0.454902, 1,
1.434363, -0.9494284, 3.501768, 1, 0, 0.4509804, 1,
1.454443, -0.8234599, 1.36491, 1, 0, 0.4431373, 1,
1.465217, -1.016186, 0.1266977, 1, 0, 0.4392157, 1,
1.46911, -0.2813311, 0.9657015, 1, 0, 0.4313726, 1,
1.470871, -0.06388643, 2.19496, 1, 0, 0.427451, 1,
1.478645, 0.445204, -0.06946515, 1, 0, 0.4196078, 1,
1.486841, -0.1740447, 2.102981, 1, 0, 0.4156863, 1,
1.502742, -1.558989, 4.655759, 1, 0, 0.4078431, 1,
1.514172, 2.155873, 1.20459, 1, 0, 0.4039216, 1,
1.517028, 0.2598923, 2.932644, 1, 0, 0.3960784, 1,
1.529779, -0.963732, 2.26886, 1, 0, 0.3882353, 1,
1.537626, 0.8661302, 0.08932482, 1, 0, 0.3843137, 1,
1.541414, -1.078944, 0.1353107, 1, 0, 0.3764706, 1,
1.549474, -0.6636876, 3.854303, 1, 0, 0.372549, 1,
1.549874, 1.479683, -0.7443143, 1, 0, 0.3647059, 1,
1.560199, 0.1442788, 1.726102, 1, 0, 0.3607843, 1,
1.584117, -0.1935909, 0.878992, 1, 0, 0.3529412, 1,
1.586467, 0.07076594, 1.053975, 1, 0, 0.3490196, 1,
1.603761, 0.8122415, 2.66878, 1, 0, 0.3411765, 1,
1.609155, -0.1331658, 1.73976, 1, 0, 0.3372549, 1,
1.612673, 0.9461523, 1.611141, 1, 0, 0.3294118, 1,
1.616811, -0.2489142, 1.466997, 1, 0, 0.3254902, 1,
1.628629, -0.3650662, 1.607813, 1, 0, 0.3176471, 1,
1.630262, -0.4595818, 1.906602, 1, 0, 0.3137255, 1,
1.645719, 1.011603, 1.189456, 1, 0, 0.3058824, 1,
1.65755, -0.2906319, 1.711686, 1, 0, 0.2980392, 1,
1.661367, -1.313663, 1.773677, 1, 0, 0.2941177, 1,
1.669311, -0.9543393, 2.447514, 1, 0, 0.2862745, 1,
1.680731, -0.3810969, 2.62524, 1, 0, 0.282353, 1,
1.688605, -0.5161725, 2.636364, 1, 0, 0.2745098, 1,
1.694099, -0.02099789, 0.2957626, 1, 0, 0.2705882, 1,
1.711907, -1.351779, 1.606677, 1, 0, 0.2627451, 1,
1.718704, 0.9550264, 2.007959, 1, 0, 0.2588235, 1,
1.777744, -0.6416421, 1.192438, 1, 0, 0.2509804, 1,
1.77934, -1.41902, 1.856016, 1, 0, 0.2470588, 1,
1.817532, 0.3954227, 0.5349827, 1, 0, 0.2392157, 1,
1.819117, -0.6872538, 1.799126, 1, 0, 0.2352941, 1,
1.856944, 0.5732825, 0.1081539, 1, 0, 0.227451, 1,
1.861276, 0.01959252, 2.860288, 1, 0, 0.2235294, 1,
1.88264, 0.1428275, -0.5721269, 1, 0, 0.2156863, 1,
1.892712, 0.6976653, -0.3334867, 1, 0, 0.2117647, 1,
1.907474, -0.08662163, 1.25506, 1, 0, 0.2039216, 1,
1.912239, 0.8252745, 2.43, 1, 0, 0.1960784, 1,
1.913087, 1.619402, 1.085287, 1, 0, 0.1921569, 1,
1.915835, -0.8886067, 4.009587, 1, 0, 0.1843137, 1,
1.923863, -0.09040984, 2.27804, 1, 0, 0.1803922, 1,
1.926093, -0.3346191, 1.540564, 1, 0, 0.172549, 1,
1.932676, 1.502728, 0.8405461, 1, 0, 0.1686275, 1,
1.935445, 0.1552769, 1.720954, 1, 0, 0.1607843, 1,
1.976438, 1.668672, 1.861648, 1, 0, 0.1568628, 1,
2.002511, -0.4909214, 0.01960566, 1, 0, 0.1490196, 1,
2.023591, 0.470412, 1.225834, 1, 0, 0.145098, 1,
2.035456, -0.0535636, 1.373665, 1, 0, 0.1372549, 1,
2.074308, 2.055757, 1.640903, 1, 0, 0.1333333, 1,
2.109281, -0.538848, 0.9215395, 1, 0, 0.1254902, 1,
2.120081, -0.7589139, 1.516877, 1, 0, 0.1215686, 1,
2.139713, 0.276441, 2.378083, 1, 0, 0.1137255, 1,
2.148714, -0.9096121, 4.123258, 1, 0, 0.1098039, 1,
2.161301, -0.5215565, 2.627854, 1, 0, 0.1019608, 1,
2.168604, -0.9783824, 3.548731, 1, 0, 0.09411765, 1,
2.191103, 0.3792007, 0.5958971, 1, 0, 0.09019608, 1,
2.202787, 1.225575, 0.7993348, 1, 0, 0.08235294, 1,
2.245811, 0.8123348, 2.094413, 1, 0, 0.07843138, 1,
2.280684, 0.3781989, 0.04833301, 1, 0, 0.07058824, 1,
2.292778, -0.7717925, 0.06273688, 1, 0, 0.06666667, 1,
2.309828, -0.334296, 2.916076, 1, 0, 0.05882353, 1,
2.39352, -0.6036221, -1.348839, 1, 0, 0.05490196, 1,
2.58131, 0.2256919, 1.472113, 1, 0, 0.04705882, 1,
2.592573, 0.2509575, 2.828003, 1, 0, 0.04313726, 1,
2.596423, -1.701951, 0.01976226, 1, 0, 0.03529412, 1,
2.736458, 0.6710145, 0.1503286, 1, 0, 0.03137255, 1,
2.829788, 0.8526647, 0.6865652, 1, 0, 0.02352941, 1,
2.836404, 1.228783, 1.326551, 1, 0, 0.01960784, 1,
3.218504, -0.6078564, 2.358745, 1, 0, 0.01176471, 1,
3.40737, 0.2044313, 0.8418556, 1, 0, 0.007843138, 1
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
-0.03596854, -4.408673, -6.975103, 0, -0.5, 0.5, 0.5,
-0.03596854, -4.408673, -6.975103, 1, -0.5, 0.5, 0.5,
-0.03596854, -4.408673, -6.975103, 1, 1.5, 0.5, 0.5,
-0.03596854, -4.408673, -6.975103, 0, 1.5, 0.5, 0.5
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
-4.646599, -0.1689835, -6.975103, 0, -0.5, 0.5, 0.5,
-4.646599, -0.1689835, -6.975103, 1, -0.5, 0.5, 0.5,
-4.646599, -0.1689835, -6.975103, 1, 1.5, 0.5, 0.5,
-4.646599, -0.1689835, -6.975103, 0, 1.5, 0.5, 0.5
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
-4.646599, -4.408673, -0.282223, 0, -0.5, 0.5, 0.5,
-4.646599, -4.408673, -0.282223, 1, -0.5, 0.5, 0.5,
-4.646599, -4.408673, -0.282223, 1, 1.5, 0.5, 0.5,
-4.646599, -4.408673, -0.282223, 0, 1.5, 0.5, 0.5
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
-3, -3.430283, -5.430593,
3, -3.430283, -5.430593,
-3, -3.430283, -5.430593,
-3, -3.593348, -5.688011,
-2, -3.430283, -5.430593,
-2, -3.593348, -5.688011,
-1, -3.430283, -5.430593,
-1, -3.593348, -5.688011,
0, -3.430283, -5.430593,
0, -3.593348, -5.688011,
1, -3.430283, -5.430593,
1, -3.593348, -5.688011,
2, -3.430283, -5.430593,
2, -3.593348, -5.688011,
3, -3.430283, -5.430593,
3, -3.593348, -5.688011
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
-3, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
-3, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
-3, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
-3, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
-2, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
-2, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
-2, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
-2, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
-1, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
-1, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
-1, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
-1, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
0, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
0, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
0, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
0, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
1, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
1, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
1, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
1, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
2, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
2, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
2, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
2, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5,
3, -3.919478, -6.202848, 0, -0.5, 0.5, 0.5,
3, -3.919478, -6.202848, 1, -0.5, 0.5, 0.5,
3, -3.919478, -6.202848, 1, 1.5, 0.5, 0.5,
3, -3.919478, -6.202848, 0, 1.5, 0.5, 0.5
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
-3.582607, -3, -5.430593,
-3.582607, 2, -5.430593,
-3.582607, -3, -5.430593,
-3.759939, -3, -5.688011,
-3.582607, -2, -5.430593,
-3.759939, -2, -5.688011,
-3.582607, -1, -5.430593,
-3.759939, -1, -5.688011,
-3.582607, 0, -5.430593,
-3.759939, 0, -5.688011,
-3.582607, 1, -5.430593,
-3.759939, 1, -5.688011,
-3.582607, 2, -5.430593,
-3.759939, 2, -5.688011
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
-4.114603, -3, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, -3, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, -3, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, -3, -6.202848, 0, 1.5, 0.5, 0.5,
-4.114603, -2, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, -2, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, -2, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, -2, -6.202848, 0, 1.5, 0.5, 0.5,
-4.114603, -1, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, -1, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, -1, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, -1, -6.202848, 0, 1.5, 0.5, 0.5,
-4.114603, 0, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, 0, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, 0, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, 0, -6.202848, 0, 1.5, 0.5, 0.5,
-4.114603, 1, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, 1, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, 1, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, 1, -6.202848, 0, 1.5, 0.5, 0.5,
-4.114603, 2, -6.202848, 0, -0.5, 0.5, 0.5,
-4.114603, 2, -6.202848, 1, -0.5, 0.5, 0.5,
-4.114603, 2, -6.202848, 1, 1.5, 0.5, 0.5,
-4.114603, 2, -6.202848, 0, 1.5, 0.5, 0.5
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
-3.582607, -3.430283, -4,
-3.582607, -3.430283, 4,
-3.582607, -3.430283, -4,
-3.759939, -3.593348, -4,
-3.582607, -3.430283, -2,
-3.759939, -3.593348, -2,
-3.582607, -3.430283, 0,
-3.759939, -3.593348, 0,
-3.582607, -3.430283, 2,
-3.759939, -3.593348, 2,
-3.582607, -3.430283, 4,
-3.759939, -3.593348, 4
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
-4.114603, -3.919478, -4, 0, -0.5, 0.5, 0.5,
-4.114603, -3.919478, -4, 1, -0.5, 0.5, 0.5,
-4.114603, -3.919478, -4, 1, 1.5, 0.5, 0.5,
-4.114603, -3.919478, -4, 0, 1.5, 0.5, 0.5,
-4.114603, -3.919478, -2, 0, -0.5, 0.5, 0.5,
-4.114603, -3.919478, -2, 1, -0.5, 0.5, 0.5,
-4.114603, -3.919478, -2, 1, 1.5, 0.5, 0.5,
-4.114603, -3.919478, -2, 0, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 0, 0, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 0, 1, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 0, 1, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 0, 0, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 2, 0, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 2, 1, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 2, 1, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 2, 0, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 4, 0, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 4, 1, -0.5, 0.5, 0.5,
-4.114603, -3.919478, 4, 1, 1.5, 0.5, 0.5,
-4.114603, -3.919478, 4, 0, 1.5, 0.5, 0.5
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
-3.582607, -3.430283, -5.430593,
-3.582607, 3.092316, -5.430593,
-3.582607, -3.430283, 4.866147,
-3.582607, 3.092316, 4.866147,
-3.582607, -3.430283, -5.430593,
-3.582607, -3.430283, 4.866147,
-3.582607, 3.092316, -5.430593,
-3.582607, 3.092316, 4.866147,
-3.582607, -3.430283, -5.430593,
3.51067, -3.430283, -5.430593,
-3.582607, -3.430283, 4.866147,
3.51067, -3.430283, 4.866147,
-3.582607, 3.092316, -5.430593,
3.51067, 3.092316, -5.430593,
-3.582607, 3.092316, 4.866147,
3.51067, 3.092316, 4.866147,
3.51067, -3.430283, -5.430593,
3.51067, 3.092316, -5.430593,
3.51067, -3.430283, 4.866147,
3.51067, 3.092316, 4.866147,
3.51067, -3.430283, -5.430593,
3.51067, -3.430283, 4.866147,
3.51067, 3.092316, -5.430593,
3.51067, 3.092316, 4.866147
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
var radius = 7.530484;
var distance = 33.50397;
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
mvMatrix.translate( 0.03596854, 0.1689835, 0.282223 );
mvMatrix.scale( 1.147863, 1.248292, 0.7907462 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50397);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
arsenic_acid<-read.table("arsenic_acid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-arsenic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
```

```r
y<-arsenic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
```

```r
z<-arsenic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'arsenic_acid' not found
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
-3.479307, -0.4977309, -2.272332, 0, 0, 1, 1, 1,
-3.373946, 1.45649, -0.5416018, 1, 0, 0, 1, 1,
-3.157979, -0.1520541, -1.771611, 1, 0, 0, 1, 1,
-3.090711, 1.967971, -0.1711589, 1, 0, 0, 1, 1,
-2.980852, -0.1925659, -2.740341, 1, 0, 0, 1, 1,
-2.92619, 0.2950532, -1.649503, 1, 0, 0, 1, 1,
-2.823853, 0.5206393, -0.8127973, 0, 0, 0, 1, 1,
-2.801117, -1.07691, -0.4566872, 0, 0, 0, 1, 1,
-2.731272, -0.1382497, -2.119938, 0, 0, 0, 1, 1,
-2.729843, 2.905757, -0.1430764, 0, 0, 0, 1, 1,
-2.713069, 1.060308, -1.989727, 0, 0, 0, 1, 1,
-2.711465, 0.6029819, 0.04674334, 0, 0, 0, 1, 1,
-2.660971, 1.121671, -1.875273, 0, 0, 0, 1, 1,
-2.657918, 1.05284, -0.002717642, 1, 1, 1, 1, 1,
-2.611267, -2.250245, -0.32168, 1, 1, 1, 1, 1,
-2.510581, 1.672901, -0.02218724, 1, 1, 1, 1, 1,
-2.397217, -2.297227, -3.419612, 1, 1, 1, 1, 1,
-2.355611, -1.074251, -2.79864, 1, 1, 1, 1, 1,
-2.355287, -1.022813, -2.129116, 1, 1, 1, 1, 1,
-2.352932, 1.058005, -1.389076, 1, 1, 1, 1, 1,
-2.300163, -0.0357435, -2.335079, 1, 1, 1, 1, 1,
-2.290289, -0.9601648, -3.00625, 1, 1, 1, 1, 1,
-2.267237, 2.10002, -1.093812, 1, 1, 1, 1, 1,
-2.238456, 0.9043363, -0.2944502, 1, 1, 1, 1, 1,
-2.231011, 0.5281075, 0.09554262, 1, 1, 1, 1, 1,
-2.2305, -1.717074, -1.692061, 1, 1, 1, 1, 1,
-2.210457, 0.7236341, -0.8524236, 1, 1, 1, 1, 1,
-2.168111, -0.2130157, -1.794171, 1, 1, 1, 1, 1,
-2.139772, 1.782329, -1.969612, 0, 0, 1, 1, 1,
-2.129318, -1.384278, -4.36346, 1, 0, 0, 1, 1,
-2.110568, -0.1364453, -1.06608, 1, 0, 0, 1, 1,
-2.066797, -0.8848585, -1.586021, 1, 0, 0, 1, 1,
-2.031831, -1.193554, -1.781697, 1, 0, 0, 1, 1,
-2.014932, 0.6210793, -0.5973835, 1, 0, 0, 1, 1,
-1.968597, -0.4318284, -1.956102, 0, 0, 0, 1, 1,
-1.960722, 0.1698751, -1.420309, 0, 0, 0, 1, 1,
-1.886885, -0.3528477, -2.77547, 0, 0, 0, 1, 1,
-1.885933, 0.5776013, 0.1328261, 0, 0, 0, 1, 1,
-1.869556, -0.4240017, -1.424237, 0, 0, 0, 1, 1,
-1.861132, 1.233433, 0.01595833, 0, 0, 0, 1, 1,
-1.847389, -2.229107, -0.9803054, 0, 0, 0, 1, 1,
-1.84011, 1.027243, -2.680166, 1, 1, 1, 1, 1,
-1.799843, -0.1946601, -1.425722, 1, 1, 1, 1, 1,
-1.799396, 0.9878836, -1.097992, 1, 1, 1, 1, 1,
-1.792371, -0.8222526, -3.841284, 1, 1, 1, 1, 1,
-1.78201, -1.05563, -0.1884985, 1, 1, 1, 1, 1,
-1.775685, -0.4470319, -2.760981, 1, 1, 1, 1, 1,
-1.773818, 0.8461823, 0.2925866, 1, 1, 1, 1, 1,
-1.771226, -2.863777, -3.454155, 1, 1, 1, 1, 1,
-1.72989, 1.458976, -1.266436, 1, 1, 1, 1, 1,
-1.726065, -0.246345, -3.609961, 1, 1, 1, 1, 1,
-1.716105, 0.9245226, -2.019136, 1, 1, 1, 1, 1,
-1.704639, -1.320931, -1.164725, 1, 1, 1, 1, 1,
-1.702576, 0.4292757, -0.3436855, 1, 1, 1, 1, 1,
-1.699816, -1.510551, -2.512168, 1, 1, 1, 1, 1,
-1.686062, 1.359186, -0.791324, 1, 1, 1, 1, 1,
-1.676579, -0.05846502, -1.662976, 0, 0, 1, 1, 1,
-1.673213, 0.659093, -1.621423, 1, 0, 0, 1, 1,
-1.663173, 0.8506915, -2.046869, 1, 0, 0, 1, 1,
-1.663012, 0.1047861, -1.081998, 1, 0, 0, 1, 1,
-1.659368, 0.208511, -1.42557, 1, 0, 0, 1, 1,
-1.656645, 0.3952721, -1.170751, 1, 0, 0, 1, 1,
-1.650821, -0.5507932, -1.59031, 0, 0, 0, 1, 1,
-1.646778, -0.4253501, -1.530609, 0, 0, 0, 1, 1,
-1.632887, -0.8629249, -3.588285, 0, 0, 0, 1, 1,
-1.624521, 0.7632093, -0.4682035, 0, 0, 0, 1, 1,
-1.608856, 0.5243638, -1.90459, 0, 0, 0, 1, 1,
-1.604729, -2.190231, -2.617729, 0, 0, 0, 1, 1,
-1.583172, 0.2379006, -1.197725, 0, 0, 0, 1, 1,
-1.555906, -1.308468, -1.961168, 1, 1, 1, 1, 1,
-1.553562, 0.7929476, -2.469846, 1, 1, 1, 1, 1,
-1.545037, 2.374274, -1.424201, 1, 1, 1, 1, 1,
-1.535583, 0.6595693, -0.5723016, 1, 1, 1, 1, 1,
-1.530048, -0.4986643, -1.457827, 1, 1, 1, 1, 1,
-1.529558, -1.221071, -2.387907, 1, 1, 1, 1, 1,
-1.512742, 0.3974801, -2.339501, 1, 1, 1, 1, 1,
-1.501118, 0.2336861, -0.8846728, 1, 1, 1, 1, 1,
-1.495457, 0.8733969, -0.8710505, 1, 1, 1, 1, 1,
-1.483217, 0.8826618, -2.160772, 1, 1, 1, 1, 1,
-1.481507, -2.415814, -2.087644, 1, 1, 1, 1, 1,
-1.476609, -1.930951, -3.381546, 1, 1, 1, 1, 1,
-1.471274, -1.740338, -1.179176, 1, 1, 1, 1, 1,
-1.470925, 0.2659104, -2.798624, 1, 1, 1, 1, 1,
-1.46672, 0.5324972, -0.02109006, 1, 1, 1, 1, 1,
-1.4579, 1.361824, -2.416583, 0, 0, 1, 1, 1,
-1.427555, -0.3358632, -1.61339, 1, 0, 0, 1, 1,
-1.423858, 0.3417214, -0.1992891, 1, 0, 0, 1, 1,
-1.400598, -0.8231189, -1.586322, 1, 0, 0, 1, 1,
-1.400458, -0.04076301, -0.9134399, 1, 0, 0, 1, 1,
-1.390271, -0.05276103, -2.272701, 1, 0, 0, 1, 1,
-1.38927, 0.2220882, -0.3867405, 0, 0, 0, 1, 1,
-1.386324, 2.303417, -0.545705, 0, 0, 0, 1, 1,
-1.381576, 0.8430506, -2.079419, 0, 0, 0, 1, 1,
-1.361578, 0.3665359, -1.422009, 0, 0, 0, 1, 1,
-1.354274, 2.584597, -0.4022593, 0, 0, 0, 1, 1,
-1.338368, 0.6769089, -0.2554969, 0, 0, 0, 1, 1,
-1.333414, -0.3892676, -1.092222, 0, 0, 0, 1, 1,
-1.327563, 0.7433525, -2.229255, 1, 1, 1, 1, 1,
-1.322456, 0.979371, -1.329718, 1, 1, 1, 1, 1,
-1.315268, -0.160671, -1.2492, 1, 1, 1, 1, 1,
-1.313349, 0.6058519, 0.5505031, 1, 1, 1, 1, 1,
-1.307339, 0.1737991, -1.580735, 1, 1, 1, 1, 1,
-1.306801, -2.126253, -2.533456, 1, 1, 1, 1, 1,
-1.304216, 1.175572, -0.6211513, 1, 1, 1, 1, 1,
-1.303804, 0.8320401, -2.212924, 1, 1, 1, 1, 1,
-1.302174, -2.431444, -1.594611, 1, 1, 1, 1, 1,
-1.297957, -0.6794748, -2.669143, 1, 1, 1, 1, 1,
-1.294324, 0.2711576, -0.7993255, 1, 1, 1, 1, 1,
-1.291021, 2.241521, -0.1299235, 1, 1, 1, 1, 1,
-1.290058, 2.054906, -1.093543, 1, 1, 1, 1, 1,
-1.26676, -0.1795575, -2.097846, 1, 1, 1, 1, 1,
-1.266126, -0.7484498, -2.655592, 1, 1, 1, 1, 1,
-1.252706, 0.911499, -1.485922, 0, 0, 1, 1, 1,
-1.243235, 0.6800431, 0.2274366, 1, 0, 0, 1, 1,
-1.238691, -0.2280167, -4.008578, 1, 0, 0, 1, 1,
-1.231475, 0.02655426, -2.282955, 1, 0, 0, 1, 1,
-1.228476, 0.1328772, 0.2365902, 1, 0, 0, 1, 1,
-1.222674, 1.090307, -0.384327, 1, 0, 0, 1, 1,
-1.221481, 0.03729369, -1.161903, 0, 0, 0, 1, 1,
-1.219596, -0.6864088, -4.378746, 0, 0, 0, 1, 1,
-1.213241, -1.845695, -0.6008122, 0, 0, 0, 1, 1,
-1.200252, 0.5279314, -1.205908, 0, 0, 0, 1, 1,
-1.198293, 0.05863439, -2.756748, 0, 0, 0, 1, 1,
-1.195307, -0.7306793, -1.421812, 0, 0, 0, 1, 1,
-1.189167, -0.4128432, -0.6536335, 0, 0, 0, 1, 1,
-1.18631, -1.306827, -1.579376, 1, 1, 1, 1, 1,
-1.183604, -0.3659659, -1.671303, 1, 1, 1, 1, 1,
-1.182229, 0.06466305, -2.574161, 1, 1, 1, 1, 1,
-1.179799, -0.7596187, -1.844834, 1, 1, 1, 1, 1,
-1.175414, -0.1954386, -2.41886, 1, 1, 1, 1, 1,
-1.173771, -2.161788, -3.935071, 1, 1, 1, 1, 1,
-1.169692, -0.7021965, -3.279782, 1, 1, 1, 1, 1,
-1.166298, -0.4241593, -3.033742, 1, 1, 1, 1, 1,
-1.162568, 0.6746752, -0.9672636, 1, 1, 1, 1, 1,
-1.156797, 0.2236803, -1.819513, 1, 1, 1, 1, 1,
-1.147753, 1.174119, -1.165047, 1, 1, 1, 1, 1,
-1.140057, 2.068066, -1.964425, 1, 1, 1, 1, 1,
-1.131564, 0.04643768, -2.271312, 1, 1, 1, 1, 1,
-1.121685, 0.7972911, -0.8693595, 1, 1, 1, 1, 1,
-1.118739, 0.08530287, -0.480035, 1, 1, 1, 1, 1,
-1.106458, -1.307705, -1.876371, 0, 0, 1, 1, 1,
-1.103403, 0.3084877, -0.5777375, 1, 0, 0, 1, 1,
-1.102099, 1.076225, -2.368587, 1, 0, 0, 1, 1,
-1.098208, 1.084454, 0.007646861, 1, 0, 0, 1, 1,
-1.097247, -1.738472, -1.763346, 1, 0, 0, 1, 1,
-1.093196, -3.112271, -2.589903, 1, 0, 0, 1, 1,
-1.088493, 1.376304, -1.820729, 0, 0, 0, 1, 1,
-1.087574, -2.211065, -3.469868, 0, 0, 0, 1, 1,
-1.077239, -0.481634, -2.986337, 0, 0, 0, 1, 1,
-1.075056, -0.09884449, -0.5870807, 0, 0, 0, 1, 1,
-1.073719, 1.249833, -0.6021796, 0, 0, 0, 1, 1,
-1.072238, 0.5570933, -0.2794994, 0, 0, 0, 1, 1,
-1.068309, -0.758707, -1.762481, 0, 0, 0, 1, 1,
-1.067896, 1.045344, -1.395806, 1, 1, 1, 1, 1,
-1.064705, -1.38936, -2.011596, 1, 1, 1, 1, 1,
-1.053791, 1.778937, 0.9179233, 1, 1, 1, 1, 1,
-1.046128, 0.5528236, -0.4125388, 1, 1, 1, 1, 1,
-1.042982, -0.7836822, -1.647448, 1, 1, 1, 1, 1,
-1.038605, 1.636708, -0.541235, 1, 1, 1, 1, 1,
-1.036429, 0.1988111, -0.7780389, 1, 1, 1, 1, 1,
-1.036269, -0.9036991, -1.653348, 1, 1, 1, 1, 1,
-1.033545, 1.236263, -2.403109, 1, 1, 1, 1, 1,
-1.032255, 0.3820584, 0.07342789, 1, 1, 1, 1, 1,
-1.03007, 0.5909567, 0.3610606, 1, 1, 1, 1, 1,
-1.029021, -0.152121, -3.264753, 1, 1, 1, 1, 1,
-1.008344, 0.0908134, -0.5704613, 1, 1, 1, 1, 1,
-1.003695, -1.129419, -1.770472, 1, 1, 1, 1, 1,
-0.9960988, 0.04179027, -2.696496, 1, 1, 1, 1, 1,
-0.9902874, 1.278298, 0.08765988, 0, 0, 1, 1, 1,
-0.9818915, -1.982561, -1.504899, 1, 0, 0, 1, 1,
-0.9752573, 0.0557335, -1.799971, 1, 0, 0, 1, 1,
-0.9722672, -0.7856822, -1.189885, 1, 0, 0, 1, 1,
-0.9721189, 1.652264, -0.009943321, 1, 0, 0, 1, 1,
-0.9704223, 1.05557, -1.034618, 1, 0, 0, 1, 1,
-0.9702358, -1.510805, -2.855963, 0, 0, 0, 1, 1,
-0.9658701, -2.37511, -1.411271, 0, 0, 0, 1, 1,
-0.9632806, 1.240055, -1.137273, 0, 0, 0, 1, 1,
-0.9619363, -1.201122, -3.219058, 0, 0, 0, 1, 1,
-0.9603397, 0.4175039, -1.150668, 0, 0, 0, 1, 1,
-0.9547054, -0.4712448, -3.015486, 0, 0, 0, 1, 1,
-0.9515222, -0.03458849, -3.191641, 0, 0, 0, 1, 1,
-0.9474682, 0.5433807, -0.7846412, 1, 1, 1, 1, 1,
-0.9443619, -0.3289734, -2.320114, 1, 1, 1, 1, 1,
-0.9289917, -0.1178766, -2.3719, 1, 1, 1, 1, 1,
-0.9271621, 1.014199, -1.525231, 1, 1, 1, 1, 1,
-0.9252688, -1.039033, -3.392071, 1, 1, 1, 1, 1,
-0.9214855, -0.3517778, -1.727981, 1, 1, 1, 1, 1,
-0.918229, 0.8486549, 0.120368, 1, 1, 1, 1, 1,
-0.9180306, -2.395112, -3.264325, 1, 1, 1, 1, 1,
-0.916653, -0.4338907, -1.403082, 1, 1, 1, 1, 1,
-0.9120609, -0.264805, -2.070075, 1, 1, 1, 1, 1,
-0.9092415, -0.7514187, -2.154239, 1, 1, 1, 1, 1,
-0.9036356, 1.245229, -0.6417479, 1, 1, 1, 1, 1,
-0.9027494, -1.410037, -1.80851, 1, 1, 1, 1, 1,
-0.902508, 1.434191, -1.078453, 1, 1, 1, 1, 1,
-0.8995841, 1.009469, 0.1283203, 1, 1, 1, 1, 1,
-0.8959374, 1.571975, 1.080445, 0, 0, 1, 1, 1,
-0.894324, 0.5501124, -0.5737644, 1, 0, 0, 1, 1,
-0.8928742, -0.2899055, -1.679509, 1, 0, 0, 1, 1,
-0.8845421, -0.362027, -1.6425, 1, 0, 0, 1, 1,
-0.8808921, 1.823758, 0.3054477, 1, 0, 0, 1, 1,
-0.8683941, -0.3615309, -1.35288, 1, 0, 0, 1, 1,
-0.8663752, -1.324937, -1.937677, 0, 0, 0, 1, 1,
-0.8564389, -0.1908222, -3.204906, 0, 0, 0, 1, 1,
-0.8554841, -0.08920075, -0.7112063, 0, 0, 0, 1, 1,
-0.8475368, -0.3123711, -1.966087, 0, 0, 0, 1, 1,
-0.8429245, 0.5407625, -0.1722832, 0, 0, 0, 1, 1,
-0.8367142, 1.31786, -0.07768084, 0, 0, 0, 1, 1,
-0.8337929, 0.8118925, -0.9558744, 0, 0, 0, 1, 1,
-0.8291973, 1.139407, -2.446671, 1, 1, 1, 1, 1,
-0.8279184, 0.95203, -1.975598, 1, 1, 1, 1, 1,
-0.8249391, 1.637787, 1.707575, 1, 1, 1, 1, 1,
-0.8242579, 0.5725601, -1.115828, 1, 1, 1, 1, 1,
-0.8237862, -1.225223, -0.9968721, 1, 1, 1, 1, 1,
-0.8193602, 0.7659826, -0.5996582, 1, 1, 1, 1, 1,
-0.8048749, -0.6776091, -1.933649, 1, 1, 1, 1, 1,
-0.804087, -0.2183182, -0.93129, 1, 1, 1, 1, 1,
-0.7993273, -0.365035, -2.090766, 1, 1, 1, 1, 1,
-0.7927237, 1.340673, -1.562708, 1, 1, 1, 1, 1,
-0.7924982, 0.6516836, -1.473754, 1, 1, 1, 1, 1,
-0.7878627, 1.703335, -3.804377, 1, 1, 1, 1, 1,
-0.7860824, 0.2792753, -2.225381, 1, 1, 1, 1, 1,
-0.7836944, -0.9678847, -1.802628, 1, 1, 1, 1, 1,
-0.7824107, -0.1760901, -2.038163, 1, 1, 1, 1, 1,
-0.7772752, -1.746988, -2.787216, 0, 0, 1, 1, 1,
-0.7738857, 0.1009543, -2.284758, 1, 0, 0, 1, 1,
-0.7734072, 0.8868725, -0.00267483, 1, 0, 0, 1, 1,
-0.7668794, -1.19113, -1.906418, 1, 0, 0, 1, 1,
-0.7651963, -0.2388363, -2.761419, 1, 0, 0, 1, 1,
-0.7637564, -0.6694073, -2.598627, 1, 0, 0, 1, 1,
-0.7626927, 1.979567, -0.9588763, 0, 0, 0, 1, 1,
-0.7608409, -0.383031, -1.74137, 0, 0, 0, 1, 1,
-0.7604248, -0.2869085, -2.076434, 0, 0, 0, 1, 1,
-0.75969, -0.5052602, -0.1142083, 0, 0, 0, 1, 1,
-0.7591174, -1.492589, -2.937324, 0, 0, 0, 1, 1,
-0.7491501, 1.053511, -1.272879, 0, 0, 0, 1, 1,
-0.7486606, -1.007845, -2.788444, 0, 0, 0, 1, 1,
-0.7282546, -0.7410179, -0.8394505, 1, 1, 1, 1, 1,
-0.7270343, -0.5631567, -1.6192, 1, 1, 1, 1, 1,
-0.7253352, -0.3804108, -1.799412, 1, 1, 1, 1, 1,
-0.7069157, 0.6596698, -2.295175, 1, 1, 1, 1, 1,
-0.704583, 1.698176, 0.008888778, 1, 1, 1, 1, 1,
-0.6992796, -1.105433, -4.14648, 1, 1, 1, 1, 1,
-0.6985902, 0.2468104, 0.66668, 1, 1, 1, 1, 1,
-0.6965705, -1.97836, -3.63272, 1, 1, 1, 1, 1,
-0.6944259, -0.9459442, -1.853805, 1, 1, 1, 1, 1,
-0.6910468, -0.3322478, -2.236375, 1, 1, 1, 1, 1,
-0.6910033, -0.3729936, -1.115307, 1, 1, 1, 1, 1,
-0.6895677, -0.5532661, -3.27869, 1, 1, 1, 1, 1,
-0.6891163, 1.897835, -0.02016062, 1, 1, 1, 1, 1,
-0.6861386, 0.4962655, -1.403492, 1, 1, 1, 1, 1,
-0.682498, 0.1456453, -0.1628671, 1, 1, 1, 1, 1,
-0.6792008, -0.215389, -2.782331, 0, 0, 1, 1, 1,
-0.6790739, 2.072474, -2.408196, 1, 0, 0, 1, 1,
-0.6730569, 1.039296, -0.5023018, 1, 0, 0, 1, 1,
-0.6729598, -0.4111572, -1.190822, 1, 0, 0, 1, 1,
-0.6725861, -0.2052277, -2.168411, 1, 0, 0, 1, 1,
-0.6700527, -0.6808913, -1.574281, 1, 0, 0, 1, 1,
-0.6646596, -0.5432209, -3.708342, 0, 0, 0, 1, 1,
-0.6626791, 0.8182657, 0.01932727, 0, 0, 0, 1, 1,
-0.6603827, -2.051848, -2.999885, 0, 0, 0, 1, 1,
-0.660365, 0.006246403, -0.6906105, 0, 0, 0, 1, 1,
-0.6602702, 0.6644586, -0.1871475, 0, 0, 0, 1, 1,
-0.6584778, -0.494769, -1.405456, 0, 0, 0, 1, 1,
-0.654295, 0.1207313, 0.1658372, 0, 0, 0, 1, 1,
-0.6524903, -0.3567337, -0.349556, 1, 1, 1, 1, 1,
-0.6464471, -1.17303, -2.18329, 1, 1, 1, 1, 1,
-0.6442991, -0.06260283, -0.655793, 1, 1, 1, 1, 1,
-0.6380394, 1.009098, -0.04921233, 1, 1, 1, 1, 1,
-0.6324779, -0.1479042, -1.912031, 1, 1, 1, 1, 1,
-0.628976, 0.1408313, -0.611109, 1, 1, 1, 1, 1,
-0.6281393, -0.787042, -4.344672, 1, 1, 1, 1, 1,
-0.6277953, -1.128446, -4.420236, 1, 1, 1, 1, 1,
-0.6270491, -1.487463, -4.181088, 1, 1, 1, 1, 1,
-0.622, 1.099728, -0.685661, 1, 1, 1, 1, 1,
-0.619626, -0.7179729, -1.5124, 1, 1, 1, 1, 1,
-0.6170237, 1.316912, -0.07705542, 1, 1, 1, 1, 1,
-0.6167676, -0.03369211, -0.1167712, 1, 1, 1, 1, 1,
-0.6149172, 0.1523744, -0.805537, 1, 1, 1, 1, 1,
-0.6066383, -1.777648, -4.365156, 1, 1, 1, 1, 1,
-0.6004248, 0.6145177, 0.4487075, 0, 0, 1, 1, 1,
-0.5949047, 1.023141, 0.5001197, 1, 0, 0, 1, 1,
-0.593866, 0.4911183, -1.288174, 1, 0, 0, 1, 1,
-0.5875776, -0.7483006, -0.2051558, 1, 0, 0, 1, 1,
-0.5871046, 0.4899314, -0.2432891, 1, 0, 0, 1, 1,
-0.5815548, 1.260445, -0.3901408, 1, 0, 0, 1, 1,
-0.5774149, -0.582662, -2.740768, 0, 0, 0, 1, 1,
-0.57105, 0.2002798, -1.032097, 0, 0, 0, 1, 1,
-0.5698465, 1.541348, 0.412217, 0, 0, 0, 1, 1,
-0.5630432, 1.133595, -1.391827, 0, 0, 0, 1, 1,
-0.5572885, 0.6657944, 0.5818707, 0, 0, 0, 1, 1,
-0.5566207, -0.7598547, -2.427471, 0, 0, 0, 1, 1,
-0.5525585, -1.136809, -0.2725476, 0, 0, 0, 1, 1,
-0.5522591, 0.1098125, -0.6999382, 1, 1, 1, 1, 1,
-0.549243, -0.06769477, -2.268751, 1, 1, 1, 1, 1,
-0.5477567, -0.7093803, -2.241067, 1, 1, 1, 1, 1,
-0.5473849, 0.4952607, -1.01023, 1, 1, 1, 1, 1,
-0.5463222, 1.506376, 0.6687739, 1, 1, 1, 1, 1,
-0.5447828, -1.2941, -4.845625, 1, 1, 1, 1, 1,
-0.538913, 1.793119, 1.143278, 1, 1, 1, 1, 1,
-0.5320195, -0.6877092, -0.08872719, 1, 1, 1, 1, 1,
-0.5303963, -0.680107, -1.124982, 1, 1, 1, 1, 1,
-0.5301985, -0.3587071, -2.246577, 1, 1, 1, 1, 1,
-0.5263439, 0.8921522, -0.6001526, 1, 1, 1, 1, 1,
-0.5242824, 0.8696092, 0.4500444, 1, 1, 1, 1, 1,
-0.5206211, -1.276681, -3.079025, 1, 1, 1, 1, 1,
-0.5205633, -0.1557999, -1.023929, 1, 1, 1, 1, 1,
-0.5184918, -0.3135991, -1.631958, 1, 1, 1, 1, 1,
-0.5166883, -1.078057, -2.02637, 0, 0, 1, 1, 1,
-0.5127574, -0.1315021, -2.454566, 1, 0, 0, 1, 1,
-0.5082562, 0.2575632, -0.6579526, 1, 0, 0, 1, 1,
-0.5061486, 2.12517, -0.02191182, 1, 0, 0, 1, 1,
-0.5034168, -0.03787559, -1.089507, 1, 0, 0, 1, 1,
-0.5017387, 2.130796, -1.154021, 1, 0, 0, 1, 1,
-0.5010917, -0.7220362, -0.9710918, 0, 0, 0, 1, 1,
-0.4998729, 0.124863, -0.6055524, 0, 0, 0, 1, 1,
-0.497268, 0.4274414, -1.044359, 0, 0, 0, 1, 1,
-0.495218, -2.019249, -3.423023, 0, 0, 0, 1, 1,
-0.491543, -2.04617, -3.167077, 0, 0, 0, 1, 1,
-0.4871455, 0.3695215, -0.7666041, 0, 0, 0, 1, 1,
-0.48296, -0.850897, -1.783928, 0, 0, 0, 1, 1,
-0.4814538, 2.022153, -0.1445759, 1, 1, 1, 1, 1,
-0.4793697, 0.2697415, -2.430375, 1, 1, 1, 1, 1,
-0.4764258, -1.493202, -1.974866, 1, 1, 1, 1, 1,
-0.4758306, -0.7279679, -1.941121, 1, 1, 1, 1, 1,
-0.4747102, 0.1251229, -3.347566, 1, 1, 1, 1, 1,
-0.4736657, -1.528412, -2.194258, 1, 1, 1, 1, 1,
-0.4592448, -0.0299638, -2.316957, 1, 1, 1, 1, 1,
-0.4591772, 1.10111, -0.1523336, 1, 1, 1, 1, 1,
-0.4572765, 0.2072003, 0.4019535, 1, 1, 1, 1, 1,
-0.4534951, -0.9298868, -1.584157, 1, 1, 1, 1, 1,
-0.4519475, 0.01450759, -2.081437, 1, 1, 1, 1, 1,
-0.4519321, 0.1439312, -0.7790987, 1, 1, 1, 1, 1,
-0.4511212, -0.5257879, -3.160163, 1, 1, 1, 1, 1,
-0.4449537, 0.003228999, 0.1818473, 1, 1, 1, 1, 1,
-0.4443534, -0.1440945, -1.251924, 1, 1, 1, 1, 1,
-0.4378989, -0.5511532, -2.798415, 0, 0, 1, 1, 1,
-0.4346811, 0.6718846, 1.144252, 1, 0, 0, 1, 1,
-0.4321739, 1.037917, -0.2295476, 1, 0, 0, 1, 1,
-0.4289724, -0.7320955, -1.961565, 1, 0, 0, 1, 1,
-0.4287932, -1.441095, -2.515537, 1, 0, 0, 1, 1,
-0.428738, 0.4548458, -0.9609292, 1, 0, 0, 1, 1,
-0.4286317, 1.602751, -1.081353, 0, 0, 0, 1, 1,
-0.4274128, -0.163267, -2.451417, 0, 0, 0, 1, 1,
-0.421369, -0.06509941, -2.38366, 0, 0, 0, 1, 1,
-0.4164141, 0.5360537, -1.711047, 0, 0, 0, 1, 1,
-0.4154533, -0.8824289, -2.296028, 0, 0, 0, 1, 1,
-0.4129676, 1.310446, 0.7832736, 0, 0, 0, 1, 1,
-0.4106007, -0.8828065, -3.290824, 0, 0, 0, 1, 1,
-0.4087254, -1.861517, -1.244499, 1, 1, 1, 1, 1,
-0.4086177, 0.4737979, -0.4044212, 1, 1, 1, 1, 1,
-0.4073115, 1.911996, -1.276362, 1, 1, 1, 1, 1,
-0.4020851, 0.5810753, 0.1830682, 1, 1, 1, 1, 1,
-0.398283, -0.8388273, -4.617732, 1, 1, 1, 1, 1,
-0.3926668, 0.1607227, -1.020784, 1, 1, 1, 1, 1,
-0.3918529, -0.1232892, -2.557826, 1, 1, 1, 1, 1,
-0.3859699, -0.5365918, -1.123929, 1, 1, 1, 1, 1,
-0.381938, 0.9493931, 1.110803, 1, 1, 1, 1, 1,
-0.376568, 0.3253312, -0.7473074, 1, 1, 1, 1, 1,
-0.375454, -1.413859, -2.196634, 1, 1, 1, 1, 1,
-0.3727522, 0.1393401, -1.007472, 1, 1, 1, 1, 1,
-0.369728, -0.8333178, -2.213014, 1, 1, 1, 1, 1,
-0.3640937, -1.15913, -1.838531, 1, 1, 1, 1, 1,
-0.363927, 0.1577857, -3.11116, 1, 1, 1, 1, 1,
-0.36148, -0.0711432, -1.397084, 0, 0, 1, 1, 1,
-0.3593807, -0.2160651, -2.788623, 1, 0, 0, 1, 1,
-0.3582546, 0.9410616, -0.4404438, 1, 0, 0, 1, 1,
-0.3524012, -0.2166048, -2.626224, 1, 0, 0, 1, 1,
-0.3485215, 0.1310025, -3.0658, 1, 0, 0, 1, 1,
-0.3465031, -1.681532, -3.996043, 1, 0, 0, 1, 1,
-0.342564, 2.109026, -0.02678923, 0, 0, 0, 1, 1,
-0.3384703, 1.739584, -0.1038632, 0, 0, 0, 1, 1,
-0.3351653, 0.8306547, -0.2609173, 0, 0, 0, 1, 1,
-0.3317392, -0.5748598, -2.92824, 0, 0, 0, 1, 1,
-0.3302087, 2.290447, 0.5280579, 0, 0, 0, 1, 1,
-0.3292083, -0.02348119, 0.5811601, 0, 0, 0, 1, 1,
-0.3289815, -0.5495827, -1.482094, 0, 0, 0, 1, 1,
-0.3265884, 0.4086038, -0.5921286, 1, 1, 1, 1, 1,
-0.3235499, 0.3811857, -2.086387, 1, 1, 1, 1, 1,
-0.3229096, -0.8067479, -4.24578, 1, 1, 1, 1, 1,
-0.3215888, -0.1539254, -2.994913, 1, 1, 1, 1, 1,
-0.3207127, -0.6787528, -1.497656, 1, 1, 1, 1, 1,
-0.3171057, -1.357679, -3.229994, 1, 1, 1, 1, 1,
-0.3168926, -0.1202501, -1.581503, 1, 1, 1, 1, 1,
-0.3094231, -1.056131, -2.137887, 1, 1, 1, 1, 1,
-0.3081192, -1.230556, -3.145725, 1, 1, 1, 1, 1,
-0.3079554, -0.350775, -1.979694, 1, 1, 1, 1, 1,
-0.3042526, 1.49814, 0.9406397, 1, 1, 1, 1, 1,
-0.3022305, 0.9131885, -0.2443564, 1, 1, 1, 1, 1,
-0.2982899, -0.7434871, -2.979643, 1, 1, 1, 1, 1,
-0.2980686, -0.9840924, -2.691803, 1, 1, 1, 1, 1,
-0.296957, -0.2084054, -2.531482, 1, 1, 1, 1, 1,
-0.2967194, 0.9595259, 0.05963377, 0, 0, 1, 1, 1,
-0.2951001, -0.5145833, -1.743818, 1, 0, 0, 1, 1,
-0.2938993, -0.07865728, -2.918002, 1, 0, 0, 1, 1,
-0.29303, 0.5992589, 0.6566765, 1, 0, 0, 1, 1,
-0.2916852, 1.303449, -0.3414563, 1, 0, 0, 1, 1,
-0.2845267, 1.067193, -1.0504, 1, 0, 0, 1, 1,
-0.2840583, -0.6957359, -2.296634, 0, 0, 0, 1, 1,
-0.2821932, -0.2037899, -1.913153, 0, 0, 0, 1, 1,
-0.2770241, 2.303589, -0.833707, 0, 0, 0, 1, 1,
-0.2769423, -0.5711075, -2.075872, 0, 0, 0, 1, 1,
-0.2729571, -0.6908413, -4.446259, 0, 0, 0, 1, 1,
-0.2704245, 0.5378239, -1.585764, 0, 0, 0, 1, 1,
-0.2704016, -0.01630589, -0.7091476, 0, 0, 0, 1, 1,
-0.2693807, 0.6939319, 2.610682, 1, 1, 1, 1, 1,
-0.2640217, -0.4663875, -1.271958, 1, 1, 1, 1, 1,
-0.2624525, 0.6258402, -1.423492, 1, 1, 1, 1, 1,
-0.259691, -0.01425953, -1.042637, 1, 1, 1, 1, 1,
-0.2587816, -1.038889, -3.0262, 1, 1, 1, 1, 1,
-0.256244, -1.04981, -3.065946, 1, 1, 1, 1, 1,
-0.2494995, 0.1533289, -2.114518, 1, 1, 1, 1, 1,
-0.2438923, -0.2122105, -0.7037238, 1, 1, 1, 1, 1,
-0.2437592, 0.4001724, 0.0929269, 1, 1, 1, 1, 1,
-0.2422464, 0.9268569, 0.4791937, 1, 1, 1, 1, 1,
-0.2403986, 2.236699, 0.5064166, 1, 1, 1, 1, 1,
-0.2341698, 1.28321, 0.8213984, 1, 1, 1, 1, 1,
-0.2263649, 2.051112, -0.4011608, 1, 1, 1, 1, 1,
-0.2202426, -0.6941078, -5.006873, 1, 1, 1, 1, 1,
-0.219006, -0.5335419, -3.021248, 1, 1, 1, 1, 1,
-0.2183478, -0.828591, -1.743024, 0, 0, 1, 1, 1,
-0.2178663, -0.4929247, -1.78522, 1, 0, 0, 1, 1,
-0.2163458, -0.8188289, -3.057068, 1, 0, 0, 1, 1,
-0.2117652, 0.1440664, -1.624579, 1, 0, 0, 1, 1,
-0.2113249, 0.5731258, 0.9054762, 1, 0, 0, 1, 1,
-0.2105345, 0.3646329, 1.396132, 1, 0, 0, 1, 1,
-0.2033152, 1.211995, 1.063516, 0, 0, 0, 1, 1,
-0.2004476, 0.8653659, 0.2155839, 0, 0, 0, 1, 1,
-0.1960752, 0.1698066, 0.2034465, 0, 0, 0, 1, 1,
-0.195139, 1.057982, 0.3419778, 0, 0, 0, 1, 1,
-0.1939438, 0.447896, -0.4992952, 0, 0, 0, 1, 1,
-0.1934553, -2.223486, -5.039565, 0, 0, 0, 1, 1,
-0.1862587, 0.2459453, 0.04685428, 0, 0, 0, 1, 1,
-0.1859292, -2.249765, -4.695072, 1, 1, 1, 1, 1,
-0.1802026, -0.7885003, -4.273978, 1, 1, 1, 1, 1,
-0.1727018, -0.2858864, -2.768546, 1, 1, 1, 1, 1,
-0.1704207, 0.5672126, 0.1355248, 1, 1, 1, 1, 1,
-0.1647201, 0.2841036, 0.8145705, 1, 1, 1, 1, 1,
-0.1623274, -0.02850701, -1.668535, 1, 1, 1, 1, 1,
-0.1614569, -2.263545, -2.565306, 1, 1, 1, 1, 1,
-0.153743, -0.04595976, -3.215375, 1, 1, 1, 1, 1,
-0.1506015, -0.7317215, -3.61522, 1, 1, 1, 1, 1,
-0.1471247, 0.377279, 1.40307, 1, 1, 1, 1, 1,
-0.1459015, 0.5845423, 0.05814296, 1, 1, 1, 1, 1,
-0.1458766, -0.08529525, -2.174306, 1, 1, 1, 1, 1,
-0.1458053, -0.01115589, -1.696265, 1, 1, 1, 1, 1,
-0.1434779, -2.389394, -4.771723, 1, 1, 1, 1, 1,
-0.1425827, -0.3148289, -1.990625, 1, 1, 1, 1, 1,
-0.1410305, -0.235468, -2.149478, 0, 0, 1, 1, 1,
-0.1386342, 1.48395, -0.1653007, 1, 0, 0, 1, 1,
-0.1382733, -0.1221435, -3.32681, 1, 0, 0, 1, 1,
-0.1357154, -1.434298, -1.047594, 1, 0, 0, 1, 1,
-0.1339573, 0.4291387, 0.1197855, 1, 0, 0, 1, 1,
-0.1327048, -0.5860607, -5.026894, 1, 0, 0, 1, 1,
-0.1245113, 1.190019, -0.1259909, 0, 0, 0, 1, 1,
-0.1223308, -0.975153, -1.660817, 0, 0, 0, 1, 1,
-0.1221254, -0.277292, -2.623936, 0, 0, 0, 1, 1,
-0.1201787, -1.435529, -5.058839, 0, 0, 0, 1, 1,
-0.1192801, 1.688318, -0.2129379, 0, 0, 0, 1, 1,
-0.1191005, 0.5737037, -0.6351274, 0, 0, 0, 1, 1,
-0.1150597, 0.3990366, -0.8966128, 0, 0, 0, 1, 1,
-0.1099347, -0.1564858, -3.762761, 1, 1, 1, 1, 1,
-0.1093358, 0.4397579, -0.6535619, 1, 1, 1, 1, 1,
-0.107477, -0.0870189, -0.8055496, 1, 1, 1, 1, 1,
-0.1040119, -0.2072533, -3.795177, 1, 1, 1, 1, 1,
-0.1027371, -1.796598, -2.179775, 1, 1, 1, 1, 1,
-0.102081, 1.022612, 0.6468626, 1, 1, 1, 1, 1,
-0.08989768, 0.5177964, 0.5745724, 1, 1, 1, 1, 1,
-0.08617145, 0.7873692, -0.535401, 1, 1, 1, 1, 1,
-0.08165258, -1.126223, -2.767425, 1, 1, 1, 1, 1,
-0.08092056, -0.1410893, -2.1603, 1, 1, 1, 1, 1,
-0.07629747, -0.1293882, -3.126866, 1, 1, 1, 1, 1,
-0.07607837, 1.329046, -1.334203, 1, 1, 1, 1, 1,
-0.07473534, 0.2541957, -0.9388888, 1, 1, 1, 1, 1,
-0.07324614, 0.3854208, -0.05871464, 1, 1, 1, 1, 1,
-0.0722314, -0.6276801, -2.503157, 1, 1, 1, 1, 1,
-0.07054438, 0.4366438, -0.6080624, 0, 0, 1, 1, 1,
-0.067435, 0.1489044, -1.59374, 1, 0, 0, 1, 1,
-0.061531, -0.1204802, -3.567703, 1, 0, 0, 1, 1,
-0.06124894, -1.375364, -3.211483, 1, 0, 0, 1, 1,
-0.05784446, 0.03069525, -1.691343, 1, 0, 0, 1, 1,
-0.05587651, -0.4557087, -3.186352, 1, 0, 0, 1, 1,
-0.05357029, -0.4102469, -5.28064, 0, 0, 0, 1, 1,
-0.05332348, -1.712239, -2.60657, 0, 0, 0, 1, 1,
-0.05310194, 1.019176, -0.5585096, 0, 0, 0, 1, 1,
-0.04759466, -1.401132, -1.997117, 0, 0, 0, 1, 1,
-0.04594003, -0.0134028, -2.06283, 0, 0, 0, 1, 1,
-0.03808531, -2.252128, -1.24747, 0, 0, 0, 1, 1,
-0.03444566, 1.338085, 0.8122027, 0, 0, 0, 1, 1,
-0.0330926, -0.7127444, -2.277724, 1, 1, 1, 1, 1,
-0.02472994, -0.9710586, -3.772236, 1, 1, 1, 1, 1,
-0.01893703, 0.7240839, -0.02621906, 1, 1, 1, 1, 1,
-0.0170205, 0.7966614, 0.9345942, 1, 1, 1, 1, 1,
-0.01689539, 0.3932979, -0.2244765, 1, 1, 1, 1, 1,
-0.01578859, 0.07278247, 0.6186586, 1, 1, 1, 1, 1,
-0.01220162, 0.1953874, -0.2412315, 1, 1, 1, 1, 1,
-0.009364478, -0.3792671, -1.646014, 1, 1, 1, 1, 1,
-0.004494434, 0.1719305, -0.1353185, 1, 1, 1, 1, 1,
0.0004663483, 0.4896053, -0.4166749, 1, 1, 1, 1, 1,
0.01250069, -1.548488, 2.385899, 1, 1, 1, 1, 1,
0.01304108, 0.5033153, 0.01102826, 1, 1, 1, 1, 1,
0.01366661, -0.3764737, 3.014001, 1, 1, 1, 1, 1,
0.01466939, 0.4759456, -0.1127423, 1, 1, 1, 1, 1,
0.01648299, 1.211953, -0.45193, 1, 1, 1, 1, 1,
0.01733899, -3.335294, 2.03015, 0, 0, 1, 1, 1,
0.01820727, -0.7407321, 3.570152, 1, 0, 0, 1, 1,
0.0183619, 0.2412028, -0.06053964, 1, 0, 0, 1, 1,
0.02174207, -0.05474512, 2.484286, 1, 0, 0, 1, 1,
0.02723982, -1.135277, 3.094781, 1, 0, 0, 1, 1,
0.03292475, 1.469408, -0.7698093, 1, 0, 0, 1, 1,
0.03328363, 0.5272119, 2.503266, 0, 0, 0, 1, 1,
0.03546546, -0.05781399, 3.180066, 0, 0, 0, 1, 1,
0.03580581, 0.2641651, 0.4347558, 0, 0, 0, 1, 1,
0.03691973, 0.9460623, -0.9592216, 0, 0, 0, 1, 1,
0.03783898, 1.653959, -0.2158645, 0, 0, 0, 1, 1,
0.04245901, 0.6929536, 0.6043893, 0, 0, 0, 1, 1,
0.0450236, -0.3071741, 3.386217, 0, 0, 0, 1, 1,
0.04830612, -1.256626, 4.281505, 1, 1, 1, 1, 1,
0.05439487, -0.05315717, 3.077928, 1, 1, 1, 1, 1,
0.05455174, -1.180938, 2.022511, 1, 1, 1, 1, 1,
0.05872511, -1.406349, 3.022278, 1, 1, 1, 1, 1,
0.06028683, 0.6348096, -1.668481, 1, 1, 1, 1, 1,
0.06737234, 1.223991, 0.9915106, 1, 1, 1, 1, 1,
0.07032412, 0.533215, 1.360831, 1, 1, 1, 1, 1,
0.07580353, -0.1366477, 3.392712, 1, 1, 1, 1, 1,
0.07582774, -0.8827983, 2.257663, 1, 1, 1, 1, 1,
0.0785104, 1.448179, -1.160897, 1, 1, 1, 1, 1,
0.08033436, -0.2205979, 2.06128, 1, 1, 1, 1, 1,
0.0826346, -0.5649148, 2.233409, 1, 1, 1, 1, 1,
0.0852104, 0.6923498, -0.5358395, 1, 1, 1, 1, 1,
0.0876691, 0.3311045, -0.1302099, 1, 1, 1, 1, 1,
0.09258003, 1.713183, -2.328994, 1, 1, 1, 1, 1,
0.09860697, -0.1304533, 2.716225, 0, 0, 1, 1, 1,
0.09883959, 1.910874, -1.432735, 1, 0, 0, 1, 1,
0.09892604, 1.487741, 0.1642596, 1, 0, 0, 1, 1,
0.0992369, 0.4541624, -0.1557067, 1, 0, 0, 1, 1,
0.1045491, 0.9657538, -0.5116948, 1, 0, 0, 1, 1,
0.1051007, 1.666873, 0.03609657, 1, 0, 0, 1, 1,
0.1070326, 0.03003109, -0.0569305, 0, 0, 0, 1, 1,
0.1087496, -0.9561949, 2.636057, 0, 0, 0, 1, 1,
0.1092922, -0.7307361, 4.594111, 0, 0, 0, 1, 1,
0.1097167, 0.2992447, 0.03700091, 0, 0, 0, 1, 1,
0.1134984, 0.4479403, -0.3205448, 0, 0, 0, 1, 1,
0.1151713, -0.7123218, 2.226762, 0, 0, 0, 1, 1,
0.1158365, 0.5769923, 0.8171738, 0, 0, 0, 1, 1,
0.1185192, 1.390255, 0.1701534, 1, 1, 1, 1, 1,
0.1240294, -1.584097, 1.9523, 1, 1, 1, 1, 1,
0.1261204, 2.252488, 1.034926, 1, 1, 1, 1, 1,
0.1344968, -0.5327283, 3.558517, 1, 1, 1, 1, 1,
0.1388145, -1.542668, 4.083186, 1, 1, 1, 1, 1,
0.1400462, 0.4949532, -0.1470497, 1, 1, 1, 1, 1,
0.1402393, -0.2418136, 3.269269, 1, 1, 1, 1, 1,
0.1425063, 0.7766232, 0.8239722, 1, 1, 1, 1, 1,
0.1444126, 2.425872, 0.6964954, 1, 1, 1, 1, 1,
0.145304, -0.4289782, 3.114479, 1, 1, 1, 1, 1,
0.1477407, -0.2850245, 1.657867, 1, 1, 1, 1, 1,
0.1481936, -0.225689, 2.962458, 1, 1, 1, 1, 1,
0.1531763, 1.306869, 0.5574463, 1, 1, 1, 1, 1,
0.1563691, 0.2206608, 1.05152, 1, 1, 1, 1, 1,
0.1654826, 1.073331, 0.5608323, 1, 1, 1, 1, 1,
0.1692972, 1.454148, -0.1779336, 0, 0, 1, 1, 1,
0.1693088, 0.9681941, 0.3288146, 1, 0, 0, 1, 1,
0.1789603, 1.629561, -0.5344242, 1, 0, 0, 1, 1,
0.1816868, -0.7907646, 1.957185, 1, 0, 0, 1, 1,
0.1830825, -0.05307797, 2.087272, 1, 0, 0, 1, 1,
0.1904374, 0.06725357, 2.794326, 1, 0, 0, 1, 1,
0.190974, -0.4490165, 2.682527, 0, 0, 0, 1, 1,
0.1916236, -0.2134183, 1.057778, 0, 0, 0, 1, 1,
0.1916347, 0.9698871, -1.369421, 0, 0, 0, 1, 1,
0.1952966, -0.3077551, 2.40319, 0, 0, 0, 1, 1,
0.1954897, 0.8249109, 1.639729, 0, 0, 0, 1, 1,
0.1963876, 0.2811442, 1.325634, 0, 0, 0, 1, 1,
0.1970236, 1.089349, 0.1159462, 0, 0, 0, 1, 1,
0.1986879, -0.8560686, 2.842302, 1, 1, 1, 1, 1,
0.2007927, 1.609905, -1.017671, 1, 1, 1, 1, 1,
0.2099014, -0.141098, 2.674887, 1, 1, 1, 1, 1,
0.2105451, -1.936552, 2.413728, 1, 1, 1, 1, 1,
0.2168998, 1.786706, 1.510151, 1, 1, 1, 1, 1,
0.2172472, -0.1908551, 0.5433297, 1, 1, 1, 1, 1,
0.2184034, -2.295971, 3.33002, 1, 1, 1, 1, 1,
0.2190362, -0.1317599, 0.4239262, 1, 1, 1, 1, 1,
0.2254159, 0.2432539, 1.003352, 1, 1, 1, 1, 1,
0.2281399, 0.6115429, 0.8641857, 1, 1, 1, 1, 1,
0.2283792, -0.8435602, 2.226824, 1, 1, 1, 1, 1,
0.228708, 2.383363, -2.638246, 1, 1, 1, 1, 1,
0.2287923, -0.7638477, 1.759987, 1, 1, 1, 1, 1,
0.230315, 0.3065863, 1.045275, 1, 1, 1, 1, 1,
0.2325303, 0.4225113, 1.398501, 1, 1, 1, 1, 1,
0.2332847, -1.430727, 2.237315, 0, 0, 1, 1, 1,
0.2362699, 1.426424, -0.415207, 1, 0, 0, 1, 1,
0.2386041, 1.323051, -0.6376914, 1, 0, 0, 1, 1,
0.2394609, 0.255565, -0.3675864, 1, 0, 0, 1, 1,
0.2487552, 2.088259, 0.05149265, 1, 0, 0, 1, 1,
0.2493915, 0.4510965, 0.2083346, 1, 0, 0, 1, 1,
0.2511998, -0.5343438, 3.332536, 0, 0, 0, 1, 1,
0.252579, -0.06203324, 2.458524, 0, 0, 0, 1, 1,
0.2534548, 0.07196653, 1.504193, 0, 0, 0, 1, 1,
0.2536229, 2.719636, 1.366822, 0, 0, 0, 1, 1,
0.2547679, -1.929881, 3.00483, 0, 0, 0, 1, 1,
0.2555036, -0.09628606, 4.231762, 0, 0, 0, 1, 1,
0.2558441, 0.03368647, 1.60381, 0, 0, 0, 1, 1,
0.2577672, 0.4261388, 2.229421, 1, 1, 1, 1, 1,
0.2581155, -0.3864223, 4.405647, 1, 1, 1, 1, 1,
0.2592497, 0.8218403, 0.2087927, 1, 1, 1, 1, 1,
0.2597327, 0.1241654, 1.612561, 1, 1, 1, 1, 1,
0.2603646, 0.8399269, -0.9066226, 1, 1, 1, 1, 1,
0.2613687, -0.2599999, 2.575533, 1, 1, 1, 1, 1,
0.2623866, 0.0410535, 1.992244, 1, 1, 1, 1, 1,
0.2636552, 0.2011844, 2.485006, 1, 1, 1, 1, 1,
0.2655591, 1.367383, 1.576118, 1, 1, 1, 1, 1,
0.2687695, -1.881178, 2.693434, 1, 1, 1, 1, 1,
0.2732802, 1.652418, 0.9055095, 1, 1, 1, 1, 1,
0.2763022, -0.177896, 2.92638, 1, 1, 1, 1, 1,
0.2765013, 0.5748439, -1.21727, 1, 1, 1, 1, 1,
0.2801394, -0.143091, 1.015956, 1, 1, 1, 1, 1,
0.282841, 0.5143285, 0.03643587, 1, 1, 1, 1, 1,
0.285039, 0.5284014, 1.630997, 0, 0, 1, 1, 1,
0.2853225, -0.3903327, 3.31798, 1, 0, 0, 1, 1,
0.2853925, -0.866383, 3.157083, 1, 0, 0, 1, 1,
0.2964303, 0.3742546, -0.7561268, 1, 0, 0, 1, 1,
0.298718, 2.063495, 1.272274, 1, 0, 0, 1, 1,
0.299383, 0.4751155, -0.948315, 1, 0, 0, 1, 1,
0.3000067, -1.380243, 2.468502, 0, 0, 0, 1, 1,
0.3023381, 0.8254867, 0.9797094, 0, 0, 0, 1, 1,
0.3025417, -0.04167883, 1.671583, 0, 0, 0, 1, 1,
0.3037531, -1.560312, 3.35238, 0, 0, 0, 1, 1,
0.3136417, -1.116575, 4.198949, 0, 0, 0, 1, 1,
0.3140835, -0.4708732, 2.100879, 0, 0, 0, 1, 1,
0.3240043, 0.1598094, 2.59134, 0, 0, 0, 1, 1,
0.3269713, 0.5376781, 1.248048, 1, 1, 1, 1, 1,
0.3329968, 1.388554, 0.3757625, 1, 1, 1, 1, 1,
0.3353439, -0.7146253, 1.529247, 1, 1, 1, 1, 1,
0.3377605, -0.9279984, 1.800409, 1, 1, 1, 1, 1,
0.3418649, 0.2418577, 2.399228, 1, 1, 1, 1, 1,
0.3419814, 0.5413421, 2.718068, 1, 1, 1, 1, 1,
0.3427884, 0.6001323, -0.2150724, 1, 1, 1, 1, 1,
0.3442179, -0.57047, 1.884407, 1, 1, 1, 1, 1,
0.3459221, 1.302838, 0.1552853, 1, 1, 1, 1, 1,
0.3461474, 1.283557, 0.7503477, 1, 1, 1, 1, 1,
0.3517406, 0.07041983, 0.3321858, 1, 1, 1, 1, 1,
0.3553153, -2.63255, 3.180238, 1, 1, 1, 1, 1,
0.3555638, 2.128285, -0.6756769, 1, 1, 1, 1, 1,
0.3558457, 1.645068, -0.2943903, 1, 1, 1, 1, 1,
0.3585561, -0.6723232, 4.716194, 1, 1, 1, 1, 1,
0.3702256, -1.623435, 3.913062, 0, 0, 1, 1, 1,
0.3723612, 0.2835393, -0.6598838, 1, 0, 0, 1, 1,
0.3750187, -0.1847925, 2.515249, 1, 0, 0, 1, 1,
0.3763542, -0.1342515, 1.984277, 1, 0, 0, 1, 1,
0.3806834, -0.9998898, 1.276567, 1, 0, 0, 1, 1,
0.3819532, 2.997327, -1.369942, 1, 0, 0, 1, 1,
0.3820219, -1.099092, 3.625885, 0, 0, 0, 1, 1,
0.3830559, 1.133608, 0.6771173, 0, 0, 0, 1, 1,
0.3849341, 0.5959039, 1.128453, 0, 0, 0, 1, 1,
0.3863202, -0.3127659, 2.33545, 0, 0, 0, 1, 1,
0.3877553, -0.114153, 0.6829636, 0, 0, 0, 1, 1,
0.3888582, -1.076779, 3.560454, 0, 0, 0, 1, 1,
0.3953205, -0.5205478, 3.064707, 0, 0, 0, 1, 1,
0.395722, 0.135524, 1.620587, 1, 1, 1, 1, 1,
0.3965973, -0.6907138, 1.500405, 1, 1, 1, 1, 1,
0.3966485, 0.6694654, 0.7030113, 1, 1, 1, 1, 1,
0.3976876, 0.08010069, 2.510198, 1, 1, 1, 1, 1,
0.3986317, -0.3174073, 2.081789, 1, 1, 1, 1, 1,
0.4045027, 0.1221277, 1.347284, 1, 1, 1, 1, 1,
0.4176961, 0.8203161, 0.5507941, 1, 1, 1, 1, 1,
0.4219364, 1.522899, 0.3053188, 1, 1, 1, 1, 1,
0.4228525, 0.04273773, 1.062591, 1, 1, 1, 1, 1,
0.4234185, -1.832047, 3.568696, 1, 1, 1, 1, 1,
0.4249924, -1.210331, 4.045954, 1, 1, 1, 1, 1,
0.4347927, 1.409706, 0.6154056, 1, 1, 1, 1, 1,
0.4379355, 0.09916353, 1.199202, 1, 1, 1, 1, 1,
0.4423242, 1.498501, 1.977979, 1, 1, 1, 1, 1,
0.4481533, -0.1060837, 1.240712, 1, 1, 1, 1, 1,
0.4482117, -1.428599, 4.197056, 0, 0, 1, 1, 1,
0.4513597, -0.7659374, 3.080536, 1, 0, 0, 1, 1,
0.4572851, 2.72244, -1.563258, 1, 0, 0, 1, 1,
0.4599861, 0.1068725, 1.561687, 1, 0, 0, 1, 1,
0.4612696, -1.696081, 2.628662, 1, 0, 0, 1, 1,
0.4628414, 1.602126, 0.7763124, 1, 0, 0, 1, 1,
0.4646941, -0.891773, 3.292458, 0, 0, 0, 1, 1,
0.4651216, -0.2532483, 1.419674, 0, 0, 0, 1, 1,
0.4658465, -1.239216, 2.465414, 0, 0, 0, 1, 1,
0.4706692, 0.7791756, 0.8538948, 0, 0, 0, 1, 1,
0.4709359, -0.1168208, 1.708308, 0, 0, 0, 1, 1,
0.4767328, -0.6317341, 2.528193, 0, 0, 0, 1, 1,
0.4769501, 0.1802483, 1.437747, 0, 0, 0, 1, 1,
0.47759, 1.383782, 1.984106, 1, 1, 1, 1, 1,
0.4789873, -0.1921572, 2.57146, 1, 1, 1, 1, 1,
0.4848322, 0.04947941, 1.34016, 1, 1, 1, 1, 1,
0.4851162, -0.1303322, 0.9669794, 1, 1, 1, 1, 1,
0.4855797, 0.2607916, 1.252708, 1, 1, 1, 1, 1,
0.4860598, -0.4978032, 1.761296, 1, 1, 1, 1, 1,
0.4869856, 0.8026177, 1.027841, 1, 1, 1, 1, 1,
0.4964783, -0.7781047, 3.499312, 1, 1, 1, 1, 1,
0.4978667, -0.08752898, 1.188915, 1, 1, 1, 1, 1,
0.504009, -0.1636075, 4.585756, 1, 1, 1, 1, 1,
0.5063841, -0.120423, 2.280452, 1, 1, 1, 1, 1,
0.5128038, 1.09509, 0.9741686, 1, 1, 1, 1, 1,
0.5170005, -0.4832278, 2.291228, 1, 1, 1, 1, 1,
0.5227355, 0.9803596, 1.018849, 1, 1, 1, 1, 1,
0.5263494, -1.697163, 2.333826, 1, 1, 1, 1, 1,
0.5322856, -1.033335, 2.642487, 0, 0, 1, 1, 1,
0.5330324, 0.422979, 1.016248, 1, 0, 0, 1, 1,
0.533656, 0.9197456, -0.5267098, 1, 0, 0, 1, 1,
0.5359986, 0.09168912, 0.1919025, 1, 0, 0, 1, 1,
0.5444824, -0.777189, 4.006956, 1, 0, 0, 1, 1,
0.5501063, -0.05944535, 0.8737897, 1, 0, 0, 1, 1,
0.5505829, -0.0132537, 0.9281645, 0, 0, 0, 1, 1,
0.5516986, 0.1414185, 0.6284477, 0, 0, 0, 1, 1,
0.5573596, -0.1775873, 2.361713, 0, 0, 0, 1, 1,
0.5612284, 1.547898, -0.9350433, 0, 0, 0, 1, 1,
0.5633312, 1.118405, -0.5528313, 0, 0, 0, 1, 1,
0.571552, -1.647774, 3.868488, 0, 0, 0, 1, 1,
0.5942551, -0.3857833, 2.369102, 0, 0, 0, 1, 1,
0.600113, -0.2303698, 1.295578, 1, 1, 1, 1, 1,
0.6005256, -1.088218, 2.510204, 1, 1, 1, 1, 1,
0.6024292, -0.4539971, 2.362705, 1, 1, 1, 1, 1,
0.6073635, 1.170117, 2.151368, 1, 1, 1, 1, 1,
0.6145017, -0.883051, 1.008966, 1, 1, 1, 1, 1,
0.6198947, -0.291824, 1.762573, 1, 1, 1, 1, 1,
0.6216553, 0.4725101, 0.9955148, 1, 1, 1, 1, 1,
0.6222664, 0.6500083, 1.129909, 1, 1, 1, 1, 1,
0.6234561, -0.09295536, 2.178132, 1, 1, 1, 1, 1,
0.628309, -0.1099297, 1.22773, 1, 1, 1, 1, 1,
0.6346352, -0.7171382, 0.8151248, 1, 1, 1, 1, 1,
0.6368551, -0.6863996, 3.466086, 1, 1, 1, 1, 1,
0.6375997, -0.6670991, 2.443844, 1, 1, 1, 1, 1,
0.6460367, -0.2098725, 0.6820144, 1, 1, 1, 1, 1,
0.648598, -1.990966, 3.353428, 1, 1, 1, 1, 1,
0.6487722, -1.350657, 2.715265, 0, 0, 1, 1, 1,
0.6540134, 1.612407, -0.3095685, 1, 0, 0, 1, 1,
0.6569784, -1.064005, 3.988877, 1, 0, 0, 1, 1,
0.6570179, -2.619916, 4.611553, 1, 0, 0, 1, 1,
0.6570438, -1.450209, 1.790169, 1, 0, 0, 1, 1,
0.6650837, -0.1063978, 1.782879, 1, 0, 0, 1, 1,
0.6667539, -0.6676977, 1.466628, 0, 0, 0, 1, 1,
0.66964, 0.2619452, 1.065996, 0, 0, 0, 1, 1,
0.6704624, 0.5026418, 1.076011, 0, 0, 0, 1, 1,
0.6769819, -0.01753842, 1.227295, 0, 0, 0, 1, 1,
0.6776388, 1.182322, 0.7075482, 0, 0, 0, 1, 1,
0.6781859, 2.375951, 0.7141567, 0, 0, 0, 1, 1,
0.680792, 1.185457, 2.589993, 0, 0, 0, 1, 1,
0.6827507, -0.8410264, 2.512438, 1, 1, 1, 1, 1,
0.6833848, 1.433827, 1.469398, 1, 1, 1, 1, 1,
0.6856861, 0.019026, 4.478078, 1, 1, 1, 1, 1,
0.6909803, 1.622944, -0.177764, 1, 1, 1, 1, 1,
0.6943949, 0.6081206, -1.016911, 1, 1, 1, 1, 1,
0.6972312, -0.584507, 0.3947534, 1, 1, 1, 1, 1,
0.7019511, 1.450345, -0.4651288, 1, 1, 1, 1, 1,
0.7020342, 0.05186262, 2.335855, 1, 1, 1, 1, 1,
0.7026403, 0.8918742, 0.5489308, 1, 1, 1, 1, 1,
0.7075967, 0.2232403, 0.9177923, 1, 1, 1, 1, 1,
0.7084522, -0.1937684, 2.05604, 1, 1, 1, 1, 1,
0.7147307, -1.419401, 2.993749, 1, 1, 1, 1, 1,
0.7157432, -0.6097223, 2.605709, 1, 1, 1, 1, 1,
0.7166317, -0.1662088, 2.777565, 1, 1, 1, 1, 1,
0.717511, -0.566802, 1.668195, 1, 1, 1, 1, 1,
0.7252989, -0.2265786, 0.441122, 0, 0, 1, 1, 1,
0.7254267, 0.8764297, -1.680644, 1, 0, 0, 1, 1,
0.7283646, -1.360991, 1.344677, 1, 0, 0, 1, 1,
0.7318023, 0.0711743, 0.7484415, 1, 0, 0, 1, 1,
0.7347591, -1.734734, 3.706616, 1, 0, 0, 1, 1,
0.7449783, -0.4760875, 1.631051, 1, 0, 0, 1, 1,
0.7456088, 0.5638708, -0.1193866, 0, 0, 0, 1, 1,
0.7479923, 1.495741, -0.5712693, 0, 0, 0, 1, 1,
0.7547016, 0.3864833, 0.8310984, 0, 0, 0, 1, 1,
0.7550685, -0.5713729, 2.335579, 0, 0, 0, 1, 1,
0.7557185, 0.6670436, -0.4284804, 0, 0, 0, 1, 1,
0.7620406, 0.9128001, 1.512985, 0, 0, 0, 1, 1,
0.7620465, 0.9583526, -0.24355, 0, 0, 0, 1, 1,
0.764409, 0.1836041, 2.013998, 1, 1, 1, 1, 1,
0.7649935, -0.6615861, 2.571207, 1, 1, 1, 1, 1,
0.7675259, -0.3299339, 2.308367, 1, 1, 1, 1, 1,
0.771001, 0.0907501, 0.5546082, 1, 1, 1, 1, 1,
0.7764065, -1.071714, 2.839706, 1, 1, 1, 1, 1,
0.776682, 0.3961785, -0.3394295, 1, 1, 1, 1, 1,
0.7783508, -0.3841161, 3.144286, 1, 1, 1, 1, 1,
0.7784216, 0.06267816, 2.018069, 1, 1, 1, 1, 1,
0.7825067, 0.09268308, 3.159986, 1, 1, 1, 1, 1,
0.7880984, -0.604513, 1.541262, 1, 1, 1, 1, 1,
0.7899417, -1.768723, 2.722296, 1, 1, 1, 1, 1,
0.7907313, 1.393628, 0.450974, 1, 1, 1, 1, 1,
0.7944283, 1.000308, 0.7198142, 1, 1, 1, 1, 1,
0.8064018, -0.2928983, 1.191018, 1, 1, 1, 1, 1,
0.8084845, 0.4099949, 0.3282117, 1, 1, 1, 1, 1,
0.8090099, -1.185693, 2.526745, 0, 0, 1, 1, 1,
0.8109606, -1.140393, 3.359678, 1, 0, 0, 1, 1,
0.8170784, -0.674313, 2.286824, 1, 0, 0, 1, 1,
0.8191919, 0.03526073, 2.615469, 1, 0, 0, 1, 1,
0.8256481, 0.270915, 0.5826868, 1, 0, 0, 1, 1,
0.8293574, -0.8746295, 3.358045, 1, 0, 0, 1, 1,
0.8294969, -0.0776647, 2.854557, 0, 0, 0, 1, 1,
0.8318022, -1.61857, 3.68788, 0, 0, 0, 1, 1,
0.8407124, 2.771018, 2.166953, 0, 0, 0, 1, 1,
0.8431914, -0.3091057, 3.317345, 0, 0, 0, 1, 1,
0.8432252, 1.434899, 1.1227, 0, 0, 0, 1, 1,
0.8438208, -1.633257, 1.587178, 0, 0, 0, 1, 1,
0.8469409, -0.6782815, 2.323689, 0, 0, 0, 1, 1,
0.8488733, -0.4461873, 2.097347, 1, 1, 1, 1, 1,
0.8503815, 1.423032, 1.518773, 1, 1, 1, 1, 1,
0.8526122, 0.8851955, -0.7100216, 1, 1, 1, 1, 1,
0.854257, -1.240926, 1.766075, 1, 1, 1, 1, 1,
0.8558197, 0.8643117, 1.816066, 1, 1, 1, 1, 1,
0.8566632, -0.9589688, 1.850018, 1, 1, 1, 1, 1,
0.8591861, 0.4522534, 1.658842, 1, 1, 1, 1, 1,
0.859346, -1.690609, 4.409715, 1, 1, 1, 1, 1,
0.8622129, 0.5527973, -0.3472156, 1, 1, 1, 1, 1,
0.8673066, -1.990531, 1.683375, 1, 1, 1, 1, 1,
0.8683418, -0.8972559, 1.791381, 1, 1, 1, 1, 1,
0.8722526, 0.3218936, 0.973633, 1, 1, 1, 1, 1,
0.8740892, -0.4344413, 2.053056, 1, 1, 1, 1, 1,
0.8758199, -0.2927204, 1.984185, 1, 1, 1, 1, 1,
0.8806852, -1.181181, 2.472492, 1, 1, 1, 1, 1,
0.8812395, 1.572365, 1.913385, 0, 0, 1, 1, 1,
0.8825976, 0.200435, -0.2982676, 1, 0, 0, 1, 1,
0.884446, -0.2247733, 0.5562171, 1, 0, 0, 1, 1,
0.8849363, 0.8622637, 1.331525, 1, 0, 0, 1, 1,
0.8893721, -1.142282, 2.171503, 1, 0, 0, 1, 1,
0.8898532, -0.5995647, 1.379742, 1, 0, 0, 1, 1,
0.8923663, 1.241458, 0.4279245, 0, 0, 0, 1, 1,
0.897535, -0.5975804, 0.8149188, 0, 0, 0, 1, 1,
0.9047519, -0.2797272, 3.712953, 0, 0, 0, 1, 1,
0.9064533, -0.2928166, 1.004208, 0, 0, 0, 1, 1,
0.9066325, -0.1030284, 2.035367, 0, 0, 0, 1, 1,
0.9078872, 1.072665, 1.166377, 0, 0, 0, 1, 1,
0.9087443, -1.749382, 2.134793, 0, 0, 0, 1, 1,
0.921801, -0.1207897, 0.8933091, 1, 1, 1, 1, 1,
0.9242475, -0.5821358, 2.170576, 1, 1, 1, 1, 1,
0.9297932, 0.7975829, 2.149099, 1, 1, 1, 1, 1,
0.9299644, 1.161547, 0.3300943, 1, 1, 1, 1, 1,
0.9303814, -0.7469251, 0.7283557, 1, 1, 1, 1, 1,
0.9404109, -0.362665, -0.1570997, 1, 1, 1, 1, 1,
0.9404604, 1.311343, -0.2487192, 1, 1, 1, 1, 1,
0.9424194, 1.5501, 0.8899373, 1, 1, 1, 1, 1,
0.9424471, -1.288932, 3.831259, 1, 1, 1, 1, 1,
0.9426361, -1.651673, 2.79208, 1, 1, 1, 1, 1,
0.9445635, -1.130069, 2.584955, 1, 1, 1, 1, 1,
0.9469698, 0.6430034, 2.527267, 1, 1, 1, 1, 1,
0.948546, 0.6947332, 0.4069635, 1, 1, 1, 1, 1,
0.9495176, -0.6639991, 2.296025, 1, 1, 1, 1, 1,
0.9511633, 1.950046, 0.5561613, 1, 1, 1, 1, 1,
0.9512413, -0.5634044, 3.963314, 0, 0, 1, 1, 1,
0.9551759, -0.9837056, 0.269492, 1, 0, 0, 1, 1,
0.9629957, 0.3647903, 1.081632, 1, 0, 0, 1, 1,
0.9673858, -0.1969614, 1.524267, 1, 0, 0, 1, 1,
0.9736158, -1.244745, 1.761756, 1, 0, 0, 1, 1,
0.979464, 0.012512, 1.407066, 1, 0, 0, 1, 1,
0.9814172, -0.2785755, 2.707251, 0, 0, 0, 1, 1,
0.9817396, -0.286327, 0.8172873, 0, 0, 0, 1, 1,
0.9840106, 0.1303681, 0.6553602, 0, 0, 0, 1, 1,
0.9861916, -0.01223735, 2.687528, 0, 0, 0, 1, 1,
0.9896103, 0.2491085, 1.628718, 0, 0, 0, 1, 1,
0.9961512, 1.093785, 1.167708, 0, 0, 0, 1, 1,
0.9997202, 0.05413559, 0.9991172, 0, 0, 0, 1, 1,
1.001534, -0.2760169, 3.41031, 1, 1, 1, 1, 1,
1.009484, 0.9303709, 0.5904011, 1, 1, 1, 1, 1,
1.010685, -1.940375, 3.889928, 1, 1, 1, 1, 1,
1.011963, -0.09806852, 2.748686, 1, 1, 1, 1, 1,
1.014809, 1.340091, 0.7557988, 1, 1, 1, 1, 1,
1.016429, -0.1452687, 2.182772, 1, 1, 1, 1, 1,
1.019516, -0.9833031, 4.087719, 1, 1, 1, 1, 1,
1.024498, 1.794962, 0.5039651, 1, 1, 1, 1, 1,
1.028094, 0.7530673, 1.124745, 1, 1, 1, 1, 1,
1.032063, 0.6016378, 0.04009417, 1, 1, 1, 1, 1,
1.033666, -0.7160227, 3.830746, 1, 1, 1, 1, 1,
1.038395, -1.214541, 3.040636, 1, 1, 1, 1, 1,
1.041587, 1.491209, -1.308985, 1, 1, 1, 1, 1,
1.059747, -0.9981937, 3.949669, 1, 1, 1, 1, 1,
1.060578, -0.6486645, 4.059349, 1, 1, 1, 1, 1,
1.064584, 0.4349216, 0.6121238, 0, 0, 1, 1, 1,
1.066948, -2.033826, 3.36821, 1, 0, 0, 1, 1,
1.082336, 0.1922436, 0.3146952, 1, 0, 0, 1, 1,
1.101274, 1.206195, -1.283032, 1, 0, 0, 1, 1,
1.104984, 0.5005418, -0.7535805, 1, 0, 0, 1, 1,
1.116682, -0.9632793, 2.306914, 1, 0, 0, 1, 1,
1.117524, -1.063159, 2.211288, 0, 0, 0, 1, 1,
1.118794, -0.3689449, 2.693317, 0, 0, 0, 1, 1,
1.123921, 0.1864603, 0.1234305, 0, 0, 0, 1, 1,
1.134984, -0.08676001, 1.93289, 0, 0, 0, 1, 1,
1.13995, 0.05277164, 1.741879, 0, 0, 0, 1, 1,
1.146456, 0.2565153, 1.8461, 0, 0, 0, 1, 1,
1.148167, -1.343231, 1.261349, 0, 0, 0, 1, 1,
1.154641, -0.9344174, 2.228288, 1, 1, 1, 1, 1,
1.157746, -1.451288, 3.251196, 1, 1, 1, 1, 1,
1.166551, -0.5870517, 2.15492, 1, 1, 1, 1, 1,
1.170202, -1.0498, 2.058397, 1, 1, 1, 1, 1,
1.173913, 0.02854912, 0.5452169, 1, 1, 1, 1, 1,
1.173972, -0.9470044, 2.665353, 1, 1, 1, 1, 1,
1.175563, 0.4294609, 1.302728, 1, 1, 1, 1, 1,
1.17615, 0.3899098, 1.310388, 1, 1, 1, 1, 1,
1.177845, 0.2272249, 2.078047, 1, 1, 1, 1, 1,
1.191692, 0.7458129, -1.088387, 1, 1, 1, 1, 1,
1.193923, -0.110751, -0.3053041, 1, 1, 1, 1, 1,
1.194906, -1.184606, 2.076315, 1, 1, 1, 1, 1,
1.200012, -1.992401, 3.003806, 1, 1, 1, 1, 1,
1.201319, 0.4796472, 0.9888845, 1, 1, 1, 1, 1,
1.204789, 0.2841459, 2.324565, 1, 1, 1, 1, 1,
1.206322, -1.338345, 1.016086, 0, 0, 1, 1, 1,
1.208637, 0.1262925, 0.8899677, 1, 0, 0, 1, 1,
1.212003, -0.4655557, 3.678576, 1, 0, 0, 1, 1,
1.212119, -0.09995155, 1.833704, 1, 0, 0, 1, 1,
1.222903, -0.9747537, 1.743881, 1, 0, 0, 1, 1,
1.223527, -2.286615, 1.073023, 1, 0, 0, 1, 1,
1.235523, -0.04349624, 2.206084, 0, 0, 0, 1, 1,
1.23712, -0.7077606, 2.797729, 0, 0, 0, 1, 1,
1.25669, 1.019791, 1.670858, 0, 0, 0, 1, 1,
1.260218, -1.215042, 0.9357869, 0, 0, 0, 1, 1,
1.278103, -1.247268, 2.973395, 0, 0, 0, 1, 1,
1.282128, 0.3733853, 2.93566, 0, 0, 0, 1, 1,
1.288207, 1.271577, 2.493608, 0, 0, 0, 1, 1,
1.292956, -1.821936, 3.472896, 1, 1, 1, 1, 1,
1.29503, -0.02965626, 1.676705, 1, 1, 1, 1, 1,
1.306279, 1.064991, 1.238783, 1, 1, 1, 1, 1,
1.307404, 1.096851, 0.9664018, 1, 1, 1, 1, 1,
1.317423, 0.4454535, 1.432001, 1, 1, 1, 1, 1,
1.319206, 1.025048, 1.427909, 1, 1, 1, 1, 1,
1.347262, -1.480544, 3.356375, 1, 1, 1, 1, 1,
1.350324, -1.413722, 2.957259, 1, 1, 1, 1, 1,
1.360154, 0.3577025, 1.264333, 1, 1, 1, 1, 1,
1.361829, -0.3491592, 1.065873, 1, 1, 1, 1, 1,
1.370308, -0.1925707, 1.302878, 1, 1, 1, 1, 1,
1.374421, 0.374738, 1.706441, 1, 1, 1, 1, 1,
1.384352, -0.5266999, 1.136674, 1, 1, 1, 1, 1,
1.393456, -0.3486929, 1.824129, 1, 1, 1, 1, 1,
1.396524, 0.9909882, 0.25254, 1, 1, 1, 1, 1,
1.402229, 0.0671212, 2.376925, 0, 0, 1, 1, 1,
1.434363, -0.9494284, 3.501768, 1, 0, 0, 1, 1,
1.454443, -0.8234599, 1.36491, 1, 0, 0, 1, 1,
1.465217, -1.016186, 0.1266977, 1, 0, 0, 1, 1,
1.46911, -0.2813311, 0.9657015, 1, 0, 0, 1, 1,
1.470871, -0.06388643, 2.19496, 1, 0, 0, 1, 1,
1.478645, 0.445204, -0.06946515, 0, 0, 0, 1, 1,
1.486841, -0.1740447, 2.102981, 0, 0, 0, 1, 1,
1.502742, -1.558989, 4.655759, 0, 0, 0, 1, 1,
1.514172, 2.155873, 1.20459, 0, 0, 0, 1, 1,
1.517028, 0.2598923, 2.932644, 0, 0, 0, 1, 1,
1.529779, -0.963732, 2.26886, 0, 0, 0, 1, 1,
1.537626, 0.8661302, 0.08932482, 0, 0, 0, 1, 1,
1.541414, -1.078944, 0.1353107, 1, 1, 1, 1, 1,
1.549474, -0.6636876, 3.854303, 1, 1, 1, 1, 1,
1.549874, 1.479683, -0.7443143, 1, 1, 1, 1, 1,
1.560199, 0.1442788, 1.726102, 1, 1, 1, 1, 1,
1.584117, -0.1935909, 0.878992, 1, 1, 1, 1, 1,
1.586467, 0.07076594, 1.053975, 1, 1, 1, 1, 1,
1.603761, 0.8122415, 2.66878, 1, 1, 1, 1, 1,
1.609155, -0.1331658, 1.73976, 1, 1, 1, 1, 1,
1.612673, 0.9461523, 1.611141, 1, 1, 1, 1, 1,
1.616811, -0.2489142, 1.466997, 1, 1, 1, 1, 1,
1.628629, -0.3650662, 1.607813, 1, 1, 1, 1, 1,
1.630262, -0.4595818, 1.906602, 1, 1, 1, 1, 1,
1.645719, 1.011603, 1.189456, 1, 1, 1, 1, 1,
1.65755, -0.2906319, 1.711686, 1, 1, 1, 1, 1,
1.661367, -1.313663, 1.773677, 1, 1, 1, 1, 1,
1.669311, -0.9543393, 2.447514, 0, 0, 1, 1, 1,
1.680731, -0.3810969, 2.62524, 1, 0, 0, 1, 1,
1.688605, -0.5161725, 2.636364, 1, 0, 0, 1, 1,
1.694099, -0.02099789, 0.2957626, 1, 0, 0, 1, 1,
1.711907, -1.351779, 1.606677, 1, 0, 0, 1, 1,
1.718704, 0.9550264, 2.007959, 1, 0, 0, 1, 1,
1.777744, -0.6416421, 1.192438, 0, 0, 0, 1, 1,
1.77934, -1.41902, 1.856016, 0, 0, 0, 1, 1,
1.817532, 0.3954227, 0.5349827, 0, 0, 0, 1, 1,
1.819117, -0.6872538, 1.799126, 0, 0, 0, 1, 1,
1.856944, 0.5732825, 0.1081539, 0, 0, 0, 1, 1,
1.861276, 0.01959252, 2.860288, 0, 0, 0, 1, 1,
1.88264, 0.1428275, -0.5721269, 0, 0, 0, 1, 1,
1.892712, 0.6976653, -0.3334867, 1, 1, 1, 1, 1,
1.907474, -0.08662163, 1.25506, 1, 1, 1, 1, 1,
1.912239, 0.8252745, 2.43, 1, 1, 1, 1, 1,
1.913087, 1.619402, 1.085287, 1, 1, 1, 1, 1,
1.915835, -0.8886067, 4.009587, 1, 1, 1, 1, 1,
1.923863, -0.09040984, 2.27804, 1, 1, 1, 1, 1,
1.926093, -0.3346191, 1.540564, 1, 1, 1, 1, 1,
1.932676, 1.502728, 0.8405461, 1, 1, 1, 1, 1,
1.935445, 0.1552769, 1.720954, 1, 1, 1, 1, 1,
1.976438, 1.668672, 1.861648, 1, 1, 1, 1, 1,
2.002511, -0.4909214, 0.01960566, 1, 1, 1, 1, 1,
2.023591, 0.470412, 1.225834, 1, 1, 1, 1, 1,
2.035456, -0.0535636, 1.373665, 1, 1, 1, 1, 1,
2.074308, 2.055757, 1.640903, 1, 1, 1, 1, 1,
2.109281, -0.538848, 0.9215395, 1, 1, 1, 1, 1,
2.120081, -0.7589139, 1.516877, 0, 0, 1, 1, 1,
2.139713, 0.276441, 2.378083, 1, 0, 0, 1, 1,
2.148714, -0.9096121, 4.123258, 1, 0, 0, 1, 1,
2.161301, -0.5215565, 2.627854, 1, 0, 0, 1, 1,
2.168604, -0.9783824, 3.548731, 1, 0, 0, 1, 1,
2.191103, 0.3792007, 0.5958971, 1, 0, 0, 1, 1,
2.202787, 1.225575, 0.7993348, 0, 0, 0, 1, 1,
2.245811, 0.8123348, 2.094413, 0, 0, 0, 1, 1,
2.280684, 0.3781989, 0.04833301, 0, 0, 0, 1, 1,
2.292778, -0.7717925, 0.06273688, 0, 0, 0, 1, 1,
2.309828, -0.334296, 2.916076, 0, 0, 0, 1, 1,
2.39352, -0.6036221, -1.348839, 0, 0, 0, 1, 1,
2.58131, 0.2256919, 1.472113, 0, 0, 0, 1, 1,
2.592573, 0.2509575, 2.828003, 1, 1, 1, 1, 1,
2.596423, -1.701951, 0.01976226, 1, 1, 1, 1, 1,
2.736458, 0.6710145, 0.1503286, 1, 1, 1, 1, 1,
2.829788, 0.8526647, 0.6865652, 1, 1, 1, 1, 1,
2.836404, 1.228783, 1.326551, 1, 1, 1, 1, 1,
3.218504, -0.6078564, 2.358745, 1, 1, 1, 1, 1,
3.40737, 0.2044313, 0.8418556, 1, 1, 1, 1, 1
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
var radius = 9.403707;
var distance = 33.03012;
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
mvMatrix.translate( 0.03596878, 0.1689836, 0.282223 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.03012);
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
