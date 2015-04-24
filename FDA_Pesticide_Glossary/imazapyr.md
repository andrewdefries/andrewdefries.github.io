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
-3.364671, -1.196017, -2.616114, 1, 0, 0, 1,
-2.992465, -0.3464606, -2.763196, 1, 0.007843138, 0, 1,
-2.949708, -0.6230034, -0.3804554, 1, 0.01176471, 0, 1,
-2.701144, -0.7930362, -1.861999, 1, 0.01960784, 0, 1,
-2.646136, 0.3370782, -0.5511624, 1, 0.02352941, 0, 1,
-2.632497, 1.571222, -0.8005406, 1, 0.03137255, 0, 1,
-2.609525, -0.2825989, -1.933025, 1, 0.03529412, 0, 1,
-2.5139, -1.321219, -1.563742, 1, 0.04313726, 0, 1,
-2.449435, -2.100223, -1.667272, 1, 0.04705882, 0, 1,
-2.449162, -0.5605417, -1.718818, 1, 0.05490196, 0, 1,
-2.428266, -0.3125571, -1.996478, 1, 0.05882353, 0, 1,
-2.333351, 1.258827, -0.1310142, 1, 0.06666667, 0, 1,
-2.318114, 0.5426211, -1.28217, 1, 0.07058824, 0, 1,
-2.314906, 0.2177348, 0.3080218, 1, 0.07843138, 0, 1,
-2.270539, 0.06879451, -1.502869, 1, 0.08235294, 0, 1,
-2.263683, -0.4684609, -0.9678453, 1, 0.09019608, 0, 1,
-2.194702, -0.2353591, -1.627243, 1, 0.09411765, 0, 1,
-2.158371, -0.9786992, -2.554594, 1, 0.1019608, 0, 1,
-2.116701, 0.4569227, -0.8901504, 1, 0.1098039, 0, 1,
-2.083889, -0.077989, -0.8006315, 1, 0.1137255, 0, 1,
-2.082031, 0.2943736, -1.337049, 1, 0.1215686, 0, 1,
-2.070632, -1.138066, -1.925838, 1, 0.1254902, 0, 1,
-2.038181, 1.263397, -0.5312096, 1, 0.1333333, 0, 1,
-2.013126, -0.7850004, -1.277161, 1, 0.1372549, 0, 1,
-1.984507, -1.269001, -1.050051, 1, 0.145098, 0, 1,
-1.94375, 0.1964668, -1.13398, 1, 0.1490196, 0, 1,
-1.942544, 1.73423, -1.667953, 1, 0.1568628, 0, 1,
-1.936703, -0.0143741, -0.5533664, 1, 0.1607843, 0, 1,
-1.917665, 0.9094751, -1.371213, 1, 0.1686275, 0, 1,
-1.917052, -1.048158, -2.420281, 1, 0.172549, 0, 1,
-1.899743, 0.365033, -0.471805, 1, 0.1803922, 0, 1,
-1.898408, -0.16222, -0.9357762, 1, 0.1843137, 0, 1,
-1.893765, 1.236436, -0.8236806, 1, 0.1921569, 0, 1,
-1.878756, 0.9838713, -1.726218, 1, 0.1960784, 0, 1,
-1.877411, 0.1043926, -2.03295, 1, 0.2039216, 0, 1,
-1.871395, -0.7616149, -0.8029678, 1, 0.2117647, 0, 1,
-1.839543, -0.6340878, -0.8967687, 1, 0.2156863, 0, 1,
-1.825483, 2.319073, -1.395849, 1, 0.2235294, 0, 1,
-1.793122, 0.6988467, -0.08886079, 1, 0.227451, 0, 1,
-1.767554, 1.084002, -2.950108, 1, 0.2352941, 0, 1,
-1.760237, -1.28656, -1.880507, 1, 0.2392157, 0, 1,
-1.736086, -0.9508396, -2.938546, 1, 0.2470588, 0, 1,
-1.735076, 0.4333696, -0.2725111, 1, 0.2509804, 0, 1,
-1.733024, -1.213295, -2.949295, 1, 0.2588235, 0, 1,
-1.72262, -2.184745, -2.767888, 1, 0.2627451, 0, 1,
-1.718571, -0.1672034, -2.628978, 1, 0.2705882, 0, 1,
-1.688735, 0.7266223, -2.649048, 1, 0.2745098, 0, 1,
-1.68451, 0.06639429, -0.5267327, 1, 0.282353, 0, 1,
-1.682357, -1.739537, -3.026765, 1, 0.2862745, 0, 1,
-1.681022, -0.5977958, -3.444938, 1, 0.2941177, 0, 1,
-1.66929, 0.8140768, -0.8720174, 1, 0.3019608, 0, 1,
-1.661578, -0.06502499, -2.296102, 1, 0.3058824, 0, 1,
-1.658489, -0.06467824, -2.46435, 1, 0.3137255, 0, 1,
-1.642931, 0.109811, -1.668523, 1, 0.3176471, 0, 1,
-1.641517, -0.3345395, -1.475259, 1, 0.3254902, 0, 1,
-1.591483, -0.4916459, -0.6241476, 1, 0.3294118, 0, 1,
-1.586359, 0.3809437, 0.1128003, 1, 0.3372549, 0, 1,
-1.583943, -0.6691538, -0.8595775, 1, 0.3411765, 0, 1,
-1.580727, -0.888453, -1.18633, 1, 0.3490196, 0, 1,
-1.578327, -0.9999079, -3.201883, 1, 0.3529412, 0, 1,
-1.577026, 0.8345982, 0.02256362, 1, 0.3607843, 0, 1,
-1.571574, 0.1216487, -2.467701, 1, 0.3647059, 0, 1,
-1.567299, 0.03673337, -1.351138, 1, 0.372549, 0, 1,
-1.552478, -0.7635906, -4.287989, 1, 0.3764706, 0, 1,
-1.548005, -1.560674, -1.183858, 1, 0.3843137, 0, 1,
-1.547061, 0.05181617, -1.019878, 1, 0.3882353, 0, 1,
-1.544479, 0.1982019, -1.954681, 1, 0.3960784, 0, 1,
-1.532897, -2.936716, -2.375892, 1, 0.4039216, 0, 1,
-1.525229, -1.11541, -2.272959, 1, 0.4078431, 0, 1,
-1.513493, -1.412702, -1.893575, 1, 0.4156863, 0, 1,
-1.508181, 1.12461, -1.837255, 1, 0.4196078, 0, 1,
-1.508008, 0.2103744, -2.678141, 1, 0.427451, 0, 1,
-1.497862, -1.256006, -0.4122056, 1, 0.4313726, 0, 1,
-1.479172, 1.122153, -1.321748, 1, 0.4392157, 0, 1,
-1.470298, 1.188721, -1.761746, 1, 0.4431373, 0, 1,
-1.461176, -1.895223, -3.099814, 1, 0.4509804, 0, 1,
-1.456579, 0.7142797, -1.608278, 1, 0.454902, 0, 1,
-1.456328, -1.15057, -1.867014, 1, 0.4627451, 0, 1,
-1.437599, 0.06426596, -1.424808, 1, 0.4666667, 0, 1,
-1.431209, -1.527336, -2.089375, 1, 0.4745098, 0, 1,
-1.430364, 0.2284125, -1.639823, 1, 0.4784314, 0, 1,
-1.419935, 0.1743935, -2.004586, 1, 0.4862745, 0, 1,
-1.418086, -1.468153, -2.329003, 1, 0.4901961, 0, 1,
-1.402064, 0.301704, -2.131492, 1, 0.4980392, 0, 1,
-1.398991, 0.6456715, -1.429763, 1, 0.5058824, 0, 1,
-1.396566, 0.5596138, -0.2090743, 1, 0.509804, 0, 1,
-1.394015, -0.2269256, -0.1054248, 1, 0.5176471, 0, 1,
-1.391298, -0.4603364, -3.096398, 1, 0.5215687, 0, 1,
-1.389156, 0.3552432, -2.138502, 1, 0.5294118, 0, 1,
-1.373615, 0.4996936, -0.8077305, 1, 0.5333334, 0, 1,
-1.362963, -1.437916, -2.027225, 1, 0.5411765, 0, 1,
-1.358044, 0.3565207, -2.168843, 1, 0.5450981, 0, 1,
-1.35161, -0.1394553, -2.031087, 1, 0.5529412, 0, 1,
-1.347972, -2.036432, -2.073803, 1, 0.5568628, 0, 1,
-1.322498, -0.7497489, -1.042327, 1, 0.5647059, 0, 1,
-1.28436, -0.3140842, -1.409371, 1, 0.5686275, 0, 1,
-1.283951, -0.3477236, -2.182478, 1, 0.5764706, 0, 1,
-1.282936, -0.6200976, -1.33542, 1, 0.5803922, 0, 1,
-1.271832, -0.3030996, -1.687653, 1, 0.5882353, 0, 1,
-1.26628, 1.081171, -1.605242, 1, 0.5921569, 0, 1,
-1.265133, -0.3183881, 0.1984993, 1, 0.6, 0, 1,
-1.260675, -0.003156881, -0.3510486, 1, 0.6078432, 0, 1,
-1.248878, -0.2116418, -1.38082, 1, 0.6117647, 0, 1,
-1.240936, 0.02334309, -1.303566, 1, 0.6196079, 0, 1,
-1.239349, 1.069664, -2.156348, 1, 0.6235294, 0, 1,
-1.225602, -0.02143408, -2.343254, 1, 0.6313726, 0, 1,
-1.225217, -1.203337, -1.554415, 1, 0.6352941, 0, 1,
-1.221654, 0.5518475, -1.138654, 1, 0.6431373, 0, 1,
-1.211003, 1.382609, -0.4505104, 1, 0.6470588, 0, 1,
-1.204546, -1.643525, -1.982836, 1, 0.654902, 0, 1,
-1.203839, -1.334558, -0.393053, 1, 0.6588235, 0, 1,
-1.199642, -0.9092451, -3.059183, 1, 0.6666667, 0, 1,
-1.199515, -1.644683, -2.085643, 1, 0.6705883, 0, 1,
-1.197955, -0.4902819, -2.416116, 1, 0.6784314, 0, 1,
-1.192823, 0.8576193, -1.379872, 1, 0.682353, 0, 1,
-1.182957, -0.03840224, -1.303774, 1, 0.6901961, 0, 1,
-1.164238, 1.733983, -0.2961833, 1, 0.6941177, 0, 1,
-1.153337, 2.408536, -0.6033551, 1, 0.7019608, 0, 1,
-1.147161, 1.064584, -1.369153, 1, 0.7098039, 0, 1,
-1.144089, -0.0406115, -3.489381, 1, 0.7137255, 0, 1,
-1.131012, -0.477396, -2.212013, 1, 0.7215686, 0, 1,
-1.127172, 0.9096759, -2.925246, 1, 0.7254902, 0, 1,
-1.120686, 0.6542441, -1.268742, 1, 0.7333333, 0, 1,
-1.111888, -1.56036, -0.6373252, 1, 0.7372549, 0, 1,
-1.111721, -0.5518631, -1.108149, 1, 0.7450981, 0, 1,
-1.111617, -0.2834913, -2.66768, 1, 0.7490196, 0, 1,
-1.103742, -0.576099, -0.7445517, 1, 0.7568628, 0, 1,
-1.093335, -0.261317, -2.096311, 1, 0.7607843, 0, 1,
-1.088507, 0.2756259, -2.4156, 1, 0.7686275, 0, 1,
-1.0841, -0.06028883, -2.424362, 1, 0.772549, 0, 1,
-1.081031, -0.7182663, -2.923063, 1, 0.7803922, 0, 1,
-1.079615, 0.4993814, -0.07597721, 1, 0.7843137, 0, 1,
-1.076163, 1.376495, 0.3689212, 1, 0.7921569, 0, 1,
-1.073342, 0.6234285, -1.319621, 1, 0.7960784, 0, 1,
-1.060401, -0.8654519, -4.10179, 1, 0.8039216, 0, 1,
-1.056983, 0.2310759, -1.615242, 1, 0.8117647, 0, 1,
-1.050709, -0.0433131, -3.379983, 1, 0.8156863, 0, 1,
-1.05053, 0.5459071, 0.3913405, 1, 0.8235294, 0, 1,
-1.04583, 0.8894507, 0.6952325, 1, 0.827451, 0, 1,
-1.04496, 2.336981, -0.02584258, 1, 0.8352941, 0, 1,
-1.042552, -2.110695, -2.516825, 1, 0.8392157, 0, 1,
-1.037748, -3.323414, -2.304191, 1, 0.8470588, 0, 1,
-1.034965, -0.08345938, -0.5191983, 1, 0.8509804, 0, 1,
-1.02641, 0.6176497, -1.118637, 1, 0.8588235, 0, 1,
-1.02231, 0.4321705, -2.461198, 1, 0.8627451, 0, 1,
-1.021826, 0.3666558, -2.723701, 1, 0.8705882, 0, 1,
-1.019508, -0.4916163, -2.799885, 1, 0.8745098, 0, 1,
-1.018128, 2.232058, 0.9301152, 1, 0.8823529, 0, 1,
-1.017231, -0.3847815, -0.5704563, 1, 0.8862745, 0, 1,
-1.017064, -0.08168699, -1.228472, 1, 0.8941177, 0, 1,
-1.010753, 0.997244, -2.131493, 1, 0.8980392, 0, 1,
-1.009376, -1.008386, -3.753791, 1, 0.9058824, 0, 1,
-1.008456, -1.547841, -3.52924, 1, 0.9137255, 0, 1,
-1.005654, -0.9839688, -1.315049, 1, 0.9176471, 0, 1,
-1.00494, -0.6862348, -2.421805, 1, 0.9254902, 0, 1,
-1.001018, 0.8926191, -1.072798, 1, 0.9294118, 0, 1,
-0.9984673, -1.919927, -4.012698, 1, 0.9372549, 0, 1,
-0.9948504, 0.8201378, -0.1050951, 1, 0.9411765, 0, 1,
-0.9915488, -1.556386, -2.577976, 1, 0.9490196, 0, 1,
-0.9894212, 0.5587664, -0.9117367, 1, 0.9529412, 0, 1,
-0.9861352, 0.09828317, -1.464705, 1, 0.9607843, 0, 1,
-0.9846458, 0.9857455, 1.031367, 1, 0.9647059, 0, 1,
-0.9793425, 0.3102876, -2.68576, 1, 0.972549, 0, 1,
-0.9777507, -0.01447479, -0.7346756, 1, 0.9764706, 0, 1,
-0.9759761, -0.3998004, -1.087286, 1, 0.9843137, 0, 1,
-0.9732937, -0.2617449, -3.759818, 1, 0.9882353, 0, 1,
-0.9709346, 1.384297, -1.138196, 1, 0.9960784, 0, 1,
-0.9667273, 0.6806365, -0.2350345, 0.9960784, 1, 0, 1,
-0.9619005, 0.473978, -1.31296, 0.9921569, 1, 0, 1,
-0.9575249, -1.288329, -3.026038, 0.9843137, 1, 0, 1,
-0.9491112, -0.7785693, -1.794658, 0.9803922, 1, 0, 1,
-0.9467053, 1.352938, 0.6858701, 0.972549, 1, 0, 1,
-0.9419351, -1.057961, -2.593919, 0.9686275, 1, 0, 1,
-0.9417132, -1.276347, -1.001872, 0.9607843, 1, 0, 1,
-0.9416811, -1.427888, -2.410429, 0.9568627, 1, 0, 1,
-0.9350846, -0.6315792, -1.457235, 0.9490196, 1, 0, 1,
-0.9347867, 0.8948937, -0.3703774, 0.945098, 1, 0, 1,
-0.9240188, -0.3142923, -1.081603, 0.9372549, 1, 0, 1,
-0.9202915, 0.3441826, -2.039301, 0.9333333, 1, 0, 1,
-0.9157236, 0.7718127, -0.7619054, 0.9254902, 1, 0, 1,
-0.9129431, 0.2235621, -2.957066, 0.9215686, 1, 0, 1,
-0.8991784, -3.394951, -2.076089, 0.9137255, 1, 0, 1,
-0.8890192, -2.42466, -3.6, 0.9098039, 1, 0, 1,
-0.8877689, 0.6953175, -1.185363, 0.9019608, 1, 0, 1,
-0.8838477, 0.2387932, -2.1896, 0.8941177, 1, 0, 1,
-0.8778369, -0.1938559, -3.28304, 0.8901961, 1, 0, 1,
-0.8761065, -0.2384774, -1.210569, 0.8823529, 1, 0, 1,
-0.8748818, 0.1394492, -1.222476, 0.8784314, 1, 0, 1,
-0.8690554, -0.2834645, -1.705509, 0.8705882, 1, 0, 1,
-0.8685702, 1.023092, -1.040162, 0.8666667, 1, 0, 1,
-0.8681263, 1.269307, -1.36669, 0.8588235, 1, 0, 1,
-0.8665356, 1.392817, -1.69699, 0.854902, 1, 0, 1,
-0.8519714, 0.2857316, -2.117779, 0.8470588, 1, 0, 1,
-0.8487213, -1.156653, -2.243276, 0.8431373, 1, 0, 1,
-0.8481009, -0.683975, -4.707846, 0.8352941, 1, 0, 1,
-0.8450733, 1.156003, -0.6603757, 0.8313726, 1, 0, 1,
-0.8394576, -0.01607661, -1.701206, 0.8235294, 1, 0, 1,
-0.8370994, -0.2214937, -1.59232, 0.8196079, 1, 0, 1,
-0.8365034, -1.982719, -3.069433, 0.8117647, 1, 0, 1,
-0.8326327, -0.7714071, -2.373017, 0.8078431, 1, 0, 1,
-0.8297611, -1.048442, -2.831485, 0.8, 1, 0, 1,
-0.8252299, 0.2499269, -0.8681424, 0.7921569, 1, 0, 1,
-0.8247585, -0.9390044, -2.703146, 0.7882353, 1, 0, 1,
-0.8231064, 0.03578263, -1.832817, 0.7803922, 1, 0, 1,
-0.8222022, 1.063681, -1.750393, 0.7764706, 1, 0, 1,
-0.8215486, 1.388792, 0.3786305, 0.7686275, 1, 0, 1,
-0.8170776, -0.520888, -2.671451, 0.7647059, 1, 0, 1,
-0.8052922, 0.2987329, -2.147657, 0.7568628, 1, 0, 1,
-0.8028084, -1.768243, -1.593136, 0.7529412, 1, 0, 1,
-0.7966021, 0.9357449, -0.06808767, 0.7450981, 1, 0, 1,
-0.7921262, 1.455431, -1.668476, 0.7411765, 1, 0, 1,
-0.791934, 0.1798839, -2.626763, 0.7333333, 1, 0, 1,
-0.7902992, -1.165196, -4.036514, 0.7294118, 1, 0, 1,
-0.7900318, -0.1879709, -2.310095, 0.7215686, 1, 0, 1,
-0.7858801, -0.9038556, -2.049345, 0.7176471, 1, 0, 1,
-0.7841996, 0.1747556, 0.05084065, 0.7098039, 1, 0, 1,
-0.7778751, 0.4382603, -0.4156486, 0.7058824, 1, 0, 1,
-0.777873, 0.3454207, -1.842346, 0.6980392, 1, 0, 1,
-0.7751774, 1.31053, -0.7899832, 0.6901961, 1, 0, 1,
-0.7722706, -1.492806, -1.360277, 0.6862745, 1, 0, 1,
-0.771677, 0.5577196, -1.313739, 0.6784314, 1, 0, 1,
-0.771131, 0.040006, -1.127455, 0.6745098, 1, 0, 1,
-0.7696694, 0.5300093, -0.1677483, 0.6666667, 1, 0, 1,
-0.7682541, -0.333493, -1.143519, 0.6627451, 1, 0, 1,
-0.763945, 0.8337755, 1.782772, 0.654902, 1, 0, 1,
-0.7633961, 1.713556, -0.4676924, 0.6509804, 1, 0, 1,
-0.7609012, -0.8084688, -1.039284, 0.6431373, 1, 0, 1,
-0.7579788, -0.3203002, -0.09931055, 0.6392157, 1, 0, 1,
-0.756631, 0.06173277, -1.745326, 0.6313726, 1, 0, 1,
-0.7553504, -1.576307, -3.469716, 0.627451, 1, 0, 1,
-0.746771, -0.1492297, -1.879568, 0.6196079, 1, 0, 1,
-0.746499, 0.5513831, -2.165073, 0.6156863, 1, 0, 1,
-0.7447112, -0.3026301, -1.79208, 0.6078432, 1, 0, 1,
-0.7382221, -1.823635, -2.87607, 0.6039216, 1, 0, 1,
-0.734223, 1.395985, -1.8573, 0.5960785, 1, 0, 1,
-0.7309446, 0.7361457, 1.102667, 0.5882353, 1, 0, 1,
-0.7302496, -1.83855, -1.57441, 0.5843138, 1, 0, 1,
-0.7270041, 0.5404753, -1.761964, 0.5764706, 1, 0, 1,
-0.7266941, 0.02064441, -3.000489, 0.572549, 1, 0, 1,
-0.7250723, 0.139516, -1.802101, 0.5647059, 1, 0, 1,
-0.7133968, -0.4570347, -3.609371, 0.5607843, 1, 0, 1,
-0.7111911, -0.4027046, -2.179088, 0.5529412, 1, 0, 1,
-0.7100456, -1.42237, -1.57974, 0.5490196, 1, 0, 1,
-0.7098401, -0.4786137, -1.052669, 0.5411765, 1, 0, 1,
-0.7095439, -2.431335, -4.991817, 0.5372549, 1, 0, 1,
-0.7081704, -0.4467334, -2.408083, 0.5294118, 1, 0, 1,
-0.7073134, -0.9045429, -2.671566, 0.5254902, 1, 0, 1,
-0.7071342, 1.092741, -0.8769239, 0.5176471, 1, 0, 1,
-0.7026331, 0.9718389, -2.004482, 0.5137255, 1, 0, 1,
-0.6937529, 2.121912, -0.5590796, 0.5058824, 1, 0, 1,
-0.6919191, 0.5234951, -2.477177, 0.5019608, 1, 0, 1,
-0.6898816, -0.2988533, -3.098972, 0.4941176, 1, 0, 1,
-0.6888023, -1.280835, -2.145431, 0.4862745, 1, 0, 1,
-0.6843745, 0.2258298, -0.1899341, 0.4823529, 1, 0, 1,
-0.6839821, -1.017823, -1.859921, 0.4745098, 1, 0, 1,
-0.6819762, 1.640285, -0.3204577, 0.4705882, 1, 0, 1,
-0.6815651, -1.740189, -2.257477, 0.4627451, 1, 0, 1,
-0.6806399, 1.223613, -2.693524, 0.4588235, 1, 0, 1,
-0.6774575, 0.492383, -1.835498, 0.4509804, 1, 0, 1,
-0.676717, 1.005279, -2.737954, 0.4470588, 1, 0, 1,
-0.6737722, -0.6213005, -2.302465, 0.4392157, 1, 0, 1,
-0.6675535, 0.07014132, -2.089882, 0.4352941, 1, 0, 1,
-0.6671425, -0.5282946, -3.073894, 0.427451, 1, 0, 1,
-0.6648112, -1.375831, -3.488932, 0.4235294, 1, 0, 1,
-0.6642893, -0.03754945, -2.337705, 0.4156863, 1, 0, 1,
-0.6638679, -2.101237, -1.874389, 0.4117647, 1, 0, 1,
-0.6619168, -0.739177, -3.16541, 0.4039216, 1, 0, 1,
-0.6484711, 0.2198314, 0.1664848, 0.3960784, 1, 0, 1,
-0.6431033, -0.4189096, -3.134989, 0.3921569, 1, 0, 1,
-0.6332765, -1.11562, -1.161701, 0.3843137, 1, 0, 1,
-0.6296414, -1.603593, -2.428031, 0.3803922, 1, 0, 1,
-0.6293943, 0.6893259, -0.105555, 0.372549, 1, 0, 1,
-0.6293907, 0.2643408, -0.8647603, 0.3686275, 1, 0, 1,
-0.6286414, -1.015976, -2.928394, 0.3607843, 1, 0, 1,
-0.6260492, 0.2236797, -0.3008475, 0.3568628, 1, 0, 1,
-0.6258386, -0.1320677, -1.544884, 0.3490196, 1, 0, 1,
-0.6247995, 0.3077164, 0.04663367, 0.345098, 1, 0, 1,
-0.6238722, 0.03577958, -1.290669, 0.3372549, 1, 0, 1,
-0.6222752, -0.3455817, -0.4880567, 0.3333333, 1, 0, 1,
-0.6207402, 1.469116, 0.184246, 0.3254902, 1, 0, 1,
-0.6197912, 0.5408459, 2.014115, 0.3215686, 1, 0, 1,
-0.6183552, 1.030064, -1.609962, 0.3137255, 1, 0, 1,
-0.6086418, 0.6717923, -0.4781918, 0.3098039, 1, 0, 1,
-0.6057255, 0.6445682, 0.3220597, 0.3019608, 1, 0, 1,
-0.6037246, -1.091075, -3.399381, 0.2941177, 1, 0, 1,
-0.6004678, 1.959696, 0.1704618, 0.2901961, 1, 0, 1,
-0.6004365, 0.9082208, -1.038896, 0.282353, 1, 0, 1,
-0.5984555, -1.503511, -3.487036, 0.2784314, 1, 0, 1,
-0.5964187, -0.7719944, -3.687405, 0.2705882, 1, 0, 1,
-0.5840712, -0.468049, -1.732133, 0.2666667, 1, 0, 1,
-0.5788987, 1.267303, -1.46992, 0.2588235, 1, 0, 1,
-0.5690147, 0.4809209, -0.2098385, 0.254902, 1, 0, 1,
-0.5688959, 0.3441004, -1.32726, 0.2470588, 1, 0, 1,
-0.5685206, 1.044623, -0.6632925, 0.2431373, 1, 0, 1,
-0.5683603, -1.874097, -1.825962, 0.2352941, 1, 0, 1,
-0.5588949, -0.434598, -3.587292, 0.2313726, 1, 0, 1,
-0.5578857, 0.3239625, -0.6555665, 0.2235294, 1, 0, 1,
-0.5575696, 0.1418213, -0.3767934, 0.2196078, 1, 0, 1,
-0.5573151, -0.6186661, -2.701909, 0.2117647, 1, 0, 1,
-0.5553029, 1.394357, 0.6069704, 0.2078431, 1, 0, 1,
-0.5497031, -0.08824889, -1.376899, 0.2, 1, 0, 1,
-0.5487701, 0.5239427, -0.6925874, 0.1921569, 1, 0, 1,
-0.5486251, -1.857589, -1.60286, 0.1882353, 1, 0, 1,
-0.5442664, 1.372119, -2.216164, 0.1803922, 1, 0, 1,
-0.5349477, 0.1861714, -0.4300597, 0.1764706, 1, 0, 1,
-0.5334581, -1.449918, -3.294052, 0.1686275, 1, 0, 1,
-0.5296522, 1.148205, -1.144235, 0.1647059, 1, 0, 1,
-0.5273709, -1.304791, -3.237825, 0.1568628, 1, 0, 1,
-0.5259683, 0.923634, -2.642819, 0.1529412, 1, 0, 1,
-0.5247438, -1.703508, -3.939444, 0.145098, 1, 0, 1,
-0.5233854, 0.4481469, -0.4254233, 0.1411765, 1, 0, 1,
-0.5048496, 0.7377906, -3.125385, 0.1333333, 1, 0, 1,
-0.4901451, -1.067133, -2.818317, 0.1294118, 1, 0, 1,
-0.4899984, 1.923866, 0.4833998, 0.1215686, 1, 0, 1,
-0.4864958, 0.5087846, -0.2914425, 0.1176471, 1, 0, 1,
-0.4864693, -0.8825367, -3.351009, 0.1098039, 1, 0, 1,
-0.4856956, -1.111456, -2.695267, 0.1058824, 1, 0, 1,
-0.4848888, -0.5640178, -2.126778, 0.09803922, 1, 0, 1,
-0.484605, 0.2506774, -0.4463804, 0.09019608, 1, 0, 1,
-0.4824097, -0.2273728, -1.892034, 0.08627451, 1, 0, 1,
-0.4806625, -1.377189, -2.816144, 0.07843138, 1, 0, 1,
-0.4795265, 0.4828591, 1.417202, 0.07450981, 1, 0, 1,
-0.4769981, -0.1423621, -1.955549, 0.06666667, 1, 0, 1,
-0.4766873, -0.9060035, -2.741088, 0.0627451, 1, 0, 1,
-0.4739141, -1.461645, -0.459526, 0.05490196, 1, 0, 1,
-0.4720024, 0.7800401, -1.620803, 0.05098039, 1, 0, 1,
-0.4698502, -0.7715372, -2.90647, 0.04313726, 1, 0, 1,
-0.4688282, 0.8620743, -1.117478, 0.03921569, 1, 0, 1,
-0.4664877, -0.2652359, -0.06329928, 0.03137255, 1, 0, 1,
-0.4656147, 0.5438011, -1.743079, 0.02745098, 1, 0, 1,
-0.4620988, -0.4587043, -3.821932, 0.01960784, 1, 0, 1,
-0.4555266, 1.107485, 0.809863, 0.01568628, 1, 0, 1,
-0.4518794, 1.663243, 0.6402237, 0.007843138, 1, 0, 1,
-0.4495524, 2.256094, -2.016699, 0.003921569, 1, 0, 1,
-0.4492422, 1.682138, -1.159383, 0, 1, 0.003921569, 1,
-0.4404491, 0.6608472, -1.583801, 0, 1, 0.01176471, 1,
-0.4214554, -1.850241, -1.278017, 0, 1, 0.01568628, 1,
-0.4153331, 1.478538, -2.19718, 0, 1, 0.02352941, 1,
-0.410891, -0.1340463, -1.919625, 0, 1, 0.02745098, 1,
-0.4080349, 0.7826383, -0.01017855, 0, 1, 0.03529412, 1,
-0.4069827, -0.7745416, -1.48913, 0, 1, 0.03921569, 1,
-0.4049462, -0.03865838, -1.738324, 0, 1, 0.04705882, 1,
-0.4005631, 1.590899, 1.431165, 0, 1, 0.05098039, 1,
-0.3982855, -0.3701718, -1.713585, 0, 1, 0.05882353, 1,
-0.3965198, -0.06297277, -0.4352583, 0, 1, 0.0627451, 1,
-0.3960185, -1.231139, -2.554145, 0, 1, 0.07058824, 1,
-0.3904918, -2.528748, -2.021747, 0, 1, 0.07450981, 1,
-0.3889432, -0.9468775, -2.252406, 0, 1, 0.08235294, 1,
-0.3849596, -0.1734569, -2.615007, 0, 1, 0.08627451, 1,
-0.3811446, -0.7486992, -4.093025, 0, 1, 0.09411765, 1,
-0.3794135, -0.0738039, -1.560497, 0, 1, 0.1019608, 1,
-0.3776135, 1.791345, -0.7687932, 0, 1, 0.1058824, 1,
-0.3772239, 1.075762, -0.3742124, 0, 1, 0.1137255, 1,
-0.3768301, -0.4757142, -2.539255, 0, 1, 0.1176471, 1,
-0.3751563, 0.3741862, -2.441572, 0, 1, 0.1254902, 1,
-0.3679613, 0.6192774, -0.7477194, 0, 1, 0.1294118, 1,
-0.3650776, 0.5681741, -0.1891719, 0, 1, 0.1372549, 1,
-0.3635096, -1.156611, -2.021273, 0, 1, 0.1411765, 1,
-0.3599154, -2.467377, -2.035494, 0, 1, 0.1490196, 1,
-0.3577715, 0.82621, -0.9091554, 0, 1, 0.1529412, 1,
-0.3551835, -0.5434242, -3.392184, 0, 1, 0.1607843, 1,
-0.3549761, 2.067396, 0.2828249, 0, 1, 0.1647059, 1,
-0.3537974, 0.8485793, 0.963621, 0, 1, 0.172549, 1,
-0.3483406, 0.01327509, -2.06499, 0, 1, 0.1764706, 1,
-0.346997, -0.5935172, -1.455554, 0, 1, 0.1843137, 1,
-0.3463735, 0.907688, -1.707916, 0, 1, 0.1882353, 1,
-0.3387367, -0.07099479, -2.299613, 0, 1, 0.1960784, 1,
-0.3375258, 2.094789, -1.269885, 0, 1, 0.2039216, 1,
-0.3365673, 0.5304157, 0.1019781, 0, 1, 0.2078431, 1,
-0.3322346, -0.4061773, -3.364973, 0, 1, 0.2156863, 1,
-0.332055, 1.27178, -3.000463, 0, 1, 0.2196078, 1,
-0.331015, -0.3220905, -3.00677, 0, 1, 0.227451, 1,
-0.3280516, -0.5740293, -0.9341598, 0, 1, 0.2313726, 1,
-0.3269218, 0.1783917, -1.915903, 0, 1, 0.2392157, 1,
-0.3199502, 0.9406157, 2.400707, 0, 1, 0.2431373, 1,
-0.3195451, -1.017672, -4.260048, 0, 1, 0.2509804, 1,
-0.3192261, 1.619787, -0.3187033, 0, 1, 0.254902, 1,
-0.3162037, 0.4217691, -2.020604, 0, 1, 0.2627451, 1,
-0.3117312, 1.656959, 0.3062799, 0, 1, 0.2666667, 1,
-0.3094396, -0.6792006, -3.323881, 0, 1, 0.2745098, 1,
-0.3091405, -0.5522704, -1.020146, 0, 1, 0.2784314, 1,
-0.3084683, -1.19353, -1.117305, 0, 1, 0.2862745, 1,
-0.308258, 2.386714, 0.8276497, 0, 1, 0.2901961, 1,
-0.3068983, 0.01203055, -3.280883, 0, 1, 0.2980392, 1,
-0.3061096, -0.3591694, -3.253724, 0, 1, 0.3058824, 1,
-0.3053685, -2.376185, -2.038754, 0, 1, 0.3098039, 1,
-0.2972745, 0.6303073, 0.4620637, 0, 1, 0.3176471, 1,
-0.2964564, 0.3936332, 0.1673217, 0, 1, 0.3215686, 1,
-0.2923283, -0.08145147, -1.522666, 0, 1, 0.3294118, 1,
-0.2844479, 1.191132, -0.4227102, 0, 1, 0.3333333, 1,
-0.2812556, 1.212837, -0.1356901, 0, 1, 0.3411765, 1,
-0.2782656, -0.6970558, -3.430389, 0, 1, 0.345098, 1,
-0.2740829, -0.1318086, -2.164493, 0, 1, 0.3529412, 1,
-0.2695193, 1.908844, -0.1484309, 0, 1, 0.3568628, 1,
-0.267904, -0.4240315, -3.651172, 0, 1, 0.3647059, 1,
-0.2671022, 1.196051, -0.4474455, 0, 1, 0.3686275, 1,
-0.264626, -1.411121, -3.936712, 0, 1, 0.3764706, 1,
-0.256514, 0.382805, -0.05888876, 0, 1, 0.3803922, 1,
-0.2513782, -0.6346469, -3.496264, 0, 1, 0.3882353, 1,
-0.2513676, 0.8355746, 1.156276, 0, 1, 0.3921569, 1,
-0.2479697, -0.08180337, -2.590315, 0, 1, 0.4, 1,
-0.246987, 0.5121755, -0.6092977, 0, 1, 0.4078431, 1,
-0.2446706, -1.676716, -2.965541, 0, 1, 0.4117647, 1,
-0.2430956, -1.002771, -2.299373, 0, 1, 0.4196078, 1,
-0.2427865, 1.044533, 0.6224437, 0, 1, 0.4235294, 1,
-0.238791, 2.708071, 1.057782, 0, 1, 0.4313726, 1,
-0.2298351, 0.2649434, 1.897513, 0, 1, 0.4352941, 1,
-0.2285516, -0.4484217, -2.474714, 0, 1, 0.4431373, 1,
-0.2277818, -0.123691, -3.315693, 0, 1, 0.4470588, 1,
-0.2276712, 0.3734328, 0.1089904, 0, 1, 0.454902, 1,
-0.2262904, -0.1503833, -2.763076, 0, 1, 0.4588235, 1,
-0.2228948, -0.9773036, -1.752209, 0, 1, 0.4666667, 1,
-0.2123238, 0.3581746, -0.5874939, 0, 1, 0.4705882, 1,
-0.2115656, -0.6593328, -3.41182, 0, 1, 0.4784314, 1,
-0.2072175, -0.8530397, -3.549625, 0, 1, 0.4823529, 1,
-0.2070973, -1.627377, -4.150848, 0, 1, 0.4901961, 1,
-0.2061219, 0.94973, 0.5392299, 0, 1, 0.4941176, 1,
-0.2049089, -0.03190248, -0.5596793, 0, 1, 0.5019608, 1,
-0.2034796, -1.24138, -4.225408, 0, 1, 0.509804, 1,
-0.2031589, -0.4112347, -2.949799, 0, 1, 0.5137255, 1,
-0.199681, -0.07603337, -2.117141, 0, 1, 0.5215687, 1,
-0.1990994, 0.6676397, -0.8864746, 0, 1, 0.5254902, 1,
-0.1908972, -0.03779037, -2.936074, 0, 1, 0.5333334, 1,
-0.1903203, 0.3528481, -1.071053, 0, 1, 0.5372549, 1,
-0.1864915, 0.2028709, -1.803457, 0, 1, 0.5450981, 1,
-0.184105, -1.049573, -4.116381, 0, 1, 0.5490196, 1,
-0.1840926, -0.6182621, -2.143543, 0, 1, 0.5568628, 1,
-0.1835542, 0.07489314, -0.5693572, 0, 1, 0.5607843, 1,
-0.183148, 1.66771, 1.217058, 0, 1, 0.5686275, 1,
-0.1825089, 0.1541415, 0.2946919, 0, 1, 0.572549, 1,
-0.1773504, 0.2653901, -1.808604, 0, 1, 0.5803922, 1,
-0.1768625, 0.188476, 0.2887965, 0, 1, 0.5843138, 1,
-0.1739561, -0.8716825, -3.652404, 0, 1, 0.5921569, 1,
-0.1721956, -0.02335369, -3.045985, 0, 1, 0.5960785, 1,
-0.1710797, -0.9812054, -3.731867, 0, 1, 0.6039216, 1,
-0.1703232, -0.39734, -1.937374, 0, 1, 0.6117647, 1,
-0.1660211, 1.147187, 0.8120776, 0, 1, 0.6156863, 1,
-0.1652184, -1.982598, -3.003214, 0, 1, 0.6235294, 1,
-0.1648368, 0.9977321, -0.4792823, 0, 1, 0.627451, 1,
-0.1626173, -0.4439076, -2.426521, 0, 1, 0.6352941, 1,
-0.1619252, -0.3792872, -3.30778, 0, 1, 0.6392157, 1,
-0.1614678, -0.5318413, -4.478672, 0, 1, 0.6470588, 1,
-0.1585164, 0.2320894, 0.1540038, 0, 1, 0.6509804, 1,
-0.1488298, -1.057304, -4.025597, 0, 1, 0.6588235, 1,
-0.1471674, -0.6970631, -2.551516, 0, 1, 0.6627451, 1,
-0.1451666, 1.307194, -0.7688312, 0, 1, 0.6705883, 1,
-0.1430303, -1.05927, -3.251035, 0, 1, 0.6745098, 1,
-0.1400989, 0.04776895, -0.4904534, 0, 1, 0.682353, 1,
-0.1321331, 1.905967, 0.3638135, 0, 1, 0.6862745, 1,
-0.1284911, 0.428069, 0.8099378, 0, 1, 0.6941177, 1,
-0.1224083, 0.5783671, 0.09845113, 0, 1, 0.7019608, 1,
-0.1222984, -0.5136558, -2.204031, 0, 1, 0.7058824, 1,
-0.1200633, -0.9534657, -2.479826, 0, 1, 0.7137255, 1,
-0.1195832, 0.527072, 0.6563057, 0, 1, 0.7176471, 1,
-0.1152705, -1.326482, -3.09898, 0, 1, 0.7254902, 1,
-0.1125189, -1.722587, -3.995494, 0, 1, 0.7294118, 1,
-0.108425, -0.5817103, -4.962015, 0, 1, 0.7372549, 1,
-0.1077536, -1.789243, -3.767795, 0, 1, 0.7411765, 1,
-0.1076224, -0.2265029, -1.856357, 0, 1, 0.7490196, 1,
-0.09981482, 0.4109645, -0.3471793, 0, 1, 0.7529412, 1,
-0.0987336, 0.9659831, -0.1726243, 0, 1, 0.7607843, 1,
-0.09815079, -0.2323707, -2.598757, 0, 1, 0.7647059, 1,
-0.09806072, 0.7157245, 1.359838, 0, 1, 0.772549, 1,
-0.08911441, -1.478902, -3.671768, 0, 1, 0.7764706, 1,
-0.0850971, 1.408333, -0.28837, 0, 1, 0.7843137, 1,
-0.08500791, -1.222278, -0.3200597, 0, 1, 0.7882353, 1,
-0.08411746, 0.5566983, -1.353254, 0, 1, 0.7960784, 1,
-0.08225933, -0.9372945, -1.340163, 0, 1, 0.8039216, 1,
-0.08156469, -0.8245139, -3.366122, 0, 1, 0.8078431, 1,
-0.08083159, 0.1594859, -0.3420455, 0, 1, 0.8156863, 1,
-0.08044409, 0.1109097, -1.484562, 0, 1, 0.8196079, 1,
-0.07921189, 1.516121, -0.1905684, 0, 1, 0.827451, 1,
-0.07879599, 2.437021, -1.661012, 0, 1, 0.8313726, 1,
-0.07789598, -0.2915241, -2.480545, 0, 1, 0.8392157, 1,
-0.07548992, -0.2070826, -3.685336, 0, 1, 0.8431373, 1,
-0.07435366, 0.1127906, -0.5092049, 0, 1, 0.8509804, 1,
-0.07177072, -1.164317, -3.015324, 0, 1, 0.854902, 1,
-0.07028717, 1.282097, -0.315835, 0, 1, 0.8627451, 1,
-0.06390208, -0.2908235, -3.285916, 0, 1, 0.8666667, 1,
-0.06086987, -0.4110466, -3.490422, 0, 1, 0.8745098, 1,
-0.05968738, 0.6900206, 0.1806765, 0, 1, 0.8784314, 1,
-0.05952327, -0.7528589, -2.888191, 0, 1, 0.8862745, 1,
-0.05848206, -0.2687294, -2.749847, 0, 1, 0.8901961, 1,
-0.05847766, -1.847206, -3.547136, 0, 1, 0.8980392, 1,
-0.05774724, 0.2782587, 0.7215785, 0, 1, 0.9058824, 1,
-0.05495003, 0.5154819, -1.844818, 0, 1, 0.9098039, 1,
-0.05426927, -0.6322454, -3.866796, 0, 1, 0.9176471, 1,
-0.05246343, -0.221553, -1.930004, 0, 1, 0.9215686, 1,
-0.05242575, -1.251939, -4.204548, 0, 1, 0.9294118, 1,
-0.05137161, -0.7159469, -0.7318406, 0, 1, 0.9333333, 1,
-0.05076097, 0.436644, -1.458702, 0, 1, 0.9411765, 1,
-0.04990477, -1.373811, -4.466097, 0, 1, 0.945098, 1,
-0.04956008, -0.3257639, -2.745947, 0, 1, 0.9529412, 1,
-0.04487822, 0.6096604, 0.1476738, 0, 1, 0.9568627, 1,
-0.04353738, -0.4915245, -3.793091, 0, 1, 0.9647059, 1,
-0.04320392, 0.1327213, -0.9186089, 0, 1, 0.9686275, 1,
-0.03603618, 0.3869067, -1.150836, 0, 1, 0.9764706, 1,
-0.02450839, 1.679115, 0.002941428, 0, 1, 0.9803922, 1,
-0.02180251, 0.6570673, 0.0329835, 0, 1, 0.9882353, 1,
-0.02157799, 0.08231813, -0.7714317, 0, 1, 0.9921569, 1,
-0.01874459, -0.7712912, -4.924186, 0, 1, 1, 1,
-0.01828702, -0.7859758, -3.121641, 0, 0.9921569, 1, 1,
-0.01608793, -0.4586929, -3.582681, 0, 0.9882353, 1, 1,
-0.008821986, 0.6973361, -0.5839894, 0, 0.9803922, 1, 1,
-0.008641803, 0.4777781, 0.9713892, 0, 0.9764706, 1, 1,
-0.006668458, -0.2158252, -4.179574, 0, 0.9686275, 1, 1,
-0.006498545, 0.1413473, 0.4758442, 0, 0.9647059, 1, 1,
-0.001638333, 0.4767216, -0.9349412, 0, 0.9568627, 1, 1,
-0.001222327, 0.3128838, 0.5409353, 0, 0.9529412, 1, 1,
0.0001830154, 0.07329493, -0.9954458, 0, 0.945098, 1, 1,
0.001503089, 0.699867, -1.395638, 0, 0.9411765, 1, 1,
0.009492403, -0.8671466, 2.909778, 0, 0.9333333, 1, 1,
0.01055361, 0.2943659, -0.641224, 0, 0.9294118, 1, 1,
0.01186239, -0.5299419, 2.617572, 0, 0.9215686, 1, 1,
0.01430336, 0.1948949, 0.04590788, 0, 0.9176471, 1, 1,
0.01511505, -0.2641246, 1.707723, 0, 0.9098039, 1, 1,
0.01668099, 0.749436, -1.091798, 0, 0.9058824, 1, 1,
0.0243277, -0.9924094, 3.028743, 0, 0.8980392, 1, 1,
0.02675239, -0.02238788, 0.4386206, 0, 0.8901961, 1, 1,
0.02816624, 1.128499, 0.3479433, 0, 0.8862745, 1, 1,
0.02925598, -0.3027654, 2.412452, 0, 0.8784314, 1, 1,
0.02941572, -0.9188448, 3.648139, 0, 0.8745098, 1, 1,
0.03234101, -0.8330237, 3.575168, 0, 0.8666667, 1, 1,
0.03631151, -1.412329, 1.755469, 0, 0.8627451, 1, 1,
0.03988693, -0.2746247, 3.487528, 0, 0.854902, 1, 1,
0.05095683, 0.1148801, -0.5116059, 0, 0.8509804, 1, 1,
0.05185206, 0.08353201, 0.4107792, 0, 0.8431373, 1, 1,
0.05440504, 0.5168368, -1.452986, 0, 0.8392157, 1, 1,
0.05865784, 0.1117695, 2.065362, 0, 0.8313726, 1, 1,
0.06342457, 0.4911238, 0.3686803, 0, 0.827451, 1, 1,
0.0653385, 1.350182, 0.116721, 0, 0.8196079, 1, 1,
0.07453731, 0.2270082, 0.2831905, 0, 0.8156863, 1, 1,
0.0755007, -0.1105629, 2.293586, 0, 0.8078431, 1, 1,
0.07568491, 1.075135, -1.056905, 0, 0.8039216, 1, 1,
0.07766107, 0.2413305, 1.277426, 0, 0.7960784, 1, 1,
0.08279457, -0.8855027, 3.682334, 0, 0.7882353, 1, 1,
0.08395895, -2.016836, 3.600533, 0, 0.7843137, 1, 1,
0.08577757, -0.4643114, 2.589153, 0, 0.7764706, 1, 1,
0.08647607, 0.2298097, -0.1448606, 0, 0.772549, 1, 1,
0.101107, 0.2933763, 0.3274364, 0, 0.7647059, 1, 1,
0.1084769, -0.522071, 2.783067, 0, 0.7607843, 1, 1,
0.1116473, 0.1066473, 1.061723, 0, 0.7529412, 1, 1,
0.1138299, 0.4609716, -0.5540614, 0, 0.7490196, 1, 1,
0.1163267, 0.7069075, 1.031208, 0, 0.7411765, 1, 1,
0.1189967, -0.5807893, 1.488186, 0, 0.7372549, 1, 1,
0.1237274, 0.1674619, -0.1633985, 0, 0.7294118, 1, 1,
0.1267268, -0.6286408, 1.645088, 0, 0.7254902, 1, 1,
0.1421711, 0.1309506, 1.148304, 0, 0.7176471, 1, 1,
0.1447791, 0.8563879, 0.1086047, 0, 0.7137255, 1, 1,
0.1492978, 1.329121, -0.855627, 0, 0.7058824, 1, 1,
0.1522259, 0.3559281, -0.404519, 0, 0.6980392, 1, 1,
0.1536929, 0.716951, 1.171252, 0, 0.6941177, 1, 1,
0.1550648, 0.7607093, -0.7887394, 0, 0.6862745, 1, 1,
0.1594771, -1.846057, 3.791939, 0, 0.682353, 1, 1,
0.1609267, 0.08811241, -0.08304182, 0, 0.6745098, 1, 1,
0.1610408, 0.512004, 3.08683, 0, 0.6705883, 1, 1,
0.161456, 0.2552103, 2.860896, 0, 0.6627451, 1, 1,
0.1699733, -1.68488, 3.209329, 0, 0.6588235, 1, 1,
0.1725188, 0.7619764, 0.2850942, 0, 0.6509804, 1, 1,
0.1733168, 0.2191569, 0.5999258, 0, 0.6470588, 1, 1,
0.1737495, 1.158614, 0.6658037, 0, 0.6392157, 1, 1,
0.1751999, 1.309272, 0.8053449, 0, 0.6352941, 1, 1,
0.1759348, 1.211965, -0.5809122, 0, 0.627451, 1, 1,
0.1762641, 0.572592, 0.2129063, 0, 0.6235294, 1, 1,
0.178665, 1.322862, 1.185036, 0, 0.6156863, 1, 1,
0.1811867, 0.1799815, 2.553442, 0, 0.6117647, 1, 1,
0.1816678, 0.3555667, 0.6141011, 0, 0.6039216, 1, 1,
0.1843962, -1.60646, 1.461049, 0, 0.5960785, 1, 1,
0.1859584, 1.278516, 0.3743332, 0, 0.5921569, 1, 1,
0.1864251, -0.360761, 1.874815, 0, 0.5843138, 1, 1,
0.1880869, 0.4003788, 0.8914823, 0, 0.5803922, 1, 1,
0.191119, 0.5359025, -0.3069413, 0, 0.572549, 1, 1,
0.1920784, -0.7121203, 4.835941, 0, 0.5686275, 1, 1,
0.1951527, 1.098824, -0.4662469, 0, 0.5607843, 1, 1,
0.1967355, -1.079396, 3.652962, 0, 0.5568628, 1, 1,
0.1990218, 1.020387, 0.02736014, 0, 0.5490196, 1, 1,
0.199784, 0.4207455, 1.510337, 0, 0.5450981, 1, 1,
0.2033395, 1.5074, -0.9735408, 0, 0.5372549, 1, 1,
0.2038313, -0.7563434, 2.44142, 0, 0.5333334, 1, 1,
0.2047254, -0.7678441, 3.559171, 0, 0.5254902, 1, 1,
0.2070733, -0.2263842, 1.904213, 0, 0.5215687, 1, 1,
0.2093582, 1.421666, 0.08092626, 0, 0.5137255, 1, 1,
0.2105726, -1.245337, 3.185735, 0, 0.509804, 1, 1,
0.2123918, 0.396068, -0.07202929, 0, 0.5019608, 1, 1,
0.2161745, -1.345856, 3.025184, 0, 0.4941176, 1, 1,
0.2167868, 0.4466129, -0.7571715, 0, 0.4901961, 1, 1,
0.2201611, -0.7173578, 2.792527, 0, 0.4823529, 1, 1,
0.2211813, 0.04878446, 1.053693, 0, 0.4784314, 1, 1,
0.2219091, 0.2247318, -0.7059314, 0, 0.4705882, 1, 1,
0.2286704, 1.729684, 0.6219878, 0, 0.4666667, 1, 1,
0.2299738, 1.04691, -0.7091852, 0, 0.4588235, 1, 1,
0.2403516, -3.068968, 2.854552, 0, 0.454902, 1, 1,
0.2416397, 0.2538919, 1.027709, 0, 0.4470588, 1, 1,
0.2418405, -0.850358, 3.688572, 0, 0.4431373, 1, 1,
0.2425507, -0.065414, -0.5993155, 0, 0.4352941, 1, 1,
0.2444587, 1.067574, 2.146198, 0, 0.4313726, 1, 1,
0.2445555, -1.119989, 3.830923, 0, 0.4235294, 1, 1,
0.2475696, 0.9704705, 1.695488, 0, 0.4196078, 1, 1,
0.2540367, -0.9614576, 3.814148, 0, 0.4117647, 1, 1,
0.2541812, 0.8696082, -2.264279, 0, 0.4078431, 1, 1,
0.2599107, 0.8951263, -0.02582916, 0, 0.4, 1, 1,
0.2635634, -0.9510667, 2.096312, 0, 0.3921569, 1, 1,
0.2645727, -0.2806839, 2.095402, 0, 0.3882353, 1, 1,
0.2649136, -1.844898, 3.016664, 0, 0.3803922, 1, 1,
0.2663117, -0.6316505, 2.430401, 0, 0.3764706, 1, 1,
0.2720259, 0.8027051, -1.418188, 0, 0.3686275, 1, 1,
0.2768828, 0.3627487, 2.486681, 0, 0.3647059, 1, 1,
0.2826255, -0.7376894, 2.371468, 0, 0.3568628, 1, 1,
0.2945414, 0.1876053, 1.553705, 0, 0.3529412, 1, 1,
0.2976805, 0.6907138, -0.9644783, 0, 0.345098, 1, 1,
0.2990243, -0.1572298, 1.693717, 0, 0.3411765, 1, 1,
0.3031382, -1.474604, 3.299046, 0, 0.3333333, 1, 1,
0.3054622, 0.5803065, 1.49785, 0, 0.3294118, 1, 1,
0.3112867, -1.158852, 4.102887, 0, 0.3215686, 1, 1,
0.3135507, 0.8540015, 0.1401523, 0, 0.3176471, 1, 1,
0.3221305, 0.009080104, 1.66142, 0, 0.3098039, 1, 1,
0.3236292, -0.4732822, 1.51245, 0, 0.3058824, 1, 1,
0.3242451, -0.7080196, 3.212884, 0, 0.2980392, 1, 1,
0.3252616, 2.244635, 1.474463, 0, 0.2901961, 1, 1,
0.3255612, -0.1831297, 1.286727, 0, 0.2862745, 1, 1,
0.3270525, 1.427094, -1.050953, 0, 0.2784314, 1, 1,
0.3283363, -0.7924981, 2.93276, 0, 0.2745098, 1, 1,
0.3348654, -0.1432375, 2.103367, 0, 0.2666667, 1, 1,
0.339714, -1.426931, 3.687864, 0, 0.2627451, 1, 1,
0.3411396, -0.5380434, 2.515227, 0, 0.254902, 1, 1,
0.341777, 0.3790544, 2.545205, 0, 0.2509804, 1, 1,
0.3423639, -0.9384696, 1.843996, 0, 0.2431373, 1, 1,
0.3494014, 0.1927778, 0.4081636, 0, 0.2392157, 1, 1,
0.3513744, -0.4889091, 4.05202, 0, 0.2313726, 1, 1,
0.3513778, 1.473471, -1.441747, 0, 0.227451, 1, 1,
0.3567151, -0.6886579, 2.492103, 0, 0.2196078, 1, 1,
0.3575219, 0.5397161, -0.1329328, 0, 0.2156863, 1, 1,
0.3623816, 1.073587, -0.9083456, 0, 0.2078431, 1, 1,
0.3627904, -0.574243, 2.053519, 0, 0.2039216, 1, 1,
0.3790305, 0.4828361, -1.547641, 0, 0.1960784, 1, 1,
0.3801661, 0.8428977, 0.5503722, 0, 0.1882353, 1, 1,
0.3837861, 0.6602713, -0.1279985, 0, 0.1843137, 1, 1,
0.3842717, 0.5672033, 2.177945, 0, 0.1764706, 1, 1,
0.3858938, -1.76497, 4.359946, 0, 0.172549, 1, 1,
0.3900748, 0.4678569, 1.190191, 0, 0.1647059, 1, 1,
0.3914728, -0.589188, 2.296357, 0, 0.1607843, 1, 1,
0.392465, 1.153996, 1.022166, 0, 0.1529412, 1, 1,
0.3949397, 0.0367944, 0.1901129, 0, 0.1490196, 1, 1,
0.3967211, 1.299593, 0.2817295, 0, 0.1411765, 1, 1,
0.4000418, -1.252458, 5.1968, 0, 0.1372549, 1, 1,
0.4023999, -0.2127688, 3.298907, 0, 0.1294118, 1, 1,
0.4029, 0.5573596, 0.6929265, 0, 0.1254902, 1, 1,
0.4054171, -0.1763891, 2.048945, 0, 0.1176471, 1, 1,
0.4061068, -0.5184639, 1.495262, 0, 0.1137255, 1, 1,
0.4066826, -0.8317173, 2.13534, 0, 0.1058824, 1, 1,
0.4093648, -1.073986, 3.466255, 0, 0.09803922, 1, 1,
0.4107469, -0.3464531, 2.568795, 0, 0.09411765, 1, 1,
0.4118357, 0.3500793, 1.642838, 0, 0.08627451, 1, 1,
0.4140676, -0.02663849, 1.057912, 0, 0.08235294, 1, 1,
0.4186304, -0.4617256, 3.692461, 0, 0.07450981, 1, 1,
0.4199077, 0.6041366, 0.3084367, 0, 0.07058824, 1, 1,
0.4201714, -0.691479, 1.781968, 0, 0.0627451, 1, 1,
0.424262, 0.3990324, 2.229087, 0, 0.05882353, 1, 1,
0.4243816, -0.9750919, 3.268624, 0, 0.05098039, 1, 1,
0.4245983, 1.308421, 0.5364616, 0, 0.04705882, 1, 1,
0.4251036, -1.073202, 2.381047, 0, 0.03921569, 1, 1,
0.4256265, -0.5285116, 2.901174, 0, 0.03529412, 1, 1,
0.4270701, 0.7395812, 0.5519066, 0, 0.02745098, 1, 1,
0.4290879, 0.4138605, 1.358171, 0, 0.02352941, 1, 1,
0.4299596, 0.09410027, 2.626694, 0, 0.01568628, 1, 1,
0.4306614, -0.7328885, 0.7278992, 0, 0.01176471, 1, 1,
0.4325365, -1.773133, 1.653424, 0, 0.003921569, 1, 1,
0.4379755, -0.7339513, 1.993422, 0.003921569, 0, 1, 1,
0.440036, 0.8743094, 2.001196, 0.007843138, 0, 1, 1,
0.4415375, 1.758992, 1.134085, 0.01568628, 0, 1, 1,
0.4427152, -0.4380711, 2.03059, 0.01960784, 0, 1, 1,
0.443556, 0.2399213, 1.444232, 0.02745098, 0, 1, 1,
0.4461906, -0.03936275, 2.153018, 0.03137255, 0, 1, 1,
0.4479256, 1.667287, -1.403562, 0.03921569, 0, 1, 1,
0.4495075, 1.26425, 0.7819883, 0.04313726, 0, 1, 1,
0.4552449, 1.26592, 2.644089, 0.05098039, 0, 1, 1,
0.4584925, -1.27533, 1.45154, 0.05490196, 0, 1, 1,
0.4602904, 0.3699268, 1.620433, 0.0627451, 0, 1, 1,
0.4642602, 0.8170268, 1.814989, 0.06666667, 0, 1, 1,
0.4652652, 0.2523363, 1.068192, 0.07450981, 0, 1, 1,
0.4708145, -2.142648, 1.400994, 0.07843138, 0, 1, 1,
0.4719546, -0.5430945, 2.640726, 0.08627451, 0, 1, 1,
0.4733233, 1.69135, -0.1080032, 0.09019608, 0, 1, 1,
0.4784372, -1.380724, 2.753939, 0.09803922, 0, 1, 1,
0.4794222, 1.03757, -1.533252, 0.1058824, 0, 1, 1,
0.4835075, 1.228392, 0.3519922, 0.1098039, 0, 1, 1,
0.4869438, -0.3297476, 2.294812, 0.1176471, 0, 1, 1,
0.4919676, 1.054383, -0.001370604, 0.1215686, 0, 1, 1,
0.4931593, 1.806277, -1.010714, 0.1294118, 0, 1, 1,
0.508411, 1.2047, -1.096337, 0.1333333, 0, 1, 1,
0.5101948, 0.5374893, -0.5328857, 0.1411765, 0, 1, 1,
0.5181952, -0.3988884, 2.009111, 0.145098, 0, 1, 1,
0.5274352, 1.272956, 0.0144461, 0.1529412, 0, 1, 1,
0.5316679, 0.2951646, 1.567174, 0.1568628, 0, 1, 1,
0.5355862, -2.011344, 2.716417, 0.1647059, 0, 1, 1,
0.5360134, 0.7041878, -0.1494006, 0.1686275, 0, 1, 1,
0.5361197, -0.5771735, 2.426111, 0.1764706, 0, 1, 1,
0.5370229, -1.273264, 2.375775, 0.1803922, 0, 1, 1,
0.540611, 0.6969674, 0.3711748, 0.1882353, 0, 1, 1,
0.5464349, 0.5890995, -0.329366, 0.1921569, 0, 1, 1,
0.5518861, 1.825824, 1.511813, 0.2, 0, 1, 1,
0.5521879, -1.83495, 3.264567, 0.2078431, 0, 1, 1,
0.5523261, -0.05772048, 1.514842, 0.2117647, 0, 1, 1,
0.5531499, -1.415421, 1.603187, 0.2196078, 0, 1, 1,
0.5548221, -1.77341, 4.195101, 0.2235294, 0, 1, 1,
0.5639251, 0.6551581, 0.5379769, 0.2313726, 0, 1, 1,
0.5748122, 0.3960233, 0.912474, 0.2352941, 0, 1, 1,
0.5748361, 0.004501518, 0.6598685, 0.2431373, 0, 1, 1,
0.5770344, 1.993692, -1.583385, 0.2470588, 0, 1, 1,
0.5811251, -0.2077842, 1.661318, 0.254902, 0, 1, 1,
0.5837813, 0.518783, 0.843088, 0.2588235, 0, 1, 1,
0.5839092, -0.480293, 1.788905, 0.2666667, 0, 1, 1,
0.5861008, 2.477288, -0.5395268, 0.2705882, 0, 1, 1,
0.5877459, 1.3543, 1.92579, 0.2784314, 0, 1, 1,
0.5914569, -0.8303957, 2.489442, 0.282353, 0, 1, 1,
0.5935724, 1.678625, 0.3208278, 0.2901961, 0, 1, 1,
0.5985872, -0.4953858, 1.554561, 0.2941177, 0, 1, 1,
0.599115, -0.3140605, 2.087676, 0.3019608, 0, 1, 1,
0.6033349, 1.112485, 1.169634, 0.3098039, 0, 1, 1,
0.6102473, -0.7431861, 4.570447, 0.3137255, 0, 1, 1,
0.6133986, -0.2966392, 2.46168, 0.3215686, 0, 1, 1,
0.6147393, -0.4271555, 1.967354, 0.3254902, 0, 1, 1,
0.6172985, 0.067234, 0.7758178, 0.3333333, 0, 1, 1,
0.6176352, -0.6232934, 3.495105, 0.3372549, 0, 1, 1,
0.6192037, -0.9149491, 3.612023, 0.345098, 0, 1, 1,
0.6212841, 0.5374156, 1.759257, 0.3490196, 0, 1, 1,
0.6229312, -0.1805349, 2.356701, 0.3568628, 0, 1, 1,
0.6237162, -0.03637012, 2.545211, 0.3607843, 0, 1, 1,
0.6247706, 1.354695, 1.558344, 0.3686275, 0, 1, 1,
0.6300856, -1.241929, 2.395962, 0.372549, 0, 1, 1,
0.6313913, 0.1396598, 1.613106, 0.3803922, 0, 1, 1,
0.6327491, 0.8934439, -0.647987, 0.3843137, 0, 1, 1,
0.6343836, 0.6130944, 2.322893, 0.3921569, 0, 1, 1,
0.6353531, 1.930038, 1.282715, 0.3960784, 0, 1, 1,
0.6362823, -1.18211, 1.013397, 0.4039216, 0, 1, 1,
0.6369284, 0.0457017, 1.491165, 0.4117647, 0, 1, 1,
0.6372372, -0.5489235, 3.841266, 0.4156863, 0, 1, 1,
0.6380536, 1.857552, 0.3872226, 0.4235294, 0, 1, 1,
0.6480755, 0.3768468, 1.22524, 0.427451, 0, 1, 1,
0.6488532, 0.147073, 1.675225, 0.4352941, 0, 1, 1,
0.6511636, 0.8703696, -1.615545, 0.4392157, 0, 1, 1,
0.6517218, -0.09514871, 3.808094, 0.4470588, 0, 1, 1,
0.6576248, -0.7043447, 3.049883, 0.4509804, 0, 1, 1,
0.6584964, 0.8839049, -0.2508316, 0.4588235, 0, 1, 1,
0.662052, -0.8355888, 1.79829, 0.4627451, 0, 1, 1,
0.6620823, 0.0156777, 0.7202078, 0.4705882, 0, 1, 1,
0.6642329, 0.2468791, 2.383484, 0.4745098, 0, 1, 1,
0.668237, -1.002216, 2.189816, 0.4823529, 0, 1, 1,
0.668314, 1.308324, -0.6583323, 0.4862745, 0, 1, 1,
0.6743749, 0.5571052, 1.566005, 0.4941176, 0, 1, 1,
0.6745935, -0.6137266, 1.177472, 0.5019608, 0, 1, 1,
0.6761603, -1.430751, 3.533151, 0.5058824, 0, 1, 1,
0.6809617, -0.9948523, 1.254705, 0.5137255, 0, 1, 1,
0.6905472, 0.8401809, 1.111656, 0.5176471, 0, 1, 1,
0.6932927, 1.471135, 0.4841276, 0.5254902, 0, 1, 1,
0.696851, -1.160894, 3.014291, 0.5294118, 0, 1, 1,
0.6977073, -1.524436, 3.482567, 0.5372549, 0, 1, 1,
0.7004321, -0.4996012, 1.835913, 0.5411765, 0, 1, 1,
0.7071168, 0.5175033, 2.401516, 0.5490196, 0, 1, 1,
0.7081802, 0.5842577, 1.220082, 0.5529412, 0, 1, 1,
0.7096765, -0.7698107, 2.856168, 0.5607843, 0, 1, 1,
0.7146797, 0.6385763, 0.2116162, 0.5647059, 0, 1, 1,
0.71618, -2.331225, 1.753035, 0.572549, 0, 1, 1,
0.7164509, 0.959867, -0.4770703, 0.5764706, 0, 1, 1,
0.7180113, -0.004801693, 1.933284, 0.5843138, 0, 1, 1,
0.7254293, 0.7624707, 2.343212, 0.5882353, 0, 1, 1,
0.7272965, -1.547603, 2.259963, 0.5960785, 0, 1, 1,
0.7326677, -0.1140066, 2.359302, 0.6039216, 0, 1, 1,
0.7379637, -0.200764, 3.016694, 0.6078432, 0, 1, 1,
0.7380347, 1.476533, 0.1141662, 0.6156863, 0, 1, 1,
0.7390027, -0.1090335, 1.874896, 0.6196079, 0, 1, 1,
0.7544977, -0.7370645, 1.980887, 0.627451, 0, 1, 1,
0.754998, 0.7017689, 0.7989181, 0.6313726, 0, 1, 1,
0.7573968, 0.1710234, 1.478124, 0.6392157, 0, 1, 1,
0.7582347, 0.7006881, 1.700582, 0.6431373, 0, 1, 1,
0.7612803, -0.1651075, 2.225751, 0.6509804, 0, 1, 1,
0.762685, 0.8802158, 0.05320552, 0.654902, 0, 1, 1,
0.7641271, -0.7074329, 2.786674, 0.6627451, 0, 1, 1,
0.7657394, 0.1827646, 1.55757, 0.6666667, 0, 1, 1,
0.7663646, -0.5436078, 2.006694, 0.6745098, 0, 1, 1,
0.7671844, 1.164358, 1.251109, 0.6784314, 0, 1, 1,
0.7709292, -0.2657384, 3.220708, 0.6862745, 0, 1, 1,
0.7773633, -0.2504613, 2.029255, 0.6901961, 0, 1, 1,
0.7839993, 0.2094615, 0.7982372, 0.6980392, 0, 1, 1,
0.7947463, -0.5093895, 1.840496, 0.7058824, 0, 1, 1,
0.7981734, -1.614424, 4.239185, 0.7098039, 0, 1, 1,
0.8022565, 0.522766, 0.970957, 0.7176471, 0, 1, 1,
0.8034348, -0.6740557, 2.219441, 0.7215686, 0, 1, 1,
0.8067766, -1.953069, 2.187792, 0.7294118, 0, 1, 1,
0.816364, 0.4148168, 1.983536, 0.7333333, 0, 1, 1,
0.8227728, -0.8250569, 2.707409, 0.7411765, 0, 1, 1,
0.8255275, -0.9710141, 1.484455, 0.7450981, 0, 1, 1,
0.828016, -0.9092883, 1.281993, 0.7529412, 0, 1, 1,
0.8358047, 0.1432403, 2.139152, 0.7568628, 0, 1, 1,
0.8408746, -1.164206, 2.809866, 0.7647059, 0, 1, 1,
0.8448523, -0.5035698, 1.313303, 0.7686275, 0, 1, 1,
0.847177, 0.9907092, 0.7226149, 0.7764706, 0, 1, 1,
0.8474303, 0.5586643, 1.066476, 0.7803922, 0, 1, 1,
0.8483111, -0.02669793, 0.3003413, 0.7882353, 0, 1, 1,
0.8568569, -1.0683, 2.318107, 0.7921569, 0, 1, 1,
0.8572974, -1.171484, 2.818006, 0.8, 0, 1, 1,
0.8580377, -0.07302972, 2.228683, 0.8078431, 0, 1, 1,
0.8621036, -1.568962, 3.158973, 0.8117647, 0, 1, 1,
0.8682879, -0.6037435, 0.7570757, 0.8196079, 0, 1, 1,
0.8723783, -1.445178, 0.6555371, 0.8235294, 0, 1, 1,
0.8757431, 1.02685, 1.05797, 0.8313726, 0, 1, 1,
0.8775594, -1.04129, 1.676516, 0.8352941, 0, 1, 1,
0.8782777, -0.4342335, 2.373254, 0.8431373, 0, 1, 1,
0.8879567, -0.6741135, 0.6439783, 0.8470588, 0, 1, 1,
0.8922499, 1.378425, 0.4409028, 0.854902, 0, 1, 1,
0.8936251, 1.56285, 2.069511, 0.8588235, 0, 1, 1,
0.8950297, 0.4285071, 1.181187, 0.8666667, 0, 1, 1,
0.8984671, 0.8105687, -1.6131, 0.8705882, 0, 1, 1,
0.9034098, 0.06185618, 2.339077, 0.8784314, 0, 1, 1,
0.9114475, 0.8129023, 2.144427, 0.8823529, 0, 1, 1,
0.9144654, -0.4434746, 3.273447, 0.8901961, 0, 1, 1,
0.9171354, -0.7093719, 2.234255, 0.8941177, 0, 1, 1,
0.9208069, 1.100708, 1.417758, 0.9019608, 0, 1, 1,
0.9250702, 1.017039, -0.2395217, 0.9098039, 0, 1, 1,
0.9410893, -1.313062, 2.900336, 0.9137255, 0, 1, 1,
0.9463464, 0.7846841, 0.422398, 0.9215686, 0, 1, 1,
0.946689, -1.194638, 1.390192, 0.9254902, 0, 1, 1,
0.9499915, 2.537883, 0.6450285, 0.9333333, 0, 1, 1,
0.9512578, 0.431989, 0.8648522, 0.9372549, 0, 1, 1,
0.951342, 0.3131829, 0.8661515, 0.945098, 0, 1, 1,
0.9587094, -1.268215, 3.689666, 0.9490196, 0, 1, 1,
0.9619065, -0.03661061, 3.627082, 0.9568627, 0, 1, 1,
0.9669159, 0.9709227, -0.9753004, 0.9607843, 0, 1, 1,
0.9697627, 0.7165619, 0.1788158, 0.9686275, 0, 1, 1,
0.9747109, 1.314078, 2.35056, 0.972549, 0, 1, 1,
0.9755258, 0.7555829, 0.9446976, 0.9803922, 0, 1, 1,
0.9790474, -1.153777, 2.9645, 0.9843137, 0, 1, 1,
0.9799716, 0.2213389, -0.5731992, 0.9921569, 0, 1, 1,
0.9868406, -0.499754, 3.596182, 0.9960784, 0, 1, 1,
0.9897325, 1.567379, 0.3843811, 1, 0, 0.9960784, 1,
0.9953987, 1.21203, 0.8571212, 1, 0, 0.9882353, 1,
0.9989529, 0.4504141, 2.470278, 1, 0, 0.9843137, 1,
0.9998498, 1.03972, 2.584549, 1, 0, 0.9764706, 1,
1.000417, -0.7303774, 2.825097, 1, 0, 0.972549, 1,
1.004839, 0.1965961, 1.571929, 1, 0, 0.9647059, 1,
1.006038, -0.9866225, 2.522685, 1, 0, 0.9607843, 1,
1.006182, -0.6936717, 2.601324, 1, 0, 0.9529412, 1,
1.011286, -1.713155, 3.747295, 1, 0, 0.9490196, 1,
1.01172, 0.1528797, 2.430108, 1, 0, 0.9411765, 1,
1.014576, -0.3389333, 2.857998, 1, 0, 0.9372549, 1,
1.015105, -1.608818, 1.556036, 1, 0, 0.9294118, 1,
1.032573, -2.384753, 4.665958, 1, 0, 0.9254902, 1,
1.035689, -1.611458, 2.607916, 1, 0, 0.9176471, 1,
1.037518, -1.032738, 2.695521, 1, 0, 0.9137255, 1,
1.038283, -1.086635, 1.377359, 1, 0, 0.9058824, 1,
1.038953, -0.6606768, 2.332104, 1, 0, 0.9019608, 1,
1.040991, -0.85453, 1.93714, 1, 0, 0.8941177, 1,
1.043538, 0.7042124, -0.8711646, 1, 0, 0.8862745, 1,
1.045468, -0.07510719, 3.712185, 1, 0, 0.8823529, 1,
1.045538, 0.4404293, 1.434517, 1, 0, 0.8745098, 1,
1.068905, 0.2308506, 1.529666, 1, 0, 0.8705882, 1,
1.071586, -0.3387275, 1.36301, 1, 0, 0.8627451, 1,
1.074685, 0.2692307, 3.462098, 1, 0, 0.8588235, 1,
1.075797, -0.2530947, 1.414841, 1, 0, 0.8509804, 1,
1.076512, -1.694203, 3.225574, 1, 0, 0.8470588, 1,
1.078105, 0.09803173, 1.51223, 1, 0, 0.8392157, 1,
1.078878, -0.1445959, 1.602107, 1, 0, 0.8352941, 1,
1.083816, 1.277814, 0.9650202, 1, 0, 0.827451, 1,
1.092494, 1.708109, 2.184645, 1, 0, 0.8235294, 1,
1.092829, 0.9440513, -1.829475, 1, 0, 0.8156863, 1,
1.092981, 1.07809, 0.1427942, 1, 0, 0.8117647, 1,
1.094261, 1.763554, 1.761034, 1, 0, 0.8039216, 1,
1.095114, 1.401197, -0.3977625, 1, 0, 0.7960784, 1,
1.110372, 0.4209638, 1.955844, 1, 0, 0.7921569, 1,
1.12325, 1.054628, 0.7232417, 1, 0, 0.7843137, 1,
1.125234, 0.8714111, 0.554206, 1, 0, 0.7803922, 1,
1.129376, -0.2499766, 2.235785, 1, 0, 0.772549, 1,
1.133348, 1.21747, 0.04837642, 1, 0, 0.7686275, 1,
1.134082, 1.16484, 0.7405749, 1, 0, 0.7607843, 1,
1.136671, 0.2856785, 0.862609, 1, 0, 0.7568628, 1,
1.139895, 0.9686282, 0.0812718, 1, 0, 0.7490196, 1,
1.14558, -1.365085, 2.366321, 1, 0, 0.7450981, 1,
1.152759, -0.03848532, 1.596561, 1, 0, 0.7372549, 1,
1.157829, -1.07655, 2.970205, 1, 0, 0.7333333, 1,
1.168342, -0.540966, 3.88554, 1, 0, 0.7254902, 1,
1.17435, -0.5818921, 1.31322, 1, 0, 0.7215686, 1,
1.1757, 0.09501558, 1.03652, 1, 0, 0.7137255, 1,
1.177225, 1.608178, -0.1304823, 1, 0, 0.7098039, 1,
1.180806, 0.9933673, 0.272856, 1, 0, 0.7019608, 1,
1.191849, 1.716646, -0.5145507, 1, 0, 0.6941177, 1,
1.193051, 2.254775, 0.1864044, 1, 0, 0.6901961, 1,
1.193348, -0.1144022, 0.7573885, 1, 0, 0.682353, 1,
1.201161, 1.162667, 1.282096, 1, 0, 0.6784314, 1,
1.212165, -0.2132448, 2.831875, 1, 0, 0.6705883, 1,
1.216972, -0.1480009, 1.854773, 1, 0, 0.6666667, 1,
1.231065, 1.205257, -0.4592395, 1, 0, 0.6588235, 1,
1.231513, 1.836109, 0.6462757, 1, 0, 0.654902, 1,
1.233464, -1.166965, 1.898926, 1, 0, 0.6470588, 1,
1.234322, -0.7480314, 1.684744, 1, 0, 0.6431373, 1,
1.236791, -0.4210994, 1.687729, 1, 0, 0.6352941, 1,
1.240597, 1.042807, 1.885317, 1, 0, 0.6313726, 1,
1.245043, -1.173173, 0.9527954, 1, 0, 0.6235294, 1,
1.249722, -0.3015456, 1.942054, 1, 0, 0.6196079, 1,
1.251563, -0.52558, 1.255497, 1, 0, 0.6117647, 1,
1.262383, -1.119322, 2.512519, 1, 0, 0.6078432, 1,
1.263342, 2.371099, -1.288703, 1, 0, 0.6, 1,
1.269569, -0.3247921, 2.756157, 1, 0, 0.5921569, 1,
1.275486, 0.1234381, 0.3850299, 1, 0, 0.5882353, 1,
1.279535, 0.1347274, 1.210115, 1, 0, 0.5803922, 1,
1.280011, 0.07917432, 1.812608, 1, 0, 0.5764706, 1,
1.283143, -0.3159965, 2.729614, 1, 0, 0.5686275, 1,
1.283835, -0.7378931, 1.41202, 1, 0, 0.5647059, 1,
1.291822, -0.1061271, 1.079929, 1, 0, 0.5568628, 1,
1.298617, 0.6108395, 1.235005, 1, 0, 0.5529412, 1,
1.305011, 0.03075237, 0.3263332, 1, 0, 0.5450981, 1,
1.314907, 1.202136, 0.9653555, 1, 0, 0.5411765, 1,
1.325421, -0.28343, 2.193715, 1, 0, 0.5333334, 1,
1.327833, 0.5129666, 0.8401972, 1, 0, 0.5294118, 1,
1.334281, 1.657728, 0.4883324, 1, 0, 0.5215687, 1,
1.341094, 0.4206332, 0.6731442, 1, 0, 0.5176471, 1,
1.341311, 0.1036005, 2.083763, 1, 0, 0.509804, 1,
1.352677, -1.671382, 2.979418, 1, 0, 0.5058824, 1,
1.357527, -0.04143034, 1.555602, 1, 0, 0.4980392, 1,
1.36508, 1.725037, -0.5304659, 1, 0, 0.4901961, 1,
1.370706, 2.170995, 0.7056071, 1, 0, 0.4862745, 1,
1.370929, -0.1603531, 2.425339, 1, 0, 0.4784314, 1,
1.376868, -0.2299695, 0.7742455, 1, 0, 0.4745098, 1,
1.378971, 0.02289793, -0.3314015, 1, 0, 0.4666667, 1,
1.388642, 0.09681427, 0.3959327, 1, 0, 0.4627451, 1,
1.389507, -1.438745, 2.709648, 1, 0, 0.454902, 1,
1.398189, -1.12998, 2.501773, 1, 0, 0.4509804, 1,
1.39991, -0.3871197, 2.323779, 1, 0, 0.4431373, 1,
1.418413, 0.8297452, 0.5841128, 1, 0, 0.4392157, 1,
1.420738, -0.9144654, 1.994346, 1, 0, 0.4313726, 1,
1.427734, -0.5463222, 2.861643, 1, 0, 0.427451, 1,
1.435438, 1.168584, 3.077723, 1, 0, 0.4196078, 1,
1.436322, -0.07770389, 0.6812286, 1, 0, 0.4156863, 1,
1.454866, 0.8842044, -0.1762852, 1, 0, 0.4078431, 1,
1.486433, 0.3455879, 0.4200717, 1, 0, 0.4039216, 1,
1.494002, -0.7479146, 1.841824, 1, 0, 0.3960784, 1,
1.536491, 1.453092, 1.092973, 1, 0, 0.3882353, 1,
1.54798, -2.731159, 2.549383, 1, 0, 0.3843137, 1,
1.548604, 1.763113, -0.4816929, 1, 0, 0.3764706, 1,
1.548737, 0.2958545, 0.6265723, 1, 0, 0.372549, 1,
1.586648, -0.6199412, 3.067738, 1, 0, 0.3647059, 1,
1.587488, 0.002368533, 1.493494, 1, 0, 0.3607843, 1,
1.598036, -0.7042946, 1.02, 1, 0, 0.3529412, 1,
1.619555, -0.6855342, 2.215342, 1, 0, 0.3490196, 1,
1.623799, 1.656236, -0.1998691, 1, 0, 0.3411765, 1,
1.639107, -0.5950635, 1.574478, 1, 0, 0.3372549, 1,
1.663809, -1.164068, 0.257279, 1, 0, 0.3294118, 1,
1.680757, 0.3617911, -0.2228974, 1, 0, 0.3254902, 1,
1.724716, -0.6260847, -0.0971456, 1, 0, 0.3176471, 1,
1.738321, 0.8011555, 1.449676, 1, 0, 0.3137255, 1,
1.740169, -0.5960301, 2.247965, 1, 0, 0.3058824, 1,
1.745622, 0.8900741, 1.291119, 1, 0, 0.2980392, 1,
1.749662, 1.679244, 1.328264, 1, 0, 0.2941177, 1,
1.749691, 1.20008, 1.185658, 1, 0, 0.2862745, 1,
1.762076, -0.5597073, 1.98146, 1, 0, 0.282353, 1,
1.779298, -1.595074, 1.466343, 1, 0, 0.2745098, 1,
1.785104, 0.8894339, -0.8185455, 1, 0, 0.2705882, 1,
1.787173, -0.4434307, 1.188399, 1, 0, 0.2627451, 1,
1.791849, -0.6863596, 2.796346, 1, 0, 0.2588235, 1,
1.79751, 1.178713, 1.747196, 1, 0, 0.2509804, 1,
1.827727, 0.2462192, 2.280025, 1, 0, 0.2470588, 1,
1.850715, -1.315705, 1.371026, 1, 0, 0.2392157, 1,
1.858505, 2.235527, 1.308223, 1, 0, 0.2352941, 1,
1.858692, 0.5151549, 1.202917, 1, 0, 0.227451, 1,
1.863848, -0.2697717, 1.376735, 1, 0, 0.2235294, 1,
1.868316, 0.9951243, -0.0348333, 1, 0, 0.2156863, 1,
1.869779, -1.110006, 2.104671, 1, 0, 0.2117647, 1,
1.892516, 0.05025748, 1.316603, 1, 0, 0.2039216, 1,
1.908427, 2.135343, 2.349042, 1, 0, 0.1960784, 1,
1.908544, -0.8318186, 2.26159, 1, 0, 0.1921569, 1,
1.91526, 1.051212, 3.212932, 1, 0, 0.1843137, 1,
1.944957, 0.6710355, 1.423035, 1, 0, 0.1803922, 1,
1.95997, 0.8943921, 2.242543, 1, 0, 0.172549, 1,
1.970646, -0.6884022, 0.825679, 1, 0, 0.1686275, 1,
1.99471, 0.5704641, 1.483935, 1, 0, 0.1607843, 1,
1.999613, -0.2190727, 1.193654, 1, 0, 0.1568628, 1,
2.027262, 1.082537, 2.834145, 1, 0, 0.1490196, 1,
2.036083, -0.3857863, 0.4093689, 1, 0, 0.145098, 1,
2.051699, -0.3980522, 0.7172613, 1, 0, 0.1372549, 1,
2.065483, -0.108291, -0.6057317, 1, 0, 0.1333333, 1,
2.114766, -0.2059371, 2.160166, 1, 0, 0.1254902, 1,
2.183026, -1.083441, 0.9447016, 1, 0, 0.1215686, 1,
2.197583, 0.06094678, 0.5620896, 1, 0, 0.1137255, 1,
2.275887, 0.51022, -0.6960968, 1, 0, 0.1098039, 1,
2.312016, 0.5936078, -0.02973561, 1, 0, 0.1019608, 1,
2.333215, -1.572266, 2.039927, 1, 0, 0.09411765, 1,
2.356383, -0.4169373, 1.262192, 1, 0, 0.09019608, 1,
2.456322, 0.6468473, 0.708685, 1, 0, 0.08235294, 1,
2.456559, -2.120223, 2.298309, 1, 0, 0.07843138, 1,
2.497108, -1.58634, 1.682313, 1, 0, 0.07058824, 1,
2.528632, -0.09249313, 1.916473, 1, 0, 0.06666667, 1,
2.54972, 0.7859817, 1.542672, 1, 0, 0.05882353, 1,
2.570111, 0.4624289, 1.831811, 1, 0, 0.05490196, 1,
2.641513, -1.120257, 2.310343, 1, 0, 0.04705882, 1,
2.719054, -2.890099, 2.139566, 1, 0, 0.04313726, 1,
2.772463, 1.110837, 1.3105, 1, 0, 0.03529412, 1,
2.840988, 0.7317832, 0.3190336, 1, 0, 0.03137255, 1,
2.971935, 1.072373, 2.727429, 1, 0, 0.02352941, 1,
3.071514, 0.4974564, 1.147631, 1, 0, 0.01960784, 1,
3.120378, 0.2188308, 2.103276, 1, 0, 0.01176471, 1,
3.822277, -0.3654306, 0.8646534, 1, 0, 0.007843138, 1
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
0.2288028, -4.429413, -6.718787, 0, -0.5, 0.5, 0.5,
0.2288028, -4.429413, -6.718787, 1, -0.5, 0.5, 0.5,
0.2288028, -4.429413, -6.718787, 1, 1.5, 0.5, 0.5,
0.2288028, -4.429413, -6.718787, 0, 1.5, 0.5, 0.5
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
-4.582859, -0.3434399, -6.718787, 0, -0.5, 0.5, 0.5,
-4.582859, -0.3434399, -6.718787, 1, -0.5, 0.5, 0.5,
-4.582859, -0.3434399, -6.718787, 1, 1.5, 0.5, 0.5,
-4.582859, -0.3434399, -6.718787, 0, 1.5, 0.5, 0.5
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
-4.582859, -4.429413, 0.1024916, 0, -0.5, 0.5, 0.5,
-4.582859, -4.429413, 0.1024916, 1, -0.5, 0.5, 0.5,
-4.582859, -4.429413, 0.1024916, 1, 1.5, 0.5, 0.5,
-4.582859, -4.429413, 0.1024916, 0, 1.5, 0.5, 0.5
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
-2, -3.486496, -5.144646,
2, -3.486496, -5.144646,
-2, -3.486496, -5.144646,
-2, -3.643649, -5.407002,
0, -3.486496, -5.144646,
0, -3.643649, -5.407002,
2, -3.486496, -5.144646,
2, -3.643649, -5.407002
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
-2, -3.957955, -5.931716, 0, -0.5, 0.5, 0.5,
-2, -3.957955, -5.931716, 1, -0.5, 0.5, 0.5,
-2, -3.957955, -5.931716, 1, 1.5, 0.5, 0.5,
-2, -3.957955, -5.931716, 0, 1.5, 0.5, 0.5,
0, -3.957955, -5.931716, 0, -0.5, 0.5, 0.5,
0, -3.957955, -5.931716, 1, -0.5, 0.5, 0.5,
0, -3.957955, -5.931716, 1, 1.5, 0.5, 0.5,
0, -3.957955, -5.931716, 0, 1.5, 0.5, 0.5,
2, -3.957955, -5.931716, 0, -0.5, 0.5, 0.5,
2, -3.957955, -5.931716, 1, -0.5, 0.5, 0.5,
2, -3.957955, -5.931716, 1, 1.5, 0.5, 0.5,
2, -3.957955, -5.931716, 0, 1.5, 0.5, 0.5
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
-3.472476, -3, -5.144646,
-3.472476, 2, -5.144646,
-3.472476, -3, -5.144646,
-3.65754, -3, -5.407002,
-3.472476, -2, -5.144646,
-3.65754, -2, -5.407002,
-3.472476, -1, -5.144646,
-3.65754, -1, -5.407002,
-3.472476, 0, -5.144646,
-3.65754, 0, -5.407002,
-3.472476, 1, -5.144646,
-3.65754, 1, -5.407002,
-3.472476, 2, -5.144646,
-3.65754, 2, -5.407002
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
-4.027668, -3, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, -3, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, -3, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, -3, -5.931716, 0, 1.5, 0.5, 0.5,
-4.027668, -2, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, -2, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, -2, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, -2, -5.931716, 0, 1.5, 0.5, 0.5,
-4.027668, -1, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, -1, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, -1, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, -1, -5.931716, 0, 1.5, 0.5, 0.5,
-4.027668, 0, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, 0, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, 0, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, 0, -5.931716, 0, 1.5, 0.5, 0.5,
-4.027668, 1, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, 1, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, 1, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, 1, -5.931716, 0, 1.5, 0.5, 0.5,
-4.027668, 2, -5.931716, 0, -0.5, 0.5, 0.5,
-4.027668, 2, -5.931716, 1, -0.5, 0.5, 0.5,
-4.027668, 2, -5.931716, 1, 1.5, 0.5, 0.5,
-4.027668, 2, -5.931716, 0, 1.5, 0.5, 0.5
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
-3.472476, -3.486496, -4,
-3.472476, -3.486496, 4,
-3.472476, -3.486496, -4,
-3.65754, -3.643649, -4,
-3.472476, -3.486496, -2,
-3.65754, -3.643649, -2,
-3.472476, -3.486496, 0,
-3.65754, -3.643649, 0,
-3.472476, -3.486496, 2,
-3.65754, -3.643649, 2,
-3.472476, -3.486496, 4,
-3.65754, -3.643649, 4
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
-4.027668, -3.957955, -4, 0, -0.5, 0.5, 0.5,
-4.027668, -3.957955, -4, 1, -0.5, 0.5, 0.5,
-4.027668, -3.957955, -4, 1, 1.5, 0.5, 0.5,
-4.027668, -3.957955, -4, 0, 1.5, 0.5, 0.5,
-4.027668, -3.957955, -2, 0, -0.5, 0.5, 0.5,
-4.027668, -3.957955, -2, 1, -0.5, 0.5, 0.5,
-4.027668, -3.957955, -2, 1, 1.5, 0.5, 0.5,
-4.027668, -3.957955, -2, 0, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 0, 0, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 0, 1, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 0, 1, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 0, 0, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 2, 0, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 2, 1, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 2, 1, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 2, 0, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 4, 0, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 4, 1, -0.5, 0.5, 0.5,
-4.027668, -3.957955, 4, 1, 1.5, 0.5, 0.5,
-4.027668, -3.957955, 4, 0, 1.5, 0.5, 0.5
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
-3.472476, -3.486496, -5.144646,
-3.472476, 2.799617, -5.144646,
-3.472476, -3.486496, 5.349629,
-3.472476, 2.799617, 5.349629,
-3.472476, -3.486496, -5.144646,
-3.472476, -3.486496, 5.349629,
-3.472476, 2.799617, -5.144646,
-3.472476, 2.799617, 5.349629,
-3.472476, -3.486496, -5.144646,
3.930081, -3.486496, -5.144646,
-3.472476, -3.486496, 5.349629,
3.930081, -3.486496, 5.349629,
-3.472476, 2.799617, -5.144646,
3.930081, 2.799617, -5.144646,
-3.472476, 2.799617, 5.349629,
3.930081, 2.799617, 5.349629,
3.930081, -3.486496, -5.144646,
3.930081, 2.799617, -5.144646,
3.930081, -3.486496, 5.349629,
3.930081, 2.799617, 5.349629,
3.930081, -3.486496, -5.144646,
3.930081, -3.486496, 5.349629,
3.930081, 2.799617, -5.144646,
3.930081, 2.799617, 5.349629
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
var radius = 7.635042;
var distance = 33.96916;
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
mvMatrix.translate( -0.2288028, 0.3434399, -0.1024916 );
mvMatrix.scale( 1.115176, 1.313237, 0.7866344 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96916);
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
imazapyr<-read.table("imazapyr.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imazapyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'imazapyr' not found
```

```r
y<-imazapyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'imazapyr' not found
```

```r
z<-imazapyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'imazapyr' not found
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
-3.364671, -1.196017, -2.616114, 0, 0, 1, 1, 1,
-2.992465, -0.3464606, -2.763196, 1, 0, 0, 1, 1,
-2.949708, -0.6230034, -0.3804554, 1, 0, 0, 1, 1,
-2.701144, -0.7930362, -1.861999, 1, 0, 0, 1, 1,
-2.646136, 0.3370782, -0.5511624, 1, 0, 0, 1, 1,
-2.632497, 1.571222, -0.8005406, 1, 0, 0, 1, 1,
-2.609525, -0.2825989, -1.933025, 0, 0, 0, 1, 1,
-2.5139, -1.321219, -1.563742, 0, 0, 0, 1, 1,
-2.449435, -2.100223, -1.667272, 0, 0, 0, 1, 1,
-2.449162, -0.5605417, -1.718818, 0, 0, 0, 1, 1,
-2.428266, -0.3125571, -1.996478, 0, 0, 0, 1, 1,
-2.333351, 1.258827, -0.1310142, 0, 0, 0, 1, 1,
-2.318114, 0.5426211, -1.28217, 0, 0, 0, 1, 1,
-2.314906, 0.2177348, 0.3080218, 1, 1, 1, 1, 1,
-2.270539, 0.06879451, -1.502869, 1, 1, 1, 1, 1,
-2.263683, -0.4684609, -0.9678453, 1, 1, 1, 1, 1,
-2.194702, -0.2353591, -1.627243, 1, 1, 1, 1, 1,
-2.158371, -0.9786992, -2.554594, 1, 1, 1, 1, 1,
-2.116701, 0.4569227, -0.8901504, 1, 1, 1, 1, 1,
-2.083889, -0.077989, -0.8006315, 1, 1, 1, 1, 1,
-2.082031, 0.2943736, -1.337049, 1, 1, 1, 1, 1,
-2.070632, -1.138066, -1.925838, 1, 1, 1, 1, 1,
-2.038181, 1.263397, -0.5312096, 1, 1, 1, 1, 1,
-2.013126, -0.7850004, -1.277161, 1, 1, 1, 1, 1,
-1.984507, -1.269001, -1.050051, 1, 1, 1, 1, 1,
-1.94375, 0.1964668, -1.13398, 1, 1, 1, 1, 1,
-1.942544, 1.73423, -1.667953, 1, 1, 1, 1, 1,
-1.936703, -0.0143741, -0.5533664, 1, 1, 1, 1, 1,
-1.917665, 0.9094751, -1.371213, 0, 0, 1, 1, 1,
-1.917052, -1.048158, -2.420281, 1, 0, 0, 1, 1,
-1.899743, 0.365033, -0.471805, 1, 0, 0, 1, 1,
-1.898408, -0.16222, -0.9357762, 1, 0, 0, 1, 1,
-1.893765, 1.236436, -0.8236806, 1, 0, 0, 1, 1,
-1.878756, 0.9838713, -1.726218, 1, 0, 0, 1, 1,
-1.877411, 0.1043926, -2.03295, 0, 0, 0, 1, 1,
-1.871395, -0.7616149, -0.8029678, 0, 0, 0, 1, 1,
-1.839543, -0.6340878, -0.8967687, 0, 0, 0, 1, 1,
-1.825483, 2.319073, -1.395849, 0, 0, 0, 1, 1,
-1.793122, 0.6988467, -0.08886079, 0, 0, 0, 1, 1,
-1.767554, 1.084002, -2.950108, 0, 0, 0, 1, 1,
-1.760237, -1.28656, -1.880507, 0, 0, 0, 1, 1,
-1.736086, -0.9508396, -2.938546, 1, 1, 1, 1, 1,
-1.735076, 0.4333696, -0.2725111, 1, 1, 1, 1, 1,
-1.733024, -1.213295, -2.949295, 1, 1, 1, 1, 1,
-1.72262, -2.184745, -2.767888, 1, 1, 1, 1, 1,
-1.718571, -0.1672034, -2.628978, 1, 1, 1, 1, 1,
-1.688735, 0.7266223, -2.649048, 1, 1, 1, 1, 1,
-1.68451, 0.06639429, -0.5267327, 1, 1, 1, 1, 1,
-1.682357, -1.739537, -3.026765, 1, 1, 1, 1, 1,
-1.681022, -0.5977958, -3.444938, 1, 1, 1, 1, 1,
-1.66929, 0.8140768, -0.8720174, 1, 1, 1, 1, 1,
-1.661578, -0.06502499, -2.296102, 1, 1, 1, 1, 1,
-1.658489, -0.06467824, -2.46435, 1, 1, 1, 1, 1,
-1.642931, 0.109811, -1.668523, 1, 1, 1, 1, 1,
-1.641517, -0.3345395, -1.475259, 1, 1, 1, 1, 1,
-1.591483, -0.4916459, -0.6241476, 1, 1, 1, 1, 1,
-1.586359, 0.3809437, 0.1128003, 0, 0, 1, 1, 1,
-1.583943, -0.6691538, -0.8595775, 1, 0, 0, 1, 1,
-1.580727, -0.888453, -1.18633, 1, 0, 0, 1, 1,
-1.578327, -0.9999079, -3.201883, 1, 0, 0, 1, 1,
-1.577026, 0.8345982, 0.02256362, 1, 0, 0, 1, 1,
-1.571574, 0.1216487, -2.467701, 1, 0, 0, 1, 1,
-1.567299, 0.03673337, -1.351138, 0, 0, 0, 1, 1,
-1.552478, -0.7635906, -4.287989, 0, 0, 0, 1, 1,
-1.548005, -1.560674, -1.183858, 0, 0, 0, 1, 1,
-1.547061, 0.05181617, -1.019878, 0, 0, 0, 1, 1,
-1.544479, 0.1982019, -1.954681, 0, 0, 0, 1, 1,
-1.532897, -2.936716, -2.375892, 0, 0, 0, 1, 1,
-1.525229, -1.11541, -2.272959, 0, 0, 0, 1, 1,
-1.513493, -1.412702, -1.893575, 1, 1, 1, 1, 1,
-1.508181, 1.12461, -1.837255, 1, 1, 1, 1, 1,
-1.508008, 0.2103744, -2.678141, 1, 1, 1, 1, 1,
-1.497862, -1.256006, -0.4122056, 1, 1, 1, 1, 1,
-1.479172, 1.122153, -1.321748, 1, 1, 1, 1, 1,
-1.470298, 1.188721, -1.761746, 1, 1, 1, 1, 1,
-1.461176, -1.895223, -3.099814, 1, 1, 1, 1, 1,
-1.456579, 0.7142797, -1.608278, 1, 1, 1, 1, 1,
-1.456328, -1.15057, -1.867014, 1, 1, 1, 1, 1,
-1.437599, 0.06426596, -1.424808, 1, 1, 1, 1, 1,
-1.431209, -1.527336, -2.089375, 1, 1, 1, 1, 1,
-1.430364, 0.2284125, -1.639823, 1, 1, 1, 1, 1,
-1.419935, 0.1743935, -2.004586, 1, 1, 1, 1, 1,
-1.418086, -1.468153, -2.329003, 1, 1, 1, 1, 1,
-1.402064, 0.301704, -2.131492, 1, 1, 1, 1, 1,
-1.398991, 0.6456715, -1.429763, 0, 0, 1, 1, 1,
-1.396566, 0.5596138, -0.2090743, 1, 0, 0, 1, 1,
-1.394015, -0.2269256, -0.1054248, 1, 0, 0, 1, 1,
-1.391298, -0.4603364, -3.096398, 1, 0, 0, 1, 1,
-1.389156, 0.3552432, -2.138502, 1, 0, 0, 1, 1,
-1.373615, 0.4996936, -0.8077305, 1, 0, 0, 1, 1,
-1.362963, -1.437916, -2.027225, 0, 0, 0, 1, 1,
-1.358044, 0.3565207, -2.168843, 0, 0, 0, 1, 1,
-1.35161, -0.1394553, -2.031087, 0, 0, 0, 1, 1,
-1.347972, -2.036432, -2.073803, 0, 0, 0, 1, 1,
-1.322498, -0.7497489, -1.042327, 0, 0, 0, 1, 1,
-1.28436, -0.3140842, -1.409371, 0, 0, 0, 1, 1,
-1.283951, -0.3477236, -2.182478, 0, 0, 0, 1, 1,
-1.282936, -0.6200976, -1.33542, 1, 1, 1, 1, 1,
-1.271832, -0.3030996, -1.687653, 1, 1, 1, 1, 1,
-1.26628, 1.081171, -1.605242, 1, 1, 1, 1, 1,
-1.265133, -0.3183881, 0.1984993, 1, 1, 1, 1, 1,
-1.260675, -0.003156881, -0.3510486, 1, 1, 1, 1, 1,
-1.248878, -0.2116418, -1.38082, 1, 1, 1, 1, 1,
-1.240936, 0.02334309, -1.303566, 1, 1, 1, 1, 1,
-1.239349, 1.069664, -2.156348, 1, 1, 1, 1, 1,
-1.225602, -0.02143408, -2.343254, 1, 1, 1, 1, 1,
-1.225217, -1.203337, -1.554415, 1, 1, 1, 1, 1,
-1.221654, 0.5518475, -1.138654, 1, 1, 1, 1, 1,
-1.211003, 1.382609, -0.4505104, 1, 1, 1, 1, 1,
-1.204546, -1.643525, -1.982836, 1, 1, 1, 1, 1,
-1.203839, -1.334558, -0.393053, 1, 1, 1, 1, 1,
-1.199642, -0.9092451, -3.059183, 1, 1, 1, 1, 1,
-1.199515, -1.644683, -2.085643, 0, 0, 1, 1, 1,
-1.197955, -0.4902819, -2.416116, 1, 0, 0, 1, 1,
-1.192823, 0.8576193, -1.379872, 1, 0, 0, 1, 1,
-1.182957, -0.03840224, -1.303774, 1, 0, 0, 1, 1,
-1.164238, 1.733983, -0.2961833, 1, 0, 0, 1, 1,
-1.153337, 2.408536, -0.6033551, 1, 0, 0, 1, 1,
-1.147161, 1.064584, -1.369153, 0, 0, 0, 1, 1,
-1.144089, -0.0406115, -3.489381, 0, 0, 0, 1, 1,
-1.131012, -0.477396, -2.212013, 0, 0, 0, 1, 1,
-1.127172, 0.9096759, -2.925246, 0, 0, 0, 1, 1,
-1.120686, 0.6542441, -1.268742, 0, 0, 0, 1, 1,
-1.111888, -1.56036, -0.6373252, 0, 0, 0, 1, 1,
-1.111721, -0.5518631, -1.108149, 0, 0, 0, 1, 1,
-1.111617, -0.2834913, -2.66768, 1, 1, 1, 1, 1,
-1.103742, -0.576099, -0.7445517, 1, 1, 1, 1, 1,
-1.093335, -0.261317, -2.096311, 1, 1, 1, 1, 1,
-1.088507, 0.2756259, -2.4156, 1, 1, 1, 1, 1,
-1.0841, -0.06028883, -2.424362, 1, 1, 1, 1, 1,
-1.081031, -0.7182663, -2.923063, 1, 1, 1, 1, 1,
-1.079615, 0.4993814, -0.07597721, 1, 1, 1, 1, 1,
-1.076163, 1.376495, 0.3689212, 1, 1, 1, 1, 1,
-1.073342, 0.6234285, -1.319621, 1, 1, 1, 1, 1,
-1.060401, -0.8654519, -4.10179, 1, 1, 1, 1, 1,
-1.056983, 0.2310759, -1.615242, 1, 1, 1, 1, 1,
-1.050709, -0.0433131, -3.379983, 1, 1, 1, 1, 1,
-1.05053, 0.5459071, 0.3913405, 1, 1, 1, 1, 1,
-1.04583, 0.8894507, 0.6952325, 1, 1, 1, 1, 1,
-1.04496, 2.336981, -0.02584258, 1, 1, 1, 1, 1,
-1.042552, -2.110695, -2.516825, 0, 0, 1, 1, 1,
-1.037748, -3.323414, -2.304191, 1, 0, 0, 1, 1,
-1.034965, -0.08345938, -0.5191983, 1, 0, 0, 1, 1,
-1.02641, 0.6176497, -1.118637, 1, 0, 0, 1, 1,
-1.02231, 0.4321705, -2.461198, 1, 0, 0, 1, 1,
-1.021826, 0.3666558, -2.723701, 1, 0, 0, 1, 1,
-1.019508, -0.4916163, -2.799885, 0, 0, 0, 1, 1,
-1.018128, 2.232058, 0.9301152, 0, 0, 0, 1, 1,
-1.017231, -0.3847815, -0.5704563, 0, 0, 0, 1, 1,
-1.017064, -0.08168699, -1.228472, 0, 0, 0, 1, 1,
-1.010753, 0.997244, -2.131493, 0, 0, 0, 1, 1,
-1.009376, -1.008386, -3.753791, 0, 0, 0, 1, 1,
-1.008456, -1.547841, -3.52924, 0, 0, 0, 1, 1,
-1.005654, -0.9839688, -1.315049, 1, 1, 1, 1, 1,
-1.00494, -0.6862348, -2.421805, 1, 1, 1, 1, 1,
-1.001018, 0.8926191, -1.072798, 1, 1, 1, 1, 1,
-0.9984673, -1.919927, -4.012698, 1, 1, 1, 1, 1,
-0.9948504, 0.8201378, -0.1050951, 1, 1, 1, 1, 1,
-0.9915488, -1.556386, -2.577976, 1, 1, 1, 1, 1,
-0.9894212, 0.5587664, -0.9117367, 1, 1, 1, 1, 1,
-0.9861352, 0.09828317, -1.464705, 1, 1, 1, 1, 1,
-0.9846458, 0.9857455, 1.031367, 1, 1, 1, 1, 1,
-0.9793425, 0.3102876, -2.68576, 1, 1, 1, 1, 1,
-0.9777507, -0.01447479, -0.7346756, 1, 1, 1, 1, 1,
-0.9759761, -0.3998004, -1.087286, 1, 1, 1, 1, 1,
-0.9732937, -0.2617449, -3.759818, 1, 1, 1, 1, 1,
-0.9709346, 1.384297, -1.138196, 1, 1, 1, 1, 1,
-0.9667273, 0.6806365, -0.2350345, 1, 1, 1, 1, 1,
-0.9619005, 0.473978, -1.31296, 0, 0, 1, 1, 1,
-0.9575249, -1.288329, -3.026038, 1, 0, 0, 1, 1,
-0.9491112, -0.7785693, -1.794658, 1, 0, 0, 1, 1,
-0.9467053, 1.352938, 0.6858701, 1, 0, 0, 1, 1,
-0.9419351, -1.057961, -2.593919, 1, 0, 0, 1, 1,
-0.9417132, -1.276347, -1.001872, 1, 0, 0, 1, 1,
-0.9416811, -1.427888, -2.410429, 0, 0, 0, 1, 1,
-0.9350846, -0.6315792, -1.457235, 0, 0, 0, 1, 1,
-0.9347867, 0.8948937, -0.3703774, 0, 0, 0, 1, 1,
-0.9240188, -0.3142923, -1.081603, 0, 0, 0, 1, 1,
-0.9202915, 0.3441826, -2.039301, 0, 0, 0, 1, 1,
-0.9157236, 0.7718127, -0.7619054, 0, 0, 0, 1, 1,
-0.9129431, 0.2235621, -2.957066, 0, 0, 0, 1, 1,
-0.8991784, -3.394951, -2.076089, 1, 1, 1, 1, 1,
-0.8890192, -2.42466, -3.6, 1, 1, 1, 1, 1,
-0.8877689, 0.6953175, -1.185363, 1, 1, 1, 1, 1,
-0.8838477, 0.2387932, -2.1896, 1, 1, 1, 1, 1,
-0.8778369, -0.1938559, -3.28304, 1, 1, 1, 1, 1,
-0.8761065, -0.2384774, -1.210569, 1, 1, 1, 1, 1,
-0.8748818, 0.1394492, -1.222476, 1, 1, 1, 1, 1,
-0.8690554, -0.2834645, -1.705509, 1, 1, 1, 1, 1,
-0.8685702, 1.023092, -1.040162, 1, 1, 1, 1, 1,
-0.8681263, 1.269307, -1.36669, 1, 1, 1, 1, 1,
-0.8665356, 1.392817, -1.69699, 1, 1, 1, 1, 1,
-0.8519714, 0.2857316, -2.117779, 1, 1, 1, 1, 1,
-0.8487213, -1.156653, -2.243276, 1, 1, 1, 1, 1,
-0.8481009, -0.683975, -4.707846, 1, 1, 1, 1, 1,
-0.8450733, 1.156003, -0.6603757, 1, 1, 1, 1, 1,
-0.8394576, -0.01607661, -1.701206, 0, 0, 1, 1, 1,
-0.8370994, -0.2214937, -1.59232, 1, 0, 0, 1, 1,
-0.8365034, -1.982719, -3.069433, 1, 0, 0, 1, 1,
-0.8326327, -0.7714071, -2.373017, 1, 0, 0, 1, 1,
-0.8297611, -1.048442, -2.831485, 1, 0, 0, 1, 1,
-0.8252299, 0.2499269, -0.8681424, 1, 0, 0, 1, 1,
-0.8247585, -0.9390044, -2.703146, 0, 0, 0, 1, 1,
-0.8231064, 0.03578263, -1.832817, 0, 0, 0, 1, 1,
-0.8222022, 1.063681, -1.750393, 0, 0, 0, 1, 1,
-0.8215486, 1.388792, 0.3786305, 0, 0, 0, 1, 1,
-0.8170776, -0.520888, -2.671451, 0, 0, 0, 1, 1,
-0.8052922, 0.2987329, -2.147657, 0, 0, 0, 1, 1,
-0.8028084, -1.768243, -1.593136, 0, 0, 0, 1, 1,
-0.7966021, 0.9357449, -0.06808767, 1, 1, 1, 1, 1,
-0.7921262, 1.455431, -1.668476, 1, 1, 1, 1, 1,
-0.791934, 0.1798839, -2.626763, 1, 1, 1, 1, 1,
-0.7902992, -1.165196, -4.036514, 1, 1, 1, 1, 1,
-0.7900318, -0.1879709, -2.310095, 1, 1, 1, 1, 1,
-0.7858801, -0.9038556, -2.049345, 1, 1, 1, 1, 1,
-0.7841996, 0.1747556, 0.05084065, 1, 1, 1, 1, 1,
-0.7778751, 0.4382603, -0.4156486, 1, 1, 1, 1, 1,
-0.777873, 0.3454207, -1.842346, 1, 1, 1, 1, 1,
-0.7751774, 1.31053, -0.7899832, 1, 1, 1, 1, 1,
-0.7722706, -1.492806, -1.360277, 1, 1, 1, 1, 1,
-0.771677, 0.5577196, -1.313739, 1, 1, 1, 1, 1,
-0.771131, 0.040006, -1.127455, 1, 1, 1, 1, 1,
-0.7696694, 0.5300093, -0.1677483, 1, 1, 1, 1, 1,
-0.7682541, -0.333493, -1.143519, 1, 1, 1, 1, 1,
-0.763945, 0.8337755, 1.782772, 0, 0, 1, 1, 1,
-0.7633961, 1.713556, -0.4676924, 1, 0, 0, 1, 1,
-0.7609012, -0.8084688, -1.039284, 1, 0, 0, 1, 1,
-0.7579788, -0.3203002, -0.09931055, 1, 0, 0, 1, 1,
-0.756631, 0.06173277, -1.745326, 1, 0, 0, 1, 1,
-0.7553504, -1.576307, -3.469716, 1, 0, 0, 1, 1,
-0.746771, -0.1492297, -1.879568, 0, 0, 0, 1, 1,
-0.746499, 0.5513831, -2.165073, 0, 0, 0, 1, 1,
-0.7447112, -0.3026301, -1.79208, 0, 0, 0, 1, 1,
-0.7382221, -1.823635, -2.87607, 0, 0, 0, 1, 1,
-0.734223, 1.395985, -1.8573, 0, 0, 0, 1, 1,
-0.7309446, 0.7361457, 1.102667, 0, 0, 0, 1, 1,
-0.7302496, -1.83855, -1.57441, 0, 0, 0, 1, 1,
-0.7270041, 0.5404753, -1.761964, 1, 1, 1, 1, 1,
-0.7266941, 0.02064441, -3.000489, 1, 1, 1, 1, 1,
-0.7250723, 0.139516, -1.802101, 1, 1, 1, 1, 1,
-0.7133968, -0.4570347, -3.609371, 1, 1, 1, 1, 1,
-0.7111911, -0.4027046, -2.179088, 1, 1, 1, 1, 1,
-0.7100456, -1.42237, -1.57974, 1, 1, 1, 1, 1,
-0.7098401, -0.4786137, -1.052669, 1, 1, 1, 1, 1,
-0.7095439, -2.431335, -4.991817, 1, 1, 1, 1, 1,
-0.7081704, -0.4467334, -2.408083, 1, 1, 1, 1, 1,
-0.7073134, -0.9045429, -2.671566, 1, 1, 1, 1, 1,
-0.7071342, 1.092741, -0.8769239, 1, 1, 1, 1, 1,
-0.7026331, 0.9718389, -2.004482, 1, 1, 1, 1, 1,
-0.6937529, 2.121912, -0.5590796, 1, 1, 1, 1, 1,
-0.6919191, 0.5234951, -2.477177, 1, 1, 1, 1, 1,
-0.6898816, -0.2988533, -3.098972, 1, 1, 1, 1, 1,
-0.6888023, -1.280835, -2.145431, 0, 0, 1, 1, 1,
-0.6843745, 0.2258298, -0.1899341, 1, 0, 0, 1, 1,
-0.6839821, -1.017823, -1.859921, 1, 0, 0, 1, 1,
-0.6819762, 1.640285, -0.3204577, 1, 0, 0, 1, 1,
-0.6815651, -1.740189, -2.257477, 1, 0, 0, 1, 1,
-0.6806399, 1.223613, -2.693524, 1, 0, 0, 1, 1,
-0.6774575, 0.492383, -1.835498, 0, 0, 0, 1, 1,
-0.676717, 1.005279, -2.737954, 0, 0, 0, 1, 1,
-0.6737722, -0.6213005, -2.302465, 0, 0, 0, 1, 1,
-0.6675535, 0.07014132, -2.089882, 0, 0, 0, 1, 1,
-0.6671425, -0.5282946, -3.073894, 0, 0, 0, 1, 1,
-0.6648112, -1.375831, -3.488932, 0, 0, 0, 1, 1,
-0.6642893, -0.03754945, -2.337705, 0, 0, 0, 1, 1,
-0.6638679, -2.101237, -1.874389, 1, 1, 1, 1, 1,
-0.6619168, -0.739177, -3.16541, 1, 1, 1, 1, 1,
-0.6484711, 0.2198314, 0.1664848, 1, 1, 1, 1, 1,
-0.6431033, -0.4189096, -3.134989, 1, 1, 1, 1, 1,
-0.6332765, -1.11562, -1.161701, 1, 1, 1, 1, 1,
-0.6296414, -1.603593, -2.428031, 1, 1, 1, 1, 1,
-0.6293943, 0.6893259, -0.105555, 1, 1, 1, 1, 1,
-0.6293907, 0.2643408, -0.8647603, 1, 1, 1, 1, 1,
-0.6286414, -1.015976, -2.928394, 1, 1, 1, 1, 1,
-0.6260492, 0.2236797, -0.3008475, 1, 1, 1, 1, 1,
-0.6258386, -0.1320677, -1.544884, 1, 1, 1, 1, 1,
-0.6247995, 0.3077164, 0.04663367, 1, 1, 1, 1, 1,
-0.6238722, 0.03577958, -1.290669, 1, 1, 1, 1, 1,
-0.6222752, -0.3455817, -0.4880567, 1, 1, 1, 1, 1,
-0.6207402, 1.469116, 0.184246, 1, 1, 1, 1, 1,
-0.6197912, 0.5408459, 2.014115, 0, 0, 1, 1, 1,
-0.6183552, 1.030064, -1.609962, 1, 0, 0, 1, 1,
-0.6086418, 0.6717923, -0.4781918, 1, 0, 0, 1, 1,
-0.6057255, 0.6445682, 0.3220597, 1, 0, 0, 1, 1,
-0.6037246, -1.091075, -3.399381, 1, 0, 0, 1, 1,
-0.6004678, 1.959696, 0.1704618, 1, 0, 0, 1, 1,
-0.6004365, 0.9082208, -1.038896, 0, 0, 0, 1, 1,
-0.5984555, -1.503511, -3.487036, 0, 0, 0, 1, 1,
-0.5964187, -0.7719944, -3.687405, 0, 0, 0, 1, 1,
-0.5840712, -0.468049, -1.732133, 0, 0, 0, 1, 1,
-0.5788987, 1.267303, -1.46992, 0, 0, 0, 1, 1,
-0.5690147, 0.4809209, -0.2098385, 0, 0, 0, 1, 1,
-0.5688959, 0.3441004, -1.32726, 0, 0, 0, 1, 1,
-0.5685206, 1.044623, -0.6632925, 1, 1, 1, 1, 1,
-0.5683603, -1.874097, -1.825962, 1, 1, 1, 1, 1,
-0.5588949, -0.434598, -3.587292, 1, 1, 1, 1, 1,
-0.5578857, 0.3239625, -0.6555665, 1, 1, 1, 1, 1,
-0.5575696, 0.1418213, -0.3767934, 1, 1, 1, 1, 1,
-0.5573151, -0.6186661, -2.701909, 1, 1, 1, 1, 1,
-0.5553029, 1.394357, 0.6069704, 1, 1, 1, 1, 1,
-0.5497031, -0.08824889, -1.376899, 1, 1, 1, 1, 1,
-0.5487701, 0.5239427, -0.6925874, 1, 1, 1, 1, 1,
-0.5486251, -1.857589, -1.60286, 1, 1, 1, 1, 1,
-0.5442664, 1.372119, -2.216164, 1, 1, 1, 1, 1,
-0.5349477, 0.1861714, -0.4300597, 1, 1, 1, 1, 1,
-0.5334581, -1.449918, -3.294052, 1, 1, 1, 1, 1,
-0.5296522, 1.148205, -1.144235, 1, 1, 1, 1, 1,
-0.5273709, -1.304791, -3.237825, 1, 1, 1, 1, 1,
-0.5259683, 0.923634, -2.642819, 0, 0, 1, 1, 1,
-0.5247438, -1.703508, -3.939444, 1, 0, 0, 1, 1,
-0.5233854, 0.4481469, -0.4254233, 1, 0, 0, 1, 1,
-0.5048496, 0.7377906, -3.125385, 1, 0, 0, 1, 1,
-0.4901451, -1.067133, -2.818317, 1, 0, 0, 1, 1,
-0.4899984, 1.923866, 0.4833998, 1, 0, 0, 1, 1,
-0.4864958, 0.5087846, -0.2914425, 0, 0, 0, 1, 1,
-0.4864693, -0.8825367, -3.351009, 0, 0, 0, 1, 1,
-0.4856956, -1.111456, -2.695267, 0, 0, 0, 1, 1,
-0.4848888, -0.5640178, -2.126778, 0, 0, 0, 1, 1,
-0.484605, 0.2506774, -0.4463804, 0, 0, 0, 1, 1,
-0.4824097, -0.2273728, -1.892034, 0, 0, 0, 1, 1,
-0.4806625, -1.377189, -2.816144, 0, 0, 0, 1, 1,
-0.4795265, 0.4828591, 1.417202, 1, 1, 1, 1, 1,
-0.4769981, -0.1423621, -1.955549, 1, 1, 1, 1, 1,
-0.4766873, -0.9060035, -2.741088, 1, 1, 1, 1, 1,
-0.4739141, -1.461645, -0.459526, 1, 1, 1, 1, 1,
-0.4720024, 0.7800401, -1.620803, 1, 1, 1, 1, 1,
-0.4698502, -0.7715372, -2.90647, 1, 1, 1, 1, 1,
-0.4688282, 0.8620743, -1.117478, 1, 1, 1, 1, 1,
-0.4664877, -0.2652359, -0.06329928, 1, 1, 1, 1, 1,
-0.4656147, 0.5438011, -1.743079, 1, 1, 1, 1, 1,
-0.4620988, -0.4587043, -3.821932, 1, 1, 1, 1, 1,
-0.4555266, 1.107485, 0.809863, 1, 1, 1, 1, 1,
-0.4518794, 1.663243, 0.6402237, 1, 1, 1, 1, 1,
-0.4495524, 2.256094, -2.016699, 1, 1, 1, 1, 1,
-0.4492422, 1.682138, -1.159383, 1, 1, 1, 1, 1,
-0.4404491, 0.6608472, -1.583801, 1, 1, 1, 1, 1,
-0.4214554, -1.850241, -1.278017, 0, 0, 1, 1, 1,
-0.4153331, 1.478538, -2.19718, 1, 0, 0, 1, 1,
-0.410891, -0.1340463, -1.919625, 1, 0, 0, 1, 1,
-0.4080349, 0.7826383, -0.01017855, 1, 0, 0, 1, 1,
-0.4069827, -0.7745416, -1.48913, 1, 0, 0, 1, 1,
-0.4049462, -0.03865838, -1.738324, 1, 0, 0, 1, 1,
-0.4005631, 1.590899, 1.431165, 0, 0, 0, 1, 1,
-0.3982855, -0.3701718, -1.713585, 0, 0, 0, 1, 1,
-0.3965198, -0.06297277, -0.4352583, 0, 0, 0, 1, 1,
-0.3960185, -1.231139, -2.554145, 0, 0, 0, 1, 1,
-0.3904918, -2.528748, -2.021747, 0, 0, 0, 1, 1,
-0.3889432, -0.9468775, -2.252406, 0, 0, 0, 1, 1,
-0.3849596, -0.1734569, -2.615007, 0, 0, 0, 1, 1,
-0.3811446, -0.7486992, -4.093025, 1, 1, 1, 1, 1,
-0.3794135, -0.0738039, -1.560497, 1, 1, 1, 1, 1,
-0.3776135, 1.791345, -0.7687932, 1, 1, 1, 1, 1,
-0.3772239, 1.075762, -0.3742124, 1, 1, 1, 1, 1,
-0.3768301, -0.4757142, -2.539255, 1, 1, 1, 1, 1,
-0.3751563, 0.3741862, -2.441572, 1, 1, 1, 1, 1,
-0.3679613, 0.6192774, -0.7477194, 1, 1, 1, 1, 1,
-0.3650776, 0.5681741, -0.1891719, 1, 1, 1, 1, 1,
-0.3635096, -1.156611, -2.021273, 1, 1, 1, 1, 1,
-0.3599154, -2.467377, -2.035494, 1, 1, 1, 1, 1,
-0.3577715, 0.82621, -0.9091554, 1, 1, 1, 1, 1,
-0.3551835, -0.5434242, -3.392184, 1, 1, 1, 1, 1,
-0.3549761, 2.067396, 0.2828249, 1, 1, 1, 1, 1,
-0.3537974, 0.8485793, 0.963621, 1, 1, 1, 1, 1,
-0.3483406, 0.01327509, -2.06499, 1, 1, 1, 1, 1,
-0.346997, -0.5935172, -1.455554, 0, 0, 1, 1, 1,
-0.3463735, 0.907688, -1.707916, 1, 0, 0, 1, 1,
-0.3387367, -0.07099479, -2.299613, 1, 0, 0, 1, 1,
-0.3375258, 2.094789, -1.269885, 1, 0, 0, 1, 1,
-0.3365673, 0.5304157, 0.1019781, 1, 0, 0, 1, 1,
-0.3322346, -0.4061773, -3.364973, 1, 0, 0, 1, 1,
-0.332055, 1.27178, -3.000463, 0, 0, 0, 1, 1,
-0.331015, -0.3220905, -3.00677, 0, 0, 0, 1, 1,
-0.3280516, -0.5740293, -0.9341598, 0, 0, 0, 1, 1,
-0.3269218, 0.1783917, -1.915903, 0, 0, 0, 1, 1,
-0.3199502, 0.9406157, 2.400707, 0, 0, 0, 1, 1,
-0.3195451, -1.017672, -4.260048, 0, 0, 0, 1, 1,
-0.3192261, 1.619787, -0.3187033, 0, 0, 0, 1, 1,
-0.3162037, 0.4217691, -2.020604, 1, 1, 1, 1, 1,
-0.3117312, 1.656959, 0.3062799, 1, 1, 1, 1, 1,
-0.3094396, -0.6792006, -3.323881, 1, 1, 1, 1, 1,
-0.3091405, -0.5522704, -1.020146, 1, 1, 1, 1, 1,
-0.3084683, -1.19353, -1.117305, 1, 1, 1, 1, 1,
-0.308258, 2.386714, 0.8276497, 1, 1, 1, 1, 1,
-0.3068983, 0.01203055, -3.280883, 1, 1, 1, 1, 1,
-0.3061096, -0.3591694, -3.253724, 1, 1, 1, 1, 1,
-0.3053685, -2.376185, -2.038754, 1, 1, 1, 1, 1,
-0.2972745, 0.6303073, 0.4620637, 1, 1, 1, 1, 1,
-0.2964564, 0.3936332, 0.1673217, 1, 1, 1, 1, 1,
-0.2923283, -0.08145147, -1.522666, 1, 1, 1, 1, 1,
-0.2844479, 1.191132, -0.4227102, 1, 1, 1, 1, 1,
-0.2812556, 1.212837, -0.1356901, 1, 1, 1, 1, 1,
-0.2782656, -0.6970558, -3.430389, 1, 1, 1, 1, 1,
-0.2740829, -0.1318086, -2.164493, 0, 0, 1, 1, 1,
-0.2695193, 1.908844, -0.1484309, 1, 0, 0, 1, 1,
-0.267904, -0.4240315, -3.651172, 1, 0, 0, 1, 1,
-0.2671022, 1.196051, -0.4474455, 1, 0, 0, 1, 1,
-0.264626, -1.411121, -3.936712, 1, 0, 0, 1, 1,
-0.256514, 0.382805, -0.05888876, 1, 0, 0, 1, 1,
-0.2513782, -0.6346469, -3.496264, 0, 0, 0, 1, 1,
-0.2513676, 0.8355746, 1.156276, 0, 0, 0, 1, 1,
-0.2479697, -0.08180337, -2.590315, 0, 0, 0, 1, 1,
-0.246987, 0.5121755, -0.6092977, 0, 0, 0, 1, 1,
-0.2446706, -1.676716, -2.965541, 0, 0, 0, 1, 1,
-0.2430956, -1.002771, -2.299373, 0, 0, 0, 1, 1,
-0.2427865, 1.044533, 0.6224437, 0, 0, 0, 1, 1,
-0.238791, 2.708071, 1.057782, 1, 1, 1, 1, 1,
-0.2298351, 0.2649434, 1.897513, 1, 1, 1, 1, 1,
-0.2285516, -0.4484217, -2.474714, 1, 1, 1, 1, 1,
-0.2277818, -0.123691, -3.315693, 1, 1, 1, 1, 1,
-0.2276712, 0.3734328, 0.1089904, 1, 1, 1, 1, 1,
-0.2262904, -0.1503833, -2.763076, 1, 1, 1, 1, 1,
-0.2228948, -0.9773036, -1.752209, 1, 1, 1, 1, 1,
-0.2123238, 0.3581746, -0.5874939, 1, 1, 1, 1, 1,
-0.2115656, -0.6593328, -3.41182, 1, 1, 1, 1, 1,
-0.2072175, -0.8530397, -3.549625, 1, 1, 1, 1, 1,
-0.2070973, -1.627377, -4.150848, 1, 1, 1, 1, 1,
-0.2061219, 0.94973, 0.5392299, 1, 1, 1, 1, 1,
-0.2049089, -0.03190248, -0.5596793, 1, 1, 1, 1, 1,
-0.2034796, -1.24138, -4.225408, 1, 1, 1, 1, 1,
-0.2031589, -0.4112347, -2.949799, 1, 1, 1, 1, 1,
-0.199681, -0.07603337, -2.117141, 0, 0, 1, 1, 1,
-0.1990994, 0.6676397, -0.8864746, 1, 0, 0, 1, 1,
-0.1908972, -0.03779037, -2.936074, 1, 0, 0, 1, 1,
-0.1903203, 0.3528481, -1.071053, 1, 0, 0, 1, 1,
-0.1864915, 0.2028709, -1.803457, 1, 0, 0, 1, 1,
-0.184105, -1.049573, -4.116381, 1, 0, 0, 1, 1,
-0.1840926, -0.6182621, -2.143543, 0, 0, 0, 1, 1,
-0.1835542, 0.07489314, -0.5693572, 0, 0, 0, 1, 1,
-0.183148, 1.66771, 1.217058, 0, 0, 0, 1, 1,
-0.1825089, 0.1541415, 0.2946919, 0, 0, 0, 1, 1,
-0.1773504, 0.2653901, -1.808604, 0, 0, 0, 1, 1,
-0.1768625, 0.188476, 0.2887965, 0, 0, 0, 1, 1,
-0.1739561, -0.8716825, -3.652404, 0, 0, 0, 1, 1,
-0.1721956, -0.02335369, -3.045985, 1, 1, 1, 1, 1,
-0.1710797, -0.9812054, -3.731867, 1, 1, 1, 1, 1,
-0.1703232, -0.39734, -1.937374, 1, 1, 1, 1, 1,
-0.1660211, 1.147187, 0.8120776, 1, 1, 1, 1, 1,
-0.1652184, -1.982598, -3.003214, 1, 1, 1, 1, 1,
-0.1648368, 0.9977321, -0.4792823, 1, 1, 1, 1, 1,
-0.1626173, -0.4439076, -2.426521, 1, 1, 1, 1, 1,
-0.1619252, -0.3792872, -3.30778, 1, 1, 1, 1, 1,
-0.1614678, -0.5318413, -4.478672, 1, 1, 1, 1, 1,
-0.1585164, 0.2320894, 0.1540038, 1, 1, 1, 1, 1,
-0.1488298, -1.057304, -4.025597, 1, 1, 1, 1, 1,
-0.1471674, -0.6970631, -2.551516, 1, 1, 1, 1, 1,
-0.1451666, 1.307194, -0.7688312, 1, 1, 1, 1, 1,
-0.1430303, -1.05927, -3.251035, 1, 1, 1, 1, 1,
-0.1400989, 0.04776895, -0.4904534, 1, 1, 1, 1, 1,
-0.1321331, 1.905967, 0.3638135, 0, 0, 1, 1, 1,
-0.1284911, 0.428069, 0.8099378, 1, 0, 0, 1, 1,
-0.1224083, 0.5783671, 0.09845113, 1, 0, 0, 1, 1,
-0.1222984, -0.5136558, -2.204031, 1, 0, 0, 1, 1,
-0.1200633, -0.9534657, -2.479826, 1, 0, 0, 1, 1,
-0.1195832, 0.527072, 0.6563057, 1, 0, 0, 1, 1,
-0.1152705, -1.326482, -3.09898, 0, 0, 0, 1, 1,
-0.1125189, -1.722587, -3.995494, 0, 0, 0, 1, 1,
-0.108425, -0.5817103, -4.962015, 0, 0, 0, 1, 1,
-0.1077536, -1.789243, -3.767795, 0, 0, 0, 1, 1,
-0.1076224, -0.2265029, -1.856357, 0, 0, 0, 1, 1,
-0.09981482, 0.4109645, -0.3471793, 0, 0, 0, 1, 1,
-0.0987336, 0.9659831, -0.1726243, 0, 0, 0, 1, 1,
-0.09815079, -0.2323707, -2.598757, 1, 1, 1, 1, 1,
-0.09806072, 0.7157245, 1.359838, 1, 1, 1, 1, 1,
-0.08911441, -1.478902, -3.671768, 1, 1, 1, 1, 1,
-0.0850971, 1.408333, -0.28837, 1, 1, 1, 1, 1,
-0.08500791, -1.222278, -0.3200597, 1, 1, 1, 1, 1,
-0.08411746, 0.5566983, -1.353254, 1, 1, 1, 1, 1,
-0.08225933, -0.9372945, -1.340163, 1, 1, 1, 1, 1,
-0.08156469, -0.8245139, -3.366122, 1, 1, 1, 1, 1,
-0.08083159, 0.1594859, -0.3420455, 1, 1, 1, 1, 1,
-0.08044409, 0.1109097, -1.484562, 1, 1, 1, 1, 1,
-0.07921189, 1.516121, -0.1905684, 1, 1, 1, 1, 1,
-0.07879599, 2.437021, -1.661012, 1, 1, 1, 1, 1,
-0.07789598, -0.2915241, -2.480545, 1, 1, 1, 1, 1,
-0.07548992, -0.2070826, -3.685336, 1, 1, 1, 1, 1,
-0.07435366, 0.1127906, -0.5092049, 1, 1, 1, 1, 1,
-0.07177072, -1.164317, -3.015324, 0, 0, 1, 1, 1,
-0.07028717, 1.282097, -0.315835, 1, 0, 0, 1, 1,
-0.06390208, -0.2908235, -3.285916, 1, 0, 0, 1, 1,
-0.06086987, -0.4110466, -3.490422, 1, 0, 0, 1, 1,
-0.05968738, 0.6900206, 0.1806765, 1, 0, 0, 1, 1,
-0.05952327, -0.7528589, -2.888191, 1, 0, 0, 1, 1,
-0.05848206, -0.2687294, -2.749847, 0, 0, 0, 1, 1,
-0.05847766, -1.847206, -3.547136, 0, 0, 0, 1, 1,
-0.05774724, 0.2782587, 0.7215785, 0, 0, 0, 1, 1,
-0.05495003, 0.5154819, -1.844818, 0, 0, 0, 1, 1,
-0.05426927, -0.6322454, -3.866796, 0, 0, 0, 1, 1,
-0.05246343, -0.221553, -1.930004, 0, 0, 0, 1, 1,
-0.05242575, -1.251939, -4.204548, 0, 0, 0, 1, 1,
-0.05137161, -0.7159469, -0.7318406, 1, 1, 1, 1, 1,
-0.05076097, 0.436644, -1.458702, 1, 1, 1, 1, 1,
-0.04990477, -1.373811, -4.466097, 1, 1, 1, 1, 1,
-0.04956008, -0.3257639, -2.745947, 1, 1, 1, 1, 1,
-0.04487822, 0.6096604, 0.1476738, 1, 1, 1, 1, 1,
-0.04353738, -0.4915245, -3.793091, 1, 1, 1, 1, 1,
-0.04320392, 0.1327213, -0.9186089, 1, 1, 1, 1, 1,
-0.03603618, 0.3869067, -1.150836, 1, 1, 1, 1, 1,
-0.02450839, 1.679115, 0.002941428, 1, 1, 1, 1, 1,
-0.02180251, 0.6570673, 0.0329835, 1, 1, 1, 1, 1,
-0.02157799, 0.08231813, -0.7714317, 1, 1, 1, 1, 1,
-0.01874459, -0.7712912, -4.924186, 1, 1, 1, 1, 1,
-0.01828702, -0.7859758, -3.121641, 1, 1, 1, 1, 1,
-0.01608793, -0.4586929, -3.582681, 1, 1, 1, 1, 1,
-0.008821986, 0.6973361, -0.5839894, 1, 1, 1, 1, 1,
-0.008641803, 0.4777781, 0.9713892, 0, 0, 1, 1, 1,
-0.006668458, -0.2158252, -4.179574, 1, 0, 0, 1, 1,
-0.006498545, 0.1413473, 0.4758442, 1, 0, 0, 1, 1,
-0.001638333, 0.4767216, -0.9349412, 1, 0, 0, 1, 1,
-0.001222327, 0.3128838, 0.5409353, 1, 0, 0, 1, 1,
0.0001830154, 0.07329493, -0.9954458, 1, 0, 0, 1, 1,
0.001503089, 0.699867, -1.395638, 0, 0, 0, 1, 1,
0.009492403, -0.8671466, 2.909778, 0, 0, 0, 1, 1,
0.01055361, 0.2943659, -0.641224, 0, 0, 0, 1, 1,
0.01186239, -0.5299419, 2.617572, 0, 0, 0, 1, 1,
0.01430336, 0.1948949, 0.04590788, 0, 0, 0, 1, 1,
0.01511505, -0.2641246, 1.707723, 0, 0, 0, 1, 1,
0.01668099, 0.749436, -1.091798, 0, 0, 0, 1, 1,
0.0243277, -0.9924094, 3.028743, 1, 1, 1, 1, 1,
0.02675239, -0.02238788, 0.4386206, 1, 1, 1, 1, 1,
0.02816624, 1.128499, 0.3479433, 1, 1, 1, 1, 1,
0.02925598, -0.3027654, 2.412452, 1, 1, 1, 1, 1,
0.02941572, -0.9188448, 3.648139, 1, 1, 1, 1, 1,
0.03234101, -0.8330237, 3.575168, 1, 1, 1, 1, 1,
0.03631151, -1.412329, 1.755469, 1, 1, 1, 1, 1,
0.03988693, -0.2746247, 3.487528, 1, 1, 1, 1, 1,
0.05095683, 0.1148801, -0.5116059, 1, 1, 1, 1, 1,
0.05185206, 0.08353201, 0.4107792, 1, 1, 1, 1, 1,
0.05440504, 0.5168368, -1.452986, 1, 1, 1, 1, 1,
0.05865784, 0.1117695, 2.065362, 1, 1, 1, 1, 1,
0.06342457, 0.4911238, 0.3686803, 1, 1, 1, 1, 1,
0.0653385, 1.350182, 0.116721, 1, 1, 1, 1, 1,
0.07453731, 0.2270082, 0.2831905, 1, 1, 1, 1, 1,
0.0755007, -0.1105629, 2.293586, 0, 0, 1, 1, 1,
0.07568491, 1.075135, -1.056905, 1, 0, 0, 1, 1,
0.07766107, 0.2413305, 1.277426, 1, 0, 0, 1, 1,
0.08279457, -0.8855027, 3.682334, 1, 0, 0, 1, 1,
0.08395895, -2.016836, 3.600533, 1, 0, 0, 1, 1,
0.08577757, -0.4643114, 2.589153, 1, 0, 0, 1, 1,
0.08647607, 0.2298097, -0.1448606, 0, 0, 0, 1, 1,
0.101107, 0.2933763, 0.3274364, 0, 0, 0, 1, 1,
0.1084769, -0.522071, 2.783067, 0, 0, 0, 1, 1,
0.1116473, 0.1066473, 1.061723, 0, 0, 0, 1, 1,
0.1138299, 0.4609716, -0.5540614, 0, 0, 0, 1, 1,
0.1163267, 0.7069075, 1.031208, 0, 0, 0, 1, 1,
0.1189967, -0.5807893, 1.488186, 0, 0, 0, 1, 1,
0.1237274, 0.1674619, -0.1633985, 1, 1, 1, 1, 1,
0.1267268, -0.6286408, 1.645088, 1, 1, 1, 1, 1,
0.1421711, 0.1309506, 1.148304, 1, 1, 1, 1, 1,
0.1447791, 0.8563879, 0.1086047, 1, 1, 1, 1, 1,
0.1492978, 1.329121, -0.855627, 1, 1, 1, 1, 1,
0.1522259, 0.3559281, -0.404519, 1, 1, 1, 1, 1,
0.1536929, 0.716951, 1.171252, 1, 1, 1, 1, 1,
0.1550648, 0.7607093, -0.7887394, 1, 1, 1, 1, 1,
0.1594771, -1.846057, 3.791939, 1, 1, 1, 1, 1,
0.1609267, 0.08811241, -0.08304182, 1, 1, 1, 1, 1,
0.1610408, 0.512004, 3.08683, 1, 1, 1, 1, 1,
0.161456, 0.2552103, 2.860896, 1, 1, 1, 1, 1,
0.1699733, -1.68488, 3.209329, 1, 1, 1, 1, 1,
0.1725188, 0.7619764, 0.2850942, 1, 1, 1, 1, 1,
0.1733168, 0.2191569, 0.5999258, 1, 1, 1, 1, 1,
0.1737495, 1.158614, 0.6658037, 0, 0, 1, 1, 1,
0.1751999, 1.309272, 0.8053449, 1, 0, 0, 1, 1,
0.1759348, 1.211965, -0.5809122, 1, 0, 0, 1, 1,
0.1762641, 0.572592, 0.2129063, 1, 0, 0, 1, 1,
0.178665, 1.322862, 1.185036, 1, 0, 0, 1, 1,
0.1811867, 0.1799815, 2.553442, 1, 0, 0, 1, 1,
0.1816678, 0.3555667, 0.6141011, 0, 0, 0, 1, 1,
0.1843962, -1.60646, 1.461049, 0, 0, 0, 1, 1,
0.1859584, 1.278516, 0.3743332, 0, 0, 0, 1, 1,
0.1864251, -0.360761, 1.874815, 0, 0, 0, 1, 1,
0.1880869, 0.4003788, 0.8914823, 0, 0, 0, 1, 1,
0.191119, 0.5359025, -0.3069413, 0, 0, 0, 1, 1,
0.1920784, -0.7121203, 4.835941, 0, 0, 0, 1, 1,
0.1951527, 1.098824, -0.4662469, 1, 1, 1, 1, 1,
0.1967355, -1.079396, 3.652962, 1, 1, 1, 1, 1,
0.1990218, 1.020387, 0.02736014, 1, 1, 1, 1, 1,
0.199784, 0.4207455, 1.510337, 1, 1, 1, 1, 1,
0.2033395, 1.5074, -0.9735408, 1, 1, 1, 1, 1,
0.2038313, -0.7563434, 2.44142, 1, 1, 1, 1, 1,
0.2047254, -0.7678441, 3.559171, 1, 1, 1, 1, 1,
0.2070733, -0.2263842, 1.904213, 1, 1, 1, 1, 1,
0.2093582, 1.421666, 0.08092626, 1, 1, 1, 1, 1,
0.2105726, -1.245337, 3.185735, 1, 1, 1, 1, 1,
0.2123918, 0.396068, -0.07202929, 1, 1, 1, 1, 1,
0.2161745, -1.345856, 3.025184, 1, 1, 1, 1, 1,
0.2167868, 0.4466129, -0.7571715, 1, 1, 1, 1, 1,
0.2201611, -0.7173578, 2.792527, 1, 1, 1, 1, 1,
0.2211813, 0.04878446, 1.053693, 1, 1, 1, 1, 1,
0.2219091, 0.2247318, -0.7059314, 0, 0, 1, 1, 1,
0.2286704, 1.729684, 0.6219878, 1, 0, 0, 1, 1,
0.2299738, 1.04691, -0.7091852, 1, 0, 0, 1, 1,
0.2403516, -3.068968, 2.854552, 1, 0, 0, 1, 1,
0.2416397, 0.2538919, 1.027709, 1, 0, 0, 1, 1,
0.2418405, -0.850358, 3.688572, 1, 0, 0, 1, 1,
0.2425507, -0.065414, -0.5993155, 0, 0, 0, 1, 1,
0.2444587, 1.067574, 2.146198, 0, 0, 0, 1, 1,
0.2445555, -1.119989, 3.830923, 0, 0, 0, 1, 1,
0.2475696, 0.9704705, 1.695488, 0, 0, 0, 1, 1,
0.2540367, -0.9614576, 3.814148, 0, 0, 0, 1, 1,
0.2541812, 0.8696082, -2.264279, 0, 0, 0, 1, 1,
0.2599107, 0.8951263, -0.02582916, 0, 0, 0, 1, 1,
0.2635634, -0.9510667, 2.096312, 1, 1, 1, 1, 1,
0.2645727, -0.2806839, 2.095402, 1, 1, 1, 1, 1,
0.2649136, -1.844898, 3.016664, 1, 1, 1, 1, 1,
0.2663117, -0.6316505, 2.430401, 1, 1, 1, 1, 1,
0.2720259, 0.8027051, -1.418188, 1, 1, 1, 1, 1,
0.2768828, 0.3627487, 2.486681, 1, 1, 1, 1, 1,
0.2826255, -0.7376894, 2.371468, 1, 1, 1, 1, 1,
0.2945414, 0.1876053, 1.553705, 1, 1, 1, 1, 1,
0.2976805, 0.6907138, -0.9644783, 1, 1, 1, 1, 1,
0.2990243, -0.1572298, 1.693717, 1, 1, 1, 1, 1,
0.3031382, -1.474604, 3.299046, 1, 1, 1, 1, 1,
0.3054622, 0.5803065, 1.49785, 1, 1, 1, 1, 1,
0.3112867, -1.158852, 4.102887, 1, 1, 1, 1, 1,
0.3135507, 0.8540015, 0.1401523, 1, 1, 1, 1, 1,
0.3221305, 0.009080104, 1.66142, 1, 1, 1, 1, 1,
0.3236292, -0.4732822, 1.51245, 0, 0, 1, 1, 1,
0.3242451, -0.7080196, 3.212884, 1, 0, 0, 1, 1,
0.3252616, 2.244635, 1.474463, 1, 0, 0, 1, 1,
0.3255612, -0.1831297, 1.286727, 1, 0, 0, 1, 1,
0.3270525, 1.427094, -1.050953, 1, 0, 0, 1, 1,
0.3283363, -0.7924981, 2.93276, 1, 0, 0, 1, 1,
0.3348654, -0.1432375, 2.103367, 0, 0, 0, 1, 1,
0.339714, -1.426931, 3.687864, 0, 0, 0, 1, 1,
0.3411396, -0.5380434, 2.515227, 0, 0, 0, 1, 1,
0.341777, 0.3790544, 2.545205, 0, 0, 0, 1, 1,
0.3423639, -0.9384696, 1.843996, 0, 0, 0, 1, 1,
0.3494014, 0.1927778, 0.4081636, 0, 0, 0, 1, 1,
0.3513744, -0.4889091, 4.05202, 0, 0, 0, 1, 1,
0.3513778, 1.473471, -1.441747, 1, 1, 1, 1, 1,
0.3567151, -0.6886579, 2.492103, 1, 1, 1, 1, 1,
0.3575219, 0.5397161, -0.1329328, 1, 1, 1, 1, 1,
0.3623816, 1.073587, -0.9083456, 1, 1, 1, 1, 1,
0.3627904, -0.574243, 2.053519, 1, 1, 1, 1, 1,
0.3790305, 0.4828361, -1.547641, 1, 1, 1, 1, 1,
0.3801661, 0.8428977, 0.5503722, 1, 1, 1, 1, 1,
0.3837861, 0.6602713, -0.1279985, 1, 1, 1, 1, 1,
0.3842717, 0.5672033, 2.177945, 1, 1, 1, 1, 1,
0.3858938, -1.76497, 4.359946, 1, 1, 1, 1, 1,
0.3900748, 0.4678569, 1.190191, 1, 1, 1, 1, 1,
0.3914728, -0.589188, 2.296357, 1, 1, 1, 1, 1,
0.392465, 1.153996, 1.022166, 1, 1, 1, 1, 1,
0.3949397, 0.0367944, 0.1901129, 1, 1, 1, 1, 1,
0.3967211, 1.299593, 0.2817295, 1, 1, 1, 1, 1,
0.4000418, -1.252458, 5.1968, 0, 0, 1, 1, 1,
0.4023999, -0.2127688, 3.298907, 1, 0, 0, 1, 1,
0.4029, 0.5573596, 0.6929265, 1, 0, 0, 1, 1,
0.4054171, -0.1763891, 2.048945, 1, 0, 0, 1, 1,
0.4061068, -0.5184639, 1.495262, 1, 0, 0, 1, 1,
0.4066826, -0.8317173, 2.13534, 1, 0, 0, 1, 1,
0.4093648, -1.073986, 3.466255, 0, 0, 0, 1, 1,
0.4107469, -0.3464531, 2.568795, 0, 0, 0, 1, 1,
0.4118357, 0.3500793, 1.642838, 0, 0, 0, 1, 1,
0.4140676, -0.02663849, 1.057912, 0, 0, 0, 1, 1,
0.4186304, -0.4617256, 3.692461, 0, 0, 0, 1, 1,
0.4199077, 0.6041366, 0.3084367, 0, 0, 0, 1, 1,
0.4201714, -0.691479, 1.781968, 0, 0, 0, 1, 1,
0.424262, 0.3990324, 2.229087, 1, 1, 1, 1, 1,
0.4243816, -0.9750919, 3.268624, 1, 1, 1, 1, 1,
0.4245983, 1.308421, 0.5364616, 1, 1, 1, 1, 1,
0.4251036, -1.073202, 2.381047, 1, 1, 1, 1, 1,
0.4256265, -0.5285116, 2.901174, 1, 1, 1, 1, 1,
0.4270701, 0.7395812, 0.5519066, 1, 1, 1, 1, 1,
0.4290879, 0.4138605, 1.358171, 1, 1, 1, 1, 1,
0.4299596, 0.09410027, 2.626694, 1, 1, 1, 1, 1,
0.4306614, -0.7328885, 0.7278992, 1, 1, 1, 1, 1,
0.4325365, -1.773133, 1.653424, 1, 1, 1, 1, 1,
0.4379755, -0.7339513, 1.993422, 1, 1, 1, 1, 1,
0.440036, 0.8743094, 2.001196, 1, 1, 1, 1, 1,
0.4415375, 1.758992, 1.134085, 1, 1, 1, 1, 1,
0.4427152, -0.4380711, 2.03059, 1, 1, 1, 1, 1,
0.443556, 0.2399213, 1.444232, 1, 1, 1, 1, 1,
0.4461906, -0.03936275, 2.153018, 0, 0, 1, 1, 1,
0.4479256, 1.667287, -1.403562, 1, 0, 0, 1, 1,
0.4495075, 1.26425, 0.7819883, 1, 0, 0, 1, 1,
0.4552449, 1.26592, 2.644089, 1, 0, 0, 1, 1,
0.4584925, -1.27533, 1.45154, 1, 0, 0, 1, 1,
0.4602904, 0.3699268, 1.620433, 1, 0, 0, 1, 1,
0.4642602, 0.8170268, 1.814989, 0, 0, 0, 1, 1,
0.4652652, 0.2523363, 1.068192, 0, 0, 0, 1, 1,
0.4708145, -2.142648, 1.400994, 0, 0, 0, 1, 1,
0.4719546, -0.5430945, 2.640726, 0, 0, 0, 1, 1,
0.4733233, 1.69135, -0.1080032, 0, 0, 0, 1, 1,
0.4784372, -1.380724, 2.753939, 0, 0, 0, 1, 1,
0.4794222, 1.03757, -1.533252, 0, 0, 0, 1, 1,
0.4835075, 1.228392, 0.3519922, 1, 1, 1, 1, 1,
0.4869438, -0.3297476, 2.294812, 1, 1, 1, 1, 1,
0.4919676, 1.054383, -0.001370604, 1, 1, 1, 1, 1,
0.4931593, 1.806277, -1.010714, 1, 1, 1, 1, 1,
0.508411, 1.2047, -1.096337, 1, 1, 1, 1, 1,
0.5101948, 0.5374893, -0.5328857, 1, 1, 1, 1, 1,
0.5181952, -0.3988884, 2.009111, 1, 1, 1, 1, 1,
0.5274352, 1.272956, 0.0144461, 1, 1, 1, 1, 1,
0.5316679, 0.2951646, 1.567174, 1, 1, 1, 1, 1,
0.5355862, -2.011344, 2.716417, 1, 1, 1, 1, 1,
0.5360134, 0.7041878, -0.1494006, 1, 1, 1, 1, 1,
0.5361197, -0.5771735, 2.426111, 1, 1, 1, 1, 1,
0.5370229, -1.273264, 2.375775, 1, 1, 1, 1, 1,
0.540611, 0.6969674, 0.3711748, 1, 1, 1, 1, 1,
0.5464349, 0.5890995, -0.329366, 1, 1, 1, 1, 1,
0.5518861, 1.825824, 1.511813, 0, 0, 1, 1, 1,
0.5521879, -1.83495, 3.264567, 1, 0, 0, 1, 1,
0.5523261, -0.05772048, 1.514842, 1, 0, 0, 1, 1,
0.5531499, -1.415421, 1.603187, 1, 0, 0, 1, 1,
0.5548221, -1.77341, 4.195101, 1, 0, 0, 1, 1,
0.5639251, 0.6551581, 0.5379769, 1, 0, 0, 1, 1,
0.5748122, 0.3960233, 0.912474, 0, 0, 0, 1, 1,
0.5748361, 0.004501518, 0.6598685, 0, 0, 0, 1, 1,
0.5770344, 1.993692, -1.583385, 0, 0, 0, 1, 1,
0.5811251, -0.2077842, 1.661318, 0, 0, 0, 1, 1,
0.5837813, 0.518783, 0.843088, 0, 0, 0, 1, 1,
0.5839092, -0.480293, 1.788905, 0, 0, 0, 1, 1,
0.5861008, 2.477288, -0.5395268, 0, 0, 0, 1, 1,
0.5877459, 1.3543, 1.92579, 1, 1, 1, 1, 1,
0.5914569, -0.8303957, 2.489442, 1, 1, 1, 1, 1,
0.5935724, 1.678625, 0.3208278, 1, 1, 1, 1, 1,
0.5985872, -0.4953858, 1.554561, 1, 1, 1, 1, 1,
0.599115, -0.3140605, 2.087676, 1, 1, 1, 1, 1,
0.6033349, 1.112485, 1.169634, 1, 1, 1, 1, 1,
0.6102473, -0.7431861, 4.570447, 1, 1, 1, 1, 1,
0.6133986, -0.2966392, 2.46168, 1, 1, 1, 1, 1,
0.6147393, -0.4271555, 1.967354, 1, 1, 1, 1, 1,
0.6172985, 0.067234, 0.7758178, 1, 1, 1, 1, 1,
0.6176352, -0.6232934, 3.495105, 1, 1, 1, 1, 1,
0.6192037, -0.9149491, 3.612023, 1, 1, 1, 1, 1,
0.6212841, 0.5374156, 1.759257, 1, 1, 1, 1, 1,
0.6229312, -0.1805349, 2.356701, 1, 1, 1, 1, 1,
0.6237162, -0.03637012, 2.545211, 1, 1, 1, 1, 1,
0.6247706, 1.354695, 1.558344, 0, 0, 1, 1, 1,
0.6300856, -1.241929, 2.395962, 1, 0, 0, 1, 1,
0.6313913, 0.1396598, 1.613106, 1, 0, 0, 1, 1,
0.6327491, 0.8934439, -0.647987, 1, 0, 0, 1, 1,
0.6343836, 0.6130944, 2.322893, 1, 0, 0, 1, 1,
0.6353531, 1.930038, 1.282715, 1, 0, 0, 1, 1,
0.6362823, -1.18211, 1.013397, 0, 0, 0, 1, 1,
0.6369284, 0.0457017, 1.491165, 0, 0, 0, 1, 1,
0.6372372, -0.5489235, 3.841266, 0, 0, 0, 1, 1,
0.6380536, 1.857552, 0.3872226, 0, 0, 0, 1, 1,
0.6480755, 0.3768468, 1.22524, 0, 0, 0, 1, 1,
0.6488532, 0.147073, 1.675225, 0, 0, 0, 1, 1,
0.6511636, 0.8703696, -1.615545, 0, 0, 0, 1, 1,
0.6517218, -0.09514871, 3.808094, 1, 1, 1, 1, 1,
0.6576248, -0.7043447, 3.049883, 1, 1, 1, 1, 1,
0.6584964, 0.8839049, -0.2508316, 1, 1, 1, 1, 1,
0.662052, -0.8355888, 1.79829, 1, 1, 1, 1, 1,
0.6620823, 0.0156777, 0.7202078, 1, 1, 1, 1, 1,
0.6642329, 0.2468791, 2.383484, 1, 1, 1, 1, 1,
0.668237, -1.002216, 2.189816, 1, 1, 1, 1, 1,
0.668314, 1.308324, -0.6583323, 1, 1, 1, 1, 1,
0.6743749, 0.5571052, 1.566005, 1, 1, 1, 1, 1,
0.6745935, -0.6137266, 1.177472, 1, 1, 1, 1, 1,
0.6761603, -1.430751, 3.533151, 1, 1, 1, 1, 1,
0.6809617, -0.9948523, 1.254705, 1, 1, 1, 1, 1,
0.6905472, 0.8401809, 1.111656, 1, 1, 1, 1, 1,
0.6932927, 1.471135, 0.4841276, 1, 1, 1, 1, 1,
0.696851, -1.160894, 3.014291, 1, 1, 1, 1, 1,
0.6977073, -1.524436, 3.482567, 0, 0, 1, 1, 1,
0.7004321, -0.4996012, 1.835913, 1, 0, 0, 1, 1,
0.7071168, 0.5175033, 2.401516, 1, 0, 0, 1, 1,
0.7081802, 0.5842577, 1.220082, 1, 0, 0, 1, 1,
0.7096765, -0.7698107, 2.856168, 1, 0, 0, 1, 1,
0.7146797, 0.6385763, 0.2116162, 1, 0, 0, 1, 1,
0.71618, -2.331225, 1.753035, 0, 0, 0, 1, 1,
0.7164509, 0.959867, -0.4770703, 0, 0, 0, 1, 1,
0.7180113, -0.004801693, 1.933284, 0, 0, 0, 1, 1,
0.7254293, 0.7624707, 2.343212, 0, 0, 0, 1, 1,
0.7272965, -1.547603, 2.259963, 0, 0, 0, 1, 1,
0.7326677, -0.1140066, 2.359302, 0, 0, 0, 1, 1,
0.7379637, -0.200764, 3.016694, 0, 0, 0, 1, 1,
0.7380347, 1.476533, 0.1141662, 1, 1, 1, 1, 1,
0.7390027, -0.1090335, 1.874896, 1, 1, 1, 1, 1,
0.7544977, -0.7370645, 1.980887, 1, 1, 1, 1, 1,
0.754998, 0.7017689, 0.7989181, 1, 1, 1, 1, 1,
0.7573968, 0.1710234, 1.478124, 1, 1, 1, 1, 1,
0.7582347, 0.7006881, 1.700582, 1, 1, 1, 1, 1,
0.7612803, -0.1651075, 2.225751, 1, 1, 1, 1, 1,
0.762685, 0.8802158, 0.05320552, 1, 1, 1, 1, 1,
0.7641271, -0.7074329, 2.786674, 1, 1, 1, 1, 1,
0.7657394, 0.1827646, 1.55757, 1, 1, 1, 1, 1,
0.7663646, -0.5436078, 2.006694, 1, 1, 1, 1, 1,
0.7671844, 1.164358, 1.251109, 1, 1, 1, 1, 1,
0.7709292, -0.2657384, 3.220708, 1, 1, 1, 1, 1,
0.7773633, -0.2504613, 2.029255, 1, 1, 1, 1, 1,
0.7839993, 0.2094615, 0.7982372, 1, 1, 1, 1, 1,
0.7947463, -0.5093895, 1.840496, 0, 0, 1, 1, 1,
0.7981734, -1.614424, 4.239185, 1, 0, 0, 1, 1,
0.8022565, 0.522766, 0.970957, 1, 0, 0, 1, 1,
0.8034348, -0.6740557, 2.219441, 1, 0, 0, 1, 1,
0.8067766, -1.953069, 2.187792, 1, 0, 0, 1, 1,
0.816364, 0.4148168, 1.983536, 1, 0, 0, 1, 1,
0.8227728, -0.8250569, 2.707409, 0, 0, 0, 1, 1,
0.8255275, -0.9710141, 1.484455, 0, 0, 0, 1, 1,
0.828016, -0.9092883, 1.281993, 0, 0, 0, 1, 1,
0.8358047, 0.1432403, 2.139152, 0, 0, 0, 1, 1,
0.8408746, -1.164206, 2.809866, 0, 0, 0, 1, 1,
0.8448523, -0.5035698, 1.313303, 0, 0, 0, 1, 1,
0.847177, 0.9907092, 0.7226149, 0, 0, 0, 1, 1,
0.8474303, 0.5586643, 1.066476, 1, 1, 1, 1, 1,
0.8483111, -0.02669793, 0.3003413, 1, 1, 1, 1, 1,
0.8568569, -1.0683, 2.318107, 1, 1, 1, 1, 1,
0.8572974, -1.171484, 2.818006, 1, 1, 1, 1, 1,
0.8580377, -0.07302972, 2.228683, 1, 1, 1, 1, 1,
0.8621036, -1.568962, 3.158973, 1, 1, 1, 1, 1,
0.8682879, -0.6037435, 0.7570757, 1, 1, 1, 1, 1,
0.8723783, -1.445178, 0.6555371, 1, 1, 1, 1, 1,
0.8757431, 1.02685, 1.05797, 1, 1, 1, 1, 1,
0.8775594, -1.04129, 1.676516, 1, 1, 1, 1, 1,
0.8782777, -0.4342335, 2.373254, 1, 1, 1, 1, 1,
0.8879567, -0.6741135, 0.6439783, 1, 1, 1, 1, 1,
0.8922499, 1.378425, 0.4409028, 1, 1, 1, 1, 1,
0.8936251, 1.56285, 2.069511, 1, 1, 1, 1, 1,
0.8950297, 0.4285071, 1.181187, 1, 1, 1, 1, 1,
0.8984671, 0.8105687, -1.6131, 0, 0, 1, 1, 1,
0.9034098, 0.06185618, 2.339077, 1, 0, 0, 1, 1,
0.9114475, 0.8129023, 2.144427, 1, 0, 0, 1, 1,
0.9144654, -0.4434746, 3.273447, 1, 0, 0, 1, 1,
0.9171354, -0.7093719, 2.234255, 1, 0, 0, 1, 1,
0.9208069, 1.100708, 1.417758, 1, 0, 0, 1, 1,
0.9250702, 1.017039, -0.2395217, 0, 0, 0, 1, 1,
0.9410893, -1.313062, 2.900336, 0, 0, 0, 1, 1,
0.9463464, 0.7846841, 0.422398, 0, 0, 0, 1, 1,
0.946689, -1.194638, 1.390192, 0, 0, 0, 1, 1,
0.9499915, 2.537883, 0.6450285, 0, 0, 0, 1, 1,
0.9512578, 0.431989, 0.8648522, 0, 0, 0, 1, 1,
0.951342, 0.3131829, 0.8661515, 0, 0, 0, 1, 1,
0.9587094, -1.268215, 3.689666, 1, 1, 1, 1, 1,
0.9619065, -0.03661061, 3.627082, 1, 1, 1, 1, 1,
0.9669159, 0.9709227, -0.9753004, 1, 1, 1, 1, 1,
0.9697627, 0.7165619, 0.1788158, 1, 1, 1, 1, 1,
0.9747109, 1.314078, 2.35056, 1, 1, 1, 1, 1,
0.9755258, 0.7555829, 0.9446976, 1, 1, 1, 1, 1,
0.9790474, -1.153777, 2.9645, 1, 1, 1, 1, 1,
0.9799716, 0.2213389, -0.5731992, 1, 1, 1, 1, 1,
0.9868406, -0.499754, 3.596182, 1, 1, 1, 1, 1,
0.9897325, 1.567379, 0.3843811, 1, 1, 1, 1, 1,
0.9953987, 1.21203, 0.8571212, 1, 1, 1, 1, 1,
0.9989529, 0.4504141, 2.470278, 1, 1, 1, 1, 1,
0.9998498, 1.03972, 2.584549, 1, 1, 1, 1, 1,
1.000417, -0.7303774, 2.825097, 1, 1, 1, 1, 1,
1.004839, 0.1965961, 1.571929, 1, 1, 1, 1, 1,
1.006038, -0.9866225, 2.522685, 0, 0, 1, 1, 1,
1.006182, -0.6936717, 2.601324, 1, 0, 0, 1, 1,
1.011286, -1.713155, 3.747295, 1, 0, 0, 1, 1,
1.01172, 0.1528797, 2.430108, 1, 0, 0, 1, 1,
1.014576, -0.3389333, 2.857998, 1, 0, 0, 1, 1,
1.015105, -1.608818, 1.556036, 1, 0, 0, 1, 1,
1.032573, -2.384753, 4.665958, 0, 0, 0, 1, 1,
1.035689, -1.611458, 2.607916, 0, 0, 0, 1, 1,
1.037518, -1.032738, 2.695521, 0, 0, 0, 1, 1,
1.038283, -1.086635, 1.377359, 0, 0, 0, 1, 1,
1.038953, -0.6606768, 2.332104, 0, 0, 0, 1, 1,
1.040991, -0.85453, 1.93714, 0, 0, 0, 1, 1,
1.043538, 0.7042124, -0.8711646, 0, 0, 0, 1, 1,
1.045468, -0.07510719, 3.712185, 1, 1, 1, 1, 1,
1.045538, 0.4404293, 1.434517, 1, 1, 1, 1, 1,
1.068905, 0.2308506, 1.529666, 1, 1, 1, 1, 1,
1.071586, -0.3387275, 1.36301, 1, 1, 1, 1, 1,
1.074685, 0.2692307, 3.462098, 1, 1, 1, 1, 1,
1.075797, -0.2530947, 1.414841, 1, 1, 1, 1, 1,
1.076512, -1.694203, 3.225574, 1, 1, 1, 1, 1,
1.078105, 0.09803173, 1.51223, 1, 1, 1, 1, 1,
1.078878, -0.1445959, 1.602107, 1, 1, 1, 1, 1,
1.083816, 1.277814, 0.9650202, 1, 1, 1, 1, 1,
1.092494, 1.708109, 2.184645, 1, 1, 1, 1, 1,
1.092829, 0.9440513, -1.829475, 1, 1, 1, 1, 1,
1.092981, 1.07809, 0.1427942, 1, 1, 1, 1, 1,
1.094261, 1.763554, 1.761034, 1, 1, 1, 1, 1,
1.095114, 1.401197, -0.3977625, 1, 1, 1, 1, 1,
1.110372, 0.4209638, 1.955844, 0, 0, 1, 1, 1,
1.12325, 1.054628, 0.7232417, 1, 0, 0, 1, 1,
1.125234, 0.8714111, 0.554206, 1, 0, 0, 1, 1,
1.129376, -0.2499766, 2.235785, 1, 0, 0, 1, 1,
1.133348, 1.21747, 0.04837642, 1, 0, 0, 1, 1,
1.134082, 1.16484, 0.7405749, 1, 0, 0, 1, 1,
1.136671, 0.2856785, 0.862609, 0, 0, 0, 1, 1,
1.139895, 0.9686282, 0.0812718, 0, 0, 0, 1, 1,
1.14558, -1.365085, 2.366321, 0, 0, 0, 1, 1,
1.152759, -0.03848532, 1.596561, 0, 0, 0, 1, 1,
1.157829, -1.07655, 2.970205, 0, 0, 0, 1, 1,
1.168342, -0.540966, 3.88554, 0, 0, 0, 1, 1,
1.17435, -0.5818921, 1.31322, 0, 0, 0, 1, 1,
1.1757, 0.09501558, 1.03652, 1, 1, 1, 1, 1,
1.177225, 1.608178, -0.1304823, 1, 1, 1, 1, 1,
1.180806, 0.9933673, 0.272856, 1, 1, 1, 1, 1,
1.191849, 1.716646, -0.5145507, 1, 1, 1, 1, 1,
1.193051, 2.254775, 0.1864044, 1, 1, 1, 1, 1,
1.193348, -0.1144022, 0.7573885, 1, 1, 1, 1, 1,
1.201161, 1.162667, 1.282096, 1, 1, 1, 1, 1,
1.212165, -0.2132448, 2.831875, 1, 1, 1, 1, 1,
1.216972, -0.1480009, 1.854773, 1, 1, 1, 1, 1,
1.231065, 1.205257, -0.4592395, 1, 1, 1, 1, 1,
1.231513, 1.836109, 0.6462757, 1, 1, 1, 1, 1,
1.233464, -1.166965, 1.898926, 1, 1, 1, 1, 1,
1.234322, -0.7480314, 1.684744, 1, 1, 1, 1, 1,
1.236791, -0.4210994, 1.687729, 1, 1, 1, 1, 1,
1.240597, 1.042807, 1.885317, 1, 1, 1, 1, 1,
1.245043, -1.173173, 0.9527954, 0, 0, 1, 1, 1,
1.249722, -0.3015456, 1.942054, 1, 0, 0, 1, 1,
1.251563, -0.52558, 1.255497, 1, 0, 0, 1, 1,
1.262383, -1.119322, 2.512519, 1, 0, 0, 1, 1,
1.263342, 2.371099, -1.288703, 1, 0, 0, 1, 1,
1.269569, -0.3247921, 2.756157, 1, 0, 0, 1, 1,
1.275486, 0.1234381, 0.3850299, 0, 0, 0, 1, 1,
1.279535, 0.1347274, 1.210115, 0, 0, 0, 1, 1,
1.280011, 0.07917432, 1.812608, 0, 0, 0, 1, 1,
1.283143, -0.3159965, 2.729614, 0, 0, 0, 1, 1,
1.283835, -0.7378931, 1.41202, 0, 0, 0, 1, 1,
1.291822, -0.1061271, 1.079929, 0, 0, 0, 1, 1,
1.298617, 0.6108395, 1.235005, 0, 0, 0, 1, 1,
1.305011, 0.03075237, 0.3263332, 1, 1, 1, 1, 1,
1.314907, 1.202136, 0.9653555, 1, 1, 1, 1, 1,
1.325421, -0.28343, 2.193715, 1, 1, 1, 1, 1,
1.327833, 0.5129666, 0.8401972, 1, 1, 1, 1, 1,
1.334281, 1.657728, 0.4883324, 1, 1, 1, 1, 1,
1.341094, 0.4206332, 0.6731442, 1, 1, 1, 1, 1,
1.341311, 0.1036005, 2.083763, 1, 1, 1, 1, 1,
1.352677, -1.671382, 2.979418, 1, 1, 1, 1, 1,
1.357527, -0.04143034, 1.555602, 1, 1, 1, 1, 1,
1.36508, 1.725037, -0.5304659, 1, 1, 1, 1, 1,
1.370706, 2.170995, 0.7056071, 1, 1, 1, 1, 1,
1.370929, -0.1603531, 2.425339, 1, 1, 1, 1, 1,
1.376868, -0.2299695, 0.7742455, 1, 1, 1, 1, 1,
1.378971, 0.02289793, -0.3314015, 1, 1, 1, 1, 1,
1.388642, 0.09681427, 0.3959327, 1, 1, 1, 1, 1,
1.389507, -1.438745, 2.709648, 0, 0, 1, 1, 1,
1.398189, -1.12998, 2.501773, 1, 0, 0, 1, 1,
1.39991, -0.3871197, 2.323779, 1, 0, 0, 1, 1,
1.418413, 0.8297452, 0.5841128, 1, 0, 0, 1, 1,
1.420738, -0.9144654, 1.994346, 1, 0, 0, 1, 1,
1.427734, -0.5463222, 2.861643, 1, 0, 0, 1, 1,
1.435438, 1.168584, 3.077723, 0, 0, 0, 1, 1,
1.436322, -0.07770389, 0.6812286, 0, 0, 0, 1, 1,
1.454866, 0.8842044, -0.1762852, 0, 0, 0, 1, 1,
1.486433, 0.3455879, 0.4200717, 0, 0, 0, 1, 1,
1.494002, -0.7479146, 1.841824, 0, 0, 0, 1, 1,
1.536491, 1.453092, 1.092973, 0, 0, 0, 1, 1,
1.54798, -2.731159, 2.549383, 0, 0, 0, 1, 1,
1.548604, 1.763113, -0.4816929, 1, 1, 1, 1, 1,
1.548737, 0.2958545, 0.6265723, 1, 1, 1, 1, 1,
1.586648, -0.6199412, 3.067738, 1, 1, 1, 1, 1,
1.587488, 0.002368533, 1.493494, 1, 1, 1, 1, 1,
1.598036, -0.7042946, 1.02, 1, 1, 1, 1, 1,
1.619555, -0.6855342, 2.215342, 1, 1, 1, 1, 1,
1.623799, 1.656236, -0.1998691, 1, 1, 1, 1, 1,
1.639107, -0.5950635, 1.574478, 1, 1, 1, 1, 1,
1.663809, -1.164068, 0.257279, 1, 1, 1, 1, 1,
1.680757, 0.3617911, -0.2228974, 1, 1, 1, 1, 1,
1.724716, -0.6260847, -0.0971456, 1, 1, 1, 1, 1,
1.738321, 0.8011555, 1.449676, 1, 1, 1, 1, 1,
1.740169, -0.5960301, 2.247965, 1, 1, 1, 1, 1,
1.745622, 0.8900741, 1.291119, 1, 1, 1, 1, 1,
1.749662, 1.679244, 1.328264, 1, 1, 1, 1, 1,
1.749691, 1.20008, 1.185658, 0, 0, 1, 1, 1,
1.762076, -0.5597073, 1.98146, 1, 0, 0, 1, 1,
1.779298, -1.595074, 1.466343, 1, 0, 0, 1, 1,
1.785104, 0.8894339, -0.8185455, 1, 0, 0, 1, 1,
1.787173, -0.4434307, 1.188399, 1, 0, 0, 1, 1,
1.791849, -0.6863596, 2.796346, 1, 0, 0, 1, 1,
1.79751, 1.178713, 1.747196, 0, 0, 0, 1, 1,
1.827727, 0.2462192, 2.280025, 0, 0, 0, 1, 1,
1.850715, -1.315705, 1.371026, 0, 0, 0, 1, 1,
1.858505, 2.235527, 1.308223, 0, 0, 0, 1, 1,
1.858692, 0.5151549, 1.202917, 0, 0, 0, 1, 1,
1.863848, -0.2697717, 1.376735, 0, 0, 0, 1, 1,
1.868316, 0.9951243, -0.0348333, 0, 0, 0, 1, 1,
1.869779, -1.110006, 2.104671, 1, 1, 1, 1, 1,
1.892516, 0.05025748, 1.316603, 1, 1, 1, 1, 1,
1.908427, 2.135343, 2.349042, 1, 1, 1, 1, 1,
1.908544, -0.8318186, 2.26159, 1, 1, 1, 1, 1,
1.91526, 1.051212, 3.212932, 1, 1, 1, 1, 1,
1.944957, 0.6710355, 1.423035, 1, 1, 1, 1, 1,
1.95997, 0.8943921, 2.242543, 1, 1, 1, 1, 1,
1.970646, -0.6884022, 0.825679, 1, 1, 1, 1, 1,
1.99471, 0.5704641, 1.483935, 1, 1, 1, 1, 1,
1.999613, -0.2190727, 1.193654, 1, 1, 1, 1, 1,
2.027262, 1.082537, 2.834145, 1, 1, 1, 1, 1,
2.036083, -0.3857863, 0.4093689, 1, 1, 1, 1, 1,
2.051699, -0.3980522, 0.7172613, 1, 1, 1, 1, 1,
2.065483, -0.108291, -0.6057317, 1, 1, 1, 1, 1,
2.114766, -0.2059371, 2.160166, 1, 1, 1, 1, 1,
2.183026, -1.083441, 0.9447016, 0, 0, 1, 1, 1,
2.197583, 0.06094678, 0.5620896, 1, 0, 0, 1, 1,
2.275887, 0.51022, -0.6960968, 1, 0, 0, 1, 1,
2.312016, 0.5936078, -0.02973561, 1, 0, 0, 1, 1,
2.333215, -1.572266, 2.039927, 1, 0, 0, 1, 1,
2.356383, -0.4169373, 1.262192, 1, 0, 0, 1, 1,
2.456322, 0.6468473, 0.708685, 0, 0, 0, 1, 1,
2.456559, -2.120223, 2.298309, 0, 0, 0, 1, 1,
2.497108, -1.58634, 1.682313, 0, 0, 0, 1, 1,
2.528632, -0.09249313, 1.916473, 0, 0, 0, 1, 1,
2.54972, 0.7859817, 1.542672, 0, 0, 0, 1, 1,
2.570111, 0.4624289, 1.831811, 0, 0, 0, 1, 1,
2.641513, -1.120257, 2.310343, 0, 0, 0, 1, 1,
2.719054, -2.890099, 2.139566, 1, 1, 1, 1, 1,
2.772463, 1.110837, 1.3105, 1, 1, 1, 1, 1,
2.840988, 0.7317832, 0.3190336, 1, 1, 1, 1, 1,
2.971935, 1.072373, 2.727429, 1, 1, 1, 1, 1,
3.071514, 0.4974564, 1.147631, 1, 1, 1, 1, 1,
3.120378, 0.2188308, 2.103276, 1, 1, 1, 1, 1,
3.822277, -0.3654306, 0.8646534, 1, 1, 1, 1, 1
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
var radius = 9.504365;
var distance = 33.38368;
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
mvMatrix.translate( -0.2288027, 0.3434398, -0.1024916 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38368);
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