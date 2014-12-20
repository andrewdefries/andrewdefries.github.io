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
-3.095758, -1.959146, -3.840727, 1, 0, 0, 1,
-3.081149, 0.86814, -0.6638597, 1, 0.007843138, 0, 1,
-2.921712, 0.2809999, -1.367113, 1, 0.01176471, 0, 1,
-2.692913, 0.6868728, -1.395398, 1, 0.01960784, 0, 1,
-2.678068, 0.1748677, -0.3108975, 1, 0.02352941, 0, 1,
-2.469196, 1.177743, -1.364039, 1, 0.03137255, 0, 1,
-2.433855, -0.3115084, -0.3665813, 1, 0.03529412, 0, 1,
-2.427605, -1.451339, -3.420401, 1, 0.04313726, 0, 1,
-2.407647, 0.3095838, -1.691568, 1, 0.04705882, 0, 1,
-2.380978, -0.632565, -1.248495, 1, 0.05490196, 0, 1,
-2.376431, 0.1485011, -2.431417, 1, 0.05882353, 0, 1,
-2.335887, -0.5532781, -1.660379, 1, 0.06666667, 0, 1,
-2.217229, -1.068548, -1.18221, 1, 0.07058824, 0, 1,
-2.215602, -0.8481623, -4.0542, 1, 0.07843138, 0, 1,
-2.195471, 0.4865024, -1.195622, 1, 0.08235294, 0, 1,
-2.091921, -0.3097965, -2.121697, 1, 0.09019608, 0, 1,
-2.060096, 0.2364801, -1.023361, 1, 0.09411765, 0, 1,
-2.05353, 0.2587242, 0.8398345, 1, 0.1019608, 0, 1,
-2.032571, 1.130723, -0.7587295, 1, 0.1098039, 0, 1,
-2.028991, -0.2238169, -0.5009702, 1, 0.1137255, 0, 1,
-1.988305, 0.6552082, -0.9639735, 1, 0.1215686, 0, 1,
-1.960943, 0.5370384, 0.2561038, 1, 0.1254902, 0, 1,
-1.958376, 1.444266, 1.243294, 1, 0.1333333, 0, 1,
-1.935868, 1.136729, -0.6415285, 1, 0.1372549, 0, 1,
-1.91917, -0.9427418, -0.9970188, 1, 0.145098, 0, 1,
-1.902801, -0.7909727, -0.8924265, 1, 0.1490196, 0, 1,
-1.883956, -0.3759401, -2.623947, 1, 0.1568628, 0, 1,
-1.8643, 0.1157232, -2.179354, 1, 0.1607843, 0, 1,
-1.860577, 1.740283, -0.7320685, 1, 0.1686275, 0, 1,
-1.827692, -1.589908, -3.070009, 1, 0.172549, 0, 1,
-1.814872, 0.7647915, 0.8075067, 1, 0.1803922, 0, 1,
-1.789338, -0.642978, -0.5438349, 1, 0.1843137, 0, 1,
-1.775887, 0.5577164, -2.321342, 1, 0.1921569, 0, 1,
-1.769588, -0.04006041, -2.998953, 1, 0.1960784, 0, 1,
-1.726356, 0.696875, -1.272353, 1, 0.2039216, 0, 1,
-1.721705, -0.01471523, -1.519622, 1, 0.2117647, 0, 1,
-1.720677, -0.5345836, -1.407636, 1, 0.2156863, 0, 1,
-1.701475, 0.3755012, -1.308242, 1, 0.2235294, 0, 1,
-1.700254, -2.148718, -2.971617, 1, 0.227451, 0, 1,
-1.679493, 0.5762713, -1.700998, 1, 0.2352941, 0, 1,
-1.659191, -1.850008, -3.55388, 1, 0.2392157, 0, 1,
-1.654561, -0.670445, -1.926069, 1, 0.2470588, 0, 1,
-1.652477, -0.9771107, -2.066617, 1, 0.2509804, 0, 1,
-1.651194, 0.6628208, -1.893516, 1, 0.2588235, 0, 1,
-1.650259, -0.271105, -1.98536, 1, 0.2627451, 0, 1,
-1.644644, -0.6728994, -2.236814, 1, 0.2705882, 0, 1,
-1.643611, 0.6128556, -1.953938, 1, 0.2745098, 0, 1,
-1.634719, -0.1892529, -2.202918, 1, 0.282353, 0, 1,
-1.629774, -1.893086, -1.49881, 1, 0.2862745, 0, 1,
-1.628337, 1.204014, -0.4958372, 1, 0.2941177, 0, 1,
-1.625041, -1.206444, -3.496166, 1, 0.3019608, 0, 1,
-1.615448, 1.648377, -0.6321335, 1, 0.3058824, 0, 1,
-1.607195, -0.2378616, -3.138136, 1, 0.3137255, 0, 1,
-1.58681, -0.8469452, -4.631325, 1, 0.3176471, 0, 1,
-1.583063, -1.22199, -0.8952767, 1, 0.3254902, 0, 1,
-1.580855, 0.3266204, -1.266679, 1, 0.3294118, 0, 1,
-1.580107, 1.939588, 0.8842739, 1, 0.3372549, 0, 1,
-1.567506, -0.1642099, -0.9572118, 1, 0.3411765, 0, 1,
-1.565579, 0.04206319, -2.220118, 1, 0.3490196, 0, 1,
-1.558221, 0.8883047, 0.2067639, 1, 0.3529412, 0, 1,
-1.549298, 0.9642737, -2.592095, 1, 0.3607843, 0, 1,
-1.53862, 0.5168954, -0.6197006, 1, 0.3647059, 0, 1,
-1.538532, -0.5922049, -1.474685, 1, 0.372549, 0, 1,
-1.518472, -0.1364059, -2.494581, 1, 0.3764706, 0, 1,
-1.50901, 0.7197819, -1.868663, 1, 0.3843137, 0, 1,
-1.508495, 0.7500371, 0.6261457, 1, 0.3882353, 0, 1,
-1.505864, 0.6203028, -2.618486, 1, 0.3960784, 0, 1,
-1.505284, 0.07883733, -0.4138274, 1, 0.4039216, 0, 1,
-1.504163, -0.7307464, -1.329919, 1, 0.4078431, 0, 1,
-1.501637, -0.2766119, 1.666446, 1, 0.4156863, 0, 1,
-1.497482, -0.6350427, -1.203211, 1, 0.4196078, 0, 1,
-1.494248, -0.9915746, -2.748564, 1, 0.427451, 0, 1,
-1.481724, -0.3167616, 1.298772, 1, 0.4313726, 0, 1,
-1.481409, 0.5995796, -1.072266, 1, 0.4392157, 0, 1,
-1.476267, -0.03104464, -1.307274, 1, 0.4431373, 0, 1,
-1.457824, 1.968998, -1.584767, 1, 0.4509804, 0, 1,
-1.457248, -0.7453594, -0.5546805, 1, 0.454902, 0, 1,
-1.448044, -0.1620022, -2.662126, 1, 0.4627451, 0, 1,
-1.440659, 0.7743824, 0.07345127, 1, 0.4666667, 0, 1,
-1.432879, 0.6174887, -1.285671, 1, 0.4745098, 0, 1,
-1.43253, -0.1163841, -0.4675441, 1, 0.4784314, 0, 1,
-1.432125, -2.51336, -1.576971, 1, 0.4862745, 0, 1,
-1.422369, -1.5574, -3.938303, 1, 0.4901961, 0, 1,
-1.419695, -0.4406464, -1.966749, 1, 0.4980392, 0, 1,
-1.399083, 1.231808, -1.284719, 1, 0.5058824, 0, 1,
-1.39337, 0.3511533, -1.789902, 1, 0.509804, 0, 1,
-1.390522, -0.001194693, -2.129509, 1, 0.5176471, 0, 1,
-1.389286, 0.6801947, -0.8614681, 1, 0.5215687, 0, 1,
-1.374427, -0.6171534, -2.231223, 1, 0.5294118, 0, 1,
-1.365628, 0.2472904, -0.5851918, 1, 0.5333334, 0, 1,
-1.360531, -0.6919894, -1.138133, 1, 0.5411765, 0, 1,
-1.348048, -0.2131977, -2.23021, 1, 0.5450981, 0, 1,
-1.347007, 0.3151745, -1.594141, 1, 0.5529412, 0, 1,
-1.340006, 0.4422612, -1.487356, 1, 0.5568628, 0, 1,
-1.338473, -0.4993598, -2.102585, 1, 0.5647059, 0, 1,
-1.33328, 1.424163, 0.4872647, 1, 0.5686275, 0, 1,
-1.323415, -0.1817062, -2.081802, 1, 0.5764706, 0, 1,
-1.321821, -0.07133344, -1.952958, 1, 0.5803922, 0, 1,
-1.321075, 1.086347, -1.658589, 1, 0.5882353, 0, 1,
-1.320602, -0.08640429, -1.361159, 1, 0.5921569, 0, 1,
-1.319024, -0.3702983, -3.085825, 1, 0.6, 0, 1,
-1.318131, 2.238371, -0.06499975, 1, 0.6078432, 0, 1,
-1.316041, 2.137127, 2.009251, 1, 0.6117647, 0, 1,
-1.309128, -0.3501259, -2.409953, 1, 0.6196079, 0, 1,
-1.306643, -0.4498557, -1.920384, 1, 0.6235294, 0, 1,
-1.300118, -0.3516442, -1.76862, 1, 0.6313726, 0, 1,
-1.298536, -0.4159596, -1.181847, 1, 0.6352941, 0, 1,
-1.295604, -0.2138705, -3.379175, 1, 0.6431373, 0, 1,
-1.285402, 0.004934323, 0.5885708, 1, 0.6470588, 0, 1,
-1.284074, -0.5106612, -1.949545, 1, 0.654902, 0, 1,
-1.269601, 1.19259, -0.2990337, 1, 0.6588235, 0, 1,
-1.267896, 0.5604478, -0.8169525, 1, 0.6666667, 0, 1,
-1.265807, 0.03813611, -1.25173, 1, 0.6705883, 0, 1,
-1.264847, -1.115971, -1.121883, 1, 0.6784314, 0, 1,
-1.262418, 2.561197, -0.6551201, 1, 0.682353, 0, 1,
-1.261899, 0.0529548, -0.5157759, 1, 0.6901961, 0, 1,
-1.241544, -1.056805, -2.773764, 1, 0.6941177, 0, 1,
-1.241433, -0.9271336, -0.9960192, 1, 0.7019608, 0, 1,
-1.240742, -0.880778, -3.029888, 1, 0.7098039, 0, 1,
-1.238249, 0.3925892, -1.241032, 1, 0.7137255, 0, 1,
-1.23761, 0.2484329, -0.9596839, 1, 0.7215686, 0, 1,
-1.234245, 0.1015283, -2.461368, 1, 0.7254902, 0, 1,
-1.207823, -0.558467, -3.28283, 1, 0.7333333, 0, 1,
-1.207348, -0.2432527, -2.050506, 1, 0.7372549, 0, 1,
-1.206367, 0.6072457, -3.0157, 1, 0.7450981, 0, 1,
-1.206182, -0.303953, -1.659927, 1, 0.7490196, 0, 1,
-1.205898, -0.771558, -3.227692, 1, 0.7568628, 0, 1,
-1.202733, 0.3280383, -0.5561613, 1, 0.7607843, 0, 1,
-1.198219, 0.6155478, -1.862389, 1, 0.7686275, 0, 1,
-1.184079, -1.417101, -1.78367, 1, 0.772549, 0, 1,
-1.182753, 1.290689, -0.5222906, 1, 0.7803922, 0, 1,
-1.18193, -0.9901129, -1.223953, 1, 0.7843137, 0, 1,
-1.178136, 1.182418, 0.9490076, 1, 0.7921569, 0, 1,
-1.164414, 1.433735, -2.455858, 1, 0.7960784, 0, 1,
-1.154958, -0.03165389, -1.808745, 1, 0.8039216, 0, 1,
-1.153775, -0.6259617, -1.873069, 1, 0.8117647, 0, 1,
-1.152101, -0.8888063, -3.544171, 1, 0.8156863, 0, 1,
-1.144832, -1.170041, -3.661355, 1, 0.8235294, 0, 1,
-1.143458, -0.1411695, -2.273656, 1, 0.827451, 0, 1,
-1.129455, -0.8697348, -2.002398, 1, 0.8352941, 0, 1,
-1.129086, 0.1234593, -2.282315, 1, 0.8392157, 0, 1,
-1.125152, 0.3640089, 0.5768965, 1, 0.8470588, 0, 1,
-1.122705, -0.9869691, -1.891318, 1, 0.8509804, 0, 1,
-1.119659, 0.7586015, -1.548785, 1, 0.8588235, 0, 1,
-1.117911, -1.948105, -3.29385, 1, 0.8627451, 0, 1,
-1.113695, -0.5850674, -0.7384349, 1, 0.8705882, 0, 1,
-1.10998, 0.2893089, -0.7350165, 1, 0.8745098, 0, 1,
-1.105534, -1.114978, -3.684381, 1, 0.8823529, 0, 1,
-1.096978, -0.5771817, 0.002612018, 1, 0.8862745, 0, 1,
-1.09681, 0.2152444, -2.917741, 1, 0.8941177, 0, 1,
-1.094634, 0.551647, -0.4108627, 1, 0.8980392, 0, 1,
-1.085821, 2.391399, -0.1570431, 1, 0.9058824, 0, 1,
-1.083801, -0.1550594, -1.800387, 1, 0.9137255, 0, 1,
-1.072593, 1.022961, -0.7040864, 1, 0.9176471, 0, 1,
-1.064888, -0.452937, -5.104896, 1, 0.9254902, 0, 1,
-1.062286, 0.8081841, -1.130638, 1, 0.9294118, 0, 1,
-1.060883, -0.3213587, -1.320568, 1, 0.9372549, 0, 1,
-1.060554, 1.993868, -0.2136729, 1, 0.9411765, 0, 1,
-1.058614, -0.9704672, -2.990618, 1, 0.9490196, 0, 1,
-1.045457, -0.9697046, -2.992019, 1, 0.9529412, 0, 1,
-1.030014, 1.775907, -1.148408, 1, 0.9607843, 0, 1,
-1.026396, 2.084741, -1.240861, 1, 0.9647059, 0, 1,
-1.025372, -1.97949, -3.063176, 1, 0.972549, 0, 1,
-1.02255, -0.7564817, -3.049159, 1, 0.9764706, 0, 1,
-1.020507, -2.803988, -0.9067786, 1, 0.9843137, 0, 1,
-1.019322, 0.1200125, -0.2386153, 1, 0.9882353, 0, 1,
-1.010613, 0.4746241, -1.890093, 1, 0.9960784, 0, 1,
-1.0086, 1.731489, -0.2977069, 0.9960784, 1, 0, 1,
-1.002646, 0.4690585, -0.8122649, 0.9921569, 1, 0, 1,
-0.9974867, 0.1580174, -0.6811341, 0.9843137, 1, 0, 1,
-0.9912444, 0.8171806, -0.01530513, 0.9803922, 1, 0, 1,
-0.9878587, 0.5003833, -0.5306075, 0.972549, 1, 0, 1,
-0.9857556, -1.476944, -2.709314, 0.9686275, 1, 0, 1,
-0.980399, 1.737807, -0.9821393, 0.9607843, 1, 0, 1,
-0.9771281, 0.7373126, 0.4928223, 0.9568627, 1, 0, 1,
-0.974812, 0.4740331, -1.743763, 0.9490196, 1, 0, 1,
-0.9659681, -0.1440762, -0.9609475, 0.945098, 1, 0, 1,
-0.9656765, -0.5017937, -1.106266, 0.9372549, 1, 0, 1,
-0.9557729, 1.373279, -2.057809, 0.9333333, 1, 0, 1,
-0.9488708, -0.1420042, -2.247656, 0.9254902, 1, 0, 1,
-0.9440776, -1.640643, -3.054815, 0.9215686, 1, 0, 1,
-0.9408062, 0.4084993, -1.083704, 0.9137255, 1, 0, 1,
-0.9343837, 0.3644902, -1.033772, 0.9098039, 1, 0, 1,
-0.934014, 0.1944233, -0.3821356, 0.9019608, 1, 0, 1,
-0.9306889, 1.192034, 0.2101282, 0.8941177, 1, 0, 1,
-0.9214101, -1.256992, -1.566881, 0.8901961, 1, 0, 1,
-0.916633, -0.4837958, -2.527482, 0.8823529, 1, 0, 1,
-0.9141176, 0.01160595, -1.294792, 0.8784314, 1, 0, 1,
-0.9041852, -0.8678481, -2.971781, 0.8705882, 1, 0, 1,
-0.9014734, -1.396532, -3.362467, 0.8666667, 1, 0, 1,
-0.9013515, -0.5663733, -3.52023, 0.8588235, 1, 0, 1,
-0.8994011, -1.493785, -3.519876, 0.854902, 1, 0, 1,
-0.8939355, -1.741804, -3.346488, 0.8470588, 1, 0, 1,
-0.8909369, -2.097277, -3.959828, 0.8431373, 1, 0, 1,
-0.8892462, 0.7662591, -0.2499663, 0.8352941, 1, 0, 1,
-0.8867101, 0.2438614, -0.8348501, 0.8313726, 1, 0, 1,
-0.8866983, 0.07827027, -3.604944, 0.8235294, 1, 0, 1,
-0.8621426, -0.3884339, -3.212183, 0.8196079, 1, 0, 1,
-0.857187, -1.714422, -1.632318, 0.8117647, 1, 0, 1,
-0.8556439, -0.118124, -2.666871, 0.8078431, 1, 0, 1,
-0.8495932, -1.44847, -2.448405, 0.8, 1, 0, 1,
-0.8490018, -0.08100924, -1.33839, 0.7921569, 1, 0, 1,
-0.8325107, 1.088853, -0.6033591, 0.7882353, 1, 0, 1,
-0.8256226, -0.4322368, -2.066889, 0.7803922, 1, 0, 1,
-0.8109873, 0.6529119, -1.72359, 0.7764706, 1, 0, 1,
-0.8077078, 0.5930624, -0.7110856, 0.7686275, 1, 0, 1,
-0.803347, 0.7132017, -0.9692991, 0.7647059, 1, 0, 1,
-0.7920666, 0.3591453, 1.354407, 0.7568628, 1, 0, 1,
-0.789066, -0.2134104, -0.7982444, 0.7529412, 1, 0, 1,
-0.7847929, -1.509469, -5.274838, 0.7450981, 1, 0, 1,
-0.7847319, 0.1269769, -1.476616, 0.7411765, 1, 0, 1,
-0.7845718, -1.279999, -2.746053, 0.7333333, 1, 0, 1,
-0.7791654, -0.350869, -2.22551, 0.7294118, 1, 0, 1,
-0.7754491, -1.496627, -3.058772, 0.7215686, 1, 0, 1,
-0.7720483, 0.01247775, -0.4940585, 0.7176471, 1, 0, 1,
-0.7712541, -0.5983501, -3.496202, 0.7098039, 1, 0, 1,
-0.7680104, 0.5078568, -2.225705, 0.7058824, 1, 0, 1,
-0.7640403, -1.05583, -3.006027, 0.6980392, 1, 0, 1,
-0.7629419, -1.664289, -2.582776, 0.6901961, 1, 0, 1,
-0.7603927, 2.184937, 0.8348488, 0.6862745, 1, 0, 1,
-0.7581958, -0.4534307, -1.594326, 0.6784314, 1, 0, 1,
-0.7579589, 0.01309099, -1.351933, 0.6745098, 1, 0, 1,
-0.7550269, 0.9408882, -1.786242, 0.6666667, 1, 0, 1,
-0.7534125, 0.9886672, -2.159881, 0.6627451, 1, 0, 1,
-0.7522441, 0.3657129, -0.3851157, 0.654902, 1, 0, 1,
-0.7340383, 1.895012, -3.053375, 0.6509804, 1, 0, 1,
-0.7337252, 0.2522116, -1.575932, 0.6431373, 1, 0, 1,
-0.7180466, -0.4923069, -2.603949, 0.6392157, 1, 0, 1,
-0.7165529, -0.7027181, -1.15977, 0.6313726, 1, 0, 1,
-0.7111309, 1.120656, 1.365893, 0.627451, 1, 0, 1,
-0.7087052, -1.254483, -1.940598, 0.6196079, 1, 0, 1,
-0.7070663, 0.7680123, -1.242612, 0.6156863, 1, 0, 1,
-0.7026016, 0.6744467, -0.01495501, 0.6078432, 1, 0, 1,
-0.7019787, 0.7363498, -1.262057, 0.6039216, 1, 0, 1,
-0.7000839, -1.206956, -2.559759, 0.5960785, 1, 0, 1,
-0.6953191, -0.04915494, -1.454874, 0.5882353, 1, 0, 1,
-0.6938392, -0.9697567, -2.305025, 0.5843138, 1, 0, 1,
-0.6914945, -0.7786002, -1.42406, 0.5764706, 1, 0, 1,
-0.6885975, -0.01896122, 0.4711303, 0.572549, 1, 0, 1,
-0.6880105, -1.084147, -1.094816, 0.5647059, 1, 0, 1,
-0.6754575, 1.139604, -0.3605742, 0.5607843, 1, 0, 1,
-0.6749153, -1.450537, -3.276585, 0.5529412, 1, 0, 1,
-0.6742224, -0.9285303, -3.718356, 0.5490196, 1, 0, 1,
-0.6722181, -1.45908, -3.007494, 0.5411765, 1, 0, 1,
-0.672055, 0.4152387, 0.4055804, 0.5372549, 1, 0, 1,
-0.6717892, 0.1900437, -0.9670604, 0.5294118, 1, 0, 1,
-0.6679801, 1.59126, 1.176211, 0.5254902, 1, 0, 1,
-0.6662862, -0.3316418, -1.053725, 0.5176471, 1, 0, 1,
-0.6642844, 0.7917723, -3.556686, 0.5137255, 1, 0, 1,
-0.6626874, 0.2143025, -0.8225581, 0.5058824, 1, 0, 1,
-0.6483616, 0.4127113, 0.234178, 0.5019608, 1, 0, 1,
-0.6405787, 0.9144069, -1.718712, 0.4941176, 1, 0, 1,
-0.6384277, -1.354619, -1.151716, 0.4862745, 1, 0, 1,
-0.635183, -0.4200801, -1.126753, 0.4823529, 1, 0, 1,
-0.6331425, -0.3488637, -1.890435, 0.4745098, 1, 0, 1,
-0.6301271, -0.03041353, -2.302993, 0.4705882, 1, 0, 1,
-0.6283579, 1.009481, 1.303294, 0.4627451, 1, 0, 1,
-0.6236668, 0.1478105, -3.109933, 0.4588235, 1, 0, 1,
-0.6233817, 1.028745, 0.03390939, 0.4509804, 1, 0, 1,
-0.6198542, 1.287817, -1.127138, 0.4470588, 1, 0, 1,
-0.6171045, 0.8891806, -1.09322, 0.4392157, 1, 0, 1,
-0.6148822, -0.5701101, -2.226085, 0.4352941, 1, 0, 1,
-0.6148798, 0.9464598, 1.1167, 0.427451, 1, 0, 1,
-0.6134588, 1.5587, -1.707486, 0.4235294, 1, 0, 1,
-0.6052747, -2.167331, -4.403838, 0.4156863, 1, 0, 1,
-0.6040216, -1.183153, -3.790348, 0.4117647, 1, 0, 1,
-0.5960513, 0.7612614, 0.04684313, 0.4039216, 1, 0, 1,
-0.5885345, -0.5088149, -2.928183, 0.3960784, 1, 0, 1,
-0.587464, 0.1351391, -1.608889, 0.3921569, 1, 0, 1,
-0.5867604, -1.208744, -2.53745, 0.3843137, 1, 0, 1,
-0.5860746, -0.1029817, -1.177557, 0.3803922, 1, 0, 1,
-0.583982, -0.5549406, -2.186189, 0.372549, 1, 0, 1,
-0.5826991, -1.221092, -3.345581, 0.3686275, 1, 0, 1,
-0.5824109, 1.086745, -0.5492815, 0.3607843, 1, 0, 1,
-0.5818685, 0.3341378, -0.939994, 0.3568628, 1, 0, 1,
-0.5806956, -0.38355, -4.702658, 0.3490196, 1, 0, 1,
-0.5765429, 1.643633, 0.1770342, 0.345098, 1, 0, 1,
-0.5755004, 1.67764, 0.5678688, 0.3372549, 1, 0, 1,
-0.5723862, 0.4763425, -0.4210378, 0.3333333, 1, 0, 1,
-0.570071, 0.9864092, -0.6549953, 0.3254902, 1, 0, 1,
-0.569231, 0.967077, -0.5510349, 0.3215686, 1, 0, 1,
-0.5671043, -1.227835, -2.661241, 0.3137255, 1, 0, 1,
-0.5660772, 0.3761728, -1.473663, 0.3098039, 1, 0, 1,
-0.5656956, 0.5713195, -2.740307, 0.3019608, 1, 0, 1,
-0.5648016, 0.8137584, 0.7474486, 0.2941177, 1, 0, 1,
-0.557553, 0.586766, -1.197752, 0.2901961, 1, 0, 1,
-0.5571047, 0.8447769, -0.5624662, 0.282353, 1, 0, 1,
-0.552854, -0.08791432, -3.352835, 0.2784314, 1, 0, 1,
-0.55049, -0.4541226, -1.755409, 0.2705882, 1, 0, 1,
-0.545493, 0.08271507, -1.634179, 0.2666667, 1, 0, 1,
-0.5427659, 0.5452685, -0.4531899, 0.2588235, 1, 0, 1,
-0.540523, -0.07936238, 0.2623217, 0.254902, 1, 0, 1,
-0.5393136, 0.3313047, -1.186481, 0.2470588, 1, 0, 1,
-0.5340691, -0.0732571, -0.06624287, 0.2431373, 1, 0, 1,
-0.5317962, 1.891911, 0.09769053, 0.2352941, 1, 0, 1,
-0.5225836, -1.528542, -3.059378, 0.2313726, 1, 0, 1,
-0.5214301, -1.268, -3.068558, 0.2235294, 1, 0, 1,
-0.5198496, -0.04144679, -2.504092, 0.2196078, 1, 0, 1,
-0.5190416, -1.856144, -2.755784, 0.2117647, 1, 0, 1,
-0.5123634, 1.482852, -0.9956011, 0.2078431, 1, 0, 1,
-0.5095746, -0.106462, -2.225027, 0.2, 1, 0, 1,
-0.5064972, 0.3200195, 0.02319224, 0.1921569, 1, 0, 1,
-0.4990412, 0.7016521, -1.338844, 0.1882353, 1, 0, 1,
-0.4989893, 0.5425014, -1.957856, 0.1803922, 1, 0, 1,
-0.4967033, 0.1970074, -2.047516, 0.1764706, 1, 0, 1,
-0.4906682, -0.2133135, -3.18002, 0.1686275, 1, 0, 1,
-0.4860421, 2.01795, 0.08786443, 0.1647059, 1, 0, 1,
-0.4860365, -0.6621174, -3.740211, 0.1568628, 1, 0, 1,
-0.4804766, 0.5470961, -1.423182, 0.1529412, 1, 0, 1,
-0.4712979, -0.917177, -1.902972, 0.145098, 1, 0, 1,
-0.4700149, 1.001126, -0.4321847, 0.1411765, 1, 0, 1,
-0.4653832, -0.5540029, -3.608813, 0.1333333, 1, 0, 1,
-0.4609972, 0.5644993, -0.5665259, 0.1294118, 1, 0, 1,
-0.4603276, -0.1376061, -1.849682, 0.1215686, 1, 0, 1,
-0.4592538, -1.654355, -0.9316149, 0.1176471, 1, 0, 1,
-0.4577981, -1.728871, -1.072079, 0.1098039, 1, 0, 1,
-0.4577504, 1.497401, 0.3656866, 0.1058824, 1, 0, 1,
-0.4537764, -0.4614015, -1.342434, 0.09803922, 1, 0, 1,
-0.4508814, -1.032242, -2.564907, 0.09019608, 1, 0, 1,
-0.4497544, 0.8554271, -2.878397, 0.08627451, 1, 0, 1,
-0.4467888, -0.6684086, -1.882872, 0.07843138, 1, 0, 1,
-0.4423184, -0.2736051, -4.172835, 0.07450981, 1, 0, 1,
-0.4379514, 1.541067, 1.156069, 0.06666667, 1, 0, 1,
-0.4379153, -1.346385, -4.20445, 0.0627451, 1, 0, 1,
-0.4372113, -0.5308329, -1.980754, 0.05490196, 1, 0, 1,
-0.4367101, 0.6760342, -1.363003, 0.05098039, 1, 0, 1,
-0.43506, 0.1258423, 0.1514194, 0.04313726, 1, 0, 1,
-0.433296, -0.8845522, -1.614099, 0.03921569, 1, 0, 1,
-0.4328223, 0.03755411, -2.759087, 0.03137255, 1, 0, 1,
-0.4312638, 0.7233515, -0.9800823, 0.02745098, 1, 0, 1,
-0.4294408, 0.8690413, -0.2372386, 0.01960784, 1, 0, 1,
-0.4277713, 0.5305762, 0.06500442, 0.01568628, 1, 0, 1,
-0.4263077, 1.008235, -0.4179018, 0.007843138, 1, 0, 1,
-0.4247749, -2.024002, -4.61295, 0.003921569, 1, 0, 1,
-0.4241583, 0.2124256, 0.1359438, 0, 1, 0.003921569, 1,
-0.4215088, 0.01121415, -2.712716, 0, 1, 0.01176471, 1,
-0.4209499, -0.2385171, -1.459139, 0, 1, 0.01568628, 1,
-0.4207646, 0.3342139, -1.624178, 0, 1, 0.02352941, 1,
-0.4137234, -0.08323884, -1.864913, 0, 1, 0.02745098, 1,
-0.4093672, -0.6904111, -2.789954, 0, 1, 0.03529412, 1,
-0.408944, -1.303364, -0.8459498, 0, 1, 0.03921569, 1,
-0.4015982, 0.637738, -1.07013, 0, 1, 0.04705882, 1,
-0.3985824, 0.1413283, 0.1047876, 0, 1, 0.05098039, 1,
-0.3980329, -0.7837852, -0.4601512, 0, 1, 0.05882353, 1,
-0.3972322, 1.416118, -0.9743214, 0, 1, 0.0627451, 1,
-0.3964734, -1.110596, -4.29337, 0, 1, 0.07058824, 1,
-0.3945076, -1.472521, -3.188316, 0, 1, 0.07450981, 1,
-0.3896735, -0.3895574, -2.298307, 0, 1, 0.08235294, 1,
-0.3887259, -2.044651, -0.8802637, 0, 1, 0.08627451, 1,
-0.3883581, -0.1776982, -3.51531, 0, 1, 0.09411765, 1,
-0.3865771, 0.1913517, -1.822078, 0, 1, 0.1019608, 1,
-0.3845003, 0.830134, 0.7543575, 0, 1, 0.1058824, 1,
-0.381628, -0.1670622, -1.107057, 0, 1, 0.1137255, 1,
-0.3814966, -0.8755926, -2.966254, 0, 1, 0.1176471, 1,
-0.3808007, 0.4997817, -0.1808319, 0, 1, 0.1254902, 1,
-0.3790203, -0.3801002, -5.128774, 0, 1, 0.1294118, 1,
-0.371038, 1.167288, -1.208648, 0, 1, 0.1372549, 1,
-0.368576, 1.7609, 0.116878, 0, 1, 0.1411765, 1,
-0.3666782, 2.934124, -0.4722292, 0, 1, 0.1490196, 1,
-0.3662557, -1.803622, -2.240888, 0, 1, 0.1529412, 1,
-0.3632003, -1.741838, -0.7548527, 0, 1, 0.1607843, 1,
-0.3615676, -0.2813754, -3.192226, 0, 1, 0.1647059, 1,
-0.3613958, -0.1979024, -2.556714, 0, 1, 0.172549, 1,
-0.3536879, -0.4761136, -2.661221, 0, 1, 0.1764706, 1,
-0.3511877, -0.2038132, -1.436212, 0, 1, 0.1843137, 1,
-0.3485022, 1.385902, 0.1966726, 0, 1, 0.1882353, 1,
-0.3467541, 1.286227, 1.663076, 0, 1, 0.1960784, 1,
-0.3458011, -1.39436, -1.755083, 0, 1, 0.2039216, 1,
-0.3422586, 0.8400236, 0.1663568, 0, 1, 0.2078431, 1,
-0.3420107, -1.132708, -2.996169, 0, 1, 0.2156863, 1,
-0.3389904, -0.3678539, -2.516885, 0, 1, 0.2196078, 1,
-0.3382997, -0.300638, -1.420203, 0, 1, 0.227451, 1,
-0.3329107, -0.7474213, -2.478034, 0, 1, 0.2313726, 1,
-0.3298441, 0.4752536, -1.757709, 0, 1, 0.2392157, 1,
-0.3255714, 0.7335508, 1.196045, 0, 1, 0.2431373, 1,
-0.3234456, 0.3324423, 0.6888561, 0, 1, 0.2509804, 1,
-0.3211837, -0.5583288, -3.8905, 0, 1, 0.254902, 1,
-0.3165468, 2.412907, -0.7841388, 0, 1, 0.2627451, 1,
-0.3131132, -1.085546, -2.885031, 0, 1, 0.2666667, 1,
-0.3100173, 0.09565344, -0.09195489, 0, 1, 0.2745098, 1,
-0.3085395, -0.5286157, -3.082001, 0, 1, 0.2784314, 1,
-0.304786, -0.8990468, -3.564293, 0, 1, 0.2862745, 1,
-0.3031237, -0.1004543, -1.318121, 0, 1, 0.2901961, 1,
-0.3030933, -1.969865, -2.719454, 0, 1, 0.2980392, 1,
-0.2979165, 0.2715122, 0.4330424, 0, 1, 0.3058824, 1,
-0.296239, 0.5521607, -1.426784, 0, 1, 0.3098039, 1,
-0.2954763, 0.8109496, -1.179539, 0, 1, 0.3176471, 1,
-0.2949039, -1.830856, -2.606854, 0, 1, 0.3215686, 1,
-0.2913404, -0.3629216, -3.24275, 0, 1, 0.3294118, 1,
-0.2913114, 0.1981095, -2.836315, 0, 1, 0.3333333, 1,
-0.2907504, -2.672933, -1.412457, 0, 1, 0.3411765, 1,
-0.2905317, 2.212609, 0.1322258, 0, 1, 0.345098, 1,
-0.2899897, -1.251453, -2.656798, 0, 1, 0.3529412, 1,
-0.2899702, 0.1879693, -1.206459, 0, 1, 0.3568628, 1,
-0.2888206, -0.4219064, -3.314442, 0, 1, 0.3647059, 1,
-0.2881255, 0.5336805, -0.2179397, 0, 1, 0.3686275, 1,
-0.2863934, 0.8860384, 1.66415, 0, 1, 0.3764706, 1,
-0.2843288, -0.4941419, -1.719815, 0, 1, 0.3803922, 1,
-0.2834785, -0.4667486, -2.660356, 0, 1, 0.3882353, 1,
-0.2825958, 1.127548, -2.036602, 0, 1, 0.3921569, 1,
-0.2811296, -0.9043903, -1.954899, 0, 1, 0.4, 1,
-0.2712333, 0.4135925, -0.5565401, 0, 1, 0.4078431, 1,
-0.2707099, -0.6331974, -3.474713, 0, 1, 0.4117647, 1,
-0.2655817, 0.1843613, -2.235778, 0, 1, 0.4196078, 1,
-0.264465, -0.02928894, -1.231632, 0, 1, 0.4235294, 1,
-0.2625608, -1.201908, -2.970144, 0, 1, 0.4313726, 1,
-0.2578202, -0.3205628, -2.543475, 0, 1, 0.4352941, 1,
-0.2570517, 1.296318, -0.6685665, 0, 1, 0.4431373, 1,
-0.2554304, -0.4782387, -4.26253, 0, 1, 0.4470588, 1,
-0.2471562, 1.391809, 0.8072124, 0, 1, 0.454902, 1,
-0.2459764, 0.1536411, -2.597034, 0, 1, 0.4588235, 1,
-0.240493, -0.9411877, -2.384629, 0, 1, 0.4666667, 1,
-0.2369917, 0.06085026, -0.6243174, 0, 1, 0.4705882, 1,
-0.2356174, 0.006608915, -1.699779, 0, 1, 0.4784314, 1,
-0.2341069, 0.1869749, -1.926899, 0, 1, 0.4823529, 1,
-0.2326264, -0.5580899, -2.127671, 0, 1, 0.4901961, 1,
-0.2315344, -1.342885, -2.651241, 0, 1, 0.4941176, 1,
-0.2289993, -0.01760745, -1.129358, 0, 1, 0.5019608, 1,
-0.2287555, -0.9983687, -1.858201, 0, 1, 0.509804, 1,
-0.2207038, -1.253441, -4.296762, 0, 1, 0.5137255, 1,
-0.2203904, -0.4720018, -2.727571, 0, 1, 0.5215687, 1,
-0.2196255, -0.4826241, -1.658666, 0, 1, 0.5254902, 1,
-0.2173028, -0.5815245, -3.044307, 0, 1, 0.5333334, 1,
-0.2168776, 0.07352282, -1.907265, 0, 1, 0.5372549, 1,
-0.2071755, -2.3921, -3.248849, 0, 1, 0.5450981, 1,
-0.2050503, 0.839016, 0.3086899, 0, 1, 0.5490196, 1,
-0.2016769, 0.982168, 0.3675526, 0, 1, 0.5568628, 1,
-0.2011199, 0.4584304, -0.82554, 0, 1, 0.5607843, 1,
-0.2003741, 0.03566774, -0.4866424, 0, 1, 0.5686275, 1,
-0.1978206, -0.7277983, -3.569511, 0, 1, 0.572549, 1,
-0.1963469, 0.4066048, -1.407293, 0, 1, 0.5803922, 1,
-0.1895914, 1.584961, -0.1260506, 0, 1, 0.5843138, 1,
-0.1879304, 0.00375364, -3.413392, 0, 1, 0.5921569, 1,
-0.1868807, 0.6687688, 0.5044045, 0, 1, 0.5960785, 1,
-0.1807555, -1.455907, -3.42684, 0, 1, 0.6039216, 1,
-0.1795687, 0.7937001, 0.3822383, 0, 1, 0.6117647, 1,
-0.1789316, -1.016996, -2.042953, 0, 1, 0.6156863, 1,
-0.1760373, -2.03844, -2.576167, 0, 1, 0.6235294, 1,
-0.1738953, -1.500128, -4.348513, 0, 1, 0.627451, 1,
-0.1723656, -2.17009, -2.710434, 0, 1, 0.6352941, 1,
-0.1684507, -0.4930519, -1.82922, 0, 1, 0.6392157, 1,
-0.1604529, 0.5819847, -0.8490373, 0, 1, 0.6470588, 1,
-0.1559023, -0.6384158, -1.822543, 0, 1, 0.6509804, 1,
-0.1557871, -0.240317, -2.703921, 0, 1, 0.6588235, 1,
-0.1551582, -0.08502446, -1.625493, 0, 1, 0.6627451, 1,
-0.1510314, -0.4113811, -2.04012, 0, 1, 0.6705883, 1,
-0.1489926, 1.125448, 0.5963073, 0, 1, 0.6745098, 1,
-0.1467445, 0.6455226, -1.206908, 0, 1, 0.682353, 1,
-0.1425001, 0.8759386, -2.002512, 0, 1, 0.6862745, 1,
-0.1366535, 1.789007, 1.806247, 0, 1, 0.6941177, 1,
-0.1317988, 1.208327, -0.1185013, 0, 1, 0.7019608, 1,
-0.1279939, 0.405739, -1.018192, 0, 1, 0.7058824, 1,
-0.1267128, 1.216764, -2.014104, 0, 1, 0.7137255, 1,
-0.124304, -0.4683723, -2.162409, 0, 1, 0.7176471, 1,
-0.1242781, -0.903155, -3.548347, 0, 1, 0.7254902, 1,
-0.1239928, 0.04171686, -2.220589, 0, 1, 0.7294118, 1,
-0.1228353, -0.7516277, -3.183606, 0, 1, 0.7372549, 1,
-0.121913, 1.408003, -1.525775, 0, 1, 0.7411765, 1,
-0.1217029, -2.23515, -4.388271, 0, 1, 0.7490196, 1,
-0.1211805, 1.987468, 0.3416656, 0, 1, 0.7529412, 1,
-0.1174754, 0.4255533, 0.2230006, 0, 1, 0.7607843, 1,
-0.1166632, -1.252823, -4.027867, 0, 1, 0.7647059, 1,
-0.1118173, -0.7466759, -5.552396, 0, 1, 0.772549, 1,
-0.1109456, -0.790775, -2.363356, 0, 1, 0.7764706, 1,
-0.1072474, -0.4791595, -3.958363, 0, 1, 0.7843137, 1,
-0.1039328, -1.14862, -3.214742, 0, 1, 0.7882353, 1,
-0.09655932, 0.3939514, -1.186929, 0, 1, 0.7960784, 1,
-0.09212326, 1.173367, -0.2096744, 0, 1, 0.8039216, 1,
-0.09042986, -0.0154979, -1.221918, 0, 1, 0.8078431, 1,
-0.08253448, -0.5447358, -3.286914, 0, 1, 0.8156863, 1,
-0.07596276, 0.3033172, 0.9701424, 0, 1, 0.8196079, 1,
-0.07546306, -0.709456, -3.003046, 0, 1, 0.827451, 1,
-0.07319373, -0.3385587, -3.187672, 0, 1, 0.8313726, 1,
-0.0721489, -0.3462123, -2.898192, 0, 1, 0.8392157, 1,
-0.07102061, 0.2536531, -0.3064141, 0, 1, 0.8431373, 1,
-0.07067166, 0.2072637, -0.5021872, 0, 1, 0.8509804, 1,
-0.06891391, 0.607365, 0.132451, 0, 1, 0.854902, 1,
-0.06832474, -2.320595, -1.920528, 0, 1, 0.8627451, 1,
-0.06688958, -2.055136, -3.409207, 0, 1, 0.8666667, 1,
-0.06612728, -0.3712639, -1.065093, 0, 1, 0.8745098, 1,
-0.06232296, -0.4304407, -1.851717, 0, 1, 0.8784314, 1,
-0.05367403, 1.781685, -1.072561, 0, 1, 0.8862745, 1,
-0.04820056, 0.02894344, -1.692555, 0, 1, 0.8901961, 1,
-0.04658316, -0.1544332, -1.855923, 0, 1, 0.8980392, 1,
-0.04332916, -0.9187762, -1.621412, 0, 1, 0.9058824, 1,
-0.04296194, -0.2241059, -3.609048, 0, 1, 0.9098039, 1,
-0.04029204, 0.008989251, -0.3196923, 0, 1, 0.9176471, 1,
-0.04017927, 0.07021907, -0.05510274, 0, 1, 0.9215686, 1,
-0.03946613, -0.542896, -2.298228, 0, 1, 0.9294118, 1,
-0.03945542, -0.8339561, -3.0238, 0, 1, 0.9333333, 1,
-0.03832735, 0.1082386, -0.9543117, 0, 1, 0.9411765, 1,
-0.03559481, -0.3820463, -3.382743, 0, 1, 0.945098, 1,
-0.03441639, 0.6685779, 1.230876, 0, 1, 0.9529412, 1,
-0.03078364, 1.368868, -0.04592882, 0, 1, 0.9568627, 1,
-0.02801084, -0.4837989, -5.778001, 0, 1, 0.9647059, 1,
-0.02760585, -0.5173281, -4.382462, 0, 1, 0.9686275, 1,
-0.02608018, -0.01075437, -0.9579194, 0, 1, 0.9764706, 1,
-0.02117427, 1.03299, -0.08666174, 0, 1, 0.9803922, 1,
-0.0181326, 0.4374113, 0.3554468, 0, 1, 0.9882353, 1,
-0.01684708, -0.4742515, -3.473283, 0, 1, 0.9921569, 1,
-0.01662287, 0.2612211, -1.140385, 0, 1, 1, 1,
-0.009304404, -0.2355986, -3.253164, 0, 0.9921569, 1, 1,
-0.007668828, 1.35834, -0.4698342, 0, 0.9882353, 1, 1,
-0.00716753, 0.6922833, -0.7076274, 0, 0.9803922, 1, 1,
-0.004244276, 1.2197, -0.8863976, 0, 0.9764706, 1, 1,
-0.002896927, 1.362714, 0.9745207, 0, 0.9686275, 1, 1,
-0.002567672, 0.3739336, -0.3129317, 0, 0.9647059, 1, 1,
-0.002095689, 1.421185, 0.2722356, 0, 0.9568627, 1, 1,
-0.0001915992, 0.9371565, 0.9455732, 0, 0.9529412, 1, 1,
0.001484352, 1.701952, -0.02642446, 0, 0.945098, 1, 1,
0.001803299, 1.166057, 0.7011375, 0, 0.9411765, 1, 1,
0.004206012, -0.02253675, 2.004172, 0, 0.9333333, 1, 1,
0.004402123, 0.243692, 0.380849, 0, 0.9294118, 1, 1,
0.007376861, 0.3040016, -0.6287, 0, 0.9215686, 1, 1,
0.009038457, -0.008614055, 1.512232, 0, 0.9176471, 1, 1,
0.01234867, -1.258256, 2.981271, 0, 0.9098039, 1, 1,
0.0135981, -0.1069917, 3.312074, 0, 0.9058824, 1, 1,
0.01767496, -0.4962002, 3.257179, 0, 0.8980392, 1, 1,
0.02485747, 0.4647133, 1.143013, 0, 0.8901961, 1, 1,
0.0308997, 0.657778, 0.6937506, 0, 0.8862745, 1, 1,
0.03233007, -0.7385288, 4.46432, 0, 0.8784314, 1, 1,
0.03865198, -1.157573, 4.743183, 0, 0.8745098, 1, 1,
0.03975308, -1.155398, 3.218941, 0, 0.8666667, 1, 1,
0.04133842, -0.800265, 4.297994, 0, 0.8627451, 1, 1,
0.04739862, 2.030996, -0.8091797, 0, 0.854902, 1, 1,
0.04850942, -0.16261, 4.333507, 0, 0.8509804, 1, 1,
0.05140819, 0.1270009, 0.22195, 0, 0.8431373, 1, 1,
0.05188824, 0.8810423, -0.144025, 0, 0.8392157, 1, 1,
0.0538616, 0.1647132, 1.811489, 0, 0.8313726, 1, 1,
0.05507757, -3.081546, 5.058593, 0, 0.827451, 1, 1,
0.05690208, -1.739818, 2.235127, 0, 0.8196079, 1, 1,
0.06082805, 0.8977211, 1.082298, 0, 0.8156863, 1, 1,
0.06549668, -0.3676673, 4.035765, 0, 0.8078431, 1, 1,
0.06646305, -0.1291529, 0.07580355, 0, 0.8039216, 1, 1,
0.07033803, 2.641513, -0.2104918, 0, 0.7960784, 1, 1,
0.07338113, -1.698457, 2.033178, 0, 0.7882353, 1, 1,
0.07407309, -0.9617924, 3.552199, 0, 0.7843137, 1, 1,
0.07527979, -0.08732033, 2.99949, 0, 0.7764706, 1, 1,
0.07560133, 1.766883, 0.6084435, 0, 0.772549, 1, 1,
0.07653823, 0.5132499, 0.6846041, 0, 0.7647059, 1, 1,
0.07836579, 0.7036666, 1.644118, 0, 0.7607843, 1, 1,
0.07983159, 2.453083, 0.4718725, 0, 0.7529412, 1, 1,
0.08048842, -0.3505284, 2.078019, 0, 0.7490196, 1, 1,
0.08123846, -1.783591, 4.725013, 0, 0.7411765, 1, 1,
0.08138277, 0.4944016, -0.3035993, 0, 0.7372549, 1, 1,
0.08572991, -0.1158996, 2.659335, 0, 0.7294118, 1, 1,
0.08989147, 0.6089118, 0.2458209, 0, 0.7254902, 1, 1,
0.0901584, -0.5727275, 1.765448, 0, 0.7176471, 1, 1,
0.09078081, 1.23739, 0.7389498, 0, 0.7137255, 1, 1,
0.09135544, -1.541769, 3.085401, 0, 0.7058824, 1, 1,
0.09223475, 0.4780922, -0.1651234, 0, 0.6980392, 1, 1,
0.09452679, -0.2316205, 3.408904, 0, 0.6941177, 1, 1,
0.09465434, 1.723339, 0.06388754, 0, 0.6862745, 1, 1,
0.09626637, -0.2235808, 1.527923, 0, 0.682353, 1, 1,
0.09698533, -1.314224, 4.107895, 0, 0.6745098, 1, 1,
0.09770889, -0.2580056, 2.783823, 0, 0.6705883, 1, 1,
0.1018078, 0.7631066, -0.0513529, 0, 0.6627451, 1, 1,
0.1024365, -0.7503599, 4.561071, 0, 0.6588235, 1, 1,
0.1032114, -0.6368381, 2.714665, 0, 0.6509804, 1, 1,
0.1042248, 1.840851, -0.07446785, 0, 0.6470588, 1, 1,
0.1153272, -0.3730392, 3.805157, 0, 0.6392157, 1, 1,
0.1174386, 1.802846, -0.2501084, 0, 0.6352941, 1, 1,
0.1205907, -0.002656196, 0.5314735, 0, 0.627451, 1, 1,
0.1212742, 0.8109471, 1.72101, 0, 0.6235294, 1, 1,
0.1233332, 0.5098464, 0.03052479, 0, 0.6156863, 1, 1,
0.1279109, -1.079104, 3.673599, 0, 0.6117647, 1, 1,
0.1318339, 0.8575445, -0.4980921, 0, 0.6039216, 1, 1,
0.1344093, 0.0632392, 2.227768, 0, 0.5960785, 1, 1,
0.1398878, -2.050158, 2.601909, 0, 0.5921569, 1, 1,
0.1402884, 1.259425, -2.313122, 0, 0.5843138, 1, 1,
0.1413064, 0.3298326, -0.1358561, 0, 0.5803922, 1, 1,
0.143181, -1.333941, 2.109192, 0, 0.572549, 1, 1,
0.1441394, 0.2894316, 0.7260448, 0, 0.5686275, 1, 1,
0.1563664, 0.4433622, 0.03900755, 0, 0.5607843, 1, 1,
0.159218, 1.166203, 1.636976, 0, 0.5568628, 1, 1,
0.1724368, 0.4892468, 2.058624, 0, 0.5490196, 1, 1,
0.1730778, 0.7856711, 0.9216466, 0, 0.5450981, 1, 1,
0.1749254, -2.255717, 2.048978, 0, 0.5372549, 1, 1,
0.1754257, -1.083578, 3.580438, 0, 0.5333334, 1, 1,
0.1754989, -0.5757232, 3.765133, 0, 0.5254902, 1, 1,
0.1759582, 0.02471701, 0.6646792, 0, 0.5215687, 1, 1,
0.1770792, -1.317187, 3.73508, 0, 0.5137255, 1, 1,
0.1791054, 1.924698, 1.331847, 0, 0.509804, 1, 1,
0.1823167, 0.1112269, 2.129514, 0, 0.5019608, 1, 1,
0.185408, 0.06544353, 2.210022, 0, 0.4941176, 1, 1,
0.1876723, 0.139525, 0.1733547, 0, 0.4901961, 1, 1,
0.1878437, -1.380929, 2.174582, 0, 0.4823529, 1, 1,
0.1882058, 0.352026, 0.5236339, 0, 0.4784314, 1, 1,
0.191328, 1.046473, -0.2280441, 0, 0.4705882, 1, 1,
0.1918513, 1.157538, -1.060392, 0, 0.4666667, 1, 1,
0.1924477, -0.2865492, 1.196139, 0, 0.4588235, 1, 1,
0.1957461, 1.992168, 0.5932041, 0, 0.454902, 1, 1,
0.199353, 0.2993882, 0.3410854, 0, 0.4470588, 1, 1,
0.2034707, 0.609659, -0.1006569, 0, 0.4431373, 1, 1,
0.2057917, 0.8315486, 2.03953, 0, 0.4352941, 1, 1,
0.2084163, -0.7242006, 2.595623, 0, 0.4313726, 1, 1,
0.2104164, -1.091662, 2.507484, 0, 0.4235294, 1, 1,
0.2159057, 1.85579, 2.023804, 0, 0.4196078, 1, 1,
0.2206715, 0.624858, 0.9101821, 0, 0.4117647, 1, 1,
0.2273593, 0.8069431, 1.231013, 0, 0.4078431, 1, 1,
0.2286186, -0.7742497, 2.700809, 0, 0.4, 1, 1,
0.2347602, -0.5951988, 1.966479, 0, 0.3921569, 1, 1,
0.2358959, 1.192952, 0.05423049, 0, 0.3882353, 1, 1,
0.2367471, -1.4805, 4.124048, 0, 0.3803922, 1, 1,
0.2371007, -0.3430134, 1.695713, 0, 0.3764706, 1, 1,
0.2452614, -0.4414988, 2.545768, 0, 0.3686275, 1, 1,
0.2463629, 0.363743, 0.7167294, 0, 0.3647059, 1, 1,
0.2493488, -1.672196, 2.000161, 0, 0.3568628, 1, 1,
0.2538291, 0.1849399, 0.6234043, 0, 0.3529412, 1, 1,
0.2543759, 0.7415773, -0.3046007, 0, 0.345098, 1, 1,
0.2578833, -0.6852102, 0.8443461, 0, 0.3411765, 1, 1,
0.2593313, -0.5479913, 2.79709, 0, 0.3333333, 1, 1,
0.2607278, -0.01957881, 1.487499, 0, 0.3294118, 1, 1,
0.2716914, 1.541962, 1.415186, 0, 0.3215686, 1, 1,
0.2737605, 2.012667, -0.1612201, 0, 0.3176471, 1, 1,
0.2809578, -0.8144149, 2.310757, 0, 0.3098039, 1, 1,
0.2813111, -1.744214, 2.400886, 0, 0.3058824, 1, 1,
0.2858582, -0.8912951, 1.178401, 0, 0.2980392, 1, 1,
0.2959988, -0.3457631, 3.032767, 0, 0.2901961, 1, 1,
0.2960443, 0.3613513, 1.202011, 0, 0.2862745, 1, 1,
0.2971842, -0.6754474, 3.333888, 0, 0.2784314, 1, 1,
0.2975664, -0.9509081, 2.64279, 0, 0.2745098, 1, 1,
0.3019609, 0.8520656, 0.4954558, 0, 0.2666667, 1, 1,
0.3037606, 0.3978819, -0.7456662, 0, 0.2627451, 1, 1,
0.3051067, -1.395547, 2.51788, 0, 0.254902, 1, 1,
0.308725, -0.3421388, 3.41746, 0, 0.2509804, 1, 1,
0.3102382, 0.2329245, -0.02653783, 0, 0.2431373, 1, 1,
0.3122529, -1.192561, 1.918059, 0, 0.2392157, 1, 1,
0.314815, -0.3275943, 1.96996, 0, 0.2313726, 1, 1,
0.3168874, 0.6266301, 0.4531186, 0, 0.227451, 1, 1,
0.3174475, 0.1240246, -0.9560477, 0, 0.2196078, 1, 1,
0.3175929, -0.224544, 2.323609, 0, 0.2156863, 1, 1,
0.3196173, 0.6949476, -0.2654374, 0, 0.2078431, 1, 1,
0.3221107, -0.577924, 1.946502, 0, 0.2039216, 1, 1,
0.3224996, -1.235114, 4.166466, 0, 0.1960784, 1, 1,
0.3229315, -0.9662179, 2.454779, 0, 0.1882353, 1, 1,
0.3232117, -1.140647, 2.795898, 0, 0.1843137, 1, 1,
0.3265729, -2.603316, 2.973942, 0, 0.1764706, 1, 1,
0.3275261, 0.5130739, -0.1612606, 0, 0.172549, 1, 1,
0.3296733, -0.7728485, 3.912409, 0, 0.1647059, 1, 1,
0.330947, -0.3119216, 2.782801, 0, 0.1607843, 1, 1,
0.3333485, 0.1366608, 2.289818, 0, 0.1529412, 1, 1,
0.3363804, 0.1169259, 2.636427, 0, 0.1490196, 1, 1,
0.3397937, 1.387955, 1.58925, 0, 0.1411765, 1, 1,
0.3517473, -0.5301322, 1.163067, 0, 0.1372549, 1, 1,
0.3531829, -0.9636444, 2.615229, 0, 0.1294118, 1, 1,
0.3619306, -0.6014341, 3.375794, 0, 0.1254902, 1, 1,
0.3629434, 1.485961, -0.9569651, 0, 0.1176471, 1, 1,
0.3631694, 0.2082964, 1.519233, 0, 0.1137255, 1, 1,
0.3662691, 1.220621, 0.7201207, 0, 0.1058824, 1, 1,
0.366544, -0.3255176, 1.928529, 0, 0.09803922, 1, 1,
0.3782839, 0.3480601, 0.07788575, 0, 0.09411765, 1, 1,
0.3796746, 0.9940765, 0.2843112, 0, 0.08627451, 1, 1,
0.3806149, 0.1543632, 1.414392, 0, 0.08235294, 1, 1,
0.3843399, -2.126042, 2.342883, 0, 0.07450981, 1, 1,
0.3847063, -1.30629, 1.638287, 0, 0.07058824, 1, 1,
0.3854607, 0.03889138, 2.626415, 0, 0.0627451, 1, 1,
0.3864242, 0.5926445, 1.988027, 0, 0.05882353, 1, 1,
0.3893374, 0.02519319, 0.2643014, 0, 0.05098039, 1, 1,
0.3909951, 0.09658959, 0.5020071, 0, 0.04705882, 1, 1,
0.3913224, 1.029551, 0.3653772, 0, 0.03921569, 1, 1,
0.3919744, -0.3544015, 2.627349, 0, 0.03529412, 1, 1,
0.3944828, 0.07597911, 1.423524, 0, 0.02745098, 1, 1,
0.397891, 0.4550883, 0.1667304, 0, 0.02352941, 1, 1,
0.4026685, -1.093053, 3.400106, 0, 0.01568628, 1, 1,
0.4034927, -0.007942421, 1.374649, 0, 0.01176471, 1, 1,
0.4046012, 0.8459017, 0.6701275, 0, 0.003921569, 1, 1,
0.4117591, -0.5456042, 0.499319, 0.003921569, 0, 1, 1,
0.4176068, -1.025808, 3.693895, 0.007843138, 0, 1, 1,
0.4224936, -2.061087, 2.027348, 0.01568628, 0, 1, 1,
0.4243132, -1.179619, 3.688987, 0.01960784, 0, 1, 1,
0.4296402, 0.6943579, -0.05427888, 0.02745098, 0, 1, 1,
0.433127, -0.5793107, 2.51813, 0.03137255, 0, 1, 1,
0.4412524, -1.091116, 2.752005, 0.03921569, 0, 1, 1,
0.4426728, -0.08829721, 2.195292, 0.04313726, 0, 1, 1,
0.4443264, -1.069354, 3.381785, 0.05098039, 0, 1, 1,
0.4450622, -0.1028154, 1.913955, 0.05490196, 0, 1, 1,
0.4455647, 1.467546, 0.8580183, 0.0627451, 0, 1, 1,
0.4456247, 1.545393, 0.6490885, 0.06666667, 0, 1, 1,
0.4456456, -0.9168178, 2.876106, 0.07450981, 0, 1, 1,
0.4472417, -0.6183441, 2.419004, 0.07843138, 0, 1, 1,
0.4489272, 0.9084076, 0.6395326, 0.08627451, 0, 1, 1,
0.4518031, 2.029933, 2.142729, 0.09019608, 0, 1, 1,
0.4555122, -0.1597013, 1.994235, 0.09803922, 0, 1, 1,
0.4599031, 2.61474, 0.9102771, 0.1058824, 0, 1, 1,
0.4611138, -0.3203863, 3.682553, 0.1098039, 0, 1, 1,
0.4628569, -0.7962232, 2.350481, 0.1176471, 0, 1, 1,
0.4650263, 0.6382931, 0.1323358, 0.1215686, 0, 1, 1,
0.4706937, 0.6312144, 0.7397656, 0.1294118, 0, 1, 1,
0.4739648, 0.181049, 1.206579, 0.1333333, 0, 1, 1,
0.4747315, 0.7489874, 0.3360167, 0.1411765, 0, 1, 1,
0.4747882, -0.3395613, 3.616915, 0.145098, 0, 1, 1,
0.4779642, 0.04946348, 0.7823211, 0.1529412, 0, 1, 1,
0.4784093, -0.1620687, 0.08872806, 0.1568628, 0, 1, 1,
0.478681, -0.1124001, 2.80586, 0.1647059, 0, 1, 1,
0.4798369, 0.6361042, 0.6416328, 0.1686275, 0, 1, 1,
0.4809267, 0.2295882, 0.6839648, 0.1764706, 0, 1, 1,
0.4862792, 0.6586444, 1.732854, 0.1803922, 0, 1, 1,
0.4872194, -0.7725493, 1.740026, 0.1882353, 0, 1, 1,
0.4916251, 0.2170896, 2.016794, 0.1921569, 0, 1, 1,
0.4944204, -0.5134975, 1.472455, 0.2, 0, 1, 1,
0.4958153, -1.957192, 2.464472, 0.2078431, 0, 1, 1,
0.4964981, -0.07660528, 3.35552, 0.2117647, 0, 1, 1,
0.4969783, 0.07530295, -0.1576844, 0.2196078, 0, 1, 1,
0.4997384, 0.4103882, 1.59471, 0.2235294, 0, 1, 1,
0.501591, -0.3365501, 1.278972, 0.2313726, 0, 1, 1,
0.5094551, 0.3063014, 1.680516, 0.2352941, 0, 1, 1,
0.5112489, 1.89747, -0.1608382, 0.2431373, 0, 1, 1,
0.5142811, 0.815558, 0.151609, 0.2470588, 0, 1, 1,
0.5228847, -0.1050949, 1.525339, 0.254902, 0, 1, 1,
0.5246432, 1.850323, 1.223393, 0.2588235, 0, 1, 1,
0.5282128, 0.2359531, 2.304771, 0.2666667, 0, 1, 1,
0.5285598, 0.08365499, 1.650862, 0.2705882, 0, 1, 1,
0.5403637, -1.158991, 4.204935, 0.2784314, 0, 1, 1,
0.5404195, 0.4454068, 1.654535, 0.282353, 0, 1, 1,
0.5443335, 1.970751, -0.5214388, 0.2901961, 0, 1, 1,
0.548343, 0.8770327, 0.4511177, 0.2941177, 0, 1, 1,
0.5551239, 0.2092671, 0.174521, 0.3019608, 0, 1, 1,
0.5558643, -0.9184593, 2.478873, 0.3098039, 0, 1, 1,
0.5622082, -1.24636, 4.031313, 0.3137255, 0, 1, 1,
0.5626505, 0.91587, -0.6591324, 0.3215686, 0, 1, 1,
0.5637987, 0.9015301, 0.4124129, 0.3254902, 0, 1, 1,
0.5686176, -0.9151813, 4.011382, 0.3333333, 0, 1, 1,
0.5697654, -0.5601556, 3.069648, 0.3372549, 0, 1, 1,
0.5707463, -0.04075249, 0.4780523, 0.345098, 0, 1, 1,
0.5710717, 0.08324604, 0.828123, 0.3490196, 0, 1, 1,
0.5710935, -1.13477, 2.355064, 0.3568628, 0, 1, 1,
0.5716488, 0.05348877, 1.619068, 0.3607843, 0, 1, 1,
0.5716552, -1.089238, -0.1971592, 0.3686275, 0, 1, 1,
0.5721946, 0.3347863, 1.119955, 0.372549, 0, 1, 1,
0.5728586, 1.248857, 0.3829215, 0.3803922, 0, 1, 1,
0.5753916, 0.5054107, -0.3309484, 0.3843137, 0, 1, 1,
0.5802734, -0.5872893, 3.240361, 0.3921569, 0, 1, 1,
0.5868216, 1.3938, 0.3347118, 0.3960784, 0, 1, 1,
0.5885206, 0.1946519, 1.589106, 0.4039216, 0, 1, 1,
0.5913668, -1.470436, 4.323562, 0.4117647, 0, 1, 1,
0.5918642, -0.6637913, 2.286737, 0.4156863, 0, 1, 1,
0.5950844, 0.5579318, 1.415677, 0.4235294, 0, 1, 1,
0.5955324, 0.8690838, -0.2681307, 0.427451, 0, 1, 1,
0.6034431, -0.7361775, 2.381036, 0.4352941, 0, 1, 1,
0.610734, 1.213814, 0.8497679, 0.4392157, 0, 1, 1,
0.6115491, -0.1157042, 2.546045, 0.4470588, 0, 1, 1,
0.6124461, -0.2034135, 1.87503, 0.4509804, 0, 1, 1,
0.6147613, 2.82002, -0.2194127, 0.4588235, 0, 1, 1,
0.6190413, -0.3908223, 4.352761, 0.4627451, 0, 1, 1,
0.6193186, -2.523085, 1.944518, 0.4705882, 0, 1, 1,
0.6213054, -0.4572726, 1.854716, 0.4745098, 0, 1, 1,
0.6262057, -1.335411, 2.571168, 0.4823529, 0, 1, 1,
0.6286425, -1.203554, 2.95402, 0.4862745, 0, 1, 1,
0.6340046, -0.3963014, 1.288904, 0.4941176, 0, 1, 1,
0.640368, -0.71703, 2.501204, 0.5019608, 0, 1, 1,
0.6414242, 0.249834, 0.3727992, 0.5058824, 0, 1, 1,
0.6467414, 0.1236325, 1.521543, 0.5137255, 0, 1, 1,
0.647547, -0.2085748, 3.756786, 0.5176471, 0, 1, 1,
0.6522517, 0.5613123, 0.5084025, 0.5254902, 0, 1, 1,
0.6554227, -0.3459523, 3.090143, 0.5294118, 0, 1, 1,
0.664291, -0.7759656, 3.369144, 0.5372549, 0, 1, 1,
0.6661149, -1.029182, 2.911024, 0.5411765, 0, 1, 1,
0.6682424, -1.553675, 1.566726, 0.5490196, 0, 1, 1,
0.6734731, 3.043082, 0.08301466, 0.5529412, 0, 1, 1,
0.6761821, -0.1080123, 3.490316, 0.5607843, 0, 1, 1,
0.6768271, 0.4267182, 1.159765, 0.5647059, 0, 1, 1,
0.6768382, 1.052559, 0.3262936, 0.572549, 0, 1, 1,
0.6842131, -0.6893582, 1.973135, 0.5764706, 0, 1, 1,
0.6848949, -1.17228, 2.186432, 0.5843138, 0, 1, 1,
0.6850738, 0.3772442, 1.870012, 0.5882353, 0, 1, 1,
0.6878275, -1.456342, 2.201545, 0.5960785, 0, 1, 1,
0.6928685, -1.100499, 2.79084, 0.6039216, 0, 1, 1,
0.6996267, 0.7365483, 1.475889, 0.6078432, 0, 1, 1,
0.7120457, -0.6115996, 2.800454, 0.6156863, 0, 1, 1,
0.7139958, 1.652149, 0.6559216, 0.6196079, 0, 1, 1,
0.7146983, 0.09676562, 1.22345, 0.627451, 0, 1, 1,
0.7153926, 0.4954528, 1.396422, 0.6313726, 0, 1, 1,
0.7158089, -1.41726, 1.799629, 0.6392157, 0, 1, 1,
0.7162471, -1.663018, 4.175758, 0.6431373, 0, 1, 1,
0.7214975, 0.7186027, -0.7408201, 0.6509804, 0, 1, 1,
0.7268429, -0.5148387, 1.405959, 0.654902, 0, 1, 1,
0.7272184, 0.3244828, 0.003051436, 0.6627451, 0, 1, 1,
0.7306719, -0.1304483, 1.623742, 0.6666667, 0, 1, 1,
0.7310276, 0.5944163, -0.01306906, 0.6745098, 0, 1, 1,
0.7330739, -2.085129, 2.236967, 0.6784314, 0, 1, 1,
0.7340509, -0.1245986, 2.605907, 0.6862745, 0, 1, 1,
0.7368847, -1.276568, 2.256235, 0.6901961, 0, 1, 1,
0.7385345, 0.7649843, -0.9054368, 0.6980392, 0, 1, 1,
0.7387991, -0.3048543, 2.001955, 0.7058824, 0, 1, 1,
0.7418129, 0.7785872, 0.5908957, 0.7098039, 0, 1, 1,
0.7418569, 1.528699, 1.797658, 0.7176471, 0, 1, 1,
0.7423322, -0.2693645, 2.525508, 0.7215686, 0, 1, 1,
0.7444943, 1.293869, -0.09649464, 0.7294118, 0, 1, 1,
0.7465317, 0.3766377, -1.463498, 0.7333333, 0, 1, 1,
0.7583997, -1.051987, 2.395839, 0.7411765, 0, 1, 1,
0.7593865, 0.6907278, 2.884521, 0.7450981, 0, 1, 1,
0.775982, 0.6422293, 2.927875, 0.7529412, 0, 1, 1,
0.7767319, 0.5952909, 1.350293, 0.7568628, 0, 1, 1,
0.7790337, -0.978446, 3.177563, 0.7647059, 0, 1, 1,
0.7800278, -1.709238, 2.370246, 0.7686275, 0, 1, 1,
0.7816738, -0.1477061, 1.099663, 0.7764706, 0, 1, 1,
0.7827728, -0.2528761, 2.363972, 0.7803922, 0, 1, 1,
0.7841187, -1.443429, 2.241902, 0.7882353, 0, 1, 1,
0.7852883, -0.9963171, 1.699713, 0.7921569, 0, 1, 1,
0.7947694, 0.3750368, 0.7577574, 0.8, 0, 1, 1,
0.7949203, 0.006719617, 0.9560555, 0.8078431, 0, 1, 1,
0.7987299, -0.5305568, 3.001242, 0.8117647, 0, 1, 1,
0.8008, -0.6845032, 1.980654, 0.8196079, 0, 1, 1,
0.8086914, 0.59198, 1.022221, 0.8235294, 0, 1, 1,
0.8292161, 0.3426072, 2.99064, 0.8313726, 0, 1, 1,
0.8337584, 1.137238, -0.277472, 0.8352941, 0, 1, 1,
0.8413798, 1.324539, 1.711433, 0.8431373, 0, 1, 1,
0.8437136, 0.185456, 1.95883, 0.8470588, 0, 1, 1,
0.8469685, 1.318845, 0.5390636, 0.854902, 0, 1, 1,
0.8509176, -0.4748524, 2.031254, 0.8588235, 0, 1, 1,
0.8533873, -1.086968, 2.789303, 0.8666667, 0, 1, 1,
0.87826, -0.5845572, 3.194864, 0.8705882, 0, 1, 1,
0.8790862, 0.2837429, 1.709794, 0.8784314, 0, 1, 1,
0.9014258, -1.063147, 1.887712, 0.8823529, 0, 1, 1,
0.9015582, 0.4867132, 2.146794, 0.8901961, 0, 1, 1,
0.9060141, -0.5180338, 1.597597, 0.8941177, 0, 1, 1,
0.9078375, 1.105738, 0.7354845, 0.9019608, 0, 1, 1,
0.9102732, -0.6951271, 1.294378, 0.9098039, 0, 1, 1,
0.9119602, 0.2664559, 0.7816469, 0.9137255, 0, 1, 1,
0.9146493, 0.5070092, 1.482034, 0.9215686, 0, 1, 1,
0.9148574, -1.365016, 2.660541, 0.9254902, 0, 1, 1,
0.9225426, 0.2837824, 2.17895, 0.9333333, 0, 1, 1,
0.9235128, 0.2232048, 0.5828699, 0.9372549, 0, 1, 1,
0.9239792, -0.005278878, 2.167112, 0.945098, 0, 1, 1,
0.9277511, 0.03740258, 1.232767, 0.9490196, 0, 1, 1,
0.9357718, -1.631581, 3.157682, 0.9568627, 0, 1, 1,
0.9410033, -1.028224, 3.181341, 0.9607843, 0, 1, 1,
0.941542, -0.3620864, 1.765235, 0.9686275, 0, 1, 1,
0.9448674, 0.8169579, 1.502453, 0.972549, 0, 1, 1,
0.9453163, 1.203951, 1.704248, 0.9803922, 0, 1, 1,
0.9648702, -0.8600091, 3.707735, 0.9843137, 0, 1, 1,
0.9697301, 1.835442, 0.319351, 0.9921569, 0, 1, 1,
0.9719784, -0.3673849, 2.923822, 0.9960784, 0, 1, 1,
0.9758174, -1.857754, 3.284809, 1, 0, 0.9960784, 1,
0.9861376, -0.6061919, 1.382364, 1, 0, 0.9882353, 1,
0.9869173, -0.6953928, 2.521383, 1, 0, 0.9843137, 1,
0.9873727, 0.02077607, 1.673884, 1, 0, 0.9764706, 1,
0.9886868, -2.175517, 3.115195, 1, 0, 0.972549, 1,
0.995199, -0.1208894, 1.861383, 1, 0, 0.9647059, 1,
1.003055, -1.080867, 3.434102, 1, 0, 0.9607843, 1,
1.007788, 0.3030599, 2.395744, 1, 0, 0.9529412, 1,
1.01472, 0.4752743, 1.256849, 1, 0, 0.9490196, 1,
1.01681, -0.6291417, 2.691681, 1, 0, 0.9411765, 1,
1.017063, 0.5083328, 0.7842019, 1, 0, 0.9372549, 1,
1.019993, -0.4521531, 0.09375586, 1, 0, 0.9294118, 1,
1.021374, 0.5808328, 1.870399, 1, 0, 0.9254902, 1,
1.023814, -1.2928, 0.9628308, 1, 0, 0.9176471, 1,
1.028294, 0.5468859, 1.679154, 1, 0, 0.9137255, 1,
1.02962, 0.3441164, -0.04274843, 1, 0, 0.9058824, 1,
1.031484, 0.204008, 0.6801713, 1, 0, 0.9019608, 1,
1.037625, -0.6872629, 2.62562, 1, 0, 0.8941177, 1,
1.038325, -0.4337342, 1.474756, 1, 0, 0.8862745, 1,
1.044144, -2.586679, 3.040393, 1, 0, 0.8823529, 1,
1.046598, 1.633369, 0.5686309, 1, 0, 0.8745098, 1,
1.054361, 0.7487173, 0.275189, 1, 0, 0.8705882, 1,
1.055618, 0.00959442, 0.3444004, 1, 0, 0.8627451, 1,
1.057336, -0.08989932, 1.821341, 1, 0, 0.8588235, 1,
1.058595, 0.2902673, 0.1177711, 1, 0, 0.8509804, 1,
1.061944, -0.7615815, 3.998954, 1, 0, 0.8470588, 1,
1.065913, 0.3194427, 1.98608, 1, 0, 0.8392157, 1,
1.067054, 1.317839, 0.2223354, 1, 0, 0.8352941, 1,
1.06749, 1.084516, 0.5458176, 1, 0, 0.827451, 1,
1.073713, 0.6797003, 1.91338, 1, 0, 0.8235294, 1,
1.075387, -1.29231, 3.286636, 1, 0, 0.8156863, 1,
1.076742, 0.7026601, 2.313345, 1, 0, 0.8117647, 1,
1.077419, -0.1129126, 0.5103222, 1, 0, 0.8039216, 1,
1.08488, -0.3900627, 1.863238, 1, 0, 0.7960784, 1,
1.091181, -0.2831828, 3.709458, 1, 0, 0.7921569, 1,
1.096653, 0.3774573, 4.073412, 1, 0, 0.7843137, 1,
1.105265, -0.268406, 1.948178, 1, 0, 0.7803922, 1,
1.106057, 0.5289292, 0.5220676, 1, 0, 0.772549, 1,
1.106732, -0.3224456, 1.73111, 1, 0, 0.7686275, 1,
1.107314, -0.6454406, 3.657001, 1, 0, 0.7607843, 1,
1.107884, -0.2331664, 3.082765, 1, 0, 0.7568628, 1,
1.108463, 0.3647375, 3.050278, 1, 0, 0.7490196, 1,
1.111627, -0.314598, 2.054163, 1, 0, 0.7450981, 1,
1.116708, 0.5582368, -0.3295475, 1, 0, 0.7372549, 1,
1.130865, -0.150535, 2.964557, 1, 0, 0.7333333, 1,
1.130899, -0.2745501, 1.028608, 1, 0, 0.7254902, 1,
1.13265, 1.770176, 2.1587, 1, 0, 0.7215686, 1,
1.137745, 0.01160654, 1.347755, 1, 0, 0.7137255, 1,
1.149221, -2.003368, 1.397972, 1, 0, 0.7098039, 1,
1.153328, -0.8140543, 2.189243, 1, 0, 0.7019608, 1,
1.153702, 1.161722, 2.13544, 1, 0, 0.6941177, 1,
1.156901, -0.04382358, 1.37462, 1, 0, 0.6901961, 1,
1.159304, -0.4373155, 1.353793, 1, 0, 0.682353, 1,
1.160123, 0.2172631, -0.7123185, 1, 0, 0.6784314, 1,
1.1636, -0.7518004, 2.980606, 1, 0, 0.6705883, 1,
1.166826, 0.03225165, 0.951024, 1, 0, 0.6666667, 1,
1.167075, -0.2015795, 1.287026, 1, 0, 0.6588235, 1,
1.169917, 1.111417, 0.9470342, 1, 0, 0.654902, 1,
1.193758, -0.01884009, 3.55703, 1, 0, 0.6470588, 1,
1.202677, 1.421351, 0.2432483, 1, 0, 0.6431373, 1,
1.227097, -0.5644638, 1.14433, 1, 0, 0.6352941, 1,
1.228964, -1.509499, 2.873128, 1, 0, 0.6313726, 1,
1.234456, -0.5667259, 0.9060853, 1, 0, 0.6235294, 1,
1.236429, -2.706539, 1.520435, 1, 0, 0.6196079, 1,
1.239395, -0.9735333, 0.2369445, 1, 0, 0.6117647, 1,
1.254323, 0.4680677, 1.626995, 1, 0, 0.6078432, 1,
1.255677, 1.799891, 0.1219121, 1, 0, 0.6, 1,
1.256182, -1.157678, 2.610929, 1, 0, 0.5921569, 1,
1.257272, -0.4238377, 3.898948, 1, 0, 0.5882353, 1,
1.264338, -0.009078069, 3.118171, 1, 0, 0.5803922, 1,
1.267246, -0.6444483, 2.989379, 1, 0, 0.5764706, 1,
1.274691, -0.6050397, 1.381983, 1, 0, 0.5686275, 1,
1.28782, 0.649247, 2.327318, 1, 0, 0.5647059, 1,
1.294341, 1.825417, 0.8743076, 1, 0, 0.5568628, 1,
1.310663, 1.409691, -0.7291795, 1, 0, 0.5529412, 1,
1.313087, 1.960457, 1.027632, 1, 0, 0.5450981, 1,
1.324808, -0.8706646, 1.562715, 1, 0, 0.5411765, 1,
1.329851, -0.6344978, 2.176698, 1, 0, 0.5333334, 1,
1.329942, 0.3669397, -0.9285381, 1, 0, 0.5294118, 1,
1.332714, -0.8861995, 2.176867, 1, 0, 0.5215687, 1,
1.333816, 0.5537207, -0.1862841, 1, 0, 0.5176471, 1,
1.342539, 0.5709799, 0.0640843, 1, 0, 0.509804, 1,
1.346661, -0.06854017, -1.036628, 1, 0, 0.5058824, 1,
1.351909, -1.35726, 1.903054, 1, 0, 0.4980392, 1,
1.353059, 2.039954, -0.6926118, 1, 0, 0.4901961, 1,
1.354699, -0.9023349, 1.349927, 1, 0, 0.4862745, 1,
1.359534, -0.898312, 1.322916, 1, 0, 0.4784314, 1,
1.36304, 0.1736026, 1.872836, 1, 0, 0.4745098, 1,
1.367121, -0.3314657, 2.537381, 1, 0, 0.4666667, 1,
1.377071, -2.279207, 3.032733, 1, 0, 0.4627451, 1,
1.385205, 0.9083966, -0.2044895, 1, 0, 0.454902, 1,
1.393267, -0.559741, 2.99454, 1, 0, 0.4509804, 1,
1.393483, 2.028972, 0.4484743, 1, 0, 0.4431373, 1,
1.396887, 1.499959, 0.3939357, 1, 0, 0.4392157, 1,
1.399466, -1.088313, 0.5769193, 1, 0, 0.4313726, 1,
1.399809, 0.2967082, 2.83046, 1, 0, 0.427451, 1,
1.403959, 0.07361811, 2.439784, 1, 0, 0.4196078, 1,
1.406065, 0.9587646, 0.5315037, 1, 0, 0.4156863, 1,
1.418728, 1.76913, 1.540661, 1, 0, 0.4078431, 1,
1.425823, 2.132872, 2.081002, 1, 0, 0.4039216, 1,
1.428377, -0.2685116, 0.4482773, 1, 0, 0.3960784, 1,
1.440577, 0.4059136, 1.31507, 1, 0, 0.3882353, 1,
1.441316, 1.164381, 2.422792, 1, 0, 0.3843137, 1,
1.442972, -0.9361797, 2.906023, 1, 0, 0.3764706, 1,
1.476076, -0.5268455, 1.022457, 1, 0, 0.372549, 1,
1.482612, 1.518118, 0.294812, 1, 0, 0.3647059, 1,
1.49246, 1.131861, 0.01535995, 1, 0, 0.3607843, 1,
1.50151, 1.502083, 1.848461, 1, 0, 0.3529412, 1,
1.503154, -0.469604, -0.1570717, 1, 0, 0.3490196, 1,
1.50789, -0.7205634, 1.508907, 1, 0, 0.3411765, 1,
1.517746, -0.1209133, 0.8124329, 1, 0, 0.3372549, 1,
1.51961, -0.4349122, 0.8841183, 1, 0, 0.3294118, 1,
1.521315, 1.172126, -0.3292761, 1, 0, 0.3254902, 1,
1.545271, -0.1732551, 0.8653803, 1, 0, 0.3176471, 1,
1.553062, 0.07181013, 1.43203, 1, 0, 0.3137255, 1,
1.558587, -0.9152368, 1.534946, 1, 0, 0.3058824, 1,
1.579851, -1.083192, 3.275903, 1, 0, 0.2980392, 1,
1.585916, -0.3213311, -0.5910857, 1, 0, 0.2941177, 1,
1.615306, -1.71975, 1.937656, 1, 0, 0.2862745, 1,
1.637554, -1.249709, 1.491759, 1, 0, 0.282353, 1,
1.648572, -3.996043, 2.661894, 1, 0, 0.2745098, 1,
1.665182, -0.2971906, 1.392641, 1, 0, 0.2705882, 1,
1.671018, -1.166653, 1.559734, 1, 0, 0.2627451, 1,
1.671045, 1.312784, 1.429981, 1, 0, 0.2588235, 1,
1.689116, 0.4431372, 1.591159, 1, 0, 0.2509804, 1,
1.711463, -0.5037063, 2.443092, 1, 0, 0.2470588, 1,
1.72896, -0.6353586, 2.258105, 1, 0, 0.2392157, 1,
1.736591, -0.7967673, 2.449884, 1, 0, 0.2352941, 1,
1.742925, -0.3712496, 1.847573, 1, 0, 0.227451, 1,
1.755279, 1.595682, 1.149032, 1, 0, 0.2235294, 1,
1.771447, -0.3494269, 1.613016, 1, 0, 0.2156863, 1,
1.777811, -0.05290868, 0.5816085, 1, 0, 0.2117647, 1,
1.801875, 0.04123856, 2.30112, 1, 0, 0.2039216, 1,
1.802374, 0.8594289, 0.8447384, 1, 0, 0.1960784, 1,
1.810042, -0.8127634, 1.351476, 1, 0, 0.1921569, 1,
1.811459, -2.094329, 4.434036, 1, 0, 0.1843137, 1,
1.835554, -0.7515383, 0.3606168, 1, 0, 0.1803922, 1,
1.844057, -2.809943, 4.255888, 1, 0, 0.172549, 1,
1.869678, -0.215203, 2.968053, 1, 0, 0.1686275, 1,
1.884188, -0.7523819, 2.141818, 1, 0, 0.1607843, 1,
1.890515, 2.280889, 1.493149, 1, 0, 0.1568628, 1,
1.909799, -0.09315178, 0.6434932, 1, 0, 0.1490196, 1,
1.933637, -1.055265, 2.667285, 1, 0, 0.145098, 1,
1.934751, 1.285766, -1.290311, 1, 0, 0.1372549, 1,
1.938622, -0.7712653, 2.914374, 1, 0, 0.1333333, 1,
1.96073, 0.3573845, 1.419818, 1, 0, 0.1254902, 1,
1.993766, -1.091431, 1.867257, 1, 0, 0.1215686, 1,
2.064957, -1.502075, 1.958264, 1, 0, 0.1137255, 1,
2.073716, -0.3773334, 0.9509462, 1, 0, 0.1098039, 1,
2.07932, -0.3481801, 2.855114, 1, 0, 0.1019608, 1,
2.089256, -1.816865, 2.099431, 1, 0, 0.09411765, 1,
2.151993, 0.1473971, 0.7004367, 1, 0, 0.09019608, 1,
2.216929, -0.9359214, 2.463119, 1, 0, 0.08235294, 1,
2.22009, -0.09383294, 1.093311, 1, 0, 0.07843138, 1,
2.236317, 0.7461638, 1.533789, 1, 0, 0.07058824, 1,
2.262816, -0.2992103, 1.850492, 1, 0, 0.06666667, 1,
2.268004, 0.1917436, 3.222485, 1, 0, 0.05882353, 1,
2.326363, 0.9005281, 2.98097, 1, 0, 0.05490196, 1,
2.380453, 0.2216424, -0.00383169, 1, 0, 0.04705882, 1,
2.406876, 0.005693609, 0.5334073, 1, 0, 0.04313726, 1,
2.574109, 1.061271, 0.9574562, 1, 0, 0.03529412, 1,
2.587783, -0.1872885, 1.255701, 1, 0, 0.03137255, 1,
2.770983, 0.06792951, 1.601817, 1, 0, 0.02352941, 1,
2.78575, 1.958932, 3.166046, 1, 0, 0.01960784, 1,
2.934825, -0.1146335, 2.376976, 1, 0, 0.01176471, 1,
3.614542, -0.8053716, 1.134618, 1, 0, 0.007843138, 1
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
0.259392, -5.189175, -7.614804, 0, -0.5, 0.5, 0.5,
0.259392, -5.189175, -7.614804, 1, -0.5, 0.5, 0.5,
0.259392, -5.189175, -7.614804, 1, 1.5, 0.5, 0.5,
0.259392, -5.189175, -7.614804, 0, 1.5, 0.5, 0.5
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
-4.233154, -0.4764805, -7.614804, 0, -0.5, 0.5, 0.5,
-4.233154, -0.4764805, -7.614804, 1, -0.5, 0.5, 0.5,
-4.233154, -0.4764805, -7.614804, 1, 1.5, 0.5, 0.5,
-4.233154, -0.4764805, -7.614804, 0, 1.5, 0.5, 0.5
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
-4.233154, -5.189175, -0.3597043, 0, -0.5, 0.5, 0.5,
-4.233154, -5.189175, -0.3597043, 1, -0.5, 0.5, 0.5,
-4.233154, -5.189175, -0.3597043, 1, 1.5, 0.5, 0.5,
-4.233154, -5.189175, -0.3597043, 0, 1.5, 0.5, 0.5
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
-3, -4.10163, -5.94055,
3, -4.10163, -5.94055,
-3, -4.10163, -5.94055,
-3, -4.282888, -6.219593,
-2, -4.10163, -5.94055,
-2, -4.282888, -6.219593,
-1, -4.10163, -5.94055,
-1, -4.282888, -6.219593,
0, -4.10163, -5.94055,
0, -4.282888, -6.219593,
1, -4.10163, -5.94055,
1, -4.282888, -6.219593,
2, -4.10163, -5.94055,
2, -4.282888, -6.219593,
3, -4.10163, -5.94055,
3, -4.282888, -6.219593
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
-3, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
-3, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
-3, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
-3, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
-2, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
-2, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
-2, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
-2, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
-1, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
-1, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
-1, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
-1, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
0, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
0, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
0, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
0, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
1, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
1, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
1, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
1, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
2, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
2, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
2, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
2, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5,
3, -4.645403, -6.777677, 0, -0.5, 0.5, 0.5,
3, -4.645403, -6.777677, 1, -0.5, 0.5, 0.5,
3, -4.645403, -6.777677, 1, 1.5, 0.5, 0.5,
3, -4.645403, -6.777677, 0, 1.5, 0.5, 0.5
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
-3.196413, -2, -5.94055,
-3.196413, 2, -5.94055,
-3.196413, -2, -5.94055,
-3.369203, -2, -6.219593,
-3.196413, 0, -5.94055,
-3.369203, 0, -6.219593,
-3.196413, 2, -5.94055,
-3.369203, 2, -6.219593
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
-3.714783, -2, -6.777677, 0, -0.5, 0.5, 0.5,
-3.714783, -2, -6.777677, 1, -0.5, 0.5, 0.5,
-3.714783, -2, -6.777677, 1, 1.5, 0.5, 0.5,
-3.714783, -2, -6.777677, 0, 1.5, 0.5, 0.5,
-3.714783, 0, -6.777677, 0, -0.5, 0.5, 0.5,
-3.714783, 0, -6.777677, 1, -0.5, 0.5, 0.5,
-3.714783, 0, -6.777677, 1, 1.5, 0.5, 0.5,
-3.714783, 0, -6.777677, 0, 1.5, 0.5, 0.5,
-3.714783, 2, -6.777677, 0, -0.5, 0.5, 0.5,
-3.714783, 2, -6.777677, 1, -0.5, 0.5, 0.5,
-3.714783, 2, -6.777677, 1, 1.5, 0.5, 0.5,
-3.714783, 2, -6.777677, 0, 1.5, 0.5, 0.5
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
-3.196413, -4.10163, -4,
-3.196413, -4.10163, 4,
-3.196413, -4.10163, -4,
-3.369203, -4.282888, -4,
-3.196413, -4.10163, -2,
-3.369203, -4.282888, -2,
-3.196413, -4.10163, 0,
-3.369203, -4.282888, 0,
-3.196413, -4.10163, 2,
-3.369203, -4.282888, 2,
-3.196413, -4.10163, 4,
-3.369203, -4.282888, 4
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
-3.714783, -4.645403, -4, 0, -0.5, 0.5, 0.5,
-3.714783, -4.645403, -4, 1, -0.5, 0.5, 0.5,
-3.714783, -4.645403, -4, 1, 1.5, 0.5, 0.5,
-3.714783, -4.645403, -4, 0, 1.5, 0.5, 0.5,
-3.714783, -4.645403, -2, 0, -0.5, 0.5, 0.5,
-3.714783, -4.645403, -2, 1, -0.5, 0.5, 0.5,
-3.714783, -4.645403, -2, 1, 1.5, 0.5, 0.5,
-3.714783, -4.645403, -2, 0, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 0, 0, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 0, 1, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 0, 1, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 0, 0, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 2, 0, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 2, 1, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 2, 1, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 2, 0, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 4, 0, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 4, 1, -0.5, 0.5, 0.5,
-3.714783, -4.645403, 4, 1, 1.5, 0.5, 0.5,
-3.714783, -4.645403, 4, 0, 1.5, 0.5, 0.5
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
-3.196413, -4.10163, -5.94055,
-3.196413, 3.148669, -5.94055,
-3.196413, -4.10163, 5.221142,
-3.196413, 3.148669, 5.221142,
-3.196413, -4.10163, -5.94055,
-3.196413, -4.10163, 5.221142,
-3.196413, 3.148669, -5.94055,
-3.196413, 3.148669, 5.221142,
-3.196413, -4.10163, -5.94055,
3.715197, -4.10163, -5.94055,
-3.196413, -4.10163, 5.221142,
3.715197, -4.10163, 5.221142,
-3.196413, 3.148669, -5.94055,
3.715197, 3.148669, -5.94055,
-3.196413, 3.148669, 5.221142,
3.715197, 3.148669, 5.221142,
3.715197, -4.10163, -5.94055,
3.715197, 3.148669, -5.94055,
3.715197, -4.10163, 5.221142,
3.715197, 3.148669, 5.221142,
3.715197, -4.10163, -5.94055,
3.715197, -4.10163, 5.221142,
3.715197, 3.148669, -5.94055,
3.715197, 3.148669, 5.221142
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
var radius = 8.008295;
var distance = 35.62981;
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
mvMatrix.translate( -0.259392, 0.4764805, 0.3597043 );
mvMatrix.scale( 1.25278, 1.194257, 0.7757538 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62981);
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
etobenzanid<-read.table("etobenzanid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-etobenzanid$V2
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
```

```r
y<-etobenzanid$V3
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
```

```r
z<-etobenzanid$V4
```

```
## Error in eval(expr, envir, enclos): object 'etobenzanid' not found
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
-3.095758, -1.959146, -3.840727, 0, 0, 1, 1, 1,
-3.081149, 0.86814, -0.6638597, 1, 0, 0, 1, 1,
-2.921712, 0.2809999, -1.367113, 1, 0, 0, 1, 1,
-2.692913, 0.6868728, -1.395398, 1, 0, 0, 1, 1,
-2.678068, 0.1748677, -0.3108975, 1, 0, 0, 1, 1,
-2.469196, 1.177743, -1.364039, 1, 0, 0, 1, 1,
-2.433855, -0.3115084, -0.3665813, 0, 0, 0, 1, 1,
-2.427605, -1.451339, -3.420401, 0, 0, 0, 1, 1,
-2.407647, 0.3095838, -1.691568, 0, 0, 0, 1, 1,
-2.380978, -0.632565, -1.248495, 0, 0, 0, 1, 1,
-2.376431, 0.1485011, -2.431417, 0, 0, 0, 1, 1,
-2.335887, -0.5532781, -1.660379, 0, 0, 0, 1, 1,
-2.217229, -1.068548, -1.18221, 0, 0, 0, 1, 1,
-2.215602, -0.8481623, -4.0542, 1, 1, 1, 1, 1,
-2.195471, 0.4865024, -1.195622, 1, 1, 1, 1, 1,
-2.091921, -0.3097965, -2.121697, 1, 1, 1, 1, 1,
-2.060096, 0.2364801, -1.023361, 1, 1, 1, 1, 1,
-2.05353, 0.2587242, 0.8398345, 1, 1, 1, 1, 1,
-2.032571, 1.130723, -0.7587295, 1, 1, 1, 1, 1,
-2.028991, -0.2238169, -0.5009702, 1, 1, 1, 1, 1,
-1.988305, 0.6552082, -0.9639735, 1, 1, 1, 1, 1,
-1.960943, 0.5370384, 0.2561038, 1, 1, 1, 1, 1,
-1.958376, 1.444266, 1.243294, 1, 1, 1, 1, 1,
-1.935868, 1.136729, -0.6415285, 1, 1, 1, 1, 1,
-1.91917, -0.9427418, -0.9970188, 1, 1, 1, 1, 1,
-1.902801, -0.7909727, -0.8924265, 1, 1, 1, 1, 1,
-1.883956, -0.3759401, -2.623947, 1, 1, 1, 1, 1,
-1.8643, 0.1157232, -2.179354, 1, 1, 1, 1, 1,
-1.860577, 1.740283, -0.7320685, 0, 0, 1, 1, 1,
-1.827692, -1.589908, -3.070009, 1, 0, 0, 1, 1,
-1.814872, 0.7647915, 0.8075067, 1, 0, 0, 1, 1,
-1.789338, -0.642978, -0.5438349, 1, 0, 0, 1, 1,
-1.775887, 0.5577164, -2.321342, 1, 0, 0, 1, 1,
-1.769588, -0.04006041, -2.998953, 1, 0, 0, 1, 1,
-1.726356, 0.696875, -1.272353, 0, 0, 0, 1, 1,
-1.721705, -0.01471523, -1.519622, 0, 0, 0, 1, 1,
-1.720677, -0.5345836, -1.407636, 0, 0, 0, 1, 1,
-1.701475, 0.3755012, -1.308242, 0, 0, 0, 1, 1,
-1.700254, -2.148718, -2.971617, 0, 0, 0, 1, 1,
-1.679493, 0.5762713, -1.700998, 0, 0, 0, 1, 1,
-1.659191, -1.850008, -3.55388, 0, 0, 0, 1, 1,
-1.654561, -0.670445, -1.926069, 1, 1, 1, 1, 1,
-1.652477, -0.9771107, -2.066617, 1, 1, 1, 1, 1,
-1.651194, 0.6628208, -1.893516, 1, 1, 1, 1, 1,
-1.650259, -0.271105, -1.98536, 1, 1, 1, 1, 1,
-1.644644, -0.6728994, -2.236814, 1, 1, 1, 1, 1,
-1.643611, 0.6128556, -1.953938, 1, 1, 1, 1, 1,
-1.634719, -0.1892529, -2.202918, 1, 1, 1, 1, 1,
-1.629774, -1.893086, -1.49881, 1, 1, 1, 1, 1,
-1.628337, 1.204014, -0.4958372, 1, 1, 1, 1, 1,
-1.625041, -1.206444, -3.496166, 1, 1, 1, 1, 1,
-1.615448, 1.648377, -0.6321335, 1, 1, 1, 1, 1,
-1.607195, -0.2378616, -3.138136, 1, 1, 1, 1, 1,
-1.58681, -0.8469452, -4.631325, 1, 1, 1, 1, 1,
-1.583063, -1.22199, -0.8952767, 1, 1, 1, 1, 1,
-1.580855, 0.3266204, -1.266679, 1, 1, 1, 1, 1,
-1.580107, 1.939588, 0.8842739, 0, 0, 1, 1, 1,
-1.567506, -0.1642099, -0.9572118, 1, 0, 0, 1, 1,
-1.565579, 0.04206319, -2.220118, 1, 0, 0, 1, 1,
-1.558221, 0.8883047, 0.2067639, 1, 0, 0, 1, 1,
-1.549298, 0.9642737, -2.592095, 1, 0, 0, 1, 1,
-1.53862, 0.5168954, -0.6197006, 1, 0, 0, 1, 1,
-1.538532, -0.5922049, -1.474685, 0, 0, 0, 1, 1,
-1.518472, -0.1364059, -2.494581, 0, 0, 0, 1, 1,
-1.50901, 0.7197819, -1.868663, 0, 0, 0, 1, 1,
-1.508495, 0.7500371, 0.6261457, 0, 0, 0, 1, 1,
-1.505864, 0.6203028, -2.618486, 0, 0, 0, 1, 1,
-1.505284, 0.07883733, -0.4138274, 0, 0, 0, 1, 1,
-1.504163, -0.7307464, -1.329919, 0, 0, 0, 1, 1,
-1.501637, -0.2766119, 1.666446, 1, 1, 1, 1, 1,
-1.497482, -0.6350427, -1.203211, 1, 1, 1, 1, 1,
-1.494248, -0.9915746, -2.748564, 1, 1, 1, 1, 1,
-1.481724, -0.3167616, 1.298772, 1, 1, 1, 1, 1,
-1.481409, 0.5995796, -1.072266, 1, 1, 1, 1, 1,
-1.476267, -0.03104464, -1.307274, 1, 1, 1, 1, 1,
-1.457824, 1.968998, -1.584767, 1, 1, 1, 1, 1,
-1.457248, -0.7453594, -0.5546805, 1, 1, 1, 1, 1,
-1.448044, -0.1620022, -2.662126, 1, 1, 1, 1, 1,
-1.440659, 0.7743824, 0.07345127, 1, 1, 1, 1, 1,
-1.432879, 0.6174887, -1.285671, 1, 1, 1, 1, 1,
-1.43253, -0.1163841, -0.4675441, 1, 1, 1, 1, 1,
-1.432125, -2.51336, -1.576971, 1, 1, 1, 1, 1,
-1.422369, -1.5574, -3.938303, 1, 1, 1, 1, 1,
-1.419695, -0.4406464, -1.966749, 1, 1, 1, 1, 1,
-1.399083, 1.231808, -1.284719, 0, 0, 1, 1, 1,
-1.39337, 0.3511533, -1.789902, 1, 0, 0, 1, 1,
-1.390522, -0.001194693, -2.129509, 1, 0, 0, 1, 1,
-1.389286, 0.6801947, -0.8614681, 1, 0, 0, 1, 1,
-1.374427, -0.6171534, -2.231223, 1, 0, 0, 1, 1,
-1.365628, 0.2472904, -0.5851918, 1, 0, 0, 1, 1,
-1.360531, -0.6919894, -1.138133, 0, 0, 0, 1, 1,
-1.348048, -0.2131977, -2.23021, 0, 0, 0, 1, 1,
-1.347007, 0.3151745, -1.594141, 0, 0, 0, 1, 1,
-1.340006, 0.4422612, -1.487356, 0, 0, 0, 1, 1,
-1.338473, -0.4993598, -2.102585, 0, 0, 0, 1, 1,
-1.33328, 1.424163, 0.4872647, 0, 0, 0, 1, 1,
-1.323415, -0.1817062, -2.081802, 0, 0, 0, 1, 1,
-1.321821, -0.07133344, -1.952958, 1, 1, 1, 1, 1,
-1.321075, 1.086347, -1.658589, 1, 1, 1, 1, 1,
-1.320602, -0.08640429, -1.361159, 1, 1, 1, 1, 1,
-1.319024, -0.3702983, -3.085825, 1, 1, 1, 1, 1,
-1.318131, 2.238371, -0.06499975, 1, 1, 1, 1, 1,
-1.316041, 2.137127, 2.009251, 1, 1, 1, 1, 1,
-1.309128, -0.3501259, -2.409953, 1, 1, 1, 1, 1,
-1.306643, -0.4498557, -1.920384, 1, 1, 1, 1, 1,
-1.300118, -0.3516442, -1.76862, 1, 1, 1, 1, 1,
-1.298536, -0.4159596, -1.181847, 1, 1, 1, 1, 1,
-1.295604, -0.2138705, -3.379175, 1, 1, 1, 1, 1,
-1.285402, 0.004934323, 0.5885708, 1, 1, 1, 1, 1,
-1.284074, -0.5106612, -1.949545, 1, 1, 1, 1, 1,
-1.269601, 1.19259, -0.2990337, 1, 1, 1, 1, 1,
-1.267896, 0.5604478, -0.8169525, 1, 1, 1, 1, 1,
-1.265807, 0.03813611, -1.25173, 0, 0, 1, 1, 1,
-1.264847, -1.115971, -1.121883, 1, 0, 0, 1, 1,
-1.262418, 2.561197, -0.6551201, 1, 0, 0, 1, 1,
-1.261899, 0.0529548, -0.5157759, 1, 0, 0, 1, 1,
-1.241544, -1.056805, -2.773764, 1, 0, 0, 1, 1,
-1.241433, -0.9271336, -0.9960192, 1, 0, 0, 1, 1,
-1.240742, -0.880778, -3.029888, 0, 0, 0, 1, 1,
-1.238249, 0.3925892, -1.241032, 0, 0, 0, 1, 1,
-1.23761, 0.2484329, -0.9596839, 0, 0, 0, 1, 1,
-1.234245, 0.1015283, -2.461368, 0, 0, 0, 1, 1,
-1.207823, -0.558467, -3.28283, 0, 0, 0, 1, 1,
-1.207348, -0.2432527, -2.050506, 0, 0, 0, 1, 1,
-1.206367, 0.6072457, -3.0157, 0, 0, 0, 1, 1,
-1.206182, -0.303953, -1.659927, 1, 1, 1, 1, 1,
-1.205898, -0.771558, -3.227692, 1, 1, 1, 1, 1,
-1.202733, 0.3280383, -0.5561613, 1, 1, 1, 1, 1,
-1.198219, 0.6155478, -1.862389, 1, 1, 1, 1, 1,
-1.184079, -1.417101, -1.78367, 1, 1, 1, 1, 1,
-1.182753, 1.290689, -0.5222906, 1, 1, 1, 1, 1,
-1.18193, -0.9901129, -1.223953, 1, 1, 1, 1, 1,
-1.178136, 1.182418, 0.9490076, 1, 1, 1, 1, 1,
-1.164414, 1.433735, -2.455858, 1, 1, 1, 1, 1,
-1.154958, -0.03165389, -1.808745, 1, 1, 1, 1, 1,
-1.153775, -0.6259617, -1.873069, 1, 1, 1, 1, 1,
-1.152101, -0.8888063, -3.544171, 1, 1, 1, 1, 1,
-1.144832, -1.170041, -3.661355, 1, 1, 1, 1, 1,
-1.143458, -0.1411695, -2.273656, 1, 1, 1, 1, 1,
-1.129455, -0.8697348, -2.002398, 1, 1, 1, 1, 1,
-1.129086, 0.1234593, -2.282315, 0, 0, 1, 1, 1,
-1.125152, 0.3640089, 0.5768965, 1, 0, 0, 1, 1,
-1.122705, -0.9869691, -1.891318, 1, 0, 0, 1, 1,
-1.119659, 0.7586015, -1.548785, 1, 0, 0, 1, 1,
-1.117911, -1.948105, -3.29385, 1, 0, 0, 1, 1,
-1.113695, -0.5850674, -0.7384349, 1, 0, 0, 1, 1,
-1.10998, 0.2893089, -0.7350165, 0, 0, 0, 1, 1,
-1.105534, -1.114978, -3.684381, 0, 0, 0, 1, 1,
-1.096978, -0.5771817, 0.002612018, 0, 0, 0, 1, 1,
-1.09681, 0.2152444, -2.917741, 0, 0, 0, 1, 1,
-1.094634, 0.551647, -0.4108627, 0, 0, 0, 1, 1,
-1.085821, 2.391399, -0.1570431, 0, 0, 0, 1, 1,
-1.083801, -0.1550594, -1.800387, 0, 0, 0, 1, 1,
-1.072593, 1.022961, -0.7040864, 1, 1, 1, 1, 1,
-1.064888, -0.452937, -5.104896, 1, 1, 1, 1, 1,
-1.062286, 0.8081841, -1.130638, 1, 1, 1, 1, 1,
-1.060883, -0.3213587, -1.320568, 1, 1, 1, 1, 1,
-1.060554, 1.993868, -0.2136729, 1, 1, 1, 1, 1,
-1.058614, -0.9704672, -2.990618, 1, 1, 1, 1, 1,
-1.045457, -0.9697046, -2.992019, 1, 1, 1, 1, 1,
-1.030014, 1.775907, -1.148408, 1, 1, 1, 1, 1,
-1.026396, 2.084741, -1.240861, 1, 1, 1, 1, 1,
-1.025372, -1.97949, -3.063176, 1, 1, 1, 1, 1,
-1.02255, -0.7564817, -3.049159, 1, 1, 1, 1, 1,
-1.020507, -2.803988, -0.9067786, 1, 1, 1, 1, 1,
-1.019322, 0.1200125, -0.2386153, 1, 1, 1, 1, 1,
-1.010613, 0.4746241, -1.890093, 1, 1, 1, 1, 1,
-1.0086, 1.731489, -0.2977069, 1, 1, 1, 1, 1,
-1.002646, 0.4690585, -0.8122649, 0, 0, 1, 1, 1,
-0.9974867, 0.1580174, -0.6811341, 1, 0, 0, 1, 1,
-0.9912444, 0.8171806, -0.01530513, 1, 0, 0, 1, 1,
-0.9878587, 0.5003833, -0.5306075, 1, 0, 0, 1, 1,
-0.9857556, -1.476944, -2.709314, 1, 0, 0, 1, 1,
-0.980399, 1.737807, -0.9821393, 1, 0, 0, 1, 1,
-0.9771281, 0.7373126, 0.4928223, 0, 0, 0, 1, 1,
-0.974812, 0.4740331, -1.743763, 0, 0, 0, 1, 1,
-0.9659681, -0.1440762, -0.9609475, 0, 0, 0, 1, 1,
-0.9656765, -0.5017937, -1.106266, 0, 0, 0, 1, 1,
-0.9557729, 1.373279, -2.057809, 0, 0, 0, 1, 1,
-0.9488708, -0.1420042, -2.247656, 0, 0, 0, 1, 1,
-0.9440776, -1.640643, -3.054815, 0, 0, 0, 1, 1,
-0.9408062, 0.4084993, -1.083704, 1, 1, 1, 1, 1,
-0.9343837, 0.3644902, -1.033772, 1, 1, 1, 1, 1,
-0.934014, 0.1944233, -0.3821356, 1, 1, 1, 1, 1,
-0.9306889, 1.192034, 0.2101282, 1, 1, 1, 1, 1,
-0.9214101, -1.256992, -1.566881, 1, 1, 1, 1, 1,
-0.916633, -0.4837958, -2.527482, 1, 1, 1, 1, 1,
-0.9141176, 0.01160595, -1.294792, 1, 1, 1, 1, 1,
-0.9041852, -0.8678481, -2.971781, 1, 1, 1, 1, 1,
-0.9014734, -1.396532, -3.362467, 1, 1, 1, 1, 1,
-0.9013515, -0.5663733, -3.52023, 1, 1, 1, 1, 1,
-0.8994011, -1.493785, -3.519876, 1, 1, 1, 1, 1,
-0.8939355, -1.741804, -3.346488, 1, 1, 1, 1, 1,
-0.8909369, -2.097277, -3.959828, 1, 1, 1, 1, 1,
-0.8892462, 0.7662591, -0.2499663, 1, 1, 1, 1, 1,
-0.8867101, 0.2438614, -0.8348501, 1, 1, 1, 1, 1,
-0.8866983, 0.07827027, -3.604944, 0, 0, 1, 1, 1,
-0.8621426, -0.3884339, -3.212183, 1, 0, 0, 1, 1,
-0.857187, -1.714422, -1.632318, 1, 0, 0, 1, 1,
-0.8556439, -0.118124, -2.666871, 1, 0, 0, 1, 1,
-0.8495932, -1.44847, -2.448405, 1, 0, 0, 1, 1,
-0.8490018, -0.08100924, -1.33839, 1, 0, 0, 1, 1,
-0.8325107, 1.088853, -0.6033591, 0, 0, 0, 1, 1,
-0.8256226, -0.4322368, -2.066889, 0, 0, 0, 1, 1,
-0.8109873, 0.6529119, -1.72359, 0, 0, 0, 1, 1,
-0.8077078, 0.5930624, -0.7110856, 0, 0, 0, 1, 1,
-0.803347, 0.7132017, -0.9692991, 0, 0, 0, 1, 1,
-0.7920666, 0.3591453, 1.354407, 0, 0, 0, 1, 1,
-0.789066, -0.2134104, -0.7982444, 0, 0, 0, 1, 1,
-0.7847929, -1.509469, -5.274838, 1, 1, 1, 1, 1,
-0.7847319, 0.1269769, -1.476616, 1, 1, 1, 1, 1,
-0.7845718, -1.279999, -2.746053, 1, 1, 1, 1, 1,
-0.7791654, -0.350869, -2.22551, 1, 1, 1, 1, 1,
-0.7754491, -1.496627, -3.058772, 1, 1, 1, 1, 1,
-0.7720483, 0.01247775, -0.4940585, 1, 1, 1, 1, 1,
-0.7712541, -0.5983501, -3.496202, 1, 1, 1, 1, 1,
-0.7680104, 0.5078568, -2.225705, 1, 1, 1, 1, 1,
-0.7640403, -1.05583, -3.006027, 1, 1, 1, 1, 1,
-0.7629419, -1.664289, -2.582776, 1, 1, 1, 1, 1,
-0.7603927, 2.184937, 0.8348488, 1, 1, 1, 1, 1,
-0.7581958, -0.4534307, -1.594326, 1, 1, 1, 1, 1,
-0.7579589, 0.01309099, -1.351933, 1, 1, 1, 1, 1,
-0.7550269, 0.9408882, -1.786242, 1, 1, 1, 1, 1,
-0.7534125, 0.9886672, -2.159881, 1, 1, 1, 1, 1,
-0.7522441, 0.3657129, -0.3851157, 0, 0, 1, 1, 1,
-0.7340383, 1.895012, -3.053375, 1, 0, 0, 1, 1,
-0.7337252, 0.2522116, -1.575932, 1, 0, 0, 1, 1,
-0.7180466, -0.4923069, -2.603949, 1, 0, 0, 1, 1,
-0.7165529, -0.7027181, -1.15977, 1, 0, 0, 1, 1,
-0.7111309, 1.120656, 1.365893, 1, 0, 0, 1, 1,
-0.7087052, -1.254483, -1.940598, 0, 0, 0, 1, 1,
-0.7070663, 0.7680123, -1.242612, 0, 0, 0, 1, 1,
-0.7026016, 0.6744467, -0.01495501, 0, 0, 0, 1, 1,
-0.7019787, 0.7363498, -1.262057, 0, 0, 0, 1, 1,
-0.7000839, -1.206956, -2.559759, 0, 0, 0, 1, 1,
-0.6953191, -0.04915494, -1.454874, 0, 0, 0, 1, 1,
-0.6938392, -0.9697567, -2.305025, 0, 0, 0, 1, 1,
-0.6914945, -0.7786002, -1.42406, 1, 1, 1, 1, 1,
-0.6885975, -0.01896122, 0.4711303, 1, 1, 1, 1, 1,
-0.6880105, -1.084147, -1.094816, 1, 1, 1, 1, 1,
-0.6754575, 1.139604, -0.3605742, 1, 1, 1, 1, 1,
-0.6749153, -1.450537, -3.276585, 1, 1, 1, 1, 1,
-0.6742224, -0.9285303, -3.718356, 1, 1, 1, 1, 1,
-0.6722181, -1.45908, -3.007494, 1, 1, 1, 1, 1,
-0.672055, 0.4152387, 0.4055804, 1, 1, 1, 1, 1,
-0.6717892, 0.1900437, -0.9670604, 1, 1, 1, 1, 1,
-0.6679801, 1.59126, 1.176211, 1, 1, 1, 1, 1,
-0.6662862, -0.3316418, -1.053725, 1, 1, 1, 1, 1,
-0.6642844, 0.7917723, -3.556686, 1, 1, 1, 1, 1,
-0.6626874, 0.2143025, -0.8225581, 1, 1, 1, 1, 1,
-0.6483616, 0.4127113, 0.234178, 1, 1, 1, 1, 1,
-0.6405787, 0.9144069, -1.718712, 1, 1, 1, 1, 1,
-0.6384277, -1.354619, -1.151716, 0, 0, 1, 1, 1,
-0.635183, -0.4200801, -1.126753, 1, 0, 0, 1, 1,
-0.6331425, -0.3488637, -1.890435, 1, 0, 0, 1, 1,
-0.6301271, -0.03041353, -2.302993, 1, 0, 0, 1, 1,
-0.6283579, 1.009481, 1.303294, 1, 0, 0, 1, 1,
-0.6236668, 0.1478105, -3.109933, 1, 0, 0, 1, 1,
-0.6233817, 1.028745, 0.03390939, 0, 0, 0, 1, 1,
-0.6198542, 1.287817, -1.127138, 0, 0, 0, 1, 1,
-0.6171045, 0.8891806, -1.09322, 0, 0, 0, 1, 1,
-0.6148822, -0.5701101, -2.226085, 0, 0, 0, 1, 1,
-0.6148798, 0.9464598, 1.1167, 0, 0, 0, 1, 1,
-0.6134588, 1.5587, -1.707486, 0, 0, 0, 1, 1,
-0.6052747, -2.167331, -4.403838, 0, 0, 0, 1, 1,
-0.6040216, -1.183153, -3.790348, 1, 1, 1, 1, 1,
-0.5960513, 0.7612614, 0.04684313, 1, 1, 1, 1, 1,
-0.5885345, -0.5088149, -2.928183, 1, 1, 1, 1, 1,
-0.587464, 0.1351391, -1.608889, 1, 1, 1, 1, 1,
-0.5867604, -1.208744, -2.53745, 1, 1, 1, 1, 1,
-0.5860746, -0.1029817, -1.177557, 1, 1, 1, 1, 1,
-0.583982, -0.5549406, -2.186189, 1, 1, 1, 1, 1,
-0.5826991, -1.221092, -3.345581, 1, 1, 1, 1, 1,
-0.5824109, 1.086745, -0.5492815, 1, 1, 1, 1, 1,
-0.5818685, 0.3341378, -0.939994, 1, 1, 1, 1, 1,
-0.5806956, -0.38355, -4.702658, 1, 1, 1, 1, 1,
-0.5765429, 1.643633, 0.1770342, 1, 1, 1, 1, 1,
-0.5755004, 1.67764, 0.5678688, 1, 1, 1, 1, 1,
-0.5723862, 0.4763425, -0.4210378, 1, 1, 1, 1, 1,
-0.570071, 0.9864092, -0.6549953, 1, 1, 1, 1, 1,
-0.569231, 0.967077, -0.5510349, 0, 0, 1, 1, 1,
-0.5671043, -1.227835, -2.661241, 1, 0, 0, 1, 1,
-0.5660772, 0.3761728, -1.473663, 1, 0, 0, 1, 1,
-0.5656956, 0.5713195, -2.740307, 1, 0, 0, 1, 1,
-0.5648016, 0.8137584, 0.7474486, 1, 0, 0, 1, 1,
-0.557553, 0.586766, -1.197752, 1, 0, 0, 1, 1,
-0.5571047, 0.8447769, -0.5624662, 0, 0, 0, 1, 1,
-0.552854, -0.08791432, -3.352835, 0, 0, 0, 1, 1,
-0.55049, -0.4541226, -1.755409, 0, 0, 0, 1, 1,
-0.545493, 0.08271507, -1.634179, 0, 0, 0, 1, 1,
-0.5427659, 0.5452685, -0.4531899, 0, 0, 0, 1, 1,
-0.540523, -0.07936238, 0.2623217, 0, 0, 0, 1, 1,
-0.5393136, 0.3313047, -1.186481, 0, 0, 0, 1, 1,
-0.5340691, -0.0732571, -0.06624287, 1, 1, 1, 1, 1,
-0.5317962, 1.891911, 0.09769053, 1, 1, 1, 1, 1,
-0.5225836, -1.528542, -3.059378, 1, 1, 1, 1, 1,
-0.5214301, -1.268, -3.068558, 1, 1, 1, 1, 1,
-0.5198496, -0.04144679, -2.504092, 1, 1, 1, 1, 1,
-0.5190416, -1.856144, -2.755784, 1, 1, 1, 1, 1,
-0.5123634, 1.482852, -0.9956011, 1, 1, 1, 1, 1,
-0.5095746, -0.106462, -2.225027, 1, 1, 1, 1, 1,
-0.5064972, 0.3200195, 0.02319224, 1, 1, 1, 1, 1,
-0.4990412, 0.7016521, -1.338844, 1, 1, 1, 1, 1,
-0.4989893, 0.5425014, -1.957856, 1, 1, 1, 1, 1,
-0.4967033, 0.1970074, -2.047516, 1, 1, 1, 1, 1,
-0.4906682, -0.2133135, -3.18002, 1, 1, 1, 1, 1,
-0.4860421, 2.01795, 0.08786443, 1, 1, 1, 1, 1,
-0.4860365, -0.6621174, -3.740211, 1, 1, 1, 1, 1,
-0.4804766, 0.5470961, -1.423182, 0, 0, 1, 1, 1,
-0.4712979, -0.917177, -1.902972, 1, 0, 0, 1, 1,
-0.4700149, 1.001126, -0.4321847, 1, 0, 0, 1, 1,
-0.4653832, -0.5540029, -3.608813, 1, 0, 0, 1, 1,
-0.4609972, 0.5644993, -0.5665259, 1, 0, 0, 1, 1,
-0.4603276, -0.1376061, -1.849682, 1, 0, 0, 1, 1,
-0.4592538, -1.654355, -0.9316149, 0, 0, 0, 1, 1,
-0.4577981, -1.728871, -1.072079, 0, 0, 0, 1, 1,
-0.4577504, 1.497401, 0.3656866, 0, 0, 0, 1, 1,
-0.4537764, -0.4614015, -1.342434, 0, 0, 0, 1, 1,
-0.4508814, -1.032242, -2.564907, 0, 0, 0, 1, 1,
-0.4497544, 0.8554271, -2.878397, 0, 0, 0, 1, 1,
-0.4467888, -0.6684086, -1.882872, 0, 0, 0, 1, 1,
-0.4423184, -0.2736051, -4.172835, 1, 1, 1, 1, 1,
-0.4379514, 1.541067, 1.156069, 1, 1, 1, 1, 1,
-0.4379153, -1.346385, -4.20445, 1, 1, 1, 1, 1,
-0.4372113, -0.5308329, -1.980754, 1, 1, 1, 1, 1,
-0.4367101, 0.6760342, -1.363003, 1, 1, 1, 1, 1,
-0.43506, 0.1258423, 0.1514194, 1, 1, 1, 1, 1,
-0.433296, -0.8845522, -1.614099, 1, 1, 1, 1, 1,
-0.4328223, 0.03755411, -2.759087, 1, 1, 1, 1, 1,
-0.4312638, 0.7233515, -0.9800823, 1, 1, 1, 1, 1,
-0.4294408, 0.8690413, -0.2372386, 1, 1, 1, 1, 1,
-0.4277713, 0.5305762, 0.06500442, 1, 1, 1, 1, 1,
-0.4263077, 1.008235, -0.4179018, 1, 1, 1, 1, 1,
-0.4247749, -2.024002, -4.61295, 1, 1, 1, 1, 1,
-0.4241583, 0.2124256, 0.1359438, 1, 1, 1, 1, 1,
-0.4215088, 0.01121415, -2.712716, 1, 1, 1, 1, 1,
-0.4209499, -0.2385171, -1.459139, 0, 0, 1, 1, 1,
-0.4207646, 0.3342139, -1.624178, 1, 0, 0, 1, 1,
-0.4137234, -0.08323884, -1.864913, 1, 0, 0, 1, 1,
-0.4093672, -0.6904111, -2.789954, 1, 0, 0, 1, 1,
-0.408944, -1.303364, -0.8459498, 1, 0, 0, 1, 1,
-0.4015982, 0.637738, -1.07013, 1, 0, 0, 1, 1,
-0.3985824, 0.1413283, 0.1047876, 0, 0, 0, 1, 1,
-0.3980329, -0.7837852, -0.4601512, 0, 0, 0, 1, 1,
-0.3972322, 1.416118, -0.9743214, 0, 0, 0, 1, 1,
-0.3964734, -1.110596, -4.29337, 0, 0, 0, 1, 1,
-0.3945076, -1.472521, -3.188316, 0, 0, 0, 1, 1,
-0.3896735, -0.3895574, -2.298307, 0, 0, 0, 1, 1,
-0.3887259, -2.044651, -0.8802637, 0, 0, 0, 1, 1,
-0.3883581, -0.1776982, -3.51531, 1, 1, 1, 1, 1,
-0.3865771, 0.1913517, -1.822078, 1, 1, 1, 1, 1,
-0.3845003, 0.830134, 0.7543575, 1, 1, 1, 1, 1,
-0.381628, -0.1670622, -1.107057, 1, 1, 1, 1, 1,
-0.3814966, -0.8755926, -2.966254, 1, 1, 1, 1, 1,
-0.3808007, 0.4997817, -0.1808319, 1, 1, 1, 1, 1,
-0.3790203, -0.3801002, -5.128774, 1, 1, 1, 1, 1,
-0.371038, 1.167288, -1.208648, 1, 1, 1, 1, 1,
-0.368576, 1.7609, 0.116878, 1, 1, 1, 1, 1,
-0.3666782, 2.934124, -0.4722292, 1, 1, 1, 1, 1,
-0.3662557, -1.803622, -2.240888, 1, 1, 1, 1, 1,
-0.3632003, -1.741838, -0.7548527, 1, 1, 1, 1, 1,
-0.3615676, -0.2813754, -3.192226, 1, 1, 1, 1, 1,
-0.3613958, -0.1979024, -2.556714, 1, 1, 1, 1, 1,
-0.3536879, -0.4761136, -2.661221, 1, 1, 1, 1, 1,
-0.3511877, -0.2038132, -1.436212, 0, 0, 1, 1, 1,
-0.3485022, 1.385902, 0.1966726, 1, 0, 0, 1, 1,
-0.3467541, 1.286227, 1.663076, 1, 0, 0, 1, 1,
-0.3458011, -1.39436, -1.755083, 1, 0, 0, 1, 1,
-0.3422586, 0.8400236, 0.1663568, 1, 0, 0, 1, 1,
-0.3420107, -1.132708, -2.996169, 1, 0, 0, 1, 1,
-0.3389904, -0.3678539, -2.516885, 0, 0, 0, 1, 1,
-0.3382997, -0.300638, -1.420203, 0, 0, 0, 1, 1,
-0.3329107, -0.7474213, -2.478034, 0, 0, 0, 1, 1,
-0.3298441, 0.4752536, -1.757709, 0, 0, 0, 1, 1,
-0.3255714, 0.7335508, 1.196045, 0, 0, 0, 1, 1,
-0.3234456, 0.3324423, 0.6888561, 0, 0, 0, 1, 1,
-0.3211837, -0.5583288, -3.8905, 0, 0, 0, 1, 1,
-0.3165468, 2.412907, -0.7841388, 1, 1, 1, 1, 1,
-0.3131132, -1.085546, -2.885031, 1, 1, 1, 1, 1,
-0.3100173, 0.09565344, -0.09195489, 1, 1, 1, 1, 1,
-0.3085395, -0.5286157, -3.082001, 1, 1, 1, 1, 1,
-0.304786, -0.8990468, -3.564293, 1, 1, 1, 1, 1,
-0.3031237, -0.1004543, -1.318121, 1, 1, 1, 1, 1,
-0.3030933, -1.969865, -2.719454, 1, 1, 1, 1, 1,
-0.2979165, 0.2715122, 0.4330424, 1, 1, 1, 1, 1,
-0.296239, 0.5521607, -1.426784, 1, 1, 1, 1, 1,
-0.2954763, 0.8109496, -1.179539, 1, 1, 1, 1, 1,
-0.2949039, -1.830856, -2.606854, 1, 1, 1, 1, 1,
-0.2913404, -0.3629216, -3.24275, 1, 1, 1, 1, 1,
-0.2913114, 0.1981095, -2.836315, 1, 1, 1, 1, 1,
-0.2907504, -2.672933, -1.412457, 1, 1, 1, 1, 1,
-0.2905317, 2.212609, 0.1322258, 1, 1, 1, 1, 1,
-0.2899897, -1.251453, -2.656798, 0, 0, 1, 1, 1,
-0.2899702, 0.1879693, -1.206459, 1, 0, 0, 1, 1,
-0.2888206, -0.4219064, -3.314442, 1, 0, 0, 1, 1,
-0.2881255, 0.5336805, -0.2179397, 1, 0, 0, 1, 1,
-0.2863934, 0.8860384, 1.66415, 1, 0, 0, 1, 1,
-0.2843288, -0.4941419, -1.719815, 1, 0, 0, 1, 1,
-0.2834785, -0.4667486, -2.660356, 0, 0, 0, 1, 1,
-0.2825958, 1.127548, -2.036602, 0, 0, 0, 1, 1,
-0.2811296, -0.9043903, -1.954899, 0, 0, 0, 1, 1,
-0.2712333, 0.4135925, -0.5565401, 0, 0, 0, 1, 1,
-0.2707099, -0.6331974, -3.474713, 0, 0, 0, 1, 1,
-0.2655817, 0.1843613, -2.235778, 0, 0, 0, 1, 1,
-0.264465, -0.02928894, -1.231632, 0, 0, 0, 1, 1,
-0.2625608, -1.201908, -2.970144, 1, 1, 1, 1, 1,
-0.2578202, -0.3205628, -2.543475, 1, 1, 1, 1, 1,
-0.2570517, 1.296318, -0.6685665, 1, 1, 1, 1, 1,
-0.2554304, -0.4782387, -4.26253, 1, 1, 1, 1, 1,
-0.2471562, 1.391809, 0.8072124, 1, 1, 1, 1, 1,
-0.2459764, 0.1536411, -2.597034, 1, 1, 1, 1, 1,
-0.240493, -0.9411877, -2.384629, 1, 1, 1, 1, 1,
-0.2369917, 0.06085026, -0.6243174, 1, 1, 1, 1, 1,
-0.2356174, 0.006608915, -1.699779, 1, 1, 1, 1, 1,
-0.2341069, 0.1869749, -1.926899, 1, 1, 1, 1, 1,
-0.2326264, -0.5580899, -2.127671, 1, 1, 1, 1, 1,
-0.2315344, -1.342885, -2.651241, 1, 1, 1, 1, 1,
-0.2289993, -0.01760745, -1.129358, 1, 1, 1, 1, 1,
-0.2287555, -0.9983687, -1.858201, 1, 1, 1, 1, 1,
-0.2207038, -1.253441, -4.296762, 1, 1, 1, 1, 1,
-0.2203904, -0.4720018, -2.727571, 0, 0, 1, 1, 1,
-0.2196255, -0.4826241, -1.658666, 1, 0, 0, 1, 1,
-0.2173028, -0.5815245, -3.044307, 1, 0, 0, 1, 1,
-0.2168776, 0.07352282, -1.907265, 1, 0, 0, 1, 1,
-0.2071755, -2.3921, -3.248849, 1, 0, 0, 1, 1,
-0.2050503, 0.839016, 0.3086899, 1, 0, 0, 1, 1,
-0.2016769, 0.982168, 0.3675526, 0, 0, 0, 1, 1,
-0.2011199, 0.4584304, -0.82554, 0, 0, 0, 1, 1,
-0.2003741, 0.03566774, -0.4866424, 0, 0, 0, 1, 1,
-0.1978206, -0.7277983, -3.569511, 0, 0, 0, 1, 1,
-0.1963469, 0.4066048, -1.407293, 0, 0, 0, 1, 1,
-0.1895914, 1.584961, -0.1260506, 0, 0, 0, 1, 1,
-0.1879304, 0.00375364, -3.413392, 0, 0, 0, 1, 1,
-0.1868807, 0.6687688, 0.5044045, 1, 1, 1, 1, 1,
-0.1807555, -1.455907, -3.42684, 1, 1, 1, 1, 1,
-0.1795687, 0.7937001, 0.3822383, 1, 1, 1, 1, 1,
-0.1789316, -1.016996, -2.042953, 1, 1, 1, 1, 1,
-0.1760373, -2.03844, -2.576167, 1, 1, 1, 1, 1,
-0.1738953, -1.500128, -4.348513, 1, 1, 1, 1, 1,
-0.1723656, -2.17009, -2.710434, 1, 1, 1, 1, 1,
-0.1684507, -0.4930519, -1.82922, 1, 1, 1, 1, 1,
-0.1604529, 0.5819847, -0.8490373, 1, 1, 1, 1, 1,
-0.1559023, -0.6384158, -1.822543, 1, 1, 1, 1, 1,
-0.1557871, -0.240317, -2.703921, 1, 1, 1, 1, 1,
-0.1551582, -0.08502446, -1.625493, 1, 1, 1, 1, 1,
-0.1510314, -0.4113811, -2.04012, 1, 1, 1, 1, 1,
-0.1489926, 1.125448, 0.5963073, 1, 1, 1, 1, 1,
-0.1467445, 0.6455226, -1.206908, 1, 1, 1, 1, 1,
-0.1425001, 0.8759386, -2.002512, 0, 0, 1, 1, 1,
-0.1366535, 1.789007, 1.806247, 1, 0, 0, 1, 1,
-0.1317988, 1.208327, -0.1185013, 1, 0, 0, 1, 1,
-0.1279939, 0.405739, -1.018192, 1, 0, 0, 1, 1,
-0.1267128, 1.216764, -2.014104, 1, 0, 0, 1, 1,
-0.124304, -0.4683723, -2.162409, 1, 0, 0, 1, 1,
-0.1242781, -0.903155, -3.548347, 0, 0, 0, 1, 1,
-0.1239928, 0.04171686, -2.220589, 0, 0, 0, 1, 1,
-0.1228353, -0.7516277, -3.183606, 0, 0, 0, 1, 1,
-0.121913, 1.408003, -1.525775, 0, 0, 0, 1, 1,
-0.1217029, -2.23515, -4.388271, 0, 0, 0, 1, 1,
-0.1211805, 1.987468, 0.3416656, 0, 0, 0, 1, 1,
-0.1174754, 0.4255533, 0.2230006, 0, 0, 0, 1, 1,
-0.1166632, -1.252823, -4.027867, 1, 1, 1, 1, 1,
-0.1118173, -0.7466759, -5.552396, 1, 1, 1, 1, 1,
-0.1109456, -0.790775, -2.363356, 1, 1, 1, 1, 1,
-0.1072474, -0.4791595, -3.958363, 1, 1, 1, 1, 1,
-0.1039328, -1.14862, -3.214742, 1, 1, 1, 1, 1,
-0.09655932, 0.3939514, -1.186929, 1, 1, 1, 1, 1,
-0.09212326, 1.173367, -0.2096744, 1, 1, 1, 1, 1,
-0.09042986, -0.0154979, -1.221918, 1, 1, 1, 1, 1,
-0.08253448, -0.5447358, -3.286914, 1, 1, 1, 1, 1,
-0.07596276, 0.3033172, 0.9701424, 1, 1, 1, 1, 1,
-0.07546306, -0.709456, -3.003046, 1, 1, 1, 1, 1,
-0.07319373, -0.3385587, -3.187672, 1, 1, 1, 1, 1,
-0.0721489, -0.3462123, -2.898192, 1, 1, 1, 1, 1,
-0.07102061, 0.2536531, -0.3064141, 1, 1, 1, 1, 1,
-0.07067166, 0.2072637, -0.5021872, 1, 1, 1, 1, 1,
-0.06891391, 0.607365, 0.132451, 0, 0, 1, 1, 1,
-0.06832474, -2.320595, -1.920528, 1, 0, 0, 1, 1,
-0.06688958, -2.055136, -3.409207, 1, 0, 0, 1, 1,
-0.06612728, -0.3712639, -1.065093, 1, 0, 0, 1, 1,
-0.06232296, -0.4304407, -1.851717, 1, 0, 0, 1, 1,
-0.05367403, 1.781685, -1.072561, 1, 0, 0, 1, 1,
-0.04820056, 0.02894344, -1.692555, 0, 0, 0, 1, 1,
-0.04658316, -0.1544332, -1.855923, 0, 0, 0, 1, 1,
-0.04332916, -0.9187762, -1.621412, 0, 0, 0, 1, 1,
-0.04296194, -0.2241059, -3.609048, 0, 0, 0, 1, 1,
-0.04029204, 0.008989251, -0.3196923, 0, 0, 0, 1, 1,
-0.04017927, 0.07021907, -0.05510274, 0, 0, 0, 1, 1,
-0.03946613, -0.542896, -2.298228, 0, 0, 0, 1, 1,
-0.03945542, -0.8339561, -3.0238, 1, 1, 1, 1, 1,
-0.03832735, 0.1082386, -0.9543117, 1, 1, 1, 1, 1,
-0.03559481, -0.3820463, -3.382743, 1, 1, 1, 1, 1,
-0.03441639, 0.6685779, 1.230876, 1, 1, 1, 1, 1,
-0.03078364, 1.368868, -0.04592882, 1, 1, 1, 1, 1,
-0.02801084, -0.4837989, -5.778001, 1, 1, 1, 1, 1,
-0.02760585, -0.5173281, -4.382462, 1, 1, 1, 1, 1,
-0.02608018, -0.01075437, -0.9579194, 1, 1, 1, 1, 1,
-0.02117427, 1.03299, -0.08666174, 1, 1, 1, 1, 1,
-0.0181326, 0.4374113, 0.3554468, 1, 1, 1, 1, 1,
-0.01684708, -0.4742515, -3.473283, 1, 1, 1, 1, 1,
-0.01662287, 0.2612211, -1.140385, 1, 1, 1, 1, 1,
-0.009304404, -0.2355986, -3.253164, 1, 1, 1, 1, 1,
-0.007668828, 1.35834, -0.4698342, 1, 1, 1, 1, 1,
-0.00716753, 0.6922833, -0.7076274, 1, 1, 1, 1, 1,
-0.004244276, 1.2197, -0.8863976, 0, 0, 1, 1, 1,
-0.002896927, 1.362714, 0.9745207, 1, 0, 0, 1, 1,
-0.002567672, 0.3739336, -0.3129317, 1, 0, 0, 1, 1,
-0.002095689, 1.421185, 0.2722356, 1, 0, 0, 1, 1,
-0.0001915992, 0.9371565, 0.9455732, 1, 0, 0, 1, 1,
0.001484352, 1.701952, -0.02642446, 1, 0, 0, 1, 1,
0.001803299, 1.166057, 0.7011375, 0, 0, 0, 1, 1,
0.004206012, -0.02253675, 2.004172, 0, 0, 0, 1, 1,
0.004402123, 0.243692, 0.380849, 0, 0, 0, 1, 1,
0.007376861, 0.3040016, -0.6287, 0, 0, 0, 1, 1,
0.009038457, -0.008614055, 1.512232, 0, 0, 0, 1, 1,
0.01234867, -1.258256, 2.981271, 0, 0, 0, 1, 1,
0.0135981, -0.1069917, 3.312074, 0, 0, 0, 1, 1,
0.01767496, -0.4962002, 3.257179, 1, 1, 1, 1, 1,
0.02485747, 0.4647133, 1.143013, 1, 1, 1, 1, 1,
0.0308997, 0.657778, 0.6937506, 1, 1, 1, 1, 1,
0.03233007, -0.7385288, 4.46432, 1, 1, 1, 1, 1,
0.03865198, -1.157573, 4.743183, 1, 1, 1, 1, 1,
0.03975308, -1.155398, 3.218941, 1, 1, 1, 1, 1,
0.04133842, -0.800265, 4.297994, 1, 1, 1, 1, 1,
0.04739862, 2.030996, -0.8091797, 1, 1, 1, 1, 1,
0.04850942, -0.16261, 4.333507, 1, 1, 1, 1, 1,
0.05140819, 0.1270009, 0.22195, 1, 1, 1, 1, 1,
0.05188824, 0.8810423, -0.144025, 1, 1, 1, 1, 1,
0.0538616, 0.1647132, 1.811489, 1, 1, 1, 1, 1,
0.05507757, -3.081546, 5.058593, 1, 1, 1, 1, 1,
0.05690208, -1.739818, 2.235127, 1, 1, 1, 1, 1,
0.06082805, 0.8977211, 1.082298, 1, 1, 1, 1, 1,
0.06549668, -0.3676673, 4.035765, 0, 0, 1, 1, 1,
0.06646305, -0.1291529, 0.07580355, 1, 0, 0, 1, 1,
0.07033803, 2.641513, -0.2104918, 1, 0, 0, 1, 1,
0.07338113, -1.698457, 2.033178, 1, 0, 0, 1, 1,
0.07407309, -0.9617924, 3.552199, 1, 0, 0, 1, 1,
0.07527979, -0.08732033, 2.99949, 1, 0, 0, 1, 1,
0.07560133, 1.766883, 0.6084435, 0, 0, 0, 1, 1,
0.07653823, 0.5132499, 0.6846041, 0, 0, 0, 1, 1,
0.07836579, 0.7036666, 1.644118, 0, 0, 0, 1, 1,
0.07983159, 2.453083, 0.4718725, 0, 0, 0, 1, 1,
0.08048842, -0.3505284, 2.078019, 0, 0, 0, 1, 1,
0.08123846, -1.783591, 4.725013, 0, 0, 0, 1, 1,
0.08138277, 0.4944016, -0.3035993, 0, 0, 0, 1, 1,
0.08572991, -0.1158996, 2.659335, 1, 1, 1, 1, 1,
0.08989147, 0.6089118, 0.2458209, 1, 1, 1, 1, 1,
0.0901584, -0.5727275, 1.765448, 1, 1, 1, 1, 1,
0.09078081, 1.23739, 0.7389498, 1, 1, 1, 1, 1,
0.09135544, -1.541769, 3.085401, 1, 1, 1, 1, 1,
0.09223475, 0.4780922, -0.1651234, 1, 1, 1, 1, 1,
0.09452679, -0.2316205, 3.408904, 1, 1, 1, 1, 1,
0.09465434, 1.723339, 0.06388754, 1, 1, 1, 1, 1,
0.09626637, -0.2235808, 1.527923, 1, 1, 1, 1, 1,
0.09698533, -1.314224, 4.107895, 1, 1, 1, 1, 1,
0.09770889, -0.2580056, 2.783823, 1, 1, 1, 1, 1,
0.1018078, 0.7631066, -0.0513529, 1, 1, 1, 1, 1,
0.1024365, -0.7503599, 4.561071, 1, 1, 1, 1, 1,
0.1032114, -0.6368381, 2.714665, 1, 1, 1, 1, 1,
0.1042248, 1.840851, -0.07446785, 1, 1, 1, 1, 1,
0.1153272, -0.3730392, 3.805157, 0, 0, 1, 1, 1,
0.1174386, 1.802846, -0.2501084, 1, 0, 0, 1, 1,
0.1205907, -0.002656196, 0.5314735, 1, 0, 0, 1, 1,
0.1212742, 0.8109471, 1.72101, 1, 0, 0, 1, 1,
0.1233332, 0.5098464, 0.03052479, 1, 0, 0, 1, 1,
0.1279109, -1.079104, 3.673599, 1, 0, 0, 1, 1,
0.1318339, 0.8575445, -0.4980921, 0, 0, 0, 1, 1,
0.1344093, 0.0632392, 2.227768, 0, 0, 0, 1, 1,
0.1398878, -2.050158, 2.601909, 0, 0, 0, 1, 1,
0.1402884, 1.259425, -2.313122, 0, 0, 0, 1, 1,
0.1413064, 0.3298326, -0.1358561, 0, 0, 0, 1, 1,
0.143181, -1.333941, 2.109192, 0, 0, 0, 1, 1,
0.1441394, 0.2894316, 0.7260448, 0, 0, 0, 1, 1,
0.1563664, 0.4433622, 0.03900755, 1, 1, 1, 1, 1,
0.159218, 1.166203, 1.636976, 1, 1, 1, 1, 1,
0.1724368, 0.4892468, 2.058624, 1, 1, 1, 1, 1,
0.1730778, 0.7856711, 0.9216466, 1, 1, 1, 1, 1,
0.1749254, -2.255717, 2.048978, 1, 1, 1, 1, 1,
0.1754257, -1.083578, 3.580438, 1, 1, 1, 1, 1,
0.1754989, -0.5757232, 3.765133, 1, 1, 1, 1, 1,
0.1759582, 0.02471701, 0.6646792, 1, 1, 1, 1, 1,
0.1770792, -1.317187, 3.73508, 1, 1, 1, 1, 1,
0.1791054, 1.924698, 1.331847, 1, 1, 1, 1, 1,
0.1823167, 0.1112269, 2.129514, 1, 1, 1, 1, 1,
0.185408, 0.06544353, 2.210022, 1, 1, 1, 1, 1,
0.1876723, 0.139525, 0.1733547, 1, 1, 1, 1, 1,
0.1878437, -1.380929, 2.174582, 1, 1, 1, 1, 1,
0.1882058, 0.352026, 0.5236339, 1, 1, 1, 1, 1,
0.191328, 1.046473, -0.2280441, 0, 0, 1, 1, 1,
0.1918513, 1.157538, -1.060392, 1, 0, 0, 1, 1,
0.1924477, -0.2865492, 1.196139, 1, 0, 0, 1, 1,
0.1957461, 1.992168, 0.5932041, 1, 0, 0, 1, 1,
0.199353, 0.2993882, 0.3410854, 1, 0, 0, 1, 1,
0.2034707, 0.609659, -0.1006569, 1, 0, 0, 1, 1,
0.2057917, 0.8315486, 2.03953, 0, 0, 0, 1, 1,
0.2084163, -0.7242006, 2.595623, 0, 0, 0, 1, 1,
0.2104164, -1.091662, 2.507484, 0, 0, 0, 1, 1,
0.2159057, 1.85579, 2.023804, 0, 0, 0, 1, 1,
0.2206715, 0.624858, 0.9101821, 0, 0, 0, 1, 1,
0.2273593, 0.8069431, 1.231013, 0, 0, 0, 1, 1,
0.2286186, -0.7742497, 2.700809, 0, 0, 0, 1, 1,
0.2347602, -0.5951988, 1.966479, 1, 1, 1, 1, 1,
0.2358959, 1.192952, 0.05423049, 1, 1, 1, 1, 1,
0.2367471, -1.4805, 4.124048, 1, 1, 1, 1, 1,
0.2371007, -0.3430134, 1.695713, 1, 1, 1, 1, 1,
0.2452614, -0.4414988, 2.545768, 1, 1, 1, 1, 1,
0.2463629, 0.363743, 0.7167294, 1, 1, 1, 1, 1,
0.2493488, -1.672196, 2.000161, 1, 1, 1, 1, 1,
0.2538291, 0.1849399, 0.6234043, 1, 1, 1, 1, 1,
0.2543759, 0.7415773, -0.3046007, 1, 1, 1, 1, 1,
0.2578833, -0.6852102, 0.8443461, 1, 1, 1, 1, 1,
0.2593313, -0.5479913, 2.79709, 1, 1, 1, 1, 1,
0.2607278, -0.01957881, 1.487499, 1, 1, 1, 1, 1,
0.2716914, 1.541962, 1.415186, 1, 1, 1, 1, 1,
0.2737605, 2.012667, -0.1612201, 1, 1, 1, 1, 1,
0.2809578, -0.8144149, 2.310757, 1, 1, 1, 1, 1,
0.2813111, -1.744214, 2.400886, 0, 0, 1, 1, 1,
0.2858582, -0.8912951, 1.178401, 1, 0, 0, 1, 1,
0.2959988, -0.3457631, 3.032767, 1, 0, 0, 1, 1,
0.2960443, 0.3613513, 1.202011, 1, 0, 0, 1, 1,
0.2971842, -0.6754474, 3.333888, 1, 0, 0, 1, 1,
0.2975664, -0.9509081, 2.64279, 1, 0, 0, 1, 1,
0.3019609, 0.8520656, 0.4954558, 0, 0, 0, 1, 1,
0.3037606, 0.3978819, -0.7456662, 0, 0, 0, 1, 1,
0.3051067, -1.395547, 2.51788, 0, 0, 0, 1, 1,
0.308725, -0.3421388, 3.41746, 0, 0, 0, 1, 1,
0.3102382, 0.2329245, -0.02653783, 0, 0, 0, 1, 1,
0.3122529, -1.192561, 1.918059, 0, 0, 0, 1, 1,
0.314815, -0.3275943, 1.96996, 0, 0, 0, 1, 1,
0.3168874, 0.6266301, 0.4531186, 1, 1, 1, 1, 1,
0.3174475, 0.1240246, -0.9560477, 1, 1, 1, 1, 1,
0.3175929, -0.224544, 2.323609, 1, 1, 1, 1, 1,
0.3196173, 0.6949476, -0.2654374, 1, 1, 1, 1, 1,
0.3221107, -0.577924, 1.946502, 1, 1, 1, 1, 1,
0.3224996, -1.235114, 4.166466, 1, 1, 1, 1, 1,
0.3229315, -0.9662179, 2.454779, 1, 1, 1, 1, 1,
0.3232117, -1.140647, 2.795898, 1, 1, 1, 1, 1,
0.3265729, -2.603316, 2.973942, 1, 1, 1, 1, 1,
0.3275261, 0.5130739, -0.1612606, 1, 1, 1, 1, 1,
0.3296733, -0.7728485, 3.912409, 1, 1, 1, 1, 1,
0.330947, -0.3119216, 2.782801, 1, 1, 1, 1, 1,
0.3333485, 0.1366608, 2.289818, 1, 1, 1, 1, 1,
0.3363804, 0.1169259, 2.636427, 1, 1, 1, 1, 1,
0.3397937, 1.387955, 1.58925, 1, 1, 1, 1, 1,
0.3517473, -0.5301322, 1.163067, 0, 0, 1, 1, 1,
0.3531829, -0.9636444, 2.615229, 1, 0, 0, 1, 1,
0.3619306, -0.6014341, 3.375794, 1, 0, 0, 1, 1,
0.3629434, 1.485961, -0.9569651, 1, 0, 0, 1, 1,
0.3631694, 0.2082964, 1.519233, 1, 0, 0, 1, 1,
0.3662691, 1.220621, 0.7201207, 1, 0, 0, 1, 1,
0.366544, -0.3255176, 1.928529, 0, 0, 0, 1, 1,
0.3782839, 0.3480601, 0.07788575, 0, 0, 0, 1, 1,
0.3796746, 0.9940765, 0.2843112, 0, 0, 0, 1, 1,
0.3806149, 0.1543632, 1.414392, 0, 0, 0, 1, 1,
0.3843399, -2.126042, 2.342883, 0, 0, 0, 1, 1,
0.3847063, -1.30629, 1.638287, 0, 0, 0, 1, 1,
0.3854607, 0.03889138, 2.626415, 0, 0, 0, 1, 1,
0.3864242, 0.5926445, 1.988027, 1, 1, 1, 1, 1,
0.3893374, 0.02519319, 0.2643014, 1, 1, 1, 1, 1,
0.3909951, 0.09658959, 0.5020071, 1, 1, 1, 1, 1,
0.3913224, 1.029551, 0.3653772, 1, 1, 1, 1, 1,
0.3919744, -0.3544015, 2.627349, 1, 1, 1, 1, 1,
0.3944828, 0.07597911, 1.423524, 1, 1, 1, 1, 1,
0.397891, 0.4550883, 0.1667304, 1, 1, 1, 1, 1,
0.4026685, -1.093053, 3.400106, 1, 1, 1, 1, 1,
0.4034927, -0.007942421, 1.374649, 1, 1, 1, 1, 1,
0.4046012, 0.8459017, 0.6701275, 1, 1, 1, 1, 1,
0.4117591, -0.5456042, 0.499319, 1, 1, 1, 1, 1,
0.4176068, -1.025808, 3.693895, 1, 1, 1, 1, 1,
0.4224936, -2.061087, 2.027348, 1, 1, 1, 1, 1,
0.4243132, -1.179619, 3.688987, 1, 1, 1, 1, 1,
0.4296402, 0.6943579, -0.05427888, 1, 1, 1, 1, 1,
0.433127, -0.5793107, 2.51813, 0, 0, 1, 1, 1,
0.4412524, -1.091116, 2.752005, 1, 0, 0, 1, 1,
0.4426728, -0.08829721, 2.195292, 1, 0, 0, 1, 1,
0.4443264, -1.069354, 3.381785, 1, 0, 0, 1, 1,
0.4450622, -0.1028154, 1.913955, 1, 0, 0, 1, 1,
0.4455647, 1.467546, 0.8580183, 1, 0, 0, 1, 1,
0.4456247, 1.545393, 0.6490885, 0, 0, 0, 1, 1,
0.4456456, -0.9168178, 2.876106, 0, 0, 0, 1, 1,
0.4472417, -0.6183441, 2.419004, 0, 0, 0, 1, 1,
0.4489272, 0.9084076, 0.6395326, 0, 0, 0, 1, 1,
0.4518031, 2.029933, 2.142729, 0, 0, 0, 1, 1,
0.4555122, -0.1597013, 1.994235, 0, 0, 0, 1, 1,
0.4599031, 2.61474, 0.9102771, 0, 0, 0, 1, 1,
0.4611138, -0.3203863, 3.682553, 1, 1, 1, 1, 1,
0.4628569, -0.7962232, 2.350481, 1, 1, 1, 1, 1,
0.4650263, 0.6382931, 0.1323358, 1, 1, 1, 1, 1,
0.4706937, 0.6312144, 0.7397656, 1, 1, 1, 1, 1,
0.4739648, 0.181049, 1.206579, 1, 1, 1, 1, 1,
0.4747315, 0.7489874, 0.3360167, 1, 1, 1, 1, 1,
0.4747882, -0.3395613, 3.616915, 1, 1, 1, 1, 1,
0.4779642, 0.04946348, 0.7823211, 1, 1, 1, 1, 1,
0.4784093, -0.1620687, 0.08872806, 1, 1, 1, 1, 1,
0.478681, -0.1124001, 2.80586, 1, 1, 1, 1, 1,
0.4798369, 0.6361042, 0.6416328, 1, 1, 1, 1, 1,
0.4809267, 0.2295882, 0.6839648, 1, 1, 1, 1, 1,
0.4862792, 0.6586444, 1.732854, 1, 1, 1, 1, 1,
0.4872194, -0.7725493, 1.740026, 1, 1, 1, 1, 1,
0.4916251, 0.2170896, 2.016794, 1, 1, 1, 1, 1,
0.4944204, -0.5134975, 1.472455, 0, 0, 1, 1, 1,
0.4958153, -1.957192, 2.464472, 1, 0, 0, 1, 1,
0.4964981, -0.07660528, 3.35552, 1, 0, 0, 1, 1,
0.4969783, 0.07530295, -0.1576844, 1, 0, 0, 1, 1,
0.4997384, 0.4103882, 1.59471, 1, 0, 0, 1, 1,
0.501591, -0.3365501, 1.278972, 1, 0, 0, 1, 1,
0.5094551, 0.3063014, 1.680516, 0, 0, 0, 1, 1,
0.5112489, 1.89747, -0.1608382, 0, 0, 0, 1, 1,
0.5142811, 0.815558, 0.151609, 0, 0, 0, 1, 1,
0.5228847, -0.1050949, 1.525339, 0, 0, 0, 1, 1,
0.5246432, 1.850323, 1.223393, 0, 0, 0, 1, 1,
0.5282128, 0.2359531, 2.304771, 0, 0, 0, 1, 1,
0.5285598, 0.08365499, 1.650862, 0, 0, 0, 1, 1,
0.5403637, -1.158991, 4.204935, 1, 1, 1, 1, 1,
0.5404195, 0.4454068, 1.654535, 1, 1, 1, 1, 1,
0.5443335, 1.970751, -0.5214388, 1, 1, 1, 1, 1,
0.548343, 0.8770327, 0.4511177, 1, 1, 1, 1, 1,
0.5551239, 0.2092671, 0.174521, 1, 1, 1, 1, 1,
0.5558643, -0.9184593, 2.478873, 1, 1, 1, 1, 1,
0.5622082, -1.24636, 4.031313, 1, 1, 1, 1, 1,
0.5626505, 0.91587, -0.6591324, 1, 1, 1, 1, 1,
0.5637987, 0.9015301, 0.4124129, 1, 1, 1, 1, 1,
0.5686176, -0.9151813, 4.011382, 1, 1, 1, 1, 1,
0.5697654, -0.5601556, 3.069648, 1, 1, 1, 1, 1,
0.5707463, -0.04075249, 0.4780523, 1, 1, 1, 1, 1,
0.5710717, 0.08324604, 0.828123, 1, 1, 1, 1, 1,
0.5710935, -1.13477, 2.355064, 1, 1, 1, 1, 1,
0.5716488, 0.05348877, 1.619068, 1, 1, 1, 1, 1,
0.5716552, -1.089238, -0.1971592, 0, 0, 1, 1, 1,
0.5721946, 0.3347863, 1.119955, 1, 0, 0, 1, 1,
0.5728586, 1.248857, 0.3829215, 1, 0, 0, 1, 1,
0.5753916, 0.5054107, -0.3309484, 1, 0, 0, 1, 1,
0.5802734, -0.5872893, 3.240361, 1, 0, 0, 1, 1,
0.5868216, 1.3938, 0.3347118, 1, 0, 0, 1, 1,
0.5885206, 0.1946519, 1.589106, 0, 0, 0, 1, 1,
0.5913668, -1.470436, 4.323562, 0, 0, 0, 1, 1,
0.5918642, -0.6637913, 2.286737, 0, 0, 0, 1, 1,
0.5950844, 0.5579318, 1.415677, 0, 0, 0, 1, 1,
0.5955324, 0.8690838, -0.2681307, 0, 0, 0, 1, 1,
0.6034431, -0.7361775, 2.381036, 0, 0, 0, 1, 1,
0.610734, 1.213814, 0.8497679, 0, 0, 0, 1, 1,
0.6115491, -0.1157042, 2.546045, 1, 1, 1, 1, 1,
0.6124461, -0.2034135, 1.87503, 1, 1, 1, 1, 1,
0.6147613, 2.82002, -0.2194127, 1, 1, 1, 1, 1,
0.6190413, -0.3908223, 4.352761, 1, 1, 1, 1, 1,
0.6193186, -2.523085, 1.944518, 1, 1, 1, 1, 1,
0.6213054, -0.4572726, 1.854716, 1, 1, 1, 1, 1,
0.6262057, -1.335411, 2.571168, 1, 1, 1, 1, 1,
0.6286425, -1.203554, 2.95402, 1, 1, 1, 1, 1,
0.6340046, -0.3963014, 1.288904, 1, 1, 1, 1, 1,
0.640368, -0.71703, 2.501204, 1, 1, 1, 1, 1,
0.6414242, 0.249834, 0.3727992, 1, 1, 1, 1, 1,
0.6467414, 0.1236325, 1.521543, 1, 1, 1, 1, 1,
0.647547, -0.2085748, 3.756786, 1, 1, 1, 1, 1,
0.6522517, 0.5613123, 0.5084025, 1, 1, 1, 1, 1,
0.6554227, -0.3459523, 3.090143, 1, 1, 1, 1, 1,
0.664291, -0.7759656, 3.369144, 0, 0, 1, 1, 1,
0.6661149, -1.029182, 2.911024, 1, 0, 0, 1, 1,
0.6682424, -1.553675, 1.566726, 1, 0, 0, 1, 1,
0.6734731, 3.043082, 0.08301466, 1, 0, 0, 1, 1,
0.6761821, -0.1080123, 3.490316, 1, 0, 0, 1, 1,
0.6768271, 0.4267182, 1.159765, 1, 0, 0, 1, 1,
0.6768382, 1.052559, 0.3262936, 0, 0, 0, 1, 1,
0.6842131, -0.6893582, 1.973135, 0, 0, 0, 1, 1,
0.6848949, -1.17228, 2.186432, 0, 0, 0, 1, 1,
0.6850738, 0.3772442, 1.870012, 0, 0, 0, 1, 1,
0.6878275, -1.456342, 2.201545, 0, 0, 0, 1, 1,
0.6928685, -1.100499, 2.79084, 0, 0, 0, 1, 1,
0.6996267, 0.7365483, 1.475889, 0, 0, 0, 1, 1,
0.7120457, -0.6115996, 2.800454, 1, 1, 1, 1, 1,
0.7139958, 1.652149, 0.6559216, 1, 1, 1, 1, 1,
0.7146983, 0.09676562, 1.22345, 1, 1, 1, 1, 1,
0.7153926, 0.4954528, 1.396422, 1, 1, 1, 1, 1,
0.7158089, -1.41726, 1.799629, 1, 1, 1, 1, 1,
0.7162471, -1.663018, 4.175758, 1, 1, 1, 1, 1,
0.7214975, 0.7186027, -0.7408201, 1, 1, 1, 1, 1,
0.7268429, -0.5148387, 1.405959, 1, 1, 1, 1, 1,
0.7272184, 0.3244828, 0.003051436, 1, 1, 1, 1, 1,
0.7306719, -0.1304483, 1.623742, 1, 1, 1, 1, 1,
0.7310276, 0.5944163, -0.01306906, 1, 1, 1, 1, 1,
0.7330739, -2.085129, 2.236967, 1, 1, 1, 1, 1,
0.7340509, -0.1245986, 2.605907, 1, 1, 1, 1, 1,
0.7368847, -1.276568, 2.256235, 1, 1, 1, 1, 1,
0.7385345, 0.7649843, -0.9054368, 1, 1, 1, 1, 1,
0.7387991, -0.3048543, 2.001955, 0, 0, 1, 1, 1,
0.7418129, 0.7785872, 0.5908957, 1, 0, 0, 1, 1,
0.7418569, 1.528699, 1.797658, 1, 0, 0, 1, 1,
0.7423322, -0.2693645, 2.525508, 1, 0, 0, 1, 1,
0.7444943, 1.293869, -0.09649464, 1, 0, 0, 1, 1,
0.7465317, 0.3766377, -1.463498, 1, 0, 0, 1, 1,
0.7583997, -1.051987, 2.395839, 0, 0, 0, 1, 1,
0.7593865, 0.6907278, 2.884521, 0, 0, 0, 1, 1,
0.775982, 0.6422293, 2.927875, 0, 0, 0, 1, 1,
0.7767319, 0.5952909, 1.350293, 0, 0, 0, 1, 1,
0.7790337, -0.978446, 3.177563, 0, 0, 0, 1, 1,
0.7800278, -1.709238, 2.370246, 0, 0, 0, 1, 1,
0.7816738, -0.1477061, 1.099663, 0, 0, 0, 1, 1,
0.7827728, -0.2528761, 2.363972, 1, 1, 1, 1, 1,
0.7841187, -1.443429, 2.241902, 1, 1, 1, 1, 1,
0.7852883, -0.9963171, 1.699713, 1, 1, 1, 1, 1,
0.7947694, 0.3750368, 0.7577574, 1, 1, 1, 1, 1,
0.7949203, 0.006719617, 0.9560555, 1, 1, 1, 1, 1,
0.7987299, -0.5305568, 3.001242, 1, 1, 1, 1, 1,
0.8008, -0.6845032, 1.980654, 1, 1, 1, 1, 1,
0.8086914, 0.59198, 1.022221, 1, 1, 1, 1, 1,
0.8292161, 0.3426072, 2.99064, 1, 1, 1, 1, 1,
0.8337584, 1.137238, -0.277472, 1, 1, 1, 1, 1,
0.8413798, 1.324539, 1.711433, 1, 1, 1, 1, 1,
0.8437136, 0.185456, 1.95883, 1, 1, 1, 1, 1,
0.8469685, 1.318845, 0.5390636, 1, 1, 1, 1, 1,
0.8509176, -0.4748524, 2.031254, 1, 1, 1, 1, 1,
0.8533873, -1.086968, 2.789303, 1, 1, 1, 1, 1,
0.87826, -0.5845572, 3.194864, 0, 0, 1, 1, 1,
0.8790862, 0.2837429, 1.709794, 1, 0, 0, 1, 1,
0.9014258, -1.063147, 1.887712, 1, 0, 0, 1, 1,
0.9015582, 0.4867132, 2.146794, 1, 0, 0, 1, 1,
0.9060141, -0.5180338, 1.597597, 1, 0, 0, 1, 1,
0.9078375, 1.105738, 0.7354845, 1, 0, 0, 1, 1,
0.9102732, -0.6951271, 1.294378, 0, 0, 0, 1, 1,
0.9119602, 0.2664559, 0.7816469, 0, 0, 0, 1, 1,
0.9146493, 0.5070092, 1.482034, 0, 0, 0, 1, 1,
0.9148574, -1.365016, 2.660541, 0, 0, 0, 1, 1,
0.9225426, 0.2837824, 2.17895, 0, 0, 0, 1, 1,
0.9235128, 0.2232048, 0.5828699, 0, 0, 0, 1, 1,
0.9239792, -0.005278878, 2.167112, 0, 0, 0, 1, 1,
0.9277511, 0.03740258, 1.232767, 1, 1, 1, 1, 1,
0.9357718, -1.631581, 3.157682, 1, 1, 1, 1, 1,
0.9410033, -1.028224, 3.181341, 1, 1, 1, 1, 1,
0.941542, -0.3620864, 1.765235, 1, 1, 1, 1, 1,
0.9448674, 0.8169579, 1.502453, 1, 1, 1, 1, 1,
0.9453163, 1.203951, 1.704248, 1, 1, 1, 1, 1,
0.9648702, -0.8600091, 3.707735, 1, 1, 1, 1, 1,
0.9697301, 1.835442, 0.319351, 1, 1, 1, 1, 1,
0.9719784, -0.3673849, 2.923822, 1, 1, 1, 1, 1,
0.9758174, -1.857754, 3.284809, 1, 1, 1, 1, 1,
0.9861376, -0.6061919, 1.382364, 1, 1, 1, 1, 1,
0.9869173, -0.6953928, 2.521383, 1, 1, 1, 1, 1,
0.9873727, 0.02077607, 1.673884, 1, 1, 1, 1, 1,
0.9886868, -2.175517, 3.115195, 1, 1, 1, 1, 1,
0.995199, -0.1208894, 1.861383, 1, 1, 1, 1, 1,
1.003055, -1.080867, 3.434102, 0, 0, 1, 1, 1,
1.007788, 0.3030599, 2.395744, 1, 0, 0, 1, 1,
1.01472, 0.4752743, 1.256849, 1, 0, 0, 1, 1,
1.01681, -0.6291417, 2.691681, 1, 0, 0, 1, 1,
1.017063, 0.5083328, 0.7842019, 1, 0, 0, 1, 1,
1.019993, -0.4521531, 0.09375586, 1, 0, 0, 1, 1,
1.021374, 0.5808328, 1.870399, 0, 0, 0, 1, 1,
1.023814, -1.2928, 0.9628308, 0, 0, 0, 1, 1,
1.028294, 0.5468859, 1.679154, 0, 0, 0, 1, 1,
1.02962, 0.3441164, -0.04274843, 0, 0, 0, 1, 1,
1.031484, 0.204008, 0.6801713, 0, 0, 0, 1, 1,
1.037625, -0.6872629, 2.62562, 0, 0, 0, 1, 1,
1.038325, -0.4337342, 1.474756, 0, 0, 0, 1, 1,
1.044144, -2.586679, 3.040393, 1, 1, 1, 1, 1,
1.046598, 1.633369, 0.5686309, 1, 1, 1, 1, 1,
1.054361, 0.7487173, 0.275189, 1, 1, 1, 1, 1,
1.055618, 0.00959442, 0.3444004, 1, 1, 1, 1, 1,
1.057336, -0.08989932, 1.821341, 1, 1, 1, 1, 1,
1.058595, 0.2902673, 0.1177711, 1, 1, 1, 1, 1,
1.061944, -0.7615815, 3.998954, 1, 1, 1, 1, 1,
1.065913, 0.3194427, 1.98608, 1, 1, 1, 1, 1,
1.067054, 1.317839, 0.2223354, 1, 1, 1, 1, 1,
1.06749, 1.084516, 0.5458176, 1, 1, 1, 1, 1,
1.073713, 0.6797003, 1.91338, 1, 1, 1, 1, 1,
1.075387, -1.29231, 3.286636, 1, 1, 1, 1, 1,
1.076742, 0.7026601, 2.313345, 1, 1, 1, 1, 1,
1.077419, -0.1129126, 0.5103222, 1, 1, 1, 1, 1,
1.08488, -0.3900627, 1.863238, 1, 1, 1, 1, 1,
1.091181, -0.2831828, 3.709458, 0, 0, 1, 1, 1,
1.096653, 0.3774573, 4.073412, 1, 0, 0, 1, 1,
1.105265, -0.268406, 1.948178, 1, 0, 0, 1, 1,
1.106057, 0.5289292, 0.5220676, 1, 0, 0, 1, 1,
1.106732, -0.3224456, 1.73111, 1, 0, 0, 1, 1,
1.107314, -0.6454406, 3.657001, 1, 0, 0, 1, 1,
1.107884, -0.2331664, 3.082765, 0, 0, 0, 1, 1,
1.108463, 0.3647375, 3.050278, 0, 0, 0, 1, 1,
1.111627, -0.314598, 2.054163, 0, 0, 0, 1, 1,
1.116708, 0.5582368, -0.3295475, 0, 0, 0, 1, 1,
1.130865, -0.150535, 2.964557, 0, 0, 0, 1, 1,
1.130899, -0.2745501, 1.028608, 0, 0, 0, 1, 1,
1.13265, 1.770176, 2.1587, 0, 0, 0, 1, 1,
1.137745, 0.01160654, 1.347755, 1, 1, 1, 1, 1,
1.149221, -2.003368, 1.397972, 1, 1, 1, 1, 1,
1.153328, -0.8140543, 2.189243, 1, 1, 1, 1, 1,
1.153702, 1.161722, 2.13544, 1, 1, 1, 1, 1,
1.156901, -0.04382358, 1.37462, 1, 1, 1, 1, 1,
1.159304, -0.4373155, 1.353793, 1, 1, 1, 1, 1,
1.160123, 0.2172631, -0.7123185, 1, 1, 1, 1, 1,
1.1636, -0.7518004, 2.980606, 1, 1, 1, 1, 1,
1.166826, 0.03225165, 0.951024, 1, 1, 1, 1, 1,
1.167075, -0.2015795, 1.287026, 1, 1, 1, 1, 1,
1.169917, 1.111417, 0.9470342, 1, 1, 1, 1, 1,
1.193758, -0.01884009, 3.55703, 1, 1, 1, 1, 1,
1.202677, 1.421351, 0.2432483, 1, 1, 1, 1, 1,
1.227097, -0.5644638, 1.14433, 1, 1, 1, 1, 1,
1.228964, -1.509499, 2.873128, 1, 1, 1, 1, 1,
1.234456, -0.5667259, 0.9060853, 0, 0, 1, 1, 1,
1.236429, -2.706539, 1.520435, 1, 0, 0, 1, 1,
1.239395, -0.9735333, 0.2369445, 1, 0, 0, 1, 1,
1.254323, 0.4680677, 1.626995, 1, 0, 0, 1, 1,
1.255677, 1.799891, 0.1219121, 1, 0, 0, 1, 1,
1.256182, -1.157678, 2.610929, 1, 0, 0, 1, 1,
1.257272, -0.4238377, 3.898948, 0, 0, 0, 1, 1,
1.264338, -0.009078069, 3.118171, 0, 0, 0, 1, 1,
1.267246, -0.6444483, 2.989379, 0, 0, 0, 1, 1,
1.274691, -0.6050397, 1.381983, 0, 0, 0, 1, 1,
1.28782, 0.649247, 2.327318, 0, 0, 0, 1, 1,
1.294341, 1.825417, 0.8743076, 0, 0, 0, 1, 1,
1.310663, 1.409691, -0.7291795, 0, 0, 0, 1, 1,
1.313087, 1.960457, 1.027632, 1, 1, 1, 1, 1,
1.324808, -0.8706646, 1.562715, 1, 1, 1, 1, 1,
1.329851, -0.6344978, 2.176698, 1, 1, 1, 1, 1,
1.329942, 0.3669397, -0.9285381, 1, 1, 1, 1, 1,
1.332714, -0.8861995, 2.176867, 1, 1, 1, 1, 1,
1.333816, 0.5537207, -0.1862841, 1, 1, 1, 1, 1,
1.342539, 0.5709799, 0.0640843, 1, 1, 1, 1, 1,
1.346661, -0.06854017, -1.036628, 1, 1, 1, 1, 1,
1.351909, -1.35726, 1.903054, 1, 1, 1, 1, 1,
1.353059, 2.039954, -0.6926118, 1, 1, 1, 1, 1,
1.354699, -0.9023349, 1.349927, 1, 1, 1, 1, 1,
1.359534, -0.898312, 1.322916, 1, 1, 1, 1, 1,
1.36304, 0.1736026, 1.872836, 1, 1, 1, 1, 1,
1.367121, -0.3314657, 2.537381, 1, 1, 1, 1, 1,
1.377071, -2.279207, 3.032733, 1, 1, 1, 1, 1,
1.385205, 0.9083966, -0.2044895, 0, 0, 1, 1, 1,
1.393267, -0.559741, 2.99454, 1, 0, 0, 1, 1,
1.393483, 2.028972, 0.4484743, 1, 0, 0, 1, 1,
1.396887, 1.499959, 0.3939357, 1, 0, 0, 1, 1,
1.399466, -1.088313, 0.5769193, 1, 0, 0, 1, 1,
1.399809, 0.2967082, 2.83046, 1, 0, 0, 1, 1,
1.403959, 0.07361811, 2.439784, 0, 0, 0, 1, 1,
1.406065, 0.9587646, 0.5315037, 0, 0, 0, 1, 1,
1.418728, 1.76913, 1.540661, 0, 0, 0, 1, 1,
1.425823, 2.132872, 2.081002, 0, 0, 0, 1, 1,
1.428377, -0.2685116, 0.4482773, 0, 0, 0, 1, 1,
1.440577, 0.4059136, 1.31507, 0, 0, 0, 1, 1,
1.441316, 1.164381, 2.422792, 0, 0, 0, 1, 1,
1.442972, -0.9361797, 2.906023, 1, 1, 1, 1, 1,
1.476076, -0.5268455, 1.022457, 1, 1, 1, 1, 1,
1.482612, 1.518118, 0.294812, 1, 1, 1, 1, 1,
1.49246, 1.131861, 0.01535995, 1, 1, 1, 1, 1,
1.50151, 1.502083, 1.848461, 1, 1, 1, 1, 1,
1.503154, -0.469604, -0.1570717, 1, 1, 1, 1, 1,
1.50789, -0.7205634, 1.508907, 1, 1, 1, 1, 1,
1.517746, -0.1209133, 0.8124329, 1, 1, 1, 1, 1,
1.51961, -0.4349122, 0.8841183, 1, 1, 1, 1, 1,
1.521315, 1.172126, -0.3292761, 1, 1, 1, 1, 1,
1.545271, -0.1732551, 0.8653803, 1, 1, 1, 1, 1,
1.553062, 0.07181013, 1.43203, 1, 1, 1, 1, 1,
1.558587, -0.9152368, 1.534946, 1, 1, 1, 1, 1,
1.579851, -1.083192, 3.275903, 1, 1, 1, 1, 1,
1.585916, -0.3213311, -0.5910857, 1, 1, 1, 1, 1,
1.615306, -1.71975, 1.937656, 0, 0, 1, 1, 1,
1.637554, -1.249709, 1.491759, 1, 0, 0, 1, 1,
1.648572, -3.996043, 2.661894, 1, 0, 0, 1, 1,
1.665182, -0.2971906, 1.392641, 1, 0, 0, 1, 1,
1.671018, -1.166653, 1.559734, 1, 0, 0, 1, 1,
1.671045, 1.312784, 1.429981, 1, 0, 0, 1, 1,
1.689116, 0.4431372, 1.591159, 0, 0, 0, 1, 1,
1.711463, -0.5037063, 2.443092, 0, 0, 0, 1, 1,
1.72896, -0.6353586, 2.258105, 0, 0, 0, 1, 1,
1.736591, -0.7967673, 2.449884, 0, 0, 0, 1, 1,
1.742925, -0.3712496, 1.847573, 0, 0, 0, 1, 1,
1.755279, 1.595682, 1.149032, 0, 0, 0, 1, 1,
1.771447, -0.3494269, 1.613016, 0, 0, 0, 1, 1,
1.777811, -0.05290868, 0.5816085, 1, 1, 1, 1, 1,
1.801875, 0.04123856, 2.30112, 1, 1, 1, 1, 1,
1.802374, 0.8594289, 0.8447384, 1, 1, 1, 1, 1,
1.810042, -0.8127634, 1.351476, 1, 1, 1, 1, 1,
1.811459, -2.094329, 4.434036, 1, 1, 1, 1, 1,
1.835554, -0.7515383, 0.3606168, 1, 1, 1, 1, 1,
1.844057, -2.809943, 4.255888, 1, 1, 1, 1, 1,
1.869678, -0.215203, 2.968053, 1, 1, 1, 1, 1,
1.884188, -0.7523819, 2.141818, 1, 1, 1, 1, 1,
1.890515, 2.280889, 1.493149, 1, 1, 1, 1, 1,
1.909799, -0.09315178, 0.6434932, 1, 1, 1, 1, 1,
1.933637, -1.055265, 2.667285, 1, 1, 1, 1, 1,
1.934751, 1.285766, -1.290311, 1, 1, 1, 1, 1,
1.938622, -0.7712653, 2.914374, 1, 1, 1, 1, 1,
1.96073, 0.3573845, 1.419818, 1, 1, 1, 1, 1,
1.993766, -1.091431, 1.867257, 0, 0, 1, 1, 1,
2.064957, -1.502075, 1.958264, 1, 0, 0, 1, 1,
2.073716, -0.3773334, 0.9509462, 1, 0, 0, 1, 1,
2.07932, -0.3481801, 2.855114, 1, 0, 0, 1, 1,
2.089256, -1.816865, 2.099431, 1, 0, 0, 1, 1,
2.151993, 0.1473971, 0.7004367, 1, 0, 0, 1, 1,
2.216929, -0.9359214, 2.463119, 0, 0, 0, 1, 1,
2.22009, -0.09383294, 1.093311, 0, 0, 0, 1, 1,
2.236317, 0.7461638, 1.533789, 0, 0, 0, 1, 1,
2.262816, -0.2992103, 1.850492, 0, 0, 0, 1, 1,
2.268004, 0.1917436, 3.222485, 0, 0, 0, 1, 1,
2.326363, 0.9005281, 2.98097, 0, 0, 0, 1, 1,
2.380453, 0.2216424, -0.00383169, 0, 0, 0, 1, 1,
2.406876, 0.005693609, 0.5334073, 1, 1, 1, 1, 1,
2.574109, 1.061271, 0.9574562, 1, 1, 1, 1, 1,
2.587783, -0.1872885, 1.255701, 1, 1, 1, 1, 1,
2.770983, 0.06792951, 1.601817, 1, 1, 1, 1, 1,
2.78575, 1.958932, 3.166046, 1, 1, 1, 1, 1,
2.934825, -0.1146335, 2.376976, 1, 1, 1, 1, 1,
3.614542, -0.8053716, 1.134618, 1, 1, 1, 1, 1
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
var radius = 9.874809;
var distance = 34.68485;
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
mvMatrix.translate( -0.259392, 0.4764805, 0.3597043 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.68485);
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
