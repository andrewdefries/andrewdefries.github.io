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
-3.666663, 0.1018443, -2.17204, 1, 0, 0, 1,
-3.599261, -1.581735, -0.8416252, 1, 0.007843138, 0, 1,
-3.271108, -0.7211453, -1.491932, 1, 0.01176471, 0, 1,
-3.107001, 0.07631905, -2.78809, 1, 0.01960784, 0, 1,
-3.106945, 1.917061, -0.4202696, 1, 0.02352941, 0, 1,
-2.908407, -0.07106227, -2.686216, 1, 0.03137255, 0, 1,
-2.904996, -1.67736, -0.9250976, 1, 0.03529412, 0, 1,
-2.605181, 1.449491, -1.695888, 1, 0.04313726, 0, 1,
-2.59883, 0.5739834, -1.168351, 1, 0.04705882, 0, 1,
-2.440248, 0.5334237, -0.2485663, 1, 0.05490196, 0, 1,
-2.382943, 2.067466, -3.057715, 1, 0.05882353, 0, 1,
-2.366102, -0.7804395, -1.431649, 1, 0.06666667, 0, 1,
-2.320617, 1.306832, 0.03492802, 1, 0.07058824, 0, 1,
-2.311033, -0.06694584, -1.147343, 1, 0.07843138, 0, 1,
-2.247257, 0.6801627, 0.6925177, 1, 0.08235294, 0, 1,
-2.190295, -0.5398896, -0.965682, 1, 0.09019608, 0, 1,
-2.160731, 0.1607986, -2.306364, 1, 0.09411765, 0, 1,
-2.133219, -0.2887521, -2.955341, 1, 0.1019608, 0, 1,
-2.088592, -0.3486454, -2.647423, 1, 0.1098039, 0, 1,
-2.084327, 1.466254, -1.467431, 1, 0.1137255, 0, 1,
-2.080711, 0.205715, -0.963716, 1, 0.1215686, 0, 1,
-2.067296, 0.1736069, -0.4725368, 1, 0.1254902, 0, 1,
-2.043247, -0.6470015, -3.663729, 1, 0.1333333, 0, 1,
-2.041972, -1.058946, -1.617879, 1, 0.1372549, 0, 1,
-2.035922, -0.4609731, -0.4764287, 1, 0.145098, 0, 1,
-1.970833, -0.6084009, -3.549444, 1, 0.1490196, 0, 1,
-1.95161, 1.177491, -0.9316253, 1, 0.1568628, 0, 1,
-1.93769, -0.781171, -2.548303, 1, 0.1607843, 0, 1,
-1.936526, 0.4628865, -2.411835, 1, 0.1686275, 0, 1,
-1.926023, -0.1119748, -3.172271, 1, 0.172549, 0, 1,
-1.920971, -0.5813535, -1.315191, 1, 0.1803922, 0, 1,
-1.919041, -0.4183348, -1.546469, 1, 0.1843137, 0, 1,
-1.88133, 0.8697187, -3.60965, 1, 0.1921569, 0, 1,
-1.877276, -0.4771824, -1.190619, 1, 0.1960784, 0, 1,
-1.871863, 1.159709, -0.3245269, 1, 0.2039216, 0, 1,
-1.862765, -1.115566, -4.114882, 1, 0.2117647, 0, 1,
-1.823473, -1.860944, -1.738114, 1, 0.2156863, 0, 1,
-1.810658, -0.1560406, -1.915956, 1, 0.2235294, 0, 1,
-1.804787, 0.8935029, -2.338969, 1, 0.227451, 0, 1,
-1.787076, -0.02436048, -0.5720749, 1, 0.2352941, 0, 1,
-1.786695, -1.793867, -3.131158, 1, 0.2392157, 0, 1,
-1.775396, 0.09215514, 1.282073, 1, 0.2470588, 0, 1,
-1.769523, 1.745861, -0.9881625, 1, 0.2509804, 0, 1,
-1.751677, 1.259133, 0.4449675, 1, 0.2588235, 0, 1,
-1.72462, -0.1620034, -1.598782, 1, 0.2627451, 0, 1,
-1.712481, 1.984308, -0.2472921, 1, 0.2705882, 0, 1,
-1.710694, -1.632533, -0.4652898, 1, 0.2745098, 0, 1,
-1.708796, 1.683206, -0.9036714, 1, 0.282353, 0, 1,
-1.708282, -1.171789, -3.533176, 1, 0.2862745, 0, 1,
-1.68975, -0.1056985, -1.527299, 1, 0.2941177, 0, 1,
-1.688191, 0.2036791, -1.634467, 1, 0.3019608, 0, 1,
-1.672827, 0.7664136, -0.6543051, 1, 0.3058824, 0, 1,
-1.6589, -2.51364, -1.946612, 1, 0.3137255, 0, 1,
-1.639996, -0.4415483, -2.751807, 1, 0.3176471, 0, 1,
-1.639661, -0.0911506, -2.091548, 1, 0.3254902, 0, 1,
-1.637341, -0.4308331, -1.945125, 1, 0.3294118, 0, 1,
-1.634729, 0.5530933, -1.426098, 1, 0.3372549, 0, 1,
-1.629091, 0.2392147, -1.973397, 1, 0.3411765, 0, 1,
-1.607342, -0.3949892, -0.06751704, 1, 0.3490196, 0, 1,
-1.598141, 1.208461, -2.208691, 1, 0.3529412, 0, 1,
-1.577513, 0.02974437, -1.725189, 1, 0.3607843, 0, 1,
-1.557168, 0.1107347, -1.780054, 1, 0.3647059, 0, 1,
-1.550564, -0.9189751, -2.543449, 1, 0.372549, 0, 1,
-1.54848, 0.2767732, -0.2407145, 1, 0.3764706, 0, 1,
-1.548296, 0.8790607, 0.8612671, 1, 0.3843137, 0, 1,
-1.538095, 0.7278969, -1.728393, 1, 0.3882353, 0, 1,
-1.534316, -1.130729, -2.618629, 1, 0.3960784, 0, 1,
-1.530272, 0.4920686, -0.85524, 1, 0.4039216, 0, 1,
-1.508003, -0.5664271, -0.8284352, 1, 0.4078431, 0, 1,
-1.504476, 0.02352405, -0.3769898, 1, 0.4156863, 0, 1,
-1.499367, 1.274758, -1.352472, 1, 0.4196078, 0, 1,
-1.494245, -0.4138813, -2.919807, 1, 0.427451, 0, 1,
-1.488253, 1.531602, -0.5785341, 1, 0.4313726, 0, 1,
-1.484749, 0.1392437, -0.5323982, 1, 0.4392157, 0, 1,
-1.476867, -1.0062, -2.193876, 1, 0.4431373, 0, 1,
-1.473842, 0.3697428, -1.07432, 1, 0.4509804, 0, 1,
-1.470177, 0.8553954, -1.178619, 1, 0.454902, 0, 1,
-1.464603, 0.1144261, -2.029395, 1, 0.4627451, 0, 1,
-1.449707, -0.4710106, -1.191437, 1, 0.4666667, 0, 1,
-1.407172, 0.6517374, -1.597605, 1, 0.4745098, 0, 1,
-1.404442, 0.7431471, 0.7768446, 1, 0.4784314, 0, 1,
-1.396779, 0.8519509, -1.559666, 1, 0.4862745, 0, 1,
-1.396164, 1.029282, -1.302442, 1, 0.4901961, 0, 1,
-1.392201, 1.126161, -0.9175394, 1, 0.4980392, 0, 1,
-1.386491, 0.3971641, -1.003252, 1, 0.5058824, 0, 1,
-1.382876, 0.1463391, -1.225838, 1, 0.509804, 0, 1,
-1.37202, -0.7202727, -2.758712, 1, 0.5176471, 0, 1,
-1.370231, 1.464269, -0.5605436, 1, 0.5215687, 0, 1,
-1.370162, -0.1346214, -0.7500539, 1, 0.5294118, 0, 1,
-1.365583, -1.677033, -3.349373, 1, 0.5333334, 0, 1,
-1.365214, -0.1893798, -1.657165, 1, 0.5411765, 0, 1,
-1.358023, 0.4758496, -1.577185, 1, 0.5450981, 0, 1,
-1.357978, 1.648081, -1.213803, 1, 0.5529412, 0, 1,
-1.349792, -1.544433, -1.15791, 1, 0.5568628, 0, 1,
-1.332461, 0.156168, -1.44255, 1, 0.5647059, 0, 1,
-1.331133, -1.102446, -1.304195, 1, 0.5686275, 0, 1,
-1.329166, 2.301907, 0.7199758, 1, 0.5764706, 0, 1,
-1.316931, -0.2518987, -0.5004392, 1, 0.5803922, 0, 1,
-1.313738, -0.6958277, -3.361112, 1, 0.5882353, 0, 1,
-1.309404, -1.722553, -1.271272, 1, 0.5921569, 0, 1,
-1.307446, -0.101284, -0.7580053, 1, 0.6, 0, 1,
-1.293035, -0.0736162, -2.361455, 1, 0.6078432, 0, 1,
-1.291064, -1.048917, -1.243897, 1, 0.6117647, 0, 1,
-1.291007, 0.2149671, -1.29646, 1, 0.6196079, 0, 1,
-1.290053, -1.041586, -3.638431, 1, 0.6235294, 0, 1,
-1.283908, 1.078583, -1.137151, 1, 0.6313726, 0, 1,
-1.278901, 0.6191643, -1.700088, 1, 0.6352941, 0, 1,
-1.273278, -1.491993, -2.173099, 1, 0.6431373, 0, 1,
-1.25603, -1.057717, -1.360119, 1, 0.6470588, 0, 1,
-1.252386, 0.6494958, -0.4872403, 1, 0.654902, 0, 1,
-1.25133, 0.4322898, -1.265362, 1, 0.6588235, 0, 1,
-1.243631, -0.5501686, -0.02157167, 1, 0.6666667, 0, 1,
-1.239677, 0.2737283, -1.199241, 1, 0.6705883, 0, 1,
-1.237657, 1.055604, -1.315034, 1, 0.6784314, 0, 1,
-1.235312, 1.322608, 0.1043111, 1, 0.682353, 0, 1,
-1.234207, 0.561257, -3.364991, 1, 0.6901961, 0, 1,
-1.226839, -0.7949595, -2.103876, 1, 0.6941177, 0, 1,
-1.206509, -0.184019, -1.805798, 1, 0.7019608, 0, 1,
-1.202252, -0.6182418, -1.13624, 1, 0.7098039, 0, 1,
-1.202235, -1.703508, -1.453409, 1, 0.7137255, 0, 1,
-1.197532, -0.5797798, -2.761113, 1, 0.7215686, 0, 1,
-1.186119, 0.2146811, -1.294208, 1, 0.7254902, 0, 1,
-1.175744, -0.3287815, -1.755324, 1, 0.7333333, 0, 1,
-1.175052, 0.6287691, 0.4061637, 1, 0.7372549, 0, 1,
-1.166448, -1.236078, -2.130279, 1, 0.7450981, 0, 1,
-1.166025, -0.8969348, -3.089489, 1, 0.7490196, 0, 1,
-1.158008, -0.2229765, -1.901081, 1, 0.7568628, 0, 1,
-1.157822, -0.2455428, -3.804956, 1, 0.7607843, 0, 1,
-1.156532, -0.2963313, -1.807765, 1, 0.7686275, 0, 1,
-1.155335, -0.7353681, -1.718545, 1, 0.772549, 0, 1,
-1.153719, -0.4507263, -0.8035659, 1, 0.7803922, 0, 1,
-1.153696, 1.744283, 0.6148823, 1, 0.7843137, 0, 1,
-1.151787, 0.2580238, -0.8297506, 1, 0.7921569, 0, 1,
-1.145857, 0.4662395, -3.756345, 1, 0.7960784, 0, 1,
-1.140243, -0.7065398, -0.946728, 1, 0.8039216, 0, 1,
-1.138429, -0.4229512, 0.1640733, 1, 0.8117647, 0, 1,
-1.134725, 0.1951078, -0.9325736, 1, 0.8156863, 0, 1,
-1.133829, 0.4857806, 1.028684, 1, 0.8235294, 0, 1,
-1.132885, -0.962678, -1.331027, 1, 0.827451, 0, 1,
-1.128489, -2.753205, -3.566551, 1, 0.8352941, 0, 1,
-1.117427, 2.102498, 1.124181, 1, 0.8392157, 0, 1,
-1.110429, 0.6086002, -1.573559, 1, 0.8470588, 0, 1,
-1.108409, 0.3939145, -1.167443, 1, 0.8509804, 0, 1,
-1.104234, -0.6936679, -0.3767626, 1, 0.8588235, 0, 1,
-1.101325, 2.123765, -0.7113716, 1, 0.8627451, 0, 1,
-1.100725, 1.105425, -1.585559, 1, 0.8705882, 0, 1,
-1.09508, 0.3220494, -0.6571115, 1, 0.8745098, 0, 1,
-1.093211, -1.323242, -4.279632, 1, 0.8823529, 0, 1,
-1.082538, 1.13192, -1.045542, 1, 0.8862745, 0, 1,
-1.081427, -0.496898, -1.488664, 1, 0.8941177, 0, 1,
-1.067126, -1.060111, -2.081601, 1, 0.8980392, 0, 1,
-1.066319, -0.04020421, -1.49862, 1, 0.9058824, 0, 1,
-1.066317, -1.036159, -2.528219, 1, 0.9137255, 0, 1,
-1.062266, 0.002593249, -3.808893, 1, 0.9176471, 0, 1,
-1.059701, -1.788593, -3.850196, 1, 0.9254902, 0, 1,
-1.059347, 0.5502164, -3.087028, 1, 0.9294118, 0, 1,
-1.052577, -0.7269924, -0.2477834, 1, 0.9372549, 0, 1,
-1.039651, 0.4970534, 0.2214386, 1, 0.9411765, 0, 1,
-1.037277, 0.2654115, -0.4630644, 1, 0.9490196, 0, 1,
-1.037121, -0.07514115, -1.117714, 1, 0.9529412, 0, 1,
-1.036121, -1.454962, -2.751253, 1, 0.9607843, 0, 1,
-1.034027, -1.442881, -2.634061, 1, 0.9647059, 0, 1,
-1.02706, 0.2277548, -1.291182, 1, 0.972549, 0, 1,
-1.025322, -0.8244547, -1.159144, 1, 0.9764706, 0, 1,
-1.021026, -0.3335349, -1.783028, 1, 0.9843137, 0, 1,
-1.013741, 0.1459461, -1.210385, 1, 0.9882353, 0, 1,
-1.010772, -1.077272, -3.812034, 1, 0.9960784, 0, 1,
-1.008402, -0.3707078, -1.081499, 0.9960784, 1, 0, 1,
-0.9963869, -0.7604588, -2.485504, 0.9921569, 1, 0, 1,
-0.995643, 0.6658437, -0.5148463, 0.9843137, 1, 0, 1,
-0.9832211, 0.2593838, -0.3570125, 0.9803922, 1, 0, 1,
-0.9828973, 0.05399853, -1.752605, 0.972549, 1, 0, 1,
-0.9804563, 1.202966, -0.03530565, 0.9686275, 1, 0, 1,
-0.9785558, -1.150193, -1.764575, 0.9607843, 1, 0, 1,
-0.9777054, 0.5466415, -1.59002, 0.9568627, 1, 0, 1,
-0.9776044, 1.204685, -1.771599, 0.9490196, 1, 0, 1,
-0.9501081, -0.2655939, -0.7466378, 0.945098, 1, 0, 1,
-0.9444786, 0.3040631, 0.08292124, 0.9372549, 1, 0, 1,
-0.9382808, -0.02700681, -0.5415279, 0.9333333, 1, 0, 1,
-0.9376251, 0.3558581, -2.112082, 0.9254902, 1, 0, 1,
-0.9303795, -1.287681, -4.301295, 0.9215686, 1, 0, 1,
-0.9272858, 0.9344003, -0.3150924, 0.9137255, 1, 0, 1,
-0.9172987, -1.101273, -2.437613, 0.9098039, 1, 0, 1,
-0.9139976, -0.5093523, -0.5263689, 0.9019608, 1, 0, 1,
-0.909274, -1.625295, -3.953415, 0.8941177, 1, 0, 1,
-0.9087574, -0.5823649, -0.8260003, 0.8901961, 1, 0, 1,
-0.9073542, -1.670617, -3.575493, 0.8823529, 1, 0, 1,
-0.9046467, 0.178325, -1.607697, 0.8784314, 1, 0, 1,
-0.9040216, -1.098232, -3.164311, 0.8705882, 1, 0, 1,
-0.9027809, -0.7206737, -2.325603, 0.8666667, 1, 0, 1,
-0.9006621, -0.7434286, -2.30078, 0.8588235, 1, 0, 1,
-0.8961748, -1.949443, -3.10084, 0.854902, 1, 0, 1,
-0.8955879, -0.4437443, -4.390484, 0.8470588, 1, 0, 1,
-0.8831626, -1.03661, -2.208649, 0.8431373, 1, 0, 1,
-0.8769556, 1.00552, 1.676148, 0.8352941, 1, 0, 1,
-0.8756796, -0.832926, -2.291747, 0.8313726, 1, 0, 1,
-0.8722787, -1.841051, -2.437777, 0.8235294, 1, 0, 1,
-0.8693233, 0.2518321, -1.100418, 0.8196079, 1, 0, 1,
-0.8665011, -0.2550554, -2.759991, 0.8117647, 1, 0, 1,
-0.8660609, 0.1391608, -2.522621, 0.8078431, 1, 0, 1,
-0.8656034, -0.4354551, -1.860708, 0.8, 1, 0, 1,
-0.8486074, -1.480702, -4.799124, 0.7921569, 1, 0, 1,
-0.8456706, -0.1980038, -1.474199, 0.7882353, 1, 0, 1,
-0.8444768, -1.302663, -2.113506, 0.7803922, 1, 0, 1,
-0.8267394, -0.5361336, -2.398973, 0.7764706, 1, 0, 1,
-0.8261965, -0.06353729, -2.480104, 0.7686275, 1, 0, 1,
-0.8257172, -0.2150928, -1.806999, 0.7647059, 1, 0, 1,
-0.8239189, 0.481895, 0.6656864, 0.7568628, 1, 0, 1,
-0.8218291, 0.981825, -2.37887, 0.7529412, 1, 0, 1,
-0.8202558, -0.4116021, -1.449483, 0.7450981, 1, 0, 1,
-0.8153198, -2.54964, -1.110341, 0.7411765, 1, 0, 1,
-0.8034891, -0.5723376, -3.380219, 0.7333333, 1, 0, 1,
-0.7982459, -0.03089846, 0.1317335, 0.7294118, 1, 0, 1,
-0.7958972, -0.799157, -1.038533, 0.7215686, 1, 0, 1,
-0.7832091, 0.6798427, -0.5732926, 0.7176471, 1, 0, 1,
-0.7791759, -0.3886526, -3.012198, 0.7098039, 1, 0, 1,
-0.7779065, 0.7056803, -2.12765, 0.7058824, 1, 0, 1,
-0.7768309, -0.8318058, -1.815978, 0.6980392, 1, 0, 1,
-0.7617201, -0.6437879, -2.231459, 0.6901961, 1, 0, 1,
-0.7585218, -1.584023, -0.184915, 0.6862745, 1, 0, 1,
-0.7480877, -0.1193999, -0.7158006, 0.6784314, 1, 0, 1,
-0.7469717, 1.3771, -0.490616, 0.6745098, 1, 0, 1,
-0.7436495, -0.5887669, -3.234825, 0.6666667, 1, 0, 1,
-0.7393762, -0.5097667, -1.424799, 0.6627451, 1, 0, 1,
-0.7333274, -1.444698, -3.470543, 0.654902, 1, 0, 1,
-0.7331721, -1.750134, -3.453953, 0.6509804, 1, 0, 1,
-0.7328645, -0.6808166, -2.212543, 0.6431373, 1, 0, 1,
-0.7307482, -0.07648826, -2.080544, 0.6392157, 1, 0, 1,
-0.7305112, 0.1705989, -2.236599, 0.6313726, 1, 0, 1,
-0.7294219, 0.3851057, -0.7902117, 0.627451, 1, 0, 1,
-0.728433, 0.2092701, -1.39362, 0.6196079, 1, 0, 1,
-0.7244747, 1.332167, 0.4528961, 0.6156863, 1, 0, 1,
-0.7226365, 0.06889076, -1.509997, 0.6078432, 1, 0, 1,
-0.7197487, 0.8622352, -0.7601174, 0.6039216, 1, 0, 1,
-0.7170253, -0.3264119, -4.337032, 0.5960785, 1, 0, 1,
-0.7160546, -0.2179877, -0.551008, 0.5882353, 1, 0, 1,
-0.7157485, -0.2147695, -3.248631, 0.5843138, 1, 0, 1,
-0.7155051, -1.229656, -2.886331, 0.5764706, 1, 0, 1,
-0.7133854, -0.9164068, -3.581901, 0.572549, 1, 0, 1,
-0.7131482, -1.184214, -3.985543, 0.5647059, 1, 0, 1,
-0.7082794, -2.105096, -2.489386, 0.5607843, 1, 0, 1,
-0.7031702, -0.5610282, -1.930167, 0.5529412, 1, 0, 1,
-0.6995792, 0.1865899, -0.7763409, 0.5490196, 1, 0, 1,
-0.6950859, -0.7878847, -2.346405, 0.5411765, 1, 0, 1,
-0.6786945, -0.118465, -2.105683, 0.5372549, 1, 0, 1,
-0.6721861, 0.4837629, -0.2035598, 0.5294118, 1, 0, 1,
-0.6716744, -1.996991, -3.462119, 0.5254902, 1, 0, 1,
-0.6710621, 1.304804, -1.666492, 0.5176471, 1, 0, 1,
-0.6693049, 0.6593384, -0.4401408, 0.5137255, 1, 0, 1,
-0.663686, 1.672067, 0.925296, 0.5058824, 1, 0, 1,
-0.6626399, 1.205797, -0.1171645, 0.5019608, 1, 0, 1,
-0.6600296, -1.088947, -2.847807, 0.4941176, 1, 0, 1,
-0.6575469, -0.2157433, -0.9578402, 0.4862745, 1, 0, 1,
-0.6573634, 0.3732657, -1.471076, 0.4823529, 1, 0, 1,
-0.646993, 0.3728902, -3.690112, 0.4745098, 1, 0, 1,
-0.6386536, -0.6802995, -1.825401, 0.4705882, 1, 0, 1,
-0.6283724, -0.5187111, -1.364522, 0.4627451, 1, 0, 1,
-0.6277106, -0.545823, -0.6509357, 0.4588235, 1, 0, 1,
-0.6259717, 0.2439755, -1.155926, 0.4509804, 1, 0, 1,
-0.6258292, 0.6784137, -1.15772, 0.4470588, 1, 0, 1,
-0.6192077, 0.2082956, 0.5151542, 0.4392157, 1, 0, 1,
-0.6159321, 0.3143027, -1.817746, 0.4352941, 1, 0, 1,
-0.6151617, 0.421324, -0.1350182, 0.427451, 1, 0, 1,
-0.6125909, 1.416684, 0.6782616, 0.4235294, 1, 0, 1,
-0.6108329, 0.4471151, -0.9287823, 0.4156863, 1, 0, 1,
-0.6092302, 0.6615553, -0.85755, 0.4117647, 1, 0, 1,
-0.6068358, -1.600925, -3.422557, 0.4039216, 1, 0, 1,
-0.6030583, 1.398727, -0.599152, 0.3960784, 1, 0, 1,
-0.6014378, 1.197757, -0.1901779, 0.3921569, 1, 0, 1,
-0.5993435, -0.3505003, -2.532719, 0.3843137, 1, 0, 1,
-0.598681, -0.678418, -2.605917, 0.3803922, 1, 0, 1,
-0.5933017, 0.4295294, -0.5459747, 0.372549, 1, 0, 1,
-0.5920216, -0.1726506, -2.433306, 0.3686275, 1, 0, 1,
-0.5904334, -0.5043105, -3.159589, 0.3607843, 1, 0, 1,
-0.5869823, -0.6227067, -2.984537, 0.3568628, 1, 0, 1,
-0.5854021, -0.6101254, -2.334293, 0.3490196, 1, 0, 1,
-0.5768306, 1.663812, 0.7076815, 0.345098, 1, 0, 1,
-0.5757049, 0.771542, -2.239331, 0.3372549, 1, 0, 1,
-0.5733152, -0.8520886, -2.100411, 0.3333333, 1, 0, 1,
-0.5725774, 1.455775, 1.516714, 0.3254902, 1, 0, 1,
-0.5697133, -0.1264361, -2.597453, 0.3215686, 1, 0, 1,
-0.5693601, 1.246187, -0.8570933, 0.3137255, 1, 0, 1,
-0.5657443, 0.09408493, -1.193077, 0.3098039, 1, 0, 1,
-0.5652693, -0.4848129, -3.152306, 0.3019608, 1, 0, 1,
-0.5621746, -0.2164932, -2.474566, 0.2941177, 1, 0, 1,
-0.5597717, -1.374308, -2.174442, 0.2901961, 1, 0, 1,
-0.5547308, 0.3236816, -2.259048, 0.282353, 1, 0, 1,
-0.5512296, -0.5916209, -2.595845, 0.2784314, 1, 0, 1,
-0.5487661, -0.1359782, -2.306065, 0.2705882, 1, 0, 1,
-0.5473881, 0.04453225, -0.716139, 0.2666667, 1, 0, 1,
-0.5459594, 0.5347378, -1.307524, 0.2588235, 1, 0, 1,
-0.5410191, -0.2319717, -1.887996, 0.254902, 1, 0, 1,
-0.537195, -0.9547444, -4.256798, 0.2470588, 1, 0, 1,
-0.5358385, 0.5984627, -1.397566, 0.2431373, 1, 0, 1,
-0.5334876, 0.4110539, -0.3431391, 0.2352941, 1, 0, 1,
-0.5308155, -1.074675, -3.580116, 0.2313726, 1, 0, 1,
-0.5290391, 1.901767, -0.6454116, 0.2235294, 1, 0, 1,
-0.5271119, 1.08795, -2.719136, 0.2196078, 1, 0, 1,
-0.5264038, -0.005918804, -2.422323, 0.2117647, 1, 0, 1,
-0.5251712, 1.398421, -0.9907337, 0.2078431, 1, 0, 1,
-0.5217214, 0.2131822, -1.786562, 0.2, 1, 0, 1,
-0.5190812, -0.687143, -2.507982, 0.1921569, 1, 0, 1,
-0.5147957, 1.619101, -1.111452, 0.1882353, 1, 0, 1,
-0.5060319, -1.928354, -4.359302, 0.1803922, 1, 0, 1,
-0.502705, -0.8768203, -1.827332, 0.1764706, 1, 0, 1,
-0.4981947, 0.9825789, -2.550751, 0.1686275, 1, 0, 1,
-0.497768, 0.06469847, -1.241396, 0.1647059, 1, 0, 1,
-0.4972374, 0.7012088, -0.06003299, 0.1568628, 1, 0, 1,
-0.4926481, 0.4681261, -1.770654, 0.1529412, 1, 0, 1,
-0.4882802, 0.8785425, -2.010567, 0.145098, 1, 0, 1,
-0.4866225, -0.4740856, -2.280994, 0.1411765, 1, 0, 1,
-0.48589, 1.81689, 0.823172, 0.1333333, 1, 0, 1,
-0.4850027, 0.7999092, -2.467877, 0.1294118, 1, 0, 1,
-0.4830221, 0.5403208, -0.5013486, 0.1215686, 1, 0, 1,
-0.4800389, -1.185886, -2.659231, 0.1176471, 1, 0, 1,
-0.4751491, -0.7893873, -2.23485, 0.1098039, 1, 0, 1,
-0.4708526, -0.6764433, -2.56678, 0.1058824, 1, 0, 1,
-0.4657439, 0.02015874, -3.42427, 0.09803922, 1, 0, 1,
-0.4648159, 0.7090425, 0.9460129, 0.09019608, 1, 0, 1,
-0.4616719, -0.04415587, -1.382156, 0.08627451, 1, 0, 1,
-0.4594776, 0.3365199, -0.5122145, 0.07843138, 1, 0, 1,
-0.4589319, -0.7381085, -3.198902, 0.07450981, 1, 0, 1,
-0.4565088, -1.153823, -3.632139, 0.06666667, 1, 0, 1,
-0.4468445, -0.2778958, -1.32943, 0.0627451, 1, 0, 1,
-0.4452955, 1.350389, 0.3943166, 0.05490196, 1, 0, 1,
-0.4431073, -0.3589505, -2.951488, 0.05098039, 1, 0, 1,
-0.4393349, 0.07772227, -3.380684, 0.04313726, 1, 0, 1,
-0.4389838, 0.3363813, -0.113201, 0.03921569, 1, 0, 1,
-0.4250318, 1.726064, 0.1181121, 0.03137255, 1, 0, 1,
-0.4242375, 0.1420737, -3.688464, 0.02745098, 1, 0, 1,
-0.4233491, -0.1881271, -4.069345, 0.01960784, 1, 0, 1,
-0.4232836, 1.299746, 1.203723, 0.01568628, 1, 0, 1,
-0.4212959, -0.4687687, -3.728976, 0.007843138, 1, 0, 1,
-0.420505, 0.924363, -0.7747304, 0.003921569, 1, 0, 1,
-0.4175431, -0.0505656, -2.048388, 0, 1, 0.003921569, 1,
-0.4158309, -0.5195001, -1.729145, 0, 1, 0.01176471, 1,
-0.4107797, 0.3656369, 0.4866196, 0, 1, 0.01568628, 1,
-0.4100237, -0.9780732, -1.652281, 0, 1, 0.02352941, 1,
-0.409067, -1.178487, -2.326899, 0, 1, 0.02745098, 1,
-0.4053455, -1.584089, -3.023319, 0, 1, 0.03529412, 1,
-0.4025287, -0.7896169, -3.259499, 0, 1, 0.03921569, 1,
-0.3906955, 0.3376545, 0.8852224, 0, 1, 0.04705882, 1,
-0.3899919, 1.825799, -0.1489671, 0, 1, 0.05098039, 1,
-0.3886334, 1.214722, 0.9625403, 0, 1, 0.05882353, 1,
-0.3857317, 0.5630671, -0.1907591, 0, 1, 0.0627451, 1,
-0.3855484, -2.194029, -3.527333, 0, 1, 0.07058824, 1,
-0.3853647, -0.1880802, -2.282268, 0, 1, 0.07450981, 1,
-0.3837725, 0.02353836, -1.986808, 0, 1, 0.08235294, 1,
-0.3837481, 1.441346, -1.041348, 0, 1, 0.08627451, 1,
-0.3836651, 0.2937638, -0.6005058, 0, 1, 0.09411765, 1,
-0.372228, 0.3019166, -1.37618, 0, 1, 0.1019608, 1,
-0.3669096, 0.7445964, -0.449595, 0, 1, 0.1058824, 1,
-0.3666493, -1.269328, -3.451788, 0, 1, 0.1137255, 1,
-0.3637621, 1.307581, -1.524534, 0, 1, 0.1176471, 1,
-0.3632163, 0.4873417, -1.383748, 0, 1, 0.1254902, 1,
-0.362999, -0.3099034, -2.125601, 0, 1, 0.1294118, 1,
-0.3566814, 0.2499805, -2.22924, 0, 1, 0.1372549, 1,
-0.3549882, -0.1180986, -2.87357, 0, 1, 0.1411765, 1,
-0.3548194, 0.1921146, 0.02371163, 0, 1, 0.1490196, 1,
-0.3526373, -0.6107422, -2.6133, 0, 1, 0.1529412, 1,
-0.3499396, -1.141242, -2.405674, 0, 1, 0.1607843, 1,
-0.3489824, -0.3507871, -2.14056, 0, 1, 0.1647059, 1,
-0.3483954, -1.306895, -1.536261, 0, 1, 0.172549, 1,
-0.3481597, -0.8626418, -2.306775, 0, 1, 0.1764706, 1,
-0.3474529, 1.238376, -1.584835, 0, 1, 0.1843137, 1,
-0.347353, -0.7745097, -2.933125, 0, 1, 0.1882353, 1,
-0.3466157, 1.284483, -0.1794757, 0, 1, 0.1960784, 1,
-0.3447554, -0.4123862, -1.514348, 0, 1, 0.2039216, 1,
-0.3422725, 0.1805036, -0.7233561, 0, 1, 0.2078431, 1,
-0.3388318, 0.6809606, -0.1399126, 0, 1, 0.2156863, 1,
-0.3364713, 0.554875, -0.9524533, 0, 1, 0.2196078, 1,
-0.3345037, -2.178262, -2.975588, 0, 1, 0.227451, 1,
-0.3332403, -0.7266909, -3.240292, 0, 1, 0.2313726, 1,
-0.3328201, 1.148859, -1.05721, 0, 1, 0.2392157, 1,
-0.3324904, 1.732638, 0.7441707, 0, 1, 0.2431373, 1,
-0.3281445, -0.1979795, -2.2069, 0, 1, 0.2509804, 1,
-0.3280681, 0.7145885, -0.2695983, 0, 1, 0.254902, 1,
-0.3132169, -0.2523457, -2.63695, 0, 1, 0.2627451, 1,
-0.3118, -0.5504904, -2.827382, 0, 1, 0.2666667, 1,
-0.3089228, -1.199842, -2.093098, 0, 1, 0.2745098, 1,
-0.3039179, -0.5152999, -2.542356, 0, 1, 0.2784314, 1,
-0.2968059, 0.9243549, 1.491114, 0, 1, 0.2862745, 1,
-0.2966717, 0.6641058, 0.2632236, 0, 1, 0.2901961, 1,
-0.2941889, -1.208163, -2.9913, 0, 1, 0.2980392, 1,
-0.2933204, -0.5740144, -1.214179, 0, 1, 0.3058824, 1,
-0.2925088, -1.321489, -2.728766, 0, 1, 0.3098039, 1,
-0.2921568, -0.7033024, -3.412836, 0, 1, 0.3176471, 1,
-0.2909719, -0.900746, -1.468021, 0, 1, 0.3215686, 1,
-0.290598, -1.330966, -3.816343, 0, 1, 0.3294118, 1,
-0.2882523, -0.5590441, -2.098057, 0, 1, 0.3333333, 1,
-0.2863967, 0.722569, -0.8695596, 0, 1, 0.3411765, 1,
-0.2829815, -0.1955024, -2.689194, 0, 1, 0.345098, 1,
-0.2789448, -0.3861024, -2.903798, 0, 1, 0.3529412, 1,
-0.2763403, -1.029879, -2.866808, 0, 1, 0.3568628, 1,
-0.2761847, -0.766963, -4.216457, 0, 1, 0.3647059, 1,
-0.2717587, 1.745676, 0.7990129, 0, 1, 0.3686275, 1,
-0.2609302, -0.4077653, -2.288441, 0, 1, 0.3764706, 1,
-0.2604086, 0.8086061, -1.592632, 0, 1, 0.3803922, 1,
-0.2591905, -0.3964056, -2.957442, 0, 1, 0.3882353, 1,
-0.2586292, -1.56484, -4.586828, 0, 1, 0.3921569, 1,
-0.2565315, 0.160957, -1.238804, 0, 1, 0.4, 1,
-0.2554305, -1.22787, -2.002801, 0, 1, 0.4078431, 1,
-0.2548608, 0.6097031, -0.3356163, 0, 1, 0.4117647, 1,
-0.2541257, 0.6959655, 0.6381261, 0, 1, 0.4196078, 1,
-0.2527165, 0.2435068, 0.9760891, 0, 1, 0.4235294, 1,
-0.2518934, -0.2311592, -2.904077, 0, 1, 0.4313726, 1,
-0.2483369, 0.3253078, -0.7382506, 0, 1, 0.4352941, 1,
-0.2469166, 0.6248097, -0.7011805, 0, 1, 0.4431373, 1,
-0.2460729, 1.69672, -0.3306407, 0, 1, 0.4470588, 1,
-0.2413823, 0.745026, -0.192003, 0, 1, 0.454902, 1,
-0.2409516, -1.589303, -3.085819, 0, 1, 0.4588235, 1,
-0.2390462, 1.351442, 0.1490601, 0, 1, 0.4666667, 1,
-0.2383132, -0.2720065, -0.9218906, 0, 1, 0.4705882, 1,
-0.2364459, -1.949785, -3.053564, 0, 1, 0.4784314, 1,
-0.2342721, 0.8821774, -0.9372456, 0, 1, 0.4823529, 1,
-0.2338347, 0.9611568, 0.8343495, 0, 1, 0.4901961, 1,
-0.2301536, -0.6054742, -3.104154, 0, 1, 0.4941176, 1,
-0.2300306, -0.8954962, -3.647859, 0, 1, 0.5019608, 1,
-0.2252245, -0.5726036, -3.229918, 0, 1, 0.509804, 1,
-0.2233291, -0.1879434, -1.368097, 0, 1, 0.5137255, 1,
-0.2159571, -0.2876999, -1.785447, 0, 1, 0.5215687, 1,
-0.2128658, -1.331382, -3.95377, 0, 1, 0.5254902, 1,
-0.2112827, -0.7010529, -1.989082, 0, 1, 0.5333334, 1,
-0.2050538, -1.416129, -3.632264, 0, 1, 0.5372549, 1,
-0.2040777, 1.337645, 1.327666, 0, 1, 0.5450981, 1,
-0.1992745, -0.02092075, -0.3739823, 0, 1, 0.5490196, 1,
-0.1980857, -0.1699796, -1.326802, 0, 1, 0.5568628, 1,
-0.1971508, 2.474667, 1.698813, 0, 1, 0.5607843, 1,
-0.1910492, -0.2493463, -0.8576274, 0, 1, 0.5686275, 1,
-0.190765, 1.153499, 1.882099, 0, 1, 0.572549, 1,
-0.1906755, 0.114279, -0.1449625, 0, 1, 0.5803922, 1,
-0.1894272, 0.5633807, 0.05869087, 0, 1, 0.5843138, 1,
-0.1874614, -0.8334139, -1.079055, 0, 1, 0.5921569, 1,
-0.184203, 0.3603056, -0.4739546, 0, 1, 0.5960785, 1,
-0.1839006, 2.209506, 0.2449802, 0, 1, 0.6039216, 1,
-0.1836052, -1.062245, -3.572744, 0, 1, 0.6117647, 1,
-0.1804733, 1.420808, -0.8586702, 0, 1, 0.6156863, 1,
-0.1801236, 1.187055, -0.9932921, 0, 1, 0.6235294, 1,
-0.1789559, -0.6288851, -3.253933, 0, 1, 0.627451, 1,
-0.1736496, 0.8999894, 1.176844, 0, 1, 0.6352941, 1,
-0.1718129, 0.7995728, -0.2758423, 0, 1, 0.6392157, 1,
-0.1683713, 0.4650242, 0.1878717, 0, 1, 0.6470588, 1,
-0.1612701, 0.3551992, -1.179226, 0, 1, 0.6509804, 1,
-0.1610972, -0.7996148, -2.361583, 0, 1, 0.6588235, 1,
-0.1609334, 0.7106903, 0.401885, 0, 1, 0.6627451, 1,
-0.1602358, 1.208935, 1.428895, 0, 1, 0.6705883, 1,
-0.1497341, -2.753115, -1.413634, 0, 1, 0.6745098, 1,
-0.147507, -1.071094, -4.46843, 0, 1, 0.682353, 1,
-0.1474768, -0.310239, -1.313908, 0, 1, 0.6862745, 1,
-0.1472211, -1.64489, -4.518167, 0, 1, 0.6941177, 1,
-0.1468831, -0.2465178, -4.194064, 0, 1, 0.7019608, 1,
-0.1459053, 1.368218, -0.1399504, 0, 1, 0.7058824, 1,
-0.1427635, 0.985944, 1.993774, 0, 1, 0.7137255, 1,
-0.140234, 0.1005268, -1.051326, 0, 1, 0.7176471, 1,
-0.1349893, 0.0348921, -0.1691425, 0, 1, 0.7254902, 1,
-0.128756, 1.491328, 0.469942, 0, 1, 0.7294118, 1,
-0.128576, 0.764148, 0.3733287, 0, 1, 0.7372549, 1,
-0.1267881, 0.2098196, -0.9077696, 0, 1, 0.7411765, 1,
-0.1262774, 1.929007, 1.062208, 0, 1, 0.7490196, 1,
-0.1245198, 0.5699737, -1.000798, 0, 1, 0.7529412, 1,
-0.123919, -0.7210444, -4.258545, 0, 1, 0.7607843, 1,
-0.118163, 0.953469, -0.8994668, 0, 1, 0.7647059, 1,
-0.1161916, 0.5341988, -0.07547348, 0, 1, 0.772549, 1,
-0.115393, -1.57533, -4.106106, 0, 1, 0.7764706, 1,
-0.1138056, -2.179628, -4.300363, 0, 1, 0.7843137, 1,
-0.1121535, 1.32618, 0.2794193, 0, 1, 0.7882353, 1,
-0.103513, -0.08550479, -3.094871, 0, 1, 0.7960784, 1,
-0.1024307, 0.03097275, -0.1817612, 0, 1, 0.8039216, 1,
-0.09458216, 0.7078688, -0.6008813, 0, 1, 0.8078431, 1,
-0.09354975, -3.006155, -3.221751, 0, 1, 0.8156863, 1,
-0.09288124, 1.600961, -0.31894, 0, 1, 0.8196079, 1,
-0.0860156, -2.332343, -2.986477, 0, 1, 0.827451, 1,
-0.08490495, -0.281645, -2.998629, 0, 1, 0.8313726, 1,
-0.08240625, 0.4964452, 0.08369208, 0, 1, 0.8392157, 1,
-0.08168039, -2.021015, -3.361801, 0, 1, 0.8431373, 1,
-0.07994132, -0.03785498, -2.574224, 0, 1, 0.8509804, 1,
-0.07755939, 1.342076, 0.5980508, 0, 1, 0.854902, 1,
-0.07612495, 1.006625, 0.6868882, 0, 1, 0.8627451, 1,
-0.07497001, -2.150203, -0.8561816, 0, 1, 0.8666667, 1,
-0.07476065, 0.2318687, -0.4104168, 0, 1, 0.8745098, 1,
-0.07449622, -0.9929363, -4.587804, 0, 1, 0.8784314, 1,
-0.07269858, 1.395241, 0.5737869, 0, 1, 0.8862745, 1,
-0.06844683, 1.351389, -1.606009, 0, 1, 0.8901961, 1,
-0.06202858, -0.6922009, -3.197444, 0, 1, 0.8980392, 1,
-0.06099024, -0.6174431, -3.194837, 0, 1, 0.9058824, 1,
-0.05770317, 0.119154, -0.329869, 0, 1, 0.9098039, 1,
-0.05566069, 0.7534719, 0.647178, 0, 1, 0.9176471, 1,
-0.05361307, -0.4554124, -1.828867, 0, 1, 0.9215686, 1,
-0.05282453, 0.5038615, 0.7567357, 0, 1, 0.9294118, 1,
-0.0515692, 1.139896, -0.353256, 0, 1, 0.9333333, 1,
-0.05144962, 0.5264, -0.03890381, 0, 1, 0.9411765, 1,
-0.05138677, -0.1154721, -1.614725, 0, 1, 0.945098, 1,
-0.05075556, 0.6437609, 0.1364792, 0, 1, 0.9529412, 1,
-0.0434435, -0.2718029, -4.425239, 0, 1, 0.9568627, 1,
-0.04241721, -0.6690623, -3.138113, 0, 1, 0.9647059, 1,
-0.0366759, -0.2489022, -2.200808, 0, 1, 0.9686275, 1,
-0.02951165, -1.297036, -3.881898, 0, 1, 0.9764706, 1,
-0.02801267, 0.1921516, 1.18768, 0, 1, 0.9803922, 1,
-0.02722893, 1.03554, 0.3696692, 0, 1, 0.9882353, 1,
-0.02331271, 0.0488544, 0.06067757, 0, 1, 0.9921569, 1,
-0.02323186, 0.643773, -1.290841, 0, 1, 1, 1,
-0.02289145, -1.359287, -3.136713, 0, 0.9921569, 1, 1,
-0.01929748, -0.6484353, -4.096571, 0, 0.9882353, 1, 1,
-0.01652253, -0.5233082, -2.509513, 0, 0.9803922, 1, 1,
-0.01273986, -0.02249178, -1.015313, 0, 0.9764706, 1, 1,
-0.01144351, 0.797511, -0.3411251, 0, 0.9686275, 1, 1,
-0.008408955, -0.4800482, -3.708973, 0, 0.9647059, 1, 1,
-0.004627165, 1.30211, 0.7201446, 0, 0.9568627, 1, 1,
-0.004580942, -0.1080016, -3.368795, 0, 0.9529412, 1, 1,
-0.002005036, -0.9720591, -2.469434, 0, 0.945098, 1, 1,
0.0002768753, -0.1909705, 3.097165, 0, 0.9411765, 1, 1,
0.0007056228, -1.16306, 1.950001, 0, 0.9333333, 1, 1,
0.002703641, -0.9114831, 1.977188, 0, 0.9294118, 1, 1,
0.003576112, 1.147741, 0.5856233, 0, 0.9215686, 1, 1,
0.005372556, -0.4061893, 3.048433, 0, 0.9176471, 1, 1,
0.008749929, 0.8279689, -1.064307, 0, 0.9098039, 1, 1,
0.009557137, -0.585314, 3.283449, 0, 0.9058824, 1, 1,
0.01083827, -0.8757049, 3.373596, 0, 0.8980392, 1, 1,
0.01433796, 1.091444, 0.497157, 0, 0.8901961, 1, 1,
0.01548936, -1.865296, 3.510775, 0, 0.8862745, 1, 1,
0.02570518, -1.508183, 3.736171, 0, 0.8784314, 1, 1,
0.02696813, 0.5106956, 0.272042, 0, 0.8745098, 1, 1,
0.02932448, 1.849424, 1.690216, 0, 0.8666667, 1, 1,
0.02980616, -1.910245, 4.306318, 0, 0.8627451, 1, 1,
0.03297732, 0.2861527, 1.173327, 0, 0.854902, 1, 1,
0.03885736, -0.3143976, 2.127359, 0, 0.8509804, 1, 1,
0.03894912, -0.466272, 3.426049, 0, 0.8431373, 1, 1,
0.04824224, 0.3326746, 0.9573141, 0, 0.8392157, 1, 1,
0.05104574, 0.3630126, -1.200975, 0, 0.8313726, 1, 1,
0.05252767, -0.4026585, 2.676855, 0, 0.827451, 1, 1,
0.05417582, -0.4849417, 3.670059, 0, 0.8196079, 1, 1,
0.05544701, 0.06626155, 1.735026, 0, 0.8156863, 1, 1,
0.06013319, -0.4937588, 3.435553, 0, 0.8078431, 1, 1,
0.06130417, 0.02924323, 1.54416, 0, 0.8039216, 1, 1,
0.06353521, 0.3258331, -1.610614, 0, 0.7960784, 1, 1,
0.06409867, 0.187163, -0.6956691, 0, 0.7882353, 1, 1,
0.06542891, -0.4737039, 2.214969, 0, 0.7843137, 1, 1,
0.06573623, 1.846116, -0.1217324, 0, 0.7764706, 1, 1,
0.0712752, 1.066714, -0.5006431, 0, 0.772549, 1, 1,
0.07192319, 1.383287, 0.3641446, 0, 0.7647059, 1, 1,
0.07225868, 0.07672066, 0.8797159, 0, 0.7607843, 1, 1,
0.07850757, 0.1618029, 0.9068401, 0, 0.7529412, 1, 1,
0.08438492, -0.9804488, 5.629405, 0, 0.7490196, 1, 1,
0.0851833, -0.4409129, 2.894252, 0, 0.7411765, 1, 1,
0.0918164, 0.8288758, 1.296424, 0, 0.7372549, 1, 1,
0.0952573, 0.9776158, 0.1818108, 0, 0.7294118, 1, 1,
0.09719838, -0.7047015, 5.002094, 0, 0.7254902, 1, 1,
0.1015643, -1.211499, 3.017222, 0, 0.7176471, 1, 1,
0.1034709, 1.100772, 1.095758, 0, 0.7137255, 1, 1,
0.1073376, -1.527394, 4.271682, 0, 0.7058824, 1, 1,
0.1082532, -0.07004863, 3.296124, 0, 0.6980392, 1, 1,
0.1088039, -1.784886, 2.304513, 0, 0.6941177, 1, 1,
0.1123982, 1.045144, 1.186459, 0, 0.6862745, 1, 1,
0.1128027, -1.049636, 2.739431, 0, 0.682353, 1, 1,
0.1155528, 0.1520283, 1.109066, 0, 0.6745098, 1, 1,
0.1184966, -0.7711949, 1.686319, 0, 0.6705883, 1, 1,
0.1234268, 0.04123977, 3.270629, 0, 0.6627451, 1, 1,
0.1260909, 0.2254072, -0.6649002, 0, 0.6588235, 1, 1,
0.127895, 0.683938, 0.5945922, 0, 0.6509804, 1, 1,
0.1282985, 1.39776, -1.924371, 0, 0.6470588, 1, 1,
0.1295704, 0.97133, -1.337628, 0, 0.6392157, 1, 1,
0.1316808, 0.3888396, -0.05071122, 0, 0.6352941, 1, 1,
0.1328496, 1.132761, 2.576369, 0, 0.627451, 1, 1,
0.1330673, 0.4599105, 1.730465, 0, 0.6235294, 1, 1,
0.1334097, 0.8373928, -0.7744625, 0, 0.6156863, 1, 1,
0.1461838, -0.3006643, 2.860282, 0, 0.6117647, 1, 1,
0.1462489, 1.140133, -1.710904, 0, 0.6039216, 1, 1,
0.150198, -1.876918, 2.657335, 0, 0.5960785, 1, 1,
0.1510035, 1.902219, 0.0143641, 0, 0.5921569, 1, 1,
0.1516529, 0.6327986, 0.07213996, 0, 0.5843138, 1, 1,
0.1520219, 0.9059572, -0.1438911, 0, 0.5803922, 1, 1,
0.1530938, 0.1880365, 0.950471, 0, 0.572549, 1, 1,
0.1533719, -1.41861, 3.244677, 0, 0.5686275, 1, 1,
0.153533, 0.759565, -0.5011094, 0, 0.5607843, 1, 1,
0.1640286, -1.095612, 4.496031, 0, 0.5568628, 1, 1,
0.1666943, -0.3567199, 0.6531031, 0, 0.5490196, 1, 1,
0.1686782, -0.4519629, 1.833936, 0, 0.5450981, 1, 1,
0.1752046, -0.4205438, 2.849578, 0, 0.5372549, 1, 1,
0.1760576, 2.803173, -0.705828, 0, 0.5333334, 1, 1,
0.1765734, -1.75529, 3.875512, 0, 0.5254902, 1, 1,
0.1776484, -0.4711649, 3.217231, 0, 0.5215687, 1, 1,
0.1839135, -0.2068935, 1.458772, 0, 0.5137255, 1, 1,
0.1873355, -0.01572534, 4.036094, 0, 0.509804, 1, 1,
0.1897369, -0.3124472, 3.255775, 0, 0.5019608, 1, 1,
0.1900218, 2.143704, -0.6368011, 0, 0.4941176, 1, 1,
0.1916078, -1.265023, 2.78874, 0, 0.4901961, 1, 1,
0.1930951, -0.001067037, 1.254916, 0, 0.4823529, 1, 1,
0.2045156, 0.7738506, -1.432748, 0, 0.4784314, 1, 1,
0.2090611, 1.421966, -0.2983875, 0, 0.4705882, 1, 1,
0.2091056, -1.981074, 0.9033813, 0, 0.4666667, 1, 1,
0.2106923, -0.5670655, 2.822417, 0, 0.4588235, 1, 1,
0.2164658, -0.8364337, 2.360976, 0, 0.454902, 1, 1,
0.2193139, -0.9965089, 3.133503, 0, 0.4470588, 1, 1,
0.2226163, 1.16283, -0.3904124, 0, 0.4431373, 1, 1,
0.226518, 0.5729692, -0.7194462, 0, 0.4352941, 1, 1,
0.2276252, -0.7844235, 2.856213, 0, 0.4313726, 1, 1,
0.2381043, -0.6115941, 3.173106, 0, 0.4235294, 1, 1,
0.2446291, 1.880261, -0.918611, 0, 0.4196078, 1, 1,
0.2450317, -1.213217, 3.28805, 0, 0.4117647, 1, 1,
0.2483533, 0.8050749, -0.4768331, 0, 0.4078431, 1, 1,
0.2506022, 0.05626703, 0.407011, 0, 0.4, 1, 1,
0.2526473, 0.1056748, 2.057043, 0, 0.3921569, 1, 1,
0.2548097, 1.114046, -1.427607, 0, 0.3882353, 1, 1,
0.255265, 0.989557, -0.9074351, 0, 0.3803922, 1, 1,
0.2583319, 0.6557871, 0.2158635, 0, 0.3764706, 1, 1,
0.2584982, -0.4814247, 1.748792, 0, 0.3686275, 1, 1,
0.2592431, -0.4730214, 2.279058, 0, 0.3647059, 1, 1,
0.2598766, -0.8072098, 5.499292, 0, 0.3568628, 1, 1,
0.2600888, 1.091996, 0.6281841, 0, 0.3529412, 1, 1,
0.2695328, -0.4269235, 2.768016, 0, 0.345098, 1, 1,
0.2704245, 0.7139506, 0.7038354, 0, 0.3411765, 1, 1,
0.2710938, 1.70303, -0.043277, 0, 0.3333333, 1, 1,
0.2736991, -0.499551, 0.6656147, 0, 0.3294118, 1, 1,
0.2752902, -0.491361, 3.75727, 0, 0.3215686, 1, 1,
0.2876861, 1.228683, 2.019325, 0, 0.3176471, 1, 1,
0.2896342, 0.5189682, -0.01473855, 0, 0.3098039, 1, 1,
0.2938248, -0.07549947, 0.6422074, 0, 0.3058824, 1, 1,
0.3002406, 0.2669051, 0.8505358, 0, 0.2980392, 1, 1,
0.3091117, -0.1774238, 2.763848, 0, 0.2901961, 1, 1,
0.3104275, -0.1169116, 1.790367, 0, 0.2862745, 1, 1,
0.321366, 1.125573, -0.5724466, 0, 0.2784314, 1, 1,
0.323047, -0.8248051, 2.44218, 0, 0.2745098, 1, 1,
0.3239146, 1.250136, -1.424004, 0, 0.2666667, 1, 1,
0.3264646, -0.5655833, 3.086029, 0, 0.2627451, 1, 1,
0.3285818, 0.4144497, 0.9412339, 0, 0.254902, 1, 1,
0.3293153, 0.5058663, -1.055897, 0, 0.2509804, 1, 1,
0.3309377, 1.297381, 0.04789756, 0, 0.2431373, 1, 1,
0.3333435, -0.4735379, 3.456385, 0, 0.2392157, 1, 1,
0.3338906, 0.7478694, 1.808748, 0, 0.2313726, 1, 1,
0.3368206, 1.187086, -1.009175, 0, 0.227451, 1, 1,
0.3448116, -1.7403, 1.322256, 0, 0.2196078, 1, 1,
0.3448386, 0.496067, 0.1588369, 0, 0.2156863, 1, 1,
0.3474279, 0.6114864, 0.4604853, 0, 0.2078431, 1, 1,
0.3484704, -0.3765967, 1.586612, 0, 0.2039216, 1, 1,
0.348633, -0.0171882, 1.968714, 0, 0.1960784, 1, 1,
0.3571776, -0.8292867, 3.347937, 0, 0.1882353, 1, 1,
0.3617451, 1.341435, 1.320115, 0, 0.1843137, 1, 1,
0.3636108, -0.4461013, 3.102913, 0, 0.1764706, 1, 1,
0.3647972, 0.2512976, 0.2938339, 0, 0.172549, 1, 1,
0.3674618, 0.6906864, 0.7319796, 0, 0.1647059, 1, 1,
0.3678951, 0.1352258, -0.3520954, 0, 0.1607843, 1, 1,
0.3699223, -1.076394, 2.63114, 0, 0.1529412, 1, 1,
0.3700121, 1.228984, 2.015276, 0, 0.1490196, 1, 1,
0.370461, 0.1488484, -0.1219411, 0, 0.1411765, 1, 1,
0.373432, 0.1524783, 0.9524606, 0, 0.1372549, 1, 1,
0.3745244, 0.3562157, -0.4840448, 0, 0.1294118, 1, 1,
0.3761799, -0.4648761, 2.665811, 0, 0.1254902, 1, 1,
0.3776024, -1.042252, 2.823024, 0, 0.1176471, 1, 1,
0.3781421, 0.2101865, 0.1428938, 0, 0.1137255, 1, 1,
0.3823724, -1.307929, 3.813811, 0, 0.1058824, 1, 1,
0.383388, 0.4579408, -1.009982, 0, 0.09803922, 1, 1,
0.3839806, -0.09208721, 3.755063, 0, 0.09411765, 1, 1,
0.3886172, -1.644418, 2.311583, 0, 0.08627451, 1, 1,
0.3944577, 0.1507774, -0.2375334, 0, 0.08235294, 1, 1,
0.3980819, -0.3757961, 2.975099, 0, 0.07450981, 1, 1,
0.3982492, -0.3308058, 3.697792, 0, 0.07058824, 1, 1,
0.3993523, -0.4139419, 3.16371, 0, 0.0627451, 1, 1,
0.4009893, 0.2454672, 0.9118943, 0, 0.05882353, 1, 1,
0.4071465, 0.7306123, -0.1336591, 0, 0.05098039, 1, 1,
0.4075798, -0.394595, 2.649027, 0, 0.04705882, 1, 1,
0.4120229, 1.208427, 1.205792, 0, 0.03921569, 1, 1,
0.415397, -0.6381983, 3.877614, 0, 0.03529412, 1, 1,
0.4270296, 0.3431207, 0.8988226, 0, 0.02745098, 1, 1,
0.4289716, -3.521884, 2.116424, 0, 0.02352941, 1, 1,
0.4314807, 0.8200653, -0.2810077, 0, 0.01568628, 1, 1,
0.4320917, 0.1682327, -1.068644, 0, 0.01176471, 1, 1,
0.4361634, 1.770766, 0.5036664, 0, 0.003921569, 1, 1,
0.4372885, -0.3051288, 2.942174, 0.003921569, 0, 1, 1,
0.4412059, -0.199289, 2.683036, 0.007843138, 0, 1, 1,
0.4451803, 0.3129984, 0.5935273, 0.01568628, 0, 1, 1,
0.4530233, -1.063025, 2.439949, 0.01960784, 0, 1, 1,
0.458159, -1.767498, 2.295797, 0.02745098, 0, 1, 1,
0.4585918, 0.6647893, -0.9264696, 0.03137255, 0, 1, 1,
0.4618667, -0.6554626, 1.504071, 0.03921569, 0, 1, 1,
0.4649104, -1.562375, 3.05325, 0.04313726, 0, 1, 1,
0.4711915, -0.4398279, 1.713392, 0.05098039, 0, 1, 1,
0.4717733, -1.880128, 3.691128, 0.05490196, 0, 1, 1,
0.4733689, 0.1926373, -0.1712833, 0.0627451, 0, 1, 1,
0.4746738, -0.1406327, 1.739843, 0.06666667, 0, 1, 1,
0.4799768, -0.8518677, 2.192818, 0.07450981, 0, 1, 1,
0.4810179, -1.002652, 3.612823, 0.07843138, 0, 1, 1,
0.4830095, -0.1877622, 2.526277, 0.08627451, 0, 1, 1,
0.4847104, 0.7271456, 1.045647, 0.09019608, 0, 1, 1,
0.4875865, 0.641146, 1.735771, 0.09803922, 0, 1, 1,
0.4894937, -0.3053511, 2.888006, 0.1058824, 0, 1, 1,
0.4941837, 1.157141, -2.429341, 0.1098039, 0, 1, 1,
0.4953566, 1.659283, 1.410997, 0.1176471, 0, 1, 1,
0.5002823, 0.9072309, 1.25527, 0.1215686, 0, 1, 1,
0.5007164, -0.9964514, 3.377756, 0.1294118, 0, 1, 1,
0.5038779, 1.303951, 0.6489748, 0.1333333, 0, 1, 1,
0.5041205, -0.1550774, 2.102876, 0.1411765, 0, 1, 1,
0.5113724, -0.7915719, 0.8833748, 0.145098, 0, 1, 1,
0.5178486, 1.634116, -0.9744184, 0.1529412, 0, 1, 1,
0.5259021, 1.012777, 0.1172632, 0.1568628, 0, 1, 1,
0.5260385, -0.4110225, 3.65402, 0.1647059, 0, 1, 1,
0.526177, -0.6957805, 2.372025, 0.1686275, 0, 1, 1,
0.5304658, 2.355972, 0.7190869, 0.1764706, 0, 1, 1,
0.5342562, -0.9337065, 2.998988, 0.1803922, 0, 1, 1,
0.5354057, 0.2204103, 0.9606958, 0.1882353, 0, 1, 1,
0.5429649, -0.07322041, 0.1009455, 0.1921569, 0, 1, 1,
0.5433555, -0.4480031, 0.9926413, 0.2, 0, 1, 1,
0.5436724, -0.9342962, 0.8751088, 0.2078431, 0, 1, 1,
0.5468737, -0.1659923, 2.004362, 0.2117647, 0, 1, 1,
0.5470908, 0.8293641, -0.1279353, 0.2196078, 0, 1, 1,
0.5514802, -0.4301594, 1.993833, 0.2235294, 0, 1, 1,
0.5606359, -1.20511, 2.829406, 0.2313726, 0, 1, 1,
0.565146, 2.019005, 0.6162298, 0.2352941, 0, 1, 1,
0.5656829, -0.006240971, 1.588385, 0.2431373, 0, 1, 1,
0.56618, -0.3573021, 2.815161, 0.2470588, 0, 1, 1,
0.5718438, 0.6664436, 2.42932, 0.254902, 0, 1, 1,
0.5719014, 0.5388519, 1.556964, 0.2588235, 0, 1, 1,
0.5736458, 0.5605336, -0.0917315, 0.2666667, 0, 1, 1,
0.5782326, -0.8070607, 1.974085, 0.2705882, 0, 1, 1,
0.5792226, -0.7724816, 2.286556, 0.2784314, 0, 1, 1,
0.5795336, -1.215816, 4.949514, 0.282353, 0, 1, 1,
0.5810007, 0.8426151, 0.1684401, 0.2901961, 0, 1, 1,
0.5825735, -1.935524, 3.976344, 0.2941177, 0, 1, 1,
0.5870514, 1.185255, 0.6844665, 0.3019608, 0, 1, 1,
0.5883689, 0.1899679, 2.413897, 0.3098039, 0, 1, 1,
0.5934892, 2.09941, -0.2918781, 0.3137255, 0, 1, 1,
0.5937052, 1.374551, -1.317242, 0.3215686, 0, 1, 1,
0.5948015, -0.8931965, 3.494324, 0.3254902, 0, 1, 1,
0.5952902, -2.338835, 3.439469, 0.3333333, 0, 1, 1,
0.5953404, 0.1623273, -0.2268898, 0.3372549, 0, 1, 1,
0.5966232, -0.5611793, 1.186265, 0.345098, 0, 1, 1,
0.6002824, -0.461171, 3.379208, 0.3490196, 0, 1, 1,
0.6004236, 0.9408904, -0.08747691, 0.3568628, 0, 1, 1,
0.6065509, -0.2219663, 2.722475, 0.3607843, 0, 1, 1,
0.608911, -0.6200366, 3.405375, 0.3686275, 0, 1, 1,
0.6139178, 1.163534, 1.178962, 0.372549, 0, 1, 1,
0.6187648, -0.6689517, 4.725474, 0.3803922, 0, 1, 1,
0.6219966, -1.309021, 0.9454016, 0.3843137, 0, 1, 1,
0.6231712, 0.9142603, 0.3441972, 0.3921569, 0, 1, 1,
0.6288254, 0.4481482, 0.4059308, 0.3960784, 0, 1, 1,
0.6291944, 0.8404009, 0.167151, 0.4039216, 0, 1, 1,
0.630254, -0.110624, 2.774286, 0.4117647, 0, 1, 1,
0.6376851, -1.238023, 1.371411, 0.4156863, 0, 1, 1,
0.6388538, -0.1644609, 1.936434, 0.4235294, 0, 1, 1,
0.6399695, -0.5472011, 2.330658, 0.427451, 0, 1, 1,
0.6404691, -1.016872, 2.470162, 0.4352941, 0, 1, 1,
0.6427829, -0.3888786, 2.222543, 0.4392157, 0, 1, 1,
0.6434234, 0.2364131, 1.314561, 0.4470588, 0, 1, 1,
0.6455671, -1.983912, 2.404856, 0.4509804, 0, 1, 1,
0.6474057, -0.2105959, 1.063596, 0.4588235, 0, 1, 1,
0.6505219, -1.331574, 1.73969, 0.4627451, 0, 1, 1,
0.6519112, 1.151745, -1.381842, 0.4705882, 0, 1, 1,
0.6555789, -0.007393814, 0.6355965, 0.4745098, 0, 1, 1,
0.6606948, 0.3570555, 1.378953, 0.4823529, 0, 1, 1,
0.660914, -0.3104312, 0.6903189, 0.4862745, 0, 1, 1,
0.6627032, 0.7678456, 1.032062, 0.4941176, 0, 1, 1,
0.6696243, 1.343145, 0.535087, 0.5019608, 0, 1, 1,
0.6704126, -0.9270943, 2.191923, 0.5058824, 0, 1, 1,
0.6718125, -0.9420617, 1.122619, 0.5137255, 0, 1, 1,
0.6767034, -0.8477321, 1.936356, 0.5176471, 0, 1, 1,
0.6782317, 0.9825435, 1.378312, 0.5254902, 0, 1, 1,
0.6796656, -1.786003, 3.425356, 0.5294118, 0, 1, 1,
0.6802852, -1.004627, 3.399703, 0.5372549, 0, 1, 1,
0.6831768, -0.01275862, 1.764393, 0.5411765, 0, 1, 1,
0.6984792, -1.092282, 2.151186, 0.5490196, 0, 1, 1,
0.7029809, 1.491961, -0.6785616, 0.5529412, 0, 1, 1,
0.7033696, 1.666166, 0.8332645, 0.5607843, 0, 1, 1,
0.7060667, 0.07963915, 1.023661, 0.5647059, 0, 1, 1,
0.7123243, -0.2745584, 2.623645, 0.572549, 0, 1, 1,
0.7186108, -0.3826913, 1.28413, 0.5764706, 0, 1, 1,
0.7232308, 0.5594022, 1.18601, 0.5843138, 0, 1, 1,
0.7337543, -0.9301882, 1.533503, 0.5882353, 0, 1, 1,
0.7354038, -0.8460879, 2.049106, 0.5960785, 0, 1, 1,
0.7366988, -1.074987, 3.372221, 0.6039216, 0, 1, 1,
0.7413117, -0.1931505, 1.781044, 0.6078432, 0, 1, 1,
0.7415335, 0.743108, 1.657157, 0.6156863, 0, 1, 1,
0.7452146, -0.5933798, 2.227982, 0.6196079, 0, 1, 1,
0.7455471, 0.6596068, 0.379814, 0.627451, 0, 1, 1,
0.745888, -0.05835226, 1.107704, 0.6313726, 0, 1, 1,
0.748885, -0.3600576, 2.332644, 0.6392157, 0, 1, 1,
0.74927, 1.457768, -0.4127876, 0.6431373, 0, 1, 1,
0.7516968, -0.08364064, 3.260722, 0.6509804, 0, 1, 1,
0.7635355, -1.067706, 1.779899, 0.654902, 0, 1, 1,
0.772477, 0.1397332, 0.5374656, 0.6627451, 0, 1, 1,
0.7780935, 0.4014013, 1.19073, 0.6666667, 0, 1, 1,
0.7820485, -1.457334, -0.07488762, 0.6745098, 0, 1, 1,
0.7827488, 0.9297245, 0.9292567, 0.6784314, 0, 1, 1,
0.7865353, 1.67182, -1.638291, 0.6862745, 0, 1, 1,
0.7877238, -0.3762747, 4.702444, 0.6901961, 0, 1, 1,
0.7879801, 1.17378, 1.396159, 0.6980392, 0, 1, 1,
0.7944825, 0.4925849, 1.92492, 0.7058824, 0, 1, 1,
0.7994465, -0.1774424, 0.5633493, 0.7098039, 0, 1, 1,
0.8018931, 0.3271955, 1.048107, 0.7176471, 0, 1, 1,
0.8065844, 0.987202, 2.030339, 0.7215686, 0, 1, 1,
0.8145018, -0.1492359, 0.9303232, 0.7294118, 0, 1, 1,
0.8156803, -0.3822972, 2.269811, 0.7333333, 0, 1, 1,
0.8164639, -0.5549206, 1.59622, 0.7411765, 0, 1, 1,
0.8176523, 0.268872, -0.2540479, 0.7450981, 0, 1, 1,
0.8257133, 0.3334434, 0.5859077, 0.7529412, 0, 1, 1,
0.830555, 0.1702107, -0.8638265, 0.7568628, 0, 1, 1,
0.8337494, 1.100597, 1.890286, 0.7647059, 0, 1, 1,
0.8344666, 1.147839, -0.7096184, 0.7686275, 0, 1, 1,
0.8355986, -0.7026174, 1.609901, 0.7764706, 0, 1, 1,
0.83623, -0.6307743, 2.398805, 0.7803922, 0, 1, 1,
0.8380264, 0.9324189, 0.5101895, 0.7882353, 0, 1, 1,
0.8380669, -0.6573142, 2.24788, 0.7921569, 0, 1, 1,
0.8450822, -0.7707685, 1.594943, 0.8, 0, 1, 1,
0.8566903, 0.07634109, -0.02740855, 0.8078431, 0, 1, 1,
0.8607406, 1.216861, -0.08160756, 0.8117647, 0, 1, 1,
0.8629892, 2.079166, 1.207215, 0.8196079, 0, 1, 1,
0.8645979, -0.8719546, 0.5931504, 0.8235294, 0, 1, 1,
0.8649084, 1.035023, 0.9037939, 0.8313726, 0, 1, 1,
0.8703654, -0.07069058, 0.6908339, 0.8352941, 0, 1, 1,
0.8714294, 0.5333499, 0.07937827, 0.8431373, 0, 1, 1,
0.8715515, 1.46296, 1.941229, 0.8470588, 0, 1, 1,
0.8753289, -2.336262, 1.184342, 0.854902, 0, 1, 1,
0.8769136, 0.1780352, 1.011184, 0.8588235, 0, 1, 1,
0.8842708, 0.1625119, 0.5818782, 0.8666667, 0, 1, 1,
0.9048315, -0.4728906, 0.190718, 0.8705882, 0, 1, 1,
0.9050472, -0.4390403, 2.412324, 0.8784314, 0, 1, 1,
0.910515, 0.08182628, 0.6544291, 0.8823529, 0, 1, 1,
0.9160509, 1.280804, -0.1607351, 0.8901961, 0, 1, 1,
0.9164341, 0.4190923, 1.925112, 0.8941177, 0, 1, 1,
0.921554, -1.879857, 2.721354, 0.9019608, 0, 1, 1,
0.9255302, -0.4382504, 2.699309, 0.9098039, 0, 1, 1,
0.9398866, -0.9355097, 1.787615, 0.9137255, 0, 1, 1,
0.9466639, -0.8690792, 3.440485, 0.9215686, 0, 1, 1,
0.9484776, -0.8756428, 2.3149, 0.9254902, 0, 1, 1,
0.9491469, -0.4857807, 1.820824, 0.9333333, 0, 1, 1,
0.9579225, 1.453588, 1.771419, 0.9372549, 0, 1, 1,
0.9732698, -0.6926358, 1.608317, 0.945098, 0, 1, 1,
0.98314, 1.140219, -0.08795648, 0.9490196, 0, 1, 1,
0.9898196, -0.4727191, 1.144297, 0.9568627, 0, 1, 1,
0.9936265, -0.1245456, 0.9913586, 0.9607843, 0, 1, 1,
0.9952801, -1.45808, 2.566232, 0.9686275, 0, 1, 1,
0.9990498, -0.442162, 2.79516, 0.972549, 0, 1, 1,
1.001996, -0.7753734, 3.068718, 0.9803922, 0, 1, 1,
1.004075, 0.7961816, 1.93761, 0.9843137, 0, 1, 1,
1.012998, -0.9411498, 3.851406, 0.9921569, 0, 1, 1,
1.016929, -1.175585, 2.215878, 0.9960784, 0, 1, 1,
1.020948, -0.4876755, 3.788401, 1, 0, 0.9960784, 1,
1.023652, -0.7565777, 0.7396291, 1, 0, 0.9882353, 1,
1.023836, -0.9416683, 0.5521365, 1, 0, 0.9843137, 1,
1.025228, 1.74043, 1.100669, 1, 0, 0.9764706, 1,
1.025558, -0.6180376, 2.012309, 1, 0, 0.972549, 1,
1.029463, -1.496705, 2.256915, 1, 0, 0.9647059, 1,
1.040981, 0.7993712, 0.3801171, 1, 0, 0.9607843, 1,
1.048172, 0.3148253, 1.427, 1, 0, 0.9529412, 1,
1.050519, 0.479757, 1.154202, 1, 0, 0.9490196, 1,
1.056284, -0.7025906, 0.7506239, 1, 0, 0.9411765, 1,
1.05674, 0.008453505, 0.3190666, 1, 0, 0.9372549, 1,
1.060164, -0.8510669, 2.131965, 1, 0, 0.9294118, 1,
1.066856, -0.4669577, 1.653876, 1, 0, 0.9254902, 1,
1.068904, -1.156374, 3.684698, 1, 0, 0.9176471, 1,
1.07339, -0.9174738, 4.127598, 1, 0, 0.9137255, 1,
1.074195, 1.209513, -0.05849116, 1, 0, 0.9058824, 1,
1.077532, 0.1974437, 3.061737, 1, 0, 0.9019608, 1,
1.07768, -0.2058081, 0.916429, 1, 0, 0.8941177, 1,
1.079931, -0.16575, 0.9889619, 1, 0, 0.8862745, 1,
1.0809, 1.913835, -0.6440476, 1, 0, 0.8823529, 1,
1.082812, 0.2283935, 1.158313, 1, 0, 0.8745098, 1,
1.082899, 0.7097005, 0.5646268, 1, 0, 0.8705882, 1,
1.084193, -0.3141763, -1.358582, 1, 0, 0.8627451, 1,
1.090797, 1.038245, -1.11798, 1, 0, 0.8588235, 1,
1.091745, 0.152788, 0.8081054, 1, 0, 0.8509804, 1,
1.093783, 0.01648443, 2.318837, 1, 0, 0.8470588, 1,
1.10595, -0.1538758, 0.2685276, 1, 0, 0.8392157, 1,
1.119079, -1.466926, 0.9590064, 1, 0, 0.8352941, 1,
1.120795, -1.623215, 2.37559, 1, 0, 0.827451, 1,
1.122607, 0.6511881, 1.066053, 1, 0, 0.8235294, 1,
1.126856, -0.476317, -0.004650197, 1, 0, 0.8156863, 1,
1.128008, 0.1203599, 2.085149, 1, 0, 0.8117647, 1,
1.143305, 0.07900428, -0.09133668, 1, 0, 0.8039216, 1,
1.14708, -1.769077, 0.9703947, 1, 0, 0.7960784, 1,
1.155841, 0.1073944, 2.96328, 1, 0, 0.7921569, 1,
1.168496, 0.610122, 2.719122, 1, 0, 0.7843137, 1,
1.179045, -0.6091684, 4.174285, 1, 0, 0.7803922, 1,
1.179902, -2.022182, 1.696499, 1, 0, 0.772549, 1,
1.182193, -1.041581, 1.241878, 1, 0, 0.7686275, 1,
1.19376, -0.09236916, 1.577585, 1, 0, 0.7607843, 1,
1.200561, -1.455704, 2.654456, 1, 0, 0.7568628, 1,
1.205392, 1.432807, 1.057247, 1, 0, 0.7490196, 1,
1.209468, -0.2214124, 1.257338, 1, 0, 0.7450981, 1,
1.217251, 2.104181, 0.07689259, 1, 0, 0.7372549, 1,
1.21874, 1.292481, 0.2462772, 1, 0, 0.7333333, 1,
1.219302, 1.435601, 0.7340561, 1, 0, 0.7254902, 1,
1.225681, -1.081503, 2.129745, 1, 0, 0.7215686, 1,
1.230958, 0.9671311, 1.311317, 1, 0, 0.7137255, 1,
1.236387, -2.410472, 3.211683, 1, 0, 0.7098039, 1,
1.23937, -0.9266152, 3.295181, 1, 0, 0.7019608, 1,
1.245641, -0.1360439, 1.240079, 1, 0, 0.6941177, 1,
1.264188, -1.19273, 0.8821167, 1, 0, 0.6901961, 1,
1.266808, -1.599239, 2.829251, 1, 0, 0.682353, 1,
1.272565, 1.147078, 0.2503313, 1, 0, 0.6784314, 1,
1.274009, -1.175453, 4.095049, 1, 0, 0.6705883, 1,
1.285155, 0.4159648, 2.54775, 1, 0, 0.6666667, 1,
1.288015, 0.007093102, 1.944814, 1, 0, 0.6588235, 1,
1.289268, 0.2985405, 0.2417423, 1, 0, 0.654902, 1,
1.298389, -0.317787, 2.312051, 1, 0, 0.6470588, 1,
1.30144, 1.399783, 0.787736, 1, 0, 0.6431373, 1,
1.302362, 1.92531, 1.245352, 1, 0, 0.6352941, 1,
1.303614, -0.3867745, 1.047289, 1, 0, 0.6313726, 1,
1.308125, -0.2966558, 1.243892, 1, 0, 0.6235294, 1,
1.312064, -1.947472, 1.527144, 1, 0, 0.6196079, 1,
1.31229, -0.3106039, 2.250561, 1, 0, 0.6117647, 1,
1.319226, -1.607742, 1.628843, 1, 0, 0.6078432, 1,
1.333516, -0.293696, 1.06241, 1, 0, 0.6, 1,
1.342909, 0.7477844, 1.284622, 1, 0, 0.5921569, 1,
1.346221, 0.04211007, 1.554248, 1, 0, 0.5882353, 1,
1.357998, 1.190126, 0.2361356, 1, 0, 0.5803922, 1,
1.382396, 0.1318994, 2.072022, 1, 0, 0.5764706, 1,
1.385537, 2.292887, 0.8505135, 1, 0, 0.5686275, 1,
1.389545, -1.553416, 2.578283, 1, 0, 0.5647059, 1,
1.396068, -1.486177, -0.02153275, 1, 0, 0.5568628, 1,
1.400689, -0.7784573, -0.0202762, 1, 0, 0.5529412, 1,
1.408193, -0.6332746, 2.681284, 1, 0, 0.5450981, 1,
1.414235, -0.1268024, 2.421586, 1, 0, 0.5411765, 1,
1.41771, 1.30351, 0.6835943, 1, 0, 0.5333334, 1,
1.422449, -0.1525082, 3.518558, 1, 0, 0.5294118, 1,
1.423048, 1.528507, -0.3546162, 1, 0, 0.5215687, 1,
1.448826, -1.103317, 1.406425, 1, 0, 0.5176471, 1,
1.457821, 0.7728363, 0.7406599, 1, 0, 0.509804, 1,
1.473529, 1.731734, 1.001665, 1, 0, 0.5058824, 1,
1.476818, -0.5975142, 1.376081, 1, 0, 0.4980392, 1,
1.487207, 1.888368, -0.3215697, 1, 0, 0.4901961, 1,
1.490884, -0.8887112, 2.003273, 1, 0, 0.4862745, 1,
1.497896, 0.2141949, 3.964288, 1, 0, 0.4784314, 1,
1.50113, -0.2128371, 0.9501356, 1, 0, 0.4745098, 1,
1.514247, -0.37614, 2.442736, 1, 0, 0.4666667, 1,
1.514483, 0.5369523, 2.336037, 1, 0, 0.4627451, 1,
1.518261, -1.047516, 2.55249, 1, 0, 0.454902, 1,
1.521268, -1.352841, 2.256018, 1, 0, 0.4509804, 1,
1.521731, 0.7079886, -0.6973357, 1, 0, 0.4431373, 1,
1.529203, 0.02254567, 0.8340259, 1, 0, 0.4392157, 1,
1.532572, 1.064183, 2.455321, 1, 0, 0.4313726, 1,
1.535898, -1.251768, 2.958109, 1, 0, 0.427451, 1,
1.53938, -1.48504, 1.845071, 1, 0, 0.4196078, 1,
1.551448, 0.265128, 0.7869835, 1, 0, 0.4156863, 1,
1.55317, 0.1677008, 0.8901507, 1, 0, 0.4078431, 1,
1.560672, 0.02080044, 1.375301, 1, 0, 0.4039216, 1,
1.563086, -1.872126, 2.281103, 1, 0, 0.3960784, 1,
1.570737, -1.03945, 3.03107, 1, 0, 0.3882353, 1,
1.571824, -1.01671, 2.970947, 1, 0, 0.3843137, 1,
1.577744, -2.088836, 2.838975, 1, 0, 0.3764706, 1,
1.58261, 0.6460017, 0.189239, 1, 0, 0.372549, 1,
1.599931, 1.128235, 1.011017, 1, 0, 0.3647059, 1,
1.620881, 0.8799786, -0.1407113, 1, 0, 0.3607843, 1,
1.622864, 0.9180835, -0.474013, 1, 0, 0.3529412, 1,
1.632302, 0.4201218, 0.8201788, 1, 0, 0.3490196, 1,
1.634972, -0.6238149, 1.480822, 1, 0, 0.3411765, 1,
1.641429, -0.8104298, 1.465118, 1, 0, 0.3372549, 1,
1.649096, 0.1151539, 3.457831, 1, 0, 0.3294118, 1,
1.656002, 1.895046, 0.3831257, 1, 0, 0.3254902, 1,
1.660981, 0.8571281, 1.154945, 1, 0, 0.3176471, 1,
1.684569, -1.953156, 2.497539, 1, 0, 0.3137255, 1,
1.691591, 1.536284, 0.7265125, 1, 0, 0.3058824, 1,
1.693617, 0.7781953, 1.475497, 1, 0, 0.2980392, 1,
1.694983, -1.510572, 1.085746, 1, 0, 0.2941177, 1,
1.71894, -1.20998, 3.296201, 1, 0, 0.2862745, 1,
1.724086, -0.8599244, 1.506864, 1, 0, 0.282353, 1,
1.737432, 0.163569, 0.5097963, 1, 0, 0.2745098, 1,
1.76548, 0.4229127, 1.688061, 1, 0, 0.2705882, 1,
1.778008, 0.6817054, 1.021, 1, 0, 0.2627451, 1,
1.780281, -1.421001, 1.787377, 1, 0, 0.2588235, 1,
1.79488, 0.76467, 0.7311962, 1, 0, 0.2509804, 1,
1.79629, 1.607239, 0.9110888, 1, 0, 0.2470588, 1,
1.801048, -0.4113663, 3.741557, 1, 0, 0.2392157, 1,
1.801116, -0.8927453, 3.015209, 1, 0, 0.2352941, 1,
1.803696, 0.3613529, 2.190589, 1, 0, 0.227451, 1,
1.804644, -0.05123406, 4.156829, 1, 0, 0.2235294, 1,
1.821804, -0.06160336, 1.698256, 1, 0, 0.2156863, 1,
1.834891, -0.6287133, 1.990608, 1, 0, 0.2117647, 1,
1.835241, 0.8096977, 2.5656, 1, 0, 0.2039216, 1,
1.839763, -0.1997665, 2.216414, 1, 0, 0.1960784, 1,
1.847395, -1.358985, 1.53928, 1, 0, 0.1921569, 1,
1.853169, -0.05082041, 1.164894, 1, 0, 0.1843137, 1,
1.863476, -0.05941654, 0.57471, 1, 0, 0.1803922, 1,
1.866668, 0.2094306, 0.6247565, 1, 0, 0.172549, 1,
1.874544, 1.640813, 1.022958, 1, 0, 0.1686275, 1,
1.878692, -0.2711214, 1.077554, 1, 0, 0.1607843, 1,
1.884145, 0.6235936, 0.2223929, 1, 0, 0.1568628, 1,
1.88708, -0.06302122, 1.324196, 1, 0, 0.1490196, 1,
1.900733, 0.8890416, 1.119515, 1, 0, 0.145098, 1,
1.919932, 0.3346877, 1.740874, 1, 0, 0.1372549, 1,
1.938213, 1.803961, -0.1082347, 1, 0, 0.1333333, 1,
1.947921, -0.08352448, 0.8049573, 1, 0, 0.1254902, 1,
1.967804, -0.9833411, 3.781217, 1, 0, 0.1215686, 1,
1.969448, 0.4381242, 0.2495975, 1, 0, 0.1137255, 1,
1.969773, -1.874959, 1.594353, 1, 0, 0.1098039, 1,
2.003861, -1.617442, 1.14405, 1, 0, 0.1019608, 1,
2.024981, 1.270446, 1.535498, 1, 0, 0.09411765, 1,
2.035513, -0.7150813, 0.4537598, 1, 0, 0.09019608, 1,
2.037236, 0.1531096, 1.22996, 1, 0, 0.08235294, 1,
2.043101, 1.143779, -0.8522551, 1, 0, 0.07843138, 1,
2.062056, 0.1755751, 1.742978, 1, 0, 0.07058824, 1,
2.087783, 0.8309124, 2.631278, 1, 0, 0.06666667, 1,
2.097757, 0.1519725, 2.921241, 1, 0, 0.05882353, 1,
2.105882, 0.1003461, 3.294044, 1, 0, 0.05490196, 1,
2.145035, 1.013578, 0.9481922, 1, 0, 0.04705882, 1,
2.154907, -0.8586301, 1.122373, 1, 0, 0.04313726, 1,
2.168544, 1.086101, 2.095018, 1, 0, 0.03529412, 1,
2.263655, 0.5311679, 1.626408, 1, 0, 0.03137255, 1,
2.28867, 0.2095376, 1.679659, 1, 0, 0.02352941, 1,
2.297068, -0.4211281, 3.843514, 1, 0, 0.01960784, 1,
2.56677, 0.3500393, -0.4367054, 1, 0, 0.01176471, 1,
2.921962, 0.1255979, 2.475147, 1, 0, 0.007843138, 1
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
-0.3723503, -4.593981, -6.56676, 0, -0.5, 0.5, 0.5,
-0.3723503, -4.593981, -6.56676, 1, -0.5, 0.5, 0.5,
-0.3723503, -4.593981, -6.56676, 1, 1.5, 0.5, 0.5,
-0.3723503, -4.593981, -6.56676, 0, 1.5, 0.5, 0.5
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
-4.783434, -0.3593558, -6.56676, 0, -0.5, 0.5, 0.5,
-4.783434, -0.3593558, -6.56676, 1, -0.5, 0.5, 0.5,
-4.783434, -0.3593558, -6.56676, 1, 1.5, 0.5, 0.5,
-4.783434, -0.3593558, -6.56676, 0, 1.5, 0.5, 0.5
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
-4.783434, -4.593981, 0.4151404, 0, -0.5, 0.5, 0.5,
-4.783434, -4.593981, 0.4151404, 1, -0.5, 0.5, 0.5,
-4.783434, -4.593981, 0.4151404, 1, 1.5, 0.5, 0.5,
-4.783434, -4.593981, 0.4151404, 0, 1.5, 0.5, 0.5
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
-3, -3.61676, -4.955552,
2, -3.61676, -4.955552,
-3, -3.61676, -4.955552,
-3, -3.77963, -5.224087,
-2, -3.61676, -4.955552,
-2, -3.77963, -5.224087,
-1, -3.61676, -4.955552,
-1, -3.77963, -5.224087,
0, -3.61676, -4.955552,
0, -3.77963, -5.224087,
1, -3.61676, -4.955552,
1, -3.77963, -5.224087,
2, -3.61676, -4.955552,
2, -3.77963, -5.224087
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
-3, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
-3, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
-3, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
-3, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5,
-2, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
-2, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
-2, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
-2, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5,
-1, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
-1, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
-1, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
-1, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5,
0, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
0, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
0, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
0, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5,
1, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
1, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
1, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
1, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5,
2, -4.105371, -5.761156, 0, -0.5, 0.5, 0.5,
2, -4.105371, -5.761156, 1, -0.5, 0.5, 0.5,
2, -4.105371, -5.761156, 1, 1.5, 0.5, 0.5,
2, -4.105371, -5.761156, 0, 1.5, 0.5, 0.5
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
-3.765492, -3, -4.955552,
-3.765492, 2, -4.955552,
-3.765492, -3, -4.955552,
-3.935149, -3, -5.224087,
-3.765492, -2, -4.955552,
-3.935149, -2, -5.224087,
-3.765492, -1, -4.955552,
-3.935149, -1, -5.224087,
-3.765492, 0, -4.955552,
-3.935149, 0, -5.224087,
-3.765492, 1, -4.955552,
-3.935149, 1, -5.224087,
-3.765492, 2, -4.955552,
-3.935149, 2, -5.224087
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
-4.274463, -3, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, -3, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, -3, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, -3, -5.761156, 0, 1.5, 0.5, 0.5,
-4.274463, -2, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, -2, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, -2, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, -2, -5.761156, 0, 1.5, 0.5, 0.5,
-4.274463, -1, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, -1, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, -1, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, -1, -5.761156, 0, 1.5, 0.5, 0.5,
-4.274463, 0, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, 0, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, 0, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, 0, -5.761156, 0, 1.5, 0.5, 0.5,
-4.274463, 1, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, 1, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, 1, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, 1, -5.761156, 0, 1.5, 0.5, 0.5,
-4.274463, 2, -5.761156, 0, -0.5, 0.5, 0.5,
-4.274463, 2, -5.761156, 1, -0.5, 0.5, 0.5,
-4.274463, 2, -5.761156, 1, 1.5, 0.5, 0.5,
-4.274463, 2, -5.761156, 0, 1.5, 0.5, 0.5
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
-3.765492, -3.61676, -4,
-3.765492, -3.61676, 4,
-3.765492, -3.61676, -4,
-3.935149, -3.77963, -4,
-3.765492, -3.61676, -2,
-3.935149, -3.77963, -2,
-3.765492, -3.61676, 0,
-3.935149, -3.77963, 0,
-3.765492, -3.61676, 2,
-3.935149, -3.77963, 2,
-3.765492, -3.61676, 4,
-3.935149, -3.77963, 4
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
-4.274463, -4.105371, -4, 0, -0.5, 0.5, 0.5,
-4.274463, -4.105371, -4, 1, -0.5, 0.5, 0.5,
-4.274463, -4.105371, -4, 1, 1.5, 0.5, 0.5,
-4.274463, -4.105371, -4, 0, 1.5, 0.5, 0.5,
-4.274463, -4.105371, -2, 0, -0.5, 0.5, 0.5,
-4.274463, -4.105371, -2, 1, -0.5, 0.5, 0.5,
-4.274463, -4.105371, -2, 1, 1.5, 0.5, 0.5,
-4.274463, -4.105371, -2, 0, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 0, 0, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 0, 1, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 0, 1, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 0, 0, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 2, 0, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 2, 1, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 2, 1, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 2, 0, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 4, 0, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 4, 1, -0.5, 0.5, 0.5,
-4.274463, -4.105371, 4, 1, 1.5, 0.5, 0.5,
-4.274463, -4.105371, 4, 0, 1.5, 0.5, 0.5
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
-3.765492, -3.61676, -4.955552,
-3.765492, 2.898048, -4.955552,
-3.765492, -3.61676, 5.785833,
-3.765492, 2.898048, 5.785833,
-3.765492, -3.61676, -4.955552,
-3.765492, -3.61676, 5.785833,
-3.765492, 2.898048, -4.955552,
-3.765492, 2.898048, 5.785833,
-3.765492, -3.61676, -4.955552,
3.020791, -3.61676, -4.955552,
-3.765492, -3.61676, 5.785833,
3.020791, -3.61676, 5.785833,
-3.765492, 2.898048, -4.955552,
3.020791, 2.898048, -4.955552,
-3.765492, 2.898048, 5.785833,
3.020791, 2.898048, 5.785833,
3.020791, -3.61676, -4.955552,
3.020791, 2.898048, -4.955552,
3.020791, -3.61676, 5.785833,
3.020791, 2.898048, 5.785833,
3.020791, -3.61676, -4.955552,
3.020791, -3.61676, 5.785833,
3.020791, 2.898048, -4.955552,
3.020791, 2.898048, 5.785833
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
var radius = 7.624407;
var distance = 33.92185;
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
mvMatrix.translate( 0.3723503, 0.3593558, -0.4151404 );
mvMatrix.scale( 1.214753, 1.265372, 0.767467 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.92185);
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
daimuron<-read.table("daimuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-daimuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
```

```r
y<-daimuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
```

```r
z<-daimuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'daimuron' not found
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
-3.666663, 0.1018443, -2.17204, 0, 0, 1, 1, 1,
-3.599261, -1.581735, -0.8416252, 1, 0, 0, 1, 1,
-3.271108, -0.7211453, -1.491932, 1, 0, 0, 1, 1,
-3.107001, 0.07631905, -2.78809, 1, 0, 0, 1, 1,
-3.106945, 1.917061, -0.4202696, 1, 0, 0, 1, 1,
-2.908407, -0.07106227, -2.686216, 1, 0, 0, 1, 1,
-2.904996, -1.67736, -0.9250976, 0, 0, 0, 1, 1,
-2.605181, 1.449491, -1.695888, 0, 0, 0, 1, 1,
-2.59883, 0.5739834, -1.168351, 0, 0, 0, 1, 1,
-2.440248, 0.5334237, -0.2485663, 0, 0, 0, 1, 1,
-2.382943, 2.067466, -3.057715, 0, 0, 0, 1, 1,
-2.366102, -0.7804395, -1.431649, 0, 0, 0, 1, 1,
-2.320617, 1.306832, 0.03492802, 0, 0, 0, 1, 1,
-2.311033, -0.06694584, -1.147343, 1, 1, 1, 1, 1,
-2.247257, 0.6801627, 0.6925177, 1, 1, 1, 1, 1,
-2.190295, -0.5398896, -0.965682, 1, 1, 1, 1, 1,
-2.160731, 0.1607986, -2.306364, 1, 1, 1, 1, 1,
-2.133219, -0.2887521, -2.955341, 1, 1, 1, 1, 1,
-2.088592, -0.3486454, -2.647423, 1, 1, 1, 1, 1,
-2.084327, 1.466254, -1.467431, 1, 1, 1, 1, 1,
-2.080711, 0.205715, -0.963716, 1, 1, 1, 1, 1,
-2.067296, 0.1736069, -0.4725368, 1, 1, 1, 1, 1,
-2.043247, -0.6470015, -3.663729, 1, 1, 1, 1, 1,
-2.041972, -1.058946, -1.617879, 1, 1, 1, 1, 1,
-2.035922, -0.4609731, -0.4764287, 1, 1, 1, 1, 1,
-1.970833, -0.6084009, -3.549444, 1, 1, 1, 1, 1,
-1.95161, 1.177491, -0.9316253, 1, 1, 1, 1, 1,
-1.93769, -0.781171, -2.548303, 1, 1, 1, 1, 1,
-1.936526, 0.4628865, -2.411835, 0, 0, 1, 1, 1,
-1.926023, -0.1119748, -3.172271, 1, 0, 0, 1, 1,
-1.920971, -0.5813535, -1.315191, 1, 0, 0, 1, 1,
-1.919041, -0.4183348, -1.546469, 1, 0, 0, 1, 1,
-1.88133, 0.8697187, -3.60965, 1, 0, 0, 1, 1,
-1.877276, -0.4771824, -1.190619, 1, 0, 0, 1, 1,
-1.871863, 1.159709, -0.3245269, 0, 0, 0, 1, 1,
-1.862765, -1.115566, -4.114882, 0, 0, 0, 1, 1,
-1.823473, -1.860944, -1.738114, 0, 0, 0, 1, 1,
-1.810658, -0.1560406, -1.915956, 0, 0, 0, 1, 1,
-1.804787, 0.8935029, -2.338969, 0, 0, 0, 1, 1,
-1.787076, -0.02436048, -0.5720749, 0, 0, 0, 1, 1,
-1.786695, -1.793867, -3.131158, 0, 0, 0, 1, 1,
-1.775396, 0.09215514, 1.282073, 1, 1, 1, 1, 1,
-1.769523, 1.745861, -0.9881625, 1, 1, 1, 1, 1,
-1.751677, 1.259133, 0.4449675, 1, 1, 1, 1, 1,
-1.72462, -0.1620034, -1.598782, 1, 1, 1, 1, 1,
-1.712481, 1.984308, -0.2472921, 1, 1, 1, 1, 1,
-1.710694, -1.632533, -0.4652898, 1, 1, 1, 1, 1,
-1.708796, 1.683206, -0.9036714, 1, 1, 1, 1, 1,
-1.708282, -1.171789, -3.533176, 1, 1, 1, 1, 1,
-1.68975, -0.1056985, -1.527299, 1, 1, 1, 1, 1,
-1.688191, 0.2036791, -1.634467, 1, 1, 1, 1, 1,
-1.672827, 0.7664136, -0.6543051, 1, 1, 1, 1, 1,
-1.6589, -2.51364, -1.946612, 1, 1, 1, 1, 1,
-1.639996, -0.4415483, -2.751807, 1, 1, 1, 1, 1,
-1.639661, -0.0911506, -2.091548, 1, 1, 1, 1, 1,
-1.637341, -0.4308331, -1.945125, 1, 1, 1, 1, 1,
-1.634729, 0.5530933, -1.426098, 0, 0, 1, 1, 1,
-1.629091, 0.2392147, -1.973397, 1, 0, 0, 1, 1,
-1.607342, -0.3949892, -0.06751704, 1, 0, 0, 1, 1,
-1.598141, 1.208461, -2.208691, 1, 0, 0, 1, 1,
-1.577513, 0.02974437, -1.725189, 1, 0, 0, 1, 1,
-1.557168, 0.1107347, -1.780054, 1, 0, 0, 1, 1,
-1.550564, -0.9189751, -2.543449, 0, 0, 0, 1, 1,
-1.54848, 0.2767732, -0.2407145, 0, 0, 0, 1, 1,
-1.548296, 0.8790607, 0.8612671, 0, 0, 0, 1, 1,
-1.538095, 0.7278969, -1.728393, 0, 0, 0, 1, 1,
-1.534316, -1.130729, -2.618629, 0, 0, 0, 1, 1,
-1.530272, 0.4920686, -0.85524, 0, 0, 0, 1, 1,
-1.508003, -0.5664271, -0.8284352, 0, 0, 0, 1, 1,
-1.504476, 0.02352405, -0.3769898, 1, 1, 1, 1, 1,
-1.499367, 1.274758, -1.352472, 1, 1, 1, 1, 1,
-1.494245, -0.4138813, -2.919807, 1, 1, 1, 1, 1,
-1.488253, 1.531602, -0.5785341, 1, 1, 1, 1, 1,
-1.484749, 0.1392437, -0.5323982, 1, 1, 1, 1, 1,
-1.476867, -1.0062, -2.193876, 1, 1, 1, 1, 1,
-1.473842, 0.3697428, -1.07432, 1, 1, 1, 1, 1,
-1.470177, 0.8553954, -1.178619, 1, 1, 1, 1, 1,
-1.464603, 0.1144261, -2.029395, 1, 1, 1, 1, 1,
-1.449707, -0.4710106, -1.191437, 1, 1, 1, 1, 1,
-1.407172, 0.6517374, -1.597605, 1, 1, 1, 1, 1,
-1.404442, 0.7431471, 0.7768446, 1, 1, 1, 1, 1,
-1.396779, 0.8519509, -1.559666, 1, 1, 1, 1, 1,
-1.396164, 1.029282, -1.302442, 1, 1, 1, 1, 1,
-1.392201, 1.126161, -0.9175394, 1, 1, 1, 1, 1,
-1.386491, 0.3971641, -1.003252, 0, 0, 1, 1, 1,
-1.382876, 0.1463391, -1.225838, 1, 0, 0, 1, 1,
-1.37202, -0.7202727, -2.758712, 1, 0, 0, 1, 1,
-1.370231, 1.464269, -0.5605436, 1, 0, 0, 1, 1,
-1.370162, -0.1346214, -0.7500539, 1, 0, 0, 1, 1,
-1.365583, -1.677033, -3.349373, 1, 0, 0, 1, 1,
-1.365214, -0.1893798, -1.657165, 0, 0, 0, 1, 1,
-1.358023, 0.4758496, -1.577185, 0, 0, 0, 1, 1,
-1.357978, 1.648081, -1.213803, 0, 0, 0, 1, 1,
-1.349792, -1.544433, -1.15791, 0, 0, 0, 1, 1,
-1.332461, 0.156168, -1.44255, 0, 0, 0, 1, 1,
-1.331133, -1.102446, -1.304195, 0, 0, 0, 1, 1,
-1.329166, 2.301907, 0.7199758, 0, 0, 0, 1, 1,
-1.316931, -0.2518987, -0.5004392, 1, 1, 1, 1, 1,
-1.313738, -0.6958277, -3.361112, 1, 1, 1, 1, 1,
-1.309404, -1.722553, -1.271272, 1, 1, 1, 1, 1,
-1.307446, -0.101284, -0.7580053, 1, 1, 1, 1, 1,
-1.293035, -0.0736162, -2.361455, 1, 1, 1, 1, 1,
-1.291064, -1.048917, -1.243897, 1, 1, 1, 1, 1,
-1.291007, 0.2149671, -1.29646, 1, 1, 1, 1, 1,
-1.290053, -1.041586, -3.638431, 1, 1, 1, 1, 1,
-1.283908, 1.078583, -1.137151, 1, 1, 1, 1, 1,
-1.278901, 0.6191643, -1.700088, 1, 1, 1, 1, 1,
-1.273278, -1.491993, -2.173099, 1, 1, 1, 1, 1,
-1.25603, -1.057717, -1.360119, 1, 1, 1, 1, 1,
-1.252386, 0.6494958, -0.4872403, 1, 1, 1, 1, 1,
-1.25133, 0.4322898, -1.265362, 1, 1, 1, 1, 1,
-1.243631, -0.5501686, -0.02157167, 1, 1, 1, 1, 1,
-1.239677, 0.2737283, -1.199241, 0, 0, 1, 1, 1,
-1.237657, 1.055604, -1.315034, 1, 0, 0, 1, 1,
-1.235312, 1.322608, 0.1043111, 1, 0, 0, 1, 1,
-1.234207, 0.561257, -3.364991, 1, 0, 0, 1, 1,
-1.226839, -0.7949595, -2.103876, 1, 0, 0, 1, 1,
-1.206509, -0.184019, -1.805798, 1, 0, 0, 1, 1,
-1.202252, -0.6182418, -1.13624, 0, 0, 0, 1, 1,
-1.202235, -1.703508, -1.453409, 0, 0, 0, 1, 1,
-1.197532, -0.5797798, -2.761113, 0, 0, 0, 1, 1,
-1.186119, 0.2146811, -1.294208, 0, 0, 0, 1, 1,
-1.175744, -0.3287815, -1.755324, 0, 0, 0, 1, 1,
-1.175052, 0.6287691, 0.4061637, 0, 0, 0, 1, 1,
-1.166448, -1.236078, -2.130279, 0, 0, 0, 1, 1,
-1.166025, -0.8969348, -3.089489, 1, 1, 1, 1, 1,
-1.158008, -0.2229765, -1.901081, 1, 1, 1, 1, 1,
-1.157822, -0.2455428, -3.804956, 1, 1, 1, 1, 1,
-1.156532, -0.2963313, -1.807765, 1, 1, 1, 1, 1,
-1.155335, -0.7353681, -1.718545, 1, 1, 1, 1, 1,
-1.153719, -0.4507263, -0.8035659, 1, 1, 1, 1, 1,
-1.153696, 1.744283, 0.6148823, 1, 1, 1, 1, 1,
-1.151787, 0.2580238, -0.8297506, 1, 1, 1, 1, 1,
-1.145857, 0.4662395, -3.756345, 1, 1, 1, 1, 1,
-1.140243, -0.7065398, -0.946728, 1, 1, 1, 1, 1,
-1.138429, -0.4229512, 0.1640733, 1, 1, 1, 1, 1,
-1.134725, 0.1951078, -0.9325736, 1, 1, 1, 1, 1,
-1.133829, 0.4857806, 1.028684, 1, 1, 1, 1, 1,
-1.132885, -0.962678, -1.331027, 1, 1, 1, 1, 1,
-1.128489, -2.753205, -3.566551, 1, 1, 1, 1, 1,
-1.117427, 2.102498, 1.124181, 0, 0, 1, 1, 1,
-1.110429, 0.6086002, -1.573559, 1, 0, 0, 1, 1,
-1.108409, 0.3939145, -1.167443, 1, 0, 0, 1, 1,
-1.104234, -0.6936679, -0.3767626, 1, 0, 0, 1, 1,
-1.101325, 2.123765, -0.7113716, 1, 0, 0, 1, 1,
-1.100725, 1.105425, -1.585559, 1, 0, 0, 1, 1,
-1.09508, 0.3220494, -0.6571115, 0, 0, 0, 1, 1,
-1.093211, -1.323242, -4.279632, 0, 0, 0, 1, 1,
-1.082538, 1.13192, -1.045542, 0, 0, 0, 1, 1,
-1.081427, -0.496898, -1.488664, 0, 0, 0, 1, 1,
-1.067126, -1.060111, -2.081601, 0, 0, 0, 1, 1,
-1.066319, -0.04020421, -1.49862, 0, 0, 0, 1, 1,
-1.066317, -1.036159, -2.528219, 0, 0, 0, 1, 1,
-1.062266, 0.002593249, -3.808893, 1, 1, 1, 1, 1,
-1.059701, -1.788593, -3.850196, 1, 1, 1, 1, 1,
-1.059347, 0.5502164, -3.087028, 1, 1, 1, 1, 1,
-1.052577, -0.7269924, -0.2477834, 1, 1, 1, 1, 1,
-1.039651, 0.4970534, 0.2214386, 1, 1, 1, 1, 1,
-1.037277, 0.2654115, -0.4630644, 1, 1, 1, 1, 1,
-1.037121, -0.07514115, -1.117714, 1, 1, 1, 1, 1,
-1.036121, -1.454962, -2.751253, 1, 1, 1, 1, 1,
-1.034027, -1.442881, -2.634061, 1, 1, 1, 1, 1,
-1.02706, 0.2277548, -1.291182, 1, 1, 1, 1, 1,
-1.025322, -0.8244547, -1.159144, 1, 1, 1, 1, 1,
-1.021026, -0.3335349, -1.783028, 1, 1, 1, 1, 1,
-1.013741, 0.1459461, -1.210385, 1, 1, 1, 1, 1,
-1.010772, -1.077272, -3.812034, 1, 1, 1, 1, 1,
-1.008402, -0.3707078, -1.081499, 1, 1, 1, 1, 1,
-0.9963869, -0.7604588, -2.485504, 0, 0, 1, 1, 1,
-0.995643, 0.6658437, -0.5148463, 1, 0, 0, 1, 1,
-0.9832211, 0.2593838, -0.3570125, 1, 0, 0, 1, 1,
-0.9828973, 0.05399853, -1.752605, 1, 0, 0, 1, 1,
-0.9804563, 1.202966, -0.03530565, 1, 0, 0, 1, 1,
-0.9785558, -1.150193, -1.764575, 1, 0, 0, 1, 1,
-0.9777054, 0.5466415, -1.59002, 0, 0, 0, 1, 1,
-0.9776044, 1.204685, -1.771599, 0, 0, 0, 1, 1,
-0.9501081, -0.2655939, -0.7466378, 0, 0, 0, 1, 1,
-0.9444786, 0.3040631, 0.08292124, 0, 0, 0, 1, 1,
-0.9382808, -0.02700681, -0.5415279, 0, 0, 0, 1, 1,
-0.9376251, 0.3558581, -2.112082, 0, 0, 0, 1, 1,
-0.9303795, -1.287681, -4.301295, 0, 0, 0, 1, 1,
-0.9272858, 0.9344003, -0.3150924, 1, 1, 1, 1, 1,
-0.9172987, -1.101273, -2.437613, 1, 1, 1, 1, 1,
-0.9139976, -0.5093523, -0.5263689, 1, 1, 1, 1, 1,
-0.909274, -1.625295, -3.953415, 1, 1, 1, 1, 1,
-0.9087574, -0.5823649, -0.8260003, 1, 1, 1, 1, 1,
-0.9073542, -1.670617, -3.575493, 1, 1, 1, 1, 1,
-0.9046467, 0.178325, -1.607697, 1, 1, 1, 1, 1,
-0.9040216, -1.098232, -3.164311, 1, 1, 1, 1, 1,
-0.9027809, -0.7206737, -2.325603, 1, 1, 1, 1, 1,
-0.9006621, -0.7434286, -2.30078, 1, 1, 1, 1, 1,
-0.8961748, -1.949443, -3.10084, 1, 1, 1, 1, 1,
-0.8955879, -0.4437443, -4.390484, 1, 1, 1, 1, 1,
-0.8831626, -1.03661, -2.208649, 1, 1, 1, 1, 1,
-0.8769556, 1.00552, 1.676148, 1, 1, 1, 1, 1,
-0.8756796, -0.832926, -2.291747, 1, 1, 1, 1, 1,
-0.8722787, -1.841051, -2.437777, 0, 0, 1, 1, 1,
-0.8693233, 0.2518321, -1.100418, 1, 0, 0, 1, 1,
-0.8665011, -0.2550554, -2.759991, 1, 0, 0, 1, 1,
-0.8660609, 0.1391608, -2.522621, 1, 0, 0, 1, 1,
-0.8656034, -0.4354551, -1.860708, 1, 0, 0, 1, 1,
-0.8486074, -1.480702, -4.799124, 1, 0, 0, 1, 1,
-0.8456706, -0.1980038, -1.474199, 0, 0, 0, 1, 1,
-0.8444768, -1.302663, -2.113506, 0, 0, 0, 1, 1,
-0.8267394, -0.5361336, -2.398973, 0, 0, 0, 1, 1,
-0.8261965, -0.06353729, -2.480104, 0, 0, 0, 1, 1,
-0.8257172, -0.2150928, -1.806999, 0, 0, 0, 1, 1,
-0.8239189, 0.481895, 0.6656864, 0, 0, 0, 1, 1,
-0.8218291, 0.981825, -2.37887, 0, 0, 0, 1, 1,
-0.8202558, -0.4116021, -1.449483, 1, 1, 1, 1, 1,
-0.8153198, -2.54964, -1.110341, 1, 1, 1, 1, 1,
-0.8034891, -0.5723376, -3.380219, 1, 1, 1, 1, 1,
-0.7982459, -0.03089846, 0.1317335, 1, 1, 1, 1, 1,
-0.7958972, -0.799157, -1.038533, 1, 1, 1, 1, 1,
-0.7832091, 0.6798427, -0.5732926, 1, 1, 1, 1, 1,
-0.7791759, -0.3886526, -3.012198, 1, 1, 1, 1, 1,
-0.7779065, 0.7056803, -2.12765, 1, 1, 1, 1, 1,
-0.7768309, -0.8318058, -1.815978, 1, 1, 1, 1, 1,
-0.7617201, -0.6437879, -2.231459, 1, 1, 1, 1, 1,
-0.7585218, -1.584023, -0.184915, 1, 1, 1, 1, 1,
-0.7480877, -0.1193999, -0.7158006, 1, 1, 1, 1, 1,
-0.7469717, 1.3771, -0.490616, 1, 1, 1, 1, 1,
-0.7436495, -0.5887669, -3.234825, 1, 1, 1, 1, 1,
-0.7393762, -0.5097667, -1.424799, 1, 1, 1, 1, 1,
-0.7333274, -1.444698, -3.470543, 0, 0, 1, 1, 1,
-0.7331721, -1.750134, -3.453953, 1, 0, 0, 1, 1,
-0.7328645, -0.6808166, -2.212543, 1, 0, 0, 1, 1,
-0.7307482, -0.07648826, -2.080544, 1, 0, 0, 1, 1,
-0.7305112, 0.1705989, -2.236599, 1, 0, 0, 1, 1,
-0.7294219, 0.3851057, -0.7902117, 1, 0, 0, 1, 1,
-0.728433, 0.2092701, -1.39362, 0, 0, 0, 1, 1,
-0.7244747, 1.332167, 0.4528961, 0, 0, 0, 1, 1,
-0.7226365, 0.06889076, -1.509997, 0, 0, 0, 1, 1,
-0.7197487, 0.8622352, -0.7601174, 0, 0, 0, 1, 1,
-0.7170253, -0.3264119, -4.337032, 0, 0, 0, 1, 1,
-0.7160546, -0.2179877, -0.551008, 0, 0, 0, 1, 1,
-0.7157485, -0.2147695, -3.248631, 0, 0, 0, 1, 1,
-0.7155051, -1.229656, -2.886331, 1, 1, 1, 1, 1,
-0.7133854, -0.9164068, -3.581901, 1, 1, 1, 1, 1,
-0.7131482, -1.184214, -3.985543, 1, 1, 1, 1, 1,
-0.7082794, -2.105096, -2.489386, 1, 1, 1, 1, 1,
-0.7031702, -0.5610282, -1.930167, 1, 1, 1, 1, 1,
-0.6995792, 0.1865899, -0.7763409, 1, 1, 1, 1, 1,
-0.6950859, -0.7878847, -2.346405, 1, 1, 1, 1, 1,
-0.6786945, -0.118465, -2.105683, 1, 1, 1, 1, 1,
-0.6721861, 0.4837629, -0.2035598, 1, 1, 1, 1, 1,
-0.6716744, -1.996991, -3.462119, 1, 1, 1, 1, 1,
-0.6710621, 1.304804, -1.666492, 1, 1, 1, 1, 1,
-0.6693049, 0.6593384, -0.4401408, 1, 1, 1, 1, 1,
-0.663686, 1.672067, 0.925296, 1, 1, 1, 1, 1,
-0.6626399, 1.205797, -0.1171645, 1, 1, 1, 1, 1,
-0.6600296, -1.088947, -2.847807, 1, 1, 1, 1, 1,
-0.6575469, -0.2157433, -0.9578402, 0, 0, 1, 1, 1,
-0.6573634, 0.3732657, -1.471076, 1, 0, 0, 1, 1,
-0.646993, 0.3728902, -3.690112, 1, 0, 0, 1, 1,
-0.6386536, -0.6802995, -1.825401, 1, 0, 0, 1, 1,
-0.6283724, -0.5187111, -1.364522, 1, 0, 0, 1, 1,
-0.6277106, -0.545823, -0.6509357, 1, 0, 0, 1, 1,
-0.6259717, 0.2439755, -1.155926, 0, 0, 0, 1, 1,
-0.6258292, 0.6784137, -1.15772, 0, 0, 0, 1, 1,
-0.6192077, 0.2082956, 0.5151542, 0, 0, 0, 1, 1,
-0.6159321, 0.3143027, -1.817746, 0, 0, 0, 1, 1,
-0.6151617, 0.421324, -0.1350182, 0, 0, 0, 1, 1,
-0.6125909, 1.416684, 0.6782616, 0, 0, 0, 1, 1,
-0.6108329, 0.4471151, -0.9287823, 0, 0, 0, 1, 1,
-0.6092302, 0.6615553, -0.85755, 1, 1, 1, 1, 1,
-0.6068358, -1.600925, -3.422557, 1, 1, 1, 1, 1,
-0.6030583, 1.398727, -0.599152, 1, 1, 1, 1, 1,
-0.6014378, 1.197757, -0.1901779, 1, 1, 1, 1, 1,
-0.5993435, -0.3505003, -2.532719, 1, 1, 1, 1, 1,
-0.598681, -0.678418, -2.605917, 1, 1, 1, 1, 1,
-0.5933017, 0.4295294, -0.5459747, 1, 1, 1, 1, 1,
-0.5920216, -0.1726506, -2.433306, 1, 1, 1, 1, 1,
-0.5904334, -0.5043105, -3.159589, 1, 1, 1, 1, 1,
-0.5869823, -0.6227067, -2.984537, 1, 1, 1, 1, 1,
-0.5854021, -0.6101254, -2.334293, 1, 1, 1, 1, 1,
-0.5768306, 1.663812, 0.7076815, 1, 1, 1, 1, 1,
-0.5757049, 0.771542, -2.239331, 1, 1, 1, 1, 1,
-0.5733152, -0.8520886, -2.100411, 1, 1, 1, 1, 1,
-0.5725774, 1.455775, 1.516714, 1, 1, 1, 1, 1,
-0.5697133, -0.1264361, -2.597453, 0, 0, 1, 1, 1,
-0.5693601, 1.246187, -0.8570933, 1, 0, 0, 1, 1,
-0.5657443, 0.09408493, -1.193077, 1, 0, 0, 1, 1,
-0.5652693, -0.4848129, -3.152306, 1, 0, 0, 1, 1,
-0.5621746, -0.2164932, -2.474566, 1, 0, 0, 1, 1,
-0.5597717, -1.374308, -2.174442, 1, 0, 0, 1, 1,
-0.5547308, 0.3236816, -2.259048, 0, 0, 0, 1, 1,
-0.5512296, -0.5916209, -2.595845, 0, 0, 0, 1, 1,
-0.5487661, -0.1359782, -2.306065, 0, 0, 0, 1, 1,
-0.5473881, 0.04453225, -0.716139, 0, 0, 0, 1, 1,
-0.5459594, 0.5347378, -1.307524, 0, 0, 0, 1, 1,
-0.5410191, -0.2319717, -1.887996, 0, 0, 0, 1, 1,
-0.537195, -0.9547444, -4.256798, 0, 0, 0, 1, 1,
-0.5358385, 0.5984627, -1.397566, 1, 1, 1, 1, 1,
-0.5334876, 0.4110539, -0.3431391, 1, 1, 1, 1, 1,
-0.5308155, -1.074675, -3.580116, 1, 1, 1, 1, 1,
-0.5290391, 1.901767, -0.6454116, 1, 1, 1, 1, 1,
-0.5271119, 1.08795, -2.719136, 1, 1, 1, 1, 1,
-0.5264038, -0.005918804, -2.422323, 1, 1, 1, 1, 1,
-0.5251712, 1.398421, -0.9907337, 1, 1, 1, 1, 1,
-0.5217214, 0.2131822, -1.786562, 1, 1, 1, 1, 1,
-0.5190812, -0.687143, -2.507982, 1, 1, 1, 1, 1,
-0.5147957, 1.619101, -1.111452, 1, 1, 1, 1, 1,
-0.5060319, -1.928354, -4.359302, 1, 1, 1, 1, 1,
-0.502705, -0.8768203, -1.827332, 1, 1, 1, 1, 1,
-0.4981947, 0.9825789, -2.550751, 1, 1, 1, 1, 1,
-0.497768, 0.06469847, -1.241396, 1, 1, 1, 1, 1,
-0.4972374, 0.7012088, -0.06003299, 1, 1, 1, 1, 1,
-0.4926481, 0.4681261, -1.770654, 0, 0, 1, 1, 1,
-0.4882802, 0.8785425, -2.010567, 1, 0, 0, 1, 1,
-0.4866225, -0.4740856, -2.280994, 1, 0, 0, 1, 1,
-0.48589, 1.81689, 0.823172, 1, 0, 0, 1, 1,
-0.4850027, 0.7999092, -2.467877, 1, 0, 0, 1, 1,
-0.4830221, 0.5403208, -0.5013486, 1, 0, 0, 1, 1,
-0.4800389, -1.185886, -2.659231, 0, 0, 0, 1, 1,
-0.4751491, -0.7893873, -2.23485, 0, 0, 0, 1, 1,
-0.4708526, -0.6764433, -2.56678, 0, 0, 0, 1, 1,
-0.4657439, 0.02015874, -3.42427, 0, 0, 0, 1, 1,
-0.4648159, 0.7090425, 0.9460129, 0, 0, 0, 1, 1,
-0.4616719, -0.04415587, -1.382156, 0, 0, 0, 1, 1,
-0.4594776, 0.3365199, -0.5122145, 0, 0, 0, 1, 1,
-0.4589319, -0.7381085, -3.198902, 1, 1, 1, 1, 1,
-0.4565088, -1.153823, -3.632139, 1, 1, 1, 1, 1,
-0.4468445, -0.2778958, -1.32943, 1, 1, 1, 1, 1,
-0.4452955, 1.350389, 0.3943166, 1, 1, 1, 1, 1,
-0.4431073, -0.3589505, -2.951488, 1, 1, 1, 1, 1,
-0.4393349, 0.07772227, -3.380684, 1, 1, 1, 1, 1,
-0.4389838, 0.3363813, -0.113201, 1, 1, 1, 1, 1,
-0.4250318, 1.726064, 0.1181121, 1, 1, 1, 1, 1,
-0.4242375, 0.1420737, -3.688464, 1, 1, 1, 1, 1,
-0.4233491, -0.1881271, -4.069345, 1, 1, 1, 1, 1,
-0.4232836, 1.299746, 1.203723, 1, 1, 1, 1, 1,
-0.4212959, -0.4687687, -3.728976, 1, 1, 1, 1, 1,
-0.420505, 0.924363, -0.7747304, 1, 1, 1, 1, 1,
-0.4175431, -0.0505656, -2.048388, 1, 1, 1, 1, 1,
-0.4158309, -0.5195001, -1.729145, 1, 1, 1, 1, 1,
-0.4107797, 0.3656369, 0.4866196, 0, 0, 1, 1, 1,
-0.4100237, -0.9780732, -1.652281, 1, 0, 0, 1, 1,
-0.409067, -1.178487, -2.326899, 1, 0, 0, 1, 1,
-0.4053455, -1.584089, -3.023319, 1, 0, 0, 1, 1,
-0.4025287, -0.7896169, -3.259499, 1, 0, 0, 1, 1,
-0.3906955, 0.3376545, 0.8852224, 1, 0, 0, 1, 1,
-0.3899919, 1.825799, -0.1489671, 0, 0, 0, 1, 1,
-0.3886334, 1.214722, 0.9625403, 0, 0, 0, 1, 1,
-0.3857317, 0.5630671, -0.1907591, 0, 0, 0, 1, 1,
-0.3855484, -2.194029, -3.527333, 0, 0, 0, 1, 1,
-0.3853647, -0.1880802, -2.282268, 0, 0, 0, 1, 1,
-0.3837725, 0.02353836, -1.986808, 0, 0, 0, 1, 1,
-0.3837481, 1.441346, -1.041348, 0, 0, 0, 1, 1,
-0.3836651, 0.2937638, -0.6005058, 1, 1, 1, 1, 1,
-0.372228, 0.3019166, -1.37618, 1, 1, 1, 1, 1,
-0.3669096, 0.7445964, -0.449595, 1, 1, 1, 1, 1,
-0.3666493, -1.269328, -3.451788, 1, 1, 1, 1, 1,
-0.3637621, 1.307581, -1.524534, 1, 1, 1, 1, 1,
-0.3632163, 0.4873417, -1.383748, 1, 1, 1, 1, 1,
-0.362999, -0.3099034, -2.125601, 1, 1, 1, 1, 1,
-0.3566814, 0.2499805, -2.22924, 1, 1, 1, 1, 1,
-0.3549882, -0.1180986, -2.87357, 1, 1, 1, 1, 1,
-0.3548194, 0.1921146, 0.02371163, 1, 1, 1, 1, 1,
-0.3526373, -0.6107422, -2.6133, 1, 1, 1, 1, 1,
-0.3499396, -1.141242, -2.405674, 1, 1, 1, 1, 1,
-0.3489824, -0.3507871, -2.14056, 1, 1, 1, 1, 1,
-0.3483954, -1.306895, -1.536261, 1, 1, 1, 1, 1,
-0.3481597, -0.8626418, -2.306775, 1, 1, 1, 1, 1,
-0.3474529, 1.238376, -1.584835, 0, 0, 1, 1, 1,
-0.347353, -0.7745097, -2.933125, 1, 0, 0, 1, 1,
-0.3466157, 1.284483, -0.1794757, 1, 0, 0, 1, 1,
-0.3447554, -0.4123862, -1.514348, 1, 0, 0, 1, 1,
-0.3422725, 0.1805036, -0.7233561, 1, 0, 0, 1, 1,
-0.3388318, 0.6809606, -0.1399126, 1, 0, 0, 1, 1,
-0.3364713, 0.554875, -0.9524533, 0, 0, 0, 1, 1,
-0.3345037, -2.178262, -2.975588, 0, 0, 0, 1, 1,
-0.3332403, -0.7266909, -3.240292, 0, 0, 0, 1, 1,
-0.3328201, 1.148859, -1.05721, 0, 0, 0, 1, 1,
-0.3324904, 1.732638, 0.7441707, 0, 0, 0, 1, 1,
-0.3281445, -0.1979795, -2.2069, 0, 0, 0, 1, 1,
-0.3280681, 0.7145885, -0.2695983, 0, 0, 0, 1, 1,
-0.3132169, -0.2523457, -2.63695, 1, 1, 1, 1, 1,
-0.3118, -0.5504904, -2.827382, 1, 1, 1, 1, 1,
-0.3089228, -1.199842, -2.093098, 1, 1, 1, 1, 1,
-0.3039179, -0.5152999, -2.542356, 1, 1, 1, 1, 1,
-0.2968059, 0.9243549, 1.491114, 1, 1, 1, 1, 1,
-0.2966717, 0.6641058, 0.2632236, 1, 1, 1, 1, 1,
-0.2941889, -1.208163, -2.9913, 1, 1, 1, 1, 1,
-0.2933204, -0.5740144, -1.214179, 1, 1, 1, 1, 1,
-0.2925088, -1.321489, -2.728766, 1, 1, 1, 1, 1,
-0.2921568, -0.7033024, -3.412836, 1, 1, 1, 1, 1,
-0.2909719, -0.900746, -1.468021, 1, 1, 1, 1, 1,
-0.290598, -1.330966, -3.816343, 1, 1, 1, 1, 1,
-0.2882523, -0.5590441, -2.098057, 1, 1, 1, 1, 1,
-0.2863967, 0.722569, -0.8695596, 1, 1, 1, 1, 1,
-0.2829815, -0.1955024, -2.689194, 1, 1, 1, 1, 1,
-0.2789448, -0.3861024, -2.903798, 0, 0, 1, 1, 1,
-0.2763403, -1.029879, -2.866808, 1, 0, 0, 1, 1,
-0.2761847, -0.766963, -4.216457, 1, 0, 0, 1, 1,
-0.2717587, 1.745676, 0.7990129, 1, 0, 0, 1, 1,
-0.2609302, -0.4077653, -2.288441, 1, 0, 0, 1, 1,
-0.2604086, 0.8086061, -1.592632, 1, 0, 0, 1, 1,
-0.2591905, -0.3964056, -2.957442, 0, 0, 0, 1, 1,
-0.2586292, -1.56484, -4.586828, 0, 0, 0, 1, 1,
-0.2565315, 0.160957, -1.238804, 0, 0, 0, 1, 1,
-0.2554305, -1.22787, -2.002801, 0, 0, 0, 1, 1,
-0.2548608, 0.6097031, -0.3356163, 0, 0, 0, 1, 1,
-0.2541257, 0.6959655, 0.6381261, 0, 0, 0, 1, 1,
-0.2527165, 0.2435068, 0.9760891, 0, 0, 0, 1, 1,
-0.2518934, -0.2311592, -2.904077, 1, 1, 1, 1, 1,
-0.2483369, 0.3253078, -0.7382506, 1, 1, 1, 1, 1,
-0.2469166, 0.6248097, -0.7011805, 1, 1, 1, 1, 1,
-0.2460729, 1.69672, -0.3306407, 1, 1, 1, 1, 1,
-0.2413823, 0.745026, -0.192003, 1, 1, 1, 1, 1,
-0.2409516, -1.589303, -3.085819, 1, 1, 1, 1, 1,
-0.2390462, 1.351442, 0.1490601, 1, 1, 1, 1, 1,
-0.2383132, -0.2720065, -0.9218906, 1, 1, 1, 1, 1,
-0.2364459, -1.949785, -3.053564, 1, 1, 1, 1, 1,
-0.2342721, 0.8821774, -0.9372456, 1, 1, 1, 1, 1,
-0.2338347, 0.9611568, 0.8343495, 1, 1, 1, 1, 1,
-0.2301536, -0.6054742, -3.104154, 1, 1, 1, 1, 1,
-0.2300306, -0.8954962, -3.647859, 1, 1, 1, 1, 1,
-0.2252245, -0.5726036, -3.229918, 1, 1, 1, 1, 1,
-0.2233291, -0.1879434, -1.368097, 1, 1, 1, 1, 1,
-0.2159571, -0.2876999, -1.785447, 0, 0, 1, 1, 1,
-0.2128658, -1.331382, -3.95377, 1, 0, 0, 1, 1,
-0.2112827, -0.7010529, -1.989082, 1, 0, 0, 1, 1,
-0.2050538, -1.416129, -3.632264, 1, 0, 0, 1, 1,
-0.2040777, 1.337645, 1.327666, 1, 0, 0, 1, 1,
-0.1992745, -0.02092075, -0.3739823, 1, 0, 0, 1, 1,
-0.1980857, -0.1699796, -1.326802, 0, 0, 0, 1, 1,
-0.1971508, 2.474667, 1.698813, 0, 0, 0, 1, 1,
-0.1910492, -0.2493463, -0.8576274, 0, 0, 0, 1, 1,
-0.190765, 1.153499, 1.882099, 0, 0, 0, 1, 1,
-0.1906755, 0.114279, -0.1449625, 0, 0, 0, 1, 1,
-0.1894272, 0.5633807, 0.05869087, 0, 0, 0, 1, 1,
-0.1874614, -0.8334139, -1.079055, 0, 0, 0, 1, 1,
-0.184203, 0.3603056, -0.4739546, 1, 1, 1, 1, 1,
-0.1839006, 2.209506, 0.2449802, 1, 1, 1, 1, 1,
-0.1836052, -1.062245, -3.572744, 1, 1, 1, 1, 1,
-0.1804733, 1.420808, -0.8586702, 1, 1, 1, 1, 1,
-0.1801236, 1.187055, -0.9932921, 1, 1, 1, 1, 1,
-0.1789559, -0.6288851, -3.253933, 1, 1, 1, 1, 1,
-0.1736496, 0.8999894, 1.176844, 1, 1, 1, 1, 1,
-0.1718129, 0.7995728, -0.2758423, 1, 1, 1, 1, 1,
-0.1683713, 0.4650242, 0.1878717, 1, 1, 1, 1, 1,
-0.1612701, 0.3551992, -1.179226, 1, 1, 1, 1, 1,
-0.1610972, -0.7996148, -2.361583, 1, 1, 1, 1, 1,
-0.1609334, 0.7106903, 0.401885, 1, 1, 1, 1, 1,
-0.1602358, 1.208935, 1.428895, 1, 1, 1, 1, 1,
-0.1497341, -2.753115, -1.413634, 1, 1, 1, 1, 1,
-0.147507, -1.071094, -4.46843, 1, 1, 1, 1, 1,
-0.1474768, -0.310239, -1.313908, 0, 0, 1, 1, 1,
-0.1472211, -1.64489, -4.518167, 1, 0, 0, 1, 1,
-0.1468831, -0.2465178, -4.194064, 1, 0, 0, 1, 1,
-0.1459053, 1.368218, -0.1399504, 1, 0, 0, 1, 1,
-0.1427635, 0.985944, 1.993774, 1, 0, 0, 1, 1,
-0.140234, 0.1005268, -1.051326, 1, 0, 0, 1, 1,
-0.1349893, 0.0348921, -0.1691425, 0, 0, 0, 1, 1,
-0.128756, 1.491328, 0.469942, 0, 0, 0, 1, 1,
-0.128576, 0.764148, 0.3733287, 0, 0, 0, 1, 1,
-0.1267881, 0.2098196, -0.9077696, 0, 0, 0, 1, 1,
-0.1262774, 1.929007, 1.062208, 0, 0, 0, 1, 1,
-0.1245198, 0.5699737, -1.000798, 0, 0, 0, 1, 1,
-0.123919, -0.7210444, -4.258545, 0, 0, 0, 1, 1,
-0.118163, 0.953469, -0.8994668, 1, 1, 1, 1, 1,
-0.1161916, 0.5341988, -0.07547348, 1, 1, 1, 1, 1,
-0.115393, -1.57533, -4.106106, 1, 1, 1, 1, 1,
-0.1138056, -2.179628, -4.300363, 1, 1, 1, 1, 1,
-0.1121535, 1.32618, 0.2794193, 1, 1, 1, 1, 1,
-0.103513, -0.08550479, -3.094871, 1, 1, 1, 1, 1,
-0.1024307, 0.03097275, -0.1817612, 1, 1, 1, 1, 1,
-0.09458216, 0.7078688, -0.6008813, 1, 1, 1, 1, 1,
-0.09354975, -3.006155, -3.221751, 1, 1, 1, 1, 1,
-0.09288124, 1.600961, -0.31894, 1, 1, 1, 1, 1,
-0.0860156, -2.332343, -2.986477, 1, 1, 1, 1, 1,
-0.08490495, -0.281645, -2.998629, 1, 1, 1, 1, 1,
-0.08240625, 0.4964452, 0.08369208, 1, 1, 1, 1, 1,
-0.08168039, -2.021015, -3.361801, 1, 1, 1, 1, 1,
-0.07994132, -0.03785498, -2.574224, 1, 1, 1, 1, 1,
-0.07755939, 1.342076, 0.5980508, 0, 0, 1, 1, 1,
-0.07612495, 1.006625, 0.6868882, 1, 0, 0, 1, 1,
-0.07497001, -2.150203, -0.8561816, 1, 0, 0, 1, 1,
-0.07476065, 0.2318687, -0.4104168, 1, 0, 0, 1, 1,
-0.07449622, -0.9929363, -4.587804, 1, 0, 0, 1, 1,
-0.07269858, 1.395241, 0.5737869, 1, 0, 0, 1, 1,
-0.06844683, 1.351389, -1.606009, 0, 0, 0, 1, 1,
-0.06202858, -0.6922009, -3.197444, 0, 0, 0, 1, 1,
-0.06099024, -0.6174431, -3.194837, 0, 0, 0, 1, 1,
-0.05770317, 0.119154, -0.329869, 0, 0, 0, 1, 1,
-0.05566069, 0.7534719, 0.647178, 0, 0, 0, 1, 1,
-0.05361307, -0.4554124, -1.828867, 0, 0, 0, 1, 1,
-0.05282453, 0.5038615, 0.7567357, 0, 0, 0, 1, 1,
-0.0515692, 1.139896, -0.353256, 1, 1, 1, 1, 1,
-0.05144962, 0.5264, -0.03890381, 1, 1, 1, 1, 1,
-0.05138677, -0.1154721, -1.614725, 1, 1, 1, 1, 1,
-0.05075556, 0.6437609, 0.1364792, 1, 1, 1, 1, 1,
-0.0434435, -0.2718029, -4.425239, 1, 1, 1, 1, 1,
-0.04241721, -0.6690623, -3.138113, 1, 1, 1, 1, 1,
-0.0366759, -0.2489022, -2.200808, 1, 1, 1, 1, 1,
-0.02951165, -1.297036, -3.881898, 1, 1, 1, 1, 1,
-0.02801267, 0.1921516, 1.18768, 1, 1, 1, 1, 1,
-0.02722893, 1.03554, 0.3696692, 1, 1, 1, 1, 1,
-0.02331271, 0.0488544, 0.06067757, 1, 1, 1, 1, 1,
-0.02323186, 0.643773, -1.290841, 1, 1, 1, 1, 1,
-0.02289145, -1.359287, -3.136713, 1, 1, 1, 1, 1,
-0.01929748, -0.6484353, -4.096571, 1, 1, 1, 1, 1,
-0.01652253, -0.5233082, -2.509513, 1, 1, 1, 1, 1,
-0.01273986, -0.02249178, -1.015313, 0, 0, 1, 1, 1,
-0.01144351, 0.797511, -0.3411251, 1, 0, 0, 1, 1,
-0.008408955, -0.4800482, -3.708973, 1, 0, 0, 1, 1,
-0.004627165, 1.30211, 0.7201446, 1, 0, 0, 1, 1,
-0.004580942, -0.1080016, -3.368795, 1, 0, 0, 1, 1,
-0.002005036, -0.9720591, -2.469434, 1, 0, 0, 1, 1,
0.0002768753, -0.1909705, 3.097165, 0, 0, 0, 1, 1,
0.0007056228, -1.16306, 1.950001, 0, 0, 0, 1, 1,
0.002703641, -0.9114831, 1.977188, 0, 0, 0, 1, 1,
0.003576112, 1.147741, 0.5856233, 0, 0, 0, 1, 1,
0.005372556, -0.4061893, 3.048433, 0, 0, 0, 1, 1,
0.008749929, 0.8279689, -1.064307, 0, 0, 0, 1, 1,
0.009557137, -0.585314, 3.283449, 0, 0, 0, 1, 1,
0.01083827, -0.8757049, 3.373596, 1, 1, 1, 1, 1,
0.01433796, 1.091444, 0.497157, 1, 1, 1, 1, 1,
0.01548936, -1.865296, 3.510775, 1, 1, 1, 1, 1,
0.02570518, -1.508183, 3.736171, 1, 1, 1, 1, 1,
0.02696813, 0.5106956, 0.272042, 1, 1, 1, 1, 1,
0.02932448, 1.849424, 1.690216, 1, 1, 1, 1, 1,
0.02980616, -1.910245, 4.306318, 1, 1, 1, 1, 1,
0.03297732, 0.2861527, 1.173327, 1, 1, 1, 1, 1,
0.03885736, -0.3143976, 2.127359, 1, 1, 1, 1, 1,
0.03894912, -0.466272, 3.426049, 1, 1, 1, 1, 1,
0.04824224, 0.3326746, 0.9573141, 1, 1, 1, 1, 1,
0.05104574, 0.3630126, -1.200975, 1, 1, 1, 1, 1,
0.05252767, -0.4026585, 2.676855, 1, 1, 1, 1, 1,
0.05417582, -0.4849417, 3.670059, 1, 1, 1, 1, 1,
0.05544701, 0.06626155, 1.735026, 1, 1, 1, 1, 1,
0.06013319, -0.4937588, 3.435553, 0, 0, 1, 1, 1,
0.06130417, 0.02924323, 1.54416, 1, 0, 0, 1, 1,
0.06353521, 0.3258331, -1.610614, 1, 0, 0, 1, 1,
0.06409867, 0.187163, -0.6956691, 1, 0, 0, 1, 1,
0.06542891, -0.4737039, 2.214969, 1, 0, 0, 1, 1,
0.06573623, 1.846116, -0.1217324, 1, 0, 0, 1, 1,
0.0712752, 1.066714, -0.5006431, 0, 0, 0, 1, 1,
0.07192319, 1.383287, 0.3641446, 0, 0, 0, 1, 1,
0.07225868, 0.07672066, 0.8797159, 0, 0, 0, 1, 1,
0.07850757, 0.1618029, 0.9068401, 0, 0, 0, 1, 1,
0.08438492, -0.9804488, 5.629405, 0, 0, 0, 1, 1,
0.0851833, -0.4409129, 2.894252, 0, 0, 0, 1, 1,
0.0918164, 0.8288758, 1.296424, 0, 0, 0, 1, 1,
0.0952573, 0.9776158, 0.1818108, 1, 1, 1, 1, 1,
0.09719838, -0.7047015, 5.002094, 1, 1, 1, 1, 1,
0.1015643, -1.211499, 3.017222, 1, 1, 1, 1, 1,
0.1034709, 1.100772, 1.095758, 1, 1, 1, 1, 1,
0.1073376, -1.527394, 4.271682, 1, 1, 1, 1, 1,
0.1082532, -0.07004863, 3.296124, 1, 1, 1, 1, 1,
0.1088039, -1.784886, 2.304513, 1, 1, 1, 1, 1,
0.1123982, 1.045144, 1.186459, 1, 1, 1, 1, 1,
0.1128027, -1.049636, 2.739431, 1, 1, 1, 1, 1,
0.1155528, 0.1520283, 1.109066, 1, 1, 1, 1, 1,
0.1184966, -0.7711949, 1.686319, 1, 1, 1, 1, 1,
0.1234268, 0.04123977, 3.270629, 1, 1, 1, 1, 1,
0.1260909, 0.2254072, -0.6649002, 1, 1, 1, 1, 1,
0.127895, 0.683938, 0.5945922, 1, 1, 1, 1, 1,
0.1282985, 1.39776, -1.924371, 1, 1, 1, 1, 1,
0.1295704, 0.97133, -1.337628, 0, 0, 1, 1, 1,
0.1316808, 0.3888396, -0.05071122, 1, 0, 0, 1, 1,
0.1328496, 1.132761, 2.576369, 1, 0, 0, 1, 1,
0.1330673, 0.4599105, 1.730465, 1, 0, 0, 1, 1,
0.1334097, 0.8373928, -0.7744625, 1, 0, 0, 1, 1,
0.1461838, -0.3006643, 2.860282, 1, 0, 0, 1, 1,
0.1462489, 1.140133, -1.710904, 0, 0, 0, 1, 1,
0.150198, -1.876918, 2.657335, 0, 0, 0, 1, 1,
0.1510035, 1.902219, 0.0143641, 0, 0, 0, 1, 1,
0.1516529, 0.6327986, 0.07213996, 0, 0, 0, 1, 1,
0.1520219, 0.9059572, -0.1438911, 0, 0, 0, 1, 1,
0.1530938, 0.1880365, 0.950471, 0, 0, 0, 1, 1,
0.1533719, -1.41861, 3.244677, 0, 0, 0, 1, 1,
0.153533, 0.759565, -0.5011094, 1, 1, 1, 1, 1,
0.1640286, -1.095612, 4.496031, 1, 1, 1, 1, 1,
0.1666943, -0.3567199, 0.6531031, 1, 1, 1, 1, 1,
0.1686782, -0.4519629, 1.833936, 1, 1, 1, 1, 1,
0.1752046, -0.4205438, 2.849578, 1, 1, 1, 1, 1,
0.1760576, 2.803173, -0.705828, 1, 1, 1, 1, 1,
0.1765734, -1.75529, 3.875512, 1, 1, 1, 1, 1,
0.1776484, -0.4711649, 3.217231, 1, 1, 1, 1, 1,
0.1839135, -0.2068935, 1.458772, 1, 1, 1, 1, 1,
0.1873355, -0.01572534, 4.036094, 1, 1, 1, 1, 1,
0.1897369, -0.3124472, 3.255775, 1, 1, 1, 1, 1,
0.1900218, 2.143704, -0.6368011, 1, 1, 1, 1, 1,
0.1916078, -1.265023, 2.78874, 1, 1, 1, 1, 1,
0.1930951, -0.001067037, 1.254916, 1, 1, 1, 1, 1,
0.2045156, 0.7738506, -1.432748, 1, 1, 1, 1, 1,
0.2090611, 1.421966, -0.2983875, 0, 0, 1, 1, 1,
0.2091056, -1.981074, 0.9033813, 1, 0, 0, 1, 1,
0.2106923, -0.5670655, 2.822417, 1, 0, 0, 1, 1,
0.2164658, -0.8364337, 2.360976, 1, 0, 0, 1, 1,
0.2193139, -0.9965089, 3.133503, 1, 0, 0, 1, 1,
0.2226163, 1.16283, -0.3904124, 1, 0, 0, 1, 1,
0.226518, 0.5729692, -0.7194462, 0, 0, 0, 1, 1,
0.2276252, -0.7844235, 2.856213, 0, 0, 0, 1, 1,
0.2381043, -0.6115941, 3.173106, 0, 0, 0, 1, 1,
0.2446291, 1.880261, -0.918611, 0, 0, 0, 1, 1,
0.2450317, -1.213217, 3.28805, 0, 0, 0, 1, 1,
0.2483533, 0.8050749, -0.4768331, 0, 0, 0, 1, 1,
0.2506022, 0.05626703, 0.407011, 0, 0, 0, 1, 1,
0.2526473, 0.1056748, 2.057043, 1, 1, 1, 1, 1,
0.2548097, 1.114046, -1.427607, 1, 1, 1, 1, 1,
0.255265, 0.989557, -0.9074351, 1, 1, 1, 1, 1,
0.2583319, 0.6557871, 0.2158635, 1, 1, 1, 1, 1,
0.2584982, -0.4814247, 1.748792, 1, 1, 1, 1, 1,
0.2592431, -0.4730214, 2.279058, 1, 1, 1, 1, 1,
0.2598766, -0.8072098, 5.499292, 1, 1, 1, 1, 1,
0.2600888, 1.091996, 0.6281841, 1, 1, 1, 1, 1,
0.2695328, -0.4269235, 2.768016, 1, 1, 1, 1, 1,
0.2704245, 0.7139506, 0.7038354, 1, 1, 1, 1, 1,
0.2710938, 1.70303, -0.043277, 1, 1, 1, 1, 1,
0.2736991, -0.499551, 0.6656147, 1, 1, 1, 1, 1,
0.2752902, -0.491361, 3.75727, 1, 1, 1, 1, 1,
0.2876861, 1.228683, 2.019325, 1, 1, 1, 1, 1,
0.2896342, 0.5189682, -0.01473855, 1, 1, 1, 1, 1,
0.2938248, -0.07549947, 0.6422074, 0, 0, 1, 1, 1,
0.3002406, 0.2669051, 0.8505358, 1, 0, 0, 1, 1,
0.3091117, -0.1774238, 2.763848, 1, 0, 0, 1, 1,
0.3104275, -0.1169116, 1.790367, 1, 0, 0, 1, 1,
0.321366, 1.125573, -0.5724466, 1, 0, 0, 1, 1,
0.323047, -0.8248051, 2.44218, 1, 0, 0, 1, 1,
0.3239146, 1.250136, -1.424004, 0, 0, 0, 1, 1,
0.3264646, -0.5655833, 3.086029, 0, 0, 0, 1, 1,
0.3285818, 0.4144497, 0.9412339, 0, 0, 0, 1, 1,
0.3293153, 0.5058663, -1.055897, 0, 0, 0, 1, 1,
0.3309377, 1.297381, 0.04789756, 0, 0, 0, 1, 1,
0.3333435, -0.4735379, 3.456385, 0, 0, 0, 1, 1,
0.3338906, 0.7478694, 1.808748, 0, 0, 0, 1, 1,
0.3368206, 1.187086, -1.009175, 1, 1, 1, 1, 1,
0.3448116, -1.7403, 1.322256, 1, 1, 1, 1, 1,
0.3448386, 0.496067, 0.1588369, 1, 1, 1, 1, 1,
0.3474279, 0.6114864, 0.4604853, 1, 1, 1, 1, 1,
0.3484704, -0.3765967, 1.586612, 1, 1, 1, 1, 1,
0.348633, -0.0171882, 1.968714, 1, 1, 1, 1, 1,
0.3571776, -0.8292867, 3.347937, 1, 1, 1, 1, 1,
0.3617451, 1.341435, 1.320115, 1, 1, 1, 1, 1,
0.3636108, -0.4461013, 3.102913, 1, 1, 1, 1, 1,
0.3647972, 0.2512976, 0.2938339, 1, 1, 1, 1, 1,
0.3674618, 0.6906864, 0.7319796, 1, 1, 1, 1, 1,
0.3678951, 0.1352258, -0.3520954, 1, 1, 1, 1, 1,
0.3699223, -1.076394, 2.63114, 1, 1, 1, 1, 1,
0.3700121, 1.228984, 2.015276, 1, 1, 1, 1, 1,
0.370461, 0.1488484, -0.1219411, 1, 1, 1, 1, 1,
0.373432, 0.1524783, 0.9524606, 0, 0, 1, 1, 1,
0.3745244, 0.3562157, -0.4840448, 1, 0, 0, 1, 1,
0.3761799, -0.4648761, 2.665811, 1, 0, 0, 1, 1,
0.3776024, -1.042252, 2.823024, 1, 0, 0, 1, 1,
0.3781421, 0.2101865, 0.1428938, 1, 0, 0, 1, 1,
0.3823724, -1.307929, 3.813811, 1, 0, 0, 1, 1,
0.383388, 0.4579408, -1.009982, 0, 0, 0, 1, 1,
0.3839806, -0.09208721, 3.755063, 0, 0, 0, 1, 1,
0.3886172, -1.644418, 2.311583, 0, 0, 0, 1, 1,
0.3944577, 0.1507774, -0.2375334, 0, 0, 0, 1, 1,
0.3980819, -0.3757961, 2.975099, 0, 0, 0, 1, 1,
0.3982492, -0.3308058, 3.697792, 0, 0, 0, 1, 1,
0.3993523, -0.4139419, 3.16371, 0, 0, 0, 1, 1,
0.4009893, 0.2454672, 0.9118943, 1, 1, 1, 1, 1,
0.4071465, 0.7306123, -0.1336591, 1, 1, 1, 1, 1,
0.4075798, -0.394595, 2.649027, 1, 1, 1, 1, 1,
0.4120229, 1.208427, 1.205792, 1, 1, 1, 1, 1,
0.415397, -0.6381983, 3.877614, 1, 1, 1, 1, 1,
0.4270296, 0.3431207, 0.8988226, 1, 1, 1, 1, 1,
0.4289716, -3.521884, 2.116424, 1, 1, 1, 1, 1,
0.4314807, 0.8200653, -0.2810077, 1, 1, 1, 1, 1,
0.4320917, 0.1682327, -1.068644, 1, 1, 1, 1, 1,
0.4361634, 1.770766, 0.5036664, 1, 1, 1, 1, 1,
0.4372885, -0.3051288, 2.942174, 1, 1, 1, 1, 1,
0.4412059, -0.199289, 2.683036, 1, 1, 1, 1, 1,
0.4451803, 0.3129984, 0.5935273, 1, 1, 1, 1, 1,
0.4530233, -1.063025, 2.439949, 1, 1, 1, 1, 1,
0.458159, -1.767498, 2.295797, 1, 1, 1, 1, 1,
0.4585918, 0.6647893, -0.9264696, 0, 0, 1, 1, 1,
0.4618667, -0.6554626, 1.504071, 1, 0, 0, 1, 1,
0.4649104, -1.562375, 3.05325, 1, 0, 0, 1, 1,
0.4711915, -0.4398279, 1.713392, 1, 0, 0, 1, 1,
0.4717733, -1.880128, 3.691128, 1, 0, 0, 1, 1,
0.4733689, 0.1926373, -0.1712833, 1, 0, 0, 1, 1,
0.4746738, -0.1406327, 1.739843, 0, 0, 0, 1, 1,
0.4799768, -0.8518677, 2.192818, 0, 0, 0, 1, 1,
0.4810179, -1.002652, 3.612823, 0, 0, 0, 1, 1,
0.4830095, -0.1877622, 2.526277, 0, 0, 0, 1, 1,
0.4847104, 0.7271456, 1.045647, 0, 0, 0, 1, 1,
0.4875865, 0.641146, 1.735771, 0, 0, 0, 1, 1,
0.4894937, -0.3053511, 2.888006, 0, 0, 0, 1, 1,
0.4941837, 1.157141, -2.429341, 1, 1, 1, 1, 1,
0.4953566, 1.659283, 1.410997, 1, 1, 1, 1, 1,
0.5002823, 0.9072309, 1.25527, 1, 1, 1, 1, 1,
0.5007164, -0.9964514, 3.377756, 1, 1, 1, 1, 1,
0.5038779, 1.303951, 0.6489748, 1, 1, 1, 1, 1,
0.5041205, -0.1550774, 2.102876, 1, 1, 1, 1, 1,
0.5113724, -0.7915719, 0.8833748, 1, 1, 1, 1, 1,
0.5178486, 1.634116, -0.9744184, 1, 1, 1, 1, 1,
0.5259021, 1.012777, 0.1172632, 1, 1, 1, 1, 1,
0.5260385, -0.4110225, 3.65402, 1, 1, 1, 1, 1,
0.526177, -0.6957805, 2.372025, 1, 1, 1, 1, 1,
0.5304658, 2.355972, 0.7190869, 1, 1, 1, 1, 1,
0.5342562, -0.9337065, 2.998988, 1, 1, 1, 1, 1,
0.5354057, 0.2204103, 0.9606958, 1, 1, 1, 1, 1,
0.5429649, -0.07322041, 0.1009455, 1, 1, 1, 1, 1,
0.5433555, -0.4480031, 0.9926413, 0, 0, 1, 1, 1,
0.5436724, -0.9342962, 0.8751088, 1, 0, 0, 1, 1,
0.5468737, -0.1659923, 2.004362, 1, 0, 0, 1, 1,
0.5470908, 0.8293641, -0.1279353, 1, 0, 0, 1, 1,
0.5514802, -0.4301594, 1.993833, 1, 0, 0, 1, 1,
0.5606359, -1.20511, 2.829406, 1, 0, 0, 1, 1,
0.565146, 2.019005, 0.6162298, 0, 0, 0, 1, 1,
0.5656829, -0.006240971, 1.588385, 0, 0, 0, 1, 1,
0.56618, -0.3573021, 2.815161, 0, 0, 0, 1, 1,
0.5718438, 0.6664436, 2.42932, 0, 0, 0, 1, 1,
0.5719014, 0.5388519, 1.556964, 0, 0, 0, 1, 1,
0.5736458, 0.5605336, -0.0917315, 0, 0, 0, 1, 1,
0.5782326, -0.8070607, 1.974085, 0, 0, 0, 1, 1,
0.5792226, -0.7724816, 2.286556, 1, 1, 1, 1, 1,
0.5795336, -1.215816, 4.949514, 1, 1, 1, 1, 1,
0.5810007, 0.8426151, 0.1684401, 1, 1, 1, 1, 1,
0.5825735, -1.935524, 3.976344, 1, 1, 1, 1, 1,
0.5870514, 1.185255, 0.6844665, 1, 1, 1, 1, 1,
0.5883689, 0.1899679, 2.413897, 1, 1, 1, 1, 1,
0.5934892, 2.09941, -0.2918781, 1, 1, 1, 1, 1,
0.5937052, 1.374551, -1.317242, 1, 1, 1, 1, 1,
0.5948015, -0.8931965, 3.494324, 1, 1, 1, 1, 1,
0.5952902, -2.338835, 3.439469, 1, 1, 1, 1, 1,
0.5953404, 0.1623273, -0.2268898, 1, 1, 1, 1, 1,
0.5966232, -0.5611793, 1.186265, 1, 1, 1, 1, 1,
0.6002824, -0.461171, 3.379208, 1, 1, 1, 1, 1,
0.6004236, 0.9408904, -0.08747691, 1, 1, 1, 1, 1,
0.6065509, -0.2219663, 2.722475, 1, 1, 1, 1, 1,
0.608911, -0.6200366, 3.405375, 0, 0, 1, 1, 1,
0.6139178, 1.163534, 1.178962, 1, 0, 0, 1, 1,
0.6187648, -0.6689517, 4.725474, 1, 0, 0, 1, 1,
0.6219966, -1.309021, 0.9454016, 1, 0, 0, 1, 1,
0.6231712, 0.9142603, 0.3441972, 1, 0, 0, 1, 1,
0.6288254, 0.4481482, 0.4059308, 1, 0, 0, 1, 1,
0.6291944, 0.8404009, 0.167151, 0, 0, 0, 1, 1,
0.630254, -0.110624, 2.774286, 0, 0, 0, 1, 1,
0.6376851, -1.238023, 1.371411, 0, 0, 0, 1, 1,
0.6388538, -0.1644609, 1.936434, 0, 0, 0, 1, 1,
0.6399695, -0.5472011, 2.330658, 0, 0, 0, 1, 1,
0.6404691, -1.016872, 2.470162, 0, 0, 0, 1, 1,
0.6427829, -0.3888786, 2.222543, 0, 0, 0, 1, 1,
0.6434234, 0.2364131, 1.314561, 1, 1, 1, 1, 1,
0.6455671, -1.983912, 2.404856, 1, 1, 1, 1, 1,
0.6474057, -0.2105959, 1.063596, 1, 1, 1, 1, 1,
0.6505219, -1.331574, 1.73969, 1, 1, 1, 1, 1,
0.6519112, 1.151745, -1.381842, 1, 1, 1, 1, 1,
0.6555789, -0.007393814, 0.6355965, 1, 1, 1, 1, 1,
0.6606948, 0.3570555, 1.378953, 1, 1, 1, 1, 1,
0.660914, -0.3104312, 0.6903189, 1, 1, 1, 1, 1,
0.6627032, 0.7678456, 1.032062, 1, 1, 1, 1, 1,
0.6696243, 1.343145, 0.535087, 1, 1, 1, 1, 1,
0.6704126, -0.9270943, 2.191923, 1, 1, 1, 1, 1,
0.6718125, -0.9420617, 1.122619, 1, 1, 1, 1, 1,
0.6767034, -0.8477321, 1.936356, 1, 1, 1, 1, 1,
0.6782317, 0.9825435, 1.378312, 1, 1, 1, 1, 1,
0.6796656, -1.786003, 3.425356, 1, 1, 1, 1, 1,
0.6802852, -1.004627, 3.399703, 0, 0, 1, 1, 1,
0.6831768, -0.01275862, 1.764393, 1, 0, 0, 1, 1,
0.6984792, -1.092282, 2.151186, 1, 0, 0, 1, 1,
0.7029809, 1.491961, -0.6785616, 1, 0, 0, 1, 1,
0.7033696, 1.666166, 0.8332645, 1, 0, 0, 1, 1,
0.7060667, 0.07963915, 1.023661, 1, 0, 0, 1, 1,
0.7123243, -0.2745584, 2.623645, 0, 0, 0, 1, 1,
0.7186108, -0.3826913, 1.28413, 0, 0, 0, 1, 1,
0.7232308, 0.5594022, 1.18601, 0, 0, 0, 1, 1,
0.7337543, -0.9301882, 1.533503, 0, 0, 0, 1, 1,
0.7354038, -0.8460879, 2.049106, 0, 0, 0, 1, 1,
0.7366988, -1.074987, 3.372221, 0, 0, 0, 1, 1,
0.7413117, -0.1931505, 1.781044, 0, 0, 0, 1, 1,
0.7415335, 0.743108, 1.657157, 1, 1, 1, 1, 1,
0.7452146, -0.5933798, 2.227982, 1, 1, 1, 1, 1,
0.7455471, 0.6596068, 0.379814, 1, 1, 1, 1, 1,
0.745888, -0.05835226, 1.107704, 1, 1, 1, 1, 1,
0.748885, -0.3600576, 2.332644, 1, 1, 1, 1, 1,
0.74927, 1.457768, -0.4127876, 1, 1, 1, 1, 1,
0.7516968, -0.08364064, 3.260722, 1, 1, 1, 1, 1,
0.7635355, -1.067706, 1.779899, 1, 1, 1, 1, 1,
0.772477, 0.1397332, 0.5374656, 1, 1, 1, 1, 1,
0.7780935, 0.4014013, 1.19073, 1, 1, 1, 1, 1,
0.7820485, -1.457334, -0.07488762, 1, 1, 1, 1, 1,
0.7827488, 0.9297245, 0.9292567, 1, 1, 1, 1, 1,
0.7865353, 1.67182, -1.638291, 1, 1, 1, 1, 1,
0.7877238, -0.3762747, 4.702444, 1, 1, 1, 1, 1,
0.7879801, 1.17378, 1.396159, 1, 1, 1, 1, 1,
0.7944825, 0.4925849, 1.92492, 0, 0, 1, 1, 1,
0.7994465, -0.1774424, 0.5633493, 1, 0, 0, 1, 1,
0.8018931, 0.3271955, 1.048107, 1, 0, 0, 1, 1,
0.8065844, 0.987202, 2.030339, 1, 0, 0, 1, 1,
0.8145018, -0.1492359, 0.9303232, 1, 0, 0, 1, 1,
0.8156803, -0.3822972, 2.269811, 1, 0, 0, 1, 1,
0.8164639, -0.5549206, 1.59622, 0, 0, 0, 1, 1,
0.8176523, 0.268872, -0.2540479, 0, 0, 0, 1, 1,
0.8257133, 0.3334434, 0.5859077, 0, 0, 0, 1, 1,
0.830555, 0.1702107, -0.8638265, 0, 0, 0, 1, 1,
0.8337494, 1.100597, 1.890286, 0, 0, 0, 1, 1,
0.8344666, 1.147839, -0.7096184, 0, 0, 0, 1, 1,
0.8355986, -0.7026174, 1.609901, 0, 0, 0, 1, 1,
0.83623, -0.6307743, 2.398805, 1, 1, 1, 1, 1,
0.8380264, 0.9324189, 0.5101895, 1, 1, 1, 1, 1,
0.8380669, -0.6573142, 2.24788, 1, 1, 1, 1, 1,
0.8450822, -0.7707685, 1.594943, 1, 1, 1, 1, 1,
0.8566903, 0.07634109, -0.02740855, 1, 1, 1, 1, 1,
0.8607406, 1.216861, -0.08160756, 1, 1, 1, 1, 1,
0.8629892, 2.079166, 1.207215, 1, 1, 1, 1, 1,
0.8645979, -0.8719546, 0.5931504, 1, 1, 1, 1, 1,
0.8649084, 1.035023, 0.9037939, 1, 1, 1, 1, 1,
0.8703654, -0.07069058, 0.6908339, 1, 1, 1, 1, 1,
0.8714294, 0.5333499, 0.07937827, 1, 1, 1, 1, 1,
0.8715515, 1.46296, 1.941229, 1, 1, 1, 1, 1,
0.8753289, -2.336262, 1.184342, 1, 1, 1, 1, 1,
0.8769136, 0.1780352, 1.011184, 1, 1, 1, 1, 1,
0.8842708, 0.1625119, 0.5818782, 1, 1, 1, 1, 1,
0.9048315, -0.4728906, 0.190718, 0, 0, 1, 1, 1,
0.9050472, -0.4390403, 2.412324, 1, 0, 0, 1, 1,
0.910515, 0.08182628, 0.6544291, 1, 0, 0, 1, 1,
0.9160509, 1.280804, -0.1607351, 1, 0, 0, 1, 1,
0.9164341, 0.4190923, 1.925112, 1, 0, 0, 1, 1,
0.921554, -1.879857, 2.721354, 1, 0, 0, 1, 1,
0.9255302, -0.4382504, 2.699309, 0, 0, 0, 1, 1,
0.9398866, -0.9355097, 1.787615, 0, 0, 0, 1, 1,
0.9466639, -0.8690792, 3.440485, 0, 0, 0, 1, 1,
0.9484776, -0.8756428, 2.3149, 0, 0, 0, 1, 1,
0.9491469, -0.4857807, 1.820824, 0, 0, 0, 1, 1,
0.9579225, 1.453588, 1.771419, 0, 0, 0, 1, 1,
0.9732698, -0.6926358, 1.608317, 0, 0, 0, 1, 1,
0.98314, 1.140219, -0.08795648, 1, 1, 1, 1, 1,
0.9898196, -0.4727191, 1.144297, 1, 1, 1, 1, 1,
0.9936265, -0.1245456, 0.9913586, 1, 1, 1, 1, 1,
0.9952801, -1.45808, 2.566232, 1, 1, 1, 1, 1,
0.9990498, -0.442162, 2.79516, 1, 1, 1, 1, 1,
1.001996, -0.7753734, 3.068718, 1, 1, 1, 1, 1,
1.004075, 0.7961816, 1.93761, 1, 1, 1, 1, 1,
1.012998, -0.9411498, 3.851406, 1, 1, 1, 1, 1,
1.016929, -1.175585, 2.215878, 1, 1, 1, 1, 1,
1.020948, -0.4876755, 3.788401, 1, 1, 1, 1, 1,
1.023652, -0.7565777, 0.7396291, 1, 1, 1, 1, 1,
1.023836, -0.9416683, 0.5521365, 1, 1, 1, 1, 1,
1.025228, 1.74043, 1.100669, 1, 1, 1, 1, 1,
1.025558, -0.6180376, 2.012309, 1, 1, 1, 1, 1,
1.029463, -1.496705, 2.256915, 1, 1, 1, 1, 1,
1.040981, 0.7993712, 0.3801171, 0, 0, 1, 1, 1,
1.048172, 0.3148253, 1.427, 1, 0, 0, 1, 1,
1.050519, 0.479757, 1.154202, 1, 0, 0, 1, 1,
1.056284, -0.7025906, 0.7506239, 1, 0, 0, 1, 1,
1.05674, 0.008453505, 0.3190666, 1, 0, 0, 1, 1,
1.060164, -0.8510669, 2.131965, 1, 0, 0, 1, 1,
1.066856, -0.4669577, 1.653876, 0, 0, 0, 1, 1,
1.068904, -1.156374, 3.684698, 0, 0, 0, 1, 1,
1.07339, -0.9174738, 4.127598, 0, 0, 0, 1, 1,
1.074195, 1.209513, -0.05849116, 0, 0, 0, 1, 1,
1.077532, 0.1974437, 3.061737, 0, 0, 0, 1, 1,
1.07768, -0.2058081, 0.916429, 0, 0, 0, 1, 1,
1.079931, -0.16575, 0.9889619, 0, 0, 0, 1, 1,
1.0809, 1.913835, -0.6440476, 1, 1, 1, 1, 1,
1.082812, 0.2283935, 1.158313, 1, 1, 1, 1, 1,
1.082899, 0.7097005, 0.5646268, 1, 1, 1, 1, 1,
1.084193, -0.3141763, -1.358582, 1, 1, 1, 1, 1,
1.090797, 1.038245, -1.11798, 1, 1, 1, 1, 1,
1.091745, 0.152788, 0.8081054, 1, 1, 1, 1, 1,
1.093783, 0.01648443, 2.318837, 1, 1, 1, 1, 1,
1.10595, -0.1538758, 0.2685276, 1, 1, 1, 1, 1,
1.119079, -1.466926, 0.9590064, 1, 1, 1, 1, 1,
1.120795, -1.623215, 2.37559, 1, 1, 1, 1, 1,
1.122607, 0.6511881, 1.066053, 1, 1, 1, 1, 1,
1.126856, -0.476317, -0.004650197, 1, 1, 1, 1, 1,
1.128008, 0.1203599, 2.085149, 1, 1, 1, 1, 1,
1.143305, 0.07900428, -0.09133668, 1, 1, 1, 1, 1,
1.14708, -1.769077, 0.9703947, 1, 1, 1, 1, 1,
1.155841, 0.1073944, 2.96328, 0, 0, 1, 1, 1,
1.168496, 0.610122, 2.719122, 1, 0, 0, 1, 1,
1.179045, -0.6091684, 4.174285, 1, 0, 0, 1, 1,
1.179902, -2.022182, 1.696499, 1, 0, 0, 1, 1,
1.182193, -1.041581, 1.241878, 1, 0, 0, 1, 1,
1.19376, -0.09236916, 1.577585, 1, 0, 0, 1, 1,
1.200561, -1.455704, 2.654456, 0, 0, 0, 1, 1,
1.205392, 1.432807, 1.057247, 0, 0, 0, 1, 1,
1.209468, -0.2214124, 1.257338, 0, 0, 0, 1, 1,
1.217251, 2.104181, 0.07689259, 0, 0, 0, 1, 1,
1.21874, 1.292481, 0.2462772, 0, 0, 0, 1, 1,
1.219302, 1.435601, 0.7340561, 0, 0, 0, 1, 1,
1.225681, -1.081503, 2.129745, 0, 0, 0, 1, 1,
1.230958, 0.9671311, 1.311317, 1, 1, 1, 1, 1,
1.236387, -2.410472, 3.211683, 1, 1, 1, 1, 1,
1.23937, -0.9266152, 3.295181, 1, 1, 1, 1, 1,
1.245641, -0.1360439, 1.240079, 1, 1, 1, 1, 1,
1.264188, -1.19273, 0.8821167, 1, 1, 1, 1, 1,
1.266808, -1.599239, 2.829251, 1, 1, 1, 1, 1,
1.272565, 1.147078, 0.2503313, 1, 1, 1, 1, 1,
1.274009, -1.175453, 4.095049, 1, 1, 1, 1, 1,
1.285155, 0.4159648, 2.54775, 1, 1, 1, 1, 1,
1.288015, 0.007093102, 1.944814, 1, 1, 1, 1, 1,
1.289268, 0.2985405, 0.2417423, 1, 1, 1, 1, 1,
1.298389, -0.317787, 2.312051, 1, 1, 1, 1, 1,
1.30144, 1.399783, 0.787736, 1, 1, 1, 1, 1,
1.302362, 1.92531, 1.245352, 1, 1, 1, 1, 1,
1.303614, -0.3867745, 1.047289, 1, 1, 1, 1, 1,
1.308125, -0.2966558, 1.243892, 0, 0, 1, 1, 1,
1.312064, -1.947472, 1.527144, 1, 0, 0, 1, 1,
1.31229, -0.3106039, 2.250561, 1, 0, 0, 1, 1,
1.319226, -1.607742, 1.628843, 1, 0, 0, 1, 1,
1.333516, -0.293696, 1.06241, 1, 0, 0, 1, 1,
1.342909, 0.7477844, 1.284622, 1, 0, 0, 1, 1,
1.346221, 0.04211007, 1.554248, 0, 0, 0, 1, 1,
1.357998, 1.190126, 0.2361356, 0, 0, 0, 1, 1,
1.382396, 0.1318994, 2.072022, 0, 0, 0, 1, 1,
1.385537, 2.292887, 0.8505135, 0, 0, 0, 1, 1,
1.389545, -1.553416, 2.578283, 0, 0, 0, 1, 1,
1.396068, -1.486177, -0.02153275, 0, 0, 0, 1, 1,
1.400689, -0.7784573, -0.0202762, 0, 0, 0, 1, 1,
1.408193, -0.6332746, 2.681284, 1, 1, 1, 1, 1,
1.414235, -0.1268024, 2.421586, 1, 1, 1, 1, 1,
1.41771, 1.30351, 0.6835943, 1, 1, 1, 1, 1,
1.422449, -0.1525082, 3.518558, 1, 1, 1, 1, 1,
1.423048, 1.528507, -0.3546162, 1, 1, 1, 1, 1,
1.448826, -1.103317, 1.406425, 1, 1, 1, 1, 1,
1.457821, 0.7728363, 0.7406599, 1, 1, 1, 1, 1,
1.473529, 1.731734, 1.001665, 1, 1, 1, 1, 1,
1.476818, -0.5975142, 1.376081, 1, 1, 1, 1, 1,
1.487207, 1.888368, -0.3215697, 1, 1, 1, 1, 1,
1.490884, -0.8887112, 2.003273, 1, 1, 1, 1, 1,
1.497896, 0.2141949, 3.964288, 1, 1, 1, 1, 1,
1.50113, -0.2128371, 0.9501356, 1, 1, 1, 1, 1,
1.514247, -0.37614, 2.442736, 1, 1, 1, 1, 1,
1.514483, 0.5369523, 2.336037, 1, 1, 1, 1, 1,
1.518261, -1.047516, 2.55249, 0, 0, 1, 1, 1,
1.521268, -1.352841, 2.256018, 1, 0, 0, 1, 1,
1.521731, 0.7079886, -0.6973357, 1, 0, 0, 1, 1,
1.529203, 0.02254567, 0.8340259, 1, 0, 0, 1, 1,
1.532572, 1.064183, 2.455321, 1, 0, 0, 1, 1,
1.535898, -1.251768, 2.958109, 1, 0, 0, 1, 1,
1.53938, -1.48504, 1.845071, 0, 0, 0, 1, 1,
1.551448, 0.265128, 0.7869835, 0, 0, 0, 1, 1,
1.55317, 0.1677008, 0.8901507, 0, 0, 0, 1, 1,
1.560672, 0.02080044, 1.375301, 0, 0, 0, 1, 1,
1.563086, -1.872126, 2.281103, 0, 0, 0, 1, 1,
1.570737, -1.03945, 3.03107, 0, 0, 0, 1, 1,
1.571824, -1.01671, 2.970947, 0, 0, 0, 1, 1,
1.577744, -2.088836, 2.838975, 1, 1, 1, 1, 1,
1.58261, 0.6460017, 0.189239, 1, 1, 1, 1, 1,
1.599931, 1.128235, 1.011017, 1, 1, 1, 1, 1,
1.620881, 0.8799786, -0.1407113, 1, 1, 1, 1, 1,
1.622864, 0.9180835, -0.474013, 1, 1, 1, 1, 1,
1.632302, 0.4201218, 0.8201788, 1, 1, 1, 1, 1,
1.634972, -0.6238149, 1.480822, 1, 1, 1, 1, 1,
1.641429, -0.8104298, 1.465118, 1, 1, 1, 1, 1,
1.649096, 0.1151539, 3.457831, 1, 1, 1, 1, 1,
1.656002, 1.895046, 0.3831257, 1, 1, 1, 1, 1,
1.660981, 0.8571281, 1.154945, 1, 1, 1, 1, 1,
1.684569, -1.953156, 2.497539, 1, 1, 1, 1, 1,
1.691591, 1.536284, 0.7265125, 1, 1, 1, 1, 1,
1.693617, 0.7781953, 1.475497, 1, 1, 1, 1, 1,
1.694983, -1.510572, 1.085746, 1, 1, 1, 1, 1,
1.71894, -1.20998, 3.296201, 0, 0, 1, 1, 1,
1.724086, -0.8599244, 1.506864, 1, 0, 0, 1, 1,
1.737432, 0.163569, 0.5097963, 1, 0, 0, 1, 1,
1.76548, 0.4229127, 1.688061, 1, 0, 0, 1, 1,
1.778008, 0.6817054, 1.021, 1, 0, 0, 1, 1,
1.780281, -1.421001, 1.787377, 1, 0, 0, 1, 1,
1.79488, 0.76467, 0.7311962, 0, 0, 0, 1, 1,
1.79629, 1.607239, 0.9110888, 0, 0, 0, 1, 1,
1.801048, -0.4113663, 3.741557, 0, 0, 0, 1, 1,
1.801116, -0.8927453, 3.015209, 0, 0, 0, 1, 1,
1.803696, 0.3613529, 2.190589, 0, 0, 0, 1, 1,
1.804644, -0.05123406, 4.156829, 0, 0, 0, 1, 1,
1.821804, -0.06160336, 1.698256, 0, 0, 0, 1, 1,
1.834891, -0.6287133, 1.990608, 1, 1, 1, 1, 1,
1.835241, 0.8096977, 2.5656, 1, 1, 1, 1, 1,
1.839763, -0.1997665, 2.216414, 1, 1, 1, 1, 1,
1.847395, -1.358985, 1.53928, 1, 1, 1, 1, 1,
1.853169, -0.05082041, 1.164894, 1, 1, 1, 1, 1,
1.863476, -0.05941654, 0.57471, 1, 1, 1, 1, 1,
1.866668, 0.2094306, 0.6247565, 1, 1, 1, 1, 1,
1.874544, 1.640813, 1.022958, 1, 1, 1, 1, 1,
1.878692, -0.2711214, 1.077554, 1, 1, 1, 1, 1,
1.884145, 0.6235936, 0.2223929, 1, 1, 1, 1, 1,
1.88708, -0.06302122, 1.324196, 1, 1, 1, 1, 1,
1.900733, 0.8890416, 1.119515, 1, 1, 1, 1, 1,
1.919932, 0.3346877, 1.740874, 1, 1, 1, 1, 1,
1.938213, 1.803961, -0.1082347, 1, 1, 1, 1, 1,
1.947921, -0.08352448, 0.8049573, 1, 1, 1, 1, 1,
1.967804, -0.9833411, 3.781217, 0, 0, 1, 1, 1,
1.969448, 0.4381242, 0.2495975, 1, 0, 0, 1, 1,
1.969773, -1.874959, 1.594353, 1, 0, 0, 1, 1,
2.003861, -1.617442, 1.14405, 1, 0, 0, 1, 1,
2.024981, 1.270446, 1.535498, 1, 0, 0, 1, 1,
2.035513, -0.7150813, 0.4537598, 1, 0, 0, 1, 1,
2.037236, 0.1531096, 1.22996, 0, 0, 0, 1, 1,
2.043101, 1.143779, -0.8522551, 0, 0, 0, 1, 1,
2.062056, 0.1755751, 1.742978, 0, 0, 0, 1, 1,
2.087783, 0.8309124, 2.631278, 0, 0, 0, 1, 1,
2.097757, 0.1519725, 2.921241, 0, 0, 0, 1, 1,
2.105882, 0.1003461, 3.294044, 0, 0, 0, 1, 1,
2.145035, 1.013578, 0.9481922, 0, 0, 0, 1, 1,
2.154907, -0.8586301, 1.122373, 1, 1, 1, 1, 1,
2.168544, 1.086101, 2.095018, 1, 1, 1, 1, 1,
2.263655, 0.5311679, 1.626408, 1, 1, 1, 1, 1,
2.28867, 0.2095376, 1.679659, 1, 1, 1, 1, 1,
2.297068, -0.4211281, 3.843514, 1, 1, 1, 1, 1,
2.56677, 0.3500393, -0.4367054, 1, 1, 1, 1, 1,
2.921962, 0.1255979, 2.475147, 1, 1, 1, 1, 1
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
var radius = 9.487131;
var distance = 33.32315;
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
mvMatrix.translate( 0.3723503, 0.3593557, -0.4151404 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32315);
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
