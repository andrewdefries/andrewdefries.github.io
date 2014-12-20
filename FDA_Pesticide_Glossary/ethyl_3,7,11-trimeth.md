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
-2.55795, -1.466681, -3.254226, 1, 0, 0, 1,
-2.539144, 1.714326, 0.7939025, 1, 0.007843138, 0, 1,
-2.451745, -0.9796035, -1.33716, 1, 0.01176471, 0, 1,
-2.433925, -0.6093143, -1.425598, 1, 0.01960784, 0, 1,
-2.420092, 0.8764767, -2.355812, 1, 0.02352941, 0, 1,
-2.403262, 1.756205, -1.837308, 1, 0.03137255, 0, 1,
-2.393394, 0.7495457, -0.5654187, 1, 0.03529412, 0, 1,
-2.392555, -0.8276628, -2.869693, 1, 0.04313726, 0, 1,
-2.354549, 0.1559078, -0.8892307, 1, 0.04705882, 0, 1,
-2.325033, 0.3375451, -1.088305, 1, 0.05490196, 0, 1,
-2.308728, -0.5292937, -0.5191843, 1, 0.05882353, 0, 1,
-2.24592, 0.7674997, -0.961597, 1, 0.06666667, 0, 1,
-2.234669, -0.7546048, -0.8107779, 1, 0.07058824, 0, 1,
-2.224845, 1.9799, -0.3186685, 1, 0.07843138, 0, 1,
-2.214866, -1.028026, -1.072746, 1, 0.08235294, 0, 1,
-2.138523, 0.08203393, -0.5027115, 1, 0.09019608, 0, 1,
-2.119208, -0.6901332, 0.7250812, 1, 0.09411765, 0, 1,
-2.079411, -1.816671, -3.414513, 1, 0.1019608, 0, 1,
-2.043929, -0.3237747, -1.806658, 1, 0.1098039, 0, 1,
-1.983149, -1.580485, -3.111855, 1, 0.1137255, 0, 1,
-1.981601, 0.8978722, -2.443724, 1, 0.1215686, 0, 1,
-1.97764, -0.1912743, -2.251813, 1, 0.1254902, 0, 1,
-1.973752, 0.1469684, -2.329184, 1, 0.1333333, 0, 1,
-1.934372, 2.682161, 0.7422544, 1, 0.1372549, 0, 1,
-1.915485, 0.6374769, -0.306851, 1, 0.145098, 0, 1,
-1.904708, 0.6675246, -0.7996819, 1, 0.1490196, 0, 1,
-1.896641, -1.301426, -1.917584, 1, 0.1568628, 0, 1,
-1.883589, 1.516068, -2.821947, 1, 0.1607843, 0, 1,
-1.882855, -0.8964692, -3.586647, 1, 0.1686275, 0, 1,
-1.879094, 1.091897, 0.962117, 1, 0.172549, 0, 1,
-1.829022, 0.5165942, -2.392377, 1, 0.1803922, 0, 1,
-1.826586, 0.233931, -0.1995419, 1, 0.1843137, 0, 1,
-1.823921, -0.2118719, 0.441305, 1, 0.1921569, 0, 1,
-1.798783, 1.780927, -1.759498, 1, 0.1960784, 0, 1,
-1.794379, 1.02525, -0.6594431, 1, 0.2039216, 0, 1,
-1.787104, 0.2797003, 0.08265563, 1, 0.2117647, 0, 1,
-1.784514, 1.166191, -2.295882, 1, 0.2156863, 0, 1,
-1.762255, -0.2668777, -2.591113, 1, 0.2235294, 0, 1,
-1.76071, 0.9489741, -2.312979, 1, 0.227451, 0, 1,
-1.758183, -2.34793, -1.797503, 1, 0.2352941, 0, 1,
-1.747654, -1.508722, -1.587247, 1, 0.2392157, 0, 1,
-1.7346, -0.6261238, -1.132217, 1, 0.2470588, 0, 1,
-1.730292, 2.433517, -0.6090769, 1, 0.2509804, 0, 1,
-1.722558, -1.330118, -2.030022, 1, 0.2588235, 0, 1,
-1.719451, -1.36786, -1.557135, 1, 0.2627451, 0, 1,
-1.714381, 0.599682, -2.598578, 1, 0.2705882, 0, 1,
-1.699932, 1.797129, -1.340443, 1, 0.2745098, 0, 1,
-1.69272, 0.05508106, 1.205863, 1, 0.282353, 0, 1,
-1.67233, 0.6500008, -1.198822, 1, 0.2862745, 0, 1,
-1.664094, 0.482558, -0.933903, 1, 0.2941177, 0, 1,
-1.661096, -0.9669167, 0.004253013, 1, 0.3019608, 0, 1,
-1.640413, -0.5188074, -2.263971, 1, 0.3058824, 0, 1,
-1.622935, -0.3142374, -1.30049, 1, 0.3137255, 0, 1,
-1.602313, -0.771425, -1.415285, 1, 0.3176471, 0, 1,
-1.600504, -1.061384, -3.107499, 1, 0.3254902, 0, 1,
-1.590794, 1.01436, -1.74096, 1, 0.3294118, 0, 1,
-1.580395, -1.124604, -1.008642, 1, 0.3372549, 0, 1,
-1.569805, 0.1048877, -0.5954034, 1, 0.3411765, 0, 1,
-1.550391, 1.339775, -1.982911, 1, 0.3490196, 0, 1,
-1.549575, 0.8349225, -1.956586, 1, 0.3529412, 0, 1,
-1.547349, -2.216081, -2.17005, 1, 0.3607843, 0, 1,
-1.54555, 0.2939501, -1.549108, 1, 0.3647059, 0, 1,
-1.54266, -0.3852837, -2.050589, 1, 0.372549, 0, 1,
-1.533705, 0.4275342, -0.7470657, 1, 0.3764706, 0, 1,
-1.531998, 0.5778826, 0.2023604, 1, 0.3843137, 0, 1,
-1.525896, 0.6293432, -1.953429, 1, 0.3882353, 0, 1,
-1.523993, -0.3011064, -1.97353, 1, 0.3960784, 0, 1,
-1.518298, 0.3379091, 0.2348701, 1, 0.4039216, 0, 1,
-1.512616, 1.212451, -1.435526, 1, 0.4078431, 0, 1,
-1.507627, -0.004316172, -1.792899, 1, 0.4156863, 0, 1,
-1.488038, -0.1687396, -1.295531, 1, 0.4196078, 0, 1,
-1.486247, -0.9881722, -3.040347, 1, 0.427451, 0, 1,
-1.474814, 0.5417221, 0.6470248, 1, 0.4313726, 0, 1,
-1.461273, -0.5568689, -1.0273, 1, 0.4392157, 0, 1,
-1.459207, 0.2314167, -0.1125927, 1, 0.4431373, 0, 1,
-1.456134, -1.255243, -2.795888, 1, 0.4509804, 0, 1,
-1.451073, -2.333851, -3.116004, 1, 0.454902, 0, 1,
-1.450723, 0.169606, -0.9819624, 1, 0.4627451, 0, 1,
-1.42697, -2.003312, -3.342098, 1, 0.4666667, 0, 1,
-1.426601, -1.657114, -2.715261, 1, 0.4745098, 0, 1,
-1.42255, 0.0686601, -1.284684, 1, 0.4784314, 0, 1,
-1.414627, -1.615259, -2.50691, 1, 0.4862745, 0, 1,
-1.414514, -0.2438631, -2.484931, 1, 0.4901961, 0, 1,
-1.397416, -0.7851683, -2.290008, 1, 0.4980392, 0, 1,
-1.391299, 0.2330516, -1.67528, 1, 0.5058824, 0, 1,
-1.385237, -0.4988512, -2.631201, 1, 0.509804, 0, 1,
-1.377878, -2.785919, -2.224596, 1, 0.5176471, 0, 1,
-1.373485, 1.310288, -0.2275086, 1, 0.5215687, 0, 1,
-1.372199, -0.6071556, -2.035129, 1, 0.5294118, 0, 1,
-1.366491, 0.2946535, -0.5192939, 1, 0.5333334, 0, 1,
-1.36383, -0.1971399, -1.309831, 1, 0.5411765, 0, 1,
-1.355702, -1.148423, -0.485523, 1, 0.5450981, 0, 1,
-1.35466, -1.333353, -2.626115, 1, 0.5529412, 0, 1,
-1.354472, -0.9476116, -3.806704, 1, 0.5568628, 0, 1,
-1.352843, 1.856903, -0.6754422, 1, 0.5647059, 0, 1,
-1.348061, -0.1257746, -1.549513, 1, 0.5686275, 0, 1,
-1.344999, -0.4909093, -2.565829, 1, 0.5764706, 0, 1,
-1.341692, 2.114619, -0.4063287, 1, 0.5803922, 0, 1,
-1.339844, -2.166038, -2.35633, 1, 0.5882353, 0, 1,
-1.327085, 2.005236, -0.8689439, 1, 0.5921569, 0, 1,
-1.301866, 1.753335, -1.33175, 1, 0.6, 0, 1,
-1.301468, 0.1370053, 0.07198981, 1, 0.6078432, 0, 1,
-1.293201, -0.4952461, -2.756016, 1, 0.6117647, 0, 1,
-1.286234, 0.1861586, -3.395373, 1, 0.6196079, 0, 1,
-1.283345, 0.01535528, -3.431155, 1, 0.6235294, 0, 1,
-1.274759, 1.024997, -0.9467196, 1, 0.6313726, 0, 1,
-1.268861, 3.530008, -0.5011066, 1, 0.6352941, 0, 1,
-1.2669, 0.6321878, -1.661055, 1, 0.6431373, 0, 1,
-1.265072, -0.247518, -1.549191, 1, 0.6470588, 0, 1,
-1.262115, 0.01920794, -3.234037, 1, 0.654902, 0, 1,
-1.257925, -0.1333651, -2.85784, 1, 0.6588235, 0, 1,
-1.245256, 1.149252, -0.259299, 1, 0.6666667, 0, 1,
-1.244366, -0.3777893, -3.471889, 1, 0.6705883, 0, 1,
-1.241215, -0.4323193, -1.290732, 1, 0.6784314, 0, 1,
-1.22745, 1.513909, -0.6105806, 1, 0.682353, 0, 1,
-1.225834, -0.4885088, -3.557313, 1, 0.6901961, 0, 1,
-1.22291, -0.06334175, -0.401811, 1, 0.6941177, 0, 1,
-1.222117, -0.555656, -2.228785, 1, 0.7019608, 0, 1,
-1.216141, -0.8391972, -1.968376, 1, 0.7098039, 0, 1,
-1.209215, -1.443957, -3.200046, 1, 0.7137255, 0, 1,
-1.205875, 1.425903, -0.98361, 1, 0.7215686, 0, 1,
-1.202665, -0.07773468, -1.031565, 1, 0.7254902, 0, 1,
-1.2022, 0.004559103, -1.485898, 1, 0.7333333, 0, 1,
-1.200549, -1.257335, -3.178585, 1, 0.7372549, 0, 1,
-1.199421, -0.5498047, -1.715504, 1, 0.7450981, 0, 1,
-1.197219, 2.446802, -0.7854351, 1, 0.7490196, 0, 1,
-1.191368, -0.06009442, -1.501049, 1, 0.7568628, 0, 1,
-1.191225, 0.8955491, -0.4385839, 1, 0.7607843, 0, 1,
-1.190835, 0.5675526, -2.875043, 1, 0.7686275, 0, 1,
-1.186193, 0.9873592, 0.8546389, 1, 0.772549, 0, 1,
-1.160893, -0.4381913, -1.875898, 1, 0.7803922, 0, 1,
-1.160832, -1.312823, -3.132482, 1, 0.7843137, 0, 1,
-1.156981, 1.082277, -1.247221, 1, 0.7921569, 0, 1,
-1.156822, -0.6205589, -1.449453, 1, 0.7960784, 0, 1,
-1.155569, 0.2298371, -2.276193, 1, 0.8039216, 0, 1,
-1.148061, -0.7196953, -1.538945, 1, 0.8117647, 0, 1,
-1.142421, 1.157088, -0.003215625, 1, 0.8156863, 0, 1,
-1.141608, 0.9843462, -2.968139, 1, 0.8235294, 0, 1,
-1.13196, -0.676295, -2.076672, 1, 0.827451, 0, 1,
-1.131742, -0.5665216, -0.961351, 1, 0.8352941, 0, 1,
-1.127209, 0.254735, -2.300109, 1, 0.8392157, 0, 1,
-1.117325, -0.07108832, -0.506469, 1, 0.8470588, 0, 1,
-1.112356, -0.4492305, -2.582793, 1, 0.8509804, 0, 1,
-1.101036, 0.1103204, -0.5336027, 1, 0.8588235, 0, 1,
-1.100602, 1.809893, -2.169213, 1, 0.8627451, 0, 1,
-1.096144, 0.04775356, -0.3200598, 1, 0.8705882, 0, 1,
-1.093943, -0.8670326, -3.17538, 1, 0.8745098, 0, 1,
-1.089584, 0.8942007, -0.09329423, 1, 0.8823529, 0, 1,
-1.080912, -0.6773786, -1.306761, 1, 0.8862745, 0, 1,
-1.076463, -1.534737, -1.523033, 1, 0.8941177, 0, 1,
-1.066756, 0.175481, 0.3412823, 1, 0.8980392, 0, 1,
-1.065847, 0.9534603, -1.597991, 1, 0.9058824, 0, 1,
-1.061875, 1.174342, -1.811958, 1, 0.9137255, 0, 1,
-1.052247, -0.1773663, -3.456095, 1, 0.9176471, 0, 1,
-1.04931, 0.3894588, -2.139288, 1, 0.9254902, 0, 1,
-1.04604, 0.932209, -1.532645, 1, 0.9294118, 0, 1,
-1.045872, 0.3579886, -1.71129, 1, 0.9372549, 0, 1,
-1.045083, 1.076177, -0.3842778, 1, 0.9411765, 0, 1,
-1.038562, -0.1135228, -1.707282, 1, 0.9490196, 0, 1,
-1.027964, 0.5852022, -0.1130402, 1, 0.9529412, 0, 1,
-1.021132, 0.4291525, -0.8533327, 1, 0.9607843, 0, 1,
-1.003258, -2.027952, -4.207169, 1, 0.9647059, 0, 1,
-1.002395, 0.3763397, -1.715983, 1, 0.972549, 0, 1,
-0.9997759, 0.6265998, 0.1564192, 1, 0.9764706, 0, 1,
-0.9894791, -0.4451322, -1.570409, 1, 0.9843137, 0, 1,
-0.9838367, 0.4985509, -0.8946818, 1, 0.9882353, 0, 1,
-0.9765118, 0.1065114, -3.86572, 1, 0.9960784, 0, 1,
-0.9682485, -0.3781513, -2.70732, 0.9960784, 1, 0, 1,
-0.9614245, 1.522346, 0.4953394, 0.9921569, 1, 0, 1,
-0.960709, -0.161977, -1.668851, 0.9843137, 1, 0, 1,
-0.9524596, 0.3612326, -0.5078336, 0.9803922, 1, 0, 1,
-0.9496499, -0.6477746, -1.749767, 0.972549, 1, 0, 1,
-0.9494714, 1.325957, 0.5892897, 0.9686275, 1, 0, 1,
-0.9493609, 0.7417716, -0.6034528, 0.9607843, 1, 0, 1,
-0.9422038, 1.243901, -1.682313, 0.9568627, 1, 0, 1,
-0.9393263, 0.02789584, -3.945647, 0.9490196, 1, 0, 1,
-0.9330361, -0.5501137, -1.542452, 0.945098, 1, 0, 1,
-0.9319106, 0.6364861, -1.042381, 0.9372549, 1, 0, 1,
-0.9296591, -0.08635625, -0.4476337, 0.9333333, 1, 0, 1,
-0.925574, -0.05347151, -0.7383555, 0.9254902, 1, 0, 1,
-0.9227831, -1.420114, -0.2737823, 0.9215686, 1, 0, 1,
-0.9201578, -1.115543, -3.075269, 0.9137255, 1, 0, 1,
-0.9130191, 2.335099, 0.0638567, 0.9098039, 1, 0, 1,
-0.8930083, 0.1204686, -2.686054, 0.9019608, 1, 0, 1,
-0.8861746, -1.217486, -4.379878, 0.8941177, 1, 0, 1,
-0.8822568, 3.451533, 1.418111, 0.8901961, 1, 0, 1,
-0.8705253, -1.018573, -0.9331919, 0.8823529, 1, 0, 1,
-0.8668755, -1.777889, -2.310493, 0.8784314, 1, 0, 1,
-0.8551331, -0.7234499, -3.192837, 0.8705882, 1, 0, 1,
-0.8492344, -0.09915403, -3.154484, 0.8666667, 1, 0, 1,
-0.8421533, 1.269381, -1.627262, 0.8588235, 1, 0, 1,
-0.840909, 1.546885, 1.34319, 0.854902, 1, 0, 1,
-0.8403867, -1.838149, -3.010292, 0.8470588, 1, 0, 1,
-0.8374022, 1.815247, -1.77816, 0.8431373, 1, 0, 1,
-0.8355312, -0.2473488, -0.8217472, 0.8352941, 1, 0, 1,
-0.8339277, -0.5869358, -0.7239338, 0.8313726, 1, 0, 1,
-0.833221, -0.1001104, -0.5695447, 0.8235294, 1, 0, 1,
-0.8297935, -0.9131543, -1.780243, 0.8196079, 1, 0, 1,
-0.8252658, 1.124142, 0.65747, 0.8117647, 1, 0, 1,
-0.8221881, -0.5495161, -0.07554598, 0.8078431, 1, 0, 1,
-0.8204412, 0.5965822, -0.2121472, 0.8, 1, 0, 1,
-0.8158601, 0.8555816, -1.64271, 0.7921569, 1, 0, 1,
-0.8105194, 0.4822318, -1.129163, 0.7882353, 1, 0, 1,
-0.8072606, -0.3693748, -2.324366, 0.7803922, 1, 0, 1,
-0.8064698, 0.03681528, -1.19204, 0.7764706, 1, 0, 1,
-0.8054773, 1.123493, -0.7168103, 0.7686275, 1, 0, 1,
-0.803647, -0.7622278, -1.576811, 0.7647059, 1, 0, 1,
-0.8034845, 0.8233594, -1.626387, 0.7568628, 1, 0, 1,
-0.8018222, 0.2740634, -0.5945907, 0.7529412, 1, 0, 1,
-0.7952797, 0.4553888, -0.1178709, 0.7450981, 1, 0, 1,
-0.7858365, -0.1822934, -2.121889, 0.7411765, 1, 0, 1,
-0.7706417, 0.4297775, -2.289362, 0.7333333, 1, 0, 1,
-0.7665612, 0.8500437, -0.6564648, 0.7294118, 1, 0, 1,
-0.7642204, -1.129752, -2.557437, 0.7215686, 1, 0, 1,
-0.7630508, -0.467302, -0.3448822, 0.7176471, 1, 0, 1,
-0.7607833, -1.022953, -2.906687, 0.7098039, 1, 0, 1,
-0.7595005, 2.46746, 0.5582423, 0.7058824, 1, 0, 1,
-0.7581136, 1.975274, -0.1165574, 0.6980392, 1, 0, 1,
-0.7574473, 1.47719, 2.639292, 0.6901961, 1, 0, 1,
-0.756278, -0.4659978, -2.865226, 0.6862745, 1, 0, 1,
-0.7493473, -0.6542844, -1.962316, 0.6784314, 1, 0, 1,
-0.7468637, 1.513926, 0.09364293, 0.6745098, 1, 0, 1,
-0.7452271, -1.321733, -1.407676, 0.6666667, 1, 0, 1,
-0.7375178, 1.265434, -1.153155, 0.6627451, 1, 0, 1,
-0.7365162, 0.9954129, -0.4806349, 0.654902, 1, 0, 1,
-0.7310193, 0.4770164, 0.131481, 0.6509804, 1, 0, 1,
-0.7265475, 0.1768532, -1.598212, 0.6431373, 1, 0, 1,
-0.7202222, -0.3035612, -0.6664925, 0.6392157, 1, 0, 1,
-0.71584, -1.03076, -2.082809, 0.6313726, 1, 0, 1,
-0.7120042, 0.6919607, -1.34417, 0.627451, 1, 0, 1,
-0.7073528, 0.9050799, -1.012727, 0.6196079, 1, 0, 1,
-0.7041869, -0.6506533, -1.517525, 0.6156863, 1, 0, 1,
-0.7019171, -2.671382, -3.082375, 0.6078432, 1, 0, 1,
-0.6858358, 0.09017294, -1.126261, 0.6039216, 1, 0, 1,
-0.6858234, -0.7361213, -2.567099, 0.5960785, 1, 0, 1,
-0.6843483, 1.14876, -0.2134384, 0.5882353, 1, 0, 1,
-0.67793, 0.3205938, -1.082625, 0.5843138, 1, 0, 1,
-0.6759034, 2.020271, -0.1955904, 0.5764706, 1, 0, 1,
-0.6735883, 0.008550696, -1.235697, 0.572549, 1, 0, 1,
-0.6729883, 0.675696, -2.934048, 0.5647059, 1, 0, 1,
-0.6682116, 1.177788, 0.1862012, 0.5607843, 1, 0, 1,
-0.667035, 1.677536, -0.03029178, 0.5529412, 1, 0, 1,
-0.6649009, 1.106133, -1.051356, 0.5490196, 1, 0, 1,
-0.6603324, 0.09616486, -0.6105838, 0.5411765, 1, 0, 1,
-0.6583066, -0.6450958, -3.375015, 0.5372549, 1, 0, 1,
-0.651935, -0.6431421, -0.2048638, 0.5294118, 1, 0, 1,
-0.6493663, 0.8652686, -1.023915, 0.5254902, 1, 0, 1,
-0.6379498, -0.1733894, -1.710227, 0.5176471, 1, 0, 1,
-0.6355297, -0.705139, -2.42508, 0.5137255, 1, 0, 1,
-0.6234247, -0.1323392, 0.2406657, 0.5058824, 1, 0, 1,
-0.6201662, 1.080895, -0.9938741, 0.5019608, 1, 0, 1,
-0.6163612, -0.7486687, -1.956259, 0.4941176, 1, 0, 1,
-0.6162235, 0.660628, -1.156469, 0.4862745, 1, 0, 1,
-0.615067, 2.189578, 0.665689, 0.4823529, 1, 0, 1,
-0.6123245, -0.3803053, -2.293035, 0.4745098, 1, 0, 1,
-0.6107091, -0.1596764, 1.181516, 0.4705882, 1, 0, 1,
-0.6101854, 0.7157238, -1.531106, 0.4627451, 1, 0, 1,
-0.6099968, 0.2189544, -0.1170632, 0.4588235, 1, 0, 1,
-0.6048677, 0.1427256, -0.6206095, 0.4509804, 1, 0, 1,
-0.6013581, 1.663688, -2.21476, 0.4470588, 1, 0, 1,
-0.598763, 0.1030144, -2.031494, 0.4392157, 1, 0, 1,
-0.5934453, 0.3311623, -0.8561884, 0.4352941, 1, 0, 1,
-0.5934246, 0.7739142, -1.816454, 0.427451, 1, 0, 1,
-0.5915828, -1.848577, -3.390615, 0.4235294, 1, 0, 1,
-0.5894203, -0.3316372, -0.5081645, 0.4156863, 1, 0, 1,
-0.5808026, 1.044908, -1.236515, 0.4117647, 1, 0, 1,
-0.5788633, 0.2130667, -1.540398, 0.4039216, 1, 0, 1,
-0.5778003, -1.083011, -1.875464, 0.3960784, 1, 0, 1,
-0.5775508, -1.058166, -2.52537, 0.3921569, 1, 0, 1,
-0.5771708, 0.145281, -1.456386, 0.3843137, 1, 0, 1,
-0.5766103, -0.8353956, -3.167907, 0.3803922, 1, 0, 1,
-0.5764216, -0.7049713, -1.904915, 0.372549, 1, 0, 1,
-0.576417, 0.3675394, -0.5052255, 0.3686275, 1, 0, 1,
-0.5741575, 1.590922, 0.7755228, 0.3607843, 1, 0, 1,
-0.5731236, 1.31207, -0.1084116, 0.3568628, 1, 0, 1,
-0.5721868, -0.08685134, -2.792006, 0.3490196, 1, 0, 1,
-0.5704395, 0.01606457, -1.778191, 0.345098, 1, 0, 1,
-0.5701464, 0.8428873, 1.269191, 0.3372549, 1, 0, 1,
-0.5579863, 0.4616784, -0.9291639, 0.3333333, 1, 0, 1,
-0.5571801, 0.6264242, -0.1648938, 0.3254902, 1, 0, 1,
-0.5491698, 1.140453, -0.522738, 0.3215686, 1, 0, 1,
-0.547457, -0.3750761, -2.938358, 0.3137255, 1, 0, 1,
-0.5430087, 1.920612, -0.3051471, 0.3098039, 1, 0, 1,
-0.5422631, -0.01867773, -3.862783, 0.3019608, 1, 0, 1,
-0.5372138, -0.9326863, -1.424369, 0.2941177, 1, 0, 1,
-0.5350274, -2.079683, -1.903939, 0.2901961, 1, 0, 1,
-0.5320186, -1.469314, -2.992332, 0.282353, 1, 0, 1,
-0.5305231, 0.9815482, -0.752464, 0.2784314, 1, 0, 1,
-0.5225402, -1.064544, -3.030946, 0.2705882, 1, 0, 1,
-0.5211328, 1.129501, 0.2453175, 0.2666667, 1, 0, 1,
-0.5187804, 0.861797, 0.6573278, 0.2588235, 1, 0, 1,
-0.5176619, 0.8371251, -1.285801, 0.254902, 1, 0, 1,
-0.5139337, 0.4428797, -1.340801, 0.2470588, 1, 0, 1,
-0.5125445, -3.39637, -1.464111, 0.2431373, 1, 0, 1,
-0.511838, 0.830785, -1.470292, 0.2352941, 1, 0, 1,
-0.5116647, -0.8672815, -1.880667, 0.2313726, 1, 0, 1,
-0.5074651, 1.069122, -1.810966, 0.2235294, 1, 0, 1,
-0.5052617, 1.278115, -1.035695, 0.2196078, 1, 0, 1,
-0.5027029, -0.5292737, -1.268891, 0.2117647, 1, 0, 1,
-0.5002433, 0.5016168, -1.556108, 0.2078431, 1, 0, 1,
-0.4975407, -0.3361121, -1.759818, 0.2, 1, 0, 1,
-0.4969642, -0.5136314, -1.581432, 0.1921569, 1, 0, 1,
-0.4962799, -1.505105, -2.488172, 0.1882353, 1, 0, 1,
-0.4959052, -0.311756, -3.932713, 0.1803922, 1, 0, 1,
-0.4952281, -1.249523, -1.209049, 0.1764706, 1, 0, 1,
-0.4854805, -0.7370393, -4.632584, 0.1686275, 1, 0, 1,
-0.4848886, -0.6669983, -1.776935, 0.1647059, 1, 0, 1,
-0.4829521, -0.1930624, -3.52431, 0.1568628, 1, 0, 1,
-0.4804148, 1.286936, -2.195235, 0.1529412, 1, 0, 1,
-0.4776342, 0.4450703, -1.644369, 0.145098, 1, 0, 1,
-0.4766262, 0.6555051, -1.756756, 0.1411765, 1, 0, 1,
-0.473756, -0.183949, -0.9795141, 0.1333333, 1, 0, 1,
-0.4730163, 0.4261885, -1.566303, 0.1294118, 1, 0, 1,
-0.4729852, -0.4385556, -2.497267, 0.1215686, 1, 0, 1,
-0.4717548, -0.3141904, -1.838982, 0.1176471, 1, 0, 1,
-0.4681213, 0.8136526, -2.019787, 0.1098039, 1, 0, 1,
-0.4629354, -0.1422471, -0.4757885, 0.1058824, 1, 0, 1,
-0.4612989, -1.289659, -2.282876, 0.09803922, 1, 0, 1,
-0.4610743, -1.081711, -2.977222, 0.09019608, 1, 0, 1,
-0.4578509, 0.9680284, 0.6476313, 0.08627451, 1, 0, 1,
-0.4569483, 0.2404839, -2.033697, 0.07843138, 1, 0, 1,
-0.4542668, -0.4773618, -1.796758, 0.07450981, 1, 0, 1,
-0.453214, -0.2041388, -3.568393, 0.06666667, 1, 0, 1,
-0.4505535, -1.221935, -3.679318, 0.0627451, 1, 0, 1,
-0.4498575, -0.5386673, -3.028008, 0.05490196, 1, 0, 1,
-0.4494106, 0.2271896, 0.3997932, 0.05098039, 1, 0, 1,
-0.4471279, -0.3932655, -2.755171, 0.04313726, 1, 0, 1,
-0.4454996, 0.7559817, -1.463068, 0.03921569, 1, 0, 1,
-0.4451043, -0.07142543, -2.576788, 0.03137255, 1, 0, 1,
-0.4441262, -1.830488, -3.050811, 0.02745098, 1, 0, 1,
-0.4402055, 0.2152935, -2.013771, 0.01960784, 1, 0, 1,
-0.4367906, 0.8795633, -0.2517827, 0.01568628, 1, 0, 1,
-0.4275796, 0.467547, -2.18813, 0.007843138, 1, 0, 1,
-0.4268088, -1.872823, -3.344723, 0.003921569, 1, 0, 1,
-0.4238446, -0.1222113, -1.790029, 0, 1, 0.003921569, 1,
-0.4232942, -0.6092323, -1.746674, 0, 1, 0.01176471, 1,
-0.4194753, 0.2972896, -2.148036, 0, 1, 0.01568628, 1,
-0.4177766, 0.5101346, 0.2247467, 0, 1, 0.02352941, 1,
-0.4172288, 0.78677, -0.5791043, 0, 1, 0.02745098, 1,
-0.4158556, 2.148577, -0.7505694, 0, 1, 0.03529412, 1,
-0.414105, 0.79525, -2.009218, 0, 1, 0.03921569, 1,
-0.4134012, 0.7347223, -0.7977079, 0, 1, 0.04705882, 1,
-0.4126046, 0.8897165, 0.3870892, 0, 1, 0.05098039, 1,
-0.408733, 1.390764, -2.024183, 0, 1, 0.05882353, 1,
-0.4026614, -0.6004079, -3.064739, 0, 1, 0.0627451, 1,
-0.402371, 1.405453, 1.07908, 0, 1, 0.07058824, 1,
-0.4022946, -0.2242223, -2.000309, 0, 1, 0.07450981, 1,
-0.3993542, 0.8730806, 0.0820258, 0, 1, 0.08235294, 1,
-0.3991424, -0.1004439, 0.06989712, 0, 1, 0.08627451, 1,
-0.396903, -0.4588345, -1.996914, 0, 1, 0.09411765, 1,
-0.3956726, -1.462777, -2.324739, 0, 1, 0.1019608, 1,
-0.394127, -1.737302, -3.391278, 0, 1, 0.1058824, 1,
-0.3919534, 0.3191848, 0.6700648, 0, 1, 0.1137255, 1,
-0.3895741, -1.179806, -2.085724, 0, 1, 0.1176471, 1,
-0.3881875, 0.7670885, 0.7598798, 0, 1, 0.1254902, 1,
-0.3871225, -0.8502377, -2.807306, 0, 1, 0.1294118, 1,
-0.3862025, 0.9278075, 2.118035, 0, 1, 0.1372549, 1,
-0.3802343, 0.4571766, -0.2591071, 0, 1, 0.1411765, 1,
-0.3795928, -0.3574001, -4.939056, 0, 1, 0.1490196, 1,
-0.3781629, -0.7621116, -3.387774, 0, 1, 0.1529412, 1,
-0.3768325, 2.20778, -0.4890406, 0, 1, 0.1607843, 1,
-0.375524, -0.3077553, -3.085719, 0, 1, 0.1647059, 1,
-0.3715226, -0.5187678, -2.115621, 0, 1, 0.172549, 1,
-0.3714505, -1.757072, -3.168686, 0, 1, 0.1764706, 1,
-0.3639058, -0.5810952, -5.369873, 0, 1, 0.1843137, 1,
-0.3611255, -0.3344244, -3.050487, 0, 1, 0.1882353, 1,
-0.359922, 0.8088475, -1.642438, 0, 1, 0.1960784, 1,
-0.3585198, 1.647365, -1.067563, 0, 1, 0.2039216, 1,
-0.3565893, 2.22853, -0.114915, 0, 1, 0.2078431, 1,
-0.3560854, 1.18985, 0.1516327, 0, 1, 0.2156863, 1,
-0.353688, -0.8269314, -3.654337, 0, 1, 0.2196078, 1,
-0.3492342, 0.5587956, 1.709136, 0, 1, 0.227451, 1,
-0.348042, 1.387516, 0.7323781, 0, 1, 0.2313726, 1,
-0.3467163, -0.8487623, -3.182757, 0, 1, 0.2392157, 1,
-0.3462272, -0.7086072, -2.770384, 0, 1, 0.2431373, 1,
-0.3419756, -0.2430398, -1.818335, 0, 1, 0.2509804, 1,
-0.3392634, -1.337724, -1.996262, 0, 1, 0.254902, 1,
-0.3359525, -0.9943955, -3.141864, 0, 1, 0.2627451, 1,
-0.3314017, -0.8835824, -1.458114, 0, 1, 0.2666667, 1,
-0.3287562, -0.2536779, -1.855998, 0, 1, 0.2745098, 1,
-0.3265121, -0.2735105, -2.552482, 0, 1, 0.2784314, 1,
-0.3194619, -0.9279241, -1.800701, 0, 1, 0.2862745, 1,
-0.3192855, -0.2625596, -1.035207, 0, 1, 0.2901961, 1,
-0.3140161, 0.9178983, -2.177071, 0, 1, 0.2980392, 1,
-0.3091693, -0.3338721, -2.830831, 0, 1, 0.3058824, 1,
-0.3083012, -0.2884195, -3.417654, 0, 1, 0.3098039, 1,
-0.3080767, 0.3446117, -1.557632, 0, 1, 0.3176471, 1,
-0.3080027, 0.2532462, -0.6567566, 0, 1, 0.3215686, 1,
-0.3071842, -0.367833, -3.946953, 0, 1, 0.3294118, 1,
-0.3057798, 0.2522705, 0.267679, 0, 1, 0.3333333, 1,
-0.3031708, -1.082276, -2.485283, 0, 1, 0.3411765, 1,
-0.2983925, -0.7579627, -2.911045, 0, 1, 0.345098, 1,
-0.2967896, 1.237578, -0.3699646, 0, 1, 0.3529412, 1,
-0.2945921, 0.4366494, -1.456568, 0, 1, 0.3568628, 1,
-0.2905159, -0.9252228, -3.873448, 0, 1, 0.3647059, 1,
-0.2899209, 0.4354118, 0.2343341, 0, 1, 0.3686275, 1,
-0.2864245, 1.723857, 0.2848847, 0, 1, 0.3764706, 1,
-0.2860912, 0.1268228, -0.3996101, 0, 1, 0.3803922, 1,
-0.2842946, -0.927152, -2.925717, 0, 1, 0.3882353, 1,
-0.2833594, 0.5934466, 1.27965, 0, 1, 0.3921569, 1,
-0.281977, -2.023413, -1.980999, 0, 1, 0.4, 1,
-0.2816876, -1.376599, -2.389741, 0, 1, 0.4078431, 1,
-0.2796718, -0.7110708, -2.309005, 0, 1, 0.4117647, 1,
-0.2784091, 0.8195776, 0.3448023, 0, 1, 0.4196078, 1,
-0.2749647, 1.801159, -0.188177, 0, 1, 0.4235294, 1,
-0.2737612, -1.669559, -3.825543, 0, 1, 0.4313726, 1,
-0.2730373, -0.5457544, -2.996418, 0, 1, 0.4352941, 1,
-0.2562578, -0.1549545, -3.717699, 0, 1, 0.4431373, 1,
-0.2510989, 1.266101, 0.764209, 0, 1, 0.4470588, 1,
-0.2507884, 0.4329413, -1.122901, 0, 1, 0.454902, 1,
-0.2482628, 1.07837, -0.2955937, 0, 1, 0.4588235, 1,
-0.2468248, -0.3636301, -2.11738, 0, 1, 0.4666667, 1,
-0.2463888, -0.97747, -4.812126, 0, 1, 0.4705882, 1,
-0.2394914, 2.091439, -1.876807, 0, 1, 0.4784314, 1,
-0.2371342, 0.5934393, -0.3250959, 0, 1, 0.4823529, 1,
-0.2359502, 1.667862, 0.134485, 0, 1, 0.4901961, 1,
-0.2334993, 1.532652, -0.2031156, 0, 1, 0.4941176, 1,
-0.2284566, 0.1239766, -1.540547, 0, 1, 0.5019608, 1,
-0.2272848, 0.9635937, 0.5408792, 0, 1, 0.509804, 1,
-0.2266845, -0.5525151, -3.754943, 0, 1, 0.5137255, 1,
-0.2219762, 0.2943088, -1.021701, 0, 1, 0.5215687, 1,
-0.219721, -0.3649426, -3.151378, 0, 1, 0.5254902, 1,
-0.2187559, -0.4649151, -3.592945, 0, 1, 0.5333334, 1,
-0.2171737, 0.4503345, 0.7949839, 0, 1, 0.5372549, 1,
-0.2143422, -0.2986119, -2.66135, 0, 1, 0.5450981, 1,
-0.2122906, 0.1395069, -0.1704459, 0, 1, 0.5490196, 1,
-0.212157, -0.2136874, -1.033153, 0, 1, 0.5568628, 1,
-0.2106208, -1.439473, -3.384274, 0, 1, 0.5607843, 1,
-0.2054707, -0.237181, -2.330134, 0, 1, 0.5686275, 1,
-0.2049073, 0.3282021, -2.098048, 0, 1, 0.572549, 1,
-0.2038752, -1.661156, -3.150121, 0, 1, 0.5803922, 1,
-0.1944323, -1.045171, -4.886703, 0, 1, 0.5843138, 1,
-0.192933, 0.1621879, -0.8698181, 0, 1, 0.5921569, 1,
-0.1915094, 0.4579612, -1.460747, 0, 1, 0.5960785, 1,
-0.1912652, 0.4575767, -0.3580318, 0, 1, 0.6039216, 1,
-0.1889266, 0.6336096, -0.5803353, 0, 1, 0.6117647, 1,
-0.1804412, -0.579005, -2.469683, 0, 1, 0.6156863, 1,
-0.1727775, -0.1063756, -1.052265, 0, 1, 0.6235294, 1,
-0.1706834, -1.469111, -2.210758, 0, 1, 0.627451, 1,
-0.1697745, -0.8081774, -3.056242, 0, 1, 0.6352941, 1,
-0.1674067, -0.1751284, -3.366371, 0, 1, 0.6392157, 1,
-0.1669552, 0.9221684, 0.1960316, 0, 1, 0.6470588, 1,
-0.1629652, -0.8326536, -3.563069, 0, 1, 0.6509804, 1,
-0.1610685, -1.022047, -2.010096, 0, 1, 0.6588235, 1,
-0.1598506, 0.841389, -1.109226, 0, 1, 0.6627451, 1,
-0.1591286, -0.7635352, -2.468773, 0, 1, 0.6705883, 1,
-0.1586947, -0.2352099, -1.502674, 0, 1, 0.6745098, 1,
-0.1571194, -0.8561174, -1.205201, 0, 1, 0.682353, 1,
-0.1569397, -0.06488726, -4.405581, 0, 1, 0.6862745, 1,
-0.1568051, -0.1783474, -1.217351, 0, 1, 0.6941177, 1,
-0.1510434, 1.13444, 0.6604416, 0, 1, 0.7019608, 1,
-0.1457757, -0.9407242, -3.978219, 0, 1, 0.7058824, 1,
-0.141819, 0.07131308, -0.1311614, 0, 1, 0.7137255, 1,
-0.1385834, -1.181062, -3.198776, 0, 1, 0.7176471, 1,
-0.135405, 0.2804548, 0.3879715, 0, 1, 0.7254902, 1,
-0.1323639, -0.9458624, -4.517241, 0, 1, 0.7294118, 1,
-0.1314859, -0.2077465, -0.8843107, 0, 1, 0.7372549, 1,
-0.1254629, -1.297065, -2.696084, 0, 1, 0.7411765, 1,
-0.1224945, 1.50659, -1.384918, 0, 1, 0.7490196, 1,
-0.1194951, -0.2141115, -3.3291, 0, 1, 0.7529412, 1,
-0.1193197, 1.478467, 0.8356602, 0, 1, 0.7607843, 1,
-0.1189156, 1.150937, -0.5881425, 0, 1, 0.7647059, 1,
-0.1180283, -0.3414164, -1.88679, 0, 1, 0.772549, 1,
-0.1172419, 0.8862852, 1.599701, 0, 1, 0.7764706, 1,
-0.1146604, -0.4136804, -1.554252, 0, 1, 0.7843137, 1,
-0.1103998, -0.7333708, -2.596332, 0, 1, 0.7882353, 1,
-0.1092666, 0.02941603, 0.08828083, 0, 1, 0.7960784, 1,
-0.107073, -2.555592, -2.508458, 0, 1, 0.8039216, 1,
-0.1043749, 1.482753, -1.67942, 0, 1, 0.8078431, 1,
-0.1035662, 0.9904509, -0.171581, 0, 1, 0.8156863, 1,
-0.09697299, 0.3116342, 0.3315045, 0, 1, 0.8196079, 1,
-0.07646837, 0.7355404, 0.6405363, 0, 1, 0.827451, 1,
-0.07121358, -0.1169425, -4.640514, 0, 1, 0.8313726, 1,
-0.07112816, -0.615312, -3.146533, 0, 1, 0.8392157, 1,
-0.06788046, 0.4371779, 0.4471972, 0, 1, 0.8431373, 1,
-0.06688912, 1.647334, 0.08707529, 0, 1, 0.8509804, 1,
-0.06472707, -0.9309689, -2.876036, 0, 1, 0.854902, 1,
-0.06218822, -1.019783, -3.522894, 0, 1, 0.8627451, 1,
-0.06194589, -0.4537022, -2.369366, 0, 1, 0.8666667, 1,
-0.06171269, 0.5394917, 0.517303, 0, 1, 0.8745098, 1,
-0.05956113, -0.7607409, -4.176927, 0, 1, 0.8784314, 1,
-0.05889817, -1.594025, -3.91857, 0, 1, 0.8862745, 1,
-0.04920489, -0.8931808, -4.647697, 0, 1, 0.8901961, 1,
-0.0478874, -1.577125, -2.884374, 0, 1, 0.8980392, 1,
-0.04675302, 0.2075868, -1.20274, 0, 1, 0.9058824, 1,
-0.04601894, -0.138123, -1.48484, 0, 1, 0.9098039, 1,
-0.04566984, -0.6063011, -1.57194, 0, 1, 0.9176471, 1,
-0.04512879, -0.4662018, -1.228131, 0, 1, 0.9215686, 1,
-0.04512418, 0.684431, -0.6853477, 0, 1, 0.9294118, 1,
-0.04002523, 0.2480163, -0.9686746, 0, 1, 0.9333333, 1,
-0.03565086, -0.5625953, -2.061049, 0, 1, 0.9411765, 1,
-0.03499725, -0.2319138, -2.945946, 0, 1, 0.945098, 1,
-0.03256378, -0.1041678, -3.464969, 0, 1, 0.9529412, 1,
-0.02854487, -0.1846916, -3.498628, 0, 1, 0.9568627, 1,
-0.02773794, 0.1948973, 0.56206, 0, 1, 0.9647059, 1,
-0.02597599, 0.4785096, -0.105541, 0, 1, 0.9686275, 1,
-0.02467384, 0.45154, -1.890177, 0, 1, 0.9764706, 1,
-0.02330149, 0.7778585, 0.4145119, 0, 1, 0.9803922, 1,
-0.02243816, 0.5896648, -0.9232716, 0, 1, 0.9882353, 1,
-0.02049522, 0.3837705, -0.1946578, 0, 1, 0.9921569, 1,
-0.01900673, 1.600202, 1.172263, 0, 1, 1, 1,
-0.01818409, 1.303762, 1.027205, 0, 0.9921569, 1, 1,
-0.01809186, 0.357922, 0.1640776, 0, 0.9882353, 1, 1,
-0.01710592, 1.607745, -0.001135495, 0, 0.9803922, 1, 1,
-0.01517632, 0.2359851, -0.04226124, 0, 0.9764706, 1, 1,
-0.01513581, -1.595168, -0.4249246, 0, 0.9686275, 1, 1,
-0.01454018, 0.1147467, -2.473439, 0, 0.9647059, 1, 1,
-0.01184748, -0.9280835, -4.143723, 0, 0.9568627, 1, 1,
-0.01140004, 1.250536, 2.190013, 0, 0.9529412, 1, 1,
-0.008640634, -0.39984, -2.859524, 0, 0.945098, 1, 1,
-0.005009796, 0.1761615, -1.031986, 0, 0.9411765, 1, 1,
-0.002054557, 1.790362, 0.8104531, 0, 0.9333333, 1, 1,
-0.001925599, -2.457199, -3.570354, 0, 0.9294118, 1, 1,
0.005219841, 0.1341769, 1.647942, 0, 0.9215686, 1, 1,
0.005965018, -0.4188862, 2.568183, 0, 0.9176471, 1, 1,
0.007288653, 1.664528, -1.179962, 0, 0.9098039, 1, 1,
0.00881014, -0.2655323, 3.286107, 0, 0.9058824, 1, 1,
0.01050522, -1.289351, 3.12705, 0, 0.8980392, 1, 1,
0.01171978, -0.2240671, 2.205857, 0, 0.8901961, 1, 1,
0.01743993, -0.8920178, 1.517075, 0, 0.8862745, 1, 1,
0.01852492, -2.414875, 3.527655, 0, 0.8784314, 1, 1,
0.0228995, -0.5123981, 3.223125, 0, 0.8745098, 1, 1,
0.02570097, 0.749841, 0.2239458, 0, 0.8666667, 1, 1,
0.02932234, -1.326213, 3.444124, 0, 0.8627451, 1, 1,
0.03225975, 0.4225388, 0.4812333, 0, 0.854902, 1, 1,
0.03381793, 0.5825319, 0.3808169, 0, 0.8509804, 1, 1,
0.03474132, -1.180415, 4.150381, 0, 0.8431373, 1, 1,
0.0373235, 0.6282161, -0.9119029, 0, 0.8392157, 1, 1,
0.03897057, 0.1079929, 0.7961362, 0, 0.8313726, 1, 1,
0.04088789, 1.914029, 0.3432914, 0, 0.827451, 1, 1,
0.04101282, 0.2652508, -1.649157, 0, 0.8196079, 1, 1,
0.04151283, 0.3579397, 0.2556118, 0, 0.8156863, 1, 1,
0.04250945, 1.407692, -0.5807276, 0, 0.8078431, 1, 1,
0.04339554, 0.03636441, 0.7924708, 0, 0.8039216, 1, 1,
0.05334926, -1.539694, 4.038175, 0, 0.7960784, 1, 1,
0.05606418, 0.0379637, 1.196393, 0, 0.7882353, 1, 1,
0.05717805, 0.7711472, -0.1382294, 0, 0.7843137, 1, 1,
0.06126211, -0.3046097, 3.922708, 0, 0.7764706, 1, 1,
0.0640549, -0.1377643, 3.336249, 0, 0.772549, 1, 1,
0.06515704, 1.215943, 1.084639, 0, 0.7647059, 1, 1,
0.06521738, 1.143877, -0.3413657, 0, 0.7607843, 1, 1,
0.06529245, 0.01897713, 2.135909, 0, 0.7529412, 1, 1,
0.06990301, -0.7488828, 3.542891, 0, 0.7490196, 1, 1,
0.07175568, 2.477248, -0.861406, 0, 0.7411765, 1, 1,
0.07206726, 0.7031366, 0.1147652, 0, 0.7372549, 1, 1,
0.07233356, 1.520776, -0.9442248, 0, 0.7294118, 1, 1,
0.0725342, 0.9250872, -0.3994251, 0, 0.7254902, 1, 1,
0.07592902, 0.7669051, 0.8708597, 0, 0.7176471, 1, 1,
0.07669, -0.2658439, 1.209649, 0, 0.7137255, 1, 1,
0.0768633, -0.5784019, 2.251155, 0, 0.7058824, 1, 1,
0.07879289, -1.151953, 2.348937, 0, 0.6980392, 1, 1,
0.08536838, -0.6934162, 3.422376, 0, 0.6941177, 1, 1,
0.09130854, 1.533376, -0.05313202, 0, 0.6862745, 1, 1,
0.09898421, 0.6246809, 1.274688, 0, 0.682353, 1, 1,
0.1065382, -2.951018, 3.166655, 0, 0.6745098, 1, 1,
0.10842, -0.4512312, 4.138173, 0, 0.6705883, 1, 1,
0.1106771, -1.309609, 4.40557, 0, 0.6627451, 1, 1,
0.1118374, 0.2110809, -0.3008783, 0, 0.6588235, 1, 1,
0.1124746, -2.027631, 4.463575, 0, 0.6509804, 1, 1,
0.1128216, -0.2473166, 3.209751, 0, 0.6470588, 1, 1,
0.1143202, 0.4082312, 0.1120787, 0, 0.6392157, 1, 1,
0.1171467, -0.07631668, 0.2325856, 0, 0.6352941, 1, 1,
0.1184936, -1.080158, 3.585362, 0, 0.627451, 1, 1,
0.118789, 1.287718, 0.7447917, 0, 0.6235294, 1, 1,
0.119418, 0.756074, 0.8512708, 0, 0.6156863, 1, 1,
0.1241079, -0.3147948, 3.14747, 0, 0.6117647, 1, 1,
0.1326108, 0.4397015, -0.2347434, 0, 0.6039216, 1, 1,
0.1339883, -0.2599561, 4.632238, 0, 0.5960785, 1, 1,
0.1405652, 0.9178979, -0.9977881, 0, 0.5921569, 1, 1,
0.1423124, 0.487522, 1.017408, 0, 0.5843138, 1, 1,
0.1424333, 2.039765, -2.317443, 0, 0.5803922, 1, 1,
0.1448561, 0.9445476, 0.1779897, 0, 0.572549, 1, 1,
0.1567985, -1.520614, 2.360271, 0, 0.5686275, 1, 1,
0.1570399, 2.345828, 0.1934763, 0, 0.5607843, 1, 1,
0.1599887, -0.7402879, 2.369727, 0, 0.5568628, 1, 1,
0.1611507, -0.1686838, 2.841134, 0, 0.5490196, 1, 1,
0.1620775, -0.7131305, 3.533243, 0, 0.5450981, 1, 1,
0.1642024, -0.1901285, 1.53626, 0, 0.5372549, 1, 1,
0.1702961, -2.646228, 3.284318, 0, 0.5333334, 1, 1,
0.1779642, 0.6785392, 1.446097, 0, 0.5254902, 1, 1,
0.1821118, 0.58755, 1.579817, 0, 0.5215687, 1, 1,
0.1831502, -1.995177, 5.254303, 0, 0.5137255, 1, 1,
0.1845742, 0.8014663, 0.5364529, 0, 0.509804, 1, 1,
0.1896521, -2.315222, 2.65883, 0, 0.5019608, 1, 1,
0.1971615, -2.155854, 1.751305, 0, 0.4941176, 1, 1,
0.1982237, 2.10288, -1.411533, 0, 0.4901961, 1, 1,
0.1998985, 1.287509, 0.235927, 0, 0.4823529, 1, 1,
0.2046333, -0.7423883, 2.718439, 0, 0.4784314, 1, 1,
0.2078761, 0.1836127, 0.3736407, 0, 0.4705882, 1, 1,
0.2109884, -0.7266928, 2.252298, 0, 0.4666667, 1, 1,
0.2160147, 0.7882675, -1.436622, 0, 0.4588235, 1, 1,
0.2160951, -0.9237359, 4.311505, 0, 0.454902, 1, 1,
0.2200331, 2.082787, -0.1911494, 0, 0.4470588, 1, 1,
0.2211244, -0.8402715, 4.105726, 0, 0.4431373, 1, 1,
0.2230252, 1.528949, 0.5592555, 0, 0.4352941, 1, 1,
0.2230834, -2.163076, 2.924799, 0, 0.4313726, 1, 1,
0.2240617, 0.8748463, -0.1641693, 0, 0.4235294, 1, 1,
0.2305227, 1.302244, -0.0983207, 0, 0.4196078, 1, 1,
0.2315673, -0.0719498, 3.112337, 0, 0.4117647, 1, 1,
0.2323405, 0.9220222, 1.214075, 0, 0.4078431, 1, 1,
0.2387971, 0.07683419, 2.507253, 0, 0.4, 1, 1,
0.2419541, -0.03803162, 1.237776, 0, 0.3921569, 1, 1,
0.2469128, 0.7729872, -0.6267266, 0, 0.3882353, 1, 1,
0.2469336, 0.8406549, -0.2921307, 0, 0.3803922, 1, 1,
0.2522475, 0.4162655, -1.817882, 0, 0.3764706, 1, 1,
0.2541595, -0.7942498, 2.387416, 0, 0.3686275, 1, 1,
0.2545893, 0.5340987, 0.3558722, 0, 0.3647059, 1, 1,
0.2559514, 0.4402602, -0.272372, 0, 0.3568628, 1, 1,
0.2559949, 1.884133, -0.2696122, 0, 0.3529412, 1, 1,
0.2593845, 1.021298, -0.1040318, 0, 0.345098, 1, 1,
0.2616459, 0.1657604, 1.519864, 0, 0.3411765, 1, 1,
0.2636491, -1.506003, 2.552104, 0, 0.3333333, 1, 1,
0.2661363, -1.525862, 1.817217, 0, 0.3294118, 1, 1,
0.2673725, 1.933769, -1.303529, 0, 0.3215686, 1, 1,
0.2700379, -0.01652677, 3.91914, 0, 0.3176471, 1, 1,
0.270453, -0.2862814, 1.913371, 0, 0.3098039, 1, 1,
0.2740422, 0.03615616, 1.043774, 0, 0.3058824, 1, 1,
0.2771599, 0.8488435, 1.155213, 0, 0.2980392, 1, 1,
0.2798322, -0.43504, 2.017422, 0, 0.2901961, 1, 1,
0.2801815, 0.86628, 1.208774, 0, 0.2862745, 1, 1,
0.2827677, -0.09221862, 1.760972, 0, 0.2784314, 1, 1,
0.2932, 0.2609026, 0.5076424, 0, 0.2745098, 1, 1,
0.2943527, -1.952693, 3.323831, 0, 0.2666667, 1, 1,
0.2979818, 1.433218, -1.571955, 0, 0.2627451, 1, 1,
0.3035389, -0.6694102, 1.79632, 0, 0.254902, 1, 1,
0.305076, -0.7043648, 3.040176, 0, 0.2509804, 1, 1,
0.3089318, 1.925926, 1.531662, 0, 0.2431373, 1, 1,
0.3152718, 1.434186, 0.1703115, 0, 0.2392157, 1, 1,
0.3197415, -0.4990682, 1.282156, 0, 0.2313726, 1, 1,
0.3209387, 0.8552402, 0.8778793, 0, 0.227451, 1, 1,
0.3223812, -0.6566699, 4.467884, 0, 0.2196078, 1, 1,
0.3224507, -1.47775, 2.745362, 0, 0.2156863, 1, 1,
0.3264216, -0.7429022, 3.40848, 0, 0.2078431, 1, 1,
0.3277823, -0.7387278, 5.437767, 0, 0.2039216, 1, 1,
0.3285015, -0.8746226, 1.753957, 0, 0.1960784, 1, 1,
0.3290134, -1.642995, 3.523253, 0, 0.1882353, 1, 1,
0.3298432, -1.885194, 0.1887683, 0, 0.1843137, 1, 1,
0.3302766, -0.4662893, 3.473333, 0, 0.1764706, 1, 1,
0.3303353, 0.3588102, 1.831465, 0, 0.172549, 1, 1,
0.3396287, 0.05808114, 0.07863819, 0, 0.1647059, 1, 1,
0.3432688, 1.423193, 0.0259737, 0, 0.1607843, 1, 1,
0.3617576, -0.867124, 2.718108, 0, 0.1529412, 1, 1,
0.3641015, -1.413668, 2.65095, 0, 0.1490196, 1, 1,
0.3665552, -0.1087483, 2.431127, 0, 0.1411765, 1, 1,
0.368132, -0.5349358, 2.746618, 0, 0.1372549, 1, 1,
0.3685336, -2.074801, 2.167952, 0, 0.1294118, 1, 1,
0.3719506, -0.4016951, 1.481813, 0, 0.1254902, 1, 1,
0.3867275, -0.9093019, 2.908592, 0, 0.1176471, 1, 1,
0.3910325, 1.217705, -0.4048278, 0, 0.1137255, 1, 1,
0.3940696, 0.792657, 1.447527, 0, 0.1058824, 1, 1,
0.3943036, -1.766282, 2.710157, 0, 0.09803922, 1, 1,
0.3985206, 1.17766, 1.237482, 0, 0.09411765, 1, 1,
0.4023565, -0.66663, 2.21156, 0, 0.08627451, 1, 1,
0.4077511, 0.9830474, 1.744589, 0, 0.08235294, 1, 1,
0.4097243, -0.7161544, 2.591521, 0, 0.07450981, 1, 1,
0.4107833, -0.01601781, 3.251489, 0, 0.07058824, 1, 1,
0.4126512, -0.08599895, 1.771919, 0, 0.0627451, 1, 1,
0.4144449, 2.185625, -0.3113493, 0, 0.05882353, 1, 1,
0.4148022, -0.3471091, 2.403028, 0, 0.05098039, 1, 1,
0.4160863, -1.513128, 1.345266, 0, 0.04705882, 1, 1,
0.4172342, 0.9899937, 0.2540666, 0, 0.03921569, 1, 1,
0.4211444, -0.05218528, 2.288366, 0, 0.03529412, 1, 1,
0.4211687, 0.3374465, 2.264907, 0, 0.02745098, 1, 1,
0.4234109, -0.6432693, 2.408479, 0, 0.02352941, 1, 1,
0.4258207, 0.2811401, 1.406332, 0, 0.01568628, 1, 1,
0.4270945, -0.9601843, 0.8768993, 0, 0.01176471, 1, 1,
0.4312876, 0.9092079, -1.017315, 0, 0.003921569, 1, 1,
0.4317932, 0.03816422, 2.112321, 0.003921569, 0, 1, 1,
0.4333856, -0.5790223, 1.085743, 0.007843138, 0, 1, 1,
0.4347992, 0.306909, 1.013594, 0.01568628, 0, 1, 1,
0.4385811, -0.1332866, 0.6816078, 0.01960784, 0, 1, 1,
0.4404316, -0.4449364, 3.307756, 0.02745098, 0, 1, 1,
0.4463919, -0.07343284, 2.021128, 0.03137255, 0, 1, 1,
0.4499359, -0.06479562, 1.491128, 0.03921569, 0, 1, 1,
0.450113, 1.375221, 2.584111, 0.04313726, 0, 1, 1,
0.4529385, -1.614915, 3.607476, 0.05098039, 0, 1, 1,
0.4648435, 0.5227427, 1.887632, 0.05490196, 0, 1, 1,
0.4666294, -0.1661828, 2.427532, 0.0627451, 0, 1, 1,
0.4668749, 0.7760611, 1.345492, 0.06666667, 0, 1, 1,
0.4720496, -1.210863, 5.065521, 0.07450981, 0, 1, 1,
0.4721316, -0.2056295, 2.25736, 0.07843138, 0, 1, 1,
0.4721709, -0.05291699, 1.474782, 0.08627451, 0, 1, 1,
0.4823979, -1.530348, 1.501292, 0.09019608, 0, 1, 1,
0.485072, -0.1490263, 1.941861, 0.09803922, 0, 1, 1,
0.488332, 0.3806257, 1.338659, 0.1058824, 0, 1, 1,
0.489633, -0.1469285, 1.131968, 0.1098039, 0, 1, 1,
0.5040718, 0.3056401, 0.6960607, 0.1176471, 0, 1, 1,
0.5110842, 0.4516467, 0.6106995, 0.1215686, 0, 1, 1,
0.5114406, 0.807259, 0.5894032, 0.1294118, 0, 1, 1,
0.5116162, -1.505575, 2.652875, 0.1333333, 0, 1, 1,
0.5118505, -0.05839338, 2.047683, 0.1411765, 0, 1, 1,
0.5170884, -0.04388371, -0.9750642, 0.145098, 0, 1, 1,
0.5199414, -1.289808, 4.12479, 0.1529412, 0, 1, 1,
0.5250444, 0.5401877, 1.662085, 0.1568628, 0, 1, 1,
0.5256504, -1.866573, 2.101559, 0.1647059, 0, 1, 1,
0.5339676, 0.5570696, -0.1507731, 0.1686275, 0, 1, 1,
0.5362312, 0.1037195, 2.033795, 0.1764706, 0, 1, 1,
0.5374838, -1.243706, 2.445364, 0.1803922, 0, 1, 1,
0.5383729, 0.9067083, 1.345339, 0.1882353, 0, 1, 1,
0.5384588, -0.4223252, 0.1580184, 0.1921569, 0, 1, 1,
0.5398735, 1.044388, -1.996268, 0.2, 0, 1, 1,
0.5407015, 2.336925, -1.068481, 0.2078431, 0, 1, 1,
0.5410339, -0.4693695, 1.065823, 0.2117647, 0, 1, 1,
0.5435717, -0.4616428, 2.633822, 0.2196078, 0, 1, 1,
0.5472349, -1.243334, 1.936596, 0.2235294, 0, 1, 1,
0.5558546, 0.8025692, 0.1522599, 0.2313726, 0, 1, 1,
0.5565057, 0.2624761, 2.104656, 0.2352941, 0, 1, 1,
0.5565492, -0.8877043, 2.843467, 0.2431373, 0, 1, 1,
0.5573719, 0.9284949, 0.3848473, 0.2470588, 0, 1, 1,
0.5613086, -2.520324, 3.764776, 0.254902, 0, 1, 1,
0.5626951, -0.3967071, 2.834665, 0.2588235, 0, 1, 1,
0.5636913, -0.8566939, 3.932065, 0.2666667, 0, 1, 1,
0.5646833, 0.02648865, 2.150996, 0.2705882, 0, 1, 1,
0.5647954, 1.105254, 0.2481716, 0.2784314, 0, 1, 1,
0.5662581, 0.09592788, 0.6641319, 0.282353, 0, 1, 1,
0.5675498, -0.3345472, 2.881854, 0.2901961, 0, 1, 1,
0.5696896, 0.7512551, 0.4271841, 0.2941177, 0, 1, 1,
0.5735285, -1.182121, 2.161277, 0.3019608, 0, 1, 1,
0.5775825, -0.1517901, 3.417165, 0.3098039, 0, 1, 1,
0.5792601, -1.859162, 4.328824, 0.3137255, 0, 1, 1,
0.591973, 1.277594, 1.291038, 0.3215686, 0, 1, 1,
0.5954693, 0.2937106, -0.6648222, 0.3254902, 0, 1, 1,
0.5958096, 2.057444, -0.1944722, 0.3333333, 0, 1, 1,
0.5988935, -0.136523, 2.11333, 0.3372549, 0, 1, 1,
0.5994947, 0.6061761, 0.4212488, 0.345098, 0, 1, 1,
0.6013869, -1.033628, 2.810131, 0.3490196, 0, 1, 1,
0.601728, 1.638985, 2.485004, 0.3568628, 0, 1, 1,
0.6050361, 1.356997, -0.3822483, 0.3607843, 0, 1, 1,
0.6073679, -0.172599, 2.814085, 0.3686275, 0, 1, 1,
0.6129479, 2.756202, -0.7493721, 0.372549, 0, 1, 1,
0.6272779, 1.410652, 0.271916, 0.3803922, 0, 1, 1,
0.6283771, -1.130129, 1.726905, 0.3843137, 0, 1, 1,
0.6284062, 0.5673745, 0.6056152, 0.3921569, 0, 1, 1,
0.6342971, 1.599519, 0.6521383, 0.3960784, 0, 1, 1,
0.638981, -1.416178, 0.988947, 0.4039216, 0, 1, 1,
0.640039, 0.6011054, -1.097502, 0.4117647, 0, 1, 1,
0.6448128, -0.1483638, 0.901899, 0.4156863, 0, 1, 1,
0.6478854, -1.158873, 2.417567, 0.4235294, 0, 1, 1,
0.6502782, 1.231181, 0.7240567, 0.427451, 0, 1, 1,
0.6530676, -0.5545372, 1.701342, 0.4352941, 0, 1, 1,
0.6582341, 0.9421801, 1.404151, 0.4392157, 0, 1, 1,
0.6613518, -0.9398219, 3.309549, 0.4470588, 0, 1, 1,
0.6627787, -0.01218651, -0.1371109, 0.4509804, 0, 1, 1,
0.6645693, -0.6008762, 1.806325, 0.4588235, 0, 1, 1,
0.6669724, 1.571773, -0.6591848, 0.4627451, 0, 1, 1,
0.6712386, 0.8663939, 0.009394684, 0.4705882, 0, 1, 1,
0.6758017, -0.4603091, 2.661979, 0.4745098, 0, 1, 1,
0.6822643, 1.090634, -1.356293, 0.4823529, 0, 1, 1,
0.6835964, 0.2154918, 1.666479, 0.4862745, 0, 1, 1,
0.6840245, 0.9394116, 0.8055741, 0.4941176, 0, 1, 1,
0.691257, 0.368604, 1.12532, 0.5019608, 0, 1, 1,
0.6916581, -0.1298676, 0.9817383, 0.5058824, 0, 1, 1,
0.693131, -0.499468, 2.674968, 0.5137255, 0, 1, 1,
0.6954488, 0.123863, 0.377334, 0.5176471, 0, 1, 1,
0.6997023, -0.5572084, 1.437231, 0.5254902, 0, 1, 1,
0.7009171, 2.317236, 0.8480343, 0.5294118, 0, 1, 1,
0.7105014, -0.4984028, 1.858644, 0.5372549, 0, 1, 1,
0.7197827, 0.4132397, 1.722003, 0.5411765, 0, 1, 1,
0.7268298, -1.396035, 1.697078, 0.5490196, 0, 1, 1,
0.7353429, 1.050432, 0.9582372, 0.5529412, 0, 1, 1,
0.737118, 0.4437923, 0.7104446, 0.5607843, 0, 1, 1,
0.7391958, 0.5274965, 1.872875, 0.5647059, 0, 1, 1,
0.7412571, 1.287748, 0.01195896, 0.572549, 0, 1, 1,
0.7427714, 2.095675, 1.433935, 0.5764706, 0, 1, 1,
0.7462965, -0.05922973, 0.298957, 0.5843138, 0, 1, 1,
0.7474513, -0.9015945, 2.590454, 0.5882353, 0, 1, 1,
0.7485788, -1.075593, 2.859377, 0.5960785, 0, 1, 1,
0.7514902, 0.6241602, 2.357021, 0.6039216, 0, 1, 1,
0.759491, 0.8803323, -0.5084971, 0.6078432, 0, 1, 1,
0.7598227, -0.827792, 2.926358, 0.6156863, 0, 1, 1,
0.7612312, -0.1218779, 1.129579, 0.6196079, 0, 1, 1,
0.7615724, 0.4226219, 2.473679, 0.627451, 0, 1, 1,
0.7620391, 0.6328744, 0.1506866, 0.6313726, 0, 1, 1,
0.7648773, 0.5008421, -1.281526, 0.6392157, 0, 1, 1,
0.7709692, 1.448041, 0.3982637, 0.6431373, 0, 1, 1,
0.7728457, 1.530207, 0.7099063, 0.6509804, 0, 1, 1,
0.7771302, 1.526807, 0.06160503, 0.654902, 0, 1, 1,
0.7773958, 0.1395111, -0.1864126, 0.6627451, 0, 1, 1,
0.779044, -0.2121115, 0.26616, 0.6666667, 0, 1, 1,
0.7793454, -1.208297, 1.917789, 0.6745098, 0, 1, 1,
0.781315, -2.206701, 3.127644, 0.6784314, 0, 1, 1,
0.786186, 0.79332, 1.299181, 0.6862745, 0, 1, 1,
0.7868531, 1.084977, 2.283014, 0.6901961, 0, 1, 1,
0.7933896, -0.07347778, 0.9555504, 0.6980392, 0, 1, 1,
0.7969172, -0.3186549, 0.5284342, 0.7058824, 0, 1, 1,
0.7971182, 0.8217927, 0.6907615, 0.7098039, 0, 1, 1,
0.8016164, 0.2453994, 1.41179, 0.7176471, 0, 1, 1,
0.8182337, 1.358491, 0.1885059, 0.7215686, 0, 1, 1,
0.8241105, -1.071371, 1.516317, 0.7294118, 0, 1, 1,
0.8263731, 1.496432, 1.402308, 0.7333333, 0, 1, 1,
0.8274071, -1.942971, 1.937496, 0.7411765, 0, 1, 1,
0.8293713, -0.7910115, 2.143857, 0.7450981, 0, 1, 1,
0.8312404, -0.9297061, 0.382766, 0.7529412, 0, 1, 1,
0.8407096, -0.122473, 1.385733, 0.7568628, 0, 1, 1,
0.8409469, 0.1692414, 0.7667441, 0.7647059, 0, 1, 1,
0.8416046, 0.8369778, 2.629748, 0.7686275, 0, 1, 1,
0.8425295, -0.4371818, 4.032231, 0.7764706, 0, 1, 1,
0.8499876, 0.3063093, 0.4411236, 0.7803922, 0, 1, 1,
0.8530381, -0.4209919, 2.222933, 0.7882353, 0, 1, 1,
0.8547161, -0.07011607, 1.478726, 0.7921569, 0, 1, 1,
0.8569409, 0.7034194, -0.8925387, 0.8, 0, 1, 1,
0.8579999, -0.9450002, 1.27961, 0.8078431, 0, 1, 1,
0.8614636, -0.07828284, 1.074249, 0.8117647, 0, 1, 1,
0.8742539, -0.5939813, 1.639932, 0.8196079, 0, 1, 1,
0.8817407, -0.330217, 1.801573, 0.8235294, 0, 1, 1,
0.8821969, 1.14851, 0.2061796, 0.8313726, 0, 1, 1,
0.8841012, -0.4864464, 3.520918, 0.8352941, 0, 1, 1,
0.8843153, 0.2518708, 2.466311, 0.8431373, 0, 1, 1,
0.8882046, -0.4729163, 0.7263476, 0.8470588, 0, 1, 1,
0.8935354, -1.978703, 1.998667, 0.854902, 0, 1, 1,
0.894974, -1.406387, 2.68162, 0.8588235, 0, 1, 1,
0.9011677, 0.7682074, 0.03429396, 0.8666667, 0, 1, 1,
0.9025885, 1.97356, -0.2361455, 0.8705882, 0, 1, 1,
0.9056023, 0.5811348, 0.4108019, 0.8784314, 0, 1, 1,
0.9056953, -0.7212964, 2.758514, 0.8823529, 0, 1, 1,
0.9070917, 1.177298, 0.650974, 0.8901961, 0, 1, 1,
0.911651, -0.6758277, 1.011019, 0.8941177, 0, 1, 1,
0.9165508, -0.3996602, 2.751538, 0.9019608, 0, 1, 1,
0.9173326, 0.1680186, 0.6922168, 0.9098039, 0, 1, 1,
0.9183092, 0.4591755, 0.9410381, 0.9137255, 0, 1, 1,
0.9228238, -0.3470159, 2.354817, 0.9215686, 0, 1, 1,
0.9292148, 0.0590116, 2.117162, 0.9254902, 0, 1, 1,
0.9379026, 0.2322669, 2.360811, 0.9333333, 0, 1, 1,
0.9438808, 0.4975974, 0.09582411, 0.9372549, 0, 1, 1,
0.9541163, -0.4777818, 2.076301, 0.945098, 0, 1, 1,
0.9558024, 1.326436, 0.9398708, 0.9490196, 0, 1, 1,
0.9601604, -0.09200551, 0.8764245, 0.9568627, 0, 1, 1,
0.9611161, -1.442823, 1.407033, 0.9607843, 0, 1, 1,
0.9628637, -0.2836287, 2.327368, 0.9686275, 0, 1, 1,
0.964689, -0.9988229, 1.958621, 0.972549, 0, 1, 1,
0.967954, 0.6749977, 1.786049, 0.9803922, 0, 1, 1,
0.9712422, 1.036675, 1.411975, 0.9843137, 0, 1, 1,
0.986016, -0.1597073, 1.71265, 0.9921569, 0, 1, 1,
0.9893836, 0.4793924, 0.7671652, 0.9960784, 0, 1, 1,
0.9978901, 0.8111345, 1.380037, 1, 0, 0.9960784, 1,
0.9997057, -2.198891, 5.195041, 1, 0, 0.9882353, 1,
1.00084, 0.5034566, 1.478698, 1, 0, 0.9843137, 1,
1.006252, 0.1331102, 1.612308, 1, 0, 0.9764706, 1,
1.006875, -0.4385081, 2.321778, 1, 0, 0.972549, 1,
1.008365, 0.398039, 0.1848981, 1, 0, 0.9647059, 1,
1.016118, 0.7101279, 0.4100398, 1, 0, 0.9607843, 1,
1.01903, -0.179809, 0.6031891, 1, 0, 0.9529412, 1,
1.027696, -0.9725139, 2.412558, 1, 0, 0.9490196, 1,
1.028016, 0.3863507, -0.6833154, 1, 0, 0.9411765, 1,
1.033336, -0.3232514, 1.513206, 1, 0, 0.9372549, 1,
1.036693, 0.2567857, 0.08709348, 1, 0, 0.9294118, 1,
1.040002, -1.190216, 0.8919111, 1, 0, 0.9254902, 1,
1.04209, -0.7132717, 2.199455, 1, 0, 0.9176471, 1,
1.044085, 1.328009, 0.87888, 1, 0, 0.9137255, 1,
1.045964, 0.9301889, 1.908779, 1, 0, 0.9058824, 1,
1.061933, 0.8643523, 0.1101534, 1, 0, 0.9019608, 1,
1.064049, -0.175414, 1.197476, 1, 0, 0.8941177, 1,
1.0652, 0.3172202, 1.907503, 1, 0, 0.8862745, 1,
1.066323, 0.150602, 2.90887, 1, 0, 0.8823529, 1,
1.066719, 0.1725204, 1.809761, 1, 0, 0.8745098, 1,
1.072248, -0.9587958, 3.922535, 1, 0, 0.8705882, 1,
1.074585, -0.2567298, 3.560167, 1, 0, 0.8627451, 1,
1.080696, -1.019581, 3.825198, 1, 0, 0.8588235, 1,
1.092, -0.999054, 3.965695, 1, 0, 0.8509804, 1,
1.097591, 0.7212584, -0.8286271, 1, 0, 0.8470588, 1,
1.101952, 0.4639186, 1.106683, 1, 0, 0.8392157, 1,
1.10944, -1.163699, 2.301241, 1, 0, 0.8352941, 1,
1.123821, 0.2609274, 0.4004195, 1, 0, 0.827451, 1,
1.135088, 0.8368688, -0.2130831, 1, 0, 0.8235294, 1,
1.145659, 1.566162, -0.1765281, 1, 0, 0.8156863, 1,
1.147592, 0.5095688, 3.43971, 1, 0, 0.8117647, 1,
1.148691, -1.052923, 2.342398, 1, 0, 0.8039216, 1,
1.150767, -0.6839383, 3.731641, 1, 0, 0.7960784, 1,
1.158884, -0.639034, 1.674, 1, 0, 0.7921569, 1,
1.164671, 0.2011179, 0.496502, 1, 0, 0.7843137, 1,
1.176973, 0.1058559, 1.124461, 1, 0, 0.7803922, 1,
1.178532, 0.7800758, 1.229469, 1, 0, 0.772549, 1,
1.185122, 0.773735, 1.070773, 1, 0, 0.7686275, 1,
1.193921, 1.291074, 0.1975085, 1, 0, 0.7607843, 1,
1.207705, -0.4397088, 1.683764, 1, 0, 0.7568628, 1,
1.210825, 0.5457906, 2.092978, 1, 0, 0.7490196, 1,
1.211667, 0.6897914, -1.240525, 1, 0, 0.7450981, 1,
1.218057, -0.3165454, 0.8225026, 1, 0, 0.7372549, 1,
1.219507, 0.2369794, -0.01267446, 1, 0, 0.7333333, 1,
1.238126, 0.3840101, 0.4578047, 1, 0, 0.7254902, 1,
1.238293, 1.080274, 1.848599, 1, 0, 0.7215686, 1,
1.242911, -1.81968, 3.354446, 1, 0, 0.7137255, 1,
1.270879, 0.7596731, -1.496538, 1, 0, 0.7098039, 1,
1.274527, -1.564609, 3.917748, 1, 0, 0.7019608, 1,
1.277319, 0.3373536, 1.922237, 1, 0, 0.6941177, 1,
1.283974, -0.1322344, 1.183575, 1, 0, 0.6901961, 1,
1.285407, -0.3013755, 1.448119, 1, 0, 0.682353, 1,
1.287258, -0.4248671, 0.6553717, 1, 0, 0.6784314, 1,
1.303772, 0.2845297, -0.08507617, 1, 0, 0.6705883, 1,
1.314782, -0.9989427, 1.078779, 1, 0, 0.6666667, 1,
1.315631, -1.551661, 2.762284, 1, 0, 0.6588235, 1,
1.319519, -2.208275, 2.495281, 1, 0, 0.654902, 1,
1.319846, -0.8400229, 1.463825, 1, 0, 0.6470588, 1,
1.327209, 0.04347025, -0.2813996, 1, 0, 0.6431373, 1,
1.327635, -0.5061836, 0.5756361, 1, 0, 0.6352941, 1,
1.327902, -0.1542737, 2.751554, 1, 0, 0.6313726, 1,
1.328254, 1.906412, -0.3533789, 1, 0, 0.6235294, 1,
1.335965, -0.3337576, 0.8855545, 1, 0, 0.6196079, 1,
1.339452, 0.4478841, 1.308274, 1, 0, 0.6117647, 1,
1.339585, 0.05232873, -0.02482373, 1, 0, 0.6078432, 1,
1.350173, -1.104828, 2.945898, 1, 0, 0.6, 1,
1.355681, -2.362359, 2.701423, 1, 0, 0.5921569, 1,
1.362917, -1.574882, 1.481505, 1, 0, 0.5882353, 1,
1.38197, 1.088259, 0.3281144, 1, 0, 0.5803922, 1,
1.382363, -0.4365241, -1.336277, 1, 0, 0.5764706, 1,
1.386089, 0.5653084, 1.106097, 1, 0, 0.5686275, 1,
1.389113, -0.6696055, 2.168457, 1, 0, 0.5647059, 1,
1.396668, -1.201764, 1.558697, 1, 0, 0.5568628, 1,
1.401769, 1.803806, 0.1057055, 1, 0, 0.5529412, 1,
1.409877, -1.363331, 1.968924, 1, 0, 0.5450981, 1,
1.417028, -1.834215, 2.111847, 1, 0, 0.5411765, 1,
1.442144, 0.988428, 1.230747, 1, 0, 0.5333334, 1,
1.444147, -1.114398, 1.994828, 1, 0, 0.5294118, 1,
1.447657, -1.064263, -0.1073925, 1, 0, 0.5215687, 1,
1.450231, 0.04046508, 1.993467, 1, 0, 0.5176471, 1,
1.451655, -1.066412, 3.213207, 1, 0, 0.509804, 1,
1.462522, -0.5564521, 1.394136, 1, 0, 0.5058824, 1,
1.479006, -0.5273252, 0.8800268, 1, 0, 0.4980392, 1,
1.488405, 0.05322586, 1.823068, 1, 0, 0.4901961, 1,
1.492942, -0.6242853, 1.60948, 1, 0, 0.4862745, 1,
1.493558, -0.5026403, 2.310728, 1, 0, 0.4784314, 1,
1.498473, 0.7925512, 2.323088, 1, 0, 0.4745098, 1,
1.499362, 0.002585163, 1.463507, 1, 0, 0.4666667, 1,
1.506336, -0.8218584, 2.726444, 1, 0, 0.4627451, 1,
1.518306, 1.09413, 1.225552, 1, 0, 0.454902, 1,
1.522734, 0.3600381, 0.7285962, 1, 0, 0.4509804, 1,
1.525158, -0.5706419, 2.654616, 1, 0, 0.4431373, 1,
1.525753, -0.1576622, 1.6733, 1, 0, 0.4392157, 1,
1.53333, -0.002703666, 0.043056, 1, 0, 0.4313726, 1,
1.540422, 0.04083602, 2.659553, 1, 0, 0.427451, 1,
1.554173, -0.9319245, 3.636825, 1, 0, 0.4196078, 1,
1.567482, -0.2414456, 2.102057, 1, 0, 0.4156863, 1,
1.594677, -0.391295, 1.693823, 1, 0, 0.4078431, 1,
1.607965, -0.7669667, 1.504894, 1, 0, 0.4039216, 1,
1.608865, -0.4008466, 3.124766, 1, 0, 0.3960784, 1,
1.614777, -0.1654751, 2.168005, 1, 0, 0.3882353, 1,
1.616629, -1.374422, 3.200386, 1, 0, 0.3843137, 1,
1.64831, 0.6095882, 0.6368541, 1, 0, 0.3764706, 1,
1.649213, -1.081483, 2.809799, 1, 0, 0.372549, 1,
1.650016, 2.030868, -0.9391019, 1, 0, 0.3647059, 1,
1.672869, 0.4197496, 2.098493, 1, 0, 0.3607843, 1,
1.68627, -0.01729226, 1.00565, 1, 0, 0.3529412, 1,
1.700866, 0.09892125, 0.7412656, 1, 0, 0.3490196, 1,
1.717963, 0.4519069, 1.475223, 1, 0, 0.3411765, 1,
1.772479, -1.868223, 1.895687, 1, 0, 0.3372549, 1,
1.775687, -0.5589182, 1.977315, 1, 0, 0.3294118, 1,
1.80966, 0.4421784, 0.8740194, 1, 0, 0.3254902, 1,
1.814355, -0.9348993, 0.9233161, 1, 0, 0.3176471, 1,
1.81556, 0.8183283, 0.4064512, 1, 0, 0.3137255, 1,
1.827639, 0.7017468, 1.279507, 1, 0, 0.3058824, 1,
1.841658, 0.1733116, 0.915769, 1, 0, 0.2980392, 1,
1.84533, -0.4825346, 1.883276, 1, 0, 0.2941177, 1,
1.853381, -0.1093349, 2.722506, 1, 0, 0.2862745, 1,
1.862337, -1.341529, 4.246123, 1, 0, 0.282353, 1,
1.864504, 0.4618126, 1.939656, 1, 0, 0.2745098, 1,
1.870369, 0.1389184, 1.992823, 1, 0, 0.2705882, 1,
1.887234, -0.8203911, 2.81756, 1, 0, 0.2627451, 1,
1.905661, 0.3193299, 1.183913, 1, 0, 0.2588235, 1,
1.909269, -0.5956802, 0.9130356, 1, 0, 0.2509804, 1,
1.937045, -0.02886615, 1.770015, 1, 0, 0.2470588, 1,
1.938838, -1.393278, 4.486732, 1, 0, 0.2392157, 1,
1.947356, -0.7473022, 0.7758717, 1, 0, 0.2352941, 1,
1.9533, -1.458337, 1.961983, 1, 0, 0.227451, 1,
1.956183, -0.1725872, 2.581271, 1, 0, 0.2235294, 1,
1.95721, -1.007621, 3.161533, 1, 0, 0.2156863, 1,
1.972383, 0.9011593, 2.771416, 1, 0, 0.2117647, 1,
1.974337, -1.639554, 1.908365, 1, 0, 0.2039216, 1,
1.991367, 0.1857662, -0.05720285, 1, 0, 0.1960784, 1,
1.994048, -1.627076, 2.493723, 1, 0, 0.1921569, 1,
2.019819, 0.7140863, 3.277315, 1, 0, 0.1843137, 1,
2.020594, -0.4431315, 1.77752, 1, 0, 0.1803922, 1,
2.025388, -0.3456117, 0.01456879, 1, 0, 0.172549, 1,
2.033987, -0.8855163, 3.10151, 1, 0, 0.1686275, 1,
2.038493, -0.04386234, 1.25446, 1, 0, 0.1607843, 1,
2.038988, 0.9609409, 1.050241, 1, 0, 0.1568628, 1,
2.056009, -0.5017822, 1.337503, 1, 0, 0.1490196, 1,
2.060771, 1.913524, 0.01935606, 1, 0, 0.145098, 1,
2.080722, -1.757434, 2.47524, 1, 0, 0.1372549, 1,
2.087366, 0.8603289, 1.692675, 1, 0, 0.1333333, 1,
2.096936, 1.21574, -0.5217172, 1, 0, 0.1254902, 1,
2.104582, 0.8117637, 1.914305, 1, 0, 0.1215686, 1,
2.105933, 0.9215655, 0.5252554, 1, 0, 0.1137255, 1,
2.125691, 1.455043, 1.185589, 1, 0, 0.1098039, 1,
2.150016, -1.2897, 1.511855, 1, 0, 0.1019608, 1,
2.177339, 1.881332, 1.031485, 1, 0, 0.09411765, 1,
2.217833, -0.01577171, 0.4973509, 1, 0, 0.09019608, 1,
2.285799, 1.285624, 1.976535, 1, 0, 0.08235294, 1,
2.287608, -0.8628042, 0.7609144, 1, 0, 0.07843138, 1,
2.313762, 1.035713, 1.242542, 1, 0, 0.07058824, 1,
2.340246, -0.06381724, 2.13236, 1, 0, 0.06666667, 1,
2.358751, -1.270142, 1.493803, 1, 0, 0.05882353, 1,
2.368885, -0.1193571, 0.9452427, 1, 0, 0.05490196, 1,
2.412931, -0.4057408, 1.545513, 1, 0, 0.04705882, 1,
2.417269, 0.3542198, 2.332679, 1, 0, 0.04313726, 1,
2.41934, -1.446509, 2.315223, 1, 0, 0.03529412, 1,
2.436973, 1.634488, 1.261021, 1, 0, 0.03137255, 1,
2.440348, 2.430704, 1.519318, 1, 0, 0.02352941, 1,
2.526631, 0.1374865, 1.996363, 1, 0, 0.01960784, 1,
2.936482, 0.1436888, 1.285144, 1, 0, 0.01176471, 1,
3.603323, -1.634917, 2.247087, 1, 0, 0.007843138, 1
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
0.5226865, -4.570391, -7.201767, 0, -0.5, 0.5, 0.5,
0.5226865, -4.570391, -7.201767, 1, -0.5, 0.5, 0.5,
0.5226865, -4.570391, -7.201767, 1, 1.5, 0.5, 0.5,
0.5226865, -4.570391, -7.201767, 0, 1.5, 0.5, 0.5
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
-3.602286, 0.06681907, -7.201767, 0, -0.5, 0.5, 0.5,
-3.602286, 0.06681907, -7.201767, 1, -0.5, 0.5, 0.5,
-3.602286, 0.06681907, -7.201767, 1, 1.5, 0.5, 0.5,
-3.602286, 0.06681907, -7.201767, 0, 1.5, 0.5, 0.5
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
-3.602286, -4.570391, 0.03394699, 0, -0.5, 0.5, 0.5,
-3.602286, -4.570391, 0.03394699, 1, -0.5, 0.5, 0.5,
-3.602286, -4.570391, 0.03394699, 1, 1.5, 0.5, 0.5,
-3.602286, -4.570391, 0.03394699, 0, 1.5, 0.5, 0.5
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
-2, -3.500265, -5.531987,
3, -3.500265, -5.531987,
-2, -3.500265, -5.531987,
-2, -3.67862, -5.810284,
-1, -3.500265, -5.531987,
-1, -3.67862, -5.810284,
0, -3.500265, -5.531987,
0, -3.67862, -5.810284,
1, -3.500265, -5.531987,
1, -3.67862, -5.810284,
2, -3.500265, -5.531987,
2, -3.67862, -5.810284,
3, -3.500265, -5.531987,
3, -3.67862, -5.810284
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
-2, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
-2, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
-2, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
-2, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5,
-1, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
-1, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
-1, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
-1, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5,
0, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
0, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
0, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
0, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5,
1, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
1, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
1, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
1, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5,
2, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
2, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
2, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
2, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5,
3, -4.035328, -6.366877, 0, -0.5, 0.5, 0.5,
3, -4.035328, -6.366877, 1, -0.5, 0.5, 0.5,
3, -4.035328, -6.366877, 1, 1.5, 0.5, 0.5,
3, -4.035328, -6.366877, 0, 1.5, 0.5, 0.5
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
-2.65037, -3, -5.531987,
-2.65037, 3, -5.531987,
-2.65037, -3, -5.531987,
-2.809022, -3, -5.810284,
-2.65037, -2, -5.531987,
-2.809022, -2, -5.810284,
-2.65037, -1, -5.531987,
-2.809022, -1, -5.810284,
-2.65037, 0, -5.531987,
-2.809022, 0, -5.810284,
-2.65037, 1, -5.531987,
-2.809022, 1, -5.810284,
-2.65037, 2, -5.531987,
-2.809022, 2, -5.810284,
-2.65037, 3, -5.531987,
-2.809022, 3, -5.810284
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
-3.126328, -3, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, -3, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, -3, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, -3, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, -2, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, -2, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, -2, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, -2, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, -1, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, -1, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, -1, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, -1, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, 0, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, 0, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, 0, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, 0, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, 1, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, 1, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, 1, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, 1, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, 2, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, 2, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, 2, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, 2, -6.366877, 0, 1.5, 0.5, 0.5,
-3.126328, 3, -6.366877, 0, -0.5, 0.5, 0.5,
-3.126328, 3, -6.366877, 1, -0.5, 0.5, 0.5,
-3.126328, 3, -6.366877, 1, 1.5, 0.5, 0.5,
-3.126328, 3, -6.366877, 0, 1.5, 0.5, 0.5
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
-2.65037, -3.500265, -4,
-2.65037, -3.500265, 4,
-2.65037, -3.500265, -4,
-2.809022, -3.67862, -4,
-2.65037, -3.500265, -2,
-2.809022, -3.67862, -2,
-2.65037, -3.500265, 0,
-2.809022, -3.67862, 0,
-2.65037, -3.500265, 2,
-2.809022, -3.67862, 2,
-2.65037, -3.500265, 4,
-2.809022, -3.67862, 4
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
-3.126328, -4.035328, -4, 0, -0.5, 0.5, 0.5,
-3.126328, -4.035328, -4, 1, -0.5, 0.5, 0.5,
-3.126328, -4.035328, -4, 1, 1.5, 0.5, 0.5,
-3.126328, -4.035328, -4, 0, 1.5, 0.5, 0.5,
-3.126328, -4.035328, -2, 0, -0.5, 0.5, 0.5,
-3.126328, -4.035328, -2, 1, -0.5, 0.5, 0.5,
-3.126328, -4.035328, -2, 1, 1.5, 0.5, 0.5,
-3.126328, -4.035328, -2, 0, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 0, 0, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 0, 1, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 0, 1, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 0, 0, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 2, 0, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 2, 1, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 2, 1, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 2, 0, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 4, 0, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 4, 1, -0.5, 0.5, 0.5,
-3.126328, -4.035328, 4, 1, 1.5, 0.5, 0.5,
-3.126328, -4.035328, 4, 0, 1.5, 0.5, 0.5
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
-2.65037, -3.500265, -5.531987,
-2.65037, 3.633904, -5.531987,
-2.65037, -3.500265, 5.599881,
-2.65037, 3.633904, 5.599881,
-2.65037, -3.500265, -5.531987,
-2.65037, -3.500265, 5.599881,
-2.65037, 3.633904, -5.531987,
-2.65037, 3.633904, 5.599881,
-2.65037, -3.500265, -5.531987,
3.695743, -3.500265, -5.531987,
-2.65037, -3.500265, 5.599881,
3.695743, -3.500265, 5.599881,
-2.65037, 3.633904, -5.531987,
3.695743, 3.633904, -5.531987,
-2.65037, 3.633904, 5.599881,
3.695743, 3.633904, 5.599881,
3.695743, -3.500265, -5.531987,
3.695743, 3.633904, -5.531987,
3.695743, -3.500265, 5.599881,
3.695743, 3.633904, 5.599881,
3.695743, -3.500265, -5.531987,
3.695743, -3.500265, 5.599881,
3.695743, 3.633904, -5.531987,
3.695743, 3.633904, 5.599881
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
var radius = 7.831294;
var distance = 34.84231;
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
mvMatrix.translate( -0.5226865, -0.06681907, -0.03394699 );
mvMatrix.scale( 1.334258, 1.186872, 0.7606404 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84231);
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


