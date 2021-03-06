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
-4.028386, 0.6725424, -1.399831, 1, 0, 0, 1,
-3.290213, -0.4513971, 0.03694126, 1, 0.007843138, 0, 1,
-3.104472, 1.231589, -0.7223173, 1, 0.01176471, 0, 1,
-3.046436, -0.5747287, -0.5922186, 1, 0.01960784, 0, 1,
-2.901639, 0.2706702, -1.315092, 1, 0.02352941, 0, 1,
-2.780075, 1.981772, -1.069442, 1, 0.03137255, 0, 1,
-2.702121, -0.5311309, -1.913311, 1, 0.03529412, 0, 1,
-2.617602, -1.207756, -3.044217, 1, 0.04313726, 0, 1,
-2.58826, -0.6651239, -3.749455, 1, 0.04705882, 0, 1,
-2.483038, 0.5105868, -0.9184531, 1, 0.05490196, 0, 1,
-2.420022, 0.8046826, -0.6655665, 1, 0.05882353, 0, 1,
-2.339526, 0.5293503, -2.440215, 1, 0.06666667, 0, 1,
-2.335981, 0.2477335, -1.390789, 1, 0.07058824, 0, 1,
-2.202219, -0.584971, -1.385459, 1, 0.07843138, 0, 1,
-2.188557, -0.1747856, -2.941792, 1, 0.08235294, 0, 1,
-2.157991, 1.042955, -2.597457, 1, 0.09019608, 0, 1,
-2.120388, -1.248789, -2.799189, 1, 0.09411765, 0, 1,
-2.095058, 1.41475, -1.249212, 1, 0.1019608, 0, 1,
-2.06806, 0.8892951, -0.2962098, 1, 0.1098039, 0, 1,
-2.042692, -1.415624, -1.583815, 1, 0.1137255, 0, 1,
-2.038401, -0.7053128, -1.819186, 1, 0.1215686, 0, 1,
-2.032527, 1.614862, -1.056856, 1, 0.1254902, 0, 1,
-2.022506, -0.4821777, -2.088148, 1, 0.1333333, 0, 1,
-2.001129, -0.4664975, -1.761496, 1, 0.1372549, 0, 1,
-1.967863, 0.4006067, -0.5829116, 1, 0.145098, 0, 1,
-1.953369, 0.5353754, -0.8769484, 1, 0.1490196, 0, 1,
-1.943604, 0.7719526, -0.5637715, 1, 0.1568628, 0, 1,
-1.935804, 0.2907867, -2.313684, 1, 0.1607843, 0, 1,
-1.934752, 1.1855, -3.080917, 1, 0.1686275, 0, 1,
-1.896423, -0.9320825, 1.019256, 1, 0.172549, 0, 1,
-1.892117, 0.2492873, -2.324505, 1, 0.1803922, 0, 1,
-1.843641, 0.981281, -1.059137, 1, 0.1843137, 0, 1,
-1.834141, 0.5171482, -0.3712021, 1, 0.1921569, 0, 1,
-1.809912, -0.2656768, -4.22783, 1, 0.1960784, 0, 1,
-1.808822, 0.4520357, -2.762068, 1, 0.2039216, 0, 1,
-1.807551, 0.25311, -2.869922, 1, 0.2117647, 0, 1,
-1.797195, -0.1336532, -3.141313, 1, 0.2156863, 0, 1,
-1.779258, -0.4009695, -1.242854, 1, 0.2235294, 0, 1,
-1.773206, -0.6895214, -1.392811, 1, 0.227451, 0, 1,
-1.771148, 1.156727, 0.1860529, 1, 0.2352941, 0, 1,
-1.770808, -0.9424075, -2.898012, 1, 0.2392157, 0, 1,
-1.763973, 0.2972725, -0.940083, 1, 0.2470588, 0, 1,
-1.754427, -0.3468831, -2.715055, 1, 0.2509804, 0, 1,
-1.753746, 1.471754, -1.134809, 1, 0.2588235, 0, 1,
-1.746978, -1.648108, -1.789521, 1, 0.2627451, 0, 1,
-1.733974, 0.2562521, 0.9887763, 1, 0.2705882, 0, 1,
-1.714043, 0.2432826, -1.407824, 1, 0.2745098, 0, 1,
-1.713561, -0.8261958, -1.046666, 1, 0.282353, 0, 1,
-1.693906, 0.7918898, -1.028334, 1, 0.2862745, 0, 1,
-1.667485, -1.228088, -4.165637, 1, 0.2941177, 0, 1,
-1.660358, 1.15618, -3.299223, 1, 0.3019608, 0, 1,
-1.651946, 0.7995383, -1.222898, 1, 0.3058824, 0, 1,
-1.641461, 0.6187589, -1.209996, 1, 0.3137255, 0, 1,
-1.614558, 0.397542, -1.899407, 1, 0.3176471, 0, 1,
-1.581337, 0.3979703, -0.8292233, 1, 0.3254902, 0, 1,
-1.563305, -0.4767673, -1.58406, 1, 0.3294118, 0, 1,
-1.547442, 1.298201, -2.138384, 1, 0.3372549, 0, 1,
-1.544996, -0.4907894, -0.4778659, 1, 0.3411765, 0, 1,
-1.539343, 0.1066108, -0.5757807, 1, 0.3490196, 0, 1,
-1.536468, -0.4703279, -1.710852, 1, 0.3529412, 0, 1,
-1.531271, -0.2305062, -1.816359, 1, 0.3607843, 0, 1,
-1.527847, 0.1335189, -0.7576609, 1, 0.3647059, 0, 1,
-1.521451, -0.2534074, -0.8101628, 1, 0.372549, 0, 1,
-1.515359, -1.32599, -1.760274, 1, 0.3764706, 0, 1,
-1.49702, 1.484698, 0.4630845, 1, 0.3843137, 0, 1,
-1.48441, 0.6505039, 0.6500624, 1, 0.3882353, 0, 1,
-1.470757, 0.534914, -1.564577, 1, 0.3960784, 0, 1,
-1.46096, 1.152687, -0.9530241, 1, 0.4039216, 0, 1,
-1.452827, -1.406827, -0.5597299, 1, 0.4078431, 0, 1,
-1.447596, -0.2535597, -1.955976, 1, 0.4156863, 0, 1,
-1.433083, -0.3398209, 1.665896, 1, 0.4196078, 0, 1,
-1.42413, -1.256201, -3.637177, 1, 0.427451, 0, 1,
-1.414234, -1.111839, -3.121055, 1, 0.4313726, 0, 1,
-1.394884, -0.2278256, -1.975472, 1, 0.4392157, 0, 1,
-1.377617, -1.056584, -3.015684, 1, 0.4431373, 0, 1,
-1.362271, 0.8125319, -1.52249, 1, 0.4509804, 0, 1,
-1.360073, 0.9646316, -0.3164855, 1, 0.454902, 0, 1,
-1.356948, 0.5769097, -1.335648, 1, 0.4627451, 0, 1,
-1.353448, -0.7760693, -1.333509, 1, 0.4666667, 0, 1,
-1.349487, -0.03522282, -0.8479932, 1, 0.4745098, 0, 1,
-1.347971, 0.4103354, -2.720995, 1, 0.4784314, 0, 1,
-1.345868, -1.712942, -2.256151, 1, 0.4862745, 0, 1,
-1.343023, -0.2889195, -3.401128, 1, 0.4901961, 0, 1,
-1.341491, -1.464055, -1.867413, 1, 0.4980392, 0, 1,
-1.340873, 1.154772, -0.9891581, 1, 0.5058824, 0, 1,
-1.324345, -0.924894, -1.904186, 1, 0.509804, 0, 1,
-1.322435, 0.2893221, -2.436142, 1, 0.5176471, 0, 1,
-1.312429, -0.5225955, -0.7217823, 1, 0.5215687, 0, 1,
-1.30102, 1.169924, 0.1035617, 1, 0.5294118, 0, 1,
-1.297994, -1.95079, -2.704468, 1, 0.5333334, 0, 1,
-1.294437, -0.1964319, -2.221706, 1, 0.5411765, 0, 1,
-1.287991, -0.6211221, -3.041174, 1, 0.5450981, 0, 1,
-1.285287, 0.6130655, -1.96739, 1, 0.5529412, 0, 1,
-1.284169, 0.8729739, -0.1730243, 1, 0.5568628, 0, 1,
-1.275951, 0.5863149, 0.6417406, 1, 0.5647059, 0, 1,
-1.27579, 0.0260476, -0.4482922, 1, 0.5686275, 0, 1,
-1.275483, -1.07803, -0.5570536, 1, 0.5764706, 0, 1,
-1.271819, 0.2954538, -1.897252, 1, 0.5803922, 0, 1,
-1.267319, -0.6897491, -0.804768, 1, 0.5882353, 0, 1,
-1.255778, -0.4710853, -2.237299, 1, 0.5921569, 0, 1,
-1.253973, 1.721187, -0.2434156, 1, 0.6, 0, 1,
-1.248754, -0.4120158, -0.6651605, 1, 0.6078432, 0, 1,
-1.238164, 0.3832306, -2.939529, 1, 0.6117647, 0, 1,
-1.228919, 0.2719725, -1.79049, 1, 0.6196079, 0, 1,
-1.220256, 1.223153, 1.222846, 1, 0.6235294, 0, 1,
-1.21069, -0.0626023, -3.080124, 1, 0.6313726, 0, 1,
-1.207836, -1.313548, -2.489521, 1, 0.6352941, 0, 1,
-1.20543, 2.481283, 1.745545, 1, 0.6431373, 0, 1,
-1.204168, 0.05702452, -0.3441115, 1, 0.6470588, 0, 1,
-1.203507, -0.3300019, 0.8573887, 1, 0.654902, 0, 1,
-1.196331, 0.9531833, -1.635612, 1, 0.6588235, 0, 1,
-1.195327, -0.9829004, -0.9979319, 1, 0.6666667, 0, 1,
-1.180602, -0.08915313, -1.374839, 1, 0.6705883, 0, 1,
-1.169713, 0.1647296, -2.485736, 1, 0.6784314, 0, 1,
-1.169289, -0.6644055, -2.34885, 1, 0.682353, 0, 1,
-1.157971, -0.2500415, -3.036427, 1, 0.6901961, 0, 1,
-1.156547, 0.09473308, -1.024693, 1, 0.6941177, 0, 1,
-1.153592, 1.02204, -0.9571835, 1, 0.7019608, 0, 1,
-1.149045, 1.925496, -0.1929853, 1, 0.7098039, 0, 1,
-1.14523, -0.9195776, -3.662597, 1, 0.7137255, 0, 1,
-1.14484, -0.912132, -2.875244, 1, 0.7215686, 0, 1,
-1.141632, 0.3746841, -1.697987, 1, 0.7254902, 0, 1,
-1.137542, -0.7568811, -1.322706, 1, 0.7333333, 0, 1,
-1.12287, -0.8249722, -4.220369, 1, 0.7372549, 0, 1,
-1.119727, -0.7541051, -2.231686, 1, 0.7450981, 0, 1,
-1.116341, 0.09345736, -0.8172217, 1, 0.7490196, 0, 1,
-1.112435, 0.6221921, 0.4911528, 1, 0.7568628, 0, 1,
-1.10682, -1.081612, -3.824855, 1, 0.7607843, 0, 1,
-1.088299, 0.9231225, -1.037585, 1, 0.7686275, 0, 1,
-1.076453, 2.040538, 0.563872, 1, 0.772549, 0, 1,
-1.072711, -0.6273684, -0.5225204, 1, 0.7803922, 0, 1,
-1.068641, 0.4484006, -0.4716123, 1, 0.7843137, 0, 1,
-1.060676, -3.356266, -3.902204, 1, 0.7921569, 0, 1,
-1.057072, 0.8566384, -1.002486, 1, 0.7960784, 0, 1,
-1.051758, 1.072466, 0.1967386, 1, 0.8039216, 0, 1,
-1.048487, 0.5155153, 0.2874195, 1, 0.8117647, 0, 1,
-1.043324, -0.3822275, -1.460268, 1, 0.8156863, 0, 1,
-1.039384, 0.8568286, -0.3033566, 1, 0.8235294, 0, 1,
-1.037113, 2.176927, 0.6716135, 1, 0.827451, 0, 1,
-1.037014, -1.208093, -1.781394, 1, 0.8352941, 0, 1,
-1.036836, 0.3546606, -0.4799335, 1, 0.8392157, 0, 1,
-1.030663, 1.361258, -1.802298, 1, 0.8470588, 0, 1,
-1.022117, -0.4687751, -1.929285, 1, 0.8509804, 0, 1,
-1.020057, -1.485425, -1.514038, 1, 0.8588235, 0, 1,
-1.018812, 1.143073, -0.9263248, 1, 0.8627451, 0, 1,
-1.017471, 0.6671444, 0.4165672, 1, 0.8705882, 0, 1,
-1.008816, 0.0631996, -2.50601, 1, 0.8745098, 0, 1,
-1.007996, -0.3952478, -3.012091, 1, 0.8823529, 0, 1,
-1.007234, 0.3174878, -1.959092, 1, 0.8862745, 0, 1,
-1.007011, 0.7853071, -1.064139, 1, 0.8941177, 0, 1,
-1.004668, 1.789904, 1.464178, 1, 0.8980392, 0, 1,
-1.002699, 1.183393, -1.043629, 1, 0.9058824, 0, 1,
-1.001555, 1.258299, -0.5881591, 1, 0.9137255, 0, 1,
-0.9984553, -0.1231439, -2.781102, 1, 0.9176471, 0, 1,
-0.9975705, -0.5244517, -1.065386, 1, 0.9254902, 0, 1,
-0.9798329, -0.5559247, -1.613621, 1, 0.9294118, 0, 1,
-0.9788879, 1.002419, -0.5011519, 1, 0.9372549, 0, 1,
-0.9783654, -0.803901, -0.9224175, 1, 0.9411765, 0, 1,
-0.9761116, 0.9521534, -1.181406, 1, 0.9490196, 0, 1,
-0.9721066, 0.3500115, -1.428826, 1, 0.9529412, 0, 1,
-0.9554035, 0.9942319, -2.647136, 1, 0.9607843, 0, 1,
-0.9471468, 0.1603763, 0.4883157, 1, 0.9647059, 0, 1,
-0.9426956, 0.6713737, -0.3115081, 1, 0.972549, 0, 1,
-0.9383572, -1.622093, -1.785281, 1, 0.9764706, 0, 1,
-0.9345059, 2.321751, 0.1002439, 1, 0.9843137, 0, 1,
-0.9335001, 0.3966057, -0.8865443, 1, 0.9882353, 0, 1,
-0.9317725, -0.2996485, -2.234538, 1, 0.9960784, 0, 1,
-0.930675, 0.2731073, -0.8529708, 0.9960784, 1, 0, 1,
-0.9299877, 0.2628943, -0.4673493, 0.9921569, 1, 0, 1,
-0.9280294, 1.168446, -2.209336, 0.9843137, 1, 0, 1,
-0.9240729, 0.6753572, -0.09708824, 0.9803922, 1, 0, 1,
-0.9233437, 1.508877, 0.7043585, 0.972549, 1, 0, 1,
-0.9170272, -1.229767, -1.749654, 0.9686275, 1, 0, 1,
-0.9146001, 0.49369, -0.4007825, 0.9607843, 1, 0, 1,
-0.9025655, -0.2237222, -2.37219, 0.9568627, 1, 0, 1,
-0.9011111, -0.381143, -2.620276, 0.9490196, 1, 0, 1,
-0.8900334, 0.5567769, -0.6947459, 0.945098, 1, 0, 1,
-0.8888887, -0.2443573, -2.516524, 0.9372549, 1, 0, 1,
-0.8884, 0.8734128, -0.8562444, 0.9333333, 1, 0, 1,
-0.8845685, 0.7123367, -1.955648, 0.9254902, 1, 0, 1,
-0.8770893, 1.569345, 0.3422736, 0.9215686, 1, 0, 1,
-0.8724814, -0.4454117, -1.95703, 0.9137255, 1, 0, 1,
-0.8721203, 0.7890106, -2.770127, 0.9098039, 1, 0, 1,
-0.8711122, -0.9401299, -1.317438, 0.9019608, 1, 0, 1,
-0.8679615, -0.06652583, -0.9831865, 0.8941177, 1, 0, 1,
-0.8678579, -2.001194, -3.114907, 0.8901961, 1, 0, 1,
-0.8664805, 0.6066571, -1.16359, 0.8823529, 1, 0, 1,
-0.8592352, -0.2519272, -2.645675, 0.8784314, 1, 0, 1,
-0.858336, -0.3258089, -0.8056923, 0.8705882, 1, 0, 1,
-0.857148, 0.2745496, -1.834576, 0.8666667, 1, 0, 1,
-0.8534577, -0.4539257, -1.525879, 0.8588235, 1, 0, 1,
-0.8525078, 0.5873694, -1.399625, 0.854902, 1, 0, 1,
-0.8524275, 1.684507, -2.812129, 0.8470588, 1, 0, 1,
-0.8480558, -0.1284954, -1.863901, 0.8431373, 1, 0, 1,
-0.8462389, -1.271792, -2.290658, 0.8352941, 1, 0, 1,
-0.8431071, -0.08997209, -2.007484, 0.8313726, 1, 0, 1,
-0.8430327, -0.9284475, -2.750629, 0.8235294, 1, 0, 1,
-0.8398976, 0.001309432, -0.1746411, 0.8196079, 1, 0, 1,
-0.8398299, -0.2163485, -1.177708, 0.8117647, 1, 0, 1,
-0.8379763, 1.273645, -0.6850172, 0.8078431, 1, 0, 1,
-0.8338924, -0.02659885, -1.580346, 0.8, 1, 0, 1,
-0.8272893, 0.2987121, -0.7331778, 0.7921569, 1, 0, 1,
-0.8231475, -0.03983553, -0.2263008, 0.7882353, 1, 0, 1,
-0.8223695, 0.6997851, -0.1291659, 0.7803922, 1, 0, 1,
-0.8202164, 1.038208, -0.5599076, 0.7764706, 1, 0, 1,
-0.8176672, -0.04437861, -3.568783, 0.7686275, 1, 0, 1,
-0.8161121, -0.530416, -1.813801, 0.7647059, 1, 0, 1,
-0.8096769, -0.1200294, -2.644445, 0.7568628, 1, 0, 1,
-0.8018638, 1.026258, 0.4849738, 0.7529412, 1, 0, 1,
-0.8007838, -0.5607116, -1.4985, 0.7450981, 1, 0, 1,
-0.7982035, -2.238816, -1.286309, 0.7411765, 1, 0, 1,
-0.7942545, 0.483735, -1.711998, 0.7333333, 1, 0, 1,
-0.7897426, -2.031756, -4.536744, 0.7294118, 1, 0, 1,
-0.7893764, 2.407588, 0.3000325, 0.7215686, 1, 0, 1,
-0.7888992, -1.131911, -1.496181, 0.7176471, 1, 0, 1,
-0.7853451, 0.1122759, -0.9232341, 0.7098039, 1, 0, 1,
-0.7792268, 0.7167593, -0.7099779, 0.7058824, 1, 0, 1,
-0.7745288, 0.08131419, -1.270222, 0.6980392, 1, 0, 1,
-0.7673898, 0.156183, -1.775604, 0.6901961, 1, 0, 1,
-0.7669849, -0.7025524, -2.02107, 0.6862745, 1, 0, 1,
-0.7667622, -1.691434, -0.4971333, 0.6784314, 1, 0, 1,
-0.7661586, 0.2116224, -1.792464, 0.6745098, 1, 0, 1,
-0.766057, 0.7057735, 0.5264742, 0.6666667, 1, 0, 1,
-0.7616703, -0.0424374, -2.718604, 0.6627451, 1, 0, 1,
-0.7586346, 1.362103, -2.042672, 0.654902, 1, 0, 1,
-0.7574133, -0.1210531, -1.929868, 0.6509804, 1, 0, 1,
-0.7566401, 1.777198, 1.831659, 0.6431373, 1, 0, 1,
-0.7526668, 0.8001035, -0.1415664, 0.6392157, 1, 0, 1,
-0.7488791, -0.9522337, -1.891293, 0.6313726, 1, 0, 1,
-0.74432, -0.9867414, -3.472877, 0.627451, 1, 0, 1,
-0.7437987, 0.8407521, -0.6747551, 0.6196079, 1, 0, 1,
-0.7411616, -0.3554741, -4.090275, 0.6156863, 1, 0, 1,
-0.7409734, -0.09425478, -0.5681784, 0.6078432, 1, 0, 1,
-0.7366464, 1.08601, -2.13466, 0.6039216, 1, 0, 1,
-0.7346514, 0.6138787, -0.007917578, 0.5960785, 1, 0, 1,
-0.7292657, 2.381527, -0.9387358, 0.5882353, 1, 0, 1,
-0.7259079, -0.6916464, -0.9105099, 0.5843138, 1, 0, 1,
-0.725624, -1.189894, -1.818852, 0.5764706, 1, 0, 1,
-0.7219021, -0.1518753, -1.699727, 0.572549, 1, 0, 1,
-0.7055433, -0.05818065, -1.397856, 0.5647059, 1, 0, 1,
-0.7029802, -0.5962341, -2.835428, 0.5607843, 1, 0, 1,
-0.6997594, -0.2160236, -1.771394, 0.5529412, 1, 0, 1,
-0.6982746, -0.170274, -3.923594, 0.5490196, 1, 0, 1,
-0.6958942, -1.15992, -3.023802, 0.5411765, 1, 0, 1,
-0.6949837, 1.771746, -2.721833, 0.5372549, 1, 0, 1,
-0.6931325, 0.8583124, -0.2862672, 0.5294118, 1, 0, 1,
-0.6928964, -0.7916909, -3.196558, 0.5254902, 1, 0, 1,
-0.6898283, 0.369613, -1.122121, 0.5176471, 1, 0, 1,
-0.6833991, 0.1415804, -2.147053, 0.5137255, 1, 0, 1,
-0.6833195, -0.4359489, -1.723437, 0.5058824, 1, 0, 1,
-0.6735275, -0.7251148, -0.7794187, 0.5019608, 1, 0, 1,
-0.669246, -0.377569, -1.160814, 0.4941176, 1, 0, 1,
-0.6649737, -0.4324588, -3.205488, 0.4862745, 1, 0, 1,
-0.6645674, 0.5941571, -0.6177441, 0.4823529, 1, 0, 1,
-0.6615069, -0.618122, -3.233019, 0.4745098, 1, 0, 1,
-0.6604085, -0.3140117, -0.7190009, 0.4705882, 1, 0, 1,
-0.6587937, -1.122213, -2.023665, 0.4627451, 1, 0, 1,
-0.6489474, -1.458242, -2.247136, 0.4588235, 1, 0, 1,
-0.6467086, -0.674996, -1.163119, 0.4509804, 1, 0, 1,
-0.6438326, -0.7321649, -3.525936, 0.4470588, 1, 0, 1,
-0.6433763, -0.4805297, -1.748418, 0.4392157, 1, 0, 1,
-0.6403726, 0.3143878, -0.5016587, 0.4352941, 1, 0, 1,
-0.6387393, 1.326923, -1.26262, 0.427451, 1, 0, 1,
-0.6384929, 1.004917, -1.439945, 0.4235294, 1, 0, 1,
-0.6353655, 0.8855268, -0.186496, 0.4156863, 1, 0, 1,
-0.6290568, -0.08694295, -2.25093, 0.4117647, 1, 0, 1,
-0.6236519, -0.7238129, -3.262433, 0.4039216, 1, 0, 1,
-0.6196959, 1.711046, -1.651872, 0.3960784, 1, 0, 1,
-0.6187682, 0.648253, 0.4010589, 0.3921569, 1, 0, 1,
-0.6148917, 0.4723826, 0.6633664, 0.3843137, 1, 0, 1,
-0.599848, -1.882965, -2.661511, 0.3803922, 1, 0, 1,
-0.5997633, 0.03128556, -3.310382, 0.372549, 1, 0, 1,
-0.5996332, -0.1038336, -1.183325, 0.3686275, 1, 0, 1,
-0.5979454, -1.398967, -1.450603, 0.3607843, 1, 0, 1,
-0.5912508, -0.5955325, -0.05568584, 0.3568628, 1, 0, 1,
-0.5902902, 0.2348369, 0.5526882, 0.3490196, 1, 0, 1,
-0.5888683, -0.9993212, -3.747417, 0.345098, 1, 0, 1,
-0.5751857, 0.8670673, -0.2605141, 0.3372549, 1, 0, 1,
-0.5736182, -0.1308695, -1.718792, 0.3333333, 1, 0, 1,
-0.5733844, -0.4149809, -2.36531, 0.3254902, 1, 0, 1,
-0.5715276, -0.04307653, -2.113652, 0.3215686, 1, 0, 1,
-0.5647111, 1.386846, -1.073304, 0.3137255, 1, 0, 1,
-0.5596257, 0.8186627, -0.4744967, 0.3098039, 1, 0, 1,
-0.5565774, 0.7699189, -1.756133, 0.3019608, 1, 0, 1,
-0.5553435, -1.232706, -2.294681, 0.2941177, 1, 0, 1,
-0.553169, 0.2859645, -0.4847147, 0.2901961, 1, 0, 1,
-0.5529837, -0.3726232, -1.732908, 0.282353, 1, 0, 1,
-0.5514067, -0.9151511, -2.892743, 0.2784314, 1, 0, 1,
-0.5476841, -0.8031467, -2.231906, 0.2705882, 1, 0, 1,
-0.5343983, -0.4856008, -1.831745, 0.2666667, 1, 0, 1,
-0.5280987, 1.886056, -0.5969271, 0.2588235, 1, 0, 1,
-0.5244115, -0.6714346, -2.033886, 0.254902, 1, 0, 1,
-0.5225702, 0.655201, 0.3671733, 0.2470588, 1, 0, 1,
-0.5222285, -1.119474, -3.802761, 0.2431373, 1, 0, 1,
-0.5196418, 0.6920684, 0.1781999, 0.2352941, 1, 0, 1,
-0.5175875, 0.1175233, -1.072276, 0.2313726, 1, 0, 1,
-0.5165257, 0.6162087, -1.482934, 0.2235294, 1, 0, 1,
-0.5114629, -0.1528424, 1.042989, 0.2196078, 1, 0, 1,
-0.5044565, -0.470187, -0.7839698, 0.2117647, 1, 0, 1,
-0.5022508, 0.5943612, -0.8275853, 0.2078431, 1, 0, 1,
-0.4921716, -0.803239, -1.514241, 0.2, 1, 0, 1,
-0.4846679, -0.14332, -1.46732, 0.1921569, 1, 0, 1,
-0.4813492, -0.527623, -2.919442, 0.1882353, 1, 0, 1,
-0.4749923, 0.1627877, -2.235025, 0.1803922, 1, 0, 1,
-0.4733054, -0.2674747, -3.441297, 0.1764706, 1, 0, 1,
-0.4723726, -0.7459829, -2.498592, 0.1686275, 1, 0, 1,
-0.4717065, -0.8699462, -2.212651, 0.1647059, 1, 0, 1,
-0.4693942, 2.512491, -0.3990107, 0.1568628, 1, 0, 1,
-0.4683253, 0.146789, -1.304623, 0.1529412, 1, 0, 1,
-0.4681397, -0.6387112, -2.381334, 0.145098, 1, 0, 1,
-0.4650569, 0.8831896, -1.39117, 0.1411765, 1, 0, 1,
-0.4603831, 0.8343015, -2.463965, 0.1333333, 1, 0, 1,
-0.4602059, 0.2518764, -0.4069763, 0.1294118, 1, 0, 1,
-0.4598465, -0.0691536, -2.073029, 0.1215686, 1, 0, 1,
-0.4538367, -0.867355, -2.665929, 0.1176471, 1, 0, 1,
-0.4534706, -0.7758487, -2.31277, 0.1098039, 1, 0, 1,
-0.4500715, 0.2328168, -0.3655, 0.1058824, 1, 0, 1,
-0.4406352, 0.1544876, 0.24865, 0.09803922, 1, 0, 1,
-0.4386761, 0.03343952, -3.340566, 0.09019608, 1, 0, 1,
-0.4382349, -1.576181, -3.688881, 0.08627451, 1, 0, 1,
-0.4351854, -0.3879329, -1.638879, 0.07843138, 1, 0, 1,
-0.4327826, 0.1231961, -1.30415, 0.07450981, 1, 0, 1,
-0.4317343, -1.939746, -1.965157, 0.06666667, 1, 0, 1,
-0.4274513, 1.755442, -1.59218, 0.0627451, 1, 0, 1,
-0.4213509, 0.6395267, -0.6445062, 0.05490196, 1, 0, 1,
-0.4212234, 1.542339, -1.048397, 0.05098039, 1, 0, 1,
-0.41947, 1.436785, -1.019739, 0.04313726, 1, 0, 1,
-0.4180439, 1.811726, 0.5577493, 0.03921569, 1, 0, 1,
-0.4161361, -1.016552, -2.376459, 0.03137255, 1, 0, 1,
-0.4149506, 0.10547, -1.517492, 0.02745098, 1, 0, 1,
-0.4117032, 1.356437, 0.8033975, 0.01960784, 1, 0, 1,
-0.3989103, -1.581284, -3.580479, 0.01568628, 1, 0, 1,
-0.3937756, -0.8020483, -2.862345, 0.007843138, 1, 0, 1,
-0.3898255, 0.05993313, -0.8167604, 0.003921569, 1, 0, 1,
-0.3883816, 0.974521, 1.343078, 0, 1, 0.003921569, 1,
-0.387698, -0.6208486, -3.986166, 0, 1, 0.01176471, 1,
-0.3863259, -1.884235, -1.473334, 0, 1, 0.01568628, 1,
-0.3770127, 1.07577, -0.1759307, 0, 1, 0.02352941, 1,
-0.3767772, -1.65617, -2.743949, 0, 1, 0.02745098, 1,
-0.3733324, -0.685908, -3.042228, 0, 1, 0.03529412, 1,
-0.3648128, 0.02299739, -2.155996, 0, 1, 0.03921569, 1,
-0.3641703, -0.008460191, -1.996366, 0, 1, 0.04705882, 1,
-0.3623528, -0.1663259, -1.304359, 0, 1, 0.05098039, 1,
-0.3617928, 0.8650542, -1.210006, 0, 1, 0.05882353, 1,
-0.3604264, -0.3782245, -1.742821, 0, 1, 0.0627451, 1,
-0.360348, -0.7635534, -1.197355, 0, 1, 0.07058824, 1,
-0.3493881, 1.125514, 0.2674231, 0, 1, 0.07450981, 1,
-0.3461097, -0.9763764, -2.274625, 0, 1, 0.08235294, 1,
-0.3450565, -2.222684, -2.710131, 0, 1, 0.08627451, 1,
-0.3441261, -0.2120459, -1.818804, 0, 1, 0.09411765, 1,
-0.3422209, 0.4355994, 0.06290349, 0, 1, 0.1019608, 1,
-0.3411979, -0.1296483, -2.471041, 0, 1, 0.1058824, 1,
-0.3406248, -1.218525, -1.624564, 0, 1, 0.1137255, 1,
-0.3333359, 0.9224945, -1.330199, 0, 1, 0.1176471, 1,
-0.3307283, 1.074319, 0.1353635, 0, 1, 0.1254902, 1,
-0.3285424, 0.5939572, -1.277213, 0, 1, 0.1294118, 1,
-0.3273651, -0.33828, -2.433137, 0, 1, 0.1372549, 1,
-0.3267145, 1.085656, -0.3151039, 0, 1, 0.1411765, 1,
-0.3244353, 1.28255, 1.156936, 0, 1, 0.1490196, 1,
-0.3158242, -0.9583849, -3.370183, 0, 1, 0.1529412, 1,
-0.3137835, 0.6084262, 0.1368002, 0, 1, 0.1607843, 1,
-0.3136592, -1.017688, -2.206591, 0, 1, 0.1647059, 1,
-0.3091744, -0.6893408, -1.63439, 0, 1, 0.172549, 1,
-0.3054006, 1.15784, 0.2057626, 0, 1, 0.1764706, 1,
-0.3051237, -0.9880978, -4.394711, 0, 1, 0.1843137, 1,
-0.3014169, -0.7030035, -3.169498, 0, 1, 0.1882353, 1,
-0.3001486, 1.300111, -0.001360329, 0, 1, 0.1960784, 1,
-0.3000929, 0.3230191, -1.15134, 0, 1, 0.2039216, 1,
-0.2999869, 1.802171, -0.7489741, 0, 1, 0.2078431, 1,
-0.2912342, 1.274841, -1.343828, 0, 1, 0.2156863, 1,
-0.2909645, -0.7994776, -1.612914, 0, 1, 0.2196078, 1,
-0.2879632, 0.466349, 0.06085303, 0, 1, 0.227451, 1,
-0.2845111, 0.2167366, -0.9202722, 0, 1, 0.2313726, 1,
-0.2824318, 0.06904095, -1.252034, 0, 1, 0.2392157, 1,
-0.2783002, 1.020278, 1.10223, 0, 1, 0.2431373, 1,
-0.2754404, -0.2908232, -1.003631, 0, 1, 0.2509804, 1,
-0.27466, 0.5741801, -1.760359, 0, 1, 0.254902, 1,
-0.2745599, 1.182564, 1.199198, 0, 1, 0.2627451, 1,
-0.2683377, -0.7828205, -2.251358, 0, 1, 0.2666667, 1,
-0.2661394, -0.7473919, -5.755105, 0, 1, 0.2745098, 1,
-0.2655873, 0.7509183, -1.033431, 0, 1, 0.2784314, 1,
-0.2616114, 0.92084, 0.4281759, 0, 1, 0.2862745, 1,
-0.2615992, 0.8711693, 0.9169326, 0, 1, 0.2901961, 1,
-0.2600335, 0.2478601, -2.371922, 0, 1, 0.2980392, 1,
-0.2558169, 1.760903, 0.1053123, 0, 1, 0.3058824, 1,
-0.2549497, -0.9327023, -4.391767, 0, 1, 0.3098039, 1,
-0.2537135, -0.3118541, -1.822388, 0, 1, 0.3176471, 1,
-0.2480475, 0.9621226, 0.6323534, 0, 1, 0.3215686, 1,
-0.2479347, 1.54215, -1.043972, 0, 1, 0.3294118, 1,
-0.2477965, 0.3134468, 0.06209013, 0, 1, 0.3333333, 1,
-0.2463379, 0.3059602, 0.3440187, 0, 1, 0.3411765, 1,
-0.2411485, -0.3198295, -1.915846, 0, 1, 0.345098, 1,
-0.2407168, -0.3255385, -1.682135, 0, 1, 0.3529412, 1,
-0.2348344, -0.5647288, -3.091695, 0, 1, 0.3568628, 1,
-0.232564, 1.638744, -2.392342, 0, 1, 0.3647059, 1,
-0.2303918, -1.859766, -2.923294, 0, 1, 0.3686275, 1,
-0.2273581, -0.5040528, -4.204188, 0, 1, 0.3764706, 1,
-0.2254295, 0.2284862, 0.6824845, 0, 1, 0.3803922, 1,
-0.2227012, -1.46697, -2.148779, 0, 1, 0.3882353, 1,
-0.2201514, -0.4048034, -2.043406, 0, 1, 0.3921569, 1,
-0.218516, 0.4330365, -0.9128875, 0, 1, 0.4, 1,
-0.2160946, -1.099517, -4.024508, 0, 1, 0.4078431, 1,
-0.2152871, -0.919976, -3.571282, 0, 1, 0.4117647, 1,
-0.2149516, 0.5903922, -0.772192, 0, 1, 0.4196078, 1,
-0.2144335, 0.5320935, 0.3632301, 0, 1, 0.4235294, 1,
-0.205676, 0.02867342, -0.9843397, 0, 1, 0.4313726, 1,
-0.2051031, 0.9940693, 1.178884, 0, 1, 0.4352941, 1,
-0.2050719, -0.3636658, -4.807347, 0, 1, 0.4431373, 1,
-0.2028344, -0.6975958, -4.449097, 0, 1, 0.4470588, 1,
-0.2021015, 0.1305017, -0.8079674, 0, 1, 0.454902, 1,
-0.2018261, -1.061859, -2.447623, 0, 1, 0.4588235, 1,
-0.2003077, 0.1302641, -0.8133773, 0, 1, 0.4666667, 1,
-0.1927487, 1.450001, -0.1557405, 0, 1, 0.4705882, 1,
-0.1927129, 1.982469, -0.8083293, 0, 1, 0.4784314, 1,
-0.1919865, 0.704598, -0.145423, 0, 1, 0.4823529, 1,
-0.1906617, -0.699535, -1.918692, 0, 1, 0.4901961, 1,
-0.1890165, -0.06848873, -0.9946619, 0, 1, 0.4941176, 1,
-0.1876503, 1.929652, 0.1842526, 0, 1, 0.5019608, 1,
-0.1875873, -0.01685682, -2.914104, 0, 1, 0.509804, 1,
-0.185885, 0.6184121, -0.306156, 0, 1, 0.5137255, 1,
-0.1805904, -1.332743, -2.337566, 0, 1, 0.5215687, 1,
-0.1753625, -0.3896604, -1.790592, 0, 1, 0.5254902, 1,
-0.1707232, -0.9571918, -1.922565, 0, 1, 0.5333334, 1,
-0.1697583, -0.8494356, -3.319102, 0, 1, 0.5372549, 1,
-0.16798, 0.2124657, -0.8352129, 0, 1, 0.5450981, 1,
-0.1627042, -0.8603965, -1.900922, 0, 1, 0.5490196, 1,
-0.1608871, -0.0486481, -2.861045, 0, 1, 0.5568628, 1,
-0.160332, 0.1006532, -1.058135, 0, 1, 0.5607843, 1,
-0.157542, -0.1414251, -3.067796, 0, 1, 0.5686275, 1,
-0.1520205, -0.2349394, -3.365604, 0, 1, 0.572549, 1,
-0.1495386, -0.5529997, -3.896793, 0, 1, 0.5803922, 1,
-0.149174, 0.2019766, -1.452757, 0, 1, 0.5843138, 1,
-0.1479521, -0.39992, -3.311623, 0, 1, 0.5921569, 1,
-0.1442275, -1.007686, -2.676198, 0, 1, 0.5960785, 1,
-0.1391631, 0.04857941, -0.5319178, 0, 1, 0.6039216, 1,
-0.1348509, 0.9295513, -1.14832, 0, 1, 0.6117647, 1,
-0.1326666, -0.4363706, -3.615642, 0, 1, 0.6156863, 1,
-0.1280579, 0.6906067, 0.07986076, 0, 1, 0.6235294, 1,
-0.1275119, 0.5780019, 1.049388, 0, 1, 0.627451, 1,
-0.1261206, -2.255562, -2.573161, 0, 1, 0.6352941, 1,
-0.1249119, 1.350261, 0.266944, 0, 1, 0.6392157, 1,
-0.1247754, 1.377231, -0.5314282, 0, 1, 0.6470588, 1,
-0.1236358, -0.3781528, -3.607903, 0, 1, 0.6509804, 1,
-0.1212755, 0.6909077, 0.8814486, 0, 1, 0.6588235, 1,
-0.1210706, -0.679724, -3.557954, 0, 1, 0.6627451, 1,
-0.1168632, -0.6999263, -2.799538, 0, 1, 0.6705883, 1,
-0.1131725, -0.2900548, -4.804203, 0, 1, 0.6745098, 1,
-0.1130647, -0.8756508, -2.766885, 0, 1, 0.682353, 1,
-0.1115196, 0.806871, 1.390333, 0, 1, 0.6862745, 1,
-0.1086508, 0.7342311, 0.2372811, 0, 1, 0.6941177, 1,
-0.1070047, 0.9404765, -0.7133321, 0, 1, 0.7019608, 1,
-0.1031785, -0.195469, -1.98394, 0, 1, 0.7058824, 1,
-0.09980877, -1.048331, -3.392258, 0, 1, 0.7137255, 1,
-0.09270545, -0.917756, -4.005164, 0, 1, 0.7176471, 1,
-0.09250206, 0.2686074, 1.658524, 0, 1, 0.7254902, 1,
-0.09133106, 0.9757907, -1.715632, 0, 1, 0.7294118, 1,
-0.08497634, 2.121906, -0.03551053, 0, 1, 0.7372549, 1,
-0.08322325, -0.06003382, -1.955351, 0, 1, 0.7411765, 1,
-0.0754102, -0.6107382, -2.895845, 0, 1, 0.7490196, 1,
-0.07523393, -0.1771708, -2.716917, 0, 1, 0.7529412, 1,
-0.07493663, 1.73433, -0.7140676, 0, 1, 0.7607843, 1,
-0.06909484, 0.1028087, -0.7530708, 0, 1, 0.7647059, 1,
-0.06818076, -0.08532724, -2.119752, 0, 1, 0.772549, 1,
-0.06613658, 0.4638111, 0.8328111, 0, 1, 0.7764706, 1,
-0.06513731, -0.5687169, -3.966767, 0, 1, 0.7843137, 1,
-0.06110009, 1.706426, 0.9163002, 0, 1, 0.7882353, 1,
-0.06032487, -0.1600861, -1.922098, 0, 1, 0.7960784, 1,
-0.05709532, 0.496938, 1.025825, 0, 1, 0.8039216, 1,
-0.0553094, 0.3216445, 0.3691795, 0, 1, 0.8078431, 1,
-0.05393506, -0.03630576, -3.096136, 0, 1, 0.8156863, 1,
-0.05021764, 0.5925028, -1.023426, 0, 1, 0.8196079, 1,
-0.04614906, 1.82593, -0.3194275, 0, 1, 0.827451, 1,
-0.04480925, -0.9516755, -1.571657, 0, 1, 0.8313726, 1,
-0.04045806, -0.5290882, -2.969411, 0, 1, 0.8392157, 1,
-0.04018033, -0.7295802, -1.497633, 0, 1, 0.8431373, 1,
-0.03829742, 1.442556, -0.5101231, 0, 1, 0.8509804, 1,
-0.03723779, 0.3066648, -0.6826039, 0, 1, 0.854902, 1,
-0.03642368, 0.8477576, -0.09097604, 0, 1, 0.8627451, 1,
-0.03506231, 0.3333018, 1.467228, 0, 1, 0.8666667, 1,
-0.03039196, -0.4962374, -4.081278, 0, 1, 0.8745098, 1,
-0.02677567, 0.8785667, 0.1556209, 0, 1, 0.8784314, 1,
-0.02342211, -0.7698921, -3.596497, 0, 1, 0.8862745, 1,
-0.02093275, 0.2892929, 0.4741479, 0, 1, 0.8901961, 1,
-0.01956183, -0.2346439, -2.34468, 0, 1, 0.8980392, 1,
-0.01698912, 0.0610447, 0.2207246, 0, 1, 0.9058824, 1,
-0.01466434, -1.889249, -5.356679, 0, 1, 0.9098039, 1,
-0.01156219, -0.2501806, -3.044106, 0, 1, 0.9176471, 1,
-0.009525515, -0.7871541, -3.753226, 0, 1, 0.9215686, 1,
-0.00930467, 0.4390297, -0.1287922, 0, 1, 0.9294118, 1,
-0.007145267, 1.078651, 1.518949, 0, 1, 0.9333333, 1,
0.00796197, 0.4086643, -0.223947, 0, 1, 0.9411765, 1,
0.01683754, -2.090165, 2.947474, 0, 1, 0.945098, 1,
0.02054144, 1.009296, -0.9966466, 0, 1, 0.9529412, 1,
0.02325991, 1.018317, 0.09208981, 0, 1, 0.9568627, 1,
0.02806976, 0.9756476, -0.493337, 0, 1, 0.9647059, 1,
0.02812481, -1.091651, 1.753517, 0, 1, 0.9686275, 1,
0.02883131, 0.7171247, 1.508612, 0, 1, 0.9764706, 1,
0.03610527, -2.092555, 1.202318, 0, 1, 0.9803922, 1,
0.03888901, 1.741917, 0.1592308, 0, 1, 0.9882353, 1,
0.04263579, 0.6601115, -0.6787195, 0, 1, 0.9921569, 1,
0.04273528, 0.05699834, 1.214404, 0, 1, 1, 1,
0.04548504, 1.570714, -0.01747571, 0, 0.9921569, 1, 1,
0.04559815, 1.683973, 0.568729, 0, 0.9882353, 1, 1,
0.0531166, -0.003741452, 0.1943475, 0, 0.9803922, 1, 1,
0.05422655, -0.298162, 2.442636, 0, 0.9764706, 1, 1,
0.05744776, 0.3969463, 3.431219, 0, 0.9686275, 1, 1,
0.05807761, 0.265803, -0.2426131, 0, 0.9647059, 1, 1,
0.05945682, 1.697534, -0.5557714, 0, 0.9568627, 1, 1,
0.06119632, -1.244843, 4.59451, 0, 0.9529412, 1, 1,
0.06233466, -1.764023, 1.890953, 0, 0.945098, 1, 1,
0.0637043, -0.4466651, 2.314198, 0, 0.9411765, 1, 1,
0.07525486, -0.2117462, 2.909682, 0, 0.9333333, 1, 1,
0.07752521, 0.08629528, 2.261166, 0, 0.9294118, 1, 1,
0.08006181, 0.1148362, 0.5006583, 0, 0.9215686, 1, 1,
0.0833114, -0.1511791, 1.916426, 0, 0.9176471, 1, 1,
0.08385519, 0.2397518, -0.4419675, 0, 0.9098039, 1, 1,
0.08630963, 0.7129789, -0.5599034, 0, 0.9058824, 1, 1,
0.08682235, 0.7793261, 0.04124948, 0, 0.8980392, 1, 1,
0.08795013, 0.8008239, 0.1489862, 0, 0.8901961, 1, 1,
0.08959265, 0.1664361, -0.09350251, 0, 0.8862745, 1, 1,
0.09032307, 0.1896288, -0.8388242, 0, 0.8784314, 1, 1,
0.09338858, -1.728101, 3.052477, 0, 0.8745098, 1, 1,
0.0935961, 0.5308532, -0.93632, 0, 0.8666667, 1, 1,
0.0962314, 0.9837785, 0.8789173, 0, 0.8627451, 1, 1,
0.09716932, -0.5278905, 3.750917, 0, 0.854902, 1, 1,
0.09941688, -0.2039559, 4.404702, 0, 0.8509804, 1, 1,
0.1010079, 1.065627, -0.2108789, 0, 0.8431373, 1, 1,
0.1039611, -0.1952628, 3.156816, 0, 0.8392157, 1, 1,
0.1045318, 0.6707829, -0.3376745, 0, 0.8313726, 1, 1,
0.1047038, 2.144544, 0.6831116, 0, 0.827451, 1, 1,
0.1054374, -0.08601874, 1.06493, 0, 0.8196079, 1, 1,
0.1082156, 0.7800987, -0.9020141, 0, 0.8156863, 1, 1,
0.1093735, -1.331714, 3.899456, 0, 0.8078431, 1, 1,
0.1094769, 1.927171, 1.111293, 0, 0.8039216, 1, 1,
0.1129832, -1.035235, 2.478402, 0, 0.7960784, 1, 1,
0.1133019, -0.9241309, 3.80865, 0, 0.7882353, 1, 1,
0.1133265, 2.234174, 1.624334, 0, 0.7843137, 1, 1,
0.1135318, 0.04645644, 3.190599, 0, 0.7764706, 1, 1,
0.1149694, -0.1261213, 3.483174, 0, 0.772549, 1, 1,
0.1157557, 1.222319, -0.9520572, 0, 0.7647059, 1, 1,
0.1161184, -0.6498207, 3.805501, 0, 0.7607843, 1, 1,
0.1162486, -1.727333, 1.921552, 0, 0.7529412, 1, 1,
0.1169916, -0.2132009, 2.060746, 0, 0.7490196, 1, 1,
0.1190513, 0.911277, -0.925191, 0, 0.7411765, 1, 1,
0.1197434, 0.7649005, 0.3392168, 0, 0.7372549, 1, 1,
0.1203735, 1.180335, -0.04504148, 0, 0.7294118, 1, 1,
0.1212285, -0.1069938, 2.204049, 0, 0.7254902, 1, 1,
0.1220855, 0.2629897, 0.6205105, 0, 0.7176471, 1, 1,
0.122147, -0.6270702, 1.850581, 0, 0.7137255, 1, 1,
0.1263266, 1.302584, -1.629611, 0, 0.7058824, 1, 1,
0.1348579, -0.0271828, 1.332005, 0, 0.6980392, 1, 1,
0.1374112, 2.321688, -0.6560362, 0, 0.6941177, 1, 1,
0.1385852, -2.216338, 3.631524, 0, 0.6862745, 1, 1,
0.1400451, -1.621782, 2.626421, 0, 0.682353, 1, 1,
0.1411401, 1.52324, 1.297088, 0, 0.6745098, 1, 1,
0.1415353, 0.793259, 0.9100482, 0, 0.6705883, 1, 1,
0.141943, -0.1407658, -0.2331353, 0, 0.6627451, 1, 1,
0.1426387, 1.082367, -2.151601, 0, 0.6588235, 1, 1,
0.1457134, 0.5751183, 1.080166, 0, 0.6509804, 1, 1,
0.146786, 1.594346, -1.54327, 0, 0.6470588, 1, 1,
0.1468123, 2.102767, -0.1192621, 0, 0.6392157, 1, 1,
0.1478123, -1.654607, 3.144261, 0, 0.6352941, 1, 1,
0.1481879, -0.7605036, 3.078497, 0, 0.627451, 1, 1,
0.1494397, 0.4820597, 1.651047, 0, 0.6235294, 1, 1,
0.1524303, 0.8488813, -1.851811, 0, 0.6156863, 1, 1,
0.1545247, -1.40458, 3.418736, 0, 0.6117647, 1, 1,
0.1610298, -0.8069307, 3.277032, 0, 0.6039216, 1, 1,
0.1639249, 0.1528684, 0.6637031, 0, 0.5960785, 1, 1,
0.171629, -1.03705, 3.247563, 0, 0.5921569, 1, 1,
0.1754454, 0.1542928, 1.63942, 0, 0.5843138, 1, 1,
0.1761491, -1.26697, 2.678085, 0, 0.5803922, 1, 1,
0.1787425, -0.1764532, 2.046978, 0, 0.572549, 1, 1,
0.179781, 2.052215, 1.481796, 0, 0.5686275, 1, 1,
0.1813925, -1.224515, 2.600506, 0, 0.5607843, 1, 1,
0.1829036, 1.57983, 0.8419774, 0, 0.5568628, 1, 1,
0.1831307, -1.051398, 2.944716, 0, 0.5490196, 1, 1,
0.184171, -0.7903908, 2.551379, 0, 0.5450981, 1, 1,
0.1846831, -0.6629096, 3.398637, 0, 0.5372549, 1, 1,
0.1854115, -1.129081, 3.383549, 0, 0.5333334, 1, 1,
0.1861115, 0.3216624, 0.004583444, 0, 0.5254902, 1, 1,
0.1865684, -0.3450347, 2.3563, 0, 0.5215687, 1, 1,
0.1902882, -0.320152, 1.552312, 0, 0.5137255, 1, 1,
0.1945353, 1.901768, -0.6151357, 0, 0.509804, 1, 1,
0.1946117, -0.7161843, 3.692161, 0, 0.5019608, 1, 1,
0.198689, 0.05664757, 0.3182761, 0, 0.4941176, 1, 1,
0.1993183, 0.1777833, 0.3794278, 0, 0.4901961, 1, 1,
0.202015, 0.9607815, -0.1854581, 0, 0.4823529, 1, 1,
0.2046425, 0.1349639, 0.0284247, 0, 0.4784314, 1, 1,
0.2087275, 0.5694168, 0.1441429, 0, 0.4705882, 1, 1,
0.2095471, -1.492117, 2.860252, 0, 0.4666667, 1, 1,
0.2100299, 0.5333182, -0.7638083, 0, 0.4588235, 1, 1,
0.2150132, 0.4960678, 0.994339, 0, 0.454902, 1, 1,
0.2156885, 0.5132983, 0.1083058, 0, 0.4470588, 1, 1,
0.2197695, -1.428876, 1.61228, 0, 0.4431373, 1, 1,
0.2216525, 0.3044805, 1.630353, 0, 0.4352941, 1, 1,
0.2247831, 0.5815535, -0.1426533, 0, 0.4313726, 1, 1,
0.2258666, -1.103253, 3.593429, 0, 0.4235294, 1, 1,
0.2298548, -1.013006, 2.76366, 0, 0.4196078, 1, 1,
0.2318127, -1.372011, 3.651429, 0, 0.4117647, 1, 1,
0.2365915, -0.5192905, 2.23616, 0, 0.4078431, 1, 1,
0.2402739, 0.4764412, -0.04508629, 0, 0.4, 1, 1,
0.2469837, -1.258743, 4.034628, 0, 0.3921569, 1, 1,
0.2476806, -1.337018, 2.169516, 0, 0.3882353, 1, 1,
0.2477674, -1.025183, 2.869871, 0, 0.3803922, 1, 1,
0.2482979, 0.136582, 1.258366, 0, 0.3764706, 1, 1,
0.2581667, 1.011163, 2.618522, 0, 0.3686275, 1, 1,
0.2642421, -0.2196072, 0.7941831, 0, 0.3647059, 1, 1,
0.2672768, 0.8658776, -0.7087091, 0, 0.3568628, 1, 1,
0.273769, 0.7711083, 1.38666, 0, 0.3529412, 1, 1,
0.2805122, 0.4233414, 1.189669, 0, 0.345098, 1, 1,
0.282867, 0.2372717, -1.388502, 0, 0.3411765, 1, 1,
0.2842527, 1.519299, 0.8260339, 0, 0.3333333, 1, 1,
0.2848083, -0.2600406, 2.750446, 0, 0.3294118, 1, 1,
0.2849725, -1.54461, 2.483991, 0, 0.3215686, 1, 1,
0.2884153, -1.570829, 2.694044, 0, 0.3176471, 1, 1,
0.2923361, -0.166856, 1.04333, 0, 0.3098039, 1, 1,
0.3004456, 0.9667735, -0.9801899, 0, 0.3058824, 1, 1,
0.3035778, -1.065677, 3.743168, 0, 0.2980392, 1, 1,
0.3085515, -0.7595047, 3.469916, 0, 0.2901961, 1, 1,
0.3102934, 1.046452, 1.30933, 0, 0.2862745, 1, 1,
0.3143547, 0.9903593, -0.2492522, 0, 0.2784314, 1, 1,
0.3175631, 0.9029938, 2.099309, 0, 0.2745098, 1, 1,
0.3180712, -0.4930664, 3.75787, 0, 0.2666667, 1, 1,
0.3193996, 0.09333941, 2.112722, 0, 0.2627451, 1, 1,
0.3195633, -0.2582395, 1.382344, 0, 0.254902, 1, 1,
0.3239765, 1.175267, 1.788204, 0, 0.2509804, 1, 1,
0.324764, -1.128322, 3.36846, 0, 0.2431373, 1, 1,
0.3292505, -0.2056452, 0.4740434, 0, 0.2392157, 1, 1,
0.3306364, -2.185499, 3.166764, 0, 0.2313726, 1, 1,
0.3344924, 0.6895863, -0.0001758041, 0, 0.227451, 1, 1,
0.3349159, 0.8988011, -0.2180725, 0, 0.2196078, 1, 1,
0.3378738, -0.3419302, 2.322265, 0, 0.2156863, 1, 1,
0.3378753, 1.067307, -0.2211995, 0, 0.2078431, 1, 1,
0.3403667, -0.04341424, 0.1171563, 0, 0.2039216, 1, 1,
0.3403797, 0.209631, 0.5838675, 0, 0.1960784, 1, 1,
0.3421539, -0.6339691, 4.213068, 0, 0.1882353, 1, 1,
0.3458358, 0.2219891, 0.6516366, 0, 0.1843137, 1, 1,
0.3528522, 0.09601332, 1.294271, 0, 0.1764706, 1, 1,
0.3535122, 0.2268719, 0.7659201, 0, 0.172549, 1, 1,
0.3541044, 0.2067072, 1.311699, 0, 0.1647059, 1, 1,
0.354753, 1.975849, -0.8186966, 0, 0.1607843, 1, 1,
0.3566907, 1.838036, 0.03108942, 0, 0.1529412, 1, 1,
0.3605111, 0.8129972, -0.1212424, 0, 0.1490196, 1, 1,
0.3610708, -1.145219, 2.334023, 0, 0.1411765, 1, 1,
0.3611678, -0.9905137, 2.395332, 0, 0.1372549, 1, 1,
0.3635439, -1.965626, 3.215194, 0, 0.1294118, 1, 1,
0.369527, -0.005461059, 2.946397, 0, 0.1254902, 1, 1,
0.3743208, 0.3395578, 1.464585, 0, 0.1176471, 1, 1,
0.3755318, -0.9447843, 2.684756, 0, 0.1137255, 1, 1,
0.3802407, -0.2796198, 2.72778, 0, 0.1058824, 1, 1,
0.3812753, 2.485266, 1.116379, 0, 0.09803922, 1, 1,
0.3814059, 0.782204, 1.431741, 0, 0.09411765, 1, 1,
0.3832771, 0.721723, 1.26184, 0, 0.08627451, 1, 1,
0.3870365, 0.0108957, 2.919498, 0, 0.08235294, 1, 1,
0.3879804, 0.5302938, 1.79174, 0, 0.07450981, 1, 1,
0.3894631, 0.8320609, -0.6518934, 0, 0.07058824, 1, 1,
0.3923837, 3.405076, 0.5455313, 0, 0.0627451, 1, 1,
0.3952602, -0.7508235, 2.083418, 0, 0.05882353, 1, 1,
0.3984845, 0.239916, 1.158953, 0, 0.05098039, 1, 1,
0.3999785, 0.237048, 0.8062886, 0, 0.04705882, 1, 1,
0.4045351, 0.3349469, 2.022191, 0, 0.03921569, 1, 1,
0.4061779, 0.3432821, 0.3909629, 0, 0.03529412, 1, 1,
0.4065074, 0.2913731, 1.738677, 0, 0.02745098, 1, 1,
0.4078341, -0.1067967, 1.465165, 0, 0.02352941, 1, 1,
0.4152106, -0.5349345, 2.343758, 0, 0.01568628, 1, 1,
0.4201629, 0.6980059, 1.321228, 0, 0.01176471, 1, 1,
0.4222988, 0.03429589, 1.053485, 0, 0.003921569, 1, 1,
0.4348492, -1.20965, 5.114532, 0.003921569, 0, 1, 1,
0.4442044, -0.9744375, 4.526278, 0.007843138, 0, 1, 1,
0.4466698, -0.1093671, 1.300881, 0.01568628, 0, 1, 1,
0.4533309, 0.8130124, 2.306887, 0.01960784, 0, 1, 1,
0.4575984, -0.2827637, 3.229541, 0.02745098, 0, 1, 1,
0.4608917, 0.5845018, 2.919649, 0.03137255, 0, 1, 1,
0.4615442, -1.802755, 4.980461, 0.03921569, 0, 1, 1,
0.4635411, 0.9826393, 0.8179664, 0.04313726, 0, 1, 1,
0.4639504, 1.195225, 1.725347, 0.05098039, 0, 1, 1,
0.465372, -0.7663121, 2.552449, 0.05490196, 0, 1, 1,
0.4704482, -0.4060512, 1.581249, 0.0627451, 0, 1, 1,
0.4766569, -0.4035835, 0.1274694, 0.06666667, 0, 1, 1,
0.4776386, -1.378132, 2.382385, 0.07450981, 0, 1, 1,
0.4784304, -1.669518, 1.74888, 0.07843138, 0, 1, 1,
0.4802185, -1.13519, 0.2147289, 0.08627451, 0, 1, 1,
0.4827646, 0.8607795, -1.661325, 0.09019608, 0, 1, 1,
0.4863816, 0.3620368, 0.666545, 0.09803922, 0, 1, 1,
0.4883671, -0.6254365, 3.468956, 0.1058824, 0, 1, 1,
0.4918421, 0.04963649, 1.558941, 0.1098039, 0, 1, 1,
0.4967211, -0.6260741, 1.8255, 0.1176471, 0, 1, 1,
0.5003563, -0.202849, 1.624653, 0.1215686, 0, 1, 1,
0.5019654, 0.598268, 1.884356, 0.1294118, 0, 1, 1,
0.5039981, 0.8364246, 0.6264076, 0.1333333, 0, 1, 1,
0.5040422, 0.8646803, 1.017607, 0.1411765, 0, 1, 1,
0.5254209, 0.8835921, 0.2739181, 0.145098, 0, 1, 1,
0.5259898, 1.71817, 1.765206, 0.1529412, 0, 1, 1,
0.5278429, 0.6260598, 1.944186, 0.1568628, 0, 1, 1,
0.5283188, 1.561039, -1.212788, 0.1647059, 0, 1, 1,
0.5359004, -0.6040414, 2.863804, 0.1686275, 0, 1, 1,
0.5389289, 0.3476167, 1.569, 0.1764706, 0, 1, 1,
0.5411541, -0.4230438, 1.646645, 0.1803922, 0, 1, 1,
0.5422662, 1.595377, 0.5288442, 0.1882353, 0, 1, 1,
0.5494668, 1.052012, -0.3370113, 0.1921569, 0, 1, 1,
0.5551358, -0.3054013, 2.920864, 0.2, 0, 1, 1,
0.5551996, 1.691055, -0.6335247, 0.2078431, 0, 1, 1,
0.5562845, -0.6258827, 4.369785, 0.2117647, 0, 1, 1,
0.5582948, -0.4833614, 1.867181, 0.2196078, 0, 1, 1,
0.5617204, -0.1483324, 1.248605, 0.2235294, 0, 1, 1,
0.564563, 0.806672, -0.5394423, 0.2313726, 0, 1, 1,
0.5659088, -1.309459, 2.07274, 0.2352941, 0, 1, 1,
0.5674702, -1.323629, 2.415636, 0.2431373, 0, 1, 1,
0.5679235, 1.360406, 0.9614923, 0.2470588, 0, 1, 1,
0.567992, -1.073552, 1.433657, 0.254902, 0, 1, 1,
0.5703601, 1.860034, 0.6393956, 0.2588235, 0, 1, 1,
0.5766985, 0.7363918, 0.4797054, 0.2666667, 0, 1, 1,
0.5794389, 1.75071, 0.1972441, 0.2705882, 0, 1, 1,
0.58057, -0.4285136, 1.042357, 0.2784314, 0, 1, 1,
0.5824046, -0.4066487, 3.624896, 0.282353, 0, 1, 1,
0.5850106, -0.2691861, 2.871492, 0.2901961, 0, 1, 1,
0.5951596, 1.36903, 1.397984, 0.2941177, 0, 1, 1,
0.5989401, 0.9522385, 0.539439, 0.3019608, 0, 1, 1,
0.5989453, 0.05047659, -0.09423126, 0.3098039, 0, 1, 1,
0.603081, -0.1263386, 3.275598, 0.3137255, 0, 1, 1,
0.6082005, 0.2145526, 1.58127, 0.3215686, 0, 1, 1,
0.6100581, -0.4447101, 3.444222, 0.3254902, 0, 1, 1,
0.6149288, -0.9635384, 2.54181, 0.3333333, 0, 1, 1,
0.6156955, 1.130026, 0.62306, 0.3372549, 0, 1, 1,
0.6179268, -0.06512322, 1.094236, 0.345098, 0, 1, 1,
0.6187197, 0.4088123, -0.4640046, 0.3490196, 0, 1, 1,
0.619553, -0.5425084, 2.624072, 0.3568628, 0, 1, 1,
0.6260455, -0.3824377, 1.696566, 0.3607843, 0, 1, 1,
0.6296529, -1.447533, 3.418097, 0.3686275, 0, 1, 1,
0.6381869, -0.400581, 1.253313, 0.372549, 0, 1, 1,
0.639033, -0.08235018, 1.953268, 0.3803922, 0, 1, 1,
0.6425707, -0.4335521, 0.8053709, 0.3843137, 0, 1, 1,
0.6438646, 0.09485935, 2.064654, 0.3921569, 0, 1, 1,
0.6453826, -0.6299821, 0.9230601, 0.3960784, 0, 1, 1,
0.646008, -1.375867, 2.839589, 0.4039216, 0, 1, 1,
0.6539676, 0.8348518, 2.078239, 0.4117647, 0, 1, 1,
0.6580735, -1.153267, 3.734979, 0.4156863, 0, 1, 1,
0.6601523, -1.041792, 4.211844, 0.4235294, 0, 1, 1,
0.6620463, 0.9281943, 0.05637919, 0.427451, 0, 1, 1,
0.664561, 0.182134, 0.3814176, 0.4352941, 0, 1, 1,
0.6668302, -0.1172517, 1.508788, 0.4392157, 0, 1, 1,
0.6754088, 1.214669, -1.204209, 0.4470588, 0, 1, 1,
0.6761366, 0.3594076, 2.461579, 0.4509804, 0, 1, 1,
0.6784707, -1.32018, 2.494762, 0.4588235, 0, 1, 1,
0.6787398, -0.6246678, 2.452543, 0.4627451, 0, 1, 1,
0.6882941, -0.479619, 1.682084, 0.4705882, 0, 1, 1,
0.6916358, 0.1503284, 1.267783, 0.4745098, 0, 1, 1,
0.6948692, 0.8626281, 0.6605483, 0.4823529, 0, 1, 1,
0.6959581, 1.756748, 0.983565, 0.4862745, 0, 1, 1,
0.6970949, 0.9522486, 0.2201969, 0.4941176, 0, 1, 1,
0.6973549, 1.139785, 0.3093411, 0.5019608, 0, 1, 1,
0.700613, 0.5294434, 1.347272, 0.5058824, 0, 1, 1,
0.7017269, -0.2564964, 2.109131, 0.5137255, 0, 1, 1,
0.7025592, -1.027569, 4.33269, 0.5176471, 0, 1, 1,
0.7086146, 1.026377, 1.379539, 0.5254902, 0, 1, 1,
0.7159268, 0.6485024, 2.032468, 0.5294118, 0, 1, 1,
0.7171931, -2.18007, 5.3478, 0.5372549, 0, 1, 1,
0.7172999, 0.3126431, -0.1409801, 0.5411765, 0, 1, 1,
0.7210459, -1.182214, 3.07847, 0.5490196, 0, 1, 1,
0.7248596, 1.729343, 0.4560809, 0.5529412, 0, 1, 1,
0.7254176, -2.935092, 3.161656, 0.5607843, 0, 1, 1,
0.7269723, -0.7555172, 0.9052955, 0.5647059, 0, 1, 1,
0.7299945, -0.1788739, 2.591608, 0.572549, 0, 1, 1,
0.7328158, -1.293671, 2.029561, 0.5764706, 0, 1, 1,
0.7329434, 0.7706344, -2.716763, 0.5843138, 0, 1, 1,
0.7360187, -0.8024175, 2.76286, 0.5882353, 0, 1, 1,
0.7432344, -1.233291, 2.815264, 0.5960785, 0, 1, 1,
0.7517478, 0.9767262, 0.1822719, 0.6039216, 0, 1, 1,
0.7532901, -0.2644801, 1.293624, 0.6078432, 0, 1, 1,
0.7541353, -1.031265, -1.319053, 0.6156863, 0, 1, 1,
0.7571362, 0.6314245, 1.591513, 0.6196079, 0, 1, 1,
0.7607121, 1.365831, 0.05703837, 0.627451, 0, 1, 1,
0.7628286, 0.1089384, -0.7891647, 0.6313726, 0, 1, 1,
0.763074, 0.7502629, -0.09570435, 0.6392157, 0, 1, 1,
0.7695909, -2.479138, 2.721705, 0.6431373, 0, 1, 1,
0.7721801, -0.2438139, 2.790304, 0.6509804, 0, 1, 1,
0.7740338, -1.177035, 2.927199, 0.654902, 0, 1, 1,
0.7763013, 0.4626778, 0.2224643, 0.6627451, 0, 1, 1,
0.7818355, 2.423049, -0.09594852, 0.6666667, 0, 1, 1,
0.7831367, -2.541475, 1.258706, 0.6745098, 0, 1, 1,
0.7832881, 0.1300404, 1.6493, 0.6784314, 0, 1, 1,
0.78733, -0.5855715, 1.664985, 0.6862745, 0, 1, 1,
0.7889612, -0.6509511, 1.943661, 0.6901961, 0, 1, 1,
0.7911205, 0.2901976, 1.088918, 0.6980392, 0, 1, 1,
0.7942122, 2.087617, 0.6925387, 0.7058824, 0, 1, 1,
0.7943706, -1.392991, 3.571662, 0.7098039, 0, 1, 1,
0.7969831, 1.454599, -0.1880963, 0.7176471, 0, 1, 1,
0.7994887, 1.515803, -0.2423202, 0.7215686, 0, 1, 1,
0.8077548, -0.6022282, 2.045254, 0.7294118, 0, 1, 1,
0.8091516, -1.16855, 2.443645, 0.7333333, 0, 1, 1,
0.8200716, 0.6670898, -0.2302385, 0.7411765, 0, 1, 1,
0.8212332, 1.334656, -0.7271694, 0.7450981, 0, 1, 1,
0.822808, 0.4432694, 1.115141, 0.7529412, 0, 1, 1,
0.8256874, -0.9853795, 2.874638, 0.7568628, 0, 1, 1,
0.8271599, -0.4031986, 3.4833, 0.7647059, 0, 1, 1,
0.8287904, -0.1267916, 1.208438, 0.7686275, 0, 1, 1,
0.8328411, -0.4147215, 4.086802, 0.7764706, 0, 1, 1,
0.8349281, -0.1371829, 2.83474, 0.7803922, 0, 1, 1,
0.8365038, -0.2409443, 1.782346, 0.7882353, 0, 1, 1,
0.841266, -0.3288378, 2.064822, 0.7921569, 0, 1, 1,
0.8424106, 0.1898376, 1.187808, 0.8, 0, 1, 1,
0.8478163, 0.2247165, 2.366257, 0.8078431, 0, 1, 1,
0.8485404, -0.7105597, 1.326833, 0.8117647, 0, 1, 1,
0.8534262, -0.06624213, 4.366915, 0.8196079, 0, 1, 1,
0.855024, 0.07813655, 3.074624, 0.8235294, 0, 1, 1,
0.8590189, -1.032608, 3.290372, 0.8313726, 0, 1, 1,
0.8678293, -0.6000801, 2.285665, 0.8352941, 0, 1, 1,
0.8681991, 2.04763, 0.2008504, 0.8431373, 0, 1, 1,
0.8683305, -0.4650652, 1.794088, 0.8470588, 0, 1, 1,
0.8696242, -0.7845775, 2.217629, 0.854902, 0, 1, 1,
0.8738829, -0.2533511, 2.839339, 0.8588235, 0, 1, 1,
0.8857341, -1.606344, 2.371915, 0.8666667, 0, 1, 1,
0.887648, 2.690531, -1.386629, 0.8705882, 0, 1, 1,
0.8881646, -0.5019011, 2.614979, 0.8784314, 0, 1, 1,
0.8890335, -1.294674, 3.316398, 0.8823529, 0, 1, 1,
0.8902041, 1.110934, 1.214622, 0.8901961, 0, 1, 1,
0.8963815, 0.3489814, 0.5589731, 0.8941177, 0, 1, 1,
0.8964955, -1.644974, 2.433047, 0.9019608, 0, 1, 1,
0.897553, 0.3823363, 0.8912157, 0.9098039, 0, 1, 1,
0.9168372, -0.4485661, 2.401564, 0.9137255, 0, 1, 1,
0.9220482, 1.419301, 1.227258, 0.9215686, 0, 1, 1,
0.9259231, -0.07779884, 1.695253, 0.9254902, 0, 1, 1,
0.9283416, 1.28864, -0.4674563, 0.9333333, 0, 1, 1,
0.9404097, 0.6706475, 2.149335, 0.9372549, 0, 1, 1,
0.9429119, -0.1745877, 1.961671, 0.945098, 0, 1, 1,
0.9463731, -0.5158772, 0.3965576, 0.9490196, 0, 1, 1,
0.9476741, 0.01666898, 1.389897, 0.9568627, 0, 1, 1,
0.948992, -0.8980753, 1.528345, 0.9607843, 0, 1, 1,
0.9490517, -0.9419241, 2.532825, 0.9686275, 0, 1, 1,
0.9519194, 0.9315055, 1.637397, 0.972549, 0, 1, 1,
0.9601619, 0.07395151, 1.369565, 0.9803922, 0, 1, 1,
0.9621548, -0.6382776, 3.10867, 0.9843137, 0, 1, 1,
0.963082, 0.1125288, 2.592052, 0.9921569, 0, 1, 1,
0.9634842, -0.4835948, 3.389824, 0.9960784, 0, 1, 1,
0.9639514, 0.7277195, -0.06670538, 1, 0, 0.9960784, 1,
0.9639677, -0.2917241, 4.006419, 1, 0, 0.9882353, 1,
0.9650845, -1.019114, 2.898672, 1, 0, 0.9843137, 1,
0.9752856, -1.25492, 3.012035, 1, 0, 0.9764706, 1,
0.9800388, -1.574952, 4.974887, 1, 0, 0.972549, 1,
0.9880572, 0.3809952, -0.1297422, 1, 0, 0.9647059, 1,
0.9963828, -0.159545, 0.6087559, 1, 0, 0.9607843, 1,
1.005978, 0.2094491, 1.181919, 1, 0, 0.9529412, 1,
1.010634, -0.4552779, 0.004650685, 1, 0, 0.9490196, 1,
1.012148, 0.001255847, 0.7407311, 1, 0, 0.9411765, 1,
1.026196, -1.014001, 2.664497, 1, 0, 0.9372549, 1,
1.034524, 1.141356, 0.2439902, 1, 0, 0.9294118, 1,
1.045395, -0.1503738, 1.963115, 1, 0, 0.9254902, 1,
1.046668, -1.342063, 2.704115, 1, 0, 0.9176471, 1,
1.053651, 0.792401, 2.629503, 1, 0, 0.9137255, 1,
1.061257, -0.209245, 2.202841, 1, 0, 0.9058824, 1,
1.065239, -0.03856853, 1.991457, 1, 0, 0.9019608, 1,
1.066616, 0.003658263, 0.6316622, 1, 0, 0.8941177, 1,
1.074468, 0.9332485, 1.797215, 1, 0, 0.8862745, 1,
1.075883, -0.9783114, 3.435449, 1, 0, 0.8823529, 1,
1.08032, -0.7398393, 3.181025, 1, 0, 0.8745098, 1,
1.08349, -0.8597904, 1.04001, 1, 0, 0.8705882, 1,
1.084942, -0.9183456, 3.096501, 1, 0, 0.8627451, 1,
1.08581, -0.5882616, 4.012652, 1, 0, 0.8588235, 1,
1.086199, -1.61873, 2.856529, 1, 0, 0.8509804, 1,
1.088389, -1.309817, 1.650128, 1, 0, 0.8470588, 1,
1.090302, -0.8338009, 2.726411, 1, 0, 0.8392157, 1,
1.091687, -2.000119, 0.6267058, 1, 0, 0.8352941, 1,
1.095298, -0.3108229, 3.014042, 1, 0, 0.827451, 1,
1.096101, -0.1244902, 0.6452811, 1, 0, 0.8235294, 1,
1.107781, -0.7605454, 2.792944, 1, 0, 0.8156863, 1,
1.109621, -0.7201048, 0.7766824, 1, 0, 0.8117647, 1,
1.11196, -0.02297028, 0.2793058, 1, 0, 0.8039216, 1,
1.112457, 0.2858114, 1.806287, 1, 0, 0.7960784, 1,
1.115151, 1.469694, 2.196449, 1, 0, 0.7921569, 1,
1.121997, 1.093134, -0.5826321, 1, 0, 0.7843137, 1,
1.127599, -0.07854604, 1.010175, 1, 0, 0.7803922, 1,
1.131626, 1.65688, -0.1903203, 1, 0, 0.772549, 1,
1.14685, -1.375989, 2.923913, 1, 0, 0.7686275, 1,
1.14887, -0.8954084, 2.755411, 1, 0, 0.7607843, 1,
1.159954, 0.03969414, 1.264555, 1, 0, 0.7568628, 1,
1.16118, -0.6220917, 3.524934, 1, 0, 0.7490196, 1,
1.162739, 0.2265726, 1.022355, 1, 0, 0.7450981, 1,
1.172308, 0.02351434, 0.2804442, 1, 0, 0.7372549, 1,
1.177003, 0.2746446, 1.215087, 1, 0, 0.7333333, 1,
1.18618, 0.561244, 0.09315374, 1, 0, 0.7254902, 1,
1.187571, -0.2191004, 1.147945, 1, 0, 0.7215686, 1,
1.19179, -0.06616053, 0.6838857, 1, 0, 0.7137255, 1,
1.196285, 0.0788556, 0.3485942, 1, 0, 0.7098039, 1,
1.203158, 0.2028698, 0.763212, 1, 0, 0.7019608, 1,
1.204065, 0.4407488, 1.224362, 1, 0, 0.6941177, 1,
1.205991, -0.7878466, 2.831597, 1, 0, 0.6901961, 1,
1.214, 0.3006675, 1.868912, 1, 0, 0.682353, 1,
1.215027, 2.027858, 0.8405266, 1, 0, 0.6784314, 1,
1.230375, 1.056515, 0.7410259, 1, 0, 0.6705883, 1,
1.239947, -1.095764, 1.607634, 1, 0, 0.6666667, 1,
1.24249, -1.751747, 2.586055, 1, 0, 0.6588235, 1,
1.242619, -1.049781, 2.217001, 1, 0, 0.654902, 1,
1.244053, -1.471191, 1.818927, 1, 0, 0.6470588, 1,
1.247766, -2.263851, 2.834866, 1, 0, 0.6431373, 1,
1.250584, 1.476801, -0.3644758, 1, 0, 0.6352941, 1,
1.25128, 0.1490124, -0.1752801, 1, 0, 0.6313726, 1,
1.267555, 1.073446, -0.9852016, 1, 0, 0.6235294, 1,
1.26903, 0.7266335, -1.767364, 1, 0, 0.6196079, 1,
1.270903, -1.358555, 1.570161, 1, 0, 0.6117647, 1,
1.275897, 1.948965, 1.167442, 1, 0, 0.6078432, 1,
1.28408, -0.4939817, 2.294301, 1, 0, 0.6, 1,
1.286504, 1.807325, 0.3222287, 1, 0, 0.5921569, 1,
1.289343, -0.339947, 2.467504, 1, 0, 0.5882353, 1,
1.303553, -0.6540172, 1.237921, 1, 0, 0.5803922, 1,
1.308865, 0.3478641, 1.68123, 1, 0, 0.5764706, 1,
1.318121, -0.2817289, 0.7779167, 1, 0, 0.5686275, 1,
1.318141, -0.2038992, 0.6424018, 1, 0, 0.5647059, 1,
1.328582, -1.422026, 2.852826, 1, 0, 0.5568628, 1,
1.333757, 0.5550469, 0.547514, 1, 0, 0.5529412, 1,
1.349234, -0.5613952, 2.076231, 1, 0, 0.5450981, 1,
1.371208, 0.272705, 0.5103807, 1, 0, 0.5411765, 1,
1.382334, -0.4506183, 1.533536, 1, 0, 0.5333334, 1,
1.384447, 0.5215973, 2.018058, 1, 0, 0.5294118, 1,
1.387208, 0.3127452, 1.191789, 1, 0, 0.5215687, 1,
1.38868, -0.3559902, 2.611359, 1, 0, 0.5176471, 1,
1.393297, 2.030239, 0.136857, 1, 0, 0.509804, 1,
1.394017, -1.577083, 0.8273494, 1, 0, 0.5058824, 1,
1.399095, -0.1017988, 1.661577, 1, 0, 0.4980392, 1,
1.40095, 0.6817855, 1.969586, 1, 0, 0.4901961, 1,
1.407418, -1.36327, 2.960859, 1, 0, 0.4862745, 1,
1.408989, -1.309298, 4.307708, 1, 0, 0.4784314, 1,
1.422282, 0.3833625, 2.159072, 1, 0, 0.4745098, 1,
1.426788, -0.5708395, 1.482328, 1, 0, 0.4666667, 1,
1.435036, 0.5773055, 0.8358431, 1, 0, 0.4627451, 1,
1.438434, -0.6612659, 0.7950188, 1, 0, 0.454902, 1,
1.447421, -0.859201, 0.7090365, 1, 0, 0.4509804, 1,
1.459017, 0.9196256, 1.118927, 1, 0, 0.4431373, 1,
1.460373, 0.1379502, 1.419737, 1, 0, 0.4392157, 1,
1.462774, -0.1727789, 1.302721, 1, 0, 0.4313726, 1,
1.463445, 2.075292, 0.1960817, 1, 0, 0.427451, 1,
1.475136, 0.01398561, -0.6417573, 1, 0, 0.4196078, 1,
1.479789, 0.8968194, 1.876153, 1, 0, 0.4156863, 1,
1.48265, -0.6117604, 0.5812022, 1, 0, 0.4078431, 1,
1.482663, 1.03883, 0.6859136, 1, 0, 0.4039216, 1,
1.484363, 0.2801639, 1.373603, 1, 0, 0.3960784, 1,
1.500628, -0.4876863, 1.240173, 1, 0, 0.3882353, 1,
1.50523, -0.3944127, 2.849621, 1, 0, 0.3843137, 1,
1.508652, -0.2608943, 2.17733, 1, 0, 0.3764706, 1,
1.519776, 0.5545244, 1.216036, 1, 0, 0.372549, 1,
1.528713, 0.06035285, 1.746222, 1, 0, 0.3647059, 1,
1.529116, -1.637896, 2.720098, 1, 0, 0.3607843, 1,
1.529756, -0.4797975, 1.080805, 1, 0, 0.3529412, 1,
1.538152, -1.266292, 2.891323, 1, 0, 0.3490196, 1,
1.544784, -0.5963622, 3.254009, 1, 0, 0.3411765, 1,
1.547646, 1.17603, 0.5839363, 1, 0, 0.3372549, 1,
1.559243, 0.4203519, 1.53253, 1, 0, 0.3294118, 1,
1.570529, 0.4089387, 1.565739, 1, 0, 0.3254902, 1,
1.578129, 0.5798715, 3.395159, 1, 0, 0.3176471, 1,
1.578148, -0.4227902, 0.7298116, 1, 0, 0.3137255, 1,
1.579207, -0.8780521, 2.450507, 1, 0, 0.3058824, 1,
1.58389, -0.3670675, 2.852792, 1, 0, 0.2980392, 1,
1.592426, -0.7730722, 2.769329, 1, 0, 0.2941177, 1,
1.620898, -0.1013519, 2.72867, 1, 0, 0.2862745, 1,
1.630979, 0.3313475, 2.376094, 1, 0, 0.282353, 1,
1.643369, 0.1989015, 3.306874, 1, 0, 0.2745098, 1,
1.644719, 1.338997, 1.568849, 1, 0, 0.2705882, 1,
1.657979, 0.506695, 2.143736, 1, 0, 0.2627451, 1,
1.660131, -1.306413, 1.196274, 1, 0, 0.2588235, 1,
1.685582, 0.7398478, 0.3443539, 1, 0, 0.2509804, 1,
1.690804, 1.043989, 2.107751, 1, 0, 0.2470588, 1,
1.694501, -0.2864197, 0.7790739, 1, 0, 0.2392157, 1,
1.694983, -0.7510744, 1.011372, 1, 0, 0.2352941, 1,
1.706194, -0.3791409, 1.593021, 1, 0, 0.227451, 1,
1.706645, 0.8478133, 2.170204, 1, 0, 0.2235294, 1,
1.713222, -1.186854, 2.302154, 1, 0, 0.2156863, 1,
1.714473, 0.2829457, 0.008413112, 1, 0, 0.2117647, 1,
1.734515, 1.236439, 0.2300091, 1, 0, 0.2039216, 1,
1.760905, 0.6243719, 2.191872, 1, 0, 0.1960784, 1,
1.782492, -1.391594, 3.430682, 1, 0, 0.1921569, 1,
1.789424, -1.092572, 2.71046, 1, 0, 0.1843137, 1,
1.798311, 0.1475176, 1.191131, 1, 0, 0.1803922, 1,
1.805703, 0.05730151, 1.119121, 1, 0, 0.172549, 1,
1.818477, 0.5934209, 2.177608, 1, 0, 0.1686275, 1,
1.828609, 2.08021, 1.598768, 1, 0, 0.1607843, 1,
1.856057, -1.344656, 3.070021, 1, 0, 0.1568628, 1,
1.857713, 1.92119, 1.412952, 1, 0, 0.1490196, 1,
1.865656, 1.227088, 1.448906, 1, 0, 0.145098, 1,
1.871431, 0.8060024, 0.01668122, 1, 0, 0.1372549, 1,
1.876583, 0.4388227, -0.08631428, 1, 0, 0.1333333, 1,
1.878962, -1.043229, 3.398185, 1, 0, 0.1254902, 1,
1.882562, -0.1162266, -0.5563846, 1, 0, 0.1215686, 1,
1.884662, -0.698996, 1.72924, 1, 0, 0.1137255, 1,
1.91857, 0.3596541, 1.792556, 1, 0, 0.1098039, 1,
1.944233, -0.8772228, 2.325158, 1, 0, 0.1019608, 1,
2.017145, 0.1948142, 0.3828942, 1, 0, 0.09411765, 1,
2.032162, 0.3102251, 1.195693, 1, 0, 0.09019608, 1,
2.055669, -0.5937799, 0.8503218, 1, 0, 0.08235294, 1,
2.083036, -0.544122, 2.021165, 1, 0, 0.07843138, 1,
2.100129, 2.636222, -0.3026423, 1, 0, 0.07058824, 1,
2.136787, -0.3861839, 1.499251, 1, 0, 0.06666667, 1,
2.148777, -0.2164164, 2.080522, 1, 0, 0.05882353, 1,
2.157221, -0.3704678, 0.7655723, 1, 0, 0.05490196, 1,
2.202621, 0.3322212, 0.8406143, 1, 0, 0.04705882, 1,
2.235198, -1.626155, 2.962784, 1, 0, 0.04313726, 1,
2.251911, -0.6426777, 2.697985, 1, 0, 0.03529412, 1,
2.252325, 0.4889691, 0.2968468, 1, 0, 0.03137255, 1,
2.396714, 0.2303468, 3.038565, 1, 0, 0.02352941, 1,
2.466557, 1.249542, 0.8334633, 1, 0, 0.01960784, 1,
2.873343, 0.7501515, 1.932535, 1, 0, 0.01176471, 1,
3.188269, -0.5234429, 2.864541, 1, 0, 0.007843138, 1
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
-0.4200587, -4.502314, -7.637047, 0, -0.5, 0.5, 0.5,
-0.4200587, -4.502314, -7.637047, 1, -0.5, 0.5, 0.5,
-0.4200587, -4.502314, -7.637047, 1, 1.5, 0.5, 0.5,
-0.4200587, -4.502314, -7.637047, 0, 1.5, 0.5, 0.5
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
-5.251609, 0.02440476, -7.637047, 0, -0.5, 0.5, 0.5,
-5.251609, 0.02440476, -7.637047, 1, -0.5, 0.5, 0.5,
-5.251609, 0.02440476, -7.637047, 1, 1.5, 0.5, 0.5,
-5.251609, 0.02440476, -7.637047, 0, 1.5, 0.5, 0.5
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
-5.251609, -4.502314, -0.2036524, 0, -0.5, 0.5, 0.5,
-5.251609, -4.502314, -0.2036524, 1, -0.5, 0.5, 0.5,
-5.251609, -4.502314, -0.2036524, 1, 1.5, 0.5, 0.5,
-5.251609, -4.502314, -0.2036524, 0, 1.5, 0.5, 0.5
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
-4, -3.457686, -5.921648,
2, -3.457686, -5.921648,
-4, -3.457686, -5.921648,
-4, -3.631791, -6.207548,
-2, -3.457686, -5.921648,
-2, -3.631791, -6.207548,
0, -3.457686, -5.921648,
0, -3.631791, -6.207548,
2, -3.457686, -5.921648,
2, -3.631791, -6.207548
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
"-4",
"-2",
"0",
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
-4, -3.98, -6.779347, 0, -0.5, 0.5, 0.5,
-4, -3.98, -6.779347, 1, -0.5, 0.5, 0.5,
-4, -3.98, -6.779347, 1, 1.5, 0.5, 0.5,
-4, -3.98, -6.779347, 0, 1.5, 0.5, 0.5,
-2, -3.98, -6.779347, 0, -0.5, 0.5, 0.5,
-2, -3.98, -6.779347, 1, -0.5, 0.5, 0.5,
-2, -3.98, -6.779347, 1, 1.5, 0.5, 0.5,
-2, -3.98, -6.779347, 0, 1.5, 0.5, 0.5,
0, -3.98, -6.779347, 0, -0.5, 0.5, 0.5,
0, -3.98, -6.779347, 1, -0.5, 0.5, 0.5,
0, -3.98, -6.779347, 1, 1.5, 0.5, 0.5,
0, -3.98, -6.779347, 0, 1.5, 0.5, 0.5,
2, -3.98, -6.779347, 0, -0.5, 0.5, 0.5,
2, -3.98, -6.779347, 1, -0.5, 0.5, 0.5,
2, -3.98, -6.779347, 1, 1.5, 0.5, 0.5,
2, -3.98, -6.779347, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.136636, -3, -5.921648,
-4.136636, 3, -5.921648,
-4.136636, -3, -5.921648,
-4.322465, -3, -6.207548,
-4.136636, -2, -5.921648,
-4.322465, -2, -6.207548,
-4.136636, -1, -5.921648,
-4.322465, -1, -6.207548,
-4.136636, 0, -5.921648,
-4.322465, 0, -6.207548,
-4.136636, 1, -5.921648,
-4.322465, 1, -6.207548,
-4.136636, 2, -5.921648,
-4.322465, 2, -6.207548,
-4.136636, 3, -5.921648,
-4.322465, 3, -6.207548
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
-4.694122, -3, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, -3, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, -3, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, -3, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, -2, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, -2, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, -2, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, -2, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, -1, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, -1, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, -1, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, -1, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, 0, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, 0, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, 0, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, 0, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, 1, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, 1, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, 1, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, 1, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, 2, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, 2, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, 2, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, 2, -6.779347, 0, 1.5, 0.5, 0.5,
-4.694122, 3, -6.779347, 0, -0.5, 0.5, 0.5,
-4.694122, 3, -6.779347, 1, -0.5, 0.5, 0.5,
-4.694122, 3, -6.779347, 1, 1.5, 0.5, 0.5,
-4.694122, 3, -6.779347, 0, 1.5, 0.5, 0.5
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
-4.136636, -3.457686, -4,
-4.136636, -3.457686, 4,
-4.136636, -3.457686, -4,
-4.322465, -3.631791, -4,
-4.136636, -3.457686, -2,
-4.322465, -3.631791, -2,
-4.136636, -3.457686, 0,
-4.322465, -3.631791, 0,
-4.136636, -3.457686, 2,
-4.322465, -3.631791, 2,
-4.136636, -3.457686, 4,
-4.322465, -3.631791, 4
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
-4.694122, -3.98, -4, 0, -0.5, 0.5, 0.5,
-4.694122, -3.98, -4, 1, -0.5, 0.5, 0.5,
-4.694122, -3.98, -4, 1, 1.5, 0.5, 0.5,
-4.694122, -3.98, -4, 0, 1.5, 0.5, 0.5,
-4.694122, -3.98, -2, 0, -0.5, 0.5, 0.5,
-4.694122, -3.98, -2, 1, -0.5, 0.5, 0.5,
-4.694122, -3.98, -2, 1, 1.5, 0.5, 0.5,
-4.694122, -3.98, -2, 0, 1.5, 0.5, 0.5,
-4.694122, -3.98, 0, 0, -0.5, 0.5, 0.5,
-4.694122, -3.98, 0, 1, -0.5, 0.5, 0.5,
-4.694122, -3.98, 0, 1, 1.5, 0.5, 0.5,
-4.694122, -3.98, 0, 0, 1.5, 0.5, 0.5,
-4.694122, -3.98, 2, 0, -0.5, 0.5, 0.5,
-4.694122, -3.98, 2, 1, -0.5, 0.5, 0.5,
-4.694122, -3.98, 2, 1, 1.5, 0.5, 0.5,
-4.694122, -3.98, 2, 0, 1.5, 0.5, 0.5,
-4.694122, -3.98, 4, 0, -0.5, 0.5, 0.5,
-4.694122, -3.98, 4, 1, -0.5, 0.5, 0.5,
-4.694122, -3.98, 4, 1, 1.5, 0.5, 0.5,
-4.694122, -3.98, 4, 0, 1.5, 0.5, 0.5
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
-4.136636, -3.457686, -5.921648,
-4.136636, 3.506496, -5.921648,
-4.136636, -3.457686, 5.514343,
-4.136636, 3.506496, 5.514343,
-4.136636, -3.457686, -5.921648,
-4.136636, -3.457686, 5.514343,
-4.136636, 3.506496, -5.921648,
-4.136636, 3.506496, 5.514343,
-4.136636, -3.457686, -5.921648,
3.296519, -3.457686, -5.921648,
-4.136636, -3.457686, 5.514343,
3.296519, -3.457686, 5.514343,
-4.136636, 3.506496, -5.921648,
3.296519, 3.506496, -5.921648,
-4.136636, 3.506496, 5.514343,
3.296519, 3.506496, 5.514343,
3.296519, -3.457686, -5.921648,
3.296519, 3.506496, -5.921648,
3.296519, -3.457686, 5.514343,
3.296519, 3.506496, 5.514343,
3.296519, -3.457686, -5.921648,
3.296519, -3.457686, 5.514343,
3.296519, 3.506496, -5.921648,
3.296519, 3.506496, 5.514343
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
var radius = 8.177639;
var distance = 36.38324;
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
mvMatrix.translate( 0.4200587, -0.02440476, 0.2036524 );
mvMatrix.scale( 1.189512, 1.269614, 0.7731575 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.38324);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
biphenyl<-read.table("biphenyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-biphenyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
```

```r
y<-biphenyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
```

```r
z<-biphenyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'biphenyl' not found
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
-4.028386, 0.6725424, -1.399831, 0, 0, 1, 1, 1,
-3.290213, -0.4513971, 0.03694126, 1, 0, 0, 1, 1,
-3.104472, 1.231589, -0.7223173, 1, 0, 0, 1, 1,
-3.046436, -0.5747287, -0.5922186, 1, 0, 0, 1, 1,
-2.901639, 0.2706702, -1.315092, 1, 0, 0, 1, 1,
-2.780075, 1.981772, -1.069442, 1, 0, 0, 1, 1,
-2.702121, -0.5311309, -1.913311, 0, 0, 0, 1, 1,
-2.617602, -1.207756, -3.044217, 0, 0, 0, 1, 1,
-2.58826, -0.6651239, -3.749455, 0, 0, 0, 1, 1,
-2.483038, 0.5105868, -0.9184531, 0, 0, 0, 1, 1,
-2.420022, 0.8046826, -0.6655665, 0, 0, 0, 1, 1,
-2.339526, 0.5293503, -2.440215, 0, 0, 0, 1, 1,
-2.335981, 0.2477335, -1.390789, 0, 0, 0, 1, 1,
-2.202219, -0.584971, -1.385459, 1, 1, 1, 1, 1,
-2.188557, -0.1747856, -2.941792, 1, 1, 1, 1, 1,
-2.157991, 1.042955, -2.597457, 1, 1, 1, 1, 1,
-2.120388, -1.248789, -2.799189, 1, 1, 1, 1, 1,
-2.095058, 1.41475, -1.249212, 1, 1, 1, 1, 1,
-2.06806, 0.8892951, -0.2962098, 1, 1, 1, 1, 1,
-2.042692, -1.415624, -1.583815, 1, 1, 1, 1, 1,
-2.038401, -0.7053128, -1.819186, 1, 1, 1, 1, 1,
-2.032527, 1.614862, -1.056856, 1, 1, 1, 1, 1,
-2.022506, -0.4821777, -2.088148, 1, 1, 1, 1, 1,
-2.001129, -0.4664975, -1.761496, 1, 1, 1, 1, 1,
-1.967863, 0.4006067, -0.5829116, 1, 1, 1, 1, 1,
-1.953369, 0.5353754, -0.8769484, 1, 1, 1, 1, 1,
-1.943604, 0.7719526, -0.5637715, 1, 1, 1, 1, 1,
-1.935804, 0.2907867, -2.313684, 1, 1, 1, 1, 1,
-1.934752, 1.1855, -3.080917, 0, 0, 1, 1, 1,
-1.896423, -0.9320825, 1.019256, 1, 0, 0, 1, 1,
-1.892117, 0.2492873, -2.324505, 1, 0, 0, 1, 1,
-1.843641, 0.981281, -1.059137, 1, 0, 0, 1, 1,
-1.834141, 0.5171482, -0.3712021, 1, 0, 0, 1, 1,
-1.809912, -0.2656768, -4.22783, 1, 0, 0, 1, 1,
-1.808822, 0.4520357, -2.762068, 0, 0, 0, 1, 1,
-1.807551, 0.25311, -2.869922, 0, 0, 0, 1, 1,
-1.797195, -0.1336532, -3.141313, 0, 0, 0, 1, 1,
-1.779258, -0.4009695, -1.242854, 0, 0, 0, 1, 1,
-1.773206, -0.6895214, -1.392811, 0, 0, 0, 1, 1,
-1.771148, 1.156727, 0.1860529, 0, 0, 0, 1, 1,
-1.770808, -0.9424075, -2.898012, 0, 0, 0, 1, 1,
-1.763973, 0.2972725, -0.940083, 1, 1, 1, 1, 1,
-1.754427, -0.3468831, -2.715055, 1, 1, 1, 1, 1,
-1.753746, 1.471754, -1.134809, 1, 1, 1, 1, 1,
-1.746978, -1.648108, -1.789521, 1, 1, 1, 1, 1,
-1.733974, 0.2562521, 0.9887763, 1, 1, 1, 1, 1,
-1.714043, 0.2432826, -1.407824, 1, 1, 1, 1, 1,
-1.713561, -0.8261958, -1.046666, 1, 1, 1, 1, 1,
-1.693906, 0.7918898, -1.028334, 1, 1, 1, 1, 1,
-1.667485, -1.228088, -4.165637, 1, 1, 1, 1, 1,
-1.660358, 1.15618, -3.299223, 1, 1, 1, 1, 1,
-1.651946, 0.7995383, -1.222898, 1, 1, 1, 1, 1,
-1.641461, 0.6187589, -1.209996, 1, 1, 1, 1, 1,
-1.614558, 0.397542, -1.899407, 1, 1, 1, 1, 1,
-1.581337, 0.3979703, -0.8292233, 1, 1, 1, 1, 1,
-1.563305, -0.4767673, -1.58406, 1, 1, 1, 1, 1,
-1.547442, 1.298201, -2.138384, 0, 0, 1, 1, 1,
-1.544996, -0.4907894, -0.4778659, 1, 0, 0, 1, 1,
-1.539343, 0.1066108, -0.5757807, 1, 0, 0, 1, 1,
-1.536468, -0.4703279, -1.710852, 1, 0, 0, 1, 1,
-1.531271, -0.2305062, -1.816359, 1, 0, 0, 1, 1,
-1.527847, 0.1335189, -0.7576609, 1, 0, 0, 1, 1,
-1.521451, -0.2534074, -0.8101628, 0, 0, 0, 1, 1,
-1.515359, -1.32599, -1.760274, 0, 0, 0, 1, 1,
-1.49702, 1.484698, 0.4630845, 0, 0, 0, 1, 1,
-1.48441, 0.6505039, 0.6500624, 0, 0, 0, 1, 1,
-1.470757, 0.534914, -1.564577, 0, 0, 0, 1, 1,
-1.46096, 1.152687, -0.9530241, 0, 0, 0, 1, 1,
-1.452827, -1.406827, -0.5597299, 0, 0, 0, 1, 1,
-1.447596, -0.2535597, -1.955976, 1, 1, 1, 1, 1,
-1.433083, -0.3398209, 1.665896, 1, 1, 1, 1, 1,
-1.42413, -1.256201, -3.637177, 1, 1, 1, 1, 1,
-1.414234, -1.111839, -3.121055, 1, 1, 1, 1, 1,
-1.394884, -0.2278256, -1.975472, 1, 1, 1, 1, 1,
-1.377617, -1.056584, -3.015684, 1, 1, 1, 1, 1,
-1.362271, 0.8125319, -1.52249, 1, 1, 1, 1, 1,
-1.360073, 0.9646316, -0.3164855, 1, 1, 1, 1, 1,
-1.356948, 0.5769097, -1.335648, 1, 1, 1, 1, 1,
-1.353448, -0.7760693, -1.333509, 1, 1, 1, 1, 1,
-1.349487, -0.03522282, -0.8479932, 1, 1, 1, 1, 1,
-1.347971, 0.4103354, -2.720995, 1, 1, 1, 1, 1,
-1.345868, -1.712942, -2.256151, 1, 1, 1, 1, 1,
-1.343023, -0.2889195, -3.401128, 1, 1, 1, 1, 1,
-1.341491, -1.464055, -1.867413, 1, 1, 1, 1, 1,
-1.340873, 1.154772, -0.9891581, 0, 0, 1, 1, 1,
-1.324345, -0.924894, -1.904186, 1, 0, 0, 1, 1,
-1.322435, 0.2893221, -2.436142, 1, 0, 0, 1, 1,
-1.312429, -0.5225955, -0.7217823, 1, 0, 0, 1, 1,
-1.30102, 1.169924, 0.1035617, 1, 0, 0, 1, 1,
-1.297994, -1.95079, -2.704468, 1, 0, 0, 1, 1,
-1.294437, -0.1964319, -2.221706, 0, 0, 0, 1, 1,
-1.287991, -0.6211221, -3.041174, 0, 0, 0, 1, 1,
-1.285287, 0.6130655, -1.96739, 0, 0, 0, 1, 1,
-1.284169, 0.8729739, -0.1730243, 0, 0, 0, 1, 1,
-1.275951, 0.5863149, 0.6417406, 0, 0, 0, 1, 1,
-1.27579, 0.0260476, -0.4482922, 0, 0, 0, 1, 1,
-1.275483, -1.07803, -0.5570536, 0, 0, 0, 1, 1,
-1.271819, 0.2954538, -1.897252, 1, 1, 1, 1, 1,
-1.267319, -0.6897491, -0.804768, 1, 1, 1, 1, 1,
-1.255778, -0.4710853, -2.237299, 1, 1, 1, 1, 1,
-1.253973, 1.721187, -0.2434156, 1, 1, 1, 1, 1,
-1.248754, -0.4120158, -0.6651605, 1, 1, 1, 1, 1,
-1.238164, 0.3832306, -2.939529, 1, 1, 1, 1, 1,
-1.228919, 0.2719725, -1.79049, 1, 1, 1, 1, 1,
-1.220256, 1.223153, 1.222846, 1, 1, 1, 1, 1,
-1.21069, -0.0626023, -3.080124, 1, 1, 1, 1, 1,
-1.207836, -1.313548, -2.489521, 1, 1, 1, 1, 1,
-1.20543, 2.481283, 1.745545, 1, 1, 1, 1, 1,
-1.204168, 0.05702452, -0.3441115, 1, 1, 1, 1, 1,
-1.203507, -0.3300019, 0.8573887, 1, 1, 1, 1, 1,
-1.196331, 0.9531833, -1.635612, 1, 1, 1, 1, 1,
-1.195327, -0.9829004, -0.9979319, 1, 1, 1, 1, 1,
-1.180602, -0.08915313, -1.374839, 0, 0, 1, 1, 1,
-1.169713, 0.1647296, -2.485736, 1, 0, 0, 1, 1,
-1.169289, -0.6644055, -2.34885, 1, 0, 0, 1, 1,
-1.157971, -0.2500415, -3.036427, 1, 0, 0, 1, 1,
-1.156547, 0.09473308, -1.024693, 1, 0, 0, 1, 1,
-1.153592, 1.02204, -0.9571835, 1, 0, 0, 1, 1,
-1.149045, 1.925496, -0.1929853, 0, 0, 0, 1, 1,
-1.14523, -0.9195776, -3.662597, 0, 0, 0, 1, 1,
-1.14484, -0.912132, -2.875244, 0, 0, 0, 1, 1,
-1.141632, 0.3746841, -1.697987, 0, 0, 0, 1, 1,
-1.137542, -0.7568811, -1.322706, 0, 0, 0, 1, 1,
-1.12287, -0.8249722, -4.220369, 0, 0, 0, 1, 1,
-1.119727, -0.7541051, -2.231686, 0, 0, 0, 1, 1,
-1.116341, 0.09345736, -0.8172217, 1, 1, 1, 1, 1,
-1.112435, 0.6221921, 0.4911528, 1, 1, 1, 1, 1,
-1.10682, -1.081612, -3.824855, 1, 1, 1, 1, 1,
-1.088299, 0.9231225, -1.037585, 1, 1, 1, 1, 1,
-1.076453, 2.040538, 0.563872, 1, 1, 1, 1, 1,
-1.072711, -0.6273684, -0.5225204, 1, 1, 1, 1, 1,
-1.068641, 0.4484006, -0.4716123, 1, 1, 1, 1, 1,
-1.060676, -3.356266, -3.902204, 1, 1, 1, 1, 1,
-1.057072, 0.8566384, -1.002486, 1, 1, 1, 1, 1,
-1.051758, 1.072466, 0.1967386, 1, 1, 1, 1, 1,
-1.048487, 0.5155153, 0.2874195, 1, 1, 1, 1, 1,
-1.043324, -0.3822275, -1.460268, 1, 1, 1, 1, 1,
-1.039384, 0.8568286, -0.3033566, 1, 1, 1, 1, 1,
-1.037113, 2.176927, 0.6716135, 1, 1, 1, 1, 1,
-1.037014, -1.208093, -1.781394, 1, 1, 1, 1, 1,
-1.036836, 0.3546606, -0.4799335, 0, 0, 1, 1, 1,
-1.030663, 1.361258, -1.802298, 1, 0, 0, 1, 1,
-1.022117, -0.4687751, -1.929285, 1, 0, 0, 1, 1,
-1.020057, -1.485425, -1.514038, 1, 0, 0, 1, 1,
-1.018812, 1.143073, -0.9263248, 1, 0, 0, 1, 1,
-1.017471, 0.6671444, 0.4165672, 1, 0, 0, 1, 1,
-1.008816, 0.0631996, -2.50601, 0, 0, 0, 1, 1,
-1.007996, -0.3952478, -3.012091, 0, 0, 0, 1, 1,
-1.007234, 0.3174878, -1.959092, 0, 0, 0, 1, 1,
-1.007011, 0.7853071, -1.064139, 0, 0, 0, 1, 1,
-1.004668, 1.789904, 1.464178, 0, 0, 0, 1, 1,
-1.002699, 1.183393, -1.043629, 0, 0, 0, 1, 1,
-1.001555, 1.258299, -0.5881591, 0, 0, 0, 1, 1,
-0.9984553, -0.1231439, -2.781102, 1, 1, 1, 1, 1,
-0.9975705, -0.5244517, -1.065386, 1, 1, 1, 1, 1,
-0.9798329, -0.5559247, -1.613621, 1, 1, 1, 1, 1,
-0.9788879, 1.002419, -0.5011519, 1, 1, 1, 1, 1,
-0.9783654, -0.803901, -0.9224175, 1, 1, 1, 1, 1,
-0.9761116, 0.9521534, -1.181406, 1, 1, 1, 1, 1,
-0.9721066, 0.3500115, -1.428826, 1, 1, 1, 1, 1,
-0.9554035, 0.9942319, -2.647136, 1, 1, 1, 1, 1,
-0.9471468, 0.1603763, 0.4883157, 1, 1, 1, 1, 1,
-0.9426956, 0.6713737, -0.3115081, 1, 1, 1, 1, 1,
-0.9383572, -1.622093, -1.785281, 1, 1, 1, 1, 1,
-0.9345059, 2.321751, 0.1002439, 1, 1, 1, 1, 1,
-0.9335001, 0.3966057, -0.8865443, 1, 1, 1, 1, 1,
-0.9317725, -0.2996485, -2.234538, 1, 1, 1, 1, 1,
-0.930675, 0.2731073, -0.8529708, 1, 1, 1, 1, 1,
-0.9299877, 0.2628943, -0.4673493, 0, 0, 1, 1, 1,
-0.9280294, 1.168446, -2.209336, 1, 0, 0, 1, 1,
-0.9240729, 0.6753572, -0.09708824, 1, 0, 0, 1, 1,
-0.9233437, 1.508877, 0.7043585, 1, 0, 0, 1, 1,
-0.9170272, -1.229767, -1.749654, 1, 0, 0, 1, 1,
-0.9146001, 0.49369, -0.4007825, 1, 0, 0, 1, 1,
-0.9025655, -0.2237222, -2.37219, 0, 0, 0, 1, 1,
-0.9011111, -0.381143, -2.620276, 0, 0, 0, 1, 1,
-0.8900334, 0.5567769, -0.6947459, 0, 0, 0, 1, 1,
-0.8888887, -0.2443573, -2.516524, 0, 0, 0, 1, 1,
-0.8884, 0.8734128, -0.8562444, 0, 0, 0, 1, 1,
-0.8845685, 0.7123367, -1.955648, 0, 0, 0, 1, 1,
-0.8770893, 1.569345, 0.3422736, 0, 0, 0, 1, 1,
-0.8724814, -0.4454117, -1.95703, 1, 1, 1, 1, 1,
-0.8721203, 0.7890106, -2.770127, 1, 1, 1, 1, 1,
-0.8711122, -0.9401299, -1.317438, 1, 1, 1, 1, 1,
-0.8679615, -0.06652583, -0.9831865, 1, 1, 1, 1, 1,
-0.8678579, -2.001194, -3.114907, 1, 1, 1, 1, 1,
-0.8664805, 0.6066571, -1.16359, 1, 1, 1, 1, 1,
-0.8592352, -0.2519272, -2.645675, 1, 1, 1, 1, 1,
-0.858336, -0.3258089, -0.8056923, 1, 1, 1, 1, 1,
-0.857148, 0.2745496, -1.834576, 1, 1, 1, 1, 1,
-0.8534577, -0.4539257, -1.525879, 1, 1, 1, 1, 1,
-0.8525078, 0.5873694, -1.399625, 1, 1, 1, 1, 1,
-0.8524275, 1.684507, -2.812129, 1, 1, 1, 1, 1,
-0.8480558, -0.1284954, -1.863901, 1, 1, 1, 1, 1,
-0.8462389, -1.271792, -2.290658, 1, 1, 1, 1, 1,
-0.8431071, -0.08997209, -2.007484, 1, 1, 1, 1, 1,
-0.8430327, -0.9284475, -2.750629, 0, 0, 1, 1, 1,
-0.8398976, 0.001309432, -0.1746411, 1, 0, 0, 1, 1,
-0.8398299, -0.2163485, -1.177708, 1, 0, 0, 1, 1,
-0.8379763, 1.273645, -0.6850172, 1, 0, 0, 1, 1,
-0.8338924, -0.02659885, -1.580346, 1, 0, 0, 1, 1,
-0.8272893, 0.2987121, -0.7331778, 1, 0, 0, 1, 1,
-0.8231475, -0.03983553, -0.2263008, 0, 0, 0, 1, 1,
-0.8223695, 0.6997851, -0.1291659, 0, 0, 0, 1, 1,
-0.8202164, 1.038208, -0.5599076, 0, 0, 0, 1, 1,
-0.8176672, -0.04437861, -3.568783, 0, 0, 0, 1, 1,
-0.8161121, -0.530416, -1.813801, 0, 0, 0, 1, 1,
-0.8096769, -0.1200294, -2.644445, 0, 0, 0, 1, 1,
-0.8018638, 1.026258, 0.4849738, 0, 0, 0, 1, 1,
-0.8007838, -0.5607116, -1.4985, 1, 1, 1, 1, 1,
-0.7982035, -2.238816, -1.286309, 1, 1, 1, 1, 1,
-0.7942545, 0.483735, -1.711998, 1, 1, 1, 1, 1,
-0.7897426, -2.031756, -4.536744, 1, 1, 1, 1, 1,
-0.7893764, 2.407588, 0.3000325, 1, 1, 1, 1, 1,
-0.7888992, -1.131911, -1.496181, 1, 1, 1, 1, 1,
-0.7853451, 0.1122759, -0.9232341, 1, 1, 1, 1, 1,
-0.7792268, 0.7167593, -0.7099779, 1, 1, 1, 1, 1,
-0.7745288, 0.08131419, -1.270222, 1, 1, 1, 1, 1,
-0.7673898, 0.156183, -1.775604, 1, 1, 1, 1, 1,
-0.7669849, -0.7025524, -2.02107, 1, 1, 1, 1, 1,
-0.7667622, -1.691434, -0.4971333, 1, 1, 1, 1, 1,
-0.7661586, 0.2116224, -1.792464, 1, 1, 1, 1, 1,
-0.766057, 0.7057735, 0.5264742, 1, 1, 1, 1, 1,
-0.7616703, -0.0424374, -2.718604, 1, 1, 1, 1, 1,
-0.7586346, 1.362103, -2.042672, 0, 0, 1, 1, 1,
-0.7574133, -0.1210531, -1.929868, 1, 0, 0, 1, 1,
-0.7566401, 1.777198, 1.831659, 1, 0, 0, 1, 1,
-0.7526668, 0.8001035, -0.1415664, 1, 0, 0, 1, 1,
-0.7488791, -0.9522337, -1.891293, 1, 0, 0, 1, 1,
-0.74432, -0.9867414, -3.472877, 1, 0, 0, 1, 1,
-0.7437987, 0.8407521, -0.6747551, 0, 0, 0, 1, 1,
-0.7411616, -0.3554741, -4.090275, 0, 0, 0, 1, 1,
-0.7409734, -0.09425478, -0.5681784, 0, 0, 0, 1, 1,
-0.7366464, 1.08601, -2.13466, 0, 0, 0, 1, 1,
-0.7346514, 0.6138787, -0.007917578, 0, 0, 0, 1, 1,
-0.7292657, 2.381527, -0.9387358, 0, 0, 0, 1, 1,
-0.7259079, -0.6916464, -0.9105099, 0, 0, 0, 1, 1,
-0.725624, -1.189894, -1.818852, 1, 1, 1, 1, 1,
-0.7219021, -0.1518753, -1.699727, 1, 1, 1, 1, 1,
-0.7055433, -0.05818065, -1.397856, 1, 1, 1, 1, 1,
-0.7029802, -0.5962341, -2.835428, 1, 1, 1, 1, 1,
-0.6997594, -0.2160236, -1.771394, 1, 1, 1, 1, 1,
-0.6982746, -0.170274, -3.923594, 1, 1, 1, 1, 1,
-0.6958942, -1.15992, -3.023802, 1, 1, 1, 1, 1,
-0.6949837, 1.771746, -2.721833, 1, 1, 1, 1, 1,
-0.6931325, 0.8583124, -0.2862672, 1, 1, 1, 1, 1,
-0.6928964, -0.7916909, -3.196558, 1, 1, 1, 1, 1,
-0.6898283, 0.369613, -1.122121, 1, 1, 1, 1, 1,
-0.6833991, 0.1415804, -2.147053, 1, 1, 1, 1, 1,
-0.6833195, -0.4359489, -1.723437, 1, 1, 1, 1, 1,
-0.6735275, -0.7251148, -0.7794187, 1, 1, 1, 1, 1,
-0.669246, -0.377569, -1.160814, 1, 1, 1, 1, 1,
-0.6649737, -0.4324588, -3.205488, 0, 0, 1, 1, 1,
-0.6645674, 0.5941571, -0.6177441, 1, 0, 0, 1, 1,
-0.6615069, -0.618122, -3.233019, 1, 0, 0, 1, 1,
-0.6604085, -0.3140117, -0.7190009, 1, 0, 0, 1, 1,
-0.6587937, -1.122213, -2.023665, 1, 0, 0, 1, 1,
-0.6489474, -1.458242, -2.247136, 1, 0, 0, 1, 1,
-0.6467086, -0.674996, -1.163119, 0, 0, 0, 1, 1,
-0.6438326, -0.7321649, -3.525936, 0, 0, 0, 1, 1,
-0.6433763, -0.4805297, -1.748418, 0, 0, 0, 1, 1,
-0.6403726, 0.3143878, -0.5016587, 0, 0, 0, 1, 1,
-0.6387393, 1.326923, -1.26262, 0, 0, 0, 1, 1,
-0.6384929, 1.004917, -1.439945, 0, 0, 0, 1, 1,
-0.6353655, 0.8855268, -0.186496, 0, 0, 0, 1, 1,
-0.6290568, -0.08694295, -2.25093, 1, 1, 1, 1, 1,
-0.6236519, -0.7238129, -3.262433, 1, 1, 1, 1, 1,
-0.6196959, 1.711046, -1.651872, 1, 1, 1, 1, 1,
-0.6187682, 0.648253, 0.4010589, 1, 1, 1, 1, 1,
-0.6148917, 0.4723826, 0.6633664, 1, 1, 1, 1, 1,
-0.599848, -1.882965, -2.661511, 1, 1, 1, 1, 1,
-0.5997633, 0.03128556, -3.310382, 1, 1, 1, 1, 1,
-0.5996332, -0.1038336, -1.183325, 1, 1, 1, 1, 1,
-0.5979454, -1.398967, -1.450603, 1, 1, 1, 1, 1,
-0.5912508, -0.5955325, -0.05568584, 1, 1, 1, 1, 1,
-0.5902902, 0.2348369, 0.5526882, 1, 1, 1, 1, 1,
-0.5888683, -0.9993212, -3.747417, 1, 1, 1, 1, 1,
-0.5751857, 0.8670673, -0.2605141, 1, 1, 1, 1, 1,
-0.5736182, -0.1308695, -1.718792, 1, 1, 1, 1, 1,
-0.5733844, -0.4149809, -2.36531, 1, 1, 1, 1, 1,
-0.5715276, -0.04307653, -2.113652, 0, 0, 1, 1, 1,
-0.5647111, 1.386846, -1.073304, 1, 0, 0, 1, 1,
-0.5596257, 0.8186627, -0.4744967, 1, 0, 0, 1, 1,
-0.5565774, 0.7699189, -1.756133, 1, 0, 0, 1, 1,
-0.5553435, -1.232706, -2.294681, 1, 0, 0, 1, 1,
-0.553169, 0.2859645, -0.4847147, 1, 0, 0, 1, 1,
-0.5529837, -0.3726232, -1.732908, 0, 0, 0, 1, 1,
-0.5514067, -0.9151511, -2.892743, 0, 0, 0, 1, 1,
-0.5476841, -0.8031467, -2.231906, 0, 0, 0, 1, 1,
-0.5343983, -0.4856008, -1.831745, 0, 0, 0, 1, 1,
-0.5280987, 1.886056, -0.5969271, 0, 0, 0, 1, 1,
-0.5244115, -0.6714346, -2.033886, 0, 0, 0, 1, 1,
-0.5225702, 0.655201, 0.3671733, 0, 0, 0, 1, 1,
-0.5222285, -1.119474, -3.802761, 1, 1, 1, 1, 1,
-0.5196418, 0.6920684, 0.1781999, 1, 1, 1, 1, 1,
-0.5175875, 0.1175233, -1.072276, 1, 1, 1, 1, 1,
-0.5165257, 0.6162087, -1.482934, 1, 1, 1, 1, 1,
-0.5114629, -0.1528424, 1.042989, 1, 1, 1, 1, 1,
-0.5044565, -0.470187, -0.7839698, 1, 1, 1, 1, 1,
-0.5022508, 0.5943612, -0.8275853, 1, 1, 1, 1, 1,
-0.4921716, -0.803239, -1.514241, 1, 1, 1, 1, 1,
-0.4846679, -0.14332, -1.46732, 1, 1, 1, 1, 1,
-0.4813492, -0.527623, -2.919442, 1, 1, 1, 1, 1,
-0.4749923, 0.1627877, -2.235025, 1, 1, 1, 1, 1,
-0.4733054, -0.2674747, -3.441297, 1, 1, 1, 1, 1,
-0.4723726, -0.7459829, -2.498592, 1, 1, 1, 1, 1,
-0.4717065, -0.8699462, -2.212651, 1, 1, 1, 1, 1,
-0.4693942, 2.512491, -0.3990107, 1, 1, 1, 1, 1,
-0.4683253, 0.146789, -1.304623, 0, 0, 1, 1, 1,
-0.4681397, -0.6387112, -2.381334, 1, 0, 0, 1, 1,
-0.4650569, 0.8831896, -1.39117, 1, 0, 0, 1, 1,
-0.4603831, 0.8343015, -2.463965, 1, 0, 0, 1, 1,
-0.4602059, 0.2518764, -0.4069763, 1, 0, 0, 1, 1,
-0.4598465, -0.0691536, -2.073029, 1, 0, 0, 1, 1,
-0.4538367, -0.867355, -2.665929, 0, 0, 0, 1, 1,
-0.4534706, -0.7758487, -2.31277, 0, 0, 0, 1, 1,
-0.4500715, 0.2328168, -0.3655, 0, 0, 0, 1, 1,
-0.4406352, 0.1544876, 0.24865, 0, 0, 0, 1, 1,
-0.4386761, 0.03343952, -3.340566, 0, 0, 0, 1, 1,
-0.4382349, -1.576181, -3.688881, 0, 0, 0, 1, 1,
-0.4351854, -0.3879329, -1.638879, 0, 0, 0, 1, 1,
-0.4327826, 0.1231961, -1.30415, 1, 1, 1, 1, 1,
-0.4317343, -1.939746, -1.965157, 1, 1, 1, 1, 1,
-0.4274513, 1.755442, -1.59218, 1, 1, 1, 1, 1,
-0.4213509, 0.6395267, -0.6445062, 1, 1, 1, 1, 1,
-0.4212234, 1.542339, -1.048397, 1, 1, 1, 1, 1,
-0.41947, 1.436785, -1.019739, 1, 1, 1, 1, 1,
-0.4180439, 1.811726, 0.5577493, 1, 1, 1, 1, 1,
-0.4161361, -1.016552, -2.376459, 1, 1, 1, 1, 1,
-0.4149506, 0.10547, -1.517492, 1, 1, 1, 1, 1,
-0.4117032, 1.356437, 0.8033975, 1, 1, 1, 1, 1,
-0.3989103, -1.581284, -3.580479, 1, 1, 1, 1, 1,
-0.3937756, -0.8020483, -2.862345, 1, 1, 1, 1, 1,
-0.3898255, 0.05993313, -0.8167604, 1, 1, 1, 1, 1,
-0.3883816, 0.974521, 1.343078, 1, 1, 1, 1, 1,
-0.387698, -0.6208486, -3.986166, 1, 1, 1, 1, 1,
-0.3863259, -1.884235, -1.473334, 0, 0, 1, 1, 1,
-0.3770127, 1.07577, -0.1759307, 1, 0, 0, 1, 1,
-0.3767772, -1.65617, -2.743949, 1, 0, 0, 1, 1,
-0.3733324, -0.685908, -3.042228, 1, 0, 0, 1, 1,
-0.3648128, 0.02299739, -2.155996, 1, 0, 0, 1, 1,
-0.3641703, -0.008460191, -1.996366, 1, 0, 0, 1, 1,
-0.3623528, -0.1663259, -1.304359, 0, 0, 0, 1, 1,
-0.3617928, 0.8650542, -1.210006, 0, 0, 0, 1, 1,
-0.3604264, -0.3782245, -1.742821, 0, 0, 0, 1, 1,
-0.360348, -0.7635534, -1.197355, 0, 0, 0, 1, 1,
-0.3493881, 1.125514, 0.2674231, 0, 0, 0, 1, 1,
-0.3461097, -0.9763764, -2.274625, 0, 0, 0, 1, 1,
-0.3450565, -2.222684, -2.710131, 0, 0, 0, 1, 1,
-0.3441261, -0.2120459, -1.818804, 1, 1, 1, 1, 1,
-0.3422209, 0.4355994, 0.06290349, 1, 1, 1, 1, 1,
-0.3411979, -0.1296483, -2.471041, 1, 1, 1, 1, 1,
-0.3406248, -1.218525, -1.624564, 1, 1, 1, 1, 1,
-0.3333359, 0.9224945, -1.330199, 1, 1, 1, 1, 1,
-0.3307283, 1.074319, 0.1353635, 1, 1, 1, 1, 1,
-0.3285424, 0.5939572, -1.277213, 1, 1, 1, 1, 1,
-0.3273651, -0.33828, -2.433137, 1, 1, 1, 1, 1,
-0.3267145, 1.085656, -0.3151039, 1, 1, 1, 1, 1,
-0.3244353, 1.28255, 1.156936, 1, 1, 1, 1, 1,
-0.3158242, -0.9583849, -3.370183, 1, 1, 1, 1, 1,
-0.3137835, 0.6084262, 0.1368002, 1, 1, 1, 1, 1,
-0.3136592, -1.017688, -2.206591, 1, 1, 1, 1, 1,
-0.3091744, -0.6893408, -1.63439, 1, 1, 1, 1, 1,
-0.3054006, 1.15784, 0.2057626, 1, 1, 1, 1, 1,
-0.3051237, -0.9880978, -4.394711, 0, 0, 1, 1, 1,
-0.3014169, -0.7030035, -3.169498, 1, 0, 0, 1, 1,
-0.3001486, 1.300111, -0.001360329, 1, 0, 0, 1, 1,
-0.3000929, 0.3230191, -1.15134, 1, 0, 0, 1, 1,
-0.2999869, 1.802171, -0.7489741, 1, 0, 0, 1, 1,
-0.2912342, 1.274841, -1.343828, 1, 0, 0, 1, 1,
-0.2909645, -0.7994776, -1.612914, 0, 0, 0, 1, 1,
-0.2879632, 0.466349, 0.06085303, 0, 0, 0, 1, 1,
-0.2845111, 0.2167366, -0.9202722, 0, 0, 0, 1, 1,
-0.2824318, 0.06904095, -1.252034, 0, 0, 0, 1, 1,
-0.2783002, 1.020278, 1.10223, 0, 0, 0, 1, 1,
-0.2754404, -0.2908232, -1.003631, 0, 0, 0, 1, 1,
-0.27466, 0.5741801, -1.760359, 0, 0, 0, 1, 1,
-0.2745599, 1.182564, 1.199198, 1, 1, 1, 1, 1,
-0.2683377, -0.7828205, -2.251358, 1, 1, 1, 1, 1,
-0.2661394, -0.7473919, -5.755105, 1, 1, 1, 1, 1,
-0.2655873, 0.7509183, -1.033431, 1, 1, 1, 1, 1,
-0.2616114, 0.92084, 0.4281759, 1, 1, 1, 1, 1,
-0.2615992, 0.8711693, 0.9169326, 1, 1, 1, 1, 1,
-0.2600335, 0.2478601, -2.371922, 1, 1, 1, 1, 1,
-0.2558169, 1.760903, 0.1053123, 1, 1, 1, 1, 1,
-0.2549497, -0.9327023, -4.391767, 1, 1, 1, 1, 1,
-0.2537135, -0.3118541, -1.822388, 1, 1, 1, 1, 1,
-0.2480475, 0.9621226, 0.6323534, 1, 1, 1, 1, 1,
-0.2479347, 1.54215, -1.043972, 1, 1, 1, 1, 1,
-0.2477965, 0.3134468, 0.06209013, 1, 1, 1, 1, 1,
-0.2463379, 0.3059602, 0.3440187, 1, 1, 1, 1, 1,
-0.2411485, -0.3198295, -1.915846, 1, 1, 1, 1, 1,
-0.2407168, -0.3255385, -1.682135, 0, 0, 1, 1, 1,
-0.2348344, -0.5647288, -3.091695, 1, 0, 0, 1, 1,
-0.232564, 1.638744, -2.392342, 1, 0, 0, 1, 1,
-0.2303918, -1.859766, -2.923294, 1, 0, 0, 1, 1,
-0.2273581, -0.5040528, -4.204188, 1, 0, 0, 1, 1,
-0.2254295, 0.2284862, 0.6824845, 1, 0, 0, 1, 1,
-0.2227012, -1.46697, -2.148779, 0, 0, 0, 1, 1,
-0.2201514, -0.4048034, -2.043406, 0, 0, 0, 1, 1,
-0.218516, 0.4330365, -0.9128875, 0, 0, 0, 1, 1,
-0.2160946, -1.099517, -4.024508, 0, 0, 0, 1, 1,
-0.2152871, -0.919976, -3.571282, 0, 0, 0, 1, 1,
-0.2149516, 0.5903922, -0.772192, 0, 0, 0, 1, 1,
-0.2144335, 0.5320935, 0.3632301, 0, 0, 0, 1, 1,
-0.205676, 0.02867342, -0.9843397, 1, 1, 1, 1, 1,
-0.2051031, 0.9940693, 1.178884, 1, 1, 1, 1, 1,
-0.2050719, -0.3636658, -4.807347, 1, 1, 1, 1, 1,
-0.2028344, -0.6975958, -4.449097, 1, 1, 1, 1, 1,
-0.2021015, 0.1305017, -0.8079674, 1, 1, 1, 1, 1,
-0.2018261, -1.061859, -2.447623, 1, 1, 1, 1, 1,
-0.2003077, 0.1302641, -0.8133773, 1, 1, 1, 1, 1,
-0.1927487, 1.450001, -0.1557405, 1, 1, 1, 1, 1,
-0.1927129, 1.982469, -0.8083293, 1, 1, 1, 1, 1,
-0.1919865, 0.704598, -0.145423, 1, 1, 1, 1, 1,
-0.1906617, -0.699535, -1.918692, 1, 1, 1, 1, 1,
-0.1890165, -0.06848873, -0.9946619, 1, 1, 1, 1, 1,
-0.1876503, 1.929652, 0.1842526, 1, 1, 1, 1, 1,
-0.1875873, -0.01685682, -2.914104, 1, 1, 1, 1, 1,
-0.185885, 0.6184121, -0.306156, 1, 1, 1, 1, 1,
-0.1805904, -1.332743, -2.337566, 0, 0, 1, 1, 1,
-0.1753625, -0.3896604, -1.790592, 1, 0, 0, 1, 1,
-0.1707232, -0.9571918, -1.922565, 1, 0, 0, 1, 1,
-0.1697583, -0.8494356, -3.319102, 1, 0, 0, 1, 1,
-0.16798, 0.2124657, -0.8352129, 1, 0, 0, 1, 1,
-0.1627042, -0.8603965, -1.900922, 1, 0, 0, 1, 1,
-0.1608871, -0.0486481, -2.861045, 0, 0, 0, 1, 1,
-0.160332, 0.1006532, -1.058135, 0, 0, 0, 1, 1,
-0.157542, -0.1414251, -3.067796, 0, 0, 0, 1, 1,
-0.1520205, -0.2349394, -3.365604, 0, 0, 0, 1, 1,
-0.1495386, -0.5529997, -3.896793, 0, 0, 0, 1, 1,
-0.149174, 0.2019766, -1.452757, 0, 0, 0, 1, 1,
-0.1479521, -0.39992, -3.311623, 0, 0, 0, 1, 1,
-0.1442275, -1.007686, -2.676198, 1, 1, 1, 1, 1,
-0.1391631, 0.04857941, -0.5319178, 1, 1, 1, 1, 1,
-0.1348509, 0.9295513, -1.14832, 1, 1, 1, 1, 1,
-0.1326666, -0.4363706, -3.615642, 1, 1, 1, 1, 1,
-0.1280579, 0.6906067, 0.07986076, 1, 1, 1, 1, 1,
-0.1275119, 0.5780019, 1.049388, 1, 1, 1, 1, 1,
-0.1261206, -2.255562, -2.573161, 1, 1, 1, 1, 1,
-0.1249119, 1.350261, 0.266944, 1, 1, 1, 1, 1,
-0.1247754, 1.377231, -0.5314282, 1, 1, 1, 1, 1,
-0.1236358, -0.3781528, -3.607903, 1, 1, 1, 1, 1,
-0.1212755, 0.6909077, 0.8814486, 1, 1, 1, 1, 1,
-0.1210706, -0.679724, -3.557954, 1, 1, 1, 1, 1,
-0.1168632, -0.6999263, -2.799538, 1, 1, 1, 1, 1,
-0.1131725, -0.2900548, -4.804203, 1, 1, 1, 1, 1,
-0.1130647, -0.8756508, -2.766885, 1, 1, 1, 1, 1,
-0.1115196, 0.806871, 1.390333, 0, 0, 1, 1, 1,
-0.1086508, 0.7342311, 0.2372811, 1, 0, 0, 1, 1,
-0.1070047, 0.9404765, -0.7133321, 1, 0, 0, 1, 1,
-0.1031785, -0.195469, -1.98394, 1, 0, 0, 1, 1,
-0.09980877, -1.048331, -3.392258, 1, 0, 0, 1, 1,
-0.09270545, -0.917756, -4.005164, 1, 0, 0, 1, 1,
-0.09250206, 0.2686074, 1.658524, 0, 0, 0, 1, 1,
-0.09133106, 0.9757907, -1.715632, 0, 0, 0, 1, 1,
-0.08497634, 2.121906, -0.03551053, 0, 0, 0, 1, 1,
-0.08322325, -0.06003382, -1.955351, 0, 0, 0, 1, 1,
-0.0754102, -0.6107382, -2.895845, 0, 0, 0, 1, 1,
-0.07523393, -0.1771708, -2.716917, 0, 0, 0, 1, 1,
-0.07493663, 1.73433, -0.7140676, 0, 0, 0, 1, 1,
-0.06909484, 0.1028087, -0.7530708, 1, 1, 1, 1, 1,
-0.06818076, -0.08532724, -2.119752, 1, 1, 1, 1, 1,
-0.06613658, 0.4638111, 0.8328111, 1, 1, 1, 1, 1,
-0.06513731, -0.5687169, -3.966767, 1, 1, 1, 1, 1,
-0.06110009, 1.706426, 0.9163002, 1, 1, 1, 1, 1,
-0.06032487, -0.1600861, -1.922098, 1, 1, 1, 1, 1,
-0.05709532, 0.496938, 1.025825, 1, 1, 1, 1, 1,
-0.0553094, 0.3216445, 0.3691795, 1, 1, 1, 1, 1,
-0.05393506, -0.03630576, -3.096136, 1, 1, 1, 1, 1,
-0.05021764, 0.5925028, -1.023426, 1, 1, 1, 1, 1,
-0.04614906, 1.82593, -0.3194275, 1, 1, 1, 1, 1,
-0.04480925, -0.9516755, -1.571657, 1, 1, 1, 1, 1,
-0.04045806, -0.5290882, -2.969411, 1, 1, 1, 1, 1,
-0.04018033, -0.7295802, -1.497633, 1, 1, 1, 1, 1,
-0.03829742, 1.442556, -0.5101231, 1, 1, 1, 1, 1,
-0.03723779, 0.3066648, -0.6826039, 0, 0, 1, 1, 1,
-0.03642368, 0.8477576, -0.09097604, 1, 0, 0, 1, 1,
-0.03506231, 0.3333018, 1.467228, 1, 0, 0, 1, 1,
-0.03039196, -0.4962374, -4.081278, 1, 0, 0, 1, 1,
-0.02677567, 0.8785667, 0.1556209, 1, 0, 0, 1, 1,
-0.02342211, -0.7698921, -3.596497, 1, 0, 0, 1, 1,
-0.02093275, 0.2892929, 0.4741479, 0, 0, 0, 1, 1,
-0.01956183, -0.2346439, -2.34468, 0, 0, 0, 1, 1,
-0.01698912, 0.0610447, 0.2207246, 0, 0, 0, 1, 1,
-0.01466434, -1.889249, -5.356679, 0, 0, 0, 1, 1,
-0.01156219, -0.2501806, -3.044106, 0, 0, 0, 1, 1,
-0.009525515, -0.7871541, -3.753226, 0, 0, 0, 1, 1,
-0.00930467, 0.4390297, -0.1287922, 0, 0, 0, 1, 1,
-0.007145267, 1.078651, 1.518949, 1, 1, 1, 1, 1,
0.00796197, 0.4086643, -0.223947, 1, 1, 1, 1, 1,
0.01683754, -2.090165, 2.947474, 1, 1, 1, 1, 1,
0.02054144, 1.009296, -0.9966466, 1, 1, 1, 1, 1,
0.02325991, 1.018317, 0.09208981, 1, 1, 1, 1, 1,
0.02806976, 0.9756476, -0.493337, 1, 1, 1, 1, 1,
0.02812481, -1.091651, 1.753517, 1, 1, 1, 1, 1,
0.02883131, 0.7171247, 1.508612, 1, 1, 1, 1, 1,
0.03610527, -2.092555, 1.202318, 1, 1, 1, 1, 1,
0.03888901, 1.741917, 0.1592308, 1, 1, 1, 1, 1,
0.04263579, 0.6601115, -0.6787195, 1, 1, 1, 1, 1,
0.04273528, 0.05699834, 1.214404, 1, 1, 1, 1, 1,
0.04548504, 1.570714, -0.01747571, 1, 1, 1, 1, 1,
0.04559815, 1.683973, 0.568729, 1, 1, 1, 1, 1,
0.0531166, -0.003741452, 0.1943475, 1, 1, 1, 1, 1,
0.05422655, -0.298162, 2.442636, 0, 0, 1, 1, 1,
0.05744776, 0.3969463, 3.431219, 1, 0, 0, 1, 1,
0.05807761, 0.265803, -0.2426131, 1, 0, 0, 1, 1,
0.05945682, 1.697534, -0.5557714, 1, 0, 0, 1, 1,
0.06119632, -1.244843, 4.59451, 1, 0, 0, 1, 1,
0.06233466, -1.764023, 1.890953, 1, 0, 0, 1, 1,
0.0637043, -0.4466651, 2.314198, 0, 0, 0, 1, 1,
0.07525486, -0.2117462, 2.909682, 0, 0, 0, 1, 1,
0.07752521, 0.08629528, 2.261166, 0, 0, 0, 1, 1,
0.08006181, 0.1148362, 0.5006583, 0, 0, 0, 1, 1,
0.0833114, -0.1511791, 1.916426, 0, 0, 0, 1, 1,
0.08385519, 0.2397518, -0.4419675, 0, 0, 0, 1, 1,
0.08630963, 0.7129789, -0.5599034, 0, 0, 0, 1, 1,
0.08682235, 0.7793261, 0.04124948, 1, 1, 1, 1, 1,
0.08795013, 0.8008239, 0.1489862, 1, 1, 1, 1, 1,
0.08959265, 0.1664361, -0.09350251, 1, 1, 1, 1, 1,
0.09032307, 0.1896288, -0.8388242, 1, 1, 1, 1, 1,
0.09338858, -1.728101, 3.052477, 1, 1, 1, 1, 1,
0.0935961, 0.5308532, -0.93632, 1, 1, 1, 1, 1,
0.0962314, 0.9837785, 0.8789173, 1, 1, 1, 1, 1,
0.09716932, -0.5278905, 3.750917, 1, 1, 1, 1, 1,
0.09941688, -0.2039559, 4.404702, 1, 1, 1, 1, 1,
0.1010079, 1.065627, -0.2108789, 1, 1, 1, 1, 1,
0.1039611, -0.1952628, 3.156816, 1, 1, 1, 1, 1,
0.1045318, 0.6707829, -0.3376745, 1, 1, 1, 1, 1,
0.1047038, 2.144544, 0.6831116, 1, 1, 1, 1, 1,
0.1054374, -0.08601874, 1.06493, 1, 1, 1, 1, 1,
0.1082156, 0.7800987, -0.9020141, 1, 1, 1, 1, 1,
0.1093735, -1.331714, 3.899456, 0, 0, 1, 1, 1,
0.1094769, 1.927171, 1.111293, 1, 0, 0, 1, 1,
0.1129832, -1.035235, 2.478402, 1, 0, 0, 1, 1,
0.1133019, -0.9241309, 3.80865, 1, 0, 0, 1, 1,
0.1133265, 2.234174, 1.624334, 1, 0, 0, 1, 1,
0.1135318, 0.04645644, 3.190599, 1, 0, 0, 1, 1,
0.1149694, -0.1261213, 3.483174, 0, 0, 0, 1, 1,
0.1157557, 1.222319, -0.9520572, 0, 0, 0, 1, 1,
0.1161184, -0.6498207, 3.805501, 0, 0, 0, 1, 1,
0.1162486, -1.727333, 1.921552, 0, 0, 0, 1, 1,
0.1169916, -0.2132009, 2.060746, 0, 0, 0, 1, 1,
0.1190513, 0.911277, -0.925191, 0, 0, 0, 1, 1,
0.1197434, 0.7649005, 0.3392168, 0, 0, 0, 1, 1,
0.1203735, 1.180335, -0.04504148, 1, 1, 1, 1, 1,
0.1212285, -0.1069938, 2.204049, 1, 1, 1, 1, 1,
0.1220855, 0.2629897, 0.6205105, 1, 1, 1, 1, 1,
0.122147, -0.6270702, 1.850581, 1, 1, 1, 1, 1,
0.1263266, 1.302584, -1.629611, 1, 1, 1, 1, 1,
0.1348579, -0.0271828, 1.332005, 1, 1, 1, 1, 1,
0.1374112, 2.321688, -0.6560362, 1, 1, 1, 1, 1,
0.1385852, -2.216338, 3.631524, 1, 1, 1, 1, 1,
0.1400451, -1.621782, 2.626421, 1, 1, 1, 1, 1,
0.1411401, 1.52324, 1.297088, 1, 1, 1, 1, 1,
0.1415353, 0.793259, 0.9100482, 1, 1, 1, 1, 1,
0.141943, -0.1407658, -0.2331353, 1, 1, 1, 1, 1,
0.1426387, 1.082367, -2.151601, 1, 1, 1, 1, 1,
0.1457134, 0.5751183, 1.080166, 1, 1, 1, 1, 1,
0.146786, 1.594346, -1.54327, 1, 1, 1, 1, 1,
0.1468123, 2.102767, -0.1192621, 0, 0, 1, 1, 1,
0.1478123, -1.654607, 3.144261, 1, 0, 0, 1, 1,
0.1481879, -0.7605036, 3.078497, 1, 0, 0, 1, 1,
0.1494397, 0.4820597, 1.651047, 1, 0, 0, 1, 1,
0.1524303, 0.8488813, -1.851811, 1, 0, 0, 1, 1,
0.1545247, -1.40458, 3.418736, 1, 0, 0, 1, 1,
0.1610298, -0.8069307, 3.277032, 0, 0, 0, 1, 1,
0.1639249, 0.1528684, 0.6637031, 0, 0, 0, 1, 1,
0.171629, -1.03705, 3.247563, 0, 0, 0, 1, 1,
0.1754454, 0.1542928, 1.63942, 0, 0, 0, 1, 1,
0.1761491, -1.26697, 2.678085, 0, 0, 0, 1, 1,
0.1787425, -0.1764532, 2.046978, 0, 0, 0, 1, 1,
0.179781, 2.052215, 1.481796, 0, 0, 0, 1, 1,
0.1813925, -1.224515, 2.600506, 1, 1, 1, 1, 1,
0.1829036, 1.57983, 0.8419774, 1, 1, 1, 1, 1,
0.1831307, -1.051398, 2.944716, 1, 1, 1, 1, 1,
0.184171, -0.7903908, 2.551379, 1, 1, 1, 1, 1,
0.1846831, -0.6629096, 3.398637, 1, 1, 1, 1, 1,
0.1854115, -1.129081, 3.383549, 1, 1, 1, 1, 1,
0.1861115, 0.3216624, 0.004583444, 1, 1, 1, 1, 1,
0.1865684, -0.3450347, 2.3563, 1, 1, 1, 1, 1,
0.1902882, -0.320152, 1.552312, 1, 1, 1, 1, 1,
0.1945353, 1.901768, -0.6151357, 1, 1, 1, 1, 1,
0.1946117, -0.7161843, 3.692161, 1, 1, 1, 1, 1,
0.198689, 0.05664757, 0.3182761, 1, 1, 1, 1, 1,
0.1993183, 0.1777833, 0.3794278, 1, 1, 1, 1, 1,
0.202015, 0.9607815, -0.1854581, 1, 1, 1, 1, 1,
0.2046425, 0.1349639, 0.0284247, 1, 1, 1, 1, 1,
0.2087275, 0.5694168, 0.1441429, 0, 0, 1, 1, 1,
0.2095471, -1.492117, 2.860252, 1, 0, 0, 1, 1,
0.2100299, 0.5333182, -0.7638083, 1, 0, 0, 1, 1,
0.2150132, 0.4960678, 0.994339, 1, 0, 0, 1, 1,
0.2156885, 0.5132983, 0.1083058, 1, 0, 0, 1, 1,
0.2197695, -1.428876, 1.61228, 1, 0, 0, 1, 1,
0.2216525, 0.3044805, 1.630353, 0, 0, 0, 1, 1,
0.2247831, 0.5815535, -0.1426533, 0, 0, 0, 1, 1,
0.2258666, -1.103253, 3.593429, 0, 0, 0, 1, 1,
0.2298548, -1.013006, 2.76366, 0, 0, 0, 1, 1,
0.2318127, -1.372011, 3.651429, 0, 0, 0, 1, 1,
0.2365915, -0.5192905, 2.23616, 0, 0, 0, 1, 1,
0.2402739, 0.4764412, -0.04508629, 0, 0, 0, 1, 1,
0.2469837, -1.258743, 4.034628, 1, 1, 1, 1, 1,
0.2476806, -1.337018, 2.169516, 1, 1, 1, 1, 1,
0.2477674, -1.025183, 2.869871, 1, 1, 1, 1, 1,
0.2482979, 0.136582, 1.258366, 1, 1, 1, 1, 1,
0.2581667, 1.011163, 2.618522, 1, 1, 1, 1, 1,
0.2642421, -0.2196072, 0.7941831, 1, 1, 1, 1, 1,
0.2672768, 0.8658776, -0.7087091, 1, 1, 1, 1, 1,
0.273769, 0.7711083, 1.38666, 1, 1, 1, 1, 1,
0.2805122, 0.4233414, 1.189669, 1, 1, 1, 1, 1,
0.282867, 0.2372717, -1.388502, 1, 1, 1, 1, 1,
0.2842527, 1.519299, 0.8260339, 1, 1, 1, 1, 1,
0.2848083, -0.2600406, 2.750446, 1, 1, 1, 1, 1,
0.2849725, -1.54461, 2.483991, 1, 1, 1, 1, 1,
0.2884153, -1.570829, 2.694044, 1, 1, 1, 1, 1,
0.2923361, -0.166856, 1.04333, 1, 1, 1, 1, 1,
0.3004456, 0.9667735, -0.9801899, 0, 0, 1, 1, 1,
0.3035778, -1.065677, 3.743168, 1, 0, 0, 1, 1,
0.3085515, -0.7595047, 3.469916, 1, 0, 0, 1, 1,
0.3102934, 1.046452, 1.30933, 1, 0, 0, 1, 1,
0.3143547, 0.9903593, -0.2492522, 1, 0, 0, 1, 1,
0.3175631, 0.9029938, 2.099309, 1, 0, 0, 1, 1,
0.3180712, -0.4930664, 3.75787, 0, 0, 0, 1, 1,
0.3193996, 0.09333941, 2.112722, 0, 0, 0, 1, 1,
0.3195633, -0.2582395, 1.382344, 0, 0, 0, 1, 1,
0.3239765, 1.175267, 1.788204, 0, 0, 0, 1, 1,
0.324764, -1.128322, 3.36846, 0, 0, 0, 1, 1,
0.3292505, -0.2056452, 0.4740434, 0, 0, 0, 1, 1,
0.3306364, -2.185499, 3.166764, 0, 0, 0, 1, 1,
0.3344924, 0.6895863, -0.0001758041, 1, 1, 1, 1, 1,
0.3349159, 0.8988011, -0.2180725, 1, 1, 1, 1, 1,
0.3378738, -0.3419302, 2.322265, 1, 1, 1, 1, 1,
0.3378753, 1.067307, -0.2211995, 1, 1, 1, 1, 1,
0.3403667, -0.04341424, 0.1171563, 1, 1, 1, 1, 1,
0.3403797, 0.209631, 0.5838675, 1, 1, 1, 1, 1,
0.3421539, -0.6339691, 4.213068, 1, 1, 1, 1, 1,
0.3458358, 0.2219891, 0.6516366, 1, 1, 1, 1, 1,
0.3528522, 0.09601332, 1.294271, 1, 1, 1, 1, 1,
0.3535122, 0.2268719, 0.7659201, 1, 1, 1, 1, 1,
0.3541044, 0.2067072, 1.311699, 1, 1, 1, 1, 1,
0.354753, 1.975849, -0.8186966, 1, 1, 1, 1, 1,
0.3566907, 1.838036, 0.03108942, 1, 1, 1, 1, 1,
0.3605111, 0.8129972, -0.1212424, 1, 1, 1, 1, 1,
0.3610708, -1.145219, 2.334023, 1, 1, 1, 1, 1,
0.3611678, -0.9905137, 2.395332, 0, 0, 1, 1, 1,
0.3635439, -1.965626, 3.215194, 1, 0, 0, 1, 1,
0.369527, -0.005461059, 2.946397, 1, 0, 0, 1, 1,
0.3743208, 0.3395578, 1.464585, 1, 0, 0, 1, 1,
0.3755318, -0.9447843, 2.684756, 1, 0, 0, 1, 1,
0.3802407, -0.2796198, 2.72778, 1, 0, 0, 1, 1,
0.3812753, 2.485266, 1.116379, 0, 0, 0, 1, 1,
0.3814059, 0.782204, 1.431741, 0, 0, 0, 1, 1,
0.3832771, 0.721723, 1.26184, 0, 0, 0, 1, 1,
0.3870365, 0.0108957, 2.919498, 0, 0, 0, 1, 1,
0.3879804, 0.5302938, 1.79174, 0, 0, 0, 1, 1,
0.3894631, 0.8320609, -0.6518934, 0, 0, 0, 1, 1,
0.3923837, 3.405076, 0.5455313, 0, 0, 0, 1, 1,
0.3952602, -0.7508235, 2.083418, 1, 1, 1, 1, 1,
0.3984845, 0.239916, 1.158953, 1, 1, 1, 1, 1,
0.3999785, 0.237048, 0.8062886, 1, 1, 1, 1, 1,
0.4045351, 0.3349469, 2.022191, 1, 1, 1, 1, 1,
0.4061779, 0.3432821, 0.3909629, 1, 1, 1, 1, 1,
0.4065074, 0.2913731, 1.738677, 1, 1, 1, 1, 1,
0.4078341, -0.1067967, 1.465165, 1, 1, 1, 1, 1,
0.4152106, -0.5349345, 2.343758, 1, 1, 1, 1, 1,
0.4201629, 0.6980059, 1.321228, 1, 1, 1, 1, 1,
0.4222988, 0.03429589, 1.053485, 1, 1, 1, 1, 1,
0.4348492, -1.20965, 5.114532, 1, 1, 1, 1, 1,
0.4442044, -0.9744375, 4.526278, 1, 1, 1, 1, 1,
0.4466698, -0.1093671, 1.300881, 1, 1, 1, 1, 1,
0.4533309, 0.8130124, 2.306887, 1, 1, 1, 1, 1,
0.4575984, -0.2827637, 3.229541, 1, 1, 1, 1, 1,
0.4608917, 0.5845018, 2.919649, 0, 0, 1, 1, 1,
0.4615442, -1.802755, 4.980461, 1, 0, 0, 1, 1,
0.4635411, 0.9826393, 0.8179664, 1, 0, 0, 1, 1,
0.4639504, 1.195225, 1.725347, 1, 0, 0, 1, 1,
0.465372, -0.7663121, 2.552449, 1, 0, 0, 1, 1,
0.4704482, -0.4060512, 1.581249, 1, 0, 0, 1, 1,
0.4766569, -0.4035835, 0.1274694, 0, 0, 0, 1, 1,
0.4776386, -1.378132, 2.382385, 0, 0, 0, 1, 1,
0.4784304, -1.669518, 1.74888, 0, 0, 0, 1, 1,
0.4802185, -1.13519, 0.2147289, 0, 0, 0, 1, 1,
0.4827646, 0.8607795, -1.661325, 0, 0, 0, 1, 1,
0.4863816, 0.3620368, 0.666545, 0, 0, 0, 1, 1,
0.4883671, -0.6254365, 3.468956, 0, 0, 0, 1, 1,
0.4918421, 0.04963649, 1.558941, 1, 1, 1, 1, 1,
0.4967211, -0.6260741, 1.8255, 1, 1, 1, 1, 1,
0.5003563, -0.202849, 1.624653, 1, 1, 1, 1, 1,
0.5019654, 0.598268, 1.884356, 1, 1, 1, 1, 1,
0.5039981, 0.8364246, 0.6264076, 1, 1, 1, 1, 1,
0.5040422, 0.8646803, 1.017607, 1, 1, 1, 1, 1,
0.5254209, 0.8835921, 0.2739181, 1, 1, 1, 1, 1,
0.5259898, 1.71817, 1.765206, 1, 1, 1, 1, 1,
0.5278429, 0.6260598, 1.944186, 1, 1, 1, 1, 1,
0.5283188, 1.561039, -1.212788, 1, 1, 1, 1, 1,
0.5359004, -0.6040414, 2.863804, 1, 1, 1, 1, 1,
0.5389289, 0.3476167, 1.569, 1, 1, 1, 1, 1,
0.5411541, -0.4230438, 1.646645, 1, 1, 1, 1, 1,
0.5422662, 1.595377, 0.5288442, 1, 1, 1, 1, 1,
0.5494668, 1.052012, -0.3370113, 1, 1, 1, 1, 1,
0.5551358, -0.3054013, 2.920864, 0, 0, 1, 1, 1,
0.5551996, 1.691055, -0.6335247, 1, 0, 0, 1, 1,
0.5562845, -0.6258827, 4.369785, 1, 0, 0, 1, 1,
0.5582948, -0.4833614, 1.867181, 1, 0, 0, 1, 1,
0.5617204, -0.1483324, 1.248605, 1, 0, 0, 1, 1,
0.564563, 0.806672, -0.5394423, 1, 0, 0, 1, 1,
0.5659088, -1.309459, 2.07274, 0, 0, 0, 1, 1,
0.5674702, -1.323629, 2.415636, 0, 0, 0, 1, 1,
0.5679235, 1.360406, 0.9614923, 0, 0, 0, 1, 1,
0.567992, -1.073552, 1.433657, 0, 0, 0, 1, 1,
0.5703601, 1.860034, 0.6393956, 0, 0, 0, 1, 1,
0.5766985, 0.7363918, 0.4797054, 0, 0, 0, 1, 1,
0.5794389, 1.75071, 0.1972441, 0, 0, 0, 1, 1,
0.58057, -0.4285136, 1.042357, 1, 1, 1, 1, 1,
0.5824046, -0.4066487, 3.624896, 1, 1, 1, 1, 1,
0.5850106, -0.2691861, 2.871492, 1, 1, 1, 1, 1,
0.5951596, 1.36903, 1.397984, 1, 1, 1, 1, 1,
0.5989401, 0.9522385, 0.539439, 1, 1, 1, 1, 1,
0.5989453, 0.05047659, -0.09423126, 1, 1, 1, 1, 1,
0.603081, -0.1263386, 3.275598, 1, 1, 1, 1, 1,
0.6082005, 0.2145526, 1.58127, 1, 1, 1, 1, 1,
0.6100581, -0.4447101, 3.444222, 1, 1, 1, 1, 1,
0.6149288, -0.9635384, 2.54181, 1, 1, 1, 1, 1,
0.6156955, 1.130026, 0.62306, 1, 1, 1, 1, 1,
0.6179268, -0.06512322, 1.094236, 1, 1, 1, 1, 1,
0.6187197, 0.4088123, -0.4640046, 1, 1, 1, 1, 1,
0.619553, -0.5425084, 2.624072, 1, 1, 1, 1, 1,
0.6260455, -0.3824377, 1.696566, 1, 1, 1, 1, 1,
0.6296529, -1.447533, 3.418097, 0, 0, 1, 1, 1,
0.6381869, -0.400581, 1.253313, 1, 0, 0, 1, 1,
0.639033, -0.08235018, 1.953268, 1, 0, 0, 1, 1,
0.6425707, -0.4335521, 0.8053709, 1, 0, 0, 1, 1,
0.6438646, 0.09485935, 2.064654, 1, 0, 0, 1, 1,
0.6453826, -0.6299821, 0.9230601, 1, 0, 0, 1, 1,
0.646008, -1.375867, 2.839589, 0, 0, 0, 1, 1,
0.6539676, 0.8348518, 2.078239, 0, 0, 0, 1, 1,
0.6580735, -1.153267, 3.734979, 0, 0, 0, 1, 1,
0.6601523, -1.041792, 4.211844, 0, 0, 0, 1, 1,
0.6620463, 0.9281943, 0.05637919, 0, 0, 0, 1, 1,
0.664561, 0.182134, 0.3814176, 0, 0, 0, 1, 1,
0.6668302, -0.1172517, 1.508788, 0, 0, 0, 1, 1,
0.6754088, 1.214669, -1.204209, 1, 1, 1, 1, 1,
0.6761366, 0.3594076, 2.461579, 1, 1, 1, 1, 1,
0.6784707, -1.32018, 2.494762, 1, 1, 1, 1, 1,
0.6787398, -0.6246678, 2.452543, 1, 1, 1, 1, 1,
0.6882941, -0.479619, 1.682084, 1, 1, 1, 1, 1,
0.6916358, 0.1503284, 1.267783, 1, 1, 1, 1, 1,
0.6948692, 0.8626281, 0.6605483, 1, 1, 1, 1, 1,
0.6959581, 1.756748, 0.983565, 1, 1, 1, 1, 1,
0.6970949, 0.9522486, 0.2201969, 1, 1, 1, 1, 1,
0.6973549, 1.139785, 0.3093411, 1, 1, 1, 1, 1,
0.700613, 0.5294434, 1.347272, 1, 1, 1, 1, 1,
0.7017269, -0.2564964, 2.109131, 1, 1, 1, 1, 1,
0.7025592, -1.027569, 4.33269, 1, 1, 1, 1, 1,
0.7086146, 1.026377, 1.379539, 1, 1, 1, 1, 1,
0.7159268, 0.6485024, 2.032468, 1, 1, 1, 1, 1,
0.7171931, -2.18007, 5.3478, 0, 0, 1, 1, 1,
0.7172999, 0.3126431, -0.1409801, 1, 0, 0, 1, 1,
0.7210459, -1.182214, 3.07847, 1, 0, 0, 1, 1,
0.7248596, 1.729343, 0.4560809, 1, 0, 0, 1, 1,
0.7254176, -2.935092, 3.161656, 1, 0, 0, 1, 1,
0.7269723, -0.7555172, 0.9052955, 1, 0, 0, 1, 1,
0.7299945, -0.1788739, 2.591608, 0, 0, 0, 1, 1,
0.7328158, -1.293671, 2.029561, 0, 0, 0, 1, 1,
0.7329434, 0.7706344, -2.716763, 0, 0, 0, 1, 1,
0.7360187, -0.8024175, 2.76286, 0, 0, 0, 1, 1,
0.7432344, -1.233291, 2.815264, 0, 0, 0, 1, 1,
0.7517478, 0.9767262, 0.1822719, 0, 0, 0, 1, 1,
0.7532901, -0.2644801, 1.293624, 0, 0, 0, 1, 1,
0.7541353, -1.031265, -1.319053, 1, 1, 1, 1, 1,
0.7571362, 0.6314245, 1.591513, 1, 1, 1, 1, 1,
0.7607121, 1.365831, 0.05703837, 1, 1, 1, 1, 1,
0.7628286, 0.1089384, -0.7891647, 1, 1, 1, 1, 1,
0.763074, 0.7502629, -0.09570435, 1, 1, 1, 1, 1,
0.7695909, -2.479138, 2.721705, 1, 1, 1, 1, 1,
0.7721801, -0.2438139, 2.790304, 1, 1, 1, 1, 1,
0.7740338, -1.177035, 2.927199, 1, 1, 1, 1, 1,
0.7763013, 0.4626778, 0.2224643, 1, 1, 1, 1, 1,
0.7818355, 2.423049, -0.09594852, 1, 1, 1, 1, 1,
0.7831367, -2.541475, 1.258706, 1, 1, 1, 1, 1,
0.7832881, 0.1300404, 1.6493, 1, 1, 1, 1, 1,
0.78733, -0.5855715, 1.664985, 1, 1, 1, 1, 1,
0.7889612, -0.6509511, 1.943661, 1, 1, 1, 1, 1,
0.7911205, 0.2901976, 1.088918, 1, 1, 1, 1, 1,
0.7942122, 2.087617, 0.6925387, 0, 0, 1, 1, 1,
0.7943706, -1.392991, 3.571662, 1, 0, 0, 1, 1,
0.7969831, 1.454599, -0.1880963, 1, 0, 0, 1, 1,
0.7994887, 1.515803, -0.2423202, 1, 0, 0, 1, 1,
0.8077548, -0.6022282, 2.045254, 1, 0, 0, 1, 1,
0.8091516, -1.16855, 2.443645, 1, 0, 0, 1, 1,
0.8200716, 0.6670898, -0.2302385, 0, 0, 0, 1, 1,
0.8212332, 1.334656, -0.7271694, 0, 0, 0, 1, 1,
0.822808, 0.4432694, 1.115141, 0, 0, 0, 1, 1,
0.8256874, -0.9853795, 2.874638, 0, 0, 0, 1, 1,
0.8271599, -0.4031986, 3.4833, 0, 0, 0, 1, 1,
0.8287904, -0.1267916, 1.208438, 0, 0, 0, 1, 1,
0.8328411, -0.4147215, 4.086802, 0, 0, 0, 1, 1,
0.8349281, -0.1371829, 2.83474, 1, 1, 1, 1, 1,
0.8365038, -0.2409443, 1.782346, 1, 1, 1, 1, 1,
0.841266, -0.3288378, 2.064822, 1, 1, 1, 1, 1,
0.8424106, 0.1898376, 1.187808, 1, 1, 1, 1, 1,
0.8478163, 0.2247165, 2.366257, 1, 1, 1, 1, 1,
0.8485404, -0.7105597, 1.326833, 1, 1, 1, 1, 1,
0.8534262, -0.06624213, 4.366915, 1, 1, 1, 1, 1,
0.855024, 0.07813655, 3.074624, 1, 1, 1, 1, 1,
0.8590189, -1.032608, 3.290372, 1, 1, 1, 1, 1,
0.8678293, -0.6000801, 2.285665, 1, 1, 1, 1, 1,
0.8681991, 2.04763, 0.2008504, 1, 1, 1, 1, 1,
0.8683305, -0.4650652, 1.794088, 1, 1, 1, 1, 1,
0.8696242, -0.7845775, 2.217629, 1, 1, 1, 1, 1,
0.8738829, -0.2533511, 2.839339, 1, 1, 1, 1, 1,
0.8857341, -1.606344, 2.371915, 1, 1, 1, 1, 1,
0.887648, 2.690531, -1.386629, 0, 0, 1, 1, 1,
0.8881646, -0.5019011, 2.614979, 1, 0, 0, 1, 1,
0.8890335, -1.294674, 3.316398, 1, 0, 0, 1, 1,
0.8902041, 1.110934, 1.214622, 1, 0, 0, 1, 1,
0.8963815, 0.3489814, 0.5589731, 1, 0, 0, 1, 1,
0.8964955, -1.644974, 2.433047, 1, 0, 0, 1, 1,
0.897553, 0.3823363, 0.8912157, 0, 0, 0, 1, 1,
0.9168372, -0.4485661, 2.401564, 0, 0, 0, 1, 1,
0.9220482, 1.419301, 1.227258, 0, 0, 0, 1, 1,
0.9259231, -0.07779884, 1.695253, 0, 0, 0, 1, 1,
0.9283416, 1.28864, -0.4674563, 0, 0, 0, 1, 1,
0.9404097, 0.6706475, 2.149335, 0, 0, 0, 1, 1,
0.9429119, -0.1745877, 1.961671, 0, 0, 0, 1, 1,
0.9463731, -0.5158772, 0.3965576, 1, 1, 1, 1, 1,
0.9476741, 0.01666898, 1.389897, 1, 1, 1, 1, 1,
0.948992, -0.8980753, 1.528345, 1, 1, 1, 1, 1,
0.9490517, -0.9419241, 2.532825, 1, 1, 1, 1, 1,
0.9519194, 0.9315055, 1.637397, 1, 1, 1, 1, 1,
0.9601619, 0.07395151, 1.369565, 1, 1, 1, 1, 1,
0.9621548, -0.6382776, 3.10867, 1, 1, 1, 1, 1,
0.963082, 0.1125288, 2.592052, 1, 1, 1, 1, 1,
0.9634842, -0.4835948, 3.389824, 1, 1, 1, 1, 1,
0.9639514, 0.7277195, -0.06670538, 1, 1, 1, 1, 1,
0.9639677, -0.2917241, 4.006419, 1, 1, 1, 1, 1,
0.9650845, -1.019114, 2.898672, 1, 1, 1, 1, 1,
0.9752856, -1.25492, 3.012035, 1, 1, 1, 1, 1,
0.9800388, -1.574952, 4.974887, 1, 1, 1, 1, 1,
0.9880572, 0.3809952, -0.1297422, 1, 1, 1, 1, 1,
0.9963828, -0.159545, 0.6087559, 0, 0, 1, 1, 1,
1.005978, 0.2094491, 1.181919, 1, 0, 0, 1, 1,
1.010634, -0.4552779, 0.004650685, 1, 0, 0, 1, 1,
1.012148, 0.001255847, 0.7407311, 1, 0, 0, 1, 1,
1.026196, -1.014001, 2.664497, 1, 0, 0, 1, 1,
1.034524, 1.141356, 0.2439902, 1, 0, 0, 1, 1,
1.045395, -0.1503738, 1.963115, 0, 0, 0, 1, 1,
1.046668, -1.342063, 2.704115, 0, 0, 0, 1, 1,
1.053651, 0.792401, 2.629503, 0, 0, 0, 1, 1,
1.061257, -0.209245, 2.202841, 0, 0, 0, 1, 1,
1.065239, -0.03856853, 1.991457, 0, 0, 0, 1, 1,
1.066616, 0.003658263, 0.6316622, 0, 0, 0, 1, 1,
1.074468, 0.9332485, 1.797215, 0, 0, 0, 1, 1,
1.075883, -0.9783114, 3.435449, 1, 1, 1, 1, 1,
1.08032, -0.7398393, 3.181025, 1, 1, 1, 1, 1,
1.08349, -0.8597904, 1.04001, 1, 1, 1, 1, 1,
1.084942, -0.9183456, 3.096501, 1, 1, 1, 1, 1,
1.08581, -0.5882616, 4.012652, 1, 1, 1, 1, 1,
1.086199, -1.61873, 2.856529, 1, 1, 1, 1, 1,
1.088389, -1.309817, 1.650128, 1, 1, 1, 1, 1,
1.090302, -0.8338009, 2.726411, 1, 1, 1, 1, 1,
1.091687, -2.000119, 0.6267058, 1, 1, 1, 1, 1,
1.095298, -0.3108229, 3.014042, 1, 1, 1, 1, 1,
1.096101, -0.1244902, 0.6452811, 1, 1, 1, 1, 1,
1.107781, -0.7605454, 2.792944, 1, 1, 1, 1, 1,
1.109621, -0.7201048, 0.7766824, 1, 1, 1, 1, 1,
1.11196, -0.02297028, 0.2793058, 1, 1, 1, 1, 1,
1.112457, 0.2858114, 1.806287, 1, 1, 1, 1, 1,
1.115151, 1.469694, 2.196449, 0, 0, 1, 1, 1,
1.121997, 1.093134, -0.5826321, 1, 0, 0, 1, 1,
1.127599, -0.07854604, 1.010175, 1, 0, 0, 1, 1,
1.131626, 1.65688, -0.1903203, 1, 0, 0, 1, 1,
1.14685, -1.375989, 2.923913, 1, 0, 0, 1, 1,
1.14887, -0.8954084, 2.755411, 1, 0, 0, 1, 1,
1.159954, 0.03969414, 1.264555, 0, 0, 0, 1, 1,
1.16118, -0.6220917, 3.524934, 0, 0, 0, 1, 1,
1.162739, 0.2265726, 1.022355, 0, 0, 0, 1, 1,
1.172308, 0.02351434, 0.2804442, 0, 0, 0, 1, 1,
1.177003, 0.2746446, 1.215087, 0, 0, 0, 1, 1,
1.18618, 0.561244, 0.09315374, 0, 0, 0, 1, 1,
1.187571, -0.2191004, 1.147945, 0, 0, 0, 1, 1,
1.19179, -0.06616053, 0.6838857, 1, 1, 1, 1, 1,
1.196285, 0.0788556, 0.3485942, 1, 1, 1, 1, 1,
1.203158, 0.2028698, 0.763212, 1, 1, 1, 1, 1,
1.204065, 0.4407488, 1.224362, 1, 1, 1, 1, 1,
1.205991, -0.7878466, 2.831597, 1, 1, 1, 1, 1,
1.214, 0.3006675, 1.868912, 1, 1, 1, 1, 1,
1.215027, 2.027858, 0.8405266, 1, 1, 1, 1, 1,
1.230375, 1.056515, 0.7410259, 1, 1, 1, 1, 1,
1.239947, -1.095764, 1.607634, 1, 1, 1, 1, 1,
1.24249, -1.751747, 2.586055, 1, 1, 1, 1, 1,
1.242619, -1.049781, 2.217001, 1, 1, 1, 1, 1,
1.244053, -1.471191, 1.818927, 1, 1, 1, 1, 1,
1.247766, -2.263851, 2.834866, 1, 1, 1, 1, 1,
1.250584, 1.476801, -0.3644758, 1, 1, 1, 1, 1,
1.25128, 0.1490124, -0.1752801, 1, 1, 1, 1, 1,
1.267555, 1.073446, -0.9852016, 0, 0, 1, 1, 1,
1.26903, 0.7266335, -1.767364, 1, 0, 0, 1, 1,
1.270903, -1.358555, 1.570161, 1, 0, 0, 1, 1,
1.275897, 1.948965, 1.167442, 1, 0, 0, 1, 1,
1.28408, -0.4939817, 2.294301, 1, 0, 0, 1, 1,
1.286504, 1.807325, 0.3222287, 1, 0, 0, 1, 1,
1.289343, -0.339947, 2.467504, 0, 0, 0, 1, 1,
1.303553, -0.6540172, 1.237921, 0, 0, 0, 1, 1,
1.308865, 0.3478641, 1.68123, 0, 0, 0, 1, 1,
1.318121, -0.2817289, 0.7779167, 0, 0, 0, 1, 1,
1.318141, -0.2038992, 0.6424018, 0, 0, 0, 1, 1,
1.328582, -1.422026, 2.852826, 0, 0, 0, 1, 1,
1.333757, 0.5550469, 0.547514, 0, 0, 0, 1, 1,
1.349234, -0.5613952, 2.076231, 1, 1, 1, 1, 1,
1.371208, 0.272705, 0.5103807, 1, 1, 1, 1, 1,
1.382334, -0.4506183, 1.533536, 1, 1, 1, 1, 1,
1.384447, 0.5215973, 2.018058, 1, 1, 1, 1, 1,
1.387208, 0.3127452, 1.191789, 1, 1, 1, 1, 1,
1.38868, -0.3559902, 2.611359, 1, 1, 1, 1, 1,
1.393297, 2.030239, 0.136857, 1, 1, 1, 1, 1,
1.394017, -1.577083, 0.8273494, 1, 1, 1, 1, 1,
1.399095, -0.1017988, 1.661577, 1, 1, 1, 1, 1,
1.40095, 0.6817855, 1.969586, 1, 1, 1, 1, 1,
1.407418, -1.36327, 2.960859, 1, 1, 1, 1, 1,
1.408989, -1.309298, 4.307708, 1, 1, 1, 1, 1,
1.422282, 0.3833625, 2.159072, 1, 1, 1, 1, 1,
1.426788, -0.5708395, 1.482328, 1, 1, 1, 1, 1,
1.435036, 0.5773055, 0.8358431, 1, 1, 1, 1, 1,
1.438434, -0.6612659, 0.7950188, 0, 0, 1, 1, 1,
1.447421, -0.859201, 0.7090365, 1, 0, 0, 1, 1,
1.459017, 0.9196256, 1.118927, 1, 0, 0, 1, 1,
1.460373, 0.1379502, 1.419737, 1, 0, 0, 1, 1,
1.462774, -0.1727789, 1.302721, 1, 0, 0, 1, 1,
1.463445, 2.075292, 0.1960817, 1, 0, 0, 1, 1,
1.475136, 0.01398561, -0.6417573, 0, 0, 0, 1, 1,
1.479789, 0.8968194, 1.876153, 0, 0, 0, 1, 1,
1.48265, -0.6117604, 0.5812022, 0, 0, 0, 1, 1,
1.482663, 1.03883, 0.6859136, 0, 0, 0, 1, 1,
1.484363, 0.2801639, 1.373603, 0, 0, 0, 1, 1,
1.500628, -0.4876863, 1.240173, 0, 0, 0, 1, 1,
1.50523, -0.3944127, 2.849621, 0, 0, 0, 1, 1,
1.508652, -0.2608943, 2.17733, 1, 1, 1, 1, 1,
1.519776, 0.5545244, 1.216036, 1, 1, 1, 1, 1,
1.528713, 0.06035285, 1.746222, 1, 1, 1, 1, 1,
1.529116, -1.637896, 2.720098, 1, 1, 1, 1, 1,
1.529756, -0.4797975, 1.080805, 1, 1, 1, 1, 1,
1.538152, -1.266292, 2.891323, 1, 1, 1, 1, 1,
1.544784, -0.5963622, 3.254009, 1, 1, 1, 1, 1,
1.547646, 1.17603, 0.5839363, 1, 1, 1, 1, 1,
1.559243, 0.4203519, 1.53253, 1, 1, 1, 1, 1,
1.570529, 0.4089387, 1.565739, 1, 1, 1, 1, 1,
1.578129, 0.5798715, 3.395159, 1, 1, 1, 1, 1,
1.578148, -0.4227902, 0.7298116, 1, 1, 1, 1, 1,
1.579207, -0.8780521, 2.450507, 1, 1, 1, 1, 1,
1.58389, -0.3670675, 2.852792, 1, 1, 1, 1, 1,
1.592426, -0.7730722, 2.769329, 1, 1, 1, 1, 1,
1.620898, -0.1013519, 2.72867, 0, 0, 1, 1, 1,
1.630979, 0.3313475, 2.376094, 1, 0, 0, 1, 1,
1.643369, 0.1989015, 3.306874, 1, 0, 0, 1, 1,
1.644719, 1.338997, 1.568849, 1, 0, 0, 1, 1,
1.657979, 0.506695, 2.143736, 1, 0, 0, 1, 1,
1.660131, -1.306413, 1.196274, 1, 0, 0, 1, 1,
1.685582, 0.7398478, 0.3443539, 0, 0, 0, 1, 1,
1.690804, 1.043989, 2.107751, 0, 0, 0, 1, 1,
1.694501, -0.2864197, 0.7790739, 0, 0, 0, 1, 1,
1.694983, -0.7510744, 1.011372, 0, 0, 0, 1, 1,
1.706194, -0.3791409, 1.593021, 0, 0, 0, 1, 1,
1.706645, 0.8478133, 2.170204, 0, 0, 0, 1, 1,
1.713222, -1.186854, 2.302154, 0, 0, 0, 1, 1,
1.714473, 0.2829457, 0.008413112, 1, 1, 1, 1, 1,
1.734515, 1.236439, 0.2300091, 1, 1, 1, 1, 1,
1.760905, 0.6243719, 2.191872, 1, 1, 1, 1, 1,
1.782492, -1.391594, 3.430682, 1, 1, 1, 1, 1,
1.789424, -1.092572, 2.71046, 1, 1, 1, 1, 1,
1.798311, 0.1475176, 1.191131, 1, 1, 1, 1, 1,
1.805703, 0.05730151, 1.119121, 1, 1, 1, 1, 1,
1.818477, 0.5934209, 2.177608, 1, 1, 1, 1, 1,
1.828609, 2.08021, 1.598768, 1, 1, 1, 1, 1,
1.856057, -1.344656, 3.070021, 1, 1, 1, 1, 1,
1.857713, 1.92119, 1.412952, 1, 1, 1, 1, 1,
1.865656, 1.227088, 1.448906, 1, 1, 1, 1, 1,
1.871431, 0.8060024, 0.01668122, 1, 1, 1, 1, 1,
1.876583, 0.4388227, -0.08631428, 1, 1, 1, 1, 1,
1.878962, -1.043229, 3.398185, 1, 1, 1, 1, 1,
1.882562, -0.1162266, -0.5563846, 0, 0, 1, 1, 1,
1.884662, -0.698996, 1.72924, 1, 0, 0, 1, 1,
1.91857, 0.3596541, 1.792556, 1, 0, 0, 1, 1,
1.944233, -0.8772228, 2.325158, 1, 0, 0, 1, 1,
2.017145, 0.1948142, 0.3828942, 1, 0, 0, 1, 1,
2.032162, 0.3102251, 1.195693, 1, 0, 0, 1, 1,
2.055669, -0.5937799, 0.8503218, 0, 0, 0, 1, 1,
2.083036, -0.544122, 2.021165, 0, 0, 0, 1, 1,
2.100129, 2.636222, -0.3026423, 0, 0, 0, 1, 1,
2.136787, -0.3861839, 1.499251, 0, 0, 0, 1, 1,
2.148777, -0.2164164, 2.080522, 0, 0, 0, 1, 1,
2.157221, -0.3704678, 0.7655723, 0, 0, 0, 1, 1,
2.202621, 0.3322212, 0.8406143, 0, 0, 0, 1, 1,
2.235198, -1.626155, 2.962784, 1, 1, 1, 1, 1,
2.251911, -0.6426777, 2.697985, 1, 1, 1, 1, 1,
2.252325, 0.4889691, 0.2968468, 1, 1, 1, 1, 1,
2.396714, 0.2303468, 3.038565, 1, 1, 1, 1, 1,
2.466557, 1.249542, 0.8334633, 1, 1, 1, 1, 1,
2.873343, 0.7501515, 1.932535, 1, 1, 1, 1, 1,
3.188269, -0.5234429, 2.864541, 1, 1, 1, 1, 1
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
var radius = 10.04249;
var distance = 35.27383;
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
mvMatrix.translate( 0.4200587, -0.02440476, 0.2036524 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.27383);
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
