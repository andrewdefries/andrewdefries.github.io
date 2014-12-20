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
-2.995625, 1.549091, -0.7407697, 1, 0, 0, 1,
-2.548177, -0.2872045, -3.1952, 1, 0.007843138, 0, 1,
-2.490865, 1.664325, -1.325359, 1, 0.01176471, 0, 1,
-2.487939, 0.6973689, -1.144584, 1, 0.01960784, 0, 1,
-2.466377, 0.0985114, -3.381637, 1, 0.02352941, 0, 1,
-2.421191, -0.03376441, -1.128663, 1, 0.03137255, 0, 1,
-2.39862, -0.3739136, -0.6726912, 1, 0.03529412, 0, 1,
-2.378105, -1.531575, -3.552176, 1, 0.04313726, 0, 1,
-2.362057, -0.7890696, -2.59471, 1, 0.04705882, 0, 1,
-2.352705, -0.9254083, -1.931411, 1, 0.05490196, 0, 1,
-2.323329, -1.01836, -0.3845548, 1, 0.05882353, 0, 1,
-2.274429, -1.624026, -2.468163, 1, 0.06666667, 0, 1,
-2.267888, -0.3487487, -2.555902, 1, 0.07058824, 0, 1,
-2.214006, -0.8891886, -2.836383, 1, 0.07843138, 0, 1,
-2.187945, -0.5806201, -0.9069905, 1, 0.08235294, 0, 1,
-2.168963, 1.564012, -1.105268, 1, 0.09019608, 0, 1,
-2.165416, -0.6211501, -1.659501, 1, 0.09411765, 0, 1,
-2.096345, 1.904995, -1.629976, 1, 0.1019608, 0, 1,
-2.087758, 2.120408, -0.7423168, 1, 0.1098039, 0, 1,
-2.070072, -1.084556, -1.789776, 1, 0.1137255, 0, 1,
-2.058083, 0.2332694, -2.760749, 1, 0.1215686, 0, 1,
-2.014383, -0.9206967, -2.228161, 1, 0.1254902, 0, 1,
-1.96722, 0.9162838, -2.059793, 1, 0.1333333, 0, 1,
-1.960679, 0.2178904, -1.867951, 1, 0.1372549, 0, 1,
-1.91035, 0.168816, 0.4974138, 1, 0.145098, 0, 1,
-1.875673, -1.089989, -0.642044, 1, 0.1490196, 0, 1,
-1.865419, -0.4223791, -1.31847, 1, 0.1568628, 0, 1,
-1.863451, -0.406942, -1.790013, 1, 0.1607843, 0, 1,
-1.845049, -0.2747242, 0.4794143, 1, 0.1686275, 0, 1,
-1.843024, 0.6974659, -1.175628, 1, 0.172549, 0, 1,
-1.828637, -0.6427631, 0.5920497, 1, 0.1803922, 0, 1,
-1.827128, 1.523301, 0.1409883, 1, 0.1843137, 0, 1,
-1.791936, -0.4541861, -3.056304, 1, 0.1921569, 0, 1,
-1.771045, -0.2209409, -2.476379, 1, 0.1960784, 0, 1,
-1.768007, 0.5325466, -2.204466, 1, 0.2039216, 0, 1,
-1.753333, 0.3655299, -1.924205, 1, 0.2117647, 0, 1,
-1.725704, 1.195742, 0.7481427, 1, 0.2156863, 0, 1,
-1.6914, 0.9680442, 0.04359072, 1, 0.2235294, 0, 1,
-1.679501, -0.2246641, -1.894209, 1, 0.227451, 0, 1,
-1.673496, 0.1960299, -0.8692202, 1, 0.2352941, 0, 1,
-1.664325, 1.296977, -1.861156, 1, 0.2392157, 0, 1,
-1.638666, 0.8257996, -0.7262578, 1, 0.2470588, 0, 1,
-1.636373, 1.131811, -2.081945, 1, 0.2509804, 0, 1,
-1.632795, 0.3637144, -3.091468, 1, 0.2588235, 0, 1,
-1.627309, 0.1742473, -2.671675, 1, 0.2627451, 0, 1,
-1.610801, 0.8402303, -0.1961141, 1, 0.2705882, 0, 1,
-1.590658, 1.603368, -1.375013, 1, 0.2745098, 0, 1,
-1.573545, 0.2298207, -3.166761, 1, 0.282353, 0, 1,
-1.572114, 0.2845597, -1.933848, 1, 0.2862745, 0, 1,
-1.534621, 0.7529367, -3.342587, 1, 0.2941177, 0, 1,
-1.524649, 0.4653176, -1.480003, 1, 0.3019608, 0, 1,
-1.498205, -0.6737586, -1.063543, 1, 0.3058824, 0, 1,
-1.492929, -0.08199721, 0.06320331, 1, 0.3137255, 0, 1,
-1.486248, -0.9450823, -4.389597, 1, 0.3176471, 0, 1,
-1.484555, 1.344452, 0.6764954, 1, 0.3254902, 0, 1,
-1.483884, -0.009977003, -1.941246, 1, 0.3294118, 0, 1,
-1.47245, -2.119059, -3.079454, 1, 0.3372549, 0, 1,
-1.463031, 1.222693, -0.9131569, 1, 0.3411765, 0, 1,
-1.462266, -0.1142354, 0.166118, 1, 0.3490196, 0, 1,
-1.461701, -0.6880893, -1.260918, 1, 0.3529412, 0, 1,
-1.444488, -0.5964408, -3.138722, 1, 0.3607843, 0, 1,
-1.426656, -0.2088791, -3.013498, 1, 0.3647059, 0, 1,
-1.422696, -0.6223774, -2.505193, 1, 0.372549, 0, 1,
-1.422549, -0.3793266, -1.904387, 1, 0.3764706, 0, 1,
-1.413775, 1.237947, -2.15663, 1, 0.3843137, 0, 1,
-1.402532, 0.3879454, -1.773345, 1, 0.3882353, 0, 1,
-1.39787, -2.481156, -2.617685, 1, 0.3960784, 0, 1,
-1.39489, -0.7825872, -1.875785, 1, 0.4039216, 0, 1,
-1.39388, -1.130596, -1.847065, 1, 0.4078431, 0, 1,
-1.389158, -1.056796, -3.602102, 1, 0.4156863, 0, 1,
-1.389022, 1.785427, -0.5064451, 1, 0.4196078, 0, 1,
-1.379745, -1.082723, -2.495956, 1, 0.427451, 0, 1,
-1.379481, 1.423689, -1.390483, 1, 0.4313726, 0, 1,
-1.375512, -1.576497, -4.370554, 1, 0.4392157, 0, 1,
-1.37153, 0.06080079, -2.342904, 1, 0.4431373, 0, 1,
-1.367115, -1.031833, -0.823112, 1, 0.4509804, 0, 1,
-1.363345, -0.3118391, -2.126662, 1, 0.454902, 0, 1,
-1.357665, -1.292771, -3.033378, 1, 0.4627451, 0, 1,
-1.357524, -0.9417851, -1.797982, 1, 0.4666667, 0, 1,
-1.356381, -0.07964557, -1.978271, 1, 0.4745098, 0, 1,
-1.350658, -0.6005284, -0.517664, 1, 0.4784314, 0, 1,
-1.348365, 0.551249, -1.239325, 1, 0.4862745, 0, 1,
-1.344002, -0.1115507, 1.025948, 1, 0.4901961, 0, 1,
-1.34269, 0.4489988, -1.463345, 1, 0.4980392, 0, 1,
-1.33657, 1.110137, -1.220408, 1, 0.5058824, 0, 1,
-1.334216, 0.6199393, -1.758489, 1, 0.509804, 0, 1,
-1.33289, -0.6165553, -2.698525, 1, 0.5176471, 0, 1,
-1.315711, -0.6655715, -0.2718856, 1, 0.5215687, 0, 1,
-1.304632, -2.705736, -3.805993, 1, 0.5294118, 0, 1,
-1.296116, -1.06266, -2.744688, 1, 0.5333334, 0, 1,
-1.279563, -1.20253, -3.698176, 1, 0.5411765, 0, 1,
-1.270959, -0.5990865, -2.522645, 1, 0.5450981, 0, 1,
-1.270813, -0.6033227, -1.626675, 1, 0.5529412, 0, 1,
-1.258398, -0.6706183, -5.443572, 1, 0.5568628, 0, 1,
-1.257346, 0.5425531, -0.8743864, 1, 0.5647059, 0, 1,
-1.256716, 0.6185309, -2.299862, 1, 0.5686275, 0, 1,
-1.251055, 0.2482238, -2.598946, 1, 0.5764706, 0, 1,
-1.243776, 0.1007149, -0.8851944, 1, 0.5803922, 0, 1,
-1.242485, -0.1500239, -1.739735, 1, 0.5882353, 0, 1,
-1.228017, 0.2023535, 0.08867442, 1, 0.5921569, 0, 1,
-1.2235, 2.526151, -0.03589706, 1, 0.6, 0, 1,
-1.222523, -0.8511082, -2.274183, 1, 0.6078432, 0, 1,
-1.222171, 1.600078, -0.8421615, 1, 0.6117647, 0, 1,
-1.220276, 1.172292, -1.611402, 1, 0.6196079, 0, 1,
-1.217928, -0.8641647, -2.436354, 1, 0.6235294, 0, 1,
-1.215433, -0.7333984, -2.529172, 1, 0.6313726, 0, 1,
-1.21248, -0.4154209, -1.968313, 1, 0.6352941, 0, 1,
-1.20609, 1.295229, 0.4581302, 1, 0.6431373, 0, 1,
-1.203822, 1.3941, -0.2152895, 1, 0.6470588, 0, 1,
-1.200536, 1.891484, -0.3384497, 1, 0.654902, 0, 1,
-1.19004, -0.1596217, 0.2234575, 1, 0.6588235, 0, 1,
-1.184608, 2.325562, 0.06109414, 1, 0.6666667, 0, 1,
-1.177042, -0.2834889, -2.633084, 1, 0.6705883, 0, 1,
-1.172437, 1.237045, -1.254851, 1, 0.6784314, 0, 1,
-1.169794, -0.2891596, -3.024431, 1, 0.682353, 0, 1,
-1.165832, 0.1822746, -0.4497347, 1, 0.6901961, 0, 1,
-1.153774, 0.5600691, -2.214994, 1, 0.6941177, 0, 1,
-1.15302, -0.03972635, -1.893995, 1, 0.7019608, 0, 1,
-1.150415, -0.3193195, -1.489829, 1, 0.7098039, 0, 1,
-1.14723, 0.03928731, -1.811397, 1, 0.7137255, 0, 1,
-1.138021, -0.03488406, 0.4873968, 1, 0.7215686, 0, 1,
-1.134034, 0.5404028, -3.606656, 1, 0.7254902, 0, 1,
-1.12613, -1.178095, -1.556949, 1, 0.7333333, 0, 1,
-1.121363, -1.022989, -3.67103, 1, 0.7372549, 0, 1,
-1.120496, -0.540924, -0.9907061, 1, 0.7450981, 0, 1,
-1.120033, 0.1260423, -3.157244, 1, 0.7490196, 0, 1,
-1.108326, -2.045802, -1.988269, 1, 0.7568628, 0, 1,
-1.103356, 0.8738576, -1.056846, 1, 0.7607843, 0, 1,
-1.090744, 0.8064097, -0.278303, 1, 0.7686275, 0, 1,
-1.085401, -1.036209, -3.540499, 1, 0.772549, 0, 1,
-1.080657, -1.176532, -3.106433, 1, 0.7803922, 0, 1,
-1.075362, -2.898694, -2.633289, 1, 0.7843137, 0, 1,
-1.072245, 0.2545899, -0.9217367, 1, 0.7921569, 0, 1,
-1.067609, 0.602316, -0.967877, 1, 0.7960784, 0, 1,
-1.066863, 0.5838661, -0.8006545, 1, 0.8039216, 0, 1,
-1.064682, -0.4877448, -2.178141, 1, 0.8117647, 0, 1,
-1.060861, 0.422677, -0.5753552, 1, 0.8156863, 0, 1,
-1.060093, 0.7298838, -3.131883, 1, 0.8235294, 0, 1,
-1.058287, 0.3126362, 0.1736723, 1, 0.827451, 0, 1,
-1.051151, 0.168671, -1.473456, 1, 0.8352941, 0, 1,
-1.045126, -0.6037316, -1.994406, 1, 0.8392157, 0, 1,
-1.037078, -0.2618531, -1.323982, 1, 0.8470588, 0, 1,
-1.024736, 0.8184377, -0.1807697, 1, 0.8509804, 0, 1,
-1.021159, -1.195406, -2.575335, 1, 0.8588235, 0, 1,
-1.021001, 2.431705, -0.8997598, 1, 0.8627451, 0, 1,
-1.011301, -1.336004, -2.649147, 1, 0.8705882, 0, 1,
-1.010666, 1.568332, -0.03849773, 1, 0.8745098, 0, 1,
-1.003189, -0.759883, -2.744604, 1, 0.8823529, 0, 1,
-1.001007, 1.342546, -0.3118508, 1, 0.8862745, 0, 1,
-0.9986501, -2.037472, -3.823238, 1, 0.8941177, 0, 1,
-0.9983349, -1.896982, -3.592844, 1, 0.8980392, 0, 1,
-0.9936901, 1.015089, -0.5302166, 1, 0.9058824, 0, 1,
-0.9916111, -0.5958165, -0.1428628, 1, 0.9137255, 0, 1,
-0.9898775, -0.5267, -2.355565, 1, 0.9176471, 0, 1,
-0.9879452, 1.248634, -1.199365, 1, 0.9254902, 0, 1,
-0.9874564, 0.414093, -0.2484573, 1, 0.9294118, 0, 1,
-0.9839553, 2.300095, 0.750133, 1, 0.9372549, 0, 1,
-0.9701986, -0.5072629, -3.728474, 1, 0.9411765, 0, 1,
-0.9662641, -0.9357377, -1.274028, 1, 0.9490196, 0, 1,
-0.9618111, 0.4942578, -3.215021, 1, 0.9529412, 0, 1,
-0.9610118, -1.264335, -2.901994, 1, 0.9607843, 0, 1,
-0.9592938, 1.086679, -0.5997542, 1, 0.9647059, 0, 1,
-0.9584376, -0.1951488, -1.125328, 1, 0.972549, 0, 1,
-0.951423, -1.724446, -2.983567, 1, 0.9764706, 0, 1,
-0.940682, 0.3608025, -0.5024492, 1, 0.9843137, 0, 1,
-0.9323647, 0.1633935, -0.8538221, 1, 0.9882353, 0, 1,
-0.9256921, -1.322106, -2.874441, 1, 0.9960784, 0, 1,
-0.9200433, -0.8117636, -2.222975, 0.9960784, 1, 0, 1,
-0.9144973, 0.4453127, 0.07668115, 0.9921569, 1, 0, 1,
-0.9144377, -0.827635, -3.41388, 0.9843137, 1, 0, 1,
-0.9125043, 0.9590449, -0.8792834, 0.9803922, 1, 0, 1,
-0.9107732, 0.6114584, -1.146253, 0.972549, 1, 0, 1,
-0.9067524, -0.9604009, -3.180362, 0.9686275, 1, 0, 1,
-0.9058729, -0.06936571, -1.11713, 0.9607843, 1, 0, 1,
-0.9035525, 1.70547, -0.7077981, 0.9568627, 1, 0, 1,
-0.9014468, -2.553914, -3.864354, 0.9490196, 1, 0, 1,
-0.8995273, -1.191147, -1.579852, 0.945098, 1, 0, 1,
-0.8903975, 0.3459475, -2.172754, 0.9372549, 1, 0, 1,
-0.88841, 1.404465, 0.4900467, 0.9333333, 1, 0, 1,
-0.8863302, 0.6661074, -1.633018, 0.9254902, 1, 0, 1,
-0.873353, 0.7553087, -2.79333, 0.9215686, 1, 0, 1,
-0.8706991, -0.2643796, 0.3812408, 0.9137255, 1, 0, 1,
-0.8705269, 1.245797, -1.041706, 0.9098039, 1, 0, 1,
-0.8685434, 0.9231378, -0.963553, 0.9019608, 1, 0, 1,
-0.8580412, -0.8012367, -3.255692, 0.8941177, 1, 0, 1,
-0.8513491, 0.4207872, -1.291498, 0.8901961, 1, 0, 1,
-0.8506847, -0.2018343, -1.863962, 0.8823529, 1, 0, 1,
-0.8459889, 0.3837515, -1.444542, 0.8784314, 1, 0, 1,
-0.8413697, -0.9789285, -3.856301, 0.8705882, 1, 0, 1,
-0.8404847, -1.389701, -2.456091, 0.8666667, 1, 0, 1,
-0.8380492, -0.1506179, -3.834217, 0.8588235, 1, 0, 1,
-0.8373132, -0.887618, -3.044177, 0.854902, 1, 0, 1,
-0.8328035, 1.115695, -0.6359603, 0.8470588, 1, 0, 1,
-0.8315105, -2.12008, -4.55807, 0.8431373, 1, 0, 1,
-0.8255737, -1.359019, -1.900464, 0.8352941, 1, 0, 1,
-0.8247032, 0.2811886, -0.5350851, 0.8313726, 1, 0, 1,
-0.8165811, -1.395073, -3.675602, 0.8235294, 1, 0, 1,
-0.8156938, -2.266417, -1.685947, 0.8196079, 1, 0, 1,
-0.8147098, 0.5166044, -1.625713, 0.8117647, 1, 0, 1,
-0.8131188, -0.06724047, -2.348191, 0.8078431, 1, 0, 1,
-0.8105653, -1.150082, -0.5123096, 0.8, 1, 0, 1,
-0.8093109, 0.1573988, -0.04702298, 0.7921569, 1, 0, 1,
-0.8054352, 0.8567953, -1.434825, 0.7882353, 1, 0, 1,
-0.8019049, 0.7712892, -1.233482, 0.7803922, 1, 0, 1,
-0.7984582, 0.1749526, -1.017058, 0.7764706, 1, 0, 1,
-0.7946953, 0.5689841, -0.9251226, 0.7686275, 1, 0, 1,
-0.7879867, 1.537146, -0.2830669, 0.7647059, 1, 0, 1,
-0.7856581, -0.03487039, -0.3479747, 0.7568628, 1, 0, 1,
-0.7854715, -0.3385333, -1.978649, 0.7529412, 1, 0, 1,
-0.7764282, -0.2603611, -1.131849, 0.7450981, 1, 0, 1,
-0.7744454, 1.167567, -1.493664, 0.7411765, 1, 0, 1,
-0.7707044, -0.660665, -1.59294, 0.7333333, 1, 0, 1,
-0.7675843, 0.75155, -1.460897, 0.7294118, 1, 0, 1,
-0.766681, -0.1373115, -0.3651188, 0.7215686, 1, 0, 1,
-0.7665772, -0.3392095, -2.403733, 0.7176471, 1, 0, 1,
-0.7653544, -1.928619, -3.71279, 0.7098039, 1, 0, 1,
-0.7644474, -1.791116, -3.625146, 0.7058824, 1, 0, 1,
-0.7637411, 1.324161, 0.7167042, 0.6980392, 1, 0, 1,
-0.7623498, -0.4730026, -1.085431, 0.6901961, 1, 0, 1,
-0.7586274, 1.232909, -0.03130858, 0.6862745, 1, 0, 1,
-0.7550964, 0.6318704, 0.5597185, 0.6784314, 1, 0, 1,
-0.7523813, -0.1818098, -1.999452, 0.6745098, 1, 0, 1,
-0.7514529, 0.236971, -1.459882, 0.6666667, 1, 0, 1,
-0.7508585, 1.187761, 0.2853172, 0.6627451, 1, 0, 1,
-0.7480626, 0.2641617, -1.45089, 0.654902, 1, 0, 1,
-0.7477676, 0.4680961, 0.5914132, 0.6509804, 1, 0, 1,
-0.7340438, -0.2419704, -2.006112, 0.6431373, 1, 0, 1,
-0.7323939, 0.1018988, -2.113224, 0.6392157, 1, 0, 1,
-0.725799, -2.124399, -1.9204, 0.6313726, 1, 0, 1,
-0.7187956, 1.088017, -1.409234, 0.627451, 1, 0, 1,
-0.7186079, -1.782477, -2.714819, 0.6196079, 1, 0, 1,
-0.7185212, 0.7310316, -1.76741, 0.6156863, 1, 0, 1,
-0.7181476, 0.3231419, -1.491434, 0.6078432, 1, 0, 1,
-0.7143613, -1.923249, -1.961768, 0.6039216, 1, 0, 1,
-0.7062393, -0.19712, -0.4217522, 0.5960785, 1, 0, 1,
-0.7003109, -0.3473862, -2.307565, 0.5882353, 1, 0, 1,
-0.6977762, 0.04904483, -1.803519, 0.5843138, 1, 0, 1,
-0.6948057, -0.4705061, -3.572652, 0.5764706, 1, 0, 1,
-0.6897762, 0.6884344, 0.4879394, 0.572549, 1, 0, 1,
-0.6876266, -2.058939, -1.365828, 0.5647059, 1, 0, 1,
-0.6840634, 0.4481305, -2.154201, 0.5607843, 1, 0, 1,
-0.6834272, -0.8196002, -1.687473, 0.5529412, 1, 0, 1,
-0.6809649, -0.5629674, -2.526589, 0.5490196, 1, 0, 1,
-0.6797944, -1.184226, -4.218241, 0.5411765, 1, 0, 1,
-0.674041, 0.2801978, -1.884546, 0.5372549, 1, 0, 1,
-0.6705638, 0.2515861, -0.5521155, 0.5294118, 1, 0, 1,
-0.6681697, -0.6342025, -1.347438, 0.5254902, 1, 0, 1,
-0.6595503, -1.088296, -3.239792, 0.5176471, 1, 0, 1,
-0.6549982, -1.455541, -3.634199, 0.5137255, 1, 0, 1,
-0.6546571, 0.2925915, 0.005144116, 0.5058824, 1, 0, 1,
-0.6528347, 1.317896, 0.2485929, 0.5019608, 1, 0, 1,
-0.6478585, -1.716857, -1.966889, 0.4941176, 1, 0, 1,
-0.6474796, -1.484812, -3.605378, 0.4862745, 1, 0, 1,
-0.6420344, -1.808343, -3.208134, 0.4823529, 1, 0, 1,
-0.6382468, 0.8410287, -1.396108, 0.4745098, 1, 0, 1,
-0.6380336, 1.156258, 1.042088, 0.4705882, 1, 0, 1,
-0.6378394, 0.2280078, -2.839877, 0.4627451, 1, 0, 1,
-0.6356142, -0.4822435, 0.3376785, 0.4588235, 1, 0, 1,
-0.634571, 0.7394815, -0.3138117, 0.4509804, 1, 0, 1,
-0.6342057, 1.576902, 0.4520614, 0.4470588, 1, 0, 1,
-0.6332294, 1.390195, -0.4875658, 0.4392157, 1, 0, 1,
-0.6298832, -0.3497257, -2.262187, 0.4352941, 1, 0, 1,
-0.6293182, 1.144437, 0.83209, 0.427451, 1, 0, 1,
-0.626557, 0.3467014, -1.471513, 0.4235294, 1, 0, 1,
-0.6193367, -1.678779, -5.063812, 0.4156863, 1, 0, 1,
-0.6183745, -0.7321383, -0.3723817, 0.4117647, 1, 0, 1,
-0.6103038, -0.2553621, -1.437057, 0.4039216, 1, 0, 1,
-0.6089633, 0.5320733, -1.775633, 0.3960784, 1, 0, 1,
-0.6082374, -1.075545, -3.708225, 0.3921569, 1, 0, 1,
-0.6063413, 0.864614, 0.1494445, 0.3843137, 1, 0, 1,
-0.6042014, 0.5395129, -2.081021, 0.3803922, 1, 0, 1,
-0.60141, 1.482525, 0.1569023, 0.372549, 1, 0, 1,
-0.6013689, 1.163164, -0.4612397, 0.3686275, 1, 0, 1,
-0.5998834, 0.9543478, -1.089453, 0.3607843, 1, 0, 1,
-0.5944785, -1.144424, -1.036484, 0.3568628, 1, 0, 1,
-0.5943769, 0.5515395, -0.190603, 0.3490196, 1, 0, 1,
-0.5939947, -0.8428779, -1.405569, 0.345098, 1, 0, 1,
-0.5878837, 0.09802843, -2.834598, 0.3372549, 1, 0, 1,
-0.5852894, 0.9616804, -0.6766577, 0.3333333, 1, 0, 1,
-0.5820269, 1.575763, 0.02688944, 0.3254902, 1, 0, 1,
-0.580828, 1.211808, -0.8548432, 0.3215686, 1, 0, 1,
-0.5795971, 0.1543995, -0.530368, 0.3137255, 1, 0, 1,
-0.5765529, 1.184419, -1.570465, 0.3098039, 1, 0, 1,
-0.5702968, 0.5885289, -0.5353723, 0.3019608, 1, 0, 1,
-0.5676486, -0.6250543, -1.41437, 0.2941177, 1, 0, 1,
-0.5650843, -0.9843802, -2.101065, 0.2901961, 1, 0, 1,
-0.5650485, 1.340984, -0.4478268, 0.282353, 1, 0, 1,
-0.5617102, -1.599931, -4.640029, 0.2784314, 1, 0, 1,
-0.5593572, 0.3687211, -2.354558, 0.2705882, 1, 0, 1,
-0.5569683, 0.04166378, -1.755192, 0.2666667, 1, 0, 1,
-0.5501722, -1.31068, -1.997692, 0.2588235, 1, 0, 1,
-0.5486109, -0.08215223, 0.09017815, 0.254902, 1, 0, 1,
-0.5448031, -0.6203198, -2.517642, 0.2470588, 1, 0, 1,
-0.530655, 0.2787308, -0.6682377, 0.2431373, 1, 0, 1,
-0.5234879, -0.388832, -2.080904, 0.2352941, 1, 0, 1,
-0.5184591, -0.3936772, -2.737187, 0.2313726, 1, 0, 1,
-0.5142837, -1.116902, -2.468051, 0.2235294, 1, 0, 1,
-0.5132462, -0.6481997, -3.867251, 0.2196078, 1, 0, 1,
-0.5122844, -0.1223835, -0.7242513, 0.2117647, 1, 0, 1,
-0.5117089, 0.3360508, -1.104337, 0.2078431, 1, 0, 1,
-0.5110002, 0.9333109, 1.244921, 0.2, 1, 0, 1,
-0.500244, 0.001484502, -0.8099623, 0.1921569, 1, 0, 1,
-0.494013, 0.5850959, -0.0644792, 0.1882353, 1, 0, 1,
-0.4928547, -0.0200835, -1.336897, 0.1803922, 1, 0, 1,
-0.4904537, 1.811821, 0.8015417, 0.1764706, 1, 0, 1,
-0.4882403, 0.1536968, -2.573175, 0.1686275, 1, 0, 1,
-0.4793762, 0.3264654, 0.04840871, 0.1647059, 1, 0, 1,
-0.4792583, 0.230105, -0.9987759, 0.1568628, 1, 0, 1,
-0.4783842, -1.869343, -4.177251, 0.1529412, 1, 0, 1,
-0.478107, 1.006744, 0.00600765, 0.145098, 1, 0, 1,
-0.4773008, -0.8674617, -3.475304, 0.1411765, 1, 0, 1,
-0.473177, -0.3556586, -2.992388, 0.1333333, 1, 0, 1,
-0.471593, 0.6540726, 0.3820502, 0.1294118, 1, 0, 1,
-0.4684795, -0.147668, -1.39753, 0.1215686, 1, 0, 1,
-0.4655299, 2.571522, -1.077492, 0.1176471, 1, 0, 1,
-0.4619325, -0.7513978, -1.454084, 0.1098039, 1, 0, 1,
-0.4595996, -1.114212, -4.499237, 0.1058824, 1, 0, 1,
-0.4575453, -2.041261, -3.400945, 0.09803922, 1, 0, 1,
-0.4551051, -0.7714186, -3.168195, 0.09019608, 1, 0, 1,
-0.4501246, 1.344271, -0.9433216, 0.08627451, 1, 0, 1,
-0.4497936, -1.479252, -2.008538, 0.07843138, 1, 0, 1,
-0.448611, -2.550076, -2.650433, 0.07450981, 1, 0, 1,
-0.4477721, -0.5421192, -2.751658, 0.06666667, 1, 0, 1,
-0.4476908, -0.7704282, -3.40899, 0.0627451, 1, 0, 1,
-0.4471739, 1.134787, -0.9247539, 0.05490196, 1, 0, 1,
-0.4433106, -0.4946581, -2.123393, 0.05098039, 1, 0, 1,
-0.4405896, 0.4524656, 0.7578496, 0.04313726, 1, 0, 1,
-0.4402966, -0.373819, -2.309114, 0.03921569, 1, 0, 1,
-0.4402529, 0.4626577, -0.9084952, 0.03137255, 1, 0, 1,
-0.4361726, 1.032811, 1.326582, 0.02745098, 1, 0, 1,
-0.4322443, 0.4701707, -1.811163, 0.01960784, 1, 0, 1,
-0.4228906, 0.2879295, -0.4536695, 0.01568628, 1, 0, 1,
-0.4186165, -0.06051771, -3.245074, 0.007843138, 1, 0, 1,
-0.4182661, -0.3171318, -3.106192, 0.003921569, 1, 0, 1,
-0.4180433, -0.3809174, -2.604376, 0, 1, 0.003921569, 1,
-0.4094991, 1.263969, -0.6012726, 0, 1, 0.01176471, 1,
-0.408734, 1.011832, -0.5738405, 0, 1, 0.01568628, 1,
-0.4058947, -0.6067782, -2.865938, 0, 1, 0.02352941, 1,
-0.4041232, 0.5840178, -0.7323629, 0, 1, 0.02745098, 1,
-0.4026938, -0.7352807, -2.714804, 0, 1, 0.03529412, 1,
-0.401054, 0.03634441, -1.063468, 0, 1, 0.03921569, 1,
-0.3990318, -0.4217438, -3.012221, 0, 1, 0.04705882, 1,
-0.3955818, -0.5277473, -2.772107, 0, 1, 0.05098039, 1,
-0.3926934, 0.4112645, -0.6536924, 0, 1, 0.05882353, 1,
-0.3909299, -1.872033, -2.273463, 0, 1, 0.0627451, 1,
-0.3832491, -0.8706976, -3.027671, 0, 1, 0.07058824, 1,
-0.3830438, -0.1987641, -2.071913, 0, 1, 0.07450981, 1,
-0.3815267, 1.325229, -0.872014, 0, 1, 0.08235294, 1,
-0.3813543, -0.2321144, -1.255225, 0, 1, 0.08627451, 1,
-0.377557, -0.2955057, 0.164145, 0, 1, 0.09411765, 1,
-0.3768474, -1.13414, -2.524777, 0, 1, 0.1019608, 1,
-0.3745923, 0.3344569, -1.412312, 0, 1, 0.1058824, 1,
-0.3742377, 0.2259344, -1.736444, 0, 1, 0.1137255, 1,
-0.3639566, 0.9853528, -0.2247446, 0, 1, 0.1176471, 1,
-0.3594013, 0.1645981, -2.391928, 0, 1, 0.1254902, 1,
-0.3578091, 0.478563, -1.024713, 0, 1, 0.1294118, 1,
-0.3556567, -0.128196, -2.930637, 0, 1, 0.1372549, 1,
-0.3493808, -0.210101, -0.7245019, 0, 1, 0.1411765, 1,
-0.3493745, 1.068586, 0.5095404, 0, 1, 0.1490196, 1,
-0.3467857, -0.4163893, -2.295901, 0, 1, 0.1529412, 1,
-0.3457165, 2.271179, -1.195919, 0, 1, 0.1607843, 1,
-0.3431135, -1.469106, -4.554842, 0, 1, 0.1647059, 1,
-0.3390135, 0.09737046, 0.3728462, 0, 1, 0.172549, 1,
-0.3320364, -0.2921636, -2.485814, 0, 1, 0.1764706, 1,
-0.3288864, 0.6485972, -1.632259, 0, 1, 0.1843137, 1,
-0.3280696, 1.366217, -1.017302, 0, 1, 0.1882353, 1,
-0.3261232, -0.05257501, -0.8656233, 0, 1, 0.1960784, 1,
-0.3222268, 0.06269855, -1.011069, 0, 1, 0.2039216, 1,
-0.318619, -0.3936007, -3.479457, 0, 1, 0.2078431, 1,
-0.3182223, 1.316764, -0.1234537, 0, 1, 0.2156863, 1,
-0.3141856, 1.726646, 2.01155, 0, 1, 0.2196078, 1,
-0.3118898, -0.9706849, -0.850318, 0, 1, 0.227451, 1,
-0.3118838, 0.2892162, 0.4073766, 0, 1, 0.2313726, 1,
-0.3116683, -0.6316155, -0.7023649, 0, 1, 0.2392157, 1,
-0.3103837, -0.7271887, -3.388977, 0, 1, 0.2431373, 1,
-0.3042721, 0.6947543, 1.114124, 0, 1, 0.2509804, 1,
-0.3032403, 0.8147116, 1.126781, 0, 1, 0.254902, 1,
-0.294554, -1.615179, -1.470849, 0, 1, 0.2627451, 1,
-0.2918359, -0.3165339, -2.557477, 0, 1, 0.2666667, 1,
-0.2910216, -0.7084572, -2.074886, 0, 1, 0.2745098, 1,
-0.2902096, -0.4029008, -1.686247, 0, 1, 0.2784314, 1,
-0.2900116, 0.2256685, -1.507521, 0, 1, 0.2862745, 1,
-0.2840566, 0.04315641, -2.263971, 0, 1, 0.2901961, 1,
-0.2799313, -1.716587, -3.634758, 0, 1, 0.2980392, 1,
-0.2786114, -0.4436991, -4.333782, 0, 1, 0.3058824, 1,
-0.2754198, -1.592974, -2.563083, 0, 1, 0.3098039, 1,
-0.2751392, 1.455689, -0.832283, 0, 1, 0.3176471, 1,
-0.2745902, 0.6653762, 0.5924475, 0, 1, 0.3215686, 1,
-0.2667409, 0.1531415, -1.586125, 0, 1, 0.3294118, 1,
-0.2657445, 0.6247027, 1.564434, 0, 1, 0.3333333, 1,
-0.2637842, 1.206127, -0.1231096, 0, 1, 0.3411765, 1,
-0.2586898, -0.1303094, -2.178612, 0, 1, 0.345098, 1,
-0.2586156, -0.4651269, -2.298899, 0, 1, 0.3529412, 1,
-0.2551156, -0.417858, -1.761309, 0, 1, 0.3568628, 1,
-0.2542716, -0.8709282, -2.773037, 0, 1, 0.3647059, 1,
-0.2528735, 0.663336, -2.538055, 0, 1, 0.3686275, 1,
-0.2522461, 0.04022476, -0.8851822, 0, 1, 0.3764706, 1,
-0.2505677, -0.003858306, -1.707649, 0, 1, 0.3803922, 1,
-0.246622, 1.427837, 0.2252253, 0, 1, 0.3882353, 1,
-0.2449813, -0.7048563, -2.723663, 0, 1, 0.3921569, 1,
-0.2448536, 1.109197, -1.014188, 0, 1, 0.4, 1,
-0.2431193, -1.419972, -4.030982, 0, 1, 0.4078431, 1,
-0.2414857, 1.316625, 0.2361663, 0, 1, 0.4117647, 1,
-0.2403556, 0.01588153, -1.761123, 0, 1, 0.4196078, 1,
-0.2385198, 1.038481, -0.6571733, 0, 1, 0.4235294, 1,
-0.2374372, -0.1093311, -2.11841, 0, 1, 0.4313726, 1,
-0.2331465, 0.3612171, 0.6262324, 0, 1, 0.4352941, 1,
-0.2288548, -0.2625718, -2.256178, 0, 1, 0.4431373, 1,
-0.2201712, -0.4581986, -2.432233, 0, 1, 0.4470588, 1,
-0.2197392, -1.406211, -3.322969, 0, 1, 0.454902, 1,
-0.2142874, -0.03503408, -1.259656, 0, 1, 0.4588235, 1,
-0.2142119, 1.034247, -0.05680554, 0, 1, 0.4666667, 1,
-0.2129704, -0.9933293, -4.862955, 0, 1, 0.4705882, 1,
-0.2107864, 1.230218, -0.0655184, 0, 1, 0.4784314, 1,
-0.2007247, -0.7013076, -3.643884, 0, 1, 0.4823529, 1,
-0.1993975, -0.402103, -1.134735, 0, 1, 0.4901961, 1,
-0.1989481, -1.356654, -3.018095, 0, 1, 0.4941176, 1,
-0.1987009, 0.7006266, 0.254726, 0, 1, 0.5019608, 1,
-0.1950752, -0.08160909, -2.479607, 0, 1, 0.509804, 1,
-0.1939483, -0.5652223, -4.27701, 0, 1, 0.5137255, 1,
-0.1908702, -0.5878928, -3.966381, 0, 1, 0.5215687, 1,
-0.1864103, 1.007888, -0.0815051, 0, 1, 0.5254902, 1,
-0.1838264, -0.7903163, -4.422974, 0, 1, 0.5333334, 1,
-0.1822233, 0.02348121, -1.328596, 0, 1, 0.5372549, 1,
-0.1732718, -0.1604652, -1.994188, 0, 1, 0.5450981, 1,
-0.1717616, -3.156807, -2.363045, 0, 1, 0.5490196, 1,
-0.1710876, 0.2256623, -0.4496019, 0, 1, 0.5568628, 1,
-0.158048, -0.9886233, -1.688458, 0, 1, 0.5607843, 1,
-0.1551632, 0.3950736, 0.1643375, 0, 1, 0.5686275, 1,
-0.1543933, -2.15306, -4.321401, 0, 1, 0.572549, 1,
-0.148333, 0.3949169, -0.9861701, 0, 1, 0.5803922, 1,
-0.1463068, -0.2029817, -2.353083, 0, 1, 0.5843138, 1,
-0.1388303, -1.438263, -2.04535, 0, 1, 0.5921569, 1,
-0.1385599, 0.01886539, -1.428778, 0, 1, 0.5960785, 1,
-0.134905, 0.6788366, 0.5809669, 0, 1, 0.6039216, 1,
-0.1345353, 1.086471, 0.03796397, 0, 1, 0.6117647, 1,
-0.1331351, 1.049789, 0.8949112, 0, 1, 0.6156863, 1,
-0.1323833, -0.1586655, -2.001967, 0, 1, 0.6235294, 1,
-0.1310654, -1.833102, -1.3841, 0, 1, 0.627451, 1,
-0.1307617, 0.410715, -1.612392, 0, 1, 0.6352941, 1,
-0.1306934, -0.9773365, -4.607968, 0, 1, 0.6392157, 1,
-0.1294278, 0.339801, -1.118194, 0, 1, 0.6470588, 1,
-0.1291614, -0.8175674, -4.461111, 0, 1, 0.6509804, 1,
-0.1274158, 2.09851, -1.049135, 0, 1, 0.6588235, 1,
-0.1270711, -0.7591914, -3.103733, 0, 1, 0.6627451, 1,
-0.1204719, 0.5058312, -1.22643, 0, 1, 0.6705883, 1,
-0.1203736, 0.5488759, 0.6056114, 0, 1, 0.6745098, 1,
-0.1189488, 1.229879, -0.4747654, 0, 1, 0.682353, 1,
-0.1185088, 0.3041555, -0.5309843, 0, 1, 0.6862745, 1,
-0.1181098, 1.346501, -1.802414, 0, 1, 0.6941177, 1,
-0.1179741, 2.364372, -0.924351, 0, 1, 0.7019608, 1,
-0.1178613, 0.6108236, 0.5108848, 0, 1, 0.7058824, 1,
-0.1144166, -2.809124, -2.421949, 0, 1, 0.7137255, 1,
-0.1054779, 0.9572859, 0.282708, 0, 1, 0.7176471, 1,
-0.1053701, -1.047011, -2.865108, 0, 1, 0.7254902, 1,
-0.1040406, -0.5366399, -0.9452388, 0, 1, 0.7294118, 1,
-0.1033346, -0.03243816, -2.945987, 0, 1, 0.7372549, 1,
-0.1003452, 1.03925, -1.798056, 0, 1, 0.7411765, 1,
-0.09744713, 1.753098, -0.2043971, 0, 1, 0.7490196, 1,
-0.09383154, -1.093757, -2.311238, 0, 1, 0.7529412, 1,
-0.09248112, -1.736247, -3.52933, 0, 1, 0.7607843, 1,
-0.08781232, 2.123784, 0.242809, 0, 1, 0.7647059, 1,
-0.08588782, 1.265613, -0.1326619, 0, 1, 0.772549, 1,
-0.08320308, 1.879079, 1.087559, 0, 1, 0.7764706, 1,
-0.08319717, -0.9023907, -3.043917, 0, 1, 0.7843137, 1,
-0.08091912, -1.168688, -1.917817, 0, 1, 0.7882353, 1,
-0.07831692, 0.2766878, -1.862107, 0, 1, 0.7960784, 1,
-0.07786736, -0.001140271, -1.60034, 0, 1, 0.8039216, 1,
-0.07757435, -1.480679, -2.872114, 0, 1, 0.8078431, 1,
-0.07728555, 0.857363, -1.171197, 0, 1, 0.8156863, 1,
-0.06945985, 0.7117708, -0.02304093, 0, 1, 0.8196079, 1,
-0.06860529, -0.8865436, -1.361662, 0, 1, 0.827451, 1,
-0.06422207, -1.264395, -3.353165, 0, 1, 0.8313726, 1,
-0.06276321, 1.375989, -0.5942537, 0, 1, 0.8392157, 1,
-0.06248413, 1.237671, 0.3868302, 0, 1, 0.8431373, 1,
-0.06071958, -0.2884243, -2.710916, 0, 1, 0.8509804, 1,
-0.05802052, 1.432613, -0.3985668, 0, 1, 0.854902, 1,
-0.05712105, 1.802034, -0.2561345, 0, 1, 0.8627451, 1,
-0.05685858, 0.4238347, -1.518719, 0, 1, 0.8666667, 1,
-0.05409317, 0.7398956, -0.6351491, 0, 1, 0.8745098, 1,
-0.04500982, 1.185021, 0.7564448, 0, 1, 0.8784314, 1,
-0.04304499, 0.1453191, 1.413194, 0, 1, 0.8862745, 1,
-0.04178185, 0.4592083, -0.96567, 0, 1, 0.8901961, 1,
-0.04120507, -0.7722576, -2.62183, 0, 1, 0.8980392, 1,
-0.03242571, -0.1537107, -2.647464, 0, 1, 0.9058824, 1,
-0.0320261, 0.0169418, -2.465874, 0, 1, 0.9098039, 1,
-0.02955697, 0.6146156, -0.4136668, 0, 1, 0.9176471, 1,
-0.02719665, -1.856616, -2.865394, 0, 1, 0.9215686, 1,
-0.02681482, -0.06598778, -2.341882, 0, 1, 0.9294118, 1,
-0.02661516, 0.5832107, -0.2750062, 0, 1, 0.9333333, 1,
-0.02150844, 1.218, -0.4336087, 0, 1, 0.9411765, 1,
-0.02078683, 1.360719, -1.173433, 0, 1, 0.945098, 1,
-0.02003011, -1.269783, -3.31121, 0, 1, 0.9529412, 1,
-0.01633365, -1.066798, -3.262066, 0, 1, 0.9568627, 1,
-0.006241216, 0.5251147, -1.195407, 0, 1, 0.9647059, 1,
-0.005688647, 0.8625184, 0.1000809, 0, 1, 0.9686275, 1,
-0.004964513, -0.03631545, -4.720413, 0, 1, 0.9764706, 1,
0.0001511408, 0.1940995, 0.4036057, 0, 1, 0.9803922, 1,
0.002572205, 0.0473527, 1.945149, 0, 1, 0.9882353, 1,
0.004902979, -0.1150199, 4.288439, 0, 1, 0.9921569, 1,
0.005202147, 0.468549, 1.170361, 0, 1, 1, 1,
0.00793724, -2.140123, 3.793603, 0, 0.9921569, 1, 1,
0.01022079, -1.199449, 1.649686, 0, 0.9882353, 1, 1,
0.01450727, -0.3821508, 3.165715, 0, 0.9803922, 1, 1,
0.01621972, -1.181982, 1.774689, 0, 0.9764706, 1, 1,
0.02426593, -0.5641329, 2.415426, 0, 0.9686275, 1, 1,
0.02669899, -0.5741349, 2.451026, 0, 0.9647059, 1, 1,
0.0300747, -1.459356, 2.912704, 0, 0.9568627, 1, 1,
0.03021227, -0.2798428, 2.647486, 0, 0.9529412, 1, 1,
0.03511037, 1.393509, -0.05282998, 0, 0.945098, 1, 1,
0.03799159, 0.3994781, 0.1980191, 0, 0.9411765, 1, 1,
0.04448675, 0.7916012, -0.1452432, 0, 0.9333333, 1, 1,
0.04453157, -0.3785724, 1.834048, 0, 0.9294118, 1, 1,
0.04502663, 0.560229, 0.4666534, 0, 0.9215686, 1, 1,
0.04576344, -3.116404, 3.196117, 0, 0.9176471, 1, 1,
0.04588481, 0.1992142, 1.755681, 0, 0.9098039, 1, 1,
0.05570257, 2.192094, -0.5950945, 0, 0.9058824, 1, 1,
0.05680897, 1.483785, -0.3247892, 0, 0.8980392, 1, 1,
0.05695196, -1.045918, 3.626168, 0, 0.8901961, 1, 1,
0.0611031, -0.5548591, 3.819119, 0, 0.8862745, 1, 1,
0.06143581, 0.05938126, 1.369632, 0, 0.8784314, 1, 1,
0.0695178, 1.173146, -0.0460761, 0, 0.8745098, 1, 1,
0.07083848, 1.4458, 0.7135589, 0, 0.8666667, 1, 1,
0.07193406, 0.4986582, 0.05476854, 0, 0.8627451, 1, 1,
0.08270644, 0.954826, -0.03147344, 0, 0.854902, 1, 1,
0.08270992, -0.4174967, 3.332661, 0, 0.8509804, 1, 1,
0.08620784, -0.2635672, 2.65704, 0, 0.8431373, 1, 1,
0.08645032, -0.02071131, 2.509394, 0, 0.8392157, 1, 1,
0.09045334, 1.289648, -0.3319392, 0, 0.8313726, 1, 1,
0.09347755, 0.8036634, -0.6465806, 0, 0.827451, 1, 1,
0.09354233, -0.3443978, 4.864666, 0, 0.8196079, 1, 1,
0.09522957, 0.5116379, -0.4392246, 0, 0.8156863, 1, 1,
0.09701076, 1.509086, 2.401555, 0, 0.8078431, 1, 1,
0.1034434, 0.804262, 0.5568401, 0, 0.8039216, 1, 1,
0.1070722, 0.1043568, 0.5105409, 0, 0.7960784, 1, 1,
0.1090167, -0.5449199, 4.282528, 0, 0.7882353, 1, 1,
0.1098396, 0.3974199, 0.2189038, 0, 0.7843137, 1, 1,
0.1105063, 0.7876431, 0.761372, 0, 0.7764706, 1, 1,
0.1184538, -0.5040104, 2.889101, 0, 0.772549, 1, 1,
0.1191775, 0.6242756, 0.9176794, 0, 0.7647059, 1, 1,
0.119836, 0.9678374, 1.397368, 0, 0.7607843, 1, 1,
0.1203684, 0.3008717, 0.5816594, 0, 0.7529412, 1, 1,
0.1231349, -1.720839, 5.129247, 0, 0.7490196, 1, 1,
0.1257988, 2.303262, 0.4556005, 0, 0.7411765, 1, 1,
0.1270404, 0.03822948, 1.436372, 0, 0.7372549, 1, 1,
0.129005, 0.3703234, 3.080599, 0, 0.7294118, 1, 1,
0.1313156, -0.004006677, 1.323393, 0, 0.7254902, 1, 1,
0.1322563, -0.3972766, 3.747638, 0, 0.7176471, 1, 1,
0.1323804, -0.5727732, 3.179699, 0, 0.7137255, 1, 1,
0.1344605, -0.1331782, 2.848207, 0, 0.7058824, 1, 1,
0.1377945, -0.2128611, 2.156421, 0, 0.6980392, 1, 1,
0.1400133, 0.07249112, 1.706856, 0, 0.6941177, 1, 1,
0.1416736, 2.400819, 1.046575, 0, 0.6862745, 1, 1,
0.1419438, -1.296619, 2.579906, 0, 0.682353, 1, 1,
0.1448933, 0.1455381, 0.7449414, 0, 0.6745098, 1, 1,
0.145954, -1.809728, 2.393599, 0, 0.6705883, 1, 1,
0.1467066, 1.184679, -0.3322501, 0, 0.6627451, 1, 1,
0.1500857, 0.06912892, 0.6153574, 0, 0.6588235, 1, 1,
0.1581841, 0.03889078, 0.02243748, 0, 0.6509804, 1, 1,
0.1596362, 1.718667, -0.1810645, 0, 0.6470588, 1, 1,
0.1598228, 1.242668, -2.179416, 0, 0.6392157, 1, 1,
0.161606, 0.8802477, 0.2387376, 0, 0.6352941, 1, 1,
0.1630493, -0.3505991, 0.9429166, 0, 0.627451, 1, 1,
0.1641338, 0.8189809, 0.4499502, 0, 0.6235294, 1, 1,
0.1641455, 2.556154, 0.7620804, 0, 0.6156863, 1, 1,
0.1667358, -2.338438, 4.399612, 0, 0.6117647, 1, 1,
0.1669788, 2.734685, -0.4249388, 0, 0.6039216, 1, 1,
0.1722604, -0.6724746, 2.490897, 0, 0.5960785, 1, 1,
0.1724782, 0.184808, -0.6691635, 0, 0.5921569, 1, 1,
0.1728546, 1.267637, 1.107498, 0, 0.5843138, 1, 1,
0.1739719, -0.9263219, 3.017597, 0, 0.5803922, 1, 1,
0.1743335, -0.3391862, 2.297947, 0, 0.572549, 1, 1,
0.1778654, -0.09428431, 1.755432, 0, 0.5686275, 1, 1,
0.1809515, 1.086431, 0.7610418, 0, 0.5607843, 1, 1,
0.1815519, -0.3941761, 4.422051, 0, 0.5568628, 1, 1,
0.1831193, 0.8848724, -2.789819, 0, 0.5490196, 1, 1,
0.1832454, 0.8439687, -0.161745, 0, 0.5450981, 1, 1,
0.1889391, -0.02696822, 2.112058, 0, 0.5372549, 1, 1,
0.1893211, 1.209505, -0.5637007, 0, 0.5333334, 1, 1,
0.1906589, -0.08195324, 2.42687, 0, 0.5254902, 1, 1,
0.1912646, -1.082548, 3.094871, 0, 0.5215687, 1, 1,
0.1924865, 0.245212, 2.465154, 0, 0.5137255, 1, 1,
0.1929535, -3.051918, 2.921535, 0, 0.509804, 1, 1,
0.1929552, 0.8989394, -0.3287601, 0, 0.5019608, 1, 1,
0.1937018, -0.3318909, 2.895333, 0, 0.4941176, 1, 1,
0.1958725, -0.3415361, 3.464672, 0, 0.4901961, 1, 1,
0.196046, -0.7363239, 1.032258, 0, 0.4823529, 1, 1,
0.1996273, -0.1911961, 2.860239, 0, 0.4784314, 1, 1,
0.2023192, 1.471357, 0.211404, 0, 0.4705882, 1, 1,
0.2026193, -0.5339454, 4.026812, 0, 0.4666667, 1, 1,
0.205481, -0.07116762, 0.8298923, 0, 0.4588235, 1, 1,
0.2056492, -0.04333033, 1.667083, 0, 0.454902, 1, 1,
0.2090348, 0.1773987, 0.4805972, 0, 0.4470588, 1, 1,
0.2154522, -1.120438, 3.411688, 0, 0.4431373, 1, 1,
0.2207856, -0.998911, 2.188871, 0, 0.4352941, 1, 1,
0.2220112, -0.1002447, 3.581739, 0, 0.4313726, 1, 1,
0.2266892, 0.6987178, 0.2595184, 0, 0.4235294, 1, 1,
0.2301048, -0.1417841, 2.302207, 0, 0.4196078, 1, 1,
0.2315548, 0.8681046, -0.6340089, 0, 0.4117647, 1, 1,
0.2350631, 1.128409, -1.066398, 0, 0.4078431, 1, 1,
0.2364339, 0.1250848, 2.925435, 0, 0.4, 1, 1,
0.2422491, -0.497167, 0.7188983, 0, 0.3921569, 1, 1,
0.2423555, 0.6263053, 0.4113442, 0, 0.3882353, 1, 1,
0.2447648, -0.632444, 2.980072, 0, 0.3803922, 1, 1,
0.2452461, -0.5864629, 2.270018, 0, 0.3764706, 1, 1,
0.2484216, -0.6500089, 3.303327, 0, 0.3686275, 1, 1,
0.2484885, -0.28334, 1.22529, 0, 0.3647059, 1, 1,
0.2486878, 0.956027, -0.3165886, 0, 0.3568628, 1, 1,
0.249719, -0.5748034, 3.001625, 0, 0.3529412, 1, 1,
0.2531633, -0.03506837, 2.687037, 0, 0.345098, 1, 1,
0.2547085, 1.423902, 1.313548, 0, 0.3411765, 1, 1,
0.2550824, -0.6603377, 4.286199, 0, 0.3333333, 1, 1,
0.2562122, 0.01849659, 1.174528, 0, 0.3294118, 1, 1,
0.2567547, 1.292856, 0.5120093, 0, 0.3215686, 1, 1,
0.2593245, -1.072191, 4.23667, 0, 0.3176471, 1, 1,
0.2613605, -0.1964241, 0.1508482, 0, 0.3098039, 1, 1,
0.261456, 0.6884133, 0.02822562, 0, 0.3058824, 1, 1,
0.2674517, 0.3844339, 1.12949, 0, 0.2980392, 1, 1,
0.2680319, 0.3896303, 0.3820297, 0, 0.2901961, 1, 1,
0.268052, -1.027113, 3.943347, 0, 0.2862745, 1, 1,
0.2681776, 0.4643766, 1.079556, 0, 0.2784314, 1, 1,
0.2732947, 0.4590279, -0.7892347, 0, 0.2745098, 1, 1,
0.2751444, 0.9631305, -0.2151646, 0, 0.2666667, 1, 1,
0.2867887, 0.03349751, 2.128287, 0, 0.2627451, 1, 1,
0.2872021, 0.997794, -0.6922712, 0, 0.254902, 1, 1,
0.2913465, -0.4496012, 3.531684, 0, 0.2509804, 1, 1,
0.2973531, -1.767315, 2.658743, 0, 0.2431373, 1, 1,
0.3000608, 0.869593, 2.128968, 0, 0.2392157, 1, 1,
0.3018758, 0.7415331, -0.1055863, 0, 0.2313726, 1, 1,
0.3063359, -0.1474838, 4.335992, 0, 0.227451, 1, 1,
0.3084625, -0.1644125, 1.963057, 0, 0.2196078, 1, 1,
0.3085063, 0.607338, 0.8550181, 0, 0.2156863, 1, 1,
0.309918, 0.6111111, 3.171651, 0, 0.2078431, 1, 1,
0.3101895, -9.478698e-05, 1.017862, 0, 0.2039216, 1, 1,
0.3105257, -0.5161567, 1.103278, 0, 0.1960784, 1, 1,
0.3163012, -0.4206306, 2.995652, 0, 0.1882353, 1, 1,
0.3201406, -1.519637, 4.894806, 0, 0.1843137, 1, 1,
0.3221402, -0.9778121, 5.071386, 0, 0.1764706, 1, 1,
0.3226645, 0.4371665, 0.2217853, 0, 0.172549, 1, 1,
0.3269588, 1.38578, 0.3411884, 0, 0.1647059, 1, 1,
0.3345264, 0.03260817, 1.532188, 0, 0.1607843, 1, 1,
0.3366519, 1.052135, 0.7016207, 0, 0.1529412, 1, 1,
0.3396175, -1.891225, 3.750103, 0, 0.1490196, 1, 1,
0.344811, 0.2014009, 0.9357868, 0, 0.1411765, 1, 1,
0.3463152, -1.021644, 2.879106, 0, 0.1372549, 1, 1,
0.3487438, -0.6036546, 2.817981, 0, 0.1294118, 1, 1,
0.3527775, 0.6993171, 1.568618, 0, 0.1254902, 1, 1,
0.3547095, 0.6012235, -1.573224, 0, 0.1176471, 1, 1,
0.3600268, -1.156008, 2.254056, 0, 0.1137255, 1, 1,
0.3604675, -0.08493392, 1.983917, 0, 0.1058824, 1, 1,
0.3604693, 0.02599817, 0.5034506, 0, 0.09803922, 1, 1,
0.3613609, -0.1774054, 3.007204, 0, 0.09411765, 1, 1,
0.3645892, -0.2651332, 1.337027, 0, 0.08627451, 1, 1,
0.3662699, 1.570605, 1.380334, 0, 0.08235294, 1, 1,
0.3719844, -1.253626, 3.242894, 0, 0.07450981, 1, 1,
0.3727817, 1.100191, 0.3099535, 0, 0.07058824, 1, 1,
0.37291, 0.7501847, -0.07567632, 0, 0.0627451, 1, 1,
0.3790939, 0.2390212, 0.001117624, 0, 0.05882353, 1, 1,
0.3856887, 0.7045226, 2.294955, 0, 0.05098039, 1, 1,
0.3943345, -0.8890359, 3.419976, 0, 0.04705882, 1, 1,
0.3943364, -0.7843195, 2.343576, 0, 0.03921569, 1, 1,
0.4007453, 0.05294633, 3.214528, 0, 0.03529412, 1, 1,
0.4032716, 1.279935, 0.9182141, 0, 0.02745098, 1, 1,
0.4051257, -0.9092755, 3.186353, 0, 0.02352941, 1, 1,
0.4099573, -0.244481, 2.456165, 0, 0.01568628, 1, 1,
0.4130966, 0.2319081, -0.06884016, 0, 0.01176471, 1, 1,
0.4142777, -1.301252, 5.220706, 0, 0.003921569, 1, 1,
0.415554, -1.231349, 3.685377, 0.003921569, 0, 1, 1,
0.4176604, 0.1445963, 2.092163, 0.007843138, 0, 1, 1,
0.4205167, 1.768025, 0.7785981, 0.01568628, 0, 1, 1,
0.4209165, 1.600685, 1.635477, 0.01960784, 0, 1, 1,
0.4210538, -1.803194, 3.262795, 0.02745098, 0, 1, 1,
0.4255586, 1.739132, -0.7448457, 0.03137255, 0, 1, 1,
0.4284347, 0.2172621, 0.6896763, 0.03921569, 0, 1, 1,
0.4285048, 0.3930891, 0.665405, 0.04313726, 0, 1, 1,
0.4297423, -1.195771, 1.125161, 0.05098039, 0, 1, 1,
0.4310375, 0.9364712, 2.30949, 0.05490196, 0, 1, 1,
0.4328521, -0.7696898, 2.016173, 0.0627451, 0, 1, 1,
0.4363547, 0.610179, -0.04423842, 0.06666667, 0, 1, 1,
0.4374921, 0.5268537, 1.500175, 0.07450981, 0, 1, 1,
0.4391899, -1.122799, 3.852791, 0.07843138, 0, 1, 1,
0.4400595, -0.2366178, 0.4510881, 0.08627451, 0, 1, 1,
0.4407622, -0.1867901, 1.231962, 0.09019608, 0, 1, 1,
0.4438499, 0.1147544, 0.6253572, 0.09803922, 0, 1, 1,
0.4477044, 0.7650372, 1.106091, 0.1058824, 0, 1, 1,
0.4478407, -0.7049475, 2.356626, 0.1098039, 0, 1, 1,
0.4483649, -0.6099992, 1.094067, 0.1176471, 0, 1, 1,
0.450027, 1.664409, 2.000274, 0.1215686, 0, 1, 1,
0.4512887, -2.03773, 1.203362, 0.1294118, 0, 1, 1,
0.4524254, -1.287072, 3.903516, 0.1333333, 0, 1, 1,
0.4595797, -0.7357038, 1.35414, 0.1411765, 0, 1, 1,
0.4657819, 1.183325, -0.3326523, 0.145098, 0, 1, 1,
0.4673629, -0.6630399, 2.025422, 0.1529412, 0, 1, 1,
0.4794454, -1.147848, 0.9307343, 0.1568628, 0, 1, 1,
0.4818116, 1.652771, 0.05681477, 0.1647059, 0, 1, 1,
0.4824402, 0.1165807, 0.3204326, 0.1686275, 0, 1, 1,
0.4849063, 0.09845468, 1.497958, 0.1764706, 0, 1, 1,
0.4964145, 0.144977, -0.01526584, 0.1803922, 0, 1, 1,
0.4973207, -0.4172523, 2.792377, 0.1882353, 0, 1, 1,
0.499265, -0.3053972, 1.565939, 0.1921569, 0, 1, 1,
0.5029624, 0.2843549, 1.553748, 0.2, 0, 1, 1,
0.504195, 0.1051097, 2.087266, 0.2078431, 0, 1, 1,
0.5043283, -0.8773242, 2.211729, 0.2117647, 0, 1, 1,
0.5077312, 1.573929, 1.02987, 0.2196078, 0, 1, 1,
0.5099273, -1.902649, 4.015666, 0.2235294, 0, 1, 1,
0.512754, 1.589206, 0.9990284, 0.2313726, 0, 1, 1,
0.5183688, -0.7214383, 2.917652, 0.2352941, 0, 1, 1,
0.5223412, 0.9939174, -0.3828019, 0.2431373, 0, 1, 1,
0.5317603, 0.896458, 0.3283793, 0.2470588, 0, 1, 1,
0.5320338, 1.808456, 1.478324, 0.254902, 0, 1, 1,
0.5356749, 1.101548, -2.433327, 0.2588235, 0, 1, 1,
0.5449723, -0.6959714, 2.335924, 0.2666667, 0, 1, 1,
0.5462829, 0.9358299, 0.2094771, 0.2705882, 0, 1, 1,
0.5467588, 1.263727, 0.583029, 0.2784314, 0, 1, 1,
0.5526725, -0.8542845, 3.464936, 0.282353, 0, 1, 1,
0.5543948, 0.7039182, -0.1398244, 0.2901961, 0, 1, 1,
0.558652, 0.2545636, 3.609835, 0.2941177, 0, 1, 1,
0.5610223, 1.175666, -1.303092, 0.3019608, 0, 1, 1,
0.5652041, -0.2416639, 1.458272, 0.3098039, 0, 1, 1,
0.5692846, -0.9009898, 2.980878, 0.3137255, 0, 1, 1,
0.5733213, -0.3037625, 3.34158, 0.3215686, 0, 1, 1,
0.5749209, -0.1291476, 1.811553, 0.3254902, 0, 1, 1,
0.5782245, 1.087409, 0.06739944, 0.3333333, 0, 1, 1,
0.5785178, -1.286731, 3.156835, 0.3372549, 0, 1, 1,
0.5803828, -1.078829, 2.128277, 0.345098, 0, 1, 1,
0.5871035, 1.746178, 0.2244452, 0.3490196, 0, 1, 1,
0.5909371, -0.09968897, 3.262095, 0.3568628, 0, 1, 1,
0.5961672, -0.3891014, 4.044698, 0.3607843, 0, 1, 1,
0.599429, 0.6431918, 0.8958565, 0.3686275, 0, 1, 1,
0.6005106, 0.9605305, -0.4347168, 0.372549, 0, 1, 1,
0.6016905, 0.1738544, 0.2255282, 0.3803922, 0, 1, 1,
0.6036149, 1.203211, 0.6892219, 0.3843137, 0, 1, 1,
0.6082257, -1.642814, 1.525719, 0.3921569, 0, 1, 1,
0.6092201, -0.3396065, 1.623789, 0.3960784, 0, 1, 1,
0.6144182, -0.4843238, 1.988738, 0.4039216, 0, 1, 1,
0.6157311, 0.3845002, 1.463141, 0.4117647, 0, 1, 1,
0.621283, 1.049551, 1.222169, 0.4156863, 0, 1, 1,
0.6258379, -3.584712, 4.339609, 0.4235294, 0, 1, 1,
0.6279697, -0.9894073, 1.993214, 0.427451, 0, 1, 1,
0.635349, -1.069207, 3.401388, 0.4352941, 0, 1, 1,
0.6489044, 1.769807, -0.9999672, 0.4392157, 0, 1, 1,
0.6514947, -1.570124, 3.778607, 0.4470588, 0, 1, 1,
0.6543123, -0.419627, 2.126461, 0.4509804, 0, 1, 1,
0.656942, -0.4182318, 2.582786, 0.4588235, 0, 1, 1,
0.6606856, -0.08983161, 1.410489, 0.4627451, 0, 1, 1,
0.6697008, -0.5575177, 3.976133, 0.4705882, 0, 1, 1,
0.6716754, -0.2243521, 0.01290168, 0.4745098, 0, 1, 1,
0.6730822, 0.2076656, 2.279447, 0.4823529, 0, 1, 1,
0.6772549, 0.2834448, 2.17833, 0.4862745, 0, 1, 1,
0.6786308, -1.345692, 1.958082, 0.4941176, 0, 1, 1,
0.6826758, 1.767694, 0.3944367, 0.5019608, 0, 1, 1,
0.6904107, -0.06911606, 0.8893609, 0.5058824, 0, 1, 1,
0.6926518, 0.9434134, -1.796963, 0.5137255, 0, 1, 1,
0.6950442, -1.110255, 3.197909, 0.5176471, 0, 1, 1,
0.6980028, -0.6731038, 2.817739, 0.5254902, 0, 1, 1,
0.6985427, -0.9901422, 4.12081, 0.5294118, 0, 1, 1,
0.7131023, -0.1482944, 0.8982679, 0.5372549, 0, 1, 1,
0.713387, 0.9135221, 1.322762, 0.5411765, 0, 1, 1,
0.7172413, 0.3563576, -0.2109107, 0.5490196, 0, 1, 1,
0.7194793, 0.4345278, 2.529853, 0.5529412, 0, 1, 1,
0.7242132, -0.5312922, 2.054228, 0.5607843, 0, 1, 1,
0.728068, 1.324075, -0.8735283, 0.5647059, 0, 1, 1,
0.7307611, -0.4423698, 1.135608, 0.572549, 0, 1, 1,
0.7332162, -0.02838072, 1.226588, 0.5764706, 0, 1, 1,
0.7339368, -0.2475125, 2.239848, 0.5843138, 0, 1, 1,
0.7558511, -2.002497, 1.219026, 0.5882353, 0, 1, 1,
0.7570471, 1.138197, 0.255158, 0.5960785, 0, 1, 1,
0.759508, -0.2263331, 2.3099, 0.6039216, 0, 1, 1,
0.7646258, -0.1303083, 2.014029, 0.6078432, 0, 1, 1,
0.7688207, -0.7604146, 0.3778115, 0.6156863, 0, 1, 1,
0.7692103, 0.9305373, 1.809867, 0.6196079, 0, 1, 1,
0.7705636, -0.6925662, 1.456361, 0.627451, 0, 1, 1,
0.7721886, -1.570493, 2.623742, 0.6313726, 0, 1, 1,
0.7785114, -0.3881945, 2.58816, 0.6392157, 0, 1, 1,
0.7789555, 0.7331496, 1.093532, 0.6431373, 0, 1, 1,
0.7811458, 0.4589735, 2.831534, 0.6509804, 0, 1, 1,
0.7919921, -0.3366652, 2.634952, 0.654902, 0, 1, 1,
0.7933627, -1.480435, 3.170365, 0.6627451, 0, 1, 1,
0.79596, 1.127387, 0.7005013, 0.6666667, 0, 1, 1,
0.7995813, 0.05793633, 3.049088, 0.6745098, 0, 1, 1,
0.8035336, 1.604271, 0.2516487, 0.6784314, 0, 1, 1,
0.8035962, -1.387659, 2.651072, 0.6862745, 0, 1, 1,
0.8065416, 1.177047, -0.8877761, 0.6901961, 0, 1, 1,
0.8130104, -0.1101272, 1.230712, 0.6980392, 0, 1, 1,
0.8155093, -2.416642, 3.339828, 0.7058824, 0, 1, 1,
0.8158523, 0.6284649, 0.8388469, 0.7098039, 0, 1, 1,
0.8248549, -0.3419983, 2.638361, 0.7176471, 0, 1, 1,
0.8254839, -0.521189, 2.461171, 0.7215686, 0, 1, 1,
0.8327362, -0.1808793, 0.5408636, 0.7294118, 0, 1, 1,
0.8371305, 2.054706, -0.1539209, 0.7333333, 0, 1, 1,
0.8414947, 1.021772, 0.4000647, 0.7411765, 0, 1, 1,
0.8444992, -0.01648298, 2.298547, 0.7450981, 0, 1, 1,
0.8552449, -0.6999885, 2.816572, 0.7529412, 0, 1, 1,
0.858798, 1.702966, 0.301344, 0.7568628, 0, 1, 1,
0.859755, 0.4041678, 1.200928, 0.7647059, 0, 1, 1,
0.8606725, 0.8292093, 0.2639785, 0.7686275, 0, 1, 1,
0.8675272, -1.373464, 2.69181, 0.7764706, 0, 1, 1,
0.8695989, 0.8714995, -0.1334545, 0.7803922, 0, 1, 1,
0.8719525, -0.6653693, -0.7251901, 0.7882353, 0, 1, 1,
0.8757317, -0.9042501, 2.393547, 0.7921569, 0, 1, 1,
0.8783208, -1.375321, 1.413456, 0.8, 0, 1, 1,
0.8848835, 1.290653, -0.07845175, 0.8078431, 0, 1, 1,
0.8891857, -0.7259915, 1.966525, 0.8117647, 0, 1, 1,
0.8961408, 0.4259, 2.569426, 0.8196079, 0, 1, 1,
0.8976401, 0.06238835, 1.991671, 0.8235294, 0, 1, 1,
0.9025058, 0.49405, 1.383629, 0.8313726, 0, 1, 1,
0.9040123, -0.188746, 1.266222, 0.8352941, 0, 1, 1,
0.9091823, 0.2393317, 2.408144, 0.8431373, 0, 1, 1,
0.9092607, -1.525029, 4.298247, 0.8470588, 0, 1, 1,
0.9103113, -0.6969464, 3.026141, 0.854902, 0, 1, 1,
0.9126406, 0.3535365, 0.02360607, 0.8588235, 0, 1, 1,
0.9145154, -1.4215, 3.366486, 0.8666667, 0, 1, 1,
0.9185502, 1.367613, -1.383366, 0.8705882, 0, 1, 1,
0.919908, 1.122899, 2.215293, 0.8784314, 0, 1, 1,
0.9242666, 0.4040314, 1.546909, 0.8823529, 0, 1, 1,
0.9333145, 0.6159697, 0.392763, 0.8901961, 0, 1, 1,
0.9346502, 0.2916673, 1.856798, 0.8941177, 0, 1, 1,
0.9359771, 0.09166803, 2.629434, 0.9019608, 0, 1, 1,
0.9363287, 0.2529965, 2.046601, 0.9098039, 0, 1, 1,
0.9404165, 1.123658, 3.035906, 0.9137255, 0, 1, 1,
0.9414244, -1.892936, 2.122835, 0.9215686, 0, 1, 1,
0.9416113, -0.4087281, 0.9213364, 0.9254902, 0, 1, 1,
0.9509419, -1.311703, 2.758864, 0.9333333, 0, 1, 1,
0.9557023, 0.3683984, 3.143186, 0.9372549, 0, 1, 1,
0.9571994, -0.03516023, 2.24491, 0.945098, 0, 1, 1,
0.9610128, 0.04114753, -0.3805989, 0.9490196, 0, 1, 1,
0.9630946, 0.9589269, -0.9332026, 0.9568627, 0, 1, 1,
0.9669176, 0.256038, 1.048702, 0.9607843, 0, 1, 1,
0.9732289, -0.1536002, 1.530162, 0.9686275, 0, 1, 1,
0.9798881, -1.024295, 2.699933, 0.972549, 0, 1, 1,
0.9816231, -1.757151, 3.157622, 0.9803922, 0, 1, 1,
0.985167, -1.519176, 2.253161, 0.9843137, 0, 1, 1,
0.9924163, -0.08387186, 2.532566, 0.9921569, 0, 1, 1,
1.002864, -1.189543, 2.144612, 0.9960784, 0, 1, 1,
1.007533, -1.084472, 1.7571, 1, 0, 0.9960784, 1,
1.008832, -1.040258, 1.66055, 1, 0, 0.9882353, 1,
1.014911, -0.7830374, 0.4955717, 1, 0, 0.9843137, 1,
1.016517, 0.397124, 0.9530756, 1, 0, 0.9764706, 1,
1.022216, -2.115881, 4.901686, 1, 0, 0.972549, 1,
1.02275, -1.122109, 2.651544, 1, 0, 0.9647059, 1,
1.023306, 0.6338747, 0.8920698, 1, 0, 0.9607843, 1,
1.023838, 1.420572, -0.1916904, 1, 0, 0.9529412, 1,
1.028887, 0.9195275, 1.598741, 1, 0, 0.9490196, 1,
1.031154, -1.914547, 4.069421, 1, 0, 0.9411765, 1,
1.032799, 0.9457567, 2.616482, 1, 0, 0.9372549, 1,
1.033872, -1.993773, 2.200556, 1, 0, 0.9294118, 1,
1.039139, -2.177217, 4.446902, 1, 0, 0.9254902, 1,
1.041052, 1.704138, 0.5572988, 1, 0, 0.9176471, 1,
1.046706, -0.4031179, 1.005142, 1, 0, 0.9137255, 1,
1.074982, -0.1842977, 1.513498, 1, 0, 0.9058824, 1,
1.080311, 0.3562377, -1.928072, 1, 0, 0.9019608, 1,
1.084946, 0.1281966, 1.417382, 1, 0, 0.8941177, 1,
1.096418, -0.2365794, 0.5221898, 1, 0, 0.8862745, 1,
1.096899, 0.7868909, 0.7619003, 1, 0, 0.8823529, 1,
1.101793, -0.4535081, 3.94694, 1, 0, 0.8745098, 1,
1.10725, -0.4624877, 3.220689, 1, 0, 0.8705882, 1,
1.115102, 0.5937632, 2.66591, 1, 0, 0.8627451, 1,
1.131214, 0.4749773, 2.567194, 1, 0, 0.8588235, 1,
1.140069, -1.203779, 4.193373, 1, 0, 0.8509804, 1,
1.151207, 2.150014, 2.626153, 1, 0, 0.8470588, 1,
1.15259, 2.079391, 1.573651, 1, 0, 0.8392157, 1,
1.155896, 1.242395, -0.6583413, 1, 0, 0.8352941, 1,
1.160013, -0.8506326, 1.164448, 1, 0, 0.827451, 1,
1.17083, -0.812612, 3.37016, 1, 0, 0.8235294, 1,
1.173838, 0.401576, 3.117355, 1, 0, 0.8156863, 1,
1.174222, -0.0742281, -0.7442303, 1, 0, 0.8117647, 1,
1.175108, 1.183905, 1.285631, 1, 0, 0.8039216, 1,
1.190398, -0.1044304, 2.25608, 1, 0, 0.7960784, 1,
1.193028, -1.302273, 2.499573, 1, 0, 0.7921569, 1,
1.196447, -1.220537, 1.067931, 1, 0, 0.7843137, 1,
1.19938, -1.06034, 2.579791, 1, 0, 0.7803922, 1,
1.200729, -0.1984221, 1.588639, 1, 0, 0.772549, 1,
1.201713, 0.947595, 1.213454, 1, 0, 0.7686275, 1,
1.203742, -1.426031, 3.410627, 1, 0, 0.7607843, 1,
1.208313, 1.010022, 2.818345, 1, 0, 0.7568628, 1,
1.211147, -1.430472, 1.954587, 1, 0, 0.7490196, 1,
1.212794, -0.3701188, 3.920716, 1, 0, 0.7450981, 1,
1.233699, -0.7341359, -0.04397201, 1, 0, 0.7372549, 1,
1.233757, -0.1683396, 1.163791, 1, 0, 0.7333333, 1,
1.243579, 2.317254, 0.8603362, 1, 0, 0.7254902, 1,
1.251499, -1.026857, 3.699811, 1, 0, 0.7215686, 1,
1.254751, -0.2216118, 1.684361, 1, 0, 0.7137255, 1,
1.26038, 0.4585593, 2.988977, 1, 0, 0.7098039, 1,
1.260657, -0.5381575, 0.06324397, 1, 0, 0.7019608, 1,
1.263231, 1.022808, 0.9311034, 1, 0, 0.6941177, 1,
1.278572, -0.8065158, 2.47539, 1, 0, 0.6901961, 1,
1.282143, -0.09693073, 0.1904174, 1, 0, 0.682353, 1,
1.292634, 0.9902298, 0.08160253, 1, 0, 0.6784314, 1,
1.293666, -0.467481, 3.628119, 1, 0, 0.6705883, 1,
1.293751, -0.1236458, 2.883426, 1, 0, 0.6666667, 1,
1.295333, -1.536658, 2.96139, 1, 0, 0.6588235, 1,
1.320816, -0.005707459, 1.324677, 1, 0, 0.654902, 1,
1.323057, 0.6341564, 0.1605056, 1, 0, 0.6470588, 1,
1.325955, -1.286216, 3.582583, 1, 0, 0.6431373, 1,
1.328451, -0.02478919, 0.484062, 1, 0, 0.6352941, 1,
1.331491, 0.2268277, 3.100257, 1, 0, 0.6313726, 1,
1.335809, -0.1226682, 0.9912718, 1, 0, 0.6235294, 1,
1.34571, 3.690516, -1.198892, 1, 0, 0.6196079, 1,
1.346465, -0.4075408, 1.827796, 1, 0, 0.6117647, 1,
1.351368, 0.1060566, 1.152903, 1, 0, 0.6078432, 1,
1.35878, -0.7961966, 0.7708392, 1, 0, 0.6, 1,
1.362878, -0.5491596, 0.996904, 1, 0, 0.5921569, 1,
1.382611, -0.4735226, 0.2256069, 1, 0, 0.5882353, 1,
1.401395, -1.152924, 1.521017, 1, 0, 0.5803922, 1,
1.405457, -0.2466281, 2.690895, 1, 0, 0.5764706, 1,
1.423861, 0.2941487, 0.5601147, 1, 0, 0.5686275, 1,
1.431247, -0.7432658, 3.167593, 1, 0, 0.5647059, 1,
1.432774, 2.425011, 0.2817159, 1, 0, 0.5568628, 1,
1.438075, 1.196676, 0.6554031, 1, 0, 0.5529412, 1,
1.43829, -1.01922, 2.030781, 1, 0, 0.5450981, 1,
1.442616, -2.614398, 1.530488, 1, 0, 0.5411765, 1,
1.446225, -0.1538177, 3.380311, 1, 0, 0.5333334, 1,
1.448376, 1.294257, 1.2539, 1, 0, 0.5294118, 1,
1.463155, -0.1438966, 1.843528, 1, 0, 0.5215687, 1,
1.465404, -0.3118215, 1.160173, 1, 0, 0.5176471, 1,
1.465474, 0.08111948, 1.172128, 1, 0, 0.509804, 1,
1.498039, 2.095301, -0.619973, 1, 0, 0.5058824, 1,
1.500558, 1.852026, 0.5897454, 1, 0, 0.4980392, 1,
1.505015, 0.2805594, 1.61655, 1, 0, 0.4901961, 1,
1.505103, 0.3912977, -0.5637165, 1, 0, 0.4862745, 1,
1.509064, -0.1126264, 3.304287, 1, 0, 0.4784314, 1,
1.520665, -1.61706, 1.979243, 1, 0, 0.4745098, 1,
1.530605, 0.7314233, -0.1098848, 1, 0, 0.4666667, 1,
1.535019, 0.1008034, 1.036576, 1, 0, 0.4627451, 1,
1.537033, -0.5972191, 3.566208, 1, 0, 0.454902, 1,
1.545726, 1.651862, 1.02591, 1, 0, 0.4509804, 1,
1.584729, 0.4980676, 1.943924, 1, 0, 0.4431373, 1,
1.591148, -0.6004567, 2.806038, 1, 0, 0.4392157, 1,
1.598865, 0.1061804, 1.895169, 1, 0, 0.4313726, 1,
1.611463, 0.6474121, -0.1078497, 1, 0, 0.427451, 1,
1.613934, 0.06975234, 0.686466, 1, 0, 0.4196078, 1,
1.615072, -1.202621, 1.261397, 1, 0, 0.4156863, 1,
1.620919, 0.2622272, 0.09197184, 1, 0, 0.4078431, 1,
1.628412, -0.9442739, 2.280285, 1, 0, 0.4039216, 1,
1.630446, -1.426492, 1.731053, 1, 0, 0.3960784, 1,
1.640383, -0.4723661, 3.129013, 1, 0, 0.3882353, 1,
1.644345, 1.468952, 0.4041364, 1, 0, 0.3843137, 1,
1.65637, 0.3506882, 2.260488, 1, 0, 0.3764706, 1,
1.657118, 0.8355686, 1.614489, 1, 0, 0.372549, 1,
1.660877, 0.340183, 1.064824, 1, 0, 0.3647059, 1,
1.663208, 0.03885716, 0.05642546, 1, 0, 0.3607843, 1,
1.670252, 0.522102, 0.2261077, 1, 0, 0.3529412, 1,
1.677463, 0.05763169, 0.8827612, 1, 0, 0.3490196, 1,
1.684456, -1.14238, 2.567022, 1, 0, 0.3411765, 1,
1.685344, -0.9695233, 2.9849, 1, 0, 0.3372549, 1,
1.693097, -1.513414, 2.867337, 1, 0, 0.3294118, 1,
1.697202, 0.6066622, 0.4673496, 1, 0, 0.3254902, 1,
1.713076, -0.3625791, 2.382451, 1, 0, 0.3176471, 1,
1.721611, -1.181272, 1.24354, 1, 0, 0.3137255, 1,
1.730354, -1.030108, 0.4141777, 1, 0, 0.3058824, 1,
1.734407, -0.529218, 1.7216, 1, 0, 0.2980392, 1,
1.742144, -0.5511629, 1.809999, 1, 0, 0.2941177, 1,
1.750957, -1.874263, 3.907171, 1, 0, 0.2862745, 1,
1.764227, 1.053501, 0.6145997, 1, 0, 0.282353, 1,
1.786393, -0.3399521, 0.8963861, 1, 0, 0.2745098, 1,
1.827914, 0.2139161, 1.666712, 1, 0, 0.2705882, 1,
1.829025, -0.6178389, 1.89648, 1, 0, 0.2627451, 1,
1.834959, -0.41362, 1.687843, 1, 0, 0.2588235, 1,
1.836217, 0.5130578, 1.107146, 1, 0, 0.2509804, 1,
1.841612, 1.006638, 1.312523, 1, 0, 0.2470588, 1,
1.846817, -0.1471495, 1.268289, 1, 0, 0.2392157, 1,
1.855163, 0.5968745, 1.129003, 1, 0, 0.2352941, 1,
1.859835, 0.4542226, 1.515239, 1, 0, 0.227451, 1,
1.862162, 1.41873, 1.842817, 1, 0, 0.2235294, 1,
1.865772, 0.04422968, 1.914702, 1, 0, 0.2156863, 1,
1.8932, -1.310796, 1.912148, 1, 0, 0.2117647, 1,
1.89953, 0.2648749, 2.299342, 1, 0, 0.2039216, 1,
1.922241, -1.498238, 2.188676, 1, 0, 0.1960784, 1,
1.924881, -2.260797, 3.469687, 1, 0, 0.1921569, 1,
1.937986, -1.027859, 3.128344, 1, 0, 0.1843137, 1,
1.948631, 1.912149, 3.089988, 1, 0, 0.1803922, 1,
1.962839, -0.3334187, 2.982938, 1, 0, 0.172549, 1,
1.968618, 0.1184255, 1.496767, 1, 0, 0.1686275, 1,
1.969556, -1.16547, 0.8111423, 1, 0, 0.1607843, 1,
1.976358, 0.398065, 1.780013, 1, 0, 0.1568628, 1,
1.988814, -0.9397356, 2.62265, 1, 0, 0.1490196, 1,
2.006861, -0.7259922, 2.448038, 1, 0, 0.145098, 1,
2.020874, 0.7108272, 0.2540493, 1, 0, 0.1372549, 1,
2.047777, -1.049629, -0.7552976, 1, 0, 0.1333333, 1,
2.053222, -0.2031058, 2.547649, 1, 0, 0.1254902, 1,
2.109033, -0.03397273, 1.361533, 1, 0, 0.1215686, 1,
2.112526, -0.8821394, 0.7078296, 1, 0, 0.1137255, 1,
2.175217, -0.3130641, 0.9398317, 1, 0, 0.1098039, 1,
2.184106, 0.16941, -0.2620766, 1, 0, 0.1019608, 1,
2.261765, 0.4597132, 2.497782, 1, 0, 0.09411765, 1,
2.274185, -1.703628, 1.636114, 1, 0, 0.09019608, 1,
2.351858, -2.455011, 3.695454, 1, 0, 0.08235294, 1,
2.352552, -1.165939, 2.059106, 1, 0, 0.07843138, 1,
2.425802, 0.07942107, 1.330406, 1, 0, 0.07058824, 1,
2.463742, -0.5703643, 0.8896872, 1, 0, 0.06666667, 1,
2.486596, -0.3972152, 1.180418, 1, 0, 0.05882353, 1,
2.553437, -0.4484001, 1.635162, 1, 0, 0.05490196, 1,
2.578729, 1.157202, 1.040651, 1, 0, 0.04705882, 1,
2.598386, -0.51886, 1.837334, 1, 0, 0.04313726, 1,
2.704235, 0.8500756, 1.382305, 1, 0, 0.03529412, 1,
2.716255, 1.710174, 0.6434364, 1, 0, 0.03137255, 1,
2.827883, 1.227525, -0.2040792, 1, 0, 0.02352941, 1,
2.920564, -0.16203, 2.949678, 1, 0, 0.01960784, 1,
2.971589, -2.03541, 4.388167, 1, 0, 0.01176471, 1,
3.20383, -0.4453103, 2.094525, 1, 0, 0.007843138, 1
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
0.1041024, -4.817863, -7.251167, 0, -0.5, 0.5, 0.5,
0.1041024, -4.817863, -7.251167, 1, -0.5, 0.5, 0.5,
0.1041024, -4.817863, -7.251167, 1, 1.5, 0.5, 0.5,
0.1041024, -4.817863, -7.251167, 0, 1.5, 0.5, 0.5
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
-4.046433, 0.05290234, -7.251167, 0, -0.5, 0.5, 0.5,
-4.046433, 0.05290234, -7.251167, 1, -0.5, 0.5, 0.5,
-4.046433, 0.05290234, -7.251167, 1, 1.5, 0.5, 0.5,
-4.046433, 0.05290234, -7.251167, 0, 1.5, 0.5, 0.5
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
-4.046433, -4.817863, -0.111433, 0, -0.5, 0.5, 0.5,
-4.046433, -4.817863, -0.111433, 1, -0.5, 0.5, 0.5,
-4.046433, -4.817863, -0.111433, 1, 1.5, 0.5, 0.5,
-4.046433, -4.817863, -0.111433, 0, 1.5, 0.5, 0.5
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
-2, -3.69384, -5.603536,
3, -3.69384, -5.603536,
-2, -3.69384, -5.603536,
-2, -3.881177, -5.878141,
-1, -3.69384, -5.603536,
-1, -3.881177, -5.878141,
0, -3.69384, -5.603536,
0, -3.881177, -5.878141,
1, -3.69384, -5.603536,
1, -3.881177, -5.878141,
2, -3.69384, -5.603536,
2, -3.881177, -5.878141,
3, -3.69384, -5.603536,
3, -3.881177, -5.878141
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
-2, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
-2, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
-2, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
-2, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5,
-1, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
-1, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
-1, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
-1, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5,
0, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
0, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
0, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
0, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5,
1, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
1, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
1, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
1, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5,
2, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
2, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
2, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
2, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5,
3, -4.255852, -6.427351, 0, -0.5, 0.5, 0.5,
3, -4.255852, -6.427351, 1, -0.5, 0.5, 0.5,
3, -4.255852, -6.427351, 1, 1.5, 0.5, 0.5,
3, -4.255852, -6.427351, 0, 1.5, 0.5, 0.5
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
-3.088617, -2, -5.603536,
-3.088617, 2, -5.603536,
-3.088617, -2, -5.603536,
-3.248253, -2, -5.878141,
-3.088617, 0, -5.603536,
-3.248253, 0, -5.878141,
-3.088617, 2, -5.603536,
-3.248253, 2, -5.878141
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
-3.567525, -2, -6.427351, 0, -0.5, 0.5, 0.5,
-3.567525, -2, -6.427351, 1, -0.5, 0.5, 0.5,
-3.567525, -2, -6.427351, 1, 1.5, 0.5, 0.5,
-3.567525, -2, -6.427351, 0, 1.5, 0.5, 0.5,
-3.567525, 0, -6.427351, 0, -0.5, 0.5, 0.5,
-3.567525, 0, -6.427351, 1, -0.5, 0.5, 0.5,
-3.567525, 0, -6.427351, 1, 1.5, 0.5, 0.5,
-3.567525, 0, -6.427351, 0, 1.5, 0.5, 0.5,
-3.567525, 2, -6.427351, 0, -0.5, 0.5, 0.5,
-3.567525, 2, -6.427351, 1, -0.5, 0.5, 0.5,
-3.567525, 2, -6.427351, 1, 1.5, 0.5, 0.5,
-3.567525, 2, -6.427351, 0, 1.5, 0.5, 0.5
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
-3.088617, -3.69384, -4,
-3.088617, -3.69384, 4,
-3.088617, -3.69384, -4,
-3.248253, -3.881177, -4,
-3.088617, -3.69384, -2,
-3.248253, -3.881177, -2,
-3.088617, -3.69384, 0,
-3.248253, -3.881177, 0,
-3.088617, -3.69384, 2,
-3.248253, -3.881177, 2,
-3.088617, -3.69384, 4,
-3.248253, -3.881177, 4
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
-3.567525, -4.255852, -4, 0, -0.5, 0.5, 0.5,
-3.567525, -4.255852, -4, 1, -0.5, 0.5, 0.5,
-3.567525, -4.255852, -4, 1, 1.5, 0.5, 0.5,
-3.567525, -4.255852, -4, 0, 1.5, 0.5, 0.5,
-3.567525, -4.255852, -2, 0, -0.5, 0.5, 0.5,
-3.567525, -4.255852, -2, 1, -0.5, 0.5, 0.5,
-3.567525, -4.255852, -2, 1, 1.5, 0.5, 0.5,
-3.567525, -4.255852, -2, 0, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 0, 0, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 0, 1, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 0, 1, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 0, 0, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 2, 0, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 2, 1, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 2, 1, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 2, 0, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 4, 0, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 4, 1, -0.5, 0.5, 0.5,
-3.567525, -4.255852, 4, 1, 1.5, 0.5, 0.5,
-3.567525, -4.255852, 4, 0, 1.5, 0.5, 0.5
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
-3.088617, -3.69384, -5.603536,
-3.088617, 3.799645, -5.603536,
-3.088617, -3.69384, 5.38067,
-3.088617, 3.799645, 5.38067,
-3.088617, -3.69384, -5.603536,
-3.088617, -3.69384, 5.38067,
-3.088617, 3.799645, -5.603536,
-3.088617, 3.799645, 5.38067,
-3.088617, -3.69384, -5.603536,
3.296822, -3.69384, -5.603536,
-3.088617, -3.69384, 5.38067,
3.296822, -3.69384, 5.38067,
-3.088617, 3.799645, -5.603536,
3.296822, 3.799645, -5.603536,
-3.088617, 3.799645, 5.38067,
3.296822, 3.799645, 5.38067,
3.296822, -3.69384, -5.603536,
3.296822, 3.799645, -5.603536,
3.296822, -3.69384, 5.38067,
3.296822, 3.799645, 5.38067,
3.296822, -3.69384, -5.603536,
3.296822, -3.69384, 5.38067,
3.296822, 3.799645, -5.603536,
3.296822, 3.799645, 5.38067
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
var radius = 7.876511;
var distance = 35.04349;
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
mvMatrix.translate( -0.1041024, -0.05290234, 0.111433 );
mvMatrix.scale( 1.333697, 1.136486, 0.7753167 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.04349);
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
eleven<-read.table("eleven.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-eleven$V2
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
```

```r
y<-eleven$V3
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
```

```r
z<-eleven$V4
```

```
## Error in eval(expr, envir, enclos): object 'eleven' not found
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
-2.995625, 1.549091, -0.7407697, 0, 0, 1, 1, 1,
-2.548177, -0.2872045, -3.1952, 1, 0, 0, 1, 1,
-2.490865, 1.664325, -1.325359, 1, 0, 0, 1, 1,
-2.487939, 0.6973689, -1.144584, 1, 0, 0, 1, 1,
-2.466377, 0.0985114, -3.381637, 1, 0, 0, 1, 1,
-2.421191, -0.03376441, -1.128663, 1, 0, 0, 1, 1,
-2.39862, -0.3739136, -0.6726912, 0, 0, 0, 1, 1,
-2.378105, -1.531575, -3.552176, 0, 0, 0, 1, 1,
-2.362057, -0.7890696, -2.59471, 0, 0, 0, 1, 1,
-2.352705, -0.9254083, -1.931411, 0, 0, 0, 1, 1,
-2.323329, -1.01836, -0.3845548, 0, 0, 0, 1, 1,
-2.274429, -1.624026, -2.468163, 0, 0, 0, 1, 1,
-2.267888, -0.3487487, -2.555902, 0, 0, 0, 1, 1,
-2.214006, -0.8891886, -2.836383, 1, 1, 1, 1, 1,
-2.187945, -0.5806201, -0.9069905, 1, 1, 1, 1, 1,
-2.168963, 1.564012, -1.105268, 1, 1, 1, 1, 1,
-2.165416, -0.6211501, -1.659501, 1, 1, 1, 1, 1,
-2.096345, 1.904995, -1.629976, 1, 1, 1, 1, 1,
-2.087758, 2.120408, -0.7423168, 1, 1, 1, 1, 1,
-2.070072, -1.084556, -1.789776, 1, 1, 1, 1, 1,
-2.058083, 0.2332694, -2.760749, 1, 1, 1, 1, 1,
-2.014383, -0.9206967, -2.228161, 1, 1, 1, 1, 1,
-1.96722, 0.9162838, -2.059793, 1, 1, 1, 1, 1,
-1.960679, 0.2178904, -1.867951, 1, 1, 1, 1, 1,
-1.91035, 0.168816, 0.4974138, 1, 1, 1, 1, 1,
-1.875673, -1.089989, -0.642044, 1, 1, 1, 1, 1,
-1.865419, -0.4223791, -1.31847, 1, 1, 1, 1, 1,
-1.863451, -0.406942, -1.790013, 1, 1, 1, 1, 1,
-1.845049, -0.2747242, 0.4794143, 0, 0, 1, 1, 1,
-1.843024, 0.6974659, -1.175628, 1, 0, 0, 1, 1,
-1.828637, -0.6427631, 0.5920497, 1, 0, 0, 1, 1,
-1.827128, 1.523301, 0.1409883, 1, 0, 0, 1, 1,
-1.791936, -0.4541861, -3.056304, 1, 0, 0, 1, 1,
-1.771045, -0.2209409, -2.476379, 1, 0, 0, 1, 1,
-1.768007, 0.5325466, -2.204466, 0, 0, 0, 1, 1,
-1.753333, 0.3655299, -1.924205, 0, 0, 0, 1, 1,
-1.725704, 1.195742, 0.7481427, 0, 0, 0, 1, 1,
-1.6914, 0.9680442, 0.04359072, 0, 0, 0, 1, 1,
-1.679501, -0.2246641, -1.894209, 0, 0, 0, 1, 1,
-1.673496, 0.1960299, -0.8692202, 0, 0, 0, 1, 1,
-1.664325, 1.296977, -1.861156, 0, 0, 0, 1, 1,
-1.638666, 0.8257996, -0.7262578, 1, 1, 1, 1, 1,
-1.636373, 1.131811, -2.081945, 1, 1, 1, 1, 1,
-1.632795, 0.3637144, -3.091468, 1, 1, 1, 1, 1,
-1.627309, 0.1742473, -2.671675, 1, 1, 1, 1, 1,
-1.610801, 0.8402303, -0.1961141, 1, 1, 1, 1, 1,
-1.590658, 1.603368, -1.375013, 1, 1, 1, 1, 1,
-1.573545, 0.2298207, -3.166761, 1, 1, 1, 1, 1,
-1.572114, 0.2845597, -1.933848, 1, 1, 1, 1, 1,
-1.534621, 0.7529367, -3.342587, 1, 1, 1, 1, 1,
-1.524649, 0.4653176, -1.480003, 1, 1, 1, 1, 1,
-1.498205, -0.6737586, -1.063543, 1, 1, 1, 1, 1,
-1.492929, -0.08199721, 0.06320331, 1, 1, 1, 1, 1,
-1.486248, -0.9450823, -4.389597, 1, 1, 1, 1, 1,
-1.484555, 1.344452, 0.6764954, 1, 1, 1, 1, 1,
-1.483884, -0.009977003, -1.941246, 1, 1, 1, 1, 1,
-1.47245, -2.119059, -3.079454, 0, 0, 1, 1, 1,
-1.463031, 1.222693, -0.9131569, 1, 0, 0, 1, 1,
-1.462266, -0.1142354, 0.166118, 1, 0, 0, 1, 1,
-1.461701, -0.6880893, -1.260918, 1, 0, 0, 1, 1,
-1.444488, -0.5964408, -3.138722, 1, 0, 0, 1, 1,
-1.426656, -0.2088791, -3.013498, 1, 0, 0, 1, 1,
-1.422696, -0.6223774, -2.505193, 0, 0, 0, 1, 1,
-1.422549, -0.3793266, -1.904387, 0, 0, 0, 1, 1,
-1.413775, 1.237947, -2.15663, 0, 0, 0, 1, 1,
-1.402532, 0.3879454, -1.773345, 0, 0, 0, 1, 1,
-1.39787, -2.481156, -2.617685, 0, 0, 0, 1, 1,
-1.39489, -0.7825872, -1.875785, 0, 0, 0, 1, 1,
-1.39388, -1.130596, -1.847065, 0, 0, 0, 1, 1,
-1.389158, -1.056796, -3.602102, 1, 1, 1, 1, 1,
-1.389022, 1.785427, -0.5064451, 1, 1, 1, 1, 1,
-1.379745, -1.082723, -2.495956, 1, 1, 1, 1, 1,
-1.379481, 1.423689, -1.390483, 1, 1, 1, 1, 1,
-1.375512, -1.576497, -4.370554, 1, 1, 1, 1, 1,
-1.37153, 0.06080079, -2.342904, 1, 1, 1, 1, 1,
-1.367115, -1.031833, -0.823112, 1, 1, 1, 1, 1,
-1.363345, -0.3118391, -2.126662, 1, 1, 1, 1, 1,
-1.357665, -1.292771, -3.033378, 1, 1, 1, 1, 1,
-1.357524, -0.9417851, -1.797982, 1, 1, 1, 1, 1,
-1.356381, -0.07964557, -1.978271, 1, 1, 1, 1, 1,
-1.350658, -0.6005284, -0.517664, 1, 1, 1, 1, 1,
-1.348365, 0.551249, -1.239325, 1, 1, 1, 1, 1,
-1.344002, -0.1115507, 1.025948, 1, 1, 1, 1, 1,
-1.34269, 0.4489988, -1.463345, 1, 1, 1, 1, 1,
-1.33657, 1.110137, -1.220408, 0, 0, 1, 1, 1,
-1.334216, 0.6199393, -1.758489, 1, 0, 0, 1, 1,
-1.33289, -0.6165553, -2.698525, 1, 0, 0, 1, 1,
-1.315711, -0.6655715, -0.2718856, 1, 0, 0, 1, 1,
-1.304632, -2.705736, -3.805993, 1, 0, 0, 1, 1,
-1.296116, -1.06266, -2.744688, 1, 0, 0, 1, 1,
-1.279563, -1.20253, -3.698176, 0, 0, 0, 1, 1,
-1.270959, -0.5990865, -2.522645, 0, 0, 0, 1, 1,
-1.270813, -0.6033227, -1.626675, 0, 0, 0, 1, 1,
-1.258398, -0.6706183, -5.443572, 0, 0, 0, 1, 1,
-1.257346, 0.5425531, -0.8743864, 0, 0, 0, 1, 1,
-1.256716, 0.6185309, -2.299862, 0, 0, 0, 1, 1,
-1.251055, 0.2482238, -2.598946, 0, 0, 0, 1, 1,
-1.243776, 0.1007149, -0.8851944, 1, 1, 1, 1, 1,
-1.242485, -0.1500239, -1.739735, 1, 1, 1, 1, 1,
-1.228017, 0.2023535, 0.08867442, 1, 1, 1, 1, 1,
-1.2235, 2.526151, -0.03589706, 1, 1, 1, 1, 1,
-1.222523, -0.8511082, -2.274183, 1, 1, 1, 1, 1,
-1.222171, 1.600078, -0.8421615, 1, 1, 1, 1, 1,
-1.220276, 1.172292, -1.611402, 1, 1, 1, 1, 1,
-1.217928, -0.8641647, -2.436354, 1, 1, 1, 1, 1,
-1.215433, -0.7333984, -2.529172, 1, 1, 1, 1, 1,
-1.21248, -0.4154209, -1.968313, 1, 1, 1, 1, 1,
-1.20609, 1.295229, 0.4581302, 1, 1, 1, 1, 1,
-1.203822, 1.3941, -0.2152895, 1, 1, 1, 1, 1,
-1.200536, 1.891484, -0.3384497, 1, 1, 1, 1, 1,
-1.19004, -0.1596217, 0.2234575, 1, 1, 1, 1, 1,
-1.184608, 2.325562, 0.06109414, 1, 1, 1, 1, 1,
-1.177042, -0.2834889, -2.633084, 0, 0, 1, 1, 1,
-1.172437, 1.237045, -1.254851, 1, 0, 0, 1, 1,
-1.169794, -0.2891596, -3.024431, 1, 0, 0, 1, 1,
-1.165832, 0.1822746, -0.4497347, 1, 0, 0, 1, 1,
-1.153774, 0.5600691, -2.214994, 1, 0, 0, 1, 1,
-1.15302, -0.03972635, -1.893995, 1, 0, 0, 1, 1,
-1.150415, -0.3193195, -1.489829, 0, 0, 0, 1, 1,
-1.14723, 0.03928731, -1.811397, 0, 0, 0, 1, 1,
-1.138021, -0.03488406, 0.4873968, 0, 0, 0, 1, 1,
-1.134034, 0.5404028, -3.606656, 0, 0, 0, 1, 1,
-1.12613, -1.178095, -1.556949, 0, 0, 0, 1, 1,
-1.121363, -1.022989, -3.67103, 0, 0, 0, 1, 1,
-1.120496, -0.540924, -0.9907061, 0, 0, 0, 1, 1,
-1.120033, 0.1260423, -3.157244, 1, 1, 1, 1, 1,
-1.108326, -2.045802, -1.988269, 1, 1, 1, 1, 1,
-1.103356, 0.8738576, -1.056846, 1, 1, 1, 1, 1,
-1.090744, 0.8064097, -0.278303, 1, 1, 1, 1, 1,
-1.085401, -1.036209, -3.540499, 1, 1, 1, 1, 1,
-1.080657, -1.176532, -3.106433, 1, 1, 1, 1, 1,
-1.075362, -2.898694, -2.633289, 1, 1, 1, 1, 1,
-1.072245, 0.2545899, -0.9217367, 1, 1, 1, 1, 1,
-1.067609, 0.602316, -0.967877, 1, 1, 1, 1, 1,
-1.066863, 0.5838661, -0.8006545, 1, 1, 1, 1, 1,
-1.064682, -0.4877448, -2.178141, 1, 1, 1, 1, 1,
-1.060861, 0.422677, -0.5753552, 1, 1, 1, 1, 1,
-1.060093, 0.7298838, -3.131883, 1, 1, 1, 1, 1,
-1.058287, 0.3126362, 0.1736723, 1, 1, 1, 1, 1,
-1.051151, 0.168671, -1.473456, 1, 1, 1, 1, 1,
-1.045126, -0.6037316, -1.994406, 0, 0, 1, 1, 1,
-1.037078, -0.2618531, -1.323982, 1, 0, 0, 1, 1,
-1.024736, 0.8184377, -0.1807697, 1, 0, 0, 1, 1,
-1.021159, -1.195406, -2.575335, 1, 0, 0, 1, 1,
-1.021001, 2.431705, -0.8997598, 1, 0, 0, 1, 1,
-1.011301, -1.336004, -2.649147, 1, 0, 0, 1, 1,
-1.010666, 1.568332, -0.03849773, 0, 0, 0, 1, 1,
-1.003189, -0.759883, -2.744604, 0, 0, 0, 1, 1,
-1.001007, 1.342546, -0.3118508, 0, 0, 0, 1, 1,
-0.9986501, -2.037472, -3.823238, 0, 0, 0, 1, 1,
-0.9983349, -1.896982, -3.592844, 0, 0, 0, 1, 1,
-0.9936901, 1.015089, -0.5302166, 0, 0, 0, 1, 1,
-0.9916111, -0.5958165, -0.1428628, 0, 0, 0, 1, 1,
-0.9898775, -0.5267, -2.355565, 1, 1, 1, 1, 1,
-0.9879452, 1.248634, -1.199365, 1, 1, 1, 1, 1,
-0.9874564, 0.414093, -0.2484573, 1, 1, 1, 1, 1,
-0.9839553, 2.300095, 0.750133, 1, 1, 1, 1, 1,
-0.9701986, -0.5072629, -3.728474, 1, 1, 1, 1, 1,
-0.9662641, -0.9357377, -1.274028, 1, 1, 1, 1, 1,
-0.9618111, 0.4942578, -3.215021, 1, 1, 1, 1, 1,
-0.9610118, -1.264335, -2.901994, 1, 1, 1, 1, 1,
-0.9592938, 1.086679, -0.5997542, 1, 1, 1, 1, 1,
-0.9584376, -0.1951488, -1.125328, 1, 1, 1, 1, 1,
-0.951423, -1.724446, -2.983567, 1, 1, 1, 1, 1,
-0.940682, 0.3608025, -0.5024492, 1, 1, 1, 1, 1,
-0.9323647, 0.1633935, -0.8538221, 1, 1, 1, 1, 1,
-0.9256921, -1.322106, -2.874441, 1, 1, 1, 1, 1,
-0.9200433, -0.8117636, -2.222975, 1, 1, 1, 1, 1,
-0.9144973, 0.4453127, 0.07668115, 0, 0, 1, 1, 1,
-0.9144377, -0.827635, -3.41388, 1, 0, 0, 1, 1,
-0.9125043, 0.9590449, -0.8792834, 1, 0, 0, 1, 1,
-0.9107732, 0.6114584, -1.146253, 1, 0, 0, 1, 1,
-0.9067524, -0.9604009, -3.180362, 1, 0, 0, 1, 1,
-0.9058729, -0.06936571, -1.11713, 1, 0, 0, 1, 1,
-0.9035525, 1.70547, -0.7077981, 0, 0, 0, 1, 1,
-0.9014468, -2.553914, -3.864354, 0, 0, 0, 1, 1,
-0.8995273, -1.191147, -1.579852, 0, 0, 0, 1, 1,
-0.8903975, 0.3459475, -2.172754, 0, 0, 0, 1, 1,
-0.88841, 1.404465, 0.4900467, 0, 0, 0, 1, 1,
-0.8863302, 0.6661074, -1.633018, 0, 0, 0, 1, 1,
-0.873353, 0.7553087, -2.79333, 0, 0, 0, 1, 1,
-0.8706991, -0.2643796, 0.3812408, 1, 1, 1, 1, 1,
-0.8705269, 1.245797, -1.041706, 1, 1, 1, 1, 1,
-0.8685434, 0.9231378, -0.963553, 1, 1, 1, 1, 1,
-0.8580412, -0.8012367, -3.255692, 1, 1, 1, 1, 1,
-0.8513491, 0.4207872, -1.291498, 1, 1, 1, 1, 1,
-0.8506847, -0.2018343, -1.863962, 1, 1, 1, 1, 1,
-0.8459889, 0.3837515, -1.444542, 1, 1, 1, 1, 1,
-0.8413697, -0.9789285, -3.856301, 1, 1, 1, 1, 1,
-0.8404847, -1.389701, -2.456091, 1, 1, 1, 1, 1,
-0.8380492, -0.1506179, -3.834217, 1, 1, 1, 1, 1,
-0.8373132, -0.887618, -3.044177, 1, 1, 1, 1, 1,
-0.8328035, 1.115695, -0.6359603, 1, 1, 1, 1, 1,
-0.8315105, -2.12008, -4.55807, 1, 1, 1, 1, 1,
-0.8255737, -1.359019, -1.900464, 1, 1, 1, 1, 1,
-0.8247032, 0.2811886, -0.5350851, 1, 1, 1, 1, 1,
-0.8165811, -1.395073, -3.675602, 0, 0, 1, 1, 1,
-0.8156938, -2.266417, -1.685947, 1, 0, 0, 1, 1,
-0.8147098, 0.5166044, -1.625713, 1, 0, 0, 1, 1,
-0.8131188, -0.06724047, -2.348191, 1, 0, 0, 1, 1,
-0.8105653, -1.150082, -0.5123096, 1, 0, 0, 1, 1,
-0.8093109, 0.1573988, -0.04702298, 1, 0, 0, 1, 1,
-0.8054352, 0.8567953, -1.434825, 0, 0, 0, 1, 1,
-0.8019049, 0.7712892, -1.233482, 0, 0, 0, 1, 1,
-0.7984582, 0.1749526, -1.017058, 0, 0, 0, 1, 1,
-0.7946953, 0.5689841, -0.9251226, 0, 0, 0, 1, 1,
-0.7879867, 1.537146, -0.2830669, 0, 0, 0, 1, 1,
-0.7856581, -0.03487039, -0.3479747, 0, 0, 0, 1, 1,
-0.7854715, -0.3385333, -1.978649, 0, 0, 0, 1, 1,
-0.7764282, -0.2603611, -1.131849, 1, 1, 1, 1, 1,
-0.7744454, 1.167567, -1.493664, 1, 1, 1, 1, 1,
-0.7707044, -0.660665, -1.59294, 1, 1, 1, 1, 1,
-0.7675843, 0.75155, -1.460897, 1, 1, 1, 1, 1,
-0.766681, -0.1373115, -0.3651188, 1, 1, 1, 1, 1,
-0.7665772, -0.3392095, -2.403733, 1, 1, 1, 1, 1,
-0.7653544, -1.928619, -3.71279, 1, 1, 1, 1, 1,
-0.7644474, -1.791116, -3.625146, 1, 1, 1, 1, 1,
-0.7637411, 1.324161, 0.7167042, 1, 1, 1, 1, 1,
-0.7623498, -0.4730026, -1.085431, 1, 1, 1, 1, 1,
-0.7586274, 1.232909, -0.03130858, 1, 1, 1, 1, 1,
-0.7550964, 0.6318704, 0.5597185, 1, 1, 1, 1, 1,
-0.7523813, -0.1818098, -1.999452, 1, 1, 1, 1, 1,
-0.7514529, 0.236971, -1.459882, 1, 1, 1, 1, 1,
-0.7508585, 1.187761, 0.2853172, 1, 1, 1, 1, 1,
-0.7480626, 0.2641617, -1.45089, 0, 0, 1, 1, 1,
-0.7477676, 0.4680961, 0.5914132, 1, 0, 0, 1, 1,
-0.7340438, -0.2419704, -2.006112, 1, 0, 0, 1, 1,
-0.7323939, 0.1018988, -2.113224, 1, 0, 0, 1, 1,
-0.725799, -2.124399, -1.9204, 1, 0, 0, 1, 1,
-0.7187956, 1.088017, -1.409234, 1, 0, 0, 1, 1,
-0.7186079, -1.782477, -2.714819, 0, 0, 0, 1, 1,
-0.7185212, 0.7310316, -1.76741, 0, 0, 0, 1, 1,
-0.7181476, 0.3231419, -1.491434, 0, 0, 0, 1, 1,
-0.7143613, -1.923249, -1.961768, 0, 0, 0, 1, 1,
-0.7062393, -0.19712, -0.4217522, 0, 0, 0, 1, 1,
-0.7003109, -0.3473862, -2.307565, 0, 0, 0, 1, 1,
-0.6977762, 0.04904483, -1.803519, 0, 0, 0, 1, 1,
-0.6948057, -0.4705061, -3.572652, 1, 1, 1, 1, 1,
-0.6897762, 0.6884344, 0.4879394, 1, 1, 1, 1, 1,
-0.6876266, -2.058939, -1.365828, 1, 1, 1, 1, 1,
-0.6840634, 0.4481305, -2.154201, 1, 1, 1, 1, 1,
-0.6834272, -0.8196002, -1.687473, 1, 1, 1, 1, 1,
-0.6809649, -0.5629674, -2.526589, 1, 1, 1, 1, 1,
-0.6797944, -1.184226, -4.218241, 1, 1, 1, 1, 1,
-0.674041, 0.2801978, -1.884546, 1, 1, 1, 1, 1,
-0.6705638, 0.2515861, -0.5521155, 1, 1, 1, 1, 1,
-0.6681697, -0.6342025, -1.347438, 1, 1, 1, 1, 1,
-0.6595503, -1.088296, -3.239792, 1, 1, 1, 1, 1,
-0.6549982, -1.455541, -3.634199, 1, 1, 1, 1, 1,
-0.6546571, 0.2925915, 0.005144116, 1, 1, 1, 1, 1,
-0.6528347, 1.317896, 0.2485929, 1, 1, 1, 1, 1,
-0.6478585, -1.716857, -1.966889, 1, 1, 1, 1, 1,
-0.6474796, -1.484812, -3.605378, 0, 0, 1, 1, 1,
-0.6420344, -1.808343, -3.208134, 1, 0, 0, 1, 1,
-0.6382468, 0.8410287, -1.396108, 1, 0, 0, 1, 1,
-0.6380336, 1.156258, 1.042088, 1, 0, 0, 1, 1,
-0.6378394, 0.2280078, -2.839877, 1, 0, 0, 1, 1,
-0.6356142, -0.4822435, 0.3376785, 1, 0, 0, 1, 1,
-0.634571, 0.7394815, -0.3138117, 0, 0, 0, 1, 1,
-0.6342057, 1.576902, 0.4520614, 0, 0, 0, 1, 1,
-0.6332294, 1.390195, -0.4875658, 0, 0, 0, 1, 1,
-0.6298832, -0.3497257, -2.262187, 0, 0, 0, 1, 1,
-0.6293182, 1.144437, 0.83209, 0, 0, 0, 1, 1,
-0.626557, 0.3467014, -1.471513, 0, 0, 0, 1, 1,
-0.6193367, -1.678779, -5.063812, 0, 0, 0, 1, 1,
-0.6183745, -0.7321383, -0.3723817, 1, 1, 1, 1, 1,
-0.6103038, -0.2553621, -1.437057, 1, 1, 1, 1, 1,
-0.6089633, 0.5320733, -1.775633, 1, 1, 1, 1, 1,
-0.6082374, -1.075545, -3.708225, 1, 1, 1, 1, 1,
-0.6063413, 0.864614, 0.1494445, 1, 1, 1, 1, 1,
-0.6042014, 0.5395129, -2.081021, 1, 1, 1, 1, 1,
-0.60141, 1.482525, 0.1569023, 1, 1, 1, 1, 1,
-0.6013689, 1.163164, -0.4612397, 1, 1, 1, 1, 1,
-0.5998834, 0.9543478, -1.089453, 1, 1, 1, 1, 1,
-0.5944785, -1.144424, -1.036484, 1, 1, 1, 1, 1,
-0.5943769, 0.5515395, -0.190603, 1, 1, 1, 1, 1,
-0.5939947, -0.8428779, -1.405569, 1, 1, 1, 1, 1,
-0.5878837, 0.09802843, -2.834598, 1, 1, 1, 1, 1,
-0.5852894, 0.9616804, -0.6766577, 1, 1, 1, 1, 1,
-0.5820269, 1.575763, 0.02688944, 1, 1, 1, 1, 1,
-0.580828, 1.211808, -0.8548432, 0, 0, 1, 1, 1,
-0.5795971, 0.1543995, -0.530368, 1, 0, 0, 1, 1,
-0.5765529, 1.184419, -1.570465, 1, 0, 0, 1, 1,
-0.5702968, 0.5885289, -0.5353723, 1, 0, 0, 1, 1,
-0.5676486, -0.6250543, -1.41437, 1, 0, 0, 1, 1,
-0.5650843, -0.9843802, -2.101065, 1, 0, 0, 1, 1,
-0.5650485, 1.340984, -0.4478268, 0, 0, 0, 1, 1,
-0.5617102, -1.599931, -4.640029, 0, 0, 0, 1, 1,
-0.5593572, 0.3687211, -2.354558, 0, 0, 0, 1, 1,
-0.5569683, 0.04166378, -1.755192, 0, 0, 0, 1, 1,
-0.5501722, -1.31068, -1.997692, 0, 0, 0, 1, 1,
-0.5486109, -0.08215223, 0.09017815, 0, 0, 0, 1, 1,
-0.5448031, -0.6203198, -2.517642, 0, 0, 0, 1, 1,
-0.530655, 0.2787308, -0.6682377, 1, 1, 1, 1, 1,
-0.5234879, -0.388832, -2.080904, 1, 1, 1, 1, 1,
-0.5184591, -0.3936772, -2.737187, 1, 1, 1, 1, 1,
-0.5142837, -1.116902, -2.468051, 1, 1, 1, 1, 1,
-0.5132462, -0.6481997, -3.867251, 1, 1, 1, 1, 1,
-0.5122844, -0.1223835, -0.7242513, 1, 1, 1, 1, 1,
-0.5117089, 0.3360508, -1.104337, 1, 1, 1, 1, 1,
-0.5110002, 0.9333109, 1.244921, 1, 1, 1, 1, 1,
-0.500244, 0.001484502, -0.8099623, 1, 1, 1, 1, 1,
-0.494013, 0.5850959, -0.0644792, 1, 1, 1, 1, 1,
-0.4928547, -0.0200835, -1.336897, 1, 1, 1, 1, 1,
-0.4904537, 1.811821, 0.8015417, 1, 1, 1, 1, 1,
-0.4882403, 0.1536968, -2.573175, 1, 1, 1, 1, 1,
-0.4793762, 0.3264654, 0.04840871, 1, 1, 1, 1, 1,
-0.4792583, 0.230105, -0.9987759, 1, 1, 1, 1, 1,
-0.4783842, -1.869343, -4.177251, 0, 0, 1, 1, 1,
-0.478107, 1.006744, 0.00600765, 1, 0, 0, 1, 1,
-0.4773008, -0.8674617, -3.475304, 1, 0, 0, 1, 1,
-0.473177, -0.3556586, -2.992388, 1, 0, 0, 1, 1,
-0.471593, 0.6540726, 0.3820502, 1, 0, 0, 1, 1,
-0.4684795, -0.147668, -1.39753, 1, 0, 0, 1, 1,
-0.4655299, 2.571522, -1.077492, 0, 0, 0, 1, 1,
-0.4619325, -0.7513978, -1.454084, 0, 0, 0, 1, 1,
-0.4595996, -1.114212, -4.499237, 0, 0, 0, 1, 1,
-0.4575453, -2.041261, -3.400945, 0, 0, 0, 1, 1,
-0.4551051, -0.7714186, -3.168195, 0, 0, 0, 1, 1,
-0.4501246, 1.344271, -0.9433216, 0, 0, 0, 1, 1,
-0.4497936, -1.479252, -2.008538, 0, 0, 0, 1, 1,
-0.448611, -2.550076, -2.650433, 1, 1, 1, 1, 1,
-0.4477721, -0.5421192, -2.751658, 1, 1, 1, 1, 1,
-0.4476908, -0.7704282, -3.40899, 1, 1, 1, 1, 1,
-0.4471739, 1.134787, -0.9247539, 1, 1, 1, 1, 1,
-0.4433106, -0.4946581, -2.123393, 1, 1, 1, 1, 1,
-0.4405896, 0.4524656, 0.7578496, 1, 1, 1, 1, 1,
-0.4402966, -0.373819, -2.309114, 1, 1, 1, 1, 1,
-0.4402529, 0.4626577, -0.9084952, 1, 1, 1, 1, 1,
-0.4361726, 1.032811, 1.326582, 1, 1, 1, 1, 1,
-0.4322443, 0.4701707, -1.811163, 1, 1, 1, 1, 1,
-0.4228906, 0.2879295, -0.4536695, 1, 1, 1, 1, 1,
-0.4186165, -0.06051771, -3.245074, 1, 1, 1, 1, 1,
-0.4182661, -0.3171318, -3.106192, 1, 1, 1, 1, 1,
-0.4180433, -0.3809174, -2.604376, 1, 1, 1, 1, 1,
-0.4094991, 1.263969, -0.6012726, 1, 1, 1, 1, 1,
-0.408734, 1.011832, -0.5738405, 0, 0, 1, 1, 1,
-0.4058947, -0.6067782, -2.865938, 1, 0, 0, 1, 1,
-0.4041232, 0.5840178, -0.7323629, 1, 0, 0, 1, 1,
-0.4026938, -0.7352807, -2.714804, 1, 0, 0, 1, 1,
-0.401054, 0.03634441, -1.063468, 1, 0, 0, 1, 1,
-0.3990318, -0.4217438, -3.012221, 1, 0, 0, 1, 1,
-0.3955818, -0.5277473, -2.772107, 0, 0, 0, 1, 1,
-0.3926934, 0.4112645, -0.6536924, 0, 0, 0, 1, 1,
-0.3909299, -1.872033, -2.273463, 0, 0, 0, 1, 1,
-0.3832491, -0.8706976, -3.027671, 0, 0, 0, 1, 1,
-0.3830438, -0.1987641, -2.071913, 0, 0, 0, 1, 1,
-0.3815267, 1.325229, -0.872014, 0, 0, 0, 1, 1,
-0.3813543, -0.2321144, -1.255225, 0, 0, 0, 1, 1,
-0.377557, -0.2955057, 0.164145, 1, 1, 1, 1, 1,
-0.3768474, -1.13414, -2.524777, 1, 1, 1, 1, 1,
-0.3745923, 0.3344569, -1.412312, 1, 1, 1, 1, 1,
-0.3742377, 0.2259344, -1.736444, 1, 1, 1, 1, 1,
-0.3639566, 0.9853528, -0.2247446, 1, 1, 1, 1, 1,
-0.3594013, 0.1645981, -2.391928, 1, 1, 1, 1, 1,
-0.3578091, 0.478563, -1.024713, 1, 1, 1, 1, 1,
-0.3556567, -0.128196, -2.930637, 1, 1, 1, 1, 1,
-0.3493808, -0.210101, -0.7245019, 1, 1, 1, 1, 1,
-0.3493745, 1.068586, 0.5095404, 1, 1, 1, 1, 1,
-0.3467857, -0.4163893, -2.295901, 1, 1, 1, 1, 1,
-0.3457165, 2.271179, -1.195919, 1, 1, 1, 1, 1,
-0.3431135, -1.469106, -4.554842, 1, 1, 1, 1, 1,
-0.3390135, 0.09737046, 0.3728462, 1, 1, 1, 1, 1,
-0.3320364, -0.2921636, -2.485814, 1, 1, 1, 1, 1,
-0.3288864, 0.6485972, -1.632259, 0, 0, 1, 1, 1,
-0.3280696, 1.366217, -1.017302, 1, 0, 0, 1, 1,
-0.3261232, -0.05257501, -0.8656233, 1, 0, 0, 1, 1,
-0.3222268, 0.06269855, -1.011069, 1, 0, 0, 1, 1,
-0.318619, -0.3936007, -3.479457, 1, 0, 0, 1, 1,
-0.3182223, 1.316764, -0.1234537, 1, 0, 0, 1, 1,
-0.3141856, 1.726646, 2.01155, 0, 0, 0, 1, 1,
-0.3118898, -0.9706849, -0.850318, 0, 0, 0, 1, 1,
-0.3118838, 0.2892162, 0.4073766, 0, 0, 0, 1, 1,
-0.3116683, -0.6316155, -0.7023649, 0, 0, 0, 1, 1,
-0.3103837, -0.7271887, -3.388977, 0, 0, 0, 1, 1,
-0.3042721, 0.6947543, 1.114124, 0, 0, 0, 1, 1,
-0.3032403, 0.8147116, 1.126781, 0, 0, 0, 1, 1,
-0.294554, -1.615179, -1.470849, 1, 1, 1, 1, 1,
-0.2918359, -0.3165339, -2.557477, 1, 1, 1, 1, 1,
-0.2910216, -0.7084572, -2.074886, 1, 1, 1, 1, 1,
-0.2902096, -0.4029008, -1.686247, 1, 1, 1, 1, 1,
-0.2900116, 0.2256685, -1.507521, 1, 1, 1, 1, 1,
-0.2840566, 0.04315641, -2.263971, 1, 1, 1, 1, 1,
-0.2799313, -1.716587, -3.634758, 1, 1, 1, 1, 1,
-0.2786114, -0.4436991, -4.333782, 1, 1, 1, 1, 1,
-0.2754198, -1.592974, -2.563083, 1, 1, 1, 1, 1,
-0.2751392, 1.455689, -0.832283, 1, 1, 1, 1, 1,
-0.2745902, 0.6653762, 0.5924475, 1, 1, 1, 1, 1,
-0.2667409, 0.1531415, -1.586125, 1, 1, 1, 1, 1,
-0.2657445, 0.6247027, 1.564434, 1, 1, 1, 1, 1,
-0.2637842, 1.206127, -0.1231096, 1, 1, 1, 1, 1,
-0.2586898, -0.1303094, -2.178612, 1, 1, 1, 1, 1,
-0.2586156, -0.4651269, -2.298899, 0, 0, 1, 1, 1,
-0.2551156, -0.417858, -1.761309, 1, 0, 0, 1, 1,
-0.2542716, -0.8709282, -2.773037, 1, 0, 0, 1, 1,
-0.2528735, 0.663336, -2.538055, 1, 0, 0, 1, 1,
-0.2522461, 0.04022476, -0.8851822, 1, 0, 0, 1, 1,
-0.2505677, -0.003858306, -1.707649, 1, 0, 0, 1, 1,
-0.246622, 1.427837, 0.2252253, 0, 0, 0, 1, 1,
-0.2449813, -0.7048563, -2.723663, 0, 0, 0, 1, 1,
-0.2448536, 1.109197, -1.014188, 0, 0, 0, 1, 1,
-0.2431193, -1.419972, -4.030982, 0, 0, 0, 1, 1,
-0.2414857, 1.316625, 0.2361663, 0, 0, 0, 1, 1,
-0.2403556, 0.01588153, -1.761123, 0, 0, 0, 1, 1,
-0.2385198, 1.038481, -0.6571733, 0, 0, 0, 1, 1,
-0.2374372, -0.1093311, -2.11841, 1, 1, 1, 1, 1,
-0.2331465, 0.3612171, 0.6262324, 1, 1, 1, 1, 1,
-0.2288548, -0.2625718, -2.256178, 1, 1, 1, 1, 1,
-0.2201712, -0.4581986, -2.432233, 1, 1, 1, 1, 1,
-0.2197392, -1.406211, -3.322969, 1, 1, 1, 1, 1,
-0.2142874, -0.03503408, -1.259656, 1, 1, 1, 1, 1,
-0.2142119, 1.034247, -0.05680554, 1, 1, 1, 1, 1,
-0.2129704, -0.9933293, -4.862955, 1, 1, 1, 1, 1,
-0.2107864, 1.230218, -0.0655184, 1, 1, 1, 1, 1,
-0.2007247, -0.7013076, -3.643884, 1, 1, 1, 1, 1,
-0.1993975, -0.402103, -1.134735, 1, 1, 1, 1, 1,
-0.1989481, -1.356654, -3.018095, 1, 1, 1, 1, 1,
-0.1987009, 0.7006266, 0.254726, 1, 1, 1, 1, 1,
-0.1950752, -0.08160909, -2.479607, 1, 1, 1, 1, 1,
-0.1939483, -0.5652223, -4.27701, 1, 1, 1, 1, 1,
-0.1908702, -0.5878928, -3.966381, 0, 0, 1, 1, 1,
-0.1864103, 1.007888, -0.0815051, 1, 0, 0, 1, 1,
-0.1838264, -0.7903163, -4.422974, 1, 0, 0, 1, 1,
-0.1822233, 0.02348121, -1.328596, 1, 0, 0, 1, 1,
-0.1732718, -0.1604652, -1.994188, 1, 0, 0, 1, 1,
-0.1717616, -3.156807, -2.363045, 1, 0, 0, 1, 1,
-0.1710876, 0.2256623, -0.4496019, 0, 0, 0, 1, 1,
-0.158048, -0.9886233, -1.688458, 0, 0, 0, 1, 1,
-0.1551632, 0.3950736, 0.1643375, 0, 0, 0, 1, 1,
-0.1543933, -2.15306, -4.321401, 0, 0, 0, 1, 1,
-0.148333, 0.3949169, -0.9861701, 0, 0, 0, 1, 1,
-0.1463068, -0.2029817, -2.353083, 0, 0, 0, 1, 1,
-0.1388303, -1.438263, -2.04535, 0, 0, 0, 1, 1,
-0.1385599, 0.01886539, -1.428778, 1, 1, 1, 1, 1,
-0.134905, 0.6788366, 0.5809669, 1, 1, 1, 1, 1,
-0.1345353, 1.086471, 0.03796397, 1, 1, 1, 1, 1,
-0.1331351, 1.049789, 0.8949112, 1, 1, 1, 1, 1,
-0.1323833, -0.1586655, -2.001967, 1, 1, 1, 1, 1,
-0.1310654, -1.833102, -1.3841, 1, 1, 1, 1, 1,
-0.1307617, 0.410715, -1.612392, 1, 1, 1, 1, 1,
-0.1306934, -0.9773365, -4.607968, 1, 1, 1, 1, 1,
-0.1294278, 0.339801, -1.118194, 1, 1, 1, 1, 1,
-0.1291614, -0.8175674, -4.461111, 1, 1, 1, 1, 1,
-0.1274158, 2.09851, -1.049135, 1, 1, 1, 1, 1,
-0.1270711, -0.7591914, -3.103733, 1, 1, 1, 1, 1,
-0.1204719, 0.5058312, -1.22643, 1, 1, 1, 1, 1,
-0.1203736, 0.5488759, 0.6056114, 1, 1, 1, 1, 1,
-0.1189488, 1.229879, -0.4747654, 1, 1, 1, 1, 1,
-0.1185088, 0.3041555, -0.5309843, 0, 0, 1, 1, 1,
-0.1181098, 1.346501, -1.802414, 1, 0, 0, 1, 1,
-0.1179741, 2.364372, -0.924351, 1, 0, 0, 1, 1,
-0.1178613, 0.6108236, 0.5108848, 1, 0, 0, 1, 1,
-0.1144166, -2.809124, -2.421949, 1, 0, 0, 1, 1,
-0.1054779, 0.9572859, 0.282708, 1, 0, 0, 1, 1,
-0.1053701, -1.047011, -2.865108, 0, 0, 0, 1, 1,
-0.1040406, -0.5366399, -0.9452388, 0, 0, 0, 1, 1,
-0.1033346, -0.03243816, -2.945987, 0, 0, 0, 1, 1,
-0.1003452, 1.03925, -1.798056, 0, 0, 0, 1, 1,
-0.09744713, 1.753098, -0.2043971, 0, 0, 0, 1, 1,
-0.09383154, -1.093757, -2.311238, 0, 0, 0, 1, 1,
-0.09248112, -1.736247, -3.52933, 0, 0, 0, 1, 1,
-0.08781232, 2.123784, 0.242809, 1, 1, 1, 1, 1,
-0.08588782, 1.265613, -0.1326619, 1, 1, 1, 1, 1,
-0.08320308, 1.879079, 1.087559, 1, 1, 1, 1, 1,
-0.08319717, -0.9023907, -3.043917, 1, 1, 1, 1, 1,
-0.08091912, -1.168688, -1.917817, 1, 1, 1, 1, 1,
-0.07831692, 0.2766878, -1.862107, 1, 1, 1, 1, 1,
-0.07786736, -0.001140271, -1.60034, 1, 1, 1, 1, 1,
-0.07757435, -1.480679, -2.872114, 1, 1, 1, 1, 1,
-0.07728555, 0.857363, -1.171197, 1, 1, 1, 1, 1,
-0.06945985, 0.7117708, -0.02304093, 1, 1, 1, 1, 1,
-0.06860529, -0.8865436, -1.361662, 1, 1, 1, 1, 1,
-0.06422207, -1.264395, -3.353165, 1, 1, 1, 1, 1,
-0.06276321, 1.375989, -0.5942537, 1, 1, 1, 1, 1,
-0.06248413, 1.237671, 0.3868302, 1, 1, 1, 1, 1,
-0.06071958, -0.2884243, -2.710916, 1, 1, 1, 1, 1,
-0.05802052, 1.432613, -0.3985668, 0, 0, 1, 1, 1,
-0.05712105, 1.802034, -0.2561345, 1, 0, 0, 1, 1,
-0.05685858, 0.4238347, -1.518719, 1, 0, 0, 1, 1,
-0.05409317, 0.7398956, -0.6351491, 1, 0, 0, 1, 1,
-0.04500982, 1.185021, 0.7564448, 1, 0, 0, 1, 1,
-0.04304499, 0.1453191, 1.413194, 1, 0, 0, 1, 1,
-0.04178185, 0.4592083, -0.96567, 0, 0, 0, 1, 1,
-0.04120507, -0.7722576, -2.62183, 0, 0, 0, 1, 1,
-0.03242571, -0.1537107, -2.647464, 0, 0, 0, 1, 1,
-0.0320261, 0.0169418, -2.465874, 0, 0, 0, 1, 1,
-0.02955697, 0.6146156, -0.4136668, 0, 0, 0, 1, 1,
-0.02719665, -1.856616, -2.865394, 0, 0, 0, 1, 1,
-0.02681482, -0.06598778, -2.341882, 0, 0, 0, 1, 1,
-0.02661516, 0.5832107, -0.2750062, 1, 1, 1, 1, 1,
-0.02150844, 1.218, -0.4336087, 1, 1, 1, 1, 1,
-0.02078683, 1.360719, -1.173433, 1, 1, 1, 1, 1,
-0.02003011, -1.269783, -3.31121, 1, 1, 1, 1, 1,
-0.01633365, -1.066798, -3.262066, 1, 1, 1, 1, 1,
-0.006241216, 0.5251147, -1.195407, 1, 1, 1, 1, 1,
-0.005688647, 0.8625184, 0.1000809, 1, 1, 1, 1, 1,
-0.004964513, -0.03631545, -4.720413, 1, 1, 1, 1, 1,
0.0001511408, 0.1940995, 0.4036057, 1, 1, 1, 1, 1,
0.002572205, 0.0473527, 1.945149, 1, 1, 1, 1, 1,
0.004902979, -0.1150199, 4.288439, 1, 1, 1, 1, 1,
0.005202147, 0.468549, 1.170361, 1, 1, 1, 1, 1,
0.00793724, -2.140123, 3.793603, 1, 1, 1, 1, 1,
0.01022079, -1.199449, 1.649686, 1, 1, 1, 1, 1,
0.01450727, -0.3821508, 3.165715, 1, 1, 1, 1, 1,
0.01621972, -1.181982, 1.774689, 0, 0, 1, 1, 1,
0.02426593, -0.5641329, 2.415426, 1, 0, 0, 1, 1,
0.02669899, -0.5741349, 2.451026, 1, 0, 0, 1, 1,
0.0300747, -1.459356, 2.912704, 1, 0, 0, 1, 1,
0.03021227, -0.2798428, 2.647486, 1, 0, 0, 1, 1,
0.03511037, 1.393509, -0.05282998, 1, 0, 0, 1, 1,
0.03799159, 0.3994781, 0.1980191, 0, 0, 0, 1, 1,
0.04448675, 0.7916012, -0.1452432, 0, 0, 0, 1, 1,
0.04453157, -0.3785724, 1.834048, 0, 0, 0, 1, 1,
0.04502663, 0.560229, 0.4666534, 0, 0, 0, 1, 1,
0.04576344, -3.116404, 3.196117, 0, 0, 0, 1, 1,
0.04588481, 0.1992142, 1.755681, 0, 0, 0, 1, 1,
0.05570257, 2.192094, -0.5950945, 0, 0, 0, 1, 1,
0.05680897, 1.483785, -0.3247892, 1, 1, 1, 1, 1,
0.05695196, -1.045918, 3.626168, 1, 1, 1, 1, 1,
0.0611031, -0.5548591, 3.819119, 1, 1, 1, 1, 1,
0.06143581, 0.05938126, 1.369632, 1, 1, 1, 1, 1,
0.0695178, 1.173146, -0.0460761, 1, 1, 1, 1, 1,
0.07083848, 1.4458, 0.7135589, 1, 1, 1, 1, 1,
0.07193406, 0.4986582, 0.05476854, 1, 1, 1, 1, 1,
0.08270644, 0.954826, -0.03147344, 1, 1, 1, 1, 1,
0.08270992, -0.4174967, 3.332661, 1, 1, 1, 1, 1,
0.08620784, -0.2635672, 2.65704, 1, 1, 1, 1, 1,
0.08645032, -0.02071131, 2.509394, 1, 1, 1, 1, 1,
0.09045334, 1.289648, -0.3319392, 1, 1, 1, 1, 1,
0.09347755, 0.8036634, -0.6465806, 1, 1, 1, 1, 1,
0.09354233, -0.3443978, 4.864666, 1, 1, 1, 1, 1,
0.09522957, 0.5116379, -0.4392246, 1, 1, 1, 1, 1,
0.09701076, 1.509086, 2.401555, 0, 0, 1, 1, 1,
0.1034434, 0.804262, 0.5568401, 1, 0, 0, 1, 1,
0.1070722, 0.1043568, 0.5105409, 1, 0, 0, 1, 1,
0.1090167, -0.5449199, 4.282528, 1, 0, 0, 1, 1,
0.1098396, 0.3974199, 0.2189038, 1, 0, 0, 1, 1,
0.1105063, 0.7876431, 0.761372, 1, 0, 0, 1, 1,
0.1184538, -0.5040104, 2.889101, 0, 0, 0, 1, 1,
0.1191775, 0.6242756, 0.9176794, 0, 0, 0, 1, 1,
0.119836, 0.9678374, 1.397368, 0, 0, 0, 1, 1,
0.1203684, 0.3008717, 0.5816594, 0, 0, 0, 1, 1,
0.1231349, -1.720839, 5.129247, 0, 0, 0, 1, 1,
0.1257988, 2.303262, 0.4556005, 0, 0, 0, 1, 1,
0.1270404, 0.03822948, 1.436372, 0, 0, 0, 1, 1,
0.129005, 0.3703234, 3.080599, 1, 1, 1, 1, 1,
0.1313156, -0.004006677, 1.323393, 1, 1, 1, 1, 1,
0.1322563, -0.3972766, 3.747638, 1, 1, 1, 1, 1,
0.1323804, -0.5727732, 3.179699, 1, 1, 1, 1, 1,
0.1344605, -0.1331782, 2.848207, 1, 1, 1, 1, 1,
0.1377945, -0.2128611, 2.156421, 1, 1, 1, 1, 1,
0.1400133, 0.07249112, 1.706856, 1, 1, 1, 1, 1,
0.1416736, 2.400819, 1.046575, 1, 1, 1, 1, 1,
0.1419438, -1.296619, 2.579906, 1, 1, 1, 1, 1,
0.1448933, 0.1455381, 0.7449414, 1, 1, 1, 1, 1,
0.145954, -1.809728, 2.393599, 1, 1, 1, 1, 1,
0.1467066, 1.184679, -0.3322501, 1, 1, 1, 1, 1,
0.1500857, 0.06912892, 0.6153574, 1, 1, 1, 1, 1,
0.1581841, 0.03889078, 0.02243748, 1, 1, 1, 1, 1,
0.1596362, 1.718667, -0.1810645, 1, 1, 1, 1, 1,
0.1598228, 1.242668, -2.179416, 0, 0, 1, 1, 1,
0.161606, 0.8802477, 0.2387376, 1, 0, 0, 1, 1,
0.1630493, -0.3505991, 0.9429166, 1, 0, 0, 1, 1,
0.1641338, 0.8189809, 0.4499502, 1, 0, 0, 1, 1,
0.1641455, 2.556154, 0.7620804, 1, 0, 0, 1, 1,
0.1667358, -2.338438, 4.399612, 1, 0, 0, 1, 1,
0.1669788, 2.734685, -0.4249388, 0, 0, 0, 1, 1,
0.1722604, -0.6724746, 2.490897, 0, 0, 0, 1, 1,
0.1724782, 0.184808, -0.6691635, 0, 0, 0, 1, 1,
0.1728546, 1.267637, 1.107498, 0, 0, 0, 1, 1,
0.1739719, -0.9263219, 3.017597, 0, 0, 0, 1, 1,
0.1743335, -0.3391862, 2.297947, 0, 0, 0, 1, 1,
0.1778654, -0.09428431, 1.755432, 0, 0, 0, 1, 1,
0.1809515, 1.086431, 0.7610418, 1, 1, 1, 1, 1,
0.1815519, -0.3941761, 4.422051, 1, 1, 1, 1, 1,
0.1831193, 0.8848724, -2.789819, 1, 1, 1, 1, 1,
0.1832454, 0.8439687, -0.161745, 1, 1, 1, 1, 1,
0.1889391, -0.02696822, 2.112058, 1, 1, 1, 1, 1,
0.1893211, 1.209505, -0.5637007, 1, 1, 1, 1, 1,
0.1906589, -0.08195324, 2.42687, 1, 1, 1, 1, 1,
0.1912646, -1.082548, 3.094871, 1, 1, 1, 1, 1,
0.1924865, 0.245212, 2.465154, 1, 1, 1, 1, 1,
0.1929535, -3.051918, 2.921535, 1, 1, 1, 1, 1,
0.1929552, 0.8989394, -0.3287601, 1, 1, 1, 1, 1,
0.1937018, -0.3318909, 2.895333, 1, 1, 1, 1, 1,
0.1958725, -0.3415361, 3.464672, 1, 1, 1, 1, 1,
0.196046, -0.7363239, 1.032258, 1, 1, 1, 1, 1,
0.1996273, -0.1911961, 2.860239, 1, 1, 1, 1, 1,
0.2023192, 1.471357, 0.211404, 0, 0, 1, 1, 1,
0.2026193, -0.5339454, 4.026812, 1, 0, 0, 1, 1,
0.205481, -0.07116762, 0.8298923, 1, 0, 0, 1, 1,
0.2056492, -0.04333033, 1.667083, 1, 0, 0, 1, 1,
0.2090348, 0.1773987, 0.4805972, 1, 0, 0, 1, 1,
0.2154522, -1.120438, 3.411688, 1, 0, 0, 1, 1,
0.2207856, -0.998911, 2.188871, 0, 0, 0, 1, 1,
0.2220112, -0.1002447, 3.581739, 0, 0, 0, 1, 1,
0.2266892, 0.6987178, 0.2595184, 0, 0, 0, 1, 1,
0.2301048, -0.1417841, 2.302207, 0, 0, 0, 1, 1,
0.2315548, 0.8681046, -0.6340089, 0, 0, 0, 1, 1,
0.2350631, 1.128409, -1.066398, 0, 0, 0, 1, 1,
0.2364339, 0.1250848, 2.925435, 0, 0, 0, 1, 1,
0.2422491, -0.497167, 0.7188983, 1, 1, 1, 1, 1,
0.2423555, 0.6263053, 0.4113442, 1, 1, 1, 1, 1,
0.2447648, -0.632444, 2.980072, 1, 1, 1, 1, 1,
0.2452461, -0.5864629, 2.270018, 1, 1, 1, 1, 1,
0.2484216, -0.6500089, 3.303327, 1, 1, 1, 1, 1,
0.2484885, -0.28334, 1.22529, 1, 1, 1, 1, 1,
0.2486878, 0.956027, -0.3165886, 1, 1, 1, 1, 1,
0.249719, -0.5748034, 3.001625, 1, 1, 1, 1, 1,
0.2531633, -0.03506837, 2.687037, 1, 1, 1, 1, 1,
0.2547085, 1.423902, 1.313548, 1, 1, 1, 1, 1,
0.2550824, -0.6603377, 4.286199, 1, 1, 1, 1, 1,
0.2562122, 0.01849659, 1.174528, 1, 1, 1, 1, 1,
0.2567547, 1.292856, 0.5120093, 1, 1, 1, 1, 1,
0.2593245, -1.072191, 4.23667, 1, 1, 1, 1, 1,
0.2613605, -0.1964241, 0.1508482, 1, 1, 1, 1, 1,
0.261456, 0.6884133, 0.02822562, 0, 0, 1, 1, 1,
0.2674517, 0.3844339, 1.12949, 1, 0, 0, 1, 1,
0.2680319, 0.3896303, 0.3820297, 1, 0, 0, 1, 1,
0.268052, -1.027113, 3.943347, 1, 0, 0, 1, 1,
0.2681776, 0.4643766, 1.079556, 1, 0, 0, 1, 1,
0.2732947, 0.4590279, -0.7892347, 1, 0, 0, 1, 1,
0.2751444, 0.9631305, -0.2151646, 0, 0, 0, 1, 1,
0.2867887, 0.03349751, 2.128287, 0, 0, 0, 1, 1,
0.2872021, 0.997794, -0.6922712, 0, 0, 0, 1, 1,
0.2913465, -0.4496012, 3.531684, 0, 0, 0, 1, 1,
0.2973531, -1.767315, 2.658743, 0, 0, 0, 1, 1,
0.3000608, 0.869593, 2.128968, 0, 0, 0, 1, 1,
0.3018758, 0.7415331, -0.1055863, 0, 0, 0, 1, 1,
0.3063359, -0.1474838, 4.335992, 1, 1, 1, 1, 1,
0.3084625, -0.1644125, 1.963057, 1, 1, 1, 1, 1,
0.3085063, 0.607338, 0.8550181, 1, 1, 1, 1, 1,
0.309918, 0.6111111, 3.171651, 1, 1, 1, 1, 1,
0.3101895, -9.478698e-05, 1.017862, 1, 1, 1, 1, 1,
0.3105257, -0.5161567, 1.103278, 1, 1, 1, 1, 1,
0.3163012, -0.4206306, 2.995652, 1, 1, 1, 1, 1,
0.3201406, -1.519637, 4.894806, 1, 1, 1, 1, 1,
0.3221402, -0.9778121, 5.071386, 1, 1, 1, 1, 1,
0.3226645, 0.4371665, 0.2217853, 1, 1, 1, 1, 1,
0.3269588, 1.38578, 0.3411884, 1, 1, 1, 1, 1,
0.3345264, 0.03260817, 1.532188, 1, 1, 1, 1, 1,
0.3366519, 1.052135, 0.7016207, 1, 1, 1, 1, 1,
0.3396175, -1.891225, 3.750103, 1, 1, 1, 1, 1,
0.344811, 0.2014009, 0.9357868, 1, 1, 1, 1, 1,
0.3463152, -1.021644, 2.879106, 0, 0, 1, 1, 1,
0.3487438, -0.6036546, 2.817981, 1, 0, 0, 1, 1,
0.3527775, 0.6993171, 1.568618, 1, 0, 0, 1, 1,
0.3547095, 0.6012235, -1.573224, 1, 0, 0, 1, 1,
0.3600268, -1.156008, 2.254056, 1, 0, 0, 1, 1,
0.3604675, -0.08493392, 1.983917, 1, 0, 0, 1, 1,
0.3604693, 0.02599817, 0.5034506, 0, 0, 0, 1, 1,
0.3613609, -0.1774054, 3.007204, 0, 0, 0, 1, 1,
0.3645892, -0.2651332, 1.337027, 0, 0, 0, 1, 1,
0.3662699, 1.570605, 1.380334, 0, 0, 0, 1, 1,
0.3719844, -1.253626, 3.242894, 0, 0, 0, 1, 1,
0.3727817, 1.100191, 0.3099535, 0, 0, 0, 1, 1,
0.37291, 0.7501847, -0.07567632, 0, 0, 0, 1, 1,
0.3790939, 0.2390212, 0.001117624, 1, 1, 1, 1, 1,
0.3856887, 0.7045226, 2.294955, 1, 1, 1, 1, 1,
0.3943345, -0.8890359, 3.419976, 1, 1, 1, 1, 1,
0.3943364, -0.7843195, 2.343576, 1, 1, 1, 1, 1,
0.4007453, 0.05294633, 3.214528, 1, 1, 1, 1, 1,
0.4032716, 1.279935, 0.9182141, 1, 1, 1, 1, 1,
0.4051257, -0.9092755, 3.186353, 1, 1, 1, 1, 1,
0.4099573, -0.244481, 2.456165, 1, 1, 1, 1, 1,
0.4130966, 0.2319081, -0.06884016, 1, 1, 1, 1, 1,
0.4142777, -1.301252, 5.220706, 1, 1, 1, 1, 1,
0.415554, -1.231349, 3.685377, 1, 1, 1, 1, 1,
0.4176604, 0.1445963, 2.092163, 1, 1, 1, 1, 1,
0.4205167, 1.768025, 0.7785981, 1, 1, 1, 1, 1,
0.4209165, 1.600685, 1.635477, 1, 1, 1, 1, 1,
0.4210538, -1.803194, 3.262795, 1, 1, 1, 1, 1,
0.4255586, 1.739132, -0.7448457, 0, 0, 1, 1, 1,
0.4284347, 0.2172621, 0.6896763, 1, 0, 0, 1, 1,
0.4285048, 0.3930891, 0.665405, 1, 0, 0, 1, 1,
0.4297423, -1.195771, 1.125161, 1, 0, 0, 1, 1,
0.4310375, 0.9364712, 2.30949, 1, 0, 0, 1, 1,
0.4328521, -0.7696898, 2.016173, 1, 0, 0, 1, 1,
0.4363547, 0.610179, -0.04423842, 0, 0, 0, 1, 1,
0.4374921, 0.5268537, 1.500175, 0, 0, 0, 1, 1,
0.4391899, -1.122799, 3.852791, 0, 0, 0, 1, 1,
0.4400595, -0.2366178, 0.4510881, 0, 0, 0, 1, 1,
0.4407622, -0.1867901, 1.231962, 0, 0, 0, 1, 1,
0.4438499, 0.1147544, 0.6253572, 0, 0, 0, 1, 1,
0.4477044, 0.7650372, 1.106091, 0, 0, 0, 1, 1,
0.4478407, -0.7049475, 2.356626, 1, 1, 1, 1, 1,
0.4483649, -0.6099992, 1.094067, 1, 1, 1, 1, 1,
0.450027, 1.664409, 2.000274, 1, 1, 1, 1, 1,
0.4512887, -2.03773, 1.203362, 1, 1, 1, 1, 1,
0.4524254, -1.287072, 3.903516, 1, 1, 1, 1, 1,
0.4595797, -0.7357038, 1.35414, 1, 1, 1, 1, 1,
0.4657819, 1.183325, -0.3326523, 1, 1, 1, 1, 1,
0.4673629, -0.6630399, 2.025422, 1, 1, 1, 1, 1,
0.4794454, -1.147848, 0.9307343, 1, 1, 1, 1, 1,
0.4818116, 1.652771, 0.05681477, 1, 1, 1, 1, 1,
0.4824402, 0.1165807, 0.3204326, 1, 1, 1, 1, 1,
0.4849063, 0.09845468, 1.497958, 1, 1, 1, 1, 1,
0.4964145, 0.144977, -0.01526584, 1, 1, 1, 1, 1,
0.4973207, -0.4172523, 2.792377, 1, 1, 1, 1, 1,
0.499265, -0.3053972, 1.565939, 1, 1, 1, 1, 1,
0.5029624, 0.2843549, 1.553748, 0, 0, 1, 1, 1,
0.504195, 0.1051097, 2.087266, 1, 0, 0, 1, 1,
0.5043283, -0.8773242, 2.211729, 1, 0, 0, 1, 1,
0.5077312, 1.573929, 1.02987, 1, 0, 0, 1, 1,
0.5099273, -1.902649, 4.015666, 1, 0, 0, 1, 1,
0.512754, 1.589206, 0.9990284, 1, 0, 0, 1, 1,
0.5183688, -0.7214383, 2.917652, 0, 0, 0, 1, 1,
0.5223412, 0.9939174, -0.3828019, 0, 0, 0, 1, 1,
0.5317603, 0.896458, 0.3283793, 0, 0, 0, 1, 1,
0.5320338, 1.808456, 1.478324, 0, 0, 0, 1, 1,
0.5356749, 1.101548, -2.433327, 0, 0, 0, 1, 1,
0.5449723, -0.6959714, 2.335924, 0, 0, 0, 1, 1,
0.5462829, 0.9358299, 0.2094771, 0, 0, 0, 1, 1,
0.5467588, 1.263727, 0.583029, 1, 1, 1, 1, 1,
0.5526725, -0.8542845, 3.464936, 1, 1, 1, 1, 1,
0.5543948, 0.7039182, -0.1398244, 1, 1, 1, 1, 1,
0.558652, 0.2545636, 3.609835, 1, 1, 1, 1, 1,
0.5610223, 1.175666, -1.303092, 1, 1, 1, 1, 1,
0.5652041, -0.2416639, 1.458272, 1, 1, 1, 1, 1,
0.5692846, -0.9009898, 2.980878, 1, 1, 1, 1, 1,
0.5733213, -0.3037625, 3.34158, 1, 1, 1, 1, 1,
0.5749209, -0.1291476, 1.811553, 1, 1, 1, 1, 1,
0.5782245, 1.087409, 0.06739944, 1, 1, 1, 1, 1,
0.5785178, -1.286731, 3.156835, 1, 1, 1, 1, 1,
0.5803828, -1.078829, 2.128277, 1, 1, 1, 1, 1,
0.5871035, 1.746178, 0.2244452, 1, 1, 1, 1, 1,
0.5909371, -0.09968897, 3.262095, 1, 1, 1, 1, 1,
0.5961672, -0.3891014, 4.044698, 1, 1, 1, 1, 1,
0.599429, 0.6431918, 0.8958565, 0, 0, 1, 1, 1,
0.6005106, 0.9605305, -0.4347168, 1, 0, 0, 1, 1,
0.6016905, 0.1738544, 0.2255282, 1, 0, 0, 1, 1,
0.6036149, 1.203211, 0.6892219, 1, 0, 0, 1, 1,
0.6082257, -1.642814, 1.525719, 1, 0, 0, 1, 1,
0.6092201, -0.3396065, 1.623789, 1, 0, 0, 1, 1,
0.6144182, -0.4843238, 1.988738, 0, 0, 0, 1, 1,
0.6157311, 0.3845002, 1.463141, 0, 0, 0, 1, 1,
0.621283, 1.049551, 1.222169, 0, 0, 0, 1, 1,
0.6258379, -3.584712, 4.339609, 0, 0, 0, 1, 1,
0.6279697, -0.9894073, 1.993214, 0, 0, 0, 1, 1,
0.635349, -1.069207, 3.401388, 0, 0, 0, 1, 1,
0.6489044, 1.769807, -0.9999672, 0, 0, 0, 1, 1,
0.6514947, -1.570124, 3.778607, 1, 1, 1, 1, 1,
0.6543123, -0.419627, 2.126461, 1, 1, 1, 1, 1,
0.656942, -0.4182318, 2.582786, 1, 1, 1, 1, 1,
0.6606856, -0.08983161, 1.410489, 1, 1, 1, 1, 1,
0.6697008, -0.5575177, 3.976133, 1, 1, 1, 1, 1,
0.6716754, -0.2243521, 0.01290168, 1, 1, 1, 1, 1,
0.6730822, 0.2076656, 2.279447, 1, 1, 1, 1, 1,
0.6772549, 0.2834448, 2.17833, 1, 1, 1, 1, 1,
0.6786308, -1.345692, 1.958082, 1, 1, 1, 1, 1,
0.6826758, 1.767694, 0.3944367, 1, 1, 1, 1, 1,
0.6904107, -0.06911606, 0.8893609, 1, 1, 1, 1, 1,
0.6926518, 0.9434134, -1.796963, 1, 1, 1, 1, 1,
0.6950442, -1.110255, 3.197909, 1, 1, 1, 1, 1,
0.6980028, -0.6731038, 2.817739, 1, 1, 1, 1, 1,
0.6985427, -0.9901422, 4.12081, 1, 1, 1, 1, 1,
0.7131023, -0.1482944, 0.8982679, 0, 0, 1, 1, 1,
0.713387, 0.9135221, 1.322762, 1, 0, 0, 1, 1,
0.7172413, 0.3563576, -0.2109107, 1, 0, 0, 1, 1,
0.7194793, 0.4345278, 2.529853, 1, 0, 0, 1, 1,
0.7242132, -0.5312922, 2.054228, 1, 0, 0, 1, 1,
0.728068, 1.324075, -0.8735283, 1, 0, 0, 1, 1,
0.7307611, -0.4423698, 1.135608, 0, 0, 0, 1, 1,
0.7332162, -0.02838072, 1.226588, 0, 0, 0, 1, 1,
0.7339368, -0.2475125, 2.239848, 0, 0, 0, 1, 1,
0.7558511, -2.002497, 1.219026, 0, 0, 0, 1, 1,
0.7570471, 1.138197, 0.255158, 0, 0, 0, 1, 1,
0.759508, -0.2263331, 2.3099, 0, 0, 0, 1, 1,
0.7646258, -0.1303083, 2.014029, 0, 0, 0, 1, 1,
0.7688207, -0.7604146, 0.3778115, 1, 1, 1, 1, 1,
0.7692103, 0.9305373, 1.809867, 1, 1, 1, 1, 1,
0.7705636, -0.6925662, 1.456361, 1, 1, 1, 1, 1,
0.7721886, -1.570493, 2.623742, 1, 1, 1, 1, 1,
0.7785114, -0.3881945, 2.58816, 1, 1, 1, 1, 1,
0.7789555, 0.7331496, 1.093532, 1, 1, 1, 1, 1,
0.7811458, 0.4589735, 2.831534, 1, 1, 1, 1, 1,
0.7919921, -0.3366652, 2.634952, 1, 1, 1, 1, 1,
0.7933627, -1.480435, 3.170365, 1, 1, 1, 1, 1,
0.79596, 1.127387, 0.7005013, 1, 1, 1, 1, 1,
0.7995813, 0.05793633, 3.049088, 1, 1, 1, 1, 1,
0.8035336, 1.604271, 0.2516487, 1, 1, 1, 1, 1,
0.8035962, -1.387659, 2.651072, 1, 1, 1, 1, 1,
0.8065416, 1.177047, -0.8877761, 1, 1, 1, 1, 1,
0.8130104, -0.1101272, 1.230712, 1, 1, 1, 1, 1,
0.8155093, -2.416642, 3.339828, 0, 0, 1, 1, 1,
0.8158523, 0.6284649, 0.8388469, 1, 0, 0, 1, 1,
0.8248549, -0.3419983, 2.638361, 1, 0, 0, 1, 1,
0.8254839, -0.521189, 2.461171, 1, 0, 0, 1, 1,
0.8327362, -0.1808793, 0.5408636, 1, 0, 0, 1, 1,
0.8371305, 2.054706, -0.1539209, 1, 0, 0, 1, 1,
0.8414947, 1.021772, 0.4000647, 0, 0, 0, 1, 1,
0.8444992, -0.01648298, 2.298547, 0, 0, 0, 1, 1,
0.8552449, -0.6999885, 2.816572, 0, 0, 0, 1, 1,
0.858798, 1.702966, 0.301344, 0, 0, 0, 1, 1,
0.859755, 0.4041678, 1.200928, 0, 0, 0, 1, 1,
0.8606725, 0.8292093, 0.2639785, 0, 0, 0, 1, 1,
0.8675272, -1.373464, 2.69181, 0, 0, 0, 1, 1,
0.8695989, 0.8714995, -0.1334545, 1, 1, 1, 1, 1,
0.8719525, -0.6653693, -0.7251901, 1, 1, 1, 1, 1,
0.8757317, -0.9042501, 2.393547, 1, 1, 1, 1, 1,
0.8783208, -1.375321, 1.413456, 1, 1, 1, 1, 1,
0.8848835, 1.290653, -0.07845175, 1, 1, 1, 1, 1,
0.8891857, -0.7259915, 1.966525, 1, 1, 1, 1, 1,
0.8961408, 0.4259, 2.569426, 1, 1, 1, 1, 1,
0.8976401, 0.06238835, 1.991671, 1, 1, 1, 1, 1,
0.9025058, 0.49405, 1.383629, 1, 1, 1, 1, 1,
0.9040123, -0.188746, 1.266222, 1, 1, 1, 1, 1,
0.9091823, 0.2393317, 2.408144, 1, 1, 1, 1, 1,
0.9092607, -1.525029, 4.298247, 1, 1, 1, 1, 1,
0.9103113, -0.6969464, 3.026141, 1, 1, 1, 1, 1,
0.9126406, 0.3535365, 0.02360607, 1, 1, 1, 1, 1,
0.9145154, -1.4215, 3.366486, 1, 1, 1, 1, 1,
0.9185502, 1.367613, -1.383366, 0, 0, 1, 1, 1,
0.919908, 1.122899, 2.215293, 1, 0, 0, 1, 1,
0.9242666, 0.4040314, 1.546909, 1, 0, 0, 1, 1,
0.9333145, 0.6159697, 0.392763, 1, 0, 0, 1, 1,
0.9346502, 0.2916673, 1.856798, 1, 0, 0, 1, 1,
0.9359771, 0.09166803, 2.629434, 1, 0, 0, 1, 1,
0.9363287, 0.2529965, 2.046601, 0, 0, 0, 1, 1,
0.9404165, 1.123658, 3.035906, 0, 0, 0, 1, 1,
0.9414244, -1.892936, 2.122835, 0, 0, 0, 1, 1,
0.9416113, -0.4087281, 0.9213364, 0, 0, 0, 1, 1,
0.9509419, -1.311703, 2.758864, 0, 0, 0, 1, 1,
0.9557023, 0.3683984, 3.143186, 0, 0, 0, 1, 1,
0.9571994, -0.03516023, 2.24491, 0, 0, 0, 1, 1,
0.9610128, 0.04114753, -0.3805989, 1, 1, 1, 1, 1,
0.9630946, 0.9589269, -0.9332026, 1, 1, 1, 1, 1,
0.9669176, 0.256038, 1.048702, 1, 1, 1, 1, 1,
0.9732289, -0.1536002, 1.530162, 1, 1, 1, 1, 1,
0.9798881, -1.024295, 2.699933, 1, 1, 1, 1, 1,
0.9816231, -1.757151, 3.157622, 1, 1, 1, 1, 1,
0.985167, -1.519176, 2.253161, 1, 1, 1, 1, 1,
0.9924163, -0.08387186, 2.532566, 1, 1, 1, 1, 1,
1.002864, -1.189543, 2.144612, 1, 1, 1, 1, 1,
1.007533, -1.084472, 1.7571, 1, 1, 1, 1, 1,
1.008832, -1.040258, 1.66055, 1, 1, 1, 1, 1,
1.014911, -0.7830374, 0.4955717, 1, 1, 1, 1, 1,
1.016517, 0.397124, 0.9530756, 1, 1, 1, 1, 1,
1.022216, -2.115881, 4.901686, 1, 1, 1, 1, 1,
1.02275, -1.122109, 2.651544, 1, 1, 1, 1, 1,
1.023306, 0.6338747, 0.8920698, 0, 0, 1, 1, 1,
1.023838, 1.420572, -0.1916904, 1, 0, 0, 1, 1,
1.028887, 0.9195275, 1.598741, 1, 0, 0, 1, 1,
1.031154, -1.914547, 4.069421, 1, 0, 0, 1, 1,
1.032799, 0.9457567, 2.616482, 1, 0, 0, 1, 1,
1.033872, -1.993773, 2.200556, 1, 0, 0, 1, 1,
1.039139, -2.177217, 4.446902, 0, 0, 0, 1, 1,
1.041052, 1.704138, 0.5572988, 0, 0, 0, 1, 1,
1.046706, -0.4031179, 1.005142, 0, 0, 0, 1, 1,
1.074982, -0.1842977, 1.513498, 0, 0, 0, 1, 1,
1.080311, 0.3562377, -1.928072, 0, 0, 0, 1, 1,
1.084946, 0.1281966, 1.417382, 0, 0, 0, 1, 1,
1.096418, -0.2365794, 0.5221898, 0, 0, 0, 1, 1,
1.096899, 0.7868909, 0.7619003, 1, 1, 1, 1, 1,
1.101793, -0.4535081, 3.94694, 1, 1, 1, 1, 1,
1.10725, -0.4624877, 3.220689, 1, 1, 1, 1, 1,
1.115102, 0.5937632, 2.66591, 1, 1, 1, 1, 1,
1.131214, 0.4749773, 2.567194, 1, 1, 1, 1, 1,
1.140069, -1.203779, 4.193373, 1, 1, 1, 1, 1,
1.151207, 2.150014, 2.626153, 1, 1, 1, 1, 1,
1.15259, 2.079391, 1.573651, 1, 1, 1, 1, 1,
1.155896, 1.242395, -0.6583413, 1, 1, 1, 1, 1,
1.160013, -0.8506326, 1.164448, 1, 1, 1, 1, 1,
1.17083, -0.812612, 3.37016, 1, 1, 1, 1, 1,
1.173838, 0.401576, 3.117355, 1, 1, 1, 1, 1,
1.174222, -0.0742281, -0.7442303, 1, 1, 1, 1, 1,
1.175108, 1.183905, 1.285631, 1, 1, 1, 1, 1,
1.190398, -0.1044304, 2.25608, 1, 1, 1, 1, 1,
1.193028, -1.302273, 2.499573, 0, 0, 1, 1, 1,
1.196447, -1.220537, 1.067931, 1, 0, 0, 1, 1,
1.19938, -1.06034, 2.579791, 1, 0, 0, 1, 1,
1.200729, -0.1984221, 1.588639, 1, 0, 0, 1, 1,
1.201713, 0.947595, 1.213454, 1, 0, 0, 1, 1,
1.203742, -1.426031, 3.410627, 1, 0, 0, 1, 1,
1.208313, 1.010022, 2.818345, 0, 0, 0, 1, 1,
1.211147, -1.430472, 1.954587, 0, 0, 0, 1, 1,
1.212794, -0.3701188, 3.920716, 0, 0, 0, 1, 1,
1.233699, -0.7341359, -0.04397201, 0, 0, 0, 1, 1,
1.233757, -0.1683396, 1.163791, 0, 0, 0, 1, 1,
1.243579, 2.317254, 0.8603362, 0, 0, 0, 1, 1,
1.251499, -1.026857, 3.699811, 0, 0, 0, 1, 1,
1.254751, -0.2216118, 1.684361, 1, 1, 1, 1, 1,
1.26038, 0.4585593, 2.988977, 1, 1, 1, 1, 1,
1.260657, -0.5381575, 0.06324397, 1, 1, 1, 1, 1,
1.263231, 1.022808, 0.9311034, 1, 1, 1, 1, 1,
1.278572, -0.8065158, 2.47539, 1, 1, 1, 1, 1,
1.282143, -0.09693073, 0.1904174, 1, 1, 1, 1, 1,
1.292634, 0.9902298, 0.08160253, 1, 1, 1, 1, 1,
1.293666, -0.467481, 3.628119, 1, 1, 1, 1, 1,
1.293751, -0.1236458, 2.883426, 1, 1, 1, 1, 1,
1.295333, -1.536658, 2.96139, 1, 1, 1, 1, 1,
1.320816, -0.005707459, 1.324677, 1, 1, 1, 1, 1,
1.323057, 0.6341564, 0.1605056, 1, 1, 1, 1, 1,
1.325955, -1.286216, 3.582583, 1, 1, 1, 1, 1,
1.328451, -0.02478919, 0.484062, 1, 1, 1, 1, 1,
1.331491, 0.2268277, 3.100257, 1, 1, 1, 1, 1,
1.335809, -0.1226682, 0.9912718, 0, 0, 1, 1, 1,
1.34571, 3.690516, -1.198892, 1, 0, 0, 1, 1,
1.346465, -0.4075408, 1.827796, 1, 0, 0, 1, 1,
1.351368, 0.1060566, 1.152903, 1, 0, 0, 1, 1,
1.35878, -0.7961966, 0.7708392, 1, 0, 0, 1, 1,
1.362878, -0.5491596, 0.996904, 1, 0, 0, 1, 1,
1.382611, -0.4735226, 0.2256069, 0, 0, 0, 1, 1,
1.401395, -1.152924, 1.521017, 0, 0, 0, 1, 1,
1.405457, -0.2466281, 2.690895, 0, 0, 0, 1, 1,
1.423861, 0.2941487, 0.5601147, 0, 0, 0, 1, 1,
1.431247, -0.7432658, 3.167593, 0, 0, 0, 1, 1,
1.432774, 2.425011, 0.2817159, 0, 0, 0, 1, 1,
1.438075, 1.196676, 0.6554031, 0, 0, 0, 1, 1,
1.43829, -1.01922, 2.030781, 1, 1, 1, 1, 1,
1.442616, -2.614398, 1.530488, 1, 1, 1, 1, 1,
1.446225, -0.1538177, 3.380311, 1, 1, 1, 1, 1,
1.448376, 1.294257, 1.2539, 1, 1, 1, 1, 1,
1.463155, -0.1438966, 1.843528, 1, 1, 1, 1, 1,
1.465404, -0.3118215, 1.160173, 1, 1, 1, 1, 1,
1.465474, 0.08111948, 1.172128, 1, 1, 1, 1, 1,
1.498039, 2.095301, -0.619973, 1, 1, 1, 1, 1,
1.500558, 1.852026, 0.5897454, 1, 1, 1, 1, 1,
1.505015, 0.2805594, 1.61655, 1, 1, 1, 1, 1,
1.505103, 0.3912977, -0.5637165, 1, 1, 1, 1, 1,
1.509064, -0.1126264, 3.304287, 1, 1, 1, 1, 1,
1.520665, -1.61706, 1.979243, 1, 1, 1, 1, 1,
1.530605, 0.7314233, -0.1098848, 1, 1, 1, 1, 1,
1.535019, 0.1008034, 1.036576, 1, 1, 1, 1, 1,
1.537033, -0.5972191, 3.566208, 0, 0, 1, 1, 1,
1.545726, 1.651862, 1.02591, 1, 0, 0, 1, 1,
1.584729, 0.4980676, 1.943924, 1, 0, 0, 1, 1,
1.591148, -0.6004567, 2.806038, 1, 0, 0, 1, 1,
1.598865, 0.1061804, 1.895169, 1, 0, 0, 1, 1,
1.611463, 0.6474121, -0.1078497, 1, 0, 0, 1, 1,
1.613934, 0.06975234, 0.686466, 0, 0, 0, 1, 1,
1.615072, -1.202621, 1.261397, 0, 0, 0, 1, 1,
1.620919, 0.2622272, 0.09197184, 0, 0, 0, 1, 1,
1.628412, -0.9442739, 2.280285, 0, 0, 0, 1, 1,
1.630446, -1.426492, 1.731053, 0, 0, 0, 1, 1,
1.640383, -0.4723661, 3.129013, 0, 0, 0, 1, 1,
1.644345, 1.468952, 0.4041364, 0, 0, 0, 1, 1,
1.65637, 0.3506882, 2.260488, 1, 1, 1, 1, 1,
1.657118, 0.8355686, 1.614489, 1, 1, 1, 1, 1,
1.660877, 0.340183, 1.064824, 1, 1, 1, 1, 1,
1.663208, 0.03885716, 0.05642546, 1, 1, 1, 1, 1,
1.670252, 0.522102, 0.2261077, 1, 1, 1, 1, 1,
1.677463, 0.05763169, 0.8827612, 1, 1, 1, 1, 1,
1.684456, -1.14238, 2.567022, 1, 1, 1, 1, 1,
1.685344, -0.9695233, 2.9849, 1, 1, 1, 1, 1,
1.693097, -1.513414, 2.867337, 1, 1, 1, 1, 1,
1.697202, 0.6066622, 0.4673496, 1, 1, 1, 1, 1,
1.713076, -0.3625791, 2.382451, 1, 1, 1, 1, 1,
1.721611, -1.181272, 1.24354, 1, 1, 1, 1, 1,
1.730354, -1.030108, 0.4141777, 1, 1, 1, 1, 1,
1.734407, -0.529218, 1.7216, 1, 1, 1, 1, 1,
1.742144, -0.5511629, 1.809999, 1, 1, 1, 1, 1,
1.750957, -1.874263, 3.907171, 0, 0, 1, 1, 1,
1.764227, 1.053501, 0.6145997, 1, 0, 0, 1, 1,
1.786393, -0.3399521, 0.8963861, 1, 0, 0, 1, 1,
1.827914, 0.2139161, 1.666712, 1, 0, 0, 1, 1,
1.829025, -0.6178389, 1.89648, 1, 0, 0, 1, 1,
1.834959, -0.41362, 1.687843, 1, 0, 0, 1, 1,
1.836217, 0.5130578, 1.107146, 0, 0, 0, 1, 1,
1.841612, 1.006638, 1.312523, 0, 0, 0, 1, 1,
1.846817, -0.1471495, 1.268289, 0, 0, 0, 1, 1,
1.855163, 0.5968745, 1.129003, 0, 0, 0, 1, 1,
1.859835, 0.4542226, 1.515239, 0, 0, 0, 1, 1,
1.862162, 1.41873, 1.842817, 0, 0, 0, 1, 1,
1.865772, 0.04422968, 1.914702, 0, 0, 0, 1, 1,
1.8932, -1.310796, 1.912148, 1, 1, 1, 1, 1,
1.89953, 0.2648749, 2.299342, 1, 1, 1, 1, 1,
1.922241, -1.498238, 2.188676, 1, 1, 1, 1, 1,
1.924881, -2.260797, 3.469687, 1, 1, 1, 1, 1,
1.937986, -1.027859, 3.128344, 1, 1, 1, 1, 1,
1.948631, 1.912149, 3.089988, 1, 1, 1, 1, 1,
1.962839, -0.3334187, 2.982938, 1, 1, 1, 1, 1,
1.968618, 0.1184255, 1.496767, 1, 1, 1, 1, 1,
1.969556, -1.16547, 0.8111423, 1, 1, 1, 1, 1,
1.976358, 0.398065, 1.780013, 1, 1, 1, 1, 1,
1.988814, -0.9397356, 2.62265, 1, 1, 1, 1, 1,
2.006861, -0.7259922, 2.448038, 1, 1, 1, 1, 1,
2.020874, 0.7108272, 0.2540493, 1, 1, 1, 1, 1,
2.047777, -1.049629, -0.7552976, 1, 1, 1, 1, 1,
2.053222, -0.2031058, 2.547649, 1, 1, 1, 1, 1,
2.109033, -0.03397273, 1.361533, 0, 0, 1, 1, 1,
2.112526, -0.8821394, 0.7078296, 1, 0, 0, 1, 1,
2.175217, -0.3130641, 0.9398317, 1, 0, 0, 1, 1,
2.184106, 0.16941, -0.2620766, 1, 0, 0, 1, 1,
2.261765, 0.4597132, 2.497782, 1, 0, 0, 1, 1,
2.274185, -1.703628, 1.636114, 1, 0, 0, 1, 1,
2.351858, -2.455011, 3.695454, 0, 0, 0, 1, 1,
2.352552, -1.165939, 2.059106, 0, 0, 0, 1, 1,
2.425802, 0.07942107, 1.330406, 0, 0, 0, 1, 1,
2.463742, -0.5703643, 0.8896872, 0, 0, 0, 1, 1,
2.486596, -0.3972152, 1.180418, 0, 0, 0, 1, 1,
2.553437, -0.4484001, 1.635162, 0, 0, 0, 1, 1,
2.578729, 1.157202, 1.040651, 0, 0, 0, 1, 1,
2.598386, -0.51886, 1.837334, 1, 1, 1, 1, 1,
2.704235, 0.8500756, 1.382305, 1, 1, 1, 1, 1,
2.716255, 1.710174, 0.6434364, 1, 1, 1, 1, 1,
2.827883, 1.227525, -0.2040792, 1, 1, 1, 1, 1,
2.920564, -0.16203, 2.949678, 1, 1, 1, 1, 1,
2.971589, -2.03541, 4.388167, 1, 1, 1, 1, 1,
3.20383, -0.4453103, 2.094525, 1, 1, 1, 1, 1
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
var radius = 9.740512;
var distance = 34.21313;
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
mvMatrix.translate( -0.1041023, -0.05290222, 0.111433 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21313);
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
