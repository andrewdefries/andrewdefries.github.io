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
-2.582557, -0.4895623, -2.819816, 1, 0, 0, 1,
-2.569733, -0.6287045, -2.884465, 1, 0.007843138, 0, 1,
-2.321965, -0.5601075, -3.716199, 1, 0.01176471, 0, 1,
-2.277433, 0.3821933, -0.7699834, 1, 0.01960784, 0, 1,
-2.203597, -0.5720338, -2.338516, 1, 0.02352941, 0, 1,
-2.123533, -0.7008423, -2.167899, 1, 0.03137255, 0, 1,
-2.110103, -0.2578466, -2.871857, 1, 0.03529412, 0, 1,
-2.109048, -0.1781425, -2.404359, 1, 0.04313726, 0, 1,
-2.104584, -0.1055814, -0.3658791, 1, 0.04705882, 0, 1,
-2.091352, 1.921693, -1.329813, 1, 0.05490196, 0, 1,
-2.090055, -1.489468, -2.125718, 1, 0.05882353, 0, 1,
-2.045508, 0.4198917, -2.40981, 1, 0.06666667, 0, 1,
-2.032104, 0.1733478, -0.8198988, 1, 0.07058824, 0, 1,
-2.031738, -1.886812, -1.164058, 1, 0.07843138, 0, 1,
-2.02332, 0.7833096, -1.049618, 1, 0.08235294, 0, 1,
-2.020833, 1.359873, -2.192051, 1, 0.09019608, 0, 1,
-1.993443, 0.7616209, -1.73132, 1, 0.09411765, 0, 1,
-1.985701, -0.5900308, -1.857814, 1, 0.1019608, 0, 1,
-1.973827, -0.6908419, -2.471257, 1, 0.1098039, 0, 1,
-1.965238, 1.001063, -0.8723301, 1, 0.1137255, 0, 1,
-1.945592, -0.1010696, -1.161242, 1, 0.1215686, 0, 1,
-1.937038, -1.242475, -1.462862, 1, 0.1254902, 0, 1,
-1.924614, 0.5970399, -1.040824, 1, 0.1333333, 0, 1,
-1.871346, 0.5444065, -1.05519, 1, 0.1372549, 0, 1,
-1.862939, -1.052959, -3.12816, 1, 0.145098, 0, 1,
-1.85266, -0.3176276, -0.2420039, 1, 0.1490196, 0, 1,
-1.845149, 0.4484334, -2.922822, 1, 0.1568628, 0, 1,
-1.818416, 0.9562874, -1.278659, 1, 0.1607843, 0, 1,
-1.793005, 0.4155373, -0.1912229, 1, 0.1686275, 0, 1,
-1.763058, -0.8755968, -3.780687, 1, 0.172549, 0, 1,
-1.762266, -0.7977811, -2.066631, 1, 0.1803922, 0, 1,
-1.760964, -0.2023637, -1.748623, 1, 0.1843137, 0, 1,
-1.757231, -1.413276, -1.929585, 1, 0.1921569, 0, 1,
-1.755698, 1.001871, -3.037161, 1, 0.1960784, 0, 1,
-1.745917, -0.1326578, -2.022061, 1, 0.2039216, 0, 1,
-1.743855, -1.153832, -2.141725, 1, 0.2117647, 0, 1,
-1.717774, -1.412352, -1.862799, 1, 0.2156863, 0, 1,
-1.70851, -0.3027371, -1.613663, 1, 0.2235294, 0, 1,
-1.707263, 1.558368, -0.3379199, 1, 0.227451, 0, 1,
-1.687306, 0.4032623, -1.316222, 1, 0.2352941, 0, 1,
-1.684466, -0.160809, -1.200665, 1, 0.2392157, 0, 1,
-1.653294, 0.904183, -0.271774, 1, 0.2470588, 0, 1,
-1.648497, -0.4031993, -1.266241, 1, 0.2509804, 0, 1,
-1.644975, 1.137723, -1.463593, 1, 0.2588235, 0, 1,
-1.619707, -0.8522206, -3.301947, 1, 0.2627451, 0, 1,
-1.615956, -0.5962767, -2.03226, 1, 0.2705882, 0, 1,
-1.607716, -1.295415, -2.38531, 1, 0.2745098, 0, 1,
-1.599881, -0.2914298, -2.29627, 1, 0.282353, 0, 1,
-1.595737, -1.505875, -1.227349, 1, 0.2862745, 0, 1,
-1.587802, 0.9989576, -1.562666, 1, 0.2941177, 0, 1,
-1.58695, 1.516105, -1.988966, 1, 0.3019608, 0, 1,
-1.569966, 0.6855582, -1.444863, 1, 0.3058824, 0, 1,
-1.566801, 0.3806981, -2.220787, 1, 0.3137255, 0, 1,
-1.542181, 0.6898544, -2.76042, 1, 0.3176471, 0, 1,
-1.540943, 1.990362, -2.662801, 1, 0.3254902, 0, 1,
-1.531322, 0.003820618, -1.375627, 1, 0.3294118, 0, 1,
-1.528309, 0.8218964, -1.277494, 1, 0.3372549, 0, 1,
-1.524276, -1.772816, -2.743853, 1, 0.3411765, 0, 1,
-1.509055, -1.44426, -2.662324, 1, 0.3490196, 0, 1,
-1.504946, -0.1153631, -0.5098947, 1, 0.3529412, 0, 1,
-1.492663, -0.6770347, -2.697086, 1, 0.3607843, 0, 1,
-1.485627, 1.056666, -0.8306482, 1, 0.3647059, 0, 1,
-1.477461, 0.7898783, -0.5992773, 1, 0.372549, 0, 1,
-1.474297, 2.711768, 0.1761173, 1, 0.3764706, 0, 1,
-1.465257, 0.5489321, -3.44353, 1, 0.3843137, 0, 1,
-1.450787, -0.4241477, -2.963596, 1, 0.3882353, 0, 1,
-1.447072, -0.975979, -3.516863, 1, 0.3960784, 0, 1,
-1.431985, 0.6868857, -1.821761, 1, 0.4039216, 0, 1,
-1.406144, 0.6556451, -0.5655794, 1, 0.4078431, 0, 1,
-1.405718, -1.981018, -0.1104202, 1, 0.4156863, 0, 1,
-1.405057, -0.3304404, -0.560712, 1, 0.4196078, 0, 1,
-1.39801, 2.577821, 0.4543316, 1, 0.427451, 0, 1,
-1.396419, 0.3836412, -1.315097, 1, 0.4313726, 0, 1,
-1.388338, -0.8110417, -2.170913, 1, 0.4392157, 0, 1,
-1.381369, -0.695653, -0.4609032, 1, 0.4431373, 0, 1,
-1.376736, 0.6134256, -0.05298617, 1, 0.4509804, 0, 1,
-1.375976, 1.045434, -1.31812, 1, 0.454902, 0, 1,
-1.368752, -0.2575462, -0.8541605, 1, 0.4627451, 0, 1,
-1.368377, -1.48966, -2.768562, 1, 0.4666667, 0, 1,
-1.364983, -0.3989322, -2.511642, 1, 0.4745098, 0, 1,
-1.362671, 0.07215169, -1.611568, 1, 0.4784314, 0, 1,
-1.360416, 1.128969, -0.8867946, 1, 0.4862745, 0, 1,
-1.35816, -0.1879752, -2.443665, 1, 0.4901961, 0, 1,
-1.351286, -0.01944692, -1.598507, 1, 0.4980392, 0, 1,
-1.348922, -0.7319878, -2.003951, 1, 0.5058824, 0, 1,
-1.342938, -0.3229172, -2.50178, 1, 0.509804, 0, 1,
-1.339675, 0.6845475, 0.1242605, 1, 0.5176471, 0, 1,
-1.325222, 0.05327071, -2.344804, 1, 0.5215687, 0, 1,
-1.314316, -1.266038, -2.862024, 1, 0.5294118, 0, 1,
-1.312001, -0.160668, -0.7068682, 1, 0.5333334, 0, 1,
-1.304281, -1.292116, -1.384218, 1, 0.5411765, 0, 1,
-1.301596, 0.2058562, -2.1897, 1, 0.5450981, 0, 1,
-1.297005, -1.314563, -1.283538, 1, 0.5529412, 0, 1,
-1.289812, -1.244267, -3.749012, 1, 0.5568628, 0, 1,
-1.288471, 1.017683, -1.220457, 1, 0.5647059, 0, 1,
-1.286222, -0.3436794, -3.239588, 1, 0.5686275, 0, 1,
-1.280037, -2.784611, -4.441332, 1, 0.5764706, 0, 1,
-1.26144, -0.05458533, -1.762749, 1, 0.5803922, 0, 1,
-1.258808, -1.541352, -1.457551, 1, 0.5882353, 0, 1,
-1.257787, 1.535179, -1.588164, 1, 0.5921569, 0, 1,
-1.242401, 1.85626, -1.279797, 1, 0.6, 0, 1,
-1.228483, 0.2069374, -0.8474249, 1, 0.6078432, 0, 1,
-1.19709, 1.572606, -0.7549993, 1, 0.6117647, 0, 1,
-1.19537, -0.2930697, -0.9512402, 1, 0.6196079, 0, 1,
-1.194069, -0.06976465, -1.692003, 1, 0.6235294, 0, 1,
-1.193798, 0.5009349, -1.053857, 1, 0.6313726, 0, 1,
-1.182488, 0.8924533, -0.8231225, 1, 0.6352941, 0, 1,
-1.179325, -1.978817, -2.044321, 1, 0.6431373, 0, 1,
-1.17782, -0.1003944, -2.242665, 1, 0.6470588, 0, 1,
-1.166448, -0.5964587, -3.185671, 1, 0.654902, 0, 1,
-1.165806, 1.936207, -1.290577, 1, 0.6588235, 0, 1,
-1.165213, 1.506235, 0.7512408, 1, 0.6666667, 0, 1,
-1.164104, -0.2122085, -1.749884, 1, 0.6705883, 0, 1,
-1.152854, -0.3210533, -1.329905, 1, 0.6784314, 0, 1,
-1.148778, -0.8434899, -1.751204, 1, 0.682353, 0, 1,
-1.142003, 0.0231695, -0.5352557, 1, 0.6901961, 0, 1,
-1.138427, -0.1816353, -2.445271, 1, 0.6941177, 0, 1,
-1.132186, 1.888749, 1.494856, 1, 0.7019608, 0, 1,
-1.131023, 0.9961486, -1.486092, 1, 0.7098039, 0, 1,
-1.122563, -0.1433859, -2.295792, 1, 0.7137255, 0, 1,
-1.121895, -0.1396764, -2.086517, 1, 0.7215686, 0, 1,
-1.117818, 0.8915449, 0.2459487, 1, 0.7254902, 0, 1,
-1.110181, 0.8673642, -0.602375, 1, 0.7333333, 0, 1,
-1.11014, 0.922303, -0.180729, 1, 0.7372549, 0, 1,
-1.102764, -0.6057481, -1.288224, 1, 0.7450981, 0, 1,
-1.101198, 0.8666746, 0.509856, 1, 0.7490196, 0, 1,
-1.098462, -0.002575687, -0.8788487, 1, 0.7568628, 0, 1,
-1.095233, -0.985527, -2.676657, 1, 0.7607843, 0, 1,
-1.094267, -0.4669247, -4.256729, 1, 0.7686275, 0, 1,
-1.084006, 0.3460862, -2.125959, 1, 0.772549, 0, 1,
-1.082851, 0.953158, -2.233123, 1, 0.7803922, 0, 1,
-1.080314, -0.5123433, -1.660993, 1, 0.7843137, 0, 1,
-1.07578, -1.395427, -3.962894, 1, 0.7921569, 0, 1,
-1.075687, 1.341055, -0.194142, 1, 0.7960784, 0, 1,
-1.074875, 0.2376, -1.520015, 1, 0.8039216, 0, 1,
-1.072886, -0.2139047, -1.26443, 1, 0.8117647, 0, 1,
-1.071969, 0.6641529, -1.333287, 1, 0.8156863, 0, 1,
-1.065655, 3.030243, -0.2749129, 1, 0.8235294, 0, 1,
-1.047433, -0.2123077, -3.151906, 1, 0.827451, 0, 1,
-1.040341, 0.1330376, 0.9806876, 1, 0.8352941, 0, 1,
-1.033082, -0.3772657, -2.443524, 1, 0.8392157, 0, 1,
-1.03028, -0.065192, -1.035665, 1, 0.8470588, 0, 1,
-1.029289, -0.02871254, -2.13109, 1, 0.8509804, 0, 1,
-1.026479, 1.445115, -0.5076331, 1, 0.8588235, 0, 1,
-1.02446, -0.6829126, -1.893271, 1, 0.8627451, 0, 1,
-1.024011, 0.6652879, -0.9386144, 1, 0.8705882, 0, 1,
-1.023747, -1.142618, -2.690008, 1, 0.8745098, 0, 1,
-1.016263, 1.238911, -1.65013, 1, 0.8823529, 0, 1,
-1.012344, 1.706431, -0.1665031, 1, 0.8862745, 0, 1,
-1.010801, -0.2100039, -1.496823, 1, 0.8941177, 0, 1,
-1.010253, -0.1301847, -0.8291413, 1, 0.8980392, 0, 1,
-1.004691, -2.250317, -2.829994, 1, 0.9058824, 0, 1,
-1.004615, 0.3204176, -2.185814, 1, 0.9137255, 0, 1,
-0.999496, 0.3896661, -1.250201, 1, 0.9176471, 0, 1,
-0.99629, 1.690717, 0.4524474, 1, 0.9254902, 0, 1,
-0.9928136, 1.352738, -0.4630983, 1, 0.9294118, 0, 1,
-0.9843563, 0.864651, -0.6844994, 1, 0.9372549, 0, 1,
-0.9764818, -0.9813557, -1.059536, 1, 0.9411765, 0, 1,
-0.9651233, 0.6673407, 0.03548092, 1, 0.9490196, 0, 1,
-0.9553973, -0.9232815, -3.426876, 1, 0.9529412, 0, 1,
-0.9548137, 0.04536448, -0.2877617, 1, 0.9607843, 0, 1,
-0.9478639, 1.56034, 0.9591443, 1, 0.9647059, 0, 1,
-0.9449017, -0.5167358, -2.062302, 1, 0.972549, 0, 1,
-0.9412595, -0.03439245, -2.1581, 1, 0.9764706, 0, 1,
-0.9402949, -0.7527067, -2.740198, 1, 0.9843137, 0, 1,
-0.9386479, -1.763956, -2.68764, 1, 0.9882353, 0, 1,
-0.9365963, 0.7257836, -1.921161, 1, 0.9960784, 0, 1,
-0.9344251, 0.1713943, -1.467044, 0.9960784, 1, 0, 1,
-0.9264066, 0.357301, 0.317058, 0.9921569, 1, 0, 1,
-0.9214612, -1.317335, -3.02907, 0.9843137, 1, 0, 1,
-0.9213445, 0.8213078, -1.090167, 0.9803922, 1, 0, 1,
-0.9088505, -0.8772246, -1.871378, 0.972549, 1, 0, 1,
-0.903717, -0.727089, -2.579751, 0.9686275, 1, 0, 1,
-0.8971059, 0.5430633, -2.237982, 0.9607843, 1, 0, 1,
-0.8947209, -0.02943616, -1.536871, 0.9568627, 1, 0, 1,
-0.8925137, 1.84091, -0.6055254, 0.9490196, 1, 0, 1,
-0.8851783, 0.541241, -1.675126, 0.945098, 1, 0, 1,
-0.8846012, -0.5241235, -2.788888, 0.9372549, 1, 0, 1,
-0.8816436, -1.16867, -4.201491, 0.9333333, 1, 0, 1,
-0.8757164, 0.4848301, -1.776435, 0.9254902, 1, 0, 1,
-0.8734311, 0.07880226, -1.626086, 0.9215686, 1, 0, 1,
-0.8728406, -2.246289, -3.510757, 0.9137255, 1, 0, 1,
-0.8727013, -0.8031642, -2.701751, 0.9098039, 1, 0, 1,
-0.8605464, -0.3201023, -3.192208, 0.9019608, 1, 0, 1,
-0.857383, 1.158937, 0.05432764, 0.8941177, 1, 0, 1,
-0.856641, -0.1335154, -3.307353, 0.8901961, 1, 0, 1,
-0.8547763, 0.8400291, -0.7471931, 0.8823529, 1, 0, 1,
-0.8540255, -1.254285, -3.001048, 0.8784314, 1, 0, 1,
-0.8527492, 0.5007923, -1.816732, 0.8705882, 1, 0, 1,
-0.8524224, 0.8540845, -2.004183, 0.8666667, 1, 0, 1,
-0.8510246, -0.3652867, -2.154599, 0.8588235, 1, 0, 1,
-0.8499925, 1.165442, 0.3447038, 0.854902, 1, 0, 1,
-0.8490863, -0.3148784, -2.671676, 0.8470588, 1, 0, 1,
-0.8445565, 1.405703, -2.074445, 0.8431373, 1, 0, 1,
-0.8437856, -0.8736638, -2.883813, 0.8352941, 1, 0, 1,
-0.8429155, -0.3499224, -4.112739, 0.8313726, 1, 0, 1,
-0.8428072, -1.424503, -2.502678, 0.8235294, 1, 0, 1,
-0.8332393, -1.395285, -3.918552, 0.8196079, 1, 0, 1,
-0.830884, -0.7918248, -2.775722, 0.8117647, 1, 0, 1,
-0.8243033, -0.2902909, -1.994638, 0.8078431, 1, 0, 1,
-0.8155155, 0.6317487, -2.046776, 0.8, 1, 0, 1,
-0.8133719, -0.8365842, -2.817728, 0.7921569, 1, 0, 1,
-0.8094604, -0.2460343, -3.863921, 0.7882353, 1, 0, 1,
-0.8064936, 1.451484, -1.424637, 0.7803922, 1, 0, 1,
-0.803289, 0.2931689, -0.7995638, 0.7764706, 1, 0, 1,
-0.7995758, -1.112637, -1.225256, 0.7686275, 1, 0, 1,
-0.7938438, -1.355729, -1.661547, 0.7647059, 1, 0, 1,
-0.792365, 0.2099609, 0.2210426, 0.7568628, 1, 0, 1,
-0.791257, 0.3709523, 0.4045774, 0.7529412, 1, 0, 1,
-0.790944, 1.083524, -2.908222, 0.7450981, 1, 0, 1,
-0.7833242, -0.5720708, -4.356616, 0.7411765, 1, 0, 1,
-0.7794883, 0.05145657, -1.221259, 0.7333333, 1, 0, 1,
-0.7723925, -0.8329199, -1.081661, 0.7294118, 1, 0, 1,
-0.7662004, -0.3501491, 0.2858086, 0.7215686, 1, 0, 1,
-0.7612879, 0.890323, 0.5169271, 0.7176471, 1, 0, 1,
-0.7609785, 0.7169745, -2.239976, 0.7098039, 1, 0, 1,
-0.7579521, -0.1168609, -2.070411, 0.7058824, 1, 0, 1,
-0.7569472, 0.8111413, -1.862273, 0.6980392, 1, 0, 1,
-0.7566441, 0.5777444, -1.293486, 0.6901961, 1, 0, 1,
-0.7565532, 0.2338173, -1.506948, 0.6862745, 1, 0, 1,
-0.7462391, 1.16706, 0.4286201, 0.6784314, 1, 0, 1,
-0.7436509, -1.091852, -2.462823, 0.6745098, 1, 0, 1,
-0.7282804, -2.469479, -4.434454, 0.6666667, 1, 0, 1,
-0.7275875, 1.330287, -0.1494011, 0.6627451, 1, 0, 1,
-0.7271762, -0.1366683, -3.248947, 0.654902, 1, 0, 1,
-0.7268412, -1.033973, -2.424171, 0.6509804, 1, 0, 1,
-0.7250305, 0.3003393, -2.070513, 0.6431373, 1, 0, 1,
-0.7158084, -0.2983933, -1.175658, 0.6392157, 1, 0, 1,
-0.7136386, 1.112533, -0.008010537, 0.6313726, 1, 0, 1,
-0.7118263, -0.5095429, -1.891775, 0.627451, 1, 0, 1,
-0.7114433, 0.05915545, -1.164652, 0.6196079, 1, 0, 1,
-0.7092013, -0.8639055, -2.437926, 0.6156863, 1, 0, 1,
-0.7086875, -0.2960752, -0.6197745, 0.6078432, 1, 0, 1,
-0.7085207, -0.4117858, -1.846551, 0.6039216, 1, 0, 1,
-0.7077814, 0.8593435, -0.5631876, 0.5960785, 1, 0, 1,
-0.7067192, -0.1696865, -3.481661, 0.5882353, 1, 0, 1,
-0.7025794, 0.8490107, -0.1224017, 0.5843138, 1, 0, 1,
-0.7024391, -0.5661889, -1.608318, 0.5764706, 1, 0, 1,
-0.7007212, 0.2506766, -2.068328, 0.572549, 1, 0, 1,
-0.6999177, 0.2698188, 0.345374, 0.5647059, 1, 0, 1,
-0.6967679, 0.9188246, -1.70463, 0.5607843, 1, 0, 1,
-0.6959652, -0.5086242, -2.385414, 0.5529412, 1, 0, 1,
-0.6953744, -1.157494, -2.278148, 0.5490196, 1, 0, 1,
-0.6924219, -0.06659809, -0.8227404, 0.5411765, 1, 0, 1,
-0.6888495, -0.8565046, -2.282763, 0.5372549, 1, 0, 1,
-0.681711, 0.1802626, -0.8851432, 0.5294118, 1, 0, 1,
-0.6797562, -1.540751, -1.41016, 0.5254902, 1, 0, 1,
-0.6774369, -0.01197976, -1.82535, 0.5176471, 1, 0, 1,
-0.6727119, 1.241193, -1.62924, 0.5137255, 1, 0, 1,
-0.6721997, -0.6672103, -3.564041, 0.5058824, 1, 0, 1,
-0.6713414, -0.3406523, -2.924114, 0.5019608, 1, 0, 1,
-0.6693818, -0.7700768, -2.813115, 0.4941176, 1, 0, 1,
-0.6650959, -0.7770932, -2.670878, 0.4862745, 1, 0, 1,
-0.6602967, -0.7775508, -2.681558, 0.4823529, 1, 0, 1,
-0.6593786, 0.4838872, 0.2916305, 0.4745098, 1, 0, 1,
-0.6569834, 0.7396619, -1.62621, 0.4705882, 1, 0, 1,
-0.6513196, -1.112918, -3.919307, 0.4627451, 1, 0, 1,
-0.6438488, 1.346271, -0.9726817, 0.4588235, 1, 0, 1,
-0.6367578, 0.3724715, -1.522811, 0.4509804, 1, 0, 1,
-0.627454, -0.1545766, -0.4012156, 0.4470588, 1, 0, 1,
-0.6272104, 1.009254, -0.8881149, 0.4392157, 1, 0, 1,
-0.6233752, -0.5416298, -5.13485, 0.4352941, 1, 0, 1,
-0.6216449, -0.6623686, -3.383998, 0.427451, 1, 0, 1,
-0.6164181, -1.304198, -3.290941, 0.4235294, 1, 0, 1,
-0.6131644, 0.3548356, -2.184964, 0.4156863, 1, 0, 1,
-0.6110086, -0.2776316, -1.523865, 0.4117647, 1, 0, 1,
-0.5979686, 1.139454, 0.7940597, 0.4039216, 1, 0, 1,
-0.5920219, -0.7649035, -3.154716, 0.3960784, 1, 0, 1,
-0.5918553, -0.4732765, -2.122423, 0.3921569, 1, 0, 1,
-0.5901462, -0.9007909, -0.9425346, 0.3843137, 1, 0, 1,
-0.5866249, 0.4321837, -1.205334, 0.3803922, 1, 0, 1,
-0.5863867, -0.5154142, -1.560053, 0.372549, 1, 0, 1,
-0.5842905, -0.3073063, -1.996801, 0.3686275, 1, 0, 1,
-0.5839444, 0.1801836, -1.076946, 0.3607843, 1, 0, 1,
-0.5791888, 0.9770043, -1.174994, 0.3568628, 1, 0, 1,
-0.5757132, -1.287644, -2.45753, 0.3490196, 1, 0, 1,
-0.57456, -0.7487094, -1.672677, 0.345098, 1, 0, 1,
-0.5745404, -0.8774167, -3.402848, 0.3372549, 1, 0, 1,
-0.5722752, -0.505627, -2.147027, 0.3333333, 1, 0, 1,
-0.5720437, 0.3912911, -1.392239, 0.3254902, 1, 0, 1,
-0.5687066, -0.5193185, -2.087351, 0.3215686, 1, 0, 1,
-0.5680003, -1.071463, -4.704481, 0.3137255, 1, 0, 1,
-0.5668066, -0.447987, -1.38281, 0.3098039, 1, 0, 1,
-0.5604695, -0.7360808, -1.105232, 0.3019608, 1, 0, 1,
-0.5542985, -0.5403586, -1.698258, 0.2941177, 1, 0, 1,
-0.551693, 1.145987, -0.08499505, 0.2901961, 1, 0, 1,
-0.5454673, -1.74832, -2.813792, 0.282353, 1, 0, 1,
-0.5341945, 2.130452, 1.095624, 0.2784314, 1, 0, 1,
-0.5326493, 1.3432, -1.362075, 0.2705882, 1, 0, 1,
-0.5306917, -1.747376, -1.555994, 0.2666667, 1, 0, 1,
-0.5265521, -0.7032774, -2.805664, 0.2588235, 1, 0, 1,
-0.5261843, -0.1616001, -3.004651, 0.254902, 1, 0, 1,
-0.5233077, 1.50676, -1.497185, 0.2470588, 1, 0, 1,
-0.5209406, -1.485558, -3.314231, 0.2431373, 1, 0, 1,
-0.519115, -0.2196679, -2.209347, 0.2352941, 1, 0, 1,
-0.5189993, 0.2311822, -0.3709165, 0.2313726, 1, 0, 1,
-0.5182015, -2.900074, -2.799298, 0.2235294, 1, 0, 1,
-0.513959, -1.507316, -2.573789, 0.2196078, 1, 0, 1,
-0.5135062, -0.3686696, -1.322624, 0.2117647, 1, 0, 1,
-0.5117565, 0.08233742, -0.3489382, 0.2078431, 1, 0, 1,
-0.5085006, 1.679595, 1.511226, 0.2, 1, 0, 1,
-0.5062862, 0.7520763, -0.71828, 0.1921569, 1, 0, 1,
-0.5062526, -0.4552218, -2.087108, 0.1882353, 1, 0, 1,
-0.5057807, 0.01362773, -3.510995, 0.1803922, 1, 0, 1,
-0.5047383, 0.2255605, -0.6167076, 0.1764706, 1, 0, 1,
-0.5005394, 1.214154, 0.8760351, 0.1686275, 1, 0, 1,
-0.4899069, -0.9940801, -2.208482, 0.1647059, 1, 0, 1,
-0.4886063, -0.2698187, -2.694461, 0.1568628, 1, 0, 1,
-0.4875132, -1.160735, -0.2380813, 0.1529412, 1, 0, 1,
-0.4834338, 0.3280253, -0.1510052, 0.145098, 1, 0, 1,
-0.4787662, -1.001837, -2.652802, 0.1411765, 1, 0, 1,
-0.4775679, 0.2800736, -0.5824536, 0.1333333, 1, 0, 1,
-0.4748941, 1.768801, -2.938632, 0.1294118, 1, 0, 1,
-0.4739764, 1.337296, -1.940969, 0.1215686, 1, 0, 1,
-0.4601521, 0.6331417, -2.105979, 0.1176471, 1, 0, 1,
-0.4502144, 0.3652174, -0.4262996, 0.1098039, 1, 0, 1,
-0.446689, -0.812384, -3.564235, 0.1058824, 1, 0, 1,
-0.4460612, -0.5463232, -5.027737, 0.09803922, 1, 0, 1,
-0.4429635, 0.6824338, -2.482997, 0.09019608, 1, 0, 1,
-0.4388129, 0.6065083, -0.2732503, 0.08627451, 1, 0, 1,
-0.4342544, -1.165227, -1.342928, 0.07843138, 1, 0, 1,
-0.433615, -0.373555, -0.9374508, 0.07450981, 1, 0, 1,
-0.4302188, -1.053804, -1.424375, 0.06666667, 1, 0, 1,
-0.4271268, -0.3036014, -1.251431, 0.0627451, 1, 0, 1,
-0.4208424, 0.4303462, -1.241778, 0.05490196, 1, 0, 1,
-0.4195465, 1.093396, -0.9565245, 0.05098039, 1, 0, 1,
-0.419466, 0.1745006, -0.9800484, 0.04313726, 1, 0, 1,
-0.4174123, 0.07561151, -2.184257, 0.03921569, 1, 0, 1,
-0.4140179, -0.9362047, -2.627407, 0.03137255, 1, 0, 1,
-0.4137019, -0.1340321, -2.321665, 0.02745098, 1, 0, 1,
-0.410907, -1.61855, -1.735027, 0.01960784, 1, 0, 1,
-0.4101541, 1.384889, 0.78657, 0.01568628, 1, 0, 1,
-0.408667, 1.012968, -1.072011, 0.007843138, 1, 0, 1,
-0.405647, -0.3250492, -3.376857, 0.003921569, 1, 0, 1,
-0.4006952, 1.476035, -2.333818, 0, 1, 0.003921569, 1,
-0.399062, 2.15713, 1.132518, 0, 1, 0.01176471, 1,
-0.3971612, 1.227787, 0.4237392, 0, 1, 0.01568628, 1,
-0.3956062, 1.119936, -0.5243059, 0, 1, 0.02352941, 1,
-0.3935378, 1.013099, 0.3384857, 0, 1, 0.02745098, 1,
-0.3865364, -0.685031, -2.93839, 0, 1, 0.03529412, 1,
-0.3836711, -0.4981898, -1.772481, 0, 1, 0.03921569, 1,
-0.3831568, -0.3240863, -2.673563, 0, 1, 0.04705882, 1,
-0.3813803, 0.9706872, -1.80868, 0, 1, 0.05098039, 1,
-0.3798319, 0.2302396, -2.06371, 0, 1, 0.05882353, 1,
-0.3796822, -0.08577071, -1.792923, 0, 1, 0.0627451, 1,
-0.3682041, -1.334065, -2.898508, 0, 1, 0.07058824, 1,
-0.3678867, 1.995761, 1.013006, 0, 1, 0.07450981, 1,
-0.3553649, 1.181936, 1.237716, 0, 1, 0.08235294, 1,
-0.3496675, -0.005634364, 0.7479221, 0, 1, 0.08627451, 1,
-0.3470664, -0.1292829, -2.263126, 0, 1, 0.09411765, 1,
-0.3465414, -0.9039135, -1.693417, 0, 1, 0.1019608, 1,
-0.3451357, -1.062401, -4.991889, 0, 1, 0.1058824, 1,
-0.3384043, -0.4214886, -2.529964, 0, 1, 0.1137255, 1,
-0.3360778, -1.137015, -3.485543, 0, 1, 0.1176471, 1,
-0.335941, -0.6646777, -2.534067, 0, 1, 0.1254902, 1,
-0.3350963, 1.631386, 0.5556266, 0, 1, 0.1294118, 1,
-0.3332592, 1.45622, -1.247914, 0, 1, 0.1372549, 1,
-0.3299097, -0.7895558, -1.107605, 0, 1, 0.1411765, 1,
-0.3270253, -1.050428, -3.13932, 0, 1, 0.1490196, 1,
-0.3238449, -0.6667575, -2.331123, 0, 1, 0.1529412, 1,
-0.3237168, 0.5381206, -0.4703528, 0, 1, 0.1607843, 1,
-0.3228963, 1.652232, -0.5724222, 0, 1, 0.1647059, 1,
-0.322529, -0.7965298, -2.187509, 0, 1, 0.172549, 1,
-0.3217797, -0.1367863, -3.367804, 0, 1, 0.1764706, 1,
-0.3208837, 0.003339826, -0.3614878, 0, 1, 0.1843137, 1,
-0.3208625, 0.01339633, -2.127723, 0, 1, 0.1882353, 1,
-0.3193855, 0.9244615, -0.9734583, 0, 1, 0.1960784, 1,
-0.3171111, 0.61352, -0.9120539, 0, 1, 0.2039216, 1,
-0.3171058, 1.253426, -0.229022, 0, 1, 0.2078431, 1,
-0.3167981, 0.2591949, 0.3650833, 0, 1, 0.2156863, 1,
-0.3154997, -1.684606, -3.461015, 0, 1, 0.2196078, 1,
-0.3112896, 1.071191, 1.294834, 0, 1, 0.227451, 1,
-0.3095857, 0.6851337, -0.1419676, 0, 1, 0.2313726, 1,
-0.3078971, 0.3329256, 1.313731, 0, 1, 0.2392157, 1,
-0.3062989, 0.2962555, -0.5577151, 0, 1, 0.2431373, 1,
-0.3024548, -0.1426376, -1.433068, 0, 1, 0.2509804, 1,
-0.2970084, 1.318141, -0.3489754, 0, 1, 0.254902, 1,
-0.2941928, 2.443059, 0.2331236, 0, 1, 0.2627451, 1,
-0.2927668, -0.7932085, -0.6756275, 0, 1, 0.2666667, 1,
-0.2922342, -0.09379353, -0.5261663, 0, 1, 0.2745098, 1,
-0.287839, 1.126866, 1.317161, 0, 1, 0.2784314, 1,
-0.2792988, -1.354228, -2.789431, 0, 1, 0.2862745, 1,
-0.2747134, 0.1419859, -1.089622, 0, 1, 0.2901961, 1,
-0.2682508, -0.7565022, -3.020008, 0, 1, 0.2980392, 1,
-0.2674721, -0.2236789, -3.390835, 0, 1, 0.3058824, 1,
-0.2655905, -0.3168175, -2.322797, 0, 1, 0.3098039, 1,
-0.261897, 0.6647875, 0.7061769, 0, 1, 0.3176471, 1,
-0.2567978, 0.1418183, -0.2752903, 0, 1, 0.3215686, 1,
-0.2534957, 0.2206395, -0.9363736, 0, 1, 0.3294118, 1,
-0.2479669, -2.140996, -2.244548, 0, 1, 0.3333333, 1,
-0.2442186, 0.8305997, 0.05680863, 0, 1, 0.3411765, 1,
-0.2416206, -0.1965118, -2.078538, 0, 1, 0.345098, 1,
-0.2410864, 0.769303, 0.8614138, 0, 1, 0.3529412, 1,
-0.2410536, -0.6602047, -2.681767, 0, 1, 0.3568628, 1,
-0.2394879, 1.687069, 0.04240028, 0, 1, 0.3647059, 1,
-0.2387013, 0.06724333, -1.567035, 0, 1, 0.3686275, 1,
-0.2325057, 0.7032049, 0.4332219, 0, 1, 0.3764706, 1,
-0.2324861, -0.5616785, -4.131727, 0, 1, 0.3803922, 1,
-0.2297535, -0.35398, -2.095309, 0, 1, 0.3882353, 1,
-0.2261293, -0.651593, -1.591927, 0, 1, 0.3921569, 1,
-0.2234603, -0.4033381, -2.608621, 0, 1, 0.4, 1,
-0.2218739, -0.01314697, -2.232245, 0, 1, 0.4078431, 1,
-0.2213553, -1.793063, -5.714012, 0, 1, 0.4117647, 1,
-0.2158274, 0.2571522, -2.871744, 0, 1, 0.4196078, 1,
-0.2148616, 0.2177775, -2.131342, 0, 1, 0.4235294, 1,
-0.2108397, -1.633285, -4.082166, 0, 1, 0.4313726, 1,
-0.208264, 0.07815377, -0.5492755, 0, 1, 0.4352941, 1,
-0.2068005, -0.01282832, -2.149492, 0, 1, 0.4431373, 1,
-0.201182, -0.01244302, -1.974976, 0, 1, 0.4470588, 1,
-0.2010854, 2.147306, 0.7410291, 0, 1, 0.454902, 1,
-0.1993833, 0.3002743, -0.3875723, 0, 1, 0.4588235, 1,
-0.1979995, -2.208426, -2.883514, 0, 1, 0.4666667, 1,
-0.1937036, 0.445118, -0.4549819, 0, 1, 0.4705882, 1,
-0.1925063, -1.268374, -3.110806, 0, 1, 0.4784314, 1,
-0.1914546, 0.6383179, 0.6388753, 0, 1, 0.4823529, 1,
-0.1842978, -0.1103886, -1.307509, 0, 1, 0.4901961, 1,
-0.1830211, 1.595627, 0.06212704, 0, 1, 0.4941176, 1,
-0.1829016, -1.284059, -4.027284, 0, 1, 0.5019608, 1,
-0.1817338, -0.5424584, -2.915567, 0, 1, 0.509804, 1,
-0.1817257, 0.2893057, -1.387275, 0, 1, 0.5137255, 1,
-0.1791854, 0.441969, 0.07915163, 0, 1, 0.5215687, 1,
-0.17611, 0.5129065, -2.61938, 0, 1, 0.5254902, 1,
-0.1697008, 0.2782663, 0.2515757, 0, 1, 0.5333334, 1,
-0.1685565, 2.048044, -1.004187, 0, 1, 0.5372549, 1,
-0.1681208, 0.496314, 1.290218, 0, 1, 0.5450981, 1,
-0.1638328, 0.2508745, 0.2132557, 0, 1, 0.5490196, 1,
-0.1626135, 0.3989432, -0.7893233, 0, 1, 0.5568628, 1,
-0.1592765, -0.9232016, -2.888163, 0, 1, 0.5607843, 1,
-0.1582999, -0.8671697, -2.147187, 0, 1, 0.5686275, 1,
-0.1570682, 0.09234559, -1.831936, 0, 1, 0.572549, 1,
-0.1559467, -2.678078, -2.587548, 0, 1, 0.5803922, 1,
-0.1539276, -0.09851029, -1.696283, 0, 1, 0.5843138, 1,
-0.1458883, 1.251857, 2.553223, 0, 1, 0.5921569, 1,
-0.1451513, 1.71426, -0.7247494, 0, 1, 0.5960785, 1,
-0.1390855, 1.288972, -0.2651701, 0, 1, 0.6039216, 1,
-0.1372921, 0.9957629, -0.4229147, 0, 1, 0.6117647, 1,
-0.1349152, 0.5116693, -0.02232895, 0, 1, 0.6156863, 1,
-0.1318704, 1.529699, -0.4642068, 0, 1, 0.6235294, 1,
-0.1314452, 0.04621366, -3.274342, 0, 1, 0.627451, 1,
-0.1300737, -0.1060525, -2.28127, 0, 1, 0.6352941, 1,
-0.1297364, -0.4823529, -2.470051, 0, 1, 0.6392157, 1,
-0.127639, -1.241269, -2.762363, 0, 1, 0.6470588, 1,
-0.1242567, -0.9082333, -4.880377, 0, 1, 0.6509804, 1,
-0.122672, -0.232799, -3.741731, 0, 1, 0.6588235, 1,
-0.1220766, -0.10651, -1.973628, 0, 1, 0.6627451, 1,
-0.1103171, 1.621421, -1.226757, 0, 1, 0.6705883, 1,
-0.1086913, 0.8413327, -0.6196156, 0, 1, 0.6745098, 1,
-0.1080628, -0.03364411, -2.194041, 0, 1, 0.682353, 1,
-0.1041278, 0.7635894, 0.4648466, 0, 1, 0.6862745, 1,
-0.1018775, 0.619554, -0.852605, 0, 1, 0.6941177, 1,
-0.1016436, -1.605499, -1.777162, 0, 1, 0.7019608, 1,
-0.1012067, -0.677029, -2.357404, 0, 1, 0.7058824, 1,
-0.09803206, -0.9638144, -3.615229, 0, 1, 0.7137255, 1,
-0.09702603, 0.6921848, -1.851685, 0, 1, 0.7176471, 1,
-0.09600327, -0.6150395, -3.330684, 0, 1, 0.7254902, 1,
-0.09250411, -0.3727364, -1.269107, 0, 1, 0.7294118, 1,
-0.09161586, 1.390869, -0.8921546, 0, 1, 0.7372549, 1,
-0.08979405, 0.2609906, 0.3710247, 0, 1, 0.7411765, 1,
-0.0827755, 1.518194, 0.3295188, 0, 1, 0.7490196, 1,
-0.08275834, 0.09382234, -0.8322929, 0, 1, 0.7529412, 1,
-0.08111078, 0.2865285, -0.08432075, 0, 1, 0.7607843, 1,
-0.07993712, 1.159577, 0.7148728, 0, 1, 0.7647059, 1,
-0.07811967, 0.5372232, 1.050602, 0, 1, 0.772549, 1,
-0.07704527, 0.5160129, -1.312388, 0, 1, 0.7764706, 1,
-0.06261913, 0.6785862, -1.54504, 0, 1, 0.7843137, 1,
-0.05858989, 0.7636613, 0.7523384, 0, 1, 0.7882353, 1,
-0.05804483, -0.9124663, -4.966413, 0, 1, 0.7960784, 1,
-0.05634071, -1.812504, -2.509236, 0, 1, 0.8039216, 1,
-0.05556024, -0.19575, -3.632478, 0, 1, 0.8078431, 1,
-0.04850521, 0.8709238, 0.7039894, 0, 1, 0.8156863, 1,
-0.04422598, 1.112214, -1.253694, 0, 1, 0.8196079, 1,
-0.04372754, 0.4787984, -1.205951, 0, 1, 0.827451, 1,
-0.04359588, -0.4632164, -0.0407665, 0, 1, 0.8313726, 1,
-0.03907589, 0.558769, 0.7773484, 0, 1, 0.8392157, 1,
-0.03308574, 0.0005477509, 0.2769984, 0, 1, 0.8431373, 1,
-0.03168727, -0.5690058, -2.969423, 0, 1, 0.8509804, 1,
-0.02696139, -0.1932046, -3.723914, 0, 1, 0.854902, 1,
-0.02503087, 0.9773728, -1.537504, 0, 1, 0.8627451, 1,
-0.02362813, 1.109228, -1.080151, 0, 1, 0.8666667, 1,
-0.01986475, 0.5377917, 1.657422, 0, 1, 0.8745098, 1,
-0.01268541, -0.1943284, -2.727399, 0, 1, 0.8784314, 1,
-0.008360382, 0.2405907, 0.1911692, 0, 1, 0.8862745, 1,
-0.005567139, -0.6848003, -2.59093, 0, 1, 0.8901961, 1,
-0.004252188, -0.4119627, -1.325753, 0, 1, 0.8980392, 1,
-0.00332773, 0.3132868, 0.5825184, 0, 1, 0.9058824, 1,
-0.003162164, -1.541932, -2.851771, 0, 1, 0.9098039, 1,
0.00911066, -0.09777294, 2.460393, 0, 1, 0.9176471, 1,
0.009789781, -0.01538621, 2.550185, 0, 1, 0.9215686, 1,
0.01123884, -1.311557, 2.811999, 0, 1, 0.9294118, 1,
0.01406651, 1.624141, 0.6720757, 0, 1, 0.9333333, 1,
0.01556264, 0.03125018, 0.4656772, 0, 1, 0.9411765, 1,
0.01790068, 1.039593, -0.1463774, 0, 1, 0.945098, 1,
0.02082041, 0.3478022, -0.006814334, 0, 1, 0.9529412, 1,
0.02135485, 1.32607, -0.4165009, 0, 1, 0.9568627, 1,
0.02850454, -2.015943, 1.980676, 0, 1, 0.9647059, 1,
0.02881315, 0.008864415, 1.719416, 0, 1, 0.9686275, 1,
0.02910241, -1.156249, 3.86117, 0, 1, 0.9764706, 1,
0.03203981, -1.542475, 3.56238, 0, 1, 0.9803922, 1,
0.03475938, 0.4831908, 0.5315561, 0, 1, 0.9882353, 1,
0.03701338, -0.7374712, 3.920048, 0, 1, 0.9921569, 1,
0.0383977, 2.164109, -1.27325, 0, 1, 1, 1,
0.0403618, 1.954005, -0.9680147, 0, 0.9921569, 1, 1,
0.05294525, 1.000965, 0.7241654, 0, 0.9882353, 1, 1,
0.0588146, -0.1975274, 4.509246, 0, 0.9803922, 1, 1,
0.05940604, 1.144009, 1.362913, 0, 0.9764706, 1, 1,
0.05941226, -0.8829783, 4.407626, 0, 0.9686275, 1, 1,
0.05986902, -0.09987734, 4.439213, 0, 0.9647059, 1, 1,
0.06068308, 0.7119093, 0.8104095, 0, 0.9568627, 1, 1,
0.06854962, -0.5574428, 2.197604, 0, 0.9529412, 1, 1,
0.06923623, 0.7478809, -0.3614429, 0, 0.945098, 1, 1,
0.06944259, -2.682126, 3.310738, 0, 0.9411765, 1, 1,
0.07022389, 0.4650847, 0.3715366, 0, 0.9333333, 1, 1,
0.07110067, 1.120503, 0.08320998, 0, 0.9294118, 1, 1,
0.0713538, -0.4563866, 2.279645, 0, 0.9215686, 1, 1,
0.07194293, -0.2987777, 3.539681, 0, 0.9176471, 1, 1,
0.07498899, -0.04653139, 1.549422, 0, 0.9098039, 1, 1,
0.07673497, -0.02350989, 1.858991, 0, 0.9058824, 1, 1,
0.07847469, 0.1621815, 0.1703122, 0, 0.8980392, 1, 1,
0.08299351, -1.059748, 0.7212173, 0, 0.8901961, 1, 1,
0.08320541, 0.08436979, 0.2732113, 0, 0.8862745, 1, 1,
0.08373944, -0.4977379, 3.230029, 0, 0.8784314, 1, 1,
0.08594623, -0.1390048, 2.505654, 0, 0.8745098, 1, 1,
0.08938166, 0.38663, 0.2254724, 0, 0.8666667, 1, 1,
0.09100172, -0.03479437, 3.454202, 0, 0.8627451, 1, 1,
0.09105486, -0.7765292, 1.328784, 0, 0.854902, 1, 1,
0.09299504, -0.4252252, 2.972084, 0, 0.8509804, 1, 1,
0.09586321, 0.1297945, 0.9518403, 0, 0.8431373, 1, 1,
0.09728676, 0.6398373, -1.569104, 0, 0.8392157, 1, 1,
0.09998556, 0.7316528, -0.2501487, 0, 0.8313726, 1, 1,
0.1009502, 0.1985956, -1.959383, 0, 0.827451, 1, 1,
0.1024674, -1.731069, 2.4414, 0, 0.8196079, 1, 1,
0.1037947, -0.2973333, 3.187473, 0, 0.8156863, 1, 1,
0.1077242, -0.24415, 1.253636, 0, 0.8078431, 1, 1,
0.110596, 3.132207, -0.3195831, 0, 0.8039216, 1, 1,
0.1158351, -0.65072, 3.554433, 0, 0.7960784, 1, 1,
0.1159925, 0.1075316, -0.4124999, 0, 0.7882353, 1, 1,
0.1170408, 0.6325209, 0.9053257, 0, 0.7843137, 1, 1,
0.1190318, 0.8282372, 0.5058959, 0, 0.7764706, 1, 1,
0.1229449, 0.7937702, 0.6779763, 0, 0.772549, 1, 1,
0.1356528, 1.474769, -1.184197, 0, 0.7647059, 1, 1,
0.1381034, 0.8435274, 0.732145, 0, 0.7607843, 1, 1,
0.1394982, 0.1487854, 1.075544, 0, 0.7529412, 1, 1,
0.1403973, 0.9230518, 1.168194, 0, 0.7490196, 1, 1,
0.144116, 0.1179496, 0.3636616, 0, 0.7411765, 1, 1,
0.1504925, 0.03353576, 0.3223951, 0, 0.7372549, 1, 1,
0.1542623, -1.196864, 4.253746, 0, 0.7294118, 1, 1,
0.1593887, -0.8797342, 3.630749, 0, 0.7254902, 1, 1,
0.1609089, 1.876106, -0.05264641, 0, 0.7176471, 1, 1,
0.1628221, -1.203757, 1.441884, 0, 0.7137255, 1, 1,
0.1645588, -0.156686, 2.492588, 0, 0.7058824, 1, 1,
0.1658036, -0.1864939, 1.012282, 0, 0.6980392, 1, 1,
0.1665469, 0.4447103, 0.6674318, 0, 0.6941177, 1, 1,
0.1674688, 0.7434199, 2.673658, 0, 0.6862745, 1, 1,
0.1718947, -0.08187184, 1.813765, 0, 0.682353, 1, 1,
0.1728551, -0.408102, 2.575484, 0, 0.6745098, 1, 1,
0.1765099, 0.1229587, 2.658678, 0, 0.6705883, 1, 1,
0.1798388, -0.7104033, 3.194719, 0, 0.6627451, 1, 1,
0.1809742, 0.2046497, 0.7915781, 0, 0.6588235, 1, 1,
0.1821413, -0.2386729, 2.517278, 0, 0.6509804, 1, 1,
0.1867644, -1.470618, 2.7347, 0, 0.6470588, 1, 1,
0.1883269, 0.4841115, 1.981295, 0, 0.6392157, 1, 1,
0.1932923, -2.028137, 3.080032, 0, 0.6352941, 1, 1,
0.1980879, -0.3411799, 1.512812, 0, 0.627451, 1, 1,
0.1995971, -1.095255, 3.17013, 0, 0.6235294, 1, 1,
0.2017678, -0.3222082, 5.119069, 0, 0.6156863, 1, 1,
0.2034489, -2.546514, 0.7370761, 0, 0.6117647, 1, 1,
0.2049037, 1.405469, 0.4098481, 0, 0.6039216, 1, 1,
0.208027, 0.1145528, 1.450361, 0, 0.5960785, 1, 1,
0.2087676, -1.137569, 4.012249, 0, 0.5921569, 1, 1,
0.2092884, -1.973993, 3.234598, 0, 0.5843138, 1, 1,
0.2126919, -1.45176, 3.666099, 0, 0.5803922, 1, 1,
0.2154977, -0.806957, 2.457581, 0, 0.572549, 1, 1,
0.2156866, 0.240496, 1.141535, 0, 0.5686275, 1, 1,
0.2170051, 2.980061, 0.8381243, 0, 0.5607843, 1, 1,
0.2203832, -0.545507, 2.538815, 0, 0.5568628, 1, 1,
0.2244671, 0.850696, -1.537465, 0, 0.5490196, 1, 1,
0.23352, -1.089689, 1.710036, 0, 0.5450981, 1, 1,
0.2342593, 1.189324, -1.600015, 0, 0.5372549, 1, 1,
0.2423325, 0.3409763, 2.253829, 0, 0.5333334, 1, 1,
0.2458559, 0.2596742, 1.219061, 0, 0.5254902, 1, 1,
0.2473474, 0.7777773, 0.2786476, 0, 0.5215687, 1, 1,
0.2477671, 0.8946787, -0.4423867, 0, 0.5137255, 1, 1,
0.2490115, -0.3905459, 2.819932, 0, 0.509804, 1, 1,
0.2495585, -1.544729, 2.788148, 0, 0.5019608, 1, 1,
0.2500615, -0.9061173, 2.704683, 0, 0.4941176, 1, 1,
0.2518137, 0.5842034, -0.5817413, 0, 0.4901961, 1, 1,
0.2523448, -1.163184, 2.787729, 0, 0.4823529, 1, 1,
0.2527539, 0.590643, 0.05442192, 0, 0.4784314, 1, 1,
0.2560531, -1.237895, 3.207701, 0, 0.4705882, 1, 1,
0.2570067, -0.1634924, 2.159739, 0, 0.4666667, 1, 1,
0.2574695, -0.7437451, 2.354455, 0, 0.4588235, 1, 1,
0.2574936, -0.7335999, 4.086729, 0, 0.454902, 1, 1,
0.2592076, -0.7697409, 2.598056, 0, 0.4470588, 1, 1,
0.2608409, 0.4900615, 0.5511286, 0, 0.4431373, 1, 1,
0.2608557, 1.597068, -0.2921373, 0, 0.4352941, 1, 1,
0.2676187, 0.1672539, 0.8315828, 0, 0.4313726, 1, 1,
0.2706834, -0.7725688, 3.41949, 0, 0.4235294, 1, 1,
0.275655, -0.1303364, 0.8569956, 0, 0.4196078, 1, 1,
0.2814179, -0.6039053, 0.7499118, 0, 0.4117647, 1, 1,
0.2825861, -1.796543, 2.567284, 0, 0.4078431, 1, 1,
0.2829936, 0.1707156, -0.4440961, 0, 0.4, 1, 1,
0.2848725, 2.364423, 0.2171803, 0, 0.3921569, 1, 1,
0.289015, -0.9272903, 3.211363, 0, 0.3882353, 1, 1,
0.2895411, -0.1650034, 2.207668, 0, 0.3803922, 1, 1,
0.2973206, 0.6733404, -0.1233276, 0, 0.3764706, 1, 1,
0.297923, -0.9370904, 3.367731, 0, 0.3686275, 1, 1,
0.2988133, 1.325927, -1.020819, 0, 0.3647059, 1, 1,
0.2998743, -0.1808647, 2.042331, 0, 0.3568628, 1, 1,
0.3010802, 1.847466, -1.00311, 0, 0.3529412, 1, 1,
0.302406, -1.140388, 2.674597, 0, 0.345098, 1, 1,
0.3058849, 1.119199, 0.7340682, 0, 0.3411765, 1, 1,
0.3199213, -0.411825, 3.835417, 0, 0.3333333, 1, 1,
0.3205022, -0.4776131, 2.736918, 0, 0.3294118, 1, 1,
0.3210142, -0.3504163, 2.873657, 0, 0.3215686, 1, 1,
0.3235586, -1.255631, 1.758286, 0, 0.3176471, 1, 1,
0.3269544, 1.004039, 0.7171331, 0, 0.3098039, 1, 1,
0.3363831, -1.501295, 2.344209, 0, 0.3058824, 1, 1,
0.3364158, 0.6786681, -0.2878198, 0, 0.2980392, 1, 1,
0.3428044, -1.788697, 3.969264, 0, 0.2901961, 1, 1,
0.3485304, -1.445117, 3.700185, 0, 0.2862745, 1, 1,
0.3501775, 1.101002, 0.8299401, 0, 0.2784314, 1, 1,
0.3514675, -0.6646351, 2.477631, 0, 0.2745098, 1, 1,
0.3528889, -0.3357346, 1.969221, 0, 0.2666667, 1, 1,
0.3532851, -0.4950592, 3.904492, 0, 0.2627451, 1, 1,
0.3533101, -0.662827, 3.559339, 0, 0.254902, 1, 1,
0.3564011, 0.4248002, 1.451577, 0, 0.2509804, 1, 1,
0.3595423, -1.900083, 3.227275, 0, 0.2431373, 1, 1,
0.3603504, -0.1558551, 1.59735, 0, 0.2392157, 1, 1,
0.3638283, -0.8506581, 2.624521, 0, 0.2313726, 1, 1,
0.3657888, -1.018872, 3.009309, 0, 0.227451, 1, 1,
0.3679284, 0.2935186, 0.2736886, 0, 0.2196078, 1, 1,
0.3695784, 0.7046127, 1.967951, 0, 0.2156863, 1, 1,
0.3700688, -1.086583, 2.26475, 0, 0.2078431, 1, 1,
0.3761574, -0.09441543, 1.362081, 0, 0.2039216, 1, 1,
0.380921, -0.9832523, 3.054848, 0, 0.1960784, 1, 1,
0.3829484, 1.957588, 0.9511325, 0, 0.1882353, 1, 1,
0.3851949, -0.3583922, 2.465843, 0, 0.1843137, 1, 1,
0.3887362, -0.393572, 3.166575, 0, 0.1764706, 1, 1,
0.3890988, -0.2976653, 2.06467, 0, 0.172549, 1, 1,
0.3897461, 0.9797105, 0.8993965, 0, 0.1647059, 1, 1,
0.3952405, -0.09395007, 2.052695, 0, 0.1607843, 1, 1,
0.4064302, -0.8968164, 1.451086, 0, 0.1529412, 1, 1,
0.4069147, 0.2427465, 1.588252, 0, 0.1490196, 1, 1,
0.4096983, 0.3957088, 1.040164, 0, 0.1411765, 1, 1,
0.4136643, -1.078999, 4.161526, 0, 0.1372549, 1, 1,
0.4258675, 0.159319, 1.928614, 0, 0.1294118, 1, 1,
0.426235, 0.4758545, -1.196566, 0, 0.1254902, 1, 1,
0.4407414, -1.058181, 2.838265, 0, 0.1176471, 1, 1,
0.4465515, 0.4938278, 1.490822, 0, 0.1137255, 1, 1,
0.4527235, -1.337923, 4.046093, 0, 0.1058824, 1, 1,
0.4531365, 0.4712921, 0.03729753, 0, 0.09803922, 1, 1,
0.4553272, -0.7289201, 2.855511, 0, 0.09411765, 1, 1,
0.4567713, -0.7564517, 3.531301, 0, 0.08627451, 1, 1,
0.4592348, -1.898476, 2.138769, 0, 0.08235294, 1, 1,
0.4612815, -0.3528472, 1.719413, 0, 0.07450981, 1, 1,
0.4619595, 0.9985547, -0.123928, 0, 0.07058824, 1, 1,
0.4657943, -0.5276626, 2.376516, 0, 0.0627451, 1, 1,
0.4661713, -0.5325374, 1.662338, 0, 0.05882353, 1, 1,
0.4673035, 0.2618119, -0.273613, 0, 0.05098039, 1, 1,
0.4690451, 1.498594, -0.4057779, 0, 0.04705882, 1, 1,
0.4703235, 1.893348, 0.6724494, 0, 0.03921569, 1, 1,
0.4711291, 2.276541, 0.08347975, 0, 0.03529412, 1, 1,
0.4733759, -0.9839656, 2.129936, 0, 0.02745098, 1, 1,
0.4775592, -0.08205012, 0.03935537, 0, 0.02352941, 1, 1,
0.4784586, 1.151159, 1.757186, 0, 0.01568628, 1, 1,
0.4798182, -0.9809934, 0.5324007, 0, 0.01176471, 1, 1,
0.4861883, -0.7565669, 1.667087, 0, 0.003921569, 1, 1,
0.4864602, -1.278662, 4.228591, 0.003921569, 0, 1, 1,
0.4887322, 0.7343192, 0.3031933, 0.007843138, 0, 1, 1,
0.4891862, 0.0994008, 1.699027, 0.01568628, 0, 1, 1,
0.4893277, 0.08045579, 0.8409534, 0.01960784, 0, 1, 1,
0.4908026, 0.1372572, -0.2581693, 0.02745098, 0, 1, 1,
0.4979437, 0.5289506, 0.3812191, 0.03137255, 0, 1, 1,
0.4979923, -0.01970406, 2.94435, 0.03921569, 0, 1, 1,
0.4995142, -1.396851, 2.475894, 0.04313726, 0, 1, 1,
0.5043026, -1.990551, 4.244362, 0.05098039, 0, 1, 1,
0.5043719, -1.032281, 1.845828, 0.05490196, 0, 1, 1,
0.5061808, -0.378233, 0.7748369, 0.0627451, 0, 1, 1,
0.5131064, -0.7432599, 2.461859, 0.06666667, 0, 1, 1,
0.5145016, -1.716407, 2.494707, 0.07450981, 0, 1, 1,
0.5180811, -0.4708886, 4.23154, 0.07843138, 0, 1, 1,
0.5188031, 0.7329766, 0.04154878, 0.08627451, 0, 1, 1,
0.5201083, -1.344518, 3.217274, 0.09019608, 0, 1, 1,
0.5209144, 0.7242294, -0.9812584, 0.09803922, 0, 1, 1,
0.5256661, 0.2899202, -0.5379275, 0.1058824, 0, 1, 1,
0.5310997, 1.413986, -0.1763534, 0.1098039, 0, 1, 1,
0.5314474, 0.9460824, 1.62652, 0.1176471, 0, 1, 1,
0.5343052, -0.1452082, 1.300049, 0.1215686, 0, 1, 1,
0.5344165, -0.2231433, 3.097581, 0.1294118, 0, 1, 1,
0.5380895, 0.4649234, 1.266708, 0.1333333, 0, 1, 1,
0.5401829, -1.042004, 2.82991, 0.1411765, 0, 1, 1,
0.5410339, -1.20007, 2.6216, 0.145098, 0, 1, 1,
0.5457147, 0.008661167, 0.8805629, 0.1529412, 0, 1, 1,
0.5458701, -0.5713026, 2.338874, 0.1568628, 0, 1, 1,
0.5469003, 0.6206514, 2.852085, 0.1647059, 0, 1, 1,
0.5483448, 0.2272428, 1.663928, 0.1686275, 0, 1, 1,
0.5498462, 2.887694, -2.270247, 0.1764706, 0, 1, 1,
0.5554122, 1.31669, 3.088988, 0.1803922, 0, 1, 1,
0.5563499, 0.9540678, -0.5407138, 0.1882353, 0, 1, 1,
0.5563794, -1.704929, 3.876412, 0.1921569, 0, 1, 1,
0.5576445, 0.9766731, -0.4855956, 0.2, 0, 1, 1,
0.5592617, 1.380419, -0.1151636, 0.2078431, 0, 1, 1,
0.5594015, -1.080452, 3.249244, 0.2117647, 0, 1, 1,
0.5614034, 0.5882357, -0.1868023, 0.2196078, 0, 1, 1,
0.5616133, 0.1328809, 2.076001, 0.2235294, 0, 1, 1,
0.5620161, -0.4448682, 2.170436, 0.2313726, 0, 1, 1,
0.5643111, -1.771759, 4.064123, 0.2352941, 0, 1, 1,
0.5676913, 0.1394522, 1.824684, 0.2431373, 0, 1, 1,
0.5683407, -0.4204698, 3.785474, 0.2470588, 0, 1, 1,
0.5730969, -0.3850366, 2.733805, 0.254902, 0, 1, 1,
0.5732043, 0.8996983, -0.373785, 0.2588235, 0, 1, 1,
0.5743886, 1.589569, 1.241393, 0.2666667, 0, 1, 1,
0.5748891, 0.4229712, 2.131521, 0.2705882, 0, 1, 1,
0.5753289, -0.6920748, 2.197664, 0.2784314, 0, 1, 1,
0.5796729, -2.055652, 3.83256, 0.282353, 0, 1, 1,
0.5811614, -1.286055, 3.46871, 0.2901961, 0, 1, 1,
0.582516, 0.7828038, 1.616007, 0.2941177, 0, 1, 1,
0.5877466, -0.2403171, 2.356279, 0.3019608, 0, 1, 1,
0.5879846, -0.9616663, 3.67688, 0.3098039, 0, 1, 1,
0.5885559, -0.5869128, 2.287196, 0.3137255, 0, 1, 1,
0.5905096, -0.3912868, 0.647893, 0.3215686, 0, 1, 1,
0.5913348, 0.4094068, 1.319662, 0.3254902, 0, 1, 1,
0.5979019, -0.423806, 2.80291, 0.3333333, 0, 1, 1,
0.6113386, 0.2781653, 1.77681, 0.3372549, 0, 1, 1,
0.6116351, 0.1664148, 2.287976, 0.345098, 0, 1, 1,
0.6116389, 0.351664, 2.561095, 0.3490196, 0, 1, 1,
0.6129606, -0.3497, 0.5643736, 0.3568628, 0, 1, 1,
0.6247696, 2.360387, 0.6295634, 0.3607843, 0, 1, 1,
0.6285632, -0.2147142, 2.517108, 0.3686275, 0, 1, 1,
0.6290986, 0.341691, 0.8906416, 0.372549, 0, 1, 1,
0.6301, 0.6616533, 0.5594795, 0.3803922, 0, 1, 1,
0.6306709, -0.9335762, 4.014436, 0.3843137, 0, 1, 1,
0.6349875, -0.4882914, 5.093493, 0.3921569, 0, 1, 1,
0.635381, 0.916725, 0.1592901, 0.3960784, 0, 1, 1,
0.6381812, -1.585868, 1.257648, 0.4039216, 0, 1, 1,
0.639479, -0.7389433, 1.306912, 0.4117647, 0, 1, 1,
0.6398233, 0.0597761, 1.642552, 0.4156863, 0, 1, 1,
0.6411235, -0.6456529, 2.657022, 0.4235294, 0, 1, 1,
0.641904, -0.5322417, 1.214659, 0.427451, 0, 1, 1,
0.6433176, 0.9356723, 1.316925, 0.4352941, 0, 1, 1,
0.6456445, 1.180306, -0.07180726, 0.4392157, 0, 1, 1,
0.6468012, -1.966549, 3.812586, 0.4470588, 0, 1, 1,
0.6522701, -0.04511942, 3.101715, 0.4509804, 0, 1, 1,
0.6604658, 0.3443289, 2.235489, 0.4588235, 0, 1, 1,
0.6606553, -1.965049, 1.301369, 0.4627451, 0, 1, 1,
0.6629589, 1.533189, 0.6076567, 0.4705882, 0, 1, 1,
0.6659063, -0.1311538, 0.4164734, 0.4745098, 0, 1, 1,
0.6669127, -0.3490475, 2.049785, 0.4823529, 0, 1, 1,
0.6786693, 0.7436551, 1.393665, 0.4862745, 0, 1, 1,
0.6833443, 0.4305672, 2.589863, 0.4941176, 0, 1, 1,
0.6840303, -0.7615241, 2.734059, 0.5019608, 0, 1, 1,
0.6843344, 0.8552487, 0.07189368, 0.5058824, 0, 1, 1,
0.6846314, 1.724031, -1.318018, 0.5137255, 0, 1, 1,
0.6852089, -1.444415, 2.415917, 0.5176471, 0, 1, 1,
0.6888296, -0.5231923, 3.490507, 0.5254902, 0, 1, 1,
0.6910368, 1.745769, 0.8384426, 0.5294118, 0, 1, 1,
0.6912001, -1.244568, 0.6434733, 0.5372549, 0, 1, 1,
0.6956358, 0.6659807, 1.459915, 0.5411765, 0, 1, 1,
0.7024366, -0.6230271, 4.427574, 0.5490196, 0, 1, 1,
0.702563, -2.016754, 3.575723, 0.5529412, 0, 1, 1,
0.7063039, 0.2770953, 0.9864627, 0.5607843, 0, 1, 1,
0.7118154, 0.1836896, 2.296159, 0.5647059, 0, 1, 1,
0.7148339, 0.5100342, 0.1913873, 0.572549, 0, 1, 1,
0.7188921, 0.7147623, 0.341575, 0.5764706, 0, 1, 1,
0.7216699, 0.9970593, 0.4560302, 0.5843138, 0, 1, 1,
0.7296662, 0.9527631, 1.296319, 0.5882353, 0, 1, 1,
0.7340381, -0.2583005, 1.427861, 0.5960785, 0, 1, 1,
0.7346655, -0.9570979, -0.06770112, 0.6039216, 0, 1, 1,
0.7349674, 0.7455397, 0.3754625, 0.6078432, 0, 1, 1,
0.74656, 1.747641, -0.9734462, 0.6156863, 0, 1, 1,
0.7466205, -1.194707, 2.628973, 0.6196079, 0, 1, 1,
0.7556615, -0.5229909, 2.314425, 0.627451, 0, 1, 1,
0.7580652, -0.9660993, 3.242642, 0.6313726, 0, 1, 1,
0.7610075, -0.8715076, 2.514784, 0.6392157, 0, 1, 1,
0.7631463, 0.2174491, 1.92232, 0.6431373, 0, 1, 1,
0.7640878, 1.349368, 0.5024827, 0.6509804, 0, 1, 1,
0.7680292, 1.262398, 0.5751709, 0.654902, 0, 1, 1,
0.7699264, 1.317554, 1.352685, 0.6627451, 0, 1, 1,
0.7707598, -0.2820274, 2.488058, 0.6666667, 0, 1, 1,
0.7709608, -0.06733254, 1.381444, 0.6745098, 0, 1, 1,
0.7717538, 0.1490672, 3.692743, 0.6784314, 0, 1, 1,
0.7724589, 0.3646139, 1.258886, 0.6862745, 0, 1, 1,
0.7728021, 1.004026, 0.9975134, 0.6901961, 0, 1, 1,
0.7739776, -0.3239918, 0.8833943, 0.6980392, 0, 1, 1,
0.7740082, -0.8638833, 3.545816, 0.7058824, 0, 1, 1,
0.7748152, 0.5233332, 0.6601709, 0.7098039, 0, 1, 1,
0.7799171, 1.254071, 1.854104, 0.7176471, 0, 1, 1,
0.7814444, -1.211357, 2.91466, 0.7215686, 0, 1, 1,
0.7825852, -0.2576726, 3.168678, 0.7294118, 0, 1, 1,
0.7875597, 2.464284, 1.957992, 0.7333333, 0, 1, 1,
0.7876095, -1.556927, 1.26728, 0.7411765, 0, 1, 1,
0.7910147, 0.3001863, 1.383784, 0.7450981, 0, 1, 1,
0.7956691, 1.824389, -0.7606546, 0.7529412, 0, 1, 1,
0.8041258, -2.10791, 2.615669, 0.7568628, 0, 1, 1,
0.8064185, 0.7537954, 0.4098568, 0.7647059, 0, 1, 1,
0.8100511, -0.2512142, 2.503984, 0.7686275, 0, 1, 1,
0.8216995, -0.6155754, 1.964414, 0.7764706, 0, 1, 1,
0.8219757, 1.462969, 0.2416704, 0.7803922, 0, 1, 1,
0.8220603, -0.06373809, 2.677316, 0.7882353, 0, 1, 1,
0.8327385, 0.8395469, 0.6070599, 0.7921569, 0, 1, 1,
0.8391023, -1.19313, 2.573674, 0.8, 0, 1, 1,
0.8434643, 0.4121484, 0.8462359, 0.8078431, 0, 1, 1,
0.8472255, -0.130354, 1.688659, 0.8117647, 0, 1, 1,
0.8477319, 1.498819, 1.979164, 0.8196079, 0, 1, 1,
0.8480528, 1.33238, -0.5011619, 0.8235294, 0, 1, 1,
0.8519147, 0.5600077, -0.08835673, 0.8313726, 0, 1, 1,
0.8547788, 1.607383, 0.4678664, 0.8352941, 0, 1, 1,
0.8548231, 0.274323, 1.473306, 0.8431373, 0, 1, 1,
0.8590747, 0.1084763, 1.98767, 0.8470588, 0, 1, 1,
0.8636839, -0.245792, 3.467727, 0.854902, 0, 1, 1,
0.8665166, -0.5560784, 1.148215, 0.8588235, 0, 1, 1,
0.8671495, 0.2082635, 0.7234905, 0.8666667, 0, 1, 1,
0.86926, 0.2566916, 2.249887, 0.8705882, 0, 1, 1,
0.8746812, -0.2936615, 2.022013, 0.8784314, 0, 1, 1,
0.8785893, 0.1679036, 0.3156945, 0.8823529, 0, 1, 1,
0.8870443, 0.9161658, 0.1844396, 0.8901961, 0, 1, 1,
0.8916944, 0.4640597, 1.922569, 0.8941177, 0, 1, 1,
0.8944845, 0.5389353, 0.121939, 0.9019608, 0, 1, 1,
0.900719, -0.3623092, 1.685527, 0.9098039, 0, 1, 1,
0.9010711, -0.2541025, 3.397747, 0.9137255, 0, 1, 1,
0.9018727, -0.535603, 0.6364623, 0.9215686, 0, 1, 1,
0.9088711, -0.2440484, 2.45031, 0.9254902, 0, 1, 1,
0.9104084, 1.946771, 1.105273, 0.9333333, 0, 1, 1,
0.9170901, -1.35605, -0.3338574, 0.9372549, 0, 1, 1,
0.9178994, -0.2311277, 0.4859786, 0.945098, 0, 1, 1,
0.9182397, 0.2931699, 2.018388, 0.9490196, 0, 1, 1,
0.925626, 1.883156, 1.86317, 0.9568627, 0, 1, 1,
0.9280469, -2.03525, 1.484074, 0.9607843, 0, 1, 1,
0.9348071, 1.079721, 1.545056, 0.9686275, 0, 1, 1,
0.9392343, 1.489123, 0.6283501, 0.972549, 0, 1, 1,
0.9438375, -1.070307, 1.762373, 0.9803922, 0, 1, 1,
0.9442559, 0.017689, 3.838475, 0.9843137, 0, 1, 1,
0.9509825, -0.4465344, 1.664751, 0.9921569, 0, 1, 1,
0.958254, -1.215175, 2.331355, 0.9960784, 0, 1, 1,
0.9592382, -1.168892, 2.770208, 1, 0, 0.9960784, 1,
0.9613032, -0.3346877, 1.718424, 1, 0, 0.9882353, 1,
0.9693252, 1.902812, 1.134197, 1, 0, 0.9843137, 1,
0.9709535, 1.251122, 0.6009526, 1, 0, 0.9764706, 1,
0.9731609, 0.4457541, 0.08722564, 1, 0, 0.972549, 1,
0.9803815, 1.548508, -0.1023063, 1, 0, 0.9647059, 1,
0.984009, 0.2328487, 1.591465, 1, 0, 0.9607843, 1,
0.9843146, -0.08172385, 1.536295, 1, 0, 0.9529412, 1,
0.9871401, 1.040455, 1.638688, 1, 0, 0.9490196, 1,
0.9901516, 0.5414045, 1.336325, 1, 0, 0.9411765, 1,
0.9952213, 0.5264779, 0.4559506, 1, 0, 0.9372549, 1,
0.9987879, -0.6973506, 2.970137, 1, 0, 0.9294118, 1,
1.014128, 0.006390883, 4.426027, 1, 0, 0.9254902, 1,
1.017362, 0.3546746, 1.07487, 1, 0, 0.9176471, 1,
1.027718, -1.409212, 2.762405, 1, 0, 0.9137255, 1,
1.028699, 0.3641152, 0.7394826, 1, 0, 0.9058824, 1,
1.031697, 0.9189273, -0.3655217, 1, 0, 0.9019608, 1,
1.033185, -0.1815758, 2.031896, 1, 0, 0.8941177, 1,
1.033651, 1.070224, 0.5352665, 1, 0, 0.8862745, 1,
1.04108, -0.3535821, 0.9807454, 1, 0, 0.8823529, 1,
1.047234, 0.09824051, -0.5634556, 1, 0, 0.8745098, 1,
1.048499, -0.5502908, 1.092975, 1, 0, 0.8705882, 1,
1.057643, 1.143676, 1.681992, 1, 0, 0.8627451, 1,
1.058443, 1.245132, 0.6324802, 1, 0, 0.8588235, 1,
1.061679, -0.07712886, 1.370221, 1, 0, 0.8509804, 1,
1.063848, -1.512155, 1.379249, 1, 0, 0.8470588, 1,
1.069152, 0.8504953, 1.142236, 1, 0, 0.8392157, 1,
1.074731, 0.8399779, -0.5398983, 1, 0, 0.8352941, 1,
1.086699, 0.0615721, 1.736462, 1, 0, 0.827451, 1,
1.089297, -1.042026, 1.16482, 1, 0, 0.8235294, 1,
1.090397, 0.8094246, 1.03671, 1, 0, 0.8156863, 1,
1.09425, -1.077157, 2.814131, 1, 0, 0.8117647, 1,
1.094701, -1.222741, 2.377955, 1, 0, 0.8039216, 1,
1.10189, -1.556953, 3.604888, 1, 0, 0.7960784, 1,
1.107219, -1.046357, 3.303688, 1, 0, 0.7921569, 1,
1.110222, -1.489245, 2.490394, 1, 0, 0.7843137, 1,
1.113929, -0.906873, 3.857013, 1, 0, 0.7803922, 1,
1.114205, -1.635276, 2.171456, 1, 0, 0.772549, 1,
1.125946, 0.1008973, 1.219829, 1, 0, 0.7686275, 1,
1.140604, -0.7151188, 2.798087, 1, 0, 0.7607843, 1,
1.145971, 1.918265, 1.589725, 1, 0, 0.7568628, 1,
1.149614, 2.001765, 1.40673, 1, 0, 0.7490196, 1,
1.15149, -1.118738, 3.33708, 1, 0, 0.7450981, 1,
1.157946, -0.5433849, 3.5636, 1, 0, 0.7372549, 1,
1.161474, 0.3273067, 2.759488, 1, 0, 0.7333333, 1,
1.164762, 0.7424839, 1.474707, 1, 0, 0.7254902, 1,
1.165642, 0.7695314, 1.499754, 1, 0, 0.7215686, 1,
1.177462, -1.578837, 4.452287, 1, 0, 0.7137255, 1,
1.184131, 1.125059, 0.4334863, 1, 0, 0.7098039, 1,
1.205513, -0.289206, 2.981024, 1, 0, 0.7019608, 1,
1.206507, 0.4706168, -0.05020021, 1, 0, 0.6941177, 1,
1.211996, -1.591165, 1.831799, 1, 0, 0.6901961, 1,
1.2247, 0.1061364, 1.448344, 1, 0, 0.682353, 1,
1.225355, -0.1348452, 2.056446, 1, 0, 0.6784314, 1,
1.237291, 0.6503382, 1.59564, 1, 0, 0.6705883, 1,
1.243622, 1.898483, -0.6961095, 1, 0, 0.6666667, 1,
1.244927, 0.2128668, 2.918839, 1, 0, 0.6588235, 1,
1.251059, -0.447371, 3.887793, 1, 0, 0.654902, 1,
1.262734, 1.05951, -1.16087, 1, 0, 0.6470588, 1,
1.268196, 0.2903264, 2.003306, 1, 0, 0.6431373, 1,
1.28675, -0.2012479, 0.952094, 1, 0, 0.6352941, 1,
1.29776, 1.932784, 1.441999, 1, 0, 0.6313726, 1,
1.299935, -0.9405954, 1.405731, 1, 0, 0.6235294, 1,
1.305329, 2.479734, -0.5632866, 1, 0, 0.6196079, 1,
1.313097, -0.9512945, 2.602133, 1, 0, 0.6117647, 1,
1.321919, 0.6963872, 1.790829, 1, 0, 0.6078432, 1,
1.325653, -0.7835725, 2.437611, 1, 0, 0.6, 1,
1.325808, -0.1472175, 2.242838, 1, 0, 0.5921569, 1,
1.332946, -0.5353116, 2.575029, 1, 0, 0.5882353, 1,
1.342396, -0.08766906, 1.653804, 1, 0, 0.5803922, 1,
1.349176, 1.437414, -0.3494555, 1, 0, 0.5764706, 1,
1.349922, 0.1502709, 2.230789, 1, 0, 0.5686275, 1,
1.352803, -0.6215243, 3.1136, 1, 0, 0.5647059, 1,
1.355774, -0.2697694, 2.628733, 1, 0, 0.5568628, 1,
1.357259, -0.5581633, 1.165005, 1, 0, 0.5529412, 1,
1.362764, 1.451021, 0.03422364, 1, 0, 0.5450981, 1,
1.366058, -1.682811, 1.536937, 1, 0, 0.5411765, 1,
1.366122, 0.3362843, 0.4906532, 1, 0, 0.5333334, 1,
1.366235, 1.620032, -1.056626, 1, 0, 0.5294118, 1,
1.368486, 0.8166629, 1.596024, 1, 0, 0.5215687, 1,
1.368524, 0.935716, 1.177145, 1, 0, 0.5176471, 1,
1.392021, -2.033199, 1.024588, 1, 0, 0.509804, 1,
1.392565, -0.2300167, 4.224168, 1, 0, 0.5058824, 1,
1.396387, -0.4393634, -0.3755516, 1, 0, 0.4980392, 1,
1.405264, -1.177866, 2.285568, 1, 0, 0.4901961, 1,
1.406101, -0.7923766, 1.843136, 1, 0, 0.4862745, 1,
1.415635, 1.726659, 0.2492376, 1, 0, 0.4784314, 1,
1.433814, 2.015048, -0.3984714, 1, 0, 0.4745098, 1,
1.456431, -1.257594, 2.149271, 1, 0, 0.4666667, 1,
1.466146, 0.1987961, 1.97195, 1, 0, 0.4627451, 1,
1.481498, 2.319486, -1.56341, 1, 0, 0.454902, 1,
1.488595, -0.7270613, 2.264291, 1, 0, 0.4509804, 1,
1.490596, 1.237229, -0.2329269, 1, 0, 0.4431373, 1,
1.504747, 2.932566, 2.179712, 1, 0, 0.4392157, 1,
1.519082, 0.1351855, 0.733493, 1, 0, 0.4313726, 1,
1.522043, 1.358975, 1.095062, 1, 0, 0.427451, 1,
1.522463, 1.075278, 1.089278, 1, 0, 0.4196078, 1,
1.526586, -0.1338411, 2.676616, 1, 0, 0.4156863, 1,
1.544633, -1.553756, 2.383636, 1, 0, 0.4078431, 1,
1.544978, -0.6092434, 0.4402124, 1, 0, 0.4039216, 1,
1.551596, -0.6269854, 1.350514, 1, 0, 0.3960784, 1,
1.557208, 0.6117588, 3.262387, 1, 0, 0.3882353, 1,
1.557575, 0.4405701, 0.03374962, 1, 0, 0.3843137, 1,
1.566754, 0.01971761, 0.7188413, 1, 0, 0.3764706, 1,
1.595166, 0.1033427, 2.575388, 1, 0, 0.372549, 1,
1.600012, 1.288928, 0.2033631, 1, 0, 0.3647059, 1,
1.601875, -0.1989546, 0.4332433, 1, 0, 0.3607843, 1,
1.613803, 1.007566, 2.288016, 1, 0, 0.3529412, 1,
1.651154, -0.982089, 0.6762122, 1, 0, 0.3490196, 1,
1.662253, -0.8249692, 3.433958, 1, 0, 0.3411765, 1,
1.667736, 1.221976, 1.143756, 1, 0, 0.3372549, 1,
1.675225, 0.284755, 3.449728, 1, 0, 0.3294118, 1,
1.678712, 0.1101706, 2.156578, 1, 0, 0.3254902, 1,
1.68102, -2.260994, 1.288403, 1, 0, 0.3176471, 1,
1.683803, -1.622391, 3.409301, 1, 0, 0.3137255, 1,
1.708942, -0.7548182, 2.568498, 1, 0, 0.3058824, 1,
1.713703, 0.1579525, 1.154319, 1, 0, 0.2980392, 1,
1.721595, -0.5482995, -0.5078297, 1, 0, 0.2941177, 1,
1.726906, -0.1946288, 2.731179, 1, 0, 0.2862745, 1,
1.750047, -2.621244, 1.540808, 1, 0, 0.282353, 1,
1.784069, -0.3423975, 1.906443, 1, 0, 0.2745098, 1,
1.788639, 0.5479208, 1.57097, 1, 0, 0.2705882, 1,
1.793531, -1.043708, 3.103239, 1, 0, 0.2627451, 1,
1.802316, -0.07453376, 1.402951, 1, 0, 0.2588235, 1,
1.803765, -1.194107, 2.48759, 1, 0, 0.2509804, 1,
1.813879, 0.595827, 0.3637499, 1, 0, 0.2470588, 1,
1.832808, 0.6854129, 1.651166, 1, 0, 0.2392157, 1,
1.833368, 0.171924, 1.418209, 1, 0, 0.2352941, 1,
1.837444, 1.258194, 0.3602969, 1, 0, 0.227451, 1,
1.839853, 0.9365438, 2.159117, 1, 0, 0.2235294, 1,
1.849647, -1.591438, 3.437964, 1, 0, 0.2156863, 1,
1.860388, 0.04290687, 1.172002, 1, 0, 0.2117647, 1,
1.867002, -0.3802739, 1.631844, 1, 0, 0.2039216, 1,
1.870194, 0.9618102, 0.05491893, 1, 0, 0.1960784, 1,
1.875568, -1.567316, 2.120719, 1, 0, 0.1921569, 1,
1.894317, 0.3711167, 0.5429335, 1, 0, 0.1843137, 1,
1.918731, 0.4045934, 0.4691028, 1, 0, 0.1803922, 1,
1.951846, -1.416733, 2.984892, 1, 0, 0.172549, 1,
1.95925, -0.7212184, 2.941769, 1, 0, 0.1686275, 1,
1.994827, -1.626672, 2.617032, 1, 0, 0.1607843, 1,
2.009874, 0.2078258, 2.077808, 1, 0, 0.1568628, 1,
2.026835, 0.1870117, 0.9089257, 1, 0, 0.1490196, 1,
2.030894, -0.02384404, 0.599932, 1, 0, 0.145098, 1,
2.058847, 0.02552037, 1.217357, 1, 0, 0.1372549, 1,
2.090104, 2.214268, 0.8452213, 1, 0, 0.1333333, 1,
2.104102, 1.97431, 0.421584, 1, 0, 0.1254902, 1,
2.121524, -0.6398829, 0.813855, 1, 0, 0.1215686, 1,
2.134648, 0.6606734, 2.222544, 1, 0, 0.1137255, 1,
2.160581, -0.3461663, 2.600538, 1, 0, 0.1098039, 1,
2.190497, -0.5334341, 1.674022, 1, 0, 0.1019608, 1,
2.234475, -2.959145, 1.198487, 1, 0, 0.09411765, 1,
2.397244, 0.1491046, 3.260869, 1, 0, 0.09019608, 1,
2.44264, -0.8950385, 0.6656992, 1, 0, 0.08235294, 1,
2.461074, -0.4069661, 1.581479, 1, 0, 0.07843138, 1,
2.478613, 1.486298, 0.9193119, 1, 0, 0.07058824, 1,
2.5169, 0.2951963, 1.772014, 1, 0, 0.06666667, 1,
2.551752, 0.6242317, 1.447955, 1, 0, 0.05882353, 1,
2.600276, 0.2443468, 1.981872, 1, 0, 0.05490196, 1,
2.619718, -0.3118235, 1.744807, 1, 0, 0.04705882, 1,
2.731518, 1.167741, 1.484861, 1, 0, 0.04313726, 1,
2.735682, 0.7203636, 2.967193, 1, 0, 0.03529412, 1,
2.747302, -0.9800127, 0.5990358, 1, 0, 0.03137255, 1,
2.826345, 0.3367204, 2.846847, 1, 0, 0.02352941, 1,
2.99261, 1.074861, 1.094405, 1, 0, 0.01960784, 1,
3.019427, 0.6826305, 1.069073, 1, 0, 0.01176471, 1,
3.125802, 0.08770791, 1.114433, 1, 0, 0.007843138, 1
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
0.2716227, -3.991629, -7.550219, 0, -0.5, 0.5, 0.5,
0.2716227, -3.991629, -7.550219, 1, -0.5, 0.5, 0.5,
0.2716227, -3.991629, -7.550219, 1, 1.5, 0.5, 0.5,
0.2716227, -3.991629, -7.550219, 0, 1.5, 0.5, 0.5
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
-3.550124, 0.08653116, -7.550219, 0, -0.5, 0.5, 0.5,
-3.550124, 0.08653116, -7.550219, 1, -0.5, 0.5, 0.5,
-3.550124, 0.08653116, -7.550219, 1, 1.5, 0.5, 0.5,
-3.550124, 0.08653116, -7.550219, 0, 1.5, 0.5, 0.5
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
-3.550124, -3.991629, -0.2974713, 0, -0.5, 0.5, 0.5,
-3.550124, -3.991629, -0.2974713, 1, -0.5, 0.5, 0.5,
-3.550124, -3.991629, -0.2974713, 1, 1.5, 0.5, 0.5,
-3.550124, -3.991629, -0.2974713, 0, 1.5, 0.5, 0.5
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
-2, -3.050515, -5.876508,
3, -3.050515, -5.876508,
-2, -3.050515, -5.876508,
-2, -3.207368, -6.15546,
-1, -3.050515, -5.876508,
-1, -3.207368, -6.15546,
0, -3.050515, -5.876508,
0, -3.207368, -6.15546,
1, -3.050515, -5.876508,
1, -3.207368, -6.15546,
2, -3.050515, -5.876508,
2, -3.207368, -6.15546,
3, -3.050515, -5.876508,
3, -3.207368, -6.15546
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
-2, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
-2, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
-2, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
-2, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5,
-1, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
-1, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
-1, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
-1, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5,
0, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
0, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
0, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
0, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5,
1, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
1, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
1, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
1, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5,
2, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
2, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
2, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
2, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5,
3, -3.521072, -6.713363, 0, -0.5, 0.5, 0.5,
3, -3.521072, -6.713363, 1, -0.5, 0.5, 0.5,
3, -3.521072, -6.713363, 1, 1.5, 0.5, 0.5,
3, -3.521072, -6.713363, 0, 1.5, 0.5, 0.5
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
-2.668182, -2, -5.876508,
-2.668182, 3, -5.876508,
-2.668182, -2, -5.876508,
-2.815173, -2, -6.15546,
-2.668182, -1, -5.876508,
-2.815173, -1, -6.15546,
-2.668182, 0, -5.876508,
-2.815173, 0, -6.15546,
-2.668182, 1, -5.876508,
-2.815173, 1, -6.15546,
-2.668182, 2, -5.876508,
-2.815173, 2, -6.15546,
-2.668182, 3, -5.876508,
-2.815173, 3, -6.15546
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
-3.109153, -2, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, -2, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, -2, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, -2, -6.713363, 0, 1.5, 0.5, 0.5,
-3.109153, -1, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, -1, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, -1, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, -1, -6.713363, 0, 1.5, 0.5, 0.5,
-3.109153, 0, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, 0, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, 0, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, 0, -6.713363, 0, 1.5, 0.5, 0.5,
-3.109153, 1, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, 1, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, 1, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, 1, -6.713363, 0, 1.5, 0.5, 0.5,
-3.109153, 2, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, 2, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, 2, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, 2, -6.713363, 0, 1.5, 0.5, 0.5,
-3.109153, 3, -6.713363, 0, -0.5, 0.5, 0.5,
-3.109153, 3, -6.713363, 1, -0.5, 0.5, 0.5,
-3.109153, 3, -6.713363, 1, 1.5, 0.5, 0.5,
-3.109153, 3, -6.713363, 0, 1.5, 0.5, 0.5
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
-2.668182, -3.050515, -4,
-2.668182, -3.050515, 4,
-2.668182, -3.050515, -4,
-2.815173, -3.207368, -4,
-2.668182, -3.050515, -2,
-2.815173, -3.207368, -2,
-2.668182, -3.050515, 0,
-2.815173, -3.207368, 0,
-2.668182, -3.050515, 2,
-2.815173, -3.207368, 2,
-2.668182, -3.050515, 4,
-2.815173, -3.207368, 4
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
-3.109153, -3.521072, -4, 0, -0.5, 0.5, 0.5,
-3.109153, -3.521072, -4, 1, -0.5, 0.5, 0.5,
-3.109153, -3.521072, -4, 1, 1.5, 0.5, 0.5,
-3.109153, -3.521072, -4, 0, 1.5, 0.5, 0.5,
-3.109153, -3.521072, -2, 0, -0.5, 0.5, 0.5,
-3.109153, -3.521072, -2, 1, -0.5, 0.5, 0.5,
-3.109153, -3.521072, -2, 1, 1.5, 0.5, 0.5,
-3.109153, -3.521072, -2, 0, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 0, 0, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 0, 1, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 0, 1, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 0, 0, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 2, 0, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 2, 1, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 2, 1, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 2, 0, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 4, 0, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 4, 1, -0.5, 0.5, 0.5,
-3.109153, -3.521072, 4, 1, 1.5, 0.5, 0.5,
-3.109153, -3.521072, 4, 0, 1.5, 0.5, 0.5
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
-2.668182, -3.050515, -5.876508,
-2.668182, 3.223578, -5.876508,
-2.668182, -3.050515, 5.281565,
-2.668182, 3.223578, 5.281565,
-2.668182, -3.050515, -5.876508,
-2.668182, -3.050515, 5.281565,
-2.668182, 3.223578, -5.876508,
-2.668182, 3.223578, 5.281565,
-2.668182, -3.050515, -5.876508,
3.211428, -3.050515, -5.876508,
-2.668182, -3.050515, 5.281565,
3.211428, -3.050515, 5.281565,
-2.668182, 3.223578, -5.876508,
3.211428, 3.223578, -5.876508,
-2.668182, 3.223578, 5.281565,
3.211428, 3.223578, 5.281565,
3.211428, -3.050515, -5.876508,
3.211428, 3.223578, -5.876508,
3.211428, -3.050515, 5.281565,
3.211428, 3.223578, 5.281565,
3.211428, -3.050515, -5.876508,
3.211428, -3.050515, 5.281565,
3.211428, 3.223578, -5.876508,
3.211428, 3.223578, 5.281565
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
var radius = 7.522053;
var distance = 33.46646;
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
mvMatrix.translate( -0.2716227, -0.08653116, 0.2974713 );
mvMatrix.scale( 1.383254, 1.296282, 0.7288885 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46646);
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


