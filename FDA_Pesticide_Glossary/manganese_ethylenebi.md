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
-3.790902, 1.970287, -1.958699, 1, 0, 0, 1,
-2.973759, 1.153973, -1.067171, 1, 0.007843138, 0, 1,
-2.969218, -0.2081515, -1.270144, 1, 0.01176471, 0, 1,
-2.959797, -0.7294902, -2.491985, 1, 0.01960784, 0, 1,
-2.908607, -0.5084171, -1.935265, 1, 0.02352941, 0, 1,
-2.801722, 1.440389, -2.55319, 1, 0.03137255, 0, 1,
-2.723164, 0.03163165, -0.5906535, 1, 0.03529412, 0, 1,
-2.716054, 0.7721306, -0.590404, 1, 0.04313726, 0, 1,
-2.713453, 2.860861, -0.7418619, 1, 0.04705882, 0, 1,
-2.691965, 0.6118057, -2.064038, 1, 0.05490196, 0, 1,
-2.634448, -0.4901448, -1.079187, 1, 0.05882353, 0, 1,
-2.627861, -0.1794592, -3.300647, 1, 0.06666667, 0, 1,
-2.528493, 0.5603024, -2.183211, 1, 0.07058824, 0, 1,
-2.513711, -2.787075, -2.773957, 1, 0.07843138, 0, 1,
-2.393927, 0.05501327, -0.5042395, 1, 0.08235294, 0, 1,
-2.2938, 1.161207, -2.315533, 1, 0.09019608, 0, 1,
-2.264286, 0.4434469, -2.031313, 1, 0.09411765, 0, 1,
-2.255011, -0.08891824, -1.429729, 1, 0.1019608, 0, 1,
-2.251963, 0.3121564, -1.114468, 1, 0.1098039, 0, 1,
-2.248194, 0.4564664, -1.803965, 1, 0.1137255, 0, 1,
-2.248059, -1.406499, -0.7714049, 1, 0.1215686, 0, 1,
-2.194306, 0.5226473, -1.737749, 1, 0.1254902, 0, 1,
-2.167829, 0.5651515, -1.196706, 1, 0.1333333, 0, 1,
-2.150445, -1.344561, -1.737528, 1, 0.1372549, 0, 1,
-2.133872, 0.4634559, -0.8715243, 1, 0.145098, 0, 1,
-2.102445, -0.3946072, -2.060212, 1, 0.1490196, 0, 1,
-2.094234, -2.472014, -3.09502, 1, 0.1568628, 0, 1,
-2.070652, -1.620453, -1.286079, 1, 0.1607843, 0, 1,
-2.044134, -1.258712, -0.4686122, 1, 0.1686275, 0, 1,
-2.016918, 0.9304896, -1.372921, 1, 0.172549, 0, 1,
-1.996003, 1.226457, -1.256354, 1, 0.1803922, 0, 1,
-1.98803, -0.277576, -1.725302, 1, 0.1843137, 0, 1,
-1.979495, 0.4954261, -1.25682, 1, 0.1921569, 0, 1,
-1.953942, 0.9645802, -1.995289, 1, 0.1960784, 0, 1,
-1.940251, -0.3384068, -1.233916, 1, 0.2039216, 0, 1,
-1.878637, 0.4282072, 0.7937081, 1, 0.2117647, 0, 1,
-1.864511, 1.028358, 0.1793753, 1, 0.2156863, 0, 1,
-1.839953, -1.012541, -0.1423437, 1, 0.2235294, 0, 1,
-1.831659, -1.263119, -2.896301, 1, 0.227451, 0, 1,
-1.814071, -1.581784, -2.294833, 1, 0.2352941, 0, 1,
-1.798478, 0.547062, 0.06168219, 1, 0.2392157, 0, 1,
-1.793166, -0.4428814, -1.099614, 1, 0.2470588, 0, 1,
-1.774392, 1.525874, 0.5835657, 1, 0.2509804, 0, 1,
-1.773425, 0.7191556, -0.04679634, 1, 0.2588235, 0, 1,
-1.739877, 0.3975301, -2.405248, 1, 0.2627451, 0, 1,
-1.739099, -0.1197506, -0.8270164, 1, 0.2705882, 0, 1,
-1.73465, -1.56409, -1.467754, 1, 0.2745098, 0, 1,
-1.727407, 0.6267029, -1.614526, 1, 0.282353, 0, 1,
-1.725137, 1.428425, 0.4631933, 1, 0.2862745, 0, 1,
-1.724086, -0.4014108, -0.8752704, 1, 0.2941177, 0, 1,
-1.719357, 0.174243, 0.5349647, 1, 0.3019608, 0, 1,
-1.717947, -0.5787953, -2.305201, 1, 0.3058824, 0, 1,
-1.691678, -1.067119, -0.3226234, 1, 0.3137255, 0, 1,
-1.684117, -1.613692, -4.195553, 1, 0.3176471, 0, 1,
-1.682886, 0.3068536, -3.294447, 1, 0.3254902, 0, 1,
-1.674383, 0.7141557, -1.652341, 1, 0.3294118, 0, 1,
-1.658021, -0.8078062, -2.710956, 1, 0.3372549, 0, 1,
-1.656368, 2.269401, 1.001935, 1, 0.3411765, 0, 1,
-1.655801, 0.3365592, -2.441814, 1, 0.3490196, 0, 1,
-1.653451, 1.047719, -0.1539283, 1, 0.3529412, 0, 1,
-1.64004, 1.466668, -1.119333, 1, 0.3607843, 0, 1,
-1.636652, -1.896383, -2.977547, 1, 0.3647059, 0, 1,
-1.625878, -2.118749, -2.098358, 1, 0.372549, 0, 1,
-1.62234, -0.1382088, -2.490398, 1, 0.3764706, 0, 1,
-1.591488, 1.321781, -1.668368, 1, 0.3843137, 0, 1,
-1.589652, 1.403735, -0.8814798, 1, 0.3882353, 0, 1,
-1.57338, -0.6846336, -1.037945, 1, 0.3960784, 0, 1,
-1.56907, 0.3805177, -1.202485, 1, 0.4039216, 0, 1,
-1.56598, -1.03861, -3.328278, 1, 0.4078431, 0, 1,
-1.560315, -1.075673, -2.87706, 1, 0.4156863, 0, 1,
-1.551965, -0.487585, -2.386194, 1, 0.4196078, 0, 1,
-1.542712, 0.3619318, -2.091943, 1, 0.427451, 0, 1,
-1.530539, -1.219332, -1.57866, 1, 0.4313726, 0, 1,
-1.521426, 1.446096, 0.7575572, 1, 0.4392157, 0, 1,
-1.518098, -1.553232, -3.373839, 1, 0.4431373, 0, 1,
-1.515838, -0.8772982, -1.829311, 1, 0.4509804, 0, 1,
-1.514875, -0.1694071, -2.269955, 1, 0.454902, 0, 1,
-1.510675, 0.6005747, -2.096999, 1, 0.4627451, 0, 1,
-1.504733, 0.8650456, -1.676898, 1, 0.4666667, 0, 1,
-1.493216, -0.3234042, -1.658094, 1, 0.4745098, 0, 1,
-1.482965, -0.2784405, -0.2206193, 1, 0.4784314, 0, 1,
-1.474448, -0.1549337, -2.452109, 1, 0.4862745, 0, 1,
-1.468364, 0.0641418, -2.21417, 1, 0.4901961, 0, 1,
-1.464948, -0.4964622, -1.882587, 1, 0.4980392, 0, 1,
-1.450983, -0.616568, -0.9790519, 1, 0.5058824, 0, 1,
-1.450449, 1.404548, -0.09811749, 1, 0.509804, 0, 1,
-1.449842, 1.925059, 0.03286922, 1, 0.5176471, 0, 1,
-1.448248, -0.9925371, -2.719654, 1, 0.5215687, 0, 1,
-1.433911, -1.09673, -2.505464, 1, 0.5294118, 0, 1,
-1.424614, -2.849401, -2.086211, 1, 0.5333334, 0, 1,
-1.41788, -0.02130561, -4.070505, 1, 0.5411765, 0, 1,
-1.415905, 0.7070979, -0.3979931, 1, 0.5450981, 0, 1,
-1.410507, 0.1821921, -0.9489869, 1, 0.5529412, 0, 1,
-1.408291, -0.9901503, -3.02581, 1, 0.5568628, 0, 1,
-1.407877, 0.08895487, -1.874764, 1, 0.5647059, 0, 1,
-1.405077, 0.08137511, 0.1773207, 1, 0.5686275, 0, 1,
-1.374507, -0.6023847, -1.721866, 1, 0.5764706, 0, 1,
-1.364991, 1.156674, -2.391549, 1, 0.5803922, 0, 1,
-1.364205, 2.323336, -1.45762, 1, 0.5882353, 0, 1,
-1.352917, -1.351972, -2.218477, 1, 0.5921569, 0, 1,
-1.350894, -0.3062991, -2.009055, 1, 0.6, 0, 1,
-1.32455, 0.3427711, -0.4954539, 1, 0.6078432, 0, 1,
-1.31699, 0.7145156, -0.7414048, 1, 0.6117647, 0, 1,
-1.306845, -0.1800665, -1.034614, 1, 0.6196079, 0, 1,
-1.304101, 0.2058877, -2.971957, 1, 0.6235294, 0, 1,
-1.284731, 0.3391846, -1.00864, 1, 0.6313726, 0, 1,
-1.256756, -0.391495, -1.312018, 1, 0.6352941, 0, 1,
-1.256176, 0.8875635, -2.129447, 1, 0.6431373, 0, 1,
-1.256047, 0.7735246, 0.6138805, 1, 0.6470588, 0, 1,
-1.246983, -0.3646526, -2.452076, 1, 0.654902, 0, 1,
-1.239686, 0.04809374, -0.2639825, 1, 0.6588235, 0, 1,
-1.237459, -1.195446, -1.670492, 1, 0.6666667, 0, 1,
-1.230977, 0.1507956, -2.127789, 1, 0.6705883, 0, 1,
-1.229342, -1.379864, -2.617304, 1, 0.6784314, 0, 1,
-1.225793, -1.756265, -3.21845, 1, 0.682353, 0, 1,
-1.221238, -0.3036105, -2.1154, 1, 0.6901961, 0, 1,
-1.218829, 0.3285914, -0.641386, 1, 0.6941177, 0, 1,
-1.217356, -1.145194, -3.571252, 1, 0.7019608, 0, 1,
-1.198435, -0.614188, -4.298693, 1, 0.7098039, 0, 1,
-1.191381, -1.491284, -0.8070665, 1, 0.7137255, 0, 1,
-1.190965, 1.799697, -0.6921273, 1, 0.7215686, 0, 1,
-1.189498, -0.1432332, -2.055325, 1, 0.7254902, 0, 1,
-1.189284, -0.3027798, -2.034011, 1, 0.7333333, 0, 1,
-1.187243, 0.4939321, -2.671152, 1, 0.7372549, 0, 1,
-1.187044, -1.310757, -2.200711, 1, 0.7450981, 0, 1,
-1.185111, 1.045653, -1.879159, 1, 0.7490196, 0, 1,
-1.185045, 1.980427, -0.3412523, 1, 0.7568628, 0, 1,
-1.184768, 0.2184695, -0.1528883, 1, 0.7607843, 0, 1,
-1.179424, -1.537657, -3.582449, 1, 0.7686275, 0, 1,
-1.175516, -0.1254324, -2.338812, 1, 0.772549, 0, 1,
-1.170451, 0.4986717, -1.631643, 1, 0.7803922, 0, 1,
-1.162554, -0.4864185, -3.076856, 1, 0.7843137, 0, 1,
-1.158389, -0.6066618, -1.678676, 1, 0.7921569, 0, 1,
-1.158253, 0.613618, 0.9393412, 1, 0.7960784, 0, 1,
-1.153133, -0.7238248, -1.351751, 1, 0.8039216, 0, 1,
-1.143004, 0.3828637, 0.005694692, 1, 0.8117647, 0, 1,
-1.141101, 1.050955, 0.4720722, 1, 0.8156863, 0, 1,
-1.135612, -0.3829001, -1.447654, 1, 0.8235294, 0, 1,
-1.123344, 0.387652, -1.345489, 1, 0.827451, 0, 1,
-1.118742, -0.8223606, -1.69965, 1, 0.8352941, 0, 1,
-1.111915, -0.1048832, -1.542796, 1, 0.8392157, 0, 1,
-1.10827, -2.110004, -0.7193535, 1, 0.8470588, 0, 1,
-1.107356, -0.3543833, -0.5784082, 1, 0.8509804, 0, 1,
-1.102799, -0.5639575, -2.950091, 1, 0.8588235, 0, 1,
-1.101797, 0.2958809, -0.6397572, 1, 0.8627451, 0, 1,
-1.090503, 1.270077, -0.1481514, 1, 0.8705882, 0, 1,
-1.085887, 1.655751, 1.121055, 1, 0.8745098, 0, 1,
-1.083815, -0.3068876, -0.4127198, 1, 0.8823529, 0, 1,
-1.068508, 0.21785, -2.085404, 1, 0.8862745, 0, 1,
-1.067908, 0.9307387, -0.1060793, 1, 0.8941177, 0, 1,
-1.066352, -0.1126806, -2.808149, 1, 0.8980392, 0, 1,
-1.064015, 2.031995, -0.684018, 1, 0.9058824, 0, 1,
-1.059135, -0.3796239, -1.661881, 1, 0.9137255, 0, 1,
-1.051153, 0.516071, -1.528614, 1, 0.9176471, 0, 1,
-1.050427, -0.3233819, -2.850327, 1, 0.9254902, 0, 1,
-1.047685, 1.465251, -0.7492263, 1, 0.9294118, 0, 1,
-1.044486, 1.080718, -2.164564, 1, 0.9372549, 0, 1,
-1.040979, 1.65656, -1.574666, 1, 0.9411765, 0, 1,
-1.037351, 0.337036, -4.397341, 1, 0.9490196, 0, 1,
-1.036145, 0.9122605, -2.289442, 1, 0.9529412, 0, 1,
-1.028607, -1.392577, -2.060635, 1, 0.9607843, 0, 1,
-1.021184, -1.20662, -2.68698, 1, 0.9647059, 0, 1,
-1.016119, -0.4588443, -2.587066, 1, 0.972549, 0, 1,
-1.015586, 0.7157977, -2.241152, 1, 0.9764706, 0, 1,
-1.014723, 1.443054, 0.2453255, 1, 0.9843137, 0, 1,
-1.012708, -0.7035765, 0.3598527, 1, 0.9882353, 0, 1,
-1.012439, -1.534773, -1.378513, 1, 0.9960784, 0, 1,
-1.006455, 0.5343117, -1.215329, 0.9960784, 1, 0, 1,
-0.9957532, -2.051106, -3.18206, 0.9921569, 1, 0, 1,
-0.9942316, 0.3254989, -2.213046, 0.9843137, 1, 0, 1,
-0.9904459, -0.5733362, -0.8997424, 0.9803922, 1, 0, 1,
-0.9888867, -0.06637565, -1.967088, 0.972549, 1, 0, 1,
-0.9788545, -0.2522041, -2.841686, 0.9686275, 1, 0, 1,
-0.9776109, -0.9282448, -2.113431, 0.9607843, 1, 0, 1,
-0.9775878, -0.02124898, -3.559176, 0.9568627, 1, 0, 1,
-0.9684222, 0.3680994, -1.203928, 0.9490196, 1, 0, 1,
-0.9681008, 0.9112282, -2.00829, 0.945098, 1, 0, 1,
-0.9651509, 1.411593, -1.916078, 0.9372549, 1, 0, 1,
-0.9516764, 1.316671, -1.455595, 0.9333333, 1, 0, 1,
-0.9511434, 0.9581317, -1.391375, 0.9254902, 1, 0, 1,
-0.9458128, 1.019151, -1.502394, 0.9215686, 1, 0, 1,
-0.94192, -0.2411089, -2.912795, 0.9137255, 1, 0, 1,
-0.9321681, -0.422351, -2.980309, 0.9098039, 1, 0, 1,
-0.9248318, -1.036335, -2.159871, 0.9019608, 1, 0, 1,
-0.9146049, -0.5070101, -0.7199556, 0.8941177, 1, 0, 1,
-0.9103842, -0.1453385, -0.03387359, 0.8901961, 1, 0, 1,
-0.9099377, 0.9447021, -0.9787716, 0.8823529, 1, 0, 1,
-0.9079572, 0.2836739, -1.212367, 0.8784314, 1, 0, 1,
-0.9071801, 0.3636566, -1.05487, 0.8705882, 1, 0, 1,
-0.9053341, 0.2525497, -2.439271, 0.8666667, 1, 0, 1,
-0.8913614, -1.46795, -4.442255, 0.8588235, 1, 0, 1,
-0.8873709, 0.03521835, -2.009443, 0.854902, 1, 0, 1,
-0.8815084, -0.9025086, -4.133138, 0.8470588, 1, 0, 1,
-0.8814092, 1.158299, -1.234693, 0.8431373, 1, 0, 1,
-0.8795393, 0.7248839, -0.9070785, 0.8352941, 1, 0, 1,
-0.877299, 0.8349798, -0.6947135, 0.8313726, 1, 0, 1,
-0.8770995, -0.271266, -2.450914, 0.8235294, 1, 0, 1,
-0.8740547, 0.1559088, -2.989506, 0.8196079, 1, 0, 1,
-0.8731423, 0.8772404, -0.8770031, 0.8117647, 1, 0, 1,
-0.8680159, 0.9914423, -0.2397084, 0.8078431, 1, 0, 1,
-0.8627776, -1.968139, -2.091841, 0.8, 1, 0, 1,
-0.8593469, -1.241286, -1.788069, 0.7921569, 1, 0, 1,
-0.8570741, -1.98408, -2.592784, 0.7882353, 1, 0, 1,
-0.8555168, -0.9399092, -1.59181, 0.7803922, 1, 0, 1,
-0.8490836, 0.3742279, 0.2975766, 0.7764706, 1, 0, 1,
-0.843073, 1.288817, 0.5951616, 0.7686275, 1, 0, 1,
-0.8414654, -1.697066, -0.246046, 0.7647059, 1, 0, 1,
-0.8391812, -0.1287064, -2.032082, 0.7568628, 1, 0, 1,
-0.8314967, -0.8441626, -3.145647, 0.7529412, 1, 0, 1,
-0.8289794, 1.335346, -1.591003, 0.7450981, 1, 0, 1,
-0.82344, -0.1611361, -1.718367, 0.7411765, 1, 0, 1,
-0.8214422, -0.3248386, -1.803723, 0.7333333, 1, 0, 1,
-0.8169366, 1.799158, 0.681462, 0.7294118, 1, 0, 1,
-0.8151555, 1.249866, -1.950103, 0.7215686, 1, 0, 1,
-0.8146844, 1.008578, 0.6511238, 0.7176471, 1, 0, 1,
-0.810109, 0.739774, -1.03905, 0.7098039, 1, 0, 1,
-0.810041, -0.3705475, -2.468883, 0.7058824, 1, 0, 1,
-0.809559, -0.2627551, -3.815713, 0.6980392, 1, 0, 1,
-0.8088139, 0.7827616, -1.137457, 0.6901961, 1, 0, 1,
-0.8073288, -1.025774, -3.59048, 0.6862745, 1, 0, 1,
-0.8054948, -0.3953324, -2.834824, 0.6784314, 1, 0, 1,
-0.8011225, -0.9692413, -3.068807, 0.6745098, 1, 0, 1,
-0.7993394, -0.5576562, -1.947234, 0.6666667, 1, 0, 1,
-0.797977, -0.03519723, 1.186976, 0.6627451, 1, 0, 1,
-0.7930766, 0.4822066, -2.515797, 0.654902, 1, 0, 1,
-0.7865188, 0.7666481, 0.06088446, 0.6509804, 1, 0, 1,
-0.786051, -0.8817221, -2.405589, 0.6431373, 1, 0, 1,
-0.7843381, 0.470633, -1.103617, 0.6392157, 1, 0, 1,
-0.7840415, -0.9197234, -1.952435, 0.6313726, 1, 0, 1,
-0.7764452, -0.3288183, -1.644916, 0.627451, 1, 0, 1,
-0.7750856, 0.5997108, -2.265802, 0.6196079, 1, 0, 1,
-0.7745512, 1.493512, -1.687222, 0.6156863, 1, 0, 1,
-0.7720399, 0.2826422, -2.491328, 0.6078432, 1, 0, 1,
-0.7681222, -0.2425838, -1.989276, 0.6039216, 1, 0, 1,
-0.7672366, -0.03767984, -3.418696, 0.5960785, 1, 0, 1,
-0.7665832, 2.602905, -0.3142362, 0.5882353, 1, 0, 1,
-0.7649773, 0.2969017, -0.6816726, 0.5843138, 1, 0, 1,
-0.7618544, 0.2675142, -0.907003, 0.5764706, 1, 0, 1,
-0.7569507, -2.375436, -2.391715, 0.572549, 1, 0, 1,
-0.7501841, -0.9441329, -1.342282, 0.5647059, 1, 0, 1,
-0.749659, 0.5899518, 0.223695, 0.5607843, 1, 0, 1,
-0.7480712, 1.254609, 0.2655452, 0.5529412, 1, 0, 1,
-0.7416106, 0.2696828, -1.827251, 0.5490196, 1, 0, 1,
-0.7391883, -0.782677, -2.231824, 0.5411765, 1, 0, 1,
-0.734284, -0.09788895, -2.042715, 0.5372549, 1, 0, 1,
-0.7340605, 1.357789, -1.489514, 0.5294118, 1, 0, 1,
-0.7339445, -0.9245491, -2.316394, 0.5254902, 1, 0, 1,
-0.719565, -1.252745, -2.472266, 0.5176471, 1, 0, 1,
-0.719028, -0.1655268, -0.3273522, 0.5137255, 1, 0, 1,
-0.718365, -0.6570212, -2.066804, 0.5058824, 1, 0, 1,
-0.716254, -0.2818747, -2.965081, 0.5019608, 1, 0, 1,
-0.7119234, -0.3232268, -0.8781112, 0.4941176, 1, 0, 1,
-0.7052621, -0.3968436, -1.851735, 0.4862745, 1, 0, 1,
-0.7044303, -1.647425, -0.2819372, 0.4823529, 1, 0, 1,
-0.6954849, -0.2486093, -3.989969, 0.4745098, 1, 0, 1,
-0.6940312, 1.443782, -0.4162148, 0.4705882, 1, 0, 1,
-0.6912556, -0.3107603, -2.775382, 0.4627451, 1, 0, 1,
-0.6884973, -2.194274, -1.363343, 0.4588235, 1, 0, 1,
-0.6755447, 1.803145, -0.5409268, 0.4509804, 1, 0, 1,
-0.6716506, -0.7564721, -2.992693, 0.4470588, 1, 0, 1,
-0.6707292, -0.5744182, -2.62371, 0.4392157, 1, 0, 1,
-0.6695905, -1.766166, -3.125238, 0.4352941, 1, 0, 1,
-0.6690534, -1.705959, -1.525451, 0.427451, 1, 0, 1,
-0.6688995, -0.8268442, -2.930002, 0.4235294, 1, 0, 1,
-0.6657692, -0.4854232, -2.284028, 0.4156863, 1, 0, 1,
-0.6648549, 0.8598614, 0.2621996, 0.4117647, 1, 0, 1,
-0.6635243, -0.282094, -3.913854, 0.4039216, 1, 0, 1,
-0.6604211, 0.209505, -1.975348, 0.3960784, 1, 0, 1,
-0.6599538, -0.9580693, -1.730316, 0.3921569, 1, 0, 1,
-0.6575674, -0.9532012, -2.032473, 0.3843137, 1, 0, 1,
-0.6526714, -0.3665867, -2.147607, 0.3803922, 1, 0, 1,
-0.6526074, 0.8084634, 0.2659558, 0.372549, 1, 0, 1,
-0.6495029, -0.3781612, -1.050281, 0.3686275, 1, 0, 1,
-0.6460354, -0.6289985, -2.412421, 0.3607843, 1, 0, 1,
-0.6458784, 1.85984, -1.039319, 0.3568628, 1, 0, 1,
-0.644906, 1.093934, -0.7275668, 0.3490196, 1, 0, 1,
-0.6425086, 0.7083268, -2.59046, 0.345098, 1, 0, 1,
-0.6421287, 0.08420468, -0.8113996, 0.3372549, 1, 0, 1,
-0.6382711, -0.1515382, -2.398436, 0.3333333, 1, 0, 1,
-0.6297852, 0.05344349, -3.167772, 0.3254902, 1, 0, 1,
-0.6232288, -1.895595, -2.251819, 0.3215686, 1, 0, 1,
-0.621769, 0.7894033, -0.05258717, 0.3137255, 1, 0, 1,
-0.6182764, -1.199694, -3.50507, 0.3098039, 1, 0, 1,
-0.6177036, -0.254557, -2.049916, 0.3019608, 1, 0, 1,
-0.6159231, 0.8158374, -1.462813, 0.2941177, 1, 0, 1,
-0.6137353, 0.3132137, -1.726246, 0.2901961, 1, 0, 1,
-0.6126419, 0.3651016, -2.841183, 0.282353, 1, 0, 1,
-0.6085679, 2.445778, -0.4594772, 0.2784314, 1, 0, 1,
-0.6041139, -0.1044083, -1.671505, 0.2705882, 1, 0, 1,
-0.6025254, -1.202193, -4.87665, 0.2666667, 1, 0, 1,
-0.5953868, 0.3132246, -1.159793, 0.2588235, 1, 0, 1,
-0.5890925, 0.6371834, -1.420653, 0.254902, 1, 0, 1,
-0.5878626, -1.147368, -3.639361, 0.2470588, 1, 0, 1,
-0.5824515, -0.3238553, -2.527147, 0.2431373, 1, 0, 1,
-0.5821641, 0.6401405, -2.028232, 0.2352941, 1, 0, 1,
-0.5807399, -0.1246536, -1.831162, 0.2313726, 1, 0, 1,
-0.5788057, -0.4504608, -2.289965, 0.2235294, 1, 0, 1,
-0.5772935, -1.682643, -2.953643, 0.2196078, 1, 0, 1,
-0.5761352, 0.237702, -0.739862, 0.2117647, 1, 0, 1,
-0.5712965, -0.09083135, -3.284672, 0.2078431, 1, 0, 1,
-0.5666389, -1.498014, -3.398888, 0.2, 1, 0, 1,
-0.5659813, -0.6025004, -1.653607, 0.1921569, 1, 0, 1,
-0.565465, 0.7180086, -0.9908726, 0.1882353, 1, 0, 1,
-0.5613632, 0.02636393, -0.8634359, 0.1803922, 1, 0, 1,
-0.5563581, -0.6229818, -0.9866594, 0.1764706, 1, 0, 1,
-0.5556986, -2.485409, -4.10634, 0.1686275, 1, 0, 1,
-0.5544614, 1.399525, -1.119873, 0.1647059, 1, 0, 1,
-0.5527151, 0.2047848, -2.882376, 0.1568628, 1, 0, 1,
-0.5459331, 1.530967, -0.3384176, 0.1529412, 1, 0, 1,
-0.5451684, 0.8818314, 0.5920375, 0.145098, 1, 0, 1,
-0.5416607, -0.6213543, -1.894087, 0.1411765, 1, 0, 1,
-0.534829, 0.04135033, -1.147461, 0.1333333, 1, 0, 1,
-0.5337949, 0.1736965, -1.309756, 0.1294118, 1, 0, 1,
-0.5305976, -0.06754268, -0.8992693, 0.1215686, 1, 0, 1,
-0.5290421, 1.826997, -1.457137, 0.1176471, 1, 0, 1,
-0.5232076, -0.1960146, -2.397593, 0.1098039, 1, 0, 1,
-0.5211873, 0.2105998, 0.6830603, 0.1058824, 1, 0, 1,
-0.520161, 2.002664, -0.04882047, 0.09803922, 1, 0, 1,
-0.5200058, -0.3167947, -1.59274, 0.09019608, 1, 0, 1,
-0.5194586, 0.8767484, 0.0392431, 0.08627451, 1, 0, 1,
-0.5174571, 0.7282825, -0.6917924, 0.07843138, 1, 0, 1,
-0.5154512, 1.125358, -1.237964, 0.07450981, 1, 0, 1,
-0.5149993, -0.5637232, -3.893559, 0.06666667, 1, 0, 1,
-0.5133415, 1.322662, 1.990067, 0.0627451, 1, 0, 1,
-0.506368, -0.8174753, -1.820788, 0.05490196, 1, 0, 1,
-0.5048579, 1.143317, -0.9872414, 0.05098039, 1, 0, 1,
-0.5047241, -0.5232099, -3.341494, 0.04313726, 1, 0, 1,
-0.5043355, -0.470909, -2.150028, 0.03921569, 1, 0, 1,
-0.5000194, -0.4984684, -3.564496, 0.03137255, 1, 0, 1,
-0.4941751, 1.22598, -0.4064179, 0.02745098, 1, 0, 1,
-0.4939499, 0.549696, -0.7696055, 0.01960784, 1, 0, 1,
-0.4937081, -0.2379427, -2.086312, 0.01568628, 1, 0, 1,
-0.4937046, -0.3561704, -0.5629756, 0.007843138, 1, 0, 1,
-0.4931943, -1.062411, -1.994145, 0.003921569, 1, 0, 1,
-0.4916496, 1.347871, -0.7764989, 0, 1, 0.003921569, 1,
-0.4911022, 0.7112313, -0.1933105, 0, 1, 0.01176471, 1,
-0.4905952, 1.020294, -0.2837815, 0, 1, 0.01568628, 1,
-0.4900208, 1.128297, -0.4587987, 0, 1, 0.02352941, 1,
-0.4887212, 0.3243164, -0.9097449, 0, 1, 0.02745098, 1,
-0.4865794, 0.4583419, -0.3966947, 0, 1, 0.03529412, 1,
-0.4823659, 0.8461958, 0.18368, 0, 1, 0.03921569, 1,
-0.4823039, -0.03951298, -1.037395, 0, 1, 0.04705882, 1,
-0.4822215, 1.259605, -0.6085292, 0, 1, 0.05098039, 1,
-0.4820049, -1.002766, -2.851455, 0, 1, 0.05882353, 1,
-0.4733779, 0.3313842, -0.06781118, 0, 1, 0.0627451, 1,
-0.4710612, -0.2582811, -2.723808, 0, 1, 0.07058824, 1,
-0.4683746, -0.7358814, -3.021083, 0, 1, 0.07450981, 1,
-0.4607592, 0.8547, 2.334136, 0, 1, 0.08235294, 1,
-0.4605104, 0.01240731, -1.283387, 0, 1, 0.08627451, 1,
-0.4589497, 1.10646, -0.1987699, 0, 1, 0.09411765, 1,
-0.4568435, 0.774595, 0.6790081, 0, 1, 0.1019608, 1,
-0.456201, 0.02367385, -1.169436, 0, 1, 0.1058824, 1,
-0.4535573, -2.163192, -4.805631, 0, 1, 0.1137255, 1,
-0.4527662, 0.2472694, 0.7089399, 0, 1, 0.1176471, 1,
-0.4496519, -0.2326757, -3.065511, 0, 1, 0.1254902, 1,
-0.4410653, 0.2179981, 0.4008644, 0, 1, 0.1294118, 1,
-0.4405433, -0.4201173, -1.967983, 0, 1, 0.1372549, 1,
-0.4404595, 1.418682, -1.855918, 0, 1, 0.1411765, 1,
-0.4403672, -0.3361998, -0.6777194, 0, 1, 0.1490196, 1,
-0.4402143, -1.232779, -1.660126, 0, 1, 0.1529412, 1,
-0.4332355, 0.153179, -1.023622, 0, 1, 0.1607843, 1,
-0.4310754, 0.1460449, -1.418982, 0, 1, 0.1647059, 1,
-0.4308109, -0.009810656, -2.689901, 0, 1, 0.172549, 1,
-0.4191484, 0.5844727, 0.3113078, 0, 1, 0.1764706, 1,
-0.4175329, 0.3002573, -2.222953, 0, 1, 0.1843137, 1,
-0.417518, 1.082421, -0.5915956, 0, 1, 0.1882353, 1,
-0.4168411, -0.9451128, -3.989482, 0, 1, 0.1960784, 1,
-0.4151663, -0.7458875, -1.813195, 0, 1, 0.2039216, 1,
-0.4095008, 0.5191139, 0.01372894, 0, 1, 0.2078431, 1,
-0.403726, 0.50327, -1.854331, 0, 1, 0.2156863, 1,
-0.4020641, 0.6596062, -2.029974, 0, 1, 0.2196078, 1,
-0.4003418, 0.1040525, -2.645856, 0, 1, 0.227451, 1,
-0.3991907, 0.4028653, -1.558213, 0, 1, 0.2313726, 1,
-0.3990381, 0.8990456, 0.1444891, 0, 1, 0.2392157, 1,
-0.3988692, -0.6043549, -2.533962, 0, 1, 0.2431373, 1,
-0.3931693, 0.1913392, -1.710647, 0, 1, 0.2509804, 1,
-0.3908608, 0.9555081, -0.2216305, 0, 1, 0.254902, 1,
-0.3751248, 0.2778722, 0.5460287, 0, 1, 0.2627451, 1,
-0.3738829, 0.494008, -3.317257, 0, 1, 0.2666667, 1,
-0.3721592, -1.396636, -3.054655, 0, 1, 0.2745098, 1,
-0.3679174, -0.3127925, -2.720354, 0, 1, 0.2784314, 1,
-0.3673141, -0.6532407, -2.605337, 0, 1, 0.2862745, 1,
-0.3665221, 1.661003, -0.07072053, 0, 1, 0.2901961, 1,
-0.3653454, 0.324677, -1.546846, 0, 1, 0.2980392, 1,
-0.3642519, -1.428476, -1.9752, 0, 1, 0.3058824, 1,
-0.3640878, 0.2542034, -0.9612724, 0, 1, 0.3098039, 1,
-0.3607101, -0.2854939, -1.969349, 0, 1, 0.3176471, 1,
-0.3601858, 2.281097, 0.05575723, 0, 1, 0.3215686, 1,
-0.3592123, 0.9051388, 0.3045364, 0, 1, 0.3294118, 1,
-0.3542679, -1.238581, -3.354015, 0, 1, 0.3333333, 1,
-0.3537414, -0.7805173, -4.023423, 0, 1, 0.3411765, 1,
-0.3535473, 0.09988292, -0.7905011, 0, 1, 0.345098, 1,
-0.3531685, 0.8408792, 0.6732391, 0, 1, 0.3529412, 1,
-0.3493419, 0.3960307, 0.08027543, 0, 1, 0.3568628, 1,
-0.3459664, -0.3425581, -1.620572, 0, 1, 0.3647059, 1,
-0.3346168, -0.2472494, 1.700556, 0, 1, 0.3686275, 1,
-0.3330349, -0.3433836, -1.408632, 0, 1, 0.3764706, 1,
-0.3322815, -1.729333, -3.642593, 0, 1, 0.3803922, 1,
-0.3284062, 0.9877161, -0.372699, 0, 1, 0.3882353, 1,
-0.326891, -1.203274, -1.597075, 0, 1, 0.3921569, 1,
-0.3241932, 1.352225, 0.09644929, 0, 1, 0.4, 1,
-0.321758, 1.787096, -0.6353521, 0, 1, 0.4078431, 1,
-0.3217415, 1.024658, -0.04506918, 0, 1, 0.4117647, 1,
-0.320523, 0.7618642, -0.5388411, 0, 1, 0.4196078, 1,
-0.3197866, -0.2086526, -3.564621, 0, 1, 0.4235294, 1,
-0.3175081, 0.7259156, -0.2911, 0, 1, 0.4313726, 1,
-0.3155928, 0.4718671, -1.381149, 0, 1, 0.4352941, 1,
-0.3137435, -0.2614318, -0.5860627, 0, 1, 0.4431373, 1,
-0.3131073, -0.620967, -4.184379, 0, 1, 0.4470588, 1,
-0.3129873, 1.420321, 0.3562492, 0, 1, 0.454902, 1,
-0.3128767, -0.6545307, -4.007335, 0, 1, 0.4588235, 1,
-0.3123571, 0.1892617, -1.346524, 0, 1, 0.4666667, 1,
-0.3111193, 1.257178, -0.4540809, 0, 1, 0.4705882, 1,
-0.3105855, 0.09259538, -1.205297, 0, 1, 0.4784314, 1,
-0.3101834, -0.8698544, -3.869211, 0, 1, 0.4823529, 1,
-0.30755, 0.266284, 0.06306331, 0, 1, 0.4901961, 1,
-0.3051656, 0.07936726, 0.2609984, 0, 1, 0.4941176, 1,
-0.3043602, -1.873086, -3.04945, 0, 1, 0.5019608, 1,
-0.2964677, -0.5738509, -2.688408, 0, 1, 0.509804, 1,
-0.2923289, 1.42522, -0.9278044, 0, 1, 0.5137255, 1,
-0.2896267, 2.297232, -0.2425745, 0, 1, 0.5215687, 1,
-0.2886284, 0.6889617, -1.039928, 0, 1, 0.5254902, 1,
-0.2882029, 1.678258, 0.0417327, 0, 1, 0.5333334, 1,
-0.2819655, -0.3063771, -2.946369, 0, 1, 0.5372549, 1,
-0.281957, -0.8167947, -2.677955, 0, 1, 0.5450981, 1,
-0.2768718, -0.2744165, -0.244145, 0, 1, 0.5490196, 1,
-0.2767512, -0.7864721, -3.040222, 0, 1, 0.5568628, 1,
-0.2757032, -0.039262, -0.4777642, 0, 1, 0.5607843, 1,
-0.2697729, -0.5054103, -4.22344, 0, 1, 0.5686275, 1,
-0.2624811, 0.6269801, -0.06739146, 0, 1, 0.572549, 1,
-0.2616172, -0.2695493, -1.481021, 0, 1, 0.5803922, 1,
-0.2570261, -1.118576, -2.165716, 0, 1, 0.5843138, 1,
-0.2561886, 0.3771452, -0.4586028, 0, 1, 0.5921569, 1,
-0.2554314, -1.281362, -2.11004, 0, 1, 0.5960785, 1,
-0.2553728, 1.657636, 0.06686079, 0, 1, 0.6039216, 1,
-0.2499079, 0.4635262, 1.072645, 0, 1, 0.6117647, 1,
-0.249717, -0.9464285, -3.49234, 0, 1, 0.6156863, 1,
-0.2464591, 0.3183989, -2.389943, 0, 1, 0.6235294, 1,
-0.2398602, 0.6637565, -1.290642, 0, 1, 0.627451, 1,
-0.2398401, -0.4876955, -1.801701, 0, 1, 0.6352941, 1,
-0.2385839, -0.01941361, -2.585373, 0, 1, 0.6392157, 1,
-0.2365954, -1.120836, -3.121237, 0, 1, 0.6470588, 1,
-0.2362465, 0.1607832, -1.457534, 0, 1, 0.6509804, 1,
-0.2325843, 0.4973873, -0.4733392, 0, 1, 0.6588235, 1,
-0.2298971, 0.02942103, -0.7627281, 0, 1, 0.6627451, 1,
-0.2273614, 0.7499844, 1.243267, 0, 1, 0.6705883, 1,
-0.2234091, 0.7741442, -1.195137, 0, 1, 0.6745098, 1,
-0.2178097, -0.8147091, -2.977811, 0, 1, 0.682353, 1,
-0.2171078, 0.592447, -0.5426468, 0, 1, 0.6862745, 1,
-0.2160336, 1.425603, 0.7037549, 0, 1, 0.6941177, 1,
-0.2155009, 0.3663441, -0.4556403, 0, 1, 0.7019608, 1,
-0.2135441, -1.186022, -0.4527766, 0, 1, 0.7058824, 1,
-0.2131875, 0.44285, -1.151727, 0, 1, 0.7137255, 1,
-0.2071661, 1.683743, 0.1893848, 0, 1, 0.7176471, 1,
-0.2053155, 0.4877664, -1.393388, 0, 1, 0.7254902, 1,
-0.2049742, 1.269694, 0.29111, 0, 1, 0.7294118, 1,
-0.2047932, 0.8826914, -0.7001511, 0, 1, 0.7372549, 1,
-0.2028195, 1.161922, -1.70162, 0, 1, 0.7411765, 1,
-0.2011166, 1.621359, 0.924841, 0, 1, 0.7490196, 1,
-0.1993826, -0.1318341, -4.478089, 0, 1, 0.7529412, 1,
-0.1939525, -0.3960876, -2.682258, 0, 1, 0.7607843, 1,
-0.1923346, 0.2797968, 0.8190242, 0, 1, 0.7647059, 1,
-0.1889089, 1.584993, -0.8084704, 0, 1, 0.772549, 1,
-0.1865056, -0.0351527, -1.058893, 0, 1, 0.7764706, 1,
-0.1746487, -0.4159071, -0.7451313, 0, 1, 0.7843137, 1,
-0.1703327, -0.144686, -2.39062, 0, 1, 0.7882353, 1,
-0.1629664, 0.9411195, 1.742742, 0, 1, 0.7960784, 1,
-0.1577669, 0.3658106, -0.09065188, 0, 1, 0.8039216, 1,
-0.1569805, 1.116475, -0.9326038, 0, 1, 0.8078431, 1,
-0.1469019, -2.029004, -1.713858, 0, 1, 0.8156863, 1,
-0.1461835, -1.665731, -2.752674, 0, 1, 0.8196079, 1,
-0.1446156, 0.05416655, -1.450714, 0, 1, 0.827451, 1,
-0.1443896, 0.6005652, 1.420264, 0, 1, 0.8313726, 1,
-0.1339443, -0.6938897, -2.830562, 0, 1, 0.8392157, 1,
-0.1274505, 1.622608, 0.3341728, 0, 1, 0.8431373, 1,
-0.1227878, -0.01483264, -1.972455, 0, 1, 0.8509804, 1,
-0.1177263, -0.1190131, -3.185239, 0, 1, 0.854902, 1,
-0.1173989, 2.753745, -0.4887204, 0, 1, 0.8627451, 1,
-0.1144965, -0.3664142, -3.083264, 0, 1, 0.8666667, 1,
-0.1127182, -0.827953, -3.229402, 0, 1, 0.8745098, 1,
-0.111332, 0.5040908, -0.2753569, 0, 1, 0.8784314, 1,
-0.1067984, 0.6174335, 0.6532513, 0, 1, 0.8862745, 1,
-0.1067113, -1.195018, -4.259394, 0, 1, 0.8901961, 1,
-0.1059932, 0.1272597, 0.7014241, 0, 1, 0.8980392, 1,
-0.1048844, -1.033407, -2.178506, 0, 1, 0.9058824, 1,
-0.1015973, -1.572613, -2.363723, 0, 1, 0.9098039, 1,
-0.09806001, -1.029201, -1.192841, 0, 1, 0.9176471, 1,
-0.09782017, -0.5354438, -4.737867, 0, 1, 0.9215686, 1,
-0.09321142, 0.3973291, 0.6607504, 0, 1, 0.9294118, 1,
-0.08885599, 1.536255, -0.5532109, 0, 1, 0.9333333, 1,
-0.08613539, -0.3627074, -3.722222, 0, 1, 0.9411765, 1,
-0.0854921, 0.6818526, 0.3052607, 0, 1, 0.945098, 1,
-0.08262809, 0.4860371, -0.255344, 0, 1, 0.9529412, 1,
-0.07875708, 3.007814, 0.9581115, 0, 1, 0.9568627, 1,
-0.06934694, 0.379352, -0.03419401, 0, 1, 0.9647059, 1,
-0.06693682, 0.1053861, 2.153895, 0, 1, 0.9686275, 1,
-0.06574433, 1.532351, 0.9802341, 0, 1, 0.9764706, 1,
-0.06050679, -0.2913198, -2.210313, 0, 1, 0.9803922, 1,
-0.05981256, 0.9127423, -0.7068194, 0, 1, 0.9882353, 1,
-0.05763947, 0.1510812, 0.02786423, 0, 1, 0.9921569, 1,
-0.0560352, -0.2934835, -3.604429, 0, 1, 1, 1,
-0.0553054, 0.05582547, -0.8274084, 0, 0.9921569, 1, 1,
-0.0454906, -0.3890673, -4.316402, 0, 0.9882353, 1, 1,
-0.04123569, 0.02615833, -0.4812856, 0, 0.9803922, 1, 1,
-0.03674856, 0.6582534, 0.7735966, 0, 0.9764706, 1, 1,
-0.0361868, -0.1948154, -3.698498, 0, 0.9686275, 1, 1,
-0.03317081, 1.050343, -0.02762303, 0, 0.9647059, 1, 1,
-0.03202466, -0.83613, -3.147791, 0, 0.9568627, 1, 1,
-0.02791807, 0.2096221, 0.5372713, 0, 0.9529412, 1, 1,
-0.02687846, -0.7069669, -0.5828713, 0, 0.945098, 1, 1,
-0.02575398, -0.2832407, -3.764691, 0, 0.9411765, 1, 1,
-0.02321326, -0.4533786, -3.642188, 0, 0.9333333, 1, 1,
-0.01669286, -0.1196102, -5.100352, 0, 0.9294118, 1, 1,
-0.01087514, -0.3615011, -3.481426, 0, 0.9215686, 1, 1,
-0.007445514, 0.3951752, -0.6128166, 0, 0.9176471, 1, 1,
-0.0035491, 1.663117, -0.6611782, 0, 0.9098039, 1, 1,
-0.003391114, -0.3199739, -3.455728, 0, 0.9058824, 1, 1,
-0.001965219, 0.6385954, 0.06036941, 0, 0.8980392, 1, 1,
0.002270443, 0.3230901, -0.6182007, 0, 0.8901961, 1, 1,
0.003276084, 0.9250063, 0.2635844, 0, 0.8862745, 1, 1,
0.006605154, -0.5029618, 3.492913, 0, 0.8784314, 1, 1,
0.01098999, -0.3556408, 4.686306, 0, 0.8745098, 1, 1,
0.01376861, -1.89117, 3.69872, 0, 0.8666667, 1, 1,
0.0143897, -0.08636546, 1.873838, 0, 0.8627451, 1, 1,
0.0257118, -0.5743381, 3.632039, 0, 0.854902, 1, 1,
0.02577976, -0.8652539, 4.321875, 0, 0.8509804, 1, 1,
0.02669954, -1.108189, 1.629346, 0, 0.8431373, 1, 1,
0.03169917, 0.2518162, 0.3565723, 0, 0.8392157, 1, 1,
0.03543522, -0.5236823, 2.239383, 0, 0.8313726, 1, 1,
0.03771754, 0.4064023, 0.4072328, 0, 0.827451, 1, 1,
0.03854327, 0.5761082, 0.7553711, 0, 0.8196079, 1, 1,
0.03889543, 0.4916787, -1.87835, 0, 0.8156863, 1, 1,
0.03990038, -0.7092851, 4.399051, 0, 0.8078431, 1, 1,
0.04186932, 0.1488463, -1.106034, 0, 0.8039216, 1, 1,
0.04329174, 0.9786052, 0.1512869, 0, 0.7960784, 1, 1,
0.04478553, 0.476795, 0.08820286, 0, 0.7882353, 1, 1,
0.04821607, -0.1992408, 3.072351, 0, 0.7843137, 1, 1,
0.04836203, -1.593997, 2.323894, 0, 0.7764706, 1, 1,
0.05287637, 0.463514, -0.2940423, 0, 0.772549, 1, 1,
0.05843252, 1.110162, 1.560742, 0, 0.7647059, 1, 1,
0.05974279, -1.85943, 2.811584, 0, 0.7607843, 1, 1,
0.06241949, 0.0194229, 2.34504, 0, 0.7529412, 1, 1,
0.0632848, -1.10404, 2.947569, 0, 0.7490196, 1, 1,
0.06330218, 0.7716859, 0.1543256, 0, 0.7411765, 1, 1,
0.06553601, -0.5930634, 2.757649, 0, 0.7372549, 1, 1,
0.06604133, 0.8936501, -0.1283792, 0, 0.7294118, 1, 1,
0.06645052, -1.685075, 3.064262, 0, 0.7254902, 1, 1,
0.06741539, -0.0001607681, 1.631208, 0, 0.7176471, 1, 1,
0.07096288, -0.1825329, 3.026276, 0, 0.7137255, 1, 1,
0.07263691, 0.00284223, 1.031525, 0, 0.7058824, 1, 1,
0.07378566, -0.2966623, 2.525609, 0, 0.6980392, 1, 1,
0.07383682, -1.03712, 3.552694, 0, 0.6941177, 1, 1,
0.08657396, 0.3818639, -1.21047, 0, 0.6862745, 1, 1,
0.08943426, -0.6169897, 4.153979, 0, 0.682353, 1, 1,
0.09200792, -0.3134191, 2.914848, 0, 0.6745098, 1, 1,
0.09542768, -0.8053559, 3.011387, 0, 0.6705883, 1, 1,
0.09943146, 0.7893006, 0.4529428, 0, 0.6627451, 1, 1,
0.1052438, 1.936456, -0.07312146, 0, 0.6588235, 1, 1,
0.1079403, -0.9490551, 4.462863, 0, 0.6509804, 1, 1,
0.1186867, 0.7655583, -1.735139, 0, 0.6470588, 1, 1,
0.1203079, 1.97603, -0.557373, 0, 0.6392157, 1, 1,
0.1276254, -1.167451, 3.567997, 0, 0.6352941, 1, 1,
0.1287442, 1.021219, 0.5326545, 0, 0.627451, 1, 1,
0.1301226, 0.02825334, 1.922976, 0, 0.6235294, 1, 1,
0.1304066, 0.3467835, 0.4051984, 0, 0.6156863, 1, 1,
0.140695, -0.6620901, 3.299522, 0, 0.6117647, 1, 1,
0.141161, 0.5690297, 0.03915665, 0, 0.6039216, 1, 1,
0.1516438, -1.888545, 3.52297, 0, 0.5960785, 1, 1,
0.1575609, 1.43767, 1.19362, 0, 0.5921569, 1, 1,
0.1609932, -0.336016, 1.258759, 0, 0.5843138, 1, 1,
0.162817, -1.01746, 3.951382, 0, 0.5803922, 1, 1,
0.1643124, 1.612784, 0.5982811, 0, 0.572549, 1, 1,
0.1653182, -0.2425195, 2.364, 0, 0.5686275, 1, 1,
0.1739561, 0.3395653, 0.1051061, 0, 0.5607843, 1, 1,
0.1798211, 0.03060586, 2.145049, 0, 0.5568628, 1, 1,
0.1806285, 0.9037662, 1.362912, 0, 0.5490196, 1, 1,
0.1819241, -1.497312, 3.555116, 0, 0.5450981, 1, 1,
0.1822414, -0.1161783, 2.84455, 0, 0.5372549, 1, 1,
0.1891781, -1.02242, 1.368151, 0, 0.5333334, 1, 1,
0.197899, 0.6308787, -0.831084, 0, 0.5254902, 1, 1,
0.2019587, -0.02151454, 2.262799, 0, 0.5215687, 1, 1,
0.2020448, 0.6556644, -0.7392804, 0, 0.5137255, 1, 1,
0.20313, -0.7122323, 3.002737, 0, 0.509804, 1, 1,
0.2069284, 1.647732, -0.4129257, 0, 0.5019608, 1, 1,
0.2110487, -1.96223, 3.086502, 0, 0.4941176, 1, 1,
0.2114505, 0.5629786, 0.3938586, 0, 0.4901961, 1, 1,
0.2169899, 0.4345305, 0.3244801, 0, 0.4823529, 1, 1,
0.2176874, 0.2266497, -0.7812856, 0, 0.4784314, 1, 1,
0.2303906, -1.225925, 2.875182, 0, 0.4705882, 1, 1,
0.2322263, 0.9197779, 0.3442991, 0, 0.4666667, 1, 1,
0.2340227, -0.2566388, 2.585653, 0, 0.4588235, 1, 1,
0.2366538, -1.933051, 2.468713, 0, 0.454902, 1, 1,
0.2379456, 0.9457325, 0.07785714, 0, 0.4470588, 1, 1,
0.2403229, -0.7694287, 2.923242, 0, 0.4431373, 1, 1,
0.2422887, 0.1710673, 0.7982583, 0, 0.4352941, 1, 1,
0.2437515, -0.8015438, 2.259917, 0, 0.4313726, 1, 1,
0.2466533, 1.093595, -0.5458654, 0, 0.4235294, 1, 1,
0.2515557, 0.4318048, 1.558261, 0, 0.4196078, 1, 1,
0.2523276, 2.525279, 1.295967, 0, 0.4117647, 1, 1,
0.2545598, 0.6458188, -0.8185841, 0, 0.4078431, 1, 1,
0.2628394, 0.5975897, 0.725623, 0, 0.4, 1, 1,
0.2686869, 1.188959, 0.08706531, 0, 0.3921569, 1, 1,
0.2710992, -0.7566123, 1.897992, 0, 0.3882353, 1, 1,
0.2716644, 1.324372, 0.4909864, 0, 0.3803922, 1, 1,
0.2718286, 1.939024, -1.551256, 0, 0.3764706, 1, 1,
0.2765102, 0.1340956, 1.58921, 0, 0.3686275, 1, 1,
0.2783187, 1.138107, 1.012005, 0, 0.3647059, 1, 1,
0.2890038, 0.9937103, 1.295168, 0, 0.3568628, 1, 1,
0.2909693, -0.2147299, 2.28007, 0, 0.3529412, 1, 1,
0.2924707, 0.260073, -0.08334945, 0, 0.345098, 1, 1,
0.2949702, 0.8501738, 0.3863828, 0, 0.3411765, 1, 1,
0.295718, 0.3863443, -0.9496643, 0, 0.3333333, 1, 1,
0.2972067, 1.010012, 0.431614, 0, 0.3294118, 1, 1,
0.2982882, -0.799094, 4.532585, 0, 0.3215686, 1, 1,
0.2996913, -1.369354, 3.139937, 0, 0.3176471, 1, 1,
0.3020151, -0.0324531, 1.371806, 0, 0.3098039, 1, 1,
0.3051737, -0.06571785, 1.801444, 0, 0.3058824, 1, 1,
0.3059702, -0.4781121, 2.060984, 0, 0.2980392, 1, 1,
0.3074175, 0.1791906, 1.307025, 0, 0.2901961, 1, 1,
0.3130432, -0.9249571, 2.979338, 0, 0.2862745, 1, 1,
0.3163324, -0.8207023, 2.351214, 0, 0.2784314, 1, 1,
0.321427, -0.6958084, 3.341689, 0, 0.2745098, 1, 1,
0.3233582, 0.7183122, -1.501632, 0, 0.2666667, 1, 1,
0.3234563, -0.8430932, 1.352947, 0, 0.2627451, 1, 1,
0.3244295, -0.5191447, 4.064103, 0, 0.254902, 1, 1,
0.3249909, -0.8759965, 3.450793, 0, 0.2509804, 1, 1,
0.3329649, 0.9884562, 0.7584378, 0, 0.2431373, 1, 1,
0.3347814, -0.3428612, 3.426397, 0, 0.2392157, 1, 1,
0.3374183, -0.01204261, 2.547866, 0, 0.2313726, 1, 1,
0.3418184, 0.6160764, -0.6211683, 0, 0.227451, 1, 1,
0.3419858, -0.6857272, 3.248358, 0, 0.2196078, 1, 1,
0.3500613, -1.048386, 4.897316, 0, 0.2156863, 1, 1,
0.3517247, 2.004933, 0.9923276, 0, 0.2078431, 1, 1,
0.3517891, 0.997901, 0.663685, 0, 0.2039216, 1, 1,
0.3524076, -0.006388972, 0.2278097, 0, 0.1960784, 1, 1,
0.3533743, 1.363734, -2.101312, 0, 0.1882353, 1, 1,
0.3548703, -0.693266, 4.028863, 0, 0.1843137, 1, 1,
0.3577193, 0.2075383, 3.332484, 0, 0.1764706, 1, 1,
0.3594717, 2.259322, 1.666889, 0, 0.172549, 1, 1,
0.3597505, 0.3744642, 0.9407997, 0, 0.1647059, 1, 1,
0.3672802, 2.018612, -0.05418814, 0, 0.1607843, 1, 1,
0.368052, -0.8363999, 4.225718, 0, 0.1529412, 1, 1,
0.3686381, -1.462623, 3.93668, 0, 0.1490196, 1, 1,
0.3696736, -1.20933, 1.121067, 0, 0.1411765, 1, 1,
0.3710721, 0.00663016, 2.717858, 0, 0.1372549, 1, 1,
0.3729994, -0.1316926, 1.162473, 0, 0.1294118, 1, 1,
0.3767624, -1.120442, 3.416351, 0, 0.1254902, 1, 1,
0.3768777, 0.5357032, -0.5530692, 0, 0.1176471, 1, 1,
0.380442, 2.700738, 0.7272965, 0, 0.1137255, 1, 1,
0.3841774, 0.6004937, 0.09778602, 0, 0.1058824, 1, 1,
0.3858216, 1.704942, 0.9982638, 0, 0.09803922, 1, 1,
0.3863407, 2.271303, -1.294283, 0, 0.09411765, 1, 1,
0.3944064, -0.739778, 2.265086, 0, 0.08627451, 1, 1,
0.4018115, 0.5382833, 1.382256, 0, 0.08235294, 1, 1,
0.409951, 0.8768513, 0.07705121, 0, 0.07450981, 1, 1,
0.4139248, -0.9366836, 2.845555, 0, 0.07058824, 1, 1,
0.4173007, -2.139273, 2.162501, 0, 0.0627451, 1, 1,
0.4221624, 0.5708714, 0.8887565, 0, 0.05882353, 1, 1,
0.4304098, 1.380879, 1.519828, 0, 0.05098039, 1, 1,
0.4311433, -1.288598, 5.208694, 0, 0.04705882, 1, 1,
0.4339704, 1.157369, -0.3180329, 0, 0.03921569, 1, 1,
0.4362481, 0.3555112, 1.61623, 0, 0.03529412, 1, 1,
0.4371166, 1.338216, 0.2816403, 0, 0.02745098, 1, 1,
0.4390518, 1.094711, 1.510076, 0, 0.02352941, 1, 1,
0.4465416, 0.02107961, 2.594753, 0, 0.01568628, 1, 1,
0.4486747, -0.5966077, 2.283616, 0, 0.01176471, 1, 1,
0.4529861, 1.60873, 1.202345, 0, 0.003921569, 1, 1,
0.4563927, 0.2747739, 1.545522, 0.003921569, 0, 1, 1,
0.456863, 0.016491, 2.280391, 0.007843138, 0, 1, 1,
0.4572099, 0.7784295, 2.218571, 0.01568628, 0, 1, 1,
0.464638, -1.22338, 1.038978, 0.01960784, 0, 1, 1,
0.4647813, 1.431644, 1.423145, 0.02745098, 0, 1, 1,
0.4657848, -1.445561, 2.524771, 0.03137255, 0, 1, 1,
0.4664245, -1.617924, 1.828699, 0.03921569, 0, 1, 1,
0.4688161, -0.9247662, 4.114224, 0.04313726, 0, 1, 1,
0.4693446, 2.608295, -0.04740448, 0.05098039, 0, 1, 1,
0.4717135, -1.299436, 3.781384, 0.05490196, 0, 1, 1,
0.4732838, 0.4158356, 0.5855074, 0.0627451, 0, 1, 1,
0.4807291, -1.091047, 1.761776, 0.06666667, 0, 1, 1,
0.4835766, 0.5057565, 0.4668555, 0.07450981, 0, 1, 1,
0.4856632, 1.030036, 0.3030452, 0.07843138, 0, 1, 1,
0.4909509, -0.3817168, 4.135542, 0.08627451, 0, 1, 1,
0.4922938, 0.3766646, 2.00632, 0.09019608, 0, 1, 1,
0.4975584, 0.2553939, 2.495594, 0.09803922, 0, 1, 1,
0.4976436, -2.319013, 2.283504, 0.1058824, 0, 1, 1,
0.4976465, -1.123359, 2.215795, 0.1098039, 0, 1, 1,
0.5019624, -0.05050797, 0.3502916, 0.1176471, 0, 1, 1,
0.5078776, 0.3467719, -1.789639, 0.1215686, 0, 1, 1,
0.5081413, -0.9010345, 3.705276, 0.1294118, 0, 1, 1,
0.5090682, -0.4739329, 3.390141, 0.1333333, 0, 1, 1,
0.5129361, -0.3229415, 0.7826172, 0.1411765, 0, 1, 1,
0.5191292, 0.2558889, -0.1624852, 0.145098, 0, 1, 1,
0.5220898, 1.145865, 2.245678, 0.1529412, 0, 1, 1,
0.5246369, -0.1473886, 0.6438625, 0.1568628, 0, 1, 1,
0.5390734, 1.354947, 1.275559, 0.1647059, 0, 1, 1,
0.539728, 0.431886, 0.6831281, 0.1686275, 0, 1, 1,
0.5410258, -0.9463307, 1.84351, 0.1764706, 0, 1, 1,
0.5421219, -0.5095254, 2.292158, 0.1803922, 0, 1, 1,
0.5433855, 0.4835634, 0.1359539, 0.1882353, 0, 1, 1,
0.5449447, -0.6568654, -0.4619251, 0.1921569, 0, 1, 1,
0.5542544, -0.168536, 1.495383, 0.2, 0, 1, 1,
0.5565705, 0.06328746, 2.770927, 0.2078431, 0, 1, 1,
0.5572286, -0.9186787, 2.254349, 0.2117647, 0, 1, 1,
0.5579929, 2.051567, 0.4986944, 0.2196078, 0, 1, 1,
0.5642179, 0.236965, 1.348796, 0.2235294, 0, 1, 1,
0.569049, 0.361242, 1.980431, 0.2313726, 0, 1, 1,
0.5694343, 0.8385445, 2.27591, 0.2352941, 0, 1, 1,
0.5718499, 0.193499, -0.2176245, 0.2431373, 0, 1, 1,
0.5814758, 2.409718, -0.6974273, 0.2470588, 0, 1, 1,
0.5903396, 0.7453053, 0.3121992, 0.254902, 0, 1, 1,
0.5904476, 1.839351, 0.3114963, 0.2588235, 0, 1, 1,
0.5911359, 0.2899208, 1.279374, 0.2666667, 0, 1, 1,
0.5959237, -1.859083, 2.459275, 0.2705882, 0, 1, 1,
0.600583, 0.03551655, 0.1751929, 0.2784314, 0, 1, 1,
0.6009454, -0.373852, -0.706371, 0.282353, 0, 1, 1,
0.6024988, 1.438033, 0.3923028, 0.2901961, 0, 1, 1,
0.6067617, -0.5693829, 2.831781, 0.2941177, 0, 1, 1,
0.616905, -0.2731361, 2.517743, 0.3019608, 0, 1, 1,
0.6185043, 1.305218, 0.4233526, 0.3098039, 0, 1, 1,
0.61854, -0.121908, 1.786491, 0.3137255, 0, 1, 1,
0.6189389, -0.1213466, 1.637009, 0.3215686, 0, 1, 1,
0.6204368, 0.06534853, 2.745217, 0.3254902, 0, 1, 1,
0.621864, 1.315199, 0.21467, 0.3333333, 0, 1, 1,
0.6222287, 0.5137215, 1.190918, 0.3372549, 0, 1, 1,
0.6228747, -0.05101534, -0.6994892, 0.345098, 0, 1, 1,
0.6249602, 1.188611, -0.08931305, 0.3490196, 0, 1, 1,
0.6270588, -0.07056915, 1.690637, 0.3568628, 0, 1, 1,
0.6330792, -2.133752, 3.769839, 0.3607843, 0, 1, 1,
0.6374344, -0.01018188, 1.112322, 0.3686275, 0, 1, 1,
0.6425942, -1.472098, 2.715291, 0.372549, 0, 1, 1,
0.6442688, 1.615794, 2.203629, 0.3803922, 0, 1, 1,
0.6479819, 0.1044057, -0.1529747, 0.3843137, 0, 1, 1,
0.6491751, -0.7907579, 2.772449, 0.3921569, 0, 1, 1,
0.6496303, -0.5837374, 1.467096, 0.3960784, 0, 1, 1,
0.6552051, -0.5345697, 2.08332, 0.4039216, 0, 1, 1,
0.6606963, -1.417593, 2.669251, 0.4117647, 0, 1, 1,
0.6620079, -1.964861, 1.324994, 0.4156863, 0, 1, 1,
0.662698, 0.7112057, -0.04328435, 0.4235294, 0, 1, 1,
0.6628269, 0.08534352, 0.4123111, 0.427451, 0, 1, 1,
0.6663792, -0.09637047, 1.528304, 0.4352941, 0, 1, 1,
0.6765354, 1.705673, 0.6498669, 0.4392157, 0, 1, 1,
0.6771161, 0.4303239, -0.06520127, 0.4470588, 0, 1, 1,
0.6800593, 2.090602, -0.1338832, 0.4509804, 0, 1, 1,
0.6814364, 0.08837481, 0.2545139, 0.4588235, 0, 1, 1,
0.6836024, 0.006671165, 1.18425, 0.4627451, 0, 1, 1,
0.6879184, 0.0203534, 0.9304079, 0.4705882, 0, 1, 1,
0.6881855, -0.9244207, 1.753135, 0.4745098, 0, 1, 1,
0.6900901, -1.380869, 2.514599, 0.4823529, 0, 1, 1,
0.6941559, 0.3770888, 0.4375446, 0.4862745, 0, 1, 1,
0.708383, 1.862675, 0.8532286, 0.4941176, 0, 1, 1,
0.7101085, -1.291452, 3.354091, 0.5019608, 0, 1, 1,
0.712563, 1.213518, 1.300715, 0.5058824, 0, 1, 1,
0.7131464, 2.027313, 1.157955, 0.5137255, 0, 1, 1,
0.7145312, 1.148568, -0.862906, 0.5176471, 0, 1, 1,
0.7147541, 1.708512, 1.010779, 0.5254902, 0, 1, 1,
0.7148356, 0.8455645, 0.9319332, 0.5294118, 0, 1, 1,
0.7161875, -1.868055, 2.06245, 0.5372549, 0, 1, 1,
0.7174981, -1.473058, 1.93615, 0.5411765, 0, 1, 1,
0.72494, -0.5064046, 3.260218, 0.5490196, 0, 1, 1,
0.7253405, 0.4329238, 2.022556, 0.5529412, 0, 1, 1,
0.7266557, 0.4549906, -0.07210975, 0.5607843, 0, 1, 1,
0.7352219, 0.2731127, 1.733152, 0.5647059, 0, 1, 1,
0.7360209, 0.424848, 0.1686925, 0.572549, 0, 1, 1,
0.736322, -0.4275261, 2.690603, 0.5764706, 0, 1, 1,
0.7376708, 0.1510817, 1.084601, 0.5843138, 0, 1, 1,
0.7422826, -0.702522, 3.148664, 0.5882353, 0, 1, 1,
0.7430786, 1.384893, 2.316059, 0.5960785, 0, 1, 1,
0.7500266, 0.8589767, 1.178188, 0.6039216, 0, 1, 1,
0.7560309, 2.432976, 1.510589, 0.6078432, 0, 1, 1,
0.7607101, -0.5760838, 1.537955, 0.6156863, 0, 1, 1,
0.7617807, -1.242384, 2.189942, 0.6196079, 0, 1, 1,
0.7650955, -0.6141011, 3.570688, 0.627451, 0, 1, 1,
0.7697083, 1.178426, 0.499571, 0.6313726, 0, 1, 1,
0.7773226, 0.2289979, 0.9867596, 0.6392157, 0, 1, 1,
0.7806943, 0.3122402, 1.740485, 0.6431373, 0, 1, 1,
0.7813612, -1.638421, 1.611572, 0.6509804, 0, 1, 1,
0.7864078, -0.1866448, 1.59904, 0.654902, 0, 1, 1,
0.7886201, -1.055071, 4.600311, 0.6627451, 0, 1, 1,
0.7888469, -1.22274, 3.728804, 0.6666667, 0, 1, 1,
0.7889093, 0.1021975, 2.527254, 0.6745098, 0, 1, 1,
0.7916914, -0.366619, 3.373767, 0.6784314, 0, 1, 1,
0.7918152, -1.105029, 2.403473, 0.6862745, 0, 1, 1,
0.7948912, 0.9421532, 0.9933667, 0.6901961, 0, 1, 1,
0.7960634, -0.1484473, 0.489513, 0.6980392, 0, 1, 1,
0.7962412, 0.2569948, 2.131335, 0.7058824, 0, 1, 1,
0.7970876, -0.9204159, 1.864398, 0.7098039, 0, 1, 1,
0.7979088, -0.8988196, 1.517195, 0.7176471, 0, 1, 1,
0.8204751, 0.3523025, 0.9426197, 0.7215686, 0, 1, 1,
0.8212301, 0.4546049, -0.22099, 0.7294118, 0, 1, 1,
0.8270161, 0.9109622, 0.8354686, 0.7333333, 0, 1, 1,
0.8276831, -0.9409353, 2.526659, 0.7411765, 0, 1, 1,
0.8278184, 0.242285, 0.5205513, 0.7450981, 0, 1, 1,
0.8284396, -0.9346633, 2.514628, 0.7529412, 0, 1, 1,
0.8287762, -0.2728336, 0.5814877, 0.7568628, 0, 1, 1,
0.8375415, -0.8116781, 1.386079, 0.7647059, 0, 1, 1,
0.840966, -0.7206713, 4.091188, 0.7686275, 0, 1, 1,
0.8460301, -2.18437, 3.929443, 0.7764706, 0, 1, 1,
0.8474534, 0.9876015, 0.251186, 0.7803922, 0, 1, 1,
0.8571137, 0.2199614, 1.62694, 0.7882353, 0, 1, 1,
0.8593954, 0.8052257, -0.7264358, 0.7921569, 0, 1, 1,
0.8678045, -0.241168, 2.405506, 0.8, 0, 1, 1,
0.8682281, -0.1708604, 2.385309, 0.8078431, 0, 1, 1,
0.8733567, -0.6920874, 2.662616, 0.8117647, 0, 1, 1,
0.8741169, -1.445519, 2.787774, 0.8196079, 0, 1, 1,
0.8768361, 0.7465851, 0.810789, 0.8235294, 0, 1, 1,
0.8787213, -0.8973212, 3.171004, 0.8313726, 0, 1, 1,
0.8799167, 0.1398573, 1.205425, 0.8352941, 0, 1, 1,
0.8802543, -0.0302347, 1.18627, 0.8431373, 0, 1, 1,
0.8819439, 0.1244053, 1.623492, 0.8470588, 0, 1, 1,
0.8956886, -0.7199466, 4.373693, 0.854902, 0, 1, 1,
0.900045, -1.042819, 1.868744, 0.8588235, 0, 1, 1,
0.9002126, 0.1664476, 0.3015986, 0.8666667, 0, 1, 1,
0.9012519, -0.2681112, 3.40084, 0.8705882, 0, 1, 1,
0.904248, -1.660613, 2.438169, 0.8784314, 0, 1, 1,
0.9048111, 0.5502784, 1.307163, 0.8823529, 0, 1, 1,
0.9134082, -2.906322, 1.420007, 0.8901961, 0, 1, 1,
0.9200971, -0.5028218, 3.45034, 0.8941177, 0, 1, 1,
0.9215332, 0.3417096, 0.6667278, 0.9019608, 0, 1, 1,
0.928304, -0.9716219, 4.060049, 0.9098039, 0, 1, 1,
0.9302746, -1.127508, 0.599861, 0.9137255, 0, 1, 1,
0.9359025, -1.191343, 3.450458, 0.9215686, 0, 1, 1,
0.9378938, 0.5240115, 0.2524014, 0.9254902, 0, 1, 1,
0.9393781, -0.09945132, 2.4136, 0.9333333, 0, 1, 1,
0.9398789, -0.5230638, 4.342972, 0.9372549, 0, 1, 1,
0.9428606, -0.8569171, -0.05196999, 0.945098, 0, 1, 1,
0.9453694, -0.3195718, 2.391925, 0.9490196, 0, 1, 1,
0.9456618, -0.3764602, 1.321399, 0.9568627, 0, 1, 1,
0.9513303, 0.6972518, 1.283087, 0.9607843, 0, 1, 1,
0.9535743, -1.818264, 1.828243, 0.9686275, 0, 1, 1,
0.9681916, 0.3875004, 1.675622, 0.972549, 0, 1, 1,
0.9695598, 0.3067762, 2.628537, 0.9803922, 0, 1, 1,
0.973004, 1.026309, 3.091237, 0.9843137, 0, 1, 1,
0.9766589, 1.934189, 0.8202649, 0.9921569, 0, 1, 1,
0.9771964, -1.277649, 5.181688, 0.9960784, 0, 1, 1,
0.9828207, 0.2884498, 1.539307, 1, 0, 0.9960784, 1,
0.9867535, 0.9897481, 0.0426343, 1, 0, 0.9882353, 1,
0.987943, -1.750495, 2.592887, 1, 0, 0.9843137, 1,
0.9897897, -0.4322426, 1.317754, 1, 0, 0.9764706, 1,
0.9900597, -0.7275351, 2.747149, 1, 0, 0.972549, 1,
0.9947408, -0.5360407, 2.211267, 1, 0, 0.9647059, 1,
0.9951959, 1.839164, 0.3410918, 1, 0, 0.9607843, 1,
1.001362, 0.1388467, -0.003852626, 1, 0, 0.9529412, 1,
1.00393, 0.9223363, 0.1341405, 1, 0, 0.9490196, 1,
1.009425, -1.215783, 0.7226131, 1, 0, 0.9411765, 1,
1.015268, -1.719658, 2.857823, 1, 0, 0.9372549, 1,
1.027782, 1.216618, 0.07814995, 1, 0, 0.9294118, 1,
1.030867, -1.801274, 0.410548, 1, 0, 0.9254902, 1,
1.03796, -0.146159, 1.630605, 1, 0, 0.9176471, 1,
1.045963, 1.020657, 1.38648, 1, 0, 0.9137255, 1,
1.050464, 1.733164, -0.9218812, 1, 0, 0.9058824, 1,
1.064366, -0.002853891, 1.480784, 1, 0, 0.9019608, 1,
1.067611, -0.3183039, 2.368947, 1, 0, 0.8941177, 1,
1.071029, 0.8933896, 1.283076, 1, 0, 0.8862745, 1,
1.080973, -0.8783429, 3.302739, 1, 0, 0.8823529, 1,
1.082334, -1.316306, 0.4987384, 1, 0, 0.8745098, 1,
1.085716, -0.9254028, 1.445109, 1, 0, 0.8705882, 1,
1.091865, -2.734307, 0.3271663, 1, 0, 0.8627451, 1,
1.092451, -1.258808, 2.987643, 1, 0, 0.8588235, 1,
1.094366, 0.6651132, 1.035883, 1, 0, 0.8509804, 1,
1.101823, -1.306777, 2.525132, 1, 0, 0.8470588, 1,
1.10517, -0.5100154, 2.077182, 1, 0, 0.8392157, 1,
1.107357, 1.46815, 1.390375, 1, 0, 0.8352941, 1,
1.108858, -0.7185413, 1.454828, 1, 0, 0.827451, 1,
1.109664, 0.1168783, 2.327916, 1, 0, 0.8235294, 1,
1.11355, 1.308874, -0.1523015, 1, 0, 0.8156863, 1,
1.115219, 0.8336068, 1.847911, 1, 0, 0.8117647, 1,
1.124375, 0.1423904, 1.699699, 1, 0, 0.8039216, 1,
1.129482, -1.725013, 3.442395, 1, 0, 0.7960784, 1,
1.130017, 0.6814029, 0.6980078, 1, 0, 0.7921569, 1,
1.133498, -0.6221586, 3.252068, 1, 0, 0.7843137, 1,
1.13449, -0.9209087, 1.685808, 1, 0, 0.7803922, 1,
1.141882, 0.9789891, 1.106839, 1, 0, 0.772549, 1,
1.142996, -0.7465894, 0.1649735, 1, 0, 0.7686275, 1,
1.154111, 0.01724092, 1.898423, 1, 0, 0.7607843, 1,
1.154231, 1.108687, 0.3330723, 1, 0, 0.7568628, 1,
1.158425, -0.1373778, -0.08122297, 1, 0, 0.7490196, 1,
1.16307, 0.07920928, 2.135916, 1, 0, 0.7450981, 1,
1.166956, -0.8321716, 1.700618, 1, 0, 0.7372549, 1,
1.174562, 1.172349, 0.35142, 1, 0, 0.7333333, 1,
1.18898, 2.392315, -0.1738885, 1, 0, 0.7254902, 1,
1.190962, 0.3759218, 1.008491, 1, 0, 0.7215686, 1,
1.203659, 0.6209213, 1.443907, 1, 0, 0.7137255, 1,
1.209869, 0.1899467, 1.941801, 1, 0, 0.7098039, 1,
1.212702, 1.11989, -0.3066972, 1, 0, 0.7019608, 1,
1.216233, -1.383816, 4.295932, 1, 0, 0.6941177, 1,
1.223069, 1.215296, 1.112022, 1, 0, 0.6901961, 1,
1.223857, -1.487525, 3.579122, 1, 0, 0.682353, 1,
1.224763, 0.004292484, 0.09210568, 1, 0, 0.6784314, 1,
1.245156, -0.7542171, 2.697494, 1, 0, 0.6705883, 1,
1.256261, -0.9498193, 1.632853, 1, 0, 0.6666667, 1,
1.258885, 1.209851, 1.252277, 1, 0, 0.6588235, 1,
1.267881, -1.151909, 2.703508, 1, 0, 0.654902, 1,
1.285417, -1.687451, 1.852902, 1, 0, 0.6470588, 1,
1.307898, 0.3861724, 0.1590141, 1, 0, 0.6431373, 1,
1.308506, -0.5396011, 0.5002908, 1, 0, 0.6352941, 1,
1.313642, -0.2899666, 2.25471, 1, 0, 0.6313726, 1,
1.319322, 0.0227394, -0.7687329, 1, 0, 0.6235294, 1,
1.319856, 0.2746225, 0.3452317, 1, 0, 0.6196079, 1,
1.321848, 0.9633623, 1.186956, 1, 0, 0.6117647, 1,
1.328907, 0.8002643, 0.421756, 1, 0, 0.6078432, 1,
1.342446, 1.608249, -1.064003, 1, 0, 0.6, 1,
1.374842, -1.045527, 1.066871, 1, 0, 0.5921569, 1,
1.375462, 1.10319, -0.7896082, 1, 0, 0.5882353, 1,
1.375971, 0.5745022, 0.7788001, 1, 0, 0.5803922, 1,
1.377108, -0.1490432, 0.1169628, 1, 0, 0.5764706, 1,
1.377514, 0.9561251, 2.113181, 1, 0, 0.5686275, 1,
1.379025, -0.2460724, 1.008137, 1, 0, 0.5647059, 1,
1.382132, -0.3594626, 1.70535, 1, 0, 0.5568628, 1,
1.388472, -0.3464136, 1.641446, 1, 0, 0.5529412, 1,
1.390979, 1.712994, 1.41099, 1, 0, 0.5450981, 1,
1.392683, 0.4734885, 1.993326, 1, 0, 0.5411765, 1,
1.394746, -0.7313536, 0.6854462, 1, 0, 0.5333334, 1,
1.398014, 1.009651, 2.864892, 1, 0, 0.5294118, 1,
1.398783, -0.4883227, 1.551937, 1, 0, 0.5215687, 1,
1.401098, 2.479565, -0.9532198, 1, 0, 0.5176471, 1,
1.407621, 1.472985, 0.4783617, 1, 0, 0.509804, 1,
1.4109, -0.4712705, 2.259581, 1, 0, 0.5058824, 1,
1.415456, -0.1856972, 2.610756, 1, 0, 0.4980392, 1,
1.418608, 1.89281, 0.8468341, 1, 0, 0.4901961, 1,
1.418614, -0.3276087, 1.948177, 1, 0, 0.4862745, 1,
1.42707, 2.070024, 2.269812, 1, 0, 0.4784314, 1,
1.439999, 0.9231944, 0.5431908, 1, 0, 0.4745098, 1,
1.442259, -2.152831, 3.478881, 1, 0, 0.4666667, 1,
1.448349, -1.210705, 2.057568, 1, 0, 0.4627451, 1,
1.44965, 0.2867359, 2.535343, 1, 0, 0.454902, 1,
1.451383, -0.3757659, 2.771219, 1, 0, 0.4509804, 1,
1.454022, -0.1479485, 3.789104, 1, 0, 0.4431373, 1,
1.457087, 1.775253, 0.5862206, 1, 0, 0.4392157, 1,
1.462986, 1.043544, 0.9238332, 1, 0, 0.4313726, 1,
1.484816, 0.4897298, 1.515092, 1, 0, 0.427451, 1,
1.48936, -2.10512, 2.306693, 1, 0, 0.4196078, 1,
1.492031, 2.176825, 1.903172, 1, 0, 0.4156863, 1,
1.504332, -2.290179, 4.0107, 1, 0, 0.4078431, 1,
1.519689, 0.9058692, 0.2066973, 1, 0, 0.4039216, 1,
1.543461, 2.413394, 0.9508088, 1, 0, 0.3960784, 1,
1.558463, 0.745965, 0.2861218, 1, 0, 0.3882353, 1,
1.566191, 0.8846824, 1.114298, 1, 0, 0.3843137, 1,
1.571328, 2.246708, 2.238227, 1, 0, 0.3764706, 1,
1.584879, 1.956437, 0.9525399, 1, 0, 0.372549, 1,
1.58875, 0.2686574, 1.161983, 1, 0, 0.3647059, 1,
1.594427, 1.139367, 0.4896746, 1, 0, 0.3607843, 1,
1.596568, 0.3083789, 1.226938, 1, 0, 0.3529412, 1,
1.600104, 0.7471284, 1.144211, 1, 0, 0.3490196, 1,
1.604064, 0.2301656, 1.485749, 1, 0, 0.3411765, 1,
1.606011, -0.6629607, 0.9701795, 1, 0, 0.3372549, 1,
1.606482, 2.59903, 1.111973, 1, 0, 0.3294118, 1,
1.606905, 0.3961756, 2.193388, 1, 0, 0.3254902, 1,
1.625254, 0.5092552, 3.369828, 1, 0, 0.3176471, 1,
1.625287, 0.8356096, 1.117295, 1, 0, 0.3137255, 1,
1.628855, -0.7974902, 3.485174, 1, 0, 0.3058824, 1,
1.644519, -0.3596796, 1.613865, 1, 0, 0.2980392, 1,
1.64618, -0.8900279, 1.558185, 1, 0, 0.2941177, 1,
1.648648, 0.5991555, -1.014975, 1, 0, 0.2862745, 1,
1.657292, -1.994781, 1.978665, 1, 0, 0.282353, 1,
1.660667, -1.668456, 2.929896, 1, 0, 0.2745098, 1,
1.675986, -0.3383161, 2.784231, 1, 0, 0.2705882, 1,
1.679781, -1.569012, 3.064387, 1, 0, 0.2627451, 1,
1.723397, -0.5248358, 1.323865, 1, 0, 0.2588235, 1,
1.737594, 0.8346907, 1.614327, 1, 0, 0.2509804, 1,
1.741604, 0.116521, 3.195149, 1, 0, 0.2470588, 1,
1.77371, 0.7766731, 0.8970908, 1, 0, 0.2392157, 1,
1.774714, 0.572405, 1.540505, 1, 0, 0.2352941, 1,
1.775349, 0.3259371, 0.6415201, 1, 0, 0.227451, 1,
1.790883, -0.49378, 3.193235, 1, 0, 0.2235294, 1,
1.804793, -1.298712, 0.3207591, 1, 0, 0.2156863, 1,
1.807382, 0.7081782, 0.2256424, 1, 0, 0.2117647, 1,
1.814062, -0.219517, 2.764414, 1, 0, 0.2039216, 1,
1.824725, -0.2406423, 0.4790763, 1, 0, 0.1960784, 1,
1.824821, -0.334602, 3.430923, 1, 0, 0.1921569, 1,
1.830661, 0.1581385, 1.765209, 1, 0, 0.1843137, 1,
1.837555, -0.2354914, 1.480161, 1, 0, 0.1803922, 1,
1.845327, -0.1623929, 0.5046327, 1, 0, 0.172549, 1,
1.846753, -1.497352, 1.326147, 1, 0, 0.1686275, 1,
1.89915, 0.8969776, 0.3150767, 1, 0, 0.1607843, 1,
1.904395, -2.416259, 1.436265, 1, 0, 0.1568628, 1,
1.926335, 0.4533178, 1.127739, 1, 0, 0.1490196, 1,
1.943168, 2.255085, 0.2852298, 1, 0, 0.145098, 1,
1.97519, -0.06047067, 1.085509, 1, 0, 0.1372549, 1,
2.021199, -1.297245, 3.680725, 1, 0, 0.1333333, 1,
2.03785, 0.8118493, 1.167208, 1, 0, 0.1254902, 1,
2.043747, -1.142262, 2.207007, 1, 0, 0.1215686, 1,
2.04431, 1.634171, 1.69886, 1, 0, 0.1137255, 1,
2.068508, 0.7008526, 1.381424, 1, 0, 0.1098039, 1,
2.075772, 0.2646625, 1.516936, 1, 0, 0.1019608, 1,
2.080148, -0.08434221, 1.317885, 1, 0, 0.09411765, 1,
2.090139, 1.547788, -1.235254, 1, 0, 0.09019608, 1,
2.129644, 0.07682052, 1.089667, 1, 0, 0.08235294, 1,
2.149929, 1.311918, 0.7505679, 1, 0, 0.07843138, 1,
2.16256, -1.80153, 2.035076, 1, 0, 0.07058824, 1,
2.186419, 0.5400716, 1.773969, 1, 0, 0.06666667, 1,
2.198917, 0.3991576, 2.605079, 1, 0, 0.05882353, 1,
2.200246, -1.379651, 3.721897, 1, 0, 0.05490196, 1,
2.359883, -0.02769467, 0.617657, 1, 0, 0.04705882, 1,
2.536153, 1.72797, 2.772385, 1, 0, 0.04313726, 1,
2.622903, -0.5602721, 0.7414878, 1, 0, 0.03529412, 1,
2.653821, -0.4864776, 3.402642, 1, 0, 0.03137255, 1,
2.778402, -0.6342956, 0.5534649, 1, 0, 0.02352941, 1,
3.247717, -0.1500178, 1.10227, 1, 0, 0.01960784, 1,
3.295501, -0.124973, 1.553202, 1, 0, 0.01176471, 1,
3.733061, 1.269395, 1.695704, 1, 0, 0.007843138, 1
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
-0.02892053, -3.908768, -6.847735, 0, -0.5, 0.5, 0.5,
-0.02892053, -3.908768, -6.847735, 1, -0.5, 0.5, 0.5,
-0.02892053, -3.908768, -6.847735, 1, 1.5, 0.5, 0.5,
-0.02892053, -3.908768, -6.847735, 0, 1.5, 0.5, 0.5
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
-5.066214, 0.05074596, -6.847735, 0, -0.5, 0.5, 0.5,
-5.066214, 0.05074596, -6.847735, 1, -0.5, 0.5, 0.5,
-5.066214, 0.05074596, -6.847735, 1, 1.5, 0.5, 0.5,
-5.066214, 0.05074596, -6.847735, 0, 1.5, 0.5, 0.5
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
-5.066214, -3.908768, 0.05417132, 0, -0.5, 0.5, 0.5,
-5.066214, -3.908768, 0.05417132, 1, -0.5, 0.5, 0.5,
-5.066214, -3.908768, 0.05417132, 1, 1.5, 0.5, 0.5,
-5.066214, -3.908768, 0.05417132, 0, 1.5, 0.5, 0.5
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
-2, -2.995034, -5.254988,
2, -2.995034, -5.254988,
-2, -2.995034, -5.254988,
-2, -3.147323, -5.520445,
0, -2.995034, -5.254988,
0, -3.147323, -5.520445,
2, -2.995034, -5.254988,
2, -3.147323, -5.520445
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
-2, -3.451901, -6.051362, 0, -0.5, 0.5, 0.5,
-2, -3.451901, -6.051362, 1, -0.5, 0.5, 0.5,
-2, -3.451901, -6.051362, 1, 1.5, 0.5, 0.5,
-2, -3.451901, -6.051362, 0, 1.5, 0.5, 0.5,
0, -3.451901, -6.051362, 0, -0.5, 0.5, 0.5,
0, -3.451901, -6.051362, 1, -0.5, 0.5, 0.5,
0, -3.451901, -6.051362, 1, 1.5, 0.5, 0.5,
0, -3.451901, -6.051362, 0, 1.5, 0.5, 0.5,
2, -3.451901, -6.051362, 0, -0.5, 0.5, 0.5,
2, -3.451901, -6.051362, 1, -0.5, 0.5, 0.5,
2, -3.451901, -6.051362, 1, 1.5, 0.5, 0.5,
2, -3.451901, -6.051362, 0, 1.5, 0.5, 0.5
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
-3.903762, -2, -5.254988,
-3.903762, 3, -5.254988,
-3.903762, -2, -5.254988,
-4.097504, -2, -5.520445,
-3.903762, -1, -5.254988,
-4.097504, -1, -5.520445,
-3.903762, 0, -5.254988,
-4.097504, 0, -5.520445,
-3.903762, 1, -5.254988,
-4.097504, 1, -5.520445,
-3.903762, 2, -5.254988,
-4.097504, 2, -5.520445,
-3.903762, 3, -5.254988,
-4.097504, 3, -5.520445
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
-4.484988, -2, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, -2, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, -2, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, -2, -6.051362, 0, 1.5, 0.5, 0.5,
-4.484988, -1, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, -1, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, -1, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, -1, -6.051362, 0, 1.5, 0.5, 0.5,
-4.484988, 0, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, 0, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, 0, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, 0, -6.051362, 0, 1.5, 0.5, 0.5,
-4.484988, 1, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, 1, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, 1, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, 1, -6.051362, 0, 1.5, 0.5, 0.5,
-4.484988, 2, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, 2, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, 2, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, 2, -6.051362, 0, 1.5, 0.5, 0.5,
-4.484988, 3, -6.051362, 0, -0.5, 0.5, 0.5,
-4.484988, 3, -6.051362, 1, -0.5, 0.5, 0.5,
-4.484988, 3, -6.051362, 1, 1.5, 0.5, 0.5,
-4.484988, 3, -6.051362, 0, 1.5, 0.5, 0.5
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
-3.903762, -2.995034, -4,
-3.903762, -2.995034, 4,
-3.903762, -2.995034, -4,
-4.097504, -3.147323, -4,
-3.903762, -2.995034, -2,
-4.097504, -3.147323, -2,
-3.903762, -2.995034, 0,
-4.097504, -3.147323, 0,
-3.903762, -2.995034, 2,
-4.097504, -3.147323, 2,
-3.903762, -2.995034, 4,
-4.097504, -3.147323, 4
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
-4.484988, -3.451901, -4, 0, -0.5, 0.5, 0.5,
-4.484988, -3.451901, -4, 1, -0.5, 0.5, 0.5,
-4.484988, -3.451901, -4, 1, 1.5, 0.5, 0.5,
-4.484988, -3.451901, -4, 0, 1.5, 0.5, 0.5,
-4.484988, -3.451901, -2, 0, -0.5, 0.5, 0.5,
-4.484988, -3.451901, -2, 1, -0.5, 0.5, 0.5,
-4.484988, -3.451901, -2, 1, 1.5, 0.5, 0.5,
-4.484988, -3.451901, -2, 0, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 0, 0, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 0, 1, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 0, 1, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 0, 0, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 2, 0, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 2, 1, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 2, 1, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 2, 0, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 4, 0, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 4, 1, -0.5, 0.5, 0.5,
-4.484988, -3.451901, 4, 1, 1.5, 0.5, 0.5,
-4.484988, -3.451901, 4, 0, 1.5, 0.5, 0.5
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
-3.903762, -2.995034, -5.254988,
-3.903762, 3.096526, -5.254988,
-3.903762, -2.995034, 5.36333,
-3.903762, 3.096526, 5.36333,
-3.903762, -2.995034, -5.254988,
-3.903762, -2.995034, 5.36333,
-3.903762, 3.096526, -5.254988,
-3.903762, 3.096526, 5.36333,
-3.903762, -2.995034, -5.254988,
3.845921, -2.995034, -5.254988,
-3.903762, -2.995034, 5.36333,
3.845921, -2.995034, 5.36333,
-3.903762, 3.096526, -5.254988,
3.845921, 3.096526, -5.254988,
-3.903762, 3.096526, 5.36333,
3.845921, 3.096526, 5.36333,
3.845921, -2.995034, -5.254988,
3.845921, 3.096526, -5.254988,
3.845921, -2.995034, 5.36333,
3.845921, 3.096526, 5.36333,
3.845921, -2.995034, -5.254988,
3.845921, -2.995034, 5.36333,
3.845921, 3.096526, -5.254988,
3.845921, 3.096526, 5.36333
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
var radius = 7.736517;
var distance = 34.42064;
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
mvMatrix.translate( 0.02892053, -0.05074596, -0.05417132 );
mvMatrix.scale( 1.079383, 1.373191, 0.7877777 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.42064);
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
manganese_ethylenebi<-read.table("manganese_ethylenebi.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-manganese_ethylenebi$V2
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
y<-manganese_ethylenebi$V3
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
```

```r
z<-manganese_ethylenebi$V4
```

```
## Error in eval(expr, envir, enclos): object 'manganese_ethylenebi' not found
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
-3.790902, 1.970287, -1.958699, 0, 0, 1, 1, 1,
-2.973759, 1.153973, -1.067171, 1, 0, 0, 1, 1,
-2.969218, -0.2081515, -1.270144, 1, 0, 0, 1, 1,
-2.959797, -0.7294902, -2.491985, 1, 0, 0, 1, 1,
-2.908607, -0.5084171, -1.935265, 1, 0, 0, 1, 1,
-2.801722, 1.440389, -2.55319, 1, 0, 0, 1, 1,
-2.723164, 0.03163165, -0.5906535, 0, 0, 0, 1, 1,
-2.716054, 0.7721306, -0.590404, 0, 0, 0, 1, 1,
-2.713453, 2.860861, -0.7418619, 0, 0, 0, 1, 1,
-2.691965, 0.6118057, -2.064038, 0, 0, 0, 1, 1,
-2.634448, -0.4901448, -1.079187, 0, 0, 0, 1, 1,
-2.627861, -0.1794592, -3.300647, 0, 0, 0, 1, 1,
-2.528493, 0.5603024, -2.183211, 0, 0, 0, 1, 1,
-2.513711, -2.787075, -2.773957, 1, 1, 1, 1, 1,
-2.393927, 0.05501327, -0.5042395, 1, 1, 1, 1, 1,
-2.2938, 1.161207, -2.315533, 1, 1, 1, 1, 1,
-2.264286, 0.4434469, -2.031313, 1, 1, 1, 1, 1,
-2.255011, -0.08891824, -1.429729, 1, 1, 1, 1, 1,
-2.251963, 0.3121564, -1.114468, 1, 1, 1, 1, 1,
-2.248194, 0.4564664, -1.803965, 1, 1, 1, 1, 1,
-2.248059, -1.406499, -0.7714049, 1, 1, 1, 1, 1,
-2.194306, 0.5226473, -1.737749, 1, 1, 1, 1, 1,
-2.167829, 0.5651515, -1.196706, 1, 1, 1, 1, 1,
-2.150445, -1.344561, -1.737528, 1, 1, 1, 1, 1,
-2.133872, 0.4634559, -0.8715243, 1, 1, 1, 1, 1,
-2.102445, -0.3946072, -2.060212, 1, 1, 1, 1, 1,
-2.094234, -2.472014, -3.09502, 1, 1, 1, 1, 1,
-2.070652, -1.620453, -1.286079, 1, 1, 1, 1, 1,
-2.044134, -1.258712, -0.4686122, 0, 0, 1, 1, 1,
-2.016918, 0.9304896, -1.372921, 1, 0, 0, 1, 1,
-1.996003, 1.226457, -1.256354, 1, 0, 0, 1, 1,
-1.98803, -0.277576, -1.725302, 1, 0, 0, 1, 1,
-1.979495, 0.4954261, -1.25682, 1, 0, 0, 1, 1,
-1.953942, 0.9645802, -1.995289, 1, 0, 0, 1, 1,
-1.940251, -0.3384068, -1.233916, 0, 0, 0, 1, 1,
-1.878637, 0.4282072, 0.7937081, 0, 0, 0, 1, 1,
-1.864511, 1.028358, 0.1793753, 0, 0, 0, 1, 1,
-1.839953, -1.012541, -0.1423437, 0, 0, 0, 1, 1,
-1.831659, -1.263119, -2.896301, 0, 0, 0, 1, 1,
-1.814071, -1.581784, -2.294833, 0, 0, 0, 1, 1,
-1.798478, 0.547062, 0.06168219, 0, 0, 0, 1, 1,
-1.793166, -0.4428814, -1.099614, 1, 1, 1, 1, 1,
-1.774392, 1.525874, 0.5835657, 1, 1, 1, 1, 1,
-1.773425, 0.7191556, -0.04679634, 1, 1, 1, 1, 1,
-1.739877, 0.3975301, -2.405248, 1, 1, 1, 1, 1,
-1.739099, -0.1197506, -0.8270164, 1, 1, 1, 1, 1,
-1.73465, -1.56409, -1.467754, 1, 1, 1, 1, 1,
-1.727407, 0.6267029, -1.614526, 1, 1, 1, 1, 1,
-1.725137, 1.428425, 0.4631933, 1, 1, 1, 1, 1,
-1.724086, -0.4014108, -0.8752704, 1, 1, 1, 1, 1,
-1.719357, 0.174243, 0.5349647, 1, 1, 1, 1, 1,
-1.717947, -0.5787953, -2.305201, 1, 1, 1, 1, 1,
-1.691678, -1.067119, -0.3226234, 1, 1, 1, 1, 1,
-1.684117, -1.613692, -4.195553, 1, 1, 1, 1, 1,
-1.682886, 0.3068536, -3.294447, 1, 1, 1, 1, 1,
-1.674383, 0.7141557, -1.652341, 1, 1, 1, 1, 1,
-1.658021, -0.8078062, -2.710956, 0, 0, 1, 1, 1,
-1.656368, 2.269401, 1.001935, 1, 0, 0, 1, 1,
-1.655801, 0.3365592, -2.441814, 1, 0, 0, 1, 1,
-1.653451, 1.047719, -0.1539283, 1, 0, 0, 1, 1,
-1.64004, 1.466668, -1.119333, 1, 0, 0, 1, 1,
-1.636652, -1.896383, -2.977547, 1, 0, 0, 1, 1,
-1.625878, -2.118749, -2.098358, 0, 0, 0, 1, 1,
-1.62234, -0.1382088, -2.490398, 0, 0, 0, 1, 1,
-1.591488, 1.321781, -1.668368, 0, 0, 0, 1, 1,
-1.589652, 1.403735, -0.8814798, 0, 0, 0, 1, 1,
-1.57338, -0.6846336, -1.037945, 0, 0, 0, 1, 1,
-1.56907, 0.3805177, -1.202485, 0, 0, 0, 1, 1,
-1.56598, -1.03861, -3.328278, 0, 0, 0, 1, 1,
-1.560315, -1.075673, -2.87706, 1, 1, 1, 1, 1,
-1.551965, -0.487585, -2.386194, 1, 1, 1, 1, 1,
-1.542712, 0.3619318, -2.091943, 1, 1, 1, 1, 1,
-1.530539, -1.219332, -1.57866, 1, 1, 1, 1, 1,
-1.521426, 1.446096, 0.7575572, 1, 1, 1, 1, 1,
-1.518098, -1.553232, -3.373839, 1, 1, 1, 1, 1,
-1.515838, -0.8772982, -1.829311, 1, 1, 1, 1, 1,
-1.514875, -0.1694071, -2.269955, 1, 1, 1, 1, 1,
-1.510675, 0.6005747, -2.096999, 1, 1, 1, 1, 1,
-1.504733, 0.8650456, -1.676898, 1, 1, 1, 1, 1,
-1.493216, -0.3234042, -1.658094, 1, 1, 1, 1, 1,
-1.482965, -0.2784405, -0.2206193, 1, 1, 1, 1, 1,
-1.474448, -0.1549337, -2.452109, 1, 1, 1, 1, 1,
-1.468364, 0.0641418, -2.21417, 1, 1, 1, 1, 1,
-1.464948, -0.4964622, -1.882587, 1, 1, 1, 1, 1,
-1.450983, -0.616568, -0.9790519, 0, 0, 1, 1, 1,
-1.450449, 1.404548, -0.09811749, 1, 0, 0, 1, 1,
-1.449842, 1.925059, 0.03286922, 1, 0, 0, 1, 1,
-1.448248, -0.9925371, -2.719654, 1, 0, 0, 1, 1,
-1.433911, -1.09673, -2.505464, 1, 0, 0, 1, 1,
-1.424614, -2.849401, -2.086211, 1, 0, 0, 1, 1,
-1.41788, -0.02130561, -4.070505, 0, 0, 0, 1, 1,
-1.415905, 0.7070979, -0.3979931, 0, 0, 0, 1, 1,
-1.410507, 0.1821921, -0.9489869, 0, 0, 0, 1, 1,
-1.408291, -0.9901503, -3.02581, 0, 0, 0, 1, 1,
-1.407877, 0.08895487, -1.874764, 0, 0, 0, 1, 1,
-1.405077, 0.08137511, 0.1773207, 0, 0, 0, 1, 1,
-1.374507, -0.6023847, -1.721866, 0, 0, 0, 1, 1,
-1.364991, 1.156674, -2.391549, 1, 1, 1, 1, 1,
-1.364205, 2.323336, -1.45762, 1, 1, 1, 1, 1,
-1.352917, -1.351972, -2.218477, 1, 1, 1, 1, 1,
-1.350894, -0.3062991, -2.009055, 1, 1, 1, 1, 1,
-1.32455, 0.3427711, -0.4954539, 1, 1, 1, 1, 1,
-1.31699, 0.7145156, -0.7414048, 1, 1, 1, 1, 1,
-1.306845, -0.1800665, -1.034614, 1, 1, 1, 1, 1,
-1.304101, 0.2058877, -2.971957, 1, 1, 1, 1, 1,
-1.284731, 0.3391846, -1.00864, 1, 1, 1, 1, 1,
-1.256756, -0.391495, -1.312018, 1, 1, 1, 1, 1,
-1.256176, 0.8875635, -2.129447, 1, 1, 1, 1, 1,
-1.256047, 0.7735246, 0.6138805, 1, 1, 1, 1, 1,
-1.246983, -0.3646526, -2.452076, 1, 1, 1, 1, 1,
-1.239686, 0.04809374, -0.2639825, 1, 1, 1, 1, 1,
-1.237459, -1.195446, -1.670492, 1, 1, 1, 1, 1,
-1.230977, 0.1507956, -2.127789, 0, 0, 1, 1, 1,
-1.229342, -1.379864, -2.617304, 1, 0, 0, 1, 1,
-1.225793, -1.756265, -3.21845, 1, 0, 0, 1, 1,
-1.221238, -0.3036105, -2.1154, 1, 0, 0, 1, 1,
-1.218829, 0.3285914, -0.641386, 1, 0, 0, 1, 1,
-1.217356, -1.145194, -3.571252, 1, 0, 0, 1, 1,
-1.198435, -0.614188, -4.298693, 0, 0, 0, 1, 1,
-1.191381, -1.491284, -0.8070665, 0, 0, 0, 1, 1,
-1.190965, 1.799697, -0.6921273, 0, 0, 0, 1, 1,
-1.189498, -0.1432332, -2.055325, 0, 0, 0, 1, 1,
-1.189284, -0.3027798, -2.034011, 0, 0, 0, 1, 1,
-1.187243, 0.4939321, -2.671152, 0, 0, 0, 1, 1,
-1.187044, -1.310757, -2.200711, 0, 0, 0, 1, 1,
-1.185111, 1.045653, -1.879159, 1, 1, 1, 1, 1,
-1.185045, 1.980427, -0.3412523, 1, 1, 1, 1, 1,
-1.184768, 0.2184695, -0.1528883, 1, 1, 1, 1, 1,
-1.179424, -1.537657, -3.582449, 1, 1, 1, 1, 1,
-1.175516, -0.1254324, -2.338812, 1, 1, 1, 1, 1,
-1.170451, 0.4986717, -1.631643, 1, 1, 1, 1, 1,
-1.162554, -0.4864185, -3.076856, 1, 1, 1, 1, 1,
-1.158389, -0.6066618, -1.678676, 1, 1, 1, 1, 1,
-1.158253, 0.613618, 0.9393412, 1, 1, 1, 1, 1,
-1.153133, -0.7238248, -1.351751, 1, 1, 1, 1, 1,
-1.143004, 0.3828637, 0.005694692, 1, 1, 1, 1, 1,
-1.141101, 1.050955, 0.4720722, 1, 1, 1, 1, 1,
-1.135612, -0.3829001, -1.447654, 1, 1, 1, 1, 1,
-1.123344, 0.387652, -1.345489, 1, 1, 1, 1, 1,
-1.118742, -0.8223606, -1.69965, 1, 1, 1, 1, 1,
-1.111915, -0.1048832, -1.542796, 0, 0, 1, 1, 1,
-1.10827, -2.110004, -0.7193535, 1, 0, 0, 1, 1,
-1.107356, -0.3543833, -0.5784082, 1, 0, 0, 1, 1,
-1.102799, -0.5639575, -2.950091, 1, 0, 0, 1, 1,
-1.101797, 0.2958809, -0.6397572, 1, 0, 0, 1, 1,
-1.090503, 1.270077, -0.1481514, 1, 0, 0, 1, 1,
-1.085887, 1.655751, 1.121055, 0, 0, 0, 1, 1,
-1.083815, -0.3068876, -0.4127198, 0, 0, 0, 1, 1,
-1.068508, 0.21785, -2.085404, 0, 0, 0, 1, 1,
-1.067908, 0.9307387, -0.1060793, 0, 0, 0, 1, 1,
-1.066352, -0.1126806, -2.808149, 0, 0, 0, 1, 1,
-1.064015, 2.031995, -0.684018, 0, 0, 0, 1, 1,
-1.059135, -0.3796239, -1.661881, 0, 0, 0, 1, 1,
-1.051153, 0.516071, -1.528614, 1, 1, 1, 1, 1,
-1.050427, -0.3233819, -2.850327, 1, 1, 1, 1, 1,
-1.047685, 1.465251, -0.7492263, 1, 1, 1, 1, 1,
-1.044486, 1.080718, -2.164564, 1, 1, 1, 1, 1,
-1.040979, 1.65656, -1.574666, 1, 1, 1, 1, 1,
-1.037351, 0.337036, -4.397341, 1, 1, 1, 1, 1,
-1.036145, 0.9122605, -2.289442, 1, 1, 1, 1, 1,
-1.028607, -1.392577, -2.060635, 1, 1, 1, 1, 1,
-1.021184, -1.20662, -2.68698, 1, 1, 1, 1, 1,
-1.016119, -0.4588443, -2.587066, 1, 1, 1, 1, 1,
-1.015586, 0.7157977, -2.241152, 1, 1, 1, 1, 1,
-1.014723, 1.443054, 0.2453255, 1, 1, 1, 1, 1,
-1.012708, -0.7035765, 0.3598527, 1, 1, 1, 1, 1,
-1.012439, -1.534773, -1.378513, 1, 1, 1, 1, 1,
-1.006455, 0.5343117, -1.215329, 1, 1, 1, 1, 1,
-0.9957532, -2.051106, -3.18206, 0, 0, 1, 1, 1,
-0.9942316, 0.3254989, -2.213046, 1, 0, 0, 1, 1,
-0.9904459, -0.5733362, -0.8997424, 1, 0, 0, 1, 1,
-0.9888867, -0.06637565, -1.967088, 1, 0, 0, 1, 1,
-0.9788545, -0.2522041, -2.841686, 1, 0, 0, 1, 1,
-0.9776109, -0.9282448, -2.113431, 1, 0, 0, 1, 1,
-0.9775878, -0.02124898, -3.559176, 0, 0, 0, 1, 1,
-0.9684222, 0.3680994, -1.203928, 0, 0, 0, 1, 1,
-0.9681008, 0.9112282, -2.00829, 0, 0, 0, 1, 1,
-0.9651509, 1.411593, -1.916078, 0, 0, 0, 1, 1,
-0.9516764, 1.316671, -1.455595, 0, 0, 0, 1, 1,
-0.9511434, 0.9581317, -1.391375, 0, 0, 0, 1, 1,
-0.9458128, 1.019151, -1.502394, 0, 0, 0, 1, 1,
-0.94192, -0.2411089, -2.912795, 1, 1, 1, 1, 1,
-0.9321681, -0.422351, -2.980309, 1, 1, 1, 1, 1,
-0.9248318, -1.036335, -2.159871, 1, 1, 1, 1, 1,
-0.9146049, -0.5070101, -0.7199556, 1, 1, 1, 1, 1,
-0.9103842, -0.1453385, -0.03387359, 1, 1, 1, 1, 1,
-0.9099377, 0.9447021, -0.9787716, 1, 1, 1, 1, 1,
-0.9079572, 0.2836739, -1.212367, 1, 1, 1, 1, 1,
-0.9071801, 0.3636566, -1.05487, 1, 1, 1, 1, 1,
-0.9053341, 0.2525497, -2.439271, 1, 1, 1, 1, 1,
-0.8913614, -1.46795, -4.442255, 1, 1, 1, 1, 1,
-0.8873709, 0.03521835, -2.009443, 1, 1, 1, 1, 1,
-0.8815084, -0.9025086, -4.133138, 1, 1, 1, 1, 1,
-0.8814092, 1.158299, -1.234693, 1, 1, 1, 1, 1,
-0.8795393, 0.7248839, -0.9070785, 1, 1, 1, 1, 1,
-0.877299, 0.8349798, -0.6947135, 1, 1, 1, 1, 1,
-0.8770995, -0.271266, -2.450914, 0, 0, 1, 1, 1,
-0.8740547, 0.1559088, -2.989506, 1, 0, 0, 1, 1,
-0.8731423, 0.8772404, -0.8770031, 1, 0, 0, 1, 1,
-0.8680159, 0.9914423, -0.2397084, 1, 0, 0, 1, 1,
-0.8627776, -1.968139, -2.091841, 1, 0, 0, 1, 1,
-0.8593469, -1.241286, -1.788069, 1, 0, 0, 1, 1,
-0.8570741, -1.98408, -2.592784, 0, 0, 0, 1, 1,
-0.8555168, -0.9399092, -1.59181, 0, 0, 0, 1, 1,
-0.8490836, 0.3742279, 0.2975766, 0, 0, 0, 1, 1,
-0.843073, 1.288817, 0.5951616, 0, 0, 0, 1, 1,
-0.8414654, -1.697066, -0.246046, 0, 0, 0, 1, 1,
-0.8391812, -0.1287064, -2.032082, 0, 0, 0, 1, 1,
-0.8314967, -0.8441626, -3.145647, 0, 0, 0, 1, 1,
-0.8289794, 1.335346, -1.591003, 1, 1, 1, 1, 1,
-0.82344, -0.1611361, -1.718367, 1, 1, 1, 1, 1,
-0.8214422, -0.3248386, -1.803723, 1, 1, 1, 1, 1,
-0.8169366, 1.799158, 0.681462, 1, 1, 1, 1, 1,
-0.8151555, 1.249866, -1.950103, 1, 1, 1, 1, 1,
-0.8146844, 1.008578, 0.6511238, 1, 1, 1, 1, 1,
-0.810109, 0.739774, -1.03905, 1, 1, 1, 1, 1,
-0.810041, -0.3705475, -2.468883, 1, 1, 1, 1, 1,
-0.809559, -0.2627551, -3.815713, 1, 1, 1, 1, 1,
-0.8088139, 0.7827616, -1.137457, 1, 1, 1, 1, 1,
-0.8073288, -1.025774, -3.59048, 1, 1, 1, 1, 1,
-0.8054948, -0.3953324, -2.834824, 1, 1, 1, 1, 1,
-0.8011225, -0.9692413, -3.068807, 1, 1, 1, 1, 1,
-0.7993394, -0.5576562, -1.947234, 1, 1, 1, 1, 1,
-0.797977, -0.03519723, 1.186976, 1, 1, 1, 1, 1,
-0.7930766, 0.4822066, -2.515797, 0, 0, 1, 1, 1,
-0.7865188, 0.7666481, 0.06088446, 1, 0, 0, 1, 1,
-0.786051, -0.8817221, -2.405589, 1, 0, 0, 1, 1,
-0.7843381, 0.470633, -1.103617, 1, 0, 0, 1, 1,
-0.7840415, -0.9197234, -1.952435, 1, 0, 0, 1, 1,
-0.7764452, -0.3288183, -1.644916, 1, 0, 0, 1, 1,
-0.7750856, 0.5997108, -2.265802, 0, 0, 0, 1, 1,
-0.7745512, 1.493512, -1.687222, 0, 0, 0, 1, 1,
-0.7720399, 0.2826422, -2.491328, 0, 0, 0, 1, 1,
-0.7681222, -0.2425838, -1.989276, 0, 0, 0, 1, 1,
-0.7672366, -0.03767984, -3.418696, 0, 0, 0, 1, 1,
-0.7665832, 2.602905, -0.3142362, 0, 0, 0, 1, 1,
-0.7649773, 0.2969017, -0.6816726, 0, 0, 0, 1, 1,
-0.7618544, 0.2675142, -0.907003, 1, 1, 1, 1, 1,
-0.7569507, -2.375436, -2.391715, 1, 1, 1, 1, 1,
-0.7501841, -0.9441329, -1.342282, 1, 1, 1, 1, 1,
-0.749659, 0.5899518, 0.223695, 1, 1, 1, 1, 1,
-0.7480712, 1.254609, 0.2655452, 1, 1, 1, 1, 1,
-0.7416106, 0.2696828, -1.827251, 1, 1, 1, 1, 1,
-0.7391883, -0.782677, -2.231824, 1, 1, 1, 1, 1,
-0.734284, -0.09788895, -2.042715, 1, 1, 1, 1, 1,
-0.7340605, 1.357789, -1.489514, 1, 1, 1, 1, 1,
-0.7339445, -0.9245491, -2.316394, 1, 1, 1, 1, 1,
-0.719565, -1.252745, -2.472266, 1, 1, 1, 1, 1,
-0.719028, -0.1655268, -0.3273522, 1, 1, 1, 1, 1,
-0.718365, -0.6570212, -2.066804, 1, 1, 1, 1, 1,
-0.716254, -0.2818747, -2.965081, 1, 1, 1, 1, 1,
-0.7119234, -0.3232268, -0.8781112, 1, 1, 1, 1, 1,
-0.7052621, -0.3968436, -1.851735, 0, 0, 1, 1, 1,
-0.7044303, -1.647425, -0.2819372, 1, 0, 0, 1, 1,
-0.6954849, -0.2486093, -3.989969, 1, 0, 0, 1, 1,
-0.6940312, 1.443782, -0.4162148, 1, 0, 0, 1, 1,
-0.6912556, -0.3107603, -2.775382, 1, 0, 0, 1, 1,
-0.6884973, -2.194274, -1.363343, 1, 0, 0, 1, 1,
-0.6755447, 1.803145, -0.5409268, 0, 0, 0, 1, 1,
-0.6716506, -0.7564721, -2.992693, 0, 0, 0, 1, 1,
-0.6707292, -0.5744182, -2.62371, 0, 0, 0, 1, 1,
-0.6695905, -1.766166, -3.125238, 0, 0, 0, 1, 1,
-0.6690534, -1.705959, -1.525451, 0, 0, 0, 1, 1,
-0.6688995, -0.8268442, -2.930002, 0, 0, 0, 1, 1,
-0.6657692, -0.4854232, -2.284028, 0, 0, 0, 1, 1,
-0.6648549, 0.8598614, 0.2621996, 1, 1, 1, 1, 1,
-0.6635243, -0.282094, -3.913854, 1, 1, 1, 1, 1,
-0.6604211, 0.209505, -1.975348, 1, 1, 1, 1, 1,
-0.6599538, -0.9580693, -1.730316, 1, 1, 1, 1, 1,
-0.6575674, -0.9532012, -2.032473, 1, 1, 1, 1, 1,
-0.6526714, -0.3665867, -2.147607, 1, 1, 1, 1, 1,
-0.6526074, 0.8084634, 0.2659558, 1, 1, 1, 1, 1,
-0.6495029, -0.3781612, -1.050281, 1, 1, 1, 1, 1,
-0.6460354, -0.6289985, -2.412421, 1, 1, 1, 1, 1,
-0.6458784, 1.85984, -1.039319, 1, 1, 1, 1, 1,
-0.644906, 1.093934, -0.7275668, 1, 1, 1, 1, 1,
-0.6425086, 0.7083268, -2.59046, 1, 1, 1, 1, 1,
-0.6421287, 0.08420468, -0.8113996, 1, 1, 1, 1, 1,
-0.6382711, -0.1515382, -2.398436, 1, 1, 1, 1, 1,
-0.6297852, 0.05344349, -3.167772, 1, 1, 1, 1, 1,
-0.6232288, -1.895595, -2.251819, 0, 0, 1, 1, 1,
-0.621769, 0.7894033, -0.05258717, 1, 0, 0, 1, 1,
-0.6182764, -1.199694, -3.50507, 1, 0, 0, 1, 1,
-0.6177036, -0.254557, -2.049916, 1, 0, 0, 1, 1,
-0.6159231, 0.8158374, -1.462813, 1, 0, 0, 1, 1,
-0.6137353, 0.3132137, -1.726246, 1, 0, 0, 1, 1,
-0.6126419, 0.3651016, -2.841183, 0, 0, 0, 1, 1,
-0.6085679, 2.445778, -0.4594772, 0, 0, 0, 1, 1,
-0.6041139, -0.1044083, -1.671505, 0, 0, 0, 1, 1,
-0.6025254, -1.202193, -4.87665, 0, 0, 0, 1, 1,
-0.5953868, 0.3132246, -1.159793, 0, 0, 0, 1, 1,
-0.5890925, 0.6371834, -1.420653, 0, 0, 0, 1, 1,
-0.5878626, -1.147368, -3.639361, 0, 0, 0, 1, 1,
-0.5824515, -0.3238553, -2.527147, 1, 1, 1, 1, 1,
-0.5821641, 0.6401405, -2.028232, 1, 1, 1, 1, 1,
-0.5807399, -0.1246536, -1.831162, 1, 1, 1, 1, 1,
-0.5788057, -0.4504608, -2.289965, 1, 1, 1, 1, 1,
-0.5772935, -1.682643, -2.953643, 1, 1, 1, 1, 1,
-0.5761352, 0.237702, -0.739862, 1, 1, 1, 1, 1,
-0.5712965, -0.09083135, -3.284672, 1, 1, 1, 1, 1,
-0.5666389, -1.498014, -3.398888, 1, 1, 1, 1, 1,
-0.5659813, -0.6025004, -1.653607, 1, 1, 1, 1, 1,
-0.565465, 0.7180086, -0.9908726, 1, 1, 1, 1, 1,
-0.5613632, 0.02636393, -0.8634359, 1, 1, 1, 1, 1,
-0.5563581, -0.6229818, -0.9866594, 1, 1, 1, 1, 1,
-0.5556986, -2.485409, -4.10634, 1, 1, 1, 1, 1,
-0.5544614, 1.399525, -1.119873, 1, 1, 1, 1, 1,
-0.5527151, 0.2047848, -2.882376, 1, 1, 1, 1, 1,
-0.5459331, 1.530967, -0.3384176, 0, 0, 1, 1, 1,
-0.5451684, 0.8818314, 0.5920375, 1, 0, 0, 1, 1,
-0.5416607, -0.6213543, -1.894087, 1, 0, 0, 1, 1,
-0.534829, 0.04135033, -1.147461, 1, 0, 0, 1, 1,
-0.5337949, 0.1736965, -1.309756, 1, 0, 0, 1, 1,
-0.5305976, -0.06754268, -0.8992693, 1, 0, 0, 1, 1,
-0.5290421, 1.826997, -1.457137, 0, 0, 0, 1, 1,
-0.5232076, -0.1960146, -2.397593, 0, 0, 0, 1, 1,
-0.5211873, 0.2105998, 0.6830603, 0, 0, 0, 1, 1,
-0.520161, 2.002664, -0.04882047, 0, 0, 0, 1, 1,
-0.5200058, -0.3167947, -1.59274, 0, 0, 0, 1, 1,
-0.5194586, 0.8767484, 0.0392431, 0, 0, 0, 1, 1,
-0.5174571, 0.7282825, -0.6917924, 0, 0, 0, 1, 1,
-0.5154512, 1.125358, -1.237964, 1, 1, 1, 1, 1,
-0.5149993, -0.5637232, -3.893559, 1, 1, 1, 1, 1,
-0.5133415, 1.322662, 1.990067, 1, 1, 1, 1, 1,
-0.506368, -0.8174753, -1.820788, 1, 1, 1, 1, 1,
-0.5048579, 1.143317, -0.9872414, 1, 1, 1, 1, 1,
-0.5047241, -0.5232099, -3.341494, 1, 1, 1, 1, 1,
-0.5043355, -0.470909, -2.150028, 1, 1, 1, 1, 1,
-0.5000194, -0.4984684, -3.564496, 1, 1, 1, 1, 1,
-0.4941751, 1.22598, -0.4064179, 1, 1, 1, 1, 1,
-0.4939499, 0.549696, -0.7696055, 1, 1, 1, 1, 1,
-0.4937081, -0.2379427, -2.086312, 1, 1, 1, 1, 1,
-0.4937046, -0.3561704, -0.5629756, 1, 1, 1, 1, 1,
-0.4931943, -1.062411, -1.994145, 1, 1, 1, 1, 1,
-0.4916496, 1.347871, -0.7764989, 1, 1, 1, 1, 1,
-0.4911022, 0.7112313, -0.1933105, 1, 1, 1, 1, 1,
-0.4905952, 1.020294, -0.2837815, 0, 0, 1, 1, 1,
-0.4900208, 1.128297, -0.4587987, 1, 0, 0, 1, 1,
-0.4887212, 0.3243164, -0.9097449, 1, 0, 0, 1, 1,
-0.4865794, 0.4583419, -0.3966947, 1, 0, 0, 1, 1,
-0.4823659, 0.8461958, 0.18368, 1, 0, 0, 1, 1,
-0.4823039, -0.03951298, -1.037395, 1, 0, 0, 1, 1,
-0.4822215, 1.259605, -0.6085292, 0, 0, 0, 1, 1,
-0.4820049, -1.002766, -2.851455, 0, 0, 0, 1, 1,
-0.4733779, 0.3313842, -0.06781118, 0, 0, 0, 1, 1,
-0.4710612, -0.2582811, -2.723808, 0, 0, 0, 1, 1,
-0.4683746, -0.7358814, -3.021083, 0, 0, 0, 1, 1,
-0.4607592, 0.8547, 2.334136, 0, 0, 0, 1, 1,
-0.4605104, 0.01240731, -1.283387, 0, 0, 0, 1, 1,
-0.4589497, 1.10646, -0.1987699, 1, 1, 1, 1, 1,
-0.4568435, 0.774595, 0.6790081, 1, 1, 1, 1, 1,
-0.456201, 0.02367385, -1.169436, 1, 1, 1, 1, 1,
-0.4535573, -2.163192, -4.805631, 1, 1, 1, 1, 1,
-0.4527662, 0.2472694, 0.7089399, 1, 1, 1, 1, 1,
-0.4496519, -0.2326757, -3.065511, 1, 1, 1, 1, 1,
-0.4410653, 0.2179981, 0.4008644, 1, 1, 1, 1, 1,
-0.4405433, -0.4201173, -1.967983, 1, 1, 1, 1, 1,
-0.4404595, 1.418682, -1.855918, 1, 1, 1, 1, 1,
-0.4403672, -0.3361998, -0.6777194, 1, 1, 1, 1, 1,
-0.4402143, -1.232779, -1.660126, 1, 1, 1, 1, 1,
-0.4332355, 0.153179, -1.023622, 1, 1, 1, 1, 1,
-0.4310754, 0.1460449, -1.418982, 1, 1, 1, 1, 1,
-0.4308109, -0.009810656, -2.689901, 1, 1, 1, 1, 1,
-0.4191484, 0.5844727, 0.3113078, 1, 1, 1, 1, 1,
-0.4175329, 0.3002573, -2.222953, 0, 0, 1, 1, 1,
-0.417518, 1.082421, -0.5915956, 1, 0, 0, 1, 1,
-0.4168411, -0.9451128, -3.989482, 1, 0, 0, 1, 1,
-0.4151663, -0.7458875, -1.813195, 1, 0, 0, 1, 1,
-0.4095008, 0.5191139, 0.01372894, 1, 0, 0, 1, 1,
-0.403726, 0.50327, -1.854331, 1, 0, 0, 1, 1,
-0.4020641, 0.6596062, -2.029974, 0, 0, 0, 1, 1,
-0.4003418, 0.1040525, -2.645856, 0, 0, 0, 1, 1,
-0.3991907, 0.4028653, -1.558213, 0, 0, 0, 1, 1,
-0.3990381, 0.8990456, 0.1444891, 0, 0, 0, 1, 1,
-0.3988692, -0.6043549, -2.533962, 0, 0, 0, 1, 1,
-0.3931693, 0.1913392, -1.710647, 0, 0, 0, 1, 1,
-0.3908608, 0.9555081, -0.2216305, 0, 0, 0, 1, 1,
-0.3751248, 0.2778722, 0.5460287, 1, 1, 1, 1, 1,
-0.3738829, 0.494008, -3.317257, 1, 1, 1, 1, 1,
-0.3721592, -1.396636, -3.054655, 1, 1, 1, 1, 1,
-0.3679174, -0.3127925, -2.720354, 1, 1, 1, 1, 1,
-0.3673141, -0.6532407, -2.605337, 1, 1, 1, 1, 1,
-0.3665221, 1.661003, -0.07072053, 1, 1, 1, 1, 1,
-0.3653454, 0.324677, -1.546846, 1, 1, 1, 1, 1,
-0.3642519, -1.428476, -1.9752, 1, 1, 1, 1, 1,
-0.3640878, 0.2542034, -0.9612724, 1, 1, 1, 1, 1,
-0.3607101, -0.2854939, -1.969349, 1, 1, 1, 1, 1,
-0.3601858, 2.281097, 0.05575723, 1, 1, 1, 1, 1,
-0.3592123, 0.9051388, 0.3045364, 1, 1, 1, 1, 1,
-0.3542679, -1.238581, -3.354015, 1, 1, 1, 1, 1,
-0.3537414, -0.7805173, -4.023423, 1, 1, 1, 1, 1,
-0.3535473, 0.09988292, -0.7905011, 1, 1, 1, 1, 1,
-0.3531685, 0.8408792, 0.6732391, 0, 0, 1, 1, 1,
-0.3493419, 0.3960307, 0.08027543, 1, 0, 0, 1, 1,
-0.3459664, -0.3425581, -1.620572, 1, 0, 0, 1, 1,
-0.3346168, -0.2472494, 1.700556, 1, 0, 0, 1, 1,
-0.3330349, -0.3433836, -1.408632, 1, 0, 0, 1, 1,
-0.3322815, -1.729333, -3.642593, 1, 0, 0, 1, 1,
-0.3284062, 0.9877161, -0.372699, 0, 0, 0, 1, 1,
-0.326891, -1.203274, -1.597075, 0, 0, 0, 1, 1,
-0.3241932, 1.352225, 0.09644929, 0, 0, 0, 1, 1,
-0.321758, 1.787096, -0.6353521, 0, 0, 0, 1, 1,
-0.3217415, 1.024658, -0.04506918, 0, 0, 0, 1, 1,
-0.320523, 0.7618642, -0.5388411, 0, 0, 0, 1, 1,
-0.3197866, -0.2086526, -3.564621, 0, 0, 0, 1, 1,
-0.3175081, 0.7259156, -0.2911, 1, 1, 1, 1, 1,
-0.3155928, 0.4718671, -1.381149, 1, 1, 1, 1, 1,
-0.3137435, -0.2614318, -0.5860627, 1, 1, 1, 1, 1,
-0.3131073, -0.620967, -4.184379, 1, 1, 1, 1, 1,
-0.3129873, 1.420321, 0.3562492, 1, 1, 1, 1, 1,
-0.3128767, -0.6545307, -4.007335, 1, 1, 1, 1, 1,
-0.3123571, 0.1892617, -1.346524, 1, 1, 1, 1, 1,
-0.3111193, 1.257178, -0.4540809, 1, 1, 1, 1, 1,
-0.3105855, 0.09259538, -1.205297, 1, 1, 1, 1, 1,
-0.3101834, -0.8698544, -3.869211, 1, 1, 1, 1, 1,
-0.30755, 0.266284, 0.06306331, 1, 1, 1, 1, 1,
-0.3051656, 0.07936726, 0.2609984, 1, 1, 1, 1, 1,
-0.3043602, -1.873086, -3.04945, 1, 1, 1, 1, 1,
-0.2964677, -0.5738509, -2.688408, 1, 1, 1, 1, 1,
-0.2923289, 1.42522, -0.9278044, 1, 1, 1, 1, 1,
-0.2896267, 2.297232, -0.2425745, 0, 0, 1, 1, 1,
-0.2886284, 0.6889617, -1.039928, 1, 0, 0, 1, 1,
-0.2882029, 1.678258, 0.0417327, 1, 0, 0, 1, 1,
-0.2819655, -0.3063771, -2.946369, 1, 0, 0, 1, 1,
-0.281957, -0.8167947, -2.677955, 1, 0, 0, 1, 1,
-0.2768718, -0.2744165, -0.244145, 1, 0, 0, 1, 1,
-0.2767512, -0.7864721, -3.040222, 0, 0, 0, 1, 1,
-0.2757032, -0.039262, -0.4777642, 0, 0, 0, 1, 1,
-0.2697729, -0.5054103, -4.22344, 0, 0, 0, 1, 1,
-0.2624811, 0.6269801, -0.06739146, 0, 0, 0, 1, 1,
-0.2616172, -0.2695493, -1.481021, 0, 0, 0, 1, 1,
-0.2570261, -1.118576, -2.165716, 0, 0, 0, 1, 1,
-0.2561886, 0.3771452, -0.4586028, 0, 0, 0, 1, 1,
-0.2554314, -1.281362, -2.11004, 1, 1, 1, 1, 1,
-0.2553728, 1.657636, 0.06686079, 1, 1, 1, 1, 1,
-0.2499079, 0.4635262, 1.072645, 1, 1, 1, 1, 1,
-0.249717, -0.9464285, -3.49234, 1, 1, 1, 1, 1,
-0.2464591, 0.3183989, -2.389943, 1, 1, 1, 1, 1,
-0.2398602, 0.6637565, -1.290642, 1, 1, 1, 1, 1,
-0.2398401, -0.4876955, -1.801701, 1, 1, 1, 1, 1,
-0.2385839, -0.01941361, -2.585373, 1, 1, 1, 1, 1,
-0.2365954, -1.120836, -3.121237, 1, 1, 1, 1, 1,
-0.2362465, 0.1607832, -1.457534, 1, 1, 1, 1, 1,
-0.2325843, 0.4973873, -0.4733392, 1, 1, 1, 1, 1,
-0.2298971, 0.02942103, -0.7627281, 1, 1, 1, 1, 1,
-0.2273614, 0.7499844, 1.243267, 1, 1, 1, 1, 1,
-0.2234091, 0.7741442, -1.195137, 1, 1, 1, 1, 1,
-0.2178097, -0.8147091, -2.977811, 1, 1, 1, 1, 1,
-0.2171078, 0.592447, -0.5426468, 0, 0, 1, 1, 1,
-0.2160336, 1.425603, 0.7037549, 1, 0, 0, 1, 1,
-0.2155009, 0.3663441, -0.4556403, 1, 0, 0, 1, 1,
-0.2135441, -1.186022, -0.4527766, 1, 0, 0, 1, 1,
-0.2131875, 0.44285, -1.151727, 1, 0, 0, 1, 1,
-0.2071661, 1.683743, 0.1893848, 1, 0, 0, 1, 1,
-0.2053155, 0.4877664, -1.393388, 0, 0, 0, 1, 1,
-0.2049742, 1.269694, 0.29111, 0, 0, 0, 1, 1,
-0.2047932, 0.8826914, -0.7001511, 0, 0, 0, 1, 1,
-0.2028195, 1.161922, -1.70162, 0, 0, 0, 1, 1,
-0.2011166, 1.621359, 0.924841, 0, 0, 0, 1, 1,
-0.1993826, -0.1318341, -4.478089, 0, 0, 0, 1, 1,
-0.1939525, -0.3960876, -2.682258, 0, 0, 0, 1, 1,
-0.1923346, 0.2797968, 0.8190242, 1, 1, 1, 1, 1,
-0.1889089, 1.584993, -0.8084704, 1, 1, 1, 1, 1,
-0.1865056, -0.0351527, -1.058893, 1, 1, 1, 1, 1,
-0.1746487, -0.4159071, -0.7451313, 1, 1, 1, 1, 1,
-0.1703327, -0.144686, -2.39062, 1, 1, 1, 1, 1,
-0.1629664, 0.9411195, 1.742742, 1, 1, 1, 1, 1,
-0.1577669, 0.3658106, -0.09065188, 1, 1, 1, 1, 1,
-0.1569805, 1.116475, -0.9326038, 1, 1, 1, 1, 1,
-0.1469019, -2.029004, -1.713858, 1, 1, 1, 1, 1,
-0.1461835, -1.665731, -2.752674, 1, 1, 1, 1, 1,
-0.1446156, 0.05416655, -1.450714, 1, 1, 1, 1, 1,
-0.1443896, 0.6005652, 1.420264, 1, 1, 1, 1, 1,
-0.1339443, -0.6938897, -2.830562, 1, 1, 1, 1, 1,
-0.1274505, 1.622608, 0.3341728, 1, 1, 1, 1, 1,
-0.1227878, -0.01483264, -1.972455, 1, 1, 1, 1, 1,
-0.1177263, -0.1190131, -3.185239, 0, 0, 1, 1, 1,
-0.1173989, 2.753745, -0.4887204, 1, 0, 0, 1, 1,
-0.1144965, -0.3664142, -3.083264, 1, 0, 0, 1, 1,
-0.1127182, -0.827953, -3.229402, 1, 0, 0, 1, 1,
-0.111332, 0.5040908, -0.2753569, 1, 0, 0, 1, 1,
-0.1067984, 0.6174335, 0.6532513, 1, 0, 0, 1, 1,
-0.1067113, -1.195018, -4.259394, 0, 0, 0, 1, 1,
-0.1059932, 0.1272597, 0.7014241, 0, 0, 0, 1, 1,
-0.1048844, -1.033407, -2.178506, 0, 0, 0, 1, 1,
-0.1015973, -1.572613, -2.363723, 0, 0, 0, 1, 1,
-0.09806001, -1.029201, -1.192841, 0, 0, 0, 1, 1,
-0.09782017, -0.5354438, -4.737867, 0, 0, 0, 1, 1,
-0.09321142, 0.3973291, 0.6607504, 0, 0, 0, 1, 1,
-0.08885599, 1.536255, -0.5532109, 1, 1, 1, 1, 1,
-0.08613539, -0.3627074, -3.722222, 1, 1, 1, 1, 1,
-0.0854921, 0.6818526, 0.3052607, 1, 1, 1, 1, 1,
-0.08262809, 0.4860371, -0.255344, 1, 1, 1, 1, 1,
-0.07875708, 3.007814, 0.9581115, 1, 1, 1, 1, 1,
-0.06934694, 0.379352, -0.03419401, 1, 1, 1, 1, 1,
-0.06693682, 0.1053861, 2.153895, 1, 1, 1, 1, 1,
-0.06574433, 1.532351, 0.9802341, 1, 1, 1, 1, 1,
-0.06050679, -0.2913198, -2.210313, 1, 1, 1, 1, 1,
-0.05981256, 0.9127423, -0.7068194, 1, 1, 1, 1, 1,
-0.05763947, 0.1510812, 0.02786423, 1, 1, 1, 1, 1,
-0.0560352, -0.2934835, -3.604429, 1, 1, 1, 1, 1,
-0.0553054, 0.05582547, -0.8274084, 1, 1, 1, 1, 1,
-0.0454906, -0.3890673, -4.316402, 1, 1, 1, 1, 1,
-0.04123569, 0.02615833, -0.4812856, 1, 1, 1, 1, 1,
-0.03674856, 0.6582534, 0.7735966, 0, 0, 1, 1, 1,
-0.0361868, -0.1948154, -3.698498, 1, 0, 0, 1, 1,
-0.03317081, 1.050343, -0.02762303, 1, 0, 0, 1, 1,
-0.03202466, -0.83613, -3.147791, 1, 0, 0, 1, 1,
-0.02791807, 0.2096221, 0.5372713, 1, 0, 0, 1, 1,
-0.02687846, -0.7069669, -0.5828713, 1, 0, 0, 1, 1,
-0.02575398, -0.2832407, -3.764691, 0, 0, 0, 1, 1,
-0.02321326, -0.4533786, -3.642188, 0, 0, 0, 1, 1,
-0.01669286, -0.1196102, -5.100352, 0, 0, 0, 1, 1,
-0.01087514, -0.3615011, -3.481426, 0, 0, 0, 1, 1,
-0.007445514, 0.3951752, -0.6128166, 0, 0, 0, 1, 1,
-0.0035491, 1.663117, -0.6611782, 0, 0, 0, 1, 1,
-0.003391114, -0.3199739, -3.455728, 0, 0, 0, 1, 1,
-0.001965219, 0.6385954, 0.06036941, 1, 1, 1, 1, 1,
0.002270443, 0.3230901, -0.6182007, 1, 1, 1, 1, 1,
0.003276084, 0.9250063, 0.2635844, 1, 1, 1, 1, 1,
0.006605154, -0.5029618, 3.492913, 1, 1, 1, 1, 1,
0.01098999, -0.3556408, 4.686306, 1, 1, 1, 1, 1,
0.01376861, -1.89117, 3.69872, 1, 1, 1, 1, 1,
0.0143897, -0.08636546, 1.873838, 1, 1, 1, 1, 1,
0.0257118, -0.5743381, 3.632039, 1, 1, 1, 1, 1,
0.02577976, -0.8652539, 4.321875, 1, 1, 1, 1, 1,
0.02669954, -1.108189, 1.629346, 1, 1, 1, 1, 1,
0.03169917, 0.2518162, 0.3565723, 1, 1, 1, 1, 1,
0.03543522, -0.5236823, 2.239383, 1, 1, 1, 1, 1,
0.03771754, 0.4064023, 0.4072328, 1, 1, 1, 1, 1,
0.03854327, 0.5761082, 0.7553711, 1, 1, 1, 1, 1,
0.03889543, 0.4916787, -1.87835, 1, 1, 1, 1, 1,
0.03990038, -0.7092851, 4.399051, 0, 0, 1, 1, 1,
0.04186932, 0.1488463, -1.106034, 1, 0, 0, 1, 1,
0.04329174, 0.9786052, 0.1512869, 1, 0, 0, 1, 1,
0.04478553, 0.476795, 0.08820286, 1, 0, 0, 1, 1,
0.04821607, -0.1992408, 3.072351, 1, 0, 0, 1, 1,
0.04836203, -1.593997, 2.323894, 1, 0, 0, 1, 1,
0.05287637, 0.463514, -0.2940423, 0, 0, 0, 1, 1,
0.05843252, 1.110162, 1.560742, 0, 0, 0, 1, 1,
0.05974279, -1.85943, 2.811584, 0, 0, 0, 1, 1,
0.06241949, 0.0194229, 2.34504, 0, 0, 0, 1, 1,
0.0632848, -1.10404, 2.947569, 0, 0, 0, 1, 1,
0.06330218, 0.7716859, 0.1543256, 0, 0, 0, 1, 1,
0.06553601, -0.5930634, 2.757649, 0, 0, 0, 1, 1,
0.06604133, 0.8936501, -0.1283792, 1, 1, 1, 1, 1,
0.06645052, -1.685075, 3.064262, 1, 1, 1, 1, 1,
0.06741539, -0.0001607681, 1.631208, 1, 1, 1, 1, 1,
0.07096288, -0.1825329, 3.026276, 1, 1, 1, 1, 1,
0.07263691, 0.00284223, 1.031525, 1, 1, 1, 1, 1,
0.07378566, -0.2966623, 2.525609, 1, 1, 1, 1, 1,
0.07383682, -1.03712, 3.552694, 1, 1, 1, 1, 1,
0.08657396, 0.3818639, -1.21047, 1, 1, 1, 1, 1,
0.08943426, -0.6169897, 4.153979, 1, 1, 1, 1, 1,
0.09200792, -0.3134191, 2.914848, 1, 1, 1, 1, 1,
0.09542768, -0.8053559, 3.011387, 1, 1, 1, 1, 1,
0.09943146, 0.7893006, 0.4529428, 1, 1, 1, 1, 1,
0.1052438, 1.936456, -0.07312146, 1, 1, 1, 1, 1,
0.1079403, -0.9490551, 4.462863, 1, 1, 1, 1, 1,
0.1186867, 0.7655583, -1.735139, 1, 1, 1, 1, 1,
0.1203079, 1.97603, -0.557373, 0, 0, 1, 1, 1,
0.1276254, -1.167451, 3.567997, 1, 0, 0, 1, 1,
0.1287442, 1.021219, 0.5326545, 1, 0, 0, 1, 1,
0.1301226, 0.02825334, 1.922976, 1, 0, 0, 1, 1,
0.1304066, 0.3467835, 0.4051984, 1, 0, 0, 1, 1,
0.140695, -0.6620901, 3.299522, 1, 0, 0, 1, 1,
0.141161, 0.5690297, 0.03915665, 0, 0, 0, 1, 1,
0.1516438, -1.888545, 3.52297, 0, 0, 0, 1, 1,
0.1575609, 1.43767, 1.19362, 0, 0, 0, 1, 1,
0.1609932, -0.336016, 1.258759, 0, 0, 0, 1, 1,
0.162817, -1.01746, 3.951382, 0, 0, 0, 1, 1,
0.1643124, 1.612784, 0.5982811, 0, 0, 0, 1, 1,
0.1653182, -0.2425195, 2.364, 0, 0, 0, 1, 1,
0.1739561, 0.3395653, 0.1051061, 1, 1, 1, 1, 1,
0.1798211, 0.03060586, 2.145049, 1, 1, 1, 1, 1,
0.1806285, 0.9037662, 1.362912, 1, 1, 1, 1, 1,
0.1819241, -1.497312, 3.555116, 1, 1, 1, 1, 1,
0.1822414, -0.1161783, 2.84455, 1, 1, 1, 1, 1,
0.1891781, -1.02242, 1.368151, 1, 1, 1, 1, 1,
0.197899, 0.6308787, -0.831084, 1, 1, 1, 1, 1,
0.2019587, -0.02151454, 2.262799, 1, 1, 1, 1, 1,
0.2020448, 0.6556644, -0.7392804, 1, 1, 1, 1, 1,
0.20313, -0.7122323, 3.002737, 1, 1, 1, 1, 1,
0.2069284, 1.647732, -0.4129257, 1, 1, 1, 1, 1,
0.2110487, -1.96223, 3.086502, 1, 1, 1, 1, 1,
0.2114505, 0.5629786, 0.3938586, 1, 1, 1, 1, 1,
0.2169899, 0.4345305, 0.3244801, 1, 1, 1, 1, 1,
0.2176874, 0.2266497, -0.7812856, 1, 1, 1, 1, 1,
0.2303906, -1.225925, 2.875182, 0, 0, 1, 1, 1,
0.2322263, 0.9197779, 0.3442991, 1, 0, 0, 1, 1,
0.2340227, -0.2566388, 2.585653, 1, 0, 0, 1, 1,
0.2366538, -1.933051, 2.468713, 1, 0, 0, 1, 1,
0.2379456, 0.9457325, 0.07785714, 1, 0, 0, 1, 1,
0.2403229, -0.7694287, 2.923242, 1, 0, 0, 1, 1,
0.2422887, 0.1710673, 0.7982583, 0, 0, 0, 1, 1,
0.2437515, -0.8015438, 2.259917, 0, 0, 0, 1, 1,
0.2466533, 1.093595, -0.5458654, 0, 0, 0, 1, 1,
0.2515557, 0.4318048, 1.558261, 0, 0, 0, 1, 1,
0.2523276, 2.525279, 1.295967, 0, 0, 0, 1, 1,
0.2545598, 0.6458188, -0.8185841, 0, 0, 0, 1, 1,
0.2628394, 0.5975897, 0.725623, 0, 0, 0, 1, 1,
0.2686869, 1.188959, 0.08706531, 1, 1, 1, 1, 1,
0.2710992, -0.7566123, 1.897992, 1, 1, 1, 1, 1,
0.2716644, 1.324372, 0.4909864, 1, 1, 1, 1, 1,
0.2718286, 1.939024, -1.551256, 1, 1, 1, 1, 1,
0.2765102, 0.1340956, 1.58921, 1, 1, 1, 1, 1,
0.2783187, 1.138107, 1.012005, 1, 1, 1, 1, 1,
0.2890038, 0.9937103, 1.295168, 1, 1, 1, 1, 1,
0.2909693, -0.2147299, 2.28007, 1, 1, 1, 1, 1,
0.2924707, 0.260073, -0.08334945, 1, 1, 1, 1, 1,
0.2949702, 0.8501738, 0.3863828, 1, 1, 1, 1, 1,
0.295718, 0.3863443, -0.9496643, 1, 1, 1, 1, 1,
0.2972067, 1.010012, 0.431614, 1, 1, 1, 1, 1,
0.2982882, -0.799094, 4.532585, 1, 1, 1, 1, 1,
0.2996913, -1.369354, 3.139937, 1, 1, 1, 1, 1,
0.3020151, -0.0324531, 1.371806, 1, 1, 1, 1, 1,
0.3051737, -0.06571785, 1.801444, 0, 0, 1, 1, 1,
0.3059702, -0.4781121, 2.060984, 1, 0, 0, 1, 1,
0.3074175, 0.1791906, 1.307025, 1, 0, 0, 1, 1,
0.3130432, -0.9249571, 2.979338, 1, 0, 0, 1, 1,
0.3163324, -0.8207023, 2.351214, 1, 0, 0, 1, 1,
0.321427, -0.6958084, 3.341689, 1, 0, 0, 1, 1,
0.3233582, 0.7183122, -1.501632, 0, 0, 0, 1, 1,
0.3234563, -0.8430932, 1.352947, 0, 0, 0, 1, 1,
0.3244295, -0.5191447, 4.064103, 0, 0, 0, 1, 1,
0.3249909, -0.8759965, 3.450793, 0, 0, 0, 1, 1,
0.3329649, 0.9884562, 0.7584378, 0, 0, 0, 1, 1,
0.3347814, -0.3428612, 3.426397, 0, 0, 0, 1, 1,
0.3374183, -0.01204261, 2.547866, 0, 0, 0, 1, 1,
0.3418184, 0.6160764, -0.6211683, 1, 1, 1, 1, 1,
0.3419858, -0.6857272, 3.248358, 1, 1, 1, 1, 1,
0.3500613, -1.048386, 4.897316, 1, 1, 1, 1, 1,
0.3517247, 2.004933, 0.9923276, 1, 1, 1, 1, 1,
0.3517891, 0.997901, 0.663685, 1, 1, 1, 1, 1,
0.3524076, -0.006388972, 0.2278097, 1, 1, 1, 1, 1,
0.3533743, 1.363734, -2.101312, 1, 1, 1, 1, 1,
0.3548703, -0.693266, 4.028863, 1, 1, 1, 1, 1,
0.3577193, 0.2075383, 3.332484, 1, 1, 1, 1, 1,
0.3594717, 2.259322, 1.666889, 1, 1, 1, 1, 1,
0.3597505, 0.3744642, 0.9407997, 1, 1, 1, 1, 1,
0.3672802, 2.018612, -0.05418814, 1, 1, 1, 1, 1,
0.368052, -0.8363999, 4.225718, 1, 1, 1, 1, 1,
0.3686381, -1.462623, 3.93668, 1, 1, 1, 1, 1,
0.3696736, -1.20933, 1.121067, 1, 1, 1, 1, 1,
0.3710721, 0.00663016, 2.717858, 0, 0, 1, 1, 1,
0.3729994, -0.1316926, 1.162473, 1, 0, 0, 1, 1,
0.3767624, -1.120442, 3.416351, 1, 0, 0, 1, 1,
0.3768777, 0.5357032, -0.5530692, 1, 0, 0, 1, 1,
0.380442, 2.700738, 0.7272965, 1, 0, 0, 1, 1,
0.3841774, 0.6004937, 0.09778602, 1, 0, 0, 1, 1,
0.3858216, 1.704942, 0.9982638, 0, 0, 0, 1, 1,
0.3863407, 2.271303, -1.294283, 0, 0, 0, 1, 1,
0.3944064, -0.739778, 2.265086, 0, 0, 0, 1, 1,
0.4018115, 0.5382833, 1.382256, 0, 0, 0, 1, 1,
0.409951, 0.8768513, 0.07705121, 0, 0, 0, 1, 1,
0.4139248, -0.9366836, 2.845555, 0, 0, 0, 1, 1,
0.4173007, -2.139273, 2.162501, 0, 0, 0, 1, 1,
0.4221624, 0.5708714, 0.8887565, 1, 1, 1, 1, 1,
0.4304098, 1.380879, 1.519828, 1, 1, 1, 1, 1,
0.4311433, -1.288598, 5.208694, 1, 1, 1, 1, 1,
0.4339704, 1.157369, -0.3180329, 1, 1, 1, 1, 1,
0.4362481, 0.3555112, 1.61623, 1, 1, 1, 1, 1,
0.4371166, 1.338216, 0.2816403, 1, 1, 1, 1, 1,
0.4390518, 1.094711, 1.510076, 1, 1, 1, 1, 1,
0.4465416, 0.02107961, 2.594753, 1, 1, 1, 1, 1,
0.4486747, -0.5966077, 2.283616, 1, 1, 1, 1, 1,
0.4529861, 1.60873, 1.202345, 1, 1, 1, 1, 1,
0.4563927, 0.2747739, 1.545522, 1, 1, 1, 1, 1,
0.456863, 0.016491, 2.280391, 1, 1, 1, 1, 1,
0.4572099, 0.7784295, 2.218571, 1, 1, 1, 1, 1,
0.464638, -1.22338, 1.038978, 1, 1, 1, 1, 1,
0.4647813, 1.431644, 1.423145, 1, 1, 1, 1, 1,
0.4657848, -1.445561, 2.524771, 0, 0, 1, 1, 1,
0.4664245, -1.617924, 1.828699, 1, 0, 0, 1, 1,
0.4688161, -0.9247662, 4.114224, 1, 0, 0, 1, 1,
0.4693446, 2.608295, -0.04740448, 1, 0, 0, 1, 1,
0.4717135, -1.299436, 3.781384, 1, 0, 0, 1, 1,
0.4732838, 0.4158356, 0.5855074, 1, 0, 0, 1, 1,
0.4807291, -1.091047, 1.761776, 0, 0, 0, 1, 1,
0.4835766, 0.5057565, 0.4668555, 0, 0, 0, 1, 1,
0.4856632, 1.030036, 0.3030452, 0, 0, 0, 1, 1,
0.4909509, -0.3817168, 4.135542, 0, 0, 0, 1, 1,
0.4922938, 0.3766646, 2.00632, 0, 0, 0, 1, 1,
0.4975584, 0.2553939, 2.495594, 0, 0, 0, 1, 1,
0.4976436, -2.319013, 2.283504, 0, 0, 0, 1, 1,
0.4976465, -1.123359, 2.215795, 1, 1, 1, 1, 1,
0.5019624, -0.05050797, 0.3502916, 1, 1, 1, 1, 1,
0.5078776, 0.3467719, -1.789639, 1, 1, 1, 1, 1,
0.5081413, -0.9010345, 3.705276, 1, 1, 1, 1, 1,
0.5090682, -0.4739329, 3.390141, 1, 1, 1, 1, 1,
0.5129361, -0.3229415, 0.7826172, 1, 1, 1, 1, 1,
0.5191292, 0.2558889, -0.1624852, 1, 1, 1, 1, 1,
0.5220898, 1.145865, 2.245678, 1, 1, 1, 1, 1,
0.5246369, -0.1473886, 0.6438625, 1, 1, 1, 1, 1,
0.5390734, 1.354947, 1.275559, 1, 1, 1, 1, 1,
0.539728, 0.431886, 0.6831281, 1, 1, 1, 1, 1,
0.5410258, -0.9463307, 1.84351, 1, 1, 1, 1, 1,
0.5421219, -0.5095254, 2.292158, 1, 1, 1, 1, 1,
0.5433855, 0.4835634, 0.1359539, 1, 1, 1, 1, 1,
0.5449447, -0.6568654, -0.4619251, 1, 1, 1, 1, 1,
0.5542544, -0.168536, 1.495383, 0, 0, 1, 1, 1,
0.5565705, 0.06328746, 2.770927, 1, 0, 0, 1, 1,
0.5572286, -0.9186787, 2.254349, 1, 0, 0, 1, 1,
0.5579929, 2.051567, 0.4986944, 1, 0, 0, 1, 1,
0.5642179, 0.236965, 1.348796, 1, 0, 0, 1, 1,
0.569049, 0.361242, 1.980431, 1, 0, 0, 1, 1,
0.5694343, 0.8385445, 2.27591, 0, 0, 0, 1, 1,
0.5718499, 0.193499, -0.2176245, 0, 0, 0, 1, 1,
0.5814758, 2.409718, -0.6974273, 0, 0, 0, 1, 1,
0.5903396, 0.7453053, 0.3121992, 0, 0, 0, 1, 1,
0.5904476, 1.839351, 0.3114963, 0, 0, 0, 1, 1,
0.5911359, 0.2899208, 1.279374, 0, 0, 0, 1, 1,
0.5959237, -1.859083, 2.459275, 0, 0, 0, 1, 1,
0.600583, 0.03551655, 0.1751929, 1, 1, 1, 1, 1,
0.6009454, -0.373852, -0.706371, 1, 1, 1, 1, 1,
0.6024988, 1.438033, 0.3923028, 1, 1, 1, 1, 1,
0.6067617, -0.5693829, 2.831781, 1, 1, 1, 1, 1,
0.616905, -0.2731361, 2.517743, 1, 1, 1, 1, 1,
0.6185043, 1.305218, 0.4233526, 1, 1, 1, 1, 1,
0.61854, -0.121908, 1.786491, 1, 1, 1, 1, 1,
0.6189389, -0.1213466, 1.637009, 1, 1, 1, 1, 1,
0.6204368, 0.06534853, 2.745217, 1, 1, 1, 1, 1,
0.621864, 1.315199, 0.21467, 1, 1, 1, 1, 1,
0.6222287, 0.5137215, 1.190918, 1, 1, 1, 1, 1,
0.6228747, -0.05101534, -0.6994892, 1, 1, 1, 1, 1,
0.6249602, 1.188611, -0.08931305, 1, 1, 1, 1, 1,
0.6270588, -0.07056915, 1.690637, 1, 1, 1, 1, 1,
0.6330792, -2.133752, 3.769839, 1, 1, 1, 1, 1,
0.6374344, -0.01018188, 1.112322, 0, 0, 1, 1, 1,
0.6425942, -1.472098, 2.715291, 1, 0, 0, 1, 1,
0.6442688, 1.615794, 2.203629, 1, 0, 0, 1, 1,
0.6479819, 0.1044057, -0.1529747, 1, 0, 0, 1, 1,
0.6491751, -0.7907579, 2.772449, 1, 0, 0, 1, 1,
0.6496303, -0.5837374, 1.467096, 1, 0, 0, 1, 1,
0.6552051, -0.5345697, 2.08332, 0, 0, 0, 1, 1,
0.6606963, -1.417593, 2.669251, 0, 0, 0, 1, 1,
0.6620079, -1.964861, 1.324994, 0, 0, 0, 1, 1,
0.662698, 0.7112057, -0.04328435, 0, 0, 0, 1, 1,
0.6628269, 0.08534352, 0.4123111, 0, 0, 0, 1, 1,
0.6663792, -0.09637047, 1.528304, 0, 0, 0, 1, 1,
0.6765354, 1.705673, 0.6498669, 0, 0, 0, 1, 1,
0.6771161, 0.4303239, -0.06520127, 1, 1, 1, 1, 1,
0.6800593, 2.090602, -0.1338832, 1, 1, 1, 1, 1,
0.6814364, 0.08837481, 0.2545139, 1, 1, 1, 1, 1,
0.6836024, 0.006671165, 1.18425, 1, 1, 1, 1, 1,
0.6879184, 0.0203534, 0.9304079, 1, 1, 1, 1, 1,
0.6881855, -0.9244207, 1.753135, 1, 1, 1, 1, 1,
0.6900901, -1.380869, 2.514599, 1, 1, 1, 1, 1,
0.6941559, 0.3770888, 0.4375446, 1, 1, 1, 1, 1,
0.708383, 1.862675, 0.8532286, 1, 1, 1, 1, 1,
0.7101085, -1.291452, 3.354091, 1, 1, 1, 1, 1,
0.712563, 1.213518, 1.300715, 1, 1, 1, 1, 1,
0.7131464, 2.027313, 1.157955, 1, 1, 1, 1, 1,
0.7145312, 1.148568, -0.862906, 1, 1, 1, 1, 1,
0.7147541, 1.708512, 1.010779, 1, 1, 1, 1, 1,
0.7148356, 0.8455645, 0.9319332, 1, 1, 1, 1, 1,
0.7161875, -1.868055, 2.06245, 0, 0, 1, 1, 1,
0.7174981, -1.473058, 1.93615, 1, 0, 0, 1, 1,
0.72494, -0.5064046, 3.260218, 1, 0, 0, 1, 1,
0.7253405, 0.4329238, 2.022556, 1, 0, 0, 1, 1,
0.7266557, 0.4549906, -0.07210975, 1, 0, 0, 1, 1,
0.7352219, 0.2731127, 1.733152, 1, 0, 0, 1, 1,
0.7360209, 0.424848, 0.1686925, 0, 0, 0, 1, 1,
0.736322, -0.4275261, 2.690603, 0, 0, 0, 1, 1,
0.7376708, 0.1510817, 1.084601, 0, 0, 0, 1, 1,
0.7422826, -0.702522, 3.148664, 0, 0, 0, 1, 1,
0.7430786, 1.384893, 2.316059, 0, 0, 0, 1, 1,
0.7500266, 0.8589767, 1.178188, 0, 0, 0, 1, 1,
0.7560309, 2.432976, 1.510589, 0, 0, 0, 1, 1,
0.7607101, -0.5760838, 1.537955, 1, 1, 1, 1, 1,
0.7617807, -1.242384, 2.189942, 1, 1, 1, 1, 1,
0.7650955, -0.6141011, 3.570688, 1, 1, 1, 1, 1,
0.7697083, 1.178426, 0.499571, 1, 1, 1, 1, 1,
0.7773226, 0.2289979, 0.9867596, 1, 1, 1, 1, 1,
0.7806943, 0.3122402, 1.740485, 1, 1, 1, 1, 1,
0.7813612, -1.638421, 1.611572, 1, 1, 1, 1, 1,
0.7864078, -0.1866448, 1.59904, 1, 1, 1, 1, 1,
0.7886201, -1.055071, 4.600311, 1, 1, 1, 1, 1,
0.7888469, -1.22274, 3.728804, 1, 1, 1, 1, 1,
0.7889093, 0.1021975, 2.527254, 1, 1, 1, 1, 1,
0.7916914, -0.366619, 3.373767, 1, 1, 1, 1, 1,
0.7918152, -1.105029, 2.403473, 1, 1, 1, 1, 1,
0.7948912, 0.9421532, 0.9933667, 1, 1, 1, 1, 1,
0.7960634, -0.1484473, 0.489513, 1, 1, 1, 1, 1,
0.7962412, 0.2569948, 2.131335, 0, 0, 1, 1, 1,
0.7970876, -0.9204159, 1.864398, 1, 0, 0, 1, 1,
0.7979088, -0.8988196, 1.517195, 1, 0, 0, 1, 1,
0.8204751, 0.3523025, 0.9426197, 1, 0, 0, 1, 1,
0.8212301, 0.4546049, -0.22099, 1, 0, 0, 1, 1,
0.8270161, 0.9109622, 0.8354686, 1, 0, 0, 1, 1,
0.8276831, -0.9409353, 2.526659, 0, 0, 0, 1, 1,
0.8278184, 0.242285, 0.5205513, 0, 0, 0, 1, 1,
0.8284396, -0.9346633, 2.514628, 0, 0, 0, 1, 1,
0.8287762, -0.2728336, 0.5814877, 0, 0, 0, 1, 1,
0.8375415, -0.8116781, 1.386079, 0, 0, 0, 1, 1,
0.840966, -0.7206713, 4.091188, 0, 0, 0, 1, 1,
0.8460301, -2.18437, 3.929443, 0, 0, 0, 1, 1,
0.8474534, 0.9876015, 0.251186, 1, 1, 1, 1, 1,
0.8571137, 0.2199614, 1.62694, 1, 1, 1, 1, 1,
0.8593954, 0.8052257, -0.7264358, 1, 1, 1, 1, 1,
0.8678045, -0.241168, 2.405506, 1, 1, 1, 1, 1,
0.8682281, -0.1708604, 2.385309, 1, 1, 1, 1, 1,
0.8733567, -0.6920874, 2.662616, 1, 1, 1, 1, 1,
0.8741169, -1.445519, 2.787774, 1, 1, 1, 1, 1,
0.8768361, 0.7465851, 0.810789, 1, 1, 1, 1, 1,
0.8787213, -0.8973212, 3.171004, 1, 1, 1, 1, 1,
0.8799167, 0.1398573, 1.205425, 1, 1, 1, 1, 1,
0.8802543, -0.0302347, 1.18627, 1, 1, 1, 1, 1,
0.8819439, 0.1244053, 1.623492, 1, 1, 1, 1, 1,
0.8956886, -0.7199466, 4.373693, 1, 1, 1, 1, 1,
0.900045, -1.042819, 1.868744, 1, 1, 1, 1, 1,
0.9002126, 0.1664476, 0.3015986, 1, 1, 1, 1, 1,
0.9012519, -0.2681112, 3.40084, 0, 0, 1, 1, 1,
0.904248, -1.660613, 2.438169, 1, 0, 0, 1, 1,
0.9048111, 0.5502784, 1.307163, 1, 0, 0, 1, 1,
0.9134082, -2.906322, 1.420007, 1, 0, 0, 1, 1,
0.9200971, -0.5028218, 3.45034, 1, 0, 0, 1, 1,
0.9215332, 0.3417096, 0.6667278, 1, 0, 0, 1, 1,
0.928304, -0.9716219, 4.060049, 0, 0, 0, 1, 1,
0.9302746, -1.127508, 0.599861, 0, 0, 0, 1, 1,
0.9359025, -1.191343, 3.450458, 0, 0, 0, 1, 1,
0.9378938, 0.5240115, 0.2524014, 0, 0, 0, 1, 1,
0.9393781, -0.09945132, 2.4136, 0, 0, 0, 1, 1,
0.9398789, -0.5230638, 4.342972, 0, 0, 0, 1, 1,
0.9428606, -0.8569171, -0.05196999, 0, 0, 0, 1, 1,
0.9453694, -0.3195718, 2.391925, 1, 1, 1, 1, 1,
0.9456618, -0.3764602, 1.321399, 1, 1, 1, 1, 1,
0.9513303, 0.6972518, 1.283087, 1, 1, 1, 1, 1,
0.9535743, -1.818264, 1.828243, 1, 1, 1, 1, 1,
0.9681916, 0.3875004, 1.675622, 1, 1, 1, 1, 1,
0.9695598, 0.3067762, 2.628537, 1, 1, 1, 1, 1,
0.973004, 1.026309, 3.091237, 1, 1, 1, 1, 1,
0.9766589, 1.934189, 0.8202649, 1, 1, 1, 1, 1,
0.9771964, -1.277649, 5.181688, 1, 1, 1, 1, 1,
0.9828207, 0.2884498, 1.539307, 1, 1, 1, 1, 1,
0.9867535, 0.9897481, 0.0426343, 1, 1, 1, 1, 1,
0.987943, -1.750495, 2.592887, 1, 1, 1, 1, 1,
0.9897897, -0.4322426, 1.317754, 1, 1, 1, 1, 1,
0.9900597, -0.7275351, 2.747149, 1, 1, 1, 1, 1,
0.9947408, -0.5360407, 2.211267, 1, 1, 1, 1, 1,
0.9951959, 1.839164, 0.3410918, 0, 0, 1, 1, 1,
1.001362, 0.1388467, -0.003852626, 1, 0, 0, 1, 1,
1.00393, 0.9223363, 0.1341405, 1, 0, 0, 1, 1,
1.009425, -1.215783, 0.7226131, 1, 0, 0, 1, 1,
1.015268, -1.719658, 2.857823, 1, 0, 0, 1, 1,
1.027782, 1.216618, 0.07814995, 1, 0, 0, 1, 1,
1.030867, -1.801274, 0.410548, 0, 0, 0, 1, 1,
1.03796, -0.146159, 1.630605, 0, 0, 0, 1, 1,
1.045963, 1.020657, 1.38648, 0, 0, 0, 1, 1,
1.050464, 1.733164, -0.9218812, 0, 0, 0, 1, 1,
1.064366, -0.002853891, 1.480784, 0, 0, 0, 1, 1,
1.067611, -0.3183039, 2.368947, 0, 0, 0, 1, 1,
1.071029, 0.8933896, 1.283076, 0, 0, 0, 1, 1,
1.080973, -0.8783429, 3.302739, 1, 1, 1, 1, 1,
1.082334, -1.316306, 0.4987384, 1, 1, 1, 1, 1,
1.085716, -0.9254028, 1.445109, 1, 1, 1, 1, 1,
1.091865, -2.734307, 0.3271663, 1, 1, 1, 1, 1,
1.092451, -1.258808, 2.987643, 1, 1, 1, 1, 1,
1.094366, 0.6651132, 1.035883, 1, 1, 1, 1, 1,
1.101823, -1.306777, 2.525132, 1, 1, 1, 1, 1,
1.10517, -0.5100154, 2.077182, 1, 1, 1, 1, 1,
1.107357, 1.46815, 1.390375, 1, 1, 1, 1, 1,
1.108858, -0.7185413, 1.454828, 1, 1, 1, 1, 1,
1.109664, 0.1168783, 2.327916, 1, 1, 1, 1, 1,
1.11355, 1.308874, -0.1523015, 1, 1, 1, 1, 1,
1.115219, 0.8336068, 1.847911, 1, 1, 1, 1, 1,
1.124375, 0.1423904, 1.699699, 1, 1, 1, 1, 1,
1.129482, -1.725013, 3.442395, 1, 1, 1, 1, 1,
1.130017, 0.6814029, 0.6980078, 0, 0, 1, 1, 1,
1.133498, -0.6221586, 3.252068, 1, 0, 0, 1, 1,
1.13449, -0.9209087, 1.685808, 1, 0, 0, 1, 1,
1.141882, 0.9789891, 1.106839, 1, 0, 0, 1, 1,
1.142996, -0.7465894, 0.1649735, 1, 0, 0, 1, 1,
1.154111, 0.01724092, 1.898423, 1, 0, 0, 1, 1,
1.154231, 1.108687, 0.3330723, 0, 0, 0, 1, 1,
1.158425, -0.1373778, -0.08122297, 0, 0, 0, 1, 1,
1.16307, 0.07920928, 2.135916, 0, 0, 0, 1, 1,
1.166956, -0.8321716, 1.700618, 0, 0, 0, 1, 1,
1.174562, 1.172349, 0.35142, 0, 0, 0, 1, 1,
1.18898, 2.392315, -0.1738885, 0, 0, 0, 1, 1,
1.190962, 0.3759218, 1.008491, 0, 0, 0, 1, 1,
1.203659, 0.6209213, 1.443907, 1, 1, 1, 1, 1,
1.209869, 0.1899467, 1.941801, 1, 1, 1, 1, 1,
1.212702, 1.11989, -0.3066972, 1, 1, 1, 1, 1,
1.216233, -1.383816, 4.295932, 1, 1, 1, 1, 1,
1.223069, 1.215296, 1.112022, 1, 1, 1, 1, 1,
1.223857, -1.487525, 3.579122, 1, 1, 1, 1, 1,
1.224763, 0.004292484, 0.09210568, 1, 1, 1, 1, 1,
1.245156, -0.7542171, 2.697494, 1, 1, 1, 1, 1,
1.256261, -0.9498193, 1.632853, 1, 1, 1, 1, 1,
1.258885, 1.209851, 1.252277, 1, 1, 1, 1, 1,
1.267881, -1.151909, 2.703508, 1, 1, 1, 1, 1,
1.285417, -1.687451, 1.852902, 1, 1, 1, 1, 1,
1.307898, 0.3861724, 0.1590141, 1, 1, 1, 1, 1,
1.308506, -0.5396011, 0.5002908, 1, 1, 1, 1, 1,
1.313642, -0.2899666, 2.25471, 1, 1, 1, 1, 1,
1.319322, 0.0227394, -0.7687329, 0, 0, 1, 1, 1,
1.319856, 0.2746225, 0.3452317, 1, 0, 0, 1, 1,
1.321848, 0.9633623, 1.186956, 1, 0, 0, 1, 1,
1.328907, 0.8002643, 0.421756, 1, 0, 0, 1, 1,
1.342446, 1.608249, -1.064003, 1, 0, 0, 1, 1,
1.374842, -1.045527, 1.066871, 1, 0, 0, 1, 1,
1.375462, 1.10319, -0.7896082, 0, 0, 0, 1, 1,
1.375971, 0.5745022, 0.7788001, 0, 0, 0, 1, 1,
1.377108, -0.1490432, 0.1169628, 0, 0, 0, 1, 1,
1.377514, 0.9561251, 2.113181, 0, 0, 0, 1, 1,
1.379025, -0.2460724, 1.008137, 0, 0, 0, 1, 1,
1.382132, -0.3594626, 1.70535, 0, 0, 0, 1, 1,
1.388472, -0.3464136, 1.641446, 0, 0, 0, 1, 1,
1.390979, 1.712994, 1.41099, 1, 1, 1, 1, 1,
1.392683, 0.4734885, 1.993326, 1, 1, 1, 1, 1,
1.394746, -0.7313536, 0.6854462, 1, 1, 1, 1, 1,
1.398014, 1.009651, 2.864892, 1, 1, 1, 1, 1,
1.398783, -0.4883227, 1.551937, 1, 1, 1, 1, 1,
1.401098, 2.479565, -0.9532198, 1, 1, 1, 1, 1,
1.407621, 1.472985, 0.4783617, 1, 1, 1, 1, 1,
1.4109, -0.4712705, 2.259581, 1, 1, 1, 1, 1,
1.415456, -0.1856972, 2.610756, 1, 1, 1, 1, 1,
1.418608, 1.89281, 0.8468341, 1, 1, 1, 1, 1,
1.418614, -0.3276087, 1.948177, 1, 1, 1, 1, 1,
1.42707, 2.070024, 2.269812, 1, 1, 1, 1, 1,
1.439999, 0.9231944, 0.5431908, 1, 1, 1, 1, 1,
1.442259, -2.152831, 3.478881, 1, 1, 1, 1, 1,
1.448349, -1.210705, 2.057568, 1, 1, 1, 1, 1,
1.44965, 0.2867359, 2.535343, 0, 0, 1, 1, 1,
1.451383, -0.3757659, 2.771219, 1, 0, 0, 1, 1,
1.454022, -0.1479485, 3.789104, 1, 0, 0, 1, 1,
1.457087, 1.775253, 0.5862206, 1, 0, 0, 1, 1,
1.462986, 1.043544, 0.9238332, 1, 0, 0, 1, 1,
1.484816, 0.4897298, 1.515092, 1, 0, 0, 1, 1,
1.48936, -2.10512, 2.306693, 0, 0, 0, 1, 1,
1.492031, 2.176825, 1.903172, 0, 0, 0, 1, 1,
1.504332, -2.290179, 4.0107, 0, 0, 0, 1, 1,
1.519689, 0.9058692, 0.2066973, 0, 0, 0, 1, 1,
1.543461, 2.413394, 0.9508088, 0, 0, 0, 1, 1,
1.558463, 0.745965, 0.2861218, 0, 0, 0, 1, 1,
1.566191, 0.8846824, 1.114298, 0, 0, 0, 1, 1,
1.571328, 2.246708, 2.238227, 1, 1, 1, 1, 1,
1.584879, 1.956437, 0.9525399, 1, 1, 1, 1, 1,
1.58875, 0.2686574, 1.161983, 1, 1, 1, 1, 1,
1.594427, 1.139367, 0.4896746, 1, 1, 1, 1, 1,
1.596568, 0.3083789, 1.226938, 1, 1, 1, 1, 1,
1.600104, 0.7471284, 1.144211, 1, 1, 1, 1, 1,
1.604064, 0.2301656, 1.485749, 1, 1, 1, 1, 1,
1.606011, -0.6629607, 0.9701795, 1, 1, 1, 1, 1,
1.606482, 2.59903, 1.111973, 1, 1, 1, 1, 1,
1.606905, 0.3961756, 2.193388, 1, 1, 1, 1, 1,
1.625254, 0.5092552, 3.369828, 1, 1, 1, 1, 1,
1.625287, 0.8356096, 1.117295, 1, 1, 1, 1, 1,
1.628855, -0.7974902, 3.485174, 1, 1, 1, 1, 1,
1.644519, -0.3596796, 1.613865, 1, 1, 1, 1, 1,
1.64618, -0.8900279, 1.558185, 1, 1, 1, 1, 1,
1.648648, 0.5991555, -1.014975, 0, 0, 1, 1, 1,
1.657292, -1.994781, 1.978665, 1, 0, 0, 1, 1,
1.660667, -1.668456, 2.929896, 1, 0, 0, 1, 1,
1.675986, -0.3383161, 2.784231, 1, 0, 0, 1, 1,
1.679781, -1.569012, 3.064387, 1, 0, 0, 1, 1,
1.723397, -0.5248358, 1.323865, 1, 0, 0, 1, 1,
1.737594, 0.8346907, 1.614327, 0, 0, 0, 1, 1,
1.741604, 0.116521, 3.195149, 0, 0, 0, 1, 1,
1.77371, 0.7766731, 0.8970908, 0, 0, 0, 1, 1,
1.774714, 0.572405, 1.540505, 0, 0, 0, 1, 1,
1.775349, 0.3259371, 0.6415201, 0, 0, 0, 1, 1,
1.790883, -0.49378, 3.193235, 0, 0, 0, 1, 1,
1.804793, -1.298712, 0.3207591, 0, 0, 0, 1, 1,
1.807382, 0.7081782, 0.2256424, 1, 1, 1, 1, 1,
1.814062, -0.219517, 2.764414, 1, 1, 1, 1, 1,
1.824725, -0.2406423, 0.4790763, 1, 1, 1, 1, 1,
1.824821, -0.334602, 3.430923, 1, 1, 1, 1, 1,
1.830661, 0.1581385, 1.765209, 1, 1, 1, 1, 1,
1.837555, -0.2354914, 1.480161, 1, 1, 1, 1, 1,
1.845327, -0.1623929, 0.5046327, 1, 1, 1, 1, 1,
1.846753, -1.497352, 1.326147, 1, 1, 1, 1, 1,
1.89915, 0.8969776, 0.3150767, 1, 1, 1, 1, 1,
1.904395, -2.416259, 1.436265, 1, 1, 1, 1, 1,
1.926335, 0.4533178, 1.127739, 1, 1, 1, 1, 1,
1.943168, 2.255085, 0.2852298, 1, 1, 1, 1, 1,
1.97519, -0.06047067, 1.085509, 1, 1, 1, 1, 1,
2.021199, -1.297245, 3.680725, 1, 1, 1, 1, 1,
2.03785, 0.8118493, 1.167208, 1, 1, 1, 1, 1,
2.043747, -1.142262, 2.207007, 0, 0, 1, 1, 1,
2.04431, 1.634171, 1.69886, 1, 0, 0, 1, 1,
2.068508, 0.7008526, 1.381424, 1, 0, 0, 1, 1,
2.075772, 0.2646625, 1.516936, 1, 0, 0, 1, 1,
2.080148, -0.08434221, 1.317885, 1, 0, 0, 1, 1,
2.090139, 1.547788, -1.235254, 1, 0, 0, 1, 1,
2.129644, 0.07682052, 1.089667, 0, 0, 0, 1, 1,
2.149929, 1.311918, 0.7505679, 0, 0, 0, 1, 1,
2.16256, -1.80153, 2.035076, 0, 0, 0, 1, 1,
2.186419, 0.5400716, 1.773969, 0, 0, 0, 1, 1,
2.198917, 0.3991576, 2.605079, 0, 0, 0, 1, 1,
2.200246, -1.379651, 3.721897, 0, 0, 0, 1, 1,
2.359883, -0.02769467, 0.617657, 0, 0, 0, 1, 1,
2.536153, 1.72797, 2.772385, 1, 1, 1, 1, 1,
2.622903, -0.5602721, 0.7414878, 1, 1, 1, 1, 1,
2.653821, -0.4864776, 3.402642, 1, 1, 1, 1, 1,
2.778402, -0.6342956, 0.5534649, 1, 1, 1, 1, 1,
3.247717, -0.1500178, 1.10227, 1, 1, 1, 1, 1,
3.295501, -0.124973, 1.553202, 1, 1, 1, 1, 1,
3.733061, 1.269395, 1.695704, 1, 1, 1, 1, 1
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
var radius = 9.603007;
var distance = 33.73016;
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
mvMatrix.translate( 0.02892065, -0.05074608, -0.05417132 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73016);
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
