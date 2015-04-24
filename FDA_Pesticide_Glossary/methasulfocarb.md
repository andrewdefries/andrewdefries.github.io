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
-3.456922, 1.339514, -1.397089, 1, 0, 0, 1,
-3.106597, 0.9523187, -1.293608, 1, 0.007843138, 0, 1,
-3.008821, 1.49975, -0.9593152, 1, 0.01176471, 0, 1,
-2.936096, -0.8648402, -0.7541971, 1, 0.01960784, 0, 1,
-2.718885, 1.294341, 0.05271064, 1, 0.02352941, 0, 1,
-2.52846, 0.8076578, -0.5705697, 1, 0.03137255, 0, 1,
-2.493907, 0.8535339, -2.162657, 1, 0.03529412, 0, 1,
-2.490522, -0.5965214, -0.7886497, 1, 0.04313726, 0, 1,
-2.477034, 0.6030577, -1.405239, 1, 0.04705882, 0, 1,
-2.451995, -1.629354, -0.4031542, 1, 0.05490196, 0, 1,
-2.440815, 1.191805, -0.248242, 1, 0.05882353, 0, 1,
-2.374137, 0.02762011, -0.5267476, 1, 0.06666667, 0, 1,
-2.343751, 0.7543276, -0.3726164, 1, 0.07058824, 0, 1,
-2.338265, -0.7713534, -2.461029, 1, 0.07843138, 0, 1,
-2.331497, 0.3412486, -2.443921, 1, 0.08235294, 0, 1,
-2.288501, -0.1178855, -3.006213, 1, 0.09019608, 0, 1,
-2.268424, 1.08592, -1.023246, 1, 0.09411765, 0, 1,
-2.234614, 0.1655756, -0.6526314, 1, 0.1019608, 0, 1,
-2.217129, 0.4955145, -2.328935, 1, 0.1098039, 0, 1,
-2.209286, -0.9349326, -3.929352, 1, 0.1137255, 0, 1,
-2.19052, -0.368738, -2.684095, 1, 0.1215686, 0, 1,
-2.171113, -0.5089325, -1.579213, 1, 0.1254902, 0, 1,
-2.169737, 2.326894, -0.04154904, 1, 0.1333333, 0, 1,
-2.148014, -0.1623935, -2.480437, 1, 0.1372549, 0, 1,
-2.087656, -0.6633967, -1.59877, 1, 0.145098, 0, 1,
-2.044041, 1.264382, 0.5247482, 1, 0.1490196, 0, 1,
-2.039918, 1.783058, -1.051208, 1, 0.1568628, 0, 1,
-2.033378, -0.4983709, -2.964507, 1, 0.1607843, 0, 1,
-2.03096, -0.4534653, -3.30035, 1, 0.1686275, 0, 1,
-2.02494, -1.458084, -2.429717, 1, 0.172549, 0, 1,
-2.004678, -0.1040811, -0.2840664, 1, 0.1803922, 0, 1,
-1.996421, 0.1265877, -1.12382, 1, 0.1843137, 0, 1,
-1.987665, -1.415077, -1.408877, 1, 0.1921569, 0, 1,
-1.960665, 0.1462938, -2.40128, 1, 0.1960784, 0, 1,
-1.950371, -0.5281214, -3.175136, 1, 0.2039216, 0, 1,
-1.941236, -0.9720539, -1.851265, 1, 0.2117647, 0, 1,
-1.888017, 0.1147143, -1.712552, 1, 0.2156863, 0, 1,
-1.883992, 0.8261033, -1.464695, 1, 0.2235294, 0, 1,
-1.865985, -0.47181, -0.7773249, 1, 0.227451, 0, 1,
-1.853382, 1.144836, -0.07948388, 1, 0.2352941, 0, 1,
-1.851157, -2.562196, 0.2684354, 1, 0.2392157, 0, 1,
-1.841734, 0.6222633, -2.112467, 1, 0.2470588, 0, 1,
-1.840946, -0.1239886, -1.821475, 1, 0.2509804, 0, 1,
-1.837626, -0.6906838, -1.922078, 1, 0.2588235, 0, 1,
-1.822136, 0.351689, -1.525018, 1, 0.2627451, 0, 1,
-1.819594, -0.492549, -1.696629, 1, 0.2705882, 0, 1,
-1.813145, -0.28743, -0.9507554, 1, 0.2745098, 0, 1,
-1.811874, -0.3438762, -3.501813, 1, 0.282353, 0, 1,
-1.808361, -0.07951771, -2.604564, 1, 0.2862745, 0, 1,
-1.801582, -0.08995603, -2.441813, 1, 0.2941177, 0, 1,
-1.767215, -0.3578528, -1.171659, 1, 0.3019608, 0, 1,
-1.765398, -1.86703, -1.05432, 1, 0.3058824, 0, 1,
-1.762122, -0.9496265, -2.082781, 1, 0.3137255, 0, 1,
-1.740812, 0.5893262, 0.430521, 1, 0.3176471, 0, 1,
-1.739084, 1.380267, -0.3276367, 1, 0.3254902, 0, 1,
-1.731928, -1.701903, -1.526219, 1, 0.3294118, 0, 1,
-1.730347, 0.0199127, -1.942904, 1, 0.3372549, 0, 1,
-1.69664, -0.1219987, -0.1225752, 1, 0.3411765, 0, 1,
-1.692747, -0.6841192, -0.001936468, 1, 0.3490196, 0, 1,
-1.689833, -0.3074334, -0.8921172, 1, 0.3529412, 0, 1,
-1.683868, 0.5678059, -2.01374, 1, 0.3607843, 0, 1,
-1.670682, -1.281886, -1.789059, 1, 0.3647059, 0, 1,
-1.665077, -1.474192, -3.491013, 1, 0.372549, 0, 1,
-1.658246, 1.045945, -1.096308, 1, 0.3764706, 0, 1,
-1.653637, 1.849879, -1.067927, 1, 0.3843137, 0, 1,
-1.646472, -0.7802854, -1.936014, 1, 0.3882353, 0, 1,
-1.634727, 0.303124, -2.201518, 1, 0.3960784, 0, 1,
-1.63122, 0.139252, -2.151677, 1, 0.4039216, 0, 1,
-1.617771, -0.2420895, -1.732538, 1, 0.4078431, 0, 1,
-1.597681, 0.9410339, -2.862174, 1, 0.4156863, 0, 1,
-1.552725, -0.2280564, -1.591151, 1, 0.4196078, 0, 1,
-1.537093, -1.438412, -2.526325, 1, 0.427451, 0, 1,
-1.52234, -0.3589973, -2.692065, 1, 0.4313726, 0, 1,
-1.508883, 0.2471087, 0.6614395, 1, 0.4392157, 0, 1,
-1.500672, -0.6741914, -1.65497, 1, 0.4431373, 0, 1,
-1.49938, -2.47157, -0.7529615, 1, 0.4509804, 0, 1,
-1.495952, -1.185347, -2.196035, 1, 0.454902, 0, 1,
-1.495624, 1.902536, -0.2239406, 1, 0.4627451, 0, 1,
-1.474482, 0.6507131, -0.8003512, 1, 0.4666667, 0, 1,
-1.460099, -1.229143, -2.771454, 1, 0.4745098, 0, 1,
-1.458092, -0.9032646, -2.925838, 1, 0.4784314, 0, 1,
-1.45552, 0.3963766, -1.439348, 1, 0.4862745, 0, 1,
-1.454032, 2.109717, 0.4526278, 1, 0.4901961, 0, 1,
-1.448768, -1.702777, -0.9020271, 1, 0.4980392, 0, 1,
-1.446603, -0.7125929, -2.023707, 1, 0.5058824, 0, 1,
-1.417475, -0.6538891, -0.7928826, 1, 0.509804, 0, 1,
-1.415016, 0.6269161, -0.3351369, 1, 0.5176471, 0, 1,
-1.413363, -0.5756766, -2.521686, 1, 0.5215687, 0, 1,
-1.402125, 0.08290748, -2.296052, 1, 0.5294118, 0, 1,
-1.397109, -2.162505, -0.6916967, 1, 0.5333334, 0, 1,
-1.383421, 0.2833608, -0.07558109, 1, 0.5411765, 0, 1,
-1.378298, -0.03399775, -1.865792, 1, 0.5450981, 0, 1,
-1.369059, 0.3913429, -1.082121, 1, 0.5529412, 0, 1,
-1.365887, 1.107689, 0.832687, 1, 0.5568628, 0, 1,
-1.358382, 0.8817859, -0.9213786, 1, 0.5647059, 0, 1,
-1.346856, -0.632692, -2.954099, 1, 0.5686275, 0, 1,
-1.344978, 0.9560382, -0.2031147, 1, 0.5764706, 0, 1,
-1.344645, 1.069999, -1.714549, 1, 0.5803922, 0, 1,
-1.340219, 0.5361722, -0.9651062, 1, 0.5882353, 0, 1,
-1.327972, -0.2850834, -1.733452, 1, 0.5921569, 0, 1,
-1.320506, 0.9611301, -0.33131, 1, 0.6, 0, 1,
-1.318376, 0.5351468, -0.5941995, 1, 0.6078432, 0, 1,
-1.314066, 0.3149145, -0.8335028, 1, 0.6117647, 0, 1,
-1.30435, 0.6622171, 0.3750736, 1, 0.6196079, 0, 1,
-1.302007, 0.2149625, -2.322057, 1, 0.6235294, 0, 1,
-1.299221, 0.1603514, -2.722689, 1, 0.6313726, 0, 1,
-1.292762, 0.3445526, -2.14622, 1, 0.6352941, 0, 1,
-1.291071, -2.261462, -2.83346, 1, 0.6431373, 0, 1,
-1.286143, -0.4063723, -2.614215, 1, 0.6470588, 0, 1,
-1.284531, 0.4335396, -2.340716, 1, 0.654902, 0, 1,
-1.278416, 1.127881, 0.675929, 1, 0.6588235, 0, 1,
-1.269995, 0.7005914, -1.186225, 1, 0.6666667, 0, 1,
-1.26921, 0.8412208, -2.600439, 1, 0.6705883, 0, 1,
-1.263032, -0.8283935, -3.489638, 1, 0.6784314, 0, 1,
-1.261932, -0.9510632, -2.617167, 1, 0.682353, 0, 1,
-1.260098, 1.374234, -1.075515, 1, 0.6901961, 0, 1,
-1.255992, -0.9753187, -0.4784395, 1, 0.6941177, 0, 1,
-1.255125, -0.6401382, -3.433182, 1, 0.7019608, 0, 1,
-1.251772, 0.8172844, -1.07536, 1, 0.7098039, 0, 1,
-1.25097, -0.3237956, 0.3742165, 1, 0.7137255, 0, 1,
-1.250676, -0.04594045, -0.7486094, 1, 0.7215686, 0, 1,
-1.248521, 0.1437321, -0.7415817, 1, 0.7254902, 0, 1,
-1.243795, 0.06742661, -0.03788915, 1, 0.7333333, 0, 1,
-1.243057, 0.3225347, 0.03944276, 1, 0.7372549, 0, 1,
-1.228548, 1.021281, -0.4845046, 1, 0.7450981, 0, 1,
-1.220625, -0.7959582, -4.331, 1, 0.7490196, 0, 1,
-1.20711, -0.1336031, -0.007442162, 1, 0.7568628, 0, 1,
-1.202572, -0.7236846, -1.712918, 1, 0.7607843, 0, 1,
-1.202009, 0.1281065, -0.2803526, 1, 0.7686275, 0, 1,
-1.20013, -0.3751363, -3.403725, 1, 0.772549, 0, 1,
-1.19406, -2.162697, -3.251032, 1, 0.7803922, 0, 1,
-1.190263, -0.4647588, -2.077828, 1, 0.7843137, 0, 1,
-1.185965, 0.916507, 0.1239044, 1, 0.7921569, 0, 1,
-1.18412, 0.1755064, -1.196957, 1, 0.7960784, 0, 1,
-1.175938, 0.1540224, -2.414496, 1, 0.8039216, 0, 1,
-1.175425, -1.163978, -0.9896181, 1, 0.8117647, 0, 1,
-1.175062, 1.524095, -2.003001, 1, 0.8156863, 0, 1,
-1.166806, 0.3468561, -1.727828, 1, 0.8235294, 0, 1,
-1.165153, 2.170619, -0.8637795, 1, 0.827451, 0, 1,
-1.158313, 0.9865515, -1.000238, 1, 0.8352941, 0, 1,
-1.134766, 1.351522, -0.8943002, 1, 0.8392157, 0, 1,
-1.133418, -0.4592372, -2.024896, 1, 0.8470588, 0, 1,
-1.133341, 1.239393, 0.5913327, 1, 0.8509804, 0, 1,
-1.132537, 1.599077, -0.9392311, 1, 0.8588235, 0, 1,
-1.131855, 0.633321, -2.103779, 1, 0.8627451, 0, 1,
-1.129719, -0.2193009, -2.051581, 1, 0.8705882, 0, 1,
-1.12888, -0.6149373, -3.630431, 1, 0.8745098, 0, 1,
-1.127956, 1.633393, -1.451836, 1, 0.8823529, 0, 1,
-1.123977, 0.4251329, -1.868531, 1, 0.8862745, 0, 1,
-1.121866, 1.009879, -1.637026, 1, 0.8941177, 0, 1,
-1.100617, -1.175877, -3.071912, 1, 0.8980392, 0, 1,
-1.095008, 0.2671746, -1.437512, 1, 0.9058824, 0, 1,
-1.094671, -0.01968484, -1.177651, 1, 0.9137255, 0, 1,
-1.094558, 0.5324646, -0.7034696, 1, 0.9176471, 0, 1,
-1.082868, -0.6918357, -1.452087, 1, 0.9254902, 0, 1,
-1.082549, -0.3777302, -1.034518, 1, 0.9294118, 0, 1,
-1.064636, -0.3092559, -2.354404, 1, 0.9372549, 0, 1,
-1.052952, -1.081081, -2.349626, 1, 0.9411765, 0, 1,
-1.04867, -1.817294, -2.821496, 1, 0.9490196, 0, 1,
-1.040184, -0.8257907, -3.492179, 1, 0.9529412, 0, 1,
-1.032729, -1.213169, -4.082024, 1, 0.9607843, 0, 1,
-1.014528, -1.857142, -2.253874, 1, 0.9647059, 0, 1,
-1.013826, -1.892092, -1.906528, 1, 0.972549, 0, 1,
-1.003725, -0.7190318, -3.112476, 1, 0.9764706, 0, 1,
-1.003415, 0.2841958, -0.3169478, 1, 0.9843137, 0, 1,
-0.999892, -0.7602685, -2.115577, 1, 0.9882353, 0, 1,
-0.993961, -1.706746, -2.963651, 1, 0.9960784, 0, 1,
-0.9911571, -0.5444422, -2.431735, 0.9960784, 1, 0, 1,
-0.9847868, -0.1830738, -2.34993, 0.9921569, 1, 0, 1,
-0.981038, 1.199103, 1.021242, 0.9843137, 1, 0, 1,
-0.9792625, 1.73826, -0.6138412, 0.9803922, 1, 0, 1,
-0.9758905, 0.3666335, -1.261554, 0.972549, 1, 0, 1,
-0.9743747, -0.2342345, -1.367242, 0.9686275, 1, 0, 1,
-0.9739521, 1.031453, -0.9894174, 0.9607843, 1, 0, 1,
-0.9644724, -1.2766, -1.684538, 0.9568627, 1, 0, 1,
-0.9583987, -0.6705342, -2.200537, 0.9490196, 1, 0, 1,
-0.952449, -0.7175813, -0.7719726, 0.945098, 1, 0, 1,
-0.9516468, -0.2963185, -1.143966, 0.9372549, 1, 0, 1,
-0.9492905, -0.7298238, -2.718795, 0.9333333, 1, 0, 1,
-0.9385738, 0.4859865, 0.293918, 0.9254902, 1, 0, 1,
-0.9339252, -0.9753649, -4.186028, 0.9215686, 1, 0, 1,
-0.9338009, -0.3338643, -1.933305, 0.9137255, 1, 0, 1,
-0.9275886, 2.011426, -0.866209, 0.9098039, 1, 0, 1,
-0.922716, -0.8352418, -2.362601, 0.9019608, 1, 0, 1,
-0.9107472, 0.1432992, -2.545489, 0.8941177, 1, 0, 1,
-0.90323, 0.3512493, -1.422222, 0.8901961, 1, 0, 1,
-0.901584, 0.1650922, -1.603804, 0.8823529, 1, 0, 1,
-0.9008189, -0.6929026, -4.345071, 0.8784314, 1, 0, 1,
-0.8987529, -0.5952657, -3.597445, 0.8705882, 1, 0, 1,
-0.8970123, -0.06256243, -2.947102, 0.8666667, 1, 0, 1,
-0.8880819, 0.4804254, -0.4319935, 0.8588235, 1, 0, 1,
-0.8862023, 0.9480922, -1.005291, 0.854902, 1, 0, 1,
-0.8854162, -0.6000004, -2.979077, 0.8470588, 1, 0, 1,
-0.8704887, -0.3453138, -2.556536, 0.8431373, 1, 0, 1,
-0.8704188, -0.8220351, -1.326188, 0.8352941, 1, 0, 1,
-0.8665162, -0.1902993, -2.649895, 0.8313726, 1, 0, 1,
-0.8654766, 1.454445, 1.113637, 0.8235294, 1, 0, 1,
-0.8635648, -0.6080785, -1.413393, 0.8196079, 1, 0, 1,
-0.8608627, -0.3331423, -3.201969, 0.8117647, 1, 0, 1,
-0.8554767, -0.2398341, -1.983473, 0.8078431, 1, 0, 1,
-0.8540185, 1.453685, -2.284702, 0.8, 1, 0, 1,
-0.8425928, 0.2614252, -0.5991352, 0.7921569, 1, 0, 1,
-0.8411198, -1.20524, -1.408745, 0.7882353, 1, 0, 1,
-0.8409128, -0.6857164, -3.708865, 0.7803922, 1, 0, 1,
-0.8321522, -0.1439217, -2.329221, 0.7764706, 1, 0, 1,
-0.8266224, 1.315249, -0.9843456, 0.7686275, 1, 0, 1,
-0.8214503, 1.481997, -1.944746, 0.7647059, 1, 0, 1,
-0.8206373, -1.345254, -2.592716, 0.7568628, 1, 0, 1,
-0.8191392, 0.01888585, -2.565363, 0.7529412, 1, 0, 1,
-0.8109461, -1.096598, -2.486018, 0.7450981, 1, 0, 1,
-0.8097657, 1.42859, -0.2248963, 0.7411765, 1, 0, 1,
-0.8010229, 1.761039, -0.3024369, 0.7333333, 1, 0, 1,
-0.8007925, 0.4103513, -1.701476, 0.7294118, 1, 0, 1,
-0.8005934, 1.146213, -0.6931463, 0.7215686, 1, 0, 1,
-0.7982147, -1.415226, -1.620741, 0.7176471, 1, 0, 1,
-0.7961748, -0.9295388, -2.663345, 0.7098039, 1, 0, 1,
-0.7885194, -0.9405192, -1.443878, 0.7058824, 1, 0, 1,
-0.7866527, -0.7174931, -2.253716, 0.6980392, 1, 0, 1,
-0.7800234, -1.744192, -3.721013, 0.6901961, 1, 0, 1,
-0.7741922, 0.9338909, -1.615799, 0.6862745, 1, 0, 1,
-0.7640482, 2.065244, -0.6373307, 0.6784314, 1, 0, 1,
-0.7630137, 0.2544328, -2.491606, 0.6745098, 1, 0, 1,
-0.7598441, 0.9143298, -1.654765, 0.6666667, 1, 0, 1,
-0.7475005, 0.4380665, -1.808457, 0.6627451, 1, 0, 1,
-0.7470761, -1.218107, -2.970934, 0.654902, 1, 0, 1,
-0.7467762, -1.22167, -2.940032, 0.6509804, 1, 0, 1,
-0.7388797, 0.9786491, -2.641721, 0.6431373, 1, 0, 1,
-0.7325313, 0.4678238, 1.259815, 0.6392157, 1, 0, 1,
-0.7305297, -1.811952, -3.927438, 0.6313726, 1, 0, 1,
-0.7300856, -0.1478361, -2.83845, 0.627451, 1, 0, 1,
-0.7276703, 0.3751133, -0.79881, 0.6196079, 1, 0, 1,
-0.725851, -0.183496, -2.38186, 0.6156863, 1, 0, 1,
-0.7207339, -0.4871013, 0.596155, 0.6078432, 1, 0, 1,
-0.7192082, 0.4589196, -0.2718609, 0.6039216, 1, 0, 1,
-0.7102806, -1.835315, -1.474517, 0.5960785, 1, 0, 1,
-0.7091088, 1.910482, 0.5407989, 0.5882353, 1, 0, 1,
-0.7089649, -0.06916811, -0.7358256, 0.5843138, 1, 0, 1,
-0.6923689, -0.2347479, -1.267704, 0.5764706, 1, 0, 1,
-0.6904486, -0.0804211, -2.393391, 0.572549, 1, 0, 1,
-0.6809064, 0.5339357, -0.550409, 0.5647059, 1, 0, 1,
-0.6780573, -1.734141, -2.226247, 0.5607843, 1, 0, 1,
-0.6743679, 0.9600757, -2.415552, 0.5529412, 1, 0, 1,
-0.6743483, -0.2151359, -1.803123, 0.5490196, 1, 0, 1,
-0.6715269, -1.035504, -1.639768, 0.5411765, 1, 0, 1,
-0.6686459, -1.514154, -3.782429, 0.5372549, 1, 0, 1,
-0.6656058, -1.065462, -3.160055, 0.5294118, 1, 0, 1,
-0.6640068, 1.197543, -2.722607, 0.5254902, 1, 0, 1,
-0.6635869, -1.811697, -4.11097, 0.5176471, 1, 0, 1,
-0.6596684, -1.145387, -1.88816, 0.5137255, 1, 0, 1,
-0.6587912, -0.09131797, -1.982309, 0.5058824, 1, 0, 1,
-0.65127, 0.05712666, -1.316079, 0.5019608, 1, 0, 1,
-0.6448208, 1.243421, 0.668121, 0.4941176, 1, 0, 1,
-0.6426522, -1.29009, -1.906678, 0.4862745, 1, 0, 1,
-0.642424, -0.9291904, -1.453203, 0.4823529, 1, 0, 1,
-0.6372761, 1.395941, 0.04683831, 0.4745098, 1, 0, 1,
-0.6344363, -1.021087, -1.860975, 0.4705882, 1, 0, 1,
-0.6315213, -0.8543451, -3.653375, 0.4627451, 1, 0, 1,
-0.6276845, -0.1283345, -2.341984, 0.4588235, 1, 0, 1,
-0.626798, 0.0183326, -2.544096, 0.4509804, 1, 0, 1,
-0.6251619, 0.66734, -1.323749, 0.4470588, 1, 0, 1,
-0.6244886, -0.4644711, -2.804423, 0.4392157, 1, 0, 1,
-0.6240995, -0.496977, -1.599207, 0.4352941, 1, 0, 1,
-0.6235145, -0.3173269, -1.804304, 0.427451, 1, 0, 1,
-0.6220056, -0.06059493, -0.380409, 0.4235294, 1, 0, 1,
-0.6213218, 0.356869, -1.397467, 0.4156863, 1, 0, 1,
-0.6182806, -1.106259, -2.41252, 0.4117647, 1, 0, 1,
-0.6161757, -0.2835587, -3.830815, 0.4039216, 1, 0, 1,
-0.6125284, 1.053508, -1.051077, 0.3960784, 1, 0, 1,
-0.6101629, 0.3161726, -0.2148473, 0.3921569, 1, 0, 1,
-0.6005549, -0.7864696, -1.942066, 0.3843137, 1, 0, 1,
-0.5985159, -0.4130561, -2.55248, 0.3803922, 1, 0, 1,
-0.5965135, 0.1245658, -1.78958, 0.372549, 1, 0, 1,
-0.59217, 0.2030694, -2.494721, 0.3686275, 1, 0, 1,
-0.590646, 1.389694, 0.6080786, 0.3607843, 1, 0, 1,
-0.5894676, 0.08321094, -2.89849, 0.3568628, 1, 0, 1,
-0.5875371, 1.328563, -0.3606013, 0.3490196, 1, 0, 1,
-0.5863472, 0.4031417, -3.017254, 0.345098, 1, 0, 1,
-0.5694461, 0.02098251, -1.397976, 0.3372549, 1, 0, 1,
-0.5673587, 0.03537416, -1.235085, 0.3333333, 1, 0, 1,
-0.5662387, -0.6098415, -4.548926, 0.3254902, 1, 0, 1,
-0.5616369, -0.1673016, -2.418262, 0.3215686, 1, 0, 1,
-0.5598471, 0.1025086, -0.3655178, 0.3137255, 1, 0, 1,
-0.5566106, 0.2722448, -2.913771, 0.3098039, 1, 0, 1,
-0.5563663, 1.016065, 0.8000269, 0.3019608, 1, 0, 1,
-0.5560643, -0.9640874, -2.840666, 0.2941177, 1, 0, 1,
-0.5548068, -0.9130169, -1.749104, 0.2901961, 1, 0, 1,
-0.5511205, 0.6563503, -0.0700641, 0.282353, 1, 0, 1,
-0.550834, 0.166474, -1.595541, 0.2784314, 1, 0, 1,
-0.5504326, 1.705854, -1.680762, 0.2705882, 1, 0, 1,
-0.5501243, 0.6458493, 0.6324359, 0.2666667, 1, 0, 1,
-0.5475263, -0.9418944, -3.894033, 0.2588235, 1, 0, 1,
-0.5446824, 0.6256506, -1.921113, 0.254902, 1, 0, 1,
-0.54176, 0.650221, -2.429537, 0.2470588, 1, 0, 1,
-0.5278003, 0.9709231, -0.8656281, 0.2431373, 1, 0, 1,
-0.5271884, -1.111814, -1.133826, 0.2352941, 1, 0, 1,
-0.5226193, -0.6683448, -2.852171, 0.2313726, 1, 0, 1,
-0.5182005, -0.02336165, -0.5705886, 0.2235294, 1, 0, 1,
-0.517285, 0.1404198, -1.269017, 0.2196078, 1, 0, 1,
-0.5144049, -0.07607038, -2.007177, 0.2117647, 1, 0, 1,
-0.5111187, -2.950576, -2.292546, 0.2078431, 1, 0, 1,
-0.5108291, -1.258898, -4.439994, 0.2, 1, 0, 1,
-0.5100049, 2.067237, -0.47833, 0.1921569, 1, 0, 1,
-0.5099387, -2.380194, -4.789087, 0.1882353, 1, 0, 1,
-0.5074901, 0.6381519, -1.647762, 0.1803922, 1, 0, 1,
-0.5052974, 0.7827172, -1.337479, 0.1764706, 1, 0, 1,
-0.5050889, -0.08498936, -0.6336635, 0.1686275, 1, 0, 1,
-0.5044556, 0.6728457, 0.2581203, 0.1647059, 1, 0, 1,
-0.5023094, -1.474208, -1.719324, 0.1568628, 1, 0, 1,
-0.4982809, -0.2979743, -3.725605, 0.1529412, 1, 0, 1,
-0.4930411, 0.7317658, 1.534848, 0.145098, 1, 0, 1,
-0.4906307, -1.050142, -1.839552, 0.1411765, 1, 0, 1,
-0.4846833, -0.6350007, -4.293891, 0.1333333, 1, 0, 1,
-0.4828337, 0.2192678, -3.462502, 0.1294118, 1, 0, 1,
-0.4747232, 0.5769818, -0.7124355, 0.1215686, 1, 0, 1,
-0.4747174, -2.249134, -0.5736461, 0.1176471, 1, 0, 1,
-0.464979, -0.2822762, -3.732979, 0.1098039, 1, 0, 1,
-0.4635352, -0.08095436, 0.034947, 0.1058824, 1, 0, 1,
-0.4600746, -1.081928, -2.447014, 0.09803922, 1, 0, 1,
-0.4575063, -2.504092, -2.607551, 0.09019608, 1, 0, 1,
-0.4514892, -0.5932263, -2.666236, 0.08627451, 1, 0, 1,
-0.4496799, 1.358903, -0.9910543, 0.07843138, 1, 0, 1,
-0.4472307, -0.01450981, -2.045752, 0.07450981, 1, 0, 1,
-0.4442958, -1.114837, -1.643696, 0.06666667, 1, 0, 1,
-0.4438601, 0.6062156, -0.3467385, 0.0627451, 1, 0, 1,
-0.4401312, -0.3376221, -2.988489, 0.05490196, 1, 0, 1,
-0.4370718, 0.8221078, -0.0814762, 0.05098039, 1, 0, 1,
-0.4300048, 0.5221377, 0.5259702, 0.04313726, 1, 0, 1,
-0.4295031, 0.7370178, -0.3946375, 0.03921569, 1, 0, 1,
-0.4276535, 0.0693707, -1.049113, 0.03137255, 1, 0, 1,
-0.4223176, 0.4758764, -1.302294, 0.02745098, 1, 0, 1,
-0.4222062, -1.187762, -3.523614, 0.01960784, 1, 0, 1,
-0.4194076, 1.358935, 0.8425645, 0.01568628, 1, 0, 1,
-0.4155003, 0.09623336, -1.60549, 0.007843138, 1, 0, 1,
-0.4090028, -0.2701891, -0.694943, 0.003921569, 1, 0, 1,
-0.4044923, -0.6368774, -3.391042, 0, 1, 0.003921569, 1,
-0.4039379, 0.7541366, -0.05226782, 0, 1, 0.01176471, 1,
-0.4034185, -0.4238265, -0.9601208, 0, 1, 0.01568628, 1,
-0.3988462, -0.335094, -2.112876, 0, 1, 0.02352941, 1,
-0.3988383, 0.8039733, 0.4162111, 0, 1, 0.02745098, 1,
-0.3977208, -1.321443, -2.260615, 0, 1, 0.03529412, 1,
-0.3945989, -0.3795817, -0.6807786, 0, 1, 0.03921569, 1,
-0.3943599, 0.1804773, -1.865503, 0, 1, 0.04705882, 1,
-0.3911045, 1.261267, -0.1795482, 0, 1, 0.05098039, 1,
-0.3906698, -0.5665926, -1.667737, 0, 1, 0.05882353, 1,
-0.3900127, 0.8362755, 0.7181875, 0, 1, 0.0627451, 1,
-0.3860922, -1.167271, -4.98335, 0, 1, 0.07058824, 1,
-0.3854808, 0.5117027, -1.513175, 0, 1, 0.07450981, 1,
-0.3791164, -1.863158, -1.141731, 0, 1, 0.08235294, 1,
-0.3781402, 1.425182, -0.1080624, 0, 1, 0.08627451, 1,
-0.377901, 0.3181022, -1.434816, 0, 1, 0.09411765, 1,
-0.3776766, -0.04851775, -1.55044, 0, 1, 0.1019608, 1,
-0.3740419, -0.9112598, -1.026566, 0, 1, 0.1058824, 1,
-0.3727012, -0.01073117, -2.854098, 0, 1, 0.1137255, 1,
-0.3614663, -0.03891155, -0.9333205, 0, 1, 0.1176471, 1,
-0.3606743, -1.947593, -2.335758, 0, 1, 0.1254902, 1,
-0.3575699, 1.007254, 0.4325157, 0, 1, 0.1294118, 1,
-0.3537048, 0.1205629, -1.167296, 0, 1, 0.1372549, 1,
-0.353545, -1.451701, -3.01968, 0, 1, 0.1411765, 1,
-0.3512644, 0.2831341, 0.07652236, 0, 1, 0.1490196, 1,
-0.3452188, -0.1579673, -3.174032, 0, 1, 0.1529412, 1,
-0.3446628, -0.6086872, -1.542322, 0, 1, 0.1607843, 1,
-0.3366578, 0.3675533, -0.9444659, 0, 1, 0.1647059, 1,
-0.3355675, 0.5402253, 0.02321973, 0, 1, 0.172549, 1,
-0.3353173, 1.373577, -2.379186, 0, 1, 0.1764706, 1,
-0.3351399, 0.2931218, -1.037043, 0, 1, 0.1843137, 1,
-0.332555, 0.9614882, -0.6360725, 0, 1, 0.1882353, 1,
-0.3317539, 0.1360761, -1.166374, 0, 1, 0.1960784, 1,
-0.3286691, -0.4339687, -2.517341, 0, 1, 0.2039216, 1,
-0.3281113, -0.7337506, -2.192188, 0, 1, 0.2078431, 1,
-0.3270382, 1.553289, -1.183533, 0, 1, 0.2156863, 1,
-0.3238871, 0.8802642, -1.712814, 0, 1, 0.2196078, 1,
-0.3188848, -0.1401215, -1.874728, 0, 1, 0.227451, 1,
-0.3169251, 0.7122326, 0.8240406, 0, 1, 0.2313726, 1,
-0.3099546, -0.2886501, -3.167555, 0, 1, 0.2392157, 1,
-0.3092144, -0.3643989, -3.10113, 0, 1, 0.2431373, 1,
-0.3090179, 0.364347, -1.066496, 0, 1, 0.2509804, 1,
-0.3071604, 1.29057, 0.4583276, 0, 1, 0.254902, 1,
-0.3011589, 0.750177, -1.252815, 0, 1, 0.2627451, 1,
-0.297311, 2.390081, 1.042388, 0, 1, 0.2666667, 1,
-0.2894608, -0.0511669, -3.363057, 0, 1, 0.2745098, 1,
-0.2874934, 0.2930901, -0.7597681, 0, 1, 0.2784314, 1,
-0.2831301, 1.699734, -0.8508689, 0, 1, 0.2862745, 1,
-0.279483, 0.8124164, 0.1477371, 0, 1, 0.2901961, 1,
-0.2751648, -0.1650323, -1.406246, 0, 1, 0.2980392, 1,
-0.2740869, 1.921267, -0.2957286, 0, 1, 0.3058824, 1,
-0.2709067, 1.411325, -0.06473517, 0, 1, 0.3098039, 1,
-0.2682894, 0.2709996, -1.237469, 0, 1, 0.3176471, 1,
-0.2681229, 0.450752, -0.2361472, 0, 1, 0.3215686, 1,
-0.2675087, 0.9750807, 0.0426932, 0, 1, 0.3294118, 1,
-0.2663915, -1.007985, -3.320453, 0, 1, 0.3333333, 1,
-0.2652366, 1.248045, 1.001096, 0, 1, 0.3411765, 1,
-0.2621609, -0.1404019, -3.027149, 0, 1, 0.345098, 1,
-0.2496651, -0.3804695, -1.005631, 0, 1, 0.3529412, 1,
-0.2480873, -0.8214158, -2.567373, 0, 1, 0.3568628, 1,
-0.2440895, -0.2822194, -3.986146, 0, 1, 0.3647059, 1,
-0.2367257, 1.03312, -0.5747206, 0, 1, 0.3686275, 1,
-0.2277288, 0.6901951, -0.8359895, 0, 1, 0.3764706, 1,
-0.2273236, -1.305573, -3.792267, 0, 1, 0.3803922, 1,
-0.2256649, 2.2368, 0.7825981, 0, 1, 0.3882353, 1,
-0.2253787, -0.2152217, -3.144021, 0, 1, 0.3921569, 1,
-0.2212528, 1.097369, -0.7934223, 0, 1, 0.4, 1,
-0.2193689, 1.640116, -0.1939954, 0, 1, 0.4078431, 1,
-0.2177352, 0.5629256, -3.008355, 0, 1, 0.4117647, 1,
-0.2169133, -1.070144, -0.8440273, 0, 1, 0.4196078, 1,
-0.2166429, -0.5258833, -3.344813, 0, 1, 0.4235294, 1,
-0.2135694, 0.08702513, -1.452597, 0, 1, 0.4313726, 1,
-0.213359, -0.4624082, -4.061087, 0, 1, 0.4352941, 1,
-0.2083278, -1.483496, -2.873523, 0, 1, 0.4431373, 1,
-0.2060005, -0.8649594, -3.348105, 0, 1, 0.4470588, 1,
-0.2051667, -1.010662, -2.594787, 0, 1, 0.454902, 1,
-0.2045562, -0.428703, -2.530188, 0, 1, 0.4588235, 1,
-0.2033073, 0.4580362, 1.547616, 0, 1, 0.4666667, 1,
-0.2030633, -0.07422607, -2.13424, 0, 1, 0.4705882, 1,
-0.2014723, -0.9636396, -2.562353, 0, 1, 0.4784314, 1,
-0.200988, -0.09947801, -2.295994, 0, 1, 0.4823529, 1,
-0.194221, -0.1803949, -2.576401, 0, 1, 0.4901961, 1,
-0.1920738, 0.7739422, 0.8027105, 0, 1, 0.4941176, 1,
-0.1907027, -1.139851, -3.058349, 0, 1, 0.5019608, 1,
-0.1847588, 0.5883782, 2.294456, 0, 1, 0.509804, 1,
-0.1799899, -1.010704, -3.605257, 0, 1, 0.5137255, 1,
-0.1799796, -0.2777866, -3.771365, 0, 1, 0.5215687, 1,
-0.1694239, 0.7149021, 0.3945977, 0, 1, 0.5254902, 1,
-0.1691535, -0.6200646, -1.162153, 0, 1, 0.5333334, 1,
-0.1659353, 0.3632969, -0.05790625, 0, 1, 0.5372549, 1,
-0.1657187, 1.239273, 1.334479, 0, 1, 0.5450981, 1,
-0.1648189, -0.3146028, -0.8788268, 0, 1, 0.5490196, 1,
-0.1603838, 0.8373942, 0.9747831, 0, 1, 0.5568628, 1,
-0.1559895, -0.8980551, -3.237459, 0, 1, 0.5607843, 1,
-0.1556596, -0.8890608, -3.225177, 0, 1, 0.5686275, 1,
-0.1440486, 0.3587344, -0.3114303, 0, 1, 0.572549, 1,
-0.1429104, 0.04879567, -0.959928, 0, 1, 0.5803922, 1,
-0.1411979, -0.2420487, -3.485717, 0, 1, 0.5843138, 1,
-0.1401007, 0.8126447, -0.7944897, 0, 1, 0.5921569, 1,
-0.1342563, -1.011888, -2.67951, 0, 1, 0.5960785, 1,
-0.1303644, 0.6377237, -0.8947865, 0, 1, 0.6039216, 1,
-0.1290514, 2.08324, -0.1467763, 0, 1, 0.6117647, 1,
-0.1284683, 0.03934675, -0.9069219, 0, 1, 0.6156863, 1,
-0.1266115, -0.1980686, -2.584098, 0, 1, 0.6235294, 1,
-0.1265271, -2.728045, -3.203005, 0, 1, 0.627451, 1,
-0.1263837, -1.534057, -2.114378, 0, 1, 0.6352941, 1,
-0.1256608, -1.048354, -4.482807, 0, 1, 0.6392157, 1,
-0.1204135, 0.8138502, -0.2227919, 0, 1, 0.6470588, 1,
-0.1178531, -0.5207347, -1.280702, 0, 1, 0.6509804, 1,
-0.1149352, -0.8816, -4.012149, 0, 1, 0.6588235, 1,
-0.1137518, -0.6647919, -3.152937, 0, 1, 0.6627451, 1,
-0.1136516, -0.6024908, -1.209496, 0, 1, 0.6705883, 1,
-0.1105817, 1.496973, -0.1971195, 0, 1, 0.6745098, 1,
-0.1091523, -0.1087036, -3.602435, 0, 1, 0.682353, 1,
-0.1085118, 0.5360781, -0.9811105, 0, 1, 0.6862745, 1,
-0.1079066, 0.8762633, 1.154429, 0, 1, 0.6941177, 1,
-0.1033807, 0.8808267, -1.695064, 0, 1, 0.7019608, 1,
-0.1030516, 0.1727548, 0.171085, 0, 1, 0.7058824, 1,
-0.09769697, -2.957806, -4.056707, 0, 1, 0.7137255, 1,
-0.09423181, -1.375447, -3.729609, 0, 1, 0.7176471, 1,
-0.0908663, 1.149869, -0.6575291, 0, 1, 0.7254902, 1,
-0.08227415, -1.288172, -3.040431, 0, 1, 0.7294118, 1,
-0.07922675, -0.6191792, -2.804647, 0, 1, 0.7372549, 1,
-0.07812499, -1.029733, -5.536945, 0, 1, 0.7411765, 1,
-0.07707367, 1.040242, 0.6556739, 0, 1, 0.7490196, 1,
-0.07195263, -0.5018079, -1.384813, 0, 1, 0.7529412, 1,
-0.06863574, -0.6307378, -4.485183, 0, 1, 0.7607843, 1,
-0.06662795, -0.08042087, -1.635824, 0, 1, 0.7647059, 1,
-0.06330407, -0.903146, -4.357288, 0, 1, 0.772549, 1,
-0.0539686, -0.6997772, -2.448185, 0, 1, 0.7764706, 1,
-0.05145429, 1.259585, 0.7497488, 0, 1, 0.7843137, 1,
-0.04656824, 1.454763, 0.5782335, 0, 1, 0.7882353, 1,
-0.04553125, -0.680121, -2.472715, 0, 1, 0.7960784, 1,
-0.04191598, 0.1177641, -0.2637488, 0, 1, 0.8039216, 1,
-0.0418714, -1.313049, -2.900416, 0, 1, 0.8078431, 1,
-0.03985832, -0.03616561, -0.5428518, 0, 1, 0.8156863, 1,
-0.03720605, -0.9032954, -2.103295, 0, 1, 0.8196079, 1,
-0.03532531, 1.601402, -0.7316212, 0, 1, 0.827451, 1,
-0.03356192, -1.423899, -2.796527, 0, 1, 0.8313726, 1,
-0.03191685, -0.4993061, -1.350825, 0, 1, 0.8392157, 1,
-0.03188253, 0.468255, 0.8388788, 0, 1, 0.8431373, 1,
-0.02969396, 1.956788, 1.568526, 0, 1, 0.8509804, 1,
-0.02750941, 0.8376907, -0.07719928, 0, 1, 0.854902, 1,
-0.02534161, -0.219986, -4.255214, 0, 1, 0.8627451, 1,
-0.02523746, 1.211038, -1.824374, 0, 1, 0.8666667, 1,
-0.02342524, -0.028318, -4.01429, 0, 1, 0.8745098, 1,
-0.02280672, -1.412024, -3.114243, 0, 1, 0.8784314, 1,
-0.02212778, 0.4131466, -1.350922, 0, 1, 0.8862745, 1,
-0.0184805, -0.08639151, -4.132973, 0, 1, 0.8901961, 1,
-0.01686195, 0.8153822, 0.6933986, 0, 1, 0.8980392, 1,
-0.01180616, 1.687627, -0.6117026, 0, 1, 0.9058824, 1,
-0.01127359, -0.07108031, -1.255705, 0, 1, 0.9098039, 1,
-0.01058955, 0.01084475, -0.1044864, 0, 1, 0.9176471, 1,
-0.005809673, -0.5548955, -2.442705, 0, 1, 0.9215686, 1,
-0.004702705, 0.9853219, -0.1763103, 0, 1, 0.9294118, 1,
-0.004337401, 0.9622133, 1.551208, 0, 1, 0.9333333, 1,
-0.002025034, 1.205192, -0.3828395, 0, 1, 0.9411765, 1,
0.001293402, 0.2175023, -0.5591782, 0, 1, 0.945098, 1,
0.004434549, -0.7572542, 4.979334, 0, 1, 0.9529412, 1,
0.004714102, -0.0631312, 3.584166, 0, 1, 0.9568627, 1,
0.00681698, -0.408861, 2.35499, 0, 1, 0.9647059, 1,
0.01056212, -0.5474702, 3.361698, 0, 1, 0.9686275, 1,
0.01065609, -0.5881085, 1.345358, 0, 1, 0.9764706, 1,
0.01444492, 0.3000371, 1.158888, 0, 1, 0.9803922, 1,
0.01777666, 0.6383669, 0.6410559, 0, 1, 0.9882353, 1,
0.02086448, 0.7857772, -0.5515645, 0, 1, 0.9921569, 1,
0.02228091, -0.2497951, 3.064753, 0, 1, 1, 1,
0.02410195, 0.5131467, -0.1709901, 0, 0.9921569, 1, 1,
0.03096731, 0.5959657, -0.3612863, 0, 0.9882353, 1, 1,
0.03099164, -1.738404, 2.057555, 0, 0.9803922, 1, 1,
0.03115268, 0.6436613, -0.5786595, 0, 0.9764706, 1, 1,
0.03119748, -1.501727, 2.032727, 0, 0.9686275, 1, 1,
0.03354873, 0.7089195, 0.06990413, 0, 0.9647059, 1, 1,
0.03484469, 0.05602493, 0.519004, 0, 0.9568627, 1, 1,
0.03838964, 1.645597, -0.2310427, 0, 0.9529412, 1, 1,
0.04684365, -1.375528, 3.311139, 0, 0.945098, 1, 1,
0.04717003, -0.1226624, 3.274198, 0, 0.9411765, 1, 1,
0.04722184, 1.199964, -1.159564, 0, 0.9333333, 1, 1,
0.04864792, 0.712472, -0.4700756, 0, 0.9294118, 1, 1,
0.04955712, 0.2626885, -0.3470886, 0, 0.9215686, 1, 1,
0.05010806, 0.05670455, 0.166144, 0, 0.9176471, 1, 1,
0.05067915, -0.7360479, 3.524991, 0, 0.9098039, 1, 1,
0.05468158, -1.094585, 3.056414, 0, 0.9058824, 1, 1,
0.05518329, 0.6244917, 0.9189634, 0, 0.8980392, 1, 1,
0.05794267, -1.04927, 3.2629, 0, 0.8901961, 1, 1,
0.05828852, -0.6036904, 3.911966, 0, 0.8862745, 1, 1,
0.06047754, -0.01386862, 1.29409, 0, 0.8784314, 1, 1,
0.06095633, -0.2965168, 2.8395, 0, 0.8745098, 1, 1,
0.06236288, 0.3258628, 0.5062076, 0, 0.8666667, 1, 1,
0.06589729, -0.5168623, 3.190213, 0, 0.8627451, 1, 1,
0.06774335, -0.5894222, 2.050059, 0, 0.854902, 1, 1,
0.06936606, 0.2427309, 0.09386218, 0, 0.8509804, 1, 1,
0.07317901, -0.5887966, 3.08569, 0, 0.8431373, 1, 1,
0.07412744, 1.72408, 0.07790417, 0, 0.8392157, 1, 1,
0.07520404, 0.6566949, -1.861294, 0, 0.8313726, 1, 1,
0.07716388, -1.913352, 3.420346, 0, 0.827451, 1, 1,
0.0775842, 0.179323, -0.7647626, 0, 0.8196079, 1, 1,
0.08314176, 0.6965542, 0.4424531, 0, 0.8156863, 1, 1,
0.0846764, -0.7216542, 2.439005, 0, 0.8078431, 1, 1,
0.08597754, 0.4743813, -0.3071199, 0, 0.8039216, 1, 1,
0.08813798, 0.185291, -0.557056, 0, 0.7960784, 1, 1,
0.08973232, -1.133688, 3.167549, 0, 0.7882353, 1, 1,
0.09082158, 1.671942, -0.9911937, 0, 0.7843137, 1, 1,
0.09234519, 0.004754105, 5.361023, 0, 0.7764706, 1, 1,
0.09502503, 0.685013, -0.5059152, 0, 0.772549, 1, 1,
0.09520774, 0.1600151, -0.1157902, 0, 0.7647059, 1, 1,
0.09556802, -1.874264, 3.38164, 0, 0.7607843, 1, 1,
0.09867704, -1.846864, 3.970262, 0, 0.7529412, 1, 1,
0.1003548, 0.6242275, 0.9707323, 0, 0.7490196, 1, 1,
0.1008636, -0.355669, 3.33488, 0, 0.7411765, 1, 1,
0.1027403, 2.054132, 0.4831829, 0, 0.7372549, 1, 1,
0.1033525, -1.531228, 4.920465, 0, 0.7294118, 1, 1,
0.1100015, -0.5002351, 2.944161, 0, 0.7254902, 1, 1,
0.1104912, 1.701746, 1.505444, 0, 0.7176471, 1, 1,
0.1122675, -1.573913, 4.36281, 0, 0.7137255, 1, 1,
0.112339, -0.764288, 3.860361, 0, 0.7058824, 1, 1,
0.1197771, -0.8328986, 3.809329, 0, 0.6980392, 1, 1,
0.1239667, -2.714545, 4.578925, 0, 0.6941177, 1, 1,
0.1256248, -0.6296234, 2.456453, 0, 0.6862745, 1, 1,
0.1262647, -0.2967465, 2.641692, 0, 0.682353, 1, 1,
0.1263785, -0.4231279, 1.560671, 0, 0.6745098, 1, 1,
0.1266554, -0.6661267, 4.081369, 0, 0.6705883, 1, 1,
0.1278199, 0.1462417, -0.5582179, 0, 0.6627451, 1, 1,
0.1279831, 0.2962016, 1.286377, 0, 0.6588235, 1, 1,
0.1293301, -1.790666, 4.386107, 0, 0.6509804, 1, 1,
0.1311259, 1.190859, -0.6078257, 0, 0.6470588, 1, 1,
0.1432962, -0.9959133, 4.478004, 0, 0.6392157, 1, 1,
0.1504489, -1.143951, 2.589609, 0, 0.6352941, 1, 1,
0.1508251, 0.1184121, 0.797223, 0, 0.627451, 1, 1,
0.1510867, -1.608395, 2.294703, 0, 0.6235294, 1, 1,
0.1514432, 1.970975, -1.173928, 0, 0.6156863, 1, 1,
0.1580368, -1.945264, 2.294119, 0, 0.6117647, 1, 1,
0.1604818, 1.642473, 1.082679, 0, 0.6039216, 1, 1,
0.16056, -0.5385249, 3.910436, 0, 0.5960785, 1, 1,
0.1632907, 0.01033176, 1.455428, 0, 0.5921569, 1, 1,
0.1660405, 1.141863, 2.059936, 0, 0.5843138, 1, 1,
0.1732737, -0.8590415, 3.818639, 0, 0.5803922, 1, 1,
0.1747113, 1.135067, 0.216104, 0, 0.572549, 1, 1,
0.1751624, -0.06289762, 2.617234, 0, 0.5686275, 1, 1,
0.1773255, -0.6026921, 2.65394, 0, 0.5607843, 1, 1,
0.1792287, 0.9868453, 1.110398, 0, 0.5568628, 1, 1,
0.1897399, 0.4412146, -0.5065265, 0, 0.5490196, 1, 1,
0.1907393, -0.9182504, 3.053766, 0, 0.5450981, 1, 1,
0.1949805, -0.1588019, 1.844153, 0, 0.5372549, 1, 1,
0.195264, 0.3448067, 1.975883, 0, 0.5333334, 1, 1,
0.197194, -0.4270794, 4.368171, 0, 0.5254902, 1, 1,
0.1989367, 0.4831451, 0.04463159, 0, 0.5215687, 1, 1,
0.1992387, -0.7929072, 1.867541, 0, 0.5137255, 1, 1,
0.2036956, 1.21127, 0.2079737, 0, 0.509804, 1, 1,
0.20709, 0.1841704, -0.09405766, 0, 0.5019608, 1, 1,
0.2103769, 0.3355184, -0.2573238, 0, 0.4941176, 1, 1,
0.2197896, 0.1658991, 0.296416, 0, 0.4901961, 1, 1,
0.2207379, -1.532902, 1.928166, 0, 0.4823529, 1, 1,
0.2268614, 1.7571, 0.1466792, 0, 0.4784314, 1, 1,
0.232511, 0.4852079, 0.9150293, 0, 0.4705882, 1, 1,
0.2350243, -1.372336, 2.087059, 0, 0.4666667, 1, 1,
0.2352619, -0.216813, 1.694712, 0, 0.4588235, 1, 1,
0.2365165, -0.3469122, 1.868725, 0, 0.454902, 1, 1,
0.2366092, -0.334431, 1.479482, 0, 0.4470588, 1, 1,
0.2371367, -0.42873, 1.853377, 0, 0.4431373, 1, 1,
0.2425192, 0.4161164, 2.060405, 0, 0.4352941, 1, 1,
0.245569, 0.03888088, -0.748358, 0, 0.4313726, 1, 1,
0.2500704, -0.3356532, 2.864123, 0, 0.4235294, 1, 1,
0.2566864, 1.072488, 0.5275934, 0, 0.4196078, 1, 1,
0.2567991, -0.05729337, 1.935422, 0, 0.4117647, 1, 1,
0.2581854, 0.5411109, 2.073993, 0, 0.4078431, 1, 1,
0.2633116, 0.7280163, 1.582294, 0, 0.4, 1, 1,
0.2640786, 0.5144839, -1.170977, 0, 0.3921569, 1, 1,
0.2675428, -0.7888299, 3.017694, 0, 0.3882353, 1, 1,
0.2703474, -2.413229, 2.850154, 0, 0.3803922, 1, 1,
0.2706174, 0.7032838, 1.672837, 0, 0.3764706, 1, 1,
0.2728499, -0.389497, 2.72402, 0, 0.3686275, 1, 1,
0.2738055, -0.7831859, 3.420261, 0, 0.3647059, 1, 1,
0.2741589, -0.245844, 2.190569, 0, 0.3568628, 1, 1,
0.2766602, 0.6196669, 0.953275, 0, 0.3529412, 1, 1,
0.27813, -1.545599, 2.970281, 0, 0.345098, 1, 1,
0.2806477, -0.9861339, 1.835354, 0, 0.3411765, 1, 1,
0.2830324, 0.4505263, 0.7791325, 0, 0.3333333, 1, 1,
0.2831922, -0.5175696, 1.515109, 0, 0.3294118, 1, 1,
0.287958, -0.7673156, 2.225955, 0, 0.3215686, 1, 1,
0.296299, 0.1341783, 2.540646, 0, 0.3176471, 1, 1,
0.3004037, -0.8187212, 1.585454, 0, 0.3098039, 1, 1,
0.3026763, -1.302778, 2.602583, 0, 0.3058824, 1, 1,
0.3121011, 0.8300071, -0.3032918, 0, 0.2980392, 1, 1,
0.3191851, -0.6589549, 2.95627, 0, 0.2901961, 1, 1,
0.3197706, 0.6847872, -0.1076244, 0, 0.2862745, 1, 1,
0.3239779, -0.7567248, 1.959522, 0, 0.2784314, 1, 1,
0.3271526, -0.9804661, 3.009284, 0, 0.2745098, 1, 1,
0.3272214, -0.5109327, 2.309797, 0, 0.2666667, 1, 1,
0.3287706, 0.2841415, 0.8606867, 0, 0.2627451, 1, 1,
0.329908, -0.7451557, 2.43537, 0, 0.254902, 1, 1,
0.3317385, -0.1798166, 1.22864, 0, 0.2509804, 1, 1,
0.3367804, -1.847786, 3.285305, 0, 0.2431373, 1, 1,
0.3402646, -1.669913, 1.504447, 0, 0.2392157, 1, 1,
0.3485647, -1.146445, 1.744294, 0, 0.2313726, 1, 1,
0.350533, -1.748691, 2.988157, 0, 0.227451, 1, 1,
0.3580066, -1.262743, 4.586614, 0, 0.2196078, 1, 1,
0.3597161, 1.273685, 0.6749223, 0, 0.2156863, 1, 1,
0.3598326, -1.375657, 2.778939, 0, 0.2078431, 1, 1,
0.3711293, 0.5655093, 0.9428832, 0, 0.2039216, 1, 1,
0.3734198, 1.138568, 1.968741, 0, 0.1960784, 1, 1,
0.3806714, 0.3707423, -1.802594, 0, 0.1882353, 1, 1,
0.3846132, -1.323134, 2.999136, 0, 0.1843137, 1, 1,
0.388882, -0.4953105, 2.34913, 0, 0.1764706, 1, 1,
0.391271, 0.02510944, 1.77575, 0, 0.172549, 1, 1,
0.3914514, -0.3071249, 1.603445, 0, 0.1647059, 1, 1,
0.3945578, 0.8551075, 0.1745667, 0, 0.1607843, 1, 1,
0.3947051, -0.5991299, 1.711583, 0, 0.1529412, 1, 1,
0.3974232, -0.4856599, 1.124343, 0, 0.1490196, 1, 1,
0.4039706, 1.598181, 0.06270909, 0, 0.1411765, 1, 1,
0.4049222, 0.6260969, 2.012481, 0, 0.1372549, 1, 1,
0.4055229, -0.1434899, 0.3026233, 0, 0.1294118, 1, 1,
0.4085478, 1.992849, -1.460257, 0, 0.1254902, 1, 1,
0.4089032, -1.132289, 2.376898, 0, 0.1176471, 1, 1,
0.4099055, -1.397776, 3.224159, 0, 0.1137255, 1, 1,
0.4110743, -0.5627455, 2.327688, 0, 0.1058824, 1, 1,
0.4115275, -0.8064193, 3.039971, 0, 0.09803922, 1, 1,
0.4124716, -0.361172, 1.986445, 0, 0.09411765, 1, 1,
0.4155219, 1.323574, -1.360573, 0, 0.08627451, 1, 1,
0.41662, -2.383076, 1.80817, 0, 0.08235294, 1, 1,
0.4179991, 0.8551089, 2.18923, 0, 0.07450981, 1, 1,
0.4201708, -0.6978509, 0.9284812, 0, 0.07058824, 1, 1,
0.421009, 1.372954, -1.858506, 0, 0.0627451, 1, 1,
0.422985, -0.7741529, 3.164972, 0, 0.05882353, 1, 1,
0.4247414, 1.121143, -1.826164, 0, 0.05098039, 1, 1,
0.4270824, -1.89791, 1.372229, 0, 0.04705882, 1, 1,
0.4295478, 1.638586, 1.466395, 0, 0.03921569, 1, 1,
0.4380729, 0.4035662, -0.3960077, 0, 0.03529412, 1, 1,
0.4498742, 0.3930102, 0.1044671, 0, 0.02745098, 1, 1,
0.4526267, 0.6740135, 1.050151, 0, 0.02352941, 1, 1,
0.4593195, 0.549687, -0.2166353, 0, 0.01568628, 1, 1,
0.4645011, -0.11369, 1.700453, 0, 0.01176471, 1, 1,
0.4666921, -0.6806381, 0.548225, 0, 0.003921569, 1, 1,
0.4679967, 0.2903338, -0.4153909, 0.003921569, 0, 1, 1,
0.468419, 0.8957642, -0.6575628, 0.007843138, 0, 1, 1,
0.4686296, -1.400484, 1.120067, 0.01568628, 0, 1, 1,
0.4687039, 0.2823119, 1.040116, 0.01960784, 0, 1, 1,
0.4692355, -1.364519, 3.267398, 0.02745098, 0, 1, 1,
0.4731889, 0.986178, -0.7999519, 0.03137255, 0, 1, 1,
0.4778835, -0.6445563, 2.453964, 0.03921569, 0, 1, 1,
0.4799444, 0.2695164, 1.07659, 0.04313726, 0, 1, 1,
0.4826335, -1.259358, 2.511393, 0.05098039, 0, 1, 1,
0.4900172, -0.2817534, 1.810397, 0.05490196, 0, 1, 1,
0.4942421, -0.08096087, 0.6561482, 0.0627451, 0, 1, 1,
0.4943154, 0.9073091, 0.9435069, 0.06666667, 0, 1, 1,
0.4971566, -1.271262, 1.609211, 0.07450981, 0, 1, 1,
0.4993995, -0.6055308, 3.921533, 0.07843138, 0, 1, 1,
0.5095234, 0.5942064, 1.156099, 0.08627451, 0, 1, 1,
0.5108235, -0.8477262, 3.865442, 0.09019608, 0, 1, 1,
0.5117329, -1.155372, 2.629733, 0.09803922, 0, 1, 1,
0.5117601, 0.1455778, 2.478315, 0.1058824, 0, 1, 1,
0.5124825, -1.856874, 4.690643, 0.1098039, 0, 1, 1,
0.5166133, -0.9819143, 3.70033, 0.1176471, 0, 1, 1,
0.5186724, -0.5139668, 2.820899, 0.1215686, 0, 1, 1,
0.5200338, -0.8105116, 1.986107, 0.1294118, 0, 1, 1,
0.5222402, 1.69, -1.147657, 0.1333333, 0, 1, 1,
0.526137, -0.6167676, 2.038736, 0.1411765, 0, 1, 1,
0.5275922, -2.184452, 3.101656, 0.145098, 0, 1, 1,
0.5286748, -2.545462, 4.178707, 0.1529412, 0, 1, 1,
0.5291926, 0.3839005, 0.7668177, 0.1568628, 0, 1, 1,
0.5308437, -0.4408322, 2.486476, 0.1647059, 0, 1, 1,
0.5344055, -0.5764779, 1.365964, 0.1686275, 0, 1, 1,
0.5414852, 1.737454, 1.883552, 0.1764706, 0, 1, 1,
0.5434482, -1.327118, 2.955276, 0.1803922, 0, 1, 1,
0.5459411, 0.4404008, -0.156927, 0.1882353, 0, 1, 1,
0.5466331, 0.2302822, -0.6282379, 0.1921569, 0, 1, 1,
0.5497037, -1.125902, 4.739176, 0.2, 0, 1, 1,
0.5589052, -0.007877914, 0.1094519, 0.2078431, 0, 1, 1,
0.5639135, -1.383204, 2.304434, 0.2117647, 0, 1, 1,
0.5646552, -0.8688795, 3.195006, 0.2196078, 0, 1, 1,
0.5674976, -0.3392693, 2.265781, 0.2235294, 0, 1, 1,
0.5712769, -2.21872, 1.528158, 0.2313726, 0, 1, 1,
0.573943, 1.472899, -0.7041254, 0.2352941, 0, 1, 1,
0.5818635, 0.1149829, 3.59515, 0.2431373, 0, 1, 1,
0.5862113, -0.8628228, 1.355399, 0.2470588, 0, 1, 1,
0.5976207, -1.147926, 2.525713, 0.254902, 0, 1, 1,
0.6014038, -0.3809627, 2.802134, 0.2588235, 0, 1, 1,
0.6021851, -0.587115, 3.064824, 0.2666667, 0, 1, 1,
0.6064131, 0.07233299, 1.301685, 0.2705882, 0, 1, 1,
0.6066772, -0.8256336, 1.197764, 0.2784314, 0, 1, 1,
0.6133912, -0.4331932, 2.429801, 0.282353, 0, 1, 1,
0.6143535, 1.12849, 1.234391, 0.2901961, 0, 1, 1,
0.6153726, 0.8002366, 1.017848, 0.2941177, 0, 1, 1,
0.6170507, 0.4570792, 1.035811, 0.3019608, 0, 1, 1,
0.6240402, -0.6185994, 1.990512, 0.3098039, 0, 1, 1,
0.6248283, 0.2914177, 0.9195189, 0.3137255, 0, 1, 1,
0.6255772, -0.5359055, 3.711321, 0.3215686, 0, 1, 1,
0.6264671, -0.2589372, 1.377989, 0.3254902, 0, 1, 1,
0.6291267, -0.5625627, 2.719337, 0.3333333, 0, 1, 1,
0.6302577, -0.4054722, 2.609006, 0.3372549, 0, 1, 1,
0.6303366, 1.20875, -0.7133769, 0.345098, 0, 1, 1,
0.6314787, -0.5810879, 2.947591, 0.3490196, 0, 1, 1,
0.6340364, -0.2857427, 4.523405, 0.3568628, 0, 1, 1,
0.637078, -1.479722, 2.899997, 0.3607843, 0, 1, 1,
0.6402047, -1.863922, 3.71187, 0.3686275, 0, 1, 1,
0.6428891, -1.141979, 3.673531, 0.372549, 0, 1, 1,
0.6433253, -0.4003867, 0.9748945, 0.3803922, 0, 1, 1,
0.645768, -0.3204268, 2.65335, 0.3843137, 0, 1, 1,
0.6505948, -0.5895419, 1.669764, 0.3921569, 0, 1, 1,
0.6517623, 1.028333, 0.1489156, 0.3960784, 0, 1, 1,
0.6519392, -1.136973, 3.423333, 0.4039216, 0, 1, 1,
0.6536992, 0.1477904, -0.3974728, 0.4117647, 0, 1, 1,
0.6623467, 0.3831758, 1.00694, 0.4156863, 0, 1, 1,
0.6672022, -0.120556, 1.335103, 0.4235294, 0, 1, 1,
0.6680241, 0.1928501, 1.935668, 0.427451, 0, 1, 1,
0.6712756, -0.9975807, 3.323404, 0.4352941, 0, 1, 1,
0.6762912, -0.1153612, -0.03412172, 0.4392157, 0, 1, 1,
0.6770112, -1.672935, 1.499119, 0.4470588, 0, 1, 1,
0.6774682, 0.1436794, 1.22114, 0.4509804, 0, 1, 1,
0.6798884, -0.3440512, 0.582524, 0.4588235, 0, 1, 1,
0.6815217, 0.4583372, -0.08148972, 0.4627451, 0, 1, 1,
0.6822187, -0.1543514, 1.762924, 0.4705882, 0, 1, 1,
0.6825919, 0.09092221, 1.550401, 0.4745098, 0, 1, 1,
0.6828212, 1.289606, 0.7948373, 0.4823529, 0, 1, 1,
0.6965834, 0.6848404, -0.4942754, 0.4862745, 0, 1, 1,
0.6970026, -0.9885259, 1.930691, 0.4941176, 0, 1, 1,
0.7007438, -0.5717247, 0.2254285, 0.5019608, 0, 1, 1,
0.7048948, 0.00437043, 1.588266, 0.5058824, 0, 1, 1,
0.7106575, 0.5743726, 1.446648, 0.5137255, 0, 1, 1,
0.7203149, -0.3242447, 1.086358, 0.5176471, 0, 1, 1,
0.7206753, -0.1983713, 1.286102, 0.5254902, 0, 1, 1,
0.7213684, -1.431964, 3.747936, 0.5294118, 0, 1, 1,
0.7256762, 1.189878, 2.778689, 0.5372549, 0, 1, 1,
0.7307094, 0.6730853, 1.423544, 0.5411765, 0, 1, 1,
0.7334104, 1.143201, 0.8557188, 0.5490196, 0, 1, 1,
0.7348499, -0.6593475, 1.236172, 0.5529412, 0, 1, 1,
0.7372099, 0.9201808, -0.676329, 0.5607843, 0, 1, 1,
0.7402108, -0.9802489, 0.2213096, 0.5647059, 0, 1, 1,
0.7433056, -0.9822056, 3.942587, 0.572549, 0, 1, 1,
0.7473715, 0.5006855, -0.3179201, 0.5764706, 0, 1, 1,
0.7484936, -0.8587257, 0.6483266, 0.5843138, 0, 1, 1,
0.7538768, 0.05063712, 2.21029, 0.5882353, 0, 1, 1,
0.7561482, 0.1815377, 0.482019, 0.5960785, 0, 1, 1,
0.7583182, 0.4132385, 0.4886502, 0.6039216, 0, 1, 1,
0.7595205, -0.8808633, 1.602009, 0.6078432, 0, 1, 1,
0.7616885, -0.5581889, 2.943833, 0.6156863, 0, 1, 1,
0.7657129, -0.7716525, 2.811404, 0.6196079, 0, 1, 1,
0.7663394, 0.8690081, 0.08270547, 0.627451, 0, 1, 1,
0.7664459, 0.009368729, 2.316957, 0.6313726, 0, 1, 1,
0.7687985, 1.639663, 0.7157831, 0.6392157, 0, 1, 1,
0.7724016, 1.233233, 1.023983, 0.6431373, 0, 1, 1,
0.7741922, 0.5362607, 0.9540957, 0.6509804, 0, 1, 1,
0.7768648, 0.1876417, 0.5722408, 0.654902, 0, 1, 1,
0.7774105, -1.76836, 2.569429, 0.6627451, 0, 1, 1,
0.7842953, -1.731187, 3.444063, 0.6666667, 0, 1, 1,
0.7845286, -0.413933, 2.728611, 0.6745098, 0, 1, 1,
0.7855963, -1.12557, 3.939914, 0.6784314, 0, 1, 1,
0.7867571, 0.2467285, 0.5360949, 0.6862745, 0, 1, 1,
0.7907367, 1.352131, -0.5666726, 0.6901961, 0, 1, 1,
0.7932414, -0.04161656, 1.310267, 0.6980392, 0, 1, 1,
0.7935895, -0.2734711, 2.922852, 0.7058824, 0, 1, 1,
0.7964143, 0.7612863, 0.6963324, 0.7098039, 0, 1, 1,
0.800528, 1.212296, -0.7550876, 0.7176471, 0, 1, 1,
0.804171, 3.777225, -0.2593067, 0.7215686, 0, 1, 1,
0.8045007, 0.3409044, 1.410036, 0.7294118, 0, 1, 1,
0.8076893, -0.2123596, 3.727615, 0.7333333, 0, 1, 1,
0.8079041, -1.351038, 2.878314, 0.7411765, 0, 1, 1,
0.810496, 0.2851628, 1.650996, 0.7450981, 0, 1, 1,
0.8111871, -0.3106406, 1.439331, 0.7529412, 0, 1, 1,
0.8119196, -1.071854, 3.351337, 0.7568628, 0, 1, 1,
0.8239011, 1.046779, 2.79313, 0.7647059, 0, 1, 1,
0.8271705, -0.6549915, 1.736308, 0.7686275, 0, 1, 1,
0.8349012, 0.5090031, 1.955681, 0.7764706, 0, 1, 1,
0.8367815, -0.3326621, 1.697024, 0.7803922, 0, 1, 1,
0.8380688, 0.5213805, 2.836959, 0.7882353, 0, 1, 1,
0.8468459, -0.9328796, 2.719928, 0.7921569, 0, 1, 1,
0.8500479, -0.3216374, 1.804714, 0.8, 0, 1, 1,
0.8559598, -0.3785618, 2.431129, 0.8078431, 0, 1, 1,
0.8560655, 0.9341871, 1.801464, 0.8117647, 0, 1, 1,
0.8586802, -0.4477299, 1.615746, 0.8196079, 0, 1, 1,
0.8635551, 0.7719384, -0.2721839, 0.8235294, 0, 1, 1,
0.8638131, -0.4118106, 3.357543, 0.8313726, 0, 1, 1,
0.871749, 0.1217775, 0.9193481, 0.8352941, 0, 1, 1,
0.8731382, 0.3931768, 2.583863, 0.8431373, 0, 1, 1,
0.8768842, 0.6785443, 1.998824, 0.8470588, 0, 1, 1,
0.8815582, -0.8270797, 3.745047, 0.854902, 0, 1, 1,
0.8823348, -0.5252536, 1.977691, 0.8588235, 0, 1, 1,
0.8825016, 0.6467876, -0.5814557, 0.8666667, 0, 1, 1,
0.8842684, -0.6796808, 2.772011, 0.8705882, 0, 1, 1,
0.8843089, 0.9498407, -0.1963399, 0.8784314, 0, 1, 1,
0.8910257, 1.774391, 1.564227, 0.8823529, 0, 1, 1,
0.8956465, -1.084269, 3.698897, 0.8901961, 0, 1, 1,
0.8977942, 0.5240559, 1.07328, 0.8941177, 0, 1, 1,
0.8982769, -1.260042, 3.723545, 0.9019608, 0, 1, 1,
0.9010466, 0.04814901, 0.4436595, 0.9098039, 0, 1, 1,
0.9034258, 0.3061906, 0.07565492, 0.9137255, 0, 1, 1,
0.9052637, 1.068545, 1.284828, 0.9215686, 0, 1, 1,
0.9070379, -1.039402, 2.91304, 0.9254902, 0, 1, 1,
0.9094421, -0.4179475, 2.862394, 0.9333333, 0, 1, 1,
0.9107271, 0.4121237, 0.2627096, 0.9372549, 0, 1, 1,
0.9113066, 0.201415, 0.7532436, 0.945098, 0, 1, 1,
0.9130716, 1.655715, 0.220892, 0.9490196, 0, 1, 1,
0.9166077, -1.518612, 3.781231, 0.9568627, 0, 1, 1,
0.9166858, -2.146659, 1.933468, 0.9607843, 0, 1, 1,
0.9251293, -0.08812632, 1.715493, 0.9686275, 0, 1, 1,
0.9263169, 1.174858, 2.55211, 0.972549, 0, 1, 1,
0.9308947, 0.5832792, 3.186419, 0.9803922, 0, 1, 1,
0.9383054, 1.496057, 1.344687, 0.9843137, 0, 1, 1,
0.9461131, -1.537804, 3.784648, 0.9921569, 0, 1, 1,
0.9534267, 0.2200915, -0.3224401, 0.9960784, 0, 1, 1,
0.9621779, -0.4511279, 4.336645, 1, 0, 0.9960784, 1,
0.9700987, -0.3336045, 2.569351, 1, 0, 0.9882353, 1,
0.9703018, 0.2257583, 2.087828, 1, 0, 0.9843137, 1,
0.9772087, 0.7297732, 1.692015, 1, 0, 0.9764706, 1,
0.9800951, 0.1221186, -0.6267393, 1, 0, 0.972549, 1,
0.9873702, 1.043037, -0.9455647, 1, 0, 0.9647059, 1,
0.9875371, -0.7465704, 2.857668, 1, 0, 0.9607843, 1,
0.9938626, -1.668603, 2.104307, 1, 0, 0.9529412, 1,
1.003094, -0.4370367, 0.8470441, 1, 0, 0.9490196, 1,
1.012564, -0.4815691, 1.863205, 1, 0, 0.9411765, 1,
1.019859, -0.3445504, 2.950965, 1, 0, 0.9372549, 1,
1.023717, 0.1586935, 2.348395, 1, 0, 0.9294118, 1,
1.027635, 1.436852, 1.123988, 1, 0, 0.9254902, 1,
1.027983, -0.889751, 1.806494, 1, 0, 0.9176471, 1,
1.030572, 0.2594052, 2.058674, 1, 0, 0.9137255, 1,
1.031053, -1.670458, 1.349752, 1, 0, 0.9058824, 1,
1.035879, 2.039911, -0.5467345, 1, 0, 0.9019608, 1,
1.043639, -0.03137337, 2.342571, 1, 0, 0.8941177, 1,
1.061875, 1.045774, 2.965054, 1, 0, 0.8862745, 1,
1.0681, -0.5042555, 1.581819, 1, 0, 0.8823529, 1,
1.0703, -0.7426495, 1.867711, 1, 0, 0.8745098, 1,
1.074353, -0.473942, 3.592404, 1, 0, 0.8705882, 1,
1.076056, -0.1037142, 2.206364, 1, 0, 0.8627451, 1,
1.081586, -0.381395, 2.840034, 1, 0, 0.8588235, 1,
1.083695, -1.166855, 2.200768, 1, 0, 0.8509804, 1,
1.10242, 1.090387, 0.7153082, 1, 0, 0.8470588, 1,
1.10313, 1.182058, 0.8100728, 1, 0, 0.8392157, 1,
1.105563, 0.1404099, 0.1993349, 1, 0, 0.8352941, 1,
1.11458, -1.200933, 1.078081, 1, 0, 0.827451, 1,
1.127184, 0.3761145, 1.649672, 1, 0, 0.8235294, 1,
1.132163, 0.588109, 1.138176, 1, 0, 0.8156863, 1,
1.132612, 0.4612131, 3.01308, 1, 0, 0.8117647, 1,
1.137481, 0.5392156, 0.5938465, 1, 0, 0.8039216, 1,
1.140623, -0.5674473, 0.6980901, 1, 0, 0.7960784, 1,
1.146861, -0.7180241, 2.525894, 1, 0, 0.7921569, 1,
1.149758, -0.9539905, 1.946175, 1, 0, 0.7843137, 1,
1.15445, -0.2784083, 2.194169, 1, 0, 0.7803922, 1,
1.163303, -1.063403, 2.920074, 1, 0, 0.772549, 1,
1.164924, -1.375733, 1.289669, 1, 0, 0.7686275, 1,
1.180992, 0.9188265, 1.083404, 1, 0, 0.7607843, 1,
1.182153, -1.332462, 2.948115, 1, 0, 0.7568628, 1,
1.183323, -0.2397152, 1.782344, 1, 0, 0.7490196, 1,
1.189034, 0.258482, 0.4445014, 1, 0, 0.7450981, 1,
1.190274, -1.200884, 3.093834, 1, 0, 0.7372549, 1,
1.197211, -0.5991923, 2.541358, 1, 0, 0.7333333, 1,
1.201825, 0.9998447, -0.2158653, 1, 0, 0.7254902, 1,
1.202975, -1.768588, 1.879628, 1, 0, 0.7215686, 1,
1.204944, -1.685491, 1.8763, 1, 0, 0.7137255, 1,
1.213324, -0.5079771, 0.3911945, 1, 0, 0.7098039, 1,
1.219601, 0.400903, 0.3631411, 1, 0, 0.7019608, 1,
1.225958, -0.7448564, 2.571182, 1, 0, 0.6941177, 1,
1.229684, 1.013403, 0.3576679, 1, 0, 0.6901961, 1,
1.231333, -0.4877838, 1.65852, 1, 0, 0.682353, 1,
1.23526, 0.5200535, 1.711388, 1, 0, 0.6784314, 1,
1.242964, 1.965008, 1.158811, 1, 0, 0.6705883, 1,
1.243509, -0.2542067, 1.879734, 1, 0, 0.6666667, 1,
1.246976, 0.06417672, 1.102105, 1, 0, 0.6588235, 1,
1.252161, 0.8809776, 1.412392, 1, 0, 0.654902, 1,
1.260506, -0.008417184, 1.113459, 1, 0, 0.6470588, 1,
1.262769, -0.04509494, 0.9403231, 1, 0, 0.6431373, 1,
1.266334, 1.638479, 1.322771, 1, 0, 0.6352941, 1,
1.278669, 0.08614536, 1.052755, 1, 0, 0.6313726, 1,
1.285709, 0.196764, 1.701106, 1, 0, 0.6235294, 1,
1.286775, 0.8247551, 0.2744039, 1, 0, 0.6196079, 1,
1.291138, -0.4261198, 1.284282, 1, 0, 0.6117647, 1,
1.294833, -0.20298, 0.2069055, 1, 0, 0.6078432, 1,
1.299759, -0.1932658, 1.01637, 1, 0, 0.6, 1,
1.308909, 1.01111, -0.9892932, 1, 0, 0.5921569, 1,
1.311984, -0.3614904, 2.402365, 1, 0, 0.5882353, 1,
1.317589, -0.1664741, 1.706365, 1, 0, 0.5803922, 1,
1.33289, -1.268709, 1.725239, 1, 0, 0.5764706, 1,
1.338532, -1.712416, 4.447473, 1, 0, 0.5686275, 1,
1.346172, 1.01815, -1.309039, 1, 0, 0.5647059, 1,
1.348217, 1.593333, 1.656699, 1, 0, 0.5568628, 1,
1.360026, -0.4056736, 1.547292, 1, 0, 0.5529412, 1,
1.361197, -0.3612513, 1.902631, 1, 0, 0.5450981, 1,
1.364205, 0.9153408, 2.608222, 1, 0, 0.5411765, 1,
1.364938, -0.4996404, 2.234856, 1, 0, 0.5333334, 1,
1.368966, -0.3964369, 0.8711119, 1, 0, 0.5294118, 1,
1.372015, -0.9045503, 3.590499, 1, 0, 0.5215687, 1,
1.389148, -0.3965369, 1.430709, 1, 0, 0.5176471, 1,
1.390167, -1.340316, 2.262027, 1, 0, 0.509804, 1,
1.390398, -0.8257191, 1.252344, 1, 0, 0.5058824, 1,
1.398225, -0.5839494, 2.702199, 1, 0, 0.4980392, 1,
1.4014, -1.635653, 3.844729, 1, 0, 0.4901961, 1,
1.409952, -0.4076551, 1.81334, 1, 0, 0.4862745, 1,
1.419373, 0.9590636, 2.164032, 1, 0, 0.4784314, 1,
1.420822, 2.043961, -0.3638961, 1, 0, 0.4745098, 1,
1.420848, 1.126887, 1.312981, 1, 0, 0.4666667, 1,
1.422042, 0.4318166, 1.212282, 1, 0, 0.4627451, 1,
1.434256, -0.1574097, 2.350527, 1, 0, 0.454902, 1,
1.438431, -0.7410101, 1.292854, 1, 0, 0.4509804, 1,
1.443858, 0.4319964, 1.52258, 1, 0, 0.4431373, 1,
1.444023, 0.5340533, 1.85484, 1, 0, 0.4392157, 1,
1.459357, 0.3008434, -0.8647044, 1, 0, 0.4313726, 1,
1.46076, 0.9706537, 1.632197, 1, 0, 0.427451, 1,
1.473156, 0.7875196, 0.6449064, 1, 0, 0.4196078, 1,
1.473895, -0.02975717, 2.024608, 1, 0, 0.4156863, 1,
1.474614, -0.6433212, 0.1951908, 1, 0, 0.4078431, 1,
1.485365, 0.2717386, 0.5127475, 1, 0, 0.4039216, 1,
1.493305, -0.2073343, 0.8155341, 1, 0, 0.3960784, 1,
1.505275, 0.7628471, 1.83441, 1, 0, 0.3882353, 1,
1.528244, -0.1904367, 3.565052, 1, 0, 0.3843137, 1,
1.528983, 0.6398476, -0.4572535, 1, 0, 0.3764706, 1,
1.53071, 0.09568943, 1.548166, 1, 0, 0.372549, 1,
1.530787, -0.6769981, 1.589866, 1, 0, 0.3647059, 1,
1.55274, -0.3171309, 2.748956, 1, 0, 0.3607843, 1,
1.558993, 0.04104944, 1.393561, 1, 0, 0.3529412, 1,
1.573232, 0.03085249, 2.521062, 1, 0, 0.3490196, 1,
1.598527, -0.08164133, 3.113718, 1, 0, 0.3411765, 1,
1.627697, -0.3299207, 1.857667, 1, 0, 0.3372549, 1,
1.634987, -1.302366, 1.504904, 1, 0, 0.3294118, 1,
1.639086, 0.448169, 0.3850257, 1, 0, 0.3254902, 1,
1.6438, -1.302262, 0.5637932, 1, 0, 0.3176471, 1,
1.643857, 0.7481872, 1.88828, 1, 0, 0.3137255, 1,
1.647086, -0.7494743, 1.314792, 1, 0, 0.3058824, 1,
1.648552, -1.581538, 2.38371, 1, 0, 0.2980392, 1,
1.657633, -0.3124215, 2.251524, 1, 0, 0.2941177, 1,
1.667619, 0.2811532, 2.024853, 1, 0, 0.2862745, 1,
1.670921, -0.1057525, 0.9797128, 1, 0, 0.282353, 1,
1.682503, -0.4838384, 0.920773, 1, 0, 0.2745098, 1,
1.696901, -0.4481904, 3.547471, 1, 0, 0.2705882, 1,
1.698674, -0.6998276, 2.182105, 1, 0, 0.2627451, 1,
1.69888, -0.7340081, 1.521755, 1, 0, 0.2588235, 1,
1.701308, 0.0005606719, 1.244922, 1, 0, 0.2509804, 1,
1.758531, 0.6162015, 1.944445, 1, 0, 0.2470588, 1,
1.761404, 0.8177817, 0.5348171, 1, 0, 0.2392157, 1,
1.771075, -0.568545, 1.320881, 1, 0, 0.2352941, 1,
1.780602, 0.4360765, 1.633906, 1, 0, 0.227451, 1,
1.786169, -0.1107448, 0.970291, 1, 0, 0.2235294, 1,
1.790158, 1.55256, 0.3208612, 1, 0, 0.2156863, 1,
1.790238, -0.6811836, 2.082317, 1, 0, 0.2117647, 1,
1.800155, 0.5702753, -0.2287917, 1, 0, 0.2039216, 1,
1.802222, 0.5968813, 2.824875, 1, 0, 0.1960784, 1,
1.836249, -0.618595, 1.292626, 1, 0, 0.1921569, 1,
1.844965, 0.01212209, 1.473212, 1, 0, 0.1843137, 1,
1.85149, 0.8835313, 0.9334431, 1, 0, 0.1803922, 1,
1.851975, -0.2715648, 0.88402, 1, 0, 0.172549, 1,
1.883513, 1.175313, 1.212503, 1, 0, 0.1686275, 1,
1.890023, 1.126915, 1.069697, 1, 0, 0.1607843, 1,
1.893645, 0.3466164, 1.608925, 1, 0, 0.1568628, 1,
1.923921, 0.6097602, 0.8794035, 1, 0, 0.1490196, 1,
1.9669, 0.6456203, 2.432128, 1, 0, 0.145098, 1,
1.977695, -0.1728777, 2.481783, 1, 0, 0.1372549, 1,
1.993841, -0.7097965, 2.48654, 1, 0, 0.1333333, 1,
1.995122, 1.907018, -1.040167, 1, 0, 0.1254902, 1,
2.061427, 0.9060232, 1.758003, 1, 0, 0.1215686, 1,
2.069404, 0.2047246, 1.106439, 1, 0, 0.1137255, 1,
2.073738, 1.592311, 0.8828239, 1, 0, 0.1098039, 1,
2.100466, -0.9863204, 1.842018, 1, 0, 0.1019608, 1,
2.136579, 0.1517858, 2.972326, 1, 0, 0.09411765, 1,
2.143453, 0.5545039, 2.750394, 1, 0, 0.09019608, 1,
2.187249, -0.005223052, 2.665454, 1, 0, 0.08235294, 1,
2.206593, -1.333319, 1.645162, 1, 0, 0.07843138, 1,
2.237392, 0.8304908, 0.7246654, 1, 0, 0.07058824, 1,
2.331696, -1.356359, 0.5815873, 1, 0, 0.06666667, 1,
2.3513, 0.7834038, 2.368072, 1, 0, 0.05882353, 1,
2.408907, -0.6994393, 0.02356618, 1, 0, 0.05490196, 1,
2.505057, -1.181463, 1.972013, 1, 0, 0.04705882, 1,
2.507884, 1.435817, 0.7723212, 1, 0, 0.04313726, 1,
2.543836, -0.9800091, 2.956052, 1, 0, 0.03529412, 1,
2.546486, 0.3184556, 0.3894547, 1, 0, 0.03137255, 1,
2.60905, -0.07839563, 0.3482375, 1, 0, 0.02352941, 1,
2.640879, 0.9864805, 0.5466655, 1, 0, 0.01960784, 1,
2.77014, 0.5898944, -0.906072, 1, 0, 0.01176471, 1,
2.854902, 1.416656, -0.6523844, 1, 0, 0.007843138, 1
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
-0.3010099, -4.099393, -7.384151, 0, -0.5, 0.5, 0.5,
-0.3010099, -4.099393, -7.384151, 1, -0.5, 0.5, 0.5,
-0.3010099, -4.099393, -7.384151, 1, 1.5, 0.5, 0.5,
-0.3010099, -4.099393, -7.384151, 0, 1.5, 0.5, 0.5
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
-4.526776, 0.4097095, -7.384151, 0, -0.5, 0.5, 0.5,
-4.526776, 0.4097095, -7.384151, 1, -0.5, 0.5, 0.5,
-4.526776, 0.4097095, -7.384151, 1, 1.5, 0.5, 0.5,
-4.526776, 0.4097095, -7.384151, 0, 1.5, 0.5, 0.5
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
-4.526776, -4.099393, -0.08796096, 0, -0.5, 0.5, 0.5,
-4.526776, -4.099393, -0.08796096, 1, -0.5, 0.5, 0.5,
-4.526776, -4.099393, -0.08796096, 1, 1.5, 0.5, 0.5,
-4.526776, -4.099393, -0.08796096, 0, 1.5, 0.5, 0.5
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
-3, -3.058831, -5.700415,
2, -3.058831, -5.700415,
-3, -3.058831, -5.700415,
-3, -3.232258, -5.981038,
-2, -3.058831, -5.700415,
-2, -3.232258, -5.981038,
-1, -3.058831, -5.700415,
-1, -3.232258, -5.981038,
0, -3.058831, -5.700415,
0, -3.232258, -5.981038,
1, -3.058831, -5.700415,
1, -3.232258, -5.981038,
2, -3.058831, -5.700415,
2, -3.232258, -5.981038
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
-3, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
-3, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
-3, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
-3, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5,
-2, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
-2, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
-2, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
-2, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5,
-1, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
-1, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
-1, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
-1, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5,
0, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
0, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
0, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
0, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5,
1, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
1, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
1, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
1, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5,
2, -3.579112, -6.542283, 0, -0.5, 0.5, 0.5,
2, -3.579112, -6.542283, 1, -0.5, 0.5, 0.5,
2, -3.579112, -6.542283, 1, 1.5, 0.5, 0.5,
2, -3.579112, -6.542283, 0, 1.5, 0.5, 0.5
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
-3.551599, -2, -5.700415,
-3.551599, 3, -5.700415,
-3.551599, -2, -5.700415,
-3.714128, -2, -5.981038,
-3.551599, -1, -5.700415,
-3.714128, -1, -5.981038,
-3.551599, 0, -5.700415,
-3.714128, 0, -5.981038,
-3.551599, 1, -5.700415,
-3.714128, 1, -5.981038,
-3.551599, 2, -5.700415,
-3.714128, 2, -5.981038,
-3.551599, 3, -5.700415,
-3.714128, 3, -5.981038
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
-4.039187, -2, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, -2, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, -2, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, -2, -6.542283, 0, 1.5, 0.5, 0.5,
-4.039187, -1, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, -1, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, -1, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, -1, -6.542283, 0, 1.5, 0.5, 0.5,
-4.039187, 0, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, 0, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, 0, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, 0, -6.542283, 0, 1.5, 0.5, 0.5,
-4.039187, 1, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, 1, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, 1, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, 1, -6.542283, 0, 1.5, 0.5, 0.5,
-4.039187, 2, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, 2, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, 2, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, 2, -6.542283, 0, 1.5, 0.5, 0.5,
-4.039187, 3, -6.542283, 0, -0.5, 0.5, 0.5,
-4.039187, 3, -6.542283, 1, -0.5, 0.5, 0.5,
-4.039187, 3, -6.542283, 1, 1.5, 0.5, 0.5,
-4.039187, 3, -6.542283, 0, 1.5, 0.5, 0.5
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
-3.551599, -3.058831, -4,
-3.551599, -3.058831, 4,
-3.551599, -3.058831, -4,
-3.714128, -3.232258, -4,
-3.551599, -3.058831, -2,
-3.714128, -3.232258, -2,
-3.551599, -3.058831, 0,
-3.714128, -3.232258, 0,
-3.551599, -3.058831, 2,
-3.714128, -3.232258, 2,
-3.551599, -3.058831, 4,
-3.714128, -3.232258, 4
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
-4.039187, -3.579112, -4, 0, -0.5, 0.5, 0.5,
-4.039187, -3.579112, -4, 1, -0.5, 0.5, 0.5,
-4.039187, -3.579112, -4, 1, 1.5, 0.5, 0.5,
-4.039187, -3.579112, -4, 0, 1.5, 0.5, 0.5,
-4.039187, -3.579112, -2, 0, -0.5, 0.5, 0.5,
-4.039187, -3.579112, -2, 1, -0.5, 0.5, 0.5,
-4.039187, -3.579112, -2, 1, 1.5, 0.5, 0.5,
-4.039187, -3.579112, -2, 0, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 0, 0, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 0, 1, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 0, 1, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 0, 0, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 2, 0, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 2, 1, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 2, 1, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 2, 0, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 4, 0, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 4, 1, -0.5, 0.5, 0.5,
-4.039187, -3.579112, 4, 1, 1.5, 0.5, 0.5,
-4.039187, -3.579112, 4, 0, 1.5, 0.5, 0.5
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
-3.551599, -3.058831, -5.700415,
-3.551599, 3.87825, -5.700415,
-3.551599, -3.058831, 5.524493,
-3.551599, 3.87825, 5.524493,
-3.551599, -3.058831, -5.700415,
-3.551599, -3.058831, 5.524493,
-3.551599, 3.87825, -5.700415,
-3.551599, 3.87825, 5.524493,
-3.551599, -3.058831, -5.700415,
2.949579, -3.058831, -5.700415,
-3.551599, -3.058831, 5.524493,
2.949579, -3.058831, 5.524493,
-3.551599, 3.87825, -5.700415,
2.949579, 3.87825, -5.700415,
-3.551599, 3.87825, 5.524493,
2.949579, 3.87825, 5.524493,
2.949579, -3.058831, -5.700415,
2.949579, 3.87825, -5.700415,
2.949579, -3.058831, 5.524493,
2.949579, 3.87825, 5.524493,
2.949579, -3.058831, -5.700415,
2.949579, -3.058831, 5.524493,
2.949579, 3.87825, -5.700415,
2.949579, 3.87825, 5.524493
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
var radius = 7.854906;
var distance = 34.94736;
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
mvMatrix.translate( 0.3010099, -0.4097095, 0.08796096 );
mvMatrix.scale( 1.30636, 1.224273, 0.7566101 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94736);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
methasulfocarb<-read.table("methasulfocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methasulfocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'methasulfocarb' not found
```

```r
y<-methasulfocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'methasulfocarb' not found
```

```r
z<-methasulfocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'methasulfocarb' not found
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
-3.456922, 1.339514, -1.397089, 0, 0, 1, 1, 1,
-3.106597, 0.9523187, -1.293608, 1, 0, 0, 1, 1,
-3.008821, 1.49975, -0.9593152, 1, 0, 0, 1, 1,
-2.936096, -0.8648402, -0.7541971, 1, 0, 0, 1, 1,
-2.718885, 1.294341, 0.05271064, 1, 0, 0, 1, 1,
-2.52846, 0.8076578, -0.5705697, 1, 0, 0, 1, 1,
-2.493907, 0.8535339, -2.162657, 0, 0, 0, 1, 1,
-2.490522, -0.5965214, -0.7886497, 0, 0, 0, 1, 1,
-2.477034, 0.6030577, -1.405239, 0, 0, 0, 1, 1,
-2.451995, -1.629354, -0.4031542, 0, 0, 0, 1, 1,
-2.440815, 1.191805, -0.248242, 0, 0, 0, 1, 1,
-2.374137, 0.02762011, -0.5267476, 0, 0, 0, 1, 1,
-2.343751, 0.7543276, -0.3726164, 0, 0, 0, 1, 1,
-2.338265, -0.7713534, -2.461029, 1, 1, 1, 1, 1,
-2.331497, 0.3412486, -2.443921, 1, 1, 1, 1, 1,
-2.288501, -0.1178855, -3.006213, 1, 1, 1, 1, 1,
-2.268424, 1.08592, -1.023246, 1, 1, 1, 1, 1,
-2.234614, 0.1655756, -0.6526314, 1, 1, 1, 1, 1,
-2.217129, 0.4955145, -2.328935, 1, 1, 1, 1, 1,
-2.209286, -0.9349326, -3.929352, 1, 1, 1, 1, 1,
-2.19052, -0.368738, -2.684095, 1, 1, 1, 1, 1,
-2.171113, -0.5089325, -1.579213, 1, 1, 1, 1, 1,
-2.169737, 2.326894, -0.04154904, 1, 1, 1, 1, 1,
-2.148014, -0.1623935, -2.480437, 1, 1, 1, 1, 1,
-2.087656, -0.6633967, -1.59877, 1, 1, 1, 1, 1,
-2.044041, 1.264382, 0.5247482, 1, 1, 1, 1, 1,
-2.039918, 1.783058, -1.051208, 1, 1, 1, 1, 1,
-2.033378, -0.4983709, -2.964507, 1, 1, 1, 1, 1,
-2.03096, -0.4534653, -3.30035, 0, 0, 1, 1, 1,
-2.02494, -1.458084, -2.429717, 1, 0, 0, 1, 1,
-2.004678, -0.1040811, -0.2840664, 1, 0, 0, 1, 1,
-1.996421, 0.1265877, -1.12382, 1, 0, 0, 1, 1,
-1.987665, -1.415077, -1.408877, 1, 0, 0, 1, 1,
-1.960665, 0.1462938, -2.40128, 1, 0, 0, 1, 1,
-1.950371, -0.5281214, -3.175136, 0, 0, 0, 1, 1,
-1.941236, -0.9720539, -1.851265, 0, 0, 0, 1, 1,
-1.888017, 0.1147143, -1.712552, 0, 0, 0, 1, 1,
-1.883992, 0.8261033, -1.464695, 0, 0, 0, 1, 1,
-1.865985, -0.47181, -0.7773249, 0, 0, 0, 1, 1,
-1.853382, 1.144836, -0.07948388, 0, 0, 0, 1, 1,
-1.851157, -2.562196, 0.2684354, 0, 0, 0, 1, 1,
-1.841734, 0.6222633, -2.112467, 1, 1, 1, 1, 1,
-1.840946, -0.1239886, -1.821475, 1, 1, 1, 1, 1,
-1.837626, -0.6906838, -1.922078, 1, 1, 1, 1, 1,
-1.822136, 0.351689, -1.525018, 1, 1, 1, 1, 1,
-1.819594, -0.492549, -1.696629, 1, 1, 1, 1, 1,
-1.813145, -0.28743, -0.9507554, 1, 1, 1, 1, 1,
-1.811874, -0.3438762, -3.501813, 1, 1, 1, 1, 1,
-1.808361, -0.07951771, -2.604564, 1, 1, 1, 1, 1,
-1.801582, -0.08995603, -2.441813, 1, 1, 1, 1, 1,
-1.767215, -0.3578528, -1.171659, 1, 1, 1, 1, 1,
-1.765398, -1.86703, -1.05432, 1, 1, 1, 1, 1,
-1.762122, -0.9496265, -2.082781, 1, 1, 1, 1, 1,
-1.740812, 0.5893262, 0.430521, 1, 1, 1, 1, 1,
-1.739084, 1.380267, -0.3276367, 1, 1, 1, 1, 1,
-1.731928, -1.701903, -1.526219, 1, 1, 1, 1, 1,
-1.730347, 0.0199127, -1.942904, 0, 0, 1, 1, 1,
-1.69664, -0.1219987, -0.1225752, 1, 0, 0, 1, 1,
-1.692747, -0.6841192, -0.001936468, 1, 0, 0, 1, 1,
-1.689833, -0.3074334, -0.8921172, 1, 0, 0, 1, 1,
-1.683868, 0.5678059, -2.01374, 1, 0, 0, 1, 1,
-1.670682, -1.281886, -1.789059, 1, 0, 0, 1, 1,
-1.665077, -1.474192, -3.491013, 0, 0, 0, 1, 1,
-1.658246, 1.045945, -1.096308, 0, 0, 0, 1, 1,
-1.653637, 1.849879, -1.067927, 0, 0, 0, 1, 1,
-1.646472, -0.7802854, -1.936014, 0, 0, 0, 1, 1,
-1.634727, 0.303124, -2.201518, 0, 0, 0, 1, 1,
-1.63122, 0.139252, -2.151677, 0, 0, 0, 1, 1,
-1.617771, -0.2420895, -1.732538, 0, 0, 0, 1, 1,
-1.597681, 0.9410339, -2.862174, 1, 1, 1, 1, 1,
-1.552725, -0.2280564, -1.591151, 1, 1, 1, 1, 1,
-1.537093, -1.438412, -2.526325, 1, 1, 1, 1, 1,
-1.52234, -0.3589973, -2.692065, 1, 1, 1, 1, 1,
-1.508883, 0.2471087, 0.6614395, 1, 1, 1, 1, 1,
-1.500672, -0.6741914, -1.65497, 1, 1, 1, 1, 1,
-1.49938, -2.47157, -0.7529615, 1, 1, 1, 1, 1,
-1.495952, -1.185347, -2.196035, 1, 1, 1, 1, 1,
-1.495624, 1.902536, -0.2239406, 1, 1, 1, 1, 1,
-1.474482, 0.6507131, -0.8003512, 1, 1, 1, 1, 1,
-1.460099, -1.229143, -2.771454, 1, 1, 1, 1, 1,
-1.458092, -0.9032646, -2.925838, 1, 1, 1, 1, 1,
-1.45552, 0.3963766, -1.439348, 1, 1, 1, 1, 1,
-1.454032, 2.109717, 0.4526278, 1, 1, 1, 1, 1,
-1.448768, -1.702777, -0.9020271, 1, 1, 1, 1, 1,
-1.446603, -0.7125929, -2.023707, 0, 0, 1, 1, 1,
-1.417475, -0.6538891, -0.7928826, 1, 0, 0, 1, 1,
-1.415016, 0.6269161, -0.3351369, 1, 0, 0, 1, 1,
-1.413363, -0.5756766, -2.521686, 1, 0, 0, 1, 1,
-1.402125, 0.08290748, -2.296052, 1, 0, 0, 1, 1,
-1.397109, -2.162505, -0.6916967, 1, 0, 0, 1, 1,
-1.383421, 0.2833608, -0.07558109, 0, 0, 0, 1, 1,
-1.378298, -0.03399775, -1.865792, 0, 0, 0, 1, 1,
-1.369059, 0.3913429, -1.082121, 0, 0, 0, 1, 1,
-1.365887, 1.107689, 0.832687, 0, 0, 0, 1, 1,
-1.358382, 0.8817859, -0.9213786, 0, 0, 0, 1, 1,
-1.346856, -0.632692, -2.954099, 0, 0, 0, 1, 1,
-1.344978, 0.9560382, -0.2031147, 0, 0, 0, 1, 1,
-1.344645, 1.069999, -1.714549, 1, 1, 1, 1, 1,
-1.340219, 0.5361722, -0.9651062, 1, 1, 1, 1, 1,
-1.327972, -0.2850834, -1.733452, 1, 1, 1, 1, 1,
-1.320506, 0.9611301, -0.33131, 1, 1, 1, 1, 1,
-1.318376, 0.5351468, -0.5941995, 1, 1, 1, 1, 1,
-1.314066, 0.3149145, -0.8335028, 1, 1, 1, 1, 1,
-1.30435, 0.6622171, 0.3750736, 1, 1, 1, 1, 1,
-1.302007, 0.2149625, -2.322057, 1, 1, 1, 1, 1,
-1.299221, 0.1603514, -2.722689, 1, 1, 1, 1, 1,
-1.292762, 0.3445526, -2.14622, 1, 1, 1, 1, 1,
-1.291071, -2.261462, -2.83346, 1, 1, 1, 1, 1,
-1.286143, -0.4063723, -2.614215, 1, 1, 1, 1, 1,
-1.284531, 0.4335396, -2.340716, 1, 1, 1, 1, 1,
-1.278416, 1.127881, 0.675929, 1, 1, 1, 1, 1,
-1.269995, 0.7005914, -1.186225, 1, 1, 1, 1, 1,
-1.26921, 0.8412208, -2.600439, 0, 0, 1, 1, 1,
-1.263032, -0.8283935, -3.489638, 1, 0, 0, 1, 1,
-1.261932, -0.9510632, -2.617167, 1, 0, 0, 1, 1,
-1.260098, 1.374234, -1.075515, 1, 0, 0, 1, 1,
-1.255992, -0.9753187, -0.4784395, 1, 0, 0, 1, 1,
-1.255125, -0.6401382, -3.433182, 1, 0, 0, 1, 1,
-1.251772, 0.8172844, -1.07536, 0, 0, 0, 1, 1,
-1.25097, -0.3237956, 0.3742165, 0, 0, 0, 1, 1,
-1.250676, -0.04594045, -0.7486094, 0, 0, 0, 1, 1,
-1.248521, 0.1437321, -0.7415817, 0, 0, 0, 1, 1,
-1.243795, 0.06742661, -0.03788915, 0, 0, 0, 1, 1,
-1.243057, 0.3225347, 0.03944276, 0, 0, 0, 1, 1,
-1.228548, 1.021281, -0.4845046, 0, 0, 0, 1, 1,
-1.220625, -0.7959582, -4.331, 1, 1, 1, 1, 1,
-1.20711, -0.1336031, -0.007442162, 1, 1, 1, 1, 1,
-1.202572, -0.7236846, -1.712918, 1, 1, 1, 1, 1,
-1.202009, 0.1281065, -0.2803526, 1, 1, 1, 1, 1,
-1.20013, -0.3751363, -3.403725, 1, 1, 1, 1, 1,
-1.19406, -2.162697, -3.251032, 1, 1, 1, 1, 1,
-1.190263, -0.4647588, -2.077828, 1, 1, 1, 1, 1,
-1.185965, 0.916507, 0.1239044, 1, 1, 1, 1, 1,
-1.18412, 0.1755064, -1.196957, 1, 1, 1, 1, 1,
-1.175938, 0.1540224, -2.414496, 1, 1, 1, 1, 1,
-1.175425, -1.163978, -0.9896181, 1, 1, 1, 1, 1,
-1.175062, 1.524095, -2.003001, 1, 1, 1, 1, 1,
-1.166806, 0.3468561, -1.727828, 1, 1, 1, 1, 1,
-1.165153, 2.170619, -0.8637795, 1, 1, 1, 1, 1,
-1.158313, 0.9865515, -1.000238, 1, 1, 1, 1, 1,
-1.134766, 1.351522, -0.8943002, 0, 0, 1, 1, 1,
-1.133418, -0.4592372, -2.024896, 1, 0, 0, 1, 1,
-1.133341, 1.239393, 0.5913327, 1, 0, 0, 1, 1,
-1.132537, 1.599077, -0.9392311, 1, 0, 0, 1, 1,
-1.131855, 0.633321, -2.103779, 1, 0, 0, 1, 1,
-1.129719, -0.2193009, -2.051581, 1, 0, 0, 1, 1,
-1.12888, -0.6149373, -3.630431, 0, 0, 0, 1, 1,
-1.127956, 1.633393, -1.451836, 0, 0, 0, 1, 1,
-1.123977, 0.4251329, -1.868531, 0, 0, 0, 1, 1,
-1.121866, 1.009879, -1.637026, 0, 0, 0, 1, 1,
-1.100617, -1.175877, -3.071912, 0, 0, 0, 1, 1,
-1.095008, 0.2671746, -1.437512, 0, 0, 0, 1, 1,
-1.094671, -0.01968484, -1.177651, 0, 0, 0, 1, 1,
-1.094558, 0.5324646, -0.7034696, 1, 1, 1, 1, 1,
-1.082868, -0.6918357, -1.452087, 1, 1, 1, 1, 1,
-1.082549, -0.3777302, -1.034518, 1, 1, 1, 1, 1,
-1.064636, -0.3092559, -2.354404, 1, 1, 1, 1, 1,
-1.052952, -1.081081, -2.349626, 1, 1, 1, 1, 1,
-1.04867, -1.817294, -2.821496, 1, 1, 1, 1, 1,
-1.040184, -0.8257907, -3.492179, 1, 1, 1, 1, 1,
-1.032729, -1.213169, -4.082024, 1, 1, 1, 1, 1,
-1.014528, -1.857142, -2.253874, 1, 1, 1, 1, 1,
-1.013826, -1.892092, -1.906528, 1, 1, 1, 1, 1,
-1.003725, -0.7190318, -3.112476, 1, 1, 1, 1, 1,
-1.003415, 0.2841958, -0.3169478, 1, 1, 1, 1, 1,
-0.999892, -0.7602685, -2.115577, 1, 1, 1, 1, 1,
-0.993961, -1.706746, -2.963651, 1, 1, 1, 1, 1,
-0.9911571, -0.5444422, -2.431735, 1, 1, 1, 1, 1,
-0.9847868, -0.1830738, -2.34993, 0, 0, 1, 1, 1,
-0.981038, 1.199103, 1.021242, 1, 0, 0, 1, 1,
-0.9792625, 1.73826, -0.6138412, 1, 0, 0, 1, 1,
-0.9758905, 0.3666335, -1.261554, 1, 0, 0, 1, 1,
-0.9743747, -0.2342345, -1.367242, 1, 0, 0, 1, 1,
-0.9739521, 1.031453, -0.9894174, 1, 0, 0, 1, 1,
-0.9644724, -1.2766, -1.684538, 0, 0, 0, 1, 1,
-0.9583987, -0.6705342, -2.200537, 0, 0, 0, 1, 1,
-0.952449, -0.7175813, -0.7719726, 0, 0, 0, 1, 1,
-0.9516468, -0.2963185, -1.143966, 0, 0, 0, 1, 1,
-0.9492905, -0.7298238, -2.718795, 0, 0, 0, 1, 1,
-0.9385738, 0.4859865, 0.293918, 0, 0, 0, 1, 1,
-0.9339252, -0.9753649, -4.186028, 0, 0, 0, 1, 1,
-0.9338009, -0.3338643, -1.933305, 1, 1, 1, 1, 1,
-0.9275886, 2.011426, -0.866209, 1, 1, 1, 1, 1,
-0.922716, -0.8352418, -2.362601, 1, 1, 1, 1, 1,
-0.9107472, 0.1432992, -2.545489, 1, 1, 1, 1, 1,
-0.90323, 0.3512493, -1.422222, 1, 1, 1, 1, 1,
-0.901584, 0.1650922, -1.603804, 1, 1, 1, 1, 1,
-0.9008189, -0.6929026, -4.345071, 1, 1, 1, 1, 1,
-0.8987529, -0.5952657, -3.597445, 1, 1, 1, 1, 1,
-0.8970123, -0.06256243, -2.947102, 1, 1, 1, 1, 1,
-0.8880819, 0.4804254, -0.4319935, 1, 1, 1, 1, 1,
-0.8862023, 0.9480922, -1.005291, 1, 1, 1, 1, 1,
-0.8854162, -0.6000004, -2.979077, 1, 1, 1, 1, 1,
-0.8704887, -0.3453138, -2.556536, 1, 1, 1, 1, 1,
-0.8704188, -0.8220351, -1.326188, 1, 1, 1, 1, 1,
-0.8665162, -0.1902993, -2.649895, 1, 1, 1, 1, 1,
-0.8654766, 1.454445, 1.113637, 0, 0, 1, 1, 1,
-0.8635648, -0.6080785, -1.413393, 1, 0, 0, 1, 1,
-0.8608627, -0.3331423, -3.201969, 1, 0, 0, 1, 1,
-0.8554767, -0.2398341, -1.983473, 1, 0, 0, 1, 1,
-0.8540185, 1.453685, -2.284702, 1, 0, 0, 1, 1,
-0.8425928, 0.2614252, -0.5991352, 1, 0, 0, 1, 1,
-0.8411198, -1.20524, -1.408745, 0, 0, 0, 1, 1,
-0.8409128, -0.6857164, -3.708865, 0, 0, 0, 1, 1,
-0.8321522, -0.1439217, -2.329221, 0, 0, 0, 1, 1,
-0.8266224, 1.315249, -0.9843456, 0, 0, 0, 1, 1,
-0.8214503, 1.481997, -1.944746, 0, 0, 0, 1, 1,
-0.8206373, -1.345254, -2.592716, 0, 0, 0, 1, 1,
-0.8191392, 0.01888585, -2.565363, 0, 0, 0, 1, 1,
-0.8109461, -1.096598, -2.486018, 1, 1, 1, 1, 1,
-0.8097657, 1.42859, -0.2248963, 1, 1, 1, 1, 1,
-0.8010229, 1.761039, -0.3024369, 1, 1, 1, 1, 1,
-0.8007925, 0.4103513, -1.701476, 1, 1, 1, 1, 1,
-0.8005934, 1.146213, -0.6931463, 1, 1, 1, 1, 1,
-0.7982147, -1.415226, -1.620741, 1, 1, 1, 1, 1,
-0.7961748, -0.9295388, -2.663345, 1, 1, 1, 1, 1,
-0.7885194, -0.9405192, -1.443878, 1, 1, 1, 1, 1,
-0.7866527, -0.7174931, -2.253716, 1, 1, 1, 1, 1,
-0.7800234, -1.744192, -3.721013, 1, 1, 1, 1, 1,
-0.7741922, 0.9338909, -1.615799, 1, 1, 1, 1, 1,
-0.7640482, 2.065244, -0.6373307, 1, 1, 1, 1, 1,
-0.7630137, 0.2544328, -2.491606, 1, 1, 1, 1, 1,
-0.7598441, 0.9143298, -1.654765, 1, 1, 1, 1, 1,
-0.7475005, 0.4380665, -1.808457, 1, 1, 1, 1, 1,
-0.7470761, -1.218107, -2.970934, 0, 0, 1, 1, 1,
-0.7467762, -1.22167, -2.940032, 1, 0, 0, 1, 1,
-0.7388797, 0.9786491, -2.641721, 1, 0, 0, 1, 1,
-0.7325313, 0.4678238, 1.259815, 1, 0, 0, 1, 1,
-0.7305297, -1.811952, -3.927438, 1, 0, 0, 1, 1,
-0.7300856, -0.1478361, -2.83845, 1, 0, 0, 1, 1,
-0.7276703, 0.3751133, -0.79881, 0, 0, 0, 1, 1,
-0.725851, -0.183496, -2.38186, 0, 0, 0, 1, 1,
-0.7207339, -0.4871013, 0.596155, 0, 0, 0, 1, 1,
-0.7192082, 0.4589196, -0.2718609, 0, 0, 0, 1, 1,
-0.7102806, -1.835315, -1.474517, 0, 0, 0, 1, 1,
-0.7091088, 1.910482, 0.5407989, 0, 0, 0, 1, 1,
-0.7089649, -0.06916811, -0.7358256, 0, 0, 0, 1, 1,
-0.6923689, -0.2347479, -1.267704, 1, 1, 1, 1, 1,
-0.6904486, -0.0804211, -2.393391, 1, 1, 1, 1, 1,
-0.6809064, 0.5339357, -0.550409, 1, 1, 1, 1, 1,
-0.6780573, -1.734141, -2.226247, 1, 1, 1, 1, 1,
-0.6743679, 0.9600757, -2.415552, 1, 1, 1, 1, 1,
-0.6743483, -0.2151359, -1.803123, 1, 1, 1, 1, 1,
-0.6715269, -1.035504, -1.639768, 1, 1, 1, 1, 1,
-0.6686459, -1.514154, -3.782429, 1, 1, 1, 1, 1,
-0.6656058, -1.065462, -3.160055, 1, 1, 1, 1, 1,
-0.6640068, 1.197543, -2.722607, 1, 1, 1, 1, 1,
-0.6635869, -1.811697, -4.11097, 1, 1, 1, 1, 1,
-0.6596684, -1.145387, -1.88816, 1, 1, 1, 1, 1,
-0.6587912, -0.09131797, -1.982309, 1, 1, 1, 1, 1,
-0.65127, 0.05712666, -1.316079, 1, 1, 1, 1, 1,
-0.6448208, 1.243421, 0.668121, 1, 1, 1, 1, 1,
-0.6426522, -1.29009, -1.906678, 0, 0, 1, 1, 1,
-0.642424, -0.9291904, -1.453203, 1, 0, 0, 1, 1,
-0.6372761, 1.395941, 0.04683831, 1, 0, 0, 1, 1,
-0.6344363, -1.021087, -1.860975, 1, 0, 0, 1, 1,
-0.6315213, -0.8543451, -3.653375, 1, 0, 0, 1, 1,
-0.6276845, -0.1283345, -2.341984, 1, 0, 0, 1, 1,
-0.626798, 0.0183326, -2.544096, 0, 0, 0, 1, 1,
-0.6251619, 0.66734, -1.323749, 0, 0, 0, 1, 1,
-0.6244886, -0.4644711, -2.804423, 0, 0, 0, 1, 1,
-0.6240995, -0.496977, -1.599207, 0, 0, 0, 1, 1,
-0.6235145, -0.3173269, -1.804304, 0, 0, 0, 1, 1,
-0.6220056, -0.06059493, -0.380409, 0, 0, 0, 1, 1,
-0.6213218, 0.356869, -1.397467, 0, 0, 0, 1, 1,
-0.6182806, -1.106259, -2.41252, 1, 1, 1, 1, 1,
-0.6161757, -0.2835587, -3.830815, 1, 1, 1, 1, 1,
-0.6125284, 1.053508, -1.051077, 1, 1, 1, 1, 1,
-0.6101629, 0.3161726, -0.2148473, 1, 1, 1, 1, 1,
-0.6005549, -0.7864696, -1.942066, 1, 1, 1, 1, 1,
-0.5985159, -0.4130561, -2.55248, 1, 1, 1, 1, 1,
-0.5965135, 0.1245658, -1.78958, 1, 1, 1, 1, 1,
-0.59217, 0.2030694, -2.494721, 1, 1, 1, 1, 1,
-0.590646, 1.389694, 0.6080786, 1, 1, 1, 1, 1,
-0.5894676, 0.08321094, -2.89849, 1, 1, 1, 1, 1,
-0.5875371, 1.328563, -0.3606013, 1, 1, 1, 1, 1,
-0.5863472, 0.4031417, -3.017254, 1, 1, 1, 1, 1,
-0.5694461, 0.02098251, -1.397976, 1, 1, 1, 1, 1,
-0.5673587, 0.03537416, -1.235085, 1, 1, 1, 1, 1,
-0.5662387, -0.6098415, -4.548926, 1, 1, 1, 1, 1,
-0.5616369, -0.1673016, -2.418262, 0, 0, 1, 1, 1,
-0.5598471, 0.1025086, -0.3655178, 1, 0, 0, 1, 1,
-0.5566106, 0.2722448, -2.913771, 1, 0, 0, 1, 1,
-0.5563663, 1.016065, 0.8000269, 1, 0, 0, 1, 1,
-0.5560643, -0.9640874, -2.840666, 1, 0, 0, 1, 1,
-0.5548068, -0.9130169, -1.749104, 1, 0, 0, 1, 1,
-0.5511205, 0.6563503, -0.0700641, 0, 0, 0, 1, 1,
-0.550834, 0.166474, -1.595541, 0, 0, 0, 1, 1,
-0.5504326, 1.705854, -1.680762, 0, 0, 0, 1, 1,
-0.5501243, 0.6458493, 0.6324359, 0, 0, 0, 1, 1,
-0.5475263, -0.9418944, -3.894033, 0, 0, 0, 1, 1,
-0.5446824, 0.6256506, -1.921113, 0, 0, 0, 1, 1,
-0.54176, 0.650221, -2.429537, 0, 0, 0, 1, 1,
-0.5278003, 0.9709231, -0.8656281, 1, 1, 1, 1, 1,
-0.5271884, -1.111814, -1.133826, 1, 1, 1, 1, 1,
-0.5226193, -0.6683448, -2.852171, 1, 1, 1, 1, 1,
-0.5182005, -0.02336165, -0.5705886, 1, 1, 1, 1, 1,
-0.517285, 0.1404198, -1.269017, 1, 1, 1, 1, 1,
-0.5144049, -0.07607038, -2.007177, 1, 1, 1, 1, 1,
-0.5111187, -2.950576, -2.292546, 1, 1, 1, 1, 1,
-0.5108291, -1.258898, -4.439994, 1, 1, 1, 1, 1,
-0.5100049, 2.067237, -0.47833, 1, 1, 1, 1, 1,
-0.5099387, -2.380194, -4.789087, 1, 1, 1, 1, 1,
-0.5074901, 0.6381519, -1.647762, 1, 1, 1, 1, 1,
-0.5052974, 0.7827172, -1.337479, 1, 1, 1, 1, 1,
-0.5050889, -0.08498936, -0.6336635, 1, 1, 1, 1, 1,
-0.5044556, 0.6728457, 0.2581203, 1, 1, 1, 1, 1,
-0.5023094, -1.474208, -1.719324, 1, 1, 1, 1, 1,
-0.4982809, -0.2979743, -3.725605, 0, 0, 1, 1, 1,
-0.4930411, 0.7317658, 1.534848, 1, 0, 0, 1, 1,
-0.4906307, -1.050142, -1.839552, 1, 0, 0, 1, 1,
-0.4846833, -0.6350007, -4.293891, 1, 0, 0, 1, 1,
-0.4828337, 0.2192678, -3.462502, 1, 0, 0, 1, 1,
-0.4747232, 0.5769818, -0.7124355, 1, 0, 0, 1, 1,
-0.4747174, -2.249134, -0.5736461, 0, 0, 0, 1, 1,
-0.464979, -0.2822762, -3.732979, 0, 0, 0, 1, 1,
-0.4635352, -0.08095436, 0.034947, 0, 0, 0, 1, 1,
-0.4600746, -1.081928, -2.447014, 0, 0, 0, 1, 1,
-0.4575063, -2.504092, -2.607551, 0, 0, 0, 1, 1,
-0.4514892, -0.5932263, -2.666236, 0, 0, 0, 1, 1,
-0.4496799, 1.358903, -0.9910543, 0, 0, 0, 1, 1,
-0.4472307, -0.01450981, -2.045752, 1, 1, 1, 1, 1,
-0.4442958, -1.114837, -1.643696, 1, 1, 1, 1, 1,
-0.4438601, 0.6062156, -0.3467385, 1, 1, 1, 1, 1,
-0.4401312, -0.3376221, -2.988489, 1, 1, 1, 1, 1,
-0.4370718, 0.8221078, -0.0814762, 1, 1, 1, 1, 1,
-0.4300048, 0.5221377, 0.5259702, 1, 1, 1, 1, 1,
-0.4295031, 0.7370178, -0.3946375, 1, 1, 1, 1, 1,
-0.4276535, 0.0693707, -1.049113, 1, 1, 1, 1, 1,
-0.4223176, 0.4758764, -1.302294, 1, 1, 1, 1, 1,
-0.4222062, -1.187762, -3.523614, 1, 1, 1, 1, 1,
-0.4194076, 1.358935, 0.8425645, 1, 1, 1, 1, 1,
-0.4155003, 0.09623336, -1.60549, 1, 1, 1, 1, 1,
-0.4090028, -0.2701891, -0.694943, 1, 1, 1, 1, 1,
-0.4044923, -0.6368774, -3.391042, 1, 1, 1, 1, 1,
-0.4039379, 0.7541366, -0.05226782, 1, 1, 1, 1, 1,
-0.4034185, -0.4238265, -0.9601208, 0, 0, 1, 1, 1,
-0.3988462, -0.335094, -2.112876, 1, 0, 0, 1, 1,
-0.3988383, 0.8039733, 0.4162111, 1, 0, 0, 1, 1,
-0.3977208, -1.321443, -2.260615, 1, 0, 0, 1, 1,
-0.3945989, -0.3795817, -0.6807786, 1, 0, 0, 1, 1,
-0.3943599, 0.1804773, -1.865503, 1, 0, 0, 1, 1,
-0.3911045, 1.261267, -0.1795482, 0, 0, 0, 1, 1,
-0.3906698, -0.5665926, -1.667737, 0, 0, 0, 1, 1,
-0.3900127, 0.8362755, 0.7181875, 0, 0, 0, 1, 1,
-0.3860922, -1.167271, -4.98335, 0, 0, 0, 1, 1,
-0.3854808, 0.5117027, -1.513175, 0, 0, 0, 1, 1,
-0.3791164, -1.863158, -1.141731, 0, 0, 0, 1, 1,
-0.3781402, 1.425182, -0.1080624, 0, 0, 0, 1, 1,
-0.377901, 0.3181022, -1.434816, 1, 1, 1, 1, 1,
-0.3776766, -0.04851775, -1.55044, 1, 1, 1, 1, 1,
-0.3740419, -0.9112598, -1.026566, 1, 1, 1, 1, 1,
-0.3727012, -0.01073117, -2.854098, 1, 1, 1, 1, 1,
-0.3614663, -0.03891155, -0.9333205, 1, 1, 1, 1, 1,
-0.3606743, -1.947593, -2.335758, 1, 1, 1, 1, 1,
-0.3575699, 1.007254, 0.4325157, 1, 1, 1, 1, 1,
-0.3537048, 0.1205629, -1.167296, 1, 1, 1, 1, 1,
-0.353545, -1.451701, -3.01968, 1, 1, 1, 1, 1,
-0.3512644, 0.2831341, 0.07652236, 1, 1, 1, 1, 1,
-0.3452188, -0.1579673, -3.174032, 1, 1, 1, 1, 1,
-0.3446628, -0.6086872, -1.542322, 1, 1, 1, 1, 1,
-0.3366578, 0.3675533, -0.9444659, 1, 1, 1, 1, 1,
-0.3355675, 0.5402253, 0.02321973, 1, 1, 1, 1, 1,
-0.3353173, 1.373577, -2.379186, 1, 1, 1, 1, 1,
-0.3351399, 0.2931218, -1.037043, 0, 0, 1, 1, 1,
-0.332555, 0.9614882, -0.6360725, 1, 0, 0, 1, 1,
-0.3317539, 0.1360761, -1.166374, 1, 0, 0, 1, 1,
-0.3286691, -0.4339687, -2.517341, 1, 0, 0, 1, 1,
-0.3281113, -0.7337506, -2.192188, 1, 0, 0, 1, 1,
-0.3270382, 1.553289, -1.183533, 1, 0, 0, 1, 1,
-0.3238871, 0.8802642, -1.712814, 0, 0, 0, 1, 1,
-0.3188848, -0.1401215, -1.874728, 0, 0, 0, 1, 1,
-0.3169251, 0.7122326, 0.8240406, 0, 0, 0, 1, 1,
-0.3099546, -0.2886501, -3.167555, 0, 0, 0, 1, 1,
-0.3092144, -0.3643989, -3.10113, 0, 0, 0, 1, 1,
-0.3090179, 0.364347, -1.066496, 0, 0, 0, 1, 1,
-0.3071604, 1.29057, 0.4583276, 0, 0, 0, 1, 1,
-0.3011589, 0.750177, -1.252815, 1, 1, 1, 1, 1,
-0.297311, 2.390081, 1.042388, 1, 1, 1, 1, 1,
-0.2894608, -0.0511669, -3.363057, 1, 1, 1, 1, 1,
-0.2874934, 0.2930901, -0.7597681, 1, 1, 1, 1, 1,
-0.2831301, 1.699734, -0.8508689, 1, 1, 1, 1, 1,
-0.279483, 0.8124164, 0.1477371, 1, 1, 1, 1, 1,
-0.2751648, -0.1650323, -1.406246, 1, 1, 1, 1, 1,
-0.2740869, 1.921267, -0.2957286, 1, 1, 1, 1, 1,
-0.2709067, 1.411325, -0.06473517, 1, 1, 1, 1, 1,
-0.2682894, 0.2709996, -1.237469, 1, 1, 1, 1, 1,
-0.2681229, 0.450752, -0.2361472, 1, 1, 1, 1, 1,
-0.2675087, 0.9750807, 0.0426932, 1, 1, 1, 1, 1,
-0.2663915, -1.007985, -3.320453, 1, 1, 1, 1, 1,
-0.2652366, 1.248045, 1.001096, 1, 1, 1, 1, 1,
-0.2621609, -0.1404019, -3.027149, 1, 1, 1, 1, 1,
-0.2496651, -0.3804695, -1.005631, 0, 0, 1, 1, 1,
-0.2480873, -0.8214158, -2.567373, 1, 0, 0, 1, 1,
-0.2440895, -0.2822194, -3.986146, 1, 0, 0, 1, 1,
-0.2367257, 1.03312, -0.5747206, 1, 0, 0, 1, 1,
-0.2277288, 0.6901951, -0.8359895, 1, 0, 0, 1, 1,
-0.2273236, -1.305573, -3.792267, 1, 0, 0, 1, 1,
-0.2256649, 2.2368, 0.7825981, 0, 0, 0, 1, 1,
-0.2253787, -0.2152217, -3.144021, 0, 0, 0, 1, 1,
-0.2212528, 1.097369, -0.7934223, 0, 0, 0, 1, 1,
-0.2193689, 1.640116, -0.1939954, 0, 0, 0, 1, 1,
-0.2177352, 0.5629256, -3.008355, 0, 0, 0, 1, 1,
-0.2169133, -1.070144, -0.8440273, 0, 0, 0, 1, 1,
-0.2166429, -0.5258833, -3.344813, 0, 0, 0, 1, 1,
-0.2135694, 0.08702513, -1.452597, 1, 1, 1, 1, 1,
-0.213359, -0.4624082, -4.061087, 1, 1, 1, 1, 1,
-0.2083278, -1.483496, -2.873523, 1, 1, 1, 1, 1,
-0.2060005, -0.8649594, -3.348105, 1, 1, 1, 1, 1,
-0.2051667, -1.010662, -2.594787, 1, 1, 1, 1, 1,
-0.2045562, -0.428703, -2.530188, 1, 1, 1, 1, 1,
-0.2033073, 0.4580362, 1.547616, 1, 1, 1, 1, 1,
-0.2030633, -0.07422607, -2.13424, 1, 1, 1, 1, 1,
-0.2014723, -0.9636396, -2.562353, 1, 1, 1, 1, 1,
-0.200988, -0.09947801, -2.295994, 1, 1, 1, 1, 1,
-0.194221, -0.1803949, -2.576401, 1, 1, 1, 1, 1,
-0.1920738, 0.7739422, 0.8027105, 1, 1, 1, 1, 1,
-0.1907027, -1.139851, -3.058349, 1, 1, 1, 1, 1,
-0.1847588, 0.5883782, 2.294456, 1, 1, 1, 1, 1,
-0.1799899, -1.010704, -3.605257, 1, 1, 1, 1, 1,
-0.1799796, -0.2777866, -3.771365, 0, 0, 1, 1, 1,
-0.1694239, 0.7149021, 0.3945977, 1, 0, 0, 1, 1,
-0.1691535, -0.6200646, -1.162153, 1, 0, 0, 1, 1,
-0.1659353, 0.3632969, -0.05790625, 1, 0, 0, 1, 1,
-0.1657187, 1.239273, 1.334479, 1, 0, 0, 1, 1,
-0.1648189, -0.3146028, -0.8788268, 1, 0, 0, 1, 1,
-0.1603838, 0.8373942, 0.9747831, 0, 0, 0, 1, 1,
-0.1559895, -0.8980551, -3.237459, 0, 0, 0, 1, 1,
-0.1556596, -0.8890608, -3.225177, 0, 0, 0, 1, 1,
-0.1440486, 0.3587344, -0.3114303, 0, 0, 0, 1, 1,
-0.1429104, 0.04879567, -0.959928, 0, 0, 0, 1, 1,
-0.1411979, -0.2420487, -3.485717, 0, 0, 0, 1, 1,
-0.1401007, 0.8126447, -0.7944897, 0, 0, 0, 1, 1,
-0.1342563, -1.011888, -2.67951, 1, 1, 1, 1, 1,
-0.1303644, 0.6377237, -0.8947865, 1, 1, 1, 1, 1,
-0.1290514, 2.08324, -0.1467763, 1, 1, 1, 1, 1,
-0.1284683, 0.03934675, -0.9069219, 1, 1, 1, 1, 1,
-0.1266115, -0.1980686, -2.584098, 1, 1, 1, 1, 1,
-0.1265271, -2.728045, -3.203005, 1, 1, 1, 1, 1,
-0.1263837, -1.534057, -2.114378, 1, 1, 1, 1, 1,
-0.1256608, -1.048354, -4.482807, 1, 1, 1, 1, 1,
-0.1204135, 0.8138502, -0.2227919, 1, 1, 1, 1, 1,
-0.1178531, -0.5207347, -1.280702, 1, 1, 1, 1, 1,
-0.1149352, -0.8816, -4.012149, 1, 1, 1, 1, 1,
-0.1137518, -0.6647919, -3.152937, 1, 1, 1, 1, 1,
-0.1136516, -0.6024908, -1.209496, 1, 1, 1, 1, 1,
-0.1105817, 1.496973, -0.1971195, 1, 1, 1, 1, 1,
-0.1091523, -0.1087036, -3.602435, 1, 1, 1, 1, 1,
-0.1085118, 0.5360781, -0.9811105, 0, 0, 1, 1, 1,
-0.1079066, 0.8762633, 1.154429, 1, 0, 0, 1, 1,
-0.1033807, 0.8808267, -1.695064, 1, 0, 0, 1, 1,
-0.1030516, 0.1727548, 0.171085, 1, 0, 0, 1, 1,
-0.09769697, -2.957806, -4.056707, 1, 0, 0, 1, 1,
-0.09423181, -1.375447, -3.729609, 1, 0, 0, 1, 1,
-0.0908663, 1.149869, -0.6575291, 0, 0, 0, 1, 1,
-0.08227415, -1.288172, -3.040431, 0, 0, 0, 1, 1,
-0.07922675, -0.6191792, -2.804647, 0, 0, 0, 1, 1,
-0.07812499, -1.029733, -5.536945, 0, 0, 0, 1, 1,
-0.07707367, 1.040242, 0.6556739, 0, 0, 0, 1, 1,
-0.07195263, -0.5018079, -1.384813, 0, 0, 0, 1, 1,
-0.06863574, -0.6307378, -4.485183, 0, 0, 0, 1, 1,
-0.06662795, -0.08042087, -1.635824, 1, 1, 1, 1, 1,
-0.06330407, -0.903146, -4.357288, 1, 1, 1, 1, 1,
-0.0539686, -0.6997772, -2.448185, 1, 1, 1, 1, 1,
-0.05145429, 1.259585, 0.7497488, 1, 1, 1, 1, 1,
-0.04656824, 1.454763, 0.5782335, 1, 1, 1, 1, 1,
-0.04553125, -0.680121, -2.472715, 1, 1, 1, 1, 1,
-0.04191598, 0.1177641, -0.2637488, 1, 1, 1, 1, 1,
-0.0418714, -1.313049, -2.900416, 1, 1, 1, 1, 1,
-0.03985832, -0.03616561, -0.5428518, 1, 1, 1, 1, 1,
-0.03720605, -0.9032954, -2.103295, 1, 1, 1, 1, 1,
-0.03532531, 1.601402, -0.7316212, 1, 1, 1, 1, 1,
-0.03356192, -1.423899, -2.796527, 1, 1, 1, 1, 1,
-0.03191685, -0.4993061, -1.350825, 1, 1, 1, 1, 1,
-0.03188253, 0.468255, 0.8388788, 1, 1, 1, 1, 1,
-0.02969396, 1.956788, 1.568526, 1, 1, 1, 1, 1,
-0.02750941, 0.8376907, -0.07719928, 0, 0, 1, 1, 1,
-0.02534161, -0.219986, -4.255214, 1, 0, 0, 1, 1,
-0.02523746, 1.211038, -1.824374, 1, 0, 0, 1, 1,
-0.02342524, -0.028318, -4.01429, 1, 0, 0, 1, 1,
-0.02280672, -1.412024, -3.114243, 1, 0, 0, 1, 1,
-0.02212778, 0.4131466, -1.350922, 1, 0, 0, 1, 1,
-0.0184805, -0.08639151, -4.132973, 0, 0, 0, 1, 1,
-0.01686195, 0.8153822, 0.6933986, 0, 0, 0, 1, 1,
-0.01180616, 1.687627, -0.6117026, 0, 0, 0, 1, 1,
-0.01127359, -0.07108031, -1.255705, 0, 0, 0, 1, 1,
-0.01058955, 0.01084475, -0.1044864, 0, 0, 0, 1, 1,
-0.005809673, -0.5548955, -2.442705, 0, 0, 0, 1, 1,
-0.004702705, 0.9853219, -0.1763103, 0, 0, 0, 1, 1,
-0.004337401, 0.9622133, 1.551208, 1, 1, 1, 1, 1,
-0.002025034, 1.205192, -0.3828395, 1, 1, 1, 1, 1,
0.001293402, 0.2175023, -0.5591782, 1, 1, 1, 1, 1,
0.004434549, -0.7572542, 4.979334, 1, 1, 1, 1, 1,
0.004714102, -0.0631312, 3.584166, 1, 1, 1, 1, 1,
0.00681698, -0.408861, 2.35499, 1, 1, 1, 1, 1,
0.01056212, -0.5474702, 3.361698, 1, 1, 1, 1, 1,
0.01065609, -0.5881085, 1.345358, 1, 1, 1, 1, 1,
0.01444492, 0.3000371, 1.158888, 1, 1, 1, 1, 1,
0.01777666, 0.6383669, 0.6410559, 1, 1, 1, 1, 1,
0.02086448, 0.7857772, -0.5515645, 1, 1, 1, 1, 1,
0.02228091, -0.2497951, 3.064753, 1, 1, 1, 1, 1,
0.02410195, 0.5131467, -0.1709901, 1, 1, 1, 1, 1,
0.03096731, 0.5959657, -0.3612863, 1, 1, 1, 1, 1,
0.03099164, -1.738404, 2.057555, 1, 1, 1, 1, 1,
0.03115268, 0.6436613, -0.5786595, 0, 0, 1, 1, 1,
0.03119748, -1.501727, 2.032727, 1, 0, 0, 1, 1,
0.03354873, 0.7089195, 0.06990413, 1, 0, 0, 1, 1,
0.03484469, 0.05602493, 0.519004, 1, 0, 0, 1, 1,
0.03838964, 1.645597, -0.2310427, 1, 0, 0, 1, 1,
0.04684365, -1.375528, 3.311139, 1, 0, 0, 1, 1,
0.04717003, -0.1226624, 3.274198, 0, 0, 0, 1, 1,
0.04722184, 1.199964, -1.159564, 0, 0, 0, 1, 1,
0.04864792, 0.712472, -0.4700756, 0, 0, 0, 1, 1,
0.04955712, 0.2626885, -0.3470886, 0, 0, 0, 1, 1,
0.05010806, 0.05670455, 0.166144, 0, 0, 0, 1, 1,
0.05067915, -0.7360479, 3.524991, 0, 0, 0, 1, 1,
0.05468158, -1.094585, 3.056414, 0, 0, 0, 1, 1,
0.05518329, 0.6244917, 0.9189634, 1, 1, 1, 1, 1,
0.05794267, -1.04927, 3.2629, 1, 1, 1, 1, 1,
0.05828852, -0.6036904, 3.911966, 1, 1, 1, 1, 1,
0.06047754, -0.01386862, 1.29409, 1, 1, 1, 1, 1,
0.06095633, -0.2965168, 2.8395, 1, 1, 1, 1, 1,
0.06236288, 0.3258628, 0.5062076, 1, 1, 1, 1, 1,
0.06589729, -0.5168623, 3.190213, 1, 1, 1, 1, 1,
0.06774335, -0.5894222, 2.050059, 1, 1, 1, 1, 1,
0.06936606, 0.2427309, 0.09386218, 1, 1, 1, 1, 1,
0.07317901, -0.5887966, 3.08569, 1, 1, 1, 1, 1,
0.07412744, 1.72408, 0.07790417, 1, 1, 1, 1, 1,
0.07520404, 0.6566949, -1.861294, 1, 1, 1, 1, 1,
0.07716388, -1.913352, 3.420346, 1, 1, 1, 1, 1,
0.0775842, 0.179323, -0.7647626, 1, 1, 1, 1, 1,
0.08314176, 0.6965542, 0.4424531, 1, 1, 1, 1, 1,
0.0846764, -0.7216542, 2.439005, 0, 0, 1, 1, 1,
0.08597754, 0.4743813, -0.3071199, 1, 0, 0, 1, 1,
0.08813798, 0.185291, -0.557056, 1, 0, 0, 1, 1,
0.08973232, -1.133688, 3.167549, 1, 0, 0, 1, 1,
0.09082158, 1.671942, -0.9911937, 1, 0, 0, 1, 1,
0.09234519, 0.004754105, 5.361023, 1, 0, 0, 1, 1,
0.09502503, 0.685013, -0.5059152, 0, 0, 0, 1, 1,
0.09520774, 0.1600151, -0.1157902, 0, 0, 0, 1, 1,
0.09556802, -1.874264, 3.38164, 0, 0, 0, 1, 1,
0.09867704, -1.846864, 3.970262, 0, 0, 0, 1, 1,
0.1003548, 0.6242275, 0.9707323, 0, 0, 0, 1, 1,
0.1008636, -0.355669, 3.33488, 0, 0, 0, 1, 1,
0.1027403, 2.054132, 0.4831829, 0, 0, 0, 1, 1,
0.1033525, -1.531228, 4.920465, 1, 1, 1, 1, 1,
0.1100015, -0.5002351, 2.944161, 1, 1, 1, 1, 1,
0.1104912, 1.701746, 1.505444, 1, 1, 1, 1, 1,
0.1122675, -1.573913, 4.36281, 1, 1, 1, 1, 1,
0.112339, -0.764288, 3.860361, 1, 1, 1, 1, 1,
0.1197771, -0.8328986, 3.809329, 1, 1, 1, 1, 1,
0.1239667, -2.714545, 4.578925, 1, 1, 1, 1, 1,
0.1256248, -0.6296234, 2.456453, 1, 1, 1, 1, 1,
0.1262647, -0.2967465, 2.641692, 1, 1, 1, 1, 1,
0.1263785, -0.4231279, 1.560671, 1, 1, 1, 1, 1,
0.1266554, -0.6661267, 4.081369, 1, 1, 1, 1, 1,
0.1278199, 0.1462417, -0.5582179, 1, 1, 1, 1, 1,
0.1279831, 0.2962016, 1.286377, 1, 1, 1, 1, 1,
0.1293301, -1.790666, 4.386107, 1, 1, 1, 1, 1,
0.1311259, 1.190859, -0.6078257, 1, 1, 1, 1, 1,
0.1432962, -0.9959133, 4.478004, 0, 0, 1, 1, 1,
0.1504489, -1.143951, 2.589609, 1, 0, 0, 1, 1,
0.1508251, 0.1184121, 0.797223, 1, 0, 0, 1, 1,
0.1510867, -1.608395, 2.294703, 1, 0, 0, 1, 1,
0.1514432, 1.970975, -1.173928, 1, 0, 0, 1, 1,
0.1580368, -1.945264, 2.294119, 1, 0, 0, 1, 1,
0.1604818, 1.642473, 1.082679, 0, 0, 0, 1, 1,
0.16056, -0.5385249, 3.910436, 0, 0, 0, 1, 1,
0.1632907, 0.01033176, 1.455428, 0, 0, 0, 1, 1,
0.1660405, 1.141863, 2.059936, 0, 0, 0, 1, 1,
0.1732737, -0.8590415, 3.818639, 0, 0, 0, 1, 1,
0.1747113, 1.135067, 0.216104, 0, 0, 0, 1, 1,
0.1751624, -0.06289762, 2.617234, 0, 0, 0, 1, 1,
0.1773255, -0.6026921, 2.65394, 1, 1, 1, 1, 1,
0.1792287, 0.9868453, 1.110398, 1, 1, 1, 1, 1,
0.1897399, 0.4412146, -0.5065265, 1, 1, 1, 1, 1,
0.1907393, -0.9182504, 3.053766, 1, 1, 1, 1, 1,
0.1949805, -0.1588019, 1.844153, 1, 1, 1, 1, 1,
0.195264, 0.3448067, 1.975883, 1, 1, 1, 1, 1,
0.197194, -0.4270794, 4.368171, 1, 1, 1, 1, 1,
0.1989367, 0.4831451, 0.04463159, 1, 1, 1, 1, 1,
0.1992387, -0.7929072, 1.867541, 1, 1, 1, 1, 1,
0.2036956, 1.21127, 0.2079737, 1, 1, 1, 1, 1,
0.20709, 0.1841704, -0.09405766, 1, 1, 1, 1, 1,
0.2103769, 0.3355184, -0.2573238, 1, 1, 1, 1, 1,
0.2197896, 0.1658991, 0.296416, 1, 1, 1, 1, 1,
0.2207379, -1.532902, 1.928166, 1, 1, 1, 1, 1,
0.2268614, 1.7571, 0.1466792, 1, 1, 1, 1, 1,
0.232511, 0.4852079, 0.9150293, 0, 0, 1, 1, 1,
0.2350243, -1.372336, 2.087059, 1, 0, 0, 1, 1,
0.2352619, -0.216813, 1.694712, 1, 0, 0, 1, 1,
0.2365165, -0.3469122, 1.868725, 1, 0, 0, 1, 1,
0.2366092, -0.334431, 1.479482, 1, 0, 0, 1, 1,
0.2371367, -0.42873, 1.853377, 1, 0, 0, 1, 1,
0.2425192, 0.4161164, 2.060405, 0, 0, 0, 1, 1,
0.245569, 0.03888088, -0.748358, 0, 0, 0, 1, 1,
0.2500704, -0.3356532, 2.864123, 0, 0, 0, 1, 1,
0.2566864, 1.072488, 0.5275934, 0, 0, 0, 1, 1,
0.2567991, -0.05729337, 1.935422, 0, 0, 0, 1, 1,
0.2581854, 0.5411109, 2.073993, 0, 0, 0, 1, 1,
0.2633116, 0.7280163, 1.582294, 0, 0, 0, 1, 1,
0.2640786, 0.5144839, -1.170977, 1, 1, 1, 1, 1,
0.2675428, -0.7888299, 3.017694, 1, 1, 1, 1, 1,
0.2703474, -2.413229, 2.850154, 1, 1, 1, 1, 1,
0.2706174, 0.7032838, 1.672837, 1, 1, 1, 1, 1,
0.2728499, -0.389497, 2.72402, 1, 1, 1, 1, 1,
0.2738055, -0.7831859, 3.420261, 1, 1, 1, 1, 1,
0.2741589, -0.245844, 2.190569, 1, 1, 1, 1, 1,
0.2766602, 0.6196669, 0.953275, 1, 1, 1, 1, 1,
0.27813, -1.545599, 2.970281, 1, 1, 1, 1, 1,
0.2806477, -0.9861339, 1.835354, 1, 1, 1, 1, 1,
0.2830324, 0.4505263, 0.7791325, 1, 1, 1, 1, 1,
0.2831922, -0.5175696, 1.515109, 1, 1, 1, 1, 1,
0.287958, -0.7673156, 2.225955, 1, 1, 1, 1, 1,
0.296299, 0.1341783, 2.540646, 1, 1, 1, 1, 1,
0.3004037, -0.8187212, 1.585454, 1, 1, 1, 1, 1,
0.3026763, -1.302778, 2.602583, 0, 0, 1, 1, 1,
0.3121011, 0.8300071, -0.3032918, 1, 0, 0, 1, 1,
0.3191851, -0.6589549, 2.95627, 1, 0, 0, 1, 1,
0.3197706, 0.6847872, -0.1076244, 1, 0, 0, 1, 1,
0.3239779, -0.7567248, 1.959522, 1, 0, 0, 1, 1,
0.3271526, -0.9804661, 3.009284, 1, 0, 0, 1, 1,
0.3272214, -0.5109327, 2.309797, 0, 0, 0, 1, 1,
0.3287706, 0.2841415, 0.8606867, 0, 0, 0, 1, 1,
0.329908, -0.7451557, 2.43537, 0, 0, 0, 1, 1,
0.3317385, -0.1798166, 1.22864, 0, 0, 0, 1, 1,
0.3367804, -1.847786, 3.285305, 0, 0, 0, 1, 1,
0.3402646, -1.669913, 1.504447, 0, 0, 0, 1, 1,
0.3485647, -1.146445, 1.744294, 0, 0, 0, 1, 1,
0.350533, -1.748691, 2.988157, 1, 1, 1, 1, 1,
0.3580066, -1.262743, 4.586614, 1, 1, 1, 1, 1,
0.3597161, 1.273685, 0.6749223, 1, 1, 1, 1, 1,
0.3598326, -1.375657, 2.778939, 1, 1, 1, 1, 1,
0.3711293, 0.5655093, 0.9428832, 1, 1, 1, 1, 1,
0.3734198, 1.138568, 1.968741, 1, 1, 1, 1, 1,
0.3806714, 0.3707423, -1.802594, 1, 1, 1, 1, 1,
0.3846132, -1.323134, 2.999136, 1, 1, 1, 1, 1,
0.388882, -0.4953105, 2.34913, 1, 1, 1, 1, 1,
0.391271, 0.02510944, 1.77575, 1, 1, 1, 1, 1,
0.3914514, -0.3071249, 1.603445, 1, 1, 1, 1, 1,
0.3945578, 0.8551075, 0.1745667, 1, 1, 1, 1, 1,
0.3947051, -0.5991299, 1.711583, 1, 1, 1, 1, 1,
0.3974232, -0.4856599, 1.124343, 1, 1, 1, 1, 1,
0.4039706, 1.598181, 0.06270909, 1, 1, 1, 1, 1,
0.4049222, 0.6260969, 2.012481, 0, 0, 1, 1, 1,
0.4055229, -0.1434899, 0.3026233, 1, 0, 0, 1, 1,
0.4085478, 1.992849, -1.460257, 1, 0, 0, 1, 1,
0.4089032, -1.132289, 2.376898, 1, 0, 0, 1, 1,
0.4099055, -1.397776, 3.224159, 1, 0, 0, 1, 1,
0.4110743, -0.5627455, 2.327688, 1, 0, 0, 1, 1,
0.4115275, -0.8064193, 3.039971, 0, 0, 0, 1, 1,
0.4124716, -0.361172, 1.986445, 0, 0, 0, 1, 1,
0.4155219, 1.323574, -1.360573, 0, 0, 0, 1, 1,
0.41662, -2.383076, 1.80817, 0, 0, 0, 1, 1,
0.4179991, 0.8551089, 2.18923, 0, 0, 0, 1, 1,
0.4201708, -0.6978509, 0.9284812, 0, 0, 0, 1, 1,
0.421009, 1.372954, -1.858506, 0, 0, 0, 1, 1,
0.422985, -0.7741529, 3.164972, 1, 1, 1, 1, 1,
0.4247414, 1.121143, -1.826164, 1, 1, 1, 1, 1,
0.4270824, -1.89791, 1.372229, 1, 1, 1, 1, 1,
0.4295478, 1.638586, 1.466395, 1, 1, 1, 1, 1,
0.4380729, 0.4035662, -0.3960077, 1, 1, 1, 1, 1,
0.4498742, 0.3930102, 0.1044671, 1, 1, 1, 1, 1,
0.4526267, 0.6740135, 1.050151, 1, 1, 1, 1, 1,
0.4593195, 0.549687, -0.2166353, 1, 1, 1, 1, 1,
0.4645011, -0.11369, 1.700453, 1, 1, 1, 1, 1,
0.4666921, -0.6806381, 0.548225, 1, 1, 1, 1, 1,
0.4679967, 0.2903338, -0.4153909, 1, 1, 1, 1, 1,
0.468419, 0.8957642, -0.6575628, 1, 1, 1, 1, 1,
0.4686296, -1.400484, 1.120067, 1, 1, 1, 1, 1,
0.4687039, 0.2823119, 1.040116, 1, 1, 1, 1, 1,
0.4692355, -1.364519, 3.267398, 1, 1, 1, 1, 1,
0.4731889, 0.986178, -0.7999519, 0, 0, 1, 1, 1,
0.4778835, -0.6445563, 2.453964, 1, 0, 0, 1, 1,
0.4799444, 0.2695164, 1.07659, 1, 0, 0, 1, 1,
0.4826335, -1.259358, 2.511393, 1, 0, 0, 1, 1,
0.4900172, -0.2817534, 1.810397, 1, 0, 0, 1, 1,
0.4942421, -0.08096087, 0.6561482, 1, 0, 0, 1, 1,
0.4943154, 0.9073091, 0.9435069, 0, 0, 0, 1, 1,
0.4971566, -1.271262, 1.609211, 0, 0, 0, 1, 1,
0.4993995, -0.6055308, 3.921533, 0, 0, 0, 1, 1,
0.5095234, 0.5942064, 1.156099, 0, 0, 0, 1, 1,
0.5108235, -0.8477262, 3.865442, 0, 0, 0, 1, 1,
0.5117329, -1.155372, 2.629733, 0, 0, 0, 1, 1,
0.5117601, 0.1455778, 2.478315, 0, 0, 0, 1, 1,
0.5124825, -1.856874, 4.690643, 1, 1, 1, 1, 1,
0.5166133, -0.9819143, 3.70033, 1, 1, 1, 1, 1,
0.5186724, -0.5139668, 2.820899, 1, 1, 1, 1, 1,
0.5200338, -0.8105116, 1.986107, 1, 1, 1, 1, 1,
0.5222402, 1.69, -1.147657, 1, 1, 1, 1, 1,
0.526137, -0.6167676, 2.038736, 1, 1, 1, 1, 1,
0.5275922, -2.184452, 3.101656, 1, 1, 1, 1, 1,
0.5286748, -2.545462, 4.178707, 1, 1, 1, 1, 1,
0.5291926, 0.3839005, 0.7668177, 1, 1, 1, 1, 1,
0.5308437, -0.4408322, 2.486476, 1, 1, 1, 1, 1,
0.5344055, -0.5764779, 1.365964, 1, 1, 1, 1, 1,
0.5414852, 1.737454, 1.883552, 1, 1, 1, 1, 1,
0.5434482, -1.327118, 2.955276, 1, 1, 1, 1, 1,
0.5459411, 0.4404008, -0.156927, 1, 1, 1, 1, 1,
0.5466331, 0.2302822, -0.6282379, 1, 1, 1, 1, 1,
0.5497037, -1.125902, 4.739176, 0, 0, 1, 1, 1,
0.5589052, -0.007877914, 0.1094519, 1, 0, 0, 1, 1,
0.5639135, -1.383204, 2.304434, 1, 0, 0, 1, 1,
0.5646552, -0.8688795, 3.195006, 1, 0, 0, 1, 1,
0.5674976, -0.3392693, 2.265781, 1, 0, 0, 1, 1,
0.5712769, -2.21872, 1.528158, 1, 0, 0, 1, 1,
0.573943, 1.472899, -0.7041254, 0, 0, 0, 1, 1,
0.5818635, 0.1149829, 3.59515, 0, 0, 0, 1, 1,
0.5862113, -0.8628228, 1.355399, 0, 0, 0, 1, 1,
0.5976207, -1.147926, 2.525713, 0, 0, 0, 1, 1,
0.6014038, -0.3809627, 2.802134, 0, 0, 0, 1, 1,
0.6021851, -0.587115, 3.064824, 0, 0, 0, 1, 1,
0.6064131, 0.07233299, 1.301685, 0, 0, 0, 1, 1,
0.6066772, -0.8256336, 1.197764, 1, 1, 1, 1, 1,
0.6133912, -0.4331932, 2.429801, 1, 1, 1, 1, 1,
0.6143535, 1.12849, 1.234391, 1, 1, 1, 1, 1,
0.6153726, 0.8002366, 1.017848, 1, 1, 1, 1, 1,
0.6170507, 0.4570792, 1.035811, 1, 1, 1, 1, 1,
0.6240402, -0.6185994, 1.990512, 1, 1, 1, 1, 1,
0.6248283, 0.2914177, 0.9195189, 1, 1, 1, 1, 1,
0.6255772, -0.5359055, 3.711321, 1, 1, 1, 1, 1,
0.6264671, -0.2589372, 1.377989, 1, 1, 1, 1, 1,
0.6291267, -0.5625627, 2.719337, 1, 1, 1, 1, 1,
0.6302577, -0.4054722, 2.609006, 1, 1, 1, 1, 1,
0.6303366, 1.20875, -0.7133769, 1, 1, 1, 1, 1,
0.6314787, -0.5810879, 2.947591, 1, 1, 1, 1, 1,
0.6340364, -0.2857427, 4.523405, 1, 1, 1, 1, 1,
0.637078, -1.479722, 2.899997, 1, 1, 1, 1, 1,
0.6402047, -1.863922, 3.71187, 0, 0, 1, 1, 1,
0.6428891, -1.141979, 3.673531, 1, 0, 0, 1, 1,
0.6433253, -0.4003867, 0.9748945, 1, 0, 0, 1, 1,
0.645768, -0.3204268, 2.65335, 1, 0, 0, 1, 1,
0.6505948, -0.5895419, 1.669764, 1, 0, 0, 1, 1,
0.6517623, 1.028333, 0.1489156, 1, 0, 0, 1, 1,
0.6519392, -1.136973, 3.423333, 0, 0, 0, 1, 1,
0.6536992, 0.1477904, -0.3974728, 0, 0, 0, 1, 1,
0.6623467, 0.3831758, 1.00694, 0, 0, 0, 1, 1,
0.6672022, -0.120556, 1.335103, 0, 0, 0, 1, 1,
0.6680241, 0.1928501, 1.935668, 0, 0, 0, 1, 1,
0.6712756, -0.9975807, 3.323404, 0, 0, 0, 1, 1,
0.6762912, -0.1153612, -0.03412172, 0, 0, 0, 1, 1,
0.6770112, -1.672935, 1.499119, 1, 1, 1, 1, 1,
0.6774682, 0.1436794, 1.22114, 1, 1, 1, 1, 1,
0.6798884, -0.3440512, 0.582524, 1, 1, 1, 1, 1,
0.6815217, 0.4583372, -0.08148972, 1, 1, 1, 1, 1,
0.6822187, -0.1543514, 1.762924, 1, 1, 1, 1, 1,
0.6825919, 0.09092221, 1.550401, 1, 1, 1, 1, 1,
0.6828212, 1.289606, 0.7948373, 1, 1, 1, 1, 1,
0.6965834, 0.6848404, -0.4942754, 1, 1, 1, 1, 1,
0.6970026, -0.9885259, 1.930691, 1, 1, 1, 1, 1,
0.7007438, -0.5717247, 0.2254285, 1, 1, 1, 1, 1,
0.7048948, 0.00437043, 1.588266, 1, 1, 1, 1, 1,
0.7106575, 0.5743726, 1.446648, 1, 1, 1, 1, 1,
0.7203149, -0.3242447, 1.086358, 1, 1, 1, 1, 1,
0.7206753, -0.1983713, 1.286102, 1, 1, 1, 1, 1,
0.7213684, -1.431964, 3.747936, 1, 1, 1, 1, 1,
0.7256762, 1.189878, 2.778689, 0, 0, 1, 1, 1,
0.7307094, 0.6730853, 1.423544, 1, 0, 0, 1, 1,
0.7334104, 1.143201, 0.8557188, 1, 0, 0, 1, 1,
0.7348499, -0.6593475, 1.236172, 1, 0, 0, 1, 1,
0.7372099, 0.9201808, -0.676329, 1, 0, 0, 1, 1,
0.7402108, -0.9802489, 0.2213096, 1, 0, 0, 1, 1,
0.7433056, -0.9822056, 3.942587, 0, 0, 0, 1, 1,
0.7473715, 0.5006855, -0.3179201, 0, 0, 0, 1, 1,
0.7484936, -0.8587257, 0.6483266, 0, 0, 0, 1, 1,
0.7538768, 0.05063712, 2.21029, 0, 0, 0, 1, 1,
0.7561482, 0.1815377, 0.482019, 0, 0, 0, 1, 1,
0.7583182, 0.4132385, 0.4886502, 0, 0, 0, 1, 1,
0.7595205, -0.8808633, 1.602009, 0, 0, 0, 1, 1,
0.7616885, -0.5581889, 2.943833, 1, 1, 1, 1, 1,
0.7657129, -0.7716525, 2.811404, 1, 1, 1, 1, 1,
0.7663394, 0.8690081, 0.08270547, 1, 1, 1, 1, 1,
0.7664459, 0.009368729, 2.316957, 1, 1, 1, 1, 1,
0.7687985, 1.639663, 0.7157831, 1, 1, 1, 1, 1,
0.7724016, 1.233233, 1.023983, 1, 1, 1, 1, 1,
0.7741922, 0.5362607, 0.9540957, 1, 1, 1, 1, 1,
0.7768648, 0.1876417, 0.5722408, 1, 1, 1, 1, 1,
0.7774105, -1.76836, 2.569429, 1, 1, 1, 1, 1,
0.7842953, -1.731187, 3.444063, 1, 1, 1, 1, 1,
0.7845286, -0.413933, 2.728611, 1, 1, 1, 1, 1,
0.7855963, -1.12557, 3.939914, 1, 1, 1, 1, 1,
0.7867571, 0.2467285, 0.5360949, 1, 1, 1, 1, 1,
0.7907367, 1.352131, -0.5666726, 1, 1, 1, 1, 1,
0.7932414, -0.04161656, 1.310267, 1, 1, 1, 1, 1,
0.7935895, -0.2734711, 2.922852, 0, 0, 1, 1, 1,
0.7964143, 0.7612863, 0.6963324, 1, 0, 0, 1, 1,
0.800528, 1.212296, -0.7550876, 1, 0, 0, 1, 1,
0.804171, 3.777225, -0.2593067, 1, 0, 0, 1, 1,
0.8045007, 0.3409044, 1.410036, 1, 0, 0, 1, 1,
0.8076893, -0.2123596, 3.727615, 1, 0, 0, 1, 1,
0.8079041, -1.351038, 2.878314, 0, 0, 0, 1, 1,
0.810496, 0.2851628, 1.650996, 0, 0, 0, 1, 1,
0.8111871, -0.3106406, 1.439331, 0, 0, 0, 1, 1,
0.8119196, -1.071854, 3.351337, 0, 0, 0, 1, 1,
0.8239011, 1.046779, 2.79313, 0, 0, 0, 1, 1,
0.8271705, -0.6549915, 1.736308, 0, 0, 0, 1, 1,
0.8349012, 0.5090031, 1.955681, 0, 0, 0, 1, 1,
0.8367815, -0.3326621, 1.697024, 1, 1, 1, 1, 1,
0.8380688, 0.5213805, 2.836959, 1, 1, 1, 1, 1,
0.8468459, -0.9328796, 2.719928, 1, 1, 1, 1, 1,
0.8500479, -0.3216374, 1.804714, 1, 1, 1, 1, 1,
0.8559598, -0.3785618, 2.431129, 1, 1, 1, 1, 1,
0.8560655, 0.9341871, 1.801464, 1, 1, 1, 1, 1,
0.8586802, -0.4477299, 1.615746, 1, 1, 1, 1, 1,
0.8635551, 0.7719384, -0.2721839, 1, 1, 1, 1, 1,
0.8638131, -0.4118106, 3.357543, 1, 1, 1, 1, 1,
0.871749, 0.1217775, 0.9193481, 1, 1, 1, 1, 1,
0.8731382, 0.3931768, 2.583863, 1, 1, 1, 1, 1,
0.8768842, 0.6785443, 1.998824, 1, 1, 1, 1, 1,
0.8815582, -0.8270797, 3.745047, 1, 1, 1, 1, 1,
0.8823348, -0.5252536, 1.977691, 1, 1, 1, 1, 1,
0.8825016, 0.6467876, -0.5814557, 1, 1, 1, 1, 1,
0.8842684, -0.6796808, 2.772011, 0, 0, 1, 1, 1,
0.8843089, 0.9498407, -0.1963399, 1, 0, 0, 1, 1,
0.8910257, 1.774391, 1.564227, 1, 0, 0, 1, 1,
0.8956465, -1.084269, 3.698897, 1, 0, 0, 1, 1,
0.8977942, 0.5240559, 1.07328, 1, 0, 0, 1, 1,
0.8982769, -1.260042, 3.723545, 1, 0, 0, 1, 1,
0.9010466, 0.04814901, 0.4436595, 0, 0, 0, 1, 1,
0.9034258, 0.3061906, 0.07565492, 0, 0, 0, 1, 1,
0.9052637, 1.068545, 1.284828, 0, 0, 0, 1, 1,
0.9070379, -1.039402, 2.91304, 0, 0, 0, 1, 1,
0.9094421, -0.4179475, 2.862394, 0, 0, 0, 1, 1,
0.9107271, 0.4121237, 0.2627096, 0, 0, 0, 1, 1,
0.9113066, 0.201415, 0.7532436, 0, 0, 0, 1, 1,
0.9130716, 1.655715, 0.220892, 1, 1, 1, 1, 1,
0.9166077, -1.518612, 3.781231, 1, 1, 1, 1, 1,
0.9166858, -2.146659, 1.933468, 1, 1, 1, 1, 1,
0.9251293, -0.08812632, 1.715493, 1, 1, 1, 1, 1,
0.9263169, 1.174858, 2.55211, 1, 1, 1, 1, 1,
0.9308947, 0.5832792, 3.186419, 1, 1, 1, 1, 1,
0.9383054, 1.496057, 1.344687, 1, 1, 1, 1, 1,
0.9461131, -1.537804, 3.784648, 1, 1, 1, 1, 1,
0.9534267, 0.2200915, -0.3224401, 1, 1, 1, 1, 1,
0.9621779, -0.4511279, 4.336645, 1, 1, 1, 1, 1,
0.9700987, -0.3336045, 2.569351, 1, 1, 1, 1, 1,
0.9703018, 0.2257583, 2.087828, 1, 1, 1, 1, 1,
0.9772087, 0.7297732, 1.692015, 1, 1, 1, 1, 1,
0.9800951, 0.1221186, -0.6267393, 1, 1, 1, 1, 1,
0.9873702, 1.043037, -0.9455647, 1, 1, 1, 1, 1,
0.9875371, -0.7465704, 2.857668, 0, 0, 1, 1, 1,
0.9938626, -1.668603, 2.104307, 1, 0, 0, 1, 1,
1.003094, -0.4370367, 0.8470441, 1, 0, 0, 1, 1,
1.012564, -0.4815691, 1.863205, 1, 0, 0, 1, 1,
1.019859, -0.3445504, 2.950965, 1, 0, 0, 1, 1,
1.023717, 0.1586935, 2.348395, 1, 0, 0, 1, 1,
1.027635, 1.436852, 1.123988, 0, 0, 0, 1, 1,
1.027983, -0.889751, 1.806494, 0, 0, 0, 1, 1,
1.030572, 0.2594052, 2.058674, 0, 0, 0, 1, 1,
1.031053, -1.670458, 1.349752, 0, 0, 0, 1, 1,
1.035879, 2.039911, -0.5467345, 0, 0, 0, 1, 1,
1.043639, -0.03137337, 2.342571, 0, 0, 0, 1, 1,
1.061875, 1.045774, 2.965054, 0, 0, 0, 1, 1,
1.0681, -0.5042555, 1.581819, 1, 1, 1, 1, 1,
1.0703, -0.7426495, 1.867711, 1, 1, 1, 1, 1,
1.074353, -0.473942, 3.592404, 1, 1, 1, 1, 1,
1.076056, -0.1037142, 2.206364, 1, 1, 1, 1, 1,
1.081586, -0.381395, 2.840034, 1, 1, 1, 1, 1,
1.083695, -1.166855, 2.200768, 1, 1, 1, 1, 1,
1.10242, 1.090387, 0.7153082, 1, 1, 1, 1, 1,
1.10313, 1.182058, 0.8100728, 1, 1, 1, 1, 1,
1.105563, 0.1404099, 0.1993349, 1, 1, 1, 1, 1,
1.11458, -1.200933, 1.078081, 1, 1, 1, 1, 1,
1.127184, 0.3761145, 1.649672, 1, 1, 1, 1, 1,
1.132163, 0.588109, 1.138176, 1, 1, 1, 1, 1,
1.132612, 0.4612131, 3.01308, 1, 1, 1, 1, 1,
1.137481, 0.5392156, 0.5938465, 1, 1, 1, 1, 1,
1.140623, -0.5674473, 0.6980901, 1, 1, 1, 1, 1,
1.146861, -0.7180241, 2.525894, 0, 0, 1, 1, 1,
1.149758, -0.9539905, 1.946175, 1, 0, 0, 1, 1,
1.15445, -0.2784083, 2.194169, 1, 0, 0, 1, 1,
1.163303, -1.063403, 2.920074, 1, 0, 0, 1, 1,
1.164924, -1.375733, 1.289669, 1, 0, 0, 1, 1,
1.180992, 0.9188265, 1.083404, 1, 0, 0, 1, 1,
1.182153, -1.332462, 2.948115, 0, 0, 0, 1, 1,
1.183323, -0.2397152, 1.782344, 0, 0, 0, 1, 1,
1.189034, 0.258482, 0.4445014, 0, 0, 0, 1, 1,
1.190274, -1.200884, 3.093834, 0, 0, 0, 1, 1,
1.197211, -0.5991923, 2.541358, 0, 0, 0, 1, 1,
1.201825, 0.9998447, -0.2158653, 0, 0, 0, 1, 1,
1.202975, -1.768588, 1.879628, 0, 0, 0, 1, 1,
1.204944, -1.685491, 1.8763, 1, 1, 1, 1, 1,
1.213324, -0.5079771, 0.3911945, 1, 1, 1, 1, 1,
1.219601, 0.400903, 0.3631411, 1, 1, 1, 1, 1,
1.225958, -0.7448564, 2.571182, 1, 1, 1, 1, 1,
1.229684, 1.013403, 0.3576679, 1, 1, 1, 1, 1,
1.231333, -0.4877838, 1.65852, 1, 1, 1, 1, 1,
1.23526, 0.5200535, 1.711388, 1, 1, 1, 1, 1,
1.242964, 1.965008, 1.158811, 1, 1, 1, 1, 1,
1.243509, -0.2542067, 1.879734, 1, 1, 1, 1, 1,
1.246976, 0.06417672, 1.102105, 1, 1, 1, 1, 1,
1.252161, 0.8809776, 1.412392, 1, 1, 1, 1, 1,
1.260506, -0.008417184, 1.113459, 1, 1, 1, 1, 1,
1.262769, -0.04509494, 0.9403231, 1, 1, 1, 1, 1,
1.266334, 1.638479, 1.322771, 1, 1, 1, 1, 1,
1.278669, 0.08614536, 1.052755, 1, 1, 1, 1, 1,
1.285709, 0.196764, 1.701106, 0, 0, 1, 1, 1,
1.286775, 0.8247551, 0.2744039, 1, 0, 0, 1, 1,
1.291138, -0.4261198, 1.284282, 1, 0, 0, 1, 1,
1.294833, -0.20298, 0.2069055, 1, 0, 0, 1, 1,
1.299759, -0.1932658, 1.01637, 1, 0, 0, 1, 1,
1.308909, 1.01111, -0.9892932, 1, 0, 0, 1, 1,
1.311984, -0.3614904, 2.402365, 0, 0, 0, 1, 1,
1.317589, -0.1664741, 1.706365, 0, 0, 0, 1, 1,
1.33289, -1.268709, 1.725239, 0, 0, 0, 1, 1,
1.338532, -1.712416, 4.447473, 0, 0, 0, 1, 1,
1.346172, 1.01815, -1.309039, 0, 0, 0, 1, 1,
1.348217, 1.593333, 1.656699, 0, 0, 0, 1, 1,
1.360026, -0.4056736, 1.547292, 0, 0, 0, 1, 1,
1.361197, -0.3612513, 1.902631, 1, 1, 1, 1, 1,
1.364205, 0.9153408, 2.608222, 1, 1, 1, 1, 1,
1.364938, -0.4996404, 2.234856, 1, 1, 1, 1, 1,
1.368966, -0.3964369, 0.8711119, 1, 1, 1, 1, 1,
1.372015, -0.9045503, 3.590499, 1, 1, 1, 1, 1,
1.389148, -0.3965369, 1.430709, 1, 1, 1, 1, 1,
1.390167, -1.340316, 2.262027, 1, 1, 1, 1, 1,
1.390398, -0.8257191, 1.252344, 1, 1, 1, 1, 1,
1.398225, -0.5839494, 2.702199, 1, 1, 1, 1, 1,
1.4014, -1.635653, 3.844729, 1, 1, 1, 1, 1,
1.409952, -0.4076551, 1.81334, 1, 1, 1, 1, 1,
1.419373, 0.9590636, 2.164032, 1, 1, 1, 1, 1,
1.420822, 2.043961, -0.3638961, 1, 1, 1, 1, 1,
1.420848, 1.126887, 1.312981, 1, 1, 1, 1, 1,
1.422042, 0.4318166, 1.212282, 1, 1, 1, 1, 1,
1.434256, -0.1574097, 2.350527, 0, 0, 1, 1, 1,
1.438431, -0.7410101, 1.292854, 1, 0, 0, 1, 1,
1.443858, 0.4319964, 1.52258, 1, 0, 0, 1, 1,
1.444023, 0.5340533, 1.85484, 1, 0, 0, 1, 1,
1.459357, 0.3008434, -0.8647044, 1, 0, 0, 1, 1,
1.46076, 0.9706537, 1.632197, 1, 0, 0, 1, 1,
1.473156, 0.7875196, 0.6449064, 0, 0, 0, 1, 1,
1.473895, -0.02975717, 2.024608, 0, 0, 0, 1, 1,
1.474614, -0.6433212, 0.1951908, 0, 0, 0, 1, 1,
1.485365, 0.2717386, 0.5127475, 0, 0, 0, 1, 1,
1.493305, -0.2073343, 0.8155341, 0, 0, 0, 1, 1,
1.505275, 0.7628471, 1.83441, 0, 0, 0, 1, 1,
1.528244, -0.1904367, 3.565052, 0, 0, 0, 1, 1,
1.528983, 0.6398476, -0.4572535, 1, 1, 1, 1, 1,
1.53071, 0.09568943, 1.548166, 1, 1, 1, 1, 1,
1.530787, -0.6769981, 1.589866, 1, 1, 1, 1, 1,
1.55274, -0.3171309, 2.748956, 1, 1, 1, 1, 1,
1.558993, 0.04104944, 1.393561, 1, 1, 1, 1, 1,
1.573232, 0.03085249, 2.521062, 1, 1, 1, 1, 1,
1.598527, -0.08164133, 3.113718, 1, 1, 1, 1, 1,
1.627697, -0.3299207, 1.857667, 1, 1, 1, 1, 1,
1.634987, -1.302366, 1.504904, 1, 1, 1, 1, 1,
1.639086, 0.448169, 0.3850257, 1, 1, 1, 1, 1,
1.6438, -1.302262, 0.5637932, 1, 1, 1, 1, 1,
1.643857, 0.7481872, 1.88828, 1, 1, 1, 1, 1,
1.647086, -0.7494743, 1.314792, 1, 1, 1, 1, 1,
1.648552, -1.581538, 2.38371, 1, 1, 1, 1, 1,
1.657633, -0.3124215, 2.251524, 1, 1, 1, 1, 1,
1.667619, 0.2811532, 2.024853, 0, 0, 1, 1, 1,
1.670921, -0.1057525, 0.9797128, 1, 0, 0, 1, 1,
1.682503, -0.4838384, 0.920773, 1, 0, 0, 1, 1,
1.696901, -0.4481904, 3.547471, 1, 0, 0, 1, 1,
1.698674, -0.6998276, 2.182105, 1, 0, 0, 1, 1,
1.69888, -0.7340081, 1.521755, 1, 0, 0, 1, 1,
1.701308, 0.0005606719, 1.244922, 0, 0, 0, 1, 1,
1.758531, 0.6162015, 1.944445, 0, 0, 0, 1, 1,
1.761404, 0.8177817, 0.5348171, 0, 0, 0, 1, 1,
1.771075, -0.568545, 1.320881, 0, 0, 0, 1, 1,
1.780602, 0.4360765, 1.633906, 0, 0, 0, 1, 1,
1.786169, -0.1107448, 0.970291, 0, 0, 0, 1, 1,
1.790158, 1.55256, 0.3208612, 0, 0, 0, 1, 1,
1.790238, -0.6811836, 2.082317, 1, 1, 1, 1, 1,
1.800155, 0.5702753, -0.2287917, 1, 1, 1, 1, 1,
1.802222, 0.5968813, 2.824875, 1, 1, 1, 1, 1,
1.836249, -0.618595, 1.292626, 1, 1, 1, 1, 1,
1.844965, 0.01212209, 1.473212, 1, 1, 1, 1, 1,
1.85149, 0.8835313, 0.9334431, 1, 1, 1, 1, 1,
1.851975, -0.2715648, 0.88402, 1, 1, 1, 1, 1,
1.883513, 1.175313, 1.212503, 1, 1, 1, 1, 1,
1.890023, 1.126915, 1.069697, 1, 1, 1, 1, 1,
1.893645, 0.3466164, 1.608925, 1, 1, 1, 1, 1,
1.923921, 0.6097602, 0.8794035, 1, 1, 1, 1, 1,
1.9669, 0.6456203, 2.432128, 1, 1, 1, 1, 1,
1.977695, -0.1728777, 2.481783, 1, 1, 1, 1, 1,
1.993841, -0.7097965, 2.48654, 1, 1, 1, 1, 1,
1.995122, 1.907018, -1.040167, 1, 1, 1, 1, 1,
2.061427, 0.9060232, 1.758003, 0, 0, 1, 1, 1,
2.069404, 0.2047246, 1.106439, 1, 0, 0, 1, 1,
2.073738, 1.592311, 0.8828239, 1, 0, 0, 1, 1,
2.100466, -0.9863204, 1.842018, 1, 0, 0, 1, 1,
2.136579, 0.1517858, 2.972326, 1, 0, 0, 1, 1,
2.143453, 0.5545039, 2.750394, 1, 0, 0, 1, 1,
2.187249, -0.005223052, 2.665454, 0, 0, 0, 1, 1,
2.206593, -1.333319, 1.645162, 0, 0, 0, 1, 1,
2.237392, 0.8304908, 0.7246654, 0, 0, 0, 1, 1,
2.331696, -1.356359, 0.5815873, 0, 0, 0, 1, 1,
2.3513, 0.7834038, 2.368072, 0, 0, 0, 1, 1,
2.408907, -0.6994393, 0.02356618, 0, 0, 0, 1, 1,
2.505057, -1.181463, 1.972013, 0, 0, 0, 1, 1,
2.507884, 1.435817, 0.7723212, 1, 1, 1, 1, 1,
2.543836, -0.9800091, 2.956052, 1, 1, 1, 1, 1,
2.546486, 0.3184556, 0.3894547, 1, 1, 1, 1, 1,
2.60905, -0.07839563, 0.3482375, 1, 1, 1, 1, 1,
2.640879, 0.9864805, 0.5466655, 1, 1, 1, 1, 1,
2.77014, 0.5898944, -0.906072, 1, 1, 1, 1, 1,
2.854902, 1.416656, -0.6523844, 1, 1, 1, 1, 1
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
var radius = 9.710962;
var distance = 34.10934;
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
mvMatrix.translate( 0.3010099, -0.4097095, 0.08796096 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10934);
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