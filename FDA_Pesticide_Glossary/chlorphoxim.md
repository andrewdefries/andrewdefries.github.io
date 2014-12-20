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
-3.152622, 1.973548, -0.8092035, 1, 0, 0, 1,
-2.916334, 0.3469915, -0.869855, 1, 0.007843138, 0, 1,
-2.864839, 1.804172, -0.5832695, 1, 0.01176471, 0, 1,
-2.781078, 0.1246074, -1.74173, 1, 0.01960784, 0, 1,
-2.621975, -0.1287877, -1.858149, 1, 0.02352941, 0, 1,
-2.607071, -0.4505675, 1.115001, 1, 0.03137255, 0, 1,
-2.600097, -0.6510055, -1.522385, 1, 0.03529412, 0, 1,
-2.589152, -1.156919, -0.9322215, 1, 0.04313726, 0, 1,
-2.570165, 0.8274508, -2.296139, 1, 0.04705882, 0, 1,
-2.397209, -1.206321, -0.6498945, 1, 0.05490196, 0, 1,
-2.380387, -0.8472597, -2.977567, 1, 0.05882353, 0, 1,
-2.380258, 0.4575832, -1.392586, 1, 0.06666667, 0, 1,
-2.32912, -0.5366131, -2.058151, 1, 0.07058824, 0, 1,
-2.304793, -0.6414756, -0.4778597, 1, 0.07843138, 0, 1,
-2.287499, -0.006481492, -3.347814, 1, 0.08235294, 0, 1,
-2.281929, -0.5718927, -1.778372, 1, 0.09019608, 0, 1,
-2.24912, 0.1231649, -0.9135072, 1, 0.09411765, 0, 1,
-2.225811, 1.2242, 0.142637, 1, 0.1019608, 0, 1,
-2.224154, -0.5397569, -2.648306, 1, 0.1098039, 0, 1,
-2.210901, -0.6006634, -1.521054, 1, 0.1137255, 0, 1,
-2.188532, -1.128466, -3.578003, 1, 0.1215686, 0, 1,
-2.16993, 0.9192662, -3.231981, 1, 0.1254902, 0, 1,
-2.146156, 0.9172106, -1.538867, 1, 0.1333333, 0, 1,
-2.021173, -0.7098101, -4.160386, 1, 0.1372549, 0, 1,
-2.009763, -0.6535735, -1.860783, 1, 0.145098, 0, 1,
-2.007504, 0.1490361, -0.1485679, 1, 0.1490196, 0, 1,
-1.978265, -0.301142, -2.689806, 1, 0.1568628, 0, 1,
-1.928554, -0.1252802, -1.720205, 1, 0.1607843, 0, 1,
-1.922198, -1.10629, -1.763723, 1, 0.1686275, 0, 1,
-1.912221, -1.384753, -3.775144, 1, 0.172549, 0, 1,
-1.89191, -1.875487, -1.508625, 1, 0.1803922, 0, 1,
-1.829836, 0.7062443, -1.476084, 1, 0.1843137, 0, 1,
-1.825975, 0.8553782, -4.369778, 1, 0.1921569, 0, 1,
-1.819385, -0.7661609, -2.709215, 1, 0.1960784, 0, 1,
-1.808417, -0.004715289, -1.519065, 1, 0.2039216, 0, 1,
-1.800119, -1.597138, -2.544354, 1, 0.2117647, 0, 1,
-1.792945, -1.782776, -1.804426, 1, 0.2156863, 0, 1,
-1.787897, -0.4510817, -0.9981762, 1, 0.2235294, 0, 1,
-1.779324, -0.3495589, -1.010365, 1, 0.227451, 0, 1,
-1.748843, 0.1590703, 0.05329539, 1, 0.2352941, 0, 1,
-1.74385, -0.5697809, -4.333305, 1, 0.2392157, 0, 1,
-1.726442, -0.1515237, -0.8522328, 1, 0.2470588, 0, 1,
-1.725526, -1.222163, -1.810887, 1, 0.2509804, 0, 1,
-1.721719, 1.41532, -2.678206, 1, 0.2588235, 0, 1,
-1.715278, 0.9040517, -1.574274, 1, 0.2627451, 0, 1,
-1.687433, 0.7999359, -3.203269, 1, 0.2705882, 0, 1,
-1.678463, -0.8811151, -2.376248, 1, 0.2745098, 0, 1,
-1.669562, 0.5929624, -1.320868, 1, 0.282353, 0, 1,
-1.659868, 0.2895772, -2.002228, 1, 0.2862745, 0, 1,
-1.627151, 0.186508, -1.052905, 1, 0.2941177, 0, 1,
-1.62564, -0.3009353, -1.788316, 1, 0.3019608, 0, 1,
-1.624275, 0.09036483, -1.506844, 1, 0.3058824, 0, 1,
-1.619192, -0.9870769, -0.6013452, 1, 0.3137255, 0, 1,
-1.607305, -1.149832, -2.408947, 1, 0.3176471, 0, 1,
-1.604378, 1.526498, -1.138848, 1, 0.3254902, 0, 1,
-1.600492, -2.229887, -1.82439, 1, 0.3294118, 0, 1,
-1.577448, 0.6474462, -0.8987606, 1, 0.3372549, 0, 1,
-1.577062, -1.028266, -4.116833, 1, 0.3411765, 0, 1,
-1.561983, -0.1402154, -0.6652168, 1, 0.3490196, 0, 1,
-1.550296, -0.9391226, -1.745307, 1, 0.3529412, 0, 1,
-1.546585, -1.113674, -2.661572, 1, 0.3607843, 0, 1,
-1.546314, -0.955681, -2.454399, 1, 0.3647059, 0, 1,
-1.534415, -0.008913521, -1.28338, 1, 0.372549, 0, 1,
-1.530697, 0.8531571, 0.69751, 1, 0.3764706, 0, 1,
-1.505417, 0.1930968, -0.4688882, 1, 0.3843137, 0, 1,
-1.501372, 1.170042, -0.590515, 1, 0.3882353, 0, 1,
-1.489357, 0.3148019, -2.275647, 1, 0.3960784, 0, 1,
-1.484406, -0.9384107, -1.681655, 1, 0.4039216, 0, 1,
-1.456978, -1.116022, -2.602544, 1, 0.4078431, 0, 1,
-1.440165, -0.7404199, -2.435608, 1, 0.4156863, 0, 1,
-1.434752, 0.6365793, -0.9192021, 1, 0.4196078, 0, 1,
-1.426182, 0.8916093, -1.441399, 1, 0.427451, 0, 1,
-1.421112, -0.424601, -1.286393, 1, 0.4313726, 0, 1,
-1.418296, 0.4281628, -1.042875, 1, 0.4392157, 0, 1,
-1.408519, -0.6999162, -3.522358, 1, 0.4431373, 0, 1,
-1.403879, 1.420166, -1.538497, 1, 0.4509804, 0, 1,
-1.403192, -0.8327687, -4.38394, 1, 0.454902, 0, 1,
-1.385991, -0.2743739, -1.037494, 1, 0.4627451, 0, 1,
-1.385678, -0.07154322, -0.9937811, 1, 0.4666667, 0, 1,
-1.36042, -2.747769, -2.73385, 1, 0.4745098, 0, 1,
-1.352631, -1.55414, -2.885641, 1, 0.4784314, 0, 1,
-1.351353, -1.428766, -0.527212, 1, 0.4862745, 0, 1,
-1.349996, -0.5498133, -1.517583, 1, 0.4901961, 0, 1,
-1.337203, 1.922518, -1.588906, 1, 0.4980392, 0, 1,
-1.334195, 1.690011, -0.5387826, 1, 0.5058824, 0, 1,
-1.329787, 0.8214217, -0.5967773, 1, 0.509804, 0, 1,
-1.324975, -0.1245535, -3.10222, 1, 0.5176471, 0, 1,
-1.324616, -0.4849957, -2.605668, 1, 0.5215687, 0, 1,
-1.307162, -1.348897, -1.45633, 1, 0.5294118, 0, 1,
-1.296363, -0.1035482, -1.433862, 1, 0.5333334, 0, 1,
-1.295079, 1.137747, -0.8640667, 1, 0.5411765, 0, 1,
-1.293042, -1.919594, -3.022799, 1, 0.5450981, 0, 1,
-1.290882, 0.2518703, -1.979812, 1, 0.5529412, 0, 1,
-1.288578, 0.7817897, -1.680167, 1, 0.5568628, 0, 1,
-1.286166, -1.601317, -3.524005, 1, 0.5647059, 0, 1,
-1.276121, -1.298059, -1.589805, 1, 0.5686275, 0, 1,
-1.271864, 1.997143, -0.457878, 1, 0.5764706, 0, 1,
-1.27007, 0.2848559, -2.215011, 1, 0.5803922, 0, 1,
-1.266819, 0.551427, -2.885455, 1, 0.5882353, 0, 1,
-1.248237, -0.4133942, -2.400701, 1, 0.5921569, 0, 1,
-1.247652, -0.1416996, -0.4496844, 1, 0.6, 0, 1,
-1.244263, -0.911669, -4.495064, 1, 0.6078432, 0, 1,
-1.239753, 0.1531146, -0.0009055906, 1, 0.6117647, 0, 1,
-1.232799, -1.201248, -1.750241, 1, 0.6196079, 0, 1,
-1.229059, 0.9262522, -1.636879, 1, 0.6235294, 0, 1,
-1.228642, -1.599316, -2.575229, 1, 0.6313726, 0, 1,
-1.216451, 1.995543, 0.01885743, 1, 0.6352941, 0, 1,
-1.214332, 0.5254155, -1.045588, 1, 0.6431373, 0, 1,
-1.205667, 1.118238, 0.3339282, 1, 0.6470588, 0, 1,
-1.204642, 0.3522728, -3.428541, 1, 0.654902, 0, 1,
-1.199591, 1.500863, 1.076617, 1, 0.6588235, 0, 1,
-1.198161, -1.473084, -3.905046, 1, 0.6666667, 0, 1,
-1.197199, 1.224265, -0.6541573, 1, 0.6705883, 0, 1,
-1.196313, 1.126077, 0.4088701, 1, 0.6784314, 0, 1,
-1.186714, -0.4502095, -1.347249, 1, 0.682353, 0, 1,
-1.184406, -0.9658223, -3.119954, 1, 0.6901961, 0, 1,
-1.180004, 0.4194121, -1.494376, 1, 0.6941177, 0, 1,
-1.179724, 0.1166879, -1.866056, 1, 0.7019608, 0, 1,
-1.162741, -0.4008417, -1.672352, 1, 0.7098039, 0, 1,
-1.161807, 0.01059025, -2.44849, 1, 0.7137255, 0, 1,
-1.158134, 0.998749, -0.6634225, 1, 0.7215686, 0, 1,
-1.13761, -0.3449446, -0.7425407, 1, 0.7254902, 0, 1,
-1.127926, -1.625402, -2.677643, 1, 0.7333333, 0, 1,
-1.119394, -1.084656, -3.619166, 1, 0.7372549, 0, 1,
-1.117969, 0.7724726, -1.279148, 1, 0.7450981, 0, 1,
-1.111361, 0.03782579, -1.418983, 1, 0.7490196, 0, 1,
-1.110651, -1.199349, -1.403901, 1, 0.7568628, 0, 1,
-1.110061, -1.770879, -1.87827, 1, 0.7607843, 0, 1,
-1.093482, -0.4392677, -1.246061, 1, 0.7686275, 0, 1,
-1.06607, -0.2518833, -2.19513, 1, 0.772549, 0, 1,
-1.063811, -3.694036, -2.051601, 1, 0.7803922, 0, 1,
-1.061319, -0.9444009, -2.310583, 1, 0.7843137, 0, 1,
-1.056306, -0.9453055, -2.316423, 1, 0.7921569, 0, 1,
-1.053038, 0.3535182, -0.3933532, 1, 0.7960784, 0, 1,
-1.050167, -0.067191, -1.647775, 1, 0.8039216, 0, 1,
-1.049879, -1.3564, -2.995842, 1, 0.8117647, 0, 1,
-1.04148, -0.4608604, -3.312801, 1, 0.8156863, 0, 1,
-1.040875, 0.7562642, -2.100372, 1, 0.8235294, 0, 1,
-1.034098, 1.719859, -0.693876, 1, 0.827451, 0, 1,
-1.031962, 0.8659791, -0.6938173, 1, 0.8352941, 0, 1,
-1.026269, 1.092548, -0.02870254, 1, 0.8392157, 0, 1,
-1.026095, 2.675237, -0.4524304, 1, 0.8470588, 0, 1,
-1.021451, -1.61034, -2.919857, 1, 0.8509804, 0, 1,
-1.015891, -0.1023123, -2.197398, 1, 0.8588235, 0, 1,
-1.014175, -0.03363651, -1.123976, 1, 0.8627451, 0, 1,
-1.011604, -0.9900635, -0.8076372, 1, 0.8705882, 0, 1,
-1.008736, 0.4127827, -1.789393, 1, 0.8745098, 0, 1,
-1.006224, 1.149029, 1.756065, 1, 0.8823529, 0, 1,
-1.004419, -1.53805, -1.023879, 1, 0.8862745, 0, 1,
-0.9998941, -1.362888, 0.04238982, 1, 0.8941177, 0, 1,
-0.991684, 0.3345054, -0.8956473, 1, 0.8980392, 0, 1,
-0.9911578, 0.1375652, -1.130355, 1, 0.9058824, 0, 1,
-0.9894153, -0.5308324, -1.968759, 1, 0.9137255, 0, 1,
-0.98005, 0.5618904, 0.6629415, 1, 0.9176471, 0, 1,
-0.9725487, -1.138994, -4.489555, 1, 0.9254902, 0, 1,
-0.9656863, 0.8745098, 1.893916, 1, 0.9294118, 0, 1,
-0.9649777, 1.093745, 0.0803597, 1, 0.9372549, 0, 1,
-0.9589309, 0.06024529, -1.372046, 1, 0.9411765, 0, 1,
-0.9571309, 0.2911456, -2.296729, 1, 0.9490196, 0, 1,
-0.9491547, 0.6530678, -2.499753, 1, 0.9529412, 0, 1,
-0.9463154, 1.587517, -1.791618, 1, 0.9607843, 0, 1,
-0.9450762, -0.1658436, -2.291985, 1, 0.9647059, 0, 1,
-0.9388952, 0.2481246, -1.820994, 1, 0.972549, 0, 1,
-0.9388551, -0.290808, -2.160436, 1, 0.9764706, 0, 1,
-0.9366079, 0.3326228, -0.9619336, 1, 0.9843137, 0, 1,
-0.9347149, -1.876255, -3.475849, 1, 0.9882353, 0, 1,
-0.9316472, -0.557749, -1.75175, 1, 0.9960784, 0, 1,
-0.9307972, 1.133038, -0.07193991, 0.9960784, 1, 0, 1,
-0.9283245, 0.9401222, -1.303882, 0.9921569, 1, 0, 1,
-0.9114608, -0.3534829, -1.772677, 0.9843137, 1, 0, 1,
-0.9085713, 0.6664168, -0.6167872, 0.9803922, 1, 0, 1,
-0.901719, 0.4988777, 0.4845401, 0.972549, 1, 0, 1,
-0.8981504, 0.8585064, -1.302528, 0.9686275, 1, 0, 1,
-0.8967384, 0.2356058, -2.376044, 0.9607843, 1, 0, 1,
-0.8874301, -1.125823, -1.513939, 0.9568627, 1, 0, 1,
-0.8779873, 0.307173, -0.4626926, 0.9490196, 1, 0, 1,
-0.8757772, -0.4727729, -1.915118, 0.945098, 1, 0, 1,
-0.8574324, 1.190226, -2.163174, 0.9372549, 1, 0, 1,
-0.8533773, 0.4216466, -0.4724039, 0.9333333, 1, 0, 1,
-0.8524921, -0.7723907, -1.689347, 0.9254902, 1, 0, 1,
-0.847868, 0.2224963, -1.846984, 0.9215686, 1, 0, 1,
-0.8475889, -0.5441609, -1.240358, 0.9137255, 1, 0, 1,
-0.8424001, 1.112649, 0.5750629, 0.9098039, 1, 0, 1,
-0.8366151, 1.196181, 0.3863823, 0.9019608, 1, 0, 1,
-0.8347592, 0.1076256, -0.8333867, 0.8941177, 1, 0, 1,
-0.8332335, -0.7941819, -2.738458, 0.8901961, 1, 0, 1,
-0.8288603, -0.4992822, -2.846462, 0.8823529, 1, 0, 1,
-0.8215444, 1.726969, -0.01115286, 0.8784314, 1, 0, 1,
-0.8125615, -0.170931, -1.222031, 0.8705882, 1, 0, 1,
-0.8118711, -1.448207, -3.186611, 0.8666667, 1, 0, 1,
-0.803952, 0.1422153, 0.1875185, 0.8588235, 1, 0, 1,
-0.8006365, 0.4032876, -0.4049542, 0.854902, 1, 0, 1,
-0.7901237, 0.486359, 0.08079293, 0.8470588, 1, 0, 1,
-0.7869838, -0.4993576, -1.149068, 0.8431373, 1, 0, 1,
-0.7857199, -0.1584914, -1.782471, 0.8352941, 1, 0, 1,
-0.7801106, 1.184638, -1.268088, 0.8313726, 1, 0, 1,
-0.7720263, -0.02129566, 0.09557828, 0.8235294, 1, 0, 1,
-0.7706181, 2.069267, -0.4879139, 0.8196079, 1, 0, 1,
-0.7689821, 0.3114701, -1.968082, 0.8117647, 1, 0, 1,
-0.7668407, 0.3660546, -1.722878, 0.8078431, 1, 0, 1,
-0.7622401, 0.3610708, -1.576863, 0.8, 1, 0, 1,
-0.7600172, 0.4822778, -1.999459, 0.7921569, 1, 0, 1,
-0.7568221, -0.6711772, -2.075985, 0.7882353, 1, 0, 1,
-0.7556462, 1.466352, 1.174763, 0.7803922, 1, 0, 1,
-0.7516435, 0.6812065, -0.4311758, 0.7764706, 1, 0, 1,
-0.7510558, 0.4025896, -1.05463, 0.7686275, 1, 0, 1,
-0.7476661, -0.4298375, 0.656808, 0.7647059, 1, 0, 1,
-0.7474073, -0.1890429, -1.919222, 0.7568628, 1, 0, 1,
-0.7472972, -0.9021646, -2.879669, 0.7529412, 1, 0, 1,
-0.7465367, 0.7491233, 0.4711637, 0.7450981, 1, 0, 1,
-0.7443528, -2.236193, -1.557897, 0.7411765, 1, 0, 1,
-0.7439259, 0.5744964, -1.680982, 0.7333333, 1, 0, 1,
-0.7385688, 0.2478295, -0.7179803, 0.7294118, 1, 0, 1,
-0.7366048, 0.06529693, -3.360663, 0.7215686, 1, 0, 1,
-0.7308738, 2.211354, -0.9954455, 0.7176471, 1, 0, 1,
-0.7284431, 1.003732, 0.1879971, 0.7098039, 1, 0, 1,
-0.7248691, -0.02257745, -2.231823, 0.7058824, 1, 0, 1,
-0.718689, -0.09683388, -2.437465, 0.6980392, 1, 0, 1,
-0.7178507, -2.964882, -4.050798, 0.6901961, 1, 0, 1,
-0.7131789, 0.6547599, -1.003789, 0.6862745, 1, 0, 1,
-0.712957, 0.1247586, 0.2156532, 0.6784314, 1, 0, 1,
-0.7129081, 0.02053073, -2.030328, 0.6745098, 1, 0, 1,
-0.7119007, -0.01405556, -0.8642511, 0.6666667, 1, 0, 1,
-0.7011934, 0.6015829, -1.417894, 0.6627451, 1, 0, 1,
-0.6978287, -0.5478909, -1.02968, 0.654902, 1, 0, 1,
-0.6965997, 0.1420283, -1.513427, 0.6509804, 1, 0, 1,
-0.6867986, -1.888577, -3.304384, 0.6431373, 1, 0, 1,
-0.6776986, -1.69697, -2.072251, 0.6392157, 1, 0, 1,
-0.6706455, 0.7633895, 0.6828421, 0.6313726, 1, 0, 1,
-0.6684934, -1.460709, -0.9034003, 0.627451, 1, 0, 1,
-0.6576421, -0.3090112, -4.151168, 0.6196079, 1, 0, 1,
-0.657315, -0.4099761, -0.9718887, 0.6156863, 1, 0, 1,
-0.6563678, -0.371372, -0.3902444, 0.6078432, 1, 0, 1,
-0.6542294, 0.1446906, -0.7937304, 0.6039216, 1, 0, 1,
-0.6534485, -1.309348, -4.137896, 0.5960785, 1, 0, 1,
-0.6518236, -0.8380465, -1.162819, 0.5882353, 1, 0, 1,
-0.650242, 0.5950364, -1.400815, 0.5843138, 1, 0, 1,
-0.6469238, 0.8409151, -1.732826, 0.5764706, 1, 0, 1,
-0.6455619, -0.8845686, -0.8266554, 0.572549, 1, 0, 1,
-0.644619, 0.2035733, 0.4252244, 0.5647059, 1, 0, 1,
-0.6445099, 1.788538, 1.516387, 0.5607843, 1, 0, 1,
-0.6416597, -3.500198, -2.457797, 0.5529412, 1, 0, 1,
-0.6400748, 0.1684531, -1.463602, 0.5490196, 1, 0, 1,
-0.6345726, 0.8405688, -1.112962, 0.5411765, 1, 0, 1,
-0.6336623, 1.185369, -0.8746496, 0.5372549, 1, 0, 1,
-0.6326718, 0.9758397, 0.5319462, 0.5294118, 1, 0, 1,
-0.630468, -1.025001, -4.54778, 0.5254902, 1, 0, 1,
-0.6295665, -0.1332996, -1.010946, 0.5176471, 1, 0, 1,
-0.6291487, -0.5083233, -2.399561, 0.5137255, 1, 0, 1,
-0.6254465, -0.7037448, -1.166743, 0.5058824, 1, 0, 1,
-0.6227385, 0.8231669, -2.218583, 0.5019608, 1, 0, 1,
-0.6225276, 0.9495642, -2.133376, 0.4941176, 1, 0, 1,
-0.6215504, 0.1538134, -0.04597231, 0.4862745, 1, 0, 1,
-0.6178356, -1.057756, -2.286169, 0.4823529, 1, 0, 1,
-0.6168692, -1.327334, -2.318851, 0.4745098, 1, 0, 1,
-0.6147441, 1.007691, 0.6507561, 0.4705882, 1, 0, 1,
-0.614566, -0.4255339, -3.873544, 0.4627451, 1, 0, 1,
-0.6141704, -0.2491466, -0.4429537, 0.4588235, 1, 0, 1,
-0.6082281, 0.7244076, -0.5916716, 0.4509804, 1, 0, 1,
-0.6007705, 1.423249, -1.034032, 0.4470588, 1, 0, 1,
-0.6006274, 0.4223984, -1.136328, 0.4392157, 1, 0, 1,
-0.5976554, -0.5846421, -4.11382, 0.4352941, 1, 0, 1,
-0.5975295, -1.064535, -3.01509, 0.427451, 1, 0, 1,
-0.5951733, 1.202849, -0.001043704, 0.4235294, 1, 0, 1,
-0.5946211, 0.6907839, -0.8525836, 0.4156863, 1, 0, 1,
-0.5919035, -0.7483994, -2.959042, 0.4117647, 1, 0, 1,
-0.5889397, 1.310452, 0.1020115, 0.4039216, 1, 0, 1,
-0.5861422, -0.6917883, -3.995806, 0.3960784, 1, 0, 1,
-0.5854417, -0.7945378, -2.282607, 0.3921569, 1, 0, 1,
-0.5836569, -0.2249253, -1.477554, 0.3843137, 1, 0, 1,
-0.5825534, 0.138671, -0.8925574, 0.3803922, 1, 0, 1,
-0.5798348, -0.7300686, -3.697681, 0.372549, 1, 0, 1,
-0.5757072, 1.169811, 0.9096252, 0.3686275, 1, 0, 1,
-0.5743328, 0.229123, -3.755639, 0.3607843, 1, 0, 1,
-0.5736248, 1.907619, 2.096925, 0.3568628, 1, 0, 1,
-0.5724545, 1.230152, 0.363813, 0.3490196, 1, 0, 1,
-0.5708146, 0.2553963, 0.09619725, 0.345098, 1, 0, 1,
-0.5652152, 0.8629559, -1.312612, 0.3372549, 1, 0, 1,
-0.5617427, 0.8461495, 0.8408654, 0.3333333, 1, 0, 1,
-0.558744, -0.5861245, -1.445777, 0.3254902, 1, 0, 1,
-0.558237, -0.2550262, -1.820535, 0.3215686, 1, 0, 1,
-0.5581088, -1.390875, -2.454576, 0.3137255, 1, 0, 1,
-0.5498139, 0.496817, -1.575523, 0.3098039, 1, 0, 1,
-0.5493916, 1.169181, -0.3452256, 0.3019608, 1, 0, 1,
-0.5490963, 1.751197, -0.0671893, 0.2941177, 1, 0, 1,
-0.5483266, 0.9876489, -1.927205, 0.2901961, 1, 0, 1,
-0.5467803, 0.2643647, -0.1601933, 0.282353, 1, 0, 1,
-0.5466544, 1.086694, 0.4390664, 0.2784314, 1, 0, 1,
-0.5435841, 1.901459, -1.848866, 0.2705882, 1, 0, 1,
-0.5428938, 1.23975, -1.692887, 0.2666667, 1, 0, 1,
-0.5392818, 2.445132, -0.9997209, 0.2588235, 1, 0, 1,
-0.5278761, -0.7338478, -1.384152, 0.254902, 1, 0, 1,
-0.5273091, 0.6694806, -1.718196, 0.2470588, 1, 0, 1,
-0.5267831, -1.067088, -3.262376, 0.2431373, 1, 0, 1,
-0.5266441, -1.831897, -4.505506, 0.2352941, 1, 0, 1,
-0.5242531, 0.2399068, -1.238202, 0.2313726, 1, 0, 1,
-0.5230007, -1.112636, -1.880018, 0.2235294, 1, 0, 1,
-0.5187368, -0.3553568, -2.693128, 0.2196078, 1, 0, 1,
-0.5172336, 0.6329774, 0.6123916, 0.2117647, 1, 0, 1,
-0.5137025, 1.723841, 0.08533571, 0.2078431, 1, 0, 1,
-0.5124663, 0.3892488, -0.7182199, 0.2, 1, 0, 1,
-0.5111902, 1.413815, -0.9002241, 0.1921569, 1, 0, 1,
-0.5071158, 0.5933896, 0.3319398, 0.1882353, 1, 0, 1,
-0.5015851, 0.5851941, -0.6609106, 0.1803922, 1, 0, 1,
-0.4933841, 0.1068807, 0.7258905, 0.1764706, 1, 0, 1,
-0.4908915, 0.195978, -0.3643732, 0.1686275, 1, 0, 1,
-0.4856158, -0.4078406, -4.021106, 0.1647059, 1, 0, 1,
-0.4811388, 1.731076, 0.404929, 0.1568628, 1, 0, 1,
-0.4782413, -1.153746, -3.405616, 0.1529412, 1, 0, 1,
-0.4760357, 0.3017808, -0.7759026, 0.145098, 1, 0, 1,
-0.4752833, -0.323956, -2.948562, 0.1411765, 1, 0, 1,
-0.4738034, -0.1805893, -2.688369, 0.1333333, 1, 0, 1,
-0.4735442, -1.970279, -4.755408, 0.1294118, 1, 0, 1,
-0.4690019, 1.071283, -1.370822, 0.1215686, 1, 0, 1,
-0.4642678, 1.560567, -0.9469032, 0.1176471, 1, 0, 1,
-0.4591343, -0.1804737, -2.305047, 0.1098039, 1, 0, 1,
-0.4557483, -0.3942829, -2.192746, 0.1058824, 1, 0, 1,
-0.4554135, 1.475862, -0.1568866, 0.09803922, 1, 0, 1,
-0.4548627, -1.087705, -2.595634, 0.09019608, 1, 0, 1,
-0.4515634, 0.9671874, 0.0968701, 0.08627451, 1, 0, 1,
-0.4504945, -1.01114, -1.374368, 0.07843138, 1, 0, 1,
-0.4446913, -1.661614, -4.27622, 0.07450981, 1, 0, 1,
-0.4403207, 0.9656741, 0.06062653, 0.06666667, 1, 0, 1,
-0.4384771, 0.6266958, 0.7566483, 0.0627451, 1, 0, 1,
-0.4383159, -0.5817523, -2.94291, 0.05490196, 1, 0, 1,
-0.435107, 0.3397616, -0.2835423, 0.05098039, 1, 0, 1,
-0.433915, 0.04111885, -1.338029, 0.04313726, 1, 0, 1,
-0.4272287, 0.6505616, -0.8123153, 0.03921569, 1, 0, 1,
-0.4270518, 1.533669, -1.135652, 0.03137255, 1, 0, 1,
-0.4258938, 0.9691315, -2.179021, 0.02745098, 1, 0, 1,
-0.4252625, -1.398207, -2.851548, 0.01960784, 1, 0, 1,
-0.4195214, 0.1910636, -2.139612, 0.01568628, 1, 0, 1,
-0.4109356, 1.253469, 1.112597, 0.007843138, 1, 0, 1,
-0.4097495, 2.360915, -0.3606213, 0.003921569, 1, 0, 1,
-0.405374, -1.164272, -2.09335, 0, 1, 0.003921569, 1,
-0.4045823, 0.2930703, -0.1292875, 0, 1, 0.01176471, 1,
-0.402836, -0.1335769, -0.380839, 0, 1, 0.01568628, 1,
-0.4013397, 0.1119176, -2.39608, 0, 1, 0.02352941, 1,
-0.3933329, 0.2650367, -1.847341, 0, 1, 0.02745098, 1,
-0.3928748, -0.3627554, -0.7182485, 0, 1, 0.03529412, 1,
-0.3925465, 0.8714792, -1.081797, 0, 1, 0.03921569, 1,
-0.3890064, -0.5003808, -3.677822, 0, 1, 0.04705882, 1,
-0.3889854, 1.3493, -0.6750182, 0, 1, 0.05098039, 1,
-0.3858612, -1.326203, -2.486991, 0, 1, 0.05882353, 1,
-0.3853088, 1.150868, 0.4959759, 0, 1, 0.0627451, 1,
-0.385256, 1.387637, -0.4443961, 0, 1, 0.07058824, 1,
-0.3850795, -0.4551738, -3.727139, 0, 1, 0.07450981, 1,
-0.378403, 0.5078971, -0.2514936, 0, 1, 0.08235294, 1,
-0.3711781, -1.261172, -3.377571, 0, 1, 0.08627451, 1,
-0.3652555, 2.033417, -2.330744, 0, 1, 0.09411765, 1,
-0.3648345, -1.051102, -1.070759, 0, 1, 0.1019608, 1,
-0.352091, 0.1789247, -2.183447, 0, 1, 0.1058824, 1,
-0.3490202, 0.7435904, 1.269902, 0, 1, 0.1137255, 1,
-0.3470752, -0.5869441, -2.002266, 0, 1, 0.1176471, 1,
-0.34529, -0.3773888, -3.949894, 0, 1, 0.1254902, 1,
-0.3441183, -0.08159899, -0.609779, 0, 1, 0.1294118, 1,
-0.3427523, 0.4817009, -0.6327856, 0, 1, 0.1372549, 1,
-0.3399338, 0.3836925, -1.110836, 0, 1, 0.1411765, 1,
-0.336436, -1.445869, -3.122479, 0, 1, 0.1490196, 1,
-0.3355053, -1.550321, -4.614734, 0, 1, 0.1529412, 1,
-0.3336584, 0.5265641, 0.691431, 0, 1, 0.1607843, 1,
-0.3296806, -0.8356069, -3.899242, 0, 1, 0.1647059, 1,
-0.3277597, 1.548109, 2.156538, 0, 1, 0.172549, 1,
-0.3256803, 0.6890086, 0.03950862, 0, 1, 0.1764706, 1,
-0.3253365, 0.9053053, 0.08902234, 0, 1, 0.1843137, 1,
-0.3251051, 1.128572, 0.7514769, 0, 1, 0.1882353, 1,
-0.3238611, 0.875562, -1.018602, 0, 1, 0.1960784, 1,
-0.3203608, 1.051087, 1.923936, 0, 1, 0.2039216, 1,
-0.3184176, 0.6053446, 0.7976707, 0, 1, 0.2078431, 1,
-0.3172196, -1.353042, -2.90418, 0, 1, 0.2156863, 1,
-0.3154549, 1.863584, 0.6620643, 0, 1, 0.2196078, 1,
-0.308873, 1.101168, 1.606618, 0, 1, 0.227451, 1,
-0.3082805, 1.053712, 0.08937227, 0, 1, 0.2313726, 1,
-0.3061799, 0.7837702, -0.7028639, 0, 1, 0.2392157, 1,
-0.3043543, -1.304221, -1.681088, 0, 1, 0.2431373, 1,
-0.30433, -0.6950035, -0.8908851, 0, 1, 0.2509804, 1,
-0.3039326, -0.07246122, -1.290116, 0, 1, 0.254902, 1,
-0.303403, 0.07284276, -0.207431, 0, 1, 0.2627451, 1,
-0.3013784, -0.1357654, -1.545308, 0, 1, 0.2666667, 1,
-0.3006396, -1.410352, -2.966337, 0, 1, 0.2745098, 1,
-0.3002923, -0.5987112, -2.833814, 0, 1, 0.2784314, 1,
-0.2988739, 0.9859952, 0.4065135, 0, 1, 0.2862745, 1,
-0.2978823, -0.7733451, -3.784764, 0, 1, 0.2901961, 1,
-0.2971963, -0.3695779, -3.074441, 0, 1, 0.2980392, 1,
-0.2963114, -0.1382096, -2.311126, 0, 1, 0.3058824, 1,
-0.2942203, -0.2941517, -2.708017, 0, 1, 0.3098039, 1,
-0.2905163, 0.6532901, 0.1607679, 0, 1, 0.3176471, 1,
-0.290417, 0.05410663, -0.6062495, 0, 1, 0.3215686, 1,
-0.290009, -0.3994192, -1.577712, 0, 1, 0.3294118, 1,
-0.2883959, 1.18098, -0.03017257, 0, 1, 0.3333333, 1,
-0.2869124, 1.481757, -0.1044983, 0, 1, 0.3411765, 1,
-0.2839854, 1.611268, 0.1094353, 0, 1, 0.345098, 1,
-0.2822975, 0.9028347, 0.6515386, 0, 1, 0.3529412, 1,
-0.2782974, 0.986537, -0.3486189, 0, 1, 0.3568628, 1,
-0.2746912, -0.3465309, -1.35378, 0, 1, 0.3647059, 1,
-0.2743739, 0.2911831, 0.2202783, 0, 1, 0.3686275, 1,
-0.2711587, -0.7098408, -3.866653, 0, 1, 0.3764706, 1,
-0.266023, 0.5972955, 0.3891673, 0, 1, 0.3803922, 1,
-0.2638574, -0.864054, -2.216705, 0, 1, 0.3882353, 1,
-0.2635604, -1.364545, -2.861654, 0, 1, 0.3921569, 1,
-0.2614684, 1.059958, -1.303539, 0, 1, 0.4, 1,
-0.2608922, -1.582984, -3.335065, 0, 1, 0.4078431, 1,
-0.2550139, 1.936644, 0.0855396, 0, 1, 0.4117647, 1,
-0.2529235, -0.6863458, -4.236646, 0, 1, 0.4196078, 1,
-0.2509604, 0.7458535, -0.9808413, 0, 1, 0.4235294, 1,
-0.2462507, -0.09043972, -1.322977, 0, 1, 0.4313726, 1,
-0.246088, 0.5062779, -2.337866, 0, 1, 0.4352941, 1,
-0.2438876, 0.2583905, -0.1957713, 0, 1, 0.4431373, 1,
-0.2433654, -0.3696622, -4.485376, 0, 1, 0.4470588, 1,
-0.2308539, -0.5666378, -3.595981, 0, 1, 0.454902, 1,
-0.2283866, -1.428368, -3.71856, 0, 1, 0.4588235, 1,
-0.2274235, 0.13648, -0.1701176, 0, 1, 0.4666667, 1,
-0.2272595, -0.9595829, -3.204646, 0, 1, 0.4705882, 1,
-0.2219552, -1.237608, -2.566724, 0, 1, 0.4784314, 1,
-0.2147866, 1.329899, -0.5927976, 0, 1, 0.4823529, 1,
-0.2130556, 0.4400804, -0.9516, 0, 1, 0.4901961, 1,
-0.2029276, -1.681851, -2.938543, 0, 1, 0.4941176, 1,
-0.2024077, -0.7259184, -1.804813, 0, 1, 0.5019608, 1,
-0.2013757, -0.4874879, -0.7635432, 0, 1, 0.509804, 1,
-0.2009698, 0.1779121, -0.3441694, 0, 1, 0.5137255, 1,
-0.2002815, 0.2806269, -0.8769868, 0, 1, 0.5215687, 1,
-0.1982152, -2.247837, -2.565658, 0, 1, 0.5254902, 1,
-0.1980883, -0.4463367, -3.315269, 0, 1, 0.5333334, 1,
-0.1939709, 1.531088, 0.2047548, 0, 1, 0.5372549, 1,
-0.1914321, 0.5603591, -0.3279695, 0, 1, 0.5450981, 1,
-0.1902227, -0.1332282, -1.372693, 0, 1, 0.5490196, 1,
-0.1893278, -1.456501, -3.581126, 0, 1, 0.5568628, 1,
-0.1888173, 0.5767837, -0.9347431, 0, 1, 0.5607843, 1,
-0.18612, 0.1192094, -0.6549168, 0, 1, 0.5686275, 1,
-0.1857377, -0.2077794, -2.631113, 0, 1, 0.572549, 1,
-0.1849807, -0.07784493, -1.782927, 0, 1, 0.5803922, 1,
-0.1809535, 0.4094274, 0.2042541, 0, 1, 0.5843138, 1,
-0.1743529, -0.4612968, -2.652486, 0, 1, 0.5921569, 1,
-0.1739577, 0.6247867, -1.47143, 0, 1, 0.5960785, 1,
-0.1732096, 0.1620344, -1.44532, 0, 1, 0.6039216, 1,
-0.1663611, 0.4537332, -0.9624169, 0, 1, 0.6117647, 1,
-0.1656324, 1.566546, 0.003945818, 0, 1, 0.6156863, 1,
-0.165255, -1.452191, -2.429689, 0, 1, 0.6235294, 1,
-0.1621666, 0.5641236, -0.6414678, 0, 1, 0.627451, 1,
-0.161849, 1.599893, -1.218591, 0, 1, 0.6352941, 1,
-0.15856, 0.4516006, 0.2058128, 0, 1, 0.6392157, 1,
-0.1566683, -0.9857905, -2.153119, 0, 1, 0.6470588, 1,
-0.154648, 0.8340505, -0.7664068, 0, 1, 0.6509804, 1,
-0.1514099, 0.862628, 1.482018, 0, 1, 0.6588235, 1,
-0.145619, 0.1113706, -0.388802, 0, 1, 0.6627451, 1,
-0.1430441, 0.1090687, -1.455229, 0, 1, 0.6705883, 1,
-0.1408201, 0.5745766, -0.5409155, 0, 1, 0.6745098, 1,
-0.1406578, 0.04391536, -2.743737, 0, 1, 0.682353, 1,
-0.1394175, 0.5208914, 1.963746, 0, 1, 0.6862745, 1,
-0.1357884, 0.4801071, -0.4250979, 0, 1, 0.6941177, 1,
-0.131129, 0.7431091, 0.8576379, 0, 1, 0.7019608, 1,
-0.1294149, -0.3014744, -2.985888, 0, 1, 0.7058824, 1,
-0.1288878, -0.3878336, -2.33471, 0, 1, 0.7137255, 1,
-0.126352, 0.8182361, -0.2876421, 0, 1, 0.7176471, 1,
-0.1261252, 1.340755, -0.2228618, 0, 1, 0.7254902, 1,
-0.1249913, 0.7333845, 1.073159, 0, 1, 0.7294118, 1,
-0.1215319, 0.2554106, -0.5013745, 0, 1, 0.7372549, 1,
-0.1200311, -0.1259523, -4.201324, 0, 1, 0.7411765, 1,
-0.1175133, 1.612292, -0.02619977, 0, 1, 0.7490196, 1,
-0.1173123, 0.1804559, -1.413584, 0, 1, 0.7529412, 1,
-0.1143484, -0.1029587, -2.254705, 0, 1, 0.7607843, 1,
-0.1142535, 2.354157, -1.510907, 0, 1, 0.7647059, 1,
-0.1111568, -0.1888321, -2.4446, 0, 1, 0.772549, 1,
-0.1072363, -0.2763683, -2.231482, 0, 1, 0.7764706, 1,
-0.1065017, -0.3712163, -3.308538, 0, 1, 0.7843137, 1,
-0.105219, -2.347992, -3.377268, 0, 1, 0.7882353, 1,
-0.100937, -1.058429, -3.46151, 0, 1, 0.7960784, 1,
-0.1004266, 0.9971677, 0.4546162, 0, 1, 0.8039216, 1,
-0.09827962, -0.2020445, -1.440806, 0, 1, 0.8078431, 1,
-0.0967383, 0.02286753, -2.042234, 0, 1, 0.8156863, 1,
-0.0963996, 0.27847, 1.042658, 0, 1, 0.8196079, 1,
-0.09451892, -0.3553805, -1.892712, 0, 1, 0.827451, 1,
-0.0922532, -1.073133, -3.093721, 0, 1, 0.8313726, 1,
-0.09122074, -0.04644843, -4.255688, 0, 1, 0.8392157, 1,
-0.09097134, 0.8956642, 1.94169, 0, 1, 0.8431373, 1,
-0.08314297, -0.1643732, -3.097944, 0, 1, 0.8509804, 1,
-0.07939929, 0.9525654, 0.8198666, 0, 1, 0.854902, 1,
-0.07860335, 1.444879, -1.016845, 0, 1, 0.8627451, 1,
-0.07720248, -1.013246, -3.010841, 0, 1, 0.8666667, 1,
-0.0676689, -1.386967, -2.986769, 0, 1, 0.8745098, 1,
-0.06543639, 0.2814963, -0.6624564, 0, 1, 0.8784314, 1,
-0.05725849, 0.7872381, -1.965793, 0, 1, 0.8862745, 1,
-0.05291186, 0.5355176, -1.330766, 0, 1, 0.8901961, 1,
-0.05207872, -0.3256887, -1.348006, 0, 1, 0.8980392, 1,
-0.05048991, 0.4300979, 1.185696, 0, 1, 0.9058824, 1,
-0.04809625, -0.06520849, -3.535954, 0, 1, 0.9098039, 1,
-0.04721138, -0.2518274, -3.173179, 0, 1, 0.9176471, 1,
-0.04535647, 1.315793, 0.3362817, 0, 1, 0.9215686, 1,
-0.04301397, -0.8685422, -4.86413, 0, 1, 0.9294118, 1,
-0.04128946, 1.064371, 0.7406014, 0, 1, 0.9333333, 1,
-0.04101484, -1.374412, -2.028392, 0, 1, 0.9411765, 1,
-0.04024219, 0.4032174, -1.635991, 0, 1, 0.945098, 1,
-0.03395985, -0.6492954, -3.084863, 0, 1, 0.9529412, 1,
-0.03288728, 0.5682306, -0.03494639, 0, 1, 0.9568627, 1,
-0.03226384, -0.9732706, -1.636877, 0, 1, 0.9647059, 1,
-0.03057166, 0.2929973, 0.01136195, 0, 1, 0.9686275, 1,
-0.03056227, -0.6507804, -3.809463, 0, 1, 0.9764706, 1,
-0.030168, 0.4515816, -0.8665631, 0, 1, 0.9803922, 1,
-0.02760465, 0.8544773, 0.8071532, 0, 1, 0.9882353, 1,
-0.0272024, -0.02676166, -3.503736, 0, 1, 0.9921569, 1,
-0.02480834, 0.7156395, 2.139581, 0, 1, 1, 1,
-0.02415236, 1.600461, -0.565627, 0, 0.9921569, 1, 1,
-0.02012228, 0.7902032, 0.9651052, 0, 0.9882353, 1, 1,
-0.01932545, 0.1928372, -0.2794112, 0, 0.9803922, 1, 1,
-0.0172253, -0.1061977, -3.826067, 0, 0.9764706, 1, 1,
-0.01598355, -0.4236313, -1.885757, 0, 0.9686275, 1, 1,
-0.01365099, -0.00994161, -1.319787, 0, 0.9647059, 1, 1,
-0.009113635, 0.04096949, 0.2332623, 0, 0.9568627, 1, 1,
-0.005014366, 0.2426366, 0.5996416, 0, 0.9529412, 1, 1,
-0.00349075, 1.046192, -0.09998823, 0, 0.945098, 1, 1,
-0.003421315, -0.6831971, -2.129722, 0, 0.9411765, 1, 1,
-0.001543886, 0.5241168, 1.2884, 0, 0.9333333, 1, 1,
-0.0005472435, -0.9063776, -3.202756, 0, 0.9294118, 1, 1,
0.008947025, 0.7612971, -0.6514642, 0, 0.9215686, 1, 1,
0.01178982, -1.186698, 3.115135, 0, 0.9176471, 1, 1,
0.01283374, 0.6154416, -1.068968, 0, 0.9098039, 1, 1,
0.01371808, 2.036319, 0.2430719, 0, 0.9058824, 1, 1,
0.01384173, -0.7416826, 3.810669, 0, 0.8980392, 1, 1,
0.01545263, 0.2630521, 0.5265516, 0, 0.8901961, 1, 1,
0.02232094, -1.72839, 2.748315, 0, 0.8862745, 1, 1,
0.02360801, -0.605545, 2.618433, 0, 0.8784314, 1, 1,
0.02475709, -0.8377196, 1.9355, 0, 0.8745098, 1, 1,
0.02861682, -0.3476317, 3.599509, 0, 0.8666667, 1, 1,
0.03099253, 0.4512547, -1.885602, 0, 0.8627451, 1, 1,
0.03408826, 0.6629361, -0.357648, 0, 0.854902, 1, 1,
0.03667166, 0.7714676, -0.04059343, 0, 0.8509804, 1, 1,
0.03749821, -0.2113047, 3.343433, 0, 0.8431373, 1, 1,
0.03794629, -0.7154487, 2.021113, 0, 0.8392157, 1, 1,
0.03796083, 0.440051, -0.1944671, 0, 0.8313726, 1, 1,
0.04055734, 1.216121, 1.74824, 0, 0.827451, 1, 1,
0.04085889, 0.2198924, 0.2626929, 0, 0.8196079, 1, 1,
0.04252194, 2.8044, 0.4684513, 0, 0.8156863, 1, 1,
0.04408301, 0.4775337, 0.3435255, 0, 0.8078431, 1, 1,
0.04416642, 0.02593218, -0.6102093, 0, 0.8039216, 1, 1,
0.04509737, 1.373164, 0.3571221, 0, 0.7960784, 1, 1,
0.0498778, -0.9860248, 3.764734, 0, 0.7882353, 1, 1,
0.05127791, -0.7566997, 1.716878, 0, 0.7843137, 1, 1,
0.05225955, 1.883249, 0.8442789, 0, 0.7764706, 1, 1,
0.05484593, 1.184674, 0.2604324, 0, 0.772549, 1, 1,
0.05514644, -0.4922938, 1.926659, 0, 0.7647059, 1, 1,
0.05952596, 0.7010233, 1.0199, 0, 0.7607843, 1, 1,
0.06445438, 0.75956, 2.045319, 0, 0.7529412, 1, 1,
0.06752177, 1.099933, 0.06038693, 0, 0.7490196, 1, 1,
0.06890328, -0.5843473, 4.000447, 0, 0.7411765, 1, 1,
0.06950298, -0.426489, 4.056626, 0, 0.7372549, 1, 1,
0.06999991, 0.8833645, 2.058514, 0, 0.7294118, 1, 1,
0.07150339, -0.9232981, 2.565916, 0, 0.7254902, 1, 1,
0.07351582, -0.6498184, 3.283478, 0, 0.7176471, 1, 1,
0.07538345, -0.2665795, 3.84686, 0, 0.7137255, 1, 1,
0.07840601, -1.249115, 4.653528, 0, 0.7058824, 1, 1,
0.07937416, -0.2216836, 2.891984, 0, 0.6980392, 1, 1,
0.08151978, -0.3150205, 3.209142, 0, 0.6941177, 1, 1,
0.0837274, 0.3227513, 0.6609757, 0, 0.6862745, 1, 1,
0.08543484, 2.127915, 3.385087, 0, 0.682353, 1, 1,
0.08928145, -0.1413669, 3.160057, 0, 0.6745098, 1, 1,
0.09023062, -0.4893905, 2.766465, 0, 0.6705883, 1, 1,
0.09806667, 0.6120902, 0.4357966, 0, 0.6627451, 1, 1,
0.1020476, -0.4190851, 2.486967, 0, 0.6588235, 1, 1,
0.1092475, 0.4142995, 0.82578, 0, 0.6509804, 1, 1,
0.1108454, 1.032999, 0.6773726, 0, 0.6470588, 1, 1,
0.1164633, -1.114926, 1.30318, 0, 0.6392157, 1, 1,
0.1219747, -1.153166, 2.090838, 0, 0.6352941, 1, 1,
0.1239411, 1.485994, 0.1465472, 0, 0.627451, 1, 1,
0.1244028, 0.9540816, -1.846073, 0, 0.6235294, 1, 1,
0.1253765, -0.0240662, 1.658324, 0, 0.6156863, 1, 1,
0.1315966, -0.04704326, 3.015121, 0, 0.6117647, 1, 1,
0.1317313, -0.2552192, 4.516961, 0, 0.6039216, 1, 1,
0.1318132, -0.5709061, 3.945387, 0, 0.5960785, 1, 1,
0.1320264, -0.5172014, 1.804606, 0, 0.5921569, 1, 1,
0.1337564, -0.7648705, 2.973176, 0, 0.5843138, 1, 1,
0.1392417, 0.5947319, 0.8508181, 0, 0.5803922, 1, 1,
0.1428757, 0.07612957, 1.289709, 0, 0.572549, 1, 1,
0.1437372, -0.7942178, 3.321531, 0, 0.5686275, 1, 1,
0.1471855, -0.05697074, 1.93827, 0, 0.5607843, 1, 1,
0.148013, -1.14038, 3.447372, 0, 0.5568628, 1, 1,
0.150814, -1.916067, 3.407698, 0, 0.5490196, 1, 1,
0.1513981, -0.6265429, 2.039345, 0, 0.5450981, 1, 1,
0.156474, 3.18789, -1.308714, 0, 0.5372549, 1, 1,
0.1603161, 0.3424592, 0.04927428, 0, 0.5333334, 1, 1,
0.161717, 0.06644235, 0.4652089, 0, 0.5254902, 1, 1,
0.1658236, 1.44721, 0.4641274, 0, 0.5215687, 1, 1,
0.1730464, 0.7069256, 1.704636, 0, 0.5137255, 1, 1,
0.1746494, 1.595799, 0.2732704, 0, 0.509804, 1, 1,
0.1776417, 1.68117, -0.618709, 0, 0.5019608, 1, 1,
0.1921024, -0.4376721, 1.278403, 0, 0.4941176, 1, 1,
0.1942951, 0.6137629, 0.4831122, 0, 0.4901961, 1, 1,
0.1961451, 0.8576196, -2.249463, 0, 0.4823529, 1, 1,
0.1988426, 1.252948, 0.1079621, 0, 0.4784314, 1, 1,
0.1990968, -0.9255649, 4.684775, 0, 0.4705882, 1, 1,
0.2007829, -2.055447, 3.78319, 0, 0.4666667, 1, 1,
0.2070818, -0.2985481, 2.496449, 0, 0.4588235, 1, 1,
0.2159554, 0.06305561, 2.057986, 0, 0.454902, 1, 1,
0.2182978, 0.5034471, -0.5416965, 0, 0.4470588, 1, 1,
0.2188042, 0.1800838, 0.1603848, 0, 0.4431373, 1, 1,
0.2190096, -0.3158731, 3.4477, 0, 0.4352941, 1, 1,
0.2194151, -1.01553, 2.432117, 0, 0.4313726, 1, 1,
0.2194211, -0.8383624, 3.223804, 0, 0.4235294, 1, 1,
0.2305734, -0.6620151, 3.890348, 0, 0.4196078, 1, 1,
0.2307003, -0.6752807, 2.211371, 0, 0.4117647, 1, 1,
0.2361397, -1.401044, 2.842158, 0, 0.4078431, 1, 1,
0.2420792, -0.3918793, 2.169861, 0, 0.4, 1, 1,
0.2430464, 0.2744489, -0.2353378, 0, 0.3921569, 1, 1,
0.2516602, 0.65185, 1.652558, 0, 0.3882353, 1, 1,
0.2543782, 1.289036, -1.690083, 0, 0.3803922, 1, 1,
0.2576573, -0.005783693, 2.816329, 0, 0.3764706, 1, 1,
0.2601209, -0.7188658, 2.530236, 0, 0.3686275, 1, 1,
0.2621197, -0.4707019, 1.518284, 0, 0.3647059, 1, 1,
0.2664621, -1.016912, 1.867927, 0, 0.3568628, 1, 1,
0.2674951, 0.3346945, 1.171243, 0, 0.3529412, 1, 1,
0.2691345, 2.550602, 0.2255898, 0, 0.345098, 1, 1,
0.2712385, 0.7669026, -0.4507847, 0, 0.3411765, 1, 1,
0.271264, -0.5450997, 3.319308, 0, 0.3333333, 1, 1,
0.271856, 0.4865457, 1.446656, 0, 0.3294118, 1, 1,
0.2784524, 0.004523837, 2.214052, 0, 0.3215686, 1, 1,
0.2838574, 0.5305671, 0.597445, 0, 0.3176471, 1, 1,
0.2849831, -1.346054, 4.290412, 0, 0.3098039, 1, 1,
0.2873854, 1.72391, -1.231827, 0, 0.3058824, 1, 1,
0.288909, 0.1003416, 0.2745351, 0, 0.2980392, 1, 1,
0.2947101, 0.5093194, 0.3607857, 0, 0.2901961, 1, 1,
0.2947592, 0.5387787, 0.1186177, 0, 0.2862745, 1, 1,
0.3015904, -0.9636586, 2.473299, 0, 0.2784314, 1, 1,
0.3017198, -2.162281, 4.199886, 0, 0.2745098, 1, 1,
0.3042669, 0.8773621, 0.838707, 0, 0.2666667, 1, 1,
0.3057165, 0.3725192, 2.055954, 0, 0.2627451, 1, 1,
0.3059444, 0.5199614, -0.4317206, 0, 0.254902, 1, 1,
0.3068803, -0.933741, 2.692369, 0, 0.2509804, 1, 1,
0.3083524, 0.5400786, 2.626056, 0, 0.2431373, 1, 1,
0.3178598, 0.6461228, 1.146906, 0, 0.2392157, 1, 1,
0.3188788, 0.9857281, -1.278646, 0, 0.2313726, 1, 1,
0.3260478, 0.4326127, 1.788903, 0, 0.227451, 1, 1,
0.3274646, 1.157053, 0.70838, 0, 0.2196078, 1, 1,
0.3278661, 0.7171168, 0.009699186, 0, 0.2156863, 1, 1,
0.3338681, 0.421949, 0.904456, 0, 0.2078431, 1, 1,
0.3413697, -0.7009534, 3.782748, 0, 0.2039216, 1, 1,
0.3414014, 0.6614646, -0.8753261, 0, 0.1960784, 1, 1,
0.342047, -0.1214546, 3.464494, 0, 0.1882353, 1, 1,
0.3422032, -0.4178756, 2.123761, 0, 0.1843137, 1, 1,
0.3447286, 0.3960711, 0.4367831, 0, 0.1764706, 1, 1,
0.3474215, 0.7355855, 0.08195862, 0, 0.172549, 1, 1,
0.3488536, 1.069517, 0.7290446, 0, 0.1647059, 1, 1,
0.3503084, -0.1485918, 3.554305, 0, 0.1607843, 1, 1,
0.3515586, -0.445696, 1.024485, 0, 0.1529412, 1, 1,
0.3520582, 0.8122587, -0.7718991, 0, 0.1490196, 1, 1,
0.3530619, 1.173256, 1.003201, 0, 0.1411765, 1, 1,
0.3532709, 0.1515713, -0.8921239, 0, 0.1372549, 1, 1,
0.3603126, 1.12495, 1.891147, 0, 0.1294118, 1, 1,
0.3659815, 0.7313874, 2.017222, 0, 0.1254902, 1, 1,
0.3670398, 1.244611, 0.2143746, 0, 0.1176471, 1, 1,
0.3678896, -1.452015, 2.987745, 0, 0.1137255, 1, 1,
0.3755543, 0.0239399, 0.5525858, 0, 0.1058824, 1, 1,
0.3755826, 0.9508429, 0.5866691, 0, 0.09803922, 1, 1,
0.3763624, 0.6793966, 0.882018, 0, 0.09411765, 1, 1,
0.381854, -0.306801, 1.454437, 0, 0.08627451, 1, 1,
0.3844276, -0.1083741, -0.07867385, 0, 0.08235294, 1, 1,
0.3855449, 0.05769404, 0.5911235, 0, 0.07450981, 1, 1,
0.3855546, -0.7631879, 2.809515, 0, 0.07058824, 1, 1,
0.3877994, -1.182007, 4.253472, 0, 0.0627451, 1, 1,
0.3917484, -0.6135513, 1.528826, 0, 0.05882353, 1, 1,
0.3922651, 1.484488, -0.2079783, 0, 0.05098039, 1, 1,
0.3940775, -1.423778, 1.241342, 0, 0.04705882, 1, 1,
0.4025426, -1.180987, 3.267253, 0, 0.03921569, 1, 1,
0.4043775, -0.7386903, 2.199272, 0, 0.03529412, 1, 1,
0.4047558, -0.02657667, 1.505752, 0, 0.02745098, 1, 1,
0.4072929, -1.342609, 3.502383, 0, 0.02352941, 1, 1,
0.4075437, -0.1099005, 3.280336, 0, 0.01568628, 1, 1,
0.4094093, 0.1970637, 0.1781357, 0, 0.01176471, 1, 1,
0.4131809, 0.9885594, 0.1447161, 0, 0.003921569, 1, 1,
0.4133287, 0.4339944, 1.313366, 0.003921569, 0, 1, 1,
0.4138056, -0.369147, 1.76617, 0.007843138, 0, 1, 1,
0.4147313, -0.4554479, 1.461618, 0.01568628, 0, 1, 1,
0.4154878, 1.16498, 1.048566, 0.01960784, 0, 1, 1,
0.4272427, 0.2636518, -0.3014797, 0.02745098, 0, 1, 1,
0.4282084, -0.9960045, 0.2780818, 0.03137255, 0, 1, 1,
0.4299374, 0.1660481, 3.459597, 0.03921569, 0, 1, 1,
0.4304911, -0.04873949, 1.501123, 0.04313726, 0, 1, 1,
0.4336238, 1.000941, -1.08562, 0.05098039, 0, 1, 1,
0.4337239, -0.9758382, 3.880327, 0.05490196, 0, 1, 1,
0.4342634, -0.2225398, 2.041811, 0.0627451, 0, 1, 1,
0.4351885, 0.9669528, 0.2859621, 0.06666667, 0, 1, 1,
0.4352402, 1.475146, 1.006553, 0.07450981, 0, 1, 1,
0.4362451, -0.07097826, 2.663787, 0.07843138, 0, 1, 1,
0.4373285, 1.545711, 0.2331173, 0.08627451, 0, 1, 1,
0.441395, -0.356704, 2.245082, 0.09019608, 0, 1, 1,
0.4428773, 0.230249, 1.117761, 0.09803922, 0, 1, 1,
0.4436172, -0.2466278, 0.7360704, 0.1058824, 0, 1, 1,
0.4501405, -1.434211, 2.575223, 0.1098039, 0, 1, 1,
0.450176, 1.766521, 0.397412, 0.1176471, 0, 1, 1,
0.452428, -0.04164566, 2.114125, 0.1215686, 0, 1, 1,
0.4530221, -0.9794424, 3.338846, 0.1294118, 0, 1, 1,
0.4608747, 0.8145103, -0.07007847, 0.1333333, 0, 1, 1,
0.463149, -0.1955056, 0.3717138, 0.1411765, 0, 1, 1,
0.4721612, 2.816303, -0.1275539, 0.145098, 0, 1, 1,
0.4762549, -0.6848449, 2.29154, 0.1529412, 0, 1, 1,
0.4792381, -0.4746771, 3.032674, 0.1568628, 0, 1, 1,
0.4811631, 1.636709, 2.004534, 0.1647059, 0, 1, 1,
0.4822482, 1.161715, 1.720096, 0.1686275, 0, 1, 1,
0.483539, 0.4010642, 2.69253, 0.1764706, 0, 1, 1,
0.4883917, 0.2282243, 1.054889, 0.1803922, 0, 1, 1,
0.4911076, -0.5849972, 1.001742, 0.1882353, 0, 1, 1,
0.4914015, 1.046225, 1.016375, 0.1921569, 0, 1, 1,
0.5082331, 0.01891241, 1.388716, 0.2, 0, 1, 1,
0.51042, 0.5722539, -0.5940495, 0.2078431, 0, 1, 1,
0.5191488, -1.674762, 4.952342, 0.2117647, 0, 1, 1,
0.5204299, -0.5309975, 1.959408, 0.2196078, 0, 1, 1,
0.5273867, 1.967861, 0.3420223, 0.2235294, 0, 1, 1,
0.5319444, 0.338611, 1.823446, 0.2313726, 0, 1, 1,
0.5339917, 0.3198315, 0.2001062, 0.2352941, 0, 1, 1,
0.5357006, 0.1633501, 1.220625, 0.2431373, 0, 1, 1,
0.5380323, -1.319549, 2.748144, 0.2470588, 0, 1, 1,
0.5527611, 0.2472935, 1.379432, 0.254902, 0, 1, 1,
0.5555059, -1.969112, 3.338732, 0.2588235, 0, 1, 1,
0.556127, -0.4704603, 2.178059, 0.2666667, 0, 1, 1,
0.5602673, -0.1867072, 1.807084, 0.2705882, 0, 1, 1,
0.5602899, -0.2460097, 0.7697003, 0.2784314, 0, 1, 1,
0.5613653, 0.2163879, -0.1686327, 0.282353, 0, 1, 1,
0.5639935, -0.6662068, 4.66451, 0.2901961, 0, 1, 1,
0.5658273, -0.5827624, 2.532311, 0.2941177, 0, 1, 1,
0.5679928, -0.2775814, 1.543433, 0.3019608, 0, 1, 1,
0.571007, -0.4179414, 0.8229466, 0.3098039, 0, 1, 1,
0.5744702, 0.9941198, 1.572114, 0.3137255, 0, 1, 1,
0.5745864, 0.7138724, 0.9171329, 0.3215686, 0, 1, 1,
0.5757998, -0.4800087, 2.347865, 0.3254902, 0, 1, 1,
0.5820048, 1.500948, -0.9414626, 0.3333333, 0, 1, 1,
0.5826656, -1.806742, 2.73812, 0.3372549, 0, 1, 1,
0.585534, 0.2005236, 1.371477, 0.345098, 0, 1, 1,
0.5865433, -1.138153, 4.030665, 0.3490196, 0, 1, 1,
0.5953895, 0.5531169, 3.225102, 0.3568628, 0, 1, 1,
0.5958654, 0.4722839, 1.811408, 0.3607843, 0, 1, 1,
0.5961352, -0.2715243, 2.663709, 0.3686275, 0, 1, 1,
0.6003241, 1.505308, 0.7458605, 0.372549, 0, 1, 1,
0.6029773, -1.364713, 1.640355, 0.3803922, 0, 1, 1,
0.6035015, -1.212796, 4.120973, 0.3843137, 0, 1, 1,
0.606021, 0.8739912, 0.4112512, 0.3921569, 0, 1, 1,
0.6187295, 1.324006, -0.4104861, 0.3960784, 0, 1, 1,
0.6205253, -1.098609, 2.418319, 0.4039216, 0, 1, 1,
0.6220813, -1.055313, 1.71704, 0.4117647, 0, 1, 1,
0.6226239, -1.111445, 1.992221, 0.4156863, 0, 1, 1,
0.6252938, 1.05675, 0.5037121, 0.4235294, 0, 1, 1,
0.6276389, 1.244792, 0.9529161, 0.427451, 0, 1, 1,
0.6352156, 0.6857234, -0.000960644, 0.4352941, 0, 1, 1,
0.6373723, 1.312034, 0.2920125, 0.4392157, 0, 1, 1,
0.6383635, -1.918839, 3.275803, 0.4470588, 0, 1, 1,
0.6406599, -0.01006925, 3.548272, 0.4509804, 0, 1, 1,
0.6444767, -0.7743596, 3.533542, 0.4588235, 0, 1, 1,
0.6454145, -0.01459677, 2.730395, 0.4627451, 0, 1, 1,
0.6459492, 0.430608, 0.8049754, 0.4705882, 0, 1, 1,
0.6476911, 1.565585, 2.126791, 0.4745098, 0, 1, 1,
0.6546686, -0.1525053, 0.447823, 0.4823529, 0, 1, 1,
0.655799, -0.719484, 2.465768, 0.4862745, 0, 1, 1,
0.6580061, -1.1678, 2.961299, 0.4941176, 0, 1, 1,
0.6580631, -0.005138148, 1.471888, 0.5019608, 0, 1, 1,
0.6694081, 1.043173, 1.988866, 0.5058824, 0, 1, 1,
0.6756584, 0.2185933, -0.3947642, 0.5137255, 0, 1, 1,
0.6770871, -0.5139952, 2.146387, 0.5176471, 0, 1, 1,
0.6815097, 2.472614, 0.9023244, 0.5254902, 0, 1, 1,
0.6891561, -0.07232513, 1.389092, 0.5294118, 0, 1, 1,
0.6898824, 1.745743, 0.9956627, 0.5372549, 0, 1, 1,
0.691426, -0.5333067, 1.676985, 0.5411765, 0, 1, 1,
0.6934433, 0.03349408, 0.3787123, 0.5490196, 0, 1, 1,
0.6970226, 0.1951256, 1.484397, 0.5529412, 0, 1, 1,
0.6995343, -0.6419348, 2.692862, 0.5607843, 0, 1, 1,
0.7014531, 0.8738062, 0.7448884, 0.5647059, 0, 1, 1,
0.7028625, 1.018139, -0.08546536, 0.572549, 0, 1, 1,
0.7042038, -1.670967, 2.455647, 0.5764706, 0, 1, 1,
0.7059931, 1.641656, -1.376141, 0.5843138, 0, 1, 1,
0.7083552, -0.8926368, 1.728912, 0.5882353, 0, 1, 1,
0.7155814, -0.6967432, 1.412641, 0.5960785, 0, 1, 1,
0.7185395, 1.302971, 1.391454, 0.6039216, 0, 1, 1,
0.7200329, 0.389169, 4.211642, 0.6078432, 0, 1, 1,
0.7218185, -0.05765647, 1.544732, 0.6156863, 0, 1, 1,
0.7223546, 1.521086, -1.168953, 0.6196079, 0, 1, 1,
0.7235602, -0.9541919, 2.805177, 0.627451, 0, 1, 1,
0.7278867, -0.272066, 1.485115, 0.6313726, 0, 1, 1,
0.7327018, -0.2064451, 0.03262501, 0.6392157, 0, 1, 1,
0.7340969, 0.6151503, 0.5603181, 0.6431373, 0, 1, 1,
0.7358569, 0.547068, 0.214451, 0.6509804, 0, 1, 1,
0.7402669, 0.2617408, -0.05695262, 0.654902, 0, 1, 1,
0.7413009, -0.5844569, 2.199969, 0.6627451, 0, 1, 1,
0.744288, -0.02758536, 0.9817846, 0.6666667, 0, 1, 1,
0.7499363, 0.1774231, 1.274488, 0.6745098, 0, 1, 1,
0.7528596, 0.7198585, 0.928624, 0.6784314, 0, 1, 1,
0.7584976, 0.4768717, 1.994447, 0.6862745, 0, 1, 1,
0.7594655, 0.580617, 0.771792, 0.6901961, 0, 1, 1,
0.7636387, -1.213305, 2.098663, 0.6980392, 0, 1, 1,
0.7637482, -0.9409984, 1.970194, 0.7058824, 0, 1, 1,
0.7692701, -0.802223, 2.841992, 0.7098039, 0, 1, 1,
0.7741519, -0.01752625, -1.169282, 0.7176471, 0, 1, 1,
0.78202, -0.1704608, 3.314904, 0.7215686, 0, 1, 1,
0.7834212, -2.411671, 3.013003, 0.7294118, 0, 1, 1,
0.8042704, 0.2462173, 1.057318, 0.7333333, 0, 1, 1,
0.8095118, -0.02549371, 0.7361926, 0.7411765, 0, 1, 1,
0.8098921, 0.1551018, 0.7948363, 0.7450981, 0, 1, 1,
0.8148432, 0.07238679, 0.2274736, 0.7529412, 0, 1, 1,
0.820784, 0.4552959, -0.9709804, 0.7568628, 0, 1, 1,
0.8242171, -1.565035, 2.571408, 0.7647059, 0, 1, 1,
0.8313703, -0.01636506, 3.399171, 0.7686275, 0, 1, 1,
0.8409263, 0.7371677, 0.9537685, 0.7764706, 0, 1, 1,
0.8482865, 1.477633, 1.169996, 0.7803922, 0, 1, 1,
0.8523723, -1.021931, 2.990289, 0.7882353, 0, 1, 1,
0.8543315, 0.6434749, -0.6458502, 0.7921569, 0, 1, 1,
0.861817, 2.115177, -1.017261, 0.8, 0, 1, 1,
0.8621656, 0.1879922, 0.5944918, 0.8078431, 0, 1, 1,
0.8776765, -1.443609, 3.422678, 0.8117647, 0, 1, 1,
0.8795403, -0.7967941, 3.209054, 0.8196079, 0, 1, 1,
0.8879512, 2.04149, 1.093708, 0.8235294, 0, 1, 1,
0.8927233, -0.4396112, 1.539059, 0.8313726, 0, 1, 1,
0.8928781, 1.540864, -0.9471614, 0.8352941, 0, 1, 1,
0.8944206, -0.1613642, 1.159331, 0.8431373, 0, 1, 1,
0.89499, -0.04420792, 1.137049, 0.8470588, 0, 1, 1,
0.9035298, 0.8325633, -0.4091083, 0.854902, 0, 1, 1,
0.9057675, -1.4601, 3.864912, 0.8588235, 0, 1, 1,
0.9094386, -0.6373786, 1.674646, 0.8666667, 0, 1, 1,
0.9117832, 0.9191842, 1.239907, 0.8705882, 0, 1, 1,
0.9199554, -0.1271296, 1.967589, 0.8784314, 0, 1, 1,
0.9246992, 1.517019, -0.0578972, 0.8823529, 0, 1, 1,
0.9271357, 2.417352, 1.618876, 0.8901961, 0, 1, 1,
0.9296509, 0.2093768, 0.553367, 0.8941177, 0, 1, 1,
0.9333051, 2.391759, -0.8555167, 0.9019608, 0, 1, 1,
0.9337081, 1.404707, -0.9601791, 0.9098039, 0, 1, 1,
0.9360219, -1.0969, 1.533917, 0.9137255, 0, 1, 1,
0.9360482, -0.7798027, 3.194352, 0.9215686, 0, 1, 1,
0.939486, 1.275702, 1.72724, 0.9254902, 0, 1, 1,
0.9412164, 0.04839308, 2.688449, 0.9333333, 0, 1, 1,
0.9414847, 1.277042, 0.471618, 0.9372549, 0, 1, 1,
0.9419081, 1.560741, 1.212085, 0.945098, 0, 1, 1,
0.9527727, -0.2460581, 0.6173042, 0.9490196, 0, 1, 1,
0.954531, -0.5007375, 2.049049, 0.9568627, 0, 1, 1,
0.9588158, 0.6884497, -0.9499183, 0.9607843, 0, 1, 1,
0.9588231, 0.8831809, -0.02523334, 0.9686275, 0, 1, 1,
0.9625556, 0.2783203, 0.2860316, 0.972549, 0, 1, 1,
0.9637195, 0.03823547, 1.490136, 0.9803922, 0, 1, 1,
0.9733723, -0.5535741, 0.900529, 0.9843137, 0, 1, 1,
0.9761274, -0.103645, 2.185197, 0.9921569, 0, 1, 1,
0.9843273, 0.07603525, 0.4883162, 0.9960784, 0, 1, 1,
0.9865636, -0.1115272, 2.89209, 1, 0, 0.9960784, 1,
0.9877594, -0.6903645, 2.891289, 1, 0, 0.9882353, 1,
0.9932569, -0.8580092, 3.242976, 1, 0, 0.9843137, 1,
0.9998171, -2.844077, 1.408528, 1, 0, 0.9764706, 1,
1.001536, -0.1286402, 2.327413, 1, 0, 0.972549, 1,
1.002346, 0.5377505, 0.2037369, 1, 0, 0.9647059, 1,
1.004932, 0.5636441, 0.9200856, 1, 0, 0.9607843, 1,
1.00796, -1.364131, 1.953825, 1, 0, 0.9529412, 1,
1.009327, -1.611727, 4.225727, 1, 0, 0.9490196, 1,
1.009341, 1.36187, -0.1269196, 1, 0, 0.9411765, 1,
1.009434, 1.25126, 1.409564, 1, 0, 0.9372549, 1,
1.011788, -0.6652765, 1.218506, 1, 0, 0.9294118, 1,
1.01274, 0.7908931, 0.6474505, 1, 0, 0.9254902, 1,
1.01843, -0.05748597, 3.173604, 1, 0, 0.9176471, 1,
1.018477, 0.7929574, 1.127236, 1, 0, 0.9137255, 1,
1.020941, -1.262665, 0.4340044, 1, 0, 0.9058824, 1,
1.026168, 0.2199435, 0.6317505, 1, 0, 0.9019608, 1,
1.030225, 0.16232, 1.051564, 1, 0, 0.8941177, 1,
1.032366, -0.05513331, 2.499797, 1, 0, 0.8862745, 1,
1.042353, -1.212893, 2.086253, 1, 0, 0.8823529, 1,
1.051921, 0.8156071, 0.3774634, 1, 0, 0.8745098, 1,
1.052224, 1.122857, 0.7558066, 1, 0, 0.8705882, 1,
1.062266, -0.5325886, 1.270716, 1, 0, 0.8627451, 1,
1.065572, 0.7690843, 0.657071, 1, 0, 0.8588235, 1,
1.080577, -0.7954717, 2.64972, 1, 0, 0.8509804, 1,
1.090052, 0.6941257, 1.854401, 1, 0, 0.8470588, 1,
1.093643, -0.9721519, 1.497234, 1, 0, 0.8392157, 1,
1.098306, 0.4325325, 0.4591891, 1, 0, 0.8352941, 1,
1.103316, -0.2710294, 3.255587, 1, 0, 0.827451, 1,
1.107629, 1.72127, 0.7209328, 1, 0, 0.8235294, 1,
1.115357, 0.6869686, 0.2020349, 1, 0, 0.8156863, 1,
1.116644, 0.4322697, 1.026814, 1, 0, 0.8117647, 1,
1.117602, -1.13441, 2.124516, 1, 0, 0.8039216, 1,
1.11966, -1.545641, 1.755208, 1, 0, 0.7960784, 1,
1.12075, 1.573848, 1.134993, 1, 0, 0.7921569, 1,
1.1257, -0.5269907, 1.893194, 1, 0, 0.7843137, 1,
1.12573, 0.6872657, 0.5646478, 1, 0, 0.7803922, 1,
1.133582, -1.245578, 2.742676, 1, 0, 0.772549, 1,
1.140088, -0.04442558, 1.900715, 1, 0, 0.7686275, 1,
1.148639, -0.2560171, 2.327557, 1, 0, 0.7607843, 1,
1.149719, -0.0437774, 1.114016, 1, 0, 0.7568628, 1,
1.160719, -0.7748572, 2.682869, 1, 0, 0.7490196, 1,
1.161326, -0.1505962, 0.5650037, 1, 0, 0.7450981, 1,
1.165338, 1.686609, 2.077176, 1, 0, 0.7372549, 1,
1.173034, -1.762149, 2.88695, 1, 0, 0.7333333, 1,
1.180389, -0.5410255, 0.4692488, 1, 0, 0.7254902, 1,
1.181812, 0.3931764, -0.06577958, 1, 0, 0.7215686, 1,
1.188411, -0.08809225, 2.391388, 1, 0, 0.7137255, 1,
1.191319, -0.4515513, 1.721817, 1, 0, 0.7098039, 1,
1.193396, -0.2662667, 2.919531, 1, 0, 0.7019608, 1,
1.19704, -0.8701323, 3.068085, 1, 0, 0.6941177, 1,
1.201361, -0.05890071, 2.197568, 1, 0, 0.6901961, 1,
1.202536, 0.1244393, 1.660985, 1, 0, 0.682353, 1,
1.204187, 0.8124016, -0.07463962, 1, 0, 0.6784314, 1,
1.214021, -0.3920157, 1.518054, 1, 0, 0.6705883, 1,
1.225196, 0.1223115, 1.928347, 1, 0, 0.6666667, 1,
1.226018, -0.0842111, -0.2478588, 1, 0, 0.6588235, 1,
1.22823, -0.7498004, 4.109748, 1, 0, 0.654902, 1,
1.23008, -0.8965043, 2.462919, 1, 0, 0.6470588, 1,
1.230767, 0.5112212, -0.4255788, 1, 0, 0.6431373, 1,
1.23394, 0.535643, 1.012955, 1, 0, 0.6352941, 1,
1.237753, 0.8183677, -0.02943102, 1, 0, 0.6313726, 1,
1.247348, 0.2034515, 0.002618599, 1, 0, 0.6235294, 1,
1.247821, -1.063379, 1.746032, 1, 0, 0.6196079, 1,
1.255281, -0.1047161, 1.691396, 1, 0, 0.6117647, 1,
1.255347, 0.6513417, 1.702509, 1, 0, 0.6078432, 1,
1.268124, -1.22759, 2.079252, 1, 0, 0.6, 1,
1.268217, 0.1790612, 1.823157, 1, 0, 0.5921569, 1,
1.272735, 0.575853, 1.811996, 1, 0, 0.5882353, 1,
1.281705, -0.4208428, 2.382102, 1, 0, 0.5803922, 1,
1.289139, 0.8228677, 0.8165132, 1, 0, 0.5764706, 1,
1.305298, -0.6829836, 2.017924, 1, 0, 0.5686275, 1,
1.30946, 0.8356582, 1.118394, 1, 0, 0.5647059, 1,
1.324072, -0.4531973, 1.218037, 1, 0, 0.5568628, 1,
1.324498, -0.2502763, 1.85221, 1, 0, 0.5529412, 1,
1.325319, -0.05064417, 1.522072, 1, 0, 0.5450981, 1,
1.328073, 2.012789, 1.943284, 1, 0, 0.5411765, 1,
1.329554, -1.642249, 4.728979, 1, 0, 0.5333334, 1,
1.344261, -0.7054363, 1.438619, 1, 0, 0.5294118, 1,
1.348985, -1.027937, 2.751245, 1, 0, 0.5215687, 1,
1.350453, -1.294151, 3.48881, 1, 0, 0.5176471, 1,
1.350588, -0.4748458, 1.377075, 1, 0, 0.509804, 1,
1.364746, 0.8341197, 1.982133, 1, 0, 0.5058824, 1,
1.365299, -0.3276232, 2.341598, 1, 0, 0.4980392, 1,
1.366988, -0.9918117, 3.394176, 1, 0, 0.4901961, 1,
1.393225, 0.1448571, 3.735709, 1, 0, 0.4862745, 1,
1.398773, 0.6269606, 0.2858186, 1, 0, 0.4784314, 1,
1.399113, 0.1735469, 3.276109, 1, 0, 0.4745098, 1,
1.41053, -0.3159781, 2.400996, 1, 0, 0.4666667, 1,
1.410628, 1.938809, -0.2892407, 1, 0, 0.4627451, 1,
1.411207, -0.1689468, 2.206052, 1, 0, 0.454902, 1,
1.411473, 0.5622413, 1.71164, 1, 0, 0.4509804, 1,
1.41186, -1.031716, 1.706496, 1, 0, 0.4431373, 1,
1.412706, 1.525081, 0.03417259, 1, 0, 0.4392157, 1,
1.419538, 0.00143022, 2.059283, 1, 0, 0.4313726, 1,
1.425956, -0.6473995, 1.476729, 1, 0, 0.427451, 1,
1.429366, 0.3701221, 1.377047, 1, 0, 0.4196078, 1,
1.430099, 1.103265, 0.7083943, 1, 0, 0.4156863, 1,
1.438306, -0.4271182, 4.2541, 1, 0, 0.4078431, 1,
1.443749, 0.6756138, 2.692661, 1, 0, 0.4039216, 1,
1.447872, 0.4580565, 0.4885807, 1, 0, 0.3960784, 1,
1.455398, -1.397584, 0.5841359, 1, 0, 0.3882353, 1,
1.457488, -0.9086864, 1.78226, 1, 0, 0.3843137, 1,
1.476387, -0.4157736, 2.356409, 1, 0, 0.3764706, 1,
1.501954, 1.316972, 0.8517107, 1, 0, 0.372549, 1,
1.50214, 1.462687, 1.186802, 1, 0, 0.3647059, 1,
1.507653, -1.229491, 1.936604, 1, 0, 0.3607843, 1,
1.509308, -0.7002411, 3.140492, 1, 0, 0.3529412, 1,
1.526473, 0.4073298, 2.616889, 1, 0, 0.3490196, 1,
1.551953, 1.066884, 0.04348741, 1, 0, 0.3411765, 1,
1.55624, 0.4195136, 2.31309, 1, 0, 0.3372549, 1,
1.568369, -0.3001468, 1.715331, 1, 0, 0.3294118, 1,
1.581427, 0.5542244, 2.867082, 1, 0, 0.3254902, 1,
1.582494, -0.4391352, 3.819609, 1, 0, 0.3176471, 1,
1.588784, 0.3820889, 1.040932, 1, 0, 0.3137255, 1,
1.602963, -0.6688921, 2.246909, 1, 0, 0.3058824, 1,
1.606864, 0.1108998, 2.134389, 1, 0, 0.2980392, 1,
1.612524, -0.4517821, 2.310639, 1, 0, 0.2941177, 1,
1.617082, 0.7062389, 1.415895, 1, 0, 0.2862745, 1,
1.644492, -0.5091935, 2.02197, 1, 0, 0.282353, 1,
1.669946, -0.6706583, 3.212303, 1, 0, 0.2745098, 1,
1.690004, 1.004266, -0.3825001, 1, 0, 0.2705882, 1,
1.697399, 0.685029, 0.692533, 1, 0, 0.2627451, 1,
1.710403, 0.921137, 2.190794, 1, 0, 0.2588235, 1,
1.723259, 0.4231031, 1.546087, 1, 0, 0.2509804, 1,
1.731576, 0.158326, 1.586643, 1, 0, 0.2470588, 1,
1.741429, 0.8640738, 1.124365, 1, 0, 0.2392157, 1,
1.77094, -0.6271486, 2.941159, 1, 0, 0.2352941, 1,
1.771914, 0.6346796, 0.2832943, 1, 0, 0.227451, 1,
1.794405, -0.2129728, 2.141115, 1, 0, 0.2235294, 1,
1.794936, -0.008059693, 1.185, 1, 0, 0.2156863, 1,
1.810503, 0.6269402, 0.2941552, 1, 0, 0.2117647, 1,
1.817887, -0.5723031, 3.188992, 1, 0, 0.2039216, 1,
1.825429, 1.062006, 1.584835, 1, 0, 0.1960784, 1,
1.825667, 0.3836288, -0.8338678, 1, 0, 0.1921569, 1,
1.873246, -1.498414, 0.5858976, 1, 0, 0.1843137, 1,
1.894016, -0.1321083, 0.5263022, 1, 0, 0.1803922, 1,
1.896299, -0.02509728, 4.204708, 1, 0, 0.172549, 1,
1.971796, 2.032033, -0.5624775, 1, 0, 0.1686275, 1,
1.978405, -0.9174101, 1.436369, 1, 0, 0.1607843, 1,
1.982355, -0.4765861, 3.122729, 1, 0, 0.1568628, 1,
2.005139, -1.360572, 0.8020412, 1, 0, 0.1490196, 1,
2.015416, 0.5635477, 2.629966, 1, 0, 0.145098, 1,
2.016736, -0.2248676, 2.91662, 1, 0, 0.1372549, 1,
2.022671, 1.015343, 1.893485, 1, 0, 0.1333333, 1,
2.022764, -1.25572, 2.693262, 1, 0, 0.1254902, 1,
2.048915, -2.170346, 3.199212, 1, 0, 0.1215686, 1,
2.052644, 2.472636, 0.4019554, 1, 0, 0.1137255, 1,
2.083517, -0.7295108, 0.1501748, 1, 0, 0.1098039, 1,
2.104967, -1.530508, 2.496155, 1, 0, 0.1019608, 1,
2.113729, 0.2060505, 1.079517, 1, 0, 0.09411765, 1,
2.184168, -1.399482, 2.445091, 1, 0, 0.09019608, 1,
2.196048, -1.903277, 0.315421, 1, 0, 0.08235294, 1,
2.226045, -0.1887037, 1.251954, 1, 0, 0.07843138, 1,
2.305951, 0.8026679, 1.995382, 1, 0, 0.07058824, 1,
2.365599, 0.00158004, 1.231283, 1, 0, 0.06666667, 1,
2.380049, 0.2794035, 0.7446109, 1, 0, 0.05882353, 1,
2.385872, -0.9054422, 2.034689, 1, 0, 0.05490196, 1,
2.387833, 1.792306, 0.5437683, 1, 0, 0.04705882, 1,
2.5724, 1.335891, 0.4555852, 1, 0, 0.04313726, 1,
2.604176, -0.8068799, 0.5597853, 1, 0, 0.03529412, 1,
2.627388, 0.7155194, 1.457096, 1, 0, 0.03137255, 1,
2.733392, -0.6839383, 1.371669, 1, 0, 0.02352941, 1,
2.781247, -0.8348581, 1.337241, 1, 0, 0.01960784, 1,
2.85876, -0.6165638, 2.419095, 1, 0, 0.01176471, 1,
3.02252, -0.2716298, 1.270305, 1, 0, 0.007843138, 1
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
-0.0650512, -4.860522, -6.528023, 0, -0.5, 0.5, 0.5,
-0.0650512, -4.860522, -6.528023, 1, -0.5, 0.5, 0.5,
-0.0650512, -4.860522, -6.528023, 1, 1.5, 0.5, 0.5,
-0.0650512, -4.860522, -6.528023, 0, 1.5, 0.5, 0.5
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
-4.199309, -0.2530729, -6.528023, 0, -0.5, 0.5, 0.5,
-4.199309, -0.2530729, -6.528023, 1, -0.5, 0.5, 0.5,
-4.199309, -0.2530729, -6.528023, 1, 1.5, 0.5, 0.5,
-4.199309, -0.2530729, -6.528023, 0, 1.5, 0.5, 0.5
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
-4.199309, -4.860522, 0.04410577, 0, -0.5, 0.5, 0.5,
-4.199309, -4.860522, 0.04410577, 1, -0.5, 0.5, 0.5,
-4.199309, -4.860522, 0.04410577, 1, 1.5, 0.5, 0.5,
-4.199309, -4.860522, 0.04410577, 0, 1.5, 0.5, 0.5
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
-3, -3.797265, -5.011378,
3, -3.797265, -5.011378,
-3, -3.797265, -5.011378,
-3, -3.974474, -5.264152,
-2, -3.797265, -5.011378,
-2, -3.974474, -5.264152,
-1, -3.797265, -5.011378,
-1, -3.974474, -5.264152,
0, -3.797265, -5.011378,
0, -3.974474, -5.264152,
1, -3.797265, -5.011378,
1, -3.974474, -5.264152,
2, -3.797265, -5.011378,
2, -3.974474, -5.264152,
3, -3.797265, -5.011378,
3, -3.974474, -5.264152
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
-3, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
-3, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
-3, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
-3, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
-2, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
-2, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
-2, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
-2, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
-1, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
-1, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
-1, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
-1, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
0, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
0, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
0, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
0, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
1, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
1, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
1, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
1, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
2, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
2, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
2, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
2, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5,
3, -4.328894, -5.7697, 0, -0.5, 0.5, 0.5,
3, -4.328894, -5.7697, 1, -0.5, 0.5, 0.5,
3, -4.328894, -5.7697, 1, 1.5, 0.5, 0.5,
3, -4.328894, -5.7697, 0, 1.5, 0.5, 0.5
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
-3.24525, -3, -5.011378,
-3.24525, 3, -5.011378,
-3.24525, -3, -5.011378,
-3.404259, -3, -5.264152,
-3.24525, -2, -5.011378,
-3.404259, -2, -5.264152,
-3.24525, -1, -5.011378,
-3.404259, -1, -5.264152,
-3.24525, 0, -5.011378,
-3.404259, 0, -5.264152,
-3.24525, 1, -5.011378,
-3.404259, 1, -5.264152,
-3.24525, 2, -5.011378,
-3.404259, 2, -5.264152,
-3.24525, 3, -5.011378,
-3.404259, 3, -5.264152
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
-3.722279, -3, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, -3, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, -3, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, -3, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, -2, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, -2, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, -2, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, -2, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, -1, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, -1, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, -1, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, -1, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, 0, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, 0, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, 0, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, 0, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, 1, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, 1, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, 1, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, 1, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, 2, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, 2, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, 2, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, 2, -5.7697, 0, 1.5, 0.5, 0.5,
-3.722279, 3, -5.7697, 0, -0.5, 0.5, 0.5,
-3.722279, 3, -5.7697, 1, -0.5, 0.5, 0.5,
-3.722279, 3, -5.7697, 1, 1.5, 0.5, 0.5,
-3.722279, 3, -5.7697, 0, 1.5, 0.5, 0.5
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
-3.24525, -3.797265, -4,
-3.24525, -3.797265, 4,
-3.24525, -3.797265, -4,
-3.404259, -3.974474, -4,
-3.24525, -3.797265, -2,
-3.404259, -3.974474, -2,
-3.24525, -3.797265, 0,
-3.404259, -3.974474, 0,
-3.24525, -3.797265, 2,
-3.404259, -3.974474, 2,
-3.24525, -3.797265, 4,
-3.404259, -3.974474, 4
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
-3.722279, -4.328894, -4, 0, -0.5, 0.5, 0.5,
-3.722279, -4.328894, -4, 1, -0.5, 0.5, 0.5,
-3.722279, -4.328894, -4, 1, 1.5, 0.5, 0.5,
-3.722279, -4.328894, -4, 0, 1.5, 0.5, 0.5,
-3.722279, -4.328894, -2, 0, -0.5, 0.5, 0.5,
-3.722279, -4.328894, -2, 1, -0.5, 0.5, 0.5,
-3.722279, -4.328894, -2, 1, 1.5, 0.5, 0.5,
-3.722279, -4.328894, -2, 0, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 0, 0, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 0, 1, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 0, 1, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 0, 0, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 2, 0, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 2, 1, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 2, 1, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 2, 0, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 4, 0, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 4, 1, -0.5, 0.5, 0.5,
-3.722279, -4.328894, 4, 1, 1.5, 0.5, 0.5,
-3.722279, -4.328894, 4, 0, 1.5, 0.5, 0.5
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
-3.24525, -3.797265, -5.011378,
-3.24525, 3.291119, -5.011378,
-3.24525, -3.797265, 5.099589,
-3.24525, 3.291119, 5.099589,
-3.24525, -3.797265, -5.011378,
-3.24525, -3.797265, 5.099589,
-3.24525, 3.291119, -5.011378,
-3.24525, 3.291119, 5.099589,
-3.24525, -3.797265, -5.011378,
3.115147, -3.797265, -5.011378,
-3.24525, -3.797265, 5.099589,
3.115147, -3.797265, 5.099589,
-3.24525, 3.291119, -5.011378,
3.115147, 3.291119, -5.011378,
-3.24525, 3.291119, 5.099589,
3.115147, 3.291119, 5.099589,
3.115147, -3.797265, -5.011378,
3.115147, 3.291119, -5.011378,
3.115147, -3.797265, 5.099589,
3.115147, 3.291119, 5.099589,
3.115147, -3.797265, -5.011378,
3.115147, -3.797265, 5.099589,
3.115147, 3.291119, -5.011378,
3.115147, 3.291119, 5.099589
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
var radius = 7.416978;
var distance = 32.99897;
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
mvMatrix.translate( 0.0650512, 0.2530729, -0.04410577 );
mvMatrix.scale( 1.260831, 1.131341, 0.7931371 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.99897);
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
chlorphoxim<-read.table("chlorphoxim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorphoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
```

```r
y<-chlorphoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
```

```r
z<-chlorphoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorphoxim' not found
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
-3.152622, 1.973548, -0.8092035, 0, 0, 1, 1, 1,
-2.916334, 0.3469915, -0.869855, 1, 0, 0, 1, 1,
-2.864839, 1.804172, -0.5832695, 1, 0, 0, 1, 1,
-2.781078, 0.1246074, -1.74173, 1, 0, 0, 1, 1,
-2.621975, -0.1287877, -1.858149, 1, 0, 0, 1, 1,
-2.607071, -0.4505675, 1.115001, 1, 0, 0, 1, 1,
-2.600097, -0.6510055, -1.522385, 0, 0, 0, 1, 1,
-2.589152, -1.156919, -0.9322215, 0, 0, 0, 1, 1,
-2.570165, 0.8274508, -2.296139, 0, 0, 0, 1, 1,
-2.397209, -1.206321, -0.6498945, 0, 0, 0, 1, 1,
-2.380387, -0.8472597, -2.977567, 0, 0, 0, 1, 1,
-2.380258, 0.4575832, -1.392586, 0, 0, 0, 1, 1,
-2.32912, -0.5366131, -2.058151, 0, 0, 0, 1, 1,
-2.304793, -0.6414756, -0.4778597, 1, 1, 1, 1, 1,
-2.287499, -0.006481492, -3.347814, 1, 1, 1, 1, 1,
-2.281929, -0.5718927, -1.778372, 1, 1, 1, 1, 1,
-2.24912, 0.1231649, -0.9135072, 1, 1, 1, 1, 1,
-2.225811, 1.2242, 0.142637, 1, 1, 1, 1, 1,
-2.224154, -0.5397569, -2.648306, 1, 1, 1, 1, 1,
-2.210901, -0.6006634, -1.521054, 1, 1, 1, 1, 1,
-2.188532, -1.128466, -3.578003, 1, 1, 1, 1, 1,
-2.16993, 0.9192662, -3.231981, 1, 1, 1, 1, 1,
-2.146156, 0.9172106, -1.538867, 1, 1, 1, 1, 1,
-2.021173, -0.7098101, -4.160386, 1, 1, 1, 1, 1,
-2.009763, -0.6535735, -1.860783, 1, 1, 1, 1, 1,
-2.007504, 0.1490361, -0.1485679, 1, 1, 1, 1, 1,
-1.978265, -0.301142, -2.689806, 1, 1, 1, 1, 1,
-1.928554, -0.1252802, -1.720205, 1, 1, 1, 1, 1,
-1.922198, -1.10629, -1.763723, 0, 0, 1, 1, 1,
-1.912221, -1.384753, -3.775144, 1, 0, 0, 1, 1,
-1.89191, -1.875487, -1.508625, 1, 0, 0, 1, 1,
-1.829836, 0.7062443, -1.476084, 1, 0, 0, 1, 1,
-1.825975, 0.8553782, -4.369778, 1, 0, 0, 1, 1,
-1.819385, -0.7661609, -2.709215, 1, 0, 0, 1, 1,
-1.808417, -0.004715289, -1.519065, 0, 0, 0, 1, 1,
-1.800119, -1.597138, -2.544354, 0, 0, 0, 1, 1,
-1.792945, -1.782776, -1.804426, 0, 0, 0, 1, 1,
-1.787897, -0.4510817, -0.9981762, 0, 0, 0, 1, 1,
-1.779324, -0.3495589, -1.010365, 0, 0, 0, 1, 1,
-1.748843, 0.1590703, 0.05329539, 0, 0, 0, 1, 1,
-1.74385, -0.5697809, -4.333305, 0, 0, 0, 1, 1,
-1.726442, -0.1515237, -0.8522328, 1, 1, 1, 1, 1,
-1.725526, -1.222163, -1.810887, 1, 1, 1, 1, 1,
-1.721719, 1.41532, -2.678206, 1, 1, 1, 1, 1,
-1.715278, 0.9040517, -1.574274, 1, 1, 1, 1, 1,
-1.687433, 0.7999359, -3.203269, 1, 1, 1, 1, 1,
-1.678463, -0.8811151, -2.376248, 1, 1, 1, 1, 1,
-1.669562, 0.5929624, -1.320868, 1, 1, 1, 1, 1,
-1.659868, 0.2895772, -2.002228, 1, 1, 1, 1, 1,
-1.627151, 0.186508, -1.052905, 1, 1, 1, 1, 1,
-1.62564, -0.3009353, -1.788316, 1, 1, 1, 1, 1,
-1.624275, 0.09036483, -1.506844, 1, 1, 1, 1, 1,
-1.619192, -0.9870769, -0.6013452, 1, 1, 1, 1, 1,
-1.607305, -1.149832, -2.408947, 1, 1, 1, 1, 1,
-1.604378, 1.526498, -1.138848, 1, 1, 1, 1, 1,
-1.600492, -2.229887, -1.82439, 1, 1, 1, 1, 1,
-1.577448, 0.6474462, -0.8987606, 0, 0, 1, 1, 1,
-1.577062, -1.028266, -4.116833, 1, 0, 0, 1, 1,
-1.561983, -0.1402154, -0.6652168, 1, 0, 0, 1, 1,
-1.550296, -0.9391226, -1.745307, 1, 0, 0, 1, 1,
-1.546585, -1.113674, -2.661572, 1, 0, 0, 1, 1,
-1.546314, -0.955681, -2.454399, 1, 0, 0, 1, 1,
-1.534415, -0.008913521, -1.28338, 0, 0, 0, 1, 1,
-1.530697, 0.8531571, 0.69751, 0, 0, 0, 1, 1,
-1.505417, 0.1930968, -0.4688882, 0, 0, 0, 1, 1,
-1.501372, 1.170042, -0.590515, 0, 0, 0, 1, 1,
-1.489357, 0.3148019, -2.275647, 0, 0, 0, 1, 1,
-1.484406, -0.9384107, -1.681655, 0, 0, 0, 1, 1,
-1.456978, -1.116022, -2.602544, 0, 0, 0, 1, 1,
-1.440165, -0.7404199, -2.435608, 1, 1, 1, 1, 1,
-1.434752, 0.6365793, -0.9192021, 1, 1, 1, 1, 1,
-1.426182, 0.8916093, -1.441399, 1, 1, 1, 1, 1,
-1.421112, -0.424601, -1.286393, 1, 1, 1, 1, 1,
-1.418296, 0.4281628, -1.042875, 1, 1, 1, 1, 1,
-1.408519, -0.6999162, -3.522358, 1, 1, 1, 1, 1,
-1.403879, 1.420166, -1.538497, 1, 1, 1, 1, 1,
-1.403192, -0.8327687, -4.38394, 1, 1, 1, 1, 1,
-1.385991, -0.2743739, -1.037494, 1, 1, 1, 1, 1,
-1.385678, -0.07154322, -0.9937811, 1, 1, 1, 1, 1,
-1.36042, -2.747769, -2.73385, 1, 1, 1, 1, 1,
-1.352631, -1.55414, -2.885641, 1, 1, 1, 1, 1,
-1.351353, -1.428766, -0.527212, 1, 1, 1, 1, 1,
-1.349996, -0.5498133, -1.517583, 1, 1, 1, 1, 1,
-1.337203, 1.922518, -1.588906, 1, 1, 1, 1, 1,
-1.334195, 1.690011, -0.5387826, 0, 0, 1, 1, 1,
-1.329787, 0.8214217, -0.5967773, 1, 0, 0, 1, 1,
-1.324975, -0.1245535, -3.10222, 1, 0, 0, 1, 1,
-1.324616, -0.4849957, -2.605668, 1, 0, 0, 1, 1,
-1.307162, -1.348897, -1.45633, 1, 0, 0, 1, 1,
-1.296363, -0.1035482, -1.433862, 1, 0, 0, 1, 1,
-1.295079, 1.137747, -0.8640667, 0, 0, 0, 1, 1,
-1.293042, -1.919594, -3.022799, 0, 0, 0, 1, 1,
-1.290882, 0.2518703, -1.979812, 0, 0, 0, 1, 1,
-1.288578, 0.7817897, -1.680167, 0, 0, 0, 1, 1,
-1.286166, -1.601317, -3.524005, 0, 0, 0, 1, 1,
-1.276121, -1.298059, -1.589805, 0, 0, 0, 1, 1,
-1.271864, 1.997143, -0.457878, 0, 0, 0, 1, 1,
-1.27007, 0.2848559, -2.215011, 1, 1, 1, 1, 1,
-1.266819, 0.551427, -2.885455, 1, 1, 1, 1, 1,
-1.248237, -0.4133942, -2.400701, 1, 1, 1, 1, 1,
-1.247652, -0.1416996, -0.4496844, 1, 1, 1, 1, 1,
-1.244263, -0.911669, -4.495064, 1, 1, 1, 1, 1,
-1.239753, 0.1531146, -0.0009055906, 1, 1, 1, 1, 1,
-1.232799, -1.201248, -1.750241, 1, 1, 1, 1, 1,
-1.229059, 0.9262522, -1.636879, 1, 1, 1, 1, 1,
-1.228642, -1.599316, -2.575229, 1, 1, 1, 1, 1,
-1.216451, 1.995543, 0.01885743, 1, 1, 1, 1, 1,
-1.214332, 0.5254155, -1.045588, 1, 1, 1, 1, 1,
-1.205667, 1.118238, 0.3339282, 1, 1, 1, 1, 1,
-1.204642, 0.3522728, -3.428541, 1, 1, 1, 1, 1,
-1.199591, 1.500863, 1.076617, 1, 1, 1, 1, 1,
-1.198161, -1.473084, -3.905046, 1, 1, 1, 1, 1,
-1.197199, 1.224265, -0.6541573, 0, 0, 1, 1, 1,
-1.196313, 1.126077, 0.4088701, 1, 0, 0, 1, 1,
-1.186714, -0.4502095, -1.347249, 1, 0, 0, 1, 1,
-1.184406, -0.9658223, -3.119954, 1, 0, 0, 1, 1,
-1.180004, 0.4194121, -1.494376, 1, 0, 0, 1, 1,
-1.179724, 0.1166879, -1.866056, 1, 0, 0, 1, 1,
-1.162741, -0.4008417, -1.672352, 0, 0, 0, 1, 1,
-1.161807, 0.01059025, -2.44849, 0, 0, 0, 1, 1,
-1.158134, 0.998749, -0.6634225, 0, 0, 0, 1, 1,
-1.13761, -0.3449446, -0.7425407, 0, 0, 0, 1, 1,
-1.127926, -1.625402, -2.677643, 0, 0, 0, 1, 1,
-1.119394, -1.084656, -3.619166, 0, 0, 0, 1, 1,
-1.117969, 0.7724726, -1.279148, 0, 0, 0, 1, 1,
-1.111361, 0.03782579, -1.418983, 1, 1, 1, 1, 1,
-1.110651, -1.199349, -1.403901, 1, 1, 1, 1, 1,
-1.110061, -1.770879, -1.87827, 1, 1, 1, 1, 1,
-1.093482, -0.4392677, -1.246061, 1, 1, 1, 1, 1,
-1.06607, -0.2518833, -2.19513, 1, 1, 1, 1, 1,
-1.063811, -3.694036, -2.051601, 1, 1, 1, 1, 1,
-1.061319, -0.9444009, -2.310583, 1, 1, 1, 1, 1,
-1.056306, -0.9453055, -2.316423, 1, 1, 1, 1, 1,
-1.053038, 0.3535182, -0.3933532, 1, 1, 1, 1, 1,
-1.050167, -0.067191, -1.647775, 1, 1, 1, 1, 1,
-1.049879, -1.3564, -2.995842, 1, 1, 1, 1, 1,
-1.04148, -0.4608604, -3.312801, 1, 1, 1, 1, 1,
-1.040875, 0.7562642, -2.100372, 1, 1, 1, 1, 1,
-1.034098, 1.719859, -0.693876, 1, 1, 1, 1, 1,
-1.031962, 0.8659791, -0.6938173, 1, 1, 1, 1, 1,
-1.026269, 1.092548, -0.02870254, 0, 0, 1, 1, 1,
-1.026095, 2.675237, -0.4524304, 1, 0, 0, 1, 1,
-1.021451, -1.61034, -2.919857, 1, 0, 0, 1, 1,
-1.015891, -0.1023123, -2.197398, 1, 0, 0, 1, 1,
-1.014175, -0.03363651, -1.123976, 1, 0, 0, 1, 1,
-1.011604, -0.9900635, -0.8076372, 1, 0, 0, 1, 1,
-1.008736, 0.4127827, -1.789393, 0, 0, 0, 1, 1,
-1.006224, 1.149029, 1.756065, 0, 0, 0, 1, 1,
-1.004419, -1.53805, -1.023879, 0, 0, 0, 1, 1,
-0.9998941, -1.362888, 0.04238982, 0, 0, 0, 1, 1,
-0.991684, 0.3345054, -0.8956473, 0, 0, 0, 1, 1,
-0.9911578, 0.1375652, -1.130355, 0, 0, 0, 1, 1,
-0.9894153, -0.5308324, -1.968759, 0, 0, 0, 1, 1,
-0.98005, 0.5618904, 0.6629415, 1, 1, 1, 1, 1,
-0.9725487, -1.138994, -4.489555, 1, 1, 1, 1, 1,
-0.9656863, 0.8745098, 1.893916, 1, 1, 1, 1, 1,
-0.9649777, 1.093745, 0.0803597, 1, 1, 1, 1, 1,
-0.9589309, 0.06024529, -1.372046, 1, 1, 1, 1, 1,
-0.9571309, 0.2911456, -2.296729, 1, 1, 1, 1, 1,
-0.9491547, 0.6530678, -2.499753, 1, 1, 1, 1, 1,
-0.9463154, 1.587517, -1.791618, 1, 1, 1, 1, 1,
-0.9450762, -0.1658436, -2.291985, 1, 1, 1, 1, 1,
-0.9388952, 0.2481246, -1.820994, 1, 1, 1, 1, 1,
-0.9388551, -0.290808, -2.160436, 1, 1, 1, 1, 1,
-0.9366079, 0.3326228, -0.9619336, 1, 1, 1, 1, 1,
-0.9347149, -1.876255, -3.475849, 1, 1, 1, 1, 1,
-0.9316472, -0.557749, -1.75175, 1, 1, 1, 1, 1,
-0.9307972, 1.133038, -0.07193991, 1, 1, 1, 1, 1,
-0.9283245, 0.9401222, -1.303882, 0, 0, 1, 1, 1,
-0.9114608, -0.3534829, -1.772677, 1, 0, 0, 1, 1,
-0.9085713, 0.6664168, -0.6167872, 1, 0, 0, 1, 1,
-0.901719, 0.4988777, 0.4845401, 1, 0, 0, 1, 1,
-0.8981504, 0.8585064, -1.302528, 1, 0, 0, 1, 1,
-0.8967384, 0.2356058, -2.376044, 1, 0, 0, 1, 1,
-0.8874301, -1.125823, -1.513939, 0, 0, 0, 1, 1,
-0.8779873, 0.307173, -0.4626926, 0, 0, 0, 1, 1,
-0.8757772, -0.4727729, -1.915118, 0, 0, 0, 1, 1,
-0.8574324, 1.190226, -2.163174, 0, 0, 0, 1, 1,
-0.8533773, 0.4216466, -0.4724039, 0, 0, 0, 1, 1,
-0.8524921, -0.7723907, -1.689347, 0, 0, 0, 1, 1,
-0.847868, 0.2224963, -1.846984, 0, 0, 0, 1, 1,
-0.8475889, -0.5441609, -1.240358, 1, 1, 1, 1, 1,
-0.8424001, 1.112649, 0.5750629, 1, 1, 1, 1, 1,
-0.8366151, 1.196181, 0.3863823, 1, 1, 1, 1, 1,
-0.8347592, 0.1076256, -0.8333867, 1, 1, 1, 1, 1,
-0.8332335, -0.7941819, -2.738458, 1, 1, 1, 1, 1,
-0.8288603, -0.4992822, -2.846462, 1, 1, 1, 1, 1,
-0.8215444, 1.726969, -0.01115286, 1, 1, 1, 1, 1,
-0.8125615, -0.170931, -1.222031, 1, 1, 1, 1, 1,
-0.8118711, -1.448207, -3.186611, 1, 1, 1, 1, 1,
-0.803952, 0.1422153, 0.1875185, 1, 1, 1, 1, 1,
-0.8006365, 0.4032876, -0.4049542, 1, 1, 1, 1, 1,
-0.7901237, 0.486359, 0.08079293, 1, 1, 1, 1, 1,
-0.7869838, -0.4993576, -1.149068, 1, 1, 1, 1, 1,
-0.7857199, -0.1584914, -1.782471, 1, 1, 1, 1, 1,
-0.7801106, 1.184638, -1.268088, 1, 1, 1, 1, 1,
-0.7720263, -0.02129566, 0.09557828, 0, 0, 1, 1, 1,
-0.7706181, 2.069267, -0.4879139, 1, 0, 0, 1, 1,
-0.7689821, 0.3114701, -1.968082, 1, 0, 0, 1, 1,
-0.7668407, 0.3660546, -1.722878, 1, 0, 0, 1, 1,
-0.7622401, 0.3610708, -1.576863, 1, 0, 0, 1, 1,
-0.7600172, 0.4822778, -1.999459, 1, 0, 0, 1, 1,
-0.7568221, -0.6711772, -2.075985, 0, 0, 0, 1, 1,
-0.7556462, 1.466352, 1.174763, 0, 0, 0, 1, 1,
-0.7516435, 0.6812065, -0.4311758, 0, 0, 0, 1, 1,
-0.7510558, 0.4025896, -1.05463, 0, 0, 0, 1, 1,
-0.7476661, -0.4298375, 0.656808, 0, 0, 0, 1, 1,
-0.7474073, -0.1890429, -1.919222, 0, 0, 0, 1, 1,
-0.7472972, -0.9021646, -2.879669, 0, 0, 0, 1, 1,
-0.7465367, 0.7491233, 0.4711637, 1, 1, 1, 1, 1,
-0.7443528, -2.236193, -1.557897, 1, 1, 1, 1, 1,
-0.7439259, 0.5744964, -1.680982, 1, 1, 1, 1, 1,
-0.7385688, 0.2478295, -0.7179803, 1, 1, 1, 1, 1,
-0.7366048, 0.06529693, -3.360663, 1, 1, 1, 1, 1,
-0.7308738, 2.211354, -0.9954455, 1, 1, 1, 1, 1,
-0.7284431, 1.003732, 0.1879971, 1, 1, 1, 1, 1,
-0.7248691, -0.02257745, -2.231823, 1, 1, 1, 1, 1,
-0.718689, -0.09683388, -2.437465, 1, 1, 1, 1, 1,
-0.7178507, -2.964882, -4.050798, 1, 1, 1, 1, 1,
-0.7131789, 0.6547599, -1.003789, 1, 1, 1, 1, 1,
-0.712957, 0.1247586, 0.2156532, 1, 1, 1, 1, 1,
-0.7129081, 0.02053073, -2.030328, 1, 1, 1, 1, 1,
-0.7119007, -0.01405556, -0.8642511, 1, 1, 1, 1, 1,
-0.7011934, 0.6015829, -1.417894, 1, 1, 1, 1, 1,
-0.6978287, -0.5478909, -1.02968, 0, 0, 1, 1, 1,
-0.6965997, 0.1420283, -1.513427, 1, 0, 0, 1, 1,
-0.6867986, -1.888577, -3.304384, 1, 0, 0, 1, 1,
-0.6776986, -1.69697, -2.072251, 1, 0, 0, 1, 1,
-0.6706455, 0.7633895, 0.6828421, 1, 0, 0, 1, 1,
-0.6684934, -1.460709, -0.9034003, 1, 0, 0, 1, 1,
-0.6576421, -0.3090112, -4.151168, 0, 0, 0, 1, 1,
-0.657315, -0.4099761, -0.9718887, 0, 0, 0, 1, 1,
-0.6563678, -0.371372, -0.3902444, 0, 0, 0, 1, 1,
-0.6542294, 0.1446906, -0.7937304, 0, 0, 0, 1, 1,
-0.6534485, -1.309348, -4.137896, 0, 0, 0, 1, 1,
-0.6518236, -0.8380465, -1.162819, 0, 0, 0, 1, 1,
-0.650242, 0.5950364, -1.400815, 0, 0, 0, 1, 1,
-0.6469238, 0.8409151, -1.732826, 1, 1, 1, 1, 1,
-0.6455619, -0.8845686, -0.8266554, 1, 1, 1, 1, 1,
-0.644619, 0.2035733, 0.4252244, 1, 1, 1, 1, 1,
-0.6445099, 1.788538, 1.516387, 1, 1, 1, 1, 1,
-0.6416597, -3.500198, -2.457797, 1, 1, 1, 1, 1,
-0.6400748, 0.1684531, -1.463602, 1, 1, 1, 1, 1,
-0.6345726, 0.8405688, -1.112962, 1, 1, 1, 1, 1,
-0.6336623, 1.185369, -0.8746496, 1, 1, 1, 1, 1,
-0.6326718, 0.9758397, 0.5319462, 1, 1, 1, 1, 1,
-0.630468, -1.025001, -4.54778, 1, 1, 1, 1, 1,
-0.6295665, -0.1332996, -1.010946, 1, 1, 1, 1, 1,
-0.6291487, -0.5083233, -2.399561, 1, 1, 1, 1, 1,
-0.6254465, -0.7037448, -1.166743, 1, 1, 1, 1, 1,
-0.6227385, 0.8231669, -2.218583, 1, 1, 1, 1, 1,
-0.6225276, 0.9495642, -2.133376, 1, 1, 1, 1, 1,
-0.6215504, 0.1538134, -0.04597231, 0, 0, 1, 1, 1,
-0.6178356, -1.057756, -2.286169, 1, 0, 0, 1, 1,
-0.6168692, -1.327334, -2.318851, 1, 0, 0, 1, 1,
-0.6147441, 1.007691, 0.6507561, 1, 0, 0, 1, 1,
-0.614566, -0.4255339, -3.873544, 1, 0, 0, 1, 1,
-0.6141704, -0.2491466, -0.4429537, 1, 0, 0, 1, 1,
-0.6082281, 0.7244076, -0.5916716, 0, 0, 0, 1, 1,
-0.6007705, 1.423249, -1.034032, 0, 0, 0, 1, 1,
-0.6006274, 0.4223984, -1.136328, 0, 0, 0, 1, 1,
-0.5976554, -0.5846421, -4.11382, 0, 0, 0, 1, 1,
-0.5975295, -1.064535, -3.01509, 0, 0, 0, 1, 1,
-0.5951733, 1.202849, -0.001043704, 0, 0, 0, 1, 1,
-0.5946211, 0.6907839, -0.8525836, 0, 0, 0, 1, 1,
-0.5919035, -0.7483994, -2.959042, 1, 1, 1, 1, 1,
-0.5889397, 1.310452, 0.1020115, 1, 1, 1, 1, 1,
-0.5861422, -0.6917883, -3.995806, 1, 1, 1, 1, 1,
-0.5854417, -0.7945378, -2.282607, 1, 1, 1, 1, 1,
-0.5836569, -0.2249253, -1.477554, 1, 1, 1, 1, 1,
-0.5825534, 0.138671, -0.8925574, 1, 1, 1, 1, 1,
-0.5798348, -0.7300686, -3.697681, 1, 1, 1, 1, 1,
-0.5757072, 1.169811, 0.9096252, 1, 1, 1, 1, 1,
-0.5743328, 0.229123, -3.755639, 1, 1, 1, 1, 1,
-0.5736248, 1.907619, 2.096925, 1, 1, 1, 1, 1,
-0.5724545, 1.230152, 0.363813, 1, 1, 1, 1, 1,
-0.5708146, 0.2553963, 0.09619725, 1, 1, 1, 1, 1,
-0.5652152, 0.8629559, -1.312612, 1, 1, 1, 1, 1,
-0.5617427, 0.8461495, 0.8408654, 1, 1, 1, 1, 1,
-0.558744, -0.5861245, -1.445777, 1, 1, 1, 1, 1,
-0.558237, -0.2550262, -1.820535, 0, 0, 1, 1, 1,
-0.5581088, -1.390875, -2.454576, 1, 0, 0, 1, 1,
-0.5498139, 0.496817, -1.575523, 1, 0, 0, 1, 1,
-0.5493916, 1.169181, -0.3452256, 1, 0, 0, 1, 1,
-0.5490963, 1.751197, -0.0671893, 1, 0, 0, 1, 1,
-0.5483266, 0.9876489, -1.927205, 1, 0, 0, 1, 1,
-0.5467803, 0.2643647, -0.1601933, 0, 0, 0, 1, 1,
-0.5466544, 1.086694, 0.4390664, 0, 0, 0, 1, 1,
-0.5435841, 1.901459, -1.848866, 0, 0, 0, 1, 1,
-0.5428938, 1.23975, -1.692887, 0, 0, 0, 1, 1,
-0.5392818, 2.445132, -0.9997209, 0, 0, 0, 1, 1,
-0.5278761, -0.7338478, -1.384152, 0, 0, 0, 1, 1,
-0.5273091, 0.6694806, -1.718196, 0, 0, 0, 1, 1,
-0.5267831, -1.067088, -3.262376, 1, 1, 1, 1, 1,
-0.5266441, -1.831897, -4.505506, 1, 1, 1, 1, 1,
-0.5242531, 0.2399068, -1.238202, 1, 1, 1, 1, 1,
-0.5230007, -1.112636, -1.880018, 1, 1, 1, 1, 1,
-0.5187368, -0.3553568, -2.693128, 1, 1, 1, 1, 1,
-0.5172336, 0.6329774, 0.6123916, 1, 1, 1, 1, 1,
-0.5137025, 1.723841, 0.08533571, 1, 1, 1, 1, 1,
-0.5124663, 0.3892488, -0.7182199, 1, 1, 1, 1, 1,
-0.5111902, 1.413815, -0.9002241, 1, 1, 1, 1, 1,
-0.5071158, 0.5933896, 0.3319398, 1, 1, 1, 1, 1,
-0.5015851, 0.5851941, -0.6609106, 1, 1, 1, 1, 1,
-0.4933841, 0.1068807, 0.7258905, 1, 1, 1, 1, 1,
-0.4908915, 0.195978, -0.3643732, 1, 1, 1, 1, 1,
-0.4856158, -0.4078406, -4.021106, 1, 1, 1, 1, 1,
-0.4811388, 1.731076, 0.404929, 1, 1, 1, 1, 1,
-0.4782413, -1.153746, -3.405616, 0, 0, 1, 1, 1,
-0.4760357, 0.3017808, -0.7759026, 1, 0, 0, 1, 1,
-0.4752833, -0.323956, -2.948562, 1, 0, 0, 1, 1,
-0.4738034, -0.1805893, -2.688369, 1, 0, 0, 1, 1,
-0.4735442, -1.970279, -4.755408, 1, 0, 0, 1, 1,
-0.4690019, 1.071283, -1.370822, 1, 0, 0, 1, 1,
-0.4642678, 1.560567, -0.9469032, 0, 0, 0, 1, 1,
-0.4591343, -0.1804737, -2.305047, 0, 0, 0, 1, 1,
-0.4557483, -0.3942829, -2.192746, 0, 0, 0, 1, 1,
-0.4554135, 1.475862, -0.1568866, 0, 0, 0, 1, 1,
-0.4548627, -1.087705, -2.595634, 0, 0, 0, 1, 1,
-0.4515634, 0.9671874, 0.0968701, 0, 0, 0, 1, 1,
-0.4504945, -1.01114, -1.374368, 0, 0, 0, 1, 1,
-0.4446913, -1.661614, -4.27622, 1, 1, 1, 1, 1,
-0.4403207, 0.9656741, 0.06062653, 1, 1, 1, 1, 1,
-0.4384771, 0.6266958, 0.7566483, 1, 1, 1, 1, 1,
-0.4383159, -0.5817523, -2.94291, 1, 1, 1, 1, 1,
-0.435107, 0.3397616, -0.2835423, 1, 1, 1, 1, 1,
-0.433915, 0.04111885, -1.338029, 1, 1, 1, 1, 1,
-0.4272287, 0.6505616, -0.8123153, 1, 1, 1, 1, 1,
-0.4270518, 1.533669, -1.135652, 1, 1, 1, 1, 1,
-0.4258938, 0.9691315, -2.179021, 1, 1, 1, 1, 1,
-0.4252625, -1.398207, -2.851548, 1, 1, 1, 1, 1,
-0.4195214, 0.1910636, -2.139612, 1, 1, 1, 1, 1,
-0.4109356, 1.253469, 1.112597, 1, 1, 1, 1, 1,
-0.4097495, 2.360915, -0.3606213, 1, 1, 1, 1, 1,
-0.405374, -1.164272, -2.09335, 1, 1, 1, 1, 1,
-0.4045823, 0.2930703, -0.1292875, 1, 1, 1, 1, 1,
-0.402836, -0.1335769, -0.380839, 0, 0, 1, 1, 1,
-0.4013397, 0.1119176, -2.39608, 1, 0, 0, 1, 1,
-0.3933329, 0.2650367, -1.847341, 1, 0, 0, 1, 1,
-0.3928748, -0.3627554, -0.7182485, 1, 0, 0, 1, 1,
-0.3925465, 0.8714792, -1.081797, 1, 0, 0, 1, 1,
-0.3890064, -0.5003808, -3.677822, 1, 0, 0, 1, 1,
-0.3889854, 1.3493, -0.6750182, 0, 0, 0, 1, 1,
-0.3858612, -1.326203, -2.486991, 0, 0, 0, 1, 1,
-0.3853088, 1.150868, 0.4959759, 0, 0, 0, 1, 1,
-0.385256, 1.387637, -0.4443961, 0, 0, 0, 1, 1,
-0.3850795, -0.4551738, -3.727139, 0, 0, 0, 1, 1,
-0.378403, 0.5078971, -0.2514936, 0, 0, 0, 1, 1,
-0.3711781, -1.261172, -3.377571, 0, 0, 0, 1, 1,
-0.3652555, 2.033417, -2.330744, 1, 1, 1, 1, 1,
-0.3648345, -1.051102, -1.070759, 1, 1, 1, 1, 1,
-0.352091, 0.1789247, -2.183447, 1, 1, 1, 1, 1,
-0.3490202, 0.7435904, 1.269902, 1, 1, 1, 1, 1,
-0.3470752, -0.5869441, -2.002266, 1, 1, 1, 1, 1,
-0.34529, -0.3773888, -3.949894, 1, 1, 1, 1, 1,
-0.3441183, -0.08159899, -0.609779, 1, 1, 1, 1, 1,
-0.3427523, 0.4817009, -0.6327856, 1, 1, 1, 1, 1,
-0.3399338, 0.3836925, -1.110836, 1, 1, 1, 1, 1,
-0.336436, -1.445869, -3.122479, 1, 1, 1, 1, 1,
-0.3355053, -1.550321, -4.614734, 1, 1, 1, 1, 1,
-0.3336584, 0.5265641, 0.691431, 1, 1, 1, 1, 1,
-0.3296806, -0.8356069, -3.899242, 1, 1, 1, 1, 1,
-0.3277597, 1.548109, 2.156538, 1, 1, 1, 1, 1,
-0.3256803, 0.6890086, 0.03950862, 1, 1, 1, 1, 1,
-0.3253365, 0.9053053, 0.08902234, 0, 0, 1, 1, 1,
-0.3251051, 1.128572, 0.7514769, 1, 0, 0, 1, 1,
-0.3238611, 0.875562, -1.018602, 1, 0, 0, 1, 1,
-0.3203608, 1.051087, 1.923936, 1, 0, 0, 1, 1,
-0.3184176, 0.6053446, 0.7976707, 1, 0, 0, 1, 1,
-0.3172196, -1.353042, -2.90418, 1, 0, 0, 1, 1,
-0.3154549, 1.863584, 0.6620643, 0, 0, 0, 1, 1,
-0.308873, 1.101168, 1.606618, 0, 0, 0, 1, 1,
-0.3082805, 1.053712, 0.08937227, 0, 0, 0, 1, 1,
-0.3061799, 0.7837702, -0.7028639, 0, 0, 0, 1, 1,
-0.3043543, -1.304221, -1.681088, 0, 0, 0, 1, 1,
-0.30433, -0.6950035, -0.8908851, 0, 0, 0, 1, 1,
-0.3039326, -0.07246122, -1.290116, 0, 0, 0, 1, 1,
-0.303403, 0.07284276, -0.207431, 1, 1, 1, 1, 1,
-0.3013784, -0.1357654, -1.545308, 1, 1, 1, 1, 1,
-0.3006396, -1.410352, -2.966337, 1, 1, 1, 1, 1,
-0.3002923, -0.5987112, -2.833814, 1, 1, 1, 1, 1,
-0.2988739, 0.9859952, 0.4065135, 1, 1, 1, 1, 1,
-0.2978823, -0.7733451, -3.784764, 1, 1, 1, 1, 1,
-0.2971963, -0.3695779, -3.074441, 1, 1, 1, 1, 1,
-0.2963114, -0.1382096, -2.311126, 1, 1, 1, 1, 1,
-0.2942203, -0.2941517, -2.708017, 1, 1, 1, 1, 1,
-0.2905163, 0.6532901, 0.1607679, 1, 1, 1, 1, 1,
-0.290417, 0.05410663, -0.6062495, 1, 1, 1, 1, 1,
-0.290009, -0.3994192, -1.577712, 1, 1, 1, 1, 1,
-0.2883959, 1.18098, -0.03017257, 1, 1, 1, 1, 1,
-0.2869124, 1.481757, -0.1044983, 1, 1, 1, 1, 1,
-0.2839854, 1.611268, 0.1094353, 1, 1, 1, 1, 1,
-0.2822975, 0.9028347, 0.6515386, 0, 0, 1, 1, 1,
-0.2782974, 0.986537, -0.3486189, 1, 0, 0, 1, 1,
-0.2746912, -0.3465309, -1.35378, 1, 0, 0, 1, 1,
-0.2743739, 0.2911831, 0.2202783, 1, 0, 0, 1, 1,
-0.2711587, -0.7098408, -3.866653, 1, 0, 0, 1, 1,
-0.266023, 0.5972955, 0.3891673, 1, 0, 0, 1, 1,
-0.2638574, -0.864054, -2.216705, 0, 0, 0, 1, 1,
-0.2635604, -1.364545, -2.861654, 0, 0, 0, 1, 1,
-0.2614684, 1.059958, -1.303539, 0, 0, 0, 1, 1,
-0.2608922, -1.582984, -3.335065, 0, 0, 0, 1, 1,
-0.2550139, 1.936644, 0.0855396, 0, 0, 0, 1, 1,
-0.2529235, -0.6863458, -4.236646, 0, 0, 0, 1, 1,
-0.2509604, 0.7458535, -0.9808413, 0, 0, 0, 1, 1,
-0.2462507, -0.09043972, -1.322977, 1, 1, 1, 1, 1,
-0.246088, 0.5062779, -2.337866, 1, 1, 1, 1, 1,
-0.2438876, 0.2583905, -0.1957713, 1, 1, 1, 1, 1,
-0.2433654, -0.3696622, -4.485376, 1, 1, 1, 1, 1,
-0.2308539, -0.5666378, -3.595981, 1, 1, 1, 1, 1,
-0.2283866, -1.428368, -3.71856, 1, 1, 1, 1, 1,
-0.2274235, 0.13648, -0.1701176, 1, 1, 1, 1, 1,
-0.2272595, -0.9595829, -3.204646, 1, 1, 1, 1, 1,
-0.2219552, -1.237608, -2.566724, 1, 1, 1, 1, 1,
-0.2147866, 1.329899, -0.5927976, 1, 1, 1, 1, 1,
-0.2130556, 0.4400804, -0.9516, 1, 1, 1, 1, 1,
-0.2029276, -1.681851, -2.938543, 1, 1, 1, 1, 1,
-0.2024077, -0.7259184, -1.804813, 1, 1, 1, 1, 1,
-0.2013757, -0.4874879, -0.7635432, 1, 1, 1, 1, 1,
-0.2009698, 0.1779121, -0.3441694, 1, 1, 1, 1, 1,
-0.2002815, 0.2806269, -0.8769868, 0, 0, 1, 1, 1,
-0.1982152, -2.247837, -2.565658, 1, 0, 0, 1, 1,
-0.1980883, -0.4463367, -3.315269, 1, 0, 0, 1, 1,
-0.1939709, 1.531088, 0.2047548, 1, 0, 0, 1, 1,
-0.1914321, 0.5603591, -0.3279695, 1, 0, 0, 1, 1,
-0.1902227, -0.1332282, -1.372693, 1, 0, 0, 1, 1,
-0.1893278, -1.456501, -3.581126, 0, 0, 0, 1, 1,
-0.1888173, 0.5767837, -0.9347431, 0, 0, 0, 1, 1,
-0.18612, 0.1192094, -0.6549168, 0, 0, 0, 1, 1,
-0.1857377, -0.2077794, -2.631113, 0, 0, 0, 1, 1,
-0.1849807, -0.07784493, -1.782927, 0, 0, 0, 1, 1,
-0.1809535, 0.4094274, 0.2042541, 0, 0, 0, 1, 1,
-0.1743529, -0.4612968, -2.652486, 0, 0, 0, 1, 1,
-0.1739577, 0.6247867, -1.47143, 1, 1, 1, 1, 1,
-0.1732096, 0.1620344, -1.44532, 1, 1, 1, 1, 1,
-0.1663611, 0.4537332, -0.9624169, 1, 1, 1, 1, 1,
-0.1656324, 1.566546, 0.003945818, 1, 1, 1, 1, 1,
-0.165255, -1.452191, -2.429689, 1, 1, 1, 1, 1,
-0.1621666, 0.5641236, -0.6414678, 1, 1, 1, 1, 1,
-0.161849, 1.599893, -1.218591, 1, 1, 1, 1, 1,
-0.15856, 0.4516006, 0.2058128, 1, 1, 1, 1, 1,
-0.1566683, -0.9857905, -2.153119, 1, 1, 1, 1, 1,
-0.154648, 0.8340505, -0.7664068, 1, 1, 1, 1, 1,
-0.1514099, 0.862628, 1.482018, 1, 1, 1, 1, 1,
-0.145619, 0.1113706, -0.388802, 1, 1, 1, 1, 1,
-0.1430441, 0.1090687, -1.455229, 1, 1, 1, 1, 1,
-0.1408201, 0.5745766, -0.5409155, 1, 1, 1, 1, 1,
-0.1406578, 0.04391536, -2.743737, 1, 1, 1, 1, 1,
-0.1394175, 0.5208914, 1.963746, 0, 0, 1, 1, 1,
-0.1357884, 0.4801071, -0.4250979, 1, 0, 0, 1, 1,
-0.131129, 0.7431091, 0.8576379, 1, 0, 0, 1, 1,
-0.1294149, -0.3014744, -2.985888, 1, 0, 0, 1, 1,
-0.1288878, -0.3878336, -2.33471, 1, 0, 0, 1, 1,
-0.126352, 0.8182361, -0.2876421, 1, 0, 0, 1, 1,
-0.1261252, 1.340755, -0.2228618, 0, 0, 0, 1, 1,
-0.1249913, 0.7333845, 1.073159, 0, 0, 0, 1, 1,
-0.1215319, 0.2554106, -0.5013745, 0, 0, 0, 1, 1,
-0.1200311, -0.1259523, -4.201324, 0, 0, 0, 1, 1,
-0.1175133, 1.612292, -0.02619977, 0, 0, 0, 1, 1,
-0.1173123, 0.1804559, -1.413584, 0, 0, 0, 1, 1,
-0.1143484, -0.1029587, -2.254705, 0, 0, 0, 1, 1,
-0.1142535, 2.354157, -1.510907, 1, 1, 1, 1, 1,
-0.1111568, -0.1888321, -2.4446, 1, 1, 1, 1, 1,
-0.1072363, -0.2763683, -2.231482, 1, 1, 1, 1, 1,
-0.1065017, -0.3712163, -3.308538, 1, 1, 1, 1, 1,
-0.105219, -2.347992, -3.377268, 1, 1, 1, 1, 1,
-0.100937, -1.058429, -3.46151, 1, 1, 1, 1, 1,
-0.1004266, 0.9971677, 0.4546162, 1, 1, 1, 1, 1,
-0.09827962, -0.2020445, -1.440806, 1, 1, 1, 1, 1,
-0.0967383, 0.02286753, -2.042234, 1, 1, 1, 1, 1,
-0.0963996, 0.27847, 1.042658, 1, 1, 1, 1, 1,
-0.09451892, -0.3553805, -1.892712, 1, 1, 1, 1, 1,
-0.0922532, -1.073133, -3.093721, 1, 1, 1, 1, 1,
-0.09122074, -0.04644843, -4.255688, 1, 1, 1, 1, 1,
-0.09097134, 0.8956642, 1.94169, 1, 1, 1, 1, 1,
-0.08314297, -0.1643732, -3.097944, 1, 1, 1, 1, 1,
-0.07939929, 0.9525654, 0.8198666, 0, 0, 1, 1, 1,
-0.07860335, 1.444879, -1.016845, 1, 0, 0, 1, 1,
-0.07720248, -1.013246, -3.010841, 1, 0, 0, 1, 1,
-0.0676689, -1.386967, -2.986769, 1, 0, 0, 1, 1,
-0.06543639, 0.2814963, -0.6624564, 1, 0, 0, 1, 1,
-0.05725849, 0.7872381, -1.965793, 1, 0, 0, 1, 1,
-0.05291186, 0.5355176, -1.330766, 0, 0, 0, 1, 1,
-0.05207872, -0.3256887, -1.348006, 0, 0, 0, 1, 1,
-0.05048991, 0.4300979, 1.185696, 0, 0, 0, 1, 1,
-0.04809625, -0.06520849, -3.535954, 0, 0, 0, 1, 1,
-0.04721138, -0.2518274, -3.173179, 0, 0, 0, 1, 1,
-0.04535647, 1.315793, 0.3362817, 0, 0, 0, 1, 1,
-0.04301397, -0.8685422, -4.86413, 0, 0, 0, 1, 1,
-0.04128946, 1.064371, 0.7406014, 1, 1, 1, 1, 1,
-0.04101484, -1.374412, -2.028392, 1, 1, 1, 1, 1,
-0.04024219, 0.4032174, -1.635991, 1, 1, 1, 1, 1,
-0.03395985, -0.6492954, -3.084863, 1, 1, 1, 1, 1,
-0.03288728, 0.5682306, -0.03494639, 1, 1, 1, 1, 1,
-0.03226384, -0.9732706, -1.636877, 1, 1, 1, 1, 1,
-0.03057166, 0.2929973, 0.01136195, 1, 1, 1, 1, 1,
-0.03056227, -0.6507804, -3.809463, 1, 1, 1, 1, 1,
-0.030168, 0.4515816, -0.8665631, 1, 1, 1, 1, 1,
-0.02760465, 0.8544773, 0.8071532, 1, 1, 1, 1, 1,
-0.0272024, -0.02676166, -3.503736, 1, 1, 1, 1, 1,
-0.02480834, 0.7156395, 2.139581, 1, 1, 1, 1, 1,
-0.02415236, 1.600461, -0.565627, 1, 1, 1, 1, 1,
-0.02012228, 0.7902032, 0.9651052, 1, 1, 1, 1, 1,
-0.01932545, 0.1928372, -0.2794112, 1, 1, 1, 1, 1,
-0.0172253, -0.1061977, -3.826067, 0, 0, 1, 1, 1,
-0.01598355, -0.4236313, -1.885757, 1, 0, 0, 1, 1,
-0.01365099, -0.00994161, -1.319787, 1, 0, 0, 1, 1,
-0.009113635, 0.04096949, 0.2332623, 1, 0, 0, 1, 1,
-0.005014366, 0.2426366, 0.5996416, 1, 0, 0, 1, 1,
-0.00349075, 1.046192, -0.09998823, 1, 0, 0, 1, 1,
-0.003421315, -0.6831971, -2.129722, 0, 0, 0, 1, 1,
-0.001543886, 0.5241168, 1.2884, 0, 0, 0, 1, 1,
-0.0005472435, -0.9063776, -3.202756, 0, 0, 0, 1, 1,
0.008947025, 0.7612971, -0.6514642, 0, 0, 0, 1, 1,
0.01178982, -1.186698, 3.115135, 0, 0, 0, 1, 1,
0.01283374, 0.6154416, -1.068968, 0, 0, 0, 1, 1,
0.01371808, 2.036319, 0.2430719, 0, 0, 0, 1, 1,
0.01384173, -0.7416826, 3.810669, 1, 1, 1, 1, 1,
0.01545263, 0.2630521, 0.5265516, 1, 1, 1, 1, 1,
0.02232094, -1.72839, 2.748315, 1, 1, 1, 1, 1,
0.02360801, -0.605545, 2.618433, 1, 1, 1, 1, 1,
0.02475709, -0.8377196, 1.9355, 1, 1, 1, 1, 1,
0.02861682, -0.3476317, 3.599509, 1, 1, 1, 1, 1,
0.03099253, 0.4512547, -1.885602, 1, 1, 1, 1, 1,
0.03408826, 0.6629361, -0.357648, 1, 1, 1, 1, 1,
0.03667166, 0.7714676, -0.04059343, 1, 1, 1, 1, 1,
0.03749821, -0.2113047, 3.343433, 1, 1, 1, 1, 1,
0.03794629, -0.7154487, 2.021113, 1, 1, 1, 1, 1,
0.03796083, 0.440051, -0.1944671, 1, 1, 1, 1, 1,
0.04055734, 1.216121, 1.74824, 1, 1, 1, 1, 1,
0.04085889, 0.2198924, 0.2626929, 1, 1, 1, 1, 1,
0.04252194, 2.8044, 0.4684513, 1, 1, 1, 1, 1,
0.04408301, 0.4775337, 0.3435255, 0, 0, 1, 1, 1,
0.04416642, 0.02593218, -0.6102093, 1, 0, 0, 1, 1,
0.04509737, 1.373164, 0.3571221, 1, 0, 0, 1, 1,
0.0498778, -0.9860248, 3.764734, 1, 0, 0, 1, 1,
0.05127791, -0.7566997, 1.716878, 1, 0, 0, 1, 1,
0.05225955, 1.883249, 0.8442789, 1, 0, 0, 1, 1,
0.05484593, 1.184674, 0.2604324, 0, 0, 0, 1, 1,
0.05514644, -0.4922938, 1.926659, 0, 0, 0, 1, 1,
0.05952596, 0.7010233, 1.0199, 0, 0, 0, 1, 1,
0.06445438, 0.75956, 2.045319, 0, 0, 0, 1, 1,
0.06752177, 1.099933, 0.06038693, 0, 0, 0, 1, 1,
0.06890328, -0.5843473, 4.000447, 0, 0, 0, 1, 1,
0.06950298, -0.426489, 4.056626, 0, 0, 0, 1, 1,
0.06999991, 0.8833645, 2.058514, 1, 1, 1, 1, 1,
0.07150339, -0.9232981, 2.565916, 1, 1, 1, 1, 1,
0.07351582, -0.6498184, 3.283478, 1, 1, 1, 1, 1,
0.07538345, -0.2665795, 3.84686, 1, 1, 1, 1, 1,
0.07840601, -1.249115, 4.653528, 1, 1, 1, 1, 1,
0.07937416, -0.2216836, 2.891984, 1, 1, 1, 1, 1,
0.08151978, -0.3150205, 3.209142, 1, 1, 1, 1, 1,
0.0837274, 0.3227513, 0.6609757, 1, 1, 1, 1, 1,
0.08543484, 2.127915, 3.385087, 1, 1, 1, 1, 1,
0.08928145, -0.1413669, 3.160057, 1, 1, 1, 1, 1,
0.09023062, -0.4893905, 2.766465, 1, 1, 1, 1, 1,
0.09806667, 0.6120902, 0.4357966, 1, 1, 1, 1, 1,
0.1020476, -0.4190851, 2.486967, 1, 1, 1, 1, 1,
0.1092475, 0.4142995, 0.82578, 1, 1, 1, 1, 1,
0.1108454, 1.032999, 0.6773726, 1, 1, 1, 1, 1,
0.1164633, -1.114926, 1.30318, 0, 0, 1, 1, 1,
0.1219747, -1.153166, 2.090838, 1, 0, 0, 1, 1,
0.1239411, 1.485994, 0.1465472, 1, 0, 0, 1, 1,
0.1244028, 0.9540816, -1.846073, 1, 0, 0, 1, 1,
0.1253765, -0.0240662, 1.658324, 1, 0, 0, 1, 1,
0.1315966, -0.04704326, 3.015121, 1, 0, 0, 1, 1,
0.1317313, -0.2552192, 4.516961, 0, 0, 0, 1, 1,
0.1318132, -0.5709061, 3.945387, 0, 0, 0, 1, 1,
0.1320264, -0.5172014, 1.804606, 0, 0, 0, 1, 1,
0.1337564, -0.7648705, 2.973176, 0, 0, 0, 1, 1,
0.1392417, 0.5947319, 0.8508181, 0, 0, 0, 1, 1,
0.1428757, 0.07612957, 1.289709, 0, 0, 0, 1, 1,
0.1437372, -0.7942178, 3.321531, 0, 0, 0, 1, 1,
0.1471855, -0.05697074, 1.93827, 1, 1, 1, 1, 1,
0.148013, -1.14038, 3.447372, 1, 1, 1, 1, 1,
0.150814, -1.916067, 3.407698, 1, 1, 1, 1, 1,
0.1513981, -0.6265429, 2.039345, 1, 1, 1, 1, 1,
0.156474, 3.18789, -1.308714, 1, 1, 1, 1, 1,
0.1603161, 0.3424592, 0.04927428, 1, 1, 1, 1, 1,
0.161717, 0.06644235, 0.4652089, 1, 1, 1, 1, 1,
0.1658236, 1.44721, 0.4641274, 1, 1, 1, 1, 1,
0.1730464, 0.7069256, 1.704636, 1, 1, 1, 1, 1,
0.1746494, 1.595799, 0.2732704, 1, 1, 1, 1, 1,
0.1776417, 1.68117, -0.618709, 1, 1, 1, 1, 1,
0.1921024, -0.4376721, 1.278403, 1, 1, 1, 1, 1,
0.1942951, 0.6137629, 0.4831122, 1, 1, 1, 1, 1,
0.1961451, 0.8576196, -2.249463, 1, 1, 1, 1, 1,
0.1988426, 1.252948, 0.1079621, 1, 1, 1, 1, 1,
0.1990968, -0.9255649, 4.684775, 0, 0, 1, 1, 1,
0.2007829, -2.055447, 3.78319, 1, 0, 0, 1, 1,
0.2070818, -0.2985481, 2.496449, 1, 0, 0, 1, 1,
0.2159554, 0.06305561, 2.057986, 1, 0, 0, 1, 1,
0.2182978, 0.5034471, -0.5416965, 1, 0, 0, 1, 1,
0.2188042, 0.1800838, 0.1603848, 1, 0, 0, 1, 1,
0.2190096, -0.3158731, 3.4477, 0, 0, 0, 1, 1,
0.2194151, -1.01553, 2.432117, 0, 0, 0, 1, 1,
0.2194211, -0.8383624, 3.223804, 0, 0, 0, 1, 1,
0.2305734, -0.6620151, 3.890348, 0, 0, 0, 1, 1,
0.2307003, -0.6752807, 2.211371, 0, 0, 0, 1, 1,
0.2361397, -1.401044, 2.842158, 0, 0, 0, 1, 1,
0.2420792, -0.3918793, 2.169861, 0, 0, 0, 1, 1,
0.2430464, 0.2744489, -0.2353378, 1, 1, 1, 1, 1,
0.2516602, 0.65185, 1.652558, 1, 1, 1, 1, 1,
0.2543782, 1.289036, -1.690083, 1, 1, 1, 1, 1,
0.2576573, -0.005783693, 2.816329, 1, 1, 1, 1, 1,
0.2601209, -0.7188658, 2.530236, 1, 1, 1, 1, 1,
0.2621197, -0.4707019, 1.518284, 1, 1, 1, 1, 1,
0.2664621, -1.016912, 1.867927, 1, 1, 1, 1, 1,
0.2674951, 0.3346945, 1.171243, 1, 1, 1, 1, 1,
0.2691345, 2.550602, 0.2255898, 1, 1, 1, 1, 1,
0.2712385, 0.7669026, -0.4507847, 1, 1, 1, 1, 1,
0.271264, -0.5450997, 3.319308, 1, 1, 1, 1, 1,
0.271856, 0.4865457, 1.446656, 1, 1, 1, 1, 1,
0.2784524, 0.004523837, 2.214052, 1, 1, 1, 1, 1,
0.2838574, 0.5305671, 0.597445, 1, 1, 1, 1, 1,
0.2849831, -1.346054, 4.290412, 1, 1, 1, 1, 1,
0.2873854, 1.72391, -1.231827, 0, 0, 1, 1, 1,
0.288909, 0.1003416, 0.2745351, 1, 0, 0, 1, 1,
0.2947101, 0.5093194, 0.3607857, 1, 0, 0, 1, 1,
0.2947592, 0.5387787, 0.1186177, 1, 0, 0, 1, 1,
0.3015904, -0.9636586, 2.473299, 1, 0, 0, 1, 1,
0.3017198, -2.162281, 4.199886, 1, 0, 0, 1, 1,
0.3042669, 0.8773621, 0.838707, 0, 0, 0, 1, 1,
0.3057165, 0.3725192, 2.055954, 0, 0, 0, 1, 1,
0.3059444, 0.5199614, -0.4317206, 0, 0, 0, 1, 1,
0.3068803, -0.933741, 2.692369, 0, 0, 0, 1, 1,
0.3083524, 0.5400786, 2.626056, 0, 0, 0, 1, 1,
0.3178598, 0.6461228, 1.146906, 0, 0, 0, 1, 1,
0.3188788, 0.9857281, -1.278646, 0, 0, 0, 1, 1,
0.3260478, 0.4326127, 1.788903, 1, 1, 1, 1, 1,
0.3274646, 1.157053, 0.70838, 1, 1, 1, 1, 1,
0.3278661, 0.7171168, 0.009699186, 1, 1, 1, 1, 1,
0.3338681, 0.421949, 0.904456, 1, 1, 1, 1, 1,
0.3413697, -0.7009534, 3.782748, 1, 1, 1, 1, 1,
0.3414014, 0.6614646, -0.8753261, 1, 1, 1, 1, 1,
0.342047, -0.1214546, 3.464494, 1, 1, 1, 1, 1,
0.3422032, -0.4178756, 2.123761, 1, 1, 1, 1, 1,
0.3447286, 0.3960711, 0.4367831, 1, 1, 1, 1, 1,
0.3474215, 0.7355855, 0.08195862, 1, 1, 1, 1, 1,
0.3488536, 1.069517, 0.7290446, 1, 1, 1, 1, 1,
0.3503084, -0.1485918, 3.554305, 1, 1, 1, 1, 1,
0.3515586, -0.445696, 1.024485, 1, 1, 1, 1, 1,
0.3520582, 0.8122587, -0.7718991, 1, 1, 1, 1, 1,
0.3530619, 1.173256, 1.003201, 1, 1, 1, 1, 1,
0.3532709, 0.1515713, -0.8921239, 0, 0, 1, 1, 1,
0.3603126, 1.12495, 1.891147, 1, 0, 0, 1, 1,
0.3659815, 0.7313874, 2.017222, 1, 0, 0, 1, 1,
0.3670398, 1.244611, 0.2143746, 1, 0, 0, 1, 1,
0.3678896, -1.452015, 2.987745, 1, 0, 0, 1, 1,
0.3755543, 0.0239399, 0.5525858, 1, 0, 0, 1, 1,
0.3755826, 0.9508429, 0.5866691, 0, 0, 0, 1, 1,
0.3763624, 0.6793966, 0.882018, 0, 0, 0, 1, 1,
0.381854, -0.306801, 1.454437, 0, 0, 0, 1, 1,
0.3844276, -0.1083741, -0.07867385, 0, 0, 0, 1, 1,
0.3855449, 0.05769404, 0.5911235, 0, 0, 0, 1, 1,
0.3855546, -0.7631879, 2.809515, 0, 0, 0, 1, 1,
0.3877994, -1.182007, 4.253472, 0, 0, 0, 1, 1,
0.3917484, -0.6135513, 1.528826, 1, 1, 1, 1, 1,
0.3922651, 1.484488, -0.2079783, 1, 1, 1, 1, 1,
0.3940775, -1.423778, 1.241342, 1, 1, 1, 1, 1,
0.4025426, -1.180987, 3.267253, 1, 1, 1, 1, 1,
0.4043775, -0.7386903, 2.199272, 1, 1, 1, 1, 1,
0.4047558, -0.02657667, 1.505752, 1, 1, 1, 1, 1,
0.4072929, -1.342609, 3.502383, 1, 1, 1, 1, 1,
0.4075437, -0.1099005, 3.280336, 1, 1, 1, 1, 1,
0.4094093, 0.1970637, 0.1781357, 1, 1, 1, 1, 1,
0.4131809, 0.9885594, 0.1447161, 1, 1, 1, 1, 1,
0.4133287, 0.4339944, 1.313366, 1, 1, 1, 1, 1,
0.4138056, -0.369147, 1.76617, 1, 1, 1, 1, 1,
0.4147313, -0.4554479, 1.461618, 1, 1, 1, 1, 1,
0.4154878, 1.16498, 1.048566, 1, 1, 1, 1, 1,
0.4272427, 0.2636518, -0.3014797, 1, 1, 1, 1, 1,
0.4282084, -0.9960045, 0.2780818, 0, 0, 1, 1, 1,
0.4299374, 0.1660481, 3.459597, 1, 0, 0, 1, 1,
0.4304911, -0.04873949, 1.501123, 1, 0, 0, 1, 1,
0.4336238, 1.000941, -1.08562, 1, 0, 0, 1, 1,
0.4337239, -0.9758382, 3.880327, 1, 0, 0, 1, 1,
0.4342634, -0.2225398, 2.041811, 1, 0, 0, 1, 1,
0.4351885, 0.9669528, 0.2859621, 0, 0, 0, 1, 1,
0.4352402, 1.475146, 1.006553, 0, 0, 0, 1, 1,
0.4362451, -0.07097826, 2.663787, 0, 0, 0, 1, 1,
0.4373285, 1.545711, 0.2331173, 0, 0, 0, 1, 1,
0.441395, -0.356704, 2.245082, 0, 0, 0, 1, 1,
0.4428773, 0.230249, 1.117761, 0, 0, 0, 1, 1,
0.4436172, -0.2466278, 0.7360704, 0, 0, 0, 1, 1,
0.4501405, -1.434211, 2.575223, 1, 1, 1, 1, 1,
0.450176, 1.766521, 0.397412, 1, 1, 1, 1, 1,
0.452428, -0.04164566, 2.114125, 1, 1, 1, 1, 1,
0.4530221, -0.9794424, 3.338846, 1, 1, 1, 1, 1,
0.4608747, 0.8145103, -0.07007847, 1, 1, 1, 1, 1,
0.463149, -0.1955056, 0.3717138, 1, 1, 1, 1, 1,
0.4721612, 2.816303, -0.1275539, 1, 1, 1, 1, 1,
0.4762549, -0.6848449, 2.29154, 1, 1, 1, 1, 1,
0.4792381, -0.4746771, 3.032674, 1, 1, 1, 1, 1,
0.4811631, 1.636709, 2.004534, 1, 1, 1, 1, 1,
0.4822482, 1.161715, 1.720096, 1, 1, 1, 1, 1,
0.483539, 0.4010642, 2.69253, 1, 1, 1, 1, 1,
0.4883917, 0.2282243, 1.054889, 1, 1, 1, 1, 1,
0.4911076, -0.5849972, 1.001742, 1, 1, 1, 1, 1,
0.4914015, 1.046225, 1.016375, 1, 1, 1, 1, 1,
0.5082331, 0.01891241, 1.388716, 0, 0, 1, 1, 1,
0.51042, 0.5722539, -0.5940495, 1, 0, 0, 1, 1,
0.5191488, -1.674762, 4.952342, 1, 0, 0, 1, 1,
0.5204299, -0.5309975, 1.959408, 1, 0, 0, 1, 1,
0.5273867, 1.967861, 0.3420223, 1, 0, 0, 1, 1,
0.5319444, 0.338611, 1.823446, 1, 0, 0, 1, 1,
0.5339917, 0.3198315, 0.2001062, 0, 0, 0, 1, 1,
0.5357006, 0.1633501, 1.220625, 0, 0, 0, 1, 1,
0.5380323, -1.319549, 2.748144, 0, 0, 0, 1, 1,
0.5527611, 0.2472935, 1.379432, 0, 0, 0, 1, 1,
0.5555059, -1.969112, 3.338732, 0, 0, 0, 1, 1,
0.556127, -0.4704603, 2.178059, 0, 0, 0, 1, 1,
0.5602673, -0.1867072, 1.807084, 0, 0, 0, 1, 1,
0.5602899, -0.2460097, 0.7697003, 1, 1, 1, 1, 1,
0.5613653, 0.2163879, -0.1686327, 1, 1, 1, 1, 1,
0.5639935, -0.6662068, 4.66451, 1, 1, 1, 1, 1,
0.5658273, -0.5827624, 2.532311, 1, 1, 1, 1, 1,
0.5679928, -0.2775814, 1.543433, 1, 1, 1, 1, 1,
0.571007, -0.4179414, 0.8229466, 1, 1, 1, 1, 1,
0.5744702, 0.9941198, 1.572114, 1, 1, 1, 1, 1,
0.5745864, 0.7138724, 0.9171329, 1, 1, 1, 1, 1,
0.5757998, -0.4800087, 2.347865, 1, 1, 1, 1, 1,
0.5820048, 1.500948, -0.9414626, 1, 1, 1, 1, 1,
0.5826656, -1.806742, 2.73812, 1, 1, 1, 1, 1,
0.585534, 0.2005236, 1.371477, 1, 1, 1, 1, 1,
0.5865433, -1.138153, 4.030665, 1, 1, 1, 1, 1,
0.5953895, 0.5531169, 3.225102, 1, 1, 1, 1, 1,
0.5958654, 0.4722839, 1.811408, 1, 1, 1, 1, 1,
0.5961352, -0.2715243, 2.663709, 0, 0, 1, 1, 1,
0.6003241, 1.505308, 0.7458605, 1, 0, 0, 1, 1,
0.6029773, -1.364713, 1.640355, 1, 0, 0, 1, 1,
0.6035015, -1.212796, 4.120973, 1, 0, 0, 1, 1,
0.606021, 0.8739912, 0.4112512, 1, 0, 0, 1, 1,
0.6187295, 1.324006, -0.4104861, 1, 0, 0, 1, 1,
0.6205253, -1.098609, 2.418319, 0, 0, 0, 1, 1,
0.6220813, -1.055313, 1.71704, 0, 0, 0, 1, 1,
0.6226239, -1.111445, 1.992221, 0, 0, 0, 1, 1,
0.6252938, 1.05675, 0.5037121, 0, 0, 0, 1, 1,
0.6276389, 1.244792, 0.9529161, 0, 0, 0, 1, 1,
0.6352156, 0.6857234, -0.000960644, 0, 0, 0, 1, 1,
0.6373723, 1.312034, 0.2920125, 0, 0, 0, 1, 1,
0.6383635, -1.918839, 3.275803, 1, 1, 1, 1, 1,
0.6406599, -0.01006925, 3.548272, 1, 1, 1, 1, 1,
0.6444767, -0.7743596, 3.533542, 1, 1, 1, 1, 1,
0.6454145, -0.01459677, 2.730395, 1, 1, 1, 1, 1,
0.6459492, 0.430608, 0.8049754, 1, 1, 1, 1, 1,
0.6476911, 1.565585, 2.126791, 1, 1, 1, 1, 1,
0.6546686, -0.1525053, 0.447823, 1, 1, 1, 1, 1,
0.655799, -0.719484, 2.465768, 1, 1, 1, 1, 1,
0.6580061, -1.1678, 2.961299, 1, 1, 1, 1, 1,
0.6580631, -0.005138148, 1.471888, 1, 1, 1, 1, 1,
0.6694081, 1.043173, 1.988866, 1, 1, 1, 1, 1,
0.6756584, 0.2185933, -0.3947642, 1, 1, 1, 1, 1,
0.6770871, -0.5139952, 2.146387, 1, 1, 1, 1, 1,
0.6815097, 2.472614, 0.9023244, 1, 1, 1, 1, 1,
0.6891561, -0.07232513, 1.389092, 1, 1, 1, 1, 1,
0.6898824, 1.745743, 0.9956627, 0, 0, 1, 1, 1,
0.691426, -0.5333067, 1.676985, 1, 0, 0, 1, 1,
0.6934433, 0.03349408, 0.3787123, 1, 0, 0, 1, 1,
0.6970226, 0.1951256, 1.484397, 1, 0, 0, 1, 1,
0.6995343, -0.6419348, 2.692862, 1, 0, 0, 1, 1,
0.7014531, 0.8738062, 0.7448884, 1, 0, 0, 1, 1,
0.7028625, 1.018139, -0.08546536, 0, 0, 0, 1, 1,
0.7042038, -1.670967, 2.455647, 0, 0, 0, 1, 1,
0.7059931, 1.641656, -1.376141, 0, 0, 0, 1, 1,
0.7083552, -0.8926368, 1.728912, 0, 0, 0, 1, 1,
0.7155814, -0.6967432, 1.412641, 0, 0, 0, 1, 1,
0.7185395, 1.302971, 1.391454, 0, 0, 0, 1, 1,
0.7200329, 0.389169, 4.211642, 0, 0, 0, 1, 1,
0.7218185, -0.05765647, 1.544732, 1, 1, 1, 1, 1,
0.7223546, 1.521086, -1.168953, 1, 1, 1, 1, 1,
0.7235602, -0.9541919, 2.805177, 1, 1, 1, 1, 1,
0.7278867, -0.272066, 1.485115, 1, 1, 1, 1, 1,
0.7327018, -0.2064451, 0.03262501, 1, 1, 1, 1, 1,
0.7340969, 0.6151503, 0.5603181, 1, 1, 1, 1, 1,
0.7358569, 0.547068, 0.214451, 1, 1, 1, 1, 1,
0.7402669, 0.2617408, -0.05695262, 1, 1, 1, 1, 1,
0.7413009, -0.5844569, 2.199969, 1, 1, 1, 1, 1,
0.744288, -0.02758536, 0.9817846, 1, 1, 1, 1, 1,
0.7499363, 0.1774231, 1.274488, 1, 1, 1, 1, 1,
0.7528596, 0.7198585, 0.928624, 1, 1, 1, 1, 1,
0.7584976, 0.4768717, 1.994447, 1, 1, 1, 1, 1,
0.7594655, 0.580617, 0.771792, 1, 1, 1, 1, 1,
0.7636387, -1.213305, 2.098663, 1, 1, 1, 1, 1,
0.7637482, -0.9409984, 1.970194, 0, 0, 1, 1, 1,
0.7692701, -0.802223, 2.841992, 1, 0, 0, 1, 1,
0.7741519, -0.01752625, -1.169282, 1, 0, 0, 1, 1,
0.78202, -0.1704608, 3.314904, 1, 0, 0, 1, 1,
0.7834212, -2.411671, 3.013003, 1, 0, 0, 1, 1,
0.8042704, 0.2462173, 1.057318, 1, 0, 0, 1, 1,
0.8095118, -0.02549371, 0.7361926, 0, 0, 0, 1, 1,
0.8098921, 0.1551018, 0.7948363, 0, 0, 0, 1, 1,
0.8148432, 0.07238679, 0.2274736, 0, 0, 0, 1, 1,
0.820784, 0.4552959, -0.9709804, 0, 0, 0, 1, 1,
0.8242171, -1.565035, 2.571408, 0, 0, 0, 1, 1,
0.8313703, -0.01636506, 3.399171, 0, 0, 0, 1, 1,
0.8409263, 0.7371677, 0.9537685, 0, 0, 0, 1, 1,
0.8482865, 1.477633, 1.169996, 1, 1, 1, 1, 1,
0.8523723, -1.021931, 2.990289, 1, 1, 1, 1, 1,
0.8543315, 0.6434749, -0.6458502, 1, 1, 1, 1, 1,
0.861817, 2.115177, -1.017261, 1, 1, 1, 1, 1,
0.8621656, 0.1879922, 0.5944918, 1, 1, 1, 1, 1,
0.8776765, -1.443609, 3.422678, 1, 1, 1, 1, 1,
0.8795403, -0.7967941, 3.209054, 1, 1, 1, 1, 1,
0.8879512, 2.04149, 1.093708, 1, 1, 1, 1, 1,
0.8927233, -0.4396112, 1.539059, 1, 1, 1, 1, 1,
0.8928781, 1.540864, -0.9471614, 1, 1, 1, 1, 1,
0.8944206, -0.1613642, 1.159331, 1, 1, 1, 1, 1,
0.89499, -0.04420792, 1.137049, 1, 1, 1, 1, 1,
0.9035298, 0.8325633, -0.4091083, 1, 1, 1, 1, 1,
0.9057675, -1.4601, 3.864912, 1, 1, 1, 1, 1,
0.9094386, -0.6373786, 1.674646, 1, 1, 1, 1, 1,
0.9117832, 0.9191842, 1.239907, 0, 0, 1, 1, 1,
0.9199554, -0.1271296, 1.967589, 1, 0, 0, 1, 1,
0.9246992, 1.517019, -0.0578972, 1, 0, 0, 1, 1,
0.9271357, 2.417352, 1.618876, 1, 0, 0, 1, 1,
0.9296509, 0.2093768, 0.553367, 1, 0, 0, 1, 1,
0.9333051, 2.391759, -0.8555167, 1, 0, 0, 1, 1,
0.9337081, 1.404707, -0.9601791, 0, 0, 0, 1, 1,
0.9360219, -1.0969, 1.533917, 0, 0, 0, 1, 1,
0.9360482, -0.7798027, 3.194352, 0, 0, 0, 1, 1,
0.939486, 1.275702, 1.72724, 0, 0, 0, 1, 1,
0.9412164, 0.04839308, 2.688449, 0, 0, 0, 1, 1,
0.9414847, 1.277042, 0.471618, 0, 0, 0, 1, 1,
0.9419081, 1.560741, 1.212085, 0, 0, 0, 1, 1,
0.9527727, -0.2460581, 0.6173042, 1, 1, 1, 1, 1,
0.954531, -0.5007375, 2.049049, 1, 1, 1, 1, 1,
0.9588158, 0.6884497, -0.9499183, 1, 1, 1, 1, 1,
0.9588231, 0.8831809, -0.02523334, 1, 1, 1, 1, 1,
0.9625556, 0.2783203, 0.2860316, 1, 1, 1, 1, 1,
0.9637195, 0.03823547, 1.490136, 1, 1, 1, 1, 1,
0.9733723, -0.5535741, 0.900529, 1, 1, 1, 1, 1,
0.9761274, -0.103645, 2.185197, 1, 1, 1, 1, 1,
0.9843273, 0.07603525, 0.4883162, 1, 1, 1, 1, 1,
0.9865636, -0.1115272, 2.89209, 1, 1, 1, 1, 1,
0.9877594, -0.6903645, 2.891289, 1, 1, 1, 1, 1,
0.9932569, -0.8580092, 3.242976, 1, 1, 1, 1, 1,
0.9998171, -2.844077, 1.408528, 1, 1, 1, 1, 1,
1.001536, -0.1286402, 2.327413, 1, 1, 1, 1, 1,
1.002346, 0.5377505, 0.2037369, 1, 1, 1, 1, 1,
1.004932, 0.5636441, 0.9200856, 0, 0, 1, 1, 1,
1.00796, -1.364131, 1.953825, 1, 0, 0, 1, 1,
1.009327, -1.611727, 4.225727, 1, 0, 0, 1, 1,
1.009341, 1.36187, -0.1269196, 1, 0, 0, 1, 1,
1.009434, 1.25126, 1.409564, 1, 0, 0, 1, 1,
1.011788, -0.6652765, 1.218506, 1, 0, 0, 1, 1,
1.01274, 0.7908931, 0.6474505, 0, 0, 0, 1, 1,
1.01843, -0.05748597, 3.173604, 0, 0, 0, 1, 1,
1.018477, 0.7929574, 1.127236, 0, 0, 0, 1, 1,
1.020941, -1.262665, 0.4340044, 0, 0, 0, 1, 1,
1.026168, 0.2199435, 0.6317505, 0, 0, 0, 1, 1,
1.030225, 0.16232, 1.051564, 0, 0, 0, 1, 1,
1.032366, -0.05513331, 2.499797, 0, 0, 0, 1, 1,
1.042353, -1.212893, 2.086253, 1, 1, 1, 1, 1,
1.051921, 0.8156071, 0.3774634, 1, 1, 1, 1, 1,
1.052224, 1.122857, 0.7558066, 1, 1, 1, 1, 1,
1.062266, -0.5325886, 1.270716, 1, 1, 1, 1, 1,
1.065572, 0.7690843, 0.657071, 1, 1, 1, 1, 1,
1.080577, -0.7954717, 2.64972, 1, 1, 1, 1, 1,
1.090052, 0.6941257, 1.854401, 1, 1, 1, 1, 1,
1.093643, -0.9721519, 1.497234, 1, 1, 1, 1, 1,
1.098306, 0.4325325, 0.4591891, 1, 1, 1, 1, 1,
1.103316, -0.2710294, 3.255587, 1, 1, 1, 1, 1,
1.107629, 1.72127, 0.7209328, 1, 1, 1, 1, 1,
1.115357, 0.6869686, 0.2020349, 1, 1, 1, 1, 1,
1.116644, 0.4322697, 1.026814, 1, 1, 1, 1, 1,
1.117602, -1.13441, 2.124516, 1, 1, 1, 1, 1,
1.11966, -1.545641, 1.755208, 1, 1, 1, 1, 1,
1.12075, 1.573848, 1.134993, 0, 0, 1, 1, 1,
1.1257, -0.5269907, 1.893194, 1, 0, 0, 1, 1,
1.12573, 0.6872657, 0.5646478, 1, 0, 0, 1, 1,
1.133582, -1.245578, 2.742676, 1, 0, 0, 1, 1,
1.140088, -0.04442558, 1.900715, 1, 0, 0, 1, 1,
1.148639, -0.2560171, 2.327557, 1, 0, 0, 1, 1,
1.149719, -0.0437774, 1.114016, 0, 0, 0, 1, 1,
1.160719, -0.7748572, 2.682869, 0, 0, 0, 1, 1,
1.161326, -0.1505962, 0.5650037, 0, 0, 0, 1, 1,
1.165338, 1.686609, 2.077176, 0, 0, 0, 1, 1,
1.173034, -1.762149, 2.88695, 0, 0, 0, 1, 1,
1.180389, -0.5410255, 0.4692488, 0, 0, 0, 1, 1,
1.181812, 0.3931764, -0.06577958, 0, 0, 0, 1, 1,
1.188411, -0.08809225, 2.391388, 1, 1, 1, 1, 1,
1.191319, -0.4515513, 1.721817, 1, 1, 1, 1, 1,
1.193396, -0.2662667, 2.919531, 1, 1, 1, 1, 1,
1.19704, -0.8701323, 3.068085, 1, 1, 1, 1, 1,
1.201361, -0.05890071, 2.197568, 1, 1, 1, 1, 1,
1.202536, 0.1244393, 1.660985, 1, 1, 1, 1, 1,
1.204187, 0.8124016, -0.07463962, 1, 1, 1, 1, 1,
1.214021, -0.3920157, 1.518054, 1, 1, 1, 1, 1,
1.225196, 0.1223115, 1.928347, 1, 1, 1, 1, 1,
1.226018, -0.0842111, -0.2478588, 1, 1, 1, 1, 1,
1.22823, -0.7498004, 4.109748, 1, 1, 1, 1, 1,
1.23008, -0.8965043, 2.462919, 1, 1, 1, 1, 1,
1.230767, 0.5112212, -0.4255788, 1, 1, 1, 1, 1,
1.23394, 0.535643, 1.012955, 1, 1, 1, 1, 1,
1.237753, 0.8183677, -0.02943102, 1, 1, 1, 1, 1,
1.247348, 0.2034515, 0.002618599, 0, 0, 1, 1, 1,
1.247821, -1.063379, 1.746032, 1, 0, 0, 1, 1,
1.255281, -0.1047161, 1.691396, 1, 0, 0, 1, 1,
1.255347, 0.6513417, 1.702509, 1, 0, 0, 1, 1,
1.268124, -1.22759, 2.079252, 1, 0, 0, 1, 1,
1.268217, 0.1790612, 1.823157, 1, 0, 0, 1, 1,
1.272735, 0.575853, 1.811996, 0, 0, 0, 1, 1,
1.281705, -0.4208428, 2.382102, 0, 0, 0, 1, 1,
1.289139, 0.8228677, 0.8165132, 0, 0, 0, 1, 1,
1.305298, -0.6829836, 2.017924, 0, 0, 0, 1, 1,
1.30946, 0.8356582, 1.118394, 0, 0, 0, 1, 1,
1.324072, -0.4531973, 1.218037, 0, 0, 0, 1, 1,
1.324498, -0.2502763, 1.85221, 0, 0, 0, 1, 1,
1.325319, -0.05064417, 1.522072, 1, 1, 1, 1, 1,
1.328073, 2.012789, 1.943284, 1, 1, 1, 1, 1,
1.329554, -1.642249, 4.728979, 1, 1, 1, 1, 1,
1.344261, -0.7054363, 1.438619, 1, 1, 1, 1, 1,
1.348985, -1.027937, 2.751245, 1, 1, 1, 1, 1,
1.350453, -1.294151, 3.48881, 1, 1, 1, 1, 1,
1.350588, -0.4748458, 1.377075, 1, 1, 1, 1, 1,
1.364746, 0.8341197, 1.982133, 1, 1, 1, 1, 1,
1.365299, -0.3276232, 2.341598, 1, 1, 1, 1, 1,
1.366988, -0.9918117, 3.394176, 1, 1, 1, 1, 1,
1.393225, 0.1448571, 3.735709, 1, 1, 1, 1, 1,
1.398773, 0.6269606, 0.2858186, 1, 1, 1, 1, 1,
1.399113, 0.1735469, 3.276109, 1, 1, 1, 1, 1,
1.41053, -0.3159781, 2.400996, 1, 1, 1, 1, 1,
1.410628, 1.938809, -0.2892407, 1, 1, 1, 1, 1,
1.411207, -0.1689468, 2.206052, 0, 0, 1, 1, 1,
1.411473, 0.5622413, 1.71164, 1, 0, 0, 1, 1,
1.41186, -1.031716, 1.706496, 1, 0, 0, 1, 1,
1.412706, 1.525081, 0.03417259, 1, 0, 0, 1, 1,
1.419538, 0.00143022, 2.059283, 1, 0, 0, 1, 1,
1.425956, -0.6473995, 1.476729, 1, 0, 0, 1, 1,
1.429366, 0.3701221, 1.377047, 0, 0, 0, 1, 1,
1.430099, 1.103265, 0.7083943, 0, 0, 0, 1, 1,
1.438306, -0.4271182, 4.2541, 0, 0, 0, 1, 1,
1.443749, 0.6756138, 2.692661, 0, 0, 0, 1, 1,
1.447872, 0.4580565, 0.4885807, 0, 0, 0, 1, 1,
1.455398, -1.397584, 0.5841359, 0, 0, 0, 1, 1,
1.457488, -0.9086864, 1.78226, 0, 0, 0, 1, 1,
1.476387, -0.4157736, 2.356409, 1, 1, 1, 1, 1,
1.501954, 1.316972, 0.8517107, 1, 1, 1, 1, 1,
1.50214, 1.462687, 1.186802, 1, 1, 1, 1, 1,
1.507653, -1.229491, 1.936604, 1, 1, 1, 1, 1,
1.509308, -0.7002411, 3.140492, 1, 1, 1, 1, 1,
1.526473, 0.4073298, 2.616889, 1, 1, 1, 1, 1,
1.551953, 1.066884, 0.04348741, 1, 1, 1, 1, 1,
1.55624, 0.4195136, 2.31309, 1, 1, 1, 1, 1,
1.568369, -0.3001468, 1.715331, 1, 1, 1, 1, 1,
1.581427, 0.5542244, 2.867082, 1, 1, 1, 1, 1,
1.582494, -0.4391352, 3.819609, 1, 1, 1, 1, 1,
1.588784, 0.3820889, 1.040932, 1, 1, 1, 1, 1,
1.602963, -0.6688921, 2.246909, 1, 1, 1, 1, 1,
1.606864, 0.1108998, 2.134389, 1, 1, 1, 1, 1,
1.612524, -0.4517821, 2.310639, 1, 1, 1, 1, 1,
1.617082, 0.7062389, 1.415895, 0, 0, 1, 1, 1,
1.644492, -0.5091935, 2.02197, 1, 0, 0, 1, 1,
1.669946, -0.6706583, 3.212303, 1, 0, 0, 1, 1,
1.690004, 1.004266, -0.3825001, 1, 0, 0, 1, 1,
1.697399, 0.685029, 0.692533, 1, 0, 0, 1, 1,
1.710403, 0.921137, 2.190794, 1, 0, 0, 1, 1,
1.723259, 0.4231031, 1.546087, 0, 0, 0, 1, 1,
1.731576, 0.158326, 1.586643, 0, 0, 0, 1, 1,
1.741429, 0.8640738, 1.124365, 0, 0, 0, 1, 1,
1.77094, -0.6271486, 2.941159, 0, 0, 0, 1, 1,
1.771914, 0.6346796, 0.2832943, 0, 0, 0, 1, 1,
1.794405, -0.2129728, 2.141115, 0, 0, 0, 1, 1,
1.794936, -0.008059693, 1.185, 0, 0, 0, 1, 1,
1.810503, 0.6269402, 0.2941552, 1, 1, 1, 1, 1,
1.817887, -0.5723031, 3.188992, 1, 1, 1, 1, 1,
1.825429, 1.062006, 1.584835, 1, 1, 1, 1, 1,
1.825667, 0.3836288, -0.8338678, 1, 1, 1, 1, 1,
1.873246, -1.498414, 0.5858976, 1, 1, 1, 1, 1,
1.894016, -0.1321083, 0.5263022, 1, 1, 1, 1, 1,
1.896299, -0.02509728, 4.204708, 1, 1, 1, 1, 1,
1.971796, 2.032033, -0.5624775, 1, 1, 1, 1, 1,
1.978405, -0.9174101, 1.436369, 1, 1, 1, 1, 1,
1.982355, -0.4765861, 3.122729, 1, 1, 1, 1, 1,
2.005139, -1.360572, 0.8020412, 1, 1, 1, 1, 1,
2.015416, 0.5635477, 2.629966, 1, 1, 1, 1, 1,
2.016736, -0.2248676, 2.91662, 1, 1, 1, 1, 1,
2.022671, 1.015343, 1.893485, 1, 1, 1, 1, 1,
2.022764, -1.25572, 2.693262, 1, 1, 1, 1, 1,
2.048915, -2.170346, 3.199212, 0, 0, 1, 1, 1,
2.052644, 2.472636, 0.4019554, 1, 0, 0, 1, 1,
2.083517, -0.7295108, 0.1501748, 1, 0, 0, 1, 1,
2.104967, -1.530508, 2.496155, 1, 0, 0, 1, 1,
2.113729, 0.2060505, 1.079517, 1, 0, 0, 1, 1,
2.184168, -1.399482, 2.445091, 1, 0, 0, 1, 1,
2.196048, -1.903277, 0.315421, 0, 0, 0, 1, 1,
2.226045, -0.1887037, 1.251954, 0, 0, 0, 1, 1,
2.305951, 0.8026679, 1.995382, 0, 0, 0, 1, 1,
2.365599, 0.00158004, 1.231283, 0, 0, 0, 1, 1,
2.380049, 0.2794035, 0.7446109, 0, 0, 0, 1, 1,
2.385872, -0.9054422, 2.034689, 0, 0, 0, 1, 1,
2.387833, 1.792306, 0.5437683, 0, 0, 0, 1, 1,
2.5724, 1.335891, 0.4555852, 1, 1, 1, 1, 1,
2.604176, -0.8068799, 0.5597853, 1, 1, 1, 1, 1,
2.627388, 0.7155194, 1.457096, 1, 1, 1, 1, 1,
2.733392, -0.6839383, 1.371669, 1, 1, 1, 1, 1,
2.781247, -0.8348581, 1.337241, 1, 1, 1, 1, 1,
2.85876, -0.6165638, 2.419095, 1, 1, 1, 1, 1,
3.02252, -0.2716298, 1.270305, 1, 1, 1, 1, 1
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
var radius = 9.290778;
var distance = 32.63346;
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
mvMatrix.translate( 0.06505108, 0.2530727, -0.04410577 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.63346);
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
