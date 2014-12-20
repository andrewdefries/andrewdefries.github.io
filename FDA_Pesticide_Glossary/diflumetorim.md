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
-3.629954, -0.07676657, -1.128004, 1, 0, 0, 1,
-2.985328, 0.5722262, -0.7312632, 1, 0.007843138, 0, 1,
-2.766946, -0.9008396, -1.822836, 1, 0.01176471, 0, 1,
-2.743817, -0.4006072, -1.171338, 1, 0.01960784, 0, 1,
-2.674155, -0.3383827, -0.9869133, 1, 0.02352941, 0, 1,
-2.410502, 1.20163, -0.7674315, 1, 0.03137255, 0, 1,
-2.380888, -0.9647622, -1.091511, 1, 0.03529412, 0, 1,
-2.352295, 1.312813, -1.459709, 1, 0.04313726, 0, 1,
-2.352195, 0.1788307, -1.278065, 1, 0.04705882, 0, 1,
-2.274211, 0.1984386, -0.9845031, 1, 0.05490196, 0, 1,
-2.273711, -1.102187, -2.351276, 1, 0.05882353, 0, 1,
-2.269889, -2.011745, -2.457665, 1, 0.06666667, 0, 1,
-2.202908, -0.5753556, -1.316483, 1, 0.07058824, 0, 1,
-2.160327, -0.3860939, -3.483848, 1, 0.07843138, 0, 1,
-2.159345, 0.4512065, -1.672834, 1, 0.08235294, 0, 1,
-2.157336, 0.01728028, -2.995929, 1, 0.09019608, 0, 1,
-2.087451, 0.7688382, -1.092362, 1, 0.09411765, 0, 1,
-2.085733, -0.6925993, -2.9768, 1, 0.1019608, 0, 1,
-2.062636, 1.938556, -2.203823, 1, 0.1098039, 0, 1,
-2.022348, -1.562938, -3.577132, 1, 0.1137255, 0, 1,
-2.020524, 0.6358796, -0.001875736, 1, 0.1215686, 0, 1,
-2.018692, 0.137754, -1.984912, 1, 0.1254902, 0, 1,
-2.010604, 0.7363604, -1.509818, 1, 0.1333333, 0, 1,
-1.945832, 1.823359, 0.546003, 1, 0.1372549, 0, 1,
-1.940149, -0.3669904, -1.775009, 1, 0.145098, 0, 1,
-1.929285, -0.7849019, 0.07043548, 1, 0.1490196, 0, 1,
-1.926289, -1.63025, -2.505263, 1, 0.1568628, 0, 1,
-1.92515, 0.5283801, -1.502943, 1, 0.1607843, 0, 1,
-1.903859, -0.7401079, -1.636853, 1, 0.1686275, 0, 1,
-1.890123, 0.4104175, -0.9333359, 1, 0.172549, 0, 1,
-1.855224, 0.4313023, -1.107131, 1, 0.1803922, 0, 1,
-1.848244, 0.6971416, -1.431383, 1, 0.1843137, 0, 1,
-1.846235, 1.234467, -0.9698769, 1, 0.1921569, 0, 1,
-1.805931, 0.2298881, -1.642704, 1, 0.1960784, 0, 1,
-1.802671, -1.562355, -2.565435, 1, 0.2039216, 0, 1,
-1.790518, -1.561184, -3.132853, 1, 0.2117647, 0, 1,
-1.784975, 0.9390716, -1.114946, 1, 0.2156863, 0, 1,
-1.751862, -0.5973984, -1.491661, 1, 0.2235294, 0, 1,
-1.746322, -1.741036, -2.03298, 1, 0.227451, 0, 1,
-1.746306, -0.4905967, -2.103239, 1, 0.2352941, 0, 1,
-1.743708, -0.6057263, -1.760081, 1, 0.2392157, 0, 1,
-1.742799, -0.04032246, -2.050493, 1, 0.2470588, 0, 1,
-1.737628, -0.7311409, -1.934683, 1, 0.2509804, 0, 1,
-1.737398, -0.7891278, -0.5525278, 1, 0.2588235, 0, 1,
-1.723951, -0.2502719, -1.999382, 1, 0.2627451, 0, 1,
-1.717405, -0.1961709, -1.280123, 1, 0.2705882, 0, 1,
-1.711844, -0.1827739, -1.731722, 1, 0.2745098, 0, 1,
-1.695525, -0.5023043, -2.174333, 1, 0.282353, 0, 1,
-1.690408, 1.193014, 0.5875831, 1, 0.2862745, 0, 1,
-1.67372, -0.4959513, -2.677347, 1, 0.2941177, 0, 1,
-1.664689, -0.208056, -1.175734, 1, 0.3019608, 0, 1,
-1.647874, -0.9847316, -1.663488, 1, 0.3058824, 0, 1,
-1.646568, -1.214622, -4.703292, 1, 0.3137255, 0, 1,
-1.642773, -0.2391799, -0.5729491, 1, 0.3176471, 0, 1,
-1.631296, -0.03482813, -1.542509, 1, 0.3254902, 0, 1,
-1.619184, -0.8415748, -1.609275, 1, 0.3294118, 0, 1,
-1.615601, 0.2288115, -1.046996, 1, 0.3372549, 0, 1,
-1.608186, 0.7674901, -0.8999565, 1, 0.3411765, 0, 1,
-1.581163, 0.5993093, -2.030896, 1, 0.3490196, 0, 1,
-1.57766, 1.660058, 0.5039615, 1, 0.3529412, 0, 1,
-1.573917, -0.2895427, -1.798577, 1, 0.3607843, 0, 1,
-1.571847, 0.4243864, -1.305941, 1, 0.3647059, 0, 1,
-1.568376, 2.767778, 1.102175, 1, 0.372549, 0, 1,
-1.559886, -0.2722768, -1.280459, 1, 0.3764706, 0, 1,
-1.556915, -1.19413, -1.749778, 1, 0.3843137, 0, 1,
-1.556847, -0.4894291, -2.726705, 1, 0.3882353, 0, 1,
-1.55137, 1.658565, -0.4684011, 1, 0.3960784, 0, 1,
-1.536373, -1.987218, -2.818758, 1, 0.4039216, 0, 1,
-1.534346, 0.02300277, -1.249993, 1, 0.4078431, 0, 1,
-1.526824, -1.916298, -0.5982707, 1, 0.4156863, 0, 1,
-1.521514, 0.4343385, -1.509878, 1, 0.4196078, 0, 1,
-1.517085, 0.153236, -0.9829699, 1, 0.427451, 0, 1,
-1.517045, -1.520628, -1.743197, 1, 0.4313726, 0, 1,
-1.514305, -1.201319, -3.461668, 1, 0.4392157, 0, 1,
-1.511466, -0.9556071, -2.932627, 1, 0.4431373, 0, 1,
-1.489455, 0.8076956, -2.2599, 1, 0.4509804, 0, 1,
-1.486946, 0.7669734, -2.698389, 1, 0.454902, 0, 1,
-1.484729, -0.7595615, -0.6429781, 1, 0.4627451, 0, 1,
-1.475253, 1.902482, -1.144982, 1, 0.4666667, 0, 1,
-1.450093, -0.881966, -2.157737, 1, 0.4745098, 0, 1,
-1.447875, 0.3917037, -1.4933, 1, 0.4784314, 0, 1,
-1.441967, 0.02633338, -1.944898, 1, 0.4862745, 0, 1,
-1.43674, 0.8497071, 0.3397107, 1, 0.4901961, 0, 1,
-1.431665, 0.7002968, -0.1533612, 1, 0.4980392, 0, 1,
-1.429093, 0.3712926, -2.887131, 1, 0.5058824, 0, 1,
-1.421473, 0.1044322, -1.455604, 1, 0.509804, 0, 1,
-1.420067, 0.3917465, -0.7324464, 1, 0.5176471, 0, 1,
-1.406875, -0.4197228, -0.1584283, 1, 0.5215687, 0, 1,
-1.404235, -0.5748384, -2.672514, 1, 0.5294118, 0, 1,
-1.403932, 0.6568152, 1.300724, 1, 0.5333334, 0, 1,
-1.401492, -0.236021, -3.47969, 1, 0.5411765, 0, 1,
-1.389368, 0.6068326, -0.2682167, 1, 0.5450981, 0, 1,
-1.368503, -1.161697, -2.803794, 1, 0.5529412, 0, 1,
-1.36814, -0.8048164, -2.838873, 1, 0.5568628, 0, 1,
-1.364584, 0.6620694, -0.5494349, 1, 0.5647059, 0, 1,
-1.356894, 1.913047, -1.020424, 1, 0.5686275, 0, 1,
-1.347916, -1.116847, -1.328084, 1, 0.5764706, 0, 1,
-1.342114, 1.066831, -1.667352, 1, 0.5803922, 0, 1,
-1.334412, -1.062101, -1.729318, 1, 0.5882353, 0, 1,
-1.333335, -0.6481422, -2.472279, 1, 0.5921569, 0, 1,
-1.331101, -0.4644691, -2.77498, 1, 0.6, 0, 1,
-1.327433, 0.7318417, -1.527103, 1, 0.6078432, 0, 1,
-1.317786, 0.09135224, -1.325783, 1, 0.6117647, 0, 1,
-1.315664, -0.6643486, -2.380057, 1, 0.6196079, 0, 1,
-1.312678, -0.1641579, -1.057748, 1, 0.6235294, 0, 1,
-1.31155, 0.4772909, -0.406131, 1, 0.6313726, 0, 1,
-1.311027, 0.4487098, 0.3344142, 1, 0.6352941, 0, 1,
-1.308595, 1.553326, -0.4570536, 1, 0.6431373, 0, 1,
-1.305446, -0.6387765, -1.008181, 1, 0.6470588, 0, 1,
-1.298122, -0.9517181, -3.360093, 1, 0.654902, 0, 1,
-1.298084, -2.041491, -3.638705, 1, 0.6588235, 0, 1,
-1.291028, 1.044424, -2.098614, 1, 0.6666667, 0, 1,
-1.287704, -0.5712317, -0.06688207, 1, 0.6705883, 0, 1,
-1.282854, 0.6242926, 0.849999, 1, 0.6784314, 0, 1,
-1.278862, 0.3763552, -1.253266, 1, 0.682353, 0, 1,
-1.275106, -0.07850491, -1.741582, 1, 0.6901961, 0, 1,
-1.262622, 1.733216, 0.3500609, 1, 0.6941177, 0, 1,
-1.248845, -1.487047, -3.815337, 1, 0.7019608, 0, 1,
-1.240148, 2.226283, -0.8323505, 1, 0.7098039, 0, 1,
-1.23166, -0.7608913, -1.922199, 1, 0.7137255, 0, 1,
-1.223967, -0.5770227, -3.592024, 1, 0.7215686, 0, 1,
-1.222096, -0.1286547, -4.345548, 1, 0.7254902, 0, 1,
-1.218244, -0.3452484, -1.214095, 1, 0.7333333, 0, 1,
-1.216383, 1.821449, -0.667383, 1, 0.7372549, 0, 1,
-1.214646, 0.02473619, -0.751475, 1, 0.7450981, 0, 1,
-1.211569, 0.3135697, -1.07849, 1, 0.7490196, 0, 1,
-1.205163, 0.7152026, -1.535649, 1, 0.7568628, 0, 1,
-1.197356, -0.7973031, -1.608856, 1, 0.7607843, 0, 1,
-1.195525, 0.1869477, -1.262895, 1, 0.7686275, 0, 1,
-1.195494, -0.09438866, -1.819936, 1, 0.772549, 0, 1,
-1.19187, 0.1398042, -0.5297161, 1, 0.7803922, 0, 1,
-1.189809, -0.60813, -2.596614, 1, 0.7843137, 0, 1,
-1.186081, -1.026093, -0.1697947, 1, 0.7921569, 0, 1,
-1.185638, -0.2645521, -2.01388, 1, 0.7960784, 0, 1,
-1.1504, 0.2646875, -0.6324514, 1, 0.8039216, 0, 1,
-1.145154, 0.6126317, -1.183549, 1, 0.8117647, 0, 1,
-1.1442, -1.111256, -2.041389, 1, 0.8156863, 0, 1,
-1.139469, 0.8604971, -0.9754376, 1, 0.8235294, 0, 1,
-1.136109, -1.176306, -1.131724, 1, 0.827451, 0, 1,
-1.131443, -0.3805072, -0.7489985, 1, 0.8352941, 0, 1,
-1.130351, -0.737406, -1.838742, 1, 0.8392157, 0, 1,
-1.124691, -0.4695766, -2.424162, 1, 0.8470588, 0, 1,
-1.123857, -2.222662, -2.717745, 1, 0.8509804, 0, 1,
-1.108841, 0.5245032, 0.02943291, 1, 0.8588235, 0, 1,
-1.105728, 0.12455, -2.535534, 1, 0.8627451, 0, 1,
-1.10023, 0.6385442, -0.5322869, 1, 0.8705882, 0, 1,
-1.090081, 1.090505, -2.467814, 1, 0.8745098, 0, 1,
-1.089281, -0.6378763, -1.501082, 1, 0.8823529, 0, 1,
-1.088769, 1.420153, -0.2438315, 1, 0.8862745, 0, 1,
-1.072595, 0.8436173, 0.1498572, 1, 0.8941177, 0, 1,
-1.070367, 0.3970711, -0.9632878, 1, 0.8980392, 0, 1,
-1.070141, 1.736372, -2.248786, 1, 0.9058824, 0, 1,
-1.069888, 0.664641, 0.3281465, 1, 0.9137255, 0, 1,
-1.068598, 0.6562004, -1.349293, 1, 0.9176471, 0, 1,
-1.067751, -1.845018, -2.766447, 1, 0.9254902, 0, 1,
-1.066264, -1.291132, -2.35481, 1, 0.9294118, 0, 1,
-1.053677, -0.7801232, -1.675131, 1, 0.9372549, 0, 1,
-1.04648, -0.8660046, 0.3686629, 1, 0.9411765, 0, 1,
-1.046181, -0.7430367, -2.682117, 1, 0.9490196, 0, 1,
-1.043349, -0.3739352, -3.331093, 1, 0.9529412, 0, 1,
-1.042936, -0.2183563, -0.9948906, 1, 0.9607843, 0, 1,
-1.041571, -0.1657501, -3.197921, 1, 0.9647059, 0, 1,
-1.036649, 0.7828379, -0.8771158, 1, 0.972549, 0, 1,
-1.033038, 1.993729, -0.4130354, 1, 0.9764706, 0, 1,
-1.025372, -0.8215201, -3.437625, 1, 0.9843137, 0, 1,
-1.015031, 1.056391, -1.606012, 1, 0.9882353, 0, 1,
-1.006849, -0.4597943, -1.774312, 1, 0.9960784, 0, 1,
-1.003715, 0.7535961, -0.8425182, 0.9960784, 1, 0, 1,
-1.000841, -1.274976, -3.464386, 0.9921569, 1, 0, 1,
-1.000114, 0.9740549, -0.9632767, 0.9843137, 1, 0, 1,
-0.9999948, 0.3330264, -2.773957, 0.9803922, 1, 0, 1,
-0.9999477, 1.495386, -0.8534399, 0.972549, 1, 0, 1,
-0.9971141, -1.287627, -0.5619401, 0.9686275, 1, 0, 1,
-0.9962878, -0.1353364, -0.4883758, 0.9607843, 1, 0, 1,
-0.9936066, -0.1660557, -0.768424, 0.9568627, 1, 0, 1,
-0.9856853, 0.1663518, -1.700204, 0.9490196, 1, 0, 1,
-0.9827968, 0.5271367, -0.1064314, 0.945098, 1, 0, 1,
-0.9790446, 0.9277755, -1.648471, 0.9372549, 1, 0, 1,
-0.9788519, 0.2532733, -2.589384, 0.9333333, 1, 0, 1,
-0.9759994, 0.7094551, -1.349136, 0.9254902, 1, 0, 1,
-0.9687746, 0.1660132, -1.342086, 0.9215686, 1, 0, 1,
-0.966911, -1.42345, -2.174405, 0.9137255, 1, 0, 1,
-0.9626697, -1.016026, -1.816701, 0.9098039, 1, 0, 1,
-0.9619673, 0.0114503, -1.59473, 0.9019608, 1, 0, 1,
-0.9585798, 0.7567537, -0.9773124, 0.8941177, 1, 0, 1,
-0.9468647, 0.5571176, -0.9911582, 0.8901961, 1, 0, 1,
-0.9385496, 1.478767, 0.3457887, 0.8823529, 1, 0, 1,
-0.9360279, -0.1909511, -3.028177, 0.8784314, 1, 0, 1,
-0.9360258, -2.4357, -4.504418, 0.8705882, 1, 0, 1,
-0.9359679, 0.8315335, -0.6339855, 0.8666667, 1, 0, 1,
-0.9353453, -1.048896, -1.92637, 0.8588235, 1, 0, 1,
-0.929389, -0.5230261, -0.9342057, 0.854902, 1, 0, 1,
-0.9292216, 0.7067407, -0.7333356, 0.8470588, 1, 0, 1,
-0.9279684, 0.2985577, -3.213245, 0.8431373, 1, 0, 1,
-0.9270901, 0.430162, -2.221722, 0.8352941, 1, 0, 1,
-0.9247325, 0.4807446, -0.8880462, 0.8313726, 1, 0, 1,
-0.9188979, -1.24698, -2.751835, 0.8235294, 1, 0, 1,
-0.9112182, 1.281367, -1.694625, 0.8196079, 1, 0, 1,
-0.9106624, 0.0707498, -1.052318, 0.8117647, 1, 0, 1,
-0.9039255, -1.101862, -1.596837, 0.8078431, 1, 0, 1,
-0.9032118, -0.7346418, -1.407116, 0.8, 1, 0, 1,
-0.8991829, -0.1259212, -2.041043, 0.7921569, 1, 0, 1,
-0.8978743, 0.2676285, -2.336883, 0.7882353, 1, 0, 1,
-0.8958898, -1.716636, -3.274947, 0.7803922, 1, 0, 1,
-0.8913018, -0.1302603, -2.361722, 0.7764706, 1, 0, 1,
-0.8684436, 0.4322693, -1.199357, 0.7686275, 1, 0, 1,
-0.8677586, -0.2967105, -1.208772, 0.7647059, 1, 0, 1,
-0.8599467, 1.176611, -1.854346, 0.7568628, 1, 0, 1,
-0.8504664, -1.888428, -2.982322, 0.7529412, 1, 0, 1,
-0.848443, -0.8412007, -1.70184, 0.7450981, 1, 0, 1,
-0.84817, 0.1096322, -0.5297019, 0.7411765, 1, 0, 1,
-0.8457294, 0.3041037, -2.993775, 0.7333333, 1, 0, 1,
-0.838963, -2.058081, -3.174709, 0.7294118, 1, 0, 1,
-0.8334863, -0.2086616, -0.8950506, 0.7215686, 1, 0, 1,
-0.8290635, -1.025772, -2.286756, 0.7176471, 1, 0, 1,
-0.828274, -1.062955, -3.908565, 0.7098039, 1, 0, 1,
-0.824785, 0.3925019, -1.589444, 0.7058824, 1, 0, 1,
-0.8245892, 0.07884109, -1.639183, 0.6980392, 1, 0, 1,
-0.822282, -0.2234221, -1.857604, 0.6901961, 1, 0, 1,
-0.8203657, -0.3211037, -1.409528, 0.6862745, 1, 0, 1,
-0.8198422, -0.2476162, -2.502269, 0.6784314, 1, 0, 1,
-0.8154316, -0.5673202, -1.2518, 0.6745098, 1, 0, 1,
-0.8140125, -0.7734899, -1.788295, 0.6666667, 1, 0, 1,
-0.8125725, -1.885674, -2.364694, 0.6627451, 1, 0, 1,
-0.8109893, -2.111921, -2.770982, 0.654902, 1, 0, 1,
-0.8054672, -0.4767566, -3.422397, 0.6509804, 1, 0, 1,
-0.8017476, 3.380044, 1.242232, 0.6431373, 1, 0, 1,
-0.7953152, -2.454242, -2.4478, 0.6392157, 1, 0, 1,
-0.7918376, 0.7101125, 0.12431, 0.6313726, 1, 0, 1,
-0.7897151, -0.2165347, -0.793059, 0.627451, 1, 0, 1,
-0.7880951, 1.091851, -0.6082072, 0.6196079, 1, 0, 1,
-0.7852429, 0.370924, -2.894097, 0.6156863, 1, 0, 1,
-0.7841022, -1.790795, -3.5728, 0.6078432, 1, 0, 1,
-0.7809217, -0.9320989, -1.576874, 0.6039216, 1, 0, 1,
-0.780892, -1.378011, -1.450475, 0.5960785, 1, 0, 1,
-0.7779618, -1.576049, -2.513211, 0.5882353, 1, 0, 1,
-0.7746215, -0.4485846, -2.967192, 0.5843138, 1, 0, 1,
-0.763578, 0.4846506, -1.453154, 0.5764706, 1, 0, 1,
-0.7619896, -0.3616067, -1.065666, 0.572549, 1, 0, 1,
-0.7609281, 0.8356464, 0.05891665, 0.5647059, 1, 0, 1,
-0.7582543, -1.510407, -2.6493, 0.5607843, 1, 0, 1,
-0.7532328, -0.4659837, -1.794762, 0.5529412, 1, 0, 1,
-0.7520113, 0.1774764, -1.884676, 0.5490196, 1, 0, 1,
-0.7517785, 1.754165, -1.947063, 0.5411765, 1, 0, 1,
-0.746163, 0.61966, -0.5511892, 0.5372549, 1, 0, 1,
-0.7438246, 0.09174287, -1.688443, 0.5294118, 1, 0, 1,
-0.7368525, 0.8089132, -2.296731, 0.5254902, 1, 0, 1,
-0.728115, -0.440598, -2.773258, 0.5176471, 1, 0, 1,
-0.7279498, 2.39552, -1.773667, 0.5137255, 1, 0, 1,
-0.7184963, -1.03622, -2.278158, 0.5058824, 1, 0, 1,
-0.7182232, -0.06022707, -1.486677, 0.5019608, 1, 0, 1,
-0.718089, 0.733159, -1.209703, 0.4941176, 1, 0, 1,
-0.716343, 1.413005, -1.303064, 0.4862745, 1, 0, 1,
-0.7144803, 1.09527, -0.745917, 0.4823529, 1, 0, 1,
-0.7140479, -0.8091178, -2.423156, 0.4745098, 1, 0, 1,
-0.7139785, -0.07970371, -2.663686, 0.4705882, 1, 0, 1,
-0.7051864, -0.6336175, -3.134453, 0.4627451, 1, 0, 1,
-0.7037295, 0.233128, -0.4001283, 0.4588235, 1, 0, 1,
-0.7032769, 0.9561425, 0.2460034, 0.4509804, 1, 0, 1,
-0.7016793, 0.2217633, -1.498671, 0.4470588, 1, 0, 1,
-0.6960006, 0.06559884, -0.6652738, 0.4392157, 1, 0, 1,
-0.6922233, 1.448274, 0.8659599, 0.4352941, 1, 0, 1,
-0.6867239, -0.3532134, -1.030879, 0.427451, 1, 0, 1,
-0.6854314, -1.826218, -2.250972, 0.4235294, 1, 0, 1,
-0.683175, 0.7434252, -0.08321511, 0.4156863, 1, 0, 1,
-0.6828676, 1.163703, -1.100101, 0.4117647, 1, 0, 1,
-0.6725335, -0.678857, -0.2731238, 0.4039216, 1, 0, 1,
-0.6721643, 0.4465578, -1.349588, 0.3960784, 1, 0, 1,
-0.6663341, -0.02451271, 0.09915055, 0.3921569, 1, 0, 1,
-0.6636851, -0.775672, -2.013192, 0.3843137, 1, 0, 1,
-0.6627335, -0.103586, -1.969715, 0.3803922, 1, 0, 1,
-0.6596298, 0.6522437, -1.556659, 0.372549, 1, 0, 1,
-0.6536301, -0.4054795, -3.929865, 0.3686275, 1, 0, 1,
-0.644989, 1.592354, -1.210513, 0.3607843, 1, 0, 1,
-0.6391077, 0.06751567, -1.773368, 0.3568628, 1, 0, 1,
-0.6388953, 0.8071312, -1.209695, 0.3490196, 1, 0, 1,
-0.6384148, 0.05492629, -3.023514, 0.345098, 1, 0, 1,
-0.6316776, -2.065661, -2.514334, 0.3372549, 1, 0, 1,
-0.6310584, -0.2105658, -1.517451, 0.3333333, 1, 0, 1,
-0.628155, -0.3311391, -1.469892, 0.3254902, 1, 0, 1,
-0.6247578, -1.473613, -3.158901, 0.3215686, 1, 0, 1,
-0.6237451, 1.92491, -0.3590954, 0.3137255, 1, 0, 1,
-0.6058161, 1.508654, -1.493582, 0.3098039, 1, 0, 1,
-0.6011479, 0.7152857, -0.9899854, 0.3019608, 1, 0, 1,
-0.5982746, 1.270322, -0.874436, 0.2941177, 1, 0, 1,
-0.5941219, -0.8498481, -3.543609, 0.2901961, 1, 0, 1,
-0.5923305, -0.09909795, -1.230038, 0.282353, 1, 0, 1,
-0.5915837, -0.6056959, -3.89779, 0.2784314, 1, 0, 1,
-0.5873771, 0.9497177, -1.107914, 0.2705882, 1, 0, 1,
-0.5736552, 1.431932, -0.8885412, 0.2666667, 1, 0, 1,
-0.5727919, -0.5383255, -3.378706, 0.2588235, 1, 0, 1,
-0.5657032, 0.2767498, -1.347524, 0.254902, 1, 0, 1,
-0.5628945, 0.5196359, 0.6101173, 0.2470588, 1, 0, 1,
-0.5570863, 0.4533282, 0.4114972, 0.2431373, 1, 0, 1,
-0.5546335, -0.09235358, -1.933355, 0.2352941, 1, 0, 1,
-0.5534148, -1.322308, -2.176487, 0.2313726, 1, 0, 1,
-0.5511981, 1.051195, -1.031782, 0.2235294, 1, 0, 1,
-0.5476843, 0.2613724, -0.9339086, 0.2196078, 1, 0, 1,
-0.5472725, -0.4204257, -3.789734, 0.2117647, 1, 0, 1,
-0.542332, 2.08835, 0.2443677, 0.2078431, 1, 0, 1,
-0.5376286, -1.307518, -1.806719, 0.2, 1, 0, 1,
-0.5314345, -0.2542267, -3.299626, 0.1921569, 1, 0, 1,
-0.528131, 1.575601, -1.251406, 0.1882353, 1, 0, 1,
-0.5218956, 0.2899865, -2.177014, 0.1803922, 1, 0, 1,
-0.5200872, -0.7348003, -1.210153, 0.1764706, 1, 0, 1,
-0.517656, 0.856889, -1.078676, 0.1686275, 1, 0, 1,
-0.5173168, -1.442836, -3.54329, 0.1647059, 1, 0, 1,
-0.5159549, -0.4476531, -1.717916, 0.1568628, 1, 0, 1,
-0.5157928, 0.6973208, -1.45598, 0.1529412, 1, 0, 1,
-0.5128738, -0.6811479, -2.901008, 0.145098, 1, 0, 1,
-0.4976346, 1.341701, 0.6762682, 0.1411765, 1, 0, 1,
-0.4975733, -0.2088343, -1.34435, 0.1333333, 1, 0, 1,
-0.4969161, 0.6435682, 0.4241993, 0.1294118, 1, 0, 1,
-0.4942999, -0.5519181, -1.582909, 0.1215686, 1, 0, 1,
-0.4932157, 0.002769826, -1.940742, 0.1176471, 1, 0, 1,
-0.4931183, -0.1257777, -3.743606, 0.1098039, 1, 0, 1,
-0.4920202, 0.1594616, -2.286148, 0.1058824, 1, 0, 1,
-0.4904681, 0.5236912, 0.1781395, 0.09803922, 1, 0, 1,
-0.4806687, -0.5897669, -2.539521, 0.09019608, 1, 0, 1,
-0.4749959, 0.3836606, -1.946005, 0.08627451, 1, 0, 1,
-0.4730691, 1.047546, -1.748124, 0.07843138, 1, 0, 1,
-0.4724941, -0.007435062, -1.237112, 0.07450981, 1, 0, 1,
-0.4711305, -0.5105609, -3.157628, 0.06666667, 1, 0, 1,
-0.462244, 0.4700522, -0.1438472, 0.0627451, 1, 0, 1,
-0.4581972, 0.07833917, -2.320116, 0.05490196, 1, 0, 1,
-0.4510311, -1.169304, -1.991101, 0.05098039, 1, 0, 1,
-0.4509864, 0.2034312, -1.054408, 0.04313726, 1, 0, 1,
-0.4425546, 0.5910632, -2.574434, 0.03921569, 1, 0, 1,
-0.4418255, -0.632659, -2.138978, 0.03137255, 1, 0, 1,
-0.4417614, -1.280743, -3.902836, 0.02745098, 1, 0, 1,
-0.4417239, -1.112227, -1.245785, 0.01960784, 1, 0, 1,
-0.4381121, -2.049293, -1.547958, 0.01568628, 1, 0, 1,
-0.4362189, -0.2635355, -2.291873, 0.007843138, 1, 0, 1,
-0.4338599, -1.579021, -2.993817, 0.003921569, 1, 0, 1,
-0.4309991, -0.7639415, -2.157772, 0, 1, 0.003921569, 1,
-0.4298898, -1.077339, -1.697591, 0, 1, 0.01176471, 1,
-0.4248561, 0.650263, 0.1017879, 0, 1, 0.01568628, 1,
-0.4190229, 1.302699, 0.2609078, 0, 1, 0.02352941, 1,
-0.4130798, 1.100629, -1.609087, 0, 1, 0.02745098, 1,
-0.4123158, 0.06852069, -1.35751, 0, 1, 0.03529412, 1,
-0.411921, 0.2583584, -1.721205, 0, 1, 0.03921569, 1,
-0.4115548, -0.8019396, -2.453379, 0, 1, 0.04705882, 1,
-0.4059748, -3.10815, -3.52347, 0, 1, 0.05098039, 1,
-0.4036908, 0.2929723, -2.365417, 0, 1, 0.05882353, 1,
-0.4011617, 0.1021653, -2.762548, 0, 1, 0.0627451, 1,
-0.4000411, -0.1531087, -1.838763, 0, 1, 0.07058824, 1,
-0.3950971, -1.097002, -1.643576, 0, 1, 0.07450981, 1,
-0.3936175, 3.10848, 0.4176716, 0, 1, 0.08235294, 1,
-0.3930462, -0.645135, -0.4786118, 0, 1, 0.08627451, 1,
-0.3923208, 1.613928, 0.7919143, 0, 1, 0.09411765, 1,
-0.3891716, 0.4907444, 0.2123084, 0, 1, 0.1019608, 1,
-0.3858592, 0.3458068, -0.7848316, 0, 1, 0.1058824, 1,
-0.3845553, 0.2340977, -1.359268, 0, 1, 0.1137255, 1,
-0.3781716, 1.10078, 1.596353, 0, 1, 0.1176471, 1,
-0.3748764, 0.5119834, 0.9166769, 0, 1, 0.1254902, 1,
-0.362905, 0.1896342, 1.738693, 0, 1, 0.1294118, 1,
-0.3610201, 0.2354209, -1.639774, 0, 1, 0.1372549, 1,
-0.3598614, -0.3685197, -1.602049, 0, 1, 0.1411765, 1,
-0.3568027, -0.0292608, -2.620719, 0, 1, 0.1490196, 1,
-0.3483978, 0.2869885, -0.2754011, 0, 1, 0.1529412, 1,
-0.345525, -0.6441072, -1.960364, 0, 1, 0.1607843, 1,
-0.3450008, -0.574433, -1.896267, 0, 1, 0.1647059, 1,
-0.3443787, 0.3583022, -0.4509598, 0, 1, 0.172549, 1,
-0.3441516, -0.9485217, -2.306003, 0, 1, 0.1764706, 1,
-0.3426834, -0.222979, -2.003111, 0, 1, 0.1843137, 1,
-0.3394582, -0.3493727, -2.163945, 0, 1, 0.1882353, 1,
-0.3365842, -1.256046, -3.123996, 0, 1, 0.1960784, 1,
-0.3355609, 1.074909, -0.9557703, 0, 1, 0.2039216, 1,
-0.333208, -0.7057126, -3.011159, 0, 1, 0.2078431, 1,
-0.3314883, -1.270492, -1.687648, 0, 1, 0.2156863, 1,
-0.3298347, 0.124586, -0.875942, 0, 1, 0.2196078, 1,
-0.3287949, 1.601517, 0.1047195, 0, 1, 0.227451, 1,
-0.3227259, -1.866416, -1.929298, 0, 1, 0.2313726, 1,
-0.3223396, -0.1768511, -1.123901, 0, 1, 0.2392157, 1,
-0.3207987, -2.531735, -2.79987, 0, 1, 0.2431373, 1,
-0.3163246, -0.4979749, -2.727186, 0, 1, 0.2509804, 1,
-0.3143232, 0.9903441, -0.1517393, 0, 1, 0.254902, 1,
-0.3142188, -0.2948513, -1.392685, 0, 1, 0.2627451, 1,
-0.3129587, -0.08047087, -1.223606, 0, 1, 0.2666667, 1,
-0.3117742, -0.7287101, -4.272756, 0, 1, 0.2745098, 1,
-0.3080313, 0.02955595, -0.03353686, 0, 1, 0.2784314, 1,
-0.3039863, -0.3752397, -2.168751, 0, 1, 0.2862745, 1,
-0.2953686, 0.896743, -0.4807608, 0, 1, 0.2901961, 1,
-0.2946255, -0.5930339, -3.252506, 0, 1, 0.2980392, 1,
-0.293869, 0.09379802, -1.861911, 0, 1, 0.3058824, 1,
-0.2931981, 1.270433, 1.015035, 0, 1, 0.3098039, 1,
-0.2920137, 1.8139, 0.616697, 0, 1, 0.3176471, 1,
-0.2858601, -0.7039968, -2.304172, 0, 1, 0.3215686, 1,
-0.2841778, -0.3737025, -2.928126, 0, 1, 0.3294118, 1,
-0.2836316, 3.186257, -0.4471643, 0, 1, 0.3333333, 1,
-0.2819581, 0.5025144, -0.6469131, 0, 1, 0.3411765, 1,
-0.2793775, 0.8087729, -0.1748468, 0, 1, 0.345098, 1,
-0.2772413, -0.2433732, -1.363496, 0, 1, 0.3529412, 1,
-0.2757833, 0.1358943, 0.2603565, 0, 1, 0.3568628, 1,
-0.2756048, -0.3254276, -3.137023, 0, 1, 0.3647059, 1,
-0.2734115, 1.367963, -1.588527, 0, 1, 0.3686275, 1,
-0.2732751, 0.7863403, -2.136188, 0, 1, 0.3764706, 1,
-0.2720063, -0.6504983, -2.362647, 0, 1, 0.3803922, 1,
-0.2691911, -0.632965, -0.9596474, 0, 1, 0.3882353, 1,
-0.2691632, 0.6659882, 0.773774, 0, 1, 0.3921569, 1,
-0.2594514, 0.286564, -0.8084946, 0, 1, 0.4, 1,
-0.256118, -0.3511462, -2.866299, 0, 1, 0.4078431, 1,
-0.2550457, -1.184415, -3.736842, 0, 1, 0.4117647, 1,
-0.2392795, -0.4421407, -2.495327, 0, 1, 0.4196078, 1,
-0.2390104, -0.3447187, -4.893202, 0, 1, 0.4235294, 1,
-0.2383709, 1.176093, 0.8207834, 0, 1, 0.4313726, 1,
-0.2327412, 0.5547906, -0.6076301, 0, 1, 0.4352941, 1,
-0.2260103, 0.6863604, 0.2234904, 0, 1, 0.4431373, 1,
-0.2257296, 0.2616703, -1.693566, 0, 1, 0.4470588, 1,
-0.2253131, -0.2625779, -1.874294, 0, 1, 0.454902, 1,
-0.2227637, 1.578115, 0.4319637, 0, 1, 0.4588235, 1,
-0.2178575, 1.364857, -0.9872303, 0, 1, 0.4666667, 1,
-0.2151242, -0.2391805, -4.489244, 0, 1, 0.4705882, 1,
-0.2128732, 0.5358263, -1.581139, 0, 1, 0.4784314, 1,
-0.209019, -1.052338, -3.624766, 0, 1, 0.4823529, 1,
-0.2080958, 0.9575382, 0.1201359, 0, 1, 0.4901961, 1,
-0.1987591, -0.2964475, -4.981722, 0, 1, 0.4941176, 1,
-0.1983379, -0.0072301, 0.1572379, 0, 1, 0.5019608, 1,
-0.198324, 0.1400798, 0.3802021, 0, 1, 0.509804, 1,
-0.1977748, 0.4687893, -0.7044119, 0, 1, 0.5137255, 1,
-0.1951469, -0.1981871, 0.112265, 0, 1, 0.5215687, 1,
-0.1907211, 0.564673, 1.015302, 0, 1, 0.5254902, 1,
-0.187289, -0.2135843, -2.083128, 0, 1, 0.5333334, 1,
-0.1848951, -0.6742139, -2.450244, 0, 1, 0.5372549, 1,
-0.1839986, 2.101538, -0.9995653, 0, 1, 0.5450981, 1,
-0.183591, -1.551442, -3.946022, 0, 1, 0.5490196, 1,
-0.1824105, -0.739915, -2.696203, 0, 1, 0.5568628, 1,
-0.1813833, -0.006515839, -0.5956578, 0, 1, 0.5607843, 1,
-0.1811233, 1.155423, 0.6149906, 0, 1, 0.5686275, 1,
-0.1811084, 1.263849, -0.4384755, 0, 1, 0.572549, 1,
-0.1810531, 0.2491616, -1.707319, 0, 1, 0.5803922, 1,
-0.1766968, 1.384064, 0.7985815, 0, 1, 0.5843138, 1,
-0.1763201, -0.4262805, -2.029598, 0, 1, 0.5921569, 1,
-0.1762433, 1.308391, 0.8016706, 0, 1, 0.5960785, 1,
-0.172161, -1.006221, -4.878463, 0, 1, 0.6039216, 1,
-0.1712865, -0.3683246, -2.024909, 0, 1, 0.6117647, 1,
-0.1705573, 1.121626, -0.7586951, 0, 1, 0.6156863, 1,
-0.1705202, -1.709815, -4.023468, 0, 1, 0.6235294, 1,
-0.1683744, -1.065298, -3.178715, 0, 1, 0.627451, 1,
-0.1661768, -0.3582659, -2.208512, 0, 1, 0.6352941, 1,
-0.1627647, -0.1193315, -2.905098, 0, 1, 0.6392157, 1,
-0.161406, 0.8806313, -0.8278432, 0, 1, 0.6470588, 1,
-0.1593823, 0.2258982, 0.6096823, 0, 1, 0.6509804, 1,
-0.1590199, 0.5110528, -0.2945059, 0, 1, 0.6588235, 1,
-0.1537076, 1.4983, 0.4856232, 0, 1, 0.6627451, 1,
-0.1515511, -1.763632, -3.255423, 0, 1, 0.6705883, 1,
-0.1494396, -1.204096, -4.127151, 0, 1, 0.6745098, 1,
-0.1475531, -0.7046595, -2.416199, 0, 1, 0.682353, 1,
-0.1459808, -0.05584579, -2.457749, 0, 1, 0.6862745, 1,
-0.1453395, -0.2563761, -1.683407, 0, 1, 0.6941177, 1,
-0.1451436, -1.842506, -1.826191, 0, 1, 0.7019608, 1,
-0.1378119, -0.40674, -1.423401, 0, 1, 0.7058824, 1,
-0.1355273, 1.289665, -0.8286322, 0, 1, 0.7137255, 1,
-0.1335419, -1.055948, -4.706367, 0, 1, 0.7176471, 1,
-0.1333573, -0.8917935, -3.678596, 0, 1, 0.7254902, 1,
-0.1329685, 0.8832927, -0.1905015, 0, 1, 0.7294118, 1,
-0.1297847, -1.241739, -0.371479, 0, 1, 0.7372549, 1,
-0.1292498, 0.09463748, -2.90288, 0, 1, 0.7411765, 1,
-0.1285737, 1.112875, 1.431434, 0, 1, 0.7490196, 1,
-0.1260723, -1.448436, -4.319021, 0, 1, 0.7529412, 1,
-0.1246396, -0.3931639, -3.504275, 0, 1, 0.7607843, 1,
-0.1244954, 1.024346, 1.522612, 0, 1, 0.7647059, 1,
-0.1240481, -1.195133, -4.580906, 0, 1, 0.772549, 1,
-0.1237771, -0.1529495, -1.754519, 0, 1, 0.7764706, 1,
-0.1197728, -1.493069, -4.685759, 0, 1, 0.7843137, 1,
-0.1190985, -0.4523709, -2.307141, 0, 1, 0.7882353, 1,
-0.1187064, -0.07123984, -1.858577, 0, 1, 0.7960784, 1,
-0.1167198, 0.05571153, 0.5717279, 0, 1, 0.8039216, 1,
-0.1103395, -1.325077, -3.74231, 0, 1, 0.8078431, 1,
-0.1088353, 1.494475, -0.9260864, 0, 1, 0.8156863, 1,
-0.1086083, -0.6761079, -4.066206, 0, 1, 0.8196079, 1,
-0.1017796, 0.5660823, 0.1177243, 0, 1, 0.827451, 1,
-0.09669378, 0.9161455, 0.0790915, 0, 1, 0.8313726, 1,
-0.09026127, 0.01382768, -0.3128905, 0, 1, 0.8392157, 1,
-0.08437654, -0.6063597, -0.8326105, 0, 1, 0.8431373, 1,
-0.08316421, 1.16205, -0.5282322, 0, 1, 0.8509804, 1,
-0.0759158, 0.2844453, 0.3341505, 0, 1, 0.854902, 1,
-0.07524003, 0.3955386, -0.4001964, 0, 1, 0.8627451, 1,
-0.07371331, 0.8771859, -0.3962363, 0, 1, 0.8666667, 1,
-0.0661621, -0.4047811, -4.693096, 0, 1, 0.8745098, 1,
-0.06517599, 0.5864329, -0.1613202, 0, 1, 0.8784314, 1,
-0.06403664, 0.1799057, 0.565495, 0, 1, 0.8862745, 1,
-0.06151228, 0.5621887, 0.4883138, 0, 1, 0.8901961, 1,
-0.05988281, 3.238977, -0.2564095, 0, 1, 0.8980392, 1,
-0.0564666, -1.967219, -2.789273, 0, 1, 0.9058824, 1,
-0.05393792, 0.9323258, -0.5096712, 0, 1, 0.9098039, 1,
-0.05101461, -1.723497, -3.26995, 0, 1, 0.9176471, 1,
-0.0507351, -0.2708236, -3.060573, 0, 1, 0.9215686, 1,
-0.04291501, 1.757905, -0.3272217, 0, 1, 0.9294118, 1,
-0.04190711, 0.4735867, 2.028017, 0, 1, 0.9333333, 1,
-0.04132325, -0.2314453, -3.106385, 0, 1, 0.9411765, 1,
-0.03756228, -1.810632, -3.949829, 0, 1, 0.945098, 1,
-0.0372072, -1.942811, -4.356256, 0, 1, 0.9529412, 1,
-0.03301305, -2.074443, -1.963939, 0, 1, 0.9568627, 1,
-0.03288243, 0.5311082, -1.550856, 0, 1, 0.9647059, 1,
-0.0312377, -0.1895174, -1.741135, 0, 1, 0.9686275, 1,
-0.03112947, 0.8963139, -0.1680773, 0, 1, 0.9764706, 1,
-0.02792667, 1.890281, 0.4689295, 0, 1, 0.9803922, 1,
-0.02785248, -1.152325, -3.650707, 0, 1, 0.9882353, 1,
-0.02718961, -1.897971, -1.72591, 0, 1, 0.9921569, 1,
-0.02637433, 0.3441115, 0.3629811, 0, 1, 1, 1,
-0.02635204, -0.3868507, -2.876356, 0, 0.9921569, 1, 1,
-0.02570358, -1.41534, -3.649379, 0, 0.9882353, 1, 1,
-0.02490706, 0.1468587, -1.834367, 0, 0.9803922, 1, 1,
-0.02238132, 0.7243724, -2.206651, 0, 0.9764706, 1, 1,
-0.02058782, -0.2036303, -2.85769, 0, 0.9686275, 1, 1,
-0.01907148, -1.481279, -2.231309, 0, 0.9647059, 1, 1,
-0.01080669, -0.433879, -3.244342, 0, 0.9568627, 1, 1,
-0.008195729, 0.1666371, 0.3821821, 0, 0.9529412, 1, 1,
-0.003966953, 0.3376633, 0.5733353, 0, 0.945098, 1, 1,
-0.003493128, -1.594008, -2.314103, 0, 0.9411765, 1, 1,
-0.00211842, 0.0600137, -0.5290942, 0, 0.9333333, 1, 1,
-0.0009020884, -0.2272538, -4.793816, 0, 0.9294118, 1, 1,
-0.0005014443, -0.4498048, -4.463196, 0, 0.9215686, 1, 1,
0.002708104, -1.210684, 4.37113, 0, 0.9176471, 1, 1,
0.01084979, 1.344883, 1.047469, 0, 0.9098039, 1, 1,
0.01108431, -0.8209881, 2.462891, 0, 0.9058824, 1, 1,
0.0114112, 0.2946751, 0.331844, 0, 0.8980392, 1, 1,
0.01204466, -0.008432546, 2.879488, 0, 0.8901961, 1, 1,
0.01628396, 1.461577, -0.05034945, 0, 0.8862745, 1, 1,
0.01794362, -1.769014, 2.952068, 0, 0.8784314, 1, 1,
0.02130836, -1.772206, 3.404193, 0, 0.8745098, 1, 1,
0.02303128, -0.9556937, 4.163244, 0, 0.8666667, 1, 1,
0.02381736, 0.4973411, 0.1511143, 0, 0.8627451, 1, 1,
0.02484631, -0.1222834, 0.6155964, 0, 0.854902, 1, 1,
0.02642413, -0.09452827, 2.237093, 0, 0.8509804, 1, 1,
0.02780506, -0.967108, 1.424087, 0, 0.8431373, 1, 1,
0.03018844, -1.745998, 1.284268, 0, 0.8392157, 1, 1,
0.03576907, -1.223331, 3.007675, 0, 0.8313726, 1, 1,
0.03656642, -0.7708938, 2.036808, 0, 0.827451, 1, 1,
0.04034656, -0.8205757, 1.877152, 0, 0.8196079, 1, 1,
0.04255911, -0.6294515, 1.791934, 0, 0.8156863, 1, 1,
0.04715844, -0.178932, 4.22652, 0, 0.8078431, 1, 1,
0.04859186, 1.300565, 0.4389677, 0, 0.8039216, 1, 1,
0.04896802, -0.3116844, 3.12313, 0, 0.7960784, 1, 1,
0.05342779, -2.227576, 4.310081, 0, 0.7882353, 1, 1,
0.05555264, 0.6887742, -0.9194804, 0, 0.7843137, 1, 1,
0.05807003, 0.3738089, -1.885573, 0, 0.7764706, 1, 1,
0.05886715, -0.7577731, 2.118928, 0, 0.772549, 1, 1,
0.06184896, -1.007391, 2.374871, 0, 0.7647059, 1, 1,
0.06626984, -0.1537741, 1.40787, 0, 0.7607843, 1, 1,
0.0694687, -1.080607, 2.987731, 0, 0.7529412, 1, 1,
0.07030216, 1.533634, 1.143543, 0, 0.7490196, 1, 1,
0.07165873, -0.01355157, 0.4109692, 0, 0.7411765, 1, 1,
0.08250288, 0.8390715, -1.480174, 0, 0.7372549, 1, 1,
0.09286747, 0.3378213, -0.858547, 0, 0.7294118, 1, 1,
0.09327713, 0.09416676, 0.5079893, 0, 0.7254902, 1, 1,
0.09456922, -0.7173861, 2.637426, 0, 0.7176471, 1, 1,
0.09532801, 2.578955, 2.300983, 0, 0.7137255, 1, 1,
0.09740438, -0.2248327, 3.019365, 0, 0.7058824, 1, 1,
0.1004124, 0.02782844, 1.412993, 0, 0.6980392, 1, 1,
0.1017522, -1.301401, 4.356349, 0, 0.6941177, 1, 1,
0.1038267, -0.164875, 1.607414, 0, 0.6862745, 1, 1,
0.1090908, -0.2260618, 3.091022, 0, 0.682353, 1, 1,
0.1126965, 0.3137781, 2.198556, 0, 0.6745098, 1, 1,
0.117637, -0.3029599, 3.142219, 0, 0.6705883, 1, 1,
0.1178062, -2.104197, 3.912099, 0, 0.6627451, 1, 1,
0.1207403, 0.5596719, 1.814882, 0, 0.6588235, 1, 1,
0.1207865, -0.9069784, 2.465445, 0, 0.6509804, 1, 1,
0.1208917, 0.2885968, 1.554396, 0, 0.6470588, 1, 1,
0.1294577, 0.2410663, 1.592975, 0, 0.6392157, 1, 1,
0.132091, 0.8140913, 0.2015941, 0, 0.6352941, 1, 1,
0.1335063, -1.15688, 3.113476, 0, 0.627451, 1, 1,
0.1341812, -0.4258461, 3.785655, 0, 0.6235294, 1, 1,
0.1347895, 0.6205812, 1.797057, 0, 0.6156863, 1, 1,
0.1391257, 0.9597275, -1.048749, 0, 0.6117647, 1, 1,
0.1400549, -0.5166423, 2.480058, 0, 0.6039216, 1, 1,
0.1400864, -0.5753015, 3.018938, 0, 0.5960785, 1, 1,
0.1407437, 0.1244906, 2.058112, 0, 0.5921569, 1, 1,
0.1428666, -1.105674, 3.099745, 0, 0.5843138, 1, 1,
0.1435618, -0.586664, 2.952188, 0, 0.5803922, 1, 1,
0.1448325, 3.329643, -0.3273453, 0, 0.572549, 1, 1,
0.1458621, 0.826502, 0.1649528, 0, 0.5686275, 1, 1,
0.148782, 0.2670505, 1.407848, 0, 0.5607843, 1, 1,
0.1499307, -1.487892, 4.1868, 0, 0.5568628, 1, 1,
0.1533876, 0.6859213, -0.1172308, 0, 0.5490196, 1, 1,
0.1541194, 0.7873424, -0.9675189, 0, 0.5450981, 1, 1,
0.1601736, 1.686504, 3.179054, 0, 0.5372549, 1, 1,
0.1639098, -0.6304598, 1.92908, 0, 0.5333334, 1, 1,
0.1669626, -0.2691433, 3.461163, 0, 0.5254902, 1, 1,
0.1681351, -1.571369, 4.550634, 0, 0.5215687, 1, 1,
0.1683105, 1.65535, -0.3426229, 0, 0.5137255, 1, 1,
0.1712032, -1.307094, 2.712634, 0, 0.509804, 1, 1,
0.1755209, 2.564869, -0.7694262, 0, 0.5019608, 1, 1,
0.1787768, 0.4974514, -0.9792698, 0, 0.4941176, 1, 1,
0.1809969, -0.3220516, 2.154913, 0, 0.4901961, 1, 1,
0.1830144, -0.04880759, 3.958006, 0, 0.4823529, 1, 1,
0.1850256, 2.596441, 1.203921, 0, 0.4784314, 1, 1,
0.1852541, 0.5613382, 1.424611, 0, 0.4705882, 1, 1,
0.1884749, -1.684332, 4.415656, 0, 0.4666667, 1, 1,
0.188577, 0.009200676, 3.168596, 0, 0.4588235, 1, 1,
0.1893592, 0.9826476, -0.611172, 0, 0.454902, 1, 1,
0.1908063, -0.2205293, 3.754128, 0, 0.4470588, 1, 1,
0.1939215, -1.231108, 3.263227, 0, 0.4431373, 1, 1,
0.1940944, -0.8758357, 4.079247, 0, 0.4352941, 1, 1,
0.2048872, 0.09344666, 2.111617, 0, 0.4313726, 1, 1,
0.2055321, -1.708174, 2.485401, 0, 0.4235294, 1, 1,
0.2085437, 1.244142, 2.287937, 0, 0.4196078, 1, 1,
0.2091892, 0.1461353, 1.10251, 0, 0.4117647, 1, 1,
0.2103771, 0.8145885, 1.27455, 0, 0.4078431, 1, 1,
0.2106032, -1.231594, 1.753709, 0, 0.4, 1, 1,
0.211224, 0.04126061, 1.500217, 0, 0.3921569, 1, 1,
0.2113468, -1.840482, 1.953681, 0, 0.3882353, 1, 1,
0.2113687, 0.1818588, -0.08491347, 0, 0.3803922, 1, 1,
0.2158705, -3.028925, 2.561913, 0, 0.3764706, 1, 1,
0.2160059, 0.2237174, 1.661463, 0, 0.3686275, 1, 1,
0.2166057, -0.7842695, 3.191952, 0, 0.3647059, 1, 1,
0.2171779, -1.554928, 4.02441, 0, 0.3568628, 1, 1,
0.221233, -2.718759, 3.66817, 0, 0.3529412, 1, 1,
0.222852, -1.305469, 1.903654, 0, 0.345098, 1, 1,
0.2265229, 0.6525742, 2.494684, 0, 0.3411765, 1, 1,
0.2279622, -1.097797, 3.805706, 0, 0.3333333, 1, 1,
0.2296484, 0.6182319, 2.362197, 0, 0.3294118, 1, 1,
0.231653, -0.5306609, 2.916998, 0, 0.3215686, 1, 1,
0.2355807, 1.927178, 0.9120343, 0, 0.3176471, 1, 1,
0.2359236, 0.08511829, 1.074737, 0, 0.3098039, 1, 1,
0.2393644, -0.6170257, 5.000293, 0, 0.3058824, 1, 1,
0.249631, 0.6898019, -0.3333299, 0, 0.2980392, 1, 1,
0.2508111, -0.2352599, 0.6419932, 0, 0.2901961, 1, 1,
0.2516526, 1.495437, 0.0733737, 0, 0.2862745, 1, 1,
0.25826, 0.3515905, 1.253693, 0, 0.2784314, 1, 1,
0.2583926, 0.05693202, 3.126356, 0, 0.2745098, 1, 1,
0.2607004, -1.175716, 3.055866, 0, 0.2666667, 1, 1,
0.2636844, -1.564987, 1.322442, 0, 0.2627451, 1, 1,
0.266091, 0.2658142, -0.6430519, 0, 0.254902, 1, 1,
0.2675045, -1.871974, 4.245964, 0, 0.2509804, 1, 1,
0.2681879, -1.499363, 1.526066, 0, 0.2431373, 1, 1,
0.2706965, 0.4149837, 0.1387749, 0, 0.2392157, 1, 1,
0.2732178, 0.4895733, 0.6509965, 0, 0.2313726, 1, 1,
0.2732753, 0.6322311, 1.647226, 0, 0.227451, 1, 1,
0.2785835, -0.4019926, 3.813432, 0, 0.2196078, 1, 1,
0.2801423, 0.5800465, 0.0370108, 0, 0.2156863, 1, 1,
0.2868381, 0.8150936, -0.5845711, 0, 0.2078431, 1, 1,
0.2881991, 0.5611838, -0.7262344, 0, 0.2039216, 1, 1,
0.2901083, -1.64543, 2.969696, 0, 0.1960784, 1, 1,
0.290114, 1.71156, 0.1802817, 0, 0.1882353, 1, 1,
0.2902388, -1.373014, 3.835627, 0, 0.1843137, 1, 1,
0.2990841, -0.3667297, 2.259359, 0, 0.1764706, 1, 1,
0.3003342, -0.342537, 2.857735, 0, 0.172549, 1, 1,
0.3121315, 0.2598732, 0.7776955, 0, 0.1647059, 1, 1,
0.3162197, -0.2924737, 3.733485, 0, 0.1607843, 1, 1,
0.3176479, -0.1321422, 2.536953, 0, 0.1529412, 1, 1,
0.32001, 1.108979, -0.1772569, 0, 0.1490196, 1, 1,
0.3200757, 0.5640174, 1.57, 0, 0.1411765, 1, 1,
0.3275087, -0.5061235, 3.618834, 0, 0.1372549, 1, 1,
0.3319246, 1.449156, -1.494412, 0, 0.1294118, 1, 1,
0.3327495, -1.289447, 4.005027, 0, 0.1254902, 1, 1,
0.3329227, -1.109006, 2.203001, 0, 0.1176471, 1, 1,
0.334471, -0.7313856, 1.699662, 0, 0.1137255, 1, 1,
0.3344857, -1.502954, 2.309294, 0, 0.1058824, 1, 1,
0.3437587, 0.1464045, 1.110316, 0, 0.09803922, 1, 1,
0.3452806, -0.6115975, 3.245295, 0, 0.09411765, 1, 1,
0.3481118, -0.9087783, 3.230827, 0, 0.08627451, 1, 1,
0.3536617, -0.99852, 2.147127, 0, 0.08235294, 1, 1,
0.3553675, 0.9113746, 0.4387917, 0, 0.07450981, 1, 1,
0.3624764, -0.07095236, 1.081639, 0, 0.07058824, 1, 1,
0.3635162, -0.8175406, 3.268535, 0, 0.0627451, 1, 1,
0.3636317, -0.8330148, 2.541893, 0, 0.05882353, 1, 1,
0.3661344, 1.251234, -1.467547, 0, 0.05098039, 1, 1,
0.375024, 0.3482141, -0.1010239, 0, 0.04705882, 1, 1,
0.3753521, -0.2996652, 2.292158, 0, 0.03921569, 1, 1,
0.376534, 0.4074681, -0.01904024, 0, 0.03529412, 1, 1,
0.3767685, 0.8283105, -0.287452, 0, 0.02745098, 1, 1,
0.3823288, 0.2687949, 0.363426, 0, 0.02352941, 1, 1,
0.3868986, -0.4840529, 3.372573, 0, 0.01568628, 1, 1,
0.3871543, 1.000614, -1.064086, 0, 0.01176471, 1, 1,
0.3880864, 0.6762695, 1.744669, 0, 0.003921569, 1, 1,
0.3914697, -0.08173393, 2.946846, 0.003921569, 0, 1, 1,
0.3931704, -0.3477414, 1.484553, 0.007843138, 0, 1, 1,
0.3993505, -1.095297, 1.32231, 0.01568628, 0, 1, 1,
0.4094007, 0.2470932, 2.751058, 0.01960784, 0, 1, 1,
0.4236582, 1.565836, 0.3595631, 0.02745098, 0, 1, 1,
0.4270696, 0.9861181, 0.5038755, 0.03137255, 0, 1, 1,
0.4272441, 0.1639875, 1.037843, 0.03921569, 0, 1, 1,
0.4286346, 1.401884, -0.2201574, 0.04313726, 0, 1, 1,
0.4304574, -0.413355, -0.5048098, 0.05098039, 0, 1, 1,
0.4337075, 0.500173, -0.1320549, 0.05490196, 0, 1, 1,
0.4374124, 0.3754812, 2.767662, 0.0627451, 0, 1, 1,
0.4445989, 1.158465, 2.767769, 0.06666667, 0, 1, 1,
0.4541407, -1.021266, 2.646847, 0.07450981, 0, 1, 1,
0.4562365, -1.302578, 2.392616, 0.07843138, 0, 1, 1,
0.4661794, 0.8367258, 1.282339, 0.08627451, 0, 1, 1,
0.4662061, 0.1302021, 0.7591397, 0.09019608, 0, 1, 1,
0.4681418, 0.2407618, 0.01466417, 0.09803922, 0, 1, 1,
0.4737963, 0.116212, 1.160609, 0.1058824, 0, 1, 1,
0.4741354, 0.7384098, 0.1690302, 0.1098039, 0, 1, 1,
0.4743465, 1.358413, 1.561171, 0.1176471, 0, 1, 1,
0.4748125, 0.5338397, 0.07189106, 0.1215686, 0, 1, 1,
0.4769047, 0.2504459, 2.055018, 0.1294118, 0, 1, 1,
0.4801236, -1.456632, 3.300357, 0.1333333, 0, 1, 1,
0.4805246, 0.9502252, 0.8292508, 0.1411765, 0, 1, 1,
0.4811496, 1.978892, 0.08921499, 0.145098, 0, 1, 1,
0.4832399, -2.038177, 2.306368, 0.1529412, 0, 1, 1,
0.4854863, -1.081903, 4.015996, 0.1568628, 0, 1, 1,
0.4865479, 0.2379566, 1.622309, 0.1647059, 0, 1, 1,
0.4884195, -0.4360918, 3.60191, 0.1686275, 0, 1, 1,
0.4892898, 0.9841564, -1.031042, 0.1764706, 0, 1, 1,
0.4942022, -0.2233056, 3.341316, 0.1803922, 0, 1, 1,
0.495015, -0.1182564, 3.745158, 0.1882353, 0, 1, 1,
0.4951684, -0.02758285, 2.071791, 0.1921569, 0, 1, 1,
0.4956881, -0.0745898, 2.954105, 0.2, 0, 1, 1,
0.4966733, -1.080186, 3.583343, 0.2078431, 0, 1, 1,
0.497354, -0.2088394, 1.867277, 0.2117647, 0, 1, 1,
0.4981832, -0.5579609, 0.03388917, 0.2196078, 0, 1, 1,
0.5019937, -0.1666262, 0.06551993, 0.2235294, 0, 1, 1,
0.5039189, 0.6412072, 1.975772, 0.2313726, 0, 1, 1,
0.5056008, -0.4009911, 2.577029, 0.2352941, 0, 1, 1,
0.5073471, 1.830833, -0.5243295, 0.2431373, 0, 1, 1,
0.5074448, -0.2431122, 1.802602, 0.2470588, 0, 1, 1,
0.507917, -1.068911, 1.446638, 0.254902, 0, 1, 1,
0.5092636, 1.407831, 0.5587711, 0.2588235, 0, 1, 1,
0.5120057, -0.2558011, 3.984458, 0.2666667, 0, 1, 1,
0.523924, -0.5513598, 1.884046, 0.2705882, 0, 1, 1,
0.5262151, 0.2946995, 1.686393, 0.2784314, 0, 1, 1,
0.5287527, 0.9197118, -0.2034473, 0.282353, 0, 1, 1,
0.53681, 0.2444366, 0.3085676, 0.2901961, 0, 1, 1,
0.5379506, 0.3073586, 0.2989531, 0.2941177, 0, 1, 1,
0.540192, -1.296801, 2.457002, 0.3019608, 0, 1, 1,
0.5419992, -1.36655, 4.109453, 0.3098039, 0, 1, 1,
0.5424775, -0.528703, 1.295205, 0.3137255, 0, 1, 1,
0.5478256, -0.4956582, 2.549247, 0.3215686, 0, 1, 1,
0.5480952, -1.512074, 2.450374, 0.3254902, 0, 1, 1,
0.5483276, -0.5173445, 1.749639, 0.3333333, 0, 1, 1,
0.5566925, -0.6257879, 3.499326, 0.3372549, 0, 1, 1,
0.565072, 0.8827469, 0.8487715, 0.345098, 0, 1, 1,
0.5687788, 0.5172638, 3.21525, 0.3490196, 0, 1, 1,
0.5743612, -0.5783589, 3.303786, 0.3568628, 0, 1, 1,
0.5757554, -0.689154, 2.455262, 0.3607843, 0, 1, 1,
0.5837842, 0.1426285, 0.7863447, 0.3686275, 0, 1, 1,
0.5845679, -0.630229, 3.841282, 0.372549, 0, 1, 1,
0.5867817, 1.0975, 0.8240632, 0.3803922, 0, 1, 1,
0.5929809, 1.303547, -0.2270143, 0.3843137, 0, 1, 1,
0.5939317, 0.2342973, 3.073989, 0.3921569, 0, 1, 1,
0.5951636, -0.8937889, 2.570505, 0.3960784, 0, 1, 1,
0.5968541, -0.2051079, 1.66431, 0.4039216, 0, 1, 1,
0.6023638, -0.5854524, 2.96079, 0.4117647, 0, 1, 1,
0.6097841, 0.01387609, 0.6630405, 0.4156863, 0, 1, 1,
0.6131095, 0.9562994, -0.5614085, 0.4235294, 0, 1, 1,
0.6133538, -2.553843, 2.459905, 0.427451, 0, 1, 1,
0.6148667, 0.7644981, 2.586417, 0.4352941, 0, 1, 1,
0.620278, -0.1694144, 2.961308, 0.4392157, 0, 1, 1,
0.6230356, -0.5931171, 1.85901, 0.4470588, 0, 1, 1,
0.626429, -2.612322, 1.790489, 0.4509804, 0, 1, 1,
0.630854, 2.056368, 0.898572, 0.4588235, 0, 1, 1,
0.6345134, -1.304323, 2.561167, 0.4627451, 0, 1, 1,
0.6349583, 1.54583, -0.7513248, 0.4705882, 0, 1, 1,
0.6349824, -0.7744874, 3.314048, 0.4745098, 0, 1, 1,
0.6350504, -0.2497217, 1.448991, 0.4823529, 0, 1, 1,
0.6455541, -0.1563878, 1.483015, 0.4862745, 0, 1, 1,
0.6550862, -0.2366367, 3.086786, 0.4941176, 0, 1, 1,
0.6597143, 1.102405, 0.8548653, 0.5019608, 0, 1, 1,
0.6678951, 0.404685, 2.457495, 0.5058824, 0, 1, 1,
0.6721109, 0.1210906, 2.752985, 0.5137255, 0, 1, 1,
0.6736414, 0.4781017, 2.066826, 0.5176471, 0, 1, 1,
0.6757787, 0.06130937, 1.09722, 0.5254902, 0, 1, 1,
0.687793, 0.2516201, 1.668832, 0.5294118, 0, 1, 1,
0.6926031, -0.1709958, 2.854203, 0.5372549, 0, 1, 1,
0.6954833, -1.402605, 2.863583, 0.5411765, 0, 1, 1,
0.7031529, -0.3183231, 3.595089, 0.5490196, 0, 1, 1,
0.7045364, -1.612146, 2.710586, 0.5529412, 0, 1, 1,
0.7063744, 0.4118481, 2.645745, 0.5607843, 0, 1, 1,
0.7078178, -0.6120228, 3.107831, 0.5647059, 0, 1, 1,
0.7088836, -1.429515, 3.316217, 0.572549, 0, 1, 1,
0.7106198, -0.1031561, 0.5571268, 0.5764706, 0, 1, 1,
0.7129768, -0.4932477, 1.294308, 0.5843138, 0, 1, 1,
0.7167592, -1.236531, 3.517846, 0.5882353, 0, 1, 1,
0.718833, -0.01618439, 1.669593, 0.5960785, 0, 1, 1,
0.7219603, 1.300508, 0.1920307, 0.6039216, 0, 1, 1,
0.7294724, -1.068501, 2.650351, 0.6078432, 0, 1, 1,
0.7315192, 0.621019, 0.1038274, 0.6156863, 0, 1, 1,
0.732757, 0.6713344, 1.295974, 0.6196079, 0, 1, 1,
0.7335808, 0.3139388, -0.5975248, 0.627451, 0, 1, 1,
0.7362996, -0.4251966, 2.295622, 0.6313726, 0, 1, 1,
0.7393894, -0.5193401, 2.28636, 0.6392157, 0, 1, 1,
0.7414431, -1.231121, 1.346849, 0.6431373, 0, 1, 1,
0.7423511, 1.566631, 0.3430137, 0.6509804, 0, 1, 1,
0.7570977, -0.6486606, 1.537918, 0.654902, 0, 1, 1,
0.7602906, -0.486359, 2.155672, 0.6627451, 0, 1, 1,
0.7603361, -0.5266674, 3.191999, 0.6666667, 0, 1, 1,
0.7636245, -0.1867202, 2.986555, 0.6745098, 0, 1, 1,
0.765956, 2.911567, 0.7559964, 0.6784314, 0, 1, 1,
0.7680851, 0.1685123, 1.997652, 0.6862745, 0, 1, 1,
0.7698835, -0.526962, 1.590706, 0.6901961, 0, 1, 1,
0.7716289, -2.121135, 3.258929, 0.6980392, 0, 1, 1,
0.7742377, -0.961693, 2.873601, 0.7058824, 0, 1, 1,
0.7749704, -3.404513, 3.07527, 0.7098039, 0, 1, 1,
0.7780244, -2.063699, 0.0286589, 0.7176471, 0, 1, 1,
0.7788475, -0.6271783, 3.094986, 0.7215686, 0, 1, 1,
0.7801046, -0.0216891, 1.546049, 0.7294118, 0, 1, 1,
0.7858167, -1.891479, 4.873745, 0.7333333, 0, 1, 1,
0.7886401, -1.142693, 3.385223, 0.7411765, 0, 1, 1,
0.7896666, -0.9199721, 2.140597, 0.7450981, 0, 1, 1,
0.7924067, -0.3730667, 2.338094, 0.7529412, 0, 1, 1,
0.796205, 2.530177, 1.459112, 0.7568628, 0, 1, 1,
0.7980784, 0.1403029, 2.540399, 0.7647059, 0, 1, 1,
0.8079602, -0.9347917, 2.978251, 0.7686275, 0, 1, 1,
0.8098578, -0.5066749, 1.788366, 0.7764706, 0, 1, 1,
0.8112869, 0.7216057, 0.832339, 0.7803922, 0, 1, 1,
0.8137177, -2.526592, 1.81785, 0.7882353, 0, 1, 1,
0.8151129, 2.208775, -0.3881407, 0.7921569, 0, 1, 1,
0.8171564, 0.8739482, 1.253677, 0.8, 0, 1, 1,
0.8182484, -0.7493734, 1.222707, 0.8078431, 0, 1, 1,
0.8206479, -0.5059608, 1.500169, 0.8117647, 0, 1, 1,
0.8250294, 0.1050072, 0.8403847, 0.8196079, 0, 1, 1,
0.8279346, 0.3932119, 1.060131, 0.8235294, 0, 1, 1,
0.829285, 0.6294866, 2.128658, 0.8313726, 0, 1, 1,
0.8405831, 0.4174618, 1.562412, 0.8352941, 0, 1, 1,
0.8418126, -0.2026246, 3.022301, 0.8431373, 0, 1, 1,
0.8536519, 0.2323859, 1.133222, 0.8470588, 0, 1, 1,
0.8669642, -1.893312, 2.883102, 0.854902, 0, 1, 1,
0.870395, 0.5467369, 1.302947, 0.8588235, 0, 1, 1,
0.8711426, -0.1025318, 1.729407, 0.8666667, 0, 1, 1,
0.8792329, 1.474533, 0.2134922, 0.8705882, 0, 1, 1,
0.8808897, -1.41723, 0.462507, 0.8784314, 0, 1, 1,
0.8861106, 0.9312454, 0.4323036, 0.8823529, 0, 1, 1,
0.8955717, 0.1993652, 1.855807, 0.8901961, 0, 1, 1,
0.9021438, 0.4709329, -0.1547818, 0.8941177, 0, 1, 1,
0.9047951, 0.4640592, 0.8030506, 0.9019608, 0, 1, 1,
0.9102727, 0.8714827, 1.510591, 0.9098039, 0, 1, 1,
0.916338, -1.245451, 1.185728, 0.9137255, 0, 1, 1,
0.9191052, 0.8825654, 0.7488422, 0.9215686, 0, 1, 1,
0.9226243, 1.329467, 1.17794, 0.9254902, 0, 1, 1,
0.9255501, 0.8701467, 0.7247517, 0.9333333, 0, 1, 1,
0.9267038, 0.03019094, 3.702966, 0.9372549, 0, 1, 1,
0.9317181, 0.01953086, 1.043649, 0.945098, 0, 1, 1,
0.9321907, 1.444703, 0.5522021, 0.9490196, 0, 1, 1,
0.9466682, -0.972105, 1.093395, 0.9568627, 0, 1, 1,
0.9469382, 0.0172503, 1.265581, 0.9607843, 0, 1, 1,
0.9495631, -2.020826, 2.516552, 0.9686275, 0, 1, 1,
0.951728, -1.194209, 0.729745, 0.972549, 0, 1, 1,
0.9527224, 0.0905633, -1.173173, 0.9803922, 0, 1, 1,
0.9582546, 0.1412233, 2.393881, 0.9843137, 0, 1, 1,
0.95831, -1.627912, 1.984035, 0.9921569, 0, 1, 1,
0.9600972, -1.359859, 1.693924, 0.9960784, 0, 1, 1,
0.9629993, 0.2891057, 2.029528, 1, 0, 0.9960784, 1,
0.9662459, 0.3261881, 0.9487429, 1, 0, 0.9882353, 1,
0.9684588, 0.4946878, 3.758958, 1, 0, 0.9843137, 1,
0.9768842, 0.7064167, -0.4930261, 1, 0, 0.9764706, 1,
0.9840596, 0.06614344, 1.698842, 1, 0, 0.972549, 1,
0.9871939, 0.2423928, 1.449209, 1, 0, 0.9647059, 1,
0.9873086, -1.735527, 2.459073, 1, 0, 0.9607843, 1,
0.9873297, -0.2140464, 2.006857, 1, 0, 0.9529412, 1,
0.9898888, -0.3937964, 2.155978, 1, 0, 0.9490196, 1,
0.9934978, 3.180107, -0.6775794, 1, 0, 0.9411765, 1,
0.9965506, -0.3339471, -1.490278, 1, 0, 0.9372549, 1,
1.00544, -1.043316, 2.726749, 1, 0, 0.9294118, 1,
1.00972, -1.152859, 2.837341, 1, 0, 0.9254902, 1,
1.009779, -1.72804, 2.713405, 1, 0, 0.9176471, 1,
1.016343, 1.483635, 1.958989, 1, 0, 0.9137255, 1,
1.020427, -0.7282737, 2.555532, 1, 0, 0.9058824, 1,
1.029774, -1.12946, 1.009215, 1, 0, 0.9019608, 1,
1.032834, -0.5237951, 1.109376, 1, 0, 0.8941177, 1,
1.0349, 0.5377671, 0.8385092, 1, 0, 0.8862745, 1,
1.049808, -1.807022, 1.819775, 1, 0, 0.8823529, 1,
1.052778, -0.5986199, 0.3183059, 1, 0, 0.8745098, 1,
1.053162, -1.297333, 2.69378, 1, 0, 0.8705882, 1,
1.060311, 0.8279555, 1.055791, 1, 0, 0.8627451, 1,
1.063478, -0.9793606, 2.319262, 1, 0, 0.8588235, 1,
1.069882, -0.06983378, 1.888809, 1, 0, 0.8509804, 1,
1.075644, -1.186232, 2.77557, 1, 0, 0.8470588, 1,
1.078158, 0.1201662, 2.001386, 1, 0, 0.8392157, 1,
1.078884, 0.3412771, 1.86979, 1, 0, 0.8352941, 1,
1.086252, 0.3046897, 1.352693, 1, 0, 0.827451, 1,
1.089915, 1.240179, 1.920668, 1, 0, 0.8235294, 1,
1.098439, -2.115654, 3.508204, 1, 0, 0.8156863, 1,
1.105829, -0.03451312, 2.475342, 1, 0, 0.8117647, 1,
1.113669, 0.480697, -0.1657997, 1, 0, 0.8039216, 1,
1.116875, -0.4936449, 0.7044254, 1, 0, 0.7960784, 1,
1.120324, 0.3828587, 0.1343179, 1, 0, 0.7921569, 1,
1.128594, -0.9387479, 3.810945, 1, 0, 0.7843137, 1,
1.129643, -0.6207498, 1.796695, 1, 0, 0.7803922, 1,
1.14338, -0.3799162, 1.957864, 1, 0, 0.772549, 1,
1.14382, 1.256913, 0.2717948, 1, 0, 0.7686275, 1,
1.158457, -1.834324, 3.25371, 1, 0, 0.7607843, 1,
1.169509, -0.3452724, 3.655785, 1, 0, 0.7568628, 1,
1.173948, -0.1282206, 1.147072, 1, 0, 0.7490196, 1,
1.17608, 0.5752436, 1.560739, 1, 0, 0.7450981, 1,
1.179025, -1.041027, 0.2081671, 1, 0, 0.7372549, 1,
1.189035, 0.005057752, 2.372895, 1, 0, 0.7333333, 1,
1.190328, 0.9233787, 1.716987, 1, 0, 0.7254902, 1,
1.195901, -1.799554, 1.688153, 1, 0, 0.7215686, 1,
1.197242, 0.852979, -0.3792634, 1, 0, 0.7137255, 1,
1.205774, 0.3009272, 0.02562674, 1, 0, 0.7098039, 1,
1.207763, -0.1302748, 1.558125, 1, 0, 0.7019608, 1,
1.210395, -0.4057372, 1.683311, 1, 0, 0.6941177, 1,
1.214684, 0.05163963, -0.7168257, 1, 0, 0.6901961, 1,
1.217456, -0.4511497, 2.223144, 1, 0, 0.682353, 1,
1.224049, 0.1191655, 2.48555, 1, 0, 0.6784314, 1,
1.234879, -0.91975, 1.777128, 1, 0, 0.6705883, 1,
1.239339, -1.178238, 3.629267, 1, 0, 0.6666667, 1,
1.242563, 0.3980696, 1.195652, 1, 0, 0.6588235, 1,
1.245388, 1.99131, 0.5387721, 1, 0, 0.654902, 1,
1.248751, 1.086856, -1.161941, 1, 0, 0.6470588, 1,
1.250817, 1.342892, 1.33563, 1, 0, 0.6431373, 1,
1.272983, 1.336916, 0.3238501, 1, 0, 0.6352941, 1,
1.276685, 1.968239, -0.004054519, 1, 0, 0.6313726, 1,
1.280018, -0.8095926, 0.4794503, 1, 0, 0.6235294, 1,
1.281504, 0.3695034, 2.454367, 1, 0, 0.6196079, 1,
1.282137, 0.6881932, 0.5539278, 1, 0, 0.6117647, 1,
1.293929, 0.0663785, 2.932668, 1, 0, 0.6078432, 1,
1.304606, -1.206909, 3.623269, 1, 0, 0.6, 1,
1.319007, -0.4002489, 3.041529, 1, 0, 0.5921569, 1,
1.327991, -1.266942, 3.161252, 1, 0, 0.5882353, 1,
1.336002, 0.8354927, -0.01937382, 1, 0, 0.5803922, 1,
1.336367, 0.8913174, 2.812227, 1, 0, 0.5764706, 1,
1.337027, 0.9052777, 2.731898, 1, 0, 0.5686275, 1,
1.347885, -0.5753908, 3.859351, 1, 0, 0.5647059, 1,
1.359505, 1.723947, 3.340357, 1, 0, 0.5568628, 1,
1.367195, 0.2257682, 0.6368697, 1, 0, 0.5529412, 1,
1.374014, 1.436525, 0.1617489, 1, 0, 0.5450981, 1,
1.374493, 0.35102, 3.414535, 1, 0, 0.5411765, 1,
1.380785, 1.648267, 0.6377122, 1, 0, 0.5333334, 1,
1.38115, -0.1545591, 1.518954, 1, 0, 0.5294118, 1,
1.381475, 0.2935288, 0.561087, 1, 0, 0.5215687, 1,
1.404197, 1.174582, 0.5892554, 1, 0, 0.5176471, 1,
1.407552, -0.115742, 2.434074, 1, 0, 0.509804, 1,
1.416782, 1.316212, 1.120757, 1, 0, 0.5058824, 1,
1.41831, -0.1871591, 1.270533, 1, 0, 0.4980392, 1,
1.419931, 0.08758254, 0.0524059, 1, 0, 0.4901961, 1,
1.419956, 0.1153178, 1.028548, 1, 0, 0.4862745, 1,
1.425816, -0.2931135, 1.894902, 1, 0, 0.4784314, 1,
1.454885, -2.457457, 2.334367, 1, 0, 0.4745098, 1,
1.4561, -1.817641, 3.189852, 1, 0, 0.4666667, 1,
1.467257, 0.0591587, 0.7542055, 1, 0, 0.4627451, 1,
1.478455, -2.019718, 3.028942, 1, 0, 0.454902, 1,
1.479706, -0.1102948, 0.7228086, 1, 0, 0.4509804, 1,
1.482329, -0.788119, 2.035741, 1, 0, 0.4431373, 1,
1.50625, -1.243949, 1.644617, 1, 0, 0.4392157, 1,
1.511038, 0.6757775, 0.7251601, 1, 0, 0.4313726, 1,
1.526595, -1.927075, 1.89334, 1, 0, 0.427451, 1,
1.529145, 0.3723111, 1.292762, 1, 0, 0.4196078, 1,
1.532969, 0.8135725, 1.126626, 1, 0, 0.4156863, 1,
1.545725, 0.2788143, 2.049478, 1, 0, 0.4078431, 1,
1.549379, -0.9329872, 2.808104, 1, 0, 0.4039216, 1,
1.553579, 0.04750884, 3.240082, 1, 0, 0.3960784, 1,
1.55466, -0.2141219, 2.551973, 1, 0, 0.3882353, 1,
1.559636, 0.02184499, 2.020429, 1, 0, 0.3843137, 1,
1.563719, -1.576317, 2.222176, 1, 0, 0.3764706, 1,
1.571729, -0.7706917, 3.373735, 1, 0, 0.372549, 1,
1.577914, 0.2367766, 2.250908, 1, 0, 0.3647059, 1,
1.595357, -0.9610744, 2.349838, 1, 0, 0.3607843, 1,
1.595887, 0.4076045, 1.085158, 1, 0, 0.3529412, 1,
1.605043, 1.760165, 2.558784, 1, 0, 0.3490196, 1,
1.627603, -1.263253, 2.212955, 1, 0, 0.3411765, 1,
1.643526, -2.094122, 3.834466, 1, 0, 0.3372549, 1,
1.656757, -0.4170296, 1.043637, 1, 0, 0.3294118, 1,
1.670185, -0.09802438, 2.241467, 1, 0, 0.3254902, 1,
1.672695, -1.041292, 3.241537, 1, 0, 0.3176471, 1,
1.676439, 0.1146644, 1.798991, 1, 0, 0.3137255, 1,
1.680004, -0.04761252, 1.540889, 1, 0, 0.3058824, 1,
1.700783, 0.9181535, 1.86597, 1, 0, 0.2980392, 1,
1.701307, 0.3592726, 0.5483064, 1, 0, 0.2941177, 1,
1.718017, -0.5791849, 0.6683689, 1, 0, 0.2862745, 1,
1.723085, -0.4039851, 1.037424, 1, 0, 0.282353, 1,
1.728017, 0.7443793, 2.075685, 1, 0, 0.2745098, 1,
1.731202, -0.2456304, 2.846, 1, 0, 0.2705882, 1,
1.731465, -2.001461, 2.504238, 1, 0, 0.2627451, 1,
1.773802, 1.457996, 0.8452073, 1, 0, 0.2588235, 1,
1.776082, 0.1763725, 2.039824, 1, 0, 0.2509804, 1,
1.780591, -1.562713, 1.174944, 1, 0, 0.2470588, 1,
1.813098, 1.290508, 1.396453, 1, 0, 0.2392157, 1,
1.815522, -0.4760494, 1.747476, 1, 0, 0.2352941, 1,
1.821924, -1.161537, 2.754723, 1, 0, 0.227451, 1,
1.834845, 0.03104748, 2.343612, 1, 0, 0.2235294, 1,
1.83539, -0.5804634, 2.857566, 1, 0, 0.2156863, 1,
1.843035, 0.3021967, 2.06533, 1, 0, 0.2117647, 1,
1.851725, -1.014852, 0.6367042, 1, 0, 0.2039216, 1,
1.88227, 0.2562012, 1.746278, 1, 0, 0.1960784, 1,
1.92573, -1.052648, 1.848215, 1, 0, 0.1921569, 1,
1.937099, 0.4050361, 3.284695, 1, 0, 0.1843137, 1,
1.978979, 0.4882539, 0.5691494, 1, 0, 0.1803922, 1,
2.001986, 0.5919929, 1.637492, 1, 0, 0.172549, 1,
2.006545, -0.4567502, 0.947995, 1, 0, 0.1686275, 1,
2.007602, 1.538775, 1.170939, 1, 0, 0.1607843, 1,
2.035133, -1.446362, 2.577364, 1, 0, 0.1568628, 1,
2.063843, -0.5314802, 3.456302, 1, 0, 0.1490196, 1,
2.074356, 0.6075462, 1.288892, 1, 0, 0.145098, 1,
2.085169, -0.2924436, 2.743453, 1, 0, 0.1372549, 1,
2.094993, 0.4999919, 1.215229, 1, 0, 0.1333333, 1,
2.101332, 0.2199992, 1.413979, 1, 0, 0.1254902, 1,
2.148729, -2.077724, 0.9636169, 1, 0, 0.1215686, 1,
2.158082, 0.07671978, 1.822646, 1, 0, 0.1137255, 1,
2.164048, -0.9950049, 0.3840891, 1, 0, 0.1098039, 1,
2.208872, 0.3709461, -0.753489, 1, 0, 0.1019608, 1,
2.213283, 0.8240229, -0.2433922, 1, 0, 0.09411765, 1,
2.227108, -0.1607056, 1.897007, 1, 0, 0.09019608, 1,
2.283546, 1.409821, 0.1810902, 1, 0, 0.08235294, 1,
2.306719, -0.6378307, 1.549028, 1, 0, 0.07843138, 1,
2.345649, -1.036535, 0.7727841, 1, 0, 0.07058824, 1,
2.354447, -1.914093, 0.8931261, 1, 0, 0.06666667, 1,
2.376433, -0.582562, 2.720695, 1, 0, 0.05882353, 1,
2.401695, 1.801127, 1.607613, 1, 0, 0.05490196, 1,
2.430604, -0.6070634, 1.117406, 1, 0, 0.04705882, 1,
2.430816, 1.334964, 1.884202, 1, 0, 0.04313726, 1,
2.533959, 0.1395857, 2.607984, 1, 0, 0.03529412, 1,
2.613719, 0.05667546, 1.205827, 1, 0, 0.03137255, 1,
2.858893, -2.144816, 1.575659, 1, 0, 0.02352941, 1,
2.869658, -0.3733339, 0.3244984, 1, 0, 0.01960784, 1,
2.977875, 1.376368, -1.097652, 1, 0, 0.01176471, 1,
3.984496, 0.8639992, 0.5375441, 1, 0, 0.007843138, 1
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
0.1772709, -4.554495, -6.673674, 0, -0.5, 0.5, 0.5,
0.1772709, -4.554495, -6.673674, 1, -0.5, 0.5, 0.5,
0.1772709, -4.554495, -6.673674, 1, 1.5, 0.5, 0.5,
0.1772709, -4.554495, -6.673674, 0, 1.5, 0.5, 0.5
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
-4.920604, -0.01223445, -6.673674, 0, -0.5, 0.5, 0.5,
-4.920604, -0.01223445, -6.673674, 1, -0.5, 0.5, 0.5,
-4.920604, -0.01223445, -6.673674, 1, 1.5, 0.5, 0.5,
-4.920604, -0.01223445, -6.673674, 0, 1.5, 0.5, 0.5
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
-4.920604, -4.554495, 0.009285212, 0, -0.5, 0.5, 0.5,
-4.920604, -4.554495, 0.009285212, 1, -0.5, 0.5, 0.5,
-4.920604, -4.554495, 0.009285212, 1, 1.5, 0.5, 0.5,
-4.920604, -4.554495, 0.009285212, 0, 1.5, 0.5, 0.5
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
-2, -3.506281, -5.131453,
2, -3.506281, -5.131453,
-2, -3.506281, -5.131453,
-2, -3.680983, -5.388489,
0, -3.506281, -5.131453,
0, -3.680983, -5.388489,
2, -3.506281, -5.131453,
2, -3.680983, -5.388489
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
-2, -4.030388, -5.902563, 0, -0.5, 0.5, 0.5,
-2, -4.030388, -5.902563, 1, -0.5, 0.5, 0.5,
-2, -4.030388, -5.902563, 1, 1.5, 0.5, 0.5,
-2, -4.030388, -5.902563, 0, 1.5, 0.5, 0.5,
0, -4.030388, -5.902563, 0, -0.5, 0.5, 0.5,
0, -4.030388, -5.902563, 1, -0.5, 0.5, 0.5,
0, -4.030388, -5.902563, 1, 1.5, 0.5, 0.5,
0, -4.030388, -5.902563, 0, 1.5, 0.5, 0.5,
2, -4.030388, -5.902563, 0, -0.5, 0.5, 0.5,
2, -4.030388, -5.902563, 1, -0.5, 0.5, 0.5,
2, -4.030388, -5.902563, 1, 1.5, 0.5, 0.5,
2, -4.030388, -5.902563, 0, 1.5, 0.5, 0.5
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
-3.744171, -3, -5.131453,
-3.744171, 3, -5.131453,
-3.744171, -3, -5.131453,
-3.940243, -3, -5.388489,
-3.744171, -2, -5.131453,
-3.940243, -2, -5.388489,
-3.744171, -1, -5.131453,
-3.940243, -1, -5.388489,
-3.744171, 0, -5.131453,
-3.940243, 0, -5.388489,
-3.744171, 1, -5.131453,
-3.940243, 1, -5.388489,
-3.744171, 2, -5.131453,
-3.940243, 2, -5.388489,
-3.744171, 3, -5.131453,
-3.940243, 3, -5.388489
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
-4.332387, -3, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, -3, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, -3, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, -3, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, -2, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, -2, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, -2, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, -2, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, -1, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, -1, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, -1, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, -1, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, 0, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, 0, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, 0, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, 0, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, 1, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, 1, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, 1, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, 1, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, 2, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, 2, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, 2, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, 2, -5.902563, 0, 1.5, 0.5, 0.5,
-4.332387, 3, -5.902563, 0, -0.5, 0.5, 0.5,
-4.332387, 3, -5.902563, 1, -0.5, 0.5, 0.5,
-4.332387, 3, -5.902563, 1, 1.5, 0.5, 0.5,
-4.332387, 3, -5.902563, 0, 1.5, 0.5, 0.5
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
-3.744171, -3.506281, -4,
-3.744171, -3.506281, 4,
-3.744171, -3.506281, -4,
-3.940243, -3.680983, -4,
-3.744171, -3.506281, -2,
-3.940243, -3.680983, -2,
-3.744171, -3.506281, 0,
-3.940243, -3.680983, 0,
-3.744171, -3.506281, 2,
-3.940243, -3.680983, 2,
-3.744171, -3.506281, 4,
-3.940243, -3.680983, 4
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
-4.332387, -4.030388, -4, 0, -0.5, 0.5, 0.5,
-4.332387, -4.030388, -4, 1, -0.5, 0.5, 0.5,
-4.332387, -4.030388, -4, 1, 1.5, 0.5, 0.5,
-4.332387, -4.030388, -4, 0, 1.5, 0.5, 0.5,
-4.332387, -4.030388, -2, 0, -0.5, 0.5, 0.5,
-4.332387, -4.030388, -2, 1, -0.5, 0.5, 0.5,
-4.332387, -4.030388, -2, 1, 1.5, 0.5, 0.5,
-4.332387, -4.030388, -2, 0, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 0, 0, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 0, 1, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 0, 1, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 0, 0, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 2, 0, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 2, 1, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 2, 1, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 2, 0, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 4, 0, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 4, 1, -0.5, 0.5, 0.5,
-4.332387, -4.030388, 4, 1, 1.5, 0.5, 0.5,
-4.332387, -4.030388, 4, 0, 1.5, 0.5, 0.5
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
-3.744171, -3.506281, -5.131453,
-3.744171, 3.481812, -5.131453,
-3.744171, -3.506281, 5.150023,
-3.744171, 3.481812, 5.150023,
-3.744171, -3.506281, -5.131453,
-3.744171, -3.506281, 5.150023,
-3.744171, 3.481812, -5.131453,
-3.744171, 3.481812, 5.150023,
-3.744171, -3.506281, -5.131453,
4.098713, -3.506281, -5.131453,
-3.744171, -3.506281, 5.150023,
4.098713, -3.506281, 5.150023,
-3.744171, 3.481812, -5.131453,
4.098713, 3.481812, -5.131453,
-3.744171, 3.481812, 5.150023,
4.098713, 3.481812, 5.150023,
4.098713, -3.506281, -5.131453,
4.098713, 3.481812, -5.131453,
4.098713, -3.506281, 5.150023,
4.098713, 3.481812, 5.150023,
4.098713, -3.506281, -5.131453,
4.098713, -3.506281, 5.150023,
4.098713, 3.481812, -5.131453,
4.098713, 3.481812, 5.150023
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
var radius = 7.848843;
var distance = 34.92039;
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
mvMatrix.translate( -0.1772709, 0.01223445, -0.009285212 );
mvMatrix.scale( 1.082041, 1.214397, 0.8253993 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92039);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
diflumetorim<-read.table("diflumetorim.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diflumetorim$V2
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
```

```r
y<-diflumetorim$V3
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
```

```r
z<-diflumetorim$V4
```

```
## Error in eval(expr, envir, enclos): object 'diflumetorim' not found
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
-3.629954, -0.07676657, -1.128004, 0, 0, 1, 1, 1,
-2.985328, 0.5722262, -0.7312632, 1, 0, 0, 1, 1,
-2.766946, -0.9008396, -1.822836, 1, 0, 0, 1, 1,
-2.743817, -0.4006072, -1.171338, 1, 0, 0, 1, 1,
-2.674155, -0.3383827, -0.9869133, 1, 0, 0, 1, 1,
-2.410502, 1.20163, -0.7674315, 1, 0, 0, 1, 1,
-2.380888, -0.9647622, -1.091511, 0, 0, 0, 1, 1,
-2.352295, 1.312813, -1.459709, 0, 0, 0, 1, 1,
-2.352195, 0.1788307, -1.278065, 0, 0, 0, 1, 1,
-2.274211, 0.1984386, -0.9845031, 0, 0, 0, 1, 1,
-2.273711, -1.102187, -2.351276, 0, 0, 0, 1, 1,
-2.269889, -2.011745, -2.457665, 0, 0, 0, 1, 1,
-2.202908, -0.5753556, -1.316483, 0, 0, 0, 1, 1,
-2.160327, -0.3860939, -3.483848, 1, 1, 1, 1, 1,
-2.159345, 0.4512065, -1.672834, 1, 1, 1, 1, 1,
-2.157336, 0.01728028, -2.995929, 1, 1, 1, 1, 1,
-2.087451, 0.7688382, -1.092362, 1, 1, 1, 1, 1,
-2.085733, -0.6925993, -2.9768, 1, 1, 1, 1, 1,
-2.062636, 1.938556, -2.203823, 1, 1, 1, 1, 1,
-2.022348, -1.562938, -3.577132, 1, 1, 1, 1, 1,
-2.020524, 0.6358796, -0.001875736, 1, 1, 1, 1, 1,
-2.018692, 0.137754, -1.984912, 1, 1, 1, 1, 1,
-2.010604, 0.7363604, -1.509818, 1, 1, 1, 1, 1,
-1.945832, 1.823359, 0.546003, 1, 1, 1, 1, 1,
-1.940149, -0.3669904, -1.775009, 1, 1, 1, 1, 1,
-1.929285, -0.7849019, 0.07043548, 1, 1, 1, 1, 1,
-1.926289, -1.63025, -2.505263, 1, 1, 1, 1, 1,
-1.92515, 0.5283801, -1.502943, 1, 1, 1, 1, 1,
-1.903859, -0.7401079, -1.636853, 0, 0, 1, 1, 1,
-1.890123, 0.4104175, -0.9333359, 1, 0, 0, 1, 1,
-1.855224, 0.4313023, -1.107131, 1, 0, 0, 1, 1,
-1.848244, 0.6971416, -1.431383, 1, 0, 0, 1, 1,
-1.846235, 1.234467, -0.9698769, 1, 0, 0, 1, 1,
-1.805931, 0.2298881, -1.642704, 1, 0, 0, 1, 1,
-1.802671, -1.562355, -2.565435, 0, 0, 0, 1, 1,
-1.790518, -1.561184, -3.132853, 0, 0, 0, 1, 1,
-1.784975, 0.9390716, -1.114946, 0, 0, 0, 1, 1,
-1.751862, -0.5973984, -1.491661, 0, 0, 0, 1, 1,
-1.746322, -1.741036, -2.03298, 0, 0, 0, 1, 1,
-1.746306, -0.4905967, -2.103239, 0, 0, 0, 1, 1,
-1.743708, -0.6057263, -1.760081, 0, 0, 0, 1, 1,
-1.742799, -0.04032246, -2.050493, 1, 1, 1, 1, 1,
-1.737628, -0.7311409, -1.934683, 1, 1, 1, 1, 1,
-1.737398, -0.7891278, -0.5525278, 1, 1, 1, 1, 1,
-1.723951, -0.2502719, -1.999382, 1, 1, 1, 1, 1,
-1.717405, -0.1961709, -1.280123, 1, 1, 1, 1, 1,
-1.711844, -0.1827739, -1.731722, 1, 1, 1, 1, 1,
-1.695525, -0.5023043, -2.174333, 1, 1, 1, 1, 1,
-1.690408, 1.193014, 0.5875831, 1, 1, 1, 1, 1,
-1.67372, -0.4959513, -2.677347, 1, 1, 1, 1, 1,
-1.664689, -0.208056, -1.175734, 1, 1, 1, 1, 1,
-1.647874, -0.9847316, -1.663488, 1, 1, 1, 1, 1,
-1.646568, -1.214622, -4.703292, 1, 1, 1, 1, 1,
-1.642773, -0.2391799, -0.5729491, 1, 1, 1, 1, 1,
-1.631296, -0.03482813, -1.542509, 1, 1, 1, 1, 1,
-1.619184, -0.8415748, -1.609275, 1, 1, 1, 1, 1,
-1.615601, 0.2288115, -1.046996, 0, 0, 1, 1, 1,
-1.608186, 0.7674901, -0.8999565, 1, 0, 0, 1, 1,
-1.581163, 0.5993093, -2.030896, 1, 0, 0, 1, 1,
-1.57766, 1.660058, 0.5039615, 1, 0, 0, 1, 1,
-1.573917, -0.2895427, -1.798577, 1, 0, 0, 1, 1,
-1.571847, 0.4243864, -1.305941, 1, 0, 0, 1, 1,
-1.568376, 2.767778, 1.102175, 0, 0, 0, 1, 1,
-1.559886, -0.2722768, -1.280459, 0, 0, 0, 1, 1,
-1.556915, -1.19413, -1.749778, 0, 0, 0, 1, 1,
-1.556847, -0.4894291, -2.726705, 0, 0, 0, 1, 1,
-1.55137, 1.658565, -0.4684011, 0, 0, 0, 1, 1,
-1.536373, -1.987218, -2.818758, 0, 0, 0, 1, 1,
-1.534346, 0.02300277, -1.249993, 0, 0, 0, 1, 1,
-1.526824, -1.916298, -0.5982707, 1, 1, 1, 1, 1,
-1.521514, 0.4343385, -1.509878, 1, 1, 1, 1, 1,
-1.517085, 0.153236, -0.9829699, 1, 1, 1, 1, 1,
-1.517045, -1.520628, -1.743197, 1, 1, 1, 1, 1,
-1.514305, -1.201319, -3.461668, 1, 1, 1, 1, 1,
-1.511466, -0.9556071, -2.932627, 1, 1, 1, 1, 1,
-1.489455, 0.8076956, -2.2599, 1, 1, 1, 1, 1,
-1.486946, 0.7669734, -2.698389, 1, 1, 1, 1, 1,
-1.484729, -0.7595615, -0.6429781, 1, 1, 1, 1, 1,
-1.475253, 1.902482, -1.144982, 1, 1, 1, 1, 1,
-1.450093, -0.881966, -2.157737, 1, 1, 1, 1, 1,
-1.447875, 0.3917037, -1.4933, 1, 1, 1, 1, 1,
-1.441967, 0.02633338, -1.944898, 1, 1, 1, 1, 1,
-1.43674, 0.8497071, 0.3397107, 1, 1, 1, 1, 1,
-1.431665, 0.7002968, -0.1533612, 1, 1, 1, 1, 1,
-1.429093, 0.3712926, -2.887131, 0, 0, 1, 1, 1,
-1.421473, 0.1044322, -1.455604, 1, 0, 0, 1, 1,
-1.420067, 0.3917465, -0.7324464, 1, 0, 0, 1, 1,
-1.406875, -0.4197228, -0.1584283, 1, 0, 0, 1, 1,
-1.404235, -0.5748384, -2.672514, 1, 0, 0, 1, 1,
-1.403932, 0.6568152, 1.300724, 1, 0, 0, 1, 1,
-1.401492, -0.236021, -3.47969, 0, 0, 0, 1, 1,
-1.389368, 0.6068326, -0.2682167, 0, 0, 0, 1, 1,
-1.368503, -1.161697, -2.803794, 0, 0, 0, 1, 1,
-1.36814, -0.8048164, -2.838873, 0, 0, 0, 1, 1,
-1.364584, 0.6620694, -0.5494349, 0, 0, 0, 1, 1,
-1.356894, 1.913047, -1.020424, 0, 0, 0, 1, 1,
-1.347916, -1.116847, -1.328084, 0, 0, 0, 1, 1,
-1.342114, 1.066831, -1.667352, 1, 1, 1, 1, 1,
-1.334412, -1.062101, -1.729318, 1, 1, 1, 1, 1,
-1.333335, -0.6481422, -2.472279, 1, 1, 1, 1, 1,
-1.331101, -0.4644691, -2.77498, 1, 1, 1, 1, 1,
-1.327433, 0.7318417, -1.527103, 1, 1, 1, 1, 1,
-1.317786, 0.09135224, -1.325783, 1, 1, 1, 1, 1,
-1.315664, -0.6643486, -2.380057, 1, 1, 1, 1, 1,
-1.312678, -0.1641579, -1.057748, 1, 1, 1, 1, 1,
-1.31155, 0.4772909, -0.406131, 1, 1, 1, 1, 1,
-1.311027, 0.4487098, 0.3344142, 1, 1, 1, 1, 1,
-1.308595, 1.553326, -0.4570536, 1, 1, 1, 1, 1,
-1.305446, -0.6387765, -1.008181, 1, 1, 1, 1, 1,
-1.298122, -0.9517181, -3.360093, 1, 1, 1, 1, 1,
-1.298084, -2.041491, -3.638705, 1, 1, 1, 1, 1,
-1.291028, 1.044424, -2.098614, 1, 1, 1, 1, 1,
-1.287704, -0.5712317, -0.06688207, 0, 0, 1, 1, 1,
-1.282854, 0.6242926, 0.849999, 1, 0, 0, 1, 1,
-1.278862, 0.3763552, -1.253266, 1, 0, 0, 1, 1,
-1.275106, -0.07850491, -1.741582, 1, 0, 0, 1, 1,
-1.262622, 1.733216, 0.3500609, 1, 0, 0, 1, 1,
-1.248845, -1.487047, -3.815337, 1, 0, 0, 1, 1,
-1.240148, 2.226283, -0.8323505, 0, 0, 0, 1, 1,
-1.23166, -0.7608913, -1.922199, 0, 0, 0, 1, 1,
-1.223967, -0.5770227, -3.592024, 0, 0, 0, 1, 1,
-1.222096, -0.1286547, -4.345548, 0, 0, 0, 1, 1,
-1.218244, -0.3452484, -1.214095, 0, 0, 0, 1, 1,
-1.216383, 1.821449, -0.667383, 0, 0, 0, 1, 1,
-1.214646, 0.02473619, -0.751475, 0, 0, 0, 1, 1,
-1.211569, 0.3135697, -1.07849, 1, 1, 1, 1, 1,
-1.205163, 0.7152026, -1.535649, 1, 1, 1, 1, 1,
-1.197356, -0.7973031, -1.608856, 1, 1, 1, 1, 1,
-1.195525, 0.1869477, -1.262895, 1, 1, 1, 1, 1,
-1.195494, -0.09438866, -1.819936, 1, 1, 1, 1, 1,
-1.19187, 0.1398042, -0.5297161, 1, 1, 1, 1, 1,
-1.189809, -0.60813, -2.596614, 1, 1, 1, 1, 1,
-1.186081, -1.026093, -0.1697947, 1, 1, 1, 1, 1,
-1.185638, -0.2645521, -2.01388, 1, 1, 1, 1, 1,
-1.1504, 0.2646875, -0.6324514, 1, 1, 1, 1, 1,
-1.145154, 0.6126317, -1.183549, 1, 1, 1, 1, 1,
-1.1442, -1.111256, -2.041389, 1, 1, 1, 1, 1,
-1.139469, 0.8604971, -0.9754376, 1, 1, 1, 1, 1,
-1.136109, -1.176306, -1.131724, 1, 1, 1, 1, 1,
-1.131443, -0.3805072, -0.7489985, 1, 1, 1, 1, 1,
-1.130351, -0.737406, -1.838742, 0, 0, 1, 1, 1,
-1.124691, -0.4695766, -2.424162, 1, 0, 0, 1, 1,
-1.123857, -2.222662, -2.717745, 1, 0, 0, 1, 1,
-1.108841, 0.5245032, 0.02943291, 1, 0, 0, 1, 1,
-1.105728, 0.12455, -2.535534, 1, 0, 0, 1, 1,
-1.10023, 0.6385442, -0.5322869, 1, 0, 0, 1, 1,
-1.090081, 1.090505, -2.467814, 0, 0, 0, 1, 1,
-1.089281, -0.6378763, -1.501082, 0, 0, 0, 1, 1,
-1.088769, 1.420153, -0.2438315, 0, 0, 0, 1, 1,
-1.072595, 0.8436173, 0.1498572, 0, 0, 0, 1, 1,
-1.070367, 0.3970711, -0.9632878, 0, 0, 0, 1, 1,
-1.070141, 1.736372, -2.248786, 0, 0, 0, 1, 1,
-1.069888, 0.664641, 0.3281465, 0, 0, 0, 1, 1,
-1.068598, 0.6562004, -1.349293, 1, 1, 1, 1, 1,
-1.067751, -1.845018, -2.766447, 1, 1, 1, 1, 1,
-1.066264, -1.291132, -2.35481, 1, 1, 1, 1, 1,
-1.053677, -0.7801232, -1.675131, 1, 1, 1, 1, 1,
-1.04648, -0.8660046, 0.3686629, 1, 1, 1, 1, 1,
-1.046181, -0.7430367, -2.682117, 1, 1, 1, 1, 1,
-1.043349, -0.3739352, -3.331093, 1, 1, 1, 1, 1,
-1.042936, -0.2183563, -0.9948906, 1, 1, 1, 1, 1,
-1.041571, -0.1657501, -3.197921, 1, 1, 1, 1, 1,
-1.036649, 0.7828379, -0.8771158, 1, 1, 1, 1, 1,
-1.033038, 1.993729, -0.4130354, 1, 1, 1, 1, 1,
-1.025372, -0.8215201, -3.437625, 1, 1, 1, 1, 1,
-1.015031, 1.056391, -1.606012, 1, 1, 1, 1, 1,
-1.006849, -0.4597943, -1.774312, 1, 1, 1, 1, 1,
-1.003715, 0.7535961, -0.8425182, 1, 1, 1, 1, 1,
-1.000841, -1.274976, -3.464386, 0, 0, 1, 1, 1,
-1.000114, 0.9740549, -0.9632767, 1, 0, 0, 1, 1,
-0.9999948, 0.3330264, -2.773957, 1, 0, 0, 1, 1,
-0.9999477, 1.495386, -0.8534399, 1, 0, 0, 1, 1,
-0.9971141, -1.287627, -0.5619401, 1, 0, 0, 1, 1,
-0.9962878, -0.1353364, -0.4883758, 1, 0, 0, 1, 1,
-0.9936066, -0.1660557, -0.768424, 0, 0, 0, 1, 1,
-0.9856853, 0.1663518, -1.700204, 0, 0, 0, 1, 1,
-0.9827968, 0.5271367, -0.1064314, 0, 0, 0, 1, 1,
-0.9790446, 0.9277755, -1.648471, 0, 0, 0, 1, 1,
-0.9788519, 0.2532733, -2.589384, 0, 0, 0, 1, 1,
-0.9759994, 0.7094551, -1.349136, 0, 0, 0, 1, 1,
-0.9687746, 0.1660132, -1.342086, 0, 0, 0, 1, 1,
-0.966911, -1.42345, -2.174405, 1, 1, 1, 1, 1,
-0.9626697, -1.016026, -1.816701, 1, 1, 1, 1, 1,
-0.9619673, 0.0114503, -1.59473, 1, 1, 1, 1, 1,
-0.9585798, 0.7567537, -0.9773124, 1, 1, 1, 1, 1,
-0.9468647, 0.5571176, -0.9911582, 1, 1, 1, 1, 1,
-0.9385496, 1.478767, 0.3457887, 1, 1, 1, 1, 1,
-0.9360279, -0.1909511, -3.028177, 1, 1, 1, 1, 1,
-0.9360258, -2.4357, -4.504418, 1, 1, 1, 1, 1,
-0.9359679, 0.8315335, -0.6339855, 1, 1, 1, 1, 1,
-0.9353453, -1.048896, -1.92637, 1, 1, 1, 1, 1,
-0.929389, -0.5230261, -0.9342057, 1, 1, 1, 1, 1,
-0.9292216, 0.7067407, -0.7333356, 1, 1, 1, 1, 1,
-0.9279684, 0.2985577, -3.213245, 1, 1, 1, 1, 1,
-0.9270901, 0.430162, -2.221722, 1, 1, 1, 1, 1,
-0.9247325, 0.4807446, -0.8880462, 1, 1, 1, 1, 1,
-0.9188979, -1.24698, -2.751835, 0, 0, 1, 1, 1,
-0.9112182, 1.281367, -1.694625, 1, 0, 0, 1, 1,
-0.9106624, 0.0707498, -1.052318, 1, 0, 0, 1, 1,
-0.9039255, -1.101862, -1.596837, 1, 0, 0, 1, 1,
-0.9032118, -0.7346418, -1.407116, 1, 0, 0, 1, 1,
-0.8991829, -0.1259212, -2.041043, 1, 0, 0, 1, 1,
-0.8978743, 0.2676285, -2.336883, 0, 0, 0, 1, 1,
-0.8958898, -1.716636, -3.274947, 0, 0, 0, 1, 1,
-0.8913018, -0.1302603, -2.361722, 0, 0, 0, 1, 1,
-0.8684436, 0.4322693, -1.199357, 0, 0, 0, 1, 1,
-0.8677586, -0.2967105, -1.208772, 0, 0, 0, 1, 1,
-0.8599467, 1.176611, -1.854346, 0, 0, 0, 1, 1,
-0.8504664, -1.888428, -2.982322, 0, 0, 0, 1, 1,
-0.848443, -0.8412007, -1.70184, 1, 1, 1, 1, 1,
-0.84817, 0.1096322, -0.5297019, 1, 1, 1, 1, 1,
-0.8457294, 0.3041037, -2.993775, 1, 1, 1, 1, 1,
-0.838963, -2.058081, -3.174709, 1, 1, 1, 1, 1,
-0.8334863, -0.2086616, -0.8950506, 1, 1, 1, 1, 1,
-0.8290635, -1.025772, -2.286756, 1, 1, 1, 1, 1,
-0.828274, -1.062955, -3.908565, 1, 1, 1, 1, 1,
-0.824785, 0.3925019, -1.589444, 1, 1, 1, 1, 1,
-0.8245892, 0.07884109, -1.639183, 1, 1, 1, 1, 1,
-0.822282, -0.2234221, -1.857604, 1, 1, 1, 1, 1,
-0.8203657, -0.3211037, -1.409528, 1, 1, 1, 1, 1,
-0.8198422, -0.2476162, -2.502269, 1, 1, 1, 1, 1,
-0.8154316, -0.5673202, -1.2518, 1, 1, 1, 1, 1,
-0.8140125, -0.7734899, -1.788295, 1, 1, 1, 1, 1,
-0.8125725, -1.885674, -2.364694, 1, 1, 1, 1, 1,
-0.8109893, -2.111921, -2.770982, 0, 0, 1, 1, 1,
-0.8054672, -0.4767566, -3.422397, 1, 0, 0, 1, 1,
-0.8017476, 3.380044, 1.242232, 1, 0, 0, 1, 1,
-0.7953152, -2.454242, -2.4478, 1, 0, 0, 1, 1,
-0.7918376, 0.7101125, 0.12431, 1, 0, 0, 1, 1,
-0.7897151, -0.2165347, -0.793059, 1, 0, 0, 1, 1,
-0.7880951, 1.091851, -0.6082072, 0, 0, 0, 1, 1,
-0.7852429, 0.370924, -2.894097, 0, 0, 0, 1, 1,
-0.7841022, -1.790795, -3.5728, 0, 0, 0, 1, 1,
-0.7809217, -0.9320989, -1.576874, 0, 0, 0, 1, 1,
-0.780892, -1.378011, -1.450475, 0, 0, 0, 1, 1,
-0.7779618, -1.576049, -2.513211, 0, 0, 0, 1, 1,
-0.7746215, -0.4485846, -2.967192, 0, 0, 0, 1, 1,
-0.763578, 0.4846506, -1.453154, 1, 1, 1, 1, 1,
-0.7619896, -0.3616067, -1.065666, 1, 1, 1, 1, 1,
-0.7609281, 0.8356464, 0.05891665, 1, 1, 1, 1, 1,
-0.7582543, -1.510407, -2.6493, 1, 1, 1, 1, 1,
-0.7532328, -0.4659837, -1.794762, 1, 1, 1, 1, 1,
-0.7520113, 0.1774764, -1.884676, 1, 1, 1, 1, 1,
-0.7517785, 1.754165, -1.947063, 1, 1, 1, 1, 1,
-0.746163, 0.61966, -0.5511892, 1, 1, 1, 1, 1,
-0.7438246, 0.09174287, -1.688443, 1, 1, 1, 1, 1,
-0.7368525, 0.8089132, -2.296731, 1, 1, 1, 1, 1,
-0.728115, -0.440598, -2.773258, 1, 1, 1, 1, 1,
-0.7279498, 2.39552, -1.773667, 1, 1, 1, 1, 1,
-0.7184963, -1.03622, -2.278158, 1, 1, 1, 1, 1,
-0.7182232, -0.06022707, -1.486677, 1, 1, 1, 1, 1,
-0.718089, 0.733159, -1.209703, 1, 1, 1, 1, 1,
-0.716343, 1.413005, -1.303064, 0, 0, 1, 1, 1,
-0.7144803, 1.09527, -0.745917, 1, 0, 0, 1, 1,
-0.7140479, -0.8091178, -2.423156, 1, 0, 0, 1, 1,
-0.7139785, -0.07970371, -2.663686, 1, 0, 0, 1, 1,
-0.7051864, -0.6336175, -3.134453, 1, 0, 0, 1, 1,
-0.7037295, 0.233128, -0.4001283, 1, 0, 0, 1, 1,
-0.7032769, 0.9561425, 0.2460034, 0, 0, 0, 1, 1,
-0.7016793, 0.2217633, -1.498671, 0, 0, 0, 1, 1,
-0.6960006, 0.06559884, -0.6652738, 0, 0, 0, 1, 1,
-0.6922233, 1.448274, 0.8659599, 0, 0, 0, 1, 1,
-0.6867239, -0.3532134, -1.030879, 0, 0, 0, 1, 1,
-0.6854314, -1.826218, -2.250972, 0, 0, 0, 1, 1,
-0.683175, 0.7434252, -0.08321511, 0, 0, 0, 1, 1,
-0.6828676, 1.163703, -1.100101, 1, 1, 1, 1, 1,
-0.6725335, -0.678857, -0.2731238, 1, 1, 1, 1, 1,
-0.6721643, 0.4465578, -1.349588, 1, 1, 1, 1, 1,
-0.6663341, -0.02451271, 0.09915055, 1, 1, 1, 1, 1,
-0.6636851, -0.775672, -2.013192, 1, 1, 1, 1, 1,
-0.6627335, -0.103586, -1.969715, 1, 1, 1, 1, 1,
-0.6596298, 0.6522437, -1.556659, 1, 1, 1, 1, 1,
-0.6536301, -0.4054795, -3.929865, 1, 1, 1, 1, 1,
-0.644989, 1.592354, -1.210513, 1, 1, 1, 1, 1,
-0.6391077, 0.06751567, -1.773368, 1, 1, 1, 1, 1,
-0.6388953, 0.8071312, -1.209695, 1, 1, 1, 1, 1,
-0.6384148, 0.05492629, -3.023514, 1, 1, 1, 1, 1,
-0.6316776, -2.065661, -2.514334, 1, 1, 1, 1, 1,
-0.6310584, -0.2105658, -1.517451, 1, 1, 1, 1, 1,
-0.628155, -0.3311391, -1.469892, 1, 1, 1, 1, 1,
-0.6247578, -1.473613, -3.158901, 0, 0, 1, 1, 1,
-0.6237451, 1.92491, -0.3590954, 1, 0, 0, 1, 1,
-0.6058161, 1.508654, -1.493582, 1, 0, 0, 1, 1,
-0.6011479, 0.7152857, -0.9899854, 1, 0, 0, 1, 1,
-0.5982746, 1.270322, -0.874436, 1, 0, 0, 1, 1,
-0.5941219, -0.8498481, -3.543609, 1, 0, 0, 1, 1,
-0.5923305, -0.09909795, -1.230038, 0, 0, 0, 1, 1,
-0.5915837, -0.6056959, -3.89779, 0, 0, 0, 1, 1,
-0.5873771, 0.9497177, -1.107914, 0, 0, 0, 1, 1,
-0.5736552, 1.431932, -0.8885412, 0, 0, 0, 1, 1,
-0.5727919, -0.5383255, -3.378706, 0, 0, 0, 1, 1,
-0.5657032, 0.2767498, -1.347524, 0, 0, 0, 1, 1,
-0.5628945, 0.5196359, 0.6101173, 0, 0, 0, 1, 1,
-0.5570863, 0.4533282, 0.4114972, 1, 1, 1, 1, 1,
-0.5546335, -0.09235358, -1.933355, 1, 1, 1, 1, 1,
-0.5534148, -1.322308, -2.176487, 1, 1, 1, 1, 1,
-0.5511981, 1.051195, -1.031782, 1, 1, 1, 1, 1,
-0.5476843, 0.2613724, -0.9339086, 1, 1, 1, 1, 1,
-0.5472725, -0.4204257, -3.789734, 1, 1, 1, 1, 1,
-0.542332, 2.08835, 0.2443677, 1, 1, 1, 1, 1,
-0.5376286, -1.307518, -1.806719, 1, 1, 1, 1, 1,
-0.5314345, -0.2542267, -3.299626, 1, 1, 1, 1, 1,
-0.528131, 1.575601, -1.251406, 1, 1, 1, 1, 1,
-0.5218956, 0.2899865, -2.177014, 1, 1, 1, 1, 1,
-0.5200872, -0.7348003, -1.210153, 1, 1, 1, 1, 1,
-0.517656, 0.856889, -1.078676, 1, 1, 1, 1, 1,
-0.5173168, -1.442836, -3.54329, 1, 1, 1, 1, 1,
-0.5159549, -0.4476531, -1.717916, 1, 1, 1, 1, 1,
-0.5157928, 0.6973208, -1.45598, 0, 0, 1, 1, 1,
-0.5128738, -0.6811479, -2.901008, 1, 0, 0, 1, 1,
-0.4976346, 1.341701, 0.6762682, 1, 0, 0, 1, 1,
-0.4975733, -0.2088343, -1.34435, 1, 0, 0, 1, 1,
-0.4969161, 0.6435682, 0.4241993, 1, 0, 0, 1, 1,
-0.4942999, -0.5519181, -1.582909, 1, 0, 0, 1, 1,
-0.4932157, 0.002769826, -1.940742, 0, 0, 0, 1, 1,
-0.4931183, -0.1257777, -3.743606, 0, 0, 0, 1, 1,
-0.4920202, 0.1594616, -2.286148, 0, 0, 0, 1, 1,
-0.4904681, 0.5236912, 0.1781395, 0, 0, 0, 1, 1,
-0.4806687, -0.5897669, -2.539521, 0, 0, 0, 1, 1,
-0.4749959, 0.3836606, -1.946005, 0, 0, 0, 1, 1,
-0.4730691, 1.047546, -1.748124, 0, 0, 0, 1, 1,
-0.4724941, -0.007435062, -1.237112, 1, 1, 1, 1, 1,
-0.4711305, -0.5105609, -3.157628, 1, 1, 1, 1, 1,
-0.462244, 0.4700522, -0.1438472, 1, 1, 1, 1, 1,
-0.4581972, 0.07833917, -2.320116, 1, 1, 1, 1, 1,
-0.4510311, -1.169304, -1.991101, 1, 1, 1, 1, 1,
-0.4509864, 0.2034312, -1.054408, 1, 1, 1, 1, 1,
-0.4425546, 0.5910632, -2.574434, 1, 1, 1, 1, 1,
-0.4418255, -0.632659, -2.138978, 1, 1, 1, 1, 1,
-0.4417614, -1.280743, -3.902836, 1, 1, 1, 1, 1,
-0.4417239, -1.112227, -1.245785, 1, 1, 1, 1, 1,
-0.4381121, -2.049293, -1.547958, 1, 1, 1, 1, 1,
-0.4362189, -0.2635355, -2.291873, 1, 1, 1, 1, 1,
-0.4338599, -1.579021, -2.993817, 1, 1, 1, 1, 1,
-0.4309991, -0.7639415, -2.157772, 1, 1, 1, 1, 1,
-0.4298898, -1.077339, -1.697591, 1, 1, 1, 1, 1,
-0.4248561, 0.650263, 0.1017879, 0, 0, 1, 1, 1,
-0.4190229, 1.302699, 0.2609078, 1, 0, 0, 1, 1,
-0.4130798, 1.100629, -1.609087, 1, 0, 0, 1, 1,
-0.4123158, 0.06852069, -1.35751, 1, 0, 0, 1, 1,
-0.411921, 0.2583584, -1.721205, 1, 0, 0, 1, 1,
-0.4115548, -0.8019396, -2.453379, 1, 0, 0, 1, 1,
-0.4059748, -3.10815, -3.52347, 0, 0, 0, 1, 1,
-0.4036908, 0.2929723, -2.365417, 0, 0, 0, 1, 1,
-0.4011617, 0.1021653, -2.762548, 0, 0, 0, 1, 1,
-0.4000411, -0.1531087, -1.838763, 0, 0, 0, 1, 1,
-0.3950971, -1.097002, -1.643576, 0, 0, 0, 1, 1,
-0.3936175, 3.10848, 0.4176716, 0, 0, 0, 1, 1,
-0.3930462, -0.645135, -0.4786118, 0, 0, 0, 1, 1,
-0.3923208, 1.613928, 0.7919143, 1, 1, 1, 1, 1,
-0.3891716, 0.4907444, 0.2123084, 1, 1, 1, 1, 1,
-0.3858592, 0.3458068, -0.7848316, 1, 1, 1, 1, 1,
-0.3845553, 0.2340977, -1.359268, 1, 1, 1, 1, 1,
-0.3781716, 1.10078, 1.596353, 1, 1, 1, 1, 1,
-0.3748764, 0.5119834, 0.9166769, 1, 1, 1, 1, 1,
-0.362905, 0.1896342, 1.738693, 1, 1, 1, 1, 1,
-0.3610201, 0.2354209, -1.639774, 1, 1, 1, 1, 1,
-0.3598614, -0.3685197, -1.602049, 1, 1, 1, 1, 1,
-0.3568027, -0.0292608, -2.620719, 1, 1, 1, 1, 1,
-0.3483978, 0.2869885, -0.2754011, 1, 1, 1, 1, 1,
-0.345525, -0.6441072, -1.960364, 1, 1, 1, 1, 1,
-0.3450008, -0.574433, -1.896267, 1, 1, 1, 1, 1,
-0.3443787, 0.3583022, -0.4509598, 1, 1, 1, 1, 1,
-0.3441516, -0.9485217, -2.306003, 1, 1, 1, 1, 1,
-0.3426834, -0.222979, -2.003111, 0, 0, 1, 1, 1,
-0.3394582, -0.3493727, -2.163945, 1, 0, 0, 1, 1,
-0.3365842, -1.256046, -3.123996, 1, 0, 0, 1, 1,
-0.3355609, 1.074909, -0.9557703, 1, 0, 0, 1, 1,
-0.333208, -0.7057126, -3.011159, 1, 0, 0, 1, 1,
-0.3314883, -1.270492, -1.687648, 1, 0, 0, 1, 1,
-0.3298347, 0.124586, -0.875942, 0, 0, 0, 1, 1,
-0.3287949, 1.601517, 0.1047195, 0, 0, 0, 1, 1,
-0.3227259, -1.866416, -1.929298, 0, 0, 0, 1, 1,
-0.3223396, -0.1768511, -1.123901, 0, 0, 0, 1, 1,
-0.3207987, -2.531735, -2.79987, 0, 0, 0, 1, 1,
-0.3163246, -0.4979749, -2.727186, 0, 0, 0, 1, 1,
-0.3143232, 0.9903441, -0.1517393, 0, 0, 0, 1, 1,
-0.3142188, -0.2948513, -1.392685, 1, 1, 1, 1, 1,
-0.3129587, -0.08047087, -1.223606, 1, 1, 1, 1, 1,
-0.3117742, -0.7287101, -4.272756, 1, 1, 1, 1, 1,
-0.3080313, 0.02955595, -0.03353686, 1, 1, 1, 1, 1,
-0.3039863, -0.3752397, -2.168751, 1, 1, 1, 1, 1,
-0.2953686, 0.896743, -0.4807608, 1, 1, 1, 1, 1,
-0.2946255, -0.5930339, -3.252506, 1, 1, 1, 1, 1,
-0.293869, 0.09379802, -1.861911, 1, 1, 1, 1, 1,
-0.2931981, 1.270433, 1.015035, 1, 1, 1, 1, 1,
-0.2920137, 1.8139, 0.616697, 1, 1, 1, 1, 1,
-0.2858601, -0.7039968, -2.304172, 1, 1, 1, 1, 1,
-0.2841778, -0.3737025, -2.928126, 1, 1, 1, 1, 1,
-0.2836316, 3.186257, -0.4471643, 1, 1, 1, 1, 1,
-0.2819581, 0.5025144, -0.6469131, 1, 1, 1, 1, 1,
-0.2793775, 0.8087729, -0.1748468, 1, 1, 1, 1, 1,
-0.2772413, -0.2433732, -1.363496, 0, 0, 1, 1, 1,
-0.2757833, 0.1358943, 0.2603565, 1, 0, 0, 1, 1,
-0.2756048, -0.3254276, -3.137023, 1, 0, 0, 1, 1,
-0.2734115, 1.367963, -1.588527, 1, 0, 0, 1, 1,
-0.2732751, 0.7863403, -2.136188, 1, 0, 0, 1, 1,
-0.2720063, -0.6504983, -2.362647, 1, 0, 0, 1, 1,
-0.2691911, -0.632965, -0.9596474, 0, 0, 0, 1, 1,
-0.2691632, 0.6659882, 0.773774, 0, 0, 0, 1, 1,
-0.2594514, 0.286564, -0.8084946, 0, 0, 0, 1, 1,
-0.256118, -0.3511462, -2.866299, 0, 0, 0, 1, 1,
-0.2550457, -1.184415, -3.736842, 0, 0, 0, 1, 1,
-0.2392795, -0.4421407, -2.495327, 0, 0, 0, 1, 1,
-0.2390104, -0.3447187, -4.893202, 0, 0, 0, 1, 1,
-0.2383709, 1.176093, 0.8207834, 1, 1, 1, 1, 1,
-0.2327412, 0.5547906, -0.6076301, 1, 1, 1, 1, 1,
-0.2260103, 0.6863604, 0.2234904, 1, 1, 1, 1, 1,
-0.2257296, 0.2616703, -1.693566, 1, 1, 1, 1, 1,
-0.2253131, -0.2625779, -1.874294, 1, 1, 1, 1, 1,
-0.2227637, 1.578115, 0.4319637, 1, 1, 1, 1, 1,
-0.2178575, 1.364857, -0.9872303, 1, 1, 1, 1, 1,
-0.2151242, -0.2391805, -4.489244, 1, 1, 1, 1, 1,
-0.2128732, 0.5358263, -1.581139, 1, 1, 1, 1, 1,
-0.209019, -1.052338, -3.624766, 1, 1, 1, 1, 1,
-0.2080958, 0.9575382, 0.1201359, 1, 1, 1, 1, 1,
-0.1987591, -0.2964475, -4.981722, 1, 1, 1, 1, 1,
-0.1983379, -0.0072301, 0.1572379, 1, 1, 1, 1, 1,
-0.198324, 0.1400798, 0.3802021, 1, 1, 1, 1, 1,
-0.1977748, 0.4687893, -0.7044119, 1, 1, 1, 1, 1,
-0.1951469, -0.1981871, 0.112265, 0, 0, 1, 1, 1,
-0.1907211, 0.564673, 1.015302, 1, 0, 0, 1, 1,
-0.187289, -0.2135843, -2.083128, 1, 0, 0, 1, 1,
-0.1848951, -0.6742139, -2.450244, 1, 0, 0, 1, 1,
-0.1839986, 2.101538, -0.9995653, 1, 0, 0, 1, 1,
-0.183591, -1.551442, -3.946022, 1, 0, 0, 1, 1,
-0.1824105, -0.739915, -2.696203, 0, 0, 0, 1, 1,
-0.1813833, -0.006515839, -0.5956578, 0, 0, 0, 1, 1,
-0.1811233, 1.155423, 0.6149906, 0, 0, 0, 1, 1,
-0.1811084, 1.263849, -0.4384755, 0, 0, 0, 1, 1,
-0.1810531, 0.2491616, -1.707319, 0, 0, 0, 1, 1,
-0.1766968, 1.384064, 0.7985815, 0, 0, 0, 1, 1,
-0.1763201, -0.4262805, -2.029598, 0, 0, 0, 1, 1,
-0.1762433, 1.308391, 0.8016706, 1, 1, 1, 1, 1,
-0.172161, -1.006221, -4.878463, 1, 1, 1, 1, 1,
-0.1712865, -0.3683246, -2.024909, 1, 1, 1, 1, 1,
-0.1705573, 1.121626, -0.7586951, 1, 1, 1, 1, 1,
-0.1705202, -1.709815, -4.023468, 1, 1, 1, 1, 1,
-0.1683744, -1.065298, -3.178715, 1, 1, 1, 1, 1,
-0.1661768, -0.3582659, -2.208512, 1, 1, 1, 1, 1,
-0.1627647, -0.1193315, -2.905098, 1, 1, 1, 1, 1,
-0.161406, 0.8806313, -0.8278432, 1, 1, 1, 1, 1,
-0.1593823, 0.2258982, 0.6096823, 1, 1, 1, 1, 1,
-0.1590199, 0.5110528, -0.2945059, 1, 1, 1, 1, 1,
-0.1537076, 1.4983, 0.4856232, 1, 1, 1, 1, 1,
-0.1515511, -1.763632, -3.255423, 1, 1, 1, 1, 1,
-0.1494396, -1.204096, -4.127151, 1, 1, 1, 1, 1,
-0.1475531, -0.7046595, -2.416199, 1, 1, 1, 1, 1,
-0.1459808, -0.05584579, -2.457749, 0, 0, 1, 1, 1,
-0.1453395, -0.2563761, -1.683407, 1, 0, 0, 1, 1,
-0.1451436, -1.842506, -1.826191, 1, 0, 0, 1, 1,
-0.1378119, -0.40674, -1.423401, 1, 0, 0, 1, 1,
-0.1355273, 1.289665, -0.8286322, 1, 0, 0, 1, 1,
-0.1335419, -1.055948, -4.706367, 1, 0, 0, 1, 1,
-0.1333573, -0.8917935, -3.678596, 0, 0, 0, 1, 1,
-0.1329685, 0.8832927, -0.1905015, 0, 0, 0, 1, 1,
-0.1297847, -1.241739, -0.371479, 0, 0, 0, 1, 1,
-0.1292498, 0.09463748, -2.90288, 0, 0, 0, 1, 1,
-0.1285737, 1.112875, 1.431434, 0, 0, 0, 1, 1,
-0.1260723, -1.448436, -4.319021, 0, 0, 0, 1, 1,
-0.1246396, -0.3931639, -3.504275, 0, 0, 0, 1, 1,
-0.1244954, 1.024346, 1.522612, 1, 1, 1, 1, 1,
-0.1240481, -1.195133, -4.580906, 1, 1, 1, 1, 1,
-0.1237771, -0.1529495, -1.754519, 1, 1, 1, 1, 1,
-0.1197728, -1.493069, -4.685759, 1, 1, 1, 1, 1,
-0.1190985, -0.4523709, -2.307141, 1, 1, 1, 1, 1,
-0.1187064, -0.07123984, -1.858577, 1, 1, 1, 1, 1,
-0.1167198, 0.05571153, 0.5717279, 1, 1, 1, 1, 1,
-0.1103395, -1.325077, -3.74231, 1, 1, 1, 1, 1,
-0.1088353, 1.494475, -0.9260864, 1, 1, 1, 1, 1,
-0.1086083, -0.6761079, -4.066206, 1, 1, 1, 1, 1,
-0.1017796, 0.5660823, 0.1177243, 1, 1, 1, 1, 1,
-0.09669378, 0.9161455, 0.0790915, 1, 1, 1, 1, 1,
-0.09026127, 0.01382768, -0.3128905, 1, 1, 1, 1, 1,
-0.08437654, -0.6063597, -0.8326105, 1, 1, 1, 1, 1,
-0.08316421, 1.16205, -0.5282322, 1, 1, 1, 1, 1,
-0.0759158, 0.2844453, 0.3341505, 0, 0, 1, 1, 1,
-0.07524003, 0.3955386, -0.4001964, 1, 0, 0, 1, 1,
-0.07371331, 0.8771859, -0.3962363, 1, 0, 0, 1, 1,
-0.0661621, -0.4047811, -4.693096, 1, 0, 0, 1, 1,
-0.06517599, 0.5864329, -0.1613202, 1, 0, 0, 1, 1,
-0.06403664, 0.1799057, 0.565495, 1, 0, 0, 1, 1,
-0.06151228, 0.5621887, 0.4883138, 0, 0, 0, 1, 1,
-0.05988281, 3.238977, -0.2564095, 0, 0, 0, 1, 1,
-0.0564666, -1.967219, -2.789273, 0, 0, 0, 1, 1,
-0.05393792, 0.9323258, -0.5096712, 0, 0, 0, 1, 1,
-0.05101461, -1.723497, -3.26995, 0, 0, 0, 1, 1,
-0.0507351, -0.2708236, -3.060573, 0, 0, 0, 1, 1,
-0.04291501, 1.757905, -0.3272217, 0, 0, 0, 1, 1,
-0.04190711, 0.4735867, 2.028017, 1, 1, 1, 1, 1,
-0.04132325, -0.2314453, -3.106385, 1, 1, 1, 1, 1,
-0.03756228, -1.810632, -3.949829, 1, 1, 1, 1, 1,
-0.0372072, -1.942811, -4.356256, 1, 1, 1, 1, 1,
-0.03301305, -2.074443, -1.963939, 1, 1, 1, 1, 1,
-0.03288243, 0.5311082, -1.550856, 1, 1, 1, 1, 1,
-0.0312377, -0.1895174, -1.741135, 1, 1, 1, 1, 1,
-0.03112947, 0.8963139, -0.1680773, 1, 1, 1, 1, 1,
-0.02792667, 1.890281, 0.4689295, 1, 1, 1, 1, 1,
-0.02785248, -1.152325, -3.650707, 1, 1, 1, 1, 1,
-0.02718961, -1.897971, -1.72591, 1, 1, 1, 1, 1,
-0.02637433, 0.3441115, 0.3629811, 1, 1, 1, 1, 1,
-0.02635204, -0.3868507, -2.876356, 1, 1, 1, 1, 1,
-0.02570358, -1.41534, -3.649379, 1, 1, 1, 1, 1,
-0.02490706, 0.1468587, -1.834367, 1, 1, 1, 1, 1,
-0.02238132, 0.7243724, -2.206651, 0, 0, 1, 1, 1,
-0.02058782, -0.2036303, -2.85769, 1, 0, 0, 1, 1,
-0.01907148, -1.481279, -2.231309, 1, 0, 0, 1, 1,
-0.01080669, -0.433879, -3.244342, 1, 0, 0, 1, 1,
-0.008195729, 0.1666371, 0.3821821, 1, 0, 0, 1, 1,
-0.003966953, 0.3376633, 0.5733353, 1, 0, 0, 1, 1,
-0.003493128, -1.594008, -2.314103, 0, 0, 0, 1, 1,
-0.00211842, 0.0600137, -0.5290942, 0, 0, 0, 1, 1,
-0.0009020884, -0.2272538, -4.793816, 0, 0, 0, 1, 1,
-0.0005014443, -0.4498048, -4.463196, 0, 0, 0, 1, 1,
0.002708104, -1.210684, 4.37113, 0, 0, 0, 1, 1,
0.01084979, 1.344883, 1.047469, 0, 0, 0, 1, 1,
0.01108431, -0.8209881, 2.462891, 0, 0, 0, 1, 1,
0.0114112, 0.2946751, 0.331844, 1, 1, 1, 1, 1,
0.01204466, -0.008432546, 2.879488, 1, 1, 1, 1, 1,
0.01628396, 1.461577, -0.05034945, 1, 1, 1, 1, 1,
0.01794362, -1.769014, 2.952068, 1, 1, 1, 1, 1,
0.02130836, -1.772206, 3.404193, 1, 1, 1, 1, 1,
0.02303128, -0.9556937, 4.163244, 1, 1, 1, 1, 1,
0.02381736, 0.4973411, 0.1511143, 1, 1, 1, 1, 1,
0.02484631, -0.1222834, 0.6155964, 1, 1, 1, 1, 1,
0.02642413, -0.09452827, 2.237093, 1, 1, 1, 1, 1,
0.02780506, -0.967108, 1.424087, 1, 1, 1, 1, 1,
0.03018844, -1.745998, 1.284268, 1, 1, 1, 1, 1,
0.03576907, -1.223331, 3.007675, 1, 1, 1, 1, 1,
0.03656642, -0.7708938, 2.036808, 1, 1, 1, 1, 1,
0.04034656, -0.8205757, 1.877152, 1, 1, 1, 1, 1,
0.04255911, -0.6294515, 1.791934, 1, 1, 1, 1, 1,
0.04715844, -0.178932, 4.22652, 0, 0, 1, 1, 1,
0.04859186, 1.300565, 0.4389677, 1, 0, 0, 1, 1,
0.04896802, -0.3116844, 3.12313, 1, 0, 0, 1, 1,
0.05342779, -2.227576, 4.310081, 1, 0, 0, 1, 1,
0.05555264, 0.6887742, -0.9194804, 1, 0, 0, 1, 1,
0.05807003, 0.3738089, -1.885573, 1, 0, 0, 1, 1,
0.05886715, -0.7577731, 2.118928, 0, 0, 0, 1, 1,
0.06184896, -1.007391, 2.374871, 0, 0, 0, 1, 1,
0.06626984, -0.1537741, 1.40787, 0, 0, 0, 1, 1,
0.0694687, -1.080607, 2.987731, 0, 0, 0, 1, 1,
0.07030216, 1.533634, 1.143543, 0, 0, 0, 1, 1,
0.07165873, -0.01355157, 0.4109692, 0, 0, 0, 1, 1,
0.08250288, 0.8390715, -1.480174, 0, 0, 0, 1, 1,
0.09286747, 0.3378213, -0.858547, 1, 1, 1, 1, 1,
0.09327713, 0.09416676, 0.5079893, 1, 1, 1, 1, 1,
0.09456922, -0.7173861, 2.637426, 1, 1, 1, 1, 1,
0.09532801, 2.578955, 2.300983, 1, 1, 1, 1, 1,
0.09740438, -0.2248327, 3.019365, 1, 1, 1, 1, 1,
0.1004124, 0.02782844, 1.412993, 1, 1, 1, 1, 1,
0.1017522, -1.301401, 4.356349, 1, 1, 1, 1, 1,
0.1038267, -0.164875, 1.607414, 1, 1, 1, 1, 1,
0.1090908, -0.2260618, 3.091022, 1, 1, 1, 1, 1,
0.1126965, 0.3137781, 2.198556, 1, 1, 1, 1, 1,
0.117637, -0.3029599, 3.142219, 1, 1, 1, 1, 1,
0.1178062, -2.104197, 3.912099, 1, 1, 1, 1, 1,
0.1207403, 0.5596719, 1.814882, 1, 1, 1, 1, 1,
0.1207865, -0.9069784, 2.465445, 1, 1, 1, 1, 1,
0.1208917, 0.2885968, 1.554396, 1, 1, 1, 1, 1,
0.1294577, 0.2410663, 1.592975, 0, 0, 1, 1, 1,
0.132091, 0.8140913, 0.2015941, 1, 0, 0, 1, 1,
0.1335063, -1.15688, 3.113476, 1, 0, 0, 1, 1,
0.1341812, -0.4258461, 3.785655, 1, 0, 0, 1, 1,
0.1347895, 0.6205812, 1.797057, 1, 0, 0, 1, 1,
0.1391257, 0.9597275, -1.048749, 1, 0, 0, 1, 1,
0.1400549, -0.5166423, 2.480058, 0, 0, 0, 1, 1,
0.1400864, -0.5753015, 3.018938, 0, 0, 0, 1, 1,
0.1407437, 0.1244906, 2.058112, 0, 0, 0, 1, 1,
0.1428666, -1.105674, 3.099745, 0, 0, 0, 1, 1,
0.1435618, -0.586664, 2.952188, 0, 0, 0, 1, 1,
0.1448325, 3.329643, -0.3273453, 0, 0, 0, 1, 1,
0.1458621, 0.826502, 0.1649528, 0, 0, 0, 1, 1,
0.148782, 0.2670505, 1.407848, 1, 1, 1, 1, 1,
0.1499307, -1.487892, 4.1868, 1, 1, 1, 1, 1,
0.1533876, 0.6859213, -0.1172308, 1, 1, 1, 1, 1,
0.1541194, 0.7873424, -0.9675189, 1, 1, 1, 1, 1,
0.1601736, 1.686504, 3.179054, 1, 1, 1, 1, 1,
0.1639098, -0.6304598, 1.92908, 1, 1, 1, 1, 1,
0.1669626, -0.2691433, 3.461163, 1, 1, 1, 1, 1,
0.1681351, -1.571369, 4.550634, 1, 1, 1, 1, 1,
0.1683105, 1.65535, -0.3426229, 1, 1, 1, 1, 1,
0.1712032, -1.307094, 2.712634, 1, 1, 1, 1, 1,
0.1755209, 2.564869, -0.7694262, 1, 1, 1, 1, 1,
0.1787768, 0.4974514, -0.9792698, 1, 1, 1, 1, 1,
0.1809969, -0.3220516, 2.154913, 1, 1, 1, 1, 1,
0.1830144, -0.04880759, 3.958006, 1, 1, 1, 1, 1,
0.1850256, 2.596441, 1.203921, 1, 1, 1, 1, 1,
0.1852541, 0.5613382, 1.424611, 0, 0, 1, 1, 1,
0.1884749, -1.684332, 4.415656, 1, 0, 0, 1, 1,
0.188577, 0.009200676, 3.168596, 1, 0, 0, 1, 1,
0.1893592, 0.9826476, -0.611172, 1, 0, 0, 1, 1,
0.1908063, -0.2205293, 3.754128, 1, 0, 0, 1, 1,
0.1939215, -1.231108, 3.263227, 1, 0, 0, 1, 1,
0.1940944, -0.8758357, 4.079247, 0, 0, 0, 1, 1,
0.2048872, 0.09344666, 2.111617, 0, 0, 0, 1, 1,
0.2055321, -1.708174, 2.485401, 0, 0, 0, 1, 1,
0.2085437, 1.244142, 2.287937, 0, 0, 0, 1, 1,
0.2091892, 0.1461353, 1.10251, 0, 0, 0, 1, 1,
0.2103771, 0.8145885, 1.27455, 0, 0, 0, 1, 1,
0.2106032, -1.231594, 1.753709, 0, 0, 0, 1, 1,
0.211224, 0.04126061, 1.500217, 1, 1, 1, 1, 1,
0.2113468, -1.840482, 1.953681, 1, 1, 1, 1, 1,
0.2113687, 0.1818588, -0.08491347, 1, 1, 1, 1, 1,
0.2158705, -3.028925, 2.561913, 1, 1, 1, 1, 1,
0.2160059, 0.2237174, 1.661463, 1, 1, 1, 1, 1,
0.2166057, -0.7842695, 3.191952, 1, 1, 1, 1, 1,
0.2171779, -1.554928, 4.02441, 1, 1, 1, 1, 1,
0.221233, -2.718759, 3.66817, 1, 1, 1, 1, 1,
0.222852, -1.305469, 1.903654, 1, 1, 1, 1, 1,
0.2265229, 0.6525742, 2.494684, 1, 1, 1, 1, 1,
0.2279622, -1.097797, 3.805706, 1, 1, 1, 1, 1,
0.2296484, 0.6182319, 2.362197, 1, 1, 1, 1, 1,
0.231653, -0.5306609, 2.916998, 1, 1, 1, 1, 1,
0.2355807, 1.927178, 0.9120343, 1, 1, 1, 1, 1,
0.2359236, 0.08511829, 1.074737, 1, 1, 1, 1, 1,
0.2393644, -0.6170257, 5.000293, 0, 0, 1, 1, 1,
0.249631, 0.6898019, -0.3333299, 1, 0, 0, 1, 1,
0.2508111, -0.2352599, 0.6419932, 1, 0, 0, 1, 1,
0.2516526, 1.495437, 0.0733737, 1, 0, 0, 1, 1,
0.25826, 0.3515905, 1.253693, 1, 0, 0, 1, 1,
0.2583926, 0.05693202, 3.126356, 1, 0, 0, 1, 1,
0.2607004, -1.175716, 3.055866, 0, 0, 0, 1, 1,
0.2636844, -1.564987, 1.322442, 0, 0, 0, 1, 1,
0.266091, 0.2658142, -0.6430519, 0, 0, 0, 1, 1,
0.2675045, -1.871974, 4.245964, 0, 0, 0, 1, 1,
0.2681879, -1.499363, 1.526066, 0, 0, 0, 1, 1,
0.2706965, 0.4149837, 0.1387749, 0, 0, 0, 1, 1,
0.2732178, 0.4895733, 0.6509965, 0, 0, 0, 1, 1,
0.2732753, 0.6322311, 1.647226, 1, 1, 1, 1, 1,
0.2785835, -0.4019926, 3.813432, 1, 1, 1, 1, 1,
0.2801423, 0.5800465, 0.0370108, 1, 1, 1, 1, 1,
0.2868381, 0.8150936, -0.5845711, 1, 1, 1, 1, 1,
0.2881991, 0.5611838, -0.7262344, 1, 1, 1, 1, 1,
0.2901083, -1.64543, 2.969696, 1, 1, 1, 1, 1,
0.290114, 1.71156, 0.1802817, 1, 1, 1, 1, 1,
0.2902388, -1.373014, 3.835627, 1, 1, 1, 1, 1,
0.2990841, -0.3667297, 2.259359, 1, 1, 1, 1, 1,
0.3003342, -0.342537, 2.857735, 1, 1, 1, 1, 1,
0.3121315, 0.2598732, 0.7776955, 1, 1, 1, 1, 1,
0.3162197, -0.2924737, 3.733485, 1, 1, 1, 1, 1,
0.3176479, -0.1321422, 2.536953, 1, 1, 1, 1, 1,
0.32001, 1.108979, -0.1772569, 1, 1, 1, 1, 1,
0.3200757, 0.5640174, 1.57, 1, 1, 1, 1, 1,
0.3275087, -0.5061235, 3.618834, 0, 0, 1, 1, 1,
0.3319246, 1.449156, -1.494412, 1, 0, 0, 1, 1,
0.3327495, -1.289447, 4.005027, 1, 0, 0, 1, 1,
0.3329227, -1.109006, 2.203001, 1, 0, 0, 1, 1,
0.334471, -0.7313856, 1.699662, 1, 0, 0, 1, 1,
0.3344857, -1.502954, 2.309294, 1, 0, 0, 1, 1,
0.3437587, 0.1464045, 1.110316, 0, 0, 0, 1, 1,
0.3452806, -0.6115975, 3.245295, 0, 0, 0, 1, 1,
0.3481118, -0.9087783, 3.230827, 0, 0, 0, 1, 1,
0.3536617, -0.99852, 2.147127, 0, 0, 0, 1, 1,
0.3553675, 0.9113746, 0.4387917, 0, 0, 0, 1, 1,
0.3624764, -0.07095236, 1.081639, 0, 0, 0, 1, 1,
0.3635162, -0.8175406, 3.268535, 0, 0, 0, 1, 1,
0.3636317, -0.8330148, 2.541893, 1, 1, 1, 1, 1,
0.3661344, 1.251234, -1.467547, 1, 1, 1, 1, 1,
0.375024, 0.3482141, -0.1010239, 1, 1, 1, 1, 1,
0.3753521, -0.2996652, 2.292158, 1, 1, 1, 1, 1,
0.376534, 0.4074681, -0.01904024, 1, 1, 1, 1, 1,
0.3767685, 0.8283105, -0.287452, 1, 1, 1, 1, 1,
0.3823288, 0.2687949, 0.363426, 1, 1, 1, 1, 1,
0.3868986, -0.4840529, 3.372573, 1, 1, 1, 1, 1,
0.3871543, 1.000614, -1.064086, 1, 1, 1, 1, 1,
0.3880864, 0.6762695, 1.744669, 1, 1, 1, 1, 1,
0.3914697, -0.08173393, 2.946846, 1, 1, 1, 1, 1,
0.3931704, -0.3477414, 1.484553, 1, 1, 1, 1, 1,
0.3993505, -1.095297, 1.32231, 1, 1, 1, 1, 1,
0.4094007, 0.2470932, 2.751058, 1, 1, 1, 1, 1,
0.4236582, 1.565836, 0.3595631, 1, 1, 1, 1, 1,
0.4270696, 0.9861181, 0.5038755, 0, 0, 1, 1, 1,
0.4272441, 0.1639875, 1.037843, 1, 0, 0, 1, 1,
0.4286346, 1.401884, -0.2201574, 1, 0, 0, 1, 1,
0.4304574, -0.413355, -0.5048098, 1, 0, 0, 1, 1,
0.4337075, 0.500173, -0.1320549, 1, 0, 0, 1, 1,
0.4374124, 0.3754812, 2.767662, 1, 0, 0, 1, 1,
0.4445989, 1.158465, 2.767769, 0, 0, 0, 1, 1,
0.4541407, -1.021266, 2.646847, 0, 0, 0, 1, 1,
0.4562365, -1.302578, 2.392616, 0, 0, 0, 1, 1,
0.4661794, 0.8367258, 1.282339, 0, 0, 0, 1, 1,
0.4662061, 0.1302021, 0.7591397, 0, 0, 0, 1, 1,
0.4681418, 0.2407618, 0.01466417, 0, 0, 0, 1, 1,
0.4737963, 0.116212, 1.160609, 0, 0, 0, 1, 1,
0.4741354, 0.7384098, 0.1690302, 1, 1, 1, 1, 1,
0.4743465, 1.358413, 1.561171, 1, 1, 1, 1, 1,
0.4748125, 0.5338397, 0.07189106, 1, 1, 1, 1, 1,
0.4769047, 0.2504459, 2.055018, 1, 1, 1, 1, 1,
0.4801236, -1.456632, 3.300357, 1, 1, 1, 1, 1,
0.4805246, 0.9502252, 0.8292508, 1, 1, 1, 1, 1,
0.4811496, 1.978892, 0.08921499, 1, 1, 1, 1, 1,
0.4832399, -2.038177, 2.306368, 1, 1, 1, 1, 1,
0.4854863, -1.081903, 4.015996, 1, 1, 1, 1, 1,
0.4865479, 0.2379566, 1.622309, 1, 1, 1, 1, 1,
0.4884195, -0.4360918, 3.60191, 1, 1, 1, 1, 1,
0.4892898, 0.9841564, -1.031042, 1, 1, 1, 1, 1,
0.4942022, -0.2233056, 3.341316, 1, 1, 1, 1, 1,
0.495015, -0.1182564, 3.745158, 1, 1, 1, 1, 1,
0.4951684, -0.02758285, 2.071791, 1, 1, 1, 1, 1,
0.4956881, -0.0745898, 2.954105, 0, 0, 1, 1, 1,
0.4966733, -1.080186, 3.583343, 1, 0, 0, 1, 1,
0.497354, -0.2088394, 1.867277, 1, 0, 0, 1, 1,
0.4981832, -0.5579609, 0.03388917, 1, 0, 0, 1, 1,
0.5019937, -0.1666262, 0.06551993, 1, 0, 0, 1, 1,
0.5039189, 0.6412072, 1.975772, 1, 0, 0, 1, 1,
0.5056008, -0.4009911, 2.577029, 0, 0, 0, 1, 1,
0.5073471, 1.830833, -0.5243295, 0, 0, 0, 1, 1,
0.5074448, -0.2431122, 1.802602, 0, 0, 0, 1, 1,
0.507917, -1.068911, 1.446638, 0, 0, 0, 1, 1,
0.5092636, 1.407831, 0.5587711, 0, 0, 0, 1, 1,
0.5120057, -0.2558011, 3.984458, 0, 0, 0, 1, 1,
0.523924, -0.5513598, 1.884046, 0, 0, 0, 1, 1,
0.5262151, 0.2946995, 1.686393, 1, 1, 1, 1, 1,
0.5287527, 0.9197118, -0.2034473, 1, 1, 1, 1, 1,
0.53681, 0.2444366, 0.3085676, 1, 1, 1, 1, 1,
0.5379506, 0.3073586, 0.2989531, 1, 1, 1, 1, 1,
0.540192, -1.296801, 2.457002, 1, 1, 1, 1, 1,
0.5419992, -1.36655, 4.109453, 1, 1, 1, 1, 1,
0.5424775, -0.528703, 1.295205, 1, 1, 1, 1, 1,
0.5478256, -0.4956582, 2.549247, 1, 1, 1, 1, 1,
0.5480952, -1.512074, 2.450374, 1, 1, 1, 1, 1,
0.5483276, -0.5173445, 1.749639, 1, 1, 1, 1, 1,
0.5566925, -0.6257879, 3.499326, 1, 1, 1, 1, 1,
0.565072, 0.8827469, 0.8487715, 1, 1, 1, 1, 1,
0.5687788, 0.5172638, 3.21525, 1, 1, 1, 1, 1,
0.5743612, -0.5783589, 3.303786, 1, 1, 1, 1, 1,
0.5757554, -0.689154, 2.455262, 1, 1, 1, 1, 1,
0.5837842, 0.1426285, 0.7863447, 0, 0, 1, 1, 1,
0.5845679, -0.630229, 3.841282, 1, 0, 0, 1, 1,
0.5867817, 1.0975, 0.8240632, 1, 0, 0, 1, 1,
0.5929809, 1.303547, -0.2270143, 1, 0, 0, 1, 1,
0.5939317, 0.2342973, 3.073989, 1, 0, 0, 1, 1,
0.5951636, -0.8937889, 2.570505, 1, 0, 0, 1, 1,
0.5968541, -0.2051079, 1.66431, 0, 0, 0, 1, 1,
0.6023638, -0.5854524, 2.96079, 0, 0, 0, 1, 1,
0.6097841, 0.01387609, 0.6630405, 0, 0, 0, 1, 1,
0.6131095, 0.9562994, -0.5614085, 0, 0, 0, 1, 1,
0.6133538, -2.553843, 2.459905, 0, 0, 0, 1, 1,
0.6148667, 0.7644981, 2.586417, 0, 0, 0, 1, 1,
0.620278, -0.1694144, 2.961308, 0, 0, 0, 1, 1,
0.6230356, -0.5931171, 1.85901, 1, 1, 1, 1, 1,
0.626429, -2.612322, 1.790489, 1, 1, 1, 1, 1,
0.630854, 2.056368, 0.898572, 1, 1, 1, 1, 1,
0.6345134, -1.304323, 2.561167, 1, 1, 1, 1, 1,
0.6349583, 1.54583, -0.7513248, 1, 1, 1, 1, 1,
0.6349824, -0.7744874, 3.314048, 1, 1, 1, 1, 1,
0.6350504, -0.2497217, 1.448991, 1, 1, 1, 1, 1,
0.6455541, -0.1563878, 1.483015, 1, 1, 1, 1, 1,
0.6550862, -0.2366367, 3.086786, 1, 1, 1, 1, 1,
0.6597143, 1.102405, 0.8548653, 1, 1, 1, 1, 1,
0.6678951, 0.404685, 2.457495, 1, 1, 1, 1, 1,
0.6721109, 0.1210906, 2.752985, 1, 1, 1, 1, 1,
0.6736414, 0.4781017, 2.066826, 1, 1, 1, 1, 1,
0.6757787, 0.06130937, 1.09722, 1, 1, 1, 1, 1,
0.687793, 0.2516201, 1.668832, 1, 1, 1, 1, 1,
0.6926031, -0.1709958, 2.854203, 0, 0, 1, 1, 1,
0.6954833, -1.402605, 2.863583, 1, 0, 0, 1, 1,
0.7031529, -0.3183231, 3.595089, 1, 0, 0, 1, 1,
0.7045364, -1.612146, 2.710586, 1, 0, 0, 1, 1,
0.7063744, 0.4118481, 2.645745, 1, 0, 0, 1, 1,
0.7078178, -0.6120228, 3.107831, 1, 0, 0, 1, 1,
0.7088836, -1.429515, 3.316217, 0, 0, 0, 1, 1,
0.7106198, -0.1031561, 0.5571268, 0, 0, 0, 1, 1,
0.7129768, -0.4932477, 1.294308, 0, 0, 0, 1, 1,
0.7167592, -1.236531, 3.517846, 0, 0, 0, 1, 1,
0.718833, -0.01618439, 1.669593, 0, 0, 0, 1, 1,
0.7219603, 1.300508, 0.1920307, 0, 0, 0, 1, 1,
0.7294724, -1.068501, 2.650351, 0, 0, 0, 1, 1,
0.7315192, 0.621019, 0.1038274, 1, 1, 1, 1, 1,
0.732757, 0.6713344, 1.295974, 1, 1, 1, 1, 1,
0.7335808, 0.3139388, -0.5975248, 1, 1, 1, 1, 1,
0.7362996, -0.4251966, 2.295622, 1, 1, 1, 1, 1,
0.7393894, -0.5193401, 2.28636, 1, 1, 1, 1, 1,
0.7414431, -1.231121, 1.346849, 1, 1, 1, 1, 1,
0.7423511, 1.566631, 0.3430137, 1, 1, 1, 1, 1,
0.7570977, -0.6486606, 1.537918, 1, 1, 1, 1, 1,
0.7602906, -0.486359, 2.155672, 1, 1, 1, 1, 1,
0.7603361, -0.5266674, 3.191999, 1, 1, 1, 1, 1,
0.7636245, -0.1867202, 2.986555, 1, 1, 1, 1, 1,
0.765956, 2.911567, 0.7559964, 1, 1, 1, 1, 1,
0.7680851, 0.1685123, 1.997652, 1, 1, 1, 1, 1,
0.7698835, -0.526962, 1.590706, 1, 1, 1, 1, 1,
0.7716289, -2.121135, 3.258929, 1, 1, 1, 1, 1,
0.7742377, -0.961693, 2.873601, 0, 0, 1, 1, 1,
0.7749704, -3.404513, 3.07527, 1, 0, 0, 1, 1,
0.7780244, -2.063699, 0.0286589, 1, 0, 0, 1, 1,
0.7788475, -0.6271783, 3.094986, 1, 0, 0, 1, 1,
0.7801046, -0.0216891, 1.546049, 1, 0, 0, 1, 1,
0.7858167, -1.891479, 4.873745, 1, 0, 0, 1, 1,
0.7886401, -1.142693, 3.385223, 0, 0, 0, 1, 1,
0.7896666, -0.9199721, 2.140597, 0, 0, 0, 1, 1,
0.7924067, -0.3730667, 2.338094, 0, 0, 0, 1, 1,
0.796205, 2.530177, 1.459112, 0, 0, 0, 1, 1,
0.7980784, 0.1403029, 2.540399, 0, 0, 0, 1, 1,
0.8079602, -0.9347917, 2.978251, 0, 0, 0, 1, 1,
0.8098578, -0.5066749, 1.788366, 0, 0, 0, 1, 1,
0.8112869, 0.7216057, 0.832339, 1, 1, 1, 1, 1,
0.8137177, -2.526592, 1.81785, 1, 1, 1, 1, 1,
0.8151129, 2.208775, -0.3881407, 1, 1, 1, 1, 1,
0.8171564, 0.8739482, 1.253677, 1, 1, 1, 1, 1,
0.8182484, -0.7493734, 1.222707, 1, 1, 1, 1, 1,
0.8206479, -0.5059608, 1.500169, 1, 1, 1, 1, 1,
0.8250294, 0.1050072, 0.8403847, 1, 1, 1, 1, 1,
0.8279346, 0.3932119, 1.060131, 1, 1, 1, 1, 1,
0.829285, 0.6294866, 2.128658, 1, 1, 1, 1, 1,
0.8405831, 0.4174618, 1.562412, 1, 1, 1, 1, 1,
0.8418126, -0.2026246, 3.022301, 1, 1, 1, 1, 1,
0.8536519, 0.2323859, 1.133222, 1, 1, 1, 1, 1,
0.8669642, -1.893312, 2.883102, 1, 1, 1, 1, 1,
0.870395, 0.5467369, 1.302947, 1, 1, 1, 1, 1,
0.8711426, -0.1025318, 1.729407, 1, 1, 1, 1, 1,
0.8792329, 1.474533, 0.2134922, 0, 0, 1, 1, 1,
0.8808897, -1.41723, 0.462507, 1, 0, 0, 1, 1,
0.8861106, 0.9312454, 0.4323036, 1, 0, 0, 1, 1,
0.8955717, 0.1993652, 1.855807, 1, 0, 0, 1, 1,
0.9021438, 0.4709329, -0.1547818, 1, 0, 0, 1, 1,
0.9047951, 0.4640592, 0.8030506, 1, 0, 0, 1, 1,
0.9102727, 0.8714827, 1.510591, 0, 0, 0, 1, 1,
0.916338, -1.245451, 1.185728, 0, 0, 0, 1, 1,
0.9191052, 0.8825654, 0.7488422, 0, 0, 0, 1, 1,
0.9226243, 1.329467, 1.17794, 0, 0, 0, 1, 1,
0.9255501, 0.8701467, 0.7247517, 0, 0, 0, 1, 1,
0.9267038, 0.03019094, 3.702966, 0, 0, 0, 1, 1,
0.9317181, 0.01953086, 1.043649, 0, 0, 0, 1, 1,
0.9321907, 1.444703, 0.5522021, 1, 1, 1, 1, 1,
0.9466682, -0.972105, 1.093395, 1, 1, 1, 1, 1,
0.9469382, 0.0172503, 1.265581, 1, 1, 1, 1, 1,
0.9495631, -2.020826, 2.516552, 1, 1, 1, 1, 1,
0.951728, -1.194209, 0.729745, 1, 1, 1, 1, 1,
0.9527224, 0.0905633, -1.173173, 1, 1, 1, 1, 1,
0.9582546, 0.1412233, 2.393881, 1, 1, 1, 1, 1,
0.95831, -1.627912, 1.984035, 1, 1, 1, 1, 1,
0.9600972, -1.359859, 1.693924, 1, 1, 1, 1, 1,
0.9629993, 0.2891057, 2.029528, 1, 1, 1, 1, 1,
0.9662459, 0.3261881, 0.9487429, 1, 1, 1, 1, 1,
0.9684588, 0.4946878, 3.758958, 1, 1, 1, 1, 1,
0.9768842, 0.7064167, -0.4930261, 1, 1, 1, 1, 1,
0.9840596, 0.06614344, 1.698842, 1, 1, 1, 1, 1,
0.9871939, 0.2423928, 1.449209, 1, 1, 1, 1, 1,
0.9873086, -1.735527, 2.459073, 0, 0, 1, 1, 1,
0.9873297, -0.2140464, 2.006857, 1, 0, 0, 1, 1,
0.9898888, -0.3937964, 2.155978, 1, 0, 0, 1, 1,
0.9934978, 3.180107, -0.6775794, 1, 0, 0, 1, 1,
0.9965506, -0.3339471, -1.490278, 1, 0, 0, 1, 1,
1.00544, -1.043316, 2.726749, 1, 0, 0, 1, 1,
1.00972, -1.152859, 2.837341, 0, 0, 0, 1, 1,
1.009779, -1.72804, 2.713405, 0, 0, 0, 1, 1,
1.016343, 1.483635, 1.958989, 0, 0, 0, 1, 1,
1.020427, -0.7282737, 2.555532, 0, 0, 0, 1, 1,
1.029774, -1.12946, 1.009215, 0, 0, 0, 1, 1,
1.032834, -0.5237951, 1.109376, 0, 0, 0, 1, 1,
1.0349, 0.5377671, 0.8385092, 0, 0, 0, 1, 1,
1.049808, -1.807022, 1.819775, 1, 1, 1, 1, 1,
1.052778, -0.5986199, 0.3183059, 1, 1, 1, 1, 1,
1.053162, -1.297333, 2.69378, 1, 1, 1, 1, 1,
1.060311, 0.8279555, 1.055791, 1, 1, 1, 1, 1,
1.063478, -0.9793606, 2.319262, 1, 1, 1, 1, 1,
1.069882, -0.06983378, 1.888809, 1, 1, 1, 1, 1,
1.075644, -1.186232, 2.77557, 1, 1, 1, 1, 1,
1.078158, 0.1201662, 2.001386, 1, 1, 1, 1, 1,
1.078884, 0.3412771, 1.86979, 1, 1, 1, 1, 1,
1.086252, 0.3046897, 1.352693, 1, 1, 1, 1, 1,
1.089915, 1.240179, 1.920668, 1, 1, 1, 1, 1,
1.098439, -2.115654, 3.508204, 1, 1, 1, 1, 1,
1.105829, -0.03451312, 2.475342, 1, 1, 1, 1, 1,
1.113669, 0.480697, -0.1657997, 1, 1, 1, 1, 1,
1.116875, -0.4936449, 0.7044254, 1, 1, 1, 1, 1,
1.120324, 0.3828587, 0.1343179, 0, 0, 1, 1, 1,
1.128594, -0.9387479, 3.810945, 1, 0, 0, 1, 1,
1.129643, -0.6207498, 1.796695, 1, 0, 0, 1, 1,
1.14338, -0.3799162, 1.957864, 1, 0, 0, 1, 1,
1.14382, 1.256913, 0.2717948, 1, 0, 0, 1, 1,
1.158457, -1.834324, 3.25371, 1, 0, 0, 1, 1,
1.169509, -0.3452724, 3.655785, 0, 0, 0, 1, 1,
1.173948, -0.1282206, 1.147072, 0, 0, 0, 1, 1,
1.17608, 0.5752436, 1.560739, 0, 0, 0, 1, 1,
1.179025, -1.041027, 0.2081671, 0, 0, 0, 1, 1,
1.189035, 0.005057752, 2.372895, 0, 0, 0, 1, 1,
1.190328, 0.9233787, 1.716987, 0, 0, 0, 1, 1,
1.195901, -1.799554, 1.688153, 0, 0, 0, 1, 1,
1.197242, 0.852979, -0.3792634, 1, 1, 1, 1, 1,
1.205774, 0.3009272, 0.02562674, 1, 1, 1, 1, 1,
1.207763, -0.1302748, 1.558125, 1, 1, 1, 1, 1,
1.210395, -0.4057372, 1.683311, 1, 1, 1, 1, 1,
1.214684, 0.05163963, -0.7168257, 1, 1, 1, 1, 1,
1.217456, -0.4511497, 2.223144, 1, 1, 1, 1, 1,
1.224049, 0.1191655, 2.48555, 1, 1, 1, 1, 1,
1.234879, -0.91975, 1.777128, 1, 1, 1, 1, 1,
1.239339, -1.178238, 3.629267, 1, 1, 1, 1, 1,
1.242563, 0.3980696, 1.195652, 1, 1, 1, 1, 1,
1.245388, 1.99131, 0.5387721, 1, 1, 1, 1, 1,
1.248751, 1.086856, -1.161941, 1, 1, 1, 1, 1,
1.250817, 1.342892, 1.33563, 1, 1, 1, 1, 1,
1.272983, 1.336916, 0.3238501, 1, 1, 1, 1, 1,
1.276685, 1.968239, -0.004054519, 1, 1, 1, 1, 1,
1.280018, -0.8095926, 0.4794503, 0, 0, 1, 1, 1,
1.281504, 0.3695034, 2.454367, 1, 0, 0, 1, 1,
1.282137, 0.6881932, 0.5539278, 1, 0, 0, 1, 1,
1.293929, 0.0663785, 2.932668, 1, 0, 0, 1, 1,
1.304606, -1.206909, 3.623269, 1, 0, 0, 1, 1,
1.319007, -0.4002489, 3.041529, 1, 0, 0, 1, 1,
1.327991, -1.266942, 3.161252, 0, 0, 0, 1, 1,
1.336002, 0.8354927, -0.01937382, 0, 0, 0, 1, 1,
1.336367, 0.8913174, 2.812227, 0, 0, 0, 1, 1,
1.337027, 0.9052777, 2.731898, 0, 0, 0, 1, 1,
1.347885, -0.5753908, 3.859351, 0, 0, 0, 1, 1,
1.359505, 1.723947, 3.340357, 0, 0, 0, 1, 1,
1.367195, 0.2257682, 0.6368697, 0, 0, 0, 1, 1,
1.374014, 1.436525, 0.1617489, 1, 1, 1, 1, 1,
1.374493, 0.35102, 3.414535, 1, 1, 1, 1, 1,
1.380785, 1.648267, 0.6377122, 1, 1, 1, 1, 1,
1.38115, -0.1545591, 1.518954, 1, 1, 1, 1, 1,
1.381475, 0.2935288, 0.561087, 1, 1, 1, 1, 1,
1.404197, 1.174582, 0.5892554, 1, 1, 1, 1, 1,
1.407552, -0.115742, 2.434074, 1, 1, 1, 1, 1,
1.416782, 1.316212, 1.120757, 1, 1, 1, 1, 1,
1.41831, -0.1871591, 1.270533, 1, 1, 1, 1, 1,
1.419931, 0.08758254, 0.0524059, 1, 1, 1, 1, 1,
1.419956, 0.1153178, 1.028548, 1, 1, 1, 1, 1,
1.425816, -0.2931135, 1.894902, 1, 1, 1, 1, 1,
1.454885, -2.457457, 2.334367, 1, 1, 1, 1, 1,
1.4561, -1.817641, 3.189852, 1, 1, 1, 1, 1,
1.467257, 0.0591587, 0.7542055, 1, 1, 1, 1, 1,
1.478455, -2.019718, 3.028942, 0, 0, 1, 1, 1,
1.479706, -0.1102948, 0.7228086, 1, 0, 0, 1, 1,
1.482329, -0.788119, 2.035741, 1, 0, 0, 1, 1,
1.50625, -1.243949, 1.644617, 1, 0, 0, 1, 1,
1.511038, 0.6757775, 0.7251601, 1, 0, 0, 1, 1,
1.526595, -1.927075, 1.89334, 1, 0, 0, 1, 1,
1.529145, 0.3723111, 1.292762, 0, 0, 0, 1, 1,
1.532969, 0.8135725, 1.126626, 0, 0, 0, 1, 1,
1.545725, 0.2788143, 2.049478, 0, 0, 0, 1, 1,
1.549379, -0.9329872, 2.808104, 0, 0, 0, 1, 1,
1.553579, 0.04750884, 3.240082, 0, 0, 0, 1, 1,
1.55466, -0.2141219, 2.551973, 0, 0, 0, 1, 1,
1.559636, 0.02184499, 2.020429, 0, 0, 0, 1, 1,
1.563719, -1.576317, 2.222176, 1, 1, 1, 1, 1,
1.571729, -0.7706917, 3.373735, 1, 1, 1, 1, 1,
1.577914, 0.2367766, 2.250908, 1, 1, 1, 1, 1,
1.595357, -0.9610744, 2.349838, 1, 1, 1, 1, 1,
1.595887, 0.4076045, 1.085158, 1, 1, 1, 1, 1,
1.605043, 1.760165, 2.558784, 1, 1, 1, 1, 1,
1.627603, -1.263253, 2.212955, 1, 1, 1, 1, 1,
1.643526, -2.094122, 3.834466, 1, 1, 1, 1, 1,
1.656757, -0.4170296, 1.043637, 1, 1, 1, 1, 1,
1.670185, -0.09802438, 2.241467, 1, 1, 1, 1, 1,
1.672695, -1.041292, 3.241537, 1, 1, 1, 1, 1,
1.676439, 0.1146644, 1.798991, 1, 1, 1, 1, 1,
1.680004, -0.04761252, 1.540889, 1, 1, 1, 1, 1,
1.700783, 0.9181535, 1.86597, 1, 1, 1, 1, 1,
1.701307, 0.3592726, 0.5483064, 1, 1, 1, 1, 1,
1.718017, -0.5791849, 0.6683689, 0, 0, 1, 1, 1,
1.723085, -0.4039851, 1.037424, 1, 0, 0, 1, 1,
1.728017, 0.7443793, 2.075685, 1, 0, 0, 1, 1,
1.731202, -0.2456304, 2.846, 1, 0, 0, 1, 1,
1.731465, -2.001461, 2.504238, 1, 0, 0, 1, 1,
1.773802, 1.457996, 0.8452073, 1, 0, 0, 1, 1,
1.776082, 0.1763725, 2.039824, 0, 0, 0, 1, 1,
1.780591, -1.562713, 1.174944, 0, 0, 0, 1, 1,
1.813098, 1.290508, 1.396453, 0, 0, 0, 1, 1,
1.815522, -0.4760494, 1.747476, 0, 0, 0, 1, 1,
1.821924, -1.161537, 2.754723, 0, 0, 0, 1, 1,
1.834845, 0.03104748, 2.343612, 0, 0, 0, 1, 1,
1.83539, -0.5804634, 2.857566, 0, 0, 0, 1, 1,
1.843035, 0.3021967, 2.06533, 1, 1, 1, 1, 1,
1.851725, -1.014852, 0.6367042, 1, 1, 1, 1, 1,
1.88227, 0.2562012, 1.746278, 1, 1, 1, 1, 1,
1.92573, -1.052648, 1.848215, 1, 1, 1, 1, 1,
1.937099, 0.4050361, 3.284695, 1, 1, 1, 1, 1,
1.978979, 0.4882539, 0.5691494, 1, 1, 1, 1, 1,
2.001986, 0.5919929, 1.637492, 1, 1, 1, 1, 1,
2.006545, -0.4567502, 0.947995, 1, 1, 1, 1, 1,
2.007602, 1.538775, 1.170939, 1, 1, 1, 1, 1,
2.035133, -1.446362, 2.577364, 1, 1, 1, 1, 1,
2.063843, -0.5314802, 3.456302, 1, 1, 1, 1, 1,
2.074356, 0.6075462, 1.288892, 1, 1, 1, 1, 1,
2.085169, -0.2924436, 2.743453, 1, 1, 1, 1, 1,
2.094993, 0.4999919, 1.215229, 1, 1, 1, 1, 1,
2.101332, 0.2199992, 1.413979, 1, 1, 1, 1, 1,
2.148729, -2.077724, 0.9636169, 0, 0, 1, 1, 1,
2.158082, 0.07671978, 1.822646, 1, 0, 0, 1, 1,
2.164048, -0.9950049, 0.3840891, 1, 0, 0, 1, 1,
2.208872, 0.3709461, -0.753489, 1, 0, 0, 1, 1,
2.213283, 0.8240229, -0.2433922, 1, 0, 0, 1, 1,
2.227108, -0.1607056, 1.897007, 1, 0, 0, 1, 1,
2.283546, 1.409821, 0.1810902, 0, 0, 0, 1, 1,
2.306719, -0.6378307, 1.549028, 0, 0, 0, 1, 1,
2.345649, -1.036535, 0.7727841, 0, 0, 0, 1, 1,
2.354447, -1.914093, 0.8931261, 0, 0, 0, 1, 1,
2.376433, -0.582562, 2.720695, 0, 0, 0, 1, 1,
2.401695, 1.801127, 1.607613, 0, 0, 0, 1, 1,
2.430604, -0.6070634, 1.117406, 0, 0, 0, 1, 1,
2.430816, 1.334964, 1.884202, 1, 1, 1, 1, 1,
2.533959, 0.1395857, 2.607984, 1, 1, 1, 1, 1,
2.613719, 0.05667546, 1.205827, 1, 1, 1, 1, 1,
2.858893, -2.144816, 1.575659, 1, 1, 1, 1, 1,
2.869658, -0.3733339, 0.3244984, 1, 1, 1, 1, 1,
2.977875, 1.376368, -1.097652, 1, 1, 1, 1, 1,
3.984496, 0.8639992, 0.5375441, 1, 1, 1, 1, 1
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
var radius = 9.73321;
var distance = 34.18748;
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
mvMatrix.translate( -0.1772709, 0.01223421, -0.009285212 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18748);
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
