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
-3.288203, 0.8459702, -0.9973338, 1, 0, 0, 1,
-2.942253, 0.7199849, -3.126895, 1, 0.007843138, 0, 1,
-2.59664, -0.9086032, -2.502856, 1, 0.01176471, 0, 1,
-2.593143, -0.8565106, -0.04813131, 1, 0.01960784, 0, 1,
-2.538096, -0.1907167, -2.781984, 1, 0.02352941, 0, 1,
-2.431344, 0.7987474, -2.045813, 1, 0.03137255, 0, 1,
-2.402965, -0.399024, -2.976752, 1, 0.03529412, 0, 1,
-2.376074, 0.5629564, -2.726266, 1, 0.04313726, 0, 1,
-2.371862, 0.3360468, -0.8680078, 1, 0.04705882, 0, 1,
-2.350373, 0.9987879, -0.3537595, 1, 0.05490196, 0, 1,
-2.25382, 0.3514658, -1.124978, 1, 0.05882353, 0, 1,
-2.245279, 1.032063, -0.3715156, 1, 0.06666667, 0, 1,
-2.241721, -0.483163, -2.791777, 1, 0.07058824, 0, 1,
-2.205066, -0.5244058, -2.061311, 1, 0.07843138, 0, 1,
-2.200095, 0.1438621, -2.059062, 1, 0.08235294, 0, 1,
-2.190441, -0.2246254, -2.406901, 1, 0.09019608, 0, 1,
-2.162757, 1.008027, -0.8392977, 1, 0.09411765, 0, 1,
-2.117095, -0.1318076, -1.955904, 1, 0.1019608, 0, 1,
-2.111986, 1.506431, 0.6344676, 1, 0.1098039, 0, 1,
-2.073287, -0.2078949, 0.7441193, 1, 0.1137255, 0, 1,
-2.058345, -1.868421, -2.966454, 1, 0.1215686, 0, 1,
-2.049245, 1.189243, -1.235065, 1, 0.1254902, 0, 1,
-2.007335, 0.6253138, -3.170493, 1, 0.1333333, 0, 1,
-1.9444, 0.3365853, -2.321756, 1, 0.1372549, 0, 1,
-1.90807, -0.3177189, -2.680015, 1, 0.145098, 0, 1,
-1.870329, -0.6924296, -2.79244, 1, 0.1490196, 0, 1,
-1.863142, 0.8092902, -2.276807, 1, 0.1568628, 0, 1,
-1.861711, 0.2144825, -2.356527, 1, 0.1607843, 0, 1,
-1.845267, 1.266913, -0.7869558, 1, 0.1686275, 0, 1,
-1.816517, -0.3271499, -2.086211, 1, 0.172549, 0, 1,
-1.787581, 0.4028223, -3.351873, 1, 0.1803922, 0, 1,
-1.684171, -1.66121, -2.383301, 1, 0.1843137, 0, 1,
-1.672233, -0.1544241, -1.063204, 1, 0.1921569, 0, 1,
-1.670993, 0.6746334, 1.016002, 1, 0.1960784, 0, 1,
-1.655438, 0.8976312, 0.9979193, 1, 0.2039216, 0, 1,
-1.653737, -1.57416, -1.845517, 1, 0.2117647, 0, 1,
-1.632385, -0.3145002, -0.7152671, 1, 0.2156863, 0, 1,
-1.620176, -2.644557, -1.623707, 1, 0.2235294, 0, 1,
-1.618667, -1.334629, -2.354781, 1, 0.227451, 0, 1,
-1.616378, 1.531418, 1.601063, 1, 0.2352941, 0, 1,
-1.59591, 0.2602726, -3.306731, 1, 0.2392157, 0, 1,
-1.587964, 0.7642215, -0.4457387, 1, 0.2470588, 0, 1,
-1.584629, 0.1384401, -1.385934, 1, 0.2509804, 0, 1,
-1.58327, 0.3865223, -0.8320582, 1, 0.2588235, 0, 1,
-1.576528, 0.02149649, -2.421995, 1, 0.2627451, 0, 1,
-1.56583, 0.1489928, 0.3382854, 1, 0.2705882, 0, 1,
-1.551764, 1.173236, -0.3532782, 1, 0.2745098, 0, 1,
-1.549091, 1.340624, -2.062913, 1, 0.282353, 0, 1,
-1.546944, -0.6715005, -0.4219622, 1, 0.2862745, 0, 1,
-1.546002, -1.558134, -3.274855, 1, 0.2941177, 0, 1,
-1.518624, 0.1882106, -0.3915887, 1, 0.3019608, 0, 1,
-1.5157, 0.4538714, -2.455333, 1, 0.3058824, 0, 1,
-1.500856, -0.367533, -2.778865, 1, 0.3137255, 0, 1,
-1.499362, 0.5149857, -0.5069778, 1, 0.3176471, 0, 1,
-1.488113, 1.903867, 0.2567087, 1, 0.3254902, 0, 1,
-1.484595, 0.699954, -2.47666, 1, 0.3294118, 0, 1,
-1.483748, -1.189171, -3.606268, 1, 0.3372549, 0, 1,
-1.473958, -0.4262385, -2.140687, 1, 0.3411765, 0, 1,
-1.467762, -0.1228557, -2.824022, 1, 0.3490196, 0, 1,
-1.459926, -0.3174105, -1.773118, 1, 0.3529412, 0, 1,
-1.446504, -1.850566, -2.415637, 1, 0.3607843, 0, 1,
-1.434109, 0.2843714, -0.05040707, 1, 0.3647059, 0, 1,
-1.424588, -1.115235, -0.3153674, 1, 0.372549, 0, 1,
-1.418062, -0.3531433, -3.423311, 1, 0.3764706, 0, 1,
-1.409131, 0.9271883, -0.947162, 1, 0.3843137, 0, 1,
-1.408636, -0.3104124, -2.534647, 1, 0.3882353, 0, 1,
-1.407968, 1.343428, -0.5668599, 1, 0.3960784, 0, 1,
-1.400615, 0.9856203, -0.5826463, 1, 0.4039216, 0, 1,
-1.397481, -0.3973994, -1.821001, 1, 0.4078431, 0, 1,
-1.393831, 0.4894282, -0.2620371, 1, 0.4156863, 0, 1,
-1.390183, -0.2088537, -2.650496, 1, 0.4196078, 0, 1,
-1.389912, -0.7571985, -0.709353, 1, 0.427451, 0, 1,
-1.385249, 1.015085, -0.9059072, 1, 0.4313726, 0, 1,
-1.379248, -0.04021968, -1.767826, 1, 0.4392157, 0, 1,
-1.366167, -0.5849987, -2.077605, 1, 0.4431373, 0, 1,
-1.362406, 0.007343414, -0.4849049, 1, 0.4509804, 0, 1,
-1.360221, 0.6312061, -2.298373, 1, 0.454902, 0, 1,
-1.359349, -2.508955, -3.345139, 1, 0.4627451, 0, 1,
-1.358442, 0.508226, -2.978034, 1, 0.4666667, 0, 1,
-1.358343, 0.5024924, -1.212915, 1, 0.4745098, 0, 1,
-1.345804, -0.9575139, -1.947961, 1, 0.4784314, 0, 1,
-1.34339, -0.04466094, -1.258516, 1, 0.4862745, 0, 1,
-1.341514, 0.3003502, -2.7486, 1, 0.4901961, 0, 1,
-1.334818, -1.119744, -2.795569, 1, 0.4980392, 0, 1,
-1.326266, 0.4894458, -2.514722, 1, 0.5058824, 0, 1,
-1.325511, -1.019914, -0.837813, 1, 0.509804, 0, 1,
-1.318662, -1.393522, -1.831543, 1, 0.5176471, 0, 1,
-1.306105, 0.8072307, -1.066635, 1, 0.5215687, 0, 1,
-1.30382, 0.1150435, -1.323602, 1, 0.5294118, 0, 1,
-1.303168, -0.3224573, -1.89485, 1, 0.5333334, 0, 1,
-1.290764, -0.4031365, -1.821457, 1, 0.5411765, 0, 1,
-1.286549, 0.1892064, 2.357366, 1, 0.5450981, 0, 1,
-1.279404, 0.1790572, -1.002744, 1, 0.5529412, 0, 1,
-1.276896, -0.775799, -2.375053, 1, 0.5568628, 0, 1,
-1.265589, 0.01557386, -3.15295, 1, 0.5647059, 0, 1,
-1.264134, 0.3090846, -2.276368, 1, 0.5686275, 0, 1,
-1.262319, 0.2644543, -1.172214, 1, 0.5764706, 0, 1,
-1.260614, -1.033751, -2.178634, 1, 0.5803922, 0, 1,
-1.251207, -0.4574963, -0.8821537, 1, 0.5882353, 0, 1,
-1.24107, -0.7521414, -0.9632891, 1, 0.5921569, 0, 1,
-1.232065, -1.279593, -3.56366, 1, 0.6, 0, 1,
-1.231836, -1.031733, -3.510223, 1, 0.6078432, 0, 1,
-1.228583, 0.9228136, -2.032064, 1, 0.6117647, 0, 1,
-1.228167, 0.8948047, -2.675869, 1, 0.6196079, 0, 1,
-1.227326, -0.698265, -2.01739, 1, 0.6235294, 0, 1,
-1.226907, -0.1911733, -1.395038, 1, 0.6313726, 0, 1,
-1.226437, -1.070349, -1.678546, 1, 0.6352941, 0, 1,
-1.218074, -0.1092275, -0.6877356, 1, 0.6431373, 0, 1,
-1.195301, -0.4793124, -2.581495, 1, 0.6470588, 0, 1,
-1.190927, 0.9595129, 0.9005505, 1, 0.654902, 0, 1,
-1.180107, -0.8988274, -3.094898, 1, 0.6588235, 0, 1,
-1.174675, 0.401169, -1.585886, 1, 0.6666667, 0, 1,
-1.171302, -0.4027701, -0.9073684, 1, 0.6705883, 0, 1,
-1.165387, 0.9452255, -1.197663, 1, 0.6784314, 0, 1,
-1.163957, -0.2490077, -2.184896, 1, 0.682353, 0, 1,
-1.162356, -0.7528605, -2.356684, 1, 0.6901961, 0, 1,
-1.161892, 1.294744, -0.2075062, 1, 0.6941177, 0, 1,
-1.157237, 0.04644703, -1.155458, 1, 0.7019608, 0, 1,
-1.155791, 0.6832182, -1.032802, 1, 0.7098039, 0, 1,
-1.153506, 0.655957, 1.583672, 1, 0.7137255, 0, 1,
-1.147164, 1.551647, -0.8986855, 1, 0.7215686, 0, 1,
-1.146815, 1.247508, -1.499611, 1, 0.7254902, 0, 1,
-1.140476, -1.518062, -4.341613, 1, 0.7333333, 0, 1,
-1.137011, 0.1574042, -0.9753163, 1, 0.7372549, 0, 1,
-1.128068, 0.4743251, -1.962483, 1, 0.7450981, 0, 1,
-1.11913, -0.6560958, -1.456331, 1, 0.7490196, 0, 1,
-1.116152, -0.543153, -2.997423, 1, 0.7568628, 0, 1,
-1.104591, -0.427557, -3.080934, 1, 0.7607843, 0, 1,
-1.100527, 0.3101941, -1.555981, 1, 0.7686275, 0, 1,
-1.095538, 0.9155198, 0.618164, 1, 0.772549, 0, 1,
-1.089476, -1.590322, -1.853554, 1, 0.7803922, 0, 1,
-1.086846, 0.3864812, -2.425445, 1, 0.7843137, 0, 1,
-1.082216, -0.4232, -2.840746, 1, 0.7921569, 0, 1,
-1.078604, -0.3976383, -2.535333, 1, 0.7960784, 0, 1,
-1.077245, 1.036923, -1.002243, 1, 0.8039216, 0, 1,
-1.075768, 0.4686388, -0.5213799, 1, 0.8117647, 0, 1,
-1.074275, 0.2880679, -3.276569, 1, 0.8156863, 0, 1,
-1.064514, -0.4934536, -3.403928, 1, 0.8235294, 0, 1,
-1.060834, 0.3737568, -1.314469, 1, 0.827451, 0, 1,
-1.043412, -1.435405, -3.158895, 1, 0.8352941, 0, 1,
-1.040522, 1.071766, -0.6417041, 1, 0.8392157, 0, 1,
-1.040316, -2.22087, -2.443392, 1, 0.8470588, 0, 1,
-1.040164, 1.731551, -1.726362, 1, 0.8509804, 0, 1,
-1.035483, 0.2224078, -0.6876414, 1, 0.8588235, 0, 1,
-1.034115, 0.6578721, -0.4426364, 1, 0.8627451, 0, 1,
-1.030974, -1.159579, -3.304581, 1, 0.8705882, 0, 1,
-1.028732, 0.9690157, -0.2508296, 1, 0.8745098, 0, 1,
-1.023044, -0.3114562, -2.69615, 1, 0.8823529, 0, 1,
-1.017909, -0.6759505, -1.163259, 1, 0.8862745, 0, 1,
-1.016504, 0.2854128, -0.8726201, 1, 0.8941177, 0, 1,
-1.013301, 0.4135921, -0.6218483, 1, 0.8980392, 0, 1,
-1.012146, 0.3140729, -0.7593709, 1, 0.9058824, 0, 1,
-1.004885, -0.2964839, -3.046817, 1, 0.9137255, 0, 1,
-1.002603, 0.6373732, -1.089185, 1, 0.9176471, 0, 1,
-1.001668, 0.2396501, -2.064744, 1, 0.9254902, 0, 1,
-0.9976738, 1.244636, -2.158417, 1, 0.9294118, 0, 1,
-0.9966432, -1.758043, -2.469247, 1, 0.9372549, 0, 1,
-0.9904234, 1.404912, -0.6195527, 1, 0.9411765, 0, 1,
-0.9853954, -0.009075609, -2.016205, 1, 0.9490196, 0, 1,
-0.983712, -0.9053637, -2.232678, 1, 0.9529412, 0, 1,
-0.9765888, 0.6410726, 0.6085758, 1, 0.9607843, 0, 1,
-0.9706748, 0.7945367, -2.474013, 1, 0.9647059, 0, 1,
-0.960242, 0.2993034, -0.9906725, 1, 0.972549, 0, 1,
-0.9549009, -1.340865, -3.743831, 1, 0.9764706, 0, 1,
-0.9543748, -0.988112, -2.516123, 1, 0.9843137, 0, 1,
-0.954091, -1.043444, -1.35117, 1, 0.9882353, 0, 1,
-0.9505612, -0.3011371, -2.208807, 1, 0.9960784, 0, 1,
-0.9502128, 0.4615401, -1.141859, 0.9960784, 1, 0, 1,
-0.9483452, -0.4066064, -1.842501, 0.9921569, 1, 0, 1,
-0.945847, 0.7985804, -2.101174, 0.9843137, 1, 0, 1,
-0.9453904, -1.02514, -2.505133, 0.9803922, 1, 0, 1,
-0.9433811, -1.15716, -2.760545, 0.972549, 1, 0, 1,
-0.9432324, 2.174679, 0.3744119, 0.9686275, 1, 0, 1,
-0.9423245, 0.6977704, -0.4555612, 0.9607843, 1, 0, 1,
-0.9403834, 1.070437, 0.468492, 0.9568627, 1, 0, 1,
-0.9390858, 1.211777, -0.1561542, 0.9490196, 1, 0, 1,
-0.93693, 1.047471, -0.6596835, 0.945098, 1, 0, 1,
-0.9366133, -0.02105704, -0.9532131, 0.9372549, 1, 0, 1,
-0.9356075, -0.3241153, -0.5549388, 0.9333333, 1, 0, 1,
-0.9331345, -0.301265, -3.030629, 0.9254902, 1, 0, 1,
-0.932291, 0.5763799, 0.1044706, 0.9215686, 1, 0, 1,
-0.9317342, 0.7848087, -1.519448, 0.9137255, 1, 0, 1,
-0.9299163, 0.03663382, -0.562123, 0.9098039, 1, 0, 1,
-0.9267791, -0.5315317, -2.449456, 0.9019608, 1, 0, 1,
-0.9244489, 0.1120234, -1.591236, 0.8941177, 1, 0, 1,
-0.9222205, 2.044835, 0.4437656, 0.8901961, 1, 0, 1,
-0.9220919, 0.2314361, -1.443942, 0.8823529, 1, 0, 1,
-0.918808, 1.469327, -0.6882933, 0.8784314, 1, 0, 1,
-0.9144878, -0.634734, -3.263642, 0.8705882, 1, 0, 1,
-0.9097531, 1.405391, -0.2371377, 0.8666667, 1, 0, 1,
-0.905767, 2.765342, -1.762074, 0.8588235, 1, 0, 1,
-0.8999414, -1.238896, -1.717584, 0.854902, 1, 0, 1,
-0.8878831, 0.1618933, -2.335716, 0.8470588, 1, 0, 1,
-0.8811428, -1.027483, -3.326741, 0.8431373, 1, 0, 1,
-0.8748612, 0.02252545, -1.479035, 0.8352941, 1, 0, 1,
-0.8738281, -0.7038376, -0.7398469, 0.8313726, 1, 0, 1,
-0.8737812, 0.9759281, -0.2584209, 0.8235294, 1, 0, 1,
-0.8706695, -0.6451905, -2.768036, 0.8196079, 1, 0, 1,
-0.8672314, -1.264056, -2.952003, 0.8117647, 1, 0, 1,
-0.8658473, -1.344048, -0.5905957, 0.8078431, 1, 0, 1,
-0.8587373, -1.017483, -1.818636, 0.8, 1, 0, 1,
-0.8569432, -1.38552, -2.5576, 0.7921569, 1, 0, 1,
-0.8562166, 0.1176969, -0.5370044, 0.7882353, 1, 0, 1,
-0.8535873, -0.9900847, -1.694893, 0.7803922, 1, 0, 1,
-0.8524144, -0.03381629, -0.9541099, 0.7764706, 1, 0, 1,
-0.8485548, 1.099502, -0.5186008, 0.7686275, 1, 0, 1,
-0.8476238, 0.07710558, -1.197214, 0.7647059, 1, 0, 1,
-0.8465856, 0.6755975, 0.1970315, 0.7568628, 1, 0, 1,
-0.8448709, 0.5759216, -1.635746, 0.7529412, 1, 0, 1,
-0.8384571, 1.275745, -0.5400698, 0.7450981, 1, 0, 1,
-0.8283417, 0.7547209, -0.4085713, 0.7411765, 1, 0, 1,
-0.8277355, 1.469751, 0.9280552, 0.7333333, 1, 0, 1,
-0.8264995, 0.2023747, -1.062662, 0.7294118, 1, 0, 1,
-0.8257776, 0.9002534, -1.171675, 0.7215686, 1, 0, 1,
-0.8245648, -1.109324, -1.579846, 0.7176471, 1, 0, 1,
-0.8138539, 0.02061608, -2.663989, 0.7098039, 1, 0, 1,
-0.808481, 0.01758834, -2.151287, 0.7058824, 1, 0, 1,
-0.8080616, 1.750246, -0.04273463, 0.6980392, 1, 0, 1,
-0.8067186, -0.9885837, -2.4855, 0.6901961, 1, 0, 1,
-0.8056234, 1.082279, -0.7156383, 0.6862745, 1, 0, 1,
-0.8010557, -2.527483, -4.344449, 0.6784314, 1, 0, 1,
-0.7984179, -1.739574, -2.639992, 0.6745098, 1, 0, 1,
-0.7955659, 0.6256704, -2.442888, 0.6666667, 1, 0, 1,
-0.7949979, 0.1212025, -1.278469, 0.6627451, 1, 0, 1,
-0.7935432, -0.4331706, -0.7205258, 0.654902, 1, 0, 1,
-0.7927982, 0.6972858, -1.897339, 0.6509804, 1, 0, 1,
-0.7879699, -0.0924403, -2.21839, 0.6431373, 1, 0, 1,
-0.7860247, -0.3353472, -2.283313, 0.6392157, 1, 0, 1,
-0.7853939, 0.8621809, -2.075261, 0.6313726, 1, 0, 1,
-0.7834227, 1.000805, -0.4584991, 0.627451, 1, 0, 1,
-0.7828739, 2.441702, 0.8804652, 0.6196079, 1, 0, 1,
-0.7810587, 1.85361, -0.8662221, 0.6156863, 1, 0, 1,
-0.7784194, -0.424911, -2.149037, 0.6078432, 1, 0, 1,
-0.7772609, -1.089123, -2.999015, 0.6039216, 1, 0, 1,
-0.7747983, -1.011553, -1.975522, 0.5960785, 1, 0, 1,
-0.7724999, -2.110098, -3.147688, 0.5882353, 1, 0, 1,
-0.7721215, 0.1343919, -2.629457, 0.5843138, 1, 0, 1,
-0.7707116, 0.473663, -1.400125, 0.5764706, 1, 0, 1,
-0.7680944, -0.4990676, -2.846893, 0.572549, 1, 0, 1,
-0.7632167, -1.402062, -2.870101, 0.5647059, 1, 0, 1,
-0.7620975, 0.7703894, -0.06287285, 0.5607843, 1, 0, 1,
-0.7525288, 2.730171, -1.323342, 0.5529412, 1, 0, 1,
-0.7512022, -0.4041598, -3.230994, 0.5490196, 1, 0, 1,
-0.7476754, -1.706524, -2.346326, 0.5411765, 1, 0, 1,
-0.7473273, 0.5145074, -1.132181, 0.5372549, 1, 0, 1,
-0.7457066, 1.378819, -1.69193, 0.5294118, 1, 0, 1,
-0.7387826, -0.3214786, -2.301408, 0.5254902, 1, 0, 1,
-0.7367524, -0.2794419, -1.144744, 0.5176471, 1, 0, 1,
-0.7351844, 1.335533, -0.03293841, 0.5137255, 1, 0, 1,
-0.7334622, 0.4122224, -0.6363996, 0.5058824, 1, 0, 1,
-0.7297857, -0.5308229, -1.48721, 0.5019608, 1, 0, 1,
-0.7182366, -0.2163066, -2.799762, 0.4941176, 1, 0, 1,
-0.7149891, -0.8923207, -2.393175, 0.4862745, 1, 0, 1,
-0.7131011, 1.448315, 2.405357, 0.4823529, 1, 0, 1,
-0.7093704, 0.4598723, 0.6625484, 0.4745098, 1, 0, 1,
-0.6979007, 0.7199339, -1.58075, 0.4705882, 1, 0, 1,
-0.6961142, 2.000761, -0.8791483, 0.4627451, 1, 0, 1,
-0.690216, -0.6973954, -1.299249, 0.4588235, 1, 0, 1,
-0.6874372, -0.5207964, -2.050867, 0.4509804, 1, 0, 1,
-0.6815732, -0.4705623, -3.343812, 0.4470588, 1, 0, 1,
-0.6778327, 0.6320622, -0.5099471, 0.4392157, 1, 0, 1,
-0.6734703, -1.083312, -3.476058, 0.4352941, 1, 0, 1,
-0.6733491, 0.4265808, 0.08473837, 0.427451, 1, 0, 1,
-0.6697192, -0.07137495, -2.246006, 0.4235294, 1, 0, 1,
-0.6637111, -0.9535624, -1.451907, 0.4156863, 1, 0, 1,
-0.6618558, 0.1304943, -0.6558666, 0.4117647, 1, 0, 1,
-0.6604622, 2.267776, -1.211301, 0.4039216, 1, 0, 1,
-0.6595814, -2.751898, -4.338021, 0.3960784, 1, 0, 1,
-0.6515319, -0.196391, -2.280209, 0.3921569, 1, 0, 1,
-0.6486651, -0.8875259, -2.538088, 0.3843137, 1, 0, 1,
-0.6433922, -0.546591, -3.026987, 0.3803922, 1, 0, 1,
-0.6426626, -0.3802222, -2.496474, 0.372549, 1, 0, 1,
-0.6412151, -1.356143, -3.479631, 0.3686275, 1, 0, 1,
-0.6389558, -1.941781, -2.732522, 0.3607843, 1, 0, 1,
-0.6343653, -0.1277447, -1.50962, 0.3568628, 1, 0, 1,
-0.6333638, -1.067404, 0.1630942, 0.3490196, 1, 0, 1,
-0.6301643, 1.205063, -1.39131, 0.345098, 1, 0, 1,
-0.6290793, 0.02523855, -2.909498, 0.3372549, 1, 0, 1,
-0.6280317, 0.05976932, -2.317419, 0.3333333, 1, 0, 1,
-0.6193992, -0.3318066, -2.24901, 0.3254902, 1, 0, 1,
-0.61695, 0.6160836, 1.988162, 0.3215686, 1, 0, 1,
-0.6098889, 0.2676139, -1.22365, 0.3137255, 1, 0, 1,
-0.6088997, 0.1059781, -3.412109, 0.3098039, 1, 0, 1,
-0.604086, 1.2229, -1.689477, 0.3019608, 1, 0, 1,
-0.5938118, -0.7715288, -3.339035, 0.2941177, 1, 0, 1,
-0.5898701, 0.2167111, -2.071725, 0.2901961, 1, 0, 1,
-0.5883467, 0.1767582, -1.312838, 0.282353, 1, 0, 1,
-0.5828505, 0.7763877, -0.1081092, 0.2784314, 1, 0, 1,
-0.5810899, -1.121255, -4.031649, 0.2705882, 1, 0, 1,
-0.5806012, -0.07260834, -1.344522, 0.2666667, 1, 0, 1,
-0.5736508, 1.242662, -0.6559197, 0.2588235, 1, 0, 1,
-0.5729238, 0.4890236, -0.1530855, 0.254902, 1, 0, 1,
-0.5694265, -2.358403, -1.737081, 0.2470588, 1, 0, 1,
-0.56828, 0.6617184, 0.6253889, 0.2431373, 1, 0, 1,
-0.5682775, 0.2475822, -2.293789, 0.2352941, 1, 0, 1,
-0.5632249, 0.220803, 0.7133068, 0.2313726, 1, 0, 1,
-0.5591893, 0.1098188, -0.5745081, 0.2235294, 1, 0, 1,
-0.5526039, 0.7081643, 0.735707, 0.2196078, 1, 0, 1,
-0.5525154, 0.07596831, -0.5320997, 0.2117647, 1, 0, 1,
-0.5478486, 0.5327727, -0.7932024, 0.2078431, 1, 0, 1,
-0.5406896, 0.2013996, -2.603559, 0.2, 1, 0, 1,
-0.5402904, -0.5694453, -3.033577, 0.1921569, 1, 0, 1,
-0.5392555, -1.511469, -3.056157, 0.1882353, 1, 0, 1,
-0.5358658, -1.779667, -5.268452, 0.1803922, 1, 0, 1,
-0.5330696, 0.1815241, -1.749321, 0.1764706, 1, 0, 1,
-0.5308185, -0.1232488, -0.3468394, 0.1686275, 1, 0, 1,
-0.5218377, -1.144356, -3.276311, 0.1647059, 1, 0, 1,
-0.5177362, -0.07846918, -0.7946383, 0.1568628, 1, 0, 1,
-0.5176156, 1.49387, -0.3816415, 0.1529412, 1, 0, 1,
-0.5168233, -0.8770744, -0.6016433, 0.145098, 1, 0, 1,
-0.5122104, -0.4586599, -2.795279, 0.1411765, 1, 0, 1,
-0.5086371, -0.8699477, -0.7365882, 0.1333333, 1, 0, 1,
-0.5082099, -1.077728, -2.886064, 0.1294118, 1, 0, 1,
-0.5080554, -1.579084, -3.657511, 0.1215686, 1, 0, 1,
-0.5055999, -0.5495659, -1.82696, 0.1176471, 1, 0, 1,
-0.5053636, -0.3187025, -3.052707, 0.1098039, 1, 0, 1,
-0.5001546, 1.543519, -0.4906417, 0.1058824, 1, 0, 1,
-0.4974407, 0.4861233, -1.609334, 0.09803922, 1, 0, 1,
-0.496814, -0.8070894, -3.034063, 0.09019608, 1, 0, 1,
-0.4938635, 0.5788471, -1.956935, 0.08627451, 1, 0, 1,
-0.4932046, -1.64589, -1.366198, 0.07843138, 1, 0, 1,
-0.4922663, 0.7670575, 0.5127564, 0.07450981, 1, 0, 1,
-0.4919918, 0.00339739, -0.899829, 0.06666667, 1, 0, 1,
-0.4884979, -1.301665, -3.571986, 0.0627451, 1, 0, 1,
-0.4827186, -1.083984, -3.240139, 0.05490196, 1, 0, 1,
-0.4785824, -0.5958506, -2.629712, 0.05098039, 1, 0, 1,
-0.4739822, -0.8145822, -1.998636, 0.04313726, 1, 0, 1,
-0.4668632, -0.6702905, -3.350372, 0.03921569, 1, 0, 1,
-0.4650063, -2.146636, -4.172043, 0.03137255, 1, 0, 1,
-0.4633299, 2.86825, 0.7294812, 0.02745098, 1, 0, 1,
-0.4632854, -1.679164, -1.662649, 0.01960784, 1, 0, 1,
-0.4599836, -1.326699, -0.3119815, 0.01568628, 1, 0, 1,
-0.4581703, 1.139156, 0.8804482, 0.007843138, 1, 0, 1,
-0.4512034, -0.5358577, -2.544202, 0.003921569, 1, 0, 1,
-0.4501491, -0.9888674, -3.248774, 0, 1, 0.003921569, 1,
-0.4453834, -0.156835, -2.489008, 0, 1, 0.01176471, 1,
-0.4449037, 0.001481578, -1.152625, 0, 1, 0.01568628, 1,
-0.4430519, -0.5726337, -1.745506, 0, 1, 0.02352941, 1,
-0.4397932, 0.5424091, 0.01480467, 0, 1, 0.02745098, 1,
-0.4373459, -0.1341099, -1.337296, 0, 1, 0.03529412, 1,
-0.4353672, -0.2222686, -1.338992, 0, 1, 0.03921569, 1,
-0.4340359, 0.1299451, -0.966794, 0, 1, 0.04705882, 1,
-0.4229678, 0.01033594, -1.581819, 0, 1, 0.05098039, 1,
-0.4166234, 0.4612311, -1.001829, 0, 1, 0.05882353, 1,
-0.4144654, -0.5418714, -0.3353662, 0, 1, 0.0627451, 1,
-0.4060368, -0.8218331, -1.915153, 0, 1, 0.07058824, 1,
-0.4031289, 1.173491, 1.973384, 0, 1, 0.07450981, 1,
-0.3997639, 0.5933014, -1.051203, 0, 1, 0.08235294, 1,
-0.3969449, -0.5027342, -1.675953, 0, 1, 0.08627451, 1,
-0.3962054, -0.7645136, -2.186818, 0, 1, 0.09411765, 1,
-0.3918852, -0.6942719, -2.125625, 0, 1, 0.1019608, 1,
-0.3911923, 0.9205024, -1.573915, 0, 1, 0.1058824, 1,
-0.3910182, -0.5046422, -1.537666, 0, 1, 0.1137255, 1,
-0.3850845, 0.7354233, -1.589261, 0, 1, 0.1176471, 1,
-0.3836187, -1.203396, -4.838571, 0, 1, 0.1254902, 1,
-0.3774688, -0.450198, -2.861405, 0, 1, 0.1294118, 1,
-0.3753061, 1.173703, -0.9954513, 0, 1, 0.1372549, 1,
-0.3744532, 1.574435, -1.323703, 0, 1, 0.1411765, 1,
-0.3723686, -0.5918664, -0.8823612, 0, 1, 0.1490196, 1,
-0.3710691, -1.798568, -4.033241, 0, 1, 0.1529412, 1,
-0.3709878, -0.16422, -4.308807, 0, 1, 0.1607843, 1,
-0.3668455, -0.1548862, -2.780524, 0, 1, 0.1647059, 1,
-0.3662072, -0.249856, -3.000594, 0, 1, 0.172549, 1,
-0.3649543, 2.202702, -1.167292, 0, 1, 0.1764706, 1,
-0.3622648, -0.1389709, -1.262884, 0, 1, 0.1843137, 1,
-0.3560825, 0.3653705, -2.304779, 0, 1, 0.1882353, 1,
-0.350355, 1.439903, 1.510706, 0, 1, 0.1960784, 1,
-0.3502353, 1.594234, -1.208799, 0, 1, 0.2039216, 1,
-0.3482919, 0.2330329, -1.438161, 0, 1, 0.2078431, 1,
-0.3454805, -1.184165, -3.25431, 0, 1, 0.2156863, 1,
-0.3454142, -1.127145, -5.019539, 0, 1, 0.2196078, 1,
-0.3416167, 0.2368826, -0.01634465, 0, 1, 0.227451, 1,
-0.3387719, -0.09485248, -1.912614, 0, 1, 0.2313726, 1,
-0.3362311, -0.3044237, -1.898792, 0, 1, 0.2392157, 1,
-0.3345207, 0.5022107, -0.5343829, 0, 1, 0.2431373, 1,
-0.3330767, 0.04535634, -0.5842642, 0, 1, 0.2509804, 1,
-0.3330573, 2.384348, 0.793044, 0, 1, 0.254902, 1,
-0.3320041, 0.002175335, -1.860618, 0, 1, 0.2627451, 1,
-0.3303434, 1.368072, 0.3040648, 0, 1, 0.2666667, 1,
-0.3300321, -0.04455702, 0.1838731, 0, 1, 0.2745098, 1,
-0.3289859, 1.57825, -0.3500247, 0, 1, 0.2784314, 1,
-0.3274511, 0.02463404, -2.053488, 0, 1, 0.2862745, 1,
-0.3126216, -0.1153493, -1.834914, 0, 1, 0.2901961, 1,
-0.3087645, 0.9486306, -0.8564202, 0, 1, 0.2980392, 1,
-0.3077172, 1.757901, 0.03242424, 0, 1, 0.3058824, 1,
-0.2932828, -0.3356454, -1.544556, 0, 1, 0.3098039, 1,
-0.2847887, -1.342348, -3.615932, 0, 1, 0.3176471, 1,
-0.2833835, 2.226368, 1.37216, 0, 1, 0.3215686, 1,
-0.2815396, -0.532317, -2.789666, 0, 1, 0.3294118, 1,
-0.2784216, 2.221561, -2.885444, 0, 1, 0.3333333, 1,
-0.277878, -1.386737, -3.525433, 0, 1, 0.3411765, 1,
-0.2758766, 0.1299134, -1.712491, 0, 1, 0.345098, 1,
-0.2747793, -0.4599791, -0.6758249, 0, 1, 0.3529412, 1,
-0.2700035, -0.9362233, -2.628645, 0, 1, 0.3568628, 1,
-0.2694173, -0.2074458, -1.189516, 0, 1, 0.3647059, 1,
-0.2677146, -0.1625379, -2.216151, 0, 1, 0.3686275, 1,
-0.2630452, -1.580866, -4.308776, 0, 1, 0.3764706, 1,
-0.2605014, -0.8374069, -3.334265, 0, 1, 0.3803922, 1,
-0.2568287, -2.12996, -1.13851, 0, 1, 0.3882353, 1,
-0.2546936, -0.003770547, -2.237831, 0, 1, 0.3921569, 1,
-0.2505574, 0.7765028, 1.060019, 0, 1, 0.4, 1,
-0.2501883, 1.164563, 0.0938803, 0, 1, 0.4078431, 1,
-0.2493222, 0.3328461, 0.06444737, 0, 1, 0.4117647, 1,
-0.2442742, 0.7244827, -1.215612, 0, 1, 0.4196078, 1,
-0.2440014, -0.6163648, -2.895643, 0, 1, 0.4235294, 1,
-0.2413713, -1.165568, -2.939056, 0, 1, 0.4313726, 1,
-0.2411743, -1.236413, -2.058608, 0, 1, 0.4352941, 1,
-0.2405938, 0.8285941, 1.262149, 0, 1, 0.4431373, 1,
-0.2400937, -1.102751, -3.507335, 0, 1, 0.4470588, 1,
-0.2380136, -1.900276, -1.946907, 0, 1, 0.454902, 1,
-0.2325215, 1.291784, 0.01639582, 0, 1, 0.4588235, 1,
-0.2293004, 0.1270131, -0.09089167, 0, 1, 0.4666667, 1,
-0.2291024, 1.064743, 1.221527, 0, 1, 0.4705882, 1,
-0.2260346, 0.3685689, -1.019934, 0, 1, 0.4784314, 1,
-0.2209509, 0.1673385, -0.5266189, 0, 1, 0.4823529, 1,
-0.2186588, 1.569317, -1.552946, 0, 1, 0.4901961, 1,
-0.2148152, -0.2074837, -4.25597, 0, 1, 0.4941176, 1,
-0.2127095, -0.3231478, -1.948687, 0, 1, 0.5019608, 1,
-0.2114946, -0.1214977, -2.699391, 0, 1, 0.509804, 1,
-0.2036196, -1.375107, -2.516154, 0, 1, 0.5137255, 1,
-0.2035901, 0.5390389, -0.7221955, 0, 1, 0.5215687, 1,
-0.1938245, -0.7507057, -4.333955, 0, 1, 0.5254902, 1,
-0.1893967, -0.3233178, -3.599655, 0, 1, 0.5333334, 1,
-0.1872991, -1.143692, -2.330327, 0, 1, 0.5372549, 1,
-0.1834621, 0.8473365, -2.203203, 0, 1, 0.5450981, 1,
-0.1818896, 0.5259139, 1.070302, 0, 1, 0.5490196, 1,
-0.1814058, -0.5115987, -2.531075, 0, 1, 0.5568628, 1,
-0.1805219, 1.428217, -0.007110292, 0, 1, 0.5607843, 1,
-0.1771633, -1.195108, -3.793054, 0, 1, 0.5686275, 1,
-0.1740838, 1.046612, -1.67928, 0, 1, 0.572549, 1,
-0.1679038, 0.429063, -0.1713715, 0, 1, 0.5803922, 1,
-0.1673536, 0.1615449, -0.8983192, 0, 1, 0.5843138, 1,
-0.1593341, 0.7396414, 1.078329, 0, 1, 0.5921569, 1,
-0.1586759, -0.07139099, -3.149253, 0, 1, 0.5960785, 1,
-0.1548416, 0.6943124, -0.5836126, 0, 1, 0.6039216, 1,
-0.1534672, -0.7635482, -1.091851, 0, 1, 0.6117647, 1,
-0.1517452, 1.36056, -0.1784493, 0, 1, 0.6156863, 1,
-0.1494793, -1.767512, -3.405338, 0, 1, 0.6235294, 1,
-0.146348, 0.9755408, -0.7262521, 0, 1, 0.627451, 1,
-0.1437374, 0.3593734, -0.02230788, 0, 1, 0.6352941, 1,
-0.1394957, -0.9325255, -2.879674, 0, 1, 0.6392157, 1,
-0.136499, -0.8783105, -1.987534, 0, 1, 0.6470588, 1,
-0.132963, 2.603519, 0.7247657, 0, 1, 0.6509804, 1,
-0.1321332, 0.615317, -0.5824341, 0, 1, 0.6588235, 1,
-0.1313325, -0.5239144, -2.872087, 0, 1, 0.6627451, 1,
-0.1306727, 0.2860481, 0.4061109, 0, 1, 0.6705883, 1,
-0.12733, 0.2913279, -1.547334, 0, 1, 0.6745098, 1,
-0.1221657, 0.8288248, -0.2428191, 0, 1, 0.682353, 1,
-0.1215492, 1.239472, 0.498984, 0, 1, 0.6862745, 1,
-0.1210931, 0.9144734, 0.7312752, 0, 1, 0.6941177, 1,
-0.114695, 1.021393, 0.08338311, 0, 1, 0.7019608, 1,
-0.1118936, 2.896488, 1.029135, 0, 1, 0.7058824, 1,
-0.1107734, -0.6584495, -2.99271, 0, 1, 0.7137255, 1,
-0.1100947, 0.5653694, 1.143538, 0, 1, 0.7176471, 1,
-0.1069288, -0.9341753, -1.526403, 0, 1, 0.7254902, 1,
-0.1067719, 0.4063854, 0.27687, 0, 1, 0.7294118, 1,
-0.09879798, -0.8272519, -3.646011, 0, 1, 0.7372549, 1,
-0.09815103, 1.413607, -0.7302285, 0, 1, 0.7411765, 1,
-0.09568784, 0.7987871, -0.2306113, 0, 1, 0.7490196, 1,
-0.09452055, 0.1771746, 1.25015, 0, 1, 0.7529412, 1,
-0.09357208, 0.4350156, -1.876135, 0, 1, 0.7607843, 1,
-0.09085634, -0.4134357, -6.573576, 0, 1, 0.7647059, 1,
-0.09003489, 0.4168303, -0.1273835, 0, 1, 0.772549, 1,
-0.08779503, 0.6922144, 0.7039092, 0, 1, 0.7764706, 1,
-0.08669391, -0.712421, -2.056963, 0, 1, 0.7843137, 1,
-0.08427015, -0.7456616, -5.906721, 0, 1, 0.7882353, 1,
-0.08313812, 1.710373, 1.323135, 0, 1, 0.7960784, 1,
-0.07964851, 0.8863197, 0.2513216, 0, 1, 0.8039216, 1,
-0.07783408, -2.667956, -0.9630519, 0, 1, 0.8078431, 1,
-0.07561292, 0.343683, 1.109897, 0, 1, 0.8156863, 1,
-0.07420684, 1.203897, -0.9155493, 0, 1, 0.8196079, 1,
-0.07382055, -0.0305727, -1.786582, 0, 1, 0.827451, 1,
-0.07320046, -1.298491, -2.365556, 0, 1, 0.8313726, 1,
-0.07319082, 0.5865437, -1.705232, 0, 1, 0.8392157, 1,
-0.07089282, 1.019293, 1.967059, 0, 1, 0.8431373, 1,
-0.0690114, -0.1613368, -0.7268631, 0, 1, 0.8509804, 1,
-0.06895758, -1.9847, -1.999844, 0, 1, 0.854902, 1,
-0.0671066, 0.755847, -0.2287028, 0, 1, 0.8627451, 1,
-0.0656893, -0.591459, -4.16194, 0, 1, 0.8666667, 1,
-0.06430923, -0.4920141, -2.764261, 0, 1, 0.8745098, 1,
-0.06137475, -2.063257, -2.169309, 0, 1, 0.8784314, 1,
-0.06133804, -0.2948963, -2.818058, 0, 1, 0.8862745, 1,
-0.05893332, 2.034542, 1.750892, 0, 1, 0.8901961, 1,
-0.04747972, -1.418894, -4.711666, 0, 1, 0.8980392, 1,
-0.04455678, -0.3315157, -3.483339, 0, 1, 0.9058824, 1,
-0.04428544, -2.607389, -5.716343, 0, 1, 0.9098039, 1,
-0.04226829, 1.293309, 0.04561254, 0, 1, 0.9176471, 1,
-0.03886984, 0.6803872, -0.9456944, 0, 1, 0.9215686, 1,
-0.03439446, -0.9858584, -3.728344, 0, 1, 0.9294118, 1,
-0.03226377, 0.4751321, 0.3485626, 0, 1, 0.9333333, 1,
-0.03226119, 0.2092317, 0.447614, 0, 1, 0.9411765, 1,
-0.03219203, -0.1980482, -2.724451, 0, 1, 0.945098, 1,
-0.03075831, 1.333408, -1.203286, 0, 1, 0.9529412, 1,
-0.02923848, -1.228061, -2.198909, 0, 1, 0.9568627, 1,
-0.02246301, 1.11293, 0.5319998, 0, 1, 0.9647059, 1,
-0.02077983, -0.7565486, -1.018914, 0, 1, 0.9686275, 1,
-0.01716213, -0.7691879, -3.049773, 0, 1, 0.9764706, 1,
-0.01706697, -1.051678, -3.109629, 0, 1, 0.9803922, 1,
-0.01074874, -0.6639482, -2.119241, 0, 1, 0.9882353, 1,
-0.009758821, -0.0326461, -2.302673, 0, 1, 0.9921569, 1,
-0.006651397, 0.270605, -0.1942616, 0, 1, 1, 1,
-0.004808098, 0.8178779, -0.9673754, 0, 0.9921569, 1, 1,
-0.001758242, 0.07230447, -1.850398, 0, 0.9882353, 1, 1,
0.004587238, 0.08523072, 0.5843914, 0, 0.9803922, 1, 1,
0.006596188, -2.633705, 4.599988, 0, 0.9764706, 1, 1,
0.01037403, 0.2442757, -1.521069, 0, 0.9686275, 1, 1,
0.01037979, 0.1123278, -0.2763647, 0, 0.9647059, 1, 1,
0.01195556, 1.373906, 0.1915807, 0, 0.9568627, 1, 1,
0.02452555, -2.162253, 3.251046, 0, 0.9529412, 1, 1,
0.03056093, -0.4919067, 3.898601, 0, 0.945098, 1, 1,
0.03941516, 0.2859301, 2.253814, 0, 0.9411765, 1, 1,
0.04197737, -0.4008867, 1.994394, 0, 0.9333333, 1, 1,
0.04260283, 0.7535109, -0.2770589, 0, 0.9294118, 1, 1,
0.04374307, -0.4468325, 2.271259, 0, 0.9215686, 1, 1,
0.04698692, 0.02308124, 0.2433735, 0, 0.9176471, 1, 1,
0.04705632, -0.3476348, 3.340516, 0, 0.9098039, 1, 1,
0.04788423, -2.219859, 4.053422, 0, 0.9058824, 1, 1,
0.0505238, -0.5993159, 2.28928, 0, 0.8980392, 1, 1,
0.05072814, -1.456594, 2.508306, 0, 0.8901961, 1, 1,
0.05082301, 0.09647774, 0.2786802, 0, 0.8862745, 1, 1,
0.05537039, 1.222433, -0.8740031, 0, 0.8784314, 1, 1,
0.0555659, 0.3653785, 0.185016, 0, 0.8745098, 1, 1,
0.06073993, -1.584457, 3.394928, 0, 0.8666667, 1, 1,
0.06326737, -1.83655, 2.762381, 0, 0.8627451, 1, 1,
0.06361524, -1.537334, 3.471657, 0, 0.854902, 1, 1,
0.06430092, -1.686008, 4.504366, 0, 0.8509804, 1, 1,
0.06726287, -0.4750371, 1.561218, 0, 0.8431373, 1, 1,
0.06767902, -0.4897005, 4.100306, 0, 0.8392157, 1, 1,
0.07003459, 0.2168865, 0.06445906, 0, 0.8313726, 1, 1,
0.07029638, 0.2234239, -0.8310189, 0, 0.827451, 1, 1,
0.07102301, 0.2037765, 1.241184, 0, 0.8196079, 1, 1,
0.07528611, 0.1836284, 0.5518346, 0, 0.8156863, 1, 1,
0.07592732, -0.4711541, 4.986045, 0, 0.8078431, 1, 1,
0.07672887, -0.1125799, 2.73906, 0, 0.8039216, 1, 1,
0.07856823, 0.1040207, 2.201303, 0, 0.7960784, 1, 1,
0.08027329, 2.682495, 0.3668408, 0, 0.7882353, 1, 1,
0.08327672, 0.1626813, -1.578551, 0, 0.7843137, 1, 1,
0.08350779, 2.646111, 0.4775962, 0, 0.7764706, 1, 1,
0.09007268, -0.3611355, 1.567702, 0, 0.772549, 1, 1,
0.09075019, 0.0974627, 1.183129, 0, 0.7647059, 1, 1,
0.09923472, -1.486537, 2.939468, 0, 0.7607843, 1, 1,
0.09948183, -1.677199, 2.87315, 0, 0.7529412, 1, 1,
0.1016681, 0.7526555, 0.01763216, 0, 0.7490196, 1, 1,
0.104832, -1.391734, 4.074643, 0, 0.7411765, 1, 1,
0.1052454, 0.1510472, -1.708303, 0, 0.7372549, 1, 1,
0.1056145, 0.7670643, 0.1292068, 0, 0.7294118, 1, 1,
0.1132966, -0.6341582, 3.989537, 0, 0.7254902, 1, 1,
0.1177661, 0.5323821, -0.1241324, 0, 0.7176471, 1, 1,
0.1201539, -0.2789761, 5.023176, 0, 0.7137255, 1, 1,
0.1206946, -0.650813, 4.017414, 0, 0.7058824, 1, 1,
0.1238118, -0.5461763, 2.107147, 0, 0.6980392, 1, 1,
0.1449884, -0.4892894, 2.155421, 0, 0.6941177, 1, 1,
0.1482335, -0.4287727, 1.861886, 0, 0.6862745, 1, 1,
0.1517708, 2.374182, 1.577382, 0, 0.682353, 1, 1,
0.1525934, -0.3363794, 0.796473, 0, 0.6745098, 1, 1,
0.152695, -1.597232, 3.280192, 0, 0.6705883, 1, 1,
0.1536303, 0.157083, 0.4426959, 0, 0.6627451, 1, 1,
0.1538547, -0.3157551, 2.504153, 0, 0.6588235, 1, 1,
0.1558306, 1.296532, -0.7758496, 0, 0.6509804, 1, 1,
0.157116, 1.001998, 0.7906504, 0, 0.6470588, 1, 1,
0.1638733, 2.903987, -0.3331354, 0, 0.6392157, 1, 1,
0.1650461, -0.4974877, 3.216949, 0, 0.6352941, 1, 1,
0.1680717, -1.110651, 2.081568, 0, 0.627451, 1, 1,
0.1706946, 0.415465, 0.3366231, 0, 0.6235294, 1, 1,
0.1730783, -2.19355, 3.140375, 0, 0.6156863, 1, 1,
0.174078, -0.824673, 2.802593, 0, 0.6117647, 1, 1,
0.1872894, 1.191967, -0.532144, 0, 0.6039216, 1, 1,
0.1908155, 0.1399452, 1.014641, 0, 0.5960785, 1, 1,
0.1910441, -1.945993, 2.578502, 0, 0.5921569, 1, 1,
0.194053, -0.3922817, 3.16704, 0, 0.5843138, 1, 1,
0.1978544, 0.4489594, 1.435891, 0, 0.5803922, 1, 1,
0.1991017, -1.343933, 2.192523, 0, 0.572549, 1, 1,
0.1995794, -0.5545523, 3.536054, 0, 0.5686275, 1, 1,
0.2021183, 0.05114764, 1.611212, 0, 0.5607843, 1, 1,
0.2090922, 0.2504806, 1.107318, 0, 0.5568628, 1, 1,
0.2108528, -0.3744739, 3.329028, 0, 0.5490196, 1, 1,
0.2141568, 0.4819229, -0.36186, 0, 0.5450981, 1, 1,
0.2145114, -0.4800664, 1.692519, 0, 0.5372549, 1, 1,
0.2214885, 0.158112, 0.141273, 0, 0.5333334, 1, 1,
0.2286756, 0.6367252, 2.374207, 0, 0.5254902, 1, 1,
0.2343119, -0.2877494, 2.61647, 0, 0.5215687, 1, 1,
0.246693, -1.085936, 3.443916, 0, 0.5137255, 1, 1,
0.2472512, 1.374781, -0.5834259, 0, 0.509804, 1, 1,
0.2496184, -1.655426, 2.615293, 0, 0.5019608, 1, 1,
0.2502753, -1.427831, 2.672163, 0, 0.4941176, 1, 1,
0.2512866, 0.6953593, 0.5701305, 0, 0.4901961, 1, 1,
0.2578221, 0.965426, 0.3091186, 0, 0.4823529, 1, 1,
0.2582245, 0.4102379, -0.6470932, 0, 0.4784314, 1, 1,
0.2591732, -0.6968973, 3.662669, 0, 0.4705882, 1, 1,
0.2610932, -0.7763141, 1.147258, 0, 0.4666667, 1, 1,
0.263451, -0.2562763, 2.801773, 0, 0.4588235, 1, 1,
0.2645831, 0.3527588, -0.9610918, 0, 0.454902, 1, 1,
0.2659809, 0.6243017, -0.6958741, 0, 0.4470588, 1, 1,
0.2680245, -0.8604543, 3.367049, 0, 0.4431373, 1, 1,
0.268678, -1.323382, 3.544685, 0, 0.4352941, 1, 1,
0.2699057, 0.2097873, 1.301737, 0, 0.4313726, 1, 1,
0.2710844, 1.902174, 0.9567195, 0, 0.4235294, 1, 1,
0.2718619, 0.5307074, -0.2705788, 0, 0.4196078, 1, 1,
0.2738084, -0.3089383, 2.07747, 0, 0.4117647, 1, 1,
0.2744158, 1.745267, -0.09457041, 0, 0.4078431, 1, 1,
0.2793808, 0.2533479, 2.400508, 0, 0.4, 1, 1,
0.283613, 0.6374329, -1.117455, 0, 0.3921569, 1, 1,
0.2848451, 0.9290245, -0.9080596, 0, 0.3882353, 1, 1,
0.2902364, -0.2057874, 1.643661, 0, 0.3803922, 1, 1,
0.2914064, -0.3279701, 3.311197, 0, 0.3764706, 1, 1,
0.2952614, -0.387065, 0.9015145, 0, 0.3686275, 1, 1,
0.29568, 0.8214875, -0.4545475, 0, 0.3647059, 1, 1,
0.3010533, -1.702862, 3.892223, 0, 0.3568628, 1, 1,
0.3014197, -0.8414025, 3.417879, 0, 0.3529412, 1, 1,
0.302141, -0.287333, 2.986913, 0, 0.345098, 1, 1,
0.3057206, -0.6651982, 2.437864, 0, 0.3411765, 1, 1,
0.3088556, -0.6694931, 1.922345, 0, 0.3333333, 1, 1,
0.3088985, 0.5899568, 1.066977, 0, 0.3294118, 1, 1,
0.3146011, -0.2513038, 3.292528, 0, 0.3215686, 1, 1,
0.3166677, -0.5946609, 3.634449, 0, 0.3176471, 1, 1,
0.3195502, -1.240094, 3.363617, 0, 0.3098039, 1, 1,
0.3201019, -0.892715, 1.49831, 0, 0.3058824, 1, 1,
0.3214568, 0.02362838, 1.809778, 0, 0.2980392, 1, 1,
0.3274923, 0.3956714, 1.032085, 0, 0.2901961, 1, 1,
0.3276937, 0.8957404, 0.1460559, 0, 0.2862745, 1, 1,
0.3278904, 0.5610773, 0.808699, 0, 0.2784314, 1, 1,
0.3296511, 1.52665, 1.164945, 0, 0.2745098, 1, 1,
0.3403254, 0.4779446, 1.770229, 0, 0.2666667, 1, 1,
0.3408653, 0.1004741, 1.804256, 0, 0.2627451, 1, 1,
0.3427393, 0.4088483, 1.488195, 0, 0.254902, 1, 1,
0.3438478, -1.648904, 3.139477, 0, 0.2509804, 1, 1,
0.3461947, -0.6057308, 2.941119, 0, 0.2431373, 1, 1,
0.3501876, -0.3394091, -0.2239732, 0, 0.2392157, 1, 1,
0.3506175, -1.375768, 1.5368, 0, 0.2313726, 1, 1,
0.3554953, -0.008954413, 1.304319, 0, 0.227451, 1, 1,
0.3620999, 0.4743965, 0.7698569, 0, 0.2196078, 1, 1,
0.3626927, 0.8706421, 1.150894, 0, 0.2156863, 1, 1,
0.3634343, 0.1334729, 0.7740002, 0, 0.2078431, 1, 1,
0.3661622, -0.2326737, 1.708923, 0, 0.2039216, 1, 1,
0.3676853, 0.2534761, 0.2242521, 0, 0.1960784, 1, 1,
0.3694853, 0.8591323, -1.207322, 0, 0.1882353, 1, 1,
0.3749117, -1.700681, 2.058733, 0, 0.1843137, 1, 1,
0.3935755, 0.9790913, -1.384826, 0, 0.1764706, 1, 1,
0.3946549, -0.008999422, 1.202317, 0, 0.172549, 1, 1,
0.3952028, 0.1465166, 1.738058, 0, 0.1647059, 1, 1,
0.3959731, 1.923067, 0.9612847, 0, 0.1607843, 1, 1,
0.398706, -1.467955, 2.775584, 0, 0.1529412, 1, 1,
0.3987124, 0.5610337, 1.961119, 0, 0.1490196, 1, 1,
0.4016145, -0.473206, 0.4584937, 0, 0.1411765, 1, 1,
0.4032251, 1.68967, -0.5207065, 0, 0.1372549, 1, 1,
0.4034339, 0.7093601, 0.1403713, 0, 0.1294118, 1, 1,
0.4046607, -0.02803291, 1.514158, 0, 0.1254902, 1, 1,
0.4098904, 0.4218405, 1.46911, 0, 0.1176471, 1, 1,
0.4100316, -0.7055263, 2.678762, 0, 0.1137255, 1, 1,
0.415071, -0.7387918, 4.394621, 0, 0.1058824, 1, 1,
0.4174697, -0.5775145, 2.734541, 0, 0.09803922, 1, 1,
0.4185973, 2.026, 0.7664705, 0, 0.09411765, 1, 1,
0.4195886, 0.153792, 0.3485691, 0, 0.08627451, 1, 1,
0.4210706, 0.1565441, 0.8185775, 0, 0.08235294, 1, 1,
0.4248799, 0.8821582, -1.588048, 0, 0.07450981, 1, 1,
0.4273033, -0.8237097, 4.226559, 0, 0.07058824, 1, 1,
0.4276941, 0.3419862, -0.8241399, 0, 0.0627451, 1, 1,
0.4324972, -0.2845412, 1.35328, 0, 0.05882353, 1, 1,
0.4379209, -0.2263924, 2.101754, 0, 0.05098039, 1, 1,
0.4414304, 0.07535908, 0.795362, 0, 0.04705882, 1, 1,
0.4419431, -0.5565116, 3.854415, 0, 0.03921569, 1, 1,
0.4423877, 0.8202368, 2.334451, 0, 0.03529412, 1, 1,
0.4477101, -1.665379, 1.330466, 0, 0.02745098, 1, 1,
0.448183, 0.8805384, -0.7023513, 0, 0.02352941, 1, 1,
0.4491106, 1.164967, 0.03922061, 0, 0.01568628, 1, 1,
0.4552381, -0.2689354, 0.7526312, 0, 0.01176471, 1, 1,
0.459758, -0.7149037, 1.676102, 0, 0.003921569, 1, 1,
0.4609837, 1.749463, 0.0754941, 0.003921569, 0, 1, 1,
0.4706915, 0.5805846, -0.06496231, 0.007843138, 0, 1, 1,
0.4761145, -0.2881736, 2.116487, 0.01568628, 0, 1, 1,
0.4796605, -0.530311, 1.173768, 0.01960784, 0, 1, 1,
0.4798088, -1.378274, 1.214318, 0.02745098, 0, 1, 1,
0.4805284, 0.4539992, 1.466308, 0.03137255, 0, 1, 1,
0.4816254, 1.307722, 2.470472, 0.03921569, 0, 1, 1,
0.484309, -0.8438837, 3.003358, 0.04313726, 0, 1, 1,
0.4906452, -0.2577359, 3.217793, 0.05098039, 0, 1, 1,
0.4911125, 0.5565261, 0.2089969, 0.05490196, 0, 1, 1,
0.492324, 0.8980164, -0.1729237, 0.0627451, 0, 1, 1,
0.4956861, -1.146459, 3.09531, 0.06666667, 0, 1, 1,
0.5013318, -0.09539245, 2.632275, 0.07450981, 0, 1, 1,
0.5018969, 0.1434943, 0.985731, 0.07843138, 0, 1, 1,
0.5027161, 0.9420376, -0.5800422, 0.08627451, 0, 1, 1,
0.5104289, 1.129229, 1.28793, 0.09019608, 0, 1, 1,
0.5111344, 0.4782408, 0.3948486, 0.09803922, 0, 1, 1,
0.5166434, 1.427131, -0.6136584, 0.1058824, 0, 1, 1,
0.5172925, 1.673314, 0.8232109, 0.1098039, 0, 1, 1,
0.5204429, -1.441204, 3.632119, 0.1176471, 0, 1, 1,
0.5215176, -0.006507828, 2.055984, 0.1215686, 0, 1, 1,
0.5237876, -0.02384684, 0.7978109, 0.1294118, 0, 1, 1,
0.5248857, -0.284428, 1.889963, 0.1333333, 0, 1, 1,
0.5251777, 0.3540385, 0.2376396, 0.1411765, 0, 1, 1,
0.5266692, 0.7343706, -1.024329, 0.145098, 0, 1, 1,
0.5296377, 0.6192933, -0.26681, 0.1529412, 0, 1, 1,
0.530524, -0.3868724, 3.210429, 0.1568628, 0, 1, 1,
0.5328236, 0.2668086, 0.35017, 0.1647059, 0, 1, 1,
0.5330257, 2.121497, 0.03356729, 0.1686275, 0, 1, 1,
0.5336332, -1.382396, 2.754174, 0.1764706, 0, 1, 1,
0.5368691, -2.120379, 2.604941, 0.1803922, 0, 1, 1,
0.5373769, -1.050376, 5.294626, 0.1882353, 0, 1, 1,
0.5407298, 0.5525994, 0.3004268, 0.1921569, 0, 1, 1,
0.5420559, 1.370195, -0.6733666, 0.2, 0, 1, 1,
0.543181, -0.6442726, 2.132206, 0.2078431, 0, 1, 1,
0.5501296, 0.5557903, 1.317039, 0.2117647, 0, 1, 1,
0.5546134, 0.8256003, 1.366053, 0.2196078, 0, 1, 1,
0.5581535, 1.067664, -1.469858, 0.2235294, 0, 1, 1,
0.5639191, -0.265301, 0.518891, 0.2313726, 0, 1, 1,
0.5693036, 0.03661322, 2.584948, 0.2352941, 0, 1, 1,
0.5709142, 0.08750921, 2.038025, 0.2431373, 0, 1, 1,
0.5737965, -1.369029, 3.190114, 0.2470588, 0, 1, 1,
0.5738571, -1.171153, 2.496838, 0.254902, 0, 1, 1,
0.5739984, -1.886071, 3.455399, 0.2588235, 0, 1, 1,
0.5746399, 0.4186173, 1.081391, 0.2666667, 0, 1, 1,
0.5781264, 0.149652, 2.618217, 0.2705882, 0, 1, 1,
0.583003, -0.7776963, 3.015624, 0.2784314, 0, 1, 1,
0.583519, 0.4496953, 0.54202, 0.282353, 0, 1, 1,
0.5859697, -0.4408451, 1.389685, 0.2901961, 0, 1, 1,
0.586942, 1.128673, 0.4999878, 0.2941177, 0, 1, 1,
0.5907678, -0.6895688, 1.551669, 0.3019608, 0, 1, 1,
0.5972552, 0.6846474, 0.007361392, 0.3098039, 0, 1, 1,
0.6049815, -1.071209, 3.037698, 0.3137255, 0, 1, 1,
0.6090019, -3.436502, 0.8377439, 0.3215686, 0, 1, 1,
0.6106161, -0.1311872, 1.817101, 0.3254902, 0, 1, 1,
0.6115385, 0.5769045, 0.4935501, 0.3333333, 0, 1, 1,
0.6145877, -0.5987134, 3.090948, 0.3372549, 0, 1, 1,
0.6219495, 1.072692, 1.169851, 0.345098, 0, 1, 1,
0.6223118, -0.9502148, 4.719047, 0.3490196, 0, 1, 1,
0.6250114, -0.7260244, 2.501507, 0.3568628, 0, 1, 1,
0.62602, -0.478796, 2.727641, 0.3607843, 0, 1, 1,
0.6289584, -0.3913158, 3.161268, 0.3686275, 0, 1, 1,
0.6313179, -1.962243, 2.357313, 0.372549, 0, 1, 1,
0.6343001, 0.8222969, 0.5530692, 0.3803922, 0, 1, 1,
0.6405935, 0.3388517, 1.144825, 0.3843137, 0, 1, 1,
0.6423849, -0.5211787, 1.308223, 0.3921569, 0, 1, 1,
0.6438151, -0.2841315, 3.093776, 0.3960784, 0, 1, 1,
0.6494414, 0.7342932, 3.009336, 0.4039216, 0, 1, 1,
0.6502343, 0.5241851, 1.658773, 0.4117647, 0, 1, 1,
0.6511555, -0.1715454, 2.090452, 0.4156863, 0, 1, 1,
0.6560956, 0.1997439, 0.827762, 0.4235294, 0, 1, 1,
0.6723614, 0.1759819, 2.29794, 0.427451, 0, 1, 1,
0.6729771, -1.213911, 2.911638, 0.4352941, 0, 1, 1,
0.6732869, 1.612867, -0.8888171, 0.4392157, 0, 1, 1,
0.6763444, -0.0781228, 0.4422319, 0.4470588, 0, 1, 1,
0.6794142, -0.1629422, 2.058783, 0.4509804, 0, 1, 1,
0.6805148, -0.6414563, 3.190297, 0.4588235, 0, 1, 1,
0.682152, 1.492461, 1.031345, 0.4627451, 0, 1, 1,
0.6890289, 1.214102, -1.324581, 0.4705882, 0, 1, 1,
0.6910017, 0.5609565, 1.721164, 0.4745098, 0, 1, 1,
0.6959792, 0.6489984, -0.5529771, 0.4823529, 0, 1, 1,
0.7012909, 0.08644911, 1.252964, 0.4862745, 0, 1, 1,
0.7057524, -0.3411624, 0.822849, 0.4941176, 0, 1, 1,
0.7076212, 0.9782969, -1.227305, 0.5019608, 0, 1, 1,
0.7087681, 0.9600309, 0.6496235, 0.5058824, 0, 1, 1,
0.7105516, -1.085675, 2.081409, 0.5137255, 0, 1, 1,
0.7110956, -0.6266102, 3.782157, 0.5176471, 0, 1, 1,
0.7183553, -1.036738, 1.466067, 0.5254902, 0, 1, 1,
0.7198659, 0.5007057, -0.7036251, 0.5294118, 0, 1, 1,
0.7314084, -0.693227, 1.853373, 0.5372549, 0, 1, 1,
0.7328541, -0.207192, 0.8368647, 0.5411765, 0, 1, 1,
0.7338734, -0.1314638, 2.293942, 0.5490196, 0, 1, 1,
0.7385149, -1.216872, 3.80656, 0.5529412, 0, 1, 1,
0.7390223, 0.917013, -0.1322906, 0.5607843, 0, 1, 1,
0.7406463, 1.228775, 0.9431923, 0.5647059, 0, 1, 1,
0.7426953, 0.8080115, 1.237707, 0.572549, 0, 1, 1,
0.7443153, 0.5694349, 0.6174217, 0.5764706, 0, 1, 1,
0.7461857, 0.1472127, 1.979321, 0.5843138, 0, 1, 1,
0.750459, 0.07749555, 0.2341833, 0.5882353, 0, 1, 1,
0.7520837, 0.09154984, 2.376123, 0.5960785, 0, 1, 1,
0.7616546, -0.1554017, 1.511291, 0.6039216, 0, 1, 1,
0.7663745, -0.7059314, 3.087256, 0.6078432, 0, 1, 1,
0.7668318, 0.50202, 1.676678, 0.6156863, 0, 1, 1,
0.7671097, -0.9493495, 2.955818, 0.6196079, 0, 1, 1,
0.7687864, 0.1255356, 1.95977, 0.627451, 0, 1, 1,
0.7710206, 0.5144486, 0.830763, 0.6313726, 0, 1, 1,
0.779661, 0.5382412, 2.218568, 0.6392157, 0, 1, 1,
0.783143, 0.7204642, -0.8661322, 0.6431373, 0, 1, 1,
0.7875079, 0.3104846, -0.9465079, 0.6509804, 0, 1, 1,
0.7887484, -0.5547578, 2.408075, 0.654902, 0, 1, 1,
0.7898073, 1.602359, -0.1491861, 0.6627451, 0, 1, 1,
0.7904877, -0.538379, 2.589249, 0.6666667, 0, 1, 1,
0.7912949, 0.159841, 3.778626, 0.6745098, 0, 1, 1,
0.7924873, 0.4751816, 0.2989332, 0.6784314, 0, 1, 1,
0.8016551, 1.987012, 2.442127, 0.6862745, 0, 1, 1,
0.8142902, 0.05961053, 2.246536, 0.6901961, 0, 1, 1,
0.8188223, 0.3496309, 1.479923, 0.6980392, 0, 1, 1,
0.8194665, -0.2824602, 1.845568, 0.7058824, 0, 1, 1,
0.8280576, -0.1979967, 2.886197, 0.7098039, 0, 1, 1,
0.8335106, -1.1191, 1.651125, 0.7176471, 0, 1, 1,
0.8340013, -0.1357388, 3.510561, 0.7215686, 0, 1, 1,
0.8404955, 0.1583488, -1.27484, 0.7294118, 0, 1, 1,
0.8434235, -0.1228069, 2.553765, 0.7333333, 0, 1, 1,
0.8443578, -0.3506744, 3.175657, 0.7411765, 0, 1, 1,
0.8459707, -0.02904319, 1.617695, 0.7450981, 0, 1, 1,
0.8526479, -0.8143843, 1.599034, 0.7529412, 0, 1, 1,
0.8587086, 0.4672159, 2.282436, 0.7568628, 0, 1, 1,
0.8636081, -0.2454886, 1.070146, 0.7647059, 0, 1, 1,
0.8669932, 0.6335194, 1.269054, 0.7686275, 0, 1, 1,
0.86866, 1.648781, 0.8479405, 0.7764706, 0, 1, 1,
0.8690863, -0.5666353, 1.988211, 0.7803922, 0, 1, 1,
0.8808643, -0.091982, -0.419791, 0.7882353, 0, 1, 1,
0.8822054, -1.7051, 2.214896, 0.7921569, 0, 1, 1,
0.8831976, 1.624435, 1.486145, 0.8, 0, 1, 1,
0.8877762, 0.6569891, 0.4448527, 0.8078431, 0, 1, 1,
0.8898739, -0.06654321, 1.141116, 0.8117647, 0, 1, 1,
0.8939963, -0.2496511, 2.371821, 0.8196079, 0, 1, 1,
0.8979273, -0.08783627, 1.223141, 0.8235294, 0, 1, 1,
0.9095259, -1.471405, 3.181355, 0.8313726, 0, 1, 1,
0.9120479, -0.819208, 0.9988364, 0.8352941, 0, 1, 1,
0.9151308, 0.6795456, 0.658703, 0.8431373, 0, 1, 1,
0.9230245, -1.113629, 1.509104, 0.8470588, 0, 1, 1,
0.9304459, 0.6745464, 0.02470047, 0.854902, 0, 1, 1,
0.9326501, 1.358494, 1.744594, 0.8588235, 0, 1, 1,
0.9339356, 1.002344, 0.9639338, 0.8666667, 0, 1, 1,
0.9390725, -1.161861, 1.851194, 0.8705882, 0, 1, 1,
0.9436562, 0.5708691, 0.284546, 0.8784314, 0, 1, 1,
0.9441618, 1.78935, 0.458774, 0.8823529, 0, 1, 1,
0.9517469, -0.09542157, 1.366358, 0.8901961, 0, 1, 1,
0.9532519, -0.7792597, 2.75203, 0.8941177, 0, 1, 1,
0.9561241, 0.02636706, 2.533043, 0.9019608, 0, 1, 1,
0.9636725, 0.8674643, 2.160738, 0.9098039, 0, 1, 1,
0.9662022, -0.3436607, 0.5522671, 0.9137255, 0, 1, 1,
0.9679586, 0.8274291, 1.652259, 0.9215686, 0, 1, 1,
0.9717342, -0.4202922, 2.306883, 0.9254902, 0, 1, 1,
0.9762197, 0.6345531, 1.733007, 0.9333333, 0, 1, 1,
0.9763826, 2.049235, -0.4912682, 0.9372549, 0, 1, 1,
0.9773064, -1.829184, 2.999866, 0.945098, 0, 1, 1,
0.9846618, -0.7127936, 2.858837, 0.9490196, 0, 1, 1,
0.9927893, 0.2866352, -0.6287143, 0.9568627, 0, 1, 1,
0.9932489, -0.3259137, 2.570463, 0.9607843, 0, 1, 1,
0.9947464, 0.9004344, -0.4743109, 0.9686275, 0, 1, 1,
1.002245, -0.5926666, 2.516991, 0.972549, 0, 1, 1,
1.004958, -0.05004057, 0.3421846, 0.9803922, 0, 1, 1,
1.010881, 0.980871, 0.2687052, 0.9843137, 0, 1, 1,
1.012352, -0.9629628, 1.393924, 0.9921569, 0, 1, 1,
1.013713, 0.1189124, 2.537284, 0.9960784, 0, 1, 1,
1.016203, 0.04142325, 0.4086015, 1, 0, 0.9960784, 1,
1.019709, -0.7730917, 2.473618, 1, 0, 0.9882353, 1,
1.022373, -1.002146, 2.316462, 1, 0, 0.9843137, 1,
1.027746, -0.06594981, 1.919512, 1, 0, 0.9764706, 1,
1.031012, -0.4458019, 1.332224, 1, 0, 0.972549, 1,
1.035372, 2.027633, -0.2531483, 1, 0, 0.9647059, 1,
1.036279, -0.325311, 1.809577, 1, 0, 0.9607843, 1,
1.050028, 0.4877063, 0.3944533, 1, 0, 0.9529412, 1,
1.067088, 0.7864243, 0.4330461, 1, 0, 0.9490196, 1,
1.07102, -0.1738382, 1.940663, 1, 0, 0.9411765, 1,
1.0715, -0.3515159, 0.22265, 1, 0, 0.9372549, 1,
1.072185, -0.9236386, 1.220257, 1, 0, 0.9294118, 1,
1.082616, -0.9758241, 0.4597615, 1, 0, 0.9254902, 1,
1.083138, 1.083984, 1.447375, 1, 0, 0.9176471, 1,
1.089425, -0.5245749, 0.8788751, 1, 0, 0.9137255, 1,
1.091789, 0.2349795, 0.294754, 1, 0, 0.9058824, 1,
1.092061, -1.691456, 2.584566, 1, 0, 0.9019608, 1,
1.092831, 0.002930347, 1.41639, 1, 0, 0.8941177, 1,
1.09779, 0.8128194, 0.9182926, 1, 0, 0.8862745, 1,
1.101272, 0.8127058, -0.2167057, 1, 0, 0.8823529, 1,
1.105778, 1.31173, -1.070187, 1, 0, 0.8745098, 1,
1.114922, -0.1841646, -0.7005939, 1, 0, 0.8705882, 1,
1.11587, 1.124965, 1.285474, 1, 0, 0.8627451, 1,
1.11927, -1.03138, 1.914075, 1, 0, 0.8588235, 1,
1.120432, 0.1787572, 2.786579, 1, 0, 0.8509804, 1,
1.123428, -0.3227205, 1.794165, 1, 0, 0.8470588, 1,
1.132188, 0.7063746, 1.992632, 1, 0, 0.8392157, 1,
1.134391, 0.6007874, 0.4219401, 1, 0, 0.8352941, 1,
1.146045, -0.341729, 1.768884, 1, 0, 0.827451, 1,
1.156347, -1.275158, 3.324733, 1, 0, 0.8235294, 1,
1.164646, -0.1088964, 1.425745, 1, 0, 0.8156863, 1,
1.172078, -0.7649165, 2.05912, 1, 0, 0.8117647, 1,
1.182073, -0.7070335, 2.804316, 1, 0, 0.8039216, 1,
1.191937, 0.7250032, -0.2331196, 1, 0, 0.7960784, 1,
1.197347, -1.596992, 0.6351637, 1, 0, 0.7921569, 1,
1.198023, 0.6824871, 1.065788, 1, 0, 0.7843137, 1,
1.199467, 0.011948, 2.187253, 1, 0, 0.7803922, 1,
1.205305, 2.511995, 1.209776, 1, 0, 0.772549, 1,
1.208566, 0.2730279, -0.3478768, 1, 0, 0.7686275, 1,
1.212244, 0.8568656, 0.4973409, 1, 0, 0.7607843, 1,
1.215525, -0.02790698, 1.85794, 1, 0, 0.7568628, 1,
1.216809, -0.702644, 0.09696709, 1, 0, 0.7490196, 1,
1.223539, 1.658201, 0.2779265, 1, 0, 0.7450981, 1,
1.224415, 0.264986, 1.333371, 1, 0, 0.7372549, 1,
1.227282, 0.5866939, 1.58883, 1, 0, 0.7333333, 1,
1.24467, -1.315643, 3.801286, 1, 0, 0.7254902, 1,
1.252109, -0.6005593, 3.543198, 1, 0, 0.7215686, 1,
1.266811, 1.530732, 0.7315336, 1, 0, 0.7137255, 1,
1.270564, -0.2057327, 1.030466, 1, 0, 0.7098039, 1,
1.295352, -0.4455215, 2.035144, 1, 0, 0.7019608, 1,
1.295831, -1.713595, 2.878531, 1, 0, 0.6941177, 1,
1.305311, -0.1527399, 0.1944135, 1, 0, 0.6901961, 1,
1.318878, 0.3433133, 1.598717, 1, 0, 0.682353, 1,
1.320099, 1.009591, 0.4217036, 1, 0, 0.6784314, 1,
1.326579, -0.168403, 1.577764, 1, 0, 0.6705883, 1,
1.328627, 1.162874, 0.2739634, 1, 0, 0.6666667, 1,
1.340545, -1.274816, 1.268803, 1, 0, 0.6588235, 1,
1.35438, -0.7276394, 1.901942, 1, 0, 0.654902, 1,
1.354527, -1.315753, 2.726907, 1, 0, 0.6470588, 1,
1.357654, -0.3634919, 2.115955, 1, 0, 0.6431373, 1,
1.358151, 0.8398712, 1.01329, 1, 0, 0.6352941, 1,
1.35866, -0.6622614, 2.09329, 1, 0, 0.6313726, 1,
1.368118, -0.5517253, 2.683477, 1, 0, 0.6235294, 1,
1.369628, -1.309616, 2.846709, 1, 0, 0.6196079, 1,
1.376491, -0.2103523, 1.433103, 1, 0, 0.6117647, 1,
1.378195, -0.3210742, 2.412573, 1, 0, 0.6078432, 1,
1.380587, 0.07406593, 1.773219, 1, 0, 0.6, 1,
1.383019, -0.3528395, 2.420133, 1, 0, 0.5921569, 1,
1.387198, -0.6291127, 2.677207, 1, 0, 0.5882353, 1,
1.392747, 0.5557633, 1.104752, 1, 0, 0.5803922, 1,
1.39319, 0.1068623, 1.30226, 1, 0, 0.5764706, 1,
1.394957, 1.493413, 0.4287049, 1, 0, 0.5686275, 1,
1.398577, -1.481537, 2.607952, 1, 0, 0.5647059, 1,
1.399642, -0.2245613, 1.537819, 1, 0, 0.5568628, 1,
1.403103, -0.9309667, 2.238816, 1, 0, 0.5529412, 1,
1.408171, 0.3578802, 1.212539, 1, 0, 0.5450981, 1,
1.410295, -0.795197, 2.621902, 1, 0, 0.5411765, 1,
1.411416, 0.1730775, 0.7857145, 1, 0, 0.5333334, 1,
1.424582, 0.8571348, 3.340665, 1, 0, 0.5294118, 1,
1.425679, 0.3964045, -0.1127526, 1, 0, 0.5215687, 1,
1.440475, 1.288798, 1.905996, 1, 0, 0.5176471, 1,
1.457722, 1.147407, 0.4875084, 1, 0, 0.509804, 1,
1.471025, 1.61897, -0.2850389, 1, 0, 0.5058824, 1,
1.473307, -1.657936, 4.067875, 1, 0, 0.4980392, 1,
1.473477, 0.4475122, 1.566143, 1, 0, 0.4901961, 1,
1.476819, 1.748774, -0.4662614, 1, 0, 0.4862745, 1,
1.479982, -1.786501, 3.323827, 1, 0, 0.4784314, 1,
1.490511, 1.314837, 2.475792, 1, 0, 0.4745098, 1,
1.491408, 1.984876, 1.127277, 1, 0, 0.4666667, 1,
1.492546, -1.474568, 3.554318, 1, 0, 0.4627451, 1,
1.493835, -0.2194891, 1.686776, 1, 0, 0.454902, 1,
1.494478, 1.264334, 1.124244, 1, 0, 0.4509804, 1,
1.498884, 0.473996, 2.346969, 1, 0, 0.4431373, 1,
1.499025, 0.279595, 2.582721, 1, 0, 0.4392157, 1,
1.512184, 1.437065, -0.2175515, 1, 0, 0.4313726, 1,
1.515194, -1.787037, 1.939242, 1, 0, 0.427451, 1,
1.520885, -0.09868903, 1.974577, 1, 0, 0.4196078, 1,
1.532599, -0.2903474, 3.622868, 1, 0, 0.4156863, 1,
1.545829, 0.2583846, 1.890391, 1, 0, 0.4078431, 1,
1.549274, -1.299926, 1.214946, 1, 0, 0.4039216, 1,
1.572771, -0.2505079, 1.166221, 1, 0, 0.3960784, 1,
1.57597, 0.7339206, 1.753208, 1, 0, 0.3882353, 1,
1.581954, 0.6400911, 1.144452, 1, 0, 0.3843137, 1,
1.586731, -0.3665667, 2.080775, 1, 0, 0.3764706, 1,
1.590093, 1.870053, 0.970918, 1, 0, 0.372549, 1,
1.601561, -0.7350258, 3.888512, 1, 0, 0.3647059, 1,
1.615107, 2.600713, 0.965706, 1, 0, 0.3607843, 1,
1.619179, 0.02743313, 2.689512, 1, 0, 0.3529412, 1,
1.624461, -0.8289905, 2.810245, 1, 0, 0.3490196, 1,
1.629193, 0.3868624, 2.062226, 1, 0, 0.3411765, 1,
1.629979, 0.7020561, 0.7045995, 1, 0, 0.3372549, 1,
1.638737, 0.8900835, 1.832028, 1, 0, 0.3294118, 1,
1.64731, -1.480863, 0.5074604, 1, 0, 0.3254902, 1,
1.651909, 0.6438936, 1.192723, 1, 0, 0.3176471, 1,
1.653982, 0.5767753, 1.13907, 1, 0, 0.3137255, 1,
1.655658, 0.1437264, 1.422844, 1, 0, 0.3058824, 1,
1.680721, -0.4911385, 1.751177, 1, 0, 0.2980392, 1,
1.692207, 0.4285232, 1.782838, 1, 0, 0.2941177, 1,
1.708409, 0.5607458, 0.5780515, 1, 0, 0.2862745, 1,
1.711494, -0.428113, 3.05158, 1, 0, 0.282353, 1,
1.735445, 0.08764831, 1.442896, 1, 0, 0.2745098, 1,
1.741386, -1.573756, 2.031658, 1, 0, 0.2705882, 1,
1.741681, -0.07205318, 2.78829, 1, 0, 0.2627451, 1,
1.747353, 0.7246801, 1.20734, 1, 0, 0.2588235, 1,
1.753018, -0.4691367, 1.019145, 1, 0, 0.2509804, 1,
1.770925, 0.3502225, 0.0006132676, 1, 0, 0.2470588, 1,
1.808782, 0.3872105, 1.407076, 1, 0, 0.2392157, 1,
1.809682, -0.0719225, 3.285842, 1, 0, 0.2352941, 1,
1.826787, -0.04153134, 1.168939, 1, 0, 0.227451, 1,
1.830308, 0.3153472, 1.506603, 1, 0, 0.2235294, 1,
1.830942, 0.180034, 0.4510783, 1, 0, 0.2156863, 1,
1.865841, 0.2863653, 2.711161, 1, 0, 0.2117647, 1,
1.871524, -2.15019, 3.321359, 1, 0, 0.2039216, 1,
1.871524, -0.1697085, 0.6304159, 1, 0, 0.1960784, 1,
1.879341, 0.4490026, 0.2805658, 1, 0, 0.1921569, 1,
1.892813, -0.3447706, 0.9700128, 1, 0, 0.1843137, 1,
1.894604, -0.5975618, 1.364817, 1, 0, 0.1803922, 1,
1.94676, -1.536395, 1.286876, 1, 0, 0.172549, 1,
1.963347, 0.1127128, 2.334876, 1, 0, 0.1686275, 1,
1.982469, -1.679453, 2.213086, 1, 0, 0.1607843, 1,
2.004954, 1.035701, 2.664095, 1, 0, 0.1568628, 1,
2.013517, -0.6435965, 2.810088, 1, 0, 0.1490196, 1,
2.018912, 0.1100632, 2.208144, 1, 0, 0.145098, 1,
2.042045, 0.1672582, 2.725888, 1, 0, 0.1372549, 1,
2.055304, 0.288146, 1.491565, 1, 0, 0.1333333, 1,
2.064426, 0.4491715, 1.954569, 1, 0, 0.1254902, 1,
2.112733, 1.01528, 0.965582, 1, 0, 0.1215686, 1,
2.136346, -0.06023496, 0.4999261, 1, 0, 0.1137255, 1,
2.157663, 0.9582347, 1.046095, 1, 0, 0.1098039, 1,
2.189513, -0.195833, 3.701157, 1, 0, 0.1019608, 1,
2.23078, 0.4561884, 0.2337947, 1, 0, 0.09411765, 1,
2.281349, -1.098545, 2.505437, 1, 0, 0.09019608, 1,
2.292996, -0.3961652, 1.946237, 1, 0, 0.08235294, 1,
2.339727, -0.4483112, 0.2688521, 1, 0, 0.07843138, 1,
2.349158, 1.086111, 0.5890924, 1, 0, 0.07058824, 1,
2.377153, 0.6172001, 0.4923334, 1, 0, 0.06666667, 1,
2.402071, 0.2741107, 2.587356, 1, 0, 0.05882353, 1,
2.444561, -0.5678697, 0.6384375, 1, 0, 0.05490196, 1,
2.449945, -0.8876259, 1.042283, 1, 0, 0.04705882, 1,
2.465958, -0.2869616, 1.752156, 1, 0, 0.04313726, 1,
2.515819, -0.9138852, 1.352591, 1, 0, 0.03529412, 1,
2.646993, 0.6938325, 2.293579, 1, 0, 0.03137255, 1,
2.694122, -2.178761, 2.560773, 1, 0, 0.02352941, 1,
2.777007, -1.324919, 1.063797, 1, 0, 0.01960784, 1,
3.006918, 0.8461679, 0.5233441, 1, 0, 0.01176471, 1,
3.104188, 0.3953262, 1.18888, 1, 0, 0.007843138, 1
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
-0.09200716, -4.511214, -8.585237, 0, -0.5, 0.5, 0.5,
-0.09200716, -4.511214, -8.585237, 1, -0.5, 0.5, 0.5,
-0.09200716, -4.511214, -8.585237, 1, 1.5, 0.5, 0.5,
-0.09200716, -4.511214, -8.585237, 0, 1.5, 0.5, 0.5
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
-4.371713, -0.266257, -8.585237, 0, -0.5, 0.5, 0.5,
-4.371713, -0.266257, -8.585237, 1, -0.5, 0.5, 0.5,
-4.371713, -0.266257, -8.585237, 1, 1.5, 0.5, 0.5,
-4.371713, -0.266257, -8.585237, 0, 1.5, 0.5, 0.5
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
-4.371713, -4.511214, -0.6394753, 0, -0.5, 0.5, 0.5,
-4.371713, -4.511214, -0.6394753, 1, -0.5, 0.5, 0.5,
-4.371713, -4.511214, -0.6394753, 1, 1.5, 0.5, 0.5,
-4.371713, -4.511214, -0.6394753, 0, 1.5, 0.5, 0.5
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
-3, -3.531609, -6.751599,
3, -3.531609, -6.751599,
-3, -3.531609, -6.751599,
-3, -3.694876, -7.057206,
-2, -3.531609, -6.751599,
-2, -3.694876, -7.057206,
-1, -3.531609, -6.751599,
-1, -3.694876, -7.057206,
0, -3.531609, -6.751599,
0, -3.694876, -7.057206,
1, -3.531609, -6.751599,
1, -3.694876, -7.057206,
2, -3.531609, -6.751599,
2, -3.694876, -7.057206,
3, -3.531609, -6.751599,
3, -3.694876, -7.057206
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
-3, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
-3, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
-3, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
-3, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
-2, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
-2, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
-2, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
-2, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
-1, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
-1, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
-1, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
-1, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
0, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
0, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
0, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
0, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
1, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
1, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
1, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
1, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
2, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
2, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
2, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
2, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5,
3, -4.021411, -7.668418, 0, -0.5, 0.5, 0.5,
3, -4.021411, -7.668418, 1, -0.5, 0.5, 0.5,
3, -4.021411, -7.668418, 1, 1.5, 0.5, 0.5,
3, -4.021411, -7.668418, 0, 1.5, 0.5, 0.5
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
-3.384088, -3, -6.751599,
-3.384088, 2, -6.751599,
-3.384088, -3, -6.751599,
-3.548692, -3, -7.057206,
-3.384088, -2, -6.751599,
-3.548692, -2, -7.057206,
-3.384088, -1, -6.751599,
-3.548692, -1, -7.057206,
-3.384088, 0, -6.751599,
-3.548692, 0, -7.057206,
-3.384088, 1, -6.751599,
-3.548692, 1, -7.057206,
-3.384088, 2, -6.751599,
-3.548692, 2, -7.057206
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
-3.877901, -3, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, -3, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, -3, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, -3, -7.668418, 0, 1.5, 0.5, 0.5,
-3.877901, -2, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, -2, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, -2, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, -2, -7.668418, 0, 1.5, 0.5, 0.5,
-3.877901, -1, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, -1, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, -1, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, -1, -7.668418, 0, 1.5, 0.5, 0.5,
-3.877901, 0, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, 0, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, 0, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, 0, -7.668418, 0, 1.5, 0.5, 0.5,
-3.877901, 1, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, 1, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, 1, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, 1, -7.668418, 0, 1.5, 0.5, 0.5,
-3.877901, 2, -7.668418, 0, -0.5, 0.5, 0.5,
-3.877901, 2, -7.668418, 1, -0.5, 0.5, 0.5,
-3.877901, 2, -7.668418, 1, 1.5, 0.5, 0.5,
-3.877901, 2, -7.668418, 0, 1.5, 0.5, 0.5
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
-3.384088, -3.531609, -6,
-3.384088, -3.531609, 4,
-3.384088, -3.531609, -6,
-3.548692, -3.694876, -6,
-3.384088, -3.531609, -4,
-3.548692, -3.694876, -4,
-3.384088, -3.531609, -2,
-3.548692, -3.694876, -2,
-3.384088, -3.531609, 0,
-3.548692, -3.694876, 0,
-3.384088, -3.531609, 2,
-3.548692, -3.694876, 2,
-3.384088, -3.531609, 4,
-3.548692, -3.694876, 4
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
-3.877901, -4.021411, -6, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -6, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -6, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, -6, 0, 1.5, 0.5, 0.5,
-3.877901, -4.021411, -4, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -4, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -4, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, -4, 0, 1.5, 0.5, 0.5,
-3.877901, -4.021411, -2, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -2, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, -2, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, -2, 0, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 0, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 0, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 0, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 0, 0, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 2, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 2, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 2, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 2, 0, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 4, 0, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 4, 1, -0.5, 0.5, 0.5,
-3.877901, -4.021411, 4, 1, 1.5, 0.5, 0.5,
-3.877901, -4.021411, 4, 0, 1.5, 0.5, 0.5
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
-3.384088, -3.531609, -6.751599,
-3.384088, 2.999095, -6.751599,
-3.384088, -3.531609, 5.472649,
-3.384088, 2.999095, 5.472649,
-3.384088, -3.531609, -6.751599,
-3.384088, -3.531609, 5.472649,
-3.384088, 2.999095, -6.751599,
-3.384088, 2.999095, 5.472649,
-3.384088, -3.531609, -6.751599,
3.200074, -3.531609, -6.751599,
-3.384088, -3.531609, 5.472649,
3.200074, -3.531609, 5.472649,
-3.384088, 2.999095, -6.751599,
3.200074, 2.999095, -6.751599,
-3.384088, 2.999095, 5.472649,
3.200074, 2.999095, 5.472649,
3.200074, -3.531609, -6.751599,
3.200074, 2.999095, -6.751599,
3.200074, -3.531609, 5.472649,
3.200074, 2.999095, 5.472649,
3.200074, -3.531609, -6.751599,
3.200074, -3.531609, 5.472649,
3.200074, 2.999095, -6.751599,
3.200074, 2.999095, 5.472649
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
var radius = 8.193314;
var distance = 36.45298;
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
mvMatrix.translate( 0.09200716, 0.266257, 0.6394753 );
mvMatrix.scale( 1.345467, 1.35648, 0.7246885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.45298);
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
dinobuton<-read.table("dinobuton.xyz")
```

```
## Error in read.table("dinobuton.xyz"): no lines available in input
```

```r
x<-dinobuton$V2
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
y<-dinobuton$V3
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
```

```r
z<-dinobuton$V4
```

```
## Error in eval(expr, envir, enclos): object 'dinobuton' not found
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
-3.288203, 0.8459702, -0.9973338, 0, 0, 1, 1, 1,
-2.942253, 0.7199849, -3.126895, 1, 0, 0, 1, 1,
-2.59664, -0.9086032, -2.502856, 1, 0, 0, 1, 1,
-2.593143, -0.8565106, -0.04813131, 1, 0, 0, 1, 1,
-2.538096, -0.1907167, -2.781984, 1, 0, 0, 1, 1,
-2.431344, 0.7987474, -2.045813, 1, 0, 0, 1, 1,
-2.402965, -0.399024, -2.976752, 0, 0, 0, 1, 1,
-2.376074, 0.5629564, -2.726266, 0, 0, 0, 1, 1,
-2.371862, 0.3360468, -0.8680078, 0, 0, 0, 1, 1,
-2.350373, 0.9987879, -0.3537595, 0, 0, 0, 1, 1,
-2.25382, 0.3514658, -1.124978, 0, 0, 0, 1, 1,
-2.245279, 1.032063, -0.3715156, 0, 0, 0, 1, 1,
-2.241721, -0.483163, -2.791777, 0, 0, 0, 1, 1,
-2.205066, -0.5244058, -2.061311, 1, 1, 1, 1, 1,
-2.200095, 0.1438621, -2.059062, 1, 1, 1, 1, 1,
-2.190441, -0.2246254, -2.406901, 1, 1, 1, 1, 1,
-2.162757, 1.008027, -0.8392977, 1, 1, 1, 1, 1,
-2.117095, -0.1318076, -1.955904, 1, 1, 1, 1, 1,
-2.111986, 1.506431, 0.6344676, 1, 1, 1, 1, 1,
-2.073287, -0.2078949, 0.7441193, 1, 1, 1, 1, 1,
-2.058345, -1.868421, -2.966454, 1, 1, 1, 1, 1,
-2.049245, 1.189243, -1.235065, 1, 1, 1, 1, 1,
-2.007335, 0.6253138, -3.170493, 1, 1, 1, 1, 1,
-1.9444, 0.3365853, -2.321756, 1, 1, 1, 1, 1,
-1.90807, -0.3177189, -2.680015, 1, 1, 1, 1, 1,
-1.870329, -0.6924296, -2.79244, 1, 1, 1, 1, 1,
-1.863142, 0.8092902, -2.276807, 1, 1, 1, 1, 1,
-1.861711, 0.2144825, -2.356527, 1, 1, 1, 1, 1,
-1.845267, 1.266913, -0.7869558, 0, 0, 1, 1, 1,
-1.816517, -0.3271499, -2.086211, 1, 0, 0, 1, 1,
-1.787581, 0.4028223, -3.351873, 1, 0, 0, 1, 1,
-1.684171, -1.66121, -2.383301, 1, 0, 0, 1, 1,
-1.672233, -0.1544241, -1.063204, 1, 0, 0, 1, 1,
-1.670993, 0.6746334, 1.016002, 1, 0, 0, 1, 1,
-1.655438, 0.8976312, 0.9979193, 0, 0, 0, 1, 1,
-1.653737, -1.57416, -1.845517, 0, 0, 0, 1, 1,
-1.632385, -0.3145002, -0.7152671, 0, 0, 0, 1, 1,
-1.620176, -2.644557, -1.623707, 0, 0, 0, 1, 1,
-1.618667, -1.334629, -2.354781, 0, 0, 0, 1, 1,
-1.616378, 1.531418, 1.601063, 0, 0, 0, 1, 1,
-1.59591, 0.2602726, -3.306731, 0, 0, 0, 1, 1,
-1.587964, 0.7642215, -0.4457387, 1, 1, 1, 1, 1,
-1.584629, 0.1384401, -1.385934, 1, 1, 1, 1, 1,
-1.58327, 0.3865223, -0.8320582, 1, 1, 1, 1, 1,
-1.576528, 0.02149649, -2.421995, 1, 1, 1, 1, 1,
-1.56583, 0.1489928, 0.3382854, 1, 1, 1, 1, 1,
-1.551764, 1.173236, -0.3532782, 1, 1, 1, 1, 1,
-1.549091, 1.340624, -2.062913, 1, 1, 1, 1, 1,
-1.546944, -0.6715005, -0.4219622, 1, 1, 1, 1, 1,
-1.546002, -1.558134, -3.274855, 1, 1, 1, 1, 1,
-1.518624, 0.1882106, -0.3915887, 1, 1, 1, 1, 1,
-1.5157, 0.4538714, -2.455333, 1, 1, 1, 1, 1,
-1.500856, -0.367533, -2.778865, 1, 1, 1, 1, 1,
-1.499362, 0.5149857, -0.5069778, 1, 1, 1, 1, 1,
-1.488113, 1.903867, 0.2567087, 1, 1, 1, 1, 1,
-1.484595, 0.699954, -2.47666, 1, 1, 1, 1, 1,
-1.483748, -1.189171, -3.606268, 0, 0, 1, 1, 1,
-1.473958, -0.4262385, -2.140687, 1, 0, 0, 1, 1,
-1.467762, -0.1228557, -2.824022, 1, 0, 0, 1, 1,
-1.459926, -0.3174105, -1.773118, 1, 0, 0, 1, 1,
-1.446504, -1.850566, -2.415637, 1, 0, 0, 1, 1,
-1.434109, 0.2843714, -0.05040707, 1, 0, 0, 1, 1,
-1.424588, -1.115235, -0.3153674, 0, 0, 0, 1, 1,
-1.418062, -0.3531433, -3.423311, 0, 0, 0, 1, 1,
-1.409131, 0.9271883, -0.947162, 0, 0, 0, 1, 1,
-1.408636, -0.3104124, -2.534647, 0, 0, 0, 1, 1,
-1.407968, 1.343428, -0.5668599, 0, 0, 0, 1, 1,
-1.400615, 0.9856203, -0.5826463, 0, 0, 0, 1, 1,
-1.397481, -0.3973994, -1.821001, 0, 0, 0, 1, 1,
-1.393831, 0.4894282, -0.2620371, 1, 1, 1, 1, 1,
-1.390183, -0.2088537, -2.650496, 1, 1, 1, 1, 1,
-1.389912, -0.7571985, -0.709353, 1, 1, 1, 1, 1,
-1.385249, 1.015085, -0.9059072, 1, 1, 1, 1, 1,
-1.379248, -0.04021968, -1.767826, 1, 1, 1, 1, 1,
-1.366167, -0.5849987, -2.077605, 1, 1, 1, 1, 1,
-1.362406, 0.007343414, -0.4849049, 1, 1, 1, 1, 1,
-1.360221, 0.6312061, -2.298373, 1, 1, 1, 1, 1,
-1.359349, -2.508955, -3.345139, 1, 1, 1, 1, 1,
-1.358442, 0.508226, -2.978034, 1, 1, 1, 1, 1,
-1.358343, 0.5024924, -1.212915, 1, 1, 1, 1, 1,
-1.345804, -0.9575139, -1.947961, 1, 1, 1, 1, 1,
-1.34339, -0.04466094, -1.258516, 1, 1, 1, 1, 1,
-1.341514, 0.3003502, -2.7486, 1, 1, 1, 1, 1,
-1.334818, -1.119744, -2.795569, 1, 1, 1, 1, 1,
-1.326266, 0.4894458, -2.514722, 0, 0, 1, 1, 1,
-1.325511, -1.019914, -0.837813, 1, 0, 0, 1, 1,
-1.318662, -1.393522, -1.831543, 1, 0, 0, 1, 1,
-1.306105, 0.8072307, -1.066635, 1, 0, 0, 1, 1,
-1.30382, 0.1150435, -1.323602, 1, 0, 0, 1, 1,
-1.303168, -0.3224573, -1.89485, 1, 0, 0, 1, 1,
-1.290764, -0.4031365, -1.821457, 0, 0, 0, 1, 1,
-1.286549, 0.1892064, 2.357366, 0, 0, 0, 1, 1,
-1.279404, 0.1790572, -1.002744, 0, 0, 0, 1, 1,
-1.276896, -0.775799, -2.375053, 0, 0, 0, 1, 1,
-1.265589, 0.01557386, -3.15295, 0, 0, 0, 1, 1,
-1.264134, 0.3090846, -2.276368, 0, 0, 0, 1, 1,
-1.262319, 0.2644543, -1.172214, 0, 0, 0, 1, 1,
-1.260614, -1.033751, -2.178634, 1, 1, 1, 1, 1,
-1.251207, -0.4574963, -0.8821537, 1, 1, 1, 1, 1,
-1.24107, -0.7521414, -0.9632891, 1, 1, 1, 1, 1,
-1.232065, -1.279593, -3.56366, 1, 1, 1, 1, 1,
-1.231836, -1.031733, -3.510223, 1, 1, 1, 1, 1,
-1.228583, 0.9228136, -2.032064, 1, 1, 1, 1, 1,
-1.228167, 0.8948047, -2.675869, 1, 1, 1, 1, 1,
-1.227326, -0.698265, -2.01739, 1, 1, 1, 1, 1,
-1.226907, -0.1911733, -1.395038, 1, 1, 1, 1, 1,
-1.226437, -1.070349, -1.678546, 1, 1, 1, 1, 1,
-1.218074, -0.1092275, -0.6877356, 1, 1, 1, 1, 1,
-1.195301, -0.4793124, -2.581495, 1, 1, 1, 1, 1,
-1.190927, 0.9595129, 0.9005505, 1, 1, 1, 1, 1,
-1.180107, -0.8988274, -3.094898, 1, 1, 1, 1, 1,
-1.174675, 0.401169, -1.585886, 1, 1, 1, 1, 1,
-1.171302, -0.4027701, -0.9073684, 0, 0, 1, 1, 1,
-1.165387, 0.9452255, -1.197663, 1, 0, 0, 1, 1,
-1.163957, -0.2490077, -2.184896, 1, 0, 0, 1, 1,
-1.162356, -0.7528605, -2.356684, 1, 0, 0, 1, 1,
-1.161892, 1.294744, -0.2075062, 1, 0, 0, 1, 1,
-1.157237, 0.04644703, -1.155458, 1, 0, 0, 1, 1,
-1.155791, 0.6832182, -1.032802, 0, 0, 0, 1, 1,
-1.153506, 0.655957, 1.583672, 0, 0, 0, 1, 1,
-1.147164, 1.551647, -0.8986855, 0, 0, 0, 1, 1,
-1.146815, 1.247508, -1.499611, 0, 0, 0, 1, 1,
-1.140476, -1.518062, -4.341613, 0, 0, 0, 1, 1,
-1.137011, 0.1574042, -0.9753163, 0, 0, 0, 1, 1,
-1.128068, 0.4743251, -1.962483, 0, 0, 0, 1, 1,
-1.11913, -0.6560958, -1.456331, 1, 1, 1, 1, 1,
-1.116152, -0.543153, -2.997423, 1, 1, 1, 1, 1,
-1.104591, -0.427557, -3.080934, 1, 1, 1, 1, 1,
-1.100527, 0.3101941, -1.555981, 1, 1, 1, 1, 1,
-1.095538, 0.9155198, 0.618164, 1, 1, 1, 1, 1,
-1.089476, -1.590322, -1.853554, 1, 1, 1, 1, 1,
-1.086846, 0.3864812, -2.425445, 1, 1, 1, 1, 1,
-1.082216, -0.4232, -2.840746, 1, 1, 1, 1, 1,
-1.078604, -0.3976383, -2.535333, 1, 1, 1, 1, 1,
-1.077245, 1.036923, -1.002243, 1, 1, 1, 1, 1,
-1.075768, 0.4686388, -0.5213799, 1, 1, 1, 1, 1,
-1.074275, 0.2880679, -3.276569, 1, 1, 1, 1, 1,
-1.064514, -0.4934536, -3.403928, 1, 1, 1, 1, 1,
-1.060834, 0.3737568, -1.314469, 1, 1, 1, 1, 1,
-1.043412, -1.435405, -3.158895, 1, 1, 1, 1, 1,
-1.040522, 1.071766, -0.6417041, 0, 0, 1, 1, 1,
-1.040316, -2.22087, -2.443392, 1, 0, 0, 1, 1,
-1.040164, 1.731551, -1.726362, 1, 0, 0, 1, 1,
-1.035483, 0.2224078, -0.6876414, 1, 0, 0, 1, 1,
-1.034115, 0.6578721, -0.4426364, 1, 0, 0, 1, 1,
-1.030974, -1.159579, -3.304581, 1, 0, 0, 1, 1,
-1.028732, 0.9690157, -0.2508296, 0, 0, 0, 1, 1,
-1.023044, -0.3114562, -2.69615, 0, 0, 0, 1, 1,
-1.017909, -0.6759505, -1.163259, 0, 0, 0, 1, 1,
-1.016504, 0.2854128, -0.8726201, 0, 0, 0, 1, 1,
-1.013301, 0.4135921, -0.6218483, 0, 0, 0, 1, 1,
-1.012146, 0.3140729, -0.7593709, 0, 0, 0, 1, 1,
-1.004885, -0.2964839, -3.046817, 0, 0, 0, 1, 1,
-1.002603, 0.6373732, -1.089185, 1, 1, 1, 1, 1,
-1.001668, 0.2396501, -2.064744, 1, 1, 1, 1, 1,
-0.9976738, 1.244636, -2.158417, 1, 1, 1, 1, 1,
-0.9966432, -1.758043, -2.469247, 1, 1, 1, 1, 1,
-0.9904234, 1.404912, -0.6195527, 1, 1, 1, 1, 1,
-0.9853954, -0.009075609, -2.016205, 1, 1, 1, 1, 1,
-0.983712, -0.9053637, -2.232678, 1, 1, 1, 1, 1,
-0.9765888, 0.6410726, 0.6085758, 1, 1, 1, 1, 1,
-0.9706748, 0.7945367, -2.474013, 1, 1, 1, 1, 1,
-0.960242, 0.2993034, -0.9906725, 1, 1, 1, 1, 1,
-0.9549009, -1.340865, -3.743831, 1, 1, 1, 1, 1,
-0.9543748, -0.988112, -2.516123, 1, 1, 1, 1, 1,
-0.954091, -1.043444, -1.35117, 1, 1, 1, 1, 1,
-0.9505612, -0.3011371, -2.208807, 1, 1, 1, 1, 1,
-0.9502128, 0.4615401, -1.141859, 1, 1, 1, 1, 1,
-0.9483452, -0.4066064, -1.842501, 0, 0, 1, 1, 1,
-0.945847, 0.7985804, -2.101174, 1, 0, 0, 1, 1,
-0.9453904, -1.02514, -2.505133, 1, 0, 0, 1, 1,
-0.9433811, -1.15716, -2.760545, 1, 0, 0, 1, 1,
-0.9432324, 2.174679, 0.3744119, 1, 0, 0, 1, 1,
-0.9423245, 0.6977704, -0.4555612, 1, 0, 0, 1, 1,
-0.9403834, 1.070437, 0.468492, 0, 0, 0, 1, 1,
-0.9390858, 1.211777, -0.1561542, 0, 0, 0, 1, 1,
-0.93693, 1.047471, -0.6596835, 0, 0, 0, 1, 1,
-0.9366133, -0.02105704, -0.9532131, 0, 0, 0, 1, 1,
-0.9356075, -0.3241153, -0.5549388, 0, 0, 0, 1, 1,
-0.9331345, -0.301265, -3.030629, 0, 0, 0, 1, 1,
-0.932291, 0.5763799, 0.1044706, 0, 0, 0, 1, 1,
-0.9317342, 0.7848087, -1.519448, 1, 1, 1, 1, 1,
-0.9299163, 0.03663382, -0.562123, 1, 1, 1, 1, 1,
-0.9267791, -0.5315317, -2.449456, 1, 1, 1, 1, 1,
-0.9244489, 0.1120234, -1.591236, 1, 1, 1, 1, 1,
-0.9222205, 2.044835, 0.4437656, 1, 1, 1, 1, 1,
-0.9220919, 0.2314361, -1.443942, 1, 1, 1, 1, 1,
-0.918808, 1.469327, -0.6882933, 1, 1, 1, 1, 1,
-0.9144878, -0.634734, -3.263642, 1, 1, 1, 1, 1,
-0.9097531, 1.405391, -0.2371377, 1, 1, 1, 1, 1,
-0.905767, 2.765342, -1.762074, 1, 1, 1, 1, 1,
-0.8999414, -1.238896, -1.717584, 1, 1, 1, 1, 1,
-0.8878831, 0.1618933, -2.335716, 1, 1, 1, 1, 1,
-0.8811428, -1.027483, -3.326741, 1, 1, 1, 1, 1,
-0.8748612, 0.02252545, -1.479035, 1, 1, 1, 1, 1,
-0.8738281, -0.7038376, -0.7398469, 1, 1, 1, 1, 1,
-0.8737812, 0.9759281, -0.2584209, 0, 0, 1, 1, 1,
-0.8706695, -0.6451905, -2.768036, 1, 0, 0, 1, 1,
-0.8672314, -1.264056, -2.952003, 1, 0, 0, 1, 1,
-0.8658473, -1.344048, -0.5905957, 1, 0, 0, 1, 1,
-0.8587373, -1.017483, -1.818636, 1, 0, 0, 1, 1,
-0.8569432, -1.38552, -2.5576, 1, 0, 0, 1, 1,
-0.8562166, 0.1176969, -0.5370044, 0, 0, 0, 1, 1,
-0.8535873, -0.9900847, -1.694893, 0, 0, 0, 1, 1,
-0.8524144, -0.03381629, -0.9541099, 0, 0, 0, 1, 1,
-0.8485548, 1.099502, -0.5186008, 0, 0, 0, 1, 1,
-0.8476238, 0.07710558, -1.197214, 0, 0, 0, 1, 1,
-0.8465856, 0.6755975, 0.1970315, 0, 0, 0, 1, 1,
-0.8448709, 0.5759216, -1.635746, 0, 0, 0, 1, 1,
-0.8384571, 1.275745, -0.5400698, 1, 1, 1, 1, 1,
-0.8283417, 0.7547209, -0.4085713, 1, 1, 1, 1, 1,
-0.8277355, 1.469751, 0.9280552, 1, 1, 1, 1, 1,
-0.8264995, 0.2023747, -1.062662, 1, 1, 1, 1, 1,
-0.8257776, 0.9002534, -1.171675, 1, 1, 1, 1, 1,
-0.8245648, -1.109324, -1.579846, 1, 1, 1, 1, 1,
-0.8138539, 0.02061608, -2.663989, 1, 1, 1, 1, 1,
-0.808481, 0.01758834, -2.151287, 1, 1, 1, 1, 1,
-0.8080616, 1.750246, -0.04273463, 1, 1, 1, 1, 1,
-0.8067186, -0.9885837, -2.4855, 1, 1, 1, 1, 1,
-0.8056234, 1.082279, -0.7156383, 1, 1, 1, 1, 1,
-0.8010557, -2.527483, -4.344449, 1, 1, 1, 1, 1,
-0.7984179, -1.739574, -2.639992, 1, 1, 1, 1, 1,
-0.7955659, 0.6256704, -2.442888, 1, 1, 1, 1, 1,
-0.7949979, 0.1212025, -1.278469, 1, 1, 1, 1, 1,
-0.7935432, -0.4331706, -0.7205258, 0, 0, 1, 1, 1,
-0.7927982, 0.6972858, -1.897339, 1, 0, 0, 1, 1,
-0.7879699, -0.0924403, -2.21839, 1, 0, 0, 1, 1,
-0.7860247, -0.3353472, -2.283313, 1, 0, 0, 1, 1,
-0.7853939, 0.8621809, -2.075261, 1, 0, 0, 1, 1,
-0.7834227, 1.000805, -0.4584991, 1, 0, 0, 1, 1,
-0.7828739, 2.441702, 0.8804652, 0, 0, 0, 1, 1,
-0.7810587, 1.85361, -0.8662221, 0, 0, 0, 1, 1,
-0.7784194, -0.424911, -2.149037, 0, 0, 0, 1, 1,
-0.7772609, -1.089123, -2.999015, 0, 0, 0, 1, 1,
-0.7747983, -1.011553, -1.975522, 0, 0, 0, 1, 1,
-0.7724999, -2.110098, -3.147688, 0, 0, 0, 1, 1,
-0.7721215, 0.1343919, -2.629457, 0, 0, 0, 1, 1,
-0.7707116, 0.473663, -1.400125, 1, 1, 1, 1, 1,
-0.7680944, -0.4990676, -2.846893, 1, 1, 1, 1, 1,
-0.7632167, -1.402062, -2.870101, 1, 1, 1, 1, 1,
-0.7620975, 0.7703894, -0.06287285, 1, 1, 1, 1, 1,
-0.7525288, 2.730171, -1.323342, 1, 1, 1, 1, 1,
-0.7512022, -0.4041598, -3.230994, 1, 1, 1, 1, 1,
-0.7476754, -1.706524, -2.346326, 1, 1, 1, 1, 1,
-0.7473273, 0.5145074, -1.132181, 1, 1, 1, 1, 1,
-0.7457066, 1.378819, -1.69193, 1, 1, 1, 1, 1,
-0.7387826, -0.3214786, -2.301408, 1, 1, 1, 1, 1,
-0.7367524, -0.2794419, -1.144744, 1, 1, 1, 1, 1,
-0.7351844, 1.335533, -0.03293841, 1, 1, 1, 1, 1,
-0.7334622, 0.4122224, -0.6363996, 1, 1, 1, 1, 1,
-0.7297857, -0.5308229, -1.48721, 1, 1, 1, 1, 1,
-0.7182366, -0.2163066, -2.799762, 1, 1, 1, 1, 1,
-0.7149891, -0.8923207, -2.393175, 0, 0, 1, 1, 1,
-0.7131011, 1.448315, 2.405357, 1, 0, 0, 1, 1,
-0.7093704, 0.4598723, 0.6625484, 1, 0, 0, 1, 1,
-0.6979007, 0.7199339, -1.58075, 1, 0, 0, 1, 1,
-0.6961142, 2.000761, -0.8791483, 1, 0, 0, 1, 1,
-0.690216, -0.6973954, -1.299249, 1, 0, 0, 1, 1,
-0.6874372, -0.5207964, -2.050867, 0, 0, 0, 1, 1,
-0.6815732, -0.4705623, -3.343812, 0, 0, 0, 1, 1,
-0.6778327, 0.6320622, -0.5099471, 0, 0, 0, 1, 1,
-0.6734703, -1.083312, -3.476058, 0, 0, 0, 1, 1,
-0.6733491, 0.4265808, 0.08473837, 0, 0, 0, 1, 1,
-0.6697192, -0.07137495, -2.246006, 0, 0, 0, 1, 1,
-0.6637111, -0.9535624, -1.451907, 0, 0, 0, 1, 1,
-0.6618558, 0.1304943, -0.6558666, 1, 1, 1, 1, 1,
-0.6604622, 2.267776, -1.211301, 1, 1, 1, 1, 1,
-0.6595814, -2.751898, -4.338021, 1, 1, 1, 1, 1,
-0.6515319, -0.196391, -2.280209, 1, 1, 1, 1, 1,
-0.6486651, -0.8875259, -2.538088, 1, 1, 1, 1, 1,
-0.6433922, -0.546591, -3.026987, 1, 1, 1, 1, 1,
-0.6426626, -0.3802222, -2.496474, 1, 1, 1, 1, 1,
-0.6412151, -1.356143, -3.479631, 1, 1, 1, 1, 1,
-0.6389558, -1.941781, -2.732522, 1, 1, 1, 1, 1,
-0.6343653, -0.1277447, -1.50962, 1, 1, 1, 1, 1,
-0.6333638, -1.067404, 0.1630942, 1, 1, 1, 1, 1,
-0.6301643, 1.205063, -1.39131, 1, 1, 1, 1, 1,
-0.6290793, 0.02523855, -2.909498, 1, 1, 1, 1, 1,
-0.6280317, 0.05976932, -2.317419, 1, 1, 1, 1, 1,
-0.6193992, -0.3318066, -2.24901, 1, 1, 1, 1, 1,
-0.61695, 0.6160836, 1.988162, 0, 0, 1, 1, 1,
-0.6098889, 0.2676139, -1.22365, 1, 0, 0, 1, 1,
-0.6088997, 0.1059781, -3.412109, 1, 0, 0, 1, 1,
-0.604086, 1.2229, -1.689477, 1, 0, 0, 1, 1,
-0.5938118, -0.7715288, -3.339035, 1, 0, 0, 1, 1,
-0.5898701, 0.2167111, -2.071725, 1, 0, 0, 1, 1,
-0.5883467, 0.1767582, -1.312838, 0, 0, 0, 1, 1,
-0.5828505, 0.7763877, -0.1081092, 0, 0, 0, 1, 1,
-0.5810899, -1.121255, -4.031649, 0, 0, 0, 1, 1,
-0.5806012, -0.07260834, -1.344522, 0, 0, 0, 1, 1,
-0.5736508, 1.242662, -0.6559197, 0, 0, 0, 1, 1,
-0.5729238, 0.4890236, -0.1530855, 0, 0, 0, 1, 1,
-0.5694265, -2.358403, -1.737081, 0, 0, 0, 1, 1,
-0.56828, 0.6617184, 0.6253889, 1, 1, 1, 1, 1,
-0.5682775, 0.2475822, -2.293789, 1, 1, 1, 1, 1,
-0.5632249, 0.220803, 0.7133068, 1, 1, 1, 1, 1,
-0.5591893, 0.1098188, -0.5745081, 1, 1, 1, 1, 1,
-0.5526039, 0.7081643, 0.735707, 1, 1, 1, 1, 1,
-0.5525154, 0.07596831, -0.5320997, 1, 1, 1, 1, 1,
-0.5478486, 0.5327727, -0.7932024, 1, 1, 1, 1, 1,
-0.5406896, 0.2013996, -2.603559, 1, 1, 1, 1, 1,
-0.5402904, -0.5694453, -3.033577, 1, 1, 1, 1, 1,
-0.5392555, -1.511469, -3.056157, 1, 1, 1, 1, 1,
-0.5358658, -1.779667, -5.268452, 1, 1, 1, 1, 1,
-0.5330696, 0.1815241, -1.749321, 1, 1, 1, 1, 1,
-0.5308185, -0.1232488, -0.3468394, 1, 1, 1, 1, 1,
-0.5218377, -1.144356, -3.276311, 1, 1, 1, 1, 1,
-0.5177362, -0.07846918, -0.7946383, 1, 1, 1, 1, 1,
-0.5176156, 1.49387, -0.3816415, 0, 0, 1, 1, 1,
-0.5168233, -0.8770744, -0.6016433, 1, 0, 0, 1, 1,
-0.5122104, -0.4586599, -2.795279, 1, 0, 0, 1, 1,
-0.5086371, -0.8699477, -0.7365882, 1, 0, 0, 1, 1,
-0.5082099, -1.077728, -2.886064, 1, 0, 0, 1, 1,
-0.5080554, -1.579084, -3.657511, 1, 0, 0, 1, 1,
-0.5055999, -0.5495659, -1.82696, 0, 0, 0, 1, 1,
-0.5053636, -0.3187025, -3.052707, 0, 0, 0, 1, 1,
-0.5001546, 1.543519, -0.4906417, 0, 0, 0, 1, 1,
-0.4974407, 0.4861233, -1.609334, 0, 0, 0, 1, 1,
-0.496814, -0.8070894, -3.034063, 0, 0, 0, 1, 1,
-0.4938635, 0.5788471, -1.956935, 0, 0, 0, 1, 1,
-0.4932046, -1.64589, -1.366198, 0, 0, 0, 1, 1,
-0.4922663, 0.7670575, 0.5127564, 1, 1, 1, 1, 1,
-0.4919918, 0.00339739, -0.899829, 1, 1, 1, 1, 1,
-0.4884979, -1.301665, -3.571986, 1, 1, 1, 1, 1,
-0.4827186, -1.083984, -3.240139, 1, 1, 1, 1, 1,
-0.4785824, -0.5958506, -2.629712, 1, 1, 1, 1, 1,
-0.4739822, -0.8145822, -1.998636, 1, 1, 1, 1, 1,
-0.4668632, -0.6702905, -3.350372, 1, 1, 1, 1, 1,
-0.4650063, -2.146636, -4.172043, 1, 1, 1, 1, 1,
-0.4633299, 2.86825, 0.7294812, 1, 1, 1, 1, 1,
-0.4632854, -1.679164, -1.662649, 1, 1, 1, 1, 1,
-0.4599836, -1.326699, -0.3119815, 1, 1, 1, 1, 1,
-0.4581703, 1.139156, 0.8804482, 1, 1, 1, 1, 1,
-0.4512034, -0.5358577, -2.544202, 1, 1, 1, 1, 1,
-0.4501491, -0.9888674, -3.248774, 1, 1, 1, 1, 1,
-0.4453834, -0.156835, -2.489008, 1, 1, 1, 1, 1,
-0.4449037, 0.001481578, -1.152625, 0, 0, 1, 1, 1,
-0.4430519, -0.5726337, -1.745506, 1, 0, 0, 1, 1,
-0.4397932, 0.5424091, 0.01480467, 1, 0, 0, 1, 1,
-0.4373459, -0.1341099, -1.337296, 1, 0, 0, 1, 1,
-0.4353672, -0.2222686, -1.338992, 1, 0, 0, 1, 1,
-0.4340359, 0.1299451, -0.966794, 1, 0, 0, 1, 1,
-0.4229678, 0.01033594, -1.581819, 0, 0, 0, 1, 1,
-0.4166234, 0.4612311, -1.001829, 0, 0, 0, 1, 1,
-0.4144654, -0.5418714, -0.3353662, 0, 0, 0, 1, 1,
-0.4060368, -0.8218331, -1.915153, 0, 0, 0, 1, 1,
-0.4031289, 1.173491, 1.973384, 0, 0, 0, 1, 1,
-0.3997639, 0.5933014, -1.051203, 0, 0, 0, 1, 1,
-0.3969449, -0.5027342, -1.675953, 0, 0, 0, 1, 1,
-0.3962054, -0.7645136, -2.186818, 1, 1, 1, 1, 1,
-0.3918852, -0.6942719, -2.125625, 1, 1, 1, 1, 1,
-0.3911923, 0.9205024, -1.573915, 1, 1, 1, 1, 1,
-0.3910182, -0.5046422, -1.537666, 1, 1, 1, 1, 1,
-0.3850845, 0.7354233, -1.589261, 1, 1, 1, 1, 1,
-0.3836187, -1.203396, -4.838571, 1, 1, 1, 1, 1,
-0.3774688, -0.450198, -2.861405, 1, 1, 1, 1, 1,
-0.3753061, 1.173703, -0.9954513, 1, 1, 1, 1, 1,
-0.3744532, 1.574435, -1.323703, 1, 1, 1, 1, 1,
-0.3723686, -0.5918664, -0.8823612, 1, 1, 1, 1, 1,
-0.3710691, -1.798568, -4.033241, 1, 1, 1, 1, 1,
-0.3709878, -0.16422, -4.308807, 1, 1, 1, 1, 1,
-0.3668455, -0.1548862, -2.780524, 1, 1, 1, 1, 1,
-0.3662072, -0.249856, -3.000594, 1, 1, 1, 1, 1,
-0.3649543, 2.202702, -1.167292, 1, 1, 1, 1, 1,
-0.3622648, -0.1389709, -1.262884, 0, 0, 1, 1, 1,
-0.3560825, 0.3653705, -2.304779, 1, 0, 0, 1, 1,
-0.350355, 1.439903, 1.510706, 1, 0, 0, 1, 1,
-0.3502353, 1.594234, -1.208799, 1, 0, 0, 1, 1,
-0.3482919, 0.2330329, -1.438161, 1, 0, 0, 1, 1,
-0.3454805, -1.184165, -3.25431, 1, 0, 0, 1, 1,
-0.3454142, -1.127145, -5.019539, 0, 0, 0, 1, 1,
-0.3416167, 0.2368826, -0.01634465, 0, 0, 0, 1, 1,
-0.3387719, -0.09485248, -1.912614, 0, 0, 0, 1, 1,
-0.3362311, -0.3044237, -1.898792, 0, 0, 0, 1, 1,
-0.3345207, 0.5022107, -0.5343829, 0, 0, 0, 1, 1,
-0.3330767, 0.04535634, -0.5842642, 0, 0, 0, 1, 1,
-0.3330573, 2.384348, 0.793044, 0, 0, 0, 1, 1,
-0.3320041, 0.002175335, -1.860618, 1, 1, 1, 1, 1,
-0.3303434, 1.368072, 0.3040648, 1, 1, 1, 1, 1,
-0.3300321, -0.04455702, 0.1838731, 1, 1, 1, 1, 1,
-0.3289859, 1.57825, -0.3500247, 1, 1, 1, 1, 1,
-0.3274511, 0.02463404, -2.053488, 1, 1, 1, 1, 1,
-0.3126216, -0.1153493, -1.834914, 1, 1, 1, 1, 1,
-0.3087645, 0.9486306, -0.8564202, 1, 1, 1, 1, 1,
-0.3077172, 1.757901, 0.03242424, 1, 1, 1, 1, 1,
-0.2932828, -0.3356454, -1.544556, 1, 1, 1, 1, 1,
-0.2847887, -1.342348, -3.615932, 1, 1, 1, 1, 1,
-0.2833835, 2.226368, 1.37216, 1, 1, 1, 1, 1,
-0.2815396, -0.532317, -2.789666, 1, 1, 1, 1, 1,
-0.2784216, 2.221561, -2.885444, 1, 1, 1, 1, 1,
-0.277878, -1.386737, -3.525433, 1, 1, 1, 1, 1,
-0.2758766, 0.1299134, -1.712491, 1, 1, 1, 1, 1,
-0.2747793, -0.4599791, -0.6758249, 0, 0, 1, 1, 1,
-0.2700035, -0.9362233, -2.628645, 1, 0, 0, 1, 1,
-0.2694173, -0.2074458, -1.189516, 1, 0, 0, 1, 1,
-0.2677146, -0.1625379, -2.216151, 1, 0, 0, 1, 1,
-0.2630452, -1.580866, -4.308776, 1, 0, 0, 1, 1,
-0.2605014, -0.8374069, -3.334265, 1, 0, 0, 1, 1,
-0.2568287, -2.12996, -1.13851, 0, 0, 0, 1, 1,
-0.2546936, -0.003770547, -2.237831, 0, 0, 0, 1, 1,
-0.2505574, 0.7765028, 1.060019, 0, 0, 0, 1, 1,
-0.2501883, 1.164563, 0.0938803, 0, 0, 0, 1, 1,
-0.2493222, 0.3328461, 0.06444737, 0, 0, 0, 1, 1,
-0.2442742, 0.7244827, -1.215612, 0, 0, 0, 1, 1,
-0.2440014, -0.6163648, -2.895643, 0, 0, 0, 1, 1,
-0.2413713, -1.165568, -2.939056, 1, 1, 1, 1, 1,
-0.2411743, -1.236413, -2.058608, 1, 1, 1, 1, 1,
-0.2405938, 0.8285941, 1.262149, 1, 1, 1, 1, 1,
-0.2400937, -1.102751, -3.507335, 1, 1, 1, 1, 1,
-0.2380136, -1.900276, -1.946907, 1, 1, 1, 1, 1,
-0.2325215, 1.291784, 0.01639582, 1, 1, 1, 1, 1,
-0.2293004, 0.1270131, -0.09089167, 1, 1, 1, 1, 1,
-0.2291024, 1.064743, 1.221527, 1, 1, 1, 1, 1,
-0.2260346, 0.3685689, -1.019934, 1, 1, 1, 1, 1,
-0.2209509, 0.1673385, -0.5266189, 1, 1, 1, 1, 1,
-0.2186588, 1.569317, -1.552946, 1, 1, 1, 1, 1,
-0.2148152, -0.2074837, -4.25597, 1, 1, 1, 1, 1,
-0.2127095, -0.3231478, -1.948687, 1, 1, 1, 1, 1,
-0.2114946, -0.1214977, -2.699391, 1, 1, 1, 1, 1,
-0.2036196, -1.375107, -2.516154, 1, 1, 1, 1, 1,
-0.2035901, 0.5390389, -0.7221955, 0, 0, 1, 1, 1,
-0.1938245, -0.7507057, -4.333955, 1, 0, 0, 1, 1,
-0.1893967, -0.3233178, -3.599655, 1, 0, 0, 1, 1,
-0.1872991, -1.143692, -2.330327, 1, 0, 0, 1, 1,
-0.1834621, 0.8473365, -2.203203, 1, 0, 0, 1, 1,
-0.1818896, 0.5259139, 1.070302, 1, 0, 0, 1, 1,
-0.1814058, -0.5115987, -2.531075, 0, 0, 0, 1, 1,
-0.1805219, 1.428217, -0.007110292, 0, 0, 0, 1, 1,
-0.1771633, -1.195108, -3.793054, 0, 0, 0, 1, 1,
-0.1740838, 1.046612, -1.67928, 0, 0, 0, 1, 1,
-0.1679038, 0.429063, -0.1713715, 0, 0, 0, 1, 1,
-0.1673536, 0.1615449, -0.8983192, 0, 0, 0, 1, 1,
-0.1593341, 0.7396414, 1.078329, 0, 0, 0, 1, 1,
-0.1586759, -0.07139099, -3.149253, 1, 1, 1, 1, 1,
-0.1548416, 0.6943124, -0.5836126, 1, 1, 1, 1, 1,
-0.1534672, -0.7635482, -1.091851, 1, 1, 1, 1, 1,
-0.1517452, 1.36056, -0.1784493, 1, 1, 1, 1, 1,
-0.1494793, -1.767512, -3.405338, 1, 1, 1, 1, 1,
-0.146348, 0.9755408, -0.7262521, 1, 1, 1, 1, 1,
-0.1437374, 0.3593734, -0.02230788, 1, 1, 1, 1, 1,
-0.1394957, -0.9325255, -2.879674, 1, 1, 1, 1, 1,
-0.136499, -0.8783105, -1.987534, 1, 1, 1, 1, 1,
-0.132963, 2.603519, 0.7247657, 1, 1, 1, 1, 1,
-0.1321332, 0.615317, -0.5824341, 1, 1, 1, 1, 1,
-0.1313325, -0.5239144, -2.872087, 1, 1, 1, 1, 1,
-0.1306727, 0.2860481, 0.4061109, 1, 1, 1, 1, 1,
-0.12733, 0.2913279, -1.547334, 1, 1, 1, 1, 1,
-0.1221657, 0.8288248, -0.2428191, 1, 1, 1, 1, 1,
-0.1215492, 1.239472, 0.498984, 0, 0, 1, 1, 1,
-0.1210931, 0.9144734, 0.7312752, 1, 0, 0, 1, 1,
-0.114695, 1.021393, 0.08338311, 1, 0, 0, 1, 1,
-0.1118936, 2.896488, 1.029135, 1, 0, 0, 1, 1,
-0.1107734, -0.6584495, -2.99271, 1, 0, 0, 1, 1,
-0.1100947, 0.5653694, 1.143538, 1, 0, 0, 1, 1,
-0.1069288, -0.9341753, -1.526403, 0, 0, 0, 1, 1,
-0.1067719, 0.4063854, 0.27687, 0, 0, 0, 1, 1,
-0.09879798, -0.8272519, -3.646011, 0, 0, 0, 1, 1,
-0.09815103, 1.413607, -0.7302285, 0, 0, 0, 1, 1,
-0.09568784, 0.7987871, -0.2306113, 0, 0, 0, 1, 1,
-0.09452055, 0.1771746, 1.25015, 0, 0, 0, 1, 1,
-0.09357208, 0.4350156, -1.876135, 0, 0, 0, 1, 1,
-0.09085634, -0.4134357, -6.573576, 1, 1, 1, 1, 1,
-0.09003489, 0.4168303, -0.1273835, 1, 1, 1, 1, 1,
-0.08779503, 0.6922144, 0.7039092, 1, 1, 1, 1, 1,
-0.08669391, -0.712421, -2.056963, 1, 1, 1, 1, 1,
-0.08427015, -0.7456616, -5.906721, 1, 1, 1, 1, 1,
-0.08313812, 1.710373, 1.323135, 1, 1, 1, 1, 1,
-0.07964851, 0.8863197, 0.2513216, 1, 1, 1, 1, 1,
-0.07783408, -2.667956, -0.9630519, 1, 1, 1, 1, 1,
-0.07561292, 0.343683, 1.109897, 1, 1, 1, 1, 1,
-0.07420684, 1.203897, -0.9155493, 1, 1, 1, 1, 1,
-0.07382055, -0.0305727, -1.786582, 1, 1, 1, 1, 1,
-0.07320046, -1.298491, -2.365556, 1, 1, 1, 1, 1,
-0.07319082, 0.5865437, -1.705232, 1, 1, 1, 1, 1,
-0.07089282, 1.019293, 1.967059, 1, 1, 1, 1, 1,
-0.0690114, -0.1613368, -0.7268631, 1, 1, 1, 1, 1,
-0.06895758, -1.9847, -1.999844, 0, 0, 1, 1, 1,
-0.0671066, 0.755847, -0.2287028, 1, 0, 0, 1, 1,
-0.0656893, -0.591459, -4.16194, 1, 0, 0, 1, 1,
-0.06430923, -0.4920141, -2.764261, 1, 0, 0, 1, 1,
-0.06137475, -2.063257, -2.169309, 1, 0, 0, 1, 1,
-0.06133804, -0.2948963, -2.818058, 1, 0, 0, 1, 1,
-0.05893332, 2.034542, 1.750892, 0, 0, 0, 1, 1,
-0.04747972, -1.418894, -4.711666, 0, 0, 0, 1, 1,
-0.04455678, -0.3315157, -3.483339, 0, 0, 0, 1, 1,
-0.04428544, -2.607389, -5.716343, 0, 0, 0, 1, 1,
-0.04226829, 1.293309, 0.04561254, 0, 0, 0, 1, 1,
-0.03886984, 0.6803872, -0.9456944, 0, 0, 0, 1, 1,
-0.03439446, -0.9858584, -3.728344, 0, 0, 0, 1, 1,
-0.03226377, 0.4751321, 0.3485626, 1, 1, 1, 1, 1,
-0.03226119, 0.2092317, 0.447614, 1, 1, 1, 1, 1,
-0.03219203, -0.1980482, -2.724451, 1, 1, 1, 1, 1,
-0.03075831, 1.333408, -1.203286, 1, 1, 1, 1, 1,
-0.02923848, -1.228061, -2.198909, 1, 1, 1, 1, 1,
-0.02246301, 1.11293, 0.5319998, 1, 1, 1, 1, 1,
-0.02077983, -0.7565486, -1.018914, 1, 1, 1, 1, 1,
-0.01716213, -0.7691879, -3.049773, 1, 1, 1, 1, 1,
-0.01706697, -1.051678, -3.109629, 1, 1, 1, 1, 1,
-0.01074874, -0.6639482, -2.119241, 1, 1, 1, 1, 1,
-0.009758821, -0.0326461, -2.302673, 1, 1, 1, 1, 1,
-0.006651397, 0.270605, -0.1942616, 1, 1, 1, 1, 1,
-0.004808098, 0.8178779, -0.9673754, 1, 1, 1, 1, 1,
-0.001758242, 0.07230447, -1.850398, 1, 1, 1, 1, 1,
0.004587238, 0.08523072, 0.5843914, 1, 1, 1, 1, 1,
0.006596188, -2.633705, 4.599988, 0, 0, 1, 1, 1,
0.01037403, 0.2442757, -1.521069, 1, 0, 0, 1, 1,
0.01037979, 0.1123278, -0.2763647, 1, 0, 0, 1, 1,
0.01195556, 1.373906, 0.1915807, 1, 0, 0, 1, 1,
0.02452555, -2.162253, 3.251046, 1, 0, 0, 1, 1,
0.03056093, -0.4919067, 3.898601, 1, 0, 0, 1, 1,
0.03941516, 0.2859301, 2.253814, 0, 0, 0, 1, 1,
0.04197737, -0.4008867, 1.994394, 0, 0, 0, 1, 1,
0.04260283, 0.7535109, -0.2770589, 0, 0, 0, 1, 1,
0.04374307, -0.4468325, 2.271259, 0, 0, 0, 1, 1,
0.04698692, 0.02308124, 0.2433735, 0, 0, 0, 1, 1,
0.04705632, -0.3476348, 3.340516, 0, 0, 0, 1, 1,
0.04788423, -2.219859, 4.053422, 0, 0, 0, 1, 1,
0.0505238, -0.5993159, 2.28928, 1, 1, 1, 1, 1,
0.05072814, -1.456594, 2.508306, 1, 1, 1, 1, 1,
0.05082301, 0.09647774, 0.2786802, 1, 1, 1, 1, 1,
0.05537039, 1.222433, -0.8740031, 1, 1, 1, 1, 1,
0.0555659, 0.3653785, 0.185016, 1, 1, 1, 1, 1,
0.06073993, -1.584457, 3.394928, 1, 1, 1, 1, 1,
0.06326737, -1.83655, 2.762381, 1, 1, 1, 1, 1,
0.06361524, -1.537334, 3.471657, 1, 1, 1, 1, 1,
0.06430092, -1.686008, 4.504366, 1, 1, 1, 1, 1,
0.06726287, -0.4750371, 1.561218, 1, 1, 1, 1, 1,
0.06767902, -0.4897005, 4.100306, 1, 1, 1, 1, 1,
0.07003459, 0.2168865, 0.06445906, 1, 1, 1, 1, 1,
0.07029638, 0.2234239, -0.8310189, 1, 1, 1, 1, 1,
0.07102301, 0.2037765, 1.241184, 1, 1, 1, 1, 1,
0.07528611, 0.1836284, 0.5518346, 1, 1, 1, 1, 1,
0.07592732, -0.4711541, 4.986045, 0, 0, 1, 1, 1,
0.07672887, -0.1125799, 2.73906, 1, 0, 0, 1, 1,
0.07856823, 0.1040207, 2.201303, 1, 0, 0, 1, 1,
0.08027329, 2.682495, 0.3668408, 1, 0, 0, 1, 1,
0.08327672, 0.1626813, -1.578551, 1, 0, 0, 1, 1,
0.08350779, 2.646111, 0.4775962, 1, 0, 0, 1, 1,
0.09007268, -0.3611355, 1.567702, 0, 0, 0, 1, 1,
0.09075019, 0.0974627, 1.183129, 0, 0, 0, 1, 1,
0.09923472, -1.486537, 2.939468, 0, 0, 0, 1, 1,
0.09948183, -1.677199, 2.87315, 0, 0, 0, 1, 1,
0.1016681, 0.7526555, 0.01763216, 0, 0, 0, 1, 1,
0.104832, -1.391734, 4.074643, 0, 0, 0, 1, 1,
0.1052454, 0.1510472, -1.708303, 0, 0, 0, 1, 1,
0.1056145, 0.7670643, 0.1292068, 1, 1, 1, 1, 1,
0.1132966, -0.6341582, 3.989537, 1, 1, 1, 1, 1,
0.1177661, 0.5323821, -0.1241324, 1, 1, 1, 1, 1,
0.1201539, -0.2789761, 5.023176, 1, 1, 1, 1, 1,
0.1206946, -0.650813, 4.017414, 1, 1, 1, 1, 1,
0.1238118, -0.5461763, 2.107147, 1, 1, 1, 1, 1,
0.1449884, -0.4892894, 2.155421, 1, 1, 1, 1, 1,
0.1482335, -0.4287727, 1.861886, 1, 1, 1, 1, 1,
0.1517708, 2.374182, 1.577382, 1, 1, 1, 1, 1,
0.1525934, -0.3363794, 0.796473, 1, 1, 1, 1, 1,
0.152695, -1.597232, 3.280192, 1, 1, 1, 1, 1,
0.1536303, 0.157083, 0.4426959, 1, 1, 1, 1, 1,
0.1538547, -0.3157551, 2.504153, 1, 1, 1, 1, 1,
0.1558306, 1.296532, -0.7758496, 1, 1, 1, 1, 1,
0.157116, 1.001998, 0.7906504, 1, 1, 1, 1, 1,
0.1638733, 2.903987, -0.3331354, 0, 0, 1, 1, 1,
0.1650461, -0.4974877, 3.216949, 1, 0, 0, 1, 1,
0.1680717, -1.110651, 2.081568, 1, 0, 0, 1, 1,
0.1706946, 0.415465, 0.3366231, 1, 0, 0, 1, 1,
0.1730783, -2.19355, 3.140375, 1, 0, 0, 1, 1,
0.174078, -0.824673, 2.802593, 1, 0, 0, 1, 1,
0.1872894, 1.191967, -0.532144, 0, 0, 0, 1, 1,
0.1908155, 0.1399452, 1.014641, 0, 0, 0, 1, 1,
0.1910441, -1.945993, 2.578502, 0, 0, 0, 1, 1,
0.194053, -0.3922817, 3.16704, 0, 0, 0, 1, 1,
0.1978544, 0.4489594, 1.435891, 0, 0, 0, 1, 1,
0.1991017, -1.343933, 2.192523, 0, 0, 0, 1, 1,
0.1995794, -0.5545523, 3.536054, 0, 0, 0, 1, 1,
0.2021183, 0.05114764, 1.611212, 1, 1, 1, 1, 1,
0.2090922, 0.2504806, 1.107318, 1, 1, 1, 1, 1,
0.2108528, -0.3744739, 3.329028, 1, 1, 1, 1, 1,
0.2141568, 0.4819229, -0.36186, 1, 1, 1, 1, 1,
0.2145114, -0.4800664, 1.692519, 1, 1, 1, 1, 1,
0.2214885, 0.158112, 0.141273, 1, 1, 1, 1, 1,
0.2286756, 0.6367252, 2.374207, 1, 1, 1, 1, 1,
0.2343119, -0.2877494, 2.61647, 1, 1, 1, 1, 1,
0.246693, -1.085936, 3.443916, 1, 1, 1, 1, 1,
0.2472512, 1.374781, -0.5834259, 1, 1, 1, 1, 1,
0.2496184, -1.655426, 2.615293, 1, 1, 1, 1, 1,
0.2502753, -1.427831, 2.672163, 1, 1, 1, 1, 1,
0.2512866, 0.6953593, 0.5701305, 1, 1, 1, 1, 1,
0.2578221, 0.965426, 0.3091186, 1, 1, 1, 1, 1,
0.2582245, 0.4102379, -0.6470932, 1, 1, 1, 1, 1,
0.2591732, -0.6968973, 3.662669, 0, 0, 1, 1, 1,
0.2610932, -0.7763141, 1.147258, 1, 0, 0, 1, 1,
0.263451, -0.2562763, 2.801773, 1, 0, 0, 1, 1,
0.2645831, 0.3527588, -0.9610918, 1, 0, 0, 1, 1,
0.2659809, 0.6243017, -0.6958741, 1, 0, 0, 1, 1,
0.2680245, -0.8604543, 3.367049, 1, 0, 0, 1, 1,
0.268678, -1.323382, 3.544685, 0, 0, 0, 1, 1,
0.2699057, 0.2097873, 1.301737, 0, 0, 0, 1, 1,
0.2710844, 1.902174, 0.9567195, 0, 0, 0, 1, 1,
0.2718619, 0.5307074, -0.2705788, 0, 0, 0, 1, 1,
0.2738084, -0.3089383, 2.07747, 0, 0, 0, 1, 1,
0.2744158, 1.745267, -0.09457041, 0, 0, 0, 1, 1,
0.2793808, 0.2533479, 2.400508, 0, 0, 0, 1, 1,
0.283613, 0.6374329, -1.117455, 1, 1, 1, 1, 1,
0.2848451, 0.9290245, -0.9080596, 1, 1, 1, 1, 1,
0.2902364, -0.2057874, 1.643661, 1, 1, 1, 1, 1,
0.2914064, -0.3279701, 3.311197, 1, 1, 1, 1, 1,
0.2952614, -0.387065, 0.9015145, 1, 1, 1, 1, 1,
0.29568, 0.8214875, -0.4545475, 1, 1, 1, 1, 1,
0.3010533, -1.702862, 3.892223, 1, 1, 1, 1, 1,
0.3014197, -0.8414025, 3.417879, 1, 1, 1, 1, 1,
0.302141, -0.287333, 2.986913, 1, 1, 1, 1, 1,
0.3057206, -0.6651982, 2.437864, 1, 1, 1, 1, 1,
0.3088556, -0.6694931, 1.922345, 1, 1, 1, 1, 1,
0.3088985, 0.5899568, 1.066977, 1, 1, 1, 1, 1,
0.3146011, -0.2513038, 3.292528, 1, 1, 1, 1, 1,
0.3166677, -0.5946609, 3.634449, 1, 1, 1, 1, 1,
0.3195502, -1.240094, 3.363617, 1, 1, 1, 1, 1,
0.3201019, -0.892715, 1.49831, 0, 0, 1, 1, 1,
0.3214568, 0.02362838, 1.809778, 1, 0, 0, 1, 1,
0.3274923, 0.3956714, 1.032085, 1, 0, 0, 1, 1,
0.3276937, 0.8957404, 0.1460559, 1, 0, 0, 1, 1,
0.3278904, 0.5610773, 0.808699, 1, 0, 0, 1, 1,
0.3296511, 1.52665, 1.164945, 1, 0, 0, 1, 1,
0.3403254, 0.4779446, 1.770229, 0, 0, 0, 1, 1,
0.3408653, 0.1004741, 1.804256, 0, 0, 0, 1, 1,
0.3427393, 0.4088483, 1.488195, 0, 0, 0, 1, 1,
0.3438478, -1.648904, 3.139477, 0, 0, 0, 1, 1,
0.3461947, -0.6057308, 2.941119, 0, 0, 0, 1, 1,
0.3501876, -0.3394091, -0.2239732, 0, 0, 0, 1, 1,
0.3506175, -1.375768, 1.5368, 0, 0, 0, 1, 1,
0.3554953, -0.008954413, 1.304319, 1, 1, 1, 1, 1,
0.3620999, 0.4743965, 0.7698569, 1, 1, 1, 1, 1,
0.3626927, 0.8706421, 1.150894, 1, 1, 1, 1, 1,
0.3634343, 0.1334729, 0.7740002, 1, 1, 1, 1, 1,
0.3661622, -0.2326737, 1.708923, 1, 1, 1, 1, 1,
0.3676853, 0.2534761, 0.2242521, 1, 1, 1, 1, 1,
0.3694853, 0.8591323, -1.207322, 1, 1, 1, 1, 1,
0.3749117, -1.700681, 2.058733, 1, 1, 1, 1, 1,
0.3935755, 0.9790913, -1.384826, 1, 1, 1, 1, 1,
0.3946549, -0.008999422, 1.202317, 1, 1, 1, 1, 1,
0.3952028, 0.1465166, 1.738058, 1, 1, 1, 1, 1,
0.3959731, 1.923067, 0.9612847, 1, 1, 1, 1, 1,
0.398706, -1.467955, 2.775584, 1, 1, 1, 1, 1,
0.3987124, 0.5610337, 1.961119, 1, 1, 1, 1, 1,
0.4016145, -0.473206, 0.4584937, 1, 1, 1, 1, 1,
0.4032251, 1.68967, -0.5207065, 0, 0, 1, 1, 1,
0.4034339, 0.7093601, 0.1403713, 1, 0, 0, 1, 1,
0.4046607, -0.02803291, 1.514158, 1, 0, 0, 1, 1,
0.4098904, 0.4218405, 1.46911, 1, 0, 0, 1, 1,
0.4100316, -0.7055263, 2.678762, 1, 0, 0, 1, 1,
0.415071, -0.7387918, 4.394621, 1, 0, 0, 1, 1,
0.4174697, -0.5775145, 2.734541, 0, 0, 0, 1, 1,
0.4185973, 2.026, 0.7664705, 0, 0, 0, 1, 1,
0.4195886, 0.153792, 0.3485691, 0, 0, 0, 1, 1,
0.4210706, 0.1565441, 0.8185775, 0, 0, 0, 1, 1,
0.4248799, 0.8821582, -1.588048, 0, 0, 0, 1, 1,
0.4273033, -0.8237097, 4.226559, 0, 0, 0, 1, 1,
0.4276941, 0.3419862, -0.8241399, 0, 0, 0, 1, 1,
0.4324972, -0.2845412, 1.35328, 1, 1, 1, 1, 1,
0.4379209, -0.2263924, 2.101754, 1, 1, 1, 1, 1,
0.4414304, 0.07535908, 0.795362, 1, 1, 1, 1, 1,
0.4419431, -0.5565116, 3.854415, 1, 1, 1, 1, 1,
0.4423877, 0.8202368, 2.334451, 1, 1, 1, 1, 1,
0.4477101, -1.665379, 1.330466, 1, 1, 1, 1, 1,
0.448183, 0.8805384, -0.7023513, 1, 1, 1, 1, 1,
0.4491106, 1.164967, 0.03922061, 1, 1, 1, 1, 1,
0.4552381, -0.2689354, 0.7526312, 1, 1, 1, 1, 1,
0.459758, -0.7149037, 1.676102, 1, 1, 1, 1, 1,
0.4609837, 1.749463, 0.0754941, 1, 1, 1, 1, 1,
0.4706915, 0.5805846, -0.06496231, 1, 1, 1, 1, 1,
0.4761145, -0.2881736, 2.116487, 1, 1, 1, 1, 1,
0.4796605, -0.530311, 1.173768, 1, 1, 1, 1, 1,
0.4798088, -1.378274, 1.214318, 1, 1, 1, 1, 1,
0.4805284, 0.4539992, 1.466308, 0, 0, 1, 1, 1,
0.4816254, 1.307722, 2.470472, 1, 0, 0, 1, 1,
0.484309, -0.8438837, 3.003358, 1, 0, 0, 1, 1,
0.4906452, -0.2577359, 3.217793, 1, 0, 0, 1, 1,
0.4911125, 0.5565261, 0.2089969, 1, 0, 0, 1, 1,
0.492324, 0.8980164, -0.1729237, 1, 0, 0, 1, 1,
0.4956861, -1.146459, 3.09531, 0, 0, 0, 1, 1,
0.5013318, -0.09539245, 2.632275, 0, 0, 0, 1, 1,
0.5018969, 0.1434943, 0.985731, 0, 0, 0, 1, 1,
0.5027161, 0.9420376, -0.5800422, 0, 0, 0, 1, 1,
0.5104289, 1.129229, 1.28793, 0, 0, 0, 1, 1,
0.5111344, 0.4782408, 0.3948486, 0, 0, 0, 1, 1,
0.5166434, 1.427131, -0.6136584, 0, 0, 0, 1, 1,
0.5172925, 1.673314, 0.8232109, 1, 1, 1, 1, 1,
0.5204429, -1.441204, 3.632119, 1, 1, 1, 1, 1,
0.5215176, -0.006507828, 2.055984, 1, 1, 1, 1, 1,
0.5237876, -0.02384684, 0.7978109, 1, 1, 1, 1, 1,
0.5248857, -0.284428, 1.889963, 1, 1, 1, 1, 1,
0.5251777, 0.3540385, 0.2376396, 1, 1, 1, 1, 1,
0.5266692, 0.7343706, -1.024329, 1, 1, 1, 1, 1,
0.5296377, 0.6192933, -0.26681, 1, 1, 1, 1, 1,
0.530524, -0.3868724, 3.210429, 1, 1, 1, 1, 1,
0.5328236, 0.2668086, 0.35017, 1, 1, 1, 1, 1,
0.5330257, 2.121497, 0.03356729, 1, 1, 1, 1, 1,
0.5336332, -1.382396, 2.754174, 1, 1, 1, 1, 1,
0.5368691, -2.120379, 2.604941, 1, 1, 1, 1, 1,
0.5373769, -1.050376, 5.294626, 1, 1, 1, 1, 1,
0.5407298, 0.5525994, 0.3004268, 1, 1, 1, 1, 1,
0.5420559, 1.370195, -0.6733666, 0, 0, 1, 1, 1,
0.543181, -0.6442726, 2.132206, 1, 0, 0, 1, 1,
0.5501296, 0.5557903, 1.317039, 1, 0, 0, 1, 1,
0.5546134, 0.8256003, 1.366053, 1, 0, 0, 1, 1,
0.5581535, 1.067664, -1.469858, 1, 0, 0, 1, 1,
0.5639191, -0.265301, 0.518891, 1, 0, 0, 1, 1,
0.5693036, 0.03661322, 2.584948, 0, 0, 0, 1, 1,
0.5709142, 0.08750921, 2.038025, 0, 0, 0, 1, 1,
0.5737965, -1.369029, 3.190114, 0, 0, 0, 1, 1,
0.5738571, -1.171153, 2.496838, 0, 0, 0, 1, 1,
0.5739984, -1.886071, 3.455399, 0, 0, 0, 1, 1,
0.5746399, 0.4186173, 1.081391, 0, 0, 0, 1, 1,
0.5781264, 0.149652, 2.618217, 0, 0, 0, 1, 1,
0.583003, -0.7776963, 3.015624, 1, 1, 1, 1, 1,
0.583519, 0.4496953, 0.54202, 1, 1, 1, 1, 1,
0.5859697, -0.4408451, 1.389685, 1, 1, 1, 1, 1,
0.586942, 1.128673, 0.4999878, 1, 1, 1, 1, 1,
0.5907678, -0.6895688, 1.551669, 1, 1, 1, 1, 1,
0.5972552, 0.6846474, 0.007361392, 1, 1, 1, 1, 1,
0.6049815, -1.071209, 3.037698, 1, 1, 1, 1, 1,
0.6090019, -3.436502, 0.8377439, 1, 1, 1, 1, 1,
0.6106161, -0.1311872, 1.817101, 1, 1, 1, 1, 1,
0.6115385, 0.5769045, 0.4935501, 1, 1, 1, 1, 1,
0.6145877, -0.5987134, 3.090948, 1, 1, 1, 1, 1,
0.6219495, 1.072692, 1.169851, 1, 1, 1, 1, 1,
0.6223118, -0.9502148, 4.719047, 1, 1, 1, 1, 1,
0.6250114, -0.7260244, 2.501507, 1, 1, 1, 1, 1,
0.62602, -0.478796, 2.727641, 1, 1, 1, 1, 1,
0.6289584, -0.3913158, 3.161268, 0, 0, 1, 1, 1,
0.6313179, -1.962243, 2.357313, 1, 0, 0, 1, 1,
0.6343001, 0.8222969, 0.5530692, 1, 0, 0, 1, 1,
0.6405935, 0.3388517, 1.144825, 1, 0, 0, 1, 1,
0.6423849, -0.5211787, 1.308223, 1, 0, 0, 1, 1,
0.6438151, -0.2841315, 3.093776, 1, 0, 0, 1, 1,
0.6494414, 0.7342932, 3.009336, 0, 0, 0, 1, 1,
0.6502343, 0.5241851, 1.658773, 0, 0, 0, 1, 1,
0.6511555, -0.1715454, 2.090452, 0, 0, 0, 1, 1,
0.6560956, 0.1997439, 0.827762, 0, 0, 0, 1, 1,
0.6723614, 0.1759819, 2.29794, 0, 0, 0, 1, 1,
0.6729771, -1.213911, 2.911638, 0, 0, 0, 1, 1,
0.6732869, 1.612867, -0.8888171, 0, 0, 0, 1, 1,
0.6763444, -0.0781228, 0.4422319, 1, 1, 1, 1, 1,
0.6794142, -0.1629422, 2.058783, 1, 1, 1, 1, 1,
0.6805148, -0.6414563, 3.190297, 1, 1, 1, 1, 1,
0.682152, 1.492461, 1.031345, 1, 1, 1, 1, 1,
0.6890289, 1.214102, -1.324581, 1, 1, 1, 1, 1,
0.6910017, 0.5609565, 1.721164, 1, 1, 1, 1, 1,
0.6959792, 0.6489984, -0.5529771, 1, 1, 1, 1, 1,
0.7012909, 0.08644911, 1.252964, 1, 1, 1, 1, 1,
0.7057524, -0.3411624, 0.822849, 1, 1, 1, 1, 1,
0.7076212, 0.9782969, -1.227305, 1, 1, 1, 1, 1,
0.7087681, 0.9600309, 0.6496235, 1, 1, 1, 1, 1,
0.7105516, -1.085675, 2.081409, 1, 1, 1, 1, 1,
0.7110956, -0.6266102, 3.782157, 1, 1, 1, 1, 1,
0.7183553, -1.036738, 1.466067, 1, 1, 1, 1, 1,
0.7198659, 0.5007057, -0.7036251, 1, 1, 1, 1, 1,
0.7314084, -0.693227, 1.853373, 0, 0, 1, 1, 1,
0.7328541, -0.207192, 0.8368647, 1, 0, 0, 1, 1,
0.7338734, -0.1314638, 2.293942, 1, 0, 0, 1, 1,
0.7385149, -1.216872, 3.80656, 1, 0, 0, 1, 1,
0.7390223, 0.917013, -0.1322906, 1, 0, 0, 1, 1,
0.7406463, 1.228775, 0.9431923, 1, 0, 0, 1, 1,
0.7426953, 0.8080115, 1.237707, 0, 0, 0, 1, 1,
0.7443153, 0.5694349, 0.6174217, 0, 0, 0, 1, 1,
0.7461857, 0.1472127, 1.979321, 0, 0, 0, 1, 1,
0.750459, 0.07749555, 0.2341833, 0, 0, 0, 1, 1,
0.7520837, 0.09154984, 2.376123, 0, 0, 0, 1, 1,
0.7616546, -0.1554017, 1.511291, 0, 0, 0, 1, 1,
0.7663745, -0.7059314, 3.087256, 0, 0, 0, 1, 1,
0.7668318, 0.50202, 1.676678, 1, 1, 1, 1, 1,
0.7671097, -0.9493495, 2.955818, 1, 1, 1, 1, 1,
0.7687864, 0.1255356, 1.95977, 1, 1, 1, 1, 1,
0.7710206, 0.5144486, 0.830763, 1, 1, 1, 1, 1,
0.779661, 0.5382412, 2.218568, 1, 1, 1, 1, 1,
0.783143, 0.7204642, -0.8661322, 1, 1, 1, 1, 1,
0.7875079, 0.3104846, -0.9465079, 1, 1, 1, 1, 1,
0.7887484, -0.5547578, 2.408075, 1, 1, 1, 1, 1,
0.7898073, 1.602359, -0.1491861, 1, 1, 1, 1, 1,
0.7904877, -0.538379, 2.589249, 1, 1, 1, 1, 1,
0.7912949, 0.159841, 3.778626, 1, 1, 1, 1, 1,
0.7924873, 0.4751816, 0.2989332, 1, 1, 1, 1, 1,
0.8016551, 1.987012, 2.442127, 1, 1, 1, 1, 1,
0.8142902, 0.05961053, 2.246536, 1, 1, 1, 1, 1,
0.8188223, 0.3496309, 1.479923, 1, 1, 1, 1, 1,
0.8194665, -0.2824602, 1.845568, 0, 0, 1, 1, 1,
0.8280576, -0.1979967, 2.886197, 1, 0, 0, 1, 1,
0.8335106, -1.1191, 1.651125, 1, 0, 0, 1, 1,
0.8340013, -0.1357388, 3.510561, 1, 0, 0, 1, 1,
0.8404955, 0.1583488, -1.27484, 1, 0, 0, 1, 1,
0.8434235, -0.1228069, 2.553765, 1, 0, 0, 1, 1,
0.8443578, -0.3506744, 3.175657, 0, 0, 0, 1, 1,
0.8459707, -0.02904319, 1.617695, 0, 0, 0, 1, 1,
0.8526479, -0.8143843, 1.599034, 0, 0, 0, 1, 1,
0.8587086, 0.4672159, 2.282436, 0, 0, 0, 1, 1,
0.8636081, -0.2454886, 1.070146, 0, 0, 0, 1, 1,
0.8669932, 0.6335194, 1.269054, 0, 0, 0, 1, 1,
0.86866, 1.648781, 0.8479405, 0, 0, 0, 1, 1,
0.8690863, -0.5666353, 1.988211, 1, 1, 1, 1, 1,
0.8808643, -0.091982, -0.419791, 1, 1, 1, 1, 1,
0.8822054, -1.7051, 2.214896, 1, 1, 1, 1, 1,
0.8831976, 1.624435, 1.486145, 1, 1, 1, 1, 1,
0.8877762, 0.6569891, 0.4448527, 1, 1, 1, 1, 1,
0.8898739, -0.06654321, 1.141116, 1, 1, 1, 1, 1,
0.8939963, -0.2496511, 2.371821, 1, 1, 1, 1, 1,
0.8979273, -0.08783627, 1.223141, 1, 1, 1, 1, 1,
0.9095259, -1.471405, 3.181355, 1, 1, 1, 1, 1,
0.9120479, -0.819208, 0.9988364, 1, 1, 1, 1, 1,
0.9151308, 0.6795456, 0.658703, 1, 1, 1, 1, 1,
0.9230245, -1.113629, 1.509104, 1, 1, 1, 1, 1,
0.9304459, 0.6745464, 0.02470047, 1, 1, 1, 1, 1,
0.9326501, 1.358494, 1.744594, 1, 1, 1, 1, 1,
0.9339356, 1.002344, 0.9639338, 1, 1, 1, 1, 1,
0.9390725, -1.161861, 1.851194, 0, 0, 1, 1, 1,
0.9436562, 0.5708691, 0.284546, 1, 0, 0, 1, 1,
0.9441618, 1.78935, 0.458774, 1, 0, 0, 1, 1,
0.9517469, -0.09542157, 1.366358, 1, 0, 0, 1, 1,
0.9532519, -0.7792597, 2.75203, 1, 0, 0, 1, 1,
0.9561241, 0.02636706, 2.533043, 1, 0, 0, 1, 1,
0.9636725, 0.8674643, 2.160738, 0, 0, 0, 1, 1,
0.9662022, -0.3436607, 0.5522671, 0, 0, 0, 1, 1,
0.9679586, 0.8274291, 1.652259, 0, 0, 0, 1, 1,
0.9717342, -0.4202922, 2.306883, 0, 0, 0, 1, 1,
0.9762197, 0.6345531, 1.733007, 0, 0, 0, 1, 1,
0.9763826, 2.049235, -0.4912682, 0, 0, 0, 1, 1,
0.9773064, -1.829184, 2.999866, 0, 0, 0, 1, 1,
0.9846618, -0.7127936, 2.858837, 1, 1, 1, 1, 1,
0.9927893, 0.2866352, -0.6287143, 1, 1, 1, 1, 1,
0.9932489, -0.3259137, 2.570463, 1, 1, 1, 1, 1,
0.9947464, 0.9004344, -0.4743109, 1, 1, 1, 1, 1,
1.002245, -0.5926666, 2.516991, 1, 1, 1, 1, 1,
1.004958, -0.05004057, 0.3421846, 1, 1, 1, 1, 1,
1.010881, 0.980871, 0.2687052, 1, 1, 1, 1, 1,
1.012352, -0.9629628, 1.393924, 1, 1, 1, 1, 1,
1.013713, 0.1189124, 2.537284, 1, 1, 1, 1, 1,
1.016203, 0.04142325, 0.4086015, 1, 1, 1, 1, 1,
1.019709, -0.7730917, 2.473618, 1, 1, 1, 1, 1,
1.022373, -1.002146, 2.316462, 1, 1, 1, 1, 1,
1.027746, -0.06594981, 1.919512, 1, 1, 1, 1, 1,
1.031012, -0.4458019, 1.332224, 1, 1, 1, 1, 1,
1.035372, 2.027633, -0.2531483, 1, 1, 1, 1, 1,
1.036279, -0.325311, 1.809577, 0, 0, 1, 1, 1,
1.050028, 0.4877063, 0.3944533, 1, 0, 0, 1, 1,
1.067088, 0.7864243, 0.4330461, 1, 0, 0, 1, 1,
1.07102, -0.1738382, 1.940663, 1, 0, 0, 1, 1,
1.0715, -0.3515159, 0.22265, 1, 0, 0, 1, 1,
1.072185, -0.9236386, 1.220257, 1, 0, 0, 1, 1,
1.082616, -0.9758241, 0.4597615, 0, 0, 0, 1, 1,
1.083138, 1.083984, 1.447375, 0, 0, 0, 1, 1,
1.089425, -0.5245749, 0.8788751, 0, 0, 0, 1, 1,
1.091789, 0.2349795, 0.294754, 0, 0, 0, 1, 1,
1.092061, -1.691456, 2.584566, 0, 0, 0, 1, 1,
1.092831, 0.002930347, 1.41639, 0, 0, 0, 1, 1,
1.09779, 0.8128194, 0.9182926, 0, 0, 0, 1, 1,
1.101272, 0.8127058, -0.2167057, 1, 1, 1, 1, 1,
1.105778, 1.31173, -1.070187, 1, 1, 1, 1, 1,
1.114922, -0.1841646, -0.7005939, 1, 1, 1, 1, 1,
1.11587, 1.124965, 1.285474, 1, 1, 1, 1, 1,
1.11927, -1.03138, 1.914075, 1, 1, 1, 1, 1,
1.120432, 0.1787572, 2.786579, 1, 1, 1, 1, 1,
1.123428, -0.3227205, 1.794165, 1, 1, 1, 1, 1,
1.132188, 0.7063746, 1.992632, 1, 1, 1, 1, 1,
1.134391, 0.6007874, 0.4219401, 1, 1, 1, 1, 1,
1.146045, -0.341729, 1.768884, 1, 1, 1, 1, 1,
1.156347, -1.275158, 3.324733, 1, 1, 1, 1, 1,
1.164646, -0.1088964, 1.425745, 1, 1, 1, 1, 1,
1.172078, -0.7649165, 2.05912, 1, 1, 1, 1, 1,
1.182073, -0.7070335, 2.804316, 1, 1, 1, 1, 1,
1.191937, 0.7250032, -0.2331196, 1, 1, 1, 1, 1,
1.197347, -1.596992, 0.6351637, 0, 0, 1, 1, 1,
1.198023, 0.6824871, 1.065788, 1, 0, 0, 1, 1,
1.199467, 0.011948, 2.187253, 1, 0, 0, 1, 1,
1.205305, 2.511995, 1.209776, 1, 0, 0, 1, 1,
1.208566, 0.2730279, -0.3478768, 1, 0, 0, 1, 1,
1.212244, 0.8568656, 0.4973409, 1, 0, 0, 1, 1,
1.215525, -0.02790698, 1.85794, 0, 0, 0, 1, 1,
1.216809, -0.702644, 0.09696709, 0, 0, 0, 1, 1,
1.223539, 1.658201, 0.2779265, 0, 0, 0, 1, 1,
1.224415, 0.264986, 1.333371, 0, 0, 0, 1, 1,
1.227282, 0.5866939, 1.58883, 0, 0, 0, 1, 1,
1.24467, -1.315643, 3.801286, 0, 0, 0, 1, 1,
1.252109, -0.6005593, 3.543198, 0, 0, 0, 1, 1,
1.266811, 1.530732, 0.7315336, 1, 1, 1, 1, 1,
1.270564, -0.2057327, 1.030466, 1, 1, 1, 1, 1,
1.295352, -0.4455215, 2.035144, 1, 1, 1, 1, 1,
1.295831, -1.713595, 2.878531, 1, 1, 1, 1, 1,
1.305311, -0.1527399, 0.1944135, 1, 1, 1, 1, 1,
1.318878, 0.3433133, 1.598717, 1, 1, 1, 1, 1,
1.320099, 1.009591, 0.4217036, 1, 1, 1, 1, 1,
1.326579, -0.168403, 1.577764, 1, 1, 1, 1, 1,
1.328627, 1.162874, 0.2739634, 1, 1, 1, 1, 1,
1.340545, -1.274816, 1.268803, 1, 1, 1, 1, 1,
1.35438, -0.7276394, 1.901942, 1, 1, 1, 1, 1,
1.354527, -1.315753, 2.726907, 1, 1, 1, 1, 1,
1.357654, -0.3634919, 2.115955, 1, 1, 1, 1, 1,
1.358151, 0.8398712, 1.01329, 1, 1, 1, 1, 1,
1.35866, -0.6622614, 2.09329, 1, 1, 1, 1, 1,
1.368118, -0.5517253, 2.683477, 0, 0, 1, 1, 1,
1.369628, -1.309616, 2.846709, 1, 0, 0, 1, 1,
1.376491, -0.2103523, 1.433103, 1, 0, 0, 1, 1,
1.378195, -0.3210742, 2.412573, 1, 0, 0, 1, 1,
1.380587, 0.07406593, 1.773219, 1, 0, 0, 1, 1,
1.383019, -0.3528395, 2.420133, 1, 0, 0, 1, 1,
1.387198, -0.6291127, 2.677207, 0, 0, 0, 1, 1,
1.392747, 0.5557633, 1.104752, 0, 0, 0, 1, 1,
1.39319, 0.1068623, 1.30226, 0, 0, 0, 1, 1,
1.394957, 1.493413, 0.4287049, 0, 0, 0, 1, 1,
1.398577, -1.481537, 2.607952, 0, 0, 0, 1, 1,
1.399642, -0.2245613, 1.537819, 0, 0, 0, 1, 1,
1.403103, -0.9309667, 2.238816, 0, 0, 0, 1, 1,
1.408171, 0.3578802, 1.212539, 1, 1, 1, 1, 1,
1.410295, -0.795197, 2.621902, 1, 1, 1, 1, 1,
1.411416, 0.1730775, 0.7857145, 1, 1, 1, 1, 1,
1.424582, 0.8571348, 3.340665, 1, 1, 1, 1, 1,
1.425679, 0.3964045, -0.1127526, 1, 1, 1, 1, 1,
1.440475, 1.288798, 1.905996, 1, 1, 1, 1, 1,
1.457722, 1.147407, 0.4875084, 1, 1, 1, 1, 1,
1.471025, 1.61897, -0.2850389, 1, 1, 1, 1, 1,
1.473307, -1.657936, 4.067875, 1, 1, 1, 1, 1,
1.473477, 0.4475122, 1.566143, 1, 1, 1, 1, 1,
1.476819, 1.748774, -0.4662614, 1, 1, 1, 1, 1,
1.479982, -1.786501, 3.323827, 1, 1, 1, 1, 1,
1.490511, 1.314837, 2.475792, 1, 1, 1, 1, 1,
1.491408, 1.984876, 1.127277, 1, 1, 1, 1, 1,
1.492546, -1.474568, 3.554318, 1, 1, 1, 1, 1,
1.493835, -0.2194891, 1.686776, 0, 0, 1, 1, 1,
1.494478, 1.264334, 1.124244, 1, 0, 0, 1, 1,
1.498884, 0.473996, 2.346969, 1, 0, 0, 1, 1,
1.499025, 0.279595, 2.582721, 1, 0, 0, 1, 1,
1.512184, 1.437065, -0.2175515, 1, 0, 0, 1, 1,
1.515194, -1.787037, 1.939242, 1, 0, 0, 1, 1,
1.520885, -0.09868903, 1.974577, 0, 0, 0, 1, 1,
1.532599, -0.2903474, 3.622868, 0, 0, 0, 1, 1,
1.545829, 0.2583846, 1.890391, 0, 0, 0, 1, 1,
1.549274, -1.299926, 1.214946, 0, 0, 0, 1, 1,
1.572771, -0.2505079, 1.166221, 0, 0, 0, 1, 1,
1.57597, 0.7339206, 1.753208, 0, 0, 0, 1, 1,
1.581954, 0.6400911, 1.144452, 0, 0, 0, 1, 1,
1.586731, -0.3665667, 2.080775, 1, 1, 1, 1, 1,
1.590093, 1.870053, 0.970918, 1, 1, 1, 1, 1,
1.601561, -0.7350258, 3.888512, 1, 1, 1, 1, 1,
1.615107, 2.600713, 0.965706, 1, 1, 1, 1, 1,
1.619179, 0.02743313, 2.689512, 1, 1, 1, 1, 1,
1.624461, -0.8289905, 2.810245, 1, 1, 1, 1, 1,
1.629193, 0.3868624, 2.062226, 1, 1, 1, 1, 1,
1.629979, 0.7020561, 0.7045995, 1, 1, 1, 1, 1,
1.638737, 0.8900835, 1.832028, 1, 1, 1, 1, 1,
1.64731, -1.480863, 0.5074604, 1, 1, 1, 1, 1,
1.651909, 0.6438936, 1.192723, 1, 1, 1, 1, 1,
1.653982, 0.5767753, 1.13907, 1, 1, 1, 1, 1,
1.655658, 0.1437264, 1.422844, 1, 1, 1, 1, 1,
1.680721, -0.4911385, 1.751177, 1, 1, 1, 1, 1,
1.692207, 0.4285232, 1.782838, 1, 1, 1, 1, 1,
1.708409, 0.5607458, 0.5780515, 0, 0, 1, 1, 1,
1.711494, -0.428113, 3.05158, 1, 0, 0, 1, 1,
1.735445, 0.08764831, 1.442896, 1, 0, 0, 1, 1,
1.741386, -1.573756, 2.031658, 1, 0, 0, 1, 1,
1.741681, -0.07205318, 2.78829, 1, 0, 0, 1, 1,
1.747353, 0.7246801, 1.20734, 1, 0, 0, 1, 1,
1.753018, -0.4691367, 1.019145, 0, 0, 0, 1, 1,
1.770925, 0.3502225, 0.0006132676, 0, 0, 0, 1, 1,
1.808782, 0.3872105, 1.407076, 0, 0, 0, 1, 1,
1.809682, -0.0719225, 3.285842, 0, 0, 0, 1, 1,
1.826787, -0.04153134, 1.168939, 0, 0, 0, 1, 1,
1.830308, 0.3153472, 1.506603, 0, 0, 0, 1, 1,
1.830942, 0.180034, 0.4510783, 0, 0, 0, 1, 1,
1.865841, 0.2863653, 2.711161, 1, 1, 1, 1, 1,
1.871524, -2.15019, 3.321359, 1, 1, 1, 1, 1,
1.871524, -0.1697085, 0.6304159, 1, 1, 1, 1, 1,
1.879341, 0.4490026, 0.2805658, 1, 1, 1, 1, 1,
1.892813, -0.3447706, 0.9700128, 1, 1, 1, 1, 1,
1.894604, -0.5975618, 1.364817, 1, 1, 1, 1, 1,
1.94676, -1.536395, 1.286876, 1, 1, 1, 1, 1,
1.963347, 0.1127128, 2.334876, 1, 1, 1, 1, 1,
1.982469, -1.679453, 2.213086, 1, 1, 1, 1, 1,
2.004954, 1.035701, 2.664095, 1, 1, 1, 1, 1,
2.013517, -0.6435965, 2.810088, 1, 1, 1, 1, 1,
2.018912, 0.1100632, 2.208144, 1, 1, 1, 1, 1,
2.042045, 0.1672582, 2.725888, 1, 1, 1, 1, 1,
2.055304, 0.288146, 1.491565, 1, 1, 1, 1, 1,
2.064426, 0.4491715, 1.954569, 1, 1, 1, 1, 1,
2.112733, 1.01528, 0.965582, 0, 0, 1, 1, 1,
2.136346, -0.06023496, 0.4999261, 1, 0, 0, 1, 1,
2.157663, 0.9582347, 1.046095, 1, 0, 0, 1, 1,
2.189513, -0.195833, 3.701157, 1, 0, 0, 1, 1,
2.23078, 0.4561884, 0.2337947, 1, 0, 0, 1, 1,
2.281349, -1.098545, 2.505437, 1, 0, 0, 1, 1,
2.292996, -0.3961652, 1.946237, 0, 0, 0, 1, 1,
2.339727, -0.4483112, 0.2688521, 0, 0, 0, 1, 1,
2.349158, 1.086111, 0.5890924, 0, 0, 0, 1, 1,
2.377153, 0.6172001, 0.4923334, 0, 0, 0, 1, 1,
2.402071, 0.2741107, 2.587356, 0, 0, 0, 1, 1,
2.444561, -0.5678697, 0.6384375, 0, 0, 0, 1, 1,
2.449945, -0.8876259, 1.042283, 0, 0, 0, 1, 1,
2.465958, -0.2869616, 1.752156, 1, 1, 1, 1, 1,
2.515819, -0.9138852, 1.352591, 1, 1, 1, 1, 1,
2.646993, 0.6938325, 2.293579, 1, 1, 1, 1, 1,
2.694122, -2.178761, 2.560773, 1, 1, 1, 1, 1,
2.777007, -1.324919, 1.063797, 1, 1, 1, 1, 1,
3.006918, 0.8461679, 0.5233441, 1, 1, 1, 1, 1,
3.104188, 0.3953262, 1.18888, 1, 1, 1, 1, 1
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
var radius = 10.02635;
var distance = 35.21713;
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
mvMatrix.translate( 0.09200716, 0.266257, 0.6394753 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.21713);
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
