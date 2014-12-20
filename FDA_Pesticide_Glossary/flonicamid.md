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
-3.159868, 0.7444392, -1.604933, 1, 0, 0, 1,
-3.053293, -0.9407507, -2.679301, 1, 0.007843138, 0, 1,
-2.898366, 2.029624, -1.051791, 1, 0.01176471, 0, 1,
-2.749283, 1.889155, -0.3670598, 1, 0.01960784, 0, 1,
-2.574471, -0.4800364, -2.735617, 1, 0.02352941, 0, 1,
-2.526432, -0.2160807, -2.094357, 1, 0.03137255, 0, 1,
-2.435379, -0.6753137, -1.88116, 1, 0.03529412, 0, 1,
-2.336139, -1.100468, -1.148111, 1, 0.04313726, 0, 1,
-2.314864, 1.851617, -0.9043309, 1, 0.04705882, 0, 1,
-2.313911, 1.413365, -0.005033738, 1, 0.05490196, 0, 1,
-2.207014, -0.3383782, -0.9220751, 1, 0.05882353, 0, 1,
-2.197306, -0.2648542, -2.144778, 1, 0.06666667, 0, 1,
-2.173747, 1.452124, -0.9843619, 1, 0.07058824, 0, 1,
-2.170958, 0.9012917, -0.8823404, 1, 0.07843138, 0, 1,
-2.167241, 0.1899009, -1.805827, 1, 0.08235294, 0, 1,
-2.106678, -0.661088, -1.238243, 1, 0.09019608, 0, 1,
-2.081354, -0.3332302, -3.302213, 1, 0.09411765, 0, 1,
-2.065757, 1.171528, -2.759778, 1, 0.1019608, 0, 1,
-2.025563, -1.654812, -1.744396, 1, 0.1098039, 0, 1,
-2.021962, -0.7258668, -1.880776, 1, 0.1137255, 0, 1,
-1.986248, 0.2970549, -2.182527, 1, 0.1215686, 0, 1,
-1.946038, 0.2160768, -2.038945, 1, 0.1254902, 0, 1,
-1.922569, 0.9902249, -0.8017375, 1, 0.1333333, 0, 1,
-1.914158, 2.46525, -1.141723, 1, 0.1372549, 0, 1,
-1.907751, -0.02849913, -4.037825, 1, 0.145098, 0, 1,
-1.863767, -0.7144978, -0.7870407, 1, 0.1490196, 0, 1,
-1.858426, -0.03430777, -2.627413, 1, 0.1568628, 0, 1,
-1.811478, 0.1523545, 0.05256775, 1, 0.1607843, 0, 1,
-1.801016, -2.285384, -3.314287, 1, 0.1686275, 0, 1,
-1.78256, -2.121823, -2.119948, 1, 0.172549, 0, 1,
-1.739358, -0.6451935, -2.232552, 1, 0.1803922, 0, 1,
-1.733766, -1.350168, -2.752812, 1, 0.1843137, 0, 1,
-1.708116, 1.162442, -2.676262, 1, 0.1921569, 0, 1,
-1.695227, -2.17161, -2.213546, 1, 0.1960784, 0, 1,
-1.68986, 0.7055078, -2.430303, 1, 0.2039216, 0, 1,
-1.685337, -0.3915481, -2.222375, 1, 0.2117647, 0, 1,
-1.684206, 0.1902064, -2.796802, 1, 0.2156863, 0, 1,
-1.659053, -1.063884, -0.05094794, 1, 0.2235294, 0, 1,
-1.653984, 0.6659878, -0.7890353, 1, 0.227451, 0, 1,
-1.650025, -0.4501248, -0.736486, 1, 0.2352941, 0, 1,
-1.646906, 0.7116503, 0.6217273, 1, 0.2392157, 0, 1,
-1.623324, -1.335257, -3.451274, 1, 0.2470588, 0, 1,
-1.619006, -0.6387289, -1.664157, 1, 0.2509804, 0, 1,
-1.617654, -1.589942, -2.84321, 1, 0.2588235, 0, 1,
-1.614749, -0.0278607, -0.4837463, 1, 0.2627451, 0, 1,
-1.612279, 0.3887049, -1.911169, 1, 0.2705882, 0, 1,
-1.60505, 0.5592861, -0.5624699, 1, 0.2745098, 0, 1,
-1.602535, 0.01267599, -1.680811, 1, 0.282353, 0, 1,
-1.59696, -0.6618838, 0.1400494, 1, 0.2862745, 0, 1,
-1.592418, 1.777806, -1.222383, 1, 0.2941177, 0, 1,
-1.577816, 1.154885, -0.06580516, 1, 0.3019608, 0, 1,
-1.554561, 0.9919525, -1.154126, 1, 0.3058824, 0, 1,
-1.549314, 0.5128111, -0.6827787, 1, 0.3137255, 0, 1,
-1.547504, -0.9206568, -1.379974, 1, 0.3176471, 0, 1,
-1.533972, 0.2880302, -2.274168, 1, 0.3254902, 0, 1,
-1.533305, -0.02219958, -2.643307, 1, 0.3294118, 0, 1,
-1.523122, -1.141591, -3.043941, 1, 0.3372549, 0, 1,
-1.521193, -0.879257, -2.838758, 1, 0.3411765, 0, 1,
-1.517557, 0.2072647, -0.8244212, 1, 0.3490196, 0, 1,
-1.510513, 0.640504, -0.3867081, 1, 0.3529412, 0, 1,
-1.510345, 1.184868, -1.289187, 1, 0.3607843, 0, 1,
-1.483497, 0.9828512, -0.3654974, 1, 0.3647059, 0, 1,
-1.464512, 0.2955071, -0.3007455, 1, 0.372549, 0, 1,
-1.464471, -0.07487944, -1.479192, 1, 0.3764706, 0, 1,
-1.457629, -0.2740507, -1.799887, 1, 0.3843137, 0, 1,
-1.439849, 2.40652, -0.8065445, 1, 0.3882353, 0, 1,
-1.414251, -0.2284033, -2.723159, 1, 0.3960784, 0, 1,
-1.413794, 0.01159973, -1.699302, 1, 0.4039216, 0, 1,
-1.410248, 1.352313, -1.366251, 1, 0.4078431, 0, 1,
-1.408648, -1.65121, -2.635433, 1, 0.4156863, 0, 1,
-1.391537, 0.2041478, -1.517913, 1, 0.4196078, 0, 1,
-1.387267, 0.9310633, -0.3406518, 1, 0.427451, 0, 1,
-1.381789, -0.8698955, -2.989696, 1, 0.4313726, 0, 1,
-1.372964, -0.1575255, -1.069142, 1, 0.4392157, 0, 1,
-1.370831, -0.7808521, -2.308497, 1, 0.4431373, 0, 1,
-1.369306, -0.7396979, -1.135015, 1, 0.4509804, 0, 1,
-1.366985, -2.39772, -3.704258, 1, 0.454902, 0, 1,
-1.364107, -0.3604563, -2.339911, 1, 0.4627451, 0, 1,
-1.362856, -0.8878673, -3.041487, 1, 0.4666667, 0, 1,
-1.354478, -1.522334, -2.258731, 1, 0.4745098, 0, 1,
-1.348374, -0.6582102, -3.483575, 1, 0.4784314, 0, 1,
-1.346474, 0.06361101, -2.692781, 1, 0.4862745, 0, 1,
-1.341778, -0.2591555, -0.7637343, 1, 0.4901961, 0, 1,
-1.341684, 0.5410715, -2.586345, 1, 0.4980392, 0, 1,
-1.340054, 1.827583, 1.027316, 1, 0.5058824, 0, 1,
-1.3291, -0.5602861, -3.196227, 1, 0.509804, 0, 1,
-1.304561, -0.4151653, -3.456252, 1, 0.5176471, 0, 1,
-1.296944, 0.4222663, -1.390341, 1, 0.5215687, 0, 1,
-1.292184, -1.013528, -2.155881, 1, 0.5294118, 0, 1,
-1.290635, 0.05555757, -2.00547, 1, 0.5333334, 0, 1,
-1.281755, -0.1763448, -1.909722, 1, 0.5411765, 0, 1,
-1.280995, 1.419252, -0.4013217, 1, 0.5450981, 0, 1,
-1.278816, -2.518279, -2.293464, 1, 0.5529412, 0, 1,
-1.275375, 1.712005, 0.1148632, 1, 0.5568628, 0, 1,
-1.27511, -0.7209948, -3.015167, 1, 0.5647059, 0, 1,
-1.273478, 1.330616, -2.100363, 1, 0.5686275, 0, 1,
-1.258156, -0.6639311, -2.778721, 1, 0.5764706, 0, 1,
-1.251957, 0.8559635, 0.4326632, 1, 0.5803922, 0, 1,
-1.248241, -0.4483716, -3.073025, 1, 0.5882353, 0, 1,
-1.239806, 1.498818, 0.2160607, 1, 0.5921569, 0, 1,
-1.237901, 0.05783623, -3.53881, 1, 0.6, 0, 1,
-1.237498, 0.5265887, -0.6360447, 1, 0.6078432, 0, 1,
-1.236951, -0.6598365, -2.557562, 1, 0.6117647, 0, 1,
-1.228555, 0.3100815, 0.026799, 1, 0.6196079, 0, 1,
-1.223739, 1.189953, -1.57946, 1, 0.6235294, 0, 1,
-1.222021, -0.1885234, -1.518339, 1, 0.6313726, 0, 1,
-1.209902, 0.3728614, 0.2817909, 1, 0.6352941, 0, 1,
-1.20769, -1.041865, -4.073362, 1, 0.6431373, 0, 1,
-1.202615, -0.7225817, -1.618582, 1, 0.6470588, 0, 1,
-1.202217, 0.2092819, -2.688154, 1, 0.654902, 0, 1,
-1.199415, 0.6567649, -1.486352, 1, 0.6588235, 0, 1,
-1.198809, -1.285971, -2.016442, 1, 0.6666667, 0, 1,
-1.197598, -1.209152, -2.736696, 1, 0.6705883, 0, 1,
-1.19749, -1.594106, -1.011351, 1, 0.6784314, 0, 1,
-1.189975, 1.725605, -1.243517, 1, 0.682353, 0, 1,
-1.189865, -0.7015924, -1.555297, 1, 0.6901961, 0, 1,
-1.188727, 1.25368, -1.775564, 1, 0.6941177, 0, 1,
-1.186864, -0.1839228, -1.630031, 1, 0.7019608, 0, 1,
-1.184958, 1.026638, -0.3524526, 1, 0.7098039, 0, 1,
-1.180838, 2.063963, -0.2391097, 1, 0.7137255, 0, 1,
-1.179235, -0.2074012, -0.2745997, 1, 0.7215686, 0, 1,
-1.175933, -0.04576029, -0.1110172, 1, 0.7254902, 0, 1,
-1.170087, 1.474333, -0.6339961, 1, 0.7333333, 0, 1,
-1.16872, -0.3808668, -2.073307, 1, 0.7372549, 0, 1,
-1.166279, 0.6950444, -1.176231, 1, 0.7450981, 0, 1,
-1.166041, -1.463613, -3.306046, 1, 0.7490196, 0, 1,
-1.161697, 0.07284063, 0.0351579, 1, 0.7568628, 0, 1,
-1.161533, -0.9194815, -2.279772, 1, 0.7607843, 0, 1,
-1.151573, -1.286682, -1.850467, 1, 0.7686275, 0, 1,
-1.14567, -0.5456439, -0.2832264, 1, 0.772549, 0, 1,
-1.139787, 0.5875045, -2.703804, 1, 0.7803922, 0, 1,
-1.128185, 1.558305, 0.9073262, 1, 0.7843137, 0, 1,
-1.12675, 1.23369, -3.07939, 1, 0.7921569, 0, 1,
-1.125408, -0.3477412, -2.782971, 1, 0.7960784, 0, 1,
-1.115754, 0.3112683, -1.957924, 1, 0.8039216, 0, 1,
-1.108958, -0.5245349, -0.7443741, 1, 0.8117647, 0, 1,
-1.108905, -1.549087, -2.376637, 1, 0.8156863, 0, 1,
-1.107344, 0.8838034, -0.9060451, 1, 0.8235294, 0, 1,
-1.098281, -0.1421719, -1.439047, 1, 0.827451, 0, 1,
-1.097566, -0.8703133, -3.174663, 1, 0.8352941, 0, 1,
-1.093795, -0.8116761, -2.48976, 1, 0.8392157, 0, 1,
-1.081208, -0.5848037, -2.178427, 1, 0.8470588, 0, 1,
-1.080728, 0.5866928, -2.230922, 1, 0.8509804, 0, 1,
-1.080455, -1.592992, -1.612943, 1, 0.8588235, 0, 1,
-1.074531, 1.570606, -0.4541376, 1, 0.8627451, 0, 1,
-1.059905, -0.01113145, -1.894674, 1, 0.8705882, 0, 1,
-1.051457, -0.4452012, -1.999834, 1, 0.8745098, 0, 1,
-1.049988, -0.2514655, -2.501304, 1, 0.8823529, 0, 1,
-1.048716, 0.4902487, -2.208365, 1, 0.8862745, 0, 1,
-1.041611, -0.1624746, 0.08941255, 1, 0.8941177, 0, 1,
-1.039676, 0.07693233, -2.504859, 1, 0.8980392, 0, 1,
-1.033528, -0.233502, -0.5982696, 1, 0.9058824, 0, 1,
-1.033125, 1.001291, -1.771234, 1, 0.9137255, 0, 1,
-1.031307, -0.5841731, -2.223438, 1, 0.9176471, 0, 1,
-1.029691, -0.4927676, -2.255913, 1, 0.9254902, 0, 1,
-1.020237, 0.2349538, -0.4059545, 1, 0.9294118, 0, 1,
-1.002607, 0.2616587, -2.925408, 1, 0.9372549, 0, 1,
-1.002068, 0.6845596, -0.3956822, 1, 0.9411765, 0, 1,
-0.9981773, 0.1161396, -3.888425, 1, 0.9490196, 0, 1,
-0.9977095, 0.2233581, -0.8920485, 1, 0.9529412, 0, 1,
-0.9922229, 1.274696, 0.1147317, 1, 0.9607843, 0, 1,
-0.9887507, 2.369286, -0.8755709, 1, 0.9647059, 0, 1,
-0.9868501, 0.6969224, -1.680264, 1, 0.972549, 0, 1,
-0.9853042, -0.5432097, -1.661176, 1, 0.9764706, 0, 1,
-0.9821711, -1.37371, -3.609579, 1, 0.9843137, 0, 1,
-0.977742, -0.7191473, -1.592936, 1, 0.9882353, 0, 1,
-0.9737241, -0.4904902, -2.999159, 1, 0.9960784, 0, 1,
-0.9721338, -0.3963975, -1.692455, 0.9960784, 1, 0, 1,
-0.9715309, -2.041551, -2.900524, 0.9921569, 1, 0, 1,
-0.9713751, 0.2841275, 0.9688509, 0.9843137, 1, 0, 1,
-0.9616038, -1.476141, -3.226174, 0.9803922, 1, 0, 1,
-0.9556175, 0.6293018, -0.4981489, 0.972549, 1, 0, 1,
-0.9518349, -2.051721, -2.74449, 0.9686275, 1, 0, 1,
-0.9422666, 0.7691578, -1.990769, 0.9607843, 1, 0, 1,
-0.9394422, -0.5433942, -2.525823, 0.9568627, 1, 0, 1,
-0.9336579, 0.7537106, 0.6574604, 0.9490196, 1, 0, 1,
-0.9330511, -0.4112722, -2.948141, 0.945098, 1, 0, 1,
-0.9233139, 0.02417286, -1.316773, 0.9372549, 1, 0, 1,
-0.9144948, 0.07462397, 0.07361888, 0.9333333, 1, 0, 1,
-0.9126881, 0.7390375, -0.2879578, 0.9254902, 1, 0, 1,
-0.9121009, 0.5062388, -0.6447398, 0.9215686, 1, 0, 1,
-0.9053537, 0.5605784, -1.329703, 0.9137255, 1, 0, 1,
-0.9046056, 1.732815, -1.533156, 0.9098039, 1, 0, 1,
-0.9010366, -1.07306, -4.457566, 0.9019608, 1, 0, 1,
-0.8930807, 1.83041, 2.342418, 0.8941177, 1, 0, 1,
-0.8924617, -1.850608, -3.402963, 0.8901961, 1, 0, 1,
-0.8871829, -1.8455, -3.559069, 0.8823529, 1, 0, 1,
-0.8730768, -0.8745571, -2.902721, 0.8784314, 1, 0, 1,
-0.8715977, 1.236025, -1.172116, 0.8705882, 1, 0, 1,
-0.8708714, -0.2931589, -0.9096335, 0.8666667, 1, 0, 1,
-0.865894, 1.067433, 2.207653, 0.8588235, 1, 0, 1,
-0.8643261, -1.354618, -2.853427, 0.854902, 1, 0, 1,
-0.8640763, 0.6713184, -0.3924916, 0.8470588, 1, 0, 1,
-0.8570827, 0.712617, -1.22199, 0.8431373, 1, 0, 1,
-0.8480189, 1.563586, -0.1476708, 0.8352941, 1, 0, 1,
-0.8476691, -1.689945, -2.251684, 0.8313726, 1, 0, 1,
-0.8396065, -1.544765, -3.559075, 0.8235294, 1, 0, 1,
-0.8342715, -0.9206966, -2.134503, 0.8196079, 1, 0, 1,
-0.8323058, -0.3652859, -2.542897, 0.8117647, 1, 0, 1,
-0.8207181, 0.5836726, 1.268681, 0.8078431, 1, 0, 1,
-0.8154379, -0.4922196, -1.123341, 0.8, 1, 0, 1,
-0.8154215, -0.6126459, -3.702952, 0.7921569, 1, 0, 1,
-0.8088615, 1.720147, -2.133434, 0.7882353, 1, 0, 1,
-0.8030164, 0.3267773, -0.9791123, 0.7803922, 1, 0, 1,
-0.8005731, 0.1691838, -2.575688, 0.7764706, 1, 0, 1,
-0.7944936, -0.1182435, -3.425948, 0.7686275, 1, 0, 1,
-0.7921839, 0.2800273, -0.6542864, 0.7647059, 1, 0, 1,
-0.7871827, -0.122998, -2.406857, 0.7568628, 1, 0, 1,
-0.7838715, 0.8767686, -1.388906, 0.7529412, 1, 0, 1,
-0.7820405, -0.936179, -2.693867, 0.7450981, 1, 0, 1,
-0.7815629, 1.151375, -1.624037, 0.7411765, 1, 0, 1,
-0.7799217, 0.0284968, -1.646198, 0.7333333, 1, 0, 1,
-0.7786449, -0.5704975, -0.6891182, 0.7294118, 1, 0, 1,
-0.7737622, 1.762631, 0.05734354, 0.7215686, 1, 0, 1,
-0.7727617, -1.358625, -2.971077, 0.7176471, 1, 0, 1,
-0.7645969, 0.2571912, 0.2554257, 0.7098039, 1, 0, 1,
-0.7490882, 0.06483696, -1.354297, 0.7058824, 1, 0, 1,
-0.7466971, 1.012293, 1.418361, 0.6980392, 1, 0, 1,
-0.7458689, -0.4929334, -2.10462, 0.6901961, 1, 0, 1,
-0.7457292, 1.632666, -2.311578, 0.6862745, 1, 0, 1,
-0.7452551, -1.137357, -2.00039, 0.6784314, 1, 0, 1,
-0.7435878, -0.2043716, -2.256882, 0.6745098, 1, 0, 1,
-0.7434674, -0.6780096, -0.3167729, 0.6666667, 1, 0, 1,
-0.7400108, 1.591849, -0.6019641, 0.6627451, 1, 0, 1,
-0.7360038, -0.3170388, -3.994655, 0.654902, 1, 0, 1,
-0.7352898, -0.6987203, -1.702948, 0.6509804, 1, 0, 1,
-0.7338657, -1.367745, -2.146415, 0.6431373, 1, 0, 1,
-0.7270142, -1.204635, -1.261801, 0.6392157, 1, 0, 1,
-0.718039, -0.2901594, -2.199326, 0.6313726, 1, 0, 1,
-0.7145327, 0.5755439, 0.8569427, 0.627451, 1, 0, 1,
-0.7122682, -0.444391, -2.088525, 0.6196079, 1, 0, 1,
-0.7115619, 1.927014, 0.3709281, 0.6156863, 1, 0, 1,
-0.7103218, 1.468777, 0.04777332, 0.6078432, 1, 0, 1,
-0.7079304, -0.1010991, -1.696024, 0.6039216, 1, 0, 1,
-0.7075978, -0.6010167, -4.391067, 0.5960785, 1, 0, 1,
-0.7051248, 0.4498345, -0.6575481, 0.5882353, 1, 0, 1,
-0.7046489, 0.7952527, -2.188971, 0.5843138, 1, 0, 1,
-0.7013663, 1.864079, -0.3666191, 0.5764706, 1, 0, 1,
-0.6988684, 0.8484556, -0.2302214, 0.572549, 1, 0, 1,
-0.6962711, -0.2396599, -3.193703, 0.5647059, 1, 0, 1,
-0.6934922, 0.1788929, -4.323048, 0.5607843, 1, 0, 1,
-0.6923034, 0.8763654, -1.365236, 0.5529412, 1, 0, 1,
-0.6880037, -0.7741776, -0.6710584, 0.5490196, 1, 0, 1,
-0.6852516, -0.7923546, -1.885849, 0.5411765, 1, 0, 1,
-0.6789892, -1.360123, -2.607051, 0.5372549, 1, 0, 1,
-0.674672, 1.401798, -1.452487, 0.5294118, 1, 0, 1,
-0.6739818, 0.4235398, -1.033471, 0.5254902, 1, 0, 1,
-0.6703776, -1.530692, -3.436004, 0.5176471, 1, 0, 1,
-0.6663718, 0.3760963, -1.988519, 0.5137255, 1, 0, 1,
-0.6629528, 1.180986, -1.018245, 0.5058824, 1, 0, 1,
-0.6615038, -0.620599, -1.310837, 0.5019608, 1, 0, 1,
-0.6573886, 0.4642382, -0.3325154, 0.4941176, 1, 0, 1,
-0.6560492, 0.2575343, 0.02432623, 0.4862745, 1, 0, 1,
-0.6558686, 0.2583688, -2.315658, 0.4823529, 1, 0, 1,
-0.6484998, 2.465738, -0.07280237, 0.4745098, 1, 0, 1,
-0.6460365, 0.9197255, -2.47512, 0.4705882, 1, 0, 1,
-0.6406988, -0.5063055, -4.052183, 0.4627451, 1, 0, 1,
-0.6401981, 1.966445, 0.03491488, 0.4588235, 1, 0, 1,
-0.6375772, -0.02473495, -0.05236704, 0.4509804, 1, 0, 1,
-0.6309751, 0.5662967, -0.7003435, 0.4470588, 1, 0, 1,
-0.6295497, -0.3847022, -1.1759, 0.4392157, 1, 0, 1,
-0.6280876, -0.4819053, -2.299844, 0.4352941, 1, 0, 1,
-0.6232085, 0.4532866, -2.137742, 0.427451, 1, 0, 1,
-0.615927, -0.4333095, -1.295768, 0.4235294, 1, 0, 1,
-0.6144943, -0.6549154, -2.890142, 0.4156863, 1, 0, 1,
-0.6068466, -3.075288, -1.790235, 0.4117647, 1, 0, 1,
-0.6001169, 1.104851, -1.790844, 0.4039216, 1, 0, 1,
-0.599551, -0.0323047, -0.908635, 0.3960784, 1, 0, 1,
-0.5986314, -0.2887226, -1.051273, 0.3921569, 1, 0, 1,
-0.5981743, -0.3991029, -3.054281, 0.3843137, 1, 0, 1,
-0.5961207, 0.7273027, -1.211174, 0.3803922, 1, 0, 1,
-0.5893006, 0.9100242, -1.882121, 0.372549, 1, 0, 1,
-0.5847278, -0.6545206, -1.616518, 0.3686275, 1, 0, 1,
-0.5795268, 0.7575828, -1.056688, 0.3607843, 1, 0, 1,
-0.579171, 0.5036476, -0.7658946, 0.3568628, 1, 0, 1,
-0.5789745, -1.014821, -2.791977, 0.3490196, 1, 0, 1,
-0.577888, -0.4931798, -2.965608, 0.345098, 1, 0, 1,
-0.5755089, 1.067088, -0.1403515, 0.3372549, 1, 0, 1,
-0.5746735, -0.4632931, -3.188949, 0.3333333, 1, 0, 1,
-0.5699545, 0.1689856, -1.347379, 0.3254902, 1, 0, 1,
-0.565702, 1.447, 0.4917941, 0.3215686, 1, 0, 1,
-0.5648499, 0.7257102, -0.8580094, 0.3137255, 1, 0, 1,
-0.5645617, 0.483139, -0.6369259, 0.3098039, 1, 0, 1,
-0.5546836, 1.556317, 0.1477332, 0.3019608, 1, 0, 1,
-0.5545346, -1.637265, -1.845807, 0.2941177, 1, 0, 1,
-0.5539292, 1.228415, -0.9374973, 0.2901961, 1, 0, 1,
-0.5419205, 0.004599549, 0.4761167, 0.282353, 1, 0, 1,
-0.5409923, -0.3895605, -0.9898852, 0.2784314, 1, 0, 1,
-0.5406625, 1.545568, 1.628548, 0.2705882, 1, 0, 1,
-0.538321, 1.363568, -1.240298, 0.2666667, 1, 0, 1,
-0.5368052, 0.1054759, -1.371586, 0.2588235, 1, 0, 1,
-0.5359986, 1.121185, -1.192458, 0.254902, 1, 0, 1,
-0.5275472, 0.6119999, -1.214683, 0.2470588, 1, 0, 1,
-0.5214842, 1.674061, 0.8714663, 0.2431373, 1, 0, 1,
-0.521195, -1.300786, -1.447898, 0.2352941, 1, 0, 1,
-0.5210912, 1.737682, -1.203106, 0.2313726, 1, 0, 1,
-0.5143887, -1.209321, -4.46852, 0.2235294, 1, 0, 1,
-0.5138096, 1.976732, -0.905365, 0.2196078, 1, 0, 1,
-0.5107833, -1.532307, -1.041144, 0.2117647, 1, 0, 1,
-0.5052195, 0.5433883, 0.233789, 0.2078431, 1, 0, 1,
-0.5050961, 1.502672, 0.7827291, 0.2, 1, 0, 1,
-0.5004247, 1.234375, -2.241362, 0.1921569, 1, 0, 1,
-0.4953279, -1.352885, -2.057386, 0.1882353, 1, 0, 1,
-0.4943439, 0.6847212, 0.07969958, 0.1803922, 1, 0, 1,
-0.492479, -0.8584355, -4.463917, 0.1764706, 1, 0, 1,
-0.4913513, -0.7416123, -2.734232, 0.1686275, 1, 0, 1,
-0.4897762, -0.5073405, -3.940034, 0.1647059, 1, 0, 1,
-0.4889202, 0.273912, -0.8016941, 0.1568628, 1, 0, 1,
-0.4885814, -0.7165962, -2.273643, 0.1529412, 1, 0, 1,
-0.4872013, 0.2277059, -1.309597, 0.145098, 1, 0, 1,
-0.482579, 1.098042, -0.3905724, 0.1411765, 1, 0, 1,
-0.4782341, -0.1777896, -1.582748, 0.1333333, 1, 0, 1,
-0.4728972, 0.3892466, -0.2202719, 0.1294118, 1, 0, 1,
-0.4726563, 1.451635, -0.9280582, 0.1215686, 1, 0, 1,
-0.4713038, -0.1192335, -1.899807, 0.1176471, 1, 0, 1,
-0.4696161, -2.535177, -2.790309, 0.1098039, 1, 0, 1,
-0.4692369, -0.6572621, -3.145965, 0.1058824, 1, 0, 1,
-0.4686185, 0.3342502, -0.2940837, 0.09803922, 1, 0, 1,
-0.4657721, -0.2366123, -1.448981, 0.09019608, 1, 0, 1,
-0.4647289, -0.1267148, -1.78654, 0.08627451, 1, 0, 1,
-0.4619283, -0.7413703, -2.991706, 0.07843138, 1, 0, 1,
-0.4567966, -0.7801108, -3.18252, 0.07450981, 1, 0, 1,
-0.4555845, 1.869983, 2.183186, 0.06666667, 1, 0, 1,
-0.4444842, -1.374506, -1.40745, 0.0627451, 1, 0, 1,
-0.4361981, 1.493828, 0.5426579, 0.05490196, 1, 0, 1,
-0.4359513, 0.1294235, -2.000485, 0.05098039, 1, 0, 1,
-0.435772, -0.7497633, -1.816871, 0.04313726, 1, 0, 1,
-0.429031, -1.121688, -4.304093, 0.03921569, 1, 0, 1,
-0.4286743, -0.5182932, -1.971895, 0.03137255, 1, 0, 1,
-0.427104, -0.2087348, -1.69275, 0.02745098, 1, 0, 1,
-0.426131, -0.155019, -2.4864, 0.01960784, 1, 0, 1,
-0.4230866, 0.794751, -3.184556, 0.01568628, 1, 0, 1,
-0.4225562, 0.5053447, -0.4649734, 0.007843138, 1, 0, 1,
-0.4220791, 0.6349535, -2.458753, 0.003921569, 1, 0, 1,
-0.4095967, 0.8704815, -1.067386, 0, 1, 0.003921569, 1,
-0.4092326, -0.8563254, -3.430307, 0, 1, 0.01176471, 1,
-0.4062822, 0.6943771, -0.4939053, 0, 1, 0.01568628, 1,
-0.4039262, -1.730962, -4.219335, 0, 1, 0.02352941, 1,
-0.4015434, 0.2919986, -0.9738373, 0, 1, 0.02745098, 1,
-0.4004483, 0.7589316, -0.11472, 0, 1, 0.03529412, 1,
-0.397052, -1.116465, -4.519578, 0, 1, 0.03921569, 1,
-0.3941838, -1.634526, -4.124535, 0, 1, 0.04705882, 1,
-0.3913449, 0.7632941, 0.7573867, 0, 1, 0.05098039, 1,
-0.3911843, -2.322104, -3.423285, 0, 1, 0.05882353, 1,
-0.3907592, 0.8325498, -1.123905, 0, 1, 0.0627451, 1,
-0.3871336, -0.5821099, -2.712908, 0, 1, 0.07058824, 1,
-0.3863043, -0.5272659, -2.488793, 0, 1, 0.07450981, 1,
-0.386258, -0.3811158, -2.505494, 0, 1, 0.08235294, 1,
-0.3858531, -0.9719087, -3.018982, 0, 1, 0.08627451, 1,
-0.3843838, -0.3673679, -3.155834, 0, 1, 0.09411765, 1,
-0.3835712, -0.07707775, -1.845326, 0, 1, 0.1019608, 1,
-0.3813792, 1.256639, -0.4737164, 0, 1, 0.1058824, 1,
-0.3790436, -0.169248, -2.602093, 0, 1, 0.1137255, 1,
-0.3714474, 1.140228, 2.452873, 0, 1, 0.1176471, 1,
-0.3658425, -1.31138, -3.34989, 0, 1, 0.1254902, 1,
-0.3650331, 0.2194632, -2.236794, 0, 1, 0.1294118, 1,
-0.3633748, 0.1132144, -0.404689, 0, 1, 0.1372549, 1,
-0.3563446, -0.2448378, -0.7408593, 0, 1, 0.1411765, 1,
-0.3536279, 0.02168334, -2.799316, 0, 1, 0.1490196, 1,
-0.3534597, 0.4023333, -0.7679678, 0, 1, 0.1529412, 1,
-0.3490373, 1.227651, 0.1928703, 0, 1, 0.1607843, 1,
-0.3488843, 0.1760892, -2.071718, 0, 1, 0.1647059, 1,
-0.3474148, 0.9621705, -0.9661282, 0, 1, 0.172549, 1,
-0.3472997, -0.3869758, -3.557462, 0, 1, 0.1764706, 1,
-0.3423042, 1.118961, -0.7933072, 0, 1, 0.1843137, 1,
-0.3407044, 0.7281945, 0.4363075, 0, 1, 0.1882353, 1,
-0.3392774, 1.230004, -1.106867, 0, 1, 0.1960784, 1,
-0.3380751, 0.9303643, -0.9270681, 0, 1, 0.2039216, 1,
-0.336496, -1.569104, -4.552474, 0, 1, 0.2078431, 1,
-0.3361563, -0.9656025, -1.014855, 0, 1, 0.2156863, 1,
-0.3323494, 0.6919904, -0.309222, 0, 1, 0.2196078, 1,
-0.3322357, -0.7328205, -3.381815, 0, 1, 0.227451, 1,
-0.3294473, -1.242291, -2.327879, 0, 1, 0.2313726, 1,
-0.3282181, -0.9163363, -3.614014, 0, 1, 0.2392157, 1,
-0.3281749, 0.2716517, -1.353225, 0, 1, 0.2431373, 1,
-0.3240327, 0.6214164, 0.5841037, 0, 1, 0.2509804, 1,
-0.319852, 0.7870347, -2.225912, 0, 1, 0.254902, 1,
-0.3150623, 0.6902989, -1.958123, 0, 1, 0.2627451, 1,
-0.3134086, 0.9075124, -0.373444, 0, 1, 0.2666667, 1,
-0.3129473, -0.1034592, -3.729985, 0, 1, 0.2745098, 1,
-0.3114334, -0.1325362, -3.488488, 0, 1, 0.2784314, 1,
-0.311362, 0.226052, -0.6580434, 0, 1, 0.2862745, 1,
-0.306114, 0.8091733, 1.081731, 0, 1, 0.2901961, 1,
-0.3051866, -1.239357, -2.490457, 0, 1, 0.2980392, 1,
-0.3032938, 1.313668, -1.326638, 0, 1, 0.3058824, 1,
-0.3028969, 0.2807912, 0.5375703, 0, 1, 0.3098039, 1,
-0.3012585, -0.2739186, -2.662285, 0, 1, 0.3176471, 1,
-0.2959419, -0.8254051, -2.652966, 0, 1, 0.3215686, 1,
-0.2920143, 1.238532, 0.4323228, 0, 1, 0.3294118, 1,
-0.2887212, 1.6613, 1.643691, 0, 1, 0.3333333, 1,
-0.2831518, 0.8828911, -0.1670397, 0, 1, 0.3411765, 1,
-0.2817939, 0.2970633, -2.740382, 0, 1, 0.345098, 1,
-0.2787554, 1.258798, -1.075463, 0, 1, 0.3529412, 1,
-0.2786815, 0.4233378, -1.8968, 0, 1, 0.3568628, 1,
-0.2774199, -0.3313474, -2.848082, 0, 1, 0.3647059, 1,
-0.276051, 0.9235867, -0.6778755, 0, 1, 0.3686275, 1,
-0.2722885, -0.4939568, -2.666379, 0, 1, 0.3764706, 1,
-0.2682219, -1.351588, -4.046427, 0, 1, 0.3803922, 1,
-0.2670414, 1.011939, -0.8561518, 0, 1, 0.3882353, 1,
-0.2627798, -0.1867183, -2.509511, 0, 1, 0.3921569, 1,
-0.2592371, -0.4089748, -2.550377, 0, 1, 0.4, 1,
-0.2515399, 0.9411886, -0.3290869, 0, 1, 0.4078431, 1,
-0.2492403, -0.3572946, -2.35428, 0, 1, 0.4117647, 1,
-0.2478134, -0.00885502, -2.016513, 0, 1, 0.4196078, 1,
-0.2466485, 0.1745373, -1.738402, 0, 1, 0.4235294, 1,
-0.2458694, 0.2972565, -0.09801245, 0, 1, 0.4313726, 1,
-0.2446294, -0.4623431, -1.398613, 0, 1, 0.4352941, 1,
-0.2435368, 1.09143, 2.221403, 0, 1, 0.4431373, 1,
-0.2420718, 0.9228187, -0.7113173, 0, 1, 0.4470588, 1,
-0.2414338, -0.3613119, -2.646408, 0, 1, 0.454902, 1,
-0.2390863, 0.07590701, -1.561558, 0, 1, 0.4588235, 1,
-0.231239, 0.8893299, 0.132155, 0, 1, 0.4666667, 1,
-0.2295777, -0.9272327, -3.257031, 0, 1, 0.4705882, 1,
-0.2286721, -0.4009586, -3.14628, 0, 1, 0.4784314, 1,
-0.2276384, 0.6137012, -1.074466, 0, 1, 0.4823529, 1,
-0.2230514, 0.04786292, -1.258053, 0, 1, 0.4901961, 1,
-0.2176905, 0.8588287, -0.5855368, 0, 1, 0.4941176, 1,
-0.2149374, -0.6338299, -2.615428, 0, 1, 0.5019608, 1,
-0.209365, 0.5671211, -2.227523, 0, 1, 0.509804, 1,
-0.2060229, 1.816014, 0.05664694, 0, 1, 0.5137255, 1,
-0.2037332, -1.416546, -3.781297, 0, 1, 0.5215687, 1,
-0.202911, 0.2281172, -1.744053, 0, 1, 0.5254902, 1,
-0.1969026, 0.04566625, -0.4161006, 0, 1, 0.5333334, 1,
-0.196167, 0.2267943, -1.189025, 0, 1, 0.5372549, 1,
-0.1873804, 0.5545214, -0.5742455, 0, 1, 0.5450981, 1,
-0.1844901, -1.581081, -2.877283, 0, 1, 0.5490196, 1,
-0.1813556, 1.971173, 1.151688, 0, 1, 0.5568628, 1,
-0.1795554, 1.029956, 0.7766483, 0, 1, 0.5607843, 1,
-0.1779112, 0.09862313, -1.8127, 0, 1, 0.5686275, 1,
-0.1773137, -0.1458651, -3.009822, 0, 1, 0.572549, 1,
-0.1765378, -1.289979, -2.503999, 0, 1, 0.5803922, 1,
-0.1746169, -1.072726, -4.477791, 0, 1, 0.5843138, 1,
-0.1661029, -1.53492, -1.549617, 0, 1, 0.5921569, 1,
-0.1647815, -0.9739158, -1.782848, 0, 1, 0.5960785, 1,
-0.1584367, 1.448487, -0.739888, 0, 1, 0.6039216, 1,
-0.1524276, 0.4922934, 0.1427146, 0, 1, 0.6117647, 1,
-0.1509056, 0.8306644, -0.07106246, 0, 1, 0.6156863, 1,
-0.1502615, 1.244, -0.4002658, 0, 1, 0.6235294, 1,
-0.1499382, 0.005954833, -0.8983303, 0, 1, 0.627451, 1,
-0.148532, -0.22153, -3.18945, 0, 1, 0.6352941, 1,
-0.1479228, -1.435145, -1.242489, 0, 1, 0.6392157, 1,
-0.1467366, 0.3067235, -0.2993639, 0, 1, 0.6470588, 1,
-0.1449136, -0.008902123, -2.415966, 0, 1, 0.6509804, 1,
-0.1440066, 1.536106, 0.393224, 0, 1, 0.6588235, 1,
-0.14049, -0.4777511, -1.147465, 0, 1, 0.6627451, 1,
-0.136463, -0.1637856, -3.043686, 0, 1, 0.6705883, 1,
-0.1353756, 0.2342909, 0.1497581, 0, 1, 0.6745098, 1,
-0.1328585, -1.934953, -1.0662, 0, 1, 0.682353, 1,
-0.1318704, 0.4397123, 0.1603607, 0, 1, 0.6862745, 1,
-0.1308227, 0.7216848, -1.559536, 0, 1, 0.6941177, 1,
-0.1265826, 1.127975, 0.7730336, 0, 1, 0.7019608, 1,
-0.1258312, 0.05034678, -1.760633, 0, 1, 0.7058824, 1,
-0.1207452, 0.3165214, -1.542956, 0, 1, 0.7137255, 1,
-0.1202673, 0.4331743, -1.384637, 0, 1, 0.7176471, 1,
-0.1173323, -1.846409, -1.846001, 0, 1, 0.7254902, 1,
-0.1105943, -0.1618622, -2.146279, 0, 1, 0.7294118, 1,
-0.108587, -1.232367, -2.615819, 0, 1, 0.7372549, 1,
-0.1042845, 0.04319872, -2.480616, 0, 1, 0.7411765, 1,
-0.1042643, 1.375805, 0.09669647, 0, 1, 0.7490196, 1,
-0.09335396, 0.9507633, 0.8985798, 0, 1, 0.7529412, 1,
-0.09292237, 1.128608, -0.9364282, 0, 1, 0.7607843, 1,
-0.09052815, -0.5533083, -3.014472, 0, 1, 0.7647059, 1,
-0.08889055, 0.807956, 2.037374, 0, 1, 0.772549, 1,
-0.08847096, -0.01587738, -1.643868, 0, 1, 0.7764706, 1,
-0.08481028, -1.273596, -3.170506, 0, 1, 0.7843137, 1,
-0.08421897, -0.05675216, -0.9329885, 0, 1, 0.7882353, 1,
-0.08108842, -0.4765379, -3.062693, 0, 1, 0.7960784, 1,
-0.07951677, 0.3861004, 0.5660883, 0, 1, 0.8039216, 1,
-0.07869351, -0.1177511, -2.594058, 0, 1, 0.8078431, 1,
-0.0778469, 0.9207399, -0.2665502, 0, 1, 0.8156863, 1,
-0.07663562, -0.3964851, -2.835761, 0, 1, 0.8196079, 1,
-0.07579165, 0.4852278, -0.2597468, 0, 1, 0.827451, 1,
-0.07488563, -0.4691774, -3.638868, 0, 1, 0.8313726, 1,
-0.06237823, 2.094275, 0.6806481, 0, 1, 0.8392157, 1,
-0.06127526, 0.5862881, 0.754201, 0, 1, 0.8431373, 1,
-0.06097471, 1.426587, 0.2558131, 0, 1, 0.8509804, 1,
-0.06092778, 0.4377751, 0.6462603, 0, 1, 0.854902, 1,
-0.06056082, 1.524212, -1.262046, 0, 1, 0.8627451, 1,
-0.05671697, -0.6705835, -3.214194, 0, 1, 0.8666667, 1,
-0.0550291, -0.7296687, -3.396402, 0, 1, 0.8745098, 1,
-0.05276993, 1.444711, 0.2642449, 0, 1, 0.8784314, 1,
-0.04825886, 1.386546, 1.220893, 0, 1, 0.8862745, 1,
-0.04789782, -0.4591605, -4.3929, 0, 1, 0.8901961, 1,
-0.04368755, 0.5827698, 1.325647, 0, 1, 0.8980392, 1,
-0.03983119, -0.9074344, -2.444323, 0, 1, 0.9058824, 1,
-0.03637396, -0.3026139, -3.095495, 0, 1, 0.9098039, 1,
-0.03345487, -0.8572694, -3.54247, 0, 1, 0.9176471, 1,
-0.03267386, 0.07391698, 0.6278716, 0, 1, 0.9215686, 1,
-0.03177845, -1.978402, -2.651901, 0, 1, 0.9294118, 1,
-0.03114824, 0.8315047, 1.30533, 0, 1, 0.9333333, 1,
-0.02344123, -0.2522584, -3.994726, 0, 1, 0.9411765, 1,
-0.02211595, -1.088738, -5.242663, 0, 1, 0.945098, 1,
-0.02180153, 1.535229, 0.1469595, 0, 1, 0.9529412, 1,
-0.01793084, -1.728798, -4.132349, 0, 1, 0.9568627, 1,
-0.01679288, -0.0331122, -4.324642, 0, 1, 0.9647059, 1,
-0.01374317, -0.2613845, -3.247076, 0, 1, 0.9686275, 1,
-0.01240954, 0.7502813, -0.01674268, 0, 1, 0.9764706, 1,
-0.01181103, -0.4808177, -5.084987, 0, 1, 0.9803922, 1,
-0.01000556, -0.3643379, -1.76555, 0, 1, 0.9882353, 1,
-0.008575046, -0.8324558, -4.454915, 0, 1, 0.9921569, 1,
-0.007856503, 0.366952, 0.1618978, 0, 1, 1, 1,
-0.002665222, -0.6320283, -3.043665, 0, 0.9921569, 1, 1,
0.0006993203, 0.4029193, -0.6838397, 0, 0.9882353, 1, 1,
0.003960669, 1.196277, -0.7970909, 0, 0.9803922, 1, 1,
0.009129434, -0.4417604, 1.965441, 0, 0.9764706, 1, 1,
0.0102748, -1.84066, 3.840254, 0, 0.9686275, 1, 1,
0.01760418, -0.2613861, 1.47598, 0, 0.9647059, 1, 1,
0.01982558, -0.8883075, 3.498019, 0, 0.9568627, 1, 1,
0.02656588, 3.350942, 0.6396366, 0, 0.9529412, 1, 1,
0.02971436, -1.075539, 3.333969, 0, 0.945098, 1, 1,
0.03091551, -1.327644, 2.862145, 0, 0.9411765, 1, 1,
0.03575965, -1.365831, 2.785108, 0, 0.9333333, 1, 1,
0.03728047, -1.620359, 3.688025, 0, 0.9294118, 1, 1,
0.04423288, -0.399902, 4.171267, 0, 0.9215686, 1, 1,
0.04445852, 0.1406208, -0.6805224, 0, 0.9176471, 1, 1,
0.04521083, -3.465764, 1.587132, 0, 0.9098039, 1, 1,
0.04785834, 1.402794, 0.844741, 0, 0.9058824, 1, 1,
0.04792582, -0.5225995, 3.497723, 0, 0.8980392, 1, 1,
0.05163995, 1.080072, -0.7222793, 0, 0.8901961, 1, 1,
0.05310116, -0.3172914, 4.481934, 0, 0.8862745, 1, 1,
0.05463671, 1.341267, -0.4994188, 0, 0.8784314, 1, 1,
0.05887898, -0.0539781, 2.631013, 0, 0.8745098, 1, 1,
0.05938477, -1.155442, 2.892526, 0, 0.8666667, 1, 1,
0.06167103, 0.1842808, -1.839788, 0, 0.8627451, 1, 1,
0.06691471, -0.09271284, 2.8943, 0, 0.854902, 1, 1,
0.06945857, 1.614693, -0.8623155, 0, 0.8509804, 1, 1,
0.07124963, 1.940954, -0.1943083, 0, 0.8431373, 1, 1,
0.07372008, -0.2044807, 2.014752, 0, 0.8392157, 1, 1,
0.08381265, -0.8133531, 3.447429, 0, 0.8313726, 1, 1,
0.08594395, 0.7758625, 0.4919293, 0, 0.827451, 1, 1,
0.08856978, -1.748895, 1.785591, 0, 0.8196079, 1, 1,
0.0977132, -0.3332681, 2.860282, 0, 0.8156863, 1, 1,
0.1001931, 1.635116, 0.6985367, 0, 0.8078431, 1, 1,
0.1006884, 0.06957878, 3.092403, 0, 0.8039216, 1, 1,
0.1028112, -0.0988274, 4.276945, 0, 0.7960784, 1, 1,
0.1039883, 0.9803661, 1.919704, 0, 0.7882353, 1, 1,
0.1040448, 0.9892878, 1.759154, 0, 0.7843137, 1, 1,
0.1050534, -1.273952, 2.954171, 0, 0.7764706, 1, 1,
0.1087058, 0.1088144, 0.7763737, 0, 0.772549, 1, 1,
0.116208, -0.8382189, 3.153173, 0, 0.7647059, 1, 1,
0.1183327, -0.269136, 2.472802, 0, 0.7607843, 1, 1,
0.1203136, 1.262022, -0.4739949, 0, 0.7529412, 1, 1,
0.1203282, 1.176256, -0.07812154, 0, 0.7490196, 1, 1,
0.1206764, -1.133738, 3.875503, 0, 0.7411765, 1, 1,
0.1222656, 0.9830877, -0.190715, 0, 0.7372549, 1, 1,
0.1234389, -0.2399178, 3.329335, 0, 0.7294118, 1, 1,
0.1243225, -0.5327719, 2.064565, 0, 0.7254902, 1, 1,
0.1279947, 0.783522, -0.06803541, 0, 0.7176471, 1, 1,
0.1291087, 0.1192734, 0.5363579, 0, 0.7137255, 1, 1,
0.1328655, 0.3435279, 0.8971961, 0, 0.7058824, 1, 1,
0.1334521, -0.101503, 2.002771, 0, 0.6980392, 1, 1,
0.1353802, 1.124391, -1.506449, 0, 0.6941177, 1, 1,
0.137494, -0.9403022, 3.582246, 0, 0.6862745, 1, 1,
0.1400336, 0.7275505, -1.155773, 0, 0.682353, 1, 1,
0.1403892, 0.02145776, 2.247932, 0, 0.6745098, 1, 1,
0.1404249, -0.4750479, 2.166683, 0, 0.6705883, 1, 1,
0.1429531, 1.222508, -1.34058, 0, 0.6627451, 1, 1,
0.1494276, -1.378536, 2.618007, 0, 0.6588235, 1, 1,
0.153141, -0.8206404, 3.068182, 0, 0.6509804, 1, 1,
0.1535251, 1.461069, 0.7052631, 0, 0.6470588, 1, 1,
0.1562272, 0.1268903, 0.4177039, 0, 0.6392157, 1, 1,
0.157214, 0.6940008, 1.139379, 0, 0.6352941, 1, 1,
0.1615817, 0.73062, 0.8689609, 0, 0.627451, 1, 1,
0.1620338, -0.364742, 3.182014, 0, 0.6235294, 1, 1,
0.1645286, -0.7078128, 2.981825, 0, 0.6156863, 1, 1,
0.1663863, -0.9317114, 1.88901, 0, 0.6117647, 1, 1,
0.1668125, -0.1435371, 0.1865681, 0, 0.6039216, 1, 1,
0.1694509, 0.5620641, 1.187326, 0, 0.5960785, 1, 1,
0.1696793, 0.8182094, -1.047115, 0, 0.5921569, 1, 1,
0.1732093, 0.03723072, 0.8768357, 0, 0.5843138, 1, 1,
0.1734321, 1.285616, -0.5247921, 0, 0.5803922, 1, 1,
0.1737094, -0.6004701, 3.795816, 0, 0.572549, 1, 1,
0.1811613, 1.342858, -0.6990677, 0, 0.5686275, 1, 1,
0.1844289, -0.4763878, 2.912771, 0, 0.5607843, 1, 1,
0.1850603, -1.390976, 2.125925, 0, 0.5568628, 1, 1,
0.1859474, -0.2633379, 2.012927, 0, 0.5490196, 1, 1,
0.1877869, 1.247953, 0.3650807, 0, 0.5450981, 1, 1,
0.1923397, -0.799539, 3.844066, 0, 0.5372549, 1, 1,
0.194871, 0.4398174, 2.787318, 0, 0.5333334, 1, 1,
0.1953013, -0.338239, 1.220258, 0, 0.5254902, 1, 1,
0.1982881, 1.054581, -0.7754025, 0, 0.5215687, 1, 1,
0.1987289, 0.5938003, 1.145125, 0, 0.5137255, 1, 1,
0.1996294, 0.2661898, 1.2096, 0, 0.509804, 1, 1,
0.2013749, -0.5725505, 2.442966, 0, 0.5019608, 1, 1,
0.2021681, -0.06257642, 2.545763, 0, 0.4941176, 1, 1,
0.210677, 0.3789921, 0.4010812, 0, 0.4901961, 1, 1,
0.2130742, -0.2095298, 1.226515, 0, 0.4823529, 1, 1,
0.2159307, -0.523359, 3.714942, 0, 0.4784314, 1, 1,
0.2239907, 0.9703791, 1.080905, 0, 0.4705882, 1, 1,
0.2253896, -0.5272797, 3.955969, 0, 0.4666667, 1, 1,
0.2268973, 0.9359539, -2.072301, 0, 0.4588235, 1, 1,
0.2284082, -1.528258, 2.941384, 0, 0.454902, 1, 1,
0.2332686, -0.1655824, 0.04686078, 0, 0.4470588, 1, 1,
0.2385112, 1.188222, 0.09465043, 0, 0.4431373, 1, 1,
0.2394037, -0.8149385, 1.88648, 0, 0.4352941, 1, 1,
0.2456899, -0.02125066, -0.7723339, 0, 0.4313726, 1, 1,
0.2477202, -0.6730583, 4.450786, 0, 0.4235294, 1, 1,
0.2482985, 0.8783732, 0.0007917664, 0, 0.4196078, 1, 1,
0.248356, -0.9816869, 4.9095, 0, 0.4117647, 1, 1,
0.253581, -0.9210188, 2.943913, 0, 0.4078431, 1, 1,
0.2538468, -0.9012091, 0.9798279, 0, 0.4, 1, 1,
0.2671144, 0.942807, -0.4492255, 0, 0.3921569, 1, 1,
0.2693081, 0.9973963, 2.292932, 0, 0.3882353, 1, 1,
0.2701669, -0.4722199, 2.618032, 0, 0.3803922, 1, 1,
0.2736679, -0.40667, 2.332442, 0, 0.3764706, 1, 1,
0.2759178, 0.8307649, -0.3907953, 0, 0.3686275, 1, 1,
0.2769725, 1.1691, 2.176021, 0, 0.3647059, 1, 1,
0.2790928, -1.609066, 2.552069, 0, 0.3568628, 1, 1,
0.2839346, 0.1954337, 1.293546, 0, 0.3529412, 1, 1,
0.2880324, 1.926911, 0.00651554, 0, 0.345098, 1, 1,
0.288065, -0.5320728, 1.09852, 0, 0.3411765, 1, 1,
0.2927014, 0.121991, 0.01964633, 0, 0.3333333, 1, 1,
0.2943052, 0.9749519, -0.0715518, 0, 0.3294118, 1, 1,
0.2953608, -0.7967809, 2.225094, 0, 0.3215686, 1, 1,
0.2986267, 0.3654214, 1.118289, 0, 0.3176471, 1, 1,
0.3002688, -0.7193223, 3.905826, 0, 0.3098039, 1, 1,
0.3032163, -1.020371, 2.571449, 0, 0.3058824, 1, 1,
0.3104482, -0.8167087, 1.688111, 0, 0.2980392, 1, 1,
0.3105742, 1.461637, -0.5260842, 0, 0.2901961, 1, 1,
0.3145974, 0.01733077, 1.765472, 0, 0.2862745, 1, 1,
0.3178237, 0.5404708, 1.275451, 0, 0.2784314, 1, 1,
0.3188027, 1.817532, -0.134554, 0, 0.2745098, 1, 1,
0.325039, 0.07676786, 1.745352, 0, 0.2666667, 1, 1,
0.325372, 0.7033773, 0.4150344, 0, 0.2627451, 1, 1,
0.3265583, 0.8650638, 0.9001234, 0, 0.254902, 1, 1,
0.3281884, -0.6415157, 2.237464, 0, 0.2509804, 1, 1,
0.3282869, -0.5074377, 3.18548, 0, 0.2431373, 1, 1,
0.329193, 0.2715025, 1.022785, 0, 0.2392157, 1, 1,
0.3328048, -0.3390082, 1.831715, 0, 0.2313726, 1, 1,
0.3346191, 1.516616, 0.6971376, 0, 0.227451, 1, 1,
0.3364714, 2.05346, 0.1036258, 0, 0.2196078, 1, 1,
0.3414789, 2.16515, 0.7103748, 0, 0.2156863, 1, 1,
0.3438013, -1.107905, 2.466017, 0, 0.2078431, 1, 1,
0.3555534, -1.41421, 3.64693, 0, 0.2039216, 1, 1,
0.3559419, -0.8283983, 3.329253, 0, 0.1960784, 1, 1,
0.3580115, -2.024453, 4.213111, 0, 0.1882353, 1, 1,
0.3581885, 0.6562612, -0.08181701, 0, 0.1843137, 1, 1,
0.3691368, 0.4148462, -0.1978406, 0, 0.1764706, 1, 1,
0.3714771, 2.54399, -0.2302672, 0, 0.172549, 1, 1,
0.3804674, -0.1145444, 1.93683, 0, 0.1647059, 1, 1,
0.3824838, 1.56519, -0.5912666, 0, 0.1607843, 1, 1,
0.3884661, 1.75228, 0.08711673, 0, 0.1529412, 1, 1,
0.3897898, -2.832714, 4.931875, 0, 0.1490196, 1, 1,
0.3910582, -0.1746589, 1.892239, 0, 0.1411765, 1, 1,
0.3978334, 0.1451951, 2.666598, 0, 0.1372549, 1, 1,
0.3998745, -0.4983123, 2.89807, 0, 0.1294118, 1, 1,
0.4070484, 0.06765341, -0.05801602, 0, 0.1254902, 1, 1,
0.4091304, 0.02190591, -0.2997511, 0, 0.1176471, 1, 1,
0.4093294, 0.342423, 0.1595022, 0, 0.1137255, 1, 1,
0.4109561, 1.139484, 0.0770989, 0, 0.1058824, 1, 1,
0.4147712, 0.05463118, 0.03849724, 0, 0.09803922, 1, 1,
0.4173947, 1.716321, -0.7231082, 0, 0.09411765, 1, 1,
0.4183134, 0.06058573, 1.447624, 0, 0.08627451, 1, 1,
0.4216312, 0.6367435, 0.8976423, 0, 0.08235294, 1, 1,
0.4218173, 0.01403533, 1.865277, 0, 0.07450981, 1, 1,
0.4248707, -0.3170428, 0.9397534, 0, 0.07058824, 1, 1,
0.4255636, -0.4987969, 3.450506, 0, 0.0627451, 1, 1,
0.4313951, 0.7879155, 0.684544, 0, 0.05882353, 1, 1,
0.4316804, -0.3003227, 1.968803, 0, 0.05098039, 1, 1,
0.4339184, -0.6121987, 2.081671, 0, 0.04705882, 1, 1,
0.4376617, -1.083545, 3.212248, 0, 0.03921569, 1, 1,
0.4386646, 1.299603, -0.2916377, 0, 0.03529412, 1, 1,
0.4429702, -0.4606303, 0.04037645, 0, 0.02745098, 1, 1,
0.4441504, -0.06344836, 2.117807, 0, 0.02352941, 1, 1,
0.4465663, -0.7812882, 2.728595, 0, 0.01568628, 1, 1,
0.4474905, 0.7831661, 0.7074805, 0, 0.01176471, 1, 1,
0.454981, -1.078386, 2.154115, 0, 0.003921569, 1, 1,
0.4573332, -1.138113, 2.394513, 0.003921569, 0, 1, 1,
0.4616238, -0.8382648, 2.881505, 0.007843138, 0, 1, 1,
0.4628327, 0.2602322, 0.80511, 0.01568628, 0, 1, 1,
0.4629207, -0.05064836, 2.23641, 0.01960784, 0, 1, 1,
0.4629847, -0.9131074, 2.841964, 0.02745098, 0, 1, 1,
0.4660762, -0.7597903, 2.02561, 0.03137255, 0, 1, 1,
0.4721141, -0.5144182, 1.639246, 0.03921569, 0, 1, 1,
0.4824297, 0.6994534, 0.4934293, 0.04313726, 0, 1, 1,
0.4858518, -0.1848728, 2.919569, 0.05098039, 0, 1, 1,
0.4867232, 0.5441211, 0.3151469, 0.05490196, 0, 1, 1,
0.4880939, -0.4482417, 3.098948, 0.0627451, 0, 1, 1,
0.4885071, 0.7659641, 0.9751678, 0.06666667, 0, 1, 1,
0.4888881, -0.1900142, 3.542804, 0.07450981, 0, 1, 1,
0.4953186, -0.6777032, 2.217734, 0.07843138, 0, 1, 1,
0.4958792, 1.499333, 0.1380393, 0.08627451, 0, 1, 1,
0.4959194, -0.6243031, 2.154697, 0.09019608, 0, 1, 1,
0.4965232, 0.4002035, 1.536365, 0.09803922, 0, 1, 1,
0.4973547, 0.9490157, -0.04089554, 0.1058824, 0, 1, 1,
0.4985307, -0.7888287, 2.552107, 0.1098039, 0, 1, 1,
0.4985631, 0.9641404, -0.01708619, 0.1176471, 0, 1, 1,
0.5056823, -1.030633, 3.72084, 0.1215686, 0, 1, 1,
0.5083668, 0.9291613, -0.6496683, 0.1294118, 0, 1, 1,
0.5102617, -0.1400938, 3.668175, 0.1333333, 0, 1, 1,
0.515002, -0.5299777, 2.09549, 0.1411765, 0, 1, 1,
0.5162684, -0.4897042, 1.314608, 0.145098, 0, 1, 1,
0.5169932, 1.006524, 0.2371808, 0.1529412, 0, 1, 1,
0.5188193, -0.3257907, 0.7816552, 0.1568628, 0, 1, 1,
0.5215996, 0.7730891, 0.1311555, 0.1647059, 0, 1, 1,
0.5230322, -1.545059, 3.395268, 0.1686275, 0, 1, 1,
0.5234339, 0.4532492, 1.252224, 0.1764706, 0, 1, 1,
0.5237551, -0.4127966, 1.47722, 0.1803922, 0, 1, 1,
0.5240315, 0.8927028, -1.458524, 0.1882353, 0, 1, 1,
0.5291259, -0.3974839, 0.853894, 0.1921569, 0, 1, 1,
0.5348117, 0.3065259, 1.626727, 0.2, 0, 1, 1,
0.5366085, 0.9602013, 0.7774794, 0.2078431, 0, 1, 1,
0.5462332, -0.7666047, 3.364041, 0.2117647, 0, 1, 1,
0.5484, -1.218023, 3.15651, 0.2196078, 0, 1, 1,
0.5564325, 0.3010578, 1.357376, 0.2235294, 0, 1, 1,
0.5567533, -0.5194841, 2.007435, 0.2313726, 0, 1, 1,
0.5590671, 0.810529, 1.26623, 0.2352941, 0, 1, 1,
0.5659735, -0.6305914, -0.02213288, 0.2431373, 0, 1, 1,
0.5704144, -0.9121267, 2.26478, 0.2470588, 0, 1, 1,
0.5711725, -0.839911, 3.428684, 0.254902, 0, 1, 1,
0.5753215, -2.254243, 3.011056, 0.2588235, 0, 1, 1,
0.5769281, 0.5969589, 1.423327, 0.2666667, 0, 1, 1,
0.5783937, -1.177279, 2.696066, 0.2705882, 0, 1, 1,
0.5827528, -0.01015537, 1.465984, 0.2784314, 0, 1, 1,
0.5831189, -0.5659389, 3.101282, 0.282353, 0, 1, 1,
0.5831373, 0.3371221, 1.394777, 0.2901961, 0, 1, 1,
0.5850646, 1.637223, 0.3290086, 0.2941177, 0, 1, 1,
0.5894125, 0.617744, -0.06716478, 0.3019608, 0, 1, 1,
0.5954725, 0.5266046, 0.1693662, 0.3098039, 0, 1, 1,
0.5976983, -1.867689, 3.075781, 0.3137255, 0, 1, 1,
0.5990216, 0.6603613, 1.368324, 0.3215686, 0, 1, 1,
0.5990708, -0.5213632, 1.589213, 0.3254902, 0, 1, 1,
0.6008599, 0.3750992, 0.6554666, 0.3333333, 0, 1, 1,
0.6046388, 0.8286924, 2.040387, 0.3372549, 0, 1, 1,
0.6053718, -0.7010756, 1.135262, 0.345098, 0, 1, 1,
0.6069002, -0.7959298, 3.688529, 0.3490196, 0, 1, 1,
0.6142047, -0.8343765, 2.575552, 0.3568628, 0, 1, 1,
0.6195452, 1.137015, -0.5757366, 0.3607843, 0, 1, 1,
0.6204211, 0.6960699, -0.162388, 0.3686275, 0, 1, 1,
0.6338958, -0.07887153, 2.580214, 0.372549, 0, 1, 1,
0.6395757, 1.797578, 2.367785, 0.3803922, 0, 1, 1,
0.6399044, 0.2995329, 0.8006431, 0.3843137, 0, 1, 1,
0.6417392, -0.4329993, 2.332157, 0.3921569, 0, 1, 1,
0.6425811, -0.4906899, 1.753504, 0.3960784, 0, 1, 1,
0.6430437, 0.2463925, -0.2407075, 0.4039216, 0, 1, 1,
0.6461049, -0.3819603, 2.024036, 0.4117647, 0, 1, 1,
0.6473917, -1.636645, 2.704246, 0.4156863, 0, 1, 1,
0.647676, 0.01593106, 1.395063, 0.4235294, 0, 1, 1,
0.64771, -0.4861609, 2.000351, 0.427451, 0, 1, 1,
0.6734598, -1.152002, 2.210891, 0.4352941, 0, 1, 1,
0.6784769, 1.06678, -1.285, 0.4392157, 0, 1, 1,
0.6805106, -0.896992, 2.182677, 0.4470588, 0, 1, 1,
0.6812448, -0.2062887, 1.729579, 0.4509804, 0, 1, 1,
0.6866986, 0.1626927, 0.7875299, 0.4588235, 0, 1, 1,
0.6872602, 0.2550398, 0.9897589, 0.4627451, 0, 1, 1,
0.694341, 0.0002576719, 0.9922166, 0.4705882, 0, 1, 1,
0.6998725, -0.314512, 2.282511, 0.4745098, 0, 1, 1,
0.7001864, -0.02237671, 3.195189, 0.4823529, 0, 1, 1,
0.7028015, 1.353594, 1.510357, 0.4862745, 0, 1, 1,
0.704788, -0.03699112, 2.01695, 0.4941176, 0, 1, 1,
0.7101997, 0.9092517, 0.5560523, 0.5019608, 0, 1, 1,
0.7113134, 0.07911188, 1.336232, 0.5058824, 0, 1, 1,
0.7121287, 0.4842333, 0.4907192, 0.5137255, 0, 1, 1,
0.7129646, -0.5914937, 2.23614, 0.5176471, 0, 1, 1,
0.7166222, 0.599206, 1.433094, 0.5254902, 0, 1, 1,
0.717684, 0.8705994, 1.102306, 0.5294118, 0, 1, 1,
0.7265934, -0.754437, 5.404908, 0.5372549, 0, 1, 1,
0.7268062, -0.1008023, 0.8947733, 0.5411765, 0, 1, 1,
0.7285372, -0.7720874, 2.376727, 0.5490196, 0, 1, 1,
0.7302593, 1.470916, 0.08599275, 0.5529412, 0, 1, 1,
0.7397211, 0.7801399, 0.5871353, 0.5607843, 0, 1, 1,
0.7431797, 1.122408, -0.04000767, 0.5647059, 0, 1, 1,
0.7432172, -0.8920892, 1.810488, 0.572549, 0, 1, 1,
0.7486945, -1.092356, 3.536867, 0.5764706, 0, 1, 1,
0.7493002, -1.070191, 1.987699, 0.5843138, 0, 1, 1,
0.751098, 1.562235, -0.5688459, 0.5882353, 0, 1, 1,
0.7529159, -1.909057, 3.049693, 0.5960785, 0, 1, 1,
0.7533633, 1.457951, -1.211589, 0.6039216, 0, 1, 1,
0.757214, 0.2867783, 0.1834015, 0.6078432, 0, 1, 1,
0.7628123, -0.8254283, 3.0338, 0.6156863, 0, 1, 1,
0.764662, -1.488873, 3.688519, 0.6196079, 0, 1, 1,
0.7700654, -0.2898006, 1.52686, 0.627451, 0, 1, 1,
0.7726463, -1.15326, 3.826792, 0.6313726, 0, 1, 1,
0.7739893, -0.04385941, 2.951483, 0.6392157, 0, 1, 1,
0.7747989, -0.9550461, 1.511566, 0.6431373, 0, 1, 1,
0.7764313, 1.186434, 1.002028, 0.6509804, 0, 1, 1,
0.7804207, 1.151007, -0.1656734, 0.654902, 0, 1, 1,
0.7836722, 0.3199986, 1.939852, 0.6627451, 0, 1, 1,
0.7881539, 1.430154, -0.440369, 0.6666667, 0, 1, 1,
0.791375, 1.08913, 2.863699, 0.6745098, 0, 1, 1,
0.7924442, -0.0291039, 2.242193, 0.6784314, 0, 1, 1,
0.7930983, -0.5006785, 2.586195, 0.6862745, 0, 1, 1,
0.7947877, 0.2616385, 1.629565, 0.6901961, 0, 1, 1,
0.7971795, -0.7648638, 1.668584, 0.6980392, 0, 1, 1,
0.7984141, -1.914553, 1.33131, 0.7058824, 0, 1, 1,
0.7990594, -1.025207, 1.218295, 0.7098039, 0, 1, 1,
0.8012387, -0.3180002, 3.015685, 0.7176471, 0, 1, 1,
0.8017701, 1.690752, -1.342476, 0.7215686, 0, 1, 1,
0.8039442, 0.9111646, 0.1199137, 0.7294118, 0, 1, 1,
0.80478, 0.7037643, -0.4148118, 0.7333333, 0, 1, 1,
0.8061209, -1.161988, 4.226781, 0.7411765, 0, 1, 1,
0.8098093, 0.9150715, -0.7575585, 0.7450981, 0, 1, 1,
0.8137388, -0.4802251, 1.889034, 0.7529412, 0, 1, 1,
0.8141658, 0.0222767, 1.502663, 0.7568628, 0, 1, 1,
0.8195621, -1.617929, 3.765698, 0.7647059, 0, 1, 1,
0.8210107, -0.5666375, 1.882765, 0.7686275, 0, 1, 1,
0.8261414, 1.101116, 0.4072783, 0.7764706, 0, 1, 1,
0.8290504, 0.1584472, 1.857815, 0.7803922, 0, 1, 1,
0.8318374, 0.1222158, 1.4457, 0.7882353, 0, 1, 1,
0.8399616, 1.715295, 0.3510754, 0.7921569, 0, 1, 1,
0.8404424, 0.1612628, 0.7056618, 0.8, 0, 1, 1,
0.8577945, 1.040473, 0.6262239, 0.8078431, 0, 1, 1,
0.8663332, 1.319981, 0.6134877, 0.8117647, 0, 1, 1,
0.8701866, 2.482344, -0.3487464, 0.8196079, 0, 1, 1,
0.8783212, 1.02489, 0.2410111, 0.8235294, 0, 1, 1,
0.8871312, 0.6570112, -0.01668037, 0.8313726, 0, 1, 1,
0.8881713, 1.848402, -0.3803641, 0.8352941, 0, 1, 1,
0.8916422, -0.4218333, 2.060567, 0.8431373, 0, 1, 1,
0.9062594, -0.8469174, 3.300308, 0.8470588, 0, 1, 1,
0.9106485, 0.06378572, 1.424799, 0.854902, 0, 1, 1,
0.9121259, 1.216697, 0.2488846, 0.8588235, 0, 1, 1,
0.92633, -0.1144647, 0.2142702, 0.8666667, 0, 1, 1,
0.9365676, -0.5981979, 3.573873, 0.8705882, 0, 1, 1,
0.942284, 0.2203078, 0.5866184, 0.8784314, 0, 1, 1,
0.9481282, 0.07966696, 2.185929, 0.8823529, 0, 1, 1,
0.9587706, -2.110805, 1.712576, 0.8901961, 0, 1, 1,
0.959193, 2.470392, -0.3714535, 0.8941177, 0, 1, 1,
0.9617742, 0.7069107, 1.895195, 0.9019608, 0, 1, 1,
0.9649198, -0.7071205, 3.387096, 0.9098039, 0, 1, 1,
0.9650229, 1.82054, 0.07653963, 0.9137255, 0, 1, 1,
0.9717319, -0.4010212, 1.950068, 0.9215686, 0, 1, 1,
0.9719211, 0.6330076, 0.7603099, 0.9254902, 0, 1, 1,
0.9762251, 0.2650739, 1.942657, 0.9333333, 0, 1, 1,
0.9796032, 0.5412965, 0.6923872, 0.9372549, 0, 1, 1,
0.9835497, 0.3125445, 0.3589708, 0.945098, 0, 1, 1,
0.9922534, 0.9036703, 0.4185582, 0.9490196, 0, 1, 1,
0.9939182, 1.161962, 1.869585, 0.9568627, 0, 1, 1,
0.9980398, -0.143842, 1.704382, 0.9607843, 0, 1, 1,
1.003192, -0.5755101, 2.248549, 0.9686275, 0, 1, 1,
1.004908, 0.7814706, 0.7583804, 0.972549, 0, 1, 1,
1.018101, 1.512111, 1.937703, 0.9803922, 0, 1, 1,
1.019423, -1.379467, 2.465003, 0.9843137, 0, 1, 1,
1.023638, 0.06522319, 1.827475, 0.9921569, 0, 1, 1,
1.026714, -0.1209217, 1.06475, 0.9960784, 0, 1, 1,
1.028997, 0.237417, 0.3407997, 1, 0, 0.9960784, 1,
1.030416, -1.801014, 2.711684, 1, 0, 0.9882353, 1,
1.033926, 1.425475, -1.927204, 1, 0, 0.9843137, 1,
1.034208, -0.9226809, 2.223306, 1, 0, 0.9764706, 1,
1.036952, 2.225626, 2.424022, 1, 0, 0.972549, 1,
1.041563, 0.01925953, 1.324296, 1, 0, 0.9647059, 1,
1.043497, -0.4442607, 1.455026, 1, 0, 0.9607843, 1,
1.049402, 0.6244799, 2.722836, 1, 0, 0.9529412, 1,
1.05362, 0.6584933, 1.022969, 1, 0, 0.9490196, 1,
1.055292, 0.05635802, 2.070223, 1, 0, 0.9411765, 1,
1.055308, -1.548206, 1.628527, 1, 0, 0.9372549, 1,
1.057903, -0.10236, 2.121395, 1, 0, 0.9294118, 1,
1.058743, 0.4752259, -0.06269751, 1, 0, 0.9254902, 1,
1.065403, 1.380591, -0.5526619, 1, 0, 0.9176471, 1,
1.07747, 0.4578394, -0.4766707, 1, 0, 0.9137255, 1,
1.082921, 0.08216093, 0.7213451, 1, 0, 0.9058824, 1,
1.084707, -2.336986, 2.493272, 1, 0, 0.9019608, 1,
1.084863, -1.280044, 3.988378, 1, 0, 0.8941177, 1,
1.102479, -0.4396673, 3.184798, 1, 0, 0.8862745, 1,
1.105905, -0.3027083, 2.661125, 1, 0, 0.8823529, 1,
1.106166, -0.3918594, 2.453091, 1, 0, 0.8745098, 1,
1.109168, 1.410608, -0.01072317, 1, 0, 0.8705882, 1,
1.109777, 0.2451379, 0.6503137, 1, 0, 0.8627451, 1,
1.111348, -1.183933, 2.049453, 1, 0, 0.8588235, 1,
1.113783, 0.3148744, -0.2616438, 1, 0, 0.8509804, 1,
1.115478, 0.2888345, 2.230533, 1, 0, 0.8470588, 1,
1.117894, 0.7253373, 1.005479, 1, 0, 0.8392157, 1,
1.121885, 0.2671468, 2.231126, 1, 0, 0.8352941, 1,
1.140576, -0.3184897, 0.8361765, 1, 0, 0.827451, 1,
1.140786, -1.412209, 2.021495, 1, 0, 0.8235294, 1,
1.143257, 0.6622485, -0.2327937, 1, 0, 0.8156863, 1,
1.148752, -0.1280282, 1.300492, 1, 0, 0.8117647, 1,
1.150807, -0.6376821, 2.507495, 1, 0, 0.8039216, 1,
1.154054, -0.1255421, 2.895916, 1, 0, 0.7960784, 1,
1.161061, 1.143453, 1.165646, 1, 0, 0.7921569, 1,
1.162509, -0.9130421, 3.967692, 1, 0, 0.7843137, 1,
1.168173, -0.8656602, 1.175917, 1, 0, 0.7803922, 1,
1.168461, -0.3154348, 1.985373, 1, 0, 0.772549, 1,
1.171129, 2.28183, -0.1710747, 1, 0, 0.7686275, 1,
1.171811, 0.8869586, -0.5481064, 1, 0, 0.7607843, 1,
1.172596, 0.5858002, 2.37412, 1, 0, 0.7568628, 1,
1.173972, 2.488941, 1.389621, 1, 0, 0.7490196, 1,
1.177481, 0.6861278, 2.037966, 1, 0, 0.7450981, 1,
1.180522, 0.2364451, 3.214683, 1, 0, 0.7372549, 1,
1.180833, 0.3939019, 0.7662804, 1, 0, 0.7333333, 1,
1.18288, 0.8248435, 1.955187, 1, 0, 0.7254902, 1,
1.187676, 1.101667, 1.332866, 1, 0, 0.7215686, 1,
1.189033, 0.6690797, 1.948323, 1, 0, 0.7137255, 1,
1.208062, -1.221392, 1.358235, 1, 0, 0.7098039, 1,
1.211477, -0.7557536, 1.902285, 1, 0, 0.7019608, 1,
1.220362, -0.1613557, 1.242079, 1, 0, 0.6941177, 1,
1.221815, -1.10498, 2.362841, 1, 0, 0.6901961, 1,
1.232213, -1.453966, 1.022091, 1, 0, 0.682353, 1,
1.234494, -2.153275, 3.342755, 1, 0, 0.6784314, 1,
1.235556, 1.485723, 0.3890569, 1, 0, 0.6705883, 1,
1.241169, 0.1047367, 1.851952, 1, 0, 0.6666667, 1,
1.245289, 0.4490562, 1.099286, 1, 0, 0.6588235, 1,
1.254945, 0.0006722907, 1.293054, 1, 0, 0.654902, 1,
1.263993, -1.264273, 2.708894, 1, 0, 0.6470588, 1,
1.266192, -1.894247, 2.665277, 1, 0, 0.6431373, 1,
1.266606, -0.5085168, 2.131988, 1, 0, 0.6352941, 1,
1.267723, 0.5344365, 2.45937, 1, 0, 0.6313726, 1,
1.285586, 0.04508764, 1.099145, 1, 0, 0.6235294, 1,
1.292241, 0.683172, 1.324004, 1, 0, 0.6196079, 1,
1.292405, 0.05833857, 0.1963527, 1, 0, 0.6117647, 1,
1.297936, -1.656091, 0.846635, 1, 0, 0.6078432, 1,
1.303212, 0.08817285, 0.947984, 1, 0, 0.6, 1,
1.305671, 0.4745927, 1.692096, 1, 0, 0.5921569, 1,
1.310249, 1.077039, 1.421959, 1, 0, 0.5882353, 1,
1.315061, 0.8506895, 0.8794852, 1, 0, 0.5803922, 1,
1.32421, -0.7482241, 2.573646, 1, 0, 0.5764706, 1,
1.327386, 0.1876383, 2.684519, 1, 0, 0.5686275, 1,
1.329022, -0.4465042, 1.12195, 1, 0, 0.5647059, 1,
1.332676, 0.9583489, 1.323852, 1, 0, 0.5568628, 1,
1.334699, -0.3948814, 3.309313, 1, 0, 0.5529412, 1,
1.336416, -0.6049474, 0.9200044, 1, 0, 0.5450981, 1,
1.338098, 0.4905604, 2.238308, 1, 0, 0.5411765, 1,
1.341282, -0.09442533, 1.223718, 1, 0, 0.5333334, 1,
1.347868, 0.4748214, 1.941938, 1, 0, 0.5294118, 1,
1.348128, -0.1264461, 3.085408, 1, 0, 0.5215687, 1,
1.363896, 0.6925398, 0.7979724, 1, 0, 0.5176471, 1,
1.366277, 0.03809471, 2.045682, 1, 0, 0.509804, 1,
1.367757, 0.1611826, 1.604914, 1, 0, 0.5058824, 1,
1.373163, 0.5772364, 1.626388, 1, 0, 0.4980392, 1,
1.378363, 1.793753, 0.9980023, 1, 0, 0.4901961, 1,
1.387049, 0.4340255, 2.936153, 1, 0, 0.4862745, 1,
1.387181, -0.08780474, 0.6962775, 1, 0, 0.4784314, 1,
1.395356, -0.6625135, 3.17524, 1, 0, 0.4745098, 1,
1.399434, 1.433766, 0.7934706, 1, 0, 0.4666667, 1,
1.400191, -0.6230406, 3.551963, 1, 0, 0.4627451, 1,
1.411949, -1.389479, 1.808006, 1, 0, 0.454902, 1,
1.417091, -1.968375, 1.784055, 1, 0, 0.4509804, 1,
1.429613, -0.0246128, 1.26587, 1, 0, 0.4431373, 1,
1.445507, -0.3994324, 0.2890141, 1, 0, 0.4392157, 1,
1.469411, -0.7475819, 3.675526, 1, 0, 0.4313726, 1,
1.48207, 0.08438484, 2.791639, 1, 0, 0.427451, 1,
1.503238, -0.5221712, 2.8897, 1, 0, 0.4196078, 1,
1.50428, 0.2823583, 3.334832, 1, 0, 0.4156863, 1,
1.507394, 0.02380618, 1.809089, 1, 0, 0.4078431, 1,
1.517174, 0.3058054, 2.058217, 1, 0, 0.4039216, 1,
1.518528, -1.128208, 2.324433, 1, 0, 0.3960784, 1,
1.519303, -1.692859, 2.524167, 1, 0, 0.3882353, 1,
1.526754, 0.1973886, -0.3599211, 1, 0, 0.3843137, 1,
1.529009, -1.457645, 1.08812, 1, 0, 0.3764706, 1,
1.533077, 0.9050503, 0.9816343, 1, 0, 0.372549, 1,
1.54175, -0.3617146, 1.14279, 1, 0, 0.3647059, 1,
1.542072, -0.05600383, 0.953397, 1, 0, 0.3607843, 1,
1.544824, -1.21952, 1.406099, 1, 0, 0.3529412, 1,
1.588293, 1.086875, 1.473176, 1, 0, 0.3490196, 1,
1.592508, 1.119654, -0.6034392, 1, 0, 0.3411765, 1,
1.596197, 0.09165663, 1.679271, 1, 0, 0.3372549, 1,
1.60209, 0.2204653, 1.136528, 1, 0, 0.3294118, 1,
1.60416, 0.3641025, 2.027193, 1, 0, 0.3254902, 1,
1.651645, 0.7549534, 0.3982919, 1, 0, 0.3176471, 1,
1.652354, 1.505343, 0.6526822, 1, 0, 0.3137255, 1,
1.663082, 0.4757134, 1.836406, 1, 0, 0.3058824, 1,
1.681364, -1.176661, 2.855423, 1, 0, 0.2980392, 1,
1.684747, 0.6782223, 0.5597046, 1, 0, 0.2941177, 1,
1.688251, -0.8770316, 2.651996, 1, 0, 0.2862745, 1,
1.699955, 0.2597727, 0.5587012, 1, 0, 0.282353, 1,
1.700242, -0.8035955, 1.746659, 1, 0, 0.2745098, 1,
1.701991, -0.1199881, 2.01557, 1, 0, 0.2705882, 1,
1.714, -0.1140062, 2.116443, 1, 0, 0.2627451, 1,
1.718989, 0.7588255, 3.754017, 1, 0, 0.2588235, 1,
1.738143, 1.225574, 0.6183602, 1, 0, 0.2509804, 1,
1.779856, -0.9446589, 2.250068, 1, 0, 0.2470588, 1,
1.78725, 2.641353, 1.171636, 1, 0, 0.2392157, 1,
1.795572, 1.282519, 2.012225, 1, 0, 0.2352941, 1,
1.802106, -1.537618, 1.809891, 1, 0, 0.227451, 1,
1.823902, 1.579355, 2.81415, 1, 0, 0.2235294, 1,
1.860177, 0.5421876, 0.2396857, 1, 0, 0.2156863, 1,
1.86498, 1.370764, 1.964574, 1, 0, 0.2117647, 1,
1.870692, 2.716261, 0.7722105, 1, 0, 0.2039216, 1,
1.879755, -1.645706, 3.376439, 1, 0, 0.1960784, 1,
1.892029, 2.148268, -0.137388, 1, 0, 0.1921569, 1,
1.904737, 0.6747672, 0.001040662, 1, 0, 0.1843137, 1,
1.924678, -0.4406261, 3.205021, 1, 0, 0.1803922, 1,
1.933267, 0.2172145, 2.143113, 1, 0, 0.172549, 1,
1.964582, -0.02508611, 1.826114, 1, 0, 0.1686275, 1,
1.981734, -0.4805259, 0.5514586, 1, 0, 0.1607843, 1,
2.005003, -1.200722, 2.389569, 1, 0, 0.1568628, 1,
2.026322, -1.626637, 1.268156, 1, 0, 0.1490196, 1,
2.050808, 0.8149955, 1.344662, 1, 0, 0.145098, 1,
2.066765, 0.5381915, 1.453762, 1, 0, 0.1372549, 1,
2.072014, 1.406538, 2.766768, 1, 0, 0.1333333, 1,
2.093673, -0.6761383, 2.938143, 1, 0, 0.1254902, 1,
2.12756, -1.009359, 2.96184, 1, 0, 0.1215686, 1,
2.135016, -0.7027554, 1.265501, 1, 0, 0.1137255, 1,
2.155342, -0.07049116, -0.6189018, 1, 0, 0.1098039, 1,
2.17348, -0.8129424, 1.762111, 1, 0, 0.1019608, 1,
2.260646, -0.06963982, 1.070947, 1, 0, 0.09411765, 1,
2.313031, -0.6184084, 2.103456, 1, 0, 0.09019608, 1,
2.358503, -0.4684095, 1.003712, 1, 0, 0.08235294, 1,
2.371891, 1.012557, 0.0670603, 1, 0, 0.07843138, 1,
2.375668, 1.473752, 2.385916, 1, 0, 0.07058824, 1,
2.405617, 1.0041, 0.8677853, 1, 0, 0.06666667, 1,
2.414208, 0.2568243, 2.48653, 1, 0, 0.05882353, 1,
2.418977, 0.334242, 3.790368, 1, 0, 0.05490196, 1,
2.422424, 0.8880482, 1.402071, 1, 0, 0.04705882, 1,
2.474901, 0.5882018, 1.698158, 1, 0, 0.04313726, 1,
2.493904, -1.318647, 2.991505, 1, 0, 0.03529412, 1,
2.564015, 1.115507, 1.682661, 1, 0, 0.03137255, 1,
2.604389, 0.356328, 1.692863, 1, 0, 0.02352941, 1,
2.639034, -0.9480906, 1.316221, 1, 0, 0.01960784, 1,
3.063235, -0.3442851, 1.474904, 1, 0, 0.01176471, 1,
3.298083, -0.4621705, 2.364203, 1, 0, 0.007843138, 1
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
0.06910765, -4.621196, -7.047426, 0, -0.5, 0.5, 0.5,
0.06910765, -4.621196, -7.047426, 1, -0.5, 0.5, 0.5,
0.06910765, -4.621196, -7.047426, 1, 1.5, 0.5, 0.5,
0.06910765, -4.621196, -7.047426, 0, 1.5, 0.5, 0.5
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
-4.25449, -0.05741096, -7.047426, 0, -0.5, 0.5, 0.5,
-4.25449, -0.05741096, -7.047426, 1, -0.5, 0.5, 0.5,
-4.25449, -0.05741096, -7.047426, 1, 1.5, 0.5, 0.5,
-4.25449, -0.05741096, -7.047426, 0, 1.5, 0.5, 0.5
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
-4.25449, -4.621196, 0.08112264, 0, -0.5, 0.5, 0.5,
-4.25449, -4.621196, 0.08112264, 1, -0.5, 0.5, 0.5,
-4.25449, -4.621196, 0.08112264, 1, 1.5, 0.5, 0.5,
-4.25449, -4.621196, 0.08112264, 0, 1.5, 0.5, 0.5
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
-3, -3.568015, -5.402377,
3, -3.568015, -5.402377,
-3, -3.568015, -5.402377,
-3, -3.743545, -5.676551,
-2, -3.568015, -5.402377,
-2, -3.743545, -5.676551,
-1, -3.568015, -5.402377,
-1, -3.743545, -5.676551,
0, -3.568015, -5.402377,
0, -3.743545, -5.676551,
1, -3.568015, -5.402377,
1, -3.743545, -5.676551,
2, -3.568015, -5.402377,
2, -3.743545, -5.676551,
3, -3.568015, -5.402377,
3, -3.743545, -5.676551
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
-3, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
-3, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
-3, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
-3, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
-2, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
-2, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
-2, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
-2, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
-1, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
-1, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
-1, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
-1, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
0, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
0, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
0, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
0, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
1, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
1, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
1, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
1, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
2, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
2, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
2, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
2, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5,
3, -4.094605, -6.224901, 0, -0.5, 0.5, 0.5,
3, -4.094605, -6.224901, 1, -0.5, 0.5, 0.5,
3, -4.094605, -6.224901, 1, 1.5, 0.5, 0.5,
3, -4.094605, -6.224901, 0, 1.5, 0.5, 0.5
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
-3.256737, -3, -5.402377,
-3.256737, 3, -5.402377,
-3.256737, -3, -5.402377,
-3.423029, -3, -5.676551,
-3.256737, -2, -5.402377,
-3.423029, -2, -5.676551,
-3.256737, -1, -5.402377,
-3.423029, -1, -5.676551,
-3.256737, 0, -5.402377,
-3.423029, 0, -5.676551,
-3.256737, 1, -5.402377,
-3.423029, 1, -5.676551,
-3.256737, 2, -5.402377,
-3.423029, 2, -5.676551,
-3.256737, 3, -5.402377,
-3.423029, 3, -5.676551
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
-3.755613, -3, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, -3, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, -3, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, -3, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, -2, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, -2, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, -2, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, -2, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, -1, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, -1, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, -1, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, -1, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, 0, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, 0, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, 0, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, 0, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, 1, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, 1, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, 1, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, 1, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, 2, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, 2, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, 2, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, 2, -6.224901, 0, 1.5, 0.5, 0.5,
-3.755613, 3, -6.224901, 0, -0.5, 0.5, 0.5,
-3.755613, 3, -6.224901, 1, -0.5, 0.5, 0.5,
-3.755613, 3, -6.224901, 1, 1.5, 0.5, 0.5,
-3.755613, 3, -6.224901, 0, 1.5, 0.5, 0.5
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
-3.256737, -3.568015, -4,
-3.256737, -3.568015, 4,
-3.256737, -3.568015, -4,
-3.423029, -3.743545, -4,
-3.256737, -3.568015, -2,
-3.423029, -3.743545, -2,
-3.256737, -3.568015, 0,
-3.423029, -3.743545, 0,
-3.256737, -3.568015, 2,
-3.423029, -3.743545, 2,
-3.256737, -3.568015, 4,
-3.423029, -3.743545, 4
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
-3.755613, -4.094605, -4, 0, -0.5, 0.5, 0.5,
-3.755613, -4.094605, -4, 1, -0.5, 0.5, 0.5,
-3.755613, -4.094605, -4, 1, 1.5, 0.5, 0.5,
-3.755613, -4.094605, -4, 0, 1.5, 0.5, 0.5,
-3.755613, -4.094605, -2, 0, -0.5, 0.5, 0.5,
-3.755613, -4.094605, -2, 1, -0.5, 0.5, 0.5,
-3.755613, -4.094605, -2, 1, 1.5, 0.5, 0.5,
-3.755613, -4.094605, -2, 0, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 0, 0, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 0, 1, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 0, 1, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 0, 0, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 2, 0, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 2, 1, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 2, 1, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 2, 0, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 4, 0, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 4, 1, -0.5, 0.5, 0.5,
-3.755613, -4.094605, 4, 1, 1.5, 0.5, 0.5,
-3.755613, -4.094605, 4, 0, 1.5, 0.5, 0.5
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
-3.256737, -3.568015, -5.402377,
-3.256737, 3.453193, -5.402377,
-3.256737, -3.568015, 5.564622,
-3.256737, 3.453193, 5.564622,
-3.256737, -3.568015, -5.402377,
-3.256737, -3.568015, 5.564622,
-3.256737, 3.453193, -5.402377,
-3.256737, 3.453193, 5.564622,
-3.256737, -3.568015, -5.402377,
3.394952, -3.568015, -5.402377,
-3.256737, -3.568015, 5.564622,
3.394952, -3.568015, 5.564622,
-3.256737, 3.453193, -5.402377,
3.394952, 3.453193, -5.402377,
-3.256737, 3.453193, 5.564622,
3.394952, 3.453193, 5.564622,
3.394952, -3.568015, -5.402377,
3.394952, 3.453193, -5.402377,
3.394952, -3.568015, 5.564622,
3.394952, 3.453193, 5.564622,
3.394952, -3.568015, -5.402377,
3.394952, -3.568015, 5.564622,
3.394952, 3.453193, -5.402377,
3.394952, 3.453193, 5.564622
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
var radius = 7.808129;
var distance = 34.73925;
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
mvMatrix.translate( -0.06910765, 0.05741096, -0.08112264 );
mvMatrix.scale( 1.269197, 1.2024, 0.7697915 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73925);
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
flonicamid<-read.table("flonicamid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flonicamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
```

```r
y<-flonicamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
```

```r
z<-flonicamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'flonicamid' not found
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
-3.159868, 0.7444392, -1.604933, 0, 0, 1, 1, 1,
-3.053293, -0.9407507, -2.679301, 1, 0, 0, 1, 1,
-2.898366, 2.029624, -1.051791, 1, 0, 0, 1, 1,
-2.749283, 1.889155, -0.3670598, 1, 0, 0, 1, 1,
-2.574471, -0.4800364, -2.735617, 1, 0, 0, 1, 1,
-2.526432, -0.2160807, -2.094357, 1, 0, 0, 1, 1,
-2.435379, -0.6753137, -1.88116, 0, 0, 0, 1, 1,
-2.336139, -1.100468, -1.148111, 0, 0, 0, 1, 1,
-2.314864, 1.851617, -0.9043309, 0, 0, 0, 1, 1,
-2.313911, 1.413365, -0.005033738, 0, 0, 0, 1, 1,
-2.207014, -0.3383782, -0.9220751, 0, 0, 0, 1, 1,
-2.197306, -0.2648542, -2.144778, 0, 0, 0, 1, 1,
-2.173747, 1.452124, -0.9843619, 0, 0, 0, 1, 1,
-2.170958, 0.9012917, -0.8823404, 1, 1, 1, 1, 1,
-2.167241, 0.1899009, -1.805827, 1, 1, 1, 1, 1,
-2.106678, -0.661088, -1.238243, 1, 1, 1, 1, 1,
-2.081354, -0.3332302, -3.302213, 1, 1, 1, 1, 1,
-2.065757, 1.171528, -2.759778, 1, 1, 1, 1, 1,
-2.025563, -1.654812, -1.744396, 1, 1, 1, 1, 1,
-2.021962, -0.7258668, -1.880776, 1, 1, 1, 1, 1,
-1.986248, 0.2970549, -2.182527, 1, 1, 1, 1, 1,
-1.946038, 0.2160768, -2.038945, 1, 1, 1, 1, 1,
-1.922569, 0.9902249, -0.8017375, 1, 1, 1, 1, 1,
-1.914158, 2.46525, -1.141723, 1, 1, 1, 1, 1,
-1.907751, -0.02849913, -4.037825, 1, 1, 1, 1, 1,
-1.863767, -0.7144978, -0.7870407, 1, 1, 1, 1, 1,
-1.858426, -0.03430777, -2.627413, 1, 1, 1, 1, 1,
-1.811478, 0.1523545, 0.05256775, 1, 1, 1, 1, 1,
-1.801016, -2.285384, -3.314287, 0, 0, 1, 1, 1,
-1.78256, -2.121823, -2.119948, 1, 0, 0, 1, 1,
-1.739358, -0.6451935, -2.232552, 1, 0, 0, 1, 1,
-1.733766, -1.350168, -2.752812, 1, 0, 0, 1, 1,
-1.708116, 1.162442, -2.676262, 1, 0, 0, 1, 1,
-1.695227, -2.17161, -2.213546, 1, 0, 0, 1, 1,
-1.68986, 0.7055078, -2.430303, 0, 0, 0, 1, 1,
-1.685337, -0.3915481, -2.222375, 0, 0, 0, 1, 1,
-1.684206, 0.1902064, -2.796802, 0, 0, 0, 1, 1,
-1.659053, -1.063884, -0.05094794, 0, 0, 0, 1, 1,
-1.653984, 0.6659878, -0.7890353, 0, 0, 0, 1, 1,
-1.650025, -0.4501248, -0.736486, 0, 0, 0, 1, 1,
-1.646906, 0.7116503, 0.6217273, 0, 0, 0, 1, 1,
-1.623324, -1.335257, -3.451274, 1, 1, 1, 1, 1,
-1.619006, -0.6387289, -1.664157, 1, 1, 1, 1, 1,
-1.617654, -1.589942, -2.84321, 1, 1, 1, 1, 1,
-1.614749, -0.0278607, -0.4837463, 1, 1, 1, 1, 1,
-1.612279, 0.3887049, -1.911169, 1, 1, 1, 1, 1,
-1.60505, 0.5592861, -0.5624699, 1, 1, 1, 1, 1,
-1.602535, 0.01267599, -1.680811, 1, 1, 1, 1, 1,
-1.59696, -0.6618838, 0.1400494, 1, 1, 1, 1, 1,
-1.592418, 1.777806, -1.222383, 1, 1, 1, 1, 1,
-1.577816, 1.154885, -0.06580516, 1, 1, 1, 1, 1,
-1.554561, 0.9919525, -1.154126, 1, 1, 1, 1, 1,
-1.549314, 0.5128111, -0.6827787, 1, 1, 1, 1, 1,
-1.547504, -0.9206568, -1.379974, 1, 1, 1, 1, 1,
-1.533972, 0.2880302, -2.274168, 1, 1, 1, 1, 1,
-1.533305, -0.02219958, -2.643307, 1, 1, 1, 1, 1,
-1.523122, -1.141591, -3.043941, 0, 0, 1, 1, 1,
-1.521193, -0.879257, -2.838758, 1, 0, 0, 1, 1,
-1.517557, 0.2072647, -0.8244212, 1, 0, 0, 1, 1,
-1.510513, 0.640504, -0.3867081, 1, 0, 0, 1, 1,
-1.510345, 1.184868, -1.289187, 1, 0, 0, 1, 1,
-1.483497, 0.9828512, -0.3654974, 1, 0, 0, 1, 1,
-1.464512, 0.2955071, -0.3007455, 0, 0, 0, 1, 1,
-1.464471, -0.07487944, -1.479192, 0, 0, 0, 1, 1,
-1.457629, -0.2740507, -1.799887, 0, 0, 0, 1, 1,
-1.439849, 2.40652, -0.8065445, 0, 0, 0, 1, 1,
-1.414251, -0.2284033, -2.723159, 0, 0, 0, 1, 1,
-1.413794, 0.01159973, -1.699302, 0, 0, 0, 1, 1,
-1.410248, 1.352313, -1.366251, 0, 0, 0, 1, 1,
-1.408648, -1.65121, -2.635433, 1, 1, 1, 1, 1,
-1.391537, 0.2041478, -1.517913, 1, 1, 1, 1, 1,
-1.387267, 0.9310633, -0.3406518, 1, 1, 1, 1, 1,
-1.381789, -0.8698955, -2.989696, 1, 1, 1, 1, 1,
-1.372964, -0.1575255, -1.069142, 1, 1, 1, 1, 1,
-1.370831, -0.7808521, -2.308497, 1, 1, 1, 1, 1,
-1.369306, -0.7396979, -1.135015, 1, 1, 1, 1, 1,
-1.366985, -2.39772, -3.704258, 1, 1, 1, 1, 1,
-1.364107, -0.3604563, -2.339911, 1, 1, 1, 1, 1,
-1.362856, -0.8878673, -3.041487, 1, 1, 1, 1, 1,
-1.354478, -1.522334, -2.258731, 1, 1, 1, 1, 1,
-1.348374, -0.6582102, -3.483575, 1, 1, 1, 1, 1,
-1.346474, 0.06361101, -2.692781, 1, 1, 1, 1, 1,
-1.341778, -0.2591555, -0.7637343, 1, 1, 1, 1, 1,
-1.341684, 0.5410715, -2.586345, 1, 1, 1, 1, 1,
-1.340054, 1.827583, 1.027316, 0, 0, 1, 1, 1,
-1.3291, -0.5602861, -3.196227, 1, 0, 0, 1, 1,
-1.304561, -0.4151653, -3.456252, 1, 0, 0, 1, 1,
-1.296944, 0.4222663, -1.390341, 1, 0, 0, 1, 1,
-1.292184, -1.013528, -2.155881, 1, 0, 0, 1, 1,
-1.290635, 0.05555757, -2.00547, 1, 0, 0, 1, 1,
-1.281755, -0.1763448, -1.909722, 0, 0, 0, 1, 1,
-1.280995, 1.419252, -0.4013217, 0, 0, 0, 1, 1,
-1.278816, -2.518279, -2.293464, 0, 0, 0, 1, 1,
-1.275375, 1.712005, 0.1148632, 0, 0, 0, 1, 1,
-1.27511, -0.7209948, -3.015167, 0, 0, 0, 1, 1,
-1.273478, 1.330616, -2.100363, 0, 0, 0, 1, 1,
-1.258156, -0.6639311, -2.778721, 0, 0, 0, 1, 1,
-1.251957, 0.8559635, 0.4326632, 1, 1, 1, 1, 1,
-1.248241, -0.4483716, -3.073025, 1, 1, 1, 1, 1,
-1.239806, 1.498818, 0.2160607, 1, 1, 1, 1, 1,
-1.237901, 0.05783623, -3.53881, 1, 1, 1, 1, 1,
-1.237498, 0.5265887, -0.6360447, 1, 1, 1, 1, 1,
-1.236951, -0.6598365, -2.557562, 1, 1, 1, 1, 1,
-1.228555, 0.3100815, 0.026799, 1, 1, 1, 1, 1,
-1.223739, 1.189953, -1.57946, 1, 1, 1, 1, 1,
-1.222021, -0.1885234, -1.518339, 1, 1, 1, 1, 1,
-1.209902, 0.3728614, 0.2817909, 1, 1, 1, 1, 1,
-1.20769, -1.041865, -4.073362, 1, 1, 1, 1, 1,
-1.202615, -0.7225817, -1.618582, 1, 1, 1, 1, 1,
-1.202217, 0.2092819, -2.688154, 1, 1, 1, 1, 1,
-1.199415, 0.6567649, -1.486352, 1, 1, 1, 1, 1,
-1.198809, -1.285971, -2.016442, 1, 1, 1, 1, 1,
-1.197598, -1.209152, -2.736696, 0, 0, 1, 1, 1,
-1.19749, -1.594106, -1.011351, 1, 0, 0, 1, 1,
-1.189975, 1.725605, -1.243517, 1, 0, 0, 1, 1,
-1.189865, -0.7015924, -1.555297, 1, 0, 0, 1, 1,
-1.188727, 1.25368, -1.775564, 1, 0, 0, 1, 1,
-1.186864, -0.1839228, -1.630031, 1, 0, 0, 1, 1,
-1.184958, 1.026638, -0.3524526, 0, 0, 0, 1, 1,
-1.180838, 2.063963, -0.2391097, 0, 0, 0, 1, 1,
-1.179235, -0.2074012, -0.2745997, 0, 0, 0, 1, 1,
-1.175933, -0.04576029, -0.1110172, 0, 0, 0, 1, 1,
-1.170087, 1.474333, -0.6339961, 0, 0, 0, 1, 1,
-1.16872, -0.3808668, -2.073307, 0, 0, 0, 1, 1,
-1.166279, 0.6950444, -1.176231, 0, 0, 0, 1, 1,
-1.166041, -1.463613, -3.306046, 1, 1, 1, 1, 1,
-1.161697, 0.07284063, 0.0351579, 1, 1, 1, 1, 1,
-1.161533, -0.9194815, -2.279772, 1, 1, 1, 1, 1,
-1.151573, -1.286682, -1.850467, 1, 1, 1, 1, 1,
-1.14567, -0.5456439, -0.2832264, 1, 1, 1, 1, 1,
-1.139787, 0.5875045, -2.703804, 1, 1, 1, 1, 1,
-1.128185, 1.558305, 0.9073262, 1, 1, 1, 1, 1,
-1.12675, 1.23369, -3.07939, 1, 1, 1, 1, 1,
-1.125408, -0.3477412, -2.782971, 1, 1, 1, 1, 1,
-1.115754, 0.3112683, -1.957924, 1, 1, 1, 1, 1,
-1.108958, -0.5245349, -0.7443741, 1, 1, 1, 1, 1,
-1.108905, -1.549087, -2.376637, 1, 1, 1, 1, 1,
-1.107344, 0.8838034, -0.9060451, 1, 1, 1, 1, 1,
-1.098281, -0.1421719, -1.439047, 1, 1, 1, 1, 1,
-1.097566, -0.8703133, -3.174663, 1, 1, 1, 1, 1,
-1.093795, -0.8116761, -2.48976, 0, 0, 1, 1, 1,
-1.081208, -0.5848037, -2.178427, 1, 0, 0, 1, 1,
-1.080728, 0.5866928, -2.230922, 1, 0, 0, 1, 1,
-1.080455, -1.592992, -1.612943, 1, 0, 0, 1, 1,
-1.074531, 1.570606, -0.4541376, 1, 0, 0, 1, 1,
-1.059905, -0.01113145, -1.894674, 1, 0, 0, 1, 1,
-1.051457, -0.4452012, -1.999834, 0, 0, 0, 1, 1,
-1.049988, -0.2514655, -2.501304, 0, 0, 0, 1, 1,
-1.048716, 0.4902487, -2.208365, 0, 0, 0, 1, 1,
-1.041611, -0.1624746, 0.08941255, 0, 0, 0, 1, 1,
-1.039676, 0.07693233, -2.504859, 0, 0, 0, 1, 1,
-1.033528, -0.233502, -0.5982696, 0, 0, 0, 1, 1,
-1.033125, 1.001291, -1.771234, 0, 0, 0, 1, 1,
-1.031307, -0.5841731, -2.223438, 1, 1, 1, 1, 1,
-1.029691, -0.4927676, -2.255913, 1, 1, 1, 1, 1,
-1.020237, 0.2349538, -0.4059545, 1, 1, 1, 1, 1,
-1.002607, 0.2616587, -2.925408, 1, 1, 1, 1, 1,
-1.002068, 0.6845596, -0.3956822, 1, 1, 1, 1, 1,
-0.9981773, 0.1161396, -3.888425, 1, 1, 1, 1, 1,
-0.9977095, 0.2233581, -0.8920485, 1, 1, 1, 1, 1,
-0.9922229, 1.274696, 0.1147317, 1, 1, 1, 1, 1,
-0.9887507, 2.369286, -0.8755709, 1, 1, 1, 1, 1,
-0.9868501, 0.6969224, -1.680264, 1, 1, 1, 1, 1,
-0.9853042, -0.5432097, -1.661176, 1, 1, 1, 1, 1,
-0.9821711, -1.37371, -3.609579, 1, 1, 1, 1, 1,
-0.977742, -0.7191473, -1.592936, 1, 1, 1, 1, 1,
-0.9737241, -0.4904902, -2.999159, 1, 1, 1, 1, 1,
-0.9721338, -0.3963975, -1.692455, 1, 1, 1, 1, 1,
-0.9715309, -2.041551, -2.900524, 0, 0, 1, 1, 1,
-0.9713751, 0.2841275, 0.9688509, 1, 0, 0, 1, 1,
-0.9616038, -1.476141, -3.226174, 1, 0, 0, 1, 1,
-0.9556175, 0.6293018, -0.4981489, 1, 0, 0, 1, 1,
-0.9518349, -2.051721, -2.74449, 1, 0, 0, 1, 1,
-0.9422666, 0.7691578, -1.990769, 1, 0, 0, 1, 1,
-0.9394422, -0.5433942, -2.525823, 0, 0, 0, 1, 1,
-0.9336579, 0.7537106, 0.6574604, 0, 0, 0, 1, 1,
-0.9330511, -0.4112722, -2.948141, 0, 0, 0, 1, 1,
-0.9233139, 0.02417286, -1.316773, 0, 0, 0, 1, 1,
-0.9144948, 0.07462397, 0.07361888, 0, 0, 0, 1, 1,
-0.9126881, 0.7390375, -0.2879578, 0, 0, 0, 1, 1,
-0.9121009, 0.5062388, -0.6447398, 0, 0, 0, 1, 1,
-0.9053537, 0.5605784, -1.329703, 1, 1, 1, 1, 1,
-0.9046056, 1.732815, -1.533156, 1, 1, 1, 1, 1,
-0.9010366, -1.07306, -4.457566, 1, 1, 1, 1, 1,
-0.8930807, 1.83041, 2.342418, 1, 1, 1, 1, 1,
-0.8924617, -1.850608, -3.402963, 1, 1, 1, 1, 1,
-0.8871829, -1.8455, -3.559069, 1, 1, 1, 1, 1,
-0.8730768, -0.8745571, -2.902721, 1, 1, 1, 1, 1,
-0.8715977, 1.236025, -1.172116, 1, 1, 1, 1, 1,
-0.8708714, -0.2931589, -0.9096335, 1, 1, 1, 1, 1,
-0.865894, 1.067433, 2.207653, 1, 1, 1, 1, 1,
-0.8643261, -1.354618, -2.853427, 1, 1, 1, 1, 1,
-0.8640763, 0.6713184, -0.3924916, 1, 1, 1, 1, 1,
-0.8570827, 0.712617, -1.22199, 1, 1, 1, 1, 1,
-0.8480189, 1.563586, -0.1476708, 1, 1, 1, 1, 1,
-0.8476691, -1.689945, -2.251684, 1, 1, 1, 1, 1,
-0.8396065, -1.544765, -3.559075, 0, 0, 1, 1, 1,
-0.8342715, -0.9206966, -2.134503, 1, 0, 0, 1, 1,
-0.8323058, -0.3652859, -2.542897, 1, 0, 0, 1, 1,
-0.8207181, 0.5836726, 1.268681, 1, 0, 0, 1, 1,
-0.8154379, -0.4922196, -1.123341, 1, 0, 0, 1, 1,
-0.8154215, -0.6126459, -3.702952, 1, 0, 0, 1, 1,
-0.8088615, 1.720147, -2.133434, 0, 0, 0, 1, 1,
-0.8030164, 0.3267773, -0.9791123, 0, 0, 0, 1, 1,
-0.8005731, 0.1691838, -2.575688, 0, 0, 0, 1, 1,
-0.7944936, -0.1182435, -3.425948, 0, 0, 0, 1, 1,
-0.7921839, 0.2800273, -0.6542864, 0, 0, 0, 1, 1,
-0.7871827, -0.122998, -2.406857, 0, 0, 0, 1, 1,
-0.7838715, 0.8767686, -1.388906, 0, 0, 0, 1, 1,
-0.7820405, -0.936179, -2.693867, 1, 1, 1, 1, 1,
-0.7815629, 1.151375, -1.624037, 1, 1, 1, 1, 1,
-0.7799217, 0.0284968, -1.646198, 1, 1, 1, 1, 1,
-0.7786449, -0.5704975, -0.6891182, 1, 1, 1, 1, 1,
-0.7737622, 1.762631, 0.05734354, 1, 1, 1, 1, 1,
-0.7727617, -1.358625, -2.971077, 1, 1, 1, 1, 1,
-0.7645969, 0.2571912, 0.2554257, 1, 1, 1, 1, 1,
-0.7490882, 0.06483696, -1.354297, 1, 1, 1, 1, 1,
-0.7466971, 1.012293, 1.418361, 1, 1, 1, 1, 1,
-0.7458689, -0.4929334, -2.10462, 1, 1, 1, 1, 1,
-0.7457292, 1.632666, -2.311578, 1, 1, 1, 1, 1,
-0.7452551, -1.137357, -2.00039, 1, 1, 1, 1, 1,
-0.7435878, -0.2043716, -2.256882, 1, 1, 1, 1, 1,
-0.7434674, -0.6780096, -0.3167729, 1, 1, 1, 1, 1,
-0.7400108, 1.591849, -0.6019641, 1, 1, 1, 1, 1,
-0.7360038, -0.3170388, -3.994655, 0, 0, 1, 1, 1,
-0.7352898, -0.6987203, -1.702948, 1, 0, 0, 1, 1,
-0.7338657, -1.367745, -2.146415, 1, 0, 0, 1, 1,
-0.7270142, -1.204635, -1.261801, 1, 0, 0, 1, 1,
-0.718039, -0.2901594, -2.199326, 1, 0, 0, 1, 1,
-0.7145327, 0.5755439, 0.8569427, 1, 0, 0, 1, 1,
-0.7122682, -0.444391, -2.088525, 0, 0, 0, 1, 1,
-0.7115619, 1.927014, 0.3709281, 0, 0, 0, 1, 1,
-0.7103218, 1.468777, 0.04777332, 0, 0, 0, 1, 1,
-0.7079304, -0.1010991, -1.696024, 0, 0, 0, 1, 1,
-0.7075978, -0.6010167, -4.391067, 0, 0, 0, 1, 1,
-0.7051248, 0.4498345, -0.6575481, 0, 0, 0, 1, 1,
-0.7046489, 0.7952527, -2.188971, 0, 0, 0, 1, 1,
-0.7013663, 1.864079, -0.3666191, 1, 1, 1, 1, 1,
-0.6988684, 0.8484556, -0.2302214, 1, 1, 1, 1, 1,
-0.6962711, -0.2396599, -3.193703, 1, 1, 1, 1, 1,
-0.6934922, 0.1788929, -4.323048, 1, 1, 1, 1, 1,
-0.6923034, 0.8763654, -1.365236, 1, 1, 1, 1, 1,
-0.6880037, -0.7741776, -0.6710584, 1, 1, 1, 1, 1,
-0.6852516, -0.7923546, -1.885849, 1, 1, 1, 1, 1,
-0.6789892, -1.360123, -2.607051, 1, 1, 1, 1, 1,
-0.674672, 1.401798, -1.452487, 1, 1, 1, 1, 1,
-0.6739818, 0.4235398, -1.033471, 1, 1, 1, 1, 1,
-0.6703776, -1.530692, -3.436004, 1, 1, 1, 1, 1,
-0.6663718, 0.3760963, -1.988519, 1, 1, 1, 1, 1,
-0.6629528, 1.180986, -1.018245, 1, 1, 1, 1, 1,
-0.6615038, -0.620599, -1.310837, 1, 1, 1, 1, 1,
-0.6573886, 0.4642382, -0.3325154, 1, 1, 1, 1, 1,
-0.6560492, 0.2575343, 0.02432623, 0, 0, 1, 1, 1,
-0.6558686, 0.2583688, -2.315658, 1, 0, 0, 1, 1,
-0.6484998, 2.465738, -0.07280237, 1, 0, 0, 1, 1,
-0.6460365, 0.9197255, -2.47512, 1, 0, 0, 1, 1,
-0.6406988, -0.5063055, -4.052183, 1, 0, 0, 1, 1,
-0.6401981, 1.966445, 0.03491488, 1, 0, 0, 1, 1,
-0.6375772, -0.02473495, -0.05236704, 0, 0, 0, 1, 1,
-0.6309751, 0.5662967, -0.7003435, 0, 0, 0, 1, 1,
-0.6295497, -0.3847022, -1.1759, 0, 0, 0, 1, 1,
-0.6280876, -0.4819053, -2.299844, 0, 0, 0, 1, 1,
-0.6232085, 0.4532866, -2.137742, 0, 0, 0, 1, 1,
-0.615927, -0.4333095, -1.295768, 0, 0, 0, 1, 1,
-0.6144943, -0.6549154, -2.890142, 0, 0, 0, 1, 1,
-0.6068466, -3.075288, -1.790235, 1, 1, 1, 1, 1,
-0.6001169, 1.104851, -1.790844, 1, 1, 1, 1, 1,
-0.599551, -0.0323047, -0.908635, 1, 1, 1, 1, 1,
-0.5986314, -0.2887226, -1.051273, 1, 1, 1, 1, 1,
-0.5981743, -0.3991029, -3.054281, 1, 1, 1, 1, 1,
-0.5961207, 0.7273027, -1.211174, 1, 1, 1, 1, 1,
-0.5893006, 0.9100242, -1.882121, 1, 1, 1, 1, 1,
-0.5847278, -0.6545206, -1.616518, 1, 1, 1, 1, 1,
-0.5795268, 0.7575828, -1.056688, 1, 1, 1, 1, 1,
-0.579171, 0.5036476, -0.7658946, 1, 1, 1, 1, 1,
-0.5789745, -1.014821, -2.791977, 1, 1, 1, 1, 1,
-0.577888, -0.4931798, -2.965608, 1, 1, 1, 1, 1,
-0.5755089, 1.067088, -0.1403515, 1, 1, 1, 1, 1,
-0.5746735, -0.4632931, -3.188949, 1, 1, 1, 1, 1,
-0.5699545, 0.1689856, -1.347379, 1, 1, 1, 1, 1,
-0.565702, 1.447, 0.4917941, 0, 0, 1, 1, 1,
-0.5648499, 0.7257102, -0.8580094, 1, 0, 0, 1, 1,
-0.5645617, 0.483139, -0.6369259, 1, 0, 0, 1, 1,
-0.5546836, 1.556317, 0.1477332, 1, 0, 0, 1, 1,
-0.5545346, -1.637265, -1.845807, 1, 0, 0, 1, 1,
-0.5539292, 1.228415, -0.9374973, 1, 0, 0, 1, 1,
-0.5419205, 0.004599549, 0.4761167, 0, 0, 0, 1, 1,
-0.5409923, -0.3895605, -0.9898852, 0, 0, 0, 1, 1,
-0.5406625, 1.545568, 1.628548, 0, 0, 0, 1, 1,
-0.538321, 1.363568, -1.240298, 0, 0, 0, 1, 1,
-0.5368052, 0.1054759, -1.371586, 0, 0, 0, 1, 1,
-0.5359986, 1.121185, -1.192458, 0, 0, 0, 1, 1,
-0.5275472, 0.6119999, -1.214683, 0, 0, 0, 1, 1,
-0.5214842, 1.674061, 0.8714663, 1, 1, 1, 1, 1,
-0.521195, -1.300786, -1.447898, 1, 1, 1, 1, 1,
-0.5210912, 1.737682, -1.203106, 1, 1, 1, 1, 1,
-0.5143887, -1.209321, -4.46852, 1, 1, 1, 1, 1,
-0.5138096, 1.976732, -0.905365, 1, 1, 1, 1, 1,
-0.5107833, -1.532307, -1.041144, 1, 1, 1, 1, 1,
-0.5052195, 0.5433883, 0.233789, 1, 1, 1, 1, 1,
-0.5050961, 1.502672, 0.7827291, 1, 1, 1, 1, 1,
-0.5004247, 1.234375, -2.241362, 1, 1, 1, 1, 1,
-0.4953279, -1.352885, -2.057386, 1, 1, 1, 1, 1,
-0.4943439, 0.6847212, 0.07969958, 1, 1, 1, 1, 1,
-0.492479, -0.8584355, -4.463917, 1, 1, 1, 1, 1,
-0.4913513, -0.7416123, -2.734232, 1, 1, 1, 1, 1,
-0.4897762, -0.5073405, -3.940034, 1, 1, 1, 1, 1,
-0.4889202, 0.273912, -0.8016941, 1, 1, 1, 1, 1,
-0.4885814, -0.7165962, -2.273643, 0, 0, 1, 1, 1,
-0.4872013, 0.2277059, -1.309597, 1, 0, 0, 1, 1,
-0.482579, 1.098042, -0.3905724, 1, 0, 0, 1, 1,
-0.4782341, -0.1777896, -1.582748, 1, 0, 0, 1, 1,
-0.4728972, 0.3892466, -0.2202719, 1, 0, 0, 1, 1,
-0.4726563, 1.451635, -0.9280582, 1, 0, 0, 1, 1,
-0.4713038, -0.1192335, -1.899807, 0, 0, 0, 1, 1,
-0.4696161, -2.535177, -2.790309, 0, 0, 0, 1, 1,
-0.4692369, -0.6572621, -3.145965, 0, 0, 0, 1, 1,
-0.4686185, 0.3342502, -0.2940837, 0, 0, 0, 1, 1,
-0.4657721, -0.2366123, -1.448981, 0, 0, 0, 1, 1,
-0.4647289, -0.1267148, -1.78654, 0, 0, 0, 1, 1,
-0.4619283, -0.7413703, -2.991706, 0, 0, 0, 1, 1,
-0.4567966, -0.7801108, -3.18252, 1, 1, 1, 1, 1,
-0.4555845, 1.869983, 2.183186, 1, 1, 1, 1, 1,
-0.4444842, -1.374506, -1.40745, 1, 1, 1, 1, 1,
-0.4361981, 1.493828, 0.5426579, 1, 1, 1, 1, 1,
-0.4359513, 0.1294235, -2.000485, 1, 1, 1, 1, 1,
-0.435772, -0.7497633, -1.816871, 1, 1, 1, 1, 1,
-0.429031, -1.121688, -4.304093, 1, 1, 1, 1, 1,
-0.4286743, -0.5182932, -1.971895, 1, 1, 1, 1, 1,
-0.427104, -0.2087348, -1.69275, 1, 1, 1, 1, 1,
-0.426131, -0.155019, -2.4864, 1, 1, 1, 1, 1,
-0.4230866, 0.794751, -3.184556, 1, 1, 1, 1, 1,
-0.4225562, 0.5053447, -0.4649734, 1, 1, 1, 1, 1,
-0.4220791, 0.6349535, -2.458753, 1, 1, 1, 1, 1,
-0.4095967, 0.8704815, -1.067386, 1, 1, 1, 1, 1,
-0.4092326, -0.8563254, -3.430307, 1, 1, 1, 1, 1,
-0.4062822, 0.6943771, -0.4939053, 0, 0, 1, 1, 1,
-0.4039262, -1.730962, -4.219335, 1, 0, 0, 1, 1,
-0.4015434, 0.2919986, -0.9738373, 1, 0, 0, 1, 1,
-0.4004483, 0.7589316, -0.11472, 1, 0, 0, 1, 1,
-0.397052, -1.116465, -4.519578, 1, 0, 0, 1, 1,
-0.3941838, -1.634526, -4.124535, 1, 0, 0, 1, 1,
-0.3913449, 0.7632941, 0.7573867, 0, 0, 0, 1, 1,
-0.3911843, -2.322104, -3.423285, 0, 0, 0, 1, 1,
-0.3907592, 0.8325498, -1.123905, 0, 0, 0, 1, 1,
-0.3871336, -0.5821099, -2.712908, 0, 0, 0, 1, 1,
-0.3863043, -0.5272659, -2.488793, 0, 0, 0, 1, 1,
-0.386258, -0.3811158, -2.505494, 0, 0, 0, 1, 1,
-0.3858531, -0.9719087, -3.018982, 0, 0, 0, 1, 1,
-0.3843838, -0.3673679, -3.155834, 1, 1, 1, 1, 1,
-0.3835712, -0.07707775, -1.845326, 1, 1, 1, 1, 1,
-0.3813792, 1.256639, -0.4737164, 1, 1, 1, 1, 1,
-0.3790436, -0.169248, -2.602093, 1, 1, 1, 1, 1,
-0.3714474, 1.140228, 2.452873, 1, 1, 1, 1, 1,
-0.3658425, -1.31138, -3.34989, 1, 1, 1, 1, 1,
-0.3650331, 0.2194632, -2.236794, 1, 1, 1, 1, 1,
-0.3633748, 0.1132144, -0.404689, 1, 1, 1, 1, 1,
-0.3563446, -0.2448378, -0.7408593, 1, 1, 1, 1, 1,
-0.3536279, 0.02168334, -2.799316, 1, 1, 1, 1, 1,
-0.3534597, 0.4023333, -0.7679678, 1, 1, 1, 1, 1,
-0.3490373, 1.227651, 0.1928703, 1, 1, 1, 1, 1,
-0.3488843, 0.1760892, -2.071718, 1, 1, 1, 1, 1,
-0.3474148, 0.9621705, -0.9661282, 1, 1, 1, 1, 1,
-0.3472997, -0.3869758, -3.557462, 1, 1, 1, 1, 1,
-0.3423042, 1.118961, -0.7933072, 0, 0, 1, 1, 1,
-0.3407044, 0.7281945, 0.4363075, 1, 0, 0, 1, 1,
-0.3392774, 1.230004, -1.106867, 1, 0, 0, 1, 1,
-0.3380751, 0.9303643, -0.9270681, 1, 0, 0, 1, 1,
-0.336496, -1.569104, -4.552474, 1, 0, 0, 1, 1,
-0.3361563, -0.9656025, -1.014855, 1, 0, 0, 1, 1,
-0.3323494, 0.6919904, -0.309222, 0, 0, 0, 1, 1,
-0.3322357, -0.7328205, -3.381815, 0, 0, 0, 1, 1,
-0.3294473, -1.242291, -2.327879, 0, 0, 0, 1, 1,
-0.3282181, -0.9163363, -3.614014, 0, 0, 0, 1, 1,
-0.3281749, 0.2716517, -1.353225, 0, 0, 0, 1, 1,
-0.3240327, 0.6214164, 0.5841037, 0, 0, 0, 1, 1,
-0.319852, 0.7870347, -2.225912, 0, 0, 0, 1, 1,
-0.3150623, 0.6902989, -1.958123, 1, 1, 1, 1, 1,
-0.3134086, 0.9075124, -0.373444, 1, 1, 1, 1, 1,
-0.3129473, -0.1034592, -3.729985, 1, 1, 1, 1, 1,
-0.3114334, -0.1325362, -3.488488, 1, 1, 1, 1, 1,
-0.311362, 0.226052, -0.6580434, 1, 1, 1, 1, 1,
-0.306114, 0.8091733, 1.081731, 1, 1, 1, 1, 1,
-0.3051866, -1.239357, -2.490457, 1, 1, 1, 1, 1,
-0.3032938, 1.313668, -1.326638, 1, 1, 1, 1, 1,
-0.3028969, 0.2807912, 0.5375703, 1, 1, 1, 1, 1,
-0.3012585, -0.2739186, -2.662285, 1, 1, 1, 1, 1,
-0.2959419, -0.8254051, -2.652966, 1, 1, 1, 1, 1,
-0.2920143, 1.238532, 0.4323228, 1, 1, 1, 1, 1,
-0.2887212, 1.6613, 1.643691, 1, 1, 1, 1, 1,
-0.2831518, 0.8828911, -0.1670397, 1, 1, 1, 1, 1,
-0.2817939, 0.2970633, -2.740382, 1, 1, 1, 1, 1,
-0.2787554, 1.258798, -1.075463, 0, 0, 1, 1, 1,
-0.2786815, 0.4233378, -1.8968, 1, 0, 0, 1, 1,
-0.2774199, -0.3313474, -2.848082, 1, 0, 0, 1, 1,
-0.276051, 0.9235867, -0.6778755, 1, 0, 0, 1, 1,
-0.2722885, -0.4939568, -2.666379, 1, 0, 0, 1, 1,
-0.2682219, -1.351588, -4.046427, 1, 0, 0, 1, 1,
-0.2670414, 1.011939, -0.8561518, 0, 0, 0, 1, 1,
-0.2627798, -0.1867183, -2.509511, 0, 0, 0, 1, 1,
-0.2592371, -0.4089748, -2.550377, 0, 0, 0, 1, 1,
-0.2515399, 0.9411886, -0.3290869, 0, 0, 0, 1, 1,
-0.2492403, -0.3572946, -2.35428, 0, 0, 0, 1, 1,
-0.2478134, -0.00885502, -2.016513, 0, 0, 0, 1, 1,
-0.2466485, 0.1745373, -1.738402, 0, 0, 0, 1, 1,
-0.2458694, 0.2972565, -0.09801245, 1, 1, 1, 1, 1,
-0.2446294, -0.4623431, -1.398613, 1, 1, 1, 1, 1,
-0.2435368, 1.09143, 2.221403, 1, 1, 1, 1, 1,
-0.2420718, 0.9228187, -0.7113173, 1, 1, 1, 1, 1,
-0.2414338, -0.3613119, -2.646408, 1, 1, 1, 1, 1,
-0.2390863, 0.07590701, -1.561558, 1, 1, 1, 1, 1,
-0.231239, 0.8893299, 0.132155, 1, 1, 1, 1, 1,
-0.2295777, -0.9272327, -3.257031, 1, 1, 1, 1, 1,
-0.2286721, -0.4009586, -3.14628, 1, 1, 1, 1, 1,
-0.2276384, 0.6137012, -1.074466, 1, 1, 1, 1, 1,
-0.2230514, 0.04786292, -1.258053, 1, 1, 1, 1, 1,
-0.2176905, 0.8588287, -0.5855368, 1, 1, 1, 1, 1,
-0.2149374, -0.6338299, -2.615428, 1, 1, 1, 1, 1,
-0.209365, 0.5671211, -2.227523, 1, 1, 1, 1, 1,
-0.2060229, 1.816014, 0.05664694, 1, 1, 1, 1, 1,
-0.2037332, -1.416546, -3.781297, 0, 0, 1, 1, 1,
-0.202911, 0.2281172, -1.744053, 1, 0, 0, 1, 1,
-0.1969026, 0.04566625, -0.4161006, 1, 0, 0, 1, 1,
-0.196167, 0.2267943, -1.189025, 1, 0, 0, 1, 1,
-0.1873804, 0.5545214, -0.5742455, 1, 0, 0, 1, 1,
-0.1844901, -1.581081, -2.877283, 1, 0, 0, 1, 1,
-0.1813556, 1.971173, 1.151688, 0, 0, 0, 1, 1,
-0.1795554, 1.029956, 0.7766483, 0, 0, 0, 1, 1,
-0.1779112, 0.09862313, -1.8127, 0, 0, 0, 1, 1,
-0.1773137, -0.1458651, -3.009822, 0, 0, 0, 1, 1,
-0.1765378, -1.289979, -2.503999, 0, 0, 0, 1, 1,
-0.1746169, -1.072726, -4.477791, 0, 0, 0, 1, 1,
-0.1661029, -1.53492, -1.549617, 0, 0, 0, 1, 1,
-0.1647815, -0.9739158, -1.782848, 1, 1, 1, 1, 1,
-0.1584367, 1.448487, -0.739888, 1, 1, 1, 1, 1,
-0.1524276, 0.4922934, 0.1427146, 1, 1, 1, 1, 1,
-0.1509056, 0.8306644, -0.07106246, 1, 1, 1, 1, 1,
-0.1502615, 1.244, -0.4002658, 1, 1, 1, 1, 1,
-0.1499382, 0.005954833, -0.8983303, 1, 1, 1, 1, 1,
-0.148532, -0.22153, -3.18945, 1, 1, 1, 1, 1,
-0.1479228, -1.435145, -1.242489, 1, 1, 1, 1, 1,
-0.1467366, 0.3067235, -0.2993639, 1, 1, 1, 1, 1,
-0.1449136, -0.008902123, -2.415966, 1, 1, 1, 1, 1,
-0.1440066, 1.536106, 0.393224, 1, 1, 1, 1, 1,
-0.14049, -0.4777511, -1.147465, 1, 1, 1, 1, 1,
-0.136463, -0.1637856, -3.043686, 1, 1, 1, 1, 1,
-0.1353756, 0.2342909, 0.1497581, 1, 1, 1, 1, 1,
-0.1328585, -1.934953, -1.0662, 1, 1, 1, 1, 1,
-0.1318704, 0.4397123, 0.1603607, 0, 0, 1, 1, 1,
-0.1308227, 0.7216848, -1.559536, 1, 0, 0, 1, 1,
-0.1265826, 1.127975, 0.7730336, 1, 0, 0, 1, 1,
-0.1258312, 0.05034678, -1.760633, 1, 0, 0, 1, 1,
-0.1207452, 0.3165214, -1.542956, 1, 0, 0, 1, 1,
-0.1202673, 0.4331743, -1.384637, 1, 0, 0, 1, 1,
-0.1173323, -1.846409, -1.846001, 0, 0, 0, 1, 1,
-0.1105943, -0.1618622, -2.146279, 0, 0, 0, 1, 1,
-0.108587, -1.232367, -2.615819, 0, 0, 0, 1, 1,
-0.1042845, 0.04319872, -2.480616, 0, 0, 0, 1, 1,
-0.1042643, 1.375805, 0.09669647, 0, 0, 0, 1, 1,
-0.09335396, 0.9507633, 0.8985798, 0, 0, 0, 1, 1,
-0.09292237, 1.128608, -0.9364282, 0, 0, 0, 1, 1,
-0.09052815, -0.5533083, -3.014472, 1, 1, 1, 1, 1,
-0.08889055, 0.807956, 2.037374, 1, 1, 1, 1, 1,
-0.08847096, -0.01587738, -1.643868, 1, 1, 1, 1, 1,
-0.08481028, -1.273596, -3.170506, 1, 1, 1, 1, 1,
-0.08421897, -0.05675216, -0.9329885, 1, 1, 1, 1, 1,
-0.08108842, -0.4765379, -3.062693, 1, 1, 1, 1, 1,
-0.07951677, 0.3861004, 0.5660883, 1, 1, 1, 1, 1,
-0.07869351, -0.1177511, -2.594058, 1, 1, 1, 1, 1,
-0.0778469, 0.9207399, -0.2665502, 1, 1, 1, 1, 1,
-0.07663562, -0.3964851, -2.835761, 1, 1, 1, 1, 1,
-0.07579165, 0.4852278, -0.2597468, 1, 1, 1, 1, 1,
-0.07488563, -0.4691774, -3.638868, 1, 1, 1, 1, 1,
-0.06237823, 2.094275, 0.6806481, 1, 1, 1, 1, 1,
-0.06127526, 0.5862881, 0.754201, 1, 1, 1, 1, 1,
-0.06097471, 1.426587, 0.2558131, 1, 1, 1, 1, 1,
-0.06092778, 0.4377751, 0.6462603, 0, 0, 1, 1, 1,
-0.06056082, 1.524212, -1.262046, 1, 0, 0, 1, 1,
-0.05671697, -0.6705835, -3.214194, 1, 0, 0, 1, 1,
-0.0550291, -0.7296687, -3.396402, 1, 0, 0, 1, 1,
-0.05276993, 1.444711, 0.2642449, 1, 0, 0, 1, 1,
-0.04825886, 1.386546, 1.220893, 1, 0, 0, 1, 1,
-0.04789782, -0.4591605, -4.3929, 0, 0, 0, 1, 1,
-0.04368755, 0.5827698, 1.325647, 0, 0, 0, 1, 1,
-0.03983119, -0.9074344, -2.444323, 0, 0, 0, 1, 1,
-0.03637396, -0.3026139, -3.095495, 0, 0, 0, 1, 1,
-0.03345487, -0.8572694, -3.54247, 0, 0, 0, 1, 1,
-0.03267386, 0.07391698, 0.6278716, 0, 0, 0, 1, 1,
-0.03177845, -1.978402, -2.651901, 0, 0, 0, 1, 1,
-0.03114824, 0.8315047, 1.30533, 1, 1, 1, 1, 1,
-0.02344123, -0.2522584, -3.994726, 1, 1, 1, 1, 1,
-0.02211595, -1.088738, -5.242663, 1, 1, 1, 1, 1,
-0.02180153, 1.535229, 0.1469595, 1, 1, 1, 1, 1,
-0.01793084, -1.728798, -4.132349, 1, 1, 1, 1, 1,
-0.01679288, -0.0331122, -4.324642, 1, 1, 1, 1, 1,
-0.01374317, -0.2613845, -3.247076, 1, 1, 1, 1, 1,
-0.01240954, 0.7502813, -0.01674268, 1, 1, 1, 1, 1,
-0.01181103, -0.4808177, -5.084987, 1, 1, 1, 1, 1,
-0.01000556, -0.3643379, -1.76555, 1, 1, 1, 1, 1,
-0.008575046, -0.8324558, -4.454915, 1, 1, 1, 1, 1,
-0.007856503, 0.366952, 0.1618978, 1, 1, 1, 1, 1,
-0.002665222, -0.6320283, -3.043665, 1, 1, 1, 1, 1,
0.0006993203, 0.4029193, -0.6838397, 1, 1, 1, 1, 1,
0.003960669, 1.196277, -0.7970909, 1, 1, 1, 1, 1,
0.009129434, -0.4417604, 1.965441, 0, 0, 1, 1, 1,
0.0102748, -1.84066, 3.840254, 1, 0, 0, 1, 1,
0.01760418, -0.2613861, 1.47598, 1, 0, 0, 1, 1,
0.01982558, -0.8883075, 3.498019, 1, 0, 0, 1, 1,
0.02656588, 3.350942, 0.6396366, 1, 0, 0, 1, 1,
0.02971436, -1.075539, 3.333969, 1, 0, 0, 1, 1,
0.03091551, -1.327644, 2.862145, 0, 0, 0, 1, 1,
0.03575965, -1.365831, 2.785108, 0, 0, 0, 1, 1,
0.03728047, -1.620359, 3.688025, 0, 0, 0, 1, 1,
0.04423288, -0.399902, 4.171267, 0, 0, 0, 1, 1,
0.04445852, 0.1406208, -0.6805224, 0, 0, 0, 1, 1,
0.04521083, -3.465764, 1.587132, 0, 0, 0, 1, 1,
0.04785834, 1.402794, 0.844741, 0, 0, 0, 1, 1,
0.04792582, -0.5225995, 3.497723, 1, 1, 1, 1, 1,
0.05163995, 1.080072, -0.7222793, 1, 1, 1, 1, 1,
0.05310116, -0.3172914, 4.481934, 1, 1, 1, 1, 1,
0.05463671, 1.341267, -0.4994188, 1, 1, 1, 1, 1,
0.05887898, -0.0539781, 2.631013, 1, 1, 1, 1, 1,
0.05938477, -1.155442, 2.892526, 1, 1, 1, 1, 1,
0.06167103, 0.1842808, -1.839788, 1, 1, 1, 1, 1,
0.06691471, -0.09271284, 2.8943, 1, 1, 1, 1, 1,
0.06945857, 1.614693, -0.8623155, 1, 1, 1, 1, 1,
0.07124963, 1.940954, -0.1943083, 1, 1, 1, 1, 1,
0.07372008, -0.2044807, 2.014752, 1, 1, 1, 1, 1,
0.08381265, -0.8133531, 3.447429, 1, 1, 1, 1, 1,
0.08594395, 0.7758625, 0.4919293, 1, 1, 1, 1, 1,
0.08856978, -1.748895, 1.785591, 1, 1, 1, 1, 1,
0.0977132, -0.3332681, 2.860282, 1, 1, 1, 1, 1,
0.1001931, 1.635116, 0.6985367, 0, 0, 1, 1, 1,
0.1006884, 0.06957878, 3.092403, 1, 0, 0, 1, 1,
0.1028112, -0.0988274, 4.276945, 1, 0, 0, 1, 1,
0.1039883, 0.9803661, 1.919704, 1, 0, 0, 1, 1,
0.1040448, 0.9892878, 1.759154, 1, 0, 0, 1, 1,
0.1050534, -1.273952, 2.954171, 1, 0, 0, 1, 1,
0.1087058, 0.1088144, 0.7763737, 0, 0, 0, 1, 1,
0.116208, -0.8382189, 3.153173, 0, 0, 0, 1, 1,
0.1183327, -0.269136, 2.472802, 0, 0, 0, 1, 1,
0.1203136, 1.262022, -0.4739949, 0, 0, 0, 1, 1,
0.1203282, 1.176256, -0.07812154, 0, 0, 0, 1, 1,
0.1206764, -1.133738, 3.875503, 0, 0, 0, 1, 1,
0.1222656, 0.9830877, -0.190715, 0, 0, 0, 1, 1,
0.1234389, -0.2399178, 3.329335, 1, 1, 1, 1, 1,
0.1243225, -0.5327719, 2.064565, 1, 1, 1, 1, 1,
0.1279947, 0.783522, -0.06803541, 1, 1, 1, 1, 1,
0.1291087, 0.1192734, 0.5363579, 1, 1, 1, 1, 1,
0.1328655, 0.3435279, 0.8971961, 1, 1, 1, 1, 1,
0.1334521, -0.101503, 2.002771, 1, 1, 1, 1, 1,
0.1353802, 1.124391, -1.506449, 1, 1, 1, 1, 1,
0.137494, -0.9403022, 3.582246, 1, 1, 1, 1, 1,
0.1400336, 0.7275505, -1.155773, 1, 1, 1, 1, 1,
0.1403892, 0.02145776, 2.247932, 1, 1, 1, 1, 1,
0.1404249, -0.4750479, 2.166683, 1, 1, 1, 1, 1,
0.1429531, 1.222508, -1.34058, 1, 1, 1, 1, 1,
0.1494276, -1.378536, 2.618007, 1, 1, 1, 1, 1,
0.153141, -0.8206404, 3.068182, 1, 1, 1, 1, 1,
0.1535251, 1.461069, 0.7052631, 1, 1, 1, 1, 1,
0.1562272, 0.1268903, 0.4177039, 0, 0, 1, 1, 1,
0.157214, 0.6940008, 1.139379, 1, 0, 0, 1, 1,
0.1615817, 0.73062, 0.8689609, 1, 0, 0, 1, 1,
0.1620338, -0.364742, 3.182014, 1, 0, 0, 1, 1,
0.1645286, -0.7078128, 2.981825, 1, 0, 0, 1, 1,
0.1663863, -0.9317114, 1.88901, 1, 0, 0, 1, 1,
0.1668125, -0.1435371, 0.1865681, 0, 0, 0, 1, 1,
0.1694509, 0.5620641, 1.187326, 0, 0, 0, 1, 1,
0.1696793, 0.8182094, -1.047115, 0, 0, 0, 1, 1,
0.1732093, 0.03723072, 0.8768357, 0, 0, 0, 1, 1,
0.1734321, 1.285616, -0.5247921, 0, 0, 0, 1, 1,
0.1737094, -0.6004701, 3.795816, 0, 0, 0, 1, 1,
0.1811613, 1.342858, -0.6990677, 0, 0, 0, 1, 1,
0.1844289, -0.4763878, 2.912771, 1, 1, 1, 1, 1,
0.1850603, -1.390976, 2.125925, 1, 1, 1, 1, 1,
0.1859474, -0.2633379, 2.012927, 1, 1, 1, 1, 1,
0.1877869, 1.247953, 0.3650807, 1, 1, 1, 1, 1,
0.1923397, -0.799539, 3.844066, 1, 1, 1, 1, 1,
0.194871, 0.4398174, 2.787318, 1, 1, 1, 1, 1,
0.1953013, -0.338239, 1.220258, 1, 1, 1, 1, 1,
0.1982881, 1.054581, -0.7754025, 1, 1, 1, 1, 1,
0.1987289, 0.5938003, 1.145125, 1, 1, 1, 1, 1,
0.1996294, 0.2661898, 1.2096, 1, 1, 1, 1, 1,
0.2013749, -0.5725505, 2.442966, 1, 1, 1, 1, 1,
0.2021681, -0.06257642, 2.545763, 1, 1, 1, 1, 1,
0.210677, 0.3789921, 0.4010812, 1, 1, 1, 1, 1,
0.2130742, -0.2095298, 1.226515, 1, 1, 1, 1, 1,
0.2159307, -0.523359, 3.714942, 1, 1, 1, 1, 1,
0.2239907, 0.9703791, 1.080905, 0, 0, 1, 1, 1,
0.2253896, -0.5272797, 3.955969, 1, 0, 0, 1, 1,
0.2268973, 0.9359539, -2.072301, 1, 0, 0, 1, 1,
0.2284082, -1.528258, 2.941384, 1, 0, 0, 1, 1,
0.2332686, -0.1655824, 0.04686078, 1, 0, 0, 1, 1,
0.2385112, 1.188222, 0.09465043, 1, 0, 0, 1, 1,
0.2394037, -0.8149385, 1.88648, 0, 0, 0, 1, 1,
0.2456899, -0.02125066, -0.7723339, 0, 0, 0, 1, 1,
0.2477202, -0.6730583, 4.450786, 0, 0, 0, 1, 1,
0.2482985, 0.8783732, 0.0007917664, 0, 0, 0, 1, 1,
0.248356, -0.9816869, 4.9095, 0, 0, 0, 1, 1,
0.253581, -0.9210188, 2.943913, 0, 0, 0, 1, 1,
0.2538468, -0.9012091, 0.9798279, 0, 0, 0, 1, 1,
0.2671144, 0.942807, -0.4492255, 1, 1, 1, 1, 1,
0.2693081, 0.9973963, 2.292932, 1, 1, 1, 1, 1,
0.2701669, -0.4722199, 2.618032, 1, 1, 1, 1, 1,
0.2736679, -0.40667, 2.332442, 1, 1, 1, 1, 1,
0.2759178, 0.8307649, -0.3907953, 1, 1, 1, 1, 1,
0.2769725, 1.1691, 2.176021, 1, 1, 1, 1, 1,
0.2790928, -1.609066, 2.552069, 1, 1, 1, 1, 1,
0.2839346, 0.1954337, 1.293546, 1, 1, 1, 1, 1,
0.2880324, 1.926911, 0.00651554, 1, 1, 1, 1, 1,
0.288065, -0.5320728, 1.09852, 1, 1, 1, 1, 1,
0.2927014, 0.121991, 0.01964633, 1, 1, 1, 1, 1,
0.2943052, 0.9749519, -0.0715518, 1, 1, 1, 1, 1,
0.2953608, -0.7967809, 2.225094, 1, 1, 1, 1, 1,
0.2986267, 0.3654214, 1.118289, 1, 1, 1, 1, 1,
0.3002688, -0.7193223, 3.905826, 1, 1, 1, 1, 1,
0.3032163, -1.020371, 2.571449, 0, 0, 1, 1, 1,
0.3104482, -0.8167087, 1.688111, 1, 0, 0, 1, 1,
0.3105742, 1.461637, -0.5260842, 1, 0, 0, 1, 1,
0.3145974, 0.01733077, 1.765472, 1, 0, 0, 1, 1,
0.3178237, 0.5404708, 1.275451, 1, 0, 0, 1, 1,
0.3188027, 1.817532, -0.134554, 1, 0, 0, 1, 1,
0.325039, 0.07676786, 1.745352, 0, 0, 0, 1, 1,
0.325372, 0.7033773, 0.4150344, 0, 0, 0, 1, 1,
0.3265583, 0.8650638, 0.9001234, 0, 0, 0, 1, 1,
0.3281884, -0.6415157, 2.237464, 0, 0, 0, 1, 1,
0.3282869, -0.5074377, 3.18548, 0, 0, 0, 1, 1,
0.329193, 0.2715025, 1.022785, 0, 0, 0, 1, 1,
0.3328048, -0.3390082, 1.831715, 0, 0, 0, 1, 1,
0.3346191, 1.516616, 0.6971376, 1, 1, 1, 1, 1,
0.3364714, 2.05346, 0.1036258, 1, 1, 1, 1, 1,
0.3414789, 2.16515, 0.7103748, 1, 1, 1, 1, 1,
0.3438013, -1.107905, 2.466017, 1, 1, 1, 1, 1,
0.3555534, -1.41421, 3.64693, 1, 1, 1, 1, 1,
0.3559419, -0.8283983, 3.329253, 1, 1, 1, 1, 1,
0.3580115, -2.024453, 4.213111, 1, 1, 1, 1, 1,
0.3581885, 0.6562612, -0.08181701, 1, 1, 1, 1, 1,
0.3691368, 0.4148462, -0.1978406, 1, 1, 1, 1, 1,
0.3714771, 2.54399, -0.2302672, 1, 1, 1, 1, 1,
0.3804674, -0.1145444, 1.93683, 1, 1, 1, 1, 1,
0.3824838, 1.56519, -0.5912666, 1, 1, 1, 1, 1,
0.3884661, 1.75228, 0.08711673, 1, 1, 1, 1, 1,
0.3897898, -2.832714, 4.931875, 1, 1, 1, 1, 1,
0.3910582, -0.1746589, 1.892239, 1, 1, 1, 1, 1,
0.3978334, 0.1451951, 2.666598, 0, 0, 1, 1, 1,
0.3998745, -0.4983123, 2.89807, 1, 0, 0, 1, 1,
0.4070484, 0.06765341, -0.05801602, 1, 0, 0, 1, 1,
0.4091304, 0.02190591, -0.2997511, 1, 0, 0, 1, 1,
0.4093294, 0.342423, 0.1595022, 1, 0, 0, 1, 1,
0.4109561, 1.139484, 0.0770989, 1, 0, 0, 1, 1,
0.4147712, 0.05463118, 0.03849724, 0, 0, 0, 1, 1,
0.4173947, 1.716321, -0.7231082, 0, 0, 0, 1, 1,
0.4183134, 0.06058573, 1.447624, 0, 0, 0, 1, 1,
0.4216312, 0.6367435, 0.8976423, 0, 0, 0, 1, 1,
0.4218173, 0.01403533, 1.865277, 0, 0, 0, 1, 1,
0.4248707, -0.3170428, 0.9397534, 0, 0, 0, 1, 1,
0.4255636, -0.4987969, 3.450506, 0, 0, 0, 1, 1,
0.4313951, 0.7879155, 0.684544, 1, 1, 1, 1, 1,
0.4316804, -0.3003227, 1.968803, 1, 1, 1, 1, 1,
0.4339184, -0.6121987, 2.081671, 1, 1, 1, 1, 1,
0.4376617, -1.083545, 3.212248, 1, 1, 1, 1, 1,
0.4386646, 1.299603, -0.2916377, 1, 1, 1, 1, 1,
0.4429702, -0.4606303, 0.04037645, 1, 1, 1, 1, 1,
0.4441504, -0.06344836, 2.117807, 1, 1, 1, 1, 1,
0.4465663, -0.7812882, 2.728595, 1, 1, 1, 1, 1,
0.4474905, 0.7831661, 0.7074805, 1, 1, 1, 1, 1,
0.454981, -1.078386, 2.154115, 1, 1, 1, 1, 1,
0.4573332, -1.138113, 2.394513, 1, 1, 1, 1, 1,
0.4616238, -0.8382648, 2.881505, 1, 1, 1, 1, 1,
0.4628327, 0.2602322, 0.80511, 1, 1, 1, 1, 1,
0.4629207, -0.05064836, 2.23641, 1, 1, 1, 1, 1,
0.4629847, -0.9131074, 2.841964, 1, 1, 1, 1, 1,
0.4660762, -0.7597903, 2.02561, 0, 0, 1, 1, 1,
0.4721141, -0.5144182, 1.639246, 1, 0, 0, 1, 1,
0.4824297, 0.6994534, 0.4934293, 1, 0, 0, 1, 1,
0.4858518, -0.1848728, 2.919569, 1, 0, 0, 1, 1,
0.4867232, 0.5441211, 0.3151469, 1, 0, 0, 1, 1,
0.4880939, -0.4482417, 3.098948, 1, 0, 0, 1, 1,
0.4885071, 0.7659641, 0.9751678, 0, 0, 0, 1, 1,
0.4888881, -0.1900142, 3.542804, 0, 0, 0, 1, 1,
0.4953186, -0.6777032, 2.217734, 0, 0, 0, 1, 1,
0.4958792, 1.499333, 0.1380393, 0, 0, 0, 1, 1,
0.4959194, -0.6243031, 2.154697, 0, 0, 0, 1, 1,
0.4965232, 0.4002035, 1.536365, 0, 0, 0, 1, 1,
0.4973547, 0.9490157, -0.04089554, 0, 0, 0, 1, 1,
0.4985307, -0.7888287, 2.552107, 1, 1, 1, 1, 1,
0.4985631, 0.9641404, -0.01708619, 1, 1, 1, 1, 1,
0.5056823, -1.030633, 3.72084, 1, 1, 1, 1, 1,
0.5083668, 0.9291613, -0.6496683, 1, 1, 1, 1, 1,
0.5102617, -0.1400938, 3.668175, 1, 1, 1, 1, 1,
0.515002, -0.5299777, 2.09549, 1, 1, 1, 1, 1,
0.5162684, -0.4897042, 1.314608, 1, 1, 1, 1, 1,
0.5169932, 1.006524, 0.2371808, 1, 1, 1, 1, 1,
0.5188193, -0.3257907, 0.7816552, 1, 1, 1, 1, 1,
0.5215996, 0.7730891, 0.1311555, 1, 1, 1, 1, 1,
0.5230322, -1.545059, 3.395268, 1, 1, 1, 1, 1,
0.5234339, 0.4532492, 1.252224, 1, 1, 1, 1, 1,
0.5237551, -0.4127966, 1.47722, 1, 1, 1, 1, 1,
0.5240315, 0.8927028, -1.458524, 1, 1, 1, 1, 1,
0.5291259, -0.3974839, 0.853894, 1, 1, 1, 1, 1,
0.5348117, 0.3065259, 1.626727, 0, 0, 1, 1, 1,
0.5366085, 0.9602013, 0.7774794, 1, 0, 0, 1, 1,
0.5462332, -0.7666047, 3.364041, 1, 0, 0, 1, 1,
0.5484, -1.218023, 3.15651, 1, 0, 0, 1, 1,
0.5564325, 0.3010578, 1.357376, 1, 0, 0, 1, 1,
0.5567533, -0.5194841, 2.007435, 1, 0, 0, 1, 1,
0.5590671, 0.810529, 1.26623, 0, 0, 0, 1, 1,
0.5659735, -0.6305914, -0.02213288, 0, 0, 0, 1, 1,
0.5704144, -0.9121267, 2.26478, 0, 0, 0, 1, 1,
0.5711725, -0.839911, 3.428684, 0, 0, 0, 1, 1,
0.5753215, -2.254243, 3.011056, 0, 0, 0, 1, 1,
0.5769281, 0.5969589, 1.423327, 0, 0, 0, 1, 1,
0.5783937, -1.177279, 2.696066, 0, 0, 0, 1, 1,
0.5827528, -0.01015537, 1.465984, 1, 1, 1, 1, 1,
0.5831189, -0.5659389, 3.101282, 1, 1, 1, 1, 1,
0.5831373, 0.3371221, 1.394777, 1, 1, 1, 1, 1,
0.5850646, 1.637223, 0.3290086, 1, 1, 1, 1, 1,
0.5894125, 0.617744, -0.06716478, 1, 1, 1, 1, 1,
0.5954725, 0.5266046, 0.1693662, 1, 1, 1, 1, 1,
0.5976983, -1.867689, 3.075781, 1, 1, 1, 1, 1,
0.5990216, 0.6603613, 1.368324, 1, 1, 1, 1, 1,
0.5990708, -0.5213632, 1.589213, 1, 1, 1, 1, 1,
0.6008599, 0.3750992, 0.6554666, 1, 1, 1, 1, 1,
0.6046388, 0.8286924, 2.040387, 1, 1, 1, 1, 1,
0.6053718, -0.7010756, 1.135262, 1, 1, 1, 1, 1,
0.6069002, -0.7959298, 3.688529, 1, 1, 1, 1, 1,
0.6142047, -0.8343765, 2.575552, 1, 1, 1, 1, 1,
0.6195452, 1.137015, -0.5757366, 1, 1, 1, 1, 1,
0.6204211, 0.6960699, -0.162388, 0, 0, 1, 1, 1,
0.6338958, -0.07887153, 2.580214, 1, 0, 0, 1, 1,
0.6395757, 1.797578, 2.367785, 1, 0, 0, 1, 1,
0.6399044, 0.2995329, 0.8006431, 1, 0, 0, 1, 1,
0.6417392, -0.4329993, 2.332157, 1, 0, 0, 1, 1,
0.6425811, -0.4906899, 1.753504, 1, 0, 0, 1, 1,
0.6430437, 0.2463925, -0.2407075, 0, 0, 0, 1, 1,
0.6461049, -0.3819603, 2.024036, 0, 0, 0, 1, 1,
0.6473917, -1.636645, 2.704246, 0, 0, 0, 1, 1,
0.647676, 0.01593106, 1.395063, 0, 0, 0, 1, 1,
0.64771, -0.4861609, 2.000351, 0, 0, 0, 1, 1,
0.6734598, -1.152002, 2.210891, 0, 0, 0, 1, 1,
0.6784769, 1.06678, -1.285, 0, 0, 0, 1, 1,
0.6805106, -0.896992, 2.182677, 1, 1, 1, 1, 1,
0.6812448, -0.2062887, 1.729579, 1, 1, 1, 1, 1,
0.6866986, 0.1626927, 0.7875299, 1, 1, 1, 1, 1,
0.6872602, 0.2550398, 0.9897589, 1, 1, 1, 1, 1,
0.694341, 0.0002576719, 0.9922166, 1, 1, 1, 1, 1,
0.6998725, -0.314512, 2.282511, 1, 1, 1, 1, 1,
0.7001864, -0.02237671, 3.195189, 1, 1, 1, 1, 1,
0.7028015, 1.353594, 1.510357, 1, 1, 1, 1, 1,
0.704788, -0.03699112, 2.01695, 1, 1, 1, 1, 1,
0.7101997, 0.9092517, 0.5560523, 1, 1, 1, 1, 1,
0.7113134, 0.07911188, 1.336232, 1, 1, 1, 1, 1,
0.7121287, 0.4842333, 0.4907192, 1, 1, 1, 1, 1,
0.7129646, -0.5914937, 2.23614, 1, 1, 1, 1, 1,
0.7166222, 0.599206, 1.433094, 1, 1, 1, 1, 1,
0.717684, 0.8705994, 1.102306, 1, 1, 1, 1, 1,
0.7265934, -0.754437, 5.404908, 0, 0, 1, 1, 1,
0.7268062, -0.1008023, 0.8947733, 1, 0, 0, 1, 1,
0.7285372, -0.7720874, 2.376727, 1, 0, 0, 1, 1,
0.7302593, 1.470916, 0.08599275, 1, 0, 0, 1, 1,
0.7397211, 0.7801399, 0.5871353, 1, 0, 0, 1, 1,
0.7431797, 1.122408, -0.04000767, 1, 0, 0, 1, 1,
0.7432172, -0.8920892, 1.810488, 0, 0, 0, 1, 1,
0.7486945, -1.092356, 3.536867, 0, 0, 0, 1, 1,
0.7493002, -1.070191, 1.987699, 0, 0, 0, 1, 1,
0.751098, 1.562235, -0.5688459, 0, 0, 0, 1, 1,
0.7529159, -1.909057, 3.049693, 0, 0, 0, 1, 1,
0.7533633, 1.457951, -1.211589, 0, 0, 0, 1, 1,
0.757214, 0.2867783, 0.1834015, 0, 0, 0, 1, 1,
0.7628123, -0.8254283, 3.0338, 1, 1, 1, 1, 1,
0.764662, -1.488873, 3.688519, 1, 1, 1, 1, 1,
0.7700654, -0.2898006, 1.52686, 1, 1, 1, 1, 1,
0.7726463, -1.15326, 3.826792, 1, 1, 1, 1, 1,
0.7739893, -0.04385941, 2.951483, 1, 1, 1, 1, 1,
0.7747989, -0.9550461, 1.511566, 1, 1, 1, 1, 1,
0.7764313, 1.186434, 1.002028, 1, 1, 1, 1, 1,
0.7804207, 1.151007, -0.1656734, 1, 1, 1, 1, 1,
0.7836722, 0.3199986, 1.939852, 1, 1, 1, 1, 1,
0.7881539, 1.430154, -0.440369, 1, 1, 1, 1, 1,
0.791375, 1.08913, 2.863699, 1, 1, 1, 1, 1,
0.7924442, -0.0291039, 2.242193, 1, 1, 1, 1, 1,
0.7930983, -0.5006785, 2.586195, 1, 1, 1, 1, 1,
0.7947877, 0.2616385, 1.629565, 1, 1, 1, 1, 1,
0.7971795, -0.7648638, 1.668584, 1, 1, 1, 1, 1,
0.7984141, -1.914553, 1.33131, 0, 0, 1, 1, 1,
0.7990594, -1.025207, 1.218295, 1, 0, 0, 1, 1,
0.8012387, -0.3180002, 3.015685, 1, 0, 0, 1, 1,
0.8017701, 1.690752, -1.342476, 1, 0, 0, 1, 1,
0.8039442, 0.9111646, 0.1199137, 1, 0, 0, 1, 1,
0.80478, 0.7037643, -0.4148118, 1, 0, 0, 1, 1,
0.8061209, -1.161988, 4.226781, 0, 0, 0, 1, 1,
0.8098093, 0.9150715, -0.7575585, 0, 0, 0, 1, 1,
0.8137388, -0.4802251, 1.889034, 0, 0, 0, 1, 1,
0.8141658, 0.0222767, 1.502663, 0, 0, 0, 1, 1,
0.8195621, -1.617929, 3.765698, 0, 0, 0, 1, 1,
0.8210107, -0.5666375, 1.882765, 0, 0, 0, 1, 1,
0.8261414, 1.101116, 0.4072783, 0, 0, 0, 1, 1,
0.8290504, 0.1584472, 1.857815, 1, 1, 1, 1, 1,
0.8318374, 0.1222158, 1.4457, 1, 1, 1, 1, 1,
0.8399616, 1.715295, 0.3510754, 1, 1, 1, 1, 1,
0.8404424, 0.1612628, 0.7056618, 1, 1, 1, 1, 1,
0.8577945, 1.040473, 0.6262239, 1, 1, 1, 1, 1,
0.8663332, 1.319981, 0.6134877, 1, 1, 1, 1, 1,
0.8701866, 2.482344, -0.3487464, 1, 1, 1, 1, 1,
0.8783212, 1.02489, 0.2410111, 1, 1, 1, 1, 1,
0.8871312, 0.6570112, -0.01668037, 1, 1, 1, 1, 1,
0.8881713, 1.848402, -0.3803641, 1, 1, 1, 1, 1,
0.8916422, -0.4218333, 2.060567, 1, 1, 1, 1, 1,
0.9062594, -0.8469174, 3.300308, 1, 1, 1, 1, 1,
0.9106485, 0.06378572, 1.424799, 1, 1, 1, 1, 1,
0.9121259, 1.216697, 0.2488846, 1, 1, 1, 1, 1,
0.92633, -0.1144647, 0.2142702, 1, 1, 1, 1, 1,
0.9365676, -0.5981979, 3.573873, 0, 0, 1, 1, 1,
0.942284, 0.2203078, 0.5866184, 1, 0, 0, 1, 1,
0.9481282, 0.07966696, 2.185929, 1, 0, 0, 1, 1,
0.9587706, -2.110805, 1.712576, 1, 0, 0, 1, 1,
0.959193, 2.470392, -0.3714535, 1, 0, 0, 1, 1,
0.9617742, 0.7069107, 1.895195, 1, 0, 0, 1, 1,
0.9649198, -0.7071205, 3.387096, 0, 0, 0, 1, 1,
0.9650229, 1.82054, 0.07653963, 0, 0, 0, 1, 1,
0.9717319, -0.4010212, 1.950068, 0, 0, 0, 1, 1,
0.9719211, 0.6330076, 0.7603099, 0, 0, 0, 1, 1,
0.9762251, 0.2650739, 1.942657, 0, 0, 0, 1, 1,
0.9796032, 0.5412965, 0.6923872, 0, 0, 0, 1, 1,
0.9835497, 0.3125445, 0.3589708, 0, 0, 0, 1, 1,
0.9922534, 0.9036703, 0.4185582, 1, 1, 1, 1, 1,
0.9939182, 1.161962, 1.869585, 1, 1, 1, 1, 1,
0.9980398, -0.143842, 1.704382, 1, 1, 1, 1, 1,
1.003192, -0.5755101, 2.248549, 1, 1, 1, 1, 1,
1.004908, 0.7814706, 0.7583804, 1, 1, 1, 1, 1,
1.018101, 1.512111, 1.937703, 1, 1, 1, 1, 1,
1.019423, -1.379467, 2.465003, 1, 1, 1, 1, 1,
1.023638, 0.06522319, 1.827475, 1, 1, 1, 1, 1,
1.026714, -0.1209217, 1.06475, 1, 1, 1, 1, 1,
1.028997, 0.237417, 0.3407997, 1, 1, 1, 1, 1,
1.030416, -1.801014, 2.711684, 1, 1, 1, 1, 1,
1.033926, 1.425475, -1.927204, 1, 1, 1, 1, 1,
1.034208, -0.9226809, 2.223306, 1, 1, 1, 1, 1,
1.036952, 2.225626, 2.424022, 1, 1, 1, 1, 1,
1.041563, 0.01925953, 1.324296, 1, 1, 1, 1, 1,
1.043497, -0.4442607, 1.455026, 0, 0, 1, 1, 1,
1.049402, 0.6244799, 2.722836, 1, 0, 0, 1, 1,
1.05362, 0.6584933, 1.022969, 1, 0, 0, 1, 1,
1.055292, 0.05635802, 2.070223, 1, 0, 0, 1, 1,
1.055308, -1.548206, 1.628527, 1, 0, 0, 1, 1,
1.057903, -0.10236, 2.121395, 1, 0, 0, 1, 1,
1.058743, 0.4752259, -0.06269751, 0, 0, 0, 1, 1,
1.065403, 1.380591, -0.5526619, 0, 0, 0, 1, 1,
1.07747, 0.4578394, -0.4766707, 0, 0, 0, 1, 1,
1.082921, 0.08216093, 0.7213451, 0, 0, 0, 1, 1,
1.084707, -2.336986, 2.493272, 0, 0, 0, 1, 1,
1.084863, -1.280044, 3.988378, 0, 0, 0, 1, 1,
1.102479, -0.4396673, 3.184798, 0, 0, 0, 1, 1,
1.105905, -0.3027083, 2.661125, 1, 1, 1, 1, 1,
1.106166, -0.3918594, 2.453091, 1, 1, 1, 1, 1,
1.109168, 1.410608, -0.01072317, 1, 1, 1, 1, 1,
1.109777, 0.2451379, 0.6503137, 1, 1, 1, 1, 1,
1.111348, -1.183933, 2.049453, 1, 1, 1, 1, 1,
1.113783, 0.3148744, -0.2616438, 1, 1, 1, 1, 1,
1.115478, 0.2888345, 2.230533, 1, 1, 1, 1, 1,
1.117894, 0.7253373, 1.005479, 1, 1, 1, 1, 1,
1.121885, 0.2671468, 2.231126, 1, 1, 1, 1, 1,
1.140576, -0.3184897, 0.8361765, 1, 1, 1, 1, 1,
1.140786, -1.412209, 2.021495, 1, 1, 1, 1, 1,
1.143257, 0.6622485, -0.2327937, 1, 1, 1, 1, 1,
1.148752, -0.1280282, 1.300492, 1, 1, 1, 1, 1,
1.150807, -0.6376821, 2.507495, 1, 1, 1, 1, 1,
1.154054, -0.1255421, 2.895916, 1, 1, 1, 1, 1,
1.161061, 1.143453, 1.165646, 0, 0, 1, 1, 1,
1.162509, -0.9130421, 3.967692, 1, 0, 0, 1, 1,
1.168173, -0.8656602, 1.175917, 1, 0, 0, 1, 1,
1.168461, -0.3154348, 1.985373, 1, 0, 0, 1, 1,
1.171129, 2.28183, -0.1710747, 1, 0, 0, 1, 1,
1.171811, 0.8869586, -0.5481064, 1, 0, 0, 1, 1,
1.172596, 0.5858002, 2.37412, 0, 0, 0, 1, 1,
1.173972, 2.488941, 1.389621, 0, 0, 0, 1, 1,
1.177481, 0.6861278, 2.037966, 0, 0, 0, 1, 1,
1.180522, 0.2364451, 3.214683, 0, 0, 0, 1, 1,
1.180833, 0.3939019, 0.7662804, 0, 0, 0, 1, 1,
1.18288, 0.8248435, 1.955187, 0, 0, 0, 1, 1,
1.187676, 1.101667, 1.332866, 0, 0, 0, 1, 1,
1.189033, 0.6690797, 1.948323, 1, 1, 1, 1, 1,
1.208062, -1.221392, 1.358235, 1, 1, 1, 1, 1,
1.211477, -0.7557536, 1.902285, 1, 1, 1, 1, 1,
1.220362, -0.1613557, 1.242079, 1, 1, 1, 1, 1,
1.221815, -1.10498, 2.362841, 1, 1, 1, 1, 1,
1.232213, -1.453966, 1.022091, 1, 1, 1, 1, 1,
1.234494, -2.153275, 3.342755, 1, 1, 1, 1, 1,
1.235556, 1.485723, 0.3890569, 1, 1, 1, 1, 1,
1.241169, 0.1047367, 1.851952, 1, 1, 1, 1, 1,
1.245289, 0.4490562, 1.099286, 1, 1, 1, 1, 1,
1.254945, 0.0006722907, 1.293054, 1, 1, 1, 1, 1,
1.263993, -1.264273, 2.708894, 1, 1, 1, 1, 1,
1.266192, -1.894247, 2.665277, 1, 1, 1, 1, 1,
1.266606, -0.5085168, 2.131988, 1, 1, 1, 1, 1,
1.267723, 0.5344365, 2.45937, 1, 1, 1, 1, 1,
1.285586, 0.04508764, 1.099145, 0, 0, 1, 1, 1,
1.292241, 0.683172, 1.324004, 1, 0, 0, 1, 1,
1.292405, 0.05833857, 0.1963527, 1, 0, 0, 1, 1,
1.297936, -1.656091, 0.846635, 1, 0, 0, 1, 1,
1.303212, 0.08817285, 0.947984, 1, 0, 0, 1, 1,
1.305671, 0.4745927, 1.692096, 1, 0, 0, 1, 1,
1.310249, 1.077039, 1.421959, 0, 0, 0, 1, 1,
1.315061, 0.8506895, 0.8794852, 0, 0, 0, 1, 1,
1.32421, -0.7482241, 2.573646, 0, 0, 0, 1, 1,
1.327386, 0.1876383, 2.684519, 0, 0, 0, 1, 1,
1.329022, -0.4465042, 1.12195, 0, 0, 0, 1, 1,
1.332676, 0.9583489, 1.323852, 0, 0, 0, 1, 1,
1.334699, -0.3948814, 3.309313, 0, 0, 0, 1, 1,
1.336416, -0.6049474, 0.9200044, 1, 1, 1, 1, 1,
1.338098, 0.4905604, 2.238308, 1, 1, 1, 1, 1,
1.341282, -0.09442533, 1.223718, 1, 1, 1, 1, 1,
1.347868, 0.4748214, 1.941938, 1, 1, 1, 1, 1,
1.348128, -0.1264461, 3.085408, 1, 1, 1, 1, 1,
1.363896, 0.6925398, 0.7979724, 1, 1, 1, 1, 1,
1.366277, 0.03809471, 2.045682, 1, 1, 1, 1, 1,
1.367757, 0.1611826, 1.604914, 1, 1, 1, 1, 1,
1.373163, 0.5772364, 1.626388, 1, 1, 1, 1, 1,
1.378363, 1.793753, 0.9980023, 1, 1, 1, 1, 1,
1.387049, 0.4340255, 2.936153, 1, 1, 1, 1, 1,
1.387181, -0.08780474, 0.6962775, 1, 1, 1, 1, 1,
1.395356, -0.6625135, 3.17524, 1, 1, 1, 1, 1,
1.399434, 1.433766, 0.7934706, 1, 1, 1, 1, 1,
1.400191, -0.6230406, 3.551963, 1, 1, 1, 1, 1,
1.411949, -1.389479, 1.808006, 0, 0, 1, 1, 1,
1.417091, -1.968375, 1.784055, 1, 0, 0, 1, 1,
1.429613, -0.0246128, 1.26587, 1, 0, 0, 1, 1,
1.445507, -0.3994324, 0.2890141, 1, 0, 0, 1, 1,
1.469411, -0.7475819, 3.675526, 1, 0, 0, 1, 1,
1.48207, 0.08438484, 2.791639, 1, 0, 0, 1, 1,
1.503238, -0.5221712, 2.8897, 0, 0, 0, 1, 1,
1.50428, 0.2823583, 3.334832, 0, 0, 0, 1, 1,
1.507394, 0.02380618, 1.809089, 0, 0, 0, 1, 1,
1.517174, 0.3058054, 2.058217, 0, 0, 0, 1, 1,
1.518528, -1.128208, 2.324433, 0, 0, 0, 1, 1,
1.519303, -1.692859, 2.524167, 0, 0, 0, 1, 1,
1.526754, 0.1973886, -0.3599211, 0, 0, 0, 1, 1,
1.529009, -1.457645, 1.08812, 1, 1, 1, 1, 1,
1.533077, 0.9050503, 0.9816343, 1, 1, 1, 1, 1,
1.54175, -0.3617146, 1.14279, 1, 1, 1, 1, 1,
1.542072, -0.05600383, 0.953397, 1, 1, 1, 1, 1,
1.544824, -1.21952, 1.406099, 1, 1, 1, 1, 1,
1.588293, 1.086875, 1.473176, 1, 1, 1, 1, 1,
1.592508, 1.119654, -0.6034392, 1, 1, 1, 1, 1,
1.596197, 0.09165663, 1.679271, 1, 1, 1, 1, 1,
1.60209, 0.2204653, 1.136528, 1, 1, 1, 1, 1,
1.60416, 0.3641025, 2.027193, 1, 1, 1, 1, 1,
1.651645, 0.7549534, 0.3982919, 1, 1, 1, 1, 1,
1.652354, 1.505343, 0.6526822, 1, 1, 1, 1, 1,
1.663082, 0.4757134, 1.836406, 1, 1, 1, 1, 1,
1.681364, -1.176661, 2.855423, 1, 1, 1, 1, 1,
1.684747, 0.6782223, 0.5597046, 1, 1, 1, 1, 1,
1.688251, -0.8770316, 2.651996, 0, 0, 1, 1, 1,
1.699955, 0.2597727, 0.5587012, 1, 0, 0, 1, 1,
1.700242, -0.8035955, 1.746659, 1, 0, 0, 1, 1,
1.701991, -0.1199881, 2.01557, 1, 0, 0, 1, 1,
1.714, -0.1140062, 2.116443, 1, 0, 0, 1, 1,
1.718989, 0.7588255, 3.754017, 1, 0, 0, 1, 1,
1.738143, 1.225574, 0.6183602, 0, 0, 0, 1, 1,
1.779856, -0.9446589, 2.250068, 0, 0, 0, 1, 1,
1.78725, 2.641353, 1.171636, 0, 0, 0, 1, 1,
1.795572, 1.282519, 2.012225, 0, 0, 0, 1, 1,
1.802106, -1.537618, 1.809891, 0, 0, 0, 1, 1,
1.823902, 1.579355, 2.81415, 0, 0, 0, 1, 1,
1.860177, 0.5421876, 0.2396857, 0, 0, 0, 1, 1,
1.86498, 1.370764, 1.964574, 1, 1, 1, 1, 1,
1.870692, 2.716261, 0.7722105, 1, 1, 1, 1, 1,
1.879755, -1.645706, 3.376439, 1, 1, 1, 1, 1,
1.892029, 2.148268, -0.137388, 1, 1, 1, 1, 1,
1.904737, 0.6747672, 0.001040662, 1, 1, 1, 1, 1,
1.924678, -0.4406261, 3.205021, 1, 1, 1, 1, 1,
1.933267, 0.2172145, 2.143113, 1, 1, 1, 1, 1,
1.964582, -0.02508611, 1.826114, 1, 1, 1, 1, 1,
1.981734, -0.4805259, 0.5514586, 1, 1, 1, 1, 1,
2.005003, -1.200722, 2.389569, 1, 1, 1, 1, 1,
2.026322, -1.626637, 1.268156, 1, 1, 1, 1, 1,
2.050808, 0.8149955, 1.344662, 1, 1, 1, 1, 1,
2.066765, 0.5381915, 1.453762, 1, 1, 1, 1, 1,
2.072014, 1.406538, 2.766768, 1, 1, 1, 1, 1,
2.093673, -0.6761383, 2.938143, 1, 1, 1, 1, 1,
2.12756, -1.009359, 2.96184, 0, 0, 1, 1, 1,
2.135016, -0.7027554, 1.265501, 1, 0, 0, 1, 1,
2.155342, -0.07049116, -0.6189018, 1, 0, 0, 1, 1,
2.17348, -0.8129424, 1.762111, 1, 0, 0, 1, 1,
2.260646, -0.06963982, 1.070947, 1, 0, 0, 1, 1,
2.313031, -0.6184084, 2.103456, 1, 0, 0, 1, 1,
2.358503, -0.4684095, 1.003712, 0, 0, 0, 1, 1,
2.371891, 1.012557, 0.0670603, 0, 0, 0, 1, 1,
2.375668, 1.473752, 2.385916, 0, 0, 0, 1, 1,
2.405617, 1.0041, 0.8677853, 0, 0, 0, 1, 1,
2.414208, 0.2568243, 2.48653, 0, 0, 0, 1, 1,
2.418977, 0.334242, 3.790368, 0, 0, 0, 1, 1,
2.422424, 0.8880482, 1.402071, 0, 0, 0, 1, 1,
2.474901, 0.5882018, 1.698158, 1, 1, 1, 1, 1,
2.493904, -1.318647, 2.991505, 1, 1, 1, 1, 1,
2.564015, 1.115507, 1.682661, 1, 1, 1, 1, 1,
2.604389, 0.356328, 1.692863, 1, 1, 1, 1, 1,
2.639034, -0.9480906, 1.316221, 1, 1, 1, 1, 1,
3.063235, -0.3442851, 1.474904, 1, 1, 1, 1, 1,
3.298083, -0.4621705, 2.364203, 1, 1, 1, 1, 1
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
var radius = 9.671751;
var distance = 33.97162;
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
mvMatrix.translate( -0.06910777, 0.05741096, -0.08112264 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97162);
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
