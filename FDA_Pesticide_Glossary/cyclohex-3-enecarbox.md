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
-3.324133, -1.41461, -2.44025, 1, 0, 0, 1,
-3.019251, -0.2346307, -1.71295, 1, 0.007843138, 0, 1,
-2.94368, 0.5241088, -0.9990427, 1, 0.01176471, 0, 1,
-2.873962, -1.249386, -0.7205879, 1, 0.01960784, 0, 1,
-2.840552, 1.01106, -0.9784917, 1, 0.02352941, 0, 1,
-2.805392, 0.4093674, -1.401166, 1, 0.03137255, 0, 1,
-2.724277, -0.90047, 0.06318803, 1, 0.03529412, 0, 1,
-2.629647, -1.040479, -1.248104, 1, 0.04313726, 0, 1,
-2.528967, 0.6244218, -0.9750112, 1, 0.04705882, 0, 1,
-2.48331, -0.06620347, -2.057974, 1, 0.05490196, 0, 1,
-2.433983, -1.872897, -2.942245, 1, 0.05882353, 0, 1,
-2.427615, -0.6719707, -2.596847, 1, 0.06666667, 0, 1,
-2.414486, -0.1856861, -0.64486, 1, 0.07058824, 0, 1,
-2.378366, 1.065451, -1.257679, 1, 0.07843138, 0, 1,
-2.350346, -0.8584031, -0.4609898, 1, 0.08235294, 0, 1,
-2.268724, 1.415123, -2.359529, 1, 0.09019608, 0, 1,
-2.223352, 1.619109, -0.5617653, 1, 0.09411765, 0, 1,
-2.19266, 1.995941, -2.294776, 1, 0.1019608, 0, 1,
-2.177974, -0.9058828, -2.605258, 1, 0.1098039, 0, 1,
-2.164162, 0.448953, -1.741512, 1, 0.1137255, 0, 1,
-2.160659, 0.1239386, -1.480552, 1, 0.1215686, 0, 1,
-2.144105, -1.245067, -3.454504, 1, 0.1254902, 0, 1,
-2.140522, 0.1378229, -1.060038, 1, 0.1333333, 0, 1,
-2.106828, -0.5923886, -1.227065, 1, 0.1372549, 0, 1,
-2.096386, 1.492105, -1.543382, 1, 0.145098, 0, 1,
-2.07462, -0.6902458, -1.451168, 1, 0.1490196, 0, 1,
-2.070784, -0.3684297, -1.375394, 1, 0.1568628, 0, 1,
-2.070501, 0.2949868, -1.035996, 1, 0.1607843, 0, 1,
-2.036855, -1.517966, -2.508516, 1, 0.1686275, 0, 1,
-2.017398, 0.7144905, -0.9552389, 1, 0.172549, 0, 1,
-1.942156, -0.1618516, -1.082829, 1, 0.1803922, 0, 1,
-1.932888, 0.5440179, -2.945518, 1, 0.1843137, 0, 1,
-1.908551, 0.9333643, -2.186297, 1, 0.1921569, 0, 1,
-1.902814, 0.5269422, -2.078704, 1, 0.1960784, 0, 1,
-1.853003, -1.1363, -1.626866, 1, 0.2039216, 0, 1,
-1.828238, 1.702459, -0.06570362, 1, 0.2117647, 0, 1,
-1.826325, -0.4651239, -3.102787, 1, 0.2156863, 0, 1,
-1.815126, -1.539762, -4.072948, 1, 0.2235294, 0, 1,
-1.792942, -0.8040971, -1.693161, 1, 0.227451, 0, 1,
-1.79046, 0.6383786, -0.2180574, 1, 0.2352941, 0, 1,
-1.776609, 0.4306028, -3.187587, 1, 0.2392157, 0, 1,
-1.763096, 1.207696, -0.7367063, 1, 0.2470588, 0, 1,
-1.753047, -0.9252992, -2.590693, 1, 0.2509804, 0, 1,
-1.748983, 0.2645437, -2.616354, 1, 0.2588235, 0, 1,
-1.74493, 0.8705766, -1.887226, 1, 0.2627451, 0, 1,
-1.736014, -0.5189949, -2.094164, 1, 0.2705882, 0, 1,
-1.707883, 1.800925, 0.6753475, 1, 0.2745098, 0, 1,
-1.701427, -1.522268, -2.00921, 1, 0.282353, 0, 1,
-1.698686, -1.345241, -0.7478778, 1, 0.2862745, 0, 1,
-1.692997, 1.21946, 0.2493458, 1, 0.2941177, 0, 1,
-1.692824, 0.1321843, -0.9727503, 1, 0.3019608, 0, 1,
-1.684579, -1.073308, -3.40113, 1, 0.3058824, 0, 1,
-1.682289, -1.59864, -2.876659, 1, 0.3137255, 0, 1,
-1.680224, 0.2864564, -1.45228, 1, 0.3176471, 0, 1,
-1.665392, -0.8146477, -1.516636, 1, 0.3254902, 0, 1,
-1.664214, -0.516988, -1.952069, 1, 0.3294118, 0, 1,
-1.661883, -0.6154349, -1.044352, 1, 0.3372549, 0, 1,
-1.651289, -1.22382, -2.598021, 1, 0.3411765, 0, 1,
-1.636891, 0.2356711, -3.942563, 1, 0.3490196, 0, 1,
-1.622693, -0.3731703, -2.26029, 1, 0.3529412, 0, 1,
-1.603261, -0.2715417, -1.698479, 1, 0.3607843, 0, 1,
-1.597442, 0.4052667, -2.15028, 1, 0.3647059, 0, 1,
-1.588704, 0.1809472, -1.999389, 1, 0.372549, 0, 1,
-1.584875, -0.6272768, -4.075715, 1, 0.3764706, 0, 1,
-1.539982, 0.5775067, -2.213261, 1, 0.3843137, 0, 1,
-1.539575, 0.3049133, -1.29377, 1, 0.3882353, 0, 1,
-1.527198, 0.4141767, -1.458427, 1, 0.3960784, 0, 1,
-1.512142, -0.0896844, -0.8642985, 1, 0.4039216, 0, 1,
-1.503451, 0.01744136, -2.502288, 1, 0.4078431, 0, 1,
-1.488914, -0.7755297, -4.02995, 1, 0.4156863, 0, 1,
-1.488826, 1.047747, 0.4296285, 1, 0.4196078, 0, 1,
-1.481517, -0.538755, -2.107413, 1, 0.427451, 0, 1,
-1.465986, 0.7462835, -1.536877, 1, 0.4313726, 0, 1,
-1.465588, -0.3081306, -2.359289, 1, 0.4392157, 0, 1,
-1.46389, -0.9320718, -2.561156, 1, 0.4431373, 0, 1,
-1.463332, 1.343502, -1.277481, 1, 0.4509804, 0, 1,
-1.444437, -0.1628934, -2.355849, 1, 0.454902, 0, 1,
-1.44435, 1.003865, -1.562769, 1, 0.4627451, 0, 1,
-1.443635, -0.4052444, -2.174031, 1, 0.4666667, 0, 1,
-1.438947, -0.02556401, -1.963261, 1, 0.4745098, 0, 1,
-1.434172, -1.175368, -2.492469, 1, 0.4784314, 0, 1,
-1.42552, 1.367836, -0.6708106, 1, 0.4862745, 0, 1,
-1.422994, 1.092853, 0.02390641, 1, 0.4901961, 0, 1,
-1.41807, 0.6718248, -0.6241004, 1, 0.4980392, 0, 1,
-1.40524, 0.2525681, -2.813563, 1, 0.5058824, 0, 1,
-1.397155, -0.3851571, -3.053481, 1, 0.509804, 0, 1,
-1.394138, -0.4572427, -2.021173, 1, 0.5176471, 0, 1,
-1.393142, 1.075102, 0.1969786, 1, 0.5215687, 0, 1,
-1.381008, 2.633219, 0.6662462, 1, 0.5294118, 0, 1,
-1.372225, 1.210958, -0.9676166, 1, 0.5333334, 0, 1,
-1.368743, 2.30434, 0.04057422, 1, 0.5411765, 0, 1,
-1.350577, 1.383343, -0.2907953, 1, 0.5450981, 0, 1,
-1.329363, 0.6197947, -0.4465855, 1, 0.5529412, 0, 1,
-1.325348, -0.3855206, -0.2993459, 1, 0.5568628, 0, 1,
-1.320152, 2.033509, -0.4680027, 1, 0.5647059, 0, 1,
-1.315655, -0.3659921, -1.998623, 1, 0.5686275, 0, 1,
-1.315056, -0.7449716, -1.734057, 1, 0.5764706, 0, 1,
-1.306691, -0.7274178, -2.331398, 1, 0.5803922, 0, 1,
-1.287253, -1.086091, -2.69489, 1, 0.5882353, 0, 1,
-1.285799, -0.2221552, -2.442906, 1, 0.5921569, 0, 1,
-1.276583, 0.1120348, -1.74134, 1, 0.6, 0, 1,
-1.275056, -0.3233751, -0.3037744, 1, 0.6078432, 0, 1,
-1.264645, -0.2074485, -1.110893, 1, 0.6117647, 0, 1,
-1.261444, -1.179535, -2.945529, 1, 0.6196079, 0, 1,
-1.248471, -0.5435819, -2.224775, 1, 0.6235294, 0, 1,
-1.246225, -0.1481525, -1.976179, 1, 0.6313726, 0, 1,
-1.245171, 0.1244687, -0.2666745, 1, 0.6352941, 0, 1,
-1.244116, 0.2352694, 0.8732675, 1, 0.6431373, 0, 1,
-1.223334, -0.8763248, -1.935414, 1, 0.6470588, 0, 1,
-1.222577, 0.2186169, -1.092299, 1, 0.654902, 0, 1,
-1.212046, 0.1025756, -1.188439, 1, 0.6588235, 0, 1,
-1.210922, -0.4683581, -1.484483, 1, 0.6666667, 0, 1,
-1.205239, 0.6437309, -0.4275132, 1, 0.6705883, 0, 1,
-1.190275, 0.6717625, -1.270723, 1, 0.6784314, 0, 1,
-1.184596, 0.3421329, -1.528006, 1, 0.682353, 0, 1,
-1.177937, -2.541716, -3.885574, 1, 0.6901961, 0, 1,
-1.173278, 0.4802091, -1.049739, 1, 0.6941177, 0, 1,
-1.167899, -2.063832, -2.560238, 1, 0.7019608, 0, 1,
-1.15977, -0.5167782, -2.238417, 1, 0.7098039, 0, 1,
-1.151462, -1.353676, -3.536825, 1, 0.7137255, 0, 1,
-1.149591, 0.1104267, -0.211043, 1, 0.7215686, 0, 1,
-1.145518, -0.6635154, -1.158265, 1, 0.7254902, 0, 1,
-1.140128, -1.309584, -2.375585, 1, 0.7333333, 0, 1,
-1.138923, -1.573037, -2.14642, 1, 0.7372549, 0, 1,
-1.134668, -0.7455087, -2.489092, 1, 0.7450981, 0, 1,
-1.122353, 1.526419, 0.7406558, 1, 0.7490196, 0, 1,
-1.121396, 1.866044, -0.2304672, 1, 0.7568628, 0, 1,
-1.111482, 0.09640413, -0.2530726, 1, 0.7607843, 0, 1,
-1.107138, -0.9851338, -3.380571, 1, 0.7686275, 0, 1,
-1.105262, -1.309823, -1.878135, 1, 0.772549, 0, 1,
-1.104901, -0.4749623, -1.460717, 1, 0.7803922, 0, 1,
-1.092558, 0.9628491, -0.8915004, 1, 0.7843137, 0, 1,
-1.088379, 0.715257, -2.607447, 1, 0.7921569, 0, 1,
-1.079479, 1.13965, -0.7821698, 1, 0.7960784, 0, 1,
-1.077016, 0.4561915, 0.2425048, 1, 0.8039216, 0, 1,
-1.076007, 2.410033, 1.0561, 1, 0.8117647, 0, 1,
-1.072345, -0.2520467, -1.849105, 1, 0.8156863, 0, 1,
-1.070684, -1.48343, -2.150198, 1, 0.8235294, 0, 1,
-1.069245, 0.8939434, 1.289076, 1, 0.827451, 0, 1,
-1.063079, 0.6867532, -0.9634671, 1, 0.8352941, 0, 1,
-1.062656, 0.6409687, -0.2286511, 1, 0.8392157, 0, 1,
-1.061443, 1.627545, -1.269919, 1, 0.8470588, 0, 1,
-1.060004, 0.09139017, 0.6530278, 1, 0.8509804, 0, 1,
-1.056218, 1.38585, 1.353692, 1, 0.8588235, 0, 1,
-1.055077, -0.244427, -1.595234, 1, 0.8627451, 0, 1,
-1.050147, -0.3964876, -2.457111, 1, 0.8705882, 0, 1,
-1.040225, -0.004181071, -2.488104, 1, 0.8745098, 0, 1,
-1.029515, -0.9611262, -2.877853, 1, 0.8823529, 0, 1,
-1.022878, -0.3338611, -3.051327, 1, 0.8862745, 0, 1,
-1.009502, 0.3531087, -2.961881, 1, 0.8941177, 0, 1,
-0.9896958, 0.4948677, -2.351572, 1, 0.8980392, 0, 1,
-0.9828745, 0.5519226, -1.058851, 1, 0.9058824, 0, 1,
-0.9819555, -0.637935, -2.504627, 1, 0.9137255, 0, 1,
-0.9813849, 1.393133, 0.9598535, 1, 0.9176471, 0, 1,
-0.9757605, -2.194602, -2.63219, 1, 0.9254902, 0, 1,
-0.9678072, -0.4816274, -1.957181, 1, 0.9294118, 0, 1,
-0.950931, -1.999515, -1.554369, 1, 0.9372549, 0, 1,
-0.9453071, -0.06554136, -1.981004, 1, 0.9411765, 0, 1,
-0.9415061, 0.3782862, -0.9169149, 1, 0.9490196, 0, 1,
-0.9361875, -1.113399, -2.932719, 1, 0.9529412, 0, 1,
-0.9356261, 0.7515836, 0.123539, 1, 0.9607843, 0, 1,
-0.9354002, -0.09019958, 0.2796592, 1, 0.9647059, 0, 1,
-0.9348278, -0.04670622, -0.5699862, 1, 0.972549, 0, 1,
-0.931262, 1.165731, -2.722905, 1, 0.9764706, 0, 1,
-0.9260083, 0.2062498, -0.5117158, 1, 0.9843137, 0, 1,
-0.9187081, 1.360224, -1.722421, 1, 0.9882353, 0, 1,
-0.9182582, -0.05001278, -2.114191, 1, 0.9960784, 0, 1,
-0.9180952, -0.1993148, -1.594475, 0.9960784, 1, 0, 1,
-0.9177789, 0.5576235, -1.08944, 0.9921569, 1, 0, 1,
-0.9168829, 0.2314676, -1.17153, 0.9843137, 1, 0, 1,
-0.9084679, -0.2108346, -1.363016, 0.9803922, 1, 0, 1,
-0.9080754, -0.1359725, -0.1922849, 0.972549, 1, 0, 1,
-0.9051194, 0.3850265, -2.399125, 0.9686275, 1, 0, 1,
-0.8963311, 0.212999, -0.08728595, 0.9607843, 1, 0, 1,
-0.8946561, 0.4914002, -1.934765, 0.9568627, 1, 0, 1,
-0.8938515, -1.598162, -1.297166, 0.9490196, 1, 0, 1,
-0.8796687, -1.755851, -1.915597, 0.945098, 1, 0, 1,
-0.8778923, 1.583045, 0.8044391, 0.9372549, 1, 0, 1,
-0.8750091, -1.000737, -3.062121, 0.9333333, 1, 0, 1,
-0.874346, -0.3905716, -1.294764, 0.9254902, 1, 0, 1,
-0.8676487, 1.024007, -1.286114, 0.9215686, 1, 0, 1,
-0.8653764, 0.939265, -1.892086, 0.9137255, 1, 0, 1,
-0.8651235, 0.1138793, -1.330719, 0.9098039, 1, 0, 1,
-0.8627418, -0.2709171, -1.23041, 0.9019608, 1, 0, 1,
-0.8590568, -1.090737, -1.523872, 0.8941177, 1, 0, 1,
-0.8560196, -0.2132141, -2.022059, 0.8901961, 1, 0, 1,
-0.8492054, -0.05319356, -2.536216, 0.8823529, 1, 0, 1,
-0.8482003, -1.212116, -3.618413, 0.8784314, 1, 0, 1,
-0.8426763, 0.4300815, -0.0967726, 0.8705882, 1, 0, 1,
-0.8395071, 0.2679583, -1.115409, 0.8666667, 1, 0, 1,
-0.8390346, -0.2430723, -2.794676, 0.8588235, 1, 0, 1,
-0.8348046, -0.699719, -3.163497, 0.854902, 1, 0, 1,
-0.8346293, -0.4090133, -2.976556, 0.8470588, 1, 0, 1,
-0.8324983, 1.119881, 0.8091955, 0.8431373, 1, 0, 1,
-0.8276051, 0.6963639, -0.3312918, 0.8352941, 1, 0, 1,
-0.8259953, -1.490089, -3.241438, 0.8313726, 1, 0, 1,
-0.8206292, 1.168593, -0.7620488, 0.8235294, 1, 0, 1,
-0.8133729, 0.4420897, -1.72873, 0.8196079, 1, 0, 1,
-0.8122391, -1.172107, -2.790683, 0.8117647, 1, 0, 1,
-0.8076566, -0.3643248, -1.76451, 0.8078431, 1, 0, 1,
-0.8074035, 2.443365, -2.240496, 0.8, 1, 0, 1,
-0.8011855, -0.008770379, -1.322071, 0.7921569, 1, 0, 1,
-0.8004685, -0.776614, -2.219264, 0.7882353, 1, 0, 1,
-0.7974705, 0.7911515, -0.6985315, 0.7803922, 1, 0, 1,
-0.7922603, -1.963874, -3.129751, 0.7764706, 1, 0, 1,
-0.7890016, -0.8674123, -1.874656, 0.7686275, 1, 0, 1,
-0.784427, -0.1169736, -1.914729, 0.7647059, 1, 0, 1,
-0.7806944, 0.2281915, -1.870804, 0.7568628, 1, 0, 1,
-0.7798676, -0.9873837, -1.900475, 0.7529412, 1, 0, 1,
-0.7707334, -0.02353221, -1.412561, 0.7450981, 1, 0, 1,
-0.7651922, 1.077956, -0.055014, 0.7411765, 1, 0, 1,
-0.763229, 1.00732, -1.672386, 0.7333333, 1, 0, 1,
-0.7629411, 1.217934, -1.204882, 0.7294118, 1, 0, 1,
-0.7626255, -0.1217586, -1.207102, 0.7215686, 1, 0, 1,
-0.7607125, 0.6383193, -3.38298, 0.7176471, 1, 0, 1,
-0.7595497, 0.6898659, -1.200064, 0.7098039, 1, 0, 1,
-0.7579563, 0.1289398, -0.8854599, 0.7058824, 1, 0, 1,
-0.7526271, -1.147093, -2.866569, 0.6980392, 1, 0, 1,
-0.7488474, -0.3474541, -3.064148, 0.6901961, 1, 0, 1,
-0.7461708, -0.2757736, -1.549953, 0.6862745, 1, 0, 1,
-0.7440861, 0.4162972, -0.2534516, 0.6784314, 1, 0, 1,
-0.7397155, -1.471381, -2.137306, 0.6745098, 1, 0, 1,
-0.7366403, 1.329201, -0.4611444, 0.6666667, 1, 0, 1,
-0.7306818, -0.8377625, -1.769647, 0.6627451, 1, 0, 1,
-0.7302957, 1.139141, -0.4656579, 0.654902, 1, 0, 1,
-0.7296662, -1.650262, -3.859677, 0.6509804, 1, 0, 1,
-0.7282451, 1.615012, -0.5916433, 0.6431373, 1, 0, 1,
-0.7282217, -0.3147775, -0.9587994, 0.6392157, 1, 0, 1,
-0.7272083, 0.1412126, 0.03824459, 0.6313726, 1, 0, 1,
-0.7263744, 2.187438, -0.9584057, 0.627451, 1, 0, 1,
-0.7223074, 0.5526413, -1.177005, 0.6196079, 1, 0, 1,
-0.7209626, -0.4360047, -3.73482, 0.6156863, 1, 0, 1,
-0.7153547, -1.029593, -2.913497, 0.6078432, 1, 0, 1,
-0.7144997, 2.055887, -0.6593351, 0.6039216, 1, 0, 1,
-0.7104625, 0.2274075, -2.034502, 0.5960785, 1, 0, 1,
-0.7080672, 0.282879, -0.7289057, 0.5882353, 1, 0, 1,
-0.6971548, 0.4969447, -0.9967999, 0.5843138, 1, 0, 1,
-0.6935652, -1.260855, -4.585324, 0.5764706, 1, 0, 1,
-0.6930307, -0.05097117, -1.981632, 0.572549, 1, 0, 1,
-0.6920747, 1.075893, 0.2539585, 0.5647059, 1, 0, 1,
-0.6891018, 0.6627614, -0.8526625, 0.5607843, 1, 0, 1,
-0.6837465, -0.9391394, -0.02535958, 0.5529412, 1, 0, 1,
-0.6823912, 0.2435318, -0.4374058, 0.5490196, 1, 0, 1,
-0.6820741, 2.054894, -0.1999403, 0.5411765, 1, 0, 1,
-0.6783406, -1.634309, -5.190056, 0.5372549, 1, 0, 1,
-0.6770306, -1.122768, -2.924868, 0.5294118, 1, 0, 1,
-0.6701506, -0.01047047, -1.926328, 0.5254902, 1, 0, 1,
-0.6696914, 2.318413, 0.1162541, 0.5176471, 1, 0, 1,
-0.6684741, -0.8421245, -2.870854, 0.5137255, 1, 0, 1,
-0.6652502, -0.2538814, -1.969978, 0.5058824, 1, 0, 1,
-0.6598399, -2.118809, -1.620071, 0.5019608, 1, 0, 1,
-0.6594827, 0.62761, -4.632247, 0.4941176, 1, 0, 1,
-0.6590546, -0.09713848, -2.266289, 0.4862745, 1, 0, 1,
-0.6587843, -0.9489796, -2.504052, 0.4823529, 1, 0, 1,
-0.6559596, 0.7631035, -1.21327, 0.4745098, 1, 0, 1,
-0.6530887, 1.408152, -1.141594, 0.4705882, 1, 0, 1,
-0.6525287, -0.878063, -2.024616, 0.4627451, 1, 0, 1,
-0.6520459, 0.6014979, -1.232605, 0.4588235, 1, 0, 1,
-0.6455703, -0.2791862, -1.737412, 0.4509804, 1, 0, 1,
-0.6412525, 0.5926514, -0.665952, 0.4470588, 1, 0, 1,
-0.6397893, 2.261482, -1.076035, 0.4392157, 1, 0, 1,
-0.6395689, 0.1385121, -2.138715, 0.4352941, 1, 0, 1,
-0.6365197, 0.4290613, -1.643301, 0.427451, 1, 0, 1,
-0.6289458, -1.82029, -4.814734, 0.4235294, 1, 0, 1,
-0.6276307, 0.275082, -2.828049, 0.4156863, 1, 0, 1,
-0.626159, 0.5056124, -0.8600059, 0.4117647, 1, 0, 1,
-0.6197639, -1.294814, -3.441559, 0.4039216, 1, 0, 1,
-0.6148903, 0.7092087, -2.270927, 0.3960784, 1, 0, 1,
-0.6147215, 1.668352, 0.5515066, 0.3921569, 1, 0, 1,
-0.6128306, -1.687809, -4.145903, 0.3843137, 1, 0, 1,
-0.6102929, 0.8880015, -1.007184, 0.3803922, 1, 0, 1,
-0.6053843, -0.9015622, -4.369369, 0.372549, 1, 0, 1,
-0.603875, -0.3984082, -2.052047, 0.3686275, 1, 0, 1,
-0.5960878, -0.1246577, -1.879995, 0.3607843, 1, 0, 1,
-0.5939588, 0.03286374, -0.7332192, 0.3568628, 1, 0, 1,
-0.5924202, 0.2783119, -2.091533, 0.3490196, 1, 0, 1,
-0.5908679, 1.363399, -1.903883, 0.345098, 1, 0, 1,
-0.5818159, -0.9272006, -2.187298, 0.3372549, 1, 0, 1,
-0.5779228, -0.05269698, -2.560551, 0.3333333, 1, 0, 1,
-0.5771877, -1.146618, -1.628802, 0.3254902, 1, 0, 1,
-0.5763836, -0.2345711, 0.3241044, 0.3215686, 1, 0, 1,
-0.5701295, -1.464987, -1.485767, 0.3137255, 1, 0, 1,
-0.5684355, 1.248986, -0.1581801, 0.3098039, 1, 0, 1,
-0.5638575, -1.278344, -2.849565, 0.3019608, 1, 0, 1,
-0.5619309, 1.711297, -0.1145326, 0.2941177, 1, 0, 1,
-0.5578977, 1.540246, 0.3599821, 0.2901961, 1, 0, 1,
-0.5562322, -1.345104, -2.805304, 0.282353, 1, 0, 1,
-0.5557017, 1.526195, 1.868243, 0.2784314, 1, 0, 1,
-0.5520057, 0.04812415, -1.582364, 0.2705882, 1, 0, 1,
-0.5492309, -1.748079, -2.578681, 0.2666667, 1, 0, 1,
-0.5435414, 1.090349, 1.132014, 0.2588235, 1, 0, 1,
-0.5434408, 0.7213064, 0.1584033, 0.254902, 1, 0, 1,
-0.5409951, -1.745754, -2.275557, 0.2470588, 1, 0, 1,
-0.5376545, -0.4251896, -1.681046, 0.2431373, 1, 0, 1,
-0.5343544, 0.8067066, -0.8979365, 0.2352941, 1, 0, 1,
-0.5294643, -0.3245653, -3.360825, 0.2313726, 1, 0, 1,
-0.5284062, -1.688072, -3.405767, 0.2235294, 1, 0, 1,
-0.5281793, -0.08650108, -0.5876116, 0.2196078, 1, 0, 1,
-0.5278257, 1.099828, 0.2693346, 0.2117647, 1, 0, 1,
-0.527257, -1.120006, -1.301347, 0.2078431, 1, 0, 1,
-0.525484, 0.6005137, -0.67656, 0.2, 1, 0, 1,
-0.5162303, 1.207023, 0.3208342, 0.1921569, 1, 0, 1,
-0.5145615, -0.1720379, -1.337851, 0.1882353, 1, 0, 1,
-0.5098481, -1.185989, -4.314143, 0.1803922, 1, 0, 1,
-0.5028063, -0.3167502, -1.790884, 0.1764706, 1, 0, 1,
-0.4963459, 0.1416127, -0.8005293, 0.1686275, 1, 0, 1,
-0.4959882, 1.512863, 0.2420201, 0.1647059, 1, 0, 1,
-0.4958097, -0.1623429, -3.058434, 0.1568628, 1, 0, 1,
-0.4946203, -0.5196601, -1.137702, 0.1529412, 1, 0, 1,
-0.4877172, -0.02805256, -1.559241, 0.145098, 1, 0, 1,
-0.4853413, 0.6470051, 0.1908144, 0.1411765, 1, 0, 1,
-0.4847082, -0.937152, -2.414792, 0.1333333, 1, 0, 1,
-0.4844088, -1.000311, -1.58133, 0.1294118, 1, 0, 1,
-0.4838059, -0.3505662, -3.575766, 0.1215686, 1, 0, 1,
-0.4818082, -0.07279808, -2.600191, 0.1176471, 1, 0, 1,
-0.4807767, 1.84727, -1.025179, 0.1098039, 1, 0, 1,
-0.476703, -0.867381, -1.408051, 0.1058824, 1, 0, 1,
-0.4726846, -0.655644, -2.905054, 0.09803922, 1, 0, 1,
-0.4699725, 0.1342047, -1.279636, 0.09019608, 1, 0, 1,
-0.4698223, 0.1036921, -1.360164, 0.08627451, 1, 0, 1,
-0.468435, -0.5868735, -1.724211, 0.07843138, 1, 0, 1,
-0.4671871, -0.2000916, -3.619548, 0.07450981, 1, 0, 1,
-0.4594333, 1.750106, 1.426578, 0.06666667, 1, 0, 1,
-0.4578231, 0.2846027, -0.05217002, 0.0627451, 1, 0, 1,
-0.4484156, 0.09674057, 0.2215018, 0.05490196, 1, 0, 1,
-0.444377, -0.7652938, -2.799087, 0.05098039, 1, 0, 1,
-0.4442627, 0.4278349, -0.3263567, 0.04313726, 1, 0, 1,
-0.4423245, -0.5198739, -2.939852, 0.03921569, 1, 0, 1,
-0.4408477, 0.4481494, 1.276906, 0.03137255, 1, 0, 1,
-0.4394683, 1.297562, -2.674767, 0.02745098, 1, 0, 1,
-0.4382675, 0.4774129, 0.1085774, 0.01960784, 1, 0, 1,
-0.436881, -0.3268165, -2.33713, 0.01568628, 1, 0, 1,
-0.4366083, -2.433514, -4.027039, 0.007843138, 1, 0, 1,
-0.4343535, -0.3494124, -3.545761, 0.003921569, 1, 0, 1,
-0.4286467, -0.9498785, -3.899959, 0, 1, 0.003921569, 1,
-0.4266517, -1.738011, -3.429865, 0, 1, 0.01176471, 1,
-0.4242551, -1.146802, -1.528478, 0, 1, 0.01568628, 1,
-0.4178579, 0.116667, -1.789038, 0, 1, 0.02352941, 1,
-0.4130972, -1.307417, -2.536909, 0, 1, 0.02745098, 1,
-0.4113803, 0.2514697, -2.377096, 0, 1, 0.03529412, 1,
-0.4099913, 1.084175, 0.7995576, 0, 1, 0.03921569, 1,
-0.4067288, -0.4879239, 1.131578, 0, 1, 0.04705882, 1,
-0.4038009, -0.778142, -3.36419, 0, 1, 0.05098039, 1,
-0.4019758, 0.3742038, -1.488747, 0, 1, 0.05882353, 1,
-0.395143, 0.1369168, -1.764915, 0, 1, 0.0627451, 1,
-0.3944438, 1.408913, 1.29656, 0, 1, 0.07058824, 1,
-0.3910116, -0.5621163, -3.23878, 0, 1, 0.07450981, 1,
-0.3839189, -0.04258016, -2.063824, 0, 1, 0.08235294, 1,
-0.38331, 1.07005, -1.64805, 0, 1, 0.08627451, 1,
-0.3827969, 0.6433471, 0.07539085, 0, 1, 0.09411765, 1,
-0.3789822, 0.6632491, -1.318592, 0, 1, 0.1019608, 1,
-0.3770875, -2.009598, -2.24532, 0, 1, 0.1058824, 1,
-0.3751824, 0.0973257, -1.380522, 0, 1, 0.1137255, 1,
-0.3704672, -1.497653, -2.895206, 0, 1, 0.1176471, 1,
-0.368586, -1.566425, -3.054752, 0, 1, 0.1254902, 1,
-0.3667646, -1.199312, -1.063468, 0, 1, 0.1294118, 1,
-0.3659949, 2.04039, -1.909914, 0, 1, 0.1372549, 1,
-0.3640522, 0.04726733, -0.3804032, 0, 1, 0.1411765, 1,
-0.3638593, 0.7711585, 1.665842, 0, 1, 0.1490196, 1,
-0.3637607, -0.6998066, -3.949522, 0, 1, 0.1529412, 1,
-0.3624212, -0.3389171, -2.638661, 0, 1, 0.1607843, 1,
-0.3606733, 0.004451385, -2.268009, 0, 1, 0.1647059, 1,
-0.3577149, 1.465671, -0.124575, 0, 1, 0.172549, 1,
-0.3568472, -1.085902, -2.730145, 0, 1, 0.1764706, 1,
-0.3557596, -0.5370687, -2.981657, 0, 1, 0.1843137, 1,
-0.3546262, 0.2097459, -1.040302, 0, 1, 0.1882353, 1,
-0.3532669, -0.7329262, -3.64527, 0, 1, 0.1960784, 1,
-0.3526983, 0.8474265, 0.001666414, 0, 1, 0.2039216, 1,
-0.348967, -0.3200939, -3.661771, 0, 1, 0.2078431, 1,
-0.3462053, -2.441476, -3.047154, 0, 1, 0.2156863, 1,
-0.3430199, 2.09198, 0.7458692, 0, 1, 0.2196078, 1,
-0.3421742, 0.4174905, -1.539109, 0, 1, 0.227451, 1,
-0.3421054, -0.3811444, -2.148722, 0, 1, 0.2313726, 1,
-0.3396498, 0.9467003, -2.598262, 0, 1, 0.2392157, 1,
-0.3382128, 0.6748884, 0.3943588, 0, 1, 0.2431373, 1,
-0.3347874, 0.2015136, -0.9581428, 0, 1, 0.2509804, 1,
-0.3297329, 0.1271618, -1.638384, 0, 1, 0.254902, 1,
-0.3279234, -1.99646, -4.27465, 0, 1, 0.2627451, 1,
-0.324104, 1.01272, -0.5242509, 0, 1, 0.2666667, 1,
-0.3230855, -0.3836003, -0.6520585, 0, 1, 0.2745098, 1,
-0.3212931, 1.612547, -0.5278906, 0, 1, 0.2784314, 1,
-0.3179369, -0.09207869, -1.846885, 0, 1, 0.2862745, 1,
-0.3143474, -0.05349822, -0.2271937, 0, 1, 0.2901961, 1,
-0.3050022, -0.4515924, -2.246263, 0, 1, 0.2980392, 1,
-0.3018628, 0.08352205, -1.177396, 0, 1, 0.3058824, 1,
-0.3015324, -0.5236753, -3.417674, 0, 1, 0.3098039, 1,
-0.2979706, 1.824124, -0.4925254, 0, 1, 0.3176471, 1,
-0.2927888, -1.05959, -3.203763, 0, 1, 0.3215686, 1,
-0.2879348, -0.9918399, -2.20654, 0, 1, 0.3294118, 1,
-0.2865017, 0.2795452, -0.734103, 0, 1, 0.3333333, 1,
-0.28611, -1.066408, -3.003496, 0, 1, 0.3411765, 1,
-0.2836008, 1.264193, 0.3490331, 0, 1, 0.345098, 1,
-0.2827923, -0.3437894, -3.169156, 0, 1, 0.3529412, 1,
-0.2732154, -0.5388741, -3.259347, 0, 1, 0.3568628, 1,
-0.2666445, -0.5998582, -1.836253, 0, 1, 0.3647059, 1,
-0.2650898, -3.020043, -2.974392, 0, 1, 0.3686275, 1,
-0.2646412, -1.659094, -4.150065, 0, 1, 0.3764706, 1,
-0.2585785, 0.03369689, -0.2746491, 0, 1, 0.3803922, 1,
-0.2562649, -1.849987, -2.309705, 0, 1, 0.3882353, 1,
-0.2558405, 1.201181, 0.307741, 0, 1, 0.3921569, 1,
-0.2513602, 0.373172, -1.602257, 0, 1, 0.4, 1,
-0.2458573, 0.8636093, 0.1115732, 0, 1, 0.4078431, 1,
-0.2331099, -0.2988999, -4.228333, 0, 1, 0.4117647, 1,
-0.2327363, -0.1850343, -1.871009, 0, 1, 0.4196078, 1,
-0.2307591, 0.1284741, -1.445415, 0, 1, 0.4235294, 1,
-0.2269931, 0.7116599, -1.114551, 0, 1, 0.4313726, 1,
-0.2268752, -1.73429, -2.56472, 0, 1, 0.4352941, 1,
-0.2237299, -1.548656, -2.836046, 0, 1, 0.4431373, 1,
-0.2177196, 0.8035222, -0.3962885, 0, 1, 0.4470588, 1,
-0.212263, 0.824891, -1.522213, 0, 1, 0.454902, 1,
-0.2078981, -1.055138, -3.538913, 0, 1, 0.4588235, 1,
-0.2070085, -0.3877169, -2.356821, 0, 1, 0.4666667, 1,
-0.2063811, 1.451281, 1.950898, 0, 1, 0.4705882, 1,
-0.2048547, -0.391905, -2.779534, 0, 1, 0.4784314, 1,
-0.2010198, 0.1327523, -0.9556825, 0, 1, 0.4823529, 1,
-0.1984104, -0.4032789, -3.349281, 0, 1, 0.4901961, 1,
-0.1963103, 0.05645781, -2.08535, 0, 1, 0.4941176, 1,
-0.1926842, 1.679748, 1.31394, 0, 1, 0.5019608, 1,
-0.1918617, 0.4033733, -0.01733946, 0, 1, 0.509804, 1,
-0.1900857, -0.5093867, -3.085723, 0, 1, 0.5137255, 1,
-0.1845714, -0.4000421, -1.931343, 0, 1, 0.5215687, 1,
-0.1789038, 0.3233782, 0.2972344, 0, 1, 0.5254902, 1,
-0.1762429, -0.2606282, -2.477933, 0, 1, 0.5333334, 1,
-0.1760935, 0.08958501, -1.144833, 0, 1, 0.5372549, 1,
-0.1708445, -0.9732705, -4.954045, 0, 1, 0.5450981, 1,
-0.1708345, 0.9419613, -1.163766, 0, 1, 0.5490196, 1,
-0.1683986, 0.07688854, -1.325458, 0, 1, 0.5568628, 1,
-0.1640565, 0.2586606, 0.9306929, 0, 1, 0.5607843, 1,
-0.1618576, 1.346765, 1.130616, 0, 1, 0.5686275, 1,
-0.1613007, -1.114395, -4.761022, 0, 1, 0.572549, 1,
-0.1602651, -1.053604, -2.384076, 0, 1, 0.5803922, 1,
-0.1600484, 1.044907, -1.088117, 0, 1, 0.5843138, 1,
-0.1588882, 1.195236, -1.557879, 0, 1, 0.5921569, 1,
-0.1496874, 0.4749722, -0.6214666, 0, 1, 0.5960785, 1,
-0.148737, 0.9205415, 1.039491, 0, 1, 0.6039216, 1,
-0.1483704, -1.309745, -0.4537327, 0, 1, 0.6117647, 1,
-0.1436921, 0.9595694, -1.553612, 0, 1, 0.6156863, 1,
-0.1420298, 0.5943321, -1.228941, 0, 1, 0.6235294, 1,
-0.1403245, 1.052463, 0.971361, 0, 1, 0.627451, 1,
-0.1399723, 0.2311608, -0.2160691, 0, 1, 0.6352941, 1,
-0.1398928, 0.1125, -0.9053463, 0, 1, 0.6392157, 1,
-0.1355529, -1.337349, -2.312853, 0, 1, 0.6470588, 1,
-0.1337543, 1.528387, 1.498378, 0, 1, 0.6509804, 1,
-0.1325836, -0.4638701, -1.42466, 0, 1, 0.6588235, 1,
-0.1285687, -0.5869743, -3.95601, 0, 1, 0.6627451, 1,
-0.1226299, -0.7786109, -3.57596, 0, 1, 0.6705883, 1,
-0.1208996, 1.734074, 1.448916, 0, 1, 0.6745098, 1,
-0.1180393, 0.7412068, 0.3166282, 0, 1, 0.682353, 1,
-0.1145543, 2.058448, -0.7190964, 0, 1, 0.6862745, 1,
-0.1139358, -1.86087, -2.149759, 0, 1, 0.6941177, 1,
-0.1138177, 0.7373152, -0.5298315, 0, 1, 0.7019608, 1,
-0.1108453, 0.897546, 0.3999085, 0, 1, 0.7058824, 1,
-0.110837, 0.3529767, -0.6822393, 0, 1, 0.7137255, 1,
-0.1080621, 1.4754, 1.673803, 0, 1, 0.7176471, 1,
-0.1070982, -2.073493, -2.465933, 0, 1, 0.7254902, 1,
-0.1070644, -0.5314365, -4.321915, 0, 1, 0.7294118, 1,
-0.1057207, 0.9233116, -1.5367, 0, 1, 0.7372549, 1,
-0.1052683, 0.3085282, -0.1200707, 0, 1, 0.7411765, 1,
-0.1048893, -1.689195, -2.574752, 0, 1, 0.7490196, 1,
-0.1024525, 0.834192, 0.3182177, 0, 1, 0.7529412, 1,
-0.0983654, -1.616538, -4.339923, 0, 1, 0.7607843, 1,
-0.0936771, 1.378088, 1.037658, 0, 1, 0.7647059, 1,
-0.0920462, -2.197097, -3.470163, 0, 1, 0.772549, 1,
-0.08843232, -0.254748, -2.651986, 0, 1, 0.7764706, 1,
-0.08615226, -1.995109, -2.881791, 0, 1, 0.7843137, 1,
-0.08548056, 0.2364112, 1.429928, 0, 1, 0.7882353, 1,
-0.08377348, 0.9901235, -0.4672103, 0, 1, 0.7960784, 1,
-0.08311228, 0.5037915, -1.182434, 0, 1, 0.8039216, 1,
-0.0814463, -0.4798108, -0.8797061, 0, 1, 0.8078431, 1,
-0.07954887, 0.1529998, -0.2917554, 0, 1, 0.8156863, 1,
-0.07835917, -0.5078129, -3.498074, 0, 1, 0.8196079, 1,
-0.07653601, -0.8130025, -3.5181, 0, 1, 0.827451, 1,
-0.07379798, 0.8369778, 0.3761323, 0, 1, 0.8313726, 1,
-0.07298163, -0.2686674, -3.966954, 0, 1, 0.8392157, 1,
-0.07002103, -2.329969, -3.790024, 0, 1, 0.8431373, 1,
-0.06859618, -0.4810953, -2.804633, 0, 1, 0.8509804, 1,
-0.06670257, -0.8967222, -2.906075, 0, 1, 0.854902, 1,
-0.0635415, 0.6351043, 2.513472, 0, 1, 0.8627451, 1,
-0.05677939, 1.478857, 0.6001895, 0, 1, 0.8666667, 1,
-0.05460186, -0.2819521, -2.774259, 0, 1, 0.8745098, 1,
-0.0544334, 1.394408, 0.9181763, 0, 1, 0.8784314, 1,
-0.0528347, -0.09661975, -2.805575, 0, 1, 0.8862745, 1,
-0.05238188, -0.2700279, -1.997268, 0, 1, 0.8901961, 1,
-0.0495538, 0.4113538, 0.7902367, 0, 1, 0.8980392, 1,
-0.04762878, 0.09204444, -0.1117848, 0, 1, 0.9058824, 1,
-0.04170211, 0.6002952, 0.6085635, 0, 1, 0.9098039, 1,
-0.03918823, -1.129706, -5.053722, 0, 1, 0.9176471, 1,
-0.03779075, -0.5228497, -3.525001, 0, 1, 0.9215686, 1,
-0.03733688, -0.7591792, -3.061049, 0, 1, 0.9294118, 1,
-0.03522838, 0.688043, -1.10161, 0, 1, 0.9333333, 1,
-0.03384188, -1.593008, -3.987419, 0, 1, 0.9411765, 1,
-0.03321626, -1.557572, -2.273352, 0, 1, 0.945098, 1,
-0.03081357, -1.563701, -4.230099, 0, 1, 0.9529412, 1,
-0.02876993, 1.427902, -0.3551698, 0, 1, 0.9568627, 1,
-0.02775141, -1.59548, -3.062704, 0, 1, 0.9647059, 1,
-0.02595426, 1.902476, 1.392179, 0, 1, 0.9686275, 1,
-0.02485231, -0.03250796, -2.098191, 0, 1, 0.9764706, 1,
-0.02188753, 1.182993, 1.86721, 0, 1, 0.9803922, 1,
-0.01868737, -0.9737174, -4.462539, 0, 1, 0.9882353, 1,
-0.01257036, -0.8979855, -3.294924, 0, 1, 0.9921569, 1,
-0.01091759, -1.859696, -2.920347, 0, 1, 1, 1,
-0.01039724, 0.7804554, -0.4253682, 0, 0.9921569, 1, 1,
-0.008972211, -0.9029288, -2.891368, 0, 0.9882353, 1, 1,
-0.002975023, 1.511108, -0.3544171, 0, 0.9803922, 1, 1,
-0.002562635, -0.3229111, -2.170651, 0, 0.9764706, 1, 1,
-0.001954299, -0.2088934, -4.336942, 0, 0.9686275, 1, 1,
-0.0004103207, 2.28056, -0.3684619, 0, 0.9647059, 1, 1,
0.001299749, -0.6749878, 5.867774, 0, 0.9568627, 1, 1,
0.002531544, 1.868539, 0.9562995, 0, 0.9529412, 1, 1,
0.009428729, 1.199139, -0.1067698, 0, 0.945098, 1, 1,
0.01543663, -0.4700346, 2.551836, 0, 0.9411765, 1, 1,
0.0170678, 0.2791534, 0.0974559, 0, 0.9333333, 1, 1,
0.02056156, -0.676264, 4.019324, 0, 0.9294118, 1, 1,
0.02594968, -0.4214888, 2.935675, 0, 0.9215686, 1, 1,
0.02956097, -0.3801437, 2.870142, 0, 0.9176471, 1, 1,
0.03381039, 0.044692, 0.02074143, 0, 0.9098039, 1, 1,
0.03416971, 0.1233575, -0.8476728, 0, 0.9058824, 1, 1,
0.03653444, 0.5328146, -2.945969, 0, 0.8980392, 1, 1,
0.03724256, -0.8326717, 0.9155135, 0, 0.8901961, 1, 1,
0.03772977, 0.7738793, -0.4662701, 0, 0.8862745, 1, 1,
0.04151423, 0.05110938, 0.268962, 0, 0.8784314, 1, 1,
0.0453849, 0.03772321, 1.020629, 0, 0.8745098, 1, 1,
0.04654206, 0.7556884, -1.241569, 0, 0.8666667, 1, 1,
0.04752402, -0.03140125, 1.566965, 0, 0.8627451, 1, 1,
0.05270934, 0.1348246, 0.6321412, 0, 0.854902, 1, 1,
0.05298181, 0.4398448, 1.024809, 0, 0.8509804, 1, 1,
0.05307132, -0.08287244, 2.807754, 0, 0.8431373, 1, 1,
0.05671342, -0.04967759, 2.118385, 0, 0.8392157, 1, 1,
0.05709746, 0.4613831, -0.7706447, 0, 0.8313726, 1, 1,
0.05812999, 0.773841, -0.6807411, 0, 0.827451, 1, 1,
0.06196665, 1.08777, 1.070192, 0, 0.8196079, 1, 1,
0.06231704, -1.780439, 4.161803, 0, 0.8156863, 1, 1,
0.06367832, -0.9856048, 2.438165, 0, 0.8078431, 1, 1,
0.06408435, -1.209742, 2.779863, 0, 0.8039216, 1, 1,
0.06901305, -0.1402663, 2.924501, 0, 0.7960784, 1, 1,
0.0706633, -0.9376739, 3.885452, 0, 0.7882353, 1, 1,
0.07646328, -0.4343556, 4.576128, 0, 0.7843137, 1, 1,
0.07920141, -0.2726653, 2.732169, 0, 0.7764706, 1, 1,
0.0795184, 0.1635119, -0.1008904, 0, 0.772549, 1, 1,
0.0824333, -0.9996483, 2.715363, 0, 0.7647059, 1, 1,
0.08304951, 0.1669707, -0.8992944, 0, 0.7607843, 1, 1,
0.08410116, -0.3205293, 1.157406, 0, 0.7529412, 1, 1,
0.08460859, -1.009011, 2.200749, 0, 0.7490196, 1, 1,
0.08807152, -1.593583, 2.961511, 0, 0.7411765, 1, 1,
0.09014681, -0.462666, 3.421207, 0, 0.7372549, 1, 1,
0.09098785, 0.001377188, 0.2660925, 0, 0.7294118, 1, 1,
0.09794197, -1.326314, 1.849918, 0, 0.7254902, 1, 1,
0.100448, -0.5466486, 4.603955, 0, 0.7176471, 1, 1,
0.1011821, -0.1033649, 0.308311, 0, 0.7137255, 1, 1,
0.1051497, -0.5740503, 3.20133, 0, 0.7058824, 1, 1,
0.1053678, 1.026252, -0.9402922, 0, 0.6980392, 1, 1,
0.1079224, -0.1524332, 3.805926, 0, 0.6941177, 1, 1,
0.1107645, -1.057114, 2.906212, 0, 0.6862745, 1, 1,
0.1111527, 1.523668, 1.665005, 0, 0.682353, 1, 1,
0.1117454, -0.6563964, 3.573023, 0, 0.6745098, 1, 1,
0.1130118, -2.018219, 2.218942, 0, 0.6705883, 1, 1,
0.1140056, -1.604131, 1.896302, 0, 0.6627451, 1, 1,
0.1152337, -1.618032, 2.880604, 0, 0.6588235, 1, 1,
0.1186713, -1.017102, 2.025717, 0, 0.6509804, 1, 1,
0.1220686, 0.5076554, -0.1374513, 0, 0.6470588, 1, 1,
0.1245391, -0.3303818, 2.574504, 0, 0.6392157, 1, 1,
0.1262826, 0.325753, -0.2075984, 0, 0.6352941, 1, 1,
0.1287664, -0.6903119, 3.966429, 0, 0.627451, 1, 1,
0.1314793, -1.492636, 1.260314, 0, 0.6235294, 1, 1,
0.1346364, -0.9110407, 0.7773315, 0, 0.6156863, 1, 1,
0.139232, -1.471064, 2.568316, 0, 0.6117647, 1, 1,
0.1427088, -1.167559, 1.496493, 0, 0.6039216, 1, 1,
0.1438864, -0.6665955, 3.016072, 0, 0.5960785, 1, 1,
0.1454457, -1.636986, 5.082574, 0, 0.5921569, 1, 1,
0.1460028, 1.667694, 0.3727832, 0, 0.5843138, 1, 1,
0.1460939, 0.2467481, 0.2542498, 0, 0.5803922, 1, 1,
0.1474751, -2.252326, 1.288542, 0, 0.572549, 1, 1,
0.1484507, -0.4513909, 2.809541, 0, 0.5686275, 1, 1,
0.1516571, 0.4344614, 1.665604, 0, 0.5607843, 1, 1,
0.1540279, 1.858842, 0.8731102, 0, 0.5568628, 1, 1,
0.1558797, -0.6252532, 3.527658, 0, 0.5490196, 1, 1,
0.1573224, 0.1238705, 2.504003, 0, 0.5450981, 1, 1,
0.1592074, 0.3485657, 1.01881, 0, 0.5372549, 1, 1,
0.1635238, -2.51816, 3.440092, 0, 0.5333334, 1, 1,
0.1681253, 1.706992, 0.9630236, 0, 0.5254902, 1, 1,
0.1720835, 0.9454733, -0.3901463, 0, 0.5215687, 1, 1,
0.1731456, -0.4192536, 0.359091, 0, 0.5137255, 1, 1,
0.1746735, -1.393757, 2.550865, 0, 0.509804, 1, 1,
0.175649, 0.9902498, 1.76447, 0, 0.5019608, 1, 1,
0.1803441, -1.650709, 2.864951, 0, 0.4941176, 1, 1,
0.1877861, 1.594993, -0.0003173032, 0, 0.4901961, 1, 1,
0.1879911, 0.2115267, -1.263388, 0, 0.4823529, 1, 1,
0.1936032, 0.1147643, -0.2793163, 0, 0.4784314, 1, 1,
0.2014458, 0.341716, 2.097085, 0, 0.4705882, 1, 1,
0.2039557, -2.445086, 1.606704, 0, 0.4666667, 1, 1,
0.2056801, -0.3297895, 2.687528, 0, 0.4588235, 1, 1,
0.2095899, -0.650896, 3.574088, 0, 0.454902, 1, 1,
0.2116957, 0.1021696, 1.775507, 0, 0.4470588, 1, 1,
0.2128659, 0.3619334, -0.3778151, 0, 0.4431373, 1, 1,
0.2241666, -0.6297131, 2.095574, 0, 0.4352941, 1, 1,
0.230123, 2.445342, -0.2762426, 0, 0.4313726, 1, 1,
0.2332151, -1.278913, 2.537388, 0, 0.4235294, 1, 1,
0.2376004, 0.8045498, 1.746135, 0, 0.4196078, 1, 1,
0.2400455, 0.9253895, 2.404925, 0, 0.4117647, 1, 1,
0.2408136, -0.2526733, 3.463232, 0, 0.4078431, 1, 1,
0.2426604, -0.3102045, 1.931623, 0, 0.4, 1, 1,
0.2440465, -0.4440992, 2.672316, 0, 0.3921569, 1, 1,
0.2492387, -1.150343, 1.726785, 0, 0.3882353, 1, 1,
0.2512417, -0.5434061, 2.288425, 0, 0.3803922, 1, 1,
0.2514401, -0.2291184, 3.195789, 0, 0.3764706, 1, 1,
0.2515065, -0.1979118, 2.682259, 0, 0.3686275, 1, 1,
0.2525474, -0.2961883, 3.019421, 0, 0.3647059, 1, 1,
0.2533493, -1.332083, 2.162505, 0, 0.3568628, 1, 1,
0.2536191, 0.5372456, -0.2068566, 0, 0.3529412, 1, 1,
0.2578467, 0.8995723, 1.373013, 0, 0.345098, 1, 1,
0.2593175, -0.06160331, 1.141096, 0, 0.3411765, 1, 1,
0.2595721, 0.04019284, 1.0711, 0, 0.3333333, 1, 1,
0.2635585, -0.7658948, 4.765526, 0, 0.3294118, 1, 1,
0.2669268, -1.329517, 1.846256, 0, 0.3215686, 1, 1,
0.269779, -0.7781147, 1.850957, 0, 0.3176471, 1, 1,
0.2711648, -0.6417152, 0.8153805, 0, 0.3098039, 1, 1,
0.2738104, -0.7955881, 2.136993, 0, 0.3058824, 1, 1,
0.2744108, 0.3213153, 1.087286, 0, 0.2980392, 1, 1,
0.2830735, -0.08636925, 0.8224815, 0, 0.2901961, 1, 1,
0.2863022, -1.773663, 2.135085, 0, 0.2862745, 1, 1,
0.2888964, 0.9688938, 1.54954, 0, 0.2784314, 1, 1,
0.2976039, -1.135774, 2.355115, 0, 0.2745098, 1, 1,
0.297661, -0.3409758, 3.370393, 0, 0.2666667, 1, 1,
0.2977403, 0.5277248, -0.03529961, 0, 0.2627451, 1, 1,
0.2979037, -1.095062, 5.111113, 0, 0.254902, 1, 1,
0.2992646, 0.5220217, -0.02347471, 0, 0.2509804, 1, 1,
0.2993338, -0.05465564, 0.7167796, 0, 0.2431373, 1, 1,
0.3024178, 0.3271097, 2.973741, 0, 0.2392157, 1, 1,
0.3097034, 1.46376, 0.15253, 0, 0.2313726, 1, 1,
0.3130184, -1.229756, 2.435727, 0, 0.227451, 1, 1,
0.3135073, -0.1782558, 2.82301, 0, 0.2196078, 1, 1,
0.3142939, -1.982794, 3.230438, 0, 0.2156863, 1, 1,
0.319735, 1.165102, -0.8724902, 0, 0.2078431, 1, 1,
0.3229991, -2.094879, 3.635132, 0, 0.2039216, 1, 1,
0.3258813, 1.035637, -0.3343137, 0, 0.1960784, 1, 1,
0.326872, 1.331828, -0.7071946, 0, 0.1882353, 1, 1,
0.3270639, 0.1261698, 2.479975, 0, 0.1843137, 1, 1,
0.3271301, -0.9915147, 2.423898, 0, 0.1764706, 1, 1,
0.3276942, 1.700521, 2.860873, 0, 0.172549, 1, 1,
0.3322191, 2.318706, 1.360866, 0, 0.1647059, 1, 1,
0.3340222, 0.7676348, 0.2690671, 0, 0.1607843, 1, 1,
0.3364755, -0.9612485, 0.2480568, 0, 0.1529412, 1, 1,
0.3389894, -0.3178172, 3.447658, 0, 0.1490196, 1, 1,
0.3390834, -0.6032452, 3.388629, 0, 0.1411765, 1, 1,
0.3408436, -0.4927488, 2.39997, 0, 0.1372549, 1, 1,
0.3439654, -0.2197023, 1.511701, 0, 0.1294118, 1, 1,
0.3456421, 1.434751, 1.081816, 0, 0.1254902, 1, 1,
0.3456528, -1.26941, 3.008083, 0, 0.1176471, 1, 1,
0.3461921, 0.8147924, 0.1224166, 0, 0.1137255, 1, 1,
0.3529538, -0.4137283, 2.012434, 0, 0.1058824, 1, 1,
0.3572083, 1.591418, 0.1880064, 0, 0.09803922, 1, 1,
0.3576111, -1.64165, 0.9390608, 0, 0.09411765, 1, 1,
0.3583048, 0.6853411, 1.200201, 0, 0.08627451, 1, 1,
0.3647854, 0.5339122, 0.1708065, 0, 0.08235294, 1, 1,
0.3664691, 0.08318683, 0.3991097, 0, 0.07450981, 1, 1,
0.3673086, -2.13771, 4.318256, 0, 0.07058824, 1, 1,
0.3705657, -0.1609968, 3.503957, 0, 0.0627451, 1, 1,
0.3727815, 0.02646728, -0.4815042, 0, 0.05882353, 1, 1,
0.3734781, -0.677268, 2.346261, 0, 0.05098039, 1, 1,
0.3736221, -0.6198416, 3.66019, 0, 0.04705882, 1, 1,
0.3770465, -2.162917, 3.316914, 0, 0.03921569, 1, 1,
0.3804611, -0.7175215, 3.081154, 0, 0.03529412, 1, 1,
0.3827817, -1.564686, 2.82684, 0, 0.02745098, 1, 1,
0.3869515, 1.279105, -1.167035, 0, 0.02352941, 1, 1,
0.389248, -0.2517075, 2.481718, 0, 0.01568628, 1, 1,
0.392166, 2.514388, -1.494217, 0, 0.01176471, 1, 1,
0.3929369, 0.926556, -0.2176781, 0, 0.003921569, 1, 1,
0.39868, -0.7736115, 4.304584, 0.003921569, 0, 1, 1,
0.4020275, -0.07610642, 2.580298, 0.007843138, 0, 1, 1,
0.4023729, -0.06213977, 1.768904, 0.01568628, 0, 1, 1,
0.4024675, 0.2211577, 1.591242, 0.01960784, 0, 1, 1,
0.4039643, -0.2681171, 2.715126, 0.02745098, 0, 1, 1,
0.4046679, 1.676363, -0.4306038, 0.03137255, 0, 1, 1,
0.4088932, -1.383569, 2.555378, 0.03921569, 0, 1, 1,
0.4149009, 0.3075071, 0.2881311, 0.04313726, 0, 1, 1,
0.4164429, 0.3476842, 0.1033225, 0.05098039, 0, 1, 1,
0.4165388, 1.091509, 1.975336, 0.05490196, 0, 1, 1,
0.4202414, 0.7372569, -1.087732, 0.0627451, 0, 1, 1,
0.4307355, 0.697697, 1.572035, 0.06666667, 0, 1, 1,
0.4313288, -1.853036, 4.834338, 0.07450981, 0, 1, 1,
0.4334041, -0.1128348, 0.4573434, 0.07843138, 0, 1, 1,
0.4370236, 0.966821, 0.3319232, 0.08627451, 0, 1, 1,
0.4373335, -0.2704118, 1.329735, 0.09019608, 0, 1, 1,
0.440584, -1.054852, 3.764542, 0.09803922, 0, 1, 1,
0.4437184, 1.601798, 0.06824169, 0.1058824, 0, 1, 1,
0.4528829, -0.7596999, 4.437337, 0.1098039, 0, 1, 1,
0.4595497, -0.3404516, 2.174916, 0.1176471, 0, 1, 1,
0.4710873, -1.018951, 2.520627, 0.1215686, 0, 1, 1,
0.4713338, 0.09289221, 1.435182, 0.1294118, 0, 1, 1,
0.4722917, -1.792444, 2.337753, 0.1333333, 0, 1, 1,
0.4725862, -1.424548, 2.170097, 0.1411765, 0, 1, 1,
0.475494, 0.2135198, 1.172029, 0.145098, 0, 1, 1,
0.4756621, 1.060811, 0.7837534, 0.1529412, 0, 1, 1,
0.475998, -2.409434, 1.960872, 0.1568628, 0, 1, 1,
0.4760719, 0.932712, -0.9085717, 0.1647059, 0, 1, 1,
0.4808471, 0.4534462, 1.872624, 0.1686275, 0, 1, 1,
0.4821204, -1.053946, 4.033067, 0.1764706, 0, 1, 1,
0.488652, 0.3132644, 0.9388858, 0.1803922, 0, 1, 1,
0.4944887, -0.3858503, 1.589347, 0.1882353, 0, 1, 1,
0.4970703, 0.5697637, 0.8847071, 0.1921569, 0, 1, 1,
0.5040011, 0.581376, 0.2785932, 0.2, 0, 1, 1,
0.5067001, 0.3843361, -0.8446519, 0.2078431, 0, 1, 1,
0.5077232, 0.2349827, -0.5842714, 0.2117647, 0, 1, 1,
0.5125961, -0.08925258, 2.066833, 0.2196078, 0, 1, 1,
0.5169991, 0.7616195, 1.479043, 0.2235294, 0, 1, 1,
0.517847, -0.6387642, 2.085893, 0.2313726, 0, 1, 1,
0.5202671, 0.07020038, 0.5392244, 0.2352941, 0, 1, 1,
0.52175, 0.8212876, 1.344029, 0.2431373, 0, 1, 1,
0.5231971, -0.212452, 0.7320495, 0.2470588, 0, 1, 1,
0.5234606, -1.37792, 2.813688, 0.254902, 0, 1, 1,
0.5253872, -0.2046366, 3.009534, 0.2588235, 0, 1, 1,
0.5292689, -0.1371714, 2.308432, 0.2666667, 0, 1, 1,
0.5300064, -0.9653052, 2.42908, 0.2705882, 0, 1, 1,
0.5313612, 2.579088, 0.2647641, 0.2784314, 0, 1, 1,
0.5327589, 0.6820021, 1.2429, 0.282353, 0, 1, 1,
0.5417416, -0.1673911, 1.852642, 0.2901961, 0, 1, 1,
0.5423596, -0.1768311, 3.524789, 0.2941177, 0, 1, 1,
0.5451245, -0.1991747, 0.9581249, 0.3019608, 0, 1, 1,
0.545602, 0.2215679, 1.281385, 0.3098039, 0, 1, 1,
0.548562, -0.5868946, 3.723345, 0.3137255, 0, 1, 1,
0.5533903, 0.5814365, 1.31734, 0.3215686, 0, 1, 1,
0.5565585, -0.8440949, 2.933837, 0.3254902, 0, 1, 1,
0.5575317, 1.853968, -0.1814617, 0.3333333, 0, 1, 1,
0.5594969, 0.2319859, -0.1273734, 0.3372549, 0, 1, 1,
0.5613828, -0.2341018, 2.828907, 0.345098, 0, 1, 1,
0.5658681, -0.3214164, 1.20576, 0.3490196, 0, 1, 1,
0.5672777, 1.163622, -0.5035497, 0.3568628, 0, 1, 1,
0.5751808, -1.558147, 1.728572, 0.3607843, 0, 1, 1,
0.575976, 0.2393414, 3.529483, 0.3686275, 0, 1, 1,
0.578116, -0.8679939, 2.084564, 0.372549, 0, 1, 1,
0.578271, 0.257724, 0.4714834, 0.3803922, 0, 1, 1,
0.5855705, -1.19611, 1.509401, 0.3843137, 0, 1, 1,
0.5895029, 0.4597304, 1.556316, 0.3921569, 0, 1, 1,
0.5913966, -0.8648368, 2.73679, 0.3960784, 0, 1, 1,
0.5918186, -0.1123434, 0.2593961, 0.4039216, 0, 1, 1,
0.5922065, 0.4144454, 1.990968, 0.4117647, 0, 1, 1,
0.5943171, 0.4190524, 0.7741375, 0.4156863, 0, 1, 1,
0.5953923, 1.764043, 1.165575, 0.4235294, 0, 1, 1,
0.5966942, -1.488969, 1.275653, 0.427451, 0, 1, 1,
0.5970447, -0.6268119, 3.70061, 0.4352941, 0, 1, 1,
0.5971255, 1.234907, 1.967506, 0.4392157, 0, 1, 1,
0.5997618, 0.105248, 1.627994, 0.4470588, 0, 1, 1,
0.6022017, 1.65918, 0.8031386, 0.4509804, 0, 1, 1,
0.6024712, 0.4060602, 1.304343, 0.4588235, 0, 1, 1,
0.6045514, -0.6702494, 0.2405495, 0.4627451, 0, 1, 1,
0.61794, 0.4210494, 0.8881189, 0.4705882, 0, 1, 1,
0.6186653, 0.527046, 0.4233159, 0.4745098, 0, 1, 1,
0.6248887, 0.5813783, 1.390018, 0.4823529, 0, 1, 1,
0.6279014, 1.381701, 1.645171, 0.4862745, 0, 1, 1,
0.6285529, -0.1439676, 1.839854, 0.4941176, 0, 1, 1,
0.6304687, -0.9009033, 3.687871, 0.5019608, 0, 1, 1,
0.6400248, 0.3085375, 2.137991, 0.5058824, 0, 1, 1,
0.6505786, -0.8391914, 2.015675, 0.5137255, 0, 1, 1,
0.6511033, -0.6135435, 2.603896, 0.5176471, 0, 1, 1,
0.6529743, -0.6973493, 2.036686, 0.5254902, 0, 1, 1,
0.6532117, 1.726646, 1.347106, 0.5294118, 0, 1, 1,
0.6566556, 1.81861, 0.0595471, 0.5372549, 0, 1, 1,
0.6567563, 0.7333671, -0.1652521, 0.5411765, 0, 1, 1,
0.6571003, 0.8123695, 1.06254, 0.5490196, 0, 1, 1,
0.6620722, -0.5088175, 2.182487, 0.5529412, 0, 1, 1,
0.6628872, -0.9726356, 4.24003, 0.5607843, 0, 1, 1,
0.663343, 0.02888698, 0.9609008, 0.5647059, 0, 1, 1,
0.6666107, 0.030793, 1.267954, 0.572549, 0, 1, 1,
0.6669714, 0.9885848, 0.956191, 0.5764706, 0, 1, 1,
0.6681836, 0.01741368, 1.741873, 0.5843138, 0, 1, 1,
0.6694117, 1.479958, 1.843729, 0.5882353, 0, 1, 1,
0.6715633, 0.5142177, 1.619768, 0.5960785, 0, 1, 1,
0.6745552, -1.085908, 1.314291, 0.6039216, 0, 1, 1,
0.6750171, -0.7200792, 3.455459, 0.6078432, 0, 1, 1,
0.6767774, -0.8985363, 3.120278, 0.6156863, 0, 1, 1,
0.6773273, -0.09228352, 2.131123, 0.6196079, 0, 1, 1,
0.6803384, -0.370741, 2.620873, 0.627451, 0, 1, 1,
0.6804999, 1.108709, -0.5265199, 0.6313726, 0, 1, 1,
0.6822792, -0.2741474, 2.94872, 0.6392157, 0, 1, 1,
0.6849225, -0.6073866, 2.342135, 0.6431373, 0, 1, 1,
0.6868281, 0.2856028, 1.945453, 0.6509804, 0, 1, 1,
0.6869224, 1.48819, -0.7713654, 0.654902, 0, 1, 1,
0.692219, -1.155762, 1.077336, 0.6627451, 0, 1, 1,
0.6977573, -0.5271319, 2.17877, 0.6666667, 0, 1, 1,
0.6981725, -0.2060184, 2.424196, 0.6745098, 0, 1, 1,
0.712975, 0.1187195, 1.819167, 0.6784314, 0, 1, 1,
0.7140531, -1.097219, 2.690097, 0.6862745, 0, 1, 1,
0.7168369, 0.2173436, 0.2587101, 0.6901961, 0, 1, 1,
0.7315754, 0.1203464, 1.772471, 0.6980392, 0, 1, 1,
0.7320067, -0.2049215, 3.474956, 0.7058824, 0, 1, 1,
0.7323189, -0.9450528, 1.204514, 0.7098039, 0, 1, 1,
0.7359818, 1.683123, 2.759229, 0.7176471, 0, 1, 1,
0.7390975, -0.1649001, -0.08853077, 0.7215686, 0, 1, 1,
0.7447355, 0.06148502, 1.825422, 0.7294118, 0, 1, 1,
0.7456688, -1.765352, 2.504166, 0.7333333, 0, 1, 1,
0.7528475, 0.9824019, 0.9958923, 0.7411765, 0, 1, 1,
0.7584475, -0.5145162, 1.669039, 0.7450981, 0, 1, 1,
0.7601704, 0.001116828, 2.201281, 0.7529412, 0, 1, 1,
0.7607193, 2.12066, -0.3614878, 0.7568628, 0, 1, 1,
0.7665318, 1.291541, 1.053823, 0.7647059, 0, 1, 1,
0.7671568, 2.1737, -1.061212, 0.7686275, 0, 1, 1,
0.7700284, -0.3239611, 3.118441, 0.7764706, 0, 1, 1,
0.7740939, -0.3861123, 1.832197, 0.7803922, 0, 1, 1,
0.7748467, -1.095881, 2.602743, 0.7882353, 0, 1, 1,
0.7752298, -0.2687414, 1.338903, 0.7921569, 0, 1, 1,
0.7789964, -1.238309, 3.509392, 0.8, 0, 1, 1,
0.7797666, 0.8208194, 1.818174, 0.8078431, 0, 1, 1,
0.7805216, -0.2401441, 2.839351, 0.8117647, 0, 1, 1,
0.7837635, -0.04460496, 2.658805, 0.8196079, 0, 1, 1,
0.7930195, 1.5434, -0.1356156, 0.8235294, 0, 1, 1,
0.7938325, 0.4517507, 1.472782, 0.8313726, 0, 1, 1,
0.795324, -0.7870415, 3.405606, 0.8352941, 0, 1, 1,
0.7961167, -0.7965147, 2.982689, 0.8431373, 0, 1, 1,
0.7991098, 0.3453954, 0.9471084, 0.8470588, 0, 1, 1,
0.8019555, 0.0256938, 0.5560647, 0.854902, 0, 1, 1,
0.81052, -0.8916321, 2.874958, 0.8588235, 0, 1, 1,
0.8136795, -1.191811, 1.379599, 0.8666667, 0, 1, 1,
0.8165718, 0.6960036, 0.9155035, 0.8705882, 0, 1, 1,
0.8165801, 2.049693, 0.9270037, 0.8784314, 0, 1, 1,
0.8188605, 0.703522, -0.03902326, 0.8823529, 0, 1, 1,
0.8202608, -0.6372379, 1.187315, 0.8901961, 0, 1, 1,
0.8318402, -0.7082669, 1.397703, 0.8941177, 0, 1, 1,
0.8320526, -0.4171762, 3.602426, 0.9019608, 0, 1, 1,
0.8342857, 0.1725899, 2.881149, 0.9098039, 0, 1, 1,
0.8427538, 1.54752, 2.480384, 0.9137255, 0, 1, 1,
0.8432577, 1.329911, 1.038591, 0.9215686, 0, 1, 1,
0.8536124, -0.559849, 3.24701, 0.9254902, 0, 1, 1,
0.8539503, 0.4304619, 0.524653, 0.9333333, 0, 1, 1,
0.8549117, 1.408646, 0.9815239, 0.9372549, 0, 1, 1,
0.8557629, 0.487623, 1.20638, 0.945098, 0, 1, 1,
0.8560256, 0.3579993, 1.708334, 0.9490196, 0, 1, 1,
0.8595873, -1.655925, 2.596638, 0.9568627, 0, 1, 1,
0.8606122, -1.176825, 2.384923, 0.9607843, 0, 1, 1,
0.8727839, 1.292274, 2.321076, 0.9686275, 0, 1, 1,
0.8780581, -0.4062971, -0.2892903, 0.972549, 0, 1, 1,
0.8791556, -1.078671, 1.313906, 0.9803922, 0, 1, 1,
0.894384, -1.935326, 2.277136, 0.9843137, 0, 1, 1,
0.8950405, 1.273765, -1.923266, 0.9921569, 0, 1, 1,
0.8970419, 1.559042, 0.6012536, 0.9960784, 0, 1, 1,
0.904476, 0.007673879, 2.115201, 1, 0, 0.9960784, 1,
0.9053202, -0.6809394, 1.843634, 1, 0, 0.9882353, 1,
0.9136179, 0.8965645, 0.8174409, 1, 0, 0.9843137, 1,
0.9146725, -0.8882084, 1.619313, 1, 0, 0.9764706, 1,
0.9158427, 0.2701747, 0.740189, 1, 0, 0.972549, 1,
0.9181157, 0.2293171, 1.270464, 1, 0, 0.9647059, 1,
0.9265388, -0.257762, 1.174577, 1, 0, 0.9607843, 1,
0.9273559, 0.1091562, 2.043295, 1, 0, 0.9529412, 1,
0.9278211, -1.359715, 3.873026, 1, 0, 0.9490196, 1,
0.930036, -0.07920358, 1.214629, 1, 0, 0.9411765, 1,
0.9318126, -0.2210208, 1.848071, 1, 0, 0.9372549, 1,
0.9322821, 0.6884552, 0.1872765, 1, 0, 0.9294118, 1,
0.9339154, 0.9484895, 1.419809, 1, 0, 0.9254902, 1,
0.9357972, -1.131234, 1.390831, 1, 0, 0.9176471, 1,
0.9387274, -0.002733676, 1.397316, 1, 0, 0.9137255, 1,
0.939831, -1.082676, 2.709349, 1, 0, 0.9058824, 1,
0.9428998, -3.056568, 2.807001, 1, 0, 0.9019608, 1,
0.9459659, -1.042973, 4.188787, 1, 0, 0.8941177, 1,
0.9468222, 0.5535104, -0.1482546, 1, 0, 0.8862745, 1,
0.9493185, 0.861707, 1.47691, 1, 0, 0.8823529, 1,
0.9498461, -0.654732, 2.752904, 1, 0, 0.8745098, 1,
0.9542566, 0.4812323, 1.32277, 1, 0, 0.8705882, 1,
0.9601358, 0.06426979, 2.512282, 1, 0, 0.8627451, 1,
0.9612932, 0.8503765, -0.1859301, 1, 0, 0.8588235, 1,
0.9698271, -0.009734934, 1.209834, 1, 0, 0.8509804, 1,
0.9724781, -0.409208, 2.591269, 1, 0, 0.8470588, 1,
0.973509, 0.8473715, -0.4680501, 1, 0, 0.8392157, 1,
0.9738795, -0.643388, 1.115772, 1, 0, 0.8352941, 1,
0.9767333, 0.4581179, 0.8390343, 1, 0, 0.827451, 1,
0.9777544, 0.6383026, 0.04540293, 1, 0, 0.8235294, 1,
0.9838716, 1.374044, 1.755194, 1, 0, 0.8156863, 1,
0.9897676, 0.3952718, 2.59664, 1, 0, 0.8117647, 1,
1.00231, -0.5892059, 3.995663, 1, 0, 0.8039216, 1,
1.004661, -0.0884828, 2.014748, 1, 0, 0.7960784, 1,
1.019003, -0.3559268, 0.5079888, 1, 0, 0.7921569, 1,
1.019207, 1.423024, 0.7267569, 1, 0, 0.7843137, 1,
1.020832, 1.10196, -0.2220444, 1, 0, 0.7803922, 1,
1.03373, 0.343322, 1.853229, 1, 0, 0.772549, 1,
1.040235, 0.7021139, 1.087552, 1, 0, 0.7686275, 1,
1.046963, 0.9559785, 0.3200924, 1, 0, 0.7607843, 1,
1.080472, 0.967075, 1.399983, 1, 0, 0.7568628, 1,
1.080574, 0.3926212, 0.3917204, 1, 0, 0.7490196, 1,
1.082275, -0.683336, 3.286558, 1, 0, 0.7450981, 1,
1.099378, -0.3439569, 1.77344, 1, 0, 0.7372549, 1,
1.101498, -0.9685105, 1.952407, 1, 0, 0.7333333, 1,
1.104251, 0.1008688, 2.010038, 1, 0, 0.7254902, 1,
1.105279, -0.4874279, 0.678785, 1, 0, 0.7215686, 1,
1.11321, -0.1630992, 1.190406, 1, 0, 0.7137255, 1,
1.115641, -1.6183, 3.401668, 1, 0, 0.7098039, 1,
1.116817, -1.667231, 2.038968, 1, 0, 0.7019608, 1,
1.11837, -0.257408, 3.313964, 1, 0, 0.6941177, 1,
1.133125, 0.7024965, -0.3974637, 1, 0, 0.6901961, 1,
1.141606, 1.055158, 0.5566386, 1, 0, 0.682353, 1,
1.142783, -1.094696, 2.654246, 1, 0, 0.6784314, 1,
1.155372, -0.3553758, 1.40411, 1, 0, 0.6705883, 1,
1.165006, 0.8569031, 1.313418, 1, 0, 0.6666667, 1,
1.166335, -0.1485283, 0.7298981, 1, 0, 0.6588235, 1,
1.170513, -0.5897462, 0.6570552, 1, 0, 0.654902, 1,
1.171198, -1.128997, 1.132496, 1, 0, 0.6470588, 1,
1.187897, 0.4530277, 0.3531991, 1, 0, 0.6431373, 1,
1.189372, -1.432349, 0.855135, 1, 0, 0.6352941, 1,
1.195624, 1.426373, -0.313205, 1, 0, 0.6313726, 1,
1.205801, 0.09433774, 2.939574, 1, 0, 0.6235294, 1,
1.205824, -0.4326196, 1.503142, 1, 0, 0.6196079, 1,
1.211528, -2.830487, 2.860512, 1, 0, 0.6117647, 1,
1.21804, -0.6248651, 2.246799, 1, 0, 0.6078432, 1,
1.22386, -0.1881815, 1.945129, 1, 0, 0.6, 1,
1.227487, 1.113066, 0.4444363, 1, 0, 0.5921569, 1,
1.238104, 1.97358, 1.69398, 1, 0, 0.5882353, 1,
1.240803, 2.53786, 0.4354295, 1, 0, 0.5803922, 1,
1.248305, -1.806966, 0.8427686, 1, 0, 0.5764706, 1,
1.249316, 1.452004, 2.31975, 1, 0, 0.5686275, 1,
1.251049, -0.02295629, -1.633026, 1, 0, 0.5647059, 1,
1.255508, 0.4966701, 1.872136, 1, 0, 0.5568628, 1,
1.259654, 0.2957004, 0.7221936, 1, 0, 0.5529412, 1,
1.26054, -0.8225007, 1.285803, 1, 0, 0.5450981, 1,
1.264133, -1.446311, 3.834386, 1, 0, 0.5411765, 1,
1.268953, -0.3255598, 1.352926, 1, 0, 0.5333334, 1,
1.278358, 1.9137, 0.1678295, 1, 0, 0.5294118, 1,
1.292008, -0.2897123, 0.9059075, 1, 0, 0.5215687, 1,
1.296831, -0.4810478, 1.336692, 1, 0, 0.5176471, 1,
1.308559, 0.2063967, 0.5151815, 1, 0, 0.509804, 1,
1.311, 0.1361767, 1.658875, 1, 0, 0.5058824, 1,
1.314989, 1.370241, -0.08139941, 1, 0, 0.4980392, 1,
1.320495, -0.2595346, 3.00048, 1, 0, 0.4901961, 1,
1.322743, 1.250701, 1.382072, 1, 0, 0.4862745, 1,
1.32642, -0.578697, 0.7498637, 1, 0, 0.4784314, 1,
1.331283, 0.822375, -0.234549, 1, 0, 0.4745098, 1,
1.333475, 0.3775802, 1.38846, 1, 0, 0.4666667, 1,
1.336551, 1.110844, 0.9232622, 1, 0, 0.4627451, 1,
1.337694, -0.4004658, 0.6988011, 1, 0, 0.454902, 1,
1.342443, -0.3214599, 1.419516, 1, 0, 0.4509804, 1,
1.355579, -1.827435, 1.627921, 1, 0, 0.4431373, 1,
1.390768, -1.699849, 3.168716, 1, 0, 0.4392157, 1,
1.401867, -0.3154239, 1.851316, 1, 0, 0.4313726, 1,
1.410753, 0.311382, 0.465587, 1, 0, 0.427451, 1,
1.421555, 0.001156938, 2.830713, 1, 0, 0.4196078, 1,
1.427506, 0.6333146, 2.653402, 1, 0, 0.4156863, 1,
1.428855, 1.691322, 2.216737, 1, 0, 0.4078431, 1,
1.431527, -0.1166699, 1.346976, 1, 0, 0.4039216, 1,
1.471838, 0.3063967, 0.977273, 1, 0, 0.3960784, 1,
1.478835, 0.8055748, 0.3966972, 1, 0, 0.3882353, 1,
1.492426, 0.4178284, -0.4978566, 1, 0, 0.3843137, 1,
1.508958, 0.7596752, 0.8321403, 1, 0, 0.3764706, 1,
1.513553, 0.4687715, 0.8333002, 1, 0, 0.372549, 1,
1.529605, -0.5635214, 1.751233, 1, 0, 0.3647059, 1,
1.534971, 0.5170588, 3.896831, 1, 0, 0.3607843, 1,
1.535932, -0.3805844, 1.000264, 1, 0, 0.3529412, 1,
1.565018, 1.661225, -0.4776395, 1, 0, 0.3490196, 1,
1.571696, -1.495638, 0.5908411, 1, 0, 0.3411765, 1,
1.579615, 0.1183927, 1.341278, 1, 0, 0.3372549, 1,
1.585412, -2.581716, 2.386682, 1, 0, 0.3294118, 1,
1.609328, -0.1994628, 2.016466, 1, 0, 0.3254902, 1,
1.609399, -0.6018598, 2.593992, 1, 0, 0.3176471, 1,
1.617595, -0.7674438, 1.887221, 1, 0, 0.3137255, 1,
1.635972, -0.3446981, 2.234655, 1, 0, 0.3058824, 1,
1.641926, 1.922934, 2.134688, 1, 0, 0.2980392, 1,
1.655071, -0.069089, 3.169178, 1, 0, 0.2941177, 1,
1.656597, 0.2780298, 1.583295, 1, 0, 0.2862745, 1,
1.66655, -0.9395956, 3.017777, 1, 0, 0.282353, 1,
1.673848, 0.02067478, 2.180193, 1, 0, 0.2745098, 1,
1.677895, 1.135594, 0.5345782, 1, 0, 0.2705882, 1,
1.683828, -0.9895231, -0.3287711, 1, 0, 0.2627451, 1,
1.696847, 0.6008577, 1.281352, 1, 0, 0.2588235, 1,
1.699027, -0.8463717, 2.643875, 1, 0, 0.2509804, 1,
1.725694, -0.05210201, 1.762785, 1, 0, 0.2470588, 1,
1.730912, -0.1385295, 3.829359, 1, 0, 0.2392157, 1,
1.74079, 0.2621714, 0.2010892, 1, 0, 0.2352941, 1,
1.74427, 2.12368, 2.021605, 1, 0, 0.227451, 1,
1.787207, 1.337923, 1.005305, 1, 0, 0.2235294, 1,
1.795016, -0.2493656, 3.339564, 1, 0, 0.2156863, 1,
1.797324, -0.1518033, 1.721397, 1, 0, 0.2117647, 1,
1.79999, -1.225079, 0.8666304, 1, 0, 0.2039216, 1,
1.844088, 1.721622, 0.9394914, 1, 0, 0.1960784, 1,
1.861128, 0.521912, 0.9906354, 1, 0, 0.1921569, 1,
1.891613, 1.847162, 2.739726, 1, 0, 0.1843137, 1,
1.90578, 1.127038, 0.5787596, 1, 0, 0.1803922, 1,
1.954744, -1.839834, 2.482498, 1, 0, 0.172549, 1,
1.96316, 1.113156, 1.595484, 1, 0, 0.1686275, 1,
1.974532, 0.1641939, 3.329315, 1, 0, 0.1607843, 1,
1.981162, 1.25714, 0.9920865, 1, 0, 0.1568628, 1,
1.998105, 0.7012265, 1.35925, 1, 0, 0.1490196, 1,
1.999206, -0.7936439, 4.158663, 1, 0, 0.145098, 1,
2.017155, 0.8312218, 0.6492949, 1, 0, 0.1372549, 1,
2.026585, 0.4588392, 3.439408, 1, 0, 0.1333333, 1,
2.035237, -0.4956921, 1.59119, 1, 0, 0.1254902, 1,
2.040765, 1.128398, 1.027581, 1, 0, 0.1215686, 1,
2.07524, -1.036901, 3.130225, 1, 0, 0.1137255, 1,
2.075547, -0.2184574, 1.009849, 1, 0, 0.1098039, 1,
2.08866, -0.3269749, 2.535817, 1, 0, 0.1019608, 1,
2.101775, 1.364082, 0.8482046, 1, 0, 0.09411765, 1,
2.116212, -0.1509337, 1.429949, 1, 0, 0.09019608, 1,
2.164848, -1.17878, 0.527557, 1, 0, 0.08235294, 1,
2.176969, 0.4541155, 1.233078, 1, 0, 0.07843138, 1,
2.197172, -2.209658, 2.65262, 1, 0, 0.07058824, 1,
2.286556, -0.4159283, 3.04663, 1, 0, 0.06666667, 1,
2.31821, 0.2009811, 1.930498, 1, 0, 0.05882353, 1,
2.347184, 0.9926376, 1.814618, 1, 0, 0.05490196, 1,
2.35603, 0.6746612, 1.899693, 1, 0, 0.04705882, 1,
2.374955, -0.6531635, 2.150816, 1, 0, 0.04313726, 1,
2.443204, 0.2536181, 2.343485, 1, 0, 0.03529412, 1,
2.478947, -0.4635319, 3.255702, 1, 0, 0.03137255, 1,
2.504309, 1.053582, 0.4036714, 1, 0, 0.02352941, 1,
2.692987, 0.4213098, 0.3100333, 1, 0, 0.01960784, 1,
2.731732, -0.7634324, 3.017729, 1, 0, 0.01176471, 1,
3.516288, 1.020621, 0.8912771, 1, 0, 0.007843138, 1
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
0.09607708, -4.020987, -7.064359, 0, -0.5, 0.5, 0.5,
0.09607708, -4.020987, -7.064359, 1, -0.5, 0.5, 0.5,
0.09607708, -4.020987, -7.064359, 1, 1.5, 0.5, 0.5,
0.09607708, -4.020987, -7.064359, 0, 1.5, 0.5, 0.5
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
-4.483585, -0.2116741, -7.064359, 0, -0.5, 0.5, 0.5,
-4.483585, -0.2116741, -7.064359, 1, -0.5, 0.5, 0.5,
-4.483585, -0.2116741, -7.064359, 1, 1.5, 0.5, 0.5,
-4.483585, -0.2116741, -7.064359, 0, 1.5, 0.5, 0.5
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
-4.483585, -4.020987, 0.3388588, 0, -0.5, 0.5, 0.5,
-4.483585, -4.020987, 0.3388588, 1, -0.5, 0.5, 0.5,
-4.483585, -4.020987, 0.3388588, 1, 1.5, 0.5, 0.5,
-4.483585, -4.020987, 0.3388588, 0, 1.5, 0.5, 0.5
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
-3, -3.141914, -5.355924,
3, -3.141914, -5.355924,
-3, -3.141914, -5.355924,
-3, -3.288426, -5.640663,
-2, -3.141914, -5.355924,
-2, -3.288426, -5.640663,
-1, -3.141914, -5.355924,
-1, -3.288426, -5.640663,
0, -3.141914, -5.355924,
0, -3.288426, -5.640663,
1, -3.141914, -5.355924,
1, -3.288426, -5.640663,
2, -3.141914, -5.355924,
2, -3.288426, -5.640663,
3, -3.141914, -5.355924,
3, -3.288426, -5.640663
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
-3, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
-3, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
-3, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
-3, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
-2, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
-2, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
-2, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
-2, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
-1, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
-1, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
-1, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
-1, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
0, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
0, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
0, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
0, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
1, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
1, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
1, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
1, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
2, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
2, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
2, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
2, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5,
3, -3.58145, -6.210141, 0, -0.5, 0.5, 0.5,
3, -3.58145, -6.210141, 1, -0.5, 0.5, 0.5,
3, -3.58145, -6.210141, 1, 1.5, 0.5, 0.5,
3, -3.58145, -6.210141, 0, 1.5, 0.5, 0.5
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
-3.42674, -3, -5.355924,
-3.42674, 2, -5.355924,
-3.42674, -3, -5.355924,
-3.60288, -3, -5.640663,
-3.42674, -2, -5.355924,
-3.60288, -2, -5.640663,
-3.42674, -1, -5.355924,
-3.60288, -1, -5.640663,
-3.42674, 0, -5.355924,
-3.60288, 0, -5.640663,
-3.42674, 1, -5.355924,
-3.60288, 1, -5.640663,
-3.42674, 2, -5.355924,
-3.60288, 2, -5.640663
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
-3.955162, -3, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, -3, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, -3, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, -3, -6.210141, 0, 1.5, 0.5, 0.5,
-3.955162, -2, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, -2, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, -2, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, -2, -6.210141, 0, 1.5, 0.5, 0.5,
-3.955162, -1, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, -1, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, -1, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, -1, -6.210141, 0, 1.5, 0.5, 0.5,
-3.955162, 0, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, 0, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, 0, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, 0, -6.210141, 0, 1.5, 0.5, 0.5,
-3.955162, 1, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, 1, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, 1, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, 1, -6.210141, 0, 1.5, 0.5, 0.5,
-3.955162, 2, -6.210141, 0, -0.5, 0.5, 0.5,
-3.955162, 2, -6.210141, 1, -0.5, 0.5, 0.5,
-3.955162, 2, -6.210141, 1, 1.5, 0.5, 0.5,
-3.955162, 2, -6.210141, 0, 1.5, 0.5, 0.5
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
-3.42674, -3.141914, -4,
-3.42674, -3.141914, 4,
-3.42674, -3.141914, -4,
-3.60288, -3.288426, -4,
-3.42674, -3.141914, -2,
-3.60288, -3.288426, -2,
-3.42674, -3.141914, 0,
-3.60288, -3.288426, 0,
-3.42674, -3.141914, 2,
-3.60288, -3.288426, 2,
-3.42674, -3.141914, 4,
-3.60288, -3.288426, 4
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
-3.955162, -3.58145, -4, 0, -0.5, 0.5, 0.5,
-3.955162, -3.58145, -4, 1, -0.5, 0.5, 0.5,
-3.955162, -3.58145, -4, 1, 1.5, 0.5, 0.5,
-3.955162, -3.58145, -4, 0, 1.5, 0.5, 0.5,
-3.955162, -3.58145, -2, 0, -0.5, 0.5, 0.5,
-3.955162, -3.58145, -2, 1, -0.5, 0.5, 0.5,
-3.955162, -3.58145, -2, 1, 1.5, 0.5, 0.5,
-3.955162, -3.58145, -2, 0, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 0, 0, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 0, 1, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 0, 1, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 0, 0, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 2, 0, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 2, 1, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 2, 1, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 2, 0, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 4, 0, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 4, 1, -0.5, 0.5, 0.5,
-3.955162, -3.58145, 4, 1, 1.5, 0.5, 0.5,
-3.955162, -3.58145, 4, 0, 1.5, 0.5, 0.5
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
-3.42674, -3.141914, -5.355924,
-3.42674, 2.718566, -5.355924,
-3.42674, -3.141914, 6.033641,
-3.42674, 2.718566, 6.033641,
-3.42674, -3.141914, -5.355924,
-3.42674, -3.141914, 6.033641,
-3.42674, 2.718566, -5.355924,
-3.42674, 2.718566, 6.033641,
-3.42674, -3.141914, -5.355924,
3.618894, -3.141914, -5.355924,
-3.42674, -3.141914, 6.033641,
3.618894, -3.141914, 6.033641,
-3.42674, 2.718566, -5.355924,
3.618894, 2.718566, -5.355924,
-3.42674, 2.718566, 6.033641,
3.618894, 2.718566, 6.033641,
3.618894, -3.141914, -5.355924,
3.618894, 2.718566, -5.355924,
3.618894, -3.141914, 6.033641,
3.618894, 2.718566, 6.033641,
3.618894, -3.141914, -5.355924,
3.618894, -3.141914, 6.033641,
3.618894, 2.718566, -5.355924,
3.618894, 2.718566, 6.033641
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
var radius = 7.806138;
var distance = 34.73039;
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
mvMatrix.translate( -0.09607708, 0.2116741, -0.3388588 );
mvMatrix.scale( 1.197926, 1.44018, 0.7410423 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73039);
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
cyclohex-3-enecarbox<-read.table("cyclohex-3-enecarbox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclohex-3-enecarbox$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
```

```r
y<-cyclohex-3-enecarbox$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
```

```r
z<-cyclohex-3-enecarbox$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclohex' not found
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
-3.324133, -1.41461, -2.44025, 0, 0, 1, 1, 1,
-3.019251, -0.2346307, -1.71295, 1, 0, 0, 1, 1,
-2.94368, 0.5241088, -0.9990427, 1, 0, 0, 1, 1,
-2.873962, -1.249386, -0.7205879, 1, 0, 0, 1, 1,
-2.840552, 1.01106, -0.9784917, 1, 0, 0, 1, 1,
-2.805392, 0.4093674, -1.401166, 1, 0, 0, 1, 1,
-2.724277, -0.90047, 0.06318803, 0, 0, 0, 1, 1,
-2.629647, -1.040479, -1.248104, 0, 0, 0, 1, 1,
-2.528967, 0.6244218, -0.9750112, 0, 0, 0, 1, 1,
-2.48331, -0.06620347, -2.057974, 0, 0, 0, 1, 1,
-2.433983, -1.872897, -2.942245, 0, 0, 0, 1, 1,
-2.427615, -0.6719707, -2.596847, 0, 0, 0, 1, 1,
-2.414486, -0.1856861, -0.64486, 0, 0, 0, 1, 1,
-2.378366, 1.065451, -1.257679, 1, 1, 1, 1, 1,
-2.350346, -0.8584031, -0.4609898, 1, 1, 1, 1, 1,
-2.268724, 1.415123, -2.359529, 1, 1, 1, 1, 1,
-2.223352, 1.619109, -0.5617653, 1, 1, 1, 1, 1,
-2.19266, 1.995941, -2.294776, 1, 1, 1, 1, 1,
-2.177974, -0.9058828, -2.605258, 1, 1, 1, 1, 1,
-2.164162, 0.448953, -1.741512, 1, 1, 1, 1, 1,
-2.160659, 0.1239386, -1.480552, 1, 1, 1, 1, 1,
-2.144105, -1.245067, -3.454504, 1, 1, 1, 1, 1,
-2.140522, 0.1378229, -1.060038, 1, 1, 1, 1, 1,
-2.106828, -0.5923886, -1.227065, 1, 1, 1, 1, 1,
-2.096386, 1.492105, -1.543382, 1, 1, 1, 1, 1,
-2.07462, -0.6902458, -1.451168, 1, 1, 1, 1, 1,
-2.070784, -0.3684297, -1.375394, 1, 1, 1, 1, 1,
-2.070501, 0.2949868, -1.035996, 1, 1, 1, 1, 1,
-2.036855, -1.517966, -2.508516, 0, 0, 1, 1, 1,
-2.017398, 0.7144905, -0.9552389, 1, 0, 0, 1, 1,
-1.942156, -0.1618516, -1.082829, 1, 0, 0, 1, 1,
-1.932888, 0.5440179, -2.945518, 1, 0, 0, 1, 1,
-1.908551, 0.9333643, -2.186297, 1, 0, 0, 1, 1,
-1.902814, 0.5269422, -2.078704, 1, 0, 0, 1, 1,
-1.853003, -1.1363, -1.626866, 0, 0, 0, 1, 1,
-1.828238, 1.702459, -0.06570362, 0, 0, 0, 1, 1,
-1.826325, -0.4651239, -3.102787, 0, 0, 0, 1, 1,
-1.815126, -1.539762, -4.072948, 0, 0, 0, 1, 1,
-1.792942, -0.8040971, -1.693161, 0, 0, 0, 1, 1,
-1.79046, 0.6383786, -0.2180574, 0, 0, 0, 1, 1,
-1.776609, 0.4306028, -3.187587, 0, 0, 0, 1, 1,
-1.763096, 1.207696, -0.7367063, 1, 1, 1, 1, 1,
-1.753047, -0.9252992, -2.590693, 1, 1, 1, 1, 1,
-1.748983, 0.2645437, -2.616354, 1, 1, 1, 1, 1,
-1.74493, 0.8705766, -1.887226, 1, 1, 1, 1, 1,
-1.736014, -0.5189949, -2.094164, 1, 1, 1, 1, 1,
-1.707883, 1.800925, 0.6753475, 1, 1, 1, 1, 1,
-1.701427, -1.522268, -2.00921, 1, 1, 1, 1, 1,
-1.698686, -1.345241, -0.7478778, 1, 1, 1, 1, 1,
-1.692997, 1.21946, 0.2493458, 1, 1, 1, 1, 1,
-1.692824, 0.1321843, -0.9727503, 1, 1, 1, 1, 1,
-1.684579, -1.073308, -3.40113, 1, 1, 1, 1, 1,
-1.682289, -1.59864, -2.876659, 1, 1, 1, 1, 1,
-1.680224, 0.2864564, -1.45228, 1, 1, 1, 1, 1,
-1.665392, -0.8146477, -1.516636, 1, 1, 1, 1, 1,
-1.664214, -0.516988, -1.952069, 1, 1, 1, 1, 1,
-1.661883, -0.6154349, -1.044352, 0, 0, 1, 1, 1,
-1.651289, -1.22382, -2.598021, 1, 0, 0, 1, 1,
-1.636891, 0.2356711, -3.942563, 1, 0, 0, 1, 1,
-1.622693, -0.3731703, -2.26029, 1, 0, 0, 1, 1,
-1.603261, -0.2715417, -1.698479, 1, 0, 0, 1, 1,
-1.597442, 0.4052667, -2.15028, 1, 0, 0, 1, 1,
-1.588704, 0.1809472, -1.999389, 0, 0, 0, 1, 1,
-1.584875, -0.6272768, -4.075715, 0, 0, 0, 1, 1,
-1.539982, 0.5775067, -2.213261, 0, 0, 0, 1, 1,
-1.539575, 0.3049133, -1.29377, 0, 0, 0, 1, 1,
-1.527198, 0.4141767, -1.458427, 0, 0, 0, 1, 1,
-1.512142, -0.0896844, -0.8642985, 0, 0, 0, 1, 1,
-1.503451, 0.01744136, -2.502288, 0, 0, 0, 1, 1,
-1.488914, -0.7755297, -4.02995, 1, 1, 1, 1, 1,
-1.488826, 1.047747, 0.4296285, 1, 1, 1, 1, 1,
-1.481517, -0.538755, -2.107413, 1, 1, 1, 1, 1,
-1.465986, 0.7462835, -1.536877, 1, 1, 1, 1, 1,
-1.465588, -0.3081306, -2.359289, 1, 1, 1, 1, 1,
-1.46389, -0.9320718, -2.561156, 1, 1, 1, 1, 1,
-1.463332, 1.343502, -1.277481, 1, 1, 1, 1, 1,
-1.444437, -0.1628934, -2.355849, 1, 1, 1, 1, 1,
-1.44435, 1.003865, -1.562769, 1, 1, 1, 1, 1,
-1.443635, -0.4052444, -2.174031, 1, 1, 1, 1, 1,
-1.438947, -0.02556401, -1.963261, 1, 1, 1, 1, 1,
-1.434172, -1.175368, -2.492469, 1, 1, 1, 1, 1,
-1.42552, 1.367836, -0.6708106, 1, 1, 1, 1, 1,
-1.422994, 1.092853, 0.02390641, 1, 1, 1, 1, 1,
-1.41807, 0.6718248, -0.6241004, 1, 1, 1, 1, 1,
-1.40524, 0.2525681, -2.813563, 0, 0, 1, 1, 1,
-1.397155, -0.3851571, -3.053481, 1, 0, 0, 1, 1,
-1.394138, -0.4572427, -2.021173, 1, 0, 0, 1, 1,
-1.393142, 1.075102, 0.1969786, 1, 0, 0, 1, 1,
-1.381008, 2.633219, 0.6662462, 1, 0, 0, 1, 1,
-1.372225, 1.210958, -0.9676166, 1, 0, 0, 1, 1,
-1.368743, 2.30434, 0.04057422, 0, 0, 0, 1, 1,
-1.350577, 1.383343, -0.2907953, 0, 0, 0, 1, 1,
-1.329363, 0.6197947, -0.4465855, 0, 0, 0, 1, 1,
-1.325348, -0.3855206, -0.2993459, 0, 0, 0, 1, 1,
-1.320152, 2.033509, -0.4680027, 0, 0, 0, 1, 1,
-1.315655, -0.3659921, -1.998623, 0, 0, 0, 1, 1,
-1.315056, -0.7449716, -1.734057, 0, 0, 0, 1, 1,
-1.306691, -0.7274178, -2.331398, 1, 1, 1, 1, 1,
-1.287253, -1.086091, -2.69489, 1, 1, 1, 1, 1,
-1.285799, -0.2221552, -2.442906, 1, 1, 1, 1, 1,
-1.276583, 0.1120348, -1.74134, 1, 1, 1, 1, 1,
-1.275056, -0.3233751, -0.3037744, 1, 1, 1, 1, 1,
-1.264645, -0.2074485, -1.110893, 1, 1, 1, 1, 1,
-1.261444, -1.179535, -2.945529, 1, 1, 1, 1, 1,
-1.248471, -0.5435819, -2.224775, 1, 1, 1, 1, 1,
-1.246225, -0.1481525, -1.976179, 1, 1, 1, 1, 1,
-1.245171, 0.1244687, -0.2666745, 1, 1, 1, 1, 1,
-1.244116, 0.2352694, 0.8732675, 1, 1, 1, 1, 1,
-1.223334, -0.8763248, -1.935414, 1, 1, 1, 1, 1,
-1.222577, 0.2186169, -1.092299, 1, 1, 1, 1, 1,
-1.212046, 0.1025756, -1.188439, 1, 1, 1, 1, 1,
-1.210922, -0.4683581, -1.484483, 1, 1, 1, 1, 1,
-1.205239, 0.6437309, -0.4275132, 0, 0, 1, 1, 1,
-1.190275, 0.6717625, -1.270723, 1, 0, 0, 1, 1,
-1.184596, 0.3421329, -1.528006, 1, 0, 0, 1, 1,
-1.177937, -2.541716, -3.885574, 1, 0, 0, 1, 1,
-1.173278, 0.4802091, -1.049739, 1, 0, 0, 1, 1,
-1.167899, -2.063832, -2.560238, 1, 0, 0, 1, 1,
-1.15977, -0.5167782, -2.238417, 0, 0, 0, 1, 1,
-1.151462, -1.353676, -3.536825, 0, 0, 0, 1, 1,
-1.149591, 0.1104267, -0.211043, 0, 0, 0, 1, 1,
-1.145518, -0.6635154, -1.158265, 0, 0, 0, 1, 1,
-1.140128, -1.309584, -2.375585, 0, 0, 0, 1, 1,
-1.138923, -1.573037, -2.14642, 0, 0, 0, 1, 1,
-1.134668, -0.7455087, -2.489092, 0, 0, 0, 1, 1,
-1.122353, 1.526419, 0.7406558, 1, 1, 1, 1, 1,
-1.121396, 1.866044, -0.2304672, 1, 1, 1, 1, 1,
-1.111482, 0.09640413, -0.2530726, 1, 1, 1, 1, 1,
-1.107138, -0.9851338, -3.380571, 1, 1, 1, 1, 1,
-1.105262, -1.309823, -1.878135, 1, 1, 1, 1, 1,
-1.104901, -0.4749623, -1.460717, 1, 1, 1, 1, 1,
-1.092558, 0.9628491, -0.8915004, 1, 1, 1, 1, 1,
-1.088379, 0.715257, -2.607447, 1, 1, 1, 1, 1,
-1.079479, 1.13965, -0.7821698, 1, 1, 1, 1, 1,
-1.077016, 0.4561915, 0.2425048, 1, 1, 1, 1, 1,
-1.076007, 2.410033, 1.0561, 1, 1, 1, 1, 1,
-1.072345, -0.2520467, -1.849105, 1, 1, 1, 1, 1,
-1.070684, -1.48343, -2.150198, 1, 1, 1, 1, 1,
-1.069245, 0.8939434, 1.289076, 1, 1, 1, 1, 1,
-1.063079, 0.6867532, -0.9634671, 1, 1, 1, 1, 1,
-1.062656, 0.6409687, -0.2286511, 0, 0, 1, 1, 1,
-1.061443, 1.627545, -1.269919, 1, 0, 0, 1, 1,
-1.060004, 0.09139017, 0.6530278, 1, 0, 0, 1, 1,
-1.056218, 1.38585, 1.353692, 1, 0, 0, 1, 1,
-1.055077, -0.244427, -1.595234, 1, 0, 0, 1, 1,
-1.050147, -0.3964876, -2.457111, 1, 0, 0, 1, 1,
-1.040225, -0.004181071, -2.488104, 0, 0, 0, 1, 1,
-1.029515, -0.9611262, -2.877853, 0, 0, 0, 1, 1,
-1.022878, -0.3338611, -3.051327, 0, 0, 0, 1, 1,
-1.009502, 0.3531087, -2.961881, 0, 0, 0, 1, 1,
-0.9896958, 0.4948677, -2.351572, 0, 0, 0, 1, 1,
-0.9828745, 0.5519226, -1.058851, 0, 0, 0, 1, 1,
-0.9819555, -0.637935, -2.504627, 0, 0, 0, 1, 1,
-0.9813849, 1.393133, 0.9598535, 1, 1, 1, 1, 1,
-0.9757605, -2.194602, -2.63219, 1, 1, 1, 1, 1,
-0.9678072, -0.4816274, -1.957181, 1, 1, 1, 1, 1,
-0.950931, -1.999515, -1.554369, 1, 1, 1, 1, 1,
-0.9453071, -0.06554136, -1.981004, 1, 1, 1, 1, 1,
-0.9415061, 0.3782862, -0.9169149, 1, 1, 1, 1, 1,
-0.9361875, -1.113399, -2.932719, 1, 1, 1, 1, 1,
-0.9356261, 0.7515836, 0.123539, 1, 1, 1, 1, 1,
-0.9354002, -0.09019958, 0.2796592, 1, 1, 1, 1, 1,
-0.9348278, -0.04670622, -0.5699862, 1, 1, 1, 1, 1,
-0.931262, 1.165731, -2.722905, 1, 1, 1, 1, 1,
-0.9260083, 0.2062498, -0.5117158, 1, 1, 1, 1, 1,
-0.9187081, 1.360224, -1.722421, 1, 1, 1, 1, 1,
-0.9182582, -0.05001278, -2.114191, 1, 1, 1, 1, 1,
-0.9180952, -0.1993148, -1.594475, 1, 1, 1, 1, 1,
-0.9177789, 0.5576235, -1.08944, 0, 0, 1, 1, 1,
-0.9168829, 0.2314676, -1.17153, 1, 0, 0, 1, 1,
-0.9084679, -0.2108346, -1.363016, 1, 0, 0, 1, 1,
-0.9080754, -0.1359725, -0.1922849, 1, 0, 0, 1, 1,
-0.9051194, 0.3850265, -2.399125, 1, 0, 0, 1, 1,
-0.8963311, 0.212999, -0.08728595, 1, 0, 0, 1, 1,
-0.8946561, 0.4914002, -1.934765, 0, 0, 0, 1, 1,
-0.8938515, -1.598162, -1.297166, 0, 0, 0, 1, 1,
-0.8796687, -1.755851, -1.915597, 0, 0, 0, 1, 1,
-0.8778923, 1.583045, 0.8044391, 0, 0, 0, 1, 1,
-0.8750091, -1.000737, -3.062121, 0, 0, 0, 1, 1,
-0.874346, -0.3905716, -1.294764, 0, 0, 0, 1, 1,
-0.8676487, 1.024007, -1.286114, 0, 0, 0, 1, 1,
-0.8653764, 0.939265, -1.892086, 1, 1, 1, 1, 1,
-0.8651235, 0.1138793, -1.330719, 1, 1, 1, 1, 1,
-0.8627418, -0.2709171, -1.23041, 1, 1, 1, 1, 1,
-0.8590568, -1.090737, -1.523872, 1, 1, 1, 1, 1,
-0.8560196, -0.2132141, -2.022059, 1, 1, 1, 1, 1,
-0.8492054, -0.05319356, -2.536216, 1, 1, 1, 1, 1,
-0.8482003, -1.212116, -3.618413, 1, 1, 1, 1, 1,
-0.8426763, 0.4300815, -0.0967726, 1, 1, 1, 1, 1,
-0.8395071, 0.2679583, -1.115409, 1, 1, 1, 1, 1,
-0.8390346, -0.2430723, -2.794676, 1, 1, 1, 1, 1,
-0.8348046, -0.699719, -3.163497, 1, 1, 1, 1, 1,
-0.8346293, -0.4090133, -2.976556, 1, 1, 1, 1, 1,
-0.8324983, 1.119881, 0.8091955, 1, 1, 1, 1, 1,
-0.8276051, 0.6963639, -0.3312918, 1, 1, 1, 1, 1,
-0.8259953, -1.490089, -3.241438, 1, 1, 1, 1, 1,
-0.8206292, 1.168593, -0.7620488, 0, 0, 1, 1, 1,
-0.8133729, 0.4420897, -1.72873, 1, 0, 0, 1, 1,
-0.8122391, -1.172107, -2.790683, 1, 0, 0, 1, 1,
-0.8076566, -0.3643248, -1.76451, 1, 0, 0, 1, 1,
-0.8074035, 2.443365, -2.240496, 1, 0, 0, 1, 1,
-0.8011855, -0.008770379, -1.322071, 1, 0, 0, 1, 1,
-0.8004685, -0.776614, -2.219264, 0, 0, 0, 1, 1,
-0.7974705, 0.7911515, -0.6985315, 0, 0, 0, 1, 1,
-0.7922603, -1.963874, -3.129751, 0, 0, 0, 1, 1,
-0.7890016, -0.8674123, -1.874656, 0, 0, 0, 1, 1,
-0.784427, -0.1169736, -1.914729, 0, 0, 0, 1, 1,
-0.7806944, 0.2281915, -1.870804, 0, 0, 0, 1, 1,
-0.7798676, -0.9873837, -1.900475, 0, 0, 0, 1, 1,
-0.7707334, -0.02353221, -1.412561, 1, 1, 1, 1, 1,
-0.7651922, 1.077956, -0.055014, 1, 1, 1, 1, 1,
-0.763229, 1.00732, -1.672386, 1, 1, 1, 1, 1,
-0.7629411, 1.217934, -1.204882, 1, 1, 1, 1, 1,
-0.7626255, -0.1217586, -1.207102, 1, 1, 1, 1, 1,
-0.7607125, 0.6383193, -3.38298, 1, 1, 1, 1, 1,
-0.7595497, 0.6898659, -1.200064, 1, 1, 1, 1, 1,
-0.7579563, 0.1289398, -0.8854599, 1, 1, 1, 1, 1,
-0.7526271, -1.147093, -2.866569, 1, 1, 1, 1, 1,
-0.7488474, -0.3474541, -3.064148, 1, 1, 1, 1, 1,
-0.7461708, -0.2757736, -1.549953, 1, 1, 1, 1, 1,
-0.7440861, 0.4162972, -0.2534516, 1, 1, 1, 1, 1,
-0.7397155, -1.471381, -2.137306, 1, 1, 1, 1, 1,
-0.7366403, 1.329201, -0.4611444, 1, 1, 1, 1, 1,
-0.7306818, -0.8377625, -1.769647, 1, 1, 1, 1, 1,
-0.7302957, 1.139141, -0.4656579, 0, 0, 1, 1, 1,
-0.7296662, -1.650262, -3.859677, 1, 0, 0, 1, 1,
-0.7282451, 1.615012, -0.5916433, 1, 0, 0, 1, 1,
-0.7282217, -0.3147775, -0.9587994, 1, 0, 0, 1, 1,
-0.7272083, 0.1412126, 0.03824459, 1, 0, 0, 1, 1,
-0.7263744, 2.187438, -0.9584057, 1, 0, 0, 1, 1,
-0.7223074, 0.5526413, -1.177005, 0, 0, 0, 1, 1,
-0.7209626, -0.4360047, -3.73482, 0, 0, 0, 1, 1,
-0.7153547, -1.029593, -2.913497, 0, 0, 0, 1, 1,
-0.7144997, 2.055887, -0.6593351, 0, 0, 0, 1, 1,
-0.7104625, 0.2274075, -2.034502, 0, 0, 0, 1, 1,
-0.7080672, 0.282879, -0.7289057, 0, 0, 0, 1, 1,
-0.6971548, 0.4969447, -0.9967999, 0, 0, 0, 1, 1,
-0.6935652, -1.260855, -4.585324, 1, 1, 1, 1, 1,
-0.6930307, -0.05097117, -1.981632, 1, 1, 1, 1, 1,
-0.6920747, 1.075893, 0.2539585, 1, 1, 1, 1, 1,
-0.6891018, 0.6627614, -0.8526625, 1, 1, 1, 1, 1,
-0.6837465, -0.9391394, -0.02535958, 1, 1, 1, 1, 1,
-0.6823912, 0.2435318, -0.4374058, 1, 1, 1, 1, 1,
-0.6820741, 2.054894, -0.1999403, 1, 1, 1, 1, 1,
-0.6783406, -1.634309, -5.190056, 1, 1, 1, 1, 1,
-0.6770306, -1.122768, -2.924868, 1, 1, 1, 1, 1,
-0.6701506, -0.01047047, -1.926328, 1, 1, 1, 1, 1,
-0.6696914, 2.318413, 0.1162541, 1, 1, 1, 1, 1,
-0.6684741, -0.8421245, -2.870854, 1, 1, 1, 1, 1,
-0.6652502, -0.2538814, -1.969978, 1, 1, 1, 1, 1,
-0.6598399, -2.118809, -1.620071, 1, 1, 1, 1, 1,
-0.6594827, 0.62761, -4.632247, 1, 1, 1, 1, 1,
-0.6590546, -0.09713848, -2.266289, 0, 0, 1, 1, 1,
-0.6587843, -0.9489796, -2.504052, 1, 0, 0, 1, 1,
-0.6559596, 0.7631035, -1.21327, 1, 0, 0, 1, 1,
-0.6530887, 1.408152, -1.141594, 1, 0, 0, 1, 1,
-0.6525287, -0.878063, -2.024616, 1, 0, 0, 1, 1,
-0.6520459, 0.6014979, -1.232605, 1, 0, 0, 1, 1,
-0.6455703, -0.2791862, -1.737412, 0, 0, 0, 1, 1,
-0.6412525, 0.5926514, -0.665952, 0, 0, 0, 1, 1,
-0.6397893, 2.261482, -1.076035, 0, 0, 0, 1, 1,
-0.6395689, 0.1385121, -2.138715, 0, 0, 0, 1, 1,
-0.6365197, 0.4290613, -1.643301, 0, 0, 0, 1, 1,
-0.6289458, -1.82029, -4.814734, 0, 0, 0, 1, 1,
-0.6276307, 0.275082, -2.828049, 0, 0, 0, 1, 1,
-0.626159, 0.5056124, -0.8600059, 1, 1, 1, 1, 1,
-0.6197639, -1.294814, -3.441559, 1, 1, 1, 1, 1,
-0.6148903, 0.7092087, -2.270927, 1, 1, 1, 1, 1,
-0.6147215, 1.668352, 0.5515066, 1, 1, 1, 1, 1,
-0.6128306, -1.687809, -4.145903, 1, 1, 1, 1, 1,
-0.6102929, 0.8880015, -1.007184, 1, 1, 1, 1, 1,
-0.6053843, -0.9015622, -4.369369, 1, 1, 1, 1, 1,
-0.603875, -0.3984082, -2.052047, 1, 1, 1, 1, 1,
-0.5960878, -0.1246577, -1.879995, 1, 1, 1, 1, 1,
-0.5939588, 0.03286374, -0.7332192, 1, 1, 1, 1, 1,
-0.5924202, 0.2783119, -2.091533, 1, 1, 1, 1, 1,
-0.5908679, 1.363399, -1.903883, 1, 1, 1, 1, 1,
-0.5818159, -0.9272006, -2.187298, 1, 1, 1, 1, 1,
-0.5779228, -0.05269698, -2.560551, 1, 1, 1, 1, 1,
-0.5771877, -1.146618, -1.628802, 1, 1, 1, 1, 1,
-0.5763836, -0.2345711, 0.3241044, 0, 0, 1, 1, 1,
-0.5701295, -1.464987, -1.485767, 1, 0, 0, 1, 1,
-0.5684355, 1.248986, -0.1581801, 1, 0, 0, 1, 1,
-0.5638575, -1.278344, -2.849565, 1, 0, 0, 1, 1,
-0.5619309, 1.711297, -0.1145326, 1, 0, 0, 1, 1,
-0.5578977, 1.540246, 0.3599821, 1, 0, 0, 1, 1,
-0.5562322, -1.345104, -2.805304, 0, 0, 0, 1, 1,
-0.5557017, 1.526195, 1.868243, 0, 0, 0, 1, 1,
-0.5520057, 0.04812415, -1.582364, 0, 0, 0, 1, 1,
-0.5492309, -1.748079, -2.578681, 0, 0, 0, 1, 1,
-0.5435414, 1.090349, 1.132014, 0, 0, 0, 1, 1,
-0.5434408, 0.7213064, 0.1584033, 0, 0, 0, 1, 1,
-0.5409951, -1.745754, -2.275557, 0, 0, 0, 1, 1,
-0.5376545, -0.4251896, -1.681046, 1, 1, 1, 1, 1,
-0.5343544, 0.8067066, -0.8979365, 1, 1, 1, 1, 1,
-0.5294643, -0.3245653, -3.360825, 1, 1, 1, 1, 1,
-0.5284062, -1.688072, -3.405767, 1, 1, 1, 1, 1,
-0.5281793, -0.08650108, -0.5876116, 1, 1, 1, 1, 1,
-0.5278257, 1.099828, 0.2693346, 1, 1, 1, 1, 1,
-0.527257, -1.120006, -1.301347, 1, 1, 1, 1, 1,
-0.525484, 0.6005137, -0.67656, 1, 1, 1, 1, 1,
-0.5162303, 1.207023, 0.3208342, 1, 1, 1, 1, 1,
-0.5145615, -0.1720379, -1.337851, 1, 1, 1, 1, 1,
-0.5098481, -1.185989, -4.314143, 1, 1, 1, 1, 1,
-0.5028063, -0.3167502, -1.790884, 1, 1, 1, 1, 1,
-0.4963459, 0.1416127, -0.8005293, 1, 1, 1, 1, 1,
-0.4959882, 1.512863, 0.2420201, 1, 1, 1, 1, 1,
-0.4958097, -0.1623429, -3.058434, 1, 1, 1, 1, 1,
-0.4946203, -0.5196601, -1.137702, 0, 0, 1, 1, 1,
-0.4877172, -0.02805256, -1.559241, 1, 0, 0, 1, 1,
-0.4853413, 0.6470051, 0.1908144, 1, 0, 0, 1, 1,
-0.4847082, -0.937152, -2.414792, 1, 0, 0, 1, 1,
-0.4844088, -1.000311, -1.58133, 1, 0, 0, 1, 1,
-0.4838059, -0.3505662, -3.575766, 1, 0, 0, 1, 1,
-0.4818082, -0.07279808, -2.600191, 0, 0, 0, 1, 1,
-0.4807767, 1.84727, -1.025179, 0, 0, 0, 1, 1,
-0.476703, -0.867381, -1.408051, 0, 0, 0, 1, 1,
-0.4726846, -0.655644, -2.905054, 0, 0, 0, 1, 1,
-0.4699725, 0.1342047, -1.279636, 0, 0, 0, 1, 1,
-0.4698223, 0.1036921, -1.360164, 0, 0, 0, 1, 1,
-0.468435, -0.5868735, -1.724211, 0, 0, 0, 1, 1,
-0.4671871, -0.2000916, -3.619548, 1, 1, 1, 1, 1,
-0.4594333, 1.750106, 1.426578, 1, 1, 1, 1, 1,
-0.4578231, 0.2846027, -0.05217002, 1, 1, 1, 1, 1,
-0.4484156, 0.09674057, 0.2215018, 1, 1, 1, 1, 1,
-0.444377, -0.7652938, -2.799087, 1, 1, 1, 1, 1,
-0.4442627, 0.4278349, -0.3263567, 1, 1, 1, 1, 1,
-0.4423245, -0.5198739, -2.939852, 1, 1, 1, 1, 1,
-0.4408477, 0.4481494, 1.276906, 1, 1, 1, 1, 1,
-0.4394683, 1.297562, -2.674767, 1, 1, 1, 1, 1,
-0.4382675, 0.4774129, 0.1085774, 1, 1, 1, 1, 1,
-0.436881, -0.3268165, -2.33713, 1, 1, 1, 1, 1,
-0.4366083, -2.433514, -4.027039, 1, 1, 1, 1, 1,
-0.4343535, -0.3494124, -3.545761, 1, 1, 1, 1, 1,
-0.4286467, -0.9498785, -3.899959, 1, 1, 1, 1, 1,
-0.4266517, -1.738011, -3.429865, 1, 1, 1, 1, 1,
-0.4242551, -1.146802, -1.528478, 0, 0, 1, 1, 1,
-0.4178579, 0.116667, -1.789038, 1, 0, 0, 1, 1,
-0.4130972, -1.307417, -2.536909, 1, 0, 0, 1, 1,
-0.4113803, 0.2514697, -2.377096, 1, 0, 0, 1, 1,
-0.4099913, 1.084175, 0.7995576, 1, 0, 0, 1, 1,
-0.4067288, -0.4879239, 1.131578, 1, 0, 0, 1, 1,
-0.4038009, -0.778142, -3.36419, 0, 0, 0, 1, 1,
-0.4019758, 0.3742038, -1.488747, 0, 0, 0, 1, 1,
-0.395143, 0.1369168, -1.764915, 0, 0, 0, 1, 1,
-0.3944438, 1.408913, 1.29656, 0, 0, 0, 1, 1,
-0.3910116, -0.5621163, -3.23878, 0, 0, 0, 1, 1,
-0.3839189, -0.04258016, -2.063824, 0, 0, 0, 1, 1,
-0.38331, 1.07005, -1.64805, 0, 0, 0, 1, 1,
-0.3827969, 0.6433471, 0.07539085, 1, 1, 1, 1, 1,
-0.3789822, 0.6632491, -1.318592, 1, 1, 1, 1, 1,
-0.3770875, -2.009598, -2.24532, 1, 1, 1, 1, 1,
-0.3751824, 0.0973257, -1.380522, 1, 1, 1, 1, 1,
-0.3704672, -1.497653, -2.895206, 1, 1, 1, 1, 1,
-0.368586, -1.566425, -3.054752, 1, 1, 1, 1, 1,
-0.3667646, -1.199312, -1.063468, 1, 1, 1, 1, 1,
-0.3659949, 2.04039, -1.909914, 1, 1, 1, 1, 1,
-0.3640522, 0.04726733, -0.3804032, 1, 1, 1, 1, 1,
-0.3638593, 0.7711585, 1.665842, 1, 1, 1, 1, 1,
-0.3637607, -0.6998066, -3.949522, 1, 1, 1, 1, 1,
-0.3624212, -0.3389171, -2.638661, 1, 1, 1, 1, 1,
-0.3606733, 0.004451385, -2.268009, 1, 1, 1, 1, 1,
-0.3577149, 1.465671, -0.124575, 1, 1, 1, 1, 1,
-0.3568472, -1.085902, -2.730145, 1, 1, 1, 1, 1,
-0.3557596, -0.5370687, -2.981657, 0, 0, 1, 1, 1,
-0.3546262, 0.2097459, -1.040302, 1, 0, 0, 1, 1,
-0.3532669, -0.7329262, -3.64527, 1, 0, 0, 1, 1,
-0.3526983, 0.8474265, 0.001666414, 1, 0, 0, 1, 1,
-0.348967, -0.3200939, -3.661771, 1, 0, 0, 1, 1,
-0.3462053, -2.441476, -3.047154, 1, 0, 0, 1, 1,
-0.3430199, 2.09198, 0.7458692, 0, 0, 0, 1, 1,
-0.3421742, 0.4174905, -1.539109, 0, 0, 0, 1, 1,
-0.3421054, -0.3811444, -2.148722, 0, 0, 0, 1, 1,
-0.3396498, 0.9467003, -2.598262, 0, 0, 0, 1, 1,
-0.3382128, 0.6748884, 0.3943588, 0, 0, 0, 1, 1,
-0.3347874, 0.2015136, -0.9581428, 0, 0, 0, 1, 1,
-0.3297329, 0.1271618, -1.638384, 0, 0, 0, 1, 1,
-0.3279234, -1.99646, -4.27465, 1, 1, 1, 1, 1,
-0.324104, 1.01272, -0.5242509, 1, 1, 1, 1, 1,
-0.3230855, -0.3836003, -0.6520585, 1, 1, 1, 1, 1,
-0.3212931, 1.612547, -0.5278906, 1, 1, 1, 1, 1,
-0.3179369, -0.09207869, -1.846885, 1, 1, 1, 1, 1,
-0.3143474, -0.05349822, -0.2271937, 1, 1, 1, 1, 1,
-0.3050022, -0.4515924, -2.246263, 1, 1, 1, 1, 1,
-0.3018628, 0.08352205, -1.177396, 1, 1, 1, 1, 1,
-0.3015324, -0.5236753, -3.417674, 1, 1, 1, 1, 1,
-0.2979706, 1.824124, -0.4925254, 1, 1, 1, 1, 1,
-0.2927888, -1.05959, -3.203763, 1, 1, 1, 1, 1,
-0.2879348, -0.9918399, -2.20654, 1, 1, 1, 1, 1,
-0.2865017, 0.2795452, -0.734103, 1, 1, 1, 1, 1,
-0.28611, -1.066408, -3.003496, 1, 1, 1, 1, 1,
-0.2836008, 1.264193, 0.3490331, 1, 1, 1, 1, 1,
-0.2827923, -0.3437894, -3.169156, 0, 0, 1, 1, 1,
-0.2732154, -0.5388741, -3.259347, 1, 0, 0, 1, 1,
-0.2666445, -0.5998582, -1.836253, 1, 0, 0, 1, 1,
-0.2650898, -3.020043, -2.974392, 1, 0, 0, 1, 1,
-0.2646412, -1.659094, -4.150065, 1, 0, 0, 1, 1,
-0.2585785, 0.03369689, -0.2746491, 1, 0, 0, 1, 1,
-0.2562649, -1.849987, -2.309705, 0, 0, 0, 1, 1,
-0.2558405, 1.201181, 0.307741, 0, 0, 0, 1, 1,
-0.2513602, 0.373172, -1.602257, 0, 0, 0, 1, 1,
-0.2458573, 0.8636093, 0.1115732, 0, 0, 0, 1, 1,
-0.2331099, -0.2988999, -4.228333, 0, 0, 0, 1, 1,
-0.2327363, -0.1850343, -1.871009, 0, 0, 0, 1, 1,
-0.2307591, 0.1284741, -1.445415, 0, 0, 0, 1, 1,
-0.2269931, 0.7116599, -1.114551, 1, 1, 1, 1, 1,
-0.2268752, -1.73429, -2.56472, 1, 1, 1, 1, 1,
-0.2237299, -1.548656, -2.836046, 1, 1, 1, 1, 1,
-0.2177196, 0.8035222, -0.3962885, 1, 1, 1, 1, 1,
-0.212263, 0.824891, -1.522213, 1, 1, 1, 1, 1,
-0.2078981, -1.055138, -3.538913, 1, 1, 1, 1, 1,
-0.2070085, -0.3877169, -2.356821, 1, 1, 1, 1, 1,
-0.2063811, 1.451281, 1.950898, 1, 1, 1, 1, 1,
-0.2048547, -0.391905, -2.779534, 1, 1, 1, 1, 1,
-0.2010198, 0.1327523, -0.9556825, 1, 1, 1, 1, 1,
-0.1984104, -0.4032789, -3.349281, 1, 1, 1, 1, 1,
-0.1963103, 0.05645781, -2.08535, 1, 1, 1, 1, 1,
-0.1926842, 1.679748, 1.31394, 1, 1, 1, 1, 1,
-0.1918617, 0.4033733, -0.01733946, 1, 1, 1, 1, 1,
-0.1900857, -0.5093867, -3.085723, 1, 1, 1, 1, 1,
-0.1845714, -0.4000421, -1.931343, 0, 0, 1, 1, 1,
-0.1789038, 0.3233782, 0.2972344, 1, 0, 0, 1, 1,
-0.1762429, -0.2606282, -2.477933, 1, 0, 0, 1, 1,
-0.1760935, 0.08958501, -1.144833, 1, 0, 0, 1, 1,
-0.1708445, -0.9732705, -4.954045, 1, 0, 0, 1, 1,
-0.1708345, 0.9419613, -1.163766, 1, 0, 0, 1, 1,
-0.1683986, 0.07688854, -1.325458, 0, 0, 0, 1, 1,
-0.1640565, 0.2586606, 0.9306929, 0, 0, 0, 1, 1,
-0.1618576, 1.346765, 1.130616, 0, 0, 0, 1, 1,
-0.1613007, -1.114395, -4.761022, 0, 0, 0, 1, 1,
-0.1602651, -1.053604, -2.384076, 0, 0, 0, 1, 1,
-0.1600484, 1.044907, -1.088117, 0, 0, 0, 1, 1,
-0.1588882, 1.195236, -1.557879, 0, 0, 0, 1, 1,
-0.1496874, 0.4749722, -0.6214666, 1, 1, 1, 1, 1,
-0.148737, 0.9205415, 1.039491, 1, 1, 1, 1, 1,
-0.1483704, -1.309745, -0.4537327, 1, 1, 1, 1, 1,
-0.1436921, 0.9595694, -1.553612, 1, 1, 1, 1, 1,
-0.1420298, 0.5943321, -1.228941, 1, 1, 1, 1, 1,
-0.1403245, 1.052463, 0.971361, 1, 1, 1, 1, 1,
-0.1399723, 0.2311608, -0.2160691, 1, 1, 1, 1, 1,
-0.1398928, 0.1125, -0.9053463, 1, 1, 1, 1, 1,
-0.1355529, -1.337349, -2.312853, 1, 1, 1, 1, 1,
-0.1337543, 1.528387, 1.498378, 1, 1, 1, 1, 1,
-0.1325836, -0.4638701, -1.42466, 1, 1, 1, 1, 1,
-0.1285687, -0.5869743, -3.95601, 1, 1, 1, 1, 1,
-0.1226299, -0.7786109, -3.57596, 1, 1, 1, 1, 1,
-0.1208996, 1.734074, 1.448916, 1, 1, 1, 1, 1,
-0.1180393, 0.7412068, 0.3166282, 1, 1, 1, 1, 1,
-0.1145543, 2.058448, -0.7190964, 0, 0, 1, 1, 1,
-0.1139358, -1.86087, -2.149759, 1, 0, 0, 1, 1,
-0.1138177, 0.7373152, -0.5298315, 1, 0, 0, 1, 1,
-0.1108453, 0.897546, 0.3999085, 1, 0, 0, 1, 1,
-0.110837, 0.3529767, -0.6822393, 1, 0, 0, 1, 1,
-0.1080621, 1.4754, 1.673803, 1, 0, 0, 1, 1,
-0.1070982, -2.073493, -2.465933, 0, 0, 0, 1, 1,
-0.1070644, -0.5314365, -4.321915, 0, 0, 0, 1, 1,
-0.1057207, 0.9233116, -1.5367, 0, 0, 0, 1, 1,
-0.1052683, 0.3085282, -0.1200707, 0, 0, 0, 1, 1,
-0.1048893, -1.689195, -2.574752, 0, 0, 0, 1, 1,
-0.1024525, 0.834192, 0.3182177, 0, 0, 0, 1, 1,
-0.0983654, -1.616538, -4.339923, 0, 0, 0, 1, 1,
-0.0936771, 1.378088, 1.037658, 1, 1, 1, 1, 1,
-0.0920462, -2.197097, -3.470163, 1, 1, 1, 1, 1,
-0.08843232, -0.254748, -2.651986, 1, 1, 1, 1, 1,
-0.08615226, -1.995109, -2.881791, 1, 1, 1, 1, 1,
-0.08548056, 0.2364112, 1.429928, 1, 1, 1, 1, 1,
-0.08377348, 0.9901235, -0.4672103, 1, 1, 1, 1, 1,
-0.08311228, 0.5037915, -1.182434, 1, 1, 1, 1, 1,
-0.0814463, -0.4798108, -0.8797061, 1, 1, 1, 1, 1,
-0.07954887, 0.1529998, -0.2917554, 1, 1, 1, 1, 1,
-0.07835917, -0.5078129, -3.498074, 1, 1, 1, 1, 1,
-0.07653601, -0.8130025, -3.5181, 1, 1, 1, 1, 1,
-0.07379798, 0.8369778, 0.3761323, 1, 1, 1, 1, 1,
-0.07298163, -0.2686674, -3.966954, 1, 1, 1, 1, 1,
-0.07002103, -2.329969, -3.790024, 1, 1, 1, 1, 1,
-0.06859618, -0.4810953, -2.804633, 1, 1, 1, 1, 1,
-0.06670257, -0.8967222, -2.906075, 0, 0, 1, 1, 1,
-0.0635415, 0.6351043, 2.513472, 1, 0, 0, 1, 1,
-0.05677939, 1.478857, 0.6001895, 1, 0, 0, 1, 1,
-0.05460186, -0.2819521, -2.774259, 1, 0, 0, 1, 1,
-0.0544334, 1.394408, 0.9181763, 1, 0, 0, 1, 1,
-0.0528347, -0.09661975, -2.805575, 1, 0, 0, 1, 1,
-0.05238188, -0.2700279, -1.997268, 0, 0, 0, 1, 1,
-0.0495538, 0.4113538, 0.7902367, 0, 0, 0, 1, 1,
-0.04762878, 0.09204444, -0.1117848, 0, 0, 0, 1, 1,
-0.04170211, 0.6002952, 0.6085635, 0, 0, 0, 1, 1,
-0.03918823, -1.129706, -5.053722, 0, 0, 0, 1, 1,
-0.03779075, -0.5228497, -3.525001, 0, 0, 0, 1, 1,
-0.03733688, -0.7591792, -3.061049, 0, 0, 0, 1, 1,
-0.03522838, 0.688043, -1.10161, 1, 1, 1, 1, 1,
-0.03384188, -1.593008, -3.987419, 1, 1, 1, 1, 1,
-0.03321626, -1.557572, -2.273352, 1, 1, 1, 1, 1,
-0.03081357, -1.563701, -4.230099, 1, 1, 1, 1, 1,
-0.02876993, 1.427902, -0.3551698, 1, 1, 1, 1, 1,
-0.02775141, -1.59548, -3.062704, 1, 1, 1, 1, 1,
-0.02595426, 1.902476, 1.392179, 1, 1, 1, 1, 1,
-0.02485231, -0.03250796, -2.098191, 1, 1, 1, 1, 1,
-0.02188753, 1.182993, 1.86721, 1, 1, 1, 1, 1,
-0.01868737, -0.9737174, -4.462539, 1, 1, 1, 1, 1,
-0.01257036, -0.8979855, -3.294924, 1, 1, 1, 1, 1,
-0.01091759, -1.859696, -2.920347, 1, 1, 1, 1, 1,
-0.01039724, 0.7804554, -0.4253682, 1, 1, 1, 1, 1,
-0.008972211, -0.9029288, -2.891368, 1, 1, 1, 1, 1,
-0.002975023, 1.511108, -0.3544171, 1, 1, 1, 1, 1,
-0.002562635, -0.3229111, -2.170651, 0, 0, 1, 1, 1,
-0.001954299, -0.2088934, -4.336942, 1, 0, 0, 1, 1,
-0.0004103207, 2.28056, -0.3684619, 1, 0, 0, 1, 1,
0.001299749, -0.6749878, 5.867774, 1, 0, 0, 1, 1,
0.002531544, 1.868539, 0.9562995, 1, 0, 0, 1, 1,
0.009428729, 1.199139, -0.1067698, 1, 0, 0, 1, 1,
0.01543663, -0.4700346, 2.551836, 0, 0, 0, 1, 1,
0.0170678, 0.2791534, 0.0974559, 0, 0, 0, 1, 1,
0.02056156, -0.676264, 4.019324, 0, 0, 0, 1, 1,
0.02594968, -0.4214888, 2.935675, 0, 0, 0, 1, 1,
0.02956097, -0.3801437, 2.870142, 0, 0, 0, 1, 1,
0.03381039, 0.044692, 0.02074143, 0, 0, 0, 1, 1,
0.03416971, 0.1233575, -0.8476728, 0, 0, 0, 1, 1,
0.03653444, 0.5328146, -2.945969, 1, 1, 1, 1, 1,
0.03724256, -0.8326717, 0.9155135, 1, 1, 1, 1, 1,
0.03772977, 0.7738793, -0.4662701, 1, 1, 1, 1, 1,
0.04151423, 0.05110938, 0.268962, 1, 1, 1, 1, 1,
0.0453849, 0.03772321, 1.020629, 1, 1, 1, 1, 1,
0.04654206, 0.7556884, -1.241569, 1, 1, 1, 1, 1,
0.04752402, -0.03140125, 1.566965, 1, 1, 1, 1, 1,
0.05270934, 0.1348246, 0.6321412, 1, 1, 1, 1, 1,
0.05298181, 0.4398448, 1.024809, 1, 1, 1, 1, 1,
0.05307132, -0.08287244, 2.807754, 1, 1, 1, 1, 1,
0.05671342, -0.04967759, 2.118385, 1, 1, 1, 1, 1,
0.05709746, 0.4613831, -0.7706447, 1, 1, 1, 1, 1,
0.05812999, 0.773841, -0.6807411, 1, 1, 1, 1, 1,
0.06196665, 1.08777, 1.070192, 1, 1, 1, 1, 1,
0.06231704, -1.780439, 4.161803, 1, 1, 1, 1, 1,
0.06367832, -0.9856048, 2.438165, 0, 0, 1, 1, 1,
0.06408435, -1.209742, 2.779863, 1, 0, 0, 1, 1,
0.06901305, -0.1402663, 2.924501, 1, 0, 0, 1, 1,
0.0706633, -0.9376739, 3.885452, 1, 0, 0, 1, 1,
0.07646328, -0.4343556, 4.576128, 1, 0, 0, 1, 1,
0.07920141, -0.2726653, 2.732169, 1, 0, 0, 1, 1,
0.0795184, 0.1635119, -0.1008904, 0, 0, 0, 1, 1,
0.0824333, -0.9996483, 2.715363, 0, 0, 0, 1, 1,
0.08304951, 0.1669707, -0.8992944, 0, 0, 0, 1, 1,
0.08410116, -0.3205293, 1.157406, 0, 0, 0, 1, 1,
0.08460859, -1.009011, 2.200749, 0, 0, 0, 1, 1,
0.08807152, -1.593583, 2.961511, 0, 0, 0, 1, 1,
0.09014681, -0.462666, 3.421207, 0, 0, 0, 1, 1,
0.09098785, 0.001377188, 0.2660925, 1, 1, 1, 1, 1,
0.09794197, -1.326314, 1.849918, 1, 1, 1, 1, 1,
0.100448, -0.5466486, 4.603955, 1, 1, 1, 1, 1,
0.1011821, -0.1033649, 0.308311, 1, 1, 1, 1, 1,
0.1051497, -0.5740503, 3.20133, 1, 1, 1, 1, 1,
0.1053678, 1.026252, -0.9402922, 1, 1, 1, 1, 1,
0.1079224, -0.1524332, 3.805926, 1, 1, 1, 1, 1,
0.1107645, -1.057114, 2.906212, 1, 1, 1, 1, 1,
0.1111527, 1.523668, 1.665005, 1, 1, 1, 1, 1,
0.1117454, -0.6563964, 3.573023, 1, 1, 1, 1, 1,
0.1130118, -2.018219, 2.218942, 1, 1, 1, 1, 1,
0.1140056, -1.604131, 1.896302, 1, 1, 1, 1, 1,
0.1152337, -1.618032, 2.880604, 1, 1, 1, 1, 1,
0.1186713, -1.017102, 2.025717, 1, 1, 1, 1, 1,
0.1220686, 0.5076554, -0.1374513, 1, 1, 1, 1, 1,
0.1245391, -0.3303818, 2.574504, 0, 0, 1, 1, 1,
0.1262826, 0.325753, -0.2075984, 1, 0, 0, 1, 1,
0.1287664, -0.6903119, 3.966429, 1, 0, 0, 1, 1,
0.1314793, -1.492636, 1.260314, 1, 0, 0, 1, 1,
0.1346364, -0.9110407, 0.7773315, 1, 0, 0, 1, 1,
0.139232, -1.471064, 2.568316, 1, 0, 0, 1, 1,
0.1427088, -1.167559, 1.496493, 0, 0, 0, 1, 1,
0.1438864, -0.6665955, 3.016072, 0, 0, 0, 1, 1,
0.1454457, -1.636986, 5.082574, 0, 0, 0, 1, 1,
0.1460028, 1.667694, 0.3727832, 0, 0, 0, 1, 1,
0.1460939, 0.2467481, 0.2542498, 0, 0, 0, 1, 1,
0.1474751, -2.252326, 1.288542, 0, 0, 0, 1, 1,
0.1484507, -0.4513909, 2.809541, 0, 0, 0, 1, 1,
0.1516571, 0.4344614, 1.665604, 1, 1, 1, 1, 1,
0.1540279, 1.858842, 0.8731102, 1, 1, 1, 1, 1,
0.1558797, -0.6252532, 3.527658, 1, 1, 1, 1, 1,
0.1573224, 0.1238705, 2.504003, 1, 1, 1, 1, 1,
0.1592074, 0.3485657, 1.01881, 1, 1, 1, 1, 1,
0.1635238, -2.51816, 3.440092, 1, 1, 1, 1, 1,
0.1681253, 1.706992, 0.9630236, 1, 1, 1, 1, 1,
0.1720835, 0.9454733, -0.3901463, 1, 1, 1, 1, 1,
0.1731456, -0.4192536, 0.359091, 1, 1, 1, 1, 1,
0.1746735, -1.393757, 2.550865, 1, 1, 1, 1, 1,
0.175649, 0.9902498, 1.76447, 1, 1, 1, 1, 1,
0.1803441, -1.650709, 2.864951, 1, 1, 1, 1, 1,
0.1877861, 1.594993, -0.0003173032, 1, 1, 1, 1, 1,
0.1879911, 0.2115267, -1.263388, 1, 1, 1, 1, 1,
0.1936032, 0.1147643, -0.2793163, 1, 1, 1, 1, 1,
0.2014458, 0.341716, 2.097085, 0, 0, 1, 1, 1,
0.2039557, -2.445086, 1.606704, 1, 0, 0, 1, 1,
0.2056801, -0.3297895, 2.687528, 1, 0, 0, 1, 1,
0.2095899, -0.650896, 3.574088, 1, 0, 0, 1, 1,
0.2116957, 0.1021696, 1.775507, 1, 0, 0, 1, 1,
0.2128659, 0.3619334, -0.3778151, 1, 0, 0, 1, 1,
0.2241666, -0.6297131, 2.095574, 0, 0, 0, 1, 1,
0.230123, 2.445342, -0.2762426, 0, 0, 0, 1, 1,
0.2332151, -1.278913, 2.537388, 0, 0, 0, 1, 1,
0.2376004, 0.8045498, 1.746135, 0, 0, 0, 1, 1,
0.2400455, 0.9253895, 2.404925, 0, 0, 0, 1, 1,
0.2408136, -0.2526733, 3.463232, 0, 0, 0, 1, 1,
0.2426604, -0.3102045, 1.931623, 0, 0, 0, 1, 1,
0.2440465, -0.4440992, 2.672316, 1, 1, 1, 1, 1,
0.2492387, -1.150343, 1.726785, 1, 1, 1, 1, 1,
0.2512417, -0.5434061, 2.288425, 1, 1, 1, 1, 1,
0.2514401, -0.2291184, 3.195789, 1, 1, 1, 1, 1,
0.2515065, -0.1979118, 2.682259, 1, 1, 1, 1, 1,
0.2525474, -0.2961883, 3.019421, 1, 1, 1, 1, 1,
0.2533493, -1.332083, 2.162505, 1, 1, 1, 1, 1,
0.2536191, 0.5372456, -0.2068566, 1, 1, 1, 1, 1,
0.2578467, 0.8995723, 1.373013, 1, 1, 1, 1, 1,
0.2593175, -0.06160331, 1.141096, 1, 1, 1, 1, 1,
0.2595721, 0.04019284, 1.0711, 1, 1, 1, 1, 1,
0.2635585, -0.7658948, 4.765526, 1, 1, 1, 1, 1,
0.2669268, -1.329517, 1.846256, 1, 1, 1, 1, 1,
0.269779, -0.7781147, 1.850957, 1, 1, 1, 1, 1,
0.2711648, -0.6417152, 0.8153805, 1, 1, 1, 1, 1,
0.2738104, -0.7955881, 2.136993, 0, 0, 1, 1, 1,
0.2744108, 0.3213153, 1.087286, 1, 0, 0, 1, 1,
0.2830735, -0.08636925, 0.8224815, 1, 0, 0, 1, 1,
0.2863022, -1.773663, 2.135085, 1, 0, 0, 1, 1,
0.2888964, 0.9688938, 1.54954, 1, 0, 0, 1, 1,
0.2976039, -1.135774, 2.355115, 1, 0, 0, 1, 1,
0.297661, -0.3409758, 3.370393, 0, 0, 0, 1, 1,
0.2977403, 0.5277248, -0.03529961, 0, 0, 0, 1, 1,
0.2979037, -1.095062, 5.111113, 0, 0, 0, 1, 1,
0.2992646, 0.5220217, -0.02347471, 0, 0, 0, 1, 1,
0.2993338, -0.05465564, 0.7167796, 0, 0, 0, 1, 1,
0.3024178, 0.3271097, 2.973741, 0, 0, 0, 1, 1,
0.3097034, 1.46376, 0.15253, 0, 0, 0, 1, 1,
0.3130184, -1.229756, 2.435727, 1, 1, 1, 1, 1,
0.3135073, -0.1782558, 2.82301, 1, 1, 1, 1, 1,
0.3142939, -1.982794, 3.230438, 1, 1, 1, 1, 1,
0.319735, 1.165102, -0.8724902, 1, 1, 1, 1, 1,
0.3229991, -2.094879, 3.635132, 1, 1, 1, 1, 1,
0.3258813, 1.035637, -0.3343137, 1, 1, 1, 1, 1,
0.326872, 1.331828, -0.7071946, 1, 1, 1, 1, 1,
0.3270639, 0.1261698, 2.479975, 1, 1, 1, 1, 1,
0.3271301, -0.9915147, 2.423898, 1, 1, 1, 1, 1,
0.3276942, 1.700521, 2.860873, 1, 1, 1, 1, 1,
0.3322191, 2.318706, 1.360866, 1, 1, 1, 1, 1,
0.3340222, 0.7676348, 0.2690671, 1, 1, 1, 1, 1,
0.3364755, -0.9612485, 0.2480568, 1, 1, 1, 1, 1,
0.3389894, -0.3178172, 3.447658, 1, 1, 1, 1, 1,
0.3390834, -0.6032452, 3.388629, 1, 1, 1, 1, 1,
0.3408436, -0.4927488, 2.39997, 0, 0, 1, 1, 1,
0.3439654, -0.2197023, 1.511701, 1, 0, 0, 1, 1,
0.3456421, 1.434751, 1.081816, 1, 0, 0, 1, 1,
0.3456528, -1.26941, 3.008083, 1, 0, 0, 1, 1,
0.3461921, 0.8147924, 0.1224166, 1, 0, 0, 1, 1,
0.3529538, -0.4137283, 2.012434, 1, 0, 0, 1, 1,
0.3572083, 1.591418, 0.1880064, 0, 0, 0, 1, 1,
0.3576111, -1.64165, 0.9390608, 0, 0, 0, 1, 1,
0.3583048, 0.6853411, 1.200201, 0, 0, 0, 1, 1,
0.3647854, 0.5339122, 0.1708065, 0, 0, 0, 1, 1,
0.3664691, 0.08318683, 0.3991097, 0, 0, 0, 1, 1,
0.3673086, -2.13771, 4.318256, 0, 0, 0, 1, 1,
0.3705657, -0.1609968, 3.503957, 0, 0, 0, 1, 1,
0.3727815, 0.02646728, -0.4815042, 1, 1, 1, 1, 1,
0.3734781, -0.677268, 2.346261, 1, 1, 1, 1, 1,
0.3736221, -0.6198416, 3.66019, 1, 1, 1, 1, 1,
0.3770465, -2.162917, 3.316914, 1, 1, 1, 1, 1,
0.3804611, -0.7175215, 3.081154, 1, 1, 1, 1, 1,
0.3827817, -1.564686, 2.82684, 1, 1, 1, 1, 1,
0.3869515, 1.279105, -1.167035, 1, 1, 1, 1, 1,
0.389248, -0.2517075, 2.481718, 1, 1, 1, 1, 1,
0.392166, 2.514388, -1.494217, 1, 1, 1, 1, 1,
0.3929369, 0.926556, -0.2176781, 1, 1, 1, 1, 1,
0.39868, -0.7736115, 4.304584, 1, 1, 1, 1, 1,
0.4020275, -0.07610642, 2.580298, 1, 1, 1, 1, 1,
0.4023729, -0.06213977, 1.768904, 1, 1, 1, 1, 1,
0.4024675, 0.2211577, 1.591242, 1, 1, 1, 1, 1,
0.4039643, -0.2681171, 2.715126, 1, 1, 1, 1, 1,
0.4046679, 1.676363, -0.4306038, 0, 0, 1, 1, 1,
0.4088932, -1.383569, 2.555378, 1, 0, 0, 1, 1,
0.4149009, 0.3075071, 0.2881311, 1, 0, 0, 1, 1,
0.4164429, 0.3476842, 0.1033225, 1, 0, 0, 1, 1,
0.4165388, 1.091509, 1.975336, 1, 0, 0, 1, 1,
0.4202414, 0.7372569, -1.087732, 1, 0, 0, 1, 1,
0.4307355, 0.697697, 1.572035, 0, 0, 0, 1, 1,
0.4313288, -1.853036, 4.834338, 0, 0, 0, 1, 1,
0.4334041, -0.1128348, 0.4573434, 0, 0, 0, 1, 1,
0.4370236, 0.966821, 0.3319232, 0, 0, 0, 1, 1,
0.4373335, -0.2704118, 1.329735, 0, 0, 0, 1, 1,
0.440584, -1.054852, 3.764542, 0, 0, 0, 1, 1,
0.4437184, 1.601798, 0.06824169, 0, 0, 0, 1, 1,
0.4528829, -0.7596999, 4.437337, 1, 1, 1, 1, 1,
0.4595497, -0.3404516, 2.174916, 1, 1, 1, 1, 1,
0.4710873, -1.018951, 2.520627, 1, 1, 1, 1, 1,
0.4713338, 0.09289221, 1.435182, 1, 1, 1, 1, 1,
0.4722917, -1.792444, 2.337753, 1, 1, 1, 1, 1,
0.4725862, -1.424548, 2.170097, 1, 1, 1, 1, 1,
0.475494, 0.2135198, 1.172029, 1, 1, 1, 1, 1,
0.4756621, 1.060811, 0.7837534, 1, 1, 1, 1, 1,
0.475998, -2.409434, 1.960872, 1, 1, 1, 1, 1,
0.4760719, 0.932712, -0.9085717, 1, 1, 1, 1, 1,
0.4808471, 0.4534462, 1.872624, 1, 1, 1, 1, 1,
0.4821204, -1.053946, 4.033067, 1, 1, 1, 1, 1,
0.488652, 0.3132644, 0.9388858, 1, 1, 1, 1, 1,
0.4944887, -0.3858503, 1.589347, 1, 1, 1, 1, 1,
0.4970703, 0.5697637, 0.8847071, 1, 1, 1, 1, 1,
0.5040011, 0.581376, 0.2785932, 0, 0, 1, 1, 1,
0.5067001, 0.3843361, -0.8446519, 1, 0, 0, 1, 1,
0.5077232, 0.2349827, -0.5842714, 1, 0, 0, 1, 1,
0.5125961, -0.08925258, 2.066833, 1, 0, 0, 1, 1,
0.5169991, 0.7616195, 1.479043, 1, 0, 0, 1, 1,
0.517847, -0.6387642, 2.085893, 1, 0, 0, 1, 1,
0.5202671, 0.07020038, 0.5392244, 0, 0, 0, 1, 1,
0.52175, 0.8212876, 1.344029, 0, 0, 0, 1, 1,
0.5231971, -0.212452, 0.7320495, 0, 0, 0, 1, 1,
0.5234606, -1.37792, 2.813688, 0, 0, 0, 1, 1,
0.5253872, -0.2046366, 3.009534, 0, 0, 0, 1, 1,
0.5292689, -0.1371714, 2.308432, 0, 0, 0, 1, 1,
0.5300064, -0.9653052, 2.42908, 0, 0, 0, 1, 1,
0.5313612, 2.579088, 0.2647641, 1, 1, 1, 1, 1,
0.5327589, 0.6820021, 1.2429, 1, 1, 1, 1, 1,
0.5417416, -0.1673911, 1.852642, 1, 1, 1, 1, 1,
0.5423596, -0.1768311, 3.524789, 1, 1, 1, 1, 1,
0.5451245, -0.1991747, 0.9581249, 1, 1, 1, 1, 1,
0.545602, 0.2215679, 1.281385, 1, 1, 1, 1, 1,
0.548562, -0.5868946, 3.723345, 1, 1, 1, 1, 1,
0.5533903, 0.5814365, 1.31734, 1, 1, 1, 1, 1,
0.5565585, -0.8440949, 2.933837, 1, 1, 1, 1, 1,
0.5575317, 1.853968, -0.1814617, 1, 1, 1, 1, 1,
0.5594969, 0.2319859, -0.1273734, 1, 1, 1, 1, 1,
0.5613828, -0.2341018, 2.828907, 1, 1, 1, 1, 1,
0.5658681, -0.3214164, 1.20576, 1, 1, 1, 1, 1,
0.5672777, 1.163622, -0.5035497, 1, 1, 1, 1, 1,
0.5751808, -1.558147, 1.728572, 1, 1, 1, 1, 1,
0.575976, 0.2393414, 3.529483, 0, 0, 1, 1, 1,
0.578116, -0.8679939, 2.084564, 1, 0, 0, 1, 1,
0.578271, 0.257724, 0.4714834, 1, 0, 0, 1, 1,
0.5855705, -1.19611, 1.509401, 1, 0, 0, 1, 1,
0.5895029, 0.4597304, 1.556316, 1, 0, 0, 1, 1,
0.5913966, -0.8648368, 2.73679, 1, 0, 0, 1, 1,
0.5918186, -0.1123434, 0.2593961, 0, 0, 0, 1, 1,
0.5922065, 0.4144454, 1.990968, 0, 0, 0, 1, 1,
0.5943171, 0.4190524, 0.7741375, 0, 0, 0, 1, 1,
0.5953923, 1.764043, 1.165575, 0, 0, 0, 1, 1,
0.5966942, -1.488969, 1.275653, 0, 0, 0, 1, 1,
0.5970447, -0.6268119, 3.70061, 0, 0, 0, 1, 1,
0.5971255, 1.234907, 1.967506, 0, 0, 0, 1, 1,
0.5997618, 0.105248, 1.627994, 1, 1, 1, 1, 1,
0.6022017, 1.65918, 0.8031386, 1, 1, 1, 1, 1,
0.6024712, 0.4060602, 1.304343, 1, 1, 1, 1, 1,
0.6045514, -0.6702494, 0.2405495, 1, 1, 1, 1, 1,
0.61794, 0.4210494, 0.8881189, 1, 1, 1, 1, 1,
0.6186653, 0.527046, 0.4233159, 1, 1, 1, 1, 1,
0.6248887, 0.5813783, 1.390018, 1, 1, 1, 1, 1,
0.6279014, 1.381701, 1.645171, 1, 1, 1, 1, 1,
0.6285529, -0.1439676, 1.839854, 1, 1, 1, 1, 1,
0.6304687, -0.9009033, 3.687871, 1, 1, 1, 1, 1,
0.6400248, 0.3085375, 2.137991, 1, 1, 1, 1, 1,
0.6505786, -0.8391914, 2.015675, 1, 1, 1, 1, 1,
0.6511033, -0.6135435, 2.603896, 1, 1, 1, 1, 1,
0.6529743, -0.6973493, 2.036686, 1, 1, 1, 1, 1,
0.6532117, 1.726646, 1.347106, 1, 1, 1, 1, 1,
0.6566556, 1.81861, 0.0595471, 0, 0, 1, 1, 1,
0.6567563, 0.7333671, -0.1652521, 1, 0, 0, 1, 1,
0.6571003, 0.8123695, 1.06254, 1, 0, 0, 1, 1,
0.6620722, -0.5088175, 2.182487, 1, 0, 0, 1, 1,
0.6628872, -0.9726356, 4.24003, 1, 0, 0, 1, 1,
0.663343, 0.02888698, 0.9609008, 1, 0, 0, 1, 1,
0.6666107, 0.030793, 1.267954, 0, 0, 0, 1, 1,
0.6669714, 0.9885848, 0.956191, 0, 0, 0, 1, 1,
0.6681836, 0.01741368, 1.741873, 0, 0, 0, 1, 1,
0.6694117, 1.479958, 1.843729, 0, 0, 0, 1, 1,
0.6715633, 0.5142177, 1.619768, 0, 0, 0, 1, 1,
0.6745552, -1.085908, 1.314291, 0, 0, 0, 1, 1,
0.6750171, -0.7200792, 3.455459, 0, 0, 0, 1, 1,
0.6767774, -0.8985363, 3.120278, 1, 1, 1, 1, 1,
0.6773273, -0.09228352, 2.131123, 1, 1, 1, 1, 1,
0.6803384, -0.370741, 2.620873, 1, 1, 1, 1, 1,
0.6804999, 1.108709, -0.5265199, 1, 1, 1, 1, 1,
0.6822792, -0.2741474, 2.94872, 1, 1, 1, 1, 1,
0.6849225, -0.6073866, 2.342135, 1, 1, 1, 1, 1,
0.6868281, 0.2856028, 1.945453, 1, 1, 1, 1, 1,
0.6869224, 1.48819, -0.7713654, 1, 1, 1, 1, 1,
0.692219, -1.155762, 1.077336, 1, 1, 1, 1, 1,
0.6977573, -0.5271319, 2.17877, 1, 1, 1, 1, 1,
0.6981725, -0.2060184, 2.424196, 1, 1, 1, 1, 1,
0.712975, 0.1187195, 1.819167, 1, 1, 1, 1, 1,
0.7140531, -1.097219, 2.690097, 1, 1, 1, 1, 1,
0.7168369, 0.2173436, 0.2587101, 1, 1, 1, 1, 1,
0.7315754, 0.1203464, 1.772471, 1, 1, 1, 1, 1,
0.7320067, -0.2049215, 3.474956, 0, 0, 1, 1, 1,
0.7323189, -0.9450528, 1.204514, 1, 0, 0, 1, 1,
0.7359818, 1.683123, 2.759229, 1, 0, 0, 1, 1,
0.7390975, -0.1649001, -0.08853077, 1, 0, 0, 1, 1,
0.7447355, 0.06148502, 1.825422, 1, 0, 0, 1, 1,
0.7456688, -1.765352, 2.504166, 1, 0, 0, 1, 1,
0.7528475, 0.9824019, 0.9958923, 0, 0, 0, 1, 1,
0.7584475, -0.5145162, 1.669039, 0, 0, 0, 1, 1,
0.7601704, 0.001116828, 2.201281, 0, 0, 0, 1, 1,
0.7607193, 2.12066, -0.3614878, 0, 0, 0, 1, 1,
0.7665318, 1.291541, 1.053823, 0, 0, 0, 1, 1,
0.7671568, 2.1737, -1.061212, 0, 0, 0, 1, 1,
0.7700284, -0.3239611, 3.118441, 0, 0, 0, 1, 1,
0.7740939, -0.3861123, 1.832197, 1, 1, 1, 1, 1,
0.7748467, -1.095881, 2.602743, 1, 1, 1, 1, 1,
0.7752298, -0.2687414, 1.338903, 1, 1, 1, 1, 1,
0.7789964, -1.238309, 3.509392, 1, 1, 1, 1, 1,
0.7797666, 0.8208194, 1.818174, 1, 1, 1, 1, 1,
0.7805216, -0.2401441, 2.839351, 1, 1, 1, 1, 1,
0.7837635, -0.04460496, 2.658805, 1, 1, 1, 1, 1,
0.7930195, 1.5434, -0.1356156, 1, 1, 1, 1, 1,
0.7938325, 0.4517507, 1.472782, 1, 1, 1, 1, 1,
0.795324, -0.7870415, 3.405606, 1, 1, 1, 1, 1,
0.7961167, -0.7965147, 2.982689, 1, 1, 1, 1, 1,
0.7991098, 0.3453954, 0.9471084, 1, 1, 1, 1, 1,
0.8019555, 0.0256938, 0.5560647, 1, 1, 1, 1, 1,
0.81052, -0.8916321, 2.874958, 1, 1, 1, 1, 1,
0.8136795, -1.191811, 1.379599, 1, 1, 1, 1, 1,
0.8165718, 0.6960036, 0.9155035, 0, 0, 1, 1, 1,
0.8165801, 2.049693, 0.9270037, 1, 0, 0, 1, 1,
0.8188605, 0.703522, -0.03902326, 1, 0, 0, 1, 1,
0.8202608, -0.6372379, 1.187315, 1, 0, 0, 1, 1,
0.8318402, -0.7082669, 1.397703, 1, 0, 0, 1, 1,
0.8320526, -0.4171762, 3.602426, 1, 0, 0, 1, 1,
0.8342857, 0.1725899, 2.881149, 0, 0, 0, 1, 1,
0.8427538, 1.54752, 2.480384, 0, 0, 0, 1, 1,
0.8432577, 1.329911, 1.038591, 0, 0, 0, 1, 1,
0.8536124, -0.559849, 3.24701, 0, 0, 0, 1, 1,
0.8539503, 0.4304619, 0.524653, 0, 0, 0, 1, 1,
0.8549117, 1.408646, 0.9815239, 0, 0, 0, 1, 1,
0.8557629, 0.487623, 1.20638, 0, 0, 0, 1, 1,
0.8560256, 0.3579993, 1.708334, 1, 1, 1, 1, 1,
0.8595873, -1.655925, 2.596638, 1, 1, 1, 1, 1,
0.8606122, -1.176825, 2.384923, 1, 1, 1, 1, 1,
0.8727839, 1.292274, 2.321076, 1, 1, 1, 1, 1,
0.8780581, -0.4062971, -0.2892903, 1, 1, 1, 1, 1,
0.8791556, -1.078671, 1.313906, 1, 1, 1, 1, 1,
0.894384, -1.935326, 2.277136, 1, 1, 1, 1, 1,
0.8950405, 1.273765, -1.923266, 1, 1, 1, 1, 1,
0.8970419, 1.559042, 0.6012536, 1, 1, 1, 1, 1,
0.904476, 0.007673879, 2.115201, 1, 1, 1, 1, 1,
0.9053202, -0.6809394, 1.843634, 1, 1, 1, 1, 1,
0.9136179, 0.8965645, 0.8174409, 1, 1, 1, 1, 1,
0.9146725, -0.8882084, 1.619313, 1, 1, 1, 1, 1,
0.9158427, 0.2701747, 0.740189, 1, 1, 1, 1, 1,
0.9181157, 0.2293171, 1.270464, 1, 1, 1, 1, 1,
0.9265388, -0.257762, 1.174577, 0, 0, 1, 1, 1,
0.9273559, 0.1091562, 2.043295, 1, 0, 0, 1, 1,
0.9278211, -1.359715, 3.873026, 1, 0, 0, 1, 1,
0.930036, -0.07920358, 1.214629, 1, 0, 0, 1, 1,
0.9318126, -0.2210208, 1.848071, 1, 0, 0, 1, 1,
0.9322821, 0.6884552, 0.1872765, 1, 0, 0, 1, 1,
0.9339154, 0.9484895, 1.419809, 0, 0, 0, 1, 1,
0.9357972, -1.131234, 1.390831, 0, 0, 0, 1, 1,
0.9387274, -0.002733676, 1.397316, 0, 0, 0, 1, 1,
0.939831, -1.082676, 2.709349, 0, 0, 0, 1, 1,
0.9428998, -3.056568, 2.807001, 0, 0, 0, 1, 1,
0.9459659, -1.042973, 4.188787, 0, 0, 0, 1, 1,
0.9468222, 0.5535104, -0.1482546, 0, 0, 0, 1, 1,
0.9493185, 0.861707, 1.47691, 1, 1, 1, 1, 1,
0.9498461, -0.654732, 2.752904, 1, 1, 1, 1, 1,
0.9542566, 0.4812323, 1.32277, 1, 1, 1, 1, 1,
0.9601358, 0.06426979, 2.512282, 1, 1, 1, 1, 1,
0.9612932, 0.8503765, -0.1859301, 1, 1, 1, 1, 1,
0.9698271, -0.009734934, 1.209834, 1, 1, 1, 1, 1,
0.9724781, -0.409208, 2.591269, 1, 1, 1, 1, 1,
0.973509, 0.8473715, -0.4680501, 1, 1, 1, 1, 1,
0.9738795, -0.643388, 1.115772, 1, 1, 1, 1, 1,
0.9767333, 0.4581179, 0.8390343, 1, 1, 1, 1, 1,
0.9777544, 0.6383026, 0.04540293, 1, 1, 1, 1, 1,
0.9838716, 1.374044, 1.755194, 1, 1, 1, 1, 1,
0.9897676, 0.3952718, 2.59664, 1, 1, 1, 1, 1,
1.00231, -0.5892059, 3.995663, 1, 1, 1, 1, 1,
1.004661, -0.0884828, 2.014748, 1, 1, 1, 1, 1,
1.019003, -0.3559268, 0.5079888, 0, 0, 1, 1, 1,
1.019207, 1.423024, 0.7267569, 1, 0, 0, 1, 1,
1.020832, 1.10196, -0.2220444, 1, 0, 0, 1, 1,
1.03373, 0.343322, 1.853229, 1, 0, 0, 1, 1,
1.040235, 0.7021139, 1.087552, 1, 0, 0, 1, 1,
1.046963, 0.9559785, 0.3200924, 1, 0, 0, 1, 1,
1.080472, 0.967075, 1.399983, 0, 0, 0, 1, 1,
1.080574, 0.3926212, 0.3917204, 0, 0, 0, 1, 1,
1.082275, -0.683336, 3.286558, 0, 0, 0, 1, 1,
1.099378, -0.3439569, 1.77344, 0, 0, 0, 1, 1,
1.101498, -0.9685105, 1.952407, 0, 0, 0, 1, 1,
1.104251, 0.1008688, 2.010038, 0, 0, 0, 1, 1,
1.105279, -0.4874279, 0.678785, 0, 0, 0, 1, 1,
1.11321, -0.1630992, 1.190406, 1, 1, 1, 1, 1,
1.115641, -1.6183, 3.401668, 1, 1, 1, 1, 1,
1.116817, -1.667231, 2.038968, 1, 1, 1, 1, 1,
1.11837, -0.257408, 3.313964, 1, 1, 1, 1, 1,
1.133125, 0.7024965, -0.3974637, 1, 1, 1, 1, 1,
1.141606, 1.055158, 0.5566386, 1, 1, 1, 1, 1,
1.142783, -1.094696, 2.654246, 1, 1, 1, 1, 1,
1.155372, -0.3553758, 1.40411, 1, 1, 1, 1, 1,
1.165006, 0.8569031, 1.313418, 1, 1, 1, 1, 1,
1.166335, -0.1485283, 0.7298981, 1, 1, 1, 1, 1,
1.170513, -0.5897462, 0.6570552, 1, 1, 1, 1, 1,
1.171198, -1.128997, 1.132496, 1, 1, 1, 1, 1,
1.187897, 0.4530277, 0.3531991, 1, 1, 1, 1, 1,
1.189372, -1.432349, 0.855135, 1, 1, 1, 1, 1,
1.195624, 1.426373, -0.313205, 1, 1, 1, 1, 1,
1.205801, 0.09433774, 2.939574, 0, 0, 1, 1, 1,
1.205824, -0.4326196, 1.503142, 1, 0, 0, 1, 1,
1.211528, -2.830487, 2.860512, 1, 0, 0, 1, 1,
1.21804, -0.6248651, 2.246799, 1, 0, 0, 1, 1,
1.22386, -0.1881815, 1.945129, 1, 0, 0, 1, 1,
1.227487, 1.113066, 0.4444363, 1, 0, 0, 1, 1,
1.238104, 1.97358, 1.69398, 0, 0, 0, 1, 1,
1.240803, 2.53786, 0.4354295, 0, 0, 0, 1, 1,
1.248305, -1.806966, 0.8427686, 0, 0, 0, 1, 1,
1.249316, 1.452004, 2.31975, 0, 0, 0, 1, 1,
1.251049, -0.02295629, -1.633026, 0, 0, 0, 1, 1,
1.255508, 0.4966701, 1.872136, 0, 0, 0, 1, 1,
1.259654, 0.2957004, 0.7221936, 0, 0, 0, 1, 1,
1.26054, -0.8225007, 1.285803, 1, 1, 1, 1, 1,
1.264133, -1.446311, 3.834386, 1, 1, 1, 1, 1,
1.268953, -0.3255598, 1.352926, 1, 1, 1, 1, 1,
1.278358, 1.9137, 0.1678295, 1, 1, 1, 1, 1,
1.292008, -0.2897123, 0.9059075, 1, 1, 1, 1, 1,
1.296831, -0.4810478, 1.336692, 1, 1, 1, 1, 1,
1.308559, 0.2063967, 0.5151815, 1, 1, 1, 1, 1,
1.311, 0.1361767, 1.658875, 1, 1, 1, 1, 1,
1.314989, 1.370241, -0.08139941, 1, 1, 1, 1, 1,
1.320495, -0.2595346, 3.00048, 1, 1, 1, 1, 1,
1.322743, 1.250701, 1.382072, 1, 1, 1, 1, 1,
1.32642, -0.578697, 0.7498637, 1, 1, 1, 1, 1,
1.331283, 0.822375, -0.234549, 1, 1, 1, 1, 1,
1.333475, 0.3775802, 1.38846, 1, 1, 1, 1, 1,
1.336551, 1.110844, 0.9232622, 1, 1, 1, 1, 1,
1.337694, -0.4004658, 0.6988011, 0, 0, 1, 1, 1,
1.342443, -0.3214599, 1.419516, 1, 0, 0, 1, 1,
1.355579, -1.827435, 1.627921, 1, 0, 0, 1, 1,
1.390768, -1.699849, 3.168716, 1, 0, 0, 1, 1,
1.401867, -0.3154239, 1.851316, 1, 0, 0, 1, 1,
1.410753, 0.311382, 0.465587, 1, 0, 0, 1, 1,
1.421555, 0.001156938, 2.830713, 0, 0, 0, 1, 1,
1.427506, 0.6333146, 2.653402, 0, 0, 0, 1, 1,
1.428855, 1.691322, 2.216737, 0, 0, 0, 1, 1,
1.431527, -0.1166699, 1.346976, 0, 0, 0, 1, 1,
1.471838, 0.3063967, 0.977273, 0, 0, 0, 1, 1,
1.478835, 0.8055748, 0.3966972, 0, 0, 0, 1, 1,
1.492426, 0.4178284, -0.4978566, 0, 0, 0, 1, 1,
1.508958, 0.7596752, 0.8321403, 1, 1, 1, 1, 1,
1.513553, 0.4687715, 0.8333002, 1, 1, 1, 1, 1,
1.529605, -0.5635214, 1.751233, 1, 1, 1, 1, 1,
1.534971, 0.5170588, 3.896831, 1, 1, 1, 1, 1,
1.535932, -0.3805844, 1.000264, 1, 1, 1, 1, 1,
1.565018, 1.661225, -0.4776395, 1, 1, 1, 1, 1,
1.571696, -1.495638, 0.5908411, 1, 1, 1, 1, 1,
1.579615, 0.1183927, 1.341278, 1, 1, 1, 1, 1,
1.585412, -2.581716, 2.386682, 1, 1, 1, 1, 1,
1.609328, -0.1994628, 2.016466, 1, 1, 1, 1, 1,
1.609399, -0.6018598, 2.593992, 1, 1, 1, 1, 1,
1.617595, -0.7674438, 1.887221, 1, 1, 1, 1, 1,
1.635972, -0.3446981, 2.234655, 1, 1, 1, 1, 1,
1.641926, 1.922934, 2.134688, 1, 1, 1, 1, 1,
1.655071, -0.069089, 3.169178, 1, 1, 1, 1, 1,
1.656597, 0.2780298, 1.583295, 0, 0, 1, 1, 1,
1.66655, -0.9395956, 3.017777, 1, 0, 0, 1, 1,
1.673848, 0.02067478, 2.180193, 1, 0, 0, 1, 1,
1.677895, 1.135594, 0.5345782, 1, 0, 0, 1, 1,
1.683828, -0.9895231, -0.3287711, 1, 0, 0, 1, 1,
1.696847, 0.6008577, 1.281352, 1, 0, 0, 1, 1,
1.699027, -0.8463717, 2.643875, 0, 0, 0, 1, 1,
1.725694, -0.05210201, 1.762785, 0, 0, 0, 1, 1,
1.730912, -0.1385295, 3.829359, 0, 0, 0, 1, 1,
1.74079, 0.2621714, 0.2010892, 0, 0, 0, 1, 1,
1.74427, 2.12368, 2.021605, 0, 0, 0, 1, 1,
1.787207, 1.337923, 1.005305, 0, 0, 0, 1, 1,
1.795016, -0.2493656, 3.339564, 0, 0, 0, 1, 1,
1.797324, -0.1518033, 1.721397, 1, 1, 1, 1, 1,
1.79999, -1.225079, 0.8666304, 1, 1, 1, 1, 1,
1.844088, 1.721622, 0.9394914, 1, 1, 1, 1, 1,
1.861128, 0.521912, 0.9906354, 1, 1, 1, 1, 1,
1.891613, 1.847162, 2.739726, 1, 1, 1, 1, 1,
1.90578, 1.127038, 0.5787596, 1, 1, 1, 1, 1,
1.954744, -1.839834, 2.482498, 1, 1, 1, 1, 1,
1.96316, 1.113156, 1.595484, 1, 1, 1, 1, 1,
1.974532, 0.1641939, 3.329315, 1, 1, 1, 1, 1,
1.981162, 1.25714, 0.9920865, 1, 1, 1, 1, 1,
1.998105, 0.7012265, 1.35925, 1, 1, 1, 1, 1,
1.999206, -0.7936439, 4.158663, 1, 1, 1, 1, 1,
2.017155, 0.8312218, 0.6492949, 1, 1, 1, 1, 1,
2.026585, 0.4588392, 3.439408, 1, 1, 1, 1, 1,
2.035237, -0.4956921, 1.59119, 1, 1, 1, 1, 1,
2.040765, 1.128398, 1.027581, 0, 0, 1, 1, 1,
2.07524, -1.036901, 3.130225, 1, 0, 0, 1, 1,
2.075547, -0.2184574, 1.009849, 1, 0, 0, 1, 1,
2.08866, -0.3269749, 2.535817, 1, 0, 0, 1, 1,
2.101775, 1.364082, 0.8482046, 1, 0, 0, 1, 1,
2.116212, -0.1509337, 1.429949, 1, 0, 0, 1, 1,
2.164848, -1.17878, 0.527557, 0, 0, 0, 1, 1,
2.176969, 0.4541155, 1.233078, 0, 0, 0, 1, 1,
2.197172, -2.209658, 2.65262, 0, 0, 0, 1, 1,
2.286556, -0.4159283, 3.04663, 0, 0, 0, 1, 1,
2.31821, 0.2009811, 1.930498, 0, 0, 0, 1, 1,
2.347184, 0.9926376, 1.814618, 0, 0, 0, 1, 1,
2.35603, 0.6746612, 1.899693, 0, 0, 0, 1, 1,
2.374955, -0.6531635, 2.150816, 1, 1, 1, 1, 1,
2.443204, 0.2536181, 2.343485, 1, 1, 1, 1, 1,
2.478947, -0.4635319, 3.255702, 1, 1, 1, 1, 1,
2.504309, 1.053582, 0.4036714, 1, 1, 1, 1, 1,
2.692987, 0.4213098, 0.3100333, 1, 1, 1, 1, 1,
2.731732, -0.7634324, 3.017729, 1, 1, 1, 1, 1,
3.516288, 1.020621, 0.8912771, 1, 1, 1, 1, 1
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
var radius = 9.649214;
var distance = 33.89246;
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
mvMatrix.translate( -0.0960772, 0.2116741, -0.3388588 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89246);
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