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
-3.533148, 0.5122758, -2.671061, 1, 0, 0, 1,
-3.052021, 0.3103202, -1.204317, 1, 0.007843138, 0, 1,
-2.852823, -0.2433771, -1.944218, 1, 0.01176471, 0, 1,
-2.581598, 0.2941099, -1.887139, 1, 0.01960784, 0, 1,
-2.577202, 2.049316, -0.5820539, 1, 0.02352941, 0, 1,
-2.509452, 1.045501, -1.595425, 1, 0.03137255, 0, 1,
-2.507752, 0.1644678, -0.1161708, 1, 0.03529412, 0, 1,
-2.434073, -1.602061, -3.048397, 1, 0.04313726, 0, 1,
-2.433725, -0.3813095, -2.064923, 1, 0.04705882, 0, 1,
-2.386682, 1.805313, -1.411952, 1, 0.05490196, 0, 1,
-2.342463, 1.813883, -2.511765, 1, 0.05882353, 0, 1,
-2.283493, -0.6881609, -1.52962, 1, 0.06666667, 0, 1,
-2.280596, -0.7523802, -0.636211, 1, 0.07058824, 0, 1,
-2.275634, -1.301664, -0.8232406, 1, 0.07843138, 0, 1,
-2.237503, -0.5957513, -2.506359, 1, 0.08235294, 0, 1,
-2.181088, -2.077643, -2.234952, 1, 0.09019608, 0, 1,
-2.139221, -1.318693, -2.209771, 1, 0.09411765, 0, 1,
-2.122135, -1.772228, -2.692085, 1, 0.1019608, 0, 1,
-2.084054, -0.6320333, -1.450831, 1, 0.1098039, 0, 1,
-2.05749, 0.1823541, -1.815473, 1, 0.1137255, 0, 1,
-2.056846, 0.03349652, -2.687282, 1, 0.1215686, 0, 1,
-2.055442, -0.1615009, -0.0741241, 1, 0.1254902, 0, 1,
-2.016775, 1.386523, -1.358807, 1, 0.1333333, 0, 1,
-2.016129, -0.4613671, -0.3043584, 1, 0.1372549, 0, 1,
-1.980353, -0.08805658, -2.90881, 1, 0.145098, 0, 1,
-1.966793, -1.000398, -3.769581, 1, 0.1490196, 0, 1,
-1.96474, 0.9663756, -2.721472, 1, 0.1568628, 0, 1,
-1.943842, -0.229221, -3.310448, 1, 0.1607843, 0, 1,
-1.943235, -0.7004793, -1.621661, 1, 0.1686275, 0, 1,
-1.923705, 0.7795516, -2.054699, 1, 0.172549, 0, 1,
-1.918984, -0.3481086, -1.295488, 1, 0.1803922, 0, 1,
-1.865554, 0.1188518, -0.4638476, 1, 0.1843137, 0, 1,
-1.847603, -0.2845253, -1.370648, 1, 0.1921569, 0, 1,
-1.84575, -0.406787, -2.427495, 1, 0.1960784, 0, 1,
-1.823058, -1.218382, -0.8861704, 1, 0.2039216, 0, 1,
-1.777049, 0.7662081, -2.149877, 1, 0.2117647, 0, 1,
-1.771062, 0.3383887, -0.5727636, 1, 0.2156863, 0, 1,
-1.744171, 1.054745, -1.282067, 1, 0.2235294, 0, 1,
-1.74231, -0.733009, -0.9746996, 1, 0.227451, 0, 1,
-1.706522, 1.364099, -0.9771106, 1, 0.2352941, 0, 1,
-1.696231, 1.368452, -0.6560166, 1, 0.2392157, 0, 1,
-1.68841, -0.570573, -3.125639, 1, 0.2470588, 0, 1,
-1.683888, 1.178392, -0.4761612, 1, 0.2509804, 0, 1,
-1.676648, -0.2352295, -1.701355, 1, 0.2588235, 0, 1,
-1.667439, -0.5913979, -1.26957, 1, 0.2627451, 0, 1,
-1.660382, 0.8121027, -2.473373, 1, 0.2705882, 0, 1,
-1.652927, 0.7685364, -0.04998378, 1, 0.2745098, 0, 1,
-1.621782, -0.4514171, -3.147745, 1, 0.282353, 0, 1,
-1.615218, 0.6005973, -0.3740646, 1, 0.2862745, 0, 1,
-1.592766, -0.5472577, -1.26804, 1, 0.2941177, 0, 1,
-1.57994, -0.9765827, -1.529035, 1, 0.3019608, 0, 1,
-1.566752, 0.0961713, -1.354672, 1, 0.3058824, 0, 1,
-1.545054, -0.3482709, -1.672009, 1, 0.3137255, 0, 1,
-1.539189, -1.728716, -1.373518, 1, 0.3176471, 0, 1,
-1.538976, 0.5971758, 0.108353, 1, 0.3254902, 0, 1,
-1.53252, 0.701279, -1.037389, 1, 0.3294118, 0, 1,
-1.529385, 2.301724, 0.6187543, 1, 0.3372549, 0, 1,
-1.509754, -0.02677073, -3.292985, 1, 0.3411765, 0, 1,
-1.502583, 2.638974, -0.6677829, 1, 0.3490196, 0, 1,
-1.492166, -0.6802343, -1.762196, 1, 0.3529412, 0, 1,
-1.489901, 0.1220781, -1.654614, 1, 0.3607843, 0, 1,
-1.483403, 1.312618, -2.237952, 1, 0.3647059, 0, 1,
-1.46074, -0.4375013, -4.006549, 1, 0.372549, 0, 1,
-1.443979, -1.128604, -2.674512, 1, 0.3764706, 0, 1,
-1.443426, 0.1373138, 1.020234, 1, 0.3843137, 0, 1,
-1.433374, -2.398708, -3.758413, 1, 0.3882353, 0, 1,
-1.433049, 0.7473915, -0.7341148, 1, 0.3960784, 0, 1,
-1.429388, -0.2776324, -2.466355, 1, 0.4039216, 0, 1,
-1.428396, -1.81742, -0.8302143, 1, 0.4078431, 0, 1,
-1.404239, -1.231999, -2.397031, 1, 0.4156863, 0, 1,
-1.403599, -0.120265, -1.836252, 1, 0.4196078, 0, 1,
-1.403166, 0.4739197, 0.09337351, 1, 0.427451, 0, 1,
-1.395705, 0.2781548, -1.651375, 1, 0.4313726, 0, 1,
-1.390032, -0.683668, -3.406026, 1, 0.4392157, 0, 1,
-1.381924, -0.3651013, -1.150383, 1, 0.4431373, 0, 1,
-1.379774, -0.5800717, -1.512501, 1, 0.4509804, 0, 1,
-1.37242, -0.9974879, -2.444278, 1, 0.454902, 0, 1,
-1.369559, 0.6430446, -1.210559, 1, 0.4627451, 0, 1,
-1.356885, -0.2242707, -2.238542, 1, 0.4666667, 0, 1,
-1.354811, 1.889275, -0.813265, 1, 0.4745098, 0, 1,
-1.350751, 0.7189692, -0.08723127, 1, 0.4784314, 0, 1,
-1.347918, 2.517395, -1.335587, 1, 0.4862745, 0, 1,
-1.344126, -2.052899, -3.235147, 1, 0.4901961, 0, 1,
-1.342204, 1.118298, -1.122854, 1, 0.4980392, 0, 1,
-1.340063, 0.2168385, -2.263932, 1, 0.5058824, 0, 1,
-1.334414, -0.4709257, -1.352206, 1, 0.509804, 0, 1,
-1.332775, -0.4324576, -2.08785, 1, 0.5176471, 0, 1,
-1.332751, 1.158816, -1.774418, 1, 0.5215687, 0, 1,
-1.33114, 3.113279, -0.8733778, 1, 0.5294118, 0, 1,
-1.330309, 0.001598371, 0.1222923, 1, 0.5333334, 0, 1,
-1.327539, -0.7118449, -1.722273, 1, 0.5411765, 0, 1,
-1.324134, 1.816149, -1.69986, 1, 0.5450981, 0, 1,
-1.315988, -0.3329212, -2.067083, 1, 0.5529412, 0, 1,
-1.312607, -1.18387, -2.074176, 1, 0.5568628, 0, 1,
-1.311586, 0.8434778, -0.5293584, 1, 0.5647059, 0, 1,
-1.29607, 1.163365, -0.8582014, 1, 0.5686275, 0, 1,
-1.290547, 0.04040604, -1.111917, 1, 0.5764706, 0, 1,
-1.289902, 0.1172208, 0.1938793, 1, 0.5803922, 0, 1,
-1.279477, -0.900277, -2.551362, 1, 0.5882353, 0, 1,
-1.273794, 1.335, -1.294051, 1, 0.5921569, 0, 1,
-1.269055, 0.802156, 0.01541742, 1, 0.6, 0, 1,
-1.266834, 1.050229, -0.614021, 1, 0.6078432, 0, 1,
-1.266655, 0.8955378, -0.8761033, 1, 0.6117647, 0, 1,
-1.266495, -0.3450638, -0.9275047, 1, 0.6196079, 0, 1,
-1.258812, -2.176106, -3.53304, 1, 0.6235294, 0, 1,
-1.253704, -0.9985781, -0.7502723, 1, 0.6313726, 0, 1,
-1.250195, -1.220083, -1.786791, 1, 0.6352941, 0, 1,
-1.249455, 0.8048723, 0.3015562, 1, 0.6431373, 0, 1,
-1.249366, -1.000867, -1.013309, 1, 0.6470588, 0, 1,
-1.247368, -1.401897, -1.378164, 1, 0.654902, 0, 1,
-1.224758, -0.6390111, -0.4870104, 1, 0.6588235, 0, 1,
-1.222644, 1.089228, -3.408381, 1, 0.6666667, 0, 1,
-1.215782, -0.3892404, -1.813989, 1, 0.6705883, 0, 1,
-1.211877, -0.9145268, -3.567282, 1, 0.6784314, 0, 1,
-1.207452, 0.1357327, -1.997375, 1, 0.682353, 0, 1,
-1.203888, -0.5030786, -2.974562, 1, 0.6901961, 0, 1,
-1.203005, -0.1100793, -2.053162, 1, 0.6941177, 0, 1,
-1.199789, 1.686254, 0.96065, 1, 0.7019608, 0, 1,
-1.194514, -0.8088868, -2.033599, 1, 0.7098039, 0, 1,
-1.18602, 0.4913572, -0.5526394, 1, 0.7137255, 0, 1,
-1.165469, 0.9895899, -2.650504, 1, 0.7215686, 0, 1,
-1.155004, -0.1464006, -0.9840248, 1, 0.7254902, 0, 1,
-1.153848, -0.3303049, -2.521842, 1, 0.7333333, 0, 1,
-1.145667, -0.1803813, -1.773752, 1, 0.7372549, 0, 1,
-1.137172, 1.277535, -0.3681614, 1, 0.7450981, 0, 1,
-1.136438, -0.4893465, -1.602894, 1, 0.7490196, 0, 1,
-1.133126, -0.1819512, -2.938595, 1, 0.7568628, 0, 1,
-1.130942, 0.066342, -1.509009, 1, 0.7607843, 0, 1,
-1.11874, 1.583395, -2.449834, 1, 0.7686275, 0, 1,
-1.115792, -1.051457, -3.596891, 1, 0.772549, 0, 1,
-1.114455, 1.135241, -1.540648, 1, 0.7803922, 0, 1,
-1.111621, -1.975534, -2.587598, 1, 0.7843137, 0, 1,
-1.104039, -0.9687116, -1.447019, 1, 0.7921569, 0, 1,
-1.104004, 0.4189932, -3.258145, 1, 0.7960784, 0, 1,
-1.103707, -0.4417548, -1.916044, 1, 0.8039216, 0, 1,
-1.093416, -0.7375825, -1.823829, 1, 0.8117647, 0, 1,
-1.080646, 1.499066, -0.0191584, 1, 0.8156863, 0, 1,
-1.078895, -0.6146886, -1.19614, 1, 0.8235294, 0, 1,
-1.078302, -1.256524, -1.15032, 1, 0.827451, 0, 1,
-1.075409, -1.206018, -1.731641, 1, 0.8352941, 0, 1,
-1.075323, -1.956266, -2.906762, 1, 0.8392157, 0, 1,
-1.065222, -0.3150707, 1.364453, 1, 0.8470588, 0, 1,
-1.064489, -0.7887065, -2.660436, 1, 0.8509804, 0, 1,
-1.055479, 1.476233, 2.383773, 1, 0.8588235, 0, 1,
-1.053487, 0.7669271, 0.8270382, 1, 0.8627451, 0, 1,
-1.041471, -0.566888, -2.117717, 1, 0.8705882, 0, 1,
-1.040561, -0.247625, -2.461549, 1, 0.8745098, 0, 1,
-1.030722, 0.4107084, -1.343921, 1, 0.8823529, 0, 1,
-1.030305, -1.40719, -2.099351, 1, 0.8862745, 0, 1,
-1.028954, 0.6855322, -0.9191896, 1, 0.8941177, 0, 1,
-1.028262, -0.6583788, -2.234098, 1, 0.8980392, 0, 1,
-1.027272, -1.111445, -2.606482, 1, 0.9058824, 0, 1,
-1.025468, 1.948417, -0.321966, 1, 0.9137255, 0, 1,
-1.022815, -0.3197137, -2.584131, 1, 0.9176471, 0, 1,
-1.022375, -0.5203215, -1.838971, 1, 0.9254902, 0, 1,
-1.021803, -0.8850778, -3.423314, 1, 0.9294118, 0, 1,
-1.019554, 0.5092695, -1.351968, 1, 0.9372549, 0, 1,
-1.01949, 1.30331, -2.853293, 1, 0.9411765, 0, 1,
-1.016422, -3.176315, -2.502181, 1, 0.9490196, 0, 1,
-1.01212, 0.6704911, 0.9025281, 1, 0.9529412, 0, 1,
-1.009126, 0.5771508, -0.09533531, 1, 0.9607843, 0, 1,
-1.007255, -1.579717, -0.6839642, 1, 0.9647059, 0, 1,
-1.005055, 1.004877, -1.965442, 1, 0.972549, 0, 1,
-1.003867, -0.06983831, -2.898516, 1, 0.9764706, 0, 1,
-1.002859, -1.688505, -2.31169, 1, 0.9843137, 0, 1,
-0.9975319, -0.7066432, -2.461856, 1, 0.9882353, 0, 1,
-0.9948884, -0.407461, -3.030931, 1, 0.9960784, 0, 1,
-0.9921421, 2.042876, -1.598506, 0.9960784, 1, 0, 1,
-0.9874228, -0.8765906, -2.904503, 0.9921569, 1, 0, 1,
-0.9857346, 0.2551047, -0.4498956, 0.9843137, 1, 0, 1,
-0.9762931, -0.1874116, -1.732609, 0.9803922, 1, 0, 1,
-0.9691263, 0.3571009, -1.00924, 0.972549, 1, 0, 1,
-0.9672481, -0.1070619, -1.006807, 0.9686275, 1, 0, 1,
-0.9656508, -0.6497522, -1.083923, 0.9607843, 1, 0, 1,
-0.9616848, -0.3865072, -0.7652351, 0.9568627, 1, 0, 1,
-0.9576381, -0.4291111, -3.413436, 0.9490196, 1, 0, 1,
-0.9510148, -0.8417292, -3.158995, 0.945098, 1, 0, 1,
-0.9466728, 0.140655, -1.959023, 0.9372549, 1, 0, 1,
-0.9423253, 0.126294, -3.569093, 0.9333333, 1, 0, 1,
-0.9408042, -0.0863924, -0.4001372, 0.9254902, 1, 0, 1,
-0.940113, -1.172726, -1.007309, 0.9215686, 1, 0, 1,
-0.9389692, 0.4411676, -1.13158, 0.9137255, 1, 0, 1,
-0.9341372, 0.866499, -1.390543, 0.9098039, 1, 0, 1,
-0.9287856, 1.610321, 0.6586046, 0.9019608, 1, 0, 1,
-0.9278908, -0.2613495, -2.209165, 0.8941177, 1, 0, 1,
-0.9272946, 0.9506133, 0.2429398, 0.8901961, 1, 0, 1,
-0.9150432, -0.4243076, -1.448663, 0.8823529, 1, 0, 1,
-0.9149191, -0.07768602, -0.9213782, 0.8784314, 1, 0, 1,
-0.9137623, -1.805051, -1.859646, 0.8705882, 1, 0, 1,
-0.9125072, -0.9356067, -1.97059, 0.8666667, 1, 0, 1,
-0.9062806, 1.218008, 0.7013832, 0.8588235, 1, 0, 1,
-0.9033563, -0.5675817, -2.120968, 0.854902, 1, 0, 1,
-0.9024547, -0.5168411, 0.1683088, 0.8470588, 1, 0, 1,
-0.8983642, -0.897442, -2.092805, 0.8431373, 1, 0, 1,
-0.8973178, -1.958909, -2.921128, 0.8352941, 1, 0, 1,
-0.897316, -1.571431, -2.599693, 0.8313726, 1, 0, 1,
-0.8902361, 1.311847, -0.773437, 0.8235294, 1, 0, 1,
-0.8895018, 0.1391477, -1.343744, 0.8196079, 1, 0, 1,
-0.8886217, -0.7962136, -2.863218, 0.8117647, 1, 0, 1,
-0.8817573, -0.1687629, -2.083383, 0.8078431, 1, 0, 1,
-0.8804787, 0.1328577, -0.5141216, 0.8, 1, 0, 1,
-0.8777149, 0.04023401, -2.044702, 0.7921569, 1, 0, 1,
-0.8721925, 1.492654, -1.332988, 0.7882353, 1, 0, 1,
-0.8712492, 0.5286465, -0.3098025, 0.7803922, 1, 0, 1,
-0.8670973, 0.2605065, -1.046868, 0.7764706, 1, 0, 1,
-0.8535328, -1.106647, -2.939169, 0.7686275, 1, 0, 1,
-0.8497244, -0.8789434, -0.09933788, 0.7647059, 1, 0, 1,
-0.8466591, -0.5322988, -2.54225, 0.7568628, 1, 0, 1,
-0.8381167, -1.530147, -3.901303, 0.7529412, 1, 0, 1,
-0.8380278, 0.1714473, -0.6852421, 0.7450981, 1, 0, 1,
-0.8359326, -1.45131, -1.71663, 0.7411765, 1, 0, 1,
-0.8283535, -1.351971, -3.063779, 0.7333333, 1, 0, 1,
-0.824324, -0.9240836, -3.35863, 0.7294118, 1, 0, 1,
-0.8221304, -0.04975063, -2.857097, 0.7215686, 1, 0, 1,
-0.8216562, -0.2384211, -1.501987, 0.7176471, 1, 0, 1,
-0.8187022, -0.1038665, 0.05846403, 0.7098039, 1, 0, 1,
-0.8103123, 1.429452, 0.4163106, 0.7058824, 1, 0, 1,
-0.8091367, 0.08688313, -1.841925, 0.6980392, 1, 0, 1,
-0.8087391, -1.257665, -1.609763, 0.6901961, 1, 0, 1,
-0.8023647, 0.8880851, -2.254562, 0.6862745, 1, 0, 1,
-0.8009699, -1.024881, -4.035906, 0.6784314, 1, 0, 1,
-0.8002291, -0.5193608, -2.25247, 0.6745098, 1, 0, 1,
-0.8000773, -0.8101767, -4.439917, 0.6666667, 1, 0, 1,
-0.8000267, 0.2985306, -1.050658, 0.6627451, 1, 0, 1,
-0.7994582, 0.4461306, -0.531803, 0.654902, 1, 0, 1,
-0.789739, -0.2034736, -1.741173, 0.6509804, 1, 0, 1,
-0.7883397, 0.06344538, -2.555388, 0.6431373, 1, 0, 1,
-0.7878506, 2.600387, 0.1699677, 0.6392157, 1, 0, 1,
-0.7842624, 1.287142, 1.017434, 0.6313726, 1, 0, 1,
-0.7827877, -0.9430493, -3.039721, 0.627451, 1, 0, 1,
-0.7822698, -0.204392, -1.854098, 0.6196079, 1, 0, 1,
-0.7817986, -0.1892043, -2.782554, 0.6156863, 1, 0, 1,
-0.7792855, 2.049221, -1.12244, 0.6078432, 1, 0, 1,
-0.7772381, 0.3394661, -0.7881269, 0.6039216, 1, 0, 1,
-0.7728255, 0.5749272, -0.940402, 0.5960785, 1, 0, 1,
-0.7648886, 0.6880299, -0.369861, 0.5882353, 1, 0, 1,
-0.7612479, -0.2577951, -0.8341842, 0.5843138, 1, 0, 1,
-0.760691, 0.7301682, -1.053337, 0.5764706, 1, 0, 1,
-0.7606868, 0.007749355, -1.591055, 0.572549, 1, 0, 1,
-0.7562287, -0.05050991, -3.136361, 0.5647059, 1, 0, 1,
-0.7533168, -0.6285766, -2.590747, 0.5607843, 1, 0, 1,
-0.7511669, 0.2946205, -2.05707, 0.5529412, 1, 0, 1,
-0.7495003, -0.03220414, -1.240837, 0.5490196, 1, 0, 1,
-0.7475404, -0.09378766, -1.672215, 0.5411765, 1, 0, 1,
-0.7451298, 1.055284, -0.5718833, 0.5372549, 1, 0, 1,
-0.7403759, -1.481608, -4.389932, 0.5294118, 1, 0, 1,
-0.7328882, -1.435317, -0.8978474, 0.5254902, 1, 0, 1,
-0.7316996, 0.4439917, -1.571202, 0.5176471, 1, 0, 1,
-0.724728, 0.06260975, -1.11751, 0.5137255, 1, 0, 1,
-0.7243896, -1.333876, -0.5850959, 0.5058824, 1, 0, 1,
-0.7219333, 0.8608062, -0.3729235, 0.5019608, 1, 0, 1,
-0.7215546, 1.638676, 0.3947455, 0.4941176, 1, 0, 1,
-0.7211527, -1.206603, -2.059173, 0.4862745, 1, 0, 1,
-0.7135616, 1.147734, 1.279411, 0.4823529, 1, 0, 1,
-0.7115897, 0.5374602, -0.8135296, 0.4745098, 1, 0, 1,
-0.708314, 1.209783, 1.241292, 0.4705882, 1, 0, 1,
-0.7031191, -0.7683185, -2.426596, 0.4627451, 1, 0, 1,
-0.7008866, -0.6108842, -1.253604, 0.4588235, 1, 0, 1,
-0.7002773, -0.7857588, -4.644531, 0.4509804, 1, 0, 1,
-0.6990344, 0.4289003, -0.5727057, 0.4470588, 1, 0, 1,
-0.6956382, -1.31749, -2.591049, 0.4392157, 1, 0, 1,
-0.6909735, 0.2352737, -2.697087, 0.4352941, 1, 0, 1,
-0.6907402, -0.773016, -1.67284, 0.427451, 1, 0, 1,
-0.6906948, -0.1727975, -3.42189, 0.4235294, 1, 0, 1,
-0.6897935, -0.4747703, -3.248542, 0.4156863, 1, 0, 1,
-0.6878286, 1.55651, -0.9443073, 0.4117647, 1, 0, 1,
-0.6867202, -0.1596053, -2.394497, 0.4039216, 1, 0, 1,
-0.685652, 2.223699, 0.795063, 0.3960784, 1, 0, 1,
-0.6852242, -1.694718, -2.734939, 0.3921569, 1, 0, 1,
-0.6845569, -1.075685, -2.431624, 0.3843137, 1, 0, 1,
-0.6838518, -1.293709, -3.08627, 0.3803922, 1, 0, 1,
-0.6817113, 0.1249991, -1.169803, 0.372549, 1, 0, 1,
-0.6791977, -1.539582, -2.909682, 0.3686275, 1, 0, 1,
-0.6770596, -1.091966, -2.609614, 0.3607843, 1, 0, 1,
-0.6734918, -1.018233, -2.150772, 0.3568628, 1, 0, 1,
-0.6724834, 1.141816, -0.5700031, 0.3490196, 1, 0, 1,
-0.6718325, 0.09663042, -0.6159955, 0.345098, 1, 0, 1,
-0.6582136, 1.653368, -1.276283, 0.3372549, 1, 0, 1,
-0.6547018, -0.4347879, -2.587914, 0.3333333, 1, 0, 1,
-0.6517583, -0.5778771, -1.288407, 0.3254902, 1, 0, 1,
-0.6506976, -0.2234638, -1.58577, 0.3215686, 1, 0, 1,
-0.6497049, 0.5132654, -0.7544269, 0.3137255, 1, 0, 1,
-0.6383719, -1.601498, -1.889943, 0.3098039, 1, 0, 1,
-0.635978, 0.09098801, -1.398397, 0.3019608, 1, 0, 1,
-0.6314629, -0.580312, -3.547944, 0.2941177, 1, 0, 1,
-0.6287374, 2.021772, -1.106961, 0.2901961, 1, 0, 1,
-0.6231555, 0.1170165, -2.658729, 0.282353, 1, 0, 1,
-0.6207302, 0.6270841, -1.975597, 0.2784314, 1, 0, 1,
-0.6203774, 0.2526785, -0.9410121, 0.2705882, 1, 0, 1,
-0.6199616, 1.056193, -0.7428921, 0.2666667, 1, 0, 1,
-0.6175464, -0.5021163, -2.40669, 0.2588235, 1, 0, 1,
-0.614702, -0.253269, -0.8344545, 0.254902, 1, 0, 1,
-0.6141281, -0.1978128, -1.571188, 0.2470588, 1, 0, 1,
-0.6127021, 1.002455, -2.567967, 0.2431373, 1, 0, 1,
-0.6064688, 0.009426767, -0.5730805, 0.2352941, 1, 0, 1,
-0.606274, -0.660004, -4.200615, 0.2313726, 1, 0, 1,
-0.6057194, -1.136368, -3.879866, 0.2235294, 1, 0, 1,
-0.5939773, 0.4301123, -1.448258, 0.2196078, 1, 0, 1,
-0.5938966, 0.228712, -2.198033, 0.2117647, 1, 0, 1,
-0.5908073, 0.1301399, -1.164178, 0.2078431, 1, 0, 1,
-0.5869833, 0.825305, -1.116437, 0.2, 1, 0, 1,
-0.5850279, 0.6933775, -1.274994, 0.1921569, 1, 0, 1,
-0.580152, -1.409745, -3.852665, 0.1882353, 1, 0, 1,
-0.5798898, 0.405194, -1.157206, 0.1803922, 1, 0, 1,
-0.5774889, -0.3696733, -2.250555, 0.1764706, 1, 0, 1,
-0.5757073, -0.8366755, -2.16018, 0.1686275, 1, 0, 1,
-0.5723201, 0.1519401, -2.098759, 0.1647059, 1, 0, 1,
-0.5702981, -0.4702003, -3.651178, 0.1568628, 1, 0, 1,
-0.5687789, -1.9558, -2.809547, 0.1529412, 1, 0, 1,
-0.5648689, 1.008697, -0.6924028, 0.145098, 1, 0, 1,
-0.5645188, -0.2622608, -1.229976, 0.1411765, 1, 0, 1,
-0.5630328, -0.8619077, -4.039189, 0.1333333, 1, 0, 1,
-0.5623712, -0.8115635, -2.83106, 0.1294118, 1, 0, 1,
-0.5617527, 0.1026835, -0.8788451, 0.1215686, 1, 0, 1,
-0.5609069, 0.09157041, -0.7972886, 0.1176471, 1, 0, 1,
-0.559839, -0.9238269, -2.888615, 0.1098039, 1, 0, 1,
-0.5580285, 0.4910353, -1.390577, 0.1058824, 1, 0, 1,
-0.5555065, -1.1705, -1.714379, 0.09803922, 1, 0, 1,
-0.5519785, -0.4056394, -2.754949, 0.09019608, 1, 0, 1,
-0.5515989, -0.3797649, -2.738281, 0.08627451, 1, 0, 1,
-0.547616, -0.002115923, -1.976706, 0.07843138, 1, 0, 1,
-0.5442539, -0.6475641, -2.011867, 0.07450981, 1, 0, 1,
-0.539262, 0.7291039, 0.3934922, 0.06666667, 1, 0, 1,
-0.5389814, -1.851234, -2.936368, 0.0627451, 1, 0, 1,
-0.5387502, 0.5216359, -0.1718893, 0.05490196, 1, 0, 1,
-0.5379597, 1.347105, -0.06314368, 0.05098039, 1, 0, 1,
-0.5362889, 0.6537331, -3.588327, 0.04313726, 1, 0, 1,
-0.53622, -1.012298, -2.083501, 0.03921569, 1, 0, 1,
-0.5337255, 0.1123198, -1.997535, 0.03137255, 1, 0, 1,
-0.5324661, -0.469364, -3.122297, 0.02745098, 1, 0, 1,
-0.5317796, 1.625421, -0.5308703, 0.01960784, 1, 0, 1,
-0.5315613, -0.09847594, -0.5155323, 0.01568628, 1, 0, 1,
-0.5305184, 0.05644305, -1.664352, 0.007843138, 1, 0, 1,
-0.5298645, -0.01770439, -0.1375513, 0.003921569, 1, 0, 1,
-0.5280603, -0.9496797, -1.838162, 0, 1, 0.003921569, 1,
-0.5229695, 1.807327, -0.1217683, 0, 1, 0.01176471, 1,
-0.5175698, -0.2074853, -2.688349, 0, 1, 0.01568628, 1,
-0.513953, 0.3319491, -1.079358, 0, 1, 0.02352941, 1,
-0.5106056, -0.7729122, -0.9611279, 0, 1, 0.02745098, 1,
-0.5074447, -0.4301685, -1.548949, 0, 1, 0.03529412, 1,
-0.5073232, 0.8079975, -1.128426, 0, 1, 0.03921569, 1,
-0.4964381, 0.4493198, -0.4191606, 0, 1, 0.04705882, 1,
-0.4925102, -0.6824914, -2.645739, 0, 1, 0.05098039, 1,
-0.4907173, 1.157784, -0.9066503, 0, 1, 0.05882353, 1,
-0.4863732, -1.726027, -1.659335, 0, 1, 0.0627451, 1,
-0.4835108, 0.8434111, -1.792055, 0, 1, 0.07058824, 1,
-0.4822797, 0.3927824, -0.5320743, 0, 1, 0.07450981, 1,
-0.4811322, 0.006193568, -1.371787, 0, 1, 0.08235294, 1,
-0.4794656, -1.572367, -2.926695, 0, 1, 0.08627451, 1,
-0.4754454, -1.635226, -2.870712, 0, 1, 0.09411765, 1,
-0.4720154, 0.7376786, -0.9416202, 0, 1, 0.1019608, 1,
-0.46656, -0.837739, -3.53692, 0, 1, 0.1058824, 1,
-0.4628443, 0.03301188, -2.428917, 0, 1, 0.1137255, 1,
-0.4602392, -0.2094179, -1.53395, 0, 1, 0.1176471, 1,
-0.4600569, 0.0244797, -0.4141685, 0, 1, 0.1254902, 1,
-0.4552312, -0.6567575, -2.724341, 0, 1, 0.1294118, 1,
-0.4550434, 0.6094043, -1.960235, 0, 1, 0.1372549, 1,
-0.4548796, -0.8257943, -2.042262, 0, 1, 0.1411765, 1,
-0.4548634, 1.197912, 0.02831248, 0, 1, 0.1490196, 1,
-0.4543678, -0.005585215, -3.807593, 0, 1, 0.1529412, 1,
-0.4542424, -0.009302994, -2.478587, 0, 1, 0.1607843, 1,
-0.4526484, -0.206832, -2.649002, 0, 1, 0.1647059, 1,
-0.4495049, -0.03846227, -2.83235, 0, 1, 0.172549, 1,
-0.4483245, -1.196541, -4.105204, 0, 1, 0.1764706, 1,
-0.441687, 0.05490482, -0.717497, 0, 1, 0.1843137, 1,
-0.4409888, 0.6342806, 2.691473, 0, 1, 0.1882353, 1,
-0.4398666, -0.7294713, -2.477461, 0, 1, 0.1960784, 1,
-0.4349414, 0.8706686, 0.2339159, 0, 1, 0.2039216, 1,
-0.432648, -1.423261, -2.558521, 0, 1, 0.2078431, 1,
-0.4320572, -0.9305228, -2.734486, 0, 1, 0.2156863, 1,
-0.4294637, -0.7024285, -2.443597, 0, 1, 0.2196078, 1,
-0.4279533, -0.5362963, -2.134662, 0, 1, 0.227451, 1,
-0.4240108, -0.1152827, -0.9276509, 0, 1, 0.2313726, 1,
-0.4206989, -0.9534587, -3.574415, 0, 1, 0.2392157, 1,
-0.4198865, 1.426801, 1.863212, 0, 1, 0.2431373, 1,
-0.4162665, -0.7871067, -4.398288, 0, 1, 0.2509804, 1,
-0.415511, -0.1003255, -2.963279, 0, 1, 0.254902, 1,
-0.4090053, 0.3785489, -1.935578, 0, 1, 0.2627451, 1,
-0.4086961, 1.639865, 0.8409813, 0, 1, 0.2666667, 1,
-0.4076636, -0.4091323, -1.690461, 0, 1, 0.2745098, 1,
-0.4062676, 0.2164939, -1.076277, 0, 1, 0.2784314, 1,
-0.404374, 1.368628, -1.414045, 0, 1, 0.2862745, 1,
-0.4016067, 0.2945622, 0.1747994, 0, 1, 0.2901961, 1,
-0.4005982, -0.8062278, -2.774953, 0, 1, 0.2980392, 1,
-0.3920835, -0.8052058, -1.94519, 0, 1, 0.3058824, 1,
-0.3889485, 2.616621, 0.4060506, 0, 1, 0.3098039, 1,
-0.3860513, -0.04140694, 0.5343643, 0, 1, 0.3176471, 1,
-0.3806331, -1.385081, -1.315087, 0, 1, 0.3215686, 1,
-0.3755392, 0.3851181, -0.4315198, 0, 1, 0.3294118, 1,
-0.375404, -0.4666107, -3.243795, 0, 1, 0.3333333, 1,
-0.3718558, 1.546907, -0.122927, 0, 1, 0.3411765, 1,
-0.3714966, 0.0006031041, -1.393426, 0, 1, 0.345098, 1,
-0.3692181, 1.190314, 0.4569919, 0, 1, 0.3529412, 1,
-0.3619459, 0.9643164, -0.4070742, 0, 1, 0.3568628, 1,
-0.3618836, 0.06555038, -0.4885519, 0, 1, 0.3647059, 1,
-0.3583886, -0.02242232, -2.473223, 0, 1, 0.3686275, 1,
-0.3552616, 0.1757157, -2.55693, 0, 1, 0.3764706, 1,
-0.3549552, -0.6763875, -2.977961, 0, 1, 0.3803922, 1,
-0.3467948, 0.6103736, -1.03302, 0, 1, 0.3882353, 1,
-0.3442122, 0.1479577, -0.2081362, 0, 1, 0.3921569, 1,
-0.3377447, -1.165785, -4.264235, 0, 1, 0.4, 1,
-0.3343647, -0.02589108, -1.725623, 0, 1, 0.4078431, 1,
-0.3326458, 0.03358363, -2.553323, 0, 1, 0.4117647, 1,
-0.3292796, 0.3795077, -0.1039213, 0, 1, 0.4196078, 1,
-0.3292038, -0.7108678, -1.018892, 0, 1, 0.4235294, 1,
-0.328211, 1.639948, -0.6776148, 0, 1, 0.4313726, 1,
-0.3280076, 0.4020971, 1.688142, 0, 1, 0.4352941, 1,
-0.321433, 1.066428, -1.478024, 0, 1, 0.4431373, 1,
-0.3197024, 0.01748597, -0.658892, 0, 1, 0.4470588, 1,
-0.3174795, 0.3372559, 0.2802831, 0, 1, 0.454902, 1,
-0.3153449, -0.784959, -2.787228, 0, 1, 0.4588235, 1,
-0.3113572, -2.256407, -3.707445, 0, 1, 0.4666667, 1,
-0.3105399, -0.1749758, -2.430363, 0, 1, 0.4705882, 1,
-0.3081903, 1.022016, -1.91028, 0, 1, 0.4784314, 1,
-0.3049335, -0.8500507, -3.449219, 0, 1, 0.4823529, 1,
-0.3013127, 0.2135519, -3.345304, 0, 1, 0.4901961, 1,
-0.2983842, -0.7332656, -2.797774, 0, 1, 0.4941176, 1,
-0.2961836, 1.62546, 0.092094, 0, 1, 0.5019608, 1,
-0.2957534, 0.01840418, -1.240872, 0, 1, 0.509804, 1,
-0.2929151, -0.3628821, -2.646635, 0, 1, 0.5137255, 1,
-0.2922314, -1.671336, -3.543196, 0, 1, 0.5215687, 1,
-0.2906305, -0.6014643, -2.810091, 0, 1, 0.5254902, 1,
-0.2890252, 0.8575645, -0.6264275, 0, 1, 0.5333334, 1,
-0.2813027, 1.016943, -1.578675, 0, 1, 0.5372549, 1,
-0.2809376, 0.4936042, -0.1734715, 0, 1, 0.5450981, 1,
-0.2809084, -0.04192105, -1.95817, 0, 1, 0.5490196, 1,
-0.2801515, -0.7380531, -3.523866, 0, 1, 0.5568628, 1,
-0.2799557, 1.725186, 0.1771338, 0, 1, 0.5607843, 1,
-0.2780532, 0.8213218, -0.2875634, 0, 1, 0.5686275, 1,
-0.2711408, 0.3329978, 0.3527343, 0, 1, 0.572549, 1,
-0.2695618, 0.05073598, -2.737336, 0, 1, 0.5803922, 1,
-0.2668245, -0.522607, -0.288883, 0, 1, 0.5843138, 1,
-0.263791, 0.9989722, -0.7737198, 0, 1, 0.5921569, 1,
-0.2578501, -1.540126, -2.237111, 0, 1, 0.5960785, 1,
-0.2562478, 0.7359523, -0.03998017, 0, 1, 0.6039216, 1,
-0.2554848, 0.8467776, -0.03326231, 0, 1, 0.6117647, 1,
-0.2519138, 0.5599447, -0.8589145, 0, 1, 0.6156863, 1,
-0.2516986, -0.8172752, -4.476528, 0, 1, 0.6235294, 1,
-0.2497125, 0.5301844, -0.9420141, 0, 1, 0.627451, 1,
-0.2473364, 0.04948283, -1.156931, 0, 1, 0.6352941, 1,
-0.2473247, -0.7089411, -0.6937935, 0, 1, 0.6392157, 1,
-0.2448821, 0.1045858, -1.221118, 0, 1, 0.6470588, 1,
-0.2393773, -0.5200362, -2.686964, 0, 1, 0.6509804, 1,
-0.2307786, 0.6983633, -1.666073, 0, 1, 0.6588235, 1,
-0.2274297, -0.08201153, -1.810511, 0, 1, 0.6627451, 1,
-0.2253142, 0.4400482, 0.02055224, 0, 1, 0.6705883, 1,
-0.2250213, -1.653553, -2.09635, 0, 1, 0.6745098, 1,
-0.2234406, 1.232599, -1.337766, 0, 1, 0.682353, 1,
-0.2228733, 0.1920029, -1.286746, 0, 1, 0.6862745, 1,
-0.2176726, -0.7874677, -3.034847, 0, 1, 0.6941177, 1,
-0.2169976, -1.177056, -4.76821, 0, 1, 0.7019608, 1,
-0.2163669, 0.4652694, -1.353221, 0, 1, 0.7058824, 1,
-0.215106, 0.884488, 0.3579517, 0, 1, 0.7137255, 1,
-0.2121993, -0.505612, -2.73519, 0, 1, 0.7176471, 1,
-0.210748, -0.3905801, -3.668092, 0, 1, 0.7254902, 1,
-0.2098039, 0.2950036, -2.055417, 0, 1, 0.7294118, 1,
-0.2086683, -0.1942961, -2.460623, 0, 1, 0.7372549, 1,
-0.2081997, -0.6254816, -1.552309, 0, 1, 0.7411765, 1,
-0.204115, -0.4415534, -4.079577, 0, 1, 0.7490196, 1,
-0.20298, -1.317716, -3.937998, 0, 1, 0.7529412, 1,
-0.2000811, -0.1713464, -3.038843, 0, 1, 0.7607843, 1,
-0.1987483, 0.4404083, -0.6492187, 0, 1, 0.7647059, 1,
-0.1945635, 1.126941, -1.210831, 0, 1, 0.772549, 1,
-0.1938109, -0.5740184, -3.346039, 0, 1, 0.7764706, 1,
-0.1918996, 0.7751234, 0.08344613, 0, 1, 0.7843137, 1,
-0.1911608, -0.1356511, -2.700197, 0, 1, 0.7882353, 1,
-0.1896382, 0.08590227, -0.4679477, 0, 1, 0.7960784, 1,
-0.1840782, -0.4869945, -2.372945, 0, 1, 0.8039216, 1,
-0.1824024, -1.571322, -3.743029, 0, 1, 0.8078431, 1,
-0.1811505, 0.06309348, -1.544311, 0, 1, 0.8156863, 1,
-0.1789425, -0.3614396, -1.92886, 0, 1, 0.8196079, 1,
-0.1774991, 0.3265647, 1.183979, 0, 1, 0.827451, 1,
-0.1750514, -0.2589376, -3.034665, 0, 1, 0.8313726, 1,
-0.1667017, 0.8744148, 0.5149282, 0, 1, 0.8392157, 1,
-0.1664765, 0.05563697, -1.31607, 0, 1, 0.8431373, 1,
-0.1649285, -2.040889, -4.471735, 0, 1, 0.8509804, 1,
-0.1603589, -0.8265677, -2.712476, 0, 1, 0.854902, 1,
-0.1579539, -0.09992979, -0.2164653, 0, 1, 0.8627451, 1,
-0.1560113, -0.5007595, -2.644896, 0, 1, 0.8666667, 1,
-0.1560024, -0.6325332, -1.248097, 0, 1, 0.8745098, 1,
-0.154223, -0.1068454, -1.942961, 0, 1, 0.8784314, 1,
-0.1483849, 0.8893285, -1.788357, 0, 1, 0.8862745, 1,
-0.1430418, 0.4258305, 0.9421595, 0, 1, 0.8901961, 1,
-0.142104, 0.8272817, -1.100174, 0, 1, 0.8980392, 1,
-0.1398169, 0.5345971, 0.1408274, 0, 1, 0.9058824, 1,
-0.1385262, 0.5046494, -0.5522627, 0, 1, 0.9098039, 1,
-0.1363313, 0.6987476, -1.014388, 0, 1, 0.9176471, 1,
-0.1343462, -0.8666093, -2.979939, 0, 1, 0.9215686, 1,
-0.1206163, -0.9824727, -3.015344, 0, 1, 0.9294118, 1,
-0.1181043, -0.1862909, -2.88882, 0, 1, 0.9333333, 1,
-0.1104422, 0.4460928, 2.141538, 0, 1, 0.9411765, 1,
-0.1096927, -1.251631, -3.738307, 0, 1, 0.945098, 1,
-0.108268, -1.013512, -1.877477, 0, 1, 0.9529412, 1,
-0.1025465, -0.3551675, -1.018443, 0, 1, 0.9568627, 1,
-0.1017856, -1.436549, -3.09043, 0, 1, 0.9647059, 1,
-0.09709212, -0.2519401, -2.466091, 0, 1, 0.9686275, 1,
-0.0945809, 1.256099, 0.5080669, 0, 1, 0.9764706, 1,
-0.09223046, -0.632655, -2.878299, 0, 1, 0.9803922, 1,
-0.09033182, 1.525728, -0.269507, 0, 1, 0.9882353, 1,
-0.08985228, -0.8962312, -1.869678, 0, 1, 0.9921569, 1,
-0.0877546, 2.12376, -0.9835122, 0, 1, 1, 1,
-0.08155683, -0.8191674, -2.918946, 0, 0.9921569, 1, 1,
-0.08043768, -1.323723, -2.643182, 0, 0.9882353, 1, 1,
-0.07805027, -1.496682, -2.877322, 0, 0.9803922, 1, 1,
-0.07730925, 1.384805, -0.4120685, 0, 0.9764706, 1, 1,
-0.07335727, -1.009491, -2.554439, 0, 0.9686275, 1, 1,
-0.07278701, -0.02222225, -2.232193, 0, 0.9647059, 1, 1,
-0.0623027, 1.148901, -1.381265, 0, 0.9568627, 1, 1,
-0.06172951, -0.2799074, -2.420936, 0, 0.9529412, 1, 1,
-0.06156654, -1.276942, -3.249762, 0, 0.945098, 1, 1,
-0.06056626, -0.1886587, -2.659331, 0, 0.9411765, 1, 1,
-0.05987287, 0.8484979, -1.266348, 0, 0.9333333, 1, 1,
-0.05908661, 1.848694, -1.780213, 0, 0.9294118, 1, 1,
-0.05683209, 1.029255, 2.254502, 0, 0.9215686, 1, 1,
-0.05439674, 1.419291, -1.260377, 0, 0.9176471, 1, 1,
-0.05141627, -0.723994, -4.070407, 0, 0.9098039, 1, 1,
-0.04438505, -1.204492, -2.827718, 0, 0.9058824, 1, 1,
-0.03543149, 0.5546922, -1.485163, 0, 0.8980392, 1, 1,
-0.03441109, -0.8145235, -3.274143, 0, 0.8901961, 1, 1,
-0.0299261, 0.2576184, -0.7068433, 0, 0.8862745, 1, 1,
-0.02893302, -0.2789803, -3.917965, 0, 0.8784314, 1, 1,
-0.02365252, -0.2194245, -1.233688, 0, 0.8745098, 1, 1,
-0.02119376, 1.660069, 1.667634, 0, 0.8666667, 1, 1,
-0.01953705, 0.1773583, -0.8017267, 0, 0.8627451, 1, 1,
-0.01327301, 1.356817, 1.592688, 0, 0.854902, 1, 1,
-0.007994102, -0.3220137, -3.666427, 0, 0.8509804, 1, 1,
-0.006007609, 0.9137108, 3.012078, 0, 0.8431373, 1, 1,
-0.004758966, -1.40231, -4.130951, 0, 0.8392157, 1, 1,
-0.002352438, 0.2162881, 1.779327, 0, 0.8313726, 1, 1,
0.0007497079, -0.530548, 1.102966, 0, 0.827451, 1, 1,
0.001253842, 0.4663919, 1.575655, 0, 0.8196079, 1, 1,
0.0023115, -0.1015241, 2.007466, 0, 0.8156863, 1, 1,
0.002476702, -0.07151034, 3.836685, 0, 0.8078431, 1, 1,
0.003946663, -0.2597771, 4.451088, 0, 0.8039216, 1, 1,
0.005937915, -0.4007742, 3.30301, 0, 0.7960784, 1, 1,
0.006637442, -2.733222, 4.825469, 0, 0.7882353, 1, 1,
0.01574909, -0.125836, 3.629702, 0, 0.7843137, 1, 1,
0.02054687, 1.838979, -1.219462, 0, 0.7764706, 1, 1,
0.02229244, 0.2514031, 1.142722, 0, 0.772549, 1, 1,
0.02675496, 0.5852829, 0.178728, 0, 0.7647059, 1, 1,
0.03161991, -0.8831432, 2.820666, 0, 0.7607843, 1, 1,
0.0326068, 0.7859456, -0.7606804, 0, 0.7529412, 1, 1,
0.03584841, 0.4828499, 0.01715931, 0, 0.7490196, 1, 1,
0.04572276, 0.315294, -2.2911, 0, 0.7411765, 1, 1,
0.04675753, -0.1431167, 2.446784, 0, 0.7372549, 1, 1,
0.04823256, 0.5195853, 0.3550728, 0, 0.7294118, 1, 1,
0.05174656, 1.186506, -0.3050214, 0, 0.7254902, 1, 1,
0.05826411, -1.244781, 3.844671, 0, 0.7176471, 1, 1,
0.06548601, 0.2288222, 1.923154, 0, 0.7137255, 1, 1,
0.0689201, -0.01358916, 2.975962, 0, 0.7058824, 1, 1,
0.07062934, -0.5386239, 2.346683, 0, 0.6980392, 1, 1,
0.07255091, 1.244432, 1.467643, 0, 0.6941177, 1, 1,
0.07624831, -1.044052, 1.816872, 0, 0.6862745, 1, 1,
0.08295424, -0.5660433, 2.152847, 0, 0.682353, 1, 1,
0.08596625, -0.7373714, 3.390801, 0, 0.6745098, 1, 1,
0.08673708, -1.272924, -0.0580442, 0, 0.6705883, 1, 1,
0.0899849, 1.124637, -0.5714866, 0, 0.6627451, 1, 1,
0.09056397, -0.6065701, 3.620813, 0, 0.6588235, 1, 1,
0.09785049, 0.3650656, 0.206532, 0, 0.6509804, 1, 1,
0.1044914, -0.3647126, 2.90014, 0, 0.6470588, 1, 1,
0.1054808, -0.7398751, 2.762358, 0, 0.6392157, 1, 1,
0.1076436, 1.269065, -1.442802, 0, 0.6352941, 1, 1,
0.1079616, 0.2671888, 0.8404223, 0, 0.627451, 1, 1,
0.1082113, 0.133511, 0.6444302, 0, 0.6235294, 1, 1,
0.1088719, -0.05743824, 3.645433, 0, 0.6156863, 1, 1,
0.1102893, -1.411121, 2.207337, 0, 0.6117647, 1, 1,
0.127796, 1.375589, 0.6945945, 0, 0.6039216, 1, 1,
0.133817, 0.750091, 1.178302, 0, 0.5960785, 1, 1,
0.135443, 0.9298421, -0.3775431, 0, 0.5921569, 1, 1,
0.1373021, 1.070751, -0.5137121, 0, 0.5843138, 1, 1,
0.1381166, -1.504201, 2.738706, 0, 0.5803922, 1, 1,
0.1387056, -1.032593, 2.801748, 0, 0.572549, 1, 1,
0.1392685, 0.5301223, 3.109191, 0, 0.5686275, 1, 1,
0.1401248, 0.3382924, 0.1650511, 0, 0.5607843, 1, 1,
0.1416242, -0.7882352, 2.68673, 0, 0.5568628, 1, 1,
0.1494519, 0.618432, 0.2150524, 0, 0.5490196, 1, 1,
0.1509626, 0.5109023, -0.6669965, 0, 0.5450981, 1, 1,
0.1570526, -0.7252188, 2.270621, 0, 0.5372549, 1, 1,
0.1575119, -0.774496, 1.353949, 0, 0.5333334, 1, 1,
0.1577722, 0.5258058, -1.453573, 0, 0.5254902, 1, 1,
0.1629674, 0.6551669, 0.2419202, 0, 0.5215687, 1, 1,
0.1663774, 1.411403, -0.504077, 0, 0.5137255, 1, 1,
0.1701858, -0.8478996, 4.577569, 0, 0.509804, 1, 1,
0.1763175, -0.5288965, 2.886845, 0, 0.5019608, 1, 1,
0.1790104, 0.5873752, 1.001257, 0, 0.4941176, 1, 1,
0.1791689, 0.5677211, -0.1278795, 0, 0.4901961, 1, 1,
0.1793044, -2.210503, 4.080095, 0, 0.4823529, 1, 1,
0.1805924, 0.4081001, 0.4522078, 0, 0.4784314, 1, 1,
0.1808887, 0.6524909, 0.2323025, 0, 0.4705882, 1, 1,
0.1810842, 0.03511708, -0.8582447, 0, 0.4666667, 1, 1,
0.1865827, 1.598644, -0.9311787, 0, 0.4588235, 1, 1,
0.1949444, -0.4452026, 1.289021, 0, 0.454902, 1, 1,
0.1980293, -0.7173766, 3.600988, 0, 0.4470588, 1, 1,
0.1996656, 0.5780222, -0.04241126, 0, 0.4431373, 1, 1,
0.2012088, 1.837083, 0.7547913, 0, 0.4352941, 1, 1,
0.2026342, -1.102545, 1.401994, 0, 0.4313726, 1, 1,
0.2043525, -1.543594, 3.405325, 0, 0.4235294, 1, 1,
0.2164344, 0.07929978, 1.343105, 0, 0.4196078, 1, 1,
0.218213, 1.599979, 0.246591, 0, 0.4117647, 1, 1,
0.2212078, -1.609096, 3.725861, 0, 0.4078431, 1, 1,
0.2256998, -0.6893062, 1.690281, 0, 0.4, 1, 1,
0.2260129, -0.3270042, 2.094752, 0, 0.3921569, 1, 1,
0.226723, 0.3588134, 1.411185, 0, 0.3882353, 1, 1,
0.2332704, 0.9695253, 1.397061, 0, 0.3803922, 1, 1,
0.2349182, 1.574054, 1.399949, 0, 0.3764706, 1, 1,
0.2399483, -1.721599, 2.188747, 0, 0.3686275, 1, 1,
0.2412583, 0.06507853, 0.3662902, 0, 0.3647059, 1, 1,
0.2417296, -0.7074558, 3.541261, 0, 0.3568628, 1, 1,
0.244338, 0.6921861, 1.732517, 0, 0.3529412, 1, 1,
0.2479043, -0.4005827, 3.464559, 0, 0.345098, 1, 1,
0.2509672, -0.9821162, 1.707194, 0, 0.3411765, 1, 1,
0.2519614, 0.9238334, 0.3822182, 0, 0.3333333, 1, 1,
0.2534982, -1.409943, 2.122884, 0, 0.3294118, 1, 1,
0.2564878, 1.283973, -0.3720335, 0, 0.3215686, 1, 1,
0.2577696, 0.0776581, 1.679298, 0, 0.3176471, 1, 1,
0.2584921, -1.19427, 3.754702, 0, 0.3098039, 1, 1,
0.2596102, 0.5891174, 0.09069697, 0, 0.3058824, 1, 1,
0.2625678, -1.19955, 2.644212, 0, 0.2980392, 1, 1,
0.2626919, 0.519811, 0.9075011, 0, 0.2901961, 1, 1,
0.2638089, 1.124371, 0.8414599, 0, 0.2862745, 1, 1,
0.2642215, -1.357419, 2.479121, 0, 0.2784314, 1, 1,
0.2666179, -0.7265213, 2.030819, 0, 0.2745098, 1, 1,
0.2675158, -1.515742, 3.470215, 0, 0.2666667, 1, 1,
0.2681942, 0.4624264, 1.134509, 0, 0.2627451, 1, 1,
0.2697153, 0.5979615, 0.9868902, 0, 0.254902, 1, 1,
0.2753382, 0.4503388, 0.8660872, 0, 0.2509804, 1, 1,
0.2756262, -0.7784808, 2.090748, 0, 0.2431373, 1, 1,
0.2863774, 2.086319, -0.6169232, 0, 0.2392157, 1, 1,
0.2864735, 0.8356335, 0.2661223, 0, 0.2313726, 1, 1,
0.287334, -0.5397089, 2.564094, 0, 0.227451, 1, 1,
0.2904839, -0.5192732, 3.259453, 0, 0.2196078, 1, 1,
0.2925767, -0.4888059, 4.511863, 0, 0.2156863, 1, 1,
0.2949256, -0.7773322, 1.899743, 0, 0.2078431, 1, 1,
0.2979701, 1.050991, 1.10765, 0, 0.2039216, 1, 1,
0.3085727, 1.438788, -0.6776564, 0, 0.1960784, 1, 1,
0.3091544, -0.9976147, 3.813524, 0, 0.1882353, 1, 1,
0.3108043, -1.150436, 2.73041, 0, 0.1843137, 1, 1,
0.3135145, -0.4518767, 1.771072, 0, 0.1764706, 1, 1,
0.314138, 0.9692599, -0.42296, 0, 0.172549, 1, 1,
0.314243, -0.5392603, 1.065762, 0, 0.1647059, 1, 1,
0.3184136, -1.656623, 4.17355, 0, 0.1607843, 1, 1,
0.3191231, -1.102534, 3.176972, 0, 0.1529412, 1, 1,
0.3220429, -1.174495, 2.966784, 0, 0.1490196, 1, 1,
0.3224145, -1.135509, 2.06878, 0, 0.1411765, 1, 1,
0.3233737, -0.9917473, 1.739424, 0, 0.1372549, 1, 1,
0.3237925, 0.6714912, 1.068017, 0, 0.1294118, 1, 1,
0.3245944, -1.284603, 2.409931, 0, 0.1254902, 1, 1,
0.3296291, 0.3246174, -0.5097848, 0, 0.1176471, 1, 1,
0.3319046, 0.2825846, 1.74482, 0, 0.1137255, 1, 1,
0.342057, 0.4067997, 0.7239551, 0, 0.1058824, 1, 1,
0.3430738, -0.7071485, 3.611961, 0, 0.09803922, 1, 1,
0.3588482, -1.169087, 3.67663, 0, 0.09411765, 1, 1,
0.362294, -0.1274775, 1.760467, 0, 0.08627451, 1, 1,
0.3624972, 0.6781255, 2.372663, 0, 0.08235294, 1, 1,
0.3632009, 0.9043012, 0.8969393, 0, 0.07450981, 1, 1,
0.3660919, -0.3084025, -1.335957, 0, 0.07058824, 1, 1,
0.3677101, 0.7326571, 1.185259, 0, 0.0627451, 1, 1,
0.3725578, 0.7521319, -0.09446549, 0, 0.05882353, 1, 1,
0.3730708, 0.1508267, 0.1943293, 0, 0.05098039, 1, 1,
0.3805751, -1.14725, 1.793073, 0, 0.04705882, 1, 1,
0.3875913, -0.2398036, 2.288538, 0, 0.03921569, 1, 1,
0.3951594, 1.064698, -0.721461, 0, 0.03529412, 1, 1,
0.3986063, 1.126634, 1.319873, 0, 0.02745098, 1, 1,
0.3990001, 1.119499, 0.08998171, 0, 0.02352941, 1, 1,
0.4027775, 1.469983, -0.6441153, 0, 0.01568628, 1, 1,
0.402959, -0.01119868, 1.751396, 0, 0.01176471, 1, 1,
0.4045746, 0.3742424, -0.256895, 0, 0.003921569, 1, 1,
0.4048178, 1.179541, 1.851472, 0.003921569, 0, 1, 1,
0.4050854, -1.307892, 4.339308, 0.007843138, 0, 1, 1,
0.407537, 0.356506, 2.23834, 0.01568628, 0, 1, 1,
0.4161523, 1.594397, 0.09372391, 0.01960784, 0, 1, 1,
0.4248153, 0.6700279, 0.9293239, 0.02745098, 0, 1, 1,
0.4265412, -1.161526, 2.572472, 0.03137255, 0, 1, 1,
0.4331555, 1.026954, 0.9180762, 0.03921569, 0, 1, 1,
0.4383517, -1.236054, 3.320598, 0.04313726, 0, 1, 1,
0.4419983, -0.315192, 0.6392466, 0.05098039, 0, 1, 1,
0.4435365, -1.758172, 3.296697, 0.05490196, 0, 1, 1,
0.4442513, -0.219561, 2.359011, 0.0627451, 0, 1, 1,
0.4445761, -0.450146, 2.188142, 0.06666667, 0, 1, 1,
0.4469862, -1.033342, 4.64781, 0.07450981, 0, 1, 1,
0.4477238, 1.971152, 0.1401944, 0.07843138, 0, 1, 1,
0.4485051, -0.05857442, 1.752706, 0.08627451, 0, 1, 1,
0.4562039, -0.2425486, 1.515944, 0.09019608, 0, 1, 1,
0.4616282, 0.8000735, -0.03998288, 0.09803922, 0, 1, 1,
0.4627903, 0.2342666, 2.790137, 0.1058824, 0, 1, 1,
0.4630322, 0.7768781, 1.543658, 0.1098039, 0, 1, 1,
0.471227, 0.7011954, 0.9507968, 0.1176471, 0, 1, 1,
0.4738998, -0.2226605, 2.613384, 0.1215686, 0, 1, 1,
0.4771747, -0.7651384, 2.279007, 0.1294118, 0, 1, 1,
0.4790953, 0.2836053, -0.6821, 0.1333333, 0, 1, 1,
0.4794959, -0.01063427, 1.057979, 0.1411765, 0, 1, 1,
0.4857695, -0.2987815, 3.484405, 0.145098, 0, 1, 1,
0.4882005, -0.7955371, 2.638205, 0.1529412, 0, 1, 1,
0.489328, 1.465802, 0.6005498, 0.1568628, 0, 1, 1,
0.4908988, -0.5356676, 3.412538, 0.1647059, 0, 1, 1,
0.4925442, -0.4502654, 0.4093563, 0.1686275, 0, 1, 1,
0.4946415, 1.393424, -1.303918, 0.1764706, 0, 1, 1,
0.4964586, -1.293083, 5.017812, 0.1803922, 0, 1, 1,
0.5009017, 0.87187, 1.347632, 0.1882353, 0, 1, 1,
0.5009951, -1.910489, 2.517836, 0.1921569, 0, 1, 1,
0.5016955, -0.9125563, 3.948325, 0.2, 0, 1, 1,
0.5149682, 0.2897149, 0.7200258, 0.2078431, 0, 1, 1,
0.5162687, -0.1731866, 2.253116, 0.2117647, 0, 1, 1,
0.5184662, -0.2898882, 2.602628, 0.2196078, 0, 1, 1,
0.5209866, -1.067637, 3.950895, 0.2235294, 0, 1, 1,
0.5210236, -0.8675399, 2.837098, 0.2313726, 0, 1, 1,
0.5213139, -1.128076, 3.842966, 0.2352941, 0, 1, 1,
0.52473, -1.732451, 4.59147, 0.2431373, 0, 1, 1,
0.5269629, 1.769231, 1.527509, 0.2470588, 0, 1, 1,
0.5299359, 0.1098024, 0.9568885, 0.254902, 0, 1, 1,
0.5302215, 0.1258788, 1.683359, 0.2588235, 0, 1, 1,
0.5303872, 2.137393, -0.2999022, 0.2666667, 0, 1, 1,
0.5314506, 1.124127, 1.671521, 0.2705882, 0, 1, 1,
0.5315925, -0.4915657, 2.002246, 0.2784314, 0, 1, 1,
0.5376067, 0.4808298, 0.6369033, 0.282353, 0, 1, 1,
0.540045, 0.5284141, 0.9450011, 0.2901961, 0, 1, 1,
0.5418881, 0.1787747, 0.8213599, 0.2941177, 0, 1, 1,
0.5451357, 0.2443457, 2.117584, 0.3019608, 0, 1, 1,
0.5469323, -1.152624, 2.805822, 0.3098039, 0, 1, 1,
0.5479754, 0.8682817, 1.394317, 0.3137255, 0, 1, 1,
0.5517987, 0.5479053, -0.02583324, 0.3215686, 0, 1, 1,
0.5529823, -0.1694037, 2.229115, 0.3254902, 0, 1, 1,
0.5543033, -1.141351, 2.02365, 0.3333333, 0, 1, 1,
0.5554503, -2.168149, 3.129002, 0.3372549, 0, 1, 1,
0.556053, -0.05846431, 2.36248, 0.345098, 0, 1, 1,
0.5697949, 0.7182327, 0.185806, 0.3490196, 0, 1, 1,
0.5715977, 1.603911, -0.1022223, 0.3568628, 0, 1, 1,
0.5807617, 0.002623238, 1.883359, 0.3607843, 0, 1, 1,
0.5809357, 1.513677, -1.387988, 0.3686275, 0, 1, 1,
0.585937, 0.04665426, 1.727237, 0.372549, 0, 1, 1,
0.5862116, -0.7019348, 1.049837, 0.3803922, 0, 1, 1,
0.5897116, 1.945953, -0.3550537, 0.3843137, 0, 1, 1,
0.5947901, -0.08709051, 0.2078437, 0.3921569, 0, 1, 1,
0.6039145, 1.69643, 0.740742, 0.3960784, 0, 1, 1,
0.6057264, 0.2346525, 1.411909, 0.4039216, 0, 1, 1,
0.6057975, 0.1505716, 1.358582, 0.4117647, 0, 1, 1,
0.6074153, -0.8490978, 1.497766, 0.4156863, 0, 1, 1,
0.6077384, -1.589812, 3.099624, 0.4235294, 0, 1, 1,
0.6084221, 0.382365, 3.751977, 0.427451, 0, 1, 1,
0.610935, 0.002729264, 1.756972, 0.4352941, 0, 1, 1,
0.6146224, 0.3015822, 1.654719, 0.4392157, 0, 1, 1,
0.6253901, 1.167161, 0.08973976, 0.4470588, 0, 1, 1,
0.6257496, 0.412239, 1.77465, 0.4509804, 0, 1, 1,
0.6267291, 0.7309327, 1.217808, 0.4588235, 0, 1, 1,
0.6286694, -1.391498, 2.707812, 0.4627451, 0, 1, 1,
0.6308704, -0.6904387, 2.170268, 0.4705882, 0, 1, 1,
0.635575, -1.28423, 3.561466, 0.4745098, 0, 1, 1,
0.6363852, 0.6872435, 2.149108, 0.4823529, 0, 1, 1,
0.6376928, -1.43572, 5.563056, 0.4862745, 0, 1, 1,
0.6377668, 0.1337786, -0.168039, 0.4941176, 0, 1, 1,
0.6482027, 2.545684, 0.5964419, 0.5019608, 0, 1, 1,
0.6504179, 0.316622, 0.9916373, 0.5058824, 0, 1, 1,
0.6508814, -2.105117, 2.888639, 0.5137255, 0, 1, 1,
0.6589876, -1.874095, 3.468307, 0.5176471, 0, 1, 1,
0.666516, -1.111888, 2.370444, 0.5254902, 0, 1, 1,
0.6685637, -0.3823696, 1.895764, 0.5294118, 0, 1, 1,
0.6707588, -1.081078, 0.8959566, 0.5372549, 0, 1, 1,
0.6752353, -1.153134, 1.960261, 0.5411765, 0, 1, 1,
0.6772838, -0.4837119, 3.204418, 0.5490196, 0, 1, 1,
0.679627, 0.4132495, 0.2765735, 0.5529412, 0, 1, 1,
0.6800653, 0.4977288, 1.301307, 0.5607843, 0, 1, 1,
0.6826292, -0.1118866, 0.2262965, 0.5647059, 0, 1, 1,
0.6831298, 0.378794, 0.7657025, 0.572549, 0, 1, 1,
0.6939489, -1.145544, 3.838995, 0.5764706, 0, 1, 1,
0.7070042, -0.4255334, -0.1714684, 0.5843138, 0, 1, 1,
0.708453, 0.3216686, 3.200881, 0.5882353, 0, 1, 1,
0.7094235, -1.475701, 1.895432, 0.5960785, 0, 1, 1,
0.7104524, 0.9708099, 0.9798259, 0.6039216, 0, 1, 1,
0.7122552, -0.789567, 3.045283, 0.6078432, 0, 1, 1,
0.7197005, -0.02549572, -1.065738, 0.6156863, 0, 1, 1,
0.7208278, -0.693162, 2.093841, 0.6196079, 0, 1, 1,
0.7238916, 0.2707534, 0.4693155, 0.627451, 0, 1, 1,
0.7250132, -0.2902268, 1.63788, 0.6313726, 0, 1, 1,
0.7274888, -1.448874, 3.715952, 0.6392157, 0, 1, 1,
0.7291459, -1.624471, 2.43731, 0.6431373, 0, 1, 1,
0.7359952, 1.562104, 0.2296752, 0.6509804, 0, 1, 1,
0.7385712, 1.057587, 0.1800507, 0.654902, 0, 1, 1,
0.7407461, 0.5922769, 1.203657, 0.6627451, 0, 1, 1,
0.7410226, 1.019942, 0.08904427, 0.6666667, 0, 1, 1,
0.7416532, 0.6453179, 1.390794, 0.6745098, 0, 1, 1,
0.7471638, 0.09411737, 1.974021, 0.6784314, 0, 1, 1,
0.7482179, 0.09044369, 0.8440259, 0.6862745, 0, 1, 1,
0.755574, 0.5871086, 1.333724, 0.6901961, 0, 1, 1,
0.7604867, 0.7320511, -0.5488763, 0.6980392, 0, 1, 1,
0.7675627, -0.4706116, 2.943445, 0.7058824, 0, 1, 1,
0.7789267, -1.005282, 1.452768, 0.7098039, 0, 1, 1,
0.7813305, 0.4259016, 0.812712, 0.7176471, 0, 1, 1,
0.7827197, -0.7238145, 1.243136, 0.7215686, 0, 1, 1,
0.7833742, -0.9820918, 2.452269, 0.7294118, 0, 1, 1,
0.7835129, 0.8213068, 0.5709465, 0.7333333, 0, 1, 1,
0.7873718, 1.460125, 0.7243304, 0.7411765, 0, 1, 1,
0.792045, -0.8580005, 2.408544, 0.7450981, 0, 1, 1,
0.793658, 0.3105623, 0.7715862, 0.7529412, 0, 1, 1,
0.7936891, -1.398216, 2.364602, 0.7568628, 0, 1, 1,
0.7966686, 0.8027306, 0.8728489, 0.7647059, 0, 1, 1,
0.7970724, 0.2843975, 0.7541483, 0.7686275, 0, 1, 1,
0.7979949, -0.8649014, 1.341605, 0.7764706, 0, 1, 1,
0.7981933, -1.742175, 3.057834, 0.7803922, 0, 1, 1,
0.8022389, -0.7503157, 1.373535, 0.7882353, 0, 1, 1,
0.8032581, 1.487856, 0.8075697, 0.7921569, 0, 1, 1,
0.8132957, -0.7201594, 2.834625, 0.8, 0, 1, 1,
0.8229854, -0.6043524, 2.950298, 0.8078431, 0, 1, 1,
0.8231967, 2.180341, 0.5741456, 0.8117647, 0, 1, 1,
0.8279511, -0.5612653, 2.933453, 0.8196079, 0, 1, 1,
0.8379704, 1.033586, 0.696357, 0.8235294, 0, 1, 1,
0.8382548, 1.35108, -0.1388204, 0.8313726, 0, 1, 1,
0.8443955, 0.1285281, -0.05129613, 0.8352941, 0, 1, 1,
0.8487583, -1.331905, 0.008876801, 0.8431373, 0, 1, 1,
0.8549108, 1.125279, 1.083509, 0.8470588, 0, 1, 1,
0.856204, 0.1446611, -0.008657495, 0.854902, 0, 1, 1,
0.8606113, 0.1012579, 3.325848, 0.8588235, 0, 1, 1,
0.8659249, 0.3119823, 0.219091, 0.8666667, 0, 1, 1,
0.8659962, -0.01551307, 1.658563, 0.8705882, 0, 1, 1,
0.8702927, 0.6036977, 1.575871, 0.8784314, 0, 1, 1,
0.8739079, -0.5699292, 3.153361, 0.8823529, 0, 1, 1,
0.8747606, 0.9980956, -0.06372327, 0.8901961, 0, 1, 1,
0.8754535, 0.1147259, 1.518746, 0.8941177, 0, 1, 1,
0.8819363, -0.009964093, 1.524597, 0.9019608, 0, 1, 1,
0.8835692, -0.3223614, 1.917252, 0.9098039, 0, 1, 1,
0.8991375, 0.6889073, 0.2687746, 0.9137255, 0, 1, 1,
0.9078231, -0.6052909, 1.630468, 0.9215686, 0, 1, 1,
0.9085923, 1.158754, -1.004923, 0.9254902, 0, 1, 1,
0.9150051, -0.008698645, 1.371264, 0.9333333, 0, 1, 1,
0.9245043, -0.849266, 2.82279, 0.9372549, 0, 1, 1,
0.9352432, -0.7298852, 3.007425, 0.945098, 0, 1, 1,
0.9359297, 0.6288388, 1.691969, 0.9490196, 0, 1, 1,
0.9419923, 0.2236889, 1.394802, 0.9568627, 0, 1, 1,
0.9430227, -1.42283, 2.582933, 0.9607843, 0, 1, 1,
0.9437442, 0.9599472, 2.761911, 0.9686275, 0, 1, 1,
0.9440325, -0.3201179, 4.257922, 0.972549, 0, 1, 1,
0.9459584, -0.7349213, 3.50479, 0.9803922, 0, 1, 1,
0.9466243, 0.5812721, -0.02857882, 0.9843137, 0, 1, 1,
0.9574023, -0.9869573, 3.009059, 0.9921569, 0, 1, 1,
0.9621617, -1.440919, 3.395772, 0.9960784, 0, 1, 1,
0.9637742, -1.026268, 1.95683, 1, 0, 0.9960784, 1,
0.9638161, 0.1595686, 0.7745619, 1, 0, 0.9882353, 1,
0.9642128, -1.85203, 3.160953, 1, 0, 0.9843137, 1,
0.9698671, -0.7517441, 2.983029, 1, 0, 0.9764706, 1,
0.970971, 0.001501341, 1.041996, 1, 0, 0.972549, 1,
0.9773459, -0.4806149, 2.179956, 1, 0, 0.9647059, 1,
0.9869717, -0.4920016, 1.866744, 1, 0, 0.9607843, 1,
0.9948862, 0.8894837, 0.4794587, 1, 0, 0.9529412, 1,
0.9950696, -2.54082, 4.340439, 1, 0, 0.9490196, 1,
0.9954395, 1.55825, 0.4683314, 1, 0, 0.9411765, 1,
0.9985971, -0.8594196, 1.831433, 1, 0, 0.9372549, 1,
1.000952, 0.8225991, -0.3798422, 1, 0, 0.9294118, 1,
1.01526, 0.0188913, 0.7853981, 1, 0, 0.9254902, 1,
1.019979, 2.214386, 0.2455378, 1, 0, 0.9176471, 1,
1.026273, -0.6472791, 0.6969348, 1, 0, 0.9137255, 1,
1.026441, 0.2203088, 1.20024, 1, 0, 0.9058824, 1,
1.028981, -0.3845612, 2.25877, 1, 0, 0.9019608, 1,
1.029258, -0.6837311, 1.90002, 1, 0, 0.8941177, 1,
1.032046, 0.1107437, 2.974393, 1, 0, 0.8862745, 1,
1.034089, -1.02177, 3.824104, 1, 0, 0.8823529, 1,
1.034564, 0.3501535, 1.967839, 1, 0, 0.8745098, 1,
1.038001, 0.8435163, 2.023312, 1, 0, 0.8705882, 1,
1.03826, 0.7289803, -0.04955726, 1, 0, 0.8627451, 1,
1.05248, -0.7153947, 1.739473, 1, 0, 0.8588235, 1,
1.05407, 0.8683609, 1.374748, 1, 0, 0.8509804, 1,
1.056227, 0.8032253, -0.0005748789, 1, 0, 0.8470588, 1,
1.057379, 0.1136532, 2.217159, 1, 0, 0.8392157, 1,
1.062261, 0.482207, 0.7540091, 1, 0, 0.8352941, 1,
1.069361, -0.8331357, 3.229439, 1, 0, 0.827451, 1,
1.069915, -0.5606635, 1.92224, 1, 0, 0.8235294, 1,
1.070998, -0.2278363, 0.909143, 1, 0, 0.8156863, 1,
1.071193, 0.09773366, 0.19458, 1, 0, 0.8117647, 1,
1.072143, 0.63855, 1.864437, 1, 0, 0.8039216, 1,
1.083102, 0.4553964, -0.5430348, 1, 0, 0.7960784, 1,
1.083213, -0.6249823, 2.534984, 1, 0, 0.7921569, 1,
1.08721, 0.03592005, 1.576695, 1, 0, 0.7843137, 1,
1.090492, 0.7625598, 0.5819923, 1, 0, 0.7803922, 1,
1.091841, 1.827291, 0.66572, 1, 0, 0.772549, 1,
1.092326, -0.2552312, 0.9601076, 1, 0, 0.7686275, 1,
1.092569, -0.5610929, 0.6460033, 1, 0, 0.7607843, 1,
1.092678, 1.338664, -0.4840188, 1, 0, 0.7568628, 1,
1.094085, 1.770254, 1.978243, 1, 0, 0.7490196, 1,
1.095443, 0.7372735, 1.421156, 1, 0, 0.7450981, 1,
1.095548, 0.2919771, 1.355301, 1, 0, 0.7372549, 1,
1.099159, -0.0262391, 0.7075651, 1, 0, 0.7333333, 1,
1.101825, -0.2006767, 2.930863, 1, 0, 0.7254902, 1,
1.10311, -1.015153, 2.567824, 1, 0, 0.7215686, 1,
1.118833, -0.1879727, 2.537127, 1, 0, 0.7137255, 1,
1.121134, -1.983081, 2.892322, 1, 0, 0.7098039, 1,
1.121444, 0.6776253, 1.527725, 1, 0, 0.7019608, 1,
1.12474, -0.9764779, 1.191839, 1, 0, 0.6941177, 1,
1.12661, 0.9789641, 2.578589, 1, 0, 0.6901961, 1,
1.14607, 0.3911988, 0.3799883, 1, 0, 0.682353, 1,
1.154079, -1.827752, 3.370157, 1, 0, 0.6784314, 1,
1.155647, 0.1017138, 0.9262757, 1, 0, 0.6705883, 1,
1.163088, -0.3649937, 2.624578, 1, 0, 0.6666667, 1,
1.165665, 1.043159, 0.2782072, 1, 0, 0.6588235, 1,
1.169178, -0.01957449, 1.89397, 1, 0, 0.654902, 1,
1.169867, 0.5743049, 1.206899, 1, 0, 0.6470588, 1,
1.170321, 0.6671259, 2.269914, 1, 0, 0.6431373, 1,
1.170573, -0.2523072, 2.146369, 1, 0, 0.6352941, 1,
1.172465, -0.7599738, 2.741482, 1, 0, 0.6313726, 1,
1.181794, 0.7240887, 0.35186, 1, 0, 0.6235294, 1,
1.182379, -1.152395, 1.823159, 1, 0, 0.6196079, 1,
1.183842, -1.860078, 2.412919, 1, 0, 0.6117647, 1,
1.187002, -0.336318, 2.109047, 1, 0, 0.6078432, 1,
1.188752, 0.1787362, 2.358971, 1, 0, 0.6, 1,
1.19378, 0.1460139, 2.922318, 1, 0, 0.5921569, 1,
1.194863, 1.245356, 1.843431, 1, 0, 0.5882353, 1,
1.19528, 0.5399099, 1.933556, 1, 0, 0.5803922, 1,
1.195949, -1.023656, 2.915113, 1, 0, 0.5764706, 1,
1.19755, -0.5549617, 3.515988, 1, 0, 0.5686275, 1,
1.198785, -0.2905187, 2.058893, 1, 0, 0.5647059, 1,
1.200624, 0.2118376, 0.8695664, 1, 0, 0.5568628, 1,
1.201845, 1.338086, 1.789293, 1, 0, 0.5529412, 1,
1.206058, -0.4469347, 1.199564, 1, 0, 0.5450981, 1,
1.208647, 0.4380004, 1.704773, 1, 0, 0.5411765, 1,
1.212032, -0.3249384, 1.748445, 1, 0, 0.5333334, 1,
1.21222, 0.2866762, -0.2607192, 1, 0, 0.5294118, 1,
1.212365, -1.087819, 2.192679, 1, 0, 0.5215687, 1,
1.213195, -0.9977536, 1.83699, 1, 0, 0.5176471, 1,
1.218882, 1.833545, 0.1916591, 1, 0, 0.509804, 1,
1.243854, 1.773939, 1.037594, 1, 0, 0.5058824, 1,
1.249275, 0.7128181, 1.527049, 1, 0, 0.4980392, 1,
1.251232, -2.127577, 4.477338, 1, 0, 0.4901961, 1,
1.265029, -0.6200024, 0.9960952, 1, 0, 0.4862745, 1,
1.28031, 0.4850073, 1.013985, 1, 0, 0.4784314, 1,
1.280659, -1.260846, 1.856495, 1, 0, 0.4745098, 1,
1.280804, 0.03464806, 0.108281, 1, 0, 0.4666667, 1,
1.282447, 1.273419, 0.6323199, 1, 0, 0.4627451, 1,
1.290102, 0.9644225, 0.3803607, 1, 0, 0.454902, 1,
1.294494, -0.3512333, 0.1021273, 1, 0, 0.4509804, 1,
1.294987, -0.5426981, 2.04989, 1, 0, 0.4431373, 1,
1.304388, 0.8393106, 1.105842, 1, 0, 0.4392157, 1,
1.304903, -0.4433973, 3.836744, 1, 0, 0.4313726, 1,
1.30805, -0.4913913, 0.9300018, 1, 0, 0.427451, 1,
1.322597, 0.1863812, 2.261923, 1, 0, 0.4196078, 1,
1.360028, -0.2139841, 1.815182, 1, 0, 0.4156863, 1,
1.373285, -1.460153, 3.392746, 1, 0, 0.4078431, 1,
1.375543, -1.006323, 2.01656, 1, 0, 0.4039216, 1,
1.380984, -0.4704808, 0.8977838, 1, 0, 0.3960784, 1,
1.395082, -1.179212, 2.4357, 1, 0, 0.3882353, 1,
1.408044, 0.9492841, 1.904497, 1, 0, 0.3843137, 1,
1.409516, -1.556302, 2.671629, 1, 0, 0.3764706, 1,
1.42241, -0.8203124, 2.518315, 1, 0, 0.372549, 1,
1.427021, 2.067877, 0.3165835, 1, 0, 0.3647059, 1,
1.431231, -0.07128695, 1.948154, 1, 0, 0.3607843, 1,
1.436556, -0.4068093, 0.7288957, 1, 0, 0.3529412, 1,
1.443374, -0.6679478, 2.24928, 1, 0, 0.3490196, 1,
1.457332, 0.3038336, 0.2788431, 1, 0, 0.3411765, 1,
1.461583, -0.7555603, 0.550541, 1, 0, 0.3372549, 1,
1.466642, -0.08101876, 0.5539975, 1, 0, 0.3294118, 1,
1.489644, -1.319953, 0.7414181, 1, 0, 0.3254902, 1,
1.493348, 0.3494765, 1.353099, 1, 0, 0.3176471, 1,
1.498004, 0.8262109, 4.436305, 1, 0, 0.3137255, 1,
1.498685, 0.522489, 0.6854813, 1, 0, 0.3058824, 1,
1.498822, 1.05742, 0.9928486, 1, 0, 0.2980392, 1,
1.49989, -0.3768591, 2.146266, 1, 0, 0.2941177, 1,
1.504906, -0.05656396, 0.8949315, 1, 0, 0.2862745, 1,
1.507576, -1.358486, 1.682407, 1, 0, 0.282353, 1,
1.508959, -0.09105278, 2.934182, 1, 0, 0.2745098, 1,
1.527789, -2.480091, 3.68652, 1, 0, 0.2705882, 1,
1.535862, 2.523555, 0.1668709, 1, 0, 0.2627451, 1,
1.540463, 0.3555458, -0.2658411, 1, 0, 0.2588235, 1,
1.546935, 0.7929761, 1.348762, 1, 0, 0.2509804, 1,
1.547856, -0.4204805, 2.989629, 1, 0, 0.2470588, 1,
1.55496, -1.30288, 1.998121, 1, 0, 0.2392157, 1,
1.558258, -0.4088875, -0.5456003, 1, 0, 0.2352941, 1,
1.597968, -0.4597149, 1.564309, 1, 0, 0.227451, 1,
1.598578, 2.023058, 0.7784576, 1, 0, 0.2235294, 1,
1.605324, -0.6688453, 2.561609, 1, 0, 0.2156863, 1,
1.620795, 1.055508, 1.134782, 1, 0, 0.2117647, 1,
1.63685, -0.3765133, 1.618544, 1, 0, 0.2039216, 1,
1.674555, 0.3367806, 2.331197, 1, 0, 0.1960784, 1,
1.716358, 0.4566939, -0.1311672, 1, 0, 0.1921569, 1,
1.722817, 1.102538, 1.376737, 1, 0, 0.1843137, 1,
1.736578, 2.06215, 2.253257, 1, 0, 0.1803922, 1,
1.754055, 0.898465, 0.2482088, 1, 0, 0.172549, 1,
1.789846, 0.1381937, 2.421074, 1, 0, 0.1686275, 1,
1.821145, 0.2963514, 0.8291543, 1, 0, 0.1607843, 1,
1.844507, -0.7222537, 2.549139, 1, 0, 0.1568628, 1,
1.872871, -1.382105, 2.074453, 1, 0, 0.1490196, 1,
1.876691, -1.650781, 3.632876, 1, 0, 0.145098, 1,
1.910893, -1.397574, 2.382114, 1, 0, 0.1372549, 1,
1.933434, 0.9467083, 1.88814, 1, 0, 0.1333333, 1,
1.938032, 1.317601, 0.9098432, 1, 0, 0.1254902, 1,
1.974808, 1.146421, -0.7685345, 1, 0, 0.1215686, 1,
1.984697, 0.631452, 0.04333666, 1, 0, 0.1137255, 1,
1.990724, 0.01232999, 0.5164018, 1, 0, 0.1098039, 1,
2.021103, -0.3413265, 1.897895, 1, 0, 0.1019608, 1,
2.041571, 0.6538631, 1.708219, 1, 0, 0.09411765, 1,
2.042033, -1.444117, 1.916767, 1, 0, 0.09019608, 1,
2.050444, -0.9691092, 0.4899548, 1, 0, 0.08235294, 1,
2.078962, -0.7876332, 0.8036598, 1, 0, 0.07843138, 1,
2.110128, 0.3471177, 3.657312, 1, 0, 0.07058824, 1,
2.186304, -2.145799, 0.9524468, 1, 0, 0.06666667, 1,
2.232642, -0.7327528, 0.824935, 1, 0, 0.05882353, 1,
2.241425, 1.885987, 0.02991498, 1, 0, 0.05490196, 1,
2.275182, -0.3178286, 3.219947, 1, 0, 0.04705882, 1,
2.294187, 0.292141, 0.7971631, 1, 0, 0.04313726, 1,
2.417812, -0.4504786, 2.015812, 1, 0, 0.03529412, 1,
2.460158, 2.154191, 1.385103, 1, 0, 0.03137255, 1,
2.66852, 0.4486424, 2.003441, 1, 0, 0.02352941, 1,
2.694755, 0.5837644, 0.7156075, 1, 0, 0.01960784, 1,
2.816906, -0.2617362, 0.4083266, 1, 0, 0.01176471, 1,
3.612079, -1.764678, 1.60809, 1, 0, 0.007843138, 1
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
0.03946567, -4.242402, -6.51936, 0, -0.5, 0.5, 0.5,
0.03946567, -4.242402, -6.51936, 1, -0.5, 0.5, 0.5,
0.03946567, -4.242402, -6.51936, 1, 1.5, 0.5, 0.5,
0.03946567, -4.242402, -6.51936, 0, 1.5, 0.5, 0.5
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
-4.744264, -0.03151822, -6.51936, 0, -0.5, 0.5, 0.5,
-4.744264, -0.03151822, -6.51936, 1, -0.5, 0.5, 0.5,
-4.744264, -0.03151822, -6.51936, 1, 1.5, 0.5, 0.5,
-4.744264, -0.03151822, -6.51936, 0, 1.5, 0.5, 0.5
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
-4.744264, -4.242402, 0.3974233, 0, -0.5, 0.5, 0.5,
-4.744264, -4.242402, 0.3974233, 1, -0.5, 0.5, 0.5,
-4.744264, -4.242402, 0.3974233, 1, 1.5, 0.5, 0.5,
-4.744264, -4.242402, 0.3974233, 0, 1.5, 0.5, 0.5
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
-2, -3.270659, -4.923179,
2, -3.270659, -4.923179,
-2, -3.270659, -4.923179,
-2, -3.432616, -5.189209,
0, -3.270659, -4.923179,
0, -3.432616, -5.189209,
2, -3.270659, -4.923179,
2, -3.432616, -5.189209
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
-2, -3.75653, -5.721269, 0, -0.5, 0.5, 0.5,
-2, -3.75653, -5.721269, 1, -0.5, 0.5, 0.5,
-2, -3.75653, -5.721269, 1, 1.5, 0.5, 0.5,
-2, -3.75653, -5.721269, 0, 1.5, 0.5, 0.5,
0, -3.75653, -5.721269, 0, -0.5, 0.5, 0.5,
0, -3.75653, -5.721269, 1, -0.5, 0.5, 0.5,
0, -3.75653, -5.721269, 1, 1.5, 0.5, 0.5,
0, -3.75653, -5.721269, 0, 1.5, 0.5, 0.5,
2, -3.75653, -5.721269, 0, -0.5, 0.5, 0.5,
2, -3.75653, -5.721269, 1, -0.5, 0.5, 0.5,
2, -3.75653, -5.721269, 1, 1.5, 0.5, 0.5,
2, -3.75653, -5.721269, 0, 1.5, 0.5, 0.5
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
-3.640326, -3, -4.923179,
-3.640326, 3, -4.923179,
-3.640326, -3, -4.923179,
-3.824316, -3, -5.189209,
-3.640326, -2, -4.923179,
-3.824316, -2, -5.189209,
-3.640326, -1, -4.923179,
-3.824316, -1, -5.189209,
-3.640326, 0, -4.923179,
-3.824316, 0, -5.189209,
-3.640326, 1, -4.923179,
-3.824316, 1, -5.189209,
-3.640326, 2, -4.923179,
-3.824316, 2, -5.189209,
-3.640326, 3, -4.923179,
-3.824316, 3, -5.189209
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
-4.192295, -3, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, -3, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, -3, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, -3, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, -2, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, -2, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, -2, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, -2, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, -1, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, -1, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, -1, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, -1, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, 0, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, 0, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, 0, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, 0, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, 1, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, 1, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, 1, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, 1, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, 2, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, 2, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, 2, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, 2, -5.721269, 0, 1.5, 0.5, 0.5,
-4.192295, 3, -5.721269, 0, -0.5, 0.5, 0.5,
-4.192295, 3, -5.721269, 1, -0.5, 0.5, 0.5,
-4.192295, 3, -5.721269, 1, 1.5, 0.5, 0.5,
-4.192295, 3, -5.721269, 0, 1.5, 0.5, 0.5
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
-3.640326, -3.270659, -4,
-3.640326, -3.270659, 4,
-3.640326, -3.270659, -4,
-3.824316, -3.432616, -4,
-3.640326, -3.270659, -2,
-3.824316, -3.432616, -2,
-3.640326, -3.270659, 0,
-3.824316, -3.432616, 0,
-3.640326, -3.270659, 2,
-3.824316, -3.432616, 2,
-3.640326, -3.270659, 4,
-3.824316, -3.432616, 4
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
-4.192295, -3.75653, -4, 0, -0.5, 0.5, 0.5,
-4.192295, -3.75653, -4, 1, -0.5, 0.5, 0.5,
-4.192295, -3.75653, -4, 1, 1.5, 0.5, 0.5,
-4.192295, -3.75653, -4, 0, 1.5, 0.5, 0.5,
-4.192295, -3.75653, -2, 0, -0.5, 0.5, 0.5,
-4.192295, -3.75653, -2, 1, -0.5, 0.5, 0.5,
-4.192295, -3.75653, -2, 1, 1.5, 0.5, 0.5,
-4.192295, -3.75653, -2, 0, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 0, 0, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 0, 1, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 0, 1, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 0, 0, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 2, 0, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 2, 1, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 2, 1, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 2, 0, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 4, 0, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 4, 1, -0.5, 0.5, 0.5,
-4.192295, -3.75653, 4, 1, 1.5, 0.5, 0.5,
-4.192295, -3.75653, 4, 0, 1.5, 0.5, 0.5
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
-3.640326, -3.270659, -4.923179,
-3.640326, 3.207623, -4.923179,
-3.640326, -3.270659, 5.718026,
-3.640326, 3.207623, 5.718026,
-3.640326, -3.270659, -4.923179,
-3.640326, -3.270659, 5.718026,
-3.640326, 3.207623, -4.923179,
-3.640326, 3.207623, 5.718026,
-3.640326, -3.270659, -4.923179,
3.719258, -3.270659, -4.923179,
-3.640326, -3.270659, 5.718026,
3.719258, -3.270659, 5.718026,
-3.640326, 3.207623, -4.923179,
3.719258, 3.207623, -4.923179,
-3.640326, 3.207623, 5.718026,
3.719258, 3.207623, 5.718026,
3.719258, -3.270659, -4.923179,
3.719258, 3.207623, -4.923179,
3.719258, -3.270659, 5.718026,
3.719258, 3.207623, 5.718026,
3.719258, -3.270659, -4.923179,
3.719258, -3.270659, 5.718026,
3.719258, 3.207623, -4.923179,
3.719258, 3.207623, 5.718026
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
var radius = 7.72644;
var distance = 34.3758;
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
mvMatrix.translate( -0.03946567, 0.03151822, -0.3974233 );
mvMatrix.scale( 1.135116, 1.289536, 0.7850595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3758);
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
fluorodifen<-read.table("fluorodifen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluorodifen$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
```

```r
y<-fluorodifen$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
```

```r
z<-fluorodifen$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluorodifen' not found
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
-3.533148, 0.5122758, -2.671061, 0, 0, 1, 1, 1,
-3.052021, 0.3103202, -1.204317, 1, 0, 0, 1, 1,
-2.852823, -0.2433771, -1.944218, 1, 0, 0, 1, 1,
-2.581598, 0.2941099, -1.887139, 1, 0, 0, 1, 1,
-2.577202, 2.049316, -0.5820539, 1, 0, 0, 1, 1,
-2.509452, 1.045501, -1.595425, 1, 0, 0, 1, 1,
-2.507752, 0.1644678, -0.1161708, 0, 0, 0, 1, 1,
-2.434073, -1.602061, -3.048397, 0, 0, 0, 1, 1,
-2.433725, -0.3813095, -2.064923, 0, 0, 0, 1, 1,
-2.386682, 1.805313, -1.411952, 0, 0, 0, 1, 1,
-2.342463, 1.813883, -2.511765, 0, 0, 0, 1, 1,
-2.283493, -0.6881609, -1.52962, 0, 0, 0, 1, 1,
-2.280596, -0.7523802, -0.636211, 0, 0, 0, 1, 1,
-2.275634, -1.301664, -0.8232406, 1, 1, 1, 1, 1,
-2.237503, -0.5957513, -2.506359, 1, 1, 1, 1, 1,
-2.181088, -2.077643, -2.234952, 1, 1, 1, 1, 1,
-2.139221, -1.318693, -2.209771, 1, 1, 1, 1, 1,
-2.122135, -1.772228, -2.692085, 1, 1, 1, 1, 1,
-2.084054, -0.6320333, -1.450831, 1, 1, 1, 1, 1,
-2.05749, 0.1823541, -1.815473, 1, 1, 1, 1, 1,
-2.056846, 0.03349652, -2.687282, 1, 1, 1, 1, 1,
-2.055442, -0.1615009, -0.0741241, 1, 1, 1, 1, 1,
-2.016775, 1.386523, -1.358807, 1, 1, 1, 1, 1,
-2.016129, -0.4613671, -0.3043584, 1, 1, 1, 1, 1,
-1.980353, -0.08805658, -2.90881, 1, 1, 1, 1, 1,
-1.966793, -1.000398, -3.769581, 1, 1, 1, 1, 1,
-1.96474, 0.9663756, -2.721472, 1, 1, 1, 1, 1,
-1.943842, -0.229221, -3.310448, 1, 1, 1, 1, 1,
-1.943235, -0.7004793, -1.621661, 0, 0, 1, 1, 1,
-1.923705, 0.7795516, -2.054699, 1, 0, 0, 1, 1,
-1.918984, -0.3481086, -1.295488, 1, 0, 0, 1, 1,
-1.865554, 0.1188518, -0.4638476, 1, 0, 0, 1, 1,
-1.847603, -0.2845253, -1.370648, 1, 0, 0, 1, 1,
-1.84575, -0.406787, -2.427495, 1, 0, 0, 1, 1,
-1.823058, -1.218382, -0.8861704, 0, 0, 0, 1, 1,
-1.777049, 0.7662081, -2.149877, 0, 0, 0, 1, 1,
-1.771062, 0.3383887, -0.5727636, 0, 0, 0, 1, 1,
-1.744171, 1.054745, -1.282067, 0, 0, 0, 1, 1,
-1.74231, -0.733009, -0.9746996, 0, 0, 0, 1, 1,
-1.706522, 1.364099, -0.9771106, 0, 0, 0, 1, 1,
-1.696231, 1.368452, -0.6560166, 0, 0, 0, 1, 1,
-1.68841, -0.570573, -3.125639, 1, 1, 1, 1, 1,
-1.683888, 1.178392, -0.4761612, 1, 1, 1, 1, 1,
-1.676648, -0.2352295, -1.701355, 1, 1, 1, 1, 1,
-1.667439, -0.5913979, -1.26957, 1, 1, 1, 1, 1,
-1.660382, 0.8121027, -2.473373, 1, 1, 1, 1, 1,
-1.652927, 0.7685364, -0.04998378, 1, 1, 1, 1, 1,
-1.621782, -0.4514171, -3.147745, 1, 1, 1, 1, 1,
-1.615218, 0.6005973, -0.3740646, 1, 1, 1, 1, 1,
-1.592766, -0.5472577, -1.26804, 1, 1, 1, 1, 1,
-1.57994, -0.9765827, -1.529035, 1, 1, 1, 1, 1,
-1.566752, 0.0961713, -1.354672, 1, 1, 1, 1, 1,
-1.545054, -0.3482709, -1.672009, 1, 1, 1, 1, 1,
-1.539189, -1.728716, -1.373518, 1, 1, 1, 1, 1,
-1.538976, 0.5971758, 0.108353, 1, 1, 1, 1, 1,
-1.53252, 0.701279, -1.037389, 1, 1, 1, 1, 1,
-1.529385, 2.301724, 0.6187543, 0, 0, 1, 1, 1,
-1.509754, -0.02677073, -3.292985, 1, 0, 0, 1, 1,
-1.502583, 2.638974, -0.6677829, 1, 0, 0, 1, 1,
-1.492166, -0.6802343, -1.762196, 1, 0, 0, 1, 1,
-1.489901, 0.1220781, -1.654614, 1, 0, 0, 1, 1,
-1.483403, 1.312618, -2.237952, 1, 0, 0, 1, 1,
-1.46074, -0.4375013, -4.006549, 0, 0, 0, 1, 1,
-1.443979, -1.128604, -2.674512, 0, 0, 0, 1, 1,
-1.443426, 0.1373138, 1.020234, 0, 0, 0, 1, 1,
-1.433374, -2.398708, -3.758413, 0, 0, 0, 1, 1,
-1.433049, 0.7473915, -0.7341148, 0, 0, 0, 1, 1,
-1.429388, -0.2776324, -2.466355, 0, 0, 0, 1, 1,
-1.428396, -1.81742, -0.8302143, 0, 0, 0, 1, 1,
-1.404239, -1.231999, -2.397031, 1, 1, 1, 1, 1,
-1.403599, -0.120265, -1.836252, 1, 1, 1, 1, 1,
-1.403166, 0.4739197, 0.09337351, 1, 1, 1, 1, 1,
-1.395705, 0.2781548, -1.651375, 1, 1, 1, 1, 1,
-1.390032, -0.683668, -3.406026, 1, 1, 1, 1, 1,
-1.381924, -0.3651013, -1.150383, 1, 1, 1, 1, 1,
-1.379774, -0.5800717, -1.512501, 1, 1, 1, 1, 1,
-1.37242, -0.9974879, -2.444278, 1, 1, 1, 1, 1,
-1.369559, 0.6430446, -1.210559, 1, 1, 1, 1, 1,
-1.356885, -0.2242707, -2.238542, 1, 1, 1, 1, 1,
-1.354811, 1.889275, -0.813265, 1, 1, 1, 1, 1,
-1.350751, 0.7189692, -0.08723127, 1, 1, 1, 1, 1,
-1.347918, 2.517395, -1.335587, 1, 1, 1, 1, 1,
-1.344126, -2.052899, -3.235147, 1, 1, 1, 1, 1,
-1.342204, 1.118298, -1.122854, 1, 1, 1, 1, 1,
-1.340063, 0.2168385, -2.263932, 0, 0, 1, 1, 1,
-1.334414, -0.4709257, -1.352206, 1, 0, 0, 1, 1,
-1.332775, -0.4324576, -2.08785, 1, 0, 0, 1, 1,
-1.332751, 1.158816, -1.774418, 1, 0, 0, 1, 1,
-1.33114, 3.113279, -0.8733778, 1, 0, 0, 1, 1,
-1.330309, 0.001598371, 0.1222923, 1, 0, 0, 1, 1,
-1.327539, -0.7118449, -1.722273, 0, 0, 0, 1, 1,
-1.324134, 1.816149, -1.69986, 0, 0, 0, 1, 1,
-1.315988, -0.3329212, -2.067083, 0, 0, 0, 1, 1,
-1.312607, -1.18387, -2.074176, 0, 0, 0, 1, 1,
-1.311586, 0.8434778, -0.5293584, 0, 0, 0, 1, 1,
-1.29607, 1.163365, -0.8582014, 0, 0, 0, 1, 1,
-1.290547, 0.04040604, -1.111917, 0, 0, 0, 1, 1,
-1.289902, 0.1172208, 0.1938793, 1, 1, 1, 1, 1,
-1.279477, -0.900277, -2.551362, 1, 1, 1, 1, 1,
-1.273794, 1.335, -1.294051, 1, 1, 1, 1, 1,
-1.269055, 0.802156, 0.01541742, 1, 1, 1, 1, 1,
-1.266834, 1.050229, -0.614021, 1, 1, 1, 1, 1,
-1.266655, 0.8955378, -0.8761033, 1, 1, 1, 1, 1,
-1.266495, -0.3450638, -0.9275047, 1, 1, 1, 1, 1,
-1.258812, -2.176106, -3.53304, 1, 1, 1, 1, 1,
-1.253704, -0.9985781, -0.7502723, 1, 1, 1, 1, 1,
-1.250195, -1.220083, -1.786791, 1, 1, 1, 1, 1,
-1.249455, 0.8048723, 0.3015562, 1, 1, 1, 1, 1,
-1.249366, -1.000867, -1.013309, 1, 1, 1, 1, 1,
-1.247368, -1.401897, -1.378164, 1, 1, 1, 1, 1,
-1.224758, -0.6390111, -0.4870104, 1, 1, 1, 1, 1,
-1.222644, 1.089228, -3.408381, 1, 1, 1, 1, 1,
-1.215782, -0.3892404, -1.813989, 0, 0, 1, 1, 1,
-1.211877, -0.9145268, -3.567282, 1, 0, 0, 1, 1,
-1.207452, 0.1357327, -1.997375, 1, 0, 0, 1, 1,
-1.203888, -0.5030786, -2.974562, 1, 0, 0, 1, 1,
-1.203005, -0.1100793, -2.053162, 1, 0, 0, 1, 1,
-1.199789, 1.686254, 0.96065, 1, 0, 0, 1, 1,
-1.194514, -0.8088868, -2.033599, 0, 0, 0, 1, 1,
-1.18602, 0.4913572, -0.5526394, 0, 0, 0, 1, 1,
-1.165469, 0.9895899, -2.650504, 0, 0, 0, 1, 1,
-1.155004, -0.1464006, -0.9840248, 0, 0, 0, 1, 1,
-1.153848, -0.3303049, -2.521842, 0, 0, 0, 1, 1,
-1.145667, -0.1803813, -1.773752, 0, 0, 0, 1, 1,
-1.137172, 1.277535, -0.3681614, 0, 0, 0, 1, 1,
-1.136438, -0.4893465, -1.602894, 1, 1, 1, 1, 1,
-1.133126, -0.1819512, -2.938595, 1, 1, 1, 1, 1,
-1.130942, 0.066342, -1.509009, 1, 1, 1, 1, 1,
-1.11874, 1.583395, -2.449834, 1, 1, 1, 1, 1,
-1.115792, -1.051457, -3.596891, 1, 1, 1, 1, 1,
-1.114455, 1.135241, -1.540648, 1, 1, 1, 1, 1,
-1.111621, -1.975534, -2.587598, 1, 1, 1, 1, 1,
-1.104039, -0.9687116, -1.447019, 1, 1, 1, 1, 1,
-1.104004, 0.4189932, -3.258145, 1, 1, 1, 1, 1,
-1.103707, -0.4417548, -1.916044, 1, 1, 1, 1, 1,
-1.093416, -0.7375825, -1.823829, 1, 1, 1, 1, 1,
-1.080646, 1.499066, -0.0191584, 1, 1, 1, 1, 1,
-1.078895, -0.6146886, -1.19614, 1, 1, 1, 1, 1,
-1.078302, -1.256524, -1.15032, 1, 1, 1, 1, 1,
-1.075409, -1.206018, -1.731641, 1, 1, 1, 1, 1,
-1.075323, -1.956266, -2.906762, 0, 0, 1, 1, 1,
-1.065222, -0.3150707, 1.364453, 1, 0, 0, 1, 1,
-1.064489, -0.7887065, -2.660436, 1, 0, 0, 1, 1,
-1.055479, 1.476233, 2.383773, 1, 0, 0, 1, 1,
-1.053487, 0.7669271, 0.8270382, 1, 0, 0, 1, 1,
-1.041471, -0.566888, -2.117717, 1, 0, 0, 1, 1,
-1.040561, -0.247625, -2.461549, 0, 0, 0, 1, 1,
-1.030722, 0.4107084, -1.343921, 0, 0, 0, 1, 1,
-1.030305, -1.40719, -2.099351, 0, 0, 0, 1, 1,
-1.028954, 0.6855322, -0.9191896, 0, 0, 0, 1, 1,
-1.028262, -0.6583788, -2.234098, 0, 0, 0, 1, 1,
-1.027272, -1.111445, -2.606482, 0, 0, 0, 1, 1,
-1.025468, 1.948417, -0.321966, 0, 0, 0, 1, 1,
-1.022815, -0.3197137, -2.584131, 1, 1, 1, 1, 1,
-1.022375, -0.5203215, -1.838971, 1, 1, 1, 1, 1,
-1.021803, -0.8850778, -3.423314, 1, 1, 1, 1, 1,
-1.019554, 0.5092695, -1.351968, 1, 1, 1, 1, 1,
-1.01949, 1.30331, -2.853293, 1, 1, 1, 1, 1,
-1.016422, -3.176315, -2.502181, 1, 1, 1, 1, 1,
-1.01212, 0.6704911, 0.9025281, 1, 1, 1, 1, 1,
-1.009126, 0.5771508, -0.09533531, 1, 1, 1, 1, 1,
-1.007255, -1.579717, -0.6839642, 1, 1, 1, 1, 1,
-1.005055, 1.004877, -1.965442, 1, 1, 1, 1, 1,
-1.003867, -0.06983831, -2.898516, 1, 1, 1, 1, 1,
-1.002859, -1.688505, -2.31169, 1, 1, 1, 1, 1,
-0.9975319, -0.7066432, -2.461856, 1, 1, 1, 1, 1,
-0.9948884, -0.407461, -3.030931, 1, 1, 1, 1, 1,
-0.9921421, 2.042876, -1.598506, 1, 1, 1, 1, 1,
-0.9874228, -0.8765906, -2.904503, 0, 0, 1, 1, 1,
-0.9857346, 0.2551047, -0.4498956, 1, 0, 0, 1, 1,
-0.9762931, -0.1874116, -1.732609, 1, 0, 0, 1, 1,
-0.9691263, 0.3571009, -1.00924, 1, 0, 0, 1, 1,
-0.9672481, -0.1070619, -1.006807, 1, 0, 0, 1, 1,
-0.9656508, -0.6497522, -1.083923, 1, 0, 0, 1, 1,
-0.9616848, -0.3865072, -0.7652351, 0, 0, 0, 1, 1,
-0.9576381, -0.4291111, -3.413436, 0, 0, 0, 1, 1,
-0.9510148, -0.8417292, -3.158995, 0, 0, 0, 1, 1,
-0.9466728, 0.140655, -1.959023, 0, 0, 0, 1, 1,
-0.9423253, 0.126294, -3.569093, 0, 0, 0, 1, 1,
-0.9408042, -0.0863924, -0.4001372, 0, 0, 0, 1, 1,
-0.940113, -1.172726, -1.007309, 0, 0, 0, 1, 1,
-0.9389692, 0.4411676, -1.13158, 1, 1, 1, 1, 1,
-0.9341372, 0.866499, -1.390543, 1, 1, 1, 1, 1,
-0.9287856, 1.610321, 0.6586046, 1, 1, 1, 1, 1,
-0.9278908, -0.2613495, -2.209165, 1, 1, 1, 1, 1,
-0.9272946, 0.9506133, 0.2429398, 1, 1, 1, 1, 1,
-0.9150432, -0.4243076, -1.448663, 1, 1, 1, 1, 1,
-0.9149191, -0.07768602, -0.9213782, 1, 1, 1, 1, 1,
-0.9137623, -1.805051, -1.859646, 1, 1, 1, 1, 1,
-0.9125072, -0.9356067, -1.97059, 1, 1, 1, 1, 1,
-0.9062806, 1.218008, 0.7013832, 1, 1, 1, 1, 1,
-0.9033563, -0.5675817, -2.120968, 1, 1, 1, 1, 1,
-0.9024547, -0.5168411, 0.1683088, 1, 1, 1, 1, 1,
-0.8983642, -0.897442, -2.092805, 1, 1, 1, 1, 1,
-0.8973178, -1.958909, -2.921128, 1, 1, 1, 1, 1,
-0.897316, -1.571431, -2.599693, 1, 1, 1, 1, 1,
-0.8902361, 1.311847, -0.773437, 0, 0, 1, 1, 1,
-0.8895018, 0.1391477, -1.343744, 1, 0, 0, 1, 1,
-0.8886217, -0.7962136, -2.863218, 1, 0, 0, 1, 1,
-0.8817573, -0.1687629, -2.083383, 1, 0, 0, 1, 1,
-0.8804787, 0.1328577, -0.5141216, 1, 0, 0, 1, 1,
-0.8777149, 0.04023401, -2.044702, 1, 0, 0, 1, 1,
-0.8721925, 1.492654, -1.332988, 0, 0, 0, 1, 1,
-0.8712492, 0.5286465, -0.3098025, 0, 0, 0, 1, 1,
-0.8670973, 0.2605065, -1.046868, 0, 0, 0, 1, 1,
-0.8535328, -1.106647, -2.939169, 0, 0, 0, 1, 1,
-0.8497244, -0.8789434, -0.09933788, 0, 0, 0, 1, 1,
-0.8466591, -0.5322988, -2.54225, 0, 0, 0, 1, 1,
-0.8381167, -1.530147, -3.901303, 0, 0, 0, 1, 1,
-0.8380278, 0.1714473, -0.6852421, 1, 1, 1, 1, 1,
-0.8359326, -1.45131, -1.71663, 1, 1, 1, 1, 1,
-0.8283535, -1.351971, -3.063779, 1, 1, 1, 1, 1,
-0.824324, -0.9240836, -3.35863, 1, 1, 1, 1, 1,
-0.8221304, -0.04975063, -2.857097, 1, 1, 1, 1, 1,
-0.8216562, -0.2384211, -1.501987, 1, 1, 1, 1, 1,
-0.8187022, -0.1038665, 0.05846403, 1, 1, 1, 1, 1,
-0.8103123, 1.429452, 0.4163106, 1, 1, 1, 1, 1,
-0.8091367, 0.08688313, -1.841925, 1, 1, 1, 1, 1,
-0.8087391, -1.257665, -1.609763, 1, 1, 1, 1, 1,
-0.8023647, 0.8880851, -2.254562, 1, 1, 1, 1, 1,
-0.8009699, -1.024881, -4.035906, 1, 1, 1, 1, 1,
-0.8002291, -0.5193608, -2.25247, 1, 1, 1, 1, 1,
-0.8000773, -0.8101767, -4.439917, 1, 1, 1, 1, 1,
-0.8000267, 0.2985306, -1.050658, 1, 1, 1, 1, 1,
-0.7994582, 0.4461306, -0.531803, 0, 0, 1, 1, 1,
-0.789739, -0.2034736, -1.741173, 1, 0, 0, 1, 1,
-0.7883397, 0.06344538, -2.555388, 1, 0, 0, 1, 1,
-0.7878506, 2.600387, 0.1699677, 1, 0, 0, 1, 1,
-0.7842624, 1.287142, 1.017434, 1, 0, 0, 1, 1,
-0.7827877, -0.9430493, -3.039721, 1, 0, 0, 1, 1,
-0.7822698, -0.204392, -1.854098, 0, 0, 0, 1, 1,
-0.7817986, -0.1892043, -2.782554, 0, 0, 0, 1, 1,
-0.7792855, 2.049221, -1.12244, 0, 0, 0, 1, 1,
-0.7772381, 0.3394661, -0.7881269, 0, 0, 0, 1, 1,
-0.7728255, 0.5749272, -0.940402, 0, 0, 0, 1, 1,
-0.7648886, 0.6880299, -0.369861, 0, 0, 0, 1, 1,
-0.7612479, -0.2577951, -0.8341842, 0, 0, 0, 1, 1,
-0.760691, 0.7301682, -1.053337, 1, 1, 1, 1, 1,
-0.7606868, 0.007749355, -1.591055, 1, 1, 1, 1, 1,
-0.7562287, -0.05050991, -3.136361, 1, 1, 1, 1, 1,
-0.7533168, -0.6285766, -2.590747, 1, 1, 1, 1, 1,
-0.7511669, 0.2946205, -2.05707, 1, 1, 1, 1, 1,
-0.7495003, -0.03220414, -1.240837, 1, 1, 1, 1, 1,
-0.7475404, -0.09378766, -1.672215, 1, 1, 1, 1, 1,
-0.7451298, 1.055284, -0.5718833, 1, 1, 1, 1, 1,
-0.7403759, -1.481608, -4.389932, 1, 1, 1, 1, 1,
-0.7328882, -1.435317, -0.8978474, 1, 1, 1, 1, 1,
-0.7316996, 0.4439917, -1.571202, 1, 1, 1, 1, 1,
-0.724728, 0.06260975, -1.11751, 1, 1, 1, 1, 1,
-0.7243896, -1.333876, -0.5850959, 1, 1, 1, 1, 1,
-0.7219333, 0.8608062, -0.3729235, 1, 1, 1, 1, 1,
-0.7215546, 1.638676, 0.3947455, 1, 1, 1, 1, 1,
-0.7211527, -1.206603, -2.059173, 0, 0, 1, 1, 1,
-0.7135616, 1.147734, 1.279411, 1, 0, 0, 1, 1,
-0.7115897, 0.5374602, -0.8135296, 1, 0, 0, 1, 1,
-0.708314, 1.209783, 1.241292, 1, 0, 0, 1, 1,
-0.7031191, -0.7683185, -2.426596, 1, 0, 0, 1, 1,
-0.7008866, -0.6108842, -1.253604, 1, 0, 0, 1, 1,
-0.7002773, -0.7857588, -4.644531, 0, 0, 0, 1, 1,
-0.6990344, 0.4289003, -0.5727057, 0, 0, 0, 1, 1,
-0.6956382, -1.31749, -2.591049, 0, 0, 0, 1, 1,
-0.6909735, 0.2352737, -2.697087, 0, 0, 0, 1, 1,
-0.6907402, -0.773016, -1.67284, 0, 0, 0, 1, 1,
-0.6906948, -0.1727975, -3.42189, 0, 0, 0, 1, 1,
-0.6897935, -0.4747703, -3.248542, 0, 0, 0, 1, 1,
-0.6878286, 1.55651, -0.9443073, 1, 1, 1, 1, 1,
-0.6867202, -0.1596053, -2.394497, 1, 1, 1, 1, 1,
-0.685652, 2.223699, 0.795063, 1, 1, 1, 1, 1,
-0.6852242, -1.694718, -2.734939, 1, 1, 1, 1, 1,
-0.6845569, -1.075685, -2.431624, 1, 1, 1, 1, 1,
-0.6838518, -1.293709, -3.08627, 1, 1, 1, 1, 1,
-0.6817113, 0.1249991, -1.169803, 1, 1, 1, 1, 1,
-0.6791977, -1.539582, -2.909682, 1, 1, 1, 1, 1,
-0.6770596, -1.091966, -2.609614, 1, 1, 1, 1, 1,
-0.6734918, -1.018233, -2.150772, 1, 1, 1, 1, 1,
-0.6724834, 1.141816, -0.5700031, 1, 1, 1, 1, 1,
-0.6718325, 0.09663042, -0.6159955, 1, 1, 1, 1, 1,
-0.6582136, 1.653368, -1.276283, 1, 1, 1, 1, 1,
-0.6547018, -0.4347879, -2.587914, 1, 1, 1, 1, 1,
-0.6517583, -0.5778771, -1.288407, 1, 1, 1, 1, 1,
-0.6506976, -0.2234638, -1.58577, 0, 0, 1, 1, 1,
-0.6497049, 0.5132654, -0.7544269, 1, 0, 0, 1, 1,
-0.6383719, -1.601498, -1.889943, 1, 0, 0, 1, 1,
-0.635978, 0.09098801, -1.398397, 1, 0, 0, 1, 1,
-0.6314629, -0.580312, -3.547944, 1, 0, 0, 1, 1,
-0.6287374, 2.021772, -1.106961, 1, 0, 0, 1, 1,
-0.6231555, 0.1170165, -2.658729, 0, 0, 0, 1, 1,
-0.6207302, 0.6270841, -1.975597, 0, 0, 0, 1, 1,
-0.6203774, 0.2526785, -0.9410121, 0, 0, 0, 1, 1,
-0.6199616, 1.056193, -0.7428921, 0, 0, 0, 1, 1,
-0.6175464, -0.5021163, -2.40669, 0, 0, 0, 1, 1,
-0.614702, -0.253269, -0.8344545, 0, 0, 0, 1, 1,
-0.6141281, -0.1978128, -1.571188, 0, 0, 0, 1, 1,
-0.6127021, 1.002455, -2.567967, 1, 1, 1, 1, 1,
-0.6064688, 0.009426767, -0.5730805, 1, 1, 1, 1, 1,
-0.606274, -0.660004, -4.200615, 1, 1, 1, 1, 1,
-0.6057194, -1.136368, -3.879866, 1, 1, 1, 1, 1,
-0.5939773, 0.4301123, -1.448258, 1, 1, 1, 1, 1,
-0.5938966, 0.228712, -2.198033, 1, 1, 1, 1, 1,
-0.5908073, 0.1301399, -1.164178, 1, 1, 1, 1, 1,
-0.5869833, 0.825305, -1.116437, 1, 1, 1, 1, 1,
-0.5850279, 0.6933775, -1.274994, 1, 1, 1, 1, 1,
-0.580152, -1.409745, -3.852665, 1, 1, 1, 1, 1,
-0.5798898, 0.405194, -1.157206, 1, 1, 1, 1, 1,
-0.5774889, -0.3696733, -2.250555, 1, 1, 1, 1, 1,
-0.5757073, -0.8366755, -2.16018, 1, 1, 1, 1, 1,
-0.5723201, 0.1519401, -2.098759, 1, 1, 1, 1, 1,
-0.5702981, -0.4702003, -3.651178, 1, 1, 1, 1, 1,
-0.5687789, -1.9558, -2.809547, 0, 0, 1, 1, 1,
-0.5648689, 1.008697, -0.6924028, 1, 0, 0, 1, 1,
-0.5645188, -0.2622608, -1.229976, 1, 0, 0, 1, 1,
-0.5630328, -0.8619077, -4.039189, 1, 0, 0, 1, 1,
-0.5623712, -0.8115635, -2.83106, 1, 0, 0, 1, 1,
-0.5617527, 0.1026835, -0.8788451, 1, 0, 0, 1, 1,
-0.5609069, 0.09157041, -0.7972886, 0, 0, 0, 1, 1,
-0.559839, -0.9238269, -2.888615, 0, 0, 0, 1, 1,
-0.5580285, 0.4910353, -1.390577, 0, 0, 0, 1, 1,
-0.5555065, -1.1705, -1.714379, 0, 0, 0, 1, 1,
-0.5519785, -0.4056394, -2.754949, 0, 0, 0, 1, 1,
-0.5515989, -0.3797649, -2.738281, 0, 0, 0, 1, 1,
-0.547616, -0.002115923, -1.976706, 0, 0, 0, 1, 1,
-0.5442539, -0.6475641, -2.011867, 1, 1, 1, 1, 1,
-0.539262, 0.7291039, 0.3934922, 1, 1, 1, 1, 1,
-0.5389814, -1.851234, -2.936368, 1, 1, 1, 1, 1,
-0.5387502, 0.5216359, -0.1718893, 1, 1, 1, 1, 1,
-0.5379597, 1.347105, -0.06314368, 1, 1, 1, 1, 1,
-0.5362889, 0.6537331, -3.588327, 1, 1, 1, 1, 1,
-0.53622, -1.012298, -2.083501, 1, 1, 1, 1, 1,
-0.5337255, 0.1123198, -1.997535, 1, 1, 1, 1, 1,
-0.5324661, -0.469364, -3.122297, 1, 1, 1, 1, 1,
-0.5317796, 1.625421, -0.5308703, 1, 1, 1, 1, 1,
-0.5315613, -0.09847594, -0.5155323, 1, 1, 1, 1, 1,
-0.5305184, 0.05644305, -1.664352, 1, 1, 1, 1, 1,
-0.5298645, -0.01770439, -0.1375513, 1, 1, 1, 1, 1,
-0.5280603, -0.9496797, -1.838162, 1, 1, 1, 1, 1,
-0.5229695, 1.807327, -0.1217683, 1, 1, 1, 1, 1,
-0.5175698, -0.2074853, -2.688349, 0, 0, 1, 1, 1,
-0.513953, 0.3319491, -1.079358, 1, 0, 0, 1, 1,
-0.5106056, -0.7729122, -0.9611279, 1, 0, 0, 1, 1,
-0.5074447, -0.4301685, -1.548949, 1, 0, 0, 1, 1,
-0.5073232, 0.8079975, -1.128426, 1, 0, 0, 1, 1,
-0.4964381, 0.4493198, -0.4191606, 1, 0, 0, 1, 1,
-0.4925102, -0.6824914, -2.645739, 0, 0, 0, 1, 1,
-0.4907173, 1.157784, -0.9066503, 0, 0, 0, 1, 1,
-0.4863732, -1.726027, -1.659335, 0, 0, 0, 1, 1,
-0.4835108, 0.8434111, -1.792055, 0, 0, 0, 1, 1,
-0.4822797, 0.3927824, -0.5320743, 0, 0, 0, 1, 1,
-0.4811322, 0.006193568, -1.371787, 0, 0, 0, 1, 1,
-0.4794656, -1.572367, -2.926695, 0, 0, 0, 1, 1,
-0.4754454, -1.635226, -2.870712, 1, 1, 1, 1, 1,
-0.4720154, 0.7376786, -0.9416202, 1, 1, 1, 1, 1,
-0.46656, -0.837739, -3.53692, 1, 1, 1, 1, 1,
-0.4628443, 0.03301188, -2.428917, 1, 1, 1, 1, 1,
-0.4602392, -0.2094179, -1.53395, 1, 1, 1, 1, 1,
-0.4600569, 0.0244797, -0.4141685, 1, 1, 1, 1, 1,
-0.4552312, -0.6567575, -2.724341, 1, 1, 1, 1, 1,
-0.4550434, 0.6094043, -1.960235, 1, 1, 1, 1, 1,
-0.4548796, -0.8257943, -2.042262, 1, 1, 1, 1, 1,
-0.4548634, 1.197912, 0.02831248, 1, 1, 1, 1, 1,
-0.4543678, -0.005585215, -3.807593, 1, 1, 1, 1, 1,
-0.4542424, -0.009302994, -2.478587, 1, 1, 1, 1, 1,
-0.4526484, -0.206832, -2.649002, 1, 1, 1, 1, 1,
-0.4495049, -0.03846227, -2.83235, 1, 1, 1, 1, 1,
-0.4483245, -1.196541, -4.105204, 1, 1, 1, 1, 1,
-0.441687, 0.05490482, -0.717497, 0, 0, 1, 1, 1,
-0.4409888, 0.6342806, 2.691473, 1, 0, 0, 1, 1,
-0.4398666, -0.7294713, -2.477461, 1, 0, 0, 1, 1,
-0.4349414, 0.8706686, 0.2339159, 1, 0, 0, 1, 1,
-0.432648, -1.423261, -2.558521, 1, 0, 0, 1, 1,
-0.4320572, -0.9305228, -2.734486, 1, 0, 0, 1, 1,
-0.4294637, -0.7024285, -2.443597, 0, 0, 0, 1, 1,
-0.4279533, -0.5362963, -2.134662, 0, 0, 0, 1, 1,
-0.4240108, -0.1152827, -0.9276509, 0, 0, 0, 1, 1,
-0.4206989, -0.9534587, -3.574415, 0, 0, 0, 1, 1,
-0.4198865, 1.426801, 1.863212, 0, 0, 0, 1, 1,
-0.4162665, -0.7871067, -4.398288, 0, 0, 0, 1, 1,
-0.415511, -0.1003255, -2.963279, 0, 0, 0, 1, 1,
-0.4090053, 0.3785489, -1.935578, 1, 1, 1, 1, 1,
-0.4086961, 1.639865, 0.8409813, 1, 1, 1, 1, 1,
-0.4076636, -0.4091323, -1.690461, 1, 1, 1, 1, 1,
-0.4062676, 0.2164939, -1.076277, 1, 1, 1, 1, 1,
-0.404374, 1.368628, -1.414045, 1, 1, 1, 1, 1,
-0.4016067, 0.2945622, 0.1747994, 1, 1, 1, 1, 1,
-0.4005982, -0.8062278, -2.774953, 1, 1, 1, 1, 1,
-0.3920835, -0.8052058, -1.94519, 1, 1, 1, 1, 1,
-0.3889485, 2.616621, 0.4060506, 1, 1, 1, 1, 1,
-0.3860513, -0.04140694, 0.5343643, 1, 1, 1, 1, 1,
-0.3806331, -1.385081, -1.315087, 1, 1, 1, 1, 1,
-0.3755392, 0.3851181, -0.4315198, 1, 1, 1, 1, 1,
-0.375404, -0.4666107, -3.243795, 1, 1, 1, 1, 1,
-0.3718558, 1.546907, -0.122927, 1, 1, 1, 1, 1,
-0.3714966, 0.0006031041, -1.393426, 1, 1, 1, 1, 1,
-0.3692181, 1.190314, 0.4569919, 0, 0, 1, 1, 1,
-0.3619459, 0.9643164, -0.4070742, 1, 0, 0, 1, 1,
-0.3618836, 0.06555038, -0.4885519, 1, 0, 0, 1, 1,
-0.3583886, -0.02242232, -2.473223, 1, 0, 0, 1, 1,
-0.3552616, 0.1757157, -2.55693, 1, 0, 0, 1, 1,
-0.3549552, -0.6763875, -2.977961, 1, 0, 0, 1, 1,
-0.3467948, 0.6103736, -1.03302, 0, 0, 0, 1, 1,
-0.3442122, 0.1479577, -0.2081362, 0, 0, 0, 1, 1,
-0.3377447, -1.165785, -4.264235, 0, 0, 0, 1, 1,
-0.3343647, -0.02589108, -1.725623, 0, 0, 0, 1, 1,
-0.3326458, 0.03358363, -2.553323, 0, 0, 0, 1, 1,
-0.3292796, 0.3795077, -0.1039213, 0, 0, 0, 1, 1,
-0.3292038, -0.7108678, -1.018892, 0, 0, 0, 1, 1,
-0.328211, 1.639948, -0.6776148, 1, 1, 1, 1, 1,
-0.3280076, 0.4020971, 1.688142, 1, 1, 1, 1, 1,
-0.321433, 1.066428, -1.478024, 1, 1, 1, 1, 1,
-0.3197024, 0.01748597, -0.658892, 1, 1, 1, 1, 1,
-0.3174795, 0.3372559, 0.2802831, 1, 1, 1, 1, 1,
-0.3153449, -0.784959, -2.787228, 1, 1, 1, 1, 1,
-0.3113572, -2.256407, -3.707445, 1, 1, 1, 1, 1,
-0.3105399, -0.1749758, -2.430363, 1, 1, 1, 1, 1,
-0.3081903, 1.022016, -1.91028, 1, 1, 1, 1, 1,
-0.3049335, -0.8500507, -3.449219, 1, 1, 1, 1, 1,
-0.3013127, 0.2135519, -3.345304, 1, 1, 1, 1, 1,
-0.2983842, -0.7332656, -2.797774, 1, 1, 1, 1, 1,
-0.2961836, 1.62546, 0.092094, 1, 1, 1, 1, 1,
-0.2957534, 0.01840418, -1.240872, 1, 1, 1, 1, 1,
-0.2929151, -0.3628821, -2.646635, 1, 1, 1, 1, 1,
-0.2922314, -1.671336, -3.543196, 0, 0, 1, 1, 1,
-0.2906305, -0.6014643, -2.810091, 1, 0, 0, 1, 1,
-0.2890252, 0.8575645, -0.6264275, 1, 0, 0, 1, 1,
-0.2813027, 1.016943, -1.578675, 1, 0, 0, 1, 1,
-0.2809376, 0.4936042, -0.1734715, 1, 0, 0, 1, 1,
-0.2809084, -0.04192105, -1.95817, 1, 0, 0, 1, 1,
-0.2801515, -0.7380531, -3.523866, 0, 0, 0, 1, 1,
-0.2799557, 1.725186, 0.1771338, 0, 0, 0, 1, 1,
-0.2780532, 0.8213218, -0.2875634, 0, 0, 0, 1, 1,
-0.2711408, 0.3329978, 0.3527343, 0, 0, 0, 1, 1,
-0.2695618, 0.05073598, -2.737336, 0, 0, 0, 1, 1,
-0.2668245, -0.522607, -0.288883, 0, 0, 0, 1, 1,
-0.263791, 0.9989722, -0.7737198, 0, 0, 0, 1, 1,
-0.2578501, -1.540126, -2.237111, 1, 1, 1, 1, 1,
-0.2562478, 0.7359523, -0.03998017, 1, 1, 1, 1, 1,
-0.2554848, 0.8467776, -0.03326231, 1, 1, 1, 1, 1,
-0.2519138, 0.5599447, -0.8589145, 1, 1, 1, 1, 1,
-0.2516986, -0.8172752, -4.476528, 1, 1, 1, 1, 1,
-0.2497125, 0.5301844, -0.9420141, 1, 1, 1, 1, 1,
-0.2473364, 0.04948283, -1.156931, 1, 1, 1, 1, 1,
-0.2473247, -0.7089411, -0.6937935, 1, 1, 1, 1, 1,
-0.2448821, 0.1045858, -1.221118, 1, 1, 1, 1, 1,
-0.2393773, -0.5200362, -2.686964, 1, 1, 1, 1, 1,
-0.2307786, 0.6983633, -1.666073, 1, 1, 1, 1, 1,
-0.2274297, -0.08201153, -1.810511, 1, 1, 1, 1, 1,
-0.2253142, 0.4400482, 0.02055224, 1, 1, 1, 1, 1,
-0.2250213, -1.653553, -2.09635, 1, 1, 1, 1, 1,
-0.2234406, 1.232599, -1.337766, 1, 1, 1, 1, 1,
-0.2228733, 0.1920029, -1.286746, 0, 0, 1, 1, 1,
-0.2176726, -0.7874677, -3.034847, 1, 0, 0, 1, 1,
-0.2169976, -1.177056, -4.76821, 1, 0, 0, 1, 1,
-0.2163669, 0.4652694, -1.353221, 1, 0, 0, 1, 1,
-0.215106, 0.884488, 0.3579517, 1, 0, 0, 1, 1,
-0.2121993, -0.505612, -2.73519, 1, 0, 0, 1, 1,
-0.210748, -0.3905801, -3.668092, 0, 0, 0, 1, 1,
-0.2098039, 0.2950036, -2.055417, 0, 0, 0, 1, 1,
-0.2086683, -0.1942961, -2.460623, 0, 0, 0, 1, 1,
-0.2081997, -0.6254816, -1.552309, 0, 0, 0, 1, 1,
-0.204115, -0.4415534, -4.079577, 0, 0, 0, 1, 1,
-0.20298, -1.317716, -3.937998, 0, 0, 0, 1, 1,
-0.2000811, -0.1713464, -3.038843, 0, 0, 0, 1, 1,
-0.1987483, 0.4404083, -0.6492187, 1, 1, 1, 1, 1,
-0.1945635, 1.126941, -1.210831, 1, 1, 1, 1, 1,
-0.1938109, -0.5740184, -3.346039, 1, 1, 1, 1, 1,
-0.1918996, 0.7751234, 0.08344613, 1, 1, 1, 1, 1,
-0.1911608, -0.1356511, -2.700197, 1, 1, 1, 1, 1,
-0.1896382, 0.08590227, -0.4679477, 1, 1, 1, 1, 1,
-0.1840782, -0.4869945, -2.372945, 1, 1, 1, 1, 1,
-0.1824024, -1.571322, -3.743029, 1, 1, 1, 1, 1,
-0.1811505, 0.06309348, -1.544311, 1, 1, 1, 1, 1,
-0.1789425, -0.3614396, -1.92886, 1, 1, 1, 1, 1,
-0.1774991, 0.3265647, 1.183979, 1, 1, 1, 1, 1,
-0.1750514, -0.2589376, -3.034665, 1, 1, 1, 1, 1,
-0.1667017, 0.8744148, 0.5149282, 1, 1, 1, 1, 1,
-0.1664765, 0.05563697, -1.31607, 1, 1, 1, 1, 1,
-0.1649285, -2.040889, -4.471735, 1, 1, 1, 1, 1,
-0.1603589, -0.8265677, -2.712476, 0, 0, 1, 1, 1,
-0.1579539, -0.09992979, -0.2164653, 1, 0, 0, 1, 1,
-0.1560113, -0.5007595, -2.644896, 1, 0, 0, 1, 1,
-0.1560024, -0.6325332, -1.248097, 1, 0, 0, 1, 1,
-0.154223, -0.1068454, -1.942961, 1, 0, 0, 1, 1,
-0.1483849, 0.8893285, -1.788357, 1, 0, 0, 1, 1,
-0.1430418, 0.4258305, 0.9421595, 0, 0, 0, 1, 1,
-0.142104, 0.8272817, -1.100174, 0, 0, 0, 1, 1,
-0.1398169, 0.5345971, 0.1408274, 0, 0, 0, 1, 1,
-0.1385262, 0.5046494, -0.5522627, 0, 0, 0, 1, 1,
-0.1363313, 0.6987476, -1.014388, 0, 0, 0, 1, 1,
-0.1343462, -0.8666093, -2.979939, 0, 0, 0, 1, 1,
-0.1206163, -0.9824727, -3.015344, 0, 0, 0, 1, 1,
-0.1181043, -0.1862909, -2.88882, 1, 1, 1, 1, 1,
-0.1104422, 0.4460928, 2.141538, 1, 1, 1, 1, 1,
-0.1096927, -1.251631, -3.738307, 1, 1, 1, 1, 1,
-0.108268, -1.013512, -1.877477, 1, 1, 1, 1, 1,
-0.1025465, -0.3551675, -1.018443, 1, 1, 1, 1, 1,
-0.1017856, -1.436549, -3.09043, 1, 1, 1, 1, 1,
-0.09709212, -0.2519401, -2.466091, 1, 1, 1, 1, 1,
-0.0945809, 1.256099, 0.5080669, 1, 1, 1, 1, 1,
-0.09223046, -0.632655, -2.878299, 1, 1, 1, 1, 1,
-0.09033182, 1.525728, -0.269507, 1, 1, 1, 1, 1,
-0.08985228, -0.8962312, -1.869678, 1, 1, 1, 1, 1,
-0.0877546, 2.12376, -0.9835122, 1, 1, 1, 1, 1,
-0.08155683, -0.8191674, -2.918946, 1, 1, 1, 1, 1,
-0.08043768, -1.323723, -2.643182, 1, 1, 1, 1, 1,
-0.07805027, -1.496682, -2.877322, 1, 1, 1, 1, 1,
-0.07730925, 1.384805, -0.4120685, 0, 0, 1, 1, 1,
-0.07335727, -1.009491, -2.554439, 1, 0, 0, 1, 1,
-0.07278701, -0.02222225, -2.232193, 1, 0, 0, 1, 1,
-0.0623027, 1.148901, -1.381265, 1, 0, 0, 1, 1,
-0.06172951, -0.2799074, -2.420936, 1, 0, 0, 1, 1,
-0.06156654, -1.276942, -3.249762, 1, 0, 0, 1, 1,
-0.06056626, -0.1886587, -2.659331, 0, 0, 0, 1, 1,
-0.05987287, 0.8484979, -1.266348, 0, 0, 0, 1, 1,
-0.05908661, 1.848694, -1.780213, 0, 0, 0, 1, 1,
-0.05683209, 1.029255, 2.254502, 0, 0, 0, 1, 1,
-0.05439674, 1.419291, -1.260377, 0, 0, 0, 1, 1,
-0.05141627, -0.723994, -4.070407, 0, 0, 0, 1, 1,
-0.04438505, -1.204492, -2.827718, 0, 0, 0, 1, 1,
-0.03543149, 0.5546922, -1.485163, 1, 1, 1, 1, 1,
-0.03441109, -0.8145235, -3.274143, 1, 1, 1, 1, 1,
-0.0299261, 0.2576184, -0.7068433, 1, 1, 1, 1, 1,
-0.02893302, -0.2789803, -3.917965, 1, 1, 1, 1, 1,
-0.02365252, -0.2194245, -1.233688, 1, 1, 1, 1, 1,
-0.02119376, 1.660069, 1.667634, 1, 1, 1, 1, 1,
-0.01953705, 0.1773583, -0.8017267, 1, 1, 1, 1, 1,
-0.01327301, 1.356817, 1.592688, 1, 1, 1, 1, 1,
-0.007994102, -0.3220137, -3.666427, 1, 1, 1, 1, 1,
-0.006007609, 0.9137108, 3.012078, 1, 1, 1, 1, 1,
-0.004758966, -1.40231, -4.130951, 1, 1, 1, 1, 1,
-0.002352438, 0.2162881, 1.779327, 1, 1, 1, 1, 1,
0.0007497079, -0.530548, 1.102966, 1, 1, 1, 1, 1,
0.001253842, 0.4663919, 1.575655, 1, 1, 1, 1, 1,
0.0023115, -0.1015241, 2.007466, 1, 1, 1, 1, 1,
0.002476702, -0.07151034, 3.836685, 0, 0, 1, 1, 1,
0.003946663, -0.2597771, 4.451088, 1, 0, 0, 1, 1,
0.005937915, -0.4007742, 3.30301, 1, 0, 0, 1, 1,
0.006637442, -2.733222, 4.825469, 1, 0, 0, 1, 1,
0.01574909, -0.125836, 3.629702, 1, 0, 0, 1, 1,
0.02054687, 1.838979, -1.219462, 1, 0, 0, 1, 1,
0.02229244, 0.2514031, 1.142722, 0, 0, 0, 1, 1,
0.02675496, 0.5852829, 0.178728, 0, 0, 0, 1, 1,
0.03161991, -0.8831432, 2.820666, 0, 0, 0, 1, 1,
0.0326068, 0.7859456, -0.7606804, 0, 0, 0, 1, 1,
0.03584841, 0.4828499, 0.01715931, 0, 0, 0, 1, 1,
0.04572276, 0.315294, -2.2911, 0, 0, 0, 1, 1,
0.04675753, -0.1431167, 2.446784, 0, 0, 0, 1, 1,
0.04823256, 0.5195853, 0.3550728, 1, 1, 1, 1, 1,
0.05174656, 1.186506, -0.3050214, 1, 1, 1, 1, 1,
0.05826411, -1.244781, 3.844671, 1, 1, 1, 1, 1,
0.06548601, 0.2288222, 1.923154, 1, 1, 1, 1, 1,
0.0689201, -0.01358916, 2.975962, 1, 1, 1, 1, 1,
0.07062934, -0.5386239, 2.346683, 1, 1, 1, 1, 1,
0.07255091, 1.244432, 1.467643, 1, 1, 1, 1, 1,
0.07624831, -1.044052, 1.816872, 1, 1, 1, 1, 1,
0.08295424, -0.5660433, 2.152847, 1, 1, 1, 1, 1,
0.08596625, -0.7373714, 3.390801, 1, 1, 1, 1, 1,
0.08673708, -1.272924, -0.0580442, 1, 1, 1, 1, 1,
0.0899849, 1.124637, -0.5714866, 1, 1, 1, 1, 1,
0.09056397, -0.6065701, 3.620813, 1, 1, 1, 1, 1,
0.09785049, 0.3650656, 0.206532, 1, 1, 1, 1, 1,
0.1044914, -0.3647126, 2.90014, 1, 1, 1, 1, 1,
0.1054808, -0.7398751, 2.762358, 0, 0, 1, 1, 1,
0.1076436, 1.269065, -1.442802, 1, 0, 0, 1, 1,
0.1079616, 0.2671888, 0.8404223, 1, 0, 0, 1, 1,
0.1082113, 0.133511, 0.6444302, 1, 0, 0, 1, 1,
0.1088719, -0.05743824, 3.645433, 1, 0, 0, 1, 1,
0.1102893, -1.411121, 2.207337, 1, 0, 0, 1, 1,
0.127796, 1.375589, 0.6945945, 0, 0, 0, 1, 1,
0.133817, 0.750091, 1.178302, 0, 0, 0, 1, 1,
0.135443, 0.9298421, -0.3775431, 0, 0, 0, 1, 1,
0.1373021, 1.070751, -0.5137121, 0, 0, 0, 1, 1,
0.1381166, -1.504201, 2.738706, 0, 0, 0, 1, 1,
0.1387056, -1.032593, 2.801748, 0, 0, 0, 1, 1,
0.1392685, 0.5301223, 3.109191, 0, 0, 0, 1, 1,
0.1401248, 0.3382924, 0.1650511, 1, 1, 1, 1, 1,
0.1416242, -0.7882352, 2.68673, 1, 1, 1, 1, 1,
0.1494519, 0.618432, 0.2150524, 1, 1, 1, 1, 1,
0.1509626, 0.5109023, -0.6669965, 1, 1, 1, 1, 1,
0.1570526, -0.7252188, 2.270621, 1, 1, 1, 1, 1,
0.1575119, -0.774496, 1.353949, 1, 1, 1, 1, 1,
0.1577722, 0.5258058, -1.453573, 1, 1, 1, 1, 1,
0.1629674, 0.6551669, 0.2419202, 1, 1, 1, 1, 1,
0.1663774, 1.411403, -0.504077, 1, 1, 1, 1, 1,
0.1701858, -0.8478996, 4.577569, 1, 1, 1, 1, 1,
0.1763175, -0.5288965, 2.886845, 1, 1, 1, 1, 1,
0.1790104, 0.5873752, 1.001257, 1, 1, 1, 1, 1,
0.1791689, 0.5677211, -0.1278795, 1, 1, 1, 1, 1,
0.1793044, -2.210503, 4.080095, 1, 1, 1, 1, 1,
0.1805924, 0.4081001, 0.4522078, 1, 1, 1, 1, 1,
0.1808887, 0.6524909, 0.2323025, 0, 0, 1, 1, 1,
0.1810842, 0.03511708, -0.8582447, 1, 0, 0, 1, 1,
0.1865827, 1.598644, -0.9311787, 1, 0, 0, 1, 1,
0.1949444, -0.4452026, 1.289021, 1, 0, 0, 1, 1,
0.1980293, -0.7173766, 3.600988, 1, 0, 0, 1, 1,
0.1996656, 0.5780222, -0.04241126, 1, 0, 0, 1, 1,
0.2012088, 1.837083, 0.7547913, 0, 0, 0, 1, 1,
0.2026342, -1.102545, 1.401994, 0, 0, 0, 1, 1,
0.2043525, -1.543594, 3.405325, 0, 0, 0, 1, 1,
0.2164344, 0.07929978, 1.343105, 0, 0, 0, 1, 1,
0.218213, 1.599979, 0.246591, 0, 0, 0, 1, 1,
0.2212078, -1.609096, 3.725861, 0, 0, 0, 1, 1,
0.2256998, -0.6893062, 1.690281, 0, 0, 0, 1, 1,
0.2260129, -0.3270042, 2.094752, 1, 1, 1, 1, 1,
0.226723, 0.3588134, 1.411185, 1, 1, 1, 1, 1,
0.2332704, 0.9695253, 1.397061, 1, 1, 1, 1, 1,
0.2349182, 1.574054, 1.399949, 1, 1, 1, 1, 1,
0.2399483, -1.721599, 2.188747, 1, 1, 1, 1, 1,
0.2412583, 0.06507853, 0.3662902, 1, 1, 1, 1, 1,
0.2417296, -0.7074558, 3.541261, 1, 1, 1, 1, 1,
0.244338, 0.6921861, 1.732517, 1, 1, 1, 1, 1,
0.2479043, -0.4005827, 3.464559, 1, 1, 1, 1, 1,
0.2509672, -0.9821162, 1.707194, 1, 1, 1, 1, 1,
0.2519614, 0.9238334, 0.3822182, 1, 1, 1, 1, 1,
0.2534982, -1.409943, 2.122884, 1, 1, 1, 1, 1,
0.2564878, 1.283973, -0.3720335, 1, 1, 1, 1, 1,
0.2577696, 0.0776581, 1.679298, 1, 1, 1, 1, 1,
0.2584921, -1.19427, 3.754702, 1, 1, 1, 1, 1,
0.2596102, 0.5891174, 0.09069697, 0, 0, 1, 1, 1,
0.2625678, -1.19955, 2.644212, 1, 0, 0, 1, 1,
0.2626919, 0.519811, 0.9075011, 1, 0, 0, 1, 1,
0.2638089, 1.124371, 0.8414599, 1, 0, 0, 1, 1,
0.2642215, -1.357419, 2.479121, 1, 0, 0, 1, 1,
0.2666179, -0.7265213, 2.030819, 1, 0, 0, 1, 1,
0.2675158, -1.515742, 3.470215, 0, 0, 0, 1, 1,
0.2681942, 0.4624264, 1.134509, 0, 0, 0, 1, 1,
0.2697153, 0.5979615, 0.9868902, 0, 0, 0, 1, 1,
0.2753382, 0.4503388, 0.8660872, 0, 0, 0, 1, 1,
0.2756262, -0.7784808, 2.090748, 0, 0, 0, 1, 1,
0.2863774, 2.086319, -0.6169232, 0, 0, 0, 1, 1,
0.2864735, 0.8356335, 0.2661223, 0, 0, 0, 1, 1,
0.287334, -0.5397089, 2.564094, 1, 1, 1, 1, 1,
0.2904839, -0.5192732, 3.259453, 1, 1, 1, 1, 1,
0.2925767, -0.4888059, 4.511863, 1, 1, 1, 1, 1,
0.2949256, -0.7773322, 1.899743, 1, 1, 1, 1, 1,
0.2979701, 1.050991, 1.10765, 1, 1, 1, 1, 1,
0.3085727, 1.438788, -0.6776564, 1, 1, 1, 1, 1,
0.3091544, -0.9976147, 3.813524, 1, 1, 1, 1, 1,
0.3108043, -1.150436, 2.73041, 1, 1, 1, 1, 1,
0.3135145, -0.4518767, 1.771072, 1, 1, 1, 1, 1,
0.314138, 0.9692599, -0.42296, 1, 1, 1, 1, 1,
0.314243, -0.5392603, 1.065762, 1, 1, 1, 1, 1,
0.3184136, -1.656623, 4.17355, 1, 1, 1, 1, 1,
0.3191231, -1.102534, 3.176972, 1, 1, 1, 1, 1,
0.3220429, -1.174495, 2.966784, 1, 1, 1, 1, 1,
0.3224145, -1.135509, 2.06878, 1, 1, 1, 1, 1,
0.3233737, -0.9917473, 1.739424, 0, 0, 1, 1, 1,
0.3237925, 0.6714912, 1.068017, 1, 0, 0, 1, 1,
0.3245944, -1.284603, 2.409931, 1, 0, 0, 1, 1,
0.3296291, 0.3246174, -0.5097848, 1, 0, 0, 1, 1,
0.3319046, 0.2825846, 1.74482, 1, 0, 0, 1, 1,
0.342057, 0.4067997, 0.7239551, 1, 0, 0, 1, 1,
0.3430738, -0.7071485, 3.611961, 0, 0, 0, 1, 1,
0.3588482, -1.169087, 3.67663, 0, 0, 0, 1, 1,
0.362294, -0.1274775, 1.760467, 0, 0, 0, 1, 1,
0.3624972, 0.6781255, 2.372663, 0, 0, 0, 1, 1,
0.3632009, 0.9043012, 0.8969393, 0, 0, 0, 1, 1,
0.3660919, -0.3084025, -1.335957, 0, 0, 0, 1, 1,
0.3677101, 0.7326571, 1.185259, 0, 0, 0, 1, 1,
0.3725578, 0.7521319, -0.09446549, 1, 1, 1, 1, 1,
0.3730708, 0.1508267, 0.1943293, 1, 1, 1, 1, 1,
0.3805751, -1.14725, 1.793073, 1, 1, 1, 1, 1,
0.3875913, -0.2398036, 2.288538, 1, 1, 1, 1, 1,
0.3951594, 1.064698, -0.721461, 1, 1, 1, 1, 1,
0.3986063, 1.126634, 1.319873, 1, 1, 1, 1, 1,
0.3990001, 1.119499, 0.08998171, 1, 1, 1, 1, 1,
0.4027775, 1.469983, -0.6441153, 1, 1, 1, 1, 1,
0.402959, -0.01119868, 1.751396, 1, 1, 1, 1, 1,
0.4045746, 0.3742424, -0.256895, 1, 1, 1, 1, 1,
0.4048178, 1.179541, 1.851472, 1, 1, 1, 1, 1,
0.4050854, -1.307892, 4.339308, 1, 1, 1, 1, 1,
0.407537, 0.356506, 2.23834, 1, 1, 1, 1, 1,
0.4161523, 1.594397, 0.09372391, 1, 1, 1, 1, 1,
0.4248153, 0.6700279, 0.9293239, 1, 1, 1, 1, 1,
0.4265412, -1.161526, 2.572472, 0, 0, 1, 1, 1,
0.4331555, 1.026954, 0.9180762, 1, 0, 0, 1, 1,
0.4383517, -1.236054, 3.320598, 1, 0, 0, 1, 1,
0.4419983, -0.315192, 0.6392466, 1, 0, 0, 1, 1,
0.4435365, -1.758172, 3.296697, 1, 0, 0, 1, 1,
0.4442513, -0.219561, 2.359011, 1, 0, 0, 1, 1,
0.4445761, -0.450146, 2.188142, 0, 0, 0, 1, 1,
0.4469862, -1.033342, 4.64781, 0, 0, 0, 1, 1,
0.4477238, 1.971152, 0.1401944, 0, 0, 0, 1, 1,
0.4485051, -0.05857442, 1.752706, 0, 0, 0, 1, 1,
0.4562039, -0.2425486, 1.515944, 0, 0, 0, 1, 1,
0.4616282, 0.8000735, -0.03998288, 0, 0, 0, 1, 1,
0.4627903, 0.2342666, 2.790137, 0, 0, 0, 1, 1,
0.4630322, 0.7768781, 1.543658, 1, 1, 1, 1, 1,
0.471227, 0.7011954, 0.9507968, 1, 1, 1, 1, 1,
0.4738998, -0.2226605, 2.613384, 1, 1, 1, 1, 1,
0.4771747, -0.7651384, 2.279007, 1, 1, 1, 1, 1,
0.4790953, 0.2836053, -0.6821, 1, 1, 1, 1, 1,
0.4794959, -0.01063427, 1.057979, 1, 1, 1, 1, 1,
0.4857695, -0.2987815, 3.484405, 1, 1, 1, 1, 1,
0.4882005, -0.7955371, 2.638205, 1, 1, 1, 1, 1,
0.489328, 1.465802, 0.6005498, 1, 1, 1, 1, 1,
0.4908988, -0.5356676, 3.412538, 1, 1, 1, 1, 1,
0.4925442, -0.4502654, 0.4093563, 1, 1, 1, 1, 1,
0.4946415, 1.393424, -1.303918, 1, 1, 1, 1, 1,
0.4964586, -1.293083, 5.017812, 1, 1, 1, 1, 1,
0.5009017, 0.87187, 1.347632, 1, 1, 1, 1, 1,
0.5009951, -1.910489, 2.517836, 1, 1, 1, 1, 1,
0.5016955, -0.9125563, 3.948325, 0, 0, 1, 1, 1,
0.5149682, 0.2897149, 0.7200258, 1, 0, 0, 1, 1,
0.5162687, -0.1731866, 2.253116, 1, 0, 0, 1, 1,
0.5184662, -0.2898882, 2.602628, 1, 0, 0, 1, 1,
0.5209866, -1.067637, 3.950895, 1, 0, 0, 1, 1,
0.5210236, -0.8675399, 2.837098, 1, 0, 0, 1, 1,
0.5213139, -1.128076, 3.842966, 0, 0, 0, 1, 1,
0.52473, -1.732451, 4.59147, 0, 0, 0, 1, 1,
0.5269629, 1.769231, 1.527509, 0, 0, 0, 1, 1,
0.5299359, 0.1098024, 0.9568885, 0, 0, 0, 1, 1,
0.5302215, 0.1258788, 1.683359, 0, 0, 0, 1, 1,
0.5303872, 2.137393, -0.2999022, 0, 0, 0, 1, 1,
0.5314506, 1.124127, 1.671521, 0, 0, 0, 1, 1,
0.5315925, -0.4915657, 2.002246, 1, 1, 1, 1, 1,
0.5376067, 0.4808298, 0.6369033, 1, 1, 1, 1, 1,
0.540045, 0.5284141, 0.9450011, 1, 1, 1, 1, 1,
0.5418881, 0.1787747, 0.8213599, 1, 1, 1, 1, 1,
0.5451357, 0.2443457, 2.117584, 1, 1, 1, 1, 1,
0.5469323, -1.152624, 2.805822, 1, 1, 1, 1, 1,
0.5479754, 0.8682817, 1.394317, 1, 1, 1, 1, 1,
0.5517987, 0.5479053, -0.02583324, 1, 1, 1, 1, 1,
0.5529823, -0.1694037, 2.229115, 1, 1, 1, 1, 1,
0.5543033, -1.141351, 2.02365, 1, 1, 1, 1, 1,
0.5554503, -2.168149, 3.129002, 1, 1, 1, 1, 1,
0.556053, -0.05846431, 2.36248, 1, 1, 1, 1, 1,
0.5697949, 0.7182327, 0.185806, 1, 1, 1, 1, 1,
0.5715977, 1.603911, -0.1022223, 1, 1, 1, 1, 1,
0.5807617, 0.002623238, 1.883359, 1, 1, 1, 1, 1,
0.5809357, 1.513677, -1.387988, 0, 0, 1, 1, 1,
0.585937, 0.04665426, 1.727237, 1, 0, 0, 1, 1,
0.5862116, -0.7019348, 1.049837, 1, 0, 0, 1, 1,
0.5897116, 1.945953, -0.3550537, 1, 0, 0, 1, 1,
0.5947901, -0.08709051, 0.2078437, 1, 0, 0, 1, 1,
0.6039145, 1.69643, 0.740742, 1, 0, 0, 1, 1,
0.6057264, 0.2346525, 1.411909, 0, 0, 0, 1, 1,
0.6057975, 0.1505716, 1.358582, 0, 0, 0, 1, 1,
0.6074153, -0.8490978, 1.497766, 0, 0, 0, 1, 1,
0.6077384, -1.589812, 3.099624, 0, 0, 0, 1, 1,
0.6084221, 0.382365, 3.751977, 0, 0, 0, 1, 1,
0.610935, 0.002729264, 1.756972, 0, 0, 0, 1, 1,
0.6146224, 0.3015822, 1.654719, 0, 0, 0, 1, 1,
0.6253901, 1.167161, 0.08973976, 1, 1, 1, 1, 1,
0.6257496, 0.412239, 1.77465, 1, 1, 1, 1, 1,
0.6267291, 0.7309327, 1.217808, 1, 1, 1, 1, 1,
0.6286694, -1.391498, 2.707812, 1, 1, 1, 1, 1,
0.6308704, -0.6904387, 2.170268, 1, 1, 1, 1, 1,
0.635575, -1.28423, 3.561466, 1, 1, 1, 1, 1,
0.6363852, 0.6872435, 2.149108, 1, 1, 1, 1, 1,
0.6376928, -1.43572, 5.563056, 1, 1, 1, 1, 1,
0.6377668, 0.1337786, -0.168039, 1, 1, 1, 1, 1,
0.6482027, 2.545684, 0.5964419, 1, 1, 1, 1, 1,
0.6504179, 0.316622, 0.9916373, 1, 1, 1, 1, 1,
0.6508814, -2.105117, 2.888639, 1, 1, 1, 1, 1,
0.6589876, -1.874095, 3.468307, 1, 1, 1, 1, 1,
0.666516, -1.111888, 2.370444, 1, 1, 1, 1, 1,
0.6685637, -0.3823696, 1.895764, 1, 1, 1, 1, 1,
0.6707588, -1.081078, 0.8959566, 0, 0, 1, 1, 1,
0.6752353, -1.153134, 1.960261, 1, 0, 0, 1, 1,
0.6772838, -0.4837119, 3.204418, 1, 0, 0, 1, 1,
0.679627, 0.4132495, 0.2765735, 1, 0, 0, 1, 1,
0.6800653, 0.4977288, 1.301307, 1, 0, 0, 1, 1,
0.6826292, -0.1118866, 0.2262965, 1, 0, 0, 1, 1,
0.6831298, 0.378794, 0.7657025, 0, 0, 0, 1, 1,
0.6939489, -1.145544, 3.838995, 0, 0, 0, 1, 1,
0.7070042, -0.4255334, -0.1714684, 0, 0, 0, 1, 1,
0.708453, 0.3216686, 3.200881, 0, 0, 0, 1, 1,
0.7094235, -1.475701, 1.895432, 0, 0, 0, 1, 1,
0.7104524, 0.9708099, 0.9798259, 0, 0, 0, 1, 1,
0.7122552, -0.789567, 3.045283, 0, 0, 0, 1, 1,
0.7197005, -0.02549572, -1.065738, 1, 1, 1, 1, 1,
0.7208278, -0.693162, 2.093841, 1, 1, 1, 1, 1,
0.7238916, 0.2707534, 0.4693155, 1, 1, 1, 1, 1,
0.7250132, -0.2902268, 1.63788, 1, 1, 1, 1, 1,
0.7274888, -1.448874, 3.715952, 1, 1, 1, 1, 1,
0.7291459, -1.624471, 2.43731, 1, 1, 1, 1, 1,
0.7359952, 1.562104, 0.2296752, 1, 1, 1, 1, 1,
0.7385712, 1.057587, 0.1800507, 1, 1, 1, 1, 1,
0.7407461, 0.5922769, 1.203657, 1, 1, 1, 1, 1,
0.7410226, 1.019942, 0.08904427, 1, 1, 1, 1, 1,
0.7416532, 0.6453179, 1.390794, 1, 1, 1, 1, 1,
0.7471638, 0.09411737, 1.974021, 1, 1, 1, 1, 1,
0.7482179, 0.09044369, 0.8440259, 1, 1, 1, 1, 1,
0.755574, 0.5871086, 1.333724, 1, 1, 1, 1, 1,
0.7604867, 0.7320511, -0.5488763, 1, 1, 1, 1, 1,
0.7675627, -0.4706116, 2.943445, 0, 0, 1, 1, 1,
0.7789267, -1.005282, 1.452768, 1, 0, 0, 1, 1,
0.7813305, 0.4259016, 0.812712, 1, 0, 0, 1, 1,
0.7827197, -0.7238145, 1.243136, 1, 0, 0, 1, 1,
0.7833742, -0.9820918, 2.452269, 1, 0, 0, 1, 1,
0.7835129, 0.8213068, 0.5709465, 1, 0, 0, 1, 1,
0.7873718, 1.460125, 0.7243304, 0, 0, 0, 1, 1,
0.792045, -0.8580005, 2.408544, 0, 0, 0, 1, 1,
0.793658, 0.3105623, 0.7715862, 0, 0, 0, 1, 1,
0.7936891, -1.398216, 2.364602, 0, 0, 0, 1, 1,
0.7966686, 0.8027306, 0.8728489, 0, 0, 0, 1, 1,
0.7970724, 0.2843975, 0.7541483, 0, 0, 0, 1, 1,
0.7979949, -0.8649014, 1.341605, 0, 0, 0, 1, 1,
0.7981933, -1.742175, 3.057834, 1, 1, 1, 1, 1,
0.8022389, -0.7503157, 1.373535, 1, 1, 1, 1, 1,
0.8032581, 1.487856, 0.8075697, 1, 1, 1, 1, 1,
0.8132957, -0.7201594, 2.834625, 1, 1, 1, 1, 1,
0.8229854, -0.6043524, 2.950298, 1, 1, 1, 1, 1,
0.8231967, 2.180341, 0.5741456, 1, 1, 1, 1, 1,
0.8279511, -0.5612653, 2.933453, 1, 1, 1, 1, 1,
0.8379704, 1.033586, 0.696357, 1, 1, 1, 1, 1,
0.8382548, 1.35108, -0.1388204, 1, 1, 1, 1, 1,
0.8443955, 0.1285281, -0.05129613, 1, 1, 1, 1, 1,
0.8487583, -1.331905, 0.008876801, 1, 1, 1, 1, 1,
0.8549108, 1.125279, 1.083509, 1, 1, 1, 1, 1,
0.856204, 0.1446611, -0.008657495, 1, 1, 1, 1, 1,
0.8606113, 0.1012579, 3.325848, 1, 1, 1, 1, 1,
0.8659249, 0.3119823, 0.219091, 1, 1, 1, 1, 1,
0.8659962, -0.01551307, 1.658563, 0, 0, 1, 1, 1,
0.8702927, 0.6036977, 1.575871, 1, 0, 0, 1, 1,
0.8739079, -0.5699292, 3.153361, 1, 0, 0, 1, 1,
0.8747606, 0.9980956, -0.06372327, 1, 0, 0, 1, 1,
0.8754535, 0.1147259, 1.518746, 1, 0, 0, 1, 1,
0.8819363, -0.009964093, 1.524597, 1, 0, 0, 1, 1,
0.8835692, -0.3223614, 1.917252, 0, 0, 0, 1, 1,
0.8991375, 0.6889073, 0.2687746, 0, 0, 0, 1, 1,
0.9078231, -0.6052909, 1.630468, 0, 0, 0, 1, 1,
0.9085923, 1.158754, -1.004923, 0, 0, 0, 1, 1,
0.9150051, -0.008698645, 1.371264, 0, 0, 0, 1, 1,
0.9245043, -0.849266, 2.82279, 0, 0, 0, 1, 1,
0.9352432, -0.7298852, 3.007425, 0, 0, 0, 1, 1,
0.9359297, 0.6288388, 1.691969, 1, 1, 1, 1, 1,
0.9419923, 0.2236889, 1.394802, 1, 1, 1, 1, 1,
0.9430227, -1.42283, 2.582933, 1, 1, 1, 1, 1,
0.9437442, 0.9599472, 2.761911, 1, 1, 1, 1, 1,
0.9440325, -0.3201179, 4.257922, 1, 1, 1, 1, 1,
0.9459584, -0.7349213, 3.50479, 1, 1, 1, 1, 1,
0.9466243, 0.5812721, -0.02857882, 1, 1, 1, 1, 1,
0.9574023, -0.9869573, 3.009059, 1, 1, 1, 1, 1,
0.9621617, -1.440919, 3.395772, 1, 1, 1, 1, 1,
0.9637742, -1.026268, 1.95683, 1, 1, 1, 1, 1,
0.9638161, 0.1595686, 0.7745619, 1, 1, 1, 1, 1,
0.9642128, -1.85203, 3.160953, 1, 1, 1, 1, 1,
0.9698671, -0.7517441, 2.983029, 1, 1, 1, 1, 1,
0.970971, 0.001501341, 1.041996, 1, 1, 1, 1, 1,
0.9773459, -0.4806149, 2.179956, 1, 1, 1, 1, 1,
0.9869717, -0.4920016, 1.866744, 0, 0, 1, 1, 1,
0.9948862, 0.8894837, 0.4794587, 1, 0, 0, 1, 1,
0.9950696, -2.54082, 4.340439, 1, 0, 0, 1, 1,
0.9954395, 1.55825, 0.4683314, 1, 0, 0, 1, 1,
0.9985971, -0.8594196, 1.831433, 1, 0, 0, 1, 1,
1.000952, 0.8225991, -0.3798422, 1, 0, 0, 1, 1,
1.01526, 0.0188913, 0.7853981, 0, 0, 0, 1, 1,
1.019979, 2.214386, 0.2455378, 0, 0, 0, 1, 1,
1.026273, -0.6472791, 0.6969348, 0, 0, 0, 1, 1,
1.026441, 0.2203088, 1.20024, 0, 0, 0, 1, 1,
1.028981, -0.3845612, 2.25877, 0, 0, 0, 1, 1,
1.029258, -0.6837311, 1.90002, 0, 0, 0, 1, 1,
1.032046, 0.1107437, 2.974393, 0, 0, 0, 1, 1,
1.034089, -1.02177, 3.824104, 1, 1, 1, 1, 1,
1.034564, 0.3501535, 1.967839, 1, 1, 1, 1, 1,
1.038001, 0.8435163, 2.023312, 1, 1, 1, 1, 1,
1.03826, 0.7289803, -0.04955726, 1, 1, 1, 1, 1,
1.05248, -0.7153947, 1.739473, 1, 1, 1, 1, 1,
1.05407, 0.8683609, 1.374748, 1, 1, 1, 1, 1,
1.056227, 0.8032253, -0.0005748789, 1, 1, 1, 1, 1,
1.057379, 0.1136532, 2.217159, 1, 1, 1, 1, 1,
1.062261, 0.482207, 0.7540091, 1, 1, 1, 1, 1,
1.069361, -0.8331357, 3.229439, 1, 1, 1, 1, 1,
1.069915, -0.5606635, 1.92224, 1, 1, 1, 1, 1,
1.070998, -0.2278363, 0.909143, 1, 1, 1, 1, 1,
1.071193, 0.09773366, 0.19458, 1, 1, 1, 1, 1,
1.072143, 0.63855, 1.864437, 1, 1, 1, 1, 1,
1.083102, 0.4553964, -0.5430348, 1, 1, 1, 1, 1,
1.083213, -0.6249823, 2.534984, 0, 0, 1, 1, 1,
1.08721, 0.03592005, 1.576695, 1, 0, 0, 1, 1,
1.090492, 0.7625598, 0.5819923, 1, 0, 0, 1, 1,
1.091841, 1.827291, 0.66572, 1, 0, 0, 1, 1,
1.092326, -0.2552312, 0.9601076, 1, 0, 0, 1, 1,
1.092569, -0.5610929, 0.6460033, 1, 0, 0, 1, 1,
1.092678, 1.338664, -0.4840188, 0, 0, 0, 1, 1,
1.094085, 1.770254, 1.978243, 0, 0, 0, 1, 1,
1.095443, 0.7372735, 1.421156, 0, 0, 0, 1, 1,
1.095548, 0.2919771, 1.355301, 0, 0, 0, 1, 1,
1.099159, -0.0262391, 0.7075651, 0, 0, 0, 1, 1,
1.101825, -0.2006767, 2.930863, 0, 0, 0, 1, 1,
1.10311, -1.015153, 2.567824, 0, 0, 0, 1, 1,
1.118833, -0.1879727, 2.537127, 1, 1, 1, 1, 1,
1.121134, -1.983081, 2.892322, 1, 1, 1, 1, 1,
1.121444, 0.6776253, 1.527725, 1, 1, 1, 1, 1,
1.12474, -0.9764779, 1.191839, 1, 1, 1, 1, 1,
1.12661, 0.9789641, 2.578589, 1, 1, 1, 1, 1,
1.14607, 0.3911988, 0.3799883, 1, 1, 1, 1, 1,
1.154079, -1.827752, 3.370157, 1, 1, 1, 1, 1,
1.155647, 0.1017138, 0.9262757, 1, 1, 1, 1, 1,
1.163088, -0.3649937, 2.624578, 1, 1, 1, 1, 1,
1.165665, 1.043159, 0.2782072, 1, 1, 1, 1, 1,
1.169178, -0.01957449, 1.89397, 1, 1, 1, 1, 1,
1.169867, 0.5743049, 1.206899, 1, 1, 1, 1, 1,
1.170321, 0.6671259, 2.269914, 1, 1, 1, 1, 1,
1.170573, -0.2523072, 2.146369, 1, 1, 1, 1, 1,
1.172465, -0.7599738, 2.741482, 1, 1, 1, 1, 1,
1.181794, 0.7240887, 0.35186, 0, 0, 1, 1, 1,
1.182379, -1.152395, 1.823159, 1, 0, 0, 1, 1,
1.183842, -1.860078, 2.412919, 1, 0, 0, 1, 1,
1.187002, -0.336318, 2.109047, 1, 0, 0, 1, 1,
1.188752, 0.1787362, 2.358971, 1, 0, 0, 1, 1,
1.19378, 0.1460139, 2.922318, 1, 0, 0, 1, 1,
1.194863, 1.245356, 1.843431, 0, 0, 0, 1, 1,
1.19528, 0.5399099, 1.933556, 0, 0, 0, 1, 1,
1.195949, -1.023656, 2.915113, 0, 0, 0, 1, 1,
1.19755, -0.5549617, 3.515988, 0, 0, 0, 1, 1,
1.198785, -0.2905187, 2.058893, 0, 0, 0, 1, 1,
1.200624, 0.2118376, 0.8695664, 0, 0, 0, 1, 1,
1.201845, 1.338086, 1.789293, 0, 0, 0, 1, 1,
1.206058, -0.4469347, 1.199564, 1, 1, 1, 1, 1,
1.208647, 0.4380004, 1.704773, 1, 1, 1, 1, 1,
1.212032, -0.3249384, 1.748445, 1, 1, 1, 1, 1,
1.21222, 0.2866762, -0.2607192, 1, 1, 1, 1, 1,
1.212365, -1.087819, 2.192679, 1, 1, 1, 1, 1,
1.213195, -0.9977536, 1.83699, 1, 1, 1, 1, 1,
1.218882, 1.833545, 0.1916591, 1, 1, 1, 1, 1,
1.243854, 1.773939, 1.037594, 1, 1, 1, 1, 1,
1.249275, 0.7128181, 1.527049, 1, 1, 1, 1, 1,
1.251232, -2.127577, 4.477338, 1, 1, 1, 1, 1,
1.265029, -0.6200024, 0.9960952, 1, 1, 1, 1, 1,
1.28031, 0.4850073, 1.013985, 1, 1, 1, 1, 1,
1.280659, -1.260846, 1.856495, 1, 1, 1, 1, 1,
1.280804, 0.03464806, 0.108281, 1, 1, 1, 1, 1,
1.282447, 1.273419, 0.6323199, 1, 1, 1, 1, 1,
1.290102, 0.9644225, 0.3803607, 0, 0, 1, 1, 1,
1.294494, -0.3512333, 0.1021273, 1, 0, 0, 1, 1,
1.294987, -0.5426981, 2.04989, 1, 0, 0, 1, 1,
1.304388, 0.8393106, 1.105842, 1, 0, 0, 1, 1,
1.304903, -0.4433973, 3.836744, 1, 0, 0, 1, 1,
1.30805, -0.4913913, 0.9300018, 1, 0, 0, 1, 1,
1.322597, 0.1863812, 2.261923, 0, 0, 0, 1, 1,
1.360028, -0.2139841, 1.815182, 0, 0, 0, 1, 1,
1.373285, -1.460153, 3.392746, 0, 0, 0, 1, 1,
1.375543, -1.006323, 2.01656, 0, 0, 0, 1, 1,
1.380984, -0.4704808, 0.8977838, 0, 0, 0, 1, 1,
1.395082, -1.179212, 2.4357, 0, 0, 0, 1, 1,
1.408044, 0.9492841, 1.904497, 0, 0, 0, 1, 1,
1.409516, -1.556302, 2.671629, 1, 1, 1, 1, 1,
1.42241, -0.8203124, 2.518315, 1, 1, 1, 1, 1,
1.427021, 2.067877, 0.3165835, 1, 1, 1, 1, 1,
1.431231, -0.07128695, 1.948154, 1, 1, 1, 1, 1,
1.436556, -0.4068093, 0.7288957, 1, 1, 1, 1, 1,
1.443374, -0.6679478, 2.24928, 1, 1, 1, 1, 1,
1.457332, 0.3038336, 0.2788431, 1, 1, 1, 1, 1,
1.461583, -0.7555603, 0.550541, 1, 1, 1, 1, 1,
1.466642, -0.08101876, 0.5539975, 1, 1, 1, 1, 1,
1.489644, -1.319953, 0.7414181, 1, 1, 1, 1, 1,
1.493348, 0.3494765, 1.353099, 1, 1, 1, 1, 1,
1.498004, 0.8262109, 4.436305, 1, 1, 1, 1, 1,
1.498685, 0.522489, 0.6854813, 1, 1, 1, 1, 1,
1.498822, 1.05742, 0.9928486, 1, 1, 1, 1, 1,
1.49989, -0.3768591, 2.146266, 1, 1, 1, 1, 1,
1.504906, -0.05656396, 0.8949315, 0, 0, 1, 1, 1,
1.507576, -1.358486, 1.682407, 1, 0, 0, 1, 1,
1.508959, -0.09105278, 2.934182, 1, 0, 0, 1, 1,
1.527789, -2.480091, 3.68652, 1, 0, 0, 1, 1,
1.535862, 2.523555, 0.1668709, 1, 0, 0, 1, 1,
1.540463, 0.3555458, -0.2658411, 1, 0, 0, 1, 1,
1.546935, 0.7929761, 1.348762, 0, 0, 0, 1, 1,
1.547856, -0.4204805, 2.989629, 0, 0, 0, 1, 1,
1.55496, -1.30288, 1.998121, 0, 0, 0, 1, 1,
1.558258, -0.4088875, -0.5456003, 0, 0, 0, 1, 1,
1.597968, -0.4597149, 1.564309, 0, 0, 0, 1, 1,
1.598578, 2.023058, 0.7784576, 0, 0, 0, 1, 1,
1.605324, -0.6688453, 2.561609, 0, 0, 0, 1, 1,
1.620795, 1.055508, 1.134782, 1, 1, 1, 1, 1,
1.63685, -0.3765133, 1.618544, 1, 1, 1, 1, 1,
1.674555, 0.3367806, 2.331197, 1, 1, 1, 1, 1,
1.716358, 0.4566939, -0.1311672, 1, 1, 1, 1, 1,
1.722817, 1.102538, 1.376737, 1, 1, 1, 1, 1,
1.736578, 2.06215, 2.253257, 1, 1, 1, 1, 1,
1.754055, 0.898465, 0.2482088, 1, 1, 1, 1, 1,
1.789846, 0.1381937, 2.421074, 1, 1, 1, 1, 1,
1.821145, 0.2963514, 0.8291543, 1, 1, 1, 1, 1,
1.844507, -0.7222537, 2.549139, 1, 1, 1, 1, 1,
1.872871, -1.382105, 2.074453, 1, 1, 1, 1, 1,
1.876691, -1.650781, 3.632876, 1, 1, 1, 1, 1,
1.910893, -1.397574, 2.382114, 1, 1, 1, 1, 1,
1.933434, 0.9467083, 1.88814, 1, 1, 1, 1, 1,
1.938032, 1.317601, 0.9098432, 1, 1, 1, 1, 1,
1.974808, 1.146421, -0.7685345, 0, 0, 1, 1, 1,
1.984697, 0.631452, 0.04333666, 1, 0, 0, 1, 1,
1.990724, 0.01232999, 0.5164018, 1, 0, 0, 1, 1,
2.021103, -0.3413265, 1.897895, 1, 0, 0, 1, 1,
2.041571, 0.6538631, 1.708219, 1, 0, 0, 1, 1,
2.042033, -1.444117, 1.916767, 1, 0, 0, 1, 1,
2.050444, -0.9691092, 0.4899548, 0, 0, 0, 1, 1,
2.078962, -0.7876332, 0.8036598, 0, 0, 0, 1, 1,
2.110128, 0.3471177, 3.657312, 0, 0, 0, 1, 1,
2.186304, -2.145799, 0.9524468, 0, 0, 0, 1, 1,
2.232642, -0.7327528, 0.824935, 0, 0, 0, 1, 1,
2.241425, 1.885987, 0.02991498, 0, 0, 0, 1, 1,
2.275182, -0.3178286, 3.219947, 0, 0, 0, 1, 1,
2.294187, 0.292141, 0.7971631, 1, 1, 1, 1, 1,
2.417812, -0.4504786, 2.015812, 1, 1, 1, 1, 1,
2.460158, 2.154191, 1.385103, 1, 1, 1, 1, 1,
2.66852, 0.4486424, 2.003441, 1, 1, 1, 1, 1,
2.694755, 0.5837644, 0.7156075, 1, 1, 1, 1, 1,
2.816906, -0.2617362, 0.4083266, 1, 1, 1, 1, 1,
3.612079, -1.764678, 1.60809, 1, 1, 1, 1, 1
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
var radius = 9.596085;
var distance = 33.70584;
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
mvMatrix.translate( -0.0394659, 0.03151822, -0.3974233 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70584);
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
