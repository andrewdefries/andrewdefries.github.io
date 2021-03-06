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
-3.154777, 1.551434, -1.255364, 1, 0, 0, 1,
-2.608982, -2.358193, -3.366934, 1, 0.007843138, 0, 1,
-2.439128, 0.7250316, -0.08937099, 1, 0.01176471, 0, 1,
-2.423781, 0.7248004, -2.933488, 1, 0.01960784, 0, 1,
-2.400577, 0.1420127, -0.07755999, 1, 0.02352941, 0, 1,
-2.363552, 0.05610453, -2.092215, 1, 0.03137255, 0, 1,
-2.362422, 0.155455, -2.285422, 1, 0.03529412, 0, 1,
-2.362079, 0.7930449, -2.748335, 1, 0.04313726, 0, 1,
-2.318698, -0.9317598, -1.942035, 1, 0.04705882, 0, 1,
-2.291203, 0.1586261, -2.828659, 1, 0.05490196, 0, 1,
-2.279452, -0.3808091, -2.250993, 1, 0.05882353, 0, 1,
-2.24687, 0.1277073, -1.520069, 1, 0.06666667, 0, 1,
-2.234264, 0.7065473, -0.5710957, 1, 0.07058824, 0, 1,
-2.224699, 0.9997394, 0.3619768, 1, 0.07843138, 0, 1,
-2.212784, 0.4714732, -1.434365, 1, 0.08235294, 0, 1,
-2.2125, -0.4875503, -2.849987, 1, 0.09019608, 0, 1,
-2.209699, -0.7612809, -1.396127, 1, 0.09411765, 0, 1,
-2.190126, 3.241415, 0.1226399, 1, 0.1019608, 0, 1,
-2.18669, -1.412207, -4.282301, 1, 0.1098039, 0, 1,
-2.109326, 0.9475889, -1.031407, 1, 0.1137255, 0, 1,
-2.093514, -0.3516105, -2.324612, 1, 0.1215686, 0, 1,
-2.074949, 1.411571, -2.051168, 1, 0.1254902, 0, 1,
-2.006732, 1.852046, -0.6169756, 1, 0.1333333, 0, 1,
-1.999299, -0.6891701, -3.03906, 1, 0.1372549, 0, 1,
-1.985859, 0.05038025, -3.375951, 1, 0.145098, 0, 1,
-1.977257, 0.1761622, -0.5940862, 1, 0.1490196, 0, 1,
-1.96769, -0.3441843, -0.1302155, 1, 0.1568628, 0, 1,
-1.963208, 0.1902027, -0.2325556, 1, 0.1607843, 0, 1,
-1.960508, -0.4863747, -1.591373, 1, 0.1686275, 0, 1,
-1.906811, 0.6567632, -3.412013, 1, 0.172549, 0, 1,
-1.901128, 0.5629356, -1.458806, 1, 0.1803922, 0, 1,
-1.897247, -0.4362317, -0.3767128, 1, 0.1843137, 0, 1,
-1.892264, -0.1509339, -3.760478, 1, 0.1921569, 0, 1,
-1.888866, 0.9670192, -0.6430507, 1, 0.1960784, 0, 1,
-1.870885, -1.054839, -3.16968, 1, 0.2039216, 0, 1,
-1.866572, 1.70526, -0.1280467, 1, 0.2117647, 0, 1,
-1.852878, 1.157381, -0.871836, 1, 0.2156863, 0, 1,
-1.845308, 1.443036, -1.949754, 1, 0.2235294, 0, 1,
-1.83733, 1.762707, -0.9415303, 1, 0.227451, 0, 1,
-1.812738, -0.2162468, -2.202424, 1, 0.2352941, 0, 1,
-1.811013, 1.513444, -0.2830227, 1, 0.2392157, 0, 1,
-1.807993, 0.2376275, -0.5460234, 1, 0.2470588, 0, 1,
-1.791819, 0.5611772, -2.217609, 1, 0.2509804, 0, 1,
-1.783346, 0.3707881, -0.3812198, 1, 0.2588235, 0, 1,
-1.763091, -1.047876, -1.436485, 1, 0.2627451, 0, 1,
-1.756183, -0.5616201, -2.227852, 1, 0.2705882, 0, 1,
-1.732034, -0.5459179, -1.657982, 1, 0.2745098, 0, 1,
-1.72616, -0.8452362, -3.68405, 1, 0.282353, 0, 1,
-1.721146, 1.547988, -0.998121, 1, 0.2862745, 0, 1,
-1.712852, 0.1999572, -1.437174, 1, 0.2941177, 0, 1,
-1.704513, -0.5630121, -0.9863141, 1, 0.3019608, 0, 1,
-1.701898, 1.95798, -1.304226, 1, 0.3058824, 0, 1,
-1.701551, 0.5798973, -1.455828, 1, 0.3137255, 0, 1,
-1.679614, 1.138412, -1.579681, 1, 0.3176471, 0, 1,
-1.671748, -0.9870111, -1.08794, 1, 0.3254902, 0, 1,
-1.643824, -0.75249, -0.7774813, 1, 0.3294118, 0, 1,
-1.622786, 1.021145, -1.465688, 1, 0.3372549, 0, 1,
-1.611693, -0.9025389, -2.506774, 1, 0.3411765, 0, 1,
-1.575541, 0.6972166, 0.6804284, 1, 0.3490196, 0, 1,
-1.572787, 1.736461, -1.11824, 1, 0.3529412, 0, 1,
-1.568656, -2.567885, -2.861607, 1, 0.3607843, 0, 1,
-1.558318, 1.124274, -1.429279, 1, 0.3647059, 0, 1,
-1.553034, 1.431962, -2.175385, 1, 0.372549, 0, 1,
-1.549137, -0.1999614, -0.9102935, 1, 0.3764706, 0, 1,
-1.530656, -0.4344899, -1.42769, 1, 0.3843137, 0, 1,
-1.524192, 0.09033465, -0.3998766, 1, 0.3882353, 0, 1,
-1.50391, -0.006404162, -0.127375, 1, 0.3960784, 0, 1,
-1.500703, -0.03036818, 0.1667612, 1, 0.4039216, 0, 1,
-1.49118, 0.318074, -0.9655328, 1, 0.4078431, 0, 1,
-1.482453, 0.6738961, 0.04022536, 1, 0.4156863, 0, 1,
-1.482051, -0.1201656, -1.452573, 1, 0.4196078, 0, 1,
-1.479404, 1.562893, -1.733775, 1, 0.427451, 0, 1,
-1.477076, -0.2226434, -1.130499, 1, 0.4313726, 0, 1,
-1.476408, 1.87812, -0.6219853, 1, 0.4392157, 0, 1,
-1.463595, -0.004972978, -1.713778, 1, 0.4431373, 0, 1,
-1.461844, 0.2521486, -0.1682167, 1, 0.4509804, 0, 1,
-1.460097, -0.179957, -2.095629, 1, 0.454902, 0, 1,
-1.454055, 0.1368032, -2.915086, 1, 0.4627451, 0, 1,
-1.453303, 0.1126546, -1.589879, 1, 0.4666667, 0, 1,
-1.439231, 0.03318513, -2.213349, 1, 0.4745098, 0, 1,
-1.434706, -0.6692979, -3.637037, 1, 0.4784314, 0, 1,
-1.434247, -0.28104, -1.231534, 1, 0.4862745, 0, 1,
-1.432077, -0.3901069, -1.058045, 1, 0.4901961, 0, 1,
-1.430226, -1.354993, -2.447074, 1, 0.4980392, 0, 1,
-1.418123, -0.06439481, -1.370758, 1, 0.5058824, 0, 1,
-1.412252, 2.235313, -0.8006226, 1, 0.509804, 0, 1,
-1.40481, 0.2104125, -1.762742, 1, 0.5176471, 0, 1,
-1.398565, 1.436268, 0.1515738, 1, 0.5215687, 0, 1,
-1.397043, 1.388541, -0.7358716, 1, 0.5294118, 0, 1,
-1.396621, 0.4163952, -1.090053, 1, 0.5333334, 0, 1,
-1.392741, 0.604548, -0.6631215, 1, 0.5411765, 0, 1,
-1.382247, -0.7647179, -2.036349, 1, 0.5450981, 0, 1,
-1.380231, -0.04714736, -0.7354281, 1, 0.5529412, 0, 1,
-1.372749, 0.07293005, -2.213162, 1, 0.5568628, 0, 1,
-1.37142, -1.384476, -2.749682, 1, 0.5647059, 0, 1,
-1.363929, -1.109217, -3.295874, 1, 0.5686275, 0, 1,
-1.35954, 1.576263, 0.05433565, 1, 0.5764706, 0, 1,
-1.356008, -0.4730234, -2.448256, 1, 0.5803922, 0, 1,
-1.353394, 0.3113735, -0.2811884, 1, 0.5882353, 0, 1,
-1.350613, 1.255101, 0.1560211, 1, 0.5921569, 0, 1,
-1.335335, 0.08173588, -0.4237176, 1, 0.6, 0, 1,
-1.322483, 1.807699, -1.226951, 1, 0.6078432, 0, 1,
-1.310082, 1.191313, -0.9672623, 1, 0.6117647, 0, 1,
-1.309819, -0.9621686, -3.20326, 1, 0.6196079, 0, 1,
-1.30038, -1.112974, -4.640197, 1, 0.6235294, 0, 1,
-1.288679, -0.7647641, -2.496055, 1, 0.6313726, 0, 1,
-1.288578, 0.8027977, -1.254373, 1, 0.6352941, 0, 1,
-1.288465, -0.07603787, -0.7606353, 1, 0.6431373, 0, 1,
-1.286556, 0.9418681, -0.8425958, 1, 0.6470588, 0, 1,
-1.280105, -1.134145, -1.874202, 1, 0.654902, 0, 1,
-1.279072, 0.3327647, -0.5779026, 1, 0.6588235, 0, 1,
-1.278666, -0.1692931, -3.067727, 1, 0.6666667, 0, 1,
-1.270355, 0.8079374, -1.29032, 1, 0.6705883, 0, 1,
-1.263903, 0.02126448, -1.71693, 1, 0.6784314, 0, 1,
-1.259502, 0.8266003, -1.823373, 1, 0.682353, 0, 1,
-1.255415, -0.1165172, -1.652035, 1, 0.6901961, 0, 1,
-1.242772, -0.7952152, -1.747409, 1, 0.6941177, 0, 1,
-1.231031, -2.125632, -3.565321, 1, 0.7019608, 0, 1,
-1.217835, -1.50701, -1.188367, 1, 0.7098039, 0, 1,
-1.215513, 1.502884, -1.048056, 1, 0.7137255, 0, 1,
-1.212902, -0.8670525, -1.796312, 1, 0.7215686, 0, 1,
-1.202723, 1.030371, -0.9464758, 1, 0.7254902, 0, 1,
-1.177935, 0.8326563, -0.914212, 1, 0.7333333, 0, 1,
-1.176551, 0.9815845, -1.391281, 1, 0.7372549, 0, 1,
-1.172225, 0.2843758, 0.5017968, 1, 0.7450981, 0, 1,
-1.17193, -0.3630375, -1.000491, 1, 0.7490196, 0, 1,
-1.17056, -0.3973599, -2.137299, 1, 0.7568628, 0, 1,
-1.16809, 1.704059, -1.112556, 1, 0.7607843, 0, 1,
-1.166801, 0.1977211, -0.9152189, 1, 0.7686275, 0, 1,
-1.164416, -2.458089, -4.42034, 1, 0.772549, 0, 1,
-1.15913, 1.529093, 0.1497444, 1, 0.7803922, 0, 1,
-1.152214, 1.096232, -0.4073497, 1, 0.7843137, 0, 1,
-1.13929, 1.121109, -1.136912, 1, 0.7921569, 0, 1,
-1.13917, 1.251138, -0.04047785, 1, 0.7960784, 0, 1,
-1.131187, -1.01042, -2.774304, 1, 0.8039216, 0, 1,
-1.124195, -1.212658, -1.787066, 1, 0.8117647, 0, 1,
-1.118385, 1.895949, -0.8483517, 1, 0.8156863, 0, 1,
-1.116231, 0.5668294, -0.008016995, 1, 0.8235294, 0, 1,
-1.115017, 0.1928247, -1.359763, 1, 0.827451, 0, 1,
-1.111504, -0.3802722, -1.42108, 1, 0.8352941, 0, 1,
-1.110112, -0.5755906, -1.614179, 1, 0.8392157, 0, 1,
-1.104737, 0.3068791, -0.3713583, 1, 0.8470588, 0, 1,
-1.098817, -0.253417, -1.37306, 1, 0.8509804, 0, 1,
-1.097772, -0.5195566, -1.813811, 1, 0.8588235, 0, 1,
-1.095201, 1.306555, -0.4033653, 1, 0.8627451, 0, 1,
-1.088265, 1.59998, -3.290378, 1, 0.8705882, 0, 1,
-1.088117, 1.55185, -1.544673, 1, 0.8745098, 0, 1,
-1.074539, -1.014357, -2.054056, 1, 0.8823529, 0, 1,
-1.061445, 0.5925406, 0.6781192, 1, 0.8862745, 0, 1,
-1.059643, 0.5037073, -3.026218, 1, 0.8941177, 0, 1,
-1.055681, -0.04561155, -2.697098, 1, 0.8980392, 0, 1,
-1.052946, 0.09933827, -1.292504, 1, 0.9058824, 0, 1,
-1.042553, -1.841691, -4.655766, 1, 0.9137255, 0, 1,
-1.040926, -0.587619, -2.966662, 1, 0.9176471, 0, 1,
-1.036464, -1.366065, -2.4568, 1, 0.9254902, 0, 1,
-1.035917, -0.7456549, -4.145577, 1, 0.9294118, 0, 1,
-1.035542, -1.513826, -4.796812, 1, 0.9372549, 0, 1,
-1.033882, 0.7942168, -1.311168, 1, 0.9411765, 0, 1,
-1.028305, -0.7385287, -1.922533, 1, 0.9490196, 0, 1,
-1.016626, -0.9126847, -1.282518, 1, 0.9529412, 0, 1,
-1.015582, -0.8453049, -1.648793, 1, 0.9607843, 0, 1,
-1.001988, 1.548861, 0.3000368, 1, 0.9647059, 0, 1,
-0.9968874, -0.7123425, -3.05744, 1, 0.972549, 0, 1,
-0.9940934, 0.285977, -2.543886, 1, 0.9764706, 0, 1,
-0.9940343, 0.5192117, -0.5832655, 1, 0.9843137, 0, 1,
-0.985674, -1.408429, -2.167592, 1, 0.9882353, 0, 1,
-0.984906, 0.8322618, -0.6240146, 1, 0.9960784, 0, 1,
-0.9837239, 1.494083, 1.180825, 0.9960784, 1, 0, 1,
-0.9802445, 0.2956306, -1.005908, 0.9921569, 1, 0, 1,
-0.9767904, 0.1036957, -0.03865809, 0.9843137, 1, 0, 1,
-0.9726286, 2.76122, -0.300229, 0.9803922, 1, 0, 1,
-0.9721553, -1.241083, -1.536666, 0.972549, 1, 0, 1,
-0.9593626, -0.1754481, -1.606617, 0.9686275, 1, 0, 1,
-0.9581964, 0.08225331, -1.938226, 0.9607843, 1, 0, 1,
-0.9566792, 2.440767, -0.9740692, 0.9568627, 1, 0, 1,
-0.9518229, 0.8516639, -2.426098, 0.9490196, 1, 0, 1,
-0.9458787, -1.028462, -3.350616, 0.945098, 1, 0, 1,
-0.9419451, 2.386181, -0.2607119, 0.9372549, 1, 0, 1,
-0.9405556, -0.9036233, -0.7282867, 0.9333333, 1, 0, 1,
-0.9381269, -1.600271, -0.9794996, 0.9254902, 1, 0, 1,
-0.9365187, 0.6863829, -0.4976934, 0.9215686, 1, 0, 1,
-0.9311046, 0.7756122, 0.4345553, 0.9137255, 1, 0, 1,
-0.9237973, 1.22725, -0.4313201, 0.9098039, 1, 0, 1,
-0.9232678, -0.3592137, -2.517519, 0.9019608, 1, 0, 1,
-0.9228442, -2.353878, -3.604714, 0.8941177, 1, 0, 1,
-0.9213297, -1.471655, -2.271024, 0.8901961, 1, 0, 1,
-0.9160618, -1.169606, -0.9724382, 0.8823529, 1, 0, 1,
-0.9110542, -1.40298, -3.263165, 0.8784314, 1, 0, 1,
-0.9088912, 0.2317404, 0.05363389, 0.8705882, 1, 0, 1,
-0.9072377, -0.2572052, -0.4351061, 0.8666667, 1, 0, 1,
-0.9048349, -0.4013289, -0.7542358, 0.8588235, 1, 0, 1,
-0.9024569, -1.373262, -2.700907, 0.854902, 1, 0, 1,
-0.8997577, 0.9152433, -2.423069, 0.8470588, 1, 0, 1,
-0.8887275, -0.1883463, -0.8172234, 0.8431373, 1, 0, 1,
-0.8887151, 1.263963, -1.376372, 0.8352941, 1, 0, 1,
-0.8875267, -0.9966722, -1.761739, 0.8313726, 1, 0, 1,
-0.8873262, 0.9753451, -0.6199027, 0.8235294, 1, 0, 1,
-0.8865018, -0.3052627, 0.4588589, 0.8196079, 1, 0, 1,
-0.8814942, -0.3211464, -3.648782, 0.8117647, 1, 0, 1,
-0.8794497, -0.9674714, -1.146335, 0.8078431, 1, 0, 1,
-0.8751925, -0.4730792, -2.801996, 0.8, 1, 0, 1,
-0.8681344, -1.954791, -3.073964, 0.7921569, 1, 0, 1,
-0.8601992, -0.7875586, -1.22761, 0.7882353, 1, 0, 1,
-0.855585, 1.152401, -0.04226714, 0.7803922, 1, 0, 1,
-0.854101, 1.851204, -2.921768, 0.7764706, 1, 0, 1,
-0.8513648, 0.3525431, -2.512093, 0.7686275, 1, 0, 1,
-0.8362033, -0.05760641, 0.7647762, 0.7647059, 1, 0, 1,
-0.8338455, -2.022092, -3.3617, 0.7568628, 1, 0, 1,
-0.8275381, -1.805455, -3.680091, 0.7529412, 1, 0, 1,
-0.8251104, -0.2458126, -1.397081, 0.7450981, 1, 0, 1,
-0.8245476, 0.6083608, 0.4125114, 0.7411765, 1, 0, 1,
-0.8223699, 0.007989956, -1.190782, 0.7333333, 1, 0, 1,
-0.8139399, -3.505798, -4.207902, 0.7294118, 1, 0, 1,
-0.8054916, -0.7627681, -2.588616, 0.7215686, 1, 0, 1,
-0.8051665, 1.016132, 1.28377, 0.7176471, 1, 0, 1,
-0.8015156, -0.318518, -1.088074, 0.7098039, 1, 0, 1,
-0.7875589, -1.198642, -3.38793, 0.7058824, 1, 0, 1,
-0.7862695, -0.5135489, -1.110025, 0.6980392, 1, 0, 1,
-0.7808279, -0.1719166, -0.9658955, 0.6901961, 1, 0, 1,
-0.772998, 1.02375, -1.998229, 0.6862745, 1, 0, 1,
-0.7702485, -0.7535437, -1.4913, 0.6784314, 1, 0, 1,
-0.7700701, 0.7250211, -0.7535086, 0.6745098, 1, 0, 1,
-0.7666752, 0.04526109, -1.793279, 0.6666667, 1, 0, 1,
-0.7644922, 0.9543424, 0.3228861, 0.6627451, 1, 0, 1,
-0.763097, 1.388494, -0.1539222, 0.654902, 1, 0, 1,
-0.7623422, -0.3567538, -2.011995, 0.6509804, 1, 0, 1,
-0.7616301, -1.558672, -1.672191, 0.6431373, 1, 0, 1,
-0.7601259, -1.065324, -3.089668, 0.6392157, 1, 0, 1,
-0.7557514, -0.5276533, -0.5754329, 0.6313726, 1, 0, 1,
-0.7545179, -0.6640772, -2.676727, 0.627451, 1, 0, 1,
-0.7528498, -0.3485087, -1.806296, 0.6196079, 1, 0, 1,
-0.747959, 0.06260967, -0.2006409, 0.6156863, 1, 0, 1,
-0.7470468, 0.2102546, 0.1009468, 0.6078432, 1, 0, 1,
-0.746388, -0.9691055, -3.343904, 0.6039216, 1, 0, 1,
-0.7407757, 0.1299764, 0.03351565, 0.5960785, 1, 0, 1,
-0.7373756, -1.054051, -0.3998254, 0.5882353, 1, 0, 1,
-0.7331358, -1.310986, -4.704956, 0.5843138, 1, 0, 1,
-0.7296611, 2.931416, 0.9689574, 0.5764706, 1, 0, 1,
-0.7296469, -1.288314, -3.320307, 0.572549, 1, 0, 1,
-0.7295329, 0.5186606, 0.3458841, 0.5647059, 1, 0, 1,
-0.7235605, -0.42389, -2.099919, 0.5607843, 1, 0, 1,
-0.7230828, 0.09106654, -2.414902, 0.5529412, 1, 0, 1,
-0.7198296, -1.234391, -1.64546, 0.5490196, 1, 0, 1,
-0.7196183, -0.9792162, -1.699946, 0.5411765, 1, 0, 1,
-0.7190751, -0.6160875, -3.01504, 0.5372549, 1, 0, 1,
-0.7168468, -0.740954, -1.106491, 0.5294118, 1, 0, 1,
-0.7082072, 0.435147, -5.276281, 0.5254902, 1, 0, 1,
-0.7059339, 0.1574731, -1.005524, 0.5176471, 1, 0, 1,
-0.7046585, 0.1736524, -1.284129, 0.5137255, 1, 0, 1,
-0.7018793, 0.5916716, -1.074753, 0.5058824, 1, 0, 1,
-0.6987472, 3.658327, -0.1729835, 0.5019608, 1, 0, 1,
-0.6986777, 1.75465, 1.19255, 0.4941176, 1, 0, 1,
-0.6982411, 0.6104915, -1.489446, 0.4862745, 1, 0, 1,
-0.6953625, -0.3130372, -2.313611, 0.4823529, 1, 0, 1,
-0.6936505, -0.399219, -1.4413, 0.4745098, 1, 0, 1,
-0.6826649, -0.3754234, -0.8405772, 0.4705882, 1, 0, 1,
-0.678073, 0.9587306, -0.4159291, 0.4627451, 1, 0, 1,
-0.6768643, -2.237475, -3.487328, 0.4588235, 1, 0, 1,
-0.6764019, -0.1401898, -2.526123, 0.4509804, 1, 0, 1,
-0.675841, -0.8012893, -1.322039, 0.4470588, 1, 0, 1,
-0.674991, 0.6910362, -0.1100463, 0.4392157, 1, 0, 1,
-0.6709361, -0.1849422, -2.67949, 0.4352941, 1, 0, 1,
-0.6670294, 0.4639233, -1.077301, 0.427451, 1, 0, 1,
-0.6523301, -0.2736711, -2.358255, 0.4235294, 1, 0, 1,
-0.6489349, -0.5878101, -3.411879, 0.4156863, 1, 0, 1,
-0.6476937, -0.2641902, -3.111258, 0.4117647, 1, 0, 1,
-0.6345924, -0.2682177, -1.371411, 0.4039216, 1, 0, 1,
-0.6305259, 0.458571, -1.162382, 0.3960784, 1, 0, 1,
-0.6274582, -0.4372002, -2.013765, 0.3921569, 1, 0, 1,
-0.6195965, -0.7684236, -4.550917, 0.3843137, 1, 0, 1,
-0.6191237, -1.079906, -5.007561, 0.3803922, 1, 0, 1,
-0.6187819, 0.2787418, -1.523723, 0.372549, 1, 0, 1,
-0.6185035, -0.526766, -2.915986, 0.3686275, 1, 0, 1,
-0.6161898, 0.1140148, -2.26709, 0.3607843, 1, 0, 1,
-0.6069493, 0.4192271, -0.313614, 0.3568628, 1, 0, 1,
-0.6055571, -0.07915949, -2.21403, 0.3490196, 1, 0, 1,
-0.6036608, -1.332036, -3.905607, 0.345098, 1, 0, 1,
-0.603469, 1.023728, -1.672064, 0.3372549, 1, 0, 1,
-0.602367, 0.04789613, -0.8507363, 0.3333333, 1, 0, 1,
-0.6005156, -1.396027, -2.894554, 0.3254902, 1, 0, 1,
-0.5991208, 1.09004, -0.7532888, 0.3215686, 1, 0, 1,
-0.5948017, -0.266555, -2.599241, 0.3137255, 1, 0, 1,
-0.5842745, -0.08102652, -1.354037, 0.3098039, 1, 0, 1,
-0.5832893, -1.196544, -3.016545, 0.3019608, 1, 0, 1,
-0.5799837, 0.1973849, -1.590851, 0.2941177, 1, 0, 1,
-0.5777615, -1.613437, -3.532489, 0.2901961, 1, 0, 1,
-0.5726087, 0.3078931, 0.7812569, 0.282353, 1, 0, 1,
-0.5713104, -0.4559654, -3.865222, 0.2784314, 1, 0, 1,
-0.5678738, -1.429295, -3.50142, 0.2705882, 1, 0, 1,
-0.5638872, 0.1116812, -2.021421, 0.2666667, 1, 0, 1,
-0.5566556, 1.058637, 1.162509, 0.2588235, 1, 0, 1,
-0.5506265, -1.120462, -3.887739, 0.254902, 1, 0, 1,
-0.5455499, -1.253487, -3.512135, 0.2470588, 1, 0, 1,
-0.5435081, 1.40498, -1.03289, 0.2431373, 1, 0, 1,
-0.5414927, 0.6707752, -4.060601, 0.2352941, 1, 0, 1,
-0.5396517, -0.5712091, -4.075183, 0.2313726, 1, 0, 1,
-0.5295349, -0.5797113, -3.34699, 0.2235294, 1, 0, 1,
-0.529165, -0.4195846, -1.52423, 0.2196078, 1, 0, 1,
-0.5197105, -0.8540431, -1.412571, 0.2117647, 1, 0, 1,
-0.5193748, 1.138535, 0.2140295, 0.2078431, 1, 0, 1,
-0.519353, 1.187676, -0.5599127, 0.2, 1, 0, 1,
-0.5174488, -0.3027094, -2.786575, 0.1921569, 1, 0, 1,
-0.5161592, 0.5607983, -0.7924795, 0.1882353, 1, 0, 1,
-0.5156084, -2.380418, -1.957838, 0.1803922, 1, 0, 1,
-0.5134323, -0.2687539, -2.258561, 0.1764706, 1, 0, 1,
-0.5096206, -0.6344393, -1.79143, 0.1686275, 1, 0, 1,
-0.507704, 0.4789686, -1.826344, 0.1647059, 1, 0, 1,
-0.5043461, 1.932179, 0.4244458, 0.1568628, 1, 0, 1,
-0.5022032, 0.2833861, 0.6853247, 0.1529412, 1, 0, 1,
-0.4992695, 1.097023, -0.0009145132, 0.145098, 1, 0, 1,
-0.4978524, -0.6769644, -2.349444, 0.1411765, 1, 0, 1,
-0.4926334, -0.1444886, -0.5031062, 0.1333333, 1, 0, 1,
-0.492108, 0.4746501, -0.7412984, 0.1294118, 1, 0, 1,
-0.4866691, 0.3391384, -0.09787957, 0.1215686, 1, 0, 1,
-0.48398, 0.5771647, 0.007977386, 0.1176471, 1, 0, 1,
-0.482969, 1.120134, 0.7638047, 0.1098039, 1, 0, 1,
-0.4720434, -0.6645003, -4.36548, 0.1058824, 1, 0, 1,
-0.4674392, -0.02363637, 0.04681914, 0.09803922, 1, 0, 1,
-0.4648741, 0.04860754, -1.294415, 0.09019608, 1, 0, 1,
-0.459812, -1.569268, -3.247552, 0.08627451, 1, 0, 1,
-0.4577356, 0.2946562, -1.533263, 0.07843138, 1, 0, 1,
-0.4445763, -0.860038, -3.625824, 0.07450981, 1, 0, 1,
-0.4435958, -0.2057672, -0.4676523, 0.06666667, 1, 0, 1,
-0.4432327, 1.146018, -1.236041, 0.0627451, 1, 0, 1,
-0.4430518, 1.627834, -0.9436405, 0.05490196, 1, 0, 1,
-0.4389561, 0.6008745, -1.154511, 0.05098039, 1, 0, 1,
-0.4389508, 1.829049, 1.38958, 0.04313726, 1, 0, 1,
-0.4341566, -1.403444, -1.509666, 0.03921569, 1, 0, 1,
-0.4316895, 1.512757, -1.530442, 0.03137255, 1, 0, 1,
-0.431135, 2.206729, 0.09211725, 0.02745098, 1, 0, 1,
-0.4299922, 0.7792446, -0.8556799, 0.01960784, 1, 0, 1,
-0.4298691, -0.5420632, -3.125408, 0.01568628, 1, 0, 1,
-0.4285868, -0.4558775, -2.523777, 0.007843138, 1, 0, 1,
-0.4269204, 0.4903663, -2.535513, 0.003921569, 1, 0, 1,
-0.4255697, 1.093967, 0.08877805, 0, 1, 0.003921569, 1,
-0.4253864, -1.214662, -2.444473, 0, 1, 0.01176471, 1,
-0.423427, -0.3975083, -2.061838, 0, 1, 0.01568628, 1,
-0.4230487, 0.8764523, -1.95652, 0, 1, 0.02352941, 1,
-0.4173438, 0.6988145, -1.65497, 0, 1, 0.02745098, 1,
-0.4167801, -0.5783629, -1.637156, 0, 1, 0.03529412, 1,
-0.4144401, 1.378958, -0.0739551, 0, 1, 0.03921569, 1,
-0.4132105, -0.07256331, -1.040023, 0, 1, 0.04705882, 1,
-0.4130473, 0.666985, -0.9294991, 0, 1, 0.05098039, 1,
-0.4088053, 2.008065, -0.4975728, 0, 1, 0.05882353, 1,
-0.4010949, 0.5552352, 0.7354824, 0, 1, 0.0627451, 1,
-0.3997133, 0.5682427, -0.05903601, 0, 1, 0.07058824, 1,
-0.3985798, -0.9099735, -4.283711, 0, 1, 0.07450981, 1,
-0.3881633, -0.4729368, -3.015953, 0, 1, 0.08235294, 1,
-0.3854426, 1.438539, -1.308045, 0, 1, 0.08627451, 1,
-0.3821933, 1.644011, -1.445587, 0, 1, 0.09411765, 1,
-0.3801081, 0.9551989, -1.388308, 0, 1, 0.1019608, 1,
-0.3725656, 1.396875, 0.3823472, 0, 1, 0.1058824, 1,
-0.371651, -0.2457158, -1.909369, 0, 1, 0.1137255, 1,
-0.3712054, -0.3158054, -2.026808, 0, 1, 0.1176471, 1,
-0.362323, -1.390406, -3.926291, 0, 1, 0.1254902, 1,
-0.3512691, 0.1230345, -1.942433, 0, 1, 0.1294118, 1,
-0.3510982, -0.7995962, -1.354803, 0, 1, 0.1372549, 1,
-0.3510615, 0.9870315, 0.3379022, 0, 1, 0.1411765, 1,
-0.3505948, 0.3774291, -0.5769782, 0, 1, 0.1490196, 1,
-0.3478357, -0.9411925, -1.142412, 0, 1, 0.1529412, 1,
-0.3458557, -0.5907207, -3.671315, 0, 1, 0.1607843, 1,
-0.3425231, -0.754287, -4.310853, 0, 1, 0.1647059, 1,
-0.3371498, 1.156117, -0.5747836, 0, 1, 0.172549, 1,
-0.3371431, 1.487505, 0.1462463, 0, 1, 0.1764706, 1,
-0.3359401, -0.02139103, -1.757983, 0, 1, 0.1843137, 1,
-0.335816, 0.7935936, 0.718068, 0, 1, 0.1882353, 1,
-0.3313352, 0.6703981, -1.112356, 0, 1, 0.1960784, 1,
-0.3276038, 0.9348951, -2.372757, 0, 1, 0.2039216, 1,
-0.3214591, 1.135479, 1.749617, 0, 1, 0.2078431, 1,
-0.31501, -1.392109, -1.828674, 0, 1, 0.2156863, 1,
-0.3117602, 1.259014, -0.3347024, 0, 1, 0.2196078, 1,
-0.3116356, -0.1483285, -1.458527, 0, 1, 0.227451, 1,
-0.3110435, 0.03779019, -2.115243, 0, 1, 0.2313726, 1,
-0.2999673, 0.6565617, -2.55918, 0, 1, 0.2392157, 1,
-0.2977852, 0.2424919, -1.651449, 0, 1, 0.2431373, 1,
-0.2908655, 0.2715839, -1.915372, 0, 1, 0.2509804, 1,
-0.2897831, 0.7228245, 1.05172, 0, 1, 0.254902, 1,
-0.2877826, 1.093477, -0.6602883, 0, 1, 0.2627451, 1,
-0.2863869, 0.08245144, 0.5643619, 0, 1, 0.2666667, 1,
-0.2832005, -0.6980839, -3.90662, 0, 1, 0.2745098, 1,
-0.2823108, 0.2445845, -2.556414, 0, 1, 0.2784314, 1,
-0.2803348, -0.9939539, -2.866853, 0, 1, 0.2862745, 1,
-0.2756542, -0.09024058, -0.3347298, 0, 1, 0.2901961, 1,
-0.271595, 0.7285403, -0.6659973, 0, 1, 0.2980392, 1,
-0.2707339, -0.9237111, -4.447652, 0, 1, 0.3058824, 1,
-0.2664191, 0.4749895, -0.5459324, 0, 1, 0.3098039, 1,
-0.2658934, -0.7847924, -4.26942, 0, 1, 0.3176471, 1,
-0.2625472, -1.708716, -5.083296, 0, 1, 0.3215686, 1,
-0.2612202, -1.556226, -2.655669, 0, 1, 0.3294118, 1,
-0.2595867, -0.5423731, -1.321417, 0, 1, 0.3333333, 1,
-0.2549568, 0.0555101, -1.516809, 0, 1, 0.3411765, 1,
-0.2538512, -2.061305, -4.128007, 0, 1, 0.345098, 1,
-0.2488414, -1.836578, -4.01854, 0, 1, 0.3529412, 1,
-0.2470122, -0.7102931, -2.107032, 0, 1, 0.3568628, 1,
-0.2463159, -0.6099034, -1.536945, 0, 1, 0.3647059, 1,
-0.2459355, -0.7147131, -1.251084, 0, 1, 0.3686275, 1,
-0.2454623, -1.214584, -3.121757, 0, 1, 0.3764706, 1,
-0.2441582, -0.07081205, -1.585068, 0, 1, 0.3803922, 1,
-0.2407466, 0.196727, -0.5960864, 0, 1, 0.3882353, 1,
-0.2382942, 0.8925253, -0.8830655, 0, 1, 0.3921569, 1,
-0.2366627, 0.5130896, -2.263249, 0, 1, 0.4, 1,
-0.2364591, -0.0152908, 1.65185, 0, 1, 0.4078431, 1,
-0.2340887, -0.2501153, -2.37625, 0, 1, 0.4117647, 1,
-0.231458, 1.937392, 0.3090765, 0, 1, 0.4196078, 1,
-0.2307988, -0.3256937, -4.05325, 0, 1, 0.4235294, 1,
-0.2291284, -0.1956441, -1.735751, 0, 1, 0.4313726, 1,
-0.2290902, 0.2522981, -0.5439092, 0, 1, 0.4352941, 1,
-0.2287892, 1.424999, 0.9661976, 0, 1, 0.4431373, 1,
-0.2204229, 0.31366, -0.8434758, 0, 1, 0.4470588, 1,
-0.2200581, -1.289871, -2.841566, 0, 1, 0.454902, 1,
-0.219867, -0.9995281, -2.889346, 0, 1, 0.4588235, 1,
-0.2083955, 2.058433, 1.184296, 0, 1, 0.4666667, 1,
-0.2042631, -0.4759788, -2.756821, 0, 1, 0.4705882, 1,
-0.2034489, 1.078546, 0.2029276, 0, 1, 0.4784314, 1,
-0.2013059, -0.1668985, -2.898818, 0, 1, 0.4823529, 1,
-0.1987071, -0.3162482, -1.184425, 0, 1, 0.4901961, 1,
-0.1955302, -0.06417201, -2.880135, 0, 1, 0.4941176, 1,
-0.1910354, -0.1102962, -3.241324, 0, 1, 0.5019608, 1,
-0.1891572, 1.332706, 0.7125152, 0, 1, 0.509804, 1,
-0.1858788, -0.2551024, -2.619393, 0, 1, 0.5137255, 1,
-0.1787296, 2.224233, 0.7550775, 0, 1, 0.5215687, 1,
-0.1770523, -1.85557, -2.808662, 0, 1, 0.5254902, 1,
-0.1748809, 0.003301342, -2.224334, 0, 1, 0.5333334, 1,
-0.1739425, 0.2110729, -0.409916, 0, 1, 0.5372549, 1,
-0.1713494, 0.04180908, -1.875711, 0, 1, 0.5450981, 1,
-0.1678527, 0.7962857, 1.206272, 0, 1, 0.5490196, 1,
-0.1641651, -0.6137255, -4.214416, 0, 1, 0.5568628, 1,
-0.1621426, 0.5876541, -1.618465, 0, 1, 0.5607843, 1,
-0.1547821, -0.1726818, -2.317822, 0, 1, 0.5686275, 1,
-0.1460329, 0.5443467, 0.527841, 0, 1, 0.572549, 1,
-0.1455899, 0.1596552, 0.3681425, 0, 1, 0.5803922, 1,
-0.1390476, -0.02758664, -1.790159, 0, 1, 0.5843138, 1,
-0.1298178, -1.162824, -3.102671, 0, 1, 0.5921569, 1,
-0.127734, -1.896196, -5.660952, 0, 1, 0.5960785, 1,
-0.1275291, -0.1118086, -2.234969, 0, 1, 0.6039216, 1,
-0.1210578, 0.03741565, -1.63228, 0, 1, 0.6117647, 1,
-0.1188741, -0.7383458, -2.014447, 0, 1, 0.6156863, 1,
-0.1183254, 0.8431058, 0.3221303, 0, 1, 0.6235294, 1,
-0.1174299, 0.671703, 0.07156178, 0, 1, 0.627451, 1,
-0.1169842, 0.931143, 0.2806821, 0, 1, 0.6352941, 1,
-0.1112366, 0.3768218, -0.08623484, 0, 1, 0.6392157, 1,
-0.1095811, -0.2885312, -4.575219, 0, 1, 0.6470588, 1,
-0.1082014, -0.003074909, -1.887938, 0, 1, 0.6509804, 1,
-0.1047579, 0.07982428, -2.056254, 0, 1, 0.6588235, 1,
-0.1042558, 0.8630862, -0.3359217, 0, 1, 0.6627451, 1,
-0.1040808, -0.1084202, -3.411465, 0, 1, 0.6705883, 1,
-0.1019824, 0.1829403, -0.2524264, 0, 1, 0.6745098, 1,
-0.09874373, 0.3018368, -0.6277342, 0, 1, 0.682353, 1,
-0.09747697, -2.429252, -3.484711, 0, 1, 0.6862745, 1,
-0.09745879, -0.1852468, -0.4601589, 0, 1, 0.6941177, 1,
-0.0961425, 0.01196346, -1.170503, 0, 1, 0.7019608, 1,
-0.09389134, 1.330414, 0.5716379, 0, 1, 0.7058824, 1,
-0.09386537, 0.7073265, 0.8282473, 0, 1, 0.7137255, 1,
-0.09169123, 0.4861163, 0.3051031, 0, 1, 0.7176471, 1,
-0.08761084, 0.8963531, 0.3598743, 0, 1, 0.7254902, 1,
-0.08720899, 2.283299, 1.193034, 0, 1, 0.7294118, 1,
-0.08242808, 0.03426057, -0.1018373, 0, 1, 0.7372549, 1,
-0.08091272, -0.1603612, -2.493166, 0, 1, 0.7411765, 1,
-0.08042886, 0.8531907, -0.2780176, 0, 1, 0.7490196, 1,
-0.08032643, -0.9647406, -3.647419, 0, 1, 0.7529412, 1,
-0.0751782, 0.435124, 0.6652678, 0, 1, 0.7607843, 1,
-0.06847336, -0.2391178, -3.285435, 0, 1, 0.7647059, 1,
-0.0683351, 0.5915858, 0.1263807, 0, 1, 0.772549, 1,
-0.06555233, 0.646918, 0.07428823, 0, 1, 0.7764706, 1,
-0.0647959, -2.415334, -3.491032, 0, 1, 0.7843137, 1,
-0.06280646, 0.1909396, -0.1258741, 0, 1, 0.7882353, 1,
-0.06158416, -0.365675, -1.708856, 0, 1, 0.7960784, 1,
-0.05821871, 1.586828, 1.111978, 0, 1, 0.8039216, 1,
-0.05804829, -1.166116, -2.650287, 0, 1, 0.8078431, 1,
-0.05408531, -0.8245392, -4.284205, 0, 1, 0.8156863, 1,
-0.05279383, 0.4197683, -0.1515661, 0, 1, 0.8196079, 1,
-0.05010536, 1.326887, -0.1052076, 0, 1, 0.827451, 1,
-0.0497357, 0.7054662, -0.7399279, 0, 1, 0.8313726, 1,
-0.0442816, -0.1967527, -2.806151, 0, 1, 0.8392157, 1,
-0.04315226, -1.110172, -2.433931, 0, 1, 0.8431373, 1,
-0.04099064, -0.7160185, -1.96511, 0, 1, 0.8509804, 1,
-0.04096228, -0.4186642, -4.021108, 0, 1, 0.854902, 1,
-0.04060853, -0.2559573, -4.216817, 0, 1, 0.8627451, 1,
-0.03700885, -0.1773973, -2.443201, 0, 1, 0.8666667, 1,
-0.03290885, 0.3599775, -0.266258, 0, 1, 0.8745098, 1,
-0.0308986, -1.131834, -1.091286, 0, 1, 0.8784314, 1,
-0.02935412, -1.117883, -3.018594, 0, 1, 0.8862745, 1,
-0.02747973, -0.5973561, -2.087249, 0, 1, 0.8901961, 1,
-0.02539706, 0.6170843, 0.4523609, 0, 1, 0.8980392, 1,
-0.02469674, -0.6760732, -4.620155, 0, 1, 0.9058824, 1,
-0.02001354, 0.3425387, -0.2653146, 0, 1, 0.9098039, 1,
-0.01494054, -1.855367, -3.957655, 0, 1, 0.9176471, 1,
-0.01344747, -0.5476084, -2.157644, 0, 1, 0.9215686, 1,
-0.01024602, -0.7081903, -2.263226, 0, 1, 0.9294118, 1,
-0.008880416, -0.2423655, -3.428226, 0, 1, 0.9333333, 1,
-0.008457711, 0.3314049, -0.5101862, 0, 1, 0.9411765, 1,
-0.005715089, 2.705223, -0.5158409, 0, 1, 0.945098, 1,
-0.002604484, 1.550952, -0.4104859, 0, 1, 0.9529412, 1,
-0.001442704, -0.3559656, -3.994891, 0, 1, 0.9568627, 1,
-0.0002526689, -1.325895, -2.273463, 0, 1, 0.9647059, 1,
0.0004722898, -1.017719, 3.515815, 0, 1, 0.9686275, 1,
0.005378209, -0.8490595, 2.58631, 0, 1, 0.9764706, 1,
0.005588502, -1.232808, 2.914607, 0, 1, 0.9803922, 1,
0.006025914, -1.202607, 5.426584, 0, 1, 0.9882353, 1,
0.006787597, 0.4856292, -0.1603247, 0, 1, 0.9921569, 1,
0.00741222, -0.8403173, 3.493393, 0, 1, 1, 1,
0.007699354, -0.5027869, 3.970772, 0, 0.9921569, 1, 1,
0.01107835, -0.6611559, 2.586011, 0, 0.9882353, 1, 1,
0.01564791, -0.2358512, 4.244931, 0, 0.9803922, 1, 1,
0.02768807, -0.8024934, 5.436155, 0, 0.9764706, 1, 1,
0.03025348, 0.763862, 1.746188, 0, 0.9686275, 1, 1,
0.03193422, 0.7452846, 0.3081076, 0, 0.9647059, 1, 1,
0.03205448, 0.5549296, 0.3151902, 0, 0.9568627, 1, 1,
0.033263, 0.6122343, -1.183899, 0, 0.9529412, 1, 1,
0.03732624, 1.759036, 0.71031, 0, 0.945098, 1, 1,
0.04158564, 0.07731915, 0.4350736, 0, 0.9411765, 1, 1,
0.04748861, -2.442308, 3.352695, 0, 0.9333333, 1, 1,
0.04770982, 1.540218, -0.3310458, 0, 0.9294118, 1, 1,
0.04788175, -1.014709, 1.760239, 0, 0.9215686, 1, 1,
0.05132535, -0.2423407, 2.473743, 0, 0.9176471, 1, 1,
0.0523869, -0.316334, 4.337601, 0, 0.9098039, 1, 1,
0.05253165, 0.3984974, 0.308614, 0, 0.9058824, 1, 1,
0.05369097, -0.5960497, 2.326666, 0, 0.8980392, 1, 1,
0.05534796, 0.499968, -0.05448871, 0, 0.8901961, 1, 1,
0.05721259, -0.5678645, 5.739703, 0, 0.8862745, 1, 1,
0.06162165, -0.6931478, 1.514369, 0, 0.8784314, 1, 1,
0.06611364, 0.2773335, 0.02903451, 0, 0.8745098, 1, 1,
0.06703714, -1.367936, 3.212502, 0, 0.8666667, 1, 1,
0.07222105, -1.239103, 4.054071, 0, 0.8627451, 1, 1,
0.07747486, -0.1397974, 4.327365, 0, 0.854902, 1, 1,
0.08571421, -0.1642428, 4.704235, 0, 0.8509804, 1, 1,
0.08581499, -0.1572461, 3.086595, 0, 0.8431373, 1, 1,
0.08694397, -1.615008, 3.10654, 0, 0.8392157, 1, 1,
0.08884716, -1.221189, 2.637904, 0, 0.8313726, 1, 1,
0.09324529, -0.3974725, 2.816131, 0, 0.827451, 1, 1,
0.09559743, 0.5198207, -0.9240049, 0, 0.8196079, 1, 1,
0.09568308, 0.7791481, -0.2496528, 0, 0.8156863, 1, 1,
0.1003081, 0.2031706, -0.4082204, 0, 0.8078431, 1, 1,
0.1006711, 0.5000601, -0.2005262, 0, 0.8039216, 1, 1,
0.1012389, -0.9476109, 3.670314, 0, 0.7960784, 1, 1,
0.101372, 0.4858553, 0.008143186, 0, 0.7882353, 1, 1,
0.1018225, 0.840526, -0.7002436, 0, 0.7843137, 1, 1,
0.1020674, -0.1250524, 1.807247, 0, 0.7764706, 1, 1,
0.1055733, -0.1895474, 1.826283, 0, 0.772549, 1, 1,
0.1060648, -2.409678, 2.731578, 0, 0.7647059, 1, 1,
0.1061735, 0.9317846, -0.6235752, 0, 0.7607843, 1, 1,
0.1067155, -0.7130796, 2.469741, 0, 0.7529412, 1, 1,
0.1073025, 0.4148207, -0.4388966, 0, 0.7490196, 1, 1,
0.1083156, 0.9096947, 1.560448, 0, 0.7411765, 1, 1,
0.1135322, -0.1308052, 0.3786401, 0, 0.7372549, 1, 1,
0.1159332, -0.1488738, 3.55246, 0, 0.7294118, 1, 1,
0.1232913, 0.08050373, 3.312603, 0, 0.7254902, 1, 1,
0.1266295, 0.6252081, 0.9196111, 0, 0.7176471, 1, 1,
0.1275101, -0.9712132, 2.040913, 0, 0.7137255, 1, 1,
0.1326104, -0.3291314, 3.102513, 0, 0.7058824, 1, 1,
0.1346689, 2.529106, 0.9351227, 0, 0.6980392, 1, 1,
0.1358524, 0.9839978, 0.9333575, 0, 0.6941177, 1, 1,
0.1377535, 1.678463, -1.440605, 0, 0.6862745, 1, 1,
0.1382619, 0.7629465, 0.09868689, 0, 0.682353, 1, 1,
0.1382629, 0.7274731, 0.08297923, 0, 0.6745098, 1, 1,
0.1423, -0.9070703, 3.195951, 0, 0.6705883, 1, 1,
0.1478081, 0.5312027, -1.154821, 0, 0.6627451, 1, 1,
0.1485723, 1.406396, -0.7001904, 0, 0.6588235, 1, 1,
0.1511959, -2.839332, 3.906072, 0, 0.6509804, 1, 1,
0.1522653, -0.1510854, 1.904858, 0, 0.6470588, 1, 1,
0.1555419, 1.313137, 0.4716748, 0, 0.6392157, 1, 1,
0.1556359, 0.193371, -0.5744112, 0, 0.6352941, 1, 1,
0.1596798, -0.244153, 2.177978, 0, 0.627451, 1, 1,
0.1600557, -2.300628, 2.591931, 0, 0.6235294, 1, 1,
0.1607796, 0.6223005, 0.3406587, 0, 0.6156863, 1, 1,
0.1640767, -0.3040721, 2.119357, 0, 0.6117647, 1, 1,
0.165675, -0.2710734, 1.904033, 0, 0.6039216, 1, 1,
0.1659992, 0.6729741, 1.429716, 0, 0.5960785, 1, 1,
0.1705165, -0.8899426, 2.399414, 0, 0.5921569, 1, 1,
0.1710239, -1.538754, 4.090371, 0, 0.5843138, 1, 1,
0.1711046, 2.080462, 0.2596034, 0, 0.5803922, 1, 1,
0.1731291, 0.1854418, 0.1943994, 0, 0.572549, 1, 1,
0.173786, -1.116391, 3.46701, 0, 0.5686275, 1, 1,
0.176355, 0.153949, 0.7329581, 0, 0.5607843, 1, 1,
0.1771981, 0.07907059, 2.018763, 0, 0.5568628, 1, 1,
0.1785537, 0.413316, -0.2249393, 0, 0.5490196, 1, 1,
0.1785738, -0.2535444, 2.250901, 0, 0.5450981, 1, 1,
0.1808814, -0.2571083, 1.678069, 0, 0.5372549, 1, 1,
0.1814562, -0.2673388, 3.0357, 0, 0.5333334, 1, 1,
0.1829929, -0.4056966, 2.615762, 0, 0.5254902, 1, 1,
0.1863387, -0.1006322, 2.543937, 0, 0.5215687, 1, 1,
0.1874529, 1.006685, 0.7120723, 0, 0.5137255, 1, 1,
0.1899763, -0.1138673, 3.045953, 0, 0.509804, 1, 1,
0.1929824, 1.92464, 1.66862, 0, 0.5019608, 1, 1,
0.1934942, 1.903481, 0.9700422, 0, 0.4941176, 1, 1,
0.1952156, -1.040192, 3.126725, 0, 0.4901961, 1, 1,
0.1957568, 1.764829, 1.47008, 0, 0.4823529, 1, 1,
0.1966089, 0.4945972, -0.05889776, 0, 0.4784314, 1, 1,
0.1996336, 0.6725659, -0.09880812, 0, 0.4705882, 1, 1,
0.2008455, -0.3996996, 2.609127, 0, 0.4666667, 1, 1,
0.2022507, -0.09916503, 1.998857, 0, 0.4588235, 1, 1,
0.2029004, 0.4024487, 1.245557, 0, 0.454902, 1, 1,
0.2037764, -0.9735417, 2.849633, 0, 0.4470588, 1, 1,
0.2065348, 0.9870475, 1.793552, 0, 0.4431373, 1, 1,
0.2139782, 1.526139, -0.4642109, 0, 0.4352941, 1, 1,
0.2160676, -1.522639, 1.940545, 0, 0.4313726, 1, 1,
0.225455, 1.717392, 1.911054, 0, 0.4235294, 1, 1,
0.2278062, 0.006824955, 1.413093, 0, 0.4196078, 1, 1,
0.2287894, 0.5071034, -0.5634518, 0, 0.4117647, 1, 1,
0.2405235, -1.559917, 2.181648, 0, 0.4078431, 1, 1,
0.240953, -0.6926144, 1.703664, 0, 0.4, 1, 1,
0.2412372, 0.4090771, 0.1658922, 0, 0.3921569, 1, 1,
0.2476854, -0.4122674, 2.182606, 0, 0.3882353, 1, 1,
0.2519075, 0.3305199, 0.9424725, 0, 0.3803922, 1, 1,
0.2547253, -0.2868251, 4.375094, 0, 0.3764706, 1, 1,
0.2548722, -0.6173111, 2.224218, 0, 0.3686275, 1, 1,
0.2556442, -2.089352, 4.394138, 0, 0.3647059, 1, 1,
0.2561471, -1.100853, 2.654601, 0, 0.3568628, 1, 1,
0.2600109, 0.1712946, 0.265765, 0, 0.3529412, 1, 1,
0.2609311, 0.1195431, 0.5571245, 0, 0.345098, 1, 1,
0.2630591, -0.3853934, 2.991633, 0, 0.3411765, 1, 1,
0.2663942, 0.9268654, -0.5978265, 0, 0.3333333, 1, 1,
0.269711, -0.6496879, 4.490366, 0, 0.3294118, 1, 1,
0.274768, 1.281673, 1.112043, 0, 0.3215686, 1, 1,
0.2752992, 0.3807018, -0.6178073, 0, 0.3176471, 1, 1,
0.2807847, 0.1384139, 2.413793, 0, 0.3098039, 1, 1,
0.2814154, 0.1374263, 1.411726, 0, 0.3058824, 1, 1,
0.2834019, -1.047521, 0.2303002, 0, 0.2980392, 1, 1,
0.2843149, 1.002709, -0.1947058, 0, 0.2901961, 1, 1,
0.2859097, -1.770246, 3.926626, 0, 0.2862745, 1, 1,
0.2887162, -0.8178266, 2.798931, 0, 0.2784314, 1, 1,
0.2891756, -0.4416514, 3.582075, 0, 0.2745098, 1, 1,
0.289283, -0.2200247, 2.615916, 0, 0.2666667, 1, 1,
0.2897401, -1.211448, 2.963642, 0, 0.2627451, 1, 1,
0.2914855, 0.4644265, 2.238162, 0, 0.254902, 1, 1,
0.2916245, 0.8428307, 0.7182258, 0, 0.2509804, 1, 1,
0.2923324, -0.04236335, 2.194435, 0, 0.2431373, 1, 1,
0.2935341, -0.4121604, 0.7442329, 0, 0.2392157, 1, 1,
0.2966632, 0.9118577, 0.4444471, 0, 0.2313726, 1, 1,
0.3039488, -0.1706633, 2.069816, 0, 0.227451, 1, 1,
0.3076195, 0.7208706, -1.469522, 0, 0.2196078, 1, 1,
0.3082564, 1.450276, -0.8012969, 0, 0.2156863, 1, 1,
0.3103225, -1.418799, 3.99104, 0, 0.2078431, 1, 1,
0.3110768, 0.5451484, 2.340154, 0, 0.2039216, 1, 1,
0.3115131, -0.6846275, 2.870208, 0, 0.1960784, 1, 1,
0.3126544, 0.764311, 1.354023, 0, 0.1882353, 1, 1,
0.314305, 1.002557, 0.9571977, 0, 0.1843137, 1, 1,
0.3194256, -0.679324, 2.584161, 0, 0.1764706, 1, 1,
0.3201615, -0.3107036, 1.639731, 0, 0.172549, 1, 1,
0.3236898, 1.321378, 0.2762855, 0, 0.1647059, 1, 1,
0.3240895, 0.5736243, -1.398666, 0, 0.1607843, 1, 1,
0.3285659, -0.9618939, 4.312533, 0, 0.1529412, 1, 1,
0.3311162, 1.727573, -0.652369, 0, 0.1490196, 1, 1,
0.3498719, -0.6614942, 2.094531, 0, 0.1411765, 1, 1,
0.3503357, -0.9031525, 1.732537, 0, 0.1372549, 1, 1,
0.3535445, -0.4588813, 3.201144, 0, 0.1294118, 1, 1,
0.3565429, -1.24155, 2.716936, 0, 0.1254902, 1, 1,
0.3578888, 1.14564, 0.7420671, 0, 0.1176471, 1, 1,
0.3586984, 0.5415289, 0.02934759, 0, 0.1137255, 1, 1,
0.3680958, 2.322092, -0.5476054, 0, 0.1058824, 1, 1,
0.3755344, 0.5949602, 1.431862, 0, 0.09803922, 1, 1,
0.3798068, 0.2221308, 1.150738, 0, 0.09411765, 1, 1,
0.3879315, 2.064993, 0.05954177, 0, 0.08627451, 1, 1,
0.3884492, -1.156999, 4.185541, 0, 0.08235294, 1, 1,
0.3922835, 0.2176127, -0.3042935, 0, 0.07450981, 1, 1,
0.3932209, 0.3109841, 1.792763, 0, 0.07058824, 1, 1,
0.3960438, -0.9857458, 1.664549, 0, 0.0627451, 1, 1,
0.3985011, -1.059773, 2.958071, 0, 0.05882353, 1, 1,
0.4018697, -1.403787, 4.091195, 0, 0.05098039, 1, 1,
0.402534, -0.9535712, 2.658221, 0, 0.04705882, 1, 1,
0.4043523, 0.1793198, 2.360713, 0, 0.03921569, 1, 1,
0.4133535, 0.1447127, 1.716594, 0, 0.03529412, 1, 1,
0.4266085, 0.3343489, 1.665506, 0, 0.02745098, 1, 1,
0.4277167, -0.2573355, 2.831145, 0, 0.02352941, 1, 1,
0.430534, -0.6102831, 1.699312, 0, 0.01568628, 1, 1,
0.4307928, -0.2150813, 2.345179, 0, 0.01176471, 1, 1,
0.4324432, 1.162686, -0.06072222, 0, 0.003921569, 1, 1,
0.4440074, -0.4177632, 3.881006, 0.003921569, 0, 1, 1,
0.4485161, -1.025756, 0.6631966, 0.007843138, 0, 1, 1,
0.448522, -0.2884052, 1.643556, 0.01568628, 0, 1, 1,
0.4493397, -0.003028945, 2.596685, 0.01960784, 0, 1, 1,
0.4498118, -0.2056262, 1.727392, 0.02745098, 0, 1, 1,
0.4500763, 0.8499777, -0.4369306, 0.03137255, 0, 1, 1,
0.452898, 0.2042393, 1.971929, 0.03921569, 0, 1, 1,
0.4548667, 0.4413912, 0.980296, 0.04313726, 0, 1, 1,
0.4549307, 1.158754, -1.891342, 0.05098039, 0, 1, 1,
0.4554304, -0.291455, 2.702882, 0.05490196, 0, 1, 1,
0.465116, -0.9605033, 2.839648, 0.0627451, 0, 1, 1,
0.4651231, -0.2607515, 3.074838, 0.06666667, 0, 1, 1,
0.476965, 0.01596825, -1.768735, 0.07450981, 0, 1, 1,
0.4779836, 1.450464, -1.336096, 0.07843138, 0, 1, 1,
0.4791476, 0.4609062, 0.319151, 0.08627451, 0, 1, 1,
0.4815452, 0.3956591, 2.470766, 0.09019608, 0, 1, 1,
0.4832422, -1.060668, 2.322475, 0.09803922, 0, 1, 1,
0.485808, 0.3057655, -0.8225109, 0.1058824, 0, 1, 1,
0.485934, 0.7521968, 0.6515295, 0.1098039, 0, 1, 1,
0.4865052, -0.3161266, 3.054839, 0.1176471, 0, 1, 1,
0.4892636, -1.289706, 1.594526, 0.1215686, 0, 1, 1,
0.4918093, 0.02821253, -0.234824, 0.1294118, 0, 1, 1,
0.4939842, 0.0572268, 0.6561095, 0.1333333, 0, 1, 1,
0.4941774, -1.097496, 4.088313, 0.1411765, 0, 1, 1,
0.4960941, -0.2789192, 1.258684, 0.145098, 0, 1, 1,
0.4972629, 0.2090216, -0.1200961, 0.1529412, 0, 1, 1,
0.5032609, -0.2781389, 2.084911, 0.1568628, 0, 1, 1,
0.5074151, -5.183122e-05, 1.760778, 0.1647059, 0, 1, 1,
0.50992, -0.0854615, 2.497565, 0.1686275, 0, 1, 1,
0.5112692, 1.807639, 0.8397729, 0.1764706, 0, 1, 1,
0.5120645, -2.06177, 4.053698, 0.1803922, 0, 1, 1,
0.5126271, 1.045671, 0.2130412, 0.1882353, 0, 1, 1,
0.5137581, -0.2430297, 2.991393, 0.1921569, 0, 1, 1,
0.518244, -0.2781742, 2.932481, 0.2, 0, 1, 1,
0.5203617, -0.1787915, 2.396495, 0.2078431, 0, 1, 1,
0.5221208, 1.097617, -1.149798, 0.2117647, 0, 1, 1,
0.5238787, -1.906956, 1.791467, 0.2196078, 0, 1, 1,
0.528181, -0.6549597, 2.888409, 0.2235294, 0, 1, 1,
0.5300379, -0.6540842, 2.33263, 0.2313726, 0, 1, 1,
0.5319875, 1.953543, 1.054402, 0.2352941, 0, 1, 1,
0.5327616, -0.7151173, 2.522427, 0.2431373, 0, 1, 1,
0.5331022, 0.522801, 2.567376, 0.2470588, 0, 1, 1,
0.5337674, 1.927558, 0.225916, 0.254902, 0, 1, 1,
0.5349355, 0.09440891, 1.935487, 0.2588235, 0, 1, 1,
0.5363716, 0.8307102, -1.03637, 0.2666667, 0, 1, 1,
0.538508, -0.495156, 2.834637, 0.2705882, 0, 1, 1,
0.5488299, -0.1557386, 1.907651, 0.2784314, 0, 1, 1,
0.5498881, 1.853351, 1.409588, 0.282353, 0, 1, 1,
0.5521629, -0.9979879, 1.711083, 0.2901961, 0, 1, 1,
0.5601437, 1.891378, 1.260845, 0.2941177, 0, 1, 1,
0.5609622, 0.1490116, 0.7139204, 0.3019608, 0, 1, 1,
0.5619203, -1.202223, 2.394869, 0.3098039, 0, 1, 1,
0.5625296, -0.6000693, 3.162278, 0.3137255, 0, 1, 1,
0.5652829, 0.4015881, 1.466334, 0.3215686, 0, 1, 1,
0.5709294, -1.810293, 4.66196, 0.3254902, 0, 1, 1,
0.5741028, 0.07079219, 1.811127, 0.3333333, 0, 1, 1,
0.5840698, -0.6096945, 3.092559, 0.3372549, 0, 1, 1,
0.5846661, -1.286073, 4.002482, 0.345098, 0, 1, 1,
0.5898286, -0.912765, 2.246369, 0.3490196, 0, 1, 1,
0.5920776, 0.6060886, 0.7122401, 0.3568628, 0, 1, 1,
0.6054091, 2.02865, -0.09803103, 0.3607843, 0, 1, 1,
0.609236, -2.199394, 2.029641, 0.3686275, 0, 1, 1,
0.6109622, -1.279862, 2.785345, 0.372549, 0, 1, 1,
0.6195802, -1.097316, 2.109252, 0.3803922, 0, 1, 1,
0.6205869, 0.3709081, 2.236477, 0.3843137, 0, 1, 1,
0.6211271, 0.2401579, 3.988359, 0.3921569, 0, 1, 1,
0.6260092, -0.5930462, 3.30451, 0.3960784, 0, 1, 1,
0.6289372, -0.8426698, 2.012575, 0.4039216, 0, 1, 1,
0.6314594, 0.05300472, 1.2206, 0.4117647, 0, 1, 1,
0.6320301, -1.095324, 2.807363, 0.4156863, 0, 1, 1,
0.6322724, 0.7604465, -1.35844, 0.4235294, 0, 1, 1,
0.6349657, 0.4406757, -0.07499426, 0.427451, 0, 1, 1,
0.6350726, -0.3397321, 2.913649, 0.4352941, 0, 1, 1,
0.6395171, -2.053457, 1.473838, 0.4392157, 0, 1, 1,
0.6432597, -0.327164, 2.91924, 0.4470588, 0, 1, 1,
0.6501257, 0.9340839, 0.5461222, 0.4509804, 0, 1, 1,
0.6556442, 0.2603736, 0.8764319, 0.4588235, 0, 1, 1,
0.6576257, -0.4585705, 1.943131, 0.4627451, 0, 1, 1,
0.658092, 1.195004, -1.053886, 0.4705882, 0, 1, 1,
0.6583123, 0.3092026, 0.6771573, 0.4745098, 0, 1, 1,
0.6627478, -0.573626, 1.482421, 0.4823529, 0, 1, 1,
0.6688767, -0.4315352, 2.542482, 0.4862745, 0, 1, 1,
0.6691702, -1.117726, 2.976041, 0.4941176, 0, 1, 1,
0.6737849, -0.5045408, 3.637889, 0.5019608, 0, 1, 1,
0.6742652, 0.7058229, 1.361055, 0.5058824, 0, 1, 1,
0.6748086, -0.8611293, 1.771871, 0.5137255, 0, 1, 1,
0.6785322, -0.5599918, 0.9532235, 0.5176471, 0, 1, 1,
0.6795554, 0.7168608, 0.6123737, 0.5254902, 0, 1, 1,
0.6869791, 0.05872538, 0.723092, 0.5294118, 0, 1, 1,
0.6894603, 1.117978, 2.554924, 0.5372549, 0, 1, 1,
0.6931863, 0.7100065, 0.6261968, 0.5411765, 0, 1, 1,
0.6948695, -0.3763562, 3.184794, 0.5490196, 0, 1, 1,
0.6971018, 1.372177, -0.7885588, 0.5529412, 0, 1, 1,
0.7018985, 0.6307403, -1.40247, 0.5607843, 0, 1, 1,
0.7028521, -0.3230326, 2.3409, 0.5647059, 0, 1, 1,
0.7034835, -0.4283996, 0.9011239, 0.572549, 0, 1, 1,
0.7084404, -0.3747865, 2.631353, 0.5764706, 0, 1, 1,
0.70916, 2.083001, 1.479516, 0.5843138, 0, 1, 1,
0.7121232, 1.451116, 0.9495206, 0.5882353, 0, 1, 1,
0.7124808, 0.1752495, 2.195623, 0.5960785, 0, 1, 1,
0.7172477, 0.5010327, 0.8675979, 0.6039216, 0, 1, 1,
0.7182319, 0.8707247, 2.359036, 0.6078432, 0, 1, 1,
0.7200137, 0.1383227, 1.771137, 0.6156863, 0, 1, 1,
0.7206896, 0.4238326, 0.299072, 0.6196079, 0, 1, 1,
0.721611, 1.795662, -0.4534465, 0.627451, 0, 1, 1,
0.7285154, -1.773428, 1.810639, 0.6313726, 0, 1, 1,
0.7348029, 1.499585, 0.2074594, 0.6392157, 0, 1, 1,
0.7352378, -0.1582756, 1.874532, 0.6431373, 0, 1, 1,
0.7372489, -1.330113, 4.646569, 0.6509804, 0, 1, 1,
0.7414925, 0.238162, 1.483413, 0.654902, 0, 1, 1,
0.748602, 0.9214877, 1.621272, 0.6627451, 0, 1, 1,
0.7562337, -1.156939, 2.665513, 0.6666667, 0, 1, 1,
0.7568399, -1.010621, 3.057472, 0.6745098, 0, 1, 1,
0.7621695, 1.272388, 1.106547, 0.6784314, 0, 1, 1,
0.7670872, -0.0724033, 1.641494, 0.6862745, 0, 1, 1,
0.7741511, -0.5029936, 1.237357, 0.6901961, 0, 1, 1,
0.7837595, 0.7129761, 0.1150484, 0.6980392, 0, 1, 1,
0.7851596, 1.227183, 0.1116411, 0.7058824, 0, 1, 1,
0.7857267, -1.185247, 3.936155, 0.7098039, 0, 1, 1,
0.7951255, -2.043046, 1.710715, 0.7176471, 0, 1, 1,
0.7983565, 1.239625, -2.27085, 0.7215686, 0, 1, 1,
0.8032644, -1.019822, 1.871486, 0.7294118, 0, 1, 1,
0.8053154, 0.1960286, 1.900474, 0.7333333, 0, 1, 1,
0.8226188, -0.18242, 1.61812, 0.7411765, 0, 1, 1,
0.8241049, 0.698649, 0.2165284, 0.7450981, 0, 1, 1,
0.8309989, 0.3723799, -0.9455587, 0.7529412, 0, 1, 1,
0.8315703, 0.4117857, 1.095039, 0.7568628, 0, 1, 1,
0.8348138, 3.162336, -1.844028, 0.7647059, 0, 1, 1,
0.8407866, -0.08781708, 1.65445, 0.7686275, 0, 1, 1,
0.8495139, -0.0806264, 2.695529, 0.7764706, 0, 1, 1,
0.8500718, 0.08952233, 1.74207, 0.7803922, 0, 1, 1,
0.8534265, 0.6263294, 1.292696, 0.7882353, 0, 1, 1,
0.8554041, 2.164307, 0.7326006, 0.7921569, 0, 1, 1,
0.855614, 0.9765849, 1.04901, 0.8, 0, 1, 1,
0.8618868, 0.2401137, 0.8002577, 0.8078431, 0, 1, 1,
0.8642389, 0.08458842, 1.849372, 0.8117647, 0, 1, 1,
0.8642424, 1.301146, -0.8119133, 0.8196079, 0, 1, 1,
0.8661452, -0.5041158, 0.4407273, 0.8235294, 0, 1, 1,
0.8680452, 0.8902424, 0.7379721, 0.8313726, 0, 1, 1,
0.8701459, 0.8815957, -1.74903, 0.8352941, 0, 1, 1,
0.8751795, -0.2043476, 0.2068507, 0.8431373, 0, 1, 1,
0.8786021, -1.223005, 2.18912, 0.8470588, 0, 1, 1,
0.8848698, 0.8281723, 1.844466, 0.854902, 0, 1, 1,
0.8868513, -0.3623898, 2.18818, 0.8588235, 0, 1, 1,
0.8918227, 0.08526928, 0.823849, 0.8666667, 0, 1, 1,
0.8974506, 0.5823942, -0.3701351, 0.8705882, 0, 1, 1,
0.8997339, 1.00511, 1.674951, 0.8784314, 0, 1, 1,
0.9059185, 1.273915, 2.10855, 0.8823529, 0, 1, 1,
0.9097624, 0.6215803, 0.7021208, 0.8901961, 0, 1, 1,
0.91035, 2.362545, 2.02276, 0.8941177, 0, 1, 1,
0.9146243, -0.2155535, 2.334745, 0.9019608, 0, 1, 1,
0.9161554, 0.09796747, 1.481821, 0.9098039, 0, 1, 1,
0.917652, -0.003430618, 0.9980154, 0.9137255, 0, 1, 1,
0.9189211, 0.1863828, 0.4772632, 0.9215686, 0, 1, 1,
0.9190218, -2.161124, 1.989187, 0.9254902, 0, 1, 1,
0.9209762, -0.8528326, 3.059792, 0.9333333, 0, 1, 1,
0.9282255, -0.8865121, 4.398424, 0.9372549, 0, 1, 1,
0.9299349, 1.347969, 0.2427713, 0.945098, 0, 1, 1,
0.9322264, -1.481813, 1.510861, 0.9490196, 0, 1, 1,
0.9366208, -0.7321412, 1.956606, 0.9568627, 0, 1, 1,
0.9956406, 0.5920123, -0.2791115, 0.9607843, 0, 1, 1,
1.002537, 0.7042521, -0.1949894, 0.9686275, 0, 1, 1,
1.003257, 0.07324117, 1.527082, 0.972549, 0, 1, 1,
1.005931, -0.3474933, 0.7260112, 0.9803922, 0, 1, 1,
1.015695, -1.098469, 2.574913, 0.9843137, 0, 1, 1,
1.016228, -0.4760286, 0.4067215, 0.9921569, 0, 1, 1,
1.017671, -2.315272, 1.865285, 0.9960784, 0, 1, 1,
1.021593, -1.021673, 2.542855, 1, 0, 0.9960784, 1,
1.023956, -0.9317026, 2.819459, 1, 0, 0.9882353, 1,
1.03304, 0.7572033, 0.7235415, 1, 0, 0.9843137, 1,
1.034139, -1.667108, 5.428693, 1, 0, 0.9764706, 1,
1.034567, -0.1635548, 0.4754779, 1, 0, 0.972549, 1,
1.036837, -2.13735, 2.48904, 1, 0, 0.9647059, 1,
1.044988, 1.017675, 1.401696, 1, 0, 0.9607843, 1,
1.046034, -0.6328947, 2.858709, 1, 0, 0.9529412, 1,
1.046779, 1.092484, -0.3372098, 1, 0, 0.9490196, 1,
1.062529, 0.5456937, 1.456951, 1, 0, 0.9411765, 1,
1.064167, 1.146032, 0.5469573, 1, 0, 0.9372549, 1,
1.06433, -1.58967, 1.730134, 1, 0, 0.9294118, 1,
1.06673, 0.3969915, 1.284797, 1, 0, 0.9254902, 1,
1.066846, -0.1289343, 1.662773, 1, 0, 0.9176471, 1,
1.068136, -1.171656, 1.949883, 1, 0, 0.9137255, 1,
1.077936, 0.4905916, 0.9228014, 1, 0, 0.9058824, 1,
1.086084, 0.8760507, 1.419916, 1, 0, 0.9019608, 1,
1.089982, -0.430732, 1.571828, 1, 0, 0.8941177, 1,
1.095035, 0.4993764, 0.4420607, 1, 0, 0.8862745, 1,
1.095514, -1.229725, 1.916866, 1, 0, 0.8823529, 1,
1.100236, -0.1465841, 3.110535, 1, 0, 0.8745098, 1,
1.103887, 1.282248, 0.8200428, 1, 0, 0.8705882, 1,
1.107405, -0.0928044, 1.451343, 1, 0, 0.8627451, 1,
1.109291, 0.5247147, 1.723464, 1, 0, 0.8588235, 1,
1.109848, 0.5437177, 0.1892815, 1, 0, 0.8509804, 1,
1.111782, -0.3261367, 1.106626, 1, 0, 0.8470588, 1,
1.112041, 0.2092267, 1.599518, 1, 0, 0.8392157, 1,
1.112352, 0.3857627, 1.036398, 1, 0, 0.8352941, 1,
1.114989, -0.8684633, 1.361658, 1, 0, 0.827451, 1,
1.119945, -1.197805, 2.251974, 1, 0, 0.8235294, 1,
1.12575, 0.5932409, 2.378463, 1, 0, 0.8156863, 1,
1.128121, -1.370959, 2.475682, 1, 0, 0.8117647, 1,
1.129868, 0.2022873, -0.4227626, 1, 0, 0.8039216, 1,
1.137678, 1.128767, 0.3097305, 1, 0, 0.7960784, 1,
1.137995, -0.6329574, 2.2233, 1, 0, 0.7921569, 1,
1.139786, -0.3800641, 4.076293, 1, 0, 0.7843137, 1,
1.141153, -0.06414413, -0.1997182, 1, 0, 0.7803922, 1,
1.14537, -0.5328183, 1.087933, 1, 0, 0.772549, 1,
1.155033, -0.6918118, 4.403974, 1, 0, 0.7686275, 1,
1.155809, -1.460544, 1.913325, 1, 0, 0.7607843, 1,
1.161246, 1.099049, 1.587611, 1, 0, 0.7568628, 1,
1.161415, -0.134445, 1.007128, 1, 0, 0.7490196, 1,
1.162486, -0.6543713, 1.330747, 1, 0, 0.7450981, 1,
1.162897, 0.2774936, 2.694199, 1, 0, 0.7372549, 1,
1.165486, 0.4367489, 1.615325, 1, 0, 0.7333333, 1,
1.165539, -1.271776, 1.210143, 1, 0, 0.7254902, 1,
1.171962, 0.8748917, 2.323623, 1, 0, 0.7215686, 1,
1.197241, 1.434946, 1.682693, 1, 0, 0.7137255, 1,
1.197502, 1.70216, -1.662282, 1, 0, 0.7098039, 1,
1.198589, 0.04975412, 2.080461, 1, 0, 0.7019608, 1,
1.202506, 0.4036893, 1.389472, 1, 0, 0.6941177, 1,
1.20307, -0.7079861, 2.733479, 1, 0, 0.6901961, 1,
1.211612, -0.286178, 1.704191, 1, 0, 0.682353, 1,
1.217706, 0.2385478, 0.9318376, 1, 0, 0.6784314, 1,
1.221012, 0.818599, 2.058302, 1, 0, 0.6705883, 1,
1.224362, -0.3533444, 3.955808, 1, 0, 0.6666667, 1,
1.231321, -0.004756287, 1.913828, 1, 0, 0.6588235, 1,
1.233412, -0.2650371, 0.4284879, 1, 0, 0.654902, 1,
1.23364, 0.6629912, 1.938741, 1, 0, 0.6470588, 1,
1.234193, 2.209347, -0.1358669, 1, 0, 0.6431373, 1,
1.240518, -1.065724, 1.088305, 1, 0, 0.6352941, 1,
1.249418, -0.1653607, 1.608987, 1, 0, 0.6313726, 1,
1.252796, -1.565281, 2.370748, 1, 0, 0.6235294, 1,
1.254246, 1.170888, 1.085701, 1, 0, 0.6196079, 1,
1.258952, 0.5264779, 0.3256085, 1, 0, 0.6117647, 1,
1.259216, -0.8920169, 0.8953592, 1, 0, 0.6078432, 1,
1.260507, 0.7165781, 0.7441963, 1, 0, 0.6, 1,
1.262259, -1.980998, 2.199799, 1, 0, 0.5921569, 1,
1.267061, 0.4155658, 1.339761, 1, 0, 0.5882353, 1,
1.275403, -1.276366, 3.374185, 1, 0, 0.5803922, 1,
1.277462, -0.1257004, 0.03245382, 1, 0, 0.5764706, 1,
1.277626, 1.566527, 0.8925595, 1, 0, 0.5686275, 1,
1.278565, -0.7554421, 3.722136, 1, 0, 0.5647059, 1,
1.280615, -0.584304, 2.716644, 1, 0, 0.5568628, 1,
1.282645, 0.8010333, 0.02282162, 1, 0, 0.5529412, 1,
1.292967, -0.2962945, 1.292836, 1, 0, 0.5450981, 1,
1.295939, 1.306058, 0.8713645, 1, 0, 0.5411765, 1,
1.296092, -0.2864299, 0.9188947, 1, 0, 0.5333334, 1,
1.296457, -1.064211, 3.022766, 1, 0, 0.5294118, 1,
1.301398, 0.4004128, -0.416838, 1, 0, 0.5215687, 1,
1.305292, -0.9928758, 1.93602, 1, 0, 0.5176471, 1,
1.319685, 0.4679593, 1.399776, 1, 0, 0.509804, 1,
1.323237, -1.158615, 2.788911, 1, 0, 0.5058824, 1,
1.332087, -2.313756, 2.443731, 1, 0, 0.4980392, 1,
1.344488, -0.09260113, 2.614759, 1, 0, 0.4901961, 1,
1.350627, -0.9016967, 1.447711, 1, 0, 0.4862745, 1,
1.363595, -1.184046, 1.976191, 1, 0, 0.4784314, 1,
1.364241, 0.6178433, -0.1289673, 1, 0, 0.4745098, 1,
1.376823, 0.5860597, 0.7728132, 1, 0, 0.4666667, 1,
1.383901, 1.162679, 1.207863, 1, 0, 0.4627451, 1,
1.392097, 1.348565, 1.894302, 1, 0, 0.454902, 1,
1.404937, -0.7150207, 1.729475, 1, 0, 0.4509804, 1,
1.409788, 0.06139505, 0.05143522, 1, 0, 0.4431373, 1,
1.412604, 0.5383313, 0.6339171, 1, 0, 0.4392157, 1,
1.415635, -0.4593502, 1.498813, 1, 0, 0.4313726, 1,
1.424918, 0.4623526, 1.372727, 1, 0, 0.427451, 1,
1.426429, -1.652303, 2.498649, 1, 0, 0.4196078, 1,
1.432502, 0.8735165, 0.7872513, 1, 0, 0.4156863, 1,
1.432561, 1.903822, -0.248002, 1, 0, 0.4078431, 1,
1.437246, -1.2512, 1.022728, 1, 0, 0.4039216, 1,
1.439391, 1.765951, -0.4141676, 1, 0, 0.3960784, 1,
1.445467, 0.2689542, 1.259981, 1, 0, 0.3882353, 1,
1.447387, -0.2082463, 2.868974, 1, 0, 0.3843137, 1,
1.454877, 1.031719, 1.173822, 1, 0, 0.3764706, 1,
1.455917, -0.4373808, 1.444876, 1, 0, 0.372549, 1,
1.456929, -0.7627537, 2.862104, 1, 0, 0.3647059, 1,
1.460835, -1.039688, 1.426598, 1, 0, 0.3607843, 1,
1.463051, 0.2270957, 1.344712, 1, 0, 0.3529412, 1,
1.472039, 0.8527036, -0.1453894, 1, 0, 0.3490196, 1,
1.477121, -1.130001, 2.994104, 1, 0, 0.3411765, 1,
1.483266, -0.9904642, 3.817094, 1, 0, 0.3372549, 1,
1.50731, -0.9334043, 2.28694, 1, 0, 0.3294118, 1,
1.507891, 0.2120499, 0.8163153, 1, 0, 0.3254902, 1,
1.521769, 0.8476971, -1.481435, 1, 0, 0.3176471, 1,
1.527514, 0.4670132, 1.147444, 1, 0, 0.3137255, 1,
1.537723, -0.5814946, 2.512976, 1, 0, 0.3058824, 1,
1.538026, -0.4803689, 1.455732, 1, 0, 0.2980392, 1,
1.541857, -0.6346559, 1.492344, 1, 0, 0.2941177, 1,
1.549069, -0.4856227, 2.685395, 1, 0, 0.2862745, 1,
1.553776, 1.087151, -0.2072886, 1, 0, 0.282353, 1,
1.555033, -1.266307, 3.570714, 1, 0, 0.2745098, 1,
1.555608, -0.9993553, 1.882, 1, 0, 0.2705882, 1,
1.56884, -0.7605368, 1.330695, 1, 0, 0.2627451, 1,
1.596884, 0.1973974, 1.63984, 1, 0, 0.2588235, 1,
1.62711, -0.2722997, 2.156806, 1, 0, 0.2509804, 1,
1.629519, 0.2280593, 0.6081617, 1, 0, 0.2470588, 1,
1.63095, -0.7863024, 1.05449, 1, 0, 0.2392157, 1,
1.637864, 0.7132527, 0.5606396, 1, 0, 0.2352941, 1,
1.65439, 2.298241, 1.294478, 1, 0, 0.227451, 1,
1.655519, -0.6891029, 2.134411, 1, 0, 0.2235294, 1,
1.671275, -0.7258501, 1.934889, 1, 0, 0.2156863, 1,
1.681531, -0.4897304, 2.7331, 1, 0, 0.2117647, 1,
1.704431, 0.8122075, 1.722601, 1, 0, 0.2039216, 1,
1.711304, -1.688261, 1.644626, 1, 0, 0.1960784, 1,
1.755299, 0.3891523, 2.795262, 1, 0, 0.1921569, 1,
1.75831, 0.389683, -0.7901903, 1, 0, 0.1843137, 1,
1.768314, -2.064976, 2.398116, 1, 0, 0.1803922, 1,
1.804459, -0.0116997, 1.460049, 1, 0, 0.172549, 1,
1.806288, 0.6311932, 1.246855, 1, 0, 0.1686275, 1,
1.854968, -1.3503, 3.466061, 1, 0, 0.1607843, 1,
1.858451, -0.4269023, 3.056821, 1, 0, 0.1568628, 1,
1.866302, 1.253028, 1.996923, 1, 0, 0.1490196, 1,
1.872509, -1.261559, 3.686799, 1, 0, 0.145098, 1,
1.877762, 0.5029346, 0.1694139, 1, 0, 0.1372549, 1,
1.903303, 0.1612705, 1.44779, 1, 0, 0.1333333, 1,
1.924349, -0.1483317, 1.73087, 1, 0, 0.1254902, 1,
1.955157, 0.4655614, 1.246888, 1, 0, 0.1215686, 1,
2.017073, 0.2065299, 2.372165, 1, 0, 0.1137255, 1,
2.080626, -2.327024, 1.484474, 1, 0, 0.1098039, 1,
2.080687, 0.02409469, 2.355773, 1, 0, 0.1019608, 1,
2.120403, 0.5377951, 0.5280011, 1, 0, 0.09411765, 1,
2.141848, 1.224282, 1.817754, 1, 0, 0.09019608, 1,
2.189924, 1.009726, 0.5693651, 1, 0, 0.08235294, 1,
2.208571, 0.04811437, 0.2868135, 1, 0, 0.07843138, 1,
2.21954, 0.5265936, 0.3778144, 1, 0, 0.07058824, 1,
2.239896, -0.7354773, -0.4161835, 1, 0, 0.06666667, 1,
2.330984, 2.371279, -0.04774239, 1, 0, 0.05882353, 1,
2.351851, -1.240676, 1.891646, 1, 0, 0.05490196, 1,
2.365981, -0.3184084, 1.135223, 1, 0, 0.04705882, 1,
2.493659, -0.04621109, 1.453561, 1, 0, 0.04313726, 1,
2.543663, 0.03189478, 1.374553, 1, 0, 0.03529412, 1,
2.646516, 0.0393818, -0.5999248, 1, 0, 0.03137255, 1,
2.707765, -1.965175, 1.609134, 1, 0, 0.02352941, 1,
2.719178, -0.09325796, 1.893801, 1, 0, 0.01960784, 1,
3.060439, -0.2527574, 1.45166, 1, 0, 0.01176471, 1,
3.68964, 0.9534497, 0.6286061, 1, 0, 0.007843138, 1
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
0.2674316, -4.720118, -7.593363, 0, -0.5, 0.5, 0.5,
0.2674316, -4.720118, -7.593363, 1, -0.5, 0.5, 0.5,
0.2674316, -4.720118, -7.593363, 1, 1.5, 0.5, 0.5,
0.2674316, -4.720118, -7.593363, 0, 1.5, 0.5, 0.5
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
-4.314906, 0.0762645, -7.593363, 0, -0.5, 0.5, 0.5,
-4.314906, 0.0762645, -7.593363, 1, -0.5, 0.5, 0.5,
-4.314906, 0.0762645, -7.593363, 1, 1.5, 0.5, 0.5,
-4.314906, 0.0762645, -7.593363, 0, 1.5, 0.5, 0.5
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
-4.314906, -4.720118, 0.03937578, 0, -0.5, 0.5, 0.5,
-4.314906, -4.720118, 0.03937578, 1, -0.5, 0.5, 0.5,
-4.314906, -4.720118, 0.03937578, 1, 1.5, 0.5, 0.5,
-4.314906, -4.720118, 0.03937578, 0, 1.5, 0.5, 0.5
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
-3, -3.61326, -5.831962,
3, -3.61326, -5.831962,
-3, -3.61326, -5.831962,
-3, -3.797736, -6.125528,
-2, -3.61326, -5.831962,
-2, -3.797736, -6.125528,
-1, -3.61326, -5.831962,
-1, -3.797736, -6.125528,
0, -3.61326, -5.831962,
0, -3.797736, -6.125528,
1, -3.61326, -5.831962,
1, -3.797736, -6.125528,
2, -3.61326, -5.831962,
2, -3.797736, -6.125528,
3, -3.61326, -5.831962,
3, -3.797736, -6.125528
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
-3, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
-3, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
-3, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
-3, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
-2, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
-2, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
-2, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
-2, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
-1, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
-1, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
-1, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
-1, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
0, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
0, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
0, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
0, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
1, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
1, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
1, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
1, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
2, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
2, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
2, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
2, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5,
3, -4.166689, -6.712662, 0, -0.5, 0.5, 0.5,
3, -4.166689, -6.712662, 1, -0.5, 0.5, 0.5,
3, -4.166689, -6.712662, 1, 1.5, 0.5, 0.5,
3, -4.166689, -6.712662, 0, 1.5, 0.5, 0.5
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
-3.257443, -2, -5.831962,
-3.257443, 2, -5.831962,
-3.257443, -2, -5.831962,
-3.433687, -2, -6.125528,
-3.257443, 0, -5.831962,
-3.433687, 0, -6.125528,
-3.257443, 2, -5.831962,
-3.433687, 2, -6.125528
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
"-2",
"0",
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
-3.786175, -2, -6.712662, 0, -0.5, 0.5, 0.5,
-3.786175, -2, -6.712662, 1, -0.5, 0.5, 0.5,
-3.786175, -2, -6.712662, 1, 1.5, 0.5, 0.5,
-3.786175, -2, -6.712662, 0, 1.5, 0.5, 0.5,
-3.786175, 0, -6.712662, 0, -0.5, 0.5, 0.5,
-3.786175, 0, -6.712662, 1, -0.5, 0.5, 0.5,
-3.786175, 0, -6.712662, 1, 1.5, 0.5, 0.5,
-3.786175, 0, -6.712662, 0, 1.5, 0.5, 0.5,
-3.786175, 2, -6.712662, 0, -0.5, 0.5, 0.5,
-3.786175, 2, -6.712662, 1, -0.5, 0.5, 0.5,
-3.786175, 2, -6.712662, 1, 1.5, 0.5, 0.5,
-3.786175, 2, -6.712662, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.257443, -3.61326, -4,
-3.257443, -3.61326, 4,
-3.257443, -3.61326, -4,
-3.433687, -3.797736, -4,
-3.257443, -3.61326, -2,
-3.433687, -3.797736, -2,
-3.257443, -3.61326, 0,
-3.433687, -3.797736, 0,
-3.257443, -3.61326, 2,
-3.433687, -3.797736, 2,
-3.257443, -3.61326, 4,
-3.433687, -3.797736, 4
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
-3.786175, -4.166689, -4, 0, -0.5, 0.5, 0.5,
-3.786175, -4.166689, -4, 1, -0.5, 0.5, 0.5,
-3.786175, -4.166689, -4, 1, 1.5, 0.5, 0.5,
-3.786175, -4.166689, -4, 0, 1.5, 0.5, 0.5,
-3.786175, -4.166689, -2, 0, -0.5, 0.5, 0.5,
-3.786175, -4.166689, -2, 1, -0.5, 0.5, 0.5,
-3.786175, -4.166689, -2, 1, 1.5, 0.5, 0.5,
-3.786175, -4.166689, -2, 0, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 0, 0, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 0, 1, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 0, 1, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 0, 0, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 2, 0, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 2, 1, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 2, 1, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 2, 0, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 4, 0, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 4, 1, -0.5, 0.5, 0.5,
-3.786175, -4.166689, 4, 1, 1.5, 0.5, 0.5,
-3.786175, -4.166689, 4, 0, 1.5, 0.5, 0.5
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
-3.257443, -3.61326, -5.831962,
-3.257443, 3.765789, -5.831962,
-3.257443, -3.61326, 5.910713,
-3.257443, 3.765789, 5.910713,
-3.257443, -3.61326, -5.831962,
-3.257443, -3.61326, 5.910713,
-3.257443, 3.765789, -5.831962,
-3.257443, 3.765789, 5.910713,
-3.257443, -3.61326, -5.831962,
3.792307, -3.61326, -5.831962,
-3.257443, -3.61326, 5.910713,
3.792307, -3.61326, 5.910713,
-3.257443, 3.765789, -5.831962,
3.792307, 3.765789, -5.831962,
-3.257443, 3.765789, 5.910713,
3.792307, 3.765789, 5.910713,
3.792307, -3.61326, -5.831962,
3.792307, 3.765789, -5.831962,
3.792307, -3.61326, 5.910713,
3.792307, 3.765789, 5.910713,
3.792307, -3.61326, -5.831962,
3.792307, -3.61326, 5.910713,
3.792307, 3.765789, -5.831962,
3.792307, 3.765789, 5.910713
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
var radius = 8.307471;
var distance = 36.96088;
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
mvMatrix.translate( -0.2674316, -0.0762645, -0.03937578 );
mvMatrix.scale( 1.274116, 1.217257, 0.7649195 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.96088);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
dichloropropane_prop<-read.table("dichloropropane_prop.xyz", skip=1)
```

```
## Error in read.table("dichloropropane_prop.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-dichloropropane_prop$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
```

```r
y<-dichloropropane_prop$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
```

```r
z<-dichloropropane_prop$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichloropropane_prop' not found
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
-3.154777, 1.551434, -1.255364, 0, 0, 1, 1, 1,
-2.608982, -2.358193, -3.366934, 1, 0, 0, 1, 1,
-2.439128, 0.7250316, -0.08937099, 1, 0, 0, 1, 1,
-2.423781, 0.7248004, -2.933488, 1, 0, 0, 1, 1,
-2.400577, 0.1420127, -0.07755999, 1, 0, 0, 1, 1,
-2.363552, 0.05610453, -2.092215, 1, 0, 0, 1, 1,
-2.362422, 0.155455, -2.285422, 0, 0, 0, 1, 1,
-2.362079, 0.7930449, -2.748335, 0, 0, 0, 1, 1,
-2.318698, -0.9317598, -1.942035, 0, 0, 0, 1, 1,
-2.291203, 0.1586261, -2.828659, 0, 0, 0, 1, 1,
-2.279452, -0.3808091, -2.250993, 0, 0, 0, 1, 1,
-2.24687, 0.1277073, -1.520069, 0, 0, 0, 1, 1,
-2.234264, 0.7065473, -0.5710957, 0, 0, 0, 1, 1,
-2.224699, 0.9997394, 0.3619768, 1, 1, 1, 1, 1,
-2.212784, 0.4714732, -1.434365, 1, 1, 1, 1, 1,
-2.2125, -0.4875503, -2.849987, 1, 1, 1, 1, 1,
-2.209699, -0.7612809, -1.396127, 1, 1, 1, 1, 1,
-2.190126, 3.241415, 0.1226399, 1, 1, 1, 1, 1,
-2.18669, -1.412207, -4.282301, 1, 1, 1, 1, 1,
-2.109326, 0.9475889, -1.031407, 1, 1, 1, 1, 1,
-2.093514, -0.3516105, -2.324612, 1, 1, 1, 1, 1,
-2.074949, 1.411571, -2.051168, 1, 1, 1, 1, 1,
-2.006732, 1.852046, -0.6169756, 1, 1, 1, 1, 1,
-1.999299, -0.6891701, -3.03906, 1, 1, 1, 1, 1,
-1.985859, 0.05038025, -3.375951, 1, 1, 1, 1, 1,
-1.977257, 0.1761622, -0.5940862, 1, 1, 1, 1, 1,
-1.96769, -0.3441843, -0.1302155, 1, 1, 1, 1, 1,
-1.963208, 0.1902027, -0.2325556, 1, 1, 1, 1, 1,
-1.960508, -0.4863747, -1.591373, 0, 0, 1, 1, 1,
-1.906811, 0.6567632, -3.412013, 1, 0, 0, 1, 1,
-1.901128, 0.5629356, -1.458806, 1, 0, 0, 1, 1,
-1.897247, -0.4362317, -0.3767128, 1, 0, 0, 1, 1,
-1.892264, -0.1509339, -3.760478, 1, 0, 0, 1, 1,
-1.888866, 0.9670192, -0.6430507, 1, 0, 0, 1, 1,
-1.870885, -1.054839, -3.16968, 0, 0, 0, 1, 1,
-1.866572, 1.70526, -0.1280467, 0, 0, 0, 1, 1,
-1.852878, 1.157381, -0.871836, 0, 0, 0, 1, 1,
-1.845308, 1.443036, -1.949754, 0, 0, 0, 1, 1,
-1.83733, 1.762707, -0.9415303, 0, 0, 0, 1, 1,
-1.812738, -0.2162468, -2.202424, 0, 0, 0, 1, 1,
-1.811013, 1.513444, -0.2830227, 0, 0, 0, 1, 1,
-1.807993, 0.2376275, -0.5460234, 1, 1, 1, 1, 1,
-1.791819, 0.5611772, -2.217609, 1, 1, 1, 1, 1,
-1.783346, 0.3707881, -0.3812198, 1, 1, 1, 1, 1,
-1.763091, -1.047876, -1.436485, 1, 1, 1, 1, 1,
-1.756183, -0.5616201, -2.227852, 1, 1, 1, 1, 1,
-1.732034, -0.5459179, -1.657982, 1, 1, 1, 1, 1,
-1.72616, -0.8452362, -3.68405, 1, 1, 1, 1, 1,
-1.721146, 1.547988, -0.998121, 1, 1, 1, 1, 1,
-1.712852, 0.1999572, -1.437174, 1, 1, 1, 1, 1,
-1.704513, -0.5630121, -0.9863141, 1, 1, 1, 1, 1,
-1.701898, 1.95798, -1.304226, 1, 1, 1, 1, 1,
-1.701551, 0.5798973, -1.455828, 1, 1, 1, 1, 1,
-1.679614, 1.138412, -1.579681, 1, 1, 1, 1, 1,
-1.671748, -0.9870111, -1.08794, 1, 1, 1, 1, 1,
-1.643824, -0.75249, -0.7774813, 1, 1, 1, 1, 1,
-1.622786, 1.021145, -1.465688, 0, 0, 1, 1, 1,
-1.611693, -0.9025389, -2.506774, 1, 0, 0, 1, 1,
-1.575541, 0.6972166, 0.6804284, 1, 0, 0, 1, 1,
-1.572787, 1.736461, -1.11824, 1, 0, 0, 1, 1,
-1.568656, -2.567885, -2.861607, 1, 0, 0, 1, 1,
-1.558318, 1.124274, -1.429279, 1, 0, 0, 1, 1,
-1.553034, 1.431962, -2.175385, 0, 0, 0, 1, 1,
-1.549137, -0.1999614, -0.9102935, 0, 0, 0, 1, 1,
-1.530656, -0.4344899, -1.42769, 0, 0, 0, 1, 1,
-1.524192, 0.09033465, -0.3998766, 0, 0, 0, 1, 1,
-1.50391, -0.006404162, -0.127375, 0, 0, 0, 1, 1,
-1.500703, -0.03036818, 0.1667612, 0, 0, 0, 1, 1,
-1.49118, 0.318074, -0.9655328, 0, 0, 0, 1, 1,
-1.482453, 0.6738961, 0.04022536, 1, 1, 1, 1, 1,
-1.482051, -0.1201656, -1.452573, 1, 1, 1, 1, 1,
-1.479404, 1.562893, -1.733775, 1, 1, 1, 1, 1,
-1.477076, -0.2226434, -1.130499, 1, 1, 1, 1, 1,
-1.476408, 1.87812, -0.6219853, 1, 1, 1, 1, 1,
-1.463595, -0.004972978, -1.713778, 1, 1, 1, 1, 1,
-1.461844, 0.2521486, -0.1682167, 1, 1, 1, 1, 1,
-1.460097, -0.179957, -2.095629, 1, 1, 1, 1, 1,
-1.454055, 0.1368032, -2.915086, 1, 1, 1, 1, 1,
-1.453303, 0.1126546, -1.589879, 1, 1, 1, 1, 1,
-1.439231, 0.03318513, -2.213349, 1, 1, 1, 1, 1,
-1.434706, -0.6692979, -3.637037, 1, 1, 1, 1, 1,
-1.434247, -0.28104, -1.231534, 1, 1, 1, 1, 1,
-1.432077, -0.3901069, -1.058045, 1, 1, 1, 1, 1,
-1.430226, -1.354993, -2.447074, 1, 1, 1, 1, 1,
-1.418123, -0.06439481, -1.370758, 0, 0, 1, 1, 1,
-1.412252, 2.235313, -0.8006226, 1, 0, 0, 1, 1,
-1.40481, 0.2104125, -1.762742, 1, 0, 0, 1, 1,
-1.398565, 1.436268, 0.1515738, 1, 0, 0, 1, 1,
-1.397043, 1.388541, -0.7358716, 1, 0, 0, 1, 1,
-1.396621, 0.4163952, -1.090053, 1, 0, 0, 1, 1,
-1.392741, 0.604548, -0.6631215, 0, 0, 0, 1, 1,
-1.382247, -0.7647179, -2.036349, 0, 0, 0, 1, 1,
-1.380231, -0.04714736, -0.7354281, 0, 0, 0, 1, 1,
-1.372749, 0.07293005, -2.213162, 0, 0, 0, 1, 1,
-1.37142, -1.384476, -2.749682, 0, 0, 0, 1, 1,
-1.363929, -1.109217, -3.295874, 0, 0, 0, 1, 1,
-1.35954, 1.576263, 0.05433565, 0, 0, 0, 1, 1,
-1.356008, -0.4730234, -2.448256, 1, 1, 1, 1, 1,
-1.353394, 0.3113735, -0.2811884, 1, 1, 1, 1, 1,
-1.350613, 1.255101, 0.1560211, 1, 1, 1, 1, 1,
-1.335335, 0.08173588, -0.4237176, 1, 1, 1, 1, 1,
-1.322483, 1.807699, -1.226951, 1, 1, 1, 1, 1,
-1.310082, 1.191313, -0.9672623, 1, 1, 1, 1, 1,
-1.309819, -0.9621686, -3.20326, 1, 1, 1, 1, 1,
-1.30038, -1.112974, -4.640197, 1, 1, 1, 1, 1,
-1.288679, -0.7647641, -2.496055, 1, 1, 1, 1, 1,
-1.288578, 0.8027977, -1.254373, 1, 1, 1, 1, 1,
-1.288465, -0.07603787, -0.7606353, 1, 1, 1, 1, 1,
-1.286556, 0.9418681, -0.8425958, 1, 1, 1, 1, 1,
-1.280105, -1.134145, -1.874202, 1, 1, 1, 1, 1,
-1.279072, 0.3327647, -0.5779026, 1, 1, 1, 1, 1,
-1.278666, -0.1692931, -3.067727, 1, 1, 1, 1, 1,
-1.270355, 0.8079374, -1.29032, 0, 0, 1, 1, 1,
-1.263903, 0.02126448, -1.71693, 1, 0, 0, 1, 1,
-1.259502, 0.8266003, -1.823373, 1, 0, 0, 1, 1,
-1.255415, -0.1165172, -1.652035, 1, 0, 0, 1, 1,
-1.242772, -0.7952152, -1.747409, 1, 0, 0, 1, 1,
-1.231031, -2.125632, -3.565321, 1, 0, 0, 1, 1,
-1.217835, -1.50701, -1.188367, 0, 0, 0, 1, 1,
-1.215513, 1.502884, -1.048056, 0, 0, 0, 1, 1,
-1.212902, -0.8670525, -1.796312, 0, 0, 0, 1, 1,
-1.202723, 1.030371, -0.9464758, 0, 0, 0, 1, 1,
-1.177935, 0.8326563, -0.914212, 0, 0, 0, 1, 1,
-1.176551, 0.9815845, -1.391281, 0, 0, 0, 1, 1,
-1.172225, 0.2843758, 0.5017968, 0, 0, 0, 1, 1,
-1.17193, -0.3630375, -1.000491, 1, 1, 1, 1, 1,
-1.17056, -0.3973599, -2.137299, 1, 1, 1, 1, 1,
-1.16809, 1.704059, -1.112556, 1, 1, 1, 1, 1,
-1.166801, 0.1977211, -0.9152189, 1, 1, 1, 1, 1,
-1.164416, -2.458089, -4.42034, 1, 1, 1, 1, 1,
-1.15913, 1.529093, 0.1497444, 1, 1, 1, 1, 1,
-1.152214, 1.096232, -0.4073497, 1, 1, 1, 1, 1,
-1.13929, 1.121109, -1.136912, 1, 1, 1, 1, 1,
-1.13917, 1.251138, -0.04047785, 1, 1, 1, 1, 1,
-1.131187, -1.01042, -2.774304, 1, 1, 1, 1, 1,
-1.124195, -1.212658, -1.787066, 1, 1, 1, 1, 1,
-1.118385, 1.895949, -0.8483517, 1, 1, 1, 1, 1,
-1.116231, 0.5668294, -0.008016995, 1, 1, 1, 1, 1,
-1.115017, 0.1928247, -1.359763, 1, 1, 1, 1, 1,
-1.111504, -0.3802722, -1.42108, 1, 1, 1, 1, 1,
-1.110112, -0.5755906, -1.614179, 0, 0, 1, 1, 1,
-1.104737, 0.3068791, -0.3713583, 1, 0, 0, 1, 1,
-1.098817, -0.253417, -1.37306, 1, 0, 0, 1, 1,
-1.097772, -0.5195566, -1.813811, 1, 0, 0, 1, 1,
-1.095201, 1.306555, -0.4033653, 1, 0, 0, 1, 1,
-1.088265, 1.59998, -3.290378, 1, 0, 0, 1, 1,
-1.088117, 1.55185, -1.544673, 0, 0, 0, 1, 1,
-1.074539, -1.014357, -2.054056, 0, 0, 0, 1, 1,
-1.061445, 0.5925406, 0.6781192, 0, 0, 0, 1, 1,
-1.059643, 0.5037073, -3.026218, 0, 0, 0, 1, 1,
-1.055681, -0.04561155, -2.697098, 0, 0, 0, 1, 1,
-1.052946, 0.09933827, -1.292504, 0, 0, 0, 1, 1,
-1.042553, -1.841691, -4.655766, 0, 0, 0, 1, 1,
-1.040926, -0.587619, -2.966662, 1, 1, 1, 1, 1,
-1.036464, -1.366065, -2.4568, 1, 1, 1, 1, 1,
-1.035917, -0.7456549, -4.145577, 1, 1, 1, 1, 1,
-1.035542, -1.513826, -4.796812, 1, 1, 1, 1, 1,
-1.033882, 0.7942168, -1.311168, 1, 1, 1, 1, 1,
-1.028305, -0.7385287, -1.922533, 1, 1, 1, 1, 1,
-1.016626, -0.9126847, -1.282518, 1, 1, 1, 1, 1,
-1.015582, -0.8453049, -1.648793, 1, 1, 1, 1, 1,
-1.001988, 1.548861, 0.3000368, 1, 1, 1, 1, 1,
-0.9968874, -0.7123425, -3.05744, 1, 1, 1, 1, 1,
-0.9940934, 0.285977, -2.543886, 1, 1, 1, 1, 1,
-0.9940343, 0.5192117, -0.5832655, 1, 1, 1, 1, 1,
-0.985674, -1.408429, -2.167592, 1, 1, 1, 1, 1,
-0.984906, 0.8322618, -0.6240146, 1, 1, 1, 1, 1,
-0.9837239, 1.494083, 1.180825, 1, 1, 1, 1, 1,
-0.9802445, 0.2956306, -1.005908, 0, 0, 1, 1, 1,
-0.9767904, 0.1036957, -0.03865809, 1, 0, 0, 1, 1,
-0.9726286, 2.76122, -0.300229, 1, 0, 0, 1, 1,
-0.9721553, -1.241083, -1.536666, 1, 0, 0, 1, 1,
-0.9593626, -0.1754481, -1.606617, 1, 0, 0, 1, 1,
-0.9581964, 0.08225331, -1.938226, 1, 0, 0, 1, 1,
-0.9566792, 2.440767, -0.9740692, 0, 0, 0, 1, 1,
-0.9518229, 0.8516639, -2.426098, 0, 0, 0, 1, 1,
-0.9458787, -1.028462, -3.350616, 0, 0, 0, 1, 1,
-0.9419451, 2.386181, -0.2607119, 0, 0, 0, 1, 1,
-0.9405556, -0.9036233, -0.7282867, 0, 0, 0, 1, 1,
-0.9381269, -1.600271, -0.9794996, 0, 0, 0, 1, 1,
-0.9365187, 0.6863829, -0.4976934, 0, 0, 0, 1, 1,
-0.9311046, 0.7756122, 0.4345553, 1, 1, 1, 1, 1,
-0.9237973, 1.22725, -0.4313201, 1, 1, 1, 1, 1,
-0.9232678, -0.3592137, -2.517519, 1, 1, 1, 1, 1,
-0.9228442, -2.353878, -3.604714, 1, 1, 1, 1, 1,
-0.9213297, -1.471655, -2.271024, 1, 1, 1, 1, 1,
-0.9160618, -1.169606, -0.9724382, 1, 1, 1, 1, 1,
-0.9110542, -1.40298, -3.263165, 1, 1, 1, 1, 1,
-0.9088912, 0.2317404, 0.05363389, 1, 1, 1, 1, 1,
-0.9072377, -0.2572052, -0.4351061, 1, 1, 1, 1, 1,
-0.9048349, -0.4013289, -0.7542358, 1, 1, 1, 1, 1,
-0.9024569, -1.373262, -2.700907, 1, 1, 1, 1, 1,
-0.8997577, 0.9152433, -2.423069, 1, 1, 1, 1, 1,
-0.8887275, -0.1883463, -0.8172234, 1, 1, 1, 1, 1,
-0.8887151, 1.263963, -1.376372, 1, 1, 1, 1, 1,
-0.8875267, -0.9966722, -1.761739, 1, 1, 1, 1, 1,
-0.8873262, 0.9753451, -0.6199027, 0, 0, 1, 1, 1,
-0.8865018, -0.3052627, 0.4588589, 1, 0, 0, 1, 1,
-0.8814942, -0.3211464, -3.648782, 1, 0, 0, 1, 1,
-0.8794497, -0.9674714, -1.146335, 1, 0, 0, 1, 1,
-0.8751925, -0.4730792, -2.801996, 1, 0, 0, 1, 1,
-0.8681344, -1.954791, -3.073964, 1, 0, 0, 1, 1,
-0.8601992, -0.7875586, -1.22761, 0, 0, 0, 1, 1,
-0.855585, 1.152401, -0.04226714, 0, 0, 0, 1, 1,
-0.854101, 1.851204, -2.921768, 0, 0, 0, 1, 1,
-0.8513648, 0.3525431, -2.512093, 0, 0, 0, 1, 1,
-0.8362033, -0.05760641, 0.7647762, 0, 0, 0, 1, 1,
-0.8338455, -2.022092, -3.3617, 0, 0, 0, 1, 1,
-0.8275381, -1.805455, -3.680091, 0, 0, 0, 1, 1,
-0.8251104, -0.2458126, -1.397081, 1, 1, 1, 1, 1,
-0.8245476, 0.6083608, 0.4125114, 1, 1, 1, 1, 1,
-0.8223699, 0.007989956, -1.190782, 1, 1, 1, 1, 1,
-0.8139399, -3.505798, -4.207902, 1, 1, 1, 1, 1,
-0.8054916, -0.7627681, -2.588616, 1, 1, 1, 1, 1,
-0.8051665, 1.016132, 1.28377, 1, 1, 1, 1, 1,
-0.8015156, -0.318518, -1.088074, 1, 1, 1, 1, 1,
-0.7875589, -1.198642, -3.38793, 1, 1, 1, 1, 1,
-0.7862695, -0.5135489, -1.110025, 1, 1, 1, 1, 1,
-0.7808279, -0.1719166, -0.9658955, 1, 1, 1, 1, 1,
-0.772998, 1.02375, -1.998229, 1, 1, 1, 1, 1,
-0.7702485, -0.7535437, -1.4913, 1, 1, 1, 1, 1,
-0.7700701, 0.7250211, -0.7535086, 1, 1, 1, 1, 1,
-0.7666752, 0.04526109, -1.793279, 1, 1, 1, 1, 1,
-0.7644922, 0.9543424, 0.3228861, 1, 1, 1, 1, 1,
-0.763097, 1.388494, -0.1539222, 0, 0, 1, 1, 1,
-0.7623422, -0.3567538, -2.011995, 1, 0, 0, 1, 1,
-0.7616301, -1.558672, -1.672191, 1, 0, 0, 1, 1,
-0.7601259, -1.065324, -3.089668, 1, 0, 0, 1, 1,
-0.7557514, -0.5276533, -0.5754329, 1, 0, 0, 1, 1,
-0.7545179, -0.6640772, -2.676727, 1, 0, 0, 1, 1,
-0.7528498, -0.3485087, -1.806296, 0, 0, 0, 1, 1,
-0.747959, 0.06260967, -0.2006409, 0, 0, 0, 1, 1,
-0.7470468, 0.2102546, 0.1009468, 0, 0, 0, 1, 1,
-0.746388, -0.9691055, -3.343904, 0, 0, 0, 1, 1,
-0.7407757, 0.1299764, 0.03351565, 0, 0, 0, 1, 1,
-0.7373756, -1.054051, -0.3998254, 0, 0, 0, 1, 1,
-0.7331358, -1.310986, -4.704956, 0, 0, 0, 1, 1,
-0.7296611, 2.931416, 0.9689574, 1, 1, 1, 1, 1,
-0.7296469, -1.288314, -3.320307, 1, 1, 1, 1, 1,
-0.7295329, 0.5186606, 0.3458841, 1, 1, 1, 1, 1,
-0.7235605, -0.42389, -2.099919, 1, 1, 1, 1, 1,
-0.7230828, 0.09106654, -2.414902, 1, 1, 1, 1, 1,
-0.7198296, -1.234391, -1.64546, 1, 1, 1, 1, 1,
-0.7196183, -0.9792162, -1.699946, 1, 1, 1, 1, 1,
-0.7190751, -0.6160875, -3.01504, 1, 1, 1, 1, 1,
-0.7168468, -0.740954, -1.106491, 1, 1, 1, 1, 1,
-0.7082072, 0.435147, -5.276281, 1, 1, 1, 1, 1,
-0.7059339, 0.1574731, -1.005524, 1, 1, 1, 1, 1,
-0.7046585, 0.1736524, -1.284129, 1, 1, 1, 1, 1,
-0.7018793, 0.5916716, -1.074753, 1, 1, 1, 1, 1,
-0.6987472, 3.658327, -0.1729835, 1, 1, 1, 1, 1,
-0.6986777, 1.75465, 1.19255, 1, 1, 1, 1, 1,
-0.6982411, 0.6104915, -1.489446, 0, 0, 1, 1, 1,
-0.6953625, -0.3130372, -2.313611, 1, 0, 0, 1, 1,
-0.6936505, -0.399219, -1.4413, 1, 0, 0, 1, 1,
-0.6826649, -0.3754234, -0.8405772, 1, 0, 0, 1, 1,
-0.678073, 0.9587306, -0.4159291, 1, 0, 0, 1, 1,
-0.6768643, -2.237475, -3.487328, 1, 0, 0, 1, 1,
-0.6764019, -0.1401898, -2.526123, 0, 0, 0, 1, 1,
-0.675841, -0.8012893, -1.322039, 0, 0, 0, 1, 1,
-0.674991, 0.6910362, -0.1100463, 0, 0, 0, 1, 1,
-0.6709361, -0.1849422, -2.67949, 0, 0, 0, 1, 1,
-0.6670294, 0.4639233, -1.077301, 0, 0, 0, 1, 1,
-0.6523301, -0.2736711, -2.358255, 0, 0, 0, 1, 1,
-0.6489349, -0.5878101, -3.411879, 0, 0, 0, 1, 1,
-0.6476937, -0.2641902, -3.111258, 1, 1, 1, 1, 1,
-0.6345924, -0.2682177, -1.371411, 1, 1, 1, 1, 1,
-0.6305259, 0.458571, -1.162382, 1, 1, 1, 1, 1,
-0.6274582, -0.4372002, -2.013765, 1, 1, 1, 1, 1,
-0.6195965, -0.7684236, -4.550917, 1, 1, 1, 1, 1,
-0.6191237, -1.079906, -5.007561, 1, 1, 1, 1, 1,
-0.6187819, 0.2787418, -1.523723, 1, 1, 1, 1, 1,
-0.6185035, -0.526766, -2.915986, 1, 1, 1, 1, 1,
-0.6161898, 0.1140148, -2.26709, 1, 1, 1, 1, 1,
-0.6069493, 0.4192271, -0.313614, 1, 1, 1, 1, 1,
-0.6055571, -0.07915949, -2.21403, 1, 1, 1, 1, 1,
-0.6036608, -1.332036, -3.905607, 1, 1, 1, 1, 1,
-0.603469, 1.023728, -1.672064, 1, 1, 1, 1, 1,
-0.602367, 0.04789613, -0.8507363, 1, 1, 1, 1, 1,
-0.6005156, -1.396027, -2.894554, 1, 1, 1, 1, 1,
-0.5991208, 1.09004, -0.7532888, 0, 0, 1, 1, 1,
-0.5948017, -0.266555, -2.599241, 1, 0, 0, 1, 1,
-0.5842745, -0.08102652, -1.354037, 1, 0, 0, 1, 1,
-0.5832893, -1.196544, -3.016545, 1, 0, 0, 1, 1,
-0.5799837, 0.1973849, -1.590851, 1, 0, 0, 1, 1,
-0.5777615, -1.613437, -3.532489, 1, 0, 0, 1, 1,
-0.5726087, 0.3078931, 0.7812569, 0, 0, 0, 1, 1,
-0.5713104, -0.4559654, -3.865222, 0, 0, 0, 1, 1,
-0.5678738, -1.429295, -3.50142, 0, 0, 0, 1, 1,
-0.5638872, 0.1116812, -2.021421, 0, 0, 0, 1, 1,
-0.5566556, 1.058637, 1.162509, 0, 0, 0, 1, 1,
-0.5506265, -1.120462, -3.887739, 0, 0, 0, 1, 1,
-0.5455499, -1.253487, -3.512135, 0, 0, 0, 1, 1,
-0.5435081, 1.40498, -1.03289, 1, 1, 1, 1, 1,
-0.5414927, 0.6707752, -4.060601, 1, 1, 1, 1, 1,
-0.5396517, -0.5712091, -4.075183, 1, 1, 1, 1, 1,
-0.5295349, -0.5797113, -3.34699, 1, 1, 1, 1, 1,
-0.529165, -0.4195846, -1.52423, 1, 1, 1, 1, 1,
-0.5197105, -0.8540431, -1.412571, 1, 1, 1, 1, 1,
-0.5193748, 1.138535, 0.2140295, 1, 1, 1, 1, 1,
-0.519353, 1.187676, -0.5599127, 1, 1, 1, 1, 1,
-0.5174488, -0.3027094, -2.786575, 1, 1, 1, 1, 1,
-0.5161592, 0.5607983, -0.7924795, 1, 1, 1, 1, 1,
-0.5156084, -2.380418, -1.957838, 1, 1, 1, 1, 1,
-0.5134323, -0.2687539, -2.258561, 1, 1, 1, 1, 1,
-0.5096206, -0.6344393, -1.79143, 1, 1, 1, 1, 1,
-0.507704, 0.4789686, -1.826344, 1, 1, 1, 1, 1,
-0.5043461, 1.932179, 0.4244458, 1, 1, 1, 1, 1,
-0.5022032, 0.2833861, 0.6853247, 0, 0, 1, 1, 1,
-0.4992695, 1.097023, -0.0009145132, 1, 0, 0, 1, 1,
-0.4978524, -0.6769644, -2.349444, 1, 0, 0, 1, 1,
-0.4926334, -0.1444886, -0.5031062, 1, 0, 0, 1, 1,
-0.492108, 0.4746501, -0.7412984, 1, 0, 0, 1, 1,
-0.4866691, 0.3391384, -0.09787957, 1, 0, 0, 1, 1,
-0.48398, 0.5771647, 0.007977386, 0, 0, 0, 1, 1,
-0.482969, 1.120134, 0.7638047, 0, 0, 0, 1, 1,
-0.4720434, -0.6645003, -4.36548, 0, 0, 0, 1, 1,
-0.4674392, -0.02363637, 0.04681914, 0, 0, 0, 1, 1,
-0.4648741, 0.04860754, -1.294415, 0, 0, 0, 1, 1,
-0.459812, -1.569268, -3.247552, 0, 0, 0, 1, 1,
-0.4577356, 0.2946562, -1.533263, 0, 0, 0, 1, 1,
-0.4445763, -0.860038, -3.625824, 1, 1, 1, 1, 1,
-0.4435958, -0.2057672, -0.4676523, 1, 1, 1, 1, 1,
-0.4432327, 1.146018, -1.236041, 1, 1, 1, 1, 1,
-0.4430518, 1.627834, -0.9436405, 1, 1, 1, 1, 1,
-0.4389561, 0.6008745, -1.154511, 1, 1, 1, 1, 1,
-0.4389508, 1.829049, 1.38958, 1, 1, 1, 1, 1,
-0.4341566, -1.403444, -1.509666, 1, 1, 1, 1, 1,
-0.4316895, 1.512757, -1.530442, 1, 1, 1, 1, 1,
-0.431135, 2.206729, 0.09211725, 1, 1, 1, 1, 1,
-0.4299922, 0.7792446, -0.8556799, 1, 1, 1, 1, 1,
-0.4298691, -0.5420632, -3.125408, 1, 1, 1, 1, 1,
-0.4285868, -0.4558775, -2.523777, 1, 1, 1, 1, 1,
-0.4269204, 0.4903663, -2.535513, 1, 1, 1, 1, 1,
-0.4255697, 1.093967, 0.08877805, 1, 1, 1, 1, 1,
-0.4253864, -1.214662, -2.444473, 1, 1, 1, 1, 1,
-0.423427, -0.3975083, -2.061838, 0, 0, 1, 1, 1,
-0.4230487, 0.8764523, -1.95652, 1, 0, 0, 1, 1,
-0.4173438, 0.6988145, -1.65497, 1, 0, 0, 1, 1,
-0.4167801, -0.5783629, -1.637156, 1, 0, 0, 1, 1,
-0.4144401, 1.378958, -0.0739551, 1, 0, 0, 1, 1,
-0.4132105, -0.07256331, -1.040023, 1, 0, 0, 1, 1,
-0.4130473, 0.666985, -0.9294991, 0, 0, 0, 1, 1,
-0.4088053, 2.008065, -0.4975728, 0, 0, 0, 1, 1,
-0.4010949, 0.5552352, 0.7354824, 0, 0, 0, 1, 1,
-0.3997133, 0.5682427, -0.05903601, 0, 0, 0, 1, 1,
-0.3985798, -0.9099735, -4.283711, 0, 0, 0, 1, 1,
-0.3881633, -0.4729368, -3.015953, 0, 0, 0, 1, 1,
-0.3854426, 1.438539, -1.308045, 0, 0, 0, 1, 1,
-0.3821933, 1.644011, -1.445587, 1, 1, 1, 1, 1,
-0.3801081, 0.9551989, -1.388308, 1, 1, 1, 1, 1,
-0.3725656, 1.396875, 0.3823472, 1, 1, 1, 1, 1,
-0.371651, -0.2457158, -1.909369, 1, 1, 1, 1, 1,
-0.3712054, -0.3158054, -2.026808, 1, 1, 1, 1, 1,
-0.362323, -1.390406, -3.926291, 1, 1, 1, 1, 1,
-0.3512691, 0.1230345, -1.942433, 1, 1, 1, 1, 1,
-0.3510982, -0.7995962, -1.354803, 1, 1, 1, 1, 1,
-0.3510615, 0.9870315, 0.3379022, 1, 1, 1, 1, 1,
-0.3505948, 0.3774291, -0.5769782, 1, 1, 1, 1, 1,
-0.3478357, -0.9411925, -1.142412, 1, 1, 1, 1, 1,
-0.3458557, -0.5907207, -3.671315, 1, 1, 1, 1, 1,
-0.3425231, -0.754287, -4.310853, 1, 1, 1, 1, 1,
-0.3371498, 1.156117, -0.5747836, 1, 1, 1, 1, 1,
-0.3371431, 1.487505, 0.1462463, 1, 1, 1, 1, 1,
-0.3359401, -0.02139103, -1.757983, 0, 0, 1, 1, 1,
-0.335816, 0.7935936, 0.718068, 1, 0, 0, 1, 1,
-0.3313352, 0.6703981, -1.112356, 1, 0, 0, 1, 1,
-0.3276038, 0.9348951, -2.372757, 1, 0, 0, 1, 1,
-0.3214591, 1.135479, 1.749617, 1, 0, 0, 1, 1,
-0.31501, -1.392109, -1.828674, 1, 0, 0, 1, 1,
-0.3117602, 1.259014, -0.3347024, 0, 0, 0, 1, 1,
-0.3116356, -0.1483285, -1.458527, 0, 0, 0, 1, 1,
-0.3110435, 0.03779019, -2.115243, 0, 0, 0, 1, 1,
-0.2999673, 0.6565617, -2.55918, 0, 0, 0, 1, 1,
-0.2977852, 0.2424919, -1.651449, 0, 0, 0, 1, 1,
-0.2908655, 0.2715839, -1.915372, 0, 0, 0, 1, 1,
-0.2897831, 0.7228245, 1.05172, 0, 0, 0, 1, 1,
-0.2877826, 1.093477, -0.6602883, 1, 1, 1, 1, 1,
-0.2863869, 0.08245144, 0.5643619, 1, 1, 1, 1, 1,
-0.2832005, -0.6980839, -3.90662, 1, 1, 1, 1, 1,
-0.2823108, 0.2445845, -2.556414, 1, 1, 1, 1, 1,
-0.2803348, -0.9939539, -2.866853, 1, 1, 1, 1, 1,
-0.2756542, -0.09024058, -0.3347298, 1, 1, 1, 1, 1,
-0.271595, 0.7285403, -0.6659973, 1, 1, 1, 1, 1,
-0.2707339, -0.9237111, -4.447652, 1, 1, 1, 1, 1,
-0.2664191, 0.4749895, -0.5459324, 1, 1, 1, 1, 1,
-0.2658934, -0.7847924, -4.26942, 1, 1, 1, 1, 1,
-0.2625472, -1.708716, -5.083296, 1, 1, 1, 1, 1,
-0.2612202, -1.556226, -2.655669, 1, 1, 1, 1, 1,
-0.2595867, -0.5423731, -1.321417, 1, 1, 1, 1, 1,
-0.2549568, 0.0555101, -1.516809, 1, 1, 1, 1, 1,
-0.2538512, -2.061305, -4.128007, 1, 1, 1, 1, 1,
-0.2488414, -1.836578, -4.01854, 0, 0, 1, 1, 1,
-0.2470122, -0.7102931, -2.107032, 1, 0, 0, 1, 1,
-0.2463159, -0.6099034, -1.536945, 1, 0, 0, 1, 1,
-0.2459355, -0.7147131, -1.251084, 1, 0, 0, 1, 1,
-0.2454623, -1.214584, -3.121757, 1, 0, 0, 1, 1,
-0.2441582, -0.07081205, -1.585068, 1, 0, 0, 1, 1,
-0.2407466, 0.196727, -0.5960864, 0, 0, 0, 1, 1,
-0.2382942, 0.8925253, -0.8830655, 0, 0, 0, 1, 1,
-0.2366627, 0.5130896, -2.263249, 0, 0, 0, 1, 1,
-0.2364591, -0.0152908, 1.65185, 0, 0, 0, 1, 1,
-0.2340887, -0.2501153, -2.37625, 0, 0, 0, 1, 1,
-0.231458, 1.937392, 0.3090765, 0, 0, 0, 1, 1,
-0.2307988, -0.3256937, -4.05325, 0, 0, 0, 1, 1,
-0.2291284, -0.1956441, -1.735751, 1, 1, 1, 1, 1,
-0.2290902, 0.2522981, -0.5439092, 1, 1, 1, 1, 1,
-0.2287892, 1.424999, 0.9661976, 1, 1, 1, 1, 1,
-0.2204229, 0.31366, -0.8434758, 1, 1, 1, 1, 1,
-0.2200581, -1.289871, -2.841566, 1, 1, 1, 1, 1,
-0.219867, -0.9995281, -2.889346, 1, 1, 1, 1, 1,
-0.2083955, 2.058433, 1.184296, 1, 1, 1, 1, 1,
-0.2042631, -0.4759788, -2.756821, 1, 1, 1, 1, 1,
-0.2034489, 1.078546, 0.2029276, 1, 1, 1, 1, 1,
-0.2013059, -0.1668985, -2.898818, 1, 1, 1, 1, 1,
-0.1987071, -0.3162482, -1.184425, 1, 1, 1, 1, 1,
-0.1955302, -0.06417201, -2.880135, 1, 1, 1, 1, 1,
-0.1910354, -0.1102962, -3.241324, 1, 1, 1, 1, 1,
-0.1891572, 1.332706, 0.7125152, 1, 1, 1, 1, 1,
-0.1858788, -0.2551024, -2.619393, 1, 1, 1, 1, 1,
-0.1787296, 2.224233, 0.7550775, 0, 0, 1, 1, 1,
-0.1770523, -1.85557, -2.808662, 1, 0, 0, 1, 1,
-0.1748809, 0.003301342, -2.224334, 1, 0, 0, 1, 1,
-0.1739425, 0.2110729, -0.409916, 1, 0, 0, 1, 1,
-0.1713494, 0.04180908, -1.875711, 1, 0, 0, 1, 1,
-0.1678527, 0.7962857, 1.206272, 1, 0, 0, 1, 1,
-0.1641651, -0.6137255, -4.214416, 0, 0, 0, 1, 1,
-0.1621426, 0.5876541, -1.618465, 0, 0, 0, 1, 1,
-0.1547821, -0.1726818, -2.317822, 0, 0, 0, 1, 1,
-0.1460329, 0.5443467, 0.527841, 0, 0, 0, 1, 1,
-0.1455899, 0.1596552, 0.3681425, 0, 0, 0, 1, 1,
-0.1390476, -0.02758664, -1.790159, 0, 0, 0, 1, 1,
-0.1298178, -1.162824, -3.102671, 0, 0, 0, 1, 1,
-0.127734, -1.896196, -5.660952, 1, 1, 1, 1, 1,
-0.1275291, -0.1118086, -2.234969, 1, 1, 1, 1, 1,
-0.1210578, 0.03741565, -1.63228, 1, 1, 1, 1, 1,
-0.1188741, -0.7383458, -2.014447, 1, 1, 1, 1, 1,
-0.1183254, 0.8431058, 0.3221303, 1, 1, 1, 1, 1,
-0.1174299, 0.671703, 0.07156178, 1, 1, 1, 1, 1,
-0.1169842, 0.931143, 0.2806821, 1, 1, 1, 1, 1,
-0.1112366, 0.3768218, -0.08623484, 1, 1, 1, 1, 1,
-0.1095811, -0.2885312, -4.575219, 1, 1, 1, 1, 1,
-0.1082014, -0.003074909, -1.887938, 1, 1, 1, 1, 1,
-0.1047579, 0.07982428, -2.056254, 1, 1, 1, 1, 1,
-0.1042558, 0.8630862, -0.3359217, 1, 1, 1, 1, 1,
-0.1040808, -0.1084202, -3.411465, 1, 1, 1, 1, 1,
-0.1019824, 0.1829403, -0.2524264, 1, 1, 1, 1, 1,
-0.09874373, 0.3018368, -0.6277342, 1, 1, 1, 1, 1,
-0.09747697, -2.429252, -3.484711, 0, 0, 1, 1, 1,
-0.09745879, -0.1852468, -0.4601589, 1, 0, 0, 1, 1,
-0.0961425, 0.01196346, -1.170503, 1, 0, 0, 1, 1,
-0.09389134, 1.330414, 0.5716379, 1, 0, 0, 1, 1,
-0.09386537, 0.7073265, 0.8282473, 1, 0, 0, 1, 1,
-0.09169123, 0.4861163, 0.3051031, 1, 0, 0, 1, 1,
-0.08761084, 0.8963531, 0.3598743, 0, 0, 0, 1, 1,
-0.08720899, 2.283299, 1.193034, 0, 0, 0, 1, 1,
-0.08242808, 0.03426057, -0.1018373, 0, 0, 0, 1, 1,
-0.08091272, -0.1603612, -2.493166, 0, 0, 0, 1, 1,
-0.08042886, 0.8531907, -0.2780176, 0, 0, 0, 1, 1,
-0.08032643, -0.9647406, -3.647419, 0, 0, 0, 1, 1,
-0.0751782, 0.435124, 0.6652678, 0, 0, 0, 1, 1,
-0.06847336, -0.2391178, -3.285435, 1, 1, 1, 1, 1,
-0.0683351, 0.5915858, 0.1263807, 1, 1, 1, 1, 1,
-0.06555233, 0.646918, 0.07428823, 1, 1, 1, 1, 1,
-0.0647959, -2.415334, -3.491032, 1, 1, 1, 1, 1,
-0.06280646, 0.1909396, -0.1258741, 1, 1, 1, 1, 1,
-0.06158416, -0.365675, -1.708856, 1, 1, 1, 1, 1,
-0.05821871, 1.586828, 1.111978, 1, 1, 1, 1, 1,
-0.05804829, -1.166116, -2.650287, 1, 1, 1, 1, 1,
-0.05408531, -0.8245392, -4.284205, 1, 1, 1, 1, 1,
-0.05279383, 0.4197683, -0.1515661, 1, 1, 1, 1, 1,
-0.05010536, 1.326887, -0.1052076, 1, 1, 1, 1, 1,
-0.0497357, 0.7054662, -0.7399279, 1, 1, 1, 1, 1,
-0.0442816, -0.1967527, -2.806151, 1, 1, 1, 1, 1,
-0.04315226, -1.110172, -2.433931, 1, 1, 1, 1, 1,
-0.04099064, -0.7160185, -1.96511, 1, 1, 1, 1, 1,
-0.04096228, -0.4186642, -4.021108, 0, 0, 1, 1, 1,
-0.04060853, -0.2559573, -4.216817, 1, 0, 0, 1, 1,
-0.03700885, -0.1773973, -2.443201, 1, 0, 0, 1, 1,
-0.03290885, 0.3599775, -0.266258, 1, 0, 0, 1, 1,
-0.0308986, -1.131834, -1.091286, 1, 0, 0, 1, 1,
-0.02935412, -1.117883, -3.018594, 1, 0, 0, 1, 1,
-0.02747973, -0.5973561, -2.087249, 0, 0, 0, 1, 1,
-0.02539706, 0.6170843, 0.4523609, 0, 0, 0, 1, 1,
-0.02469674, -0.6760732, -4.620155, 0, 0, 0, 1, 1,
-0.02001354, 0.3425387, -0.2653146, 0, 0, 0, 1, 1,
-0.01494054, -1.855367, -3.957655, 0, 0, 0, 1, 1,
-0.01344747, -0.5476084, -2.157644, 0, 0, 0, 1, 1,
-0.01024602, -0.7081903, -2.263226, 0, 0, 0, 1, 1,
-0.008880416, -0.2423655, -3.428226, 1, 1, 1, 1, 1,
-0.008457711, 0.3314049, -0.5101862, 1, 1, 1, 1, 1,
-0.005715089, 2.705223, -0.5158409, 1, 1, 1, 1, 1,
-0.002604484, 1.550952, -0.4104859, 1, 1, 1, 1, 1,
-0.001442704, -0.3559656, -3.994891, 1, 1, 1, 1, 1,
-0.0002526689, -1.325895, -2.273463, 1, 1, 1, 1, 1,
0.0004722898, -1.017719, 3.515815, 1, 1, 1, 1, 1,
0.005378209, -0.8490595, 2.58631, 1, 1, 1, 1, 1,
0.005588502, -1.232808, 2.914607, 1, 1, 1, 1, 1,
0.006025914, -1.202607, 5.426584, 1, 1, 1, 1, 1,
0.006787597, 0.4856292, -0.1603247, 1, 1, 1, 1, 1,
0.00741222, -0.8403173, 3.493393, 1, 1, 1, 1, 1,
0.007699354, -0.5027869, 3.970772, 1, 1, 1, 1, 1,
0.01107835, -0.6611559, 2.586011, 1, 1, 1, 1, 1,
0.01564791, -0.2358512, 4.244931, 1, 1, 1, 1, 1,
0.02768807, -0.8024934, 5.436155, 0, 0, 1, 1, 1,
0.03025348, 0.763862, 1.746188, 1, 0, 0, 1, 1,
0.03193422, 0.7452846, 0.3081076, 1, 0, 0, 1, 1,
0.03205448, 0.5549296, 0.3151902, 1, 0, 0, 1, 1,
0.033263, 0.6122343, -1.183899, 1, 0, 0, 1, 1,
0.03732624, 1.759036, 0.71031, 1, 0, 0, 1, 1,
0.04158564, 0.07731915, 0.4350736, 0, 0, 0, 1, 1,
0.04748861, -2.442308, 3.352695, 0, 0, 0, 1, 1,
0.04770982, 1.540218, -0.3310458, 0, 0, 0, 1, 1,
0.04788175, -1.014709, 1.760239, 0, 0, 0, 1, 1,
0.05132535, -0.2423407, 2.473743, 0, 0, 0, 1, 1,
0.0523869, -0.316334, 4.337601, 0, 0, 0, 1, 1,
0.05253165, 0.3984974, 0.308614, 0, 0, 0, 1, 1,
0.05369097, -0.5960497, 2.326666, 1, 1, 1, 1, 1,
0.05534796, 0.499968, -0.05448871, 1, 1, 1, 1, 1,
0.05721259, -0.5678645, 5.739703, 1, 1, 1, 1, 1,
0.06162165, -0.6931478, 1.514369, 1, 1, 1, 1, 1,
0.06611364, 0.2773335, 0.02903451, 1, 1, 1, 1, 1,
0.06703714, -1.367936, 3.212502, 1, 1, 1, 1, 1,
0.07222105, -1.239103, 4.054071, 1, 1, 1, 1, 1,
0.07747486, -0.1397974, 4.327365, 1, 1, 1, 1, 1,
0.08571421, -0.1642428, 4.704235, 1, 1, 1, 1, 1,
0.08581499, -0.1572461, 3.086595, 1, 1, 1, 1, 1,
0.08694397, -1.615008, 3.10654, 1, 1, 1, 1, 1,
0.08884716, -1.221189, 2.637904, 1, 1, 1, 1, 1,
0.09324529, -0.3974725, 2.816131, 1, 1, 1, 1, 1,
0.09559743, 0.5198207, -0.9240049, 1, 1, 1, 1, 1,
0.09568308, 0.7791481, -0.2496528, 1, 1, 1, 1, 1,
0.1003081, 0.2031706, -0.4082204, 0, 0, 1, 1, 1,
0.1006711, 0.5000601, -0.2005262, 1, 0, 0, 1, 1,
0.1012389, -0.9476109, 3.670314, 1, 0, 0, 1, 1,
0.101372, 0.4858553, 0.008143186, 1, 0, 0, 1, 1,
0.1018225, 0.840526, -0.7002436, 1, 0, 0, 1, 1,
0.1020674, -0.1250524, 1.807247, 1, 0, 0, 1, 1,
0.1055733, -0.1895474, 1.826283, 0, 0, 0, 1, 1,
0.1060648, -2.409678, 2.731578, 0, 0, 0, 1, 1,
0.1061735, 0.9317846, -0.6235752, 0, 0, 0, 1, 1,
0.1067155, -0.7130796, 2.469741, 0, 0, 0, 1, 1,
0.1073025, 0.4148207, -0.4388966, 0, 0, 0, 1, 1,
0.1083156, 0.9096947, 1.560448, 0, 0, 0, 1, 1,
0.1135322, -0.1308052, 0.3786401, 0, 0, 0, 1, 1,
0.1159332, -0.1488738, 3.55246, 1, 1, 1, 1, 1,
0.1232913, 0.08050373, 3.312603, 1, 1, 1, 1, 1,
0.1266295, 0.6252081, 0.9196111, 1, 1, 1, 1, 1,
0.1275101, -0.9712132, 2.040913, 1, 1, 1, 1, 1,
0.1326104, -0.3291314, 3.102513, 1, 1, 1, 1, 1,
0.1346689, 2.529106, 0.9351227, 1, 1, 1, 1, 1,
0.1358524, 0.9839978, 0.9333575, 1, 1, 1, 1, 1,
0.1377535, 1.678463, -1.440605, 1, 1, 1, 1, 1,
0.1382619, 0.7629465, 0.09868689, 1, 1, 1, 1, 1,
0.1382629, 0.7274731, 0.08297923, 1, 1, 1, 1, 1,
0.1423, -0.9070703, 3.195951, 1, 1, 1, 1, 1,
0.1478081, 0.5312027, -1.154821, 1, 1, 1, 1, 1,
0.1485723, 1.406396, -0.7001904, 1, 1, 1, 1, 1,
0.1511959, -2.839332, 3.906072, 1, 1, 1, 1, 1,
0.1522653, -0.1510854, 1.904858, 1, 1, 1, 1, 1,
0.1555419, 1.313137, 0.4716748, 0, 0, 1, 1, 1,
0.1556359, 0.193371, -0.5744112, 1, 0, 0, 1, 1,
0.1596798, -0.244153, 2.177978, 1, 0, 0, 1, 1,
0.1600557, -2.300628, 2.591931, 1, 0, 0, 1, 1,
0.1607796, 0.6223005, 0.3406587, 1, 0, 0, 1, 1,
0.1640767, -0.3040721, 2.119357, 1, 0, 0, 1, 1,
0.165675, -0.2710734, 1.904033, 0, 0, 0, 1, 1,
0.1659992, 0.6729741, 1.429716, 0, 0, 0, 1, 1,
0.1705165, -0.8899426, 2.399414, 0, 0, 0, 1, 1,
0.1710239, -1.538754, 4.090371, 0, 0, 0, 1, 1,
0.1711046, 2.080462, 0.2596034, 0, 0, 0, 1, 1,
0.1731291, 0.1854418, 0.1943994, 0, 0, 0, 1, 1,
0.173786, -1.116391, 3.46701, 0, 0, 0, 1, 1,
0.176355, 0.153949, 0.7329581, 1, 1, 1, 1, 1,
0.1771981, 0.07907059, 2.018763, 1, 1, 1, 1, 1,
0.1785537, 0.413316, -0.2249393, 1, 1, 1, 1, 1,
0.1785738, -0.2535444, 2.250901, 1, 1, 1, 1, 1,
0.1808814, -0.2571083, 1.678069, 1, 1, 1, 1, 1,
0.1814562, -0.2673388, 3.0357, 1, 1, 1, 1, 1,
0.1829929, -0.4056966, 2.615762, 1, 1, 1, 1, 1,
0.1863387, -0.1006322, 2.543937, 1, 1, 1, 1, 1,
0.1874529, 1.006685, 0.7120723, 1, 1, 1, 1, 1,
0.1899763, -0.1138673, 3.045953, 1, 1, 1, 1, 1,
0.1929824, 1.92464, 1.66862, 1, 1, 1, 1, 1,
0.1934942, 1.903481, 0.9700422, 1, 1, 1, 1, 1,
0.1952156, -1.040192, 3.126725, 1, 1, 1, 1, 1,
0.1957568, 1.764829, 1.47008, 1, 1, 1, 1, 1,
0.1966089, 0.4945972, -0.05889776, 1, 1, 1, 1, 1,
0.1996336, 0.6725659, -0.09880812, 0, 0, 1, 1, 1,
0.2008455, -0.3996996, 2.609127, 1, 0, 0, 1, 1,
0.2022507, -0.09916503, 1.998857, 1, 0, 0, 1, 1,
0.2029004, 0.4024487, 1.245557, 1, 0, 0, 1, 1,
0.2037764, -0.9735417, 2.849633, 1, 0, 0, 1, 1,
0.2065348, 0.9870475, 1.793552, 1, 0, 0, 1, 1,
0.2139782, 1.526139, -0.4642109, 0, 0, 0, 1, 1,
0.2160676, -1.522639, 1.940545, 0, 0, 0, 1, 1,
0.225455, 1.717392, 1.911054, 0, 0, 0, 1, 1,
0.2278062, 0.006824955, 1.413093, 0, 0, 0, 1, 1,
0.2287894, 0.5071034, -0.5634518, 0, 0, 0, 1, 1,
0.2405235, -1.559917, 2.181648, 0, 0, 0, 1, 1,
0.240953, -0.6926144, 1.703664, 0, 0, 0, 1, 1,
0.2412372, 0.4090771, 0.1658922, 1, 1, 1, 1, 1,
0.2476854, -0.4122674, 2.182606, 1, 1, 1, 1, 1,
0.2519075, 0.3305199, 0.9424725, 1, 1, 1, 1, 1,
0.2547253, -0.2868251, 4.375094, 1, 1, 1, 1, 1,
0.2548722, -0.6173111, 2.224218, 1, 1, 1, 1, 1,
0.2556442, -2.089352, 4.394138, 1, 1, 1, 1, 1,
0.2561471, -1.100853, 2.654601, 1, 1, 1, 1, 1,
0.2600109, 0.1712946, 0.265765, 1, 1, 1, 1, 1,
0.2609311, 0.1195431, 0.5571245, 1, 1, 1, 1, 1,
0.2630591, -0.3853934, 2.991633, 1, 1, 1, 1, 1,
0.2663942, 0.9268654, -0.5978265, 1, 1, 1, 1, 1,
0.269711, -0.6496879, 4.490366, 1, 1, 1, 1, 1,
0.274768, 1.281673, 1.112043, 1, 1, 1, 1, 1,
0.2752992, 0.3807018, -0.6178073, 1, 1, 1, 1, 1,
0.2807847, 0.1384139, 2.413793, 1, 1, 1, 1, 1,
0.2814154, 0.1374263, 1.411726, 0, 0, 1, 1, 1,
0.2834019, -1.047521, 0.2303002, 1, 0, 0, 1, 1,
0.2843149, 1.002709, -0.1947058, 1, 0, 0, 1, 1,
0.2859097, -1.770246, 3.926626, 1, 0, 0, 1, 1,
0.2887162, -0.8178266, 2.798931, 1, 0, 0, 1, 1,
0.2891756, -0.4416514, 3.582075, 1, 0, 0, 1, 1,
0.289283, -0.2200247, 2.615916, 0, 0, 0, 1, 1,
0.2897401, -1.211448, 2.963642, 0, 0, 0, 1, 1,
0.2914855, 0.4644265, 2.238162, 0, 0, 0, 1, 1,
0.2916245, 0.8428307, 0.7182258, 0, 0, 0, 1, 1,
0.2923324, -0.04236335, 2.194435, 0, 0, 0, 1, 1,
0.2935341, -0.4121604, 0.7442329, 0, 0, 0, 1, 1,
0.2966632, 0.9118577, 0.4444471, 0, 0, 0, 1, 1,
0.3039488, -0.1706633, 2.069816, 1, 1, 1, 1, 1,
0.3076195, 0.7208706, -1.469522, 1, 1, 1, 1, 1,
0.3082564, 1.450276, -0.8012969, 1, 1, 1, 1, 1,
0.3103225, -1.418799, 3.99104, 1, 1, 1, 1, 1,
0.3110768, 0.5451484, 2.340154, 1, 1, 1, 1, 1,
0.3115131, -0.6846275, 2.870208, 1, 1, 1, 1, 1,
0.3126544, 0.764311, 1.354023, 1, 1, 1, 1, 1,
0.314305, 1.002557, 0.9571977, 1, 1, 1, 1, 1,
0.3194256, -0.679324, 2.584161, 1, 1, 1, 1, 1,
0.3201615, -0.3107036, 1.639731, 1, 1, 1, 1, 1,
0.3236898, 1.321378, 0.2762855, 1, 1, 1, 1, 1,
0.3240895, 0.5736243, -1.398666, 1, 1, 1, 1, 1,
0.3285659, -0.9618939, 4.312533, 1, 1, 1, 1, 1,
0.3311162, 1.727573, -0.652369, 1, 1, 1, 1, 1,
0.3498719, -0.6614942, 2.094531, 1, 1, 1, 1, 1,
0.3503357, -0.9031525, 1.732537, 0, 0, 1, 1, 1,
0.3535445, -0.4588813, 3.201144, 1, 0, 0, 1, 1,
0.3565429, -1.24155, 2.716936, 1, 0, 0, 1, 1,
0.3578888, 1.14564, 0.7420671, 1, 0, 0, 1, 1,
0.3586984, 0.5415289, 0.02934759, 1, 0, 0, 1, 1,
0.3680958, 2.322092, -0.5476054, 1, 0, 0, 1, 1,
0.3755344, 0.5949602, 1.431862, 0, 0, 0, 1, 1,
0.3798068, 0.2221308, 1.150738, 0, 0, 0, 1, 1,
0.3879315, 2.064993, 0.05954177, 0, 0, 0, 1, 1,
0.3884492, -1.156999, 4.185541, 0, 0, 0, 1, 1,
0.3922835, 0.2176127, -0.3042935, 0, 0, 0, 1, 1,
0.3932209, 0.3109841, 1.792763, 0, 0, 0, 1, 1,
0.3960438, -0.9857458, 1.664549, 0, 0, 0, 1, 1,
0.3985011, -1.059773, 2.958071, 1, 1, 1, 1, 1,
0.4018697, -1.403787, 4.091195, 1, 1, 1, 1, 1,
0.402534, -0.9535712, 2.658221, 1, 1, 1, 1, 1,
0.4043523, 0.1793198, 2.360713, 1, 1, 1, 1, 1,
0.4133535, 0.1447127, 1.716594, 1, 1, 1, 1, 1,
0.4266085, 0.3343489, 1.665506, 1, 1, 1, 1, 1,
0.4277167, -0.2573355, 2.831145, 1, 1, 1, 1, 1,
0.430534, -0.6102831, 1.699312, 1, 1, 1, 1, 1,
0.4307928, -0.2150813, 2.345179, 1, 1, 1, 1, 1,
0.4324432, 1.162686, -0.06072222, 1, 1, 1, 1, 1,
0.4440074, -0.4177632, 3.881006, 1, 1, 1, 1, 1,
0.4485161, -1.025756, 0.6631966, 1, 1, 1, 1, 1,
0.448522, -0.2884052, 1.643556, 1, 1, 1, 1, 1,
0.4493397, -0.003028945, 2.596685, 1, 1, 1, 1, 1,
0.4498118, -0.2056262, 1.727392, 1, 1, 1, 1, 1,
0.4500763, 0.8499777, -0.4369306, 0, 0, 1, 1, 1,
0.452898, 0.2042393, 1.971929, 1, 0, 0, 1, 1,
0.4548667, 0.4413912, 0.980296, 1, 0, 0, 1, 1,
0.4549307, 1.158754, -1.891342, 1, 0, 0, 1, 1,
0.4554304, -0.291455, 2.702882, 1, 0, 0, 1, 1,
0.465116, -0.9605033, 2.839648, 1, 0, 0, 1, 1,
0.4651231, -0.2607515, 3.074838, 0, 0, 0, 1, 1,
0.476965, 0.01596825, -1.768735, 0, 0, 0, 1, 1,
0.4779836, 1.450464, -1.336096, 0, 0, 0, 1, 1,
0.4791476, 0.4609062, 0.319151, 0, 0, 0, 1, 1,
0.4815452, 0.3956591, 2.470766, 0, 0, 0, 1, 1,
0.4832422, -1.060668, 2.322475, 0, 0, 0, 1, 1,
0.485808, 0.3057655, -0.8225109, 0, 0, 0, 1, 1,
0.485934, 0.7521968, 0.6515295, 1, 1, 1, 1, 1,
0.4865052, -0.3161266, 3.054839, 1, 1, 1, 1, 1,
0.4892636, -1.289706, 1.594526, 1, 1, 1, 1, 1,
0.4918093, 0.02821253, -0.234824, 1, 1, 1, 1, 1,
0.4939842, 0.0572268, 0.6561095, 1, 1, 1, 1, 1,
0.4941774, -1.097496, 4.088313, 1, 1, 1, 1, 1,
0.4960941, -0.2789192, 1.258684, 1, 1, 1, 1, 1,
0.4972629, 0.2090216, -0.1200961, 1, 1, 1, 1, 1,
0.5032609, -0.2781389, 2.084911, 1, 1, 1, 1, 1,
0.5074151, -5.183122e-05, 1.760778, 1, 1, 1, 1, 1,
0.50992, -0.0854615, 2.497565, 1, 1, 1, 1, 1,
0.5112692, 1.807639, 0.8397729, 1, 1, 1, 1, 1,
0.5120645, -2.06177, 4.053698, 1, 1, 1, 1, 1,
0.5126271, 1.045671, 0.2130412, 1, 1, 1, 1, 1,
0.5137581, -0.2430297, 2.991393, 1, 1, 1, 1, 1,
0.518244, -0.2781742, 2.932481, 0, 0, 1, 1, 1,
0.5203617, -0.1787915, 2.396495, 1, 0, 0, 1, 1,
0.5221208, 1.097617, -1.149798, 1, 0, 0, 1, 1,
0.5238787, -1.906956, 1.791467, 1, 0, 0, 1, 1,
0.528181, -0.6549597, 2.888409, 1, 0, 0, 1, 1,
0.5300379, -0.6540842, 2.33263, 1, 0, 0, 1, 1,
0.5319875, 1.953543, 1.054402, 0, 0, 0, 1, 1,
0.5327616, -0.7151173, 2.522427, 0, 0, 0, 1, 1,
0.5331022, 0.522801, 2.567376, 0, 0, 0, 1, 1,
0.5337674, 1.927558, 0.225916, 0, 0, 0, 1, 1,
0.5349355, 0.09440891, 1.935487, 0, 0, 0, 1, 1,
0.5363716, 0.8307102, -1.03637, 0, 0, 0, 1, 1,
0.538508, -0.495156, 2.834637, 0, 0, 0, 1, 1,
0.5488299, -0.1557386, 1.907651, 1, 1, 1, 1, 1,
0.5498881, 1.853351, 1.409588, 1, 1, 1, 1, 1,
0.5521629, -0.9979879, 1.711083, 1, 1, 1, 1, 1,
0.5601437, 1.891378, 1.260845, 1, 1, 1, 1, 1,
0.5609622, 0.1490116, 0.7139204, 1, 1, 1, 1, 1,
0.5619203, -1.202223, 2.394869, 1, 1, 1, 1, 1,
0.5625296, -0.6000693, 3.162278, 1, 1, 1, 1, 1,
0.5652829, 0.4015881, 1.466334, 1, 1, 1, 1, 1,
0.5709294, -1.810293, 4.66196, 1, 1, 1, 1, 1,
0.5741028, 0.07079219, 1.811127, 1, 1, 1, 1, 1,
0.5840698, -0.6096945, 3.092559, 1, 1, 1, 1, 1,
0.5846661, -1.286073, 4.002482, 1, 1, 1, 1, 1,
0.5898286, -0.912765, 2.246369, 1, 1, 1, 1, 1,
0.5920776, 0.6060886, 0.7122401, 1, 1, 1, 1, 1,
0.6054091, 2.02865, -0.09803103, 1, 1, 1, 1, 1,
0.609236, -2.199394, 2.029641, 0, 0, 1, 1, 1,
0.6109622, -1.279862, 2.785345, 1, 0, 0, 1, 1,
0.6195802, -1.097316, 2.109252, 1, 0, 0, 1, 1,
0.6205869, 0.3709081, 2.236477, 1, 0, 0, 1, 1,
0.6211271, 0.2401579, 3.988359, 1, 0, 0, 1, 1,
0.6260092, -0.5930462, 3.30451, 1, 0, 0, 1, 1,
0.6289372, -0.8426698, 2.012575, 0, 0, 0, 1, 1,
0.6314594, 0.05300472, 1.2206, 0, 0, 0, 1, 1,
0.6320301, -1.095324, 2.807363, 0, 0, 0, 1, 1,
0.6322724, 0.7604465, -1.35844, 0, 0, 0, 1, 1,
0.6349657, 0.4406757, -0.07499426, 0, 0, 0, 1, 1,
0.6350726, -0.3397321, 2.913649, 0, 0, 0, 1, 1,
0.6395171, -2.053457, 1.473838, 0, 0, 0, 1, 1,
0.6432597, -0.327164, 2.91924, 1, 1, 1, 1, 1,
0.6501257, 0.9340839, 0.5461222, 1, 1, 1, 1, 1,
0.6556442, 0.2603736, 0.8764319, 1, 1, 1, 1, 1,
0.6576257, -0.4585705, 1.943131, 1, 1, 1, 1, 1,
0.658092, 1.195004, -1.053886, 1, 1, 1, 1, 1,
0.6583123, 0.3092026, 0.6771573, 1, 1, 1, 1, 1,
0.6627478, -0.573626, 1.482421, 1, 1, 1, 1, 1,
0.6688767, -0.4315352, 2.542482, 1, 1, 1, 1, 1,
0.6691702, -1.117726, 2.976041, 1, 1, 1, 1, 1,
0.6737849, -0.5045408, 3.637889, 1, 1, 1, 1, 1,
0.6742652, 0.7058229, 1.361055, 1, 1, 1, 1, 1,
0.6748086, -0.8611293, 1.771871, 1, 1, 1, 1, 1,
0.6785322, -0.5599918, 0.9532235, 1, 1, 1, 1, 1,
0.6795554, 0.7168608, 0.6123737, 1, 1, 1, 1, 1,
0.6869791, 0.05872538, 0.723092, 1, 1, 1, 1, 1,
0.6894603, 1.117978, 2.554924, 0, 0, 1, 1, 1,
0.6931863, 0.7100065, 0.6261968, 1, 0, 0, 1, 1,
0.6948695, -0.3763562, 3.184794, 1, 0, 0, 1, 1,
0.6971018, 1.372177, -0.7885588, 1, 0, 0, 1, 1,
0.7018985, 0.6307403, -1.40247, 1, 0, 0, 1, 1,
0.7028521, -0.3230326, 2.3409, 1, 0, 0, 1, 1,
0.7034835, -0.4283996, 0.9011239, 0, 0, 0, 1, 1,
0.7084404, -0.3747865, 2.631353, 0, 0, 0, 1, 1,
0.70916, 2.083001, 1.479516, 0, 0, 0, 1, 1,
0.7121232, 1.451116, 0.9495206, 0, 0, 0, 1, 1,
0.7124808, 0.1752495, 2.195623, 0, 0, 0, 1, 1,
0.7172477, 0.5010327, 0.8675979, 0, 0, 0, 1, 1,
0.7182319, 0.8707247, 2.359036, 0, 0, 0, 1, 1,
0.7200137, 0.1383227, 1.771137, 1, 1, 1, 1, 1,
0.7206896, 0.4238326, 0.299072, 1, 1, 1, 1, 1,
0.721611, 1.795662, -0.4534465, 1, 1, 1, 1, 1,
0.7285154, -1.773428, 1.810639, 1, 1, 1, 1, 1,
0.7348029, 1.499585, 0.2074594, 1, 1, 1, 1, 1,
0.7352378, -0.1582756, 1.874532, 1, 1, 1, 1, 1,
0.7372489, -1.330113, 4.646569, 1, 1, 1, 1, 1,
0.7414925, 0.238162, 1.483413, 1, 1, 1, 1, 1,
0.748602, 0.9214877, 1.621272, 1, 1, 1, 1, 1,
0.7562337, -1.156939, 2.665513, 1, 1, 1, 1, 1,
0.7568399, -1.010621, 3.057472, 1, 1, 1, 1, 1,
0.7621695, 1.272388, 1.106547, 1, 1, 1, 1, 1,
0.7670872, -0.0724033, 1.641494, 1, 1, 1, 1, 1,
0.7741511, -0.5029936, 1.237357, 1, 1, 1, 1, 1,
0.7837595, 0.7129761, 0.1150484, 1, 1, 1, 1, 1,
0.7851596, 1.227183, 0.1116411, 0, 0, 1, 1, 1,
0.7857267, -1.185247, 3.936155, 1, 0, 0, 1, 1,
0.7951255, -2.043046, 1.710715, 1, 0, 0, 1, 1,
0.7983565, 1.239625, -2.27085, 1, 0, 0, 1, 1,
0.8032644, -1.019822, 1.871486, 1, 0, 0, 1, 1,
0.8053154, 0.1960286, 1.900474, 1, 0, 0, 1, 1,
0.8226188, -0.18242, 1.61812, 0, 0, 0, 1, 1,
0.8241049, 0.698649, 0.2165284, 0, 0, 0, 1, 1,
0.8309989, 0.3723799, -0.9455587, 0, 0, 0, 1, 1,
0.8315703, 0.4117857, 1.095039, 0, 0, 0, 1, 1,
0.8348138, 3.162336, -1.844028, 0, 0, 0, 1, 1,
0.8407866, -0.08781708, 1.65445, 0, 0, 0, 1, 1,
0.8495139, -0.0806264, 2.695529, 0, 0, 0, 1, 1,
0.8500718, 0.08952233, 1.74207, 1, 1, 1, 1, 1,
0.8534265, 0.6263294, 1.292696, 1, 1, 1, 1, 1,
0.8554041, 2.164307, 0.7326006, 1, 1, 1, 1, 1,
0.855614, 0.9765849, 1.04901, 1, 1, 1, 1, 1,
0.8618868, 0.2401137, 0.8002577, 1, 1, 1, 1, 1,
0.8642389, 0.08458842, 1.849372, 1, 1, 1, 1, 1,
0.8642424, 1.301146, -0.8119133, 1, 1, 1, 1, 1,
0.8661452, -0.5041158, 0.4407273, 1, 1, 1, 1, 1,
0.8680452, 0.8902424, 0.7379721, 1, 1, 1, 1, 1,
0.8701459, 0.8815957, -1.74903, 1, 1, 1, 1, 1,
0.8751795, -0.2043476, 0.2068507, 1, 1, 1, 1, 1,
0.8786021, -1.223005, 2.18912, 1, 1, 1, 1, 1,
0.8848698, 0.8281723, 1.844466, 1, 1, 1, 1, 1,
0.8868513, -0.3623898, 2.18818, 1, 1, 1, 1, 1,
0.8918227, 0.08526928, 0.823849, 1, 1, 1, 1, 1,
0.8974506, 0.5823942, -0.3701351, 0, 0, 1, 1, 1,
0.8997339, 1.00511, 1.674951, 1, 0, 0, 1, 1,
0.9059185, 1.273915, 2.10855, 1, 0, 0, 1, 1,
0.9097624, 0.6215803, 0.7021208, 1, 0, 0, 1, 1,
0.91035, 2.362545, 2.02276, 1, 0, 0, 1, 1,
0.9146243, -0.2155535, 2.334745, 1, 0, 0, 1, 1,
0.9161554, 0.09796747, 1.481821, 0, 0, 0, 1, 1,
0.917652, -0.003430618, 0.9980154, 0, 0, 0, 1, 1,
0.9189211, 0.1863828, 0.4772632, 0, 0, 0, 1, 1,
0.9190218, -2.161124, 1.989187, 0, 0, 0, 1, 1,
0.9209762, -0.8528326, 3.059792, 0, 0, 0, 1, 1,
0.9282255, -0.8865121, 4.398424, 0, 0, 0, 1, 1,
0.9299349, 1.347969, 0.2427713, 0, 0, 0, 1, 1,
0.9322264, -1.481813, 1.510861, 1, 1, 1, 1, 1,
0.9366208, -0.7321412, 1.956606, 1, 1, 1, 1, 1,
0.9956406, 0.5920123, -0.2791115, 1, 1, 1, 1, 1,
1.002537, 0.7042521, -0.1949894, 1, 1, 1, 1, 1,
1.003257, 0.07324117, 1.527082, 1, 1, 1, 1, 1,
1.005931, -0.3474933, 0.7260112, 1, 1, 1, 1, 1,
1.015695, -1.098469, 2.574913, 1, 1, 1, 1, 1,
1.016228, -0.4760286, 0.4067215, 1, 1, 1, 1, 1,
1.017671, -2.315272, 1.865285, 1, 1, 1, 1, 1,
1.021593, -1.021673, 2.542855, 1, 1, 1, 1, 1,
1.023956, -0.9317026, 2.819459, 1, 1, 1, 1, 1,
1.03304, 0.7572033, 0.7235415, 1, 1, 1, 1, 1,
1.034139, -1.667108, 5.428693, 1, 1, 1, 1, 1,
1.034567, -0.1635548, 0.4754779, 1, 1, 1, 1, 1,
1.036837, -2.13735, 2.48904, 1, 1, 1, 1, 1,
1.044988, 1.017675, 1.401696, 0, 0, 1, 1, 1,
1.046034, -0.6328947, 2.858709, 1, 0, 0, 1, 1,
1.046779, 1.092484, -0.3372098, 1, 0, 0, 1, 1,
1.062529, 0.5456937, 1.456951, 1, 0, 0, 1, 1,
1.064167, 1.146032, 0.5469573, 1, 0, 0, 1, 1,
1.06433, -1.58967, 1.730134, 1, 0, 0, 1, 1,
1.06673, 0.3969915, 1.284797, 0, 0, 0, 1, 1,
1.066846, -0.1289343, 1.662773, 0, 0, 0, 1, 1,
1.068136, -1.171656, 1.949883, 0, 0, 0, 1, 1,
1.077936, 0.4905916, 0.9228014, 0, 0, 0, 1, 1,
1.086084, 0.8760507, 1.419916, 0, 0, 0, 1, 1,
1.089982, -0.430732, 1.571828, 0, 0, 0, 1, 1,
1.095035, 0.4993764, 0.4420607, 0, 0, 0, 1, 1,
1.095514, -1.229725, 1.916866, 1, 1, 1, 1, 1,
1.100236, -0.1465841, 3.110535, 1, 1, 1, 1, 1,
1.103887, 1.282248, 0.8200428, 1, 1, 1, 1, 1,
1.107405, -0.0928044, 1.451343, 1, 1, 1, 1, 1,
1.109291, 0.5247147, 1.723464, 1, 1, 1, 1, 1,
1.109848, 0.5437177, 0.1892815, 1, 1, 1, 1, 1,
1.111782, -0.3261367, 1.106626, 1, 1, 1, 1, 1,
1.112041, 0.2092267, 1.599518, 1, 1, 1, 1, 1,
1.112352, 0.3857627, 1.036398, 1, 1, 1, 1, 1,
1.114989, -0.8684633, 1.361658, 1, 1, 1, 1, 1,
1.119945, -1.197805, 2.251974, 1, 1, 1, 1, 1,
1.12575, 0.5932409, 2.378463, 1, 1, 1, 1, 1,
1.128121, -1.370959, 2.475682, 1, 1, 1, 1, 1,
1.129868, 0.2022873, -0.4227626, 1, 1, 1, 1, 1,
1.137678, 1.128767, 0.3097305, 1, 1, 1, 1, 1,
1.137995, -0.6329574, 2.2233, 0, 0, 1, 1, 1,
1.139786, -0.3800641, 4.076293, 1, 0, 0, 1, 1,
1.141153, -0.06414413, -0.1997182, 1, 0, 0, 1, 1,
1.14537, -0.5328183, 1.087933, 1, 0, 0, 1, 1,
1.155033, -0.6918118, 4.403974, 1, 0, 0, 1, 1,
1.155809, -1.460544, 1.913325, 1, 0, 0, 1, 1,
1.161246, 1.099049, 1.587611, 0, 0, 0, 1, 1,
1.161415, -0.134445, 1.007128, 0, 0, 0, 1, 1,
1.162486, -0.6543713, 1.330747, 0, 0, 0, 1, 1,
1.162897, 0.2774936, 2.694199, 0, 0, 0, 1, 1,
1.165486, 0.4367489, 1.615325, 0, 0, 0, 1, 1,
1.165539, -1.271776, 1.210143, 0, 0, 0, 1, 1,
1.171962, 0.8748917, 2.323623, 0, 0, 0, 1, 1,
1.197241, 1.434946, 1.682693, 1, 1, 1, 1, 1,
1.197502, 1.70216, -1.662282, 1, 1, 1, 1, 1,
1.198589, 0.04975412, 2.080461, 1, 1, 1, 1, 1,
1.202506, 0.4036893, 1.389472, 1, 1, 1, 1, 1,
1.20307, -0.7079861, 2.733479, 1, 1, 1, 1, 1,
1.211612, -0.286178, 1.704191, 1, 1, 1, 1, 1,
1.217706, 0.2385478, 0.9318376, 1, 1, 1, 1, 1,
1.221012, 0.818599, 2.058302, 1, 1, 1, 1, 1,
1.224362, -0.3533444, 3.955808, 1, 1, 1, 1, 1,
1.231321, -0.004756287, 1.913828, 1, 1, 1, 1, 1,
1.233412, -0.2650371, 0.4284879, 1, 1, 1, 1, 1,
1.23364, 0.6629912, 1.938741, 1, 1, 1, 1, 1,
1.234193, 2.209347, -0.1358669, 1, 1, 1, 1, 1,
1.240518, -1.065724, 1.088305, 1, 1, 1, 1, 1,
1.249418, -0.1653607, 1.608987, 1, 1, 1, 1, 1,
1.252796, -1.565281, 2.370748, 0, 0, 1, 1, 1,
1.254246, 1.170888, 1.085701, 1, 0, 0, 1, 1,
1.258952, 0.5264779, 0.3256085, 1, 0, 0, 1, 1,
1.259216, -0.8920169, 0.8953592, 1, 0, 0, 1, 1,
1.260507, 0.7165781, 0.7441963, 1, 0, 0, 1, 1,
1.262259, -1.980998, 2.199799, 1, 0, 0, 1, 1,
1.267061, 0.4155658, 1.339761, 0, 0, 0, 1, 1,
1.275403, -1.276366, 3.374185, 0, 0, 0, 1, 1,
1.277462, -0.1257004, 0.03245382, 0, 0, 0, 1, 1,
1.277626, 1.566527, 0.8925595, 0, 0, 0, 1, 1,
1.278565, -0.7554421, 3.722136, 0, 0, 0, 1, 1,
1.280615, -0.584304, 2.716644, 0, 0, 0, 1, 1,
1.282645, 0.8010333, 0.02282162, 0, 0, 0, 1, 1,
1.292967, -0.2962945, 1.292836, 1, 1, 1, 1, 1,
1.295939, 1.306058, 0.8713645, 1, 1, 1, 1, 1,
1.296092, -0.2864299, 0.9188947, 1, 1, 1, 1, 1,
1.296457, -1.064211, 3.022766, 1, 1, 1, 1, 1,
1.301398, 0.4004128, -0.416838, 1, 1, 1, 1, 1,
1.305292, -0.9928758, 1.93602, 1, 1, 1, 1, 1,
1.319685, 0.4679593, 1.399776, 1, 1, 1, 1, 1,
1.323237, -1.158615, 2.788911, 1, 1, 1, 1, 1,
1.332087, -2.313756, 2.443731, 1, 1, 1, 1, 1,
1.344488, -0.09260113, 2.614759, 1, 1, 1, 1, 1,
1.350627, -0.9016967, 1.447711, 1, 1, 1, 1, 1,
1.363595, -1.184046, 1.976191, 1, 1, 1, 1, 1,
1.364241, 0.6178433, -0.1289673, 1, 1, 1, 1, 1,
1.376823, 0.5860597, 0.7728132, 1, 1, 1, 1, 1,
1.383901, 1.162679, 1.207863, 1, 1, 1, 1, 1,
1.392097, 1.348565, 1.894302, 0, 0, 1, 1, 1,
1.404937, -0.7150207, 1.729475, 1, 0, 0, 1, 1,
1.409788, 0.06139505, 0.05143522, 1, 0, 0, 1, 1,
1.412604, 0.5383313, 0.6339171, 1, 0, 0, 1, 1,
1.415635, -0.4593502, 1.498813, 1, 0, 0, 1, 1,
1.424918, 0.4623526, 1.372727, 1, 0, 0, 1, 1,
1.426429, -1.652303, 2.498649, 0, 0, 0, 1, 1,
1.432502, 0.8735165, 0.7872513, 0, 0, 0, 1, 1,
1.432561, 1.903822, -0.248002, 0, 0, 0, 1, 1,
1.437246, -1.2512, 1.022728, 0, 0, 0, 1, 1,
1.439391, 1.765951, -0.4141676, 0, 0, 0, 1, 1,
1.445467, 0.2689542, 1.259981, 0, 0, 0, 1, 1,
1.447387, -0.2082463, 2.868974, 0, 0, 0, 1, 1,
1.454877, 1.031719, 1.173822, 1, 1, 1, 1, 1,
1.455917, -0.4373808, 1.444876, 1, 1, 1, 1, 1,
1.456929, -0.7627537, 2.862104, 1, 1, 1, 1, 1,
1.460835, -1.039688, 1.426598, 1, 1, 1, 1, 1,
1.463051, 0.2270957, 1.344712, 1, 1, 1, 1, 1,
1.472039, 0.8527036, -0.1453894, 1, 1, 1, 1, 1,
1.477121, -1.130001, 2.994104, 1, 1, 1, 1, 1,
1.483266, -0.9904642, 3.817094, 1, 1, 1, 1, 1,
1.50731, -0.9334043, 2.28694, 1, 1, 1, 1, 1,
1.507891, 0.2120499, 0.8163153, 1, 1, 1, 1, 1,
1.521769, 0.8476971, -1.481435, 1, 1, 1, 1, 1,
1.527514, 0.4670132, 1.147444, 1, 1, 1, 1, 1,
1.537723, -0.5814946, 2.512976, 1, 1, 1, 1, 1,
1.538026, -0.4803689, 1.455732, 1, 1, 1, 1, 1,
1.541857, -0.6346559, 1.492344, 1, 1, 1, 1, 1,
1.549069, -0.4856227, 2.685395, 0, 0, 1, 1, 1,
1.553776, 1.087151, -0.2072886, 1, 0, 0, 1, 1,
1.555033, -1.266307, 3.570714, 1, 0, 0, 1, 1,
1.555608, -0.9993553, 1.882, 1, 0, 0, 1, 1,
1.56884, -0.7605368, 1.330695, 1, 0, 0, 1, 1,
1.596884, 0.1973974, 1.63984, 1, 0, 0, 1, 1,
1.62711, -0.2722997, 2.156806, 0, 0, 0, 1, 1,
1.629519, 0.2280593, 0.6081617, 0, 0, 0, 1, 1,
1.63095, -0.7863024, 1.05449, 0, 0, 0, 1, 1,
1.637864, 0.7132527, 0.5606396, 0, 0, 0, 1, 1,
1.65439, 2.298241, 1.294478, 0, 0, 0, 1, 1,
1.655519, -0.6891029, 2.134411, 0, 0, 0, 1, 1,
1.671275, -0.7258501, 1.934889, 0, 0, 0, 1, 1,
1.681531, -0.4897304, 2.7331, 1, 1, 1, 1, 1,
1.704431, 0.8122075, 1.722601, 1, 1, 1, 1, 1,
1.711304, -1.688261, 1.644626, 1, 1, 1, 1, 1,
1.755299, 0.3891523, 2.795262, 1, 1, 1, 1, 1,
1.75831, 0.389683, -0.7901903, 1, 1, 1, 1, 1,
1.768314, -2.064976, 2.398116, 1, 1, 1, 1, 1,
1.804459, -0.0116997, 1.460049, 1, 1, 1, 1, 1,
1.806288, 0.6311932, 1.246855, 1, 1, 1, 1, 1,
1.854968, -1.3503, 3.466061, 1, 1, 1, 1, 1,
1.858451, -0.4269023, 3.056821, 1, 1, 1, 1, 1,
1.866302, 1.253028, 1.996923, 1, 1, 1, 1, 1,
1.872509, -1.261559, 3.686799, 1, 1, 1, 1, 1,
1.877762, 0.5029346, 0.1694139, 1, 1, 1, 1, 1,
1.903303, 0.1612705, 1.44779, 1, 1, 1, 1, 1,
1.924349, -0.1483317, 1.73087, 1, 1, 1, 1, 1,
1.955157, 0.4655614, 1.246888, 0, 0, 1, 1, 1,
2.017073, 0.2065299, 2.372165, 1, 0, 0, 1, 1,
2.080626, -2.327024, 1.484474, 1, 0, 0, 1, 1,
2.080687, 0.02409469, 2.355773, 1, 0, 0, 1, 1,
2.120403, 0.5377951, 0.5280011, 1, 0, 0, 1, 1,
2.141848, 1.224282, 1.817754, 1, 0, 0, 1, 1,
2.189924, 1.009726, 0.5693651, 0, 0, 0, 1, 1,
2.208571, 0.04811437, 0.2868135, 0, 0, 0, 1, 1,
2.21954, 0.5265936, 0.3778144, 0, 0, 0, 1, 1,
2.239896, -0.7354773, -0.4161835, 0, 0, 0, 1, 1,
2.330984, 2.371279, -0.04774239, 0, 0, 0, 1, 1,
2.351851, -1.240676, 1.891646, 0, 0, 0, 1, 1,
2.365981, -0.3184084, 1.135223, 0, 0, 0, 1, 1,
2.493659, -0.04621109, 1.453561, 1, 1, 1, 1, 1,
2.543663, 0.03189478, 1.374553, 1, 1, 1, 1, 1,
2.646516, 0.0393818, -0.5999248, 1, 1, 1, 1, 1,
2.707765, -1.965175, 1.609134, 1, 1, 1, 1, 1,
2.719178, -0.09325796, 1.893801, 1, 1, 1, 1, 1,
3.060439, -0.2527574, 1.45166, 1, 1, 1, 1, 1,
3.68964, 0.9534497, 0.6286061, 1, 1, 1, 1, 1
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
var radius = 10.16805;
var distance = 35.71484;
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
mvMatrix.translate( -0.2674315, -0.07626438, -0.03937578 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.71484);
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
