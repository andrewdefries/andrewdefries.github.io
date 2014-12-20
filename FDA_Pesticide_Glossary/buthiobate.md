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
-3.073596, 0.4925335, -1.708186, 1, 0, 0, 1,
-2.763655, -0.1279354, -0.4754194, 1, 0.007843138, 0, 1,
-2.649814, 0.2073519, -0.8064057, 1, 0.01176471, 0, 1,
-2.567041, 1.470005, 0.1362807, 1, 0.01960784, 0, 1,
-2.501752, -1.1567, -1.741021, 1, 0.02352941, 0, 1,
-2.309248, 1.26461, -1.526585, 1, 0.03137255, 0, 1,
-2.306818, 2.605781, -0.6146009, 1, 0.03529412, 0, 1,
-2.273329, 1.185085, -1.310577, 1, 0.04313726, 0, 1,
-2.260917, 0.5169486, -1.375829, 1, 0.04705882, 0, 1,
-2.254853, 0.8276461, -0.2520137, 1, 0.05490196, 0, 1,
-2.204668, 0.366027, -0.4855821, 1, 0.05882353, 0, 1,
-2.201842, -0.548672, -2.622127, 1, 0.06666667, 0, 1,
-2.166391, -1.613067, -2.431009, 1, 0.07058824, 0, 1,
-2.091707, 0.0776766, -1.859716, 1, 0.07843138, 0, 1,
-2.072331, 0.4885912, -1.622507, 1, 0.08235294, 0, 1,
-2.058552, 0.7755482, -2.36374, 1, 0.09019608, 0, 1,
-2.057142, 1.993875, 0.4506899, 1, 0.09411765, 0, 1,
-2.051729, -0.2522084, -1.452823, 1, 0.1019608, 0, 1,
-2.050901, -1.167848, -2.140481, 1, 0.1098039, 0, 1,
-2.046305, -0.02095816, -2.209244, 1, 0.1137255, 0, 1,
-2.037848, -0.2753848, 0.009563626, 1, 0.1215686, 0, 1,
-2.020248, 0.5378553, -1.07199, 1, 0.1254902, 0, 1,
-1.987662, 0.6178398, -1.459591, 1, 0.1333333, 0, 1,
-1.974002, -1.846692, -2.196451, 1, 0.1372549, 0, 1,
-1.951709, 1.564889, 2.189369, 1, 0.145098, 0, 1,
-1.923993, -1.399745, -1.442417, 1, 0.1490196, 0, 1,
-1.919614, -0.2066863, -2.005569, 1, 0.1568628, 0, 1,
-1.911736, -2.227695, 0.4484795, 1, 0.1607843, 0, 1,
-1.90971, -0.4860638, -1.692972, 1, 0.1686275, 0, 1,
-1.889135, -1.04482, -2.536079, 1, 0.172549, 0, 1,
-1.863279, 0.9311133, -2.192127, 1, 0.1803922, 0, 1,
-1.857657, 0.5470663, -2.511631, 1, 0.1843137, 0, 1,
-1.857211, -0.4790777, -0.8544019, 1, 0.1921569, 0, 1,
-1.855146, -1.562407, -2.438775, 1, 0.1960784, 0, 1,
-1.851485, -1.382296, -3.119089, 1, 0.2039216, 0, 1,
-1.843229, -0.5926085, -1.73005, 1, 0.2117647, 0, 1,
-1.819773, 0.8000413, 0.1992295, 1, 0.2156863, 0, 1,
-1.805965, -1.359454, -1.13533, 1, 0.2235294, 0, 1,
-1.805523, -0.1400913, -1.261928, 1, 0.227451, 0, 1,
-1.794991, 0.6469799, -1.111987, 1, 0.2352941, 0, 1,
-1.748996, -0.4434889, -1.731894, 1, 0.2392157, 0, 1,
-1.740711, 0.8180668, -1.495463, 1, 0.2470588, 0, 1,
-1.729882, 0.3495888, -1.398507, 1, 0.2509804, 0, 1,
-1.723778, -0.1260656, -3.767656, 1, 0.2588235, 0, 1,
-1.705302, -0.4288071, -2.900096, 1, 0.2627451, 0, 1,
-1.700826, -1.514663, -2.20928, 1, 0.2705882, 0, 1,
-1.698602, 0.5039173, -2.533996, 1, 0.2745098, 0, 1,
-1.695118, 1.100885, -0.4632527, 1, 0.282353, 0, 1,
-1.694369, -0.6196678, -2.81251, 1, 0.2862745, 0, 1,
-1.681104, -0.56547, -1.981481, 1, 0.2941177, 0, 1,
-1.67672, 0.7596336, -0.09818815, 1, 0.3019608, 0, 1,
-1.672924, 0.5716645, -2.508024, 1, 0.3058824, 0, 1,
-1.666198, 0.8753654, -1.514422, 1, 0.3137255, 0, 1,
-1.664987, -1.170914, -3.92695, 1, 0.3176471, 0, 1,
-1.661924, -1.302358, -2.098505, 1, 0.3254902, 0, 1,
-1.657918, -1.063184, -0.6280198, 1, 0.3294118, 0, 1,
-1.632455, -1.053099, -2.909606, 1, 0.3372549, 0, 1,
-1.604553, -0.2734016, -1.515708, 1, 0.3411765, 0, 1,
-1.603632, -0.571211, -1.719639, 1, 0.3490196, 0, 1,
-1.595834, -0.03798699, -1.810776, 1, 0.3529412, 0, 1,
-1.589954, -0.001155906, -0.8404706, 1, 0.3607843, 0, 1,
-1.577871, 1.950254, -1.472699, 1, 0.3647059, 0, 1,
-1.572969, -0.04054278, -3.245358, 1, 0.372549, 0, 1,
-1.571417, 2.719937, 1.030279, 1, 0.3764706, 0, 1,
-1.543618, 0.09407304, -1.799315, 1, 0.3843137, 0, 1,
-1.535757, -0.1054739, -0.3481098, 1, 0.3882353, 0, 1,
-1.512347, 2.095958, 0.1780897, 1, 0.3960784, 0, 1,
-1.508682, -0.2575486, -0.8067211, 1, 0.4039216, 0, 1,
-1.507481, 1.152018, -2.558062, 1, 0.4078431, 0, 1,
-1.506911, 0.3209514, -1.513457, 1, 0.4156863, 0, 1,
-1.504556, -1.19435, -3.173144, 1, 0.4196078, 0, 1,
-1.501127, 1.342177, -2.256064, 1, 0.427451, 0, 1,
-1.50018, -0.2310363, -0.5527587, 1, 0.4313726, 0, 1,
-1.496776, 1.997242, 0.1181122, 1, 0.4392157, 0, 1,
-1.48981, -1.285806, -1.787643, 1, 0.4431373, 0, 1,
-1.482512, -0.6912721, -1.976108, 1, 0.4509804, 0, 1,
-1.460929, 1.186886, -1.370769, 1, 0.454902, 0, 1,
-1.454092, 0.6292539, 0.3356701, 1, 0.4627451, 0, 1,
-1.44695, -0.5905035, 0.1066266, 1, 0.4666667, 0, 1,
-1.443864, -0.7084885, -1.08185, 1, 0.4745098, 0, 1,
-1.422473, -0.09878897, -2.618224, 1, 0.4784314, 0, 1,
-1.420669, -1.906627, -2.672059, 1, 0.4862745, 0, 1,
-1.418482, 1.73077, -1.110424, 1, 0.4901961, 0, 1,
-1.415674, -0.9697813, -2.60385, 1, 0.4980392, 0, 1,
-1.415099, -0.9427133, -2.36635, 1, 0.5058824, 0, 1,
-1.408174, 0.1235006, -2.820223, 1, 0.509804, 0, 1,
-1.400751, 0.263505, 0.4509115, 1, 0.5176471, 0, 1,
-1.397531, -0.942504, -1.54204, 1, 0.5215687, 0, 1,
-1.392523, -1.613326, -2.221721, 1, 0.5294118, 0, 1,
-1.381809, 1.195772, -0.09191597, 1, 0.5333334, 0, 1,
-1.372248, -0.01917858, -5.160367, 1, 0.5411765, 0, 1,
-1.370853, 0.008146099, -1.517011, 1, 0.5450981, 0, 1,
-1.370087, 0.4618354, -1.01678, 1, 0.5529412, 0, 1,
-1.368263, 0.2545782, -0.8771648, 1, 0.5568628, 0, 1,
-1.367675, -0.9456774, -1.608508, 1, 0.5647059, 0, 1,
-1.363762, 1.118342, 0.2705748, 1, 0.5686275, 0, 1,
-1.361425, -1.518375, -2.006721, 1, 0.5764706, 0, 1,
-1.359279, 2.357104, -2.839664, 1, 0.5803922, 0, 1,
-1.358764, 0.8952415, 0.2459494, 1, 0.5882353, 0, 1,
-1.358687, 1.269804, -1.00896, 1, 0.5921569, 0, 1,
-1.358426, 0.6549673, -1.856857, 1, 0.6, 0, 1,
-1.356939, 0.9250451, 0.05946872, 1, 0.6078432, 0, 1,
-1.35456, -1.195442, -2.660548, 1, 0.6117647, 0, 1,
-1.350165, -0.2583885, -0.3228212, 1, 0.6196079, 0, 1,
-1.342739, 0.703499, -1.980593, 1, 0.6235294, 0, 1,
-1.342626, 0.1751993, -0.7067296, 1, 0.6313726, 0, 1,
-1.333684, -0.2099903, -2.62788, 1, 0.6352941, 0, 1,
-1.332262, 0.3504473, -0.7173513, 1, 0.6431373, 0, 1,
-1.30772, 0.09682988, -1.568091, 1, 0.6470588, 0, 1,
-1.305605, 0.9861451, -0.8319706, 1, 0.654902, 0, 1,
-1.300161, 0.07807408, -2.001069, 1, 0.6588235, 0, 1,
-1.29919, -0.255141, -1.746508, 1, 0.6666667, 0, 1,
-1.294854, -1.942864, -2.310193, 1, 0.6705883, 0, 1,
-1.291803, 1.356583, -2.67162, 1, 0.6784314, 0, 1,
-1.289495, 1.00797, -0.7549829, 1, 0.682353, 0, 1,
-1.277055, 0.463351, -1.420212, 1, 0.6901961, 0, 1,
-1.274743, 0.4395696, -1.484528, 1, 0.6941177, 0, 1,
-1.27345, 2.371074, 0.2455855, 1, 0.7019608, 0, 1,
-1.26342, -1.255914, -3.29341, 1, 0.7098039, 0, 1,
-1.262713, 0.1802572, -0.9164475, 1, 0.7137255, 0, 1,
-1.255015, -0.01129881, -0.1504275, 1, 0.7215686, 0, 1,
-1.254064, -1.778352, -4.538701, 1, 0.7254902, 0, 1,
-1.248697, 0.1716003, -2.162452, 1, 0.7333333, 0, 1,
-1.23954, 0.2292551, -2.001294, 1, 0.7372549, 0, 1,
-1.232596, -1.890638, -2.435112, 1, 0.7450981, 0, 1,
-1.227809, 2.248072, -1.631109, 1, 0.7490196, 0, 1,
-1.227754, 1.040155, -0.3341898, 1, 0.7568628, 0, 1,
-1.22478, -0.01632806, -1.145401, 1, 0.7607843, 0, 1,
-1.224506, -0.9755355, -2.952728, 1, 0.7686275, 0, 1,
-1.219608, 0.6748909, 0.5242928, 1, 0.772549, 0, 1,
-1.218109, -0.8470935, -0.9471002, 1, 0.7803922, 0, 1,
-1.217294, -0.2633434, -0.800066, 1, 0.7843137, 0, 1,
-1.180072, 1.132724, -1.586455, 1, 0.7921569, 0, 1,
-1.176301, 0.2730838, -3.125432, 1, 0.7960784, 0, 1,
-1.167587, 0.5054581, -2.109867, 1, 0.8039216, 0, 1,
-1.158917, 0.4353958, -1.575984, 1, 0.8117647, 0, 1,
-1.156777, 0.962528, -0.5552562, 1, 0.8156863, 0, 1,
-1.148975, -1.214747, -1.488499, 1, 0.8235294, 0, 1,
-1.140692, -0.156351, -2.39044, 1, 0.827451, 0, 1,
-1.134087, 0.7669304, -2.792144, 1, 0.8352941, 0, 1,
-1.133414, 0.5023646, -2.122158, 1, 0.8392157, 0, 1,
-1.127072, 0.110098, -2.002824, 1, 0.8470588, 0, 1,
-1.124801, -0.9275347, -2.904199, 1, 0.8509804, 0, 1,
-1.11074, 0.4325353, -1.798111, 1, 0.8588235, 0, 1,
-1.106127, -0.4017923, 0.06488314, 1, 0.8627451, 0, 1,
-1.105563, 0.8891267, -0.6714626, 1, 0.8705882, 0, 1,
-1.088954, -0.2224916, -2.259481, 1, 0.8745098, 0, 1,
-1.087396, -1.728609, -2.115906, 1, 0.8823529, 0, 1,
-1.080725, -0.274912, -2.160538, 1, 0.8862745, 0, 1,
-1.076229, -1.162589, -2.254452, 1, 0.8941177, 0, 1,
-1.073489, 0.7051604, -2.757523, 1, 0.8980392, 0, 1,
-1.057872, 0.7896819, -1.208132, 1, 0.9058824, 0, 1,
-1.050467, 0.01613653, 0.1894399, 1, 0.9137255, 0, 1,
-1.041366, 0.6604773, -1.849529, 1, 0.9176471, 0, 1,
-1.040672, 1.025252, -0.4157266, 1, 0.9254902, 0, 1,
-1.034264, -0.3122206, -4.07088, 1, 0.9294118, 0, 1,
-1.0338, -1.127738, -3.105269, 1, 0.9372549, 0, 1,
-1.032951, 0.6058446, -2.884737, 1, 0.9411765, 0, 1,
-1.029648, 0.1710786, -1.699484, 1, 0.9490196, 0, 1,
-1.015323, 1.90897, -0.1373112, 1, 0.9529412, 0, 1,
-1.015153, -0.1656561, -2.306551, 1, 0.9607843, 0, 1,
-1.01451, 0.6020079, -3.050746, 1, 0.9647059, 0, 1,
-1.012375, 0.5970852, 1.100589, 1, 0.972549, 0, 1,
-1.01206, -0.2305366, -1.163977, 1, 0.9764706, 0, 1,
-1.00918, 2.213253, 0.9973311, 1, 0.9843137, 0, 1,
-1.008004, -0.5085271, -2.239155, 1, 0.9882353, 0, 1,
-1.00209, 1.255561, -1.229499, 1, 0.9960784, 0, 1,
-1.001733, -0.2852918, -1.630592, 0.9960784, 1, 0, 1,
-1.000921, 0.5945754, 0.3237146, 0.9921569, 1, 0, 1,
-1.000339, -2.361052, -3.683114, 0.9843137, 1, 0, 1,
-0.997333, 1.186869, 0.2191727, 0.9803922, 1, 0, 1,
-0.9958833, -0.5311495, -1.983259, 0.972549, 1, 0, 1,
-0.9957563, -2.575488, -1.913823, 0.9686275, 1, 0, 1,
-0.9914169, 1.280366, 0.3463433, 0.9607843, 1, 0, 1,
-0.9911273, -0.5945352, -2.41725, 0.9568627, 1, 0, 1,
-0.9887702, -0.6407973, 1.143278, 0.9490196, 1, 0, 1,
-0.9881264, -0.5001822, -2.503438, 0.945098, 1, 0, 1,
-0.9812816, -0.1495814, -0.9633534, 0.9372549, 1, 0, 1,
-0.9673262, -1.476233, -3.19437, 0.9333333, 1, 0, 1,
-0.9649925, 0.09582537, -2.595166, 0.9254902, 1, 0, 1,
-0.9613202, -1.972264, -2.971136, 0.9215686, 1, 0, 1,
-0.9578645, -0.7553781, -1.660796, 0.9137255, 1, 0, 1,
-0.9563, -0.6588278, -2.011351, 0.9098039, 1, 0, 1,
-0.9543061, -0.4311613, -3.03178, 0.9019608, 1, 0, 1,
-0.9491671, 1.495555, -0.1902792, 0.8941177, 1, 0, 1,
-0.947436, -0.05240345, -1.947906, 0.8901961, 1, 0, 1,
-0.9458968, 0.299785, -0.7235603, 0.8823529, 1, 0, 1,
-0.944299, -1.974605, -3.753094, 0.8784314, 1, 0, 1,
-0.9381154, -0.9259327, -1.502798, 0.8705882, 1, 0, 1,
-0.9346016, 0.151212, 0.5693859, 0.8666667, 1, 0, 1,
-0.9270254, -0.8222899, -0.9128577, 0.8588235, 1, 0, 1,
-0.9235243, -0.08541197, -1.485482, 0.854902, 1, 0, 1,
-0.9170465, -0.3446006, -2.710582, 0.8470588, 1, 0, 1,
-0.9139953, -0.05346052, -2.155398, 0.8431373, 1, 0, 1,
-0.9130469, -0.3579163, -1.654206, 0.8352941, 1, 0, 1,
-0.9083412, -0.939582, -2.476928, 0.8313726, 1, 0, 1,
-0.9055315, 0.969981, -0.1076644, 0.8235294, 1, 0, 1,
-0.9039297, -0.3137722, -1.685224, 0.8196079, 1, 0, 1,
-0.8993298, 1.007952, -1.79468, 0.8117647, 1, 0, 1,
-0.8992107, 0.3923277, -0.402016, 0.8078431, 1, 0, 1,
-0.897696, 0.3951748, -0.4121662, 0.8, 1, 0, 1,
-0.8933061, 2.157406, 0.4691257, 0.7921569, 1, 0, 1,
-0.8889754, 0.9481696, -0.9191492, 0.7882353, 1, 0, 1,
-0.8849023, 1.104636, -0.2701294, 0.7803922, 1, 0, 1,
-0.8824103, -0.09471436, -2.086076, 0.7764706, 1, 0, 1,
-0.8806242, 0.5034762, -1.54619, 0.7686275, 1, 0, 1,
-0.8743028, -0.6221604, -1.910483, 0.7647059, 1, 0, 1,
-0.8690823, 1.697301, -0.4523245, 0.7568628, 1, 0, 1,
-0.8622721, -0.4308908, -3.021996, 0.7529412, 1, 0, 1,
-0.8582314, 0.4676635, -1.013702, 0.7450981, 1, 0, 1,
-0.8540406, 1.500828, 1.201224, 0.7411765, 1, 0, 1,
-0.8517773, 1.398656, -1.971728, 0.7333333, 1, 0, 1,
-0.8465344, -0.15094, -1.243612, 0.7294118, 1, 0, 1,
-0.8459824, -0.7181098, -1.636845, 0.7215686, 1, 0, 1,
-0.8371211, -0.2898535, -2.796979, 0.7176471, 1, 0, 1,
-0.8316827, 0.163512, -1.294603, 0.7098039, 1, 0, 1,
-0.8286633, 0.296877, -1.94799, 0.7058824, 1, 0, 1,
-0.8236505, 0.8523238, -1.872573, 0.6980392, 1, 0, 1,
-0.8205471, -1.479317, -2.87167, 0.6901961, 1, 0, 1,
-0.8196553, 1.057759, 0.4330996, 0.6862745, 1, 0, 1,
-0.8183632, 0.7228895, 0.01352799, 0.6784314, 1, 0, 1,
-0.8119074, 0.4809886, -1.718918, 0.6745098, 1, 0, 1,
-0.8085616, 0.2779185, 0.05191251, 0.6666667, 1, 0, 1,
-0.808388, 0.4284325, -1.82219, 0.6627451, 1, 0, 1,
-0.8058253, 1.271945, -0.1441278, 0.654902, 1, 0, 1,
-0.8023596, 0.161744, -1.086647, 0.6509804, 1, 0, 1,
-0.7969314, 1.167051, -0.2369349, 0.6431373, 1, 0, 1,
-0.788888, -2.532598, -3.876995, 0.6392157, 1, 0, 1,
-0.7882277, -0.276969, 0.1471056, 0.6313726, 1, 0, 1,
-0.7875711, -1.243676, -1.855266, 0.627451, 1, 0, 1,
-0.7870336, 0.3407139, -1.475546, 0.6196079, 1, 0, 1,
-0.7830437, -0.2014199, 0.371694, 0.6156863, 1, 0, 1,
-0.7782588, -0.1205532, -2.84819, 0.6078432, 1, 0, 1,
-0.7781621, 0.09146453, -0.3433978, 0.6039216, 1, 0, 1,
-0.7761815, 0.5045052, -1.751649, 0.5960785, 1, 0, 1,
-0.7721965, 0.1252661, -1.187689, 0.5882353, 1, 0, 1,
-0.7675481, 0.8321927, 0.03471024, 0.5843138, 1, 0, 1,
-0.7646437, 1.099864, -0.5424878, 0.5764706, 1, 0, 1,
-0.7623082, 0.0812254, -1.305501, 0.572549, 1, 0, 1,
-0.761267, -0.6635459, -0.6230382, 0.5647059, 1, 0, 1,
-0.7592523, 1.224371, -0.84602, 0.5607843, 1, 0, 1,
-0.7584578, -1.006811, -2.282368, 0.5529412, 1, 0, 1,
-0.758105, 0.4439084, 0.2253951, 0.5490196, 1, 0, 1,
-0.7539246, 0.7930545, 0.1288188, 0.5411765, 1, 0, 1,
-0.7512379, 1.019858, -0.154367, 0.5372549, 1, 0, 1,
-0.7502645, -1.118656, -1.86628, 0.5294118, 1, 0, 1,
-0.7477794, 0.2669552, -1.198976, 0.5254902, 1, 0, 1,
-0.7461023, 0.003559089, -2.463587, 0.5176471, 1, 0, 1,
-0.7453381, -0.236111, -2.804927, 0.5137255, 1, 0, 1,
-0.7421309, -0.2124469, -3.106486, 0.5058824, 1, 0, 1,
-0.7368053, -1.98867, -1.940444, 0.5019608, 1, 0, 1,
-0.7349662, 0.5497699, -1.384796, 0.4941176, 1, 0, 1,
-0.7295196, -0.2585276, -1.133827, 0.4862745, 1, 0, 1,
-0.7244408, 1.815166, 0.2932737, 0.4823529, 1, 0, 1,
-0.7189959, -1.319885, -3.967052, 0.4745098, 1, 0, 1,
-0.7189708, -0.5904093, -0.5925532, 0.4705882, 1, 0, 1,
-0.715328, 0.1742056, -0.9679295, 0.4627451, 1, 0, 1,
-0.7114615, -0.4244364, -1.032963, 0.4588235, 1, 0, 1,
-0.7109739, 0.5586281, -0.933558, 0.4509804, 1, 0, 1,
-0.7099038, -2.526131, -1.835011, 0.4470588, 1, 0, 1,
-0.7021118, 0.1135725, -3.567152, 0.4392157, 1, 0, 1,
-0.6944438, -0.1024146, -0.7188717, 0.4352941, 1, 0, 1,
-0.6838416, 0.2945724, -0.3575978, 0.427451, 1, 0, 1,
-0.6814883, 0.8768854, 1.567378, 0.4235294, 1, 0, 1,
-0.6779969, 0.4063924, -0.7278234, 0.4156863, 1, 0, 1,
-0.6760688, -2.330459, -2.767043, 0.4117647, 1, 0, 1,
-0.6717711, -0.3626132, -1.958055, 0.4039216, 1, 0, 1,
-0.6676788, -0.3600089, -1.467802, 0.3960784, 1, 0, 1,
-0.6667745, 0.7293209, -0.5168187, 0.3921569, 1, 0, 1,
-0.6635597, -0.1799174, -3.360118, 0.3843137, 1, 0, 1,
-0.6486264, -0.8654333, -1.98822, 0.3803922, 1, 0, 1,
-0.6475708, 0.3300055, -0.1995777, 0.372549, 1, 0, 1,
-0.6466505, -1.586694, -1.956995, 0.3686275, 1, 0, 1,
-0.6388245, -1.776659, -3.969395, 0.3607843, 1, 0, 1,
-0.6381161, 0.4781604, 1.17408, 0.3568628, 1, 0, 1,
-0.6359899, -0.4083763, -1.049195, 0.3490196, 1, 0, 1,
-0.6300224, 1.228833, -1.486296, 0.345098, 1, 0, 1,
-0.6226705, 0.4930536, -2.986217, 0.3372549, 1, 0, 1,
-0.6213717, 0.466041, 0.3142432, 0.3333333, 1, 0, 1,
-0.6174536, -1.532701, -3.219966, 0.3254902, 1, 0, 1,
-0.616493, 0.4708877, -1.930429, 0.3215686, 1, 0, 1,
-0.6076341, 1.486488, -0.7799116, 0.3137255, 1, 0, 1,
-0.6066568, -0.1673838, -2.278127, 0.3098039, 1, 0, 1,
-0.6064645, -0.1403602, -2.621008, 0.3019608, 1, 0, 1,
-0.593407, 0.8876676, -0.3921132, 0.2941177, 1, 0, 1,
-0.5887666, -0.6591917, -3.417523, 0.2901961, 1, 0, 1,
-0.5782502, -0.3075922, -0.1792293, 0.282353, 1, 0, 1,
-0.5746067, 1.036908, -0.9516675, 0.2784314, 1, 0, 1,
-0.5693179, -0.9679281, -2.756471, 0.2705882, 1, 0, 1,
-0.5665478, 0.2120671, -0.3791338, 0.2666667, 1, 0, 1,
-0.5618035, 1.312943, 0.6052153, 0.2588235, 1, 0, 1,
-0.5608608, -0.6305045, -2.696238, 0.254902, 1, 0, 1,
-0.5577947, -0.102147, -1.847858, 0.2470588, 1, 0, 1,
-0.5549781, 0.01084246, -0.8428475, 0.2431373, 1, 0, 1,
-0.5536528, 0.6083326, -1.032451, 0.2352941, 1, 0, 1,
-0.552929, -0.2161716, -2.105191, 0.2313726, 1, 0, 1,
-0.5506166, -0.711055, -3.702314, 0.2235294, 1, 0, 1,
-0.5503002, -1.863914, -3.705921, 0.2196078, 1, 0, 1,
-0.5490528, 0.3881724, 1.144789, 0.2117647, 1, 0, 1,
-0.5487646, 0.7702957, -0.3479172, 0.2078431, 1, 0, 1,
-0.5456771, 0.1615102, -1.519133, 0.2, 1, 0, 1,
-0.5433743, -0.6222849, -2.478039, 0.1921569, 1, 0, 1,
-0.5346406, 1.418811, -1.125378, 0.1882353, 1, 0, 1,
-0.5337584, 0.0414737, -1.200603, 0.1803922, 1, 0, 1,
-0.5337391, 1.328388, -0.874539, 0.1764706, 1, 0, 1,
-0.5307407, -1.61551, -3.058917, 0.1686275, 1, 0, 1,
-0.5306659, -0.816672, -1.732412, 0.1647059, 1, 0, 1,
-0.5303524, 0.2943292, -2.302612, 0.1568628, 1, 0, 1,
-0.5281189, 0.1103693, -1.916959, 0.1529412, 1, 0, 1,
-0.5273275, 0.5865148, -1.394245, 0.145098, 1, 0, 1,
-0.525461, 0.665334, -0.7377427, 0.1411765, 1, 0, 1,
-0.5226739, 0.2542415, -2.183674, 0.1333333, 1, 0, 1,
-0.5226109, -0.5952227, -3.954111, 0.1294118, 1, 0, 1,
-0.5220312, 0.446558, -0.08541267, 0.1215686, 1, 0, 1,
-0.5182831, 0.07760855, -3.072596, 0.1176471, 1, 0, 1,
-0.5150676, -0.3321178, -3.138117, 0.1098039, 1, 0, 1,
-0.5126777, 0.2653691, -2.018396, 0.1058824, 1, 0, 1,
-0.511827, -1.634414, -3.185428, 0.09803922, 1, 0, 1,
-0.5072001, -0.6727278, -3.605904, 0.09019608, 1, 0, 1,
-0.4992706, 2.099708, 0.5323944, 0.08627451, 1, 0, 1,
-0.4984626, 1.494842, -1.71534, 0.07843138, 1, 0, 1,
-0.4972137, 0.2016589, -2.100965, 0.07450981, 1, 0, 1,
-0.4944102, 1.615074, -0.1792554, 0.06666667, 1, 0, 1,
-0.4918766, -1.102659, -3.463449, 0.0627451, 1, 0, 1,
-0.4871058, 1.405557, -1.500717, 0.05490196, 1, 0, 1,
-0.4870573, 1.678893, 0.9211448, 0.05098039, 1, 0, 1,
-0.4862348, -0.6694347, -0.824499, 0.04313726, 1, 0, 1,
-0.4855678, 0.3180115, 2.152524, 0.03921569, 1, 0, 1,
-0.485402, -0.9598359, -3.584176, 0.03137255, 1, 0, 1,
-0.4833888, 1.586906, -0.257118, 0.02745098, 1, 0, 1,
-0.4754316, -0.9377752, -4.000355, 0.01960784, 1, 0, 1,
-0.4718057, -0.6181411, -2.628259, 0.01568628, 1, 0, 1,
-0.470572, -0.08023801, -1.253596, 0.007843138, 1, 0, 1,
-0.4621024, -0.5078022, -1.863334, 0.003921569, 1, 0, 1,
-0.460641, 1.095401, -0.8950857, 0, 1, 0.003921569, 1,
-0.4590628, 0.6430176, -1.903702, 0, 1, 0.01176471, 1,
-0.4569356, 0.07727485, -0.6761917, 0, 1, 0.01568628, 1,
-0.4550602, -0.4002435, -2.739224, 0, 1, 0.02352941, 1,
-0.4520642, 1.712145, -0.8829054, 0, 1, 0.02745098, 1,
-0.4519694, -0.4580442, -2.880054, 0, 1, 0.03529412, 1,
-0.4440505, -0.1868005, -1.770803, 0, 1, 0.03921569, 1,
-0.4358551, -0.8099343, -2.543515, 0, 1, 0.04705882, 1,
-0.4353433, 0.9166812, -1.046266, 0, 1, 0.05098039, 1,
-0.4340652, -1.112535, -2.605088, 0, 1, 0.05882353, 1,
-0.4307125, 1.923361, -0.9259396, 0, 1, 0.0627451, 1,
-0.4287433, -1.376105, -3.286182, 0, 1, 0.07058824, 1,
-0.427352, 2.211594, 0.6754057, 0, 1, 0.07450981, 1,
-0.4263262, 0.9579674, -0.5563804, 0, 1, 0.08235294, 1,
-0.4251751, -0.3328339, -3.132339, 0, 1, 0.08627451, 1,
-0.4152974, -0.984199, -2.291061, 0, 1, 0.09411765, 1,
-0.4140204, -1.453311, -3.217021, 0, 1, 0.1019608, 1,
-0.4072586, 1.71183, -1.989379, 0, 1, 0.1058824, 1,
-0.4060856, 0.3938591, -0.3279221, 0, 1, 0.1137255, 1,
-0.3990202, 0.6167136, 0.6975312, 0, 1, 0.1176471, 1,
-0.3989144, -0.6537282, -2.957569, 0, 1, 0.1254902, 1,
-0.3971277, 1.333512, 0.4779299, 0, 1, 0.1294118, 1,
-0.3896825, -0.8043423, -1.967053, 0, 1, 0.1372549, 1,
-0.3805438, -1.305214, -2.728211, 0, 1, 0.1411765, 1,
-0.3780044, 1.46662, -0.8005585, 0, 1, 0.1490196, 1,
-0.3764848, 1.125987, 0.6004346, 0, 1, 0.1529412, 1,
-0.3755977, -0.4976072, -3.150688, 0, 1, 0.1607843, 1,
-0.3749904, -0.1033832, -0.4839247, 0, 1, 0.1647059, 1,
-0.3737329, -0.8631006, -1.503643, 0, 1, 0.172549, 1,
-0.3715978, -0.1682743, -3.221654, 0, 1, 0.1764706, 1,
-0.3690304, -0.8870947, -2.925531, 0, 1, 0.1843137, 1,
-0.3678758, 0.5511756, -2.076281, 0, 1, 0.1882353, 1,
-0.3573317, -0.8969822, -1.992529, 0, 1, 0.1960784, 1,
-0.3569965, 0.06969831, -1.652253, 0, 1, 0.2039216, 1,
-0.3510206, 1.072041, -0.2857867, 0, 1, 0.2078431, 1,
-0.3504988, 0.3065306, -1.917352, 0, 1, 0.2156863, 1,
-0.3485227, 0.1077572, -1.111365, 0, 1, 0.2196078, 1,
-0.3445513, 0.09554869, -0.7405913, 0, 1, 0.227451, 1,
-0.3439338, -0.2506587, -0.1347667, 0, 1, 0.2313726, 1,
-0.341583, -2.276799, -1.607942, 0, 1, 0.2392157, 1,
-0.3395309, 0.208621, -0.7671287, 0, 1, 0.2431373, 1,
-0.3383419, 0.8091092, -0.545838, 0, 1, 0.2509804, 1,
-0.3298644, 0.935177, -0.2042909, 0, 1, 0.254902, 1,
-0.324836, 1.121492, 0.3325392, 0, 1, 0.2627451, 1,
-0.3246182, -0.2020506, -1.006789, 0, 1, 0.2666667, 1,
-0.3205719, 1.242779, -0.9004416, 0, 1, 0.2745098, 1,
-0.3188648, 0.2489862, -1.439045, 0, 1, 0.2784314, 1,
-0.3129286, -0.1763426, -2.047721, 0, 1, 0.2862745, 1,
-0.3082828, -0.1137844, -2.583593, 0, 1, 0.2901961, 1,
-0.3077735, 1.107494, -1.064005, 0, 1, 0.2980392, 1,
-0.3063896, -0.1041796, -2.274607, 0, 1, 0.3058824, 1,
-0.2941595, 0.9419722, -0.8351945, 0, 1, 0.3098039, 1,
-0.2864313, -0.81624, -3.171327, 0, 1, 0.3176471, 1,
-0.285855, 0.6789421, -0.1640925, 0, 1, 0.3215686, 1,
-0.283879, -0.2738081, -2.714523, 0, 1, 0.3294118, 1,
-0.2801444, -0.4473563, -4.185335, 0, 1, 0.3333333, 1,
-0.2787828, 0.8149543, -0.2258354, 0, 1, 0.3411765, 1,
-0.2785543, 0.08898281, -2.122827, 0, 1, 0.345098, 1,
-0.2763145, 1.708394, -1.262506, 0, 1, 0.3529412, 1,
-0.2753855, -0.2867763, -2.600355, 0, 1, 0.3568628, 1,
-0.2725405, 1.005686, 0.912967, 0, 1, 0.3647059, 1,
-0.2712541, -0.0240992, -0.3059082, 0, 1, 0.3686275, 1,
-0.2698219, -0.01629298, -0.8917826, 0, 1, 0.3764706, 1,
-0.2689942, -1.399718, -3.421279, 0, 1, 0.3803922, 1,
-0.2674022, -0.2401703, -3.63951, 0, 1, 0.3882353, 1,
-0.2622969, 0.7379852, -0.435431, 0, 1, 0.3921569, 1,
-0.2558014, 0.560483, 0.2480936, 0, 1, 0.4, 1,
-0.2533098, 0.09726132, -1.468528, 0, 1, 0.4078431, 1,
-0.2513589, 0.8072965, -1.685523, 0, 1, 0.4117647, 1,
-0.250884, -0.3500665, -0.8649255, 0, 1, 0.4196078, 1,
-0.2462468, -1.044799, -2.618653, 0, 1, 0.4235294, 1,
-0.245906, 0.3580681, 0.02213137, 0, 1, 0.4313726, 1,
-0.2344034, 1.142256, 0.211201, 0, 1, 0.4352941, 1,
-0.2306746, -0.4204685, -3.364498, 0, 1, 0.4431373, 1,
-0.2265541, -0.5618019, -4.633074, 0, 1, 0.4470588, 1,
-0.2240196, 1.133188, -0.2624126, 0, 1, 0.454902, 1,
-0.2216613, -1.115956, -3.632199, 0, 1, 0.4588235, 1,
-0.2198304, -0.4963799, -2.495578, 0, 1, 0.4666667, 1,
-0.2125585, 0.532681, -1.620061, 0, 1, 0.4705882, 1,
-0.2107105, -1.233531, -2.710157, 0, 1, 0.4784314, 1,
-0.207955, -0.5621361, -3.073244, 0, 1, 0.4823529, 1,
-0.2077392, -0.07319345, -1.976971, 0, 1, 0.4901961, 1,
-0.2074279, -1.792595, -5.199096, 0, 1, 0.4941176, 1,
-0.2060006, -0.8023198, -0.8783781, 0, 1, 0.5019608, 1,
-0.1997566, 0.08100418, -0.6471619, 0, 1, 0.509804, 1,
-0.1985497, 1.047936, -1.847562, 0, 1, 0.5137255, 1,
-0.1951367, -1.309642, -2.172545, 0, 1, 0.5215687, 1,
-0.1889749, 1.013316, -0.3450084, 0, 1, 0.5254902, 1,
-0.1885182, 0.231684, 0.2754607, 0, 1, 0.5333334, 1,
-0.1880643, 2.239497, -0.1751305, 0, 1, 0.5372549, 1,
-0.1856979, 1.406508, 0.8038943, 0, 1, 0.5450981, 1,
-0.1834214, -0.1040239, -0.3368119, 0, 1, 0.5490196, 1,
-0.1810052, 0.3178831, 0.2019096, 0, 1, 0.5568628, 1,
-0.1802719, 1.860841, -0.9088205, 0, 1, 0.5607843, 1,
-0.1770449, -1.129331, -4.359404, 0, 1, 0.5686275, 1,
-0.1766645, 0.3675021, -1.049541, 0, 1, 0.572549, 1,
-0.1763556, -0.03803701, -2.006126, 0, 1, 0.5803922, 1,
-0.1763298, 0.6534342, 0.2577497, 0, 1, 0.5843138, 1,
-0.1749853, 0.5925867, -0.5874838, 0, 1, 0.5921569, 1,
-0.1734872, 0.9608365, -0.7190856, 0, 1, 0.5960785, 1,
-0.1710108, -1.145673, -1.774218, 0, 1, 0.6039216, 1,
-0.1657596, -0.9038383, -1.174025, 0, 1, 0.6117647, 1,
-0.1607971, -1.269766, -2.065079, 0, 1, 0.6156863, 1,
-0.1520008, -0.05270918, -2.076266, 0, 1, 0.6235294, 1,
-0.1407167, -0.3358789, -2.563596, 0, 1, 0.627451, 1,
-0.1400352, 0.4599199, -0.07157735, 0, 1, 0.6352941, 1,
-0.1352686, -0.03628205, -0.3512284, 0, 1, 0.6392157, 1,
-0.1333117, 0.7745203, 0.680243, 0, 1, 0.6470588, 1,
-0.1332759, -0.7299649, -3.948152, 0, 1, 0.6509804, 1,
-0.1290923, 1.864061, 1.243819, 0, 1, 0.6588235, 1,
-0.1267228, 1.968867, 0.410433, 0, 1, 0.6627451, 1,
-0.1260218, -0.2174763, -3.941551, 0, 1, 0.6705883, 1,
-0.1248915, -1.340215, -5.016551, 0, 1, 0.6745098, 1,
-0.123, 0.631664, -0.5582998, 0, 1, 0.682353, 1,
-0.1225844, -0.4735522, -1.9069, 0, 1, 0.6862745, 1,
-0.1223836, -1.340641, -1.200335, 0, 1, 0.6941177, 1,
-0.1209233, -0.7777806, -6.144313, 0, 1, 0.7019608, 1,
-0.1189578, -1.188883, -3.127011, 0, 1, 0.7058824, 1,
-0.1169213, -0.7680368, -3.209133, 0, 1, 0.7137255, 1,
-0.1159245, 1.426103, -0.405939, 0, 1, 0.7176471, 1,
-0.1142605, 1.642624, -0.6990907, 0, 1, 0.7254902, 1,
-0.1077636, -0.7773692, -1.615502, 0, 1, 0.7294118, 1,
-0.1061483, -0.1781332, -3.420567, 0, 1, 0.7372549, 1,
-0.1024973, -0.4029614, -3.629072, 0, 1, 0.7411765, 1,
-0.09995381, -0.665211, -2.897959, 0, 1, 0.7490196, 1,
-0.09788343, 0.8912078, -0.9343412, 0, 1, 0.7529412, 1,
-0.09361153, 1.033391, 0.3300314, 0, 1, 0.7607843, 1,
-0.09171768, 0.3643039, -0.8037289, 0, 1, 0.7647059, 1,
-0.09151886, -1.41564, -1.474281, 0, 1, 0.772549, 1,
-0.08484329, 0.8457124, 2.56513, 0, 1, 0.7764706, 1,
-0.0811222, -2.276383, -2.947251, 0, 1, 0.7843137, 1,
-0.08093248, -0.2301022, -1.528945, 0, 1, 0.7882353, 1,
-0.08069728, -0.140956, -2.88655, 0, 1, 0.7960784, 1,
-0.07939468, -0.9074294, -0.7794236, 0, 1, 0.8039216, 1,
-0.07389752, 0.3207368, 1.488766, 0, 1, 0.8078431, 1,
-0.06610505, -0.3246171, -1.869443, 0, 1, 0.8156863, 1,
-0.06110254, 0.3298833, 1.464226, 0, 1, 0.8196079, 1,
-0.05713962, 0.09209476, -0.5861014, 0, 1, 0.827451, 1,
-0.05385093, 0.2183302, -0.4194719, 0, 1, 0.8313726, 1,
-0.05332097, 0.5794114, 0.3595775, 0, 1, 0.8392157, 1,
-0.05245135, 1.239673, -0.8508039, 0, 1, 0.8431373, 1,
-0.05052055, -1.209933, -2.036081, 0, 1, 0.8509804, 1,
-0.04389542, 0.6605631, 0.2938491, 0, 1, 0.854902, 1,
-0.04378711, 0.8463085, -1.01672, 0, 1, 0.8627451, 1,
-0.03541317, 0.9702263, 0.6112269, 0, 1, 0.8666667, 1,
-0.03433225, -0.0334928, -2.88445, 0, 1, 0.8745098, 1,
-0.03225065, -0.6962011, -3.25791, 0, 1, 0.8784314, 1,
-0.03155294, 0.1800543, 0.8692062, 0, 1, 0.8862745, 1,
-0.02949859, -0.3401714, -3.691064, 0, 1, 0.8901961, 1,
-0.02745025, -0.6007885, -1.67897, 0, 1, 0.8980392, 1,
-0.02741439, -0.03157436, -0.9827292, 0, 1, 0.9058824, 1,
-0.02608777, 0.434563, 0.8886504, 0, 1, 0.9098039, 1,
-0.02604283, -0.5645983, -1.831451, 0, 1, 0.9176471, 1,
-0.02391281, 1.302355, -1.991256, 0, 1, 0.9215686, 1,
-0.02234767, 0.6856288, -1.081506, 0, 1, 0.9294118, 1,
-0.02024746, 0.258321, -0.1195227, 0, 1, 0.9333333, 1,
-0.01454878, 0.4474664, 0.6425232, 0, 1, 0.9411765, 1,
-0.01125416, -0.08197767, -1.193352, 0, 1, 0.945098, 1,
-0.01071858, -2.025003, -1.450796, 0, 1, 0.9529412, 1,
-0.01033304, 0.6586466, -0.008689611, 0, 1, 0.9568627, 1,
-0.006509318, -1.687101, -4.683296, 0, 1, 0.9647059, 1,
-0.006172211, -0.1530901, -1.580111, 0, 1, 0.9686275, 1,
-0.005489727, -0.6433617, -4.655925, 0, 1, 0.9764706, 1,
0.001546029, -0.686677, 2.991717, 0, 1, 0.9803922, 1,
0.01018345, 0.7218384, -1.088725, 0, 1, 0.9882353, 1,
0.01061258, -1.068714, 2.132417, 0, 1, 0.9921569, 1,
0.0114943, 0.6987456, 0.4468753, 0, 1, 1, 1,
0.01316999, 0.1473574, 0.8786778, 0, 0.9921569, 1, 1,
0.01347142, 1.053353, -3.419083, 0, 0.9882353, 1, 1,
0.01391328, 1.498525, 0.9291915, 0, 0.9803922, 1, 1,
0.01646795, 0.9035848, 0.001693166, 0, 0.9764706, 1, 1,
0.02062161, -0.481113, 1.943795, 0, 0.9686275, 1, 1,
0.02317173, -0.6621991, 1.946059, 0, 0.9647059, 1, 1,
0.02347215, 1.106782, 1.607751, 0, 0.9568627, 1, 1,
0.02579586, -0.4291677, 1.327127, 0, 0.9529412, 1, 1,
0.02698947, 0.4353339, 0.7758802, 0, 0.945098, 1, 1,
0.02719758, 1.044596, -0.05625564, 0, 0.9411765, 1, 1,
0.02831284, 0.06351325, 1.287845, 0, 0.9333333, 1, 1,
0.0285337, 0.2421932, -1.427629, 0, 0.9294118, 1, 1,
0.02873449, -1.372759, 2.591199, 0, 0.9215686, 1, 1,
0.02911471, -0.1444481, 3.05505, 0, 0.9176471, 1, 1,
0.0294855, 1.608859, -0.1560621, 0, 0.9098039, 1, 1,
0.03766545, 0.8436513, 0.839336, 0, 0.9058824, 1, 1,
0.03769035, 0.1778113, -0.0956964, 0, 0.8980392, 1, 1,
0.04028825, -1.047122, 1.144783, 0, 0.8901961, 1, 1,
0.04640352, -1.597718, 2.119028, 0, 0.8862745, 1, 1,
0.04691537, -0.068574, 1.824914, 0, 0.8784314, 1, 1,
0.04728637, 0.1339404, -1.662869, 0, 0.8745098, 1, 1,
0.06642035, -0.08089351, 3.652545, 0, 0.8666667, 1, 1,
0.06972463, -0.5229048, 3.154131, 0, 0.8627451, 1, 1,
0.0702216, -0.09432838, 2.077798, 0, 0.854902, 1, 1,
0.07231978, 0.1576565, -0.3562028, 0, 0.8509804, 1, 1,
0.07736816, 0.4444913, -0.4621133, 0, 0.8431373, 1, 1,
0.08285177, 0.01186457, 1.044929, 0, 0.8392157, 1, 1,
0.08755298, -1.100518, 0.1686923, 0, 0.8313726, 1, 1,
0.09170077, 0.3436215, 0.5668772, 0, 0.827451, 1, 1,
0.1018709, -0.4245999, 3.587154, 0, 0.8196079, 1, 1,
0.1037525, -1.918503, 3.529515, 0, 0.8156863, 1, 1,
0.1073412, 1.147992, 0.7776152, 0, 0.8078431, 1, 1,
0.1093659, 0.8483334, 1.931161, 0, 0.8039216, 1, 1,
0.1123374, -1.085375, 1.851182, 0, 0.7960784, 1, 1,
0.1135692, 0.114497, 0.2935657, 0, 0.7882353, 1, 1,
0.1135745, 0.2063664, -1.116309, 0, 0.7843137, 1, 1,
0.11429, 0.04124281, 1.074782, 0, 0.7764706, 1, 1,
0.1150733, -1.176906, 2.652193, 0, 0.772549, 1, 1,
0.1167374, -0.5976958, 3.726898, 0, 0.7647059, 1, 1,
0.1190153, 1.223081, 1.890439, 0, 0.7607843, 1, 1,
0.1255195, -0.4415795, 3.403311, 0, 0.7529412, 1, 1,
0.1259836, 0.3228584, -1.185886, 0, 0.7490196, 1, 1,
0.1273198, -0.3116216, 2.158503, 0, 0.7411765, 1, 1,
0.1292123, 0.07507552, 2.233817, 0, 0.7372549, 1, 1,
0.1301989, 0.3568251, 1.575007, 0, 0.7294118, 1, 1,
0.1310039, -0.6963196, 3.592239, 0, 0.7254902, 1, 1,
0.1376415, -2.140675, 3.275089, 0, 0.7176471, 1, 1,
0.148014, 1.260296, -0.1438475, 0, 0.7137255, 1, 1,
0.1501502, 0.2793405, 0.7196158, 0, 0.7058824, 1, 1,
0.151881, 1.502886, -0.535881, 0, 0.6980392, 1, 1,
0.154019, 0.3737677, 1.317579, 0, 0.6941177, 1, 1,
0.1587523, 0.5788234, -0.04561026, 0, 0.6862745, 1, 1,
0.1605129, 2.239375, 1.115089, 0, 0.682353, 1, 1,
0.1612909, -0.03463752, 2.298661, 0, 0.6745098, 1, 1,
0.1660101, -1.666224, 4.924699, 0, 0.6705883, 1, 1,
0.1676838, -0.6041548, 1.175224, 0, 0.6627451, 1, 1,
0.1694334, -0.08491617, 1.124264, 0, 0.6588235, 1, 1,
0.1731704, 1.722057, 0.906072, 0, 0.6509804, 1, 1,
0.177548, -0.8488229, 3.896952, 0, 0.6470588, 1, 1,
0.182592, -1.04699, 4.563473, 0, 0.6392157, 1, 1,
0.1846189, 0.2424834, 0.2366823, 0, 0.6352941, 1, 1,
0.1909759, -1.284999, 3.488441, 0, 0.627451, 1, 1,
0.1954151, -0.5892204, 1.286069, 0, 0.6235294, 1, 1,
0.1994202, 0.7323369, 0.2053962, 0, 0.6156863, 1, 1,
0.1996788, 0.6840727, 0.1787587, 0, 0.6117647, 1, 1,
0.2050826, 1.149676, -1.435322, 0, 0.6039216, 1, 1,
0.2062837, 0.7469978, -1.445861, 0, 0.5960785, 1, 1,
0.2073538, -0.08077043, 2.383791, 0, 0.5921569, 1, 1,
0.208007, -0.826075, 2.801239, 0, 0.5843138, 1, 1,
0.2084446, 0.6478614, -0.5267946, 0, 0.5803922, 1, 1,
0.2095247, 0.5931833, 1.053774, 0, 0.572549, 1, 1,
0.2128898, 0.027746, 2.196087, 0, 0.5686275, 1, 1,
0.2134786, 0.9571701, 0.6210565, 0, 0.5607843, 1, 1,
0.2143754, -0.8171587, 2.835962, 0, 0.5568628, 1, 1,
0.2162486, 2.665291, -0.7113068, 0, 0.5490196, 1, 1,
0.217752, -1.031344, 4.456085, 0, 0.5450981, 1, 1,
0.2259225, 0.1871306, 0.1297367, 0, 0.5372549, 1, 1,
0.2280511, 0.2221564, -1.213094, 0, 0.5333334, 1, 1,
0.2301715, -0.3526497, 1.78479, 0, 0.5254902, 1, 1,
0.2330169, 0.442146, 0.5972483, 0, 0.5215687, 1, 1,
0.2369072, -2.104123, 3.232548, 0, 0.5137255, 1, 1,
0.2370028, -0.4422025, 2.46189, 0, 0.509804, 1, 1,
0.2370988, -0.07716595, 2.490552, 0, 0.5019608, 1, 1,
0.2375891, -0.2438816, 2.388133, 0, 0.4941176, 1, 1,
0.2391941, -1.92969, 4.436382, 0, 0.4901961, 1, 1,
0.2437009, 1.520192, 0.2590583, 0, 0.4823529, 1, 1,
0.2457705, -2.513625, 3.532229, 0, 0.4784314, 1, 1,
0.2469748, -0.1542188, 1.183945, 0, 0.4705882, 1, 1,
0.2508364, -0.8005313, 1.5029, 0, 0.4666667, 1, 1,
0.2540887, -0.5686268, 3.515323, 0, 0.4588235, 1, 1,
0.2572441, 0.3102569, 1.696008, 0, 0.454902, 1, 1,
0.2577969, -1.214203, 4.055976, 0, 0.4470588, 1, 1,
0.2590499, 2.470655, -0.1600426, 0, 0.4431373, 1, 1,
0.2672918, 0.8602985, 0.02539139, 0, 0.4352941, 1, 1,
0.2679155, 3.078514, 0.6965986, 0, 0.4313726, 1, 1,
0.2685287, 1.290282, 1.091114, 0, 0.4235294, 1, 1,
0.2744831, 0.1380273, 0.7920285, 0, 0.4196078, 1, 1,
0.2752996, 0.1621928, 1.780271, 0, 0.4117647, 1, 1,
0.2754544, 1.498585, 0.508509, 0, 0.4078431, 1, 1,
0.2770889, -0.4905652, 1.657257, 0, 0.4, 1, 1,
0.2836127, 0.09784534, 2.317144, 0, 0.3921569, 1, 1,
0.2865427, -0.3088277, 4.050593, 0, 0.3882353, 1, 1,
0.289512, -1.063708, 1.796799, 0, 0.3803922, 1, 1,
0.2951414, -0.834966, 3.554833, 0, 0.3764706, 1, 1,
0.2952978, -1.971882, 3.584952, 0, 0.3686275, 1, 1,
0.2973106, -0.0003144798, 0.8016346, 0, 0.3647059, 1, 1,
0.301717, -0.3636222, 3.607479, 0, 0.3568628, 1, 1,
0.3030778, 0.3014916, 0.3619509, 0, 0.3529412, 1, 1,
0.3039055, 0.9752359, 1.350915, 0, 0.345098, 1, 1,
0.3039535, -1.747332, 1.480555, 0, 0.3411765, 1, 1,
0.3044555, 1.372085, 0.5811504, 0, 0.3333333, 1, 1,
0.3170156, -0.3967313, 2.844983, 0, 0.3294118, 1, 1,
0.3182544, -1.667843, 3.212523, 0, 0.3215686, 1, 1,
0.3184476, -1.194406, 4.283291, 0, 0.3176471, 1, 1,
0.3219945, -0.7867792, 1.961027, 0, 0.3098039, 1, 1,
0.3228137, -0.7552409, 2.95987, 0, 0.3058824, 1, 1,
0.3287841, 1.067957, 0.3305955, 0, 0.2980392, 1, 1,
0.3309806, -0.7319849, 3.090464, 0, 0.2901961, 1, 1,
0.331489, 0.6660351, -0.6836855, 0, 0.2862745, 1, 1,
0.3372584, 1.673076, 0.3460209, 0, 0.2784314, 1, 1,
0.3376164, -0.05264667, 1.935949, 0, 0.2745098, 1, 1,
0.3382188, -0.6460001, 1.261304, 0, 0.2666667, 1, 1,
0.3403606, -1.52329, 2.801477, 0, 0.2627451, 1, 1,
0.3405634, 1.009011, 0.03894997, 0, 0.254902, 1, 1,
0.34423, 0.9481326, 0.4453253, 0, 0.2509804, 1, 1,
0.344444, -0.4576871, 3.083162, 0, 0.2431373, 1, 1,
0.3450002, 0.8267116, 3.677083, 0, 0.2392157, 1, 1,
0.3476059, 0.477374, 0.8425009, 0, 0.2313726, 1, 1,
0.3478198, 0.7342089, 1.072937, 0, 0.227451, 1, 1,
0.3482209, 1.136775, 0.331863, 0, 0.2196078, 1, 1,
0.3492441, -0.1194814, 1.20894, 0, 0.2156863, 1, 1,
0.3520736, -0.7600253, 1.304639, 0, 0.2078431, 1, 1,
0.3545399, -0.3402468, 0.6103694, 0, 0.2039216, 1, 1,
0.357949, -0.4759882, 1.648632, 0, 0.1960784, 1, 1,
0.357972, 0.4951397, 2.712237, 0, 0.1882353, 1, 1,
0.3604093, -1.367962, 4.200662, 0, 0.1843137, 1, 1,
0.3612711, -1.15354, 3.798451, 0, 0.1764706, 1, 1,
0.3639318, -0.1562949, 0.3629265, 0, 0.172549, 1, 1,
0.3666686, 0.7464296, -0.29035, 0, 0.1647059, 1, 1,
0.3693397, -1.608414, 3.269688, 0, 0.1607843, 1, 1,
0.3756202, -0.8126964, 1.881421, 0, 0.1529412, 1, 1,
0.3779634, 0.1298592, -1.145419, 0, 0.1490196, 1, 1,
0.3792079, 1.541875, -0.9707396, 0, 0.1411765, 1, 1,
0.3835303, -0.3057047, 2.453534, 0, 0.1372549, 1, 1,
0.3866185, -0.7427893, 2.391813, 0, 0.1294118, 1, 1,
0.3866794, -0.3831451, 2.064768, 0, 0.1254902, 1, 1,
0.3874488, -0.5217456, 2.814107, 0, 0.1176471, 1, 1,
0.3888546, 0.9583936, 1.57207, 0, 0.1137255, 1, 1,
0.3906706, -0.6079347, 4.618993, 0, 0.1058824, 1, 1,
0.391062, -0.4291071, 4.048856, 0, 0.09803922, 1, 1,
0.3919179, 1.605804, -0.6074824, 0, 0.09411765, 1, 1,
0.3933346, -0.4263684, 3.463428, 0, 0.08627451, 1, 1,
0.3955482, 0.2947043, 1.122798, 0, 0.08235294, 1, 1,
0.4009307, -1.030129, 2.091627, 0, 0.07450981, 1, 1,
0.4015468, 1.260874, -0.1412513, 0, 0.07058824, 1, 1,
0.4037204, 0.7068509, 2.070843, 0, 0.0627451, 1, 1,
0.4050231, -0.8868186, 1.569957, 0, 0.05882353, 1, 1,
0.4055814, 0.8639156, -1.486862, 0, 0.05098039, 1, 1,
0.407425, 0.1109609, 1.945101, 0, 0.04705882, 1, 1,
0.4075598, -0.3030379, 1.23688, 0, 0.03921569, 1, 1,
0.4118133, -0.6679125, 1.112935, 0, 0.03529412, 1, 1,
0.4136439, -1.308812, 2.810461, 0, 0.02745098, 1, 1,
0.4155483, 0.8118823, 0.4343536, 0, 0.02352941, 1, 1,
0.4181561, -0.9149851, 2.111551, 0, 0.01568628, 1, 1,
0.4196823, -0.3023713, 1.112631, 0, 0.01176471, 1, 1,
0.4201746, 0.7496197, -0.2185924, 0, 0.003921569, 1, 1,
0.4203491, -0.6414644, 3.323578, 0.003921569, 0, 1, 1,
0.4224087, 1.091807, 2.041027, 0.007843138, 0, 1, 1,
0.4224942, -0.6253466, 2.148259, 0.01568628, 0, 1, 1,
0.4254826, -1.084492, 1.052289, 0.01960784, 0, 1, 1,
0.4260233, 1.254804, -0.2683029, 0.02745098, 0, 1, 1,
0.4285955, -0.531146, 2.408486, 0.03137255, 0, 1, 1,
0.4306096, -1.081565, 3.227847, 0.03921569, 0, 1, 1,
0.4310913, 1.201275, 0.6242297, 0.04313726, 0, 1, 1,
0.4447223, 0.2010665, 1.140354, 0.05098039, 0, 1, 1,
0.4458301, -0.1012905, 1.941464, 0.05490196, 0, 1, 1,
0.4488486, -0.09284739, 1.22023, 0.0627451, 0, 1, 1,
0.451159, 0.4695225, -0.7065425, 0.06666667, 0, 1, 1,
0.4518366, -0.6573715, 2.517551, 0.07450981, 0, 1, 1,
0.452796, 2.166084, -0.5941039, 0.07843138, 0, 1, 1,
0.453247, -0.2196885, 1.323511, 0.08627451, 0, 1, 1,
0.4563705, 1.467978, -0.05481707, 0.09019608, 0, 1, 1,
0.4573061, 0.407082, 1.963202, 0.09803922, 0, 1, 1,
0.4581548, -0.5144939, 2.806156, 0.1058824, 0, 1, 1,
0.4634711, -0.2133287, 1.177756, 0.1098039, 0, 1, 1,
0.4657522, 0.3533665, 0.546181, 0.1176471, 0, 1, 1,
0.4692201, 1.379449, 1.085971, 0.1215686, 0, 1, 1,
0.4702894, -0.7465938, 1.814569, 0.1294118, 0, 1, 1,
0.4728949, -0.7748925, 2.447508, 0.1333333, 0, 1, 1,
0.473949, -1.91382, 3.364917, 0.1411765, 0, 1, 1,
0.4750805, -1.794839, 2.023359, 0.145098, 0, 1, 1,
0.4773028, -0.8532302, 0.695309, 0.1529412, 0, 1, 1,
0.4792063, -1.13342, 3.160022, 0.1568628, 0, 1, 1,
0.4819517, -0.6490119, 1.387962, 0.1647059, 0, 1, 1,
0.4833359, 0.8614732, -0.5171485, 0.1686275, 0, 1, 1,
0.4873942, -1.023619, 2.857877, 0.1764706, 0, 1, 1,
0.4884584, 0.001062357, 1.824018, 0.1803922, 0, 1, 1,
0.4903966, -0.01651241, 2.16407, 0.1882353, 0, 1, 1,
0.4979616, -1.309671, 1.635221, 0.1921569, 0, 1, 1,
0.5080771, 0.262254, 2.307721, 0.2, 0, 1, 1,
0.5099106, -0.1502048, 1.471753, 0.2078431, 0, 1, 1,
0.5115654, -0.5660521, 3.264611, 0.2117647, 0, 1, 1,
0.5128526, 1.159483, 1.991173, 0.2196078, 0, 1, 1,
0.5132367, 0.6845656, 0.119929, 0.2235294, 0, 1, 1,
0.5214463, -0.1734391, 1.8263, 0.2313726, 0, 1, 1,
0.5227169, -0.9750369, 4.287537, 0.2352941, 0, 1, 1,
0.5233616, -0.14167, 2.949082, 0.2431373, 0, 1, 1,
0.5240688, 0.6006047, -0.1194501, 0.2470588, 0, 1, 1,
0.5244364, 0.413397, 0.8444948, 0.254902, 0, 1, 1,
0.5283411, 0.04866729, -0.1672772, 0.2588235, 0, 1, 1,
0.5302004, 1.426172, 1.201836, 0.2666667, 0, 1, 1,
0.5316827, 0.4060278, 1.005946, 0.2705882, 0, 1, 1,
0.5353184, 0.858166, 0.995051, 0.2784314, 0, 1, 1,
0.537236, -0.2317102, 1.937969, 0.282353, 0, 1, 1,
0.5384721, -1.302858, 2.917412, 0.2901961, 0, 1, 1,
0.5387653, -0.6843226, 0.5701985, 0.2941177, 0, 1, 1,
0.5488555, -0.2229956, -1.449827, 0.3019608, 0, 1, 1,
0.549207, 0.4675377, 1.431479, 0.3098039, 0, 1, 1,
0.5575331, -0.2089989, 2.814354, 0.3137255, 0, 1, 1,
0.5643199, 1.894857, 2.357527, 0.3215686, 0, 1, 1,
0.5684714, -1.138074, 3.03234, 0.3254902, 0, 1, 1,
0.5713747, 0.2358206, 0.9037458, 0.3333333, 0, 1, 1,
0.5714305, 1.807931, 0.6303091, 0.3372549, 0, 1, 1,
0.5737739, -0.6689356, 2.847144, 0.345098, 0, 1, 1,
0.5764797, -0.9515525, 1.688345, 0.3490196, 0, 1, 1,
0.5810187, 0.6986591, 1.652327, 0.3568628, 0, 1, 1,
0.5952328, -0.6402208, 2.217432, 0.3607843, 0, 1, 1,
0.5958135, -0.7808785, 1.779448, 0.3686275, 0, 1, 1,
0.5963464, 1.193424, 0.5624053, 0.372549, 0, 1, 1,
0.5969335, -0.7528658, 2.724618, 0.3803922, 0, 1, 1,
0.5994251, 0.1696062, 1.080277, 0.3843137, 0, 1, 1,
0.6103966, -1.082798, 1.947987, 0.3921569, 0, 1, 1,
0.6114651, 0.07236964, 1.950364, 0.3960784, 0, 1, 1,
0.6121873, -0.9947942, 1.964607, 0.4039216, 0, 1, 1,
0.6137516, -1.72768, 2.988451, 0.4117647, 0, 1, 1,
0.6137753, 0.6462378, 1.525263, 0.4156863, 0, 1, 1,
0.6240317, -0.9392506, 1.289162, 0.4235294, 0, 1, 1,
0.625294, -0.6662015, 1.445832, 0.427451, 0, 1, 1,
0.6279256, -0.09610952, 2.414325, 0.4352941, 0, 1, 1,
0.6284962, -0.626038, 2.005434, 0.4392157, 0, 1, 1,
0.631095, 0.1614504, 0.5386987, 0.4470588, 0, 1, 1,
0.6313489, -1.084934, 3.83012, 0.4509804, 0, 1, 1,
0.6418734, -0.885978, 2.282658, 0.4588235, 0, 1, 1,
0.6435914, -0.01943815, 0.04414411, 0.4627451, 0, 1, 1,
0.6443393, -0.4944714, 1.481942, 0.4705882, 0, 1, 1,
0.6451339, 1.724367, -0.7489662, 0.4745098, 0, 1, 1,
0.6458015, 0.002105341, 1.100889, 0.4823529, 0, 1, 1,
0.6473472, -1.616008, 1.203758, 0.4862745, 0, 1, 1,
0.6530287, -0.4819651, 2.308276, 0.4941176, 0, 1, 1,
0.6551193, 0.9279122, -1.477508, 0.5019608, 0, 1, 1,
0.6702685, -1.684109, 3.739591, 0.5058824, 0, 1, 1,
0.6835266, 0.8496375, 0.606509, 0.5137255, 0, 1, 1,
0.6855297, 0.3558957, 1.965348, 0.5176471, 0, 1, 1,
0.6857107, 0.5482424, -0.5993621, 0.5254902, 0, 1, 1,
0.6865478, 0.5263376, 1.140704, 0.5294118, 0, 1, 1,
0.6888626, -0.3476234, 2.58705, 0.5372549, 0, 1, 1,
0.6903065, 0.9697492, -0.4840025, 0.5411765, 0, 1, 1,
0.6969367, -2.132252, 3.525294, 0.5490196, 0, 1, 1,
0.7031123, 0.04756759, -0.7525464, 0.5529412, 0, 1, 1,
0.7089717, 0.2461261, 2.516684, 0.5607843, 0, 1, 1,
0.7140826, -1.229198, 2.36504, 0.5647059, 0, 1, 1,
0.7153912, -0.02641193, 2.778567, 0.572549, 0, 1, 1,
0.725125, 0.1404449, 0.08463498, 0.5764706, 0, 1, 1,
0.7291464, -1.007673, 3.434078, 0.5843138, 0, 1, 1,
0.7294825, 0.6146643, 0.3663595, 0.5882353, 0, 1, 1,
0.7308338, 1.604501, -0.285447, 0.5960785, 0, 1, 1,
0.7353951, -0.8111815, 0.5789104, 0.6039216, 0, 1, 1,
0.7385967, 0.5672659, 3.185095, 0.6078432, 0, 1, 1,
0.7474402, 2.52743, -0.07255431, 0.6156863, 0, 1, 1,
0.7475474, 1.236246, 1.567728, 0.6196079, 0, 1, 1,
0.7508667, 0.7951443, 1.056796, 0.627451, 0, 1, 1,
0.7512338, -0.6334327, 2.011421, 0.6313726, 0, 1, 1,
0.7514846, -1.019978, 2.494928, 0.6392157, 0, 1, 1,
0.7555887, 0.5944781, 2.265016, 0.6431373, 0, 1, 1,
0.7609258, -0.1997896, 2.873292, 0.6509804, 0, 1, 1,
0.7637579, 2.479334, 0.8840225, 0.654902, 0, 1, 1,
0.7659903, 0.4045633, 2.110937, 0.6627451, 0, 1, 1,
0.7665215, -0.4080577, 1.877365, 0.6666667, 0, 1, 1,
0.7748855, 0.7752586, 1.095112, 0.6745098, 0, 1, 1,
0.7759102, 0.6600754, 0.6590611, 0.6784314, 0, 1, 1,
0.7771997, -1.724693, 3.503977, 0.6862745, 0, 1, 1,
0.7772068, 0.2552513, 2.351117, 0.6901961, 0, 1, 1,
0.7813207, 0.361644, 0.8412178, 0.6980392, 0, 1, 1,
0.7866743, -0.1480699, 1.494689, 0.7058824, 0, 1, 1,
0.7896242, -0.6213014, 0.4045838, 0.7098039, 0, 1, 1,
0.7909731, 0.4402303, 0.03082958, 0.7176471, 0, 1, 1,
0.7945319, -0.9389083, 3.069368, 0.7215686, 0, 1, 1,
0.7967351, 1.060773, 1.008087, 0.7294118, 0, 1, 1,
0.7987211, -0.6506684, 3.681821, 0.7333333, 0, 1, 1,
0.8076102, 0.6553344, 2.538084, 0.7411765, 0, 1, 1,
0.8109581, -0.4743956, 0.8420998, 0.7450981, 0, 1, 1,
0.8113211, -0.7962162, 3.070577, 0.7529412, 0, 1, 1,
0.8181969, -0.6309195, 1.216453, 0.7568628, 0, 1, 1,
0.8207124, -1.307683, 2.272204, 0.7647059, 0, 1, 1,
0.8220174, -0.7796128, 1.238247, 0.7686275, 0, 1, 1,
0.8231437, 0.2085899, 2.102655, 0.7764706, 0, 1, 1,
0.8245713, -0.2863574, 1.497972, 0.7803922, 0, 1, 1,
0.8308225, -0.9414068, 2.946589, 0.7882353, 0, 1, 1,
0.8315181, 0.6891741, 1.174658, 0.7921569, 0, 1, 1,
0.8349113, -0.442577, 2.553604, 0.8, 0, 1, 1,
0.8359944, 1.688915, -0.02183121, 0.8078431, 0, 1, 1,
0.8440416, 1.198628, 0.2206474, 0.8117647, 0, 1, 1,
0.8483515, -0.17905, 2.751078, 0.8196079, 0, 1, 1,
0.8497397, 2.662293, -1.787688, 0.8235294, 0, 1, 1,
0.855608, -0.2011812, 3.232805, 0.8313726, 0, 1, 1,
0.8597454, 0.7753885, 1.688148, 0.8352941, 0, 1, 1,
0.8597702, 0.9181387, 1.858553, 0.8431373, 0, 1, 1,
0.8616515, 0.2693494, 2.309417, 0.8470588, 0, 1, 1,
0.8665401, 0.1859949, 2.538568, 0.854902, 0, 1, 1,
0.8697096, -0.09972589, 0.3150721, 0.8588235, 0, 1, 1,
0.882581, -0.6900737, 1.332399, 0.8666667, 0, 1, 1,
0.8863249, 0.4174016, 0.1445315, 0.8705882, 0, 1, 1,
0.8882768, -0.7570056, 2.721727, 0.8784314, 0, 1, 1,
0.9025444, -0.6895382, 2.781262, 0.8823529, 0, 1, 1,
0.905311, -0.04071983, 1.862197, 0.8901961, 0, 1, 1,
0.9130164, -0.72186, 2.329988, 0.8941177, 0, 1, 1,
0.9162452, 0.6187677, 1.212946, 0.9019608, 0, 1, 1,
0.9215722, 0.8915834, 2.904232, 0.9098039, 0, 1, 1,
0.9245074, 2.443689, 0.4464709, 0.9137255, 0, 1, 1,
0.9257947, -0.906276, 1.482491, 0.9215686, 0, 1, 1,
0.9323645, 1.242624, 1.032164, 0.9254902, 0, 1, 1,
0.9329501, 0.439859, 0.5060481, 0.9333333, 0, 1, 1,
0.9342419, 0.807106, 0.4090941, 0.9372549, 0, 1, 1,
0.9375002, 0.4229308, 1.133579, 0.945098, 0, 1, 1,
0.9390911, 0.4357653, 1.880688, 0.9490196, 0, 1, 1,
0.9433004, 0.4098493, 1.275126, 0.9568627, 0, 1, 1,
0.9585013, -2.225272, 3.442415, 0.9607843, 0, 1, 1,
0.9601865, 0.4005795, 0.9489906, 0.9686275, 0, 1, 1,
0.9627445, 0.7448159, 0.2894677, 0.972549, 0, 1, 1,
0.9690987, -1.299907, 3.853848, 0.9803922, 0, 1, 1,
0.9716046, -0.615387, 0.7725889, 0.9843137, 0, 1, 1,
0.9742431, 0.1346863, 0.0899474, 0.9921569, 0, 1, 1,
0.97482, 0.6770039, 2.169476, 0.9960784, 0, 1, 1,
0.9749991, 1.639086, 1.064954, 1, 0, 0.9960784, 1,
0.9816769, -0.3914118, 1.706616, 1, 0, 0.9882353, 1,
0.9826557, -1.192784, 2.710408, 1, 0, 0.9843137, 1,
0.9889565, 0.1168143, 1.903297, 1, 0, 0.9764706, 1,
1.008254, 1.869709, 1.66959, 1, 0, 0.972549, 1,
1.010781, 0.238593, 2.788907, 1, 0, 0.9647059, 1,
1.016081, 0.3776525, 0.6017273, 1, 0, 0.9607843, 1,
1.030883, 0.3055468, 2.058034, 1, 0, 0.9529412, 1,
1.037873, 1.496704, -0.3970132, 1, 0, 0.9490196, 1,
1.048576, 0.3394597, 1.246123, 1, 0, 0.9411765, 1,
1.054029, -0.9730688, 1.744559, 1, 0, 0.9372549, 1,
1.055354, 0.5061646, 2.646336, 1, 0, 0.9294118, 1,
1.056819, -0.4749582, 2.062608, 1, 0, 0.9254902, 1,
1.059041, 2.322178, 1.28694, 1, 0, 0.9176471, 1,
1.060959, -1.358324, 0.6587273, 1, 0, 0.9137255, 1,
1.063073, -0.8421812, 2.178516, 1, 0, 0.9058824, 1,
1.063837, -1.136388, 2.345772, 1, 0, 0.9019608, 1,
1.064928, 0.9727921, 0.5767137, 1, 0, 0.8941177, 1,
1.065235, -0.9594591, 2.26728, 1, 0, 0.8862745, 1,
1.080914, -1.677839, 1.562671, 1, 0, 0.8823529, 1,
1.094011, 0.5923271, 2.29106, 1, 0, 0.8745098, 1,
1.094486, 0.817475, 0.8130013, 1, 0, 0.8705882, 1,
1.097679, -0.5767608, 3.386007, 1, 0, 0.8627451, 1,
1.097838, -0.9094351, 3.204793, 1, 0, 0.8588235, 1,
1.098334, 0.5761843, 0.3266513, 1, 0, 0.8509804, 1,
1.099284, -0.05778991, 2.662252, 1, 0, 0.8470588, 1,
1.101575, 0.6098775, 0.01171494, 1, 0, 0.8392157, 1,
1.102669, 0.3499715, 1.255406, 1, 0, 0.8352941, 1,
1.113229, 1.188741, -0.06233637, 1, 0, 0.827451, 1,
1.117249, -0.1583473, -0.05292282, 1, 0, 0.8235294, 1,
1.120055, 0.767372, -0.8296053, 1, 0, 0.8156863, 1,
1.120268, -1.494919, 1.770035, 1, 0, 0.8117647, 1,
1.123865, 1.19546, -0.905562, 1, 0, 0.8039216, 1,
1.12573, -0.5431452, 0.7749933, 1, 0, 0.7960784, 1,
1.13399, -0.4683501, 2.552468, 1, 0, 0.7921569, 1,
1.142119, -1.975059, 3.716611, 1, 0, 0.7843137, 1,
1.145624, 1.523956, 0.2730443, 1, 0, 0.7803922, 1,
1.149519, -1.032836, 2.296869, 1, 0, 0.772549, 1,
1.151606, 0.1047173, 4.433374, 1, 0, 0.7686275, 1,
1.162385, 1.956144, -0.02138964, 1, 0, 0.7607843, 1,
1.169543, 1.350113, 1.458637, 1, 0, 0.7568628, 1,
1.171172, -0.6128026, 2.221325, 1, 0, 0.7490196, 1,
1.173669, 0.3859045, -1.035612, 1, 0, 0.7450981, 1,
1.177788, -0.7212138, 1.17188, 1, 0, 0.7372549, 1,
1.187801, 0.2286018, -1.200517, 1, 0, 0.7333333, 1,
1.188046, -0.8038734, 2.694124, 1, 0, 0.7254902, 1,
1.193084, -1.511439, 3.107785, 1, 0, 0.7215686, 1,
1.19926, -1.861312, 4.212408, 1, 0, 0.7137255, 1,
1.200811, -0.8517593, 1.731439, 1, 0, 0.7098039, 1,
1.201556, 0.6969606, 1.969833, 1, 0, 0.7019608, 1,
1.204209, 1.300055, 0.8194514, 1, 0, 0.6941177, 1,
1.20479, -0.7180334, 1.00505, 1, 0, 0.6901961, 1,
1.208768, 0.3076411, 1.325826, 1, 0, 0.682353, 1,
1.211954, -1.085151, 3.249586, 1, 0, 0.6784314, 1,
1.216179, 0.2000502, 4.160378, 1, 0, 0.6705883, 1,
1.216743, -0.5090696, 1.490742, 1, 0, 0.6666667, 1,
1.217217, 0.2179579, 1.277099, 1, 0, 0.6588235, 1,
1.228311, -0.15604, 1.134418, 1, 0, 0.654902, 1,
1.229588, 0.1460102, -0.8027825, 1, 0, 0.6470588, 1,
1.242936, -1.798119, 0.8666046, 1, 0, 0.6431373, 1,
1.250973, -0.5682131, 3.078043, 1, 0, 0.6352941, 1,
1.269023, -1.049636, 0.8937045, 1, 0, 0.6313726, 1,
1.27307, -1.5482, 1.56967, 1, 0, 0.6235294, 1,
1.27672, -0.7541943, 2.109302, 1, 0, 0.6196079, 1,
1.279822, -1.974568, -0.1385275, 1, 0, 0.6117647, 1,
1.281768, -1.158926, 1.198725, 1, 0, 0.6078432, 1,
1.293687, 2.053837, 0.2806536, 1, 0, 0.6, 1,
1.300902, -0.7172484, 1.427113, 1, 0, 0.5921569, 1,
1.315481, 0.5294871, 1.219437, 1, 0, 0.5882353, 1,
1.316306, -0.3727178, 2.766863, 1, 0, 0.5803922, 1,
1.319511, 0.6517088, 0.5191247, 1, 0, 0.5764706, 1,
1.319979, 0.4224524, 1.885496, 1, 0, 0.5686275, 1,
1.320821, 1.176365, 1.550517, 1, 0, 0.5647059, 1,
1.321249, -0.4665641, 2.746219, 1, 0, 0.5568628, 1,
1.323933, -0.2747373, 1.4162, 1, 0, 0.5529412, 1,
1.34655, 0.726396, 3.318908, 1, 0, 0.5450981, 1,
1.350059, 0.6837416, 1.611914, 1, 0, 0.5411765, 1,
1.382709, 0.0711202, 0.4231822, 1, 0, 0.5333334, 1,
1.394303, -0.9175295, 1.403017, 1, 0, 0.5294118, 1,
1.402081, -0.5032166, 2.358248, 1, 0, 0.5215687, 1,
1.405229, -0.9656394, 3.723512, 1, 0, 0.5176471, 1,
1.411521, -1.199271, 2.115666, 1, 0, 0.509804, 1,
1.41384, 0.4584281, 1.403308, 1, 0, 0.5058824, 1,
1.416756, 0.2234535, 1.092985, 1, 0, 0.4980392, 1,
1.417824, 1.075265, 1.199951, 1, 0, 0.4901961, 1,
1.422754, -0.818069, 4.882727, 1, 0, 0.4862745, 1,
1.422756, 1.025692, 0.7727082, 1, 0, 0.4784314, 1,
1.42317, 0.9646475, 1.006339, 1, 0, 0.4745098, 1,
1.424631, 0.1394898, -0.0776842, 1, 0, 0.4666667, 1,
1.430953, -3.226336, 2.827843, 1, 0, 0.4627451, 1,
1.445058, 0.8380002, 0.9863199, 1, 0, 0.454902, 1,
1.452255, 0.100748, 2.117609, 1, 0, 0.4509804, 1,
1.456364, 0.4042661, 0.9435601, 1, 0, 0.4431373, 1,
1.463094, -1.64538, 1.098204, 1, 0, 0.4392157, 1,
1.472008, -0.1354804, 0.9778285, 1, 0, 0.4313726, 1,
1.490952, -0.7736884, 2.796521, 1, 0, 0.427451, 1,
1.507306, 0.7017615, 0.6921957, 1, 0, 0.4196078, 1,
1.521093, 0.005554096, 2.313782, 1, 0, 0.4156863, 1,
1.528227, 1.343656, 2.043097, 1, 0, 0.4078431, 1,
1.528887, 0.1839507, 0.9824529, 1, 0, 0.4039216, 1,
1.531755, 1.954297, -0.2057147, 1, 0, 0.3960784, 1,
1.542908, 0.1573738, 1.564202, 1, 0, 0.3882353, 1,
1.544962, 0.8047717, 1.962185, 1, 0, 0.3843137, 1,
1.56049, 1.080165, -0.1916242, 1, 0, 0.3764706, 1,
1.589779, 1.446626, 1.359939, 1, 0, 0.372549, 1,
1.59632, -0.708777, 0.9398942, 1, 0, 0.3647059, 1,
1.596849, -0.1636163, 2.102496, 1, 0, 0.3607843, 1,
1.603346, 1.195683, 1.035137, 1, 0, 0.3529412, 1,
1.60983, -0.8862508, 3.265811, 1, 0, 0.3490196, 1,
1.616384, -1.2834, 1.963055, 1, 0, 0.3411765, 1,
1.624359, -1.53704, 1.069446, 1, 0, 0.3372549, 1,
1.636422, -0.422796, 2.48634, 1, 0, 0.3294118, 1,
1.68195, 0.8211917, 3.479513, 1, 0, 0.3254902, 1,
1.687383, -0.5606591, 0.6571429, 1, 0, 0.3176471, 1,
1.696405, -0.8609765, 4.808648, 1, 0, 0.3137255, 1,
1.698487, 1.093266, -0.336223, 1, 0, 0.3058824, 1,
1.710308, 0.3034279, 2.921956, 1, 0, 0.2980392, 1,
1.710801, 0.5408778, 1.950036, 1, 0, 0.2941177, 1,
1.753086, -1.061067, 2.370153, 1, 0, 0.2862745, 1,
1.756993, -0.2786135, 2.233613, 1, 0, 0.282353, 1,
1.764272, -0.8070959, 1.367431, 1, 0, 0.2745098, 1,
1.769898, -0.06592069, 1.840904, 1, 0, 0.2705882, 1,
1.771461, 0.1129242, 2.274508, 1, 0, 0.2627451, 1,
1.802316, 0.8341714, 1.033695, 1, 0, 0.2588235, 1,
1.804252, 0.1555429, 2.344954, 1, 0, 0.2509804, 1,
1.830395, 1.789852, -1.358687, 1, 0, 0.2470588, 1,
1.832861, -0.6408073, 1.272216, 1, 0, 0.2392157, 1,
1.834792, -0.3712534, 1.564625, 1, 0, 0.2352941, 1,
1.835255, 0.9239443, 0.7575557, 1, 0, 0.227451, 1,
1.878642, 1.912612, 1.100244, 1, 0, 0.2235294, 1,
1.879041, -1.50025, 1.889688, 1, 0, 0.2156863, 1,
1.880378, -2.871155, 2.996317, 1, 0, 0.2117647, 1,
1.88058, 1.490034, 1.407819, 1, 0, 0.2039216, 1,
1.882368, -0.4642013, -0.4086798, 1, 0, 0.1960784, 1,
1.894959, -1.21959, 1.536985, 1, 0, 0.1921569, 1,
1.897352, 0.7422484, 2.029298, 1, 0, 0.1843137, 1,
1.924671, 0.8382626, 1.023989, 1, 0, 0.1803922, 1,
1.926866, -0.0766541, -0.03676809, 1, 0, 0.172549, 1,
1.981349, -0.5023721, 1.702822, 1, 0, 0.1686275, 1,
1.99505, -1.396473, 3.17521, 1, 0, 0.1607843, 1,
2.006456, 0.8915996, 2.620905, 1, 0, 0.1568628, 1,
2.046303, -0.3164482, 0.3560761, 1, 0, 0.1490196, 1,
2.049026, 1.222502, 1.228111, 1, 0, 0.145098, 1,
2.059767, -0.3539152, 1.625868, 1, 0, 0.1372549, 1,
2.065351, -1.169886, -0.3520239, 1, 0, 0.1333333, 1,
2.073294, -0.6658634, 3.184785, 1, 0, 0.1254902, 1,
2.09881, 0.8837572, 1.150586, 1, 0, 0.1215686, 1,
2.118568, -1.631557, 3.737827, 1, 0, 0.1137255, 1,
2.128226, 0.3756807, 2.117819, 1, 0, 0.1098039, 1,
2.13702, 0.2322667, 0.8493446, 1, 0, 0.1019608, 1,
2.242114, -0.395883, 1.734385, 1, 0, 0.09411765, 1,
2.267696, 0.6559472, 0.6405308, 1, 0, 0.09019608, 1,
2.275717, 0.5404999, 2.136563, 1, 0, 0.08235294, 1,
2.30267, 0.333157, 0.6409784, 1, 0, 0.07843138, 1,
2.338969, 0.818094, 0.5940237, 1, 0, 0.07058824, 1,
2.381641, 0.1374453, 1.286334, 1, 0, 0.06666667, 1,
2.382842, -1.556763, 1.30221, 1, 0, 0.05882353, 1,
2.417526, -2.497111, 3.228338, 1, 0, 0.05490196, 1,
2.531535, 2.146883, 1.39033, 1, 0, 0.04705882, 1,
2.569259, 0.6507725, 3.023853, 1, 0, 0.04313726, 1,
2.705409, 0.2063167, 2.996136, 1, 0, 0.03529412, 1,
2.722551, -0.591575, 1.825555, 1, 0, 0.03137255, 1,
2.735383, -0.6957304, 0.5569584, 1, 0, 0.02352941, 1,
2.822017, 0.308087, 1.109169, 1, 0, 0.01960784, 1,
2.850286, 1.649523, 0.6691712, 1, 0, 0.01176471, 1,
2.897967, -2.151737, 4.015388, 1, 0, 0.007843138, 1
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
-0.08781481, -4.295008, -8.020511, 0, -0.5, 0.5, 0.5,
-0.08781481, -4.295008, -8.020511, 1, -0.5, 0.5, 0.5,
-0.08781481, -4.295008, -8.020511, 1, 1.5, 0.5, 0.5,
-0.08781481, -4.295008, -8.020511, 0, 1.5, 0.5, 0.5
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
-4.085776, -0.07391083, -8.020511, 0, -0.5, 0.5, 0.5,
-4.085776, -0.07391083, -8.020511, 1, -0.5, 0.5, 0.5,
-4.085776, -0.07391083, -8.020511, 1, 1.5, 0.5, 0.5,
-4.085776, -0.07391083, -8.020511, 0, 1.5, 0.5, 0.5
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
-4.085776, -4.295008, -0.6098073, 0, -0.5, 0.5, 0.5,
-4.085776, -4.295008, -0.6098073, 1, -0.5, 0.5, 0.5,
-4.085776, -4.295008, -0.6098073, 1, 1.5, 0.5, 0.5,
-4.085776, -4.295008, -0.6098073, 0, 1.5, 0.5, 0.5
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
-3, -3.320909, -6.310349,
2, -3.320909, -6.310349,
-3, -3.320909, -6.310349,
-3, -3.483259, -6.595376,
-2, -3.320909, -6.310349,
-2, -3.483259, -6.595376,
-1, -3.320909, -6.310349,
-1, -3.483259, -6.595376,
0, -3.320909, -6.310349,
0, -3.483259, -6.595376,
1, -3.320909, -6.310349,
1, -3.483259, -6.595376,
2, -3.320909, -6.310349,
2, -3.483259, -6.595376
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
-3, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
-3, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
-3, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
-3, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5,
-2, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
-2, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
-2, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
-2, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5,
-1, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
-1, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
-1, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
-1, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5,
0, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
0, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
0, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
0, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5,
1, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
1, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
1, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
1, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5,
2, -3.807958, -7.16543, 0, -0.5, 0.5, 0.5,
2, -3.807958, -7.16543, 1, -0.5, 0.5, 0.5,
2, -3.807958, -7.16543, 1, 1.5, 0.5, 0.5,
2, -3.807958, -7.16543, 0, 1.5, 0.5, 0.5
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
-3.16317, -3, -6.310349,
-3.16317, 3, -6.310349,
-3.16317, -3, -6.310349,
-3.316937, -3, -6.595376,
-3.16317, -2, -6.310349,
-3.316937, -2, -6.595376,
-3.16317, -1, -6.310349,
-3.316937, -1, -6.595376,
-3.16317, 0, -6.310349,
-3.316937, 0, -6.595376,
-3.16317, 1, -6.310349,
-3.316937, 1, -6.595376,
-3.16317, 2, -6.310349,
-3.316937, 2, -6.595376,
-3.16317, 3, -6.310349,
-3.316937, 3, -6.595376
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
-3.624473, -3, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, -3, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, -3, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, -3, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, -2, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, -2, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, -2, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, -2, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, -1, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, -1, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, -1, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, -1, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, 0, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, 0, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, 0, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, 0, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, 1, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, 1, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, 1, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, 1, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, 2, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, 2, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, 2, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, 2, -7.16543, 0, 1.5, 0.5, 0.5,
-3.624473, 3, -7.16543, 0, -0.5, 0.5, 0.5,
-3.624473, 3, -7.16543, 1, -0.5, 0.5, 0.5,
-3.624473, 3, -7.16543, 1, 1.5, 0.5, 0.5,
-3.624473, 3, -7.16543, 0, 1.5, 0.5, 0.5
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
-3.16317, -3.320909, -6,
-3.16317, -3.320909, 4,
-3.16317, -3.320909, -6,
-3.316937, -3.483259, -6,
-3.16317, -3.320909, -4,
-3.316937, -3.483259, -4,
-3.16317, -3.320909, -2,
-3.316937, -3.483259, -2,
-3.16317, -3.320909, 0,
-3.316937, -3.483259, 0,
-3.16317, -3.320909, 2,
-3.316937, -3.483259, 2,
-3.16317, -3.320909, 4,
-3.316937, -3.483259, 4
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
-3.624473, -3.807958, -6, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -6, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -6, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, -6, 0, 1.5, 0.5, 0.5,
-3.624473, -3.807958, -4, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -4, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -4, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, -4, 0, 1.5, 0.5, 0.5,
-3.624473, -3.807958, -2, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -2, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, -2, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, -2, 0, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 0, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 0, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 0, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 0, 0, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 2, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 2, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 2, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 2, 0, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 4, 0, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 4, 1, -0.5, 0.5, 0.5,
-3.624473, -3.807958, 4, 1, 1.5, 0.5, 0.5,
-3.624473, -3.807958, 4, 0, 1.5, 0.5, 0.5
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
-3.16317, -3.320909, -6.310349,
-3.16317, 3.173087, -6.310349,
-3.16317, -3.320909, 5.090734,
-3.16317, 3.173087, 5.090734,
-3.16317, -3.320909, -6.310349,
-3.16317, -3.320909, 5.090734,
-3.16317, 3.173087, -6.310349,
-3.16317, 3.173087, 5.090734,
-3.16317, -3.320909, -6.310349,
2.98754, -3.320909, -6.310349,
-3.16317, -3.320909, 5.090734,
2.98754, -3.320909, 5.090734,
-3.16317, 3.173087, -6.310349,
2.98754, 3.173087, -6.310349,
-3.16317, 3.173087, 5.090734,
2.98754, 3.173087, 5.090734,
2.98754, -3.320909, -6.310349,
2.98754, 3.173087, -6.310349,
2.98754, -3.320909, 5.090734,
2.98754, 3.173087, 5.090734,
2.98754, -3.320909, -6.310349,
2.98754, -3.320909, 5.090734,
2.98754, 3.173087, -6.310349,
2.98754, 3.173087, 5.090734
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
var radius = 7.737891;
var distance = 34.42675;
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
mvMatrix.translate( 0.08781481, 0.07391083, 0.6098073 );
mvMatrix.scale( 1.360227, 1.288322, 0.7338215 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.42675);
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
buthiobate<-read.table("buthiobate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-buthiobate$V2
```

```
## Error in eval(expr, envir, enclos): object 'buthiobate' not found
```

```r
y<-buthiobate$V3
```

```
## Error in eval(expr, envir, enclos): object 'buthiobate' not found
```

```r
z<-buthiobate$V4
```

```
## Error in eval(expr, envir, enclos): object 'buthiobate' not found
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
-3.073596, 0.4925335, -1.708186, 0, 0, 1, 1, 1,
-2.763655, -0.1279354, -0.4754194, 1, 0, 0, 1, 1,
-2.649814, 0.2073519, -0.8064057, 1, 0, 0, 1, 1,
-2.567041, 1.470005, 0.1362807, 1, 0, 0, 1, 1,
-2.501752, -1.1567, -1.741021, 1, 0, 0, 1, 1,
-2.309248, 1.26461, -1.526585, 1, 0, 0, 1, 1,
-2.306818, 2.605781, -0.6146009, 0, 0, 0, 1, 1,
-2.273329, 1.185085, -1.310577, 0, 0, 0, 1, 1,
-2.260917, 0.5169486, -1.375829, 0, 0, 0, 1, 1,
-2.254853, 0.8276461, -0.2520137, 0, 0, 0, 1, 1,
-2.204668, 0.366027, -0.4855821, 0, 0, 0, 1, 1,
-2.201842, -0.548672, -2.622127, 0, 0, 0, 1, 1,
-2.166391, -1.613067, -2.431009, 0, 0, 0, 1, 1,
-2.091707, 0.0776766, -1.859716, 1, 1, 1, 1, 1,
-2.072331, 0.4885912, -1.622507, 1, 1, 1, 1, 1,
-2.058552, 0.7755482, -2.36374, 1, 1, 1, 1, 1,
-2.057142, 1.993875, 0.4506899, 1, 1, 1, 1, 1,
-2.051729, -0.2522084, -1.452823, 1, 1, 1, 1, 1,
-2.050901, -1.167848, -2.140481, 1, 1, 1, 1, 1,
-2.046305, -0.02095816, -2.209244, 1, 1, 1, 1, 1,
-2.037848, -0.2753848, 0.009563626, 1, 1, 1, 1, 1,
-2.020248, 0.5378553, -1.07199, 1, 1, 1, 1, 1,
-1.987662, 0.6178398, -1.459591, 1, 1, 1, 1, 1,
-1.974002, -1.846692, -2.196451, 1, 1, 1, 1, 1,
-1.951709, 1.564889, 2.189369, 1, 1, 1, 1, 1,
-1.923993, -1.399745, -1.442417, 1, 1, 1, 1, 1,
-1.919614, -0.2066863, -2.005569, 1, 1, 1, 1, 1,
-1.911736, -2.227695, 0.4484795, 1, 1, 1, 1, 1,
-1.90971, -0.4860638, -1.692972, 0, 0, 1, 1, 1,
-1.889135, -1.04482, -2.536079, 1, 0, 0, 1, 1,
-1.863279, 0.9311133, -2.192127, 1, 0, 0, 1, 1,
-1.857657, 0.5470663, -2.511631, 1, 0, 0, 1, 1,
-1.857211, -0.4790777, -0.8544019, 1, 0, 0, 1, 1,
-1.855146, -1.562407, -2.438775, 1, 0, 0, 1, 1,
-1.851485, -1.382296, -3.119089, 0, 0, 0, 1, 1,
-1.843229, -0.5926085, -1.73005, 0, 0, 0, 1, 1,
-1.819773, 0.8000413, 0.1992295, 0, 0, 0, 1, 1,
-1.805965, -1.359454, -1.13533, 0, 0, 0, 1, 1,
-1.805523, -0.1400913, -1.261928, 0, 0, 0, 1, 1,
-1.794991, 0.6469799, -1.111987, 0, 0, 0, 1, 1,
-1.748996, -0.4434889, -1.731894, 0, 0, 0, 1, 1,
-1.740711, 0.8180668, -1.495463, 1, 1, 1, 1, 1,
-1.729882, 0.3495888, -1.398507, 1, 1, 1, 1, 1,
-1.723778, -0.1260656, -3.767656, 1, 1, 1, 1, 1,
-1.705302, -0.4288071, -2.900096, 1, 1, 1, 1, 1,
-1.700826, -1.514663, -2.20928, 1, 1, 1, 1, 1,
-1.698602, 0.5039173, -2.533996, 1, 1, 1, 1, 1,
-1.695118, 1.100885, -0.4632527, 1, 1, 1, 1, 1,
-1.694369, -0.6196678, -2.81251, 1, 1, 1, 1, 1,
-1.681104, -0.56547, -1.981481, 1, 1, 1, 1, 1,
-1.67672, 0.7596336, -0.09818815, 1, 1, 1, 1, 1,
-1.672924, 0.5716645, -2.508024, 1, 1, 1, 1, 1,
-1.666198, 0.8753654, -1.514422, 1, 1, 1, 1, 1,
-1.664987, -1.170914, -3.92695, 1, 1, 1, 1, 1,
-1.661924, -1.302358, -2.098505, 1, 1, 1, 1, 1,
-1.657918, -1.063184, -0.6280198, 1, 1, 1, 1, 1,
-1.632455, -1.053099, -2.909606, 0, 0, 1, 1, 1,
-1.604553, -0.2734016, -1.515708, 1, 0, 0, 1, 1,
-1.603632, -0.571211, -1.719639, 1, 0, 0, 1, 1,
-1.595834, -0.03798699, -1.810776, 1, 0, 0, 1, 1,
-1.589954, -0.001155906, -0.8404706, 1, 0, 0, 1, 1,
-1.577871, 1.950254, -1.472699, 1, 0, 0, 1, 1,
-1.572969, -0.04054278, -3.245358, 0, 0, 0, 1, 1,
-1.571417, 2.719937, 1.030279, 0, 0, 0, 1, 1,
-1.543618, 0.09407304, -1.799315, 0, 0, 0, 1, 1,
-1.535757, -0.1054739, -0.3481098, 0, 0, 0, 1, 1,
-1.512347, 2.095958, 0.1780897, 0, 0, 0, 1, 1,
-1.508682, -0.2575486, -0.8067211, 0, 0, 0, 1, 1,
-1.507481, 1.152018, -2.558062, 0, 0, 0, 1, 1,
-1.506911, 0.3209514, -1.513457, 1, 1, 1, 1, 1,
-1.504556, -1.19435, -3.173144, 1, 1, 1, 1, 1,
-1.501127, 1.342177, -2.256064, 1, 1, 1, 1, 1,
-1.50018, -0.2310363, -0.5527587, 1, 1, 1, 1, 1,
-1.496776, 1.997242, 0.1181122, 1, 1, 1, 1, 1,
-1.48981, -1.285806, -1.787643, 1, 1, 1, 1, 1,
-1.482512, -0.6912721, -1.976108, 1, 1, 1, 1, 1,
-1.460929, 1.186886, -1.370769, 1, 1, 1, 1, 1,
-1.454092, 0.6292539, 0.3356701, 1, 1, 1, 1, 1,
-1.44695, -0.5905035, 0.1066266, 1, 1, 1, 1, 1,
-1.443864, -0.7084885, -1.08185, 1, 1, 1, 1, 1,
-1.422473, -0.09878897, -2.618224, 1, 1, 1, 1, 1,
-1.420669, -1.906627, -2.672059, 1, 1, 1, 1, 1,
-1.418482, 1.73077, -1.110424, 1, 1, 1, 1, 1,
-1.415674, -0.9697813, -2.60385, 1, 1, 1, 1, 1,
-1.415099, -0.9427133, -2.36635, 0, 0, 1, 1, 1,
-1.408174, 0.1235006, -2.820223, 1, 0, 0, 1, 1,
-1.400751, 0.263505, 0.4509115, 1, 0, 0, 1, 1,
-1.397531, -0.942504, -1.54204, 1, 0, 0, 1, 1,
-1.392523, -1.613326, -2.221721, 1, 0, 0, 1, 1,
-1.381809, 1.195772, -0.09191597, 1, 0, 0, 1, 1,
-1.372248, -0.01917858, -5.160367, 0, 0, 0, 1, 1,
-1.370853, 0.008146099, -1.517011, 0, 0, 0, 1, 1,
-1.370087, 0.4618354, -1.01678, 0, 0, 0, 1, 1,
-1.368263, 0.2545782, -0.8771648, 0, 0, 0, 1, 1,
-1.367675, -0.9456774, -1.608508, 0, 0, 0, 1, 1,
-1.363762, 1.118342, 0.2705748, 0, 0, 0, 1, 1,
-1.361425, -1.518375, -2.006721, 0, 0, 0, 1, 1,
-1.359279, 2.357104, -2.839664, 1, 1, 1, 1, 1,
-1.358764, 0.8952415, 0.2459494, 1, 1, 1, 1, 1,
-1.358687, 1.269804, -1.00896, 1, 1, 1, 1, 1,
-1.358426, 0.6549673, -1.856857, 1, 1, 1, 1, 1,
-1.356939, 0.9250451, 0.05946872, 1, 1, 1, 1, 1,
-1.35456, -1.195442, -2.660548, 1, 1, 1, 1, 1,
-1.350165, -0.2583885, -0.3228212, 1, 1, 1, 1, 1,
-1.342739, 0.703499, -1.980593, 1, 1, 1, 1, 1,
-1.342626, 0.1751993, -0.7067296, 1, 1, 1, 1, 1,
-1.333684, -0.2099903, -2.62788, 1, 1, 1, 1, 1,
-1.332262, 0.3504473, -0.7173513, 1, 1, 1, 1, 1,
-1.30772, 0.09682988, -1.568091, 1, 1, 1, 1, 1,
-1.305605, 0.9861451, -0.8319706, 1, 1, 1, 1, 1,
-1.300161, 0.07807408, -2.001069, 1, 1, 1, 1, 1,
-1.29919, -0.255141, -1.746508, 1, 1, 1, 1, 1,
-1.294854, -1.942864, -2.310193, 0, 0, 1, 1, 1,
-1.291803, 1.356583, -2.67162, 1, 0, 0, 1, 1,
-1.289495, 1.00797, -0.7549829, 1, 0, 0, 1, 1,
-1.277055, 0.463351, -1.420212, 1, 0, 0, 1, 1,
-1.274743, 0.4395696, -1.484528, 1, 0, 0, 1, 1,
-1.27345, 2.371074, 0.2455855, 1, 0, 0, 1, 1,
-1.26342, -1.255914, -3.29341, 0, 0, 0, 1, 1,
-1.262713, 0.1802572, -0.9164475, 0, 0, 0, 1, 1,
-1.255015, -0.01129881, -0.1504275, 0, 0, 0, 1, 1,
-1.254064, -1.778352, -4.538701, 0, 0, 0, 1, 1,
-1.248697, 0.1716003, -2.162452, 0, 0, 0, 1, 1,
-1.23954, 0.2292551, -2.001294, 0, 0, 0, 1, 1,
-1.232596, -1.890638, -2.435112, 0, 0, 0, 1, 1,
-1.227809, 2.248072, -1.631109, 1, 1, 1, 1, 1,
-1.227754, 1.040155, -0.3341898, 1, 1, 1, 1, 1,
-1.22478, -0.01632806, -1.145401, 1, 1, 1, 1, 1,
-1.224506, -0.9755355, -2.952728, 1, 1, 1, 1, 1,
-1.219608, 0.6748909, 0.5242928, 1, 1, 1, 1, 1,
-1.218109, -0.8470935, -0.9471002, 1, 1, 1, 1, 1,
-1.217294, -0.2633434, -0.800066, 1, 1, 1, 1, 1,
-1.180072, 1.132724, -1.586455, 1, 1, 1, 1, 1,
-1.176301, 0.2730838, -3.125432, 1, 1, 1, 1, 1,
-1.167587, 0.5054581, -2.109867, 1, 1, 1, 1, 1,
-1.158917, 0.4353958, -1.575984, 1, 1, 1, 1, 1,
-1.156777, 0.962528, -0.5552562, 1, 1, 1, 1, 1,
-1.148975, -1.214747, -1.488499, 1, 1, 1, 1, 1,
-1.140692, -0.156351, -2.39044, 1, 1, 1, 1, 1,
-1.134087, 0.7669304, -2.792144, 1, 1, 1, 1, 1,
-1.133414, 0.5023646, -2.122158, 0, 0, 1, 1, 1,
-1.127072, 0.110098, -2.002824, 1, 0, 0, 1, 1,
-1.124801, -0.9275347, -2.904199, 1, 0, 0, 1, 1,
-1.11074, 0.4325353, -1.798111, 1, 0, 0, 1, 1,
-1.106127, -0.4017923, 0.06488314, 1, 0, 0, 1, 1,
-1.105563, 0.8891267, -0.6714626, 1, 0, 0, 1, 1,
-1.088954, -0.2224916, -2.259481, 0, 0, 0, 1, 1,
-1.087396, -1.728609, -2.115906, 0, 0, 0, 1, 1,
-1.080725, -0.274912, -2.160538, 0, 0, 0, 1, 1,
-1.076229, -1.162589, -2.254452, 0, 0, 0, 1, 1,
-1.073489, 0.7051604, -2.757523, 0, 0, 0, 1, 1,
-1.057872, 0.7896819, -1.208132, 0, 0, 0, 1, 1,
-1.050467, 0.01613653, 0.1894399, 0, 0, 0, 1, 1,
-1.041366, 0.6604773, -1.849529, 1, 1, 1, 1, 1,
-1.040672, 1.025252, -0.4157266, 1, 1, 1, 1, 1,
-1.034264, -0.3122206, -4.07088, 1, 1, 1, 1, 1,
-1.0338, -1.127738, -3.105269, 1, 1, 1, 1, 1,
-1.032951, 0.6058446, -2.884737, 1, 1, 1, 1, 1,
-1.029648, 0.1710786, -1.699484, 1, 1, 1, 1, 1,
-1.015323, 1.90897, -0.1373112, 1, 1, 1, 1, 1,
-1.015153, -0.1656561, -2.306551, 1, 1, 1, 1, 1,
-1.01451, 0.6020079, -3.050746, 1, 1, 1, 1, 1,
-1.012375, 0.5970852, 1.100589, 1, 1, 1, 1, 1,
-1.01206, -0.2305366, -1.163977, 1, 1, 1, 1, 1,
-1.00918, 2.213253, 0.9973311, 1, 1, 1, 1, 1,
-1.008004, -0.5085271, -2.239155, 1, 1, 1, 1, 1,
-1.00209, 1.255561, -1.229499, 1, 1, 1, 1, 1,
-1.001733, -0.2852918, -1.630592, 1, 1, 1, 1, 1,
-1.000921, 0.5945754, 0.3237146, 0, 0, 1, 1, 1,
-1.000339, -2.361052, -3.683114, 1, 0, 0, 1, 1,
-0.997333, 1.186869, 0.2191727, 1, 0, 0, 1, 1,
-0.9958833, -0.5311495, -1.983259, 1, 0, 0, 1, 1,
-0.9957563, -2.575488, -1.913823, 1, 0, 0, 1, 1,
-0.9914169, 1.280366, 0.3463433, 1, 0, 0, 1, 1,
-0.9911273, -0.5945352, -2.41725, 0, 0, 0, 1, 1,
-0.9887702, -0.6407973, 1.143278, 0, 0, 0, 1, 1,
-0.9881264, -0.5001822, -2.503438, 0, 0, 0, 1, 1,
-0.9812816, -0.1495814, -0.9633534, 0, 0, 0, 1, 1,
-0.9673262, -1.476233, -3.19437, 0, 0, 0, 1, 1,
-0.9649925, 0.09582537, -2.595166, 0, 0, 0, 1, 1,
-0.9613202, -1.972264, -2.971136, 0, 0, 0, 1, 1,
-0.9578645, -0.7553781, -1.660796, 1, 1, 1, 1, 1,
-0.9563, -0.6588278, -2.011351, 1, 1, 1, 1, 1,
-0.9543061, -0.4311613, -3.03178, 1, 1, 1, 1, 1,
-0.9491671, 1.495555, -0.1902792, 1, 1, 1, 1, 1,
-0.947436, -0.05240345, -1.947906, 1, 1, 1, 1, 1,
-0.9458968, 0.299785, -0.7235603, 1, 1, 1, 1, 1,
-0.944299, -1.974605, -3.753094, 1, 1, 1, 1, 1,
-0.9381154, -0.9259327, -1.502798, 1, 1, 1, 1, 1,
-0.9346016, 0.151212, 0.5693859, 1, 1, 1, 1, 1,
-0.9270254, -0.8222899, -0.9128577, 1, 1, 1, 1, 1,
-0.9235243, -0.08541197, -1.485482, 1, 1, 1, 1, 1,
-0.9170465, -0.3446006, -2.710582, 1, 1, 1, 1, 1,
-0.9139953, -0.05346052, -2.155398, 1, 1, 1, 1, 1,
-0.9130469, -0.3579163, -1.654206, 1, 1, 1, 1, 1,
-0.9083412, -0.939582, -2.476928, 1, 1, 1, 1, 1,
-0.9055315, 0.969981, -0.1076644, 0, 0, 1, 1, 1,
-0.9039297, -0.3137722, -1.685224, 1, 0, 0, 1, 1,
-0.8993298, 1.007952, -1.79468, 1, 0, 0, 1, 1,
-0.8992107, 0.3923277, -0.402016, 1, 0, 0, 1, 1,
-0.897696, 0.3951748, -0.4121662, 1, 0, 0, 1, 1,
-0.8933061, 2.157406, 0.4691257, 1, 0, 0, 1, 1,
-0.8889754, 0.9481696, -0.9191492, 0, 0, 0, 1, 1,
-0.8849023, 1.104636, -0.2701294, 0, 0, 0, 1, 1,
-0.8824103, -0.09471436, -2.086076, 0, 0, 0, 1, 1,
-0.8806242, 0.5034762, -1.54619, 0, 0, 0, 1, 1,
-0.8743028, -0.6221604, -1.910483, 0, 0, 0, 1, 1,
-0.8690823, 1.697301, -0.4523245, 0, 0, 0, 1, 1,
-0.8622721, -0.4308908, -3.021996, 0, 0, 0, 1, 1,
-0.8582314, 0.4676635, -1.013702, 1, 1, 1, 1, 1,
-0.8540406, 1.500828, 1.201224, 1, 1, 1, 1, 1,
-0.8517773, 1.398656, -1.971728, 1, 1, 1, 1, 1,
-0.8465344, -0.15094, -1.243612, 1, 1, 1, 1, 1,
-0.8459824, -0.7181098, -1.636845, 1, 1, 1, 1, 1,
-0.8371211, -0.2898535, -2.796979, 1, 1, 1, 1, 1,
-0.8316827, 0.163512, -1.294603, 1, 1, 1, 1, 1,
-0.8286633, 0.296877, -1.94799, 1, 1, 1, 1, 1,
-0.8236505, 0.8523238, -1.872573, 1, 1, 1, 1, 1,
-0.8205471, -1.479317, -2.87167, 1, 1, 1, 1, 1,
-0.8196553, 1.057759, 0.4330996, 1, 1, 1, 1, 1,
-0.8183632, 0.7228895, 0.01352799, 1, 1, 1, 1, 1,
-0.8119074, 0.4809886, -1.718918, 1, 1, 1, 1, 1,
-0.8085616, 0.2779185, 0.05191251, 1, 1, 1, 1, 1,
-0.808388, 0.4284325, -1.82219, 1, 1, 1, 1, 1,
-0.8058253, 1.271945, -0.1441278, 0, 0, 1, 1, 1,
-0.8023596, 0.161744, -1.086647, 1, 0, 0, 1, 1,
-0.7969314, 1.167051, -0.2369349, 1, 0, 0, 1, 1,
-0.788888, -2.532598, -3.876995, 1, 0, 0, 1, 1,
-0.7882277, -0.276969, 0.1471056, 1, 0, 0, 1, 1,
-0.7875711, -1.243676, -1.855266, 1, 0, 0, 1, 1,
-0.7870336, 0.3407139, -1.475546, 0, 0, 0, 1, 1,
-0.7830437, -0.2014199, 0.371694, 0, 0, 0, 1, 1,
-0.7782588, -0.1205532, -2.84819, 0, 0, 0, 1, 1,
-0.7781621, 0.09146453, -0.3433978, 0, 0, 0, 1, 1,
-0.7761815, 0.5045052, -1.751649, 0, 0, 0, 1, 1,
-0.7721965, 0.1252661, -1.187689, 0, 0, 0, 1, 1,
-0.7675481, 0.8321927, 0.03471024, 0, 0, 0, 1, 1,
-0.7646437, 1.099864, -0.5424878, 1, 1, 1, 1, 1,
-0.7623082, 0.0812254, -1.305501, 1, 1, 1, 1, 1,
-0.761267, -0.6635459, -0.6230382, 1, 1, 1, 1, 1,
-0.7592523, 1.224371, -0.84602, 1, 1, 1, 1, 1,
-0.7584578, -1.006811, -2.282368, 1, 1, 1, 1, 1,
-0.758105, 0.4439084, 0.2253951, 1, 1, 1, 1, 1,
-0.7539246, 0.7930545, 0.1288188, 1, 1, 1, 1, 1,
-0.7512379, 1.019858, -0.154367, 1, 1, 1, 1, 1,
-0.7502645, -1.118656, -1.86628, 1, 1, 1, 1, 1,
-0.7477794, 0.2669552, -1.198976, 1, 1, 1, 1, 1,
-0.7461023, 0.003559089, -2.463587, 1, 1, 1, 1, 1,
-0.7453381, -0.236111, -2.804927, 1, 1, 1, 1, 1,
-0.7421309, -0.2124469, -3.106486, 1, 1, 1, 1, 1,
-0.7368053, -1.98867, -1.940444, 1, 1, 1, 1, 1,
-0.7349662, 0.5497699, -1.384796, 1, 1, 1, 1, 1,
-0.7295196, -0.2585276, -1.133827, 0, 0, 1, 1, 1,
-0.7244408, 1.815166, 0.2932737, 1, 0, 0, 1, 1,
-0.7189959, -1.319885, -3.967052, 1, 0, 0, 1, 1,
-0.7189708, -0.5904093, -0.5925532, 1, 0, 0, 1, 1,
-0.715328, 0.1742056, -0.9679295, 1, 0, 0, 1, 1,
-0.7114615, -0.4244364, -1.032963, 1, 0, 0, 1, 1,
-0.7109739, 0.5586281, -0.933558, 0, 0, 0, 1, 1,
-0.7099038, -2.526131, -1.835011, 0, 0, 0, 1, 1,
-0.7021118, 0.1135725, -3.567152, 0, 0, 0, 1, 1,
-0.6944438, -0.1024146, -0.7188717, 0, 0, 0, 1, 1,
-0.6838416, 0.2945724, -0.3575978, 0, 0, 0, 1, 1,
-0.6814883, 0.8768854, 1.567378, 0, 0, 0, 1, 1,
-0.6779969, 0.4063924, -0.7278234, 0, 0, 0, 1, 1,
-0.6760688, -2.330459, -2.767043, 1, 1, 1, 1, 1,
-0.6717711, -0.3626132, -1.958055, 1, 1, 1, 1, 1,
-0.6676788, -0.3600089, -1.467802, 1, 1, 1, 1, 1,
-0.6667745, 0.7293209, -0.5168187, 1, 1, 1, 1, 1,
-0.6635597, -0.1799174, -3.360118, 1, 1, 1, 1, 1,
-0.6486264, -0.8654333, -1.98822, 1, 1, 1, 1, 1,
-0.6475708, 0.3300055, -0.1995777, 1, 1, 1, 1, 1,
-0.6466505, -1.586694, -1.956995, 1, 1, 1, 1, 1,
-0.6388245, -1.776659, -3.969395, 1, 1, 1, 1, 1,
-0.6381161, 0.4781604, 1.17408, 1, 1, 1, 1, 1,
-0.6359899, -0.4083763, -1.049195, 1, 1, 1, 1, 1,
-0.6300224, 1.228833, -1.486296, 1, 1, 1, 1, 1,
-0.6226705, 0.4930536, -2.986217, 1, 1, 1, 1, 1,
-0.6213717, 0.466041, 0.3142432, 1, 1, 1, 1, 1,
-0.6174536, -1.532701, -3.219966, 1, 1, 1, 1, 1,
-0.616493, 0.4708877, -1.930429, 0, 0, 1, 1, 1,
-0.6076341, 1.486488, -0.7799116, 1, 0, 0, 1, 1,
-0.6066568, -0.1673838, -2.278127, 1, 0, 0, 1, 1,
-0.6064645, -0.1403602, -2.621008, 1, 0, 0, 1, 1,
-0.593407, 0.8876676, -0.3921132, 1, 0, 0, 1, 1,
-0.5887666, -0.6591917, -3.417523, 1, 0, 0, 1, 1,
-0.5782502, -0.3075922, -0.1792293, 0, 0, 0, 1, 1,
-0.5746067, 1.036908, -0.9516675, 0, 0, 0, 1, 1,
-0.5693179, -0.9679281, -2.756471, 0, 0, 0, 1, 1,
-0.5665478, 0.2120671, -0.3791338, 0, 0, 0, 1, 1,
-0.5618035, 1.312943, 0.6052153, 0, 0, 0, 1, 1,
-0.5608608, -0.6305045, -2.696238, 0, 0, 0, 1, 1,
-0.5577947, -0.102147, -1.847858, 0, 0, 0, 1, 1,
-0.5549781, 0.01084246, -0.8428475, 1, 1, 1, 1, 1,
-0.5536528, 0.6083326, -1.032451, 1, 1, 1, 1, 1,
-0.552929, -0.2161716, -2.105191, 1, 1, 1, 1, 1,
-0.5506166, -0.711055, -3.702314, 1, 1, 1, 1, 1,
-0.5503002, -1.863914, -3.705921, 1, 1, 1, 1, 1,
-0.5490528, 0.3881724, 1.144789, 1, 1, 1, 1, 1,
-0.5487646, 0.7702957, -0.3479172, 1, 1, 1, 1, 1,
-0.5456771, 0.1615102, -1.519133, 1, 1, 1, 1, 1,
-0.5433743, -0.6222849, -2.478039, 1, 1, 1, 1, 1,
-0.5346406, 1.418811, -1.125378, 1, 1, 1, 1, 1,
-0.5337584, 0.0414737, -1.200603, 1, 1, 1, 1, 1,
-0.5337391, 1.328388, -0.874539, 1, 1, 1, 1, 1,
-0.5307407, -1.61551, -3.058917, 1, 1, 1, 1, 1,
-0.5306659, -0.816672, -1.732412, 1, 1, 1, 1, 1,
-0.5303524, 0.2943292, -2.302612, 1, 1, 1, 1, 1,
-0.5281189, 0.1103693, -1.916959, 0, 0, 1, 1, 1,
-0.5273275, 0.5865148, -1.394245, 1, 0, 0, 1, 1,
-0.525461, 0.665334, -0.7377427, 1, 0, 0, 1, 1,
-0.5226739, 0.2542415, -2.183674, 1, 0, 0, 1, 1,
-0.5226109, -0.5952227, -3.954111, 1, 0, 0, 1, 1,
-0.5220312, 0.446558, -0.08541267, 1, 0, 0, 1, 1,
-0.5182831, 0.07760855, -3.072596, 0, 0, 0, 1, 1,
-0.5150676, -0.3321178, -3.138117, 0, 0, 0, 1, 1,
-0.5126777, 0.2653691, -2.018396, 0, 0, 0, 1, 1,
-0.511827, -1.634414, -3.185428, 0, 0, 0, 1, 1,
-0.5072001, -0.6727278, -3.605904, 0, 0, 0, 1, 1,
-0.4992706, 2.099708, 0.5323944, 0, 0, 0, 1, 1,
-0.4984626, 1.494842, -1.71534, 0, 0, 0, 1, 1,
-0.4972137, 0.2016589, -2.100965, 1, 1, 1, 1, 1,
-0.4944102, 1.615074, -0.1792554, 1, 1, 1, 1, 1,
-0.4918766, -1.102659, -3.463449, 1, 1, 1, 1, 1,
-0.4871058, 1.405557, -1.500717, 1, 1, 1, 1, 1,
-0.4870573, 1.678893, 0.9211448, 1, 1, 1, 1, 1,
-0.4862348, -0.6694347, -0.824499, 1, 1, 1, 1, 1,
-0.4855678, 0.3180115, 2.152524, 1, 1, 1, 1, 1,
-0.485402, -0.9598359, -3.584176, 1, 1, 1, 1, 1,
-0.4833888, 1.586906, -0.257118, 1, 1, 1, 1, 1,
-0.4754316, -0.9377752, -4.000355, 1, 1, 1, 1, 1,
-0.4718057, -0.6181411, -2.628259, 1, 1, 1, 1, 1,
-0.470572, -0.08023801, -1.253596, 1, 1, 1, 1, 1,
-0.4621024, -0.5078022, -1.863334, 1, 1, 1, 1, 1,
-0.460641, 1.095401, -0.8950857, 1, 1, 1, 1, 1,
-0.4590628, 0.6430176, -1.903702, 1, 1, 1, 1, 1,
-0.4569356, 0.07727485, -0.6761917, 0, 0, 1, 1, 1,
-0.4550602, -0.4002435, -2.739224, 1, 0, 0, 1, 1,
-0.4520642, 1.712145, -0.8829054, 1, 0, 0, 1, 1,
-0.4519694, -0.4580442, -2.880054, 1, 0, 0, 1, 1,
-0.4440505, -0.1868005, -1.770803, 1, 0, 0, 1, 1,
-0.4358551, -0.8099343, -2.543515, 1, 0, 0, 1, 1,
-0.4353433, 0.9166812, -1.046266, 0, 0, 0, 1, 1,
-0.4340652, -1.112535, -2.605088, 0, 0, 0, 1, 1,
-0.4307125, 1.923361, -0.9259396, 0, 0, 0, 1, 1,
-0.4287433, -1.376105, -3.286182, 0, 0, 0, 1, 1,
-0.427352, 2.211594, 0.6754057, 0, 0, 0, 1, 1,
-0.4263262, 0.9579674, -0.5563804, 0, 0, 0, 1, 1,
-0.4251751, -0.3328339, -3.132339, 0, 0, 0, 1, 1,
-0.4152974, -0.984199, -2.291061, 1, 1, 1, 1, 1,
-0.4140204, -1.453311, -3.217021, 1, 1, 1, 1, 1,
-0.4072586, 1.71183, -1.989379, 1, 1, 1, 1, 1,
-0.4060856, 0.3938591, -0.3279221, 1, 1, 1, 1, 1,
-0.3990202, 0.6167136, 0.6975312, 1, 1, 1, 1, 1,
-0.3989144, -0.6537282, -2.957569, 1, 1, 1, 1, 1,
-0.3971277, 1.333512, 0.4779299, 1, 1, 1, 1, 1,
-0.3896825, -0.8043423, -1.967053, 1, 1, 1, 1, 1,
-0.3805438, -1.305214, -2.728211, 1, 1, 1, 1, 1,
-0.3780044, 1.46662, -0.8005585, 1, 1, 1, 1, 1,
-0.3764848, 1.125987, 0.6004346, 1, 1, 1, 1, 1,
-0.3755977, -0.4976072, -3.150688, 1, 1, 1, 1, 1,
-0.3749904, -0.1033832, -0.4839247, 1, 1, 1, 1, 1,
-0.3737329, -0.8631006, -1.503643, 1, 1, 1, 1, 1,
-0.3715978, -0.1682743, -3.221654, 1, 1, 1, 1, 1,
-0.3690304, -0.8870947, -2.925531, 0, 0, 1, 1, 1,
-0.3678758, 0.5511756, -2.076281, 1, 0, 0, 1, 1,
-0.3573317, -0.8969822, -1.992529, 1, 0, 0, 1, 1,
-0.3569965, 0.06969831, -1.652253, 1, 0, 0, 1, 1,
-0.3510206, 1.072041, -0.2857867, 1, 0, 0, 1, 1,
-0.3504988, 0.3065306, -1.917352, 1, 0, 0, 1, 1,
-0.3485227, 0.1077572, -1.111365, 0, 0, 0, 1, 1,
-0.3445513, 0.09554869, -0.7405913, 0, 0, 0, 1, 1,
-0.3439338, -0.2506587, -0.1347667, 0, 0, 0, 1, 1,
-0.341583, -2.276799, -1.607942, 0, 0, 0, 1, 1,
-0.3395309, 0.208621, -0.7671287, 0, 0, 0, 1, 1,
-0.3383419, 0.8091092, -0.545838, 0, 0, 0, 1, 1,
-0.3298644, 0.935177, -0.2042909, 0, 0, 0, 1, 1,
-0.324836, 1.121492, 0.3325392, 1, 1, 1, 1, 1,
-0.3246182, -0.2020506, -1.006789, 1, 1, 1, 1, 1,
-0.3205719, 1.242779, -0.9004416, 1, 1, 1, 1, 1,
-0.3188648, 0.2489862, -1.439045, 1, 1, 1, 1, 1,
-0.3129286, -0.1763426, -2.047721, 1, 1, 1, 1, 1,
-0.3082828, -0.1137844, -2.583593, 1, 1, 1, 1, 1,
-0.3077735, 1.107494, -1.064005, 1, 1, 1, 1, 1,
-0.3063896, -0.1041796, -2.274607, 1, 1, 1, 1, 1,
-0.2941595, 0.9419722, -0.8351945, 1, 1, 1, 1, 1,
-0.2864313, -0.81624, -3.171327, 1, 1, 1, 1, 1,
-0.285855, 0.6789421, -0.1640925, 1, 1, 1, 1, 1,
-0.283879, -0.2738081, -2.714523, 1, 1, 1, 1, 1,
-0.2801444, -0.4473563, -4.185335, 1, 1, 1, 1, 1,
-0.2787828, 0.8149543, -0.2258354, 1, 1, 1, 1, 1,
-0.2785543, 0.08898281, -2.122827, 1, 1, 1, 1, 1,
-0.2763145, 1.708394, -1.262506, 0, 0, 1, 1, 1,
-0.2753855, -0.2867763, -2.600355, 1, 0, 0, 1, 1,
-0.2725405, 1.005686, 0.912967, 1, 0, 0, 1, 1,
-0.2712541, -0.0240992, -0.3059082, 1, 0, 0, 1, 1,
-0.2698219, -0.01629298, -0.8917826, 1, 0, 0, 1, 1,
-0.2689942, -1.399718, -3.421279, 1, 0, 0, 1, 1,
-0.2674022, -0.2401703, -3.63951, 0, 0, 0, 1, 1,
-0.2622969, 0.7379852, -0.435431, 0, 0, 0, 1, 1,
-0.2558014, 0.560483, 0.2480936, 0, 0, 0, 1, 1,
-0.2533098, 0.09726132, -1.468528, 0, 0, 0, 1, 1,
-0.2513589, 0.8072965, -1.685523, 0, 0, 0, 1, 1,
-0.250884, -0.3500665, -0.8649255, 0, 0, 0, 1, 1,
-0.2462468, -1.044799, -2.618653, 0, 0, 0, 1, 1,
-0.245906, 0.3580681, 0.02213137, 1, 1, 1, 1, 1,
-0.2344034, 1.142256, 0.211201, 1, 1, 1, 1, 1,
-0.2306746, -0.4204685, -3.364498, 1, 1, 1, 1, 1,
-0.2265541, -0.5618019, -4.633074, 1, 1, 1, 1, 1,
-0.2240196, 1.133188, -0.2624126, 1, 1, 1, 1, 1,
-0.2216613, -1.115956, -3.632199, 1, 1, 1, 1, 1,
-0.2198304, -0.4963799, -2.495578, 1, 1, 1, 1, 1,
-0.2125585, 0.532681, -1.620061, 1, 1, 1, 1, 1,
-0.2107105, -1.233531, -2.710157, 1, 1, 1, 1, 1,
-0.207955, -0.5621361, -3.073244, 1, 1, 1, 1, 1,
-0.2077392, -0.07319345, -1.976971, 1, 1, 1, 1, 1,
-0.2074279, -1.792595, -5.199096, 1, 1, 1, 1, 1,
-0.2060006, -0.8023198, -0.8783781, 1, 1, 1, 1, 1,
-0.1997566, 0.08100418, -0.6471619, 1, 1, 1, 1, 1,
-0.1985497, 1.047936, -1.847562, 1, 1, 1, 1, 1,
-0.1951367, -1.309642, -2.172545, 0, 0, 1, 1, 1,
-0.1889749, 1.013316, -0.3450084, 1, 0, 0, 1, 1,
-0.1885182, 0.231684, 0.2754607, 1, 0, 0, 1, 1,
-0.1880643, 2.239497, -0.1751305, 1, 0, 0, 1, 1,
-0.1856979, 1.406508, 0.8038943, 1, 0, 0, 1, 1,
-0.1834214, -0.1040239, -0.3368119, 1, 0, 0, 1, 1,
-0.1810052, 0.3178831, 0.2019096, 0, 0, 0, 1, 1,
-0.1802719, 1.860841, -0.9088205, 0, 0, 0, 1, 1,
-0.1770449, -1.129331, -4.359404, 0, 0, 0, 1, 1,
-0.1766645, 0.3675021, -1.049541, 0, 0, 0, 1, 1,
-0.1763556, -0.03803701, -2.006126, 0, 0, 0, 1, 1,
-0.1763298, 0.6534342, 0.2577497, 0, 0, 0, 1, 1,
-0.1749853, 0.5925867, -0.5874838, 0, 0, 0, 1, 1,
-0.1734872, 0.9608365, -0.7190856, 1, 1, 1, 1, 1,
-0.1710108, -1.145673, -1.774218, 1, 1, 1, 1, 1,
-0.1657596, -0.9038383, -1.174025, 1, 1, 1, 1, 1,
-0.1607971, -1.269766, -2.065079, 1, 1, 1, 1, 1,
-0.1520008, -0.05270918, -2.076266, 1, 1, 1, 1, 1,
-0.1407167, -0.3358789, -2.563596, 1, 1, 1, 1, 1,
-0.1400352, 0.4599199, -0.07157735, 1, 1, 1, 1, 1,
-0.1352686, -0.03628205, -0.3512284, 1, 1, 1, 1, 1,
-0.1333117, 0.7745203, 0.680243, 1, 1, 1, 1, 1,
-0.1332759, -0.7299649, -3.948152, 1, 1, 1, 1, 1,
-0.1290923, 1.864061, 1.243819, 1, 1, 1, 1, 1,
-0.1267228, 1.968867, 0.410433, 1, 1, 1, 1, 1,
-0.1260218, -0.2174763, -3.941551, 1, 1, 1, 1, 1,
-0.1248915, -1.340215, -5.016551, 1, 1, 1, 1, 1,
-0.123, 0.631664, -0.5582998, 1, 1, 1, 1, 1,
-0.1225844, -0.4735522, -1.9069, 0, 0, 1, 1, 1,
-0.1223836, -1.340641, -1.200335, 1, 0, 0, 1, 1,
-0.1209233, -0.7777806, -6.144313, 1, 0, 0, 1, 1,
-0.1189578, -1.188883, -3.127011, 1, 0, 0, 1, 1,
-0.1169213, -0.7680368, -3.209133, 1, 0, 0, 1, 1,
-0.1159245, 1.426103, -0.405939, 1, 0, 0, 1, 1,
-0.1142605, 1.642624, -0.6990907, 0, 0, 0, 1, 1,
-0.1077636, -0.7773692, -1.615502, 0, 0, 0, 1, 1,
-0.1061483, -0.1781332, -3.420567, 0, 0, 0, 1, 1,
-0.1024973, -0.4029614, -3.629072, 0, 0, 0, 1, 1,
-0.09995381, -0.665211, -2.897959, 0, 0, 0, 1, 1,
-0.09788343, 0.8912078, -0.9343412, 0, 0, 0, 1, 1,
-0.09361153, 1.033391, 0.3300314, 0, 0, 0, 1, 1,
-0.09171768, 0.3643039, -0.8037289, 1, 1, 1, 1, 1,
-0.09151886, -1.41564, -1.474281, 1, 1, 1, 1, 1,
-0.08484329, 0.8457124, 2.56513, 1, 1, 1, 1, 1,
-0.0811222, -2.276383, -2.947251, 1, 1, 1, 1, 1,
-0.08093248, -0.2301022, -1.528945, 1, 1, 1, 1, 1,
-0.08069728, -0.140956, -2.88655, 1, 1, 1, 1, 1,
-0.07939468, -0.9074294, -0.7794236, 1, 1, 1, 1, 1,
-0.07389752, 0.3207368, 1.488766, 1, 1, 1, 1, 1,
-0.06610505, -0.3246171, -1.869443, 1, 1, 1, 1, 1,
-0.06110254, 0.3298833, 1.464226, 1, 1, 1, 1, 1,
-0.05713962, 0.09209476, -0.5861014, 1, 1, 1, 1, 1,
-0.05385093, 0.2183302, -0.4194719, 1, 1, 1, 1, 1,
-0.05332097, 0.5794114, 0.3595775, 1, 1, 1, 1, 1,
-0.05245135, 1.239673, -0.8508039, 1, 1, 1, 1, 1,
-0.05052055, -1.209933, -2.036081, 1, 1, 1, 1, 1,
-0.04389542, 0.6605631, 0.2938491, 0, 0, 1, 1, 1,
-0.04378711, 0.8463085, -1.01672, 1, 0, 0, 1, 1,
-0.03541317, 0.9702263, 0.6112269, 1, 0, 0, 1, 1,
-0.03433225, -0.0334928, -2.88445, 1, 0, 0, 1, 1,
-0.03225065, -0.6962011, -3.25791, 1, 0, 0, 1, 1,
-0.03155294, 0.1800543, 0.8692062, 1, 0, 0, 1, 1,
-0.02949859, -0.3401714, -3.691064, 0, 0, 0, 1, 1,
-0.02745025, -0.6007885, -1.67897, 0, 0, 0, 1, 1,
-0.02741439, -0.03157436, -0.9827292, 0, 0, 0, 1, 1,
-0.02608777, 0.434563, 0.8886504, 0, 0, 0, 1, 1,
-0.02604283, -0.5645983, -1.831451, 0, 0, 0, 1, 1,
-0.02391281, 1.302355, -1.991256, 0, 0, 0, 1, 1,
-0.02234767, 0.6856288, -1.081506, 0, 0, 0, 1, 1,
-0.02024746, 0.258321, -0.1195227, 1, 1, 1, 1, 1,
-0.01454878, 0.4474664, 0.6425232, 1, 1, 1, 1, 1,
-0.01125416, -0.08197767, -1.193352, 1, 1, 1, 1, 1,
-0.01071858, -2.025003, -1.450796, 1, 1, 1, 1, 1,
-0.01033304, 0.6586466, -0.008689611, 1, 1, 1, 1, 1,
-0.006509318, -1.687101, -4.683296, 1, 1, 1, 1, 1,
-0.006172211, -0.1530901, -1.580111, 1, 1, 1, 1, 1,
-0.005489727, -0.6433617, -4.655925, 1, 1, 1, 1, 1,
0.001546029, -0.686677, 2.991717, 1, 1, 1, 1, 1,
0.01018345, 0.7218384, -1.088725, 1, 1, 1, 1, 1,
0.01061258, -1.068714, 2.132417, 1, 1, 1, 1, 1,
0.0114943, 0.6987456, 0.4468753, 1, 1, 1, 1, 1,
0.01316999, 0.1473574, 0.8786778, 1, 1, 1, 1, 1,
0.01347142, 1.053353, -3.419083, 1, 1, 1, 1, 1,
0.01391328, 1.498525, 0.9291915, 1, 1, 1, 1, 1,
0.01646795, 0.9035848, 0.001693166, 0, 0, 1, 1, 1,
0.02062161, -0.481113, 1.943795, 1, 0, 0, 1, 1,
0.02317173, -0.6621991, 1.946059, 1, 0, 0, 1, 1,
0.02347215, 1.106782, 1.607751, 1, 0, 0, 1, 1,
0.02579586, -0.4291677, 1.327127, 1, 0, 0, 1, 1,
0.02698947, 0.4353339, 0.7758802, 1, 0, 0, 1, 1,
0.02719758, 1.044596, -0.05625564, 0, 0, 0, 1, 1,
0.02831284, 0.06351325, 1.287845, 0, 0, 0, 1, 1,
0.0285337, 0.2421932, -1.427629, 0, 0, 0, 1, 1,
0.02873449, -1.372759, 2.591199, 0, 0, 0, 1, 1,
0.02911471, -0.1444481, 3.05505, 0, 0, 0, 1, 1,
0.0294855, 1.608859, -0.1560621, 0, 0, 0, 1, 1,
0.03766545, 0.8436513, 0.839336, 0, 0, 0, 1, 1,
0.03769035, 0.1778113, -0.0956964, 1, 1, 1, 1, 1,
0.04028825, -1.047122, 1.144783, 1, 1, 1, 1, 1,
0.04640352, -1.597718, 2.119028, 1, 1, 1, 1, 1,
0.04691537, -0.068574, 1.824914, 1, 1, 1, 1, 1,
0.04728637, 0.1339404, -1.662869, 1, 1, 1, 1, 1,
0.06642035, -0.08089351, 3.652545, 1, 1, 1, 1, 1,
0.06972463, -0.5229048, 3.154131, 1, 1, 1, 1, 1,
0.0702216, -0.09432838, 2.077798, 1, 1, 1, 1, 1,
0.07231978, 0.1576565, -0.3562028, 1, 1, 1, 1, 1,
0.07736816, 0.4444913, -0.4621133, 1, 1, 1, 1, 1,
0.08285177, 0.01186457, 1.044929, 1, 1, 1, 1, 1,
0.08755298, -1.100518, 0.1686923, 1, 1, 1, 1, 1,
0.09170077, 0.3436215, 0.5668772, 1, 1, 1, 1, 1,
0.1018709, -0.4245999, 3.587154, 1, 1, 1, 1, 1,
0.1037525, -1.918503, 3.529515, 1, 1, 1, 1, 1,
0.1073412, 1.147992, 0.7776152, 0, 0, 1, 1, 1,
0.1093659, 0.8483334, 1.931161, 1, 0, 0, 1, 1,
0.1123374, -1.085375, 1.851182, 1, 0, 0, 1, 1,
0.1135692, 0.114497, 0.2935657, 1, 0, 0, 1, 1,
0.1135745, 0.2063664, -1.116309, 1, 0, 0, 1, 1,
0.11429, 0.04124281, 1.074782, 1, 0, 0, 1, 1,
0.1150733, -1.176906, 2.652193, 0, 0, 0, 1, 1,
0.1167374, -0.5976958, 3.726898, 0, 0, 0, 1, 1,
0.1190153, 1.223081, 1.890439, 0, 0, 0, 1, 1,
0.1255195, -0.4415795, 3.403311, 0, 0, 0, 1, 1,
0.1259836, 0.3228584, -1.185886, 0, 0, 0, 1, 1,
0.1273198, -0.3116216, 2.158503, 0, 0, 0, 1, 1,
0.1292123, 0.07507552, 2.233817, 0, 0, 0, 1, 1,
0.1301989, 0.3568251, 1.575007, 1, 1, 1, 1, 1,
0.1310039, -0.6963196, 3.592239, 1, 1, 1, 1, 1,
0.1376415, -2.140675, 3.275089, 1, 1, 1, 1, 1,
0.148014, 1.260296, -0.1438475, 1, 1, 1, 1, 1,
0.1501502, 0.2793405, 0.7196158, 1, 1, 1, 1, 1,
0.151881, 1.502886, -0.535881, 1, 1, 1, 1, 1,
0.154019, 0.3737677, 1.317579, 1, 1, 1, 1, 1,
0.1587523, 0.5788234, -0.04561026, 1, 1, 1, 1, 1,
0.1605129, 2.239375, 1.115089, 1, 1, 1, 1, 1,
0.1612909, -0.03463752, 2.298661, 1, 1, 1, 1, 1,
0.1660101, -1.666224, 4.924699, 1, 1, 1, 1, 1,
0.1676838, -0.6041548, 1.175224, 1, 1, 1, 1, 1,
0.1694334, -0.08491617, 1.124264, 1, 1, 1, 1, 1,
0.1731704, 1.722057, 0.906072, 1, 1, 1, 1, 1,
0.177548, -0.8488229, 3.896952, 1, 1, 1, 1, 1,
0.182592, -1.04699, 4.563473, 0, 0, 1, 1, 1,
0.1846189, 0.2424834, 0.2366823, 1, 0, 0, 1, 1,
0.1909759, -1.284999, 3.488441, 1, 0, 0, 1, 1,
0.1954151, -0.5892204, 1.286069, 1, 0, 0, 1, 1,
0.1994202, 0.7323369, 0.2053962, 1, 0, 0, 1, 1,
0.1996788, 0.6840727, 0.1787587, 1, 0, 0, 1, 1,
0.2050826, 1.149676, -1.435322, 0, 0, 0, 1, 1,
0.2062837, 0.7469978, -1.445861, 0, 0, 0, 1, 1,
0.2073538, -0.08077043, 2.383791, 0, 0, 0, 1, 1,
0.208007, -0.826075, 2.801239, 0, 0, 0, 1, 1,
0.2084446, 0.6478614, -0.5267946, 0, 0, 0, 1, 1,
0.2095247, 0.5931833, 1.053774, 0, 0, 0, 1, 1,
0.2128898, 0.027746, 2.196087, 0, 0, 0, 1, 1,
0.2134786, 0.9571701, 0.6210565, 1, 1, 1, 1, 1,
0.2143754, -0.8171587, 2.835962, 1, 1, 1, 1, 1,
0.2162486, 2.665291, -0.7113068, 1, 1, 1, 1, 1,
0.217752, -1.031344, 4.456085, 1, 1, 1, 1, 1,
0.2259225, 0.1871306, 0.1297367, 1, 1, 1, 1, 1,
0.2280511, 0.2221564, -1.213094, 1, 1, 1, 1, 1,
0.2301715, -0.3526497, 1.78479, 1, 1, 1, 1, 1,
0.2330169, 0.442146, 0.5972483, 1, 1, 1, 1, 1,
0.2369072, -2.104123, 3.232548, 1, 1, 1, 1, 1,
0.2370028, -0.4422025, 2.46189, 1, 1, 1, 1, 1,
0.2370988, -0.07716595, 2.490552, 1, 1, 1, 1, 1,
0.2375891, -0.2438816, 2.388133, 1, 1, 1, 1, 1,
0.2391941, -1.92969, 4.436382, 1, 1, 1, 1, 1,
0.2437009, 1.520192, 0.2590583, 1, 1, 1, 1, 1,
0.2457705, -2.513625, 3.532229, 1, 1, 1, 1, 1,
0.2469748, -0.1542188, 1.183945, 0, 0, 1, 1, 1,
0.2508364, -0.8005313, 1.5029, 1, 0, 0, 1, 1,
0.2540887, -0.5686268, 3.515323, 1, 0, 0, 1, 1,
0.2572441, 0.3102569, 1.696008, 1, 0, 0, 1, 1,
0.2577969, -1.214203, 4.055976, 1, 0, 0, 1, 1,
0.2590499, 2.470655, -0.1600426, 1, 0, 0, 1, 1,
0.2672918, 0.8602985, 0.02539139, 0, 0, 0, 1, 1,
0.2679155, 3.078514, 0.6965986, 0, 0, 0, 1, 1,
0.2685287, 1.290282, 1.091114, 0, 0, 0, 1, 1,
0.2744831, 0.1380273, 0.7920285, 0, 0, 0, 1, 1,
0.2752996, 0.1621928, 1.780271, 0, 0, 0, 1, 1,
0.2754544, 1.498585, 0.508509, 0, 0, 0, 1, 1,
0.2770889, -0.4905652, 1.657257, 0, 0, 0, 1, 1,
0.2836127, 0.09784534, 2.317144, 1, 1, 1, 1, 1,
0.2865427, -0.3088277, 4.050593, 1, 1, 1, 1, 1,
0.289512, -1.063708, 1.796799, 1, 1, 1, 1, 1,
0.2951414, -0.834966, 3.554833, 1, 1, 1, 1, 1,
0.2952978, -1.971882, 3.584952, 1, 1, 1, 1, 1,
0.2973106, -0.0003144798, 0.8016346, 1, 1, 1, 1, 1,
0.301717, -0.3636222, 3.607479, 1, 1, 1, 1, 1,
0.3030778, 0.3014916, 0.3619509, 1, 1, 1, 1, 1,
0.3039055, 0.9752359, 1.350915, 1, 1, 1, 1, 1,
0.3039535, -1.747332, 1.480555, 1, 1, 1, 1, 1,
0.3044555, 1.372085, 0.5811504, 1, 1, 1, 1, 1,
0.3170156, -0.3967313, 2.844983, 1, 1, 1, 1, 1,
0.3182544, -1.667843, 3.212523, 1, 1, 1, 1, 1,
0.3184476, -1.194406, 4.283291, 1, 1, 1, 1, 1,
0.3219945, -0.7867792, 1.961027, 1, 1, 1, 1, 1,
0.3228137, -0.7552409, 2.95987, 0, 0, 1, 1, 1,
0.3287841, 1.067957, 0.3305955, 1, 0, 0, 1, 1,
0.3309806, -0.7319849, 3.090464, 1, 0, 0, 1, 1,
0.331489, 0.6660351, -0.6836855, 1, 0, 0, 1, 1,
0.3372584, 1.673076, 0.3460209, 1, 0, 0, 1, 1,
0.3376164, -0.05264667, 1.935949, 1, 0, 0, 1, 1,
0.3382188, -0.6460001, 1.261304, 0, 0, 0, 1, 1,
0.3403606, -1.52329, 2.801477, 0, 0, 0, 1, 1,
0.3405634, 1.009011, 0.03894997, 0, 0, 0, 1, 1,
0.34423, 0.9481326, 0.4453253, 0, 0, 0, 1, 1,
0.344444, -0.4576871, 3.083162, 0, 0, 0, 1, 1,
0.3450002, 0.8267116, 3.677083, 0, 0, 0, 1, 1,
0.3476059, 0.477374, 0.8425009, 0, 0, 0, 1, 1,
0.3478198, 0.7342089, 1.072937, 1, 1, 1, 1, 1,
0.3482209, 1.136775, 0.331863, 1, 1, 1, 1, 1,
0.3492441, -0.1194814, 1.20894, 1, 1, 1, 1, 1,
0.3520736, -0.7600253, 1.304639, 1, 1, 1, 1, 1,
0.3545399, -0.3402468, 0.6103694, 1, 1, 1, 1, 1,
0.357949, -0.4759882, 1.648632, 1, 1, 1, 1, 1,
0.357972, 0.4951397, 2.712237, 1, 1, 1, 1, 1,
0.3604093, -1.367962, 4.200662, 1, 1, 1, 1, 1,
0.3612711, -1.15354, 3.798451, 1, 1, 1, 1, 1,
0.3639318, -0.1562949, 0.3629265, 1, 1, 1, 1, 1,
0.3666686, 0.7464296, -0.29035, 1, 1, 1, 1, 1,
0.3693397, -1.608414, 3.269688, 1, 1, 1, 1, 1,
0.3756202, -0.8126964, 1.881421, 1, 1, 1, 1, 1,
0.3779634, 0.1298592, -1.145419, 1, 1, 1, 1, 1,
0.3792079, 1.541875, -0.9707396, 1, 1, 1, 1, 1,
0.3835303, -0.3057047, 2.453534, 0, 0, 1, 1, 1,
0.3866185, -0.7427893, 2.391813, 1, 0, 0, 1, 1,
0.3866794, -0.3831451, 2.064768, 1, 0, 0, 1, 1,
0.3874488, -0.5217456, 2.814107, 1, 0, 0, 1, 1,
0.3888546, 0.9583936, 1.57207, 1, 0, 0, 1, 1,
0.3906706, -0.6079347, 4.618993, 1, 0, 0, 1, 1,
0.391062, -0.4291071, 4.048856, 0, 0, 0, 1, 1,
0.3919179, 1.605804, -0.6074824, 0, 0, 0, 1, 1,
0.3933346, -0.4263684, 3.463428, 0, 0, 0, 1, 1,
0.3955482, 0.2947043, 1.122798, 0, 0, 0, 1, 1,
0.4009307, -1.030129, 2.091627, 0, 0, 0, 1, 1,
0.4015468, 1.260874, -0.1412513, 0, 0, 0, 1, 1,
0.4037204, 0.7068509, 2.070843, 0, 0, 0, 1, 1,
0.4050231, -0.8868186, 1.569957, 1, 1, 1, 1, 1,
0.4055814, 0.8639156, -1.486862, 1, 1, 1, 1, 1,
0.407425, 0.1109609, 1.945101, 1, 1, 1, 1, 1,
0.4075598, -0.3030379, 1.23688, 1, 1, 1, 1, 1,
0.4118133, -0.6679125, 1.112935, 1, 1, 1, 1, 1,
0.4136439, -1.308812, 2.810461, 1, 1, 1, 1, 1,
0.4155483, 0.8118823, 0.4343536, 1, 1, 1, 1, 1,
0.4181561, -0.9149851, 2.111551, 1, 1, 1, 1, 1,
0.4196823, -0.3023713, 1.112631, 1, 1, 1, 1, 1,
0.4201746, 0.7496197, -0.2185924, 1, 1, 1, 1, 1,
0.4203491, -0.6414644, 3.323578, 1, 1, 1, 1, 1,
0.4224087, 1.091807, 2.041027, 1, 1, 1, 1, 1,
0.4224942, -0.6253466, 2.148259, 1, 1, 1, 1, 1,
0.4254826, -1.084492, 1.052289, 1, 1, 1, 1, 1,
0.4260233, 1.254804, -0.2683029, 1, 1, 1, 1, 1,
0.4285955, -0.531146, 2.408486, 0, 0, 1, 1, 1,
0.4306096, -1.081565, 3.227847, 1, 0, 0, 1, 1,
0.4310913, 1.201275, 0.6242297, 1, 0, 0, 1, 1,
0.4447223, 0.2010665, 1.140354, 1, 0, 0, 1, 1,
0.4458301, -0.1012905, 1.941464, 1, 0, 0, 1, 1,
0.4488486, -0.09284739, 1.22023, 1, 0, 0, 1, 1,
0.451159, 0.4695225, -0.7065425, 0, 0, 0, 1, 1,
0.4518366, -0.6573715, 2.517551, 0, 0, 0, 1, 1,
0.452796, 2.166084, -0.5941039, 0, 0, 0, 1, 1,
0.453247, -0.2196885, 1.323511, 0, 0, 0, 1, 1,
0.4563705, 1.467978, -0.05481707, 0, 0, 0, 1, 1,
0.4573061, 0.407082, 1.963202, 0, 0, 0, 1, 1,
0.4581548, -0.5144939, 2.806156, 0, 0, 0, 1, 1,
0.4634711, -0.2133287, 1.177756, 1, 1, 1, 1, 1,
0.4657522, 0.3533665, 0.546181, 1, 1, 1, 1, 1,
0.4692201, 1.379449, 1.085971, 1, 1, 1, 1, 1,
0.4702894, -0.7465938, 1.814569, 1, 1, 1, 1, 1,
0.4728949, -0.7748925, 2.447508, 1, 1, 1, 1, 1,
0.473949, -1.91382, 3.364917, 1, 1, 1, 1, 1,
0.4750805, -1.794839, 2.023359, 1, 1, 1, 1, 1,
0.4773028, -0.8532302, 0.695309, 1, 1, 1, 1, 1,
0.4792063, -1.13342, 3.160022, 1, 1, 1, 1, 1,
0.4819517, -0.6490119, 1.387962, 1, 1, 1, 1, 1,
0.4833359, 0.8614732, -0.5171485, 1, 1, 1, 1, 1,
0.4873942, -1.023619, 2.857877, 1, 1, 1, 1, 1,
0.4884584, 0.001062357, 1.824018, 1, 1, 1, 1, 1,
0.4903966, -0.01651241, 2.16407, 1, 1, 1, 1, 1,
0.4979616, -1.309671, 1.635221, 1, 1, 1, 1, 1,
0.5080771, 0.262254, 2.307721, 0, 0, 1, 1, 1,
0.5099106, -0.1502048, 1.471753, 1, 0, 0, 1, 1,
0.5115654, -0.5660521, 3.264611, 1, 0, 0, 1, 1,
0.5128526, 1.159483, 1.991173, 1, 0, 0, 1, 1,
0.5132367, 0.6845656, 0.119929, 1, 0, 0, 1, 1,
0.5214463, -0.1734391, 1.8263, 1, 0, 0, 1, 1,
0.5227169, -0.9750369, 4.287537, 0, 0, 0, 1, 1,
0.5233616, -0.14167, 2.949082, 0, 0, 0, 1, 1,
0.5240688, 0.6006047, -0.1194501, 0, 0, 0, 1, 1,
0.5244364, 0.413397, 0.8444948, 0, 0, 0, 1, 1,
0.5283411, 0.04866729, -0.1672772, 0, 0, 0, 1, 1,
0.5302004, 1.426172, 1.201836, 0, 0, 0, 1, 1,
0.5316827, 0.4060278, 1.005946, 0, 0, 0, 1, 1,
0.5353184, 0.858166, 0.995051, 1, 1, 1, 1, 1,
0.537236, -0.2317102, 1.937969, 1, 1, 1, 1, 1,
0.5384721, -1.302858, 2.917412, 1, 1, 1, 1, 1,
0.5387653, -0.6843226, 0.5701985, 1, 1, 1, 1, 1,
0.5488555, -0.2229956, -1.449827, 1, 1, 1, 1, 1,
0.549207, 0.4675377, 1.431479, 1, 1, 1, 1, 1,
0.5575331, -0.2089989, 2.814354, 1, 1, 1, 1, 1,
0.5643199, 1.894857, 2.357527, 1, 1, 1, 1, 1,
0.5684714, -1.138074, 3.03234, 1, 1, 1, 1, 1,
0.5713747, 0.2358206, 0.9037458, 1, 1, 1, 1, 1,
0.5714305, 1.807931, 0.6303091, 1, 1, 1, 1, 1,
0.5737739, -0.6689356, 2.847144, 1, 1, 1, 1, 1,
0.5764797, -0.9515525, 1.688345, 1, 1, 1, 1, 1,
0.5810187, 0.6986591, 1.652327, 1, 1, 1, 1, 1,
0.5952328, -0.6402208, 2.217432, 1, 1, 1, 1, 1,
0.5958135, -0.7808785, 1.779448, 0, 0, 1, 1, 1,
0.5963464, 1.193424, 0.5624053, 1, 0, 0, 1, 1,
0.5969335, -0.7528658, 2.724618, 1, 0, 0, 1, 1,
0.5994251, 0.1696062, 1.080277, 1, 0, 0, 1, 1,
0.6103966, -1.082798, 1.947987, 1, 0, 0, 1, 1,
0.6114651, 0.07236964, 1.950364, 1, 0, 0, 1, 1,
0.6121873, -0.9947942, 1.964607, 0, 0, 0, 1, 1,
0.6137516, -1.72768, 2.988451, 0, 0, 0, 1, 1,
0.6137753, 0.6462378, 1.525263, 0, 0, 0, 1, 1,
0.6240317, -0.9392506, 1.289162, 0, 0, 0, 1, 1,
0.625294, -0.6662015, 1.445832, 0, 0, 0, 1, 1,
0.6279256, -0.09610952, 2.414325, 0, 0, 0, 1, 1,
0.6284962, -0.626038, 2.005434, 0, 0, 0, 1, 1,
0.631095, 0.1614504, 0.5386987, 1, 1, 1, 1, 1,
0.6313489, -1.084934, 3.83012, 1, 1, 1, 1, 1,
0.6418734, -0.885978, 2.282658, 1, 1, 1, 1, 1,
0.6435914, -0.01943815, 0.04414411, 1, 1, 1, 1, 1,
0.6443393, -0.4944714, 1.481942, 1, 1, 1, 1, 1,
0.6451339, 1.724367, -0.7489662, 1, 1, 1, 1, 1,
0.6458015, 0.002105341, 1.100889, 1, 1, 1, 1, 1,
0.6473472, -1.616008, 1.203758, 1, 1, 1, 1, 1,
0.6530287, -0.4819651, 2.308276, 1, 1, 1, 1, 1,
0.6551193, 0.9279122, -1.477508, 1, 1, 1, 1, 1,
0.6702685, -1.684109, 3.739591, 1, 1, 1, 1, 1,
0.6835266, 0.8496375, 0.606509, 1, 1, 1, 1, 1,
0.6855297, 0.3558957, 1.965348, 1, 1, 1, 1, 1,
0.6857107, 0.5482424, -0.5993621, 1, 1, 1, 1, 1,
0.6865478, 0.5263376, 1.140704, 1, 1, 1, 1, 1,
0.6888626, -0.3476234, 2.58705, 0, 0, 1, 1, 1,
0.6903065, 0.9697492, -0.4840025, 1, 0, 0, 1, 1,
0.6969367, -2.132252, 3.525294, 1, 0, 0, 1, 1,
0.7031123, 0.04756759, -0.7525464, 1, 0, 0, 1, 1,
0.7089717, 0.2461261, 2.516684, 1, 0, 0, 1, 1,
0.7140826, -1.229198, 2.36504, 1, 0, 0, 1, 1,
0.7153912, -0.02641193, 2.778567, 0, 0, 0, 1, 1,
0.725125, 0.1404449, 0.08463498, 0, 0, 0, 1, 1,
0.7291464, -1.007673, 3.434078, 0, 0, 0, 1, 1,
0.7294825, 0.6146643, 0.3663595, 0, 0, 0, 1, 1,
0.7308338, 1.604501, -0.285447, 0, 0, 0, 1, 1,
0.7353951, -0.8111815, 0.5789104, 0, 0, 0, 1, 1,
0.7385967, 0.5672659, 3.185095, 0, 0, 0, 1, 1,
0.7474402, 2.52743, -0.07255431, 1, 1, 1, 1, 1,
0.7475474, 1.236246, 1.567728, 1, 1, 1, 1, 1,
0.7508667, 0.7951443, 1.056796, 1, 1, 1, 1, 1,
0.7512338, -0.6334327, 2.011421, 1, 1, 1, 1, 1,
0.7514846, -1.019978, 2.494928, 1, 1, 1, 1, 1,
0.7555887, 0.5944781, 2.265016, 1, 1, 1, 1, 1,
0.7609258, -0.1997896, 2.873292, 1, 1, 1, 1, 1,
0.7637579, 2.479334, 0.8840225, 1, 1, 1, 1, 1,
0.7659903, 0.4045633, 2.110937, 1, 1, 1, 1, 1,
0.7665215, -0.4080577, 1.877365, 1, 1, 1, 1, 1,
0.7748855, 0.7752586, 1.095112, 1, 1, 1, 1, 1,
0.7759102, 0.6600754, 0.6590611, 1, 1, 1, 1, 1,
0.7771997, -1.724693, 3.503977, 1, 1, 1, 1, 1,
0.7772068, 0.2552513, 2.351117, 1, 1, 1, 1, 1,
0.7813207, 0.361644, 0.8412178, 1, 1, 1, 1, 1,
0.7866743, -0.1480699, 1.494689, 0, 0, 1, 1, 1,
0.7896242, -0.6213014, 0.4045838, 1, 0, 0, 1, 1,
0.7909731, 0.4402303, 0.03082958, 1, 0, 0, 1, 1,
0.7945319, -0.9389083, 3.069368, 1, 0, 0, 1, 1,
0.7967351, 1.060773, 1.008087, 1, 0, 0, 1, 1,
0.7987211, -0.6506684, 3.681821, 1, 0, 0, 1, 1,
0.8076102, 0.6553344, 2.538084, 0, 0, 0, 1, 1,
0.8109581, -0.4743956, 0.8420998, 0, 0, 0, 1, 1,
0.8113211, -0.7962162, 3.070577, 0, 0, 0, 1, 1,
0.8181969, -0.6309195, 1.216453, 0, 0, 0, 1, 1,
0.8207124, -1.307683, 2.272204, 0, 0, 0, 1, 1,
0.8220174, -0.7796128, 1.238247, 0, 0, 0, 1, 1,
0.8231437, 0.2085899, 2.102655, 0, 0, 0, 1, 1,
0.8245713, -0.2863574, 1.497972, 1, 1, 1, 1, 1,
0.8308225, -0.9414068, 2.946589, 1, 1, 1, 1, 1,
0.8315181, 0.6891741, 1.174658, 1, 1, 1, 1, 1,
0.8349113, -0.442577, 2.553604, 1, 1, 1, 1, 1,
0.8359944, 1.688915, -0.02183121, 1, 1, 1, 1, 1,
0.8440416, 1.198628, 0.2206474, 1, 1, 1, 1, 1,
0.8483515, -0.17905, 2.751078, 1, 1, 1, 1, 1,
0.8497397, 2.662293, -1.787688, 1, 1, 1, 1, 1,
0.855608, -0.2011812, 3.232805, 1, 1, 1, 1, 1,
0.8597454, 0.7753885, 1.688148, 1, 1, 1, 1, 1,
0.8597702, 0.9181387, 1.858553, 1, 1, 1, 1, 1,
0.8616515, 0.2693494, 2.309417, 1, 1, 1, 1, 1,
0.8665401, 0.1859949, 2.538568, 1, 1, 1, 1, 1,
0.8697096, -0.09972589, 0.3150721, 1, 1, 1, 1, 1,
0.882581, -0.6900737, 1.332399, 1, 1, 1, 1, 1,
0.8863249, 0.4174016, 0.1445315, 0, 0, 1, 1, 1,
0.8882768, -0.7570056, 2.721727, 1, 0, 0, 1, 1,
0.9025444, -0.6895382, 2.781262, 1, 0, 0, 1, 1,
0.905311, -0.04071983, 1.862197, 1, 0, 0, 1, 1,
0.9130164, -0.72186, 2.329988, 1, 0, 0, 1, 1,
0.9162452, 0.6187677, 1.212946, 1, 0, 0, 1, 1,
0.9215722, 0.8915834, 2.904232, 0, 0, 0, 1, 1,
0.9245074, 2.443689, 0.4464709, 0, 0, 0, 1, 1,
0.9257947, -0.906276, 1.482491, 0, 0, 0, 1, 1,
0.9323645, 1.242624, 1.032164, 0, 0, 0, 1, 1,
0.9329501, 0.439859, 0.5060481, 0, 0, 0, 1, 1,
0.9342419, 0.807106, 0.4090941, 0, 0, 0, 1, 1,
0.9375002, 0.4229308, 1.133579, 0, 0, 0, 1, 1,
0.9390911, 0.4357653, 1.880688, 1, 1, 1, 1, 1,
0.9433004, 0.4098493, 1.275126, 1, 1, 1, 1, 1,
0.9585013, -2.225272, 3.442415, 1, 1, 1, 1, 1,
0.9601865, 0.4005795, 0.9489906, 1, 1, 1, 1, 1,
0.9627445, 0.7448159, 0.2894677, 1, 1, 1, 1, 1,
0.9690987, -1.299907, 3.853848, 1, 1, 1, 1, 1,
0.9716046, -0.615387, 0.7725889, 1, 1, 1, 1, 1,
0.9742431, 0.1346863, 0.0899474, 1, 1, 1, 1, 1,
0.97482, 0.6770039, 2.169476, 1, 1, 1, 1, 1,
0.9749991, 1.639086, 1.064954, 1, 1, 1, 1, 1,
0.9816769, -0.3914118, 1.706616, 1, 1, 1, 1, 1,
0.9826557, -1.192784, 2.710408, 1, 1, 1, 1, 1,
0.9889565, 0.1168143, 1.903297, 1, 1, 1, 1, 1,
1.008254, 1.869709, 1.66959, 1, 1, 1, 1, 1,
1.010781, 0.238593, 2.788907, 1, 1, 1, 1, 1,
1.016081, 0.3776525, 0.6017273, 0, 0, 1, 1, 1,
1.030883, 0.3055468, 2.058034, 1, 0, 0, 1, 1,
1.037873, 1.496704, -0.3970132, 1, 0, 0, 1, 1,
1.048576, 0.3394597, 1.246123, 1, 0, 0, 1, 1,
1.054029, -0.9730688, 1.744559, 1, 0, 0, 1, 1,
1.055354, 0.5061646, 2.646336, 1, 0, 0, 1, 1,
1.056819, -0.4749582, 2.062608, 0, 0, 0, 1, 1,
1.059041, 2.322178, 1.28694, 0, 0, 0, 1, 1,
1.060959, -1.358324, 0.6587273, 0, 0, 0, 1, 1,
1.063073, -0.8421812, 2.178516, 0, 0, 0, 1, 1,
1.063837, -1.136388, 2.345772, 0, 0, 0, 1, 1,
1.064928, 0.9727921, 0.5767137, 0, 0, 0, 1, 1,
1.065235, -0.9594591, 2.26728, 0, 0, 0, 1, 1,
1.080914, -1.677839, 1.562671, 1, 1, 1, 1, 1,
1.094011, 0.5923271, 2.29106, 1, 1, 1, 1, 1,
1.094486, 0.817475, 0.8130013, 1, 1, 1, 1, 1,
1.097679, -0.5767608, 3.386007, 1, 1, 1, 1, 1,
1.097838, -0.9094351, 3.204793, 1, 1, 1, 1, 1,
1.098334, 0.5761843, 0.3266513, 1, 1, 1, 1, 1,
1.099284, -0.05778991, 2.662252, 1, 1, 1, 1, 1,
1.101575, 0.6098775, 0.01171494, 1, 1, 1, 1, 1,
1.102669, 0.3499715, 1.255406, 1, 1, 1, 1, 1,
1.113229, 1.188741, -0.06233637, 1, 1, 1, 1, 1,
1.117249, -0.1583473, -0.05292282, 1, 1, 1, 1, 1,
1.120055, 0.767372, -0.8296053, 1, 1, 1, 1, 1,
1.120268, -1.494919, 1.770035, 1, 1, 1, 1, 1,
1.123865, 1.19546, -0.905562, 1, 1, 1, 1, 1,
1.12573, -0.5431452, 0.7749933, 1, 1, 1, 1, 1,
1.13399, -0.4683501, 2.552468, 0, 0, 1, 1, 1,
1.142119, -1.975059, 3.716611, 1, 0, 0, 1, 1,
1.145624, 1.523956, 0.2730443, 1, 0, 0, 1, 1,
1.149519, -1.032836, 2.296869, 1, 0, 0, 1, 1,
1.151606, 0.1047173, 4.433374, 1, 0, 0, 1, 1,
1.162385, 1.956144, -0.02138964, 1, 0, 0, 1, 1,
1.169543, 1.350113, 1.458637, 0, 0, 0, 1, 1,
1.171172, -0.6128026, 2.221325, 0, 0, 0, 1, 1,
1.173669, 0.3859045, -1.035612, 0, 0, 0, 1, 1,
1.177788, -0.7212138, 1.17188, 0, 0, 0, 1, 1,
1.187801, 0.2286018, -1.200517, 0, 0, 0, 1, 1,
1.188046, -0.8038734, 2.694124, 0, 0, 0, 1, 1,
1.193084, -1.511439, 3.107785, 0, 0, 0, 1, 1,
1.19926, -1.861312, 4.212408, 1, 1, 1, 1, 1,
1.200811, -0.8517593, 1.731439, 1, 1, 1, 1, 1,
1.201556, 0.6969606, 1.969833, 1, 1, 1, 1, 1,
1.204209, 1.300055, 0.8194514, 1, 1, 1, 1, 1,
1.20479, -0.7180334, 1.00505, 1, 1, 1, 1, 1,
1.208768, 0.3076411, 1.325826, 1, 1, 1, 1, 1,
1.211954, -1.085151, 3.249586, 1, 1, 1, 1, 1,
1.216179, 0.2000502, 4.160378, 1, 1, 1, 1, 1,
1.216743, -0.5090696, 1.490742, 1, 1, 1, 1, 1,
1.217217, 0.2179579, 1.277099, 1, 1, 1, 1, 1,
1.228311, -0.15604, 1.134418, 1, 1, 1, 1, 1,
1.229588, 0.1460102, -0.8027825, 1, 1, 1, 1, 1,
1.242936, -1.798119, 0.8666046, 1, 1, 1, 1, 1,
1.250973, -0.5682131, 3.078043, 1, 1, 1, 1, 1,
1.269023, -1.049636, 0.8937045, 1, 1, 1, 1, 1,
1.27307, -1.5482, 1.56967, 0, 0, 1, 1, 1,
1.27672, -0.7541943, 2.109302, 1, 0, 0, 1, 1,
1.279822, -1.974568, -0.1385275, 1, 0, 0, 1, 1,
1.281768, -1.158926, 1.198725, 1, 0, 0, 1, 1,
1.293687, 2.053837, 0.2806536, 1, 0, 0, 1, 1,
1.300902, -0.7172484, 1.427113, 1, 0, 0, 1, 1,
1.315481, 0.5294871, 1.219437, 0, 0, 0, 1, 1,
1.316306, -0.3727178, 2.766863, 0, 0, 0, 1, 1,
1.319511, 0.6517088, 0.5191247, 0, 0, 0, 1, 1,
1.319979, 0.4224524, 1.885496, 0, 0, 0, 1, 1,
1.320821, 1.176365, 1.550517, 0, 0, 0, 1, 1,
1.321249, -0.4665641, 2.746219, 0, 0, 0, 1, 1,
1.323933, -0.2747373, 1.4162, 0, 0, 0, 1, 1,
1.34655, 0.726396, 3.318908, 1, 1, 1, 1, 1,
1.350059, 0.6837416, 1.611914, 1, 1, 1, 1, 1,
1.382709, 0.0711202, 0.4231822, 1, 1, 1, 1, 1,
1.394303, -0.9175295, 1.403017, 1, 1, 1, 1, 1,
1.402081, -0.5032166, 2.358248, 1, 1, 1, 1, 1,
1.405229, -0.9656394, 3.723512, 1, 1, 1, 1, 1,
1.411521, -1.199271, 2.115666, 1, 1, 1, 1, 1,
1.41384, 0.4584281, 1.403308, 1, 1, 1, 1, 1,
1.416756, 0.2234535, 1.092985, 1, 1, 1, 1, 1,
1.417824, 1.075265, 1.199951, 1, 1, 1, 1, 1,
1.422754, -0.818069, 4.882727, 1, 1, 1, 1, 1,
1.422756, 1.025692, 0.7727082, 1, 1, 1, 1, 1,
1.42317, 0.9646475, 1.006339, 1, 1, 1, 1, 1,
1.424631, 0.1394898, -0.0776842, 1, 1, 1, 1, 1,
1.430953, -3.226336, 2.827843, 1, 1, 1, 1, 1,
1.445058, 0.8380002, 0.9863199, 0, 0, 1, 1, 1,
1.452255, 0.100748, 2.117609, 1, 0, 0, 1, 1,
1.456364, 0.4042661, 0.9435601, 1, 0, 0, 1, 1,
1.463094, -1.64538, 1.098204, 1, 0, 0, 1, 1,
1.472008, -0.1354804, 0.9778285, 1, 0, 0, 1, 1,
1.490952, -0.7736884, 2.796521, 1, 0, 0, 1, 1,
1.507306, 0.7017615, 0.6921957, 0, 0, 0, 1, 1,
1.521093, 0.005554096, 2.313782, 0, 0, 0, 1, 1,
1.528227, 1.343656, 2.043097, 0, 0, 0, 1, 1,
1.528887, 0.1839507, 0.9824529, 0, 0, 0, 1, 1,
1.531755, 1.954297, -0.2057147, 0, 0, 0, 1, 1,
1.542908, 0.1573738, 1.564202, 0, 0, 0, 1, 1,
1.544962, 0.8047717, 1.962185, 0, 0, 0, 1, 1,
1.56049, 1.080165, -0.1916242, 1, 1, 1, 1, 1,
1.589779, 1.446626, 1.359939, 1, 1, 1, 1, 1,
1.59632, -0.708777, 0.9398942, 1, 1, 1, 1, 1,
1.596849, -0.1636163, 2.102496, 1, 1, 1, 1, 1,
1.603346, 1.195683, 1.035137, 1, 1, 1, 1, 1,
1.60983, -0.8862508, 3.265811, 1, 1, 1, 1, 1,
1.616384, -1.2834, 1.963055, 1, 1, 1, 1, 1,
1.624359, -1.53704, 1.069446, 1, 1, 1, 1, 1,
1.636422, -0.422796, 2.48634, 1, 1, 1, 1, 1,
1.68195, 0.8211917, 3.479513, 1, 1, 1, 1, 1,
1.687383, -0.5606591, 0.6571429, 1, 1, 1, 1, 1,
1.696405, -0.8609765, 4.808648, 1, 1, 1, 1, 1,
1.698487, 1.093266, -0.336223, 1, 1, 1, 1, 1,
1.710308, 0.3034279, 2.921956, 1, 1, 1, 1, 1,
1.710801, 0.5408778, 1.950036, 1, 1, 1, 1, 1,
1.753086, -1.061067, 2.370153, 0, 0, 1, 1, 1,
1.756993, -0.2786135, 2.233613, 1, 0, 0, 1, 1,
1.764272, -0.8070959, 1.367431, 1, 0, 0, 1, 1,
1.769898, -0.06592069, 1.840904, 1, 0, 0, 1, 1,
1.771461, 0.1129242, 2.274508, 1, 0, 0, 1, 1,
1.802316, 0.8341714, 1.033695, 1, 0, 0, 1, 1,
1.804252, 0.1555429, 2.344954, 0, 0, 0, 1, 1,
1.830395, 1.789852, -1.358687, 0, 0, 0, 1, 1,
1.832861, -0.6408073, 1.272216, 0, 0, 0, 1, 1,
1.834792, -0.3712534, 1.564625, 0, 0, 0, 1, 1,
1.835255, 0.9239443, 0.7575557, 0, 0, 0, 1, 1,
1.878642, 1.912612, 1.100244, 0, 0, 0, 1, 1,
1.879041, -1.50025, 1.889688, 0, 0, 0, 1, 1,
1.880378, -2.871155, 2.996317, 1, 1, 1, 1, 1,
1.88058, 1.490034, 1.407819, 1, 1, 1, 1, 1,
1.882368, -0.4642013, -0.4086798, 1, 1, 1, 1, 1,
1.894959, -1.21959, 1.536985, 1, 1, 1, 1, 1,
1.897352, 0.7422484, 2.029298, 1, 1, 1, 1, 1,
1.924671, 0.8382626, 1.023989, 1, 1, 1, 1, 1,
1.926866, -0.0766541, -0.03676809, 1, 1, 1, 1, 1,
1.981349, -0.5023721, 1.702822, 1, 1, 1, 1, 1,
1.99505, -1.396473, 3.17521, 1, 1, 1, 1, 1,
2.006456, 0.8915996, 2.620905, 1, 1, 1, 1, 1,
2.046303, -0.3164482, 0.3560761, 1, 1, 1, 1, 1,
2.049026, 1.222502, 1.228111, 1, 1, 1, 1, 1,
2.059767, -0.3539152, 1.625868, 1, 1, 1, 1, 1,
2.065351, -1.169886, -0.3520239, 1, 1, 1, 1, 1,
2.073294, -0.6658634, 3.184785, 1, 1, 1, 1, 1,
2.09881, 0.8837572, 1.150586, 0, 0, 1, 1, 1,
2.118568, -1.631557, 3.737827, 1, 0, 0, 1, 1,
2.128226, 0.3756807, 2.117819, 1, 0, 0, 1, 1,
2.13702, 0.2322667, 0.8493446, 1, 0, 0, 1, 1,
2.242114, -0.395883, 1.734385, 1, 0, 0, 1, 1,
2.267696, 0.6559472, 0.6405308, 1, 0, 0, 1, 1,
2.275717, 0.5404999, 2.136563, 0, 0, 0, 1, 1,
2.30267, 0.333157, 0.6409784, 0, 0, 0, 1, 1,
2.338969, 0.818094, 0.5940237, 0, 0, 0, 1, 1,
2.381641, 0.1374453, 1.286334, 0, 0, 0, 1, 1,
2.382842, -1.556763, 1.30221, 0, 0, 0, 1, 1,
2.417526, -2.497111, 3.228338, 0, 0, 0, 1, 1,
2.531535, 2.146883, 1.39033, 0, 0, 0, 1, 1,
2.569259, 0.6507725, 3.023853, 1, 1, 1, 1, 1,
2.705409, 0.2063167, 2.996136, 1, 1, 1, 1, 1,
2.722551, -0.591575, 1.825555, 1, 1, 1, 1, 1,
2.735383, -0.6957304, 0.5569584, 1, 1, 1, 1, 1,
2.822017, 0.308087, 1.109169, 1, 1, 1, 1, 1,
2.850286, 1.649523, 0.6691712, 1, 1, 1, 1, 1,
2.897967, -2.151737, 4.015388, 1, 1, 1, 1, 1
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
var radius = 9.578774;
var distance = 33.64504;
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
mvMatrix.translate( 0.08781469, 0.07391095, 0.6098073 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64504);
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
