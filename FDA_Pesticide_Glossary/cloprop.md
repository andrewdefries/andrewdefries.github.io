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
-3.16151, 0.1703228, -1.698214, 1, 0, 0, 1,
-2.879225, -0.2558806, -2.334544, 1, 0.007843138, 0, 1,
-2.739113, 0.07196766, -1.879668, 1, 0.01176471, 0, 1,
-2.668375, 0.2679183, -0.5032189, 1, 0.01960784, 0, 1,
-2.603275, -1.313169, -0.6613517, 1, 0.02352941, 0, 1,
-2.431928, -0.7785696, -3.350317, 1, 0.03137255, 0, 1,
-2.362454, -0.7171385, -3.661323, 1, 0.03529412, 0, 1,
-2.350869, -1.316113, -3.099476, 1, 0.04313726, 0, 1,
-2.350844, -0.1175255, -0.1804715, 1, 0.04705882, 0, 1,
-2.235021, -0.2679132, -1.306404, 1, 0.05490196, 0, 1,
-2.167625, 0.249491, -0.5008924, 1, 0.05882353, 0, 1,
-2.136848, 0.132885, -1.140402, 1, 0.06666667, 0, 1,
-2.107046, -0.5098236, -0.3327444, 1, 0.07058824, 0, 1,
-2.10304, -0.7980756, -3.193129, 1, 0.07843138, 0, 1,
-2.088626, 0.175949, -0.3966511, 1, 0.08235294, 0, 1,
-2.080156, 0.2778715, -2.103749, 1, 0.09019608, 0, 1,
-2.078245, 0.2378646, -0.9211305, 1, 0.09411765, 0, 1,
-2.061245, -1.350426, -0.4023764, 1, 0.1019608, 0, 1,
-2.036543, 0.03373659, -0.791549, 1, 0.1098039, 0, 1,
-2.023206, -0.5712857, -4.947333, 1, 0.1137255, 0, 1,
-2.017588, 0.6551795, -0.8275015, 1, 0.1215686, 0, 1,
-1.998337, 0.05288041, -3.014969, 1, 0.1254902, 0, 1,
-1.967414, 0.7677172, 0.3891839, 1, 0.1333333, 0, 1,
-1.953054, 0.5360045, -1.375363, 1, 0.1372549, 0, 1,
-1.951322, 0.03068143, -2.114427, 1, 0.145098, 0, 1,
-1.946563, 0.4894635, -1.65905, 1, 0.1490196, 0, 1,
-1.924032, -0.1637305, -0.380477, 1, 0.1568628, 0, 1,
-1.914682, -0.9600818, -3.371451, 1, 0.1607843, 0, 1,
-1.911108, 1.594558, -1.052632, 1, 0.1686275, 0, 1,
-1.910999, -0.9853981, -2.117501, 1, 0.172549, 0, 1,
-1.870312, 0.5712456, -1.093747, 1, 0.1803922, 0, 1,
-1.843583, 0.8072554, -3.992502, 1, 0.1843137, 0, 1,
-1.813959, 0.1512511, -0.9170638, 1, 0.1921569, 0, 1,
-1.811796, 0.7533691, -1.393226, 1, 0.1960784, 0, 1,
-1.803148, -0.3093751, -0.9305881, 1, 0.2039216, 0, 1,
-1.783314, -0.57963, -2.450255, 1, 0.2117647, 0, 1,
-1.781469, 0.9870984, -0.006435096, 1, 0.2156863, 0, 1,
-1.766896, -0.4707479, -1.417845, 1, 0.2235294, 0, 1,
-1.718674, -2.170754, -2.38603, 1, 0.227451, 0, 1,
-1.710732, 0.389798, -3.445386, 1, 0.2352941, 0, 1,
-1.703789, -1.350989, -3.508331, 1, 0.2392157, 0, 1,
-1.690375, -0.5280505, -1.39044, 1, 0.2470588, 0, 1,
-1.682898, -0.3065532, -1.490857, 1, 0.2509804, 0, 1,
-1.680432, -0.5468882, -1.035245, 1, 0.2588235, 0, 1,
-1.661532, -0.6933386, -1.272812, 1, 0.2627451, 0, 1,
-1.655912, -2.240488, -1.370155, 1, 0.2705882, 0, 1,
-1.652565, -1.789308, -2.719401, 1, 0.2745098, 0, 1,
-1.652169, 0.01072724, -1.527277, 1, 0.282353, 0, 1,
-1.648873, -1.950443, -2.917267, 1, 0.2862745, 0, 1,
-1.640157, -0.04046677, -0.5871484, 1, 0.2941177, 0, 1,
-1.626207, 0.5048791, -0.5464577, 1, 0.3019608, 0, 1,
-1.625889, -0.4074368, -3.049912, 1, 0.3058824, 0, 1,
-1.614798, -1.109968, -1.853262, 1, 0.3137255, 0, 1,
-1.591332, 2.059034, 0.3062153, 1, 0.3176471, 0, 1,
-1.590704, -0.8408087, -3.115229, 1, 0.3254902, 0, 1,
-1.578561, -0.3730466, -3.353179, 1, 0.3294118, 0, 1,
-1.571465, 2.569345, 0.7417123, 1, 0.3372549, 0, 1,
-1.560211, 1.131504, -1.662463, 1, 0.3411765, 0, 1,
-1.55498, -1.601615, -3.983613, 1, 0.3490196, 0, 1,
-1.550804, -0.09839584, -2.354581, 1, 0.3529412, 0, 1,
-1.535862, -1.198071, -2.778174, 1, 0.3607843, 0, 1,
-1.534081, 0.3432685, 0.863905, 1, 0.3647059, 0, 1,
-1.530297, 1.197189, -0.451111, 1, 0.372549, 0, 1,
-1.523215, -0.7952993, -2.945148, 1, 0.3764706, 0, 1,
-1.50433, -2.077944, -3.489286, 1, 0.3843137, 0, 1,
-1.479428, -0.08293044, -2.611912, 1, 0.3882353, 0, 1,
-1.470248, -0.3774482, -1.026741, 1, 0.3960784, 0, 1,
-1.463954, 0.2517678, -1.307121, 1, 0.4039216, 0, 1,
-1.447753, -0.1320951, -1.428038, 1, 0.4078431, 0, 1,
-1.436769, -1.112228, -2.837162, 1, 0.4156863, 0, 1,
-1.435228, -0.4301527, -2.115434, 1, 0.4196078, 0, 1,
-1.434546, -1.025921, -3.397979, 1, 0.427451, 0, 1,
-1.408848, 1.2069, -1.508392, 1, 0.4313726, 0, 1,
-1.401301, 1.281888, -1.311987, 1, 0.4392157, 0, 1,
-1.39471, 1.89729, 0.02309321, 1, 0.4431373, 0, 1,
-1.394465, -0.738668, -3.169692, 1, 0.4509804, 0, 1,
-1.364041, -1.192203, -1.879627, 1, 0.454902, 0, 1,
-1.363581, -0.9154419, -1.573833, 1, 0.4627451, 0, 1,
-1.358345, 0.4710276, -0.8055968, 1, 0.4666667, 0, 1,
-1.355857, 0.673417, -0.5519016, 1, 0.4745098, 0, 1,
-1.343044, 0.007168598, -0.9923968, 1, 0.4784314, 0, 1,
-1.331518, -0.7887419, -0.7823574, 1, 0.4862745, 0, 1,
-1.331103, -0.9197125, -1.515276, 1, 0.4901961, 0, 1,
-1.328928, -2.096742, -3.05598, 1, 0.4980392, 0, 1,
-1.328191, 0.4527053, -1.619767, 1, 0.5058824, 0, 1,
-1.318646, -2.105377, -3.30624, 1, 0.509804, 0, 1,
-1.31733, -0.3565916, -0.8837247, 1, 0.5176471, 0, 1,
-1.302126, -0.277205, -1.882419, 1, 0.5215687, 0, 1,
-1.285108, 1.172556, 0.04806268, 1, 0.5294118, 0, 1,
-1.28493, 1.6201, -0.2153815, 1, 0.5333334, 0, 1,
-1.280411, 1.549897, -2.062714, 1, 0.5411765, 0, 1,
-1.280191, 1.239262, 0.3748708, 1, 0.5450981, 0, 1,
-1.275663, -1.264913, -0.3039112, 1, 0.5529412, 0, 1,
-1.270782, -0.4469357, -3.105423, 1, 0.5568628, 0, 1,
-1.262442, 1.860799, 0.2692003, 1, 0.5647059, 0, 1,
-1.260819, -0.500264, -0.5494099, 1, 0.5686275, 0, 1,
-1.257179, -0.8676025, -2.855917, 1, 0.5764706, 0, 1,
-1.249462, -0.7341645, -4.535455, 1, 0.5803922, 0, 1,
-1.24027, -0.1499322, 1.621095, 1, 0.5882353, 0, 1,
-1.239286, 1.853817, -1.950604, 1, 0.5921569, 0, 1,
-1.213936, 1.979244, -0.4774379, 1, 0.6, 0, 1,
-1.213624, -1.61594, -3.039718, 1, 0.6078432, 0, 1,
-1.212409, 0.4675599, -2.108487, 1, 0.6117647, 0, 1,
-1.209395, 0.6268595, -2.121194, 1, 0.6196079, 0, 1,
-1.206455, 0.1993841, -3.010065, 1, 0.6235294, 0, 1,
-1.197897, -0.3734994, -2.369101, 1, 0.6313726, 0, 1,
-1.192361, -0.7263535, -2.252227, 1, 0.6352941, 0, 1,
-1.187963, -0.6039552, -1.262074, 1, 0.6431373, 0, 1,
-1.185876, 0.9193235, -3.274542, 1, 0.6470588, 0, 1,
-1.185631, -1.116219, -2.359945, 1, 0.654902, 0, 1,
-1.163547, 0.2672682, -2.192573, 1, 0.6588235, 0, 1,
-1.143472, -0.1025989, 0.2254432, 1, 0.6666667, 0, 1,
-1.13899, -0.7935609, -0.5152501, 1, 0.6705883, 0, 1,
-1.129047, -1.213064, -2.788949, 1, 0.6784314, 0, 1,
-1.127043, 0.7693232, -1.0295, 1, 0.682353, 0, 1,
-1.126687, -1.474512, -2.810384, 1, 0.6901961, 0, 1,
-1.116438, -0.3580374, -1.02166, 1, 0.6941177, 0, 1,
-1.108634, 0.6565906, 0.9034606, 1, 0.7019608, 0, 1,
-1.105828, 0.4428205, -2.404276, 1, 0.7098039, 0, 1,
-1.104171, 0.8629556, -0.4694667, 1, 0.7137255, 0, 1,
-1.102886, -0.1052542, -2.653902, 1, 0.7215686, 0, 1,
-1.101933, -0.2562243, -0.3226448, 1, 0.7254902, 0, 1,
-1.096823, -0.4806866, -1.311172, 1, 0.7333333, 0, 1,
-1.096515, 1.299926, -0.166997, 1, 0.7372549, 0, 1,
-1.092607, -0.8349062, -1.628863, 1, 0.7450981, 0, 1,
-1.084364, -1.24005, -2.935417, 1, 0.7490196, 0, 1,
-1.081881, -0.7091052, -2.540638, 1, 0.7568628, 0, 1,
-1.068271, 1.186601, -2.022416, 1, 0.7607843, 0, 1,
-1.062955, 2.408978, -1.410007, 1, 0.7686275, 0, 1,
-1.060216, 0.2269949, -0.05462475, 1, 0.772549, 0, 1,
-1.049698, -1.109475, -2.910938, 1, 0.7803922, 0, 1,
-1.047328, -0.9629332, -3.399555, 1, 0.7843137, 0, 1,
-1.046481, 1.212944, -0.413985, 1, 0.7921569, 0, 1,
-1.046352, -1.866328, -3.874812, 1, 0.7960784, 0, 1,
-1.044672, -0.6370896, -0.2285687, 1, 0.8039216, 0, 1,
-1.04163, -1.345899, -2.565918, 1, 0.8117647, 0, 1,
-1.041574, 0.6365271, -1.697982, 1, 0.8156863, 0, 1,
-1.040486, -0.6551486, -1.46849, 1, 0.8235294, 0, 1,
-1.036696, 0.1061474, 0.557352, 1, 0.827451, 0, 1,
-1.030903, -1.606789, -0.7648566, 1, 0.8352941, 0, 1,
-1.029254, 1.128037, -2.034558, 1, 0.8392157, 0, 1,
-1.025854, -0.6017576, -3.091007, 1, 0.8470588, 0, 1,
-1.023408, 2.090171, -1.669246, 1, 0.8509804, 0, 1,
-1.012007, -0.4202735, -2.189129, 1, 0.8588235, 0, 1,
-1.011613, 1.085595, -2.153137, 1, 0.8627451, 0, 1,
-1.010273, 0.4262788, -2.265985, 1, 0.8705882, 0, 1,
-1.009947, 0.2725745, -0.7992461, 1, 0.8745098, 0, 1,
-1.004062, 0.1941694, -2.281433, 1, 0.8823529, 0, 1,
-1.002501, -0.913373, -2.336123, 1, 0.8862745, 0, 1,
-1.000771, -0.1547544, -0.4694895, 1, 0.8941177, 0, 1,
-0.999595, 0.01178855, -0.7433798, 1, 0.8980392, 0, 1,
-0.9992569, 0.004330311, -0.1175372, 1, 0.9058824, 0, 1,
-0.9981001, 0.2413355, -2.059723, 1, 0.9137255, 0, 1,
-0.9969971, -0.4277256, -2.168652, 1, 0.9176471, 0, 1,
-0.9969039, 0.7042116, -1.541578, 1, 0.9254902, 0, 1,
-0.996627, 0.2492117, -0.02017808, 1, 0.9294118, 0, 1,
-0.9907948, -0.4420738, -0.9177836, 1, 0.9372549, 0, 1,
-0.9853062, 0.1356501, -0.8871261, 1, 0.9411765, 0, 1,
-0.9764298, -0.9381618, -4.192987, 1, 0.9490196, 0, 1,
-0.971458, 0.4328697, -0.9435301, 1, 0.9529412, 0, 1,
-0.9711918, 1.062925, -1.627463, 1, 0.9607843, 0, 1,
-0.9707857, -0.8879098, -3.408745, 1, 0.9647059, 0, 1,
-0.9696318, 1.36024, -0.9670028, 1, 0.972549, 0, 1,
-0.9657708, -0.910428, -3.530026, 1, 0.9764706, 0, 1,
-0.964503, -0.1578891, -3.463715, 1, 0.9843137, 0, 1,
-0.96319, -1.051644, -1.05542, 1, 0.9882353, 0, 1,
-0.9600086, -0.8928678, -1.921264, 1, 0.9960784, 0, 1,
-0.9549243, -0.8969147, -2.830103, 0.9960784, 1, 0, 1,
-0.9498996, -0.3071446, -1.170877, 0.9921569, 1, 0, 1,
-0.9493245, 0.751299, -1.437682, 0.9843137, 1, 0, 1,
-0.9441814, 1.74581, -0.564065, 0.9803922, 1, 0, 1,
-0.9393001, 1.572731, 1.896972, 0.972549, 1, 0, 1,
-0.9292128, 0.1196971, -2.404777, 0.9686275, 1, 0, 1,
-0.9279469, -1.646806, -1.934402, 0.9607843, 1, 0, 1,
-0.9256677, 0.6227905, -1.882571, 0.9568627, 1, 0, 1,
-0.9202732, 0.02118662, -1.314322, 0.9490196, 1, 0, 1,
-0.9172966, -1.149021, -4.499594, 0.945098, 1, 0, 1,
-0.9088082, 0.4689846, -1.743274, 0.9372549, 1, 0, 1,
-0.9023964, 0.02855442, -0.5930728, 0.9333333, 1, 0, 1,
-0.9012494, 0.005678752, -2.842998, 0.9254902, 1, 0, 1,
-0.8889882, -0.2467725, -2.482895, 0.9215686, 1, 0, 1,
-0.8875361, -0.2320733, -1.202814, 0.9137255, 1, 0, 1,
-0.8860405, 0.1000328, -1.416822, 0.9098039, 1, 0, 1,
-0.8851511, -0.9365087, -2.18768, 0.9019608, 1, 0, 1,
-0.8836433, 0.05185648, -1.975219, 0.8941177, 1, 0, 1,
-0.8810156, 1.274751, 0.6570832, 0.8901961, 1, 0, 1,
-0.8795832, -0.4797343, -2.511843, 0.8823529, 1, 0, 1,
-0.8756313, 0.2154007, -2.231315, 0.8784314, 1, 0, 1,
-0.8717512, 0.5939777, -0.3963594, 0.8705882, 1, 0, 1,
-0.8690327, 0.3059815, -0.9074937, 0.8666667, 1, 0, 1,
-0.8667425, 1.766973, -1.166948, 0.8588235, 1, 0, 1,
-0.8658962, 1.143388, -1.911224, 0.854902, 1, 0, 1,
-0.8652743, 0.5169638, -2.01428, 0.8470588, 1, 0, 1,
-0.8610843, -1.376353, -2.721568, 0.8431373, 1, 0, 1,
-0.8543511, -0.4040039, -1.732081, 0.8352941, 1, 0, 1,
-0.8522773, -1.378365, -2.894903, 0.8313726, 1, 0, 1,
-0.84933, -0.9683603, -2.811954, 0.8235294, 1, 0, 1,
-0.8458879, 0.2511612, -0.3373975, 0.8196079, 1, 0, 1,
-0.8429558, -0.2571647, -2.780992, 0.8117647, 1, 0, 1,
-0.8413906, -1.650947, -2.304645, 0.8078431, 1, 0, 1,
-0.8314351, 1.078132, -1.745905, 0.8, 1, 0, 1,
-0.8284874, -0.05169953, -2.944425, 0.7921569, 1, 0, 1,
-0.8173553, 1.735479, -0.7360027, 0.7882353, 1, 0, 1,
-0.8113736, -0.6705578, -3.876356, 0.7803922, 1, 0, 1,
-0.8110067, 0.1115417, -0.9890984, 0.7764706, 1, 0, 1,
-0.8051076, 1.301657, 0.08791047, 0.7686275, 1, 0, 1,
-0.8043696, 2.181672, -0.4616455, 0.7647059, 1, 0, 1,
-0.8015693, -0.2985752, -1.519255, 0.7568628, 1, 0, 1,
-0.8003222, -0.506812, -1.632443, 0.7529412, 1, 0, 1,
-0.7994349, 0.306515, -1.9389, 0.7450981, 1, 0, 1,
-0.7990663, -0.350294, -1.46826, 0.7411765, 1, 0, 1,
-0.7988839, -0.5065264, -4.391896, 0.7333333, 1, 0, 1,
-0.7950531, 2.333812, -0.3333252, 0.7294118, 1, 0, 1,
-0.7925861, -1.807263, -3.196712, 0.7215686, 1, 0, 1,
-0.7900996, -0.2986199, -1.914444, 0.7176471, 1, 0, 1,
-0.7867942, 0.879143, -2.314006, 0.7098039, 1, 0, 1,
-0.7845432, 0.1759822, -1.462047, 0.7058824, 1, 0, 1,
-0.7843592, -0.4491159, -2.208088, 0.6980392, 1, 0, 1,
-0.779902, -0.2418528, -2.005859, 0.6901961, 1, 0, 1,
-0.7788347, 0.0646819, -1.398636, 0.6862745, 1, 0, 1,
-0.769722, 1.834692, -1.210916, 0.6784314, 1, 0, 1,
-0.7693499, -0.2572767, -2.157241, 0.6745098, 1, 0, 1,
-0.7693439, -0.1731733, -4.094126, 0.6666667, 1, 0, 1,
-0.7684067, 0.05768536, -2.255053, 0.6627451, 1, 0, 1,
-0.7614517, 0.2670523, 0.9990076, 0.654902, 1, 0, 1,
-0.7587283, 0.4673204, -1.244635, 0.6509804, 1, 0, 1,
-0.7561629, -0.2726362, -0.8396647, 0.6431373, 1, 0, 1,
-0.755273, -0.2145113, -1.495818, 0.6392157, 1, 0, 1,
-0.7487523, 1.251787, -0.3571193, 0.6313726, 1, 0, 1,
-0.7469192, 1.450318, -0.7663808, 0.627451, 1, 0, 1,
-0.7445111, -2.016703, -1.846557, 0.6196079, 1, 0, 1,
-0.7422196, 0.8033107, -1.741401, 0.6156863, 1, 0, 1,
-0.7405965, 0.3109683, -0.9542885, 0.6078432, 1, 0, 1,
-0.735034, 0.8863755, 0.003620823, 0.6039216, 1, 0, 1,
-0.7328511, 1.800997, -0.4350275, 0.5960785, 1, 0, 1,
-0.7321953, 0.2760242, -1.572196, 0.5882353, 1, 0, 1,
-0.731156, 0.3958379, -1.937002, 0.5843138, 1, 0, 1,
-0.7302507, -1.188722, -2.378094, 0.5764706, 1, 0, 1,
-0.7297754, -2.64861, -3.279653, 0.572549, 1, 0, 1,
-0.725342, -1.272298, -3.990559, 0.5647059, 1, 0, 1,
-0.7248442, -0.1633813, -1.677805, 0.5607843, 1, 0, 1,
-0.7170872, -0.2228394, -0.2709269, 0.5529412, 1, 0, 1,
-0.7128968, 0.4022878, -0.4609172, 0.5490196, 1, 0, 1,
-0.7125908, -1.119645, -2.131306, 0.5411765, 1, 0, 1,
-0.7083402, 0.7008077, -1.794561, 0.5372549, 1, 0, 1,
-0.7060931, 0.8010187, -2.126719, 0.5294118, 1, 0, 1,
-0.7044846, -0.4277134, -1.8525, 0.5254902, 1, 0, 1,
-0.7019497, -1.685149, -2.916481, 0.5176471, 1, 0, 1,
-0.6924815, -0.452573, -2.833101, 0.5137255, 1, 0, 1,
-0.6912029, -0.03860262, -1.186173, 0.5058824, 1, 0, 1,
-0.6902958, -0.2961779, -2.544403, 0.5019608, 1, 0, 1,
-0.6823847, 0.614763, -2.092414, 0.4941176, 1, 0, 1,
-0.6786107, 0.7815346, -0.07537241, 0.4862745, 1, 0, 1,
-0.6784481, 1.706959, -0.7377743, 0.4823529, 1, 0, 1,
-0.6775376, 2.016223, 0.5844734, 0.4745098, 1, 0, 1,
-0.6764805, -0.7559178, -3.726808, 0.4705882, 1, 0, 1,
-0.6738602, 0.2221062, -1.549579, 0.4627451, 1, 0, 1,
-0.6728186, -0.8586795, -3.288294, 0.4588235, 1, 0, 1,
-0.6716954, -0.800074, -2.904931, 0.4509804, 1, 0, 1,
-0.6688893, 1.4464, 0.05939924, 0.4470588, 1, 0, 1,
-0.6603764, 0.7862242, 0.3306977, 0.4392157, 1, 0, 1,
-0.657847, 0.8109602, -1.223695, 0.4352941, 1, 0, 1,
-0.6572852, 3.23139, 0.723377, 0.427451, 1, 0, 1,
-0.6529832, -0.09708636, -2.491292, 0.4235294, 1, 0, 1,
-0.6500342, -0.0007805985, -1.139583, 0.4156863, 1, 0, 1,
-0.6484683, 0.9677936, -2.76984, 0.4117647, 1, 0, 1,
-0.6481521, 0.2301359, -1.678005, 0.4039216, 1, 0, 1,
-0.6452432, -0.2102128, -0.8383157, 0.3960784, 1, 0, 1,
-0.6418006, 0.2503431, -0.5599732, 0.3921569, 1, 0, 1,
-0.6400487, -2.522646, -3.314723, 0.3843137, 1, 0, 1,
-0.6381067, -0.06779094, -0.7883184, 0.3803922, 1, 0, 1,
-0.6283571, -0.1048928, -1.538247, 0.372549, 1, 0, 1,
-0.6255936, -0.2882797, -2.442548, 0.3686275, 1, 0, 1,
-0.6219876, -0.1141459, -1.287635, 0.3607843, 1, 0, 1,
-0.6155541, 2.15785, -0.4619128, 0.3568628, 1, 0, 1,
-0.6150005, -0.6043036, -3.29962, 0.3490196, 1, 0, 1,
-0.611816, -0.2536054, -2.910333, 0.345098, 1, 0, 1,
-0.6058272, 0.4944591, -1.121747, 0.3372549, 1, 0, 1,
-0.6044523, 0.4807953, 0.4306221, 0.3333333, 1, 0, 1,
-0.6001933, 1.257435, -0.1551709, 0.3254902, 1, 0, 1,
-0.599609, 2.83833, -0.08103218, 0.3215686, 1, 0, 1,
-0.5964431, 0.01036901, -3.844211, 0.3137255, 1, 0, 1,
-0.59398, -0.08599748, -1.603294, 0.3098039, 1, 0, 1,
-0.5933779, -0.9479254, -1.099986, 0.3019608, 1, 0, 1,
-0.5931105, -0.2114047, -1.495032, 0.2941177, 1, 0, 1,
-0.5923317, 0.0779474, -1.940709, 0.2901961, 1, 0, 1,
-0.5904641, 0.9638853, 0.1698343, 0.282353, 1, 0, 1,
-0.5899647, -1.293083, -3.216009, 0.2784314, 1, 0, 1,
-0.5898572, 0.3814503, -0.5760379, 0.2705882, 1, 0, 1,
-0.588998, -0.8006424, -1.151832, 0.2666667, 1, 0, 1,
-0.588963, 2.050873, 0.8977455, 0.2588235, 1, 0, 1,
-0.5870593, -1.672454, -4.122676, 0.254902, 1, 0, 1,
-0.5866033, 0.388951, 0.7593386, 0.2470588, 1, 0, 1,
-0.5854627, -1.251285, -2.599482, 0.2431373, 1, 0, 1,
-0.5836806, 0.6866485, -1.875839, 0.2352941, 1, 0, 1,
-0.579909, 0.3518381, -0.1277248, 0.2313726, 1, 0, 1,
-0.5786673, 0.3876641, -0.8478463, 0.2235294, 1, 0, 1,
-0.5743256, -0.9711331, -1.398194, 0.2196078, 1, 0, 1,
-0.5705212, -0.3165326, -1.063037, 0.2117647, 1, 0, 1,
-0.5700366, -0.5919761, -0.5804334, 0.2078431, 1, 0, 1,
-0.5694386, -3.036495, -2.879484, 0.2, 1, 0, 1,
-0.5694022, -2.131756, -0.9964046, 0.1921569, 1, 0, 1,
-0.566846, -0.4127907, -2.731149, 0.1882353, 1, 0, 1,
-0.5662234, 1.819698, -1.936768, 0.1803922, 1, 0, 1,
-0.5652726, -0.5882594, 0.2220629, 0.1764706, 1, 0, 1,
-0.563979, -0.3375479, -1.393264, 0.1686275, 1, 0, 1,
-0.5635273, 0.9139651, -1.542886, 0.1647059, 1, 0, 1,
-0.5622342, 0.9641964, -0.5633007, 0.1568628, 1, 0, 1,
-0.560725, -1.112423, -3.148373, 0.1529412, 1, 0, 1,
-0.5572299, -0.4188521, -2.688466, 0.145098, 1, 0, 1,
-0.5549195, -0.5549961, -2.096388, 0.1411765, 1, 0, 1,
-0.5547742, -0.2239527, -3.524461, 0.1333333, 1, 0, 1,
-0.5454232, 1.742676, -0.5231844, 0.1294118, 1, 0, 1,
-0.5445717, 0.7659835, -1.929163, 0.1215686, 1, 0, 1,
-0.5422996, -1.612584, -3.874627, 0.1176471, 1, 0, 1,
-0.5387609, -0.2457025, -3.087753, 0.1098039, 1, 0, 1,
-0.529557, -0.8288053, -3.140109, 0.1058824, 1, 0, 1,
-0.5169502, 0.729057, 0.1112491, 0.09803922, 1, 0, 1,
-0.516718, 0.7928008, -0.7318503, 0.09019608, 1, 0, 1,
-0.514689, 1.088737, -0.3629881, 0.08627451, 1, 0, 1,
-0.5144969, 0.7805849, -1.263993, 0.07843138, 1, 0, 1,
-0.5142547, 1.002132, -1.61658, 0.07450981, 1, 0, 1,
-0.5126781, 0.06996397, -1.295332, 0.06666667, 1, 0, 1,
-0.5109997, -1.433465, -3.561893, 0.0627451, 1, 0, 1,
-0.5104415, 2.457335, -0.4467263, 0.05490196, 1, 0, 1,
-0.509512, -1.720776, -3.004483, 0.05098039, 1, 0, 1,
-0.5061426, 0.02200614, -0.3729958, 0.04313726, 1, 0, 1,
-0.5053906, 0.2922404, -0.5143667, 0.03921569, 1, 0, 1,
-0.5020239, 1.607205, 1.211572, 0.03137255, 1, 0, 1,
-0.4982101, 0.3529603, -1.898063, 0.02745098, 1, 0, 1,
-0.4981032, 1.407371, -1.718009, 0.01960784, 1, 0, 1,
-0.4942487, 0.625923, -0.5642943, 0.01568628, 1, 0, 1,
-0.491328, 2.120809, -1.372009, 0.007843138, 1, 0, 1,
-0.4902188, 0.511842, -0.9862623, 0.003921569, 1, 0, 1,
-0.4867115, 1.210606, 0.7998158, 0, 1, 0.003921569, 1,
-0.4817717, 1.288817, 0.6007023, 0, 1, 0.01176471, 1,
-0.4804341, -1.203704, -1.16156, 0, 1, 0.01568628, 1,
-0.4800828, -0.3139219, 0.2840246, 0, 1, 0.02352941, 1,
-0.479933, 0.9983898, -2.646332, 0, 1, 0.02745098, 1,
-0.4786316, 0.4287935, -1.395569, 0, 1, 0.03529412, 1,
-0.4757705, 0.8862049, -0.2812984, 0, 1, 0.03921569, 1,
-0.4749502, -0.7988651, -0.6610081, 0, 1, 0.04705882, 1,
-0.4721887, -1.25822, -4.023646, 0, 1, 0.05098039, 1,
-0.4645771, -0.5505511, -4.574009, 0, 1, 0.05882353, 1,
-0.4639738, -0.04808974, -2.385188, 0, 1, 0.0627451, 1,
-0.4619842, -0.3855249, -2.732501, 0, 1, 0.07058824, 1,
-0.4607399, -0.04564317, -0.06326543, 0, 1, 0.07450981, 1,
-0.4586247, -0.8381712, -3.468159, 0, 1, 0.08235294, 1,
-0.4417001, -0.6579791, -2.895776, 0, 1, 0.08627451, 1,
-0.4404284, -0.7014467, -1.955643, 0, 1, 0.09411765, 1,
-0.4383247, 1.629101, -0.5374013, 0, 1, 0.1019608, 1,
-0.4379542, -0.1710012, -3.653751, 0, 1, 0.1058824, 1,
-0.4371389, -1.005762, -3.437335, 0, 1, 0.1137255, 1,
-0.4358581, -0.009377208, -2.368788, 0, 1, 0.1176471, 1,
-0.4285277, 0.2515097, -2.293154, 0, 1, 0.1254902, 1,
-0.4244393, -0.4187528, -1.821917, 0, 1, 0.1294118, 1,
-0.4237067, 1.122252, -0.6721234, 0, 1, 0.1372549, 1,
-0.421259, 0.3535765, -2.037961, 0, 1, 0.1411765, 1,
-0.420946, 2.43487, -1.393472, 0, 1, 0.1490196, 1,
-0.4203498, -0.6235807, -4.920323, 0, 1, 0.1529412, 1,
-0.4188116, 0.8393454, -1.623711, 0, 1, 0.1607843, 1,
-0.4177094, -2.019511, -4.007297, 0, 1, 0.1647059, 1,
-0.4166509, 1.047314, 1.155906, 0, 1, 0.172549, 1,
-0.4148893, -1.403934, -1.601956, 0, 1, 0.1764706, 1,
-0.4140888, -0.7063956, -3.058636, 0, 1, 0.1843137, 1,
-0.4096708, -0.2137981, -1.559807, 0, 1, 0.1882353, 1,
-0.4041159, -1.816836, -1.988121, 0, 1, 0.1960784, 1,
-0.4005092, 1.82693, 0.3569706, 0, 1, 0.2039216, 1,
-0.3997808, -1.42644, -2.643255, 0, 1, 0.2078431, 1,
-0.3980601, 0.4130122, -2.280842, 0, 1, 0.2156863, 1,
-0.395904, 1.33872, 0.5105036, 0, 1, 0.2196078, 1,
-0.3894001, 1.014159, -0.5167179, 0, 1, 0.227451, 1,
-0.3890529, 0.01725076, -1.028568, 0, 1, 0.2313726, 1,
-0.3886185, 0.04577161, -0.2088259, 0, 1, 0.2392157, 1,
-0.3881806, 0.1216658, -1.723194, 0, 1, 0.2431373, 1,
-0.3834169, 1.409811, -1.237499, 0, 1, 0.2509804, 1,
-0.3810183, -1.531779, -2.78399, 0, 1, 0.254902, 1,
-0.3808917, 1.932473, 0.9206616, 0, 1, 0.2627451, 1,
-0.3722683, -0.9555632, -0.2314998, 0, 1, 0.2666667, 1,
-0.363108, 1.112782, -0.5612217, 0, 1, 0.2745098, 1,
-0.3529765, -0.02918621, -2.974301, 0, 1, 0.2784314, 1,
-0.3496144, 0.0366793, -1.456439, 0, 1, 0.2862745, 1,
-0.3495506, -1.931638, -3.253138, 0, 1, 0.2901961, 1,
-0.349263, -0.8770436, -3.03864, 0, 1, 0.2980392, 1,
-0.3466194, -2.311015, -4.142555, 0, 1, 0.3058824, 1,
-0.3449832, 1.645096, -1.312917, 0, 1, 0.3098039, 1,
-0.3448966, -0.3321261, -2.993965, 0, 1, 0.3176471, 1,
-0.3410371, -1.483017, -3.62254, 0, 1, 0.3215686, 1,
-0.3344112, -0.9267477, -3.809749, 0, 1, 0.3294118, 1,
-0.3330059, 1.07444, -0.818057, 0, 1, 0.3333333, 1,
-0.3305824, 0.3812895, 0.3037593, 0, 1, 0.3411765, 1,
-0.3300308, -0.3441545, -3.984627, 0, 1, 0.345098, 1,
-0.3294038, 1.141688, -1.154328, 0, 1, 0.3529412, 1,
-0.3221409, -0.1420801, -2.355814, 0, 1, 0.3568628, 1,
-0.3211913, 1.264759, -0.05159327, 0, 1, 0.3647059, 1,
-0.3133902, 0.2062884, -2.301267, 0, 1, 0.3686275, 1,
-0.3080741, -1.513494, -0.8317211, 0, 1, 0.3764706, 1,
-0.3064848, -0.5819969, -4.386816, 0, 1, 0.3803922, 1,
-0.3054794, 1.914252, -0.6227034, 0, 1, 0.3882353, 1,
-0.3031142, 0.8680746, -1.281522, 0, 1, 0.3921569, 1,
-0.3012225, 0.5138122, 1.531089, 0, 1, 0.4, 1,
-0.2988011, -1.517067, -3.728039, 0, 1, 0.4078431, 1,
-0.2972226, -0.2908143, -2.244858, 0, 1, 0.4117647, 1,
-0.2887588, -0.9953627, -3.262539, 0, 1, 0.4196078, 1,
-0.2841904, -0.9291424, -2.129457, 0, 1, 0.4235294, 1,
-0.2772153, -1.12817, -2.775717, 0, 1, 0.4313726, 1,
-0.2748102, 0.9691118, 0.02524479, 0, 1, 0.4352941, 1,
-0.269895, 0.5171614, -2.596541, 0, 1, 0.4431373, 1,
-0.2687564, -0.1924588, -3.664636, 0, 1, 0.4470588, 1,
-0.2681959, 0.7061086, -0.8735236, 0, 1, 0.454902, 1,
-0.2571683, 0.06306194, -1.879601, 0, 1, 0.4588235, 1,
-0.2552869, -0.1063735, -2.192322, 0, 1, 0.4666667, 1,
-0.2538131, 0.4356828, -2.501812, 0, 1, 0.4705882, 1,
-0.2535749, 1.155651, 0.702802, 0, 1, 0.4784314, 1,
-0.2527009, 0.3645212, -0.3956557, 0, 1, 0.4823529, 1,
-0.2509663, -0.1472026, -2.789382, 0, 1, 0.4901961, 1,
-0.2499173, -0.1060718, -1.160607, 0, 1, 0.4941176, 1,
-0.2489779, -0.2275456, -0.4160903, 0, 1, 0.5019608, 1,
-0.2489207, -0.655596, -2.184983, 0, 1, 0.509804, 1,
-0.2486898, 0.4189509, -2.225652, 0, 1, 0.5137255, 1,
-0.2443651, -1.230133, -2.505162, 0, 1, 0.5215687, 1,
-0.2443193, -1.593832, -2.61031, 0, 1, 0.5254902, 1,
-0.242735, 0.1411866, -0.05293667, 0, 1, 0.5333334, 1,
-0.2406452, 0.6424419, -0.938281, 0, 1, 0.5372549, 1,
-0.2374217, -0.3978235, -2.291161, 0, 1, 0.5450981, 1,
-0.2351531, 1.023832, 1.672867, 0, 1, 0.5490196, 1,
-0.2343316, -1.401054, -1.233593, 0, 1, 0.5568628, 1,
-0.2304834, 0.2644704, 0.0906467, 0, 1, 0.5607843, 1,
-0.2272346, -0.1523301, -1.967067, 0, 1, 0.5686275, 1,
-0.2258333, -0.3909859, -3.435515, 0, 1, 0.572549, 1,
-0.223751, 0.3432749, -1.994593, 0, 1, 0.5803922, 1,
-0.2224464, -0.439505, -1.478774, 0, 1, 0.5843138, 1,
-0.2220263, 0.7381136, 0.6734579, 0, 1, 0.5921569, 1,
-0.2187631, -0.3737162, -4.25948, 0, 1, 0.5960785, 1,
-0.2158648, -1.141091, -4.103877, 0, 1, 0.6039216, 1,
-0.2133394, -1.016794, -3.67946, 0, 1, 0.6117647, 1,
-0.2116993, 0.8691896, -1.314198, 0, 1, 0.6156863, 1,
-0.2108865, -0.4512518, -2.317251, 0, 1, 0.6235294, 1,
-0.2092891, 0.3968415, -0.7996575, 0, 1, 0.627451, 1,
-0.2052746, -0.3834546, -2.497805, 0, 1, 0.6352941, 1,
-0.2048527, -0.331797, -1.784223, 0, 1, 0.6392157, 1,
-0.2037187, -2.126729, -2.028172, 0, 1, 0.6470588, 1,
-0.1982594, -0.1758835, -2.181089, 0, 1, 0.6509804, 1,
-0.1981464, -3.038978, -3.164608, 0, 1, 0.6588235, 1,
-0.195671, -1.005992, -3.892205, 0, 1, 0.6627451, 1,
-0.1948748, 1.395451, -0.229787, 0, 1, 0.6705883, 1,
-0.1945595, -1.446084, -2.783307, 0, 1, 0.6745098, 1,
-0.1912248, 1.942302, 1.534936, 0, 1, 0.682353, 1,
-0.1896258, 0.7899355, 0.5210024, 0, 1, 0.6862745, 1,
-0.1871575, 1.409789, -0.3507932, 0, 1, 0.6941177, 1,
-0.184869, 0.1474582, 0.3979158, 0, 1, 0.7019608, 1,
-0.1829485, 0.6726166, -0.7204133, 0, 1, 0.7058824, 1,
-0.1823768, -0.946583, -2.607533, 0, 1, 0.7137255, 1,
-0.1818271, 0.01034758, -0.8721164, 0, 1, 0.7176471, 1,
-0.1818255, 1.067375, 0.476923, 0, 1, 0.7254902, 1,
-0.1773033, 0.07831191, -2.286891, 0, 1, 0.7294118, 1,
-0.1721507, 0.7079614, -0.4086795, 0, 1, 0.7372549, 1,
-0.1708643, -2.086313, -3.967296, 0, 1, 0.7411765, 1,
-0.1704146, 0.2225933, -0.7773497, 0, 1, 0.7490196, 1,
-0.169979, -1.02641, -2.85185, 0, 1, 0.7529412, 1,
-0.1680908, -0.8313739, -2.658702, 0, 1, 0.7607843, 1,
-0.1672018, -0.3559387, -3.493054, 0, 1, 0.7647059, 1,
-0.1668548, 1.597636, -0.2722333, 0, 1, 0.772549, 1,
-0.166536, 0.2388202, 1.337879, 0, 1, 0.7764706, 1,
-0.1579728, 0.9973343, -1.077268, 0, 1, 0.7843137, 1,
-0.1545814, -0.6342409, -2.244985, 0, 1, 0.7882353, 1,
-0.1534463, 1.4393, -1.093662, 0, 1, 0.7960784, 1,
-0.1510634, 0.7971175, -1.064168, 0, 1, 0.8039216, 1,
-0.1462484, 0.2442178, -0.7577286, 0, 1, 0.8078431, 1,
-0.1461816, -0.4450139, -3.398275, 0, 1, 0.8156863, 1,
-0.1339765, 0.5902641, 0.3261474, 0, 1, 0.8196079, 1,
-0.1339164, 0.9471968, -1.932898, 0, 1, 0.827451, 1,
-0.1333466, 0.6149084, 1.405426, 0, 1, 0.8313726, 1,
-0.130623, 1.033076, 2.188296, 0, 1, 0.8392157, 1,
-0.126788, -0.08647642, -2.777123, 0, 1, 0.8431373, 1,
-0.1266147, 0.6493558, 0.4304916, 0, 1, 0.8509804, 1,
-0.1259538, 0.01133318, -2.705032, 0, 1, 0.854902, 1,
-0.1257619, 0.1009873, -0.0814708, 0, 1, 0.8627451, 1,
-0.1220374, -0.7918382, -1.128045, 0, 1, 0.8666667, 1,
-0.12026, 0.4108434, -1.792713, 0, 1, 0.8745098, 1,
-0.1192713, 0.4504841, -0.2415856, 0, 1, 0.8784314, 1,
-0.1086939, 0.7819311, 0.2584768, 0, 1, 0.8862745, 1,
-0.1076966, -0.1887975, -3.181589, 0, 1, 0.8901961, 1,
-0.1027552, -2.077401, -2.030284, 0, 1, 0.8980392, 1,
-0.1014306, -0.5993128, -2.605817, 0, 1, 0.9058824, 1,
-0.09802775, -1.610778, -4.479019, 0, 1, 0.9098039, 1,
-0.09693741, 0.1188225, -1.340234, 0, 1, 0.9176471, 1,
-0.0965198, 0.1046311, -0.1187588, 0, 1, 0.9215686, 1,
-0.09618071, 1.006852, -0.06255509, 0, 1, 0.9294118, 1,
-0.09448024, -0.3335396, -5.192557, 0, 1, 0.9333333, 1,
-0.08748133, -0.8235252, -4.509144, 0, 1, 0.9411765, 1,
-0.08011543, 1.354657, -0.8434083, 0, 1, 0.945098, 1,
-0.07698892, 1.408738, 0.2574356, 0, 1, 0.9529412, 1,
-0.07533647, 0.1394158, 0.006462624, 0, 1, 0.9568627, 1,
-0.0738918, 1.375188, 0.2594512, 0, 1, 0.9647059, 1,
-0.07125047, 0.8296714, -0.5908374, 0, 1, 0.9686275, 1,
-0.05229312, 0.1018512, 0.1513254, 0, 1, 0.9764706, 1,
-0.04878156, 0.7740931, 0.291542, 0, 1, 0.9803922, 1,
-0.04627258, -0.3715915, -4.775267, 0, 1, 0.9882353, 1,
-0.04294669, -1.094092, -5.087553, 0, 1, 0.9921569, 1,
-0.04253479, -1.55707, -3.265434, 0, 1, 1, 1,
-0.03893762, -0.808119, -3.786119, 0, 0.9921569, 1, 1,
-0.03839194, -0.8656576, -3.133705, 0, 0.9882353, 1, 1,
-0.03581813, -0.2117057, -3.037416, 0, 0.9803922, 1, 1,
-0.03173707, -0.8875132, -2.787313, 0, 0.9764706, 1, 1,
-0.0287836, -0.2904392, -2.984632, 0, 0.9686275, 1, 1,
-0.02748129, 0.7116442, 1.505899, 0, 0.9647059, 1, 1,
-0.02433645, 0.174138, -0.6667598, 0, 0.9568627, 1, 1,
-0.02077483, -0.4268214, -4.452489, 0, 0.9529412, 1, 1,
-0.01740654, 0.4816046, -0.514279, 0, 0.945098, 1, 1,
-0.01633277, -0.6907789, -4.829873, 0, 0.9411765, 1, 1,
-0.01433435, -0.7299334, -2.971482, 0, 0.9333333, 1, 1,
-0.01070288, 2.745272, -1.622839, 0, 0.9294118, 1, 1,
-0.004627728, 1.442154, -0.9769495, 0, 0.9215686, 1, 1,
-0.000623949, -0.4080037, -4.279109, 0, 0.9176471, 1, 1,
0.004317588, 0.2837555, -0.2736228, 0, 0.9098039, 1, 1,
0.006722584, 0.2357747, 2.048567, 0, 0.9058824, 1, 1,
0.01215336, -0.2998879, 1.914693, 0, 0.8980392, 1, 1,
0.01582409, -0.5712284, 2.720989, 0, 0.8901961, 1, 1,
0.01661035, 0.8906471, -0.957302, 0, 0.8862745, 1, 1,
0.0184205, 0.2316828, 0.4900104, 0, 0.8784314, 1, 1,
0.0268813, 1.171384, -2.967261, 0, 0.8745098, 1, 1,
0.03218227, 0.6628544, -0.6527695, 0, 0.8666667, 1, 1,
0.03336694, 0.05606029, -0.2246281, 0, 0.8627451, 1, 1,
0.04090898, 1.610768, 0.5463861, 0, 0.854902, 1, 1,
0.04836051, 0.03330368, -0.2801219, 0, 0.8509804, 1, 1,
0.04989252, -0.8080667, 0.6998127, 0, 0.8431373, 1, 1,
0.05056109, -1.443079, 4.346336, 0, 0.8392157, 1, 1,
0.05230476, -1.685641, 2.545454, 0, 0.8313726, 1, 1,
0.05320344, 0.3225852, 1.711949, 0, 0.827451, 1, 1,
0.05347653, -1.491135, 2.530475, 0, 0.8196079, 1, 1,
0.05507442, -1.874189, 3.027755, 0, 0.8156863, 1, 1,
0.05655782, -2.773837, 3.234469, 0, 0.8078431, 1, 1,
0.05682578, -1.061731, 1.812645, 0, 0.8039216, 1, 1,
0.05699962, -0.5317157, 5.499959, 0, 0.7960784, 1, 1,
0.05710177, 1.342722, -0.9027582, 0, 0.7882353, 1, 1,
0.06752835, 0.6246347, 0.5608296, 0, 0.7843137, 1, 1,
0.06760458, -0.7468794, 3.832103, 0, 0.7764706, 1, 1,
0.06898883, -0.4804813, 1.287361, 0, 0.772549, 1, 1,
0.07053643, -1.516936, 4.800242, 0, 0.7647059, 1, 1,
0.07078157, 1.249381, 1.680671, 0, 0.7607843, 1, 1,
0.07172194, 0.7124351, -0.5358825, 0, 0.7529412, 1, 1,
0.07394049, 0.0781762, 1.612138, 0, 0.7490196, 1, 1,
0.08003811, -0.3262628, 3.292379, 0, 0.7411765, 1, 1,
0.08157222, 0.1776712, 0.3401118, 0, 0.7372549, 1, 1,
0.09324832, -0.08425729, 1.70129, 0, 0.7294118, 1, 1,
0.09481025, -0.6734182, 1.973549, 0, 0.7254902, 1, 1,
0.09827004, -0.3585933, 3.597027, 0, 0.7176471, 1, 1,
0.10444, 0.6461627, 0.8058406, 0, 0.7137255, 1, 1,
0.1047137, 0.6841051, -1.011764, 0, 0.7058824, 1, 1,
0.1058966, -0.08245654, 3.321223, 0, 0.6980392, 1, 1,
0.1076862, 0.1672944, -0.1767686, 0, 0.6941177, 1, 1,
0.1090227, 1.257029, -0.4533072, 0, 0.6862745, 1, 1,
0.110213, 1.258331, 0.4497055, 0, 0.682353, 1, 1,
0.110235, -1.036108, 3.357167, 0, 0.6745098, 1, 1,
0.1108535, -1.140103, 2.910805, 0, 0.6705883, 1, 1,
0.1110048, 0.4275211, 0.7090922, 0, 0.6627451, 1, 1,
0.1151337, -0.1546504, 1.667218, 0, 0.6588235, 1, 1,
0.1160881, -0.7595895, 1.769403, 0, 0.6509804, 1, 1,
0.1160952, -0.4283768, 4.663242, 0, 0.6470588, 1, 1,
0.1189514, 1.085049, -0.1232481, 0, 0.6392157, 1, 1,
0.122836, -0.3117457, 2.156097, 0, 0.6352941, 1, 1,
0.1232423, -0.1770324, 3.297212, 0, 0.627451, 1, 1,
0.1288769, -1.477294, 3.177241, 0, 0.6235294, 1, 1,
0.1293619, -0.154555, 2.59601, 0, 0.6156863, 1, 1,
0.1338127, -0.3913771, 2.592367, 0, 0.6117647, 1, 1,
0.1427753, 0.7374646, 0.1119974, 0, 0.6039216, 1, 1,
0.1437484, 0.988838, -0.3424914, 0, 0.5960785, 1, 1,
0.1444146, -1.409755, 4.105677, 0, 0.5921569, 1, 1,
0.1453588, -2.005909, 3.32748, 0, 0.5843138, 1, 1,
0.1465131, 0.5262954, 0.08260363, 0, 0.5803922, 1, 1,
0.1649679, -1.470298, 1.924702, 0, 0.572549, 1, 1,
0.1654589, 0.4465117, -0.7871795, 0, 0.5686275, 1, 1,
0.1672577, 1.370031, 0.6665038, 0, 0.5607843, 1, 1,
0.172675, -1.37953, 2.302526, 0, 0.5568628, 1, 1,
0.1764176, -0.2562174, 3.031884, 0, 0.5490196, 1, 1,
0.1827876, -1.474315, 3.026862, 0, 0.5450981, 1, 1,
0.18391, -0.4131919, 4.17222, 0, 0.5372549, 1, 1,
0.1859993, 0.261148, 3.027963, 0, 0.5333334, 1, 1,
0.1874865, -0.7688132, 1.354144, 0, 0.5254902, 1, 1,
0.1878891, -0.9192863, 3.294976, 0, 0.5215687, 1, 1,
0.1880327, -1.322898, 2.476032, 0, 0.5137255, 1, 1,
0.1909449, 0.6304544, 0.0690018, 0, 0.509804, 1, 1,
0.192846, 1.267597, 0.3114255, 0, 0.5019608, 1, 1,
0.2026749, 1.173916, 1.350467, 0, 0.4941176, 1, 1,
0.205035, 1.594167, -1.372922, 0, 0.4901961, 1, 1,
0.2095173, 0.2042766, -0.3371468, 0, 0.4823529, 1, 1,
0.2113332, -0.4639128, 2.413081, 0, 0.4784314, 1, 1,
0.2246298, -0.0279879, 1.197453, 0, 0.4705882, 1, 1,
0.2247374, -0.4792334, 0.9371139, 0, 0.4666667, 1, 1,
0.2298094, 1.170254, -0.9992585, 0, 0.4588235, 1, 1,
0.2298272, 1.846743, 0.9453071, 0, 0.454902, 1, 1,
0.2373874, 0.8004249, 0.9558364, 0, 0.4470588, 1, 1,
0.2392983, 0.816147, -1.16968, 0, 0.4431373, 1, 1,
0.2457567, 0.008238633, 1.84261, 0, 0.4352941, 1, 1,
0.2464522, -1.479385, 2.369438, 0, 0.4313726, 1, 1,
0.2465395, -0.5325583, 2.834232, 0, 0.4235294, 1, 1,
0.2466648, -1.298753, 2.705868, 0, 0.4196078, 1, 1,
0.2488591, -0.6811563, 1.629901, 0, 0.4117647, 1, 1,
0.2506297, -0.4267245, 3.667801, 0, 0.4078431, 1, 1,
0.2554592, 0.09601805, 1.963893, 0, 0.4, 1, 1,
0.2554903, -0.09339593, -0.3133946, 0, 0.3921569, 1, 1,
0.2568, 2.63162, 1.36449, 0, 0.3882353, 1, 1,
0.2635889, 1.742278, 0.3483053, 0, 0.3803922, 1, 1,
0.2649036, 1.39769, 0.5260593, 0, 0.3764706, 1, 1,
0.2660542, -0.2619328, 2.395279, 0, 0.3686275, 1, 1,
0.2699794, -1.447423, 2.035828, 0, 0.3647059, 1, 1,
0.2706569, -0.1990893, 1.727958, 0, 0.3568628, 1, 1,
0.2736569, 0.77248, 0.06902862, 0, 0.3529412, 1, 1,
0.2737237, 0.9986852, -0.2216882, 0, 0.345098, 1, 1,
0.2777479, -0.3261805, 1.249504, 0, 0.3411765, 1, 1,
0.2855259, -0.5619018, 3.989241, 0, 0.3333333, 1, 1,
0.2865476, -0.3870773, 2.736864, 0, 0.3294118, 1, 1,
0.2870452, -1.210111, 3.249858, 0, 0.3215686, 1, 1,
0.2894392, 0.8530874, -0.5959513, 0, 0.3176471, 1, 1,
0.2961659, 0.1371799, 1.355929, 0, 0.3098039, 1, 1,
0.2974564, -0.8373604, 1.013487, 0, 0.3058824, 1, 1,
0.298435, -0.07931135, 1.344605, 0, 0.2980392, 1, 1,
0.3037983, -0.3608865, 3.596153, 0, 0.2901961, 1, 1,
0.3061266, -0.2281337, 4.213344, 0, 0.2862745, 1, 1,
0.3084412, 0.53005, 0.466677, 0, 0.2784314, 1, 1,
0.3085376, 0.1109449, 1.569065, 0, 0.2745098, 1, 1,
0.3124024, 0.5250279, 1.470215, 0, 0.2666667, 1, 1,
0.3141222, 0.9963245, 0.8432326, 0, 0.2627451, 1, 1,
0.3168953, 1.148837, -0.4457875, 0, 0.254902, 1, 1,
0.3181517, 0.2612233, 1.067721, 0, 0.2509804, 1, 1,
0.3209118, -1.973095, 2.146572, 0, 0.2431373, 1, 1,
0.3228861, -1.381863, 3.171113, 0, 0.2392157, 1, 1,
0.3294429, 0.7610769, 0.9409335, 0, 0.2313726, 1, 1,
0.3336178, 1.429832, 1.750541, 0, 0.227451, 1, 1,
0.3371341, 1.617004, -1.021172, 0, 0.2196078, 1, 1,
0.3398361, -0.6126563, 1.317977, 0, 0.2156863, 1, 1,
0.3441134, -0.4834373, 1.837889, 0, 0.2078431, 1, 1,
0.3473091, -0.407787, -0.3722719, 0, 0.2039216, 1, 1,
0.3475453, -0.7486677, 4.009662, 0, 0.1960784, 1, 1,
0.3524096, 0.9707628, 0.1954401, 0, 0.1882353, 1, 1,
0.3531953, 0.4052394, 1.483205, 0, 0.1843137, 1, 1,
0.3550765, 0.2467548, 1.86907, 0, 0.1764706, 1, 1,
0.3564006, -0.1611405, 1.586239, 0, 0.172549, 1, 1,
0.3568188, -1.591127, 2.612812, 0, 0.1647059, 1, 1,
0.3574691, 0.7720052, 1.73591, 0, 0.1607843, 1, 1,
0.3582212, -0.7376409, 1.937741, 0, 0.1529412, 1, 1,
0.3583168, -1.185367, 3.758708, 0, 0.1490196, 1, 1,
0.3591172, -1.565556, 1.301943, 0, 0.1411765, 1, 1,
0.3592928, 0.8177506, -0.1599104, 0, 0.1372549, 1, 1,
0.3598678, 0.207115, 2.230606, 0, 0.1294118, 1, 1,
0.3612028, 1.310887, 1.024106, 0, 0.1254902, 1, 1,
0.3615089, -1.254328, 3.214248, 0, 0.1176471, 1, 1,
0.3628242, 0.408132, -0.02824145, 0, 0.1137255, 1, 1,
0.363919, 0.8358315, 0.9861166, 0, 0.1058824, 1, 1,
0.3651082, 0.9755828, 0.3543192, 0, 0.09803922, 1, 1,
0.3697716, 0.3549459, 0.8492242, 0, 0.09411765, 1, 1,
0.3787129, 1.557647, 0.2778705, 0, 0.08627451, 1, 1,
0.3855096, 0.5398258, 0.6319429, 0, 0.08235294, 1, 1,
0.3870322, 0.3644289, 0.09180984, 0, 0.07450981, 1, 1,
0.3893341, 0.04331359, -0.610171, 0, 0.07058824, 1, 1,
0.3946491, -0.2314234, 2.726248, 0, 0.0627451, 1, 1,
0.3949685, -1.478552, 3.663095, 0, 0.05882353, 1, 1,
0.3982048, -2.001637, 4.795775, 0, 0.05098039, 1, 1,
0.4024285, -2.286821, 0.6262228, 0, 0.04705882, 1, 1,
0.4028817, -1.057853, 1.164755, 0, 0.03921569, 1, 1,
0.4040187, -0.05239078, -1.036419, 0, 0.03529412, 1, 1,
0.4040624, -0.5662446, 2.635052, 0, 0.02745098, 1, 1,
0.4062436, 0.3559263, -0.6703109, 0, 0.02352941, 1, 1,
0.4071806, -0.7373492, 3.814867, 0, 0.01568628, 1, 1,
0.4073214, 0.7719485, 0.4557674, 0, 0.01176471, 1, 1,
0.4073465, 0.7290598, 1.493971, 0, 0.003921569, 1, 1,
0.4076154, -0.6321434, 1.68572, 0.003921569, 0, 1, 1,
0.40834, -0.9665705, 2.922801, 0.007843138, 0, 1, 1,
0.4160975, 0.332393, 1.491129, 0.01568628, 0, 1, 1,
0.4205978, -0.3655617, 0.6230441, 0.01960784, 0, 1, 1,
0.42387, -1.214452, 2.36326, 0.02745098, 0, 1, 1,
0.4248597, -0.07273934, 0.02572576, 0.03137255, 0, 1, 1,
0.426176, -0.7601364, 2.3919, 0.03921569, 0, 1, 1,
0.4279656, 0.6967611, 0.6378016, 0.04313726, 0, 1, 1,
0.4285826, 1.079561, 0.6882161, 0.05098039, 0, 1, 1,
0.4286199, -1.392477, 4.115726, 0.05490196, 0, 1, 1,
0.4309975, -0.559298, 1.683366, 0.0627451, 0, 1, 1,
0.4346794, 1.447948, -0.486448, 0.06666667, 0, 1, 1,
0.4373335, 3.189984, 0.3913985, 0.07450981, 0, 1, 1,
0.4405295, -1.58945, 4.420753, 0.07843138, 0, 1, 1,
0.4440901, -0.3418748, 3.020751, 0.08627451, 0, 1, 1,
0.444402, 0.03464243, 1.195183, 0.09019608, 0, 1, 1,
0.4448408, 0.1192148, 0.693837, 0.09803922, 0, 1, 1,
0.4448949, 0.1926964, -0.4460165, 0.1058824, 0, 1, 1,
0.4461309, -0.8824889, 2.128293, 0.1098039, 0, 1, 1,
0.4473225, 0.01653499, 0.8596869, 0.1176471, 0, 1, 1,
0.4475298, -0.9287521, 2.564204, 0.1215686, 0, 1, 1,
0.4481507, -0.1936575, -0.5808264, 0.1294118, 0, 1, 1,
0.4529516, -0.9905073, 3.888651, 0.1333333, 0, 1, 1,
0.4663064, -0.9089531, 3.369393, 0.1411765, 0, 1, 1,
0.466673, 1.97769, 0.6920015, 0.145098, 0, 1, 1,
0.4734403, -0.9670609, 2.633397, 0.1529412, 0, 1, 1,
0.4766783, 0.985057, 0.8010368, 0.1568628, 0, 1, 1,
0.4805846, -1.633172, 4.121419, 0.1647059, 0, 1, 1,
0.483075, 1.49319, 0.6213987, 0.1686275, 0, 1, 1,
0.4892372, -2.44512, 3.332009, 0.1764706, 0, 1, 1,
0.490276, 0.5317246, -0.4733889, 0.1803922, 0, 1, 1,
0.4912159, 0.7966582, 0.1654063, 0.1882353, 0, 1, 1,
0.4944925, 1.755803, -0.06823669, 0.1921569, 0, 1, 1,
0.4967402, -0.04832218, 2.546537, 0.2, 0, 1, 1,
0.4990031, 1.097734, 1.287541, 0.2078431, 0, 1, 1,
0.4995846, -0.878971, 3.044753, 0.2117647, 0, 1, 1,
0.5034847, -0.4585265, 3.13636, 0.2196078, 0, 1, 1,
0.5059157, 0.30011, 1.575787, 0.2235294, 0, 1, 1,
0.5067933, 0.01893482, 2.329776, 0.2313726, 0, 1, 1,
0.5075533, 0.9308873, -0.7927441, 0.2352941, 0, 1, 1,
0.5084968, 0.3283155, 0.3731645, 0.2431373, 0, 1, 1,
0.5097078, 0.8994659, 0.50414, 0.2470588, 0, 1, 1,
0.5097231, 0.3356912, -0.8088323, 0.254902, 0, 1, 1,
0.5115584, 2.043095, 1.012791, 0.2588235, 0, 1, 1,
0.5164063, 1.100238, 1.481963, 0.2666667, 0, 1, 1,
0.5164976, 0.4009056, 0.2940685, 0.2705882, 0, 1, 1,
0.526566, -0.6736926, 2.842644, 0.2784314, 0, 1, 1,
0.5292243, -1.40999, 2.283616, 0.282353, 0, 1, 1,
0.5340567, -1.335295, 3.06011, 0.2901961, 0, 1, 1,
0.5346841, -0.7270004, 4.579875, 0.2941177, 0, 1, 1,
0.536718, 1.242057, 0.79603, 0.3019608, 0, 1, 1,
0.5376088, -0.3283527, 1.862353, 0.3098039, 0, 1, 1,
0.5379397, 0.04801199, 0.546847, 0.3137255, 0, 1, 1,
0.5392335, 1.453127, -1.693993, 0.3215686, 0, 1, 1,
0.5403674, -0.4214952, -0.1685767, 0.3254902, 0, 1, 1,
0.5458935, -1.504918, 3.578808, 0.3333333, 0, 1, 1,
0.5475553, 0.8031095, -0.2545857, 0.3372549, 0, 1, 1,
0.5648007, -0.07805938, 1.5763, 0.345098, 0, 1, 1,
0.5677619, 0.6741464, -0.513733, 0.3490196, 0, 1, 1,
0.5696355, 1.670215, 0.09805205, 0.3568628, 0, 1, 1,
0.5754817, -0.5150673, 0.3630499, 0.3607843, 0, 1, 1,
0.5777388, 0.4394857, 1.894044, 0.3686275, 0, 1, 1,
0.5823598, -0.7811618, 2.010156, 0.372549, 0, 1, 1,
0.5909, 0.4835333, 0.6146756, 0.3803922, 0, 1, 1,
0.592212, 0.4432236, 0.6597628, 0.3843137, 0, 1, 1,
0.5974312, -1.083971, 3.109702, 0.3921569, 0, 1, 1,
0.5988928, 0.05952046, 0.7356799, 0.3960784, 0, 1, 1,
0.6006397, -0.5595639, 2.506503, 0.4039216, 0, 1, 1,
0.6018419, -0.6260747, 1.123486, 0.4117647, 0, 1, 1,
0.6020082, -3.080767, 2.64923, 0.4156863, 0, 1, 1,
0.6026033, -0.3700265, 1.142527, 0.4235294, 0, 1, 1,
0.6030437, -0.8043717, 2.008239, 0.427451, 0, 1, 1,
0.60426, 0.1546659, 0.8534259, 0.4352941, 0, 1, 1,
0.6054617, -0.2088122, 1.480893, 0.4392157, 0, 1, 1,
0.6056243, 1.73518, 1.314811, 0.4470588, 0, 1, 1,
0.6074663, -0.1099969, 2.312827, 0.4509804, 0, 1, 1,
0.6075243, -0.2494406, 1.600634, 0.4588235, 0, 1, 1,
0.6094635, 0.1627366, 2.898502, 0.4627451, 0, 1, 1,
0.6106243, 1.477708, -0.3122287, 0.4705882, 0, 1, 1,
0.6110741, 0.4690544, 0.390347, 0.4745098, 0, 1, 1,
0.611309, -2.868586, 2.113379, 0.4823529, 0, 1, 1,
0.6125247, 0.5021462, 1.727231, 0.4862745, 0, 1, 1,
0.6183712, 0.66373, -0.5696754, 0.4941176, 0, 1, 1,
0.6212052, 1.015692, 0.8254755, 0.5019608, 0, 1, 1,
0.6219365, -0.5796047, 3.502031, 0.5058824, 0, 1, 1,
0.6249347, 1.017268, -0.0407691, 0.5137255, 0, 1, 1,
0.6290807, -1.322188, 2.664738, 0.5176471, 0, 1, 1,
0.6334957, 1.423855, 0.3014512, 0.5254902, 0, 1, 1,
0.6356344, -0.1665541, 0.8303627, 0.5294118, 0, 1, 1,
0.6419837, -1.251033, 3.474183, 0.5372549, 0, 1, 1,
0.6422377, 1.158471, 0.4625118, 0.5411765, 0, 1, 1,
0.6424929, -1.535233, 2.360597, 0.5490196, 0, 1, 1,
0.6434085, 0.2572054, 1.081814, 0.5529412, 0, 1, 1,
0.6441446, 0.1053237, 0.8897432, 0.5607843, 0, 1, 1,
0.6479588, -1.432032, 2.207221, 0.5647059, 0, 1, 1,
0.6498145, -0.635217, 2.002, 0.572549, 0, 1, 1,
0.6558647, -1.821496, 2.533575, 0.5764706, 0, 1, 1,
0.6611178, 0.3391499, 1.340371, 0.5843138, 0, 1, 1,
0.664298, 0.4993665, 3.595609, 0.5882353, 0, 1, 1,
0.6654705, -1.103864, 1.789831, 0.5960785, 0, 1, 1,
0.6667631, -0.2798593, 4.030358, 0.6039216, 0, 1, 1,
0.6689783, -2.378999, 1.418158, 0.6078432, 0, 1, 1,
0.6705507, 2.045564, 1.408181, 0.6156863, 0, 1, 1,
0.6742007, -0.627822, 3.163164, 0.6196079, 0, 1, 1,
0.6742401, 2.129744, 0.1099334, 0.627451, 0, 1, 1,
0.6749573, 1.474606, 1.24705, 0.6313726, 0, 1, 1,
0.6750739, 0.5559871, 0.8384886, 0.6392157, 0, 1, 1,
0.6779075, 1.277831, -0.1632252, 0.6431373, 0, 1, 1,
0.6796777, -0.9214082, 1.9335, 0.6509804, 0, 1, 1,
0.6803933, 0.3372337, 2.891726, 0.654902, 0, 1, 1,
0.6805882, -0.9426598, 2.757508, 0.6627451, 0, 1, 1,
0.6825022, 0.1986356, 0.5584088, 0.6666667, 0, 1, 1,
0.6827509, -0.6698088, 1.122979, 0.6745098, 0, 1, 1,
0.6839755, -0.5587015, 1.108036, 0.6784314, 0, 1, 1,
0.6866286, 0.6145779, 1.691697, 0.6862745, 0, 1, 1,
0.6927224, -0.1706105, 1.779609, 0.6901961, 0, 1, 1,
0.6950155, 0.7943237, 1.920508, 0.6980392, 0, 1, 1,
0.6953187, 0.6127843, 1.552988, 0.7058824, 0, 1, 1,
0.6995365, 1.437089, 2.868344, 0.7098039, 0, 1, 1,
0.7051322, 0.9952021, -0.9397161, 0.7176471, 0, 1, 1,
0.7070404, 0.4139663, 1.880222, 0.7215686, 0, 1, 1,
0.7118899, -1.282918, 2.025511, 0.7294118, 0, 1, 1,
0.7143556, 1.534364, -0.4060608, 0.7333333, 0, 1, 1,
0.7178927, 0.6760381, 0.2445426, 0.7411765, 0, 1, 1,
0.7181031, -0.3835954, -0.2092418, 0.7450981, 0, 1, 1,
0.7316403, -0.9753234, 0.7414693, 0.7529412, 0, 1, 1,
0.736238, 0.5485192, 0.9460291, 0.7568628, 0, 1, 1,
0.7363489, -0.4772995, 2.262585, 0.7647059, 0, 1, 1,
0.7406868, -0.2262436, 4.012881, 0.7686275, 0, 1, 1,
0.7415894, 1.442141, -0.9666357, 0.7764706, 0, 1, 1,
0.7504452, -1.334711, 3.875024, 0.7803922, 0, 1, 1,
0.7512228, -1.510853, 3.801152, 0.7882353, 0, 1, 1,
0.7515672, 0.2963028, 2.445813, 0.7921569, 0, 1, 1,
0.7546655, 1.023929, 0.9606932, 0.8, 0, 1, 1,
0.7718521, 0.2270944, 2.920164, 0.8078431, 0, 1, 1,
0.7721039, -1.592048, 2.456141, 0.8117647, 0, 1, 1,
0.7732091, 1.224798, -1.249437, 0.8196079, 0, 1, 1,
0.7767047, 0.6681666, 1.796183, 0.8235294, 0, 1, 1,
0.7810336, -1.257036, 2.430972, 0.8313726, 0, 1, 1,
0.7829714, -0.2423849, 1.316734, 0.8352941, 0, 1, 1,
0.7836607, 1.053151, 0.05837029, 0.8431373, 0, 1, 1,
0.7907094, 0.02409942, 1.681079, 0.8470588, 0, 1, 1,
0.7962477, -0.9946396, 3.715979, 0.854902, 0, 1, 1,
0.7972551, -0.782418, 1.605663, 0.8588235, 0, 1, 1,
0.7980891, 0.4009886, 0.6099699, 0.8666667, 0, 1, 1,
0.7991513, 1.230868, -1.095746, 0.8705882, 0, 1, 1,
0.8048295, 1.078776, 1.232149, 0.8784314, 0, 1, 1,
0.8073057, 0.48281, 0.990761, 0.8823529, 0, 1, 1,
0.8102432, 0.4464124, 0.4849694, 0.8901961, 0, 1, 1,
0.8284698, 0.3178373, 2.772561, 0.8941177, 0, 1, 1,
0.8329595, -0.004208182, 1.816951, 0.9019608, 0, 1, 1,
0.8394886, 0.08100384, 2.233865, 0.9098039, 0, 1, 1,
0.83961, -0.9265076, 3.380395, 0.9137255, 0, 1, 1,
0.8431019, 1.375251, 0.7536913, 0.9215686, 0, 1, 1,
0.8462291, 0.4840972, -0.7508993, 0.9254902, 0, 1, 1,
0.850141, -0.6423229, 0.8558709, 0.9333333, 0, 1, 1,
0.8508705, 1.21564, -0.7843043, 0.9372549, 0, 1, 1,
0.8580341, -0.2018358, 2.262816, 0.945098, 0, 1, 1,
0.8731352, -1.84649, 1.812583, 0.9490196, 0, 1, 1,
0.8731811, 1.626537, 0.5677223, 0.9568627, 0, 1, 1,
0.8753076, 1.289296, 0.433152, 0.9607843, 0, 1, 1,
0.8785482, 0.4406195, 1.079556, 0.9686275, 0, 1, 1,
0.8853086, 1.410573, 1.432787, 0.972549, 0, 1, 1,
0.8877618, 0.1674151, 1.52646, 0.9803922, 0, 1, 1,
0.8904809, -2.073606, 3.833264, 0.9843137, 0, 1, 1,
0.8979228, 0.06741113, 0.6718464, 0.9921569, 0, 1, 1,
0.899239, 1.426686, 1.963626, 0.9960784, 0, 1, 1,
0.9016773, -0.4764729, 1.189025, 1, 0, 0.9960784, 1,
0.9019771, -1.167406, 1.640003, 1, 0, 0.9882353, 1,
0.9075313, 1.426242, 0.1218664, 1, 0, 0.9843137, 1,
0.9081934, -1.43034, 2.877647, 1, 0, 0.9764706, 1,
0.9169861, 1.416853, 0.297416, 1, 0, 0.972549, 1,
0.9185167, 0.3212097, 2.26335, 1, 0, 0.9647059, 1,
0.9186409, -1.362808, 2.248718, 1, 0, 0.9607843, 1,
0.918949, -0.04356964, 2.435571, 1, 0, 0.9529412, 1,
0.9218769, -1.301474, 2.577952, 1, 0, 0.9490196, 1,
0.9273973, 0.7641714, 0.9428155, 1, 0, 0.9411765, 1,
0.9300142, -1.30296, 2.8276, 1, 0, 0.9372549, 1,
0.9303947, 0.6123338, -0.7944667, 1, 0, 0.9294118, 1,
0.9307871, -1.260979, 3.541448, 1, 0, 0.9254902, 1,
0.9316513, 0.2331856, 2.471611, 1, 0, 0.9176471, 1,
0.9319841, 2.457476, 2.460471, 1, 0, 0.9137255, 1,
0.9484674, 0.9138486, 2.18249, 1, 0, 0.9058824, 1,
0.9504239, 0.6099474, 2.105099, 1, 0, 0.9019608, 1,
0.9558914, -0.2397192, 2.025921, 1, 0, 0.8941177, 1,
0.9628201, 0.562513, -0.02142823, 1, 0, 0.8862745, 1,
0.9629835, 0.598757, 0.7258732, 1, 0, 0.8823529, 1,
0.9725648, 0.07028651, 1.202059, 1, 0, 0.8745098, 1,
0.9730427, 2.401283, 0.01953731, 1, 0, 0.8705882, 1,
0.9743879, 0.9707919, 0.1496541, 1, 0, 0.8627451, 1,
0.9771904, 0.7342255, -0.6529872, 1, 0, 0.8588235, 1,
0.9856868, -0.3397549, 1.516757, 1, 0, 0.8509804, 1,
0.9961836, 1.189859, 0.0006540541, 1, 0, 0.8470588, 1,
1.007799, 2.827274, 0.8222893, 1, 0, 0.8392157, 1,
1.00823, -0.4609696, 0.7415813, 1, 0, 0.8352941, 1,
1.008847, 0.1689007, 2.431609, 1, 0, 0.827451, 1,
1.011294, -0.7426161, 1.452935, 1, 0, 0.8235294, 1,
1.015121, -0.4308734, 2.343466, 1, 0, 0.8156863, 1,
1.028578, -0.0276166, 3.749772, 1, 0, 0.8117647, 1,
1.03007, -0.5783201, 2.482711, 1, 0, 0.8039216, 1,
1.035204, -1.128727, 1.352075, 1, 0, 0.7960784, 1,
1.042248, -2.245596, 3.80084, 1, 0, 0.7921569, 1,
1.043156, -0.6822519, 1.755942, 1, 0, 0.7843137, 1,
1.044145, 1.41867, -0.4584129, 1, 0, 0.7803922, 1,
1.049587, 0.6185964, 1.076931, 1, 0, 0.772549, 1,
1.051249, 0.6134219, -0.2657579, 1, 0, 0.7686275, 1,
1.052251, 0.05416322, 1.329472, 1, 0, 0.7607843, 1,
1.053894, -2.121733, 3.049695, 1, 0, 0.7568628, 1,
1.058657, 1.417807, 0.3980614, 1, 0, 0.7490196, 1,
1.060817, -0.902354, 1.427899, 1, 0, 0.7450981, 1,
1.061544, 0.9339781, 2.095121, 1, 0, 0.7372549, 1,
1.062138, -0.4547195, 1.3558, 1, 0, 0.7333333, 1,
1.075783, 0.2893873, 1.255853, 1, 0, 0.7254902, 1,
1.077616, -0.5158333, 0.9071827, 1, 0, 0.7215686, 1,
1.080028, -0.03658049, 3.579344, 1, 0, 0.7137255, 1,
1.080103, -0.7453095, 0.7864127, 1, 0, 0.7098039, 1,
1.081219, 1.703176, 0.6153489, 1, 0, 0.7019608, 1,
1.087826, -1.467225, 2.741605, 1, 0, 0.6941177, 1,
1.092442, 0.5189557, -0.9051157, 1, 0, 0.6901961, 1,
1.094393, 1.866312, 0.7736711, 1, 0, 0.682353, 1,
1.096178, 2.038288, 0.4283489, 1, 0, 0.6784314, 1,
1.103999, -0.1512987, 1.777043, 1, 0, 0.6705883, 1,
1.107889, 0.5524353, -0.7552249, 1, 0, 0.6666667, 1,
1.111507, -2.276798, 0.6251944, 1, 0, 0.6588235, 1,
1.112956, -0.4462731, 1.885237, 1, 0, 0.654902, 1,
1.114776, -0.4694986, 0.679921, 1, 0, 0.6470588, 1,
1.118256, -1.99337, 2.450247, 1, 0, 0.6431373, 1,
1.12478, 0.6481689, 0.116297, 1, 0, 0.6352941, 1,
1.12939, 0.08361997, 1.290534, 1, 0, 0.6313726, 1,
1.129553, -0.4623013, 1.474946, 1, 0, 0.6235294, 1,
1.134016, -0.6351856, 2.971518, 1, 0, 0.6196079, 1,
1.13935, 0.0714698, 0.8353851, 1, 0, 0.6117647, 1,
1.140423, 0.3995857, 0.1411119, 1, 0, 0.6078432, 1,
1.153349, -2.447709, 2.116637, 1, 0, 0.6, 1,
1.158951, -1.297194, 3.843735, 1, 0, 0.5921569, 1,
1.169196, -0.3314857, 2.085232, 1, 0, 0.5882353, 1,
1.174896, 0.1636775, 1.408732, 1, 0, 0.5803922, 1,
1.176013, -1.461724, 3.201321, 1, 0, 0.5764706, 1,
1.177769, 1.255286, 0.242869, 1, 0, 0.5686275, 1,
1.181195, -1.080707, 5.261876, 1, 0, 0.5647059, 1,
1.187008, -0.07793026, 2.642518, 1, 0, 0.5568628, 1,
1.20071, -0.0191643, 1.385002, 1, 0, 0.5529412, 1,
1.210513, 0.4219705, 1.37601, 1, 0, 0.5450981, 1,
1.216856, -2.255977, 2.662871, 1, 0, 0.5411765, 1,
1.231349, 0.3898306, 0.2934117, 1, 0, 0.5333334, 1,
1.236639, 1.498949, -0.1902265, 1, 0, 0.5294118, 1,
1.248685, -0.3683979, 1.892764, 1, 0, 0.5215687, 1,
1.262517, 0.9307128, 1.627453, 1, 0, 0.5176471, 1,
1.267342, -0.5245743, 0.8478913, 1, 0, 0.509804, 1,
1.268263, -0.9396662, 2.111069, 1, 0, 0.5058824, 1,
1.28095, -0.1878346, 1.845568, 1, 0, 0.4980392, 1,
1.292179, 0.2742489, -0.1689792, 1, 0, 0.4901961, 1,
1.298306, -0.8800232, 2.539868, 1, 0, 0.4862745, 1,
1.315937, -0.6315153, 0.8794886, 1, 0, 0.4784314, 1,
1.318441, 1.026655, 1.126086, 1, 0, 0.4745098, 1,
1.341001, -0.07574496, 2.082649, 1, 0, 0.4666667, 1,
1.343398, 1.50397, 0.2706393, 1, 0, 0.4627451, 1,
1.352023, -0.2845577, 1.934259, 1, 0, 0.454902, 1,
1.358586, -0.2437474, 2.077266, 1, 0, 0.4509804, 1,
1.363684, 0.4749907, -0.4910529, 1, 0, 0.4431373, 1,
1.387162, 0.09749807, 0.9257815, 1, 0, 0.4392157, 1,
1.39062, 0.04520494, 1.694772, 1, 0, 0.4313726, 1,
1.391098, 0.3208335, 1.62427, 1, 0, 0.427451, 1,
1.393025, 0.03438536, 2.056467, 1, 0, 0.4196078, 1,
1.405623, -1.349235, 1.434417, 1, 0, 0.4156863, 1,
1.417013, -0.7606339, 2.706917, 1, 0, 0.4078431, 1,
1.420295, -1.100456, 2.871318, 1, 0, 0.4039216, 1,
1.426713, 1.434003, 0.1642952, 1, 0, 0.3960784, 1,
1.431052, -0.6561338, 2.200237, 1, 0, 0.3882353, 1,
1.455691, 2.693586, 0.413012, 1, 0, 0.3843137, 1,
1.465138, -0.4749012, 2.37143, 1, 0, 0.3764706, 1,
1.470412, 0.6467746, 0.7326163, 1, 0, 0.372549, 1,
1.471759, -1.703469, 2.641478, 1, 0, 0.3647059, 1,
1.482389, 0.3874421, 0.609463, 1, 0, 0.3607843, 1,
1.492651, -0.1295456, 3.030948, 1, 0, 0.3529412, 1,
1.497221, 1.623547, 0.8773517, 1, 0, 0.3490196, 1,
1.501805, 0.04159267, 0.1414422, 1, 0, 0.3411765, 1,
1.502819, -1.428046, 3.820497, 1, 0, 0.3372549, 1,
1.50338, 1.148397, 2.448939, 1, 0, 0.3294118, 1,
1.511063, 0.6933702, 0.7748755, 1, 0, 0.3254902, 1,
1.512484, 0.6024489, 3.266547, 1, 0, 0.3176471, 1,
1.519286, -0.4926811, 3.079492, 1, 0, 0.3137255, 1,
1.529335, 0.6614667, 1.926205, 1, 0, 0.3058824, 1,
1.532282, 0.2784095, 2.096336, 1, 0, 0.2980392, 1,
1.539861, -1.343945, 2.750984, 1, 0, 0.2941177, 1,
1.545596, -0.7213141, 2.670627, 1, 0, 0.2862745, 1,
1.550717, -1.048645, 2.303379, 1, 0, 0.282353, 1,
1.55342, -0.1237367, 2.390485, 1, 0, 0.2745098, 1,
1.554388, -1.041306, 2.659707, 1, 0, 0.2705882, 1,
1.555452, -1.131654, 3.192965, 1, 0, 0.2627451, 1,
1.556597, -0.1599299, 2.245381, 1, 0, 0.2588235, 1,
1.564738, 0.2425271, 0.7763852, 1, 0, 0.2509804, 1,
1.570048, -0.1628037, 2.276936, 1, 0, 0.2470588, 1,
1.576972, -0.5004454, 0.5322648, 1, 0, 0.2392157, 1,
1.612505, -0.4857962, 2.075113, 1, 0, 0.2352941, 1,
1.616912, 0.5644494, -0.0705445, 1, 0, 0.227451, 1,
1.626722, -1.410119, 2.343286, 1, 0, 0.2235294, 1,
1.632437, -0.1790316, 2.346657, 1, 0, 0.2156863, 1,
1.634889, 1.176888, 1.392601, 1, 0, 0.2117647, 1,
1.635685, -0.08071335, 1.375954, 1, 0, 0.2039216, 1,
1.657241, 1.322007, 1.204597, 1, 0, 0.1960784, 1,
1.701486, -0.427101, 2.980912, 1, 0, 0.1921569, 1,
1.710647, 1.575071, -0.001903668, 1, 0, 0.1843137, 1,
1.712029, 1.833677, -0.01606074, 1, 0, 0.1803922, 1,
1.716942, 0.4840717, 1.24071, 1, 0, 0.172549, 1,
1.731848, -0.06290849, 2.594253, 1, 0, 0.1686275, 1,
1.767098, 0.6771782, 0.4489645, 1, 0, 0.1607843, 1,
1.772812, -1.996981, 2.133061, 1, 0, 0.1568628, 1,
1.804279, 0.9626245, 1.844537, 1, 0, 0.1490196, 1,
1.806483, -0.9504494, 2.728345, 1, 0, 0.145098, 1,
1.845152, 1.869675, -0.4425593, 1, 0, 0.1372549, 1,
1.859512, 1.6952, 1.210474, 1, 0, 0.1333333, 1,
1.860953, 0.947051, 1.556322, 1, 0, 0.1254902, 1,
1.862796, -0.2261586, 2.741151, 1, 0, 0.1215686, 1,
1.866074, -0.7367454, 2.827879, 1, 0, 0.1137255, 1,
1.871384, 0.9244349, 0.8178941, 1, 0, 0.1098039, 1,
1.926844, 2.22858, 0.4261844, 1, 0, 0.1019608, 1,
1.957711, 1.099463, 1.955465, 1, 0, 0.09411765, 1,
1.972232, -0.01639469, 2.357109, 1, 0, 0.09019608, 1,
1.994248, -0.7459274, 1.083865, 1, 0, 0.08235294, 1,
2.058069, 0.3045755, 2.21873, 1, 0, 0.07843138, 1,
2.060132, -0.7392472, 2.086625, 1, 0, 0.07058824, 1,
2.065912, -1.807439, 2.010095, 1, 0, 0.06666667, 1,
2.089242, -0.1802707, 2.838487, 1, 0, 0.05882353, 1,
2.144985, -0.01181755, 2.949932, 1, 0, 0.05490196, 1,
2.215075, 1.84533, -0.1783499, 1, 0, 0.04705882, 1,
2.415079, 0.5162812, 1.210329, 1, 0, 0.04313726, 1,
2.427185, -0.3712151, 1.291848, 1, 0, 0.03529412, 1,
2.616033, 0.3300369, -0.6180122, 1, 0, 0.03137255, 1,
2.725693, 1.456303, 1.424698, 1, 0, 0.02352941, 1,
2.73749, 0.9444693, -0.138786, 1, 0, 0.01960784, 1,
3.193017, 0.1974703, 1.071257, 1, 0, 0.01176471, 1,
3.258741, -0.4575762, 1.256219, 1, 0, 0.007843138, 1
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
0.04861557, -4.150678, -7.004938, 0, -0.5, 0.5, 0.5,
0.04861557, -4.150678, -7.004938, 1, -0.5, 0.5, 0.5,
0.04861557, -4.150678, -7.004938, 1, 1.5, 0.5, 0.5,
0.04861557, -4.150678, -7.004938, 0, 1.5, 0.5, 0.5
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
-4.249743, 0.07531118, -7.004938, 0, -0.5, 0.5, 0.5,
-4.249743, 0.07531118, -7.004938, 1, -0.5, 0.5, 0.5,
-4.249743, 0.07531118, -7.004938, 1, 1.5, 0.5, 0.5,
-4.249743, 0.07531118, -7.004938, 0, 1.5, 0.5, 0.5
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
-4.249743, -4.150678, 0.1537008, 0, -0.5, 0.5, 0.5,
-4.249743, -4.150678, 0.1537008, 1, -0.5, 0.5, 0.5,
-4.249743, -4.150678, 0.1537008, 1, 1.5, 0.5, 0.5,
-4.249743, -4.150678, 0.1537008, 0, 1.5, 0.5, 0.5
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
-3, -3.17545, -5.352944,
3, -3.17545, -5.352944,
-3, -3.17545, -5.352944,
-3, -3.337988, -5.628277,
-2, -3.17545, -5.352944,
-2, -3.337988, -5.628277,
-1, -3.17545, -5.352944,
-1, -3.337988, -5.628277,
0, -3.17545, -5.352944,
0, -3.337988, -5.628277,
1, -3.17545, -5.352944,
1, -3.337988, -5.628277,
2, -3.17545, -5.352944,
2, -3.337988, -5.628277,
3, -3.17545, -5.352944,
3, -3.337988, -5.628277
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
-3, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
-3, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
-3, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
-3, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
-2, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
-2, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
-2, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
-2, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
-1, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
-1, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
-1, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
-1, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
0, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
0, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
0, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
0, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
1, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
1, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
1, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
1, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
2, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
2, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
2, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
2, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5,
3, -3.663064, -6.178941, 0, -0.5, 0.5, 0.5,
3, -3.663064, -6.178941, 1, -0.5, 0.5, 0.5,
3, -3.663064, -6.178941, 1, 1.5, 0.5, 0.5,
3, -3.663064, -6.178941, 0, 1.5, 0.5, 0.5
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
-3.257814, -3, -5.352944,
-3.257814, 3, -5.352944,
-3.257814, -3, -5.352944,
-3.423136, -3, -5.628277,
-3.257814, -2, -5.352944,
-3.423136, -2, -5.628277,
-3.257814, -1, -5.352944,
-3.423136, -1, -5.628277,
-3.257814, 0, -5.352944,
-3.423136, 0, -5.628277,
-3.257814, 1, -5.352944,
-3.423136, 1, -5.628277,
-3.257814, 2, -5.352944,
-3.423136, 2, -5.628277,
-3.257814, 3, -5.352944,
-3.423136, 3, -5.628277
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
-3.753778, -3, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, -3, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, -3, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, -3, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, -2, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, -2, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, -2, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, -2, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, -1, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, -1, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, -1, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, -1, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, 0, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, 0, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, 0, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, 0, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, 1, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, 1, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, 1, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, 1, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, 2, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, 2, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, 2, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, 2, -6.178941, 0, 1.5, 0.5, 0.5,
-3.753778, 3, -6.178941, 0, -0.5, 0.5, 0.5,
-3.753778, 3, -6.178941, 1, -0.5, 0.5, 0.5,
-3.753778, 3, -6.178941, 1, 1.5, 0.5, 0.5,
-3.753778, 3, -6.178941, 0, 1.5, 0.5, 0.5
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
-3.257814, -3.17545, -4,
-3.257814, -3.17545, 4,
-3.257814, -3.17545, -4,
-3.423136, -3.337988, -4,
-3.257814, -3.17545, -2,
-3.423136, -3.337988, -2,
-3.257814, -3.17545, 0,
-3.423136, -3.337988, 0,
-3.257814, -3.17545, 2,
-3.423136, -3.337988, 2,
-3.257814, -3.17545, 4,
-3.423136, -3.337988, 4
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
-3.753778, -3.663064, -4, 0, -0.5, 0.5, 0.5,
-3.753778, -3.663064, -4, 1, -0.5, 0.5, 0.5,
-3.753778, -3.663064, -4, 1, 1.5, 0.5, 0.5,
-3.753778, -3.663064, -4, 0, 1.5, 0.5, 0.5,
-3.753778, -3.663064, -2, 0, -0.5, 0.5, 0.5,
-3.753778, -3.663064, -2, 1, -0.5, 0.5, 0.5,
-3.753778, -3.663064, -2, 1, 1.5, 0.5, 0.5,
-3.753778, -3.663064, -2, 0, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 0, 0, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 0, 1, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 0, 1, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 0, 0, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 2, 0, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 2, 1, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 2, 1, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 2, 0, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 4, 0, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 4, 1, -0.5, 0.5, 0.5,
-3.753778, -3.663064, 4, 1, 1.5, 0.5, 0.5,
-3.753778, -3.663064, 4, 0, 1.5, 0.5, 0.5
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
-3.257814, -3.17545, -5.352944,
-3.257814, 3.326072, -5.352944,
-3.257814, -3.17545, 5.660346,
-3.257814, 3.326072, 5.660346,
-3.257814, -3.17545, -5.352944,
-3.257814, -3.17545, 5.660346,
-3.257814, 3.326072, -5.352944,
-3.257814, 3.326072, 5.660346,
-3.257814, -3.17545, -5.352944,
3.355045, -3.17545, -5.352944,
-3.257814, -3.17545, 5.660346,
3.355045, -3.17545, 5.660346,
-3.257814, 3.326072, -5.352944,
3.355045, 3.326072, -5.352944,
-3.257814, 3.326072, 5.660346,
3.355045, 3.326072, 5.660346,
3.355045, -3.17545, -5.352944,
3.355045, 3.326072, -5.352944,
3.355045, -3.17545, 5.660346,
3.355045, 3.326072, 5.660346,
3.355045, -3.17545, -5.352944,
3.355045, -3.17545, 5.660346,
3.355045, 3.326072, -5.352944,
3.355045, 3.326072, 5.660346
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
var radius = 7.688065;
var distance = 34.20507;
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
mvMatrix.translate( -0.04861557, -0.07531118, -0.1537008 );
mvMatrix.scale( 1.257018, 1.278545, 0.7547686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.20507);
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
cloprop<-read.table("cloprop.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cloprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
```

```r
y<-cloprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
```

```r
z<-cloprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'cloprop' not found
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
-3.16151, 0.1703228, -1.698214, 0, 0, 1, 1, 1,
-2.879225, -0.2558806, -2.334544, 1, 0, 0, 1, 1,
-2.739113, 0.07196766, -1.879668, 1, 0, 0, 1, 1,
-2.668375, 0.2679183, -0.5032189, 1, 0, 0, 1, 1,
-2.603275, -1.313169, -0.6613517, 1, 0, 0, 1, 1,
-2.431928, -0.7785696, -3.350317, 1, 0, 0, 1, 1,
-2.362454, -0.7171385, -3.661323, 0, 0, 0, 1, 1,
-2.350869, -1.316113, -3.099476, 0, 0, 0, 1, 1,
-2.350844, -0.1175255, -0.1804715, 0, 0, 0, 1, 1,
-2.235021, -0.2679132, -1.306404, 0, 0, 0, 1, 1,
-2.167625, 0.249491, -0.5008924, 0, 0, 0, 1, 1,
-2.136848, 0.132885, -1.140402, 0, 0, 0, 1, 1,
-2.107046, -0.5098236, -0.3327444, 0, 0, 0, 1, 1,
-2.10304, -0.7980756, -3.193129, 1, 1, 1, 1, 1,
-2.088626, 0.175949, -0.3966511, 1, 1, 1, 1, 1,
-2.080156, 0.2778715, -2.103749, 1, 1, 1, 1, 1,
-2.078245, 0.2378646, -0.9211305, 1, 1, 1, 1, 1,
-2.061245, -1.350426, -0.4023764, 1, 1, 1, 1, 1,
-2.036543, 0.03373659, -0.791549, 1, 1, 1, 1, 1,
-2.023206, -0.5712857, -4.947333, 1, 1, 1, 1, 1,
-2.017588, 0.6551795, -0.8275015, 1, 1, 1, 1, 1,
-1.998337, 0.05288041, -3.014969, 1, 1, 1, 1, 1,
-1.967414, 0.7677172, 0.3891839, 1, 1, 1, 1, 1,
-1.953054, 0.5360045, -1.375363, 1, 1, 1, 1, 1,
-1.951322, 0.03068143, -2.114427, 1, 1, 1, 1, 1,
-1.946563, 0.4894635, -1.65905, 1, 1, 1, 1, 1,
-1.924032, -0.1637305, -0.380477, 1, 1, 1, 1, 1,
-1.914682, -0.9600818, -3.371451, 1, 1, 1, 1, 1,
-1.911108, 1.594558, -1.052632, 0, 0, 1, 1, 1,
-1.910999, -0.9853981, -2.117501, 1, 0, 0, 1, 1,
-1.870312, 0.5712456, -1.093747, 1, 0, 0, 1, 1,
-1.843583, 0.8072554, -3.992502, 1, 0, 0, 1, 1,
-1.813959, 0.1512511, -0.9170638, 1, 0, 0, 1, 1,
-1.811796, 0.7533691, -1.393226, 1, 0, 0, 1, 1,
-1.803148, -0.3093751, -0.9305881, 0, 0, 0, 1, 1,
-1.783314, -0.57963, -2.450255, 0, 0, 0, 1, 1,
-1.781469, 0.9870984, -0.006435096, 0, 0, 0, 1, 1,
-1.766896, -0.4707479, -1.417845, 0, 0, 0, 1, 1,
-1.718674, -2.170754, -2.38603, 0, 0, 0, 1, 1,
-1.710732, 0.389798, -3.445386, 0, 0, 0, 1, 1,
-1.703789, -1.350989, -3.508331, 0, 0, 0, 1, 1,
-1.690375, -0.5280505, -1.39044, 1, 1, 1, 1, 1,
-1.682898, -0.3065532, -1.490857, 1, 1, 1, 1, 1,
-1.680432, -0.5468882, -1.035245, 1, 1, 1, 1, 1,
-1.661532, -0.6933386, -1.272812, 1, 1, 1, 1, 1,
-1.655912, -2.240488, -1.370155, 1, 1, 1, 1, 1,
-1.652565, -1.789308, -2.719401, 1, 1, 1, 1, 1,
-1.652169, 0.01072724, -1.527277, 1, 1, 1, 1, 1,
-1.648873, -1.950443, -2.917267, 1, 1, 1, 1, 1,
-1.640157, -0.04046677, -0.5871484, 1, 1, 1, 1, 1,
-1.626207, 0.5048791, -0.5464577, 1, 1, 1, 1, 1,
-1.625889, -0.4074368, -3.049912, 1, 1, 1, 1, 1,
-1.614798, -1.109968, -1.853262, 1, 1, 1, 1, 1,
-1.591332, 2.059034, 0.3062153, 1, 1, 1, 1, 1,
-1.590704, -0.8408087, -3.115229, 1, 1, 1, 1, 1,
-1.578561, -0.3730466, -3.353179, 1, 1, 1, 1, 1,
-1.571465, 2.569345, 0.7417123, 0, 0, 1, 1, 1,
-1.560211, 1.131504, -1.662463, 1, 0, 0, 1, 1,
-1.55498, -1.601615, -3.983613, 1, 0, 0, 1, 1,
-1.550804, -0.09839584, -2.354581, 1, 0, 0, 1, 1,
-1.535862, -1.198071, -2.778174, 1, 0, 0, 1, 1,
-1.534081, 0.3432685, 0.863905, 1, 0, 0, 1, 1,
-1.530297, 1.197189, -0.451111, 0, 0, 0, 1, 1,
-1.523215, -0.7952993, -2.945148, 0, 0, 0, 1, 1,
-1.50433, -2.077944, -3.489286, 0, 0, 0, 1, 1,
-1.479428, -0.08293044, -2.611912, 0, 0, 0, 1, 1,
-1.470248, -0.3774482, -1.026741, 0, 0, 0, 1, 1,
-1.463954, 0.2517678, -1.307121, 0, 0, 0, 1, 1,
-1.447753, -0.1320951, -1.428038, 0, 0, 0, 1, 1,
-1.436769, -1.112228, -2.837162, 1, 1, 1, 1, 1,
-1.435228, -0.4301527, -2.115434, 1, 1, 1, 1, 1,
-1.434546, -1.025921, -3.397979, 1, 1, 1, 1, 1,
-1.408848, 1.2069, -1.508392, 1, 1, 1, 1, 1,
-1.401301, 1.281888, -1.311987, 1, 1, 1, 1, 1,
-1.39471, 1.89729, 0.02309321, 1, 1, 1, 1, 1,
-1.394465, -0.738668, -3.169692, 1, 1, 1, 1, 1,
-1.364041, -1.192203, -1.879627, 1, 1, 1, 1, 1,
-1.363581, -0.9154419, -1.573833, 1, 1, 1, 1, 1,
-1.358345, 0.4710276, -0.8055968, 1, 1, 1, 1, 1,
-1.355857, 0.673417, -0.5519016, 1, 1, 1, 1, 1,
-1.343044, 0.007168598, -0.9923968, 1, 1, 1, 1, 1,
-1.331518, -0.7887419, -0.7823574, 1, 1, 1, 1, 1,
-1.331103, -0.9197125, -1.515276, 1, 1, 1, 1, 1,
-1.328928, -2.096742, -3.05598, 1, 1, 1, 1, 1,
-1.328191, 0.4527053, -1.619767, 0, 0, 1, 1, 1,
-1.318646, -2.105377, -3.30624, 1, 0, 0, 1, 1,
-1.31733, -0.3565916, -0.8837247, 1, 0, 0, 1, 1,
-1.302126, -0.277205, -1.882419, 1, 0, 0, 1, 1,
-1.285108, 1.172556, 0.04806268, 1, 0, 0, 1, 1,
-1.28493, 1.6201, -0.2153815, 1, 0, 0, 1, 1,
-1.280411, 1.549897, -2.062714, 0, 0, 0, 1, 1,
-1.280191, 1.239262, 0.3748708, 0, 0, 0, 1, 1,
-1.275663, -1.264913, -0.3039112, 0, 0, 0, 1, 1,
-1.270782, -0.4469357, -3.105423, 0, 0, 0, 1, 1,
-1.262442, 1.860799, 0.2692003, 0, 0, 0, 1, 1,
-1.260819, -0.500264, -0.5494099, 0, 0, 0, 1, 1,
-1.257179, -0.8676025, -2.855917, 0, 0, 0, 1, 1,
-1.249462, -0.7341645, -4.535455, 1, 1, 1, 1, 1,
-1.24027, -0.1499322, 1.621095, 1, 1, 1, 1, 1,
-1.239286, 1.853817, -1.950604, 1, 1, 1, 1, 1,
-1.213936, 1.979244, -0.4774379, 1, 1, 1, 1, 1,
-1.213624, -1.61594, -3.039718, 1, 1, 1, 1, 1,
-1.212409, 0.4675599, -2.108487, 1, 1, 1, 1, 1,
-1.209395, 0.6268595, -2.121194, 1, 1, 1, 1, 1,
-1.206455, 0.1993841, -3.010065, 1, 1, 1, 1, 1,
-1.197897, -0.3734994, -2.369101, 1, 1, 1, 1, 1,
-1.192361, -0.7263535, -2.252227, 1, 1, 1, 1, 1,
-1.187963, -0.6039552, -1.262074, 1, 1, 1, 1, 1,
-1.185876, 0.9193235, -3.274542, 1, 1, 1, 1, 1,
-1.185631, -1.116219, -2.359945, 1, 1, 1, 1, 1,
-1.163547, 0.2672682, -2.192573, 1, 1, 1, 1, 1,
-1.143472, -0.1025989, 0.2254432, 1, 1, 1, 1, 1,
-1.13899, -0.7935609, -0.5152501, 0, 0, 1, 1, 1,
-1.129047, -1.213064, -2.788949, 1, 0, 0, 1, 1,
-1.127043, 0.7693232, -1.0295, 1, 0, 0, 1, 1,
-1.126687, -1.474512, -2.810384, 1, 0, 0, 1, 1,
-1.116438, -0.3580374, -1.02166, 1, 0, 0, 1, 1,
-1.108634, 0.6565906, 0.9034606, 1, 0, 0, 1, 1,
-1.105828, 0.4428205, -2.404276, 0, 0, 0, 1, 1,
-1.104171, 0.8629556, -0.4694667, 0, 0, 0, 1, 1,
-1.102886, -0.1052542, -2.653902, 0, 0, 0, 1, 1,
-1.101933, -0.2562243, -0.3226448, 0, 0, 0, 1, 1,
-1.096823, -0.4806866, -1.311172, 0, 0, 0, 1, 1,
-1.096515, 1.299926, -0.166997, 0, 0, 0, 1, 1,
-1.092607, -0.8349062, -1.628863, 0, 0, 0, 1, 1,
-1.084364, -1.24005, -2.935417, 1, 1, 1, 1, 1,
-1.081881, -0.7091052, -2.540638, 1, 1, 1, 1, 1,
-1.068271, 1.186601, -2.022416, 1, 1, 1, 1, 1,
-1.062955, 2.408978, -1.410007, 1, 1, 1, 1, 1,
-1.060216, 0.2269949, -0.05462475, 1, 1, 1, 1, 1,
-1.049698, -1.109475, -2.910938, 1, 1, 1, 1, 1,
-1.047328, -0.9629332, -3.399555, 1, 1, 1, 1, 1,
-1.046481, 1.212944, -0.413985, 1, 1, 1, 1, 1,
-1.046352, -1.866328, -3.874812, 1, 1, 1, 1, 1,
-1.044672, -0.6370896, -0.2285687, 1, 1, 1, 1, 1,
-1.04163, -1.345899, -2.565918, 1, 1, 1, 1, 1,
-1.041574, 0.6365271, -1.697982, 1, 1, 1, 1, 1,
-1.040486, -0.6551486, -1.46849, 1, 1, 1, 1, 1,
-1.036696, 0.1061474, 0.557352, 1, 1, 1, 1, 1,
-1.030903, -1.606789, -0.7648566, 1, 1, 1, 1, 1,
-1.029254, 1.128037, -2.034558, 0, 0, 1, 1, 1,
-1.025854, -0.6017576, -3.091007, 1, 0, 0, 1, 1,
-1.023408, 2.090171, -1.669246, 1, 0, 0, 1, 1,
-1.012007, -0.4202735, -2.189129, 1, 0, 0, 1, 1,
-1.011613, 1.085595, -2.153137, 1, 0, 0, 1, 1,
-1.010273, 0.4262788, -2.265985, 1, 0, 0, 1, 1,
-1.009947, 0.2725745, -0.7992461, 0, 0, 0, 1, 1,
-1.004062, 0.1941694, -2.281433, 0, 0, 0, 1, 1,
-1.002501, -0.913373, -2.336123, 0, 0, 0, 1, 1,
-1.000771, -0.1547544, -0.4694895, 0, 0, 0, 1, 1,
-0.999595, 0.01178855, -0.7433798, 0, 0, 0, 1, 1,
-0.9992569, 0.004330311, -0.1175372, 0, 0, 0, 1, 1,
-0.9981001, 0.2413355, -2.059723, 0, 0, 0, 1, 1,
-0.9969971, -0.4277256, -2.168652, 1, 1, 1, 1, 1,
-0.9969039, 0.7042116, -1.541578, 1, 1, 1, 1, 1,
-0.996627, 0.2492117, -0.02017808, 1, 1, 1, 1, 1,
-0.9907948, -0.4420738, -0.9177836, 1, 1, 1, 1, 1,
-0.9853062, 0.1356501, -0.8871261, 1, 1, 1, 1, 1,
-0.9764298, -0.9381618, -4.192987, 1, 1, 1, 1, 1,
-0.971458, 0.4328697, -0.9435301, 1, 1, 1, 1, 1,
-0.9711918, 1.062925, -1.627463, 1, 1, 1, 1, 1,
-0.9707857, -0.8879098, -3.408745, 1, 1, 1, 1, 1,
-0.9696318, 1.36024, -0.9670028, 1, 1, 1, 1, 1,
-0.9657708, -0.910428, -3.530026, 1, 1, 1, 1, 1,
-0.964503, -0.1578891, -3.463715, 1, 1, 1, 1, 1,
-0.96319, -1.051644, -1.05542, 1, 1, 1, 1, 1,
-0.9600086, -0.8928678, -1.921264, 1, 1, 1, 1, 1,
-0.9549243, -0.8969147, -2.830103, 1, 1, 1, 1, 1,
-0.9498996, -0.3071446, -1.170877, 0, 0, 1, 1, 1,
-0.9493245, 0.751299, -1.437682, 1, 0, 0, 1, 1,
-0.9441814, 1.74581, -0.564065, 1, 0, 0, 1, 1,
-0.9393001, 1.572731, 1.896972, 1, 0, 0, 1, 1,
-0.9292128, 0.1196971, -2.404777, 1, 0, 0, 1, 1,
-0.9279469, -1.646806, -1.934402, 1, 0, 0, 1, 1,
-0.9256677, 0.6227905, -1.882571, 0, 0, 0, 1, 1,
-0.9202732, 0.02118662, -1.314322, 0, 0, 0, 1, 1,
-0.9172966, -1.149021, -4.499594, 0, 0, 0, 1, 1,
-0.9088082, 0.4689846, -1.743274, 0, 0, 0, 1, 1,
-0.9023964, 0.02855442, -0.5930728, 0, 0, 0, 1, 1,
-0.9012494, 0.005678752, -2.842998, 0, 0, 0, 1, 1,
-0.8889882, -0.2467725, -2.482895, 0, 0, 0, 1, 1,
-0.8875361, -0.2320733, -1.202814, 1, 1, 1, 1, 1,
-0.8860405, 0.1000328, -1.416822, 1, 1, 1, 1, 1,
-0.8851511, -0.9365087, -2.18768, 1, 1, 1, 1, 1,
-0.8836433, 0.05185648, -1.975219, 1, 1, 1, 1, 1,
-0.8810156, 1.274751, 0.6570832, 1, 1, 1, 1, 1,
-0.8795832, -0.4797343, -2.511843, 1, 1, 1, 1, 1,
-0.8756313, 0.2154007, -2.231315, 1, 1, 1, 1, 1,
-0.8717512, 0.5939777, -0.3963594, 1, 1, 1, 1, 1,
-0.8690327, 0.3059815, -0.9074937, 1, 1, 1, 1, 1,
-0.8667425, 1.766973, -1.166948, 1, 1, 1, 1, 1,
-0.8658962, 1.143388, -1.911224, 1, 1, 1, 1, 1,
-0.8652743, 0.5169638, -2.01428, 1, 1, 1, 1, 1,
-0.8610843, -1.376353, -2.721568, 1, 1, 1, 1, 1,
-0.8543511, -0.4040039, -1.732081, 1, 1, 1, 1, 1,
-0.8522773, -1.378365, -2.894903, 1, 1, 1, 1, 1,
-0.84933, -0.9683603, -2.811954, 0, 0, 1, 1, 1,
-0.8458879, 0.2511612, -0.3373975, 1, 0, 0, 1, 1,
-0.8429558, -0.2571647, -2.780992, 1, 0, 0, 1, 1,
-0.8413906, -1.650947, -2.304645, 1, 0, 0, 1, 1,
-0.8314351, 1.078132, -1.745905, 1, 0, 0, 1, 1,
-0.8284874, -0.05169953, -2.944425, 1, 0, 0, 1, 1,
-0.8173553, 1.735479, -0.7360027, 0, 0, 0, 1, 1,
-0.8113736, -0.6705578, -3.876356, 0, 0, 0, 1, 1,
-0.8110067, 0.1115417, -0.9890984, 0, 0, 0, 1, 1,
-0.8051076, 1.301657, 0.08791047, 0, 0, 0, 1, 1,
-0.8043696, 2.181672, -0.4616455, 0, 0, 0, 1, 1,
-0.8015693, -0.2985752, -1.519255, 0, 0, 0, 1, 1,
-0.8003222, -0.506812, -1.632443, 0, 0, 0, 1, 1,
-0.7994349, 0.306515, -1.9389, 1, 1, 1, 1, 1,
-0.7990663, -0.350294, -1.46826, 1, 1, 1, 1, 1,
-0.7988839, -0.5065264, -4.391896, 1, 1, 1, 1, 1,
-0.7950531, 2.333812, -0.3333252, 1, 1, 1, 1, 1,
-0.7925861, -1.807263, -3.196712, 1, 1, 1, 1, 1,
-0.7900996, -0.2986199, -1.914444, 1, 1, 1, 1, 1,
-0.7867942, 0.879143, -2.314006, 1, 1, 1, 1, 1,
-0.7845432, 0.1759822, -1.462047, 1, 1, 1, 1, 1,
-0.7843592, -0.4491159, -2.208088, 1, 1, 1, 1, 1,
-0.779902, -0.2418528, -2.005859, 1, 1, 1, 1, 1,
-0.7788347, 0.0646819, -1.398636, 1, 1, 1, 1, 1,
-0.769722, 1.834692, -1.210916, 1, 1, 1, 1, 1,
-0.7693499, -0.2572767, -2.157241, 1, 1, 1, 1, 1,
-0.7693439, -0.1731733, -4.094126, 1, 1, 1, 1, 1,
-0.7684067, 0.05768536, -2.255053, 1, 1, 1, 1, 1,
-0.7614517, 0.2670523, 0.9990076, 0, 0, 1, 1, 1,
-0.7587283, 0.4673204, -1.244635, 1, 0, 0, 1, 1,
-0.7561629, -0.2726362, -0.8396647, 1, 0, 0, 1, 1,
-0.755273, -0.2145113, -1.495818, 1, 0, 0, 1, 1,
-0.7487523, 1.251787, -0.3571193, 1, 0, 0, 1, 1,
-0.7469192, 1.450318, -0.7663808, 1, 0, 0, 1, 1,
-0.7445111, -2.016703, -1.846557, 0, 0, 0, 1, 1,
-0.7422196, 0.8033107, -1.741401, 0, 0, 0, 1, 1,
-0.7405965, 0.3109683, -0.9542885, 0, 0, 0, 1, 1,
-0.735034, 0.8863755, 0.003620823, 0, 0, 0, 1, 1,
-0.7328511, 1.800997, -0.4350275, 0, 0, 0, 1, 1,
-0.7321953, 0.2760242, -1.572196, 0, 0, 0, 1, 1,
-0.731156, 0.3958379, -1.937002, 0, 0, 0, 1, 1,
-0.7302507, -1.188722, -2.378094, 1, 1, 1, 1, 1,
-0.7297754, -2.64861, -3.279653, 1, 1, 1, 1, 1,
-0.725342, -1.272298, -3.990559, 1, 1, 1, 1, 1,
-0.7248442, -0.1633813, -1.677805, 1, 1, 1, 1, 1,
-0.7170872, -0.2228394, -0.2709269, 1, 1, 1, 1, 1,
-0.7128968, 0.4022878, -0.4609172, 1, 1, 1, 1, 1,
-0.7125908, -1.119645, -2.131306, 1, 1, 1, 1, 1,
-0.7083402, 0.7008077, -1.794561, 1, 1, 1, 1, 1,
-0.7060931, 0.8010187, -2.126719, 1, 1, 1, 1, 1,
-0.7044846, -0.4277134, -1.8525, 1, 1, 1, 1, 1,
-0.7019497, -1.685149, -2.916481, 1, 1, 1, 1, 1,
-0.6924815, -0.452573, -2.833101, 1, 1, 1, 1, 1,
-0.6912029, -0.03860262, -1.186173, 1, 1, 1, 1, 1,
-0.6902958, -0.2961779, -2.544403, 1, 1, 1, 1, 1,
-0.6823847, 0.614763, -2.092414, 1, 1, 1, 1, 1,
-0.6786107, 0.7815346, -0.07537241, 0, 0, 1, 1, 1,
-0.6784481, 1.706959, -0.7377743, 1, 0, 0, 1, 1,
-0.6775376, 2.016223, 0.5844734, 1, 0, 0, 1, 1,
-0.6764805, -0.7559178, -3.726808, 1, 0, 0, 1, 1,
-0.6738602, 0.2221062, -1.549579, 1, 0, 0, 1, 1,
-0.6728186, -0.8586795, -3.288294, 1, 0, 0, 1, 1,
-0.6716954, -0.800074, -2.904931, 0, 0, 0, 1, 1,
-0.6688893, 1.4464, 0.05939924, 0, 0, 0, 1, 1,
-0.6603764, 0.7862242, 0.3306977, 0, 0, 0, 1, 1,
-0.657847, 0.8109602, -1.223695, 0, 0, 0, 1, 1,
-0.6572852, 3.23139, 0.723377, 0, 0, 0, 1, 1,
-0.6529832, -0.09708636, -2.491292, 0, 0, 0, 1, 1,
-0.6500342, -0.0007805985, -1.139583, 0, 0, 0, 1, 1,
-0.6484683, 0.9677936, -2.76984, 1, 1, 1, 1, 1,
-0.6481521, 0.2301359, -1.678005, 1, 1, 1, 1, 1,
-0.6452432, -0.2102128, -0.8383157, 1, 1, 1, 1, 1,
-0.6418006, 0.2503431, -0.5599732, 1, 1, 1, 1, 1,
-0.6400487, -2.522646, -3.314723, 1, 1, 1, 1, 1,
-0.6381067, -0.06779094, -0.7883184, 1, 1, 1, 1, 1,
-0.6283571, -0.1048928, -1.538247, 1, 1, 1, 1, 1,
-0.6255936, -0.2882797, -2.442548, 1, 1, 1, 1, 1,
-0.6219876, -0.1141459, -1.287635, 1, 1, 1, 1, 1,
-0.6155541, 2.15785, -0.4619128, 1, 1, 1, 1, 1,
-0.6150005, -0.6043036, -3.29962, 1, 1, 1, 1, 1,
-0.611816, -0.2536054, -2.910333, 1, 1, 1, 1, 1,
-0.6058272, 0.4944591, -1.121747, 1, 1, 1, 1, 1,
-0.6044523, 0.4807953, 0.4306221, 1, 1, 1, 1, 1,
-0.6001933, 1.257435, -0.1551709, 1, 1, 1, 1, 1,
-0.599609, 2.83833, -0.08103218, 0, 0, 1, 1, 1,
-0.5964431, 0.01036901, -3.844211, 1, 0, 0, 1, 1,
-0.59398, -0.08599748, -1.603294, 1, 0, 0, 1, 1,
-0.5933779, -0.9479254, -1.099986, 1, 0, 0, 1, 1,
-0.5931105, -0.2114047, -1.495032, 1, 0, 0, 1, 1,
-0.5923317, 0.0779474, -1.940709, 1, 0, 0, 1, 1,
-0.5904641, 0.9638853, 0.1698343, 0, 0, 0, 1, 1,
-0.5899647, -1.293083, -3.216009, 0, 0, 0, 1, 1,
-0.5898572, 0.3814503, -0.5760379, 0, 0, 0, 1, 1,
-0.588998, -0.8006424, -1.151832, 0, 0, 0, 1, 1,
-0.588963, 2.050873, 0.8977455, 0, 0, 0, 1, 1,
-0.5870593, -1.672454, -4.122676, 0, 0, 0, 1, 1,
-0.5866033, 0.388951, 0.7593386, 0, 0, 0, 1, 1,
-0.5854627, -1.251285, -2.599482, 1, 1, 1, 1, 1,
-0.5836806, 0.6866485, -1.875839, 1, 1, 1, 1, 1,
-0.579909, 0.3518381, -0.1277248, 1, 1, 1, 1, 1,
-0.5786673, 0.3876641, -0.8478463, 1, 1, 1, 1, 1,
-0.5743256, -0.9711331, -1.398194, 1, 1, 1, 1, 1,
-0.5705212, -0.3165326, -1.063037, 1, 1, 1, 1, 1,
-0.5700366, -0.5919761, -0.5804334, 1, 1, 1, 1, 1,
-0.5694386, -3.036495, -2.879484, 1, 1, 1, 1, 1,
-0.5694022, -2.131756, -0.9964046, 1, 1, 1, 1, 1,
-0.566846, -0.4127907, -2.731149, 1, 1, 1, 1, 1,
-0.5662234, 1.819698, -1.936768, 1, 1, 1, 1, 1,
-0.5652726, -0.5882594, 0.2220629, 1, 1, 1, 1, 1,
-0.563979, -0.3375479, -1.393264, 1, 1, 1, 1, 1,
-0.5635273, 0.9139651, -1.542886, 1, 1, 1, 1, 1,
-0.5622342, 0.9641964, -0.5633007, 1, 1, 1, 1, 1,
-0.560725, -1.112423, -3.148373, 0, 0, 1, 1, 1,
-0.5572299, -0.4188521, -2.688466, 1, 0, 0, 1, 1,
-0.5549195, -0.5549961, -2.096388, 1, 0, 0, 1, 1,
-0.5547742, -0.2239527, -3.524461, 1, 0, 0, 1, 1,
-0.5454232, 1.742676, -0.5231844, 1, 0, 0, 1, 1,
-0.5445717, 0.7659835, -1.929163, 1, 0, 0, 1, 1,
-0.5422996, -1.612584, -3.874627, 0, 0, 0, 1, 1,
-0.5387609, -0.2457025, -3.087753, 0, 0, 0, 1, 1,
-0.529557, -0.8288053, -3.140109, 0, 0, 0, 1, 1,
-0.5169502, 0.729057, 0.1112491, 0, 0, 0, 1, 1,
-0.516718, 0.7928008, -0.7318503, 0, 0, 0, 1, 1,
-0.514689, 1.088737, -0.3629881, 0, 0, 0, 1, 1,
-0.5144969, 0.7805849, -1.263993, 0, 0, 0, 1, 1,
-0.5142547, 1.002132, -1.61658, 1, 1, 1, 1, 1,
-0.5126781, 0.06996397, -1.295332, 1, 1, 1, 1, 1,
-0.5109997, -1.433465, -3.561893, 1, 1, 1, 1, 1,
-0.5104415, 2.457335, -0.4467263, 1, 1, 1, 1, 1,
-0.509512, -1.720776, -3.004483, 1, 1, 1, 1, 1,
-0.5061426, 0.02200614, -0.3729958, 1, 1, 1, 1, 1,
-0.5053906, 0.2922404, -0.5143667, 1, 1, 1, 1, 1,
-0.5020239, 1.607205, 1.211572, 1, 1, 1, 1, 1,
-0.4982101, 0.3529603, -1.898063, 1, 1, 1, 1, 1,
-0.4981032, 1.407371, -1.718009, 1, 1, 1, 1, 1,
-0.4942487, 0.625923, -0.5642943, 1, 1, 1, 1, 1,
-0.491328, 2.120809, -1.372009, 1, 1, 1, 1, 1,
-0.4902188, 0.511842, -0.9862623, 1, 1, 1, 1, 1,
-0.4867115, 1.210606, 0.7998158, 1, 1, 1, 1, 1,
-0.4817717, 1.288817, 0.6007023, 1, 1, 1, 1, 1,
-0.4804341, -1.203704, -1.16156, 0, 0, 1, 1, 1,
-0.4800828, -0.3139219, 0.2840246, 1, 0, 0, 1, 1,
-0.479933, 0.9983898, -2.646332, 1, 0, 0, 1, 1,
-0.4786316, 0.4287935, -1.395569, 1, 0, 0, 1, 1,
-0.4757705, 0.8862049, -0.2812984, 1, 0, 0, 1, 1,
-0.4749502, -0.7988651, -0.6610081, 1, 0, 0, 1, 1,
-0.4721887, -1.25822, -4.023646, 0, 0, 0, 1, 1,
-0.4645771, -0.5505511, -4.574009, 0, 0, 0, 1, 1,
-0.4639738, -0.04808974, -2.385188, 0, 0, 0, 1, 1,
-0.4619842, -0.3855249, -2.732501, 0, 0, 0, 1, 1,
-0.4607399, -0.04564317, -0.06326543, 0, 0, 0, 1, 1,
-0.4586247, -0.8381712, -3.468159, 0, 0, 0, 1, 1,
-0.4417001, -0.6579791, -2.895776, 0, 0, 0, 1, 1,
-0.4404284, -0.7014467, -1.955643, 1, 1, 1, 1, 1,
-0.4383247, 1.629101, -0.5374013, 1, 1, 1, 1, 1,
-0.4379542, -0.1710012, -3.653751, 1, 1, 1, 1, 1,
-0.4371389, -1.005762, -3.437335, 1, 1, 1, 1, 1,
-0.4358581, -0.009377208, -2.368788, 1, 1, 1, 1, 1,
-0.4285277, 0.2515097, -2.293154, 1, 1, 1, 1, 1,
-0.4244393, -0.4187528, -1.821917, 1, 1, 1, 1, 1,
-0.4237067, 1.122252, -0.6721234, 1, 1, 1, 1, 1,
-0.421259, 0.3535765, -2.037961, 1, 1, 1, 1, 1,
-0.420946, 2.43487, -1.393472, 1, 1, 1, 1, 1,
-0.4203498, -0.6235807, -4.920323, 1, 1, 1, 1, 1,
-0.4188116, 0.8393454, -1.623711, 1, 1, 1, 1, 1,
-0.4177094, -2.019511, -4.007297, 1, 1, 1, 1, 1,
-0.4166509, 1.047314, 1.155906, 1, 1, 1, 1, 1,
-0.4148893, -1.403934, -1.601956, 1, 1, 1, 1, 1,
-0.4140888, -0.7063956, -3.058636, 0, 0, 1, 1, 1,
-0.4096708, -0.2137981, -1.559807, 1, 0, 0, 1, 1,
-0.4041159, -1.816836, -1.988121, 1, 0, 0, 1, 1,
-0.4005092, 1.82693, 0.3569706, 1, 0, 0, 1, 1,
-0.3997808, -1.42644, -2.643255, 1, 0, 0, 1, 1,
-0.3980601, 0.4130122, -2.280842, 1, 0, 0, 1, 1,
-0.395904, 1.33872, 0.5105036, 0, 0, 0, 1, 1,
-0.3894001, 1.014159, -0.5167179, 0, 0, 0, 1, 1,
-0.3890529, 0.01725076, -1.028568, 0, 0, 0, 1, 1,
-0.3886185, 0.04577161, -0.2088259, 0, 0, 0, 1, 1,
-0.3881806, 0.1216658, -1.723194, 0, 0, 0, 1, 1,
-0.3834169, 1.409811, -1.237499, 0, 0, 0, 1, 1,
-0.3810183, -1.531779, -2.78399, 0, 0, 0, 1, 1,
-0.3808917, 1.932473, 0.9206616, 1, 1, 1, 1, 1,
-0.3722683, -0.9555632, -0.2314998, 1, 1, 1, 1, 1,
-0.363108, 1.112782, -0.5612217, 1, 1, 1, 1, 1,
-0.3529765, -0.02918621, -2.974301, 1, 1, 1, 1, 1,
-0.3496144, 0.0366793, -1.456439, 1, 1, 1, 1, 1,
-0.3495506, -1.931638, -3.253138, 1, 1, 1, 1, 1,
-0.349263, -0.8770436, -3.03864, 1, 1, 1, 1, 1,
-0.3466194, -2.311015, -4.142555, 1, 1, 1, 1, 1,
-0.3449832, 1.645096, -1.312917, 1, 1, 1, 1, 1,
-0.3448966, -0.3321261, -2.993965, 1, 1, 1, 1, 1,
-0.3410371, -1.483017, -3.62254, 1, 1, 1, 1, 1,
-0.3344112, -0.9267477, -3.809749, 1, 1, 1, 1, 1,
-0.3330059, 1.07444, -0.818057, 1, 1, 1, 1, 1,
-0.3305824, 0.3812895, 0.3037593, 1, 1, 1, 1, 1,
-0.3300308, -0.3441545, -3.984627, 1, 1, 1, 1, 1,
-0.3294038, 1.141688, -1.154328, 0, 0, 1, 1, 1,
-0.3221409, -0.1420801, -2.355814, 1, 0, 0, 1, 1,
-0.3211913, 1.264759, -0.05159327, 1, 0, 0, 1, 1,
-0.3133902, 0.2062884, -2.301267, 1, 0, 0, 1, 1,
-0.3080741, -1.513494, -0.8317211, 1, 0, 0, 1, 1,
-0.3064848, -0.5819969, -4.386816, 1, 0, 0, 1, 1,
-0.3054794, 1.914252, -0.6227034, 0, 0, 0, 1, 1,
-0.3031142, 0.8680746, -1.281522, 0, 0, 0, 1, 1,
-0.3012225, 0.5138122, 1.531089, 0, 0, 0, 1, 1,
-0.2988011, -1.517067, -3.728039, 0, 0, 0, 1, 1,
-0.2972226, -0.2908143, -2.244858, 0, 0, 0, 1, 1,
-0.2887588, -0.9953627, -3.262539, 0, 0, 0, 1, 1,
-0.2841904, -0.9291424, -2.129457, 0, 0, 0, 1, 1,
-0.2772153, -1.12817, -2.775717, 1, 1, 1, 1, 1,
-0.2748102, 0.9691118, 0.02524479, 1, 1, 1, 1, 1,
-0.269895, 0.5171614, -2.596541, 1, 1, 1, 1, 1,
-0.2687564, -0.1924588, -3.664636, 1, 1, 1, 1, 1,
-0.2681959, 0.7061086, -0.8735236, 1, 1, 1, 1, 1,
-0.2571683, 0.06306194, -1.879601, 1, 1, 1, 1, 1,
-0.2552869, -0.1063735, -2.192322, 1, 1, 1, 1, 1,
-0.2538131, 0.4356828, -2.501812, 1, 1, 1, 1, 1,
-0.2535749, 1.155651, 0.702802, 1, 1, 1, 1, 1,
-0.2527009, 0.3645212, -0.3956557, 1, 1, 1, 1, 1,
-0.2509663, -0.1472026, -2.789382, 1, 1, 1, 1, 1,
-0.2499173, -0.1060718, -1.160607, 1, 1, 1, 1, 1,
-0.2489779, -0.2275456, -0.4160903, 1, 1, 1, 1, 1,
-0.2489207, -0.655596, -2.184983, 1, 1, 1, 1, 1,
-0.2486898, 0.4189509, -2.225652, 1, 1, 1, 1, 1,
-0.2443651, -1.230133, -2.505162, 0, 0, 1, 1, 1,
-0.2443193, -1.593832, -2.61031, 1, 0, 0, 1, 1,
-0.242735, 0.1411866, -0.05293667, 1, 0, 0, 1, 1,
-0.2406452, 0.6424419, -0.938281, 1, 0, 0, 1, 1,
-0.2374217, -0.3978235, -2.291161, 1, 0, 0, 1, 1,
-0.2351531, 1.023832, 1.672867, 1, 0, 0, 1, 1,
-0.2343316, -1.401054, -1.233593, 0, 0, 0, 1, 1,
-0.2304834, 0.2644704, 0.0906467, 0, 0, 0, 1, 1,
-0.2272346, -0.1523301, -1.967067, 0, 0, 0, 1, 1,
-0.2258333, -0.3909859, -3.435515, 0, 0, 0, 1, 1,
-0.223751, 0.3432749, -1.994593, 0, 0, 0, 1, 1,
-0.2224464, -0.439505, -1.478774, 0, 0, 0, 1, 1,
-0.2220263, 0.7381136, 0.6734579, 0, 0, 0, 1, 1,
-0.2187631, -0.3737162, -4.25948, 1, 1, 1, 1, 1,
-0.2158648, -1.141091, -4.103877, 1, 1, 1, 1, 1,
-0.2133394, -1.016794, -3.67946, 1, 1, 1, 1, 1,
-0.2116993, 0.8691896, -1.314198, 1, 1, 1, 1, 1,
-0.2108865, -0.4512518, -2.317251, 1, 1, 1, 1, 1,
-0.2092891, 0.3968415, -0.7996575, 1, 1, 1, 1, 1,
-0.2052746, -0.3834546, -2.497805, 1, 1, 1, 1, 1,
-0.2048527, -0.331797, -1.784223, 1, 1, 1, 1, 1,
-0.2037187, -2.126729, -2.028172, 1, 1, 1, 1, 1,
-0.1982594, -0.1758835, -2.181089, 1, 1, 1, 1, 1,
-0.1981464, -3.038978, -3.164608, 1, 1, 1, 1, 1,
-0.195671, -1.005992, -3.892205, 1, 1, 1, 1, 1,
-0.1948748, 1.395451, -0.229787, 1, 1, 1, 1, 1,
-0.1945595, -1.446084, -2.783307, 1, 1, 1, 1, 1,
-0.1912248, 1.942302, 1.534936, 1, 1, 1, 1, 1,
-0.1896258, 0.7899355, 0.5210024, 0, 0, 1, 1, 1,
-0.1871575, 1.409789, -0.3507932, 1, 0, 0, 1, 1,
-0.184869, 0.1474582, 0.3979158, 1, 0, 0, 1, 1,
-0.1829485, 0.6726166, -0.7204133, 1, 0, 0, 1, 1,
-0.1823768, -0.946583, -2.607533, 1, 0, 0, 1, 1,
-0.1818271, 0.01034758, -0.8721164, 1, 0, 0, 1, 1,
-0.1818255, 1.067375, 0.476923, 0, 0, 0, 1, 1,
-0.1773033, 0.07831191, -2.286891, 0, 0, 0, 1, 1,
-0.1721507, 0.7079614, -0.4086795, 0, 0, 0, 1, 1,
-0.1708643, -2.086313, -3.967296, 0, 0, 0, 1, 1,
-0.1704146, 0.2225933, -0.7773497, 0, 0, 0, 1, 1,
-0.169979, -1.02641, -2.85185, 0, 0, 0, 1, 1,
-0.1680908, -0.8313739, -2.658702, 0, 0, 0, 1, 1,
-0.1672018, -0.3559387, -3.493054, 1, 1, 1, 1, 1,
-0.1668548, 1.597636, -0.2722333, 1, 1, 1, 1, 1,
-0.166536, 0.2388202, 1.337879, 1, 1, 1, 1, 1,
-0.1579728, 0.9973343, -1.077268, 1, 1, 1, 1, 1,
-0.1545814, -0.6342409, -2.244985, 1, 1, 1, 1, 1,
-0.1534463, 1.4393, -1.093662, 1, 1, 1, 1, 1,
-0.1510634, 0.7971175, -1.064168, 1, 1, 1, 1, 1,
-0.1462484, 0.2442178, -0.7577286, 1, 1, 1, 1, 1,
-0.1461816, -0.4450139, -3.398275, 1, 1, 1, 1, 1,
-0.1339765, 0.5902641, 0.3261474, 1, 1, 1, 1, 1,
-0.1339164, 0.9471968, -1.932898, 1, 1, 1, 1, 1,
-0.1333466, 0.6149084, 1.405426, 1, 1, 1, 1, 1,
-0.130623, 1.033076, 2.188296, 1, 1, 1, 1, 1,
-0.126788, -0.08647642, -2.777123, 1, 1, 1, 1, 1,
-0.1266147, 0.6493558, 0.4304916, 1, 1, 1, 1, 1,
-0.1259538, 0.01133318, -2.705032, 0, 0, 1, 1, 1,
-0.1257619, 0.1009873, -0.0814708, 1, 0, 0, 1, 1,
-0.1220374, -0.7918382, -1.128045, 1, 0, 0, 1, 1,
-0.12026, 0.4108434, -1.792713, 1, 0, 0, 1, 1,
-0.1192713, 0.4504841, -0.2415856, 1, 0, 0, 1, 1,
-0.1086939, 0.7819311, 0.2584768, 1, 0, 0, 1, 1,
-0.1076966, -0.1887975, -3.181589, 0, 0, 0, 1, 1,
-0.1027552, -2.077401, -2.030284, 0, 0, 0, 1, 1,
-0.1014306, -0.5993128, -2.605817, 0, 0, 0, 1, 1,
-0.09802775, -1.610778, -4.479019, 0, 0, 0, 1, 1,
-0.09693741, 0.1188225, -1.340234, 0, 0, 0, 1, 1,
-0.0965198, 0.1046311, -0.1187588, 0, 0, 0, 1, 1,
-0.09618071, 1.006852, -0.06255509, 0, 0, 0, 1, 1,
-0.09448024, -0.3335396, -5.192557, 1, 1, 1, 1, 1,
-0.08748133, -0.8235252, -4.509144, 1, 1, 1, 1, 1,
-0.08011543, 1.354657, -0.8434083, 1, 1, 1, 1, 1,
-0.07698892, 1.408738, 0.2574356, 1, 1, 1, 1, 1,
-0.07533647, 0.1394158, 0.006462624, 1, 1, 1, 1, 1,
-0.0738918, 1.375188, 0.2594512, 1, 1, 1, 1, 1,
-0.07125047, 0.8296714, -0.5908374, 1, 1, 1, 1, 1,
-0.05229312, 0.1018512, 0.1513254, 1, 1, 1, 1, 1,
-0.04878156, 0.7740931, 0.291542, 1, 1, 1, 1, 1,
-0.04627258, -0.3715915, -4.775267, 1, 1, 1, 1, 1,
-0.04294669, -1.094092, -5.087553, 1, 1, 1, 1, 1,
-0.04253479, -1.55707, -3.265434, 1, 1, 1, 1, 1,
-0.03893762, -0.808119, -3.786119, 1, 1, 1, 1, 1,
-0.03839194, -0.8656576, -3.133705, 1, 1, 1, 1, 1,
-0.03581813, -0.2117057, -3.037416, 1, 1, 1, 1, 1,
-0.03173707, -0.8875132, -2.787313, 0, 0, 1, 1, 1,
-0.0287836, -0.2904392, -2.984632, 1, 0, 0, 1, 1,
-0.02748129, 0.7116442, 1.505899, 1, 0, 0, 1, 1,
-0.02433645, 0.174138, -0.6667598, 1, 0, 0, 1, 1,
-0.02077483, -0.4268214, -4.452489, 1, 0, 0, 1, 1,
-0.01740654, 0.4816046, -0.514279, 1, 0, 0, 1, 1,
-0.01633277, -0.6907789, -4.829873, 0, 0, 0, 1, 1,
-0.01433435, -0.7299334, -2.971482, 0, 0, 0, 1, 1,
-0.01070288, 2.745272, -1.622839, 0, 0, 0, 1, 1,
-0.004627728, 1.442154, -0.9769495, 0, 0, 0, 1, 1,
-0.000623949, -0.4080037, -4.279109, 0, 0, 0, 1, 1,
0.004317588, 0.2837555, -0.2736228, 0, 0, 0, 1, 1,
0.006722584, 0.2357747, 2.048567, 0, 0, 0, 1, 1,
0.01215336, -0.2998879, 1.914693, 1, 1, 1, 1, 1,
0.01582409, -0.5712284, 2.720989, 1, 1, 1, 1, 1,
0.01661035, 0.8906471, -0.957302, 1, 1, 1, 1, 1,
0.0184205, 0.2316828, 0.4900104, 1, 1, 1, 1, 1,
0.0268813, 1.171384, -2.967261, 1, 1, 1, 1, 1,
0.03218227, 0.6628544, -0.6527695, 1, 1, 1, 1, 1,
0.03336694, 0.05606029, -0.2246281, 1, 1, 1, 1, 1,
0.04090898, 1.610768, 0.5463861, 1, 1, 1, 1, 1,
0.04836051, 0.03330368, -0.2801219, 1, 1, 1, 1, 1,
0.04989252, -0.8080667, 0.6998127, 1, 1, 1, 1, 1,
0.05056109, -1.443079, 4.346336, 1, 1, 1, 1, 1,
0.05230476, -1.685641, 2.545454, 1, 1, 1, 1, 1,
0.05320344, 0.3225852, 1.711949, 1, 1, 1, 1, 1,
0.05347653, -1.491135, 2.530475, 1, 1, 1, 1, 1,
0.05507442, -1.874189, 3.027755, 1, 1, 1, 1, 1,
0.05655782, -2.773837, 3.234469, 0, 0, 1, 1, 1,
0.05682578, -1.061731, 1.812645, 1, 0, 0, 1, 1,
0.05699962, -0.5317157, 5.499959, 1, 0, 0, 1, 1,
0.05710177, 1.342722, -0.9027582, 1, 0, 0, 1, 1,
0.06752835, 0.6246347, 0.5608296, 1, 0, 0, 1, 1,
0.06760458, -0.7468794, 3.832103, 1, 0, 0, 1, 1,
0.06898883, -0.4804813, 1.287361, 0, 0, 0, 1, 1,
0.07053643, -1.516936, 4.800242, 0, 0, 0, 1, 1,
0.07078157, 1.249381, 1.680671, 0, 0, 0, 1, 1,
0.07172194, 0.7124351, -0.5358825, 0, 0, 0, 1, 1,
0.07394049, 0.0781762, 1.612138, 0, 0, 0, 1, 1,
0.08003811, -0.3262628, 3.292379, 0, 0, 0, 1, 1,
0.08157222, 0.1776712, 0.3401118, 0, 0, 0, 1, 1,
0.09324832, -0.08425729, 1.70129, 1, 1, 1, 1, 1,
0.09481025, -0.6734182, 1.973549, 1, 1, 1, 1, 1,
0.09827004, -0.3585933, 3.597027, 1, 1, 1, 1, 1,
0.10444, 0.6461627, 0.8058406, 1, 1, 1, 1, 1,
0.1047137, 0.6841051, -1.011764, 1, 1, 1, 1, 1,
0.1058966, -0.08245654, 3.321223, 1, 1, 1, 1, 1,
0.1076862, 0.1672944, -0.1767686, 1, 1, 1, 1, 1,
0.1090227, 1.257029, -0.4533072, 1, 1, 1, 1, 1,
0.110213, 1.258331, 0.4497055, 1, 1, 1, 1, 1,
0.110235, -1.036108, 3.357167, 1, 1, 1, 1, 1,
0.1108535, -1.140103, 2.910805, 1, 1, 1, 1, 1,
0.1110048, 0.4275211, 0.7090922, 1, 1, 1, 1, 1,
0.1151337, -0.1546504, 1.667218, 1, 1, 1, 1, 1,
0.1160881, -0.7595895, 1.769403, 1, 1, 1, 1, 1,
0.1160952, -0.4283768, 4.663242, 1, 1, 1, 1, 1,
0.1189514, 1.085049, -0.1232481, 0, 0, 1, 1, 1,
0.122836, -0.3117457, 2.156097, 1, 0, 0, 1, 1,
0.1232423, -0.1770324, 3.297212, 1, 0, 0, 1, 1,
0.1288769, -1.477294, 3.177241, 1, 0, 0, 1, 1,
0.1293619, -0.154555, 2.59601, 1, 0, 0, 1, 1,
0.1338127, -0.3913771, 2.592367, 1, 0, 0, 1, 1,
0.1427753, 0.7374646, 0.1119974, 0, 0, 0, 1, 1,
0.1437484, 0.988838, -0.3424914, 0, 0, 0, 1, 1,
0.1444146, -1.409755, 4.105677, 0, 0, 0, 1, 1,
0.1453588, -2.005909, 3.32748, 0, 0, 0, 1, 1,
0.1465131, 0.5262954, 0.08260363, 0, 0, 0, 1, 1,
0.1649679, -1.470298, 1.924702, 0, 0, 0, 1, 1,
0.1654589, 0.4465117, -0.7871795, 0, 0, 0, 1, 1,
0.1672577, 1.370031, 0.6665038, 1, 1, 1, 1, 1,
0.172675, -1.37953, 2.302526, 1, 1, 1, 1, 1,
0.1764176, -0.2562174, 3.031884, 1, 1, 1, 1, 1,
0.1827876, -1.474315, 3.026862, 1, 1, 1, 1, 1,
0.18391, -0.4131919, 4.17222, 1, 1, 1, 1, 1,
0.1859993, 0.261148, 3.027963, 1, 1, 1, 1, 1,
0.1874865, -0.7688132, 1.354144, 1, 1, 1, 1, 1,
0.1878891, -0.9192863, 3.294976, 1, 1, 1, 1, 1,
0.1880327, -1.322898, 2.476032, 1, 1, 1, 1, 1,
0.1909449, 0.6304544, 0.0690018, 1, 1, 1, 1, 1,
0.192846, 1.267597, 0.3114255, 1, 1, 1, 1, 1,
0.2026749, 1.173916, 1.350467, 1, 1, 1, 1, 1,
0.205035, 1.594167, -1.372922, 1, 1, 1, 1, 1,
0.2095173, 0.2042766, -0.3371468, 1, 1, 1, 1, 1,
0.2113332, -0.4639128, 2.413081, 1, 1, 1, 1, 1,
0.2246298, -0.0279879, 1.197453, 0, 0, 1, 1, 1,
0.2247374, -0.4792334, 0.9371139, 1, 0, 0, 1, 1,
0.2298094, 1.170254, -0.9992585, 1, 0, 0, 1, 1,
0.2298272, 1.846743, 0.9453071, 1, 0, 0, 1, 1,
0.2373874, 0.8004249, 0.9558364, 1, 0, 0, 1, 1,
0.2392983, 0.816147, -1.16968, 1, 0, 0, 1, 1,
0.2457567, 0.008238633, 1.84261, 0, 0, 0, 1, 1,
0.2464522, -1.479385, 2.369438, 0, 0, 0, 1, 1,
0.2465395, -0.5325583, 2.834232, 0, 0, 0, 1, 1,
0.2466648, -1.298753, 2.705868, 0, 0, 0, 1, 1,
0.2488591, -0.6811563, 1.629901, 0, 0, 0, 1, 1,
0.2506297, -0.4267245, 3.667801, 0, 0, 0, 1, 1,
0.2554592, 0.09601805, 1.963893, 0, 0, 0, 1, 1,
0.2554903, -0.09339593, -0.3133946, 1, 1, 1, 1, 1,
0.2568, 2.63162, 1.36449, 1, 1, 1, 1, 1,
0.2635889, 1.742278, 0.3483053, 1, 1, 1, 1, 1,
0.2649036, 1.39769, 0.5260593, 1, 1, 1, 1, 1,
0.2660542, -0.2619328, 2.395279, 1, 1, 1, 1, 1,
0.2699794, -1.447423, 2.035828, 1, 1, 1, 1, 1,
0.2706569, -0.1990893, 1.727958, 1, 1, 1, 1, 1,
0.2736569, 0.77248, 0.06902862, 1, 1, 1, 1, 1,
0.2737237, 0.9986852, -0.2216882, 1, 1, 1, 1, 1,
0.2777479, -0.3261805, 1.249504, 1, 1, 1, 1, 1,
0.2855259, -0.5619018, 3.989241, 1, 1, 1, 1, 1,
0.2865476, -0.3870773, 2.736864, 1, 1, 1, 1, 1,
0.2870452, -1.210111, 3.249858, 1, 1, 1, 1, 1,
0.2894392, 0.8530874, -0.5959513, 1, 1, 1, 1, 1,
0.2961659, 0.1371799, 1.355929, 1, 1, 1, 1, 1,
0.2974564, -0.8373604, 1.013487, 0, 0, 1, 1, 1,
0.298435, -0.07931135, 1.344605, 1, 0, 0, 1, 1,
0.3037983, -0.3608865, 3.596153, 1, 0, 0, 1, 1,
0.3061266, -0.2281337, 4.213344, 1, 0, 0, 1, 1,
0.3084412, 0.53005, 0.466677, 1, 0, 0, 1, 1,
0.3085376, 0.1109449, 1.569065, 1, 0, 0, 1, 1,
0.3124024, 0.5250279, 1.470215, 0, 0, 0, 1, 1,
0.3141222, 0.9963245, 0.8432326, 0, 0, 0, 1, 1,
0.3168953, 1.148837, -0.4457875, 0, 0, 0, 1, 1,
0.3181517, 0.2612233, 1.067721, 0, 0, 0, 1, 1,
0.3209118, -1.973095, 2.146572, 0, 0, 0, 1, 1,
0.3228861, -1.381863, 3.171113, 0, 0, 0, 1, 1,
0.3294429, 0.7610769, 0.9409335, 0, 0, 0, 1, 1,
0.3336178, 1.429832, 1.750541, 1, 1, 1, 1, 1,
0.3371341, 1.617004, -1.021172, 1, 1, 1, 1, 1,
0.3398361, -0.6126563, 1.317977, 1, 1, 1, 1, 1,
0.3441134, -0.4834373, 1.837889, 1, 1, 1, 1, 1,
0.3473091, -0.407787, -0.3722719, 1, 1, 1, 1, 1,
0.3475453, -0.7486677, 4.009662, 1, 1, 1, 1, 1,
0.3524096, 0.9707628, 0.1954401, 1, 1, 1, 1, 1,
0.3531953, 0.4052394, 1.483205, 1, 1, 1, 1, 1,
0.3550765, 0.2467548, 1.86907, 1, 1, 1, 1, 1,
0.3564006, -0.1611405, 1.586239, 1, 1, 1, 1, 1,
0.3568188, -1.591127, 2.612812, 1, 1, 1, 1, 1,
0.3574691, 0.7720052, 1.73591, 1, 1, 1, 1, 1,
0.3582212, -0.7376409, 1.937741, 1, 1, 1, 1, 1,
0.3583168, -1.185367, 3.758708, 1, 1, 1, 1, 1,
0.3591172, -1.565556, 1.301943, 1, 1, 1, 1, 1,
0.3592928, 0.8177506, -0.1599104, 0, 0, 1, 1, 1,
0.3598678, 0.207115, 2.230606, 1, 0, 0, 1, 1,
0.3612028, 1.310887, 1.024106, 1, 0, 0, 1, 1,
0.3615089, -1.254328, 3.214248, 1, 0, 0, 1, 1,
0.3628242, 0.408132, -0.02824145, 1, 0, 0, 1, 1,
0.363919, 0.8358315, 0.9861166, 1, 0, 0, 1, 1,
0.3651082, 0.9755828, 0.3543192, 0, 0, 0, 1, 1,
0.3697716, 0.3549459, 0.8492242, 0, 0, 0, 1, 1,
0.3787129, 1.557647, 0.2778705, 0, 0, 0, 1, 1,
0.3855096, 0.5398258, 0.6319429, 0, 0, 0, 1, 1,
0.3870322, 0.3644289, 0.09180984, 0, 0, 0, 1, 1,
0.3893341, 0.04331359, -0.610171, 0, 0, 0, 1, 1,
0.3946491, -0.2314234, 2.726248, 0, 0, 0, 1, 1,
0.3949685, -1.478552, 3.663095, 1, 1, 1, 1, 1,
0.3982048, -2.001637, 4.795775, 1, 1, 1, 1, 1,
0.4024285, -2.286821, 0.6262228, 1, 1, 1, 1, 1,
0.4028817, -1.057853, 1.164755, 1, 1, 1, 1, 1,
0.4040187, -0.05239078, -1.036419, 1, 1, 1, 1, 1,
0.4040624, -0.5662446, 2.635052, 1, 1, 1, 1, 1,
0.4062436, 0.3559263, -0.6703109, 1, 1, 1, 1, 1,
0.4071806, -0.7373492, 3.814867, 1, 1, 1, 1, 1,
0.4073214, 0.7719485, 0.4557674, 1, 1, 1, 1, 1,
0.4073465, 0.7290598, 1.493971, 1, 1, 1, 1, 1,
0.4076154, -0.6321434, 1.68572, 1, 1, 1, 1, 1,
0.40834, -0.9665705, 2.922801, 1, 1, 1, 1, 1,
0.4160975, 0.332393, 1.491129, 1, 1, 1, 1, 1,
0.4205978, -0.3655617, 0.6230441, 1, 1, 1, 1, 1,
0.42387, -1.214452, 2.36326, 1, 1, 1, 1, 1,
0.4248597, -0.07273934, 0.02572576, 0, 0, 1, 1, 1,
0.426176, -0.7601364, 2.3919, 1, 0, 0, 1, 1,
0.4279656, 0.6967611, 0.6378016, 1, 0, 0, 1, 1,
0.4285826, 1.079561, 0.6882161, 1, 0, 0, 1, 1,
0.4286199, -1.392477, 4.115726, 1, 0, 0, 1, 1,
0.4309975, -0.559298, 1.683366, 1, 0, 0, 1, 1,
0.4346794, 1.447948, -0.486448, 0, 0, 0, 1, 1,
0.4373335, 3.189984, 0.3913985, 0, 0, 0, 1, 1,
0.4405295, -1.58945, 4.420753, 0, 0, 0, 1, 1,
0.4440901, -0.3418748, 3.020751, 0, 0, 0, 1, 1,
0.444402, 0.03464243, 1.195183, 0, 0, 0, 1, 1,
0.4448408, 0.1192148, 0.693837, 0, 0, 0, 1, 1,
0.4448949, 0.1926964, -0.4460165, 0, 0, 0, 1, 1,
0.4461309, -0.8824889, 2.128293, 1, 1, 1, 1, 1,
0.4473225, 0.01653499, 0.8596869, 1, 1, 1, 1, 1,
0.4475298, -0.9287521, 2.564204, 1, 1, 1, 1, 1,
0.4481507, -0.1936575, -0.5808264, 1, 1, 1, 1, 1,
0.4529516, -0.9905073, 3.888651, 1, 1, 1, 1, 1,
0.4663064, -0.9089531, 3.369393, 1, 1, 1, 1, 1,
0.466673, 1.97769, 0.6920015, 1, 1, 1, 1, 1,
0.4734403, -0.9670609, 2.633397, 1, 1, 1, 1, 1,
0.4766783, 0.985057, 0.8010368, 1, 1, 1, 1, 1,
0.4805846, -1.633172, 4.121419, 1, 1, 1, 1, 1,
0.483075, 1.49319, 0.6213987, 1, 1, 1, 1, 1,
0.4892372, -2.44512, 3.332009, 1, 1, 1, 1, 1,
0.490276, 0.5317246, -0.4733889, 1, 1, 1, 1, 1,
0.4912159, 0.7966582, 0.1654063, 1, 1, 1, 1, 1,
0.4944925, 1.755803, -0.06823669, 1, 1, 1, 1, 1,
0.4967402, -0.04832218, 2.546537, 0, 0, 1, 1, 1,
0.4990031, 1.097734, 1.287541, 1, 0, 0, 1, 1,
0.4995846, -0.878971, 3.044753, 1, 0, 0, 1, 1,
0.5034847, -0.4585265, 3.13636, 1, 0, 0, 1, 1,
0.5059157, 0.30011, 1.575787, 1, 0, 0, 1, 1,
0.5067933, 0.01893482, 2.329776, 1, 0, 0, 1, 1,
0.5075533, 0.9308873, -0.7927441, 0, 0, 0, 1, 1,
0.5084968, 0.3283155, 0.3731645, 0, 0, 0, 1, 1,
0.5097078, 0.8994659, 0.50414, 0, 0, 0, 1, 1,
0.5097231, 0.3356912, -0.8088323, 0, 0, 0, 1, 1,
0.5115584, 2.043095, 1.012791, 0, 0, 0, 1, 1,
0.5164063, 1.100238, 1.481963, 0, 0, 0, 1, 1,
0.5164976, 0.4009056, 0.2940685, 0, 0, 0, 1, 1,
0.526566, -0.6736926, 2.842644, 1, 1, 1, 1, 1,
0.5292243, -1.40999, 2.283616, 1, 1, 1, 1, 1,
0.5340567, -1.335295, 3.06011, 1, 1, 1, 1, 1,
0.5346841, -0.7270004, 4.579875, 1, 1, 1, 1, 1,
0.536718, 1.242057, 0.79603, 1, 1, 1, 1, 1,
0.5376088, -0.3283527, 1.862353, 1, 1, 1, 1, 1,
0.5379397, 0.04801199, 0.546847, 1, 1, 1, 1, 1,
0.5392335, 1.453127, -1.693993, 1, 1, 1, 1, 1,
0.5403674, -0.4214952, -0.1685767, 1, 1, 1, 1, 1,
0.5458935, -1.504918, 3.578808, 1, 1, 1, 1, 1,
0.5475553, 0.8031095, -0.2545857, 1, 1, 1, 1, 1,
0.5648007, -0.07805938, 1.5763, 1, 1, 1, 1, 1,
0.5677619, 0.6741464, -0.513733, 1, 1, 1, 1, 1,
0.5696355, 1.670215, 0.09805205, 1, 1, 1, 1, 1,
0.5754817, -0.5150673, 0.3630499, 1, 1, 1, 1, 1,
0.5777388, 0.4394857, 1.894044, 0, 0, 1, 1, 1,
0.5823598, -0.7811618, 2.010156, 1, 0, 0, 1, 1,
0.5909, 0.4835333, 0.6146756, 1, 0, 0, 1, 1,
0.592212, 0.4432236, 0.6597628, 1, 0, 0, 1, 1,
0.5974312, -1.083971, 3.109702, 1, 0, 0, 1, 1,
0.5988928, 0.05952046, 0.7356799, 1, 0, 0, 1, 1,
0.6006397, -0.5595639, 2.506503, 0, 0, 0, 1, 1,
0.6018419, -0.6260747, 1.123486, 0, 0, 0, 1, 1,
0.6020082, -3.080767, 2.64923, 0, 0, 0, 1, 1,
0.6026033, -0.3700265, 1.142527, 0, 0, 0, 1, 1,
0.6030437, -0.8043717, 2.008239, 0, 0, 0, 1, 1,
0.60426, 0.1546659, 0.8534259, 0, 0, 0, 1, 1,
0.6054617, -0.2088122, 1.480893, 0, 0, 0, 1, 1,
0.6056243, 1.73518, 1.314811, 1, 1, 1, 1, 1,
0.6074663, -0.1099969, 2.312827, 1, 1, 1, 1, 1,
0.6075243, -0.2494406, 1.600634, 1, 1, 1, 1, 1,
0.6094635, 0.1627366, 2.898502, 1, 1, 1, 1, 1,
0.6106243, 1.477708, -0.3122287, 1, 1, 1, 1, 1,
0.6110741, 0.4690544, 0.390347, 1, 1, 1, 1, 1,
0.611309, -2.868586, 2.113379, 1, 1, 1, 1, 1,
0.6125247, 0.5021462, 1.727231, 1, 1, 1, 1, 1,
0.6183712, 0.66373, -0.5696754, 1, 1, 1, 1, 1,
0.6212052, 1.015692, 0.8254755, 1, 1, 1, 1, 1,
0.6219365, -0.5796047, 3.502031, 1, 1, 1, 1, 1,
0.6249347, 1.017268, -0.0407691, 1, 1, 1, 1, 1,
0.6290807, -1.322188, 2.664738, 1, 1, 1, 1, 1,
0.6334957, 1.423855, 0.3014512, 1, 1, 1, 1, 1,
0.6356344, -0.1665541, 0.8303627, 1, 1, 1, 1, 1,
0.6419837, -1.251033, 3.474183, 0, 0, 1, 1, 1,
0.6422377, 1.158471, 0.4625118, 1, 0, 0, 1, 1,
0.6424929, -1.535233, 2.360597, 1, 0, 0, 1, 1,
0.6434085, 0.2572054, 1.081814, 1, 0, 0, 1, 1,
0.6441446, 0.1053237, 0.8897432, 1, 0, 0, 1, 1,
0.6479588, -1.432032, 2.207221, 1, 0, 0, 1, 1,
0.6498145, -0.635217, 2.002, 0, 0, 0, 1, 1,
0.6558647, -1.821496, 2.533575, 0, 0, 0, 1, 1,
0.6611178, 0.3391499, 1.340371, 0, 0, 0, 1, 1,
0.664298, 0.4993665, 3.595609, 0, 0, 0, 1, 1,
0.6654705, -1.103864, 1.789831, 0, 0, 0, 1, 1,
0.6667631, -0.2798593, 4.030358, 0, 0, 0, 1, 1,
0.6689783, -2.378999, 1.418158, 0, 0, 0, 1, 1,
0.6705507, 2.045564, 1.408181, 1, 1, 1, 1, 1,
0.6742007, -0.627822, 3.163164, 1, 1, 1, 1, 1,
0.6742401, 2.129744, 0.1099334, 1, 1, 1, 1, 1,
0.6749573, 1.474606, 1.24705, 1, 1, 1, 1, 1,
0.6750739, 0.5559871, 0.8384886, 1, 1, 1, 1, 1,
0.6779075, 1.277831, -0.1632252, 1, 1, 1, 1, 1,
0.6796777, -0.9214082, 1.9335, 1, 1, 1, 1, 1,
0.6803933, 0.3372337, 2.891726, 1, 1, 1, 1, 1,
0.6805882, -0.9426598, 2.757508, 1, 1, 1, 1, 1,
0.6825022, 0.1986356, 0.5584088, 1, 1, 1, 1, 1,
0.6827509, -0.6698088, 1.122979, 1, 1, 1, 1, 1,
0.6839755, -0.5587015, 1.108036, 1, 1, 1, 1, 1,
0.6866286, 0.6145779, 1.691697, 1, 1, 1, 1, 1,
0.6927224, -0.1706105, 1.779609, 1, 1, 1, 1, 1,
0.6950155, 0.7943237, 1.920508, 1, 1, 1, 1, 1,
0.6953187, 0.6127843, 1.552988, 0, 0, 1, 1, 1,
0.6995365, 1.437089, 2.868344, 1, 0, 0, 1, 1,
0.7051322, 0.9952021, -0.9397161, 1, 0, 0, 1, 1,
0.7070404, 0.4139663, 1.880222, 1, 0, 0, 1, 1,
0.7118899, -1.282918, 2.025511, 1, 0, 0, 1, 1,
0.7143556, 1.534364, -0.4060608, 1, 0, 0, 1, 1,
0.7178927, 0.6760381, 0.2445426, 0, 0, 0, 1, 1,
0.7181031, -0.3835954, -0.2092418, 0, 0, 0, 1, 1,
0.7316403, -0.9753234, 0.7414693, 0, 0, 0, 1, 1,
0.736238, 0.5485192, 0.9460291, 0, 0, 0, 1, 1,
0.7363489, -0.4772995, 2.262585, 0, 0, 0, 1, 1,
0.7406868, -0.2262436, 4.012881, 0, 0, 0, 1, 1,
0.7415894, 1.442141, -0.9666357, 0, 0, 0, 1, 1,
0.7504452, -1.334711, 3.875024, 1, 1, 1, 1, 1,
0.7512228, -1.510853, 3.801152, 1, 1, 1, 1, 1,
0.7515672, 0.2963028, 2.445813, 1, 1, 1, 1, 1,
0.7546655, 1.023929, 0.9606932, 1, 1, 1, 1, 1,
0.7718521, 0.2270944, 2.920164, 1, 1, 1, 1, 1,
0.7721039, -1.592048, 2.456141, 1, 1, 1, 1, 1,
0.7732091, 1.224798, -1.249437, 1, 1, 1, 1, 1,
0.7767047, 0.6681666, 1.796183, 1, 1, 1, 1, 1,
0.7810336, -1.257036, 2.430972, 1, 1, 1, 1, 1,
0.7829714, -0.2423849, 1.316734, 1, 1, 1, 1, 1,
0.7836607, 1.053151, 0.05837029, 1, 1, 1, 1, 1,
0.7907094, 0.02409942, 1.681079, 1, 1, 1, 1, 1,
0.7962477, -0.9946396, 3.715979, 1, 1, 1, 1, 1,
0.7972551, -0.782418, 1.605663, 1, 1, 1, 1, 1,
0.7980891, 0.4009886, 0.6099699, 1, 1, 1, 1, 1,
0.7991513, 1.230868, -1.095746, 0, 0, 1, 1, 1,
0.8048295, 1.078776, 1.232149, 1, 0, 0, 1, 1,
0.8073057, 0.48281, 0.990761, 1, 0, 0, 1, 1,
0.8102432, 0.4464124, 0.4849694, 1, 0, 0, 1, 1,
0.8284698, 0.3178373, 2.772561, 1, 0, 0, 1, 1,
0.8329595, -0.004208182, 1.816951, 1, 0, 0, 1, 1,
0.8394886, 0.08100384, 2.233865, 0, 0, 0, 1, 1,
0.83961, -0.9265076, 3.380395, 0, 0, 0, 1, 1,
0.8431019, 1.375251, 0.7536913, 0, 0, 0, 1, 1,
0.8462291, 0.4840972, -0.7508993, 0, 0, 0, 1, 1,
0.850141, -0.6423229, 0.8558709, 0, 0, 0, 1, 1,
0.8508705, 1.21564, -0.7843043, 0, 0, 0, 1, 1,
0.8580341, -0.2018358, 2.262816, 0, 0, 0, 1, 1,
0.8731352, -1.84649, 1.812583, 1, 1, 1, 1, 1,
0.8731811, 1.626537, 0.5677223, 1, 1, 1, 1, 1,
0.8753076, 1.289296, 0.433152, 1, 1, 1, 1, 1,
0.8785482, 0.4406195, 1.079556, 1, 1, 1, 1, 1,
0.8853086, 1.410573, 1.432787, 1, 1, 1, 1, 1,
0.8877618, 0.1674151, 1.52646, 1, 1, 1, 1, 1,
0.8904809, -2.073606, 3.833264, 1, 1, 1, 1, 1,
0.8979228, 0.06741113, 0.6718464, 1, 1, 1, 1, 1,
0.899239, 1.426686, 1.963626, 1, 1, 1, 1, 1,
0.9016773, -0.4764729, 1.189025, 1, 1, 1, 1, 1,
0.9019771, -1.167406, 1.640003, 1, 1, 1, 1, 1,
0.9075313, 1.426242, 0.1218664, 1, 1, 1, 1, 1,
0.9081934, -1.43034, 2.877647, 1, 1, 1, 1, 1,
0.9169861, 1.416853, 0.297416, 1, 1, 1, 1, 1,
0.9185167, 0.3212097, 2.26335, 1, 1, 1, 1, 1,
0.9186409, -1.362808, 2.248718, 0, 0, 1, 1, 1,
0.918949, -0.04356964, 2.435571, 1, 0, 0, 1, 1,
0.9218769, -1.301474, 2.577952, 1, 0, 0, 1, 1,
0.9273973, 0.7641714, 0.9428155, 1, 0, 0, 1, 1,
0.9300142, -1.30296, 2.8276, 1, 0, 0, 1, 1,
0.9303947, 0.6123338, -0.7944667, 1, 0, 0, 1, 1,
0.9307871, -1.260979, 3.541448, 0, 0, 0, 1, 1,
0.9316513, 0.2331856, 2.471611, 0, 0, 0, 1, 1,
0.9319841, 2.457476, 2.460471, 0, 0, 0, 1, 1,
0.9484674, 0.9138486, 2.18249, 0, 0, 0, 1, 1,
0.9504239, 0.6099474, 2.105099, 0, 0, 0, 1, 1,
0.9558914, -0.2397192, 2.025921, 0, 0, 0, 1, 1,
0.9628201, 0.562513, -0.02142823, 0, 0, 0, 1, 1,
0.9629835, 0.598757, 0.7258732, 1, 1, 1, 1, 1,
0.9725648, 0.07028651, 1.202059, 1, 1, 1, 1, 1,
0.9730427, 2.401283, 0.01953731, 1, 1, 1, 1, 1,
0.9743879, 0.9707919, 0.1496541, 1, 1, 1, 1, 1,
0.9771904, 0.7342255, -0.6529872, 1, 1, 1, 1, 1,
0.9856868, -0.3397549, 1.516757, 1, 1, 1, 1, 1,
0.9961836, 1.189859, 0.0006540541, 1, 1, 1, 1, 1,
1.007799, 2.827274, 0.8222893, 1, 1, 1, 1, 1,
1.00823, -0.4609696, 0.7415813, 1, 1, 1, 1, 1,
1.008847, 0.1689007, 2.431609, 1, 1, 1, 1, 1,
1.011294, -0.7426161, 1.452935, 1, 1, 1, 1, 1,
1.015121, -0.4308734, 2.343466, 1, 1, 1, 1, 1,
1.028578, -0.0276166, 3.749772, 1, 1, 1, 1, 1,
1.03007, -0.5783201, 2.482711, 1, 1, 1, 1, 1,
1.035204, -1.128727, 1.352075, 1, 1, 1, 1, 1,
1.042248, -2.245596, 3.80084, 0, 0, 1, 1, 1,
1.043156, -0.6822519, 1.755942, 1, 0, 0, 1, 1,
1.044145, 1.41867, -0.4584129, 1, 0, 0, 1, 1,
1.049587, 0.6185964, 1.076931, 1, 0, 0, 1, 1,
1.051249, 0.6134219, -0.2657579, 1, 0, 0, 1, 1,
1.052251, 0.05416322, 1.329472, 1, 0, 0, 1, 1,
1.053894, -2.121733, 3.049695, 0, 0, 0, 1, 1,
1.058657, 1.417807, 0.3980614, 0, 0, 0, 1, 1,
1.060817, -0.902354, 1.427899, 0, 0, 0, 1, 1,
1.061544, 0.9339781, 2.095121, 0, 0, 0, 1, 1,
1.062138, -0.4547195, 1.3558, 0, 0, 0, 1, 1,
1.075783, 0.2893873, 1.255853, 0, 0, 0, 1, 1,
1.077616, -0.5158333, 0.9071827, 0, 0, 0, 1, 1,
1.080028, -0.03658049, 3.579344, 1, 1, 1, 1, 1,
1.080103, -0.7453095, 0.7864127, 1, 1, 1, 1, 1,
1.081219, 1.703176, 0.6153489, 1, 1, 1, 1, 1,
1.087826, -1.467225, 2.741605, 1, 1, 1, 1, 1,
1.092442, 0.5189557, -0.9051157, 1, 1, 1, 1, 1,
1.094393, 1.866312, 0.7736711, 1, 1, 1, 1, 1,
1.096178, 2.038288, 0.4283489, 1, 1, 1, 1, 1,
1.103999, -0.1512987, 1.777043, 1, 1, 1, 1, 1,
1.107889, 0.5524353, -0.7552249, 1, 1, 1, 1, 1,
1.111507, -2.276798, 0.6251944, 1, 1, 1, 1, 1,
1.112956, -0.4462731, 1.885237, 1, 1, 1, 1, 1,
1.114776, -0.4694986, 0.679921, 1, 1, 1, 1, 1,
1.118256, -1.99337, 2.450247, 1, 1, 1, 1, 1,
1.12478, 0.6481689, 0.116297, 1, 1, 1, 1, 1,
1.12939, 0.08361997, 1.290534, 1, 1, 1, 1, 1,
1.129553, -0.4623013, 1.474946, 0, 0, 1, 1, 1,
1.134016, -0.6351856, 2.971518, 1, 0, 0, 1, 1,
1.13935, 0.0714698, 0.8353851, 1, 0, 0, 1, 1,
1.140423, 0.3995857, 0.1411119, 1, 0, 0, 1, 1,
1.153349, -2.447709, 2.116637, 1, 0, 0, 1, 1,
1.158951, -1.297194, 3.843735, 1, 0, 0, 1, 1,
1.169196, -0.3314857, 2.085232, 0, 0, 0, 1, 1,
1.174896, 0.1636775, 1.408732, 0, 0, 0, 1, 1,
1.176013, -1.461724, 3.201321, 0, 0, 0, 1, 1,
1.177769, 1.255286, 0.242869, 0, 0, 0, 1, 1,
1.181195, -1.080707, 5.261876, 0, 0, 0, 1, 1,
1.187008, -0.07793026, 2.642518, 0, 0, 0, 1, 1,
1.20071, -0.0191643, 1.385002, 0, 0, 0, 1, 1,
1.210513, 0.4219705, 1.37601, 1, 1, 1, 1, 1,
1.216856, -2.255977, 2.662871, 1, 1, 1, 1, 1,
1.231349, 0.3898306, 0.2934117, 1, 1, 1, 1, 1,
1.236639, 1.498949, -0.1902265, 1, 1, 1, 1, 1,
1.248685, -0.3683979, 1.892764, 1, 1, 1, 1, 1,
1.262517, 0.9307128, 1.627453, 1, 1, 1, 1, 1,
1.267342, -0.5245743, 0.8478913, 1, 1, 1, 1, 1,
1.268263, -0.9396662, 2.111069, 1, 1, 1, 1, 1,
1.28095, -0.1878346, 1.845568, 1, 1, 1, 1, 1,
1.292179, 0.2742489, -0.1689792, 1, 1, 1, 1, 1,
1.298306, -0.8800232, 2.539868, 1, 1, 1, 1, 1,
1.315937, -0.6315153, 0.8794886, 1, 1, 1, 1, 1,
1.318441, 1.026655, 1.126086, 1, 1, 1, 1, 1,
1.341001, -0.07574496, 2.082649, 1, 1, 1, 1, 1,
1.343398, 1.50397, 0.2706393, 1, 1, 1, 1, 1,
1.352023, -0.2845577, 1.934259, 0, 0, 1, 1, 1,
1.358586, -0.2437474, 2.077266, 1, 0, 0, 1, 1,
1.363684, 0.4749907, -0.4910529, 1, 0, 0, 1, 1,
1.387162, 0.09749807, 0.9257815, 1, 0, 0, 1, 1,
1.39062, 0.04520494, 1.694772, 1, 0, 0, 1, 1,
1.391098, 0.3208335, 1.62427, 1, 0, 0, 1, 1,
1.393025, 0.03438536, 2.056467, 0, 0, 0, 1, 1,
1.405623, -1.349235, 1.434417, 0, 0, 0, 1, 1,
1.417013, -0.7606339, 2.706917, 0, 0, 0, 1, 1,
1.420295, -1.100456, 2.871318, 0, 0, 0, 1, 1,
1.426713, 1.434003, 0.1642952, 0, 0, 0, 1, 1,
1.431052, -0.6561338, 2.200237, 0, 0, 0, 1, 1,
1.455691, 2.693586, 0.413012, 0, 0, 0, 1, 1,
1.465138, -0.4749012, 2.37143, 1, 1, 1, 1, 1,
1.470412, 0.6467746, 0.7326163, 1, 1, 1, 1, 1,
1.471759, -1.703469, 2.641478, 1, 1, 1, 1, 1,
1.482389, 0.3874421, 0.609463, 1, 1, 1, 1, 1,
1.492651, -0.1295456, 3.030948, 1, 1, 1, 1, 1,
1.497221, 1.623547, 0.8773517, 1, 1, 1, 1, 1,
1.501805, 0.04159267, 0.1414422, 1, 1, 1, 1, 1,
1.502819, -1.428046, 3.820497, 1, 1, 1, 1, 1,
1.50338, 1.148397, 2.448939, 1, 1, 1, 1, 1,
1.511063, 0.6933702, 0.7748755, 1, 1, 1, 1, 1,
1.512484, 0.6024489, 3.266547, 1, 1, 1, 1, 1,
1.519286, -0.4926811, 3.079492, 1, 1, 1, 1, 1,
1.529335, 0.6614667, 1.926205, 1, 1, 1, 1, 1,
1.532282, 0.2784095, 2.096336, 1, 1, 1, 1, 1,
1.539861, -1.343945, 2.750984, 1, 1, 1, 1, 1,
1.545596, -0.7213141, 2.670627, 0, 0, 1, 1, 1,
1.550717, -1.048645, 2.303379, 1, 0, 0, 1, 1,
1.55342, -0.1237367, 2.390485, 1, 0, 0, 1, 1,
1.554388, -1.041306, 2.659707, 1, 0, 0, 1, 1,
1.555452, -1.131654, 3.192965, 1, 0, 0, 1, 1,
1.556597, -0.1599299, 2.245381, 1, 0, 0, 1, 1,
1.564738, 0.2425271, 0.7763852, 0, 0, 0, 1, 1,
1.570048, -0.1628037, 2.276936, 0, 0, 0, 1, 1,
1.576972, -0.5004454, 0.5322648, 0, 0, 0, 1, 1,
1.612505, -0.4857962, 2.075113, 0, 0, 0, 1, 1,
1.616912, 0.5644494, -0.0705445, 0, 0, 0, 1, 1,
1.626722, -1.410119, 2.343286, 0, 0, 0, 1, 1,
1.632437, -0.1790316, 2.346657, 0, 0, 0, 1, 1,
1.634889, 1.176888, 1.392601, 1, 1, 1, 1, 1,
1.635685, -0.08071335, 1.375954, 1, 1, 1, 1, 1,
1.657241, 1.322007, 1.204597, 1, 1, 1, 1, 1,
1.701486, -0.427101, 2.980912, 1, 1, 1, 1, 1,
1.710647, 1.575071, -0.001903668, 1, 1, 1, 1, 1,
1.712029, 1.833677, -0.01606074, 1, 1, 1, 1, 1,
1.716942, 0.4840717, 1.24071, 1, 1, 1, 1, 1,
1.731848, -0.06290849, 2.594253, 1, 1, 1, 1, 1,
1.767098, 0.6771782, 0.4489645, 1, 1, 1, 1, 1,
1.772812, -1.996981, 2.133061, 1, 1, 1, 1, 1,
1.804279, 0.9626245, 1.844537, 1, 1, 1, 1, 1,
1.806483, -0.9504494, 2.728345, 1, 1, 1, 1, 1,
1.845152, 1.869675, -0.4425593, 1, 1, 1, 1, 1,
1.859512, 1.6952, 1.210474, 1, 1, 1, 1, 1,
1.860953, 0.947051, 1.556322, 1, 1, 1, 1, 1,
1.862796, -0.2261586, 2.741151, 0, 0, 1, 1, 1,
1.866074, -0.7367454, 2.827879, 1, 0, 0, 1, 1,
1.871384, 0.9244349, 0.8178941, 1, 0, 0, 1, 1,
1.926844, 2.22858, 0.4261844, 1, 0, 0, 1, 1,
1.957711, 1.099463, 1.955465, 1, 0, 0, 1, 1,
1.972232, -0.01639469, 2.357109, 1, 0, 0, 1, 1,
1.994248, -0.7459274, 1.083865, 0, 0, 0, 1, 1,
2.058069, 0.3045755, 2.21873, 0, 0, 0, 1, 1,
2.060132, -0.7392472, 2.086625, 0, 0, 0, 1, 1,
2.065912, -1.807439, 2.010095, 0, 0, 0, 1, 1,
2.089242, -0.1802707, 2.838487, 0, 0, 0, 1, 1,
2.144985, -0.01181755, 2.949932, 0, 0, 0, 1, 1,
2.215075, 1.84533, -0.1783499, 0, 0, 0, 1, 1,
2.415079, 0.5162812, 1.210329, 1, 1, 1, 1, 1,
2.427185, -0.3712151, 1.291848, 1, 1, 1, 1, 1,
2.616033, 0.3300369, -0.6180122, 1, 1, 1, 1, 1,
2.725693, 1.456303, 1.424698, 1, 1, 1, 1, 1,
2.73749, 0.9444693, -0.138786, 1, 1, 1, 1, 1,
3.193017, 0.1974703, 1.071257, 1, 1, 1, 1, 1,
3.258741, -0.4575762, 1.256219, 1, 1, 1, 1, 1
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
var radius = 9.54361;
var distance = 33.52153;
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
mvMatrix.translate( -0.04861546, -0.07531118, -0.1537008 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52153);
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