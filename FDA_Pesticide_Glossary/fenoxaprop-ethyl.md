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
-3.039908, -0.2101683, -2.166876, 1, 0, 0, 1,
-2.804192, -0.0306638, -0.6302344, 1, 0.007843138, 0, 1,
-2.797996, -0.5338182, -1.409407, 1, 0.01176471, 0, 1,
-2.789191, -0.5244541, -1.704572, 1, 0.01960784, 0, 1,
-2.692344, 2.169564, -1.500441, 1, 0.02352941, 0, 1,
-2.595934, -0.8292643, -2.905634, 1, 0.03137255, 0, 1,
-2.556716, -1.459625, -2.141824, 1, 0.03529412, 0, 1,
-2.412779, -1.10334, -3.141928, 1, 0.04313726, 0, 1,
-2.291188, 0.5644802, -1.263041, 1, 0.04705882, 0, 1,
-2.272065, 0.3680128, -0.3224438, 1, 0.05490196, 0, 1,
-2.233471, -0.08702015, -1.487146, 1, 0.05882353, 0, 1,
-2.231376, -0.6867755, -1.786496, 1, 0.06666667, 0, 1,
-2.205848, -0.3204948, -1.379818, 1, 0.07058824, 0, 1,
-2.168097, -1.425501, -1.89677, 1, 0.07843138, 0, 1,
-2.153828, -0.7170147, -1.28984, 1, 0.08235294, 0, 1,
-2.142286, -1.011369, -1.975066, 1, 0.09019608, 0, 1,
-2.131545, -0.104594, -2.102231, 1, 0.09411765, 0, 1,
-2.123711, 0.5934986, -3.159178, 1, 0.1019608, 0, 1,
-2.116731, 0.5146736, -1.390886, 1, 0.1098039, 0, 1,
-2.101576, 1.146798, 1.989246, 1, 0.1137255, 0, 1,
-2.068173, 1.349359, -0.7338705, 1, 0.1215686, 0, 1,
-2.064206, -0.3772235, -1.09507, 1, 0.1254902, 0, 1,
-2.035265, -2.001522, -3.471145, 1, 0.1333333, 0, 1,
-2.028146, -0.8254061, -2.483654, 1, 0.1372549, 0, 1,
-2.02423, 2.215608, -1.39564, 1, 0.145098, 0, 1,
-2.019521, 1.054408, -2.334353, 1, 0.1490196, 0, 1,
-2.011705, -0.2006485, -0.5120531, 1, 0.1568628, 0, 1,
-1.9396, 0.1422718, -1.75614, 1, 0.1607843, 0, 1,
-1.884289, -0.5417449, -2.131088, 1, 0.1686275, 0, 1,
-1.883142, -1.292196, -2.416939, 1, 0.172549, 0, 1,
-1.838202, -1.259476, -3.391747, 1, 0.1803922, 0, 1,
-1.833727, -0.3500222, -0.7883112, 1, 0.1843137, 0, 1,
-1.820078, 0.3664953, -3.061779, 1, 0.1921569, 0, 1,
-1.813555, 1.480805, -2.259248, 1, 0.1960784, 0, 1,
-1.810583, -2.607673, -2.823705, 1, 0.2039216, 0, 1,
-1.803659, 0.8402514, -1.176105, 1, 0.2117647, 0, 1,
-1.801564, 0.7520006, -1.684322, 1, 0.2156863, 0, 1,
-1.787247, -0.009662283, -1.402526, 1, 0.2235294, 0, 1,
-1.769916, -1.380292, -2.190762, 1, 0.227451, 0, 1,
-1.766278, 0.2965676, -3.322592, 1, 0.2352941, 0, 1,
-1.752458, -1.365222, -2.464702, 1, 0.2392157, 0, 1,
-1.750712, -0.7465125, -1.242766, 1, 0.2470588, 0, 1,
-1.744255, 0.7280701, -0.8560014, 1, 0.2509804, 0, 1,
-1.711994, -0.3809421, -2.920737, 1, 0.2588235, 0, 1,
-1.693792, 0.7987431, -0.1772895, 1, 0.2627451, 0, 1,
-1.6905, 0.8262169, -0.8442112, 1, 0.2705882, 0, 1,
-1.660297, 1.777562, 1.470755, 1, 0.2745098, 0, 1,
-1.655513, 2.291409, -1.486744, 1, 0.282353, 0, 1,
-1.650241, -0.3231533, -1.660074, 1, 0.2862745, 0, 1,
-1.614878, 0.3804454, -0.1473072, 1, 0.2941177, 0, 1,
-1.609473, 2.734356, -1.071971, 1, 0.3019608, 0, 1,
-1.608078, 1.771461, 0.6313051, 1, 0.3058824, 0, 1,
-1.600936, -0.3446045, -2.062615, 1, 0.3137255, 0, 1,
-1.59907, -2.383063, -1.715473, 1, 0.3176471, 0, 1,
-1.598447, -0.001252869, -1.658269, 1, 0.3254902, 0, 1,
-1.596834, 0.702617, -1.204851, 1, 0.3294118, 0, 1,
-1.586773, -0.2478564, -1.027413, 1, 0.3372549, 0, 1,
-1.56932, -0.4323907, -2.921503, 1, 0.3411765, 0, 1,
-1.549084, -1.225406, -1.424989, 1, 0.3490196, 0, 1,
-1.537717, -0.04223363, -1.286335, 1, 0.3529412, 0, 1,
-1.527072, 0.6139613, -0.7179376, 1, 0.3607843, 0, 1,
-1.525274, 0.3095467, -1.94878, 1, 0.3647059, 0, 1,
-1.521598, -0.6021487, -0.6992224, 1, 0.372549, 0, 1,
-1.519542, -1.297972, -3.435007, 1, 0.3764706, 0, 1,
-1.493358, 1.306152, -0.8887818, 1, 0.3843137, 0, 1,
-1.492824, -0.1252584, -2.952865, 1, 0.3882353, 0, 1,
-1.484495, -0.8381799, -1.448576, 1, 0.3960784, 0, 1,
-1.481154, 0.1622691, -2.084656, 1, 0.4039216, 0, 1,
-1.473305, -0.9347295, -2.142115, 1, 0.4078431, 0, 1,
-1.462213, -0.4744531, -1.489994, 1, 0.4156863, 0, 1,
-1.461227, -0.3920335, -1.711825, 1, 0.4196078, 0, 1,
-1.447195, -1.373317, -2.401761, 1, 0.427451, 0, 1,
-1.437037, 1.355835, -0.4778145, 1, 0.4313726, 0, 1,
-1.431091, -1.268867, -0.5326458, 1, 0.4392157, 0, 1,
-1.417984, 2.080145, -1.903324, 1, 0.4431373, 0, 1,
-1.405554, 0.9036781, -1.630897, 1, 0.4509804, 0, 1,
-1.404078, -1.137628, -3.88753, 1, 0.454902, 0, 1,
-1.402511, 0.6114289, -1.887384, 1, 0.4627451, 0, 1,
-1.400902, 0.8923787, 1.261883, 1, 0.4666667, 0, 1,
-1.397849, 0.2685752, 0.003216874, 1, 0.4745098, 0, 1,
-1.394537, -0.7068844, -1.601435, 1, 0.4784314, 0, 1,
-1.390541, 1.267226, -1.324119, 1, 0.4862745, 0, 1,
-1.388699, 1.096811, -2.34469, 1, 0.4901961, 0, 1,
-1.377433, -1.425152, -3.17589, 1, 0.4980392, 0, 1,
-1.372335, -0.07777938, -2.598961, 1, 0.5058824, 0, 1,
-1.371228, -1.384334, -0.5499164, 1, 0.509804, 0, 1,
-1.367153, 1.098622, 0.4373548, 1, 0.5176471, 0, 1,
-1.365381, 0.7095429, -1.712956, 1, 0.5215687, 0, 1,
-1.365036, -1.616645, -2.456962, 1, 0.5294118, 0, 1,
-1.359424, 0.9536958, 0.5495707, 1, 0.5333334, 0, 1,
-1.346365, 0.6989406, -0.7582081, 1, 0.5411765, 0, 1,
-1.346173, 0.6304836, -1.312928, 1, 0.5450981, 0, 1,
-1.34578, -0.2535296, -2.197099, 1, 0.5529412, 0, 1,
-1.324914, -1.236544, -1.127989, 1, 0.5568628, 0, 1,
-1.318083, -0.3800136, -1.809184, 1, 0.5647059, 0, 1,
-1.310341, 0.7724127, -2.333292, 1, 0.5686275, 0, 1,
-1.304925, -1.01157, -3.182223, 1, 0.5764706, 0, 1,
-1.28884, -0.2515734, -0.2334555, 1, 0.5803922, 0, 1,
-1.286606, -1.69825, -1.953244, 1, 0.5882353, 0, 1,
-1.28162, 0.9712222, -1.378988, 1, 0.5921569, 0, 1,
-1.277885, -1.255644, -1.998434, 1, 0.6, 0, 1,
-1.265665, 0.1981637, -3.527812, 1, 0.6078432, 0, 1,
-1.265401, 0.04409185, -2.555295, 1, 0.6117647, 0, 1,
-1.24237, -0.3276162, -2.301458, 1, 0.6196079, 0, 1,
-1.238518, -1.83333, -3.331134, 1, 0.6235294, 0, 1,
-1.228084, -1.9501, -4.396451, 1, 0.6313726, 0, 1,
-1.22515, 0.902027, -1.011132, 1, 0.6352941, 0, 1,
-1.216887, 0.4972716, -1.297823, 1, 0.6431373, 0, 1,
-1.209935, 1.092374, -0.5085054, 1, 0.6470588, 0, 1,
-1.20463, -0.6248744, -0.7860354, 1, 0.654902, 0, 1,
-1.203929, -0.1225503, -3.923418, 1, 0.6588235, 0, 1,
-1.202381, -0.6480776, -1.262353, 1, 0.6666667, 0, 1,
-1.198846, -0.2081725, -1.457844, 1, 0.6705883, 0, 1,
-1.198446, 0.7480024, -0.7220867, 1, 0.6784314, 0, 1,
-1.195544, 0.2055396, -1.400505, 1, 0.682353, 0, 1,
-1.184486, -2.728223, -2.227036, 1, 0.6901961, 0, 1,
-1.184429, -0.4486673, -0.2400201, 1, 0.6941177, 0, 1,
-1.182743, 0.9980047, -0.9323109, 1, 0.7019608, 0, 1,
-1.17214, 0.2924884, -1.001714, 1, 0.7098039, 0, 1,
-1.168603, -0.3552469, -1.086184, 1, 0.7137255, 0, 1,
-1.162555, 1.700871, -0.04877457, 1, 0.7215686, 0, 1,
-1.161428, -0.6548083, -0.3035317, 1, 0.7254902, 0, 1,
-1.156472, -0.006933961, -2.084612, 1, 0.7333333, 0, 1,
-1.152926, -1.0908, -3.112135, 1, 0.7372549, 0, 1,
-1.1527, -0.2829654, -2.055419, 1, 0.7450981, 0, 1,
-1.152013, -1.522946, -4.395616, 1, 0.7490196, 0, 1,
-1.144575, 0.1689565, 0.53026, 1, 0.7568628, 0, 1,
-1.143352, -0.9274569, -4.262025, 1, 0.7607843, 0, 1,
-1.132258, 0.7823489, 1.308864, 1, 0.7686275, 0, 1,
-1.130748, 0.7375326, 0.2805958, 1, 0.772549, 0, 1,
-1.128941, -0.07512573, -3.020179, 1, 0.7803922, 0, 1,
-1.125709, -0.4264022, -2.079195, 1, 0.7843137, 0, 1,
-1.118959, 0.1780177, -1.480045, 1, 0.7921569, 0, 1,
-1.110204, -1.136946, -0.9682028, 1, 0.7960784, 0, 1,
-1.107071, 0.03006408, -2.588483, 1, 0.8039216, 0, 1,
-1.105265, -2.003417, -2.604038, 1, 0.8117647, 0, 1,
-1.100947, -1.100507, -1.840422, 1, 0.8156863, 0, 1,
-1.100272, 0.7110006, -0.3106663, 1, 0.8235294, 0, 1,
-1.098652, -0.4869869, -2.902586, 1, 0.827451, 0, 1,
-1.09737, 0.3470373, -1.015236, 1, 0.8352941, 0, 1,
-1.093567, -0.03466296, -1.073982, 1, 0.8392157, 0, 1,
-1.089546, -2.165736, -2.766195, 1, 0.8470588, 0, 1,
-1.080308, -0.1226483, -1.931155, 1, 0.8509804, 0, 1,
-1.072443, -0.247263, -0.4937528, 1, 0.8588235, 0, 1,
-1.064631, 0.9712893, -0.5947459, 1, 0.8627451, 0, 1,
-1.062175, 0.6483142, 0.3244672, 1, 0.8705882, 0, 1,
-1.056007, -0.1071206, -1.458809, 1, 0.8745098, 0, 1,
-1.05436, 0.7129173, -1.141748, 1, 0.8823529, 0, 1,
-1.050209, -0.7035025, -4.397866, 1, 0.8862745, 0, 1,
-1.047876, 1.804093, 0.3766429, 1, 0.8941177, 0, 1,
-1.042168, 0.00569538, -3.251741, 1, 0.8980392, 0, 1,
-1.039704, 0.6493841, -2.771652, 1, 0.9058824, 0, 1,
-1.030339, 1.527728, -1.151588, 1, 0.9137255, 0, 1,
-1.028286, -0.2550083, -1.632015, 1, 0.9176471, 0, 1,
-1.027565, 1.510018, -0.6005527, 1, 0.9254902, 0, 1,
-1.026424, -2.681975, -3.3459, 1, 0.9294118, 0, 1,
-1.01826, 0.7237421, 0.38923, 1, 0.9372549, 0, 1,
-1.015657, -1.490961, -2.292642, 1, 0.9411765, 0, 1,
-1.001426, 0.5781946, 0.08196819, 1, 0.9490196, 0, 1,
-0.9989508, 0.6807696, -0.1174389, 1, 0.9529412, 0, 1,
-0.9852758, 0.5677873, -0.4105215, 1, 0.9607843, 0, 1,
-0.9828867, -0.8476953, -2.763427, 1, 0.9647059, 0, 1,
-0.9828538, 1.351711, 0.09057931, 1, 0.972549, 0, 1,
-0.9755811, 0.1927711, -2.15272, 1, 0.9764706, 0, 1,
-0.9755013, 0.3321919, -1.252113, 1, 0.9843137, 0, 1,
-0.9754553, -0.7159983, -2.513676, 1, 0.9882353, 0, 1,
-0.9750796, 1.54013, -1.696585, 1, 0.9960784, 0, 1,
-0.9739639, 0.7938465, -0.2410301, 0.9960784, 1, 0, 1,
-0.9700903, 1.596203, -1.263293, 0.9921569, 1, 0, 1,
-0.9620354, -0.831715, -2.592968, 0.9843137, 1, 0, 1,
-0.9547472, 0.4993266, -1.93098, 0.9803922, 1, 0, 1,
-0.9480438, 0.5664384, -1.922566, 0.972549, 1, 0, 1,
-0.9455495, -0.8256961, -1.895957, 0.9686275, 1, 0, 1,
-0.9327053, 0.403608, -1.94871, 0.9607843, 1, 0, 1,
-0.9256851, -0.6103079, -1.601802, 0.9568627, 1, 0, 1,
-0.9227542, -1.326808, -2.959266, 0.9490196, 1, 0, 1,
-0.9144596, -0.6943336, -1.372618, 0.945098, 1, 0, 1,
-0.8944881, 1.235756, -1.264362, 0.9372549, 1, 0, 1,
-0.8913646, 1.395146, -0.3786971, 0.9333333, 1, 0, 1,
-0.8904009, 0.6102991, -0.887064, 0.9254902, 1, 0, 1,
-0.873334, -0.5831817, -2.737277, 0.9215686, 1, 0, 1,
-0.8646056, -0.7498665, -1.289112, 0.9137255, 1, 0, 1,
-0.861052, 1.563819, 0.0533225, 0.9098039, 1, 0, 1,
-0.8572113, 0.2628966, -1.919385, 0.9019608, 1, 0, 1,
-0.8516515, 0.3173924, -2.14136, 0.8941177, 1, 0, 1,
-0.8501619, 0.7489905, -2.618388, 0.8901961, 1, 0, 1,
-0.8496439, 2.42975, 0.6778028, 0.8823529, 1, 0, 1,
-0.8462704, 0.1559447, -1.576296, 0.8784314, 1, 0, 1,
-0.8422402, 1.212132, 0.2844252, 0.8705882, 1, 0, 1,
-0.8406718, -1.193667, -2.119281, 0.8666667, 1, 0, 1,
-0.8396464, -1.09478, -3.364148, 0.8588235, 1, 0, 1,
-0.8395168, -1.994904, -2.217705, 0.854902, 1, 0, 1,
-0.8390187, 2.159429, 0.3071425, 0.8470588, 1, 0, 1,
-0.8387091, -0.2660561, 0.7510915, 0.8431373, 1, 0, 1,
-0.8367931, 0.8718021, 0.2528276, 0.8352941, 1, 0, 1,
-0.8357949, 1.180775, 0.1034338, 0.8313726, 1, 0, 1,
-0.834245, -0.8105251, -3.096015, 0.8235294, 1, 0, 1,
-0.8249602, -1.240667, -1.489708, 0.8196079, 1, 0, 1,
-0.8172937, 1.002292, 0.186588, 0.8117647, 1, 0, 1,
-0.8153687, 0.338192, -2.187475, 0.8078431, 1, 0, 1,
-0.8151158, -0.6329818, -1.615674, 0.8, 1, 0, 1,
-0.8108121, -2.212494, -2.47418, 0.7921569, 1, 0, 1,
-0.8097113, -1.590654, -1.859303, 0.7882353, 1, 0, 1,
-0.8090884, 0.1679869, -2.125286, 0.7803922, 1, 0, 1,
-0.8088553, 1.013175, -2.341662, 0.7764706, 1, 0, 1,
-0.805238, -1.089125, -2.257706, 0.7686275, 1, 0, 1,
-0.8031188, 0.59644, -0.6257274, 0.7647059, 1, 0, 1,
-0.8023129, 0.2733413, -1.609994, 0.7568628, 1, 0, 1,
-0.8021154, -0.8846247, -2.356009, 0.7529412, 1, 0, 1,
-0.7973475, -1.677971, -3.127381, 0.7450981, 1, 0, 1,
-0.7961605, 0.8464906, 0.3378619, 0.7411765, 1, 0, 1,
-0.7894467, 0.73891, 0.09818742, 0.7333333, 1, 0, 1,
-0.7889866, 1.027379, -0.442775, 0.7294118, 1, 0, 1,
-0.7762222, -0.1712819, -2.193042, 0.7215686, 1, 0, 1,
-0.7676077, -0.06163908, -0.5459107, 0.7176471, 1, 0, 1,
-0.7597376, -1.665228, -2.942883, 0.7098039, 1, 0, 1,
-0.758599, -1.265087, -2.406528, 0.7058824, 1, 0, 1,
-0.7560486, 1.70683, 0.09379321, 0.6980392, 1, 0, 1,
-0.7498535, 0.1790671, -0.01930475, 0.6901961, 1, 0, 1,
-0.7479331, 1.28376, 1.436147, 0.6862745, 1, 0, 1,
-0.7445049, 0.2065778, -0.8454918, 0.6784314, 1, 0, 1,
-0.7422011, -1.906756, -3.956396, 0.6745098, 1, 0, 1,
-0.7419083, 2.631874, -0.8855018, 0.6666667, 1, 0, 1,
-0.7386343, 0.769687, 0.3364977, 0.6627451, 1, 0, 1,
-0.7362822, -1.579881, -3.842252, 0.654902, 1, 0, 1,
-0.7192878, 1.584954, -0.056229, 0.6509804, 1, 0, 1,
-0.7166626, 0.6588027, -0.006028657, 0.6431373, 1, 0, 1,
-0.7143502, 0.03879755, -3.129311, 0.6392157, 1, 0, 1,
-0.7120704, -0.316301, -3.941447, 0.6313726, 1, 0, 1,
-0.7075334, -0.864543, -2.578489, 0.627451, 1, 0, 1,
-0.7000122, 0.6978596, 0.6406065, 0.6196079, 1, 0, 1,
-0.6995049, 1.230416, -0.402451, 0.6156863, 1, 0, 1,
-0.6980295, -2.033906, -2.589634, 0.6078432, 1, 0, 1,
-0.6953692, 1.373915, -0.07866249, 0.6039216, 1, 0, 1,
-0.6936607, -0.9532244, -2.304704, 0.5960785, 1, 0, 1,
-0.6894335, -0.6831535, -3.579664, 0.5882353, 1, 0, 1,
-0.6860545, -2.528275, -4.511867, 0.5843138, 1, 0, 1,
-0.6818298, -0.5366271, -2.502401, 0.5764706, 1, 0, 1,
-0.6814247, -2.136593, -3.058557, 0.572549, 1, 0, 1,
-0.6808501, -0.2370002, -3.572961, 0.5647059, 1, 0, 1,
-0.678466, 1.002334, 0.2731115, 0.5607843, 1, 0, 1,
-0.6684234, -0.1333326, 1.528859, 0.5529412, 1, 0, 1,
-0.665717, 0.02878329, -2.612418, 0.5490196, 1, 0, 1,
-0.66563, -1.018038, -3.260679, 0.5411765, 1, 0, 1,
-0.6488287, 1.912046, -0.9130117, 0.5372549, 1, 0, 1,
-0.6484787, -0.8786689, -2.069637, 0.5294118, 1, 0, 1,
-0.640175, -1.359127, -4.813111, 0.5254902, 1, 0, 1,
-0.6385363, 0.1781272, 0.7922729, 0.5176471, 1, 0, 1,
-0.6331541, 0.5482529, 0.2307156, 0.5137255, 1, 0, 1,
-0.6293913, -0.06592815, -2.857409, 0.5058824, 1, 0, 1,
-0.6229323, -0.7031782, -2.864288, 0.5019608, 1, 0, 1,
-0.6201854, -0.6126233, -1.728415, 0.4941176, 1, 0, 1,
-0.6143534, 1.072322, -0.584904, 0.4862745, 1, 0, 1,
-0.6124531, 1.537125, -0.1459359, 0.4823529, 1, 0, 1,
-0.6108385, 0.3895725, -0.914779, 0.4745098, 1, 0, 1,
-0.6072551, -0.2608241, -2.91999, 0.4705882, 1, 0, 1,
-0.6044417, 0.7332155, -1.915879, 0.4627451, 1, 0, 1,
-0.6033593, 0.6192191, -0.1733976, 0.4588235, 1, 0, 1,
-0.6012374, -0.719432, -2.45028, 0.4509804, 1, 0, 1,
-0.5957173, -0.302981, -1.894105, 0.4470588, 1, 0, 1,
-0.5956472, 1.308614, -1.914912, 0.4392157, 1, 0, 1,
-0.5952917, -1.650688, -2.670326, 0.4352941, 1, 0, 1,
-0.5911603, -1.227398, -2.950482, 0.427451, 1, 0, 1,
-0.5910813, -0.8981403, -2.173174, 0.4235294, 1, 0, 1,
-0.5867539, 0.3738061, 0.6056203, 0.4156863, 1, 0, 1,
-0.5803105, 0.09302795, -1.09793, 0.4117647, 1, 0, 1,
-0.5758845, 0.2664832, -1.432464, 0.4039216, 1, 0, 1,
-0.574733, 2.086867, 0.5724959, 0.3960784, 1, 0, 1,
-0.5741735, 0.3493064, -1.153572, 0.3921569, 1, 0, 1,
-0.5741251, -0.2391351, -4.129506, 0.3843137, 1, 0, 1,
-0.5721401, -0.2646087, -1.215153, 0.3803922, 1, 0, 1,
-0.5694824, -0.2264932, -3.20782, 0.372549, 1, 0, 1,
-0.5628053, -1.201074, -2.336909, 0.3686275, 1, 0, 1,
-0.5623151, 0.3238894, 0.01815568, 0.3607843, 1, 0, 1,
-0.560363, -0.2549607, -1.113456, 0.3568628, 1, 0, 1,
-0.5594205, -0.1432412, -1.980369, 0.3490196, 1, 0, 1,
-0.5588537, -0.4118368, -0.3040863, 0.345098, 1, 0, 1,
-0.5568843, -1.867685, -3.408947, 0.3372549, 1, 0, 1,
-0.5544953, 0.9756495, -0.8805617, 0.3333333, 1, 0, 1,
-0.5483177, -0.02357999, -2.174984, 0.3254902, 1, 0, 1,
-0.546665, 0.2202287, -1.054635, 0.3215686, 1, 0, 1,
-0.5450345, -1.796535, -2.407928, 0.3137255, 1, 0, 1,
-0.5447324, -0.7200373, -2.942136, 0.3098039, 1, 0, 1,
-0.5375453, 0.3318412, -0.4108753, 0.3019608, 1, 0, 1,
-0.5367875, -0.06790632, 0.4393896, 0.2941177, 1, 0, 1,
-0.5274613, -0.4590987, -1.194442, 0.2901961, 1, 0, 1,
-0.5255995, -0.6107559, -1.370009, 0.282353, 1, 0, 1,
-0.5237103, -1.974342, -3.156771, 0.2784314, 1, 0, 1,
-0.5207162, -1.268549, -3.350075, 0.2705882, 1, 0, 1,
-0.519922, -1.532767, -3.978036, 0.2666667, 1, 0, 1,
-0.5197681, -0.9301995, -5.422388, 0.2588235, 1, 0, 1,
-0.5193989, 0.02681098, 0.2043408, 0.254902, 1, 0, 1,
-0.513528, 0.1837729, -2.499681, 0.2470588, 1, 0, 1,
-0.5123081, -0.1147735, -0.7195415, 0.2431373, 1, 0, 1,
-0.5120013, -0.1091801, -2.501784, 0.2352941, 1, 0, 1,
-0.5117218, 0.9229641, -1.596807, 0.2313726, 1, 0, 1,
-0.5095476, -0.2566693, -4.718504, 0.2235294, 1, 0, 1,
-0.5074803, 0.9209449, 1.436244, 0.2196078, 1, 0, 1,
-0.5054408, -0.7474183, -0.7371517, 0.2117647, 1, 0, 1,
-0.4902869, 0.3494789, -0.3703086, 0.2078431, 1, 0, 1,
-0.4888861, 0.7422818, -1.387952, 0.2, 1, 0, 1,
-0.4773467, -0.05381159, -1.59454, 0.1921569, 1, 0, 1,
-0.4747315, -0.04996417, -1.708121, 0.1882353, 1, 0, 1,
-0.4660294, -1.629802, -4.353927, 0.1803922, 1, 0, 1,
-0.4638256, -1.024409, -1.655547, 0.1764706, 1, 0, 1,
-0.4631108, -0.08457886, -0.5101262, 0.1686275, 1, 0, 1,
-0.4597147, -0.04252389, -1.587088, 0.1647059, 1, 0, 1,
-0.4595606, -0.6397558, -3.169798, 0.1568628, 1, 0, 1,
-0.4579564, -0.179793, -1.059108, 0.1529412, 1, 0, 1,
-0.4565738, 1.516971, -0.02948336, 0.145098, 1, 0, 1,
-0.4519807, -1.222915, -3.1275, 0.1411765, 1, 0, 1,
-0.4403408, -0.1591791, -1.981864, 0.1333333, 1, 0, 1,
-0.4370332, 0.3592544, 0.0836162, 0.1294118, 1, 0, 1,
-0.4337141, -0.07892711, -0.906022, 0.1215686, 1, 0, 1,
-0.4275852, -0.296635, -2.254247, 0.1176471, 1, 0, 1,
-0.425431, -0.148763, -2.791949, 0.1098039, 1, 0, 1,
-0.4193914, -0.5317928, -3.625365, 0.1058824, 1, 0, 1,
-0.417222, -0.8681936, -1.484859, 0.09803922, 1, 0, 1,
-0.4160777, 0.04205044, -2.216262, 0.09019608, 1, 0, 1,
-0.4129685, -1.087661, -2.65258, 0.08627451, 1, 0, 1,
-0.4120457, 0.06146876, -2.315585, 0.07843138, 1, 0, 1,
-0.4015499, -0.7764053, -3.099133, 0.07450981, 1, 0, 1,
-0.4004272, -0.1009494, -3.278774, 0.06666667, 1, 0, 1,
-0.3963604, -1.155602, -2.842388, 0.0627451, 1, 0, 1,
-0.3956123, -0.362355, -2.439171, 0.05490196, 1, 0, 1,
-0.3906096, -0.08995502, -0.8393875, 0.05098039, 1, 0, 1,
-0.388862, 0.3687092, 0.7542622, 0.04313726, 1, 0, 1,
-0.3829679, 0.4074047, -0.8011984, 0.03921569, 1, 0, 1,
-0.3803567, 0.8550741, -1.434577, 0.03137255, 1, 0, 1,
-0.3797294, -0.2621767, -0.9125749, 0.02745098, 1, 0, 1,
-0.3771538, -0.511537, -1.243022, 0.01960784, 1, 0, 1,
-0.3716906, 0.5062833, -1.254679, 0.01568628, 1, 0, 1,
-0.3706085, 0.1791105, -0.0276229, 0.007843138, 1, 0, 1,
-0.3690089, 1.655051, -0.7593877, 0.003921569, 1, 0, 1,
-0.3672156, -3.349362, -4.522237, 0, 1, 0.003921569, 1,
-0.3670782, 0.2343189, 0.3614495, 0, 1, 0.01176471, 1,
-0.3647566, -1.017755, -2.786589, 0, 1, 0.01568628, 1,
-0.3625724, -0.7459175, -4.456909, 0, 1, 0.02352941, 1,
-0.3618778, 0.4300246, 0.3119021, 0, 1, 0.02745098, 1,
-0.3544795, -0.7294652, -3.706477, 0, 1, 0.03529412, 1,
-0.3462211, -1.513125, -3.294191, 0, 1, 0.03921569, 1,
-0.3453437, 0.6685675, -0.5095633, 0, 1, 0.04705882, 1,
-0.344639, -0.1856665, -3.905301, 0, 1, 0.05098039, 1,
-0.3387599, -0.04551788, -1.727614, 0, 1, 0.05882353, 1,
-0.3367936, -1.02149, -3.475309, 0, 1, 0.0627451, 1,
-0.33589, 1.147912, -0.9780425, 0, 1, 0.07058824, 1,
-0.3316695, 1.08177, -1.122872, 0, 1, 0.07450981, 1,
-0.3231815, -0.6439838, -3.011001, 0, 1, 0.08235294, 1,
-0.3198321, 0.1889388, -2.608238, 0, 1, 0.08627451, 1,
-0.3188867, 0.777193, -0.3200433, 0, 1, 0.09411765, 1,
-0.3170465, -0.7685186, -3.693407, 0, 1, 0.1019608, 1,
-0.3116675, 0.0143354, -3.471995, 0, 1, 0.1058824, 1,
-0.3100877, -0.3786278, -3.926237, 0, 1, 0.1137255, 1,
-0.3098286, -0.7621551, -4.169998, 0, 1, 0.1176471, 1,
-0.3075992, -0.4340174, -2.480439, 0, 1, 0.1254902, 1,
-0.3064769, -0.4400471, -2.265479, 0, 1, 0.1294118, 1,
-0.30494, -0.6767876, -1.543696, 0, 1, 0.1372549, 1,
-0.3029309, 0.09194245, -0.4045392, 0, 1, 0.1411765, 1,
-0.3017385, -0.1108231, -0.8342659, 0, 1, 0.1490196, 1,
-0.2995619, -0.5907877, -4.197656, 0, 1, 0.1529412, 1,
-0.2995194, 0.1594792, -1.076271, 0, 1, 0.1607843, 1,
-0.2976748, -0.2143961, -1.792587, 0, 1, 0.1647059, 1,
-0.2954596, -0.1974868, -3.192147, 0, 1, 0.172549, 1,
-0.291538, -0.1015464, -3.681885, 0, 1, 0.1764706, 1,
-0.2834389, -1.660911, -2.842686, 0, 1, 0.1843137, 1,
-0.2757424, -0.1062108, -0.6773437, 0, 1, 0.1882353, 1,
-0.2752019, 0.3621064, 1.055116, 0, 1, 0.1960784, 1,
-0.2664616, -0.07854772, -4.507965, 0, 1, 0.2039216, 1,
-0.2630454, 0.3929316, -0.226084, 0, 1, 0.2078431, 1,
-0.2615461, 0.5287673, -0.6786495, 0, 1, 0.2156863, 1,
-0.2541909, 1.308426, 1.046164, 0, 1, 0.2196078, 1,
-0.2506555, 1.243741, 2.524286, 0, 1, 0.227451, 1,
-0.2483073, 0.9960925, -0.1394115, 0, 1, 0.2313726, 1,
-0.2481705, -0.3705156, -3.981143, 0, 1, 0.2392157, 1,
-0.2481146, -0.1958764, -2.238011, 0, 1, 0.2431373, 1,
-0.2476653, -0.7703454, -4.593427, 0, 1, 0.2509804, 1,
-0.2457381, 2.000349, -0.8848061, 0, 1, 0.254902, 1,
-0.2455349, 0.194974, 0.2182683, 0, 1, 0.2627451, 1,
-0.2449124, -0.9547492, -3.64115, 0, 1, 0.2666667, 1,
-0.2436226, 0.2973302, -0.02083839, 0, 1, 0.2745098, 1,
-0.2432815, -0.07420944, -1.365687, 0, 1, 0.2784314, 1,
-0.2405364, -1.830447, -2.502212, 0, 1, 0.2862745, 1,
-0.2348687, -0.9378012, -3.395101, 0, 1, 0.2901961, 1,
-0.2344572, -1.17518, -3.304681, 0, 1, 0.2980392, 1,
-0.2320464, 1.009325, 0.5540566, 0, 1, 0.3058824, 1,
-0.2302649, 0.8543086, 0.2471915, 0, 1, 0.3098039, 1,
-0.2293548, -2.824758, -2.916839, 0, 1, 0.3176471, 1,
-0.226898, -1.492823, -3.539469, 0, 1, 0.3215686, 1,
-0.2253262, -0.8801594, -3.287981, 0, 1, 0.3294118, 1,
-0.223552, -0.422006, -5.717018, 0, 1, 0.3333333, 1,
-0.2215075, -0.9389591, -4.353312, 0, 1, 0.3411765, 1,
-0.2209851, 0.2088675, 0.5049474, 0, 1, 0.345098, 1,
-0.2169496, -1.894226, -4.37572, 0, 1, 0.3529412, 1,
-0.2078168, -0.03465195, -2.847264, 0, 1, 0.3568628, 1,
-0.2048917, -0.6939823, -4.480997, 0, 1, 0.3647059, 1,
-0.2041796, -0.5117657, -3.996148, 0, 1, 0.3686275, 1,
-0.2016542, 0.07471766, -1.850696, 0, 1, 0.3764706, 1,
-0.2001151, -0.3139276, -1.821713, 0, 1, 0.3803922, 1,
-0.1996509, -0.2510041, -2.746391, 0, 1, 0.3882353, 1,
-0.1974273, 0.05464082, -0.6077698, 0, 1, 0.3921569, 1,
-0.1903494, 0.6512355, -0.6399857, 0, 1, 0.4, 1,
-0.1903446, 1.208279, -0.642188, 0, 1, 0.4078431, 1,
-0.1888487, 0.09293456, -1.835609, 0, 1, 0.4117647, 1,
-0.1883089, 0.1150478, -2.102247, 0, 1, 0.4196078, 1,
-0.1879317, -0.731497, -2.114604, 0, 1, 0.4235294, 1,
-0.1868223, 0.08747051, -1.062067, 0, 1, 0.4313726, 1,
-0.1831263, -0.8084406, -4.24966, 0, 1, 0.4352941, 1,
-0.1827814, 1.219732, 0.4906909, 0, 1, 0.4431373, 1,
-0.1817229, 0.3501864, -0.3573529, 0, 1, 0.4470588, 1,
-0.1783962, -1.090374, -2.564229, 0, 1, 0.454902, 1,
-0.1781195, 0.7224757, -0.02092626, 0, 1, 0.4588235, 1,
-0.1766595, 0.5992464, -1.236621, 0, 1, 0.4666667, 1,
-0.1745449, -1.350307, -2.823609, 0, 1, 0.4705882, 1,
-0.1730389, 0.6317115, 0.7429464, 0, 1, 0.4784314, 1,
-0.1723807, 0.8485628, -0.07076185, 0, 1, 0.4823529, 1,
-0.1656414, -0.7727574, -2.779744, 0, 1, 0.4901961, 1,
-0.162333, 1.259142, -0.7344034, 0, 1, 0.4941176, 1,
-0.1617483, 1.433332, -0.5133112, 0, 1, 0.5019608, 1,
-0.1594257, -1.273489, -2.879209, 0, 1, 0.509804, 1,
-0.157673, 2.532649, -1.482656, 0, 1, 0.5137255, 1,
-0.1567152, -1.930423, -5.757238, 0, 1, 0.5215687, 1,
-0.1502342, 1.191482, 0.08722293, 0, 1, 0.5254902, 1,
-0.1459866, -0.8184335, -3.172299, 0, 1, 0.5333334, 1,
-0.1456377, 0.4939278, -0.08746967, 0, 1, 0.5372549, 1,
-0.1446503, -0.2559963, -4.058433, 0, 1, 0.5450981, 1,
-0.133665, -1.799732, -2.945697, 0, 1, 0.5490196, 1,
-0.130884, -0.214816, 0.3982717, 0, 1, 0.5568628, 1,
-0.1302028, -2.682245, -5.125878, 0, 1, 0.5607843, 1,
-0.1201816, -0.8359229, -2.898381, 0, 1, 0.5686275, 1,
-0.1187603, -0.09548663, -1.584922, 0, 1, 0.572549, 1,
-0.1175273, 0.4011108, -0.3425009, 0, 1, 0.5803922, 1,
-0.1158894, 2.110684, -0.8579772, 0, 1, 0.5843138, 1,
-0.1143248, 0.09460394, -2.577065, 0, 1, 0.5921569, 1,
-0.1094194, 0.8399824, -2.37193, 0, 1, 0.5960785, 1,
-0.1042014, -0.7742687, -3.202982, 0, 1, 0.6039216, 1,
-0.1038106, 1.311413, 2.169592, 0, 1, 0.6117647, 1,
-0.1037234, -0.2365511, -2.8114, 0, 1, 0.6156863, 1,
-0.102433, -0.9544351, -3.604389, 0, 1, 0.6235294, 1,
-0.1013637, -0.2702041, -2.931619, 0, 1, 0.627451, 1,
-0.1013464, 1.012491, 0.1285422, 0, 1, 0.6352941, 1,
-0.09332449, -0.7035086, -2.337681, 0, 1, 0.6392157, 1,
-0.0895419, -0.4573042, -3.561572, 0, 1, 0.6470588, 1,
-0.08586041, -0.3493123, -4.693727, 0, 1, 0.6509804, 1,
-0.08572736, -0.9297216, -1.641406, 0, 1, 0.6588235, 1,
-0.08253057, 0.9432553, -0.7779286, 0, 1, 0.6627451, 1,
-0.08048348, -0.03527276, -1.806036, 0, 1, 0.6705883, 1,
-0.08040238, -0.7459192, -2.896938, 0, 1, 0.6745098, 1,
-0.07654755, -0.9499905, -3.940783, 0, 1, 0.682353, 1,
-0.07097093, 0.3160895, 1.01883, 0, 1, 0.6862745, 1,
-0.07089362, -0.1883025, -2.998771, 0, 1, 0.6941177, 1,
-0.06970029, -0.2597087, -2.894163, 0, 1, 0.7019608, 1,
-0.06929156, 0.7372463, 2.517533, 0, 1, 0.7058824, 1,
-0.06768689, -0.2036625, -3.122479, 0, 1, 0.7137255, 1,
-0.06727161, -1.097834, -1.325337, 0, 1, 0.7176471, 1,
-0.06433497, 0.5514644, -1.378877, 0, 1, 0.7254902, 1,
-0.06404587, 0.4097343, 0.6978475, 0, 1, 0.7294118, 1,
-0.06223671, -0.1503551, -3.091191, 0, 1, 0.7372549, 1,
-0.06108915, 0.892934, -0.3734161, 0, 1, 0.7411765, 1,
-0.0533214, 0.5685357, -1.565778, 0, 1, 0.7490196, 1,
-0.05227184, 0.3450026, -0.4208753, 0, 1, 0.7529412, 1,
-0.05005417, -1.018204, -2.532746, 0, 1, 0.7607843, 1,
-0.04990797, 1.615585, -0.4265723, 0, 1, 0.7647059, 1,
-0.04573921, 0.7710445, -0.4467699, 0, 1, 0.772549, 1,
-0.04475788, 1.614618, -0.3089893, 0, 1, 0.7764706, 1,
-0.04307714, 0.9668667, 0.4899569, 0, 1, 0.7843137, 1,
-0.03947037, 0.03621648, 0.1207084, 0, 1, 0.7882353, 1,
-0.03893477, -0.6644868, -2.695044, 0, 1, 0.7960784, 1,
-0.03256689, 1.201206, 0.2299708, 0, 1, 0.8039216, 1,
-0.02692225, 1.530839, 0.7558455, 0, 1, 0.8078431, 1,
-0.02427471, -0.5658533, -2.933151, 0, 1, 0.8156863, 1,
-0.01355093, 1.334525, 0.5704477, 0, 1, 0.8196079, 1,
-0.0124019, -0.8622747, -3.716472, 0, 1, 0.827451, 1,
-0.01228498, 1.334386, -1.00745, 0, 1, 0.8313726, 1,
-0.01206967, 0.2054039, -1.497373, 0, 1, 0.8392157, 1,
-0.006600759, 0.5189119, -0.8379681, 0, 1, 0.8431373, 1,
-0.004373167, 0.2750853, 1.00284, 0, 1, 0.8509804, 1,
-0.004216525, -0.1642373, -3.141279, 0, 1, 0.854902, 1,
0.0008318704, -0.8369024, 2.51035, 0, 1, 0.8627451, 1,
0.002160286, 0.02823637, 0.5597783, 0, 1, 0.8666667, 1,
0.004413302, -0.09785611, 2.798801, 0, 1, 0.8745098, 1,
0.01019385, 2.022413, -0.1268467, 0, 1, 0.8784314, 1,
0.01101082, 1.795246, -0.3018034, 0, 1, 0.8862745, 1,
0.01530561, 0.4376074, 0.6457426, 0, 1, 0.8901961, 1,
0.01839817, 1.061936, -0.828172, 0, 1, 0.8980392, 1,
0.02068896, -0.8663002, 3.698887, 0, 1, 0.9058824, 1,
0.02164913, 1.269539, 0.387906, 0, 1, 0.9098039, 1,
0.02328276, 0.2009263, 0.812887, 0, 1, 0.9176471, 1,
0.02409985, 0.583603, -1.027636, 0, 1, 0.9215686, 1,
0.02786245, -1.24869, 2.733766, 0, 1, 0.9294118, 1,
0.02825401, -1.057983, 2.755545, 0, 1, 0.9333333, 1,
0.02841954, -0.9508706, 2.441738, 0, 1, 0.9411765, 1,
0.03227599, -0.06260574, 2.716228, 0, 1, 0.945098, 1,
0.0342228, 0.3030654, 1.576699, 0, 1, 0.9529412, 1,
0.03458881, 1.186586, -0.6474293, 0, 1, 0.9568627, 1,
0.04415544, -0.4713255, 4.315733, 0, 1, 0.9647059, 1,
0.05244919, -0.5397566, 3.71009, 0, 1, 0.9686275, 1,
0.05666634, -0.322929, 2.095548, 0, 1, 0.9764706, 1,
0.0594145, 0.7192699, 1.266292, 0, 1, 0.9803922, 1,
0.07048196, 0.07940833, 1.205569, 0, 1, 0.9882353, 1,
0.07414518, 1.013877, 0.4128681, 0, 1, 0.9921569, 1,
0.0772245, 0.109599, -0.1955506, 0, 1, 1, 1,
0.0777297, -0.2657729, 4.1774, 0, 0.9921569, 1, 1,
0.08134519, -0.3788654, 2.176236, 0, 0.9882353, 1, 1,
0.08290591, 0.471898, -1.014138, 0, 0.9803922, 1, 1,
0.08816236, -1.99801, 2.010391, 0, 0.9764706, 1, 1,
0.08851594, -1.342217, 3.784888, 0, 0.9686275, 1, 1,
0.09054234, 0.7168751, -0.2138873, 0, 0.9647059, 1, 1,
0.09412939, -1.820064, 2.268605, 0, 0.9568627, 1, 1,
0.09472063, 0.8724917, 1.0508, 0, 0.9529412, 1, 1,
0.09555242, 0.4174566, 2.42782, 0, 0.945098, 1, 1,
0.09700844, -2.096221, 2.793497, 0, 0.9411765, 1, 1,
0.0975074, -1.192688, 3.046471, 0, 0.9333333, 1, 1,
0.100772, -0.005167609, 2.099091, 0, 0.9294118, 1, 1,
0.1014148, 0.3258016, 0.09726863, 0, 0.9215686, 1, 1,
0.101439, -0.08516311, 2.250344, 0, 0.9176471, 1, 1,
0.1054335, 0.5081601, 0.3587219, 0, 0.9098039, 1, 1,
0.1060053, -0.8999422, 4.104989, 0, 0.9058824, 1, 1,
0.1067682, -0.5720054, 2.986648, 0, 0.8980392, 1, 1,
0.1084568, 2.119028, -0.140731, 0, 0.8901961, 1, 1,
0.1114092, -1.868864, 3.154582, 0, 0.8862745, 1, 1,
0.1127981, 2.297401, -0.6834043, 0, 0.8784314, 1, 1,
0.1161646, 0.3197711, -0.4142114, 0, 0.8745098, 1, 1,
0.1173435, 0.5949433, 1.878943, 0, 0.8666667, 1, 1,
0.1215858, -0.7686684, 3.556265, 0, 0.8627451, 1, 1,
0.1227012, 0.9536301, -0.8623948, 0, 0.854902, 1, 1,
0.1241591, -0.2012843, 1.851924, 0, 0.8509804, 1, 1,
0.1290568, 0.7238072, -0.6606808, 0, 0.8431373, 1, 1,
0.1302152, 0.3731417, -0.3070717, 0, 0.8392157, 1, 1,
0.1357128, -0.1349721, 1.069799, 0, 0.8313726, 1, 1,
0.1403007, -1.932593, 1.895746, 0, 0.827451, 1, 1,
0.1403107, -0.4223973, 3.460262, 0, 0.8196079, 1, 1,
0.140333, -1.083685, 3.485271, 0, 0.8156863, 1, 1,
0.1408796, -0.948478, 2.547589, 0, 0.8078431, 1, 1,
0.1409149, 1.013816, 0.1231836, 0, 0.8039216, 1, 1,
0.1411956, 0.292755, 0.4716626, 0, 0.7960784, 1, 1,
0.1417484, -0.3226041, 4.310562, 0, 0.7882353, 1, 1,
0.142516, -1.330445, 2.979187, 0, 0.7843137, 1, 1,
0.1466377, 0.2409749, 2.967563, 0, 0.7764706, 1, 1,
0.1511529, -0.2452306, 2.169306, 0, 0.772549, 1, 1,
0.15245, -0.9693063, 1.362563, 0, 0.7647059, 1, 1,
0.1549336, 0.6120535, 0.3953671, 0, 0.7607843, 1, 1,
0.1550213, -0.4408661, 2.182482, 0, 0.7529412, 1, 1,
0.1569164, 1.192822, -3.148949, 0, 0.7490196, 1, 1,
0.1606991, -1.337614, 1.902604, 0, 0.7411765, 1, 1,
0.160777, -1.852853, 3.034511, 0, 0.7372549, 1, 1,
0.1617343, 0.008033994, 2.300689, 0, 0.7294118, 1, 1,
0.1623939, -0.3725083, 3.203628, 0, 0.7254902, 1, 1,
0.1684291, 0.1223111, 1.13622, 0, 0.7176471, 1, 1,
0.1687537, 1.009521, 0.1611831, 0, 0.7137255, 1, 1,
0.1811547, -0.4040358, 4.589154, 0, 0.7058824, 1, 1,
0.1822029, -0.948389, 3.810135, 0, 0.6980392, 1, 1,
0.1841558, 0.9027283, -1.913472, 0, 0.6941177, 1, 1,
0.1878952, 0.5162131, -1.311389, 0, 0.6862745, 1, 1,
0.1891311, 0.6742582, -0.883351, 0, 0.682353, 1, 1,
0.1954181, -0.9950333, 5.111034, 0, 0.6745098, 1, 1,
0.1997365, -0.9229282, 3.115548, 0, 0.6705883, 1, 1,
0.2013021, -0.205425, 2.256901, 0, 0.6627451, 1, 1,
0.2041806, 0.04777243, 2.545281, 0, 0.6588235, 1, 1,
0.205991, 0.09628344, 4.175617, 0, 0.6509804, 1, 1,
0.2065625, 0.2475868, 0.5504811, 0, 0.6470588, 1, 1,
0.2084716, -0.4294064, 2.069907, 0, 0.6392157, 1, 1,
0.2086443, -1.224256, 3.239567, 0, 0.6352941, 1, 1,
0.2104772, -0.02388394, 0.941949, 0, 0.627451, 1, 1,
0.212465, -1.05061, 2.95996, 0, 0.6235294, 1, 1,
0.2149251, -1.67123, 1.682989, 0, 0.6156863, 1, 1,
0.2182418, -0.5160724, 2.897105, 0, 0.6117647, 1, 1,
0.2197786, -1.382731, 0.4498395, 0, 0.6039216, 1, 1,
0.2217817, -0.5148804, 2.198365, 0, 0.5960785, 1, 1,
0.2218948, -1.307008, 3.372924, 0, 0.5921569, 1, 1,
0.2257559, 0.444112, -0.1367113, 0, 0.5843138, 1, 1,
0.2278391, 1.145415, 1.68077, 0, 0.5803922, 1, 1,
0.2321449, -1.909436, 2.064709, 0, 0.572549, 1, 1,
0.2326934, 0.1119632, 1.170889, 0, 0.5686275, 1, 1,
0.2330856, 1.624417, -0.6984787, 0, 0.5607843, 1, 1,
0.2385208, -0.5000436, 3.006012, 0, 0.5568628, 1, 1,
0.2385541, -1.934642, 3.259346, 0, 0.5490196, 1, 1,
0.2400568, -0.9835817, 3.951108, 0, 0.5450981, 1, 1,
0.2415617, -1.385513, 2.89522, 0, 0.5372549, 1, 1,
0.2447995, 0.1672041, -0.4109224, 0, 0.5333334, 1, 1,
0.245413, -0.9108982, 2.773967, 0, 0.5254902, 1, 1,
0.245578, -0.6248475, 3.033738, 0, 0.5215687, 1, 1,
0.2477267, -0.08607534, 1.686038, 0, 0.5137255, 1, 1,
0.2545596, 1.41609, -0.5639898, 0, 0.509804, 1, 1,
0.2608088, -0.4405646, 1.004607, 0, 0.5019608, 1, 1,
0.2682168, 0.5864477, 1.811087, 0, 0.4941176, 1, 1,
0.2704309, 0.7339508, 0.9166749, 0, 0.4901961, 1, 1,
0.2728472, -0.9810997, 4.316835, 0, 0.4823529, 1, 1,
0.2736974, 0.2505324, 2.111123, 0, 0.4784314, 1, 1,
0.2781366, -0.3950752, 3.128114, 0, 0.4705882, 1, 1,
0.279461, -1.084382, 2.273858, 0, 0.4666667, 1, 1,
0.2810482, -0.3818389, 3.201766, 0, 0.4588235, 1, 1,
0.2810843, -0.9091838, 2.406605, 0, 0.454902, 1, 1,
0.2827233, -0.4496217, 2.188236, 0, 0.4470588, 1, 1,
0.285193, 0.8007445, 0.6667558, 0, 0.4431373, 1, 1,
0.2878148, -0.6313232, 1.72178, 0, 0.4352941, 1, 1,
0.2887546, -1.40042, 2.530152, 0, 0.4313726, 1, 1,
0.2893615, 0.1869416, 0.2629257, 0, 0.4235294, 1, 1,
0.2931373, -1.569126, 4.026031, 0, 0.4196078, 1, 1,
0.2985617, -0.4357896, 2.461654, 0, 0.4117647, 1, 1,
0.2986462, 1.428638, -1.202543, 0, 0.4078431, 1, 1,
0.2996866, 0.4317375, 0.5567803, 0, 0.4, 1, 1,
0.3013066, 0.7636471, 2.010307, 0, 0.3921569, 1, 1,
0.3035885, -0.1169521, 0.4460692, 0, 0.3882353, 1, 1,
0.3046878, -0.9352652, 1.02948, 0, 0.3803922, 1, 1,
0.3084527, -0.06341077, 0.6495744, 0, 0.3764706, 1, 1,
0.3099644, -0.6341113, 4.977516, 0, 0.3686275, 1, 1,
0.310348, -0.9218977, 3.63022, 0, 0.3647059, 1, 1,
0.3140371, -0.2331047, 2.908913, 0, 0.3568628, 1, 1,
0.3160227, -0.2246455, 2.126693, 0, 0.3529412, 1, 1,
0.3175936, -0.5077763, 3.38024, 0, 0.345098, 1, 1,
0.3220278, 0.07141054, 0.01288289, 0, 0.3411765, 1, 1,
0.3293058, -0.027538, 1.345673, 0, 0.3333333, 1, 1,
0.3392693, 0.03493696, -0.2468287, 0, 0.3294118, 1, 1,
0.3437584, -0.1841453, 1.449647, 0, 0.3215686, 1, 1,
0.3445985, -1.526161, 3.106156, 0, 0.3176471, 1, 1,
0.3446364, 0.6574978, -0.9453903, 0, 0.3098039, 1, 1,
0.3533787, -0.04161762, 2.092001, 0, 0.3058824, 1, 1,
0.3557984, -0.9440315, 4.157339, 0, 0.2980392, 1, 1,
0.3586431, -0.5615588, 1.77441, 0, 0.2901961, 1, 1,
0.3608294, 0.3818815, 2.742301, 0, 0.2862745, 1, 1,
0.3630685, -0.6939574, 1.427977, 0, 0.2784314, 1, 1,
0.3642156, -0.1812688, 1.006582, 0, 0.2745098, 1, 1,
0.3643499, -1.453644, 1.297709, 0, 0.2666667, 1, 1,
0.3658686, 0.5309932, 0.08660088, 0, 0.2627451, 1, 1,
0.3668076, 0.6038402, 1.733395, 0, 0.254902, 1, 1,
0.3693981, -0.05048741, 1.454808, 0, 0.2509804, 1, 1,
0.3711181, -0.8682072, 4.121029, 0, 0.2431373, 1, 1,
0.3718768, 1.411821, 0.5729436, 0, 0.2392157, 1, 1,
0.3778781, 0.8197445, 1.094295, 0, 0.2313726, 1, 1,
0.3788146, 0.9983449, 0.7223226, 0, 0.227451, 1, 1,
0.380322, 0.5701587, 1.541207, 0, 0.2196078, 1, 1,
0.3805807, -0.877196, 1.674696, 0, 0.2156863, 1, 1,
0.3813598, 1.282103, 0.7728404, 0, 0.2078431, 1, 1,
0.3818268, 0.5991609, 0.4931831, 0, 0.2039216, 1, 1,
0.3829881, -0.4507053, 4.188311, 0, 0.1960784, 1, 1,
0.3852137, 0.2185957, 0.3683915, 0, 0.1882353, 1, 1,
0.3858025, 0.6481164, -0.06793143, 0, 0.1843137, 1, 1,
0.3876424, 1.350464, 0.360187, 0, 0.1764706, 1, 1,
0.3913784, -0.5485001, 2.018094, 0, 0.172549, 1, 1,
0.391613, 0.7849732, 0.2750067, 0, 0.1647059, 1, 1,
0.3946487, -0.3206372, 3.657681, 0, 0.1607843, 1, 1,
0.3950261, 0.655499, 1.839614, 0, 0.1529412, 1, 1,
0.3982928, 0.2398664, 0.6387938, 0, 0.1490196, 1, 1,
0.3983695, -1.972632, 2.793798, 0, 0.1411765, 1, 1,
0.4070627, -1.394593, 2.86096, 0, 0.1372549, 1, 1,
0.409244, 1.30941, 0.1351952, 0, 0.1294118, 1, 1,
0.4113073, 0.6039131, 0.7928194, 0, 0.1254902, 1, 1,
0.4114586, 1.246415, -1.142599, 0, 0.1176471, 1, 1,
0.4247701, -0.0754943, 1.054452, 0, 0.1137255, 1, 1,
0.4282024, -0.1207042, 1.874766, 0, 0.1058824, 1, 1,
0.4285813, 0.4574032, 1.297832, 0, 0.09803922, 1, 1,
0.4319589, 0.1924786, 1.810955, 0, 0.09411765, 1, 1,
0.4340816, 0.01026655, 2.386055, 0, 0.08627451, 1, 1,
0.4365049, 1.476491, 0.9486015, 0, 0.08235294, 1, 1,
0.4409721, 0.8526557, 1.143944, 0, 0.07450981, 1, 1,
0.4425813, -1.024236, 2.244417, 0, 0.07058824, 1, 1,
0.44395, 1.541604, 1.815829, 0, 0.0627451, 1, 1,
0.4489698, 0.3181726, 0.4344372, 0, 0.05882353, 1, 1,
0.4506116, 0.8100353, -1.798942, 0, 0.05098039, 1, 1,
0.4517131, 0.06732573, 0.339543, 0, 0.04705882, 1, 1,
0.4577393, -0.8009931, 1.85776, 0, 0.03921569, 1, 1,
0.4592704, 0.9560869, 1.946234, 0, 0.03529412, 1, 1,
0.4623439, 1.870858, 0.9340774, 0, 0.02745098, 1, 1,
0.4640441, -0.2788985, 1.529609, 0, 0.02352941, 1, 1,
0.4665785, -0.8367152, 1.309452, 0, 0.01568628, 1, 1,
0.4733733, -1.500792, 3.042377, 0, 0.01176471, 1, 1,
0.4763612, -0.3652613, 2.785898, 0, 0.003921569, 1, 1,
0.4811234, 0.4766057, 1.359017, 0.003921569, 0, 1, 1,
0.4816397, -0.9423631, 0.2445842, 0.007843138, 0, 1, 1,
0.4962659, 0.6151356, 1.08922, 0.01568628, 0, 1, 1,
0.4965155, 2.142172, 0.4361503, 0.01960784, 0, 1, 1,
0.5050457, 0.3331084, 1.341823, 0.02745098, 0, 1, 1,
0.508029, -0.2708271, 2.493018, 0.03137255, 0, 1, 1,
0.5080992, 1.497331, 0.7395142, 0.03921569, 0, 1, 1,
0.5098614, -1.135842, 2.812185, 0.04313726, 0, 1, 1,
0.5110345, 0.1325756, 3.114512, 0.05098039, 0, 1, 1,
0.5116136, 0.8482593, 0.6491603, 0.05490196, 0, 1, 1,
0.5142555, -1.094005, 4.243716, 0.0627451, 0, 1, 1,
0.528267, 0.3034594, 1.8806, 0.06666667, 0, 1, 1,
0.5310348, -1.063347, 1.533026, 0.07450981, 0, 1, 1,
0.5360842, 1.373164, 0.3153324, 0.07843138, 0, 1, 1,
0.5366055, -0.4923274, 0.2512757, 0.08627451, 0, 1, 1,
0.5371716, -1.351351, 2.321286, 0.09019608, 0, 1, 1,
0.5407249, 0.6304029, 1.171726, 0.09803922, 0, 1, 1,
0.5413871, 0.5124974, -0.8430439, 0.1058824, 0, 1, 1,
0.5419534, -1.178753, 1.813033, 0.1098039, 0, 1, 1,
0.5425014, 0.2312237, 1.515676, 0.1176471, 0, 1, 1,
0.5435244, 0.1296618, 3.3854, 0.1215686, 0, 1, 1,
0.5491797, 1.31389, 1.518054, 0.1294118, 0, 1, 1,
0.5511708, -1.433499, 3.211404, 0.1333333, 0, 1, 1,
0.5529765, 0.008586897, 0.8107224, 0.1411765, 0, 1, 1,
0.5557264, 0.4022676, 0.8341264, 0.145098, 0, 1, 1,
0.5562652, -1.087005, 2.174425, 0.1529412, 0, 1, 1,
0.5573636, 0.1156823, -0.0116142, 0.1568628, 0, 1, 1,
0.557365, 0.183205, 1.306542, 0.1647059, 0, 1, 1,
0.5599824, 0.3632383, -0.09160462, 0.1686275, 0, 1, 1,
0.5635287, -0.07706555, -0.03847596, 0.1764706, 0, 1, 1,
0.5766392, -0.01899237, 3.282278, 0.1803922, 0, 1, 1,
0.57711, -1.224434, 0.4864942, 0.1882353, 0, 1, 1,
0.5819558, -0.3392935, 1.270592, 0.1921569, 0, 1, 1,
0.583358, -0.9042295, 1.726741, 0.2, 0, 1, 1,
0.5840395, -0.1191367, 2.687983, 0.2078431, 0, 1, 1,
0.585141, -0.4572787, 5.426991, 0.2117647, 0, 1, 1,
0.5881119, -0.8404704, 2.174471, 0.2196078, 0, 1, 1,
0.5941027, 0.9817306, -2.065181, 0.2235294, 0, 1, 1,
0.5969786, 0.8848802, -1.144844, 0.2313726, 0, 1, 1,
0.5989174, -0.63146, 3.358256, 0.2352941, 0, 1, 1,
0.5993106, 0.7836156, -0.04642007, 0.2431373, 0, 1, 1,
0.6045223, -0.1352727, 2.729528, 0.2470588, 0, 1, 1,
0.6047943, -0.07437599, -0.1350961, 0.254902, 0, 1, 1,
0.6077313, 1.810481, 0.3929822, 0.2588235, 0, 1, 1,
0.6080493, -0.8445842, 2.723973, 0.2666667, 0, 1, 1,
0.6111636, -0.1791989, 2.874255, 0.2705882, 0, 1, 1,
0.6127171, 0.1909281, 2.022646, 0.2784314, 0, 1, 1,
0.6129143, -0.9206229, 1.730864, 0.282353, 0, 1, 1,
0.6160555, 0.1929182, 2.442676, 0.2901961, 0, 1, 1,
0.6184927, 0.2568452, 2.867183, 0.2941177, 0, 1, 1,
0.620497, -0.8026983, 1.896781, 0.3019608, 0, 1, 1,
0.6246302, 1.394238, -0.1778102, 0.3098039, 0, 1, 1,
0.6257012, 0.3010443, 1.694765, 0.3137255, 0, 1, 1,
0.6352422, 1.417483, -0.2601995, 0.3215686, 0, 1, 1,
0.641631, 0.9182432, -0.7509791, 0.3254902, 0, 1, 1,
0.6422303, 0.5223602, -0.179136, 0.3333333, 0, 1, 1,
0.6604975, 0.6509883, 0.8949028, 0.3372549, 0, 1, 1,
0.6608095, 0.1158173, -0.2676363, 0.345098, 0, 1, 1,
0.6617991, -0.6332454, 1.842068, 0.3490196, 0, 1, 1,
0.6652662, 0.04301089, 2.032972, 0.3568628, 0, 1, 1,
0.6690209, -0.1141016, 2.360462, 0.3607843, 0, 1, 1,
0.6690279, 1.090336, 1.760145, 0.3686275, 0, 1, 1,
0.6693169, -0.5980412, 2.648337, 0.372549, 0, 1, 1,
0.6745508, 0.06596752, 0.5732385, 0.3803922, 0, 1, 1,
0.6760157, 0.333971, 2.020117, 0.3843137, 0, 1, 1,
0.6773556, 0.4808228, -0.4517176, 0.3921569, 0, 1, 1,
0.6834168, 0.9254309, 0.6258489, 0.3960784, 0, 1, 1,
0.6851868, 0.8306749, -0.4316649, 0.4039216, 0, 1, 1,
0.6863618, -1.418898, 3.358202, 0.4117647, 0, 1, 1,
0.6898344, -0.8293692, 0.9791058, 0.4156863, 0, 1, 1,
0.6914873, 0.8522146, 0.8728796, 0.4235294, 0, 1, 1,
0.6942658, 1.502468, 0.5998029, 0.427451, 0, 1, 1,
0.6961107, 1.006583, 0.5289749, 0.4352941, 0, 1, 1,
0.6970137, -0.4848218, 3.054396, 0.4392157, 0, 1, 1,
0.7102126, -0.9796264, 2.350912, 0.4470588, 0, 1, 1,
0.7102219, -1.288235, 2.789307, 0.4509804, 0, 1, 1,
0.7120861, 0.5427395, -0.415123, 0.4588235, 0, 1, 1,
0.7122328, -0.2709941, 0.9823703, 0.4627451, 0, 1, 1,
0.7151385, 0.006422862, 2.195413, 0.4705882, 0, 1, 1,
0.7155269, -1.20817, 1.744626, 0.4745098, 0, 1, 1,
0.7306103, -0.3601209, 2.876644, 0.4823529, 0, 1, 1,
0.7313884, 1.193225, -0.1855869, 0.4862745, 0, 1, 1,
0.7378101, -1.215356, 4.861265, 0.4941176, 0, 1, 1,
0.7392911, 1.311176, -0.1506899, 0.5019608, 0, 1, 1,
0.7457948, -0.4833899, 2.910675, 0.5058824, 0, 1, 1,
0.7473484, -0.2809492, 2.239489, 0.5137255, 0, 1, 1,
0.7476256, -0.4583718, 2.099821, 0.5176471, 0, 1, 1,
0.7503228, -0.1378335, 3.247714, 0.5254902, 0, 1, 1,
0.7503896, 1.649022, 0.633185, 0.5294118, 0, 1, 1,
0.7600701, -1.068753, 3.456863, 0.5372549, 0, 1, 1,
0.7610078, -0.6041464, 2.610509, 0.5411765, 0, 1, 1,
0.7647977, -1.199726, 1.797265, 0.5490196, 0, 1, 1,
0.7671669, 1.638309, -0.4569045, 0.5529412, 0, 1, 1,
0.7682565, -0.3191356, 2.419023, 0.5607843, 0, 1, 1,
0.7722215, -0.9374242, 2.734523, 0.5647059, 0, 1, 1,
0.7779058, 0.4532396, 2.210023, 0.572549, 0, 1, 1,
0.7779483, 0.2531521, 0.3398887, 0.5764706, 0, 1, 1,
0.7799684, -1.060126, 1.810989, 0.5843138, 0, 1, 1,
0.7871131, -0.7991074, 3.664832, 0.5882353, 0, 1, 1,
0.7876745, -1.059461, 2.585041, 0.5960785, 0, 1, 1,
0.7883064, 0.3449967, 3.255249, 0.6039216, 0, 1, 1,
0.7891009, 1.023196, 2.088562, 0.6078432, 0, 1, 1,
0.7951462, -0.5570502, 0.7982612, 0.6156863, 0, 1, 1,
0.8044332, -0.5129802, 1.401883, 0.6196079, 0, 1, 1,
0.8059022, -1.45134, 2.949693, 0.627451, 0, 1, 1,
0.8070841, -1.081357, 0.09138622, 0.6313726, 0, 1, 1,
0.8070931, -1.172808, 4.291101, 0.6392157, 0, 1, 1,
0.8101354, 1.091796, -0.496746, 0.6431373, 0, 1, 1,
0.8116995, 0.269953, 1.494851, 0.6509804, 0, 1, 1,
0.8141515, 0.08284601, 2.684474, 0.654902, 0, 1, 1,
0.8146024, -1.040313, 1.895028, 0.6627451, 0, 1, 1,
0.8169723, -1.814546, 2.411565, 0.6666667, 0, 1, 1,
0.8173524, 2.088332, -0.6675442, 0.6745098, 0, 1, 1,
0.8211086, 0.4499634, 1.178888, 0.6784314, 0, 1, 1,
0.8381215, -1.160955, 2.144207, 0.6862745, 0, 1, 1,
0.8422508, 0.4666564, 1.420654, 0.6901961, 0, 1, 1,
0.844678, -0.7860408, 2.681706, 0.6980392, 0, 1, 1,
0.8474367, 0.7693748, 0.626206, 0.7058824, 0, 1, 1,
0.8479218, -0.4861174, 0.5701905, 0.7098039, 0, 1, 1,
0.8481247, -1.924526, 3.345734, 0.7176471, 0, 1, 1,
0.8509794, -3.042968, 1.405148, 0.7215686, 0, 1, 1,
0.8574976, 0.2507515, 1.280132, 0.7294118, 0, 1, 1,
0.8610443, -0.8530204, 3.545776, 0.7333333, 0, 1, 1,
0.8642431, -2.116909, 2.383177, 0.7411765, 0, 1, 1,
0.8659087, 0.1476192, 0.6686852, 0.7450981, 0, 1, 1,
0.8665907, 0.7797056, -1.041268, 0.7529412, 0, 1, 1,
0.8692875, -0.487312, 3.332752, 0.7568628, 0, 1, 1,
0.8704774, -0.24592, -0.1073774, 0.7647059, 0, 1, 1,
0.8751162, 2.144591, 1.110804, 0.7686275, 0, 1, 1,
0.8773456, -0.4244567, 3.013463, 0.7764706, 0, 1, 1,
0.8822942, -0.1935094, 1.324995, 0.7803922, 0, 1, 1,
0.8834086, 0.9619282, -0.9317735, 0.7882353, 0, 1, 1,
0.886026, -0.04573227, -0.2998358, 0.7921569, 0, 1, 1,
0.8866397, -0.7190754, 2.136405, 0.8, 0, 1, 1,
0.8930198, -0.895618, 2.591162, 0.8078431, 0, 1, 1,
0.8937198, -0.7608888, 3.26404, 0.8117647, 0, 1, 1,
0.8965405, 0.1392663, 2.601779, 0.8196079, 0, 1, 1,
0.8970656, -0.5382602, 3.269831, 0.8235294, 0, 1, 1,
0.8974808, 1.194764, 0.3071218, 0.8313726, 0, 1, 1,
0.9102294, 0.1842111, 1.446855, 0.8352941, 0, 1, 1,
0.9120103, 0.7483965, 1.242947, 0.8431373, 0, 1, 1,
0.9165374, 0.3011062, -0.300001, 0.8470588, 0, 1, 1,
0.918842, -1.762909, 2.694811, 0.854902, 0, 1, 1,
0.9224481, 0.2360679, 2.266854, 0.8588235, 0, 1, 1,
0.9224606, 1.575655, 0.5345274, 0.8666667, 0, 1, 1,
0.9265491, 0.7723877, 1.076436, 0.8705882, 0, 1, 1,
0.9310383, 0.5109952, 0.6603507, 0.8784314, 0, 1, 1,
0.9329076, 0.2734243, 2.889847, 0.8823529, 0, 1, 1,
0.9425017, -1.021602, 3.36059, 0.8901961, 0, 1, 1,
0.9443015, -0.2407767, 1.989556, 0.8941177, 0, 1, 1,
0.9473861, 0.697517, 0.6042095, 0.9019608, 0, 1, 1,
0.961912, -0.4455917, 2.177327, 0.9098039, 0, 1, 1,
0.9639518, 0.5781845, -0.2663078, 0.9137255, 0, 1, 1,
0.9649064, 1.968156, 0.39101, 0.9215686, 0, 1, 1,
0.9707937, 1.638418, 0.07793885, 0.9254902, 0, 1, 1,
0.9772716, 0.03770941, 1.780333, 0.9333333, 0, 1, 1,
0.9780031, 0.3612135, 1.628678, 0.9372549, 0, 1, 1,
0.9921679, 0.6262414, 0.9762384, 0.945098, 0, 1, 1,
0.9923146, 0.8169845, 2.311888, 0.9490196, 0, 1, 1,
0.996489, -1.360695, 1.800339, 0.9568627, 0, 1, 1,
1.010675, 0.1841331, 1.29193, 0.9607843, 0, 1, 1,
1.014642, -0.7143204, 3.012398, 0.9686275, 0, 1, 1,
1.015356, 0.01505601, 1.290375, 0.972549, 0, 1, 1,
1.016392, -0.9888416, 2.679832, 0.9803922, 0, 1, 1,
1.021882, -0.8366358, 3.789744, 0.9843137, 0, 1, 1,
1.035849, -0.3388143, 2.241573, 0.9921569, 0, 1, 1,
1.037245, 1.478571, 0.5403553, 0.9960784, 0, 1, 1,
1.038495, -1.055996, 4.018084, 1, 0, 0.9960784, 1,
1.039035, -1.008619, 2.911329, 1, 0, 0.9882353, 1,
1.040943, -0.7315263, 1.259068, 1, 0, 0.9843137, 1,
1.043079, 0.9676551, 1.195965, 1, 0, 0.9764706, 1,
1.04588, 0.3420548, 1.194353, 1, 0, 0.972549, 1,
1.052888, -0.3084663, 3.117023, 1, 0, 0.9647059, 1,
1.058269, 1.19691, 1.163489, 1, 0, 0.9607843, 1,
1.062201, 0.3919489, 0.2385953, 1, 0, 0.9529412, 1,
1.063547, -0.1277368, 3.540745, 1, 0, 0.9490196, 1,
1.065232, 0.1217545, 0.9862943, 1, 0, 0.9411765, 1,
1.068607, 0.3651973, -1.208124, 1, 0, 0.9372549, 1,
1.068926, 0.3120838, 1.816861, 1, 0, 0.9294118, 1,
1.071527, -0.4464851, 1.681862, 1, 0, 0.9254902, 1,
1.073096, -0.15669, 0.731671, 1, 0, 0.9176471, 1,
1.078818, -1.321994, 1.964356, 1, 0, 0.9137255, 1,
1.083129, -0.8489583, 1.004625, 1, 0, 0.9058824, 1,
1.083475, 0.7360356, 1.278362, 1, 0, 0.9019608, 1,
1.083491, -0.5866828, 3.122753, 1, 0, 0.8941177, 1,
1.095317, 0.3274658, 1.855048, 1, 0, 0.8862745, 1,
1.106012, -0.2218248, 2.342384, 1, 0, 0.8823529, 1,
1.106728, 0.1611543, -0.4441753, 1, 0, 0.8745098, 1,
1.111768, 0.1714832, 3.088234, 1, 0, 0.8705882, 1,
1.112745, -1.127334, 1.738205, 1, 0, 0.8627451, 1,
1.118061, -1.987012, 1.706169, 1, 0, 0.8588235, 1,
1.119202, -0.6950248, 1.783234, 1, 0, 0.8509804, 1,
1.123524, -0.6694828, 1.138872, 1, 0, 0.8470588, 1,
1.128121, -0.04660181, 3.37387, 1, 0, 0.8392157, 1,
1.138832, 0.6734059, 1.100413, 1, 0, 0.8352941, 1,
1.139021, -0.08752248, 1.442127, 1, 0, 0.827451, 1,
1.149898, -0.1458355, 2.846508, 1, 0, 0.8235294, 1,
1.152934, 2.107066, -0.3763683, 1, 0, 0.8156863, 1,
1.15483, 0.719689, -0.4583569, 1, 0, 0.8117647, 1,
1.158893, -0.7889488, 2.77191, 1, 0, 0.8039216, 1,
1.162742, -0.6196881, 3.131706, 1, 0, 0.7960784, 1,
1.164902, -0.8325082, 1.479156, 1, 0, 0.7921569, 1,
1.169632, -0.3926264, 1.342027, 1, 0, 0.7843137, 1,
1.171512, -0.5745443, 1.195906, 1, 0, 0.7803922, 1,
1.172636, 0.3768146, 1.90111, 1, 0, 0.772549, 1,
1.173392, -1.379253, 0.8529524, 1, 0, 0.7686275, 1,
1.184867, 0.2590992, 1.686306, 1, 0, 0.7607843, 1,
1.185862, -1.192431, 3.142645, 1, 0, 0.7568628, 1,
1.186851, -0.3401366, 2.819316, 1, 0, 0.7490196, 1,
1.187851, 0.637657, 0.4544851, 1, 0, 0.7450981, 1,
1.196662, 0.7942908, 1.619258, 1, 0, 0.7372549, 1,
1.197733, 0.6443691, 1.166476, 1, 0, 0.7333333, 1,
1.20031, 0.8756757, 0.7444112, 1, 0, 0.7254902, 1,
1.201204, -1.548939, 2.163371, 1, 0, 0.7215686, 1,
1.208492, 0.9384058, 1.132485, 1, 0, 0.7137255, 1,
1.208749, 1.209012, 0.8272719, 1, 0, 0.7098039, 1,
1.216678, -1.133166, 1.187274, 1, 0, 0.7019608, 1,
1.23285, -0.4935125, 2.83937, 1, 0, 0.6941177, 1,
1.234172, -0.6897331, 1.334315, 1, 0, 0.6901961, 1,
1.25348, -0.2975112, 2.42708, 1, 0, 0.682353, 1,
1.271765, 2.122526, -0.006877806, 1, 0, 0.6784314, 1,
1.275393, -0.5613014, 0.8591566, 1, 0, 0.6705883, 1,
1.278535, -0.9991761, 1.314527, 1, 0, 0.6666667, 1,
1.278609, -1.289186, 0.9414654, 1, 0, 0.6588235, 1,
1.284605, -0.006994217, 1.522713, 1, 0, 0.654902, 1,
1.285291, 0.4001376, 3.187648, 1, 0, 0.6470588, 1,
1.286145, 1.967544, 0.1203984, 1, 0, 0.6431373, 1,
1.286965, -1.652705, 2.309209, 1, 0, 0.6352941, 1,
1.296236, 0.4494886, 0.2329613, 1, 0, 0.6313726, 1,
1.298338, -0.7176502, 3.008379, 1, 0, 0.6235294, 1,
1.302696, 0.1676278, 0.9953621, 1, 0, 0.6196079, 1,
1.30398, 0.9558376, 1.64362, 1, 0, 0.6117647, 1,
1.311985, 1.401066, 0.3248297, 1, 0, 0.6078432, 1,
1.312976, 0.9390121, 2.083179, 1, 0, 0.6, 1,
1.31375, 0.4595122, 1.113863, 1, 0, 0.5921569, 1,
1.329714, -0.6047728, 0.9353974, 1, 0, 0.5882353, 1,
1.3308, -0.6772986, -1.010348, 1, 0, 0.5803922, 1,
1.354672, -0.6282402, 1.374647, 1, 0, 0.5764706, 1,
1.356794, -0.3800813, 2.652447, 1, 0, 0.5686275, 1,
1.360035, 0.1663116, 2.253042, 1, 0, 0.5647059, 1,
1.363265, -1.505307, 2.772077, 1, 0, 0.5568628, 1,
1.369344, 0.8447322, -0.8405212, 1, 0, 0.5529412, 1,
1.395808, 1.579292, 0.6238821, 1, 0, 0.5450981, 1,
1.401039, -0.1849408, 2.690755, 1, 0, 0.5411765, 1,
1.401715, -1.606357, 1.123496, 1, 0, 0.5333334, 1,
1.404316, -1.981551, 2.385778, 1, 0, 0.5294118, 1,
1.409352, 0.5048179, 0.7037707, 1, 0, 0.5215687, 1,
1.409642, 1.897543, -1.252997, 1, 0, 0.5176471, 1,
1.424762, -1.143452, 1.970697, 1, 0, 0.509804, 1,
1.438106, -0.03403728, 0.3162245, 1, 0, 0.5058824, 1,
1.446775, -1.939048, 3.654684, 1, 0, 0.4980392, 1,
1.452882, 0.4618867, 0.9712073, 1, 0, 0.4901961, 1,
1.464679, 0.7553632, 0.6126322, 1, 0, 0.4862745, 1,
1.49009, -0.9930063, 1.657577, 1, 0, 0.4784314, 1,
1.492086, 0.162653, 2.423217, 1, 0, 0.4745098, 1,
1.500326, -0.1400103, 0.8630599, 1, 0, 0.4666667, 1,
1.509904, 0.8590398, -0.6257339, 1, 0, 0.4627451, 1,
1.514657, 0.07384738, 2.069458, 1, 0, 0.454902, 1,
1.5317, -0.5351826, 1.652846, 1, 0, 0.4509804, 1,
1.541891, 0.9769701, 1.039656, 1, 0, 0.4431373, 1,
1.542702, 0.2650119, 0.5670201, 1, 0, 0.4392157, 1,
1.551112, -0.7423183, 0.3188614, 1, 0, 0.4313726, 1,
1.555898, 0.880244, 1.641949, 1, 0, 0.427451, 1,
1.556719, -1.741151, 1.423798, 1, 0, 0.4196078, 1,
1.563499, -2.580949, 3.34581, 1, 0, 0.4156863, 1,
1.570144, 0.4186873, 1.449358, 1, 0, 0.4078431, 1,
1.579529, -0.1814704, 2.427147, 1, 0, 0.4039216, 1,
1.585404, -0.3044088, 1.850235, 1, 0, 0.3960784, 1,
1.618123, 0.1015804, 0.6701344, 1, 0, 0.3882353, 1,
1.623225, 1.524778, 1.324196, 1, 0, 0.3843137, 1,
1.623385, -1.049757, 0.3360285, 1, 0, 0.3764706, 1,
1.627178, -1.325467, 2.336548, 1, 0, 0.372549, 1,
1.63224, 0.2016378, 1.289804, 1, 0, 0.3647059, 1,
1.636909, -1.221401, 1.775773, 1, 0, 0.3607843, 1,
1.637432, -0.03828517, 1.581077, 1, 0, 0.3529412, 1,
1.641237, -1.243522, 2.126369, 1, 0, 0.3490196, 1,
1.65463, -0.1251481, 2.064374, 1, 0, 0.3411765, 1,
1.67806, -1.853779, 1.735363, 1, 0, 0.3372549, 1,
1.687193, -1.24757, 1.448479, 1, 0, 0.3294118, 1,
1.698575, 0.9145126, 1.318192, 1, 0, 0.3254902, 1,
1.709855, 0.4378289, -0.03535668, 1, 0, 0.3176471, 1,
1.714557, -1.219712, 3.149263, 1, 0, 0.3137255, 1,
1.733016, -0.03264232, 1.268104, 1, 0, 0.3058824, 1,
1.737562, 0.00489454, 0.2896037, 1, 0, 0.2980392, 1,
1.749068, 0.7730439, 0.8354738, 1, 0, 0.2941177, 1,
1.761263, 0.7192519, 0.513055, 1, 0, 0.2862745, 1,
1.816717, 1.745533, 0.9747907, 1, 0, 0.282353, 1,
1.829715, -1.525948, 1.865284, 1, 0, 0.2745098, 1,
1.855005, 0.07030038, 1.700249, 1, 0, 0.2705882, 1,
1.859823, -3.180704, 1.434179, 1, 0, 0.2627451, 1,
1.860071, 0.0327876, 1.751868, 1, 0, 0.2588235, 1,
1.899491, -0.9573854, 3.909855, 1, 0, 0.2509804, 1,
1.901446, 0.8425151, 0.5627851, 1, 0, 0.2470588, 1,
1.91146, 0.04068566, 3.138622, 1, 0, 0.2392157, 1,
1.915258, 0.29769, 2.24977, 1, 0, 0.2352941, 1,
1.961774, 0.3764063, 0.2231178, 1, 0, 0.227451, 1,
1.972614, 0.4923885, 0.8145347, 1, 0, 0.2235294, 1,
1.999838, 1.144632, 1.007196, 1, 0, 0.2156863, 1,
2.003776, -0.4345083, 2.384461, 1, 0, 0.2117647, 1,
2.014016, -0.4546927, 2.84276, 1, 0, 0.2039216, 1,
2.024484, 1.028155, 1.06034, 1, 0, 0.1960784, 1,
2.053138, -2.064006, 4.732858, 1, 0, 0.1921569, 1,
2.05812, 1.183512, 0.926523, 1, 0, 0.1843137, 1,
2.058739, -0.6251324, 4.052062, 1, 0, 0.1803922, 1,
2.096093, -2.177763, 2.098722, 1, 0, 0.172549, 1,
2.099463, 0.08072726, 1.676452, 1, 0, 0.1686275, 1,
2.114272, -0.1976495, 2.3064, 1, 0, 0.1607843, 1,
2.140791, 2.087993, 1.506589, 1, 0, 0.1568628, 1,
2.160411, 1.766056, 1.428628, 1, 0, 0.1490196, 1,
2.17786, 0.5023764, -0.01776057, 1, 0, 0.145098, 1,
2.188876, 1.408872, 1.833477, 1, 0, 0.1372549, 1,
2.214009, 0.5790042, 0.4122693, 1, 0, 0.1333333, 1,
2.214438, 0.425374, 3.799503, 1, 0, 0.1254902, 1,
2.215677, 0.01381634, 2.102273, 1, 0, 0.1215686, 1,
2.22553, -0.04897867, 1.187214, 1, 0, 0.1137255, 1,
2.248572, 0.3830112, 0.217226, 1, 0, 0.1098039, 1,
2.269515, -1.100859, 3.029282, 1, 0, 0.1019608, 1,
2.329785, -0.9924311, 1.46802, 1, 0, 0.09411765, 1,
2.334319, -0.7707262, 1.849097, 1, 0, 0.09019608, 1,
2.36136, -0.6731473, 2.752379, 1, 0, 0.08235294, 1,
2.436733, -0.5888123, 1.156392, 1, 0, 0.07843138, 1,
2.45412, -0.4199293, 1.984941, 1, 0, 0.07058824, 1,
2.486092, -1.606746, 1.477769, 1, 0, 0.06666667, 1,
2.531299, 0.185682, 1.607285, 1, 0, 0.05882353, 1,
2.60884, 0.2819504, 2.83571, 1, 0, 0.05490196, 1,
2.634966, 0.3937537, 0.07393557, 1, 0, 0.04705882, 1,
2.72436, 1.169387, 0.228156, 1, 0, 0.04313726, 1,
2.736517, -0.9182798, 2.209066, 1, 0, 0.03529412, 1,
2.758191, -1.879009, 4.569503, 1, 0, 0.03137255, 1,
3.044699, -0.965393, 1.623085, 1, 0, 0.02352941, 1,
3.156747, -1.560991, 3.929633, 1, 0, 0.01960784, 1,
3.185395, -0.1919664, 0.6578931, 1, 0, 0.01176471, 1,
3.857876, 0.4615449, 1.176373, 1, 0, 0.007843138, 1
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
0.4089836, -4.380552, -7.652965, 0, -0.5, 0.5, 0.5,
0.4089836, -4.380552, -7.652965, 1, -0.5, 0.5, 0.5,
0.4089836, -4.380552, -7.652965, 1, 1.5, 0.5, 0.5,
0.4089836, -4.380552, -7.652965, 0, 1.5, 0.5, 0.5
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
-4.209083, -0.307503, -7.652965, 0, -0.5, 0.5, 0.5,
-4.209083, -0.307503, -7.652965, 1, -0.5, 0.5, 0.5,
-4.209083, -0.307503, -7.652965, 1, 1.5, 0.5, 0.5,
-4.209083, -0.307503, -7.652965, 0, 1.5, 0.5, 0.5
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
-4.209083, -4.380552, -0.1651237, 0, -0.5, 0.5, 0.5,
-4.209083, -4.380552, -0.1651237, 1, -0.5, 0.5, 0.5,
-4.209083, -4.380552, -0.1651237, 1, 1.5, 0.5, 0.5,
-4.209083, -4.380552, -0.1651237, 0, 1.5, 0.5, 0.5
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
-3, -3.440617, -5.925002,
3, -3.440617, -5.925002,
-3, -3.440617, -5.925002,
-3, -3.597273, -6.212996,
-2, -3.440617, -5.925002,
-2, -3.597273, -6.212996,
-1, -3.440617, -5.925002,
-1, -3.597273, -6.212996,
0, -3.440617, -5.925002,
0, -3.597273, -6.212996,
1, -3.440617, -5.925002,
1, -3.597273, -6.212996,
2, -3.440617, -5.925002,
2, -3.597273, -6.212996,
3, -3.440617, -5.925002,
3, -3.597273, -6.212996
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
-3, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
-3, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
-3, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
-3, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
-2, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
-2, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
-2, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
-2, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
-1, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
-1, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
-1, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
-1, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
0, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
0, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
0, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
0, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
1, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
1, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
1, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
1, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
2, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
2, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
2, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
2, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5,
3, -3.910585, -6.788983, 0, -0.5, 0.5, 0.5,
3, -3.910585, -6.788983, 1, -0.5, 0.5, 0.5,
3, -3.910585, -6.788983, 1, 1.5, 0.5, 0.5,
3, -3.910585, -6.788983, 0, 1.5, 0.5, 0.5
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
-3.143375, -3, -5.925002,
-3.143375, 2, -5.925002,
-3.143375, -3, -5.925002,
-3.320993, -3, -6.212996,
-3.143375, -2, -5.925002,
-3.320993, -2, -6.212996,
-3.143375, -1, -5.925002,
-3.320993, -1, -6.212996,
-3.143375, 0, -5.925002,
-3.320993, 0, -6.212996,
-3.143375, 1, -5.925002,
-3.320993, 1, -6.212996,
-3.143375, 2, -5.925002,
-3.320993, 2, -6.212996
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
-3.676229, -3, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, -3, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, -3, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, -3, -6.788983, 0, 1.5, 0.5, 0.5,
-3.676229, -2, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, -2, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, -2, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, -2, -6.788983, 0, 1.5, 0.5, 0.5,
-3.676229, -1, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, -1, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, -1, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, -1, -6.788983, 0, 1.5, 0.5, 0.5,
-3.676229, 0, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, 0, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, 0, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, 0, -6.788983, 0, 1.5, 0.5, 0.5,
-3.676229, 1, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, 1, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, 1, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, 1, -6.788983, 0, 1.5, 0.5, 0.5,
-3.676229, 2, -6.788983, 0, -0.5, 0.5, 0.5,
-3.676229, 2, -6.788983, 1, -0.5, 0.5, 0.5,
-3.676229, 2, -6.788983, 1, 1.5, 0.5, 0.5,
-3.676229, 2, -6.788983, 0, 1.5, 0.5, 0.5
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
-3.143375, -3.440617, -4,
-3.143375, -3.440617, 4,
-3.143375, -3.440617, -4,
-3.320993, -3.597273, -4,
-3.143375, -3.440617, -2,
-3.320993, -3.597273, -2,
-3.143375, -3.440617, 0,
-3.320993, -3.597273, 0,
-3.143375, -3.440617, 2,
-3.320993, -3.597273, 2,
-3.143375, -3.440617, 4,
-3.320993, -3.597273, 4
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
-3.676229, -3.910585, -4, 0, -0.5, 0.5, 0.5,
-3.676229, -3.910585, -4, 1, -0.5, 0.5, 0.5,
-3.676229, -3.910585, -4, 1, 1.5, 0.5, 0.5,
-3.676229, -3.910585, -4, 0, 1.5, 0.5, 0.5,
-3.676229, -3.910585, -2, 0, -0.5, 0.5, 0.5,
-3.676229, -3.910585, -2, 1, -0.5, 0.5, 0.5,
-3.676229, -3.910585, -2, 1, 1.5, 0.5, 0.5,
-3.676229, -3.910585, -2, 0, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 0, 0, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 0, 1, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 0, 1, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 0, 0, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 2, 0, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 2, 1, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 2, 1, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 2, 0, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 4, 0, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 4, 1, -0.5, 0.5, 0.5,
-3.676229, -3.910585, 4, 1, 1.5, 0.5, 0.5,
-3.676229, -3.910585, 4, 0, 1.5, 0.5, 0.5
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
-3.143375, -3.440617, -5.925002,
-3.143375, 2.825611, -5.925002,
-3.143375, -3.440617, 5.594754,
-3.143375, 2.825611, 5.594754,
-3.143375, -3.440617, -5.925002,
-3.143375, -3.440617, 5.594754,
-3.143375, 2.825611, -5.925002,
-3.143375, 2.825611, 5.594754,
-3.143375, -3.440617, -5.925002,
3.961342, -3.440617, -5.925002,
-3.143375, -3.440617, 5.594754,
3.961342, -3.440617, 5.594754,
-3.143375, 2.825611, -5.925002,
3.961342, 2.825611, -5.925002,
-3.143375, 2.825611, 5.594754,
3.961342, 2.825611, 5.594754,
3.961342, -3.440617, -5.925002,
3.961342, 2.825611, -5.925002,
3.961342, -3.440617, 5.594754,
3.961342, 2.825611, 5.594754,
3.961342, -3.440617, -5.925002,
3.961342, -3.440617, 5.594754,
3.961342, 2.825611, -5.925002,
3.961342, 2.825611, 5.594754
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
var radius = 7.964145;
var distance = 35.43338;
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
mvMatrix.translate( -0.4089836, 0.307503, 0.1651237 );
mvMatrix.scale( 1.21201, 1.37419, 0.7474976 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43338);
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
fenoxaprop-ethyl<-read.table("fenoxaprop-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenoxaprop-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
y<-fenoxaprop-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
```

```r
z<-fenoxaprop-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenoxaprop' not found
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
-3.039908, -0.2101683, -2.166876, 0, 0, 1, 1, 1,
-2.804192, -0.0306638, -0.6302344, 1, 0, 0, 1, 1,
-2.797996, -0.5338182, -1.409407, 1, 0, 0, 1, 1,
-2.789191, -0.5244541, -1.704572, 1, 0, 0, 1, 1,
-2.692344, 2.169564, -1.500441, 1, 0, 0, 1, 1,
-2.595934, -0.8292643, -2.905634, 1, 0, 0, 1, 1,
-2.556716, -1.459625, -2.141824, 0, 0, 0, 1, 1,
-2.412779, -1.10334, -3.141928, 0, 0, 0, 1, 1,
-2.291188, 0.5644802, -1.263041, 0, 0, 0, 1, 1,
-2.272065, 0.3680128, -0.3224438, 0, 0, 0, 1, 1,
-2.233471, -0.08702015, -1.487146, 0, 0, 0, 1, 1,
-2.231376, -0.6867755, -1.786496, 0, 0, 0, 1, 1,
-2.205848, -0.3204948, -1.379818, 0, 0, 0, 1, 1,
-2.168097, -1.425501, -1.89677, 1, 1, 1, 1, 1,
-2.153828, -0.7170147, -1.28984, 1, 1, 1, 1, 1,
-2.142286, -1.011369, -1.975066, 1, 1, 1, 1, 1,
-2.131545, -0.104594, -2.102231, 1, 1, 1, 1, 1,
-2.123711, 0.5934986, -3.159178, 1, 1, 1, 1, 1,
-2.116731, 0.5146736, -1.390886, 1, 1, 1, 1, 1,
-2.101576, 1.146798, 1.989246, 1, 1, 1, 1, 1,
-2.068173, 1.349359, -0.7338705, 1, 1, 1, 1, 1,
-2.064206, -0.3772235, -1.09507, 1, 1, 1, 1, 1,
-2.035265, -2.001522, -3.471145, 1, 1, 1, 1, 1,
-2.028146, -0.8254061, -2.483654, 1, 1, 1, 1, 1,
-2.02423, 2.215608, -1.39564, 1, 1, 1, 1, 1,
-2.019521, 1.054408, -2.334353, 1, 1, 1, 1, 1,
-2.011705, -0.2006485, -0.5120531, 1, 1, 1, 1, 1,
-1.9396, 0.1422718, -1.75614, 1, 1, 1, 1, 1,
-1.884289, -0.5417449, -2.131088, 0, 0, 1, 1, 1,
-1.883142, -1.292196, -2.416939, 1, 0, 0, 1, 1,
-1.838202, -1.259476, -3.391747, 1, 0, 0, 1, 1,
-1.833727, -0.3500222, -0.7883112, 1, 0, 0, 1, 1,
-1.820078, 0.3664953, -3.061779, 1, 0, 0, 1, 1,
-1.813555, 1.480805, -2.259248, 1, 0, 0, 1, 1,
-1.810583, -2.607673, -2.823705, 0, 0, 0, 1, 1,
-1.803659, 0.8402514, -1.176105, 0, 0, 0, 1, 1,
-1.801564, 0.7520006, -1.684322, 0, 0, 0, 1, 1,
-1.787247, -0.009662283, -1.402526, 0, 0, 0, 1, 1,
-1.769916, -1.380292, -2.190762, 0, 0, 0, 1, 1,
-1.766278, 0.2965676, -3.322592, 0, 0, 0, 1, 1,
-1.752458, -1.365222, -2.464702, 0, 0, 0, 1, 1,
-1.750712, -0.7465125, -1.242766, 1, 1, 1, 1, 1,
-1.744255, 0.7280701, -0.8560014, 1, 1, 1, 1, 1,
-1.711994, -0.3809421, -2.920737, 1, 1, 1, 1, 1,
-1.693792, 0.7987431, -0.1772895, 1, 1, 1, 1, 1,
-1.6905, 0.8262169, -0.8442112, 1, 1, 1, 1, 1,
-1.660297, 1.777562, 1.470755, 1, 1, 1, 1, 1,
-1.655513, 2.291409, -1.486744, 1, 1, 1, 1, 1,
-1.650241, -0.3231533, -1.660074, 1, 1, 1, 1, 1,
-1.614878, 0.3804454, -0.1473072, 1, 1, 1, 1, 1,
-1.609473, 2.734356, -1.071971, 1, 1, 1, 1, 1,
-1.608078, 1.771461, 0.6313051, 1, 1, 1, 1, 1,
-1.600936, -0.3446045, -2.062615, 1, 1, 1, 1, 1,
-1.59907, -2.383063, -1.715473, 1, 1, 1, 1, 1,
-1.598447, -0.001252869, -1.658269, 1, 1, 1, 1, 1,
-1.596834, 0.702617, -1.204851, 1, 1, 1, 1, 1,
-1.586773, -0.2478564, -1.027413, 0, 0, 1, 1, 1,
-1.56932, -0.4323907, -2.921503, 1, 0, 0, 1, 1,
-1.549084, -1.225406, -1.424989, 1, 0, 0, 1, 1,
-1.537717, -0.04223363, -1.286335, 1, 0, 0, 1, 1,
-1.527072, 0.6139613, -0.7179376, 1, 0, 0, 1, 1,
-1.525274, 0.3095467, -1.94878, 1, 0, 0, 1, 1,
-1.521598, -0.6021487, -0.6992224, 0, 0, 0, 1, 1,
-1.519542, -1.297972, -3.435007, 0, 0, 0, 1, 1,
-1.493358, 1.306152, -0.8887818, 0, 0, 0, 1, 1,
-1.492824, -0.1252584, -2.952865, 0, 0, 0, 1, 1,
-1.484495, -0.8381799, -1.448576, 0, 0, 0, 1, 1,
-1.481154, 0.1622691, -2.084656, 0, 0, 0, 1, 1,
-1.473305, -0.9347295, -2.142115, 0, 0, 0, 1, 1,
-1.462213, -0.4744531, -1.489994, 1, 1, 1, 1, 1,
-1.461227, -0.3920335, -1.711825, 1, 1, 1, 1, 1,
-1.447195, -1.373317, -2.401761, 1, 1, 1, 1, 1,
-1.437037, 1.355835, -0.4778145, 1, 1, 1, 1, 1,
-1.431091, -1.268867, -0.5326458, 1, 1, 1, 1, 1,
-1.417984, 2.080145, -1.903324, 1, 1, 1, 1, 1,
-1.405554, 0.9036781, -1.630897, 1, 1, 1, 1, 1,
-1.404078, -1.137628, -3.88753, 1, 1, 1, 1, 1,
-1.402511, 0.6114289, -1.887384, 1, 1, 1, 1, 1,
-1.400902, 0.8923787, 1.261883, 1, 1, 1, 1, 1,
-1.397849, 0.2685752, 0.003216874, 1, 1, 1, 1, 1,
-1.394537, -0.7068844, -1.601435, 1, 1, 1, 1, 1,
-1.390541, 1.267226, -1.324119, 1, 1, 1, 1, 1,
-1.388699, 1.096811, -2.34469, 1, 1, 1, 1, 1,
-1.377433, -1.425152, -3.17589, 1, 1, 1, 1, 1,
-1.372335, -0.07777938, -2.598961, 0, 0, 1, 1, 1,
-1.371228, -1.384334, -0.5499164, 1, 0, 0, 1, 1,
-1.367153, 1.098622, 0.4373548, 1, 0, 0, 1, 1,
-1.365381, 0.7095429, -1.712956, 1, 0, 0, 1, 1,
-1.365036, -1.616645, -2.456962, 1, 0, 0, 1, 1,
-1.359424, 0.9536958, 0.5495707, 1, 0, 0, 1, 1,
-1.346365, 0.6989406, -0.7582081, 0, 0, 0, 1, 1,
-1.346173, 0.6304836, -1.312928, 0, 0, 0, 1, 1,
-1.34578, -0.2535296, -2.197099, 0, 0, 0, 1, 1,
-1.324914, -1.236544, -1.127989, 0, 0, 0, 1, 1,
-1.318083, -0.3800136, -1.809184, 0, 0, 0, 1, 1,
-1.310341, 0.7724127, -2.333292, 0, 0, 0, 1, 1,
-1.304925, -1.01157, -3.182223, 0, 0, 0, 1, 1,
-1.28884, -0.2515734, -0.2334555, 1, 1, 1, 1, 1,
-1.286606, -1.69825, -1.953244, 1, 1, 1, 1, 1,
-1.28162, 0.9712222, -1.378988, 1, 1, 1, 1, 1,
-1.277885, -1.255644, -1.998434, 1, 1, 1, 1, 1,
-1.265665, 0.1981637, -3.527812, 1, 1, 1, 1, 1,
-1.265401, 0.04409185, -2.555295, 1, 1, 1, 1, 1,
-1.24237, -0.3276162, -2.301458, 1, 1, 1, 1, 1,
-1.238518, -1.83333, -3.331134, 1, 1, 1, 1, 1,
-1.228084, -1.9501, -4.396451, 1, 1, 1, 1, 1,
-1.22515, 0.902027, -1.011132, 1, 1, 1, 1, 1,
-1.216887, 0.4972716, -1.297823, 1, 1, 1, 1, 1,
-1.209935, 1.092374, -0.5085054, 1, 1, 1, 1, 1,
-1.20463, -0.6248744, -0.7860354, 1, 1, 1, 1, 1,
-1.203929, -0.1225503, -3.923418, 1, 1, 1, 1, 1,
-1.202381, -0.6480776, -1.262353, 1, 1, 1, 1, 1,
-1.198846, -0.2081725, -1.457844, 0, 0, 1, 1, 1,
-1.198446, 0.7480024, -0.7220867, 1, 0, 0, 1, 1,
-1.195544, 0.2055396, -1.400505, 1, 0, 0, 1, 1,
-1.184486, -2.728223, -2.227036, 1, 0, 0, 1, 1,
-1.184429, -0.4486673, -0.2400201, 1, 0, 0, 1, 1,
-1.182743, 0.9980047, -0.9323109, 1, 0, 0, 1, 1,
-1.17214, 0.2924884, -1.001714, 0, 0, 0, 1, 1,
-1.168603, -0.3552469, -1.086184, 0, 0, 0, 1, 1,
-1.162555, 1.700871, -0.04877457, 0, 0, 0, 1, 1,
-1.161428, -0.6548083, -0.3035317, 0, 0, 0, 1, 1,
-1.156472, -0.006933961, -2.084612, 0, 0, 0, 1, 1,
-1.152926, -1.0908, -3.112135, 0, 0, 0, 1, 1,
-1.1527, -0.2829654, -2.055419, 0, 0, 0, 1, 1,
-1.152013, -1.522946, -4.395616, 1, 1, 1, 1, 1,
-1.144575, 0.1689565, 0.53026, 1, 1, 1, 1, 1,
-1.143352, -0.9274569, -4.262025, 1, 1, 1, 1, 1,
-1.132258, 0.7823489, 1.308864, 1, 1, 1, 1, 1,
-1.130748, 0.7375326, 0.2805958, 1, 1, 1, 1, 1,
-1.128941, -0.07512573, -3.020179, 1, 1, 1, 1, 1,
-1.125709, -0.4264022, -2.079195, 1, 1, 1, 1, 1,
-1.118959, 0.1780177, -1.480045, 1, 1, 1, 1, 1,
-1.110204, -1.136946, -0.9682028, 1, 1, 1, 1, 1,
-1.107071, 0.03006408, -2.588483, 1, 1, 1, 1, 1,
-1.105265, -2.003417, -2.604038, 1, 1, 1, 1, 1,
-1.100947, -1.100507, -1.840422, 1, 1, 1, 1, 1,
-1.100272, 0.7110006, -0.3106663, 1, 1, 1, 1, 1,
-1.098652, -0.4869869, -2.902586, 1, 1, 1, 1, 1,
-1.09737, 0.3470373, -1.015236, 1, 1, 1, 1, 1,
-1.093567, -0.03466296, -1.073982, 0, 0, 1, 1, 1,
-1.089546, -2.165736, -2.766195, 1, 0, 0, 1, 1,
-1.080308, -0.1226483, -1.931155, 1, 0, 0, 1, 1,
-1.072443, -0.247263, -0.4937528, 1, 0, 0, 1, 1,
-1.064631, 0.9712893, -0.5947459, 1, 0, 0, 1, 1,
-1.062175, 0.6483142, 0.3244672, 1, 0, 0, 1, 1,
-1.056007, -0.1071206, -1.458809, 0, 0, 0, 1, 1,
-1.05436, 0.7129173, -1.141748, 0, 0, 0, 1, 1,
-1.050209, -0.7035025, -4.397866, 0, 0, 0, 1, 1,
-1.047876, 1.804093, 0.3766429, 0, 0, 0, 1, 1,
-1.042168, 0.00569538, -3.251741, 0, 0, 0, 1, 1,
-1.039704, 0.6493841, -2.771652, 0, 0, 0, 1, 1,
-1.030339, 1.527728, -1.151588, 0, 0, 0, 1, 1,
-1.028286, -0.2550083, -1.632015, 1, 1, 1, 1, 1,
-1.027565, 1.510018, -0.6005527, 1, 1, 1, 1, 1,
-1.026424, -2.681975, -3.3459, 1, 1, 1, 1, 1,
-1.01826, 0.7237421, 0.38923, 1, 1, 1, 1, 1,
-1.015657, -1.490961, -2.292642, 1, 1, 1, 1, 1,
-1.001426, 0.5781946, 0.08196819, 1, 1, 1, 1, 1,
-0.9989508, 0.6807696, -0.1174389, 1, 1, 1, 1, 1,
-0.9852758, 0.5677873, -0.4105215, 1, 1, 1, 1, 1,
-0.9828867, -0.8476953, -2.763427, 1, 1, 1, 1, 1,
-0.9828538, 1.351711, 0.09057931, 1, 1, 1, 1, 1,
-0.9755811, 0.1927711, -2.15272, 1, 1, 1, 1, 1,
-0.9755013, 0.3321919, -1.252113, 1, 1, 1, 1, 1,
-0.9754553, -0.7159983, -2.513676, 1, 1, 1, 1, 1,
-0.9750796, 1.54013, -1.696585, 1, 1, 1, 1, 1,
-0.9739639, 0.7938465, -0.2410301, 1, 1, 1, 1, 1,
-0.9700903, 1.596203, -1.263293, 0, 0, 1, 1, 1,
-0.9620354, -0.831715, -2.592968, 1, 0, 0, 1, 1,
-0.9547472, 0.4993266, -1.93098, 1, 0, 0, 1, 1,
-0.9480438, 0.5664384, -1.922566, 1, 0, 0, 1, 1,
-0.9455495, -0.8256961, -1.895957, 1, 0, 0, 1, 1,
-0.9327053, 0.403608, -1.94871, 1, 0, 0, 1, 1,
-0.9256851, -0.6103079, -1.601802, 0, 0, 0, 1, 1,
-0.9227542, -1.326808, -2.959266, 0, 0, 0, 1, 1,
-0.9144596, -0.6943336, -1.372618, 0, 0, 0, 1, 1,
-0.8944881, 1.235756, -1.264362, 0, 0, 0, 1, 1,
-0.8913646, 1.395146, -0.3786971, 0, 0, 0, 1, 1,
-0.8904009, 0.6102991, -0.887064, 0, 0, 0, 1, 1,
-0.873334, -0.5831817, -2.737277, 0, 0, 0, 1, 1,
-0.8646056, -0.7498665, -1.289112, 1, 1, 1, 1, 1,
-0.861052, 1.563819, 0.0533225, 1, 1, 1, 1, 1,
-0.8572113, 0.2628966, -1.919385, 1, 1, 1, 1, 1,
-0.8516515, 0.3173924, -2.14136, 1, 1, 1, 1, 1,
-0.8501619, 0.7489905, -2.618388, 1, 1, 1, 1, 1,
-0.8496439, 2.42975, 0.6778028, 1, 1, 1, 1, 1,
-0.8462704, 0.1559447, -1.576296, 1, 1, 1, 1, 1,
-0.8422402, 1.212132, 0.2844252, 1, 1, 1, 1, 1,
-0.8406718, -1.193667, -2.119281, 1, 1, 1, 1, 1,
-0.8396464, -1.09478, -3.364148, 1, 1, 1, 1, 1,
-0.8395168, -1.994904, -2.217705, 1, 1, 1, 1, 1,
-0.8390187, 2.159429, 0.3071425, 1, 1, 1, 1, 1,
-0.8387091, -0.2660561, 0.7510915, 1, 1, 1, 1, 1,
-0.8367931, 0.8718021, 0.2528276, 1, 1, 1, 1, 1,
-0.8357949, 1.180775, 0.1034338, 1, 1, 1, 1, 1,
-0.834245, -0.8105251, -3.096015, 0, 0, 1, 1, 1,
-0.8249602, -1.240667, -1.489708, 1, 0, 0, 1, 1,
-0.8172937, 1.002292, 0.186588, 1, 0, 0, 1, 1,
-0.8153687, 0.338192, -2.187475, 1, 0, 0, 1, 1,
-0.8151158, -0.6329818, -1.615674, 1, 0, 0, 1, 1,
-0.8108121, -2.212494, -2.47418, 1, 0, 0, 1, 1,
-0.8097113, -1.590654, -1.859303, 0, 0, 0, 1, 1,
-0.8090884, 0.1679869, -2.125286, 0, 0, 0, 1, 1,
-0.8088553, 1.013175, -2.341662, 0, 0, 0, 1, 1,
-0.805238, -1.089125, -2.257706, 0, 0, 0, 1, 1,
-0.8031188, 0.59644, -0.6257274, 0, 0, 0, 1, 1,
-0.8023129, 0.2733413, -1.609994, 0, 0, 0, 1, 1,
-0.8021154, -0.8846247, -2.356009, 0, 0, 0, 1, 1,
-0.7973475, -1.677971, -3.127381, 1, 1, 1, 1, 1,
-0.7961605, 0.8464906, 0.3378619, 1, 1, 1, 1, 1,
-0.7894467, 0.73891, 0.09818742, 1, 1, 1, 1, 1,
-0.7889866, 1.027379, -0.442775, 1, 1, 1, 1, 1,
-0.7762222, -0.1712819, -2.193042, 1, 1, 1, 1, 1,
-0.7676077, -0.06163908, -0.5459107, 1, 1, 1, 1, 1,
-0.7597376, -1.665228, -2.942883, 1, 1, 1, 1, 1,
-0.758599, -1.265087, -2.406528, 1, 1, 1, 1, 1,
-0.7560486, 1.70683, 0.09379321, 1, 1, 1, 1, 1,
-0.7498535, 0.1790671, -0.01930475, 1, 1, 1, 1, 1,
-0.7479331, 1.28376, 1.436147, 1, 1, 1, 1, 1,
-0.7445049, 0.2065778, -0.8454918, 1, 1, 1, 1, 1,
-0.7422011, -1.906756, -3.956396, 1, 1, 1, 1, 1,
-0.7419083, 2.631874, -0.8855018, 1, 1, 1, 1, 1,
-0.7386343, 0.769687, 0.3364977, 1, 1, 1, 1, 1,
-0.7362822, -1.579881, -3.842252, 0, 0, 1, 1, 1,
-0.7192878, 1.584954, -0.056229, 1, 0, 0, 1, 1,
-0.7166626, 0.6588027, -0.006028657, 1, 0, 0, 1, 1,
-0.7143502, 0.03879755, -3.129311, 1, 0, 0, 1, 1,
-0.7120704, -0.316301, -3.941447, 1, 0, 0, 1, 1,
-0.7075334, -0.864543, -2.578489, 1, 0, 0, 1, 1,
-0.7000122, 0.6978596, 0.6406065, 0, 0, 0, 1, 1,
-0.6995049, 1.230416, -0.402451, 0, 0, 0, 1, 1,
-0.6980295, -2.033906, -2.589634, 0, 0, 0, 1, 1,
-0.6953692, 1.373915, -0.07866249, 0, 0, 0, 1, 1,
-0.6936607, -0.9532244, -2.304704, 0, 0, 0, 1, 1,
-0.6894335, -0.6831535, -3.579664, 0, 0, 0, 1, 1,
-0.6860545, -2.528275, -4.511867, 0, 0, 0, 1, 1,
-0.6818298, -0.5366271, -2.502401, 1, 1, 1, 1, 1,
-0.6814247, -2.136593, -3.058557, 1, 1, 1, 1, 1,
-0.6808501, -0.2370002, -3.572961, 1, 1, 1, 1, 1,
-0.678466, 1.002334, 0.2731115, 1, 1, 1, 1, 1,
-0.6684234, -0.1333326, 1.528859, 1, 1, 1, 1, 1,
-0.665717, 0.02878329, -2.612418, 1, 1, 1, 1, 1,
-0.66563, -1.018038, -3.260679, 1, 1, 1, 1, 1,
-0.6488287, 1.912046, -0.9130117, 1, 1, 1, 1, 1,
-0.6484787, -0.8786689, -2.069637, 1, 1, 1, 1, 1,
-0.640175, -1.359127, -4.813111, 1, 1, 1, 1, 1,
-0.6385363, 0.1781272, 0.7922729, 1, 1, 1, 1, 1,
-0.6331541, 0.5482529, 0.2307156, 1, 1, 1, 1, 1,
-0.6293913, -0.06592815, -2.857409, 1, 1, 1, 1, 1,
-0.6229323, -0.7031782, -2.864288, 1, 1, 1, 1, 1,
-0.6201854, -0.6126233, -1.728415, 1, 1, 1, 1, 1,
-0.6143534, 1.072322, -0.584904, 0, 0, 1, 1, 1,
-0.6124531, 1.537125, -0.1459359, 1, 0, 0, 1, 1,
-0.6108385, 0.3895725, -0.914779, 1, 0, 0, 1, 1,
-0.6072551, -0.2608241, -2.91999, 1, 0, 0, 1, 1,
-0.6044417, 0.7332155, -1.915879, 1, 0, 0, 1, 1,
-0.6033593, 0.6192191, -0.1733976, 1, 0, 0, 1, 1,
-0.6012374, -0.719432, -2.45028, 0, 0, 0, 1, 1,
-0.5957173, -0.302981, -1.894105, 0, 0, 0, 1, 1,
-0.5956472, 1.308614, -1.914912, 0, 0, 0, 1, 1,
-0.5952917, -1.650688, -2.670326, 0, 0, 0, 1, 1,
-0.5911603, -1.227398, -2.950482, 0, 0, 0, 1, 1,
-0.5910813, -0.8981403, -2.173174, 0, 0, 0, 1, 1,
-0.5867539, 0.3738061, 0.6056203, 0, 0, 0, 1, 1,
-0.5803105, 0.09302795, -1.09793, 1, 1, 1, 1, 1,
-0.5758845, 0.2664832, -1.432464, 1, 1, 1, 1, 1,
-0.574733, 2.086867, 0.5724959, 1, 1, 1, 1, 1,
-0.5741735, 0.3493064, -1.153572, 1, 1, 1, 1, 1,
-0.5741251, -0.2391351, -4.129506, 1, 1, 1, 1, 1,
-0.5721401, -0.2646087, -1.215153, 1, 1, 1, 1, 1,
-0.5694824, -0.2264932, -3.20782, 1, 1, 1, 1, 1,
-0.5628053, -1.201074, -2.336909, 1, 1, 1, 1, 1,
-0.5623151, 0.3238894, 0.01815568, 1, 1, 1, 1, 1,
-0.560363, -0.2549607, -1.113456, 1, 1, 1, 1, 1,
-0.5594205, -0.1432412, -1.980369, 1, 1, 1, 1, 1,
-0.5588537, -0.4118368, -0.3040863, 1, 1, 1, 1, 1,
-0.5568843, -1.867685, -3.408947, 1, 1, 1, 1, 1,
-0.5544953, 0.9756495, -0.8805617, 1, 1, 1, 1, 1,
-0.5483177, -0.02357999, -2.174984, 1, 1, 1, 1, 1,
-0.546665, 0.2202287, -1.054635, 0, 0, 1, 1, 1,
-0.5450345, -1.796535, -2.407928, 1, 0, 0, 1, 1,
-0.5447324, -0.7200373, -2.942136, 1, 0, 0, 1, 1,
-0.5375453, 0.3318412, -0.4108753, 1, 0, 0, 1, 1,
-0.5367875, -0.06790632, 0.4393896, 1, 0, 0, 1, 1,
-0.5274613, -0.4590987, -1.194442, 1, 0, 0, 1, 1,
-0.5255995, -0.6107559, -1.370009, 0, 0, 0, 1, 1,
-0.5237103, -1.974342, -3.156771, 0, 0, 0, 1, 1,
-0.5207162, -1.268549, -3.350075, 0, 0, 0, 1, 1,
-0.519922, -1.532767, -3.978036, 0, 0, 0, 1, 1,
-0.5197681, -0.9301995, -5.422388, 0, 0, 0, 1, 1,
-0.5193989, 0.02681098, 0.2043408, 0, 0, 0, 1, 1,
-0.513528, 0.1837729, -2.499681, 0, 0, 0, 1, 1,
-0.5123081, -0.1147735, -0.7195415, 1, 1, 1, 1, 1,
-0.5120013, -0.1091801, -2.501784, 1, 1, 1, 1, 1,
-0.5117218, 0.9229641, -1.596807, 1, 1, 1, 1, 1,
-0.5095476, -0.2566693, -4.718504, 1, 1, 1, 1, 1,
-0.5074803, 0.9209449, 1.436244, 1, 1, 1, 1, 1,
-0.5054408, -0.7474183, -0.7371517, 1, 1, 1, 1, 1,
-0.4902869, 0.3494789, -0.3703086, 1, 1, 1, 1, 1,
-0.4888861, 0.7422818, -1.387952, 1, 1, 1, 1, 1,
-0.4773467, -0.05381159, -1.59454, 1, 1, 1, 1, 1,
-0.4747315, -0.04996417, -1.708121, 1, 1, 1, 1, 1,
-0.4660294, -1.629802, -4.353927, 1, 1, 1, 1, 1,
-0.4638256, -1.024409, -1.655547, 1, 1, 1, 1, 1,
-0.4631108, -0.08457886, -0.5101262, 1, 1, 1, 1, 1,
-0.4597147, -0.04252389, -1.587088, 1, 1, 1, 1, 1,
-0.4595606, -0.6397558, -3.169798, 1, 1, 1, 1, 1,
-0.4579564, -0.179793, -1.059108, 0, 0, 1, 1, 1,
-0.4565738, 1.516971, -0.02948336, 1, 0, 0, 1, 1,
-0.4519807, -1.222915, -3.1275, 1, 0, 0, 1, 1,
-0.4403408, -0.1591791, -1.981864, 1, 0, 0, 1, 1,
-0.4370332, 0.3592544, 0.0836162, 1, 0, 0, 1, 1,
-0.4337141, -0.07892711, -0.906022, 1, 0, 0, 1, 1,
-0.4275852, -0.296635, -2.254247, 0, 0, 0, 1, 1,
-0.425431, -0.148763, -2.791949, 0, 0, 0, 1, 1,
-0.4193914, -0.5317928, -3.625365, 0, 0, 0, 1, 1,
-0.417222, -0.8681936, -1.484859, 0, 0, 0, 1, 1,
-0.4160777, 0.04205044, -2.216262, 0, 0, 0, 1, 1,
-0.4129685, -1.087661, -2.65258, 0, 0, 0, 1, 1,
-0.4120457, 0.06146876, -2.315585, 0, 0, 0, 1, 1,
-0.4015499, -0.7764053, -3.099133, 1, 1, 1, 1, 1,
-0.4004272, -0.1009494, -3.278774, 1, 1, 1, 1, 1,
-0.3963604, -1.155602, -2.842388, 1, 1, 1, 1, 1,
-0.3956123, -0.362355, -2.439171, 1, 1, 1, 1, 1,
-0.3906096, -0.08995502, -0.8393875, 1, 1, 1, 1, 1,
-0.388862, 0.3687092, 0.7542622, 1, 1, 1, 1, 1,
-0.3829679, 0.4074047, -0.8011984, 1, 1, 1, 1, 1,
-0.3803567, 0.8550741, -1.434577, 1, 1, 1, 1, 1,
-0.3797294, -0.2621767, -0.9125749, 1, 1, 1, 1, 1,
-0.3771538, -0.511537, -1.243022, 1, 1, 1, 1, 1,
-0.3716906, 0.5062833, -1.254679, 1, 1, 1, 1, 1,
-0.3706085, 0.1791105, -0.0276229, 1, 1, 1, 1, 1,
-0.3690089, 1.655051, -0.7593877, 1, 1, 1, 1, 1,
-0.3672156, -3.349362, -4.522237, 1, 1, 1, 1, 1,
-0.3670782, 0.2343189, 0.3614495, 1, 1, 1, 1, 1,
-0.3647566, -1.017755, -2.786589, 0, 0, 1, 1, 1,
-0.3625724, -0.7459175, -4.456909, 1, 0, 0, 1, 1,
-0.3618778, 0.4300246, 0.3119021, 1, 0, 0, 1, 1,
-0.3544795, -0.7294652, -3.706477, 1, 0, 0, 1, 1,
-0.3462211, -1.513125, -3.294191, 1, 0, 0, 1, 1,
-0.3453437, 0.6685675, -0.5095633, 1, 0, 0, 1, 1,
-0.344639, -0.1856665, -3.905301, 0, 0, 0, 1, 1,
-0.3387599, -0.04551788, -1.727614, 0, 0, 0, 1, 1,
-0.3367936, -1.02149, -3.475309, 0, 0, 0, 1, 1,
-0.33589, 1.147912, -0.9780425, 0, 0, 0, 1, 1,
-0.3316695, 1.08177, -1.122872, 0, 0, 0, 1, 1,
-0.3231815, -0.6439838, -3.011001, 0, 0, 0, 1, 1,
-0.3198321, 0.1889388, -2.608238, 0, 0, 0, 1, 1,
-0.3188867, 0.777193, -0.3200433, 1, 1, 1, 1, 1,
-0.3170465, -0.7685186, -3.693407, 1, 1, 1, 1, 1,
-0.3116675, 0.0143354, -3.471995, 1, 1, 1, 1, 1,
-0.3100877, -0.3786278, -3.926237, 1, 1, 1, 1, 1,
-0.3098286, -0.7621551, -4.169998, 1, 1, 1, 1, 1,
-0.3075992, -0.4340174, -2.480439, 1, 1, 1, 1, 1,
-0.3064769, -0.4400471, -2.265479, 1, 1, 1, 1, 1,
-0.30494, -0.6767876, -1.543696, 1, 1, 1, 1, 1,
-0.3029309, 0.09194245, -0.4045392, 1, 1, 1, 1, 1,
-0.3017385, -0.1108231, -0.8342659, 1, 1, 1, 1, 1,
-0.2995619, -0.5907877, -4.197656, 1, 1, 1, 1, 1,
-0.2995194, 0.1594792, -1.076271, 1, 1, 1, 1, 1,
-0.2976748, -0.2143961, -1.792587, 1, 1, 1, 1, 1,
-0.2954596, -0.1974868, -3.192147, 1, 1, 1, 1, 1,
-0.291538, -0.1015464, -3.681885, 1, 1, 1, 1, 1,
-0.2834389, -1.660911, -2.842686, 0, 0, 1, 1, 1,
-0.2757424, -0.1062108, -0.6773437, 1, 0, 0, 1, 1,
-0.2752019, 0.3621064, 1.055116, 1, 0, 0, 1, 1,
-0.2664616, -0.07854772, -4.507965, 1, 0, 0, 1, 1,
-0.2630454, 0.3929316, -0.226084, 1, 0, 0, 1, 1,
-0.2615461, 0.5287673, -0.6786495, 1, 0, 0, 1, 1,
-0.2541909, 1.308426, 1.046164, 0, 0, 0, 1, 1,
-0.2506555, 1.243741, 2.524286, 0, 0, 0, 1, 1,
-0.2483073, 0.9960925, -0.1394115, 0, 0, 0, 1, 1,
-0.2481705, -0.3705156, -3.981143, 0, 0, 0, 1, 1,
-0.2481146, -0.1958764, -2.238011, 0, 0, 0, 1, 1,
-0.2476653, -0.7703454, -4.593427, 0, 0, 0, 1, 1,
-0.2457381, 2.000349, -0.8848061, 0, 0, 0, 1, 1,
-0.2455349, 0.194974, 0.2182683, 1, 1, 1, 1, 1,
-0.2449124, -0.9547492, -3.64115, 1, 1, 1, 1, 1,
-0.2436226, 0.2973302, -0.02083839, 1, 1, 1, 1, 1,
-0.2432815, -0.07420944, -1.365687, 1, 1, 1, 1, 1,
-0.2405364, -1.830447, -2.502212, 1, 1, 1, 1, 1,
-0.2348687, -0.9378012, -3.395101, 1, 1, 1, 1, 1,
-0.2344572, -1.17518, -3.304681, 1, 1, 1, 1, 1,
-0.2320464, 1.009325, 0.5540566, 1, 1, 1, 1, 1,
-0.2302649, 0.8543086, 0.2471915, 1, 1, 1, 1, 1,
-0.2293548, -2.824758, -2.916839, 1, 1, 1, 1, 1,
-0.226898, -1.492823, -3.539469, 1, 1, 1, 1, 1,
-0.2253262, -0.8801594, -3.287981, 1, 1, 1, 1, 1,
-0.223552, -0.422006, -5.717018, 1, 1, 1, 1, 1,
-0.2215075, -0.9389591, -4.353312, 1, 1, 1, 1, 1,
-0.2209851, 0.2088675, 0.5049474, 1, 1, 1, 1, 1,
-0.2169496, -1.894226, -4.37572, 0, 0, 1, 1, 1,
-0.2078168, -0.03465195, -2.847264, 1, 0, 0, 1, 1,
-0.2048917, -0.6939823, -4.480997, 1, 0, 0, 1, 1,
-0.2041796, -0.5117657, -3.996148, 1, 0, 0, 1, 1,
-0.2016542, 0.07471766, -1.850696, 1, 0, 0, 1, 1,
-0.2001151, -0.3139276, -1.821713, 1, 0, 0, 1, 1,
-0.1996509, -0.2510041, -2.746391, 0, 0, 0, 1, 1,
-0.1974273, 0.05464082, -0.6077698, 0, 0, 0, 1, 1,
-0.1903494, 0.6512355, -0.6399857, 0, 0, 0, 1, 1,
-0.1903446, 1.208279, -0.642188, 0, 0, 0, 1, 1,
-0.1888487, 0.09293456, -1.835609, 0, 0, 0, 1, 1,
-0.1883089, 0.1150478, -2.102247, 0, 0, 0, 1, 1,
-0.1879317, -0.731497, -2.114604, 0, 0, 0, 1, 1,
-0.1868223, 0.08747051, -1.062067, 1, 1, 1, 1, 1,
-0.1831263, -0.8084406, -4.24966, 1, 1, 1, 1, 1,
-0.1827814, 1.219732, 0.4906909, 1, 1, 1, 1, 1,
-0.1817229, 0.3501864, -0.3573529, 1, 1, 1, 1, 1,
-0.1783962, -1.090374, -2.564229, 1, 1, 1, 1, 1,
-0.1781195, 0.7224757, -0.02092626, 1, 1, 1, 1, 1,
-0.1766595, 0.5992464, -1.236621, 1, 1, 1, 1, 1,
-0.1745449, -1.350307, -2.823609, 1, 1, 1, 1, 1,
-0.1730389, 0.6317115, 0.7429464, 1, 1, 1, 1, 1,
-0.1723807, 0.8485628, -0.07076185, 1, 1, 1, 1, 1,
-0.1656414, -0.7727574, -2.779744, 1, 1, 1, 1, 1,
-0.162333, 1.259142, -0.7344034, 1, 1, 1, 1, 1,
-0.1617483, 1.433332, -0.5133112, 1, 1, 1, 1, 1,
-0.1594257, -1.273489, -2.879209, 1, 1, 1, 1, 1,
-0.157673, 2.532649, -1.482656, 1, 1, 1, 1, 1,
-0.1567152, -1.930423, -5.757238, 0, 0, 1, 1, 1,
-0.1502342, 1.191482, 0.08722293, 1, 0, 0, 1, 1,
-0.1459866, -0.8184335, -3.172299, 1, 0, 0, 1, 1,
-0.1456377, 0.4939278, -0.08746967, 1, 0, 0, 1, 1,
-0.1446503, -0.2559963, -4.058433, 1, 0, 0, 1, 1,
-0.133665, -1.799732, -2.945697, 1, 0, 0, 1, 1,
-0.130884, -0.214816, 0.3982717, 0, 0, 0, 1, 1,
-0.1302028, -2.682245, -5.125878, 0, 0, 0, 1, 1,
-0.1201816, -0.8359229, -2.898381, 0, 0, 0, 1, 1,
-0.1187603, -0.09548663, -1.584922, 0, 0, 0, 1, 1,
-0.1175273, 0.4011108, -0.3425009, 0, 0, 0, 1, 1,
-0.1158894, 2.110684, -0.8579772, 0, 0, 0, 1, 1,
-0.1143248, 0.09460394, -2.577065, 0, 0, 0, 1, 1,
-0.1094194, 0.8399824, -2.37193, 1, 1, 1, 1, 1,
-0.1042014, -0.7742687, -3.202982, 1, 1, 1, 1, 1,
-0.1038106, 1.311413, 2.169592, 1, 1, 1, 1, 1,
-0.1037234, -0.2365511, -2.8114, 1, 1, 1, 1, 1,
-0.102433, -0.9544351, -3.604389, 1, 1, 1, 1, 1,
-0.1013637, -0.2702041, -2.931619, 1, 1, 1, 1, 1,
-0.1013464, 1.012491, 0.1285422, 1, 1, 1, 1, 1,
-0.09332449, -0.7035086, -2.337681, 1, 1, 1, 1, 1,
-0.0895419, -0.4573042, -3.561572, 1, 1, 1, 1, 1,
-0.08586041, -0.3493123, -4.693727, 1, 1, 1, 1, 1,
-0.08572736, -0.9297216, -1.641406, 1, 1, 1, 1, 1,
-0.08253057, 0.9432553, -0.7779286, 1, 1, 1, 1, 1,
-0.08048348, -0.03527276, -1.806036, 1, 1, 1, 1, 1,
-0.08040238, -0.7459192, -2.896938, 1, 1, 1, 1, 1,
-0.07654755, -0.9499905, -3.940783, 1, 1, 1, 1, 1,
-0.07097093, 0.3160895, 1.01883, 0, 0, 1, 1, 1,
-0.07089362, -0.1883025, -2.998771, 1, 0, 0, 1, 1,
-0.06970029, -0.2597087, -2.894163, 1, 0, 0, 1, 1,
-0.06929156, 0.7372463, 2.517533, 1, 0, 0, 1, 1,
-0.06768689, -0.2036625, -3.122479, 1, 0, 0, 1, 1,
-0.06727161, -1.097834, -1.325337, 1, 0, 0, 1, 1,
-0.06433497, 0.5514644, -1.378877, 0, 0, 0, 1, 1,
-0.06404587, 0.4097343, 0.6978475, 0, 0, 0, 1, 1,
-0.06223671, -0.1503551, -3.091191, 0, 0, 0, 1, 1,
-0.06108915, 0.892934, -0.3734161, 0, 0, 0, 1, 1,
-0.0533214, 0.5685357, -1.565778, 0, 0, 0, 1, 1,
-0.05227184, 0.3450026, -0.4208753, 0, 0, 0, 1, 1,
-0.05005417, -1.018204, -2.532746, 0, 0, 0, 1, 1,
-0.04990797, 1.615585, -0.4265723, 1, 1, 1, 1, 1,
-0.04573921, 0.7710445, -0.4467699, 1, 1, 1, 1, 1,
-0.04475788, 1.614618, -0.3089893, 1, 1, 1, 1, 1,
-0.04307714, 0.9668667, 0.4899569, 1, 1, 1, 1, 1,
-0.03947037, 0.03621648, 0.1207084, 1, 1, 1, 1, 1,
-0.03893477, -0.6644868, -2.695044, 1, 1, 1, 1, 1,
-0.03256689, 1.201206, 0.2299708, 1, 1, 1, 1, 1,
-0.02692225, 1.530839, 0.7558455, 1, 1, 1, 1, 1,
-0.02427471, -0.5658533, -2.933151, 1, 1, 1, 1, 1,
-0.01355093, 1.334525, 0.5704477, 1, 1, 1, 1, 1,
-0.0124019, -0.8622747, -3.716472, 1, 1, 1, 1, 1,
-0.01228498, 1.334386, -1.00745, 1, 1, 1, 1, 1,
-0.01206967, 0.2054039, -1.497373, 1, 1, 1, 1, 1,
-0.006600759, 0.5189119, -0.8379681, 1, 1, 1, 1, 1,
-0.004373167, 0.2750853, 1.00284, 1, 1, 1, 1, 1,
-0.004216525, -0.1642373, -3.141279, 0, 0, 1, 1, 1,
0.0008318704, -0.8369024, 2.51035, 1, 0, 0, 1, 1,
0.002160286, 0.02823637, 0.5597783, 1, 0, 0, 1, 1,
0.004413302, -0.09785611, 2.798801, 1, 0, 0, 1, 1,
0.01019385, 2.022413, -0.1268467, 1, 0, 0, 1, 1,
0.01101082, 1.795246, -0.3018034, 1, 0, 0, 1, 1,
0.01530561, 0.4376074, 0.6457426, 0, 0, 0, 1, 1,
0.01839817, 1.061936, -0.828172, 0, 0, 0, 1, 1,
0.02068896, -0.8663002, 3.698887, 0, 0, 0, 1, 1,
0.02164913, 1.269539, 0.387906, 0, 0, 0, 1, 1,
0.02328276, 0.2009263, 0.812887, 0, 0, 0, 1, 1,
0.02409985, 0.583603, -1.027636, 0, 0, 0, 1, 1,
0.02786245, -1.24869, 2.733766, 0, 0, 0, 1, 1,
0.02825401, -1.057983, 2.755545, 1, 1, 1, 1, 1,
0.02841954, -0.9508706, 2.441738, 1, 1, 1, 1, 1,
0.03227599, -0.06260574, 2.716228, 1, 1, 1, 1, 1,
0.0342228, 0.3030654, 1.576699, 1, 1, 1, 1, 1,
0.03458881, 1.186586, -0.6474293, 1, 1, 1, 1, 1,
0.04415544, -0.4713255, 4.315733, 1, 1, 1, 1, 1,
0.05244919, -0.5397566, 3.71009, 1, 1, 1, 1, 1,
0.05666634, -0.322929, 2.095548, 1, 1, 1, 1, 1,
0.0594145, 0.7192699, 1.266292, 1, 1, 1, 1, 1,
0.07048196, 0.07940833, 1.205569, 1, 1, 1, 1, 1,
0.07414518, 1.013877, 0.4128681, 1, 1, 1, 1, 1,
0.0772245, 0.109599, -0.1955506, 1, 1, 1, 1, 1,
0.0777297, -0.2657729, 4.1774, 1, 1, 1, 1, 1,
0.08134519, -0.3788654, 2.176236, 1, 1, 1, 1, 1,
0.08290591, 0.471898, -1.014138, 1, 1, 1, 1, 1,
0.08816236, -1.99801, 2.010391, 0, 0, 1, 1, 1,
0.08851594, -1.342217, 3.784888, 1, 0, 0, 1, 1,
0.09054234, 0.7168751, -0.2138873, 1, 0, 0, 1, 1,
0.09412939, -1.820064, 2.268605, 1, 0, 0, 1, 1,
0.09472063, 0.8724917, 1.0508, 1, 0, 0, 1, 1,
0.09555242, 0.4174566, 2.42782, 1, 0, 0, 1, 1,
0.09700844, -2.096221, 2.793497, 0, 0, 0, 1, 1,
0.0975074, -1.192688, 3.046471, 0, 0, 0, 1, 1,
0.100772, -0.005167609, 2.099091, 0, 0, 0, 1, 1,
0.1014148, 0.3258016, 0.09726863, 0, 0, 0, 1, 1,
0.101439, -0.08516311, 2.250344, 0, 0, 0, 1, 1,
0.1054335, 0.5081601, 0.3587219, 0, 0, 0, 1, 1,
0.1060053, -0.8999422, 4.104989, 0, 0, 0, 1, 1,
0.1067682, -0.5720054, 2.986648, 1, 1, 1, 1, 1,
0.1084568, 2.119028, -0.140731, 1, 1, 1, 1, 1,
0.1114092, -1.868864, 3.154582, 1, 1, 1, 1, 1,
0.1127981, 2.297401, -0.6834043, 1, 1, 1, 1, 1,
0.1161646, 0.3197711, -0.4142114, 1, 1, 1, 1, 1,
0.1173435, 0.5949433, 1.878943, 1, 1, 1, 1, 1,
0.1215858, -0.7686684, 3.556265, 1, 1, 1, 1, 1,
0.1227012, 0.9536301, -0.8623948, 1, 1, 1, 1, 1,
0.1241591, -0.2012843, 1.851924, 1, 1, 1, 1, 1,
0.1290568, 0.7238072, -0.6606808, 1, 1, 1, 1, 1,
0.1302152, 0.3731417, -0.3070717, 1, 1, 1, 1, 1,
0.1357128, -0.1349721, 1.069799, 1, 1, 1, 1, 1,
0.1403007, -1.932593, 1.895746, 1, 1, 1, 1, 1,
0.1403107, -0.4223973, 3.460262, 1, 1, 1, 1, 1,
0.140333, -1.083685, 3.485271, 1, 1, 1, 1, 1,
0.1408796, -0.948478, 2.547589, 0, 0, 1, 1, 1,
0.1409149, 1.013816, 0.1231836, 1, 0, 0, 1, 1,
0.1411956, 0.292755, 0.4716626, 1, 0, 0, 1, 1,
0.1417484, -0.3226041, 4.310562, 1, 0, 0, 1, 1,
0.142516, -1.330445, 2.979187, 1, 0, 0, 1, 1,
0.1466377, 0.2409749, 2.967563, 1, 0, 0, 1, 1,
0.1511529, -0.2452306, 2.169306, 0, 0, 0, 1, 1,
0.15245, -0.9693063, 1.362563, 0, 0, 0, 1, 1,
0.1549336, 0.6120535, 0.3953671, 0, 0, 0, 1, 1,
0.1550213, -0.4408661, 2.182482, 0, 0, 0, 1, 1,
0.1569164, 1.192822, -3.148949, 0, 0, 0, 1, 1,
0.1606991, -1.337614, 1.902604, 0, 0, 0, 1, 1,
0.160777, -1.852853, 3.034511, 0, 0, 0, 1, 1,
0.1617343, 0.008033994, 2.300689, 1, 1, 1, 1, 1,
0.1623939, -0.3725083, 3.203628, 1, 1, 1, 1, 1,
0.1684291, 0.1223111, 1.13622, 1, 1, 1, 1, 1,
0.1687537, 1.009521, 0.1611831, 1, 1, 1, 1, 1,
0.1811547, -0.4040358, 4.589154, 1, 1, 1, 1, 1,
0.1822029, -0.948389, 3.810135, 1, 1, 1, 1, 1,
0.1841558, 0.9027283, -1.913472, 1, 1, 1, 1, 1,
0.1878952, 0.5162131, -1.311389, 1, 1, 1, 1, 1,
0.1891311, 0.6742582, -0.883351, 1, 1, 1, 1, 1,
0.1954181, -0.9950333, 5.111034, 1, 1, 1, 1, 1,
0.1997365, -0.9229282, 3.115548, 1, 1, 1, 1, 1,
0.2013021, -0.205425, 2.256901, 1, 1, 1, 1, 1,
0.2041806, 0.04777243, 2.545281, 1, 1, 1, 1, 1,
0.205991, 0.09628344, 4.175617, 1, 1, 1, 1, 1,
0.2065625, 0.2475868, 0.5504811, 1, 1, 1, 1, 1,
0.2084716, -0.4294064, 2.069907, 0, 0, 1, 1, 1,
0.2086443, -1.224256, 3.239567, 1, 0, 0, 1, 1,
0.2104772, -0.02388394, 0.941949, 1, 0, 0, 1, 1,
0.212465, -1.05061, 2.95996, 1, 0, 0, 1, 1,
0.2149251, -1.67123, 1.682989, 1, 0, 0, 1, 1,
0.2182418, -0.5160724, 2.897105, 1, 0, 0, 1, 1,
0.2197786, -1.382731, 0.4498395, 0, 0, 0, 1, 1,
0.2217817, -0.5148804, 2.198365, 0, 0, 0, 1, 1,
0.2218948, -1.307008, 3.372924, 0, 0, 0, 1, 1,
0.2257559, 0.444112, -0.1367113, 0, 0, 0, 1, 1,
0.2278391, 1.145415, 1.68077, 0, 0, 0, 1, 1,
0.2321449, -1.909436, 2.064709, 0, 0, 0, 1, 1,
0.2326934, 0.1119632, 1.170889, 0, 0, 0, 1, 1,
0.2330856, 1.624417, -0.6984787, 1, 1, 1, 1, 1,
0.2385208, -0.5000436, 3.006012, 1, 1, 1, 1, 1,
0.2385541, -1.934642, 3.259346, 1, 1, 1, 1, 1,
0.2400568, -0.9835817, 3.951108, 1, 1, 1, 1, 1,
0.2415617, -1.385513, 2.89522, 1, 1, 1, 1, 1,
0.2447995, 0.1672041, -0.4109224, 1, 1, 1, 1, 1,
0.245413, -0.9108982, 2.773967, 1, 1, 1, 1, 1,
0.245578, -0.6248475, 3.033738, 1, 1, 1, 1, 1,
0.2477267, -0.08607534, 1.686038, 1, 1, 1, 1, 1,
0.2545596, 1.41609, -0.5639898, 1, 1, 1, 1, 1,
0.2608088, -0.4405646, 1.004607, 1, 1, 1, 1, 1,
0.2682168, 0.5864477, 1.811087, 1, 1, 1, 1, 1,
0.2704309, 0.7339508, 0.9166749, 1, 1, 1, 1, 1,
0.2728472, -0.9810997, 4.316835, 1, 1, 1, 1, 1,
0.2736974, 0.2505324, 2.111123, 1, 1, 1, 1, 1,
0.2781366, -0.3950752, 3.128114, 0, 0, 1, 1, 1,
0.279461, -1.084382, 2.273858, 1, 0, 0, 1, 1,
0.2810482, -0.3818389, 3.201766, 1, 0, 0, 1, 1,
0.2810843, -0.9091838, 2.406605, 1, 0, 0, 1, 1,
0.2827233, -0.4496217, 2.188236, 1, 0, 0, 1, 1,
0.285193, 0.8007445, 0.6667558, 1, 0, 0, 1, 1,
0.2878148, -0.6313232, 1.72178, 0, 0, 0, 1, 1,
0.2887546, -1.40042, 2.530152, 0, 0, 0, 1, 1,
0.2893615, 0.1869416, 0.2629257, 0, 0, 0, 1, 1,
0.2931373, -1.569126, 4.026031, 0, 0, 0, 1, 1,
0.2985617, -0.4357896, 2.461654, 0, 0, 0, 1, 1,
0.2986462, 1.428638, -1.202543, 0, 0, 0, 1, 1,
0.2996866, 0.4317375, 0.5567803, 0, 0, 0, 1, 1,
0.3013066, 0.7636471, 2.010307, 1, 1, 1, 1, 1,
0.3035885, -0.1169521, 0.4460692, 1, 1, 1, 1, 1,
0.3046878, -0.9352652, 1.02948, 1, 1, 1, 1, 1,
0.3084527, -0.06341077, 0.6495744, 1, 1, 1, 1, 1,
0.3099644, -0.6341113, 4.977516, 1, 1, 1, 1, 1,
0.310348, -0.9218977, 3.63022, 1, 1, 1, 1, 1,
0.3140371, -0.2331047, 2.908913, 1, 1, 1, 1, 1,
0.3160227, -0.2246455, 2.126693, 1, 1, 1, 1, 1,
0.3175936, -0.5077763, 3.38024, 1, 1, 1, 1, 1,
0.3220278, 0.07141054, 0.01288289, 1, 1, 1, 1, 1,
0.3293058, -0.027538, 1.345673, 1, 1, 1, 1, 1,
0.3392693, 0.03493696, -0.2468287, 1, 1, 1, 1, 1,
0.3437584, -0.1841453, 1.449647, 1, 1, 1, 1, 1,
0.3445985, -1.526161, 3.106156, 1, 1, 1, 1, 1,
0.3446364, 0.6574978, -0.9453903, 1, 1, 1, 1, 1,
0.3533787, -0.04161762, 2.092001, 0, 0, 1, 1, 1,
0.3557984, -0.9440315, 4.157339, 1, 0, 0, 1, 1,
0.3586431, -0.5615588, 1.77441, 1, 0, 0, 1, 1,
0.3608294, 0.3818815, 2.742301, 1, 0, 0, 1, 1,
0.3630685, -0.6939574, 1.427977, 1, 0, 0, 1, 1,
0.3642156, -0.1812688, 1.006582, 1, 0, 0, 1, 1,
0.3643499, -1.453644, 1.297709, 0, 0, 0, 1, 1,
0.3658686, 0.5309932, 0.08660088, 0, 0, 0, 1, 1,
0.3668076, 0.6038402, 1.733395, 0, 0, 0, 1, 1,
0.3693981, -0.05048741, 1.454808, 0, 0, 0, 1, 1,
0.3711181, -0.8682072, 4.121029, 0, 0, 0, 1, 1,
0.3718768, 1.411821, 0.5729436, 0, 0, 0, 1, 1,
0.3778781, 0.8197445, 1.094295, 0, 0, 0, 1, 1,
0.3788146, 0.9983449, 0.7223226, 1, 1, 1, 1, 1,
0.380322, 0.5701587, 1.541207, 1, 1, 1, 1, 1,
0.3805807, -0.877196, 1.674696, 1, 1, 1, 1, 1,
0.3813598, 1.282103, 0.7728404, 1, 1, 1, 1, 1,
0.3818268, 0.5991609, 0.4931831, 1, 1, 1, 1, 1,
0.3829881, -0.4507053, 4.188311, 1, 1, 1, 1, 1,
0.3852137, 0.2185957, 0.3683915, 1, 1, 1, 1, 1,
0.3858025, 0.6481164, -0.06793143, 1, 1, 1, 1, 1,
0.3876424, 1.350464, 0.360187, 1, 1, 1, 1, 1,
0.3913784, -0.5485001, 2.018094, 1, 1, 1, 1, 1,
0.391613, 0.7849732, 0.2750067, 1, 1, 1, 1, 1,
0.3946487, -0.3206372, 3.657681, 1, 1, 1, 1, 1,
0.3950261, 0.655499, 1.839614, 1, 1, 1, 1, 1,
0.3982928, 0.2398664, 0.6387938, 1, 1, 1, 1, 1,
0.3983695, -1.972632, 2.793798, 1, 1, 1, 1, 1,
0.4070627, -1.394593, 2.86096, 0, 0, 1, 1, 1,
0.409244, 1.30941, 0.1351952, 1, 0, 0, 1, 1,
0.4113073, 0.6039131, 0.7928194, 1, 0, 0, 1, 1,
0.4114586, 1.246415, -1.142599, 1, 0, 0, 1, 1,
0.4247701, -0.0754943, 1.054452, 1, 0, 0, 1, 1,
0.4282024, -0.1207042, 1.874766, 1, 0, 0, 1, 1,
0.4285813, 0.4574032, 1.297832, 0, 0, 0, 1, 1,
0.4319589, 0.1924786, 1.810955, 0, 0, 0, 1, 1,
0.4340816, 0.01026655, 2.386055, 0, 0, 0, 1, 1,
0.4365049, 1.476491, 0.9486015, 0, 0, 0, 1, 1,
0.4409721, 0.8526557, 1.143944, 0, 0, 0, 1, 1,
0.4425813, -1.024236, 2.244417, 0, 0, 0, 1, 1,
0.44395, 1.541604, 1.815829, 0, 0, 0, 1, 1,
0.4489698, 0.3181726, 0.4344372, 1, 1, 1, 1, 1,
0.4506116, 0.8100353, -1.798942, 1, 1, 1, 1, 1,
0.4517131, 0.06732573, 0.339543, 1, 1, 1, 1, 1,
0.4577393, -0.8009931, 1.85776, 1, 1, 1, 1, 1,
0.4592704, 0.9560869, 1.946234, 1, 1, 1, 1, 1,
0.4623439, 1.870858, 0.9340774, 1, 1, 1, 1, 1,
0.4640441, -0.2788985, 1.529609, 1, 1, 1, 1, 1,
0.4665785, -0.8367152, 1.309452, 1, 1, 1, 1, 1,
0.4733733, -1.500792, 3.042377, 1, 1, 1, 1, 1,
0.4763612, -0.3652613, 2.785898, 1, 1, 1, 1, 1,
0.4811234, 0.4766057, 1.359017, 1, 1, 1, 1, 1,
0.4816397, -0.9423631, 0.2445842, 1, 1, 1, 1, 1,
0.4962659, 0.6151356, 1.08922, 1, 1, 1, 1, 1,
0.4965155, 2.142172, 0.4361503, 1, 1, 1, 1, 1,
0.5050457, 0.3331084, 1.341823, 1, 1, 1, 1, 1,
0.508029, -0.2708271, 2.493018, 0, 0, 1, 1, 1,
0.5080992, 1.497331, 0.7395142, 1, 0, 0, 1, 1,
0.5098614, -1.135842, 2.812185, 1, 0, 0, 1, 1,
0.5110345, 0.1325756, 3.114512, 1, 0, 0, 1, 1,
0.5116136, 0.8482593, 0.6491603, 1, 0, 0, 1, 1,
0.5142555, -1.094005, 4.243716, 1, 0, 0, 1, 1,
0.528267, 0.3034594, 1.8806, 0, 0, 0, 1, 1,
0.5310348, -1.063347, 1.533026, 0, 0, 0, 1, 1,
0.5360842, 1.373164, 0.3153324, 0, 0, 0, 1, 1,
0.5366055, -0.4923274, 0.2512757, 0, 0, 0, 1, 1,
0.5371716, -1.351351, 2.321286, 0, 0, 0, 1, 1,
0.5407249, 0.6304029, 1.171726, 0, 0, 0, 1, 1,
0.5413871, 0.5124974, -0.8430439, 0, 0, 0, 1, 1,
0.5419534, -1.178753, 1.813033, 1, 1, 1, 1, 1,
0.5425014, 0.2312237, 1.515676, 1, 1, 1, 1, 1,
0.5435244, 0.1296618, 3.3854, 1, 1, 1, 1, 1,
0.5491797, 1.31389, 1.518054, 1, 1, 1, 1, 1,
0.5511708, -1.433499, 3.211404, 1, 1, 1, 1, 1,
0.5529765, 0.008586897, 0.8107224, 1, 1, 1, 1, 1,
0.5557264, 0.4022676, 0.8341264, 1, 1, 1, 1, 1,
0.5562652, -1.087005, 2.174425, 1, 1, 1, 1, 1,
0.5573636, 0.1156823, -0.0116142, 1, 1, 1, 1, 1,
0.557365, 0.183205, 1.306542, 1, 1, 1, 1, 1,
0.5599824, 0.3632383, -0.09160462, 1, 1, 1, 1, 1,
0.5635287, -0.07706555, -0.03847596, 1, 1, 1, 1, 1,
0.5766392, -0.01899237, 3.282278, 1, 1, 1, 1, 1,
0.57711, -1.224434, 0.4864942, 1, 1, 1, 1, 1,
0.5819558, -0.3392935, 1.270592, 1, 1, 1, 1, 1,
0.583358, -0.9042295, 1.726741, 0, 0, 1, 1, 1,
0.5840395, -0.1191367, 2.687983, 1, 0, 0, 1, 1,
0.585141, -0.4572787, 5.426991, 1, 0, 0, 1, 1,
0.5881119, -0.8404704, 2.174471, 1, 0, 0, 1, 1,
0.5941027, 0.9817306, -2.065181, 1, 0, 0, 1, 1,
0.5969786, 0.8848802, -1.144844, 1, 0, 0, 1, 1,
0.5989174, -0.63146, 3.358256, 0, 0, 0, 1, 1,
0.5993106, 0.7836156, -0.04642007, 0, 0, 0, 1, 1,
0.6045223, -0.1352727, 2.729528, 0, 0, 0, 1, 1,
0.6047943, -0.07437599, -0.1350961, 0, 0, 0, 1, 1,
0.6077313, 1.810481, 0.3929822, 0, 0, 0, 1, 1,
0.6080493, -0.8445842, 2.723973, 0, 0, 0, 1, 1,
0.6111636, -0.1791989, 2.874255, 0, 0, 0, 1, 1,
0.6127171, 0.1909281, 2.022646, 1, 1, 1, 1, 1,
0.6129143, -0.9206229, 1.730864, 1, 1, 1, 1, 1,
0.6160555, 0.1929182, 2.442676, 1, 1, 1, 1, 1,
0.6184927, 0.2568452, 2.867183, 1, 1, 1, 1, 1,
0.620497, -0.8026983, 1.896781, 1, 1, 1, 1, 1,
0.6246302, 1.394238, -0.1778102, 1, 1, 1, 1, 1,
0.6257012, 0.3010443, 1.694765, 1, 1, 1, 1, 1,
0.6352422, 1.417483, -0.2601995, 1, 1, 1, 1, 1,
0.641631, 0.9182432, -0.7509791, 1, 1, 1, 1, 1,
0.6422303, 0.5223602, -0.179136, 1, 1, 1, 1, 1,
0.6604975, 0.6509883, 0.8949028, 1, 1, 1, 1, 1,
0.6608095, 0.1158173, -0.2676363, 1, 1, 1, 1, 1,
0.6617991, -0.6332454, 1.842068, 1, 1, 1, 1, 1,
0.6652662, 0.04301089, 2.032972, 1, 1, 1, 1, 1,
0.6690209, -0.1141016, 2.360462, 1, 1, 1, 1, 1,
0.6690279, 1.090336, 1.760145, 0, 0, 1, 1, 1,
0.6693169, -0.5980412, 2.648337, 1, 0, 0, 1, 1,
0.6745508, 0.06596752, 0.5732385, 1, 0, 0, 1, 1,
0.6760157, 0.333971, 2.020117, 1, 0, 0, 1, 1,
0.6773556, 0.4808228, -0.4517176, 1, 0, 0, 1, 1,
0.6834168, 0.9254309, 0.6258489, 1, 0, 0, 1, 1,
0.6851868, 0.8306749, -0.4316649, 0, 0, 0, 1, 1,
0.6863618, -1.418898, 3.358202, 0, 0, 0, 1, 1,
0.6898344, -0.8293692, 0.9791058, 0, 0, 0, 1, 1,
0.6914873, 0.8522146, 0.8728796, 0, 0, 0, 1, 1,
0.6942658, 1.502468, 0.5998029, 0, 0, 0, 1, 1,
0.6961107, 1.006583, 0.5289749, 0, 0, 0, 1, 1,
0.6970137, -0.4848218, 3.054396, 0, 0, 0, 1, 1,
0.7102126, -0.9796264, 2.350912, 1, 1, 1, 1, 1,
0.7102219, -1.288235, 2.789307, 1, 1, 1, 1, 1,
0.7120861, 0.5427395, -0.415123, 1, 1, 1, 1, 1,
0.7122328, -0.2709941, 0.9823703, 1, 1, 1, 1, 1,
0.7151385, 0.006422862, 2.195413, 1, 1, 1, 1, 1,
0.7155269, -1.20817, 1.744626, 1, 1, 1, 1, 1,
0.7306103, -0.3601209, 2.876644, 1, 1, 1, 1, 1,
0.7313884, 1.193225, -0.1855869, 1, 1, 1, 1, 1,
0.7378101, -1.215356, 4.861265, 1, 1, 1, 1, 1,
0.7392911, 1.311176, -0.1506899, 1, 1, 1, 1, 1,
0.7457948, -0.4833899, 2.910675, 1, 1, 1, 1, 1,
0.7473484, -0.2809492, 2.239489, 1, 1, 1, 1, 1,
0.7476256, -0.4583718, 2.099821, 1, 1, 1, 1, 1,
0.7503228, -0.1378335, 3.247714, 1, 1, 1, 1, 1,
0.7503896, 1.649022, 0.633185, 1, 1, 1, 1, 1,
0.7600701, -1.068753, 3.456863, 0, 0, 1, 1, 1,
0.7610078, -0.6041464, 2.610509, 1, 0, 0, 1, 1,
0.7647977, -1.199726, 1.797265, 1, 0, 0, 1, 1,
0.7671669, 1.638309, -0.4569045, 1, 0, 0, 1, 1,
0.7682565, -0.3191356, 2.419023, 1, 0, 0, 1, 1,
0.7722215, -0.9374242, 2.734523, 1, 0, 0, 1, 1,
0.7779058, 0.4532396, 2.210023, 0, 0, 0, 1, 1,
0.7779483, 0.2531521, 0.3398887, 0, 0, 0, 1, 1,
0.7799684, -1.060126, 1.810989, 0, 0, 0, 1, 1,
0.7871131, -0.7991074, 3.664832, 0, 0, 0, 1, 1,
0.7876745, -1.059461, 2.585041, 0, 0, 0, 1, 1,
0.7883064, 0.3449967, 3.255249, 0, 0, 0, 1, 1,
0.7891009, 1.023196, 2.088562, 0, 0, 0, 1, 1,
0.7951462, -0.5570502, 0.7982612, 1, 1, 1, 1, 1,
0.8044332, -0.5129802, 1.401883, 1, 1, 1, 1, 1,
0.8059022, -1.45134, 2.949693, 1, 1, 1, 1, 1,
0.8070841, -1.081357, 0.09138622, 1, 1, 1, 1, 1,
0.8070931, -1.172808, 4.291101, 1, 1, 1, 1, 1,
0.8101354, 1.091796, -0.496746, 1, 1, 1, 1, 1,
0.8116995, 0.269953, 1.494851, 1, 1, 1, 1, 1,
0.8141515, 0.08284601, 2.684474, 1, 1, 1, 1, 1,
0.8146024, -1.040313, 1.895028, 1, 1, 1, 1, 1,
0.8169723, -1.814546, 2.411565, 1, 1, 1, 1, 1,
0.8173524, 2.088332, -0.6675442, 1, 1, 1, 1, 1,
0.8211086, 0.4499634, 1.178888, 1, 1, 1, 1, 1,
0.8381215, -1.160955, 2.144207, 1, 1, 1, 1, 1,
0.8422508, 0.4666564, 1.420654, 1, 1, 1, 1, 1,
0.844678, -0.7860408, 2.681706, 1, 1, 1, 1, 1,
0.8474367, 0.7693748, 0.626206, 0, 0, 1, 1, 1,
0.8479218, -0.4861174, 0.5701905, 1, 0, 0, 1, 1,
0.8481247, -1.924526, 3.345734, 1, 0, 0, 1, 1,
0.8509794, -3.042968, 1.405148, 1, 0, 0, 1, 1,
0.8574976, 0.2507515, 1.280132, 1, 0, 0, 1, 1,
0.8610443, -0.8530204, 3.545776, 1, 0, 0, 1, 1,
0.8642431, -2.116909, 2.383177, 0, 0, 0, 1, 1,
0.8659087, 0.1476192, 0.6686852, 0, 0, 0, 1, 1,
0.8665907, 0.7797056, -1.041268, 0, 0, 0, 1, 1,
0.8692875, -0.487312, 3.332752, 0, 0, 0, 1, 1,
0.8704774, -0.24592, -0.1073774, 0, 0, 0, 1, 1,
0.8751162, 2.144591, 1.110804, 0, 0, 0, 1, 1,
0.8773456, -0.4244567, 3.013463, 0, 0, 0, 1, 1,
0.8822942, -0.1935094, 1.324995, 1, 1, 1, 1, 1,
0.8834086, 0.9619282, -0.9317735, 1, 1, 1, 1, 1,
0.886026, -0.04573227, -0.2998358, 1, 1, 1, 1, 1,
0.8866397, -0.7190754, 2.136405, 1, 1, 1, 1, 1,
0.8930198, -0.895618, 2.591162, 1, 1, 1, 1, 1,
0.8937198, -0.7608888, 3.26404, 1, 1, 1, 1, 1,
0.8965405, 0.1392663, 2.601779, 1, 1, 1, 1, 1,
0.8970656, -0.5382602, 3.269831, 1, 1, 1, 1, 1,
0.8974808, 1.194764, 0.3071218, 1, 1, 1, 1, 1,
0.9102294, 0.1842111, 1.446855, 1, 1, 1, 1, 1,
0.9120103, 0.7483965, 1.242947, 1, 1, 1, 1, 1,
0.9165374, 0.3011062, -0.300001, 1, 1, 1, 1, 1,
0.918842, -1.762909, 2.694811, 1, 1, 1, 1, 1,
0.9224481, 0.2360679, 2.266854, 1, 1, 1, 1, 1,
0.9224606, 1.575655, 0.5345274, 1, 1, 1, 1, 1,
0.9265491, 0.7723877, 1.076436, 0, 0, 1, 1, 1,
0.9310383, 0.5109952, 0.6603507, 1, 0, 0, 1, 1,
0.9329076, 0.2734243, 2.889847, 1, 0, 0, 1, 1,
0.9425017, -1.021602, 3.36059, 1, 0, 0, 1, 1,
0.9443015, -0.2407767, 1.989556, 1, 0, 0, 1, 1,
0.9473861, 0.697517, 0.6042095, 1, 0, 0, 1, 1,
0.961912, -0.4455917, 2.177327, 0, 0, 0, 1, 1,
0.9639518, 0.5781845, -0.2663078, 0, 0, 0, 1, 1,
0.9649064, 1.968156, 0.39101, 0, 0, 0, 1, 1,
0.9707937, 1.638418, 0.07793885, 0, 0, 0, 1, 1,
0.9772716, 0.03770941, 1.780333, 0, 0, 0, 1, 1,
0.9780031, 0.3612135, 1.628678, 0, 0, 0, 1, 1,
0.9921679, 0.6262414, 0.9762384, 0, 0, 0, 1, 1,
0.9923146, 0.8169845, 2.311888, 1, 1, 1, 1, 1,
0.996489, -1.360695, 1.800339, 1, 1, 1, 1, 1,
1.010675, 0.1841331, 1.29193, 1, 1, 1, 1, 1,
1.014642, -0.7143204, 3.012398, 1, 1, 1, 1, 1,
1.015356, 0.01505601, 1.290375, 1, 1, 1, 1, 1,
1.016392, -0.9888416, 2.679832, 1, 1, 1, 1, 1,
1.021882, -0.8366358, 3.789744, 1, 1, 1, 1, 1,
1.035849, -0.3388143, 2.241573, 1, 1, 1, 1, 1,
1.037245, 1.478571, 0.5403553, 1, 1, 1, 1, 1,
1.038495, -1.055996, 4.018084, 1, 1, 1, 1, 1,
1.039035, -1.008619, 2.911329, 1, 1, 1, 1, 1,
1.040943, -0.7315263, 1.259068, 1, 1, 1, 1, 1,
1.043079, 0.9676551, 1.195965, 1, 1, 1, 1, 1,
1.04588, 0.3420548, 1.194353, 1, 1, 1, 1, 1,
1.052888, -0.3084663, 3.117023, 1, 1, 1, 1, 1,
1.058269, 1.19691, 1.163489, 0, 0, 1, 1, 1,
1.062201, 0.3919489, 0.2385953, 1, 0, 0, 1, 1,
1.063547, -0.1277368, 3.540745, 1, 0, 0, 1, 1,
1.065232, 0.1217545, 0.9862943, 1, 0, 0, 1, 1,
1.068607, 0.3651973, -1.208124, 1, 0, 0, 1, 1,
1.068926, 0.3120838, 1.816861, 1, 0, 0, 1, 1,
1.071527, -0.4464851, 1.681862, 0, 0, 0, 1, 1,
1.073096, -0.15669, 0.731671, 0, 0, 0, 1, 1,
1.078818, -1.321994, 1.964356, 0, 0, 0, 1, 1,
1.083129, -0.8489583, 1.004625, 0, 0, 0, 1, 1,
1.083475, 0.7360356, 1.278362, 0, 0, 0, 1, 1,
1.083491, -0.5866828, 3.122753, 0, 0, 0, 1, 1,
1.095317, 0.3274658, 1.855048, 0, 0, 0, 1, 1,
1.106012, -0.2218248, 2.342384, 1, 1, 1, 1, 1,
1.106728, 0.1611543, -0.4441753, 1, 1, 1, 1, 1,
1.111768, 0.1714832, 3.088234, 1, 1, 1, 1, 1,
1.112745, -1.127334, 1.738205, 1, 1, 1, 1, 1,
1.118061, -1.987012, 1.706169, 1, 1, 1, 1, 1,
1.119202, -0.6950248, 1.783234, 1, 1, 1, 1, 1,
1.123524, -0.6694828, 1.138872, 1, 1, 1, 1, 1,
1.128121, -0.04660181, 3.37387, 1, 1, 1, 1, 1,
1.138832, 0.6734059, 1.100413, 1, 1, 1, 1, 1,
1.139021, -0.08752248, 1.442127, 1, 1, 1, 1, 1,
1.149898, -0.1458355, 2.846508, 1, 1, 1, 1, 1,
1.152934, 2.107066, -0.3763683, 1, 1, 1, 1, 1,
1.15483, 0.719689, -0.4583569, 1, 1, 1, 1, 1,
1.158893, -0.7889488, 2.77191, 1, 1, 1, 1, 1,
1.162742, -0.6196881, 3.131706, 1, 1, 1, 1, 1,
1.164902, -0.8325082, 1.479156, 0, 0, 1, 1, 1,
1.169632, -0.3926264, 1.342027, 1, 0, 0, 1, 1,
1.171512, -0.5745443, 1.195906, 1, 0, 0, 1, 1,
1.172636, 0.3768146, 1.90111, 1, 0, 0, 1, 1,
1.173392, -1.379253, 0.8529524, 1, 0, 0, 1, 1,
1.184867, 0.2590992, 1.686306, 1, 0, 0, 1, 1,
1.185862, -1.192431, 3.142645, 0, 0, 0, 1, 1,
1.186851, -0.3401366, 2.819316, 0, 0, 0, 1, 1,
1.187851, 0.637657, 0.4544851, 0, 0, 0, 1, 1,
1.196662, 0.7942908, 1.619258, 0, 0, 0, 1, 1,
1.197733, 0.6443691, 1.166476, 0, 0, 0, 1, 1,
1.20031, 0.8756757, 0.7444112, 0, 0, 0, 1, 1,
1.201204, -1.548939, 2.163371, 0, 0, 0, 1, 1,
1.208492, 0.9384058, 1.132485, 1, 1, 1, 1, 1,
1.208749, 1.209012, 0.8272719, 1, 1, 1, 1, 1,
1.216678, -1.133166, 1.187274, 1, 1, 1, 1, 1,
1.23285, -0.4935125, 2.83937, 1, 1, 1, 1, 1,
1.234172, -0.6897331, 1.334315, 1, 1, 1, 1, 1,
1.25348, -0.2975112, 2.42708, 1, 1, 1, 1, 1,
1.271765, 2.122526, -0.006877806, 1, 1, 1, 1, 1,
1.275393, -0.5613014, 0.8591566, 1, 1, 1, 1, 1,
1.278535, -0.9991761, 1.314527, 1, 1, 1, 1, 1,
1.278609, -1.289186, 0.9414654, 1, 1, 1, 1, 1,
1.284605, -0.006994217, 1.522713, 1, 1, 1, 1, 1,
1.285291, 0.4001376, 3.187648, 1, 1, 1, 1, 1,
1.286145, 1.967544, 0.1203984, 1, 1, 1, 1, 1,
1.286965, -1.652705, 2.309209, 1, 1, 1, 1, 1,
1.296236, 0.4494886, 0.2329613, 1, 1, 1, 1, 1,
1.298338, -0.7176502, 3.008379, 0, 0, 1, 1, 1,
1.302696, 0.1676278, 0.9953621, 1, 0, 0, 1, 1,
1.30398, 0.9558376, 1.64362, 1, 0, 0, 1, 1,
1.311985, 1.401066, 0.3248297, 1, 0, 0, 1, 1,
1.312976, 0.9390121, 2.083179, 1, 0, 0, 1, 1,
1.31375, 0.4595122, 1.113863, 1, 0, 0, 1, 1,
1.329714, -0.6047728, 0.9353974, 0, 0, 0, 1, 1,
1.3308, -0.6772986, -1.010348, 0, 0, 0, 1, 1,
1.354672, -0.6282402, 1.374647, 0, 0, 0, 1, 1,
1.356794, -0.3800813, 2.652447, 0, 0, 0, 1, 1,
1.360035, 0.1663116, 2.253042, 0, 0, 0, 1, 1,
1.363265, -1.505307, 2.772077, 0, 0, 0, 1, 1,
1.369344, 0.8447322, -0.8405212, 0, 0, 0, 1, 1,
1.395808, 1.579292, 0.6238821, 1, 1, 1, 1, 1,
1.401039, -0.1849408, 2.690755, 1, 1, 1, 1, 1,
1.401715, -1.606357, 1.123496, 1, 1, 1, 1, 1,
1.404316, -1.981551, 2.385778, 1, 1, 1, 1, 1,
1.409352, 0.5048179, 0.7037707, 1, 1, 1, 1, 1,
1.409642, 1.897543, -1.252997, 1, 1, 1, 1, 1,
1.424762, -1.143452, 1.970697, 1, 1, 1, 1, 1,
1.438106, -0.03403728, 0.3162245, 1, 1, 1, 1, 1,
1.446775, -1.939048, 3.654684, 1, 1, 1, 1, 1,
1.452882, 0.4618867, 0.9712073, 1, 1, 1, 1, 1,
1.464679, 0.7553632, 0.6126322, 1, 1, 1, 1, 1,
1.49009, -0.9930063, 1.657577, 1, 1, 1, 1, 1,
1.492086, 0.162653, 2.423217, 1, 1, 1, 1, 1,
1.500326, -0.1400103, 0.8630599, 1, 1, 1, 1, 1,
1.509904, 0.8590398, -0.6257339, 1, 1, 1, 1, 1,
1.514657, 0.07384738, 2.069458, 0, 0, 1, 1, 1,
1.5317, -0.5351826, 1.652846, 1, 0, 0, 1, 1,
1.541891, 0.9769701, 1.039656, 1, 0, 0, 1, 1,
1.542702, 0.2650119, 0.5670201, 1, 0, 0, 1, 1,
1.551112, -0.7423183, 0.3188614, 1, 0, 0, 1, 1,
1.555898, 0.880244, 1.641949, 1, 0, 0, 1, 1,
1.556719, -1.741151, 1.423798, 0, 0, 0, 1, 1,
1.563499, -2.580949, 3.34581, 0, 0, 0, 1, 1,
1.570144, 0.4186873, 1.449358, 0, 0, 0, 1, 1,
1.579529, -0.1814704, 2.427147, 0, 0, 0, 1, 1,
1.585404, -0.3044088, 1.850235, 0, 0, 0, 1, 1,
1.618123, 0.1015804, 0.6701344, 0, 0, 0, 1, 1,
1.623225, 1.524778, 1.324196, 0, 0, 0, 1, 1,
1.623385, -1.049757, 0.3360285, 1, 1, 1, 1, 1,
1.627178, -1.325467, 2.336548, 1, 1, 1, 1, 1,
1.63224, 0.2016378, 1.289804, 1, 1, 1, 1, 1,
1.636909, -1.221401, 1.775773, 1, 1, 1, 1, 1,
1.637432, -0.03828517, 1.581077, 1, 1, 1, 1, 1,
1.641237, -1.243522, 2.126369, 1, 1, 1, 1, 1,
1.65463, -0.1251481, 2.064374, 1, 1, 1, 1, 1,
1.67806, -1.853779, 1.735363, 1, 1, 1, 1, 1,
1.687193, -1.24757, 1.448479, 1, 1, 1, 1, 1,
1.698575, 0.9145126, 1.318192, 1, 1, 1, 1, 1,
1.709855, 0.4378289, -0.03535668, 1, 1, 1, 1, 1,
1.714557, -1.219712, 3.149263, 1, 1, 1, 1, 1,
1.733016, -0.03264232, 1.268104, 1, 1, 1, 1, 1,
1.737562, 0.00489454, 0.2896037, 1, 1, 1, 1, 1,
1.749068, 0.7730439, 0.8354738, 1, 1, 1, 1, 1,
1.761263, 0.7192519, 0.513055, 0, 0, 1, 1, 1,
1.816717, 1.745533, 0.9747907, 1, 0, 0, 1, 1,
1.829715, -1.525948, 1.865284, 1, 0, 0, 1, 1,
1.855005, 0.07030038, 1.700249, 1, 0, 0, 1, 1,
1.859823, -3.180704, 1.434179, 1, 0, 0, 1, 1,
1.860071, 0.0327876, 1.751868, 1, 0, 0, 1, 1,
1.899491, -0.9573854, 3.909855, 0, 0, 0, 1, 1,
1.901446, 0.8425151, 0.5627851, 0, 0, 0, 1, 1,
1.91146, 0.04068566, 3.138622, 0, 0, 0, 1, 1,
1.915258, 0.29769, 2.24977, 0, 0, 0, 1, 1,
1.961774, 0.3764063, 0.2231178, 0, 0, 0, 1, 1,
1.972614, 0.4923885, 0.8145347, 0, 0, 0, 1, 1,
1.999838, 1.144632, 1.007196, 0, 0, 0, 1, 1,
2.003776, -0.4345083, 2.384461, 1, 1, 1, 1, 1,
2.014016, -0.4546927, 2.84276, 1, 1, 1, 1, 1,
2.024484, 1.028155, 1.06034, 1, 1, 1, 1, 1,
2.053138, -2.064006, 4.732858, 1, 1, 1, 1, 1,
2.05812, 1.183512, 0.926523, 1, 1, 1, 1, 1,
2.058739, -0.6251324, 4.052062, 1, 1, 1, 1, 1,
2.096093, -2.177763, 2.098722, 1, 1, 1, 1, 1,
2.099463, 0.08072726, 1.676452, 1, 1, 1, 1, 1,
2.114272, -0.1976495, 2.3064, 1, 1, 1, 1, 1,
2.140791, 2.087993, 1.506589, 1, 1, 1, 1, 1,
2.160411, 1.766056, 1.428628, 1, 1, 1, 1, 1,
2.17786, 0.5023764, -0.01776057, 1, 1, 1, 1, 1,
2.188876, 1.408872, 1.833477, 1, 1, 1, 1, 1,
2.214009, 0.5790042, 0.4122693, 1, 1, 1, 1, 1,
2.214438, 0.425374, 3.799503, 1, 1, 1, 1, 1,
2.215677, 0.01381634, 2.102273, 0, 0, 1, 1, 1,
2.22553, -0.04897867, 1.187214, 1, 0, 0, 1, 1,
2.248572, 0.3830112, 0.217226, 1, 0, 0, 1, 1,
2.269515, -1.100859, 3.029282, 1, 0, 0, 1, 1,
2.329785, -0.9924311, 1.46802, 1, 0, 0, 1, 1,
2.334319, -0.7707262, 1.849097, 1, 0, 0, 1, 1,
2.36136, -0.6731473, 2.752379, 0, 0, 0, 1, 1,
2.436733, -0.5888123, 1.156392, 0, 0, 0, 1, 1,
2.45412, -0.4199293, 1.984941, 0, 0, 0, 1, 1,
2.486092, -1.606746, 1.477769, 0, 0, 0, 1, 1,
2.531299, 0.185682, 1.607285, 0, 0, 0, 1, 1,
2.60884, 0.2819504, 2.83571, 0, 0, 0, 1, 1,
2.634966, 0.3937537, 0.07393557, 0, 0, 0, 1, 1,
2.72436, 1.169387, 0.228156, 1, 1, 1, 1, 1,
2.736517, -0.9182798, 2.209066, 1, 1, 1, 1, 1,
2.758191, -1.879009, 4.569503, 1, 1, 1, 1, 1,
3.044699, -0.965393, 1.623085, 1, 1, 1, 1, 1,
3.156747, -1.560991, 3.929633, 1, 1, 1, 1, 1,
3.185395, -0.1919664, 0.6578931, 1, 1, 1, 1, 1,
3.857876, 0.4615449, 1.176373, 1, 1, 1, 1, 1
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
var radius = 9.813161;
var distance = 34.46831;
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
mvMatrix.translate( -0.4089837, 0.3075029, 0.1651237 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46831);
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
