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
-3.133044, -1.123796, -3.189716, 1, 0, 0, 1,
-3.012252, 1.107357, -0.9437648, 1, 0.007843138, 0, 1,
-2.93424, 0.2134078, -0.5240545, 1, 0.01176471, 0, 1,
-2.898724, -1.202283, -0.5394676, 1, 0.01960784, 0, 1,
-2.836146, -0.2290937, -1.321069, 1, 0.02352941, 0, 1,
-2.492615, -0.9854959, -1.941422, 1, 0.03137255, 0, 1,
-2.460605, -0.571027, -1.935687, 1, 0.03529412, 0, 1,
-2.391091, 0.1281513, -0.5027315, 1, 0.04313726, 0, 1,
-2.376074, -0.265692, -1.23041, 1, 0.04705882, 0, 1,
-2.354879, -1.688507, -1.980658, 1, 0.05490196, 0, 1,
-2.340638, 2.109084, 0.652411, 1, 0.05882353, 0, 1,
-2.26055, 1.09742, -1.05503, 1, 0.06666667, 0, 1,
-2.255866, -0.1468137, -0.8540282, 1, 0.07058824, 0, 1,
-2.242448, -0.8959957, -1.866908, 1, 0.07843138, 0, 1,
-2.169853, -1.342251, -2.235705, 1, 0.08235294, 0, 1,
-2.137376, -0.09961155, -0.4381971, 1, 0.09019608, 0, 1,
-2.126163, 0.2379044, 0.3330738, 1, 0.09411765, 0, 1,
-2.11292, 0.4651449, -2.018712, 1, 0.1019608, 0, 1,
-2.104557, -0.2826012, -1.246534, 1, 0.1098039, 0, 1,
-2.087497, 0.628636, -0.9430155, 1, 0.1137255, 0, 1,
-2.080199, 2.257658, -0.8875388, 1, 0.1215686, 0, 1,
-2.077261, -1.250096, -1.586857, 1, 0.1254902, 0, 1,
-2.031784, 1.300472, -1.242686, 1, 0.1333333, 0, 1,
-2.015628, 1.064837, -2.739516, 1, 0.1372549, 0, 1,
-2.004925, 1.025538, -0.530362, 1, 0.145098, 0, 1,
-1.999038, 0.7993103, -2.136767, 1, 0.1490196, 0, 1,
-1.994976, 0.3840812, -0.9890869, 1, 0.1568628, 0, 1,
-1.977222, 0.5488397, -1.02911, 1, 0.1607843, 0, 1,
-1.895949, -1.055652, -0.8193482, 1, 0.1686275, 0, 1,
-1.895903, 0.6471164, -1.988021, 1, 0.172549, 0, 1,
-1.85955, -1.32609, -1.913791, 1, 0.1803922, 0, 1,
-1.854999, 1.509844, 0.04468798, 1, 0.1843137, 0, 1,
-1.80916, 0.2029165, -2.965987, 1, 0.1921569, 0, 1,
-1.784423, -0.1327988, -4.21369, 1, 0.1960784, 0, 1,
-1.77432, -0.9924528, -1.88682, 1, 0.2039216, 0, 1,
-1.773237, 1.281823, -0.3096108, 1, 0.2117647, 0, 1,
-1.771045, -1.001077, -2.318213, 1, 0.2156863, 0, 1,
-1.770121, -0.6450552, -3.803098, 1, 0.2235294, 0, 1,
-1.767877, -0.01492696, -2.327159, 1, 0.227451, 0, 1,
-1.731689, 0.01910449, -0.7773516, 1, 0.2352941, 0, 1,
-1.712914, -0.1131949, -1.531514, 1, 0.2392157, 0, 1,
-1.712669, -1.301429, -2.451281, 1, 0.2470588, 0, 1,
-1.712079, 0.8901042, -1.175538, 1, 0.2509804, 0, 1,
-1.710826, -0.4287089, -1.133787, 1, 0.2588235, 0, 1,
-1.709834, 0.508938, -1.756855, 1, 0.2627451, 0, 1,
-1.703112, 0.9973394, -1.470387, 1, 0.2705882, 0, 1,
-1.693583, -1.352228, -4.512958, 1, 0.2745098, 0, 1,
-1.66458, -1.162262, -3.446946, 1, 0.282353, 0, 1,
-1.659257, -0.09797606, -3.150709, 1, 0.2862745, 0, 1,
-1.63683, 1.027441, -0.2557105, 1, 0.2941177, 0, 1,
-1.635507, -0.05766548, -0.9292283, 1, 0.3019608, 0, 1,
-1.620957, 0.6586273, -1.668498, 1, 0.3058824, 0, 1,
-1.608002, 1.139943, -2.818625, 1, 0.3137255, 0, 1,
-1.607595, 1.514363, -0.1486766, 1, 0.3176471, 0, 1,
-1.586111, -1.896905, -2.261685, 1, 0.3254902, 0, 1,
-1.581809, 1.209302, -0.4870665, 1, 0.3294118, 0, 1,
-1.573042, 1.34199, -3.368185, 1, 0.3372549, 0, 1,
-1.523156, 0.3956386, -0.06392004, 1, 0.3411765, 0, 1,
-1.521032, -1.975026, -1.349235, 1, 0.3490196, 0, 1,
-1.51907, 0.4562167, -2.823641, 1, 0.3529412, 0, 1,
-1.508935, 1.680259, -0.7008985, 1, 0.3607843, 0, 1,
-1.507716, 0.05940677, -1.573287, 1, 0.3647059, 0, 1,
-1.50521, -0.8554237, -2.567687, 1, 0.372549, 0, 1,
-1.505087, 0.8947964, -0.7181803, 1, 0.3764706, 0, 1,
-1.493079, 0.1163563, -0.3182183, 1, 0.3843137, 0, 1,
-1.485474, 0.4097937, -0.928425, 1, 0.3882353, 0, 1,
-1.478796, -0.5781347, -2.941409, 1, 0.3960784, 0, 1,
-1.47478, 1.61792, -0.652764, 1, 0.4039216, 0, 1,
-1.474381, -0.2794595, -1.31753, 1, 0.4078431, 0, 1,
-1.466417, 0.3511225, -1.225855, 1, 0.4156863, 0, 1,
-1.45588, 0.5876398, -1.175602, 1, 0.4196078, 0, 1,
-1.455415, -0.0888095, -0.5279251, 1, 0.427451, 0, 1,
-1.454788, 0.3372028, 0.4293819, 1, 0.4313726, 0, 1,
-1.454752, 1.185372, -3.175824, 1, 0.4392157, 0, 1,
-1.450917, -0.5603766, -3.103106, 1, 0.4431373, 0, 1,
-1.450753, -0.02735659, -0.9731978, 1, 0.4509804, 0, 1,
-1.444009, 2.345973, -0.8292875, 1, 0.454902, 0, 1,
-1.440171, -1.224147, -1.219979, 1, 0.4627451, 0, 1,
-1.429805, -0.6386324, -1.607754, 1, 0.4666667, 0, 1,
-1.423477, -0.1328996, -2.502223, 1, 0.4745098, 0, 1,
-1.421104, 0.1986847, -2.168231, 1, 0.4784314, 0, 1,
-1.417285, -1.002813, -3.877509, 1, 0.4862745, 0, 1,
-1.405542, -0.5594592, -2.497525, 1, 0.4901961, 0, 1,
-1.393511, -0.3714672, -1.059314, 1, 0.4980392, 0, 1,
-1.39064, -2.082154, -3.122453, 1, 0.5058824, 0, 1,
-1.380583, 0.4013657, -0.6108965, 1, 0.509804, 0, 1,
-1.370296, -1.377976, -2.182824, 1, 0.5176471, 0, 1,
-1.370076, -1.649708, -2.562911, 1, 0.5215687, 0, 1,
-1.367927, 0.08686886, -2.114519, 1, 0.5294118, 0, 1,
-1.367804, 2.060877, -0.4916046, 1, 0.5333334, 0, 1,
-1.359156, 1.490749, -0.6705997, 1, 0.5411765, 0, 1,
-1.356974, -0.5212563, -1.890725, 1, 0.5450981, 0, 1,
-1.350491, -0.7708212, -1.714755, 1, 0.5529412, 0, 1,
-1.34697, -1.553614, -2.067838, 1, 0.5568628, 0, 1,
-1.340959, -0.1952949, -1.619506, 1, 0.5647059, 0, 1,
-1.339723, -0.8380697, -1.17222, 1, 0.5686275, 0, 1,
-1.311475, 1.654725, -2.416226, 1, 0.5764706, 0, 1,
-1.306997, 2.010705, 0.6297656, 1, 0.5803922, 0, 1,
-1.305739, 0.4146347, -2.104017, 1, 0.5882353, 0, 1,
-1.295303, -0.1382325, -0.7241263, 1, 0.5921569, 0, 1,
-1.293306, 1.861717, -0.8583407, 1, 0.6, 0, 1,
-1.290905, 1.212397, -0.3896126, 1, 0.6078432, 0, 1,
-1.289541, 0.2202762, -3.147598, 1, 0.6117647, 0, 1,
-1.289507, -1.080956, -1.964519, 1, 0.6196079, 0, 1,
-1.281944, -0.03379725, -0.6363935, 1, 0.6235294, 0, 1,
-1.278577, -1.013938, -2.475013, 1, 0.6313726, 0, 1,
-1.273913, -0.67232, -1.571481, 1, 0.6352941, 0, 1,
-1.255755, -2.644973, -3.965848, 1, 0.6431373, 0, 1,
-1.23652, -1.441818, -1.06319, 1, 0.6470588, 0, 1,
-1.212447, 0.6594335, -0.2157904, 1, 0.654902, 0, 1,
-1.205676, -1.139315, -2.714306, 1, 0.6588235, 0, 1,
-1.204442, 0.03076848, -3.791323, 1, 0.6666667, 0, 1,
-1.192951, 0.1195579, -2.712508, 1, 0.6705883, 0, 1,
-1.186352, -1.555417, -3.543299, 1, 0.6784314, 0, 1,
-1.179037, -1.830037, -1.896441, 1, 0.682353, 0, 1,
-1.177173, 0.7436824, -2.414244, 1, 0.6901961, 0, 1,
-1.175685, 0.6096084, -0.6454855, 1, 0.6941177, 0, 1,
-1.174685, 0.168303, -2.200487, 1, 0.7019608, 0, 1,
-1.162127, 1.421926, -2.190266, 1, 0.7098039, 0, 1,
-1.15009, 0.8170505, -0.6737366, 1, 0.7137255, 0, 1,
-1.146544, 1.194303, -0.9362397, 1, 0.7215686, 0, 1,
-1.143595, -2.801824, -4.245952, 1, 0.7254902, 0, 1,
-1.138098, -1.445713, -2.752265, 1, 0.7333333, 0, 1,
-1.13787, -0.1947227, -1.151443, 1, 0.7372549, 0, 1,
-1.135654, -0.8379891, -2.962948, 1, 0.7450981, 0, 1,
-1.127723, -0.5954005, -0.5749634, 1, 0.7490196, 0, 1,
-1.126923, -0.4072058, -3.098681, 1, 0.7568628, 0, 1,
-1.126842, -0.4537813, -4.053331, 1, 0.7607843, 0, 1,
-1.123747, 0.1279014, 0.9223996, 1, 0.7686275, 0, 1,
-1.122305, 0.3258436, -0.4847862, 1, 0.772549, 0, 1,
-1.117792, 0.388063, -1.656793, 1, 0.7803922, 0, 1,
-1.117649, 0.3965548, -1.335498, 1, 0.7843137, 0, 1,
-1.114867, -0.1689797, -0.858273, 1, 0.7921569, 0, 1,
-1.114743, -0.4658378, -2.309085, 1, 0.7960784, 0, 1,
-1.1142, 0.3603925, -3.692758, 1, 0.8039216, 0, 1,
-1.106031, 0.03372381, -0.5099341, 1, 0.8117647, 0, 1,
-1.103528, -0.2235765, -1.907724, 1, 0.8156863, 0, 1,
-1.100182, 0.7505675, -0.6816989, 1, 0.8235294, 0, 1,
-1.087575, -0.583299, -0.5321879, 1, 0.827451, 0, 1,
-1.085858, 0.8085583, -2.160377, 1, 0.8352941, 0, 1,
-1.081363, -1.066009, -1.934711, 1, 0.8392157, 0, 1,
-1.076446, 0.540031, 1.32409, 1, 0.8470588, 0, 1,
-1.069576, -0.004026035, -0.489136, 1, 0.8509804, 0, 1,
-1.069493, -0.2957613, -3.479946, 1, 0.8588235, 0, 1,
-1.064927, 0.2478614, -0.8844989, 1, 0.8627451, 0, 1,
-1.06472, 0.5112336, -0.8724359, 1, 0.8705882, 0, 1,
-1.063512, 0.1896227, -1.115907, 1, 0.8745098, 0, 1,
-1.047868, 0.3688687, -1.335976, 1, 0.8823529, 0, 1,
-1.046939, -0.7058078, -1.932699, 1, 0.8862745, 0, 1,
-1.040096, 0.6761932, -0.5768462, 1, 0.8941177, 0, 1,
-1.039291, 0.07794995, 0.4323144, 1, 0.8980392, 0, 1,
-1.037786, -0.6223943, -2.738302, 1, 0.9058824, 0, 1,
-1.032968, 1.157592, -0.9692928, 1, 0.9137255, 0, 1,
-1.030671, 1.328553, -0.7617479, 1, 0.9176471, 0, 1,
-1.026022, 0.5614244, 0.2448579, 1, 0.9254902, 0, 1,
-1.024825, -0.6869677, -2.563076, 1, 0.9294118, 0, 1,
-1.022886, -0.2234562, -1.638321, 1, 0.9372549, 0, 1,
-1.020093, -1.61367, -3.183463, 1, 0.9411765, 0, 1,
-1.019319, 0.3578973, -2.71034, 1, 0.9490196, 0, 1,
-1.014782, -0.7995702, -1.191423, 1, 0.9529412, 0, 1,
-1.011495, -1.538824, -2.241291, 1, 0.9607843, 0, 1,
-1.005782, 0.4592764, 0.08202241, 1, 0.9647059, 0, 1,
-1.005124, -1.395711, -2.887456, 1, 0.972549, 0, 1,
-1.000521, -1.014798, -1.639168, 1, 0.9764706, 0, 1,
-0.9974632, 1.189514, 0.01842448, 1, 0.9843137, 0, 1,
-0.9926128, -0.1838243, -3.049845, 1, 0.9882353, 0, 1,
-0.9895839, 0.8925883, -0.510841, 1, 0.9960784, 0, 1,
-0.9845291, -0.789533, -2.326509, 0.9960784, 1, 0, 1,
-0.9830156, 0.09321395, -2.390721, 0.9921569, 1, 0, 1,
-0.9808442, 0.8551413, -0.6185687, 0.9843137, 1, 0, 1,
-0.9752271, -0.370456, -2.222543, 0.9803922, 1, 0, 1,
-0.9706968, 1.541956, -2.641879, 0.972549, 1, 0, 1,
-0.9701397, 1.359508, 0.5062765, 0.9686275, 1, 0, 1,
-0.9659893, -0.2435336, -1.411016, 0.9607843, 1, 0, 1,
-0.9524474, 0.1386834, -0.9371237, 0.9568627, 1, 0, 1,
-0.9512722, -1.256147, -3.457758, 0.9490196, 1, 0, 1,
-0.9494631, -0.03668674, -1.586251, 0.945098, 1, 0, 1,
-0.9494058, -0.6998371, -1.955705, 0.9372549, 1, 0, 1,
-0.9452637, 1.418432, -1.16444, 0.9333333, 1, 0, 1,
-0.944118, 0.9619449, 0.5183119, 0.9254902, 1, 0, 1,
-0.9431689, -2.038842, -1.855136, 0.9215686, 1, 0, 1,
-0.9430292, 0.2796926, -0.04795722, 0.9137255, 1, 0, 1,
-0.9260041, 0.8455316, -1.727856, 0.9098039, 1, 0, 1,
-0.9151398, 0.5934824, -0.9645071, 0.9019608, 1, 0, 1,
-0.9054279, -0.8222237, -1.325903, 0.8941177, 1, 0, 1,
-0.9039205, -0.2286197, -0.4966437, 0.8901961, 1, 0, 1,
-0.8941298, -0.3754994, -3.072701, 0.8823529, 1, 0, 1,
-0.893563, 0.1613861, -1.082361, 0.8784314, 1, 0, 1,
-0.8894368, 0.7635591, -1.902452, 0.8705882, 1, 0, 1,
-0.8792771, -1.396446, -3.233302, 0.8666667, 1, 0, 1,
-0.8769234, -0.3909262, -2.165774, 0.8588235, 1, 0, 1,
-0.8750974, 0.6741034, -0.678616, 0.854902, 1, 0, 1,
-0.872528, 1.415055, 0.495739, 0.8470588, 1, 0, 1,
-0.8705226, 1.676111, 0.3911077, 0.8431373, 1, 0, 1,
-0.8702322, 0.2169512, -1.289621, 0.8352941, 1, 0, 1,
-0.8610402, 1.263624, -1.607573, 0.8313726, 1, 0, 1,
-0.8581818, 0.8789815, -1.246612, 0.8235294, 1, 0, 1,
-0.855603, -0.2621359, -1.733068, 0.8196079, 1, 0, 1,
-0.8516647, -1.670663, -5.036067, 0.8117647, 1, 0, 1,
-0.8508235, -0.3760866, -1.467365, 0.8078431, 1, 0, 1,
-0.8493525, -1.650542, -3.236004, 0.8, 1, 0, 1,
-0.830574, 1.970582, -1.377954, 0.7921569, 1, 0, 1,
-0.8258784, -0.6948975, -4.090933, 0.7882353, 1, 0, 1,
-0.8246626, -0.1134113, -0.7630298, 0.7803922, 1, 0, 1,
-0.8178273, -0.2846817, -2.969391, 0.7764706, 1, 0, 1,
-0.8169338, -1.321421, -3.522641, 0.7686275, 1, 0, 1,
-0.8103882, 1.488263, 1.226173, 0.7647059, 1, 0, 1,
-0.8078543, 0.08683542, 0.7950215, 0.7568628, 1, 0, 1,
-0.8066469, 0.834417, 1.0989, 0.7529412, 1, 0, 1,
-0.8036696, -1.419013, -2.957697, 0.7450981, 1, 0, 1,
-0.7988577, -1.314028, -1.753241, 0.7411765, 1, 0, 1,
-0.7964392, 1.296975, -1.294968, 0.7333333, 1, 0, 1,
-0.7945285, -0.01322223, -1.716754, 0.7294118, 1, 0, 1,
-0.7855002, -0.2735071, -1.729333, 0.7215686, 1, 0, 1,
-0.7842095, -1.338133, -3.190493, 0.7176471, 1, 0, 1,
-0.7811424, -0.8878329, -1.702229, 0.7098039, 1, 0, 1,
-0.7784585, -0.6656167, -2.996703, 0.7058824, 1, 0, 1,
-0.7774287, -0.9226585, -2.280188, 0.6980392, 1, 0, 1,
-0.7711002, -1.623614, -3.446494, 0.6901961, 1, 0, 1,
-0.7692229, -1.436273, -1.421722, 0.6862745, 1, 0, 1,
-0.7656071, 1.671963, 1.725176, 0.6784314, 1, 0, 1,
-0.7627842, -0.2642603, -2.895568, 0.6745098, 1, 0, 1,
-0.7611127, 0.1822346, -1.096025, 0.6666667, 1, 0, 1,
-0.7516431, -0.6160156, -1.061734, 0.6627451, 1, 0, 1,
-0.7416899, 2.118912, 0.2143401, 0.654902, 1, 0, 1,
-0.7308894, 0.4887427, -1.213175, 0.6509804, 1, 0, 1,
-0.7305912, 0.1946045, -3.681653, 0.6431373, 1, 0, 1,
-0.7270918, 1.038126, -0.6000994, 0.6392157, 1, 0, 1,
-0.7258122, -2.769558, -4.525716, 0.6313726, 1, 0, 1,
-0.7253921, -1.028914, -3.818312, 0.627451, 1, 0, 1,
-0.7252185, -0.03405296, -1.683402, 0.6196079, 1, 0, 1,
-0.7243354, 1.759626, 0.4989133, 0.6156863, 1, 0, 1,
-0.7166919, 0.1119523, -2.536805, 0.6078432, 1, 0, 1,
-0.7125641, -1.301145, -2.249281, 0.6039216, 1, 0, 1,
-0.7113593, -2.019557, -2.416132, 0.5960785, 1, 0, 1,
-0.7067319, 1.91141, -0.5768239, 0.5882353, 1, 0, 1,
-0.705103, -0.4896506, -1.453722, 0.5843138, 1, 0, 1,
-0.7041453, -0.120887, -1.404372, 0.5764706, 1, 0, 1,
-0.7031299, 0.1995608, -1.320455, 0.572549, 1, 0, 1,
-0.699821, -1.411842, -2.54493, 0.5647059, 1, 0, 1,
-0.6992186, 1.363898, 1.198017, 0.5607843, 1, 0, 1,
-0.6951032, 1.223849, -0.6910374, 0.5529412, 1, 0, 1,
-0.6945649, -1.442, -2.213238, 0.5490196, 1, 0, 1,
-0.6939651, 2.927132, -0.7622631, 0.5411765, 1, 0, 1,
-0.693109, -1.404293, -2.815292, 0.5372549, 1, 0, 1,
-0.6911618, -0.4306911, -0.7134572, 0.5294118, 1, 0, 1,
-0.6902817, 0.02861874, -0.8761035, 0.5254902, 1, 0, 1,
-0.688282, 0.144077, -1.7213, 0.5176471, 1, 0, 1,
-0.6814134, 0.07308079, -1.467275, 0.5137255, 1, 0, 1,
-0.6791115, 0.3209552, -1.473424, 0.5058824, 1, 0, 1,
-0.6784605, 1.200525, -1.73479, 0.5019608, 1, 0, 1,
-0.6779751, 0.9722798, -0.4748451, 0.4941176, 1, 0, 1,
-0.6777183, -0.4962418, -2.941102, 0.4862745, 1, 0, 1,
-0.6765636, -0.4189791, -2.67008, 0.4823529, 1, 0, 1,
-0.6742062, 2.231522, -0.6091846, 0.4745098, 1, 0, 1,
-0.6707971, -0.4067185, -1.056155, 0.4705882, 1, 0, 1,
-0.6672187, -0.299818, -3.031469, 0.4627451, 1, 0, 1,
-0.6525985, 1.983362, 0.5397421, 0.4588235, 1, 0, 1,
-0.6463988, 0.6739408, -1.87723, 0.4509804, 1, 0, 1,
-0.6432965, 0.3690902, -2.376673, 0.4470588, 1, 0, 1,
-0.6425794, -0.5082788, -2.581251, 0.4392157, 1, 0, 1,
-0.6422607, -0.4541886, -1.899832, 0.4352941, 1, 0, 1,
-0.6403399, 0.4432264, -0.1899531, 0.427451, 1, 0, 1,
-0.6353766, -1.523399, -2.11927, 0.4235294, 1, 0, 1,
-0.6279551, 0.5323761, 0.8234894, 0.4156863, 1, 0, 1,
-0.6279068, 0.01870764, -0.6421371, 0.4117647, 1, 0, 1,
-0.6253045, 0.1305512, -0.5877454, 0.4039216, 1, 0, 1,
-0.6214505, -0.7415085, -1.209346, 0.3960784, 1, 0, 1,
-0.6184214, 0.587859, 1.254391, 0.3921569, 1, 0, 1,
-0.6181319, -1.36247, -2.123658, 0.3843137, 1, 0, 1,
-0.6155396, -0.2435867, -1.751009, 0.3803922, 1, 0, 1,
-0.6149215, 0.07662242, -1.462265, 0.372549, 1, 0, 1,
-0.6144716, -1.104757, -1.625983, 0.3686275, 1, 0, 1,
-0.6132361, -0.7723769, -3.156651, 0.3607843, 1, 0, 1,
-0.6130775, 0.654011, -1.645266, 0.3568628, 1, 0, 1,
-0.5991551, -0.1580469, -2.595031, 0.3490196, 1, 0, 1,
-0.5976244, -2.107615, -2.565708, 0.345098, 1, 0, 1,
-0.5862433, 0.3063893, -3.231229, 0.3372549, 1, 0, 1,
-0.5813046, 0.6459369, 0.2591131, 0.3333333, 1, 0, 1,
-0.5792857, 1.006273, -1.328916, 0.3254902, 1, 0, 1,
-0.5779301, 0.3417866, -0.398348, 0.3215686, 1, 0, 1,
-0.577149, -0.9513016, -5.027041, 0.3137255, 1, 0, 1,
-0.5759068, -0.09073415, -2.520645, 0.3098039, 1, 0, 1,
-0.5698965, -0.05578963, -1.235254, 0.3019608, 1, 0, 1,
-0.5670986, 0.09275725, -2.471849, 0.2941177, 1, 0, 1,
-0.5655935, 0.1272513, -0.661176, 0.2901961, 1, 0, 1,
-0.5646372, 0.8250266, -1.511425, 0.282353, 1, 0, 1,
-0.5629763, 0.6169904, 0.0923822, 0.2784314, 1, 0, 1,
-0.5542035, -1.048221, -2.331945, 0.2705882, 1, 0, 1,
-0.5457458, -0.6309528, -4.380457, 0.2666667, 1, 0, 1,
-0.5449503, -0.09257068, -1.90037, 0.2588235, 1, 0, 1,
-0.5363663, -1.081064, -4.022505, 0.254902, 1, 0, 1,
-0.5329826, 0.5932676, -0.3552968, 0.2470588, 1, 0, 1,
-0.5257029, -2.184838, -1.323619, 0.2431373, 1, 0, 1,
-0.521554, 1.085219, -1.164557, 0.2352941, 1, 0, 1,
-0.5213907, 1.060395, -0.8117609, 0.2313726, 1, 0, 1,
-0.5206734, -0.1863301, -1.367759, 0.2235294, 1, 0, 1,
-0.520298, -1.355236, 0.4924412, 0.2196078, 1, 0, 1,
-0.5179122, 1.10774, -1.647696, 0.2117647, 1, 0, 1,
-0.514331, -0.3510797, -0.501142, 0.2078431, 1, 0, 1,
-0.5089902, 2.034177, -0.3184174, 0.2, 1, 0, 1,
-0.5082536, -0.2886131, -3.966424, 0.1921569, 1, 0, 1,
-0.4963771, -0.6151115, -0.6429711, 0.1882353, 1, 0, 1,
-0.4939837, 1.345149, 0.254186, 0.1803922, 1, 0, 1,
-0.4918778, -0.2139659, -1.85693, 0.1764706, 1, 0, 1,
-0.4859084, 0.4964525, -2.164379, 0.1686275, 1, 0, 1,
-0.4857838, -1.234815, -2.387406, 0.1647059, 1, 0, 1,
-0.4857313, 0.6587626, -1.930727, 0.1568628, 1, 0, 1,
-0.484964, 0.5122931, 0.2452611, 0.1529412, 1, 0, 1,
-0.484859, -1.998248, -3.312822, 0.145098, 1, 0, 1,
-0.4806102, -1.871374, -4.244364, 0.1411765, 1, 0, 1,
-0.474482, -1.340899, -2.760647, 0.1333333, 1, 0, 1,
-0.467819, 0.03637671, -0.9697904, 0.1294118, 1, 0, 1,
-0.4663357, -0.5400655, -1.446387, 0.1215686, 1, 0, 1,
-0.4635066, 0.7902671, -1.371283, 0.1176471, 1, 0, 1,
-0.4612612, 0.4265912, -0.1138847, 0.1098039, 1, 0, 1,
-0.4593143, -0.1572832, -1.153983, 0.1058824, 1, 0, 1,
-0.4573223, -1.51119, -2.739967, 0.09803922, 1, 0, 1,
-0.4543253, -1.89469, -2.026681, 0.09019608, 1, 0, 1,
-0.4532468, 0.6647361, -0.3991396, 0.08627451, 1, 0, 1,
-0.4514177, 0.3728699, -3.2848, 0.07843138, 1, 0, 1,
-0.4444494, 1.086453, -1.263498, 0.07450981, 1, 0, 1,
-0.4372537, 0.6447853, 0.13739, 0.06666667, 1, 0, 1,
-0.435095, -0.778397, -1.57486, 0.0627451, 1, 0, 1,
-0.4310106, -0.4750072, -1.486789, 0.05490196, 1, 0, 1,
-0.4306522, -0.07935849, -1.165281, 0.05098039, 1, 0, 1,
-0.4257951, 0.7709579, -1.050675, 0.04313726, 1, 0, 1,
-0.419732, 0.4313188, -1.028646, 0.03921569, 1, 0, 1,
-0.4145726, 1.118446, -1.933118, 0.03137255, 1, 0, 1,
-0.4141204, 0.3899449, -1.314558, 0.02745098, 1, 0, 1,
-0.4131937, -0.9504723, -3.257457, 0.01960784, 1, 0, 1,
-0.4049389, 1.664605, 0.08236034, 0.01568628, 1, 0, 1,
-0.4002641, 0.08528803, -0.2781116, 0.007843138, 1, 0, 1,
-0.3990588, 0.20545, -0.8426426, 0.003921569, 1, 0, 1,
-0.3986811, -0.02681628, -0.02885746, 0, 1, 0.003921569, 1,
-0.3954313, -0.970082, -3.354834, 0, 1, 0.01176471, 1,
-0.3937656, 1.061226, -3.300679, 0, 1, 0.01568628, 1,
-0.3937363, -0.3683276, -3.051466, 0, 1, 0.02352941, 1,
-0.393583, -0.6907154, -1.588015, 0, 1, 0.02745098, 1,
-0.391847, 1.409818, 1.649908, 0, 1, 0.03529412, 1,
-0.3835729, 1.831812, -0.3023646, 0, 1, 0.03921569, 1,
-0.3772589, 0.6680181, -0.2493654, 0, 1, 0.04705882, 1,
-0.3733623, -0.5081155, -1.273144, 0, 1, 0.05098039, 1,
-0.3712197, -0.9688501, -3.566897, 0, 1, 0.05882353, 1,
-0.3696069, -1.195805, -3.552439, 0, 1, 0.0627451, 1,
-0.3687592, 0.6142813, -1.486646, 0, 1, 0.07058824, 1,
-0.3632828, -0.4886889, -1.686134, 0, 1, 0.07450981, 1,
-0.35921, -1.274651, -3.109291, 0, 1, 0.08235294, 1,
-0.3480852, 0.2323333, -2.136874, 0, 1, 0.08627451, 1,
-0.3438598, 1.955583, -1.530064, 0, 1, 0.09411765, 1,
-0.3417755, 0.2666394, -2.565043, 0, 1, 0.1019608, 1,
-0.3367447, 0.6369391, -1.32709, 0, 1, 0.1058824, 1,
-0.335297, -0.8268383, -2.61172, 0, 1, 0.1137255, 1,
-0.3346478, 0.2043511, -2.814526, 0, 1, 0.1176471, 1,
-0.3310618, -0.8552389, -3.004321, 0, 1, 0.1254902, 1,
-0.330092, -0.6207318, -4.340734, 0, 1, 0.1294118, 1,
-0.3277389, -0.5125607, -0.616587, 0, 1, 0.1372549, 1,
-0.3262845, -0.967559, -1.508428, 0, 1, 0.1411765, 1,
-0.325123, 0.4177978, -0.5762824, 0, 1, 0.1490196, 1,
-0.3243305, -0.9404498, -3.703776, 0, 1, 0.1529412, 1,
-0.3233129, -0.686066, -2.288045, 0, 1, 0.1607843, 1,
-0.3188059, -0.6929879, -1.074702, 0, 1, 0.1647059, 1,
-0.318211, -1.291904, -2.383825, 0, 1, 0.172549, 1,
-0.3134371, 0.3961343, -1.907523, 0, 1, 0.1764706, 1,
-0.3072508, -0.6336036, -4.700777, 0, 1, 0.1843137, 1,
-0.3048585, -0.5431849, -1.243354, 0, 1, 0.1882353, 1,
-0.302738, 0.01800512, -1.844472, 0, 1, 0.1960784, 1,
-0.3006827, 0.2333398, -0.510475, 0, 1, 0.2039216, 1,
-0.2984819, -1.050123, -4.05531, 0, 1, 0.2078431, 1,
-0.2980689, -0.3801138, -2.685842, 0, 1, 0.2156863, 1,
-0.2944994, 0.5472276, -0.5936284, 0, 1, 0.2196078, 1,
-0.2942964, 0.2280836, -0.5085397, 0, 1, 0.227451, 1,
-0.2927448, -1.559272, -2.485813, 0, 1, 0.2313726, 1,
-0.291396, -1.615344, -4.30682, 0, 1, 0.2392157, 1,
-0.2891324, 1.64692, -2.029156, 0, 1, 0.2431373, 1,
-0.288904, -0.2522979, -2.834595, 0, 1, 0.2509804, 1,
-0.2887682, 0.8206397, -0.3534753, 0, 1, 0.254902, 1,
-0.2872251, -2.39615, -3.763259, 0, 1, 0.2627451, 1,
-0.286824, 0.5936407, -0.3716207, 0, 1, 0.2666667, 1,
-0.2866278, 0.370277, -0.1878446, 0, 1, 0.2745098, 1,
-0.2855325, -0.1736449, -1.37708, 0, 1, 0.2784314, 1,
-0.2833542, -0.3220015, -1.153012, 0, 1, 0.2862745, 1,
-0.2823777, 2.085144, 1.270263, 0, 1, 0.2901961, 1,
-0.2755045, 0.7133662, -0.2569354, 0, 1, 0.2980392, 1,
-0.2732477, -0.5483505, -1.025561, 0, 1, 0.3058824, 1,
-0.2725038, 0.2831608, -1.210362, 0, 1, 0.3098039, 1,
-0.2588482, 0.795365, -0.2494839, 0, 1, 0.3176471, 1,
-0.2562614, 1.912463, 0.8391817, 0, 1, 0.3215686, 1,
-0.2532565, -1.612293, -2.746235, 0, 1, 0.3294118, 1,
-0.2500187, -1.06847, -1.680627, 0, 1, 0.3333333, 1,
-0.2418676, 1.909066, -1.576468, 0, 1, 0.3411765, 1,
-0.2372285, 0.4180164, 0.5957942, 0, 1, 0.345098, 1,
-0.2366786, 0.2592594, -1.26556, 0, 1, 0.3529412, 1,
-0.2350903, -1.769399, -3.629676, 0, 1, 0.3568628, 1,
-0.2274925, 1.713586, 0.02768961, 0, 1, 0.3647059, 1,
-0.2258416, 0.1285869, -2.51591, 0, 1, 0.3686275, 1,
-0.2225889, 0.1653561, -1.816202, 0, 1, 0.3764706, 1,
-0.2212679, 0.9454576, 0.600922, 0, 1, 0.3803922, 1,
-0.2099551, 1.258276, -0.5489141, 0, 1, 0.3882353, 1,
-0.1998965, 0.7833149, -0.5066757, 0, 1, 0.3921569, 1,
-0.1998698, -0.4666412, -2.735194, 0, 1, 0.4, 1,
-0.1995869, -0.5073461, -2.260689, 0, 1, 0.4078431, 1,
-0.1985301, 0.09228539, -1.699378, 0, 1, 0.4117647, 1,
-0.1910402, 0.8051726, -1.480243, 0, 1, 0.4196078, 1,
-0.1909049, 1.213976, -0.1798397, 0, 1, 0.4235294, 1,
-0.1884628, 2.767266, 1.952184, 0, 1, 0.4313726, 1,
-0.1860992, 0.09060525, -3.312788, 0, 1, 0.4352941, 1,
-0.1854774, 0.8764634, -1.196281, 0, 1, 0.4431373, 1,
-0.1851867, -0.7335002, -0.9795245, 0, 1, 0.4470588, 1,
-0.1828082, -1.115724, -4.151862, 0, 1, 0.454902, 1,
-0.1806493, 1.360741, -0.9986671, 0, 1, 0.4588235, 1,
-0.1804676, -0.3415076, -0.8910538, 0, 1, 0.4666667, 1,
-0.1789831, -0.4067957, -1.212643, 0, 1, 0.4705882, 1,
-0.1748352, -1.049434, -2.351164, 0, 1, 0.4784314, 1,
-0.1718713, -1.74344, -3.816689, 0, 1, 0.4823529, 1,
-0.1710435, 1.42053, 0.4126382, 0, 1, 0.4901961, 1,
-0.1697242, 0.4270271, -1.006145, 0, 1, 0.4941176, 1,
-0.1692702, -1.445976, -3.872959, 0, 1, 0.5019608, 1,
-0.1663112, -0.5613135, -2.756059, 0, 1, 0.509804, 1,
-0.162452, -1.150504, -1.854233, 0, 1, 0.5137255, 1,
-0.1595698, -2.188626, -3.623408, 0, 1, 0.5215687, 1,
-0.1591035, 0.4459117, -2.819747, 0, 1, 0.5254902, 1,
-0.1580105, -0.1779431, -2.097337, 0, 1, 0.5333334, 1,
-0.1545325, -0.09799509, -1.670576, 0, 1, 0.5372549, 1,
-0.1534722, -0.1958261, -1.593471, 0, 1, 0.5450981, 1,
-0.1456587, 1.27947, -0.7265884, 0, 1, 0.5490196, 1,
-0.1394866, -0.8622591, -1.471793, 0, 1, 0.5568628, 1,
-0.1380301, -0.6092002, -4.631687, 0, 1, 0.5607843, 1,
-0.1371785, -0.5798599, -3.518306, 0, 1, 0.5686275, 1,
-0.1343996, 0.1845774, -0.2851447, 0, 1, 0.572549, 1,
-0.1323578, 1.337353, -0.3280698, 0, 1, 0.5803922, 1,
-0.1315226, 0.6781328, -1.935727, 0, 1, 0.5843138, 1,
-0.128378, 0.5080833, -0.5869142, 0, 1, 0.5921569, 1,
-0.1220127, 1.800646, -0.2025395, 0, 1, 0.5960785, 1,
-0.1210196, -0.6120434, -2.806052, 0, 1, 0.6039216, 1,
-0.117, 0.4800148, -1.912017, 0, 1, 0.6117647, 1,
-0.1166959, 1.488072, 0.3860477, 0, 1, 0.6156863, 1,
-0.1116076, 0.9011121, 0.2578028, 0, 1, 0.6235294, 1,
-0.1103852, -0.533291, -3.201407, 0, 1, 0.627451, 1,
-0.1047654, 1.4205, -0.1755146, 0, 1, 0.6352941, 1,
-0.1022997, 1.082631, 0.286043, 0, 1, 0.6392157, 1,
-0.1019552, 0.4735072, 1.426387, 0, 1, 0.6470588, 1,
-0.09842167, 0.03518854, -0.9650296, 0, 1, 0.6509804, 1,
-0.09023975, -0.1369114, -1.710215, 0, 1, 0.6588235, 1,
-0.08907726, -0.1407306, -1.964253, 0, 1, 0.6627451, 1,
-0.08870461, 0.5932502, -2.370436, 0, 1, 0.6705883, 1,
-0.08827145, -1.163049, -3.946234, 0, 1, 0.6745098, 1,
-0.0841885, 0.5769792, 0.2072295, 0, 1, 0.682353, 1,
-0.08370224, 1.57079, 1.275949, 0, 1, 0.6862745, 1,
-0.08358442, -0.2182688, -2.570053, 0, 1, 0.6941177, 1,
-0.07909197, -0.7171263, -3.630028, 0, 1, 0.7019608, 1,
-0.0776615, -2.744614, -3.446296, 0, 1, 0.7058824, 1,
-0.0746314, 1.626622, -0.4781336, 0, 1, 0.7137255, 1,
-0.07262781, -0.1919934, -1.300449, 0, 1, 0.7176471, 1,
-0.07088833, 0.4909118, 0.4727264, 0, 1, 0.7254902, 1,
-0.06998133, -0.03572679, -0.03238278, 0, 1, 0.7294118, 1,
-0.06596555, -0.4401962, -3.061779, 0, 1, 0.7372549, 1,
-0.06472199, 0.9553161, -0.6604604, 0, 1, 0.7411765, 1,
-0.0632375, -0.05945748, -3.119608, 0, 1, 0.7490196, 1,
-0.06226023, 1.836995, -2.203608, 0, 1, 0.7529412, 1,
-0.05904598, -0.7407388, 0.03180845, 0, 1, 0.7607843, 1,
-0.05827833, -0.2689102, -4.223798, 0, 1, 0.7647059, 1,
-0.05799645, -0.3683982, -4.332426, 0, 1, 0.772549, 1,
-0.05319743, 1.252273, 0.5146144, 0, 1, 0.7764706, 1,
-0.05295485, 0.4092735, -0.6792966, 0, 1, 0.7843137, 1,
-0.05031225, -0.6513239, -3.840482, 0, 1, 0.7882353, 1,
-0.04234917, 0.05862547, 0.1112899, 0, 1, 0.7960784, 1,
-0.04026958, 2.281222, -0.7639486, 0, 1, 0.8039216, 1,
-0.0401659, 0.8330451, 2.053285, 0, 1, 0.8078431, 1,
-0.03757083, 0.1928656, -0.3821101, 0, 1, 0.8156863, 1,
-0.0330914, -0.1435343, -3.561594, 0, 1, 0.8196079, 1,
-0.03308974, -2.107228, -2.79198, 0, 1, 0.827451, 1,
-0.03219775, -0.7562916, -6.958219, 0, 1, 0.8313726, 1,
-0.03206802, 1.298705, -1.135723, 0, 1, 0.8392157, 1,
-0.02930407, -1.619761, -4.310457, 0, 1, 0.8431373, 1,
-0.02655183, -1.134067, -2.221618, 0, 1, 0.8509804, 1,
-0.01987711, 1.893643, -0.5892031, 0, 1, 0.854902, 1,
-0.01157951, 0.9558377, 2.518643, 0, 1, 0.8627451, 1,
-0.007254906, 0.8007249, -1.015441, 0, 1, 0.8666667, 1,
-0.006482974, -0.3440412, -3.81669, 0, 1, 0.8745098, 1,
-0.003425471, 1.098501, 1.330003, 0, 1, 0.8784314, 1,
-0.0006362455, -1.748703, -2.835747, 0, 1, 0.8862745, 1,
0.003148701, 0.1436929, 0.0943497, 0, 1, 0.8901961, 1,
0.007712594, 0.5079613, 0.03783846, 0, 1, 0.8980392, 1,
0.01260761, -1.789948, 3.898352, 0, 1, 0.9058824, 1,
0.01356809, -0.9261804, 3.221772, 0, 1, 0.9098039, 1,
0.01773633, -0.6124239, 3.069803, 0, 1, 0.9176471, 1,
0.01946017, 0.2989875, 0.7811712, 0, 1, 0.9215686, 1,
0.02123399, 1.616192, 1.515264, 0, 1, 0.9294118, 1,
0.02209552, 0.8889756, -2.238049, 0, 1, 0.9333333, 1,
0.02252782, 0.8760672, 0.4170904, 0, 1, 0.9411765, 1,
0.023047, 0.1788356, 0.8420671, 0, 1, 0.945098, 1,
0.02840539, 1.848391, -0.4183141, 0, 1, 0.9529412, 1,
0.03235037, -0.2091839, 1.472062, 0, 1, 0.9568627, 1,
0.03788697, -0.4929333, 2.670616, 0, 1, 0.9647059, 1,
0.03932235, 0.7346302, 0.4199172, 0, 1, 0.9686275, 1,
0.04267319, 1.022196, 1.128797, 0, 1, 0.9764706, 1,
0.04810137, 1.41174, 2.177853, 0, 1, 0.9803922, 1,
0.04929918, -1.133608, 2.948574, 0, 1, 0.9882353, 1,
0.04999499, 1.294928, -0.4652491, 0, 1, 0.9921569, 1,
0.05034706, -0.6683939, 1.472678, 0, 1, 1, 1,
0.05266384, 0.05708826, 1.887629, 0, 0.9921569, 1, 1,
0.05379257, 0.3232622, -1.470078, 0, 0.9882353, 1, 1,
0.05993862, -0.7713538, 3.24986, 0, 0.9803922, 1, 1,
0.06023925, 0.7290577, 0.4262959, 0, 0.9764706, 1, 1,
0.06091786, -0.4606647, 3.814056, 0, 0.9686275, 1, 1,
0.06343532, -2.07697, 4.011321, 0, 0.9647059, 1, 1,
0.06347542, 0.2109041, -0.02397399, 0, 0.9568627, 1, 1,
0.06555562, -0.6706741, 4.753247, 0, 0.9529412, 1, 1,
0.06712836, -0.5499049, 2.884953, 0, 0.945098, 1, 1,
0.06976677, 0.3348807, -0.3617691, 0, 0.9411765, 1, 1,
0.07101142, 0.798377, 0.06388611, 0, 0.9333333, 1, 1,
0.07201084, -0.1192397, 1.851782, 0, 0.9294118, 1, 1,
0.07265326, -0.7360368, 3.711583, 0, 0.9215686, 1, 1,
0.0732303, -0.06408337, 2.606616, 0, 0.9176471, 1, 1,
0.07551639, 1.118047, -0.3377477, 0, 0.9098039, 1, 1,
0.07912707, 1.3671, -1.257594, 0, 0.9058824, 1, 1,
0.08000569, 1.124073, 0.9553769, 0, 0.8980392, 1, 1,
0.09212354, 0.4423535, -1.615929, 0, 0.8901961, 1, 1,
0.09239615, -0.7708853, 1.492598, 0, 0.8862745, 1, 1,
0.09429112, 1.000443, -0.3302799, 0, 0.8784314, 1, 1,
0.09563497, -0.632351, 2.194808, 0, 0.8745098, 1, 1,
0.09892283, 0.09115066, 0.561435, 0, 0.8666667, 1, 1,
0.09997837, 0.9189609, 0.523092, 0, 0.8627451, 1, 1,
0.1046373, 0.1220369, 0.7707428, 0, 0.854902, 1, 1,
0.1053165, 1.166035, 0.8506395, 0, 0.8509804, 1, 1,
0.1064921, 1.279715, 1.951089, 0, 0.8431373, 1, 1,
0.1089594, -0.1880637, 2.583612, 0, 0.8392157, 1, 1,
0.1111139, -1.138373, 3.671731, 0, 0.8313726, 1, 1,
0.1113754, -1.34487, 3.624402, 0, 0.827451, 1, 1,
0.1176681, -1.876336, 1.6323, 0, 0.8196079, 1, 1,
0.1212958, 0.8734612, 0.481301, 0, 0.8156863, 1, 1,
0.1230972, 0.2198341, 0.138845, 0, 0.8078431, 1, 1,
0.1242486, 0.4695815, 0.04123725, 0, 0.8039216, 1, 1,
0.1258136, 2.081072, 1.407491, 0, 0.7960784, 1, 1,
0.1260812, 0.09149621, 1.821774, 0, 0.7882353, 1, 1,
0.127693, -0.6065924, 1.995873, 0, 0.7843137, 1, 1,
0.1278339, 1.587357, -0.2288408, 0, 0.7764706, 1, 1,
0.1304596, -0.4909963, 3.650557, 0, 0.772549, 1, 1,
0.1336241, 1.794023, 1.056382, 0, 0.7647059, 1, 1,
0.1353275, 0.455364, 2.118807, 0, 0.7607843, 1, 1,
0.1391651, 0.1142081, 1.148191, 0, 0.7529412, 1, 1,
0.1395448, 0.8371414, -1.192639, 0, 0.7490196, 1, 1,
0.1403806, -0.8182431, 3.185463, 0, 0.7411765, 1, 1,
0.1403962, -0.5354307, 1.738276, 0, 0.7372549, 1, 1,
0.1416955, 0.6068568, -1.961984, 0, 0.7294118, 1, 1,
0.1418059, 0.05104096, 1.580463, 0, 0.7254902, 1, 1,
0.1450006, -0.8996614, 1.908371, 0, 0.7176471, 1, 1,
0.1450351, 1.696646, 0.8676426, 0, 0.7137255, 1, 1,
0.1463197, -0.5534425, 2.868355, 0, 0.7058824, 1, 1,
0.1473969, 0.08719315, -0.7751038, 0, 0.6980392, 1, 1,
0.1491004, -1.213232, 4.352498, 0, 0.6941177, 1, 1,
0.1513062, 0.1834397, 0.9365857, 0, 0.6862745, 1, 1,
0.1541959, 0.1753187, 0.367869, 0, 0.682353, 1, 1,
0.155397, 1.342105, -1.394216, 0, 0.6745098, 1, 1,
0.1556431, -1.561608, 2.514776, 0, 0.6705883, 1, 1,
0.162489, 0.04924797, 1.800042, 0, 0.6627451, 1, 1,
0.1678811, 1.538086, 2.920159, 0, 0.6588235, 1, 1,
0.1689521, 0.9979554, -0.606472, 0, 0.6509804, 1, 1,
0.1694841, -0.3996833, 2.577679, 0, 0.6470588, 1, 1,
0.1741173, -0.1375274, -0.3104684, 0, 0.6392157, 1, 1,
0.1820647, 0.6853846, -0.8332719, 0, 0.6352941, 1, 1,
0.1821377, 1.816933, 0.7027815, 0, 0.627451, 1, 1,
0.1823214, -0.3103956, 3.430475, 0, 0.6235294, 1, 1,
0.1838823, 0.5727407, 1.071714, 0, 0.6156863, 1, 1,
0.1858992, 1.361346, 0.7493564, 0, 0.6117647, 1, 1,
0.1915304, -1.902287, 3.053182, 0, 0.6039216, 1, 1,
0.1922254, -1.130358, 2.33291, 0, 0.5960785, 1, 1,
0.1954695, 0.4260195, 1.073241, 0, 0.5921569, 1, 1,
0.1969526, 0.9136139, 0.6288038, 0, 0.5843138, 1, 1,
0.1993195, -0.01505787, 0.6300875, 0, 0.5803922, 1, 1,
0.1996247, -1.727048, 3.770863, 0, 0.572549, 1, 1,
0.2034101, 1.767919, 1.362857, 0, 0.5686275, 1, 1,
0.205481, -0.1210526, 2.92043, 0, 0.5607843, 1, 1,
0.2077622, 0.3003003, -0.2300508, 0, 0.5568628, 1, 1,
0.2082511, -2.73287, 3.298087, 0, 0.5490196, 1, 1,
0.2174045, -0.0850398, 0.1404838, 0, 0.5450981, 1, 1,
0.2176227, -1.247002, 3.433868, 0, 0.5372549, 1, 1,
0.2209432, 0.3808917, 0.8503474, 0, 0.5333334, 1, 1,
0.222535, -1.066403, 3.719052, 0, 0.5254902, 1, 1,
0.222776, -0.5530494, 2.941014, 0, 0.5215687, 1, 1,
0.2241893, -0.1492749, 3.903538, 0, 0.5137255, 1, 1,
0.2285616, 0.8196735, 1.882551, 0, 0.509804, 1, 1,
0.2298478, 0.2596133, 2.594697, 0, 0.5019608, 1, 1,
0.2311142, 0.5293376, -0.7531308, 0, 0.4941176, 1, 1,
0.2459841, 1.234619, 0.9286355, 0, 0.4901961, 1, 1,
0.2465193, 0.4124784, 1.940257, 0, 0.4823529, 1, 1,
0.2472747, 0.02237723, 2.567245, 0, 0.4784314, 1, 1,
0.2498677, -1.274878, 3.008042, 0, 0.4705882, 1, 1,
0.2559828, -1.349237, 1.682118, 0, 0.4666667, 1, 1,
0.2568591, 1.121722, 1.388773, 0, 0.4588235, 1, 1,
0.2573539, -1.800599, 2.542371, 0, 0.454902, 1, 1,
0.2624736, 0.3669772, -0.7292392, 0, 0.4470588, 1, 1,
0.2638946, 0.209364, 1.26636, 0, 0.4431373, 1, 1,
0.2645312, 1.531176, -0.02519218, 0, 0.4352941, 1, 1,
0.2646013, 0.6808634, -0.5603392, 0, 0.4313726, 1, 1,
0.2658573, -1.536346, 2.460914, 0, 0.4235294, 1, 1,
0.2684414, 0.3705976, -1.541581, 0, 0.4196078, 1, 1,
0.2728021, -1.128748, 3.835524, 0, 0.4117647, 1, 1,
0.2736529, 2.048651, 1.753086, 0, 0.4078431, 1, 1,
0.2743736, 0.5285462, 0.4089399, 0, 0.4, 1, 1,
0.2815975, -1.754313, 2.982103, 0, 0.3921569, 1, 1,
0.2845243, 0.3311653, 0.3417802, 0, 0.3882353, 1, 1,
0.296584, 1.089033, 0.8874563, 0, 0.3803922, 1, 1,
0.2979837, 0.2056144, 0.2440362, 0, 0.3764706, 1, 1,
0.300758, -1.14265, 2.771527, 0, 0.3686275, 1, 1,
0.3012026, 1.220542, 0.4464503, 0, 0.3647059, 1, 1,
0.3013382, 1.764991, 1.970014, 0, 0.3568628, 1, 1,
0.3017428, -0.4842879, 2.82777, 0, 0.3529412, 1, 1,
0.3031118, -1.424461, 1.51136, 0, 0.345098, 1, 1,
0.303811, -0.5909255, 3.448508, 0, 0.3411765, 1, 1,
0.3046995, -0.9867387, 2.919997, 0, 0.3333333, 1, 1,
0.3073316, -1.311647, 2.480896, 0, 0.3294118, 1, 1,
0.3076099, 0.6736429, 0.3133843, 0, 0.3215686, 1, 1,
0.3090265, -0.6208827, 1.575196, 0, 0.3176471, 1, 1,
0.3126286, -0.3251625, 1.567513, 0, 0.3098039, 1, 1,
0.31386, 0.3090033, -0.3864294, 0, 0.3058824, 1, 1,
0.3166352, -0.5354097, 3.494217, 0, 0.2980392, 1, 1,
0.3183983, -0.4422448, 2.742792, 0, 0.2901961, 1, 1,
0.3203348, 0.03064016, 2.628626, 0, 0.2862745, 1, 1,
0.321667, 0.7380551, 0.8341095, 0, 0.2784314, 1, 1,
0.3230985, 1.06415, 1.355154, 0, 0.2745098, 1, 1,
0.3233065, 0.782005, -0.8643683, 0, 0.2666667, 1, 1,
0.3241761, 0.9913639, -0.5204789, 0, 0.2627451, 1, 1,
0.3266866, -0.1148294, 0.8962892, 0, 0.254902, 1, 1,
0.327983, -0.5470523, 4.033121, 0, 0.2509804, 1, 1,
0.3315327, -0.6013567, 2.311832, 0, 0.2431373, 1, 1,
0.3326074, 1.80685, 0.7881191, 0, 0.2392157, 1, 1,
0.335144, 0.6086753, -0.2801318, 0, 0.2313726, 1, 1,
0.3474014, -0.4655405, 2.768299, 0, 0.227451, 1, 1,
0.352615, 1.631952, 0.4528199, 0, 0.2196078, 1, 1,
0.3573509, 1.078704, 0.05302311, 0, 0.2156863, 1, 1,
0.3575793, 0.1958252, 1.590767, 0, 0.2078431, 1, 1,
0.3578795, 0.8822926, -0.3572648, 0, 0.2039216, 1, 1,
0.3590378, 2.089159, 2.313928, 0, 0.1960784, 1, 1,
0.3615285, -0.3686022, 1.861894, 0, 0.1882353, 1, 1,
0.3643634, 0.8672229, 0.8036683, 0, 0.1843137, 1, 1,
0.3675766, -1.706354, 4.801567, 0, 0.1764706, 1, 1,
0.3680856, -0.5197686, 3.034815, 0, 0.172549, 1, 1,
0.368409, 0.3756901, 1.093344, 0, 0.1647059, 1, 1,
0.3702757, -0.2688698, 3.017867, 0, 0.1607843, 1, 1,
0.3739365, -0.01856458, 0.3319541, 0, 0.1529412, 1, 1,
0.3750204, -0.03148539, 2.116352, 0, 0.1490196, 1, 1,
0.3767742, -1.068913, 4.789314, 0, 0.1411765, 1, 1,
0.3780302, 1.198813, 1.710515, 0, 0.1372549, 1, 1,
0.3800007, 0.7215591, 1.053128, 0, 0.1294118, 1, 1,
0.3827201, 0.02578579, 0.721294, 0, 0.1254902, 1, 1,
0.3842096, -0.6903862, 0.8397663, 0, 0.1176471, 1, 1,
0.3853764, 0.07909913, 2.874361, 0, 0.1137255, 1, 1,
0.3855289, -0.9324297, 3.109038, 0, 0.1058824, 1, 1,
0.3871306, 0.9659759, -0.1607952, 0, 0.09803922, 1, 1,
0.3884239, -1.750304, 2.439705, 0, 0.09411765, 1, 1,
0.3937381, -1.087309, 1.233712, 0, 0.08627451, 1, 1,
0.4002496, -1.511181, 4.408715, 0, 0.08235294, 1, 1,
0.4005421, -1.39237, 2.240283, 0, 0.07450981, 1, 1,
0.4065228, -0.7043652, 2.387425, 0, 0.07058824, 1, 1,
0.4076304, -1.851164, 5.446534, 0, 0.0627451, 1, 1,
0.4128739, 1.86085, -1.167929, 0, 0.05882353, 1, 1,
0.4137233, -0.6297899, 3.404591, 0, 0.05098039, 1, 1,
0.4139484, 2.163883, 1.581646, 0, 0.04705882, 1, 1,
0.4160625, -1.477993, 2.557923, 0, 0.03921569, 1, 1,
0.417444, 0.9441051, 0.3903611, 0, 0.03529412, 1, 1,
0.4193576, -1.070153, 1.746749, 0, 0.02745098, 1, 1,
0.4251384, -0.01443743, 2.913148, 0, 0.02352941, 1, 1,
0.4268513, 0.3125373, 0.6134287, 0, 0.01568628, 1, 1,
0.4311505, 1.445292, 1.664237, 0, 0.01176471, 1, 1,
0.4329888, 0.2774261, 1.642381, 0, 0.003921569, 1, 1,
0.4373309, 1.384412, 0.5881322, 0.003921569, 0, 1, 1,
0.4395792, -0.5212114, 2.304016, 0.007843138, 0, 1, 1,
0.4448389, -0.4363243, 3.007084, 0.01568628, 0, 1, 1,
0.4452096, -1.006661, 2.904785, 0.01960784, 0, 1, 1,
0.4537697, 0.6863682, 0.7672113, 0.02745098, 0, 1, 1,
0.4538432, 0.5323483, -0.676246, 0.03137255, 0, 1, 1,
0.4554845, 0.06823087, 2.722793, 0.03921569, 0, 1, 1,
0.4671945, 0.2801241, 0.6078795, 0.04313726, 0, 1, 1,
0.468913, 0.07678747, 1.859893, 0.05098039, 0, 1, 1,
0.4742022, 0.2160871, 1.535136, 0.05490196, 0, 1, 1,
0.4765023, 0.696398, 0.7744555, 0.0627451, 0, 1, 1,
0.4771268, 0.1707752, 1.325575, 0.06666667, 0, 1, 1,
0.4772492, -1.138458, 2.439954, 0.07450981, 0, 1, 1,
0.4778138, -0.5311866, 1.536266, 0.07843138, 0, 1, 1,
0.4790927, -0.2550113, 1.485478, 0.08627451, 0, 1, 1,
0.4801137, 0.8822982, 1.784958, 0.09019608, 0, 1, 1,
0.481868, 1.403432, 0.900255, 0.09803922, 0, 1, 1,
0.485435, -1.564538, 4.390996, 0.1058824, 0, 1, 1,
0.4897464, 0.01507373, 1.357435, 0.1098039, 0, 1, 1,
0.4906363, 1.498708, 1.690266, 0.1176471, 0, 1, 1,
0.4943723, 1.763887, 0.9533104, 0.1215686, 0, 1, 1,
0.5012057, 0.8808249, -0.274128, 0.1294118, 0, 1, 1,
0.5027453, 0.02337187, 2.071522, 0.1333333, 0, 1, 1,
0.5033727, -0.09122839, 1.614681, 0.1411765, 0, 1, 1,
0.5166121, 0.4342849, 1.417759, 0.145098, 0, 1, 1,
0.5214159, 2.317449, 3.325683, 0.1529412, 0, 1, 1,
0.5238302, 0.4163002, 1.744147, 0.1568628, 0, 1, 1,
0.5267196, -0.6547811, 3.803911, 0.1647059, 0, 1, 1,
0.5275851, 1.137846, 1.402195, 0.1686275, 0, 1, 1,
0.5309508, 0.4271356, 0.8502163, 0.1764706, 0, 1, 1,
0.5310514, 0.1589729, 2.284315, 0.1803922, 0, 1, 1,
0.5319727, 0.8026757, -0.01706222, 0.1882353, 0, 1, 1,
0.5339326, 0.4869583, 1.549283, 0.1921569, 0, 1, 1,
0.5388513, -0.3252983, 1.794105, 0.2, 0, 1, 1,
0.5442282, 0.09782037, 3.550667, 0.2078431, 0, 1, 1,
0.546541, 0.09387954, 1.190365, 0.2117647, 0, 1, 1,
0.5468603, -0.1856617, 0.9015877, 0.2196078, 0, 1, 1,
0.5496422, -0.1123148, 3.458154, 0.2235294, 0, 1, 1,
0.5498167, -0.8507593, 3.241892, 0.2313726, 0, 1, 1,
0.5596595, 0.003415928, 3.326313, 0.2352941, 0, 1, 1,
0.5599372, -0.7259713, 2.037731, 0.2431373, 0, 1, 1,
0.5610322, -0.8845803, 2.064793, 0.2470588, 0, 1, 1,
0.5648042, 2.972713, -0.7950308, 0.254902, 0, 1, 1,
0.5696929, 1.064654, -0.6195632, 0.2588235, 0, 1, 1,
0.5715775, -0.008180223, 1.11432, 0.2666667, 0, 1, 1,
0.5737103, -0.9873629, 3.389744, 0.2705882, 0, 1, 1,
0.5816765, -0.04153924, 1.093665, 0.2784314, 0, 1, 1,
0.5853858, -1.046542, 2.615708, 0.282353, 0, 1, 1,
0.5885729, 1.466552, -0.2671899, 0.2901961, 0, 1, 1,
0.5906706, 0.6937933, 1.002453, 0.2941177, 0, 1, 1,
0.5916904, 0.6352468, 0.7465764, 0.3019608, 0, 1, 1,
0.5968813, -0.3364305, 2.280245, 0.3098039, 0, 1, 1,
0.5995089, -1.03868, 1.282812, 0.3137255, 0, 1, 1,
0.6040133, -1.046803, 4.475286, 0.3215686, 0, 1, 1,
0.6050707, 0.8358107, 0.9807339, 0.3254902, 0, 1, 1,
0.6055311, -0.2716987, 3.101691, 0.3333333, 0, 1, 1,
0.6115808, 0.5868499, 0.4143064, 0.3372549, 0, 1, 1,
0.6126171, 0.4746375, 0.02992025, 0.345098, 0, 1, 1,
0.6145994, 0.8667802, 1.715657, 0.3490196, 0, 1, 1,
0.6155709, 0.8986348, 2.33769, 0.3568628, 0, 1, 1,
0.6175416, 0.3004624, 1.223196, 0.3607843, 0, 1, 1,
0.6183327, -0.911871, 2.929248, 0.3686275, 0, 1, 1,
0.6192507, -0.8904702, 2.058544, 0.372549, 0, 1, 1,
0.6195188, 2.636359, 1.17316, 0.3803922, 0, 1, 1,
0.6195332, -1.231775, 2.05413, 0.3843137, 0, 1, 1,
0.6198245, -0.7721326, 2.774127, 0.3921569, 0, 1, 1,
0.6278439, 0.2429405, 0.3663292, 0.3960784, 0, 1, 1,
0.6281915, -1.468975, 0.9286273, 0.4039216, 0, 1, 1,
0.6368836, 0.8159504, 0.4675636, 0.4117647, 0, 1, 1,
0.6416199, -0.2353592, 1.924942, 0.4156863, 0, 1, 1,
0.6493707, 1.515988, 0.605621, 0.4235294, 0, 1, 1,
0.6502478, -0.9220258, 2.812399, 0.427451, 0, 1, 1,
0.6506253, 1.22578, 1.420032, 0.4352941, 0, 1, 1,
0.6522462, -0.4716092, 2.155116, 0.4392157, 0, 1, 1,
0.6533095, 0.8450493, 0.4729344, 0.4470588, 0, 1, 1,
0.6541965, -0.7819158, 2.973572, 0.4509804, 0, 1, 1,
0.6549842, -0.2038693, 2.741955, 0.4588235, 0, 1, 1,
0.6578331, -0.3720017, 2.723865, 0.4627451, 0, 1, 1,
0.6620566, 1.396855, 1.716383, 0.4705882, 0, 1, 1,
0.6723282, 1.41985, 0.05353352, 0.4745098, 0, 1, 1,
0.6736343, 1.948403, 0.2978129, 0.4823529, 0, 1, 1,
0.6758011, -0.8364296, 2.593127, 0.4862745, 0, 1, 1,
0.67882, 1.541062, 1.324861, 0.4941176, 0, 1, 1,
0.6798043, -1.21502, 3.931252, 0.5019608, 0, 1, 1,
0.6817823, 1.357911, -0.1691387, 0.5058824, 0, 1, 1,
0.6866234, -0.3065145, 1.754344, 0.5137255, 0, 1, 1,
0.6870431, -1.002136, 3.20734, 0.5176471, 0, 1, 1,
0.6872565, -1.63305, 4.349431, 0.5254902, 0, 1, 1,
0.6902612, -0.3175285, 0.2494175, 0.5294118, 0, 1, 1,
0.6943949, 0.7038394, 0.3578377, 0.5372549, 0, 1, 1,
0.6973503, 0.7867857, 1.541115, 0.5411765, 0, 1, 1,
0.6987587, 0.230354, 2.105224, 0.5490196, 0, 1, 1,
0.7027726, 0.06358818, 0.8471541, 0.5529412, 0, 1, 1,
0.7037129, 0.1945031, 2.596703, 0.5607843, 0, 1, 1,
0.7091667, -0.7251726, 1.74377, 0.5647059, 0, 1, 1,
0.7126116, 1.059486, -0.713525, 0.572549, 0, 1, 1,
0.7128386, 0.08625797, -0.2831979, 0.5764706, 0, 1, 1,
0.7139536, -0.4288955, 1.348921, 0.5843138, 0, 1, 1,
0.7154168, 2.751336, -0.5139059, 0.5882353, 0, 1, 1,
0.7173885, -0.7832029, 2.582644, 0.5960785, 0, 1, 1,
0.7244985, 0.6571547, 0.1038831, 0.6039216, 0, 1, 1,
0.7286342, -1.243404, 1.529642, 0.6078432, 0, 1, 1,
0.735467, -1.352471, 2.952443, 0.6156863, 0, 1, 1,
0.7360929, 0.8100337, 0.9747466, 0.6196079, 0, 1, 1,
0.7398945, 0.03890523, 1.628124, 0.627451, 0, 1, 1,
0.7416831, -0.4704631, 0.07098125, 0.6313726, 0, 1, 1,
0.7468868, 1.351951, 0.002497894, 0.6392157, 0, 1, 1,
0.7469783, 1.325103, -0.0998288, 0.6431373, 0, 1, 1,
0.7470608, -0.07992517, 3.096706, 0.6509804, 0, 1, 1,
0.7539533, -1.496786, 2.955669, 0.654902, 0, 1, 1,
0.7551384, 0.3710333, -0.04334511, 0.6627451, 0, 1, 1,
0.7601238, -0.8582935, -0.7579848, 0.6666667, 0, 1, 1,
0.7633339, -0.5629453, 1.466931, 0.6745098, 0, 1, 1,
0.7648076, 0.2537909, 1.578057, 0.6784314, 0, 1, 1,
0.7653891, 0.3228407, 1.246693, 0.6862745, 0, 1, 1,
0.7706959, 0.07779405, 2.505709, 0.6901961, 0, 1, 1,
0.7881472, 0.7776403, 0.07997646, 0.6980392, 0, 1, 1,
0.7918295, -0.09192099, 2.503642, 0.7058824, 0, 1, 1,
0.7950467, 0.8868248, 1.635639, 0.7098039, 0, 1, 1,
0.7971212, 0.1907344, 2.727268, 0.7176471, 0, 1, 1,
0.8011354, -0.4419052, 2.840178, 0.7215686, 0, 1, 1,
0.8012623, -1.22652, 3.334783, 0.7294118, 0, 1, 1,
0.8021531, -0.2518227, 1.116635, 0.7333333, 0, 1, 1,
0.8090212, 1.136977, 1.473997, 0.7411765, 0, 1, 1,
0.8123283, 0.5234624, 0.4827849, 0.7450981, 0, 1, 1,
0.8127066, -1.244964, 2.668364, 0.7529412, 0, 1, 1,
0.8191004, 0.142866, 2.266627, 0.7568628, 0, 1, 1,
0.8208835, -0.3108554, 0.503771, 0.7647059, 0, 1, 1,
0.8211029, -0.2840843, -0.02600555, 0.7686275, 0, 1, 1,
0.8320116, 1.791203, 1.74032, 0.7764706, 0, 1, 1,
0.8341709, -0.9670486, 2.038495, 0.7803922, 0, 1, 1,
0.8352122, 1.17669, -0.112911, 0.7882353, 0, 1, 1,
0.8362216, 1.318232, 1.35549, 0.7921569, 0, 1, 1,
0.842993, -1.272314, 1.395264, 0.8, 0, 1, 1,
0.845495, 1.115649, 0.593138, 0.8078431, 0, 1, 1,
0.8461348, 1.949567, 0.06758578, 0.8117647, 0, 1, 1,
0.8463506, -0.6234539, 1.399132, 0.8196079, 0, 1, 1,
0.8465342, 1.095349, 2.288903, 0.8235294, 0, 1, 1,
0.8493454, -1.565744, 2.540781, 0.8313726, 0, 1, 1,
0.8515224, -0.5792028, 2.041398, 0.8352941, 0, 1, 1,
0.8532856, -1.246273, 1.542994, 0.8431373, 0, 1, 1,
0.8587512, -0.9366391, 1.696192, 0.8470588, 0, 1, 1,
0.8616574, 0.457182, 0.07949591, 0.854902, 0, 1, 1,
0.8634745, -1.978073, 3.221024, 0.8588235, 0, 1, 1,
0.8639356, -0.2441388, 1.844005, 0.8666667, 0, 1, 1,
0.8725199, 0.1368029, 3.002995, 0.8705882, 0, 1, 1,
0.8766131, 0.8081521, 1.164057, 0.8784314, 0, 1, 1,
0.8777564, 0.6132954, 0.9108724, 0.8823529, 0, 1, 1,
0.8781973, 1.275514, -0.008953746, 0.8901961, 0, 1, 1,
0.8792142, -1.681109, 2.200444, 0.8941177, 0, 1, 1,
0.8824761, 0.986181, 0.7528136, 0.9019608, 0, 1, 1,
0.8836812, 0.5277928, 0.6866263, 0.9098039, 0, 1, 1,
0.8874964, -1.00637, 1.797926, 0.9137255, 0, 1, 1,
0.8971922, 0.4999526, 1.479785, 0.9215686, 0, 1, 1,
0.898755, -0.2743806, 2.546912, 0.9254902, 0, 1, 1,
0.9005548, 0.2837144, 1.795063, 0.9333333, 0, 1, 1,
0.9026248, 0.4290367, -0.08942394, 0.9372549, 0, 1, 1,
0.9048446, 0.9083757, 0.7192869, 0.945098, 0, 1, 1,
0.906019, 1.88506, 0.6650433, 0.9490196, 0, 1, 1,
0.917501, -2.404163, 2.060096, 0.9568627, 0, 1, 1,
0.9182059, 0.9322471, -0.9605767, 0.9607843, 0, 1, 1,
0.9194412, 0.06104774, 1.106326, 0.9686275, 0, 1, 1,
0.9271186, 0.1087123, 2.754376, 0.972549, 0, 1, 1,
0.9297058, 1.116609, -1.628127, 0.9803922, 0, 1, 1,
0.9351403, 1.075705, 0.89655, 0.9843137, 0, 1, 1,
0.9375309, 1.667238, 0.6052926, 0.9921569, 0, 1, 1,
0.9452503, -0.7974318, 1.495752, 0.9960784, 0, 1, 1,
0.9455589, -0.3217296, 1.254995, 1, 0, 0.9960784, 1,
0.9460731, -1.205983, 1.851583, 1, 0, 0.9882353, 1,
0.9477991, 0.9202573, 0.2395929, 1, 0, 0.9843137, 1,
0.9533312, 0.3808716, 1.50433, 1, 0, 0.9764706, 1,
0.9567174, -0.6042544, 1.580013, 1, 0, 0.972549, 1,
0.9641069, 0.1008574, 2.567821, 1, 0, 0.9647059, 1,
0.968632, -0.5321454, 2.275392, 1, 0, 0.9607843, 1,
0.9697178, 1.272055, 0.3393832, 1, 0, 0.9529412, 1,
0.9705827, 1.323259, 1.179369, 1, 0, 0.9490196, 1,
0.9747353, 0.01916105, 1.729359, 1, 0, 0.9411765, 1,
0.9768487, 0.3209654, 2.989588, 1, 0, 0.9372549, 1,
0.9906293, -0.9212184, 1.515582, 1, 0, 0.9294118, 1,
0.9910535, -0.03473422, 2.350918, 1, 0, 0.9254902, 1,
0.999301, 0.8590963, -0.2086466, 1, 0, 0.9176471, 1,
1.01202, 0.5428521, 1.392869, 1, 0, 0.9137255, 1,
1.014535, 2.236815, -2.854087, 1, 0, 0.9058824, 1,
1.020441, -0.6104623, 2.493289, 1, 0, 0.9019608, 1,
1.024222, 0.7229756, -0.02715096, 1, 0, 0.8941177, 1,
1.027599, 0.3331472, 1.021931, 1, 0, 0.8862745, 1,
1.027697, 0.6746273, 2.569907, 1, 0, 0.8823529, 1,
1.033154, 1.212269, 1.650295, 1, 0, 0.8745098, 1,
1.034259, -0.1830837, 2.646786, 1, 0, 0.8705882, 1,
1.034929, 0.2907531, 0.5594104, 1, 0, 0.8627451, 1,
1.035404, 0.5102702, -1.585178, 1, 0, 0.8588235, 1,
1.04001, -0.4280818, 2.343955, 1, 0, 0.8509804, 1,
1.042905, -0.6715001, 2.160261, 1, 0, 0.8470588, 1,
1.044176, 1.547776, -0.1340715, 1, 0, 0.8392157, 1,
1.048395, -1.395522, 1.388872, 1, 0, 0.8352941, 1,
1.053658, 0.5391735, 1.743895, 1, 0, 0.827451, 1,
1.054914, 0.6670122, 1.522977, 1, 0, 0.8235294, 1,
1.055763, -0.9532615, 3.930021, 1, 0, 0.8156863, 1,
1.057838, 0.7826675, 0.4042751, 1, 0, 0.8117647, 1,
1.062389, 0.752004, 0.505653, 1, 0, 0.8039216, 1,
1.062495, -0.1453967, 0.931809, 1, 0, 0.7960784, 1,
1.062855, 0.5340725, 0.4958461, 1, 0, 0.7921569, 1,
1.065668, 0.07575615, 1.487234, 1, 0, 0.7843137, 1,
1.06647, -1.269217, 2.20778, 1, 0, 0.7803922, 1,
1.068411, 1.095299, 0.5445153, 1, 0, 0.772549, 1,
1.075992, -0.3198869, 2.323148, 1, 0, 0.7686275, 1,
1.077351, -0.01947984, 2.511454, 1, 0, 0.7607843, 1,
1.077365, -0.6106192, 0.4706508, 1, 0, 0.7568628, 1,
1.080839, 0.4841537, 1.825214, 1, 0, 0.7490196, 1,
1.083918, 0.5282289, 0.600858, 1, 0, 0.7450981, 1,
1.088058, 0.5376608, 2.616754, 1, 0, 0.7372549, 1,
1.096478, 1.792458, -0.09678067, 1, 0, 0.7333333, 1,
1.099612, 1.521047, 1.806932, 1, 0, 0.7254902, 1,
1.112798, -1.798607, 5.287787, 1, 0, 0.7215686, 1,
1.118799, -0.3256668, 1.996596, 1, 0, 0.7137255, 1,
1.123974, -0.2820881, 1.115871, 1, 0, 0.7098039, 1,
1.127611, 0.3578812, 1.046741, 1, 0, 0.7019608, 1,
1.128057, -2.255761, 2.939151, 1, 0, 0.6941177, 1,
1.132063, -1.31239, 3.229146, 1, 0, 0.6901961, 1,
1.133323, 0.2159003, 2.681285, 1, 0, 0.682353, 1,
1.13679, -0.6650211, 1.697549, 1, 0, 0.6784314, 1,
1.140584, 1.35218, 1.860911, 1, 0, 0.6705883, 1,
1.164081, 0.905637, 0.4675379, 1, 0, 0.6666667, 1,
1.1734, -0.7236289, 1.628919, 1, 0, 0.6588235, 1,
1.179679, 0.3107395, 1.498539, 1, 0, 0.654902, 1,
1.185459, -1.659349, 1.516055, 1, 0, 0.6470588, 1,
1.196333, -0.589497, -0.07067692, 1, 0, 0.6431373, 1,
1.196422, -0.7639802, 2.006172, 1, 0, 0.6352941, 1,
1.196626, 0.5970991, 1.554143, 1, 0, 0.6313726, 1,
1.1976, -1.113128, 3.292779, 1, 0, 0.6235294, 1,
1.208734, 0.643248, 0.4185057, 1, 0, 0.6196079, 1,
1.21417, -0.3619675, 1.540598, 1, 0, 0.6117647, 1,
1.223922, 0.5538865, 1.335434, 1, 0, 0.6078432, 1,
1.24143, 0.3532909, 2.318174, 1, 0, 0.6, 1,
1.257991, 0.4688101, 2.046597, 1, 0, 0.5921569, 1,
1.267126, -0.5080855, 1.318069, 1, 0, 0.5882353, 1,
1.272503, 1.801816, 1.522024, 1, 0, 0.5803922, 1,
1.276327, 0.9580339, -0.05808147, 1, 0, 0.5764706, 1,
1.276923, -0.2161751, 1.565035, 1, 0, 0.5686275, 1,
1.277844, -0.0232545, 1.395373, 1, 0, 0.5647059, 1,
1.283368, 1.498347, -0.9932805, 1, 0, 0.5568628, 1,
1.285216, 1.485458, -0.4648361, 1, 0, 0.5529412, 1,
1.292863, -1.488707, 3.057541, 1, 0, 0.5450981, 1,
1.298227, -0.245072, 1.159879, 1, 0, 0.5411765, 1,
1.308088, 0.9994179, 2.047672, 1, 0, 0.5333334, 1,
1.310372, -0.6092231, 2.152956, 1, 0, 0.5294118, 1,
1.311988, 0.139268, 1.851582, 1, 0, 0.5215687, 1,
1.319737, 1.795821, -0.2996758, 1, 0, 0.5176471, 1,
1.333835, -0.3609022, 5.333261, 1, 0, 0.509804, 1,
1.335067, -0.9017975, 3.39532, 1, 0, 0.5058824, 1,
1.338664, -0.2271159, 2.969424, 1, 0, 0.4980392, 1,
1.34034, -1.2252, 4.945978, 1, 0, 0.4901961, 1,
1.346607, 1.334854, -0.6210573, 1, 0, 0.4862745, 1,
1.351674, 0.4872669, 2.360965, 1, 0, 0.4784314, 1,
1.355583, -1.731884, 0.6877514, 1, 0, 0.4745098, 1,
1.361123, 0.8092083, 2.037268, 1, 0, 0.4666667, 1,
1.372611, -0.7745209, 3.303814, 1, 0, 0.4627451, 1,
1.373722, -1.33933, 1.118312, 1, 0, 0.454902, 1,
1.38078, -0.2212063, 3.408522, 1, 0, 0.4509804, 1,
1.382428, 1.100493, -2.042437, 1, 0, 0.4431373, 1,
1.385544, -0.4278924, 3.370368, 1, 0, 0.4392157, 1,
1.402667, -1.402689, 3.252263, 1, 0, 0.4313726, 1,
1.410273, 0.03118545, 2.470884, 1, 0, 0.427451, 1,
1.428275, -0.5115683, 3.024554, 1, 0, 0.4196078, 1,
1.432243, -1.489516, 4.77488, 1, 0, 0.4156863, 1,
1.436273, 1.105941, 1.921347, 1, 0, 0.4078431, 1,
1.437776, -0.226637, 1.555337, 1, 0, 0.4039216, 1,
1.446181, 1.885938, 0.01091119, 1, 0, 0.3960784, 1,
1.448905, -0.4235358, 1.212227, 1, 0, 0.3882353, 1,
1.449801, -0.110216, 3.15968, 1, 0, 0.3843137, 1,
1.460441, 1.435446, 0.7565865, 1, 0, 0.3764706, 1,
1.507747, 2.125125, 0.7740027, 1, 0, 0.372549, 1,
1.513966, 0.4787296, 0.7345551, 1, 0, 0.3647059, 1,
1.519332, 0.1376746, 1.415809, 1, 0, 0.3607843, 1,
1.520605, 0.8012154, 1.558429, 1, 0, 0.3529412, 1,
1.526556, 0.5521988, 0.819677, 1, 0, 0.3490196, 1,
1.52669, -0.1023262, 3.053011, 1, 0, 0.3411765, 1,
1.528792, -0.6028783, 0.2740312, 1, 0, 0.3372549, 1,
1.533556, -0.1627161, 2.92242, 1, 0, 0.3294118, 1,
1.54022, -0.1227607, -0.1744857, 1, 0, 0.3254902, 1,
1.546177, -1.658669, 1.01272, 1, 0, 0.3176471, 1,
1.596736, -0.3791194, -0.09795465, 1, 0, 0.3137255, 1,
1.604519, 0.9443736, 0.9603717, 1, 0, 0.3058824, 1,
1.609682, 1.199685, 1.465088, 1, 0, 0.2980392, 1,
1.619276, -0.01269751, 1.49216, 1, 0, 0.2941177, 1,
1.631093, 0.462039, -0.2809264, 1, 0, 0.2862745, 1,
1.640949, 2.206586, -0.6293727, 1, 0, 0.282353, 1,
1.649855, -0.5204793, 2.956916, 1, 0, 0.2745098, 1,
1.661138, 0.6434612, 2.810294, 1, 0, 0.2705882, 1,
1.684705, 2.111552, 2.499534, 1, 0, 0.2627451, 1,
1.689567, 0.936192, 1.012935, 1, 0, 0.2588235, 1,
1.691423, -1.092188, 1.729963, 1, 0, 0.2509804, 1,
1.699743, 0.052856, 2.119479, 1, 0, 0.2470588, 1,
1.703934, -0.5382344, 1.015682, 1, 0, 0.2392157, 1,
1.721092, -0.06080652, 0.6901233, 1, 0, 0.2352941, 1,
1.72467, -1.278154, 3.731284, 1, 0, 0.227451, 1,
1.730717, 0.07034588, 2.170252, 1, 0, 0.2235294, 1,
1.735151, 1.147623, 0.0914166, 1, 0, 0.2156863, 1,
1.741803, -2.185637, 2.77616, 1, 0, 0.2117647, 1,
1.756117, 0.07848143, 1.294437, 1, 0, 0.2039216, 1,
1.757911, 0.5608591, 3.193774, 1, 0, 0.1960784, 1,
1.772932, 1.140751, 0.5485181, 1, 0, 0.1921569, 1,
1.801394, -1.240222, 2.923299, 1, 0, 0.1843137, 1,
1.805023, -0.9847149, 1.206719, 1, 0, 0.1803922, 1,
1.822124, 1.350592, 1.010907, 1, 0, 0.172549, 1,
1.856254, 0.01941699, 0.850921, 1, 0, 0.1686275, 1,
1.884319, 1.135868, 1.186584, 1, 0, 0.1607843, 1,
1.912451, 0.1481902, 2.075117, 1, 0, 0.1568628, 1,
1.915833, -0.6968939, 2.587916, 1, 0, 0.1490196, 1,
1.922043, 0.3883889, 2.812414, 1, 0, 0.145098, 1,
1.932567, -0.4838822, 2.710866, 1, 0, 0.1372549, 1,
1.934135, 2.840968, 1.514545, 1, 0, 0.1333333, 1,
1.93633, 1.319862, 1.753035, 1, 0, 0.1254902, 1,
1.954184, -1.603309, 1.943072, 1, 0, 0.1215686, 1,
1.955346, -1.102931, 2.610914, 1, 0, 0.1137255, 1,
1.972916, -0.7519598, 1.808284, 1, 0, 0.1098039, 1,
2.011565, 0.5932587, 1.686852, 1, 0, 0.1019608, 1,
2.016363, -0.3329053, 0.1001982, 1, 0, 0.09411765, 1,
2.072411, 2.045403, 1.337487, 1, 0, 0.09019608, 1,
2.073676, -1.112694, 3.034202, 1, 0, 0.08235294, 1,
2.099061, 0.01328876, 1.73811, 1, 0, 0.07843138, 1,
2.112873, 1.798185, 1.052111, 1, 0, 0.07058824, 1,
2.242158, -1.374452, 1.256505, 1, 0, 0.06666667, 1,
2.276492, 0.2591069, 2.471658, 1, 0, 0.05882353, 1,
2.359531, -0.9101481, 2.918239, 1, 0, 0.05490196, 1,
2.40815, -0.3184304, 1.444508, 1, 0, 0.04705882, 1,
2.453205, 0.7155932, 0.3464073, 1, 0, 0.04313726, 1,
2.48989, 0.9588598, 2.185736, 1, 0, 0.03529412, 1,
2.497022, -1.068085, 2.472803, 1, 0, 0.03137255, 1,
2.599466, -1.22729, 0.8426114, 1, 0, 0.02352941, 1,
2.602284, 0.5828503, 0.6589857, 1, 0, 0.01960784, 1,
2.642653, 0.06287669, 3.034086, 1, 0, 0.01176471, 1,
3.00322, -0.9184729, -0.573142, 1, 0, 0.007843138, 1
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
-0.06491208, -3.780608, -9.060824, 0, -0.5, 0.5, 0.5,
-0.06491208, -3.780608, -9.060824, 1, -0.5, 0.5, 0.5,
-0.06491208, -3.780608, -9.060824, 1, 1.5, 0.5, 0.5,
-0.06491208, -3.780608, -9.060824, 0, 1.5, 0.5, 0.5
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
-4.173141, 0.08544445, -9.060824, 0, -0.5, 0.5, 0.5,
-4.173141, 0.08544445, -9.060824, 1, -0.5, 0.5, 0.5,
-4.173141, 0.08544445, -9.060824, 1, 1.5, 0.5, 0.5,
-4.173141, 0.08544445, -9.060824, 0, 1.5, 0.5, 0.5
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
-4.173141, -3.780608, -0.7558424, 0, -0.5, 0.5, 0.5,
-4.173141, -3.780608, -0.7558424, 1, -0.5, 0.5, 0.5,
-4.173141, -3.780608, -0.7558424, 1, 1.5, 0.5, 0.5,
-4.173141, -3.780608, -0.7558424, 0, 1.5, 0.5, 0.5
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
-3, -2.888442, -7.14429,
3, -2.888442, -7.14429,
-3, -2.888442, -7.14429,
-3, -3.037136, -7.463713,
-2, -2.888442, -7.14429,
-2, -3.037136, -7.463713,
-1, -2.888442, -7.14429,
-1, -3.037136, -7.463713,
0, -2.888442, -7.14429,
0, -3.037136, -7.463713,
1, -2.888442, -7.14429,
1, -3.037136, -7.463713,
2, -2.888442, -7.14429,
2, -3.037136, -7.463713,
3, -2.888442, -7.14429,
3, -3.037136, -7.463713
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
-3, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
-3, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
-3, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
-3, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
-2, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
-2, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
-2, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
-2, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
-1, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
-1, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
-1, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
-1, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
0, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
0, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
0, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
0, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
1, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
1, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
1, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
1, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
2, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
2, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
2, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
2, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5,
3, -3.334525, -8.102557, 0, -0.5, 0.5, 0.5,
3, -3.334525, -8.102557, 1, -0.5, 0.5, 0.5,
3, -3.334525, -8.102557, 1, 1.5, 0.5, 0.5,
3, -3.334525, -8.102557, 0, 1.5, 0.5, 0.5
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
-3.225088, -2, -7.14429,
-3.225088, 2, -7.14429,
-3.225088, -2, -7.14429,
-3.383097, -2, -7.463713,
-3.225088, -1, -7.14429,
-3.383097, -1, -7.463713,
-3.225088, 0, -7.14429,
-3.383097, 0, -7.463713,
-3.225088, 1, -7.14429,
-3.383097, 1, -7.463713,
-3.225088, 2, -7.14429,
-3.383097, 2, -7.463713
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
-3.699115, -2, -8.102557, 0, -0.5, 0.5, 0.5,
-3.699115, -2, -8.102557, 1, -0.5, 0.5, 0.5,
-3.699115, -2, -8.102557, 1, 1.5, 0.5, 0.5,
-3.699115, -2, -8.102557, 0, 1.5, 0.5, 0.5,
-3.699115, -1, -8.102557, 0, -0.5, 0.5, 0.5,
-3.699115, -1, -8.102557, 1, -0.5, 0.5, 0.5,
-3.699115, -1, -8.102557, 1, 1.5, 0.5, 0.5,
-3.699115, -1, -8.102557, 0, 1.5, 0.5, 0.5,
-3.699115, 0, -8.102557, 0, -0.5, 0.5, 0.5,
-3.699115, 0, -8.102557, 1, -0.5, 0.5, 0.5,
-3.699115, 0, -8.102557, 1, 1.5, 0.5, 0.5,
-3.699115, 0, -8.102557, 0, 1.5, 0.5, 0.5,
-3.699115, 1, -8.102557, 0, -0.5, 0.5, 0.5,
-3.699115, 1, -8.102557, 1, -0.5, 0.5, 0.5,
-3.699115, 1, -8.102557, 1, 1.5, 0.5, 0.5,
-3.699115, 1, -8.102557, 0, 1.5, 0.5, 0.5,
-3.699115, 2, -8.102557, 0, -0.5, 0.5, 0.5,
-3.699115, 2, -8.102557, 1, -0.5, 0.5, 0.5,
-3.699115, 2, -8.102557, 1, 1.5, 0.5, 0.5,
-3.699115, 2, -8.102557, 0, 1.5, 0.5, 0.5
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
-3.225088, -2.888442, -6,
-3.225088, -2.888442, 4,
-3.225088, -2.888442, -6,
-3.383097, -3.037136, -6,
-3.225088, -2.888442, -4,
-3.383097, -3.037136, -4,
-3.225088, -2.888442, -2,
-3.383097, -3.037136, -2,
-3.225088, -2.888442, 0,
-3.383097, -3.037136, 0,
-3.225088, -2.888442, 2,
-3.383097, -3.037136, 2,
-3.225088, -2.888442, 4,
-3.383097, -3.037136, 4
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
"-6",
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
-3.699115, -3.334525, -6, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -6, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -6, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, -6, 0, 1.5, 0.5, 0.5,
-3.699115, -3.334525, -4, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -4, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -4, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, -4, 0, 1.5, 0.5, 0.5,
-3.699115, -3.334525, -2, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -2, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, -2, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, -2, 0, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 0, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 0, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 0, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 0, 0, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 2, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 2, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 2, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 2, 0, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 4, 0, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 4, 1, -0.5, 0.5, 0.5,
-3.699115, -3.334525, 4, 1, 1.5, 0.5, 0.5,
-3.699115, -3.334525, 4, 0, 1.5, 0.5, 0.5
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
-3.225088, -2.888442, -7.14429,
-3.225088, 3.059331, -7.14429,
-3.225088, -2.888442, 5.632606,
-3.225088, 3.059331, 5.632606,
-3.225088, -2.888442, -7.14429,
-3.225088, -2.888442, 5.632606,
-3.225088, 3.059331, -7.14429,
-3.225088, 3.059331, 5.632606,
-3.225088, -2.888442, -7.14429,
3.095264, -2.888442, -7.14429,
-3.225088, -2.888442, 5.632606,
3.095264, -2.888442, 5.632606,
-3.225088, 3.059331, -7.14429,
3.095264, 3.059331, -7.14429,
-3.225088, 3.059331, 5.632606,
3.095264, 3.059331, 5.632606,
3.095264, -2.888442, -7.14429,
3.095264, 3.059331, -7.14429,
3.095264, -2.888442, 5.632606,
3.095264, 3.059331, 5.632606,
3.095264, -2.888442, -7.14429,
3.095264, -2.888442, 5.632606,
3.095264, 3.059331, -7.14429,
3.095264, 3.059331, 5.632606
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
var radius = 8.247743;
var distance = 36.69514;
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
mvMatrix.translate( 0.06491208, -0.08544445, 0.7558424 );
mvMatrix.scale( 1.410937, 1.499321, 0.697949 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.69514);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
mitomycin_C<-read.table("mitomycin_C.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mitomycin_C$V2
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
```

```r
y<-mitomycin_C$V3
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
```

```r
z<-mitomycin_C$V4
```

```
## Error in eval(expr, envir, enclos): object 'mitomycin_C' not found
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
-3.133044, -1.123796, -3.189716, 0, 0, 1, 1, 1,
-3.012252, 1.107357, -0.9437648, 1, 0, 0, 1, 1,
-2.93424, 0.2134078, -0.5240545, 1, 0, 0, 1, 1,
-2.898724, -1.202283, -0.5394676, 1, 0, 0, 1, 1,
-2.836146, -0.2290937, -1.321069, 1, 0, 0, 1, 1,
-2.492615, -0.9854959, -1.941422, 1, 0, 0, 1, 1,
-2.460605, -0.571027, -1.935687, 0, 0, 0, 1, 1,
-2.391091, 0.1281513, -0.5027315, 0, 0, 0, 1, 1,
-2.376074, -0.265692, -1.23041, 0, 0, 0, 1, 1,
-2.354879, -1.688507, -1.980658, 0, 0, 0, 1, 1,
-2.340638, 2.109084, 0.652411, 0, 0, 0, 1, 1,
-2.26055, 1.09742, -1.05503, 0, 0, 0, 1, 1,
-2.255866, -0.1468137, -0.8540282, 0, 0, 0, 1, 1,
-2.242448, -0.8959957, -1.866908, 1, 1, 1, 1, 1,
-2.169853, -1.342251, -2.235705, 1, 1, 1, 1, 1,
-2.137376, -0.09961155, -0.4381971, 1, 1, 1, 1, 1,
-2.126163, 0.2379044, 0.3330738, 1, 1, 1, 1, 1,
-2.11292, 0.4651449, -2.018712, 1, 1, 1, 1, 1,
-2.104557, -0.2826012, -1.246534, 1, 1, 1, 1, 1,
-2.087497, 0.628636, -0.9430155, 1, 1, 1, 1, 1,
-2.080199, 2.257658, -0.8875388, 1, 1, 1, 1, 1,
-2.077261, -1.250096, -1.586857, 1, 1, 1, 1, 1,
-2.031784, 1.300472, -1.242686, 1, 1, 1, 1, 1,
-2.015628, 1.064837, -2.739516, 1, 1, 1, 1, 1,
-2.004925, 1.025538, -0.530362, 1, 1, 1, 1, 1,
-1.999038, 0.7993103, -2.136767, 1, 1, 1, 1, 1,
-1.994976, 0.3840812, -0.9890869, 1, 1, 1, 1, 1,
-1.977222, 0.5488397, -1.02911, 1, 1, 1, 1, 1,
-1.895949, -1.055652, -0.8193482, 0, 0, 1, 1, 1,
-1.895903, 0.6471164, -1.988021, 1, 0, 0, 1, 1,
-1.85955, -1.32609, -1.913791, 1, 0, 0, 1, 1,
-1.854999, 1.509844, 0.04468798, 1, 0, 0, 1, 1,
-1.80916, 0.2029165, -2.965987, 1, 0, 0, 1, 1,
-1.784423, -0.1327988, -4.21369, 1, 0, 0, 1, 1,
-1.77432, -0.9924528, -1.88682, 0, 0, 0, 1, 1,
-1.773237, 1.281823, -0.3096108, 0, 0, 0, 1, 1,
-1.771045, -1.001077, -2.318213, 0, 0, 0, 1, 1,
-1.770121, -0.6450552, -3.803098, 0, 0, 0, 1, 1,
-1.767877, -0.01492696, -2.327159, 0, 0, 0, 1, 1,
-1.731689, 0.01910449, -0.7773516, 0, 0, 0, 1, 1,
-1.712914, -0.1131949, -1.531514, 0, 0, 0, 1, 1,
-1.712669, -1.301429, -2.451281, 1, 1, 1, 1, 1,
-1.712079, 0.8901042, -1.175538, 1, 1, 1, 1, 1,
-1.710826, -0.4287089, -1.133787, 1, 1, 1, 1, 1,
-1.709834, 0.508938, -1.756855, 1, 1, 1, 1, 1,
-1.703112, 0.9973394, -1.470387, 1, 1, 1, 1, 1,
-1.693583, -1.352228, -4.512958, 1, 1, 1, 1, 1,
-1.66458, -1.162262, -3.446946, 1, 1, 1, 1, 1,
-1.659257, -0.09797606, -3.150709, 1, 1, 1, 1, 1,
-1.63683, 1.027441, -0.2557105, 1, 1, 1, 1, 1,
-1.635507, -0.05766548, -0.9292283, 1, 1, 1, 1, 1,
-1.620957, 0.6586273, -1.668498, 1, 1, 1, 1, 1,
-1.608002, 1.139943, -2.818625, 1, 1, 1, 1, 1,
-1.607595, 1.514363, -0.1486766, 1, 1, 1, 1, 1,
-1.586111, -1.896905, -2.261685, 1, 1, 1, 1, 1,
-1.581809, 1.209302, -0.4870665, 1, 1, 1, 1, 1,
-1.573042, 1.34199, -3.368185, 0, 0, 1, 1, 1,
-1.523156, 0.3956386, -0.06392004, 1, 0, 0, 1, 1,
-1.521032, -1.975026, -1.349235, 1, 0, 0, 1, 1,
-1.51907, 0.4562167, -2.823641, 1, 0, 0, 1, 1,
-1.508935, 1.680259, -0.7008985, 1, 0, 0, 1, 1,
-1.507716, 0.05940677, -1.573287, 1, 0, 0, 1, 1,
-1.50521, -0.8554237, -2.567687, 0, 0, 0, 1, 1,
-1.505087, 0.8947964, -0.7181803, 0, 0, 0, 1, 1,
-1.493079, 0.1163563, -0.3182183, 0, 0, 0, 1, 1,
-1.485474, 0.4097937, -0.928425, 0, 0, 0, 1, 1,
-1.478796, -0.5781347, -2.941409, 0, 0, 0, 1, 1,
-1.47478, 1.61792, -0.652764, 0, 0, 0, 1, 1,
-1.474381, -0.2794595, -1.31753, 0, 0, 0, 1, 1,
-1.466417, 0.3511225, -1.225855, 1, 1, 1, 1, 1,
-1.45588, 0.5876398, -1.175602, 1, 1, 1, 1, 1,
-1.455415, -0.0888095, -0.5279251, 1, 1, 1, 1, 1,
-1.454788, 0.3372028, 0.4293819, 1, 1, 1, 1, 1,
-1.454752, 1.185372, -3.175824, 1, 1, 1, 1, 1,
-1.450917, -0.5603766, -3.103106, 1, 1, 1, 1, 1,
-1.450753, -0.02735659, -0.9731978, 1, 1, 1, 1, 1,
-1.444009, 2.345973, -0.8292875, 1, 1, 1, 1, 1,
-1.440171, -1.224147, -1.219979, 1, 1, 1, 1, 1,
-1.429805, -0.6386324, -1.607754, 1, 1, 1, 1, 1,
-1.423477, -0.1328996, -2.502223, 1, 1, 1, 1, 1,
-1.421104, 0.1986847, -2.168231, 1, 1, 1, 1, 1,
-1.417285, -1.002813, -3.877509, 1, 1, 1, 1, 1,
-1.405542, -0.5594592, -2.497525, 1, 1, 1, 1, 1,
-1.393511, -0.3714672, -1.059314, 1, 1, 1, 1, 1,
-1.39064, -2.082154, -3.122453, 0, 0, 1, 1, 1,
-1.380583, 0.4013657, -0.6108965, 1, 0, 0, 1, 1,
-1.370296, -1.377976, -2.182824, 1, 0, 0, 1, 1,
-1.370076, -1.649708, -2.562911, 1, 0, 0, 1, 1,
-1.367927, 0.08686886, -2.114519, 1, 0, 0, 1, 1,
-1.367804, 2.060877, -0.4916046, 1, 0, 0, 1, 1,
-1.359156, 1.490749, -0.6705997, 0, 0, 0, 1, 1,
-1.356974, -0.5212563, -1.890725, 0, 0, 0, 1, 1,
-1.350491, -0.7708212, -1.714755, 0, 0, 0, 1, 1,
-1.34697, -1.553614, -2.067838, 0, 0, 0, 1, 1,
-1.340959, -0.1952949, -1.619506, 0, 0, 0, 1, 1,
-1.339723, -0.8380697, -1.17222, 0, 0, 0, 1, 1,
-1.311475, 1.654725, -2.416226, 0, 0, 0, 1, 1,
-1.306997, 2.010705, 0.6297656, 1, 1, 1, 1, 1,
-1.305739, 0.4146347, -2.104017, 1, 1, 1, 1, 1,
-1.295303, -0.1382325, -0.7241263, 1, 1, 1, 1, 1,
-1.293306, 1.861717, -0.8583407, 1, 1, 1, 1, 1,
-1.290905, 1.212397, -0.3896126, 1, 1, 1, 1, 1,
-1.289541, 0.2202762, -3.147598, 1, 1, 1, 1, 1,
-1.289507, -1.080956, -1.964519, 1, 1, 1, 1, 1,
-1.281944, -0.03379725, -0.6363935, 1, 1, 1, 1, 1,
-1.278577, -1.013938, -2.475013, 1, 1, 1, 1, 1,
-1.273913, -0.67232, -1.571481, 1, 1, 1, 1, 1,
-1.255755, -2.644973, -3.965848, 1, 1, 1, 1, 1,
-1.23652, -1.441818, -1.06319, 1, 1, 1, 1, 1,
-1.212447, 0.6594335, -0.2157904, 1, 1, 1, 1, 1,
-1.205676, -1.139315, -2.714306, 1, 1, 1, 1, 1,
-1.204442, 0.03076848, -3.791323, 1, 1, 1, 1, 1,
-1.192951, 0.1195579, -2.712508, 0, 0, 1, 1, 1,
-1.186352, -1.555417, -3.543299, 1, 0, 0, 1, 1,
-1.179037, -1.830037, -1.896441, 1, 0, 0, 1, 1,
-1.177173, 0.7436824, -2.414244, 1, 0, 0, 1, 1,
-1.175685, 0.6096084, -0.6454855, 1, 0, 0, 1, 1,
-1.174685, 0.168303, -2.200487, 1, 0, 0, 1, 1,
-1.162127, 1.421926, -2.190266, 0, 0, 0, 1, 1,
-1.15009, 0.8170505, -0.6737366, 0, 0, 0, 1, 1,
-1.146544, 1.194303, -0.9362397, 0, 0, 0, 1, 1,
-1.143595, -2.801824, -4.245952, 0, 0, 0, 1, 1,
-1.138098, -1.445713, -2.752265, 0, 0, 0, 1, 1,
-1.13787, -0.1947227, -1.151443, 0, 0, 0, 1, 1,
-1.135654, -0.8379891, -2.962948, 0, 0, 0, 1, 1,
-1.127723, -0.5954005, -0.5749634, 1, 1, 1, 1, 1,
-1.126923, -0.4072058, -3.098681, 1, 1, 1, 1, 1,
-1.126842, -0.4537813, -4.053331, 1, 1, 1, 1, 1,
-1.123747, 0.1279014, 0.9223996, 1, 1, 1, 1, 1,
-1.122305, 0.3258436, -0.4847862, 1, 1, 1, 1, 1,
-1.117792, 0.388063, -1.656793, 1, 1, 1, 1, 1,
-1.117649, 0.3965548, -1.335498, 1, 1, 1, 1, 1,
-1.114867, -0.1689797, -0.858273, 1, 1, 1, 1, 1,
-1.114743, -0.4658378, -2.309085, 1, 1, 1, 1, 1,
-1.1142, 0.3603925, -3.692758, 1, 1, 1, 1, 1,
-1.106031, 0.03372381, -0.5099341, 1, 1, 1, 1, 1,
-1.103528, -0.2235765, -1.907724, 1, 1, 1, 1, 1,
-1.100182, 0.7505675, -0.6816989, 1, 1, 1, 1, 1,
-1.087575, -0.583299, -0.5321879, 1, 1, 1, 1, 1,
-1.085858, 0.8085583, -2.160377, 1, 1, 1, 1, 1,
-1.081363, -1.066009, -1.934711, 0, 0, 1, 1, 1,
-1.076446, 0.540031, 1.32409, 1, 0, 0, 1, 1,
-1.069576, -0.004026035, -0.489136, 1, 0, 0, 1, 1,
-1.069493, -0.2957613, -3.479946, 1, 0, 0, 1, 1,
-1.064927, 0.2478614, -0.8844989, 1, 0, 0, 1, 1,
-1.06472, 0.5112336, -0.8724359, 1, 0, 0, 1, 1,
-1.063512, 0.1896227, -1.115907, 0, 0, 0, 1, 1,
-1.047868, 0.3688687, -1.335976, 0, 0, 0, 1, 1,
-1.046939, -0.7058078, -1.932699, 0, 0, 0, 1, 1,
-1.040096, 0.6761932, -0.5768462, 0, 0, 0, 1, 1,
-1.039291, 0.07794995, 0.4323144, 0, 0, 0, 1, 1,
-1.037786, -0.6223943, -2.738302, 0, 0, 0, 1, 1,
-1.032968, 1.157592, -0.9692928, 0, 0, 0, 1, 1,
-1.030671, 1.328553, -0.7617479, 1, 1, 1, 1, 1,
-1.026022, 0.5614244, 0.2448579, 1, 1, 1, 1, 1,
-1.024825, -0.6869677, -2.563076, 1, 1, 1, 1, 1,
-1.022886, -0.2234562, -1.638321, 1, 1, 1, 1, 1,
-1.020093, -1.61367, -3.183463, 1, 1, 1, 1, 1,
-1.019319, 0.3578973, -2.71034, 1, 1, 1, 1, 1,
-1.014782, -0.7995702, -1.191423, 1, 1, 1, 1, 1,
-1.011495, -1.538824, -2.241291, 1, 1, 1, 1, 1,
-1.005782, 0.4592764, 0.08202241, 1, 1, 1, 1, 1,
-1.005124, -1.395711, -2.887456, 1, 1, 1, 1, 1,
-1.000521, -1.014798, -1.639168, 1, 1, 1, 1, 1,
-0.9974632, 1.189514, 0.01842448, 1, 1, 1, 1, 1,
-0.9926128, -0.1838243, -3.049845, 1, 1, 1, 1, 1,
-0.9895839, 0.8925883, -0.510841, 1, 1, 1, 1, 1,
-0.9845291, -0.789533, -2.326509, 1, 1, 1, 1, 1,
-0.9830156, 0.09321395, -2.390721, 0, 0, 1, 1, 1,
-0.9808442, 0.8551413, -0.6185687, 1, 0, 0, 1, 1,
-0.9752271, -0.370456, -2.222543, 1, 0, 0, 1, 1,
-0.9706968, 1.541956, -2.641879, 1, 0, 0, 1, 1,
-0.9701397, 1.359508, 0.5062765, 1, 0, 0, 1, 1,
-0.9659893, -0.2435336, -1.411016, 1, 0, 0, 1, 1,
-0.9524474, 0.1386834, -0.9371237, 0, 0, 0, 1, 1,
-0.9512722, -1.256147, -3.457758, 0, 0, 0, 1, 1,
-0.9494631, -0.03668674, -1.586251, 0, 0, 0, 1, 1,
-0.9494058, -0.6998371, -1.955705, 0, 0, 0, 1, 1,
-0.9452637, 1.418432, -1.16444, 0, 0, 0, 1, 1,
-0.944118, 0.9619449, 0.5183119, 0, 0, 0, 1, 1,
-0.9431689, -2.038842, -1.855136, 0, 0, 0, 1, 1,
-0.9430292, 0.2796926, -0.04795722, 1, 1, 1, 1, 1,
-0.9260041, 0.8455316, -1.727856, 1, 1, 1, 1, 1,
-0.9151398, 0.5934824, -0.9645071, 1, 1, 1, 1, 1,
-0.9054279, -0.8222237, -1.325903, 1, 1, 1, 1, 1,
-0.9039205, -0.2286197, -0.4966437, 1, 1, 1, 1, 1,
-0.8941298, -0.3754994, -3.072701, 1, 1, 1, 1, 1,
-0.893563, 0.1613861, -1.082361, 1, 1, 1, 1, 1,
-0.8894368, 0.7635591, -1.902452, 1, 1, 1, 1, 1,
-0.8792771, -1.396446, -3.233302, 1, 1, 1, 1, 1,
-0.8769234, -0.3909262, -2.165774, 1, 1, 1, 1, 1,
-0.8750974, 0.6741034, -0.678616, 1, 1, 1, 1, 1,
-0.872528, 1.415055, 0.495739, 1, 1, 1, 1, 1,
-0.8705226, 1.676111, 0.3911077, 1, 1, 1, 1, 1,
-0.8702322, 0.2169512, -1.289621, 1, 1, 1, 1, 1,
-0.8610402, 1.263624, -1.607573, 1, 1, 1, 1, 1,
-0.8581818, 0.8789815, -1.246612, 0, 0, 1, 1, 1,
-0.855603, -0.2621359, -1.733068, 1, 0, 0, 1, 1,
-0.8516647, -1.670663, -5.036067, 1, 0, 0, 1, 1,
-0.8508235, -0.3760866, -1.467365, 1, 0, 0, 1, 1,
-0.8493525, -1.650542, -3.236004, 1, 0, 0, 1, 1,
-0.830574, 1.970582, -1.377954, 1, 0, 0, 1, 1,
-0.8258784, -0.6948975, -4.090933, 0, 0, 0, 1, 1,
-0.8246626, -0.1134113, -0.7630298, 0, 0, 0, 1, 1,
-0.8178273, -0.2846817, -2.969391, 0, 0, 0, 1, 1,
-0.8169338, -1.321421, -3.522641, 0, 0, 0, 1, 1,
-0.8103882, 1.488263, 1.226173, 0, 0, 0, 1, 1,
-0.8078543, 0.08683542, 0.7950215, 0, 0, 0, 1, 1,
-0.8066469, 0.834417, 1.0989, 0, 0, 0, 1, 1,
-0.8036696, -1.419013, -2.957697, 1, 1, 1, 1, 1,
-0.7988577, -1.314028, -1.753241, 1, 1, 1, 1, 1,
-0.7964392, 1.296975, -1.294968, 1, 1, 1, 1, 1,
-0.7945285, -0.01322223, -1.716754, 1, 1, 1, 1, 1,
-0.7855002, -0.2735071, -1.729333, 1, 1, 1, 1, 1,
-0.7842095, -1.338133, -3.190493, 1, 1, 1, 1, 1,
-0.7811424, -0.8878329, -1.702229, 1, 1, 1, 1, 1,
-0.7784585, -0.6656167, -2.996703, 1, 1, 1, 1, 1,
-0.7774287, -0.9226585, -2.280188, 1, 1, 1, 1, 1,
-0.7711002, -1.623614, -3.446494, 1, 1, 1, 1, 1,
-0.7692229, -1.436273, -1.421722, 1, 1, 1, 1, 1,
-0.7656071, 1.671963, 1.725176, 1, 1, 1, 1, 1,
-0.7627842, -0.2642603, -2.895568, 1, 1, 1, 1, 1,
-0.7611127, 0.1822346, -1.096025, 1, 1, 1, 1, 1,
-0.7516431, -0.6160156, -1.061734, 1, 1, 1, 1, 1,
-0.7416899, 2.118912, 0.2143401, 0, 0, 1, 1, 1,
-0.7308894, 0.4887427, -1.213175, 1, 0, 0, 1, 1,
-0.7305912, 0.1946045, -3.681653, 1, 0, 0, 1, 1,
-0.7270918, 1.038126, -0.6000994, 1, 0, 0, 1, 1,
-0.7258122, -2.769558, -4.525716, 1, 0, 0, 1, 1,
-0.7253921, -1.028914, -3.818312, 1, 0, 0, 1, 1,
-0.7252185, -0.03405296, -1.683402, 0, 0, 0, 1, 1,
-0.7243354, 1.759626, 0.4989133, 0, 0, 0, 1, 1,
-0.7166919, 0.1119523, -2.536805, 0, 0, 0, 1, 1,
-0.7125641, -1.301145, -2.249281, 0, 0, 0, 1, 1,
-0.7113593, -2.019557, -2.416132, 0, 0, 0, 1, 1,
-0.7067319, 1.91141, -0.5768239, 0, 0, 0, 1, 1,
-0.705103, -0.4896506, -1.453722, 0, 0, 0, 1, 1,
-0.7041453, -0.120887, -1.404372, 1, 1, 1, 1, 1,
-0.7031299, 0.1995608, -1.320455, 1, 1, 1, 1, 1,
-0.699821, -1.411842, -2.54493, 1, 1, 1, 1, 1,
-0.6992186, 1.363898, 1.198017, 1, 1, 1, 1, 1,
-0.6951032, 1.223849, -0.6910374, 1, 1, 1, 1, 1,
-0.6945649, -1.442, -2.213238, 1, 1, 1, 1, 1,
-0.6939651, 2.927132, -0.7622631, 1, 1, 1, 1, 1,
-0.693109, -1.404293, -2.815292, 1, 1, 1, 1, 1,
-0.6911618, -0.4306911, -0.7134572, 1, 1, 1, 1, 1,
-0.6902817, 0.02861874, -0.8761035, 1, 1, 1, 1, 1,
-0.688282, 0.144077, -1.7213, 1, 1, 1, 1, 1,
-0.6814134, 0.07308079, -1.467275, 1, 1, 1, 1, 1,
-0.6791115, 0.3209552, -1.473424, 1, 1, 1, 1, 1,
-0.6784605, 1.200525, -1.73479, 1, 1, 1, 1, 1,
-0.6779751, 0.9722798, -0.4748451, 1, 1, 1, 1, 1,
-0.6777183, -0.4962418, -2.941102, 0, 0, 1, 1, 1,
-0.6765636, -0.4189791, -2.67008, 1, 0, 0, 1, 1,
-0.6742062, 2.231522, -0.6091846, 1, 0, 0, 1, 1,
-0.6707971, -0.4067185, -1.056155, 1, 0, 0, 1, 1,
-0.6672187, -0.299818, -3.031469, 1, 0, 0, 1, 1,
-0.6525985, 1.983362, 0.5397421, 1, 0, 0, 1, 1,
-0.6463988, 0.6739408, -1.87723, 0, 0, 0, 1, 1,
-0.6432965, 0.3690902, -2.376673, 0, 0, 0, 1, 1,
-0.6425794, -0.5082788, -2.581251, 0, 0, 0, 1, 1,
-0.6422607, -0.4541886, -1.899832, 0, 0, 0, 1, 1,
-0.6403399, 0.4432264, -0.1899531, 0, 0, 0, 1, 1,
-0.6353766, -1.523399, -2.11927, 0, 0, 0, 1, 1,
-0.6279551, 0.5323761, 0.8234894, 0, 0, 0, 1, 1,
-0.6279068, 0.01870764, -0.6421371, 1, 1, 1, 1, 1,
-0.6253045, 0.1305512, -0.5877454, 1, 1, 1, 1, 1,
-0.6214505, -0.7415085, -1.209346, 1, 1, 1, 1, 1,
-0.6184214, 0.587859, 1.254391, 1, 1, 1, 1, 1,
-0.6181319, -1.36247, -2.123658, 1, 1, 1, 1, 1,
-0.6155396, -0.2435867, -1.751009, 1, 1, 1, 1, 1,
-0.6149215, 0.07662242, -1.462265, 1, 1, 1, 1, 1,
-0.6144716, -1.104757, -1.625983, 1, 1, 1, 1, 1,
-0.6132361, -0.7723769, -3.156651, 1, 1, 1, 1, 1,
-0.6130775, 0.654011, -1.645266, 1, 1, 1, 1, 1,
-0.5991551, -0.1580469, -2.595031, 1, 1, 1, 1, 1,
-0.5976244, -2.107615, -2.565708, 1, 1, 1, 1, 1,
-0.5862433, 0.3063893, -3.231229, 1, 1, 1, 1, 1,
-0.5813046, 0.6459369, 0.2591131, 1, 1, 1, 1, 1,
-0.5792857, 1.006273, -1.328916, 1, 1, 1, 1, 1,
-0.5779301, 0.3417866, -0.398348, 0, 0, 1, 1, 1,
-0.577149, -0.9513016, -5.027041, 1, 0, 0, 1, 1,
-0.5759068, -0.09073415, -2.520645, 1, 0, 0, 1, 1,
-0.5698965, -0.05578963, -1.235254, 1, 0, 0, 1, 1,
-0.5670986, 0.09275725, -2.471849, 1, 0, 0, 1, 1,
-0.5655935, 0.1272513, -0.661176, 1, 0, 0, 1, 1,
-0.5646372, 0.8250266, -1.511425, 0, 0, 0, 1, 1,
-0.5629763, 0.6169904, 0.0923822, 0, 0, 0, 1, 1,
-0.5542035, -1.048221, -2.331945, 0, 0, 0, 1, 1,
-0.5457458, -0.6309528, -4.380457, 0, 0, 0, 1, 1,
-0.5449503, -0.09257068, -1.90037, 0, 0, 0, 1, 1,
-0.5363663, -1.081064, -4.022505, 0, 0, 0, 1, 1,
-0.5329826, 0.5932676, -0.3552968, 0, 0, 0, 1, 1,
-0.5257029, -2.184838, -1.323619, 1, 1, 1, 1, 1,
-0.521554, 1.085219, -1.164557, 1, 1, 1, 1, 1,
-0.5213907, 1.060395, -0.8117609, 1, 1, 1, 1, 1,
-0.5206734, -0.1863301, -1.367759, 1, 1, 1, 1, 1,
-0.520298, -1.355236, 0.4924412, 1, 1, 1, 1, 1,
-0.5179122, 1.10774, -1.647696, 1, 1, 1, 1, 1,
-0.514331, -0.3510797, -0.501142, 1, 1, 1, 1, 1,
-0.5089902, 2.034177, -0.3184174, 1, 1, 1, 1, 1,
-0.5082536, -0.2886131, -3.966424, 1, 1, 1, 1, 1,
-0.4963771, -0.6151115, -0.6429711, 1, 1, 1, 1, 1,
-0.4939837, 1.345149, 0.254186, 1, 1, 1, 1, 1,
-0.4918778, -0.2139659, -1.85693, 1, 1, 1, 1, 1,
-0.4859084, 0.4964525, -2.164379, 1, 1, 1, 1, 1,
-0.4857838, -1.234815, -2.387406, 1, 1, 1, 1, 1,
-0.4857313, 0.6587626, -1.930727, 1, 1, 1, 1, 1,
-0.484964, 0.5122931, 0.2452611, 0, 0, 1, 1, 1,
-0.484859, -1.998248, -3.312822, 1, 0, 0, 1, 1,
-0.4806102, -1.871374, -4.244364, 1, 0, 0, 1, 1,
-0.474482, -1.340899, -2.760647, 1, 0, 0, 1, 1,
-0.467819, 0.03637671, -0.9697904, 1, 0, 0, 1, 1,
-0.4663357, -0.5400655, -1.446387, 1, 0, 0, 1, 1,
-0.4635066, 0.7902671, -1.371283, 0, 0, 0, 1, 1,
-0.4612612, 0.4265912, -0.1138847, 0, 0, 0, 1, 1,
-0.4593143, -0.1572832, -1.153983, 0, 0, 0, 1, 1,
-0.4573223, -1.51119, -2.739967, 0, 0, 0, 1, 1,
-0.4543253, -1.89469, -2.026681, 0, 0, 0, 1, 1,
-0.4532468, 0.6647361, -0.3991396, 0, 0, 0, 1, 1,
-0.4514177, 0.3728699, -3.2848, 0, 0, 0, 1, 1,
-0.4444494, 1.086453, -1.263498, 1, 1, 1, 1, 1,
-0.4372537, 0.6447853, 0.13739, 1, 1, 1, 1, 1,
-0.435095, -0.778397, -1.57486, 1, 1, 1, 1, 1,
-0.4310106, -0.4750072, -1.486789, 1, 1, 1, 1, 1,
-0.4306522, -0.07935849, -1.165281, 1, 1, 1, 1, 1,
-0.4257951, 0.7709579, -1.050675, 1, 1, 1, 1, 1,
-0.419732, 0.4313188, -1.028646, 1, 1, 1, 1, 1,
-0.4145726, 1.118446, -1.933118, 1, 1, 1, 1, 1,
-0.4141204, 0.3899449, -1.314558, 1, 1, 1, 1, 1,
-0.4131937, -0.9504723, -3.257457, 1, 1, 1, 1, 1,
-0.4049389, 1.664605, 0.08236034, 1, 1, 1, 1, 1,
-0.4002641, 0.08528803, -0.2781116, 1, 1, 1, 1, 1,
-0.3990588, 0.20545, -0.8426426, 1, 1, 1, 1, 1,
-0.3986811, -0.02681628, -0.02885746, 1, 1, 1, 1, 1,
-0.3954313, -0.970082, -3.354834, 1, 1, 1, 1, 1,
-0.3937656, 1.061226, -3.300679, 0, 0, 1, 1, 1,
-0.3937363, -0.3683276, -3.051466, 1, 0, 0, 1, 1,
-0.393583, -0.6907154, -1.588015, 1, 0, 0, 1, 1,
-0.391847, 1.409818, 1.649908, 1, 0, 0, 1, 1,
-0.3835729, 1.831812, -0.3023646, 1, 0, 0, 1, 1,
-0.3772589, 0.6680181, -0.2493654, 1, 0, 0, 1, 1,
-0.3733623, -0.5081155, -1.273144, 0, 0, 0, 1, 1,
-0.3712197, -0.9688501, -3.566897, 0, 0, 0, 1, 1,
-0.3696069, -1.195805, -3.552439, 0, 0, 0, 1, 1,
-0.3687592, 0.6142813, -1.486646, 0, 0, 0, 1, 1,
-0.3632828, -0.4886889, -1.686134, 0, 0, 0, 1, 1,
-0.35921, -1.274651, -3.109291, 0, 0, 0, 1, 1,
-0.3480852, 0.2323333, -2.136874, 0, 0, 0, 1, 1,
-0.3438598, 1.955583, -1.530064, 1, 1, 1, 1, 1,
-0.3417755, 0.2666394, -2.565043, 1, 1, 1, 1, 1,
-0.3367447, 0.6369391, -1.32709, 1, 1, 1, 1, 1,
-0.335297, -0.8268383, -2.61172, 1, 1, 1, 1, 1,
-0.3346478, 0.2043511, -2.814526, 1, 1, 1, 1, 1,
-0.3310618, -0.8552389, -3.004321, 1, 1, 1, 1, 1,
-0.330092, -0.6207318, -4.340734, 1, 1, 1, 1, 1,
-0.3277389, -0.5125607, -0.616587, 1, 1, 1, 1, 1,
-0.3262845, -0.967559, -1.508428, 1, 1, 1, 1, 1,
-0.325123, 0.4177978, -0.5762824, 1, 1, 1, 1, 1,
-0.3243305, -0.9404498, -3.703776, 1, 1, 1, 1, 1,
-0.3233129, -0.686066, -2.288045, 1, 1, 1, 1, 1,
-0.3188059, -0.6929879, -1.074702, 1, 1, 1, 1, 1,
-0.318211, -1.291904, -2.383825, 1, 1, 1, 1, 1,
-0.3134371, 0.3961343, -1.907523, 1, 1, 1, 1, 1,
-0.3072508, -0.6336036, -4.700777, 0, 0, 1, 1, 1,
-0.3048585, -0.5431849, -1.243354, 1, 0, 0, 1, 1,
-0.302738, 0.01800512, -1.844472, 1, 0, 0, 1, 1,
-0.3006827, 0.2333398, -0.510475, 1, 0, 0, 1, 1,
-0.2984819, -1.050123, -4.05531, 1, 0, 0, 1, 1,
-0.2980689, -0.3801138, -2.685842, 1, 0, 0, 1, 1,
-0.2944994, 0.5472276, -0.5936284, 0, 0, 0, 1, 1,
-0.2942964, 0.2280836, -0.5085397, 0, 0, 0, 1, 1,
-0.2927448, -1.559272, -2.485813, 0, 0, 0, 1, 1,
-0.291396, -1.615344, -4.30682, 0, 0, 0, 1, 1,
-0.2891324, 1.64692, -2.029156, 0, 0, 0, 1, 1,
-0.288904, -0.2522979, -2.834595, 0, 0, 0, 1, 1,
-0.2887682, 0.8206397, -0.3534753, 0, 0, 0, 1, 1,
-0.2872251, -2.39615, -3.763259, 1, 1, 1, 1, 1,
-0.286824, 0.5936407, -0.3716207, 1, 1, 1, 1, 1,
-0.2866278, 0.370277, -0.1878446, 1, 1, 1, 1, 1,
-0.2855325, -0.1736449, -1.37708, 1, 1, 1, 1, 1,
-0.2833542, -0.3220015, -1.153012, 1, 1, 1, 1, 1,
-0.2823777, 2.085144, 1.270263, 1, 1, 1, 1, 1,
-0.2755045, 0.7133662, -0.2569354, 1, 1, 1, 1, 1,
-0.2732477, -0.5483505, -1.025561, 1, 1, 1, 1, 1,
-0.2725038, 0.2831608, -1.210362, 1, 1, 1, 1, 1,
-0.2588482, 0.795365, -0.2494839, 1, 1, 1, 1, 1,
-0.2562614, 1.912463, 0.8391817, 1, 1, 1, 1, 1,
-0.2532565, -1.612293, -2.746235, 1, 1, 1, 1, 1,
-0.2500187, -1.06847, -1.680627, 1, 1, 1, 1, 1,
-0.2418676, 1.909066, -1.576468, 1, 1, 1, 1, 1,
-0.2372285, 0.4180164, 0.5957942, 1, 1, 1, 1, 1,
-0.2366786, 0.2592594, -1.26556, 0, 0, 1, 1, 1,
-0.2350903, -1.769399, -3.629676, 1, 0, 0, 1, 1,
-0.2274925, 1.713586, 0.02768961, 1, 0, 0, 1, 1,
-0.2258416, 0.1285869, -2.51591, 1, 0, 0, 1, 1,
-0.2225889, 0.1653561, -1.816202, 1, 0, 0, 1, 1,
-0.2212679, 0.9454576, 0.600922, 1, 0, 0, 1, 1,
-0.2099551, 1.258276, -0.5489141, 0, 0, 0, 1, 1,
-0.1998965, 0.7833149, -0.5066757, 0, 0, 0, 1, 1,
-0.1998698, -0.4666412, -2.735194, 0, 0, 0, 1, 1,
-0.1995869, -0.5073461, -2.260689, 0, 0, 0, 1, 1,
-0.1985301, 0.09228539, -1.699378, 0, 0, 0, 1, 1,
-0.1910402, 0.8051726, -1.480243, 0, 0, 0, 1, 1,
-0.1909049, 1.213976, -0.1798397, 0, 0, 0, 1, 1,
-0.1884628, 2.767266, 1.952184, 1, 1, 1, 1, 1,
-0.1860992, 0.09060525, -3.312788, 1, 1, 1, 1, 1,
-0.1854774, 0.8764634, -1.196281, 1, 1, 1, 1, 1,
-0.1851867, -0.7335002, -0.9795245, 1, 1, 1, 1, 1,
-0.1828082, -1.115724, -4.151862, 1, 1, 1, 1, 1,
-0.1806493, 1.360741, -0.9986671, 1, 1, 1, 1, 1,
-0.1804676, -0.3415076, -0.8910538, 1, 1, 1, 1, 1,
-0.1789831, -0.4067957, -1.212643, 1, 1, 1, 1, 1,
-0.1748352, -1.049434, -2.351164, 1, 1, 1, 1, 1,
-0.1718713, -1.74344, -3.816689, 1, 1, 1, 1, 1,
-0.1710435, 1.42053, 0.4126382, 1, 1, 1, 1, 1,
-0.1697242, 0.4270271, -1.006145, 1, 1, 1, 1, 1,
-0.1692702, -1.445976, -3.872959, 1, 1, 1, 1, 1,
-0.1663112, -0.5613135, -2.756059, 1, 1, 1, 1, 1,
-0.162452, -1.150504, -1.854233, 1, 1, 1, 1, 1,
-0.1595698, -2.188626, -3.623408, 0, 0, 1, 1, 1,
-0.1591035, 0.4459117, -2.819747, 1, 0, 0, 1, 1,
-0.1580105, -0.1779431, -2.097337, 1, 0, 0, 1, 1,
-0.1545325, -0.09799509, -1.670576, 1, 0, 0, 1, 1,
-0.1534722, -0.1958261, -1.593471, 1, 0, 0, 1, 1,
-0.1456587, 1.27947, -0.7265884, 1, 0, 0, 1, 1,
-0.1394866, -0.8622591, -1.471793, 0, 0, 0, 1, 1,
-0.1380301, -0.6092002, -4.631687, 0, 0, 0, 1, 1,
-0.1371785, -0.5798599, -3.518306, 0, 0, 0, 1, 1,
-0.1343996, 0.1845774, -0.2851447, 0, 0, 0, 1, 1,
-0.1323578, 1.337353, -0.3280698, 0, 0, 0, 1, 1,
-0.1315226, 0.6781328, -1.935727, 0, 0, 0, 1, 1,
-0.128378, 0.5080833, -0.5869142, 0, 0, 0, 1, 1,
-0.1220127, 1.800646, -0.2025395, 1, 1, 1, 1, 1,
-0.1210196, -0.6120434, -2.806052, 1, 1, 1, 1, 1,
-0.117, 0.4800148, -1.912017, 1, 1, 1, 1, 1,
-0.1166959, 1.488072, 0.3860477, 1, 1, 1, 1, 1,
-0.1116076, 0.9011121, 0.2578028, 1, 1, 1, 1, 1,
-0.1103852, -0.533291, -3.201407, 1, 1, 1, 1, 1,
-0.1047654, 1.4205, -0.1755146, 1, 1, 1, 1, 1,
-0.1022997, 1.082631, 0.286043, 1, 1, 1, 1, 1,
-0.1019552, 0.4735072, 1.426387, 1, 1, 1, 1, 1,
-0.09842167, 0.03518854, -0.9650296, 1, 1, 1, 1, 1,
-0.09023975, -0.1369114, -1.710215, 1, 1, 1, 1, 1,
-0.08907726, -0.1407306, -1.964253, 1, 1, 1, 1, 1,
-0.08870461, 0.5932502, -2.370436, 1, 1, 1, 1, 1,
-0.08827145, -1.163049, -3.946234, 1, 1, 1, 1, 1,
-0.0841885, 0.5769792, 0.2072295, 1, 1, 1, 1, 1,
-0.08370224, 1.57079, 1.275949, 0, 0, 1, 1, 1,
-0.08358442, -0.2182688, -2.570053, 1, 0, 0, 1, 1,
-0.07909197, -0.7171263, -3.630028, 1, 0, 0, 1, 1,
-0.0776615, -2.744614, -3.446296, 1, 0, 0, 1, 1,
-0.0746314, 1.626622, -0.4781336, 1, 0, 0, 1, 1,
-0.07262781, -0.1919934, -1.300449, 1, 0, 0, 1, 1,
-0.07088833, 0.4909118, 0.4727264, 0, 0, 0, 1, 1,
-0.06998133, -0.03572679, -0.03238278, 0, 0, 0, 1, 1,
-0.06596555, -0.4401962, -3.061779, 0, 0, 0, 1, 1,
-0.06472199, 0.9553161, -0.6604604, 0, 0, 0, 1, 1,
-0.0632375, -0.05945748, -3.119608, 0, 0, 0, 1, 1,
-0.06226023, 1.836995, -2.203608, 0, 0, 0, 1, 1,
-0.05904598, -0.7407388, 0.03180845, 0, 0, 0, 1, 1,
-0.05827833, -0.2689102, -4.223798, 1, 1, 1, 1, 1,
-0.05799645, -0.3683982, -4.332426, 1, 1, 1, 1, 1,
-0.05319743, 1.252273, 0.5146144, 1, 1, 1, 1, 1,
-0.05295485, 0.4092735, -0.6792966, 1, 1, 1, 1, 1,
-0.05031225, -0.6513239, -3.840482, 1, 1, 1, 1, 1,
-0.04234917, 0.05862547, 0.1112899, 1, 1, 1, 1, 1,
-0.04026958, 2.281222, -0.7639486, 1, 1, 1, 1, 1,
-0.0401659, 0.8330451, 2.053285, 1, 1, 1, 1, 1,
-0.03757083, 0.1928656, -0.3821101, 1, 1, 1, 1, 1,
-0.0330914, -0.1435343, -3.561594, 1, 1, 1, 1, 1,
-0.03308974, -2.107228, -2.79198, 1, 1, 1, 1, 1,
-0.03219775, -0.7562916, -6.958219, 1, 1, 1, 1, 1,
-0.03206802, 1.298705, -1.135723, 1, 1, 1, 1, 1,
-0.02930407, -1.619761, -4.310457, 1, 1, 1, 1, 1,
-0.02655183, -1.134067, -2.221618, 1, 1, 1, 1, 1,
-0.01987711, 1.893643, -0.5892031, 0, 0, 1, 1, 1,
-0.01157951, 0.9558377, 2.518643, 1, 0, 0, 1, 1,
-0.007254906, 0.8007249, -1.015441, 1, 0, 0, 1, 1,
-0.006482974, -0.3440412, -3.81669, 1, 0, 0, 1, 1,
-0.003425471, 1.098501, 1.330003, 1, 0, 0, 1, 1,
-0.0006362455, -1.748703, -2.835747, 1, 0, 0, 1, 1,
0.003148701, 0.1436929, 0.0943497, 0, 0, 0, 1, 1,
0.007712594, 0.5079613, 0.03783846, 0, 0, 0, 1, 1,
0.01260761, -1.789948, 3.898352, 0, 0, 0, 1, 1,
0.01356809, -0.9261804, 3.221772, 0, 0, 0, 1, 1,
0.01773633, -0.6124239, 3.069803, 0, 0, 0, 1, 1,
0.01946017, 0.2989875, 0.7811712, 0, 0, 0, 1, 1,
0.02123399, 1.616192, 1.515264, 0, 0, 0, 1, 1,
0.02209552, 0.8889756, -2.238049, 1, 1, 1, 1, 1,
0.02252782, 0.8760672, 0.4170904, 1, 1, 1, 1, 1,
0.023047, 0.1788356, 0.8420671, 1, 1, 1, 1, 1,
0.02840539, 1.848391, -0.4183141, 1, 1, 1, 1, 1,
0.03235037, -0.2091839, 1.472062, 1, 1, 1, 1, 1,
0.03788697, -0.4929333, 2.670616, 1, 1, 1, 1, 1,
0.03932235, 0.7346302, 0.4199172, 1, 1, 1, 1, 1,
0.04267319, 1.022196, 1.128797, 1, 1, 1, 1, 1,
0.04810137, 1.41174, 2.177853, 1, 1, 1, 1, 1,
0.04929918, -1.133608, 2.948574, 1, 1, 1, 1, 1,
0.04999499, 1.294928, -0.4652491, 1, 1, 1, 1, 1,
0.05034706, -0.6683939, 1.472678, 1, 1, 1, 1, 1,
0.05266384, 0.05708826, 1.887629, 1, 1, 1, 1, 1,
0.05379257, 0.3232622, -1.470078, 1, 1, 1, 1, 1,
0.05993862, -0.7713538, 3.24986, 1, 1, 1, 1, 1,
0.06023925, 0.7290577, 0.4262959, 0, 0, 1, 1, 1,
0.06091786, -0.4606647, 3.814056, 1, 0, 0, 1, 1,
0.06343532, -2.07697, 4.011321, 1, 0, 0, 1, 1,
0.06347542, 0.2109041, -0.02397399, 1, 0, 0, 1, 1,
0.06555562, -0.6706741, 4.753247, 1, 0, 0, 1, 1,
0.06712836, -0.5499049, 2.884953, 1, 0, 0, 1, 1,
0.06976677, 0.3348807, -0.3617691, 0, 0, 0, 1, 1,
0.07101142, 0.798377, 0.06388611, 0, 0, 0, 1, 1,
0.07201084, -0.1192397, 1.851782, 0, 0, 0, 1, 1,
0.07265326, -0.7360368, 3.711583, 0, 0, 0, 1, 1,
0.0732303, -0.06408337, 2.606616, 0, 0, 0, 1, 1,
0.07551639, 1.118047, -0.3377477, 0, 0, 0, 1, 1,
0.07912707, 1.3671, -1.257594, 0, 0, 0, 1, 1,
0.08000569, 1.124073, 0.9553769, 1, 1, 1, 1, 1,
0.09212354, 0.4423535, -1.615929, 1, 1, 1, 1, 1,
0.09239615, -0.7708853, 1.492598, 1, 1, 1, 1, 1,
0.09429112, 1.000443, -0.3302799, 1, 1, 1, 1, 1,
0.09563497, -0.632351, 2.194808, 1, 1, 1, 1, 1,
0.09892283, 0.09115066, 0.561435, 1, 1, 1, 1, 1,
0.09997837, 0.9189609, 0.523092, 1, 1, 1, 1, 1,
0.1046373, 0.1220369, 0.7707428, 1, 1, 1, 1, 1,
0.1053165, 1.166035, 0.8506395, 1, 1, 1, 1, 1,
0.1064921, 1.279715, 1.951089, 1, 1, 1, 1, 1,
0.1089594, -0.1880637, 2.583612, 1, 1, 1, 1, 1,
0.1111139, -1.138373, 3.671731, 1, 1, 1, 1, 1,
0.1113754, -1.34487, 3.624402, 1, 1, 1, 1, 1,
0.1176681, -1.876336, 1.6323, 1, 1, 1, 1, 1,
0.1212958, 0.8734612, 0.481301, 1, 1, 1, 1, 1,
0.1230972, 0.2198341, 0.138845, 0, 0, 1, 1, 1,
0.1242486, 0.4695815, 0.04123725, 1, 0, 0, 1, 1,
0.1258136, 2.081072, 1.407491, 1, 0, 0, 1, 1,
0.1260812, 0.09149621, 1.821774, 1, 0, 0, 1, 1,
0.127693, -0.6065924, 1.995873, 1, 0, 0, 1, 1,
0.1278339, 1.587357, -0.2288408, 1, 0, 0, 1, 1,
0.1304596, -0.4909963, 3.650557, 0, 0, 0, 1, 1,
0.1336241, 1.794023, 1.056382, 0, 0, 0, 1, 1,
0.1353275, 0.455364, 2.118807, 0, 0, 0, 1, 1,
0.1391651, 0.1142081, 1.148191, 0, 0, 0, 1, 1,
0.1395448, 0.8371414, -1.192639, 0, 0, 0, 1, 1,
0.1403806, -0.8182431, 3.185463, 0, 0, 0, 1, 1,
0.1403962, -0.5354307, 1.738276, 0, 0, 0, 1, 1,
0.1416955, 0.6068568, -1.961984, 1, 1, 1, 1, 1,
0.1418059, 0.05104096, 1.580463, 1, 1, 1, 1, 1,
0.1450006, -0.8996614, 1.908371, 1, 1, 1, 1, 1,
0.1450351, 1.696646, 0.8676426, 1, 1, 1, 1, 1,
0.1463197, -0.5534425, 2.868355, 1, 1, 1, 1, 1,
0.1473969, 0.08719315, -0.7751038, 1, 1, 1, 1, 1,
0.1491004, -1.213232, 4.352498, 1, 1, 1, 1, 1,
0.1513062, 0.1834397, 0.9365857, 1, 1, 1, 1, 1,
0.1541959, 0.1753187, 0.367869, 1, 1, 1, 1, 1,
0.155397, 1.342105, -1.394216, 1, 1, 1, 1, 1,
0.1556431, -1.561608, 2.514776, 1, 1, 1, 1, 1,
0.162489, 0.04924797, 1.800042, 1, 1, 1, 1, 1,
0.1678811, 1.538086, 2.920159, 1, 1, 1, 1, 1,
0.1689521, 0.9979554, -0.606472, 1, 1, 1, 1, 1,
0.1694841, -0.3996833, 2.577679, 1, 1, 1, 1, 1,
0.1741173, -0.1375274, -0.3104684, 0, 0, 1, 1, 1,
0.1820647, 0.6853846, -0.8332719, 1, 0, 0, 1, 1,
0.1821377, 1.816933, 0.7027815, 1, 0, 0, 1, 1,
0.1823214, -0.3103956, 3.430475, 1, 0, 0, 1, 1,
0.1838823, 0.5727407, 1.071714, 1, 0, 0, 1, 1,
0.1858992, 1.361346, 0.7493564, 1, 0, 0, 1, 1,
0.1915304, -1.902287, 3.053182, 0, 0, 0, 1, 1,
0.1922254, -1.130358, 2.33291, 0, 0, 0, 1, 1,
0.1954695, 0.4260195, 1.073241, 0, 0, 0, 1, 1,
0.1969526, 0.9136139, 0.6288038, 0, 0, 0, 1, 1,
0.1993195, -0.01505787, 0.6300875, 0, 0, 0, 1, 1,
0.1996247, -1.727048, 3.770863, 0, 0, 0, 1, 1,
0.2034101, 1.767919, 1.362857, 0, 0, 0, 1, 1,
0.205481, -0.1210526, 2.92043, 1, 1, 1, 1, 1,
0.2077622, 0.3003003, -0.2300508, 1, 1, 1, 1, 1,
0.2082511, -2.73287, 3.298087, 1, 1, 1, 1, 1,
0.2174045, -0.0850398, 0.1404838, 1, 1, 1, 1, 1,
0.2176227, -1.247002, 3.433868, 1, 1, 1, 1, 1,
0.2209432, 0.3808917, 0.8503474, 1, 1, 1, 1, 1,
0.222535, -1.066403, 3.719052, 1, 1, 1, 1, 1,
0.222776, -0.5530494, 2.941014, 1, 1, 1, 1, 1,
0.2241893, -0.1492749, 3.903538, 1, 1, 1, 1, 1,
0.2285616, 0.8196735, 1.882551, 1, 1, 1, 1, 1,
0.2298478, 0.2596133, 2.594697, 1, 1, 1, 1, 1,
0.2311142, 0.5293376, -0.7531308, 1, 1, 1, 1, 1,
0.2459841, 1.234619, 0.9286355, 1, 1, 1, 1, 1,
0.2465193, 0.4124784, 1.940257, 1, 1, 1, 1, 1,
0.2472747, 0.02237723, 2.567245, 1, 1, 1, 1, 1,
0.2498677, -1.274878, 3.008042, 0, 0, 1, 1, 1,
0.2559828, -1.349237, 1.682118, 1, 0, 0, 1, 1,
0.2568591, 1.121722, 1.388773, 1, 0, 0, 1, 1,
0.2573539, -1.800599, 2.542371, 1, 0, 0, 1, 1,
0.2624736, 0.3669772, -0.7292392, 1, 0, 0, 1, 1,
0.2638946, 0.209364, 1.26636, 1, 0, 0, 1, 1,
0.2645312, 1.531176, -0.02519218, 0, 0, 0, 1, 1,
0.2646013, 0.6808634, -0.5603392, 0, 0, 0, 1, 1,
0.2658573, -1.536346, 2.460914, 0, 0, 0, 1, 1,
0.2684414, 0.3705976, -1.541581, 0, 0, 0, 1, 1,
0.2728021, -1.128748, 3.835524, 0, 0, 0, 1, 1,
0.2736529, 2.048651, 1.753086, 0, 0, 0, 1, 1,
0.2743736, 0.5285462, 0.4089399, 0, 0, 0, 1, 1,
0.2815975, -1.754313, 2.982103, 1, 1, 1, 1, 1,
0.2845243, 0.3311653, 0.3417802, 1, 1, 1, 1, 1,
0.296584, 1.089033, 0.8874563, 1, 1, 1, 1, 1,
0.2979837, 0.2056144, 0.2440362, 1, 1, 1, 1, 1,
0.300758, -1.14265, 2.771527, 1, 1, 1, 1, 1,
0.3012026, 1.220542, 0.4464503, 1, 1, 1, 1, 1,
0.3013382, 1.764991, 1.970014, 1, 1, 1, 1, 1,
0.3017428, -0.4842879, 2.82777, 1, 1, 1, 1, 1,
0.3031118, -1.424461, 1.51136, 1, 1, 1, 1, 1,
0.303811, -0.5909255, 3.448508, 1, 1, 1, 1, 1,
0.3046995, -0.9867387, 2.919997, 1, 1, 1, 1, 1,
0.3073316, -1.311647, 2.480896, 1, 1, 1, 1, 1,
0.3076099, 0.6736429, 0.3133843, 1, 1, 1, 1, 1,
0.3090265, -0.6208827, 1.575196, 1, 1, 1, 1, 1,
0.3126286, -0.3251625, 1.567513, 1, 1, 1, 1, 1,
0.31386, 0.3090033, -0.3864294, 0, 0, 1, 1, 1,
0.3166352, -0.5354097, 3.494217, 1, 0, 0, 1, 1,
0.3183983, -0.4422448, 2.742792, 1, 0, 0, 1, 1,
0.3203348, 0.03064016, 2.628626, 1, 0, 0, 1, 1,
0.321667, 0.7380551, 0.8341095, 1, 0, 0, 1, 1,
0.3230985, 1.06415, 1.355154, 1, 0, 0, 1, 1,
0.3233065, 0.782005, -0.8643683, 0, 0, 0, 1, 1,
0.3241761, 0.9913639, -0.5204789, 0, 0, 0, 1, 1,
0.3266866, -0.1148294, 0.8962892, 0, 0, 0, 1, 1,
0.327983, -0.5470523, 4.033121, 0, 0, 0, 1, 1,
0.3315327, -0.6013567, 2.311832, 0, 0, 0, 1, 1,
0.3326074, 1.80685, 0.7881191, 0, 0, 0, 1, 1,
0.335144, 0.6086753, -0.2801318, 0, 0, 0, 1, 1,
0.3474014, -0.4655405, 2.768299, 1, 1, 1, 1, 1,
0.352615, 1.631952, 0.4528199, 1, 1, 1, 1, 1,
0.3573509, 1.078704, 0.05302311, 1, 1, 1, 1, 1,
0.3575793, 0.1958252, 1.590767, 1, 1, 1, 1, 1,
0.3578795, 0.8822926, -0.3572648, 1, 1, 1, 1, 1,
0.3590378, 2.089159, 2.313928, 1, 1, 1, 1, 1,
0.3615285, -0.3686022, 1.861894, 1, 1, 1, 1, 1,
0.3643634, 0.8672229, 0.8036683, 1, 1, 1, 1, 1,
0.3675766, -1.706354, 4.801567, 1, 1, 1, 1, 1,
0.3680856, -0.5197686, 3.034815, 1, 1, 1, 1, 1,
0.368409, 0.3756901, 1.093344, 1, 1, 1, 1, 1,
0.3702757, -0.2688698, 3.017867, 1, 1, 1, 1, 1,
0.3739365, -0.01856458, 0.3319541, 1, 1, 1, 1, 1,
0.3750204, -0.03148539, 2.116352, 1, 1, 1, 1, 1,
0.3767742, -1.068913, 4.789314, 1, 1, 1, 1, 1,
0.3780302, 1.198813, 1.710515, 0, 0, 1, 1, 1,
0.3800007, 0.7215591, 1.053128, 1, 0, 0, 1, 1,
0.3827201, 0.02578579, 0.721294, 1, 0, 0, 1, 1,
0.3842096, -0.6903862, 0.8397663, 1, 0, 0, 1, 1,
0.3853764, 0.07909913, 2.874361, 1, 0, 0, 1, 1,
0.3855289, -0.9324297, 3.109038, 1, 0, 0, 1, 1,
0.3871306, 0.9659759, -0.1607952, 0, 0, 0, 1, 1,
0.3884239, -1.750304, 2.439705, 0, 0, 0, 1, 1,
0.3937381, -1.087309, 1.233712, 0, 0, 0, 1, 1,
0.4002496, -1.511181, 4.408715, 0, 0, 0, 1, 1,
0.4005421, -1.39237, 2.240283, 0, 0, 0, 1, 1,
0.4065228, -0.7043652, 2.387425, 0, 0, 0, 1, 1,
0.4076304, -1.851164, 5.446534, 0, 0, 0, 1, 1,
0.4128739, 1.86085, -1.167929, 1, 1, 1, 1, 1,
0.4137233, -0.6297899, 3.404591, 1, 1, 1, 1, 1,
0.4139484, 2.163883, 1.581646, 1, 1, 1, 1, 1,
0.4160625, -1.477993, 2.557923, 1, 1, 1, 1, 1,
0.417444, 0.9441051, 0.3903611, 1, 1, 1, 1, 1,
0.4193576, -1.070153, 1.746749, 1, 1, 1, 1, 1,
0.4251384, -0.01443743, 2.913148, 1, 1, 1, 1, 1,
0.4268513, 0.3125373, 0.6134287, 1, 1, 1, 1, 1,
0.4311505, 1.445292, 1.664237, 1, 1, 1, 1, 1,
0.4329888, 0.2774261, 1.642381, 1, 1, 1, 1, 1,
0.4373309, 1.384412, 0.5881322, 1, 1, 1, 1, 1,
0.4395792, -0.5212114, 2.304016, 1, 1, 1, 1, 1,
0.4448389, -0.4363243, 3.007084, 1, 1, 1, 1, 1,
0.4452096, -1.006661, 2.904785, 1, 1, 1, 1, 1,
0.4537697, 0.6863682, 0.7672113, 1, 1, 1, 1, 1,
0.4538432, 0.5323483, -0.676246, 0, 0, 1, 1, 1,
0.4554845, 0.06823087, 2.722793, 1, 0, 0, 1, 1,
0.4671945, 0.2801241, 0.6078795, 1, 0, 0, 1, 1,
0.468913, 0.07678747, 1.859893, 1, 0, 0, 1, 1,
0.4742022, 0.2160871, 1.535136, 1, 0, 0, 1, 1,
0.4765023, 0.696398, 0.7744555, 1, 0, 0, 1, 1,
0.4771268, 0.1707752, 1.325575, 0, 0, 0, 1, 1,
0.4772492, -1.138458, 2.439954, 0, 0, 0, 1, 1,
0.4778138, -0.5311866, 1.536266, 0, 0, 0, 1, 1,
0.4790927, -0.2550113, 1.485478, 0, 0, 0, 1, 1,
0.4801137, 0.8822982, 1.784958, 0, 0, 0, 1, 1,
0.481868, 1.403432, 0.900255, 0, 0, 0, 1, 1,
0.485435, -1.564538, 4.390996, 0, 0, 0, 1, 1,
0.4897464, 0.01507373, 1.357435, 1, 1, 1, 1, 1,
0.4906363, 1.498708, 1.690266, 1, 1, 1, 1, 1,
0.4943723, 1.763887, 0.9533104, 1, 1, 1, 1, 1,
0.5012057, 0.8808249, -0.274128, 1, 1, 1, 1, 1,
0.5027453, 0.02337187, 2.071522, 1, 1, 1, 1, 1,
0.5033727, -0.09122839, 1.614681, 1, 1, 1, 1, 1,
0.5166121, 0.4342849, 1.417759, 1, 1, 1, 1, 1,
0.5214159, 2.317449, 3.325683, 1, 1, 1, 1, 1,
0.5238302, 0.4163002, 1.744147, 1, 1, 1, 1, 1,
0.5267196, -0.6547811, 3.803911, 1, 1, 1, 1, 1,
0.5275851, 1.137846, 1.402195, 1, 1, 1, 1, 1,
0.5309508, 0.4271356, 0.8502163, 1, 1, 1, 1, 1,
0.5310514, 0.1589729, 2.284315, 1, 1, 1, 1, 1,
0.5319727, 0.8026757, -0.01706222, 1, 1, 1, 1, 1,
0.5339326, 0.4869583, 1.549283, 1, 1, 1, 1, 1,
0.5388513, -0.3252983, 1.794105, 0, 0, 1, 1, 1,
0.5442282, 0.09782037, 3.550667, 1, 0, 0, 1, 1,
0.546541, 0.09387954, 1.190365, 1, 0, 0, 1, 1,
0.5468603, -0.1856617, 0.9015877, 1, 0, 0, 1, 1,
0.5496422, -0.1123148, 3.458154, 1, 0, 0, 1, 1,
0.5498167, -0.8507593, 3.241892, 1, 0, 0, 1, 1,
0.5596595, 0.003415928, 3.326313, 0, 0, 0, 1, 1,
0.5599372, -0.7259713, 2.037731, 0, 0, 0, 1, 1,
0.5610322, -0.8845803, 2.064793, 0, 0, 0, 1, 1,
0.5648042, 2.972713, -0.7950308, 0, 0, 0, 1, 1,
0.5696929, 1.064654, -0.6195632, 0, 0, 0, 1, 1,
0.5715775, -0.008180223, 1.11432, 0, 0, 0, 1, 1,
0.5737103, -0.9873629, 3.389744, 0, 0, 0, 1, 1,
0.5816765, -0.04153924, 1.093665, 1, 1, 1, 1, 1,
0.5853858, -1.046542, 2.615708, 1, 1, 1, 1, 1,
0.5885729, 1.466552, -0.2671899, 1, 1, 1, 1, 1,
0.5906706, 0.6937933, 1.002453, 1, 1, 1, 1, 1,
0.5916904, 0.6352468, 0.7465764, 1, 1, 1, 1, 1,
0.5968813, -0.3364305, 2.280245, 1, 1, 1, 1, 1,
0.5995089, -1.03868, 1.282812, 1, 1, 1, 1, 1,
0.6040133, -1.046803, 4.475286, 1, 1, 1, 1, 1,
0.6050707, 0.8358107, 0.9807339, 1, 1, 1, 1, 1,
0.6055311, -0.2716987, 3.101691, 1, 1, 1, 1, 1,
0.6115808, 0.5868499, 0.4143064, 1, 1, 1, 1, 1,
0.6126171, 0.4746375, 0.02992025, 1, 1, 1, 1, 1,
0.6145994, 0.8667802, 1.715657, 1, 1, 1, 1, 1,
0.6155709, 0.8986348, 2.33769, 1, 1, 1, 1, 1,
0.6175416, 0.3004624, 1.223196, 1, 1, 1, 1, 1,
0.6183327, -0.911871, 2.929248, 0, 0, 1, 1, 1,
0.6192507, -0.8904702, 2.058544, 1, 0, 0, 1, 1,
0.6195188, 2.636359, 1.17316, 1, 0, 0, 1, 1,
0.6195332, -1.231775, 2.05413, 1, 0, 0, 1, 1,
0.6198245, -0.7721326, 2.774127, 1, 0, 0, 1, 1,
0.6278439, 0.2429405, 0.3663292, 1, 0, 0, 1, 1,
0.6281915, -1.468975, 0.9286273, 0, 0, 0, 1, 1,
0.6368836, 0.8159504, 0.4675636, 0, 0, 0, 1, 1,
0.6416199, -0.2353592, 1.924942, 0, 0, 0, 1, 1,
0.6493707, 1.515988, 0.605621, 0, 0, 0, 1, 1,
0.6502478, -0.9220258, 2.812399, 0, 0, 0, 1, 1,
0.6506253, 1.22578, 1.420032, 0, 0, 0, 1, 1,
0.6522462, -0.4716092, 2.155116, 0, 0, 0, 1, 1,
0.6533095, 0.8450493, 0.4729344, 1, 1, 1, 1, 1,
0.6541965, -0.7819158, 2.973572, 1, 1, 1, 1, 1,
0.6549842, -0.2038693, 2.741955, 1, 1, 1, 1, 1,
0.6578331, -0.3720017, 2.723865, 1, 1, 1, 1, 1,
0.6620566, 1.396855, 1.716383, 1, 1, 1, 1, 1,
0.6723282, 1.41985, 0.05353352, 1, 1, 1, 1, 1,
0.6736343, 1.948403, 0.2978129, 1, 1, 1, 1, 1,
0.6758011, -0.8364296, 2.593127, 1, 1, 1, 1, 1,
0.67882, 1.541062, 1.324861, 1, 1, 1, 1, 1,
0.6798043, -1.21502, 3.931252, 1, 1, 1, 1, 1,
0.6817823, 1.357911, -0.1691387, 1, 1, 1, 1, 1,
0.6866234, -0.3065145, 1.754344, 1, 1, 1, 1, 1,
0.6870431, -1.002136, 3.20734, 1, 1, 1, 1, 1,
0.6872565, -1.63305, 4.349431, 1, 1, 1, 1, 1,
0.6902612, -0.3175285, 0.2494175, 1, 1, 1, 1, 1,
0.6943949, 0.7038394, 0.3578377, 0, 0, 1, 1, 1,
0.6973503, 0.7867857, 1.541115, 1, 0, 0, 1, 1,
0.6987587, 0.230354, 2.105224, 1, 0, 0, 1, 1,
0.7027726, 0.06358818, 0.8471541, 1, 0, 0, 1, 1,
0.7037129, 0.1945031, 2.596703, 1, 0, 0, 1, 1,
0.7091667, -0.7251726, 1.74377, 1, 0, 0, 1, 1,
0.7126116, 1.059486, -0.713525, 0, 0, 0, 1, 1,
0.7128386, 0.08625797, -0.2831979, 0, 0, 0, 1, 1,
0.7139536, -0.4288955, 1.348921, 0, 0, 0, 1, 1,
0.7154168, 2.751336, -0.5139059, 0, 0, 0, 1, 1,
0.7173885, -0.7832029, 2.582644, 0, 0, 0, 1, 1,
0.7244985, 0.6571547, 0.1038831, 0, 0, 0, 1, 1,
0.7286342, -1.243404, 1.529642, 0, 0, 0, 1, 1,
0.735467, -1.352471, 2.952443, 1, 1, 1, 1, 1,
0.7360929, 0.8100337, 0.9747466, 1, 1, 1, 1, 1,
0.7398945, 0.03890523, 1.628124, 1, 1, 1, 1, 1,
0.7416831, -0.4704631, 0.07098125, 1, 1, 1, 1, 1,
0.7468868, 1.351951, 0.002497894, 1, 1, 1, 1, 1,
0.7469783, 1.325103, -0.0998288, 1, 1, 1, 1, 1,
0.7470608, -0.07992517, 3.096706, 1, 1, 1, 1, 1,
0.7539533, -1.496786, 2.955669, 1, 1, 1, 1, 1,
0.7551384, 0.3710333, -0.04334511, 1, 1, 1, 1, 1,
0.7601238, -0.8582935, -0.7579848, 1, 1, 1, 1, 1,
0.7633339, -0.5629453, 1.466931, 1, 1, 1, 1, 1,
0.7648076, 0.2537909, 1.578057, 1, 1, 1, 1, 1,
0.7653891, 0.3228407, 1.246693, 1, 1, 1, 1, 1,
0.7706959, 0.07779405, 2.505709, 1, 1, 1, 1, 1,
0.7881472, 0.7776403, 0.07997646, 1, 1, 1, 1, 1,
0.7918295, -0.09192099, 2.503642, 0, 0, 1, 1, 1,
0.7950467, 0.8868248, 1.635639, 1, 0, 0, 1, 1,
0.7971212, 0.1907344, 2.727268, 1, 0, 0, 1, 1,
0.8011354, -0.4419052, 2.840178, 1, 0, 0, 1, 1,
0.8012623, -1.22652, 3.334783, 1, 0, 0, 1, 1,
0.8021531, -0.2518227, 1.116635, 1, 0, 0, 1, 1,
0.8090212, 1.136977, 1.473997, 0, 0, 0, 1, 1,
0.8123283, 0.5234624, 0.4827849, 0, 0, 0, 1, 1,
0.8127066, -1.244964, 2.668364, 0, 0, 0, 1, 1,
0.8191004, 0.142866, 2.266627, 0, 0, 0, 1, 1,
0.8208835, -0.3108554, 0.503771, 0, 0, 0, 1, 1,
0.8211029, -0.2840843, -0.02600555, 0, 0, 0, 1, 1,
0.8320116, 1.791203, 1.74032, 0, 0, 0, 1, 1,
0.8341709, -0.9670486, 2.038495, 1, 1, 1, 1, 1,
0.8352122, 1.17669, -0.112911, 1, 1, 1, 1, 1,
0.8362216, 1.318232, 1.35549, 1, 1, 1, 1, 1,
0.842993, -1.272314, 1.395264, 1, 1, 1, 1, 1,
0.845495, 1.115649, 0.593138, 1, 1, 1, 1, 1,
0.8461348, 1.949567, 0.06758578, 1, 1, 1, 1, 1,
0.8463506, -0.6234539, 1.399132, 1, 1, 1, 1, 1,
0.8465342, 1.095349, 2.288903, 1, 1, 1, 1, 1,
0.8493454, -1.565744, 2.540781, 1, 1, 1, 1, 1,
0.8515224, -0.5792028, 2.041398, 1, 1, 1, 1, 1,
0.8532856, -1.246273, 1.542994, 1, 1, 1, 1, 1,
0.8587512, -0.9366391, 1.696192, 1, 1, 1, 1, 1,
0.8616574, 0.457182, 0.07949591, 1, 1, 1, 1, 1,
0.8634745, -1.978073, 3.221024, 1, 1, 1, 1, 1,
0.8639356, -0.2441388, 1.844005, 1, 1, 1, 1, 1,
0.8725199, 0.1368029, 3.002995, 0, 0, 1, 1, 1,
0.8766131, 0.8081521, 1.164057, 1, 0, 0, 1, 1,
0.8777564, 0.6132954, 0.9108724, 1, 0, 0, 1, 1,
0.8781973, 1.275514, -0.008953746, 1, 0, 0, 1, 1,
0.8792142, -1.681109, 2.200444, 1, 0, 0, 1, 1,
0.8824761, 0.986181, 0.7528136, 1, 0, 0, 1, 1,
0.8836812, 0.5277928, 0.6866263, 0, 0, 0, 1, 1,
0.8874964, -1.00637, 1.797926, 0, 0, 0, 1, 1,
0.8971922, 0.4999526, 1.479785, 0, 0, 0, 1, 1,
0.898755, -0.2743806, 2.546912, 0, 0, 0, 1, 1,
0.9005548, 0.2837144, 1.795063, 0, 0, 0, 1, 1,
0.9026248, 0.4290367, -0.08942394, 0, 0, 0, 1, 1,
0.9048446, 0.9083757, 0.7192869, 0, 0, 0, 1, 1,
0.906019, 1.88506, 0.6650433, 1, 1, 1, 1, 1,
0.917501, -2.404163, 2.060096, 1, 1, 1, 1, 1,
0.9182059, 0.9322471, -0.9605767, 1, 1, 1, 1, 1,
0.9194412, 0.06104774, 1.106326, 1, 1, 1, 1, 1,
0.9271186, 0.1087123, 2.754376, 1, 1, 1, 1, 1,
0.9297058, 1.116609, -1.628127, 1, 1, 1, 1, 1,
0.9351403, 1.075705, 0.89655, 1, 1, 1, 1, 1,
0.9375309, 1.667238, 0.6052926, 1, 1, 1, 1, 1,
0.9452503, -0.7974318, 1.495752, 1, 1, 1, 1, 1,
0.9455589, -0.3217296, 1.254995, 1, 1, 1, 1, 1,
0.9460731, -1.205983, 1.851583, 1, 1, 1, 1, 1,
0.9477991, 0.9202573, 0.2395929, 1, 1, 1, 1, 1,
0.9533312, 0.3808716, 1.50433, 1, 1, 1, 1, 1,
0.9567174, -0.6042544, 1.580013, 1, 1, 1, 1, 1,
0.9641069, 0.1008574, 2.567821, 1, 1, 1, 1, 1,
0.968632, -0.5321454, 2.275392, 0, 0, 1, 1, 1,
0.9697178, 1.272055, 0.3393832, 1, 0, 0, 1, 1,
0.9705827, 1.323259, 1.179369, 1, 0, 0, 1, 1,
0.9747353, 0.01916105, 1.729359, 1, 0, 0, 1, 1,
0.9768487, 0.3209654, 2.989588, 1, 0, 0, 1, 1,
0.9906293, -0.9212184, 1.515582, 1, 0, 0, 1, 1,
0.9910535, -0.03473422, 2.350918, 0, 0, 0, 1, 1,
0.999301, 0.8590963, -0.2086466, 0, 0, 0, 1, 1,
1.01202, 0.5428521, 1.392869, 0, 0, 0, 1, 1,
1.014535, 2.236815, -2.854087, 0, 0, 0, 1, 1,
1.020441, -0.6104623, 2.493289, 0, 0, 0, 1, 1,
1.024222, 0.7229756, -0.02715096, 0, 0, 0, 1, 1,
1.027599, 0.3331472, 1.021931, 0, 0, 0, 1, 1,
1.027697, 0.6746273, 2.569907, 1, 1, 1, 1, 1,
1.033154, 1.212269, 1.650295, 1, 1, 1, 1, 1,
1.034259, -0.1830837, 2.646786, 1, 1, 1, 1, 1,
1.034929, 0.2907531, 0.5594104, 1, 1, 1, 1, 1,
1.035404, 0.5102702, -1.585178, 1, 1, 1, 1, 1,
1.04001, -0.4280818, 2.343955, 1, 1, 1, 1, 1,
1.042905, -0.6715001, 2.160261, 1, 1, 1, 1, 1,
1.044176, 1.547776, -0.1340715, 1, 1, 1, 1, 1,
1.048395, -1.395522, 1.388872, 1, 1, 1, 1, 1,
1.053658, 0.5391735, 1.743895, 1, 1, 1, 1, 1,
1.054914, 0.6670122, 1.522977, 1, 1, 1, 1, 1,
1.055763, -0.9532615, 3.930021, 1, 1, 1, 1, 1,
1.057838, 0.7826675, 0.4042751, 1, 1, 1, 1, 1,
1.062389, 0.752004, 0.505653, 1, 1, 1, 1, 1,
1.062495, -0.1453967, 0.931809, 1, 1, 1, 1, 1,
1.062855, 0.5340725, 0.4958461, 0, 0, 1, 1, 1,
1.065668, 0.07575615, 1.487234, 1, 0, 0, 1, 1,
1.06647, -1.269217, 2.20778, 1, 0, 0, 1, 1,
1.068411, 1.095299, 0.5445153, 1, 0, 0, 1, 1,
1.075992, -0.3198869, 2.323148, 1, 0, 0, 1, 1,
1.077351, -0.01947984, 2.511454, 1, 0, 0, 1, 1,
1.077365, -0.6106192, 0.4706508, 0, 0, 0, 1, 1,
1.080839, 0.4841537, 1.825214, 0, 0, 0, 1, 1,
1.083918, 0.5282289, 0.600858, 0, 0, 0, 1, 1,
1.088058, 0.5376608, 2.616754, 0, 0, 0, 1, 1,
1.096478, 1.792458, -0.09678067, 0, 0, 0, 1, 1,
1.099612, 1.521047, 1.806932, 0, 0, 0, 1, 1,
1.112798, -1.798607, 5.287787, 0, 0, 0, 1, 1,
1.118799, -0.3256668, 1.996596, 1, 1, 1, 1, 1,
1.123974, -0.2820881, 1.115871, 1, 1, 1, 1, 1,
1.127611, 0.3578812, 1.046741, 1, 1, 1, 1, 1,
1.128057, -2.255761, 2.939151, 1, 1, 1, 1, 1,
1.132063, -1.31239, 3.229146, 1, 1, 1, 1, 1,
1.133323, 0.2159003, 2.681285, 1, 1, 1, 1, 1,
1.13679, -0.6650211, 1.697549, 1, 1, 1, 1, 1,
1.140584, 1.35218, 1.860911, 1, 1, 1, 1, 1,
1.164081, 0.905637, 0.4675379, 1, 1, 1, 1, 1,
1.1734, -0.7236289, 1.628919, 1, 1, 1, 1, 1,
1.179679, 0.3107395, 1.498539, 1, 1, 1, 1, 1,
1.185459, -1.659349, 1.516055, 1, 1, 1, 1, 1,
1.196333, -0.589497, -0.07067692, 1, 1, 1, 1, 1,
1.196422, -0.7639802, 2.006172, 1, 1, 1, 1, 1,
1.196626, 0.5970991, 1.554143, 1, 1, 1, 1, 1,
1.1976, -1.113128, 3.292779, 0, 0, 1, 1, 1,
1.208734, 0.643248, 0.4185057, 1, 0, 0, 1, 1,
1.21417, -0.3619675, 1.540598, 1, 0, 0, 1, 1,
1.223922, 0.5538865, 1.335434, 1, 0, 0, 1, 1,
1.24143, 0.3532909, 2.318174, 1, 0, 0, 1, 1,
1.257991, 0.4688101, 2.046597, 1, 0, 0, 1, 1,
1.267126, -0.5080855, 1.318069, 0, 0, 0, 1, 1,
1.272503, 1.801816, 1.522024, 0, 0, 0, 1, 1,
1.276327, 0.9580339, -0.05808147, 0, 0, 0, 1, 1,
1.276923, -0.2161751, 1.565035, 0, 0, 0, 1, 1,
1.277844, -0.0232545, 1.395373, 0, 0, 0, 1, 1,
1.283368, 1.498347, -0.9932805, 0, 0, 0, 1, 1,
1.285216, 1.485458, -0.4648361, 0, 0, 0, 1, 1,
1.292863, -1.488707, 3.057541, 1, 1, 1, 1, 1,
1.298227, -0.245072, 1.159879, 1, 1, 1, 1, 1,
1.308088, 0.9994179, 2.047672, 1, 1, 1, 1, 1,
1.310372, -0.6092231, 2.152956, 1, 1, 1, 1, 1,
1.311988, 0.139268, 1.851582, 1, 1, 1, 1, 1,
1.319737, 1.795821, -0.2996758, 1, 1, 1, 1, 1,
1.333835, -0.3609022, 5.333261, 1, 1, 1, 1, 1,
1.335067, -0.9017975, 3.39532, 1, 1, 1, 1, 1,
1.338664, -0.2271159, 2.969424, 1, 1, 1, 1, 1,
1.34034, -1.2252, 4.945978, 1, 1, 1, 1, 1,
1.346607, 1.334854, -0.6210573, 1, 1, 1, 1, 1,
1.351674, 0.4872669, 2.360965, 1, 1, 1, 1, 1,
1.355583, -1.731884, 0.6877514, 1, 1, 1, 1, 1,
1.361123, 0.8092083, 2.037268, 1, 1, 1, 1, 1,
1.372611, -0.7745209, 3.303814, 1, 1, 1, 1, 1,
1.373722, -1.33933, 1.118312, 0, 0, 1, 1, 1,
1.38078, -0.2212063, 3.408522, 1, 0, 0, 1, 1,
1.382428, 1.100493, -2.042437, 1, 0, 0, 1, 1,
1.385544, -0.4278924, 3.370368, 1, 0, 0, 1, 1,
1.402667, -1.402689, 3.252263, 1, 0, 0, 1, 1,
1.410273, 0.03118545, 2.470884, 1, 0, 0, 1, 1,
1.428275, -0.5115683, 3.024554, 0, 0, 0, 1, 1,
1.432243, -1.489516, 4.77488, 0, 0, 0, 1, 1,
1.436273, 1.105941, 1.921347, 0, 0, 0, 1, 1,
1.437776, -0.226637, 1.555337, 0, 0, 0, 1, 1,
1.446181, 1.885938, 0.01091119, 0, 0, 0, 1, 1,
1.448905, -0.4235358, 1.212227, 0, 0, 0, 1, 1,
1.449801, -0.110216, 3.15968, 0, 0, 0, 1, 1,
1.460441, 1.435446, 0.7565865, 1, 1, 1, 1, 1,
1.507747, 2.125125, 0.7740027, 1, 1, 1, 1, 1,
1.513966, 0.4787296, 0.7345551, 1, 1, 1, 1, 1,
1.519332, 0.1376746, 1.415809, 1, 1, 1, 1, 1,
1.520605, 0.8012154, 1.558429, 1, 1, 1, 1, 1,
1.526556, 0.5521988, 0.819677, 1, 1, 1, 1, 1,
1.52669, -0.1023262, 3.053011, 1, 1, 1, 1, 1,
1.528792, -0.6028783, 0.2740312, 1, 1, 1, 1, 1,
1.533556, -0.1627161, 2.92242, 1, 1, 1, 1, 1,
1.54022, -0.1227607, -0.1744857, 1, 1, 1, 1, 1,
1.546177, -1.658669, 1.01272, 1, 1, 1, 1, 1,
1.596736, -0.3791194, -0.09795465, 1, 1, 1, 1, 1,
1.604519, 0.9443736, 0.9603717, 1, 1, 1, 1, 1,
1.609682, 1.199685, 1.465088, 1, 1, 1, 1, 1,
1.619276, -0.01269751, 1.49216, 1, 1, 1, 1, 1,
1.631093, 0.462039, -0.2809264, 0, 0, 1, 1, 1,
1.640949, 2.206586, -0.6293727, 1, 0, 0, 1, 1,
1.649855, -0.5204793, 2.956916, 1, 0, 0, 1, 1,
1.661138, 0.6434612, 2.810294, 1, 0, 0, 1, 1,
1.684705, 2.111552, 2.499534, 1, 0, 0, 1, 1,
1.689567, 0.936192, 1.012935, 1, 0, 0, 1, 1,
1.691423, -1.092188, 1.729963, 0, 0, 0, 1, 1,
1.699743, 0.052856, 2.119479, 0, 0, 0, 1, 1,
1.703934, -0.5382344, 1.015682, 0, 0, 0, 1, 1,
1.721092, -0.06080652, 0.6901233, 0, 0, 0, 1, 1,
1.72467, -1.278154, 3.731284, 0, 0, 0, 1, 1,
1.730717, 0.07034588, 2.170252, 0, 0, 0, 1, 1,
1.735151, 1.147623, 0.0914166, 0, 0, 0, 1, 1,
1.741803, -2.185637, 2.77616, 1, 1, 1, 1, 1,
1.756117, 0.07848143, 1.294437, 1, 1, 1, 1, 1,
1.757911, 0.5608591, 3.193774, 1, 1, 1, 1, 1,
1.772932, 1.140751, 0.5485181, 1, 1, 1, 1, 1,
1.801394, -1.240222, 2.923299, 1, 1, 1, 1, 1,
1.805023, -0.9847149, 1.206719, 1, 1, 1, 1, 1,
1.822124, 1.350592, 1.010907, 1, 1, 1, 1, 1,
1.856254, 0.01941699, 0.850921, 1, 1, 1, 1, 1,
1.884319, 1.135868, 1.186584, 1, 1, 1, 1, 1,
1.912451, 0.1481902, 2.075117, 1, 1, 1, 1, 1,
1.915833, -0.6968939, 2.587916, 1, 1, 1, 1, 1,
1.922043, 0.3883889, 2.812414, 1, 1, 1, 1, 1,
1.932567, -0.4838822, 2.710866, 1, 1, 1, 1, 1,
1.934135, 2.840968, 1.514545, 1, 1, 1, 1, 1,
1.93633, 1.319862, 1.753035, 1, 1, 1, 1, 1,
1.954184, -1.603309, 1.943072, 0, 0, 1, 1, 1,
1.955346, -1.102931, 2.610914, 1, 0, 0, 1, 1,
1.972916, -0.7519598, 1.808284, 1, 0, 0, 1, 1,
2.011565, 0.5932587, 1.686852, 1, 0, 0, 1, 1,
2.016363, -0.3329053, 0.1001982, 1, 0, 0, 1, 1,
2.072411, 2.045403, 1.337487, 1, 0, 0, 1, 1,
2.073676, -1.112694, 3.034202, 0, 0, 0, 1, 1,
2.099061, 0.01328876, 1.73811, 0, 0, 0, 1, 1,
2.112873, 1.798185, 1.052111, 0, 0, 0, 1, 1,
2.242158, -1.374452, 1.256505, 0, 0, 0, 1, 1,
2.276492, 0.2591069, 2.471658, 0, 0, 0, 1, 1,
2.359531, -0.9101481, 2.918239, 0, 0, 0, 1, 1,
2.40815, -0.3184304, 1.444508, 0, 0, 0, 1, 1,
2.453205, 0.7155932, 0.3464073, 1, 1, 1, 1, 1,
2.48989, 0.9588598, 2.185736, 1, 1, 1, 1, 1,
2.497022, -1.068085, 2.472803, 1, 1, 1, 1, 1,
2.599466, -1.22729, 0.8426114, 1, 1, 1, 1, 1,
2.602284, 0.5828503, 0.6589857, 1, 1, 1, 1, 1,
2.642653, 0.06287669, 3.034086, 1, 1, 1, 1, 1,
3.00322, -0.9184729, -0.573142, 1, 1, 1, 1, 1
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
var radius = 10.05371;
var distance = 35.31323;
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
mvMatrix.translate( 0.06491184, -0.08544445, 0.7558424 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.31323);
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