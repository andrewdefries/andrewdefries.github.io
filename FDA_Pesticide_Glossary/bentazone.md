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
-3.474616, 0.3268626, -3.145675, 1, 0, 0, 1,
-3.269005, -0.7779182, -1.374725, 1, 0.007843138, 0, 1,
-2.731671, -0.1947738, 0.9489447, 1, 0.01176471, 0, 1,
-2.648032, -0.7514264, -1.952287, 1, 0.01960784, 0, 1,
-2.472867, 0.2466198, -1.706593, 1, 0.02352941, 0, 1,
-2.457993, -0.230298, -2.956344, 1, 0.03137255, 0, 1,
-2.451584, 0.6356865, 0.06735481, 1, 0.03529412, 0, 1,
-2.435854, 0.9571205, -1.640827, 1, 0.04313726, 0, 1,
-2.376043, -1.499832, -1.317624, 1, 0.04705882, 0, 1,
-2.324912, 0.8343979, -0.9019352, 1, 0.05490196, 0, 1,
-2.232897, 0.6728143, 0.1760682, 1, 0.05882353, 0, 1,
-2.228967, 1.234166, -0.1566465, 1, 0.06666667, 0, 1,
-2.193805, -0.6601505, -0.6823757, 1, 0.07058824, 0, 1,
-2.150021, 0.03648646, -0.7404734, 1, 0.07843138, 0, 1,
-2.128474, 1.261021, -1.740978, 1, 0.08235294, 0, 1,
-2.114733, -0.8816254, -3.378424, 1, 0.09019608, 0, 1,
-2.106951, -0.6800929, -2.107957, 1, 0.09411765, 0, 1,
-2.101482, 1.359469, -0.1828197, 1, 0.1019608, 0, 1,
-2.083457, -0.6048188, -2.804264, 1, 0.1098039, 0, 1,
-2.055436, 0.2800397, 0.008517616, 1, 0.1137255, 0, 1,
-2.032639, -1.720295, -0.2913095, 1, 0.1215686, 0, 1,
-2.030499, 1.301986, -0.1039815, 1, 0.1254902, 0, 1,
-2.029746, 1.297935, -0.7917429, 1, 0.1333333, 0, 1,
-2.027288, 0.4455575, -1.493139, 1, 0.1372549, 0, 1,
-2.021802, -1.856628, -2.463822, 1, 0.145098, 0, 1,
-2.017194, 1.429785, -2.60613, 1, 0.1490196, 0, 1,
-2.016259, -1.788976, -3.37189, 1, 0.1568628, 0, 1,
-2.014556, 0.7228763, -0.3553105, 1, 0.1607843, 0, 1,
-1.981959, 0.3213409, -0.4924514, 1, 0.1686275, 0, 1,
-1.970706, -0.8000941, -1.47096, 1, 0.172549, 0, 1,
-1.969921, 0.2268121, -0.9244055, 1, 0.1803922, 0, 1,
-1.958871, 0.3735657, -1.582098, 1, 0.1843137, 0, 1,
-1.94086, -0.4016054, -0.6153077, 1, 0.1921569, 0, 1,
-1.932582, -0.5568874, -1.042572, 1, 0.1960784, 0, 1,
-1.914268, 0.4770343, 0.4445542, 1, 0.2039216, 0, 1,
-1.906207, -0.4179028, -1.773587, 1, 0.2117647, 0, 1,
-1.889197, -1.187692, -3.955968, 1, 0.2156863, 0, 1,
-1.867316, 1.437739, -0.6663226, 1, 0.2235294, 0, 1,
-1.862331, -0.1872578, -1.54717, 1, 0.227451, 0, 1,
-1.830169, 0.3760718, -2.44266, 1, 0.2352941, 0, 1,
-1.829741, -1.128972, -2.196305, 1, 0.2392157, 0, 1,
-1.810727, 0.4189345, -1.431148, 1, 0.2470588, 0, 1,
-1.777477, 1.013252, -1.496977, 1, 0.2509804, 0, 1,
-1.774706, 1.446069, -0.4341404, 1, 0.2588235, 0, 1,
-1.750565, -0.1803809, -0.9979787, 1, 0.2627451, 0, 1,
-1.716594, 0.3378279, -2.421998, 1, 0.2705882, 0, 1,
-1.694679, 0.345215, -2.017277, 1, 0.2745098, 0, 1,
-1.688722, -1.359317, -2.93814, 1, 0.282353, 0, 1,
-1.679563, 1.086659, 0.07489883, 1, 0.2862745, 0, 1,
-1.67952, 0.6022781, -1.538242, 1, 0.2941177, 0, 1,
-1.667306, 1.527702, -1.95765, 1, 0.3019608, 0, 1,
-1.651112, 0.5884787, 0.7978733, 1, 0.3058824, 0, 1,
-1.6421, 1.708093, -0.1435348, 1, 0.3137255, 0, 1,
-1.64145, -0.2115927, -2.408674, 1, 0.3176471, 0, 1,
-1.640837, 0.8864516, 0.7222362, 1, 0.3254902, 0, 1,
-1.622018, -0.8833163, -0.7168635, 1, 0.3294118, 0, 1,
-1.621206, 1.025022, 0.880711, 1, 0.3372549, 0, 1,
-1.614449, 0.1615267, -0.882486, 1, 0.3411765, 0, 1,
-1.611505, -0.751986, -0.3074037, 1, 0.3490196, 0, 1,
-1.593948, -1.46389, -1.507227, 1, 0.3529412, 0, 1,
-1.592638, 0.4930001, -1.977634, 1, 0.3607843, 0, 1,
-1.58693, -1.514281, -3.684109, 1, 0.3647059, 0, 1,
-1.583497, -1.263925, -2.822217, 1, 0.372549, 0, 1,
-1.572678, 0.8005461, -1.202846, 1, 0.3764706, 0, 1,
-1.564846, -0.6907589, -0.7509235, 1, 0.3843137, 0, 1,
-1.549319, -1.612446, -1.149564, 1, 0.3882353, 0, 1,
-1.549166, -0.2803924, -1.808824, 1, 0.3960784, 0, 1,
-1.544132, -1.499223, -2.795542, 1, 0.4039216, 0, 1,
-1.540483, 0.9226688, -1.471574, 1, 0.4078431, 0, 1,
-1.536519, -0.3724113, -1.239438, 1, 0.4156863, 0, 1,
-1.521476, 0.2346161, -2.987809, 1, 0.4196078, 0, 1,
-1.518128, 1.061053, -2.592119, 1, 0.427451, 0, 1,
-1.493055, -0.5438961, -2.941589, 1, 0.4313726, 0, 1,
-1.48429, 0.5012563, -2.476829, 1, 0.4392157, 0, 1,
-1.483876, -0.3021231, -2.872725, 1, 0.4431373, 0, 1,
-1.475945, 0.5590652, -1.146852, 1, 0.4509804, 0, 1,
-1.475883, 0.5837556, -2.18015, 1, 0.454902, 0, 1,
-1.470418, -0.5642487, -1.732065, 1, 0.4627451, 0, 1,
-1.469317, 0.06153799, -0.4668226, 1, 0.4666667, 0, 1,
-1.465778, 0.1772076, -1.66917, 1, 0.4745098, 0, 1,
-1.465417, 0.1794613, -0.6248687, 1, 0.4784314, 0, 1,
-1.457312, -1.140715, -0.6055037, 1, 0.4862745, 0, 1,
-1.454935, 1.433702, -2.141213, 1, 0.4901961, 0, 1,
-1.442822, 0.3001485, -2.143754, 1, 0.4980392, 0, 1,
-1.442224, -0.1301302, -2.244031, 1, 0.5058824, 0, 1,
-1.431148, 0.2090166, 0.5739287, 1, 0.509804, 0, 1,
-1.422955, -0.9698393, -3.652209, 1, 0.5176471, 0, 1,
-1.415795, 0.3155677, -0.2190403, 1, 0.5215687, 0, 1,
-1.414223, 0.5199932, -0.5891958, 1, 0.5294118, 0, 1,
-1.402372, 0.1669488, -2.470614, 1, 0.5333334, 0, 1,
-1.400852, -0.7080117, -2.214406, 1, 0.5411765, 0, 1,
-1.400799, 0.3084348, -2.359847, 1, 0.5450981, 0, 1,
-1.392408, 1.277288, -1.873246, 1, 0.5529412, 0, 1,
-1.379614, 0.5854474, -2.687114, 1, 0.5568628, 0, 1,
-1.375969, 0.8753067, -2.821097, 1, 0.5647059, 0, 1,
-1.372373, 0.9973225, -0.01399272, 1, 0.5686275, 0, 1,
-1.35983, -0.91233, -0.3299415, 1, 0.5764706, 0, 1,
-1.358821, -1.980924, -2.172704, 1, 0.5803922, 0, 1,
-1.358294, -0.4986382, -2.903336, 1, 0.5882353, 0, 1,
-1.344332, -1.272931, -2.393429, 1, 0.5921569, 0, 1,
-1.336548, 0.2762581, -2.639355, 1, 0.6, 0, 1,
-1.334086, 0.219617, -0.9207503, 1, 0.6078432, 0, 1,
-1.32894, -0.2443997, -1.643353, 1, 0.6117647, 0, 1,
-1.328233, 1.468254, -0.6056964, 1, 0.6196079, 0, 1,
-1.314506, -0.8153797, -2.63874, 1, 0.6235294, 0, 1,
-1.310594, -0.8441092, -0.6300982, 1, 0.6313726, 0, 1,
-1.301787, -0.1942168, -0.09420168, 1, 0.6352941, 0, 1,
-1.296816, 0.01886004, -2.014283, 1, 0.6431373, 0, 1,
-1.292688, 0.73593, -1.987406, 1, 0.6470588, 0, 1,
-1.292129, 0.1005416, -1.419468, 1, 0.654902, 0, 1,
-1.291459, 0.02698646, -4.316706, 1, 0.6588235, 0, 1,
-1.281682, -1.642533, -1.665411, 1, 0.6666667, 0, 1,
-1.279225, 1.127456, -1.366926, 1, 0.6705883, 0, 1,
-1.276525, -0.4922328, -2.979089, 1, 0.6784314, 0, 1,
-1.271855, 0.1705206, -0.3727382, 1, 0.682353, 0, 1,
-1.259685, -0.4042647, -1.771136, 1, 0.6901961, 0, 1,
-1.258673, -0.6584424, -2.978285, 1, 0.6941177, 0, 1,
-1.249698, -0.4077931, -1.828067, 1, 0.7019608, 0, 1,
-1.248511, -1.083486, -1.274956, 1, 0.7098039, 0, 1,
-1.243331, 0.4030263, -0.2362575, 1, 0.7137255, 0, 1,
-1.236832, -1.024203, -1.727753, 1, 0.7215686, 0, 1,
-1.232816, -1.169888, -2.591164, 1, 0.7254902, 0, 1,
-1.23109, 0.6457173, -0.874532, 1, 0.7333333, 0, 1,
-1.225071, 1.27627, -1.781491, 1, 0.7372549, 0, 1,
-1.223543, 0.5167193, -1.004834, 1, 0.7450981, 0, 1,
-1.219145, -0.5874634, -1.016405, 1, 0.7490196, 0, 1,
-1.217211, -0.1145562, -1.926608, 1, 0.7568628, 0, 1,
-1.213148, -1.148802, -3.546508, 1, 0.7607843, 0, 1,
-1.201455, 1.315483, 0.7643343, 1, 0.7686275, 0, 1,
-1.189842, 0.07429811, -0.912986, 1, 0.772549, 0, 1,
-1.188381, -2.435951, -4.768711, 1, 0.7803922, 0, 1,
-1.18469, -0.7437508, -1.658177, 1, 0.7843137, 0, 1,
-1.184196, -0.1852307, -1.568824, 1, 0.7921569, 0, 1,
-1.173052, -0.7211649, -2.209098, 1, 0.7960784, 0, 1,
-1.165224, -0.02680268, -2.349808, 1, 0.8039216, 0, 1,
-1.162522, 0.05518191, -0.9969633, 1, 0.8117647, 0, 1,
-1.154392, -0.1265557, -0.8695546, 1, 0.8156863, 0, 1,
-1.149325, -1.919104, -3.717608, 1, 0.8235294, 0, 1,
-1.141203, -0.1940283, -0.5556989, 1, 0.827451, 0, 1,
-1.135689, 5.261019e-05, -1.674215, 1, 0.8352941, 0, 1,
-1.131754, -1.671819, -3.706068, 1, 0.8392157, 0, 1,
-1.129119, 0.4926295, -1.629504, 1, 0.8470588, 0, 1,
-1.123503, -0.134878, -2.402965, 1, 0.8509804, 0, 1,
-1.116443, -0.1981151, -1.403878, 1, 0.8588235, 0, 1,
-1.114716, -0.7686296, -1.47098, 1, 0.8627451, 0, 1,
-1.108489, -0.09557518, -2.155808, 1, 0.8705882, 0, 1,
-1.106545, -0.1449297, -3.12389, 1, 0.8745098, 0, 1,
-1.105122, -0.364417, -2.337367, 1, 0.8823529, 0, 1,
-1.102584, 1.37093, -0.1670895, 1, 0.8862745, 0, 1,
-1.093317, 0.2228212, -3.967369, 1, 0.8941177, 0, 1,
-1.07893, -0.5069695, -3.550319, 1, 0.8980392, 0, 1,
-1.07793, -0.4516761, -0.5795857, 1, 0.9058824, 0, 1,
-1.067364, -0.8358554, -0.9400501, 1, 0.9137255, 0, 1,
-1.065516, 0.6939432, -0.345175, 1, 0.9176471, 0, 1,
-1.060077, -0.8629081, -2.552938, 1, 0.9254902, 0, 1,
-1.056456, 0.9678436, 1.384262, 1, 0.9294118, 0, 1,
-1.046943, 1.385209, -0.6470169, 1, 0.9372549, 0, 1,
-1.043157, -0.7116159, -1.717552, 1, 0.9411765, 0, 1,
-1.038687, -0.2509358, -1.358211, 1, 0.9490196, 0, 1,
-1.036605, 0.9205474, -1.678738, 1, 0.9529412, 0, 1,
-1.034528, 0.6105465, -2.565664, 1, 0.9607843, 0, 1,
-1.020279, -0.05287128, -2.089299, 1, 0.9647059, 0, 1,
-1.018394, 0.8877161, 0.007569261, 1, 0.972549, 0, 1,
-1.012106, -1.041803, -0.9488502, 1, 0.9764706, 0, 1,
-1.012075, 0.3801898, -1.12059, 1, 0.9843137, 0, 1,
-1.005693, 0.03010496, -1.982386, 1, 0.9882353, 0, 1,
-1.002216, 0.8625214, -2.174852, 1, 0.9960784, 0, 1,
-0.9877821, -1.63743, -2.757821, 0.9960784, 1, 0, 1,
-0.9855661, -0.9585617, -1.720784, 0.9921569, 1, 0, 1,
-0.9821469, -0.320604, -0.3307237, 0.9843137, 1, 0, 1,
-0.9810354, 0.9826958, -0.62912, 0.9803922, 1, 0, 1,
-0.9791719, -0.8977163, -2.230137, 0.972549, 1, 0, 1,
-0.9699766, 0.07738865, -0.9310911, 0.9686275, 1, 0, 1,
-0.9694448, 0.8026597, -0.2491174, 0.9607843, 1, 0, 1,
-0.9684182, -0.03266548, 0.6812126, 0.9568627, 1, 0, 1,
-0.9676048, -1.207656, -3.112336, 0.9490196, 1, 0, 1,
-0.9585016, 1.931527, -1.099269, 0.945098, 1, 0, 1,
-0.9577202, 1.230647, -0.5962675, 0.9372549, 1, 0, 1,
-0.9443018, 1.646809, -0.7238775, 0.9333333, 1, 0, 1,
-0.942167, -1.390025, -2.292588, 0.9254902, 1, 0, 1,
-0.9366781, 0.7974145, -1.188773, 0.9215686, 1, 0, 1,
-0.9332837, 0.6085557, -1.907688, 0.9137255, 1, 0, 1,
-0.9305934, 0.9424217, -1.201227, 0.9098039, 1, 0, 1,
-0.9305838, -0.09198605, -1.285256, 0.9019608, 1, 0, 1,
-0.9275807, 0.5722467, 0.3360106, 0.8941177, 1, 0, 1,
-0.9257507, -0.642369, -2.404746, 0.8901961, 1, 0, 1,
-0.924615, -0.1259458, -0.6662805, 0.8823529, 1, 0, 1,
-0.9224764, -1.096627, -2.218053, 0.8784314, 1, 0, 1,
-0.9203576, 0.2296333, 0.5524585, 0.8705882, 1, 0, 1,
-0.9146899, -0.8780745, -3.011807, 0.8666667, 1, 0, 1,
-0.9113007, -0.8481547, -1.056195, 0.8588235, 1, 0, 1,
-0.9075789, -0.9722639, -3.331889, 0.854902, 1, 0, 1,
-0.9075617, -0.07850558, -3.271065, 0.8470588, 1, 0, 1,
-0.9041978, 0.682572, -1.052577, 0.8431373, 1, 0, 1,
-0.8966572, -0.7289553, -3.507215, 0.8352941, 1, 0, 1,
-0.8938856, 0.8724883, 1.011649, 0.8313726, 1, 0, 1,
-0.891679, -0.2398192, -2.787516, 0.8235294, 1, 0, 1,
-0.8891038, 0.8395589, -1.355237, 0.8196079, 1, 0, 1,
-0.8862497, 0.2744928, -2.940114, 0.8117647, 1, 0, 1,
-0.8796427, 0.4207973, -2.638553, 0.8078431, 1, 0, 1,
-0.8773466, -1.140988, -3.420758, 0.8, 1, 0, 1,
-0.8745134, 0.8250623, -1.365509, 0.7921569, 1, 0, 1,
-0.8612604, -0.5103232, -1.680857, 0.7882353, 1, 0, 1,
-0.8582518, -0.9889652, -1.878324, 0.7803922, 1, 0, 1,
-0.8578156, 0.3461069, -1.606115, 0.7764706, 1, 0, 1,
-0.8560591, -1.058398, -2.95079, 0.7686275, 1, 0, 1,
-0.8534976, 0.6363918, -2.466124, 0.7647059, 1, 0, 1,
-0.8519295, 0.2077063, -1.372089, 0.7568628, 1, 0, 1,
-0.8504884, -1.366906, -2.035735, 0.7529412, 1, 0, 1,
-0.8473798, -0.4251456, -1.622806, 0.7450981, 1, 0, 1,
-0.8344961, -0.3721171, -1.093325, 0.7411765, 1, 0, 1,
-0.8256102, -0.85815, -1.301739, 0.7333333, 1, 0, 1,
-0.821764, 0.04889832, -0.7009608, 0.7294118, 1, 0, 1,
-0.816399, -0.1165873, -3.036782, 0.7215686, 1, 0, 1,
-0.80896, -0.6846294, -1.621254, 0.7176471, 1, 0, 1,
-0.8025892, 0.03771548, -0.5192578, 0.7098039, 1, 0, 1,
-0.8019705, -1.997871, -3.405368, 0.7058824, 1, 0, 1,
-0.8015264, 1.267491, -1.282778, 0.6980392, 1, 0, 1,
-0.797874, -0.4813254, -0.9022773, 0.6901961, 1, 0, 1,
-0.7934264, 0.2202881, -2.142562, 0.6862745, 1, 0, 1,
-0.7813122, 0.3629784, -0.2520267, 0.6784314, 1, 0, 1,
-0.7810488, -0.5157667, -0.9643361, 0.6745098, 1, 0, 1,
-0.7807762, 0.3949503, -1.418082, 0.6666667, 1, 0, 1,
-0.7803794, -0.9755582, -3.293152, 0.6627451, 1, 0, 1,
-0.7735426, -0.9797627, -1.669687, 0.654902, 1, 0, 1,
-0.7727981, -0.2647501, -1.662431, 0.6509804, 1, 0, 1,
-0.770997, 1.286083, 0.3745255, 0.6431373, 1, 0, 1,
-0.7701908, 0.04059532, -2.048653, 0.6392157, 1, 0, 1,
-0.765331, -1.558232, -1.462912, 0.6313726, 1, 0, 1,
-0.7598115, 1.072194, 0.7810277, 0.627451, 1, 0, 1,
-0.7596404, 0.2033849, -2.828283, 0.6196079, 1, 0, 1,
-0.7577044, -1.032011, -3.730491, 0.6156863, 1, 0, 1,
-0.7572442, -0.3193073, -1.01301, 0.6078432, 1, 0, 1,
-0.7520609, -0.4293492, -1.996634, 0.6039216, 1, 0, 1,
-0.7497159, 0.239477, -2.052505, 0.5960785, 1, 0, 1,
-0.7490332, -0.02103928, -2.170966, 0.5882353, 1, 0, 1,
-0.7481714, 0.05204031, -0.50618, 0.5843138, 1, 0, 1,
-0.7344288, -1.873005, -2.825286, 0.5764706, 1, 0, 1,
-0.7336439, 1.092224, -0.4090191, 0.572549, 1, 0, 1,
-0.7227517, 0.05016167, 0.4901889, 0.5647059, 1, 0, 1,
-0.7224721, 0.09132579, -1.353571, 0.5607843, 1, 0, 1,
-0.7224414, 0.7518278, -1.81678, 0.5529412, 1, 0, 1,
-0.7196224, -0.5729786, -3.259608, 0.5490196, 1, 0, 1,
-0.7190686, -0.4729644, -2.246225, 0.5411765, 1, 0, 1,
-0.7189811, -0.003822555, -2.118623, 0.5372549, 1, 0, 1,
-0.7181011, 0.7794673, -2.555257, 0.5294118, 1, 0, 1,
-0.7160239, -1.988156, -3.846307, 0.5254902, 1, 0, 1,
-0.7152347, 0.8548455, 0.2386904, 0.5176471, 1, 0, 1,
-0.7129359, -0.378424, -3.090693, 0.5137255, 1, 0, 1,
-0.708672, 0.1176084, -3.547353, 0.5058824, 1, 0, 1,
-0.7086161, -0.7696362, -2.444381, 0.5019608, 1, 0, 1,
-0.7071018, 0.7877421, -2.48145, 0.4941176, 1, 0, 1,
-0.7008185, 0.06789185, -1.143639, 0.4862745, 1, 0, 1,
-0.6988754, 0.6654548, -0.1630563, 0.4823529, 1, 0, 1,
-0.6971008, 0.5965416, -1.062396, 0.4745098, 1, 0, 1,
-0.6967404, 0.3241417, -2.564434, 0.4705882, 1, 0, 1,
-0.6927234, 0.6927181, -1.481034, 0.4627451, 1, 0, 1,
-0.689413, 0.3608458, -0.8370027, 0.4588235, 1, 0, 1,
-0.6816334, -0.4064319, -0.835924, 0.4509804, 1, 0, 1,
-0.6795173, 2.175676, -0.03767411, 0.4470588, 1, 0, 1,
-0.6724864, 1.793337, -0.05974621, 0.4392157, 1, 0, 1,
-0.6645077, -0.5756269, -2.790154, 0.4352941, 1, 0, 1,
-0.662641, -0.3690532, -2.581932, 0.427451, 1, 0, 1,
-0.6554554, -0.07235926, -1.311985, 0.4235294, 1, 0, 1,
-0.6487631, -2.177859, -4.340738, 0.4156863, 1, 0, 1,
-0.6483039, 0.8998043, -1.367674, 0.4117647, 1, 0, 1,
-0.638469, -0.2072444, -1.990684, 0.4039216, 1, 0, 1,
-0.6344249, 0.8889649, -1.020503, 0.3960784, 1, 0, 1,
-0.623271, 1.142691, -0.7942209, 0.3921569, 1, 0, 1,
-0.6222367, -0.8582289, -3.085835, 0.3843137, 1, 0, 1,
-0.6204597, 0.1433935, -1.939625, 0.3803922, 1, 0, 1,
-0.6165329, -2.223881, -1.620523, 0.372549, 1, 0, 1,
-0.613128, 0.08170436, -3.570626, 0.3686275, 1, 0, 1,
-0.6112928, 0.9267644, 0.2064458, 0.3607843, 1, 0, 1,
-0.6093323, 0.428001, -2.665282, 0.3568628, 1, 0, 1,
-0.6072509, 2.506249, 0.927287, 0.3490196, 1, 0, 1,
-0.604904, -0.3849165, -0.9778767, 0.345098, 1, 0, 1,
-0.6046898, -0.254202, -2.149022, 0.3372549, 1, 0, 1,
-0.6022222, 1.446211, -0.3466689, 0.3333333, 1, 0, 1,
-0.6018202, 1.225932, -0.1427359, 0.3254902, 1, 0, 1,
-0.5948088, 1.418234, -0.07518742, 0.3215686, 1, 0, 1,
-0.5806288, 0.3366917, -0.1945899, 0.3137255, 1, 0, 1,
-0.5745741, -0.2870748, -2.677359, 0.3098039, 1, 0, 1,
-0.5705836, 0.4661071, -0.4244211, 0.3019608, 1, 0, 1,
-0.5699602, -1.281863, -3.834319, 0.2941177, 1, 0, 1,
-0.5672647, -0.3198983, -1.977271, 0.2901961, 1, 0, 1,
-0.5623137, 2.032887, -0.7478155, 0.282353, 1, 0, 1,
-0.5620505, 0.1003303, 0.08830638, 0.2784314, 1, 0, 1,
-0.5618142, 1.083425, -0.7347699, 0.2705882, 1, 0, 1,
-0.5599489, -0.4992599, -2.580773, 0.2666667, 1, 0, 1,
-0.5586405, 0.4290493, -1.926342, 0.2588235, 1, 0, 1,
-0.5565017, -0.5554101, -2.124413, 0.254902, 1, 0, 1,
-0.5533172, 0.9113387, -0.9755369, 0.2470588, 1, 0, 1,
-0.5527029, -0.4759664, -3.879538, 0.2431373, 1, 0, 1,
-0.546769, 0.8331043, -1.024138, 0.2352941, 1, 0, 1,
-0.5451552, 0.22379, -3.064339, 0.2313726, 1, 0, 1,
-0.5412489, -0.8887419, -2.539171, 0.2235294, 1, 0, 1,
-0.5389621, 1.338706, 0.0198271, 0.2196078, 1, 0, 1,
-0.5342422, 0.2579675, -1.703859, 0.2117647, 1, 0, 1,
-0.5334126, 0.5532736, -1.218622, 0.2078431, 1, 0, 1,
-0.5326172, -0.1590958, -3.102215, 0.2, 1, 0, 1,
-0.5268586, -0.8978326, -3.202754, 0.1921569, 1, 0, 1,
-0.5235826, -0.4982468, 0.08494361, 0.1882353, 1, 0, 1,
-0.515641, 0.9043269, 0.6117356, 0.1803922, 1, 0, 1,
-0.5116787, 1.067611, -0.1323483, 0.1764706, 1, 0, 1,
-0.5076741, -0.6443024, -2.09598, 0.1686275, 1, 0, 1,
-0.5062096, 1.748863, -1.80314, 0.1647059, 1, 0, 1,
-0.5051627, -0.289108, -1.677894, 0.1568628, 1, 0, 1,
-0.4907072, 0.913735, -0.248739, 0.1529412, 1, 0, 1,
-0.4877114, 0.06415317, -2.530444, 0.145098, 1, 0, 1,
-0.4814254, 0.4643694, -2.141167, 0.1411765, 1, 0, 1,
-0.4721863, -0.08588528, -1.616827, 0.1333333, 1, 0, 1,
-0.4719332, -1.774556, -3.901348, 0.1294118, 1, 0, 1,
-0.4699363, 0.8183856, -0.6857226, 0.1215686, 1, 0, 1,
-0.464181, -0.1605934, -3.380675, 0.1176471, 1, 0, 1,
-0.4593672, 0.2595291, -1.253533, 0.1098039, 1, 0, 1,
-0.4565894, -0.4910194, -1.720157, 0.1058824, 1, 0, 1,
-0.4527455, 0.5540709, 0.373456, 0.09803922, 1, 0, 1,
-0.4525757, -2.076997, -3.425628, 0.09019608, 1, 0, 1,
-0.4496786, 0.5145956, -1.061539, 0.08627451, 1, 0, 1,
-0.4477648, 0.4969822, 0.4307888, 0.07843138, 1, 0, 1,
-0.4476994, 0.2873902, -1.788921, 0.07450981, 1, 0, 1,
-0.4476821, 0.9670359, 0.6950907, 0.06666667, 1, 0, 1,
-0.4392671, -1.382358, -3.833504, 0.0627451, 1, 0, 1,
-0.4336504, -0.8377628, -1.782521, 0.05490196, 1, 0, 1,
-0.4314962, -1.105676, -3.478435, 0.05098039, 1, 0, 1,
-0.4270362, -0.3469121, -2.401577, 0.04313726, 1, 0, 1,
-0.417585, -0.8228628, -2.858078, 0.03921569, 1, 0, 1,
-0.4160042, 0.7679093, 0.009144418, 0.03137255, 1, 0, 1,
-0.4151312, -0.5280105, -3.483934, 0.02745098, 1, 0, 1,
-0.4130819, -0.9236558, -3.304946, 0.01960784, 1, 0, 1,
-0.4045583, -1.07393, -1.285188, 0.01568628, 1, 0, 1,
-0.4027888, 0.6517978, -0.1115308, 0.007843138, 1, 0, 1,
-0.4026008, -0.5596441, -3.247912, 0.003921569, 1, 0, 1,
-0.4024975, -0.8852514, -1.026218, 0, 1, 0.003921569, 1,
-0.3999493, 0.4077211, -1.61615, 0, 1, 0.01176471, 1,
-0.399174, 0.1744758, -1.80451, 0, 1, 0.01568628, 1,
-0.3973663, -0.3804564, -2.832255, 0, 1, 0.02352941, 1,
-0.3918528, -1.094149, -3.429573, 0, 1, 0.02745098, 1,
-0.3817317, -1.224163, -3.951552, 0, 1, 0.03529412, 1,
-0.3816083, 0.1129719, -2.8092, 0, 1, 0.03921569, 1,
-0.3799149, 0.03038294, -1.993652, 0, 1, 0.04705882, 1,
-0.3796991, -0.6991459, -2.709152, 0, 1, 0.05098039, 1,
-0.3748631, 0.5838712, -0.9290687, 0, 1, 0.05882353, 1,
-0.3713314, 0.8500403, -0.2407886, 0, 1, 0.0627451, 1,
-0.3701525, -0.7702076, -0.732295, 0, 1, 0.07058824, 1,
-0.3698819, -2.732362, -2.077741, 0, 1, 0.07450981, 1,
-0.3697681, -0.6089771, -2.9174, 0, 1, 0.08235294, 1,
-0.3606445, -0.7172918, -1.875411, 0, 1, 0.08627451, 1,
-0.3594406, 0.1916983, -0.6195731, 0, 1, 0.09411765, 1,
-0.3576513, -1.469757, -1.054758, 0, 1, 0.1019608, 1,
-0.3552505, 0.2006904, -2.058052, 0, 1, 0.1058824, 1,
-0.3537826, 0.5953013, -0.5727745, 0, 1, 0.1137255, 1,
-0.3525724, 0.139894, 0.9703804, 0, 1, 0.1176471, 1,
-0.3523771, 0.120533, -0.8629023, 0, 1, 0.1254902, 1,
-0.349241, -2.581258, -1.25739, 0, 1, 0.1294118, 1,
-0.3447243, 0.9542139, 0.3358835, 0, 1, 0.1372549, 1,
-0.340921, 0.3590727, -1.912622, 0, 1, 0.1411765, 1,
-0.3399348, -1.311953, -0.5727561, 0, 1, 0.1490196, 1,
-0.3391654, -0.519215, -3.860439, 0, 1, 0.1529412, 1,
-0.3370066, 0.522268, -0.7522988, 0, 1, 0.1607843, 1,
-0.3360307, -0.3613592, -2.381305, 0, 1, 0.1647059, 1,
-0.3356557, 0.7253546, -0.7442076, 0, 1, 0.172549, 1,
-0.3335896, 0.9073212, -1.196342, 0, 1, 0.1764706, 1,
-0.3327045, -0.970157, -1.731516, 0, 1, 0.1843137, 1,
-0.3323929, -0.4092372, -2.238538, 0, 1, 0.1882353, 1,
-0.325489, -1.24655, -3.76332, 0, 1, 0.1960784, 1,
-0.3218383, -0.5272418, -0.9285037, 0, 1, 0.2039216, 1,
-0.3208859, 1.972195, -0.3087994, 0, 1, 0.2078431, 1,
-0.3186291, -0.03125405, -0.1619152, 0, 1, 0.2156863, 1,
-0.3172369, 1.292409, 0.2700426, 0, 1, 0.2196078, 1,
-0.3155477, -0.9414345, -2.214837, 0, 1, 0.227451, 1,
-0.3091542, 0.9500124, -1.388207, 0, 1, 0.2313726, 1,
-0.3039138, -0.4559484, 1.037119, 0, 1, 0.2392157, 1,
-0.3026464, 0.01845807, 0.2580098, 0, 1, 0.2431373, 1,
-0.2947926, -0.5813528, -5.693986, 0, 1, 0.2509804, 1,
-0.2882416, -1.057062, -2.126809, 0, 1, 0.254902, 1,
-0.2839899, -0.04321869, -2.858243, 0, 1, 0.2627451, 1,
-0.2834336, 0.4134093, 0.4695559, 0, 1, 0.2666667, 1,
-0.2791887, 0.889298, -0.8506882, 0, 1, 0.2745098, 1,
-0.2763015, 0.2403723, -2.164227, 0, 1, 0.2784314, 1,
-0.2746274, 0.28398, -1.297905, 0, 1, 0.2862745, 1,
-0.2710971, 0.7810845, -1.30384, 0, 1, 0.2901961, 1,
-0.2701367, 0.07554963, -0.7621406, 0, 1, 0.2980392, 1,
-0.2669515, -1.260029, -2.442488, 0, 1, 0.3058824, 1,
-0.2640854, 1.253112, -2.253201, 0, 1, 0.3098039, 1,
-0.2634979, 0.5148485, -0.8246151, 0, 1, 0.3176471, 1,
-0.2623923, -1.282875, -3.744361, 0, 1, 0.3215686, 1,
-0.2621337, -1.046178, -1.967021, 0, 1, 0.3294118, 1,
-0.2610683, -0.03629099, -3.880418, 0, 1, 0.3333333, 1,
-0.258779, 1.629021, 1.062217, 0, 1, 0.3411765, 1,
-0.2572059, -0.5830944, -1.335553, 0, 1, 0.345098, 1,
-0.2569578, 0.6487689, 1.455423, 0, 1, 0.3529412, 1,
-0.2537468, 0.3891005, -0.2503503, 0, 1, 0.3568628, 1,
-0.250407, -0.3827185, -2.270486, 0, 1, 0.3647059, 1,
-0.2396894, 0.1921354, -1.643619, 0, 1, 0.3686275, 1,
-0.232925, 0.2402717, -1.076554, 0, 1, 0.3764706, 1,
-0.2323079, -0.4438282, -4.949194, 0, 1, 0.3803922, 1,
-0.2295457, -0.1576775, -3.142468, 0, 1, 0.3882353, 1,
-0.2274267, 0.3667887, -1.403326, 0, 1, 0.3921569, 1,
-0.2272937, -1.037412, -2.181318, 0, 1, 0.4, 1,
-0.224462, -1.367096, -3.384073, 0, 1, 0.4078431, 1,
-0.2219992, 0.3964985, -2.174891, 0, 1, 0.4117647, 1,
-0.2212608, -0.7884942, -2.659269, 0, 1, 0.4196078, 1,
-0.2207367, 1.569759, -0.1216771, 0, 1, 0.4235294, 1,
-0.2155858, 0.6970416, -0.9915435, 0, 1, 0.4313726, 1,
-0.2135314, -0.2848593, -2.094911, 0, 1, 0.4352941, 1,
-0.213108, -0.6048632, -2.447082, 0, 1, 0.4431373, 1,
-0.2117939, -1.271582, -3.336776, 0, 1, 0.4470588, 1,
-0.2108427, -0.08437242, -1.791626, 0, 1, 0.454902, 1,
-0.2096636, 0.6789148, -0.01880519, 0, 1, 0.4588235, 1,
-0.2031451, -0.1844012, -2.893942, 0, 1, 0.4666667, 1,
-0.1989149, 0.4336371, -1.870437, 0, 1, 0.4705882, 1,
-0.1965518, 0.5826808, -0.1155807, 0, 1, 0.4784314, 1,
-0.1958326, 0.0291036, -0.3450318, 0, 1, 0.4823529, 1,
-0.1940909, 1.96102, 0.1968487, 0, 1, 0.4901961, 1,
-0.1926613, 2.814086, -0.5819227, 0, 1, 0.4941176, 1,
-0.1901286, -0.3039136, -4.359919, 0, 1, 0.5019608, 1,
-0.1864065, 2.246745, -1.348193, 0, 1, 0.509804, 1,
-0.1861511, 0.6063009, -1.312857, 0, 1, 0.5137255, 1,
-0.1839884, 1.10604, 0.1470452, 0, 1, 0.5215687, 1,
-0.1832565, 1.029393, 1.557387, 0, 1, 0.5254902, 1,
-0.1784722, -0.09865049, -2.642958, 0, 1, 0.5333334, 1,
-0.1776964, -0.4696057, -1.724412, 0, 1, 0.5372549, 1,
-0.1741879, 0.9172817, -0.1541285, 0, 1, 0.5450981, 1,
-0.1666612, 0.05673723, -1.246508, 0, 1, 0.5490196, 1,
-0.1578175, -0.2318544, -1.278998, 0, 1, 0.5568628, 1,
-0.1518768, -0.2592688, -2.509252, 0, 1, 0.5607843, 1,
-0.1487336, 0.1805581, -1.104382, 0, 1, 0.5686275, 1,
-0.1480575, 0.2394475, 2.161712, 0, 1, 0.572549, 1,
-0.1469672, 0.2058175, -1.574761, 0, 1, 0.5803922, 1,
-0.1445356, 0.4281128, -0.2541799, 0, 1, 0.5843138, 1,
-0.1443891, -0.2058018, -1.913833, 0, 1, 0.5921569, 1,
-0.1401668, -1.742801, -2.658767, 0, 1, 0.5960785, 1,
-0.1351815, -1.058703, -2.595344, 0, 1, 0.6039216, 1,
-0.1340384, -0.8337778, -3.720883, 0, 1, 0.6117647, 1,
-0.1339439, 1.753746, 0.5300279, 0, 1, 0.6156863, 1,
-0.131399, -0.5324297, -2.320398, 0, 1, 0.6235294, 1,
-0.1294023, 1.234151, 1.718335, 0, 1, 0.627451, 1,
-0.1289169, 0.08354684, 0.03494578, 0, 1, 0.6352941, 1,
-0.1270607, 0.6918303, -0.3720255, 0, 1, 0.6392157, 1,
-0.1246855, 0.1598011, -1.359443, 0, 1, 0.6470588, 1,
-0.1215928, 0.4605021, 0.04387705, 0, 1, 0.6509804, 1,
-0.1193203, -0.6164188, -2.450786, 0, 1, 0.6588235, 1,
-0.1186044, 0.5957941, 0.8637345, 0, 1, 0.6627451, 1,
-0.1146816, 1.235224, 1.601383, 0, 1, 0.6705883, 1,
-0.1121806, 0.9066305, 1.326953, 0, 1, 0.6745098, 1,
-0.1105052, 1.406948, 0.236549, 0, 1, 0.682353, 1,
-0.1093165, 1.581456, 0.7469298, 0, 1, 0.6862745, 1,
-0.10862, 0.01504859, -1.868189, 0, 1, 0.6941177, 1,
-0.1053592, 0.2598795, -0.3692579, 0, 1, 0.7019608, 1,
-0.1015163, 0.8827516, 0.137843, 0, 1, 0.7058824, 1,
-0.09945497, 1.637356, -1.094693, 0, 1, 0.7137255, 1,
-0.0992516, -1.781329, -2.256742, 0, 1, 0.7176471, 1,
-0.09888525, 0.2514783, 1.048475, 0, 1, 0.7254902, 1,
-0.09774635, 0.1334191, -1.585584, 0, 1, 0.7294118, 1,
-0.09707005, -0.1045371, -1.601664, 0, 1, 0.7372549, 1,
-0.09461637, 0.2261719, 0.3521159, 0, 1, 0.7411765, 1,
-0.09447108, -0.3975564, -1.722939, 0, 1, 0.7490196, 1,
-0.09286309, -0.3040333, -2.246398, 0, 1, 0.7529412, 1,
-0.09201171, -1.337282, -4.942519, 0, 1, 0.7607843, 1,
-0.08577003, -0.8289957, -2.131402, 0, 1, 0.7647059, 1,
-0.08458219, -0.9158431, -3.103281, 0, 1, 0.772549, 1,
-0.08355317, 0.6313821, -1.313001, 0, 1, 0.7764706, 1,
-0.08328769, -1.787575, -3.544355, 0, 1, 0.7843137, 1,
-0.08298706, -1.45032, -2.552338, 0, 1, 0.7882353, 1,
-0.07645841, -1.606522, -2.423896, 0, 1, 0.7960784, 1,
-0.07287187, 0.3999269, 0.3176297, 0, 1, 0.8039216, 1,
-0.06722882, 1.618364, 0.2951557, 0, 1, 0.8078431, 1,
-0.06311432, -0.5572171, -3.447833, 0, 1, 0.8156863, 1,
-0.06154485, 0.8645322, 0.2669057, 0, 1, 0.8196079, 1,
-0.05996075, 1.718376, -0.5122296, 0, 1, 0.827451, 1,
-0.05901908, -0.2892221, -2.594005, 0, 1, 0.8313726, 1,
-0.0588703, -0.6146175, -3.119486, 0, 1, 0.8392157, 1,
-0.05823289, -0.09710947, -2.846482, 0, 1, 0.8431373, 1,
-0.05751732, -0.03308934, -2.407965, 0, 1, 0.8509804, 1,
-0.05151211, 0.13701, -1.42289, 0, 1, 0.854902, 1,
-0.05108247, -0.7398716, -1.785383, 0, 1, 0.8627451, 1,
-0.05047499, -1.348621, -3.04373, 0, 1, 0.8666667, 1,
-0.04792758, -0.834138, -3.23332, 0, 1, 0.8745098, 1,
-0.04679985, 0.2273179, 0.2937719, 0, 1, 0.8784314, 1,
-0.04608857, -0.3422271, -2.075559, 0, 1, 0.8862745, 1,
-0.04334255, 1.12071, -0.6496413, 0, 1, 0.8901961, 1,
-0.04301135, -1.015122, -4.521722, 0, 1, 0.8980392, 1,
-0.04132583, -0.6343234, -2.93259, 0, 1, 0.9058824, 1,
-0.03599414, -0.6197835, -2.960523, 0, 1, 0.9098039, 1,
-0.03341641, 0.8539227, 1.251108, 0, 1, 0.9176471, 1,
-0.03201897, 0.8670542, -0.3908969, 0, 1, 0.9215686, 1,
-0.02990677, -0.8429959, -2.459331, 0, 1, 0.9294118, 1,
-0.02936592, 0.3593039, 1.074158, 0, 1, 0.9333333, 1,
-0.02778011, -0.4119651, -4.466932, 0, 1, 0.9411765, 1,
-0.02514513, 0.6279954, 0.008508634, 0, 1, 0.945098, 1,
-0.02448421, 0.2992095, 0.3994528, 0, 1, 0.9529412, 1,
-0.02231632, -0.2983241, -4.143303, 0, 1, 0.9568627, 1,
-0.02213347, 1.126252, 0.3508403, 0, 1, 0.9647059, 1,
-0.02093713, 1.134444, 0.08277815, 0, 1, 0.9686275, 1,
-0.01919057, -0.8420358, -4.916432, 0, 1, 0.9764706, 1,
-0.01629869, 0.4416703, 1.014921, 0, 1, 0.9803922, 1,
-0.01101202, 2.778596, -0.08503678, 0, 1, 0.9882353, 1,
-0.009174964, 0.2846894, 0.5709621, 0, 1, 0.9921569, 1,
-0.009029948, 1.226791, -2.023366, 0, 1, 1, 1,
-0.007329521, 0.7562796, -0.1851139, 0, 0.9921569, 1, 1,
-0.004115382, -0.04537353, -3.722042, 0, 0.9882353, 1, 1,
-0.003899714, 0.3294715, -0.153908, 0, 0.9803922, 1, 1,
-0.002859306, -0.2251273, -2.141691, 0, 0.9764706, 1, 1,
-0.001123775, -0.7602697, -4.437005, 0, 0.9686275, 1, 1,
0.003623359, -0.7920374, 2.981148, 0, 0.9647059, 1, 1,
0.004076555, 0.7827997, 0.8299804, 0, 0.9568627, 1, 1,
0.004292664, -0.734844, 2.699788, 0, 0.9529412, 1, 1,
0.01055487, -1.564555, 2.771521, 0, 0.945098, 1, 1,
0.01874915, 1.057816, -0.9255551, 0, 0.9411765, 1, 1,
0.01982385, -0.9532413, 1.288634, 0, 0.9333333, 1, 1,
0.02475706, -1.587015, 3.865201, 0, 0.9294118, 1, 1,
0.02519472, 0.7631895, -1.224642, 0, 0.9215686, 1, 1,
0.02762049, 1.221325, -2.3003, 0, 0.9176471, 1, 1,
0.03270224, -0.05464508, 3.435863, 0, 0.9098039, 1, 1,
0.03885031, -0.778326, 4.123846, 0, 0.9058824, 1, 1,
0.05018028, -1.174864, 2.448242, 0, 0.8980392, 1, 1,
0.05220092, -2.091529, 3.986135, 0, 0.8901961, 1, 1,
0.05349705, 0.2746629, 0.3834608, 0, 0.8862745, 1, 1,
0.05386162, -2.051087, 3.61978, 0, 0.8784314, 1, 1,
0.05417385, -0.6985008, 3.959281, 0, 0.8745098, 1, 1,
0.05665379, -0.4501026, 2.171865, 0, 0.8666667, 1, 1,
0.06545626, 0.3936836, 1.332875, 0, 0.8627451, 1, 1,
0.06774952, -1.369543, 2.381828, 0, 0.854902, 1, 1,
0.07216438, 0.08333839, 0.5878736, 0, 0.8509804, 1, 1,
0.07522141, -0.2728913, 4.622662, 0, 0.8431373, 1, 1,
0.07711139, -0.5113079, 2.395572, 0, 0.8392157, 1, 1,
0.07712692, -0.2081243, 3.878172, 0, 0.8313726, 1, 1,
0.07919629, -0.2154858, 4.187298, 0, 0.827451, 1, 1,
0.079423, 0.1234225, 1.232875, 0, 0.8196079, 1, 1,
0.08036637, -0.2870193, 2.618801, 0, 0.8156863, 1, 1,
0.08205667, 0.2559071, -0.6725627, 0, 0.8078431, 1, 1,
0.082465, -0.6959397, 2.87918, 0, 0.8039216, 1, 1,
0.08305775, 0.9689338, -0.7647198, 0, 0.7960784, 1, 1,
0.08363461, -0.09566097, 2.290811, 0, 0.7882353, 1, 1,
0.08791481, 0.4756309, 0.6353094, 0, 0.7843137, 1, 1,
0.09170425, -0.902299, 2.740244, 0, 0.7764706, 1, 1,
0.09836859, 0.9008605, -0.649081, 0, 0.772549, 1, 1,
0.09856809, -0.6399732, 3.234366, 0, 0.7647059, 1, 1,
0.1102798, 1.530366, -0.4686674, 0, 0.7607843, 1, 1,
0.1135308, -0.3960569, 3.126135, 0, 0.7529412, 1, 1,
0.1163475, -0.6249313, 1.811206, 0, 0.7490196, 1, 1,
0.118113, 1.268408, 0.4056301, 0, 0.7411765, 1, 1,
0.1207995, -0.859121, 3.632808, 0, 0.7372549, 1, 1,
0.122485, -0.4589344, 2.627244, 0, 0.7294118, 1, 1,
0.12809, 1.233389, 0.8141748, 0, 0.7254902, 1, 1,
0.1312654, 0.4238104, 0.9197769, 0, 0.7176471, 1, 1,
0.1343282, -1.950039, 3.728237, 0, 0.7137255, 1, 1,
0.1419639, 0.2313789, 0.8697876, 0, 0.7058824, 1, 1,
0.1438794, -0.1068101, 3.138131, 0, 0.6980392, 1, 1,
0.1446989, -0.2591599, 2.532512, 0, 0.6941177, 1, 1,
0.1479697, -1.275029, 1.901421, 0, 0.6862745, 1, 1,
0.1486907, 0.2453201, 0.07842762, 0, 0.682353, 1, 1,
0.148762, -0.04707909, 1.996297, 0, 0.6745098, 1, 1,
0.1538257, 0.7616001, 1.213791, 0, 0.6705883, 1, 1,
0.1547682, -0.3805704, 1.42521, 0, 0.6627451, 1, 1,
0.1669006, -0.5121049, 2.212472, 0, 0.6588235, 1, 1,
0.1685587, 1.51808, 2.05718, 0, 0.6509804, 1, 1,
0.1695341, 0.408968, -1.136599, 0, 0.6470588, 1, 1,
0.1725061, 0.3917613, -0.6868114, 0, 0.6392157, 1, 1,
0.1732545, 0.8282835, 1.667693, 0, 0.6352941, 1, 1,
0.1751432, 1.815295, 0.6236065, 0, 0.627451, 1, 1,
0.1752169, -0.1666162, 1.912641, 0, 0.6235294, 1, 1,
0.1754071, -0.641315, 2.202332, 0, 0.6156863, 1, 1,
0.1813318, -1.647756, 3.208494, 0, 0.6117647, 1, 1,
0.1849415, 0.1528719, 1.163494, 0, 0.6039216, 1, 1,
0.1892158, -1.008204, 4.672858, 0, 0.5960785, 1, 1,
0.1908364, -1.569621, 4.31266, 0, 0.5921569, 1, 1,
0.1931538, 0.276739, -1.200691, 0, 0.5843138, 1, 1,
0.1944725, -0.3437758, 3.324504, 0, 0.5803922, 1, 1,
0.1945588, -0.1363746, 2.895574, 0, 0.572549, 1, 1,
0.1986088, -1.395561, 2.755314, 0, 0.5686275, 1, 1,
0.2031068, -0.2358012, 1.426657, 0, 0.5607843, 1, 1,
0.2031891, -1.681355, 4.136829, 0, 0.5568628, 1, 1,
0.2059329, -0.4937518, 3.042105, 0, 0.5490196, 1, 1,
0.2071885, -0.7766026, 2.200293, 0, 0.5450981, 1, 1,
0.2143344, 1.082529, 1.921377, 0, 0.5372549, 1, 1,
0.2150827, 3.040316, 1.296716, 0, 0.5333334, 1, 1,
0.2153661, 0.3758831, -0.1442464, 0, 0.5254902, 1, 1,
0.2223036, 0.1279438, 1.683703, 0, 0.5215687, 1, 1,
0.2242686, 0.533451, 2.206689, 0, 0.5137255, 1, 1,
0.2284188, -0.4512836, 0.9267687, 0, 0.509804, 1, 1,
0.2342572, 0.392899, -1.750951, 0, 0.5019608, 1, 1,
0.2364049, 0.03903812, 0.5264475, 0, 0.4941176, 1, 1,
0.2386149, 0.5326798, -0.03696192, 0, 0.4901961, 1, 1,
0.2398921, -1.130723, 1.848293, 0, 0.4823529, 1, 1,
0.2434672, -0.7187795, 3.451732, 0, 0.4784314, 1, 1,
0.2581536, 0.9250602, 0.6329829, 0, 0.4705882, 1, 1,
0.2598548, 0.2974712, 1.582149, 0, 0.4666667, 1, 1,
0.2617531, -1.289744, 3.92771, 0, 0.4588235, 1, 1,
0.2672235, -0.2072146, 2.242485, 0, 0.454902, 1, 1,
0.271145, 1.16269, -0.7143494, 0, 0.4470588, 1, 1,
0.2723075, -0.1267268, 1.860547, 0, 0.4431373, 1, 1,
0.276063, -0.2830645, 1.560104, 0, 0.4352941, 1, 1,
0.2781599, -0.08438027, 2.139361, 0, 0.4313726, 1, 1,
0.279125, 0.4892789, 0.6968984, 0, 0.4235294, 1, 1,
0.2791899, -0.5747094, 3.071422, 0, 0.4196078, 1, 1,
0.2823649, -0.7226524, 3.773442, 0, 0.4117647, 1, 1,
0.2877319, 2.538033, -0.32875, 0, 0.4078431, 1, 1,
0.2896528, 0.218845, 1.693704, 0, 0.4, 1, 1,
0.2907149, 0.3241641, 0.3167293, 0, 0.3921569, 1, 1,
0.2960443, 0.8358327, -0.6047973, 0, 0.3882353, 1, 1,
0.2974947, -0.9127308, 3.818817, 0, 0.3803922, 1, 1,
0.2977584, -1.606794, 1.206384, 0, 0.3764706, 1, 1,
0.2989528, -3.003567, 1.978434, 0, 0.3686275, 1, 1,
0.2990369, 0.5163454, -1.01099, 0, 0.3647059, 1, 1,
0.2993033, -0.9464183, 4.253136, 0, 0.3568628, 1, 1,
0.301651, 0.1423353, -0.5462411, 0, 0.3529412, 1, 1,
0.3029892, -0.3152404, 1.72688, 0, 0.345098, 1, 1,
0.3049514, 0.05957751, 1.098932, 0, 0.3411765, 1, 1,
0.3056155, -1.256999, 3.18349, 0, 0.3333333, 1, 1,
0.3063644, -1.170572, 2.532247, 0, 0.3294118, 1, 1,
0.3103613, 0.3877237, 0.9402342, 0, 0.3215686, 1, 1,
0.312367, -0.07168156, 3.787341, 0, 0.3176471, 1, 1,
0.3147309, 2.297601, -1.125154, 0, 0.3098039, 1, 1,
0.3178102, 0.7935373, -1.585777, 0, 0.3058824, 1, 1,
0.3218755, -0.03805216, 1.160125, 0, 0.2980392, 1, 1,
0.3221838, -1.102628, 1.659496, 0, 0.2901961, 1, 1,
0.3281885, -0.4858289, 3.897434, 0, 0.2862745, 1, 1,
0.3289877, 1.318161, -0.1491514, 0, 0.2784314, 1, 1,
0.331841, -0.00560618, 0.03530638, 0, 0.2745098, 1, 1,
0.333704, 0.2266576, 1.576082, 0, 0.2666667, 1, 1,
0.3416153, -0.9117334, 1.917636, 0, 0.2627451, 1, 1,
0.3420317, -0.8108889, 3.82191, 0, 0.254902, 1, 1,
0.3449432, -1.531565, 3.611747, 0, 0.2509804, 1, 1,
0.3459402, -1.21576, 2.789434, 0, 0.2431373, 1, 1,
0.3544277, 0.6802279, 0.9235732, 0, 0.2392157, 1, 1,
0.3552321, -2.439302, 1.614488, 0, 0.2313726, 1, 1,
0.3574161, -1.254046, 2.733901, 0, 0.227451, 1, 1,
0.3601529, -0.1845675, 2.59362, 0, 0.2196078, 1, 1,
0.3604275, 0.007201595, 0.659034, 0, 0.2156863, 1, 1,
0.3629144, 0.2832677, -0.3011295, 0, 0.2078431, 1, 1,
0.3649336, -0.1504492, 2.185114, 0, 0.2039216, 1, 1,
0.3666106, -1.336508, 2.342425, 0, 0.1960784, 1, 1,
0.3691436, 1.73091, -0.8721094, 0, 0.1882353, 1, 1,
0.3699113, -0.4991435, 2.291484, 0, 0.1843137, 1, 1,
0.3709196, -0.1418496, 2.950063, 0, 0.1764706, 1, 1,
0.3713901, -0.9452426, 1.989929, 0, 0.172549, 1, 1,
0.3718139, -1.133377, 3.681323, 0, 0.1647059, 1, 1,
0.3720213, -0.6889057, 2.449081, 0, 0.1607843, 1, 1,
0.3736064, 0.4753012, 0.0406298, 0, 0.1529412, 1, 1,
0.3740297, -0.08917789, 2.57265, 0, 0.1490196, 1, 1,
0.3769046, 1.673189, -0.5030513, 0, 0.1411765, 1, 1,
0.3781096, -0.2504008, 2.376133, 0, 0.1372549, 1, 1,
0.380971, -1.13261, 2.549864, 0, 0.1294118, 1, 1,
0.3835013, -0.5010336, 3.059226, 0, 0.1254902, 1, 1,
0.3841541, 0.03592756, 2.727508, 0, 0.1176471, 1, 1,
0.3845936, -0.3396247, 3.059079, 0, 0.1137255, 1, 1,
0.3851345, -1.27985, 1.545444, 0, 0.1058824, 1, 1,
0.3866993, 0.4995535, 1.147871, 0, 0.09803922, 1, 1,
0.3889122, -0.2082832, 1.781207, 0, 0.09411765, 1, 1,
0.3940884, -0.8328906, 1.854996, 0, 0.08627451, 1, 1,
0.3969515, -0.9156709, 3.280025, 0, 0.08235294, 1, 1,
0.4027416, 0.7249086, 1.821608, 0, 0.07450981, 1, 1,
0.4028104, -0.2094778, 2.656276, 0, 0.07058824, 1, 1,
0.4030713, 0.07120842, 3.280756, 0, 0.0627451, 1, 1,
0.4078994, 0.2899718, 0.1543744, 0, 0.05882353, 1, 1,
0.4090536, 0.7804981, -0.3597546, 0, 0.05098039, 1, 1,
0.4127121, 1.202933, 1.146265, 0, 0.04705882, 1, 1,
0.4132611, -0.07253239, 1.766171, 0, 0.03921569, 1, 1,
0.4142622, -0.7104401, 2.326178, 0, 0.03529412, 1, 1,
0.4189081, 0.8004791, 1.12137, 0, 0.02745098, 1, 1,
0.4200994, 0.4582112, -0.2596675, 0, 0.02352941, 1, 1,
0.4244643, -0.4144509, 2.212153, 0, 0.01568628, 1, 1,
0.4282863, -0.3224857, -0.5211405, 0, 0.01176471, 1, 1,
0.4290435, -0.0890075, 1.475103, 0, 0.003921569, 1, 1,
0.4361396, 0.4187621, 2.01164, 0.003921569, 0, 1, 1,
0.4364944, -0.02515477, 1.072669, 0.007843138, 0, 1, 1,
0.4373087, 1.517215, -0.2952779, 0.01568628, 0, 1, 1,
0.4390004, -0.3207252, 0.8511342, 0.01960784, 0, 1, 1,
0.4391406, -0.6487755, 4.220697, 0.02745098, 0, 1, 1,
0.4399803, -0.3621504, 2.625447, 0.03137255, 0, 1, 1,
0.4449171, 0.3117736, 0.8234379, 0.03921569, 0, 1, 1,
0.44539, -0.449246, 1.581159, 0.04313726, 0, 1, 1,
0.4512996, 1.526613, -0.666302, 0.05098039, 0, 1, 1,
0.4540309, 1.091015, 1.526234, 0.05490196, 0, 1, 1,
0.4546129, -0.9941226, 2.565302, 0.0627451, 0, 1, 1,
0.4566684, -2.637271, 3.206351, 0.06666667, 0, 1, 1,
0.4582085, 0.334267, -0.1458663, 0.07450981, 0, 1, 1,
0.4585134, -0.9418628, 2.72417, 0.07843138, 0, 1, 1,
0.4592013, 0.1711448, 1.925647, 0.08627451, 0, 1, 1,
0.4600324, 2.334023, 1.84362, 0.09019608, 0, 1, 1,
0.4620449, 0.7827729, 0.5268717, 0.09803922, 0, 1, 1,
0.462351, 0.4434228, 0.2406726, 0.1058824, 0, 1, 1,
0.4624009, 0.3290907, 1.854423, 0.1098039, 0, 1, 1,
0.4638596, -0.2314128, 2.800903, 0.1176471, 0, 1, 1,
0.4677186, -0.4781793, 1.081954, 0.1215686, 0, 1, 1,
0.470507, 0.3621749, 0.7073393, 0.1294118, 0, 1, 1,
0.4706624, 0.4364205, -0.6823428, 0.1333333, 0, 1, 1,
0.473694, -0.2432213, 2.152138, 0.1411765, 0, 1, 1,
0.482627, 1.265267, 0.6993285, 0.145098, 0, 1, 1,
0.4833286, -0.3841581, 2.637446, 0.1529412, 0, 1, 1,
0.4847572, -0.7186375, 2.235465, 0.1568628, 0, 1, 1,
0.485854, 0.9494103, 0.7976279, 0.1647059, 0, 1, 1,
0.4864254, 0.50893, 0.2431977, 0.1686275, 0, 1, 1,
0.4865153, -0.3373617, 2.546686, 0.1764706, 0, 1, 1,
0.4881398, -0.1849341, 4.10751, 0.1803922, 0, 1, 1,
0.4899807, -0.02801617, 1.801708, 0.1882353, 0, 1, 1,
0.4976955, -1.637885, 4.258986, 0.1921569, 0, 1, 1,
0.4980789, 1.956753, -0.5405558, 0.2, 0, 1, 1,
0.4981452, -0.6829805, 3.480765, 0.2078431, 0, 1, 1,
0.4991329, 0.1972691, 1.003069, 0.2117647, 0, 1, 1,
0.5038825, -0.7638991, 2.099547, 0.2196078, 0, 1, 1,
0.5056533, 1.287902, -0.213878, 0.2235294, 0, 1, 1,
0.5100075, -1.254248, 3.292038, 0.2313726, 0, 1, 1,
0.5117803, -0.2208105, 2.105697, 0.2352941, 0, 1, 1,
0.5244887, 1.772043, 0.6555273, 0.2431373, 0, 1, 1,
0.5305898, 1.232488, 0.8890594, 0.2470588, 0, 1, 1,
0.5350074, 0.208842, 2.707895, 0.254902, 0, 1, 1,
0.5352623, 0.7996246, 0.1157836, 0.2588235, 0, 1, 1,
0.5385961, 0.5414956, -0.5957367, 0.2666667, 0, 1, 1,
0.5406114, -0.6299377, 3.602684, 0.2705882, 0, 1, 1,
0.5512183, -0.7673002, 2.140792, 0.2784314, 0, 1, 1,
0.5514473, 0.03565912, 2.61121, 0.282353, 0, 1, 1,
0.5519275, 0.5000078, 2.021389, 0.2901961, 0, 1, 1,
0.5537442, -1.670946, 3.735079, 0.2941177, 0, 1, 1,
0.554882, -2.027751, 1.867057, 0.3019608, 0, 1, 1,
0.5553589, 0.6371223, 3.833261, 0.3098039, 0, 1, 1,
0.5555917, -0.3937561, 3.645984, 0.3137255, 0, 1, 1,
0.5584685, -0.4483273, 1.53366, 0.3215686, 0, 1, 1,
0.5601563, 0.1922117, 1.738734, 0.3254902, 0, 1, 1,
0.5603679, 1.389543, -0.7308715, 0.3333333, 0, 1, 1,
0.5623561, 0.9079947, 0.1676226, 0.3372549, 0, 1, 1,
0.5631067, 0.4497703, 1.097768, 0.345098, 0, 1, 1,
0.5634183, 0.4640352, 0.7820502, 0.3490196, 0, 1, 1,
0.5634485, -0.2685631, 1.769094, 0.3568628, 0, 1, 1,
0.5662893, 0.1535124, 0.2076745, 0.3607843, 0, 1, 1,
0.569625, -1.042275, 3.393263, 0.3686275, 0, 1, 1,
0.5717368, 0.8693445, 0.9530508, 0.372549, 0, 1, 1,
0.5729448, 0.08449079, -0.0271504, 0.3803922, 0, 1, 1,
0.5767424, -0.7927506, 1.397902, 0.3843137, 0, 1, 1,
0.5773152, -1.487485, 4.234372, 0.3921569, 0, 1, 1,
0.5831367, -0.2932045, 0.3930646, 0.3960784, 0, 1, 1,
0.5873649, -0.5255951, 2.601006, 0.4039216, 0, 1, 1,
0.5890941, -0.4062111, 2.790802, 0.4117647, 0, 1, 1,
0.5950715, -0.3014721, 0.7145603, 0.4156863, 0, 1, 1,
0.5992811, -0.4246145, 1.757385, 0.4235294, 0, 1, 1,
0.6034307, -0.0938651, 1.547516, 0.427451, 0, 1, 1,
0.603826, 0.3025107, -0.1605176, 0.4352941, 0, 1, 1,
0.6050059, 0.5542564, 2.188161, 0.4392157, 0, 1, 1,
0.6107867, 0.1447509, -0.3133548, 0.4470588, 0, 1, 1,
0.6149381, 0.4314786, -0.2974869, 0.4509804, 0, 1, 1,
0.6172793, 0.7247517, 0.7809474, 0.4588235, 0, 1, 1,
0.6206448, -1.53236, 1.022682, 0.4627451, 0, 1, 1,
0.62572, 0.8329453, 0.2712772, 0.4705882, 0, 1, 1,
0.6266876, -1.018938, 2.270645, 0.4745098, 0, 1, 1,
0.6281121, 1.152217, 0.1383513, 0.4823529, 0, 1, 1,
0.6315177, 1.653185, 1.379994, 0.4862745, 0, 1, 1,
0.6336368, -0.7402761, 1.89111, 0.4941176, 0, 1, 1,
0.6341326, 1.033972, -0.6991596, 0.5019608, 0, 1, 1,
0.6388534, -0.187457, 0.809974, 0.5058824, 0, 1, 1,
0.6395745, 0.6188763, 1.719495, 0.5137255, 0, 1, 1,
0.6420212, 0.1057937, 1.775003, 0.5176471, 0, 1, 1,
0.6431451, -0.644086, 2.110467, 0.5254902, 0, 1, 1,
0.6452279, -0.4689713, 4.329264, 0.5294118, 0, 1, 1,
0.6592394, -0.3356112, 2.868871, 0.5372549, 0, 1, 1,
0.6627838, 0.01316423, 1.733544, 0.5411765, 0, 1, 1,
0.6689166, 0.8643379, 0.6255904, 0.5490196, 0, 1, 1,
0.6785501, 0.2564915, 1.691525, 0.5529412, 0, 1, 1,
0.6788182, -1.123018, 1.947492, 0.5607843, 0, 1, 1,
0.6813631, 1.30322, -0.1318299, 0.5647059, 0, 1, 1,
0.6823233, 0.07879683, 1.611055, 0.572549, 0, 1, 1,
0.6830431, -0.05016368, 1.673314, 0.5764706, 0, 1, 1,
0.6832042, -0.2291926, 1.900627, 0.5843138, 0, 1, 1,
0.690784, -0.8530464, 3.81081, 0.5882353, 0, 1, 1,
0.6914298, -0.1234142, 1.391743, 0.5960785, 0, 1, 1,
0.6959794, -0.2593708, 2.040092, 0.6039216, 0, 1, 1,
0.696386, -0.04861439, 0.5833887, 0.6078432, 0, 1, 1,
0.6985599, -1.486556, 1.780982, 0.6156863, 0, 1, 1,
0.6992794, -1.677523, 2.420643, 0.6196079, 0, 1, 1,
0.7019585, 1.662087, 2.320893, 0.627451, 0, 1, 1,
0.7027457, 0.4628308, 0.6512889, 0.6313726, 0, 1, 1,
0.7058388, 0.03113043, 1.132378, 0.6392157, 0, 1, 1,
0.7086548, -0.5926692, 3.19122, 0.6431373, 0, 1, 1,
0.7142284, 0.03158561, 0.3351101, 0.6509804, 0, 1, 1,
0.718994, -1.506847, 2.351746, 0.654902, 0, 1, 1,
0.7198832, 1.867929, 1.714748, 0.6627451, 0, 1, 1,
0.7238291, -0.5712878, 0.7619072, 0.6666667, 0, 1, 1,
0.731486, 1.110249, 1.805295, 0.6745098, 0, 1, 1,
0.7325673, 0.5099326, 0.4995852, 0.6784314, 0, 1, 1,
0.7403868, 1.208087, 0.003771302, 0.6862745, 0, 1, 1,
0.7444797, -0.7208868, 2.076756, 0.6901961, 0, 1, 1,
0.7513503, 0.1735536, 3.599859, 0.6980392, 0, 1, 1,
0.7545103, -1.367776, 1.52253, 0.7058824, 0, 1, 1,
0.7587054, 0.1715196, 0.8815491, 0.7098039, 0, 1, 1,
0.7604139, 0.8280555, 0.6359414, 0.7176471, 0, 1, 1,
0.7734331, -0.8639375, 1.853698, 0.7215686, 0, 1, 1,
0.7773644, 0.5395319, 0.2195507, 0.7294118, 0, 1, 1,
0.7785594, -1.591396, 3.438356, 0.7333333, 0, 1, 1,
0.7796133, 1.22661, 2.10429, 0.7411765, 0, 1, 1,
0.7814397, -0.4932529, 2.802512, 0.7450981, 0, 1, 1,
0.788733, -0.8112962, 1.625648, 0.7529412, 0, 1, 1,
0.7888693, 0.4174018, 0.9544831, 0.7568628, 0, 1, 1,
0.7901693, -1.5731, 1.657704, 0.7647059, 0, 1, 1,
0.7901694, 0.07692268, 2.198644, 0.7686275, 0, 1, 1,
0.7966253, 0.07557701, 1.721573, 0.7764706, 0, 1, 1,
0.7983965, -0.3953997, 0.5771843, 0.7803922, 0, 1, 1,
0.7984694, -1.174084, 2.291823, 0.7882353, 0, 1, 1,
0.8033273, 0.002568683, 3.278466, 0.7921569, 0, 1, 1,
0.8038617, -0.9431981, 3.048575, 0.8, 0, 1, 1,
0.8050923, -1.721639, 3.476316, 0.8078431, 0, 1, 1,
0.8091553, -0.1018504, 1.397322, 0.8117647, 0, 1, 1,
0.8098498, 0.79876, 2.175348, 0.8196079, 0, 1, 1,
0.8131519, 1.155393, 1.319278, 0.8235294, 0, 1, 1,
0.8162749, 0.8704338, 0.1150465, 0.8313726, 0, 1, 1,
0.8163904, -0.8153607, 2.258679, 0.8352941, 0, 1, 1,
0.8191309, 1.707116, 0.2610509, 0.8431373, 0, 1, 1,
0.8202723, 0.5199085, -0.06016839, 0.8470588, 0, 1, 1,
0.8215256, 1.618822, 0.2164412, 0.854902, 0, 1, 1,
0.8216056, 0.4973717, 1.435663, 0.8588235, 0, 1, 1,
0.8222449, -0.5982223, 1.718311, 0.8666667, 0, 1, 1,
0.8226073, 0.342809, -0.1412329, 0.8705882, 0, 1, 1,
0.825289, 0.6658282, 1.803812, 0.8784314, 0, 1, 1,
0.8400078, -1.13664, 2.366819, 0.8823529, 0, 1, 1,
0.8443074, 1.210206, -0.5201688, 0.8901961, 0, 1, 1,
0.8627188, -0.5284235, 1.921722, 0.8941177, 0, 1, 1,
0.8641215, -1.659024, 1.323349, 0.9019608, 0, 1, 1,
0.8659755, 1.150716, 0.8029491, 0.9098039, 0, 1, 1,
0.8662623, 0.3340813, -0.08941164, 0.9137255, 0, 1, 1,
0.8711295, -0.7866282, 1.462705, 0.9215686, 0, 1, 1,
0.8788401, -0.8753406, 0.8273543, 0.9254902, 0, 1, 1,
0.8809409, -0.5023187, 3.575163, 0.9333333, 0, 1, 1,
0.8816699, -0.07825141, 0.9712344, 0.9372549, 0, 1, 1,
0.8820403, -0.6445472, 2.650292, 0.945098, 0, 1, 1,
0.8871316, -1.269944, 3.152511, 0.9490196, 0, 1, 1,
0.89555, -0.5966269, 3.777412, 0.9568627, 0, 1, 1,
0.9027032, -0.2094068, 1.517428, 0.9607843, 0, 1, 1,
0.9033499, -1.388581, 2.75652, 0.9686275, 0, 1, 1,
0.9060641, -1.56842, 2.293321, 0.972549, 0, 1, 1,
0.9074957, 0.9308141, 0.6297848, 0.9803922, 0, 1, 1,
0.9154807, -0.2034786, 2.574607, 0.9843137, 0, 1, 1,
0.9172365, -0.3481282, 1.88513, 0.9921569, 0, 1, 1,
0.9235344, -0.7885907, 0.7486232, 0.9960784, 0, 1, 1,
0.925593, -0.6695608, 1.947071, 1, 0, 0.9960784, 1,
0.9285436, 1.096678, -1.000621, 1, 0, 0.9882353, 1,
0.9346557, 1.609972, 0.7601157, 1, 0, 0.9843137, 1,
0.93573, -0.577768, 1.481039, 1, 0, 0.9764706, 1,
0.9471533, -0.7844715, 2.120891, 1, 0, 0.972549, 1,
0.9511355, 0.5196301, 1.891535, 1, 0, 0.9647059, 1,
0.9627184, 0.9140068, 0.2346689, 1, 0, 0.9607843, 1,
0.9652371, 1.010325, 0.695907, 1, 0, 0.9529412, 1,
0.9670177, 0.8201845, 0.5948369, 1, 0, 0.9490196, 1,
0.9727446, 0.6998025, 1.478353, 1, 0, 0.9411765, 1,
0.9734207, -0.2659837, 1.328098, 1, 0, 0.9372549, 1,
0.9874349, -0.3170027, 1.667286, 1, 0, 0.9294118, 1,
0.9874905, 3.149864, 0.7115579, 1, 0, 0.9254902, 1,
1.001768, -0.5154731, 2.260263, 1, 0, 0.9176471, 1,
1.004231, 1.024042, 0.4001301, 1, 0, 0.9137255, 1,
1.008244, -1.353803, 3.635197, 1, 0, 0.9058824, 1,
1.024266, -1.196701, 2.399097, 1, 0, 0.9019608, 1,
1.026768, 0.3891752, -0.6854586, 1, 0, 0.8941177, 1,
1.027059, -0.3049555, 3.275237, 1, 0, 0.8862745, 1,
1.02982, -0.2807787, 1.897177, 1, 0, 0.8823529, 1,
1.035509, 0.7364032, 0.5550261, 1, 0, 0.8745098, 1,
1.038292, -0.2657954, 2.078928, 1, 0, 0.8705882, 1,
1.053161, -1.110047, 2.85308, 1, 0, 0.8627451, 1,
1.053333, 2.000456, -0.7685004, 1, 0, 0.8588235, 1,
1.053759, 1.304546, 0.9948039, 1, 0, 0.8509804, 1,
1.058701, 0.4023254, 0.9882465, 1, 0, 0.8470588, 1,
1.058748, -0.3989537, 2.634061, 1, 0, 0.8392157, 1,
1.06141, -0.4319853, 2.07075, 1, 0, 0.8352941, 1,
1.068637, -0.4161419, 1.065924, 1, 0, 0.827451, 1,
1.075741, -0.6779584, 2.209424, 1, 0, 0.8235294, 1,
1.089285, 0.8296577, -0.6662384, 1, 0, 0.8156863, 1,
1.092098, 0.153589, -0.1818715, 1, 0, 0.8117647, 1,
1.097301, 0.7470432, 0.7668755, 1, 0, 0.8039216, 1,
1.103583, 1.125431, -0.8771725, 1, 0, 0.7960784, 1,
1.111002, -1.545811, 2.111365, 1, 0, 0.7921569, 1,
1.111053, 0.006413633, 1.738767, 1, 0, 0.7843137, 1,
1.122671, -1.487433, 4.423268, 1, 0, 0.7803922, 1,
1.123975, 0.2426128, 0.522813, 1, 0, 0.772549, 1,
1.125275, 1.42603, 2.226595, 1, 0, 0.7686275, 1,
1.132226, 0.3303575, 0.7370691, 1, 0, 0.7607843, 1,
1.139322, 0.5282258, 2.891402, 1, 0, 0.7568628, 1,
1.140579, -2.103768, 0.6737908, 1, 0, 0.7490196, 1,
1.141352, -1.48008, 3.202072, 1, 0, 0.7450981, 1,
1.142485, -0.1040313, 1.411547, 1, 0, 0.7372549, 1,
1.144301, 1.873805, -0.5639232, 1, 0, 0.7333333, 1,
1.144803, 0.09215691, 0.7365135, 1, 0, 0.7254902, 1,
1.155001, -0.0735206, 2.870895, 1, 0, 0.7215686, 1,
1.160455, 1.752093, 0.8532628, 1, 0, 0.7137255, 1,
1.166158, -1.017212, 0.9963449, 1, 0, 0.7098039, 1,
1.170302, -0.9619233, 3.374581, 1, 0, 0.7019608, 1,
1.179141, 0.3527779, 0.7202263, 1, 0, 0.6941177, 1,
1.184117, 2.473906, 0.4251177, 1, 0, 0.6901961, 1,
1.195582, 1.983911, -0.6575723, 1, 0, 0.682353, 1,
1.214921, 1.169578, 1.613426, 1, 0, 0.6784314, 1,
1.215019, -0.1574378, 0.7671356, 1, 0, 0.6705883, 1,
1.223509, -0.2836148, 3.607906, 1, 0, 0.6666667, 1,
1.224053, 0.4329619, 1.412344, 1, 0, 0.6588235, 1,
1.22477, -1.61325, 1.435747, 1, 0, 0.654902, 1,
1.231828, -0.8405003, 1.869108, 1, 0, 0.6470588, 1,
1.240192, -0.04819556, 3.379155, 1, 0, 0.6431373, 1,
1.240579, -0.3969104, 0.6093346, 1, 0, 0.6352941, 1,
1.242319, 0.8515357, 2.342818, 1, 0, 0.6313726, 1,
1.243332, -2.574219, 4.506876, 1, 0, 0.6235294, 1,
1.244406, -0.5916834, 2.490815, 1, 0, 0.6196079, 1,
1.262891, -1.279182, 3.395113, 1, 0, 0.6117647, 1,
1.267076, -0.06354095, 0.8562284, 1, 0, 0.6078432, 1,
1.269717, -1.480898, 3.302861, 1, 0, 0.6, 1,
1.270404, -0.8494066, 3.632843, 1, 0, 0.5921569, 1,
1.27275, 0.1040794, 2.996604, 1, 0, 0.5882353, 1,
1.276591, -0.05273408, -0.03550027, 1, 0, 0.5803922, 1,
1.293835, -0.5618119, 1.270052, 1, 0, 0.5764706, 1,
1.305578, 1.328973, 0.9376216, 1, 0, 0.5686275, 1,
1.307878, 0.7371389, 0.4141075, 1, 0, 0.5647059, 1,
1.329446, -0.5833617, 0.4655781, 1, 0, 0.5568628, 1,
1.332874, 0.1226484, 0.6603122, 1, 0, 0.5529412, 1,
1.338502, -0.4523647, 1.078936, 1, 0, 0.5450981, 1,
1.341104, 0.1775944, 0.2018928, 1, 0, 0.5411765, 1,
1.348077, -0.1949877, 1.519428, 1, 0, 0.5333334, 1,
1.354895, 1.15806, 2.464274, 1, 0, 0.5294118, 1,
1.370016, 1.893187, 1.975464, 1, 0, 0.5215687, 1,
1.383445, 0.1631784, 4.451451, 1, 0, 0.5176471, 1,
1.384627, 0.115559, 1.860846, 1, 0, 0.509804, 1,
1.389107, -1.187415, 1.556317, 1, 0, 0.5058824, 1,
1.397931, -0.9945596, 3.534076, 1, 0, 0.4980392, 1,
1.413292, 0.8091177, 1.177689, 1, 0, 0.4901961, 1,
1.418382, -0.5176678, 3.428236, 1, 0, 0.4862745, 1,
1.419279, 1.205988, 0.3859663, 1, 0, 0.4784314, 1,
1.447535, -1.588274, 3.421476, 1, 0, 0.4745098, 1,
1.449577, 0.0001949429, -0.02631621, 1, 0, 0.4666667, 1,
1.454342, -0.6238058, 1.850158, 1, 0, 0.4627451, 1,
1.457361, 0.4309052, 1.153565, 1, 0, 0.454902, 1,
1.471524, -0.1208065, 1.447221, 1, 0, 0.4509804, 1,
1.480281, -0.8897536, 2.50712, 1, 0, 0.4431373, 1,
1.486032, 0.1140964, -0.0878238, 1, 0, 0.4392157, 1,
1.489247, 1.747585, -0.1073338, 1, 0, 0.4313726, 1,
1.499267, 0.9932558, 0.8398678, 1, 0, 0.427451, 1,
1.501751, -0.5955628, 2.799179, 1, 0, 0.4196078, 1,
1.505209, 0.1311731, 0.4013415, 1, 0, 0.4156863, 1,
1.509647, -0.1148067, 2.606975, 1, 0, 0.4078431, 1,
1.516595, -0.1864168, 1.455205, 1, 0, 0.4039216, 1,
1.518133, 0.5707051, 0.165776, 1, 0, 0.3960784, 1,
1.536362, 0.721468, 0.2999868, 1, 0, 0.3882353, 1,
1.5601, -1.295032, 1.974391, 1, 0, 0.3843137, 1,
1.566877, -0.3234707, 1.372036, 1, 0, 0.3764706, 1,
1.580893, -1.07801, 1.817549, 1, 0, 0.372549, 1,
1.605423, 1.620868, -0.7188715, 1, 0, 0.3647059, 1,
1.622866, 1.131839, -0.9167122, 1, 0, 0.3607843, 1,
1.624118, -0.8926118, 1.649524, 1, 0, 0.3529412, 1,
1.625744, -1.887364, 2.717735, 1, 0, 0.3490196, 1,
1.627678, 0.3157879, 1.168928, 1, 0, 0.3411765, 1,
1.645797, 0.5257832, 0.5238706, 1, 0, 0.3372549, 1,
1.64621, -1.106647, 1.522667, 1, 0, 0.3294118, 1,
1.655253, -1.255641, 2.185556, 1, 0, 0.3254902, 1,
1.65789, -0.7312379, 1.354788, 1, 0, 0.3176471, 1,
1.671583, 0.3929166, 0.05400108, 1, 0, 0.3137255, 1,
1.672754, 2.320781, 1.078852, 1, 0, 0.3058824, 1,
1.68754, -0.407951, -0.1228354, 1, 0, 0.2980392, 1,
1.726407, 0.3689954, 0.2977359, 1, 0, 0.2941177, 1,
1.727073, -0.5553213, 1.156748, 1, 0, 0.2862745, 1,
1.733619, 1.280822, 0.8075915, 1, 0, 0.282353, 1,
1.759681, -1.460489, 3.034124, 1, 0, 0.2745098, 1,
1.771057, -2.099546, 0.8967245, 1, 0, 0.2705882, 1,
1.837788, -0.1918197, 1.770276, 1, 0, 0.2627451, 1,
1.838643, 1.749083, -0.02616727, 1, 0, 0.2588235, 1,
1.845207, 0.7767683, 3.251158, 1, 0, 0.2509804, 1,
1.860772, 2.294327, 1.731548, 1, 0, 0.2470588, 1,
1.865804, 2.02783, 0.03666276, 1, 0, 0.2392157, 1,
1.870892, -0.273094, 2.953905, 1, 0, 0.2352941, 1,
1.878168, 0.1835996, 2.618044, 1, 0, 0.227451, 1,
1.906827, 0.7635211, 2.68288, 1, 0, 0.2235294, 1,
1.942991, 0.2751116, 1.437997, 1, 0, 0.2156863, 1,
1.951513, 0.6306251, 1.742949, 1, 0, 0.2117647, 1,
1.967148, 0.382465, 1.200416, 1, 0, 0.2039216, 1,
1.974999, 0.2554361, 2.598292, 1, 0, 0.1960784, 1,
1.984271, 0.2460761, 2.374172, 1, 0, 0.1921569, 1,
1.997061, -0.6406626, 2.640271, 1, 0, 0.1843137, 1,
2.02605, -1.119915, 2.170733, 1, 0, 0.1803922, 1,
2.056375, 0.06560369, 1.188784, 1, 0, 0.172549, 1,
2.110072, -0.5835372, 2.737001, 1, 0, 0.1686275, 1,
2.117654, -2.920523, 0.601379, 1, 0, 0.1607843, 1,
2.123981, 1.063232, 1.958577, 1, 0, 0.1568628, 1,
2.138537, -1.463438, 2.776781, 1, 0, 0.1490196, 1,
2.153316, -0.3968365, 2.550261, 1, 0, 0.145098, 1,
2.160666, 1.032606, 0.6635404, 1, 0, 0.1372549, 1,
2.171751, 1.560182, 1.305388, 1, 0, 0.1333333, 1,
2.188856, 2.172738, 1.527272, 1, 0, 0.1254902, 1,
2.218932, 0.3931654, 2.231886, 1, 0, 0.1215686, 1,
2.235481, -0.7677556, 0.9449491, 1, 0, 0.1137255, 1,
2.24618, 0.7281756, 0.4157536, 1, 0, 0.1098039, 1,
2.294324, -0.3886384, 3.887942, 1, 0, 0.1019608, 1,
2.301839, 1.67358, 2.199105, 1, 0, 0.09411765, 1,
2.319674, -0.3414783, 1.892958, 1, 0, 0.09019608, 1,
2.323419, 0.03983822, 0.704379, 1, 0, 0.08235294, 1,
2.352708, -1.008946, 1.533136, 1, 0, 0.07843138, 1,
2.43259, 0.6505067, 0.0557713, 1, 0, 0.07058824, 1,
2.47711, -0.5742474, 2.676229, 1, 0, 0.06666667, 1,
2.499369, 0.590977, 0.350742, 1, 0, 0.05882353, 1,
2.541938, 1.723284, 0.8615781, 1, 0, 0.05490196, 1,
2.554473, 0.204281, 0.03111629, 1, 0, 0.04705882, 1,
2.613688, 0.6486782, 2.826118, 1, 0, 0.04313726, 1,
2.651659, -1.916959, 2.462154, 1, 0, 0.03529412, 1,
2.687228, 0.240031, 0.7984273, 1, 0, 0.03137255, 1,
2.768401, 1.377871, -0.2780656, 1, 0, 0.02352941, 1,
2.864068, -1.648512, 1.327389, 1, 0, 0.01960784, 1,
2.872737, 0.1431497, 1.06273, 1, 0, 0.01176471, 1,
3.089049, -0.2607242, 1.185497, 1, 0, 0.007843138, 1
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
-0.1927832, -4.046574, -7.451166, 0, -0.5, 0.5, 0.5,
-0.1927832, -4.046574, -7.451166, 1, -0.5, 0.5, 0.5,
-0.1927832, -4.046574, -7.451166, 1, 1.5, 0.5, 0.5,
-0.1927832, -4.046574, -7.451166, 0, 1.5, 0.5, 0.5
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
-4.587157, 0.07314825, -7.451166, 0, -0.5, 0.5, 0.5,
-4.587157, 0.07314825, -7.451166, 1, -0.5, 0.5, 0.5,
-4.587157, 0.07314825, -7.451166, 1, 1.5, 0.5, 0.5,
-4.587157, 0.07314825, -7.451166, 0, 1.5, 0.5, 0.5
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
-4.587157, -4.046574, -0.5105641, 0, -0.5, 0.5, 0.5,
-4.587157, -4.046574, -0.5105641, 1, -0.5, 0.5, 0.5,
-4.587157, -4.046574, -0.5105641, 1, 1.5, 0.5, 0.5,
-4.587157, -4.046574, -0.5105641, 0, 1.5, 0.5, 0.5
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
-3, -3.095869, -5.849489,
3, -3.095869, -5.849489,
-3, -3.095869, -5.849489,
-3, -3.25432, -6.116435,
-2, -3.095869, -5.849489,
-2, -3.25432, -6.116435,
-1, -3.095869, -5.849489,
-1, -3.25432, -6.116435,
0, -3.095869, -5.849489,
0, -3.25432, -6.116435,
1, -3.095869, -5.849489,
1, -3.25432, -6.116435,
2, -3.095869, -5.849489,
2, -3.25432, -6.116435,
3, -3.095869, -5.849489,
3, -3.25432, -6.116435
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
-3, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
-3, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
-3, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
-3, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
-2, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
-2, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
-2, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
-2, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
-1, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
-1, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
-1, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
-1, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
0, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
0, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
0, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
0, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
1, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
1, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
1, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
1, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
2, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
2, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
2, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
2, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5,
3, -3.571222, -6.650327, 0, -0.5, 0.5, 0.5,
3, -3.571222, -6.650327, 1, -0.5, 0.5, 0.5,
3, -3.571222, -6.650327, 1, 1.5, 0.5, 0.5,
3, -3.571222, -6.650327, 0, 1.5, 0.5, 0.5
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
-3.573071, -3, -5.849489,
-3.573071, 3, -5.849489,
-3.573071, -3, -5.849489,
-3.742085, -3, -6.116435,
-3.573071, -2, -5.849489,
-3.742085, -2, -6.116435,
-3.573071, -1, -5.849489,
-3.742085, -1, -6.116435,
-3.573071, 0, -5.849489,
-3.742085, 0, -6.116435,
-3.573071, 1, -5.849489,
-3.742085, 1, -6.116435,
-3.573071, 2, -5.849489,
-3.742085, 2, -6.116435,
-3.573071, 3, -5.849489,
-3.742085, 3, -6.116435
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
-4.080114, -3, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, -3, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, -3, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, -3, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, -2, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, -2, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, -2, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, -2, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, -1, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, -1, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, -1, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, -1, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, 0, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, 0, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, 0, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, 0, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, 1, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, 1, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, 1, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, 1, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, 2, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, 2, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, 2, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, 2, -6.650327, 0, 1.5, 0.5, 0.5,
-4.080114, 3, -6.650327, 0, -0.5, 0.5, 0.5,
-4.080114, 3, -6.650327, 1, -0.5, 0.5, 0.5,
-4.080114, 3, -6.650327, 1, 1.5, 0.5, 0.5,
-4.080114, 3, -6.650327, 0, 1.5, 0.5, 0.5
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
-3.573071, -3.095869, -4,
-3.573071, -3.095869, 4,
-3.573071, -3.095869, -4,
-3.742085, -3.25432, -4,
-3.573071, -3.095869, -2,
-3.742085, -3.25432, -2,
-3.573071, -3.095869, 0,
-3.742085, -3.25432, 0,
-3.573071, -3.095869, 2,
-3.742085, -3.25432, 2,
-3.573071, -3.095869, 4,
-3.742085, -3.25432, 4
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
-4.080114, -3.571222, -4, 0, -0.5, 0.5, 0.5,
-4.080114, -3.571222, -4, 1, -0.5, 0.5, 0.5,
-4.080114, -3.571222, -4, 1, 1.5, 0.5, 0.5,
-4.080114, -3.571222, -4, 0, 1.5, 0.5, 0.5,
-4.080114, -3.571222, -2, 0, -0.5, 0.5, 0.5,
-4.080114, -3.571222, -2, 1, -0.5, 0.5, 0.5,
-4.080114, -3.571222, -2, 1, 1.5, 0.5, 0.5,
-4.080114, -3.571222, -2, 0, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 0, 0, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 0, 1, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 0, 1, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 0, 0, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 2, 0, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 2, 1, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 2, 1, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 2, 0, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 4, 0, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 4, 1, -0.5, 0.5, 0.5,
-4.080114, -3.571222, 4, 1, 1.5, 0.5, 0.5,
-4.080114, -3.571222, 4, 0, 1.5, 0.5, 0.5
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
-3.573071, -3.095869, -5.849489,
-3.573071, 3.242165, -5.849489,
-3.573071, -3.095869, 4.828361,
-3.573071, 3.242165, 4.828361,
-3.573071, -3.095869, -5.849489,
-3.573071, -3.095869, 4.828361,
-3.573071, 3.242165, -5.849489,
-3.573071, 3.242165, 4.828361,
-3.573071, -3.095869, -5.849489,
3.187504, -3.095869, -5.849489,
-3.573071, -3.095869, 4.828361,
3.187504, -3.095869, 4.828361,
-3.573071, 3.242165, -5.849489,
3.187504, 3.242165, -5.849489,
-3.573071, 3.242165, 4.828361,
3.187504, 3.242165, 4.828361,
3.187504, -3.095869, -5.849489,
3.187504, 3.242165, -5.849489,
3.187504, -3.095869, 4.828361,
3.187504, 3.242165, 4.828361,
3.187504, -3.095869, -5.849489,
3.187504, -3.095869, 4.828361,
3.187504, 3.242165, -5.849489,
3.187504, 3.242165, 4.828361
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
var radius = 7.549596;
var distance = 33.58901;
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
mvMatrix.translate( 0.1927832, -0.07314825, 0.5105641 );
mvMatrix.scale( 1.207408, 1.287903, 0.7644584 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.58901);
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
bentazone<-read.table("bentazone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bentazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
```

```r
y<-bentazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
```

```r
z<-bentazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'bentazone' not found
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
-3.474616, 0.3268626, -3.145675, 0, 0, 1, 1, 1,
-3.269005, -0.7779182, -1.374725, 1, 0, 0, 1, 1,
-2.731671, -0.1947738, 0.9489447, 1, 0, 0, 1, 1,
-2.648032, -0.7514264, -1.952287, 1, 0, 0, 1, 1,
-2.472867, 0.2466198, -1.706593, 1, 0, 0, 1, 1,
-2.457993, -0.230298, -2.956344, 1, 0, 0, 1, 1,
-2.451584, 0.6356865, 0.06735481, 0, 0, 0, 1, 1,
-2.435854, 0.9571205, -1.640827, 0, 0, 0, 1, 1,
-2.376043, -1.499832, -1.317624, 0, 0, 0, 1, 1,
-2.324912, 0.8343979, -0.9019352, 0, 0, 0, 1, 1,
-2.232897, 0.6728143, 0.1760682, 0, 0, 0, 1, 1,
-2.228967, 1.234166, -0.1566465, 0, 0, 0, 1, 1,
-2.193805, -0.6601505, -0.6823757, 0, 0, 0, 1, 1,
-2.150021, 0.03648646, -0.7404734, 1, 1, 1, 1, 1,
-2.128474, 1.261021, -1.740978, 1, 1, 1, 1, 1,
-2.114733, -0.8816254, -3.378424, 1, 1, 1, 1, 1,
-2.106951, -0.6800929, -2.107957, 1, 1, 1, 1, 1,
-2.101482, 1.359469, -0.1828197, 1, 1, 1, 1, 1,
-2.083457, -0.6048188, -2.804264, 1, 1, 1, 1, 1,
-2.055436, 0.2800397, 0.008517616, 1, 1, 1, 1, 1,
-2.032639, -1.720295, -0.2913095, 1, 1, 1, 1, 1,
-2.030499, 1.301986, -0.1039815, 1, 1, 1, 1, 1,
-2.029746, 1.297935, -0.7917429, 1, 1, 1, 1, 1,
-2.027288, 0.4455575, -1.493139, 1, 1, 1, 1, 1,
-2.021802, -1.856628, -2.463822, 1, 1, 1, 1, 1,
-2.017194, 1.429785, -2.60613, 1, 1, 1, 1, 1,
-2.016259, -1.788976, -3.37189, 1, 1, 1, 1, 1,
-2.014556, 0.7228763, -0.3553105, 1, 1, 1, 1, 1,
-1.981959, 0.3213409, -0.4924514, 0, 0, 1, 1, 1,
-1.970706, -0.8000941, -1.47096, 1, 0, 0, 1, 1,
-1.969921, 0.2268121, -0.9244055, 1, 0, 0, 1, 1,
-1.958871, 0.3735657, -1.582098, 1, 0, 0, 1, 1,
-1.94086, -0.4016054, -0.6153077, 1, 0, 0, 1, 1,
-1.932582, -0.5568874, -1.042572, 1, 0, 0, 1, 1,
-1.914268, 0.4770343, 0.4445542, 0, 0, 0, 1, 1,
-1.906207, -0.4179028, -1.773587, 0, 0, 0, 1, 1,
-1.889197, -1.187692, -3.955968, 0, 0, 0, 1, 1,
-1.867316, 1.437739, -0.6663226, 0, 0, 0, 1, 1,
-1.862331, -0.1872578, -1.54717, 0, 0, 0, 1, 1,
-1.830169, 0.3760718, -2.44266, 0, 0, 0, 1, 1,
-1.829741, -1.128972, -2.196305, 0, 0, 0, 1, 1,
-1.810727, 0.4189345, -1.431148, 1, 1, 1, 1, 1,
-1.777477, 1.013252, -1.496977, 1, 1, 1, 1, 1,
-1.774706, 1.446069, -0.4341404, 1, 1, 1, 1, 1,
-1.750565, -0.1803809, -0.9979787, 1, 1, 1, 1, 1,
-1.716594, 0.3378279, -2.421998, 1, 1, 1, 1, 1,
-1.694679, 0.345215, -2.017277, 1, 1, 1, 1, 1,
-1.688722, -1.359317, -2.93814, 1, 1, 1, 1, 1,
-1.679563, 1.086659, 0.07489883, 1, 1, 1, 1, 1,
-1.67952, 0.6022781, -1.538242, 1, 1, 1, 1, 1,
-1.667306, 1.527702, -1.95765, 1, 1, 1, 1, 1,
-1.651112, 0.5884787, 0.7978733, 1, 1, 1, 1, 1,
-1.6421, 1.708093, -0.1435348, 1, 1, 1, 1, 1,
-1.64145, -0.2115927, -2.408674, 1, 1, 1, 1, 1,
-1.640837, 0.8864516, 0.7222362, 1, 1, 1, 1, 1,
-1.622018, -0.8833163, -0.7168635, 1, 1, 1, 1, 1,
-1.621206, 1.025022, 0.880711, 0, 0, 1, 1, 1,
-1.614449, 0.1615267, -0.882486, 1, 0, 0, 1, 1,
-1.611505, -0.751986, -0.3074037, 1, 0, 0, 1, 1,
-1.593948, -1.46389, -1.507227, 1, 0, 0, 1, 1,
-1.592638, 0.4930001, -1.977634, 1, 0, 0, 1, 1,
-1.58693, -1.514281, -3.684109, 1, 0, 0, 1, 1,
-1.583497, -1.263925, -2.822217, 0, 0, 0, 1, 1,
-1.572678, 0.8005461, -1.202846, 0, 0, 0, 1, 1,
-1.564846, -0.6907589, -0.7509235, 0, 0, 0, 1, 1,
-1.549319, -1.612446, -1.149564, 0, 0, 0, 1, 1,
-1.549166, -0.2803924, -1.808824, 0, 0, 0, 1, 1,
-1.544132, -1.499223, -2.795542, 0, 0, 0, 1, 1,
-1.540483, 0.9226688, -1.471574, 0, 0, 0, 1, 1,
-1.536519, -0.3724113, -1.239438, 1, 1, 1, 1, 1,
-1.521476, 0.2346161, -2.987809, 1, 1, 1, 1, 1,
-1.518128, 1.061053, -2.592119, 1, 1, 1, 1, 1,
-1.493055, -0.5438961, -2.941589, 1, 1, 1, 1, 1,
-1.48429, 0.5012563, -2.476829, 1, 1, 1, 1, 1,
-1.483876, -0.3021231, -2.872725, 1, 1, 1, 1, 1,
-1.475945, 0.5590652, -1.146852, 1, 1, 1, 1, 1,
-1.475883, 0.5837556, -2.18015, 1, 1, 1, 1, 1,
-1.470418, -0.5642487, -1.732065, 1, 1, 1, 1, 1,
-1.469317, 0.06153799, -0.4668226, 1, 1, 1, 1, 1,
-1.465778, 0.1772076, -1.66917, 1, 1, 1, 1, 1,
-1.465417, 0.1794613, -0.6248687, 1, 1, 1, 1, 1,
-1.457312, -1.140715, -0.6055037, 1, 1, 1, 1, 1,
-1.454935, 1.433702, -2.141213, 1, 1, 1, 1, 1,
-1.442822, 0.3001485, -2.143754, 1, 1, 1, 1, 1,
-1.442224, -0.1301302, -2.244031, 0, 0, 1, 1, 1,
-1.431148, 0.2090166, 0.5739287, 1, 0, 0, 1, 1,
-1.422955, -0.9698393, -3.652209, 1, 0, 0, 1, 1,
-1.415795, 0.3155677, -0.2190403, 1, 0, 0, 1, 1,
-1.414223, 0.5199932, -0.5891958, 1, 0, 0, 1, 1,
-1.402372, 0.1669488, -2.470614, 1, 0, 0, 1, 1,
-1.400852, -0.7080117, -2.214406, 0, 0, 0, 1, 1,
-1.400799, 0.3084348, -2.359847, 0, 0, 0, 1, 1,
-1.392408, 1.277288, -1.873246, 0, 0, 0, 1, 1,
-1.379614, 0.5854474, -2.687114, 0, 0, 0, 1, 1,
-1.375969, 0.8753067, -2.821097, 0, 0, 0, 1, 1,
-1.372373, 0.9973225, -0.01399272, 0, 0, 0, 1, 1,
-1.35983, -0.91233, -0.3299415, 0, 0, 0, 1, 1,
-1.358821, -1.980924, -2.172704, 1, 1, 1, 1, 1,
-1.358294, -0.4986382, -2.903336, 1, 1, 1, 1, 1,
-1.344332, -1.272931, -2.393429, 1, 1, 1, 1, 1,
-1.336548, 0.2762581, -2.639355, 1, 1, 1, 1, 1,
-1.334086, 0.219617, -0.9207503, 1, 1, 1, 1, 1,
-1.32894, -0.2443997, -1.643353, 1, 1, 1, 1, 1,
-1.328233, 1.468254, -0.6056964, 1, 1, 1, 1, 1,
-1.314506, -0.8153797, -2.63874, 1, 1, 1, 1, 1,
-1.310594, -0.8441092, -0.6300982, 1, 1, 1, 1, 1,
-1.301787, -0.1942168, -0.09420168, 1, 1, 1, 1, 1,
-1.296816, 0.01886004, -2.014283, 1, 1, 1, 1, 1,
-1.292688, 0.73593, -1.987406, 1, 1, 1, 1, 1,
-1.292129, 0.1005416, -1.419468, 1, 1, 1, 1, 1,
-1.291459, 0.02698646, -4.316706, 1, 1, 1, 1, 1,
-1.281682, -1.642533, -1.665411, 1, 1, 1, 1, 1,
-1.279225, 1.127456, -1.366926, 0, 0, 1, 1, 1,
-1.276525, -0.4922328, -2.979089, 1, 0, 0, 1, 1,
-1.271855, 0.1705206, -0.3727382, 1, 0, 0, 1, 1,
-1.259685, -0.4042647, -1.771136, 1, 0, 0, 1, 1,
-1.258673, -0.6584424, -2.978285, 1, 0, 0, 1, 1,
-1.249698, -0.4077931, -1.828067, 1, 0, 0, 1, 1,
-1.248511, -1.083486, -1.274956, 0, 0, 0, 1, 1,
-1.243331, 0.4030263, -0.2362575, 0, 0, 0, 1, 1,
-1.236832, -1.024203, -1.727753, 0, 0, 0, 1, 1,
-1.232816, -1.169888, -2.591164, 0, 0, 0, 1, 1,
-1.23109, 0.6457173, -0.874532, 0, 0, 0, 1, 1,
-1.225071, 1.27627, -1.781491, 0, 0, 0, 1, 1,
-1.223543, 0.5167193, -1.004834, 0, 0, 0, 1, 1,
-1.219145, -0.5874634, -1.016405, 1, 1, 1, 1, 1,
-1.217211, -0.1145562, -1.926608, 1, 1, 1, 1, 1,
-1.213148, -1.148802, -3.546508, 1, 1, 1, 1, 1,
-1.201455, 1.315483, 0.7643343, 1, 1, 1, 1, 1,
-1.189842, 0.07429811, -0.912986, 1, 1, 1, 1, 1,
-1.188381, -2.435951, -4.768711, 1, 1, 1, 1, 1,
-1.18469, -0.7437508, -1.658177, 1, 1, 1, 1, 1,
-1.184196, -0.1852307, -1.568824, 1, 1, 1, 1, 1,
-1.173052, -0.7211649, -2.209098, 1, 1, 1, 1, 1,
-1.165224, -0.02680268, -2.349808, 1, 1, 1, 1, 1,
-1.162522, 0.05518191, -0.9969633, 1, 1, 1, 1, 1,
-1.154392, -0.1265557, -0.8695546, 1, 1, 1, 1, 1,
-1.149325, -1.919104, -3.717608, 1, 1, 1, 1, 1,
-1.141203, -0.1940283, -0.5556989, 1, 1, 1, 1, 1,
-1.135689, 5.261019e-05, -1.674215, 1, 1, 1, 1, 1,
-1.131754, -1.671819, -3.706068, 0, 0, 1, 1, 1,
-1.129119, 0.4926295, -1.629504, 1, 0, 0, 1, 1,
-1.123503, -0.134878, -2.402965, 1, 0, 0, 1, 1,
-1.116443, -0.1981151, -1.403878, 1, 0, 0, 1, 1,
-1.114716, -0.7686296, -1.47098, 1, 0, 0, 1, 1,
-1.108489, -0.09557518, -2.155808, 1, 0, 0, 1, 1,
-1.106545, -0.1449297, -3.12389, 0, 0, 0, 1, 1,
-1.105122, -0.364417, -2.337367, 0, 0, 0, 1, 1,
-1.102584, 1.37093, -0.1670895, 0, 0, 0, 1, 1,
-1.093317, 0.2228212, -3.967369, 0, 0, 0, 1, 1,
-1.07893, -0.5069695, -3.550319, 0, 0, 0, 1, 1,
-1.07793, -0.4516761, -0.5795857, 0, 0, 0, 1, 1,
-1.067364, -0.8358554, -0.9400501, 0, 0, 0, 1, 1,
-1.065516, 0.6939432, -0.345175, 1, 1, 1, 1, 1,
-1.060077, -0.8629081, -2.552938, 1, 1, 1, 1, 1,
-1.056456, 0.9678436, 1.384262, 1, 1, 1, 1, 1,
-1.046943, 1.385209, -0.6470169, 1, 1, 1, 1, 1,
-1.043157, -0.7116159, -1.717552, 1, 1, 1, 1, 1,
-1.038687, -0.2509358, -1.358211, 1, 1, 1, 1, 1,
-1.036605, 0.9205474, -1.678738, 1, 1, 1, 1, 1,
-1.034528, 0.6105465, -2.565664, 1, 1, 1, 1, 1,
-1.020279, -0.05287128, -2.089299, 1, 1, 1, 1, 1,
-1.018394, 0.8877161, 0.007569261, 1, 1, 1, 1, 1,
-1.012106, -1.041803, -0.9488502, 1, 1, 1, 1, 1,
-1.012075, 0.3801898, -1.12059, 1, 1, 1, 1, 1,
-1.005693, 0.03010496, -1.982386, 1, 1, 1, 1, 1,
-1.002216, 0.8625214, -2.174852, 1, 1, 1, 1, 1,
-0.9877821, -1.63743, -2.757821, 1, 1, 1, 1, 1,
-0.9855661, -0.9585617, -1.720784, 0, 0, 1, 1, 1,
-0.9821469, -0.320604, -0.3307237, 1, 0, 0, 1, 1,
-0.9810354, 0.9826958, -0.62912, 1, 0, 0, 1, 1,
-0.9791719, -0.8977163, -2.230137, 1, 0, 0, 1, 1,
-0.9699766, 0.07738865, -0.9310911, 1, 0, 0, 1, 1,
-0.9694448, 0.8026597, -0.2491174, 1, 0, 0, 1, 1,
-0.9684182, -0.03266548, 0.6812126, 0, 0, 0, 1, 1,
-0.9676048, -1.207656, -3.112336, 0, 0, 0, 1, 1,
-0.9585016, 1.931527, -1.099269, 0, 0, 0, 1, 1,
-0.9577202, 1.230647, -0.5962675, 0, 0, 0, 1, 1,
-0.9443018, 1.646809, -0.7238775, 0, 0, 0, 1, 1,
-0.942167, -1.390025, -2.292588, 0, 0, 0, 1, 1,
-0.9366781, 0.7974145, -1.188773, 0, 0, 0, 1, 1,
-0.9332837, 0.6085557, -1.907688, 1, 1, 1, 1, 1,
-0.9305934, 0.9424217, -1.201227, 1, 1, 1, 1, 1,
-0.9305838, -0.09198605, -1.285256, 1, 1, 1, 1, 1,
-0.9275807, 0.5722467, 0.3360106, 1, 1, 1, 1, 1,
-0.9257507, -0.642369, -2.404746, 1, 1, 1, 1, 1,
-0.924615, -0.1259458, -0.6662805, 1, 1, 1, 1, 1,
-0.9224764, -1.096627, -2.218053, 1, 1, 1, 1, 1,
-0.9203576, 0.2296333, 0.5524585, 1, 1, 1, 1, 1,
-0.9146899, -0.8780745, -3.011807, 1, 1, 1, 1, 1,
-0.9113007, -0.8481547, -1.056195, 1, 1, 1, 1, 1,
-0.9075789, -0.9722639, -3.331889, 1, 1, 1, 1, 1,
-0.9075617, -0.07850558, -3.271065, 1, 1, 1, 1, 1,
-0.9041978, 0.682572, -1.052577, 1, 1, 1, 1, 1,
-0.8966572, -0.7289553, -3.507215, 1, 1, 1, 1, 1,
-0.8938856, 0.8724883, 1.011649, 1, 1, 1, 1, 1,
-0.891679, -0.2398192, -2.787516, 0, 0, 1, 1, 1,
-0.8891038, 0.8395589, -1.355237, 1, 0, 0, 1, 1,
-0.8862497, 0.2744928, -2.940114, 1, 0, 0, 1, 1,
-0.8796427, 0.4207973, -2.638553, 1, 0, 0, 1, 1,
-0.8773466, -1.140988, -3.420758, 1, 0, 0, 1, 1,
-0.8745134, 0.8250623, -1.365509, 1, 0, 0, 1, 1,
-0.8612604, -0.5103232, -1.680857, 0, 0, 0, 1, 1,
-0.8582518, -0.9889652, -1.878324, 0, 0, 0, 1, 1,
-0.8578156, 0.3461069, -1.606115, 0, 0, 0, 1, 1,
-0.8560591, -1.058398, -2.95079, 0, 0, 0, 1, 1,
-0.8534976, 0.6363918, -2.466124, 0, 0, 0, 1, 1,
-0.8519295, 0.2077063, -1.372089, 0, 0, 0, 1, 1,
-0.8504884, -1.366906, -2.035735, 0, 0, 0, 1, 1,
-0.8473798, -0.4251456, -1.622806, 1, 1, 1, 1, 1,
-0.8344961, -0.3721171, -1.093325, 1, 1, 1, 1, 1,
-0.8256102, -0.85815, -1.301739, 1, 1, 1, 1, 1,
-0.821764, 0.04889832, -0.7009608, 1, 1, 1, 1, 1,
-0.816399, -0.1165873, -3.036782, 1, 1, 1, 1, 1,
-0.80896, -0.6846294, -1.621254, 1, 1, 1, 1, 1,
-0.8025892, 0.03771548, -0.5192578, 1, 1, 1, 1, 1,
-0.8019705, -1.997871, -3.405368, 1, 1, 1, 1, 1,
-0.8015264, 1.267491, -1.282778, 1, 1, 1, 1, 1,
-0.797874, -0.4813254, -0.9022773, 1, 1, 1, 1, 1,
-0.7934264, 0.2202881, -2.142562, 1, 1, 1, 1, 1,
-0.7813122, 0.3629784, -0.2520267, 1, 1, 1, 1, 1,
-0.7810488, -0.5157667, -0.9643361, 1, 1, 1, 1, 1,
-0.7807762, 0.3949503, -1.418082, 1, 1, 1, 1, 1,
-0.7803794, -0.9755582, -3.293152, 1, 1, 1, 1, 1,
-0.7735426, -0.9797627, -1.669687, 0, 0, 1, 1, 1,
-0.7727981, -0.2647501, -1.662431, 1, 0, 0, 1, 1,
-0.770997, 1.286083, 0.3745255, 1, 0, 0, 1, 1,
-0.7701908, 0.04059532, -2.048653, 1, 0, 0, 1, 1,
-0.765331, -1.558232, -1.462912, 1, 0, 0, 1, 1,
-0.7598115, 1.072194, 0.7810277, 1, 0, 0, 1, 1,
-0.7596404, 0.2033849, -2.828283, 0, 0, 0, 1, 1,
-0.7577044, -1.032011, -3.730491, 0, 0, 0, 1, 1,
-0.7572442, -0.3193073, -1.01301, 0, 0, 0, 1, 1,
-0.7520609, -0.4293492, -1.996634, 0, 0, 0, 1, 1,
-0.7497159, 0.239477, -2.052505, 0, 0, 0, 1, 1,
-0.7490332, -0.02103928, -2.170966, 0, 0, 0, 1, 1,
-0.7481714, 0.05204031, -0.50618, 0, 0, 0, 1, 1,
-0.7344288, -1.873005, -2.825286, 1, 1, 1, 1, 1,
-0.7336439, 1.092224, -0.4090191, 1, 1, 1, 1, 1,
-0.7227517, 0.05016167, 0.4901889, 1, 1, 1, 1, 1,
-0.7224721, 0.09132579, -1.353571, 1, 1, 1, 1, 1,
-0.7224414, 0.7518278, -1.81678, 1, 1, 1, 1, 1,
-0.7196224, -0.5729786, -3.259608, 1, 1, 1, 1, 1,
-0.7190686, -0.4729644, -2.246225, 1, 1, 1, 1, 1,
-0.7189811, -0.003822555, -2.118623, 1, 1, 1, 1, 1,
-0.7181011, 0.7794673, -2.555257, 1, 1, 1, 1, 1,
-0.7160239, -1.988156, -3.846307, 1, 1, 1, 1, 1,
-0.7152347, 0.8548455, 0.2386904, 1, 1, 1, 1, 1,
-0.7129359, -0.378424, -3.090693, 1, 1, 1, 1, 1,
-0.708672, 0.1176084, -3.547353, 1, 1, 1, 1, 1,
-0.7086161, -0.7696362, -2.444381, 1, 1, 1, 1, 1,
-0.7071018, 0.7877421, -2.48145, 1, 1, 1, 1, 1,
-0.7008185, 0.06789185, -1.143639, 0, 0, 1, 1, 1,
-0.6988754, 0.6654548, -0.1630563, 1, 0, 0, 1, 1,
-0.6971008, 0.5965416, -1.062396, 1, 0, 0, 1, 1,
-0.6967404, 0.3241417, -2.564434, 1, 0, 0, 1, 1,
-0.6927234, 0.6927181, -1.481034, 1, 0, 0, 1, 1,
-0.689413, 0.3608458, -0.8370027, 1, 0, 0, 1, 1,
-0.6816334, -0.4064319, -0.835924, 0, 0, 0, 1, 1,
-0.6795173, 2.175676, -0.03767411, 0, 0, 0, 1, 1,
-0.6724864, 1.793337, -0.05974621, 0, 0, 0, 1, 1,
-0.6645077, -0.5756269, -2.790154, 0, 0, 0, 1, 1,
-0.662641, -0.3690532, -2.581932, 0, 0, 0, 1, 1,
-0.6554554, -0.07235926, -1.311985, 0, 0, 0, 1, 1,
-0.6487631, -2.177859, -4.340738, 0, 0, 0, 1, 1,
-0.6483039, 0.8998043, -1.367674, 1, 1, 1, 1, 1,
-0.638469, -0.2072444, -1.990684, 1, 1, 1, 1, 1,
-0.6344249, 0.8889649, -1.020503, 1, 1, 1, 1, 1,
-0.623271, 1.142691, -0.7942209, 1, 1, 1, 1, 1,
-0.6222367, -0.8582289, -3.085835, 1, 1, 1, 1, 1,
-0.6204597, 0.1433935, -1.939625, 1, 1, 1, 1, 1,
-0.6165329, -2.223881, -1.620523, 1, 1, 1, 1, 1,
-0.613128, 0.08170436, -3.570626, 1, 1, 1, 1, 1,
-0.6112928, 0.9267644, 0.2064458, 1, 1, 1, 1, 1,
-0.6093323, 0.428001, -2.665282, 1, 1, 1, 1, 1,
-0.6072509, 2.506249, 0.927287, 1, 1, 1, 1, 1,
-0.604904, -0.3849165, -0.9778767, 1, 1, 1, 1, 1,
-0.6046898, -0.254202, -2.149022, 1, 1, 1, 1, 1,
-0.6022222, 1.446211, -0.3466689, 1, 1, 1, 1, 1,
-0.6018202, 1.225932, -0.1427359, 1, 1, 1, 1, 1,
-0.5948088, 1.418234, -0.07518742, 0, 0, 1, 1, 1,
-0.5806288, 0.3366917, -0.1945899, 1, 0, 0, 1, 1,
-0.5745741, -0.2870748, -2.677359, 1, 0, 0, 1, 1,
-0.5705836, 0.4661071, -0.4244211, 1, 0, 0, 1, 1,
-0.5699602, -1.281863, -3.834319, 1, 0, 0, 1, 1,
-0.5672647, -0.3198983, -1.977271, 1, 0, 0, 1, 1,
-0.5623137, 2.032887, -0.7478155, 0, 0, 0, 1, 1,
-0.5620505, 0.1003303, 0.08830638, 0, 0, 0, 1, 1,
-0.5618142, 1.083425, -0.7347699, 0, 0, 0, 1, 1,
-0.5599489, -0.4992599, -2.580773, 0, 0, 0, 1, 1,
-0.5586405, 0.4290493, -1.926342, 0, 0, 0, 1, 1,
-0.5565017, -0.5554101, -2.124413, 0, 0, 0, 1, 1,
-0.5533172, 0.9113387, -0.9755369, 0, 0, 0, 1, 1,
-0.5527029, -0.4759664, -3.879538, 1, 1, 1, 1, 1,
-0.546769, 0.8331043, -1.024138, 1, 1, 1, 1, 1,
-0.5451552, 0.22379, -3.064339, 1, 1, 1, 1, 1,
-0.5412489, -0.8887419, -2.539171, 1, 1, 1, 1, 1,
-0.5389621, 1.338706, 0.0198271, 1, 1, 1, 1, 1,
-0.5342422, 0.2579675, -1.703859, 1, 1, 1, 1, 1,
-0.5334126, 0.5532736, -1.218622, 1, 1, 1, 1, 1,
-0.5326172, -0.1590958, -3.102215, 1, 1, 1, 1, 1,
-0.5268586, -0.8978326, -3.202754, 1, 1, 1, 1, 1,
-0.5235826, -0.4982468, 0.08494361, 1, 1, 1, 1, 1,
-0.515641, 0.9043269, 0.6117356, 1, 1, 1, 1, 1,
-0.5116787, 1.067611, -0.1323483, 1, 1, 1, 1, 1,
-0.5076741, -0.6443024, -2.09598, 1, 1, 1, 1, 1,
-0.5062096, 1.748863, -1.80314, 1, 1, 1, 1, 1,
-0.5051627, -0.289108, -1.677894, 1, 1, 1, 1, 1,
-0.4907072, 0.913735, -0.248739, 0, 0, 1, 1, 1,
-0.4877114, 0.06415317, -2.530444, 1, 0, 0, 1, 1,
-0.4814254, 0.4643694, -2.141167, 1, 0, 0, 1, 1,
-0.4721863, -0.08588528, -1.616827, 1, 0, 0, 1, 1,
-0.4719332, -1.774556, -3.901348, 1, 0, 0, 1, 1,
-0.4699363, 0.8183856, -0.6857226, 1, 0, 0, 1, 1,
-0.464181, -0.1605934, -3.380675, 0, 0, 0, 1, 1,
-0.4593672, 0.2595291, -1.253533, 0, 0, 0, 1, 1,
-0.4565894, -0.4910194, -1.720157, 0, 0, 0, 1, 1,
-0.4527455, 0.5540709, 0.373456, 0, 0, 0, 1, 1,
-0.4525757, -2.076997, -3.425628, 0, 0, 0, 1, 1,
-0.4496786, 0.5145956, -1.061539, 0, 0, 0, 1, 1,
-0.4477648, 0.4969822, 0.4307888, 0, 0, 0, 1, 1,
-0.4476994, 0.2873902, -1.788921, 1, 1, 1, 1, 1,
-0.4476821, 0.9670359, 0.6950907, 1, 1, 1, 1, 1,
-0.4392671, -1.382358, -3.833504, 1, 1, 1, 1, 1,
-0.4336504, -0.8377628, -1.782521, 1, 1, 1, 1, 1,
-0.4314962, -1.105676, -3.478435, 1, 1, 1, 1, 1,
-0.4270362, -0.3469121, -2.401577, 1, 1, 1, 1, 1,
-0.417585, -0.8228628, -2.858078, 1, 1, 1, 1, 1,
-0.4160042, 0.7679093, 0.009144418, 1, 1, 1, 1, 1,
-0.4151312, -0.5280105, -3.483934, 1, 1, 1, 1, 1,
-0.4130819, -0.9236558, -3.304946, 1, 1, 1, 1, 1,
-0.4045583, -1.07393, -1.285188, 1, 1, 1, 1, 1,
-0.4027888, 0.6517978, -0.1115308, 1, 1, 1, 1, 1,
-0.4026008, -0.5596441, -3.247912, 1, 1, 1, 1, 1,
-0.4024975, -0.8852514, -1.026218, 1, 1, 1, 1, 1,
-0.3999493, 0.4077211, -1.61615, 1, 1, 1, 1, 1,
-0.399174, 0.1744758, -1.80451, 0, 0, 1, 1, 1,
-0.3973663, -0.3804564, -2.832255, 1, 0, 0, 1, 1,
-0.3918528, -1.094149, -3.429573, 1, 0, 0, 1, 1,
-0.3817317, -1.224163, -3.951552, 1, 0, 0, 1, 1,
-0.3816083, 0.1129719, -2.8092, 1, 0, 0, 1, 1,
-0.3799149, 0.03038294, -1.993652, 1, 0, 0, 1, 1,
-0.3796991, -0.6991459, -2.709152, 0, 0, 0, 1, 1,
-0.3748631, 0.5838712, -0.9290687, 0, 0, 0, 1, 1,
-0.3713314, 0.8500403, -0.2407886, 0, 0, 0, 1, 1,
-0.3701525, -0.7702076, -0.732295, 0, 0, 0, 1, 1,
-0.3698819, -2.732362, -2.077741, 0, 0, 0, 1, 1,
-0.3697681, -0.6089771, -2.9174, 0, 0, 0, 1, 1,
-0.3606445, -0.7172918, -1.875411, 0, 0, 0, 1, 1,
-0.3594406, 0.1916983, -0.6195731, 1, 1, 1, 1, 1,
-0.3576513, -1.469757, -1.054758, 1, 1, 1, 1, 1,
-0.3552505, 0.2006904, -2.058052, 1, 1, 1, 1, 1,
-0.3537826, 0.5953013, -0.5727745, 1, 1, 1, 1, 1,
-0.3525724, 0.139894, 0.9703804, 1, 1, 1, 1, 1,
-0.3523771, 0.120533, -0.8629023, 1, 1, 1, 1, 1,
-0.349241, -2.581258, -1.25739, 1, 1, 1, 1, 1,
-0.3447243, 0.9542139, 0.3358835, 1, 1, 1, 1, 1,
-0.340921, 0.3590727, -1.912622, 1, 1, 1, 1, 1,
-0.3399348, -1.311953, -0.5727561, 1, 1, 1, 1, 1,
-0.3391654, -0.519215, -3.860439, 1, 1, 1, 1, 1,
-0.3370066, 0.522268, -0.7522988, 1, 1, 1, 1, 1,
-0.3360307, -0.3613592, -2.381305, 1, 1, 1, 1, 1,
-0.3356557, 0.7253546, -0.7442076, 1, 1, 1, 1, 1,
-0.3335896, 0.9073212, -1.196342, 1, 1, 1, 1, 1,
-0.3327045, -0.970157, -1.731516, 0, 0, 1, 1, 1,
-0.3323929, -0.4092372, -2.238538, 1, 0, 0, 1, 1,
-0.325489, -1.24655, -3.76332, 1, 0, 0, 1, 1,
-0.3218383, -0.5272418, -0.9285037, 1, 0, 0, 1, 1,
-0.3208859, 1.972195, -0.3087994, 1, 0, 0, 1, 1,
-0.3186291, -0.03125405, -0.1619152, 1, 0, 0, 1, 1,
-0.3172369, 1.292409, 0.2700426, 0, 0, 0, 1, 1,
-0.3155477, -0.9414345, -2.214837, 0, 0, 0, 1, 1,
-0.3091542, 0.9500124, -1.388207, 0, 0, 0, 1, 1,
-0.3039138, -0.4559484, 1.037119, 0, 0, 0, 1, 1,
-0.3026464, 0.01845807, 0.2580098, 0, 0, 0, 1, 1,
-0.2947926, -0.5813528, -5.693986, 0, 0, 0, 1, 1,
-0.2882416, -1.057062, -2.126809, 0, 0, 0, 1, 1,
-0.2839899, -0.04321869, -2.858243, 1, 1, 1, 1, 1,
-0.2834336, 0.4134093, 0.4695559, 1, 1, 1, 1, 1,
-0.2791887, 0.889298, -0.8506882, 1, 1, 1, 1, 1,
-0.2763015, 0.2403723, -2.164227, 1, 1, 1, 1, 1,
-0.2746274, 0.28398, -1.297905, 1, 1, 1, 1, 1,
-0.2710971, 0.7810845, -1.30384, 1, 1, 1, 1, 1,
-0.2701367, 0.07554963, -0.7621406, 1, 1, 1, 1, 1,
-0.2669515, -1.260029, -2.442488, 1, 1, 1, 1, 1,
-0.2640854, 1.253112, -2.253201, 1, 1, 1, 1, 1,
-0.2634979, 0.5148485, -0.8246151, 1, 1, 1, 1, 1,
-0.2623923, -1.282875, -3.744361, 1, 1, 1, 1, 1,
-0.2621337, -1.046178, -1.967021, 1, 1, 1, 1, 1,
-0.2610683, -0.03629099, -3.880418, 1, 1, 1, 1, 1,
-0.258779, 1.629021, 1.062217, 1, 1, 1, 1, 1,
-0.2572059, -0.5830944, -1.335553, 1, 1, 1, 1, 1,
-0.2569578, 0.6487689, 1.455423, 0, 0, 1, 1, 1,
-0.2537468, 0.3891005, -0.2503503, 1, 0, 0, 1, 1,
-0.250407, -0.3827185, -2.270486, 1, 0, 0, 1, 1,
-0.2396894, 0.1921354, -1.643619, 1, 0, 0, 1, 1,
-0.232925, 0.2402717, -1.076554, 1, 0, 0, 1, 1,
-0.2323079, -0.4438282, -4.949194, 1, 0, 0, 1, 1,
-0.2295457, -0.1576775, -3.142468, 0, 0, 0, 1, 1,
-0.2274267, 0.3667887, -1.403326, 0, 0, 0, 1, 1,
-0.2272937, -1.037412, -2.181318, 0, 0, 0, 1, 1,
-0.224462, -1.367096, -3.384073, 0, 0, 0, 1, 1,
-0.2219992, 0.3964985, -2.174891, 0, 0, 0, 1, 1,
-0.2212608, -0.7884942, -2.659269, 0, 0, 0, 1, 1,
-0.2207367, 1.569759, -0.1216771, 0, 0, 0, 1, 1,
-0.2155858, 0.6970416, -0.9915435, 1, 1, 1, 1, 1,
-0.2135314, -0.2848593, -2.094911, 1, 1, 1, 1, 1,
-0.213108, -0.6048632, -2.447082, 1, 1, 1, 1, 1,
-0.2117939, -1.271582, -3.336776, 1, 1, 1, 1, 1,
-0.2108427, -0.08437242, -1.791626, 1, 1, 1, 1, 1,
-0.2096636, 0.6789148, -0.01880519, 1, 1, 1, 1, 1,
-0.2031451, -0.1844012, -2.893942, 1, 1, 1, 1, 1,
-0.1989149, 0.4336371, -1.870437, 1, 1, 1, 1, 1,
-0.1965518, 0.5826808, -0.1155807, 1, 1, 1, 1, 1,
-0.1958326, 0.0291036, -0.3450318, 1, 1, 1, 1, 1,
-0.1940909, 1.96102, 0.1968487, 1, 1, 1, 1, 1,
-0.1926613, 2.814086, -0.5819227, 1, 1, 1, 1, 1,
-0.1901286, -0.3039136, -4.359919, 1, 1, 1, 1, 1,
-0.1864065, 2.246745, -1.348193, 1, 1, 1, 1, 1,
-0.1861511, 0.6063009, -1.312857, 1, 1, 1, 1, 1,
-0.1839884, 1.10604, 0.1470452, 0, 0, 1, 1, 1,
-0.1832565, 1.029393, 1.557387, 1, 0, 0, 1, 1,
-0.1784722, -0.09865049, -2.642958, 1, 0, 0, 1, 1,
-0.1776964, -0.4696057, -1.724412, 1, 0, 0, 1, 1,
-0.1741879, 0.9172817, -0.1541285, 1, 0, 0, 1, 1,
-0.1666612, 0.05673723, -1.246508, 1, 0, 0, 1, 1,
-0.1578175, -0.2318544, -1.278998, 0, 0, 0, 1, 1,
-0.1518768, -0.2592688, -2.509252, 0, 0, 0, 1, 1,
-0.1487336, 0.1805581, -1.104382, 0, 0, 0, 1, 1,
-0.1480575, 0.2394475, 2.161712, 0, 0, 0, 1, 1,
-0.1469672, 0.2058175, -1.574761, 0, 0, 0, 1, 1,
-0.1445356, 0.4281128, -0.2541799, 0, 0, 0, 1, 1,
-0.1443891, -0.2058018, -1.913833, 0, 0, 0, 1, 1,
-0.1401668, -1.742801, -2.658767, 1, 1, 1, 1, 1,
-0.1351815, -1.058703, -2.595344, 1, 1, 1, 1, 1,
-0.1340384, -0.8337778, -3.720883, 1, 1, 1, 1, 1,
-0.1339439, 1.753746, 0.5300279, 1, 1, 1, 1, 1,
-0.131399, -0.5324297, -2.320398, 1, 1, 1, 1, 1,
-0.1294023, 1.234151, 1.718335, 1, 1, 1, 1, 1,
-0.1289169, 0.08354684, 0.03494578, 1, 1, 1, 1, 1,
-0.1270607, 0.6918303, -0.3720255, 1, 1, 1, 1, 1,
-0.1246855, 0.1598011, -1.359443, 1, 1, 1, 1, 1,
-0.1215928, 0.4605021, 0.04387705, 1, 1, 1, 1, 1,
-0.1193203, -0.6164188, -2.450786, 1, 1, 1, 1, 1,
-0.1186044, 0.5957941, 0.8637345, 1, 1, 1, 1, 1,
-0.1146816, 1.235224, 1.601383, 1, 1, 1, 1, 1,
-0.1121806, 0.9066305, 1.326953, 1, 1, 1, 1, 1,
-0.1105052, 1.406948, 0.236549, 1, 1, 1, 1, 1,
-0.1093165, 1.581456, 0.7469298, 0, 0, 1, 1, 1,
-0.10862, 0.01504859, -1.868189, 1, 0, 0, 1, 1,
-0.1053592, 0.2598795, -0.3692579, 1, 0, 0, 1, 1,
-0.1015163, 0.8827516, 0.137843, 1, 0, 0, 1, 1,
-0.09945497, 1.637356, -1.094693, 1, 0, 0, 1, 1,
-0.0992516, -1.781329, -2.256742, 1, 0, 0, 1, 1,
-0.09888525, 0.2514783, 1.048475, 0, 0, 0, 1, 1,
-0.09774635, 0.1334191, -1.585584, 0, 0, 0, 1, 1,
-0.09707005, -0.1045371, -1.601664, 0, 0, 0, 1, 1,
-0.09461637, 0.2261719, 0.3521159, 0, 0, 0, 1, 1,
-0.09447108, -0.3975564, -1.722939, 0, 0, 0, 1, 1,
-0.09286309, -0.3040333, -2.246398, 0, 0, 0, 1, 1,
-0.09201171, -1.337282, -4.942519, 0, 0, 0, 1, 1,
-0.08577003, -0.8289957, -2.131402, 1, 1, 1, 1, 1,
-0.08458219, -0.9158431, -3.103281, 1, 1, 1, 1, 1,
-0.08355317, 0.6313821, -1.313001, 1, 1, 1, 1, 1,
-0.08328769, -1.787575, -3.544355, 1, 1, 1, 1, 1,
-0.08298706, -1.45032, -2.552338, 1, 1, 1, 1, 1,
-0.07645841, -1.606522, -2.423896, 1, 1, 1, 1, 1,
-0.07287187, 0.3999269, 0.3176297, 1, 1, 1, 1, 1,
-0.06722882, 1.618364, 0.2951557, 1, 1, 1, 1, 1,
-0.06311432, -0.5572171, -3.447833, 1, 1, 1, 1, 1,
-0.06154485, 0.8645322, 0.2669057, 1, 1, 1, 1, 1,
-0.05996075, 1.718376, -0.5122296, 1, 1, 1, 1, 1,
-0.05901908, -0.2892221, -2.594005, 1, 1, 1, 1, 1,
-0.0588703, -0.6146175, -3.119486, 1, 1, 1, 1, 1,
-0.05823289, -0.09710947, -2.846482, 1, 1, 1, 1, 1,
-0.05751732, -0.03308934, -2.407965, 1, 1, 1, 1, 1,
-0.05151211, 0.13701, -1.42289, 0, 0, 1, 1, 1,
-0.05108247, -0.7398716, -1.785383, 1, 0, 0, 1, 1,
-0.05047499, -1.348621, -3.04373, 1, 0, 0, 1, 1,
-0.04792758, -0.834138, -3.23332, 1, 0, 0, 1, 1,
-0.04679985, 0.2273179, 0.2937719, 1, 0, 0, 1, 1,
-0.04608857, -0.3422271, -2.075559, 1, 0, 0, 1, 1,
-0.04334255, 1.12071, -0.6496413, 0, 0, 0, 1, 1,
-0.04301135, -1.015122, -4.521722, 0, 0, 0, 1, 1,
-0.04132583, -0.6343234, -2.93259, 0, 0, 0, 1, 1,
-0.03599414, -0.6197835, -2.960523, 0, 0, 0, 1, 1,
-0.03341641, 0.8539227, 1.251108, 0, 0, 0, 1, 1,
-0.03201897, 0.8670542, -0.3908969, 0, 0, 0, 1, 1,
-0.02990677, -0.8429959, -2.459331, 0, 0, 0, 1, 1,
-0.02936592, 0.3593039, 1.074158, 1, 1, 1, 1, 1,
-0.02778011, -0.4119651, -4.466932, 1, 1, 1, 1, 1,
-0.02514513, 0.6279954, 0.008508634, 1, 1, 1, 1, 1,
-0.02448421, 0.2992095, 0.3994528, 1, 1, 1, 1, 1,
-0.02231632, -0.2983241, -4.143303, 1, 1, 1, 1, 1,
-0.02213347, 1.126252, 0.3508403, 1, 1, 1, 1, 1,
-0.02093713, 1.134444, 0.08277815, 1, 1, 1, 1, 1,
-0.01919057, -0.8420358, -4.916432, 1, 1, 1, 1, 1,
-0.01629869, 0.4416703, 1.014921, 1, 1, 1, 1, 1,
-0.01101202, 2.778596, -0.08503678, 1, 1, 1, 1, 1,
-0.009174964, 0.2846894, 0.5709621, 1, 1, 1, 1, 1,
-0.009029948, 1.226791, -2.023366, 1, 1, 1, 1, 1,
-0.007329521, 0.7562796, -0.1851139, 1, 1, 1, 1, 1,
-0.004115382, -0.04537353, -3.722042, 1, 1, 1, 1, 1,
-0.003899714, 0.3294715, -0.153908, 1, 1, 1, 1, 1,
-0.002859306, -0.2251273, -2.141691, 0, 0, 1, 1, 1,
-0.001123775, -0.7602697, -4.437005, 1, 0, 0, 1, 1,
0.003623359, -0.7920374, 2.981148, 1, 0, 0, 1, 1,
0.004076555, 0.7827997, 0.8299804, 1, 0, 0, 1, 1,
0.004292664, -0.734844, 2.699788, 1, 0, 0, 1, 1,
0.01055487, -1.564555, 2.771521, 1, 0, 0, 1, 1,
0.01874915, 1.057816, -0.9255551, 0, 0, 0, 1, 1,
0.01982385, -0.9532413, 1.288634, 0, 0, 0, 1, 1,
0.02475706, -1.587015, 3.865201, 0, 0, 0, 1, 1,
0.02519472, 0.7631895, -1.224642, 0, 0, 0, 1, 1,
0.02762049, 1.221325, -2.3003, 0, 0, 0, 1, 1,
0.03270224, -0.05464508, 3.435863, 0, 0, 0, 1, 1,
0.03885031, -0.778326, 4.123846, 0, 0, 0, 1, 1,
0.05018028, -1.174864, 2.448242, 1, 1, 1, 1, 1,
0.05220092, -2.091529, 3.986135, 1, 1, 1, 1, 1,
0.05349705, 0.2746629, 0.3834608, 1, 1, 1, 1, 1,
0.05386162, -2.051087, 3.61978, 1, 1, 1, 1, 1,
0.05417385, -0.6985008, 3.959281, 1, 1, 1, 1, 1,
0.05665379, -0.4501026, 2.171865, 1, 1, 1, 1, 1,
0.06545626, 0.3936836, 1.332875, 1, 1, 1, 1, 1,
0.06774952, -1.369543, 2.381828, 1, 1, 1, 1, 1,
0.07216438, 0.08333839, 0.5878736, 1, 1, 1, 1, 1,
0.07522141, -0.2728913, 4.622662, 1, 1, 1, 1, 1,
0.07711139, -0.5113079, 2.395572, 1, 1, 1, 1, 1,
0.07712692, -0.2081243, 3.878172, 1, 1, 1, 1, 1,
0.07919629, -0.2154858, 4.187298, 1, 1, 1, 1, 1,
0.079423, 0.1234225, 1.232875, 1, 1, 1, 1, 1,
0.08036637, -0.2870193, 2.618801, 1, 1, 1, 1, 1,
0.08205667, 0.2559071, -0.6725627, 0, 0, 1, 1, 1,
0.082465, -0.6959397, 2.87918, 1, 0, 0, 1, 1,
0.08305775, 0.9689338, -0.7647198, 1, 0, 0, 1, 1,
0.08363461, -0.09566097, 2.290811, 1, 0, 0, 1, 1,
0.08791481, 0.4756309, 0.6353094, 1, 0, 0, 1, 1,
0.09170425, -0.902299, 2.740244, 1, 0, 0, 1, 1,
0.09836859, 0.9008605, -0.649081, 0, 0, 0, 1, 1,
0.09856809, -0.6399732, 3.234366, 0, 0, 0, 1, 1,
0.1102798, 1.530366, -0.4686674, 0, 0, 0, 1, 1,
0.1135308, -0.3960569, 3.126135, 0, 0, 0, 1, 1,
0.1163475, -0.6249313, 1.811206, 0, 0, 0, 1, 1,
0.118113, 1.268408, 0.4056301, 0, 0, 0, 1, 1,
0.1207995, -0.859121, 3.632808, 0, 0, 0, 1, 1,
0.122485, -0.4589344, 2.627244, 1, 1, 1, 1, 1,
0.12809, 1.233389, 0.8141748, 1, 1, 1, 1, 1,
0.1312654, 0.4238104, 0.9197769, 1, 1, 1, 1, 1,
0.1343282, -1.950039, 3.728237, 1, 1, 1, 1, 1,
0.1419639, 0.2313789, 0.8697876, 1, 1, 1, 1, 1,
0.1438794, -0.1068101, 3.138131, 1, 1, 1, 1, 1,
0.1446989, -0.2591599, 2.532512, 1, 1, 1, 1, 1,
0.1479697, -1.275029, 1.901421, 1, 1, 1, 1, 1,
0.1486907, 0.2453201, 0.07842762, 1, 1, 1, 1, 1,
0.148762, -0.04707909, 1.996297, 1, 1, 1, 1, 1,
0.1538257, 0.7616001, 1.213791, 1, 1, 1, 1, 1,
0.1547682, -0.3805704, 1.42521, 1, 1, 1, 1, 1,
0.1669006, -0.5121049, 2.212472, 1, 1, 1, 1, 1,
0.1685587, 1.51808, 2.05718, 1, 1, 1, 1, 1,
0.1695341, 0.408968, -1.136599, 1, 1, 1, 1, 1,
0.1725061, 0.3917613, -0.6868114, 0, 0, 1, 1, 1,
0.1732545, 0.8282835, 1.667693, 1, 0, 0, 1, 1,
0.1751432, 1.815295, 0.6236065, 1, 0, 0, 1, 1,
0.1752169, -0.1666162, 1.912641, 1, 0, 0, 1, 1,
0.1754071, -0.641315, 2.202332, 1, 0, 0, 1, 1,
0.1813318, -1.647756, 3.208494, 1, 0, 0, 1, 1,
0.1849415, 0.1528719, 1.163494, 0, 0, 0, 1, 1,
0.1892158, -1.008204, 4.672858, 0, 0, 0, 1, 1,
0.1908364, -1.569621, 4.31266, 0, 0, 0, 1, 1,
0.1931538, 0.276739, -1.200691, 0, 0, 0, 1, 1,
0.1944725, -0.3437758, 3.324504, 0, 0, 0, 1, 1,
0.1945588, -0.1363746, 2.895574, 0, 0, 0, 1, 1,
0.1986088, -1.395561, 2.755314, 0, 0, 0, 1, 1,
0.2031068, -0.2358012, 1.426657, 1, 1, 1, 1, 1,
0.2031891, -1.681355, 4.136829, 1, 1, 1, 1, 1,
0.2059329, -0.4937518, 3.042105, 1, 1, 1, 1, 1,
0.2071885, -0.7766026, 2.200293, 1, 1, 1, 1, 1,
0.2143344, 1.082529, 1.921377, 1, 1, 1, 1, 1,
0.2150827, 3.040316, 1.296716, 1, 1, 1, 1, 1,
0.2153661, 0.3758831, -0.1442464, 1, 1, 1, 1, 1,
0.2223036, 0.1279438, 1.683703, 1, 1, 1, 1, 1,
0.2242686, 0.533451, 2.206689, 1, 1, 1, 1, 1,
0.2284188, -0.4512836, 0.9267687, 1, 1, 1, 1, 1,
0.2342572, 0.392899, -1.750951, 1, 1, 1, 1, 1,
0.2364049, 0.03903812, 0.5264475, 1, 1, 1, 1, 1,
0.2386149, 0.5326798, -0.03696192, 1, 1, 1, 1, 1,
0.2398921, -1.130723, 1.848293, 1, 1, 1, 1, 1,
0.2434672, -0.7187795, 3.451732, 1, 1, 1, 1, 1,
0.2581536, 0.9250602, 0.6329829, 0, 0, 1, 1, 1,
0.2598548, 0.2974712, 1.582149, 1, 0, 0, 1, 1,
0.2617531, -1.289744, 3.92771, 1, 0, 0, 1, 1,
0.2672235, -0.2072146, 2.242485, 1, 0, 0, 1, 1,
0.271145, 1.16269, -0.7143494, 1, 0, 0, 1, 1,
0.2723075, -0.1267268, 1.860547, 1, 0, 0, 1, 1,
0.276063, -0.2830645, 1.560104, 0, 0, 0, 1, 1,
0.2781599, -0.08438027, 2.139361, 0, 0, 0, 1, 1,
0.279125, 0.4892789, 0.6968984, 0, 0, 0, 1, 1,
0.2791899, -0.5747094, 3.071422, 0, 0, 0, 1, 1,
0.2823649, -0.7226524, 3.773442, 0, 0, 0, 1, 1,
0.2877319, 2.538033, -0.32875, 0, 0, 0, 1, 1,
0.2896528, 0.218845, 1.693704, 0, 0, 0, 1, 1,
0.2907149, 0.3241641, 0.3167293, 1, 1, 1, 1, 1,
0.2960443, 0.8358327, -0.6047973, 1, 1, 1, 1, 1,
0.2974947, -0.9127308, 3.818817, 1, 1, 1, 1, 1,
0.2977584, -1.606794, 1.206384, 1, 1, 1, 1, 1,
0.2989528, -3.003567, 1.978434, 1, 1, 1, 1, 1,
0.2990369, 0.5163454, -1.01099, 1, 1, 1, 1, 1,
0.2993033, -0.9464183, 4.253136, 1, 1, 1, 1, 1,
0.301651, 0.1423353, -0.5462411, 1, 1, 1, 1, 1,
0.3029892, -0.3152404, 1.72688, 1, 1, 1, 1, 1,
0.3049514, 0.05957751, 1.098932, 1, 1, 1, 1, 1,
0.3056155, -1.256999, 3.18349, 1, 1, 1, 1, 1,
0.3063644, -1.170572, 2.532247, 1, 1, 1, 1, 1,
0.3103613, 0.3877237, 0.9402342, 1, 1, 1, 1, 1,
0.312367, -0.07168156, 3.787341, 1, 1, 1, 1, 1,
0.3147309, 2.297601, -1.125154, 1, 1, 1, 1, 1,
0.3178102, 0.7935373, -1.585777, 0, 0, 1, 1, 1,
0.3218755, -0.03805216, 1.160125, 1, 0, 0, 1, 1,
0.3221838, -1.102628, 1.659496, 1, 0, 0, 1, 1,
0.3281885, -0.4858289, 3.897434, 1, 0, 0, 1, 1,
0.3289877, 1.318161, -0.1491514, 1, 0, 0, 1, 1,
0.331841, -0.00560618, 0.03530638, 1, 0, 0, 1, 1,
0.333704, 0.2266576, 1.576082, 0, 0, 0, 1, 1,
0.3416153, -0.9117334, 1.917636, 0, 0, 0, 1, 1,
0.3420317, -0.8108889, 3.82191, 0, 0, 0, 1, 1,
0.3449432, -1.531565, 3.611747, 0, 0, 0, 1, 1,
0.3459402, -1.21576, 2.789434, 0, 0, 0, 1, 1,
0.3544277, 0.6802279, 0.9235732, 0, 0, 0, 1, 1,
0.3552321, -2.439302, 1.614488, 0, 0, 0, 1, 1,
0.3574161, -1.254046, 2.733901, 1, 1, 1, 1, 1,
0.3601529, -0.1845675, 2.59362, 1, 1, 1, 1, 1,
0.3604275, 0.007201595, 0.659034, 1, 1, 1, 1, 1,
0.3629144, 0.2832677, -0.3011295, 1, 1, 1, 1, 1,
0.3649336, -0.1504492, 2.185114, 1, 1, 1, 1, 1,
0.3666106, -1.336508, 2.342425, 1, 1, 1, 1, 1,
0.3691436, 1.73091, -0.8721094, 1, 1, 1, 1, 1,
0.3699113, -0.4991435, 2.291484, 1, 1, 1, 1, 1,
0.3709196, -0.1418496, 2.950063, 1, 1, 1, 1, 1,
0.3713901, -0.9452426, 1.989929, 1, 1, 1, 1, 1,
0.3718139, -1.133377, 3.681323, 1, 1, 1, 1, 1,
0.3720213, -0.6889057, 2.449081, 1, 1, 1, 1, 1,
0.3736064, 0.4753012, 0.0406298, 1, 1, 1, 1, 1,
0.3740297, -0.08917789, 2.57265, 1, 1, 1, 1, 1,
0.3769046, 1.673189, -0.5030513, 1, 1, 1, 1, 1,
0.3781096, -0.2504008, 2.376133, 0, 0, 1, 1, 1,
0.380971, -1.13261, 2.549864, 1, 0, 0, 1, 1,
0.3835013, -0.5010336, 3.059226, 1, 0, 0, 1, 1,
0.3841541, 0.03592756, 2.727508, 1, 0, 0, 1, 1,
0.3845936, -0.3396247, 3.059079, 1, 0, 0, 1, 1,
0.3851345, -1.27985, 1.545444, 1, 0, 0, 1, 1,
0.3866993, 0.4995535, 1.147871, 0, 0, 0, 1, 1,
0.3889122, -0.2082832, 1.781207, 0, 0, 0, 1, 1,
0.3940884, -0.8328906, 1.854996, 0, 0, 0, 1, 1,
0.3969515, -0.9156709, 3.280025, 0, 0, 0, 1, 1,
0.4027416, 0.7249086, 1.821608, 0, 0, 0, 1, 1,
0.4028104, -0.2094778, 2.656276, 0, 0, 0, 1, 1,
0.4030713, 0.07120842, 3.280756, 0, 0, 0, 1, 1,
0.4078994, 0.2899718, 0.1543744, 1, 1, 1, 1, 1,
0.4090536, 0.7804981, -0.3597546, 1, 1, 1, 1, 1,
0.4127121, 1.202933, 1.146265, 1, 1, 1, 1, 1,
0.4132611, -0.07253239, 1.766171, 1, 1, 1, 1, 1,
0.4142622, -0.7104401, 2.326178, 1, 1, 1, 1, 1,
0.4189081, 0.8004791, 1.12137, 1, 1, 1, 1, 1,
0.4200994, 0.4582112, -0.2596675, 1, 1, 1, 1, 1,
0.4244643, -0.4144509, 2.212153, 1, 1, 1, 1, 1,
0.4282863, -0.3224857, -0.5211405, 1, 1, 1, 1, 1,
0.4290435, -0.0890075, 1.475103, 1, 1, 1, 1, 1,
0.4361396, 0.4187621, 2.01164, 1, 1, 1, 1, 1,
0.4364944, -0.02515477, 1.072669, 1, 1, 1, 1, 1,
0.4373087, 1.517215, -0.2952779, 1, 1, 1, 1, 1,
0.4390004, -0.3207252, 0.8511342, 1, 1, 1, 1, 1,
0.4391406, -0.6487755, 4.220697, 1, 1, 1, 1, 1,
0.4399803, -0.3621504, 2.625447, 0, 0, 1, 1, 1,
0.4449171, 0.3117736, 0.8234379, 1, 0, 0, 1, 1,
0.44539, -0.449246, 1.581159, 1, 0, 0, 1, 1,
0.4512996, 1.526613, -0.666302, 1, 0, 0, 1, 1,
0.4540309, 1.091015, 1.526234, 1, 0, 0, 1, 1,
0.4546129, -0.9941226, 2.565302, 1, 0, 0, 1, 1,
0.4566684, -2.637271, 3.206351, 0, 0, 0, 1, 1,
0.4582085, 0.334267, -0.1458663, 0, 0, 0, 1, 1,
0.4585134, -0.9418628, 2.72417, 0, 0, 0, 1, 1,
0.4592013, 0.1711448, 1.925647, 0, 0, 0, 1, 1,
0.4600324, 2.334023, 1.84362, 0, 0, 0, 1, 1,
0.4620449, 0.7827729, 0.5268717, 0, 0, 0, 1, 1,
0.462351, 0.4434228, 0.2406726, 0, 0, 0, 1, 1,
0.4624009, 0.3290907, 1.854423, 1, 1, 1, 1, 1,
0.4638596, -0.2314128, 2.800903, 1, 1, 1, 1, 1,
0.4677186, -0.4781793, 1.081954, 1, 1, 1, 1, 1,
0.470507, 0.3621749, 0.7073393, 1, 1, 1, 1, 1,
0.4706624, 0.4364205, -0.6823428, 1, 1, 1, 1, 1,
0.473694, -0.2432213, 2.152138, 1, 1, 1, 1, 1,
0.482627, 1.265267, 0.6993285, 1, 1, 1, 1, 1,
0.4833286, -0.3841581, 2.637446, 1, 1, 1, 1, 1,
0.4847572, -0.7186375, 2.235465, 1, 1, 1, 1, 1,
0.485854, 0.9494103, 0.7976279, 1, 1, 1, 1, 1,
0.4864254, 0.50893, 0.2431977, 1, 1, 1, 1, 1,
0.4865153, -0.3373617, 2.546686, 1, 1, 1, 1, 1,
0.4881398, -0.1849341, 4.10751, 1, 1, 1, 1, 1,
0.4899807, -0.02801617, 1.801708, 1, 1, 1, 1, 1,
0.4976955, -1.637885, 4.258986, 1, 1, 1, 1, 1,
0.4980789, 1.956753, -0.5405558, 0, 0, 1, 1, 1,
0.4981452, -0.6829805, 3.480765, 1, 0, 0, 1, 1,
0.4991329, 0.1972691, 1.003069, 1, 0, 0, 1, 1,
0.5038825, -0.7638991, 2.099547, 1, 0, 0, 1, 1,
0.5056533, 1.287902, -0.213878, 1, 0, 0, 1, 1,
0.5100075, -1.254248, 3.292038, 1, 0, 0, 1, 1,
0.5117803, -0.2208105, 2.105697, 0, 0, 0, 1, 1,
0.5244887, 1.772043, 0.6555273, 0, 0, 0, 1, 1,
0.5305898, 1.232488, 0.8890594, 0, 0, 0, 1, 1,
0.5350074, 0.208842, 2.707895, 0, 0, 0, 1, 1,
0.5352623, 0.7996246, 0.1157836, 0, 0, 0, 1, 1,
0.5385961, 0.5414956, -0.5957367, 0, 0, 0, 1, 1,
0.5406114, -0.6299377, 3.602684, 0, 0, 0, 1, 1,
0.5512183, -0.7673002, 2.140792, 1, 1, 1, 1, 1,
0.5514473, 0.03565912, 2.61121, 1, 1, 1, 1, 1,
0.5519275, 0.5000078, 2.021389, 1, 1, 1, 1, 1,
0.5537442, -1.670946, 3.735079, 1, 1, 1, 1, 1,
0.554882, -2.027751, 1.867057, 1, 1, 1, 1, 1,
0.5553589, 0.6371223, 3.833261, 1, 1, 1, 1, 1,
0.5555917, -0.3937561, 3.645984, 1, 1, 1, 1, 1,
0.5584685, -0.4483273, 1.53366, 1, 1, 1, 1, 1,
0.5601563, 0.1922117, 1.738734, 1, 1, 1, 1, 1,
0.5603679, 1.389543, -0.7308715, 1, 1, 1, 1, 1,
0.5623561, 0.9079947, 0.1676226, 1, 1, 1, 1, 1,
0.5631067, 0.4497703, 1.097768, 1, 1, 1, 1, 1,
0.5634183, 0.4640352, 0.7820502, 1, 1, 1, 1, 1,
0.5634485, -0.2685631, 1.769094, 1, 1, 1, 1, 1,
0.5662893, 0.1535124, 0.2076745, 1, 1, 1, 1, 1,
0.569625, -1.042275, 3.393263, 0, 0, 1, 1, 1,
0.5717368, 0.8693445, 0.9530508, 1, 0, 0, 1, 1,
0.5729448, 0.08449079, -0.0271504, 1, 0, 0, 1, 1,
0.5767424, -0.7927506, 1.397902, 1, 0, 0, 1, 1,
0.5773152, -1.487485, 4.234372, 1, 0, 0, 1, 1,
0.5831367, -0.2932045, 0.3930646, 1, 0, 0, 1, 1,
0.5873649, -0.5255951, 2.601006, 0, 0, 0, 1, 1,
0.5890941, -0.4062111, 2.790802, 0, 0, 0, 1, 1,
0.5950715, -0.3014721, 0.7145603, 0, 0, 0, 1, 1,
0.5992811, -0.4246145, 1.757385, 0, 0, 0, 1, 1,
0.6034307, -0.0938651, 1.547516, 0, 0, 0, 1, 1,
0.603826, 0.3025107, -0.1605176, 0, 0, 0, 1, 1,
0.6050059, 0.5542564, 2.188161, 0, 0, 0, 1, 1,
0.6107867, 0.1447509, -0.3133548, 1, 1, 1, 1, 1,
0.6149381, 0.4314786, -0.2974869, 1, 1, 1, 1, 1,
0.6172793, 0.7247517, 0.7809474, 1, 1, 1, 1, 1,
0.6206448, -1.53236, 1.022682, 1, 1, 1, 1, 1,
0.62572, 0.8329453, 0.2712772, 1, 1, 1, 1, 1,
0.6266876, -1.018938, 2.270645, 1, 1, 1, 1, 1,
0.6281121, 1.152217, 0.1383513, 1, 1, 1, 1, 1,
0.6315177, 1.653185, 1.379994, 1, 1, 1, 1, 1,
0.6336368, -0.7402761, 1.89111, 1, 1, 1, 1, 1,
0.6341326, 1.033972, -0.6991596, 1, 1, 1, 1, 1,
0.6388534, -0.187457, 0.809974, 1, 1, 1, 1, 1,
0.6395745, 0.6188763, 1.719495, 1, 1, 1, 1, 1,
0.6420212, 0.1057937, 1.775003, 1, 1, 1, 1, 1,
0.6431451, -0.644086, 2.110467, 1, 1, 1, 1, 1,
0.6452279, -0.4689713, 4.329264, 1, 1, 1, 1, 1,
0.6592394, -0.3356112, 2.868871, 0, 0, 1, 1, 1,
0.6627838, 0.01316423, 1.733544, 1, 0, 0, 1, 1,
0.6689166, 0.8643379, 0.6255904, 1, 0, 0, 1, 1,
0.6785501, 0.2564915, 1.691525, 1, 0, 0, 1, 1,
0.6788182, -1.123018, 1.947492, 1, 0, 0, 1, 1,
0.6813631, 1.30322, -0.1318299, 1, 0, 0, 1, 1,
0.6823233, 0.07879683, 1.611055, 0, 0, 0, 1, 1,
0.6830431, -0.05016368, 1.673314, 0, 0, 0, 1, 1,
0.6832042, -0.2291926, 1.900627, 0, 0, 0, 1, 1,
0.690784, -0.8530464, 3.81081, 0, 0, 0, 1, 1,
0.6914298, -0.1234142, 1.391743, 0, 0, 0, 1, 1,
0.6959794, -0.2593708, 2.040092, 0, 0, 0, 1, 1,
0.696386, -0.04861439, 0.5833887, 0, 0, 0, 1, 1,
0.6985599, -1.486556, 1.780982, 1, 1, 1, 1, 1,
0.6992794, -1.677523, 2.420643, 1, 1, 1, 1, 1,
0.7019585, 1.662087, 2.320893, 1, 1, 1, 1, 1,
0.7027457, 0.4628308, 0.6512889, 1, 1, 1, 1, 1,
0.7058388, 0.03113043, 1.132378, 1, 1, 1, 1, 1,
0.7086548, -0.5926692, 3.19122, 1, 1, 1, 1, 1,
0.7142284, 0.03158561, 0.3351101, 1, 1, 1, 1, 1,
0.718994, -1.506847, 2.351746, 1, 1, 1, 1, 1,
0.7198832, 1.867929, 1.714748, 1, 1, 1, 1, 1,
0.7238291, -0.5712878, 0.7619072, 1, 1, 1, 1, 1,
0.731486, 1.110249, 1.805295, 1, 1, 1, 1, 1,
0.7325673, 0.5099326, 0.4995852, 1, 1, 1, 1, 1,
0.7403868, 1.208087, 0.003771302, 1, 1, 1, 1, 1,
0.7444797, -0.7208868, 2.076756, 1, 1, 1, 1, 1,
0.7513503, 0.1735536, 3.599859, 1, 1, 1, 1, 1,
0.7545103, -1.367776, 1.52253, 0, 0, 1, 1, 1,
0.7587054, 0.1715196, 0.8815491, 1, 0, 0, 1, 1,
0.7604139, 0.8280555, 0.6359414, 1, 0, 0, 1, 1,
0.7734331, -0.8639375, 1.853698, 1, 0, 0, 1, 1,
0.7773644, 0.5395319, 0.2195507, 1, 0, 0, 1, 1,
0.7785594, -1.591396, 3.438356, 1, 0, 0, 1, 1,
0.7796133, 1.22661, 2.10429, 0, 0, 0, 1, 1,
0.7814397, -0.4932529, 2.802512, 0, 0, 0, 1, 1,
0.788733, -0.8112962, 1.625648, 0, 0, 0, 1, 1,
0.7888693, 0.4174018, 0.9544831, 0, 0, 0, 1, 1,
0.7901693, -1.5731, 1.657704, 0, 0, 0, 1, 1,
0.7901694, 0.07692268, 2.198644, 0, 0, 0, 1, 1,
0.7966253, 0.07557701, 1.721573, 0, 0, 0, 1, 1,
0.7983965, -0.3953997, 0.5771843, 1, 1, 1, 1, 1,
0.7984694, -1.174084, 2.291823, 1, 1, 1, 1, 1,
0.8033273, 0.002568683, 3.278466, 1, 1, 1, 1, 1,
0.8038617, -0.9431981, 3.048575, 1, 1, 1, 1, 1,
0.8050923, -1.721639, 3.476316, 1, 1, 1, 1, 1,
0.8091553, -0.1018504, 1.397322, 1, 1, 1, 1, 1,
0.8098498, 0.79876, 2.175348, 1, 1, 1, 1, 1,
0.8131519, 1.155393, 1.319278, 1, 1, 1, 1, 1,
0.8162749, 0.8704338, 0.1150465, 1, 1, 1, 1, 1,
0.8163904, -0.8153607, 2.258679, 1, 1, 1, 1, 1,
0.8191309, 1.707116, 0.2610509, 1, 1, 1, 1, 1,
0.8202723, 0.5199085, -0.06016839, 1, 1, 1, 1, 1,
0.8215256, 1.618822, 0.2164412, 1, 1, 1, 1, 1,
0.8216056, 0.4973717, 1.435663, 1, 1, 1, 1, 1,
0.8222449, -0.5982223, 1.718311, 1, 1, 1, 1, 1,
0.8226073, 0.342809, -0.1412329, 0, 0, 1, 1, 1,
0.825289, 0.6658282, 1.803812, 1, 0, 0, 1, 1,
0.8400078, -1.13664, 2.366819, 1, 0, 0, 1, 1,
0.8443074, 1.210206, -0.5201688, 1, 0, 0, 1, 1,
0.8627188, -0.5284235, 1.921722, 1, 0, 0, 1, 1,
0.8641215, -1.659024, 1.323349, 1, 0, 0, 1, 1,
0.8659755, 1.150716, 0.8029491, 0, 0, 0, 1, 1,
0.8662623, 0.3340813, -0.08941164, 0, 0, 0, 1, 1,
0.8711295, -0.7866282, 1.462705, 0, 0, 0, 1, 1,
0.8788401, -0.8753406, 0.8273543, 0, 0, 0, 1, 1,
0.8809409, -0.5023187, 3.575163, 0, 0, 0, 1, 1,
0.8816699, -0.07825141, 0.9712344, 0, 0, 0, 1, 1,
0.8820403, -0.6445472, 2.650292, 0, 0, 0, 1, 1,
0.8871316, -1.269944, 3.152511, 1, 1, 1, 1, 1,
0.89555, -0.5966269, 3.777412, 1, 1, 1, 1, 1,
0.9027032, -0.2094068, 1.517428, 1, 1, 1, 1, 1,
0.9033499, -1.388581, 2.75652, 1, 1, 1, 1, 1,
0.9060641, -1.56842, 2.293321, 1, 1, 1, 1, 1,
0.9074957, 0.9308141, 0.6297848, 1, 1, 1, 1, 1,
0.9154807, -0.2034786, 2.574607, 1, 1, 1, 1, 1,
0.9172365, -0.3481282, 1.88513, 1, 1, 1, 1, 1,
0.9235344, -0.7885907, 0.7486232, 1, 1, 1, 1, 1,
0.925593, -0.6695608, 1.947071, 1, 1, 1, 1, 1,
0.9285436, 1.096678, -1.000621, 1, 1, 1, 1, 1,
0.9346557, 1.609972, 0.7601157, 1, 1, 1, 1, 1,
0.93573, -0.577768, 1.481039, 1, 1, 1, 1, 1,
0.9471533, -0.7844715, 2.120891, 1, 1, 1, 1, 1,
0.9511355, 0.5196301, 1.891535, 1, 1, 1, 1, 1,
0.9627184, 0.9140068, 0.2346689, 0, 0, 1, 1, 1,
0.9652371, 1.010325, 0.695907, 1, 0, 0, 1, 1,
0.9670177, 0.8201845, 0.5948369, 1, 0, 0, 1, 1,
0.9727446, 0.6998025, 1.478353, 1, 0, 0, 1, 1,
0.9734207, -0.2659837, 1.328098, 1, 0, 0, 1, 1,
0.9874349, -0.3170027, 1.667286, 1, 0, 0, 1, 1,
0.9874905, 3.149864, 0.7115579, 0, 0, 0, 1, 1,
1.001768, -0.5154731, 2.260263, 0, 0, 0, 1, 1,
1.004231, 1.024042, 0.4001301, 0, 0, 0, 1, 1,
1.008244, -1.353803, 3.635197, 0, 0, 0, 1, 1,
1.024266, -1.196701, 2.399097, 0, 0, 0, 1, 1,
1.026768, 0.3891752, -0.6854586, 0, 0, 0, 1, 1,
1.027059, -0.3049555, 3.275237, 0, 0, 0, 1, 1,
1.02982, -0.2807787, 1.897177, 1, 1, 1, 1, 1,
1.035509, 0.7364032, 0.5550261, 1, 1, 1, 1, 1,
1.038292, -0.2657954, 2.078928, 1, 1, 1, 1, 1,
1.053161, -1.110047, 2.85308, 1, 1, 1, 1, 1,
1.053333, 2.000456, -0.7685004, 1, 1, 1, 1, 1,
1.053759, 1.304546, 0.9948039, 1, 1, 1, 1, 1,
1.058701, 0.4023254, 0.9882465, 1, 1, 1, 1, 1,
1.058748, -0.3989537, 2.634061, 1, 1, 1, 1, 1,
1.06141, -0.4319853, 2.07075, 1, 1, 1, 1, 1,
1.068637, -0.4161419, 1.065924, 1, 1, 1, 1, 1,
1.075741, -0.6779584, 2.209424, 1, 1, 1, 1, 1,
1.089285, 0.8296577, -0.6662384, 1, 1, 1, 1, 1,
1.092098, 0.153589, -0.1818715, 1, 1, 1, 1, 1,
1.097301, 0.7470432, 0.7668755, 1, 1, 1, 1, 1,
1.103583, 1.125431, -0.8771725, 1, 1, 1, 1, 1,
1.111002, -1.545811, 2.111365, 0, 0, 1, 1, 1,
1.111053, 0.006413633, 1.738767, 1, 0, 0, 1, 1,
1.122671, -1.487433, 4.423268, 1, 0, 0, 1, 1,
1.123975, 0.2426128, 0.522813, 1, 0, 0, 1, 1,
1.125275, 1.42603, 2.226595, 1, 0, 0, 1, 1,
1.132226, 0.3303575, 0.7370691, 1, 0, 0, 1, 1,
1.139322, 0.5282258, 2.891402, 0, 0, 0, 1, 1,
1.140579, -2.103768, 0.6737908, 0, 0, 0, 1, 1,
1.141352, -1.48008, 3.202072, 0, 0, 0, 1, 1,
1.142485, -0.1040313, 1.411547, 0, 0, 0, 1, 1,
1.144301, 1.873805, -0.5639232, 0, 0, 0, 1, 1,
1.144803, 0.09215691, 0.7365135, 0, 0, 0, 1, 1,
1.155001, -0.0735206, 2.870895, 0, 0, 0, 1, 1,
1.160455, 1.752093, 0.8532628, 1, 1, 1, 1, 1,
1.166158, -1.017212, 0.9963449, 1, 1, 1, 1, 1,
1.170302, -0.9619233, 3.374581, 1, 1, 1, 1, 1,
1.179141, 0.3527779, 0.7202263, 1, 1, 1, 1, 1,
1.184117, 2.473906, 0.4251177, 1, 1, 1, 1, 1,
1.195582, 1.983911, -0.6575723, 1, 1, 1, 1, 1,
1.214921, 1.169578, 1.613426, 1, 1, 1, 1, 1,
1.215019, -0.1574378, 0.7671356, 1, 1, 1, 1, 1,
1.223509, -0.2836148, 3.607906, 1, 1, 1, 1, 1,
1.224053, 0.4329619, 1.412344, 1, 1, 1, 1, 1,
1.22477, -1.61325, 1.435747, 1, 1, 1, 1, 1,
1.231828, -0.8405003, 1.869108, 1, 1, 1, 1, 1,
1.240192, -0.04819556, 3.379155, 1, 1, 1, 1, 1,
1.240579, -0.3969104, 0.6093346, 1, 1, 1, 1, 1,
1.242319, 0.8515357, 2.342818, 1, 1, 1, 1, 1,
1.243332, -2.574219, 4.506876, 0, 0, 1, 1, 1,
1.244406, -0.5916834, 2.490815, 1, 0, 0, 1, 1,
1.262891, -1.279182, 3.395113, 1, 0, 0, 1, 1,
1.267076, -0.06354095, 0.8562284, 1, 0, 0, 1, 1,
1.269717, -1.480898, 3.302861, 1, 0, 0, 1, 1,
1.270404, -0.8494066, 3.632843, 1, 0, 0, 1, 1,
1.27275, 0.1040794, 2.996604, 0, 0, 0, 1, 1,
1.276591, -0.05273408, -0.03550027, 0, 0, 0, 1, 1,
1.293835, -0.5618119, 1.270052, 0, 0, 0, 1, 1,
1.305578, 1.328973, 0.9376216, 0, 0, 0, 1, 1,
1.307878, 0.7371389, 0.4141075, 0, 0, 0, 1, 1,
1.329446, -0.5833617, 0.4655781, 0, 0, 0, 1, 1,
1.332874, 0.1226484, 0.6603122, 0, 0, 0, 1, 1,
1.338502, -0.4523647, 1.078936, 1, 1, 1, 1, 1,
1.341104, 0.1775944, 0.2018928, 1, 1, 1, 1, 1,
1.348077, -0.1949877, 1.519428, 1, 1, 1, 1, 1,
1.354895, 1.15806, 2.464274, 1, 1, 1, 1, 1,
1.370016, 1.893187, 1.975464, 1, 1, 1, 1, 1,
1.383445, 0.1631784, 4.451451, 1, 1, 1, 1, 1,
1.384627, 0.115559, 1.860846, 1, 1, 1, 1, 1,
1.389107, -1.187415, 1.556317, 1, 1, 1, 1, 1,
1.397931, -0.9945596, 3.534076, 1, 1, 1, 1, 1,
1.413292, 0.8091177, 1.177689, 1, 1, 1, 1, 1,
1.418382, -0.5176678, 3.428236, 1, 1, 1, 1, 1,
1.419279, 1.205988, 0.3859663, 1, 1, 1, 1, 1,
1.447535, -1.588274, 3.421476, 1, 1, 1, 1, 1,
1.449577, 0.0001949429, -0.02631621, 1, 1, 1, 1, 1,
1.454342, -0.6238058, 1.850158, 1, 1, 1, 1, 1,
1.457361, 0.4309052, 1.153565, 0, 0, 1, 1, 1,
1.471524, -0.1208065, 1.447221, 1, 0, 0, 1, 1,
1.480281, -0.8897536, 2.50712, 1, 0, 0, 1, 1,
1.486032, 0.1140964, -0.0878238, 1, 0, 0, 1, 1,
1.489247, 1.747585, -0.1073338, 1, 0, 0, 1, 1,
1.499267, 0.9932558, 0.8398678, 1, 0, 0, 1, 1,
1.501751, -0.5955628, 2.799179, 0, 0, 0, 1, 1,
1.505209, 0.1311731, 0.4013415, 0, 0, 0, 1, 1,
1.509647, -0.1148067, 2.606975, 0, 0, 0, 1, 1,
1.516595, -0.1864168, 1.455205, 0, 0, 0, 1, 1,
1.518133, 0.5707051, 0.165776, 0, 0, 0, 1, 1,
1.536362, 0.721468, 0.2999868, 0, 0, 0, 1, 1,
1.5601, -1.295032, 1.974391, 0, 0, 0, 1, 1,
1.566877, -0.3234707, 1.372036, 1, 1, 1, 1, 1,
1.580893, -1.07801, 1.817549, 1, 1, 1, 1, 1,
1.605423, 1.620868, -0.7188715, 1, 1, 1, 1, 1,
1.622866, 1.131839, -0.9167122, 1, 1, 1, 1, 1,
1.624118, -0.8926118, 1.649524, 1, 1, 1, 1, 1,
1.625744, -1.887364, 2.717735, 1, 1, 1, 1, 1,
1.627678, 0.3157879, 1.168928, 1, 1, 1, 1, 1,
1.645797, 0.5257832, 0.5238706, 1, 1, 1, 1, 1,
1.64621, -1.106647, 1.522667, 1, 1, 1, 1, 1,
1.655253, -1.255641, 2.185556, 1, 1, 1, 1, 1,
1.65789, -0.7312379, 1.354788, 1, 1, 1, 1, 1,
1.671583, 0.3929166, 0.05400108, 1, 1, 1, 1, 1,
1.672754, 2.320781, 1.078852, 1, 1, 1, 1, 1,
1.68754, -0.407951, -0.1228354, 1, 1, 1, 1, 1,
1.726407, 0.3689954, 0.2977359, 1, 1, 1, 1, 1,
1.727073, -0.5553213, 1.156748, 0, 0, 1, 1, 1,
1.733619, 1.280822, 0.8075915, 1, 0, 0, 1, 1,
1.759681, -1.460489, 3.034124, 1, 0, 0, 1, 1,
1.771057, -2.099546, 0.8967245, 1, 0, 0, 1, 1,
1.837788, -0.1918197, 1.770276, 1, 0, 0, 1, 1,
1.838643, 1.749083, -0.02616727, 1, 0, 0, 1, 1,
1.845207, 0.7767683, 3.251158, 0, 0, 0, 1, 1,
1.860772, 2.294327, 1.731548, 0, 0, 0, 1, 1,
1.865804, 2.02783, 0.03666276, 0, 0, 0, 1, 1,
1.870892, -0.273094, 2.953905, 0, 0, 0, 1, 1,
1.878168, 0.1835996, 2.618044, 0, 0, 0, 1, 1,
1.906827, 0.7635211, 2.68288, 0, 0, 0, 1, 1,
1.942991, 0.2751116, 1.437997, 0, 0, 0, 1, 1,
1.951513, 0.6306251, 1.742949, 1, 1, 1, 1, 1,
1.967148, 0.382465, 1.200416, 1, 1, 1, 1, 1,
1.974999, 0.2554361, 2.598292, 1, 1, 1, 1, 1,
1.984271, 0.2460761, 2.374172, 1, 1, 1, 1, 1,
1.997061, -0.6406626, 2.640271, 1, 1, 1, 1, 1,
2.02605, -1.119915, 2.170733, 1, 1, 1, 1, 1,
2.056375, 0.06560369, 1.188784, 1, 1, 1, 1, 1,
2.110072, -0.5835372, 2.737001, 1, 1, 1, 1, 1,
2.117654, -2.920523, 0.601379, 1, 1, 1, 1, 1,
2.123981, 1.063232, 1.958577, 1, 1, 1, 1, 1,
2.138537, -1.463438, 2.776781, 1, 1, 1, 1, 1,
2.153316, -0.3968365, 2.550261, 1, 1, 1, 1, 1,
2.160666, 1.032606, 0.6635404, 1, 1, 1, 1, 1,
2.171751, 1.560182, 1.305388, 1, 1, 1, 1, 1,
2.188856, 2.172738, 1.527272, 1, 1, 1, 1, 1,
2.218932, 0.3931654, 2.231886, 0, 0, 1, 1, 1,
2.235481, -0.7677556, 0.9449491, 1, 0, 0, 1, 1,
2.24618, 0.7281756, 0.4157536, 1, 0, 0, 1, 1,
2.294324, -0.3886384, 3.887942, 1, 0, 0, 1, 1,
2.301839, 1.67358, 2.199105, 1, 0, 0, 1, 1,
2.319674, -0.3414783, 1.892958, 1, 0, 0, 1, 1,
2.323419, 0.03983822, 0.704379, 0, 0, 0, 1, 1,
2.352708, -1.008946, 1.533136, 0, 0, 0, 1, 1,
2.43259, 0.6505067, 0.0557713, 0, 0, 0, 1, 1,
2.47711, -0.5742474, 2.676229, 0, 0, 0, 1, 1,
2.499369, 0.590977, 0.350742, 0, 0, 0, 1, 1,
2.541938, 1.723284, 0.8615781, 0, 0, 0, 1, 1,
2.554473, 0.204281, 0.03111629, 0, 0, 0, 1, 1,
2.613688, 0.6486782, 2.826118, 1, 1, 1, 1, 1,
2.651659, -1.916959, 2.462154, 1, 1, 1, 1, 1,
2.687228, 0.240031, 0.7984273, 1, 1, 1, 1, 1,
2.768401, 1.377871, -0.2780656, 1, 1, 1, 1, 1,
2.864068, -1.648512, 1.327389, 1, 1, 1, 1, 1,
2.872737, 0.1431497, 1.06273, 1, 1, 1, 1, 1,
3.089049, -0.2607242, 1.185497, 1, 1, 1, 1, 1
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
var radius = 9.410525;
var distance = 33.05407;
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
mvMatrix.translate( 0.1927834, -0.07314825, 0.5105641 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05407);
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
