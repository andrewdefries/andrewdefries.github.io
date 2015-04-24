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
-2.805518, 0.03471934, -3.099905, 1, 0, 0, 1,
-2.586459, -0.5769516, -1.322501, 1, 0.007843138, 0, 1,
-2.575555, -0.934948, -1.420528, 1, 0.01176471, 0, 1,
-2.527492, 0.6076064, -1.173072, 1, 0.01960784, 0, 1,
-2.457935, -0.4522488, -2.415162, 1, 0.02352941, 0, 1,
-2.444033, 0.5734187, -1.198351, 1, 0.03137255, 0, 1,
-2.393025, 1.770992, -0.7843256, 1, 0.03529412, 0, 1,
-2.360237, -0.1346468, -1.556001, 1, 0.04313726, 0, 1,
-2.35493, 0.1663702, -2.227583, 1, 0.04705882, 0, 1,
-2.330467, 1.507581, -3.803522, 1, 0.05490196, 0, 1,
-2.29473, 0.04167335, -1.398622, 1, 0.05882353, 0, 1,
-2.264352, 0.3030638, -0.7033536, 1, 0.06666667, 0, 1,
-2.188379, 1.311938, -2.82454, 1, 0.07058824, 0, 1,
-2.186316, 0.05762536, -2.680141, 1, 0.07843138, 0, 1,
-2.173563, -0.002932613, -3.4675, 1, 0.08235294, 0, 1,
-2.12509, 0.9546271, -2.30287, 1, 0.09019608, 0, 1,
-2.048615, 0.2138213, -1.376839, 1, 0.09411765, 0, 1,
-2.047024, 1.182458, -1.340082, 1, 0.1019608, 0, 1,
-2.032796, -0.04218079, -0.7728093, 1, 0.1098039, 0, 1,
-1.98268, 1.709088, -0.0355015, 1, 0.1137255, 0, 1,
-1.982081, 0.9960635, 1.059846, 1, 0.1215686, 0, 1,
-1.964653, 1.47608, -0.4614162, 1, 0.1254902, 0, 1,
-1.934291, -1.45777, -1.970522, 1, 0.1333333, 0, 1,
-1.9057, 0.8746489, -1.030133, 1, 0.1372549, 0, 1,
-1.881812, -0.9414775, -2.016526, 1, 0.145098, 0, 1,
-1.873441, 0.01981435, -0.4280914, 1, 0.1490196, 0, 1,
-1.867832, 1.096362, -1.255836, 1, 0.1568628, 0, 1,
-1.853458, -0.06393897, 0.2051576, 1, 0.1607843, 0, 1,
-1.824185, -0.3972136, -2.726535, 1, 0.1686275, 0, 1,
-1.809562, 0.461332, 1.623952, 1, 0.172549, 0, 1,
-1.807643, 0.09820483, -2.409429, 1, 0.1803922, 0, 1,
-1.80482, -0.5455749, -2.884336, 1, 0.1843137, 0, 1,
-1.790857, 0.6824741, -1.887162, 1, 0.1921569, 0, 1,
-1.788711, -1.064683, -1.543228, 1, 0.1960784, 0, 1,
-1.778991, 0.0824613, -1.076122, 1, 0.2039216, 0, 1,
-1.778216, 1.787885, 0.0168425, 1, 0.2117647, 0, 1,
-1.776077, 0.2049947, -2.515865, 1, 0.2156863, 0, 1,
-1.775501, 0.4047436, -0.1455116, 1, 0.2235294, 0, 1,
-1.765196, 0.5074931, -1.45977, 1, 0.227451, 0, 1,
-1.763465, 1.193157, -0.7006568, 1, 0.2352941, 0, 1,
-1.751005, 0.4366104, -1.802659, 1, 0.2392157, 0, 1,
-1.73113, 1.240307, -0.3172841, 1, 0.2470588, 0, 1,
-1.726483, 1.3876, -1.133772, 1, 0.2509804, 0, 1,
-1.716917, 0.2390512, -0.6154192, 1, 0.2588235, 0, 1,
-1.693684, 2.706791, -2.168931, 1, 0.2627451, 0, 1,
-1.69245, -0.3741124, -1.130905, 1, 0.2705882, 0, 1,
-1.689538, 0.6951876, -1.42516, 1, 0.2745098, 0, 1,
-1.669395, -0.4099443, -2.589164, 1, 0.282353, 0, 1,
-1.658756, -1.372118, -1.796043, 1, 0.2862745, 0, 1,
-1.647548, -0.6440848, -2.609794, 1, 0.2941177, 0, 1,
-1.643154, 0.3353414, -1.977426, 1, 0.3019608, 0, 1,
-1.635736, 0.9436999, -1.311303, 1, 0.3058824, 0, 1,
-1.630301, 0.6606131, -1.120751, 1, 0.3137255, 0, 1,
-1.627833, 0.3854173, -1.175112, 1, 0.3176471, 0, 1,
-1.622269, 0.925413, -0.4883211, 1, 0.3254902, 0, 1,
-1.591025, -0.3273325, -0.4395286, 1, 0.3294118, 0, 1,
-1.569585, 0.04641174, -2.946006, 1, 0.3372549, 0, 1,
-1.551782, -2.623052, -3.130237, 1, 0.3411765, 0, 1,
-1.549097, 0.2139076, 0.8913468, 1, 0.3490196, 0, 1,
-1.542145, 0.1154941, -0.9603883, 1, 0.3529412, 0, 1,
-1.519652, -1.117521, -2.156819, 1, 0.3607843, 0, 1,
-1.517682, 0.2020002, -0.8144833, 1, 0.3647059, 0, 1,
-1.514364, 0.2871203, -3.729768, 1, 0.372549, 0, 1,
-1.487515, -1.710884, -1.664562, 1, 0.3764706, 0, 1,
-1.486933, 0.7094029, -3.380915, 1, 0.3843137, 0, 1,
-1.486371, -0.2297879, -1.114818, 1, 0.3882353, 0, 1,
-1.467973, -0.7728097, 0.209438, 1, 0.3960784, 0, 1,
-1.466448, 1.752995, 0.8485766, 1, 0.4039216, 0, 1,
-1.460412, -0.08872107, -1.779402, 1, 0.4078431, 0, 1,
-1.442859, 0.5548369, -0.8981784, 1, 0.4156863, 0, 1,
-1.441373, 0.4278536, -1.577958, 1, 0.4196078, 0, 1,
-1.434994, 0.514448, 0.4833278, 1, 0.427451, 0, 1,
-1.427036, -0.2613645, -0.4715781, 1, 0.4313726, 0, 1,
-1.426053, -0.6567261, -2.834059, 1, 0.4392157, 0, 1,
-1.421043, -0.3280817, -0.276336, 1, 0.4431373, 0, 1,
-1.419965, 1.303638, -0.5001298, 1, 0.4509804, 0, 1,
-1.388635, 0.1661907, -1.121685, 1, 0.454902, 0, 1,
-1.388269, -1.299954, -1.81528, 1, 0.4627451, 0, 1,
-1.386073, 2.076625, -1.275837, 1, 0.4666667, 0, 1,
-1.384195, 1.318443, 0.5079892, 1, 0.4745098, 0, 1,
-1.378376, -0.2503034, -0.5187029, 1, 0.4784314, 0, 1,
-1.377394, 0.06345712, -1.981762, 1, 0.4862745, 0, 1,
-1.372925, -0.7449754, -2.687277, 1, 0.4901961, 0, 1,
-1.372289, -0.3789859, -0.2076503, 1, 0.4980392, 0, 1,
-1.366116, -2.020715, -3.230536, 1, 0.5058824, 0, 1,
-1.353771, 1.469349, -0.283339, 1, 0.509804, 0, 1,
-1.353305, -0.9155612, -1.010999, 1, 0.5176471, 0, 1,
-1.352191, 1.441121, -1.821096, 1, 0.5215687, 0, 1,
-1.334064, -0.7304143, -2.762306, 1, 0.5294118, 0, 1,
-1.326966, -1.252313, -2.922758, 1, 0.5333334, 0, 1,
-1.323723, -1.227938, -3.000896, 1, 0.5411765, 0, 1,
-1.322628, -2.209724, -1.834849, 1, 0.5450981, 0, 1,
-1.32087, -1.53912, -4.536959, 1, 0.5529412, 0, 1,
-1.31657, 1.56289, -1.405801, 1, 0.5568628, 0, 1,
-1.313219, -0.4665962, -3.584548, 1, 0.5647059, 0, 1,
-1.309248, -1.004561, -1.002502, 1, 0.5686275, 0, 1,
-1.303657, 0.2601769, -1.386337, 1, 0.5764706, 0, 1,
-1.299472, -1.769332, -1.722123, 1, 0.5803922, 0, 1,
-1.294184, 0.2764445, 0.4013364, 1, 0.5882353, 0, 1,
-1.291809, 0.7589348, -0.2757821, 1, 0.5921569, 0, 1,
-1.279218, 0.7503321, -0.5209167, 1, 0.6, 0, 1,
-1.273746, -0.420668, -1.105572, 1, 0.6078432, 0, 1,
-1.272378, 0.3527463, -1.380743, 1, 0.6117647, 0, 1,
-1.262564, -0.3001367, -3.811256, 1, 0.6196079, 0, 1,
-1.261082, 0.9539075, 1.440905, 1, 0.6235294, 0, 1,
-1.25978, 1.19208, -0.1755517, 1, 0.6313726, 0, 1,
-1.249213, -0.1943834, -1.745989, 1, 0.6352941, 0, 1,
-1.234853, -0.1855429, -3.008881, 1, 0.6431373, 0, 1,
-1.233298, 0.06632984, -0.3765085, 1, 0.6470588, 0, 1,
-1.23221, -0.9782541, -2.341617, 1, 0.654902, 0, 1,
-1.231019, -0.09756561, -2.728073, 1, 0.6588235, 0, 1,
-1.230031, -0.1353559, -1.988847, 1, 0.6666667, 0, 1,
-1.219681, -0.2922313, -3.468513, 1, 0.6705883, 0, 1,
-1.218906, 1.831195, 0.240085, 1, 0.6784314, 0, 1,
-1.218303, 1.486874, -1.322588, 1, 0.682353, 0, 1,
-1.212233, -0.7324262, -1.433687, 1, 0.6901961, 0, 1,
-1.205332, -1.079631, -2.162949, 1, 0.6941177, 0, 1,
-1.203715, -0.1518102, -1.227025, 1, 0.7019608, 0, 1,
-1.203286, -0.1278469, 0.2342783, 1, 0.7098039, 0, 1,
-1.191457, 0.5564857, -1.451115, 1, 0.7137255, 0, 1,
-1.191408, 0.5499839, -0.3835977, 1, 0.7215686, 0, 1,
-1.188083, 1.441716, 1.335039, 1, 0.7254902, 0, 1,
-1.178006, -0.784874, -1.382241, 1, 0.7333333, 0, 1,
-1.173202, -0.6243822, -1.728146, 1, 0.7372549, 0, 1,
-1.170599, -1.507258, -1.565932, 1, 0.7450981, 0, 1,
-1.16386, 1.890951, 0.0325081, 1, 0.7490196, 0, 1,
-1.152676, 0.124306, -1.834426, 1, 0.7568628, 0, 1,
-1.148415, -0.3412159, -2.538697, 1, 0.7607843, 0, 1,
-1.1439, -0.9453257, -1.427836, 1, 0.7686275, 0, 1,
-1.14127, 0.04837596, 1.090069, 1, 0.772549, 0, 1,
-1.141158, -0.08707185, 0.8554982, 1, 0.7803922, 0, 1,
-1.14002, -1.166803, -1.359822, 1, 0.7843137, 0, 1,
-1.13825, -0.9437404, -2.332468, 1, 0.7921569, 0, 1,
-1.136099, 0.4493828, -2.720649, 1, 0.7960784, 0, 1,
-1.134691, -0.7727237, -2.442683, 1, 0.8039216, 0, 1,
-1.134611, -1.269255, -2.455884, 1, 0.8117647, 0, 1,
-1.134228, 0.6510352, -2.189212, 1, 0.8156863, 0, 1,
-1.130703, -0.470759, -3.492213, 1, 0.8235294, 0, 1,
-1.129893, -0.02648204, -1.644336, 1, 0.827451, 0, 1,
-1.126917, -0.7748337, -2.52017, 1, 0.8352941, 0, 1,
-1.112698, 1.403575, -0.02274761, 1, 0.8392157, 0, 1,
-1.108752, -0.2987058, -2.69166, 1, 0.8470588, 0, 1,
-1.103762, -2.006288, -2.747962, 1, 0.8509804, 0, 1,
-1.103147, -0.1141731, -1.064721, 1, 0.8588235, 0, 1,
-1.097152, -0.4797739, -4.710599, 1, 0.8627451, 0, 1,
-1.091287, 1.2248, 0.7723846, 1, 0.8705882, 0, 1,
-1.08932, -0.2479399, -2.349423, 1, 0.8745098, 0, 1,
-1.088447, -0.07332703, -1.125409, 1, 0.8823529, 0, 1,
-1.082398, 0.1318227, -2.168651, 1, 0.8862745, 0, 1,
-1.081753, 0.1357197, -0.685764, 1, 0.8941177, 0, 1,
-1.080861, 0.3256215, -1.3298, 1, 0.8980392, 0, 1,
-1.067817, -0.3434481, -2.310673, 1, 0.9058824, 0, 1,
-1.064687, 0.2040631, -1.681056, 1, 0.9137255, 0, 1,
-1.062538, -0.5509515, -1.105649, 1, 0.9176471, 0, 1,
-1.06165, 0.3357722, -0.816301, 1, 0.9254902, 0, 1,
-1.058356, 0.2180956, -1.243317, 1, 0.9294118, 0, 1,
-1.051855, -0.06097421, -0.6899936, 1, 0.9372549, 0, 1,
-1.049803, -0.2701468, -3.383799, 1, 0.9411765, 0, 1,
-1.049755, 0.6139547, -3.303596, 1, 0.9490196, 0, 1,
-1.049665, -0.2379007, -1.934744, 1, 0.9529412, 0, 1,
-1.046827, -1.248121, -3.40108, 1, 0.9607843, 0, 1,
-1.045287, 0.553176, -1.277344, 1, 0.9647059, 0, 1,
-1.040441, -0.7343335, -1.634957, 1, 0.972549, 0, 1,
-1.032591, 0.06662158, -0.5251273, 1, 0.9764706, 0, 1,
-1.022256, -1.033493, -0.7799777, 1, 0.9843137, 0, 1,
-1.015374, 0.4225728, -0.1950131, 1, 0.9882353, 0, 1,
-1.012257, -0.06137761, -0.8038368, 1, 0.9960784, 0, 1,
-1.010358, -0.5568151, -1.840254, 0.9960784, 1, 0, 1,
-1.009644, 1.211834, 1.087793, 0.9921569, 1, 0, 1,
-0.9987206, -0.1877785, -1.759977, 0.9843137, 1, 0, 1,
-0.9833972, -0.2434809, -2.87517, 0.9803922, 1, 0, 1,
-0.9799063, 0.9044139, -0.5827291, 0.972549, 1, 0, 1,
-0.9703986, 1.173057, -1.637912, 0.9686275, 1, 0, 1,
-0.9665582, 0.9816426, -0.328688, 0.9607843, 1, 0, 1,
-0.9661946, -0.5949642, -2.875613, 0.9568627, 1, 0, 1,
-0.9651685, 1.576801, -1.390509, 0.9490196, 1, 0, 1,
-0.958261, 0.3116264, -1.829516, 0.945098, 1, 0, 1,
-0.949032, 1.322967, -1.086752, 0.9372549, 1, 0, 1,
-0.9488481, 1.600925, 0.6363015, 0.9333333, 1, 0, 1,
-0.9212953, -2.740414, -1.839176, 0.9254902, 1, 0, 1,
-0.9184771, -0.8458704, -2.873637, 0.9215686, 1, 0, 1,
-0.9165585, 0.82719, -0.1634876, 0.9137255, 1, 0, 1,
-0.9093515, 0.7124872, -1.976788, 0.9098039, 1, 0, 1,
-0.9061142, 1.665444, -0.5446854, 0.9019608, 1, 0, 1,
-0.9048113, -0.1392821, -1.320877, 0.8941177, 1, 0, 1,
-0.9039142, 0.623412, -0.5300353, 0.8901961, 1, 0, 1,
-0.901649, -0.2980251, -1.717104, 0.8823529, 1, 0, 1,
-0.8957653, -2.054778, -3.505293, 0.8784314, 1, 0, 1,
-0.8921107, 0.9423023, -0.3619387, 0.8705882, 1, 0, 1,
-0.8888997, -0.2822364, -2.394674, 0.8666667, 1, 0, 1,
-0.8849201, 0.1936761, -0.4770404, 0.8588235, 1, 0, 1,
-0.8826204, -0.8043637, -3.29147, 0.854902, 1, 0, 1,
-0.8784667, 0.2229261, -0.9749668, 0.8470588, 1, 0, 1,
-0.8775036, 1.150224, -1.09278, 0.8431373, 1, 0, 1,
-0.8727492, 1.040398, -0.410416, 0.8352941, 1, 0, 1,
-0.8704991, -0.8991469, -2.331424, 0.8313726, 1, 0, 1,
-0.8651397, 0.3882319, -0.1275059, 0.8235294, 1, 0, 1,
-0.8619481, 1.186999, -1.459344, 0.8196079, 1, 0, 1,
-0.8540391, 0.8448853, 0.5416492, 0.8117647, 1, 0, 1,
-0.8538966, 1.52268, -1.846398, 0.8078431, 1, 0, 1,
-0.8532397, -2.219161, -3.604448, 0.8, 1, 0, 1,
-0.8493894, 0.7154021, 0.9090796, 0.7921569, 1, 0, 1,
-0.8465926, 0.4608893, -1.26779, 0.7882353, 1, 0, 1,
-0.8398648, 0.3175367, -1.183481, 0.7803922, 1, 0, 1,
-0.8307533, 0.8718185, -0.6097286, 0.7764706, 1, 0, 1,
-0.8289436, 0.01771912, -1.101986, 0.7686275, 1, 0, 1,
-0.8280756, -2.343134, -3.073179, 0.7647059, 1, 0, 1,
-0.8211565, -0.03353091, -0.9332389, 0.7568628, 1, 0, 1,
-0.818399, 0.1313146, -2.439092, 0.7529412, 1, 0, 1,
-0.8177672, 0.5634956, -0.5579545, 0.7450981, 1, 0, 1,
-0.8130458, -1.532598, -3.22131, 0.7411765, 1, 0, 1,
-0.812158, -0.8030186, -4.551733, 0.7333333, 1, 0, 1,
-0.8055766, 1.510306, 0.004705229, 0.7294118, 1, 0, 1,
-0.8028387, 0.8134761, -1.6157, 0.7215686, 1, 0, 1,
-0.8001008, 0.8838562, -0.4968477, 0.7176471, 1, 0, 1,
-0.7996536, 2.062353, 0.07652904, 0.7098039, 1, 0, 1,
-0.7992935, -0.1880376, -3.06096, 0.7058824, 1, 0, 1,
-0.791475, -0.1739932, -1.584555, 0.6980392, 1, 0, 1,
-0.7838559, -0.1362277, -2.138874, 0.6901961, 1, 0, 1,
-0.7774794, -0.3033229, -1.537325, 0.6862745, 1, 0, 1,
-0.7726254, 0.6356109, -2.032568, 0.6784314, 1, 0, 1,
-0.7696043, -0.2223206, -3.042882, 0.6745098, 1, 0, 1,
-0.7634385, -1.680915, -0.8419922, 0.6666667, 1, 0, 1,
-0.7626553, 0.2051158, -0.5345555, 0.6627451, 1, 0, 1,
-0.7566288, 0.1502122, -1.307396, 0.654902, 1, 0, 1,
-0.7469616, -2.369941, -2.735795, 0.6509804, 1, 0, 1,
-0.7429456, 0.3938696, -2.216679, 0.6431373, 1, 0, 1,
-0.728082, 0.1726069, -0.7340373, 0.6392157, 1, 0, 1,
-0.7245855, -1.610922, -2.993312, 0.6313726, 1, 0, 1,
-0.7233217, -0.5383744, -1.733117, 0.627451, 1, 0, 1,
-0.7189711, -1.341594, -1.320062, 0.6196079, 1, 0, 1,
-0.7133281, -0.01584339, -1.289083, 0.6156863, 1, 0, 1,
-0.7132656, 0.08716696, -0.3209595, 0.6078432, 1, 0, 1,
-0.7106399, -0.3004229, -1.492925, 0.6039216, 1, 0, 1,
-0.6956918, 0.3672096, -1.296997, 0.5960785, 1, 0, 1,
-0.694123, -0.2608245, -2.929747, 0.5882353, 1, 0, 1,
-0.6907809, 0.4802968, 1.765432, 0.5843138, 1, 0, 1,
-0.6847867, -0.7636214, -2.552472, 0.5764706, 1, 0, 1,
-0.6841987, 1.681674, -0.3194879, 0.572549, 1, 0, 1,
-0.6734809, 2.065881, -1.773254, 0.5647059, 1, 0, 1,
-0.6709723, -0.6214988, -2.078559, 0.5607843, 1, 0, 1,
-0.6708672, 0.2775241, 1.379411, 0.5529412, 1, 0, 1,
-0.6674492, 1.395003, -0.4714581, 0.5490196, 1, 0, 1,
-0.6632959, 0.3969948, -0.7512333, 0.5411765, 1, 0, 1,
-0.6612571, -0.649526, -2.803235, 0.5372549, 1, 0, 1,
-0.6549091, -1.039081, -2.935129, 0.5294118, 1, 0, 1,
-0.6533039, -0.2239192, -3.086755, 0.5254902, 1, 0, 1,
-0.6515819, -0.5237845, -0.5157226, 0.5176471, 1, 0, 1,
-0.6513501, 0.7730651, -2.06547, 0.5137255, 1, 0, 1,
-0.650926, -0.7146446, -2.19589, 0.5058824, 1, 0, 1,
-0.6480743, -3.456934, -2.350998, 0.5019608, 1, 0, 1,
-0.646381, -1.756271, -2.593904, 0.4941176, 1, 0, 1,
-0.6396827, -1.730311, -2.075701, 0.4862745, 1, 0, 1,
-0.6360892, -1.58773, -3.7425, 0.4823529, 1, 0, 1,
-0.6355512, -1.120124, -1.849817, 0.4745098, 1, 0, 1,
-0.6219774, 0.4994846, -0.01458336, 0.4705882, 1, 0, 1,
-0.6212993, 0.1596083, -1.932312, 0.4627451, 1, 0, 1,
-0.6194109, -0.4526113, -4.627846, 0.4588235, 1, 0, 1,
-0.6168323, 1.532712, -1.220872, 0.4509804, 1, 0, 1,
-0.6165044, -0.06702346, -2.249686, 0.4470588, 1, 0, 1,
-0.6148378, 0.06164492, -3.018048, 0.4392157, 1, 0, 1,
-0.6138676, -0.2117162, -2.325768, 0.4352941, 1, 0, 1,
-0.6112749, -1.325426, -1.49486, 0.427451, 1, 0, 1,
-0.6064556, -1.356654, -3.749094, 0.4235294, 1, 0, 1,
-0.6045593, -0.05820496, -0.8172232, 0.4156863, 1, 0, 1,
-0.6001367, -0.4963539, -1.839748, 0.4117647, 1, 0, 1,
-0.5965587, -0.8851951, -0.5942093, 0.4039216, 1, 0, 1,
-0.5917099, -2.204667, -3.39668, 0.3960784, 1, 0, 1,
-0.5902005, 0.8750499, 1.178144, 0.3921569, 1, 0, 1,
-0.5857247, -0.4169376, -2.49331, 0.3843137, 1, 0, 1,
-0.5856697, -1.859099, -2.628622, 0.3803922, 1, 0, 1,
-0.5790327, 0.3986957, -0.2636043, 0.372549, 1, 0, 1,
-0.5627048, 0.3786385, 0.7248627, 0.3686275, 1, 0, 1,
-0.5600879, 0.05685347, -2.404503, 0.3607843, 1, 0, 1,
-0.5564989, -2.298385, -1.670913, 0.3568628, 1, 0, 1,
-0.5558131, -2.802376, -3.562505, 0.3490196, 1, 0, 1,
-0.547824, 0.05173843, -2.030962, 0.345098, 1, 0, 1,
-0.547093, -0.3985202, -2.300609, 0.3372549, 1, 0, 1,
-0.5430878, -0.3374342, -2.126098, 0.3333333, 1, 0, 1,
-0.5414338, -0.9892119, -2.321783, 0.3254902, 1, 0, 1,
-0.5400566, -1.66555, -4.231812, 0.3215686, 1, 0, 1,
-0.537648, 1.283423, -0.7060171, 0.3137255, 1, 0, 1,
-0.5370978, 1.537219, -0.2318908, 0.3098039, 1, 0, 1,
-0.5369886, 0.1240773, -0.3207565, 0.3019608, 1, 0, 1,
-0.5336617, -0.002438221, -2.000939, 0.2941177, 1, 0, 1,
-0.5333339, -0.3714044, -4.044869, 0.2901961, 1, 0, 1,
-0.5330242, 1.053195, -1.059911, 0.282353, 1, 0, 1,
-0.5325005, 1.799054, 1.08977, 0.2784314, 1, 0, 1,
-0.5261766, -0.2052491, -0.01999157, 0.2705882, 1, 0, 1,
-0.5242841, -0.8688338, -0.367808, 0.2666667, 1, 0, 1,
-0.515179, 0.8553081, 0.09204059, 0.2588235, 1, 0, 1,
-0.5116678, -0.09445491, -3.53553, 0.254902, 1, 0, 1,
-0.5046797, 1.169307, -1.162174, 0.2470588, 1, 0, 1,
-0.5039762, 0.2775098, -1.619012, 0.2431373, 1, 0, 1,
-0.5030044, -0.6374654, -2.458966, 0.2352941, 1, 0, 1,
-0.501526, -0.7443007, -2.712462, 0.2313726, 1, 0, 1,
-0.5004032, -1.403788, -1.509899, 0.2235294, 1, 0, 1,
-0.5000452, -2.292063, -2.071545, 0.2196078, 1, 0, 1,
-0.4999329, -1.715688, -2.121029, 0.2117647, 1, 0, 1,
-0.4996502, -0.1161084, -1.40183, 0.2078431, 1, 0, 1,
-0.4983644, -1.61865, -1.706647, 0.2, 1, 0, 1,
-0.4970264, 0.9215254, 0.7122791, 0.1921569, 1, 0, 1,
-0.4962154, 0.1812732, 0.6098277, 0.1882353, 1, 0, 1,
-0.4956107, -0.9502734, -3.712085, 0.1803922, 1, 0, 1,
-0.4915611, -1.238034, -2.684228, 0.1764706, 1, 0, 1,
-0.489672, -0.1885859, -1.919336, 0.1686275, 1, 0, 1,
-0.4893506, -0.7964704, -0.5122444, 0.1647059, 1, 0, 1,
-0.4881635, 0.7092863, -0.7702192, 0.1568628, 1, 0, 1,
-0.4871039, -0.3748423, -2.417381, 0.1529412, 1, 0, 1,
-0.4866639, 1.351229, 0.03326174, 0.145098, 1, 0, 1,
-0.4756009, 2.333625, -0.3278519, 0.1411765, 1, 0, 1,
-0.4753606, 0.7619799, -2.121832, 0.1333333, 1, 0, 1,
-0.4689444, 1.153532, -0.06217245, 0.1294118, 1, 0, 1,
-0.4688081, 1.262258, 0.482056, 0.1215686, 1, 0, 1,
-0.4641149, 0.3677149, -1.01665, 0.1176471, 1, 0, 1,
-0.457051, 1.842268, -0.3156463, 0.1098039, 1, 0, 1,
-0.4546664, 0.5382379, -1.110241, 0.1058824, 1, 0, 1,
-0.4524592, 0.2595511, -0.8636417, 0.09803922, 1, 0, 1,
-0.4523991, 0.1675444, -0.3011106, 0.09019608, 1, 0, 1,
-0.44252, 0.3839097, -0.6888924, 0.08627451, 1, 0, 1,
-0.4377626, -0.04401548, -2.213405, 0.07843138, 1, 0, 1,
-0.4331035, 0.07744784, -1.439129, 0.07450981, 1, 0, 1,
-0.4330085, -0.2377039, -2.083587, 0.06666667, 1, 0, 1,
-0.4321527, -1.051662, -3.301057, 0.0627451, 1, 0, 1,
-0.4320658, 0.6099479, -2.668352, 0.05490196, 1, 0, 1,
-0.4287323, -1.057154, -3.340377, 0.05098039, 1, 0, 1,
-0.4252381, -0.5081577, -2.786195, 0.04313726, 1, 0, 1,
-0.4204138, -0.05954166, -1.020304, 0.03921569, 1, 0, 1,
-0.4147678, -1.283646, -2.288771, 0.03137255, 1, 0, 1,
-0.4117913, 0.4766446, -0.1705595, 0.02745098, 1, 0, 1,
-0.399642, -0.9198993, -0.3863875, 0.01960784, 1, 0, 1,
-0.3950619, -1.106273, -2.992508, 0.01568628, 1, 0, 1,
-0.3930821, -0.3167652, -1.408301, 0.007843138, 1, 0, 1,
-0.3814644, -0.05255454, -1.881239, 0.003921569, 1, 0, 1,
-0.3761643, -1.562359, -2.740071, 0, 1, 0.003921569, 1,
-0.3759874, -0.854628, -2.435592, 0, 1, 0.01176471, 1,
-0.3742705, 0.0113285, -2.742255, 0, 1, 0.01568628, 1,
-0.3737134, 0.8347123, -0.6302981, 0, 1, 0.02352941, 1,
-0.3733629, -0.5846365, -3.093347, 0, 1, 0.02745098, 1,
-0.3709816, 0.9207559, -0.4648648, 0, 1, 0.03529412, 1,
-0.3601204, 0.2240025, 0.1269845, 0, 1, 0.03921569, 1,
-0.3579713, 0.5875999, -0.4399856, 0, 1, 0.04705882, 1,
-0.3553557, -1.123038, -1.468549, 0, 1, 0.05098039, 1,
-0.3522207, -0.4384792, -3.178362, 0, 1, 0.05882353, 1,
-0.3496342, -0.7811465, -1.787617, 0, 1, 0.0627451, 1,
-0.3476456, 0.3456194, -1.192706, 0, 1, 0.07058824, 1,
-0.3450488, 1.312146, 0.454258, 0, 1, 0.07450981, 1,
-0.344979, -0.1646294, 0.2128237, 0, 1, 0.08235294, 1,
-0.3385218, 1.376948, -0.06059349, 0, 1, 0.08627451, 1,
-0.3366838, -0.1328827, -2.744522, 0, 1, 0.09411765, 1,
-0.3333741, 0.1984449, 0.337041, 0, 1, 0.1019608, 1,
-0.3311284, -1.854294, -3.227151, 0, 1, 0.1058824, 1,
-0.3244713, -0.7209918, -3.596216, 0, 1, 0.1137255, 1,
-0.3215035, -0.4465837, -3.001285, 0, 1, 0.1176471, 1,
-0.3200092, -0.9729046, -0.1375761, 0, 1, 0.1254902, 1,
-0.3137313, 1.378858, -0.52422, 0, 1, 0.1294118, 1,
-0.3093357, 1.021243, -0.9681158, 0, 1, 0.1372549, 1,
-0.3082693, -1.964841, -1.315923, 0, 1, 0.1411765, 1,
-0.3080993, 0.8908322, -0.3726623, 0, 1, 0.1490196, 1,
-0.3080274, -0.1370274, -2.27528, 0, 1, 0.1529412, 1,
-0.3066086, 1.015875, 1.483755, 0, 1, 0.1607843, 1,
-0.3064525, -2.840288, -2.934615, 0, 1, 0.1647059, 1,
-0.3018352, 0.154798, -1.369211, 0, 1, 0.172549, 1,
-0.3018324, 0.5590706, -1.481525, 0, 1, 0.1764706, 1,
-0.301666, -0.382728, -2.846109, 0, 1, 0.1843137, 1,
-0.3006488, 0.7007149, 0.4079259, 0, 1, 0.1882353, 1,
-0.2998901, 0.06520432, -0.7222576, 0, 1, 0.1960784, 1,
-0.2933748, -0.3241477, -2.738055, 0, 1, 0.2039216, 1,
-0.28747, 1.304844, -0.3078368, 0, 1, 0.2078431, 1,
-0.2772905, -0.2112475, -0.9185129, 0, 1, 0.2156863, 1,
-0.2698436, 0.2572356, -0.3022959, 0, 1, 0.2196078, 1,
-0.2671499, 1.822693, 0.6655548, 0, 1, 0.227451, 1,
-0.2668725, 0.7173781, -1.685673, 0, 1, 0.2313726, 1,
-0.2665465, 0.9902951, -0.2311768, 0, 1, 0.2392157, 1,
-0.2661523, -0.2913119, -2.356499, 0, 1, 0.2431373, 1,
-0.2653473, -0.8381538, -1.979161, 0, 1, 0.2509804, 1,
-0.2608656, 0.02004627, -2.621511, 0, 1, 0.254902, 1,
-0.2587538, 1.033809, -1.259055, 0, 1, 0.2627451, 1,
-0.2575658, -1.713537, -1.592993, 0, 1, 0.2666667, 1,
-0.2560948, 0.436613, 0.07924633, 0, 1, 0.2745098, 1,
-0.2541996, -0.2144685, -2.353738, 0, 1, 0.2784314, 1,
-0.2541288, -0.8160068, -4.038586, 0, 1, 0.2862745, 1,
-0.2537714, 0.03357983, -1.604299, 0, 1, 0.2901961, 1,
-0.2500808, -1.462032, -2.757242, 0, 1, 0.2980392, 1,
-0.2417767, 0.2685134, 0.881699, 0, 1, 0.3058824, 1,
-0.2416181, -1.108107, -1.40219, 0, 1, 0.3098039, 1,
-0.2403916, 1.946489, -0.397772, 0, 1, 0.3176471, 1,
-0.2401735, -0.8795286, -2.255811, 0, 1, 0.3215686, 1,
-0.2401152, -0.8295836, -4.00577, 0, 1, 0.3294118, 1,
-0.2392569, -0.6982799, -3.429558, 0, 1, 0.3333333, 1,
-0.2383072, 0.8186857, -1.288644, 0, 1, 0.3411765, 1,
-0.2377807, 0.8272457, -0.874979, 0, 1, 0.345098, 1,
-0.2359008, 0.6889017, 1.513584, 0, 1, 0.3529412, 1,
-0.2314665, 1.245862, -1.588282, 0, 1, 0.3568628, 1,
-0.2314365, 0.9938356, 0.677617, 0, 1, 0.3647059, 1,
-0.2255459, -2.003617, -2.836988, 0, 1, 0.3686275, 1,
-0.2223442, -1.097016, -3.486815, 0, 1, 0.3764706, 1,
-0.2198743, -0.6132952, -2.648963, 0, 1, 0.3803922, 1,
-0.2179068, -0.3551551, -1.942836, 0, 1, 0.3882353, 1,
-0.2120501, -0.2737141, -3.282285, 0, 1, 0.3921569, 1,
-0.2083111, -0.5039296, -3.033957, 0, 1, 0.4, 1,
-0.205309, 0.8718438, -0.6393665, 0, 1, 0.4078431, 1,
-0.202877, 0.8821447, -0.5554432, 0, 1, 0.4117647, 1,
-0.2028424, 0.2877681, 0.1904491, 0, 1, 0.4196078, 1,
-0.1983907, 0.0414091, -3.551783, 0, 1, 0.4235294, 1,
-0.1970412, 0.08047215, -1.599589, 0, 1, 0.4313726, 1,
-0.19622, 0.1599836, -1.928411, 0, 1, 0.4352941, 1,
-0.1943031, -0.2190041, -2.100276, 0, 1, 0.4431373, 1,
-0.1903929, 0.3780741, -0.1307727, 0, 1, 0.4470588, 1,
-0.1895712, -1.039026, -1.322269, 0, 1, 0.454902, 1,
-0.1887457, 0.8366203, 0.3153323, 0, 1, 0.4588235, 1,
-0.1846233, -1.378295, -3.599832, 0, 1, 0.4666667, 1,
-0.1789039, -1.788823, -2.043981, 0, 1, 0.4705882, 1,
-0.176391, -0.9780481, -3.297044, 0, 1, 0.4784314, 1,
-0.1746829, -1.313801, -2.598176, 0, 1, 0.4823529, 1,
-0.1742314, -0.6545257, -3.447143, 0, 1, 0.4901961, 1,
-0.1712733, -0.3630734, -0.5998574, 0, 1, 0.4941176, 1,
-0.1712434, 0.3805901, -1.136087, 0, 1, 0.5019608, 1,
-0.1665323, 0.5127504, -1.578445, 0, 1, 0.509804, 1,
-0.159769, -0.2597762, -3.638657, 0, 1, 0.5137255, 1,
-0.1525005, -0.6438519, -3.305816, 0, 1, 0.5215687, 1,
-0.1507494, -0.005941662, -2.296972, 0, 1, 0.5254902, 1,
-0.1503363, -0.03116617, -2.533467, 0, 1, 0.5333334, 1,
-0.145682, -0.05940095, -2.767344, 0, 1, 0.5372549, 1,
-0.1450983, -0.09370685, -1.912558, 0, 1, 0.5450981, 1,
-0.1421028, -0.5963039, -2.065061, 0, 1, 0.5490196, 1,
-0.1382624, -0.004644126, -2.154001, 0, 1, 0.5568628, 1,
-0.1379045, -0.3244205, -1.81063, 0, 1, 0.5607843, 1,
-0.1294436, -0.01887272, -2.01486, 0, 1, 0.5686275, 1,
-0.1286424, 0.4548455, -0.2214052, 0, 1, 0.572549, 1,
-0.1253468, -1.18017, -3.296719, 0, 1, 0.5803922, 1,
-0.1251222, 0.120956, 0.7379723, 0, 1, 0.5843138, 1,
-0.1249515, 0.5069886, -1.036306, 0, 1, 0.5921569, 1,
-0.1178479, -1.676582, -3.485062, 0, 1, 0.5960785, 1,
-0.116605, 0.8181153, 0.4945598, 0, 1, 0.6039216, 1,
-0.1145627, -1.212169, -3.194252, 0, 1, 0.6117647, 1,
-0.1141729, 1.677013, 0.5067929, 0, 1, 0.6156863, 1,
-0.1116124, -0.2070456, -3.787075, 0, 1, 0.6235294, 1,
-0.1110988, 0.6607916, -0.1229024, 0, 1, 0.627451, 1,
-0.1089019, -0.4274715, -2.153081, 0, 1, 0.6352941, 1,
-0.1080246, 0.146935, -1.045021, 0, 1, 0.6392157, 1,
-0.1079571, -1.984922, -1.700327, 0, 1, 0.6470588, 1,
-0.1062342, -0.7438383, -2.17504, 0, 1, 0.6509804, 1,
-0.1014142, -1.287932, -3.224752, 0, 1, 0.6588235, 1,
-0.09829482, -0.4353423, -3.660005, 0, 1, 0.6627451, 1,
-0.09530327, -1.469759, -0.8406062, 0, 1, 0.6705883, 1,
-0.09440596, 1.711788, -1.746256, 0, 1, 0.6745098, 1,
-0.09173307, 0.7298899, 1.47764, 0, 1, 0.682353, 1,
-0.08969897, -1.23196, -3.442661, 0, 1, 0.6862745, 1,
-0.08795127, 0.848762, -0.01408757, 0, 1, 0.6941177, 1,
-0.08626776, 0.4490901, 0.5116925, 0, 1, 0.7019608, 1,
-0.08597463, -0.6626002, -3.455708, 0, 1, 0.7058824, 1,
-0.08592412, -0.5354576, -2.678131, 0, 1, 0.7137255, 1,
-0.08111762, 0.46523, 0.5052185, 0, 1, 0.7176471, 1,
-0.07542952, -0.1980268, -3.975387, 0, 1, 0.7254902, 1,
-0.07340253, 1.17174, 1.336468, 0, 1, 0.7294118, 1,
-0.07153568, -0.6624227, -2.129412, 0, 1, 0.7372549, 1,
-0.07136749, -0.5157089, -3.039314, 0, 1, 0.7411765, 1,
-0.07053951, 0.762319, -1.068264, 0, 1, 0.7490196, 1,
-0.06961346, -0.3854879, -2.10665, 0, 1, 0.7529412, 1,
-0.06851087, -1.310949, -3.431644, 0, 1, 0.7607843, 1,
-0.06535522, -0.7444779, -2.335272, 0, 1, 0.7647059, 1,
-0.06275435, 1.080295, 0.6580745, 0, 1, 0.772549, 1,
-0.0619764, 0.6283477, 0.5761849, 0, 1, 0.7764706, 1,
-0.06080612, -1.510181, -3.842553, 0, 1, 0.7843137, 1,
-0.06071012, 1.006974, -1.367718, 0, 1, 0.7882353, 1,
-0.05755768, 0.1916782, -0.8754069, 0, 1, 0.7960784, 1,
-0.04770739, -0.03783477, -4.234426, 0, 1, 0.8039216, 1,
-0.04527136, 0.2578072, -1.110361, 0, 1, 0.8078431, 1,
-0.03955609, -1.014768, -1.726258, 0, 1, 0.8156863, 1,
-0.039337, 0.1078897, 0.6866844, 0, 1, 0.8196079, 1,
-0.03900329, -0.3111106, -2.68802, 0, 1, 0.827451, 1,
-0.03790187, 0.5142285, -0.5792687, 0, 1, 0.8313726, 1,
-0.03470401, -0.4905357, -5.040461, 0, 1, 0.8392157, 1,
-0.03442605, -1.499892, -4.032798, 0, 1, 0.8431373, 1,
-0.03201419, 0.193209, -0.5789864, 0, 1, 0.8509804, 1,
-0.03165013, -0.6864454, -4.973308, 0, 1, 0.854902, 1,
-0.03084472, -0.6441633, -3.704757, 0, 1, 0.8627451, 1,
-0.02215363, 1.292305, 1.314219, 0, 1, 0.8666667, 1,
-0.02173078, 1.228306, -1.468349, 0, 1, 0.8745098, 1,
-0.01903986, -0.09125147, -3.113251, 0, 1, 0.8784314, 1,
-0.01872489, -0.4076297, -2.297091, 0, 1, 0.8862745, 1,
-0.01761007, 0.2298866, 1.136343, 0, 1, 0.8901961, 1,
-0.01256174, -0.04073847, -1.123874, 0, 1, 0.8980392, 1,
-0.007720777, 0.05119582, 1.172254, 0, 1, 0.9058824, 1,
-0.005628374, -0.7213811, -3.476784, 0, 1, 0.9098039, 1,
-0.004721962, 0.851495, -0.827706, 0, 1, 0.9176471, 1,
-0.001217326, -0.9175166, -3.543459, 0, 1, 0.9215686, 1,
0.001318652, 0.1442247, -0.6580181, 0, 1, 0.9294118, 1,
0.002809466, 1.472239, -1.256915, 0, 1, 0.9333333, 1,
0.004633493, -0.2871198, 4.064859, 0, 1, 0.9411765, 1,
0.005198918, -0.3384329, 3.305721, 0, 1, 0.945098, 1,
0.006934589, -0.5007026, 2.303121, 0, 1, 0.9529412, 1,
0.007090006, 0.8603747, 1.006788, 0, 1, 0.9568627, 1,
0.01053762, 2.190827, 0.6142682, 0, 1, 0.9647059, 1,
0.01157846, -0.5505516, 4.644437, 0, 1, 0.9686275, 1,
0.0126905, 0.723137, 1.627954, 0, 1, 0.9764706, 1,
0.02161688, -0.7179829, 2.223984, 0, 1, 0.9803922, 1,
0.0289548, -0.3061517, 3.384181, 0, 1, 0.9882353, 1,
0.03040326, 0.08341591, 2.07541, 0, 1, 0.9921569, 1,
0.03250505, -1.776385, 2.285044, 0, 1, 1, 1,
0.03507335, 1.078404, 1.051085, 0, 0.9921569, 1, 1,
0.03872741, 0.2739044, -2.309974, 0, 0.9882353, 1, 1,
0.04076682, 0.2054119, 0.9134845, 0, 0.9803922, 1, 1,
0.04110925, -0.1241638, 4.31239, 0, 0.9764706, 1, 1,
0.04182188, 0.2457391, 0.7822508, 0, 0.9686275, 1, 1,
0.04579398, -0.3089502, 2.79006, 0, 0.9647059, 1, 1,
0.0462209, 1.925827, -0.6713588, 0, 0.9568627, 1, 1,
0.04678241, -0.1849803, 0.9430934, 0, 0.9529412, 1, 1,
0.04703584, -0.009754618, 1.671678, 0, 0.945098, 1, 1,
0.04808147, 2.759092, 0.02860982, 0, 0.9411765, 1, 1,
0.04970424, -0.455696, 4.159737, 0, 0.9333333, 1, 1,
0.05263205, -1.987811, 0.7431054, 0, 0.9294118, 1, 1,
0.05294877, -2.000204, 4.235004, 0, 0.9215686, 1, 1,
0.05312992, -0.6109424, 2.968905, 0, 0.9176471, 1, 1,
0.06121741, -1.355808, 1.756545, 0, 0.9098039, 1, 1,
0.07087096, -0.3361451, 1.237721, 0, 0.9058824, 1, 1,
0.07152167, 2.66737, 1.191642, 0, 0.8980392, 1, 1,
0.07616261, 0.2212273, -0.01737203, 0, 0.8901961, 1, 1,
0.07935477, 2.770453, 0.9972818, 0, 0.8862745, 1, 1,
0.08137575, -1.485717, 1.959393, 0, 0.8784314, 1, 1,
0.08261428, -0.3459407, 3.010256, 0, 0.8745098, 1, 1,
0.08303837, 0.4982271, -0.115686, 0, 0.8666667, 1, 1,
0.08676662, 0.1619034, 0.2595724, 0, 0.8627451, 1, 1,
0.08736404, 0.08953413, 0.9594325, 0, 0.854902, 1, 1,
0.08982272, 0.4436663, 0.5238485, 0, 0.8509804, 1, 1,
0.09041328, -0.9688172, 0.626228, 0, 0.8431373, 1, 1,
0.09068297, -0.7289752, 2.716725, 0, 0.8392157, 1, 1,
0.09077834, -1.235731, 4.334186, 0, 0.8313726, 1, 1,
0.09131411, 0.6260656, 0.03137463, 0, 0.827451, 1, 1,
0.09143207, 0.5549817, 0.1015934, 0, 0.8196079, 1, 1,
0.09230979, -1.040782, 2.767709, 0, 0.8156863, 1, 1,
0.09351051, 1.098476, -1.420177, 0, 0.8078431, 1, 1,
0.09736622, -0.3788712, 2.602803, 0, 0.8039216, 1, 1,
0.1034206, 1.619406, 1.426396, 0, 0.7960784, 1, 1,
0.1045169, 1.831751, 1.398222, 0, 0.7882353, 1, 1,
0.1060904, -0.4296076, 4.831493, 0, 0.7843137, 1, 1,
0.1066401, 0.05077042, -1.389329, 0, 0.7764706, 1, 1,
0.1071297, 0.8049541, -0.3901216, 0, 0.772549, 1, 1,
0.1083514, 1.435316, 0.4564093, 0, 0.7647059, 1, 1,
0.1098857, 1.689717, -0.9758436, 0, 0.7607843, 1, 1,
0.1117168, -0.1615547, 4.276064, 0, 0.7529412, 1, 1,
0.1127073, 0.004690466, 0.3788605, 0, 0.7490196, 1, 1,
0.1129985, 0.6870594, -0.4380828, 0, 0.7411765, 1, 1,
0.11637, -2.209205, 2.748856, 0, 0.7372549, 1, 1,
0.116417, -0.4478891, 2.422559, 0, 0.7294118, 1, 1,
0.1174753, -0.9207435, 3.110266, 0, 0.7254902, 1, 1,
0.1289388, 0.01506872, 2.022788, 0, 0.7176471, 1, 1,
0.1371445, -1.311485, 3.611259, 0, 0.7137255, 1, 1,
0.1375641, 0.472148, -1.21097, 0, 0.7058824, 1, 1,
0.137716, 0.2040154, -0.05960468, 0, 0.6980392, 1, 1,
0.1388198, 0.6244066, -0.6366423, 0, 0.6941177, 1, 1,
0.1398251, -1.956582, 5.500188, 0, 0.6862745, 1, 1,
0.1416087, 1.681775, -0.1247401, 0, 0.682353, 1, 1,
0.1444325, -0.4007773, 2.265326, 0, 0.6745098, 1, 1,
0.1452368, 0.7619414, -1.167297, 0, 0.6705883, 1, 1,
0.1495194, 0.4463754, 0.805284, 0, 0.6627451, 1, 1,
0.1497677, 1.019966, 0.01674656, 0, 0.6588235, 1, 1,
0.1503677, -0.09559727, 2.336105, 0, 0.6509804, 1, 1,
0.1506215, -1.11718, 3.839897, 0, 0.6470588, 1, 1,
0.1524244, 0.2693184, 0.8575462, 0, 0.6392157, 1, 1,
0.1573889, -1.114668, 1.251165, 0, 0.6352941, 1, 1,
0.1587187, -0.4739213, 1.587834, 0, 0.627451, 1, 1,
0.1638696, -1.180896, 3.424549, 0, 0.6235294, 1, 1,
0.165895, -0.4014415, 2.563467, 0, 0.6156863, 1, 1,
0.1663824, 0.5626679, 0.01831412, 0, 0.6117647, 1, 1,
0.167377, 0.7181532, 0.5605032, 0, 0.6039216, 1, 1,
0.1683598, 1.217575, 0.7539223, 0, 0.5960785, 1, 1,
0.1740198, -1.389885, 1.910709, 0, 0.5921569, 1, 1,
0.1753957, 1.141322, 0.5188764, 0, 0.5843138, 1, 1,
0.1759008, -1.00335, 2.837352, 0, 0.5803922, 1, 1,
0.1768882, -0.1026488, 2.198795, 0, 0.572549, 1, 1,
0.1770337, -1.617914, 4.96173, 0, 0.5686275, 1, 1,
0.1783903, -1.524088, 3.786978, 0, 0.5607843, 1, 1,
0.1805247, 0.2255315, -0.03133893, 0, 0.5568628, 1, 1,
0.193141, -0.2951235, 2.622173, 0, 0.5490196, 1, 1,
0.2017579, 0.3172472, -1.720447, 0, 0.5450981, 1, 1,
0.2026462, 0.569976, 0.04475608, 0, 0.5372549, 1, 1,
0.2035182, 1.661563, 0.2050685, 0, 0.5333334, 1, 1,
0.2086093, 0.5504578, 1.135215, 0, 0.5254902, 1, 1,
0.2149027, 0.3497705, 2.541294, 0, 0.5215687, 1, 1,
0.2155482, -0.9162472, 2.014729, 0, 0.5137255, 1, 1,
0.2228593, -1.105963, 3.002108, 0, 0.509804, 1, 1,
0.2274637, -0.6341095, 3.959524, 0, 0.5019608, 1, 1,
0.2311665, 0.2951444, 0.2640303, 0, 0.4941176, 1, 1,
0.2339488, -1.482614, 1.63997, 0, 0.4901961, 1, 1,
0.2356072, 0.6372345, 1.874323, 0, 0.4823529, 1, 1,
0.2365089, 0.9206703, -0.5894771, 0, 0.4784314, 1, 1,
0.2387387, -1.133721, 3.013514, 0, 0.4705882, 1, 1,
0.2394315, 1.116017, -0.2721947, 0, 0.4666667, 1, 1,
0.2407251, 1.298779, 1.640982, 0, 0.4588235, 1, 1,
0.2424219, 0.4893139, -0.4747817, 0, 0.454902, 1, 1,
0.2433152, 1.598217, -0.1529284, 0, 0.4470588, 1, 1,
0.2471291, 0.5410916, 1.697471, 0, 0.4431373, 1, 1,
0.2551446, -0.5575538, 3.310611, 0, 0.4352941, 1, 1,
0.2603854, -1.780306, 2.318855, 0, 0.4313726, 1, 1,
0.2609617, 1.349716, 1.962604, 0, 0.4235294, 1, 1,
0.2612273, -0.5424035, 2.444726, 0, 0.4196078, 1, 1,
0.2654395, 0.4326324, 0.7477785, 0, 0.4117647, 1, 1,
0.266744, -0.7002109, 3.730376, 0, 0.4078431, 1, 1,
0.2671019, -1.453336, 2.436363, 0, 0.4, 1, 1,
0.2683257, 0.6795299, -0.744768, 0, 0.3921569, 1, 1,
0.2687175, 1.143844, -0.04609856, 0, 0.3882353, 1, 1,
0.2727222, 1.656672, -1.074834, 0, 0.3803922, 1, 1,
0.2736368, -0.4728685, 1.790146, 0, 0.3764706, 1, 1,
0.2737477, 0.4669277, 0.4227802, 0, 0.3686275, 1, 1,
0.2787369, -1.917357, 3.485573, 0, 0.3647059, 1, 1,
0.288437, 0.4544389, 0.7530478, 0, 0.3568628, 1, 1,
0.2886973, 1.16945, 1.088994, 0, 0.3529412, 1, 1,
0.2888609, 0.1721799, -0.1751258, 0, 0.345098, 1, 1,
0.3020187, -0.9632217, 1.123655, 0, 0.3411765, 1, 1,
0.3054951, 0.2045985, 0.2784755, 0, 0.3333333, 1, 1,
0.3094507, 0.2789977, 1.340628, 0, 0.3294118, 1, 1,
0.3107906, -0.7010998, 4.188462, 0, 0.3215686, 1, 1,
0.312591, 1.284347, 0.2081994, 0, 0.3176471, 1, 1,
0.3152427, 0.5647731, -1.622235, 0, 0.3098039, 1, 1,
0.3155779, 0.7015467, -0.4038948, 0, 0.3058824, 1, 1,
0.3179165, 0.1357923, 1.833914, 0, 0.2980392, 1, 1,
0.3186604, 1.981441, -0.4535121, 0, 0.2901961, 1, 1,
0.3207513, 0.2270717, 1.807926, 0, 0.2862745, 1, 1,
0.3250871, -0.8201562, 2.267579, 0, 0.2784314, 1, 1,
0.3277095, 0.7137567, 2.624102, 0, 0.2745098, 1, 1,
0.3307948, 0.2389754, 0.1883518, 0, 0.2666667, 1, 1,
0.3319059, 0.06390657, 1.261602, 0, 0.2627451, 1, 1,
0.3320032, 0.6508483, -0.6104226, 0, 0.254902, 1, 1,
0.335909, 0.2368194, 0.5209574, 0, 0.2509804, 1, 1,
0.339001, -1.300254, 3.714178, 0, 0.2431373, 1, 1,
0.3418182, 0.4560773, 0.6613684, 0, 0.2392157, 1, 1,
0.3422865, -0.1205712, 2.024793, 0, 0.2313726, 1, 1,
0.3430446, -0.6097943, 2.581182, 0, 0.227451, 1, 1,
0.3446153, 1.223623, 1.256427, 0, 0.2196078, 1, 1,
0.3454814, -0.7243024, 1.487325, 0, 0.2156863, 1, 1,
0.3476825, 1.100214, 0.4085101, 0, 0.2078431, 1, 1,
0.3477134, 0.3330815, 0.8953137, 0, 0.2039216, 1, 1,
0.3529543, 0.5144562, 0.3617713, 0, 0.1960784, 1, 1,
0.3531988, -1.076458, 3.270924, 0, 0.1882353, 1, 1,
0.3537969, -0.205628, 2.215425, 0, 0.1843137, 1, 1,
0.3538598, -0.6925843, 2.934804, 0, 0.1764706, 1, 1,
0.3543842, -0.5241141, 4.645202, 0, 0.172549, 1, 1,
0.3590918, -2.398801, 3.71152, 0, 0.1647059, 1, 1,
0.3597934, 0.7723042, 1.550356, 0, 0.1607843, 1, 1,
0.3622104, 1.416321, 2.147015, 0, 0.1529412, 1, 1,
0.3678715, 0.9215505, 3.268096, 0, 0.1490196, 1, 1,
0.3688356, 0.9705812, -0.4687785, 0, 0.1411765, 1, 1,
0.3706786, 0.3475431, 0.08166577, 0, 0.1372549, 1, 1,
0.3708337, -0.7847078, 2.442282, 0, 0.1294118, 1, 1,
0.3753835, 1.246877, -0.8411787, 0, 0.1254902, 1, 1,
0.3794484, 0.8238776, 1.037722, 0, 0.1176471, 1, 1,
0.3815815, 0.4864333, 0.6571593, 0, 0.1137255, 1, 1,
0.3837689, 0.6999924, 0.9692712, 0, 0.1058824, 1, 1,
0.384951, 0.3712406, 1.251991, 0, 0.09803922, 1, 1,
0.3867084, -1.531158, 4.694425, 0, 0.09411765, 1, 1,
0.3884022, -1.018928, 2.364519, 0, 0.08627451, 1, 1,
0.3974165, 1.336599, -0.188048, 0, 0.08235294, 1, 1,
0.3974629, 0.2903745, -0.2229353, 0, 0.07450981, 1, 1,
0.4030173, 0.2761906, 1.320848, 0, 0.07058824, 1, 1,
0.4077104, -0.5098925, 1.784037, 0, 0.0627451, 1, 1,
0.4080431, 1.160885, 0.7805125, 0, 0.05882353, 1, 1,
0.4109226, -0.9363896, -0.6232266, 0, 0.05098039, 1, 1,
0.413975, -0.4622005, 3.223226, 0, 0.04705882, 1, 1,
0.4152691, -1.306349, 1.39839, 0, 0.03921569, 1, 1,
0.4163712, 1.118457, 0.6345772, 0, 0.03529412, 1, 1,
0.4178748, -1.166361, 3.889607, 0, 0.02745098, 1, 1,
0.4204215, -0.5371183, 1.245183, 0, 0.02352941, 1, 1,
0.4204241, -0.5798906, 2.58013, 0, 0.01568628, 1, 1,
0.4209496, 2.652598, -0.2540478, 0, 0.01176471, 1, 1,
0.424064, -1.310407, 3.432001, 0, 0.003921569, 1, 1,
0.4251097, 0.2205849, 3.283264, 0.003921569, 0, 1, 1,
0.4266865, -0.04065556, 0.187279, 0.007843138, 0, 1, 1,
0.4268455, 1.179643, 0.5175685, 0.01568628, 0, 1, 1,
0.4294264, 1.380853, 1.391267, 0.01960784, 0, 1, 1,
0.4299298, -0.3436853, 1.109031, 0.02745098, 0, 1, 1,
0.4317456, -0.000307373, 0.544847, 0.03137255, 0, 1, 1,
0.4372255, -0.267338, 3.504622, 0.03921569, 0, 1, 1,
0.4372907, -0.3253361, 1.878967, 0.04313726, 0, 1, 1,
0.4422261, 0.2150287, 1.422166, 0.05098039, 0, 1, 1,
0.4427564, 0.6328992, 2.06793, 0.05490196, 0, 1, 1,
0.4496171, -0.1175225, 0.5629582, 0.0627451, 0, 1, 1,
0.4503868, -0.662731, 2.617759, 0.06666667, 0, 1, 1,
0.4510356, -0.3630367, 1.860187, 0.07450981, 0, 1, 1,
0.4516925, 0.4843293, -0.3466919, 0.07843138, 0, 1, 1,
0.4530705, 1.452539, -1.046302, 0.08627451, 0, 1, 1,
0.4562738, -0.7919195, 1.718915, 0.09019608, 0, 1, 1,
0.4568711, 0.1702846, 0.4865645, 0.09803922, 0, 1, 1,
0.4704348, -0.08296104, 2.52021, 0.1058824, 0, 1, 1,
0.4706589, 0.3801519, 0.4771715, 0.1098039, 0, 1, 1,
0.4712012, -0.02118992, 1.833298, 0.1176471, 0, 1, 1,
0.4720087, 1.08463, 0.2572491, 0.1215686, 0, 1, 1,
0.4721128, 1.351756, 1.452365, 0.1294118, 0, 1, 1,
0.4726482, 0.2314019, 0.5857905, 0.1333333, 0, 1, 1,
0.4790592, 0.7729854, 0.5193606, 0.1411765, 0, 1, 1,
0.4800961, -1.189157, 2.168304, 0.145098, 0, 1, 1,
0.4904774, -0.465005, 2.726961, 0.1529412, 0, 1, 1,
0.49327, 1.209579, 1.385513, 0.1568628, 0, 1, 1,
0.4933753, 1.07665, 0.9210343, 0.1647059, 0, 1, 1,
0.4998356, -1.105926, 3.05917, 0.1686275, 0, 1, 1,
0.5022883, -1.158973, 3.727366, 0.1764706, 0, 1, 1,
0.5042493, 0.1374914, 2.523468, 0.1803922, 0, 1, 1,
0.5058479, -1.066324, 2.494817, 0.1882353, 0, 1, 1,
0.5086579, 1.698287, 1.695614, 0.1921569, 0, 1, 1,
0.5100999, 0.8637781, -0.6011462, 0.2, 0, 1, 1,
0.5128005, -1.799339, 5.509559, 0.2078431, 0, 1, 1,
0.5139986, 0.6358826, 2.097342, 0.2117647, 0, 1, 1,
0.5165493, 0.3303097, 2.782236, 0.2196078, 0, 1, 1,
0.5246771, -0.991744, 1.485096, 0.2235294, 0, 1, 1,
0.5267473, 0.5187989, 0.7324631, 0.2313726, 0, 1, 1,
0.5444801, 0.7791944, -0.1851265, 0.2352941, 0, 1, 1,
0.5451438, -0.2995278, 1.46917, 0.2431373, 0, 1, 1,
0.5526532, 0.3775282, 0.814786, 0.2470588, 0, 1, 1,
0.553012, 1.134371, 0.8032823, 0.254902, 0, 1, 1,
0.5533657, -0.5730703, 2.683341, 0.2588235, 0, 1, 1,
0.5546635, -0.7439965, 2.127679, 0.2666667, 0, 1, 1,
0.5593227, 0.9510252, 0.4161653, 0.2705882, 0, 1, 1,
0.5597606, -0.9633483, 3.201094, 0.2784314, 0, 1, 1,
0.5600408, 0.969695, -0.4100664, 0.282353, 0, 1, 1,
0.5619015, 0.7176491, 1.875106, 0.2901961, 0, 1, 1,
0.5629231, -0.4145572, 2.350119, 0.2941177, 0, 1, 1,
0.5649722, -3.393362, 2.265792, 0.3019608, 0, 1, 1,
0.5672856, 1.997596, 0.1471217, 0.3098039, 0, 1, 1,
0.5678546, 0.1780806, -0.08728307, 0.3137255, 0, 1, 1,
0.5720638, -1.325069, 2.574196, 0.3215686, 0, 1, 1,
0.5799702, 0.4526117, 0.513979, 0.3254902, 0, 1, 1,
0.5808385, -0.5888457, 1.933644, 0.3333333, 0, 1, 1,
0.5822339, -0.2695623, 0.9985364, 0.3372549, 0, 1, 1,
0.5833104, -1.01083, 2.020472, 0.345098, 0, 1, 1,
0.584816, 0.1385455, 0.6093315, 0.3490196, 0, 1, 1,
0.5858399, -0.2172515, 0.8011845, 0.3568628, 0, 1, 1,
0.5865437, -0.3937223, 1.123756, 0.3607843, 0, 1, 1,
0.5879227, 0.826966, 0.6208605, 0.3686275, 0, 1, 1,
0.5893774, -1.475692, 1.507006, 0.372549, 0, 1, 1,
0.5905328, 1.46236, 1.840735, 0.3803922, 0, 1, 1,
0.5930897, 2.099959, -0.1996734, 0.3843137, 0, 1, 1,
0.5997517, -1.253258, 3.028002, 0.3921569, 0, 1, 1,
0.6024677, 0.6917819, 3.150578, 0.3960784, 0, 1, 1,
0.6029392, 0.9993173, 0.871781, 0.4039216, 0, 1, 1,
0.6118392, -1.743945, 2.548281, 0.4117647, 0, 1, 1,
0.6152467, 0.0431695, 0.5995358, 0.4156863, 0, 1, 1,
0.6175967, 0.911797, -0.3408842, 0.4235294, 0, 1, 1,
0.6253023, 0.03770123, 1.689069, 0.427451, 0, 1, 1,
0.6276522, -1.114595, 2.734108, 0.4352941, 0, 1, 1,
0.6287329, -0.1222612, 1.56329, 0.4392157, 0, 1, 1,
0.6348056, -0.03387623, 1.10281, 0.4470588, 0, 1, 1,
0.640513, 1.478362, 0.7957653, 0.4509804, 0, 1, 1,
0.648182, -0.9787674, 2.123422, 0.4588235, 0, 1, 1,
0.6515543, 0.5751886, -0.1080025, 0.4627451, 0, 1, 1,
0.6524217, 2.286333, 0.1718066, 0.4705882, 0, 1, 1,
0.6535549, -2.32297, 3.72232, 0.4745098, 0, 1, 1,
0.6540297, -1.747747, 2.17959, 0.4823529, 0, 1, 1,
0.6629115, -0.9485713, 1.465439, 0.4862745, 0, 1, 1,
0.6652985, 0.6443825, 0.07231193, 0.4941176, 0, 1, 1,
0.6658264, 0.3275458, 1.42089, 0.5019608, 0, 1, 1,
0.6667746, -0.1196225, 0.9862179, 0.5058824, 0, 1, 1,
0.6799875, 0.9430638, 2.759903, 0.5137255, 0, 1, 1,
0.6823542, -1.020745, 2.332568, 0.5176471, 0, 1, 1,
0.6838275, 0.8342437, 0.761042, 0.5254902, 0, 1, 1,
0.6887403, -0.8346174, 3.479416, 0.5294118, 0, 1, 1,
0.6891567, -0.822024, 3.124731, 0.5372549, 0, 1, 1,
0.6974781, 1.488456, 0.2098941, 0.5411765, 0, 1, 1,
0.7058674, -0.3358694, 1.793623, 0.5490196, 0, 1, 1,
0.7067314, 1.335372, 0.5502349, 0.5529412, 0, 1, 1,
0.7120463, -0.1999509, 2.008804, 0.5607843, 0, 1, 1,
0.717133, -0.09243097, 1.132919, 0.5647059, 0, 1, 1,
0.7181886, -1.460023, 3.33878, 0.572549, 0, 1, 1,
0.7195107, -0.3736038, 1.838423, 0.5764706, 0, 1, 1,
0.7229139, 1.108902, 0.5351774, 0.5843138, 0, 1, 1,
0.7229531, 0.0009972955, 0.3854856, 0.5882353, 0, 1, 1,
0.7257752, -1.5724, 2.431877, 0.5960785, 0, 1, 1,
0.7266574, 0.7445578, 0.5084984, 0.6039216, 0, 1, 1,
0.7312019, 0.6236416, -0.3161046, 0.6078432, 0, 1, 1,
0.7323933, -0.1747015, 1.406097, 0.6156863, 0, 1, 1,
0.7334502, 0.2018911, 1.611693, 0.6196079, 0, 1, 1,
0.7337975, 0.03859751, 2.120268, 0.627451, 0, 1, 1,
0.7387776, 1.395295, -0.3527558, 0.6313726, 0, 1, 1,
0.7400857, 2.446887, 1.092515, 0.6392157, 0, 1, 1,
0.7435788, -1.74649, 3.327355, 0.6431373, 0, 1, 1,
0.7442785, -0.791766, 1.716468, 0.6509804, 0, 1, 1,
0.7485543, 0.757048, -1.064738, 0.654902, 0, 1, 1,
0.754768, 0.3936008, 1.677785, 0.6627451, 0, 1, 1,
0.7551157, -0.3760039, 1.309014, 0.6666667, 0, 1, 1,
0.7572599, 0.465445, 0.07660109, 0.6745098, 0, 1, 1,
0.7615771, 0.6386129, 0.06861234, 0.6784314, 0, 1, 1,
0.7625809, 1.53558, 0.8601685, 0.6862745, 0, 1, 1,
0.771199, -0.3114577, 1.742968, 0.6901961, 0, 1, 1,
0.7713832, -0.2122843, 3.341911, 0.6980392, 0, 1, 1,
0.7747938, 0.499469, 0.3679623, 0.7058824, 0, 1, 1,
0.7792894, -0.05481171, 1.392774, 0.7098039, 0, 1, 1,
0.7804267, 0.9962029, 0.06333124, 0.7176471, 0, 1, 1,
0.7804587, -1.386993, 1.249893, 0.7215686, 0, 1, 1,
0.7826514, 0.8767596, 0.6568469, 0.7294118, 0, 1, 1,
0.7875034, -0.4744235, 1.2724, 0.7333333, 0, 1, 1,
0.7876697, 0.9027244, -1.001844, 0.7411765, 0, 1, 1,
0.7900049, -3.026023, 3.66047, 0.7450981, 0, 1, 1,
0.7911094, 1.377285, -1.482977, 0.7529412, 0, 1, 1,
0.7941488, -1.976085, 3.670968, 0.7568628, 0, 1, 1,
0.8122063, 0.7278502, 0.471558, 0.7647059, 0, 1, 1,
0.8138952, 0.05397783, 1.372951, 0.7686275, 0, 1, 1,
0.8143815, -1.592136, 2.525704, 0.7764706, 0, 1, 1,
0.814401, -0.538502, 0.9266395, 0.7803922, 0, 1, 1,
0.8168136, 0.3755153, 1.664886, 0.7882353, 0, 1, 1,
0.8173012, 0.3467609, -0.25032, 0.7921569, 0, 1, 1,
0.8173932, 0.7201008, 0.1075049, 0.8, 0, 1, 1,
0.8209293, 0.8830938, 0.9849224, 0.8078431, 0, 1, 1,
0.824245, 0.3116752, 0.9943869, 0.8117647, 0, 1, 1,
0.8249367, 0.0352327, 0.4847573, 0.8196079, 0, 1, 1,
0.8366484, 0.5971662, 0.7772708, 0.8235294, 0, 1, 1,
0.8366535, 0.9399926, 1.155434, 0.8313726, 0, 1, 1,
0.841284, 1.372898, -0.2926784, 0.8352941, 0, 1, 1,
0.8444754, -1.421243, 3.552963, 0.8431373, 0, 1, 1,
0.8495343, 0.8267084, -0.2538302, 0.8470588, 0, 1, 1,
0.8555517, 0.9158961, 0.06227172, 0.854902, 0, 1, 1,
0.8557476, 0.2576654, 0.4542348, 0.8588235, 0, 1, 1,
0.8609825, 0.5002275, -0.1093385, 0.8666667, 0, 1, 1,
0.8692078, -0.08252914, 1.218453, 0.8705882, 0, 1, 1,
0.8761953, 0.9789431, 1.270144, 0.8784314, 0, 1, 1,
0.8801931, -0.7819805, 3.921055, 0.8823529, 0, 1, 1,
0.8837144, 1.384021, 0.7348818, 0.8901961, 0, 1, 1,
0.8868499, 0.04606248, 1.568531, 0.8941177, 0, 1, 1,
0.88836, -0.5382786, 1.680425, 0.9019608, 0, 1, 1,
0.8967221, 0.4308979, 1.451396, 0.9098039, 0, 1, 1,
0.8990993, -0.3405462, 2.992877, 0.9137255, 0, 1, 1,
0.902723, 1.536735, 0.1055017, 0.9215686, 0, 1, 1,
0.9066114, 0.4197967, 0.9718755, 0.9254902, 0, 1, 1,
0.9119886, -0.2921958, 3.576483, 0.9333333, 0, 1, 1,
0.9163649, -0.1575486, 2.581733, 0.9372549, 0, 1, 1,
0.9170241, -0.5155666, 1.999288, 0.945098, 0, 1, 1,
0.9269106, -1.054353, 4.55225, 0.9490196, 0, 1, 1,
0.9344144, 0.2279292, 1.951521, 0.9568627, 0, 1, 1,
0.9363192, -0.5009131, 1.63279, 0.9607843, 0, 1, 1,
0.9365088, 1.083141, 0.8118491, 0.9686275, 0, 1, 1,
0.9401315, 0.2525658, 1.62003, 0.972549, 0, 1, 1,
0.9430034, -0.3846175, 1.490263, 0.9803922, 0, 1, 1,
0.9452981, 0.497866, 1.192026, 0.9843137, 0, 1, 1,
0.9469298, 0.04710556, 3.628022, 0.9921569, 0, 1, 1,
0.9482694, -0.7899712, 0.3149942, 0.9960784, 0, 1, 1,
0.9510928, 0.3362836, 1.002245, 1, 0, 0.9960784, 1,
0.9516158, 0.7150445, 2.068662, 1, 0, 0.9882353, 1,
0.9611212, -1.871337, 2.224879, 1, 0, 0.9843137, 1,
0.972844, 0.4041943, 2.271924, 1, 0, 0.9764706, 1,
0.9739504, -0.9422343, 4.169711, 1, 0, 0.972549, 1,
0.9800106, 0.1615925, 1.171485, 1, 0, 0.9647059, 1,
0.9804038, -0.04606128, 1.19136, 1, 0, 0.9607843, 1,
0.9888098, 0.2653756, 0.9359148, 1, 0, 0.9529412, 1,
0.9911479, -0.2540185, 1.318639, 1, 0, 0.9490196, 1,
0.9942199, 1.965421, 0.1460783, 1, 0, 0.9411765, 1,
0.9965146, -0.3373708, 2.457757, 1, 0, 0.9372549, 1,
1.001936, -0.5574955, 1.270955, 1, 0, 0.9294118, 1,
1.002824, 0.7967067, 1.896206, 1, 0, 0.9254902, 1,
1.005556, 1.057306, 1.326148, 1, 0, 0.9176471, 1,
1.008267, 0.2584169, 1.823268, 1, 0, 0.9137255, 1,
1.008626, 1.579462, 1.020703, 1, 0, 0.9058824, 1,
1.016505, -0.9338443, 2.692025, 1, 0, 0.9019608, 1,
1.024615, 0.07307339, -0.5921126, 1, 0, 0.8941177, 1,
1.031111, 0.595719, -0.4217629, 1, 0, 0.8862745, 1,
1.034496, 0.7479218, 2.400108, 1, 0, 0.8823529, 1,
1.036187, -0.5320444, 1.716341, 1, 0, 0.8745098, 1,
1.04115, 0.2731478, 1.708277, 1, 0, 0.8705882, 1,
1.044145, 0.3989614, 1.099926, 1, 0, 0.8627451, 1,
1.045479, 0.6982784, -0.2762135, 1, 0, 0.8588235, 1,
1.047837, -1.281963, 1.796058, 1, 0, 0.8509804, 1,
1.04915, 0.08293997, 1.776567, 1, 0, 0.8470588, 1,
1.054125, -0.7563175, 3.519396, 1, 0, 0.8392157, 1,
1.054351, 0.02107345, 2.053786, 1, 0, 0.8352941, 1,
1.057083, -1.931092, 3.128073, 1, 0, 0.827451, 1,
1.062611, 1.305699, 0.7816933, 1, 0, 0.8235294, 1,
1.06819, 0.9389908, 2.24006, 1, 0, 0.8156863, 1,
1.081633, 0.1869657, 1.76503, 1, 0, 0.8117647, 1,
1.082583, -0.09055603, 0.8429826, 1, 0, 0.8039216, 1,
1.097154, 0.8498991, 0.3154148, 1, 0, 0.7960784, 1,
1.098793, 0.4849751, 1.387413, 1, 0, 0.7921569, 1,
1.105651, 0.06128534, 3.674848, 1, 0, 0.7843137, 1,
1.10818, 1.768082, 1.598981, 1, 0, 0.7803922, 1,
1.112244, 1.328693, 0.5571288, 1, 0, 0.772549, 1,
1.11299, -1.646436, 2.733726, 1, 0, 0.7686275, 1,
1.124297, 0.2814837, 3.91918, 1, 0, 0.7607843, 1,
1.128048, -0.06210922, 2.116924, 1, 0, 0.7568628, 1,
1.142877, -0.4213449, 2.749822, 1, 0, 0.7490196, 1,
1.14352, -0.6933395, 2.574739, 1, 0, 0.7450981, 1,
1.143848, -0.6472154, 3.341089, 1, 0, 0.7372549, 1,
1.144432, -0.8560115, 3.07062, 1, 0, 0.7333333, 1,
1.146743, -0.2703229, 1.414706, 1, 0, 0.7254902, 1,
1.153925, 0.8731552, 0.415419, 1, 0, 0.7215686, 1,
1.1566, 0.9016802, 0.9170985, 1, 0, 0.7137255, 1,
1.158347, -0.8980122, 1.521868, 1, 0, 0.7098039, 1,
1.161649, 0.3841261, 3.886731, 1, 0, 0.7019608, 1,
1.16253, -0.6519799, 1.983644, 1, 0, 0.6941177, 1,
1.163589, -1.747642, 2.108194, 1, 0, 0.6901961, 1,
1.164459, -0.4099863, 2.681315, 1, 0, 0.682353, 1,
1.167687, 1.455204, 1.212004, 1, 0, 0.6784314, 1,
1.179054, 0.6291206, 0.9988141, 1, 0, 0.6705883, 1,
1.18351, -0.1739758, 2.51854, 1, 0, 0.6666667, 1,
1.184586, 1.531371, 0.7704076, 1, 0, 0.6588235, 1,
1.201108, -0.1974337, 2.24528, 1, 0, 0.654902, 1,
1.209486, -0.643581, 1.673965, 1, 0, 0.6470588, 1,
1.214684, 0.6571417, 2.742107, 1, 0, 0.6431373, 1,
1.221666, 0.3488906, 2.371993, 1, 0, 0.6352941, 1,
1.224402, 0.1806908, 0.09853666, 1, 0, 0.6313726, 1,
1.228045, -0.9185597, 1.642416, 1, 0, 0.6235294, 1,
1.229118, 0.08206728, 0.7091656, 1, 0, 0.6196079, 1,
1.24571, 0.02352824, 2.952136, 1, 0, 0.6117647, 1,
1.246045, 2.189258, -0.8680838, 1, 0, 0.6078432, 1,
1.249906, 2.081955, -0.1475475, 1, 0, 0.6, 1,
1.253684, 0.4313591, 0.1282743, 1, 0, 0.5921569, 1,
1.257986, 1.419056, -1.058095, 1, 0, 0.5882353, 1,
1.260936, 0.497234, 2.253011, 1, 0, 0.5803922, 1,
1.261149, -1.954197, 3.611002, 1, 0, 0.5764706, 1,
1.265366, 1.397431, 2.375796, 1, 0, 0.5686275, 1,
1.267267, -1.227427, 1.757442, 1, 0, 0.5647059, 1,
1.27956, 1.10201, 2.393555, 1, 0, 0.5568628, 1,
1.284773, -1.027065, 0.4314865, 1, 0, 0.5529412, 1,
1.292979, 0.6532776, 0.9006383, 1, 0, 0.5450981, 1,
1.301818, -0.5557886, 1.828289, 1, 0, 0.5411765, 1,
1.311009, 0.8141793, 1.281741, 1, 0, 0.5333334, 1,
1.314297, -0.8678659, 2.982215, 1, 0, 0.5294118, 1,
1.315244, -0.1603981, 1.80999, 1, 0, 0.5215687, 1,
1.319113, -0.7455344, 0.6886751, 1, 0, 0.5176471, 1,
1.332125, -1.602458, 2.512284, 1, 0, 0.509804, 1,
1.356979, 0.5018345, 3.09307, 1, 0, 0.5058824, 1,
1.362894, -0.3163683, 1.275961, 1, 0, 0.4980392, 1,
1.363299, -1.057902, 2.682189, 1, 0, 0.4901961, 1,
1.363323, 0.8633093, 2.24291, 1, 0, 0.4862745, 1,
1.397243, -0.7779152, 3.479195, 1, 0, 0.4784314, 1,
1.398435, 0.5420622, -1.053853, 1, 0, 0.4745098, 1,
1.399155, -0.2957261, 0.3039958, 1, 0, 0.4666667, 1,
1.399301, -2.833601, 3.237945, 1, 0, 0.4627451, 1,
1.40176, -0.7830165, 1.400463, 1, 0, 0.454902, 1,
1.405408, -1.081111, 2.89377, 1, 0, 0.4509804, 1,
1.414452, 0.3223929, 1.524151, 1, 0, 0.4431373, 1,
1.414711, -0.09147777, 2.776999, 1, 0, 0.4392157, 1,
1.415307, 1.931194, 0.5892541, 1, 0, 0.4313726, 1,
1.429346, -0.9015726, 2.356284, 1, 0, 0.427451, 1,
1.432958, 0.3539088, 0.6028022, 1, 0, 0.4196078, 1,
1.439615, -2.181294, 2.332531, 1, 0, 0.4156863, 1,
1.444365, -0.1408386, 0.6474603, 1, 0, 0.4078431, 1,
1.445185, -0.1780256, 1.869706, 1, 0, 0.4039216, 1,
1.445585, -0.7037098, 3.593822, 1, 0, 0.3960784, 1,
1.446841, -0.1990918, 1.477899, 1, 0, 0.3882353, 1,
1.450451, 1.469465, 0.5420693, 1, 0, 0.3843137, 1,
1.455715, -0.563591, 5.430622, 1, 0, 0.3764706, 1,
1.498225, -0.1072786, 1.424514, 1, 0, 0.372549, 1,
1.505919, 0.284463, 2.145666, 1, 0, 0.3647059, 1,
1.508388, 0.2714639, 1.497743, 1, 0, 0.3607843, 1,
1.509594, -0.9937098, 3.159693, 1, 0, 0.3529412, 1,
1.509791, -0.5525184, 1.581547, 1, 0, 0.3490196, 1,
1.518971, 1.486605, 0.2737899, 1, 0, 0.3411765, 1,
1.519798, 0.5600142, 0.7545475, 1, 0, 0.3372549, 1,
1.520988, 0.5157357, 0.8733937, 1, 0, 0.3294118, 1,
1.539742, 0.1859392, 2.131048, 1, 0, 0.3254902, 1,
1.550058, -0.734625, 3.118978, 1, 0, 0.3176471, 1,
1.563714, 0.06123478, 0.7299469, 1, 0, 0.3137255, 1,
1.567915, 0.1185383, 1.263716, 1, 0, 0.3058824, 1,
1.570392, 1.377115, -0.9572532, 1, 0, 0.2980392, 1,
1.574716, -0.09745065, 1.942783, 1, 0, 0.2941177, 1,
1.575063, 1.515989, 1.366788, 1, 0, 0.2862745, 1,
1.58558, 0.5716643, 0.6212252, 1, 0, 0.282353, 1,
1.596014, -0.02837403, 3.7438, 1, 0, 0.2745098, 1,
1.613629, 0.1339232, 1.209282, 1, 0, 0.2705882, 1,
1.650364, -0.1440107, 0.7340667, 1, 0, 0.2627451, 1,
1.650587, 0.8132343, 1.030762, 1, 0, 0.2588235, 1,
1.653655, -1.144453, 1.720799, 1, 0, 0.2509804, 1,
1.658108, 0.2907836, 0.5361746, 1, 0, 0.2470588, 1,
1.664853, -1.384669, 2.280314, 1, 0, 0.2392157, 1,
1.666795, 0.01060163, 3.607904, 1, 0, 0.2352941, 1,
1.667805, 0.6414444, 0.07335699, 1, 0, 0.227451, 1,
1.671439, -1.295987, 1.125182, 1, 0, 0.2235294, 1,
1.689612, 0.7399889, -1.644192, 1, 0, 0.2156863, 1,
1.690524, -0.2721645, 2.273721, 1, 0, 0.2117647, 1,
1.705333, -0.2382102, 0.695011, 1, 0, 0.2039216, 1,
1.713049, 0.9047585, 1.615047, 1, 0, 0.1960784, 1,
1.717089, -0.2746308, 1.371583, 1, 0, 0.1921569, 1,
1.734195, 0.2772363, 2.096237, 1, 0, 0.1843137, 1,
1.785259, -0.2665997, 1.262028, 1, 0, 0.1803922, 1,
1.785692, -0.07194038, 1.480631, 1, 0, 0.172549, 1,
1.789041, 0.8280042, 1.076678, 1, 0, 0.1686275, 1,
1.81025, 0.9444991, 2.016737, 1, 0, 0.1607843, 1,
1.814539, -0.3374442, 0.5775332, 1, 0, 0.1568628, 1,
1.823142, 1.110603, 0.4161456, 1, 0, 0.1490196, 1,
1.829303, -1.76466, 0.9766729, 1, 0, 0.145098, 1,
1.834859, -0.5266454, 0.4659618, 1, 0, 0.1372549, 1,
1.836813, -0.5586051, 2.951011, 1, 0, 0.1333333, 1,
1.871162, 0.9249713, -0.07400963, 1, 0, 0.1254902, 1,
1.884504, 0.5655958, 0.7714913, 1, 0, 0.1215686, 1,
1.908174, -1.247462, 2.333284, 1, 0, 0.1137255, 1,
1.931924, 1.182181, 2.000903, 1, 0, 0.1098039, 1,
1.953388, 0.1156739, 1.551634, 1, 0, 0.1019608, 1,
2.01143, 1.710967, 1.91794, 1, 0, 0.09411765, 1,
2.03308, 0.1177652, 1.344546, 1, 0, 0.09019608, 1,
2.040783, 0.6356141, 1.474872, 1, 0, 0.08235294, 1,
2.066536, -0.5533581, 0.9595353, 1, 0, 0.07843138, 1,
2.169023, -0.1215062, 2.105162, 1, 0, 0.07058824, 1,
2.218519, 1.311875, -0.6519728, 1, 0, 0.06666667, 1,
2.222352, -0.2520446, 2.83311, 1, 0, 0.05882353, 1,
2.233526, -1.197562, 1.19921, 1, 0, 0.05490196, 1,
2.240428, -1.912564, 0.3269773, 1, 0, 0.04705882, 1,
2.25034, -0.5858997, 3.585628, 1, 0, 0.04313726, 1,
2.255977, -0.2877114, 2.218492, 1, 0, 0.03529412, 1,
2.304971, 2.378186, 1.036175, 1, 0, 0.03137255, 1,
2.339129, 0.7425641, 0.3960785, 1, 0, 0.02352941, 1,
2.508876, -0.6032352, 1.597856, 1, 0, 0.01960784, 1,
2.51498, -0.4516568, 2.84711, 1, 0, 0.01176471, 1,
2.867319, -0.3714655, 1.696981, 1, 0, 0.007843138, 1
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
0.0309006, -4.512476, -6.828689, 0, -0.5, 0.5, 0.5,
0.0309006, -4.512476, -6.828689, 1, -0.5, 0.5, 0.5,
0.0309006, -4.512476, -6.828689, 1, 1.5, 0.5, 0.5,
0.0309006, -4.512476, -6.828689, 0, 1.5, 0.5, 0.5
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
-3.767064, -0.3432407, -6.828689, 0, -0.5, 0.5, 0.5,
-3.767064, -0.3432407, -6.828689, 1, -0.5, 0.5, 0.5,
-3.767064, -0.3432407, -6.828689, 1, 1.5, 0.5, 0.5,
-3.767064, -0.3432407, -6.828689, 0, 1.5, 0.5, 0.5
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
-3.767064, -4.512476, 0.234549, 0, -0.5, 0.5, 0.5,
-3.767064, -4.512476, 0.234549, 1, -0.5, 0.5, 0.5,
-3.767064, -4.512476, 0.234549, 1, 1.5, 0.5, 0.5,
-3.767064, -4.512476, 0.234549, 0, 1.5, 0.5, 0.5
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
-2, -3.550345, -5.198711,
2, -3.550345, -5.198711,
-2, -3.550345, -5.198711,
-2, -3.7107, -5.470374,
-1, -3.550345, -5.198711,
-1, -3.7107, -5.470374,
0, -3.550345, -5.198711,
0, -3.7107, -5.470374,
1, -3.550345, -5.198711,
1, -3.7107, -5.470374,
2, -3.550345, -5.198711,
2, -3.7107, -5.470374
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
-2, -4.031411, -6.0137, 0, -0.5, 0.5, 0.5,
-2, -4.031411, -6.0137, 1, -0.5, 0.5, 0.5,
-2, -4.031411, -6.0137, 1, 1.5, 0.5, 0.5,
-2, -4.031411, -6.0137, 0, 1.5, 0.5, 0.5,
-1, -4.031411, -6.0137, 0, -0.5, 0.5, 0.5,
-1, -4.031411, -6.0137, 1, -0.5, 0.5, 0.5,
-1, -4.031411, -6.0137, 1, 1.5, 0.5, 0.5,
-1, -4.031411, -6.0137, 0, 1.5, 0.5, 0.5,
0, -4.031411, -6.0137, 0, -0.5, 0.5, 0.5,
0, -4.031411, -6.0137, 1, -0.5, 0.5, 0.5,
0, -4.031411, -6.0137, 1, 1.5, 0.5, 0.5,
0, -4.031411, -6.0137, 0, 1.5, 0.5, 0.5,
1, -4.031411, -6.0137, 0, -0.5, 0.5, 0.5,
1, -4.031411, -6.0137, 1, -0.5, 0.5, 0.5,
1, -4.031411, -6.0137, 1, 1.5, 0.5, 0.5,
1, -4.031411, -6.0137, 0, 1.5, 0.5, 0.5,
2, -4.031411, -6.0137, 0, -0.5, 0.5, 0.5,
2, -4.031411, -6.0137, 1, -0.5, 0.5, 0.5,
2, -4.031411, -6.0137, 1, 1.5, 0.5, 0.5,
2, -4.031411, -6.0137, 0, 1.5, 0.5, 0.5
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
-2.89061, -3, -5.198711,
-2.89061, 2, -5.198711,
-2.89061, -3, -5.198711,
-3.036686, -3, -5.470374,
-2.89061, -2, -5.198711,
-3.036686, -2, -5.470374,
-2.89061, -1, -5.198711,
-3.036686, -1, -5.470374,
-2.89061, 0, -5.198711,
-3.036686, 0, -5.470374,
-2.89061, 1, -5.198711,
-3.036686, 1, -5.470374,
-2.89061, 2, -5.198711,
-3.036686, 2, -5.470374
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
-3.328837, -3, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, -3, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, -3, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, -3, -6.0137, 0, 1.5, 0.5, 0.5,
-3.328837, -2, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, -2, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, -2, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, -2, -6.0137, 0, 1.5, 0.5, 0.5,
-3.328837, -1, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, -1, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, -1, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, -1, -6.0137, 0, 1.5, 0.5, 0.5,
-3.328837, 0, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, 0, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, 0, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, 0, -6.0137, 0, 1.5, 0.5, 0.5,
-3.328837, 1, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, 1, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, 1, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, 1, -6.0137, 0, 1.5, 0.5, 0.5,
-3.328837, 2, -6.0137, 0, -0.5, 0.5, 0.5,
-3.328837, 2, -6.0137, 1, -0.5, 0.5, 0.5,
-3.328837, 2, -6.0137, 1, 1.5, 0.5, 0.5,
-3.328837, 2, -6.0137, 0, 1.5, 0.5, 0.5
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
-2.89061, -3.550345, -4,
-2.89061, -3.550345, 4,
-2.89061, -3.550345, -4,
-3.036686, -3.7107, -4,
-2.89061, -3.550345, -2,
-3.036686, -3.7107, -2,
-2.89061, -3.550345, 0,
-3.036686, -3.7107, 0,
-2.89061, -3.550345, 2,
-3.036686, -3.7107, 2,
-2.89061, -3.550345, 4,
-3.036686, -3.7107, 4
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
-3.328837, -4.031411, -4, 0, -0.5, 0.5, 0.5,
-3.328837, -4.031411, -4, 1, -0.5, 0.5, 0.5,
-3.328837, -4.031411, -4, 1, 1.5, 0.5, 0.5,
-3.328837, -4.031411, -4, 0, 1.5, 0.5, 0.5,
-3.328837, -4.031411, -2, 0, -0.5, 0.5, 0.5,
-3.328837, -4.031411, -2, 1, -0.5, 0.5, 0.5,
-3.328837, -4.031411, -2, 1, 1.5, 0.5, 0.5,
-3.328837, -4.031411, -2, 0, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 0, 0, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 0, 1, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 0, 1, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 0, 0, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 2, 0, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 2, 1, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 2, 1, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 2, 0, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 4, 0, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 4, 1, -0.5, 0.5, 0.5,
-3.328837, -4.031411, 4, 1, 1.5, 0.5, 0.5,
-3.328837, -4.031411, 4, 0, 1.5, 0.5, 0.5
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
-2.89061, -3.550345, -5.198711,
-2.89061, 2.863863, -5.198711,
-2.89061, -3.550345, 5.667809,
-2.89061, 2.863863, 5.667809,
-2.89061, -3.550345, -5.198711,
-2.89061, -3.550345, 5.667809,
-2.89061, 2.863863, -5.198711,
-2.89061, 2.863863, 5.667809,
-2.89061, -3.550345, -5.198711,
2.952412, -3.550345, -5.198711,
-2.89061, -3.550345, 5.667809,
2.952412, -3.550345, 5.667809,
-2.89061, 2.863863, -5.198711,
2.952412, 2.863863, -5.198711,
-2.89061, 2.863863, 5.667809,
2.952412, 2.863863, 5.667809,
2.952412, -3.550345, -5.198711,
2.952412, 2.863863, -5.198711,
2.952412, -3.550345, 5.667809,
2.952412, 2.863863, 5.667809,
2.952412, -3.550345, -5.198711,
2.952412, -3.550345, 5.667809,
2.952412, 2.863863, -5.198711,
2.952412, 2.863863, 5.667809
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
var radius = 7.425292;
var distance = 33.03596;
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
mvMatrix.translate( -0.0309006, 0.3432407, -0.234549 );
mvMatrix.scale( 1.37401, 1.251654, 0.7388172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03596);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
haloxyfop-methyl<-read.table("haloxyfop-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-haloxyfop-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
y<-haloxyfop-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
```

```r
z<-haloxyfop-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'haloxyfop' not found
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
-2.805518, 0.03471934, -3.099905, 0, 0, 1, 1, 1,
-2.586459, -0.5769516, -1.322501, 1, 0, 0, 1, 1,
-2.575555, -0.934948, -1.420528, 1, 0, 0, 1, 1,
-2.527492, 0.6076064, -1.173072, 1, 0, 0, 1, 1,
-2.457935, -0.4522488, -2.415162, 1, 0, 0, 1, 1,
-2.444033, 0.5734187, -1.198351, 1, 0, 0, 1, 1,
-2.393025, 1.770992, -0.7843256, 0, 0, 0, 1, 1,
-2.360237, -0.1346468, -1.556001, 0, 0, 0, 1, 1,
-2.35493, 0.1663702, -2.227583, 0, 0, 0, 1, 1,
-2.330467, 1.507581, -3.803522, 0, 0, 0, 1, 1,
-2.29473, 0.04167335, -1.398622, 0, 0, 0, 1, 1,
-2.264352, 0.3030638, -0.7033536, 0, 0, 0, 1, 1,
-2.188379, 1.311938, -2.82454, 0, 0, 0, 1, 1,
-2.186316, 0.05762536, -2.680141, 1, 1, 1, 1, 1,
-2.173563, -0.002932613, -3.4675, 1, 1, 1, 1, 1,
-2.12509, 0.9546271, -2.30287, 1, 1, 1, 1, 1,
-2.048615, 0.2138213, -1.376839, 1, 1, 1, 1, 1,
-2.047024, 1.182458, -1.340082, 1, 1, 1, 1, 1,
-2.032796, -0.04218079, -0.7728093, 1, 1, 1, 1, 1,
-1.98268, 1.709088, -0.0355015, 1, 1, 1, 1, 1,
-1.982081, 0.9960635, 1.059846, 1, 1, 1, 1, 1,
-1.964653, 1.47608, -0.4614162, 1, 1, 1, 1, 1,
-1.934291, -1.45777, -1.970522, 1, 1, 1, 1, 1,
-1.9057, 0.8746489, -1.030133, 1, 1, 1, 1, 1,
-1.881812, -0.9414775, -2.016526, 1, 1, 1, 1, 1,
-1.873441, 0.01981435, -0.4280914, 1, 1, 1, 1, 1,
-1.867832, 1.096362, -1.255836, 1, 1, 1, 1, 1,
-1.853458, -0.06393897, 0.2051576, 1, 1, 1, 1, 1,
-1.824185, -0.3972136, -2.726535, 0, 0, 1, 1, 1,
-1.809562, 0.461332, 1.623952, 1, 0, 0, 1, 1,
-1.807643, 0.09820483, -2.409429, 1, 0, 0, 1, 1,
-1.80482, -0.5455749, -2.884336, 1, 0, 0, 1, 1,
-1.790857, 0.6824741, -1.887162, 1, 0, 0, 1, 1,
-1.788711, -1.064683, -1.543228, 1, 0, 0, 1, 1,
-1.778991, 0.0824613, -1.076122, 0, 0, 0, 1, 1,
-1.778216, 1.787885, 0.0168425, 0, 0, 0, 1, 1,
-1.776077, 0.2049947, -2.515865, 0, 0, 0, 1, 1,
-1.775501, 0.4047436, -0.1455116, 0, 0, 0, 1, 1,
-1.765196, 0.5074931, -1.45977, 0, 0, 0, 1, 1,
-1.763465, 1.193157, -0.7006568, 0, 0, 0, 1, 1,
-1.751005, 0.4366104, -1.802659, 0, 0, 0, 1, 1,
-1.73113, 1.240307, -0.3172841, 1, 1, 1, 1, 1,
-1.726483, 1.3876, -1.133772, 1, 1, 1, 1, 1,
-1.716917, 0.2390512, -0.6154192, 1, 1, 1, 1, 1,
-1.693684, 2.706791, -2.168931, 1, 1, 1, 1, 1,
-1.69245, -0.3741124, -1.130905, 1, 1, 1, 1, 1,
-1.689538, 0.6951876, -1.42516, 1, 1, 1, 1, 1,
-1.669395, -0.4099443, -2.589164, 1, 1, 1, 1, 1,
-1.658756, -1.372118, -1.796043, 1, 1, 1, 1, 1,
-1.647548, -0.6440848, -2.609794, 1, 1, 1, 1, 1,
-1.643154, 0.3353414, -1.977426, 1, 1, 1, 1, 1,
-1.635736, 0.9436999, -1.311303, 1, 1, 1, 1, 1,
-1.630301, 0.6606131, -1.120751, 1, 1, 1, 1, 1,
-1.627833, 0.3854173, -1.175112, 1, 1, 1, 1, 1,
-1.622269, 0.925413, -0.4883211, 1, 1, 1, 1, 1,
-1.591025, -0.3273325, -0.4395286, 1, 1, 1, 1, 1,
-1.569585, 0.04641174, -2.946006, 0, 0, 1, 1, 1,
-1.551782, -2.623052, -3.130237, 1, 0, 0, 1, 1,
-1.549097, 0.2139076, 0.8913468, 1, 0, 0, 1, 1,
-1.542145, 0.1154941, -0.9603883, 1, 0, 0, 1, 1,
-1.519652, -1.117521, -2.156819, 1, 0, 0, 1, 1,
-1.517682, 0.2020002, -0.8144833, 1, 0, 0, 1, 1,
-1.514364, 0.2871203, -3.729768, 0, 0, 0, 1, 1,
-1.487515, -1.710884, -1.664562, 0, 0, 0, 1, 1,
-1.486933, 0.7094029, -3.380915, 0, 0, 0, 1, 1,
-1.486371, -0.2297879, -1.114818, 0, 0, 0, 1, 1,
-1.467973, -0.7728097, 0.209438, 0, 0, 0, 1, 1,
-1.466448, 1.752995, 0.8485766, 0, 0, 0, 1, 1,
-1.460412, -0.08872107, -1.779402, 0, 0, 0, 1, 1,
-1.442859, 0.5548369, -0.8981784, 1, 1, 1, 1, 1,
-1.441373, 0.4278536, -1.577958, 1, 1, 1, 1, 1,
-1.434994, 0.514448, 0.4833278, 1, 1, 1, 1, 1,
-1.427036, -0.2613645, -0.4715781, 1, 1, 1, 1, 1,
-1.426053, -0.6567261, -2.834059, 1, 1, 1, 1, 1,
-1.421043, -0.3280817, -0.276336, 1, 1, 1, 1, 1,
-1.419965, 1.303638, -0.5001298, 1, 1, 1, 1, 1,
-1.388635, 0.1661907, -1.121685, 1, 1, 1, 1, 1,
-1.388269, -1.299954, -1.81528, 1, 1, 1, 1, 1,
-1.386073, 2.076625, -1.275837, 1, 1, 1, 1, 1,
-1.384195, 1.318443, 0.5079892, 1, 1, 1, 1, 1,
-1.378376, -0.2503034, -0.5187029, 1, 1, 1, 1, 1,
-1.377394, 0.06345712, -1.981762, 1, 1, 1, 1, 1,
-1.372925, -0.7449754, -2.687277, 1, 1, 1, 1, 1,
-1.372289, -0.3789859, -0.2076503, 1, 1, 1, 1, 1,
-1.366116, -2.020715, -3.230536, 0, 0, 1, 1, 1,
-1.353771, 1.469349, -0.283339, 1, 0, 0, 1, 1,
-1.353305, -0.9155612, -1.010999, 1, 0, 0, 1, 1,
-1.352191, 1.441121, -1.821096, 1, 0, 0, 1, 1,
-1.334064, -0.7304143, -2.762306, 1, 0, 0, 1, 1,
-1.326966, -1.252313, -2.922758, 1, 0, 0, 1, 1,
-1.323723, -1.227938, -3.000896, 0, 0, 0, 1, 1,
-1.322628, -2.209724, -1.834849, 0, 0, 0, 1, 1,
-1.32087, -1.53912, -4.536959, 0, 0, 0, 1, 1,
-1.31657, 1.56289, -1.405801, 0, 0, 0, 1, 1,
-1.313219, -0.4665962, -3.584548, 0, 0, 0, 1, 1,
-1.309248, -1.004561, -1.002502, 0, 0, 0, 1, 1,
-1.303657, 0.2601769, -1.386337, 0, 0, 0, 1, 1,
-1.299472, -1.769332, -1.722123, 1, 1, 1, 1, 1,
-1.294184, 0.2764445, 0.4013364, 1, 1, 1, 1, 1,
-1.291809, 0.7589348, -0.2757821, 1, 1, 1, 1, 1,
-1.279218, 0.7503321, -0.5209167, 1, 1, 1, 1, 1,
-1.273746, -0.420668, -1.105572, 1, 1, 1, 1, 1,
-1.272378, 0.3527463, -1.380743, 1, 1, 1, 1, 1,
-1.262564, -0.3001367, -3.811256, 1, 1, 1, 1, 1,
-1.261082, 0.9539075, 1.440905, 1, 1, 1, 1, 1,
-1.25978, 1.19208, -0.1755517, 1, 1, 1, 1, 1,
-1.249213, -0.1943834, -1.745989, 1, 1, 1, 1, 1,
-1.234853, -0.1855429, -3.008881, 1, 1, 1, 1, 1,
-1.233298, 0.06632984, -0.3765085, 1, 1, 1, 1, 1,
-1.23221, -0.9782541, -2.341617, 1, 1, 1, 1, 1,
-1.231019, -0.09756561, -2.728073, 1, 1, 1, 1, 1,
-1.230031, -0.1353559, -1.988847, 1, 1, 1, 1, 1,
-1.219681, -0.2922313, -3.468513, 0, 0, 1, 1, 1,
-1.218906, 1.831195, 0.240085, 1, 0, 0, 1, 1,
-1.218303, 1.486874, -1.322588, 1, 0, 0, 1, 1,
-1.212233, -0.7324262, -1.433687, 1, 0, 0, 1, 1,
-1.205332, -1.079631, -2.162949, 1, 0, 0, 1, 1,
-1.203715, -0.1518102, -1.227025, 1, 0, 0, 1, 1,
-1.203286, -0.1278469, 0.2342783, 0, 0, 0, 1, 1,
-1.191457, 0.5564857, -1.451115, 0, 0, 0, 1, 1,
-1.191408, 0.5499839, -0.3835977, 0, 0, 0, 1, 1,
-1.188083, 1.441716, 1.335039, 0, 0, 0, 1, 1,
-1.178006, -0.784874, -1.382241, 0, 0, 0, 1, 1,
-1.173202, -0.6243822, -1.728146, 0, 0, 0, 1, 1,
-1.170599, -1.507258, -1.565932, 0, 0, 0, 1, 1,
-1.16386, 1.890951, 0.0325081, 1, 1, 1, 1, 1,
-1.152676, 0.124306, -1.834426, 1, 1, 1, 1, 1,
-1.148415, -0.3412159, -2.538697, 1, 1, 1, 1, 1,
-1.1439, -0.9453257, -1.427836, 1, 1, 1, 1, 1,
-1.14127, 0.04837596, 1.090069, 1, 1, 1, 1, 1,
-1.141158, -0.08707185, 0.8554982, 1, 1, 1, 1, 1,
-1.14002, -1.166803, -1.359822, 1, 1, 1, 1, 1,
-1.13825, -0.9437404, -2.332468, 1, 1, 1, 1, 1,
-1.136099, 0.4493828, -2.720649, 1, 1, 1, 1, 1,
-1.134691, -0.7727237, -2.442683, 1, 1, 1, 1, 1,
-1.134611, -1.269255, -2.455884, 1, 1, 1, 1, 1,
-1.134228, 0.6510352, -2.189212, 1, 1, 1, 1, 1,
-1.130703, -0.470759, -3.492213, 1, 1, 1, 1, 1,
-1.129893, -0.02648204, -1.644336, 1, 1, 1, 1, 1,
-1.126917, -0.7748337, -2.52017, 1, 1, 1, 1, 1,
-1.112698, 1.403575, -0.02274761, 0, 0, 1, 1, 1,
-1.108752, -0.2987058, -2.69166, 1, 0, 0, 1, 1,
-1.103762, -2.006288, -2.747962, 1, 0, 0, 1, 1,
-1.103147, -0.1141731, -1.064721, 1, 0, 0, 1, 1,
-1.097152, -0.4797739, -4.710599, 1, 0, 0, 1, 1,
-1.091287, 1.2248, 0.7723846, 1, 0, 0, 1, 1,
-1.08932, -0.2479399, -2.349423, 0, 0, 0, 1, 1,
-1.088447, -0.07332703, -1.125409, 0, 0, 0, 1, 1,
-1.082398, 0.1318227, -2.168651, 0, 0, 0, 1, 1,
-1.081753, 0.1357197, -0.685764, 0, 0, 0, 1, 1,
-1.080861, 0.3256215, -1.3298, 0, 0, 0, 1, 1,
-1.067817, -0.3434481, -2.310673, 0, 0, 0, 1, 1,
-1.064687, 0.2040631, -1.681056, 0, 0, 0, 1, 1,
-1.062538, -0.5509515, -1.105649, 1, 1, 1, 1, 1,
-1.06165, 0.3357722, -0.816301, 1, 1, 1, 1, 1,
-1.058356, 0.2180956, -1.243317, 1, 1, 1, 1, 1,
-1.051855, -0.06097421, -0.6899936, 1, 1, 1, 1, 1,
-1.049803, -0.2701468, -3.383799, 1, 1, 1, 1, 1,
-1.049755, 0.6139547, -3.303596, 1, 1, 1, 1, 1,
-1.049665, -0.2379007, -1.934744, 1, 1, 1, 1, 1,
-1.046827, -1.248121, -3.40108, 1, 1, 1, 1, 1,
-1.045287, 0.553176, -1.277344, 1, 1, 1, 1, 1,
-1.040441, -0.7343335, -1.634957, 1, 1, 1, 1, 1,
-1.032591, 0.06662158, -0.5251273, 1, 1, 1, 1, 1,
-1.022256, -1.033493, -0.7799777, 1, 1, 1, 1, 1,
-1.015374, 0.4225728, -0.1950131, 1, 1, 1, 1, 1,
-1.012257, -0.06137761, -0.8038368, 1, 1, 1, 1, 1,
-1.010358, -0.5568151, -1.840254, 1, 1, 1, 1, 1,
-1.009644, 1.211834, 1.087793, 0, 0, 1, 1, 1,
-0.9987206, -0.1877785, -1.759977, 1, 0, 0, 1, 1,
-0.9833972, -0.2434809, -2.87517, 1, 0, 0, 1, 1,
-0.9799063, 0.9044139, -0.5827291, 1, 0, 0, 1, 1,
-0.9703986, 1.173057, -1.637912, 1, 0, 0, 1, 1,
-0.9665582, 0.9816426, -0.328688, 1, 0, 0, 1, 1,
-0.9661946, -0.5949642, -2.875613, 0, 0, 0, 1, 1,
-0.9651685, 1.576801, -1.390509, 0, 0, 0, 1, 1,
-0.958261, 0.3116264, -1.829516, 0, 0, 0, 1, 1,
-0.949032, 1.322967, -1.086752, 0, 0, 0, 1, 1,
-0.9488481, 1.600925, 0.6363015, 0, 0, 0, 1, 1,
-0.9212953, -2.740414, -1.839176, 0, 0, 0, 1, 1,
-0.9184771, -0.8458704, -2.873637, 0, 0, 0, 1, 1,
-0.9165585, 0.82719, -0.1634876, 1, 1, 1, 1, 1,
-0.9093515, 0.7124872, -1.976788, 1, 1, 1, 1, 1,
-0.9061142, 1.665444, -0.5446854, 1, 1, 1, 1, 1,
-0.9048113, -0.1392821, -1.320877, 1, 1, 1, 1, 1,
-0.9039142, 0.623412, -0.5300353, 1, 1, 1, 1, 1,
-0.901649, -0.2980251, -1.717104, 1, 1, 1, 1, 1,
-0.8957653, -2.054778, -3.505293, 1, 1, 1, 1, 1,
-0.8921107, 0.9423023, -0.3619387, 1, 1, 1, 1, 1,
-0.8888997, -0.2822364, -2.394674, 1, 1, 1, 1, 1,
-0.8849201, 0.1936761, -0.4770404, 1, 1, 1, 1, 1,
-0.8826204, -0.8043637, -3.29147, 1, 1, 1, 1, 1,
-0.8784667, 0.2229261, -0.9749668, 1, 1, 1, 1, 1,
-0.8775036, 1.150224, -1.09278, 1, 1, 1, 1, 1,
-0.8727492, 1.040398, -0.410416, 1, 1, 1, 1, 1,
-0.8704991, -0.8991469, -2.331424, 1, 1, 1, 1, 1,
-0.8651397, 0.3882319, -0.1275059, 0, 0, 1, 1, 1,
-0.8619481, 1.186999, -1.459344, 1, 0, 0, 1, 1,
-0.8540391, 0.8448853, 0.5416492, 1, 0, 0, 1, 1,
-0.8538966, 1.52268, -1.846398, 1, 0, 0, 1, 1,
-0.8532397, -2.219161, -3.604448, 1, 0, 0, 1, 1,
-0.8493894, 0.7154021, 0.9090796, 1, 0, 0, 1, 1,
-0.8465926, 0.4608893, -1.26779, 0, 0, 0, 1, 1,
-0.8398648, 0.3175367, -1.183481, 0, 0, 0, 1, 1,
-0.8307533, 0.8718185, -0.6097286, 0, 0, 0, 1, 1,
-0.8289436, 0.01771912, -1.101986, 0, 0, 0, 1, 1,
-0.8280756, -2.343134, -3.073179, 0, 0, 0, 1, 1,
-0.8211565, -0.03353091, -0.9332389, 0, 0, 0, 1, 1,
-0.818399, 0.1313146, -2.439092, 0, 0, 0, 1, 1,
-0.8177672, 0.5634956, -0.5579545, 1, 1, 1, 1, 1,
-0.8130458, -1.532598, -3.22131, 1, 1, 1, 1, 1,
-0.812158, -0.8030186, -4.551733, 1, 1, 1, 1, 1,
-0.8055766, 1.510306, 0.004705229, 1, 1, 1, 1, 1,
-0.8028387, 0.8134761, -1.6157, 1, 1, 1, 1, 1,
-0.8001008, 0.8838562, -0.4968477, 1, 1, 1, 1, 1,
-0.7996536, 2.062353, 0.07652904, 1, 1, 1, 1, 1,
-0.7992935, -0.1880376, -3.06096, 1, 1, 1, 1, 1,
-0.791475, -0.1739932, -1.584555, 1, 1, 1, 1, 1,
-0.7838559, -0.1362277, -2.138874, 1, 1, 1, 1, 1,
-0.7774794, -0.3033229, -1.537325, 1, 1, 1, 1, 1,
-0.7726254, 0.6356109, -2.032568, 1, 1, 1, 1, 1,
-0.7696043, -0.2223206, -3.042882, 1, 1, 1, 1, 1,
-0.7634385, -1.680915, -0.8419922, 1, 1, 1, 1, 1,
-0.7626553, 0.2051158, -0.5345555, 1, 1, 1, 1, 1,
-0.7566288, 0.1502122, -1.307396, 0, 0, 1, 1, 1,
-0.7469616, -2.369941, -2.735795, 1, 0, 0, 1, 1,
-0.7429456, 0.3938696, -2.216679, 1, 0, 0, 1, 1,
-0.728082, 0.1726069, -0.7340373, 1, 0, 0, 1, 1,
-0.7245855, -1.610922, -2.993312, 1, 0, 0, 1, 1,
-0.7233217, -0.5383744, -1.733117, 1, 0, 0, 1, 1,
-0.7189711, -1.341594, -1.320062, 0, 0, 0, 1, 1,
-0.7133281, -0.01584339, -1.289083, 0, 0, 0, 1, 1,
-0.7132656, 0.08716696, -0.3209595, 0, 0, 0, 1, 1,
-0.7106399, -0.3004229, -1.492925, 0, 0, 0, 1, 1,
-0.6956918, 0.3672096, -1.296997, 0, 0, 0, 1, 1,
-0.694123, -0.2608245, -2.929747, 0, 0, 0, 1, 1,
-0.6907809, 0.4802968, 1.765432, 0, 0, 0, 1, 1,
-0.6847867, -0.7636214, -2.552472, 1, 1, 1, 1, 1,
-0.6841987, 1.681674, -0.3194879, 1, 1, 1, 1, 1,
-0.6734809, 2.065881, -1.773254, 1, 1, 1, 1, 1,
-0.6709723, -0.6214988, -2.078559, 1, 1, 1, 1, 1,
-0.6708672, 0.2775241, 1.379411, 1, 1, 1, 1, 1,
-0.6674492, 1.395003, -0.4714581, 1, 1, 1, 1, 1,
-0.6632959, 0.3969948, -0.7512333, 1, 1, 1, 1, 1,
-0.6612571, -0.649526, -2.803235, 1, 1, 1, 1, 1,
-0.6549091, -1.039081, -2.935129, 1, 1, 1, 1, 1,
-0.6533039, -0.2239192, -3.086755, 1, 1, 1, 1, 1,
-0.6515819, -0.5237845, -0.5157226, 1, 1, 1, 1, 1,
-0.6513501, 0.7730651, -2.06547, 1, 1, 1, 1, 1,
-0.650926, -0.7146446, -2.19589, 1, 1, 1, 1, 1,
-0.6480743, -3.456934, -2.350998, 1, 1, 1, 1, 1,
-0.646381, -1.756271, -2.593904, 1, 1, 1, 1, 1,
-0.6396827, -1.730311, -2.075701, 0, 0, 1, 1, 1,
-0.6360892, -1.58773, -3.7425, 1, 0, 0, 1, 1,
-0.6355512, -1.120124, -1.849817, 1, 0, 0, 1, 1,
-0.6219774, 0.4994846, -0.01458336, 1, 0, 0, 1, 1,
-0.6212993, 0.1596083, -1.932312, 1, 0, 0, 1, 1,
-0.6194109, -0.4526113, -4.627846, 1, 0, 0, 1, 1,
-0.6168323, 1.532712, -1.220872, 0, 0, 0, 1, 1,
-0.6165044, -0.06702346, -2.249686, 0, 0, 0, 1, 1,
-0.6148378, 0.06164492, -3.018048, 0, 0, 0, 1, 1,
-0.6138676, -0.2117162, -2.325768, 0, 0, 0, 1, 1,
-0.6112749, -1.325426, -1.49486, 0, 0, 0, 1, 1,
-0.6064556, -1.356654, -3.749094, 0, 0, 0, 1, 1,
-0.6045593, -0.05820496, -0.8172232, 0, 0, 0, 1, 1,
-0.6001367, -0.4963539, -1.839748, 1, 1, 1, 1, 1,
-0.5965587, -0.8851951, -0.5942093, 1, 1, 1, 1, 1,
-0.5917099, -2.204667, -3.39668, 1, 1, 1, 1, 1,
-0.5902005, 0.8750499, 1.178144, 1, 1, 1, 1, 1,
-0.5857247, -0.4169376, -2.49331, 1, 1, 1, 1, 1,
-0.5856697, -1.859099, -2.628622, 1, 1, 1, 1, 1,
-0.5790327, 0.3986957, -0.2636043, 1, 1, 1, 1, 1,
-0.5627048, 0.3786385, 0.7248627, 1, 1, 1, 1, 1,
-0.5600879, 0.05685347, -2.404503, 1, 1, 1, 1, 1,
-0.5564989, -2.298385, -1.670913, 1, 1, 1, 1, 1,
-0.5558131, -2.802376, -3.562505, 1, 1, 1, 1, 1,
-0.547824, 0.05173843, -2.030962, 1, 1, 1, 1, 1,
-0.547093, -0.3985202, -2.300609, 1, 1, 1, 1, 1,
-0.5430878, -0.3374342, -2.126098, 1, 1, 1, 1, 1,
-0.5414338, -0.9892119, -2.321783, 1, 1, 1, 1, 1,
-0.5400566, -1.66555, -4.231812, 0, 0, 1, 1, 1,
-0.537648, 1.283423, -0.7060171, 1, 0, 0, 1, 1,
-0.5370978, 1.537219, -0.2318908, 1, 0, 0, 1, 1,
-0.5369886, 0.1240773, -0.3207565, 1, 0, 0, 1, 1,
-0.5336617, -0.002438221, -2.000939, 1, 0, 0, 1, 1,
-0.5333339, -0.3714044, -4.044869, 1, 0, 0, 1, 1,
-0.5330242, 1.053195, -1.059911, 0, 0, 0, 1, 1,
-0.5325005, 1.799054, 1.08977, 0, 0, 0, 1, 1,
-0.5261766, -0.2052491, -0.01999157, 0, 0, 0, 1, 1,
-0.5242841, -0.8688338, -0.367808, 0, 0, 0, 1, 1,
-0.515179, 0.8553081, 0.09204059, 0, 0, 0, 1, 1,
-0.5116678, -0.09445491, -3.53553, 0, 0, 0, 1, 1,
-0.5046797, 1.169307, -1.162174, 0, 0, 0, 1, 1,
-0.5039762, 0.2775098, -1.619012, 1, 1, 1, 1, 1,
-0.5030044, -0.6374654, -2.458966, 1, 1, 1, 1, 1,
-0.501526, -0.7443007, -2.712462, 1, 1, 1, 1, 1,
-0.5004032, -1.403788, -1.509899, 1, 1, 1, 1, 1,
-0.5000452, -2.292063, -2.071545, 1, 1, 1, 1, 1,
-0.4999329, -1.715688, -2.121029, 1, 1, 1, 1, 1,
-0.4996502, -0.1161084, -1.40183, 1, 1, 1, 1, 1,
-0.4983644, -1.61865, -1.706647, 1, 1, 1, 1, 1,
-0.4970264, 0.9215254, 0.7122791, 1, 1, 1, 1, 1,
-0.4962154, 0.1812732, 0.6098277, 1, 1, 1, 1, 1,
-0.4956107, -0.9502734, -3.712085, 1, 1, 1, 1, 1,
-0.4915611, -1.238034, -2.684228, 1, 1, 1, 1, 1,
-0.489672, -0.1885859, -1.919336, 1, 1, 1, 1, 1,
-0.4893506, -0.7964704, -0.5122444, 1, 1, 1, 1, 1,
-0.4881635, 0.7092863, -0.7702192, 1, 1, 1, 1, 1,
-0.4871039, -0.3748423, -2.417381, 0, 0, 1, 1, 1,
-0.4866639, 1.351229, 0.03326174, 1, 0, 0, 1, 1,
-0.4756009, 2.333625, -0.3278519, 1, 0, 0, 1, 1,
-0.4753606, 0.7619799, -2.121832, 1, 0, 0, 1, 1,
-0.4689444, 1.153532, -0.06217245, 1, 0, 0, 1, 1,
-0.4688081, 1.262258, 0.482056, 1, 0, 0, 1, 1,
-0.4641149, 0.3677149, -1.01665, 0, 0, 0, 1, 1,
-0.457051, 1.842268, -0.3156463, 0, 0, 0, 1, 1,
-0.4546664, 0.5382379, -1.110241, 0, 0, 0, 1, 1,
-0.4524592, 0.2595511, -0.8636417, 0, 0, 0, 1, 1,
-0.4523991, 0.1675444, -0.3011106, 0, 0, 0, 1, 1,
-0.44252, 0.3839097, -0.6888924, 0, 0, 0, 1, 1,
-0.4377626, -0.04401548, -2.213405, 0, 0, 0, 1, 1,
-0.4331035, 0.07744784, -1.439129, 1, 1, 1, 1, 1,
-0.4330085, -0.2377039, -2.083587, 1, 1, 1, 1, 1,
-0.4321527, -1.051662, -3.301057, 1, 1, 1, 1, 1,
-0.4320658, 0.6099479, -2.668352, 1, 1, 1, 1, 1,
-0.4287323, -1.057154, -3.340377, 1, 1, 1, 1, 1,
-0.4252381, -0.5081577, -2.786195, 1, 1, 1, 1, 1,
-0.4204138, -0.05954166, -1.020304, 1, 1, 1, 1, 1,
-0.4147678, -1.283646, -2.288771, 1, 1, 1, 1, 1,
-0.4117913, 0.4766446, -0.1705595, 1, 1, 1, 1, 1,
-0.399642, -0.9198993, -0.3863875, 1, 1, 1, 1, 1,
-0.3950619, -1.106273, -2.992508, 1, 1, 1, 1, 1,
-0.3930821, -0.3167652, -1.408301, 1, 1, 1, 1, 1,
-0.3814644, -0.05255454, -1.881239, 1, 1, 1, 1, 1,
-0.3761643, -1.562359, -2.740071, 1, 1, 1, 1, 1,
-0.3759874, -0.854628, -2.435592, 1, 1, 1, 1, 1,
-0.3742705, 0.0113285, -2.742255, 0, 0, 1, 1, 1,
-0.3737134, 0.8347123, -0.6302981, 1, 0, 0, 1, 1,
-0.3733629, -0.5846365, -3.093347, 1, 0, 0, 1, 1,
-0.3709816, 0.9207559, -0.4648648, 1, 0, 0, 1, 1,
-0.3601204, 0.2240025, 0.1269845, 1, 0, 0, 1, 1,
-0.3579713, 0.5875999, -0.4399856, 1, 0, 0, 1, 1,
-0.3553557, -1.123038, -1.468549, 0, 0, 0, 1, 1,
-0.3522207, -0.4384792, -3.178362, 0, 0, 0, 1, 1,
-0.3496342, -0.7811465, -1.787617, 0, 0, 0, 1, 1,
-0.3476456, 0.3456194, -1.192706, 0, 0, 0, 1, 1,
-0.3450488, 1.312146, 0.454258, 0, 0, 0, 1, 1,
-0.344979, -0.1646294, 0.2128237, 0, 0, 0, 1, 1,
-0.3385218, 1.376948, -0.06059349, 0, 0, 0, 1, 1,
-0.3366838, -0.1328827, -2.744522, 1, 1, 1, 1, 1,
-0.3333741, 0.1984449, 0.337041, 1, 1, 1, 1, 1,
-0.3311284, -1.854294, -3.227151, 1, 1, 1, 1, 1,
-0.3244713, -0.7209918, -3.596216, 1, 1, 1, 1, 1,
-0.3215035, -0.4465837, -3.001285, 1, 1, 1, 1, 1,
-0.3200092, -0.9729046, -0.1375761, 1, 1, 1, 1, 1,
-0.3137313, 1.378858, -0.52422, 1, 1, 1, 1, 1,
-0.3093357, 1.021243, -0.9681158, 1, 1, 1, 1, 1,
-0.3082693, -1.964841, -1.315923, 1, 1, 1, 1, 1,
-0.3080993, 0.8908322, -0.3726623, 1, 1, 1, 1, 1,
-0.3080274, -0.1370274, -2.27528, 1, 1, 1, 1, 1,
-0.3066086, 1.015875, 1.483755, 1, 1, 1, 1, 1,
-0.3064525, -2.840288, -2.934615, 1, 1, 1, 1, 1,
-0.3018352, 0.154798, -1.369211, 1, 1, 1, 1, 1,
-0.3018324, 0.5590706, -1.481525, 1, 1, 1, 1, 1,
-0.301666, -0.382728, -2.846109, 0, 0, 1, 1, 1,
-0.3006488, 0.7007149, 0.4079259, 1, 0, 0, 1, 1,
-0.2998901, 0.06520432, -0.7222576, 1, 0, 0, 1, 1,
-0.2933748, -0.3241477, -2.738055, 1, 0, 0, 1, 1,
-0.28747, 1.304844, -0.3078368, 1, 0, 0, 1, 1,
-0.2772905, -0.2112475, -0.9185129, 1, 0, 0, 1, 1,
-0.2698436, 0.2572356, -0.3022959, 0, 0, 0, 1, 1,
-0.2671499, 1.822693, 0.6655548, 0, 0, 0, 1, 1,
-0.2668725, 0.7173781, -1.685673, 0, 0, 0, 1, 1,
-0.2665465, 0.9902951, -0.2311768, 0, 0, 0, 1, 1,
-0.2661523, -0.2913119, -2.356499, 0, 0, 0, 1, 1,
-0.2653473, -0.8381538, -1.979161, 0, 0, 0, 1, 1,
-0.2608656, 0.02004627, -2.621511, 0, 0, 0, 1, 1,
-0.2587538, 1.033809, -1.259055, 1, 1, 1, 1, 1,
-0.2575658, -1.713537, -1.592993, 1, 1, 1, 1, 1,
-0.2560948, 0.436613, 0.07924633, 1, 1, 1, 1, 1,
-0.2541996, -0.2144685, -2.353738, 1, 1, 1, 1, 1,
-0.2541288, -0.8160068, -4.038586, 1, 1, 1, 1, 1,
-0.2537714, 0.03357983, -1.604299, 1, 1, 1, 1, 1,
-0.2500808, -1.462032, -2.757242, 1, 1, 1, 1, 1,
-0.2417767, 0.2685134, 0.881699, 1, 1, 1, 1, 1,
-0.2416181, -1.108107, -1.40219, 1, 1, 1, 1, 1,
-0.2403916, 1.946489, -0.397772, 1, 1, 1, 1, 1,
-0.2401735, -0.8795286, -2.255811, 1, 1, 1, 1, 1,
-0.2401152, -0.8295836, -4.00577, 1, 1, 1, 1, 1,
-0.2392569, -0.6982799, -3.429558, 1, 1, 1, 1, 1,
-0.2383072, 0.8186857, -1.288644, 1, 1, 1, 1, 1,
-0.2377807, 0.8272457, -0.874979, 1, 1, 1, 1, 1,
-0.2359008, 0.6889017, 1.513584, 0, 0, 1, 1, 1,
-0.2314665, 1.245862, -1.588282, 1, 0, 0, 1, 1,
-0.2314365, 0.9938356, 0.677617, 1, 0, 0, 1, 1,
-0.2255459, -2.003617, -2.836988, 1, 0, 0, 1, 1,
-0.2223442, -1.097016, -3.486815, 1, 0, 0, 1, 1,
-0.2198743, -0.6132952, -2.648963, 1, 0, 0, 1, 1,
-0.2179068, -0.3551551, -1.942836, 0, 0, 0, 1, 1,
-0.2120501, -0.2737141, -3.282285, 0, 0, 0, 1, 1,
-0.2083111, -0.5039296, -3.033957, 0, 0, 0, 1, 1,
-0.205309, 0.8718438, -0.6393665, 0, 0, 0, 1, 1,
-0.202877, 0.8821447, -0.5554432, 0, 0, 0, 1, 1,
-0.2028424, 0.2877681, 0.1904491, 0, 0, 0, 1, 1,
-0.1983907, 0.0414091, -3.551783, 0, 0, 0, 1, 1,
-0.1970412, 0.08047215, -1.599589, 1, 1, 1, 1, 1,
-0.19622, 0.1599836, -1.928411, 1, 1, 1, 1, 1,
-0.1943031, -0.2190041, -2.100276, 1, 1, 1, 1, 1,
-0.1903929, 0.3780741, -0.1307727, 1, 1, 1, 1, 1,
-0.1895712, -1.039026, -1.322269, 1, 1, 1, 1, 1,
-0.1887457, 0.8366203, 0.3153323, 1, 1, 1, 1, 1,
-0.1846233, -1.378295, -3.599832, 1, 1, 1, 1, 1,
-0.1789039, -1.788823, -2.043981, 1, 1, 1, 1, 1,
-0.176391, -0.9780481, -3.297044, 1, 1, 1, 1, 1,
-0.1746829, -1.313801, -2.598176, 1, 1, 1, 1, 1,
-0.1742314, -0.6545257, -3.447143, 1, 1, 1, 1, 1,
-0.1712733, -0.3630734, -0.5998574, 1, 1, 1, 1, 1,
-0.1712434, 0.3805901, -1.136087, 1, 1, 1, 1, 1,
-0.1665323, 0.5127504, -1.578445, 1, 1, 1, 1, 1,
-0.159769, -0.2597762, -3.638657, 1, 1, 1, 1, 1,
-0.1525005, -0.6438519, -3.305816, 0, 0, 1, 1, 1,
-0.1507494, -0.005941662, -2.296972, 1, 0, 0, 1, 1,
-0.1503363, -0.03116617, -2.533467, 1, 0, 0, 1, 1,
-0.145682, -0.05940095, -2.767344, 1, 0, 0, 1, 1,
-0.1450983, -0.09370685, -1.912558, 1, 0, 0, 1, 1,
-0.1421028, -0.5963039, -2.065061, 1, 0, 0, 1, 1,
-0.1382624, -0.004644126, -2.154001, 0, 0, 0, 1, 1,
-0.1379045, -0.3244205, -1.81063, 0, 0, 0, 1, 1,
-0.1294436, -0.01887272, -2.01486, 0, 0, 0, 1, 1,
-0.1286424, 0.4548455, -0.2214052, 0, 0, 0, 1, 1,
-0.1253468, -1.18017, -3.296719, 0, 0, 0, 1, 1,
-0.1251222, 0.120956, 0.7379723, 0, 0, 0, 1, 1,
-0.1249515, 0.5069886, -1.036306, 0, 0, 0, 1, 1,
-0.1178479, -1.676582, -3.485062, 1, 1, 1, 1, 1,
-0.116605, 0.8181153, 0.4945598, 1, 1, 1, 1, 1,
-0.1145627, -1.212169, -3.194252, 1, 1, 1, 1, 1,
-0.1141729, 1.677013, 0.5067929, 1, 1, 1, 1, 1,
-0.1116124, -0.2070456, -3.787075, 1, 1, 1, 1, 1,
-0.1110988, 0.6607916, -0.1229024, 1, 1, 1, 1, 1,
-0.1089019, -0.4274715, -2.153081, 1, 1, 1, 1, 1,
-0.1080246, 0.146935, -1.045021, 1, 1, 1, 1, 1,
-0.1079571, -1.984922, -1.700327, 1, 1, 1, 1, 1,
-0.1062342, -0.7438383, -2.17504, 1, 1, 1, 1, 1,
-0.1014142, -1.287932, -3.224752, 1, 1, 1, 1, 1,
-0.09829482, -0.4353423, -3.660005, 1, 1, 1, 1, 1,
-0.09530327, -1.469759, -0.8406062, 1, 1, 1, 1, 1,
-0.09440596, 1.711788, -1.746256, 1, 1, 1, 1, 1,
-0.09173307, 0.7298899, 1.47764, 1, 1, 1, 1, 1,
-0.08969897, -1.23196, -3.442661, 0, 0, 1, 1, 1,
-0.08795127, 0.848762, -0.01408757, 1, 0, 0, 1, 1,
-0.08626776, 0.4490901, 0.5116925, 1, 0, 0, 1, 1,
-0.08597463, -0.6626002, -3.455708, 1, 0, 0, 1, 1,
-0.08592412, -0.5354576, -2.678131, 1, 0, 0, 1, 1,
-0.08111762, 0.46523, 0.5052185, 1, 0, 0, 1, 1,
-0.07542952, -0.1980268, -3.975387, 0, 0, 0, 1, 1,
-0.07340253, 1.17174, 1.336468, 0, 0, 0, 1, 1,
-0.07153568, -0.6624227, -2.129412, 0, 0, 0, 1, 1,
-0.07136749, -0.5157089, -3.039314, 0, 0, 0, 1, 1,
-0.07053951, 0.762319, -1.068264, 0, 0, 0, 1, 1,
-0.06961346, -0.3854879, -2.10665, 0, 0, 0, 1, 1,
-0.06851087, -1.310949, -3.431644, 0, 0, 0, 1, 1,
-0.06535522, -0.7444779, -2.335272, 1, 1, 1, 1, 1,
-0.06275435, 1.080295, 0.6580745, 1, 1, 1, 1, 1,
-0.0619764, 0.6283477, 0.5761849, 1, 1, 1, 1, 1,
-0.06080612, -1.510181, -3.842553, 1, 1, 1, 1, 1,
-0.06071012, 1.006974, -1.367718, 1, 1, 1, 1, 1,
-0.05755768, 0.1916782, -0.8754069, 1, 1, 1, 1, 1,
-0.04770739, -0.03783477, -4.234426, 1, 1, 1, 1, 1,
-0.04527136, 0.2578072, -1.110361, 1, 1, 1, 1, 1,
-0.03955609, -1.014768, -1.726258, 1, 1, 1, 1, 1,
-0.039337, 0.1078897, 0.6866844, 1, 1, 1, 1, 1,
-0.03900329, -0.3111106, -2.68802, 1, 1, 1, 1, 1,
-0.03790187, 0.5142285, -0.5792687, 1, 1, 1, 1, 1,
-0.03470401, -0.4905357, -5.040461, 1, 1, 1, 1, 1,
-0.03442605, -1.499892, -4.032798, 1, 1, 1, 1, 1,
-0.03201419, 0.193209, -0.5789864, 1, 1, 1, 1, 1,
-0.03165013, -0.6864454, -4.973308, 0, 0, 1, 1, 1,
-0.03084472, -0.6441633, -3.704757, 1, 0, 0, 1, 1,
-0.02215363, 1.292305, 1.314219, 1, 0, 0, 1, 1,
-0.02173078, 1.228306, -1.468349, 1, 0, 0, 1, 1,
-0.01903986, -0.09125147, -3.113251, 1, 0, 0, 1, 1,
-0.01872489, -0.4076297, -2.297091, 1, 0, 0, 1, 1,
-0.01761007, 0.2298866, 1.136343, 0, 0, 0, 1, 1,
-0.01256174, -0.04073847, -1.123874, 0, 0, 0, 1, 1,
-0.007720777, 0.05119582, 1.172254, 0, 0, 0, 1, 1,
-0.005628374, -0.7213811, -3.476784, 0, 0, 0, 1, 1,
-0.004721962, 0.851495, -0.827706, 0, 0, 0, 1, 1,
-0.001217326, -0.9175166, -3.543459, 0, 0, 0, 1, 1,
0.001318652, 0.1442247, -0.6580181, 0, 0, 0, 1, 1,
0.002809466, 1.472239, -1.256915, 1, 1, 1, 1, 1,
0.004633493, -0.2871198, 4.064859, 1, 1, 1, 1, 1,
0.005198918, -0.3384329, 3.305721, 1, 1, 1, 1, 1,
0.006934589, -0.5007026, 2.303121, 1, 1, 1, 1, 1,
0.007090006, 0.8603747, 1.006788, 1, 1, 1, 1, 1,
0.01053762, 2.190827, 0.6142682, 1, 1, 1, 1, 1,
0.01157846, -0.5505516, 4.644437, 1, 1, 1, 1, 1,
0.0126905, 0.723137, 1.627954, 1, 1, 1, 1, 1,
0.02161688, -0.7179829, 2.223984, 1, 1, 1, 1, 1,
0.0289548, -0.3061517, 3.384181, 1, 1, 1, 1, 1,
0.03040326, 0.08341591, 2.07541, 1, 1, 1, 1, 1,
0.03250505, -1.776385, 2.285044, 1, 1, 1, 1, 1,
0.03507335, 1.078404, 1.051085, 1, 1, 1, 1, 1,
0.03872741, 0.2739044, -2.309974, 1, 1, 1, 1, 1,
0.04076682, 0.2054119, 0.9134845, 1, 1, 1, 1, 1,
0.04110925, -0.1241638, 4.31239, 0, 0, 1, 1, 1,
0.04182188, 0.2457391, 0.7822508, 1, 0, 0, 1, 1,
0.04579398, -0.3089502, 2.79006, 1, 0, 0, 1, 1,
0.0462209, 1.925827, -0.6713588, 1, 0, 0, 1, 1,
0.04678241, -0.1849803, 0.9430934, 1, 0, 0, 1, 1,
0.04703584, -0.009754618, 1.671678, 1, 0, 0, 1, 1,
0.04808147, 2.759092, 0.02860982, 0, 0, 0, 1, 1,
0.04970424, -0.455696, 4.159737, 0, 0, 0, 1, 1,
0.05263205, -1.987811, 0.7431054, 0, 0, 0, 1, 1,
0.05294877, -2.000204, 4.235004, 0, 0, 0, 1, 1,
0.05312992, -0.6109424, 2.968905, 0, 0, 0, 1, 1,
0.06121741, -1.355808, 1.756545, 0, 0, 0, 1, 1,
0.07087096, -0.3361451, 1.237721, 0, 0, 0, 1, 1,
0.07152167, 2.66737, 1.191642, 1, 1, 1, 1, 1,
0.07616261, 0.2212273, -0.01737203, 1, 1, 1, 1, 1,
0.07935477, 2.770453, 0.9972818, 1, 1, 1, 1, 1,
0.08137575, -1.485717, 1.959393, 1, 1, 1, 1, 1,
0.08261428, -0.3459407, 3.010256, 1, 1, 1, 1, 1,
0.08303837, 0.4982271, -0.115686, 1, 1, 1, 1, 1,
0.08676662, 0.1619034, 0.2595724, 1, 1, 1, 1, 1,
0.08736404, 0.08953413, 0.9594325, 1, 1, 1, 1, 1,
0.08982272, 0.4436663, 0.5238485, 1, 1, 1, 1, 1,
0.09041328, -0.9688172, 0.626228, 1, 1, 1, 1, 1,
0.09068297, -0.7289752, 2.716725, 1, 1, 1, 1, 1,
0.09077834, -1.235731, 4.334186, 1, 1, 1, 1, 1,
0.09131411, 0.6260656, 0.03137463, 1, 1, 1, 1, 1,
0.09143207, 0.5549817, 0.1015934, 1, 1, 1, 1, 1,
0.09230979, -1.040782, 2.767709, 1, 1, 1, 1, 1,
0.09351051, 1.098476, -1.420177, 0, 0, 1, 1, 1,
0.09736622, -0.3788712, 2.602803, 1, 0, 0, 1, 1,
0.1034206, 1.619406, 1.426396, 1, 0, 0, 1, 1,
0.1045169, 1.831751, 1.398222, 1, 0, 0, 1, 1,
0.1060904, -0.4296076, 4.831493, 1, 0, 0, 1, 1,
0.1066401, 0.05077042, -1.389329, 1, 0, 0, 1, 1,
0.1071297, 0.8049541, -0.3901216, 0, 0, 0, 1, 1,
0.1083514, 1.435316, 0.4564093, 0, 0, 0, 1, 1,
0.1098857, 1.689717, -0.9758436, 0, 0, 0, 1, 1,
0.1117168, -0.1615547, 4.276064, 0, 0, 0, 1, 1,
0.1127073, 0.004690466, 0.3788605, 0, 0, 0, 1, 1,
0.1129985, 0.6870594, -0.4380828, 0, 0, 0, 1, 1,
0.11637, -2.209205, 2.748856, 0, 0, 0, 1, 1,
0.116417, -0.4478891, 2.422559, 1, 1, 1, 1, 1,
0.1174753, -0.9207435, 3.110266, 1, 1, 1, 1, 1,
0.1289388, 0.01506872, 2.022788, 1, 1, 1, 1, 1,
0.1371445, -1.311485, 3.611259, 1, 1, 1, 1, 1,
0.1375641, 0.472148, -1.21097, 1, 1, 1, 1, 1,
0.137716, 0.2040154, -0.05960468, 1, 1, 1, 1, 1,
0.1388198, 0.6244066, -0.6366423, 1, 1, 1, 1, 1,
0.1398251, -1.956582, 5.500188, 1, 1, 1, 1, 1,
0.1416087, 1.681775, -0.1247401, 1, 1, 1, 1, 1,
0.1444325, -0.4007773, 2.265326, 1, 1, 1, 1, 1,
0.1452368, 0.7619414, -1.167297, 1, 1, 1, 1, 1,
0.1495194, 0.4463754, 0.805284, 1, 1, 1, 1, 1,
0.1497677, 1.019966, 0.01674656, 1, 1, 1, 1, 1,
0.1503677, -0.09559727, 2.336105, 1, 1, 1, 1, 1,
0.1506215, -1.11718, 3.839897, 1, 1, 1, 1, 1,
0.1524244, 0.2693184, 0.8575462, 0, 0, 1, 1, 1,
0.1573889, -1.114668, 1.251165, 1, 0, 0, 1, 1,
0.1587187, -0.4739213, 1.587834, 1, 0, 0, 1, 1,
0.1638696, -1.180896, 3.424549, 1, 0, 0, 1, 1,
0.165895, -0.4014415, 2.563467, 1, 0, 0, 1, 1,
0.1663824, 0.5626679, 0.01831412, 1, 0, 0, 1, 1,
0.167377, 0.7181532, 0.5605032, 0, 0, 0, 1, 1,
0.1683598, 1.217575, 0.7539223, 0, 0, 0, 1, 1,
0.1740198, -1.389885, 1.910709, 0, 0, 0, 1, 1,
0.1753957, 1.141322, 0.5188764, 0, 0, 0, 1, 1,
0.1759008, -1.00335, 2.837352, 0, 0, 0, 1, 1,
0.1768882, -0.1026488, 2.198795, 0, 0, 0, 1, 1,
0.1770337, -1.617914, 4.96173, 0, 0, 0, 1, 1,
0.1783903, -1.524088, 3.786978, 1, 1, 1, 1, 1,
0.1805247, 0.2255315, -0.03133893, 1, 1, 1, 1, 1,
0.193141, -0.2951235, 2.622173, 1, 1, 1, 1, 1,
0.2017579, 0.3172472, -1.720447, 1, 1, 1, 1, 1,
0.2026462, 0.569976, 0.04475608, 1, 1, 1, 1, 1,
0.2035182, 1.661563, 0.2050685, 1, 1, 1, 1, 1,
0.2086093, 0.5504578, 1.135215, 1, 1, 1, 1, 1,
0.2149027, 0.3497705, 2.541294, 1, 1, 1, 1, 1,
0.2155482, -0.9162472, 2.014729, 1, 1, 1, 1, 1,
0.2228593, -1.105963, 3.002108, 1, 1, 1, 1, 1,
0.2274637, -0.6341095, 3.959524, 1, 1, 1, 1, 1,
0.2311665, 0.2951444, 0.2640303, 1, 1, 1, 1, 1,
0.2339488, -1.482614, 1.63997, 1, 1, 1, 1, 1,
0.2356072, 0.6372345, 1.874323, 1, 1, 1, 1, 1,
0.2365089, 0.9206703, -0.5894771, 1, 1, 1, 1, 1,
0.2387387, -1.133721, 3.013514, 0, 0, 1, 1, 1,
0.2394315, 1.116017, -0.2721947, 1, 0, 0, 1, 1,
0.2407251, 1.298779, 1.640982, 1, 0, 0, 1, 1,
0.2424219, 0.4893139, -0.4747817, 1, 0, 0, 1, 1,
0.2433152, 1.598217, -0.1529284, 1, 0, 0, 1, 1,
0.2471291, 0.5410916, 1.697471, 1, 0, 0, 1, 1,
0.2551446, -0.5575538, 3.310611, 0, 0, 0, 1, 1,
0.2603854, -1.780306, 2.318855, 0, 0, 0, 1, 1,
0.2609617, 1.349716, 1.962604, 0, 0, 0, 1, 1,
0.2612273, -0.5424035, 2.444726, 0, 0, 0, 1, 1,
0.2654395, 0.4326324, 0.7477785, 0, 0, 0, 1, 1,
0.266744, -0.7002109, 3.730376, 0, 0, 0, 1, 1,
0.2671019, -1.453336, 2.436363, 0, 0, 0, 1, 1,
0.2683257, 0.6795299, -0.744768, 1, 1, 1, 1, 1,
0.2687175, 1.143844, -0.04609856, 1, 1, 1, 1, 1,
0.2727222, 1.656672, -1.074834, 1, 1, 1, 1, 1,
0.2736368, -0.4728685, 1.790146, 1, 1, 1, 1, 1,
0.2737477, 0.4669277, 0.4227802, 1, 1, 1, 1, 1,
0.2787369, -1.917357, 3.485573, 1, 1, 1, 1, 1,
0.288437, 0.4544389, 0.7530478, 1, 1, 1, 1, 1,
0.2886973, 1.16945, 1.088994, 1, 1, 1, 1, 1,
0.2888609, 0.1721799, -0.1751258, 1, 1, 1, 1, 1,
0.3020187, -0.9632217, 1.123655, 1, 1, 1, 1, 1,
0.3054951, 0.2045985, 0.2784755, 1, 1, 1, 1, 1,
0.3094507, 0.2789977, 1.340628, 1, 1, 1, 1, 1,
0.3107906, -0.7010998, 4.188462, 1, 1, 1, 1, 1,
0.312591, 1.284347, 0.2081994, 1, 1, 1, 1, 1,
0.3152427, 0.5647731, -1.622235, 1, 1, 1, 1, 1,
0.3155779, 0.7015467, -0.4038948, 0, 0, 1, 1, 1,
0.3179165, 0.1357923, 1.833914, 1, 0, 0, 1, 1,
0.3186604, 1.981441, -0.4535121, 1, 0, 0, 1, 1,
0.3207513, 0.2270717, 1.807926, 1, 0, 0, 1, 1,
0.3250871, -0.8201562, 2.267579, 1, 0, 0, 1, 1,
0.3277095, 0.7137567, 2.624102, 1, 0, 0, 1, 1,
0.3307948, 0.2389754, 0.1883518, 0, 0, 0, 1, 1,
0.3319059, 0.06390657, 1.261602, 0, 0, 0, 1, 1,
0.3320032, 0.6508483, -0.6104226, 0, 0, 0, 1, 1,
0.335909, 0.2368194, 0.5209574, 0, 0, 0, 1, 1,
0.339001, -1.300254, 3.714178, 0, 0, 0, 1, 1,
0.3418182, 0.4560773, 0.6613684, 0, 0, 0, 1, 1,
0.3422865, -0.1205712, 2.024793, 0, 0, 0, 1, 1,
0.3430446, -0.6097943, 2.581182, 1, 1, 1, 1, 1,
0.3446153, 1.223623, 1.256427, 1, 1, 1, 1, 1,
0.3454814, -0.7243024, 1.487325, 1, 1, 1, 1, 1,
0.3476825, 1.100214, 0.4085101, 1, 1, 1, 1, 1,
0.3477134, 0.3330815, 0.8953137, 1, 1, 1, 1, 1,
0.3529543, 0.5144562, 0.3617713, 1, 1, 1, 1, 1,
0.3531988, -1.076458, 3.270924, 1, 1, 1, 1, 1,
0.3537969, -0.205628, 2.215425, 1, 1, 1, 1, 1,
0.3538598, -0.6925843, 2.934804, 1, 1, 1, 1, 1,
0.3543842, -0.5241141, 4.645202, 1, 1, 1, 1, 1,
0.3590918, -2.398801, 3.71152, 1, 1, 1, 1, 1,
0.3597934, 0.7723042, 1.550356, 1, 1, 1, 1, 1,
0.3622104, 1.416321, 2.147015, 1, 1, 1, 1, 1,
0.3678715, 0.9215505, 3.268096, 1, 1, 1, 1, 1,
0.3688356, 0.9705812, -0.4687785, 1, 1, 1, 1, 1,
0.3706786, 0.3475431, 0.08166577, 0, 0, 1, 1, 1,
0.3708337, -0.7847078, 2.442282, 1, 0, 0, 1, 1,
0.3753835, 1.246877, -0.8411787, 1, 0, 0, 1, 1,
0.3794484, 0.8238776, 1.037722, 1, 0, 0, 1, 1,
0.3815815, 0.4864333, 0.6571593, 1, 0, 0, 1, 1,
0.3837689, 0.6999924, 0.9692712, 1, 0, 0, 1, 1,
0.384951, 0.3712406, 1.251991, 0, 0, 0, 1, 1,
0.3867084, -1.531158, 4.694425, 0, 0, 0, 1, 1,
0.3884022, -1.018928, 2.364519, 0, 0, 0, 1, 1,
0.3974165, 1.336599, -0.188048, 0, 0, 0, 1, 1,
0.3974629, 0.2903745, -0.2229353, 0, 0, 0, 1, 1,
0.4030173, 0.2761906, 1.320848, 0, 0, 0, 1, 1,
0.4077104, -0.5098925, 1.784037, 0, 0, 0, 1, 1,
0.4080431, 1.160885, 0.7805125, 1, 1, 1, 1, 1,
0.4109226, -0.9363896, -0.6232266, 1, 1, 1, 1, 1,
0.413975, -0.4622005, 3.223226, 1, 1, 1, 1, 1,
0.4152691, -1.306349, 1.39839, 1, 1, 1, 1, 1,
0.4163712, 1.118457, 0.6345772, 1, 1, 1, 1, 1,
0.4178748, -1.166361, 3.889607, 1, 1, 1, 1, 1,
0.4204215, -0.5371183, 1.245183, 1, 1, 1, 1, 1,
0.4204241, -0.5798906, 2.58013, 1, 1, 1, 1, 1,
0.4209496, 2.652598, -0.2540478, 1, 1, 1, 1, 1,
0.424064, -1.310407, 3.432001, 1, 1, 1, 1, 1,
0.4251097, 0.2205849, 3.283264, 1, 1, 1, 1, 1,
0.4266865, -0.04065556, 0.187279, 1, 1, 1, 1, 1,
0.4268455, 1.179643, 0.5175685, 1, 1, 1, 1, 1,
0.4294264, 1.380853, 1.391267, 1, 1, 1, 1, 1,
0.4299298, -0.3436853, 1.109031, 1, 1, 1, 1, 1,
0.4317456, -0.000307373, 0.544847, 0, 0, 1, 1, 1,
0.4372255, -0.267338, 3.504622, 1, 0, 0, 1, 1,
0.4372907, -0.3253361, 1.878967, 1, 0, 0, 1, 1,
0.4422261, 0.2150287, 1.422166, 1, 0, 0, 1, 1,
0.4427564, 0.6328992, 2.06793, 1, 0, 0, 1, 1,
0.4496171, -0.1175225, 0.5629582, 1, 0, 0, 1, 1,
0.4503868, -0.662731, 2.617759, 0, 0, 0, 1, 1,
0.4510356, -0.3630367, 1.860187, 0, 0, 0, 1, 1,
0.4516925, 0.4843293, -0.3466919, 0, 0, 0, 1, 1,
0.4530705, 1.452539, -1.046302, 0, 0, 0, 1, 1,
0.4562738, -0.7919195, 1.718915, 0, 0, 0, 1, 1,
0.4568711, 0.1702846, 0.4865645, 0, 0, 0, 1, 1,
0.4704348, -0.08296104, 2.52021, 0, 0, 0, 1, 1,
0.4706589, 0.3801519, 0.4771715, 1, 1, 1, 1, 1,
0.4712012, -0.02118992, 1.833298, 1, 1, 1, 1, 1,
0.4720087, 1.08463, 0.2572491, 1, 1, 1, 1, 1,
0.4721128, 1.351756, 1.452365, 1, 1, 1, 1, 1,
0.4726482, 0.2314019, 0.5857905, 1, 1, 1, 1, 1,
0.4790592, 0.7729854, 0.5193606, 1, 1, 1, 1, 1,
0.4800961, -1.189157, 2.168304, 1, 1, 1, 1, 1,
0.4904774, -0.465005, 2.726961, 1, 1, 1, 1, 1,
0.49327, 1.209579, 1.385513, 1, 1, 1, 1, 1,
0.4933753, 1.07665, 0.9210343, 1, 1, 1, 1, 1,
0.4998356, -1.105926, 3.05917, 1, 1, 1, 1, 1,
0.5022883, -1.158973, 3.727366, 1, 1, 1, 1, 1,
0.5042493, 0.1374914, 2.523468, 1, 1, 1, 1, 1,
0.5058479, -1.066324, 2.494817, 1, 1, 1, 1, 1,
0.5086579, 1.698287, 1.695614, 1, 1, 1, 1, 1,
0.5100999, 0.8637781, -0.6011462, 0, 0, 1, 1, 1,
0.5128005, -1.799339, 5.509559, 1, 0, 0, 1, 1,
0.5139986, 0.6358826, 2.097342, 1, 0, 0, 1, 1,
0.5165493, 0.3303097, 2.782236, 1, 0, 0, 1, 1,
0.5246771, -0.991744, 1.485096, 1, 0, 0, 1, 1,
0.5267473, 0.5187989, 0.7324631, 1, 0, 0, 1, 1,
0.5444801, 0.7791944, -0.1851265, 0, 0, 0, 1, 1,
0.5451438, -0.2995278, 1.46917, 0, 0, 0, 1, 1,
0.5526532, 0.3775282, 0.814786, 0, 0, 0, 1, 1,
0.553012, 1.134371, 0.8032823, 0, 0, 0, 1, 1,
0.5533657, -0.5730703, 2.683341, 0, 0, 0, 1, 1,
0.5546635, -0.7439965, 2.127679, 0, 0, 0, 1, 1,
0.5593227, 0.9510252, 0.4161653, 0, 0, 0, 1, 1,
0.5597606, -0.9633483, 3.201094, 1, 1, 1, 1, 1,
0.5600408, 0.969695, -0.4100664, 1, 1, 1, 1, 1,
0.5619015, 0.7176491, 1.875106, 1, 1, 1, 1, 1,
0.5629231, -0.4145572, 2.350119, 1, 1, 1, 1, 1,
0.5649722, -3.393362, 2.265792, 1, 1, 1, 1, 1,
0.5672856, 1.997596, 0.1471217, 1, 1, 1, 1, 1,
0.5678546, 0.1780806, -0.08728307, 1, 1, 1, 1, 1,
0.5720638, -1.325069, 2.574196, 1, 1, 1, 1, 1,
0.5799702, 0.4526117, 0.513979, 1, 1, 1, 1, 1,
0.5808385, -0.5888457, 1.933644, 1, 1, 1, 1, 1,
0.5822339, -0.2695623, 0.9985364, 1, 1, 1, 1, 1,
0.5833104, -1.01083, 2.020472, 1, 1, 1, 1, 1,
0.584816, 0.1385455, 0.6093315, 1, 1, 1, 1, 1,
0.5858399, -0.2172515, 0.8011845, 1, 1, 1, 1, 1,
0.5865437, -0.3937223, 1.123756, 1, 1, 1, 1, 1,
0.5879227, 0.826966, 0.6208605, 0, 0, 1, 1, 1,
0.5893774, -1.475692, 1.507006, 1, 0, 0, 1, 1,
0.5905328, 1.46236, 1.840735, 1, 0, 0, 1, 1,
0.5930897, 2.099959, -0.1996734, 1, 0, 0, 1, 1,
0.5997517, -1.253258, 3.028002, 1, 0, 0, 1, 1,
0.6024677, 0.6917819, 3.150578, 1, 0, 0, 1, 1,
0.6029392, 0.9993173, 0.871781, 0, 0, 0, 1, 1,
0.6118392, -1.743945, 2.548281, 0, 0, 0, 1, 1,
0.6152467, 0.0431695, 0.5995358, 0, 0, 0, 1, 1,
0.6175967, 0.911797, -0.3408842, 0, 0, 0, 1, 1,
0.6253023, 0.03770123, 1.689069, 0, 0, 0, 1, 1,
0.6276522, -1.114595, 2.734108, 0, 0, 0, 1, 1,
0.6287329, -0.1222612, 1.56329, 0, 0, 0, 1, 1,
0.6348056, -0.03387623, 1.10281, 1, 1, 1, 1, 1,
0.640513, 1.478362, 0.7957653, 1, 1, 1, 1, 1,
0.648182, -0.9787674, 2.123422, 1, 1, 1, 1, 1,
0.6515543, 0.5751886, -0.1080025, 1, 1, 1, 1, 1,
0.6524217, 2.286333, 0.1718066, 1, 1, 1, 1, 1,
0.6535549, -2.32297, 3.72232, 1, 1, 1, 1, 1,
0.6540297, -1.747747, 2.17959, 1, 1, 1, 1, 1,
0.6629115, -0.9485713, 1.465439, 1, 1, 1, 1, 1,
0.6652985, 0.6443825, 0.07231193, 1, 1, 1, 1, 1,
0.6658264, 0.3275458, 1.42089, 1, 1, 1, 1, 1,
0.6667746, -0.1196225, 0.9862179, 1, 1, 1, 1, 1,
0.6799875, 0.9430638, 2.759903, 1, 1, 1, 1, 1,
0.6823542, -1.020745, 2.332568, 1, 1, 1, 1, 1,
0.6838275, 0.8342437, 0.761042, 1, 1, 1, 1, 1,
0.6887403, -0.8346174, 3.479416, 1, 1, 1, 1, 1,
0.6891567, -0.822024, 3.124731, 0, 0, 1, 1, 1,
0.6974781, 1.488456, 0.2098941, 1, 0, 0, 1, 1,
0.7058674, -0.3358694, 1.793623, 1, 0, 0, 1, 1,
0.7067314, 1.335372, 0.5502349, 1, 0, 0, 1, 1,
0.7120463, -0.1999509, 2.008804, 1, 0, 0, 1, 1,
0.717133, -0.09243097, 1.132919, 1, 0, 0, 1, 1,
0.7181886, -1.460023, 3.33878, 0, 0, 0, 1, 1,
0.7195107, -0.3736038, 1.838423, 0, 0, 0, 1, 1,
0.7229139, 1.108902, 0.5351774, 0, 0, 0, 1, 1,
0.7229531, 0.0009972955, 0.3854856, 0, 0, 0, 1, 1,
0.7257752, -1.5724, 2.431877, 0, 0, 0, 1, 1,
0.7266574, 0.7445578, 0.5084984, 0, 0, 0, 1, 1,
0.7312019, 0.6236416, -0.3161046, 0, 0, 0, 1, 1,
0.7323933, -0.1747015, 1.406097, 1, 1, 1, 1, 1,
0.7334502, 0.2018911, 1.611693, 1, 1, 1, 1, 1,
0.7337975, 0.03859751, 2.120268, 1, 1, 1, 1, 1,
0.7387776, 1.395295, -0.3527558, 1, 1, 1, 1, 1,
0.7400857, 2.446887, 1.092515, 1, 1, 1, 1, 1,
0.7435788, -1.74649, 3.327355, 1, 1, 1, 1, 1,
0.7442785, -0.791766, 1.716468, 1, 1, 1, 1, 1,
0.7485543, 0.757048, -1.064738, 1, 1, 1, 1, 1,
0.754768, 0.3936008, 1.677785, 1, 1, 1, 1, 1,
0.7551157, -0.3760039, 1.309014, 1, 1, 1, 1, 1,
0.7572599, 0.465445, 0.07660109, 1, 1, 1, 1, 1,
0.7615771, 0.6386129, 0.06861234, 1, 1, 1, 1, 1,
0.7625809, 1.53558, 0.8601685, 1, 1, 1, 1, 1,
0.771199, -0.3114577, 1.742968, 1, 1, 1, 1, 1,
0.7713832, -0.2122843, 3.341911, 1, 1, 1, 1, 1,
0.7747938, 0.499469, 0.3679623, 0, 0, 1, 1, 1,
0.7792894, -0.05481171, 1.392774, 1, 0, 0, 1, 1,
0.7804267, 0.9962029, 0.06333124, 1, 0, 0, 1, 1,
0.7804587, -1.386993, 1.249893, 1, 0, 0, 1, 1,
0.7826514, 0.8767596, 0.6568469, 1, 0, 0, 1, 1,
0.7875034, -0.4744235, 1.2724, 1, 0, 0, 1, 1,
0.7876697, 0.9027244, -1.001844, 0, 0, 0, 1, 1,
0.7900049, -3.026023, 3.66047, 0, 0, 0, 1, 1,
0.7911094, 1.377285, -1.482977, 0, 0, 0, 1, 1,
0.7941488, -1.976085, 3.670968, 0, 0, 0, 1, 1,
0.8122063, 0.7278502, 0.471558, 0, 0, 0, 1, 1,
0.8138952, 0.05397783, 1.372951, 0, 0, 0, 1, 1,
0.8143815, -1.592136, 2.525704, 0, 0, 0, 1, 1,
0.814401, -0.538502, 0.9266395, 1, 1, 1, 1, 1,
0.8168136, 0.3755153, 1.664886, 1, 1, 1, 1, 1,
0.8173012, 0.3467609, -0.25032, 1, 1, 1, 1, 1,
0.8173932, 0.7201008, 0.1075049, 1, 1, 1, 1, 1,
0.8209293, 0.8830938, 0.9849224, 1, 1, 1, 1, 1,
0.824245, 0.3116752, 0.9943869, 1, 1, 1, 1, 1,
0.8249367, 0.0352327, 0.4847573, 1, 1, 1, 1, 1,
0.8366484, 0.5971662, 0.7772708, 1, 1, 1, 1, 1,
0.8366535, 0.9399926, 1.155434, 1, 1, 1, 1, 1,
0.841284, 1.372898, -0.2926784, 1, 1, 1, 1, 1,
0.8444754, -1.421243, 3.552963, 1, 1, 1, 1, 1,
0.8495343, 0.8267084, -0.2538302, 1, 1, 1, 1, 1,
0.8555517, 0.9158961, 0.06227172, 1, 1, 1, 1, 1,
0.8557476, 0.2576654, 0.4542348, 1, 1, 1, 1, 1,
0.8609825, 0.5002275, -0.1093385, 1, 1, 1, 1, 1,
0.8692078, -0.08252914, 1.218453, 0, 0, 1, 1, 1,
0.8761953, 0.9789431, 1.270144, 1, 0, 0, 1, 1,
0.8801931, -0.7819805, 3.921055, 1, 0, 0, 1, 1,
0.8837144, 1.384021, 0.7348818, 1, 0, 0, 1, 1,
0.8868499, 0.04606248, 1.568531, 1, 0, 0, 1, 1,
0.88836, -0.5382786, 1.680425, 1, 0, 0, 1, 1,
0.8967221, 0.4308979, 1.451396, 0, 0, 0, 1, 1,
0.8990993, -0.3405462, 2.992877, 0, 0, 0, 1, 1,
0.902723, 1.536735, 0.1055017, 0, 0, 0, 1, 1,
0.9066114, 0.4197967, 0.9718755, 0, 0, 0, 1, 1,
0.9119886, -0.2921958, 3.576483, 0, 0, 0, 1, 1,
0.9163649, -0.1575486, 2.581733, 0, 0, 0, 1, 1,
0.9170241, -0.5155666, 1.999288, 0, 0, 0, 1, 1,
0.9269106, -1.054353, 4.55225, 1, 1, 1, 1, 1,
0.9344144, 0.2279292, 1.951521, 1, 1, 1, 1, 1,
0.9363192, -0.5009131, 1.63279, 1, 1, 1, 1, 1,
0.9365088, 1.083141, 0.8118491, 1, 1, 1, 1, 1,
0.9401315, 0.2525658, 1.62003, 1, 1, 1, 1, 1,
0.9430034, -0.3846175, 1.490263, 1, 1, 1, 1, 1,
0.9452981, 0.497866, 1.192026, 1, 1, 1, 1, 1,
0.9469298, 0.04710556, 3.628022, 1, 1, 1, 1, 1,
0.9482694, -0.7899712, 0.3149942, 1, 1, 1, 1, 1,
0.9510928, 0.3362836, 1.002245, 1, 1, 1, 1, 1,
0.9516158, 0.7150445, 2.068662, 1, 1, 1, 1, 1,
0.9611212, -1.871337, 2.224879, 1, 1, 1, 1, 1,
0.972844, 0.4041943, 2.271924, 1, 1, 1, 1, 1,
0.9739504, -0.9422343, 4.169711, 1, 1, 1, 1, 1,
0.9800106, 0.1615925, 1.171485, 1, 1, 1, 1, 1,
0.9804038, -0.04606128, 1.19136, 0, 0, 1, 1, 1,
0.9888098, 0.2653756, 0.9359148, 1, 0, 0, 1, 1,
0.9911479, -0.2540185, 1.318639, 1, 0, 0, 1, 1,
0.9942199, 1.965421, 0.1460783, 1, 0, 0, 1, 1,
0.9965146, -0.3373708, 2.457757, 1, 0, 0, 1, 1,
1.001936, -0.5574955, 1.270955, 1, 0, 0, 1, 1,
1.002824, 0.7967067, 1.896206, 0, 0, 0, 1, 1,
1.005556, 1.057306, 1.326148, 0, 0, 0, 1, 1,
1.008267, 0.2584169, 1.823268, 0, 0, 0, 1, 1,
1.008626, 1.579462, 1.020703, 0, 0, 0, 1, 1,
1.016505, -0.9338443, 2.692025, 0, 0, 0, 1, 1,
1.024615, 0.07307339, -0.5921126, 0, 0, 0, 1, 1,
1.031111, 0.595719, -0.4217629, 0, 0, 0, 1, 1,
1.034496, 0.7479218, 2.400108, 1, 1, 1, 1, 1,
1.036187, -0.5320444, 1.716341, 1, 1, 1, 1, 1,
1.04115, 0.2731478, 1.708277, 1, 1, 1, 1, 1,
1.044145, 0.3989614, 1.099926, 1, 1, 1, 1, 1,
1.045479, 0.6982784, -0.2762135, 1, 1, 1, 1, 1,
1.047837, -1.281963, 1.796058, 1, 1, 1, 1, 1,
1.04915, 0.08293997, 1.776567, 1, 1, 1, 1, 1,
1.054125, -0.7563175, 3.519396, 1, 1, 1, 1, 1,
1.054351, 0.02107345, 2.053786, 1, 1, 1, 1, 1,
1.057083, -1.931092, 3.128073, 1, 1, 1, 1, 1,
1.062611, 1.305699, 0.7816933, 1, 1, 1, 1, 1,
1.06819, 0.9389908, 2.24006, 1, 1, 1, 1, 1,
1.081633, 0.1869657, 1.76503, 1, 1, 1, 1, 1,
1.082583, -0.09055603, 0.8429826, 1, 1, 1, 1, 1,
1.097154, 0.8498991, 0.3154148, 1, 1, 1, 1, 1,
1.098793, 0.4849751, 1.387413, 0, 0, 1, 1, 1,
1.105651, 0.06128534, 3.674848, 1, 0, 0, 1, 1,
1.10818, 1.768082, 1.598981, 1, 0, 0, 1, 1,
1.112244, 1.328693, 0.5571288, 1, 0, 0, 1, 1,
1.11299, -1.646436, 2.733726, 1, 0, 0, 1, 1,
1.124297, 0.2814837, 3.91918, 1, 0, 0, 1, 1,
1.128048, -0.06210922, 2.116924, 0, 0, 0, 1, 1,
1.142877, -0.4213449, 2.749822, 0, 0, 0, 1, 1,
1.14352, -0.6933395, 2.574739, 0, 0, 0, 1, 1,
1.143848, -0.6472154, 3.341089, 0, 0, 0, 1, 1,
1.144432, -0.8560115, 3.07062, 0, 0, 0, 1, 1,
1.146743, -0.2703229, 1.414706, 0, 0, 0, 1, 1,
1.153925, 0.8731552, 0.415419, 0, 0, 0, 1, 1,
1.1566, 0.9016802, 0.9170985, 1, 1, 1, 1, 1,
1.158347, -0.8980122, 1.521868, 1, 1, 1, 1, 1,
1.161649, 0.3841261, 3.886731, 1, 1, 1, 1, 1,
1.16253, -0.6519799, 1.983644, 1, 1, 1, 1, 1,
1.163589, -1.747642, 2.108194, 1, 1, 1, 1, 1,
1.164459, -0.4099863, 2.681315, 1, 1, 1, 1, 1,
1.167687, 1.455204, 1.212004, 1, 1, 1, 1, 1,
1.179054, 0.6291206, 0.9988141, 1, 1, 1, 1, 1,
1.18351, -0.1739758, 2.51854, 1, 1, 1, 1, 1,
1.184586, 1.531371, 0.7704076, 1, 1, 1, 1, 1,
1.201108, -0.1974337, 2.24528, 1, 1, 1, 1, 1,
1.209486, -0.643581, 1.673965, 1, 1, 1, 1, 1,
1.214684, 0.6571417, 2.742107, 1, 1, 1, 1, 1,
1.221666, 0.3488906, 2.371993, 1, 1, 1, 1, 1,
1.224402, 0.1806908, 0.09853666, 1, 1, 1, 1, 1,
1.228045, -0.9185597, 1.642416, 0, 0, 1, 1, 1,
1.229118, 0.08206728, 0.7091656, 1, 0, 0, 1, 1,
1.24571, 0.02352824, 2.952136, 1, 0, 0, 1, 1,
1.246045, 2.189258, -0.8680838, 1, 0, 0, 1, 1,
1.249906, 2.081955, -0.1475475, 1, 0, 0, 1, 1,
1.253684, 0.4313591, 0.1282743, 1, 0, 0, 1, 1,
1.257986, 1.419056, -1.058095, 0, 0, 0, 1, 1,
1.260936, 0.497234, 2.253011, 0, 0, 0, 1, 1,
1.261149, -1.954197, 3.611002, 0, 0, 0, 1, 1,
1.265366, 1.397431, 2.375796, 0, 0, 0, 1, 1,
1.267267, -1.227427, 1.757442, 0, 0, 0, 1, 1,
1.27956, 1.10201, 2.393555, 0, 0, 0, 1, 1,
1.284773, -1.027065, 0.4314865, 0, 0, 0, 1, 1,
1.292979, 0.6532776, 0.9006383, 1, 1, 1, 1, 1,
1.301818, -0.5557886, 1.828289, 1, 1, 1, 1, 1,
1.311009, 0.8141793, 1.281741, 1, 1, 1, 1, 1,
1.314297, -0.8678659, 2.982215, 1, 1, 1, 1, 1,
1.315244, -0.1603981, 1.80999, 1, 1, 1, 1, 1,
1.319113, -0.7455344, 0.6886751, 1, 1, 1, 1, 1,
1.332125, -1.602458, 2.512284, 1, 1, 1, 1, 1,
1.356979, 0.5018345, 3.09307, 1, 1, 1, 1, 1,
1.362894, -0.3163683, 1.275961, 1, 1, 1, 1, 1,
1.363299, -1.057902, 2.682189, 1, 1, 1, 1, 1,
1.363323, 0.8633093, 2.24291, 1, 1, 1, 1, 1,
1.397243, -0.7779152, 3.479195, 1, 1, 1, 1, 1,
1.398435, 0.5420622, -1.053853, 1, 1, 1, 1, 1,
1.399155, -0.2957261, 0.3039958, 1, 1, 1, 1, 1,
1.399301, -2.833601, 3.237945, 1, 1, 1, 1, 1,
1.40176, -0.7830165, 1.400463, 0, 0, 1, 1, 1,
1.405408, -1.081111, 2.89377, 1, 0, 0, 1, 1,
1.414452, 0.3223929, 1.524151, 1, 0, 0, 1, 1,
1.414711, -0.09147777, 2.776999, 1, 0, 0, 1, 1,
1.415307, 1.931194, 0.5892541, 1, 0, 0, 1, 1,
1.429346, -0.9015726, 2.356284, 1, 0, 0, 1, 1,
1.432958, 0.3539088, 0.6028022, 0, 0, 0, 1, 1,
1.439615, -2.181294, 2.332531, 0, 0, 0, 1, 1,
1.444365, -0.1408386, 0.6474603, 0, 0, 0, 1, 1,
1.445185, -0.1780256, 1.869706, 0, 0, 0, 1, 1,
1.445585, -0.7037098, 3.593822, 0, 0, 0, 1, 1,
1.446841, -0.1990918, 1.477899, 0, 0, 0, 1, 1,
1.450451, 1.469465, 0.5420693, 0, 0, 0, 1, 1,
1.455715, -0.563591, 5.430622, 1, 1, 1, 1, 1,
1.498225, -0.1072786, 1.424514, 1, 1, 1, 1, 1,
1.505919, 0.284463, 2.145666, 1, 1, 1, 1, 1,
1.508388, 0.2714639, 1.497743, 1, 1, 1, 1, 1,
1.509594, -0.9937098, 3.159693, 1, 1, 1, 1, 1,
1.509791, -0.5525184, 1.581547, 1, 1, 1, 1, 1,
1.518971, 1.486605, 0.2737899, 1, 1, 1, 1, 1,
1.519798, 0.5600142, 0.7545475, 1, 1, 1, 1, 1,
1.520988, 0.5157357, 0.8733937, 1, 1, 1, 1, 1,
1.539742, 0.1859392, 2.131048, 1, 1, 1, 1, 1,
1.550058, -0.734625, 3.118978, 1, 1, 1, 1, 1,
1.563714, 0.06123478, 0.7299469, 1, 1, 1, 1, 1,
1.567915, 0.1185383, 1.263716, 1, 1, 1, 1, 1,
1.570392, 1.377115, -0.9572532, 1, 1, 1, 1, 1,
1.574716, -0.09745065, 1.942783, 1, 1, 1, 1, 1,
1.575063, 1.515989, 1.366788, 0, 0, 1, 1, 1,
1.58558, 0.5716643, 0.6212252, 1, 0, 0, 1, 1,
1.596014, -0.02837403, 3.7438, 1, 0, 0, 1, 1,
1.613629, 0.1339232, 1.209282, 1, 0, 0, 1, 1,
1.650364, -0.1440107, 0.7340667, 1, 0, 0, 1, 1,
1.650587, 0.8132343, 1.030762, 1, 0, 0, 1, 1,
1.653655, -1.144453, 1.720799, 0, 0, 0, 1, 1,
1.658108, 0.2907836, 0.5361746, 0, 0, 0, 1, 1,
1.664853, -1.384669, 2.280314, 0, 0, 0, 1, 1,
1.666795, 0.01060163, 3.607904, 0, 0, 0, 1, 1,
1.667805, 0.6414444, 0.07335699, 0, 0, 0, 1, 1,
1.671439, -1.295987, 1.125182, 0, 0, 0, 1, 1,
1.689612, 0.7399889, -1.644192, 0, 0, 0, 1, 1,
1.690524, -0.2721645, 2.273721, 1, 1, 1, 1, 1,
1.705333, -0.2382102, 0.695011, 1, 1, 1, 1, 1,
1.713049, 0.9047585, 1.615047, 1, 1, 1, 1, 1,
1.717089, -0.2746308, 1.371583, 1, 1, 1, 1, 1,
1.734195, 0.2772363, 2.096237, 1, 1, 1, 1, 1,
1.785259, -0.2665997, 1.262028, 1, 1, 1, 1, 1,
1.785692, -0.07194038, 1.480631, 1, 1, 1, 1, 1,
1.789041, 0.8280042, 1.076678, 1, 1, 1, 1, 1,
1.81025, 0.9444991, 2.016737, 1, 1, 1, 1, 1,
1.814539, -0.3374442, 0.5775332, 1, 1, 1, 1, 1,
1.823142, 1.110603, 0.4161456, 1, 1, 1, 1, 1,
1.829303, -1.76466, 0.9766729, 1, 1, 1, 1, 1,
1.834859, -0.5266454, 0.4659618, 1, 1, 1, 1, 1,
1.836813, -0.5586051, 2.951011, 1, 1, 1, 1, 1,
1.871162, 0.9249713, -0.07400963, 1, 1, 1, 1, 1,
1.884504, 0.5655958, 0.7714913, 0, 0, 1, 1, 1,
1.908174, -1.247462, 2.333284, 1, 0, 0, 1, 1,
1.931924, 1.182181, 2.000903, 1, 0, 0, 1, 1,
1.953388, 0.1156739, 1.551634, 1, 0, 0, 1, 1,
2.01143, 1.710967, 1.91794, 1, 0, 0, 1, 1,
2.03308, 0.1177652, 1.344546, 1, 0, 0, 1, 1,
2.040783, 0.6356141, 1.474872, 0, 0, 0, 1, 1,
2.066536, -0.5533581, 0.9595353, 0, 0, 0, 1, 1,
2.169023, -0.1215062, 2.105162, 0, 0, 0, 1, 1,
2.218519, 1.311875, -0.6519728, 0, 0, 0, 1, 1,
2.222352, -0.2520446, 2.83311, 0, 0, 0, 1, 1,
2.233526, -1.197562, 1.19921, 0, 0, 0, 1, 1,
2.240428, -1.912564, 0.3269773, 0, 0, 0, 1, 1,
2.25034, -0.5858997, 3.585628, 1, 1, 1, 1, 1,
2.255977, -0.2877114, 2.218492, 1, 1, 1, 1, 1,
2.304971, 2.378186, 1.036175, 1, 1, 1, 1, 1,
2.339129, 0.7425641, 0.3960785, 1, 1, 1, 1, 1,
2.508876, -0.6032352, 1.597856, 1, 1, 1, 1, 1,
2.51498, -0.4516568, 2.84711, 1, 1, 1, 1, 1,
2.867319, -0.3714655, 1.696981, 1, 1, 1, 1, 1
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
var radius = 9.26983;
var distance = 32.55988;
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
mvMatrix.translate( -0.0309006, 0.3432406, -0.234549 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.55988);
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