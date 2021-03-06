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
-2.639354, 0.5111842, -2.075873, 1, 0, 0, 1,
-2.577113, -0.6267592, -3.022376, 1, 0.007843138, 0, 1,
-2.461808, 0.458117, -1.653873, 1, 0.01176471, 0, 1,
-2.431213, 0.06737182, -2.425778, 1, 0.01960784, 0, 1,
-2.403727, -1.439508, -2.208711, 1, 0.02352941, 0, 1,
-2.399009, 0.3026186, -2.190686, 1, 0.03137255, 0, 1,
-2.362674, 0.376087, -3.376627, 1, 0.03529412, 0, 1,
-2.338258, 0.9173119, -1.459924, 1, 0.04313726, 0, 1,
-2.33608, 1.081511, -2.23596, 1, 0.04705882, 0, 1,
-2.330695, -0.2410246, -0.8776471, 1, 0.05490196, 0, 1,
-2.325111, -0.01152645, -1.054542, 1, 0.05882353, 0, 1,
-2.182848, 1.124388, 0.180681, 1, 0.06666667, 0, 1,
-2.176202, -0.7865883, -2.23788, 1, 0.07058824, 0, 1,
-2.171729, 1.039881, -1.64087, 1, 0.07843138, 0, 1,
-2.159038, 1.100925, 0.1670719, 1, 0.08235294, 0, 1,
-2.143497, 0.113482, -3.415591, 1, 0.09019608, 0, 1,
-2.075135, -1.409459, -0.8121246, 1, 0.09411765, 0, 1,
-2.02243, -0.1493212, 0.08978158, 1, 0.1019608, 0, 1,
-2.016832, 0.3603439, -1.634076, 1, 0.1098039, 0, 1,
-2.004052, -0.02850939, -2.153708, 1, 0.1137255, 0, 1,
-1.999927, -1.081117, -1.773136, 1, 0.1215686, 0, 1,
-1.999681, 0.3891493, -2.811491, 1, 0.1254902, 0, 1,
-1.998641, -1.492728, -2.225156, 1, 0.1333333, 0, 1,
-1.975446, -0.3599842, -1.133906, 1, 0.1372549, 0, 1,
-1.946907, -0.3227879, -2.28217, 1, 0.145098, 0, 1,
-1.93767, -0.3937576, 1.502579, 1, 0.1490196, 0, 1,
-1.89723, 0.2975579, -1.692894, 1, 0.1568628, 0, 1,
-1.889922, 0.103533, -2.285788, 1, 0.1607843, 0, 1,
-1.885036, 0.6052995, -0.2853199, 1, 0.1686275, 0, 1,
-1.874182, 0.7775453, 0.09618501, 1, 0.172549, 0, 1,
-1.859311, -0.06126527, -4.542361, 1, 0.1803922, 0, 1,
-1.855837, 0.9248409, -0.2496818, 1, 0.1843137, 0, 1,
-1.804622, -0.2784896, -1.9079, 1, 0.1921569, 0, 1,
-1.803719, -1.334316, -1.94284, 1, 0.1960784, 0, 1,
-1.781068, 0.734457, 0.01462598, 1, 0.2039216, 0, 1,
-1.775417, -0.6507041, -2.179277, 1, 0.2117647, 0, 1,
-1.754743, -0.6011244, -3.58196, 1, 0.2156863, 0, 1,
-1.752258, -0.4571468, -0.1236675, 1, 0.2235294, 0, 1,
-1.742597, -0.6608996, -2.653571, 1, 0.227451, 0, 1,
-1.737886, 0.03221049, -2.541091, 1, 0.2352941, 0, 1,
-1.737107, -1.516642, -2.415005, 1, 0.2392157, 0, 1,
-1.733827, 0.115852, -1.339332, 1, 0.2470588, 0, 1,
-1.714158, 1.076027, -0.2711093, 1, 0.2509804, 0, 1,
-1.705385, 1.390679, -2.222246, 1, 0.2588235, 0, 1,
-1.671239, -1.006012, 0.1843305, 1, 0.2627451, 0, 1,
-1.662854, -2.494571, -0.7675448, 1, 0.2705882, 0, 1,
-1.660523, -0.5316439, -1.734192, 1, 0.2745098, 0, 1,
-1.631538, 0.9230955, -1.051262, 1, 0.282353, 0, 1,
-1.63038, 1.216942, -1.145397, 1, 0.2862745, 0, 1,
-1.618571, -1.323165, -2.359363, 1, 0.2941177, 0, 1,
-1.61838, 0.3658757, -2.833545, 1, 0.3019608, 0, 1,
-1.615055, -1.038249, -1.769208, 1, 0.3058824, 0, 1,
-1.603227, 0.2635654, -2.482293, 1, 0.3137255, 0, 1,
-1.588476, 2.646788, -2.349068, 1, 0.3176471, 0, 1,
-1.54994, -1.807518, -3.769632, 1, 0.3254902, 0, 1,
-1.537631, 0.4156756, -1.798286, 1, 0.3294118, 0, 1,
-1.534178, 0.3715367, -1.902158, 1, 0.3372549, 0, 1,
-1.531894, 2.33575, -1.204375, 1, 0.3411765, 0, 1,
-1.528789, 0.7555934, -2.422598, 1, 0.3490196, 0, 1,
-1.517706, -0.416816, -2.080085, 1, 0.3529412, 0, 1,
-1.510401, 0.5383438, -1.240725, 1, 0.3607843, 0, 1,
-1.491956, 1.048493, -1.422539, 1, 0.3647059, 0, 1,
-1.48474, -0.6677094, -1.241234, 1, 0.372549, 0, 1,
-1.469878, -0.8304608, -1.030891, 1, 0.3764706, 0, 1,
-1.463495, 1.834444, -1.430425, 1, 0.3843137, 0, 1,
-1.461163, -1.220689, -1.62938, 1, 0.3882353, 0, 1,
-1.455042, -0.7793975, -1.895691, 1, 0.3960784, 0, 1,
-1.449977, -0.3632038, -2.614963, 1, 0.4039216, 0, 1,
-1.449553, 2.019433, 0.01046735, 1, 0.4078431, 0, 1,
-1.440756, -0.3525758, -1.426104, 1, 0.4156863, 0, 1,
-1.439941, -0.7977549, -1.530864, 1, 0.4196078, 0, 1,
-1.436121, -1.333585, -4.49651, 1, 0.427451, 0, 1,
-1.431175, 0.612725, -0.9649168, 1, 0.4313726, 0, 1,
-1.428205, 0.530524, -0.1830971, 1, 0.4392157, 0, 1,
-1.425771, 1.244312, -0.1676246, 1, 0.4431373, 0, 1,
-1.423972, -1.122471, -2.315437, 1, 0.4509804, 0, 1,
-1.42145, 0.03237979, -0.4848828, 1, 0.454902, 0, 1,
-1.418767, 0.5684666, -0.8621462, 1, 0.4627451, 0, 1,
-1.411044, -0.5056712, -2.245218, 1, 0.4666667, 0, 1,
-1.409655, 1.408426, -3.089248, 1, 0.4745098, 0, 1,
-1.408488, 1.621948, -0.7262713, 1, 0.4784314, 0, 1,
-1.40741, 0.2564512, -0.5825046, 1, 0.4862745, 0, 1,
-1.399605, 1.206468, -1.885301, 1, 0.4901961, 0, 1,
-1.389693, -0.01644653, 0.0377202, 1, 0.4980392, 0, 1,
-1.386957, 0.3293469, -1.15261, 1, 0.5058824, 0, 1,
-1.383171, -1.281585, -2.082163, 1, 0.509804, 0, 1,
-1.382668, 0.2149304, -1.036926, 1, 0.5176471, 0, 1,
-1.379251, -1.084605, -1.353167, 1, 0.5215687, 0, 1,
-1.36962, 1.327811, -0.812861, 1, 0.5294118, 0, 1,
-1.368821, 0.4871955, -3.224422, 1, 0.5333334, 0, 1,
-1.362158, -0.5648752, -1.176333, 1, 0.5411765, 0, 1,
-1.360275, -0.7372331, -2.577085, 1, 0.5450981, 0, 1,
-1.356821, 0.1246406, -1.070519, 1, 0.5529412, 0, 1,
-1.348653, -0.8077642, -2.474548, 1, 0.5568628, 0, 1,
-1.336609, -1.138877, -0.9382055, 1, 0.5647059, 0, 1,
-1.331179, -0.2021784, -2.109199, 1, 0.5686275, 0, 1,
-1.325128, -1.040013, -3.426461, 1, 0.5764706, 0, 1,
-1.320159, 2.136359, -0.8197641, 1, 0.5803922, 0, 1,
-1.299066, 1.062563, 1.449752, 1, 0.5882353, 0, 1,
-1.278382, 0.7324757, -2.214899, 1, 0.5921569, 0, 1,
-1.27247, 1.055383, 0.008115713, 1, 0.6, 0, 1,
-1.272333, -0.5374714, -0.368898, 1, 0.6078432, 0, 1,
-1.269256, 0.3329637, -0.9402128, 1, 0.6117647, 0, 1,
-1.268951, 1.990778, -0.6279423, 1, 0.6196079, 0, 1,
-1.261429, 1.66914, -2.090474, 1, 0.6235294, 0, 1,
-1.261145, -0.1661407, -1.08223, 1, 0.6313726, 0, 1,
-1.24367, 1.146253, 0.3391284, 1, 0.6352941, 0, 1,
-1.237639, 0.1895328, -1.955297, 1, 0.6431373, 0, 1,
-1.234272, -0.5692406, -1.117078, 1, 0.6470588, 0, 1,
-1.231068, 0.6115735, -1.534948, 1, 0.654902, 0, 1,
-1.220661, 2.447522, -0.296841, 1, 0.6588235, 0, 1,
-1.217779, -0.5110579, -2.205007, 1, 0.6666667, 0, 1,
-1.214795, -0.8311287, -1.544255, 1, 0.6705883, 0, 1,
-1.206871, -1.099612, -2.835059, 1, 0.6784314, 0, 1,
-1.198937, 0.2452624, -2.404269, 1, 0.682353, 0, 1,
-1.192528, 0.3995975, -1.294229, 1, 0.6901961, 0, 1,
-1.189205, -1.088333, -0.9917073, 1, 0.6941177, 0, 1,
-1.183611, 0.777323, 0.09624384, 1, 0.7019608, 0, 1,
-1.177419, 0.9700404, -2.526851, 1, 0.7098039, 0, 1,
-1.176434, -0.7008413, -0.958051, 1, 0.7137255, 0, 1,
-1.175309, 1.425956, -2.169466, 1, 0.7215686, 0, 1,
-1.174191, -0.5739675, -1.86319, 1, 0.7254902, 0, 1,
-1.172567, -1.013346, -1.016704, 1, 0.7333333, 0, 1,
-1.168241, -0.2979583, -1.718749, 1, 0.7372549, 0, 1,
-1.164791, 0.726121, -0.5822162, 1, 0.7450981, 0, 1,
-1.16138, -1.271018, -3.836931, 1, 0.7490196, 0, 1,
-1.159835, -0.5609645, -1.199538, 1, 0.7568628, 0, 1,
-1.154258, -0.3669503, -3.300611, 1, 0.7607843, 0, 1,
-1.150113, -0.8390533, -3.207729, 1, 0.7686275, 0, 1,
-1.135108, -0.3322362, -1.694296, 1, 0.772549, 0, 1,
-1.126034, -0.2840073, -2.02596, 1, 0.7803922, 0, 1,
-1.108263, -0.5923079, -0.5823142, 1, 0.7843137, 0, 1,
-1.108183, -0.0202434, -2.222574, 1, 0.7921569, 0, 1,
-1.092172, -0.06568849, -0.8500402, 1, 0.7960784, 0, 1,
-1.088782, -0.767467, -1.652903, 1, 0.8039216, 0, 1,
-1.079304, -1.099703, -0.5993449, 1, 0.8117647, 0, 1,
-1.078566, 0.575795, -2.983332, 1, 0.8156863, 0, 1,
-1.069544, 0.2777382, -0.4098229, 1, 0.8235294, 0, 1,
-1.064855, -0.4523174, -3.034826, 1, 0.827451, 0, 1,
-1.05572, -0.1192631, -1.219489, 1, 0.8352941, 0, 1,
-1.055103, 0.4439857, -0.5599624, 1, 0.8392157, 0, 1,
-1.052079, -0.9117447, -2.046706, 1, 0.8470588, 0, 1,
-1.049904, -1.625929, -3.693452, 1, 0.8509804, 0, 1,
-1.047288, 0.9160289, -3.952362, 1, 0.8588235, 0, 1,
-1.044957, -2.18039, -3.696717, 1, 0.8627451, 0, 1,
-1.036528, 0.464872, -0.986804, 1, 0.8705882, 0, 1,
-1.034693, -1.248108, -2.671342, 1, 0.8745098, 0, 1,
-1.033716, -0.7262582, -2.025081, 1, 0.8823529, 0, 1,
-1.031822, 0.1532805, -1.554483, 1, 0.8862745, 0, 1,
-1.027963, -1.353528, -3.066905, 1, 0.8941177, 0, 1,
-1.024756, 0.7323604, -2.752281, 1, 0.8980392, 0, 1,
-1.02229, 0.9206893, -0.555582, 1, 0.9058824, 0, 1,
-1.022, -0.03148003, -1.438063, 1, 0.9137255, 0, 1,
-1.006254, -0.4840674, -0.6364837, 1, 0.9176471, 0, 1,
-1.003034, 0.3113624, -1.733781, 1, 0.9254902, 0, 1,
-0.9873244, 2.114515, -1.226872, 1, 0.9294118, 0, 1,
-0.9675152, 1.59075, 1.09486, 1, 0.9372549, 0, 1,
-0.9662775, -0.2759381, -2.099092, 1, 0.9411765, 0, 1,
-0.9631401, -0.2509313, -2.034719, 1, 0.9490196, 0, 1,
-0.962753, 0.4789984, 1.108958, 1, 0.9529412, 0, 1,
-0.9488775, 0.249183, -2.637501, 1, 0.9607843, 0, 1,
-0.9412119, -0.07213468, -0.1419105, 1, 0.9647059, 0, 1,
-0.9366964, 0.8644119, -0.6027299, 1, 0.972549, 0, 1,
-0.9362657, -0.4537165, -1.326114, 1, 0.9764706, 0, 1,
-0.9299335, 1.328652, -0.4957055, 1, 0.9843137, 0, 1,
-0.9273335, -2.854868, -0.9632906, 1, 0.9882353, 0, 1,
-0.9179443, -1.269188, -1.964804, 1, 0.9960784, 0, 1,
-0.9177894, 1.532038, -1.379044, 0.9960784, 1, 0, 1,
-0.9166386, -1.84972, -2.708473, 0.9921569, 1, 0, 1,
-0.9110355, 0.3826396, -2.972336, 0.9843137, 1, 0, 1,
-0.9100909, -0.5808743, -3.886868, 0.9803922, 1, 0, 1,
-0.9016511, 0.8078767, 0.5759527, 0.972549, 1, 0, 1,
-0.9005625, 1.635834, -0.9166328, 0.9686275, 1, 0, 1,
-0.8986208, 0.5096737, -3.040693, 0.9607843, 1, 0, 1,
-0.8961889, 0.4533438, -0.2791116, 0.9568627, 1, 0, 1,
-0.8948149, 1.520721, -1.219281, 0.9490196, 1, 0, 1,
-0.8905897, -0.9564114, -3.045591, 0.945098, 1, 0, 1,
-0.8881223, -0.3695616, -3.988889, 0.9372549, 1, 0, 1,
-0.8848183, 1.254322, -0.7295794, 0.9333333, 1, 0, 1,
-0.8827965, -1.73651, -1.281924, 0.9254902, 1, 0, 1,
-0.8811381, -0.2496553, -1.09028, 0.9215686, 1, 0, 1,
-0.8762762, -0.7910723, -3.438377, 0.9137255, 1, 0, 1,
-0.8744147, 0.9106362, -1.313589, 0.9098039, 1, 0, 1,
-0.8717806, 0.4144568, -0.9296242, 0.9019608, 1, 0, 1,
-0.8696457, -0.9852591, -3.440982, 0.8941177, 1, 0, 1,
-0.8633488, -0.2552873, -1.14089, 0.8901961, 1, 0, 1,
-0.8567247, -0.6401687, -2.69734, 0.8823529, 1, 0, 1,
-0.8494834, 0.1683273, -0.2162296, 0.8784314, 1, 0, 1,
-0.8412936, -0.1228364, -1.46077, 0.8705882, 1, 0, 1,
-0.8373742, -0.8216894, -2.564484, 0.8666667, 1, 0, 1,
-0.8366955, 0.167333, 0.4505186, 0.8588235, 1, 0, 1,
-0.8366249, -0.003243458, -2.133747, 0.854902, 1, 0, 1,
-0.8293473, -0.2184356, -1.295774, 0.8470588, 1, 0, 1,
-0.8288783, 1.123371, -2.453668, 0.8431373, 1, 0, 1,
-0.8277001, -0.2233807, 0.2406026, 0.8352941, 1, 0, 1,
-0.8260792, 1.445997, -0.5493262, 0.8313726, 1, 0, 1,
-0.8255032, 0.8242047, 1.581099, 0.8235294, 1, 0, 1,
-0.8099339, -0.5884981, -1.595813, 0.8196079, 1, 0, 1,
-0.8076618, 1.503184, 0.1601528, 0.8117647, 1, 0, 1,
-0.8060061, 0.3441823, -1.51115, 0.8078431, 1, 0, 1,
-0.8020962, -0.2705119, -2.190097, 0.8, 1, 0, 1,
-0.7974157, -0.6572115, -1.704447, 0.7921569, 1, 0, 1,
-0.7958573, 0.1154336, -0.7793382, 0.7882353, 1, 0, 1,
-0.7954125, -0.2928463, -1.393349, 0.7803922, 1, 0, 1,
-0.7952951, -1.860523, -2.427491, 0.7764706, 1, 0, 1,
-0.7920561, -0.5293346, -2.365464, 0.7686275, 1, 0, 1,
-0.7912911, 0.2855859, -2.436512, 0.7647059, 1, 0, 1,
-0.7912788, 1.193575, -1.267248, 0.7568628, 1, 0, 1,
-0.7895758, 0.7830519, -1.008118, 0.7529412, 1, 0, 1,
-0.786225, -2.609182, -2.413201, 0.7450981, 1, 0, 1,
-0.7837085, -1.344337, -2.404737, 0.7411765, 1, 0, 1,
-0.7774042, -1.180722, -1.862733, 0.7333333, 1, 0, 1,
-0.772511, 1.374268, -0.6920086, 0.7294118, 1, 0, 1,
-0.7705964, 1.354622, -0.8539611, 0.7215686, 1, 0, 1,
-0.7701619, 0.6591179, -0.9200729, 0.7176471, 1, 0, 1,
-0.7691793, 0.2829489, 0.2568749, 0.7098039, 1, 0, 1,
-0.7677235, -0.2351846, -2.037305, 0.7058824, 1, 0, 1,
-0.7661051, 0.5506128, -1.817745, 0.6980392, 1, 0, 1,
-0.7528533, 1.299416, -1.761815, 0.6901961, 1, 0, 1,
-0.7521526, 0.6986755, 0.600765, 0.6862745, 1, 0, 1,
-0.7517357, -0.8659519, -2.656979, 0.6784314, 1, 0, 1,
-0.7481664, -0.7496272, -1.968758, 0.6745098, 1, 0, 1,
-0.7448965, 0.4278995, -1.608303, 0.6666667, 1, 0, 1,
-0.7409135, 0.4077477, -1.102087, 0.6627451, 1, 0, 1,
-0.7382737, 1.257846, 0.9325718, 0.654902, 1, 0, 1,
-0.7341765, 0.1111007, -1.953385, 0.6509804, 1, 0, 1,
-0.7284145, -1.553765, -3.532055, 0.6431373, 1, 0, 1,
-0.7195575, -1.052696, -2.402564, 0.6392157, 1, 0, 1,
-0.7185274, -0.7311015, -1.89149, 0.6313726, 1, 0, 1,
-0.7144596, -1.187606, -2.09845, 0.627451, 1, 0, 1,
-0.7106366, -0.3025995, -2.37713, 0.6196079, 1, 0, 1,
-0.7086216, -1.506664, -1.835537, 0.6156863, 1, 0, 1,
-0.7061734, -0.2794158, -0.4192877, 0.6078432, 1, 0, 1,
-0.7038393, -0.3752038, -1.576447, 0.6039216, 1, 0, 1,
-0.7015835, 0.635531, -1.924653, 0.5960785, 1, 0, 1,
-0.7000208, -1.868382, -2.778013, 0.5882353, 1, 0, 1,
-0.6989174, 0.9722851, -2.725773, 0.5843138, 1, 0, 1,
-0.6907931, -0.3481671, -1.56766, 0.5764706, 1, 0, 1,
-0.6855963, 1.692419, -2.010189, 0.572549, 1, 0, 1,
-0.684211, 0.5533539, -2.611157, 0.5647059, 1, 0, 1,
-0.680087, 1.812701, -0.4300146, 0.5607843, 1, 0, 1,
-0.6776959, 0.6373806, -0.6112359, 0.5529412, 1, 0, 1,
-0.6776804, -0.4400872, -3.422038, 0.5490196, 1, 0, 1,
-0.6774886, 0.6475706, -2.361392, 0.5411765, 1, 0, 1,
-0.6743014, 0.6739305, 0.8083962, 0.5372549, 1, 0, 1,
-0.673386, 0.09106143, -2.704061, 0.5294118, 1, 0, 1,
-0.671142, -1.796237, -3.127646, 0.5254902, 1, 0, 1,
-0.6661765, -0.4385178, -3.07509, 0.5176471, 1, 0, 1,
-0.664485, -1.299392, -3.842085, 0.5137255, 1, 0, 1,
-0.6618803, 0.4564958, -1.421117, 0.5058824, 1, 0, 1,
-0.6601239, -0.544022, -3.03458, 0.5019608, 1, 0, 1,
-0.6589304, -0.1560346, -1.589648, 0.4941176, 1, 0, 1,
-0.657271, 0.2215637, -0.6641611, 0.4862745, 1, 0, 1,
-0.6547528, -0.5478375, -2.694883, 0.4823529, 1, 0, 1,
-0.6527944, 1.054166, -1.919101, 0.4745098, 1, 0, 1,
-0.649774, 1.338215, -0.2506216, 0.4705882, 1, 0, 1,
-0.6467481, 2.058236, -0.01360647, 0.4627451, 1, 0, 1,
-0.6364214, 0.5855191, 0.294846, 0.4588235, 1, 0, 1,
-0.6337942, 0.5932897, 1.118023, 0.4509804, 1, 0, 1,
-0.6336272, -0.9385037, -4.357152, 0.4470588, 1, 0, 1,
-0.6331896, -0.7504979, -2.480115, 0.4392157, 1, 0, 1,
-0.631144, 1.548091, -0.5884021, 0.4352941, 1, 0, 1,
-0.6284361, -1.787793, -2.78891, 0.427451, 1, 0, 1,
-0.6281478, -0.04764525, 0.244389, 0.4235294, 1, 0, 1,
-0.6218008, -0.2384501, -2.106952, 0.4156863, 1, 0, 1,
-0.6213158, 0.5143081, -0.1789856, 0.4117647, 1, 0, 1,
-0.6136599, -0.4988639, -2.031722, 0.4039216, 1, 0, 1,
-0.6133626, -0.135818, -1.849817, 0.3960784, 1, 0, 1,
-0.6104404, -0.574231, -2.669675, 0.3921569, 1, 0, 1,
-0.6023186, 0.2268893, -1.439731, 0.3843137, 1, 0, 1,
-0.6022233, 0.6017706, -1.343818, 0.3803922, 1, 0, 1,
-0.5951535, 1.219875, 0.1595483, 0.372549, 1, 0, 1,
-0.5950725, -0.1937677, -2.579925, 0.3686275, 1, 0, 1,
-0.590344, -0.7749828, -2.312559, 0.3607843, 1, 0, 1,
-0.589155, -1.623368, -1.521565, 0.3568628, 1, 0, 1,
-0.5846565, -0.704377, -2.810422, 0.3490196, 1, 0, 1,
-0.5794702, -0.4273895, -2.610135, 0.345098, 1, 0, 1,
-0.5787125, -0.9254249, -1.659024, 0.3372549, 1, 0, 1,
-0.5741058, -0.417836, -0.5867699, 0.3333333, 1, 0, 1,
-0.5713644, 0.3873527, -1.072553, 0.3254902, 1, 0, 1,
-0.5659109, 0.4218706, -2.784271, 0.3215686, 1, 0, 1,
-0.5651863, -0.2684231, -2.770774, 0.3137255, 1, 0, 1,
-0.5620158, -0.3868605, -3.386422, 0.3098039, 1, 0, 1,
-0.5618014, -0.03222077, -3.45242, 0.3019608, 1, 0, 1,
-0.5580246, -0.518353, -1.358637, 0.2941177, 1, 0, 1,
-0.5398927, -0.7729971, -3.613296, 0.2901961, 1, 0, 1,
-0.5378737, -0.9040007, -2.086897, 0.282353, 1, 0, 1,
-0.5376175, -1.064298, -2.152906, 0.2784314, 1, 0, 1,
-0.5373359, 0.4757429, -0.4832315, 0.2705882, 1, 0, 1,
-0.5298302, -2.132941, -3.332122, 0.2666667, 1, 0, 1,
-0.529301, 0.01044876, -3.523717, 0.2588235, 1, 0, 1,
-0.5281, 0.7656463, 1.06876, 0.254902, 1, 0, 1,
-0.5265748, -0.1989844, -1.387333, 0.2470588, 1, 0, 1,
-0.5261242, -2.016529, -2.646055, 0.2431373, 1, 0, 1,
-0.5228583, 0.1765265, -2.363316, 0.2352941, 1, 0, 1,
-0.5227783, -0.4763506, -2.877492, 0.2313726, 1, 0, 1,
-0.5157672, -0.4764897, -2.585431, 0.2235294, 1, 0, 1,
-0.514453, -1.556266, -2.565848, 0.2196078, 1, 0, 1,
-0.5142069, 0.07722667, -2.01638, 0.2117647, 1, 0, 1,
-0.5106628, -1.753018, -3.659317, 0.2078431, 1, 0, 1,
-0.5076185, 0.06915937, -3.348121, 0.2, 1, 0, 1,
-0.5037628, -0.2560415, -1.700626, 0.1921569, 1, 0, 1,
-0.503482, 0.9590849, -1.417988, 0.1882353, 1, 0, 1,
-0.5009041, -2.285895, -1.70242, 0.1803922, 1, 0, 1,
-0.4970997, -1.111434, -2.862954, 0.1764706, 1, 0, 1,
-0.493766, -0.7118139, -2.543602, 0.1686275, 1, 0, 1,
-0.4902885, -1.614875, -3.472503, 0.1647059, 1, 0, 1,
-0.489995, -0.8236504, -1.384241, 0.1568628, 1, 0, 1,
-0.4776894, 0.1718606, -0.1110591, 0.1529412, 1, 0, 1,
-0.4767623, -0.5334333, -4.201629, 0.145098, 1, 0, 1,
-0.4589357, 0.3961484, -1.178914, 0.1411765, 1, 0, 1,
-0.4578339, 0.8656993, -2.007436, 0.1333333, 1, 0, 1,
-0.4539617, 0.1813063, -2.054183, 0.1294118, 1, 0, 1,
-0.4486069, -1.362032, -4.091978, 0.1215686, 1, 0, 1,
-0.4477543, 0.457049, -0.3474796, 0.1176471, 1, 0, 1,
-0.4477131, 0.4915351, -0.2258873, 0.1098039, 1, 0, 1,
-0.4456125, 1.440492, 0.4876122, 0.1058824, 1, 0, 1,
-0.4404357, 0.3458782, -0.6575917, 0.09803922, 1, 0, 1,
-0.4396775, 0.4272414, 0.4647905, 0.09019608, 1, 0, 1,
-0.4355165, -0.09872862, -0.8921404, 0.08627451, 1, 0, 1,
-0.4345495, 0.8172619, -1.089402, 0.07843138, 1, 0, 1,
-0.4336805, -2.483736, -3.16698, 0.07450981, 1, 0, 1,
-0.430556, 1.297023, -2.178678, 0.06666667, 1, 0, 1,
-0.4240517, 2.481144, -0.8701434, 0.0627451, 1, 0, 1,
-0.4240459, 0.08234376, -2.828848, 0.05490196, 1, 0, 1,
-0.4238097, 2.187864, -2.44702, 0.05098039, 1, 0, 1,
-0.4234567, 0.04259063, -3.73544, 0.04313726, 1, 0, 1,
-0.4179626, 0.8677701, 0.1752984, 0.03921569, 1, 0, 1,
-0.4090632, 1.218278, 1.010412, 0.03137255, 1, 0, 1,
-0.4074838, -0.3796449, -4.709126, 0.02745098, 1, 0, 1,
-0.4004476, -0.4208579, -1.084596, 0.01960784, 1, 0, 1,
-0.3933137, 0.2821624, -0.8578797, 0.01568628, 1, 0, 1,
-0.3892198, 1.39067, 0.0625171, 0.007843138, 1, 0, 1,
-0.3891695, -1.320089, -1.260143, 0.003921569, 1, 0, 1,
-0.3866653, -0.5873883, -4.295074, 0, 1, 0.003921569, 1,
-0.3864987, -0.3620856, -1.464672, 0, 1, 0.01176471, 1,
-0.3841226, 0.4280964, -1.676904, 0, 1, 0.01568628, 1,
-0.381685, -1.319149, -2.911248, 0, 1, 0.02352941, 1,
-0.3806687, -0.5651637, -2.155708, 0, 1, 0.02745098, 1,
-0.3797345, 0.4813856, -1.467345, 0, 1, 0.03529412, 1,
-0.3755554, 1.441562, -0.8533531, 0, 1, 0.03921569, 1,
-0.3738992, 0.05776843, -0.3429409, 0, 1, 0.04705882, 1,
-0.3709479, 0.4638392, -0.6677244, 0, 1, 0.05098039, 1,
-0.368537, 0.9017201, -0.7580191, 0, 1, 0.05882353, 1,
-0.3668747, -1.424257, -3.383482, 0, 1, 0.0627451, 1,
-0.3661294, 0.05195686, 0.2450553, 0, 1, 0.07058824, 1,
-0.3634419, 0.08933304, 0.1371857, 0, 1, 0.07450981, 1,
-0.3531029, -1.065664, -2.19143, 0, 1, 0.08235294, 1,
-0.3527968, 1.340911, 0.5691555, 0, 1, 0.08627451, 1,
-0.3520006, 2.339946, -0.2631636, 0, 1, 0.09411765, 1,
-0.3465097, -0.6204821, -1.951243, 0, 1, 0.1019608, 1,
-0.3456675, 0.9813661, -0.9446952, 0, 1, 0.1058824, 1,
-0.3436764, 0.4347663, -0.5640939, 0, 1, 0.1137255, 1,
-0.3370538, -0.4813987, -3.834469, 0, 1, 0.1176471, 1,
-0.3349433, -0.6492974, -3.21381, 0, 1, 0.1254902, 1,
-0.3343523, 1.397047, -0.03215484, 0, 1, 0.1294118, 1,
-0.3326287, -1.896538, -3.826807, 0, 1, 0.1372549, 1,
-0.3314179, -0.4562045, -1.776597, 0, 1, 0.1411765, 1,
-0.3265774, -1.42814, -3.132179, 0, 1, 0.1490196, 1,
-0.3253855, -0.07216856, -0.5843874, 0, 1, 0.1529412, 1,
-0.3225021, 0.03022572, -1.689495, 0, 1, 0.1607843, 1,
-0.3222511, 1.732683, 1.061437, 0, 1, 0.1647059, 1,
-0.3211254, -0.2338461, -0.9475931, 0, 1, 0.172549, 1,
-0.3164905, 0.07743164, -1.0034, 0, 1, 0.1764706, 1,
-0.3141745, 0.8949141, -0.6417139, 0, 1, 0.1843137, 1,
-0.3110399, 0.8500612, 0.2899618, 0, 1, 0.1882353, 1,
-0.3103369, -0.5623517, -2.330859, 0, 1, 0.1960784, 1,
-0.3088733, -0.2391389, -2.036877, 0, 1, 0.2039216, 1,
-0.3025039, 0.4551241, -0.6036013, 0, 1, 0.2078431, 1,
-0.3004979, -0.4005509, -0.9704853, 0, 1, 0.2156863, 1,
-0.2996934, 1.779259, 0.277842, 0, 1, 0.2196078, 1,
-0.2911613, 1.214246, 0.6799171, 0, 1, 0.227451, 1,
-0.2902108, -0.9269804, -4.130046, 0, 1, 0.2313726, 1,
-0.2877262, 1.518715, 0.5215717, 0, 1, 0.2392157, 1,
-0.2850136, -0.0546044, -0.3749061, 0, 1, 0.2431373, 1,
-0.2783874, 0.00337632, -2.561337, 0, 1, 0.2509804, 1,
-0.2707945, 0.8768691, -1.859675, 0, 1, 0.254902, 1,
-0.2692349, 1.439548, -0.4307961, 0, 1, 0.2627451, 1,
-0.2641339, 1.913986, -0.4293891, 0, 1, 0.2666667, 1,
-0.2632807, 0.9656278, -2.251822, 0, 1, 0.2745098, 1,
-0.2579019, 0.3210643, -1.463236, 0, 1, 0.2784314, 1,
-0.2484783, 0.7742999, -3.038782, 0, 1, 0.2862745, 1,
-0.2433131, -0.04316821, -2.18983, 0, 1, 0.2901961, 1,
-0.2424563, 0.4922921, 0.619055, 0, 1, 0.2980392, 1,
-0.2416629, -1.838618, -3.798676, 0, 1, 0.3058824, 1,
-0.2396357, -0.3487621, -2.711731, 0, 1, 0.3098039, 1,
-0.2379278, 0.3039367, -1.427815, 0, 1, 0.3176471, 1,
-0.2351855, -1.981453, -4.001243, 0, 1, 0.3215686, 1,
-0.2349244, 0.0901121, -2.250758, 0, 1, 0.3294118, 1,
-0.2344255, -0.03791912, -1.714577, 0, 1, 0.3333333, 1,
-0.2339326, 1.494673, 0.3539422, 0, 1, 0.3411765, 1,
-0.2307762, 0.3900709, -0.01577772, 0, 1, 0.345098, 1,
-0.2306549, -1.24864, -4.358956, 0, 1, 0.3529412, 1,
-0.2303442, 0.7406595, 1.070854, 0, 1, 0.3568628, 1,
-0.2280197, 1.397277, 0.5052776, 0, 1, 0.3647059, 1,
-0.2273903, -0.8899163, -3.113382, 0, 1, 0.3686275, 1,
-0.2264078, -0.07941596, -0.7032607, 0, 1, 0.3764706, 1,
-0.2249882, -0.08529937, -0.3169999, 0, 1, 0.3803922, 1,
-0.2235417, 1.676909, -0.6315152, 0, 1, 0.3882353, 1,
-0.2232761, -2.260635, -1.956952, 0, 1, 0.3921569, 1,
-0.2201779, -0.4988017, -3.39997, 0, 1, 0.4, 1,
-0.2175616, 1.336002, 1.550851, 0, 1, 0.4078431, 1,
-0.2165365, 0.9043207, 0.06964845, 0, 1, 0.4117647, 1,
-0.2117026, -1.120077, -4.205709, 0, 1, 0.4196078, 1,
-0.2104998, -0.6826769, -4.622547, 0, 1, 0.4235294, 1,
-0.2000396, 0.5025142, 0.3584011, 0, 1, 0.4313726, 1,
-0.1969628, 2.05216, -0.5687967, 0, 1, 0.4352941, 1,
-0.1967849, 0.256517, -0.09311823, 0, 1, 0.4431373, 1,
-0.1926419, 1.226544, 0.9949423, 0, 1, 0.4470588, 1,
-0.1869773, 0.468365, -2.128916, 0, 1, 0.454902, 1,
-0.1864228, -1.04171, -3.931381, 0, 1, 0.4588235, 1,
-0.1795797, -0.9651322, -2.774324, 0, 1, 0.4666667, 1,
-0.1752292, 0.2984721, -0.6845915, 0, 1, 0.4705882, 1,
-0.1737496, 0.8230336, -1.551376, 0, 1, 0.4784314, 1,
-0.173296, 1.131759, 2.303066, 0, 1, 0.4823529, 1,
-0.1681493, -0.04780317, -3.360436, 0, 1, 0.4901961, 1,
-0.1678418, -0.3044225, -2.212226, 0, 1, 0.4941176, 1,
-0.1617024, 0.1446861, -1.562521, 0, 1, 0.5019608, 1,
-0.1573482, 0.2798693, -1.758083, 0, 1, 0.509804, 1,
-0.1513076, 0.78809, -0.5134792, 0, 1, 0.5137255, 1,
-0.1512701, 0.1285657, -1.558529, 0, 1, 0.5215687, 1,
-0.1505471, 1.298313, -1.226416, 0, 1, 0.5254902, 1,
-0.1500524, 0.08196015, -2.524451, 0, 1, 0.5333334, 1,
-0.1472262, 0.8770025, -0.9716901, 0, 1, 0.5372549, 1,
-0.1470899, -0.8881235, -4.211498, 0, 1, 0.5450981, 1,
-0.1457447, -1.239046, -4.601045, 0, 1, 0.5490196, 1,
-0.1442844, 1.01552, -0.3064268, 0, 1, 0.5568628, 1,
-0.1401617, 1.07221, -0.8347663, 0, 1, 0.5607843, 1,
-0.1382718, -1.097208, -2.759528, 0, 1, 0.5686275, 1,
-0.1381004, 0.8112862, -0.7510542, 0, 1, 0.572549, 1,
-0.1375848, 0.1557444, -1.083717, 0, 1, 0.5803922, 1,
-0.1320902, -0.6168606, -1.939973, 0, 1, 0.5843138, 1,
-0.1292494, -1.809486, -2.205177, 0, 1, 0.5921569, 1,
-0.1281851, -0.2019587, -4.146291, 0, 1, 0.5960785, 1,
-0.1264094, -0.9911596, -2.199372, 0, 1, 0.6039216, 1,
-0.119805, -1.525732, -1.96496, 0, 1, 0.6117647, 1,
-0.1193811, 1.247643, -1.061183, 0, 1, 0.6156863, 1,
-0.1183588, -2.117176, -3.747822, 0, 1, 0.6235294, 1,
-0.117749, -1.087771, -3.367216, 0, 1, 0.627451, 1,
-0.1175943, -0.8169445, -4.997239, 0, 1, 0.6352941, 1,
-0.116592, -0.4727902, -3.873285, 0, 1, 0.6392157, 1,
-0.1140704, 0.02913634, -1.769596, 0, 1, 0.6470588, 1,
-0.1095071, 0.2787902, -0.3975211, 0, 1, 0.6509804, 1,
-0.1025668, 1.071635, -1.452547, 0, 1, 0.6588235, 1,
-0.09747927, 0.6696591, -0.5898609, 0, 1, 0.6627451, 1,
-0.09500545, 0.569954, -0.2250903, 0, 1, 0.6705883, 1,
-0.09400287, -1.237078, -4.240102, 0, 1, 0.6745098, 1,
-0.09133331, -1.292456, -2.604934, 0, 1, 0.682353, 1,
-0.09048417, 0.6029005, 2.007087, 0, 1, 0.6862745, 1,
-0.08416849, 0.4659011, 0.2875466, 0, 1, 0.6941177, 1,
-0.08149908, 0.6621019, 1.105014, 0, 1, 0.7019608, 1,
-0.0775149, -1.212594, -2.177758, 0, 1, 0.7058824, 1,
-0.0756823, 0.1187221, 0.6884574, 0, 1, 0.7137255, 1,
-0.07504619, 1.929317, -1.191974, 0, 1, 0.7176471, 1,
-0.07475312, -0.166379, -2.407715, 0, 1, 0.7254902, 1,
-0.07320452, 1.713672, 0.05184162, 0, 1, 0.7294118, 1,
-0.07209446, -2.465646, -3.613207, 0, 1, 0.7372549, 1,
-0.07180886, -0.04863702, -1.930215, 0, 1, 0.7411765, 1,
-0.06662171, -0.5070153, -3.014042, 0, 1, 0.7490196, 1,
-0.06377959, 0.04369107, -0.2832931, 0, 1, 0.7529412, 1,
-0.06125488, 1.167298, 1.071238, 0, 1, 0.7607843, 1,
-0.06121126, 0.1805923, -1.879679, 0, 1, 0.7647059, 1,
-0.05767337, -0.2001766, -1.304807, 0, 1, 0.772549, 1,
-0.05685689, -0.2207674, -3.965171, 0, 1, 0.7764706, 1,
-0.05663513, -1.457039, -4.552394, 0, 1, 0.7843137, 1,
-0.05413866, -0.8303542, -3.547066, 0, 1, 0.7882353, 1,
-0.05219208, -1.039587, -2.12021, 0, 1, 0.7960784, 1,
-0.05201269, -0.4010648, -4.49893, 0, 1, 0.8039216, 1,
-0.05092982, -0.3955095, -1.121393, 0, 1, 0.8078431, 1,
-0.04409, -1.360686, -1.702212, 0, 1, 0.8156863, 1,
-0.04117582, -1.244881, -3.491976, 0, 1, 0.8196079, 1,
-0.04026563, -0.418164, -3.737616, 0, 1, 0.827451, 1,
-0.03576744, 0.4417959, 1.00556, 0, 1, 0.8313726, 1,
-0.03332691, -1.074859, -3.177652, 0, 1, 0.8392157, 1,
-0.03142274, -0.78948, -1.419815, 0, 1, 0.8431373, 1,
-0.03013891, 1.428042, 0.9923739, 0, 1, 0.8509804, 1,
-0.03011369, -0.541423, -1.797682, 0, 1, 0.854902, 1,
-0.02892261, 0.5200698, -0.2826176, 0, 1, 0.8627451, 1,
-0.02824316, -0.1978103, -1.917745, 0, 1, 0.8666667, 1,
-0.02812928, -0.7809865, -2.497898, 0, 1, 0.8745098, 1,
-0.02761811, -0.4100117, -3.253509, 0, 1, 0.8784314, 1,
-0.02723069, 0.7054133, 0.2337868, 0, 1, 0.8862745, 1,
-0.02003026, -0.295309, -3.298102, 0, 1, 0.8901961, 1,
-0.01760291, -0.4297493, -2.657238, 0, 1, 0.8980392, 1,
-0.01601776, 0.8074578, -0.499924, 0, 1, 0.9058824, 1,
-0.01565263, -0.4301538, -4.031984, 0, 1, 0.9098039, 1,
-0.008359002, 0.411609, -0.4799146, 0, 1, 0.9176471, 1,
-0.007318443, -1.698154, -2.019596, 0, 1, 0.9215686, 1,
-0.0008859648, -1.415872, -4.630194, 0, 1, 0.9294118, 1,
0.002733355, -0.2614205, 3.30445, 0, 1, 0.9333333, 1,
0.003459247, 0.7263065, 0.4653315, 0, 1, 0.9411765, 1,
0.007047583, 0.5833561, -2.263644, 0, 1, 0.945098, 1,
0.008767059, -0.5992051, 2.702179, 0, 1, 0.9529412, 1,
0.01333905, 0.0008454607, 0.8482176, 0, 1, 0.9568627, 1,
0.01461734, -0.633595, 2.823931, 0, 1, 0.9647059, 1,
0.01757737, -0.1585087, 3.630644, 0, 1, 0.9686275, 1,
0.02191438, 0.2612712, -0.2985168, 0, 1, 0.9764706, 1,
0.02271737, -0.2245404, 2.717768, 0, 1, 0.9803922, 1,
0.02425025, -0.454902, 2.252127, 0, 1, 0.9882353, 1,
0.02538493, -0.04517308, 2.394883, 0, 1, 0.9921569, 1,
0.02567516, 0.1201294, -2.322172, 0, 1, 1, 1,
0.02866103, -0.9827828, 4.795702, 0, 0.9921569, 1, 1,
0.03141896, -0.7910632, 1.879568, 0, 0.9882353, 1, 1,
0.03358406, -0.9644777, 3.383493, 0, 0.9803922, 1, 1,
0.03400797, 0.9195064, 1.42657, 0, 0.9764706, 1, 1,
0.03469701, 0.4991083, -0.7009826, 0, 0.9686275, 1, 1,
0.03588173, -1.353797, 0.9867132, 0, 0.9647059, 1, 1,
0.03611305, -1.400923, 0.5963505, 0, 0.9568627, 1, 1,
0.03738682, -0.7782941, 3.399564, 0, 0.9529412, 1, 1,
0.03825498, -1.025268, 1.812616, 0, 0.945098, 1, 1,
0.04258078, 0.9102109, 0.5356987, 0, 0.9411765, 1, 1,
0.04368945, 0.4321069, -0.4172797, 0, 0.9333333, 1, 1,
0.04544692, -0.4452808, 2.54847, 0, 0.9294118, 1, 1,
0.04685813, 0.416825, 0.4111941, 0, 0.9215686, 1, 1,
0.05100755, 0.5329675, 0.6873103, 0, 0.9176471, 1, 1,
0.05333666, -0.2575467, 3.366383, 0, 0.9098039, 1, 1,
0.06218839, 0.7704516, 0.7423224, 0, 0.9058824, 1, 1,
0.06443628, -1.608984, 2.357607, 0, 0.8980392, 1, 1,
0.06918965, -0.8507043, 3.442015, 0, 0.8901961, 1, 1,
0.07131372, -0.8561986, 3.087948, 0, 0.8862745, 1, 1,
0.07134693, -1.254884, 2.080169, 0, 0.8784314, 1, 1,
0.07249966, 1.202007, 1.391722, 0, 0.8745098, 1, 1,
0.07276247, -2.187816, 3.386618, 0, 0.8666667, 1, 1,
0.07364406, 0.6628546, 1.342963, 0, 0.8627451, 1, 1,
0.07405782, -0.2942008, 1.339604, 0, 0.854902, 1, 1,
0.07600768, 0.6811241, -0.4509543, 0, 0.8509804, 1, 1,
0.07813734, -0.3696249, 3.555739, 0, 0.8431373, 1, 1,
0.07851248, 0.6056269, 0.5207387, 0, 0.8392157, 1, 1,
0.08240822, 1.050726, 1.49022, 0, 0.8313726, 1, 1,
0.08514255, 2.265766, 1.825729, 0, 0.827451, 1, 1,
0.09292149, 1.79411, -0.4711248, 0, 0.8196079, 1, 1,
0.1002177, -1.799638, 3.544587, 0, 0.8156863, 1, 1,
0.1004448, -1.95868, 1.773491, 0, 0.8078431, 1, 1,
0.1048062, 0.4434765, -0.5038423, 0, 0.8039216, 1, 1,
0.104908, -1.890346, 3.657463, 0, 0.7960784, 1, 1,
0.106689, -1.348482, 2.401326, 0, 0.7882353, 1, 1,
0.1081417, 0.2941863, 0.02090587, 0, 0.7843137, 1, 1,
0.1091179, -1.45428, 2.160359, 0, 0.7764706, 1, 1,
0.1093682, 0.6597448, 0.6330462, 0, 0.772549, 1, 1,
0.1108183, 0.8253357, -0.5908092, 0, 0.7647059, 1, 1,
0.1112904, 1.293334, -2.002831, 0, 0.7607843, 1, 1,
0.1130038, 0.096659, 0.7917116, 0, 0.7529412, 1, 1,
0.1137388, -0.9859577, 3.709854, 0, 0.7490196, 1, 1,
0.1168032, -1.632672, 2.08082, 0, 0.7411765, 1, 1,
0.1192111, 0.3784958, 0.44328, 0, 0.7372549, 1, 1,
0.1211338, 0.1906629, 2.807178, 0, 0.7294118, 1, 1,
0.1229174, -1.456345, 3.14805, 0, 0.7254902, 1, 1,
0.12998, 0.601264, 2.73281, 0, 0.7176471, 1, 1,
0.1308367, 0.5527966, 0.1098987, 0, 0.7137255, 1, 1,
0.1349119, -0.2206391, 2.955218, 0, 0.7058824, 1, 1,
0.1364275, -2.324095, 3.425551, 0, 0.6980392, 1, 1,
0.1375899, -0.6183646, 4.976977, 0, 0.6941177, 1, 1,
0.1422761, -0.3571509, 2.521474, 0, 0.6862745, 1, 1,
0.144375, 0.04435263, 1.187339, 0, 0.682353, 1, 1,
0.1446866, -0.9875937, 2.648794, 0, 0.6745098, 1, 1,
0.1490142, -1.193481, 2.552019, 0, 0.6705883, 1, 1,
0.1510264, -0.08793532, 0.339576, 0, 0.6627451, 1, 1,
0.1518187, 1.30841, -0.1323096, 0, 0.6588235, 1, 1,
0.1545092, -0.9327564, 4.198105, 0, 0.6509804, 1, 1,
0.1569466, -0.07062465, 2.585775, 0, 0.6470588, 1, 1,
0.1613215, 0.7021942, 0.8524362, 0, 0.6392157, 1, 1,
0.1614356, 1.926288, 0.5905386, 0, 0.6352941, 1, 1,
0.1617265, -1.5661, 3.018087, 0, 0.627451, 1, 1,
0.1617808, -0.863107, 4.417667, 0, 0.6235294, 1, 1,
0.1619435, -0.356505, 2.565201, 0, 0.6156863, 1, 1,
0.1647532, -1.114025, 3.647872, 0, 0.6117647, 1, 1,
0.1669706, -2.413001, 2.516969, 0, 0.6039216, 1, 1,
0.1670973, -0.7540662, 2.316948, 0, 0.5960785, 1, 1,
0.1673064, -0.9474788, 3.653768, 0, 0.5921569, 1, 1,
0.1680884, 1.833637, 1.490142, 0, 0.5843138, 1, 1,
0.1704283, 0.1491752, 0.4166815, 0, 0.5803922, 1, 1,
0.1714189, -0.09220143, 1.986756, 0, 0.572549, 1, 1,
0.1731691, -0.6482858, 2.246059, 0, 0.5686275, 1, 1,
0.1754549, 0.775227, 1.465027, 0, 0.5607843, 1, 1,
0.1783485, -1.440225, 2.959377, 0, 0.5568628, 1, 1,
0.1802475, -0.2293799, 2.941758, 0, 0.5490196, 1, 1,
0.1828037, 0.4925398, 0.3765179, 0, 0.5450981, 1, 1,
0.1855939, -0.1376717, 1.207792, 0, 0.5372549, 1, 1,
0.193564, -0.8089514, 1.654655, 0, 0.5333334, 1, 1,
0.195234, -0.499946, 1.702308, 0, 0.5254902, 1, 1,
0.1967306, 0.6316562, -1.496287, 0, 0.5215687, 1, 1,
0.2003295, 0.254978, 0.3719381, 0, 0.5137255, 1, 1,
0.2007501, 1.810576, 1.787796, 0, 0.509804, 1, 1,
0.2029383, -0.5650916, 3.360194, 0, 0.5019608, 1, 1,
0.2159723, -1.246689, 1.278601, 0, 0.4941176, 1, 1,
0.2162895, 1.289211, -0.04771595, 0, 0.4901961, 1, 1,
0.2243765, -0.180891, 1.884966, 0, 0.4823529, 1, 1,
0.2252522, -1.920363, 1.76803, 0, 0.4784314, 1, 1,
0.2267282, -0.5771375, 3.088197, 0, 0.4705882, 1, 1,
0.2288902, -0.5589957, 3.313744, 0, 0.4666667, 1, 1,
0.230065, -0.09641713, 1.997323, 0, 0.4588235, 1, 1,
0.231175, -0.1430293, 2.635998, 0, 0.454902, 1, 1,
0.2323969, -0.717888, 1.282305, 0, 0.4470588, 1, 1,
0.2344485, -0.7753669, 2.909378, 0, 0.4431373, 1, 1,
0.235857, 0.8195151, 0.844974, 0, 0.4352941, 1, 1,
0.2419007, -1.07276, 3.131061, 0, 0.4313726, 1, 1,
0.2499014, 0.5595349, 1.487505, 0, 0.4235294, 1, 1,
0.2541544, -1.638219, 2.479695, 0, 0.4196078, 1, 1,
0.2547987, -0.5058632, 2.358364, 0, 0.4117647, 1, 1,
0.2577339, 0.5919477, 0.4913402, 0, 0.4078431, 1, 1,
0.2589398, -0.7745647, 3.238267, 0, 0.4, 1, 1,
0.2605415, -0.04518974, 2.991725, 0, 0.3921569, 1, 1,
0.2642586, -0.9945609, 2.807034, 0, 0.3882353, 1, 1,
0.26941, 0.8600476, 0.03025077, 0, 0.3803922, 1, 1,
0.2695898, 0.262501, 1.909738, 0, 0.3764706, 1, 1,
0.2702187, 0.8811908, 1.027286, 0, 0.3686275, 1, 1,
0.2705136, -0.4488143, 3.117584, 0, 0.3647059, 1, 1,
0.2714285, -0.2138844, 3.492325, 0, 0.3568628, 1, 1,
0.2739753, -0.5696049, 2.465521, 0, 0.3529412, 1, 1,
0.2765639, -1.663441, 4.261082, 0, 0.345098, 1, 1,
0.2768734, -0.1020832, 2.981514, 0, 0.3411765, 1, 1,
0.2831188, 2.023362, -0.5344093, 0, 0.3333333, 1, 1,
0.2847476, -0.5377564, 2.366479, 0, 0.3294118, 1, 1,
0.2942235, -0.3560581, 3.743876, 0, 0.3215686, 1, 1,
0.2963925, 0.3838849, 0.2734481, 0, 0.3176471, 1, 1,
0.300316, 0.253764, -0.194438, 0, 0.3098039, 1, 1,
0.3003989, 0.4626745, 1.764217, 0, 0.3058824, 1, 1,
0.3057889, 0.2012172, -0.05626693, 0, 0.2980392, 1, 1,
0.3083279, -0.887532, 2.576237, 0, 0.2901961, 1, 1,
0.308478, -0.8408015, 2.595778, 0, 0.2862745, 1, 1,
0.3160276, 1.080371, 0.3561092, 0, 0.2784314, 1, 1,
0.3260146, 0.2985883, 1.576192, 0, 0.2745098, 1, 1,
0.3276789, -0.3156623, 2.924813, 0, 0.2666667, 1, 1,
0.3357423, 0.6700051, 1.373263, 0, 0.2627451, 1, 1,
0.3391772, -0.4229424, 1.481182, 0, 0.254902, 1, 1,
0.3403604, 0.2604356, -0.3010418, 0, 0.2509804, 1, 1,
0.3407247, 0.3542577, 0.776902, 0, 0.2431373, 1, 1,
0.3414457, 0.6125723, 2.199134, 0, 0.2392157, 1, 1,
0.3441916, -0.180673, 4.760756, 0, 0.2313726, 1, 1,
0.3448503, 0.9754646, -1.419528, 0, 0.227451, 1, 1,
0.3521599, 0.7966707, 1.186387, 0, 0.2196078, 1, 1,
0.3541447, 0.006447991, 0.1173256, 0, 0.2156863, 1, 1,
0.3547741, -2.787727, 2.497461, 0, 0.2078431, 1, 1,
0.3562356, -0.8859333, 4.423589, 0, 0.2039216, 1, 1,
0.3566778, -0.3415982, 1.348099, 0, 0.1960784, 1, 1,
0.3569867, 0.5390836, 1.442645, 0, 0.1882353, 1, 1,
0.3577456, 1.586283, -0.2166667, 0, 0.1843137, 1, 1,
0.363255, 1.121108, 1.512345, 0, 0.1764706, 1, 1,
0.3707645, 0.6906272, 0.793542, 0, 0.172549, 1, 1,
0.3810642, 1.635011, 1.795677, 0, 0.1647059, 1, 1,
0.3833836, 0.8326367, 0.6069621, 0, 0.1607843, 1, 1,
0.3833984, 0.8908697, 0.6197516, 0, 0.1529412, 1, 1,
0.3912318, 0.4415714, 0.4288286, 0, 0.1490196, 1, 1,
0.3920259, 0.9575019, 0.4905262, 0, 0.1411765, 1, 1,
0.3949884, 0.03162408, 1.165559, 0, 0.1372549, 1, 1,
0.3962305, 0.8558899, -0.9093973, 0, 0.1294118, 1, 1,
0.3996097, 1.26961, 0.1155336, 0, 0.1254902, 1, 1,
0.4007172, -0.5100902, 3.020466, 0, 0.1176471, 1, 1,
0.4026536, 0.6210606, 1.358034, 0, 0.1137255, 1, 1,
0.4036673, -0.1041999, 2.015767, 0, 0.1058824, 1, 1,
0.40393, 0.285332, 1.884424, 0, 0.09803922, 1, 1,
0.4090884, -1.936938, 3.04896, 0, 0.09411765, 1, 1,
0.4098859, 1.460172, 0.7356159, 0, 0.08627451, 1, 1,
0.4122227, -1.188532, 1.25724, 0, 0.08235294, 1, 1,
0.4145132, -0.611224, 3.031868, 0, 0.07450981, 1, 1,
0.4163147, -1.17588, 2.792455, 0, 0.07058824, 1, 1,
0.420313, 0.7927827, -0.0355407, 0, 0.0627451, 1, 1,
0.4242237, -1.781908, 2.088991, 0, 0.05882353, 1, 1,
0.4292277, -1.804882, 2.962798, 0, 0.05098039, 1, 1,
0.430754, 1.733197, 0.4944835, 0, 0.04705882, 1, 1,
0.4315479, 1.627654, 0.3135406, 0, 0.03921569, 1, 1,
0.4328547, 0.7559546, -0.9355053, 0, 0.03529412, 1, 1,
0.4334552, 1.498436, 0.2991299, 0, 0.02745098, 1, 1,
0.4441194, -0.05467854, 0.1992397, 0, 0.02352941, 1, 1,
0.4452641, 0.314347, -1.273242, 0, 0.01568628, 1, 1,
0.4462413, 1.619488, 0.668591, 0, 0.01176471, 1, 1,
0.4530844, 0.3080765, 0.7643895, 0, 0.003921569, 1, 1,
0.4532498, 0.2058954, 1.468256, 0.003921569, 0, 1, 1,
0.4563073, -1.704905, 3.355414, 0.007843138, 0, 1, 1,
0.4576235, -1.769944, 0.7920696, 0.01568628, 0, 1, 1,
0.4578598, 1.056849, 2.175883, 0.01960784, 0, 1, 1,
0.4642155, 0.0668868, 1.739396, 0.02745098, 0, 1, 1,
0.4676076, 0.9294932, 0.946249, 0.03137255, 0, 1, 1,
0.4723779, -0.5676952, 4.362038, 0.03921569, 0, 1, 1,
0.4731635, -1.401862, 3.903746, 0.04313726, 0, 1, 1,
0.4745823, 0.2402579, 0.5300242, 0.05098039, 0, 1, 1,
0.476825, -1.889843, 2.849817, 0.05490196, 0, 1, 1,
0.4834827, -0.6109076, 2.591915, 0.0627451, 0, 1, 1,
0.491784, 0.4041546, 0.5575284, 0.06666667, 0, 1, 1,
0.4924349, 0.7871199, 0.3622897, 0.07450981, 0, 1, 1,
0.4942437, -1.36296, 1.449646, 0.07843138, 0, 1, 1,
0.4948413, 1.240562, 0.2535797, 0.08627451, 0, 1, 1,
0.4952646, 1.672874, -0.5163318, 0.09019608, 0, 1, 1,
0.4960198, 0.591068, -1.054482, 0.09803922, 0, 1, 1,
0.497633, -0.410441, 1.425688, 0.1058824, 0, 1, 1,
0.4994079, -0.5988873, 2.859475, 0.1098039, 0, 1, 1,
0.5023078, 1.295873, 0.927619, 0.1176471, 0, 1, 1,
0.5043455, 0.9120181, 0.4918983, 0.1215686, 0, 1, 1,
0.5046992, 0.09725893, -1.563287, 0.1294118, 0, 1, 1,
0.5054121, 1.316759, 0.2660636, 0.1333333, 0, 1, 1,
0.5067791, -0.1487198, 0.5657171, 0.1411765, 0, 1, 1,
0.5135239, -1.325362, 1.917299, 0.145098, 0, 1, 1,
0.5144532, -0.06502336, 3.266205, 0.1529412, 0, 1, 1,
0.5161064, -0.3525217, 1.598872, 0.1568628, 0, 1, 1,
0.5167252, -0.8867142, 2.78756, 0.1647059, 0, 1, 1,
0.5171822, -0.429639, 3.410348, 0.1686275, 0, 1, 1,
0.5173521, 0.5724227, 0.3798432, 0.1764706, 0, 1, 1,
0.5195619, 0.1673141, 1.165745, 0.1803922, 0, 1, 1,
0.519739, -0.3137831, 2.1403, 0.1882353, 0, 1, 1,
0.5212838, 1.222097, -1.060623, 0.1921569, 0, 1, 1,
0.5214589, -0.4015879, 1.469532, 0.2, 0, 1, 1,
0.5225903, -0.8849182, 3.125025, 0.2078431, 0, 1, 1,
0.5239936, -0.924557, 3.795922, 0.2117647, 0, 1, 1,
0.5251073, 0.4162971, 2.257394, 0.2196078, 0, 1, 1,
0.5253487, 0.1010007, 0.8463593, 0.2235294, 0, 1, 1,
0.53326, 0.0688557, 1.673844, 0.2313726, 0, 1, 1,
0.5339202, -0.6815166, 0.7665862, 0.2352941, 0, 1, 1,
0.5387644, -0.8646055, 1.208623, 0.2431373, 0, 1, 1,
0.5435522, -0.09945423, 0.8422357, 0.2470588, 0, 1, 1,
0.5452917, -0.2122374, 1.855464, 0.254902, 0, 1, 1,
0.5469351, -1.039634, 1.990827, 0.2588235, 0, 1, 1,
0.5541613, -0.4865428, 0.3968463, 0.2666667, 0, 1, 1,
0.5544474, -0.4008297, 0.5089417, 0.2705882, 0, 1, 1,
0.557003, 1.380119, 0.429472, 0.2784314, 0, 1, 1,
0.5570205, 0.1144156, 0.002006944, 0.282353, 0, 1, 1,
0.5621479, -0.160652, 1.096769, 0.2901961, 0, 1, 1,
0.5682004, -0.7110214, 3.556615, 0.2941177, 0, 1, 1,
0.5683517, 0.6103193, -0.120741, 0.3019608, 0, 1, 1,
0.568381, 0.4766212, 1.309671, 0.3098039, 0, 1, 1,
0.5741091, 0.6395953, -0.3320486, 0.3137255, 0, 1, 1,
0.5747876, -0.7375723, 1.419946, 0.3215686, 0, 1, 1,
0.5755374, 0.441203, 0.9303251, 0.3254902, 0, 1, 1,
0.5768239, -0.6313099, 2.477683, 0.3333333, 0, 1, 1,
0.58033, -0.3076251, 3.355367, 0.3372549, 0, 1, 1,
0.5812171, 0.2917118, 0.7985237, 0.345098, 0, 1, 1,
0.5833707, 1.6526, -0.2851186, 0.3490196, 0, 1, 1,
0.5857413, -0.8950236, 1.781938, 0.3568628, 0, 1, 1,
0.5863571, -0.9273399, 3.479398, 0.3607843, 0, 1, 1,
0.5903828, -0.0244621, 2.87885, 0.3686275, 0, 1, 1,
0.5941649, -0.375075, 1.204456, 0.372549, 0, 1, 1,
0.59699, 0.001520304, 0.2131292, 0.3803922, 0, 1, 1,
0.6048782, 1.043591, 1.430032, 0.3843137, 0, 1, 1,
0.6077591, 0.3701817, 1.667208, 0.3921569, 0, 1, 1,
0.6102684, -1.138892, 3.656135, 0.3960784, 0, 1, 1,
0.6132391, 0.8492037, 2.336554, 0.4039216, 0, 1, 1,
0.6183296, 2.28223, 2.076557, 0.4117647, 0, 1, 1,
0.6183506, -0.4015166, 2.404268, 0.4156863, 0, 1, 1,
0.6200211, 0.8209403, 0.2173073, 0.4235294, 0, 1, 1,
0.6208112, 0.8125979, 1.952653, 0.427451, 0, 1, 1,
0.6224458, -0.4324473, 2.707398, 0.4352941, 0, 1, 1,
0.6231901, -0.2014682, 3.511824, 0.4392157, 0, 1, 1,
0.6232517, -0.1216683, 0.9283218, 0.4470588, 0, 1, 1,
0.6235173, 1.201985, -0.7873933, 0.4509804, 0, 1, 1,
0.6246833, 0.8292243, 1.59899, 0.4588235, 0, 1, 1,
0.6269942, -0.2880517, 2.188732, 0.4627451, 0, 1, 1,
0.6283221, 0.4093632, 0.1431049, 0.4705882, 0, 1, 1,
0.635981, 0.1945041, -0.4433034, 0.4745098, 0, 1, 1,
0.637928, -0.3053339, 1.7493, 0.4823529, 0, 1, 1,
0.6380002, 0.08903103, 3.133714, 0.4862745, 0, 1, 1,
0.6402889, -0.8387004, 2.428533, 0.4941176, 0, 1, 1,
0.6403412, -0.6975734, 3.02114, 0.5019608, 0, 1, 1,
0.6449143, -0.4631508, 0.9648321, 0.5058824, 0, 1, 1,
0.6455054, 1.040328, 0.5405474, 0.5137255, 0, 1, 1,
0.6477556, -0.6146359, 3.535585, 0.5176471, 0, 1, 1,
0.6479869, -0.01213716, 2.511636, 0.5254902, 0, 1, 1,
0.6488802, -1.854506, 1.444106, 0.5294118, 0, 1, 1,
0.6513947, -1.218223, 1.696082, 0.5372549, 0, 1, 1,
0.6574113, -1.566671, 3.175319, 0.5411765, 0, 1, 1,
0.6606363, -0.7164159, 2.72561, 0.5490196, 0, 1, 1,
0.6628034, -0.04614307, 0.3163079, 0.5529412, 0, 1, 1,
0.6650388, -0.7423554, 2.578308, 0.5607843, 0, 1, 1,
0.6663339, 0.47853, 0.7545038, 0.5647059, 0, 1, 1,
0.6669642, 1.114635, 2.975472, 0.572549, 0, 1, 1,
0.6743225, -1.181723, 1.753977, 0.5764706, 0, 1, 1,
0.6762486, 1.544479, 0.2438339, 0.5843138, 0, 1, 1,
0.6767273, 0.4357659, 0.4141237, 0.5882353, 0, 1, 1,
0.6792277, 1.028143, -0.5922687, 0.5960785, 0, 1, 1,
0.6814828, -0.6083008, 2.679366, 0.6039216, 0, 1, 1,
0.6873208, -1.481514, 2.584825, 0.6078432, 0, 1, 1,
0.6892878, 0.3331414, 0.6428308, 0.6156863, 0, 1, 1,
0.6970766, -1.331221, 0.6889931, 0.6196079, 0, 1, 1,
0.7018755, -0.5438784, 1.751709, 0.627451, 0, 1, 1,
0.7113054, -0.709583, 2.891944, 0.6313726, 0, 1, 1,
0.71874, 0.8363416, 1.750085, 0.6392157, 0, 1, 1,
0.7191749, 0.510404, 1.231987, 0.6431373, 0, 1, 1,
0.7209121, -1.394112, 4.140925, 0.6509804, 0, 1, 1,
0.7270537, 1.322185, 1.514, 0.654902, 0, 1, 1,
0.7323362, 1.022945, 0.05561848, 0.6627451, 0, 1, 1,
0.7328364, -2.300592, 2.979322, 0.6666667, 0, 1, 1,
0.7340829, -1.097019, 4.050022, 0.6745098, 0, 1, 1,
0.7382371, -1.54924, 2.95838, 0.6784314, 0, 1, 1,
0.7398128, -0.5706289, 1.743131, 0.6862745, 0, 1, 1,
0.7444021, -0.1029803, 0.6123822, 0.6901961, 0, 1, 1,
0.748512, -0.02978155, 2.127571, 0.6980392, 0, 1, 1,
0.7529656, -0.4445474, 3.647038, 0.7058824, 0, 1, 1,
0.7571265, 0.9870232, 0.6681979, 0.7098039, 0, 1, 1,
0.7574838, -0.4505682, 1.565013, 0.7176471, 0, 1, 1,
0.7604313, 0.2035923, -0.5614913, 0.7215686, 0, 1, 1,
0.7629311, -1.24073, 2.209773, 0.7294118, 0, 1, 1,
0.7642058, -0.4008936, 4.537735, 0.7333333, 0, 1, 1,
0.7722324, 0.4686364, -0.3449635, 0.7411765, 0, 1, 1,
0.7729048, -0.1765265, 1.607744, 0.7450981, 0, 1, 1,
0.7772136, 0.3567239, 0.6083308, 0.7529412, 0, 1, 1,
0.7778432, 0.08778543, 2.217971, 0.7568628, 0, 1, 1,
0.7790622, 1.108104, 0.1358482, 0.7647059, 0, 1, 1,
0.7927974, -1.245264, 3.390783, 0.7686275, 0, 1, 1,
0.792832, 0.2263134, 0.8822183, 0.7764706, 0, 1, 1,
0.7971595, 1.103677, -0.9815432, 0.7803922, 0, 1, 1,
0.7980067, 0.6749463, 0.3705492, 0.7882353, 0, 1, 1,
0.8128204, -0.4095183, 2.820258, 0.7921569, 0, 1, 1,
0.812877, -0.236453, 2.304967, 0.8, 0, 1, 1,
0.8397961, 0.5513442, 0.4997637, 0.8078431, 0, 1, 1,
0.8415987, -0.03134783, 0.8578443, 0.8117647, 0, 1, 1,
0.845898, 0.5594586, 0.5486376, 0.8196079, 0, 1, 1,
0.8510748, 0.5101172, 0.4024252, 0.8235294, 0, 1, 1,
0.8566058, 0.881956, 1.980102, 0.8313726, 0, 1, 1,
0.8569622, -0.4603427, 3.074089, 0.8352941, 0, 1, 1,
0.8692676, -0.7517346, 2.392241, 0.8431373, 0, 1, 1,
0.8766052, -0.8672928, 2.173107, 0.8470588, 0, 1, 1,
0.8785118, 0.5843206, 4.046319, 0.854902, 0, 1, 1,
0.8841355, 0.3982851, -0.9396812, 0.8588235, 0, 1, 1,
0.886969, 0.2893652, 0.5788058, 0.8666667, 0, 1, 1,
0.8875182, 0.3253238, 1.571488, 0.8705882, 0, 1, 1,
0.8884185, -0.5075299, 0.586273, 0.8784314, 0, 1, 1,
0.88982, 1.165993, 1.554112, 0.8823529, 0, 1, 1,
0.8985336, 0.06774066, 1.972982, 0.8901961, 0, 1, 1,
0.906603, 1.666225, 0.2667672, 0.8941177, 0, 1, 1,
0.9105459, 2.707101, 0.4571223, 0.9019608, 0, 1, 1,
0.9142283, -0.9023387, 0.5013989, 0.9098039, 0, 1, 1,
0.9143361, 0.1845214, 1.550035, 0.9137255, 0, 1, 1,
0.9191734, -0.3226793, 1.342653, 0.9215686, 0, 1, 1,
0.9197894, -0.7142993, 2.494852, 0.9254902, 0, 1, 1,
0.9220328, -1.244921, 1.703333, 0.9333333, 0, 1, 1,
0.9223309, -0.7764329, -0.3785656, 0.9372549, 0, 1, 1,
0.9330743, -0.3539107, 2.831621, 0.945098, 0, 1, 1,
0.9333239, -1.598125, 3.208933, 0.9490196, 0, 1, 1,
0.9438148, 0.642828, 1.552058, 0.9568627, 0, 1, 1,
0.9452838, 0.2498793, 1.455877, 0.9607843, 0, 1, 1,
0.9490471, -0.6815233, 2.768011, 0.9686275, 0, 1, 1,
0.9525838, 0.7093399, 0.933201, 0.972549, 0, 1, 1,
0.9569148, -0.03292572, 1.493378, 0.9803922, 0, 1, 1,
0.9604819, -0.5341809, 2.083679, 0.9843137, 0, 1, 1,
0.9635262, 1.55919, -0.6369019, 0.9921569, 0, 1, 1,
0.9693242, 0.4802335, 0.2612879, 0.9960784, 0, 1, 1,
0.9840531, -1.512934, 3.267738, 1, 0, 0.9960784, 1,
0.9902707, 0.2216038, 1.893929, 1, 0, 0.9882353, 1,
0.9913564, -1.361334, 4.136934, 1, 0, 0.9843137, 1,
0.9964589, -1.158058, 2.761029, 1, 0, 0.9764706, 1,
0.9970782, -0.1210584, 0.9295821, 1, 0, 0.972549, 1,
1.001042, 0.9535676, -0.124629, 1, 0, 0.9647059, 1,
1.001364, 0.5074383, 0.1165619, 1, 0, 0.9607843, 1,
1.003751, -0.3387716, 0.749399, 1, 0, 0.9529412, 1,
1.005794, 0.1253937, 1.206904, 1, 0, 0.9490196, 1,
1.008411, 0.7787938, 0.4062973, 1, 0, 0.9411765, 1,
1.012865, 0.7434629, 0.7986888, 1, 0, 0.9372549, 1,
1.027455, 0.3261153, 0.4627596, 1, 0, 0.9294118, 1,
1.034817, -0.2627255, 3.544282, 1, 0, 0.9254902, 1,
1.036302, 0.2428906, 0.903421, 1, 0, 0.9176471, 1,
1.04025, 0.9333106, -0.07266381, 1, 0, 0.9137255, 1,
1.045124, -0.06753694, 1.315707, 1, 0, 0.9058824, 1,
1.048538, -0.9626203, 0.9010989, 1, 0, 0.9019608, 1,
1.058833, 1.790125, 2.184757, 1, 0, 0.8941177, 1,
1.059774, -1.012119, 1.397744, 1, 0, 0.8862745, 1,
1.067616, -0.6820863, 1.120806, 1, 0, 0.8823529, 1,
1.069429, -0.328986, 2.3837, 1, 0, 0.8745098, 1,
1.083246, 0.5901758, 1.079494, 1, 0, 0.8705882, 1,
1.092405, 0.03736701, 1.53629, 1, 0, 0.8627451, 1,
1.092736, 1.332022, 1.447912, 1, 0, 0.8588235, 1,
1.093142, -0.1997944, 1.302343, 1, 0, 0.8509804, 1,
1.093957, 1.152886, 1.796402, 1, 0, 0.8470588, 1,
1.102178, -0.7982172, 3.11311, 1, 0, 0.8392157, 1,
1.106743, 0.7732279, 0.2887566, 1, 0, 0.8352941, 1,
1.109481, -0.6702161, 1.974523, 1, 0, 0.827451, 1,
1.111473, -0.8406799, 3.528502, 1, 0, 0.8235294, 1,
1.113039, -1.837723, 2.49012, 1, 0, 0.8156863, 1,
1.11465, -1.094977, 1.558515, 1, 0, 0.8117647, 1,
1.114816, 0.2037099, 2.195965, 1, 0, 0.8039216, 1,
1.12326, 1.220469, 0.2913841, 1, 0, 0.7960784, 1,
1.126221, -1.776298, 3.392055, 1, 0, 0.7921569, 1,
1.12908, -0.752802, 0.845924, 1, 0, 0.7843137, 1,
1.130562, -0.3796104, 1.767719, 1, 0, 0.7803922, 1,
1.134791, -0.6564287, 3.069951, 1, 0, 0.772549, 1,
1.143162, 0.4018704, 3.675161, 1, 0, 0.7686275, 1,
1.15037, 0.1581764, 2.021444, 1, 0, 0.7607843, 1,
1.170516, -0.4779258, 2.648599, 1, 0, 0.7568628, 1,
1.17746, -1.41082, 2.468094, 1, 0, 0.7490196, 1,
1.178242, -0.1996514, 1.480386, 1, 0, 0.7450981, 1,
1.179322, 1.003817, 0.5091207, 1, 0, 0.7372549, 1,
1.180861, 0.3857904, 2.750639, 1, 0, 0.7333333, 1,
1.182289, 0.2571736, -0.9291238, 1, 0, 0.7254902, 1,
1.187003, -0.5326043, 2.338743, 1, 0, 0.7215686, 1,
1.198837, -1.277138, 2.781289, 1, 0, 0.7137255, 1,
1.202634, 1.319977, -2.056626, 1, 0, 0.7098039, 1,
1.203337, 0.2304778, -0.2206864, 1, 0, 0.7019608, 1,
1.218907, -0.9289302, 3.285991, 1, 0, 0.6941177, 1,
1.231689, -0.4418938, 3.801305, 1, 0, 0.6901961, 1,
1.233686, -0.1926126, 2.58981, 1, 0, 0.682353, 1,
1.238101, -0.5562267, 1.575661, 1, 0, 0.6784314, 1,
1.239835, -0.3857009, -0.2225392, 1, 0, 0.6705883, 1,
1.248794, -0.7668434, 2.057478, 1, 0, 0.6666667, 1,
1.249096, -2.003222, 2.909773, 1, 0, 0.6588235, 1,
1.253183, -1.214513, 2.294856, 1, 0, 0.654902, 1,
1.254121, 1.472171, -0.7092384, 1, 0, 0.6470588, 1,
1.263978, 0.1316223, 2.210768, 1, 0, 0.6431373, 1,
1.277492, 1.587814, -0.04060685, 1, 0, 0.6352941, 1,
1.284084, 0.8542876, 2.800815, 1, 0, 0.6313726, 1,
1.300367, -0.6010898, 1.079768, 1, 0, 0.6235294, 1,
1.30226, -0.1453922, 0.7723553, 1, 0, 0.6196079, 1,
1.303694, 0.595964, 1.498542, 1, 0, 0.6117647, 1,
1.30665, 1.203468, 1.076171, 1, 0, 0.6078432, 1,
1.309959, -0.3194649, 1.849833, 1, 0, 0.6, 1,
1.318458, -0.1705305, 2.641472, 1, 0, 0.5921569, 1,
1.321539, 0.11264, 1.326595, 1, 0, 0.5882353, 1,
1.338847, 1.058654, 1.754052, 1, 0, 0.5803922, 1,
1.343064, -0.40668, 2.642009, 1, 0, 0.5764706, 1,
1.34543, -0.5500376, 1.179388, 1, 0, 0.5686275, 1,
1.352547, -0.1752274, 2.051303, 1, 0, 0.5647059, 1,
1.353032, -0.3668277, 2.543189, 1, 0, 0.5568628, 1,
1.353159, 0.7769741, 1.081161, 1, 0, 0.5529412, 1,
1.358264, -1.274436, 0.8531781, 1, 0, 0.5450981, 1,
1.359424, -0.4181362, 2.68807, 1, 0, 0.5411765, 1,
1.360073, -0.8372439, 3.661434, 1, 0, 0.5333334, 1,
1.363875, 1.267275, 0.06097867, 1, 0, 0.5294118, 1,
1.364473, -1.296109, 1.884185, 1, 0, 0.5215687, 1,
1.382049, -1.710768, 1.717829, 1, 0, 0.5176471, 1,
1.398439, -0.04699458, 1.503528, 1, 0, 0.509804, 1,
1.402902, -0.08500685, 2.332661, 1, 0, 0.5058824, 1,
1.407171, -0.06448636, 1.926238, 1, 0, 0.4980392, 1,
1.40858, 0.6424308, 1.525534, 1, 0, 0.4901961, 1,
1.417077, -0.1834942, 1.059187, 1, 0, 0.4862745, 1,
1.425219, -0.3029304, 1.518249, 1, 0, 0.4784314, 1,
1.429973, 0.4502891, 2.726884, 1, 0, 0.4745098, 1,
1.431819, -0.8756218, 3.266578, 1, 0, 0.4666667, 1,
1.449022, 1.774974, 0.7622617, 1, 0, 0.4627451, 1,
1.449294, -1.815497, 2.69549, 1, 0, 0.454902, 1,
1.462389, 0.5427353, 2.666932, 1, 0, 0.4509804, 1,
1.465479, 1.423599, 1.331133, 1, 0, 0.4431373, 1,
1.47381, 0.4393764, 1.391523, 1, 0, 0.4392157, 1,
1.481463, -1.496696, 2.42605, 1, 0, 0.4313726, 1,
1.4936, 0.3182555, 0.2209988, 1, 0, 0.427451, 1,
1.501362, 0.8622836, 0.3896047, 1, 0, 0.4196078, 1,
1.504439, -1.693671, 1.955238, 1, 0, 0.4156863, 1,
1.505817, -1.770145, 2.018648, 1, 0, 0.4078431, 1,
1.508485, -1.175434, 3.28497, 1, 0, 0.4039216, 1,
1.516799, -1.523567, 1.937072, 1, 0, 0.3960784, 1,
1.519173, -0.3378021, 1.871779, 1, 0, 0.3882353, 1,
1.522665, 0.4799814, 0.4556849, 1, 0, 0.3843137, 1,
1.541564, -0.5606167, 0.7962667, 1, 0, 0.3764706, 1,
1.542898, -1.71394, 1.468816, 1, 0, 0.372549, 1,
1.548869, 1.008039, 0.6278357, 1, 0, 0.3647059, 1,
1.557404, 0.2122246, 0.4684517, 1, 0, 0.3607843, 1,
1.566793, -0.404315, 0.3741415, 1, 0, 0.3529412, 1,
1.574738, 0.3091366, 2.494175, 1, 0, 0.3490196, 1,
1.613846, 0.3616249, 0.1792504, 1, 0, 0.3411765, 1,
1.620229, 0.483867, 0.4615974, 1, 0, 0.3372549, 1,
1.621241, 1.003927, 2.400134, 1, 0, 0.3294118, 1,
1.633082, 0.7620703, 0.6508031, 1, 0, 0.3254902, 1,
1.654446, -0.829747, 2.32475, 1, 0, 0.3176471, 1,
1.666644, -0.7150951, 1.929443, 1, 0, 0.3137255, 1,
1.676329, 0.4937637, 0.2008856, 1, 0, 0.3058824, 1,
1.679973, 0.6804591, 2.063593, 1, 0, 0.2980392, 1,
1.69468, 0.8405282, 2.510736, 1, 0, 0.2941177, 1,
1.720934, 0.04095659, 1.277045, 1, 0, 0.2862745, 1,
1.742191, 0.1295894, 1.193326, 1, 0, 0.282353, 1,
1.748587, -0.6848635, 1.498353, 1, 0, 0.2745098, 1,
1.750525, -0.8896669, 2.063322, 1, 0, 0.2705882, 1,
1.765857, -0.3525171, 3.111914, 1, 0, 0.2627451, 1,
1.768221, -0.5339321, 3.210274, 1, 0, 0.2588235, 1,
1.769525, -1.073629, 2.621455, 1, 0, 0.2509804, 1,
1.797245, 1.177777, -0.3764, 1, 0, 0.2470588, 1,
1.804884, -0.1339727, 3.607185, 1, 0, 0.2392157, 1,
1.815419, 1.298124, 1.105853, 1, 0, 0.2352941, 1,
1.819553, -0.9957171, 1.785893, 1, 0, 0.227451, 1,
1.81977, 0.1131256, 0.8642853, 1, 0, 0.2235294, 1,
1.833033, 0.06816994, 1.535812, 1, 0, 0.2156863, 1,
1.834384, 1.033138, 1.294839, 1, 0, 0.2117647, 1,
1.845341, 0.3603328, 1.70347, 1, 0, 0.2039216, 1,
1.888793, 2.175562, -0.2118602, 1, 0, 0.1960784, 1,
1.904369, 0.0134299, 0.2470943, 1, 0, 0.1921569, 1,
1.913922, 0.1901686, 1.917967, 1, 0, 0.1843137, 1,
1.917558, 0.3067518, 1.266799, 1, 0, 0.1803922, 1,
1.943227, 0.6106328, -0.2559422, 1, 0, 0.172549, 1,
1.949494, -1.133393, 2.546278, 1, 0, 0.1686275, 1,
1.961696, -0.4252966, 1.944098, 1, 0, 0.1607843, 1,
1.973151, 0.5225011, 0.1227887, 1, 0, 0.1568628, 1,
1.977874, 0.3859143, 0.8313558, 1, 0, 0.1490196, 1,
1.989583, -0.6854253, 2.500809, 1, 0, 0.145098, 1,
2.00748, -1.970393, 2.035656, 1, 0, 0.1372549, 1,
2.018602, -0.3186026, 1.103977, 1, 0, 0.1333333, 1,
2.036849, -1.189459, 1.642957, 1, 0, 0.1254902, 1,
2.05064, 0.9142264, 1.443171, 1, 0, 0.1215686, 1,
2.063817, 0.4427746, 1.430728, 1, 0, 0.1137255, 1,
2.065274, -0.0431929, 1.578157, 1, 0, 0.1098039, 1,
2.066185, 0.9873893, -0.5904957, 1, 0, 0.1019608, 1,
2.071892, 1.576599, 1.019824, 1, 0, 0.09411765, 1,
2.089772, 0.5209354, 1.497962, 1, 0, 0.09019608, 1,
2.104044, -0.550319, 2.593185, 1, 0, 0.08235294, 1,
2.120696, 0.3064315, 0.7144393, 1, 0, 0.07843138, 1,
2.129432, -0.6779124, 2.04363, 1, 0, 0.07058824, 1,
2.1425, -0.5779552, -0.8632137, 1, 0, 0.06666667, 1,
2.213956, -0.3999307, 2.063934, 1, 0, 0.05882353, 1,
2.220627, 0.3501568, 1.505589, 1, 0, 0.05490196, 1,
2.253219, -0.04500401, 1.460269, 1, 0, 0.04705882, 1,
2.278472, 0.6866993, 1.460812, 1, 0, 0.04313726, 1,
2.311017, -1.120986, 0.126404, 1, 0, 0.03529412, 1,
2.383482, 1.000062, 1.233883, 1, 0, 0.03137255, 1,
2.440273, 0.3718314, 2.564683, 1, 0, 0.02352941, 1,
2.447419, -1.265357, 0.2432983, 1, 0, 0.01960784, 1,
2.630957, 1.076453, 0.6588695, 1, 0, 0.01176471, 1,
2.866926, -0.9524663, 2.277654, 1, 0, 0.007843138, 1
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
0.1137857, -3.797622, -6.687869, 0, -0.5, 0.5, 0.5,
0.1137857, -3.797622, -6.687869, 1, -0.5, 0.5, 0.5,
0.1137857, -3.797622, -6.687869, 1, 1.5, 0.5, 0.5,
0.1137857, -3.797622, -6.687869, 0, 1.5, 0.5, 0.5
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
-3.572669, -0.07388341, -6.687869, 0, -0.5, 0.5, 0.5,
-3.572669, -0.07388341, -6.687869, 1, -0.5, 0.5, 0.5,
-3.572669, -0.07388341, -6.687869, 1, 1.5, 0.5, 0.5,
-3.572669, -0.07388341, -6.687869, 0, 1.5, 0.5, 0.5
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
-3.572669, -3.797622, -0.01013088, 0, -0.5, 0.5, 0.5,
-3.572669, -3.797622, -0.01013088, 1, -0.5, 0.5, 0.5,
-3.572669, -3.797622, -0.01013088, 1, 1.5, 0.5, 0.5,
-3.572669, -3.797622, -0.01013088, 0, 1.5, 0.5, 0.5
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
-2, -2.938298, -5.146852,
2, -2.938298, -5.146852,
-2, -2.938298, -5.146852,
-2, -3.081518, -5.403688,
-1, -2.938298, -5.146852,
-1, -3.081518, -5.403688,
0, -2.938298, -5.146852,
0, -3.081518, -5.403688,
1, -2.938298, -5.146852,
1, -3.081518, -5.403688,
2, -2.938298, -5.146852,
2, -3.081518, -5.403688
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
-2, -3.36796, -5.917361, 0, -0.5, 0.5, 0.5,
-2, -3.36796, -5.917361, 1, -0.5, 0.5, 0.5,
-2, -3.36796, -5.917361, 1, 1.5, 0.5, 0.5,
-2, -3.36796, -5.917361, 0, 1.5, 0.5, 0.5,
-1, -3.36796, -5.917361, 0, -0.5, 0.5, 0.5,
-1, -3.36796, -5.917361, 1, -0.5, 0.5, 0.5,
-1, -3.36796, -5.917361, 1, 1.5, 0.5, 0.5,
-1, -3.36796, -5.917361, 0, 1.5, 0.5, 0.5,
0, -3.36796, -5.917361, 0, -0.5, 0.5, 0.5,
0, -3.36796, -5.917361, 1, -0.5, 0.5, 0.5,
0, -3.36796, -5.917361, 1, 1.5, 0.5, 0.5,
0, -3.36796, -5.917361, 0, 1.5, 0.5, 0.5,
1, -3.36796, -5.917361, 0, -0.5, 0.5, 0.5,
1, -3.36796, -5.917361, 1, -0.5, 0.5, 0.5,
1, -3.36796, -5.917361, 1, 1.5, 0.5, 0.5,
1, -3.36796, -5.917361, 0, 1.5, 0.5, 0.5,
2, -3.36796, -5.917361, 0, -0.5, 0.5, 0.5,
2, -3.36796, -5.917361, 1, -0.5, 0.5, 0.5,
2, -3.36796, -5.917361, 1, 1.5, 0.5, 0.5,
2, -3.36796, -5.917361, 0, 1.5, 0.5, 0.5
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
-2.721948, -2, -5.146852,
-2.721948, 2, -5.146852,
-2.721948, -2, -5.146852,
-2.863735, -2, -5.403688,
-2.721948, -1, -5.146852,
-2.863735, -1, -5.403688,
-2.721948, 0, -5.146852,
-2.863735, 0, -5.403688,
-2.721948, 1, -5.146852,
-2.863735, 1, -5.403688,
-2.721948, 2, -5.146852,
-2.863735, 2, -5.403688
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
-3.147309, -2, -5.917361, 0, -0.5, 0.5, 0.5,
-3.147309, -2, -5.917361, 1, -0.5, 0.5, 0.5,
-3.147309, -2, -5.917361, 1, 1.5, 0.5, 0.5,
-3.147309, -2, -5.917361, 0, 1.5, 0.5, 0.5,
-3.147309, -1, -5.917361, 0, -0.5, 0.5, 0.5,
-3.147309, -1, -5.917361, 1, -0.5, 0.5, 0.5,
-3.147309, -1, -5.917361, 1, 1.5, 0.5, 0.5,
-3.147309, -1, -5.917361, 0, 1.5, 0.5, 0.5,
-3.147309, 0, -5.917361, 0, -0.5, 0.5, 0.5,
-3.147309, 0, -5.917361, 1, -0.5, 0.5, 0.5,
-3.147309, 0, -5.917361, 1, 1.5, 0.5, 0.5,
-3.147309, 0, -5.917361, 0, 1.5, 0.5, 0.5,
-3.147309, 1, -5.917361, 0, -0.5, 0.5, 0.5,
-3.147309, 1, -5.917361, 1, -0.5, 0.5, 0.5,
-3.147309, 1, -5.917361, 1, 1.5, 0.5, 0.5,
-3.147309, 1, -5.917361, 0, 1.5, 0.5, 0.5,
-3.147309, 2, -5.917361, 0, -0.5, 0.5, 0.5,
-3.147309, 2, -5.917361, 1, -0.5, 0.5, 0.5,
-3.147309, 2, -5.917361, 1, 1.5, 0.5, 0.5,
-3.147309, 2, -5.917361, 0, 1.5, 0.5, 0.5
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
-2.721948, -2.938298, -4,
-2.721948, -2.938298, 4,
-2.721948, -2.938298, -4,
-2.863735, -3.081518, -4,
-2.721948, -2.938298, -2,
-2.863735, -3.081518, -2,
-2.721948, -2.938298, 0,
-2.863735, -3.081518, 0,
-2.721948, -2.938298, 2,
-2.863735, -3.081518, 2,
-2.721948, -2.938298, 4,
-2.863735, -3.081518, 4
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
-3.147309, -3.36796, -4, 0, -0.5, 0.5, 0.5,
-3.147309, -3.36796, -4, 1, -0.5, 0.5, 0.5,
-3.147309, -3.36796, -4, 1, 1.5, 0.5, 0.5,
-3.147309, -3.36796, -4, 0, 1.5, 0.5, 0.5,
-3.147309, -3.36796, -2, 0, -0.5, 0.5, 0.5,
-3.147309, -3.36796, -2, 1, -0.5, 0.5, 0.5,
-3.147309, -3.36796, -2, 1, 1.5, 0.5, 0.5,
-3.147309, -3.36796, -2, 0, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 0, 0, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 0, 1, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 0, 1, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 0, 0, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 2, 0, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 2, 1, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 2, 1, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 2, 0, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 4, 0, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 4, 1, -0.5, 0.5, 0.5,
-3.147309, -3.36796, 4, 1, 1.5, 0.5, 0.5,
-3.147309, -3.36796, 4, 0, 1.5, 0.5, 0.5
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
-2.721948, -2.938298, -5.146852,
-2.721948, 2.790531, -5.146852,
-2.721948, -2.938298, 5.126591,
-2.721948, 2.790531, 5.126591,
-2.721948, -2.938298, -5.146852,
-2.721948, -2.938298, 5.126591,
-2.721948, 2.790531, -5.146852,
-2.721948, 2.790531, 5.126591,
-2.721948, -2.938298, -5.146852,
2.94952, -2.938298, -5.146852,
-2.721948, -2.938298, 5.126591,
2.94952, -2.938298, 5.126591,
-2.721948, 2.790531, -5.146852,
2.94952, 2.790531, -5.146852,
-2.721948, 2.790531, 5.126591,
2.94952, 2.790531, 5.126591,
2.94952, -2.938298, -5.146852,
2.94952, 2.790531, -5.146852,
2.94952, -2.938298, 5.126591,
2.94952, 2.790531, 5.126591,
2.94952, -2.938298, -5.146852,
2.94952, -2.938298, 5.126591,
2.94952, 2.790531, -5.146852,
2.94952, 2.790531, 5.126591
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
var radius = 6.973072;
var distance = 31.02398;
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
mvMatrix.translate( -0.1137857, 0.07388341, 0.01013088 );
mvMatrix.scale( 1.32936, 1.31605, 0.7338749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.02398);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
isoxazolidine<-read.table("isoxazolidine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
y<-isoxazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
```

```r
z<-isoxazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxazolidine' not found
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
-2.639354, 0.5111842, -2.075873, 0, 0, 1, 1, 1,
-2.577113, -0.6267592, -3.022376, 1, 0, 0, 1, 1,
-2.461808, 0.458117, -1.653873, 1, 0, 0, 1, 1,
-2.431213, 0.06737182, -2.425778, 1, 0, 0, 1, 1,
-2.403727, -1.439508, -2.208711, 1, 0, 0, 1, 1,
-2.399009, 0.3026186, -2.190686, 1, 0, 0, 1, 1,
-2.362674, 0.376087, -3.376627, 0, 0, 0, 1, 1,
-2.338258, 0.9173119, -1.459924, 0, 0, 0, 1, 1,
-2.33608, 1.081511, -2.23596, 0, 0, 0, 1, 1,
-2.330695, -0.2410246, -0.8776471, 0, 0, 0, 1, 1,
-2.325111, -0.01152645, -1.054542, 0, 0, 0, 1, 1,
-2.182848, 1.124388, 0.180681, 0, 0, 0, 1, 1,
-2.176202, -0.7865883, -2.23788, 0, 0, 0, 1, 1,
-2.171729, 1.039881, -1.64087, 1, 1, 1, 1, 1,
-2.159038, 1.100925, 0.1670719, 1, 1, 1, 1, 1,
-2.143497, 0.113482, -3.415591, 1, 1, 1, 1, 1,
-2.075135, -1.409459, -0.8121246, 1, 1, 1, 1, 1,
-2.02243, -0.1493212, 0.08978158, 1, 1, 1, 1, 1,
-2.016832, 0.3603439, -1.634076, 1, 1, 1, 1, 1,
-2.004052, -0.02850939, -2.153708, 1, 1, 1, 1, 1,
-1.999927, -1.081117, -1.773136, 1, 1, 1, 1, 1,
-1.999681, 0.3891493, -2.811491, 1, 1, 1, 1, 1,
-1.998641, -1.492728, -2.225156, 1, 1, 1, 1, 1,
-1.975446, -0.3599842, -1.133906, 1, 1, 1, 1, 1,
-1.946907, -0.3227879, -2.28217, 1, 1, 1, 1, 1,
-1.93767, -0.3937576, 1.502579, 1, 1, 1, 1, 1,
-1.89723, 0.2975579, -1.692894, 1, 1, 1, 1, 1,
-1.889922, 0.103533, -2.285788, 1, 1, 1, 1, 1,
-1.885036, 0.6052995, -0.2853199, 0, 0, 1, 1, 1,
-1.874182, 0.7775453, 0.09618501, 1, 0, 0, 1, 1,
-1.859311, -0.06126527, -4.542361, 1, 0, 0, 1, 1,
-1.855837, 0.9248409, -0.2496818, 1, 0, 0, 1, 1,
-1.804622, -0.2784896, -1.9079, 1, 0, 0, 1, 1,
-1.803719, -1.334316, -1.94284, 1, 0, 0, 1, 1,
-1.781068, 0.734457, 0.01462598, 0, 0, 0, 1, 1,
-1.775417, -0.6507041, -2.179277, 0, 0, 0, 1, 1,
-1.754743, -0.6011244, -3.58196, 0, 0, 0, 1, 1,
-1.752258, -0.4571468, -0.1236675, 0, 0, 0, 1, 1,
-1.742597, -0.6608996, -2.653571, 0, 0, 0, 1, 1,
-1.737886, 0.03221049, -2.541091, 0, 0, 0, 1, 1,
-1.737107, -1.516642, -2.415005, 0, 0, 0, 1, 1,
-1.733827, 0.115852, -1.339332, 1, 1, 1, 1, 1,
-1.714158, 1.076027, -0.2711093, 1, 1, 1, 1, 1,
-1.705385, 1.390679, -2.222246, 1, 1, 1, 1, 1,
-1.671239, -1.006012, 0.1843305, 1, 1, 1, 1, 1,
-1.662854, -2.494571, -0.7675448, 1, 1, 1, 1, 1,
-1.660523, -0.5316439, -1.734192, 1, 1, 1, 1, 1,
-1.631538, 0.9230955, -1.051262, 1, 1, 1, 1, 1,
-1.63038, 1.216942, -1.145397, 1, 1, 1, 1, 1,
-1.618571, -1.323165, -2.359363, 1, 1, 1, 1, 1,
-1.61838, 0.3658757, -2.833545, 1, 1, 1, 1, 1,
-1.615055, -1.038249, -1.769208, 1, 1, 1, 1, 1,
-1.603227, 0.2635654, -2.482293, 1, 1, 1, 1, 1,
-1.588476, 2.646788, -2.349068, 1, 1, 1, 1, 1,
-1.54994, -1.807518, -3.769632, 1, 1, 1, 1, 1,
-1.537631, 0.4156756, -1.798286, 1, 1, 1, 1, 1,
-1.534178, 0.3715367, -1.902158, 0, 0, 1, 1, 1,
-1.531894, 2.33575, -1.204375, 1, 0, 0, 1, 1,
-1.528789, 0.7555934, -2.422598, 1, 0, 0, 1, 1,
-1.517706, -0.416816, -2.080085, 1, 0, 0, 1, 1,
-1.510401, 0.5383438, -1.240725, 1, 0, 0, 1, 1,
-1.491956, 1.048493, -1.422539, 1, 0, 0, 1, 1,
-1.48474, -0.6677094, -1.241234, 0, 0, 0, 1, 1,
-1.469878, -0.8304608, -1.030891, 0, 0, 0, 1, 1,
-1.463495, 1.834444, -1.430425, 0, 0, 0, 1, 1,
-1.461163, -1.220689, -1.62938, 0, 0, 0, 1, 1,
-1.455042, -0.7793975, -1.895691, 0, 0, 0, 1, 1,
-1.449977, -0.3632038, -2.614963, 0, 0, 0, 1, 1,
-1.449553, 2.019433, 0.01046735, 0, 0, 0, 1, 1,
-1.440756, -0.3525758, -1.426104, 1, 1, 1, 1, 1,
-1.439941, -0.7977549, -1.530864, 1, 1, 1, 1, 1,
-1.436121, -1.333585, -4.49651, 1, 1, 1, 1, 1,
-1.431175, 0.612725, -0.9649168, 1, 1, 1, 1, 1,
-1.428205, 0.530524, -0.1830971, 1, 1, 1, 1, 1,
-1.425771, 1.244312, -0.1676246, 1, 1, 1, 1, 1,
-1.423972, -1.122471, -2.315437, 1, 1, 1, 1, 1,
-1.42145, 0.03237979, -0.4848828, 1, 1, 1, 1, 1,
-1.418767, 0.5684666, -0.8621462, 1, 1, 1, 1, 1,
-1.411044, -0.5056712, -2.245218, 1, 1, 1, 1, 1,
-1.409655, 1.408426, -3.089248, 1, 1, 1, 1, 1,
-1.408488, 1.621948, -0.7262713, 1, 1, 1, 1, 1,
-1.40741, 0.2564512, -0.5825046, 1, 1, 1, 1, 1,
-1.399605, 1.206468, -1.885301, 1, 1, 1, 1, 1,
-1.389693, -0.01644653, 0.0377202, 1, 1, 1, 1, 1,
-1.386957, 0.3293469, -1.15261, 0, 0, 1, 1, 1,
-1.383171, -1.281585, -2.082163, 1, 0, 0, 1, 1,
-1.382668, 0.2149304, -1.036926, 1, 0, 0, 1, 1,
-1.379251, -1.084605, -1.353167, 1, 0, 0, 1, 1,
-1.36962, 1.327811, -0.812861, 1, 0, 0, 1, 1,
-1.368821, 0.4871955, -3.224422, 1, 0, 0, 1, 1,
-1.362158, -0.5648752, -1.176333, 0, 0, 0, 1, 1,
-1.360275, -0.7372331, -2.577085, 0, 0, 0, 1, 1,
-1.356821, 0.1246406, -1.070519, 0, 0, 0, 1, 1,
-1.348653, -0.8077642, -2.474548, 0, 0, 0, 1, 1,
-1.336609, -1.138877, -0.9382055, 0, 0, 0, 1, 1,
-1.331179, -0.2021784, -2.109199, 0, 0, 0, 1, 1,
-1.325128, -1.040013, -3.426461, 0, 0, 0, 1, 1,
-1.320159, 2.136359, -0.8197641, 1, 1, 1, 1, 1,
-1.299066, 1.062563, 1.449752, 1, 1, 1, 1, 1,
-1.278382, 0.7324757, -2.214899, 1, 1, 1, 1, 1,
-1.27247, 1.055383, 0.008115713, 1, 1, 1, 1, 1,
-1.272333, -0.5374714, -0.368898, 1, 1, 1, 1, 1,
-1.269256, 0.3329637, -0.9402128, 1, 1, 1, 1, 1,
-1.268951, 1.990778, -0.6279423, 1, 1, 1, 1, 1,
-1.261429, 1.66914, -2.090474, 1, 1, 1, 1, 1,
-1.261145, -0.1661407, -1.08223, 1, 1, 1, 1, 1,
-1.24367, 1.146253, 0.3391284, 1, 1, 1, 1, 1,
-1.237639, 0.1895328, -1.955297, 1, 1, 1, 1, 1,
-1.234272, -0.5692406, -1.117078, 1, 1, 1, 1, 1,
-1.231068, 0.6115735, -1.534948, 1, 1, 1, 1, 1,
-1.220661, 2.447522, -0.296841, 1, 1, 1, 1, 1,
-1.217779, -0.5110579, -2.205007, 1, 1, 1, 1, 1,
-1.214795, -0.8311287, -1.544255, 0, 0, 1, 1, 1,
-1.206871, -1.099612, -2.835059, 1, 0, 0, 1, 1,
-1.198937, 0.2452624, -2.404269, 1, 0, 0, 1, 1,
-1.192528, 0.3995975, -1.294229, 1, 0, 0, 1, 1,
-1.189205, -1.088333, -0.9917073, 1, 0, 0, 1, 1,
-1.183611, 0.777323, 0.09624384, 1, 0, 0, 1, 1,
-1.177419, 0.9700404, -2.526851, 0, 0, 0, 1, 1,
-1.176434, -0.7008413, -0.958051, 0, 0, 0, 1, 1,
-1.175309, 1.425956, -2.169466, 0, 0, 0, 1, 1,
-1.174191, -0.5739675, -1.86319, 0, 0, 0, 1, 1,
-1.172567, -1.013346, -1.016704, 0, 0, 0, 1, 1,
-1.168241, -0.2979583, -1.718749, 0, 0, 0, 1, 1,
-1.164791, 0.726121, -0.5822162, 0, 0, 0, 1, 1,
-1.16138, -1.271018, -3.836931, 1, 1, 1, 1, 1,
-1.159835, -0.5609645, -1.199538, 1, 1, 1, 1, 1,
-1.154258, -0.3669503, -3.300611, 1, 1, 1, 1, 1,
-1.150113, -0.8390533, -3.207729, 1, 1, 1, 1, 1,
-1.135108, -0.3322362, -1.694296, 1, 1, 1, 1, 1,
-1.126034, -0.2840073, -2.02596, 1, 1, 1, 1, 1,
-1.108263, -0.5923079, -0.5823142, 1, 1, 1, 1, 1,
-1.108183, -0.0202434, -2.222574, 1, 1, 1, 1, 1,
-1.092172, -0.06568849, -0.8500402, 1, 1, 1, 1, 1,
-1.088782, -0.767467, -1.652903, 1, 1, 1, 1, 1,
-1.079304, -1.099703, -0.5993449, 1, 1, 1, 1, 1,
-1.078566, 0.575795, -2.983332, 1, 1, 1, 1, 1,
-1.069544, 0.2777382, -0.4098229, 1, 1, 1, 1, 1,
-1.064855, -0.4523174, -3.034826, 1, 1, 1, 1, 1,
-1.05572, -0.1192631, -1.219489, 1, 1, 1, 1, 1,
-1.055103, 0.4439857, -0.5599624, 0, 0, 1, 1, 1,
-1.052079, -0.9117447, -2.046706, 1, 0, 0, 1, 1,
-1.049904, -1.625929, -3.693452, 1, 0, 0, 1, 1,
-1.047288, 0.9160289, -3.952362, 1, 0, 0, 1, 1,
-1.044957, -2.18039, -3.696717, 1, 0, 0, 1, 1,
-1.036528, 0.464872, -0.986804, 1, 0, 0, 1, 1,
-1.034693, -1.248108, -2.671342, 0, 0, 0, 1, 1,
-1.033716, -0.7262582, -2.025081, 0, 0, 0, 1, 1,
-1.031822, 0.1532805, -1.554483, 0, 0, 0, 1, 1,
-1.027963, -1.353528, -3.066905, 0, 0, 0, 1, 1,
-1.024756, 0.7323604, -2.752281, 0, 0, 0, 1, 1,
-1.02229, 0.9206893, -0.555582, 0, 0, 0, 1, 1,
-1.022, -0.03148003, -1.438063, 0, 0, 0, 1, 1,
-1.006254, -0.4840674, -0.6364837, 1, 1, 1, 1, 1,
-1.003034, 0.3113624, -1.733781, 1, 1, 1, 1, 1,
-0.9873244, 2.114515, -1.226872, 1, 1, 1, 1, 1,
-0.9675152, 1.59075, 1.09486, 1, 1, 1, 1, 1,
-0.9662775, -0.2759381, -2.099092, 1, 1, 1, 1, 1,
-0.9631401, -0.2509313, -2.034719, 1, 1, 1, 1, 1,
-0.962753, 0.4789984, 1.108958, 1, 1, 1, 1, 1,
-0.9488775, 0.249183, -2.637501, 1, 1, 1, 1, 1,
-0.9412119, -0.07213468, -0.1419105, 1, 1, 1, 1, 1,
-0.9366964, 0.8644119, -0.6027299, 1, 1, 1, 1, 1,
-0.9362657, -0.4537165, -1.326114, 1, 1, 1, 1, 1,
-0.9299335, 1.328652, -0.4957055, 1, 1, 1, 1, 1,
-0.9273335, -2.854868, -0.9632906, 1, 1, 1, 1, 1,
-0.9179443, -1.269188, -1.964804, 1, 1, 1, 1, 1,
-0.9177894, 1.532038, -1.379044, 1, 1, 1, 1, 1,
-0.9166386, -1.84972, -2.708473, 0, 0, 1, 1, 1,
-0.9110355, 0.3826396, -2.972336, 1, 0, 0, 1, 1,
-0.9100909, -0.5808743, -3.886868, 1, 0, 0, 1, 1,
-0.9016511, 0.8078767, 0.5759527, 1, 0, 0, 1, 1,
-0.9005625, 1.635834, -0.9166328, 1, 0, 0, 1, 1,
-0.8986208, 0.5096737, -3.040693, 1, 0, 0, 1, 1,
-0.8961889, 0.4533438, -0.2791116, 0, 0, 0, 1, 1,
-0.8948149, 1.520721, -1.219281, 0, 0, 0, 1, 1,
-0.8905897, -0.9564114, -3.045591, 0, 0, 0, 1, 1,
-0.8881223, -0.3695616, -3.988889, 0, 0, 0, 1, 1,
-0.8848183, 1.254322, -0.7295794, 0, 0, 0, 1, 1,
-0.8827965, -1.73651, -1.281924, 0, 0, 0, 1, 1,
-0.8811381, -0.2496553, -1.09028, 0, 0, 0, 1, 1,
-0.8762762, -0.7910723, -3.438377, 1, 1, 1, 1, 1,
-0.8744147, 0.9106362, -1.313589, 1, 1, 1, 1, 1,
-0.8717806, 0.4144568, -0.9296242, 1, 1, 1, 1, 1,
-0.8696457, -0.9852591, -3.440982, 1, 1, 1, 1, 1,
-0.8633488, -0.2552873, -1.14089, 1, 1, 1, 1, 1,
-0.8567247, -0.6401687, -2.69734, 1, 1, 1, 1, 1,
-0.8494834, 0.1683273, -0.2162296, 1, 1, 1, 1, 1,
-0.8412936, -0.1228364, -1.46077, 1, 1, 1, 1, 1,
-0.8373742, -0.8216894, -2.564484, 1, 1, 1, 1, 1,
-0.8366955, 0.167333, 0.4505186, 1, 1, 1, 1, 1,
-0.8366249, -0.003243458, -2.133747, 1, 1, 1, 1, 1,
-0.8293473, -0.2184356, -1.295774, 1, 1, 1, 1, 1,
-0.8288783, 1.123371, -2.453668, 1, 1, 1, 1, 1,
-0.8277001, -0.2233807, 0.2406026, 1, 1, 1, 1, 1,
-0.8260792, 1.445997, -0.5493262, 1, 1, 1, 1, 1,
-0.8255032, 0.8242047, 1.581099, 0, 0, 1, 1, 1,
-0.8099339, -0.5884981, -1.595813, 1, 0, 0, 1, 1,
-0.8076618, 1.503184, 0.1601528, 1, 0, 0, 1, 1,
-0.8060061, 0.3441823, -1.51115, 1, 0, 0, 1, 1,
-0.8020962, -0.2705119, -2.190097, 1, 0, 0, 1, 1,
-0.7974157, -0.6572115, -1.704447, 1, 0, 0, 1, 1,
-0.7958573, 0.1154336, -0.7793382, 0, 0, 0, 1, 1,
-0.7954125, -0.2928463, -1.393349, 0, 0, 0, 1, 1,
-0.7952951, -1.860523, -2.427491, 0, 0, 0, 1, 1,
-0.7920561, -0.5293346, -2.365464, 0, 0, 0, 1, 1,
-0.7912911, 0.2855859, -2.436512, 0, 0, 0, 1, 1,
-0.7912788, 1.193575, -1.267248, 0, 0, 0, 1, 1,
-0.7895758, 0.7830519, -1.008118, 0, 0, 0, 1, 1,
-0.786225, -2.609182, -2.413201, 1, 1, 1, 1, 1,
-0.7837085, -1.344337, -2.404737, 1, 1, 1, 1, 1,
-0.7774042, -1.180722, -1.862733, 1, 1, 1, 1, 1,
-0.772511, 1.374268, -0.6920086, 1, 1, 1, 1, 1,
-0.7705964, 1.354622, -0.8539611, 1, 1, 1, 1, 1,
-0.7701619, 0.6591179, -0.9200729, 1, 1, 1, 1, 1,
-0.7691793, 0.2829489, 0.2568749, 1, 1, 1, 1, 1,
-0.7677235, -0.2351846, -2.037305, 1, 1, 1, 1, 1,
-0.7661051, 0.5506128, -1.817745, 1, 1, 1, 1, 1,
-0.7528533, 1.299416, -1.761815, 1, 1, 1, 1, 1,
-0.7521526, 0.6986755, 0.600765, 1, 1, 1, 1, 1,
-0.7517357, -0.8659519, -2.656979, 1, 1, 1, 1, 1,
-0.7481664, -0.7496272, -1.968758, 1, 1, 1, 1, 1,
-0.7448965, 0.4278995, -1.608303, 1, 1, 1, 1, 1,
-0.7409135, 0.4077477, -1.102087, 1, 1, 1, 1, 1,
-0.7382737, 1.257846, 0.9325718, 0, 0, 1, 1, 1,
-0.7341765, 0.1111007, -1.953385, 1, 0, 0, 1, 1,
-0.7284145, -1.553765, -3.532055, 1, 0, 0, 1, 1,
-0.7195575, -1.052696, -2.402564, 1, 0, 0, 1, 1,
-0.7185274, -0.7311015, -1.89149, 1, 0, 0, 1, 1,
-0.7144596, -1.187606, -2.09845, 1, 0, 0, 1, 1,
-0.7106366, -0.3025995, -2.37713, 0, 0, 0, 1, 1,
-0.7086216, -1.506664, -1.835537, 0, 0, 0, 1, 1,
-0.7061734, -0.2794158, -0.4192877, 0, 0, 0, 1, 1,
-0.7038393, -0.3752038, -1.576447, 0, 0, 0, 1, 1,
-0.7015835, 0.635531, -1.924653, 0, 0, 0, 1, 1,
-0.7000208, -1.868382, -2.778013, 0, 0, 0, 1, 1,
-0.6989174, 0.9722851, -2.725773, 0, 0, 0, 1, 1,
-0.6907931, -0.3481671, -1.56766, 1, 1, 1, 1, 1,
-0.6855963, 1.692419, -2.010189, 1, 1, 1, 1, 1,
-0.684211, 0.5533539, -2.611157, 1, 1, 1, 1, 1,
-0.680087, 1.812701, -0.4300146, 1, 1, 1, 1, 1,
-0.6776959, 0.6373806, -0.6112359, 1, 1, 1, 1, 1,
-0.6776804, -0.4400872, -3.422038, 1, 1, 1, 1, 1,
-0.6774886, 0.6475706, -2.361392, 1, 1, 1, 1, 1,
-0.6743014, 0.6739305, 0.8083962, 1, 1, 1, 1, 1,
-0.673386, 0.09106143, -2.704061, 1, 1, 1, 1, 1,
-0.671142, -1.796237, -3.127646, 1, 1, 1, 1, 1,
-0.6661765, -0.4385178, -3.07509, 1, 1, 1, 1, 1,
-0.664485, -1.299392, -3.842085, 1, 1, 1, 1, 1,
-0.6618803, 0.4564958, -1.421117, 1, 1, 1, 1, 1,
-0.6601239, -0.544022, -3.03458, 1, 1, 1, 1, 1,
-0.6589304, -0.1560346, -1.589648, 1, 1, 1, 1, 1,
-0.657271, 0.2215637, -0.6641611, 0, 0, 1, 1, 1,
-0.6547528, -0.5478375, -2.694883, 1, 0, 0, 1, 1,
-0.6527944, 1.054166, -1.919101, 1, 0, 0, 1, 1,
-0.649774, 1.338215, -0.2506216, 1, 0, 0, 1, 1,
-0.6467481, 2.058236, -0.01360647, 1, 0, 0, 1, 1,
-0.6364214, 0.5855191, 0.294846, 1, 0, 0, 1, 1,
-0.6337942, 0.5932897, 1.118023, 0, 0, 0, 1, 1,
-0.6336272, -0.9385037, -4.357152, 0, 0, 0, 1, 1,
-0.6331896, -0.7504979, -2.480115, 0, 0, 0, 1, 1,
-0.631144, 1.548091, -0.5884021, 0, 0, 0, 1, 1,
-0.6284361, -1.787793, -2.78891, 0, 0, 0, 1, 1,
-0.6281478, -0.04764525, 0.244389, 0, 0, 0, 1, 1,
-0.6218008, -0.2384501, -2.106952, 0, 0, 0, 1, 1,
-0.6213158, 0.5143081, -0.1789856, 1, 1, 1, 1, 1,
-0.6136599, -0.4988639, -2.031722, 1, 1, 1, 1, 1,
-0.6133626, -0.135818, -1.849817, 1, 1, 1, 1, 1,
-0.6104404, -0.574231, -2.669675, 1, 1, 1, 1, 1,
-0.6023186, 0.2268893, -1.439731, 1, 1, 1, 1, 1,
-0.6022233, 0.6017706, -1.343818, 1, 1, 1, 1, 1,
-0.5951535, 1.219875, 0.1595483, 1, 1, 1, 1, 1,
-0.5950725, -0.1937677, -2.579925, 1, 1, 1, 1, 1,
-0.590344, -0.7749828, -2.312559, 1, 1, 1, 1, 1,
-0.589155, -1.623368, -1.521565, 1, 1, 1, 1, 1,
-0.5846565, -0.704377, -2.810422, 1, 1, 1, 1, 1,
-0.5794702, -0.4273895, -2.610135, 1, 1, 1, 1, 1,
-0.5787125, -0.9254249, -1.659024, 1, 1, 1, 1, 1,
-0.5741058, -0.417836, -0.5867699, 1, 1, 1, 1, 1,
-0.5713644, 0.3873527, -1.072553, 1, 1, 1, 1, 1,
-0.5659109, 0.4218706, -2.784271, 0, 0, 1, 1, 1,
-0.5651863, -0.2684231, -2.770774, 1, 0, 0, 1, 1,
-0.5620158, -0.3868605, -3.386422, 1, 0, 0, 1, 1,
-0.5618014, -0.03222077, -3.45242, 1, 0, 0, 1, 1,
-0.5580246, -0.518353, -1.358637, 1, 0, 0, 1, 1,
-0.5398927, -0.7729971, -3.613296, 1, 0, 0, 1, 1,
-0.5378737, -0.9040007, -2.086897, 0, 0, 0, 1, 1,
-0.5376175, -1.064298, -2.152906, 0, 0, 0, 1, 1,
-0.5373359, 0.4757429, -0.4832315, 0, 0, 0, 1, 1,
-0.5298302, -2.132941, -3.332122, 0, 0, 0, 1, 1,
-0.529301, 0.01044876, -3.523717, 0, 0, 0, 1, 1,
-0.5281, 0.7656463, 1.06876, 0, 0, 0, 1, 1,
-0.5265748, -0.1989844, -1.387333, 0, 0, 0, 1, 1,
-0.5261242, -2.016529, -2.646055, 1, 1, 1, 1, 1,
-0.5228583, 0.1765265, -2.363316, 1, 1, 1, 1, 1,
-0.5227783, -0.4763506, -2.877492, 1, 1, 1, 1, 1,
-0.5157672, -0.4764897, -2.585431, 1, 1, 1, 1, 1,
-0.514453, -1.556266, -2.565848, 1, 1, 1, 1, 1,
-0.5142069, 0.07722667, -2.01638, 1, 1, 1, 1, 1,
-0.5106628, -1.753018, -3.659317, 1, 1, 1, 1, 1,
-0.5076185, 0.06915937, -3.348121, 1, 1, 1, 1, 1,
-0.5037628, -0.2560415, -1.700626, 1, 1, 1, 1, 1,
-0.503482, 0.9590849, -1.417988, 1, 1, 1, 1, 1,
-0.5009041, -2.285895, -1.70242, 1, 1, 1, 1, 1,
-0.4970997, -1.111434, -2.862954, 1, 1, 1, 1, 1,
-0.493766, -0.7118139, -2.543602, 1, 1, 1, 1, 1,
-0.4902885, -1.614875, -3.472503, 1, 1, 1, 1, 1,
-0.489995, -0.8236504, -1.384241, 1, 1, 1, 1, 1,
-0.4776894, 0.1718606, -0.1110591, 0, 0, 1, 1, 1,
-0.4767623, -0.5334333, -4.201629, 1, 0, 0, 1, 1,
-0.4589357, 0.3961484, -1.178914, 1, 0, 0, 1, 1,
-0.4578339, 0.8656993, -2.007436, 1, 0, 0, 1, 1,
-0.4539617, 0.1813063, -2.054183, 1, 0, 0, 1, 1,
-0.4486069, -1.362032, -4.091978, 1, 0, 0, 1, 1,
-0.4477543, 0.457049, -0.3474796, 0, 0, 0, 1, 1,
-0.4477131, 0.4915351, -0.2258873, 0, 0, 0, 1, 1,
-0.4456125, 1.440492, 0.4876122, 0, 0, 0, 1, 1,
-0.4404357, 0.3458782, -0.6575917, 0, 0, 0, 1, 1,
-0.4396775, 0.4272414, 0.4647905, 0, 0, 0, 1, 1,
-0.4355165, -0.09872862, -0.8921404, 0, 0, 0, 1, 1,
-0.4345495, 0.8172619, -1.089402, 0, 0, 0, 1, 1,
-0.4336805, -2.483736, -3.16698, 1, 1, 1, 1, 1,
-0.430556, 1.297023, -2.178678, 1, 1, 1, 1, 1,
-0.4240517, 2.481144, -0.8701434, 1, 1, 1, 1, 1,
-0.4240459, 0.08234376, -2.828848, 1, 1, 1, 1, 1,
-0.4238097, 2.187864, -2.44702, 1, 1, 1, 1, 1,
-0.4234567, 0.04259063, -3.73544, 1, 1, 1, 1, 1,
-0.4179626, 0.8677701, 0.1752984, 1, 1, 1, 1, 1,
-0.4090632, 1.218278, 1.010412, 1, 1, 1, 1, 1,
-0.4074838, -0.3796449, -4.709126, 1, 1, 1, 1, 1,
-0.4004476, -0.4208579, -1.084596, 1, 1, 1, 1, 1,
-0.3933137, 0.2821624, -0.8578797, 1, 1, 1, 1, 1,
-0.3892198, 1.39067, 0.0625171, 1, 1, 1, 1, 1,
-0.3891695, -1.320089, -1.260143, 1, 1, 1, 1, 1,
-0.3866653, -0.5873883, -4.295074, 1, 1, 1, 1, 1,
-0.3864987, -0.3620856, -1.464672, 1, 1, 1, 1, 1,
-0.3841226, 0.4280964, -1.676904, 0, 0, 1, 1, 1,
-0.381685, -1.319149, -2.911248, 1, 0, 0, 1, 1,
-0.3806687, -0.5651637, -2.155708, 1, 0, 0, 1, 1,
-0.3797345, 0.4813856, -1.467345, 1, 0, 0, 1, 1,
-0.3755554, 1.441562, -0.8533531, 1, 0, 0, 1, 1,
-0.3738992, 0.05776843, -0.3429409, 1, 0, 0, 1, 1,
-0.3709479, 0.4638392, -0.6677244, 0, 0, 0, 1, 1,
-0.368537, 0.9017201, -0.7580191, 0, 0, 0, 1, 1,
-0.3668747, -1.424257, -3.383482, 0, 0, 0, 1, 1,
-0.3661294, 0.05195686, 0.2450553, 0, 0, 0, 1, 1,
-0.3634419, 0.08933304, 0.1371857, 0, 0, 0, 1, 1,
-0.3531029, -1.065664, -2.19143, 0, 0, 0, 1, 1,
-0.3527968, 1.340911, 0.5691555, 0, 0, 0, 1, 1,
-0.3520006, 2.339946, -0.2631636, 1, 1, 1, 1, 1,
-0.3465097, -0.6204821, -1.951243, 1, 1, 1, 1, 1,
-0.3456675, 0.9813661, -0.9446952, 1, 1, 1, 1, 1,
-0.3436764, 0.4347663, -0.5640939, 1, 1, 1, 1, 1,
-0.3370538, -0.4813987, -3.834469, 1, 1, 1, 1, 1,
-0.3349433, -0.6492974, -3.21381, 1, 1, 1, 1, 1,
-0.3343523, 1.397047, -0.03215484, 1, 1, 1, 1, 1,
-0.3326287, -1.896538, -3.826807, 1, 1, 1, 1, 1,
-0.3314179, -0.4562045, -1.776597, 1, 1, 1, 1, 1,
-0.3265774, -1.42814, -3.132179, 1, 1, 1, 1, 1,
-0.3253855, -0.07216856, -0.5843874, 1, 1, 1, 1, 1,
-0.3225021, 0.03022572, -1.689495, 1, 1, 1, 1, 1,
-0.3222511, 1.732683, 1.061437, 1, 1, 1, 1, 1,
-0.3211254, -0.2338461, -0.9475931, 1, 1, 1, 1, 1,
-0.3164905, 0.07743164, -1.0034, 1, 1, 1, 1, 1,
-0.3141745, 0.8949141, -0.6417139, 0, 0, 1, 1, 1,
-0.3110399, 0.8500612, 0.2899618, 1, 0, 0, 1, 1,
-0.3103369, -0.5623517, -2.330859, 1, 0, 0, 1, 1,
-0.3088733, -0.2391389, -2.036877, 1, 0, 0, 1, 1,
-0.3025039, 0.4551241, -0.6036013, 1, 0, 0, 1, 1,
-0.3004979, -0.4005509, -0.9704853, 1, 0, 0, 1, 1,
-0.2996934, 1.779259, 0.277842, 0, 0, 0, 1, 1,
-0.2911613, 1.214246, 0.6799171, 0, 0, 0, 1, 1,
-0.2902108, -0.9269804, -4.130046, 0, 0, 0, 1, 1,
-0.2877262, 1.518715, 0.5215717, 0, 0, 0, 1, 1,
-0.2850136, -0.0546044, -0.3749061, 0, 0, 0, 1, 1,
-0.2783874, 0.00337632, -2.561337, 0, 0, 0, 1, 1,
-0.2707945, 0.8768691, -1.859675, 0, 0, 0, 1, 1,
-0.2692349, 1.439548, -0.4307961, 1, 1, 1, 1, 1,
-0.2641339, 1.913986, -0.4293891, 1, 1, 1, 1, 1,
-0.2632807, 0.9656278, -2.251822, 1, 1, 1, 1, 1,
-0.2579019, 0.3210643, -1.463236, 1, 1, 1, 1, 1,
-0.2484783, 0.7742999, -3.038782, 1, 1, 1, 1, 1,
-0.2433131, -0.04316821, -2.18983, 1, 1, 1, 1, 1,
-0.2424563, 0.4922921, 0.619055, 1, 1, 1, 1, 1,
-0.2416629, -1.838618, -3.798676, 1, 1, 1, 1, 1,
-0.2396357, -0.3487621, -2.711731, 1, 1, 1, 1, 1,
-0.2379278, 0.3039367, -1.427815, 1, 1, 1, 1, 1,
-0.2351855, -1.981453, -4.001243, 1, 1, 1, 1, 1,
-0.2349244, 0.0901121, -2.250758, 1, 1, 1, 1, 1,
-0.2344255, -0.03791912, -1.714577, 1, 1, 1, 1, 1,
-0.2339326, 1.494673, 0.3539422, 1, 1, 1, 1, 1,
-0.2307762, 0.3900709, -0.01577772, 1, 1, 1, 1, 1,
-0.2306549, -1.24864, -4.358956, 0, 0, 1, 1, 1,
-0.2303442, 0.7406595, 1.070854, 1, 0, 0, 1, 1,
-0.2280197, 1.397277, 0.5052776, 1, 0, 0, 1, 1,
-0.2273903, -0.8899163, -3.113382, 1, 0, 0, 1, 1,
-0.2264078, -0.07941596, -0.7032607, 1, 0, 0, 1, 1,
-0.2249882, -0.08529937, -0.3169999, 1, 0, 0, 1, 1,
-0.2235417, 1.676909, -0.6315152, 0, 0, 0, 1, 1,
-0.2232761, -2.260635, -1.956952, 0, 0, 0, 1, 1,
-0.2201779, -0.4988017, -3.39997, 0, 0, 0, 1, 1,
-0.2175616, 1.336002, 1.550851, 0, 0, 0, 1, 1,
-0.2165365, 0.9043207, 0.06964845, 0, 0, 0, 1, 1,
-0.2117026, -1.120077, -4.205709, 0, 0, 0, 1, 1,
-0.2104998, -0.6826769, -4.622547, 0, 0, 0, 1, 1,
-0.2000396, 0.5025142, 0.3584011, 1, 1, 1, 1, 1,
-0.1969628, 2.05216, -0.5687967, 1, 1, 1, 1, 1,
-0.1967849, 0.256517, -0.09311823, 1, 1, 1, 1, 1,
-0.1926419, 1.226544, 0.9949423, 1, 1, 1, 1, 1,
-0.1869773, 0.468365, -2.128916, 1, 1, 1, 1, 1,
-0.1864228, -1.04171, -3.931381, 1, 1, 1, 1, 1,
-0.1795797, -0.9651322, -2.774324, 1, 1, 1, 1, 1,
-0.1752292, 0.2984721, -0.6845915, 1, 1, 1, 1, 1,
-0.1737496, 0.8230336, -1.551376, 1, 1, 1, 1, 1,
-0.173296, 1.131759, 2.303066, 1, 1, 1, 1, 1,
-0.1681493, -0.04780317, -3.360436, 1, 1, 1, 1, 1,
-0.1678418, -0.3044225, -2.212226, 1, 1, 1, 1, 1,
-0.1617024, 0.1446861, -1.562521, 1, 1, 1, 1, 1,
-0.1573482, 0.2798693, -1.758083, 1, 1, 1, 1, 1,
-0.1513076, 0.78809, -0.5134792, 1, 1, 1, 1, 1,
-0.1512701, 0.1285657, -1.558529, 0, 0, 1, 1, 1,
-0.1505471, 1.298313, -1.226416, 1, 0, 0, 1, 1,
-0.1500524, 0.08196015, -2.524451, 1, 0, 0, 1, 1,
-0.1472262, 0.8770025, -0.9716901, 1, 0, 0, 1, 1,
-0.1470899, -0.8881235, -4.211498, 1, 0, 0, 1, 1,
-0.1457447, -1.239046, -4.601045, 1, 0, 0, 1, 1,
-0.1442844, 1.01552, -0.3064268, 0, 0, 0, 1, 1,
-0.1401617, 1.07221, -0.8347663, 0, 0, 0, 1, 1,
-0.1382718, -1.097208, -2.759528, 0, 0, 0, 1, 1,
-0.1381004, 0.8112862, -0.7510542, 0, 0, 0, 1, 1,
-0.1375848, 0.1557444, -1.083717, 0, 0, 0, 1, 1,
-0.1320902, -0.6168606, -1.939973, 0, 0, 0, 1, 1,
-0.1292494, -1.809486, -2.205177, 0, 0, 0, 1, 1,
-0.1281851, -0.2019587, -4.146291, 1, 1, 1, 1, 1,
-0.1264094, -0.9911596, -2.199372, 1, 1, 1, 1, 1,
-0.119805, -1.525732, -1.96496, 1, 1, 1, 1, 1,
-0.1193811, 1.247643, -1.061183, 1, 1, 1, 1, 1,
-0.1183588, -2.117176, -3.747822, 1, 1, 1, 1, 1,
-0.117749, -1.087771, -3.367216, 1, 1, 1, 1, 1,
-0.1175943, -0.8169445, -4.997239, 1, 1, 1, 1, 1,
-0.116592, -0.4727902, -3.873285, 1, 1, 1, 1, 1,
-0.1140704, 0.02913634, -1.769596, 1, 1, 1, 1, 1,
-0.1095071, 0.2787902, -0.3975211, 1, 1, 1, 1, 1,
-0.1025668, 1.071635, -1.452547, 1, 1, 1, 1, 1,
-0.09747927, 0.6696591, -0.5898609, 1, 1, 1, 1, 1,
-0.09500545, 0.569954, -0.2250903, 1, 1, 1, 1, 1,
-0.09400287, -1.237078, -4.240102, 1, 1, 1, 1, 1,
-0.09133331, -1.292456, -2.604934, 1, 1, 1, 1, 1,
-0.09048417, 0.6029005, 2.007087, 0, 0, 1, 1, 1,
-0.08416849, 0.4659011, 0.2875466, 1, 0, 0, 1, 1,
-0.08149908, 0.6621019, 1.105014, 1, 0, 0, 1, 1,
-0.0775149, -1.212594, -2.177758, 1, 0, 0, 1, 1,
-0.0756823, 0.1187221, 0.6884574, 1, 0, 0, 1, 1,
-0.07504619, 1.929317, -1.191974, 1, 0, 0, 1, 1,
-0.07475312, -0.166379, -2.407715, 0, 0, 0, 1, 1,
-0.07320452, 1.713672, 0.05184162, 0, 0, 0, 1, 1,
-0.07209446, -2.465646, -3.613207, 0, 0, 0, 1, 1,
-0.07180886, -0.04863702, -1.930215, 0, 0, 0, 1, 1,
-0.06662171, -0.5070153, -3.014042, 0, 0, 0, 1, 1,
-0.06377959, 0.04369107, -0.2832931, 0, 0, 0, 1, 1,
-0.06125488, 1.167298, 1.071238, 0, 0, 0, 1, 1,
-0.06121126, 0.1805923, -1.879679, 1, 1, 1, 1, 1,
-0.05767337, -0.2001766, -1.304807, 1, 1, 1, 1, 1,
-0.05685689, -0.2207674, -3.965171, 1, 1, 1, 1, 1,
-0.05663513, -1.457039, -4.552394, 1, 1, 1, 1, 1,
-0.05413866, -0.8303542, -3.547066, 1, 1, 1, 1, 1,
-0.05219208, -1.039587, -2.12021, 1, 1, 1, 1, 1,
-0.05201269, -0.4010648, -4.49893, 1, 1, 1, 1, 1,
-0.05092982, -0.3955095, -1.121393, 1, 1, 1, 1, 1,
-0.04409, -1.360686, -1.702212, 1, 1, 1, 1, 1,
-0.04117582, -1.244881, -3.491976, 1, 1, 1, 1, 1,
-0.04026563, -0.418164, -3.737616, 1, 1, 1, 1, 1,
-0.03576744, 0.4417959, 1.00556, 1, 1, 1, 1, 1,
-0.03332691, -1.074859, -3.177652, 1, 1, 1, 1, 1,
-0.03142274, -0.78948, -1.419815, 1, 1, 1, 1, 1,
-0.03013891, 1.428042, 0.9923739, 1, 1, 1, 1, 1,
-0.03011369, -0.541423, -1.797682, 0, 0, 1, 1, 1,
-0.02892261, 0.5200698, -0.2826176, 1, 0, 0, 1, 1,
-0.02824316, -0.1978103, -1.917745, 1, 0, 0, 1, 1,
-0.02812928, -0.7809865, -2.497898, 1, 0, 0, 1, 1,
-0.02761811, -0.4100117, -3.253509, 1, 0, 0, 1, 1,
-0.02723069, 0.7054133, 0.2337868, 1, 0, 0, 1, 1,
-0.02003026, -0.295309, -3.298102, 0, 0, 0, 1, 1,
-0.01760291, -0.4297493, -2.657238, 0, 0, 0, 1, 1,
-0.01601776, 0.8074578, -0.499924, 0, 0, 0, 1, 1,
-0.01565263, -0.4301538, -4.031984, 0, 0, 0, 1, 1,
-0.008359002, 0.411609, -0.4799146, 0, 0, 0, 1, 1,
-0.007318443, -1.698154, -2.019596, 0, 0, 0, 1, 1,
-0.0008859648, -1.415872, -4.630194, 0, 0, 0, 1, 1,
0.002733355, -0.2614205, 3.30445, 1, 1, 1, 1, 1,
0.003459247, 0.7263065, 0.4653315, 1, 1, 1, 1, 1,
0.007047583, 0.5833561, -2.263644, 1, 1, 1, 1, 1,
0.008767059, -0.5992051, 2.702179, 1, 1, 1, 1, 1,
0.01333905, 0.0008454607, 0.8482176, 1, 1, 1, 1, 1,
0.01461734, -0.633595, 2.823931, 1, 1, 1, 1, 1,
0.01757737, -0.1585087, 3.630644, 1, 1, 1, 1, 1,
0.02191438, 0.2612712, -0.2985168, 1, 1, 1, 1, 1,
0.02271737, -0.2245404, 2.717768, 1, 1, 1, 1, 1,
0.02425025, -0.454902, 2.252127, 1, 1, 1, 1, 1,
0.02538493, -0.04517308, 2.394883, 1, 1, 1, 1, 1,
0.02567516, 0.1201294, -2.322172, 1, 1, 1, 1, 1,
0.02866103, -0.9827828, 4.795702, 1, 1, 1, 1, 1,
0.03141896, -0.7910632, 1.879568, 1, 1, 1, 1, 1,
0.03358406, -0.9644777, 3.383493, 1, 1, 1, 1, 1,
0.03400797, 0.9195064, 1.42657, 0, 0, 1, 1, 1,
0.03469701, 0.4991083, -0.7009826, 1, 0, 0, 1, 1,
0.03588173, -1.353797, 0.9867132, 1, 0, 0, 1, 1,
0.03611305, -1.400923, 0.5963505, 1, 0, 0, 1, 1,
0.03738682, -0.7782941, 3.399564, 1, 0, 0, 1, 1,
0.03825498, -1.025268, 1.812616, 1, 0, 0, 1, 1,
0.04258078, 0.9102109, 0.5356987, 0, 0, 0, 1, 1,
0.04368945, 0.4321069, -0.4172797, 0, 0, 0, 1, 1,
0.04544692, -0.4452808, 2.54847, 0, 0, 0, 1, 1,
0.04685813, 0.416825, 0.4111941, 0, 0, 0, 1, 1,
0.05100755, 0.5329675, 0.6873103, 0, 0, 0, 1, 1,
0.05333666, -0.2575467, 3.366383, 0, 0, 0, 1, 1,
0.06218839, 0.7704516, 0.7423224, 0, 0, 0, 1, 1,
0.06443628, -1.608984, 2.357607, 1, 1, 1, 1, 1,
0.06918965, -0.8507043, 3.442015, 1, 1, 1, 1, 1,
0.07131372, -0.8561986, 3.087948, 1, 1, 1, 1, 1,
0.07134693, -1.254884, 2.080169, 1, 1, 1, 1, 1,
0.07249966, 1.202007, 1.391722, 1, 1, 1, 1, 1,
0.07276247, -2.187816, 3.386618, 1, 1, 1, 1, 1,
0.07364406, 0.6628546, 1.342963, 1, 1, 1, 1, 1,
0.07405782, -0.2942008, 1.339604, 1, 1, 1, 1, 1,
0.07600768, 0.6811241, -0.4509543, 1, 1, 1, 1, 1,
0.07813734, -0.3696249, 3.555739, 1, 1, 1, 1, 1,
0.07851248, 0.6056269, 0.5207387, 1, 1, 1, 1, 1,
0.08240822, 1.050726, 1.49022, 1, 1, 1, 1, 1,
0.08514255, 2.265766, 1.825729, 1, 1, 1, 1, 1,
0.09292149, 1.79411, -0.4711248, 1, 1, 1, 1, 1,
0.1002177, -1.799638, 3.544587, 1, 1, 1, 1, 1,
0.1004448, -1.95868, 1.773491, 0, 0, 1, 1, 1,
0.1048062, 0.4434765, -0.5038423, 1, 0, 0, 1, 1,
0.104908, -1.890346, 3.657463, 1, 0, 0, 1, 1,
0.106689, -1.348482, 2.401326, 1, 0, 0, 1, 1,
0.1081417, 0.2941863, 0.02090587, 1, 0, 0, 1, 1,
0.1091179, -1.45428, 2.160359, 1, 0, 0, 1, 1,
0.1093682, 0.6597448, 0.6330462, 0, 0, 0, 1, 1,
0.1108183, 0.8253357, -0.5908092, 0, 0, 0, 1, 1,
0.1112904, 1.293334, -2.002831, 0, 0, 0, 1, 1,
0.1130038, 0.096659, 0.7917116, 0, 0, 0, 1, 1,
0.1137388, -0.9859577, 3.709854, 0, 0, 0, 1, 1,
0.1168032, -1.632672, 2.08082, 0, 0, 0, 1, 1,
0.1192111, 0.3784958, 0.44328, 0, 0, 0, 1, 1,
0.1211338, 0.1906629, 2.807178, 1, 1, 1, 1, 1,
0.1229174, -1.456345, 3.14805, 1, 1, 1, 1, 1,
0.12998, 0.601264, 2.73281, 1, 1, 1, 1, 1,
0.1308367, 0.5527966, 0.1098987, 1, 1, 1, 1, 1,
0.1349119, -0.2206391, 2.955218, 1, 1, 1, 1, 1,
0.1364275, -2.324095, 3.425551, 1, 1, 1, 1, 1,
0.1375899, -0.6183646, 4.976977, 1, 1, 1, 1, 1,
0.1422761, -0.3571509, 2.521474, 1, 1, 1, 1, 1,
0.144375, 0.04435263, 1.187339, 1, 1, 1, 1, 1,
0.1446866, -0.9875937, 2.648794, 1, 1, 1, 1, 1,
0.1490142, -1.193481, 2.552019, 1, 1, 1, 1, 1,
0.1510264, -0.08793532, 0.339576, 1, 1, 1, 1, 1,
0.1518187, 1.30841, -0.1323096, 1, 1, 1, 1, 1,
0.1545092, -0.9327564, 4.198105, 1, 1, 1, 1, 1,
0.1569466, -0.07062465, 2.585775, 1, 1, 1, 1, 1,
0.1613215, 0.7021942, 0.8524362, 0, 0, 1, 1, 1,
0.1614356, 1.926288, 0.5905386, 1, 0, 0, 1, 1,
0.1617265, -1.5661, 3.018087, 1, 0, 0, 1, 1,
0.1617808, -0.863107, 4.417667, 1, 0, 0, 1, 1,
0.1619435, -0.356505, 2.565201, 1, 0, 0, 1, 1,
0.1647532, -1.114025, 3.647872, 1, 0, 0, 1, 1,
0.1669706, -2.413001, 2.516969, 0, 0, 0, 1, 1,
0.1670973, -0.7540662, 2.316948, 0, 0, 0, 1, 1,
0.1673064, -0.9474788, 3.653768, 0, 0, 0, 1, 1,
0.1680884, 1.833637, 1.490142, 0, 0, 0, 1, 1,
0.1704283, 0.1491752, 0.4166815, 0, 0, 0, 1, 1,
0.1714189, -0.09220143, 1.986756, 0, 0, 0, 1, 1,
0.1731691, -0.6482858, 2.246059, 0, 0, 0, 1, 1,
0.1754549, 0.775227, 1.465027, 1, 1, 1, 1, 1,
0.1783485, -1.440225, 2.959377, 1, 1, 1, 1, 1,
0.1802475, -0.2293799, 2.941758, 1, 1, 1, 1, 1,
0.1828037, 0.4925398, 0.3765179, 1, 1, 1, 1, 1,
0.1855939, -0.1376717, 1.207792, 1, 1, 1, 1, 1,
0.193564, -0.8089514, 1.654655, 1, 1, 1, 1, 1,
0.195234, -0.499946, 1.702308, 1, 1, 1, 1, 1,
0.1967306, 0.6316562, -1.496287, 1, 1, 1, 1, 1,
0.2003295, 0.254978, 0.3719381, 1, 1, 1, 1, 1,
0.2007501, 1.810576, 1.787796, 1, 1, 1, 1, 1,
0.2029383, -0.5650916, 3.360194, 1, 1, 1, 1, 1,
0.2159723, -1.246689, 1.278601, 1, 1, 1, 1, 1,
0.2162895, 1.289211, -0.04771595, 1, 1, 1, 1, 1,
0.2243765, -0.180891, 1.884966, 1, 1, 1, 1, 1,
0.2252522, -1.920363, 1.76803, 1, 1, 1, 1, 1,
0.2267282, -0.5771375, 3.088197, 0, 0, 1, 1, 1,
0.2288902, -0.5589957, 3.313744, 1, 0, 0, 1, 1,
0.230065, -0.09641713, 1.997323, 1, 0, 0, 1, 1,
0.231175, -0.1430293, 2.635998, 1, 0, 0, 1, 1,
0.2323969, -0.717888, 1.282305, 1, 0, 0, 1, 1,
0.2344485, -0.7753669, 2.909378, 1, 0, 0, 1, 1,
0.235857, 0.8195151, 0.844974, 0, 0, 0, 1, 1,
0.2419007, -1.07276, 3.131061, 0, 0, 0, 1, 1,
0.2499014, 0.5595349, 1.487505, 0, 0, 0, 1, 1,
0.2541544, -1.638219, 2.479695, 0, 0, 0, 1, 1,
0.2547987, -0.5058632, 2.358364, 0, 0, 0, 1, 1,
0.2577339, 0.5919477, 0.4913402, 0, 0, 0, 1, 1,
0.2589398, -0.7745647, 3.238267, 0, 0, 0, 1, 1,
0.2605415, -0.04518974, 2.991725, 1, 1, 1, 1, 1,
0.2642586, -0.9945609, 2.807034, 1, 1, 1, 1, 1,
0.26941, 0.8600476, 0.03025077, 1, 1, 1, 1, 1,
0.2695898, 0.262501, 1.909738, 1, 1, 1, 1, 1,
0.2702187, 0.8811908, 1.027286, 1, 1, 1, 1, 1,
0.2705136, -0.4488143, 3.117584, 1, 1, 1, 1, 1,
0.2714285, -0.2138844, 3.492325, 1, 1, 1, 1, 1,
0.2739753, -0.5696049, 2.465521, 1, 1, 1, 1, 1,
0.2765639, -1.663441, 4.261082, 1, 1, 1, 1, 1,
0.2768734, -0.1020832, 2.981514, 1, 1, 1, 1, 1,
0.2831188, 2.023362, -0.5344093, 1, 1, 1, 1, 1,
0.2847476, -0.5377564, 2.366479, 1, 1, 1, 1, 1,
0.2942235, -0.3560581, 3.743876, 1, 1, 1, 1, 1,
0.2963925, 0.3838849, 0.2734481, 1, 1, 1, 1, 1,
0.300316, 0.253764, -0.194438, 1, 1, 1, 1, 1,
0.3003989, 0.4626745, 1.764217, 0, 0, 1, 1, 1,
0.3057889, 0.2012172, -0.05626693, 1, 0, 0, 1, 1,
0.3083279, -0.887532, 2.576237, 1, 0, 0, 1, 1,
0.308478, -0.8408015, 2.595778, 1, 0, 0, 1, 1,
0.3160276, 1.080371, 0.3561092, 1, 0, 0, 1, 1,
0.3260146, 0.2985883, 1.576192, 1, 0, 0, 1, 1,
0.3276789, -0.3156623, 2.924813, 0, 0, 0, 1, 1,
0.3357423, 0.6700051, 1.373263, 0, 0, 0, 1, 1,
0.3391772, -0.4229424, 1.481182, 0, 0, 0, 1, 1,
0.3403604, 0.2604356, -0.3010418, 0, 0, 0, 1, 1,
0.3407247, 0.3542577, 0.776902, 0, 0, 0, 1, 1,
0.3414457, 0.6125723, 2.199134, 0, 0, 0, 1, 1,
0.3441916, -0.180673, 4.760756, 0, 0, 0, 1, 1,
0.3448503, 0.9754646, -1.419528, 1, 1, 1, 1, 1,
0.3521599, 0.7966707, 1.186387, 1, 1, 1, 1, 1,
0.3541447, 0.006447991, 0.1173256, 1, 1, 1, 1, 1,
0.3547741, -2.787727, 2.497461, 1, 1, 1, 1, 1,
0.3562356, -0.8859333, 4.423589, 1, 1, 1, 1, 1,
0.3566778, -0.3415982, 1.348099, 1, 1, 1, 1, 1,
0.3569867, 0.5390836, 1.442645, 1, 1, 1, 1, 1,
0.3577456, 1.586283, -0.2166667, 1, 1, 1, 1, 1,
0.363255, 1.121108, 1.512345, 1, 1, 1, 1, 1,
0.3707645, 0.6906272, 0.793542, 1, 1, 1, 1, 1,
0.3810642, 1.635011, 1.795677, 1, 1, 1, 1, 1,
0.3833836, 0.8326367, 0.6069621, 1, 1, 1, 1, 1,
0.3833984, 0.8908697, 0.6197516, 1, 1, 1, 1, 1,
0.3912318, 0.4415714, 0.4288286, 1, 1, 1, 1, 1,
0.3920259, 0.9575019, 0.4905262, 1, 1, 1, 1, 1,
0.3949884, 0.03162408, 1.165559, 0, 0, 1, 1, 1,
0.3962305, 0.8558899, -0.9093973, 1, 0, 0, 1, 1,
0.3996097, 1.26961, 0.1155336, 1, 0, 0, 1, 1,
0.4007172, -0.5100902, 3.020466, 1, 0, 0, 1, 1,
0.4026536, 0.6210606, 1.358034, 1, 0, 0, 1, 1,
0.4036673, -0.1041999, 2.015767, 1, 0, 0, 1, 1,
0.40393, 0.285332, 1.884424, 0, 0, 0, 1, 1,
0.4090884, -1.936938, 3.04896, 0, 0, 0, 1, 1,
0.4098859, 1.460172, 0.7356159, 0, 0, 0, 1, 1,
0.4122227, -1.188532, 1.25724, 0, 0, 0, 1, 1,
0.4145132, -0.611224, 3.031868, 0, 0, 0, 1, 1,
0.4163147, -1.17588, 2.792455, 0, 0, 0, 1, 1,
0.420313, 0.7927827, -0.0355407, 0, 0, 0, 1, 1,
0.4242237, -1.781908, 2.088991, 1, 1, 1, 1, 1,
0.4292277, -1.804882, 2.962798, 1, 1, 1, 1, 1,
0.430754, 1.733197, 0.4944835, 1, 1, 1, 1, 1,
0.4315479, 1.627654, 0.3135406, 1, 1, 1, 1, 1,
0.4328547, 0.7559546, -0.9355053, 1, 1, 1, 1, 1,
0.4334552, 1.498436, 0.2991299, 1, 1, 1, 1, 1,
0.4441194, -0.05467854, 0.1992397, 1, 1, 1, 1, 1,
0.4452641, 0.314347, -1.273242, 1, 1, 1, 1, 1,
0.4462413, 1.619488, 0.668591, 1, 1, 1, 1, 1,
0.4530844, 0.3080765, 0.7643895, 1, 1, 1, 1, 1,
0.4532498, 0.2058954, 1.468256, 1, 1, 1, 1, 1,
0.4563073, -1.704905, 3.355414, 1, 1, 1, 1, 1,
0.4576235, -1.769944, 0.7920696, 1, 1, 1, 1, 1,
0.4578598, 1.056849, 2.175883, 1, 1, 1, 1, 1,
0.4642155, 0.0668868, 1.739396, 1, 1, 1, 1, 1,
0.4676076, 0.9294932, 0.946249, 0, 0, 1, 1, 1,
0.4723779, -0.5676952, 4.362038, 1, 0, 0, 1, 1,
0.4731635, -1.401862, 3.903746, 1, 0, 0, 1, 1,
0.4745823, 0.2402579, 0.5300242, 1, 0, 0, 1, 1,
0.476825, -1.889843, 2.849817, 1, 0, 0, 1, 1,
0.4834827, -0.6109076, 2.591915, 1, 0, 0, 1, 1,
0.491784, 0.4041546, 0.5575284, 0, 0, 0, 1, 1,
0.4924349, 0.7871199, 0.3622897, 0, 0, 0, 1, 1,
0.4942437, -1.36296, 1.449646, 0, 0, 0, 1, 1,
0.4948413, 1.240562, 0.2535797, 0, 0, 0, 1, 1,
0.4952646, 1.672874, -0.5163318, 0, 0, 0, 1, 1,
0.4960198, 0.591068, -1.054482, 0, 0, 0, 1, 1,
0.497633, -0.410441, 1.425688, 0, 0, 0, 1, 1,
0.4994079, -0.5988873, 2.859475, 1, 1, 1, 1, 1,
0.5023078, 1.295873, 0.927619, 1, 1, 1, 1, 1,
0.5043455, 0.9120181, 0.4918983, 1, 1, 1, 1, 1,
0.5046992, 0.09725893, -1.563287, 1, 1, 1, 1, 1,
0.5054121, 1.316759, 0.2660636, 1, 1, 1, 1, 1,
0.5067791, -0.1487198, 0.5657171, 1, 1, 1, 1, 1,
0.5135239, -1.325362, 1.917299, 1, 1, 1, 1, 1,
0.5144532, -0.06502336, 3.266205, 1, 1, 1, 1, 1,
0.5161064, -0.3525217, 1.598872, 1, 1, 1, 1, 1,
0.5167252, -0.8867142, 2.78756, 1, 1, 1, 1, 1,
0.5171822, -0.429639, 3.410348, 1, 1, 1, 1, 1,
0.5173521, 0.5724227, 0.3798432, 1, 1, 1, 1, 1,
0.5195619, 0.1673141, 1.165745, 1, 1, 1, 1, 1,
0.519739, -0.3137831, 2.1403, 1, 1, 1, 1, 1,
0.5212838, 1.222097, -1.060623, 1, 1, 1, 1, 1,
0.5214589, -0.4015879, 1.469532, 0, 0, 1, 1, 1,
0.5225903, -0.8849182, 3.125025, 1, 0, 0, 1, 1,
0.5239936, -0.924557, 3.795922, 1, 0, 0, 1, 1,
0.5251073, 0.4162971, 2.257394, 1, 0, 0, 1, 1,
0.5253487, 0.1010007, 0.8463593, 1, 0, 0, 1, 1,
0.53326, 0.0688557, 1.673844, 1, 0, 0, 1, 1,
0.5339202, -0.6815166, 0.7665862, 0, 0, 0, 1, 1,
0.5387644, -0.8646055, 1.208623, 0, 0, 0, 1, 1,
0.5435522, -0.09945423, 0.8422357, 0, 0, 0, 1, 1,
0.5452917, -0.2122374, 1.855464, 0, 0, 0, 1, 1,
0.5469351, -1.039634, 1.990827, 0, 0, 0, 1, 1,
0.5541613, -0.4865428, 0.3968463, 0, 0, 0, 1, 1,
0.5544474, -0.4008297, 0.5089417, 0, 0, 0, 1, 1,
0.557003, 1.380119, 0.429472, 1, 1, 1, 1, 1,
0.5570205, 0.1144156, 0.002006944, 1, 1, 1, 1, 1,
0.5621479, -0.160652, 1.096769, 1, 1, 1, 1, 1,
0.5682004, -0.7110214, 3.556615, 1, 1, 1, 1, 1,
0.5683517, 0.6103193, -0.120741, 1, 1, 1, 1, 1,
0.568381, 0.4766212, 1.309671, 1, 1, 1, 1, 1,
0.5741091, 0.6395953, -0.3320486, 1, 1, 1, 1, 1,
0.5747876, -0.7375723, 1.419946, 1, 1, 1, 1, 1,
0.5755374, 0.441203, 0.9303251, 1, 1, 1, 1, 1,
0.5768239, -0.6313099, 2.477683, 1, 1, 1, 1, 1,
0.58033, -0.3076251, 3.355367, 1, 1, 1, 1, 1,
0.5812171, 0.2917118, 0.7985237, 1, 1, 1, 1, 1,
0.5833707, 1.6526, -0.2851186, 1, 1, 1, 1, 1,
0.5857413, -0.8950236, 1.781938, 1, 1, 1, 1, 1,
0.5863571, -0.9273399, 3.479398, 1, 1, 1, 1, 1,
0.5903828, -0.0244621, 2.87885, 0, 0, 1, 1, 1,
0.5941649, -0.375075, 1.204456, 1, 0, 0, 1, 1,
0.59699, 0.001520304, 0.2131292, 1, 0, 0, 1, 1,
0.6048782, 1.043591, 1.430032, 1, 0, 0, 1, 1,
0.6077591, 0.3701817, 1.667208, 1, 0, 0, 1, 1,
0.6102684, -1.138892, 3.656135, 1, 0, 0, 1, 1,
0.6132391, 0.8492037, 2.336554, 0, 0, 0, 1, 1,
0.6183296, 2.28223, 2.076557, 0, 0, 0, 1, 1,
0.6183506, -0.4015166, 2.404268, 0, 0, 0, 1, 1,
0.6200211, 0.8209403, 0.2173073, 0, 0, 0, 1, 1,
0.6208112, 0.8125979, 1.952653, 0, 0, 0, 1, 1,
0.6224458, -0.4324473, 2.707398, 0, 0, 0, 1, 1,
0.6231901, -0.2014682, 3.511824, 0, 0, 0, 1, 1,
0.6232517, -0.1216683, 0.9283218, 1, 1, 1, 1, 1,
0.6235173, 1.201985, -0.7873933, 1, 1, 1, 1, 1,
0.6246833, 0.8292243, 1.59899, 1, 1, 1, 1, 1,
0.6269942, -0.2880517, 2.188732, 1, 1, 1, 1, 1,
0.6283221, 0.4093632, 0.1431049, 1, 1, 1, 1, 1,
0.635981, 0.1945041, -0.4433034, 1, 1, 1, 1, 1,
0.637928, -0.3053339, 1.7493, 1, 1, 1, 1, 1,
0.6380002, 0.08903103, 3.133714, 1, 1, 1, 1, 1,
0.6402889, -0.8387004, 2.428533, 1, 1, 1, 1, 1,
0.6403412, -0.6975734, 3.02114, 1, 1, 1, 1, 1,
0.6449143, -0.4631508, 0.9648321, 1, 1, 1, 1, 1,
0.6455054, 1.040328, 0.5405474, 1, 1, 1, 1, 1,
0.6477556, -0.6146359, 3.535585, 1, 1, 1, 1, 1,
0.6479869, -0.01213716, 2.511636, 1, 1, 1, 1, 1,
0.6488802, -1.854506, 1.444106, 1, 1, 1, 1, 1,
0.6513947, -1.218223, 1.696082, 0, 0, 1, 1, 1,
0.6574113, -1.566671, 3.175319, 1, 0, 0, 1, 1,
0.6606363, -0.7164159, 2.72561, 1, 0, 0, 1, 1,
0.6628034, -0.04614307, 0.3163079, 1, 0, 0, 1, 1,
0.6650388, -0.7423554, 2.578308, 1, 0, 0, 1, 1,
0.6663339, 0.47853, 0.7545038, 1, 0, 0, 1, 1,
0.6669642, 1.114635, 2.975472, 0, 0, 0, 1, 1,
0.6743225, -1.181723, 1.753977, 0, 0, 0, 1, 1,
0.6762486, 1.544479, 0.2438339, 0, 0, 0, 1, 1,
0.6767273, 0.4357659, 0.4141237, 0, 0, 0, 1, 1,
0.6792277, 1.028143, -0.5922687, 0, 0, 0, 1, 1,
0.6814828, -0.6083008, 2.679366, 0, 0, 0, 1, 1,
0.6873208, -1.481514, 2.584825, 0, 0, 0, 1, 1,
0.6892878, 0.3331414, 0.6428308, 1, 1, 1, 1, 1,
0.6970766, -1.331221, 0.6889931, 1, 1, 1, 1, 1,
0.7018755, -0.5438784, 1.751709, 1, 1, 1, 1, 1,
0.7113054, -0.709583, 2.891944, 1, 1, 1, 1, 1,
0.71874, 0.8363416, 1.750085, 1, 1, 1, 1, 1,
0.7191749, 0.510404, 1.231987, 1, 1, 1, 1, 1,
0.7209121, -1.394112, 4.140925, 1, 1, 1, 1, 1,
0.7270537, 1.322185, 1.514, 1, 1, 1, 1, 1,
0.7323362, 1.022945, 0.05561848, 1, 1, 1, 1, 1,
0.7328364, -2.300592, 2.979322, 1, 1, 1, 1, 1,
0.7340829, -1.097019, 4.050022, 1, 1, 1, 1, 1,
0.7382371, -1.54924, 2.95838, 1, 1, 1, 1, 1,
0.7398128, -0.5706289, 1.743131, 1, 1, 1, 1, 1,
0.7444021, -0.1029803, 0.6123822, 1, 1, 1, 1, 1,
0.748512, -0.02978155, 2.127571, 1, 1, 1, 1, 1,
0.7529656, -0.4445474, 3.647038, 0, 0, 1, 1, 1,
0.7571265, 0.9870232, 0.6681979, 1, 0, 0, 1, 1,
0.7574838, -0.4505682, 1.565013, 1, 0, 0, 1, 1,
0.7604313, 0.2035923, -0.5614913, 1, 0, 0, 1, 1,
0.7629311, -1.24073, 2.209773, 1, 0, 0, 1, 1,
0.7642058, -0.4008936, 4.537735, 1, 0, 0, 1, 1,
0.7722324, 0.4686364, -0.3449635, 0, 0, 0, 1, 1,
0.7729048, -0.1765265, 1.607744, 0, 0, 0, 1, 1,
0.7772136, 0.3567239, 0.6083308, 0, 0, 0, 1, 1,
0.7778432, 0.08778543, 2.217971, 0, 0, 0, 1, 1,
0.7790622, 1.108104, 0.1358482, 0, 0, 0, 1, 1,
0.7927974, -1.245264, 3.390783, 0, 0, 0, 1, 1,
0.792832, 0.2263134, 0.8822183, 0, 0, 0, 1, 1,
0.7971595, 1.103677, -0.9815432, 1, 1, 1, 1, 1,
0.7980067, 0.6749463, 0.3705492, 1, 1, 1, 1, 1,
0.8128204, -0.4095183, 2.820258, 1, 1, 1, 1, 1,
0.812877, -0.236453, 2.304967, 1, 1, 1, 1, 1,
0.8397961, 0.5513442, 0.4997637, 1, 1, 1, 1, 1,
0.8415987, -0.03134783, 0.8578443, 1, 1, 1, 1, 1,
0.845898, 0.5594586, 0.5486376, 1, 1, 1, 1, 1,
0.8510748, 0.5101172, 0.4024252, 1, 1, 1, 1, 1,
0.8566058, 0.881956, 1.980102, 1, 1, 1, 1, 1,
0.8569622, -0.4603427, 3.074089, 1, 1, 1, 1, 1,
0.8692676, -0.7517346, 2.392241, 1, 1, 1, 1, 1,
0.8766052, -0.8672928, 2.173107, 1, 1, 1, 1, 1,
0.8785118, 0.5843206, 4.046319, 1, 1, 1, 1, 1,
0.8841355, 0.3982851, -0.9396812, 1, 1, 1, 1, 1,
0.886969, 0.2893652, 0.5788058, 1, 1, 1, 1, 1,
0.8875182, 0.3253238, 1.571488, 0, 0, 1, 1, 1,
0.8884185, -0.5075299, 0.586273, 1, 0, 0, 1, 1,
0.88982, 1.165993, 1.554112, 1, 0, 0, 1, 1,
0.8985336, 0.06774066, 1.972982, 1, 0, 0, 1, 1,
0.906603, 1.666225, 0.2667672, 1, 0, 0, 1, 1,
0.9105459, 2.707101, 0.4571223, 1, 0, 0, 1, 1,
0.9142283, -0.9023387, 0.5013989, 0, 0, 0, 1, 1,
0.9143361, 0.1845214, 1.550035, 0, 0, 0, 1, 1,
0.9191734, -0.3226793, 1.342653, 0, 0, 0, 1, 1,
0.9197894, -0.7142993, 2.494852, 0, 0, 0, 1, 1,
0.9220328, -1.244921, 1.703333, 0, 0, 0, 1, 1,
0.9223309, -0.7764329, -0.3785656, 0, 0, 0, 1, 1,
0.9330743, -0.3539107, 2.831621, 0, 0, 0, 1, 1,
0.9333239, -1.598125, 3.208933, 1, 1, 1, 1, 1,
0.9438148, 0.642828, 1.552058, 1, 1, 1, 1, 1,
0.9452838, 0.2498793, 1.455877, 1, 1, 1, 1, 1,
0.9490471, -0.6815233, 2.768011, 1, 1, 1, 1, 1,
0.9525838, 0.7093399, 0.933201, 1, 1, 1, 1, 1,
0.9569148, -0.03292572, 1.493378, 1, 1, 1, 1, 1,
0.9604819, -0.5341809, 2.083679, 1, 1, 1, 1, 1,
0.9635262, 1.55919, -0.6369019, 1, 1, 1, 1, 1,
0.9693242, 0.4802335, 0.2612879, 1, 1, 1, 1, 1,
0.9840531, -1.512934, 3.267738, 1, 1, 1, 1, 1,
0.9902707, 0.2216038, 1.893929, 1, 1, 1, 1, 1,
0.9913564, -1.361334, 4.136934, 1, 1, 1, 1, 1,
0.9964589, -1.158058, 2.761029, 1, 1, 1, 1, 1,
0.9970782, -0.1210584, 0.9295821, 1, 1, 1, 1, 1,
1.001042, 0.9535676, -0.124629, 1, 1, 1, 1, 1,
1.001364, 0.5074383, 0.1165619, 0, 0, 1, 1, 1,
1.003751, -0.3387716, 0.749399, 1, 0, 0, 1, 1,
1.005794, 0.1253937, 1.206904, 1, 0, 0, 1, 1,
1.008411, 0.7787938, 0.4062973, 1, 0, 0, 1, 1,
1.012865, 0.7434629, 0.7986888, 1, 0, 0, 1, 1,
1.027455, 0.3261153, 0.4627596, 1, 0, 0, 1, 1,
1.034817, -0.2627255, 3.544282, 0, 0, 0, 1, 1,
1.036302, 0.2428906, 0.903421, 0, 0, 0, 1, 1,
1.04025, 0.9333106, -0.07266381, 0, 0, 0, 1, 1,
1.045124, -0.06753694, 1.315707, 0, 0, 0, 1, 1,
1.048538, -0.9626203, 0.9010989, 0, 0, 0, 1, 1,
1.058833, 1.790125, 2.184757, 0, 0, 0, 1, 1,
1.059774, -1.012119, 1.397744, 0, 0, 0, 1, 1,
1.067616, -0.6820863, 1.120806, 1, 1, 1, 1, 1,
1.069429, -0.328986, 2.3837, 1, 1, 1, 1, 1,
1.083246, 0.5901758, 1.079494, 1, 1, 1, 1, 1,
1.092405, 0.03736701, 1.53629, 1, 1, 1, 1, 1,
1.092736, 1.332022, 1.447912, 1, 1, 1, 1, 1,
1.093142, -0.1997944, 1.302343, 1, 1, 1, 1, 1,
1.093957, 1.152886, 1.796402, 1, 1, 1, 1, 1,
1.102178, -0.7982172, 3.11311, 1, 1, 1, 1, 1,
1.106743, 0.7732279, 0.2887566, 1, 1, 1, 1, 1,
1.109481, -0.6702161, 1.974523, 1, 1, 1, 1, 1,
1.111473, -0.8406799, 3.528502, 1, 1, 1, 1, 1,
1.113039, -1.837723, 2.49012, 1, 1, 1, 1, 1,
1.11465, -1.094977, 1.558515, 1, 1, 1, 1, 1,
1.114816, 0.2037099, 2.195965, 1, 1, 1, 1, 1,
1.12326, 1.220469, 0.2913841, 1, 1, 1, 1, 1,
1.126221, -1.776298, 3.392055, 0, 0, 1, 1, 1,
1.12908, -0.752802, 0.845924, 1, 0, 0, 1, 1,
1.130562, -0.3796104, 1.767719, 1, 0, 0, 1, 1,
1.134791, -0.6564287, 3.069951, 1, 0, 0, 1, 1,
1.143162, 0.4018704, 3.675161, 1, 0, 0, 1, 1,
1.15037, 0.1581764, 2.021444, 1, 0, 0, 1, 1,
1.170516, -0.4779258, 2.648599, 0, 0, 0, 1, 1,
1.17746, -1.41082, 2.468094, 0, 0, 0, 1, 1,
1.178242, -0.1996514, 1.480386, 0, 0, 0, 1, 1,
1.179322, 1.003817, 0.5091207, 0, 0, 0, 1, 1,
1.180861, 0.3857904, 2.750639, 0, 0, 0, 1, 1,
1.182289, 0.2571736, -0.9291238, 0, 0, 0, 1, 1,
1.187003, -0.5326043, 2.338743, 0, 0, 0, 1, 1,
1.198837, -1.277138, 2.781289, 1, 1, 1, 1, 1,
1.202634, 1.319977, -2.056626, 1, 1, 1, 1, 1,
1.203337, 0.2304778, -0.2206864, 1, 1, 1, 1, 1,
1.218907, -0.9289302, 3.285991, 1, 1, 1, 1, 1,
1.231689, -0.4418938, 3.801305, 1, 1, 1, 1, 1,
1.233686, -0.1926126, 2.58981, 1, 1, 1, 1, 1,
1.238101, -0.5562267, 1.575661, 1, 1, 1, 1, 1,
1.239835, -0.3857009, -0.2225392, 1, 1, 1, 1, 1,
1.248794, -0.7668434, 2.057478, 1, 1, 1, 1, 1,
1.249096, -2.003222, 2.909773, 1, 1, 1, 1, 1,
1.253183, -1.214513, 2.294856, 1, 1, 1, 1, 1,
1.254121, 1.472171, -0.7092384, 1, 1, 1, 1, 1,
1.263978, 0.1316223, 2.210768, 1, 1, 1, 1, 1,
1.277492, 1.587814, -0.04060685, 1, 1, 1, 1, 1,
1.284084, 0.8542876, 2.800815, 1, 1, 1, 1, 1,
1.300367, -0.6010898, 1.079768, 0, 0, 1, 1, 1,
1.30226, -0.1453922, 0.7723553, 1, 0, 0, 1, 1,
1.303694, 0.595964, 1.498542, 1, 0, 0, 1, 1,
1.30665, 1.203468, 1.076171, 1, 0, 0, 1, 1,
1.309959, -0.3194649, 1.849833, 1, 0, 0, 1, 1,
1.318458, -0.1705305, 2.641472, 1, 0, 0, 1, 1,
1.321539, 0.11264, 1.326595, 0, 0, 0, 1, 1,
1.338847, 1.058654, 1.754052, 0, 0, 0, 1, 1,
1.343064, -0.40668, 2.642009, 0, 0, 0, 1, 1,
1.34543, -0.5500376, 1.179388, 0, 0, 0, 1, 1,
1.352547, -0.1752274, 2.051303, 0, 0, 0, 1, 1,
1.353032, -0.3668277, 2.543189, 0, 0, 0, 1, 1,
1.353159, 0.7769741, 1.081161, 0, 0, 0, 1, 1,
1.358264, -1.274436, 0.8531781, 1, 1, 1, 1, 1,
1.359424, -0.4181362, 2.68807, 1, 1, 1, 1, 1,
1.360073, -0.8372439, 3.661434, 1, 1, 1, 1, 1,
1.363875, 1.267275, 0.06097867, 1, 1, 1, 1, 1,
1.364473, -1.296109, 1.884185, 1, 1, 1, 1, 1,
1.382049, -1.710768, 1.717829, 1, 1, 1, 1, 1,
1.398439, -0.04699458, 1.503528, 1, 1, 1, 1, 1,
1.402902, -0.08500685, 2.332661, 1, 1, 1, 1, 1,
1.407171, -0.06448636, 1.926238, 1, 1, 1, 1, 1,
1.40858, 0.6424308, 1.525534, 1, 1, 1, 1, 1,
1.417077, -0.1834942, 1.059187, 1, 1, 1, 1, 1,
1.425219, -0.3029304, 1.518249, 1, 1, 1, 1, 1,
1.429973, 0.4502891, 2.726884, 1, 1, 1, 1, 1,
1.431819, -0.8756218, 3.266578, 1, 1, 1, 1, 1,
1.449022, 1.774974, 0.7622617, 1, 1, 1, 1, 1,
1.449294, -1.815497, 2.69549, 0, 0, 1, 1, 1,
1.462389, 0.5427353, 2.666932, 1, 0, 0, 1, 1,
1.465479, 1.423599, 1.331133, 1, 0, 0, 1, 1,
1.47381, 0.4393764, 1.391523, 1, 0, 0, 1, 1,
1.481463, -1.496696, 2.42605, 1, 0, 0, 1, 1,
1.4936, 0.3182555, 0.2209988, 1, 0, 0, 1, 1,
1.501362, 0.8622836, 0.3896047, 0, 0, 0, 1, 1,
1.504439, -1.693671, 1.955238, 0, 0, 0, 1, 1,
1.505817, -1.770145, 2.018648, 0, 0, 0, 1, 1,
1.508485, -1.175434, 3.28497, 0, 0, 0, 1, 1,
1.516799, -1.523567, 1.937072, 0, 0, 0, 1, 1,
1.519173, -0.3378021, 1.871779, 0, 0, 0, 1, 1,
1.522665, 0.4799814, 0.4556849, 0, 0, 0, 1, 1,
1.541564, -0.5606167, 0.7962667, 1, 1, 1, 1, 1,
1.542898, -1.71394, 1.468816, 1, 1, 1, 1, 1,
1.548869, 1.008039, 0.6278357, 1, 1, 1, 1, 1,
1.557404, 0.2122246, 0.4684517, 1, 1, 1, 1, 1,
1.566793, -0.404315, 0.3741415, 1, 1, 1, 1, 1,
1.574738, 0.3091366, 2.494175, 1, 1, 1, 1, 1,
1.613846, 0.3616249, 0.1792504, 1, 1, 1, 1, 1,
1.620229, 0.483867, 0.4615974, 1, 1, 1, 1, 1,
1.621241, 1.003927, 2.400134, 1, 1, 1, 1, 1,
1.633082, 0.7620703, 0.6508031, 1, 1, 1, 1, 1,
1.654446, -0.829747, 2.32475, 1, 1, 1, 1, 1,
1.666644, -0.7150951, 1.929443, 1, 1, 1, 1, 1,
1.676329, 0.4937637, 0.2008856, 1, 1, 1, 1, 1,
1.679973, 0.6804591, 2.063593, 1, 1, 1, 1, 1,
1.69468, 0.8405282, 2.510736, 1, 1, 1, 1, 1,
1.720934, 0.04095659, 1.277045, 0, 0, 1, 1, 1,
1.742191, 0.1295894, 1.193326, 1, 0, 0, 1, 1,
1.748587, -0.6848635, 1.498353, 1, 0, 0, 1, 1,
1.750525, -0.8896669, 2.063322, 1, 0, 0, 1, 1,
1.765857, -0.3525171, 3.111914, 1, 0, 0, 1, 1,
1.768221, -0.5339321, 3.210274, 1, 0, 0, 1, 1,
1.769525, -1.073629, 2.621455, 0, 0, 0, 1, 1,
1.797245, 1.177777, -0.3764, 0, 0, 0, 1, 1,
1.804884, -0.1339727, 3.607185, 0, 0, 0, 1, 1,
1.815419, 1.298124, 1.105853, 0, 0, 0, 1, 1,
1.819553, -0.9957171, 1.785893, 0, 0, 0, 1, 1,
1.81977, 0.1131256, 0.8642853, 0, 0, 0, 1, 1,
1.833033, 0.06816994, 1.535812, 0, 0, 0, 1, 1,
1.834384, 1.033138, 1.294839, 1, 1, 1, 1, 1,
1.845341, 0.3603328, 1.70347, 1, 1, 1, 1, 1,
1.888793, 2.175562, -0.2118602, 1, 1, 1, 1, 1,
1.904369, 0.0134299, 0.2470943, 1, 1, 1, 1, 1,
1.913922, 0.1901686, 1.917967, 1, 1, 1, 1, 1,
1.917558, 0.3067518, 1.266799, 1, 1, 1, 1, 1,
1.943227, 0.6106328, -0.2559422, 1, 1, 1, 1, 1,
1.949494, -1.133393, 2.546278, 1, 1, 1, 1, 1,
1.961696, -0.4252966, 1.944098, 1, 1, 1, 1, 1,
1.973151, 0.5225011, 0.1227887, 1, 1, 1, 1, 1,
1.977874, 0.3859143, 0.8313558, 1, 1, 1, 1, 1,
1.989583, -0.6854253, 2.500809, 1, 1, 1, 1, 1,
2.00748, -1.970393, 2.035656, 1, 1, 1, 1, 1,
2.018602, -0.3186026, 1.103977, 1, 1, 1, 1, 1,
2.036849, -1.189459, 1.642957, 1, 1, 1, 1, 1,
2.05064, 0.9142264, 1.443171, 0, 0, 1, 1, 1,
2.063817, 0.4427746, 1.430728, 1, 0, 0, 1, 1,
2.065274, -0.0431929, 1.578157, 1, 0, 0, 1, 1,
2.066185, 0.9873893, -0.5904957, 1, 0, 0, 1, 1,
2.071892, 1.576599, 1.019824, 1, 0, 0, 1, 1,
2.089772, 0.5209354, 1.497962, 1, 0, 0, 1, 1,
2.104044, -0.550319, 2.593185, 0, 0, 0, 1, 1,
2.120696, 0.3064315, 0.7144393, 0, 0, 0, 1, 1,
2.129432, -0.6779124, 2.04363, 0, 0, 0, 1, 1,
2.1425, -0.5779552, -0.8632137, 0, 0, 0, 1, 1,
2.213956, -0.3999307, 2.063934, 0, 0, 0, 1, 1,
2.220627, 0.3501568, 1.505589, 0, 0, 0, 1, 1,
2.253219, -0.04500401, 1.460269, 0, 0, 0, 1, 1,
2.278472, 0.6866993, 1.460812, 1, 1, 1, 1, 1,
2.311017, -1.120986, 0.126404, 1, 1, 1, 1, 1,
2.383482, 1.000062, 1.233883, 1, 1, 1, 1, 1,
2.440273, 0.3718314, 2.564683, 1, 1, 1, 1, 1,
2.447419, -1.265357, 0.2432983, 1, 1, 1, 1, 1,
2.630957, 1.076453, 0.6588695, 1, 1, 1, 1, 1,
2.866926, -0.9524663, 2.277654, 1, 1, 1, 1, 1
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
var radius = 8.815618;
var distance = 30.96449;
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
mvMatrix.translate( -0.1137857, 0.07388341, 0.01013088 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -30.96449);
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
