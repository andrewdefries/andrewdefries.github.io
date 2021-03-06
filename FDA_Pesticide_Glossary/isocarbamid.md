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
-3.372093, -1.615573, -1.369884, 1, 0, 0, 1,
-2.982943, -0.09095069, -3.608851, 1, 0.007843138, 0, 1,
-2.907253, 1.352796, -0.5389516, 1, 0.01176471, 0, 1,
-2.769145, -0.9197615, -2.379877, 1, 0.01960784, 0, 1,
-2.747322, 1.005797, 1.703941, 1, 0.02352941, 0, 1,
-2.7392, 0.4006811, -2.065432, 1, 0.03137255, 0, 1,
-2.729186, 0.7045228, -2.840692, 1, 0.03529412, 0, 1,
-2.64702, -1.584215, -1.888394, 1, 0.04313726, 0, 1,
-2.581544, -1.478867, -2.545128, 1, 0.04705882, 0, 1,
-2.558259, -1.258917, -0.6850228, 1, 0.05490196, 0, 1,
-2.518354, 2.505267, -0.3793279, 1, 0.05882353, 0, 1,
-2.413791, 0.2529198, -1.968815, 1, 0.06666667, 0, 1,
-2.339478, 0.2972297, -0.1908525, 1, 0.07058824, 0, 1,
-2.28173, 0.2321529, -1.793823, 1, 0.07843138, 0, 1,
-2.26616, -1.668048, -1.999279, 1, 0.08235294, 0, 1,
-2.19337, 1.116585, -0.6554242, 1, 0.09019608, 0, 1,
-2.190636, -1.195018, -1.035816, 1, 0.09411765, 0, 1,
-2.157167, 1.008167, -0.8406495, 1, 0.1019608, 0, 1,
-2.094351, 0.1631362, -2.104861, 1, 0.1098039, 0, 1,
-2.062251, -0.07401384, -1.746391, 1, 0.1137255, 0, 1,
-2.015054, 0.9909739, -3.201309, 1, 0.1215686, 0, 1,
-1.995055, 0.9658932, -1.131632, 1, 0.1254902, 0, 1,
-1.993289, -1.047541, -2.809135, 1, 0.1333333, 0, 1,
-1.986743, -0.1546409, -1.139637, 1, 0.1372549, 0, 1,
-1.96447, 0.4721157, -1.209248, 1, 0.145098, 0, 1,
-1.958855, 0.2392179, -3.211635, 1, 0.1490196, 0, 1,
-1.933656, 1.237704, -0.464989, 1, 0.1568628, 0, 1,
-1.914893, -0.9768528, -2.293294, 1, 0.1607843, 0, 1,
-1.905, 0.1188557, -2.095986, 1, 0.1686275, 0, 1,
-1.900852, -2.542546, -2.612513, 1, 0.172549, 0, 1,
-1.863576, 0.2327662, 0.104998, 1, 0.1803922, 0, 1,
-1.826752, 2.205899, -0.5223165, 1, 0.1843137, 0, 1,
-1.820992, -0.4566824, -3.085129, 1, 0.1921569, 0, 1,
-1.802005, 2.019521, -1.499274, 1, 0.1960784, 0, 1,
-1.789069, -1.086759, -2.330909, 1, 0.2039216, 0, 1,
-1.785596, -0.7957549, -2.244998, 1, 0.2117647, 0, 1,
-1.736675, -1.070878, -2.108383, 1, 0.2156863, 0, 1,
-1.730356, 1.336567, -0.8119897, 1, 0.2235294, 0, 1,
-1.715395, -1.072165, -1.353263, 1, 0.227451, 0, 1,
-1.708942, -0.3292244, -1.916663, 1, 0.2352941, 0, 1,
-1.706851, 0.5045745, -1.380546, 1, 0.2392157, 0, 1,
-1.674436, -0.5570956, -3.081432, 1, 0.2470588, 0, 1,
-1.636205, 0.5339927, -2.20864, 1, 0.2509804, 0, 1,
-1.634583, 0.1128646, -1.191926, 1, 0.2588235, 0, 1,
-1.608098, -0.3532298, -1.851849, 1, 0.2627451, 0, 1,
-1.602208, 0.3057933, -3.021235, 1, 0.2705882, 0, 1,
-1.5987, -0.6970289, -1.031307, 1, 0.2745098, 0, 1,
-1.587698, -0.900529, -0.9869657, 1, 0.282353, 0, 1,
-1.557683, -1.109023, -1.953486, 1, 0.2862745, 0, 1,
-1.556177, 1.796565, -2.571752, 1, 0.2941177, 0, 1,
-1.553144, 2.380417, -1.58749, 1, 0.3019608, 0, 1,
-1.545898, -0.08082844, -1.793827, 1, 0.3058824, 0, 1,
-1.529876, 2.09745, 0.2004441, 1, 0.3137255, 0, 1,
-1.520476, 0.1152354, -2.014272, 1, 0.3176471, 0, 1,
-1.506084, 0.1593182, -1.674279, 1, 0.3254902, 0, 1,
-1.50021, 1.414287, 0.5208294, 1, 0.3294118, 0, 1,
-1.491813, -0.3887204, -2.365375, 1, 0.3372549, 0, 1,
-1.491587, 0.4285093, -1.709351, 1, 0.3411765, 0, 1,
-1.485579, 0.1002699, -1.614752, 1, 0.3490196, 0, 1,
-1.483494, 0.08051643, -2.315521, 1, 0.3529412, 0, 1,
-1.475609, 0.5471839, -1.846431, 1, 0.3607843, 0, 1,
-1.475243, 0.2205458, -1.117124, 1, 0.3647059, 0, 1,
-1.443269, 1.125415, -1.78952, 1, 0.372549, 0, 1,
-1.441489, 0.2285416, -0.9259624, 1, 0.3764706, 0, 1,
-1.437873, 1.137078, 0.8025003, 1, 0.3843137, 0, 1,
-1.436463, 1.257449, -3.138034, 1, 0.3882353, 0, 1,
-1.435949, 0.2966445, -0.5332789, 1, 0.3960784, 0, 1,
-1.432536, -0.3715951, -2.338099, 1, 0.4039216, 0, 1,
-1.413233, 1.017066, -0.8048337, 1, 0.4078431, 0, 1,
-1.405522, -0.9077131, -3.545209, 1, 0.4156863, 0, 1,
-1.404203, -1.214392, -2.926127, 1, 0.4196078, 0, 1,
-1.393119, 0.3826258, -1.826656, 1, 0.427451, 0, 1,
-1.384504, -0.4018287, -0.1953888, 1, 0.4313726, 0, 1,
-1.379173, -1.282229, -2.65777, 1, 0.4392157, 0, 1,
-1.374347, -1.189427, -3.441239, 1, 0.4431373, 0, 1,
-1.373026, 0.1083035, 0.2851443, 1, 0.4509804, 0, 1,
-1.359672, 0.7957902, -1.557964, 1, 0.454902, 0, 1,
-1.350346, -1.642806, -0.8221607, 1, 0.4627451, 0, 1,
-1.34683, -0.5682197, -1.035509, 1, 0.4666667, 0, 1,
-1.33647, 0.858648, -2.278464, 1, 0.4745098, 0, 1,
-1.333848, 0.01448748, -1.926923, 1, 0.4784314, 0, 1,
-1.333355, -0.6266256, -3.164988, 1, 0.4862745, 0, 1,
-1.327463, 0.1366781, 0.01724186, 1, 0.4901961, 0, 1,
-1.3266, 0.1785284, -0.4006437, 1, 0.4980392, 0, 1,
-1.316772, -2.489405, -4.077088, 1, 0.5058824, 0, 1,
-1.310228, -1.371256, -2.40764, 1, 0.509804, 0, 1,
-1.30822, 1.129429, -0.08703862, 1, 0.5176471, 0, 1,
-1.294926, -0.06142493, -2.970388, 1, 0.5215687, 0, 1,
-1.294567, 0.3909801, -1.08752, 1, 0.5294118, 0, 1,
-1.277891, -1.574202, -2.796195, 1, 0.5333334, 0, 1,
-1.273833, 0.2331335, -1.197778, 1, 0.5411765, 0, 1,
-1.257069, 0.1060903, -1.370303, 1, 0.5450981, 0, 1,
-1.251783, -0.1765708, -2.727776, 1, 0.5529412, 0, 1,
-1.251214, 0.4694671, -1.836751, 1, 0.5568628, 0, 1,
-1.251195, 0.6571053, -1.547616, 1, 0.5647059, 0, 1,
-1.250058, 0.3703934, -2.449378, 1, 0.5686275, 0, 1,
-1.246816, 0.3872135, 0.420859, 1, 0.5764706, 0, 1,
-1.245769, -1.743915, -1.709625, 1, 0.5803922, 0, 1,
-1.24509, -0.02363721, -1.393038, 1, 0.5882353, 0, 1,
-1.234258, 1.241502, -2.3705, 1, 0.5921569, 0, 1,
-1.225886, 0.5043748, -1.461887, 1, 0.6, 0, 1,
-1.219242, -0.2350779, -3.182315, 1, 0.6078432, 0, 1,
-1.218655, 0.9590007, -1.119569, 1, 0.6117647, 0, 1,
-1.215982, -1.374497, -2.924582, 1, 0.6196079, 0, 1,
-1.212109, 0.5362491, -0.5599554, 1, 0.6235294, 0, 1,
-1.206392, 0.2856565, 1.085757, 1, 0.6313726, 0, 1,
-1.204447, 1.546893, -0.8717072, 1, 0.6352941, 0, 1,
-1.200062, -1.257711, -0.9410452, 1, 0.6431373, 0, 1,
-1.194833, 0.4084614, -0.650022, 1, 0.6470588, 0, 1,
-1.188601, 1.034038, 1.056929, 1, 0.654902, 0, 1,
-1.188201, 0.3985376, -2.128998, 1, 0.6588235, 0, 1,
-1.185793, -1.411095, -3.750574, 1, 0.6666667, 0, 1,
-1.179609, 1.108028, -1.31893, 1, 0.6705883, 0, 1,
-1.166865, 0.2452961, -0.4428879, 1, 0.6784314, 0, 1,
-1.154852, -0.7221547, -2.263857, 1, 0.682353, 0, 1,
-1.153966, -0.9452932, -3.234888, 1, 0.6901961, 0, 1,
-1.152322, 0.899808, -2.211839, 1, 0.6941177, 0, 1,
-1.145907, 2.718147, -2.133537, 1, 0.7019608, 0, 1,
-1.138834, -0.4618131, -2.091343, 1, 0.7098039, 0, 1,
-1.137891, 1.586191, -0.4517929, 1, 0.7137255, 0, 1,
-1.136455, 0.1766378, -0.6815319, 1, 0.7215686, 0, 1,
-1.133471, -0.2204583, -2.726113, 1, 0.7254902, 0, 1,
-1.132124, -0.3788809, 0.2674635, 1, 0.7333333, 0, 1,
-1.129189, -0.6042269, -2.299552, 1, 0.7372549, 0, 1,
-1.119663, 0.6241747, -1.43951, 1, 0.7450981, 0, 1,
-1.116725, 1.027492, -1.399374, 1, 0.7490196, 0, 1,
-1.105703, 0.05071996, -2.469838, 1, 0.7568628, 0, 1,
-1.105107, 0.8134907, 0.1303993, 1, 0.7607843, 0, 1,
-1.101444, 0.8829635, -0.9793068, 1, 0.7686275, 0, 1,
-1.099749, -0.7116806, -2.062862, 1, 0.772549, 0, 1,
-1.087104, 0.8333386, -2.341409, 1, 0.7803922, 0, 1,
-1.086493, 1.705803, -2.25835, 1, 0.7843137, 0, 1,
-1.083368, -0.4435574, -2.294619, 1, 0.7921569, 0, 1,
-1.082421, 0.3987662, -0.28731, 1, 0.7960784, 0, 1,
-1.075186, -0.2609538, 0.3760671, 1, 0.8039216, 0, 1,
-1.072722, -0.851718, -2.288054, 1, 0.8117647, 0, 1,
-1.067013, -0.3734812, -2.973228, 1, 0.8156863, 0, 1,
-1.066194, -0.6970252, -0.6107326, 1, 0.8235294, 0, 1,
-1.064382, -0.1647389, -0.5684539, 1, 0.827451, 0, 1,
-1.064212, -1.304814, -2.48676, 1, 0.8352941, 0, 1,
-1.063937, -0.2803304, -0.671369, 1, 0.8392157, 0, 1,
-1.060697, 1.0452, 0.7371636, 1, 0.8470588, 0, 1,
-1.055873, -1.157176, -2.611716, 1, 0.8509804, 0, 1,
-1.05426, 0.4877207, -1.311998, 1, 0.8588235, 0, 1,
-1.050656, 0.5575961, 0.4798375, 1, 0.8627451, 0, 1,
-1.04809, 0.3179538, -1.935024, 1, 0.8705882, 0, 1,
-1.045921, 0.842806, -2.526227, 1, 0.8745098, 0, 1,
-1.033297, 0.05323626, -1.592956, 1, 0.8823529, 0, 1,
-1.032119, 0.2521825, -0.1425376, 1, 0.8862745, 0, 1,
-1.030891, 0.6212361, -0.9461821, 1, 0.8941177, 0, 1,
-1.030823, 0.8994572, 0.1096307, 1, 0.8980392, 0, 1,
-1.025865, 0.1841448, -1.665447, 1, 0.9058824, 0, 1,
-1.021604, -0.2893824, -1.731403, 1, 0.9137255, 0, 1,
-1.021457, -0.01409989, -3.166733, 1, 0.9176471, 0, 1,
-1.01775, -3.444741, -0.3363853, 1, 0.9254902, 0, 1,
-1.016597, 1.433574, 0.7369451, 1, 0.9294118, 0, 1,
-1.015699, 0.6970723, -1.521823, 1, 0.9372549, 0, 1,
-1.012682, -0.2221887, 0.07941584, 1, 0.9411765, 0, 1,
-1.009228, 0.004734878, -0.7307623, 1, 0.9490196, 0, 1,
-1.007254, 0.7163037, 0.5496194, 1, 0.9529412, 0, 1,
-1.003537, 1.410926, 0.8222844, 1, 0.9607843, 0, 1,
-1.001685, -0.908609, -2.899885, 1, 0.9647059, 0, 1,
-1.000134, -0.05827015, -2.170354, 1, 0.972549, 0, 1,
-0.9951856, -0.2115439, -1.250695, 1, 0.9764706, 0, 1,
-0.9927483, 0.7313721, -2.133862, 1, 0.9843137, 0, 1,
-0.9809347, -0.6318129, -4.354799, 1, 0.9882353, 0, 1,
-0.9616096, -0.972612, -1.317942, 1, 0.9960784, 0, 1,
-0.9438924, -0.4392186, -0.9387621, 0.9960784, 1, 0, 1,
-0.9405764, -0.3513842, -1.730528, 0.9921569, 1, 0, 1,
-0.9231692, 0.1265313, -1.576305, 0.9843137, 1, 0, 1,
-0.9202288, -0.7781596, -3.018893, 0.9803922, 1, 0, 1,
-0.9200371, -1.363302, -4.061756, 0.972549, 1, 0, 1,
-0.9181678, 0.3764904, -0.5494546, 0.9686275, 1, 0, 1,
-0.9160334, 0.2391363, -0.7443643, 0.9607843, 1, 0, 1,
-0.9145424, 0.3812177, -1.802935, 0.9568627, 1, 0, 1,
-0.9119334, 0.553721, -2.024161, 0.9490196, 1, 0, 1,
-0.9071028, -0.3751884, -1.32003, 0.945098, 1, 0, 1,
-0.9065928, -0.226419, -3.098886, 0.9372549, 1, 0, 1,
-0.8961682, 0.9482294, 0.2279981, 0.9333333, 1, 0, 1,
-0.8955706, 1.009043, 0.1996959, 0.9254902, 1, 0, 1,
-0.8946421, -1.816438, -4.373241, 0.9215686, 1, 0, 1,
-0.8902376, 1.362629, -0.5906153, 0.9137255, 1, 0, 1,
-0.8896953, -1.831843, -3.948668, 0.9098039, 1, 0, 1,
-0.8823097, -1.147741, -3.847141, 0.9019608, 1, 0, 1,
-0.8822547, 1.937078, 0.3434262, 0.8941177, 1, 0, 1,
-0.8727502, 1.088163, -0.3482499, 0.8901961, 1, 0, 1,
-0.8724539, -1.323244, -1.2926, 0.8823529, 1, 0, 1,
-0.868003, 0.5196268, -2.159411, 0.8784314, 1, 0, 1,
-0.8665219, 0.7442476, -1.661657, 0.8705882, 1, 0, 1,
-0.8635259, 0.003002539, -1.782581, 0.8666667, 1, 0, 1,
-0.8633094, 0.1304165, -1.489504, 0.8588235, 1, 0, 1,
-0.8619017, -0.7171901, -3.219928, 0.854902, 1, 0, 1,
-0.8611713, -0.534362, -0.8660393, 0.8470588, 1, 0, 1,
-0.8535842, 1.069818, -1.857548, 0.8431373, 1, 0, 1,
-0.8499956, 0.4379904, 1.161842, 0.8352941, 1, 0, 1,
-0.8468215, 1.229502, -1.749182, 0.8313726, 1, 0, 1,
-0.8448608, -0.6221753, -1.932336, 0.8235294, 1, 0, 1,
-0.8441238, 0.4906414, -0.4596777, 0.8196079, 1, 0, 1,
-0.8197987, -0.4855208, -1.156061, 0.8117647, 1, 0, 1,
-0.8187636, 0.1154561, -2.163736, 0.8078431, 1, 0, 1,
-0.8150771, -0.8921254, -2.881214, 0.8, 1, 0, 1,
-0.81398, -0.9967906, -2.682505, 0.7921569, 1, 0, 1,
-0.810576, 0.2114524, -2.186056, 0.7882353, 1, 0, 1,
-0.8041452, -0.2867875, -1.623032, 0.7803922, 1, 0, 1,
-0.8017076, 0.4300989, -2.265356, 0.7764706, 1, 0, 1,
-0.8002918, 0.341822, -0.811224, 0.7686275, 1, 0, 1,
-0.7995946, -1.613398, -1.898552, 0.7647059, 1, 0, 1,
-0.7925402, 0.9950014, -1.602089, 0.7568628, 1, 0, 1,
-0.7855232, 0.8837447, -0.5149837, 0.7529412, 1, 0, 1,
-0.7802692, -0.1735047, -0.7879835, 0.7450981, 1, 0, 1,
-0.778426, 0.2239788, -0.2947059, 0.7411765, 1, 0, 1,
-0.7703757, -0.5294471, -2.911918, 0.7333333, 1, 0, 1,
-0.7703149, 1.292886, 0.02325265, 0.7294118, 1, 0, 1,
-0.7631175, -0.8273537, -1.643486, 0.7215686, 1, 0, 1,
-0.7621481, -1.238209, -1.647071, 0.7176471, 1, 0, 1,
-0.7600271, -0.04969182, -0.838511, 0.7098039, 1, 0, 1,
-0.7540491, 2.14168, -1.987959, 0.7058824, 1, 0, 1,
-0.7529699, 0.5338688, -2.752255, 0.6980392, 1, 0, 1,
-0.7519943, -1.327708, -1.491676, 0.6901961, 1, 0, 1,
-0.7452416, -0.2653632, -1.497562, 0.6862745, 1, 0, 1,
-0.7336319, 1.086874, -1.409671, 0.6784314, 1, 0, 1,
-0.7335263, -3.479472, -3.505538, 0.6745098, 1, 0, 1,
-0.7305318, -0.0653749, -0.1935033, 0.6666667, 1, 0, 1,
-0.7248276, -1.193012, -2.409158, 0.6627451, 1, 0, 1,
-0.7243835, -2.104769, -1.567076, 0.654902, 1, 0, 1,
-0.7131079, -0.1197609, -1.673572, 0.6509804, 1, 0, 1,
-0.7112202, -1.734781, -2.610234, 0.6431373, 1, 0, 1,
-0.7093616, 0.5365441, -1.213886, 0.6392157, 1, 0, 1,
-0.7074999, 0.789843, -0.9312854, 0.6313726, 1, 0, 1,
-0.7065079, -1.014711, -2.040575, 0.627451, 1, 0, 1,
-0.7054779, 0.1156681, -1.488487, 0.6196079, 1, 0, 1,
-0.697413, -0.1100535, -2.288597, 0.6156863, 1, 0, 1,
-0.6966015, 1.413526, -1.806239, 0.6078432, 1, 0, 1,
-0.6923479, 0.3153134, -2.251442, 0.6039216, 1, 0, 1,
-0.6907315, 0.8471287, -0.5376404, 0.5960785, 1, 0, 1,
-0.6903839, 2.08329, 1.248219, 0.5882353, 1, 0, 1,
-0.6902562, -0.7355738, -2.27597, 0.5843138, 1, 0, 1,
-0.6706092, -0.5953943, -2.685632, 0.5764706, 1, 0, 1,
-0.6702029, -1.421797, -3.080293, 0.572549, 1, 0, 1,
-0.6674975, -0.1953965, -3.447666, 0.5647059, 1, 0, 1,
-0.6673015, 0.5422047, -1.996742, 0.5607843, 1, 0, 1,
-0.6667449, 0.5010497, -0.8575258, 0.5529412, 1, 0, 1,
-0.6619436, -0.06037245, -3.359749, 0.5490196, 1, 0, 1,
-0.6605464, -0.09525625, -1.205733, 0.5411765, 1, 0, 1,
-0.6601855, -0.1890423, -1.862073, 0.5372549, 1, 0, 1,
-0.6544997, 0.5159756, -1.954921, 0.5294118, 1, 0, 1,
-0.6544628, 0.6770216, 0.06661247, 0.5254902, 1, 0, 1,
-0.6544204, -1.128698, -3.72513, 0.5176471, 1, 0, 1,
-0.6529166, -1.536161, -2.882222, 0.5137255, 1, 0, 1,
-0.6444696, 0.1195863, -1.369651, 0.5058824, 1, 0, 1,
-0.6380714, 1.677134, -0.27479, 0.5019608, 1, 0, 1,
-0.6376625, -0.4405437, -2.477898, 0.4941176, 1, 0, 1,
-0.6375734, -1.165318, -2.086416, 0.4862745, 1, 0, 1,
-0.6354526, 0.2353511, -1.280717, 0.4823529, 1, 0, 1,
-0.6335551, -0.05273172, -2.924027, 0.4745098, 1, 0, 1,
-0.6332089, 0.9817437, -0.817417, 0.4705882, 1, 0, 1,
-0.6247043, -0.1257268, -1.978353, 0.4627451, 1, 0, 1,
-0.6175558, -0.3692244, -1.44661, 0.4588235, 1, 0, 1,
-0.6141672, 0.5594022, -0.4829692, 0.4509804, 1, 0, 1,
-0.6138496, -0.08380231, -1.291111, 0.4470588, 1, 0, 1,
-0.6108871, -0.206989, -0.8281093, 0.4392157, 1, 0, 1,
-0.6100289, 0.5430773, -0.6779436, 0.4352941, 1, 0, 1,
-0.6090975, -0.2119564, -2.551526, 0.427451, 1, 0, 1,
-0.6084474, -0.8777399, -3.861451, 0.4235294, 1, 0, 1,
-0.6041762, 0.6245233, -0.1825136, 0.4156863, 1, 0, 1,
-0.6036162, 0.4522503, -0.05793287, 0.4117647, 1, 0, 1,
-0.5994681, 0.06769197, -2.204205, 0.4039216, 1, 0, 1,
-0.5953627, 0.0793997, -0.9894866, 0.3960784, 1, 0, 1,
-0.5949746, 0.3254606, -1.061269, 0.3921569, 1, 0, 1,
-0.5907933, -0.1010373, -2.510803, 0.3843137, 1, 0, 1,
-0.5900134, 1.030556, -1.035868, 0.3803922, 1, 0, 1,
-0.5880614, -0.2028156, -2.461894, 0.372549, 1, 0, 1,
-0.5876613, 0.748643, 0.1014937, 0.3686275, 1, 0, 1,
-0.5817443, -0.1758265, -1.414913, 0.3607843, 1, 0, 1,
-0.564895, 1.311249, 0.3964101, 0.3568628, 1, 0, 1,
-0.563908, -1.619499, -1.496251, 0.3490196, 1, 0, 1,
-0.5586878, 0.4292522, 0.2265257, 0.345098, 1, 0, 1,
-0.551484, -0.09508937, -3.024117, 0.3372549, 1, 0, 1,
-0.5499875, 0.03993657, -0.9297952, 0.3333333, 1, 0, 1,
-0.5491515, 0.514411, -2.554382, 0.3254902, 1, 0, 1,
-0.5461755, -0.7659594, -3.778212, 0.3215686, 1, 0, 1,
-0.5456467, 0.5533973, -2.230242, 0.3137255, 1, 0, 1,
-0.542264, 0.5795777, -0.9162021, 0.3098039, 1, 0, 1,
-0.537938, -1.248559, -2.817481, 0.3019608, 1, 0, 1,
-0.5364433, -1.226102, -1.815545, 0.2941177, 1, 0, 1,
-0.5351722, -1.039207, -3.591047, 0.2901961, 1, 0, 1,
-0.5340297, -0.7267572, -1.753501, 0.282353, 1, 0, 1,
-0.5307847, 0.08868042, -0.8447714, 0.2784314, 1, 0, 1,
-0.5270779, -0.1365524, -1.303538, 0.2705882, 1, 0, 1,
-0.5257714, 0.2151796, -2.409769, 0.2666667, 1, 0, 1,
-0.5231029, 1.392024, 0.5849059, 0.2588235, 1, 0, 1,
-0.5229982, -0.2068188, -1.654069, 0.254902, 1, 0, 1,
-0.522861, -0.3230721, -3.702928, 0.2470588, 1, 0, 1,
-0.5180997, 1.113751, 0.04367739, 0.2431373, 1, 0, 1,
-0.5154052, 0.6484659, -0.4319029, 0.2352941, 1, 0, 1,
-0.5141805, -0.7803445, -2.473303, 0.2313726, 1, 0, 1,
-0.5130649, 0.5140281, -1.153878, 0.2235294, 1, 0, 1,
-0.5120941, -0.4167296, -0.3594884, 0.2196078, 1, 0, 1,
-0.5091682, 0.6929733, -0.9918186, 0.2117647, 1, 0, 1,
-0.507614, 1.185221, 1.501311, 0.2078431, 1, 0, 1,
-0.5063779, 1.537511, -0.7262352, 0.2, 1, 0, 1,
-0.5049779, -1.299906, -3.654803, 0.1921569, 1, 0, 1,
-0.5046427, 1.112049, -0.7941023, 0.1882353, 1, 0, 1,
-0.5025823, 1.261335, -1.537624, 0.1803922, 1, 0, 1,
-0.4997559, -1.547344, -3.60598, 0.1764706, 1, 0, 1,
-0.4938868, -0.2170433, -0.8578786, 0.1686275, 1, 0, 1,
-0.4926251, 0.7534158, -0.7868011, 0.1647059, 1, 0, 1,
-0.489179, 0.7517149, -0.9573032, 0.1568628, 1, 0, 1,
-0.4885847, -1.287096, -3.16588, 0.1529412, 1, 0, 1,
-0.487408, 0.7201562, -0.8395993, 0.145098, 1, 0, 1,
-0.4857706, 0.4620875, -0.8389316, 0.1411765, 1, 0, 1,
-0.4829333, -0.1794475, -1.456754, 0.1333333, 1, 0, 1,
-0.4818831, -1.623926, -4.058046, 0.1294118, 1, 0, 1,
-0.4749346, 0.9441677, -0.2972719, 0.1215686, 1, 0, 1,
-0.4700689, -1.270093, -2.671041, 0.1176471, 1, 0, 1,
-0.4698856, -0.643108, -3.002464, 0.1098039, 1, 0, 1,
-0.4654444, 0.9581447, -0.6556777, 0.1058824, 1, 0, 1,
-0.4625643, 0.2688041, -0.7034751, 0.09803922, 1, 0, 1,
-0.4563922, -0.03744536, -2.031066, 0.09019608, 1, 0, 1,
-0.455682, -0.5703949, 0.0414728, 0.08627451, 1, 0, 1,
-0.4484857, -0.3345413, -1.22693, 0.07843138, 1, 0, 1,
-0.4480739, 1.353194, -1.33561, 0.07450981, 1, 0, 1,
-0.4475442, -0.7451954, -2.183008, 0.06666667, 1, 0, 1,
-0.4464039, -1.322258, -4.323884, 0.0627451, 1, 0, 1,
-0.4431945, 0.2417456, -1.921506, 0.05490196, 1, 0, 1,
-0.4306926, 1.706905, 0.1830084, 0.05098039, 1, 0, 1,
-0.4233968, -0.4709717, -0.9526946, 0.04313726, 1, 0, 1,
-0.4165916, 0.7684507, -0.03645939, 0.03921569, 1, 0, 1,
-0.416428, -0.4102536, -3.645837, 0.03137255, 1, 0, 1,
-0.4146439, -0.4549125, -2.21167, 0.02745098, 1, 0, 1,
-0.4141819, -0.5652723, -2.867609, 0.01960784, 1, 0, 1,
-0.407571, -0.8030828, -1.716202, 0.01568628, 1, 0, 1,
-0.4063066, 0.1860197, 0.2589127, 0.007843138, 1, 0, 1,
-0.3925397, 0.1348905, -2.06367, 0.003921569, 1, 0, 1,
-0.3887348, 0.7573121, -0.8922747, 0, 1, 0.003921569, 1,
-0.3862326, 2.457513, 0.352923, 0, 1, 0.01176471, 1,
-0.3827233, -1.066654, -2.097045, 0, 1, 0.01568628, 1,
-0.3791432, -0.368246, -3.55056, 0, 1, 0.02352941, 1,
-0.3781106, 0.6293299, -0.3436159, 0, 1, 0.02745098, 1,
-0.3742915, 0.07731098, -2.210533, 0, 1, 0.03529412, 1,
-0.3728381, -1.256304, -2.411841, 0, 1, 0.03921569, 1,
-0.3706246, 0.2598209, 0.06825624, 0, 1, 0.04705882, 1,
-0.3637087, -2.292918, -1.881363, 0, 1, 0.05098039, 1,
-0.3622158, -0.001001922, -0.100485, 0, 1, 0.05882353, 1,
-0.3617678, 1.39053, -0.5986978, 0, 1, 0.0627451, 1,
-0.3560465, 1.071644, 0.2738017, 0, 1, 0.07058824, 1,
-0.3540866, 0.2289096, -0.1801856, 0, 1, 0.07450981, 1,
-0.3453187, -1.815853, -3.004025, 0, 1, 0.08235294, 1,
-0.3434181, -0.5972615, -2.01445, 0, 1, 0.08627451, 1,
-0.3425529, -0.3731116, -3.393857, 0, 1, 0.09411765, 1,
-0.3317607, 1.198177, -0.2286104, 0, 1, 0.1019608, 1,
-0.3280644, 1.467791, -0.6252416, 0, 1, 0.1058824, 1,
-0.3263977, 0.7075422, -1.806686, 0, 1, 0.1137255, 1,
-0.3207079, 0.645387, -1.694842, 0, 1, 0.1176471, 1,
-0.316702, 1.161979, 0.221686, 0, 1, 0.1254902, 1,
-0.3077635, 0.6068588, -1.015337, 0, 1, 0.1294118, 1,
-0.300346, -0.6286009, -2.541524, 0, 1, 0.1372549, 1,
-0.2914861, 0.786752, 1.36311, 0, 1, 0.1411765, 1,
-0.2898597, -0.8481365, -2.264903, 0, 1, 0.1490196, 1,
-0.2895114, -0.1454459, -1.455969, 0, 1, 0.1529412, 1,
-0.2894406, 1.639891, -2.092202, 0, 1, 0.1607843, 1,
-0.2829328, -1.361276, -4.058833, 0, 1, 0.1647059, 1,
-0.2816968, -0.3694701, -1.062416, 0, 1, 0.172549, 1,
-0.2798092, -0.4735201, -2.031189, 0, 1, 0.1764706, 1,
-0.279533, 0.4765274, -3.080075, 0, 1, 0.1843137, 1,
-0.2732987, 1.513827, 1.023071, 0, 1, 0.1882353, 1,
-0.2732977, -0.8921252, -1.796003, 0, 1, 0.1960784, 1,
-0.2709983, -2.230261, -2.35755, 0, 1, 0.2039216, 1,
-0.2683536, -0.9306608, -1.871316, 0, 1, 0.2078431, 1,
-0.268095, 0.8586438, 0.4914212, 0, 1, 0.2156863, 1,
-0.2628314, -2.391399, -4.535456, 0, 1, 0.2196078, 1,
-0.2608343, 0.5704791, -0.8661929, 0, 1, 0.227451, 1,
-0.2607187, -0.4679526, -2.980099, 0, 1, 0.2313726, 1,
-0.2606025, -0.2177729, -4.057755, 0, 1, 0.2392157, 1,
-0.2584895, 0.6432206, -0.9777877, 0, 1, 0.2431373, 1,
-0.2579999, 0.6791584, 1.008495, 0, 1, 0.2509804, 1,
-0.2494009, 2.212432, -0.7423344, 0, 1, 0.254902, 1,
-0.2482792, 0.6256984, -2.16774, 0, 1, 0.2627451, 1,
-0.2452567, -0.3286692, -2.462889, 0, 1, 0.2666667, 1,
-0.2437768, 0.8391753, 0.9112281, 0, 1, 0.2745098, 1,
-0.2435153, 0.4398106, -0.9014177, 0, 1, 0.2784314, 1,
-0.2419982, 0.8872994, 0.8160872, 0, 1, 0.2862745, 1,
-0.2408581, -0.4098495, -1.787021, 0, 1, 0.2901961, 1,
-0.2395771, 1.149198, 0.693826, 0, 1, 0.2980392, 1,
-0.2378097, -1.306458, -2.637764, 0, 1, 0.3058824, 1,
-0.233249, -0.2119678, -3.166918, 0, 1, 0.3098039, 1,
-0.232172, 1.688526, -0.2990553, 0, 1, 0.3176471, 1,
-0.2285035, -0.6696616, -2.171083, 0, 1, 0.3215686, 1,
-0.2247864, -0.9287187, -2.997212, 0, 1, 0.3294118, 1,
-0.2180288, 0.9056687, -0.726605, 0, 1, 0.3333333, 1,
-0.2113864, -0.1063733, -1.790341, 0, 1, 0.3411765, 1,
-0.2103302, -0.6009412, -3.120788, 0, 1, 0.345098, 1,
-0.203781, 0.510839, -0.7099102, 0, 1, 0.3529412, 1,
-0.2004386, -0.8062074, -0.8264552, 0, 1, 0.3568628, 1,
-0.1995819, -1.499462, -3.728228, 0, 1, 0.3647059, 1,
-0.1994991, 0.7337097, 0.07779926, 0, 1, 0.3686275, 1,
-0.1970359, -1.63326, -3.888913, 0, 1, 0.3764706, 1,
-0.1943832, -0.638716, -4.574749, 0, 1, 0.3803922, 1,
-0.1872784, -1.616318, -5.074669, 0, 1, 0.3882353, 1,
-0.1848485, 1.271794, -0.1996899, 0, 1, 0.3921569, 1,
-0.1847416, 0.6178569, -1.547182, 0, 1, 0.4, 1,
-0.1818719, -0.202988, -4.135233, 0, 1, 0.4078431, 1,
-0.1796504, -1.636527, -2.301114, 0, 1, 0.4117647, 1,
-0.1795743, -0.8219164, -3.285135, 0, 1, 0.4196078, 1,
-0.1764463, 0.1869927, 0.2477158, 0, 1, 0.4235294, 1,
-0.173186, 1.354235, 0.5166284, 0, 1, 0.4313726, 1,
-0.1658992, -2.401386, -2.31928, 0, 1, 0.4352941, 1,
-0.1647721, 1.095269, -0.6207101, 0, 1, 0.4431373, 1,
-0.1625142, -0.3918646, -3.696742, 0, 1, 0.4470588, 1,
-0.150189, -0.5986552, -1.594479, 0, 1, 0.454902, 1,
-0.149452, 1.119483, -0.5745192, 0, 1, 0.4588235, 1,
-0.1488755, 0.1887153, 0.03824305, 0, 1, 0.4666667, 1,
-0.1475016, -0.4433306, -1.86072, 0, 1, 0.4705882, 1,
-0.1415119, -1.775123, -1.466845, 0, 1, 0.4784314, 1,
-0.1316177, -0.1855736, -2.745016, 0, 1, 0.4823529, 1,
-0.1303861, -0.09673821, -1.513191, 0, 1, 0.4901961, 1,
-0.1293066, 0.4679096, 1.834419, 0, 1, 0.4941176, 1,
-0.1290974, 1.782588, -0.9712145, 0, 1, 0.5019608, 1,
-0.1273795, -0.9825541, -3.407952, 0, 1, 0.509804, 1,
-0.1269477, 1.162064, 0.792227, 0, 1, 0.5137255, 1,
-0.1269399, -1.439959, -1.680587, 0, 1, 0.5215687, 1,
-0.123118, 0.858386, -0.7282748, 0, 1, 0.5254902, 1,
-0.1217425, 0.4781674, -0.379757, 0, 1, 0.5333334, 1,
-0.1154755, -0.8398789, -2.601687, 0, 1, 0.5372549, 1,
-0.1151313, -0.494232, -1.483176, 0, 1, 0.5450981, 1,
-0.1140654, -0.3155861, -2.798594, 0, 1, 0.5490196, 1,
-0.11085, -1.243281, -3.12425, 0, 1, 0.5568628, 1,
-0.110337, -0.9518511, -3.303182, 0, 1, 0.5607843, 1,
-0.1052275, 0.7271038, 0.1975717, 0, 1, 0.5686275, 1,
-0.1019238, -1.276718, -3.499359, 0, 1, 0.572549, 1,
-0.101228, 0.4180888, -0.3618167, 0, 1, 0.5803922, 1,
-0.1001876, 0.2194063, -0.6852745, 0, 1, 0.5843138, 1,
-0.09858011, -0.2900003, -1.788857, 0, 1, 0.5921569, 1,
-0.09794634, -1.36706, -3.951595, 0, 1, 0.5960785, 1,
-0.09661671, 1.080395, 0.880316, 0, 1, 0.6039216, 1,
-0.09008619, 0.716174, 0.5682654, 0, 1, 0.6117647, 1,
-0.08989982, -1.417226, -3.250645, 0, 1, 0.6156863, 1,
-0.08620326, -1.974437, -4.330445, 0, 1, 0.6235294, 1,
-0.08599789, -0.02325727, -1.873286, 0, 1, 0.627451, 1,
-0.08427244, 0.3380336, -1.38915, 0, 1, 0.6352941, 1,
-0.08304365, 4.709875e-05, -1.256872, 0, 1, 0.6392157, 1,
-0.08250319, -0.6598476, -1.053772, 0, 1, 0.6470588, 1,
-0.07886558, -1.371524, -3.297523, 0, 1, 0.6509804, 1,
-0.07851259, 0.5804412, -0.2164379, 0, 1, 0.6588235, 1,
-0.0784058, -0.5514227, -3.966483, 0, 1, 0.6627451, 1,
-0.07663173, 1.153001, 0.3950064, 0, 1, 0.6705883, 1,
-0.07239735, -0.8671329, -4.50846, 0, 1, 0.6745098, 1,
-0.07191317, 1.31185, -0.8881592, 0, 1, 0.682353, 1,
-0.06406006, -0.7861054, -4.061547, 0, 1, 0.6862745, 1,
-0.0640365, 0.007407075, 0.2633009, 0, 1, 0.6941177, 1,
-0.06279981, -1.272512, -3.888889, 0, 1, 0.7019608, 1,
-0.06017207, -0.2137575, -2.738387, 0, 1, 0.7058824, 1,
-0.05765741, -1.007382, -4.06763, 0, 1, 0.7137255, 1,
-0.05720707, -2.377851, -2.908479, 0, 1, 0.7176471, 1,
-0.05641764, -1.496032, -2.876842, 0, 1, 0.7254902, 1,
-0.05454127, 1.175403, 0.6719719, 0, 1, 0.7294118, 1,
-0.0526965, -1.210839, -4.562872, 0, 1, 0.7372549, 1,
-0.05186042, 0.9967378, -0.926805, 0, 1, 0.7411765, 1,
-0.04700118, -1.058496, -2.589646, 0, 1, 0.7490196, 1,
-0.04320387, 1.085859, 1.010596, 0, 1, 0.7529412, 1,
-0.04316743, -0.2475186, -3.875737, 0, 1, 0.7607843, 1,
-0.04135009, 0.7781268, -0.01089234, 0, 1, 0.7647059, 1,
-0.03991053, 0.2522904, -0.4102363, 0, 1, 0.772549, 1,
-0.03591837, 1.059059, 0.5327061, 0, 1, 0.7764706, 1,
-0.0320527, -0.07110673, -3.537735, 0, 1, 0.7843137, 1,
-0.03081797, 0.568902, -0.5070531, 0, 1, 0.7882353, 1,
-0.02989795, -0.361156, -3.159086, 0, 1, 0.7960784, 1,
-0.02949215, 2.929337, 0.1427622, 0, 1, 0.8039216, 1,
-0.02741204, -0.8146374, -2.484914, 0, 1, 0.8078431, 1,
-0.02529832, -1.163864, -1.912258, 0, 1, 0.8156863, 1,
-0.02404081, 0.9041012, 0.2291041, 0, 1, 0.8196079, 1,
-0.02282295, 0.9423831, -0.3967972, 0, 1, 0.827451, 1,
-0.02183296, -0.1007659, -2.611923, 0, 1, 0.8313726, 1,
-0.01938538, -1.189462, -3.305276, 0, 1, 0.8392157, 1,
-0.01718946, -0.3946232, -4.105465, 0, 1, 0.8431373, 1,
-0.01666716, -1.425937, -2.561741, 0, 1, 0.8509804, 1,
-0.01630262, 2.013611, -2.003377, 0, 1, 0.854902, 1,
-0.0152869, 0.6037412, -0.2671584, 0, 1, 0.8627451, 1,
-0.01406683, 1.175881, -0.1047758, 0, 1, 0.8666667, 1,
-0.01379916, 0.3271132, -0.1670634, 0, 1, 0.8745098, 1,
-0.01295001, 0.1370196, 0.2182195, 0, 1, 0.8784314, 1,
-0.01177677, -1.26954, -3.546197, 0, 1, 0.8862745, 1,
-0.01169464, -0.5767416, -3.132998, 0, 1, 0.8901961, 1,
-0.01098048, -0.7560258, -4.188739, 0, 1, 0.8980392, 1,
-0.009484001, -0.2513475, -1.088243, 0, 1, 0.9058824, 1,
-0.009024161, 0.8639756, -0.8084053, 0, 1, 0.9098039, 1,
-0.005122249, 0.9497634, 0.4894927, 0, 1, 0.9176471, 1,
0.004565412, 1.475958, 0.1062719, 0, 1, 0.9215686, 1,
0.00683212, 0.1784792, 0.3679404, 0, 1, 0.9294118, 1,
0.007010093, -0.3828013, 3.889816, 0, 1, 0.9333333, 1,
0.00752467, 0.8490606, 1.290067, 0, 1, 0.9411765, 1,
0.007683104, -2.131916, 3.922485, 0, 1, 0.945098, 1,
0.01037712, -0.4596961, 3.543366, 0, 1, 0.9529412, 1,
0.01083363, 1.526198, -0.03383243, 0, 1, 0.9568627, 1,
0.01349576, -0.03045479, 2.42083, 0, 1, 0.9647059, 1,
0.01392639, 0.7737901, -0.0919707, 0, 1, 0.9686275, 1,
0.01610896, -0.9892213, 1.55875, 0, 1, 0.9764706, 1,
0.02299869, 0.530946, 0.07881466, 0, 1, 0.9803922, 1,
0.02400763, 1.053572, 1.277072, 0, 1, 0.9882353, 1,
0.0242062, 0.3949323, -0.4429173, 0, 1, 0.9921569, 1,
0.02634867, 1.239142, 0.1922838, 0, 1, 1, 1,
0.03404467, 1.001643, 0.8365617, 0, 0.9921569, 1, 1,
0.03525795, -0.597822, 3.819038, 0, 0.9882353, 1, 1,
0.04331225, -0.4054632, 2.443063, 0, 0.9803922, 1, 1,
0.0500062, -2.811889, 4.535221, 0, 0.9764706, 1, 1,
0.05043978, 0.05696631, 0.4028104, 0, 0.9686275, 1, 1,
0.053928, -0.2529224, 2.405174, 0, 0.9647059, 1, 1,
0.05774854, 0.1798048, 0.1777157, 0, 0.9568627, 1, 1,
0.05818515, -1.685194, 3.316955, 0, 0.9529412, 1, 1,
0.06569883, 1.353667, -0.5753539, 0, 0.945098, 1, 1,
0.06648494, 2.412114, -0.9945995, 0, 0.9411765, 1, 1,
0.06749601, -1.05049, 2.801893, 0, 0.9333333, 1, 1,
0.06771166, 0.4209444, 1.571295, 0, 0.9294118, 1, 1,
0.07049696, 0.5714856, -0.1104026, 0, 0.9215686, 1, 1,
0.08189061, 0.0992349, 2.593256, 0, 0.9176471, 1, 1,
0.08195851, 1.412523, -0.7013385, 0, 0.9098039, 1, 1,
0.08375409, 0.2736935, -0.1285038, 0, 0.9058824, 1, 1,
0.08887457, 0.002747713, 1.678538, 0, 0.8980392, 1, 1,
0.08969678, -1.557817, 3.142668, 0, 0.8901961, 1, 1,
0.09073959, -0.4333405, 3.682333, 0, 0.8862745, 1, 1,
0.09282011, -0.1812851, 2.401942, 0, 0.8784314, 1, 1,
0.09836849, -0.4526935, 2.180372, 0, 0.8745098, 1, 1,
0.1024034, 2.434762, 0.9810172, 0, 0.8666667, 1, 1,
0.1034688, 1.317942, -0.6665986, 0, 0.8627451, 1, 1,
0.1035695, 2.748869, -0.8131145, 0, 0.854902, 1, 1,
0.1043966, 0.6990396, 0.2258426, 0, 0.8509804, 1, 1,
0.1046774, -0.4021475, 2.115742, 0, 0.8431373, 1, 1,
0.1055665, 1.081547, -0.4440458, 0, 0.8392157, 1, 1,
0.1080298, -1.718496, 2.126834, 0, 0.8313726, 1, 1,
0.1142692, 0.1531314, -0.2863293, 0, 0.827451, 1, 1,
0.1177854, 0.6353378, 0.3092332, 0, 0.8196079, 1, 1,
0.1182349, 0.7463742, 1.003372, 0, 0.8156863, 1, 1,
0.1208225, 0.4383719, -0.06161056, 0, 0.8078431, 1, 1,
0.1222041, 0.5578513, 0.03261518, 0, 0.8039216, 1, 1,
0.1325366, 1.45127, 0.3211324, 0, 0.7960784, 1, 1,
0.1360194, -0.648914, 2.838459, 0, 0.7882353, 1, 1,
0.1370258, -0.7658162, 3.222271, 0, 0.7843137, 1, 1,
0.1374672, 0.9136078, 1.095167, 0, 0.7764706, 1, 1,
0.1407469, 0.7266114, -0.4162579, 0, 0.772549, 1, 1,
0.1412165, 0.7403025, 0.1493075, 0, 0.7647059, 1, 1,
0.1439261, -1.306104, 1.807705, 0, 0.7607843, 1, 1,
0.1447979, 0.6280711, 0.8189896, 0, 0.7529412, 1, 1,
0.1524581, 1.334756, -0.6271275, 0, 0.7490196, 1, 1,
0.1603947, -1.161964, 3.320298, 0, 0.7411765, 1, 1,
0.1616931, 0.986163, -0.728597, 0, 0.7372549, 1, 1,
0.1643144, 0.1552531, 0.7174111, 0, 0.7294118, 1, 1,
0.1688425, 0.9899159, 0.1501169, 0, 0.7254902, 1, 1,
0.1740464, -0.02643244, 2.418274, 0, 0.7176471, 1, 1,
0.1813435, -1.595669, 3.4499, 0, 0.7137255, 1, 1,
0.1822126, 0.1077739, 1.41732, 0, 0.7058824, 1, 1,
0.1868829, 0.6207791, 0.4230909, 0, 0.6980392, 1, 1,
0.1886574, 0.02734997, 2.675438, 0, 0.6941177, 1, 1,
0.1923619, -1.557974, 4.285935, 0, 0.6862745, 1, 1,
0.1929889, -0.3629407, 1.629025, 0, 0.682353, 1, 1,
0.201214, -0.2614687, 2.260978, 0, 0.6745098, 1, 1,
0.2042858, -0.6542493, 4.230254, 0, 0.6705883, 1, 1,
0.210996, -0.2195531, 2.52336, 0, 0.6627451, 1, 1,
0.2112975, -0.7242355, 2.41453, 0, 0.6588235, 1, 1,
0.2133419, 1.011639, 0.6969307, 0, 0.6509804, 1, 1,
0.215548, 1.558751, 0.6699162, 0, 0.6470588, 1, 1,
0.2156867, 0.02123979, 2.12788, 0, 0.6392157, 1, 1,
0.2187758, 0.2807115, 0.06186191, 0, 0.6352941, 1, 1,
0.2188272, -1.352528, 2.970309, 0, 0.627451, 1, 1,
0.2210777, 0.600673, 0.8975568, 0, 0.6235294, 1, 1,
0.2226438, -0.7951944, 5.516822, 0, 0.6156863, 1, 1,
0.2251041, 0.9515684, 0.05931526, 0, 0.6117647, 1, 1,
0.2273963, -1.167538, 2.755186, 0, 0.6039216, 1, 1,
0.2285365, -1.327549, 2.304586, 0, 0.5960785, 1, 1,
0.2328096, 0.6659465, 1.438727, 0, 0.5921569, 1, 1,
0.2332477, 0.2804096, 1.356007, 0, 0.5843138, 1, 1,
0.245922, 2.401222, -1.668562, 0, 0.5803922, 1, 1,
0.2467942, 0.7581229, -0.8901206, 0, 0.572549, 1, 1,
0.2511443, -0.989172, 3.002154, 0, 0.5686275, 1, 1,
0.2526903, 0.6657892, 1.009763, 0, 0.5607843, 1, 1,
0.2536209, 0.251644, 1.500665, 0, 0.5568628, 1, 1,
0.2569425, -0.7222878, 3.481116, 0, 0.5490196, 1, 1,
0.2611029, -0.237983, 1.212916, 0, 0.5450981, 1, 1,
0.2622817, 0.2289283, 1.976629, 0, 0.5372549, 1, 1,
0.2645855, 0.5275438, 0.5355755, 0, 0.5333334, 1, 1,
0.2653609, -1.739221, 1.8316, 0, 0.5254902, 1, 1,
0.2661875, 1.572872, -0.426381, 0, 0.5215687, 1, 1,
0.2689214, -1.92358, 3.589741, 0, 0.5137255, 1, 1,
0.2697182, 0.1395079, 1.180984, 0, 0.509804, 1, 1,
0.2718489, 0.8917332, 0.04571265, 0, 0.5019608, 1, 1,
0.2750368, 0.2966472, 0.5401813, 0, 0.4941176, 1, 1,
0.2751127, -0.2602365, 2.019256, 0, 0.4901961, 1, 1,
0.2755024, -0.4222151, 1.958045, 0, 0.4823529, 1, 1,
0.278091, 0.239147, 1.694611, 0, 0.4784314, 1, 1,
0.2822221, 0.9439228, 0.5100216, 0, 0.4705882, 1, 1,
0.2838637, 0.06362614, 1.014002, 0, 0.4666667, 1, 1,
0.2882231, 1.098796, 1.473448, 0, 0.4588235, 1, 1,
0.2884299, 1.368455, -0.1081758, 0, 0.454902, 1, 1,
0.2996175, 0.04147289, 1.690012, 0, 0.4470588, 1, 1,
0.3020308, 0.4777042, 0.005727676, 0, 0.4431373, 1, 1,
0.3029172, -0.3876663, 2.184426, 0, 0.4352941, 1, 1,
0.3047734, 1.057338, 0.8256594, 0, 0.4313726, 1, 1,
0.3052259, -0.4632584, 1.442158, 0, 0.4235294, 1, 1,
0.3068188, 0.06552376, 0.8918577, 0, 0.4196078, 1, 1,
0.3157819, 0.1168099, 1.383333, 0, 0.4117647, 1, 1,
0.3161794, 0.3019872, 1.375068, 0, 0.4078431, 1, 1,
0.3165287, 1.590564, 0.5854388, 0, 0.4, 1, 1,
0.3169192, 0.02693055, 2.908157, 0, 0.3921569, 1, 1,
0.3222367, -0.8030825, 2.606782, 0, 0.3882353, 1, 1,
0.3235056, 1.283305, 1.577573, 0, 0.3803922, 1, 1,
0.3237996, 1.130827, -0.6274455, 0, 0.3764706, 1, 1,
0.3239264, -0.4431901, 2.106644, 0, 0.3686275, 1, 1,
0.3265147, -0.2994253, 0.4294789, 0, 0.3647059, 1, 1,
0.3267801, 1.482528, -0.04952147, 0, 0.3568628, 1, 1,
0.3268093, 0.9748811, 1.398827, 0, 0.3529412, 1, 1,
0.3283499, -0.6229895, 4.238801, 0, 0.345098, 1, 1,
0.330965, -0.01914714, 2.142018, 0, 0.3411765, 1, 1,
0.3329961, -1.298534, 2.434881, 0, 0.3333333, 1, 1,
0.3387734, 0.003762842, 1.133449, 0, 0.3294118, 1, 1,
0.3388448, 0.1809339, 1.694577, 0, 0.3215686, 1, 1,
0.3418519, -0.09738252, 2.909822, 0, 0.3176471, 1, 1,
0.3444996, -0.6332698, 3.188635, 0, 0.3098039, 1, 1,
0.3475278, -0.6417508, 1.743962, 0, 0.3058824, 1, 1,
0.3492294, -1.195951, 2.36485, 0, 0.2980392, 1, 1,
0.349922, 0.006860568, 2.033107, 0, 0.2901961, 1, 1,
0.3522005, 0.9636814, 0.939509, 0, 0.2862745, 1, 1,
0.3531981, 0.2988073, 0.5428549, 0, 0.2784314, 1, 1,
0.3534648, -1.432206, 3.255172, 0, 0.2745098, 1, 1,
0.3534875, 0.9748284, 0.9193558, 0, 0.2666667, 1, 1,
0.3543272, -1.706817, 4.178009, 0, 0.2627451, 1, 1,
0.359938, -0.5071589, 1.882365, 0, 0.254902, 1, 1,
0.3600853, -2.419437, 1.805282, 0, 0.2509804, 1, 1,
0.3604749, 1.462093, -0.7444813, 0, 0.2431373, 1, 1,
0.3613209, -0.7695576, 2.679955, 0, 0.2392157, 1, 1,
0.3643418, -0.3555012, 2.123972, 0, 0.2313726, 1, 1,
0.3669178, -1.136565, 2.641843, 0, 0.227451, 1, 1,
0.3685936, -0.06204702, 2.076231, 0, 0.2196078, 1, 1,
0.3721041, 0.8639092, -0.2867564, 0, 0.2156863, 1, 1,
0.3724434, 0.1819945, 2.126853, 0, 0.2078431, 1, 1,
0.3735832, -0.1761626, 1.558431, 0, 0.2039216, 1, 1,
0.3736885, -1.205594, 4.577842, 0, 0.1960784, 1, 1,
0.3750846, -0.5753943, 3.057272, 0, 0.1882353, 1, 1,
0.3798508, 1.449738, 0.4085037, 0, 0.1843137, 1, 1,
0.3810349, -0.3763608, 1.728402, 0, 0.1764706, 1, 1,
0.38126, 0.1333399, -0.02433343, 0, 0.172549, 1, 1,
0.3825309, 0.07604447, 1.828441, 0, 0.1647059, 1, 1,
0.3837799, -0.395682, 0.456883, 0, 0.1607843, 1, 1,
0.3892476, 1.914779, 0.7224882, 0, 0.1529412, 1, 1,
0.390132, 1.064647, -0.8818054, 0, 0.1490196, 1, 1,
0.3942499, -1.253885, 3.860713, 0, 0.1411765, 1, 1,
0.3973773, -0.8788614, 2.528807, 0, 0.1372549, 1, 1,
0.3992048, 0.2015913, 1.560399, 0, 0.1294118, 1, 1,
0.3997179, 0.8637784, 0.808162, 0, 0.1254902, 1, 1,
0.4106234, 0.7729303, 1.467435, 0, 0.1176471, 1, 1,
0.4112337, 0.7250612, -0.006903719, 0, 0.1137255, 1, 1,
0.4156179, -0.452904, 3.546819, 0, 0.1058824, 1, 1,
0.4201077, 1.361836, 0.9856275, 0, 0.09803922, 1, 1,
0.4254349, -1.85475, 3.533655, 0, 0.09411765, 1, 1,
0.4257796, -0.5768485, 0.6578693, 0, 0.08627451, 1, 1,
0.4270439, 0.1847261, 1.076504, 0, 0.08235294, 1, 1,
0.4278729, 0.04451625, 1.712369, 0, 0.07450981, 1, 1,
0.4280333, 0.7550434, 0.6008747, 0, 0.07058824, 1, 1,
0.4284716, 0.01927942, 2.953403, 0, 0.0627451, 1, 1,
0.4314645, -0.4250612, 1.937425, 0, 0.05882353, 1, 1,
0.4324735, -0.4259743, 2.267494, 0, 0.05098039, 1, 1,
0.4336916, -0.4237807, 2.532813, 0, 0.04705882, 1, 1,
0.437264, 0.3975092, -0.1515951, 0, 0.03921569, 1, 1,
0.4377027, -0.8562334, 4.108374, 0, 0.03529412, 1, 1,
0.4380591, 0.4660289, 1.301478, 0, 0.02745098, 1, 1,
0.4398081, 0.2169932, -0.8946149, 0, 0.02352941, 1, 1,
0.4416767, 1.206725, -0.06309205, 0, 0.01568628, 1, 1,
0.4439494, -0.3575021, -0.1273714, 0, 0.01176471, 1, 1,
0.4455491, 0.1335224, 2.345338, 0, 0.003921569, 1, 1,
0.4473667, -0.5975714, 1.894332, 0.003921569, 0, 1, 1,
0.4521158, 0.7547256, -0.4846784, 0.007843138, 0, 1, 1,
0.4530309, -2.500506, 2.268898, 0.01568628, 0, 1, 1,
0.4532605, 0.2413621, 0.870325, 0.01960784, 0, 1, 1,
0.4588977, -0.1614927, 2.774369, 0.02745098, 0, 1, 1,
0.4640179, 0.9635101, 0.1357257, 0.03137255, 0, 1, 1,
0.4654113, 0.1778307, -0.1326607, 0.03921569, 0, 1, 1,
0.4685593, -0.7341554, 4.999386, 0.04313726, 0, 1, 1,
0.4688941, 0.01299476, 2.600016, 0.05098039, 0, 1, 1,
0.4722636, -1.751807, 2.023556, 0.05490196, 0, 1, 1,
0.4850169, -1.316727, 3.958625, 0.0627451, 0, 1, 1,
0.4868695, -1.872119, 2.053178, 0.06666667, 0, 1, 1,
0.4869503, 0.5067176, 0.8677943, 0.07450981, 0, 1, 1,
0.4902282, -0.6091251, 2.894631, 0.07843138, 0, 1, 1,
0.4918093, -2.064883, 3.884157, 0.08627451, 0, 1, 1,
0.4919739, -0.5382941, 2.733445, 0.09019608, 0, 1, 1,
0.4932874, -0.267463, 1.553199, 0.09803922, 0, 1, 1,
0.4964747, 0.1101268, 1.19202, 0.1058824, 0, 1, 1,
0.5028921, -1.195403, 1.114187, 0.1098039, 0, 1, 1,
0.5050734, 0.3824399, 1.201413, 0.1176471, 0, 1, 1,
0.5078003, 0.9968828, 1.717415, 0.1215686, 0, 1, 1,
0.5078217, 7.826612e-05, 2.235276, 0.1294118, 0, 1, 1,
0.5079736, -1.16993, 2.780325, 0.1333333, 0, 1, 1,
0.5096192, 0.09861676, 2.576329, 0.1411765, 0, 1, 1,
0.5190545, 2.690391, -0.4280576, 0.145098, 0, 1, 1,
0.5212183, -1.337484, 3.366322, 0.1529412, 0, 1, 1,
0.5232939, 1.664533, 0.2613491, 0.1568628, 0, 1, 1,
0.5281929, 0.3701681, 1.655468, 0.1647059, 0, 1, 1,
0.5378544, 1.331908, -0.2897308, 0.1686275, 0, 1, 1,
0.5421326, 0.3506807, -0.4136764, 0.1764706, 0, 1, 1,
0.5446866, 2.188082, 0.5608896, 0.1803922, 0, 1, 1,
0.5452529, -0.3174022, 0.3959863, 0.1882353, 0, 1, 1,
0.5580297, 1.670393, 0.5505679, 0.1921569, 0, 1, 1,
0.560527, 0.1235489, 1.409685, 0.2, 0, 1, 1,
0.5637931, -0.3393649, 1.589225, 0.2078431, 0, 1, 1,
0.5638438, -0.7564164, 1.483642, 0.2117647, 0, 1, 1,
0.5675486, -0.8269461, 3.411032, 0.2196078, 0, 1, 1,
0.5695318, 0.3906963, 1.110633, 0.2235294, 0, 1, 1,
0.5697918, 0.6202103, 2.224019, 0.2313726, 0, 1, 1,
0.5699717, -0.5511866, 1.709098, 0.2352941, 0, 1, 1,
0.5702182, 0.3580138, 1.362154, 0.2431373, 0, 1, 1,
0.5741996, -0.4658832, 2.299735, 0.2470588, 0, 1, 1,
0.5765731, 0.359369, 1.402261, 0.254902, 0, 1, 1,
0.5766658, 0.5803196, 2.626692, 0.2588235, 0, 1, 1,
0.578004, -0.08680115, 1.305473, 0.2666667, 0, 1, 1,
0.5793073, 1.538096, 1.394966, 0.2705882, 0, 1, 1,
0.5802021, 0.7562517, -0.1395709, 0.2784314, 0, 1, 1,
0.5805578, 0.1797746, 1.380042, 0.282353, 0, 1, 1,
0.5842385, 0.2765331, 0.2653304, 0.2901961, 0, 1, 1,
0.584341, 0.731846, 1.493455, 0.2941177, 0, 1, 1,
0.5878053, 1.249963, 0.5582197, 0.3019608, 0, 1, 1,
0.5896354, 2.050019, -1.136389, 0.3098039, 0, 1, 1,
0.5909526, -0.50888, 2.288687, 0.3137255, 0, 1, 1,
0.5936733, -1.227376, 0.08372545, 0.3215686, 0, 1, 1,
0.5981256, 0.62729, 0.4592232, 0.3254902, 0, 1, 1,
0.5984061, 0.4276955, 1.122857, 0.3333333, 0, 1, 1,
0.5987396, 1.361717, 0.5464871, 0.3372549, 0, 1, 1,
0.5999528, -0.86033, 1.259198, 0.345098, 0, 1, 1,
0.6028575, -1.137862, 0.4850656, 0.3490196, 0, 1, 1,
0.6072816, -0.2147888, 2.763259, 0.3568628, 0, 1, 1,
0.6081383, 0.09186077, 0.9715369, 0.3607843, 0, 1, 1,
0.6114278, -0.2550571, 1.36005, 0.3686275, 0, 1, 1,
0.6147937, 0.1794064, 0.8048406, 0.372549, 0, 1, 1,
0.6159064, 0.05950699, 2.050496, 0.3803922, 0, 1, 1,
0.6163583, -0.7799506, 2.857176, 0.3843137, 0, 1, 1,
0.6278295, -1.054408, 3.979146, 0.3921569, 0, 1, 1,
0.6290562, 2.012166, 0.3967848, 0.3960784, 0, 1, 1,
0.6307174, 0.5154496, 0.4249955, 0.4039216, 0, 1, 1,
0.6352394, 1.613905, -1.600239, 0.4117647, 0, 1, 1,
0.6390791, -0.7540234, 1.020131, 0.4156863, 0, 1, 1,
0.6405226, 1.100409, 1.446964, 0.4235294, 0, 1, 1,
0.655003, -1.122334, 4.381388, 0.427451, 0, 1, 1,
0.6570781, 1.29152, -0.2893182, 0.4352941, 0, 1, 1,
0.6573122, 1.015755, 0.9579763, 0.4392157, 0, 1, 1,
0.6630874, 0.8594197, -0.921594, 0.4470588, 0, 1, 1,
0.6645852, -1.201907, 2.339236, 0.4509804, 0, 1, 1,
0.6684347, 1.14716, 2.174252, 0.4588235, 0, 1, 1,
0.6713548, 2.770006, -0.3449326, 0.4627451, 0, 1, 1,
0.6718674, 0.5700982, 0.07976091, 0.4705882, 0, 1, 1,
0.6741507, -0.3807021, 1.15936, 0.4745098, 0, 1, 1,
0.6764786, 0.6897227, 1.005316, 0.4823529, 0, 1, 1,
0.6846513, -0.01017496, 2.9213, 0.4862745, 0, 1, 1,
0.6898739, -0.7360783, 1.930276, 0.4941176, 0, 1, 1,
0.6907382, -0.2996048, 1.508906, 0.5019608, 0, 1, 1,
0.6917871, 1.261883, 1.248295, 0.5058824, 0, 1, 1,
0.6973849, 1.276772, 0.5554981, 0.5137255, 0, 1, 1,
0.7037076, -0.2464612, 2.175564, 0.5176471, 0, 1, 1,
0.709989, 1.27175, 1.057642, 0.5254902, 0, 1, 1,
0.711219, -0.2699906, 1.769223, 0.5294118, 0, 1, 1,
0.7125705, -1.76084, 3.046224, 0.5372549, 0, 1, 1,
0.7208465, 0.5652828, -1.213919, 0.5411765, 0, 1, 1,
0.7269413, 0.3242735, -0.2333103, 0.5490196, 0, 1, 1,
0.7275079, 0.7833161, 0.8903016, 0.5529412, 0, 1, 1,
0.728467, -0.2341635, 0.7984412, 0.5607843, 0, 1, 1,
0.7292728, -0.6372478, 3.35869, 0.5647059, 0, 1, 1,
0.7312101, 0.6353431, 1.27106, 0.572549, 0, 1, 1,
0.7330241, 0.2745792, 0.5864717, 0.5764706, 0, 1, 1,
0.7352524, -0.05786066, 1.11314, 0.5843138, 0, 1, 1,
0.7426996, -0.1544237, 0.903302, 0.5882353, 0, 1, 1,
0.7469917, 1.230092, 0.04894515, 0.5960785, 0, 1, 1,
0.748596, -0.3551043, 1.554016, 0.6039216, 0, 1, 1,
0.748773, -0.8226923, 2.446742, 0.6078432, 0, 1, 1,
0.7492277, 0.4830994, 0.821963, 0.6156863, 0, 1, 1,
0.7503824, -0.3160733, 2.891025, 0.6196079, 0, 1, 1,
0.7509791, -0.3892478, 2.735603, 0.627451, 0, 1, 1,
0.7597539, 0.3332716, 1.57397, 0.6313726, 0, 1, 1,
0.7620322, 1.017524, -0.1173475, 0.6392157, 0, 1, 1,
0.7623858, 0.0302178, 0.567712, 0.6431373, 0, 1, 1,
0.7672732, 1.100865, -1.204762, 0.6509804, 0, 1, 1,
0.7741777, 0.4709995, 2.113855, 0.654902, 0, 1, 1,
0.7750611, -2.533654, 2.409479, 0.6627451, 0, 1, 1,
0.7755874, 0.9234883, 0.3176217, 0.6666667, 0, 1, 1,
0.7774265, 0.5455054, 0.7868736, 0.6745098, 0, 1, 1,
0.7791961, 0.2206738, 1.679493, 0.6784314, 0, 1, 1,
0.7807224, 0.5511936, 0.3093738, 0.6862745, 0, 1, 1,
0.7817092, -0.7621152, 2.70204, 0.6901961, 0, 1, 1,
0.7829148, -1.24129, -0.1394528, 0.6980392, 0, 1, 1,
0.7923653, -0.6374215, 2.136672, 0.7058824, 0, 1, 1,
0.7933939, 0.1156536, -1.148544, 0.7098039, 0, 1, 1,
0.7957115, 0.2769692, 1.919024, 0.7176471, 0, 1, 1,
0.7980828, 0.3471372, 1.672408, 0.7215686, 0, 1, 1,
0.7983145, 1.76611, -0.5488102, 0.7294118, 0, 1, 1,
0.7999032, -0.9769408, 0.9368631, 0.7333333, 0, 1, 1,
0.8071567, -0.4692963, 1.624252, 0.7411765, 0, 1, 1,
0.8118989, 0.9408566, 2.010345, 0.7450981, 0, 1, 1,
0.8124112, -0.3919372, 3.368045, 0.7529412, 0, 1, 1,
0.8135931, 0.6732301, -0.02257857, 0.7568628, 0, 1, 1,
0.817474, 0.08718602, 0.1389935, 0.7647059, 0, 1, 1,
0.8255264, -0.9455084, 1.361704, 0.7686275, 0, 1, 1,
0.8274468, -0.74673, 3.084817, 0.7764706, 0, 1, 1,
0.830243, -0.5003154, 2.111251, 0.7803922, 0, 1, 1,
0.8312342, -1.017189, -0.2049819, 0.7882353, 0, 1, 1,
0.8347163, -0.4983204, 1.817333, 0.7921569, 0, 1, 1,
0.8350835, 0.5664622, 0.6143019, 0.8, 0, 1, 1,
0.8368309, 1.747841, -0.2233917, 0.8078431, 0, 1, 1,
0.8405319, -1.236479, 2.122763, 0.8117647, 0, 1, 1,
0.84123, -1.852198, 3.897134, 0.8196079, 0, 1, 1,
0.842256, -0.2280229, 2.029087, 0.8235294, 0, 1, 1,
0.844198, 0.2388928, 2.21134, 0.8313726, 0, 1, 1,
0.8484437, 0.5064228, 1.151454, 0.8352941, 0, 1, 1,
0.8510858, 0.3673548, 1.466845, 0.8431373, 0, 1, 1,
0.8540832, -0.6430245, 0.8189884, 0.8470588, 0, 1, 1,
0.8542317, -1.615509, 4.51237, 0.854902, 0, 1, 1,
0.8634958, 0.1623936, 3.467802, 0.8588235, 0, 1, 1,
0.8653257, 0.9039235, -0.6351467, 0.8666667, 0, 1, 1,
0.8679649, 1.203048, 1.043797, 0.8705882, 0, 1, 1,
0.8711299, -0.8351325, -0.4080771, 0.8784314, 0, 1, 1,
0.871364, -2.396985, 2.312407, 0.8823529, 0, 1, 1,
0.871662, -0.627669, 2.210966, 0.8901961, 0, 1, 1,
0.8770433, 0.08505455, -0.3472654, 0.8941177, 0, 1, 1,
0.885862, 1.171531, -0.134809, 0.9019608, 0, 1, 1,
0.8912796, -0.522972, 3.172495, 0.9098039, 0, 1, 1,
0.8943543, -0.5527055, 2.585039, 0.9137255, 0, 1, 1,
0.9053687, 0.6295754, -0.35494, 0.9215686, 0, 1, 1,
0.906098, -1.581667, 2.01639, 0.9254902, 0, 1, 1,
0.9061859, -0.147384, 2.665015, 0.9333333, 0, 1, 1,
0.9098955, -0.9131734, 2.518274, 0.9372549, 0, 1, 1,
0.9160347, 0.7972389, 0.6898746, 0.945098, 0, 1, 1,
0.9201341, 1.124798, 0.1940349, 0.9490196, 0, 1, 1,
0.9287539, 0.4491358, 0.28868, 0.9568627, 0, 1, 1,
0.9376098, -1.024227, 3.603771, 0.9607843, 0, 1, 1,
0.9416618, -1.460054, 3.386429, 0.9686275, 0, 1, 1,
0.9451797, 0.1435748, 3.792872, 0.972549, 0, 1, 1,
0.9452313, -0.9217766, 3.349686, 0.9803922, 0, 1, 1,
0.9566814, -1.588224, 4.047598, 0.9843137, 0, 1, 1,
0.9680539, -0.2194305, 0.4361934, 0.9921569, 0, 1, 1,
0.9737902, -0.7143134, 3.4774, 0.9960784, 0, 1, 1,
0.9741824, 0.1563173, 2.53159, 1, 0, 0.9960784, 1,
0.9794868, -1.343172, 0.6604813, 1, 0, 0.9882353, 1,
0.9901417, -0.3767248, 1.432123, 1, 0, 0.9843137, 1,
0.9989505, 0.5178142, 0.525039, 1, 0, 0.9764706, 1,
1.000116, 0.4185216, 2.381259, 1, 0, 0.972549, 1,
1.006081, 0.7835113, 0.4046474, 1, 0, 0.9647059, 1,
1.01008, 0.6205764, 1.109926, 1, 0, 0.9607843, 1,
1.010423, 0.5444456, 2.153352, 1, 0, 0.9529412, 1,
1.023878, -0.7479573, 3.875873, 1, 0, 0.9490196, 1,
1.024438, 1.300168, -0.222108, 1, 0, 0.9411765, 1,
1.031394, 1.234552, 1.310679, 1, 0, 0.9372549, 1,
1.038287, 0.6931402, 0.07064909, 1, 0, 0.9294118, 1,
1.041711, 0.7888537, 0.3503425, 1, 0, 0.9254902, 1,
1.047022, 0.1712155, -0.03264572, 1, 0, 0.9176471, 1,
1.048412, 0.3436598, 0.1748354, 1, 0, 0.9137255, 1,
1.051803, -1.788257, 2.766398, 1, 0, 0.9058824, 1,
1.052104, 0.07785338, 1.310262, 1, 0, 0.9019608, 1,
1.053753, 0.1087157, 2.340991, 1, 0, 0.8941177, 1,
1.061411, 1.251657, 0.8013337, 1, 0, 0.8862745, 1,
1.061413, -0.6109399, 1.554091, 1, 0, 0.8823529, 1,
1.063693, 1.673216, 1.601818, 1, 0, 0.8745098, 1,
1.064796, -1.080006, 1.419982, 1, 0, 0.8705882, 1,
1.065058, 1.621295, 0.3755215, 1, 0, 0.8627451, 1,
1.067421, 0.7126684, 2.243593, 1, 0, 0.8588235, 1,
1.067789, -2.162003, 1.722887, 1, 0, 0.8509804, 1,
1.075123, -0.1110526, 2.226864, 1, 0, 0.8470588, 1,
1.089965, 0.8897483, 2.313517, 1, 0, 0.8392157, 1,
1.097086, 1.25073, 1.02725, 1, 0, 0.8352941, 1,
1.101222, 0.607085, 1.008064, 1, 0, 0.827451, 1,
1.103957, 1.038864, 1.771332, 1, 0, 0.8235294, 1,
1.106935, 1.016678, -0.01254836, 1, 0, 0.8156863, 1,
1.110146, 1.028643, 0.6892936, 1, 0, 0.8117647, 1,
1.116176, -0.04753437, 1.649137, 1, 0, 0.8039216, 1,
1.120925, 0.1120462, 1.363405, 1, 0, 0.7960784, 1,
1.125883, 0.0432471, 1.855364, 1, 0, 0.7921569, 1,
1.127834, -0.1376103, 0.9799466, 1, 0, 0.7843137, 1,
1.145501, -0.5372825, 2.618118, 1, 0, 0.7803922, 1,
1.145727, 1.859843, 0.9766634, 1, 0, 0.772549, 1,
1.147699, -0.3872193, 1.978257, 1, 0, 0.7686275, 1,
1.148616, 0.3208519, 2.411477, 1, 0, 0.7607843, 1,
1.149454, -0.7494822, 1.111928, 1, 0, 0.7568628, 1,
1.150584, -0.3004765, 1.526487, 1, 0, 0.7490196, 1,
1.156234, 0.01520209, 0.9780723, 1, 0, 0.7450981, 1,
1.156808, -0.8646114, 1.727573, 1, 0, 0.7372549, 1,
1.159539, 1.541218, 2.01373, 1, 0, 0.7333333, 1,
1.161578, -0.5005457, 0.9325605, 1, 0, 0.7254902, 1,
1.164864, -0.414181, 0.8509729, 1, 0, 0.7215686, 1,
1.165459, 0.2280424, 1.749659, 1, 0, 0.7137255, 1,
1.166509, 0.09279612, 0.8748685, 1, 0, 0.7098039, 1,
1.167441, 0.9395309, 1.44537, 1, 0, 0.7019608, 1,
1.170263, -1.850751, 2.96871, 1, 0, 0.6941177, 1,
1.192299, -0.5370603, 2.789123, 1, 0, 0.6901961, 1,
1.192919, 1.67295, 1.392144, 1, 0, 0.682353, 1,
1.195684, -0.09583719, 1.435002, 1, 0, 0.6784314, 1,
1.196182, -0.7079543, 3.264464, 1, 0, 0.6705883, 1,
1.210192, 0.9877129, 1.884962, 1, 0, 0.6666667, 1,
1.21336, 0.2425124, 1.899106, 1, 0, 0.6588235, 1,
1.21529, -1.285469, 2.549449, 1, 0, 0.654902, 1,
1.217115, 1.857481, -0.9004326, 1, 0, 0.6470588, 1,
1.223001, -0.08287252, 3.432775, 1, 0, 0.6431373, 1,
1.238129, 0.573254, 0.2322085, 1, 0, 0.6352941, 1,
1.239591, -0.3529868, 2.165941, 1, 0, 0.6313726, 1,
1.243372, -0.1448908, 1.441413, 1, 0, 0.6235294, 1,
1.261534, -0.7426943, 1.831783, 1, 0, 0.6196079, 1,
1.261984, -0.5381367, 3.518194, 1, 0, 0.6117647, 1,
1.274677, 1.876037, 1.062999, 1, 0, 0.6078432, 1,
1.287269, -0.3132289, 3.012111, 1, 0, 0.6, 1,
1.291522, -0.02450497, 3.58552, 1, 0, 0.5921569, 1,
1.292749, 0.9786276, 0.09852719, 1, 0, 0.5882353, 1,
1.302827, 0.5305439, -0.5552969, 1, 0, 0.5803922, 1,
1.327243, -0.4313966, 1.251627, 1, 0, 0.5764706, 1,
1.333871, 0.7945479, -0.2376495, 1, 0, 0.5686275, 1,
1.341435, -0.05264908, 0.6928334, 1, 0, 0.5647059, 1,
1.343881, 0.9341214, 0.7059614, 1, 0, 0.5568628, 1,
1.353838, 0.1263427, 1.869388, 1, 0, 0.5529412, 1,
1.358617, 1.489822, 1.257224, 1, 0, 0.5450981, 1,
1.372826, -1.692673, 3.624804, 1, 0, 0.5411765, 1,
1.387319, -0.5472993, 1.323641, 1, 0, 0.5333334, 1,
1.392857, -1.084187, 2.338728, 1, 0, 0.5294118, 1,
1.393774, 0.4671243, 2.621499, 1, 0, 0.5215687, 1,
1.394218, -0.3998675, 0.9195507, 1, 0, 0.5176471, 1,
1.405993, 0.1698097, 1.841487, 1, 0, 0.509804, 1,
1.407888, 0.000117968, 1.621932, 1, 0, 0.5058824, 1,
1.407928, -0.7312428, 1.003227, 1, 0, 0.4980392, 1,
1.414804, 0.4777901, 0.006906539, 1, 0, 0.4901961, 1,
1.425033, 0.07315177, 2.9272, 1, 0, 0.4862745, 1,
1.427975, 0.8483667, 1.286089, 1, 0, 0.4784314, 1,
1.431036, -1.688773, 1.38896, 1, 0, 0.4745098, 1,
1.43919, -0.1843566, 1.386371, 1, 0, 0.4666667, 1,
1.43975, 0.08084354, 1.104557, 1, 0, 0.4627451, 1,
1.45371, 0.8439835, 0.288296, 1, 0, 0.454902, 1,
1.479675, 1.864004, -0.2051659, 1, 0, 0.4509804, 1,
1.480141, -0.1015132, 0.762711, 1, 0, 0.4431373, 1,
1.487427, 0.300099, 1.057477, 1, 0, 0.4392157, 1,
1.493869, 2.019276, 3.132863, 1, 0, 0.4313726, 1,
1.51088, -0.2385729, 2.957044, 1, 0, 0.427451, 1,
1.523149, 0.4976644, 2.788447, 1, 0, 0.4196078, 1,
1.53327, -0.9394614, 2.651175, 1, 0, 0.4156863, 1,
1.535692, 1.342323, 2.967528, 1, 0, 0.4078431, 1,
1.535704, 0.4541428, -0.06559944, 1, 0, 0.4039216, 1,
1.537819, -0.6803327, 4.336545, 1, 0, 0.3960784, 1,
1.553601, -1.078029, 1.778421, 1, 0, 0.3882353, 1,
1.553981, 0.01972805, 3.901945, 1, 0, 0.3843137, 1,
1.554541, 0.0830035, 1.351145, 1, 0, 0.3764706, 1,
1.565499, 1.867156, 0.6859254, 1, 0, 0.372549, 1,
1.566217, -0.2204995, 2.283496, 1, 0, 0.3647059, 1,
1.56728, -0.4144004, 2.86618, 1, 0, 0.3607843, 1,
1.567834, 0.4175281, 2.366565, 1, 0, 0.3529412, 1,
1.570385, 0.3954307, 0.83048, 1, 0, 0.3490196, 1,
1.57175, 0.8841699, 2.766375, 1, 0, 0.3411765, 1,
1.5722, -0.8909368, 3.651551, 1, 0, 0.3372549, 1,
1.572566, 0.4534841, 1.449578, 1, 0, 0.3294118, 1,
1.572711, -1.129619, 1.901783, 1, 0, 0.3254902, 1,
1.574308, 1.207732, -0.008645297, 1, 0, 0.3176471, 1,
1.580472, -0.1475493, 0.8916878, 1, 0, 0.3137255, 1,
1.589371, -1.131744, 1.537336, 1, 0, 0.3058824, 1,
1.635505, -2.518122, 2.160014, 1, 0, 0.2980392, 1,
1.648352, 0.6119278, -0.4872001, 1, 0, 0.2941177, 1,
1.651269, 0.9081696, 2.800311, 1, 0, 0.2862745, 1,
1.659725, -0.06184568, 3.503427, 1, 0, 0.282353, 1,
1.682841, 0.03270659, 1.837189, 1, 0, 0.2745098, 1,
1.687259, -1.574211, 1.657991, 1, 0, 0.2705882, 1,
1.690651, 0.01070245, 2.260947, 1, 0, 0.2627451, 1,
1.691306, -0.2918053, 2.440355, 1, 0, 0.2588235, 1,
1.695551, 0.9515549, 0.9082028, 1, 0, 0.2509804, 1,
1.698007, -0.4128066, 2.134753, 1, 0, 0.2470588, 1,
1.726429, 0.3670084, 0.9602621, 1, 0, 0.2392157, 1,
1.727648, 0.8765991, 1.10959, 1, 0, 0.2352941, 1,
1.751619, 0.4645078, 1.770691, 1, 0, 0.227451, 1,
1.770995, -1.101762, 2.585396, 1, 0, 0.2235294, 1,
1.781596, -1.084535, 3.254676, 1, 0, 0.2156863, 1,
1.795264, 1.762016, 1.027204, 1, 0, 0.2117647, 1,
1.803969, 1.385012, 1.980178, 1, 0, 0.2039216, 1,
1.811198, -0.1168171, 0.8059685, 1, 0, 0.1960784, 1,
1.81868, -0.4776237, 1.295499, 1, 0, 0.1921569, 1,
1.820467, 0.2620943, 3.401469, 1, 0, 0.1843137, 1,
1.823429, -0.1822629, 2.581448, 1, 0, 0.1803922, 1,
1.832285, 1.13951, 0.3663038, 1, 0, 0.172549, 1,
1.833046, -0.891727, 1.535893, 1, 0, 0.1686275, 1,
1.862738, -0.5748346, 2.490527, 1, 0, 0.1607843, 1,
1.873396, 0.110088, 1.020583, 1, 0, 0.1568628, 1,
1.915293, -1.706945, 2.7502, 1, 0, 0.1490196, 1,
1.933697, -1.067086, 3.295711, 1, 0, 0.145098, 1,
1.958509, 0.2507828, 1.075402, 1, 0, 0.1372549, 1,
1.970521, 0.9234969, 1.650164, 1, 0, 0.1333333, 1,
1.972033, 0.3145202, 1.287646, 1, 0, 0.1254902, 1,
2.033194, -0.04526834, 2.338568, 1, 0, 0.1215686, 1,
2.050283, -0.110325, 1.542514, 1, 0, 0.1137255, 1,
2.087184, -1.442843, 1.210832, 1, 0, 0.1098039, 1,
2.129439, -0.7721389, 3.344676, 1, 0, 0.1019608, 1,
2.167903, -0.03068763, 0.7991068, 1, 0, 0.09411765, 1,
2.170112, 0.2479674, 1.759394, 1, 0, 0.09019608, 1,
2.203286, 0.638486, 2.215035, 1, 0, 0.08235294, 1,
2.20663, 0.803098, 2.894884, 1, 0, 0.07843138, 1,
2.271062, -0.7282722, 1.792042, 1, 0, 0.07058824, 1,
2.338292, 1.533605, 2.159107, 1, 0, 0.06666667, 1,
2.406725, 0.3576677, 1.936695, 1, 0, 0.05882353, 1,
2.418524, -0.7193862, -0.3095299, 1, 0, 0.05490196, 1,
2.449535, 0.1274073, 2.633897, 1, 0, 0.04705882, 1,
2.533139, -0.1925337, 2.602262, 1, 0, 0.04313726, 1,
2.568894, -0.1511819, 1.820497, 1, 0, 0.03529412, 1,
2.598699, 1.809669, -0.01073659, 1, 0, 0.03137255, 1,
2.667633, 0.193157, 1.863089, 1, 0, 0.02352941, 1,
2.67502, 0.5352124, 1.133009, 1, 0, 0.01960784, 1,
2.941743, -0.138379, 1.703077, 1, 0, 0.01176471, 1,
3.670916, 1.370696, -0.609216, 1, 0, 0.007843138, 1
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
0.1494114, -4.565765, -6.869927, 0, -0.5, 0.5, 0.5,
0.1494114, -4.565765, -6.869927, 1, -0.5, 0.5, 0.5,
0.1494114, -4.565765, -6.869927, 1, 1.5, 0.5, 0.5,
0.1494114, -4.565765, -6.869927, 0, 1.5, 0.5, 0.5
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
-4.565883, -0.2750676, -6.869927, 0, -0.5, 0.5, 0.5,
-4.565883, -0.2750676, -6.869927, 1, -0.5, 0.5, 0.5,
-4.565883, -0.2750676, -6.869927, 1, 1.5, 0.5, 0.5,
-4.565883, -0.2750676, -6.869927, 0, 1.5, 0.5, 0.5
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
-4.565883, -4.565765, 0.2210765, 0, -0.5, 0.5, 0.5,
-4.565883, -4.565765, 0.2210765, 1, -0.5, 0.5, 0.5,
-4.565883, -4.565765, 0.2210765, 1, 1.5, 0.5, 0.5,
-4.565883, -4.565765, 0.2210765, 0, 1.5, 0.5, 0.5
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
-2, -3.575604, -5.233542,
2, -3.575604, -5.233542,
-2, -3.575604, -5.233542,
-2, -3.740631, -5.506273,
0, -3.575604, -5.233542,
0, -3.740631, -5.506273,
2, -3.575604, -5.233542,
2, -3.740631, -5.506273
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
-2, -4.070685, -6.051734, 0, -0.5, 0.5, 0.5,
-2, -4.070685, -6.051734, 1, -0.5, 0.5, 0.5,
-2, -4.070685, -6.051734, 1, 1.5, 0.5, 0.5,
-2, -4.070685, -6.051734, 0, 1.5, 0.5, 0.5,
0, -4.070685, -6.051734, 0, -0.5, 0.5, 0.5,
0, -4.070685, -6.051734, 1, -0.5, 0.5, 0.5,
0, -4.070685, -6.051734, 1, 1.5, 0.5, 0.5,
0, -4.070685, -6.051734, 0, 1.5, 0.5, 0.5,
2, -4.070685, -6.051734, 0, -0.5, 0.5, 0.5,
2, -4.070685, -6.051734, 1, -0.5, 0.5, 0.5,
2, -4.070685, -6.051734, 1, 1.5, 0.5, 0.5,
2, -4.070685, -6.051734, 0, 1.5, 0.5, 0.5
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
-3.477738, -3, -5.233542,
-3.477738, 2, -5.233542,
-3.477738, -3, -5.233542,
-3.659095, -3, -5.506273,
-3.477738, -2, -5.233542,
-3.659095, -2, -5.506273,
-3.477738, -1, -5.233542,
-3.659095, -1, -5.506273,
-3.477738, 0, -5.233542,
-3.659095, 0, -5.506273,
-3.477738, 1, -5.233542,
-3.659095, 1, -5.506273,
-3.477738, 2, -5.233542,
-3.659095, 2, -5.506273
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
-4.02181, -3, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, -3, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, -3, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, -3, -6.051734, 0, 1.5, 0.5, 0.5,
-4.02181, -2, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, -2, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, -2, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, -2, -6.051734, 0, 1.5, 0.5, 0.5,
-4.02181, -1, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, -1, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, -1, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, -1, -6.051734, 0, 1.5, 0.5, 0.5,
-4.02181, 0, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, 0, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, 0, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, 0, -6.051734, 0, 1.5, 0.5, 0.5,
-4.02181, 1, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, 1, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, 1, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, 1, -6.051734, 0, 1.5, 0.5, 0.5,
-4.02181, 2, -6.051734, 0, -0.5, 0.5, 0.5,
-4.02181, 2, -6.051734, 1, -0.5, 0.5, 0.5,
-4.02181, 2, -6.051734, 1, 1.5, 0.5, 0.5,
-4.02181, 2, -6.051734, 0, 1.5, 0.5, 0.5
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
-3.477738, -3.575604, -4,
-3.477738, -3.575604, 4,
-3.477738, -3.575604, -4,
-3.659095, -3.740631, -4,
-3.477738, -3.575604, -2,
-3.659095, -3.740631, -2,
-3.477738, -3.575604, 0,
-3.659095, -3.740631, 0,
-3.477738, -3.575604, 2,
-3.659095, -3.740631, 2,
-3.477738, -3.575604, 4,
-3.659095, -3.740631, 4
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
-4.02181, -4.070685, -4, 0, -0.5, 0.5, 0.5,
-4.02181, -4.070685, -4, 1, -0.5, 0.5, 0.5,
-4.02181, -4.070685, -4, 1, 1.5, 0.5, 0.5,
-4.02181, -4.070685, -4, 0, 1.5, 0.5, 0.5,
-4.02181, -4.070685, -2, 0, -0.5, 0.5, 0.5,
-4.02181, -4.070685, -2, 1, -0.5, 0.5, 0.5,
-4.02181, -4.070685, -2, 1, 1.5, 0.5, 0.5,
-4.02181, -4.070685, -2, 0, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 0, 0, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 0, 1, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 0, 1, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 0, 0, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 2, 0, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 2, 1, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 2, 1, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 2, 0, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 4, 0, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 4, 1, -0.5, 0.5, 0.5,
-4.02181, -4.070685, 4, 1, 1.5, 0.5, 0.5,
-4.02181, -4.070685, 4, 0, 1.5, 0.5, 0.5
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
-3.477738, -3.575604, -5.233542,
-3.477738, 3.025469, -5.233542,
-3.477738, -3.575604, 5.675695,
-3.477738, 3.025469, 5.675695,
-3.477738, -3.575604, -5.233542,
-3.477738, -3.575604, 5.675695,
-3.477738, 3.025469, -5.233542,
-3.477738, 3.025469, 5.675695,
-3.477738, -3.575604, -5.233542,
3.776561, -3.575604, -5.233542,
-3.477738, -3.575604, 5.675695,
3.776561, -3.575604, 5.675695,
-3.477738, 3.025469, -5.233542,
3.776561, 3.025469, -5.233542,
-3.477738, 3.025469, 5.675695,
3.776561, 3.025469, 5.675695,
3.776561, -3.575604, -5.233542,
3.776561, 3.025469, -5.233542,
3.776561, -3.575604, 5.675695,
3.776561, 3.025469, 5.675695,
3.776561, -3.575604, -5.233542,
3.776561, -3.575604, 5.675695,
3.776561, 3.025469, -5.233542,
3.776561, 3.025469, 5.675695
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
var radius = 7.833524;
var distance = 34.85223;
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
mvMatrix.translate( -0.1494114, 0.2750676, -0.2210765 );
mvMatrix.scale( 1.16755, 1.283088, 0.7763842 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.85223);
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
isocarbamid<-read.table("isocarbamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isocarbamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
```

```r
y<-isocarbamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
```

```r
z<-isocarbamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'isocarbamid' not found
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
-3.372093, -1.615573, -1.369884, 0, 0, 1, 1, 1,
-2.982943, -0.09095069, -3.608851, 1, 0, 0, 1, 1,
-2.907253, 1.352796, -0.5389516, 1, 0, 0, 1, 1,
-2.769145, -0.9197615, -2.379877, 1, 0, 0, 1, 1,
-2.747322, 1.005797, 1.703941, 1, 0, 0, 1, 1,
-2.7392, 0.4006811, -2.065432, 1, 0, 0, 1, 1,
-2.729186, 0.7045228, -2.840692, 0, 0, 0, 1, 1,
-2.64702, -1.584215, -1.888394, 0, 0, 0, 1, 1,
-2.581544, -1.478867, -2.545128, 0, 0, 0, 1, 1,
-2.558259, -1.258917, -0.6850228, 0, 0, 0, 1, 1,
-2.518354, 2.505267, -0.3793279, 0, 0, 0, 1, 1,
-2.413791, 0.2529198, -1.968815, 0, 0, 0, 1, 1,
-2.339478, 0.2972297, -0.1908525, 0, 0, 0, 1, 1,
-2.28173, 0.2321529, -1.793823, 1, 1, 1, 1, 1,
-2.26616, -1.668048, -1.999279, 1, 1, 1, 1, 1,
-2.19337, 1.116585, -0.6554242, 1, 1, 1, 1, 1,
-2.190636, -1.195018, -1.035816, 1, 1, 1, 1, 1,
-2.157167, 1.008167, -0.8406495, 1, 1, 1, 1, 1,
-2.094351, 0.1631362, -2.104861, 1, 1, 1, 1, 1,
-2.062251, -0.07401384, -1.746391, 1, 1, 1, 1, 1,
-2.015054, 0.9909739, -3.201309, 1, 1, 1, 1, 1,
-1.995055, 0.9658932, -1.131632, 1, 1, 1, 1, 1,
-1.993289, -1.047541, -2.809135, 1, 1, 1, 1, 1,
-1.986743, -0.1546409, -1.139637, 1, 1, 1, 1, 1,
-1.96447, 0.4721157, -1.209248, 1, 1, 1, 1, 1,
-1.958855, 0.2392179, -3.211635, 1, 1, 1, 1, 1,
-1.933656, 1.237704, -0.464989, 1, 1, 1, 1, 1,
-1.914893, -0.9768528, -2.293294, 1, 1, 1, 1, 1,
-1.905, 0.1188557, -2.095986, 0, 0, 1, 1, 1,
-1.900852, -2.542546, -2.612513, 1, 0, 0, 1, 1,
-1.863576, 0.2327662, 0.104998, 1, 0, 0, 1, 1,
-1.826752, 2.205899, -0.5223165, 1, 0, 0, 1, 1,
-1.820992, -0.4566824, -3.085129, 1, 0, 0, 1, 1,
-1.802005, 2.019521, -1.499274, 1, 0, 0, 1, 1,
-1.789069, -1.086759, -2.330909, 0, 0, 0, 1, 1,
-1.785596, -0.7957549, -2.244998, 0, 0, 0, 1, 1,
-1.736675, -1.070878, -2.108383, 0, 0, 0, 1, 1,
-1.730356, 1.336567, -0.8119897, 0, 0, 0, 1, 1,
-1.715395, -1.072165, -1.353263, 0, 0, 0, 1, 1,
-1.708942, -0.3292244, -1.916663, 0, 0, 0, 1, 1,
-1.706851, 0.5045745, -1.380546, 0, 0, 0, 1, 1,
-1.674436, -0.5570956, -3.081432, 1, 1, 1, 1, 1,
-1.636205, 0.5339927, -2.20864, 1, 1, 1, 1, 1,
-1.634583, 0.1128646, -1.191926, 1, 1, 1, 1, 1,
-1.608098, -0.3532298, -1.851849, 1, 1, 1, 1, 1,
-1.602208, 0.3057933, -3.021235, 1, 1, 1, 1, 1,
-1.5987, -0.6970289, -1.031307, 1, 1, 1, 1, 1,
-1.587698, -0.900529, -0.9869657, 1, 1, 1, 1, 1,
-1.557683, -1.109023, -1.953486, 1, 1, 1, 1, 1,
-1.556177, 1.796565, -2.571752, 1, 1, 1, 1, 1,
-1.553144, 2.380417, -1.58749, 1, 1, 1, 1, 1,
-1.545898, -0.08082844, -1.793827, 1, 1, 1, 1, 1,
-1.529876, 2.09745, 0.2004441, 1, 1, 1, 1, 1,
-1.520476, 0.1152354, -2.014272, 1, 1, 1, 1, 1,
-1.506084, 0.1593182, -1.674279, 1, 1, 1, 1, 1,
-1.50021, 1.414287, 0.5208294, 1, 1, 1, 1, 1,
-1.491813, -0.3887204, -2.365375, 0, 0, 1, 1, 1,
-1.491587, 0.4285093, -1.709351, 1, 0, 0, 1, 1,
-1.485579, 0.1002699, -1.614752, 1, 0, 0, 1, 1,
-1.483494, 0.08051643, -2.315521, 1, 0, 0, 1, 1,
-1.475609, 0.5471839, -1.846431, 1, 0, 0, 1, 1,
-1.475243, 0.2205458, -1.117124, 1, 0, 0, 1, 1,
-1.443269, 1.125415, -1.78952, 0, 0, 0, 1, 1,
-1.441489, 0.2285416, -0.9259624, 0, 0, 0, 1, 1,
-1.437873, 1.137078, 0.8025003, 0, 0, 0, 1, 1,
-1.436463, 1.257449, -3.138034, 0, 0, 0, 1, 1,
-1.435949, 0.2966445, -0.5332789, 0, 0, 0, 1, 1,
-1.432536, -0.3715951, -2.338099, 0, 0, 0, 1, 1,
-1.413233, 1.017066, -0.8048337, 0, 0, 0, 1, 1,
-1.405522, -0.9077131, -3.545209, 1, 1, 1, 1, 1,
-1.404203, -1.214392, -2.926127, 1, 1, 1, 1, 1,
-1.393119, 0.3826258, -1.826656, 1, 1, 1, 1, 1,
-1.384504, -0.4018287, -0.1953888, 1, 1, 1, 1, 1,
-1.379173, -1.282229, -2.65777, 1, 1, 1, 1, 1,
-1.374347, -1.189427, -3.441239, 1, 1, 1, 1, 1,
-1.373026, 0.1083035, 0.2851443, 1, 1, 1, 1, 1,
-1.359672, 0.7957902, -1.557964, 1, 1, 1, 1, 1,
-1.350346, -1.642806, -0.8221607, 1, 1, 1, 1, 1,
-1.34683, -0.5682197, -1.035509, 1, 1, 1, 1, 1,
-1.33647, 0.858648, -2.278464, 1, 1, 1, 1, 1,
-1.333848, 0.01448748, -1.926923, 1, 1, 1, 1, 1,
-1.333355, -0.6266256, -3.164988, 1, 1, 1, 1, 1,
-1.327463, 0.1366781, 0.01724186, 1, 1, 1, 1, 1,
-1.3266, 0.1785284, -0.4006437, 1, 1, 1, 1, 1,
-1.316772, -2.489405, -4.077088, 0, 0, 1, 1, 1,
-1.310228, -1.371256, -2.40764, 1, 0, 0, 1, 1,
-1.30822, 1.129429, -0.08703862, 1, 0, 0, 1, 1,
-1.294926, -0.06142493, -2.970388, 1, 0, 0, 1, 1,
-1.294567, 0.3909801, -1.08752, 1, 0, 0, 1, 1,
-1.277891, -1.574202, -2.796195, 1, 0, 0, 1, 1,
-1.273833, 0.2331335, -1.197778, 0, 0, 0, 1, 1,
-1.257069, 0.1060903, -1.370303, 0, 0, 0, 1, 1,
-1.251783, -0.1765708, -2.727776, 0, 0, 0, 1, 1,
-1.251214, 0.4694671, -1.836751, 0, 0, 0, 1, 1,
-1.251195, 0.6571053, -1.547616, 0, 0, 0, 1, 1,
-1.250058, 0.3703934, -2.449378, 0, 0, 0, 1, 1,
-1.246816, 0.3872135, 0.420859, 0, 0, 0, 1, 1,
-1.245769, -1.743915, -1.709625, 1, 1, 1, 1, 1,
-1.24509, -0.02363721, -1.393038, 1, 1, 1, 1, 1,
-1.234258, 1.241502, -2.3705, 1, 1, 1, 1, 1,
-1.225886, 0.5043748, -1.461887, 1, 1, 1, 1, 1,
-1.219242, -0.2350779, -3.182315, 1, 1, 1, 1, 1,
-1.218655, 0.9590007, -1.119569, 1, 1, 1, 1, 1,
-1.215982, -1.374497, -2.924582, 1, 1, 1, 1, 1,
-1.212109, 0.5362491, -0.5599554, 1, 1, 1, 1, 1,
-1.206392, 0.2856565, 1.085757, 1, 1, 1, 1, 1,
-1.204447, 1.546893, -0.8717072, 1, 1, 1, 1, 1,
-1.200062, -1.257711, -0.9410452, 1, 1, 1, 1, 1,
-1.194833, 0.4084614, -0.650022, 1, 1, 1, 1, 1,
-1.188601, 1.034038, 1.056929, 1, 1, 1, 1, 1,
-1.188201, 0.3985376, -2.128998, 1, 1, 1, 1, 1,
-1.185793, -1.411095, -3.750574, 1, 1, 1, 1, 1,
-1.179609, 1.108028, -1.31893, 0, 0, 1, 1, 1,
-1.166865, 0.2452961, -0.4428879, 1, 0, 0, 1, 1,
-1.154852, -0.7221547, -2.263857, 1, 0, 0, 1, 1,
-1.153966, -0.9452932, -3.234888, 1, 0, 0, 1, 1,
-1.152322, 0.899808, -2.211839, 1, 0, 0, 1, 1,
-1.145907, 2.718147, -2.133537, 1, 0, 0, 1, 1,
-1.138834, -0.4618131, -2.091343, 0, 0, 0, 1, 1,
-1.137891, 1.586191, -0.4517929, 0, 0, 0, 1, 1,
-1.136455, 0.1766378, -0.6815319, 0, 0, 0, 1, 1,
-1.133471, -0.2204583, -2.726113, 0, 0, 0, 1, 1,
-1.132124, -0.3788809, 0.2674635, 0, 0, 0, 1, 1,
-1.129189, -0.6042269, -2.299552, 0, 0, 0, 1, 1,
-1.119663, 0.6241747, -1.43951, 0, 0, 0, 1, 1,
-1.116725, 1.027492, -1.399374, 1, 1, 1, 1, 1,
-1.105703, 0.05071996, -2.469838, 1, 1, 1, 1, 1,
-1.105107, 0.8134907, 0.1303993, 1, 1, 1, 1, 1,
-1.101444, 0.8829635, -0.9793068, 1, 1, 1, 1, 1,
-1.099749, -0.7116806, -2.062862, 1, 1, 1, 1, 1,
-1.087104, 0.8333386, -2.341409, 1, 1, 1, 1, 1,
-1.086493, 1.705803, -2.25835, 1, 1, 1, 1, 1,
-1.083368, -0.4435574, -2.294619, 1, 1, 1, 1, 1,
-1.082421, 0.3987662, -0.28731, 1, 1, 1, 1, 1,
-1.075186, -0.2609538, 0.3760671, 1, 1, 1, 1, 1,
-1.072722, -0.851718, -2.288054, 1, 1, 1, 1, 1,
-1.067013, -0.3734812, -2.973228, 1, 1, 1, 1, 1,
-1.066194, -0.6970252, -0.6107326, 1, 1, 1, 1, 1,
-1.064382, -0.1647389, -0.5684539, 1, 1, 1, 1, 1,
-1.064212, -1.304814, -2.48676, 1, 1, 1, 1, 1,
-1.063937, -0.2803304, -0.671369, 0, 0, 1, 1, 1,
-1.060697, 1.0452, 0.7371636, 1, 0, 0, 1, 1,
-1.055873, -1.157176, -2.611716, 1, 0, 0, 1, 1,
-1.05426, 0.4877207, -1.311998, 1, 0, 0, 1, 1,
-1.050656, 0.5575961, 0.4798375, 1, 0, 0, 1, 1,
-1.04809, 0.3179538, -1.935024, 1, 0, 0, 1, 1,
-1.045921, 0.842806, -2.526227, 0, 0, 0, 1, 1,
-1.033297, 0.05323626, -1.592956, 0, 0, 0, 1, 1,
-1.032119, 0.2521825, -0.1425376, 0, 0, 0, 1, 1,
-1.030891, 0.6212361, -0.9461821, 0, 0, 0, 1, 1,
-1.030823, 0.8994572, 0.1096307, 0, 0, 0, 1, 1,
-1.025865, 0.1841448, -1.665447, 0, 0, 0, 1, 1,
-1.021604, -0.2893824, -1.731403, 0, 0, 0, 1, 1,
-1.021457, -0.01409989, -3.166733, 1, 1, 1, 1, 1,
-1.01775, -3.444741, -0.3363853, 1, 1, 1, 1, 1,
-1.016597, 1.433574, 0.7369451, 1, 1, 1, 1, 1,
-1.015699, 0.6970723, -1.521823, 1, 1, 1, 1, 1,
-1.012682, -0.2221887, 0.07941584, 1, 1, 1, 1, 1,
-1.009228, 0.004734878, -0.7307623, 1, 1, 1, 1, 1,
-1.007254, 0.7163037, 0.5496194, 1, 1, 1, 1, 1,
-1.003537, 1.410926, 0.8222844, 1, 1, 1, 1, 1,
-1.001685, -0.908609, -2.899885, 1, 1, 1, 1, 1,
-1.000134, -0.05827015, -2.170354, 1, 1, 1, 1, 1,
-0.9951856, -0.2115439, -1.250695, 1, 1, 1, 1, 1,
-0.9927483, 0.7313721, -2.133862, 1, 1, 1, 1, 1,
-0.9809347, -0.6318129, -4.354799, 1, 1, 1, 1, 1,
-0.9616096, -0.972612, -1.317942, 1, 1, 1, 1, 1,
-0.9438924, -0.4392186, -0.9387621, 1, 1, 1, 1, 1,
-0.9405764, -0.3513842, -1.730528, 0, 0, 1, 1, 1,
-0.9231692, 0.1265313, -1.576305, 1, 0, 0, 1, 1,
-0.9202288, -0.7781596, -3.018893, 1, 0, 0, 1, 1,
-0.9200371, -1.363302, -4.061756, 1, 0, 0, 1, 1,
-0.9181678, 0.3764904, -0.5494546, 1, 0, 0, 1, 1,
-0.9160334, 0.2391363, -0.7443643, 1, 0, 0, 1, 1,
-0.9145424, 0.3812177, -1.802935, 0, 0, 0, 1, 1,
-0.9119334, 0.553721, -2.024161, 0, 0, 0, 1, 1,
-0.9071028, -0.3751884, -1.32003, 0, 0, 0, 1, 1,
-0.9065928, -0.226419, -3.098886, 0, 0, 0, 1, 1,
-0.8961682, 0.9482294, 0.2279981, 0, 0, 0, 1, 1,
-0.8955706, 1.009043, 0.1996959, 0, 0, 0, 1, 1,
-0.8946421, -1.816438, -4.373241, 0, 0, 0, 1, 1,
-0.8902376, 1.362629, -0.5906153, 1, 1, 1, 1, 1,
-0.8896953, -1.831843, -3.948668, 1, 1, 1, 1, 1,
-0.8823097, -1.147741, -3.847141, 1, 1, 1, 1, 1,
-0.8822547, 1.937078, 0.3434262, 1, 1, 1, 1, 1,
-0.8727502, 1.088163, -0.3482499, 1, 1, 1, 1, 1,
-0.8724539, -1.323244, -1.2926, 1, 1, 1, 1, 1,
-0.868003, 0.5196268, -2.159411, 1, 1, 1, 1, 1,
-0.8665219, 0.7442476, -1.661657, 1, 1, 1, 1, 1,
-0.8635259, 0.003002539, -1.782581, 1, 1, 1, 1, 1,
-0.8633094, 0.1304165, -1.489504, 1, 1, 1, 1, 1,
-0.8619017, -0.7171901, -3.219928, 1, 1, 1, 1, 1,
-0.8611713, -0.534362, -0.8660393, 1, 1, 1, 1, 1,
-0.8535842, 1.069818, -1.857548, 1, 1, 1, 1, 1,
-0.8499956, 0.4379904, 1.161842, 1, 1, 1, 1, 1,
-0.8468215, 1.229502, -1.749182, 1, 1, 1, 1, 1,
-0.8448608, -0.6221753, -1.932336, 0, 0, 1, 1, 1,
-0.8441238, 0.4906414, -0.4596777, 1, 0, 0, 1, 1,
-0.8197987, -0.4855208, -1.156061, 1, 0, 0, 1, 1,
-0.8187636, 0.1154561, -2.163736, 1, 0, 0, 1, 1,
-0.8150771, -0.8921254, -2.881214, 1, 0, 0, 1, 1,
-0.81398, -0.9967906, -2.682505, 1, 0, 0, 1, 1,
-0.810576, 0.2114524, -2.186056, 0, 0, 0, 1, 1,
-0.8041452, -0.2867875, -1.623032, 0, 0, 0, 1, 1,
-0.8017076, 0.4300989, -2.265356, 0, 0, 0, 1, 1,
-0.8002918, 0.341822, -0.811224, 0, 0, 0, 1, 1,
-0.7995946, -1.613398, -1.898552, 0, 0, 0, 1, 1,
-0.7925402, 0.9950014, -1.602089, 0, 0, 0, 1, 1,
-0.7855232, 0.8837447, -0.5149837, 0, 0, 0, 1, 1,
-0.7802692, -0.1735047, -0.7879835, 1, 1, 1, 1, 1,
-0.778426, 0.2239788, -0.2947059, 1, 1, 1, 1, 1,
-0.7703757, -0.5294471, -2.911918, 1, 1, 1, 1, 1,
-0.7703149, 1.292886, 0.02325265, 1, 1, 1, 1, 1,
-0.7631175, -0.8273537, -1.643486, 1, 1, 1, 1, 1,
-0.7621481, -1.238209, -1.647071, 1, 1, 1, 1, 1,
-0.7600271, -0.04969182, -0.838511, 1, 1, 1, 1, 1,
-0.7540491, 2.14168, -1.987959, 1, 1, 1, 1, 1,
-0.7529699, 0.5338688, -2.752255, 1, 1, 1, 1, 1,
-0.7519943, -1.327708, -1.491676, 1, 1, 1, 1, 1,
-0.7452416, -0.2653632, -1.497562, 1, 1, 1, 1, 1,
-0.7336319, 1.086874, -1.409671, 1, 1, 1, 1, 1,
-0.7335263, -3.479472, -3.505538, 1, 1, 1, 1, 1,
-0.7305318, -0.0653749, -0.1935033, 1, 1, 1, 1, 1,
-0.7248276, -1.193012, -2.409158, 1, 1, 1, 1, 1,
-0.7243835, -2.104769, -1.567076, 0, 0, 1, 1, 1,
-0.7131079, -0.1197609, -1.673572, 1, 0, 0, 1, 1,
-0.7112202, -1.734781, -2.610234, 1, 0, 0, 1, 1,
-0.7093616, 0.5365441, -1.213886, 1, 0, 0, 1, 1,
-0.7074999, 0.789843, -0.9312854, 1, 0, 0, 1, 1,
-0.7065079, -1.014711, -2.040575, 1, 0, 0, 1, 1,
-0.7054779, 0.1156681, -1.488487, 0, 0, 0, 1, 1,
-0.697413, -0.1100535, -2.288597, 0, 0, 0, 1, 1,
-0.6966015, 1.413526, -1.806239, 0, 0, 0, 1, 1,
-0.6923479, 0.3153134, -2.251442, 0, 0, 0, 1, 1,
-0.6907315, 0.8471287, -0.5376404, 0, 0, 0, 1, 1,
-0.6903839, 2.08329, 1.248219, 0, 0, 0, 1, 1,
-0.6902562, -0.7355738, -2.27597, 0, 0, 0, 1, 1,
-0.6706092, -0.5953943, -2.685632, 1, 1, 1, 1, 1,
-0.6702029, -1.421797, -3.080293, 1, 1, 1, 1, 1,
-0.6674975, -0.1953965, -3.447666, 1, 1, 1, 1, 1,
-0.6673015, 0.5422047, -1.996742, 1, 1, 1, 1, 1,
-0.6667449, 0.5010497, -0.8575258, 1, 1, 1, 1, 1,
-0.6619436, -0.06037245, -3.359749, 1, 1, 1, 1, 1,
-0.6605464, -0.09525625, -1.205733, 1, 1, 1, 1, 1,
-0.6601855, -0.1890423, -1.862073, 1, 1, 1, 1, 1,
-0.6544997, 0.5159756, -1.954921, 1, 1, 1, 1, 1,
-0.6544628, 0.6770216, 0.06661247, 1, 1, 1, 1, 1,
-0.6544204, -1.128698, -3.72513, 1, 1, 1, 1, 1,
-0.6529166, -1.536161, -2.882222, 1, 1, 1, 1, 1,
-0.6444696, 0.1195863, -1.369651, 1, 1, 1, 1, 1,
-0.6380714, 1.677134, -0.27479, 1, 1, 1, 1, 1,
-0.6376625, -0.4405437, -2.477898, 1, 1, 1, 1, 1,
-0.6375734, -1.165318, -2.086416, 0, 0, 1, 1, 1,
-0.6354526, 0.2353511, -1.280717, 1, 0, 0, 1, 1,
-0.6335551, -0.05273172, -2.924027, 1, 0, 0, 1, 1,
-0.6332089, 0.9817437, -0.817417, 1, 0, 0, 1, 1,
-0.6247043, -0.1257268, -1.978353, 1, 0, 0, 1, 1,
-0.6175558, -0.3692244, -1.44661, 1, 0, 0, 1, 1,
-0.6141672, 0.5594022, -0.4829692, 0, 0, 0, 1, 1,
-0.6138496, -0.08380231, -1.291111, 0, 0, 0, 1, 1,
-0.6108871, -0.206989, -0.8281093, 0, 0, 0, 1, 1,
-0.6100289, 0.5430773, -0.6779436, 0, 0, 0, 1, 1,
-0.6090975, -0.2119564, -2.551526, 0, 0, 0, 1, 1,
-0.6084474, -0.8777399, -3.861451, 0, 0, 0, 1, 1,
-0.6041762, 0.6245233, -0.1825136, 0, 0, 0, 1, 1,
-0.6036162, 0.4522503, -0.05793287, 1, 1, 1, 1, 1,
-0.5994681, 0.06769197, -2.204205, 1, 1, 1, 1, 1,
-0.5953627, 0.0793997, -0.9894866, 1, 1, 1, 1, 1,
-0.5949746, 0.3254606, -1.061269, 1, 1, 1, 1, 1,
-0.5907933, -0.1010373, -2.510803, 1, 1, 1, 1, 1,
-0.5900134, 1.030556, -1.035868, 1, 1, 1, 1, 1,
-0.5880614, -0.2028156, -2.461894, 1, 1, 1, 1, 1,
-0.5876613, 0.748643, 0.1014937, 1, 1, 1, 1, 1,
-0.5817443, -0.1758265, -1.414913, 1, 1, 1, 1, 1,
-0.564895, 1.311249, 0.3964101, 1, 1, 1, 1, 1,
-0.563908, -1.619499, -1.496251, 1, 1, 1, 1, 1,
-0.5586878, 0.4292522, 0.2265257, 1, 1, 1, 1, 1,
-0.551484, -0.09508937, -3.024117, 1, 1, 1, 1, 1,
-0.5499875, 0.03993657, -0.9297952, 1, 1, 1, 1, 1,
-0.5491515, 0.514411, -2.554382, 1, 1, 1, 1, 1,
-0.5461755, -0.7659594, -3.778212, 0, 0, 1, 1, 1,
-0.5456467, 0.5533973, -2.230242, 1, 0, 0, 1, 1,
-0.542264, 0.5795777, -0.9162021, 1, 0, 0, 1, 1,
-0.537938, -1.248559, -2.817481, 1, 0, 0, 1, 1,
-0.5364433, -1.226102, -1.815545, 1, 0, 0, 1, 1,
-0.5351722, -1.039207, -3.591047, 1, 0, 0, 1, 1,
-0.5340297, -0.7267572, -1.753501, 0, 0, 0, 1, 1,
-0.5307847, 0.08868042, -0.8447714, 0, 0, 0, 1, 1,
-0.5270779, -0.1365524, -1.303538, 0, 0, 0, 1, 1,
-0.5257714, 0.2151796, -2.409769, 0, 0, 0, 1, 1,
-0.5231029, 1.392024, 0.5849059, 0, 0, 0, 1, 1,
-0.5229982, -0.2068188, -1.654069, 0, 0, 0, 1, 1,
-0.522861, -0.3230721, -3.702928, 0, 0, 0, 1, 1,
-0.5180997, 1.113751, 0.04367739, 1, 1, 1, 1, 1,
-0.5154052, 0.6484659, -0.4319029, 1, 1, 1, 1, 1,
-0.5141805, -0.7803445, -2.473303, 1, 1, 1, 1, 1,
-0.5130649, 0.5140281, -1.153878, 1, 1, 1, 1, 1,
-0.5120941, -0.4167296, -0.3594884, 1, 1, 1, 1, 1,
-0.5091682, 0.6929733, -0.9918186, 1, 1, 1, 1, 1,
-0.507614, 1.185221, 1.501311, 1, 1, 1, 1, 1,
-0.5063779, 1.537511, -0.7262352, 1, 1, 1, 1, 1,
-0.5049779, -1.299906, -3.654803, 1, 1, 1, 1, 1,
-0.5046427, 1.112049, -0.7941023, 1, 1, 1, 1, 1,
-0.5025823, 1.261335, -1.537624, 1, 1, 1, 1, 1,
-0.4997559, -1.547344, -3.60598, 1, 1, 1, 1, 1,
-0.4938868, -0.2170433, -0.8578786, 1, 1, 1, 1, 1,
-0.4926251, 0.7534158, -0.7868011, 1, 1, 1, 1, 1,
-0.489179, 0.7517149, -0.9573032, 1, 1, 1, 1, 1,
-0.4885847, -1.287096, -3.16588, 0, 0, 1, 1, 1,
-0.487408, 0.7201562, -0.8395993, 1, 0, 0, 1, 1,
-0.4857706, 0.4620875, -0.8389316, 1, 0, 0, 1, 1,
-0.4829333, -0.1794475, -1.456754, 1, 0, 0, 1, 1,
-0.4818831, -1.623926, -4.058046, 1, 0, 0, 1, 1,
-0.4749346, 0.9441677, -0.2972719, 1, 0, 0, 1, 1,
-0.4700689, -1.270093, -2.671041, 0, 0, 0, 1, 1,
-0.4698856, -0.643108, -3.002464, 0, 0, 0, 1, 1,
-0.4654444, 0.9581447, -0.6556777, 0, 0, 0, 1, 1,
-0.4625643, 0.2688041, -0.7034751, 0, 0, 0, 1, 1,
-0.4563922, -0.03744536, -2.031066, 0, 0, 0, 1, 1,
-0.455682, -0.5703949, 0.0414728, 0, 0, 0, 1, 1,
-0.4484857, -0.3345413, -1.22693, 0, 0, 0, 1, 1,
-0.4480739, 1.353194, -1.33561, 1, 1, 1, 1, 1,
-0.4475442, -0.7451954, -2.183008, 1, 1, 1, 1, 1,
-0.4464039, -1.322258, -4.323884, 1, 1, 1, 1, 1,
-0.4431945, 0.2417456, -1.921506, 1, 1, 1, 1, 1,
-0.4306926, 1.706905, 0.1830084, 1, 1, 1, 1, 1,
-0.4233968, -0.4709717, -0.9526946, 1, 1, 1, 1, 1,
-0.4165916, 0.7684507, -0.03645939, 1, 1, 1, 1, 1,
-0.416428, -0.4102536, -3.645837, 1, 1, 1, 1, 1,
-0.4146439, -0.4549125, -2.21167, 1, 1, 1, 1, 1,
-0.4141819, -0.5652723, -2.867609, 1, 1, 1, 1, 1,
-0.407571, -0.8030828, -1.716202, 1, 1, 1, 1, 1,
-0.4063066, 0.1860197, 0.2589127, 1, 1, 1, 1, 1,
-0.3925397, 0.1348905, -2.06367, 1, 1, 1, 1, 1,
-0.3887348, 0.7573121, -0.8922747, 1, 1, 1, 1, 1,
-0.3862326, 2.457513, 0.352923, 1, 1, 1, 1, 1,
-0.3827233, -1.066654, -2.097045, 0, 0, 1, 1, 1,
-0.3791432, -0.368246, -3.55056, 1, 0, 0, 1, 1,
-0.3781106, 0.6293299, -0.3436159, 1, 0, 0, 1, 1,
-0.3742915, 0.07731098, -2.210533, 1, 0, 0, 1, 1,
-0.3728381, -1.256304, -2.411841, 1, 0, 0, 1, 1,
-0.3706246, 0.2598209, 0.06825624, 1, 0, 0, 1, 1,
-0.3637087, -2.292918, -1.881363, 0, 0, 0, 1, 1,
-0.3622158, -0.001001922, -0.100485, 0, 0, 0, 1, 1,
-0.3617678, 1.39053, -0.5986978, 0, 0, 0, 1, 1,
-0.3560465, 1.071644, 0.2738017, 0, 0, 0, 1, 1,
-0.3540866, 0.2289096, -0.1801856, 0, 0, 0, 1, 1,
-0.3453187, -1.815853, -3.004025, 0, 0, 0, 1, 1,
-0.3434181, -0.5972615, -2.01445, 0, 0, 0, 1, 1,
-0.3425529, -0.3731116, -3.393857, 1, 1, 1, 1, 1,
-0.3317607, 1.198177, -0.2286104, 1, 1, 1, 1, 1,
-0.3280644, 1.467791, -0.6252416, 1, 1, 1, 1, 1,
-0.3263977, 0.7075422, -1.806686, 1, 1, 1, 1, 1,
-0.3207079, 0.645387, -1.694842, 1, 1, 1, 1, 1,
-0.316702, 1.161979, 0.221686, 1, 1, 1, 1, 1,
-0.3077635, 0.6068588, -1.015337, 1, 1, 1, 1, 1,
-0.300346, -0.6286009, -2.541524, 1, 1, 1, 1, 1,
-0.2914861, 0.786752, 1.36311, 1, 1, 1, 1, 1,
-0.2898597, -0.8481365, -2.264903, 1, 1, 1, 1, 1,
-0.2895114, -0.1454459, -1.455969, 1, 1, 1, 1, 1,
-0.2894406, 1.639891, -2.092202, 1, 1, 1, 1, 1,
-0.2829328, -1.361276, -4.058833, 1, 1, 1, 1, 1,
-0.2816968, -0.3694701, -1.062416, 1, 1, 1, 1, 1,
-0.2798092, -0.4735201, -2.031189, 1, 1, 1, 1, 1,
-0.279533, 0.4765274, -3.080075, 0, 0, 1, 1, 1,
-0.2732987, 1.513827, 1.023071, 1, 0, 0, 1, 1,
-0.2732977, -0.8921252, -1.796003, 1, 0, 0, 1, 1,
-0.2709983, -2.230261, -2.35755, 1, 0, 0, 1, 1,
-0.2683536, -0.9306608, -1.871316, 1, 0, 0, 1, 1,
-0.268095, 0.8586438, 0.4914212, 1, 0, 0, 1, 1,
-0.2628314, -2.391399, -4.535456, 0, 0, 0, 1, 1,
-0.2608343, 0.5704791, -0.8661929, 0, 0, 0, 1, 1,
-0.2607187, -0.4679526, -2.980099, 0, 0, 0, 1, 1,
-0.2606025, -0.2177729, -4.057755, 0, 0, 0, 1, 1,
-0.2584895, 0.6432206, -0.9777877, 0, 0, 0, 1, 1,
-0.2579999, 0.6791584, 1.008495, 0, 0, 0, 1, 1,
-0.2494009, 2.212432, -0.7423344, 0, 0, 0, 1, 1,
-0.2482792, 0.6256984, -2.16774, 1, 1, 1, 1, 1,
-0.2452567, -0.3286692, -2.462889, 1, 1, 1, 1, 1,
-0.2437768, 0.8391753, 0.9112281, 1, 1, 1, 1, 1,
-0.2435153, 0.4398106, -0.9014177, 1, 1, 1, 1, 1,
-0.2419982, 0.8872994, 0.8160872, 1, 1, 1, 1, 1,
-0.2408581, -0.4098495, -1.787021, 1, 1, 1, 1, 1,
-0.2395771, 1.149198, 0.693826, 1, 1, 1, 1, 1,
-0.2378097, -1.306458, -2.637764, 1, 1, 1, 1, 1,
-0.233249, -0.2119678, -3.166918, 1, 1, 1, 1, 1,
-0.232172, 1.688526, -0.2990553, 1, 1, 1, 1, 1,
-0.2285035, -0.6696616, -2.171083, 1, 1, 1, 1, 1,
-0.2247864, -0.9287187, -2.997212, 1, 1, 1, 1, 1,
-0.2180288, 0.9056687, -0.726605, 1, 1, 1, 1, 1,
-0.2113864, -0.1063733, -1.790341, 1, 1, 1, 1, 1,
-0.2103302, -0.6009412, -3.120788, 1, 1, 1, 1, 1,
-0.203781, 0.510839, -0.7099102, 0, 0, 1, 1, 1,
-0.2004386, -0.8062074, -0.8264552, 1, 0, 0, 1, 1,
-0.1995819, -1.499462, -3.728228, 1, 0, 0, 1, 1,
-0.1994991, 0.7337097, 0.07779926, 1, 0, 0, 1, 1,
-0.1970359, -1.63326, -3.888913, 1, 0, 0, 1, 1,
-0.1943832, -0.638716, -4.574749, 1, 0, 0, 1, 1,
-0.1872784, -1.616318, -5.074669, 0, 0, 0, 1, 1,
-0.1848485, 1.271794, -0.1996899, 0, 0, 0, 1, 1,
-0.1847416, 0.6178569, -1.547182, 0, 0, 0, 1, 1,
-0.1818719, -0.202988, -4.135233, 0, 0, 0, 1, 1,
-0.1796504, -1.636527, -2.301114, 0, 0, 0, 1, 1,
-0.1795743, -0.8219164, -3.285135, 0, 0, 0, 1, 1,
-0.1764463, 0.1869927, 0.2477158, 0, 0, 0, 1, 1,
-0.173186, 1.354235, 0.5166284, 1, 1, 1, 1, 1,
-0.1658992, -2.401386, -2.31928, 1, 1, 1, 1, 1,
-0.1647721, 1.095269, -0.6207101, 1, 1, 1, 1, 1,
-0.1625142, -0.3918646, -3.696742, 1, 1, 1, 1, 1,
-0.150189, -0.5986552, -1.594479, 1, 1, 1, 1, 1,
-0.149452, 1.119483, -0.5745192, 1, 1, 1, 1, 1,
-0.1488755, 0.1887153, 0.03824305, 1, 1, 1, 1, 1,
-0.1475016, -0.4433306, -1.86072, 1, 1, 1, 1, 1,
-0.1415119, -1.775123, -1.466845, 1, 1, 1, 1, 1,
-0.1316177, -0.1855736, -2.745016, 1, 1, 1, 1, 1,
-0.1303861, -0.09673821, -1.513191, 1, 1, 1, 1, 1,
-0.1293066, 0.4679096, 1.834419, 1, 1, 1, 1, 1,
-0.1290974, 1.782588, -0.9712145, 1, 1, 1, 1, 1,
-0.1273795, -0.9825541, -3.407952, 1, 1, 1, 1, 1,
-0.1269477, 1.162064, 0.792227, 1, 1, 1, 1, 1,
-0.1269399, -1.439959, -1.680587, 0, 0, 1, 1, 1,
-0.123118, 0.858386, -0.7282748, 1, 0, 0, 1, 1,
-0.1217425, 0.4781674, -0.379757, 1, 0, 0, 1, 1,
-0.1154755, -0.8398789, -2.601687, 1, 0, 0, 1, 1,
-0.1151313, -0.494232, -1.483176, 1, 0, 0, 1, 1,
-0.1140654, -0.3155861, -2.798594, 1, 0, 0, 1, 1,
-0.11085, -1.243281, -3.12425, 0, 0, 0, 1, 1,
-0.110337, -0.9518511, -3.303182, 0, 0, 0, 1, 1,
-0.1052275, 0.7271038, 0.1975717, 0, 0, 0, 1, 1,
-0.1019238, -1.276718, -3.499359, 0, 0, 0, 1, 1,
-0.101228, 0.4180888, -0.3618167, 0, 0, 0, 1, 1,
-0.1001876, 0.2194063, -0.6852745, 0, 0, 0, 1, 1,
-0.09858011, -0.2900003, -1.788857, 0, 0, 0, 1, 1,
-0.09794634, -1.36706, -3.951595, 1, 1, 1, 1, 1,
-0.09661671, 1.080395, 0.880316, 1, 1, 1, 1, 1,
-0.09008619, 0.716174, 0.5682654, 1, 1, 1, 1, 1,
-0.08989982, -1.417226, -3.250645, 1, 1, 1, 1, 1,
-0.08620326, -1.974437, -4.330445, 1, 1, 1, 1, 1,
-0.08599789, -0.02325727, -1.873286, 1, 1, 1, 1, 1,
-0.08427244, 0.3380336, -1.38915, 1, 1, 1, 1, 1,
-0.08304365, 4.709875e-05, -1.256872, 1, 1, 1, 1, 1,
-0.08250319, -0.6598476, -1.053772, 1, 1, 1, 1, 1,
-0.07886558, -1.371524, -3.297523, 1, 1, 1, 1, 1,
-0.07851259, 0.5804412, -0.2164379, 1, 1, 1, 1, 1,
-0.0784058, -0.5514227, -3.966483, 1, 1, 1, 1, 1,
-0.07663173, 1.153001, 0.3950064, 1, 1, 1, 1, 1,
-0.07239735, -0.8671329, -4.50846, 1, 1, 1, 1, 1,
-0.07191317, 1.31185, -0.8881592, 1, 1, 1, 1, 1,
-0.06406006, -0.7861054, -4.061547, 0, 0, 1, 1, 1,
-0.0640365, 0.007407075, 0.2633009, 1, 0, 0, 1, 1,
-0.06279981, -1.272512, -3.888889, 1, 0, 0, 1, 1,
-0.06017207, -0.2137575, -2.738387, 1, 0, 0, 1, 1,
-0.05765741, -1.007382, -4.06763, 1, 0, 0, 1, 1,
-0.05720707, -2.377851, -2.908479, 1, 0, 0, 1, 1,
-0.05641764, -1.496032, -2.876842, 0, 0, 0, 1, 1,
-0.05454127, 1.175403, 0.6719719, 0, 0, 0, 1, 1,
-0.0526965, -1.210839, -4.562872, 0, 0, 0, 1, 1,
-0.05186042, 0.9967378, -0.926805, 0, 0, 0, 1, 1,
-0.04700118, -1.058496, -2.589646, 0, 0, 0, 1, 1,
-0.04320387, 1.085859, 1.010596, 0, 0, 0, 1, 1,
-0.04316743, -0.2475186, -3.875737, 0, 0, 0, 1, 1,
-0.04135009, 0.7781268, -0.01089234, 1, 1, 1, 1, 1,
-0.03991053, 0.2522904, -0.4102363, 1, 1, 1, 1, 1,
-0.03591837, 1.059059, 0.5327061, 1, 1, 1, 1, 1,
-0.0320527, -0.07110673, -3.537735, 1, 1, 1, 1, 1,
-0.03081797, 0.568902, -0.5070531, 1, 1, 1, 1, 1,
-0.02989795, -0.361156, -3.159086, 1, 1, 1, 1, 1,
-0.02949215, 2.929337, 0.1427622, 1, 1, 1, 1, 1,
-0.02741204, -0.8146374, -2.484914, 1, 1, 1, 1, 1,
-0.02529832, -1.163864, -1.912258, 1, 1, 1, 1, 1,
-0.02404081, 0.9041012, 0.2291041, 1, 1, 1, 1, 1,
-0.02282295, 0.9423831, -0.3967972, 1, 1, 1, 1, 1,
-0.02183296, -0.1007659, -2.611923, 1, 1, 1, 1, 1,
-0.01938538, -1.189462, -3.305276, 1, 1, 1, 1, 1,
-0.01718946, -0.3946232, -4.105465, 1, 1, 1, 1, 1,
-0.01666716, -1.425937, -2.561741, 1, 1, 1, 1, 1,
-0.01630262, 2.013611, -2.003377, 0, 0, 1, 1, 1,
-0.0152869, 0.6037412, -0.2671584, 1, 0, 0, 1, 1,
-0.01406683, 1.175881, -0.1047758, 1, 0, 0, 1, 1,
-0.01379916, 0.3271132, -0.1670634, 1, 0, 0, 1, 1,
-0.01295001, 0.1370196, 0.2182195, 1, 0, 0, 1, 1,
-0.01177677, -1.26954, -3.546197, 1, 0, 0, 1, 1,
-0.01169464, -0.5767416, -3.132998, 0, 0, 0, 1, 1,
-0.01098048, -0.7560258, -4.188739, 0, 0, 0, 1, 1,
-0.009484001, -0.2513475, -1.088243, 0, 0, 0, 1, 1,
-0.009024161, 0.8639756, -0.8084053, 0, 0, 0, 1, 1,
-0.005122249, 0.9497634, 0.4894927, 0, 0, 0, 1, 1,
0.004565412, 1.475958, 0.1062719, 0, 0, 0, 1, 1,
0.00683212, 0.1784792, 0.3679404, 0, 0, 0, 1, 1,
0.007010093, -0.3828013, 3.889816, 1, 1, 1, 1, 1,
0.00752467, 0.8490606, 1.290067, 1, 1, 1, 1, 1,
0.007683104, -2.131916, 3.922485, 1, 1, 1, 1, 1,
0.01037712, -0.4596961, 3.543366, 1, 1, 1, 1, 1,
0.01083363, 1.526198, -0.03383243, 1, 1, 1, 1, 1,
0.01349576, -0.03045479, 2.42083, 1, 1, 1, 1, 1,
0.01392639, 0.7737901, -0.0919707, 1, 1, 1, 1, 1,
0.01610896, -0.9892213, 1.55875, 1, 1, 1, 1, 1,
0.02299869, 0.530946, 0.07881466, 1, 1, 1, 1, 1,
0.02400763, 1.053572, 1.277072, 1, 1, 1, 1, 1,
0.0242062, 0.3949323, -0.4429173, 1, 1, 1, 1, 1,
0.02634867, 1.239142, 0.1922838, 1, 1, 1, 1, 1,
0.03404467, 1.001643, 0.8365617, 1, 1, 1, 1, 1,
0.03525795, -0.597822, 3.819038, 1, 1, 1, 1, 1,
0.04331225, -0.4054632, 2.443063, 1, 1, 1, 1, 1,
0.0500062, -2.811889, 4.535221, 0, 0, 1, 1, 1,
0.05043978, 0.05696631, 0.4028104, 1, 0, 0, 1, 1,
0.053928, -0.2529224, 2.405174, 1, 0, 0, 1, 1,
0.05774854, 0.1798048, 0.1777157, 1, 0, 0, 1, 1,
0.05818515, -1.685194, 3.316955, 1, 0, 0, 1, 1,
0.06569883, 1.353667, -0.5753539, 1, 0, 0, 1, 1,
0.06648494, 2.412114, -0.9945995, 0, 0, 0, 1, 1,
0.06749601, -1.05049, 2.801893, 0, 0, 0, 1, 1,
0.06771166, 0.4209444, 1.571295, 0, 0, 0, 1, 1,
0.07049696, 0.5714856, -0.1104026, 0, 0, 0, 1, 1,
0.08189061, 0.0992349, 2.593256, 0, 0, 0, 1, 1,
0.08195851, 1.412523, -0.7013385, 0, 0, 0, 1, 1,
0.08375409, 0.2736935, -0.1285038, 0, 0, 0, 1, 1,
0.08887457, 0.002747713, 1.678538, 1, 1, 1, 1, 1,
0.08969678, -1.557817, 3.142668, 1, 1, 1, 1, 1,
0.09073959, -0.4333405, 3.682333, 1, 1, 1, 1, 1,
0.09282011, -0.1812851, 2.401942, 1, 1, 1, 1, 1,
0.09836849, -0.4526935, 2.180372, 1, 1, 1, 1, 1,
0.1024034, 2.434762, 0.9810172, 1, 1, 1, 1, 1,
0.1034688, 1.317942, -0.6665986, 1, 1, 1, 1, 1,
0.1035695, 2.748869, -0.8131145, 1, 1, 1, 1, 1,
0.1043966, 0.6990396, 0.2258426, 1, 1, 1, 1, 1,
0.1046774, -0.4021475, 2.115742, 1, 1, 1, 1, 1,
0.1055665, 1.081547, -0.4440458, 1, 1, 1, 1, 1,
0.1080298, -1.718496, 2.126834, 1, 1, 1, 1, 1,
0.1142692, 0.1531314, -0.2863293, 1, 1, 1, 1, 1,
0.1177854, 0.6353378, 0.3092332, 1, 1, 1, 1, 1,
0.1182349, 0.7463742, 1.003372, 1, 1, 1, 1, 1,
0.1208225, 0.4383719, -0.06161056, 0, 0, 1, 1, 1,
0.1222041, 0.5578513, 0.03261518, 1, 0, 0, 1, 1,
0.1325366, 1.45127, 0.3211324, 1, 0, 0, 1, 1,
0.1360194, -0.648914, 2.838459, 1, 0, 0, 1, 1,
0.1370258, -0.7658162, 3.222271, 1, 0, 0, 1, 1,
0.1374672, 0.9136078, 1.095167, 1, 0, 0, 1, 1,
0.1407469, 0.7266114, -0.4162579, 0, 0, 0, 1, 1,
0.1412165, 0.7403025, 0.1493075, 0, 0, 0, 1, 1,
0.1439261, -1.306104, 1.807705, 0, 0, 0, 1, 1,
0.1447979, 0.6280711, 0.8189896, 0, 0, 0, 1, 1,
0.1524581, 1.334756, -0.6271275, 0, 0, 0, 1, 1,
0.1603947, -1.161964, 3.320298, 0, 0, 0, 1, 1,
0.1616931, 0.986163, -0.728597, 0, 0, 0, 1, 1,
0.1643144, 0.1552531, 0.7174111, 1, 1, 1, 1, 1,
0.1688425, 0.9899159, 0.1501169, 1, 1, 1, 1, 1,
0.1740464, -0.02643244, 2.418274, 1, 1, 1, 1, 1,
0.1813435, -1.595669, 3.4499, 1, 1, 1, 1, 1,
0.1822126, 0.1077739, 1.41732, 1, 1, 1, 1, 1,
0.1868829, 0.6207791, 0.4230909, 1, 1, 1, 1, 1,
0.1886574, 0.02734997, 2.675438, 1, 1, 1, 1, 1,
0.1923619, -1.557974, 4.285935, 1, 1, 1, 1, 1,
0.1929889, -0.3629407, 1.629025, 1, 1, 1, 1, 1,
0.201214, -0.2614687, 2.260978, 1, 1, 1, 1, 1,
0.2042858, -0.6542493, 4.230254, 1, 1, 1, 1, 1,
0.210996, -0.2195531, 2.52336, 1, 1, 1, 1, 1,
0.2112975, -0.7242355, 2.41453, 1, 1, 1, 1, 1,
0.2133419, 1.011639, 0.6969307, 1, 1, 1, 1, 1,
0.215548, 1.558751, 0.6699162, 1, 1, 1, 1, 1,
0.2156867, 0.02123979, 2.12788, 0, 0, 1, 1, 1,
0.2187758, 0.2807115, 0.06186191, 1, 0, 0, 1, 1,
0.2188272, -1.352528, 2.970309, 1, 0, 0, 1, 1,
0.2210777, 0.600673, 0.8975568, 1, 0, 0, 1, 1,
0.2226438, -0.7951944, 5.516822, 1, 0, 0, 1, 1,
0.2251041, 0.9515684, 0.05931526, 1, 0, 0, 1, 1,
0.2273963, -1.167538, 2.755186, 0, 0, 0, 1, 1,
0.2285365, -1.327549, 2.304586, 0, 0, 0, 1, 1,
0.2328096, 0.6659465, 1.438727, 0, 0, 0, 1, 1,
0.2332477, 0.2804096, 1.356007, 0, 0, 0, 1, 1,
0.245922, 2.401222, -1.668562, 0, 0, 0, 1, 1,
0.2467942, 0.7581229, -0.8901206, 0, 0, 0, 1, 1,
0.2511443, -0.989172, 3.002154, 0, 0, 0, 1, 1,
0.2526903, 0.6657892, 1.009763, 1, 1, 1, 1, 1,
0.2536209, 0.251644, 1.500665, 1, 1, 1, 1, 1,
0.2569425, -0.7222878, 3.481116, 1, 1, 1, 1, 1,
0.2611029, -0.237983, 1.212916, 1, 1, 1, 1, 1,
0.2622817, 0.2289283, 1.976629, 1, 1, 1, 1, 1,
0.2645855, 0.5275438, 0.5355755, 1, 1, 1, 1, 1,
0.2653609, -1.739221, 1.8316, 1, 1, 1, 1, 1,
0.2661875, 1.572872, -0.426381, 1, 1, 1, 1, 1,
0.2689214, -1.92358, 3.589741, 1, 1, 1, 1, 1,
0.2697182, 0.1395079, 1.180984, 1, 1, 1, 1, 1,
0.2718489, 0.8917332, 0.04571265, 1, 1, 1, 1, 1,
0.2750368, 0.2966472, 0.5401813, 1, 1, 1, 1, 1,
0.2751127, -0.2602365, 2.019256, 1, 1, 1, 1, 1,
0.2755024, -0.4222151, 1.958045, 1, 1, 1, 1, 1,
0.278091, 0.239147, 1.694611, 1, 1, 1, 1, 1,
0.2822221, 0.9439228, 0.5100216, 0, 0, 1, 1, 1,
0.2838637, 0.06362614, 1.014002, 1, 0, 0, 1, 1,
0.2882231, 1.098796, 1.473448, 1, 0, 0, 1, 1,
0.2884299, 1.368455, -0.1081758, 1, 0, 0, 1, 1,
0.2996175, 0.04147289, 1.690012, 1, 0, 0, 1, 1,
0.3020308, 0.4777042, 0.005727676, 1, 0, 0, 1, 1,
0.3029172, -0.3876663, 2.184426, 0, 0, 0, 1, 1,
0.3047734, 1.057338, 0.8256594, 0, 0, 0, 1, 1,
0.3052259, -0.4632584, 1.442158, 0, 0, 0, 1, 1,
0.3068188, 0.06552376, 0.8918577, 0, 0, 0, 1, 1,
0.3157819, 0.1168099, 1.383333, 0, 0, 0, 1, 1,
0.3161794, 0.3019872, 1.375068, 0, 0, 0, 1, 1,
0.3165287, 1.590564, 0.5854388, 0, 0, 0, 1, 1,
0.3169192, 0.02693055, 2.908157, 1, 1, 1, 1, 1,
0.3222367, -0.8030825, 2.606782, 1, 1, 1, 1, 1,
0.3235056, 1.283305, 1.577573, 1, 1, 1, 1, 1,
0.3237996, 1.130827, -0.6274455, 1, 1, 1, 1, 1,
0.3239264, -0.4431901, 2.106644, 1, 1, 1, 1, 1,
0.3265147, -0.2994253, 0.4294789, 1, 1, 1, 1, 1,
0.3267801, 1.482528, -0.04952147, 1, 1, 1, 1, 1,
0.3268093, 0.9748811, 1.398827, 1, 1, 1, 1, 1,
0.3283499, -0.6229895, 4.238801, 1, 1, 1, 1, 1,
0.330965, -0.01914714, 2.142018, 1, 1, 1, 1, 1,
0.3329961, -1.298534, 2.434881, 1, 1, 1, 1, 1,
0.3387734, 0.003762842, 1.133449, 1, 1, 1, 1, 1,
0.3388448, 0.1809339, 1.694577, 1, 1, 1, 1, 1,
0.3418519, -0.09738252, 2.909822, 1, 1, 1, 1, 1,
0.3444996, -0.6332698, 3.188635, 1, 1, 1, 1, 1,
0.3475278, -0.6417508, 1.743962, 0, 0, 1, 1, 1,
0.3492294, -1.195951, 2.36485, 1, 0, 0, 1, 1,
0.349922, 0.006860568, 2.033107, 1, 0, 0, 1, 1,
0.3522005, 0.9636814, 0.939509, 1, 0, 0, 1, 1,
0.3531981, 0.2988073, 0.5428549, 1, 0, 0, 1, 1,
0.3534648, -1.432206, 3.255172, 1, 0, 0, 1, 1,
0.3534875, 0.9748284, 0.9193558, 0, 0, 0, 1, 1,
0.3543272, -1.706817, 4.178009, 0, 0, 0, 1, 1,
0.359938, -0.5071589, 1.882365, 0, 0, 0, 1, 1,
0.3600853, -2.419437, 1.805282, 0, 0, 0, 1, 1,
0.3604749, 1.462093, -0.7444813, 0, 0, 0, 1, 1,
0.3613209, -0.7695576, 2.679955, 0, 0, 0, 1, 1,
0.3643418, -0.3555012, 2.123972, 0, 0, 0, 1, 1,
0.3669178, -1.136565, 2.641843, 1, 1, 1, 1, 1,
0.3685936, -0.06204702, 2.076231, 1, 1, 1, 1, 1,
0.3721041, 0.8639092, -0.2867564, 1, 1, 1, 1, 1,
0.3724434, 0.1819945, 2.126853, 1, 1, 1, 1, 1,
0.3735832, -0.1761626, 1.558431, 1, 1, 1, 1, 1,
0.3736885, -1.205594, 4.577842, 1, 1, 1, 1, 1,
0.3750846, -0.5753943, 3.057272, 1, 1, 1, 1, 1,
0.3798508, 1.449738, 0.4085037, 1, 1, 1, 1, 1,
0.3810349, -0.3763608, 1.728402, 1, 1, 1, 1, 1,
0.38126, 0.1333399, -0.02433343, 1, 1, 1, 1, 1,
0.3825309, 0.07604447, 1.828441, 1, 1, 1, 1, 1,
0.3837799, -0.395682, 0.456883, 1, 1, 1, 1, 1,
0.3892476, 1.914779, 0.7224882, 1, 1, 1, 1, 1,
0.390132, 1.064647, -0.8818054, 1, 1, 1, 1, 1,
0.3942499, -1.253885, 3.860713, 1, 1, 1, 1, 1,
0.3973773, -0.8788614, 2.528807, 0, 0, 1, 1, 1,
0.3992048, 0.2015913, 1.560399, 1, 0, 0, 1, 1,
0.3997179, 0.8637784, 0.808162, 1, 0, 0, 1, 1,
0.4106234, 0.7729303, 1.467435, 1, 0, 0, 1, 1,
0.4112337, 0.7250612, -0.006903719, 1, 0, 0, 1, 1,
0.4156179, -0.452904, 3.546819, 1, 0, 0, 1, 1,
0.4201077, 1.361836, 0.9856275, 0, 0, 0, 1, 1,
0.4254349, -1.85475, 3.533655, 0, 0, 0, 1, 1,
0.4257796, -0.5768485, 0.6578693, 0, 0, 0, 1, 1,
0.4270439, 0.1847261, 1.076504, 0, 0, 0, 1, 1,
0.4278729, 0.04451625, 1.712369, 0, 0, 0, 1, 1,
0.4280333, 0.7550434, 0.6008747, 0, 0, 0, 1, 1,
0.4284716, 0.01927942, 2.953403, 0, 0, 0, 1, 1,
0.4314645, -0.4250612, 1.937425, 1, 1, 1, 1, 1,
0.4324735, -0.4259743, 2.267494, 1, 1, 1, 1, 1,
0.4336916, -0.4237807, 2.532813, 1, 1, 1, 1, 1,
0.437264, 0.3975092, -0.1515951, 1, 1, 1, 1, 1,
0.4377027, -0.8562334, 4.108374, 1, 1, 1, 1, 1,
0.4380591, 0.4660289, 1.301478, 1, 1, 1, 1, 1,
0.4398081, 0.2169932, -0.8946149, 1, 1, 1, 1, 1,
0.4416767, 1.206725, -0.06309205, 1, 1, 1, 1, 1,
0.4439494, -0.3575021, -0.1273714, 1, 1, 1, 1, 1,
0.4455491, 0.1335224, 2.345338, 1, 1, 1, 1, 1,
0.4473667, -0.5975714, 1.894332, 1, 1, 1, 1, 1,
0.4521158, 0.7547256, -0.4846784, 1, 1, 1, 1, 1,
0.4530309, -2.500506, 2.268898, 1, 1, 1, 1, 1,
0.4532605, 0.2413621, 0.870325, 1, 1, 1, 1, 1,
0.4588977, -0.1614927, 2.774369, 1, 1, 1, 1, 1,
0.4640179, 0.9635101, 0.1357257, 0, 0, 1, 1, 1,
0.4654113, 0.1778307, -0.1326607, 1, 0, 0, 1, 1,
0.4685593, -0.7341554, 4.999386, 1, 0, 0, 1, 1,
0.4688941, 0.01299476, 2.600016, 1, 0, 0, 1, 1,
0.4722636, -1.751807, 2.023556, 1, 0, 0, 1, 1,
0.4850169, -1.316727, 3.958625, 1, 0, 0, 1, 1,
0.4868695, -1.872119, 2.053178, 0, 0, 0, 1, 1,
0.4869503, 0.5067176, 0.8677943, 0, 0, 0, 1, 1,
0.4902282, -0.6091251, 2.894631, 0, 0, 0, 1, 1,
0.4918093, -2.064883, 3.884157, 0, 0, 0, 1, 1,
0.4919739, -0.5382941, 2.733445, 0, 0, 0, 1, 1,
0.4932874, -0.267463, 1.553199, 0, 0, 0, 1, 1,
0.4964747, 0.1101268, 1.19202, 0, 0, 0, 1, 1,
0.5028921, -1.195403, 1.114187, 1, 1, 1, 1, 1,
0.5050734, 0.3824399, 1.201413, 1, 1, 1, 1, 1,
0.5078003, 0.9968828, 1.717415, 1, 1, 1, 1, 1,
0.5078217, 7.826612e-05, 2.235276, 1, 1, 1, 1, 1,
0.5079736, -1.16993, 2.780325, 1, 1, 1, 1, 1,
0.5096192, 0.09861676, 2.576329, 1, 1, 1, 1, 1,
0.5190545, 2.690391, -0.4280576, 1, 1, 1, 1, 1,
0.5212183, -1.337484, 3.366322, 1, 1, 1, 1, 1,
0.5232939, 1.664533, 0.2613491, 1, 1, 1, 1, 1,
0.5281929, 0.3701681, 1.655468, 1, 1, 1, 1, 1,
0.5378544, 1.331908, -0.2897308, 1, 1, 1, 1, 1,
0.5421326, 0.3506807, -0.4136764, 1, 1, 1, 1, 1,
0.5446866, 2.188082, 0.5608896, 1, 1, 1, 1, 1,
0.5452529, -0.3174022, 0.3959863, 1, 1, 1, 1, 1,
0.5580297, 1.670393, 0.5505679, 1, 1, 1, 1, 1,
0.560527, 0.1235489, 1.409685, 0, 0, 1, 1, 1,
0.5637931, -0.3393649, 1.589225, 1, 0, 0, 1, 1,
0.5638438, -0.7564164, 1.483642, 1, 0, 0, 1, 1,
0.5675486, -0.8269461, 3.411032, 1, 0, 0, 1, 1,
0.5695318, 0.3906963, 1.110633, 1, 0, 0, 1, 1,
0.5697918, 0.6202103, 2.224019, 1, 0, 0, 1, 1,
0.5699717, -0.5511866, 1.709098, 0, 0, 0, 1, 1,
0.5702182, 0.3580138, 1.362154, 0, 0, 0, 1, 1,
0.5741996, -0.4658832, 2.299735, 0, 0, 0, 1, 1,
0.5765731, 0.359369, 1.402261, 0, 0, 0, 1, 1,
0.5766658, 0.5803196, 2.626692, 0, 0, 0, 1, 1,
0.578004, -0.08680115, 1.305473, 0, 0, 0, 1, 1,
0.5793073, 1.538096, 1.394966, 0, 0, 0, 1, 1,
0.5802021, 0.7562517, -0.1395709, 1, 1, 1, 1, 1,
0.5805578, 0.1797746, 1.380042, 1, 1, 1, 1, 1,
0.5842385, 0.2765331, 0.2653304, 1, 1, 1, 1, 1,
0.584341, 0.731846, 1.493455, 1, 1, 1, 1, 1,
0.5878053, 1.249963, 0.5582197, 1, 1, 1, 1, 1,
0.5896354, 2.050019, -1.136389, 1, 1, 1, 1, 1,
0.5909526, -0.50888, 2.288687, 1, 1, 1, 1, 1,
0.5936733, -1.227376, 0.08372545, 1, 1, 1, 1, 1,
0.5981256, 0.62729, 0.4592232, 1, 1, 1, 1, 1,
0.5984061, 0.4276955, 1.122857, 1, 1, 1, 1, 1,
0.5987396, 1.361717, 0.5464871, 1, 1, 1, 1, 1,
0.5999528, -0.86033, 1.259198, 1, 1, 1, 1, 1,
0.6028575, -1.137862, 0.4850656, 1, 1, 1, 1, 1,
0.6072816, -0.2147888, 2.763259, 1, 1, 1, 1, 1,
0.6081383, 0.09186077, 0.9715369, 1, 1, 1, 1, 1,
0.6114278, -0.2550571, 1.36005, 0, 0, 1, 1, 1,
0.6147937, 0.1794064, 0.8048406, 1, 0, 0, 1, 1,
0.6159064, 0.05950699, 2.050496, 1, 0, 0, 1, 1,
0.6163583, -0.7799506, 2.857176, 1, 0, 0, 1, 1,
0.6278295, -1.054408, 3.979146, 1, 0, 0, 1, 1,
0.6290562, 2.012166, 0.3967848, 1, 0, 0, 1, 1,
0.6307174, 0.5154496, 0.4249955, 0, 0, 0, 1, 1,
0.6352394, 1.613905, -1.600239, 0, 0, 0, 1, 1,
0.6390791, -0.7540234, 1.020131, 0, 0, 0, 1, 1,
0.6405226, 1.100409, 1.446964, 0, 0, 0, 1, 1,
0.655003, -1.122334, 4.381388, 0, 0, 0, 1, 1,
0.6570781, 1.29152, -0.2893182, 0, 0, 0, 1, 1,
0.6573122, 1.015755, 0.9579763, 0, 0, 0, 1, 1,
0.6630874, 0.8594197, -0.921594, 1, 1, 1, 1, 1,
0.6645852, -1.201907, 2.339236, 1, 1, 1, 1, 1,
0.6684347, 1.14716, 2.174252, 1, 1, 1, 1, 1,
0.6713548, 2.770006, -0.3449326, 1, 1, 1, 1, 1,
0.6718674, 0.5700982, 0.07976091, 1, 1, 1, 1, 1,
0.6741507, -0.3807021, 1.15936, 1, 1, 1, 1, 1,
0.6764786, 0.6897227, 1.005316, 1, 1, 1, 1, 1,
0.6846513, -0.01017496, 2.9213, 1, 1, 1, 1, 1,
0.6898739, -0.7360783, 1.930276, 1, 1, 1, 1, 1,
0.6907382, -0.2996048, 1.508906, 1, 1, 1, 1, 1,
0.6917871, 1.261883, 1.248295, 1, 1, 1, 1, 1,
0.6973849, 1.276772, 0.5554981, 1, 1, 1, 1, 1,
0.7037076, -0.2464612, 2.175564, 1, 1, 1, 1, 1,
0.709989, 1.27175, 1.057642, 1, 1, 1, 1, 1,
0.711219, -0.2699906, 1.769223, 1, 1, 1, 1, 1,
0.7125705, -1.76084, 3.046224, 0, 0, 1, 1, 1,
0.7208465, 0.5652828, -1.213919, 1, 0, 0, 1, 1,
0.7269413, 0.3242735, -0.2333103, 1, 0, 0, 1, 1,
0.7275079, 0.7833161, 0.8903016, 1, 0, 0, 1, 1,
0.728467, -0.2341635, 0.7984412, 1, 0, 0, 1, 1,
0.7292728, -0.6372478, 3.35869, 1, 0, 0, 1, 1,
0.7312101, 0.6353431, 1.27106, 0, 0, 0, 1, 1,
0.7330241, 0.2745792, 0.5864717, 0, 0, 0, 1, 1,
0.7352524, -0.05786066, 1.11314, 0, 0, 0, 1, 1,
0.7426996, -0.1544237, 0.903302, 0, 0, 0, 1, 1,
0.7469917, 1.230092, 0.04894515, 0, 0, 0, 1, 1,
0.748596, -0.3551043, 1.554016, 0, 0, 0, 1, 1,
0.748773, -0.8226923, 2.446742, 0, 0, 0, 1, 1,
0.7492277, 0.4830994, 0.821963, 1, 1, 1, 1, 1,
0.7503824, -0.3160733, 2.891025, 1, 1, 1, 1, 1,
0.7509791, -0.3892478, 2.735603, 1, 1, 1, 1, 1,
0.7597539, 0.3332716, 1.57397, 1, 1, 1, 1, 1,
0.7620322, 1.017524, -0.1173475, 1, 1, 1, 1, 1,
0.7623858, 0.0302178, 0.567712, 1, 1, 1, 1, 1,
0.7672732, 1.100865, -1.204762, 1, 1, 1, 1, 1,
0.7741777, 0.4709995, 2.113855, 1, 1, 1, 1, 1,
0.7750611, -2.533654, 2.409479, 1, 1, 1, 1, 1,
0.7755874, 0.9234883, 0.3176217, 1, 1, 1, 1, 1,
0.7774265, 0.5455054, 0.7868736, 1, 1, 1, 1, 1,
0.7791961, 0.2206738, 1.679493, 1, 1, 1, 1, 1,
0.7807224, 0.5511936, 0.3093738, 1, 1, 1, 1, 1,
0.7817092, -0.7621152, 2.70204, 1, 1, 1, 1, 1,
0.7829148, -1.24129, -0.1394528, 1, 1, 1, 1, 1,
0.7923653, -0.6374215, 2.136672, 0, 0, 1, 1, 1,
0.7933939, 0.1156536, -1.148544, 1, 0, 0, 1, 1,
0.7957115, 0.2769692, 1.919024, 1, 0, 0, 1, 1,
0.7980828, 0.3471372, 1.672408, 1, 0, 0, 1, 1,
0.7983145, 1.76611, -0.5488102, 1, 0, 0, 1, 1,
0.7999032, -0.9769408, 0.9368631, 1, 0, 0, 1, 1,
0.8071567, -0.4692963, 1.624252, 0, 0, 0, 1, 1,
0.8118989, 0.9408566, 2.010345, 0, 0, 0, 1, 1,
0.8124112, -0.3919372, 3.368045, 0, 0, 0, 1, 1,
0.8135931, 0.6732301, -0.02257857, 0, 0, 0, 1, 1,
0.817474, 0.08718602, 0.1389935, 0, 0, 0, 1, 1,
0.8255264, -0.9455084, 1.361704, 0, 0, 0, 1, 1,
0.8274468, -0.74673, 3.084817, 0, 0, 0, 1, 1,
0.830243, -0.5003154, 2.111251, 1, 1, 1, 1, 1,
0.8312342, -1.017189, -0.2049819, 1, 1, 1, 1, 1,
0.8347163, -0.4983204, 1.817333, 1, 1, 1, 1, 1,
0.8350835, 0.5664622, 0.6143019, 1, 1, 1, 1, 1,
0.8368309, 1.747841, -0.2233917, 1, 1, 1, 1, 1,
0.8405319, -1.236479, 2.122763, 1, 1, 1, 1, 1,
0.84123, -1.852198, 3.897134, 1, 1, 1, 1, 1,
0.842256, -0.2280229, 2.029087, 1, 1, 1, 1, 1,
0.844198, 0.2388928, 2.21134, 1, 1, 1, 1, 1,
0.8484437, 0.5064228, 1.151454, 1, 1, 1, 1, 1,
0.8510858, 0.3673548, 1.466845, 1, 1, 1, 1, 1,
0.8540832, -0.6430245, 0.8189884, 1, 1, 1, 1, 1,
0.8542317, -1.615509, 4.51237, 1, 1, 1, 1, 1,
0.8634958, 0.1623936, 3.467802, 1, 1, 1, 1, 1,
0.8653257, 0.9039235, -0.6351467, 1, 1, 1, 1, 1,
0.8679649, 1.203048, 1.043797, 0, 0, 1, 1, 1,
0.8711299, -0.8351325, -0.4080771, 1, 0, 0, 1, 1,
0.871364, -2.396985, 2.312407, 1, 0, 0, 1, 1,
0.871662, -0.627669, 2.210966, 1, 0, 0, 1, 1,
0.8770433, 0.08505455, -0.3472654, 1, 0, 0, 1, 1,
0.885862, 1.171531, -0.134809, 1, 0, 0, 1, 1,
0.8912796, -0.522972, 3.172495, 0, 0, 0, 1, 1,
0.8943543, -0.5527055, 2.585039, 0, 0, 0, 1, 1,
0.9053687, 0.6295754, -0.35494, 0, 0, 0, 1, 1,
0.906098, -1.581667, 2.01639, 0, 0, 0, 1, 1,
0.9061859, -0.147384, 2.665015, 0, 0, 0, 1, 1,
0.9098955, -0.9131734, 2.518274, 0, 0, 0, 1, 1,
0.9160347, 0.7972389, 0.6898746, 0, 0, 0, 1, 1,
0.9201341, 1.124798, 0.1940349, 1, 1, 1, 1, 1,
0.9287539, 0.4491358, 0.28868, 1, 1, 1, 1, 1,
0.9376098, -1.024227, 3.603771, 1, 1, 1, 1, 1,
0.9416618, -1.460054, 3.386429, 1, 1, 1, 1, 1,
0.9451797, 0.1435748, 3.792872, 1, 1, 1, 1, 1,
0.9452313, -0.9217766, 3.349686, 1, 1, 1, 1, 1,
0.9566814, -1.588224, 4.047598, 1, 1, 1, 1, 1,
0.9680539, -0.2194305, 0.4361934, 1, 1, 1, 1, 1,
0.9737902, -0.7143134, 3.4774, 1, 1, 1, 1, 1,
0.9741824, 0.1563173, 2.53159, 1, 1, 1, 1, 1,
0.9794868, -1.343172, 0.6604813, 1, 1, 1, 1, 1,
0.9901417, -0.3767248, 1.432123, 1, 1, 1, 1, 1,
0.9989505, 0.5178142, 0.525039, 1, 1, 1, 1, 1,
1.000116, 0.4185216, 2.381259, 1, 1, 1, 1, 1,
1.006081, 0.7835113, 0.4046474, 1, 1, 1, 1, 1,
1.01008, 0.6205764, 1.109926, 0, 0, 1, 1, 1,
1.010423, 0.5444456, 2.153352, 1, 0, 0, 1, 1,
1.023878, -0.7479573, 3.875873, 1, 0, 0, 1, 1,
1.024438, 1.300168, -0.222108, 1, 0, 0, 1, 1,
1.031394, 1.234552, 1.310679, 1, 0, 0, 1, 1,
1.038287, 0.6931402, 0.07064909, 1, 0, 0, 1, 1,
1.041711, 0.7888537, 0.3503425, 0, 0, 0, 1, 1,
1.047022, 0.1712155, -0.03264572, 0, 0, 0, 1, 1,
1.048412, 0.3436598, 0.1748354, 0, 0, 0, 1, 1,
1.051803, -1.788257, 2.766398, 0, 0, 0, 1, 1,
1.052104, 0.07785338, 1.310262, 0, 0, 0, 1, 1,
1.053753, 0.1087157, 2.340991, 0, 0, 0, 1, 1,
1.061411, 1.251657, 0.8013337, 0, 0, 0, 1, 1,
1.061413, -0.6109399, 1.554091, 1, 1, 1, 1, 1,
1.063693, 1.673216, 1.601818, 1, 1, 1, 1, 1,
1.064796, -1.080006, 1.419982, 1, 1, 1, 1, 1,
1.065058, 1.621295, 0.3755215, 1, 1, 1, 1, 1,
1.067421, 0.7126684, 2.243593, 1, 1, 1, 1, 1,
1.067789, -2.162003, 1.722887, 1, 1, 1, 1, 1,
1.075123, -0.1110526, 2.226864, 1, 1, 1, 1, 1,
1.089965, 0.8897483, 2.313517, 1, 1, 1, 1, 1,
1.097086, 1.25073, 1.02725, 1, 1, 1, 1, 1,
1.101222, 0.607085, 1.008064, 1, 1, 1, 1, 1,
1.103957, 1.038864, 1.771332, 1, 1, 1, 1, 1,
1.106935, 1.016678, -0.01254836, 1, 1, 1, 1, 1,
1.110146, 1.028643, 0.6892936, 1, 1, 1, 1, 1,
1.116176, -0.04753437, 1.649137, 1, 1, 1, 1, 1,
1.120925, 0.1120462, 1.363405, 1, 1, 1, 1, 1,
1.125883, 0.0432471, 1.855364, 0, 0, 1, 1, 1,
1.127834, -0.1376103, 0.9799466, 1, 0, 0, 1, 1,
1.145501, -0.5372825, 2.618118, 1, 0, 0, 1, 1,
1.145727, 1.859843, 0.9766634, 1, 0, 0, 1, 1,
1.147699, -0.3872193, 1.978257, 1, 0, 0, 1, 1,
1.148616, 0.3208519, 2.411477, 1, 0, 0, 1, 1,
1.149454, -0.7494822, 1.111928, 0, 0, 0, 1, 1,
1.150584, -0.3004765, 1.526487, 0, 0, 0, 1, 1,
1.156234, 0.01520209, 0.9780723, 0, 0, 0, 1, 1,
1.156808, -0.8646114, 1.727573, 0, 0, 0, 1, 1,
1.159539, 1.541218, 2.01373, 0, 0, 0, 1, 1,
1.161578, -0.5005457, 0.9325605, 0, 0, 0, 1, 1,
1.164864, -0.414181, 0.8509729, 0, 0, 0, 1, 1,
1.165459, 0.2280424, 1.749659, 1, 1, 1, 1, 1,
1.166509, 0.09279612, 0.8748685, 1, 1, 1, 1, 1,
1.167441, 0.9395309, 1.44537, 1, 1, 1, 1, 1,
1.170263, -1.850751, 2.96871, 1, 1, 1, 1, 1,
1.192299, -0.5370603, 2.789123, 1, 1, 1, 1, 1,
1.192919, 1.67295, 1.392144, 1, 1, 1, 1, 1,
1.195684, -0.09583719, 1.435002, 1, 1, 1, 1, 1,
1.196182, -0.7079543, 3.264464, 1, 1, 1, 1, 1,
1.210192, 0.9877129, 1.884962, 1, 1, 1, 1, 1,
1.21336, 0.2425124, 1.899106, 1, 1, 1, 1, 1,
1.21529, -1.285469, 2.549449, 1, 1, 1, 1, 1,
1.217115, 1.857481, -0.9004326, 1, 1, 1, 1, 1,
1.223001, -0.08287252, 3.432775, 1, 1, 1, 1, 1,
1.238129, 0.573254, 0.2322085, 1, 1, 1, 1, 1,
1.239591, -0.3529868, 2.165941, 1, 1, 1, 1, 1,
1.243372, -0.1448908, 1.441413, 0, 0, 1, 1, 1,
1.261534, -0.7426943, 1.831783, 1, 0, 0, 1, 1,
1.261984, -0.5381367, 3.518194, 1, 0, 0, 1, 1,
1.274677, 1.876037, 1.062999, 1, 0, 0, 1, 1,
1.287269, -0.3132289, 3.012111, 1, 0, 0, 1, 1,
1.291522, -0.02450497, 3.58552, 1, 0, 0, 1, 1,
1.292749, 0.9786276, 0.09852719, 0, 0, 0, 1, 1,
1.302827, 0.5305439, -0.5552969, 0, 0, 0, 1, 1,
1.327243, -0.4313966, 1.251627, 0, 0, 0, 1, 1,
1.333871, 0.7945479, -0.2376495, 0, 0, 0, 1, 1,
1.341435, -0.05264908, 0.6928334, 0, 0, 0, 1, 1,
1.343881, 0.9341214, 0.7059614, 0, 0, 0, 1, 1,
1.353838, 0.1263427, 1.869388, 0, 0, 0, 1, 1,
1.358617, 1.489822, 1.257224, 1, 1, 1, 1, 1,
1.372826, -1.692673, 3.624804, 1, 1, 1, 1, 1,
1.387319, -0.5472993, 1.323641, 1, 1, 1, 1, 1,
1.392857, -1.084187, 2.338728, 1, 1, 1, 1, 1,
1.393774, 0.4671243, 2.621499, 1, 1, 1, 1, 1,
1.394218, -0.3998675, 0.9195507, 1, 1, 1, 1, 1,
1.405993, 0.1698097, 1.841487, 1, 1, 1, 1, 1,
1.407888, 0.000117968, 1.621932, 1, 1, 1, 1, 1,
1.407928, -0.7312428, 1.003227, 1, 1, 1, 1, 1,
1.414804, 0.4777901, 0.006906539, 1, 1, 1, 1, 1,
1.425033, 0.07315177, 2.9272, 1, 1, 1, 1, 1,
1.427975, 0.8483667, 1.286089, 1, 1, 1, 1, 1,
1.431036, -1.688773, 1.38896, 1, 1, 1, 1, 1,
1.43919, -0.1843566, 1.386371, 1, 1, 1, 1, 1,
1.43975, 0.08084354, 1.104557, 1, 1, 1, 1, 1,
1.45371, 0.8439835, 0.288296, 0, 0, 1, 1, 1,
1.479675, 1.864004, -0.2051659, 1, 0, 0, 1, 1,
1.480141, -0.1015132, 0.762711, 1, 0, 0, 1, 1,
1.487427, 0.300099, 1.057477, 1, 0, 0, 1, 1,
1.493869, 2.019276, 3.132863, 1, 0, 0, 1, 1,
1.51088, -0.2385729, 2.957044, 1, 0, 0, 1, 1,
1.523149, 0.4976644, 2.788447, 0, 0, 0, 1, 1,
1.53327, -0.9394614, 2.651175, 0, 0, 0, 1, 1,
1.535692, 1.342323, 2.967528, 0, 0, 0, 1, 1,
1.535704, 0.4541428, -0.06559944, 0, 0, 0, 1, 1,
1.537819, -0.6803327, 4.336545, 0, 0, 0, 1, 1,
1.553601, -1.078029, 1.778421, 0, 0, 0, 1, 1,
1.553981, 0.01972805, 3.901945, 0, 0, 0, 1, 1,
1.554541, 0.0830035, 1.351145, 1, 1, 1, 1, 1,
1.565499, 1.867156, 0.6859254, 1, 1, 1, 1, 1,
1.566217, -0.2204995, 2.283496, 1, 1, 1, 1, 1,
1.56728, -0.4144004, 2.86618, 1, 1, 1, 1, 1,
1.567834, 0.4175281, 2.366565, 1, 1, 1, 1, 1,
1.570385, 0.3954307, 0.83048, 1, 1, 1, 1, 1,
1.57175, 0.8841699, 2.766375, 1, 1, 1, 1, 1,
1.5722, -0.8909368, 3.651551, 1, 1, 1, 1, 1,
1.572566, 0.4534841, 1.449578, 1, 1, 1, 1, 1,
1.572711, -1.129619, 1.901783, 1, 1, 1, 1, 1,
1.574308, 1.207732, -0.008645297, 1, 1, 1, 1, 1,
1.580472, -0.1475493, 0.8916878, 1, 1, 1, 1, 1,
1.589371, -1.131744, 1.537336, 1, 1, 1, 1, 1,
1.635505, -2.518122, 2.160014, 1, 1, 1, 1, 1,
1.648352, 0.6119278, -0.4872001, 1, 1, 1, 1, 1,
1.651269, 0.9081696, 2.800311, 0, 0, 1, 1, 1,
1.659725, -0.06184568, 3.503427, 1, 0, 0, 1, 1,
1.682841, 0.03270659, 1.837189, 1, 0, 0, 1, 1,
1.687259, -1.574211, 1.657991, 1, 0, 0, 1, 1,
1.690651, 0.01070245, 2.260947, 1, 0, 0, 1, 1,
1.691306, -0.2918053, 2.440355, 1, 0, 0, 1, 1,
1.695551, 0.9515549, 0.9082028, 0, 0, 0, 1, 1,
1.698007, -0.4128066, 2.134753, 0, 0, 0, 1, 1,
1.726429, 0.3670084, 0.9602621, 0, 0, 0, 1, 1,
1.727648, 0.8765991, 1.10959, 0, 0, 0, 1, 1,
1.751619, 0.4645078, 1.770691, 0, 0, 0, 1, 1,
1.770995, -1.101762, 2.585396, 0, 0, 0, 1, 1,
1.781596, -1.084535, 3.254676, 0, 0, 0, 1, 1,
1.795264, 1.762016, 1.027204, 1, 1, 1, 1, 1,
1.803969, 1.385012, 1.980178, 1, 1, 1, 1, 1,
1.811198, -0.1168171, 0.8059685, 1, 1, 1, 1, 1,
1.81868, -0.4776237, 1.295499, 1, 1, 1, 1, 1,
1.820467, 0.2620943, 3.401469, 1, 1, 1, 1, 1,
1.823429, -0.1822629, 2.581448, 1, 1, 1, 1, 1,
1.832285, 1.13951, 0.3663038, 1, 1, 1, 1, 1,
1.833046, -0.891727, 1.535893, 1, 1, 1, 1, 1,
1.862738, -0.5748346, 2.490527, 1, 1, 1, 1, 1,
1.873396, 0.110088, 1.020583, 1, 1, 1, 1, 1,
1.915293, -1.706945, 2.7502, 1, 1, 1, 1, 1,
1.933697, -1.067086, 3.295711, 1, 1, 1, 1, 1,
1.958509, 0.2507828, 1.075402, 1, 1, 1, 1, 1,
1.970521, 0.9234969, 1.650164, 1, 1, 1, 1, 1,
1.972033, 0.3145202, 1.287646, 1, 1, 1, 1, 1,
2.033194, -0.04526834, 2.338568, 0, 0, 1, 1, 1,
2.050283, -0.110325, 1.542514, 1, 0, 0, 1, 1,
2.087184, -1.442843, 1.210832, 1, 0, 0, 1, 1,
2.129439, -0.7721389, 3.344676, 1, 0, 0, 1, 1,
2.167903, -0.03068763, 0.7991068, 1, 0, 0, 1, 1,
2.170112, 0.2479674, 1.759394, 1, 0, 0, 1, 1,
2.203286, 0.638486, 2.215035, 0, 0, 0, 1, 1,
2.20663, 0.803098, 2.894884, 0, 0, 0, 1, 1,
2.271062, -0.7282722, 1.792042, 0, 0, 0, 1, 1,
2.338292, 1.533605, 2.159107, 0, 0, 0, 1, 1,
2.406725, 0.3576677, 1.936695, 0, 0, 0, 1, 1,
2.418524, -0.7193862, -0.3095299, 0, 0, 0, 1, 1,
2.449535, 0.1274073, 2.633897, 0, 0, 0, 1, 1,
2.533139, -0.1925337, 2.602262, 1, 1, 1, 1, 1,
2.568894, -0.1511819, 1.820497, 1, 1, 1, 1, 1,
2.598699, 1.809669, -0.01073659, 1, 1, 1, 1, 1,
2.667633, 0.193157, 1.863089, 1, 1, 1, 1, 1,
2.67502, 0.5352124, 1.133009, 1, 1, 1, 1, 1,
2.941743, -0.138379, 1.703077, 1, 1, 1, 1, 1,
3.670916, 1.370696, -0.609216, 1, 1, 1, 1, 1
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
var radius = 9.699819;
var distance = 34.07021;
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
mvMatrix.translate( -0.1494114, 0.2750676, -0.2210765 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.07021);
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
