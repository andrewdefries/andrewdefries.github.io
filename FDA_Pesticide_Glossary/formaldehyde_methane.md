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
-3.496073, -1.330774, -1.641582, 1, 0, 0, 1,
-2.925154, 1.078084, -1.277778, 1, 0.007843138, 0, 1,
-2.894745, -1.865727, -1.949595, 1, 0.01176471, 0, 1,
-2.735377, -1.346688, -2.210911, 1, 0.01960784, 0, 1,
-2.432535, -0.5045946, -0.2490846, 1, 0.02352941, 0, 1,
-2.352306, -0.3928868, -0.4839132, 1, 0.03137255, 0, 1,
-2.344836, -2.839692, -2.01441, 1, 0.03529412, 0, 1,
-2.291167, 0.4864773, -1.627761, 1, 0.04313726, 0, 1,
-2.288845, -0.1407895, 1.390271, 1, 0.04705882, 0, 1,
-2.234883, -0.3846633, -2.426492, 1, 0.05490196, 0, 1,
-2.233355, 0.9577591, -0.2651564, 1, 0.05882353, 0, 1,
-2.201473, -1.112215, -2.263329, 1, 0.06666667, 0, 1,
-2.17751, -0.6521411, -2.316045, 1, 0.07058824, 0, 1,
-2.142549, 0.4307934, -2.095432, 1, 0.07843138, 0, 1,
-2.096238, 1.018507, 0.6566869, 1, 0.08235294, 0, 1,
-2.07418, 0.1852857, -1.497377, 1, 0.09019608, 0, 1,
-2.062181, 0.9952304, -0.8539803, 1, 0.09411765, 0, 1,
-2.025114, -0.359169, -2.121021, 1, 0.1019608, 0, 1,
-2.016889, -0.1841059, -2.199982, 1, 0.1098039, 0, 1,
-2.003702, 1.666002, -1.154875, 1, 0.1137255, 0, 1,
-1.959243, 0.7511492, 0.03547101, 1, 0.1215686, 0, 1,
-1.957608, 0.3693752, -1.95001, 1, 0.1254902, 0, 1,
-1.94336, -1.114804, -3.270625, 1, 0.1333333, 0, 1,
-1.925694, -0.01803027, -1.158694, 1, 0.1372549, 0, 1,
-1.925214, -1.326733, -4.062514, 1, 0.145098, 0, 1,
-1.920879, -1.631222, -3.731528, 1, 0.1490196, 0, 1,
-1.907802, -0.08247181, -1.458695, 1, 0.1568628, 0, 1,
-1.882121, -0.480888, -2.469609, 1, 0.1607843, 0, 1,
-1.853181, -0.550328, -0.9175653, 1, 0.1686275, 0, 1,
-1.851902, 0.4162364, 0.7223563, 1, 0.172549, 0, 1,
-1.835696, -0.8057367, -0.7789373, 1, 0.1803922, 0, 1,
-1.821458, -0.3342322, -1.547988, 1, 0.1843137, 0, 1,
-1.818586, 0.5546144, -2.008595, 1, 0.1921569, 0, 1,
-1.780371, 0.2997444, -0.7039346, 1, 0.1960784, 0, 1,
-1.745055, 0.1446559, -1.988389, 1, 0.2039216, 0, 1,
-1.736957, -0.6577592, -1.909463, 1, 0.2117647, 0, 1,
-1.723979, 0.8435533, -1.585147, 1, 0.2156863, 0, 1,
-1.707022, 1.77531, -2.012147, 1, 0.2235294, 0, 1,
-1.698441, -0.006586895, -1.122703, 1, 0.227451, 0, 1,
-1.695973, -0.7358829, -3.249459, 1, 0.2352941, 0, 1,
-1.676984, 0.3260565, -1.366489, 1, 0.2392157, 0, 1,
-1.670328, 1.239374, -1.978714, 1, 0.2470588, 0, 1,
-1.658442, 1.387984, -1.601069, 1, 0.2509804, 0, 1,
-1.647861, -0.3303008, -2.348933, 1, 0.2588235, 0, 1,
-1.644006, 1.01763, -0.8567916, 1, 0.2627451, 0, 1,
-1.641701, 0.008267913, -2.436226, 1, 0.2705882, 0, 1,
-1.639216, 1.058693, 1.217988, 1, 0.2745098, 0, 1,
-1.632287, 2.311213, -1.835445, 1, 0.282353, 0, 1,
-1.631293, -1.336063, -3.884045, 1, 0.2862745, 0, 1,
-1.62406, -0.7201589, -0.8987685, 1, 0.2941177, 0, 1,
-1.623368, -2.60882, -2.359258, 1, 0.3019608, 0, 1,
-1.621327, -1.070917, -2.623701, 1, 0.3058824, 0, 1,
-1.595143, -0.1523463, -3.530631, 1, 0.3137255, 0, 1,
-1.587722, -1.186015, -2.572261, 1, 0.3176471, 0, 1,
-1.586317, 1.063576, -0.94579, 1, 0.3254902, 0, 1,
-1.558357, -1.686059, -1.625726, 1, 0.3294118, 0, 1,
-1.554859, -2.13402, -2.113198, 1, 0.3372549, 0, 1,
-1.546968, 0.7113891, -0.1633045, 1, 0.3411765, 0, 1,
-1.545974, 0.06441957, -3.036566, 1, 0.3490196, 0, 1,
-1.545919, 1.171787, 0.6754191, 1, 0.3529412, 0, 1,
-1.536847, -0.8886467, -0.5696073, 1, 0.3607843, 0, 1,
-1.524571, 1.154607, -1.174002, 1, 0.3647059, 0, 1,
-1.521403, 0.181354, -1.717333, 1, 0.372549, 0, 1,
-1.50446, 0.6708387, 0.2903272, 1, 0.3764706, 0, 1,
-1.499285, 1.19101, -1.511872, 1, 0.3843137, 0, 1,
-1.499012, -1.094417, 0.4943639, 1, 0.3882353, 0, 1,
-1.490099, -0.9357753, -2.063339, 1, 0.3960784, 0, 1,
-1.480791, 0.9689204, -1.161447, 1, 0.4039216, 0, 1,
-1.468981, 0.05344458, -0.9026282, 1, 0.4078431, 0, 1,
-1.467032, 1.292485, 1.255169, 1, 0.4156863, 0, 1,
-1.450217, -1.97622, -1.630487, 1, 0.4196078, 0, 1,
-1.447644, 0.1081809, -1.297878, 1, 0.427451, 0, 1,
-1.441484, -0.8752584, -1.601417, 1, 0.4313726, 0, 1,
-1.429913, -0.1788055, -2.412296, 1, 0.4392157, 0, 1,
-1.417644, -0.9277374, -4.098041, 1, 0.4431373, 0, 1,
-1.415546, -1.739671, -3.45824, 1, 0.4509804, 0, 1,
-1.409681, 0.1570022, -0.2702543, 1, 0.454902, 0, 1,
-1.40781, 1.447797, -1.424226, 1, 0.4627451, 0, 1,
-1.393877, 1.131808, -0.3205112, 1, 0.4666667, 0, 1,
-1.392737, -0.4647534, -1.693469, 1, 0.4745098, 0, 1,
-1.381533, -2.936811, -2.448898, 1, 0.4784314, 0, 1,
-1.376485, -1.411227, -4.453293, 1, 0.4862745, 0, 1,
-1.364583, -0.4331027, -1.237971, 1, 0.4901961, 0, 1,
-1.349195, -0.4425558, -2.014108, 1, 0.4980392, 0, 1,
-1.340859, -0.8155223, -1.273838, 1, 0.5058824, 0, 1,
-1.339609, -1.00203, -0.5332672, 1, 0.509804, 0, 1,
-1.333559, 0.1210474, -0.2557522, 1, 0.5176471, 0, 1,
-1.326414, 0.310233, -0.3996684, 1, 0.5215687, 0, 1,
-1.320375, -0.0745306, -0.8793881, 1, 0.5294118, 0, 1,
-1.311465, 0.05259142, -1.407015, 1, 0.5333334, 0, 1,
-1.310611, 0.4252864, -2.022045, 1, 0.5411765, 0, 1,
-1.29867, 0.1004405, -0.8364175, 1, 0.5450981, 0, 1,
-1.292205, 0.1321308, -0.3823606, 1, 0.5529412, 0, 1,
-1.291157, -0.3806947, -3.450019, 1, 0.5568628, 0, 1,
-1.287521, -1.020537, -2.884567, 1, 0.5647059, 0, 1,
-1.284396, 1.541532, -1.42175, 1, 0.5686275, 0, 1,
-1.283929, -1.135504, -2.778858, 1, 0.5764706, 0, 1,
-1.27955, 0.400487, -0.418085, 1, 0.5803922, 0, 1,
-1.274587, 0.4004787, -0.9868743, 1, 0.5882353, 0, 1,
-1.269524, -1.483223, -4.854533, 1, 0.5921569, 0, 1,
-1.268037, -0.1249619, -1.73725, 1, 0.6, 0, 1,
-1.266879, 0.7468046, -1.470486, 1, 0.6078432, 0, 1,
-1.266424, 0.8752244, 0.1038637, 1, 0.6117647, 0, 1,
-1.257873, -2.632065, -2.311453, 1, 0.6196079, 0, 1,
-1.252881, -0.9125196, -2.817511, 1, 0.6235294, 0, 1,
-1.248031, 0.8683325, -1.338069, 1, 0.6313726, 0, 1,
-1.247587, -0.5504889, -1.898056, 1, 0.6352941, 0, 1,
-1.236165, -0.04939651, -2.50919, 1, 0.6431373, 0, 1,
-1.235265, -0.4258148, -0.8883994, 1, 0.6470588, 0, 1,
-1.228999, 0.5705879, -2.241187, 1, 0.654902, 0, 1,
-1.227885, 1.021623, -1.007811, 1, 0.6588235, 0, 1,
-1.20846, -0.3424805, -2.954264, 1, 0.6666667, 0, 1,
-1.201945, 0.1223903, -1.18618, 1, 0.6705883, 0, 1,
-1.198288, -1.32573, -3.918434, 1, 0.6784314, 0, 1,
-1.195103, 1.3845, -0.7072207, 1, 0.682353, 0, 1,
-1.177313, -0.03615775, -1.805602, 1, 0.6901961, 0, 1,
-1.161581, -2.023707, -2.864477, 1, 0.6941177, 0, 1,
-1.137766, 0.7171643, -0.9807674, 1, 0.7019608, 0, 1,
-1.133954, -1.120352, -0.8359296, 1, 0.7098039, 0, 1,
-1.132802, -0.6938832, -1.97811, 1, 0.7137255, 0, 1,
-1.12614, 1.173664, -2.279001, 1, 0.7215686, 0, 1,
-1.125829, -1.419787, -3.461686, 1, 0.7254902, 0, 1,
-1.118022, -0.2026392, -0.8534666, 1, 0.7333333, 0, 1,
-1.117935, 0.4095163, -2.015393, 1, 0.7372549, 0, 1,
-1.11461, 1.41139, -1.95861, 1, 0.7450981, 0, 1,
-1.113226, -0.3334368, -2.470914, 1, 0.7490196, 0, 1,
-1.110888, -1.184949, -2.163198, 1, 0.7568628, 0, 1,
-1.102134, -0.4375598, -1.435642, 1, 0.7607843, 0, 1,
-1.101593, 0.3835871, -0.169131, 1, 0.7686275, 0, 1,
-1.100891, 0.4111484, 0.8312481, 1, 0.772549, 0, 1,
-1.095946, -0.912791, -3.06774, 1, 0.7803922, 0, 1,
-1.085883, 0.1583216, 1.035376, 1, 0.7843137, 0, 1,
-1.084075, -1.04018, -2.871304, 1, 0.7921569, 0, 1,
-1.079479, -0.5904338, -0.9238327, 1, 0.7960784, 0, 1,
-1.075211, -1.488357, -0.6287469, 1, 0.8039216, 0, 1,
-1.074929, 1.189437, -2.075296, 1, 0.8117647, 0, 1,
-1.074385, 1.442839, 0.1416717, 1, 0.8156863, 0, 1,
-1.071151, -0.147828, -1.728719, 1, 0.8235294, 0, 1,
-1.06874, 1.360121, 0.3447702, 1, 0.827451, 0, 1,
-1.066673, -0.1433211, -0.4498463, 1, 0.8352941, 0, 1,
-1.061333, -0.7402193, -3.611678, 1, 0.8392157, 0, 1,
-1.060874, 1.683998, -0.997268, 1, 0.8470588, 0, 1,
-1.058834, -0.7068922, -1.804836, 1, 0.8509804, 0, 1,
-1.053374, -0.6396301, -2.692217, 1, 0.8588235, 0, 1,
-1.049289, 0.09280273, -0.1489542, 1, 0.8627451, 0, 1,
-1.044581, -0.2070579, -2.634925, 1, 0.8705882, 0, 1,
-1.04295, 0.4354188, -1.562658, 1, 0.8745098, 0, 1,
-1.042198, -1.2486, -2.3288, 1, 0.8823529, 0, 1,
-1.040552, -2.263766, -3.49177, 1, 0.8862745, 0, 1,
-1.021138, -0.3003329, -2.71111, 1, 0.8941177, 0, 1,
-1.019215, -0.03795639, -3.089052, 1, 0.8980392, 0, 1,
-1.018211, 1.016005, 0.4014963, 1, 0.9058824, 0, 1,
-1.016282, 0.6699817, -1.221881, 1, 0.9137255, 0, 1,
-1.01299, -0.4629493, -2.127529, 1, 0.9176471, 0, 1,
-1.005798, 0.1468507, -1.428259, 1, 0.9254902, 0, 1,
-1.00525, -0.5502008, -2.259217, 1, 0.9294118, 0, 1,
-1.002097, -0.9498406, -2.639078, 1, 0.9372549, 0, 1,
-0.9986767, 0.1548447, -0.01769344, 1, 0.9411765, 0, 1,
-0.9977462, 1.745963, -0.09497774, 1, 0.9490196, 0, 1,
-0.9972957, 2.896056, -0.3548717, 1, 0.9529412, 0, 1,
-0.9956716, -2.204475, -1.499943, 1, 0.9607843, 0, 1,
-0.9878496, -1.826748, -3.211793, 1, 0.9647059, 0, 1,
-0.9853012, -1.115155, -2.270661, 1, 0.972549, 0, 1,
-0.9781556, -0.1934847, -1.471862, 1, 0.9764706, 0, 1,
-0.9751605, 1.222537, -0.4847095, 1, 0.9843137, 0, 1,
-0.9744171, 1.451615, -2.211036, 1, 0.9882353, 0, 1,
-0.9672443, 1.376834, -2.508798, 1, 0.9960784, 0, 1,
-0.9639742, -2.145145, -1.506071, 0.9960784, 1, 0, 1,
-0.9607962, 0.08239318, -1.309212, 0.9921569, 1, 0, 1,
-0.9498647, 0.7126637, 0.8895406, 0.9843137, 1, 0, 1,
-0.9429544, -0.1370414, -3.094179, 0.9803922, 1, 0, 1,
-0.940555, 0.3731433, 1.185225, 0.972549, 1, 0, 1,
-0.9405147, 0.7328793, 0.4214033, 0.9686275, 1, 0, 1,
-0.9395562, -0.703608, -2.809364, 0.9607843, 1, 0, 1,
-0.9341731, 0.4976483, 0.06673418, 0.9568627, 1, 0, 1,
-0.9331911, 1.049807, 0.009194545, 0.9490196, 1, 0, 1,
-0.9282666, -0.1235231, -2.879306, 0.945098, 1, 0, 1,
-0.9277975, -0.146366, -1.663238, 0.9372549, 1, 0, 1,
-0.923562, -0.4533945, -0.008686596, 0.9333333, 1, 0, 1,
-0.9230076, 0.876848, -0.09788738, 0.9254902, 1, 0, 1,
-0.9229844, -0.6351032, -1.665841, 0.9215686, 1, 0, 1,
-0.917209, -2.475778, -3.585493, 0.9137255, 1, 0, 1,
-0.9155708, 1.073797, 0.05122472, 0.9098039, 1, 0, 1,
-0.9110017, -1.513258, -2.723851, 0.9019608, 1, 0, 1,
-0.9089644, -0.5335414, -2.700743, 0.8941177, 1, 0, 1,
-0.9056945, 0.5103024, -0.7944778, 0.8901961, 1, 0, 1,
-0.9051459, -1.261331, -2.277117, 0.8823529, 1, 0, 1,
-0.904923, -2.440412, -2.847082, 0.8784314, 1, 0, 1,
-0.9041504, -0.4285795, -1.900556, 0.8705882, 1, 0, 1,
-0.8938538, -0.1621417, -1.998722, 0.8666667, 1, 0, 1,
-0.8937698, 0.9161606, -1.086372, 0.8588235, 1, 0, 1,
-0.8926381, 0.3084733, -2.312877, 0.854902, 1, 0, 1,
-0.8840776, 0.8823397, -2.810077, 0.8470588, 1, 0, 1,
-0.8807157, 1.385012, 1.328691, 0.8431373, 1, 0, 1,
-0.8766236, -1.152223, -1.473518, 0.8352941, 1, 0, 1,
-0.8753692, 0.2408757, -2.647713, 0.8313726, 1, 0, 1,
-0.87487, -0.2644472, -3.167193, 0.8235294, 1, 0, 1,
-0.8703806, 1.694087, -0.4876609, 0.8196079, 1, 0, 1,
-0.8639495, 0.7527899, -0.1392964, 0.8117647, 1, 0, 1,
-0.8609892, -0.7860669, -1.333526, 0.8078431, 1, 0, 1,
-0.8609543, 0.3293026, 0.2896316, 0.8, 1, 0, 1,
-0.8593298, -0.5186225, -3.543222, 0.7921569, 1, 0, 1,
-0.8580458, -0.1701883, -2.488306, 0.7882353, 1, 0, 1,
-0.8572901, -0.7868321, -4.023023, 0.7803922, 1, 0, 1,
-0.8560616, 0.08271338, -0.8188693, 0.7764706, 1, 0, 1,
-0.8517569, 0.393879, -0.5223757, 0.7686275, 1, 0, 1,
-0.8508776, 1.16613, -0.4619349, 0.7647059, 1, 0, 1,
-0.8490763, -1.731592, -4.379703, 0.7568628, 1, 0, 1,
-0.8455522, -1.681201, -3.547927, 0.7529412, 1, 0, 1,
-0.8441357, 0.1364555, -1.521608, 0.7450981, 1, 0, 1,
-0.836728, 1.029448, 0.7289354, 0.7411765, 1, 0, 1,
-0.8321126, -1.196957, -2.834302, 0.7333333, 1, 0, 1,
-0.8249326, -0.3357254, 0.05547849, 0.7294118, 1, 0, 1,
-0.8235335, 1.092457, 1.302699, 0.7215686, 1, 0, 1,
-0.819162, -0.6809162, -0.6299063, 0.7176471, 1, 0, 1,
-0.8142144, 0.4719619, -1.10257, 0.7098039, 1, 0, 1,
-0.8138958, -1.339544, -3.618611, 0.7058824, 1, 0, 1,
-0.8088055, -0.02815512, -2.38874, 0.6980392, 1, 0, 1,
-0.8069158, 0.6790046, 0.1727715, 0.6901961, 1, 0, 1,
-0.805149, 0.3975135, -1.371513, 0.6862745, 1, 0, 1,
-0.8038192, -1.216655, -2.603958, 0.6784314, 1, 0, 1,
-0.7880381, 1.03829, -0.3121481, 0.6745098, 1, 0, 1,
-0.787864, 2.434506, -0.8112033, 0.6666667, 1, 0, 1,
-0.7825983, -1.758034, -1.263234, 0.6627451, 1, 0, 1,
-0.7811285, 0.732272, -0.1766501, 0.654902, 1, 0, 1,
-0.7808188, -0.9932085, -3.441947, 0.6509804, 1, 0, 1,
-0.7803003, 0.6442441, -1.564214, 0.6431373, 1, 0, 1,
-0.7765038, 1.117468, -1.190174, 0.6392157, 1, 0, 1,
-0.77565, -0.10235, -1.405308, 0.6313726, 1, 0, 1,
-0.7750312, 1.288014, -0.8977579, 0.627451, 1, 0, 1,
-0.7740619, 0.6011815, -0.1708535, 0.6196079, 1, 0, 1,
-0.7714421, 0.7939939, -0.2421194, 0.6156863, 1, 0, 1,
-0.7695764, -1.93752, -2.47089, 0.6078432, 1, 0, 1,
-0.7684543, -0.1688883, -2.920745, 0.6039216, 1, 0, 1,
-0.7673248, -0.3889722, -3.2832, 0.5960785, 1, 0, 1,
-0.7668643, -0.9905988, -1.078298, 0.5882353, 1, 0, 1,
-0.7614188, 1.936506, -0.929059, 0.5843138, 1, 0, 1,
-0.7609173, -1.433945, -1.886508, 0.5764706, 1, 0, 1,
-0.7602402, 2.260052, 1.384235, 0.572549, 1, 0, 1,
-0.7539909, 1.63124, -0.8175294, 0.5647059, 1, 0, 1,
-0.7518289, 0.5598041, -0.727957, 0.5607843, 1, 0, 1,
-0.7462844, 0.2977177, -2.363837, 0.5529412, 1, 0, 1,
-0.7418523, 0.2488867, 0.02265733, 0.5490196, 1, 0, 1,
-0.7393563, -2.277278, -2.742461, 0.5411765, 1, 0, 1,
-0.7377037, 0.07705603, -1.176733, 0.5372549, 1, 0, 1,
-0.7366471, -1.103484, -1.910015, 0.5294118, 1, 0, 1,
-0.7344607, -0.4359747, -4.432348, 0.5254902, 1, 0, 1,
-0.7335925, -0.5867309, -2.395127, 0.5176471, 1, 0, 1,
-0.7304443, -1.177884, -1.869781, 0.5137255, 1, 0, 1,
-0.7268279, -1.372957, -3.781309, 0.5058824, 1, 0, 1,
-0.7266022, 0.2867919, -0.7535896, 0.5019608, 1, 0, 1,
-0.7231669, 0.8982586, -0.2548927, 0.4941176, 1, 0, 1,
-0.7205139, -0.9059992, -1.937231, 0.4862745, 1, 0, 1,
-0.7202059, 0.3828413, 0.1208219, 0.4823529, 1, 0, 1,
-0.71993, 0.1198645, -1.219124, 0.4745098, 1, 0, 1,
-0.7137957, 1.47053, -0.737231, 0.4705882, 1, 0, 1,
-0.7130066, -2.582268, -1.345016, 0.4627451, 1, 0, 1,
-0.7124406, 1.004415, 1.065554, 0.4588235, 1, 0, 1,
-0.7077467, -0.3316641, -0.7635799, 0.4509804, 1, 0, 1,
-0.7028659, -0.1260998, -1.211826, 0.4470588, 1, 0, 1,
-0.6987027, -0.9170354, -0.8492106, 0.4392157, 1, 0, 1,
-0.6958274, 0.1210841, -0.7808385, 0.4352941, 1, 0, 1,
-0.6944935, -1.610786, -2.507603, 0.427451, 1, 0, 1,
-0.6913761, -0.02985572, 0.09009759, 0.4235294, 1, 0, 1,
-0.6902035, -0.9829845, -2.425571, 0.4156863, 1, 0, 1,
-0.6858888, -0.1404829, -2.116627, 0.4117647, 1, 0, 1,
-0.6850051, 0.6350127, -0.5074689, 0.4039216, 1, 0, 1,
-0.6821758, -0.1578599, -2.23515, 0.3960784, 1, 0, 1,
-0.6801858, 0.9695654, -1.569789, 0.3921569, 1, 0, 1,
-0.6775679, -0.3886684, -3.519543, 0.3843137, 1, 0, 1,
-0.6768515, -1.905746, -3.79161, 0.3803922, 1, 0, 1,
-0.6746297, 0.6064453, -0.6276691, 0.372549, 1, 0, 1,
-0.6737697, -0.1405307, -1.10602, 0.3686275, 1, 0, 1,
-0.6720692, -0.9918435, -2.408392, 0.3607843, 1, 0, 1,
-0.6688909, 0.597535, 0.6915385, 0.3568628, 1, 0, 1,
-0.6675742, -0.1667635, -2.265555, 0.3490196, 1, 0, 1,
-0.6626137, 1.591919, -0.7134607, 0.345098, 1, 0, 1,
-0.6587632, -1.637499, -2.047374, 0.3372549, 1, 0, 1,
-0.6551585, 0.6472186, -1.571977, 0.3333333, 1, 0, 1,
-0.6543308, -1.494972, -2.930468, 0.3254902, 1, 0, 1,
-0.652787, 1.020596, 0.363198, 0.3215686, 1, 0, 1,
-0.6518449, 0.2897722, -2.835949, 0.3137255, 1, 0, 1,
-0.6507747, 1.000601, -0.8964821, 0.3098039, 1, 0, 1,
-0.6490231, -0.3378066, -2.92092, 0.3019608, 1, 0, 1,
-0.6469487, 0.9138343, 1.402139, 0.2941177, 1, 0, 1,
-0.6454321, 0.2359146, -0.8574023, 0.2901961, 1, 0, 1,
-0.6453126, 1.809142, 1.080542, 0.282353, 1, 0, 1,
-0.6433104, 1.178102, -2.106608, 0.2784314, 1, 0, 1,
-0.6403505, -0.9181659, -4.540945, 0.2705882, 1, 0, 1,
-0.6374556, -1.024784, -3.063004, 0.2666667, 1, 0, 1,
-0.6308315, -1.369023, -1.113574, 0.2588235, 1, 0, 1,
-0.6291177, 1.942493, 0.5062894, 0.254902, 1, 0, 1,
-0.6275436, 1.375102, 0.5326782, 0.2470588, 1, 0, 1,
-0.6242563, 0.5244825, -0.3297151, 0.2431373, 1, 0, 1,
-0.6207299, -0.7210773, -3.056596, 0.2352941, 1, 0, 1,
-0.6172861, 0.4100059, -0.2324795, 0.2313726, 1, 0, 1,
-0.6167433, 1.410281, 1.056159, 0.2235294, 1, 0, 1,
-0.6106467, -1.019486, -1.935811, 0.2196078, 1, 0, 1,
-0.6084267, 0.06887704, -1.732337, 0.2117647, 1, 0, 1,
-0.6072358, 2.061928, -0.7432625, 0.2078431, 1, 0, 1,
-0.6068487, -0.1000252, -0.1919076, 0.2, 1, 0, 1,
-0.6061395, -2.132782, -0.2081402, 0.1921569, 1, 0, 1,
-0.5993931, -0.3345345, -2.081242, 0.1882353, 1, 0, 1,
-0.5933116, 0.6114122, -0.1963103, 0.1803922, 1, 0, 1,
-0.5907423, 1.654247, 0.4645415, 0.1764706, 1, 0, 1,
-0.590075, 1.048077, -1.17095, 0.1686275, 1, 0, 1,
-0.5889335, -1.090236, -2.51105, 0.1647059, 1, 0, 1,
-0.5850635, -0.4177232, -1.053483, 0.1568628, 1, 0, 1,
-0.5834988, -0.0794305, -3.682466, 0.1529412, 1, 0, 1,
-0.5818818, 0.7705635, 0.1708151, 0.145098, 1, 0, 1,
-0.5815381, -0.6605758, -2.552303, 0.1411765, 1, 0, 1,
-0.5799029, 1.591719, 0.4591373, 0.1333333, 1, 0, 1,
-0.5759445, 1.284318, -0.5436167, 0.1294118, 1, 0, 1,
-0.5721375, -0.2497806, -2.968201, 0.1215686, 1, 0, 1,
-0.5641899, 0.8948923, -1.956136, 0.1176471, 1, 0, 1,
-0.5606167, 1.545632, 0.09828094, 0.1098039, 1, 0, 1,
-0.5569024, -0.4773162, -2.8499, 0.1058824, 1, 0, 1,
-0.5547758, 0.9577457, -1.036708, 0.09803922, 1, 0, 1,
-0.5503741, 0.3093952, -0.915488, 0.09019608, 1, 0, 1,
-0.5444641, 0.0443931, -1.499421, 0.08627451, 1, 0, 1,
-0.5427321, -0.0268262, -2.133102, 0.07843138, 1, 0, 1,
-0.534834, -0.249067, -2.370246, 0.07450981, 1, 0, 1,
-0.5325323, 1.616017, -0.7482631, 0.06666667, 1, 0, 1,
-0.5292145, 0.984293, -0.1857014, 0.0627451, 1, 0, 1,
-0.5257845, 1.370596, 0.3713768, 0.05490196, 1, 0, 1,
-0.5217795, -0.9189399, -2.982986, 0.05098039, 1, 0, 1,
-0.5117898, -3.938839, -2.266804, 0.04313726, 1, 0, 1,
-0.5046009, 0.07482166, -0.8549724, 0.03921569, 1, 0, 1,
-0.503432, -0.409433, -1.279601, 0.03137255, 1, 0, 1,
-0.5033254, 1.286992, -0.6460766, 0.02745098, 1, 0, 1,
-0.4986424, -0.2224481, -2.931933, 0.01960784, 1, 0, 1,
-0.4966974, -1.298197, -2.329326, 0.01568628, 1, 0, 1,
-0.4838004, -0.02199167, -1.32009, 0.007843138, 1, 0, 1,
-0.4827579, -0.666369, -2.670538, 0.003921569, 1, 0, 1,
-0.4813912, 1.343698, -0.3311384, 0, 1, 0.003921569, 1,
-0.474014, -0.1906138, -3.671422, 0, 1, 0.01176471, 1,
-0.4710608, -0.5914125, -3.583015, 0, 1, 0.01568628, 1,
-0.4661082, -1.346549, -3.249087, 0, 1, 0.02352941, 1,
-0.4634493, -0.3169716, -3.853441, 0, 1, 0.02745098, 1,
-0.4607092, 0.7936918, -1.048121, 0, 1, 0.03529412, 1,
-0.4528691, 0.6091589, 0.5644474, 0, 1, 0.03921569, 1,
-0.4498186, -0.5351058, -1.530161, 0, 1, 0.04705882, 1,
-0.4479421, -0.1477783, -2.204088, 0, 1, 0.05098039, 1,
-0.4456182, -0.6345169, -1.723678, 0, 1, 0.05882353, 1,
-0.4423838, -1.055569, -2.082478, 0, 1, 0.0627451, 1,
-0.4393275, 1.076901, -1.519427, 0, 1, 0.07058824, 1,
-0.4389782, 1.287229, -0.2678167, 0, 1, 0.07450981, 1,
-0.4368773, -1.708767, -2.860456, 0, 1, 0.08235294, 1,
-0.4321263, 0.1660762, -1.222171, 0, 1, 0.08627451, 1,
-0.4280438, 1.661698, -0.4195724, 0, 1, 0.09411765, 1,
-0.4207801, 0.472917, 0.05621224, 0, 1, 0.1019608, 1,
-0.4189832, 1.197712, -0.4449507, 0, 1, 0.1058824, 1,
-0.4189267, 1.041974, -1.886048, 0, 1, 0.1137255, 1,
-0.4176812, -0.1071715, -3.271168, 0, 1, 0.1176471, 1,
-0.4176465, -0.4844534, -5.091359, 0, 1, 0.1254902, 1,
-0.4158918, -1.346881, -2.615453, 0, 1, 0.1294118, 1,
-0.4149719, 0.6782063, -0.08076054, 0, 1, 0.1372549, 1,
-0.4119478, 0.5187358, -1.803333, 0, 1, 0.1411765, 1,
-0.4111948, -0.4931529, -3.597422, 0, 1, 0.1490196, 1,
-0.4057534, 0.8456334, 0.1428251, 0, 1, 0.1529412, 1,
-0.405157, 1.583808, 0.07867038, 0, 1, 0.1607843, 1,
-0.4023154, -0.4324587, -1.922598, 0, 1, 0.1647059, 1,
-0.3971146, -0.8000571, -4.055191, 0, 1, 0.172549, 1,
-0.3955441, -1.242368, -3.207602, 0, 1, 0.1764706, 1,
-0.3948584, 0.7277024, 0.33123, 0, 1, 0.1843137, 1,
-0.393517, 1.179807, 0.9362933, 0, 1, 0.1882353, 1,
-0.3844821, 0.6064116, 2.497854, 0, 1, 0.1960784, 1,
-0.3843055, 1.616876, 0.1355911, 0, 1, 0.2039216, 1,
-0.382893, -0.6189826, -4.026519, 0, 1, 0.2078431, 1,
-0.3813334, 0.5933467, 0.6604688, 0, 1, 0.2156863, 1,
-0.3809552, 2.325036, 0.323288, 0, 1, 0.2196078, 1,
-0.3785265, -1.830255, -3.58204, 0, 1, 0.227451, 1,
-0.3776464, -1.16925, -1.38681, 0, 1, 0.2313726, 1,
-0.3772188, 1.477854, -1.097345, 0, 1, 0.2392157, 1,
-0.3765074, 0.8052549, 1.60816, 0, 1, 0.2431373, 1,
-0.3672094, -1.840592, -0.9870734, 0, 1, 0.2509804, 1,
-0.3645835, 2.640499, -0.5786936, 0, 1, 0.254902, 1,
-0.3633872, 0.8427915, -1.52138, 0, 1, 0.2627451, 1,
-0.3625067, -0.281543, -2.889296, 0, 1, 0.2666667, 1,
-0.3621811, -0.7607295, -4.093903, 0, 1, 0.2745098, 1,
-0.3606568, 1.849369, -1.439856, 0, 1, 0.2784314, 1,
-0.3586949, -0.3440881, -1.073693, 0, 1, 0.2862745, 1,
-0.3573215, -1.096302, -0.5327758, 0, 1, 0.2901961, 1,
-0.346752, -0.4736956, -1.834898, 0, 1, 0.2980392, 1,
-0.3454257, -1.791662, -2.455867, 0, 1, 0.3058824, 1,
-0.3452109, 0.5777839, -0.6487734, 0, 1, 0.3098039, 1,
-0.3425318, -0.2647191, -1.56597, 0, 1, 0.3176471, 1,
-0.3419535, -1.748061, -1.342111, 0, 1, 0.3215686, 1,
-0.3401825, 0.2594186, -2.532077, 0, 1, 0.3294118, 1,
-0.3381952, 1.432454, -0.9270076, 0, 1, 0.3333333, 1,
-0.3305454, 1.429566, -1.122658, 0, 1, 0.3411765, 1,
-0.3267443, 0.6016607, -0.5307667, 0, 1, 0.345098, 1,
-0.3267165, 0.02739673, -1.207107, 0, 1, 0.3529412, 1,
-0.3264461, 0.127079, -2.416325, 0, 1, 0.3568628, 1,
-0.31883, -1.124532, -1.385155, 0, 1, 0.3647059, 1,
-0.3122519, 0.6521172, -1.004408, 0, 1, 0.3686275, 1,
-0.3014434, -0.5773917, -2.124112, 0, 1, 0.3764706, 1,
-0.3002578, -0.7546321, -3.130063, 0, 1, 0.3803922, 1,
-0.2985616, -1.816004, -2.959382, 0, 1, 0.3882353, 1,
-0.2944276, 0.7243403, 0.8907568, 0, 1, 0.3921569, 1,
-0.2931804, 0.8295492, -1.086717, 0, 1, 0.4, 1,
-0.2909727, -0.2571394, -2.784714, 0, 1, 0.4078431, 1,
-0.2852198, 0.5351924, -0.0152191, 0, 1, 0.4117647, 1,
-0.2835499, -0.8503069, -1.510737, 0, 1, 0.4196078, 1,
-0.2833223, 0.2523875, -0.6061488, 0, 1, 0.4235294, 1,
-0.2802724, -0.5252351, -3.038824, 0, 1, 0.4313726, 1,
-0.2782674, 0.2760608, -0.2959749, 0, 1, 0.4352941, 1,
-0.2774439, 0.1331809, -1.375967, 0, 1, 0.4431373, 1,
-0.2733129, -0.9325348, -0.2945381, 0, 1, 0.4470588, 1,
-0.2714454, -0.9010239, -2.393163, 0, 1, 0.454902, 1,
-0.271317, -1.402582, -3.227291, 0, 1, 0.4588235, 1,
-0.2712342, 1.63993, 0.4012045, 0, 1, 0.4666667, 1,
-0.2693332, 2.295707, -0.6280982, 0, 1, 0.4705882, 1,
-0.2656979, 0.5225613, 0.3487735, 0, 1, 0.4784314, 1,
-0.2632574, 0.8201735, -1.429764, 0, 1, 0.4823529, 1,
-0.2612721, 0.1550534, -1.153063, 0, 1, 0.4901961, 1,
-0.2611642, -1.443164, -4.95441, 0, 1, 0.4941176, 1,
-0.2600814, 0.5582052, 1.214676, 0, 1, 0.5019608, 1,
-0.2506579, 0.1678357, -0.4721717, 0, 1, 0.509804, 1,
-0.2490883, 1.689328, -1.775719, 0, 1, 0.5137255, 1,
-0.2401394, -0.01911936, -1.189745, 0, 1, 0.5215687, 1,
-0.2395395, -0.06061715, -2.268066, 0, 1, 0.5254902, 1,
-0.2354391, 0.1584343, -1.349502, 0, 1, 0.5333334, 1,
-0.2311225, -0.6553282, -2.79705, 0, 1, 0.5372549, 1,
-0.2294448, 1.738585, 0.5206312, 0, 1, 0.5450981, 1,
-0.229107, 1.010067, -0.5178684, 0, 1, 0.5490196, 1,
-0.2248633, 0.9442371, 0.2092238, 0, 1, 0.5568628, 1,
-0.2229246, -0.1171862, -1.427603, 0, 1, 0.5607843, 1,
-0.2202543, 0.7230862, 0.5740123, 0, 1, 0.5686275, 1,
-0.2194282, 0.620878, 1.232802, 0, 1, 0.572549, 1,
-0.2170065, -0.170149, -1.592878, 0, 1, 0.5803922, 1,
-0.2119305, -0.3038827, -3.083046, 0, 1, 0.5843138, 1,
-0.2106449, 2.536148, -2.008053, 0, 1, 0.5921569, 1,
-0.2063779, 0.4133281, 0.1184122, 0, 1, 0.5960785, 1,
-0.1884833, 0.2664843, 0.05551263, 0, 1, 0.6039216, 1,
-0.1870868, 1.268524, -0.937304, 0, 1, 0.6117647, 1,
-0.1851713, -0.6909871, -2.831219, 0, 1, 0.6156863, 1,
-0.1842028, -0.6316304, -3.881009, 0, 1, 0.6235294, 1,
-0.1804921, 0.5756834, -0.3212248, 0, 1, 0.627451, 1,
-0.1795422, 2.846754, -0.6073174, 0, 1, 0.6352941, 1,
-0.1777502, 1.499846, -0.96957, 0, 1, 0.6392157, 1,
-0.1776954, 0.9357491, 0.617699, 0, 1, 0.6470588, 1,
-0.1763567, 0.3429639, -0.922288, 0, 1, 0.6509804, 1,
-0.1731859, 0.3365553, -1.246271, 0, 1, 0.6588235, 1,
-0.1730934, -0.2716739, -4.462607, 0, 1, 0.6627451, 1,
-0.1691166, 1.397056, 0.1059042, 0, 1, 0.6705883, 1,
-0.1686875, 0.7416173, -0.3930877, 0, 1, 0.6745098, 1,
-0.1658584, 0.5633576, 1.295125, 0, 1, 0.682353, 1,
-0.16331, -0.421131, -2.089293, 0, 1, 0.6862745, 1,
-0.1618965, 1.13217, -0.8989281, 0, 1, 0.6941177, 1,
-0.1570104, -0.04797018, -2.545466, 0, 1, 0.7019608, 1,
-0.156484, -2.405344, -4.778305, 0, 1, 0.7058824, 1,
-0.1552481, 0.6130912, 1.955857, 0, 1, 0.7137255, 1,
-0.1527209, -0.07837437, -0.8257143, 0, 1, 0.7176471, 1,
-0.1423778, -1.116948, -2.509271, 0, 1, 0.7254902, 1,
-0.1372488, 0.768516, -1.518736, 0, 1, 0.7294118, 1,
-0.1369527, 1.605758, 1.16791, 0, 1, 0.7372549, 1,
-0.127725, 0.06682099, -1.543277, 0, 1, 0.7411765, 1,
-0.1266405, -1.169325, -2.655128, 0, 1, 0.7490196, 1,
-0.1249683, 1.255639, -0.9874954, 0, 1, 0.7529412, 1,
-0.1214335, 0.6143275, -0.85481, 0, 1, 0.7607843, 1,
-0.117661, 0.3244256, 0.2773308, 0, 1, 0.7647059, 1,
-0.1168986, 0.8516999, -1.727337, 0, 1, 0.772549, 1,
-0.1126924, -1.596484, -3.391334, 0, 1, 0.7764706, 1,
-0.11133, 0.07926187, -1.141572, 0, 1, 0.7843137, 1,
-0.1109527, 0.06972551, -2.012501, 0, 1, 0.7882353, 1,
-0.1085306, 0.8243628, 0.5057557, 0, 1, 0.7960784, 1,
-0.1062348, 2.008621, -1.08837, 0, 1, 0.8039216, 1,
-0.09762182, 1.269001, 0.6549345, 0, 1, 0.8078431, 1,
-0.0887091, -0.4574088, -2.042344, 0, 1, 0.8156863, 1,
-0.08453143, 0.9987408, -1.618946, 0, 1, 0.8196079, 1,
-0.08281671, 1.033684, 0.7660523, 0, 1, 0.827451, 1,
-0.08112218, 0.5363419, 0.3418817, 0, 1, 0.8313726, 1,
-0.07759421, -0.02753229, -2.891292, 0, 1, 0.8392157, 1,
-0.06886736, 0.6395205, -1.828081, 0, 1, 0.8431373, 1,
-0.06774423, 0.02695828, 0.9237368, 0, 1, 0.8509804, 1,
-0.06715181, 0.03341157, 0.8842003, 0, 1, 0.854902, 1,
-0.06532121, -0.0349675, -2.122147, 0, 1, 0.8627451, 1,
-0.06406345, 0.3923094, 0.1135752, 0, 1, 0.8666667, 1,
-0.06149944, 1.245314, -2.249187, 0, 1, 0.8745098, 1,
-0.06093616, -0.8180184, -3.715018, 0, 1, 0.8784314, 1,
-0.06052678, 0.2610064, 0.7857843, 0, 1, 0.8862745, 1,
-0.05796546, 0.7771064, -1.205612, 0, 1, 0.8901961, 1,
-0.05632417, -0.0861938, -1.835159, 0, 1, 0.8980392, 1,
-0.05612394, -1.706233, -4.216728, 0, 1, 0.9058824, 1,
-0.05558225, -0.7839543, -1.740909, 0, 1, 0.9098039, 1,
-0.05216888, 1.474329, 1.136529, 0, 1, 0.9176471, 1,
-0.05119367, 0.8656064, -1.022681, 0, 1, 0.9215686, 1,
-0.05044123, -0.9558778, -5.150876, 0, 1, 0.9294118, 1,
-0.05026288, 0.4592376, -0.708108, 0, 1, 0.9333333, 1,
-0.04831849, -0.6438835, -1.154946, 0, 1, 0.9411765, 1,
-0.04723008, -1.360461, -2.635054, 0, 1, 0.945098, 1,
-0.04452847, 0.9235455, -1.529699, 0, 1, 0.9529412, 1,
-0.04289053, -0.2979713, -1.687347, 0, 1, 0.9568627, 1,
-0.04003384, 0.6940463, -0.1241684, 0, 1, 0.9647059, 1,
-0.03469669, 1.258512, 1.095417, 0, 1, 0.9686275, 1,
-0.02922618, -0.3236099, -2.461402, 0, 1, 0.9764706, 1,
-0.0287852, 1.330014, -0.514873, 0, 1, 0.9803922, 1,
-0.0259837, -0.5339749, -1.621613, 0, 1, 0.9882353, 1,
-0.02217748, 1.254335, 1.625225, 0, 1, 0.9921569, 1,
-0.01779342, -0.4056685, -4.866894, 0, 1, 1, 1,
-0.01490188, 0.6181794, -0.06869388, 0, 0.9921569, 1, 1,
-0.01208098, -1.423803, -3.943769, 0, 0.9882353, 1, 1,
-0.01162695, 0.9008976, 0.5992799, 0, 0.9803922, 1, 1,
-0.01141693, -1.185521, -2.323646, 0, 0.9764706, 1, 1,
-0.007681835, 1.128476, 0.1952268, 0, 0.9686275, 1, 1,
-0.003848883, -0.7095101, -4.062825, 0, 0.9647059, 1, 1,
-0.001289834, 0.4526064, -1.525671, 0, 0.9568627, 1, 1,
0.0006639436, 0.0232153, 2.081106, 0, 0.9529412, 1, 1,
0.001989284, 1.148258, -0.2250339, 0, 0.945098, 1, 1,
0.003818757, 0.6331118, 0.3619859, 0, 0.9411765, 1, 1,
0.004126891, -0.4274983, 3.758826, 0, 0.9333333, 1, 1,
0.005210251, -0.5371519, 0.2820933, 0, 0.9294118, 1, 1,
0.006946136, -0.03418966, 3.186526, 0, 0.9215686, 1, 1,
0.006995318, 1.51753, 1.288337, 0, 0.9176471, 1, 1,
0.007385242, -0.5916818, 3.463019, 0, 0.9098039, 1, 1,
0.01879697, -1.417257, 3.293035, 0, 0.9058824, 1, 1,
0.01966762, -0.1625352, 4.506272, 0, 0.8980392, 1, 1,
0.02293642, -0.8676362, 3.685668, 0, 0.8901961, 1, 1,
0.02362524, 1.414427, 1.011452, 0, 0.8862745, 1, 1,
0.02798846, 1.016185, 0.2114026, 0, 0.8784314, 1, 1,
0.03111554, -0.2202095, 2.582605, 0, 0.8745098, 1, 1,
0.03269205, 0.5889237, -0.05526424, 0, 0.8666667, 1, 1,
0.03376681, 1.104237, 0.363832, 0, 0.8627451, 1, 1,
0.03453062, -1.829145, 0.9727966, 0, 0.854902, 1, 1,
0.03627316, 0.5869545, -2.238082, 0, 0.8509804, 1, 1,
0.03695463, 1.522007, 1.2465, 0, 0.8431373, 1, 1,
0.03701754, 0.02052404, 2.100158, 0, 0.8392157, 1, 1,
0.03871758, -1.744492, 2.075259, 0, 0.8313726, 1, 1,
0.04003163, 1.850485, 0.1850106, 0, 0.827451, 1, 1,
0.04037016, 0.03631137, -0.505137, 0, 0.8196079, 1, 1,
0.04061487, -1.109018, 1.735854, 0, 0.8156863, 1, 1,
0.0435922, 0.8350697, 0.06946546, 0, 0.8078431, 1, 1,
0.044549, -1.216012, 5.612161, 0, 0.8039216, 1, 1,
0.04663879, 0.662942, 0.2611082, 0, 0.7960784, 1, 1,
0.04877947, -0.7802602, 2.522252, 0, 0.7882353, 1, 1,
0.04991563, 0.6447492, 0.7617372, 0, 0.7843137, 1, 1,
0.05201634, 1.528373, 0.2923547, 0, 0.7764706, 1, 1,
0.05403974, 0.4233902, 1.143041, 0, 0.772549, 1, 1,
0.05701951, 0.1358472, 0.6738924, 0, 0.7647059, 1, 1,
0.05782199, -0.6316227, 3.230714, 0, 0.7607843, 1, 1,
0.06298072, 0.4638216, -0.104376, 0, 0.7529412, 1, 1,
0.0648637, -0.2673123, 3.118936, 0, 0.7490196, 1, 1,
0.06934932, -1.266161, 2.803284, 0, 0.7411765, 1, 1,
0.07005449, -0.906709, 3.07711, 0, 0.7372549, 1, 1,
0.07214352, 0.3964223, 0.9791658, 0, 0.7294118, 1, 1,
0.07375018, 1.679901, 1.949939, 0, 0.7254902, 1, 1,
0.07565098, -0.07322342, 1.487634, 0, 0.7176471, 1, 1,
0.07589506, -1.027975, 4.455927, 0, 0.7137255, 1, 1,
0.07961447, 0.8000941, -1.278052, 0, 0.7058824, 1, 1,
0.08146072, -0.9749589, 3.232215, 0, 0.6980392, 1, 1,
0.08342951, 1.460901, 0.9666052, 0, 0.6941177, 1, 1,
0.08381127, -1.096058, 3.921499, 0, 0.6862745, 1, 1,
0.08761462, -1.905087, 3.168413, 0, 0.682353, 1, 1,
0.09239984, 0.1766518, -0.8879592, 0, 0.6745098, 1, 1,
0.09445772, 0.8358284, 1.066159, 0, 0.6705883, 1, 1,
0.09671259, 0.1649542, 0.5832616, 0, 0.6627451, 1, 1,
0.1010311, 0.05423117, 2.411424, 0, 0.6588235, 1, 1,
0.1048327, 1.124379, -0.125252, 0, 0.6509804, 1, 1,
0.1126605, -0.999985, 3.280842, 0, 0.6470588, 1, 1,
0.113229, 1.397339, -0.9736838, 0, 0.6392157, 1, 1,
0.1204422, 2.349446, 1.495916, 0, 0.6352941, 1, 1,
0.1211496, -1.244694, 3.27422, 0, 0.627451, 1, 1,
0.1249652, 0.5546675, 1.562322, 0, 0.6235294, 1, 1,
0.1295961, -0.1679297, 2.540431, 0, 0.6156863, 1, 1,
0.13189, 0.7052039, 1.355757, 0, 0.6117647, 1, 1,
0.1332623, 1.50781, -0.1122015, 0, 0.6039216, 1, 1,
0.133302, -1.913267, 3.97827, 0, 0.5960785, 1, 1,
0.1349679, -0.843399, 4.350483, 0, 0.5921569, 1, 1,
0.1365756, 0.8912348, 1.274085, 0, 0.5843138, 1, 1,
0.1388533, -0.8754912, 1.709207, 0, 0.5803922, 1, 1,
0.1433501, -0.4557951, 1.937157, 0, 0.572549, 1, 1,
0.1439965, -0.4145047, 2.432263, 0, 0.5686275, 1, 1,
0.1452385, -1.121734, 3.656413, 0, 0.5607843, 1, 1,
0.1487348, -0.6299543, 3.355013, 0, 0.5568628, 1, 1,
0.1510297, 1.172597, 0.2069906, 0, 0.5490196, 1, 1,
0.1515684, -0.5061158, 2.357824, 0, 0.5450981, 1, 1,
0.1546954, 0.1061429, 1.681552, 0, 0.5372549, 1, 1,
0.1550119, 0.9243361, 0.4479542, 0, 0.5333334, 1, 1,
0.1572187, -1.537466, 3.444405, 0, 0.5254902, 1, 1,
0.1623094, 0.1156484, 0.18801, 0, 0.5215687, 1, 1,
0.1626221, -0.1014775, 0.7770183, 0, 0.5137255, 1, 1,
0.1627817, 1.827534, 0.5548824, 0, 0.509804, 1, 1,
0.1640155, -0.1098943, 3.393255, 0, 0.5019608, 1, 1,
0.1640516, 1.198218, 0.6892462, 0, 0.4941176, 1, 1,
0.1666391, 0.4176389, -0.003049626, 0, 0.4901961, 1, 1,
0.1691687, -0.5009145, 3.657575, 0, 0.4823529, 1, 1,
0.1737547, 0.110441, 1.883819, 0, 0.4784314, 1, 1,
0.1822891, 1.158283, -0.2843519, 0, 0.4705882, 1, 1,
0.1862428, 1.535033, 0.2560113, 0, 0.4666667, 1, 1,
0.1868327, -0.5291985, 3.913484, 0, 0.4588235, 1, 1,
0.1869361, 0.1273667, 1.069961, 0, 0.454902, 1, 1,
0.1990801, 0.2640726, 1.160172, 0, 0.4470588, 1, 1,
0.1994576, -2.729277, 4.631401, 0, 0.4431373, 1, 1,
0.2008065, 1.133929, 1.11599, 0, 0.4352941, 1, 1,
0.2030764, 0.9981091, 0.4071092, 0, 0.4313726, 1, 1,
0.2045623, -1.203542, 3.157473, 0, 0.4235294, 1, 1,
0.2081175, -0.5846969, 3.529713, 0, 0.4196078, 1, 1,
0.2099929, -0.495466, 1.536484, 0, 0.4117647, 1, 1,
0.211499, -1.286564, 3.215905, 0, 0.4078431, 1, 1,
0.2118308, 0.5793009, 0.2459038, 0, 0.4, 1, 1,
0.211992, 2.097677, -0.5351431, 0, 0.3921569, 1, 1,
0.2167362, 0.6395074, 0.5594903, 0, 0.3882353, 1, 1,
0.2174383, 1.015865, 0.574952, 0, 0.3803922, 1, 1,
0.228018, -0.4933623, 2.811972, 0, 0.3764706, 1, 1,
0.2309033, -0.3687187, 2.762648, 0, 0.3686275, 1, 1,
0.2330589, -0.09874594, 2.638569, 0, 0.3647059, 1, 1,
0.2336619, 0.09050861, -0.185201, 0, 0.3568628, 1, 1,
0.2373742, -0.3225559, 3.272501, 0, 0.3529412, 1, 1,
0.2384382, 1.347647, -0.1009277, 0, 0.345098, 1, 1,
0.2414684, -1.201046, 2.747647, 0, 0.3411765, 1, 1,
0.2439813, 0.1371729, 2.16593, 0, 0.3333333, 1, 1,
0.2452338, -1.085929, 1.958048, 0, 0.3294118, 1, 1,
0.2464749, 0.2208975, 1.619465, 0, 0.3215686, 1, 1,
0.2479632, -0.6638117, 2.282484, 0, 0.3176471, 1, 1,
0.2490365, 0.05991811, 0.5491492, 0, 0.3098039, 1, 1,
0.2539898, 0.4063484, 0.1051232, 0, 0.3058824, 1, 1,
0.2547662, -0.005869509, 0.09050926, 0, 0.2980392, 1, 1,
0.2617614, 0.08653969, 1.362629, 0, 0.2901961, 1, 1,
0.2712535, -1.154044, 2.371877, 0, 0.2862745, 1, 1,
0.2779563, 1.012374, 1.785664, 0, 0.2784314, 1, 1,
0.2798088, 1.041559, 0.7096652, 0, 0.2745098, 1, 1,
0.2837527, -0.2434403, 1.694973, 0, 0.2666667, 1, 1,
0.2850899, -0.4438659, 1.889924, 0, 0.2627451, 1, 1,
0.2878087, 1.166399, -1.199783, 0, 0.254902, 1, 1,
0.292571, -1.113544, 2.131308, 0, 0.2509804, 1, 1,
0.2948275, 0.5094362, -0.5914678, 0, 0.2431373, 1, 1,
0.3077743, 0.2401908, 1.443958, 0, 0.2392157, 1, 1,
0.3089761, -1.219927, 3.08011, 0, 0.2313726, 1, 1,
0.3098821, -0.6751277, 3.56451, 0, 0.227451, 1, 1,
0.3131327, 0.05444046, 1.201072, 0, 0.2196078, 1, 1,
0.3147213, 0.8776906, -0.08578213, 0, 0.2156863, 1, 1,
0.3174647, 1.310425, 0.3587907, 0, 0.2078431, 1, 1,
0.3238851, 0.3632596, 1.787778, 0, 0.2039216, 1, 1,
0.3287865, -0.04789121, 2.225061, 0, 0.1960784, 1, 1,
0.3377364, 0.9463816, 1.488449, 0, 0.1882353, 1, 1,
0.3418193, -0.04828036, 1.257524, 0, 0.1843137, 1, 1,
0.3426871, -0.650272, 3.194557, 0, 0.1764706, 1, 1,
0.3459317, -0.8122206, 1.627389, 0, 0.172549, 1, 1,
0.3529114, -0.6792074, 2.128922, 0, 0.1647059, 1, 1,
0.3533798, -0.9131063, 4.450976, 0, 0.1607843, 1, 1,
0.3548376, -1.342057, 3.523498, 0, 0.1529412, 1, 1,
0.3580806, 0.6421093, 1.66695, 0, 0.1490196, 1, 1,
0.3621981, -0.01467607, 1.223555, 0, 0.1411765, 1, 1,
0.3646117, -0.4412616, 3.022619, 0, 0.1372549, 1, 1,
0.3704419, 0.1918384, 3.40901, 0, 0.1294118, 1, 1,
0.370855, 0.9941338, -0.00671064, 0, 0.1254902, 1, 1,
0.3723078, -0.7420552, 3.516165, 0, 0.1176471, 1, 1,
0.3759826, -0.903618, 0.7681267, 0, 0.1137255, 1, 1,
0.3783873, -0.3173364, 2.080021, 0, 0.1058824, 1, 1,
0.3793491, -0.182095, 0.8476409, 0, 0.09803922, 1, 1,
0.3803179, 0.7762897, -0.3054678, 0, 0.09411765, 1, 1,
0.3846686, -1.114469, 1.709846, 0, 0.08627451, 1, 1,
0.3847384, -0.9802219, 4.090796, 0, 0.08235294, 1, 1,
0.3852927, 0.6906539, -0.02623985, 0, 0.07450981, 1, 1,
0.3889342, 1.435072, 0.2757366, 0, 0.07058824, 1, 1,
0.3909735, 2.088892, 0.004780243, 0, 0.0627451, 1, 1,
0.39726, -0.2138094, 1.822112, 0, 0.05882353, 1, 1,
0.4079146, -1.268022, 1.701819, 0, 0.05098039, 1, 1,
0.4092056, 1.105349, -0.7484516, 0, 0.04705882, 1, 1,
0.4093106, -0.5181984, 2.954472, 0, 0.03921569, 1, 1,
0.4109335, -0.1871764, 0.0974329, 0, 0.03529412, 1, 1,
0.4134057, 1.200947, 0.494138, 0, 0.02745098, 1, 1,
0.4136598, 1.142453, 0.4219838, 0, 0.02352941, 1, 1,
0.4193769, 0.08495214, 1.305949, 0, 0.01568628, 1, 1,
0.4284564, 0.7618361, 0.8642103, 0, 0.01176471, 1, 1,
0.4286547, -1.386484, 1.9368, 0, 0.003921569, 1, 1,
0.4326289, 1.086873, 1.422683, 0.003921569, 0, 1, 1,
0.4401034, -1.498692, 2.209035, 0.007843138, 0, 1, 1,
0.441694, 0.07440234, -0.6312979, 0.01568628, 0, 1, 1,
0.4428022, 1.365113, 0.3194828, 0.01960784, 0, 1, 1,
0.4437892, -0.3940536, 3.116283, 0.02745098, 0, 1, 1,
0.4439855, -1.651473, 3.083638, 0.03137255, 0, 1, 1,
0.4509894, 0.7760573, -2.318231, 0.03921569, 0, 1, 1,
0.4603108, 0.8157145, -1.123945, 0.04313726, 0, 1, 1,
0.4609452, 0.2874466, 1.005264, 0.05098039, 0, 1, 1,
0.4622743, 1.726331, 0.3380021, 0.05490196, 0, 1, 1,
0.4624517, -0.5750667, 2.861844, 0.0627451, 0, 1, 1,
0.4646063, 0.6192955, 0.2921376, 0.06666667, 0, 1, 1,
0.4662753, -0.1440254, 0.7341172, 0.07450981, 0, 1, 1,
0.4692612, 0.2677551, 1.219358, 0.07843138, 0, 1, 1,
0.4716705, -1.162363, 3.175579, 0.08627451, 0, 1, 1,
0.4722579, 0.6614816, 2.6614, 0.09019608, 0, 1, 1,
0.4780072, 0.1351646, 1.749355, 0.09803922, 0, 1, 1,
0.478039, -0.2584408, 2.281716, 0.1058824, 0, 1, 1,
0.4830241, -0.7697083, 3.424217, 0.1098039, 0, 1, 1,
0.4880233, 0.1544092, 1.157847, 0.1176471, 0, 1, 1,
0.4923108, -2.740896, 3.642705, 0.1215686, 0, 1, 1,
0.4947024, -0.4686633, 1.613644, 0.1294118, 0, 1, 1,
0.4953794, -1.935101, 4.067648, 0.1333333, 0, 1, 1,
0.4955271, 0.151687, 0.4602218, 0.1411765, 0, 1, 1,
0.4977111, 0.6746351, 0.7706259, 0.145098, 0, 1, 1,
0.4992139, 2.229997, 1.117734, 0.1529412, 0, 1, 1,
0.5004297, 1.043346, 2.545871, 0.1568628, 0, 1, 1,
0.5035499, -0.2973202, 2.790919, 0.1647059, 0, 1, 1,
0.5053188, -0.4798973, 1.141189, 0.1686275, 0, 1, 1,
0.5079609, 0.4776692, 0.9769625, 0.1764706, 0, 1, 1,
0.5131342, -2.225116, 2.437778, 0.1803922, 0, 1, 1,
0.5150477, 0.3561547, -0.1322275, 0.1882353, 0, 1, 1,
0.5180189, 1.744853, 0.8030723, 0.1921569, 0, 1, 1,
0.5270492, 0.2536376, 0.9465076, 0.2, 0, 1, 1,
0.5271308, -1.788122, 2.29117, 0.2078431, 0, 1, 1,
0.529918, -1.028353, 4.459864, 0.2117647, 0, 1, 1,
0.5329943, 1.575294, 0.3460601, 0.2196078, 0, 1, 1,
0.5374303, 0.2447635, 1.173996, 0.2235294, 0, 1, 1,
0.5391248, -1.524657, 3.142628, 0.2313726, 0, 1, 1,
0.5419805, 0.09867512, 1.685197, 0.2352941, 0, 1, 1,
0.5419987, -1.835462, 4.649955, 0.2431373, 0, 1, 1,
0.5423741, -0.3608044, 1.665549, 0.2470588, 0, 1, 1,
0.5525761, 2.016995, -0.983148, 0.254902, 0, 1, 1,
0.5541623, -0.8997253, 1.386536, 0.2588235, 0, 1, 1,
0.5626735, -0.7443044, 2.140115, 0.2666667, 0, 1, 1,
0.5663214, 1.390079, -1.361567, 0.2705882, 0, 1, 1,
0.5713493, -1.423927, 1.926418, 0.2784314, 0, 1, 1,
0.5730847, 0.8261513, 1.765061, 0.282353, 0, 1, 1,
0.5782278, 0.6177534, 1.198779, 0.2901961, 0, 1, 1,
0.5823605, 0.5972626, 0.1484393, 0.2941177, 0, 1, 1,
0.587195, 0.8382179, 1.418972, 0.3019608, 0, 1, 1,
0.58925, -1.426882, 2.544428, 0.3098039, 0, 1, 1,
0.5931689, -1.048512, 1.096546, 0.3137255, 0, 1, 1,
0.5962051, -1.239345, 3.244823, 0.3215686, 0, 1, 1,
0.6072651, 1.047141, 0.2302163, 0.3254902, 0, 1, 1,
0.6209788, -0.9989024, 2.78084, 0.3333333, 0, 1, 1,
0.628859, 0.6300805, 0.944053, 0.3372549, 0, 1, 1,
0.6322989, 0.2943015, 0.8490583, 0.345098, 0, 1, 1,
0.635159, 1.579701, -0.4803405, 0.3490196, 0, 1, 1,
0.6420255, -0.3460843, 3.032757, 0.3568628, 0, 1, 1,
0.6426636, 0.4928437, 1.087823, 0.3607843, 0, 1, 1,
0.6454647, -0.164845, 3.359433, 0.3686275, 0, 1, 1,
0.6469433, -0.1747091, 1.733488, 0.372549, 0, 1, 1,
0.6474104, -0.814263, 3.793773, 0.3803922, 0, 1, 1,
0.6484222, -1.821223, 3.704793, 0.3843137, 0, 1, 1,
0.6492727, -0.1593344, 2.589442, 0.3921569, 0, 1, 1,
0.6516221, -0.6205282, 2.045883, 0.3960784, 0, 1, 1,
0.6522754, -0.06743062, 1.4005, 0.4039216, 0, 1, 1,
0.6531182, -0.3744844, 2.118791, 0.4117647, 0, 1, 1,
0.6576063, -0.7399008, 1.708329, 0.4156863, 0, 1, 1,
0.6577593, -0.5319889, 1.898702, 0.4235294, 0, 1, 1,
0.6670843, -0.3809206, 2.034977, 0.427451, 0, 1, 1,
0.6703462, 0.2057095, 0.1526016, 0.4352941, 0, 1, 1,
0.6735759, 0.2905568, 1.6725, 0.4392157, 0, 1, 1,
0.6763998, -0.8800786, 2.403297, 0.4470588, 0, 1, 1,
0.6781596, -1.21064, 1.36773, 0.4509804, 0, 1, 1,
0.6783378, -0.3804585, 1.954145, 0.4588235, 0, 1, 1,
0.6849828, 0.8475131, 0.4809642, 0.4627451, 0, 1, 1,
0.6866757, -0.3144707, 1.381941, 0.4705882, 0, 1, 1,
0.6904128, 0.7273179, 1.440997, 0.4745098, 0, 1, 1,
0.6915504, 0.3523115, 0.5103647, 0.4823529, 0, 1, 1,
0.6918224, -1.543985, 2.865775, 0.4862745, 0, 1, 1,
0.6998205, -1.015313, 0.8218571, 0.4941176, 0, 1, 1,
0.7004473, -0.2066204, 2.497385, 0.5019608, 0, 1, 1,
0.7067071, 1.396077, -0.6989369, 0.5058824, 0, 1, 1,
0.7069991, 0.1322006, 0.5011278, 0.5137255, 0, 1, 1,
0.7099774, 1.178203, -0.8437825, 0.5176471, 0, 1, 1,
0.7263386, 0.04859518, 2.325191, 0.5254902, 0, 1, 1,
0.7296948, 0.9690029, 0.7475834, 0.5294118, 0, 1, 1,
0.7303225, 0.00775208, 2.424848, 0.5372549, 0, 1, 1,
0.7331696, 0.2984752, 2.398133, 0.5411765, 0, 1, 1,
0.7356368, -1.325567, 4.283286, 0.5490196, 0, 1, 1,
0.7385212, 0.1005328, 1.393612, 0.5529412, 0, 1, 1,
0.7415735, -0.007439869, 2.159341, 0.5607843, 0, 1, 1,
0.7420532, 0.8908821, 1.730374, 0.5647059, 0, 1, 1,
0.7425068, 0.5547094, 0.8041114, 0.572549, 0, 1, 1,
0.7462168, -1.941566, 1.434369, 0.5764706, 0, 1, 1,
0.7468017, -1.316938, 3.092497, 0.5843138, 0, 1, 1,
0.7493732, -2.11049, 3.302572, 0.5882353, 0, 1, 1,
0.7500306, 0.2470133, 1.842108, 0.5960785, 0, 1, 1,
0.7595069, 1.516755, 1.069493, 0.6039216, 0, 1, 1,
0.7620886, 0.6752921, 0.09582433, 0.6078432, 0, 1, 1,
0.7651377, 0.2318109, 0.5637583, 0.6156863, 0, 1, 1,
0.7656963, -0.2294437, 1.708515, 0.6196079, 0, 1, 1,
0.7731257, 0.6563146, 0.2615057, 0.627451, 0, 1, 1,
0.7751119, -1.757456, 3.57458, 0.6313726, 0, 1, 1,
0.7865411, -0.55368, 3.257203, 0.6392157, 0, 1, 1,
0.7907191, 0.5732281, 1.864163, 0.6431373, 0, 1, 1,
0.7943219, -0.6704377, 1.595846, 0.6509804, 0, 1, 1,
0.7972575, 1.578678, -0.1737181, 0.654902, 0, 1, 1,
0.8084854, -0.871084, 2.715327, 0.6627451, 0, 1, 1,
0.8107204, -0.167319, 1.370506, 0.6666667, 0, 1, 1,
0.8111518, 1.036554, 1.212378, 0.6745098, 0, 1, 1,
0.811403, -1.657426, 4.00782, 0.6784314, 0, 1, 1,
0.8147314, 0.4500473, 0.9696832, 0.6862745, 0, 1, 1,
0.8162367, 0.1848501, 2.354089, 0.6901961, 0, 1, 1,
0.8188914, 0.5537899, 2.842209, 0.6980392, 0, 1, 1,
0.820173, 0.2096075, 0.5337845, 0.7058824, 0, 1, 1,
0.821341, 0.0423811, 2.123332, 0.7098039, 0, 1, 1,
0.8248808, -1.401309, 1.06912, 0.7176471, 0, 1, 1,
0.8299496, 0.07892692, 1.228162, 0.7215686, 0, 1, 1,
0.830641, -1.169162, 1.787656, 0.7294118, 0, 1, 1,
0.833865, -0.640802, 1.041926, 0.7333333, 0, 1, 1,
0.8406955, -0.07878519, 2.459696, 0.7411765, 0, 1, 1,
0.8408251, -1.449984, 4.168752, 0.7450981, 0, 1, 1,
0.8427048, 0.097275, 0.1907378, 0.7529412, 0, 1, 1,
0.8446158, -0.9682781, 0.8703254, 0.7568628, 0, 1, 1,
0.8460064, 1.200684, -1.218962, 0.7647059, 0, 1, 1,
0.8475187, 1.05012, 0.6355975, 0.7686275, 0, 1, 1,
0.8487481, -1.870932, 1.772481, 0.7764706, 0, 1, 1,
0.8489096, -0.2716459, 2.233612, 0.7803922, 0, 1, 1,
0.8503308, -0.1457722, 3.512306, 0.7882353, 0, 1, 1,
0.8593385, 2.105807, -0.6701682, 0.7921569, 0, 1, 1,
0.8599464, 1.205805, 1.809597, 0.8, 0, 1, 1,
0.8666091, -0.4421393, 2.004373, 0.8078431, 0, 1, 1,
0.869996, 0.2226968, -0.2368274, 0.8117647, 0, 1, 1,
0.8785041, -0.438795, 0.9575462, 0.8196079, 0, 1, 1,
0.8795441, -0.3407225, 0.461505, 0.8235294, 0, 1, 1,
0.8850765, 0.6873494, 2.774224, 0.8313726, 0, 1, 1,
0.8908965, 0.2032691, 0.2234754, 0.8352941, 0, 1, 1,
0.8930398, -1.237181, 3.66727, 0.8431373, 0, 1, 1,
0.8934391, 0.683566, -0.3763315, 0.8470588, 0, 1, 1,
0.9008898, -0.001085754, 0.2173979, 0.854902, 0, 1, 1,
0.9034645, 1.45496, -0.4822577, 0.8588235, 0, 1, 1,
0.9111019, -0.927139, 3.645192, 0.8666667, 0, 1, 1,
0.9113607, 0.1032878, 1.519002, 0.8705882, 0, 1, 1,
0.9117957, 1.864977, 0.1269771, 0.8784314, 0, 1, 1,
0.9222399, -1.389457, 3.319708, 0.8823529, 0, 1, 1,
0.9286264, 0.8981285, 0.1429237, 0.8901961, 0, 1, 1,
0.9334983, -0.1581619, 2.129342, 0.8941177, 0, 1, 1,
0.934082, 0.2770554, 1.489171, 0.9019608, 0, 1, 1,
0.940877, 1.391194, 0.9517378, 0.9098039, 0, 1, 1,
0.9436747, 1.902485, -0.5099241, 0.9137255, 0, 1, 1,
0.9509147, -0.6642845, 2.170978, 0.9215686, 0, 1, 1,
0.9513518, 2.833949, -0.686816, 0.9254902, 0, 1, 1,
0.9520047, 1.389588, 0.2887444, 0.9333333, 0, 1, 1,
0.9598321, -0.1016454, 1.736919, 0.9372549, 0, 1, 1,
0.9679699, 0.4047986, 2.540791, 0.945098, 0, 1, 1,
0.9692987, 0.06907493, 1.693988, 0.9490196, 0, 1, 1,
0.9711522, 0.6677732, 1.618572, 0.9568627, 0, 1, 1,
0.9807084, -0.08882093, 2.265898, 0.9607843, 0, 1, 1,
0.9811227, 0.859715, 1.997964, 0.9686275, 0, 1, 1,
0.9890482, -0.502046, 1.173604, 0.972549, 0, 1, 1,
0.9892018, -0.5096552, 2.58757, 0.9803922, 0, 1, 1,
0.9949486, -1.224684, 1.160372, 0.9843137, 0, 1, 1,
0.9988219, -0.156324, 2.785594, 0.9921569, 0, 1, 1,
1.00381, 0.3095306, 0.7671659, 0.9960784, 0, 1, 1,
1.004391, 1.015513, 0.8057488, 1, 0, 0.9960784, 1,
1.004692, 0.5737079, 0.8726305, 1, 0, 0.9882353, 1,
1.004871, 0.6465618, 1.123509, 1, 0, 0.9843137, 1,
1.007247, 0.6511933, 3.429195, 1, 0, 0.9764706, 1,
1.023256, 0.3236832, 1.349851, 1, 0, 0.972549, 1,
1.038777, -0.03442291, 0.7895718, 1, 0, 0.9647059, 1,
1.039673, 1.282661, 0.6077688, 1, 0, 0.9607843, 1,
1.050872, -0.7785809, 2.757982, 1, 0, 0.9529412, 1,
1.05101, -1.411017, 3.211947, 1, 0, 0.9490196, 1,
1.052742, 0.2802827, 0.1079092, 1, 0, 0.9411765, 1,
1.060525, 1.006957, -0.07510565, 1, 0, 0.9372549, 1,
1.062147, 1.396066, -0.2240282, 1, 0, 0.9294118, 1,
1.062302, 0.5347953, 2.096931, 1, 0, 0.9254902, 1,
1.062516, 0.6985999, 1.311557, 1, 0, 0.9176471, 1,
1.065833, 0.6776536, 2.077855, 1, 0, 0.9137255, 1,
1.082724, 0.4683318, 1.904055, 1, 0, 0.9058824, 1,
1.085312, 0.166869, 2.000174, 1, 0, 0.9019608, 1,
1.088221, 0.6138264, 1.589087, 1, 0, 0.8941177, 1,
1.092756, -1.254822, 1.261331, 1, 0, 0.8862745, 1,
1.102247, -1.323126, 3.783544, 1, 0, 0.8823529, 1,
1.102772, 0.05130411, 2.691495, 1, 0, 0.8745098, 1,
1.111752, -0.06908726, 2.686857, 1, 0, 0.8705882, 1,
1.114647, -2.075862, 2.987163, 1, 0, 0.8627451, 1,
1.11651, -1.819407, 3.147717, 1, 0, 0.8588235, 1,
1.11654, -0.7641901, 2.01154, 1, 0, 0.8509804, 1,
1.119586, 2.425383, 0.441155, 1, 0, 0.8470588, 1,
1.120035, -0.4867276, 2.358033, 1, 0, 0.8392157, 1,
1.121814, 0.06469573, 0.9294461, 1, 0, 0.8352941, 1,
1.127788, 0.008644399, 0.9154506, 1, 0, 0.827451, 1,
1.127902, -0.02024651, 2.196172, 1, 0, 0.8235294, 1,
1.129189, -1.181107, 2.373346, 1, 0, 0.8156863, 1,
1.137397, -0.7726792, 0.6656327, 1, 0, 0.8117647, 1,
1.147617, 1.238941, 0.6881155, 1, 0, 0.8039216, 1,
1.154135, 0.5439495, 1.269328, 1, 0, 0.7960784, 1,
1.155688, 0.7944673, 1.289682, 1, 0, 0.7921569, 1,
1.155807, 2.541729, -0.1722543, 1, 0, 0.7843137, 1,
1.162893, -0.7451816, 0.06308739, 1, 0, 0.7803922, 1,
1.170743, -1.179244, 3.347575, 1, 0, 0.772549, 1,
1.173221, -0.5148038, 1.098291, 1, 0, 0.7686275, 1,
1.177886, 1.170693, -0.1009333, 1, 0, 0.7607843, 1,
1.195036, -0.8709865, 1.035309, 1, 0, 0.7568628, 1,
1.199941, -1.050331, 1.562966, 1, 0, 0.7490196, 1,
1.203057, 1.221091, 0.7948215, 1, 0, 0.7450981, 1,
1.204648, -0.195422, 3.78247, 1, 0, 0.7372549, 1,
1.209824, -1.262277, 2.787246, 1, 0, 0.7333333, 1,
1.212988, 0.4729996, 1.287442, 1, 0, 0.7254902, 1,
1.217722, -0.3697041, 2.336916, 1, 0, 0.7215686, 1,
1.218274, 0.7183377, 1.729125, 1, 0, 0.7137255, 1,
1.219593, -0.5845522, 2.153308, 1, 0, 0.7098039, 1,
1.221441, -2.454883, 2.100975, 1, 0, 0.7019608, 1,
1.235085, -0.2395945, 2.269382, 1, 0, 0.6941177, 1,
1.235618, 0.6807234, 1.870043, 1, 0, 0.6901961, 1,
1.238682, 0.9178713, 1.527837, 1, 0, 0.682353, 1,
1.239417, -0.7919266, 1.910384, 1, 0, 0.6784314, 1,
1.247613, -0.2524378, 1.496561, 1, 0, 0.6705883, 1,
1.248737, 0.768193, 1.493717, 1, 0, 0.6666667, 1,
1.249088, -0.9083093, 2.494107, 1, 0, 0.6588235, 1,
1.252841, -0.07573323, 1.746933, 1, 0, 0.654902, 1,
1.256005, 1.024156, 2.653616, 1, 0, 0.6470588, 1,
1.256588, -1.649611, 4.259526, 1, 0, 0.6431373, 1,
1.26196, -0.3385508, 1.541123, 1, 0, 0.6352941, 1,
1.265373, 0.7713131, 0.5469481, 1, 0, 0.6313726, 1,
1.2655, 0.08399, 1.764909, 1, 0, 0.6235294, 1,
1.265602, -1.732586, 1.963097, 1, 0, 0.6196079, 1,
1.27101, -0.7316227, 2.761291, 1, 0, 0.6117647, 1,
1.276076, 1.614678, 0.3619372, 1, 0, 0.6078432, 1,
1.290307, 0.2996248, 1.775909, 1, 0, 0.6, 1,
1.31343, 0.1861295, 2.346414, 1, 0, 0.5921569, 1,
1.314732, -1.572044, 2.022545, 1, 0, 0.5882353, 1,
1.317404, -0.5643427, 2.998906, 1, 0, 0.5803922, 1,
1.325925, -0.2570773, 2.172199, 1, 0, 0.5764706, 1,
1.341866, 1.318244, 0.604171, 1, 0, 0.5686275, 1,
1.34481, -0.7351513, 1.698813, 1, 0, 0.5647059, 1,
1.349308, 1.047675, 0.03266709, 1, 0, 0.5568628, 1,
1.360901, -1.986437, 0.6406859, 1, 0, 0.5529412, 1,
1.378802, 0.5578551, 0.4619897, 1, 0, 0.5450981, 1,
1.384113, -0.1102226, 3.374697, 1, 0, 0.5411765, 1,
1.389778, -0.1466964, 2.984149, 1, 0, 0.5333334, 1,
1.390236, -1.006913, 1.640227, 1, 0, 0.5294118, 1,
1.402926, 0.5960658, 0.9242531, 1, 0, 0.5215687, 1,
1.404336, 0.00106383, 2.672676, 1, 0, 0.5176471, 1,
1.407207, 0.475949, 0.4472291, 1, 0, 0.509804, 1,
1.408242, -1.297666, 2.892138, 1, 0, 0.5058824, 1,
1.408407, -0.6331703, 3.840687, 1, 0, 0.4980392, 1,
1.409585, 0.1480199, 1.886445, 1, 0, 0.4901961, 1,
1.423607, 1.258424, 1.498219, 1, 0, 0.4862745, 1,
1.426686, 0.8194627, 0.8610242, 1, 0, 0.4784314, 1,
1.428568, 1.291114, 2.129194, 1, 0, 0.4745098, 1,
1.432121, -1.220827, 2.253067, 1, 0, 0.4666667, 1,
1.434191, -1.21641, 0.323234, 1, 0, 0.4627451, 1,
1.443255, -1.093292, 2.259467, 1, 0, 0.454902, 1,
1.446587, 1.318127, 2.194877, 1, 0, 0.4509804, 1,
1.453651, -0.4347952, 3.190682, 1, 0, 0.4431373, 1,
1.460298, 0.4539902, 1.494942, 1, 0, 0.4392157, 1,
1.468294, -1.897713, 2.201608, 1, 0, 0.4313726, 1,
1.484289, -0.5316949, 0.5369024, 1, 0, 0.427451, 1,
1.51047, -1.228464, 2.539823, 1, 0, 0.4196078, 1,
1.510506, -1.501425, 3.606014, 1, 0, 0.4156863, 1,
1.51549, -0.1432644, 0.9031292, 1, 0, 0.4078431, 1,
1.520969, 0.7144305, -0.9386328, 1, 0, 0.4039216, 1,
1.526519, 2.005077, 0.8057271, 1, 0, 0.3960784, 1,
1.531212, -0.6389359, 1.028605, 1, 0, 0.3882353, 1,
1.536278, 0.9682885, 1.689385, 1, 0, 0.3843137, 1,
1.551874, -0.7966104, 2.10447, 1, 0, 0.3764706, 1,
1.563848, 0.6658345, 1.065906, 1, 0, 0.372549, 1,
1.584983, 0.5030913, 0.5859468, 1, 0, 0.3647059, 1,
1.590975, -0.6936122, 2.351231, 1, 0, 0.3607843, 1,
1.597713, 3.391609, 0.3845429, 1, 0, 0.3529412, 1,
1.598876, -1.10247, 2.301471, 1, 0, 0.3490196, 1,
1.607446, -0.9279698, 0.7619467, 1, 0, 0.3411765, 1,
1.609609, -0.3041342, 1.89128, 1, 0, 0.3372549, 1,
1.615077, 0.8822114, 2.009862, 1, 0, 0.3294118, 1,
1.616404, -0.3839602, 3.041368, 1, 0, 0.3254902, 1,
1.62142, 0.2899737, 0.7833118, 1, 0, 0.3176471, 1,
1.633443, -1.784048, 1.599443, 1, 0, 0.3137255, 1,
1.640304, -0.8940453, 2.994871, 1, 0, 0.3058824, 1,
1.661926, -0.01628083, 0.02044002, 1, 0, 0.2980392, 1,
1.671033, -1.056574, 2.331812, 1, 0, 0.2941177, 1,
1.672323, 0.1855782, 2.605889, 1, 0, 0.2862745, 1,
1.678811, -0.7597812, 2.470558, 1, 0, 0.282353, 1,
1.682724, 0.4796606, 0.9920165, 1, 0, 0.2745098, 1,
1.691552, -0.5403774, 1.361856, 1, 0, 0.2705882, 1,
1.702575, -0.7073538, 2.276423, 1, 0, 0.2627451, 1,
1.723688, -0.7165243, 1.245479, 1, 0, 0.2588235, 1,
1.728449, -2.639936, 2.44974, 1, 0, 0.2509804, 1,
1.73168, -0.5838594, 2.009022, 1, 0, 0.2470588, 1,
1.742843, -0.5203474, 2.310181, 1, 0, 0.2392157, 1,
1.75105, -1.73271, 4.334236, 1, 0, 0.2352941, 1,
1.763744, 0.8357176, 1.656708, 1, 0, 0.227451, 1,
1.764014, -0.9080598, 1.63472, 1, 0, 0.2235294, 1,
1.765912, -2.008945, 3.082741, 1, 0, 0.2156863, 1,
1.774613, 1.837233, -0.06506479, 1, 0, 0.2117647, 1,
1.792798, 1.899444, 1.471424, 1, 0, 0.2039216, 1,
1.798638, 0.7570726, -0.08959309, 1, 0, 0.1960784, 1,
1.799151, -0.7905594, 1.877789, 1, 0, 0.1921569, 1,
1.820174, 0.5666645, 0.7665039, 1, 0, 0.1843137, 1,
1.860177, 0.2206647, 1.230993, 1, 0, 0.1803922, 1,
1.874951, -1.88236, 2.317791, 1, 0, 0.172549, 1,
1.879995, -0.8482744, 1.27677, 1, 0, 0.1686275, 1,
1.88048, 0.7878594, -0.5755107, 1, 0, 0.1607843, 1,
1.893792, 0.2603619, 3.114116, 1, 0, 0.1568628, 1,
1.897404, -1.131154, -0.8070356, 1, 0, 0.1490196, 1,
1.898744, -2.891359, 3.262422, 1, 0, 0.145098, 1,
1.913136, 1.482584, 1.21138, 1, 0, 0.1372549, 1,
1.94148, -0.03791013, 2.129485, 1, 0, 0.1333333, 1,
1.960896, -1.461016, 1.456554, 1, 0, 0.1254902, 1,
1.981357, 2.039427, -0.227707, 1, 0, 0.1215686, 1,
1.98544, -0.3964892, 1.15986, 1, 0, 0.1137255, 1,
1.996585, 0.8880211, 1.562064, 1, 0, 0.1098039, 1,
2.042298, -0.1264754, 0.6781555, 1, 0, 0.1019608, 1,
2.121236, -1.722022, 2.750327, 1, 0, 0.09411765, 1,
2.143096, -0.01334674, 2.189091, 1, 0, 0.09019608, 1,
2.161979, -0.3818212, 0.6171685, 1, 0, 0.08235294, 1,
2.199366, -1.034679, 0.9254577, 1, 0, 0.07843138, 1,
2.222727, 0.2278969, 1.547368, 1, 0, 0.07058824, 1,
2.234905, 0.3700346, 0.55795, 1, 0, 0.06666667, 1,
2.246776, -0.9032422, 1.241852, 1, 0, 0.05882353, 1,
2.300895, -0.5108409, 2.107791, 1, 0, 0.05490196, 1,
2.340136, -2.393249, 1.76818, 1, 0, 0.04705882, 1,
2.505796, -0.7289749, 2.006088, 1, 0, 0.04313726, 1,
2.631596, 0.7214037, 0.6592635, 1, 0, 0.03529412, 1,
2.672324, -0.6413291, 2.793102, 1, 0, 0.03137255, 1,
2.685826, -0.04340199, 2.443071, 1, 0, 0.02352941, 1,
2.759932, 1.360765, -1.018469, 1, 0, 0.01960784, 1,
2.944485, -2.184218, 3.706534, 1, 0, 0.01176471, 1,
3.112847, -0.3690264, 2.17099, 1, 0, 0.007843138, 1
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
-0.1916132, -5.18135, -6.975211, 0, -0.5, 0.5, 0.5,
-0.1916132, -5.18135, -6.975211, 1, -0.5, 0.5, 0.5,
-0.1916132, -5.18135, -6.975211, 1, 1.5, 0.5, 0.5,
-0.1916132, -5.18135, -6.975211, 0, 1.5, 0.5, 0.5
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
-4.616285, -0.2736152, -6.975211, 0, -0.5, 0.5, 0.5,
-4.616285, -0.2736152, -6.975211, 1, -0.5, 0.5, 0.5,
-4.616285, -0.2736152, -6.975211, 1, 1.5, 0.5, 0.5,
-4.616285, -0.2736152, -6.975211, 0, 1.5, 0.5, 0.5
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
-4.616285, -5.18135, 0.2306423, 0, -0.5, 0.5, 0.5,
-4.616285, -5.18135, 0.2306423, 1, -0.5, 0.5, 0.5,
-4.616285, -5.18135, 0.2306423, 1, 1.5, 0.5, 0.5,
-4.616285, -5.18135, 0.2306423, 0, 1.5, 0.5, 0.5
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
-3, -4.048796, -5.312322,
3, -4.048796, -5.312322,
-3, -4.048796, -5.312322,
-3, -4.237555, -5.58947,
-2, -4.048796, -5.312322,
-2, -4.237555, -5.58947,
-1, -4.048796, -5.312322,
-1, -4.237555, -5.58947,
0, -4.048796, -5.312322,
0, -4.237555, -5.58947,
1, -4.048796, -5.312322,
1, -4.237555, -5.58947,
2, -4.048796, -5.312322,
2, -4.237555, -5.58947,
3, -4.048796, -5.312322,
3, -4.237555, -5.58947
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
-3, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
-3, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
-3, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
-3, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
-2, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
-2, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
-2, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
-2, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
-1, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
-1, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
-1, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
-1, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
0, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
0, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
0, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
0, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
1, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
1, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
1, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
1, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
2, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
2, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
2, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
2, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5,
3, -4.615073, -6.143766, 0, -0.5, 0.5, 0.5,
3, -4.615073, -6.143766, 1, -0.5, 0.5, 0.5,
3, -4.615073, -6.143766, 1, 1.5, 0.5, 0.5,
3, -4.615073, -6.143766, 0, 1.5, 0.5, 0.5
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
-3.595207, -2, -5.312322,
-3.595207, 2, -5.312322,
-3.595207, -2, -5.312322,
-3.765387, -2, -5.58947,
-3.595207, 0, -5.312322,
-3.765387, 0, -5.58947,
-3.595207, 2, -5.312322,
-3.765387, 2, -5.58947
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
-4.105746, -2, -6.143766, 0, -0.5, 0.5, 0.5,
-4.105746, -2, -6.143766, 1, -0.5, 0.5, 0.5,
-4.105746, -2, -6.143766, 1, 1.5, 0.5, 0.5,
-4.105746, -2, -6.143766, 0, 1.5, 0.5, 0.5,
-4.105746, 0, -6.143766, 0, -0.5, 0.5, 0.5,
-4.105746, 0, -6.143766, 1, -0.5, 0.5, 0.5,
-4.105746, 0, -6.143766, 1, 1.5, 0.5, 0.5,
-4.105746, 0, -6.143766, 0, 1.5, 0.5, 0.5,
-4.105746, 2, -6.143766, 0, -0.5, 0.5, 0.5,
-4.105746, 2, -6.143766, 1, -0.5, 0.5, 0.5,
-4.105746, 2, -6.143766, 1, 1.5, 0.5, 0.5,
-4.105746, 2, -6.143766, 0, 1.5, 0.5, 0.5
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
-3.595207, -4.048796, -4,
-3.595207, -4.048796, 4,
-3.595207, -4.048796, -4,
-3.765387, -4.237555, -4,
-3.595207, -4.048796, -2,
-3.765387, -4.237555, -2,
-3.595207, -4.048796, 0,
-3.765387, -4.237555, 0,
-3.595207, -4.048796, 2,
-3.765387, -4.237555, 2,
-3.595207, -4.048796, 4,
-3.765387, -4.237555, 4
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
-4.105746, -4.615073, -4, 0, -0.5, 0.5, 0.5,
-4.105746, -4.615073, -4, 1, -0.5, 0.5, 0.5,
-4.105746, -4.615073, -4, 1, 1.5, 0.5, 0.5,
-4.105746, -4.615073, -4, 0, 1.5, 0.5, 0.5,
-4.105746, -4.615073, -2, 0, -0.5, 0.5, 0.5,
-4.105746, -4.615073, -2, 1, -0.5, 0.5, 0.5,
-4.105746, -4.615073, -2, 1, 1.5, 0.5, 0.5,
-4.105746, -4.615073, -2, 0, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 0, 0, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 0, 1, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 0, 1, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 0, 0, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 2, 0, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 2, 1, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 2, 1, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 2, 0, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 4, 0, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 4, 1, -0.5, 0.5, 0.5,
-4.105746, -4.615073, 4, 1, 1.5, 0.5, 0.5,
-4.105746, -4.615073, 4, 0, 1.5, 0.5, 0.5
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
-3.595207, -4.048796, -5.312322,
-3.595207, 3.501565, -5.312322,
-3.595207, -4.048796, 5.773606,
-3.595207, 3.501565, 5.773606,
-3.595207, -4.048796, -5.312322,
-3.595207, -4.048796, 5.773606,
-3.595207, 3.501565, -5.312322,
-3.595207, 3.501565, 5.773606,
-3.595207, -4.048796, -5.312322,
3.211981, -4.048796, -5.312322,
-3.595207, -4.048796, 5.773606,
3.211981, -4.048796, 5.773606,
-3.595207, 3.501565, -5.312322,
3.211981, 3.501565, -5.312322,
-3.595207, 3.501565, 5.773606,
3.211981, 3.501565, 5.773606,
3.211981, -4.048796, -5.312322,
3.211981, 3.501565, -5.312322,
3.211981, -4.048796, 5.773606,
3.211981, 3.501565, 5.773606,
3.211981, -4.048796, -5.312322,
3.211981, -4.048796, 5.773606,
3.211981, 3.501565, -5.312322,
3.211981, 3.501565, 5.773606
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
var radius = 8.031813;
var distance = 35.73444;
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
mvMatrix.translate( 0.1916132, 0.2736152, -0.2306423 );
mvMatrix.scale( 1.275733, 1.150164, 0.7833493 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73444);
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
formaldehyde_methane<-read.table("formaldehyde_methane.xyz", skip=1)
```

```
## Error in read.table("formaldehyde_methane.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-formaldehyde_methane$V2
```

```
## Error in eval(expr, envir, enclos): object 'formaldehyde_methane' not found
```

```r
y<-formaldehyde_methane$V3
```

```
## Error in eval(expr, envir, enclos): object 'formaldehyde_methane' not found
```

```r
z<-formaldehyde_methane$V4
```

```
## Error in eval(expr, envir, enclos): object 'formaldehyde_methane' not found
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
-3.496073, -1.330774, -1.641582, 0, 0, 1, 1, 1,
-2.925154, 1.078084, -1.277778, 1, 0, 0, 1, 1,
-2.894745, -1.865727, -1.949595, 1, 0, 0, 1, 1,
-2.735377, -1.346688, -2.210911, 1, 0, 0, 1, 1,
-2.432535, -0.5045946, -0.2490846, 1, 0, 0, 1, 1,
-2.352306, -0.3928868, -0.4839132, 1, 0, 0, 1, 1,
-2.344836, -2.839692, -2.01441, 0, 0, 0, 1, 1,
-2.291167, 0.4864773, -1.627761, 0, 0, 0, 1, 1,
-2.288845, -0.1407895, 1.390271, 0, 0, 0, 1, 1,
-2.234883, -0.3846633, -2.426492, 0, 0, 0, 1, 1,
-2.233355, 0.9577591, -0.2651564, 0, 0, 0, 1, 1,
-2.201473, -1.112215, -2.263329, 0, 0, 0, 1, 1,
-2.17751, -0.6521411, -2.316045, 0, 0, 0, 1, 1,
-2.142549, 0.4307934, -2.095432, 1, 1, 1, 1, 1,
-2.096238, 1.018507, 0.6566869, 1, 1, 1, 1, 1,
-2.07418, 0.1852857, -1.497377, 1, 1, 1, 1, 1,
-2.062181, 0.9952304, -0.8539803, 1, 1, 1, 1, 1,
-2.025114, -0.359169, -2.121021, 1, 1, 1, 1, 1,
-2.016889, -0.1841059, -2.199982, 1, 1, 1, 1, 1,
-2.003702, 1.666002, -1.154875, 1, 1, 1, 1, 1,
-1.959243, 0.7511492, 0.03547101, 1, 1, 1, 1, 1,
-1.957608, 0.3693752, -1.95001, 1, 1, 1, 1, 1,
-1.94336, -1.114804, -3.270625, 1, 1, 1, 1, 1,
-1.925694, -0.01803027, -1.158694, 1, 1, 1, 1, 1,
-1.925214, -1.326733, -4.062514, 1, 1, 1, 1, 1,
-1.920879, -1.631222, -3.731528, 1, 1, 1, 1, 1,
-1.907802, -0.08247181, -1.458695, 1, 1, 1, 1, 1,
-1.882121, -0.480888, -2.469609, 1, 1, 1, 1, 1,
-1.853181, -0.550328, -0.9175653, 0, 0, 1, 1, 1,
-1.851902, 0.4162364, 0.7223563, 1, 0, 0, 1, 1,
-1.835696, -0.8057367, -0.7789373, 1, 0, 0, 1, 1,
-1.821458, -0.3342322, -1.547988, 1, 0, 0, 1, 1,
-1.818586, 0.5546144, -2.008595, 1, 0, 0, 1, 1,
-1.780371, 0.2997444, -0.7039346, 1, 0, 0, 1, 1,
-1.745055, 0.1446559, -1.988389, 0, 0, 0, 1, 1,
-1.736957, -0.6577592, -1.909463, 0, 0, 0, 1, 1,
-1.723979, 0.8435533, -1.585147, 0, 0, 0, 1, 1,
-1.707022, 1.77531, -2.012147, 0, 0, 0, 1, 1,
-1.698441, -0.006586895, -1.122703, 0, 0, 0, 1, 1,
-1.695973, -0.7358829, -3.249459, 0, 0, 0, 1, 1,
-1.676984, 0.3260565, -1.366489, 0, 0, 0, 1, 1,
-1.670328, 1.239374, -1.978714, 1, 1, 1, 1, 1,
-1.658442, 1.387984, -1.601069, 1, 1, 1, 1, 1,
-1.647861, -0.3303008, -2.348933, 1, 1, 1, 1, 1,
-1.644006, 1.01763, -0.8567916, 1, 1, 1, 1, 1,
-1.641701, 0.008267913, -2.436226, 1, 1, 1, 1, 1,
-1.639216, 1.058693, 1.217988, 1, 1, 1, 1, 1,
-1.632287, 2.311213, -1.835445, 1, 1, 1, 1, 1,
-1.631293, -1.336063, -3.884045, 1, 1, 1, 1, 1,
-1.62406, -0.7201589, -0.8987685, 1, 1, 1, 1, 1,
-1.623368, -2.60882, -2.359258, 1, 1, 1, 1, 1,
-1.621327, -1.070917, -2.623701, 1, 1, 1, 1, 1,
-1.595143, -0.1523463, -3.530631, 1, 1, 1, 1, 1,
-1.587722, -1.186015, -2.572261, 1, 1, 1, 1, 1,
-1.586317, 1.063576, -0.94579, 1, 1, 1, 1, 1,
-1.558357, -1.686059, -1.625726, 1, 1, 1, 1, 1,
-1.554859, -2.13402, -2.113198, 0, 0, 1, 1, 1,
-1.546968, 0.7113891, -0.1633045, 1, 0, 0, 1, 1,
-1.545974, 0.06441957, -3.036566, 1, 0, 0, 1, 1,
-1.545919, 1.171787, 0.6754191, 1, 0, 0, 1, 1,
-1.536847, -0.8886467, -0.5696073, 1, 0, 0, 1, 1,
-1.524571, 1.154607, -1.174002, 1, 0, 0, 1, 1,
-1.521403, 0.181354, -1.717333, 0, 0, 0, 1, 1,
-1.50446, 0.6708387, 0.2903272, 0, 0, 0, 1, 1,
-1.499285, 1.19101, -1.511872, 0, 0, 0, 1, 1,
-1.499012, -1.094417, 0.4943639, 0, 0, 0, 1, 1,
-1.490099, -0.9357753, -2.063339, 0, 0, 0, 1, 1,
-1.480791, 0.9689204, -1.161447, 0, 0, 0, 1, 1,
-1.468981, 0.05344458, -0.9026282, 0, 0, 0, 1, 1,
-1.467032, 1.292485, 1.255169, 1, 1, 1, 1, 1,
-1.450217, -1.97622, -1.630487, 1, 1, 1, 1, 1,
-1.447644, 0.1081809, -1.297878, 1, 1, 1, 1, 1,
-1.441484, -0.8752584, -1.601417, 1, 1, 1, 1, 1,
-1.429913, -0.1788055, -2.412296, 1, 1, 1, 1, 1,
-1.417644, -0.9277374, -4.098041, 1, 1, 1, 1, 1,
-1.415546, -1.739671, -3.45824, 1, 1, 1, 1, 1,
-1.409681, 0.1570022, -0.2702543, 1, 1, 1, 1, 1,
-1.40781, 1.447797, -1.424226, 1, 1, 1, 1, 1,
-1.393877, 1.131808, -0.3205112, 1, 1, 1, 1, 1,
-1.392737, -0.4647534, -1.693469, 1, 1, 1, 1, 1,
-1.381533, -2.936811, -2.448898, 1, 1, 1, 1, 1,
-1.376485, -1.411227, -4.453293, 1, 1, 1, 1, 1,
-1.364583, -0.4331027, -1.237971, 1, 1, 1, 1, 1,
-1.349195, -0.4425558, -2.014108, 1, 1, 1, 1, 1,
-1.340859, -0.8155223, -1.273838, 0, 0, 1, 1, 1,
-1.339609, -1.00203, -0.5332672, 1, 0, 0, 1, 1,
-1.333559, 0.1210474, -0.2557522, 1, 0, 0, 1, 1,
-1.326414, 0.310233, -0.3996684, 1, 0, 0, 1, 1,
-1.320375, -0.0745306, -0.8793881, 1, 0, 0, 1, 1,
-1.311465, 0.05259142, -1.407015, 1, 0, 0, 1, 1,
-1.310611, 0.4252864, -2.022045, 0, 0, 0, 1, 1,
-1.29867, 0.1004405, -0.8364175, 0, 0, 0, 1, 1,
-1.292205, 0.1321308, -0.3823606, 0, 0, 0, 1, 1,
-1.291157, -0.3806947, -3.450019, 0, 0, 0, 1, 1,
-1.287521, -1.020537, -2.884567, 0, 0, 0, 1, 1,
-1.284396, 1.541532, -1.42175, 0, 0, 0, 1, 1,
-1.283929, -1.135504, -2.778858, 0, 0, 0, 1, 1,
-1.27955, 0.400487, -0.418085, 1, 1, 1, 1, 1,
-1.274587, 0.4004787, -0.9868743, 1, 1, 1, 1, 1,
-1.269524, -1.483223, -4.854533, 1, 1, 1, 1, 1,
-1.268037, -0.1249619, -1.73725, 1, 1, 1, 1, 1,
-1.266879, 0.7468046, -1.470486, 1, 1, 1, 1, 1,
-1.266424, 0.8752244, 0.1038637, 1, 1, 1, 1, 1,
-1.257873, -2.632065, -2.311453, 1, 1, 1, 1, 1,
-1.252881, -0.9125196, -2.817511, 1, 1, 1, 1, 1,
-1.248031, 0.8683325, -1.338069, 1, 1, 1, 1, 1,
-1.247587, -0.5504889, -1.898056, 1, 1, 1, 1, 1,
-1.236165, -0.04939651, -2.50919, 1, 1, 1, 1, 1,
-1.235265, -0.4258148, -0.8883994, 1, 1, 1, 1, 1,
-1.228999, 0.5705879, -2.241187, 1, 1, 1, 1, 1,
-1.227885, 1.021623, -1.007811, 1, 1, 1, 1, 1,
-1.20846, -0.3424805, -2.954264, 1, 1, 1, 1, 1,
-1.201945, 0.1223903, -1.18618, 0, 0, 1, 1, 1,
-1.198288, -1.32573, -3.918434, 1, 0, 0, 1, 1,
-1.195103, 1.3845, -0.7072207, 1, 0, 0, 1, 1,
-1.177313, -0.03615775, -1.805602, 1, 0, 0, 1, 1,
-1.161581, -2.023707, -2.864477, 1, 0, 0, 1, 1,
-1.137766, 0.7171643, -0.9807674, 1, 0, 0, 1, 1,
-1.133954, -1.120352, -0.8359296, 0, 0, 0, 1, 1,
-1.132802, -0.6938832, -1.97811, 0, 0, 0, 1, 1,
-1.12614, 1.173664, -2.279001, 0, 0, 0, 1, 1,
-1.125829, -1.419787, -3.461686, 0, 0, 0, 1, 1,
-1.118022, -0.2026392, -0.8534666, 0, 0, 0, 1, 1,
-1.117935, 0.4095163, -2.015393, 0, 0, 0, 1, 1,
-1.11461, 1.41139, -1.95861, 0, 0, 0, 1, 1,
-1.113226, -0.3334368, -2.470914, 1, 1, 1, 1, 1,
-1.110888, -1.184949, -2.163198, 1, 1, 1, 1, 1,
-1.102134, -0.4375598, -1.435642, 1, 1, 1, 1, 1,
-1.101593, 0.3835871, -0.169131, 1, 1, 1, 1, 1,
-1.100891, 0.4111484, 0.8312481, 1, 1, 1, 1, 1,
-1.095946, -0.912791, -3.06774, 1, 1, 1, 1, 1,
-1.085883, 0.1583216, 1.035376, 1, 1, 1, 1, 1,
-1.084075, -1.04018, -2.871304, 1, 1, 1, 1, 1,
-1.079479, -0.5904338, -0.9238327, 1, 1, 1, 1, 1,
-1.075211, -1.488357, -0.6287469, 1, 1, 1, 1, 1,
-1.074929, 1.189437, -2.075296, 1, 1, 1, 1, 1,
-1.074385, 1.442839, 0.1416717, 1, 1, 1, 1, 1,
-1.071151, -0.147828, -1.728719, 1, 1, 1, 1, 1,
-1.06874, 1.360121, 0.3447702, 1, 1, 1, 1, 1,
-1.066673, -0.1433211, -0.4498463, 1, 1, 1, 1, 1,
-1.061333, -0.7402193, -3.611678, 0, 0, 1, 1, 1,
-1.060874, 1.683998, -0.997268, 1, 0, 0, 1, 1,
-1.058834, -0.7068922, -1.804836, 1, 0, 0, 1, 1,
-1.053374, -0.6396301, -2.692217, 1, 0, 0, 1, 1,
-1.049289, 0.09280273, -0.1489542, 1, 0, 0, 1, 1,
-1.044581, -0.2070579, -2.634925, 1, 0, 0, 1, 1,
-1.04295, 0.4354188, -1.562658, 0, 0, 0, 1, 1,
-1.042198, -1.2486, -2.3288, 0, 0, 0, 1, 1,
-1.040552, -2.263766, -3.49177, 0, 0, 0, 1, 1,
-1.021138, -0.3003329, -2.71111, 0, 0, 0, 1, 1,
-1.019215, -0.03795639, -3.089052, 0, 0, 0, 1, 1,
-1.018211, 1.016005, 0.4014963, 0, 0, 0, 1, 1,
-1.016282, 0.6699817, -1.221881, 0, 0, 0, 1, 1,
-1.01299, -0.4629493, -2.127529, 1, 1, 1, 1, 1,
-1.005798, 0.1468507, -1.428259, 1, 1, 1, 1, 1,
-1.00525, -0.5502008, -2.259217, 1, 1, 1, 1, 1,
-1.002097, -0.9498406, -2.639078, 1, 1, 1, 1, 1,
-0.9986767, 0.1548447, -0.01769344, 1, 1, 1, 1, 1,
-0.9977462, 1.745963, -0.09497774, 1, 1, 1, 1, 1,
-0.9972957, 2.896056, -0.3548717, 1, 1, 1, 1, 1,
-0.9956716, -2.204475, -1.499943, 1, 1, 1, 1, 1,
-0.9878496, -1.826748, -3.211793, 1, 1, 1, 1, 1,
-0.9853012, -1.115155, -2.270661, 1, 1, 1, 1, 1,
-0.9781556, -0.1934847, -1.471862, 1, 1, 1, 1, 1,
-0.9751605, 1.222537, -0.4847095, 1, 1, 1, 1, 1,
-0.9744171, 1.451615, -2.211036, 1, 1, 1, 1, 1,
-0.9672443, 1.376834, -2.508798, 1, 1, 1, 1, 1,
-0.9639742, -2.145145, -1.506071, 1, 1, 1, 1, 1,
-0.9607962, 0.08239318, -1.309212, 0, 0, 1, 1, 1,
-0.9498647, 0.7126637, 0.8895406, 1, 0, 0, 1, 1,
-0.9429544, -0.1370414, -3.094179, 1, 0, 0, 1, 1,
-0.940555, 0.3731433, 1.185225, 1, 0, 0, 1, 1,
-0.9405147, 0.7328793, 0.4214033, 1, 0, 0, 1, 1,
-0.9395562, -0.703608, -2.809364, 1, 0, 0, 1, 1,
-0.9341731, 0.4976483, 0.06673418, 0, 0, 0, 1, 1,
-0.9331911, 1.049807, 0.009194545, 0, 0, 0, 1, 1,
-0.9282666, -0.1235231, -2.879306, 0, 0, 0, 1, 1,
-0.9277975, -0.146366, -1.663238, 0, 0, 0, 1, 1,
-0.923562, -0.4533945, -0.008686596, 0, 0, 0, 1, 1,
-0.9230076, 0.876848, -0.09788738, 0, 0, 0, 1, 1,
-0.9229844, -0.6351032, -1.665841, 0, 0, 0, 1, 1,
-0.917209, -2.475778, -3.585493, 1, 1, 1, 1, 1,
-0.9155708, 1.073797, 0.05122472, 1, 1, 1, 1, 1,
-0.9110017, -1.513258, -2.723851, 1, 1, 1, 1, 1,
-0.9089644, -0.5335414, -2.700743, 1, 1, 1, 1, 1,
-0.9056945, 0.5103024, -0.7944778, 1, 1, 1, 1, 1,
-0.9051459, -1.261331, -2.277117, 1, 1, 1, 1, 1,
-0.904923, -2.440412, -2.847082, 1, 1, 1, 1, 1,
-0.9041504, -0.4285795, -1.900556, 1, 1, 1, 1, 1,
-0.8938538, -0.1621417, -1.998722, 1, 1, 1, 1, 1,
-0.8937698, 0.9161606, -1.086372, 1, 1, 1, 1, 1,
-0.8926381, 0.3084733, -2.312877, 1, 1, 1, 1, 1,
-0.8840776, 0.8823397, -2.810077, 1, 1, 1, 1, 1,
-0.8807157, 1.385012, 1.328691, 1, 1, 1, 1, 1,
-0.8766236, -1.152223, -1.473518, 1, 1, 1, 1, 1,
-0.8753692, 0.2408757, -2.647713, 1, 1, 1, 1, 1,
-0.87487, -0.2644472, -3.167193, 0, 0, 1, 1, 1,
-0.8703806, 1.694087, -0.4876609, 1, 0, 0, 1, 1,
-0.8639495, 0.7527899, -0.1392964, 1, 0, 0, 1, 1,
-0.8609892, -0.7860669, -1.333526, 1, 0, 0, 1, 1,
-0.8609543, 0.3293026, 0.2896316, 1, 0, 0, 1, 1,
-0.8593298, -0.5186225, -3.543222, 1, 0, 0, 1, 1,
-0.8580458, -0.1701883, -2.488306, 0, 0, 0, 1, 1,
-0.8572901, -0.7868321, -4.023023, 0, 0, 0, 1, 1,
-0.8560616, 0.08271338, -0.8188693, 0, 0, 0, 1, 1,
-0.8517569, 0.393879, -0.5223757, 0, 0, 0, 1, 1,
-0.8508776, 1.16613, -0.4619349, 0, 0, 0, 1, 1,
-0.8490763, -1.731592, -4.379703, 0, 0, 0, 1, 1,
-0.8455522, -1.681201, -3.547927, 0, 0, 0, 1, 1,
-0.8441357, 0.1364555, -1.521608, 1, 1, 1, 1, 1,
-0.836728, 1.029448, 0.7289354, 1, 1, 1, 1, 1,
-0.8321126, -1.196957, -2.834302, 1, 1, 1, 1, 1,
-0.8249326, -0.3357254, 0.05547849, 1, 1, 1, 1, 1,
-0.8235335, 1.092457, 1.302699, 1, 1, 1, 1, 1,
-0.819162, -0.6809162, -0.6299063, 1, 1, 1, 1, 1,
-0.8142144, 0.4719619, -1.10257, 1, 1, 1, 1, 1,
-0.8138958, -1.339544, -3.618611, 1, 1, 1, 1, 1,
-0.8088055, -0.02815512, -2.38874, 1, 1, 1, 1, 1,
-0.8069158, 0.6790046, 0.1727715, 1, 1, 1, 1, 1,
-0.805149, 0.3975135, -1.371513, 1, 1, 1, 1, 1,
-0.8038192, -1.216655, -2.603958, 1, 1, 1, 1, 1,
-0.7880381, 1.03829, -0.3121481, 1, 1, 1, 1, 1,
-0.787864, 2.434506, -0.8112033, 1, 1, 1, 1, 1,
-0.7825983, -1.758034, -1.263234, 1, 1, 1, 1, 1,
-0.7811285, 0.732272, -0.1766501, 0, 0, 1, 1, 1,
-0.7808188, -0.9932085, -3.441947, 1, 0, 0, 1, 1,
-0.7803003, 0.6442441, -1.564214, 1, 0, 0, 1, 1,
-0.7765038, 1.117468, -1.190174, 1, 0, 0, 1, 1,
-0.77565, -0.10235, -1.405308, 1, 0, 0, 1, 1,
-0.7750312, 1.288014, -0.8977579, 1, 0, 0, 1, 1,
-0.7740619, 0.6011815, -0.1708535, 0, 0, 0, 1, 1,
-0.7714421, 0.7939939, -0.2421194, 0, 0, 0, 1, 1,
-0.7695764, -1.93752, -2.47089, 0, 0, 0, 1, 1,
-0.7684543, -0.1688883, -2.920745, 0, 0, 0, 1, 1,
-0.7673248, -0.3889722, -3.2832, 0, 0, 0, 1, 1,
-0.7668643, -0.9905988, -1.078298, 0, 0, 0, 1, 1,
-0.7614188, 1.936506, -0.929059, 0, 0, 0, 1, 1,
-0.7609173, -1.433945, -1.886508, 1, 1, 1, 1, 1,
-0.7602402, 2.260052, 1.384235, 1, 1, 1, 1, 1,
-0.7539909, 1.63124, -0.8175294, 1, 1, 1, 1, 1,
-0.7518289, 0.5598041, -0.727957, 1, 1, 1, 1, 1,
-0.7462844, 0.2977177, -2.363837, 1, 1, 1, 1, 1,
-0.7418523, 0.2488867, 0.02265733, 1, 1, 1, 1, 1,
-0.7393563, -2.277278, -2.742461, 1, 1, 1, 1, 1,
-0.7377037, 0.07705603, -1.176733, 1, 1, 1, 1, 1,
-0.7366471, -1.103484, -1.910015, 1, 1, 1, 1, 1,
-0.7344607, -0.4359747, -4.432348, 1, 1, 1, 1, 1,
-0.7335925, -0.5867309, -2.395127, 1, 1, 1, 1, 1,
-0.7304443, -1.177884, -1.869781, 1, 1, 1, 1, 1,
-0.7268279, -1.372957, -3.781309, 1, 1, 1, 1, 1,
-0.7266022, 0.2867919, -0.7535896, 1, 1, 1, 1, 1,
-0.7231669, 0.8982586, -0.2548927, 1, 1, 1, 1, 1,
-0.7205139, -0.9059992, -1.937231, 0, 0, 1, 1, 1,
-0.7202059, 0.3828413, 0.1208219, 1, 0, 0, 1, 1,
-0.71993, 0.1198645, -1.219124, 1, 0, 0, 1, 1,
-0.7137957, 1.47053, -0.737231, 1, 0, 0, 1, 1,
-0.7130066, -2.582268, -1.345016, 1, 0, 0, 1, 1,
-0.7124406, 1.004415, 1.065554, 1, 0, 0, 1, 1,
-0.7077467, -0.3316641, -0.7635799, 0, 0, 0, 1, 1,
-0.7028659, -0.1260998, -1.211826, 0, 0, 0, 1, 1,
-0.6987027, -0.9170354, -0.8492106, 0, 0, 0, 1, 1,
-0.6958274, 0.1210841, -0.7808385, 0, 0, 0, 1, 1,
-0.6944935, -1.610786, -2.507603, 0, 0, 0, 1, 1,
-0.6913761, -0.02985572, 0.09009759, 0, 0, 0, 1, 1,
-0.6902035, -0.9829845, -2.425571, 0, 0, 0, 1, 1,
-0.6858888, -0.1404829, -2.116627, 1, 1, 1, 1, 1,
-0.6850051, 0.6350127, -0.5074689, 1, 1, 1, 1, 1,
-0.6821758, -0.1578599, -2.23515, 1, 1, 1, 1, 1,
-0.6801858, 0.9695654, -1.569789, 1, 1, 1, 1, 1,
-0.6775679, -0.3886684, -3.519543, 1, 1, 1, 1, 1,
-0.6768515, -1.905746, -3.79161, 1, 1, 1, 1, 1,
-0.6746297, 0.6064453, -0.6276691, 1, 1, 1, 1, 1,
-0.6737697, -0.1405307, -1.10602, 1, 1, 1, 1, 1,
-0.6720692, -0.9918435, -2.408392, 1, 1, 1, 1, 1,
-0.6688909, 0.597535, 0.6915385, 1, 1, 1, 1, 1,
-0.6675742, -0.1667635, -2.265555, 1, 1, 1, 1, 1,
-0.6626137, 1.591919, -0.7134607, 1, 1, 1, 1, 1,
-0.6587632, -1.637499, -2.047374, 1, 1, 1, 1, 1,
-0.6551585, 0.6472186, -1.571977, 1, 1, 1, 1, 1,
-0.6543308, -1.494972, -2.930468, 1, 1, 1, 1, 1,
-0.652787, 1.020596, 0.363198, 0, 0, 1, 1, 1,
-0.6518449, 0.2897722, -2.835949, 1, 0, 0, 1, 1,
-0.6507747, 1.000601, -0.8964821, 1, 0, 0, 1, 1,
-0.6490231, -0.3378066, -2.92092, 1, 0, 0, 1, 1,
-0.6469487, 0.9138343, 1.402139, 1, 0, 0, 1, 1,
-0.6454321, 0.2359146, -0.8574023, 1, 0, 0, 1, 1,
-0.6453126, 1.809142, 1.080542, 0, 0, 0, 1, 1,
-0.6433104, 1.178102, -2.106608, 0, 0, 0, 1, 1,
-0.6403505, -0.9181659, -4.540945, 0, 0, 0, 1, 1,
-0.6374556, -1.024784, -3.063004, 0, 0, 0, 1, 1,
-0.6308315, -1.369023, -1.113574, 0, 0, 0, 1, 1,
-0.6291177, 1.942493, 0.5062894, 0, 0, 0, 1, 1,
-0.6275436, 1.375102, 0.5326782, 0, 0, 0, 1, 1,
-0.6242563, 0.5244825, -0.3297151, 1, 1, 1, 1, 1,
-0.6207299, -0.7210773, -3.056596, 1, 1, 1, 1, 1,
-0.6172861, 0.4100059, -0.2324795, 1, 1, 1, 1, 1,
-0.6167433, 1.410281, 1.056159, 1, 1, 1, 1, 1,
-0.6106467, -1.019486, -1.935811, 1, 1, 1, 1, 1,
-0.6084267, 0.06887704, -1.732337, 1, 1, 1, 1, 1,
-0.6072358, 2.061928, -0.7432625, 1, 1, 1, 1, 1,
-0.6068487, -0.1000252, -0.1919076, 1, 1, 1, 1, 1,
-0.6061395, -2.132782, -0.2081402, 1, 1, 1, 1, 1,
-0.5993931, -0.3345345, -2.081242, 1, 1, 1, 1, 1,
-0.5933116, 0.6114122, -0.1963103, 1, 1, 1, 1, 1,
-0.5907423, 1.654247, 0.4645415, 1, 1, 1, 1, 1,
-0.590075, 1.048077, -1.17095, 1, 1, 1, 1, 1,
-0.5889335, -1.090236, -2.51105, 1, 1, 1, 1, 1,
-0.5850635, -0.4177232, -1.053483, 1, 1, 1, 1, 1,
-0.5834988, -0.0794305, -3.682466, 0, 0, 1, 1, 1,
-0.5818818, 0.7705635, 0.1708151, 1, 0, 0, 1, 1,
-0.5815381, -0.6605758, -2.552303, 1, 0, 0, 1, 1,
-0.5799029, 1.591719, 0.4591373, 1, 0, 0, 1, 1,
-0.5759445, 1.284318, -0.5436167, 1, 0, 0, 1, 1,
-0.5721375, -0.2497806, -2.968201, 1, 0, 0, 1, 1,
-0.5641899, 0.8948923, -1.956136, 0, 0, 0, 1, 1,
-0.5606167, 1.545632, 0.09828094, 0, 0, 0, 1, 1,
-0.5569024, -0.4773162, -2.8499, 0, 0, 0, 1, 1,
-0.5547758, 0.9577457, -1.036708, 0, 0, 0, 1, 1,
-0.5503741, 0.3093952, -0.915488, 0, 0, 0, 1, 1,
-0.5444641, 0.0443931, -1.499421, 0, 0, 0, 1, 1,
-0.5427321, -0.0268262, -2.133102, 0, 0, 0, 1, 1,
-0.534834, -0.249067, -2.370246, 1, 1, 1, 1, 1,
-0.5325323, 1.616017, -0.7482631, 1, 1, 1, 1, 1,
-0.5292145, 0.984293, -0.1857014, 1, 1, 1, 1, 1,
-0.5257845, 1.370596, 0.3713768, 1, 1, 1, 1, 1,
-0.5217795, -0.9189399, -2.982986, 1, 1, 1, 1, 1,
-0.5117898, -3.938839, -2.266804, 1, 1, 1, 1, 1,
-0.5046009, 0.07482166, -0.8549724, 1, 1, 1, 1, 1,
-0.503432, -0.409433, -1.279601, 1, 1, 1, 1, 1,
-0.5033254, 1.286992, -0.6460766, 1, 1, 1, 1, 1,
-0.4986424, -0.2224481, -2.931933, 1, 1, 1, 1, 1,
-0.4966974, -1.298197, -2.329326, 1, 1, 1, 1, 1,
-0.4838004, -0.02199167, -1.32009, 1, 1, 1, 1, 1,
-0.4827579, -0.666369, -2.670538, 1, 1, 1, 1, 1,
-0.4813912, 1.343698, -0.3311384, 1, 1, 1, 1, 1,
-0.474014, -0.1906138, -3.671422, 1, 1, 1, 1, 1,
-0.4710608, -0.5914125, -3.583015, 0, 0, 1, 1, 1,
-0.4661082, -1.346549, -3.249087, 1, 0, 0, 1, 1,
-0.4634493, -0.3169716, -3.853441, 1, 0, 0, 1, 1,
-0.4607092, 0.7936918, -1.048121, 1, 0, 0, 1, 1,
-0.4528691, 0.6091589, 0.5644474, 1, 0, 0, 1, 1,
-0.4498186, -0.5351058, -1.530161, 1, 0, 0, 1, 1,
-0.4479421, -0.1477783, -2.204088, 0, 0, 0, 1, 1,
-0.4456182, -0.6345169, -1.723678, 0, 0, 0, 1, 1,
-0.4423838, -1.055569, -2.082478, 0, 0, 0, 1, 1,
-0.4393275, 1.076901, -1.519427, 0, 0, 0, 1, 1,
-0.4389782, 1.287229, -0.2678167, 0, 0, 0, 1, 1,
-0.4368773, -1.708767, -2.860456, 0, 0, 0, 1, 1,
-0.4321263, 0.1660762, -1.222171, 0, 0, 0, 1, 1,
-0.4280438, 1.661698, -0.4195724, 1, 1, 1, 1, 1,
-0.4207801, 0.472917, 0.05621224, 1, 1, 1, 1, 1,
-0.4189832, 1.197712, -0.4449507, 1, 1, 1, 1, 1,
-0.4189267, 1.041974, -1.886048, 1, 1, 1, 1, 1,
-0.4176812, -0.1071715, -3.271168, 1, 1, 1, 1, 1,
-0.4176465, -0.4844534, -5.091359, 1, 1, 1, 1, 1,
-0.4158918, -1.346881, -2.615453, 1, 1, 1, 1, 1,
-0.4149719, 0.6782063, -0.08076054, 1, 1, 1, 1, 1,
-0.4119478, 0.5187358, -1.803333, 1, 1, 1, 1, 1,
-0.4111948, -0.4931529, -3.597422, 1, 1, 1, 1, 1,
-0.4057534, 0.8456334, 0.1428251, 1, 1, 1, 1, 1,
-0.405157, 1.583808, 0.07867038, 1, 1, 1, 1, 1,
-0.4023154, -0.4324587, -1.922598, 1, 1, 1, 1, 1,
-0.3971146, -0.8000571, -4.055191, 1, 1, 1, 1, 1,
-0.3955441, -1.242368, -3.207602, 1, 1, 1, 1, 1,
-0.3948584, 0.7277024, 0.33123, 0, 0, 1, 1, 1,
-0.393517, 1.179807, 0.9362933, 1, 0, 0, 1, 1,
-0.3844821, 0.6064116, 2.497854, 1, 0, 0, 1, 1,
-0.3843055, 1.616876, 0.1355911, 1, 0, 0, 1, 1,
-0.382893, -0.6189826, -4.026519, 1, 0, 0, 1, 1,
-0.3813334, 0.5933467, 0.6604688, 1, 0, 0, 1, 1,
-0.3809552, 2.325036, 0.323288, 0, 0, 0, 1, 1,
-0.3785265, -1.830255, -3.58204, 0, 0, 0, 1, 1,
-0.3776464, -1.16925, -1.38681, 0, 0, 0, 1, 1,
-0.3772188, 1.477854, -1.097345, 0, 0, 0, 1, 1,
-0.3765074, 0.8052549, 1.60816, 0, 0, 0, 1, 1,
-0.3672094, -1.840592, -0.9870734, 0, 0, 0, 1, 1,
-0.3645835, 2.640499, -0.5786936, 0, 0, 0, 1, 1,
-0.3633872, 0.8427915, -1.52138, 1, 1, 1, 1, 1,
-0.3625067, -0.281543, -2.889296, 1, 1, 1, 1, 1,
-0.3621811, -0.7607295, -4.093903, 1, 1, 1, 1, 1,
-0.3606568, 1.849369, -1.439856, 1, 1, 1, 1, 1,
-0.3586949, -0.3440881, -1.073693, 1, 1, 1, 1, 1,
-0.3573215, -1.096302, -0.5327758, 1, 1, 1, 1, 1,
-0.346752, -0.4736956, -1.834898, 1, 1, 1, 1, 1,
-0.3454257, -1.791662, -2.455867, 1, 1, 1, 1, 1,
-0.3452109, 0.5777839, -0.6487734, 1, 1, 1, 1, 1,
-0.3425318, -0.2647191, -1.56597, 1, 1, 1, 1, 1,
-0.3419535, -1.748061, -1.342111, 1, 1, 1, 1, 1,
-0.3401825, 0.2594186, -2.532077, 1, 1, 1, 1, 1,
-0.3381952, 1.432454, -0.9270076, 1, 1, 1, 1, 1,
-0.3305454, 1.429566, -1.122658, 1, 1, 1, 1, 1,
-0.3267443, 0.6016607, -0.5307667, 1, 1, 1, 1, 1,
-0.3267165, 0.02739673, -1.207107, 0, 0, 1, 1, 1,
-0.3264461, 0.127079, -2.416325, 1, 0, 0, 1, 1,
-0.31883, -1.124532, -1.385155, 1, 0, 0, 1, 1,
-0.3122519, 0.6521172, -1.004408, 1, 0, 0, 1, 1,
-0.3014434, -0.5773917, -2.124112, 1, 0, 0, 1, 1,
-0.3002578, -0.7546321, -3.130063, 1, 0, 0, 1, 1,
-0.2985616, -1.816004, -2.959382, 0, 0, 0, 1, 1,
-0.2944276, 0.7243403, 0.8907568, 0, 0, 0, 1, 1,
-0.2931804, 0.8295492, -1.086717, 0, 0, 0, 1, 1,
-0.2909727, -0.2571394, -2.784714, 0, 0, 0, 1, 1,
-0.2852198, 0.5351924, -0.0152191, 0, 0, 0, 1, 1,
-0.2835499, -0.8503069, -1.510737, 0, 0, 0, 1, 1,
-0.2833223, 0.2523875, -0.6061488, 0, 0, 0, 1, 1,
-0.2802724, -0.5252351, -3.038824, 1, 1, 1, 1, 1,
-0.2782674, 0.2760608, -0.2959749, 1, 1, 1, 1, 1,
-0.2774439, 0.1331809, -1.375967, 1, 1, 1, 1, 1,
-0.2733129, -0.9325348, -0.2945381, 1, 1, 1, 1, 1,
-0.2714454, -0.9010239, -2.393163, 1, 1, 1, 1, 1,
-0.271317, -1.402582, -3.227291, 1, 1, 1, 1, 1,
-0.2712342, 1.63993, 0.4012045, 1, 1, 1, 1, 1,
-0.2693332, 2.295707, -0.6280982, 1, 1, 1, 1, 1,
-0.2656979, 0.5225613, 0.3487735, 1, 1, 1, 1, 1,
-0.2632574, 0.8201735, -1.429764, 1, 1, 1, 1, 1,
-0.2612721, 0.1550534, -1.153063, 1, 1, 1, 1, 1,
-0.2611642, -1.443164, -4.95441, 1, 1, 1, 1, 1,
-0.2600814, 0.5582052, 1.214676, 1, 1, 1, 1, 1,
-0.2506579, 0.1678357, -0.4721717, 1, 1, 1, 1, 1,
-0.2490883, 1.689328, -1.775719, 1, 1, 1, 1, 1,
-0.2401394, -0.01911936, -1.189745, 0, 0, 1, 1, 1,
-0.2395395, -0.06061715, -2.268066, 1, 0, 0, 1, 1,
-0.2354391, 0.1584343, -1.349502, 1, 0, 0, 1, 1,
-0.2311225, -0.6553282, -2.79705, 1, 0, 0, 1, 1,
-0.2294448, 1.738585, 0.5206312, 1, 0, 0, 1, 1,
-0.229107, 1.010067, -0.5178684, 1, 0, 0, 1, 1,
-0.2248633, 0.9442371, 0.2092238, 0, 0, 0, 1, 1,
-0.2229246, -0.1171862, -1.427603, 0, 0, 0, 1, 1,
-0.2202543, 0.7230862, 0.5740123, 0, 0, 0, 1, 1,
-0.2194282, 0.620878, 1.232802, 0, 0, 0, 1, 1,
-0.2170065, -0.170149, -1.592878, 0, 0, 0, 1, 1,
-0.2119305, -0.3038827, -3.083046, 0, 0, 0, 1, 1,
-0.2106449, 2.536148, -2.008053, 0, 0, 0, 1, 1,
-0.2063779, 0.4133281, 0.1184122, 1, 1, 1, 1, 1,
-0.1884833, 0.2664843, 0.05551263, 1, 1, 1, 1, 1,
-0.1870868, 1.268524, -0.937304, 1, 1, 1, 1, 1,
-0.1851713, -0.6909871, -2.831219, 1, 1, 1, 1, 1,
-0.1842028, -0.6316304, -3.881009, 1, 1, 1, 1, 1,
-0.1804921, 0.5756834, -0.3212248, 1, 1, 1, 1, 1,
-0.1795422, 2.846754, -0.6073174, 1, 1, 1, 1, 1,
-0.1777502, 1.499846, -0.96957, 1, 1, 1, 1, 1,
-0.1776954, 0.9357491, 0.617699, 1, 1, 1, 1, 1,
-0.1763567, 0.3429639, -0.922288, 1, 1, 1, 1, 1,
-0.1731859, 0.3365553, -1.246271, 1, 1, 1, 1, 1,
-0.1730934, -0.2716739, -4.462607, 1, 1, 1, 1, 1,
-0.1691166, 1.397056, 0.1059042, 1, 1, 1, 1, 1,
-0.1686875, 0.7416173, -0.3930877, 1, 1, 1, 1, 1,
-0.1658584, 0.5633576, 1.295125, 1, 1, 1, 1, 1,
-0.16331, -0.421131, -2.089293, 0, 0, 1, 1, 1,
-0.1618965, 1.13217, -0.8989281, 1, 0, 0, 1, 1,
-0.1570104, -0.04797018, -2.545466, 1, 0, 0, 1, 1,
-0.156484, -2.405344, -4.778305, 1, 0, 0, 1, 1,
-0.1552481, 0.6130912, 1.955857, 1, 0, 0, 1, 1,
-0.1527209, -0.07837437, -0.8257143, 1, 0, 0, 1, 1,
-0.1423778, -1.116948, -2.509271, 0, 0, 0, 1, 1,
-0.1372488, 0.768516, -1.518736, 0, 0, 0, 1, 1,
-0.1369527, 1.605758, 1.16791, 0, 0, 0, 1, 1,
-0.127725, 0.06682099, -1.543277, 0, 0, 0, 1, 1,
-0.1266405, -1.169325, -2.655128, 0, 0, 0, 1, 1,
-0.1249683, 1.255639, -0.9874954, 0, 0, 0, 1, 1,
-0.1214335, 0.6143275, -0.85481, 0, 0, 0, 1, 1,
-0.117661, 0.3244256, 0.2773308, 1, 1, 1, 1, 1,
-0.1168986, 0.8516999, -1.727337, 1, 1, 1, 1, 1,
-0.1126924, -1.596484, -3.391334, 1, 1, 1, 1, 1,
-0.11133, 0.07926187, -1.141572, 1, 1, 1, 1, 1,
-0.1109527, 0.06972551, -2.012501, 1, 1, 1, 1, 1,
-0.1085306, 0.8243628, 0.5057557, 1, 1, 1, 1, 1,
-0.1062348, 2.008621, -1.08837, 1, 1, 1, 1, 1,
-0.09762182, 1.269001, 0.6549345, 1, 1, 1, 1, 1,
-0.0887091, -0.4574088, -2.042344, 1, 1, 1, 1, 1,
-0.08453143, 0.9987408, -1.618946, 1, 1, 1, 1, 1,
-0.08281671, 1.033684, 0.7660523, 1, 1, 1, 1, 1,
-0.08112218, 0.5363419, 0.3418817, 1, 1, 1, 1, 1,
-0.07759421, -0.02753229, -2.891292, 1, 1, 1, 1, 1,
-0.06886736, 0.6395205, -1.828081, 1, 1, 1, 1, 1,
-0.06774423, 0.02695828, 0.9237368, 1, 1, 1, 1, 1,
-0.06715181, 0.03341157, 0.8842003, 0, 0, 1, 1, 1,
-0.06532121, -0.0349675, -2.122147, 1, 0, 0, 1, 1,
-0.06406345, 0.3923094, 0.1135752, 1, 0, 0, 1, 1,
-0.06149944, 1.245314, -2.249187, 1, 0, 0, 1, 1,
-0.06093616, -0.8180184, -3.715018, 1, 0, 0, 1, 1,
-0.06052678, 0.2610064, 0.7857843, 1, 0, 0, 1, 1,
-0.05796546, 0.7771064, -1.205612, 0, 0, 0, 1, 1,
-0.05632417, -0.0861938, -1.835159, 0, 0, 0, 1, 1,
-0.05612394, -1.706233, -4.216728, 0, 0, 0, 1, 1,
-0.05558225, -0.7839543, -1.740909, 0, 0, 0, 1, 1,
-0.05216888, 1.474329, 1.136529, 0, 0, 0, 1, 1,
-0.05119367, 0.8656064, -1.022681, 0, 0, 0, 1, 1,
-0.05044123, -0.9558778, -5.150876, 0, 0, 0, 1, 1,
-0.05026288, 0.4592376, -0.708108, 1, 1, 1, 1, 1,
-0.04831849, -0.6438835, -1.154946, 1, 1, 1, 1, 1,
-0.04723008, -1.360461, -2.635054, 1, 1, 1, 1, 1,
-0.04452847, 0.9235455, -1.529699, 1, 1, 1, 1, 1,
-0.04289053, -0.2979713, -1.687347, 1, 1, 1, 1, 1,
-0.04003384, 0.6940463, -0.1241684, 1, 1, 1, 1, 1,
-0.03469669, 1.258512, 1.095417, 1, 1, 1, 1, 1,
-0.02922618, -0.3236099, -2.461402, 1, 1, 1, 1, 1,
-0.0287852, 1.330014, -0.514873, 1, 1, 1, 1, 1,
-0.0259837, -0.5339749, -1.621613, 1, 1, 1, 1, 1,
-0.02217748, 1.254335, 1.625225, 1, 1, 1, 1, 1,
-0.01779342, -0.4056685, -4.866894, 1, 1, 1, 1, 1,
-0.01490188, 0.6181794, -0.06869388, 1, 1, 1, 1, 1,
-0.01208098, -1.423803, -3.943769, 1, 1, 1, 1, 1,
-0.01162695, 0.9008976, 0.5992799, 1, 1, 1, 1, 1,
-0.01141693, -1.185521, -2.323646, 0, 0, 1, 1, 1,
-0.007681835, 1.128476, 0.1952268, 1, 0, 0, 1, 1,
-0.003848883, -0.7095101, -4.062825, 1, 0, 0, 1, 1,
-0.001289834, 0.4526064, -1.525671, 1, 0, 0, 1, 1,
0.0006639436, 0.0232153, 2.081106, 1, 0, 0, 1, 1,
0.001989284, 1.148258, -0.2250339, 1, 0, 0, 1, 1,
0.003818757, 0.6331118, 0.3619859, 0, 0, 0, 1, 1,
0.004126891, -0.4274983, 3.758826, 0, 0, 0, 1, 1,
0.005210251, -0.5371519, 0.2820933, 0, 0, 0, 1, 1,
0.006946136, -0.03418966, 3.186526, 0, 0, 0, 1, 1,
0.006995318, 1.51753, 1.288337, 0, 0, 0, 1, 1,
0.007385242, -0.5916818, 3.463019, 0, 0, 0, 1, 1,
0.01879697, -1.417257, 3.293035, 0, 0, 0, 1, 1,
0.01966762, -0.1625352, 4.506272, 1, 1, 1, 1, 1,
0.02293642, -0.8676362, 3.685668, 1, 1, 1, 1, 1,
0.02362524, 1.414427, 1.011452, 1, 1, 1, 1, 1,
0.02798846, 1.016185, 0.2114026, 1, 1, 1, 1, 1,
0.03111554, -0.2202095, 2.582605, 1, 1, 1, 1, 1,
0.03269205, 0.5889237, -0.05526424, 1, 1, 1, 1, 1,
0.03376681, 1.104237, 0.363832, 1, 1, 1, 1, 1,
0.03453062, -1.829145, 0.9727966, 1, 1, 1, 1, 1,
0.03627316, 0.5869545, -2.238082, 1, 1, 1, 1, 1,
0.03695463, 1.522007, 1.2465, 1, 1, 1, 1, 1,
0.03701754, 0.02052404, 2.100158, 1, 1, 1, 1, 1,
0.03871758, -1.744492, 2.075259, 1, 1, 1, 1, 1,
0.04003163, 1.850485, 0.1850106, 1, 1, 1, 1, 1,
0.04037016, 0.03631137, -0.505137, 1, 1, 1, 1, 1,
0.04061487, -1.109018, 1.735854, 1, 1, 1, 1, 1,
0.0435922, 0.8350697, 0.06946546, 0, 0, 1, 1, 1,
0.044549, -1.216012, 5.612161, 1, 0, 0, 1, 1,
0.04663879, 0.662942, 0.2611082, 1, 0, 0, 1, 1,
0.04877947, -0.7802602, 2.522252, 1, 0, 0, 1, 1,
0.04991563, 0.6447492, 0.7617372, 1, 0, 0, 1, 1,
0.05201634, 1.528373, 0.2923547, 1, 0, 0, 1, 1,
0.05403974, 0.4233902, 1.143041, 0, 0, 0, 1, 1,
0.05701951, 0.1358472, 0.6738924, 0, 0, 0, 1, 1,
0.05782199, -0.6316227, 3.230714, 0, 0, 0, 1, 1,
0.06298072, 0.4638216, -0.104376, 0, 0, 0, 1, 1,
0.0648637, -0.2673123, 3.118936, 0, 0, 0, 1, 1,
0.06934932, -1.266161, 2.803284, 0, 0, 0, 1, 1,
0.07005449, -0.906709, 3.07711, 0, 0, 0, 1, 1,
0.07214352, 0.3964223, 0.9791658, 1, 1, 1, 1, 1,
0.07375018, 1.679901, 1.949939, 1, 1, 1, 1, 1,
0.07565098, -0.07322342, 1.487634, 1, 1, 1, 1, 1,
0.07589506, -1.027975, 4.455927, 1, 1, 1, 1, 1,
0.07961447, 0.8000941, -1.278052, 1, 1, 1, 1, 1,
0.08146072, -0.9749589, 3.232215, 1, 1, 1, 1, 1,
0.08342951, 1.460901, 0.9666052, 1, 1, 1, 1, 1,
0.08381127, -1.096058, 3.921499, 1, 1, 1, 1, 1,
0.08761462, -1.905087, 3.168413, 1, 1, 1, 1, 1,
0.09239984, 0.1766518, -0.8879592, 1, 1, 1, 1, 1,
0.09445772, 0.8358284, 1.066159, 1, 1, 1, 1, 1,
0.09671259, 0.1649542, 0.5832616, 1, 1, 1, 1, 1,
0.1010311, 0.05423117, 2.411424, 1, 1, 1, 1, 1,
0.1048327, 1.124379, -0.125252, 1, 1, 1, 1, 1,
0.1126605, -0.999985, 3.280842, 1, 1, 1, 1, 1,
0.113229, 1.397339, -0.9736838, 0, 0, 1, 1, 1,
0.1204422, 2.349446, 1.495916, 1, 0, 0, 1, 1,
0.1211496, -1.244694, 3.27422, 1, 0, 0, 1, 1,
0.1249652, 0.5546675, 1.562322, 1, 0, 0, 1, 1,
0.1295961, -0.1679297, 2.540431, 1, 0, 0, 1, 1,
0.13189, 0.7052039, 1.355757, 1, 0, 0, 1, 1,
0.1332623, 1.50781, -0.1122015, 0, 0, 0, 1, 1,
0.133302, -1.913267, 3.97827, 0, 0, 0, 1, 1,
0.1349679, -0.843399, 4.350483, 0, 0, 0, 1, 1,
0.1365756, 0.8912348, 1.274085, 0, 0, 0, 1, 1,
0.1388533, -0.8754912, 1.709207, 0, 0, 0, 1, 1,
0.1433501, -0.4557951, 1.937157, 0, 0, 0, 1, 1,
0.1439965, -0.4145047, 2.432263, 0, 0, 0, 1, 1,
0.1452385, -1.121734, 3.656413, 1, 1, 1, 1, 1,
0.1487348, -0.6299543, 3.355013, 1, 1, 1, 1, 1,
0.1510297, 1.172597, 0.2069906, 1, 1, 1, 1, 1,
0.1515684, -0.5061158, 2.357824, 1, 1, 1, 1, 1,
0.1546954, 0.1061429, 1.681552, 1, 1, 1, 1, 1,
0.1550119, 0.9243361, 0.4479542, 1, 1, 1, 1, 1,
0.1572187, -1.537466, 3.444405, 1, 1, 1, 1, 1,
0.1623094, 0.1156484, 0.18801, 1, 1, 1, 1, 1,
0.1626221, -0.1014775, 0.7770183, 1, 1, 1, 1, 1,
0.1627817, 1.827534, 0.5548824, 1, 1, 1, 1, 1,
0.1640155, -0.1098943, 3.393255, 1, 1, 1, 1, 1,
0.1640516, 1.198218, 0.6892462, 1, 1, 1, 1, 1,
0.1666391, 0.4176389, -0.003049626, 1, 1, 1, 1, 1,
0.1691687, -0.5009145, 3.657575, 1, 1, 1, 1, 1,
0.1737547, 0.110441, 1.883819, 1, 1, 1, 1, 1,
0.1822891, 1.158283, -0.2843519, 0, 0, 1, 1, 1,
0.1862428, 1.535033, 0.2560113, 1, 0, 0, 1, 1,
0.1868327, -0.5291985, 3.913484, 1, 0, 0, 1, 1,
0.1869361, 0.1273667, 1.069961, 1, 0, 0, 1, 1,
0.1990801, 0.2640726, 1.160172, 1, 0, 0, 1, 1,
0.1994576, -2.729277, 4.631401, 1, 0, 0, 1, 1,
0.2008065, 1.133929, 1.11599, 0, 0, 0, 1, 1,
0.2030764, 0.9981091, 0.4071092, 0, 0, 0, 1, 1,
0.2045623, -1.203542, 3.157473, 0, 0, 0, 1, 1,
0.2081175, -0.5846969, 3.529713, 0, 0, 0, 1, 1,
0.2099929, -0.495466, 1.536484, 0, 0, 0, 1, 1,
0.211499, -1.286564, 3.215905, 0, 0, 0, 1, 1,
0.2118308, 0.5793009, 0.2459038, 0, 0, 0, 1, 1,
0.211992, 2.097677, -0.5351431, 1, 1, 1, 1, 1,
0.2167362, 0.6395074, 0.5594903, 1, 1, 1, 1, 1,
0.2174383, 1.015865, 0.574952, 1, 1, 1, 1, 1,
0.228018, -0.4933623, 2.811972, 1, 1, 1, 1, 1,
0.2309033, -0.3687187, 2.762648, 1, 1, 1, 1, 1,
0.2330589, -0.09874594, 2.638569, 1, 1, 1, 1, 1,
0.2336619, 0.09050861, -0.185201, 1, 1, 1, 1, 1,
0.2373742, -0.3225559, 3.272501, 1, 1, 1, 1, 1,
0.2384382, 1.347647, -0.1009277, 1, 1, 1, 1, 1,
0.2414684, -1.201046, 2.747647, 1, 1, 1, 1, 1,
0.2439813, 0.1371729, 2.16593, 1, 1, 1, 1, 1,
0.2452338, -1.085929, 1.958048, 1, 1, 1, 1, 1,
0.2464749, 0.2208975, 1.619465, 1, 1, 1, 1, 1,
0.2479632, -0.6638117, 2.282484, 1, 1, 1, 1, 1,
0.2490365, 0.05991811, 0.5491492, 1, 1, 1, 1, 1,
0.2539898, 0.4063484, 0.1051232, 0, 0, 1, 1, 1,
0.2547662, -0.005869509, 0.09050926, 1, 0, 0, 1, 1,
0.2617614, 0.08653969, 1.362629, 1, 0, 0, 1, 1,
0.2712535, -1.154044, 2.371877, 1, 0, 0, 1, 1,
0.2779563, 1.012374, 1.785664, 1, 0, 0, 1, 1,
0.2798088, 1.041559, 0.7096652, 1, 0, 0, 1, 1,
0.2837527, -0.2434403, 1.694973, 0, 0, 0, 1, 1,
0.2850899, -0.4438659, 1.889924, 0, 0, 0, 1, 1,
0.2878087, 1.166399, -1.199783, 0, 0, 0, 1, 1,
0.292571, -1.113544, 2.131308, 0, 0, 0, 1, 1,
0.2948275, 0.5094362, -0.5914678, 0, 0, 0, 1, 1,
0.3077743, 0.2401908, 1.443958, 0, 0, 0, 1, 1,
0.3089761, -1.219927, 3.08011, 0, 0, 0, 1, 1,
0.3098821, -0.6751277, 3.56451, 1, 1, 1, 1, 1,
0.3131327, 0.05444046, 1.201072, 1, 1, 1, 1, 1,
0.3147213, 0.8776906, -0.08578213, 1, 1, 1, 1, 1,
0.3174647, 1.310425, 0.3587907, 1, 1, 1, 1, 1,
0.3238851, 0.3632596, 1.787778, 1, 1, 1, 1, 1,
0.3287865, -0.04789121, 2.225061, 1, 1, 1, 1, 1,
0.3377364, 0.9463816, 1.488449, 1, 1, 1, 1, 1,
0.3418193, -0.04828036, 1.257524, 1, 1, 1, 1, 1,
0.3426871, -0.650272, 3.194557, 1, 1, 1, 1, 1,
0.3459317, -0.8122206, 1.627389, 1, 1, 1, 1, 1,
0.3529114, -0.6792074, 2.128922, 1, 1, 1, 1, 1,
0.3533798, -0.9131063, 4.450976, 1, 1, 1, 1, 1,
0.3548376, -1.342057, 3.523498, 1, 1, 1, 1, 1,
0.3580806, 0.6421093, 1.66695, 1, 1, 1, 1, 1,
0.3621981, -0.01467607, 1.223555, 1, 1, 1, 1, 1,
0.3646117, -0.4412616, 3.022619, 0, 0, 1, 1, 1,
0.3704419, 0.1918384, 3.40901, 1, 0, 0, 1, 1,
0.370855, 0.9941338, -0.00671064, 1, 0, 0, 1, 1,
0.3723078, -0.7420552, 3.516165, 1, 0, 0, 1, 1,
0.3759826, -0.903618, 0.7681267, 1, 0, 0, 1, 1,
0.3783873, -0.3173364, 2.080021, 1, 0, 0, 1, 1,
0.3793491, -0.182095, 0.8476409, 0, 0, 0, 1, 1,
0.3803179, 0.7762897, -0.3054678, 0, 0, 0, 1, 1,
0.3846686, -1.114469, 1.709846, 0, 0, 0, 1, 1,
0.3847384, -0.9802219, 4.090796, 0, 0, 0, 1, 1,
0.3852927, 0.6906539, -0.02623985, 0, 0, 0, 1, 1,
0.3889342, 1.435072, 0.2757366, 0, 0, 0, 1, 1,
0.3909735, 2.088892, 0.004780243, 0, 0, 0, 1, 1,
0.39726, -0.2138094, 1.822112, 1, 1, 1, 1, 1,
0.4079146, -1.268022, 1.701819, 1, 1, 1, 1, 1,
0.4092056, 1.105349, -0.7484516, 1, 1, 1, 1, 1,
0.4093106, -0.5181984, 2.954472, 1, 1, 1, 1, 1,
0.4109335, -0.1871764, 0.0974329, 1, 1, 1, 1, 1,
0.4134057, 1.200947, 0.494138, 1, 1, 1, 1, 1,
0.4136598, 1.142453, 0.4219838, 1, 1, 1, 1, 1,
0.4193769, 0.08495214, 1.305949, 1, 1, 1, 1, 1,
0.4284564, 0.7618361, 0.8642103, 1, 1, 1, 1, 1,
0.4286547, -1.386484, 1.9368, 1, 1, 1, 1, 1,
0.4326289, 1.086873, 1.422683, 1, 1, 1, 1, 1,
0.4401034, -1.498692, 2.209035, 1, 1, 1, 1, 1,
0.441694, 0.07440234, -0.6312979, 1, 1, 1, 1, 1,
0.4428022, 1.365113, 0.3194828, 1, 1, 1, 1, 1,
0.4437892, -0.3940536, 3.116283, 1, 1, 1, 1, 1,
0.4439855, -1.651473, 3.083638, 0, 0, 1, 1, 1,
0.4509894, 0.7760573, -2.318231, 1, 0, 0, 1, 1,
0.4603108, 0.8157145, -1.123945, 1, 0, 0, 1, 1,
0.4609452, 0.2874466, 1.005264, 1, 0, 0, 1, 1,
0.4622743, 1.726331, 0.3380021, 1, 0, 0, 1, 1,
0.4624517, -0.5750667, 2.861844, 1, 0, 0, 1, 1,
0.4646063, 0.6192955, 0.2921376, 0, 0, 0, 1, 1,
0.4662753, -0.1440254, 0.7341172, 0, 0, 0, 1, 1,
0.4692612, 0.2677551, 1.219358, 0, 0, 0, 1, 1,
0.4716705, -1.162363, 3.175579, 0, 0, 0, 1, 1,
0.4722579, 0.6614816, 2.6614, 0, 0, 0, 1, 1,
0.4780072, 0.1351646, 1.749355, 0, 0, 0, 1, 1,
0.478039, -0.2584408, 2.281716, 0, 0, 0, 1, 1,
0.4830241, -0.7697083, 3.424217, 1, 1, 1, 1, 1,
0.4880233, 0.1544092, 1.157847, 1, 1, 1, 1, 1,
0.4923108, -2.740896, 3.642705, 1, 1, 1, 1, 1,
0.4947024, -0.4686633, 1.613644, 1, 1, 1, 1, 1,
0.4953794, -1.935101, 4.067648, 1, 1, 1, 1, 1,
0.4955271, 0.151687, 0.4602218, 1, 1, 1, 1, 1,
0.4977111, 0.6746351, 0.7706259, 1, 1, 1, 1, 1,
0.4992139, 2.229997, 1.117734, 1, 1, 1, 1, 1,
0.5004297, 1.043346, 2.545871, 1, 1, 1, 1, 1,
0.5035499, -0.2973202, 2.790919, 1, 1, 1, 1, 1,
0.5053188, -0.4798973, 1.141189, 1, 1, 1, 1, 1,
0.5079609, 0.4776692, 0.9769625, 1, 1, 1, 1, 1,
0.5131342, -2.225116, 2.437778, 1, 1, 1, 1, 1,
0.5150477, 0.3561547, -0.1322275, 1, 1, 1, 1, 1,
0.5180189, 1.744853, 0.8030723, 1, 1, 1, 1, 1,
0.5270492, 0.2536376, 0.9465076, 0, 0, 1, 1, 1,
0.5271308, -1.788122, 2.29117, 1, 0, 0, 1, 1,
0.529918, -1.028353, 4.459864, 1, 0, 0, 1, 1,
0.5329943, 1.575294, 0.3460601, 1, 0, 0, 1, 1,
0.5374303, 0.2447635, 1.173996, 1, 0, 0, 1, 1,
0.5391248, -1.524657, 3.142628, 1, 0, 0, 1, 1,
0.5419805, 0.09867512, 1.685197, 0, 0, 0, 1, 1,
0.5419987, -1.835462, 4.649955, 0, 0, 0, 1, 1,
0.5423741, -0.3608044, 1.665549, 0, 0, 0, 1, 1,
0.5525761, 2.016995, -0.983148, 0, 0, 0, 1, 1,
0.5541623, -0.8997253, 1.386536, 0, 0, 0, 1, 1,
0.5626735, -0.7443044, 2.140115, 0, 0, 0, 1, 1,
0.5663214, 1.390079, -1.361567, 0, 0, 0, 1, 1,
0.5713493, -1.423927, 1.926418, 1, 1, 1, 1, 1,
0.5730847, 0.8261513, 1.765061, 1, 1, 1, 1, 1,
0.5782278, 0.6177534, 1.198779, 1, 1, 1, 1, 1,
0.5823605, 0.5972626, 0.1484393, 1, 1, 1, 1, 1,
0.587195, 0.8382179, 1.418972, 1, 1, 1, 1, 1,
0.58925, -1.426882, 2.544428, 1, 1, 1, 1, 1,
0.5931689, -1.048512, 1.096546, 1, 1, 1, 1, 1,
0.5962051, -1.239345, 3.244823, 1, 1, 1, 1, 1,
0.6072651, 1.047141, 0.2302163, 1, 1, 1, 1, 1,
0.6209788, -0.9989024, 2.78084, 1, 1, 1, 1, 1,
0.628859, 0.6300805, 0.944053, 1, 1, 1, 1, 1,
0.6322989, 0.2943015, 0.8490583, 1, 1, 1, 1, 1,
0.635159, 1.579701, -0.4803405, 1, 1, 1, 1, 1,
0.6420255, -0.3460843, 3.032757, 1, 1, 1, 1, 1,
0.6426636, 0.4928437, 1.087823, 1, 1, 1, 1, 1,
0.6454647, -0.164845, 3.359433, 0, 0, 1, 1, 1,
0.6469433, -0.1747091, 1.733488, 1, 0, 0, 1, 1,
0.6474104, -0.814263, 3.793773, 1, 0, 0, 1, 1,
0.6484222, -1.821223, 3.704793, 1, 0, 0, 1, 1,
0.6492727, -0.1593344, 2.589442, 1, 0, 0, 1, 1,
0.6516221, -0.6205282, 2.045883, 1, 0, 0, 1, 1,
0.6522754, -0.06743062, 1.4005, 0, 0, 0, 1, 1,
0.6531182, -0.3744844, 2.118791, 0, 0, 0, 1, 1,
0.6576063, -0.7399008, 1.708329, 0, 0, 0, 1, 1,
0.6577593, -0.5319889, 1.898702, 0, 0, 0, 1, 1,
0.6670843, -0.3809206, 2.034977, 0, 0, 0, 1, 1,
0.6703462, 0.2057095, 0.1526016, 0, 0, 0, 1, 1,
0.6735759, 0.2905568, 1.6725, 0, 0, 0, 1, 1,
0.6763998, -0.8800786, 2.403297, 1, 1, 1, 1, 1,
0.6781596, -1.21064, 1.36773, 1, 1, 1, 1, 1,
0.6783378, -0.3804585, 1.954145, 1, 1, 1, 1, 1,
0.6849828, 0.8475131, 0.4809642, 1, 1, 1, 1, 1,
0.6866757, -0.3144707, 1.381941, 1, 1, 1, 1, 1,
0.6904128, 0.7273179, 1.440997, 1, 1, 1, 1, 1,
0.6915504, 0.3523115, 0.5103647, 1, 1, 1, 1, 1,
0.6918224, -1.543985, 2.865775, 1, 1, 1, 1, 1,
0.6998205, -1.015313, 0.8218571, 1, 1, 1, 1, 1,
0.7004473, -0.2066204, 2.497385, 1, 1, 1, 1, 1,
0.7067071, 1.396077, -0.6989369, 1, 1, 1, 1, 1,
0.7069991, 0.1322006, 0.5011278, 1, 1, 1, 1, 1,
0.7099774, 1.178203, -0.8437825, 1, 1, 1, 1, 1,
0.7263386, 0.04859518, 2.325191, 1, 1, 1, 1, 1,
0.7296948, 0.9690029, 0.7475834, 1, 1, 1, 1, 1,
0.7303225, 0.00775208, 2.424848, 0, 0, 1, 1, 1,
0.7331696, 0.2984752, 2.398133, 1, 0, 0, 1, 1,
0.7356368, -1.325567, 4.283286, 1, 0, 0, 1, 1,
0.7385212, 0.1005328, 1.393612, 1, 0, 0, 1, 1,
0.7415735, -0.007439869, 2.159341, 1, 0, 0, 1, 1,
0.7420532, 0.8908821, 1.730374, 1, 0, 0, 1, 1,
0.7425068, 0.5547094, 0.8041114, 0, 0, 0, 1, 1,
0.7462168, -1.941566, 1.434369, 0, 0, 0, 1, 1,
0.7468017, -1.316938, 3.092497, 0, 0, 0, 1, 1,
0.7493732, -2.11049, 3.302572, 0, 0, 0, 1, 1,
0.7500306, 0.2470133, 1.842108, 0, 0, 0, 1, 1,
0.7595069, 1.516755, 1.069493, 0, 0, 0, 1, 1,
0.7620886, 0.6752921, 0.09582433, 0, 0, 0, 1, 1,
0.7651377, 0.2318109, 0.5637583, 1, 1, 1, 1, 1,
0.7656963, -0.2294437, 1.708515, 1, 1, 1, 1, 1,
0.7731257, 0.6563146, 0.2615057, 1, 1, 1, 1, 1,
0.7751119, -1.757456, 3.57458, 1, 1, 1, 1, 1,
0.7865411, -0.55368, 3.257203, 1, 1, 1, 1, 1,
0.7907191, 0.5732281, 1.864163, 1, 1, 1, 1, 1,
0.7943219, -0.6704377, 1.595846, 1, 1, 1, 1, 1,
0.7972575, 1.578678, -0.1737181, 1, 1, 1, 1, 1,
0.8084854, -0.871084, 2.715327, 1, 1, 1, 1, 1,
0.8107204, -0.167319, 1.370506, 1, 1, 1, 1, 1,
0.8111518, 1.036554, 1.212378, 1, 1, 1, 1, 1,
0.811403, -1.657426, 4.00782, 1, 1, 1, 1, 1,
0.8147314, 0.4500473, 0.9696832, 1, 1, 1, 1, 1,
0.8162367, 0.1848501, 2.354089, 1, 1, 1, 1, 1,
0.8188914, 0.5537899, 2.842209, 1, 1, 1, 1, 1,
0.820173, 0.2096075, 0.5337845, 0, 0, 1, 1, 1,
0.821341, 0.0423811, 2.123332, 1, 0, 0, 1, 1,
0.8248808, -1.401309, 1.06912, 1, 0, 0, 1, 1,
0.8299496, 0.07892692, 1.228162, 1, 0, 0, 1, 1,
0.830641, -1.169162, 1.787656, 1, 0, 0, 1, 1,
0.833865, -0.640802, 1.041926, 1, 0, 0, 1, 1,
0.8406955, -0.07878519, 2.459696, 0, 0, 0, 1, 1,
0.8408251, -1.449984, 4.168752, 0, 0, 0, 1, 1,
0.8427048, 0.097275, 0.1907378, 0, 0, 0, 1, 1,
0.8446158, -0.9682781, 0.8703254, 0, 0, 0, 1, 1,
0.8460064, 1.200684, -1.218962, 0, 0, 0, 1, 1,
0.8475187, 1.05012, 0.6355975, 0, 0, 0, 1, 1,
0.8487481, -1.870932, 1.772481, 0, 0, 0, 1, 1,
0.8489096, -0.2716459, 2.233612, 1, 1, 1, 1, 1,
0.8503308, -0.1457722, 3.512306, 1, 1, 1, 1, 1,
0.8593385, 2.105807, -0.6701682, 1, 1, 1, 1, 1,
0.8599464, 1.205805, 1.809597, 1, 1, 1, 1, 1,
0.8666091, -0.4421393, 2.004373, 1, 1, 1, 1, 1,
0.869996, 0.2226968, -0.2368274, 1, 1, 1, 1, 1,
0.8785041, -0.438795, 0.9575462, 1, 1, 1, 1, 1,
0.8795441, -0.3407225, 0.461505, 1, 1, 1, 1, 1,
0.8850765, 0.6873494, 2.774224, 1, 1, 1, 1, 1,
0.8908965, 0.2032691, 0.2234754, 1, 1, 1, 1, 1,
0.8930398, -1.237181, 3.66727, 1, 1, 1, 1, 1,
0.8934391, 0.683566, -0.3763315, 1, 1, 1, 1, 1,
0.9008898, -0.001085754, 0.2173979, 1, 1, 1, 1, 1,
0.9034645, 1.45496, -0.4822577, 1, 1, 1, 1, 1,
0.9111019, -0.927139, 3.645192, 1, 1, 1, 1, 1,
0.9113607, 0.1032878, 1.519002, 0, 0, 1, 1, 1,
0.9117957, 1.864977, 0.1269771, 1, 0, 0, 1, 1,
0.9222399, -1.389457, 3.319708, 1, 0, 0, 1, 1,
0.9286264, 0.8981285, 0.1429237, 1, 0, 0, 1, 1,
0.9334983, -0.1581619, 2.129342, 1, 0, 0, 1, 1,
0.934082, 0.2770554, 1.489171, 1, 0, 0, 1, 1,
0.940877, 1.391194, 0.9517378, 0, 0, 0, 1, 1,
0.9436747, 1.902485, -0.5099241, 0, 0, 0, 1, 1,
0.9509147, -0.6642845, 2.170978, 0, 0, 0, 1, 1,
0.9513518, 2.833949, -0.686816, 0, 0, 0, 1, 1,
0.9520047, 1.389588, 0.2887444, 0, 0, 0, 1, 1,
0.9598321, -0.1016454, 1.736919, 0, 0, 0, 1, 1,
0.9679699, 0.4047986, 2.540791, 0, 0, 0, 1, 1,
0.9692987, 0.06907493, 1.693988, 1, 1, 1, 1, 1,
0.9711522, 0.6677732, 1.618572, 1, 1, 1, 1, 1,
0.9807084, -0.08882093, 2.265898, 1, 1, 1, 1, 1,
0.9811227, 0.859715, 1.997964, 1, 1, 1, 1, 1,
0.9890482, -0.502046, 1.173604, 1, 1, 1, 1, 1,
0.9892018, -0.5096552, 2.58757, 1, 1, 1, 1, 1,
0.9949486, -1.224684, 1.160372, 1, 1, 1, 1, 1,
0.9988219, -0.156324, 2.785594, 1, 1, 1, 1, 1,
1.00381, 0.3095306, 0.7671659, 1, 1, 1, 1, 1,
1.004391, 1.015513, 0.8057488, 1, 1, 1, 1, 1,
1.004692, 0.5737079, 0.8726305, 1, 1, 1, 1, 1,
1.004871, 0.6465618, 1.123509, 1, 1, 1, 1, 1,
1.007247, 0.6511933, 3.429195, 1, 1, 1, 1, 1,
1.023256, 0.3236832, 1.349851, 1, 1, 1, 1, 1,
1.038777, -0.03442291, 0.7895718, 1, 1, 1, 1, 1,
1.039673, 1.282661, 0.6077688, 0, 0, 1, 1, 1,
1.050872, -0.7785809, 2.757982, 1, 0, 0, 1, 1,
1.05101, -1.411017, 3.211947, 1, 0, 0, 1, 1,
1.052742, 0.2802827, 0.1079092, 1, 0, 0, 1, 1,
1.060525, 1.006957, -0.07510565, 1, 0, 0, 1, 1,
1.062147, 1.396066, -0.2240282, 1, 0, 0, 1, 1,
1.062302, 0.5347953, 2.096931, 0, 0, 0, 1, 1,
1.062516, 0.6985999, 1.311557, 0, 0, 0, 1, 1,
1.065833, 0.6776536, 2.077855, 0, 0, 0, 1, 1,
1.082724, 0.4683318, 1.904055, 0, 0, 0, 1, 1,
1.085312, 0.166869, 2.000174, 0, 0, 0, 1, 1,
1.088221, 0.6138264, 1.589087, 0, 0, 0, 1, 1,
1.092756, -1.254822, 1.261331, 0, 0, 0, 1, 1,
1.102247, -1.323126, 3.783544, 1, 1, 1, 1, 1,
1.102772, 0.05130411, 2.691495, 1, 1, 1, 1, 1,
1.111752, -0.06908726, 2.686857, 1, 1, 1, 1, 1,
1.114647, -2.075862, 2.987163, 1, 1, 1, 1, 1,
1.11651, -1.819407, 3.147717, 1, 1, 1, 1, 1,
1.11654, -0.7641901, 2.01154, 1, 1, 1, 1, 1,
1.119586, 2.425383, 0.441155, 1, 1, 1, 1, 1,
1.120035, -0.4867276, 2.358033, 1, 1, 1, 1, 1,
1.121814, 0.06469573, 0.9294461, 1, 1, 1, 1, 1,
1.127788, 0.008644399, 0.9154506, 1, 1, 1, 1, 1,
1.127902, -0.02024651, 2.196172, 1, 1, 1, 1, 1,
1.129189, -1.181107, 2.373346, 1, 1, 1, 1, 1,
1.137397, -0.7726792, 0.6656327, 1, 1, 1, 1, 1,
1.147617, 1.238941, 0.6881155, 1, 1, 1, 1, 1,
1.154135, 0.5439495, 1.269328, 1, 1, 1, 1, 1,
1.155688, 0.7944673, 1.289682, 0, 0, 1, 1, 1,
1.155807, 2.541729, -0.1722543, 1, 0, 0, 1, 1,
1.162893, -0.7451816, 0.06308739, 1, 0, 0, 1, 1,
1.170743, -1.179244, 3.347575, 1, 0, 0, 1, 1,
1.173221, -0.5148038, 1.098291, 1, 0, 0, 1, 1,
1.177886, 1.170693, -0.1009333, 1, 0, 0, 1, 1,
1.195036, -0.8709865, 1.035309, 0, 0, 0, 1, 1,
1.199941, -1.050331, 1.562966, 0, 0, 0, 1, 1,
1.203057, 1.221091, 0.7948215, 0, 0, 0, 1, 1,
1.204648, -0.195422, 3.78247, 0, 0, 0, 1, 1,
1.209824, -1.262277, 2.787246, 0, 0, 0, 1, 1,
1.212988, 0.4729996, 1.287442, 0, 0, 0, 1, 1,
1.217722, -0.3697041, 2.336916, 0, 0, 0, 1, 1,
1.218274, 0.7183377, 1.729125, 1, 1, 1, 1, 1,
1.219593, -0.5845522, 2.153308, 1, 1, 1, 1, 1,
1.221441, -2.454883, 2.100975, 1, 1, 1, 1, 1,
1.235085, -0.2395945, 2.269382, 1, 1, 1, 1, 1,
1.235618, 0.6807234, 1.870043, 1, 1, 1, 1, 1,
1.238682, 0.9178713, 1.527837, 1, 1, 1, 1, 1,
1.239417, -0.7919266, 1.910384, 1, 1, 1, 1, 1,
1.247613, -0.2524378, 1.496561, 1, 1, 1, 1, 1,
1.248737, 0.768193, 1.493717, 1, 1, 1, 1, 1,
1.249088, -0.9083093, 2.494107, 1, 1, 1, 1, 1,
1.252841, -0.07573323, 1.746933, 1, 1, 1, 1, 1,
1.256005, 1.024156, 2.653616, 1, 1, 1, 1, 1,
1.256588, -1.649611, 4.259526, 1, 1, 1, 1, 1,
1.26196, -0.3385508, 1.541123, 1, 1, 1, 1, 1,
1.265373, 0.7713131, 0.5469481, 1, 1, 1, 1, 1,
1.2655, 0.08399, 1.764909, 0, 0, 1, 1, 1,
1.265602, -1.732586, 1.963097, 1, 0, 0, 1, 1,
1.27101, -0.7316227, 2.761291, 1, 0, 0, 1, 1,
1.276076, 1.614678, 0.3619372, 1, 0, 0, 1, 1,
1.290307, 0.2996248, 1.775909, 1, 0, 0, 1, 1,
1.31343, 0.1861295, 2.346414, 1, 0, 0, 1, 1,
1.314732, -1.572044, 2.022545, 0, 0, 0, 1, 1,
1.317404, -0.5643427, 2.998906, 0, 0, 0, 1, 1,
1.325925, -0.2570773, 2.172199, 0, 0, 0, 1, 1,
1.341866, 1.318244, 0.604171, 0, 0, 0, 1, 1,
1.34481, -0.7351513, 1.698813, 0, 0, 0, 1, 1,
1.349308, 1.047675, 0.03266709, 0, 0, 0, 1, 1,
1.360901, -1.986437, 0.6406859, 0, 0, 0, 1, 1,
1.378802, 0.5578551, 0.4619897, 1, 1, 1, 1, 1,
1.384113, -0.1102226, 3.374697, 1, 1, 1, 1, 1,
1.389778, -0.1466964, 2.984149, 1, 1, 1, 1, 1,
1.390236, -1.006913, 1.640227, 1, 1, 1, 1, 1,
1.402926, 0.5960658, 0.9242531, 1, 1, 1, 1, 1,
1.404336, 0.00106383, 2.672676, 1, 1, 1, 1, 1,
1.407207, 0.475949, 0.4472291, 1, 1, 1, 1, 1,
1.408242, -1.297666, 2.892138, 1, 1, 1, 1, 1,
1.408407, -0.6331703, 3.840687, 1, 1, 1, 1, 1,
1.409585, 0.1480199, 1.886445, 1, 1, 1, 1, 1,
1.423607, 1.258424, 1.498219, 1, 1, 1, 1, 1,
1.426686, 0.8194627, 0.8610242, 1, 1, 1, 1, 1,
1.428568, 1.291114, 2.129194, 1, 1, 1, 1, 1,
1.432121, -1.220827, 2.253067, 1, 1, 1, 1, 1,
1.434191, -1.21641, 0.323234, 1, 1, 1, 1, 1,
1.443255, -1.093292, 2.259467, 0, 0, 1, 1, 1,
1.446587, 1.318127, 2.194877, 1, 0, 0, 1, 1,
1.453651, -0.4347952, 3.190682, 1, 0, 0, 1, 1,
1.460298, 0.4539902, 1.494942, 1, 0, 0, 1, 1,
1.468294, -1.897713, 2.201608, 1, 0, 0, 1, 1,
1.484289, -0.5316949, 0.5369024, 1, 0, 0, 1, 1,
1.51047, -1.228464, 2.539823, 0, 0, 0, 1, 1,
1.510506, -1.501425, 3.606014, 0, 0, 0, 1, 1,
1.51549, -0.1432644, 0.9031292, 0, 0, 0, 1, 1,
1.520969, 0.7144305, -0.9386328, 0, 0, 0, 1, 1,
1.526519, 2.005077, 0.8057271, 0, 0, 0, 1, 1,
1.531212, -0.6389359, 1.028605, 0, 0, 0, 1, 1,
1.536278, 0.9682885, 1.689385, 0, 0, 0, 1, 1,
1.551874, -0.7966104, 2.10447, 1, 1, 1, 1, 1,
1.563848, 0.6658345, 1.065906, 1, 1, 1, 1, 1,
1.584983, 0.5030913, 0.5859468, 1, 1, 1, 1, 1,
1.590975, -0.6936122, 2.351231, 1, 1, 1, 1, 1,
1.597713, 3.391609, 0.3845429, 1, 1, 1, 1, 1,
1.598876, -1.10247, 2.301471, 1, 1, 1, 1, 1,
1.607446, -0.9279698, 0.7619467, 1, 1, 1, 1, 1,
1.609609, -0.3041342, 1.89128, 1, 1, 1, 1, 1,
1.615077, 0.8822114, 2.009862, 1, 1, 1, 1, 1,
1.616404, -0.3839602, 3.041368, 1, 1, 1, 1, 1,
1.62142, 0.2899737, 0.7833118, 1, 1, 1, 1, 1,
1.633443, -1.784048, 1.599443, 1, 1, 1, 1, 1,
1.640304, -0.8940453, 2.994871, 1, 1, 1, 1, 1,
1.661926, -0.01628083, 0.02044002, 1, 1, 1, 1, 1,
1.671033, -1.056574, 2.331812, 1, 1, 1, 1, 1,
1.672323, 0.1855782, 2.605889, 0, 0, 1, 1, 1,
1.678811, -0.7597812, 2.470558, 1, 0, 0, 1, 1,
1.682724, 0.4796606, 0.9920165, 1, 0, 0, 1, 1,
1.691552, -0.5403774, 1.361856, 1, 0, 0, 1, 1,
1.702575, -0.7073538, 2.276423, 1, 0, 0, 1, 1,
1.723688, -0.7165243, 1.245479, 1, 0, 0, 1, 1,
1.728449, -2.639936, 2.44974, 0, 0, 0, 1, 1,
1.73168, -0.5838594, 2.009022, 0, 0, 0, 1, 1,
1.742843, -0.5203474, 2.310181, 0, 0, 0, 1, 1,
1.75105, -1.73271, 4.334236, 0, 0, 0, 1, 1,
1.763744, 0.8357176, 1.656708, 0, 0, 0, 1, 1,
1.764014, -0.9080598, 1.63472, 0, 0, 0, 1, 1,
1.765912, -2.008945, 3.082741, 0, 0, 0, 1, 1,
1.774613, 1.837233, -0.06506479, 1, 1, 1, 1, 1,
1.792798, 1.899444, 1.471424, 1, 1, 1, 1, 1,
1.798638, 0.7570726, -0.08959309, 1, 1, 1, 1, 1,
1.799151, -0.7905594, 1.877789, 1, 1, 1, 1, 1,
1.820174, 0.5666645, 0.7665039, 1, 1, 1, 1, 1,
1.860177, 0.2206647, 1.230993, 1, 1, 1, 1, 1,
1.874951, -1.88236, 2.317791, 1, 1, 1, 1, 1,
1.879995, -0.8482744, 1.27677, 1, 1, 1, 1, 1,
1.88048, 0.7878594, -0.5755107, 1, 1, 1, 1, 1,
1.893792, 0.2603619, 3.114116, 1, 1, 1, 1, 1,
1.897404, -1.131154, -0.8070356, 1, 1, 1, 1, 1,
1.898744, -2.891359, 3.262422, 1, 1, 1, 1, 1,
1.913136, 1.482584, 1.21138, 1, 1, 1, 1, 1,
1.94148, -0.03791013, 2.129485, 1, 1, 1, 1, 1,
1.960896, -1.461016, 1.456554, 1, 1, 1, 1, 1,
1.981357, 2.039427, -0.227707, 0, 0, 1, 1, 1,
1.98544, -0.3964892, 1.15986, 1, 0, 0, 1, 1,
1.996585, 0.8880211, 1.562064, 1, 0, 0, 1, 1,
2.042298, -0.1264754, 0.6781555, 1, 0, 0, 1, 1,
2.121236, -1.722022, 2.750327, 1, 0, 0, 1, 1,
2.143096, -0.01334674, 2.189091, 1, 0, 0, 1, 1,
2.161979, -0.3818212, 0.6171685, 0, 0, 0, 1, 1,
2.199366, -1.034679, 0.9254577, 0, 0, 0, 1, 1,
2.222727, 0.2278969, 1.547368, 0, 0, 0, 1, 1,
2.234905, 0.3700346, 0.55795, 0, 0, 0, 1, 1,
2.246776, -0.9032422, 1.241852, 0, 0, 0, 1, 1,
2.300895, -0.5108409, 2.107791, 0, 0, 0, 1, 1,
2.340136, -2.393249, 1.76818, 0, 0, 0, 1, 1,
2.505796, -0.7289749, 2.006088, 1, 1, 1, 1, 1,
2.631596, 0.7214037, 0.6592635, 1, 1, 1, 1, 1,
2.672324, -0.6413291, 2.793102, 1, 1, 1, 1, 1,
2.685826, -0.04340199, 2.443071, 1, 1, 1, 1, 1,
2.759932, 1.360765, -1.018469, 1, 1, 1, 1, 1,
2.944485, -2.184218, 3.706534, 1, 1, 1, 1, 1,
3.112847, -0.3690264, 2.17099, 1, 1, 1, 1, 1
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
var radius = 9.901006;
var distance = 34.77687;
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
mvMatrix.translate( 0.1916132, 0.2736151, -0.2306423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77687);
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