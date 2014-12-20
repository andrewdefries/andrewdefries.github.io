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
-2.725316, -0.5578861, -3.001412, 1, 0, 0, 1,
-2.598519, -1.172526, -3.072066, 1, 0.007843138, 0, 1,
-2.56636, 0.3263133, 0.9661303, 1, 0.01176471, 0, 1,
-2.546041, -1.680477, -2.181052, 1, 0.01960784, 0, 1,
-2.414792, -0.4316818, -3.341498, 1, 0.02352941, 0, 1,
-2.382866, 0.8250444, -0.9599425, 1, 0.03137255, 0, 1,
-2.340516, -0.2450083, -1.485674, 1, 0.03529412, 0, 1,
-2.282224, 0.9395258, -1.699825, 1, 0.04313726, 0, 1,
-2.277775, 1.158274, -1.204589, 1, 0.04705882, 0, 1,
-2.235106, -0.7808586, -1.943821, 1, 0.05490196, 0, 1,
-2.127474, 0.6191551, -1.456309, 1, 0.05882353, 0, 1,
-2.09999, 0.1255199, -1.01974, 1, 0.06666667, 0, 1,
-2.098445, -1.140213, -2.20917, 1, 0.07058824, 0, 1,
-2.09757, -1.241344, -1.885042, 1, 0.07843138, 0, 1,
-2.081311, 1.115196, -0.4856505, 1, 0.08235294, 0, 1,
-2.03736, 1.663334, -1.909273, 1, 0.09019608, 0, 1,
-2.035489, 0.07459761, -1.580537, 1, 0.09411765, 0, 1,
-1.972392, 0.7571234, -1.1871, 1, 0.1019608, 0, 1,
-1.957437, 0.3293173, -0.8653755, 1, 0.1098039, 0, 1,
-1.945495, 0.719586, 0.5873275, 1, 0.1137255, 0, 1,
-1.85107, 0.5690503, -3.129419, 1, 0.1215686, 0, 1,
-1.832742, -0.3794173, -1.006413, 1, 0.1254902, 0, 1,
-1.805578, -1.347779, -2.641009, 1, 0.1333333, 0, 1,
-1.790918, 0.2860305, -1.373236, 1, 0.1372549, 0, 1,
-1.777677, 0.702618, -1.086684, 1, 0.145098, 0, 1,
-1.758161, -0.5531495, -1.612265, 1, 0.1490196, 0, 1,
-1.738108, -0.4588244, -1.527408, 1, 0.1568628, 0, 1,
-1.728844, -1.491865, -2.416873, 1, 0.1607843, 0, 1,
-1.726255, -0.09224145, -1.507162, 1, 0.1686275, 0, 1,
-1.719566, 0.07624096, -1.540008, 1, 0.172549, 0, 1,
-1.710802, 0.7481139, 0.7243521, 1, 0.1803922, 0, 1,
-1.702676, -0.5474849, -2.408211, 1, 0.1843137, 0, 1,
-1.685212, -0.7640671, -1.170301, 1, 0.1921569, 0, 1,
-1.679466, -0.1452961, -1.147447, 1, 0.1960784, 0, 1,
-1.649188, -0.2456633, -2.199585, 1, 0.2039216, 0, 1,
-1.644054, 1.260929, -0.6443285, 1, 0.2117647, 0, 1,
-1.62544, 0.2315788, -1.480453, 1, 0.2156863, 0, 1,
-1.624141, 1.935422, -1.038156, 1, 0.2235294, 0, 1,
-1.622428, -1.110703, -1.784957, 1, 0.227451, 0, 1,
-1.614579, 1.021378, -0.4036047, 1, 0.2352941, 0, 1,
-1.613889, -0.3558111, -2.64512, 1, 0.2392157, 0, 1,
-1.580973, 0.8573692, -0.7366856, 1, 0.2470588, 0, 1,
-1.568572, -1.483996, -1.835868, 1, 0.2509804, 0, 1,
-1.561617, 1.1869, 1.492669, 1, 0.2588235, 0, 1,
-1.559824, -0.4553287, -1.110867, 1, 0.2627451, 0, 1,
-1.557439, -0.6908221, -3.360193, 1, 0.2705882, 0, 1,
-1.510199, 1.229792, -0.09942888, 1, 0.2745098, 0, 1,
-1.504378, 0.9907803, -0.6783821, 1, 0.282353, 0, 1,
-1.496659, -0.3031002, -1.291122, 1, 0.2862745, 0, 1,
-1.493053, -0.7293932, -2.619628, 1, 0.2941177, 0, 1,
-1.491663, 0.006768978, -1.307945, 1, 0.3019608, 0, 1,
-1.474193, -0.7472162, -1.079559, 1, 0.3058824, 0, 1,
-1.468047, 1.553352, -2.044239, 1, 0.3137255, 0, 1,
-1.461037, -1.380863, -1.184209, 1, 0.3176471, 0, 1,
-1.442609, -1.00852, -2.625682, 1, 0.3254902, 0, 1,
-1.442098, -0.4253836, -2.968442, 1, 0.3294118, 0, 1,
-1.441573, -0.6201318, -1.991139, 1, 0.3372549, 0, 1,
-1.44109, -0.5594852, -1.89179, 1, 0.3411765, 0, 1,
-1.440693, 1.154161, -0.7687941, 1, 0.3490196, 0, 1,
-1.439187, -1.393734, -1.950433, 1, 0.3529412, 0, 1,
-1.436978, -0.0335182, -3.098609, 1, 0.3607843, 0, 1,
-1.431639, -1.667267, -2.274682, 1, 0.3647059, 0, 1,
-1.428797, -0.03615358, -2.181333, 1, 0.372549, 0, 1,
-1.428137, -0.01573051, -3.681296, 1, 0.3764706, 0, 1,
-1.427761, -1.967016, -3.376756, 1, 0.3843137, 0, 1,
-1.416381, 0.06401334, -2.458192, 1, 0.3882353, 0, 1,
-1.416146, 0.6077543, -0.2442272, 1, 0.3960784, 0, 1,
-1.415396, 2.039339, -0.8953538, 1, 0.4039216, 0, 1,
-1.413133, -0.05510061, -0.6367604, 1, 0.4078431, 0, 1,
-1.411559, -0.8878034, -0.8793175, 1, 0.4156863, 0, 1,
-1.410195, -1.26942, -1.357468, 1, 0.4196078, 0, 1,
-1.396124, 2.451574, -1.095111, 1, 0.427451, 0, 1,
-1.386522, 0.8790315, -0.008124799, 1, 0.4313726, 0, 1,
-1.382025, -0.7221187, -2.951745, 1, 0.4392157, 0, 1,
-1.380334, 0.1591224, -1.1049, 1, 0.4431373, 0, 1,
-1.375935, 2.133562, -1.694772, 1, 0.4509804, 0, 1,
-1.369973, 0.9502354, -2.351521, 1, 0.454902, 0, 1,
-1.354535, -1.643156, -3.183736, 1, 0.4627451, 0, 1,
-1.342273, 1.017268, 0.2353258, 1, 0.4666667, 0, 1,
-1.340819, -1.087155, -3.051849, 1, 0.4745098, 0, 1,
-1.339095, 1.336179, -0.7842164, 1, 0.4784314, 0, 1,
-1.335081, 0.4064924, 0.0186805, 1, 0.4862745, 0, 1,
-1.332568, -0.1547769, -0.2719208, 1, 0.4901961, 0, 1,
-1.320763, 0.6629053, -1.099226, 1, 0.4980392, 0, 1,
-1.318288, -1.449746, -3.442039, 1, 0.5058824, 0, 1,
-1.310001, 1.430032, -1.564641, 1, 0.509804, 0, 1,
-1.309564, -2.147821, -3.17081, 1, 0.5176471, 0, 1,
-1.307916, 0.9999716, -2.47163, 1, 0.5215687, 0, 1,
-1.306455, -0.7864858, -2.971524, 1, 0.5294118, 0, 1,
-1.30158, 1.387487, -1.218925, 1, 0.5333334, 0, 1,
-1.297851, -0.1350364, -0.9535441, 1, 0.5411765, 0, 1,
-1.297495, 1.457049, -1.626713, 1, 0.5450981, 0, 1,
-1.29436, 0.3808279, -2.730787, 1, 0.5529412, 0, 1,
-1.272386, 1.781055, -0.6918683, 1, 0.5568628, 0, 1,
-1.269563, -0.01522273, -2.56907, 1, 0.5647059, 0, 1,
-1.250826, 0.0144193, -0.8602431, 1, 0.5686275, 0, 1,
-1.249062, 0.6362747, 0.9207322, 1, 0.5764706, 0, 1,
-1.24407, 1.956868, 1.34805, 1, 0.5803922, 0, 1,
-1.243634, -0.4184636, -0.8289446, 1, 0.5882353, 0, 1,
-1.239894, -0.3638492, -0.2478, 1, 0.5921569, 0, 1,
-1.236405, -0.09479415, 0.6632698, 1, 0.6, 0, 1,
-1.22489, -0.3018556, -2.753213, 1, 0.6078432, 0, 1,
-1.218675, 0.3359869, -2.500277, 1, 0.6117647, 0, 1,
-1.217539, 0.4828985, -3.078824, 1, 0.6196079, 0, 1,
-1.216617, -0.9348647, -4.30529, 1, 0.6235294, 0, 1,
-1.21299, -0.2257915, -2.827396, 1, 0.6313726, 0, 1,
-1.210568, 0.7580895, -1.275571, 1, 0.6352941, 0, 1,
-1.210165, 0.8665559, 0.4841502, 1, 0.6431373, 0, 1,
-1.199533, 0.05304161, -1.492158, 1, 0.6470588, 0, 1,
-1.195652, -1.706902, -1.395113, 1, 0.654902, 0, 1,
-1.193274, 0.2782994, -3.01589, 1, 0.6588235, 0, 1,
-1.190972, -1.608702, -4.086022, 1, 0.6666667, 0, 1,
-1.185599, -0.9629414, -2.828942, 1, 0.6705883, 0, 1,
-1.18131, -1.347629, -5.180775, 1, 0.6784314, 0, 1,
-1.180643, -0.7943485, -0.04849747, 1, 0.682353, 0, 1,
-1.175941, -0.08898868, -2.319168, 1, 0.6901961, 0, 1,
-1.168833, -0.99709, -2.397657, 1, 0.6941177, 0, 1,
-1.16776, 1.425602, 2.157727, 1, 0.7019608, 0, 1,
-1.166567, 0.9172202, -2.0431, 1, 0.7098039, 0, 1,
-1.16157, 2.492547, -1.39733, 1, 0.7137255, 0, 1,
-1.155402, -0.8237358, -1.301457, 1, 0.7215686, 0, 1,
-1.15187, -0.9039184, -3.009332, 1, 0.7254902, 0, 1,
-1.150735, 0.6583154, -0.1043229, 1, 0.7333333, 0, 1,
-1.149244, 2.050609, -0.6871275, 1, 0.7372549, 0, 1,
-1.147757, 0.6652831, -1.351671, 1, 0.7450981, 0, 1,
-1.14706, 0.2214117, -1.754245, 1, 0.7490196, 0, 1,
-1.142042, -0.3042594, -2.234921, 1, 0.7568628, 0, 1,
-1.139963, -1.257428, -3.168603, 1, 0.7607843, 0, 1,
-1.13775, 0.677223, -0.4139589, 1, 0.7686275, 0, 1,
-1.136833, -0.5075713, -1.964966, 1, 0.772549, 0, 1,
-1.13541, -0.2093924, -2.223864, 1, 0.7803922, 0, 1,
-1.133857, -0.8241573, -3.443265, 1, 0.7843137, 0, 1,
-1.130145, -0.5446071, -1.955313, 1, 0.7921569, 0, 1,
-1.124473, -0.05067253, -1.833207, 1, 0.7960784, 0, 1,
-1.118364, 0.6118997, -0.3640764, 1, 0.8039216, 0, 1,
-1.114489, -0.4053171, -0.5814125, 1, 0.8117647, 0, 1,
-1.101715, -0.7392036, -4.388541, 1, 0.8156863, 0, 1,
-1.097491, 0.2708953, -0.5361077, 1, 0.8235294, 0, 1,
-1.092615, -0.6696668, -1.777716, 1, 0.827451, 0, 1,
-1.091929, -0.6662669, -1.394787, 1, 0.8352941, 0, 1,
-1.077057, -0.791301, -0.3465893, 1, 0.8392157, 0, 1,
-1.074172, 0.1867466, -2.899775, 1, 0.8470588, 0, 1,
-1.067076, -0.4424922, -1.780266, 1, 0.8509804, 0, 1,
-1.062725, 1.337033, -0.3559868, 1, 0.8588235, 0, 1,
-1.06103, 1.291571, 0.9095036, 1, 0.8627451, 0, 1,
-1.06037, -1.908884, -1.389854, 1, 0.8705882, 0, 1,
-1.060302, -1.116173, -1.150607, 1, 0.8745098, 0, 1,
-1.059286, -0.8026649, -3.111193, 1, 0.8823529, 0, 1,
-1.057907, 1.319517, -1.961519, 1, 0.8862745, 0, 1,
-1.053015, -2.935362, -2.115209, 1, 0.8941177, 0, 1,
-1.033736, 1.853473, -0.6773967, 1, 0.8980392, 0, 1,
-1.027241, -0.6177079, -2.824541, 1, 0.9058824, 0, 1,
-1.026006, 1.283745, -0.3573694, 1, 0.9137255, 0, 1,
-1.023406, -0.5118806, -2.889229, 1, 0.9176471, 0, 1,
-1.020078, 0.3863109, -1.026806, 1, 0.9254902, 0, 1,
-1.013733, 1.0842, -0.5635618, 1, 0.9294118, 0, 1,
-1.008985, -1.062796, -2.265066, 1, 0.9372549, 0, 1,
-1.007923, -0.2925818, -0.7516657, 1, 0.9411765, 0, 1,
-1.000396, -0.6066774, -1.987137, 1, 0.9490196, 0, 1,
-0.9983708, -0.2710694, -2.564941, 1, 0.9529412, 0, 1,
-0.9907013, 2.215682, -0.7853665, 1, 0.9607843, 0, 1,
-0.9846646, -0.5914564, -1.284477, 1, 0.9647059, 0, 1,
-0.9788235, 0.09432411, -1.057523, 1, 0.972549, 0, 1,
-0.9752977, 1.246325, 0.9027135, 1, 0.9764706, 0, 1,
-0.9729348, 0.8249477, -2.054035, 1, 0.9843137, 0, 1,
-0.9631103, -1.983917, -3.102958, 1, 0.9882353, 0, 1,
-0.9619828, -2.404312, -1.668485, 1, 0.9960784, 0, 1,
-0.9616127, 2.17745, 0.3953351, 0.9960784, 1, 0, 1,
-0.9567412, -0.3177244, -2.776078, 0.9921569, 1, 0, 1,
-0.9474883, -0.5263664, -2.635032, 0.9843137, 1, 0, 1,
-0.9407016, 0.08985925, -1.276178, 0.9803922, 1, 0, 1,
-0.9397746, 2.284128, -0.02386023, 0.972549, 1, 0, 1,
-0.939262, 1.738422, 0.03697093, 0.9686275, 1, 0, 1,
-0.9355554, -0.5062694, -2.996047, 0.9607843, 1, 0, 1,
-0.9333228, -0.8354729, -2.277922, 0.9568627, 1, 0, 1,
-0.9305208, -1.48617, -4.729243, 0.9490196, 1, 0, 1,
-0.9291437, 1.224959, -0.099177, 0.945098, 1, 0, 1,
-0.9147577, 0.2407389, -0.5545909, 0.9372549, 1, 0, 1,
-0.9090313, 2.047775, -1.927264, 0.9333333, 1, 0, 1,
-0.8984885, 0.4055622, -0.8365676, 0.9254902, 1, 0, 1,
-0.895453, -1.003337, -1.837003, 0.9215686, 1, 0, 1,
-0.8951218, -1.116773, -1.340539, 0.9137255, 1, 0, 1,
-0.8907548, 1.177045, -1.964942, 0.9098039, 1, 0, 1,
-0.8904731, -0.3068431, -2.174819, 0.9019608, 1, 0, 1,
-0.8867044, 0.3178504, -3.423856, 0.8941177, 1, 0, 1,
-0.8858009, -2.850413, -1.692016, 0.8901961, 1, 0, 1,
-0.8824142, -0.0260777, -1.859884, 0.8823529, 1, 0, 1,
-0.87583, -0.03875903, -1.261176, 0.8784314, 1, 0, 1,
-0.8752737, -0.2235744, -0.8409401, 0.8705882, 1, 0, 1,
-0.874148, -0.8694925, -1.104418, 0.8666667, 1, 0, 1,
-0.8730396, -0.7353039, -3.080117, 0.8588235, 1, 0, 1,
-0.8677531, -0.5426109, -0.6783545, 0.854902, 1, 0, 1,
-0.8662743, -0.8968794, -2.283904, 0.8470588, 1, 0, 1,
-0.8647874, -1.617974, -2.329644, 0.8431373, 1, 0, 1,
-0.8639593, -0.1410657, -0.1197326, 0.8352941, 1, 0, 1,
-0.8623919, 0.1007227, -2.62625, 0.8313726, 1, 0, 1,
-0.860728, -0.009201051, 0.124495, 0.8235294, 1, 0, 1,
-0.8600084, -0.7031821, -2.847582, 0.8196079, 1, 0, 1,
-0.8593557, -1.013194, -1.358574, 0.8117647, 1, 0, 1,
-0.8462322, -0.1808189, -2.870284, 0.8078431, 1, 0, 1,
-0.8451611, -1.635851, -3.149493, 0.8, 1, 0, 1,
-0.8416755, 0.2043806, -2.331706, 0.7921569, 1, 0, 1,
-0.8394619, -0.04960696, -2.444393, 0.7882353, 1, 0, 1,
-0.8382456, -1.211122, -1.847065, 0.7803922, 1, 0, 1,
-0.8324989, 0.5824336, 0.8544722, 0.7764706, 1, 0, 1,
-0.8313321, -0.5253381, -3.772753, 0.7686275, 1, 0, 1,
-0.8279534, 2.288357, -1.304404, 0.7647059, 1, 0, 1,
-0.8115352, 0.394015, 0.6452218, 0.7568628, 1, 0, 1,
-0.8113701, -0.9749646, -3.074463, 0.7529412, 1, 0, 1,
-0.8091653, 0.3580905, 0.06442452, 0.7450981, 1, 0, 1,
-0.8074226, -1.364075, -1.883705, 0.7411765, 1, 0, 1,
-0.807366, 1.282235, -1.158218, 0.7333333, 1, 0, 1,
-0.8063162, 0.2226153, -2.111202, 0.7294118, 1, 0, 1,
-0.805532, -0.6657427, -2.380545, 0.7215686, 1, 0, 1,
-0.8048392, -0.402747, -3.26473, 0.7176471, 1, 0, 1,
-0.8016235, -1.880709, -2.706757, 0.7098039, 1, 0, 1,
-0.8012453, 1.657898, 0.3533504, 0.7058824, 1, 0, 1,
-0.7983371, 2.505755, -0.5887319, 0.6980392, 1, 0, 1,
-0.7957218, -0.1949305, -2.380264, 0.6901961, 1, 0, 1,
-0.7942234, -2.532787, -2.02768, 0.6862745, 1, 0, 1,
-0.792864, 0.5531607, -0.9291961, 0.6784314, 1, 0, 1,
-0.7879982, 1.944195, -1.357629, 0.6745098, 1, 0, 1,
-0.786594, -0.07086001, -3.093672, 0.6666667, 1, 0, 1,
-0.7852286, -0.1051768, -1.361934, 0.6627451, 1, 0, 1,
-0.7780864, 2.734585, -2.092162, 0.654902, 1, 0, 1,
-0.7761026, -0.9572861, -2.598169, 0.6509804, 1, 0, 1,
-0.7751434, 1.35498, -1.026804, 0.6431373, 1, 0, 1,
-0.7743958, -0.05464408, -3.419057, 0.6392157, 1, 0, 1,
-0.764924, -0.4994802, -3.552458, 0.6313726, 1, 0, 1,
-0.7579708, 0.2164358, -1.110372, 0.627451, 1, 0, 1,
-0.7540332, -2.334267, -3.653613, 0.6196079, 1, 0, 1,
-0.74977, 0.4454709, 1.144575, 0.6156863, 1, 0, 1,
-0.749369, 1.283008, -0.5719249, 0.6078432, 1, 0, 1,
-0.7445977, -1.605388, -3.575531, 0.6039216, 1, 0, 1,
-0.7441229, -0.05303244, -0.416203, 0.5960785, 1, 0, 1,
-0.7414477, 0.4548958, 0.4161296, 0.5882353, 1, 0, 1,
-0.7405869, -0.423115, -1.847036, 0.5843138, 1, 0, 1,
-0.7390524, -1.212586, -3.966901, 0.5764706, 1, 0, 1,
-0.7380876, 0.821748, -1.031202, 0.572549, 1, 0, 1,
-0.7338456, 0.4904777, -0.7465774, 0.5647059, 1, 0, 1,
-0.7271637, -0.8013941, -1.852449, 0.5607843, 1, 0, 1,
-0.726404, -0.2598812, -1.018042, 0.5529412, 1, 0, 1,
-0.7224114, -1.192123, -1.989538, 0.5490196, 1, 0, 1,
-0.7214883, -0.7024571, -1.094089, 0.5411765, 1, 0, 1,
-0.7180849, -1.006208, -3.361908, 0.5372549, 1, 0, 1,
-0.7122986, -0.6383141, -1.562793, 0.5294118, 1, 0, 1,
-0.7087695, 0.5824081, -3.307784, 0.5254902, 1, 0, 1,
-0.7084121, 0.6699317, -0.0119357, 0.5176471, 1, 0, 1,
-0.7068292, -0.2817856, -2.488766, 0.5137255, 1, 0, 1,
-0.7053655, 1.114382, -0.7762178, 0.5058824, 1, 0, 1,
-0.7048015, -0.02197081, -2.30394, 0.5019608, 1, 0, 1,
-0.7007491, 0.1616119, -0.6946672, 0.4941176, 1, 0, 1,
-0.7003676, 0.3985234, 1.390091, 0.4862745, 1, 0, 1,
-0.6967791, 1.777788, 0.1561251, 0.4823529, 1, 0, 1,
-0.6963207, -1.48661, -4.394963, 0.4745098, 1, 0, 1,
-0.693572, 0.02429071, -0.3232699, 0.4705882, 1, 0, 1,
-0.6933746, -0.3629647, -1.917172, 0.4627451, 1, 0, 1,
-0.6933174, 0.2836048, -2.136022, 0.4588235, 1, 0, 1,
-0.6926616, 0.987676, 0.4981542, 0.4509804, 1, 0, 1,
-0.6862258, 0.7157253, -0.4646641, 0.4470588, 1, 0, 1,
-0.6828305, 0.2723277, -0.7882823, 0.4392157, 1, 0, 1,
-0.6822659, 0.7616221, -1.795864, 0.4352941, 1, 0, 1,
-0.6775951, -1.755161, -1.481297, 0.427451, 1, 0, 1,
-0.6773317, 1.306625, -1.179096, 0.4235294, 1, 0, 1,
-0.6711555, 0.4298966, -2.523942, 0.4156863, 1, 0, 1,
-0.6663809, -0.03804775, -1.119346, 0.4117647, 1, 0, 1,
-0.6654857, -0.4298065, -1.715869, 0.4039216, 1, 0, 1,
-0.6581656, -0.2656827, -3.344453, 0.3960784, 1, 0, 1,
-0.6572596, -0.7036297, -2.605976, 0.3921569, 1, 0, 1,
-0.6532039, 0.5571615, -1.999603, 0.3843137, 1, 0, 1,
-0.6504801, -0.783807, -0.7602194, 0.3803922, 1, 0, 1,
-0.6454481, -2.596542, -3.391394, 0.372549, 1, 0, 1,
-0.6445001, 1.405949, -0.1498825, 0.3686275, 1, 0, 1,
-0.6432892, -0.8929422, -1.875128, 0.3607843, 1, 0, 1,
-0.6397368, -0.05959273, -2.108605, 0.3568628, 1, 0, 1,
-0.6347782, -2.217137, -2.500504, 0.3490196, 1, 0, 1,
-0.6336151, 0.879339, -1.076462, 0.345098, 1, 0, 1,
-0.6304654, 0.5620994, -1.217243, 0.3372549, 1, 0, 1,
-0.6300586, 0.1811868, -2.797547, 0.3333333, 1, 0, 1,
-0.6291713, 1.149423, -0.2394866, 0.3254902, 1, 0, 1,
-0.6183934, -1.711304, -2.312675, 0.3215686, 1, 0, 1,
-0.6163418, -0.8858829, -3.204463, 0.3137255, 1, 0, 1,
-0.6137432, 0.09230048, -2.015577, 0.3098039, 1, 0, 1,
-0.6135624, -0.5454192, -0.7743974, 0.3019608, 1, 0, 1,
-0.6078261, 1.647632, -1.274415, 0.2941177, 1, 0, 1,
-0.6076658, 0.06328335, -1.215123, 0.2901961, 1, 0, 1,
-0.6041082, -1.05817, -2.529726, 0.282353, 1, 0, 1,
-0.5989869, -0.1696244, -1.128671, 0.2784314, 1, 0, 1,
-0.5955883, -0.3199589, -1.90107, 0.2705882, 1, 0, 1,
-0.5903613, 0.1601, -1.965359, 0.2666667, 1, 0, 1,
-0.5897779, -2.240528, -3.487446, 0.2588235, 1, 0, 1,
-0.5848589, -0.1702716, -2.569966, 0.254902, 1, 0, 1,
-0.584827, 1.20072, -0.9722393, 0.2470588, 1, 0, 1,
-0.5845123, 1.144871, 1.675445, 0.2431373, 1, 0, 1,
-0.5793617, 0.05782288, -2.878872, 0.2352941, 1, 0, 1,
-0.5658159, 1.088369, 1.169232, 0.2313726, 1, 0, 1,
-0.5655366, -1.363739, -3.180282, 0.2235294, 1, 0, 1,
-0.56552, -0.3686078, -2.745988, 0.2196078, 1, 0, 1,
-0.5652061, 1.344712, -0.9384202, 0.2117647, 1, 0, 1,
-0.561012, 0.395222, -0.5069345, 0.2078431, 1, 0, 1,
-0.5582957, 0.8635834, 0.4783507, 0.2, 1, 0, 1,
-0.5525945, -0.06637856, -4.759256, 0.1921569, 1, 0, 1,
-0.54416, -1.795141, -3.012809, 0.1882353, 1, 0, 1,
-0.5427322, 2.231962, -0.5180991, 0.1803922, 1, 0, 1,
-0.5397239, 0.6947397, -0.2910395, 0.1764706, 1, 0, 1,
-0.5387344, 0.7333385, -0.736208, 0.1686275, 1, 0, 1,
-0.5370901, 0.2185766, -1.962252, 0.1647059, 1, 0, 1,
-0.531626, -1.917922, -2.67975, 0.1568628, 1, 0, 1,
-0.53048, 1.224067, 0.7020334, 0.1529412, 1, 0, 1,
-0.5122456, -0.9273126, -3.293789, 0.145098, 1, 0, 1,
-0.5112812, 0.6440576, -0.6661454, 0.1411765, 1, 0, 1,
-0.5055029, -1.206227, -3.783522, 0.1333333, 1, 0, 1,
-0.504726, -0.09111834, -3.647569, 0.1294118, 1, 0, 1,
-0.5042462, 1.924459, -0.1997369, 0.1215686, 1, 0, 1,
-0.499667, -1.745078, -1.845573, 0.1176471, 1, 0, 1,
-0.4916128, -0.2785891, -1.768438, 0.1098039, 1, 0, 1,
-0.4908832, -0.6574917, -3.805943, 0.1058824, 1, 0, 1,
-0.4854313, -0.3595535, -2.461303, 0.09803922, 1, 0, 1,
-0.4839549, -0.6060486, -2.41153, 0.09019608, 1, 0, 1,
-0.4770122, 0.4952644, -1.336244, 0.08627451, 1, 0, 1,
-0.4755021, 0.9673104, 0.7727323, 0.07843138, 1, 0, 1,
-0.4748668, 0.6981195, -1.984911, 0.07450981, 1, 0, 1,
-0.47169, -1.024202, -3.410362, 0.06666667, 1, 0, 1,
-0.4701425, -0.798626, -0.8750778, 0.0627451, 1, 0, 1,
-0.4690521, 2.087024, 0.1284552, 0.05490196, 1, 0, 1,
-0.4668444, -0.1272062, -2.421263, 0.05098039, 1, 0, 1,
-0.4631585, -0.5870642, -3.890228, 0.04313726, 1, 0, 1,
-0.4585476, -0.4063956, 0.3003445, 0.03921569, 1, 0, 1,
-0.4560356, -0.06817143, -1.417678, 0.03137255, 1, 0, 1,
-0.4520521, -1.348731, -1.654552, 0.02745098, 1, 0, 1,
-0.4510648, -0.6797965, -4.303393, 0.01960784, 1, 0, 1,
-0.4463907, 0.1541089, 0.03949382, 0.01568628, 1, 0, 1,
-0.4399713, 2.030709, 0.07765281, 0.007843138, 1, 0, 1,
-0.4395152, 0.487496, -0.8344912, 0.003921569, 1, 0, 1,
-0.4374158, -0.2348077, -3.110219, 0, 1, 0.003921569, 1,
-0.4364007, -0.7204808, -3.472893, 0, 1, 0.01176471, 1,
-0.4259296, 0.4466238, -0.824559, 0, 1, 0.01568628, 1,
-0.4249727, 1.100945, -0.5071121, 0, 1, 0.02352941, 1,
-0.4245872, -0.1950371, -2.449259, 0, 1, 0.02745098, 1,
-0.4242617, -2.159353, -4.060765, 0, 1, 0.03529412, 1,
-0.4225108, -1.01594, -2.038884, 0, 1, 0.03921569, 1,
-0.4221545, -0.8229031, -4.200053, 0, 1, 0.04705882, 1,
-0.4208468, -0.7555262, -2.634228, 0, 1, 0.05098039, 1,
-0.420132, 0.7151054, 0.9642365, 0, 1, 0.05882353, 1,
-0.4181458, -0.1086446, -0.2405427, 0, 1, 0.0627451, 1,
-0.417102, -0.9117607, -2.275781, 0, 1, 0.07058824, 1,
-0.4129767, -0.06508441, -2.884484, 0, 1, 0.07450981, 1,
-0.4114209, 1.109611, -0.832178, 0, 1, 0.08235294, 1,
-0.410567, -0.4254847, -1.794614, 0, 1, 0.08627451, 1,
-0.4083298, 1.681334, -3.122144, 0, 1, 0.09411765, 1,
-0.4062251, 0.9137173, 0.3173879, 0, 1, 0.1019608, 1,
-0.4045992, -0.112814, -2.57492, 0, 1, 0.1058824, 1,
-0.4030623, 0.08588696, -1.817282, 0, 1, 0.1137255, 1,
-0.3897051, -0.9930249, -3.471472, 0, 1, 0.1176471, 1,
-0.389065, -0.4925311, -3.538038, 0, 1, 0.1254902, 1,
-0.3853941, 0.9130884, 0.5674682, 0, 1, 0.1294118, 1,
-0.3836514, -0.1364422, -3.527076, 0, 1, 0.1372549, 1,
-0.3818651, 0.7669825, 1.094438, 0, 1, 0.1411765, 1,
-0.3791551, 1.115688, -0.8223016, 0, 1, 0.1490196, 1,
-0.37861, -0.3638349, -3.830745, 0, 1, 0.1529412, 1,
-0.3781481, 0.4395493, -0.08170745, 0, 1, 0.1607843, 1,
-0.3780553, 0.02127038, -1.194083, 0, 1, 0.1647059, 1,
-0.3776277, 1.168326, 0.04783221, 0, 1, 0.172549, 1,
-0.3767745, 1.481117, 1.819031, 0, 1, 0.1764706, 1,
-0.3742976, 0.8895934, -0.6420939, 0, 1, 0.1843137, 1,
-0.3732008, -1.258564, -1.850178, 0, 1, 0.1882353, 1,
-0.3692702, -0.01527058, -1.265214, 0, 1, 0.1960784, 1,
-0.3624768, 0.1062734, -1.220826, 0, 1, 0.2039216, 1,
-0.3612057, -0.5459115, -2.593519, 0, 1, 0.2078431, 1,
-0.3565144, -0.8503365, -4.093157, 0, 1, 0.2156863, 1,
-0.3543705, -0.4391785, -0.52327, 0, 1, 0.2196078, 1,
-0.3537798, 0.6397243, 1.448898, 0, 1, 0.227451, 1,
-0.353111, -0.5937026, -3.373515, 0, 1, 0.2313726, 1,
-0.3494618, -1.135736, -1.285883, 0, 1, 0.2392157, 1,
-0.346714, 0.4701601, -0.2842869, 0, 1, 0.2431373, 1,
-0.3459621, 0.4914055, -0.1621813, 0, 1, 0.2509804, 1,
-0.3436581, -0.5329282, -1.933455, 0, 1, 0.254902, 1,
-0.3434795, -1.28916, -1.678146, 0, 1, 0.2627451, 1,
-0.3425978, -0.6192102, -2.980982, 0, 1, 0.2666667, 1,
-0.3409238, -0.9838626, -2.344791, 0, 1, 0.2745098, 1,
-0.3388514, -0.07869408, -1.961172, 0, 1, 0.2784314, 1,
-0.3357975, 0.7766204, 0.0331427, 0, 1, 0.2862745, 1,
-0.3346803, -0.2713116, -1.82856, 0, 1, 0.2901961, 1,
-0.333763, -0.4041243, -3.795102, 0, 1, 0.2980392, 1,
-0.3315442, 1.875697, 0.1635048, 0, 1, 0.3058824, 1,
-0.327662, 0.6069776, -1.66011, 0, 1, 0.3098039, 1,
-0.3238325, 0.447421, -1.61265, 0, 1, 0.3176471, 1,
-0.3214068, 1.524538, -0.5979823, 0, 1, 0.3215686, 1,
-0.3177787, -0.4024963, -3.49214, 0, 1, 0.3294118, 1,
-0.3172415, 1.470012, 2.207852, 0, 1, 0.3333333, 1,
-0.3098006, 0.5952138, -0.4603355, 0, 1, 0.3411765, 1,
-0.3050645, -1.554812, -2.082165, 0, 1, 0.345098, 1,
-0.3008233, 0.8663834, -0.5778282, 0, 1, 0.3529412, 1,
-0.2996912, -0.7183361, -2.248525, 0, 1, 0.3568628, 1,
-0.2982724, -0.1840571, -0.21184, 0, 1, 0.3647059, 1,
-0.2930704, 1.770346, -1.825293, 0, 1, 0.3686275, 1,
-0.2920932, -0.07097151, -1.23617, 0, 1, 0.3764706, 1,
-0.2903053, -0.3859014, -4.126739, 0, 1, 0.3803922, 1,
-0.2854953, 0.6556339, -1.82026, 0, 1, 0.3882353, 1,
-0.2843381, -0.2708353, -2.949233, 0, 1, 0.3921569, 1,
-0.2824707, -0.8402327, -3.951489, 0, 1, 0.4, 1,
-0.2792721, 0.1474227, -1.959383, 0, 1, 0.4078431, 1,
-0.2753944, -0.7007019, -3.567068, 0, 1, 0.4117647, 1,
-0.2748885, 0.7186688, -2.310385, 0, 1, 0.4196078, 1,
-0.2736121, -1.540881, -3.054789, 0, 1, 0.4235294, 1,
-0.2711616, -0.5107383, -3.948596, 0, 1, 0.4313726, 1,
-0.2700046, 1.681922, 0.000957359, 0, 1, 0.4352941, 1,
-0.2668041, -1.131826, -3.346322, 0, 1, 0.4431373, 1,
-0.2641124, 0.3436904, -0.9842346, 0, 1, 0.4470588, 1,
-0.2635171, -2.065782, -2.387685, 0, 1, 0.454902, 1,
-0.2606353, -1.272372, -3.425378, 0, 1, 0.4588235, 1,
-0.2596824, 0.1114958, -1.825486, 0, 1, 0.4666667, 1,
-0.2498199, 2.83925, 0.5752804, 0, 1, 0.4705882, 1,
-0.2497914, 0.4024656, 0.5270311, 0, 1, 0.4784314, 1,
-0.2493979, 0.08164319, -2.099781, 0, 1, 0.4823529, 1,
-0.2489706, -1.283454, -3.30118, 0, 1, 0.4901961, 1,
-0.2475672, -0.3141487, -1.173342, 0, 1, 0.4941176, 1,
-0.2455174, 0.2250263, 0.01352053, 0, 1, 0.5019608, 1,
-0.2405356, -0.2565963, -1.389679, 0, 1, 0.509804, 1,
-0.2370949, 0.202049, 0.3584014, 0, 1, 0.5137255, 1,
-0.2285535, -1.327611, -2.726643, 0, 1, 0.5215687, 1,
-0.2280818, -1.319072, -2.130141, 0, 1, 0.5254902, 1,
-0.2226094, -0.4518582, -3.360275, 0, 1, 0.5333334, 1,
-0.2126597, 2.614972, 0.8292241, 0, 1, 0.5372549, 1,
-0.2069705, -0.8132064, -3.663403, 0, 1, 0.5450981, 1,
-0.2069419, 0.944474, 0.5557909, 0, 1, 0.5490196, 1,
-0.206464, 1.870902, -0.1235335, 0, 1, 0.5568628, 1,
-0.2054276, 0.8472818, -0.5451161, 0, 1, 0.5607843, 1,
-0.2048612, -0.6519179, -2.691051, 0, 1, 0.5686275, 1,
-0.1998813, -1.289065, -2.660541, 0, 1, 0.572549, 1,
-0.1920652, -1.654493, -3.039422, 0, 1, 0.5803922, 1,
-0.1908208, -0.8755584, -1.682644, 0, 1, 0.5843138, 1,
-0.1901073, -0.2331861, -1.984148, 0, 1, 0.5921569, 1,
-0.1883471, -0.7861698, -2.943182, 0, 1, 0.5960785, 1,
-0.1740981, 1.486054, -0.0149039, 0, 1, 0.6039216, 1,
-0.1710949, 0.7315713, -1.164222, 0, 1, 0.6117647, 1,
-0.1705275, 1.247594, 0.778955, 0, 1, 0.6156863, 1,
-0.1678578, -0.6923223, -2.83858, 0, 1, 0.6235294, 1,
-0.165582, 1.126077, -0.1942539, 0, 1, 0.627451, 1,
-0.1629007, 1.433521, -0.2273327, 0, 1, 0.6352941, 1,
-0.1593147, 1.210892, -0.9297006, 0, 1, 0.6392157, 1,
-0.1559623, 0.06457397, -0.712559, 0, 1, 0.6470588, 1,
-0.1548551, -1.033448, -2.309679, 0, 1, 0.6509804, 1,
-0.1545481, -0.7410676, -1.889817, 0, 1, 0.6588235, 1,
-0.153592, -0.03299709, -0.4461883, 0, 1, 0.6627451, 1,
-0.1517847, 1.648739, 0.88609, 0, 1, 0.6705883, 1,
-0.1497581, 0.3156229, -0.5392759, 0, 1, 0.6745098, 1,
-0.1406412, 0.1682802, -2.446171, 0, 1, 0.682353, 1,
-0.1392052, 0.5321774, -0.4357777, 0, 1, 0.6862745, 1,
-0.1380414, 0.3238574, -1.486315, 0, 1, 0.6941177, 1,
-0.1377835, 0.6068764, -0.4056856, 0, 1, 0.7019608, 1,
-0.1355955, -1.056982, -3.365559, 0, 1, 0.7058824, 1,
-0.1352094, 0.2850672, 0.5190456, 0, 1, 0.7137255, 1,
-0.1296665, 1.273677, -1.089625, 0, 1, 0.7176471, 1,
-0.1247147, -0.5172954, -4.358868, 0, 1, 0.7254902, 1,
-0.1226324, -0.8449429, -4.160997, 0, 1, 0.7294118, 1,
-0.1213402, 1.535416, -0.5995554, 0, 1, 0.7372549, 1,
-0.1207665, 1.404465, 0.8023174, 0, 1, 0.7411765, 1,
-0.1199235, 0.01860582, -4.093961, 0, 1, 0.7490196, 1,
-0.1187328, -1.139612, -4.221001, 0, 1, 0.7529412, 1,
-0.1113656, 1.139043, -0.1240395, 0, 1, 0.7607843, 1,
-0.1007572, -1.139366, -3.785996, 0, 1, 0.7647059, 1,
-0.09721038, 0.6455969, -1.142444, 0, 1, 0.772549, 1,
-0.09604833, 1.062023, 0.7096298, 0, 1, 0.7764706, 1,
-0.09420969, 0.8630098, 0.01040758, 0, 1, 0.7843137, 1,
-0.0919792, -1.596866, -1.725101, 0, 1, 0.7882353, 1,
-0.08709545, -0.3032223, -2.401739, 0, 1, 0.7960784, 1,
-0.08556934, -0.205666, -4.269098, 0, 1, 0.8039216, 1,
-0.08331886, -0.7480484, -3.457116, 0, 1, 0.8078431, 1,
-0.08220755, 0.9174734, 0.2361537, 0, 1, 0.8156863, 1,
-0.07804386, 0.2623517, 0.322679, 0, 1, 0.8196079, 1,
-0.0774077, -1.766357, -2.334524, 0, 1, 0.827451, 1,
-0.07497897, -1.15384, -1.874104, 0, 1, 0.8313726, 1,
-0.07035717, 0.7271685, -0.9035841, 0, 1, 0.8392157, 1,
-0.06994439, 1.831509, -0.003340625, 0, 1, 0.8431373, 1,
-0.06886008, 0.4904376, 1.018738, 0, 1, 0.8509804, 1,
-0.06641685, 0.9905089, 0.9984685, 0, 1, 0.854902, 1,
-0.06601536, 0.2864925, -0.714643, 0, 1, 0.8627451, 1,
-0.06510366, 0.06742655, -1.497937, 0, 1, 0.8666667, 1,
-0.06015956, -0.04841071, -1.844339, 0, 1, 0.8745098, 1,
-0.0542864, 0.9510996, 1.031899, 0, 1, 0.8784314, 1,
-0.05217527, 0.8161088, 0.9441162, 0, 1, 0.8862745, 1,
-0.05039573, -0.8195379, -2.314878, 0, 1, 0.8901961, 1,
-0.04800316, -0.4103147, -2.974313, 0, 1, 0.8980392, 1,
-0.04525742, -1.027302, -3.591993, 0, 1, 0.9058824, 1,
-0.04274066, -0.3633275, -4.095489, 0, 1, 0.9098039, 1,
-0.03834988, -2.045565, -3.661143, 0, 1, 0.9176471, 1,
-0.03433581, -0.04330018, -3.519391, 0, 1, 0.9215686, 1,
-0.02510249, 0.6718632, 0.5340874, 0, 1, 0.9294118, 1,
-0.02105516, 1.138552, 1.815675, 0, 1, 0.9333333, 1,
-0.01812922, 0.3692899, -0.2766592, 0, 1, 0.9411765, 1,
-0.01773528, 1.046189, 0.4305341, 0, 1, 0.945098, 1,
-0.01737647, 0.5111777, 0.28214, 0, 1, 0.9529412, 1,
-0.0129537, 1.61497, 0.4317961, 0, 1, 0.9568627, 1,
-0.01290706, 1.417007, 0.2957008, 0, 1, 0.9647059, 1,
-0.01285949, 1.806024, 0.4293267, 0, 1, 0.9686275, 1,
-0.01266646, 0.4417589, 1.793535, 0, 1, 0.9764706, 1,
-0.01151934, 0.638257, -0.5254524, 0, 1, 0.9803922, 1,
-0.009733687, 0.5243478, 0.5883296, 0, 1, 0.9882353, 1,
-0.006869295, 1.208366, 0.1506098, 0, 1, 0.9921569, 1,
-0.004618241, 1.232398, -0.467822, 0, 1, 1, 1,
-0.002129862, 0.0812895, 0.6920493, 0, 0.9921569, 1, 1,
-0.001133839, -0.9868454, -2.878133, 0, 0.9882353, 1, 1,
0.007741109, 0.1089606, 0.2508272, 0, 0.9803922, 1, 1,
0.008327003, -0.7983506, 5.583591, 0, 0.9764706, 1, 1,
0.009382717, -1.885178, 3.819307, 0, 0.9686275, 1, 1,
0.01119561, -0.3016958, 4.23407, 0, 0.9647059, 1, 1,
0.01149209, 0.04176362, -0.4585125, 0, 0.9568627, 1, 1,
0.01164012, -1.091385, 3.489926, 0, 0.9529412, 1, 1,
0.01450923, 2.318286, 0.9185339, 0, 0.945098, 1, 1,
0.01609737, -0.3643449, 3.031467, 0, 0.9411765, 1, 1,
0.01703633, -0.2094571, 1.809688, 0, 0.9333333, 1, 1,
0.01842525, -1.203318, 1.973099, 0, 0.9294118, 1, 1,
0.01973987, 0.6393315, 1.219215, 0, 0.9215686, 1, 1,
0.02843429, -2.156765, 3.495323, 0, 0.9176471, 1, 1,
0.02893045, 0.4842495, 0.08640891, 0, 0.9098039, 1, 1,
0.02936145, -0.3274746, 2.609847, 0, 0.9058824, 1, 1,
0.03329813, 0.05861239, -0.9485681, 0, 0.8980392, 1, 1,
0.03376723, 1.795765, 0.3764067, 0, 0.8901961, 1, 1,
0.03381128, 0.7089498, -0.7428987, 0, 0.8862745, 1, 1,
0.04327156, -0.4176025, 3.098788, 0, 0.8784314, 1, 1,
0.04353644, 0.6707225, 0.6391131, 0, 0.8745098, 1, 1,
0.0482315, 0.217548, 0.5426421, 0, 0.8666667, 1, 1,
0.04985599, 0.8790219, 0.2028589, 0, 0.8627451, 1, 1,
0.05304132, 0.6636277, -0.04731594, 0, 0.854902, 1, 1,
0.05318547, -1.990945, 3.875272, 0, 0.8509804, 1, 1,
0.0559281, 0.523519, 0.8115673, 0, 0.8431373, 1, 1,
0.05998022, 2.150211, -0.6527269, 0, 0.8392157, 1, 1,
0.06221586, 0.448365, 0.6146384, 0, 0.8313726, 1, 1,
0.06282131, -1.324497, 4.743878, 0, 0.827451, 1, 1,
0.06333349, -0.05860935, 2.361473, 0, 0.8196079, 1, 1,
0.06351521, 0.2755743, 0.8956508, 0, 0.8156863, 1, 1,
0.06538627, 0.4166485, -1.413719, 0, 0.8078431, 1, 1,
0.07004896, 0.8369014, -0.2804763, 0, 0.8039216, 1, 1,
0.07563068, 0.37596, -0.6722931, 0, 0.7960784, 1, 1,
0.07606784, -0.3307474, 3.107799, 0, 0.7882353, 1, 1,
0.0790811, -0.1949423, 2.184626, 0, 0.7843137, 1, 1,
0.07925679, -1.29486, 4.695965, 0, 0.7764706, 1, 1,
0.07993118, 0.4928947, 0.246283, 0, 0.772549, 1, 1,
0.08021633, 0.4339848, 1.299389, 0, 0.7647059, 1, 1,
0.08195119, 0.5376429, 0.07651898, 0, 0.7607843, 1, 1,
0.08408118, -0.3914937, 3.840411, 0, 0.7529412, 1, 1,
0.1017479, 0.08466884, -0.5478492, 0, 0.7490196, 1, 1,
0.1029562, -1.117, 1.777816, 0, 0.7411765, 1, 1,
0.1107056, 0.2128797, 0.7664416, 0, 0.7372549, 1, 1,
0.1124182, 0.5737118, -0.1670087, 0, 0.7294118, 1, 1,
0.1144338, 0.9246073, 0.3305613, 0, 0.7254902, 1, 1,
0.1158048, -3.090634, 4.161352, 0, 0.7176471, 1, 1,
0.1166412, 0.1814899, -1.03043, 0, 0.7137255, 1, 1,
0.1176936, 0.2836263, -2.177223, 0, 0.7058824, 1, 1,
0.1198097, 1.650935, -0.4653569, 0, 0.6980392, 1, 1,
0.1276582, -0.2552942, 3.717032, 0, 0.6941177, 1, 1,
0.1323953, 0.7703708, -1.948049, 0, 0.6862745, 1, 1,
0.1337046, 0.6125799, 0.826904, 0, 0.682353, 1, 1,
0.1357067, 0.4475904, 0.4162168, 0, 0.6745098, 1, 1,
0.1392329, 1.387709, 0.4448766, 0, 0.6705883, 1, 1,
0.1399216, -0.8530225, 3.854922, 0, 0.6627451, 1, 1,
0.1404786, -0.3530364, 3.513829, 0, 0.6588235, 1, 1,
0.1404859, -0.1450682, 2.132687, 0, 0.6509804, 1, 1,
0.1444672, 1.038765, 0.4543337, 0, 0.6470588, 1, 1,
0.1482709, -1.96863, 3.164867, 0, 0.6392157, 1, 1,
0.154886, -2.134824, 4.163262, 0, 0.6352941, 1, 1,
0.1651933, 1.386812, 0.6236262, 0, 0.627451, 1, 1,
0.166125, 0.08027418, 0.8189677, 0, 0.6235294, 1, 1,
0.1667667, 0.2006897, 0.9717562, 0, 0.6156863, 1, 1,
0.1700802, 0.4037909, -0.1410213, 0, 0.6117647, 1, 1,
0.1730662, 0.1735998, 0.4250834, 0, 0.6039216, 1, 1,
0.1737095, 0.7856905, 2.024828, 0, 0.5960785, 1, 1,
0.1738659, -1.641158, 2.690797, 0, 0.5921569, 1, 1,
0.1741444, 0.681761, -1.137971, 0, 0.5843138, 1, 1,
0.1760538, 1.178732, -0.6391373, 0, 0.5803922, 1, 1,
0.1837531, -1.012631, 2.710363, 0, 0.572549, 1, 1,
0.187128, 0.5655382, 0.2580548, 0, 0.5686275, 1, 1,
0.1896878, 1.511531, -0.1444868, 0, 0.5607843, 1, 1,
0.1943538, 0.5084688, 1.963446, 0, 0.5568628, 1, 1,
0.1992229, 0.0417423, 1.892176, 0, 0.5490196, 1, 1,
0.2005509, 0.9205108, -0.764692, 0, 0.5450981, 1, 1,
0.2025332, -1.738436, 4.410742, 0, 0.5372549, 1, 1,
0.2025573, -0.8863699, 4.722037, 0, 0.5333334, 1, 1,
0.2046136, 0.8450748, 1.27188, 0, 0.5254902, 1, 1,
0.2070748, -1.398709, 3.277858, 0, 0.5215687, 1, 1,
0.2100163, 1.5048, -0.03924619, 0, 0.5137255, 1, 1,
0.2110867, 0.8821772, -0.2742374, 0, 0.509804, 1, 1,
0.2127475, 0.9983471, -0.9056253, 0, 0.5019608, 1, 1,
0.2129506, 0.8129026, -0.3014317, 0, 0.4941176, 1, 1,
0.213897, 0.5528086, 0.01542919, 0, 0.4901961, 1, 1,
0.2159124, -1.417061, 3.744776, 0, 0.4823529, 1, 1,
0.2193821, -0.9009983, 2.908848, 0, 0.4784314, 1, 1,
0.226215, -0.5831057, 2.449396, 0, 0.4705882, 1, 1,
0.2283352, -1.259802, 2.864256, 0, 0.4666667, 1, 1,
0.2296242, -0.7288226, 2.448013, 0, 0.4588235, 1, 1,
0.2306651, -0.4902254, 3.490168, 0, 0.454902, 1, 1,
0.2308502, -1.739402, 1.481833, 0, 0.4470588, 1, 1,
0.2326864, 0.8880986, 0.3391721, 0, 0.4431373, 1, 1,
0.2352509, 0.9433434, -0.1273673, 0, 0.4352941, 1, 1,
0.2381383, 0.3944088, 1.250424, 0, 0.4313726, 1, 1,
0.2429076, 1.307487, -0.7875378, 0, 0.4235294, 1, 1,
0.2432476, -0.715633, 0.7704635, 0, 0.4196078, 1, 1,
0.2435427, -0.2614976, 2.041129, 0, 0.4117647, 1, 1,
0.2437502, -0.294592, 1.240374, 0, 0.4078431, 1, 1,
0.2465844, 1.857998, -0.9670899, 0, 0.4, 1, 1,
0.2484681, -0.08745099, 2.103968, 0, 0.3921569, 1, 1,
0.2509672, 0.0214914, 2.210875, 0, 0.3882353, 1, 1,
0.2535621, 0.8478378, 0.9204519, 0, 0.3803922, 1, 1,
0.2549058, 0.8776589, -1.47972, 0, 0.3764706, 1, 1,
0.2558821, 0.3037698, -1.626711, 0, 0.3686275, 1, 1,
0.2563345, -1.693473, 3.001137, 0, 0.3647059, 1, 1,
0.2563789, -1.574139, 3.408395, 0, 0.3568628, 1, 1,
0.2609918, -1.430248, 2.992719, 0, 0.3529412, 1, 1,
0.2617883, 0.7444777, 1.106116, 0, 0.345098, 1, 1,
0.2706877, -1.232928, 3.567186, 0, 0.3411765, 1, 1,
0.2707301, 0.005305978, 2.311158, 0, 0.3333333, 1, 1,
0.2740708, 0.3590667, -0.05062185, 0, 0.3294118, 1, 1,
0.2750456, 1.546584, -0.5041654, 0, 0.3215686, 1, 1,
0.2779063, 0.524434, 0.7256051, 0, 0.3176471, 1, 1,
0.2783128, 0.1592903, 1.931785, 0, 0.3098039, 1, 1,
0.2810204, 1.001954, 0.1416027, 0, 0.3058824, 1, 1,
0.2841418, -0.3509985, 3.250124, 0, 0.2980392, 1, 1,
0.2852476, -0.5179381, 2.52715, 0, 0.2901961, 1, 1,
0.289382, -1.159585, 4.154934, 0, 0.2862745, 1, 1,
0.2895685, -0.1396018, 1.029973, 0, 0.2784314, 1, 1,
0.2897978, 0.8713955, -0.3271098, 0, 0.2745098, 1, 1,
0.2907102, -2.129597, 1.519281, 0, 0.2666667, 1, 1,
0.2940165, 0.3769261, 0.1535711, 0, 0.2627451, 1, 1,
0.295014, -1.193066, 2.950098, 0, 0.254902, 1, 1,
0.3029907, -0.2843556, 1.252996, 0, 0.2509804, 1, 1,
0.3054235, -0.3316166, 1.521625, 0, 0.2431373, 1, 1,
0.3064755, -0.7396343, 4.640304, 0, 0.2392157, 1, 1,
0.3096298, 0.9109451, -0.5443493, 0, 0.2313726, 1, 1,
0.3111713, -1.074852, 3.278399, 0, 0.227451, 1, 1,
0.3116628, 0.03937255, 0.8505781, 0, 0.2196078, 1, 1,
0.3178535, -0.1397028, 3.080775, 0, 0.2156863, 1, 1,
0.3190343, -0.05528812, 2.074783, 0, 0.2078431, 1, 1,
0.3212048, 0.188162, 0.746428, 0, 0.2039216, 1, 1,
0.3276821, 1.439464, 0.01766278, 0, 0.1960784, 1, 1,
0.3323195, 1.146098, 1.162441, 0, 0.1882353, 1, 1,
0.3390097, -2.106727, 2.426842, 0, 0.1843137, 1, 1,
0.3455594, 0.2230218, 1.869295, 0, 0.1764706, 1, 1,
0.3460461, -2.208469, 1.764157, 0, 0.172549, 1, 1,
0.3474105, 0.3835079, -0.09649288, 0, 0.1647059, 1, 1,
0.3527358, 0.5121666, 0.4802485, 0, 0.1607843, 1, 1,
0.3534799, 0.2424874, -0.09743501, 0, 0.1529412, 1, 1,
0.360319, -0.8935542, 3.697004, 0, 0.1490196, 1, 1,
0.365277, 2.269035, 0.8972391, 0, 0.1411765, 1, 1,
0.3656609, 0.3215027, -0.2521634, 0, 0.1372549, 1, 1,
0.3775581, -1.039222, 3.529284, 0, 0.1294118, 1, 1,
0.3776235, 0.02551372, 0.5175347, 0, 0.1254902, 1, 1,
0.3777733, -1.033384, 2.21569, 0, 0.1176471, 1, 1,
0.3840035, 0.1292761, 2.24598, 0, 0.1137255, 1, 1,
0.3855962, -1.994844, 3.058056, 0, 0.1058824, 1, 1,
0.3879432, -1.199597, 2.284797, 0, 0.09803922, 1, 1,
0.3915684, -1.032789, 2.205099, 0, 0.09411765, 1, 1,
0.39547, -0.430519, 2.367012, 0, 0.08627451, 1, 1,
0.3995919, -0.9212726, 2.465464, 0, 0.08235294, 1, 1,
0.3997352, 0.8303331, 1.8275, 0, 0.07450981, 1, 1,
0.4013855, -1.448395, 1.933477, 0, 0.07058824, 1, 1,
0.4067466, -0.151769, 2.273866, 0, 0.0627451, 1, 1,
0.4096642, -2.01092, 2.908014, 0, 0.05882353, 1, 1,
0.4117228, -2.16942, 2.509823, 0, 0.05098039, 1, 1,
0.4231097, 0.5080448, -0.5071499, 0, 0.04705882, 1, 1,
0.4271431, 0.6897786, 0.1595646, 0, 0.03921569, 1, 1,
0.4280515, 0.03704249, 1.824755, 0, 0.03529412, 1, 1,
0.4300378, -0.2661567, 2.410282, 0, 0.02745098, 1, 1,
0.4314934, 0.6069139, 1.022274, 0, 0.02352941, 1, 1,
0.4321651, -0.5732407, 2.292778, 0, 0.01568628, 1, 1,
0.4403327, -1.209303, 3.6184, 0, 0.01176471, 1, 1,
0.4421903, 0.3166076, 2.353074, 0, 0.003921569, 1, 1,
0.4422675, 1.409005, 0.9012349, 0.003921569, 0, 1, 1,
0.4461367, 0.3775352, 0.1994559, 0.007843138, 0, 1, 1,
0.4471757, 1.090658, 0.5819386, 0.01568628, 0, 1, 1,
0.448393, 0.410908, 0.548261, 0.01960784, 0, 1, 1,
0.4498638, 1.085485, 0.380353, 0.02745098, 0, 1, 1,
0.4573208, -0.008133484, 0.02368225, 0.03137255, 0, 1, 1,
0.4577832, -0.5710094, 2.472269, 0.03921569, 0, 1, 1,
0.4577942, 2.138956, -0.1911108, 0.04313726, 0, 1, 1,
0.4584306, 1.767372, -1.136197, 0.05098039, 0, 1, 1,
0.4634911, 0.5931315, 0.8064469, 0.05490196, 0, 1, 1,
0.4655173, -0.5226539, 3.608407, 0.0627451, 0, 1, 1,
0.4740153, -0.4706681, 1.991289, 0.06666667, 0, 1, 1,
0.47403, 0.506012, 0.8445823, 0.07450981, 0, 1, 1,
0.4766992, -1.042969, 2.383482, 0.07843138, 0, 1, 1,
0.4837818, 0.1087606, 1.464934, 0.08627451, 0, 1, 1,
0.4840975, -1.234001, 2.214003, 0.09019608, 0, 1, 1,
0.4843776, -0.3376924, 1.311608, 0.09803922, 0, 1, 1,
0.4853746, 1.299276, 0.7710183, 0.1058824, 0, 1, 1,
0.4877718, 0.8958146, 0.9041159, 0.1098039, 0, 1, 1,
0.4913278, -2.388386, 3.922427, 0.1176471, 0, 1, 1,
0.5008073, 1.370842, 0.878245, 0.1215686, 0, 1, 1,
0.5036166, 0.2169464, 1.233361, 0.1294118, 0, 1, 1,
0.5036755, -0.4929381, 2.278071, 0.1333333, 0, 1, 1,
0.5053041, -2.134562, 1.816423, 0.1411765, 0, 1, 1,
0.5115832, 0.4770496, -0.3160946, 0.145098, 0, 1, 1,
0.5143811, -0.469838, 3.117868, 0.1529412, 0, 1, 1,
0.5150769, 0.245675, 1.811821, 0.1568628, 0, 1, 1,
0.5157392, -0.7752469, 3.538428, 0.1647059, 0, 1, 1,
0.5158976, 0.07848582, 2.023951, 0.1686275, 0, 1, 1,
0.5165383, 0.4560387, 0.4822066, 0.1764706, 0, 1, 1,
0.5167109, 1.180014, 1.518019, 0.1803922, 0, 1, 1,
0.5217459, 0.7775415, 2.256567, 0.1882353, 0, 1, 1,
0.5238765, -0.4284292, 1.500848, 0.1921569, 0, 1, 1,
0.5261896, 0.02530479, 2.806545, 0.2, 0, 1, 1,
0.527793, -0.3906697, 2.025986, 0.2078431, 0, 1, 1,
0.5351127, 0.8306584, 0.4358033, 0.2117647, 0, 1, 1,
0.5375419, 0.5401481, -1.079534, 0.2196078, 0, 1, 1,
0.5392198, -0.7017505, 2.571268, 0.2235294, 0, 1, 1,
0.5410804, 1.78834, -0.1827124, 0.2313726, 0, 1, 1,
0.5467981, 0.01132405, 1.143399, 0.2352941, 0, 1, 1,
0.5495098, -0.3255772, 3.050717, 0.2431373, 0, 1, 1,
0.5514297, 0.6188867, -0.3369724, 0.2470588, 0, 1, 1,
0.5531307, -0.2749378, 1.739535, 0.254902, 0, 1, 1,
0.5540212, 0.8325391, 1.3909, 0.2588235, 0, 1, 1,
0.5543126, -0.5452411, 0.8244874, 0.2666667, 0, 1, 1,
0.5575924, 0.05470163, 0.2995601, 0.2705882, 0, 1, 1,
0.562669, -0.3204545, -0.7716832, 0.2784314, 0, 1, 1,
0.5632308, 0.333622, -0.5238156, 0.282353, 0, 1, 1,
0.5661374, -1.540044, 4.137568, 0.2901961, 0, 1, 1,
0.5664686, -0.005860806, 1.921852, 0.2941177, 0, 1, 1,
0.5691963, -1.422314, 2.510789, 0.3019608, 0, 1, 1,
0.5704174, -1.48222, 3.153127, 0.3098039, 0, 1, 1,
0.5774714, -0.2919591, 0.8087441, 0.3137255, 0, 1, 1,
0.580633, -0.7834613, 2.464124, 0.3215686, 0, 1, 1,
0.5808269, 0.4073341, -1.058753, 0.3254902, 0, 1, 1,
0.5815682, 2.092068, 0.6268032, 0.3333333, 0, 1, 1,
0.5840641, -0.6970845, 3.286265, 0.3372549, 0, 1, 1,
0.5905738, 2.18747, 1.894809, 0.345098, 0, 1, 1,
0.5910358, 0.3764527, 0.9882758, 0.3490196, 0, 1, 1,
0.5917002, 0.06509325, 0.3699456, 0.3568628, 0, 1, 1,
0.5941972, -1.230049, 1.999337, 0.3607843, 0, 1, 1,
0.5952083, -1.207254, 2.077847, 0.3686275, 0, 1, 1,
0.5972685, -0.3649415, 1.863015, 0.372549, 0, 1, 1,
0.5980536, 0.08420569, 1.850739, 0.3803922, 0, 1, 1,
0.6017698, -0.7238337, 1.08424, 0.3843137, 0, 1, 1,
0.6034818, 0.02674598, 0.07249004, 0.3921569, 0, 1, 1,
0.6037472, 0.8043532, -0.3354205, 0.3960784, 0, 1, 1,
0.6074722, -0.231528, 2.446954, 0.4039216, 0, 1, 1,
0.6099572, 0.144688, 2.45683, 0.4117647, 0, 1, 1,
0.6099831, 0.4106093, -0.253262, 0.4156863, 0, 1, 1,
0.6161598, -1.24514, 2.846927, 0.4235294, 0, 1, 1,
0.6235552, -1.304946, 1.686045, 0.427451, 0, 1, 1,
0.6293796, -3.186582, 2.442609, 0.4352941, 0, 1, 1,
0.6320647, 0.189554, 2.372123, 0.4392157, 0, 1, 1,
0.6323518, -0.1231338, 2.592106, 0.4470588, 0, 1, 1,
0.632876, 0.8308108, -0.6758212, 0.4509804, 0, 1, 1,
0.635666, -1.244261, 3.892271, 0.4588235, 0, 1, 1,
0.6397675, 0.3513945, 0.2096885, 0.4627451, 0, 1, 1,
0.6407487, 0.1212219, 1.083259, 0.4705882, 0, 1, 1,
0.6454353, 0.6306162, 0.4368172, 0.4745098, 0, 1, 1,
0.6482617, -0.9544545, 1.3209, 0.4823529, 0, 1, 1,
0.6629318, -1.147615, 0.6181213, 0.4862745, 0, 1, 1,
0.6644585, 0.3927505, 0.7006837, 0.4941176, 0, 1, 1,
0.6654127, -0.5392387, 2.331475, 0.5019608, 0, 1, 1,
0.6657366, -1.02819, 1.911611, 0.5058824, 0, 1, 1,
0.6658709, 0.4159251, 1.965336, 0.5137255, 0, 1, 1,
0.6670701, -0.6668189, 2.545144, 0.5176471, 0, 1, 1,
0.6695347, 1.492989, -1.273156, 0.5254902, 0, 1, 1,
0.6794339, -2.441515, 3.020357, 0.5294118, 0, 1, 1,
0.6877195, 1.904404, -0.2744965, 0.5372549, 0, 1, 1,
0.6915844, -0.6948655, 3.071462, 0.5411765, 0, 1, 1,
0.6937334, 0.1392538, 0.4581278, 0.5490196, 0, 1, 1,
0.694937, -0.8206959, 3.472351, 0.5529412, 0, 1, 1,
0.7112095, -1.087956, 2.95782, 0.5607843, 0, 1, 1,
0.7251093, 1.137815, 0.3314679, 0.5647059, 0, 1, 1,
0.7294289, 0.7522005, 0.9937944, 0.572549, 0, 1, 1,
0.7296079, -0.9692547, 2.538116, 0.5764706, 0, 1, 1,
0.7336245, 0.07991447, -0.2250541, 0.5843138, 0, 1, 1,
0.7357866, -2.15723, 2.799, 0.5882353, 0, 1, 1,
0.7364461, -0.5343869, 0.8938347, 0.5960785, 0, 1, 1,
0.7372507, -0.7907243, 3.691348, 0.6039216, 0, 1, 1,
0.7385747, -0.639605, 0.8737499, 0.6078432, 0, 1, 1,
0.7403533, 0.2391426, 1.369868, 0.6156863, 0, 1, 1,
0.7420846, -0.03748662, 1.295837, 0.6196079, 0, 1, 1,
0.7431414, 0.1557421, 1.241267, 0.627451, 0, 1, 1,
0.7476337, -0.5450279, 1.201897, 0.6313726, 0, 1, 1,
0.7517312, -0.3452114, 2.227025, 0.6392157, 0, 1, 1,
0.7564114, 0.3671677, 1.637947, 0.6431373, 0, 1, 1,
0.7570943, 1.166834, 0.1547208, 0.6509804, 0, 1, 1,
0.7637622, -0.2610615, 2.873952, 0.654902, 0, 1, 1,
0.7686381, -0.4919071, 3.486961, 0.6627451, 0, 1, 1,
0.7709112, -0.860665, 2.996373, 0.6666667, 0, 1, 1,
0.7713697, -2.300957, 3.783631, 0.6745098, 0, 1, 1,
0.7755114, -0.1107233, 0.2054667, 0.6784314, 0, 1, 1,
0.7844555, -1.461055, 1.103578, 0.6862745, 0, 1, 1,
0.7845312, -1.886855, 1.833288, 0.6901961, 0, 1, 1,
0.7851628, 0.374319, 2.553174, 0.6980392, 0, 1, 1,
0.7878546, -0.3529713, 3.16457, 0.7058824, 0, 1, 1,
0.7881982, 0.3401676, 1.334318, 0.7098039, 0, 1, 1,
0.7898433, 0.6089613, -0.1785543, 0.7176471, 0, 1, 1,
0.7900105, -0.5017133, 1.105571, 0.7215686, 0, 1, 1,
0.7972171, 0.4573237, 1.336375, 0.7294118, 0, 1, 1,
0.8014625, -0.1623374, 3.804953, 0.7333333, 0, 1, 1,
0.8024685, 1.459185, -0.1665791, 0.7411765, 0, 1, 1,
0.8026685, 0.1029698, 1.105543, 0.7450981, 0, 1, 1,
0.8088714, 0.8225253, 0.5226184, 0.7529412, 0, 1, 1,
0.8120325, 0.1299499, 2.399507, 0.7568628, 0, 1, 1,
0.8122361, -0.5668756, 3.722261, 0.7647059, 0, 1, 1,
0.8132921, -1.949553, 1.272928, 0.7686275, 0, 1, 1,
0.8146929, -0.4427432, 2.889141, 0.7764706, 0, 1, 1,
0.8170548, 0.4762182, -0.3845523, 0.7803922, 0, 1, 1,
0.8180032, -0.1354621, 1.216396, 0.7882353, 0, 1, 1,
0.8194659, 3.536362, 0.292037, 0.7921569, 0, 1, 1,
0.8219115, 0.8785444, 0.8945901, 0.8, 0, 1, 1,
0.8244808, -0.57042, 4.970013, 0.8078431, 0, 1, 1,
0.8264802, -1.8395, 2.313384, 0.8117647, 0, 1, 1,
0.8267869, -1.120615, 2.432288, 0.8196079, 0, 1, 1,
0.8277853, -0.4471884, 2.519418, 0.8235294, 0, 1, 1,
0.8360079, 1.294242, 1.211386, 0.8313726, 0, 1, 1,
0.8479698, -0.2952038, 1.992986, 0.8352941, 0, 1, 1,
0.8509042, -0.1933275, 0.6423362, 0.8431373, 0, 1, 1,
0.8544081, -0.5164247, 4.189544, 0.8470588, 0, 1, 1,
0.8559888, -0.439181, 1.932576, 0.854902, 0, 1, 1,
0.8578768, -0.6472975, 4.219925, 0.8588235, 0, 1, 1,
0.8626047, -1.886141, 2.017644, 0.8666667, 0, 1, 1,
0.8641486, 1.397438, 1.103707, 0.8705882, 0, 1, 1,
0.869034, -0.1537144, 2.334893, 0.8784314, 0, 1, 1,
0.8773811, -0.438959, 2.532024, 0.8823529, 0, 1, 1,
0.8774002, 0.1153897, 1.484874, 0.8901961, 0, 1, 1,
0.88583, 0.3369344, 0.2802524, 0.8941177, 0, 1, 1,
0.8900796, 0.9552616, 0.4729916, 0.9019608, 0, 1, 1,
0.8926448, -0.8831258, 3.173397, 0.9098039, 0, 1, 1,
0.8937904, 2.720595, 1.087624, 0.9137255, 0, 1, 1,
0.8999504, 0.1988181, 2.486769, 0.9215686, 0, 1, 1,
0.9046844, 0.2765678, 1.751144, 0.9254902, 0, 1, 1,
0.9048299, -0.2440319, 2.401232, 0.9333333, 0, 1, 1,
0.9071171, -0.1471254, 1.157111, 0.9372549, 0, 1, 1,
0.9084952, 1.656806, 1.115488, 0.945098, 0, 1, 1,
0.9249647, -0.395919, 1.580337, 0.9490196, 0, 1, 1,
0.9253375, 0.2895699, 2.417987, 0.9568627, 0, 1, 1,
0.9385458, 0.02024095, 3.222771, 0.9607843, 0, 1, 1,
0.9416585, 0.484732, 1.19541, 0.9686275, 0, 1, 1,
0.9444021, -0.4774205, 3.398592, 0.972549, 0, 1, 1,
0.9448403, -0.4793078, 1.623147, 0.9803922, 0, 1, 1,
0.9454707, -0.1352855, 3.83835, 0.9843137, 0, 1, 1,
0.9477464, 0.3865404, 0.8369059, 0.9921569, 0, 1, 1,
0.9479012, -1.083344, 2.846758, 0.9960784, 0, 1, 1,
0.9494098, 0.1431085, 2.309345, 1, 0, 0.9960784, 1,
0.9547243, 1.792405, -0.4241419, 1, 0, 0.9882353, 1,
0.9598477, 0.590475, 1.290119, 1, 0, 0.9843137, 1,
0.9608096, 0.6889204, 0.05075141, 1, 0, 0.9764706, 1,
0.9609924, 0.7639554, -0.3432305, 1, 0, 0.972549, 1,
0.9626751, 1.239831, 0.5701009, 1, 0, 0.9647059, 1,
0.9654875, -0.3225005, 1.872138, 1, 0, 0.9607843, 1,
0.9692615, 0.9001387, 0.5401296, 1, 0, 0.9529412, 1,
0.9730753, 0.3770557, 0.8602585, 1, 0, 0.9490196, 1,
0.9754081, 0.3283181, 1.440217, 1, 0, 0.9411765, 1,
0.9818652, -0.5267906, 2.151622, 1, 0, 0.9372549, 1,
0.9949545, -0.9355605, 3.433698, 1, 0, 0.9294118, 1,
0.9961123, -0.2607043, 2.999779, 1, 0, 0.9254902, 1,
1.005732, 0.4171532, 1.656304, 1, 0, 0.9176471, 1,
1.008123, 0.1531379, 2.282916, 1, 0, 0.9137255, 1,
1.013824, 0.504845, -0.07299845, 1, 0, 0.9058824, 1,
1.022599, -0.4383123, 0.06126635, 1, 0, 0.9019608, 1,
1.023402, 0.1005371, 3.099511, 1, 0, 0.8941177, 1,
1.024829, -0.7385319, 2.038949, 1, 0, 0.8862745, 1,
1.02523, 0.8267091, 2.283847, 1, 0, 0.8823529, 1,
1.029104, -0.6769305, 1.777591, 1, 0, 0.8745098, 1,
1.031413, -1.559015, 2.017333, 1, 0, 0.8705882, 1,
1.035926, 0.809176, 0.8182518, 1, 0, 0.8627451, 1,
1.04186, 1.324018, 1.801049, 1, 0, 0.8588235, 1,
1.044008, 0.2942673, 1.172356, 1, 0, 0.8509804, 1,
1.046705, 0.1073392, 2.040074, 1, 0, 0.8470588, 1,
1.067558, -1.128078, -0.4320602, 1, 0, 0.8392157, 1,
1.077772, -0.2998309, 2.769274, 1, 0, 0.8352941, 1,
1.079129, -0.6696292, 1.716866, 1, 0, 0.827451, 1,
1.082046, 1.296395, 0.6975453, 1, 0, 0.8235294, 1,
1.082595, -0.9167853, 2.13185, 1, 0, 0.8156863, 1,
1.087031, 1.080267, -0.7218389, 1, 0, 0.8117647, 1,
1.093043, -0.3239412, 1.233485, 1, 0, 0.8039216, 1,
1.108302, 0.6885349, 2.452103, 1, 0, 0.7960784, 1,
1.115839, -0.7950445, 1.97835, 1, 0, 0.7921569, 1,
1.121394, -0.9488732, 1.955167, 1, 0, 0.7843137, 1,
1.126651, 0.4652673, 0.1556664, 1, 0, 0.7803922, 1,
1.127239, -1.08498, 1.477172, 1, 0, 0.772549, 1,
1.136501, -1.139362, 1.38555, 1, 0, 0.7686275, 1,
1.138562, 0.6838753, 1.140153, 1, 0, 0.7607843, 1,
1.140477, -0.2742688, 1.123357, 1, 0, 0.7568628, 1,
1.141451, 1.830194, -0.5272471, 1, 0, 0.7490196, 1,
1.14176, 1.363453, 1.67237, 1, 0, 0.7450981, 1,
1.14497, -0.3866288, 1.222012, 1, 0, 0.7372549, 1,
1.149613, 0.9159521, 0.7709, 1, 0, 0.7333333, 1,
1.158932, -0.01708202, 0.90057, 1, 0, 0.7254902, 1,
1.159201, 1.348973, 1.562588, 1, 0, 0.7215686, 1,
1.159365, -0.02475962, 0.5296639, 1, 0, 0.7137255, 1,
1.162509, -1.192814, 1.599149, 1, 0, 0.7098039, 1,
1.162697, 0.9395694, 0.1079759, 1, 0, 0.7019608, 1,
1.163724, -2.069942, 1.576515, 1, 0, 0.6941177, 1,
1.164501, -0.5078644, 0.4265456, 1, 0, 0.6901961, 1,
1.16853, 0.3056269, 0.8781437, 1, 0, 0.682353, 1,
1.17537, 0.725049, 2.57392, 1, 0, 0.6784314, 1,
1.175674, -0.9734525, 2.161848, 1, 0, 0.6705883, 1,
1.177661, 0.8916277, 0.1877256, 1, 0, 0.6666667, 1,
1.185475, -1.008721, 1.81663, 1, 0, 0.6588235, 1,
1.187477, -0.9411687, 2.36434, 1, 0, 0.654902, 1,
1.188672, -0.1583901, 0.8712679, 1, 0, 0.6470588, 1,
1.190551, 0.5590016, 1.904492, 1, 0, 0.6431373, 1,
1.193094, 0.9949083, -0.391364, 1, 0, 0.6352941, 1,
1.193207, 1.218696, 0.2017656, 1, 0, 0.6313726, 1,
1.194248, -0.336422, 1.815513, 1, 0, 0.6235294, 1,
1.205728, -0.2107578, 2.53037, 1, 0, 0.6196079, 1,
1.221035, 1.194875, 1.466282, 1, 0, 0.6117647, 1,
1.231913, -0.3047985, 0.9924712, 1, 0, 0.6078432, 1,
1.238749, 0.6938761, 0.3859865, 1, 0, 0.6, 1,
1.238754, 1.050656, -0.1809138, 1, 0, 0.5921569, 1,
1.244775, -1.305529, 2.313558, 1, 0, 0.5882353, 1,
1.25133, 0.4894236, 2.222662, 1, 0, 0.5803922, 1,
1.267769, 0.6868041, 0.6603909, 1, 0, 0.5764706, 1,
1.26949, 1.410155, -0.3519811, 1, 0, 0.5686275, 1,
1.273054, -1.799709, 0.8658056, 1, 0, 0.5647059, 1,
1.27865, -1.196602, -0.01291157, 1, 0, 0.5568628, 1,
1.281699, 0.7391972, 0.173976, 1, 0, 0.5529412, 1,
1.288751, 1.257697, 0.03428333, 1, 0, 0.5450981, 1,
1.304799, 0.4540805, 0.7918876, 1, 0, 0.5411765, 1,
1.311251, -2.459356, 3.049682, 1, 0, 0.5333334, 1,
1.318838, -0.7867047, 2.163561, 1, 0, 0.5294118, 1,
1.31936, -0.4195163, 1.120872, 1, 0, 0.5215687, 1,
1.321037, -0.07390328, 1.9581, 1, 0, 0.5176471, 1,
1.324717, -1.625401, 5.586534, 1, 0, 0.509804, 1,
1.333538, 0.1975592, 2.400108, 1, 0, 0.5058824, 1,
1.33559, 1.002944, 4.693521, 1, 0, 0.4980392, 1,
1.342628, -0.1059098, 1.429726, 1, 0, 0.4901961, 1,
1.343836, 0.9598022, -0.001253249, 1, 0, 0.4862745, 1,
1.346466, 0.2036581, 1.240073, 1, 0, 0.4784314, 1,
1.347271, 2.535332, -1.409961, 1, 0, 0.4745098, 1,
1.350933, 2.537799, 0.7138107, 1, 0, 0.4666667, 1,
1.351099, -0.5884522, 1.928247, 1, 0, 0.4627451, 1,
1.35693, 0.3993919, 1.488411, 1, 0, 0.454902, 1,
1.369203, 1.113128, -0.249841, 1, 0, 0.4509804, 1,
1.371764, 0.4494311, 2.002745, 1, 0, 0.4431373, 1,
1.373692, -1.481232, 1.18207, 1, 0, 0.4392157, 1,
1.383826, 0.7734481, -1.591913, 1, 0, 0.4313726, 1,
1.385934, -0.01933918, 2.520448, 1, 0, 0.427451, 1,
1.386376, 1.211132, 0.05932822, 1, 0, 0.4196078, 1,
1.405392, 1.139979, 0.02998836, 1, 0, 0.4156863, 1,
1.406247, 0.7650082, 0.7910435, 1, 0, 0.4078431, 1,
1.414539, -0.7381171, 0.9862448, 1, 0, 0.4039216, 1,
1.41498, 0.5565892, 1.018103, 1, 0, 0.3960784, 1,
1.432029, -0.9380031, 2.235693, 1, 0, 0.3882353, 1,
1.443392, 0.221672, 1.428277, 1, 0, 0.3843137, 1,
1.445992, -1.467921, 3.099006, 1, 0, 0.3764706, 1,
1.4478, 0.01576655, 1.16492, 1, 0, 0.372549, 1,
1.457624, 0.5560433, 1.592387, 1, 0, 0.3647059, 1,
1.475268, -1.173153, 1.802259, 1, 0, 0.3607843, 1,
1.475931, -0.3887505, 2.52484, 1, 0, 0.3529412, 1,
1.503056, -0.1389364, 0.9054074, 1, 0, 0.3490196, 1,
1.512076, -0.1526578, 0.4395947, 1, 0, 0.3411765, 1,
1.53332, -2.193708, 2.216154, 1, 0, 0.3372549, 1,
1.544754, 0.3189524, 1.24901, 1, 0, 0.3294118, 1,
1.5508, -0.9336739, 0.3290913, 1, 0, 0.3254902, 1,
1.564977, 0.1199788, 3.106416, 1, 0, 0.3176471, 1,
1.568163, -2.03822, 3.06163, 1, 0, 0.3137255, 1,
1.568979, 0.01850184, -1.116572, 1, 0, 0.3058824, 1,
1.579181, -0.4295225, 0.7668673, 1, 0, 0.2980392, 1,
1.627264, -1.206573, 1.846124, 1, 0, 0.2941177, 1,
1.632361, -0.7076708, 1.149434, 1, 0, 0.2862745, 1,
1.651608, 0.4091243, 0.8998366, 1, 0, 0.282353, 1,
1.674606, -0.913116, -0.2663308, 1, 0, 0.2745098, 1,
1.706195, 2.719351, 0.8839303, 1, 0, 0.2705882, 1,
1.725279, 0.3538768, 1.119012, 1, 0, 0.2627451, 1,
1.727636, 0.689427, 1.831863, 1, 0, 0.2588235, 1,
1.732248, 1.084057, 0.4284926, 1, 0, 0.2509804, 1,
1.73374, -0.1848668, 0.6646185, 1, 0, 0.2470588, 1,
1.744126, 2.005346, 0.06157644, 1, 0, 0.2392157, 1,
1.759656, 0.4254826, 0.2360454, 1, 0, 0.2352941, 1,
1.763669, 0.8213255, 0.9157636, 1, 0, 0.227451, 1,
1.764252, -0.7673312, 3.04771, 1, 0, 0.2235294, 1,
1.777065, -0.727717, 2.231893, 1, 0, 0.2156863, 1,
1.795832, 1.204189, 0.6157571, 1, 0, 0.2117647, 1,
1.808262, -1.241605, 2.188811, 1, 0, 0.2039216, 1,
1.821696, 0.7684793, 0.861513, 1, 0, 0.1960784, 1,
1.839052, 0.7826547, 0.7290429, 1, 0, 0.1921569, 1,
1.842505, 0.2360688, 1.438315, 1, 0, 0.1843137, 1,
1.859146, 0.4568113, 1.56908, 1, 0, 0.1803922, 1,
1.870293, -0.591642, 1.070886, 1, 0, 0.172549, 1,
1.875348, -0.1792419, 1.223845, 1, 0, 0.1686275, 1,
1.881559, -1.334155, 1.645545, 1, 0, 0.1607843, 1,
1.90474, 0.1411754, 1.110074, 1, 0, 0.1568628, 1,
1.928952, 0.2284245, 0.9719117, 1, 0, 0.1490196, 1,
1.931073, 0.05927933, 2.134665, 1, 0, 0.145098, 1,
1.959504, 1.560045, -0.993902, 1, 0, 0.1372549, 1,
1.971654, -0.5766712, 2.217601, 1, 0, 0.1333333, 1,
1.974157, 0.3529525, 1.959284, 1, 0, 0.1254902, 1,
1.992535, 0.625622, 0.7428291, 1, 0, 0.1215686, 1,
2.002256, -1.100258, 3.056813, 1, 0, 0.1137255, 1,
2.019926, -1.909779, 2.829279, 1, 0, 0.1098039, 1,
2.025293, -0.4451672, 0.8746922, 1, 0, 0.1019608, 1,
2.107382, 1.121816, 2.352471, 1, 0, 0.09411765, 1,
2.139833, 0.244264, 2.198387, 1, 0, 0.09019608, 1,
2.182606, 1.381927, 2.287822, 1, 0, 0.08235294, 1,
2.186235, 1.192108, 2.369735, 1, 0, 0.07843138, 1,
2.187772, 0.4288234, 2.646857, 1, 0, 0.07058824, 1,
2.19999, -0.4021784, 2.624404, 1, 0, 0.06666667, 1,
2.201175, 0.6068714, 2.247203, 1, 0, 0.05882353, 1,
2.223408, -1.050334, 2.920418, 1, 0, 0.05490196, 1,
2.233261, 2.128593, 0.5713031, 1, 0, 0.04705882, 1,
2.237415, -2.227181, 2.077452, 1, 0, 0.04313726, 1,
2.248577, 1.608559, 2.343934, 1, 0, 0.03529412, 1,
2.278852, -0.1551349, 1.078672, 1, 0, 0.03137255, 1,
2.283619, -0.4688064, 1.891526, 1, 0, 0.02352941, 1,
2.382539, -0.7284888, 1.88659, 1, 0, 0.01960784, 1,
2.395642, -0.5290725, 1.875015, 1, 0, 0.01176471, 1,
2.685835, -1.92052, 1.817612, 1, 0, 0.007843138, 1
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
-0.01974046, -4.326121, -7.005834, 0, -0.5, 0.5, 0.5,
-0.01974046, -4.326121, -7.005834, 1, -0.5, 0.5, 0.5,
-0.01974046, -4.326121, -7.005834, 1, 1.5, 0.5, 0.5,
-0.01974046, -4.326121, -7.005834, 0, 1.5, 0.5, 0.5
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
-3.642506, 0.17489, -7.005834, 0, -0.5, 0.5, 0.5,
-3.642506, 0.17489, -7.005834, 1, -0.5, 0.5, 0.5,
-3.642506, 0.17489, -7.005834, 1, 1.5, 0.5, 0.5,
-3.642506, 0.17489, -7.005834, 0, 1.5, 0.5, 0.5
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
-3.642506, -4.326121, 0.2028797, 0, -0.5, 0.5, 0.5,
-3.642506, -4.326121, 0.2028797, 1, -0.5, 0.5, 0.5,
-3.642506, -4.326121, 0.2028797, 1, 1.5, 0.5, 0.5,
-3.642506, -4.326121, 0.2028797, 0, 1.5, 0.5, 0.5
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
-2, -3.287426, -5.342284,
2, -3.287426, -5.342284,
-2, -3.287426, -5.342284,
-2, -3.460542, -5.619543,
-1, -3.287426, -5.342284,
-1, -3.460542, -5.619543,
0, -3.287426, -5.342284,
0, -3.460542, -5.619543,
1, -3.287426, -5.342284,
1, -3.460542, -5.619543,
2, -3.287426, -5.342284,
2, -3.460542, -5.619543
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
-2, -3.806773, -6.174059, 0, -0.5, 0.5, 0.5,
-2, -3.806773, -6.174059, 1, -0.5, 0.5, 0.5,
-2, -3.806773, -6.174059, 1, 1.5, 0.5, 0.5,
-2, -3.806773, -6.174059, 0, 1.5, 0.5, 0.5,
-1, -3.806773, -6.174059, 0, -0.5, 0.5, 0.5,
-1, -3.806773, -6.174059, 1, -0.5, 0.5, 0.5,
-1, -3.806773, -6.174059, 1, 1.5, 0.5, 0.5,
-1, -3.806773, -6.174059, 0, 1.5, 0.5, 0.5,
0, -3.806773, -6.174059, 0, -0.5, 0.5, 0.5,
0, -3.806773, -6.174059, 1, -0.5, 0.5, 0.5,
0, -3.806773, -6.174059, 1, 1.5, 0.5, 0.5,
0, -3.806773, -6.174059, 0, 1.5, 0.5, 0.5,
1, -3.806773, -6.174059, 0, -0.5, 0.5, 0.5,
1, -3.806773, -6.174059, 1, -0.5, 0.5, 0.5,
1, -3.806773, -6.174059, 1, 1.5, 0.5, 0.5,
1, -3.806773, -6.174059, 0, 1.5, 0.5, 0.5,
2, -3.806773, -6.174059, 0, -0.5, 0.5, 0.5,
2, -3.806773, -6.174059, 1, -0.5, 0.5, 0.5,
2, -3.806773, -6.174059, 1, 1.5, 0.5, 0.5,
2, -3.806773, -6.174059, 0, 1.5, 0.5, 0.5
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
-2.806483, -3, -5.342284,
-2.806483, 3, -5.342284,
-2.806483, -3, -5.342284,
-2.94582, -3, -5.619543,
-2.806483, -2, -5.342284,
-2.94582, -2, -5.619543,
-2.806483, -1, -5.342284,
-2.94582, -1, -5.619543,
-2.806483, 0, -5.342284,
-2.94582, 0, -5.619543,
-2.806483, 1, -5.342284,
-2.94582, 1, -5.619543,
-2.806483, 2, -5.342284,
-2.94582, 2, -5.619543,
-2.806483, 3, -5.342284,
-2.94582, 3, -5.619543
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
-3.224494, -3, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, -3, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, -3, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, -3, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, -2, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, -2, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, -2, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, -2, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, -1, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, -1, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, -1, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, -1, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, 0, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, 0, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, 0, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, 0, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, 1, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, 1, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, 1, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, 1, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, 2, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, 2, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, 2, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, 2, -6.174059, 0, 1.5, 0.5, 0.5,
-3.224494, 3, -6.174059, 0, -0.5, 0.5, 0.5,
-3.224494, 3, -6.174059, 1, -0.5, 0.5, 0.5,
-3.224494, 3, -6.174059, 1, 1.5, 0.5, 0.5,
-3.224494, 3, -6.174059, 0, 1.5, 0.5, 0.5
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
-2.806483, -3.287426, -4,
-2.806483, -3.287426, 4,
-2.806483, -3.287426, -4,
-2.94582, -3.460542, -4,
-2.806483, -3.287426, -2,
-2.94582, -3.460542, -2,
-2.806483, -3.287426, 0,
-2.94582, -3.460542, 0,
-2.806483, -3.287426, 2,
-2.94582, -3.460542, 2,
-2.806483, -3.287426, 4,
-2.94582, -3.460542, 4
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
-3.224494, -3.806773, -4, 0, -0.5, 0.5, 0.5,
-3.224494, -3.806773, -4, 1, -0.5, 0.5, 0.5,
-3.224494, -3.806773, -4, 1, 1.5, 0.5, 0.5,
-3.224494, -3.806773, -4, 0, 1.5, 0.5, 0.5,
-3.224494, -3.806773, -2, 0, -0.5, 0.5, 0.5,
-3.224494, -3.806773, -2, 1, -0.5, 0.5, 0.5,
-3.224494, -3.806773, -2, 1, 1.5, 0.5, 0.5,
-3.224494, -3.806773, -2, 0, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 0, 0, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 0, 1, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 0, 1, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 0, 0, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 2, 0, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 2, 1, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 2, 1, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 2, 0, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 4, 0, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 4, 1, -0.5, 0.5, 0.5,
-3.224494, -3.806773, 4, 1, 1.5, 0.5, 0.5,
-3.224494, -3.806773, 4, 0, 1.5, 0.5, 0.5
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
-2.806483, -3.287426, -5.342284,
-2.806483, 3.637206, -5.342284,
-2.806483, -3.287426, 5.748044,
-2.806483, 3.637206, 5.748044,
-2.806483, -3.287426, -5.342284,
-2.806483, -3.287426, 5.748044,
-2.806483, 3.637206, -5.342284,
-2.806483, 3.637206, 5.748044,
-2.806483, -3.287426, -5.342284,
2.767002, -3.287426, -5.342284,
-2.806483, -3.287426, 5.748044,
2.767002, -3.287426, 5.748044,
-2.806483, 3.637206, -5.342284,
2.767002, 3.637206, -5.342284,
-2.806483, 3.637206, 5.748044,
2.767002, 3.637206, 5.748044,
2.767002, -3.287426, -5.342284,
2.767002, 3.637206, -5.342284,
2.767002, -3.287426, 5.748044,
2.767002, 3.637206, 5.748044,
2.767002, -3.287426, -5.342284,
2.767002, -3.287426, 5.748044,
2.767002, 3.637206, -5.342284,
2.767002, 3.637206, 5.748044
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
var radius = 7.589471;
var distance = 33.76641;
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
mvMatrix.translate( 0.01974046, -0.17489, -0.2028797 );
mvMatrix.scale( 1.472308, 1.185028, 0.7399136 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76641);
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
carboxy_methylaminom<-read.table("carboxy_methylaminom.xyz", skip=1)
x<-carboxy_methylaminom$V2
y<-carboxy_methylaminom$V3
z<-carboxy_methylaminom$V4
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
9, 4, 2, 0, 0, 1, 1, 1,
5, 2, 1, 1, 0, 0, 1, 1,
4, 1, 1, 1, 0, 0, 1, 1,
5, 3, 1, 1, 0, 0, 1, 1,
3, 2, 1, 1, 0, 0, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
1, 2, 1, 0, 0, 0, 1, 1,
7, 2, 1, 0, 0, 0, 1, 1,
6, 1, 1, 0, 0, 0, 1, 1,
8, 1, 1, 0, 0, 0, 1, 1
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
var radius = 6.36671;
var distance = 22.3628;
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
mvMatrix.translate( -5, -2.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -22.3628);
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
for (var i = 0; i < 10; i++) {
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
