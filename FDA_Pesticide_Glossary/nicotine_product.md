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
-3.409368, 1.160765, -1.343293, 1, 0, 0, 1,
-3.125226, 0.2951921, -1.720154, 1, 0.007843138, 0, 1,
-2.857401, 0.07702296, -1.866151, 1, 0.01176471, 0, 1,
-2.827347, -0.02283988, -1.880589, 1, 0.01960784, 0, 1,
-2.762667, -0.4191399, -2.357412, 1, 0.02352941, 0, 1,
-2.644443, -1.707058, -1.92211, 1, 0.03137255, 0, 1,
-2.604141, -0.3407649, -1.58675, 1, 0.03529412, 0, 1,
-2.530427, -0.08815106, -2.123474, 1, 0.04313726, 0, 1,
-2.443052, 0.5009286, -1.689704, 1, 0.04705882, 0, 1,
-2.389958, 0.794791, -2.792872, 1, 0.05490196, 0, 1,
-2.375767, -0.1501017, -1.989284, 1, 0.05882353, 0, 1,
-2.333578, -0.6253772, -0.9278507, 1, 0.06666667, 0, 1,
-2.309447, 2.070525, -0.9883427, 1, 0.07058824, 0, 1,
-2.30478, 0.7814779, -1.567417, 1, 0.07843138, 0, 1,
-2.280345, 1.32247, -1.882662, 1, 0.08235294, 0, 1,
-2.254306, 0.5884628, -4.363085, 1, 0.09019608, 0, 1,
-2.229255, 0.9102623, -1.952421, 1, 0.09411765, 0, 1,
-2.207042, -0.3809788, -2.024349, 1, 0.1019608, 0, 1,
-2.196151, 0.2063154, -1.617384, 1, 0.1098039, 0, 1,
-2.190007, 0.34391, 0.4389146, 1, 0.1137255, 0, 1,
-2.18113, 0.3457455, -0.5677048, 1, 0.1215686, 0, 1,
-2.161789, -0.6592574, -3.168849, 1, 0.1254902, 0, 1,
-2.157133, -1.241943, -2.983403, 1, 0.1333333, 0, 1,
-2.087704, -1.363099, -2.226888, 1, 0.1372549, 0, 1,
-2.076994, -0.6104233, -2.131078, 1, 0.145098, 0, 1,
-2.069778, -0.4821169, -0.09085469, 1, 0.1490196, 0, 1,
-2.066296, 0.4133587, -1.04856, 1, 0.1568628, 0, 1,
-2.05659, 1.597287, 0.05844997, 1, 0.1607843, 0, 1,
-2.035927, 0.5188626, -2.795382, 1, 0.1686275, 0, 1,
-2.018869, -0.1257753, -1.9109, 1, 0.172549, 0, 1,
-1.996156, 0.4171956, -0.1658363, 1, 0.1803922, 0, 1,
-1.983941, -1.569831, -2.839044, 1, 0.1843137, 0, 1,
-1.961867, 1.613912, -0.8314942, 1, 0.1921569, 0, 1,
-1.920459, -0.186353, -1.961345, 1, 0.1960784, 0, 1,
-1.899705, 1.185376, -0.8258172, 1, 0.2039216, 0, 1,
-1.884497, 0.3469078, -0.8805276, 1, 0.2117647, 0, 1,
-1.873167, -0.218389, -3.870335, 1, 0.2156863, 0, 1,
-1.86335, -0.1058023, -0.8536291, 1, 0.2235294, 0, 1,
-1.848483, 1.267525, -2.838732, 1, 0.227451, 0, 1,
-1.836372, 0.9747636, -2.758741, 1, 0.2352941, 0, 1,
-1.817148, 0.7692304, -1.359511, 1, 0.2392157, 0, 1,
-1.80575, -0.1180557, -2.411736, 1, 0.2470588, 0, 1,
-1.781417, -1.467826, -1.050741, 1, 0.2509804, 0, 1,
-1.767021, 0.3509994, -1.478442, 1, 0.2588235, 0, 1,
-1.745322, 0.9593502, -1.084389, 1, 0.2627451, 0, 1,
-1.741687, -0.999298, -4.023739, 1, 0.2705882, 0, 1,
-1.732647, 1.723088, -1.379782, 1, 0.2745098, 0, 1,
-1.708648, -0.6030457, -2.031009, 1, 0.282353, 0, 1,
-1.691779, 0.6524397, -0.542739, 1, 0.2862745, 0, 1,
-1.684966, -0.1427397, -2.325769, 1, 0.2941177, 0, 1,
-1.671338, 0.9859738, -1.498679, 1, 0.3019608, 0, 1,
-1.65173, 0.01695843, -1.929365, 1, 0.3058824, 0, 1,
-1.647717, -0.5684713, -1.96083, 1, 0.3137255, 0, 1,
-1.638524, 0.2723206, -1.744218, 1, 0.3176471, 0, 1,
-1.636303, -1.300891, -3.785014, 1, 0.3254902, 0, 1,
-1.635155, 2.040003, -0.7441856, 1, 0.3294118, 0, 1,
-1.631054, 0.4012115, -1.30079, 1, 0.3372549, 0, 1,
-1.628273, -0.7724832, -2.125395, 1, 0.3411765, 0, 1,
-1.614416, 0.3222036, 0.1249693, 1, 0.3490196, 0, 1,
-1.604956, -0.8577294, 0.1050462, 1, 0.3529412, 0, 1,
-1.599011, -0.7634259, -1.818164, 1, 0.3607843, 0, 1,
-1.597824, -0.3543857, -1.811047, 1, 0.3647059, 0, 1,
-1.595065, -1.050591, -1.609627, 1, 0.372549, 0, 1,
-1.580617, -0.7982816, -2.763663, 1, 0.3764706, 0, 1,
-1.563043, 0.7486629, -2.155077, 1, 0.3843137, 0, 1,
-1.561962, -0.01518868, -3.649316, 1, 0.3882353, 0, 1,
-1.556082, 0.28292, 1.009978, 1, 0.3960784, 0, 1,
-1.554664, 1.565358, -1.789941, 1, 0.4039216, 0, 1,
-1.526065, 2.059187, 1.010897, 1, 0.4078431, 0, 1,
-1.517893, 0.8084034, -0.4665595, 1, 0.4156863, 0, 1,
-1.517455, -0.6702829, -3.293953, 1, 0.4196078, 0, 1,
-1.515211, 0.7071326, 0.6157934, 1, 0.427451, 0, 1,
-1.51226, -0.5891593, -1.223288, 1, 0.4313726, 0, 1,
-1.494384, -0.2506964, -1.978978, 1, 0.4392157, 0, 1,
-1.492106, 0.7715941, -1.724123, 1, 0.4431373, 0, 1,
-1.49199, -1.30035, -1.577237, 1, 0.4509804, 0, 1,
-1.487253, 0.7792593, -0.6391695, 1, 0.454902, 0, 1,
-1.486045, 0.08469866, -0.5208454, 1, 0.4627451, 0, 1,
-1.481666, 0.2763918, -1.031025, 1, 0.4666667, 0, 1,
-1.471403, -0.5309822, -3.612139, 1, 0.4745098, 0, 1,
-1.464853, 0.3857735, -0.8532714, 1, 0.4784314, 0, 1,
-1.460138, -0.3838045, -1.407802, 1, 0.4862745, 0, 1,
-1.457383, -0.0200648, -0.3892062, 1, 0.4901961, 0, 1,
-1.454995, 0.2603313, -1.956723, 1, 0.4980392, 0, 1,
-1.449133, 0.5511556, -0.540328, 1, 0.5058824, 0, 1,
-1.448522, 0.6659877, -0.3211856, 1, 0.509804, 0, 1,
-1.418615, 0.2260994, -1.837462, 1, 0.5176471, 0, 1,
-1.41383, -1.362366, -0.2215272, 1, 0.5215687, 0, 1,
-1.410546, 1.117278, -2.35567, 1, 0.5294118, 0, 1,
-1.407959, 0.01206834, -1.275994, 1, 0.5333334, 0, 1,
-1.40759, 0.7620074, 0.2371498, 1, 0.5411765, 0, 1,
-1.406102, -1.039108, -2.285659, 1, 0.5450981, 0, 1,
-1.40607, 0.5741016, -0.3313895, 1, 0.5529412, 0, 1,
-1.405102, -0.7832321, -3.276664, 1, 0.5568628, 0, 1,
-1.400877, -0.9028845, -3.235574, 1, 0.5647059, 0, 1,
-1.400409, 0.1493768, -1.208381, 1, 0.5686275, 0, 1,
-1.395659, 0.1332789, -2.714183, 1, 0.5764706, 0, 1,
-1.389761, -1.457449, -2.12065, 1, 0.5803922, 0, 1,
-1.387205, 0.1786638, -3.222997, 1, 0.5882353, 0, 1,
-1.365819, -0.772572, -1.737187, 1, 0.5921569, 0, 1,
-1.353445, -0.8797768, -1.725547, 1, 0.6, 0, 1,
-1.347275, 0.1175056, -2.737973, 1, 0.6078432, 0, 1,
-1.301319, -0.5215198, -2.070662, 1, 0.6117647, 0, 1,
-1.298324, 1.612664, -1.701184, 1, 0.6196079, 0, 1,
-1.29258, -0.4233431, -3.345693, 1, 0.6235294, 0, 1,
-1.28628, -0.08909644, -2.990642, 1, 0.6313726, 0, 1,
-1.285657, 0.2012563, -0.1551351, 1, 0.6352941, 0, 1,
-1.278517, 0.3003986, -1.499079, 1, 0.6431373, 0, 1,
-1.275829, -0.2612734, -2.414203, 1, 0.6470588, 0, 1,
-1.26891, 2.122569, 0.04970857, 1, 0.654902, 0, 1,
-1.267196, 1.238132, 0.857382, 1, 0.6588235, 0, 1,
-1.266774, 1.051297, -0.5612937, 1, 0.6666667, 0, 1,
-1.265257, -1.087152, -0.8705679, 1, 0.6705883, 0, 1,
-1.264182, -1.312058, -1.612995, 1, 0.6784314, 0, 1,
-1.258844, -0.1073188, -1.380683, 1, 0.682353, 0, 1,
-1.257198, -0.3508992, -2.674428, 1, 0.6901961, 0, 1,
-1.246643, 0.3413405, -1.077137, 1, 0.6941177, 0, 1,
-1.231462, 0.2362796, -1.494654, 1, 0.7019608, 0, 1,
-1.217229, -1.617594, -2.917481, 1, 0.7098039, 0, 1,
-1.211109, 0.7085522, -3.190114, 1, 0.7137255, 0, 1,
-1.210386, -1.118652, -2.083715, 1, 0.7215686, 0, 1,
-1.20373, -0.7197191, -2.283742, 1, 0.7254902, 0, 1,
-1.200546, 1.078506, -0.2258939, 1, 0.7333333, 0, 1,
-1.192941, 0.5301709, -0.9239302, 1, 0.7372549, 0, 1,
-1.185346, 0.02202011, -1.368864, 1, 0.7450981, 0, 1,
-1.184951, 0.150095, -3.714686, 1, 0.7490196, 0, 1,
-1.182592, -1.023568, -1.984854, 1, 0.7568628, 0, 1,
-1.17864, -1.230354, -0.9417166, 1, 0.7607843, 0, 1,
-1.162462, 1.438228, -0.1711326, 1, 0.7686275, 0, 1,
-1.154595, -2.205458, -2.990495, 1, 0.772549, 0, 1,
-1.151537, -0.06959791, -2.668272, 1, 0.7803922, 0, 1,
-1.149826, -1.694986, -2.601988, 1, 0.7843137, 0, 1,
-1.144151, -0.2670914, -1.380922, 1, 0.7921569, 0, 1,
-1.142781, 0.3186176, -1.735724, 1, 0.7960784, 0, 1,
-1.14051, -0.2455056, -0.01069419, 1, 0.8039216, 0, 1,
-1.139376, -0.4937514, -2.127439, 1, 0.8117647, 0, 1,
-1.138945, -0.7091537, -3.042427, 1, 0.8156863, 0, 1,
-1.134662, 0.1174887, -3.52123, 1, 0.8235294, 0, 1,
-1.128868, 0.04017146, -2.8579, 1, 0.827451, 0, 1,
-1.122602, -1.8483, -3.02774, 1, 0.8352941, 0, 1,
-1.12113, -0.8971986, -2.369947, 1, 0.8392157, 0, 1,
-1.111922, -0.6469562, -1.526166, 1, 0.8470588, 0, 1,
-1.107324, 0.1867595, -1.702528, 1, 0.8509804, 0, 1,
-1.105264, 0.2778255, -2.336824, 1, 0.8588235, 0, 1,
-1.10459, -0.532957, -1.940606, 1, 0.8627451, 0, 1,
-1.104278, 1.169054, -1.600441, 1, 0.8705882, 0, 1,
-1.103349, 0.03824228, -2.555937, 1, 0.8745098, 0, 1,
-1.093229, 0.3841087, -1.973841, 1, 0.8823529, 0, 1,
-1.085129, 0.4125045, -0.3153517, 1, 0.8862745, 0, 1,
-1.076872, 0.04331504, -1.732783, 1, 0.8941177, 0, 1,
-1.075875, -1.391984, -2.366176, 1, 0.8980392, 0, 1,
-1.064763, -2.25411, -3.034977, 1, 0.9058824, 0, 1,
-1.051111, 0.1883932, -1.057917, 1, 0.9137255, 0, 1,
-1.034841, -0.6402918, -1.111107, 1, 0.9176471, 0, 1,
-1.033029, -0.3224856, -2.922182, 1, 0.9254902, 0, 1,
-1.027659, -1.633229, -4.847676, 1, 0.9294118, 0, 1,
-1.027104, 0.9608228, -0.5441306, 1, 0.9372549, 0, 1,
-1.024663, -1.726536, -2.797514, 1, 0.9411765, 0, 1,
-1.022113, 1.016858, -0.2247032, 1, 0.9490196, 0, 1,
-1.015447, -1.842551, -1.451768, 1, 0.9529412, 0, 1,
-1.011213, 1.076503, 0.3703779, 1, 0.9607843, 0, 1,
-1.00511, 0.01257119, -1.41144, 1, 0.9647059, 0, 1,
-1.001571, 0.5947556, -1.961517, 1, 0.972549, 0, 1,
-0.9970773, -0.3973266, -2.711991, 1, 0.9764706, 0, 1,
-0.9886974, -1.190892, -2.458364, 1, 0.9843137, 0, 1,
-0.9886501, -0.7023549, -1.050903, 1, 0.9882353, 0, 1,
-0.9852151, 1.84395, 0.1727772, 1, 0.9960784, 0, 1,
-0.9796094, -2.015728, -2.224236, 0.9960784, 1, 0, 1,
-0.9641037, 1.232729, -1.78581, 0.9921569, 1, 0, 1,
-0.9614356, 1.102228, -0.4144941, 0.9843137, 1, 0, 1,
-0.9574912, 1.737691, -0.782281, 0.9803922, 1, 0, 1,
-0.9561693, 0.4832767, 0.4376045, 0.972549, 1, 0, 1,
-0.955765, 0.07012622, -2.236248, 0.9686275, 1, 0, 1,
-0.9516113, -0.6293502, -2.910204, 0.9607843, 1, 0, 1,
-0.9482048, 2.009088, 0.1051433, 0.9568627, 1, 0, 1,
-0.9395881, -0.1631563, -2.263798, 0.9490196, 1, 0, 1,
-0.9371091, -1.023409, -2.756741, 0.945098, 1, 0, 1,
-0.935789, -1.146308, -3.356455, 0.9372549, 1, 0, 1,
-0.9344868, 0.5590267, -2.631296, 0.9333333, 1, 0, 1,
-0.9301741, -0.4040634, -1.667222, 0.9254902, 1, 0, 1,
-0.9261755, 0.6302276, -0.9486647, 0.9215686, 1, 0, 1,
-0.9227791, 1.153791, -1.471369, 0.9137255, 1, 0, 1,
-0.9202852, -2.411144, -2.19649, 0.9098039, 1, 0, 1,
-0.9188818, -1.008688, -3.305145, 0.9019608, 1, 0, 1,
-0.9173238, 0.9170725, -1.081034, 0.8941177, 1, 0, 1,
-0.9125727, 0.3249779, -1.763923, 0.8901961, 1, 0, 1,
-0.9125161, -1.250433, -2.992377, 0.8823529, 1, 0, 1,
-0.910686, 1.350045, -0.7318184, 0.8784314, 1, 0, 1,
-0.9105459, -1.036602, -3.069201, 0.8705882, 1, 0, 1,
-0.9086227, -2.369366, -2.105778, 0.8666667, 1, 0, 1,
-0.9054596, 0.1577634, -1.48237, 0.8588235, 1, 0, 1,
-0.9027508, 0.2106975, -0.5456038, 0.854902, 1, 0, 1,
-0.9016436, -0.7439085, -2.73832, 0.8470588, 1, 0, 1,
-0.8966349, 0.609035, -0.8823588, 0.8431373, 1, 0, 1,
-0.8960678, -0.42268, -3.696819, 0.8352941, 1, 0, 1,
-0.8957812, 1.541693, -0.2226965, 0.8313726, 1, 0, 1,
-0.8946563, 1.380219, -1.02466, 0.8235294, 1, 0, 1,
-0.8933458, -0.4785993, -0.9682767, 0.8196079, 1, 0, 1,
-0.8893942, 0.7101578, -1.025187, 0.8117647, 1, 0, 1,
-0.8797545, 0.7052814, -2.206463, 0.8078431, 1, 0, 1,
-0.8774069, -0.04439218, -0.6490321, 0.8, 1, 0, 1,
-0.8742199, -0.1245886, -0.8238068, 0.7921569, 1, 0, 1,
-0.8722091, -0.9576176, -3.374573, 0.7882353, 1, 0, 1,
-0.8624117, -1.37652, -2.084636, 0.7803922, 1, 0, 1,
-0.8535705, -1.313497, -2.664732, 0.7764706, 1, 0, 1,
-0.8518313, 0.9653792, -0.7269267, 0.7686275, 1, 0, 1,
-0.8514424, -1.095057, -2.499852, 0.7647059, 1, 0, 1,
-0.8480408, 0.5773035, 0.3463836, 0.7568628, 1, 0, 1,
-0.8263005, 0.5294896, 0.1662658, 0.7529412, 1, 0, 1,
-0.8190723, 1.214886, -1.504449, 0.7450981, 1, 0, 1,
-0.8154812, 0.5039344, -2.071052, 0.7411765, 1, 0, 1,
-0.8147786, -0.07944573, -0.2534986, 0.7333333, 1, 0, 1,
-0.8138868, -0.1678212, -1.998319, 0.7294118, 1, 0, 1,
-0.8135213, 0.9028741, -1.348597, 0.7215686, 1, 0, 1,
-0.8129487, -1.324655, -2.717833, 0.7176471, 1, 0, 1,
-0.8122852, -1.02276, -3.512574, 0.7098039, 1, 0, 1,
-0.8091461, -0.09102688, -0.3924693, 0.7058824, 1, 0, 1,
-0.8083882, 0.258942, -1.008494, 0.6980392, 1, 0, 1,
-0.8055053, 1.789509, -0.2982265, 0.6901961, 1, 0, 1,
-0.8054658, 1.331822, -1.469954, 0.6862745, 1, 0, 1,
-0.8024691, 0.1089341, -0.7155435, 0.6784314, 1, 0, 1,
-0.7998422, 0.6429518, 0.7801341, 0.6745098, 1, 0, 1,
-0.7934287, -1.95219, -1.3042, 0.6666667, 1, 0, 1,
-0.7932995, -0.2226679, -1.748492, 0.6627451, 1, 0, 1,
-0.7931722, -1.074331, -3.160632, 0.654902, 1, 0, 1,
-0.7916266, 0.2004841, -1.122944, 0.6509804, 1, 0, 1,
-0.7879565, -0.04203047, -3.909256, 0.6431373, 1, 0, 1,
-0.7842563, 0.94553, 0.3460145, 0.6392157, 1, 0, 1,
-0.7807209, -0.8910257, -1.564853, 0.6313726, 1, 0, 1,
-0.780593, -1.370917, -2.303617, 0.627451, 1, 0, 1,
-0.7747742, 0.6324861, -0.04663417, 0.6196079, 1, 0, 1,
-0.7741004, -0.06560963, -3.336866, 0.6156863, 1, 0, 1,
-0.7739003, 0.3565092, -2.323755, 0.6078432, 1, 0, 1,
-0.7731225, -0.4434536, -1.15648, 0.6039216, 1, 0, 1,
-0.7721087, 2.420809, -0.5609524, 0.5960785, 1, 0, 1,
-0.7709249, 0.5777007, -0.7299498, 0.5882353, 1, 0, 1,
-0.7690707, 1.044683, 0.114555, 0.5843138, 1, 0, 1,
-0.7644374, -1.484835, -2.988882, 0.5764706, 1, 0, 1,
-0.7641457, -0.09501468, -0.6361243, 0.572549, 1, 0, 1,
-0.7615035, 1.140272, -2.242431, 0.5647059, 1, 0, 1,
-0.7587669, -0.8274948, -2.921916, 0.5607843, 1, 0, 1,
-0.7555604, 1.281474, -1.507804, 0.5529412, 1, 0, 1,
-0.754374, -1.618205, -3.606539, 0.5490196, 1, 0, 1,
-0.7366223, 0.7597154, 0.174347, 0.5411765, 1, 0, 1,
-0.7362115, 0.1503341, -3.644859, 0.5372549, 1, 0, 1,
-0.7348016, -1.352366, -2.345867, 0.5294118, 1, 0, 1,
-0.7299765, -0.6984217, -3.942234, 0.5254902, 1, 0, 1,
-0.7283143, 0.9758978, -0.6803012, 0.5176471, 1, 0, 1,
-0.7188534, -0.4867227, -2.081361, 0.5137255, 1, 0, 1,
-0.7153404, 1.294473, -1.851351, 0.5058824, 1, 0, 1,
-0.7114052, 0.8235658, -1.589372, 0.5019608, 1, 0, 1,
-0.7096638, -0.0888521, 0.5124879, 0.4941176, 1, 0, 1,
-0.6972065, 1.018314, -2.031342, 0.4862745, 1, 0, 1,
-0.6966521, 0.2991602, -2.962806, 0.4823529, 1, 0, 1,
-0.6960248, -0.1383232, -1.803535, 0.4745098, 1, 0, 1,
-0.6951508, -0.6953169, -3.468815, 0.4705882, 1, 0, 1,
-0.6927737, -2.370373, -2.982158, 0.4627451, 1, 0, 1,
-0.6926869, -1.434266, -3.099196, 0.4588235, 1, 0, 1,
-0.6808104, 0.7740767, 0.5913659, 0.4509804, 1, 0, 1,
-0.6747474, -2.107998, -2.142382, 0.4470588, 1, 0, 1,
-0.6710037, -1.554407, -4.693002, 0.4392157, 1, 0, 1,
-0.6689301, -0.1223906, -3.602685, 0.4352941, 1, 0, 1,
-0.6680871, -0.5554551, -3.068226, 0.427451, 1, 0, 1,
-0.6565976, -0.2538868, -2.402127, 0.4235294, 1, 0, 1,
-0.6540235, 0.3980824, -1.568758, 0.4156863, 1, 0, 1,
-0.6522268, 1.359419, -1.57956, 0.4117647, 1, 0, 1,
-0.6517871, 1.672812, -0.05446097, 0.4039216, 1, 0, 1,
-0.6466261, -0.5452839, -2.641829, 0.3960784, 1, 0, 1,
-0.6454318, 1.253045, -0.3663295, 0.3921569, 1, 0, 1,
-0.6391662, 0.1297858, 0.06644832, 0.3843137, 1, 0, 1,
-0.6391414, 0.3970474, -1.426185, 0.3803922, 1, 0, 1,
-0.6376392, -0.4706462, -1.46765, 0.372549, 1, 0, 1,
-0.6263655, 0.8763011, -1.563695, 0.3686275, 1, 0, 1,
-0.6235404, 1.945005, -0.5780975, 0.3607843, 1, 0, 1,
-0.6223127, -0.6508865, -2.790194, 0.3568628, 1, 0, 1,
-0.6090443, -0.2302346, -3.090638, 0.3490196, 1, 0, 1,
-0.6068153, -0.4779984, -2.793822, 0.345098, 1, 0, 1,
-0.6021512, -0.6454353, -1.91906, 0.3372549, 1, 0, 1,
-0.6012686, 1.457278, -1.160227, 0.3333333, 1, 0, 1,
-0.596476, 0.6038874, -1.279476, 0.3254902, 1, 0, 1,
-0.5942173, 0.8679164, -0.5200107, 0.3215686, 1, 0, 1,
-0.5933649, -0.7387769, -2.73478, 0.3137255, 1, 0, 1,
-0.5883353, -0.81054, -2.386352, 0.3098039, 1, 0, 1,
-0.5831558, -0.8926214, -2.863736, 0.3019608, 1, 0, 1,
-0.5781215, 0.3674911, -1.423373, 0.2941177, 1, 0, 1,
-0.5712879, -0.3637578, -1.807806, 0.2901961, 1, 0, 1,
-0.5704654, 1.014934, -0.05456102, 0.282353, 1, 0, 1,
-0.568886, 0.2218985, -1.318716, 0.2784314, 1, 0, 1,
-0.5676462, -0.9854244, -3.895891, 0.2705882, 1, 0, 1,
-0.5621859, 1.105724, 0.854852, 0.2666667, 1, 0, 1,
-0.5584123, 2.077507, -0.2451164, 0.2588235, 1, 0, 1,
-0.5577562, -0.1429535, -0.1820457, 0.254902, 1, 0, 1,
-0.5559876, -0.6263116, -1.253293, 0.2470588, 1, 0, 1,
-0.5536786, -0.6717921, -1.602424, 0.2431373, 1, 0, 1,
-0.5459348, 0.2303824, -1.650147, 0.2352941, 1, 0, 1,
-0.5450453, 1.703339, -0.2168297, 0.2313726, 1, 0, 1,
-0.5440415, 1.987163, -0.4138089, 0.2235294, 1, 0, 1,
-0.5424135, -0.7775349, -3.694868, 0.2196078, 1, 0, 1,
-0.5385237, -1.087874, -3.434645, 0.2117647, 1, 0, 1,
-0.5334389, 0.6859508, 0.2554728, 0.2078431, 1, 0, 1,
-0.5293213, -0.7906741, -3.17588, 0.2, 1, 0, 1,
-0.5279726, -1.333754, -2.917892, 0.1921569, 1, 0, 1,
-0.5252768, -0.321477, -1.758801, 0.1882353, 1, 0, 1,
-0.5217853, 0.5372542, -1.403803, 0.1803922, 1, 0, 1,
-0.5210037, -1.095367, -2.536686, 0.1764706, 1, 0, 1,
-0.5191587, -0.1389754, -2.196017, 0.1686275, 1, 0, 1,
-0.5186471, 1.08811, 0.1565702, 0.1647059, 1, 0, 1,
-0.5148657, -0.4444769, -2.494386, 0.1568628, 1, 0, 1,
-0.5116984, 1.180622, 1.405918, 0.1529412, 1, 0, 1,
-0.5113288, 0.1395658, -1.698857, 0.145098, 1, 0, 1,
-0.5107123, -1.430034, -2.189554, 0.1411765, 1, 0, 1,
-0.5088416, 1.366125, -0.2177624, 0.1333333, 1, 0, 1,
-0.5084378, 0.2667676, -0.06293696, 0.1294118, 1, 0, 1,
-0.5039241, -0.6533086, -2.574874, 0.1215686, 1, 0, 1,
-0.5037188, 1.326081, -0.6262072, 0.1176471, 1, 0, 1,
-0.5033237, -0.6136159, -1.530118, 0.1098039, 1, 0, 1,
-0.4985059, -0.9242349, -3.042282, 0.1058824, 1, 0, 1,
-0.4928735, 0.4336254, -1.187074, 0.09803922, 1, 0, 1,
-0.4868672, -0.8961459, -1.349439, 0.09019608, 1, 0, 1,
-0.486562, 0.295122, -0.801965, 0.08627451, 1, 0, 1,
-0.4819264, 1.648899, -1.020642, 0.07843138, 1, 0, 1,
-0.4772136, -0.3953278, -1.906856, 0.07450981, 1, 0, 1,
-0.4767714, 0.2256307, -3.355923, 0.06666667, 1, 0, 1,
-0.4738764, 0.2795461, -2.317986, 0.0627451, 1, 0, 1,
-0.473603, -0.8720422, -2.002348, 0.05490196, 1, 0, 1,
-0.4732177, 0.3335146, -1.281459, 0.05098039, 1, 0, 1,
-0.4698348, 0.1701997, -0.8351325, 0.04313726, 1, 0, 1,
-0.4629416, 1.455456, 0.02185166, 0.03921569, 1, 0, 1,
-0.4618754, 0.3177132, 0.8445071, 0.03137255, 1, 0, 1,
-0.4599536, 0.5888251, -0.9744157, 0.02745098, 1, 0, 1,
-0.4590905, -2.07094, -4.151414, 0.01960784, 1, 0, 1,
-0.4555893, 0.6526592, -0.05423192, 0.01568628, 1, 0, 1,
-0.4541579, -0.6004153, -2.992747, 0.007843138, 1, 0, 1,
-0.4529397, -0.8067572, -1.8374, 0.003921569, 1, 0, 1,
-0.4514559, 0.4282441, -1.485263, 0, 1, 0.003921569, 1,
-0.4474146, 0.08615933, -1.910892, 0, 1, 0.01176471, 1,
-0.4439167, 1.232787, -1.169523, 0, 1, 0.01568628, 1,
-0.4436465, -1.444333, -2.409122, 0, 1, 0.02352941, 1,
-0.4420014, -0.6642522, -2.854028, 0, 1, 0.02745098, 1,
-0.4388279, 0.849114, -0.2539355, 0, 1, 0.03529412, 1,
-0.4379116, -1.124551, -1.420106, 0, 1, 0.03921569, 1,
-0.4360003, -1.255509, -3.496311, 0, 1, 0.04705882, 1,
-0.431361, 0.08806162, -1.740737, 0, 1, 0.05098039, 1,
-0.4306307, 0.8524731, -0.8221391, 0, 1, 0.05882353, 1,
-0.427388, 1.047542, -0.8469457, 0, 1, 0.0627451, 1,
-0.4250852, -0.5117749, -2.673168, 0, 1, 0.07058824, 1,
-0.4247767, -2.133185, -4.569182, 0, 1, 0.07450981, 1,
-0.4242188, -0.3737998, -3.054535, 0, 1, 0.08235294, 1,
-0.4212312, -0.3801193, -1.209295, 0, 1, 0.08627451, 1,
-0.4194133, 0.09679432, -0.429134, 0, 1, 0.09411765, 1,
-0.4086732, 1.448315, -0.7738273, 0, 1, 0.1019608, 1,
-0.4086414, 0.5252994, -0.4243853, 0, 1, 0.1058824, 1,
-0.4065276, -1.354269, -2.721368, 0, 1, 0.1137255, 1,
-0.403116, -0.05859624, -0.489138, 0, 1, 0.1176471, 1,
-0.4020646, -0.5482997, -3.720581, 0, 1, 0.1254902, 1,
-0.4018845, 0.3856002, -1.655184, 0, 1, 0.1294118, 1,
-0.3951634, -0.6152086, -2.556584, 0, 1, 0.1372549, 1,
-0.3926538, -0.6219323, -0.6020039, 0, 1, 0.1411765, 1,
-0.3896552, -0.7666941, -3.121055, 0, 1, 0.1490196, 1,
-0.3834979, -2.264081, -3.361607, 0, 1, 0.1529412, 1,
-0.3819217, 0.6925336, -1.015009, 0, 1, 0.1607843, 1,
-0.3794377, 1.9592, 0.473959, 0, 1, 0.1647059, 1,
-0.3760143, 0.1115985, -0.5170044, 0, 1, 0.172549, 1,
-0.3756099, 0.1396679, -3.319307, 0, 1, 0.1764706, 1,
-0.3748024, 1.358737, -0.3115501, 0, 1, 0.1843137, 1,
-0.3708226, -0.9559938, -1.588594, 0, 1, 0.1882353, 1,
-0.3684077, -1.320581, -2.784626, 0, 1, 0.1960784, 1,
-0.3633496, 0.6145486, 0.04605252, 0, 1, 0.2039216, 1,
-0.359572, -0.9137742, -3.088912, 0, 1, 0.2078431, 1,
-0.3593857, 0.803126, -0.07369132, 0, 1, 0.2156863, 1,
-0.3587601, -0.07823032, -2.801008, 0, 1, 0.2196078, 1,
-0.357258, 0.6326004, 0.7386437, 0, 1, 0.227451, 1,
-0.3550946, -0.9460518, -2.316165, 0, 1, 0.2313726, 1,
-0.35507, -0.3385264, -2.189364, 0, 1, 0.2392157, 1,
-0.354693, -0.7315475, -2.351022, 0, 1, 0.2431373, 1,
-0.3539754, 0.3198204, -0.8887303, 0, 1, 0.2509804, 1,
-0.3516264, 1.32739, 1.816274, 0, 1, 0.254902, 1,
-0.349712, 1.436477, -0.540271, 0, 1, 0.2627451, 1,
-0.349266, -0.1899018, -3.490831, 0, 1, 0.2666667, 1,
-0.3484213, 0.7418915, -0.5597203, 0, 1, 0.2745098, 1,
-0.3473705, -0.2511192, -3.114357, 0, 1, 0.2784314, 1,
-0.3462316, 0.7138765, -2.130967, 0, 1, 0.2862745, 1,
-0.3437084, -1.481241, -4.828358, 0, 1, 0.2901961, 1,
-0.343483, 2.329362, -0.02953956, 0, 1, 0.2980392, 1,
-0.3417664, -0.704756, -3.553465, 0, 1, 0.3058824, 1,
-0.3407451, -0.04862292, -1.240258, 0, 1, 0.3098039, 1,
-0.3390655, 0.5392061, -1.173017, 0, 1, 0.3176471, 1,
-0.3324944, -0.6773088, -3.567794, 0, 1, 0.3215686, 1,
-0.3303654, -0.180452, -2.200756, 0, 1, 0.3294118, 1,
-0.3303247, -0.07863131, -1.671458, 0, 1, 0.3333333, 1,
-0.3272857, 0.05351555, -2.751667, 0, 1, 0.3411765, 1,
-0.3270926, 1.11507, -0.5136686, 0, 1, 0.345098, 1,
-0.3266294, -1.615078, -2.584069, 0, 1, 0.3529412, 1,
-0.3249545, 0.1713607, -0.5233223, 0, 1, 0.3568628, 1,
-0.3236558, -0.9440651, -2.273141, 0, 1, 0.3647059, 1,
-0.3211833, 0.5080776, -0.7631717, 0, 1, 0.3686275, 1,
-0.3205561, 0.2170866, -0.3446665, 0, 1, 0.3764706, 1,
-0.3198937, 2.006404, 0.5373452, 0, 1, 0.3803922, 1,
-0.3188548, -0.263202, -1.195578, 0, 1, 0.3882353, 1,
-0.3179041, -1.262574, -3.250319, 0, 1, 0.3921569, 1,
-0.313173, 1.585085, -0.02442296, 0, 1, 0.4, 1,
-0.3128685, -1.079373, -4.321172, 0, 1, 0.4078431, 1,
-0.3101588, -1.553384, -1.099216, 0, 1, 0.4117647, 1,
-0.3096231, -0.7530993, -2.111013, 0, 1, 0.4196078, 1,
-0.3075675, -1.340037, -1.723177, 0, 1, 0.4235294, 1,
-0.3071465, -0.301536, -2.449518, 0, 1, 0.4313726, 1,
-0.2999602, 1.488756, 2.412355, 0, 1, 0.4352941, 1,
-0.2976864, 0.4603573, 1.946195, 0, 1, 0.4431373, 1,
-0.2955356, 0.672735, -1.006344, 0, 1, 0.4470588, 1,
-0.2948957, 2.070993, 0.09148245, 0, 1, 0.454902, 1,
-0.2947756, 0.1472366, -2.21472, 0, 1, 0.4588235, 1,
-0.2926175, 0.3619073, -2.35094, 0, 1, 0.4666667, 1,
-0.2921601, -1.348302, -0.4561194, 0, 1, 0.4705882, 1,
-0.2918635, -0.2151607, -0.3840541, 0, 1, 0.4784314, 1,
-0.2911072, -1.103322, -3.861201, 0, 1, 0.4823529, 1,
-0.2881803, -0.757184, -3.327646, 0, 1, 0.4901961, 1,
-0.2835446, 0.6739529, -0.3333663, 0, 1, 0.4941176, 1,
-0.2826545, -0.6259573, -1.270024, 0, 1, 0.5019608, 1,
-0.2821378, 0.2822765, -1.573211, 0, 1, 0.509804, 1,
-0.2808299, 0.960874, -0.7201357, 0, 1, 0.5137255, 1,
-0.2768438, 1.247384, -1.062433, 0, 1, 0.5215687, 1,
-0.2649783, -2.001218, -4.095757, 0, 1, 0.5254902, 1,
-0.2561052, -0.8058879, -3.812366, 0, 1, 0.5333334, 1,
-0.254327, 1.25114, 0.9230351, 0, 1, 0.5372549, 1,
-0.2532034, 0.6076313, 0.3780035, 0, 1, 0.5450981, 1,
-0.2503157, 0.6938705, -0.3833915, 0, 1, 0.5490196, 1,
-0.2493078, 1.69637, -1.892573, 0, 1, 0.5568628, 1,
-0.2280809, -0.9954326, -2.894796, 0, 1, 0.5607843, 1,
-0.2258837, 1.377607, 0.8452588, 0, 1, 0.5686275, 1,
-0.2234145, 1.788294, -1.480624, 0, 1, 0.572549, 1,
-0.2161192, -0.5239512, -2.137152, 0, 1, 0.5803922, 1,
-0.215044, -2.283782, -1.976614, 0, 1, 0.5843138, 1,
-0.208282, -0.4855323, -3.239347, 0, 1, 0.5921569, 1,
-0.2077883, -0.2494832, -3.05384, 0, 1, 0.5960785, 1,
-0.2019807, 0.962512, 2.32579, 0, 1, 0.6039216, 1,
-0.2003308, -1.199788, -5.137142, 0, 1, 0.6117647, 1,
-0.1980722, -1.28407, -2.959871, 0, 1, 0.6156863, 1,
-0.1973487, -0.6648272, -2.9206, 0, 1, 0.6235294, 1,
-0.1958235, 0.6157714, -0.2266935, 0, 1, 0.627451, 1,
-0.1881671, -1.526848, -3.239048, 0, 1, 0.6352941, 1,
-0.1859604, 1.173833, -0.06329505, 0, 1, 0.6392157, 1,
-0.1831429, -0.5196436, -2.716906, 0, 1, 0.6470588, 1,
-0.1757349, 1.405754, -0.6238154, 0, 1, 0.6509804, 1,
-0.1749412, 0.1565577, -1.883773, 0, 1, 0.6588235, 1,
-0.1747723, 1.02228, 0.4280957, 0, 1, 0.6627451, 1,
-0.171012, -0.5173062, -3.652258, 0, 1, 0.6705883, 1,
-0.1685639, -0.5915449, -2.571235, 0, 1, 0.6745098, 1,
-0.1640998, -0.1753169, -1.85973, 0, 1, 0.682353, 1,
-0.1612452, -0.00163037, -2.504668, 0, 1, 0.6862745, 1,
-0.161062, -0.1020518, -2.728107, 0, 1, 0.6941177, 1,
-0.1608719, -1.137146, -4.275664, 0, 1, 0.7019608, 1,
-0.1578481, 0.1782913, -2.146965, 0, 1, 0.7058824, 1,
-0.1567154, 1.597748, 0.5148695, 0, 1, 0.7137255, 1,
-0.155408, -0.1790434, -1.525849, 0, 1, 0.7176471, 1,
-0.1539793, -0.1284582, -1.381952, 0, 1, 0.7254902, 1,
-0.1534482, -0.5242796, -1.221363, 0, 1, 0.7294118, 1,
-0.153106, 1.514239, -0.5570429, 0, 1, 0.7372549, 1,
-0.1464088, 0.5343024, -0.5827487, 0, 1, 0.7411765, 1,
-0.144959, 1.064031, -0.08907261, 0, 1, 0.7490196, 1,
-0.1438449, 2.110073, -0.3032675, 0, 1, 0.7529412, 1,
-0.1411062, -0.6237796, -5.105201, 0, 1, 0.7607843, 1,
-0.1351755, 0.8037592, -0.3916688, 0, 1, 0.7647059, 1,
-0.1122972, -0.4815204, -2.231399, 0, 1, 0.772549, 1,
-0.1080825, -0.390142, -2.140582, 0, 1, 0.7764706, 1,
-0.1059711, -0.6394399, -0.6994321, 0, 1, 0.7843137, 1,
-0.1037932, -2.970423, -2.315021, 0, 1, 0.7882353, 1,
-0.09956317, -1.010852, -1.971877, 0, 1, 0.7960784, 1,
-0.09796843, -1.15671, -2.231721, 0, 1, 0.8039216, 1,
-0.09241102, -0.7723299, -1.726758, 0, 1, 0.8078431, 1,
-0.09126139, 0.06263314, -0.9336978, 0, 1, 0.8156863, 1,
-0.0908115, 1.326737, 0.009032606, 0, 1, 0.8196079, 1,
-0.08839778, -0.5104325, -2.135128, 0, 1, 0.827451, 1,
-0.08657553, 0.3587812, 0.1688147, 0, 1, 0.8313726, 1,
-0.08226629, 0.1331208, -0.6397114, 0, 1, 0.8392157, 1,
-0.07820994, -0.7082412, -3.824075, 0, 1, 0.8431373, 1,
-0.07730189, 0.1817712, -1.699888, 0, 1, 0.8509804, 1,
-0.07674166, -1.364094, -3.851928, 0, 1, 0.854902, 1,
-0.07568614, 0.1894184, 1.45387, 0, 1, 0.8627451, 1,
-0.07420573, -1.457302, -3.509253, 0, 1, 0.8666667, 1,
-0.071422, 0.8214816, 0.8648366, 0, 1, 0.8745098, 1,
-0.07025515, -0.7626622, -3.597535, 0, 1, 0.8784314, 1,
-0.06821036, 1.135447, -0.5214778, 0, 1, 0.8862745, 1,
-0.06708602, 0.1164962, 0.06250634, 0, 1, 0.8901961, 1,
-0.06251933, 0.187612, 1.14009, 0, 1, 0.8980392, 1,
-0.06157533, 1.728688, 0.5846446, 0, 1, 0.9058824, 1,
-0.0605089, -1.368017, -3.082435, 0, 1, 0.9098039, 1,
-0.05944758, 0.9937776, -0.4055995, 0, 1, 0.9176471, 1,
-0.05678308, 1.837722, -1.40645, 0, 1, 0.9215686, 1,
-0.05419119, -2.245017, -3.148749, 0, 1, 0.9294118, 1,
-0.05313188, -0.5643376, -2.594502, 0, 1, 0.9333333, 1,
-0.05220535, -2.133082, -2.578157, 0, 1, 0.9411765, 1,
-0.05147128, -0.09171782, -3.407521, 0, 1, 0.945098, 1,
-0.04747805, -0.4898021, -2.782257, 0, 1, 0.9529412, 1,
-0.0374409, -0.3119772, -3.537932, 0, 1, 0.9568627, 1,
-0.03634623, 2.429902, -0.4302508, 0, 1, 0.9647059, 1,
-0.03613508, -0.9086212, -3.362513, 0, 1, 0.9686275, 1,
-0.02913231, -0.1237474, -2.949022, 0, 1, 0.9764706, 1,
-0.02253574, 0.1316146, 0.6941067, 0, 1, 0.9803922, 1,
-0.01695432, -0.3691738, -3.661754, 0, 1, 0.9882353, 1,
-0.01423843, -0.6579762, -3.102071, 0, 1, 0.9921569, 1,
-0.01028256, -0.1876698, -4.029088, 0, 1, 1, 1,
-0.00345048, 0.6771434, -0.254905, 0, 0.9921569, 1, 1,
-0.002195334, -1.040087, -3.758949, 0, 0.9882353, 1, 1,
-0.002106513, -0.1112801, -3.698601, 0, 0.9803922, 1, 1,
0.001780442, -1.017742, 4.654697, 0, 0.9764706, 1, 1,
0.005952911, 0.2347445, 0.4816262, 0, 0.9686275, 1, 1,
0.006353984, -0.5207057, 3.605435, 0, 0.9647059, 1, 1,
0.006950836, 0.2974559, -0.6939796, 0, 0.9568627, 1, 1,
0.007787984, 0.08255994, -1.884943, 0, 0.9529412, 1, 1,
0.009834751, 1.234973, 1.086753, 0, 0.945098, 1, 1,
0.01415175, -0.6651288, 4.539186, 0, 0.9411765, 1, 1,
0.01497747, -1.2876, 3.683542, 0, 0.9333333, 1, 1,
0.01612805, -0.4992474, 2.726237, 0, 0.9294118, 1, 1,
0.0266096, 1.069418, -1.714639, 0, 0.9215686, 1, 1,
0.02952573, 0.08024515, 0.4505362, 0, 0.9176471, 1, 1,
0.02966162, -1.35445, 2.603574, 0, 0.9098039, 1, 1,
0.03023662, 0.8278781, 1.970474, 0, 0.9058824, 1, 1,
0.03325695, -0.3622763, 2.954365, 0, 0.8980392, 1, 1,
0.03491072, 0.608811, -1.662925, 0, 0.8901961, 1, 1,
0.03633681, 0.2456489, -0.07009834, 0, 0.8862745, 1, 1,
0.04052568, 1.753258, -1.218718, 0, 0.8784314, 1, 1,
0.04114072, 1.582811, -1.645841, 0, 0.8745098, 1, 1,
0.04440215, -0.1038828, 3.367358, 0, 0.8666667, 1, 1,
0.04773658, 1.305259, 0.8862405, 0, 0.8627451, 1, 1,
0.04905571, 1.079211, -1.321771, 0, 0.854902, 1, 1,
0.05803885, 0.554389, 1.987764, 0, 0.8509804, 1, 1,
0.06049864, -0.1812819, 3.304991, 0, 0.8431373, 1, 1,
0.06416818, -0.3741365, 3.648367, 0, 0.8392157, 1, 1,
0.06743664, 0.2158038, 1.969763, 0, 0.8313726, 1, 1,
0.06935646, 0.6508625, 0.454715, 0, 0.827451, 1, 1,
0.071307, -1.319222, 1.810154, 0, 0.8196079, 1, 1,
0.07158694, 0.7023679, -0.2126659, 0, 0.8156863, 1, 1,
0.07211336, -0.1737618, 4.233878, 0, 0.8078431, 1, 1,
0.07906643, -0.1879251, 1.204056, 0, 0.8039216, 1, 1,
0.08277448, -0.7356259, 3.296938, 0, 0.7960784, 1, 1,
0.08559003, -0.1956268, 2.875176, 0, 0.7882353, 1, 1,
0.09025659, 1.573158, -1.203859, 0, 0.7843137, 1, 1,
0.09132925, 0.0813875, -0.7370111, 0, 0.7764706, 1, 1,
0.09198394, -0.1562689, 1.744848, 0, 0.772549, 1, 1,
0.09198862, -0.00325954, 0.9210727, 0, 0.7647059, 1, 1,
0.09460144, 0.9406746, 1.066441, 0, 0.7607843, 1, 1,
0.09661827, -2.290791, 2.773605, 0, 0.7529412, 1, 1,
0.09916139, 0.2915523, 0.8569887, 0, 0.7490196, 1, 1,
0.09927382, -0.1900533, 1.359476, 0, 0.7411765, 1, 1,
0.1001945, 1.080726, -0.5794964, 0, 0.7372549, 1, 1,
0.102022, -0.4993464, 3.076376, 0, 0.7294118, 1, 1,
0.1027252, 1.346456, -0.3928347, 0, 0.7254902, 1, 1,
0.1040338, -0.02252373, 0.4067149, 0, 0.7176471, 1, 1,
0.1097726, 0.5503849, -0.298243, 0, 0.7137255, 1, 1,
0.1099601, -0.1142931, 2.032226, 0, 0.7058824, 1, 1,
0.110389, -0.1014313, 2.494227, 0, 0.6980392, 1, 1,
0.1108698, -1.822322, 3.865438, 0, 0.6941177, 1, 1,
0.1110486, 0.3653711, 1.121233, 0, 0.6862745, 1, 1,
0.1140871, -0.3956435, 2.790502, 0, 0.682353, 1, 1,
0.1186244, 1.717244, 0.4521722, 0, 0.6745098, 1, 1,
0.121908, 0.06346719, 0.9305791, 0, 0.6705883, 1, 1,
0.1220319, 0.05082007, 1.941049, 0, 0.6627451, 1, 1,
0.127633, 0.8945689, 0.2552698, 0, 0.6588235, 1, 1,
0.1299901, -3.045543, 2.703047, 0, 0.6509804, 1, 1,
0.1309296, -0.350813, 4.856522, 0, 0.6470588, 1, 1,
0.1322663, 2.126555, 0.6193347, 0, 0.6392157, 1, 1,
0.136631, -0.2389523, 4.95091, 0, 0.6352941, 1, 1,
0.1367171, -0.8211268, 4.013515, 0, 0.627451, 1, 1,
0.1402899, 0.3163647, -0.5654358, 0, 0.6235294, 1, 1,
0.1427471, -1.446648, 2.962908, 0, 0.6156863, 1, 1,
0.1466878, 0.3263065, 0.3235488, 0, 0.6117647, 1, 1,
0.1478751, 0.8706782, -0.4995178, 0, 0.6039216, 1, 1,
0.1556682, 0.05415734, 2.185125, 0, 0.5960785, 1, 1,
0.1602513, 0.3509036, 1.128318, 0, 0.5921569, 1, 1,
0.1605474, 0.9256838, 1.359523, 0, 0.5843138, 1, 1,
0.1638824, 0.7624506, -1.065409, 0, 0.5803922, 1, 1,
0.1700999, -1.550188, 4.753066, 0, 0.572549, 1, 1,
0.1780812, -1.269387, 3.524534, 0, 0.5686275, 1, 1,
0.1791594, 0.1008545, 1.54024, 0, 0.5607843, 1, 1,
0.1793546, 0.8327938, 0.9074436, 0, 0.5568628, 1, 1,
0.1931953, 0.6666255, 1.060009, 0, 0.5490196, 1, 1,
0.1968014, 0.7898425, -0.3424457, 0, 0.5450981, 1, 1,
0.203883, 0.6776792, -0.8878718, 0, 0.5372549, 1, 1,
0.2046873, -0.2762276, 1.803527, 0, 0.5333334, 1, 1,
0.2051354, 0.008178289, 0.1161846, 0, 0.5254902, 1, 1,
0.2063025, 0.7890563, 0.9041675, 0, 0.5215687, 1, 1,
0.2091431, 1.035558, 1.220606, 0, 0.5137255, 1, 1,
0.2144021, 0.9629965, 0.3314248, 0, 0.509804, 1, 1,
0.2181928, 0.2911447, 0.8074751, 0, 0.5019608, 1, 1,
0.2182212, 1.436953, 1.151164, 0, 0.4941176, 1, 1,
0.2228231, 0.6810786, 0.8132212, 0, 0.4901961, 1, 1,
0.2233578, 1.106851, 0.3276488, 0, 0.4823529, 1, 1,
0.2275575, -0.02889811, 0.5949733, 0, 0.4784314, 1, 1,
0.2292198, -1.498438, 3.000204, 0, 0.4705882, 1, 1,
0.2320842, -1.513343, 3.268066, 0, 0.4666667, 1, 1,
0.232109, 1.539715, 0.3541379, 0, 0.4588235, 1, 1,
0.233756, -0.8555661, 1.425921, 0, 0.454902, 1, 1,
0.2349821, 0.008998356, 2.699816, 0, 0.4470588, 1, 1,
0.2353837, -0.05716742, 2.2375, 0, 0.4431373, 1, 1,
0.2365344, 0.5921405, 1.080667, 0, 0.4352941, 1, 1,
0.2383806, 0.9779532, 1.450263, 0, 0.4313726, 1, 1,
0.2411305, -0.1521875, 1.633799, 0, 0.4235294, 1, 1,
0.2424161, -1.429516, 1.655393, 0, 0.4196078, 1, 1,
0.2436731, -0.1040013, 1.649212, 0, 0.4117647, 1, 1,
0.2543355, -0.9297052, 2.425434, 0, 0.4078431, 1, 1,
0.2553096, -0.8576919, 4.132916, 0, 0.4, 1, 1,
0.2579321, 1.645218, 0.1208768, 0, 0.3921569, 1, 1,
0.2597816, 1.300022, -1.220452, 0, 0.3882353, 1, 1,
0.2696399, 0.5278065, 1.46651, 0, 0.3803922, 1, 1,
0.2719126, 0.5161343, 0.2916325, 0, 0.3764706, 1, 1,
0.2721708, 0.2937666, 0.1030863, 0, 0.3686275, 1, 1,
0.2722051, 0.6630813, 0.6776046, 0, 0.3647059, 1, 1,
0.2736673, 0.5440533, -0.9843408, 0, 0.3568628, 1, 1,
0.273971, 0.2525509, 1.025596, 0, 0.3529412, 1, 1,
0.282065, -0.2208146, 4.015272, 0, 0.345098, 1, 1,
0.2825633, -0.5484346, 4.418886, 0, 0.3411765, 1, 1,
0.2845365, 0.4731362, 1.073583, 0, 0.3333333, 1, 1,
0.2846237, 0.7793925, 0.6979175, 0, 0.3294118, 1, 1,
0.2865541, -1.642962, 3.067462, 0, 0.3215686, 1, 1,
0.2881452, 0.1742965, 0.4730341, 0, 0.3176471, 1, 1,
0.2881776, -0.4296533, 1.764352, 0, 0.3098039, 1, 1,
0.2891943, -0.5233655, 3.634301, 0, 0.3058824, 1, 1,
0.2906094, -0.6845887, 1.336398, 0, 0.2980392, 1, 1,
0.293704, 0.6530508, -0.7767524, 0, 0.2901961, 1, 1,
0.2963841, 2.296363, 0.2592659, 0, 0.2862745, 1, 1,
0.2971992, 0.6920775, 0.8505921, 0, 0.2784314, 1, 1,
0.3043435, 0.1288732, 1.143187, 0, 0.2745098, 1, 1,
0.3046719, -0.2022743, 2.772427, 0, 0.2666667, 1, 1,
0.3051164, -1.928741, 1.777014, 0, 0.2627451, 1, 1,
0.3094485, -0.1121304, 1.62579, 0, 0.254902, 1, 1,
0.3123544, -0.1933909, -0.02958312, 0, 0.2509804, 1, 1,
0.3129116, -0.7741494, 2.522084, 0, 0.2431373, 1, 1,
0.3140122, -0.8453026, 3.964629, 0, 0.2392157, 1, 1,
0.3141153, -0.6320379, 1.958924, 0, 0.2313726, 1, 1,
0.3146481, 0.07416058, 0.8073165, 0, 0.227451, 1, 1,
0.3147615, 0.3331822, -0.8716345, 0, 0.2196078, 1, 1,
0.3226623, -0.1116017, 0.7929259, 0, 0.2156863, 1, 1,
0.3260008, 1.525974, -1.413341, 0, 0.2078431, 1, 1,
0.3269594, 2.805537, 0.3234354, 0, 0.2039216, 1, 1,
0.3358133, -0.2414342, 3.081608, 0, 0.1960784, 1, 1,
0.3438187, 0.7430409, 0.3853869, 0, 0.1882353, 1, 1,
0.3438547, 0.006402869, 0.3712648, 0, 0.1843137, 1, 1,
0.3460994, -1.613716, 1.87676, 0, 0.1764706, 1, 1,
0.3461606, 2.157964, 0.1392504, 0, 0.172549, 1, 1,
0.3516129, -0.08262693, 1.0022, 0, 0.1647059, 1, 1,
0.3544742, 0.6315218, 1.044922, 0, 0.1607843, 1, 1,
0.3603249, -0.1300491, 1.892345, 0, 0.1529412, 1, 1,
0.3627822, -0.7662238, 4.144122, 0, 0.1490196, 1, 1,
0.3642293, -0.1857132, 2.509146, 0, 0.1411765, 1, 1,
0.3648522, -2.061881, 2.947598, 0, 0.1372549, 1, 1,
0.3671838, -0.5100909, 2.113106, 0, 0.1294118, 1, 1,
0.3804119, 1.65729, 1.289961, 0, 0.1254902, 1, 1,
0.3806463, 0.9218354, 0.2284168, 0, 0.1176471, 1, 1,
0.3807274, -1.362775, 2.34043, 0, 0.1137255, 1, 1,
0.3816097, 1.749706, -0.8124383, 0, 0.1058824, 1, 1,
0.3839371, 1.340112, -0.5558724, 0, 0.09803922, 1, 1,
0.3848647, 0.6129606, 1.022206, 0, 0.09411765, 1, 1,
0.3858092, 0.930258, 0.5674797, 0, 0.08627451, 1, 1,
0.3879226, -0.4214812, 1.695859, 0, 0.08235294, 1, 1,
0.3883587, -1.515374, 3.318901, 0, 0.07450981, 1, 1,
0.3909623, -1.087234, 2.700656, 0, 0.07058824, 1, 1,
0.3913777, 1.029702, 0.2288162, 0, 0.0627451, 1, 1,
0.3936542, -0.32479, 0.6372459, 0, 0.05882353, 1, 1,
0.3939814, -0.5167637, 1.804152, 0, 0.05098039, 1, 1,
0.3940182, -0.1319263, 0.6533629, 0, 0.04705882, 1, 1,
0.3992022, -0.4619046, 0.8703901, 0, 0.03921569, 1, 1,
0.3992616, -1.346149, 3.194541, 0, 0.03529412, 1, 1,
0.4011388, -0.3146923, 3.679557, 0, 0.02745098, 1, 1,
0.4031791, 0.1337753, 0.9216521, 0, 0.02352941, 1, 1,
0.4065548, -0.2401213, 1.540244, 0, 0.01568628, 1, 1,
0.408985, 0.1158857, 1.142899, 0, 0.01176471, 1, 1,
0.4106176, 0.6706734, 0.5995651, 0, 0.003921569, 1, 1,
0.4111121, 0.1879411, 1.681025, 0.003921569, 0, 1, 1,
0.4167085, 0.4950695, -0.3394688, 0.007843138, 0, 1, 1,
0.4167295, -0.3732873, 2.142041, 0.01568628, 0, 1, 1,
0.4170332, 1.033077, 0.8792254, 0.01960784, 0, 1, 1,
0.4189185, -0.5996078, 1.81744, 0.02745098, 0, 1, 1,
0.425754, 0.6840702, 0.6813485, 0.03137255, 0, 1, 1,
0.4284292, 1.126323, 0.5797697, 0.03921569, 0, 1, 1,
0.430474, -1.239539, 3.770277, 0.04313726, 0, 1, 1,
0.4330762, 0.2200322, 1.518873, 0.05098039, 0, 1, 1,
0.4330827, -1.78899, 3.274404, 0.05490196, 0, 1, 1,
0.4484616, -0.3285312, 3.135743, 0.0627451, 0, 1, 1,
0.4494365, 1.671759, -1.605389, 0.06666667, 0, 1, 1,
0.4512577, -0.8943366, 4.472518, 0.07450981, 0, 1, 1,
0.4558791, 6.401388e-05, 2.708309, 0.07843138, 0, 1, 1,
0.46174, 1.063338, 0.132359, 0.08627451, 0, 1, 1,
0.462332, 1.430726, 0.9756205, 0.09019608, 0, 1, 1,
0.4673691, -0.5151083, 3.270703, 0.09803922, 0, 1, 1,
0.476467, 0.4267524, 2.387293, 0.1058824, 0, 1, 1,
0.4767099, -0.66552, 2.905256, 0.1098039, 0, 1, 1,
0.4809825, 0.6777604, 0.06983627, 0.1176471, 0, 1, 1,
0.4816054, 1.12547, 0.9608154, 0.1215686, 0, 1, 1,
0.4839561, 0.1111366, 1.675329, 0.1294118, 0, 1, 1,
0.4851595, -1.483484, 4.057154, 0.1333333, 0, 1, 1,
0.4919596, -1.745809, 3.489537, 0.1411765, 0, 1, 1,
0.4920143, 0.03256888, 0.9775342, 0.145098, 0, 1, 1,
0.4920687, -0.5156652, 3.17058, 0.1529412, 0, 1, 1,
0.4955778, 0.5642795, -1.145186, 0.1568628, 0, 1, 1,
0.498909, 0.7872078, 1.465352, 0.1647059, 0, 1, 1,
0.5021372, -0.3795144, 2.804323, 0.1686275, 0, 1, 1,
0.5037457, -0.1955706, 1.85634, 0.1764706, 0, 1, 1,
0.5119201, 0.09156891, 2.343321, 0.1803922, 0, 1, 1,
0.5123159, 0.5727751, 0.6025076, 0.1882353, 0, 1, 1,
0.5141166, 1.014219, -0.1052433, 0.1921569, 0, 1, 1,
0.5166792, -0.2995625, 1.939911, 0.2, 0, 1, 1,
0.5197788, 1.863028, 0.7914177, 0.2078431, 0, 1, 1,
0.5225097, -0.8532394, -0.3220318, 0.2117647, 0, 1, 1,
0.523357, 1.713575, 0.6549106, 0.2196078, 0, 1, 1,
0.5236841, -0.07313628, 0.6123206, 0.2235294, 0, 1, 1,
0.5247766, 0.7061141, 0.7331218, 0.2313726, 0, 1, 1,
0.5307984, 0.3564797, 2.473396, 0.2352941, 0, 1, 1,
0.5320507, -1.253676, 2.023972, 0.2431373, 0, 1, 1,
0.532054, -0.3274637, 1.674387, 0.2470588, 0, 1, 1,
0.5328034, 0.9285518, -1.153981, 0.254902, 0, 1, 1,
0.5356253, -2.752868, 2.7353, 0.2588235, 0, 1, 1,
0.53662, 0.4329329, 1.170934, 0.2666667, 0, 1, 1,
0.5378813, -1.430762, 3.17768, 0.2705882, 0, 1, 1,
0.5388306, 1.060904, 1.577133, 0.2784314, 0, 1, 1,
0.5400064, -0.358499, 2.190887, 0.282353, 0, 1, 1,
0.5438474, 2.181366, 0.8889196, 0.2901961, 0, 1, 1,
0.5448635, -0.09913743, 4.40449, 0.2941177, 0, 1, 1,
0.5460948, -0.4301121, 2.508749, 0.3019608, 0, 1, 1,
0.5576587, 0.6268513, 2.364389, 0.3098039, 0, 1, 1,
0.5577344, 1.28018, 0.9993008, 0.3137255, 0, 1, 1,
0.561596, 1.547327, 0.8764277, 0.3215686, 0, 1, 1,
0.5690385, 1.257469, 1.828767, 0.3254902, 0, 1, 1,
0.572788, 2.345658, 1.548309, 0.3333333, 0, 1, 1,
0.5756335, -0.3936647, 1.276122, 0.3372549, 0, 1, 1,
0.5783693, 0.2656052, 2.157711, 0.345098, 0, 1, 1,
0.5789291, 0.6958318, 0.1645935, 0.3490196, 0, 1, 1,
0.5798405, -1.030348, 0.7333602, 0.3568628, 0, 1, 1,
0.580336, -0.5738394, 1.891406, 0.3607843, 0, 1, 1,
0.5819871, -0.585684, 2.555345, 0.3686275, 0, 1, 1,
0.5834643, 0.6468091, 2.166463, 0.372549, 0, 1, 1,
0.5866246, -0.4365382, 2.420146, 0.3803922, 0, 1, 1,
0.5872214, 1.052399, -0.4243188, 0.3843137, 0, 1, 1,
0.5930042, 0.7899197, 2.10252, 0.3921569, 0, 1, 1,
0.597953, 1.380606, 0.3403756, 0.3960784, 0, 1, 1,
0.6006138, -0.06233225, 2.109345, 0.4039216, 0, 1, 1,
0.6017078, -0.9625531, 1.714553, 0.4117647, 0, 1, 1,
0.6031021, 0.1717223, 1.042579, 0.4156863, 0, 1, 1,
0.6046913, -1.408816, 4.188318, 0.4235294, 0, 1, 1,
0.606737, 0.4047101, 0.860864, 0.427451, 0, 1, 1,
0.6096562, -0.03078718, 0.9819627, 0.4352941, 0, 1, 1,
0.6189815, 0.2153031, 2.619097, 0.4392157, 0, 1, 1,
0.6215498, 0.09364463, 3.30945, 0.4470588, 0, 1, 1,
0.6272737, -0.3730537, 2.41217, 0.4509804, 0, 1, 1,
0.6286052, -1.441113, 0.6701, 0.4588235, 0, 1, 1,
0.6419233, 1.656808, -0.4711765, 0.4627451, 0, 1, 1,
0.6513874, 1.063386, 1.328694, 0.4705882, 0, 1, 1,
0.6518561, -0.02080769, -0.04838714, 0.4745098, 0, 1, 1,
0.6560763, -0.7949297, 3.811826, 0.4823529, 0, 1, 1,
0.6598182, -1.213904, 2.377525, 0.4862745, 0, 1, 1,
0.6610554, 0.3209299, 2.641582, 0.4941176, 0, 1, 1,
0.6611444, 1.421572, -0.8374149, 0.5019608, 0, 1, 1,
0.6729538, -0.1293303, 0.4445267, 0.5058824, 0, 1, 1,
0.6778622, 0.3376894, 0.5366056, 0.5137255, 0, 1, 1,
0.6849402, 0.4994236, 1.202149, 0.5176471, 0, 1, 1,
0.6872982, -0.4094316, 1.781957, 0.5254902, 0, 1, 1,
0.6912082, -0.8619531, 1.629612, 0.5294118, 0, 1, 1,
0.7032107, -0.2160622, 1.818532, 0.5372549, 0, 1, 1,
0.7050454, 0.3631855, 0.0648792, 0.5411765, 0, 1, 1,
0.7091168, 2.067237, -0.2112225, 0.5490196, 0, 1, 1,
0.7154931, 0.1010793, 0.9329661, 0.5529412, 0, 1, 1,
0.7166626, -0.05490895, 0.9708295, 0.5607843, 0, 1, 1,
0.7174154, 1.998442, -1.079432, 0.5647059, 0, 1, 1,
0.7189483, 0.6508458, 0.6816853, 0.572549, 0, 1, 1,
0.7219129, 0.8874325, -0.07071123, 0.5764706, 0, 1, 1,
0.7276646, -0.2843617, 1.920661, 0.5843138, 0, 1, 1,
0.7288193, -0.5982808, 2.291044, 0.5882353, 0, 1, 1,
0.7352626, -0.1133398, 1.158364, 0.5960785, 0, 1, 1,
0.7355131, -0.02554164, 2.572095, 0.6039216, 0, 1, 1,
0.735635, 0.03824289, 2.522808, 0.6078432, 0, 1, 1,
0.7395386, -1.572936, 1.674008, 0.6156863, 0, 1, 1,
0.742196, -0.6118809, 2.502541, 0.6196079, 0, 1, 1,
0.7424025, 0.1813227, 1.678193, 0.627451, 0, 1, 1,
0.7439101, 0.359662, 0.6145876, 0.6313726, 0, 1, 1,
0.7481547, -1.055732, 4.140181, 0.6392157, 0, 1, 1,
0.7516989, 0.4013569, 0.3584795, 0.6431373, 0, 1, 1,
0.7519385, -0.3692575, 3.612982, 0.6509804, 0, 1, 1,
0.7520574, 1.322139, -0.916481, 0.654902, 0, 1, 1,
0.7539583, 0.4855226, 1.227511, 0.6627451, 0, 1, 1,
0.7557693, 2.133198, 0.5169559, 0.6666667, 0, 1, 1,
0.7607142, -0.5736285, 1.635874, 0.6745098, 0, 1, 1,
0.771373, 0.927988, 1.278976, 0.6784314, 0, 1, 1,
0.7767466, 1.472705, 1.78708, 0.6862745, 0, 1, 1,
0.7793821, 0.6720487, -0.1242742, 0.6901961, 0, 1, 1,
0.7846422, 0.3152327, 0.5459053, 0.6980392, 0, 1, 1,
0.7853391, -2.811276, 3.839921, 0.7058824, 0, 1, 1,
0.7873094, -2.07726, 1.676711, 0.7098039, 0, 1, 1,
0.7949468, 0.4864258, 0.4375614, 0.7176471, 0, 1, 1,
0.7975106, 0.5935338, 0.4179922, 0.7215686, 0, 1, 1,
0.7995847, -2.48222, -0.2559915, 0.7294118, 0, 1, 1,
0.804007, -0.2845021, 1.225314, 0.7333333, 0, 1, 1,
0.8056748, -0.6895789, 2.259445, 0.7411765, 0, 1, 1,
0.8087105, -0.7312542, 3.372777, 0.7450981, 0, 1, 1,
0.8106387, 1.591905, -0.6285688, 0.7529412, 0, 1, 1,
0.8116999, -0.7369133, 3.207091, 0.7568628, 0, 1, 1,
0.8121508, -2.398363, 4.081069, 0.7647059, 0, 1, 1,
0.8203493, 1.528028, 1.56845, 0.7686275, 0, 1, 1,
0.820828, 0.4330459, 1.050095, 0.7764706, 0, 1, 1,
0.8262431, -0.5207587, 2.057124, 0.7803922, 0, 1, 1,
0.8404117, 0.4903706, 0.756838, 0.7882353, 0, 1, 1,
0.8404228, 0.53552, -0.7906032, 0.7921569, 0, 1, 1,
0.8406699, 1.72341, -0.9408346, 0.8, 0, 1, 1,
0.8427812, -0.2915933, 3.202793, 0.8078431, 0, 1, 1,
0.8456818, -0.6947642, 1.06653, 0.8117647, 0, 1, 1,
0.8478422, -1.024177, 3.398398, 0.8196079, 0, 1, 1,
0.8545356, 0.3923603, 2.479293, 0.8235294, 0, 1, 1,
0.8579492, 0.9372992, 0.5312117, 0.8313726, 0, 1, 1,
0.8591955, 0.4034227, 2.469553, 0.8352941, 0, 1, 1,
0.8599743, -0.7688088, 1.734802, 0.8431373, 0, 1, 1,
0.8620874, -0.3277337, 2.182003, 0.8470588, 0, 1, 1,
0.868085, -0.3789081, 1.896699, 0.854902, 0, 1, 1,
0.8703673, -0.7193422, 3.209143, 0.8588235, 0, 1, 1,
0.8718002, 0.6548187, 1.612411, 0.8666667, 0, 1, 1,
0.8762596, 0.2735612, 0.7091141, 0.8705882, 0, 1, 1,
0.8834834, 0.08224403, 2.847994, 0.8784314, 0, 1, 1,
0.8923334, 0.5389376, 0.973669, 0.8823529, 0, 1, 1,
0.8936299, 0.2115241, 0.7723907, 0.8901961, 0, 1, 1,
0.8947313, 2.660416, 1.702482, 0.8941177, 0, 1, 1,
0.9047279, -0.373525, 2.004691, 0.9019608, 0, 1, 1,
0.910989, -1.264668, 2.907336, 0.9098039, 0, 1, 1,
0.9165667, 2.587525, -0.8071773, 0.9137255, 0, 1, 1,
0.9206213, 0.1965915, 0.7837315, 0.9215686, 0, 1, 1,
0.9275718, -0.5425332, 0.5457402, 0.9254902, 0, 1, 1,
0.9294457, -1.400468, 1.356534, 0.9333333, 0, 1, 1,
0.9310247, 0.7224684, -0.8955264, 0.9372549, 0, 1, 1,
0.9331858, -2.488991, 3.451669, 0.945098, 0, 1, 1,
0.9352361, 1.001701, 1.252879, 0.9490196, 0, 1, 1,
0.9444413, 0.6300118, 0.4394006, 0.9568627, 0, 1, 1,
0.9487443, -0.3382524, 2.110567, 0.9607843, 0, 1, 1,
0.9493873, 0.2388672, 1.754895, 0.9686275, 0, 1, 1,
0.9521846, 0.7689046, -0.8257237, 0.972549, 0, 1, 1,
0.9565933, -0.4532309, 2.23863, 0.9803922, 0, 1, 1,
0.9604231, -0.03929847, 1.740347, 0.9843137, 0, 1, 1,
0.9652145, -1.64977, 0.7072248, 0.9921569, 0, 1, 1,
0.9750996, -0.7369999, 4.792784, 0.9960784, 0, 1, 1,
0.9754226, 0.2482567, 2.217565, 1, 0, 0.9960784, 1,
0.9757541, -0.3040366, 1.700104, 1, 0, 0.9882353, 1,
0.9776136, 0.1765731, 1.084361, 1, 0, 0.9843137, 1,
0.9779431, -0.6233491, 1.172655, 1, 0, 0.9764706, 1,
0.9844323, 0.3006809, 0.2416118, 1, 0, 0.972549, 1,
0.9877872, 0.5746778, -0.09420972, 1, 0, 0.9647059, 1,
0.9878366, -0.7504175, 2.593108, 1, 0, 0.9607843, 1,
0.9880572, -0.6604424, 3.506329, 1, 0, 0.9529412, 1,
0.9902913, -2.110902, 2.812859, 1, 0, 0.9490196, 1,
0.9903771, -0.1980568, 1.169464, 1, 0, 0.9411765, 1,
0.9950278, -0.1113429, 1.220505, 1, 0, 0.9372549, 1,
1.002164, 0.4814117, -0.9971294, 1, 0, 0.9294118, 1,
1.002907, 0.334108, 0.2790257, 1, 0, 0.9254902, 1,
1.004269, 1.758879, 0.3026631, 1, 0, 0.9176471, 1,
1.006345, -1.847967, 2.382116, 1, 0, 0.9137255, 1,
1.013611, 0.07078867, 1.212008, 1, 0, 0.9058824, 1,
1.015858, 0.8876581, -0.3370011, 1, 0, 0.9019608, 1,
1.019955, -0.08178875, 2.190148, 1, 0, 0.8941177, 1,
1.030535, 0.2968067, 0.7708806, 1, 0, 0.8862745, 1,
1.031166, 1.103151, 1.32627, 1, 0, 0.8823529, 1,
1.031746, 0.8039702, 1.936147, 1, 0, 0.8745098, 1,
1.040331, -0.6566821, 2.614202, 1, 0, 0.8705882, 1,
1.041189, -0.6206087, 1.335135, 1, 0, 0.8627451, 1,
1.055358, 0.1108667, 1.717385, 1, 0, 0.8588235, 1,
1.059577, 0.9755623, 1.506069, 1, 0, 0.8509804, 1,
1.063619, 1.273537, -0.2767872, 1, 0, 0.8470588, 1,
1.065905, 0.6779478, -0.2178334, 1, 0, 0.8392157, 1,
1.072828, -0.1273899, 1.818946, 1, 0, 0.8352941, 1,
1.076015, -0.3480688, 3.677966, 1, 0, 0.827451, 1,
1.082989, -0.2416007, 1.981927, 1, 0, 0.8235294, 1,
1.084316, 0.9004585, 0.3953783, 1, 0, 0.8156863, 1,
1.092286, -0.9124758, -0.2257383, 1, 0, 0.8117647, 1,
1.095156, 1.784017, -0.06750128, 1, 0, 0.8039216, 1,
1.103046, 0.64081, 0.7800297, 1, 0, 0.7960784, 1,
1.107231, 0.4905937, -0.230514, 1, 0, 0.7921569, 1,
1.1082, -0.6683242, 1.832594, 1, 0, 0.7843137, 1,
1.112171, 1.094034, 2.200072, 1, 0, 0.7803922, 1,
1.113174, 0.6693454, 1.00937, 1, 0, 0.772549, 1,
1.124903, 0.6567739, 1.65794, 1, 0, 0.7686275, 1,
1.126271, -0.2532423, 2.579108, 1, 0, 0.7607843, 1,
1.130988, 0.9587749, 0.8588994, 1, 0, 0.7568628, 1,
1.131549, -1.058031, 1.163562, 1, 0, 0.7490196, 1,
1.134688, -1.024756, 1.60145, 1, 0, 0.7450981, 1,
1.135013, -0.6127298, 1.909193, 1, 0, 0.7372549, 1,
1.139163, 0.6363984, 1.303262, 1, 0, 0.7333333, 1,
1.14648, 0.05186521, 0.5880229, 1, 0, 0.7254902, 1,
1.152948, -1.914253, 3.600363, 1, 0, 0.7215686, 1,
1.154695, -0.2341093, 1.044223, 1, 0, 0.7137255, 1,
1.155989, 0.6147218, 2.397071, 1, 0, 0.7098039, 1,
1.165539, -0.6345512, 2.692677, 1, 0, 0.7019608, 1,
1.166635, 0.8580078, 1.316268, 1, 0, 0.6941177, 1,
1.173889, 0.3987105, 2.022119, 1, 0, 0.6901961, 1,
1.192482, -0.3367923, -0.2779217, 1, 0, 0.682353, 1,
1.199068, -1.230253, 2.946878, 1, 0, 0.6784314, 1,
1.20051, 1.199704, 0.3896092, 1, 0, 0.6705883, 1,
1.209111, 0.4317122, 0.1465451, 1, 0, 0.6666667, 1,
1.213672, -0.183792, 2.188496, 1, 0, 0.6588235, 1,
1.215855, 0.8147387, -0.3470633, 1, 0, 0.654902, 1,
1.21944, 0.09569523, 0.5837155, 1, 0, 0.6470588, 1,
1.231475, -0.1817173, 2.600951, 1, 0, 0.6431373, 1,
1.232952, 0.5345875, 1.046129, 1, 0, 0.6352941, 1,
1.233332, 1.971155, 0.4746072, 1, 0, 0.6313726, 1,
1.240247, -0.0008403498, 1.513557, 1, 0, 0.6235294, 1,
1.264006, -1.861629, 2.58306, 1, 0, 0.6196079, 1,
1.270292, 0.1775255, 1.271503, 1, 0, 0.6117647, 1,
1.271918, -0.07020269, 2.445814, 1, 0, 0.6078432, 1,
1.283202, -1.769279, 1.438344, 1, 0, 0.6, 1,
1.289173, 0.466391, 0.5855448, 1, 0, 0.5921569, 1,
1.290283, 1.414769, 0.1047142, 1, 0, 0.5882353, 1,
1.317152, -1.039104, 1.901184, 1, 0, 0.5803922, 1,
1.317442, -0.4730834, 1.713405, 1, 0, 0.5764706, 1,
1.319014, 0.009713508, 1.311457, 1, 0, 0.5686275, 1,
1.319776, -0.2062268, 0.6963387, 1, 0, 0.5647059, 1,
1.323132, -0.2791182, 1.878636, 1, 0, 0.5568628, 1,
1.343673, -0.6958994, 1.522685, 1, 0, 0.5529412, 1,
1.345096, 0.0299243, 2.220096, 1, 0, 0.5450981, 1,
1.346844, -0.9852132, 4.746724, 1, 0, 0.5411765, 1,
1.350228, 0.7975137, 2.033564, 1, 0, 0.5333334, 1,
1.36961, -0.04361336, 0.5179, 1, 0, 0.5294118, 1,
1.370515, -0.242565, 2.229629, 1, 0, 0.5215687, 1,
1.372299, 2.125119, -0.8874361, 1, 0, 0.5176471, 1,
1.376688, 0.4640432, 4.343509, 1, 0, 0.509804, 1,
1.381527, -0.5709239, 1.780921, 1, 0, 0.5058824, 1,
1.391272, 0.03063646, 1.109578, 1, 0, 0.4980392, 1,
1.399821, -1.027907, 2.051515, 1, 0, 0.4901961, 1,
1.416964, 1.694963, 0.1095045, 1, 0, 0.4862745, 1,
1.418524, -0.1852561, 2.284363, 1, 0, 0.4784314, 1,
1.420594, 1.013544, 0.7603137, 1, 0, 0.4745098, 1,
1.421538, 0.156477, 1.673479, 1, 0, 0.4666667, 1,
1.421664, 0.197147, 2.404274, 1, 0, 0.4627451, 1,
1.423492, -0.3510636, 3.00145, 1, 0, 0.454902, 1,
1.426111, -1.366261, 2.149307, 1, 0, 0.4509804, 1,
1.428337, 1.204685, 1.314385, 1, 0, 0.4431373, 1,
1.441118, -0.3277509, 0.3765513, 1, 0, 0.4392157, 1,
1.442714, -0.2903755, -0.1015367, 1, 0, 0.4313726, 1,
1.443526, 0.7544996, 0.4256307, 1, 0, 0.427451, 1,
1.453383, -0.4661745, 0.5651335, 1, 0, 0.4196078, 1,
1.466056, 0.8562427, -0.5611147, 1, 0, 0.4156863, 1,
1.475262, -0.6318799, 1.041331, 1, 0, 0.4078431, 1,
1.475377, 0.1713297, 1.183285, 1, 0, 0.4039216, 1,
1.478487, 0.8590165, 0.4212386, 1, 0, 0.3960784, 1,
1.481484, 0.7338501, 1.933012, 1, 0, 0.3882353, 1,
1.489421, -0.6126677, 1.649261, 1, 0, 0.3843137, 1,
1.490486, -0.2144414, 2.30846, 1, 0, 0.3764706, 1,
1.4929, 2.945755, 0.07108946, 1, 0, 0.372549, 1,
1.500057, -0.4022316, 0.760334, 1, 0, 0.3647059, 1,
1.50108, -0.02462149, 1.249189, 1, 0, 0.3607843, 1,
1.510556, 0.4355513, 1.619676, 1, 0, 0.3529412, 1,
1.514069, 0.3493677, 0.8727764, 1, 0, 0.3490196, 1,
1.5276, 3.10408, 2.344773, 1, 0, 0.3411765, 1,
1.527892, -0.5649476, 1.645879, 1, 0, 0.3372549, 1,
1.564686, 0.02958732, 2.401023, 1, 0, 0.3294118, 1,
1.569846, 0.4291883, 2.250125, 1, 0, 0.3254902, 1,
1.571612, 0.3140095, 1.581582, 1, 0, 0.3176471, 1,
1.576935, 0.6522866, 1.637922, 1, 0, 0.3137255, 1,
1.578452, -0.5448472, 2.452541, 1, 0, 0.3058824, 1,
1.579406, -1.019771, 2.827405, 1, 0, 0.2980392, 1,
1.586939, -0.7340729, 1.215318, 1, 0, 0.2941177, 1,
1.592949, -0.8655196, 0.911216, 1, 0, 0.2862745, 1,
1.60787, 0.4326985, 0.4116448, 1, 0, 0.282353, 1,
1.617367, -1.71702, 2.208464, 1, 0, 0.2745098, 1,
1.646682, 0.07263399, 0.2690335, 1, 0, 0.2705882, 1,
1.647731, -0.7079259, 0.9027485, 1, 0, 0.2627451, 1,
1.649683, 1.247881, -0.1347008, 1, 0, 0.2588235, 1,
1.665571, -0.1817364, 1.477648, 1, 0, 0.2509804, 1,
1.691187, 0.9117846, 2.474717, 1, 0, 0.2470588, 1,
1.692557, 1.829833, -0.1168859, 1, 0, 0.2392157, 1,
1.707302, -0.5512254, 1.443166, 1, 0, 0.2352941, 1,
1.711202, 0.02828266, 1.881999, 1, 0, 0.227451, 1,
1.724843, -1.547657, 1.573032, 1, 0, 0.2235294, 1,
1.740517, -0.1057051, 0.9522765, 1, 0, 0.2156863, 1,
1.75817, -0.08678333, 2.201109, 1, 0, 0.2117647, 1,
1.776769, -0.4431939, 0.9374794, 1, 0, 0.2039216, 1,
1.790304, 1.373526, 0.6293843, 1, 0, 0.1960784, 1,
1.805162, 0.1306562, 2.243749, 1, 0, 0.1921569, 1,
1.806141, -0.6367269, 2.622995, 1, 0, 0.1843137, 1,
1.816828, -0.234905, 2.912616, 1, 0, 0.1803922, 1,
1.830758, 0.428414, 0.008759049, 1, 0, 0.172549, 1,
1.835161, 0.9658611, 0.2563168, 1, 0, 0.1686275, 1,
1.847394, -0.141129, 0.9702089, 1, 0, 0.1607843, 1,
1.882675, 3.210319, -0.8751367, 1, 0, 0.1568628, 1,
1.883664, -1.211807, 1.724345, 1, 0, 0.1490196, 1,
1.907345, 0.8436233, 0.02548729, 1, 0, 0.145098, 1,
1.94775, -1.66889, 4.349975, 1, 0, 0.1372549, 1,
1.987094, 2.297294, 1.009961, 1, 0, 0.1333333, 1,
1.995202, -1.187945, 1.4538, 1, 0, 0.1254902, 1,
2.002279, 1.208892, 0.5554647, 1, 0, 0.1215686, 1,
2.081728, -0.9827728, 1.636444, 1, 0, 0.1137255, 1,
2.115746, -0.3933252, 2.777788, 1, 0, 0.1098039, 1,
2.116769, 0.2430716, 2.495119, 1, 0, 0.1019608, 1,
2.133645, -0.2179646, 1.10803, 1, 0, 0.09411765, 1,
2.197236, -2.635614, 2.714463, 1, 0, 0.09019608, 1,
2.234167, 0.4950832, 2.191503, 1, 0, 0.08235294, 1,
2.240318, 1.696799, 2.128238, 1, 0, 0.07843138, 1,
2.241997, 1.04874, 0.7001275, 1, 0, 0.07058824, 1,
2.304122, -0.7575744, 0.680563, 1, 0, 0.06666667, 1,
2.313374, 0.06220816, 1.837334, 1, 0, 0.05882353, 1,
2.34703, -0.03191766, 2.37793, 1, 0, 0.05490196, 1,
2.37328, -0.03167162, 2.236652, 1, 0, 0.04705882, 1,
2.480181, 0.9037238, 1.257487, 1, 0, 0.04313726, 1,
2.520744, -0.7492119, 3.722065, 1, 0, 0.03529412, 1,
2.654686, -1.12952, 3.119565, 1, 0, 0.03137255, 1,
2.721903, -1.259434, 3.294247, 1, 0, 0.02352941, 1,
2.831629, -0.6683517, 1.27556, 1, 0, 0.01960784, 1,
2.893696, -0.3929392, 0.8279216, 1, 0, 0.01176471, 1,
3.759118, 0.6136426, 1.272162, 1, 0, 0.007843138, 1
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
0.1748749, -4.105911, -6.847066, 0, -0.5, 0.5, 0.5,
0.1748749, -4.105911, -6.847066, 1, -0.5, 0.5, 0.5,
0.1748749, -4.105911, -6.847066, 1, 1.5, 0.5, 0.5,
0.1748749, -4.105911, -6.847066, 0, 1.5, 0.5, 0.5
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
-4.624426, 0.0823878, -6.847066, 0, -0.5, 0.5, 0.5,
-4.624426, 0.0823878, -6.847066, 1, -0.5, 0.5, 0.5,
-4.624426, 0.0823878, -6.847066, 1, 1.5, 0.5, 0.5,
-4.624426, 0.0823878, -6.847066, 0, 1.5, 0.5, 0.5
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
-4.624426, -4.105911, -0.09311581, 0, -0.5, 0.5, 0.5,
-4.624426, -4.105911, -0.09311581, 1, -0.5, 0.5, 0.5,
-4.624426, -4.105911, -0.09311581, 1, 1.5, 0.5, 0.5,
-4.624426, -4.105911, -0.09311581, 0, 1.5, 0.5, 0.5
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
-2, -3.139381, -5.288463,
2, -3.139381, -5.288463,
-2, -3.139381, -5.288463,
-2, -3.300469, -5.54823,
0, -3.139381, -5.288463,
0, -3.300469, -5.54823,
2, -3.139381, -5.288463,
2, -3.300469, -5.54823
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
-2, -3.622646, -6.067764, 0, -0.5, 0.5, 0.5,
-2, -3.622646, -6.067764, 1, -0.5, 0.5, 0.5,
-2, -3.622646, -6.067764, 1, 1.5, 0.5, 0.5,
-2, -3.622646, -6.067764, 0, 1.5, 0.5, 0.5,
0, -3.622646, -6.067764, 0, -0.5, 0.5, 0.5,
0, -3.622646, -6.067764, 1, -0.5, 0.5, 0.5,
0, -3.622646, -6.067764, 1, 1.5, 0.5, 0.5,
0, -3.622646, -6.067764, 0, 1.5, 0.5, 0.5,
2, -3.622646, -6.067764, 0, -0.5, 0.5, 0.5,
2, -3.622646, -6.067764, 1, -0.5, 0.5, 0.5,
2, -3.622646, -6.067764, 1, 1.5, 0.5, 0.5,
2, -3.622646, -6.067764, 0, 1.5, 0.5, 0.5
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
-3.516895, -3, -5.288463,
-3.516895, 3, -5.288463,
-3.516895, -3, -5.288463,
-3.701483, -3, -5.54823,
-3.516895, -2, -5.288463,
-3.701483, -2, -5.54823,
-3.516895, -1, -5.288463,
-3.701483, -1, -5.54823,
-3.516895, 0, -5.288463,
-3.701483, 0, -5.54823,
-3.516895, 1, -5.288463,
-3.701483, 1, -5.54823,
-3.516895, 2, -5.288463,
-3.701483, 2, -5.54823,
-3.516895, 3, -5.288463,
-3.701483, 3, -5.54823
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
-4.070661, -3, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, -3, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, -3, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, -3, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, -2, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, -2, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, -2, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, -2, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, -1, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, -1, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, -1, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, -1, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, 0, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, 0, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, 0, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, 0, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, 1, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, 1, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, 1, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, 1, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, 2, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, 2, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, 2, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, 2, -6.067764, 0, 1.5, 0.5, 0.5,
-4.070661, 3, -6.067764, 0, -0.5, 0.5, 0.5,
-4.070661, 3, -6.067764, 1, -0.5, 0.5, 0.5,
-4.070661, 3, -6.067764, 1, 1.5, 0.5, 0.5,
-4.070661, 3, -6.067764, 0, 1.5, 0.5, 0.5
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
-3.516895, -3.139381, -4,
-3.516895, -3.139381, 4,
-3.516895, -3.139381, -4,
-3.701483, -3.300469, -4,
-3.516895, -3.139381, -2,
-3.701483, -3.300469, -2,
-3.516895, -3.139381, 0,
-3.701483, -3.300469, 0,
-3.516895, -3.139381, 2,
-3.701483, -3.300469, 2,
-3.516895, -3.139381, 4,
-3.701483, -3.300469, 4
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
-4.070661, -3.622646, -4, 0, -0.5, 0.5, 0.5,
-4.070661, -3.622646, -4, 1, -0.5, 0.5, 0.5,
-4.070661, -3.622646, -4, 1, 1.5, 0.5, 0.5,
-4.070661, -3.622646, -4, 0, 1.5, 0.5, 0.5,
-4.070661, -3.622646, -2, 0, -0.5, 0.5, 0.5,
-4.070661, -3.622646, -2, 1, -0.5, 0.5, 0.5,
-4.070661, -3.622646, -2, 1, 1.5, 0.5, 0.5,
-4.070661, -3.622646, -2, 0, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 0, 0, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 0, 1, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 0, 1, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 0, 0, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 2, 0, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 2, 1, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 2, 1, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 2, 0, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 4, 0, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 4, 1, -0.5, 0.5, 0.5,
-4.070661, -3.622646, 4, 1, 1.5, 0.5, 0.5,
-4.070661, -3.622646, 4, 0, 1.5, 0.5, 0.5
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
-3.516895, -3.139381, -5.288463,
-3.516895, 3.304157, -5.288463,
-3.516895, -3.139381, 5.102231,
-3.516895, 3.304157, 5.102231,
-3.516895, -3.139381, -5.288463,
-3.516895, -3.139381, 5.102231,
-3.516895, 3.304157, -5.288463,
-3.516895, 3.304157, 5.102231,
-3.516895, -3.139381, -5.288463,
3.866645, -3.139381, -5.288463,
-3.516895, -3.139381, 5.102231,
3.866645, -3.139381, 5.102231,
-3.516895, 3.304157, -5.288463,
3.866645, 3.304157, -5.288463,
-3.516895, 3.304157, 5.102231,
3.866645, 3.304157, 5.102231,
3.866645, -3.139381, -5.288463,
3.866645, 3.304157, -5.288463,
3.866645, -3.139381, 5.102231,
3.866645, 3.304157, 5.102231,
3.866645, -3.139381, -5.288463,
3.866645, -3.139381, 5.102231,
3.866645, 3.304157, -5.288463,
3.866645, 3.304157, 5.102231
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
var radius = 7.626812;
var distance = 33.93255;
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
mvMatrix.translate( -0.1748749, -0.0823878, 0.09311581 );
mvMatrix.scale( 1.116843, 1.279772, 0.7936197 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.93255);
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
nicotine_product<-read.table("nicotine_product.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nicotine_product$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
y<-nicotine_product$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
```

```r
z<-nicotine_product$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicotine_product' not found
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
-3.409368, 1.160765, -1.343293, 0, 0, 1, 1, 1,
-3.125226, 0.2951921, -1.720154, 1, 0, 0, 1, 1,
-2.857401, 0.07702296, -1.866151, 1, 0, 0, 1, 1,
-2.827347, -0.02283988, -1.880589, 1, 0, 0, 1, 1,
-2.762667, -0.4191399, -2.357412, 1, 0, 0, 1, 1,
-2.644443, -1.707058, -1.92211, 1, 0, 0, 1, 1,
-2.604141, -0.3407649, -1.58675, 0, 0, 0, 1, 1,
-2.530427, -0.08815106, -2.123474, 0, 0, 0, 1, 1,
-2.443052, 0.5009286, -1.689704, 0, 0, 0, 1, 1,
-2.389958, 0.794791, -2.792872, 0, 0, 0, 1, 1,
-2.375767, -0.1501017, -1.989284, 0, 0, 0, 1, 1,
-2.333578, -0.6253772, -0.9278507, 0, 0, 0, 1, 1,
-2.309447, 2.070525, -0.9883427, 0, 0, 0, 1, 1,
-2.30478, 0.7814779, -1.567417, 1, 1, 1, 1, 1,
-2.280345, 1.32247, -1.882662, 1, 1, 1, 1, 1,
-2.254306, 0.5884628, -4.363085, 1, 1, 1, 1, 1,
-2.229255, 0.9102623, -1.952421, 1, 1, 1, 1, 1,
-2.207042, -0.3809788, -2.024349, 1, 1, 1, 1, 1,
-2.196151, 0.2063154, -1.617384, 1, 1, 1, 1, 1,
-2.190007, 0.34391, 0.4389146, 1, 1, 1, 1, 1,
-2.18113, 0.3457455, -0.5677048, 1, 1, 1, 1, 1,
-2.161789, -0.6592574, -3.168849, 1, 1, 1, 1, 1,
-2.157133, -1.241943, -2.983403, 1, 1, 1, 1, 1,
-2.087704, -1.363099, -2.226888, 1, 1, 1, 1, 1,
-2.076994, -0.6104233, -2.131078, 1, 1, 1, 1, 1,
-2.069778, -0.4821169, -0.09085469, 1, 1, 1, 1, 1,
-2.066296, 0.4133587, -1.04856, 1, 1, 1, 1, 1,
-2.05659, 1.597287, 0.05844997, 1, 1, 1, 1, 1,
-2.035927, 0.5188626, -2.795382, 0, 0, 1, 1, 1,
-2.018869, -0.1257753, -1.9109, 1, 0, 0, 1, 1,
-1.996156, 0.4171956, -0.1658363, 1, 0, 0, 1, 1,
-1.983941, -1.569831, -2.839044, 1, 0, 0, 1, 1,
-1.961867, 1.613912, -0.8314942, 1, 0, 0, 1, 1,
-1.920459, -0.186353, -1.961345, 1, 0, 0, 1, 1,
-1.899705, 1.185376, -0.8258172, 0, 0, 0, 1, 1,
-1.884497, 0.3469078, -0.8805276, 0, 0, 0, 1, 1,
-1.873167, -0.218389, -3.870335, 0, 0, 0, 1, 1,
-1.86335, -0.1058023, -0.8536291, 0, 0, 0, 1, 1,
-1.848483, 1.267525, -2.838732, 0, 0, 0, 1, 1,
-1.836372, 0.9747636, -2.758741, 0, 0, 0, 1, 1,
-1.817148, 0.7692304, -1.359511, 0, 0, 0, 1, 1,
-1.80575, -0.1180557, -2.411736, 1, 1, 1, 1, 1,
-1.781417, -1.467826, -1.050741, 1, 1, 1, 1, 1,
-1.767021, 0.3509994, -1.478442, 1, 1, 1, 1, 1,
-1.745322, 0.9593502, -1.084389, 1, 1, 1, 1, 1,
-1.741687, -0.999298, -4.023739, 1, 1, 1, 1, 1,
-1.732647, 1.723088, -1.379782, 1, 1, 1, 1, 1,
-1.708648, -0.6030457, -2.031009, 1, 1, 1, 1, 1,
-1.691779, 0.6524397, -0.542739, 1, 1, 1, 1, 1,
-1.684966, -0.1427397, -2.325769, 1, 1, 1, 1, 1,
-1.671338, 0.9859738, -1.498679, 1, 1, 1, 1, 1,
-1.65173, 0.01695843, -1.929365, 1, 1, 1, 1, 1,
-1.647717, -0.5684713, -1.96083, 1, 1, 1, 1, 1,
-1.638524, 0.2723206, -1.744218, 1, 1, 1, 1, 1,
-1.636303, -1.300891, -3.785014, 1, 1, 1, 1, 1,
-1.635155, 2.040003, -0.7441856, 1, 1, 1, 1, 1,
-1.631054, 0.4012115, -1.30079, 0, 0, 1, 1, 1,
-1.628273, -0.7724832, -2.125395, 1, 0, 0, 1, 1,
-1.614416, 0.3222036, 0.1249693, 1, 0, 0, 1, 1,
-1.604956, -0.8577294, 0.1050462, 1, 0, 0, 1, 1,
-1.599011, -0.7634259, -1.818164, 1, 0, 0, 1, 1,
-1.597824, -0.3543857, -1.811047, 1, 0, 0, 1, 1,
-1.595065, -1.050591, -1.609627, 0, 0, 0, 1, 1,
-1.580617, -0.7982816, -2.763663, 0, 0, 0, 1, 1,
-1.563043, 0.7486629, -2.155077, 0, 0, 0, 1, 1,
-1.561962, -0.01518868, -3.649316, 0, 0, 0, 1, 1,
-1.556082, 0.28292, 1.009978, 0, 0, 0, 1, 1,
-1.554664, 1.565358, -1.789941, 0, 0, 0, 1, 1,
-1.526065, 2.059187, 1.010897, 0, 0, 0, 1, 1,
-1.517893, 0.8084034, -0.4665595, 1, 1, 1, 1, 1,
-1.517455, -0.6702829, -3.293953, 1, 1, 1, 1, 1,
-1.515211, 0.7071326, 0.6157934, 1, 1, 1, 1, 1,
-1.51226, -0.5891593, -1.223288, 1, 1, 1, 1, 1,
-1.494384, -0.2506964, -1.978978, 1, 1, 1, 1, 1,
-1.492106, 0.7715941, -1.724123, 1, 1, 1, 1, 1,
-1.49199, -1.30035, -1.577237, 1, 1, 1, 1, 1,
-1.487253, 0.7792593, -0.6391695, 1, 1, 1, 1, 1,
-1.486045, 0.08469866, -0.5208454, 1, 1, 1, 1, 1,
-1.481666, 0.2763918, -1.031025, 1, 1, 1, 1, 1,
-1.471403, -0.5309822, -3.612139, 1, 1, 1, 1, 1,
-1.464853, 0.3857735, -0.8532714, 1, 1, 1, 1, 1,
-1.460138, -0.3838045, -1.407802, 1, 1, 1, 1, 1,
-1.457383, -0.0200648, -0.3892062, 1, 1, 1, 1, 1,
-1.454995, 0.2603313, -1.956723, 1, 1, 1, 1, 1,
-1.449133, 0.5511556, -0.540328, 0, 0, 1, 1, 1,
-1.448522, 0.6659877, -0.3211856, 1, 0, 0, 1, 1,
-1.418615, 0.2260994, -1.837462, 1, 0, 0, 1, 1,
-1.41383, -1.362366, -0.2215272, 1, 0, 0, 1, 1,
-1.410546, 1.117278, -2.35567, 1, 0, 0, 1, 1,
-1.407959, 0.01206834, -1.275994, 1, 0, 0, 1, 1,
-1.40759, 0.7620074, 0.2371498, 0, 0, 0, 1, 1,
-1.406102, -1.039108, -2.285659, 0, 0, 0, 1, 1,
-1.40607, 0.5741016, -0.3313895, 0, 0, 0, 1, 1,
-1.405102, -0.7832321, -3.276664, 0, 0, 0, 1, 1,
-1.400877, -0.9028845, -3.235574, 0, 0, 0, 1, 1,
-1.400409, 0.1493768, -1.208381, 0, 0, 0, 1, 1,
-1.395659, 0.1332789, -2.714183, 0, 0, 0, 1, 1,
-1.389761, -1.457449, -2.12065, 1, 1, 1, 1, 1,
-1.387205, 0.1786638, -3.222997, 1, 1, 1, 1, 1,
-1.365819, -0.772572, -1.737187, 1, 1, 1, 1, 1,
-1.353445, -0.8797768, -1.725547, 1, 1, 1, 1, 1,
-1.347275, 0.1175056, -2.737973, 1, 1, 1, 1, 1,
-1.301319, -0.5215198, -2.070662, 1, 1, 1, 1, 1,
-1.298324, 1.612664, -1.701184, 1, 1, 1, 1, 1,
-1.29258, -0.4233431, -3.345693, 1, 1, 1, 1, 1,
-1.28628, -0.08909644, -2.990642, 1, 1, 1, 1, 1,
-1.285657, 0.2012563, -0.1551351, 1, 1, 1, 1, 1,
-1.278517, 0.3003986, -1.499079, 1, 1, 1, 1, 1,
-1.275829, -0.2612734, -2.414203, 1, 1, 1, 1, 1,
-1.26891, 2.122569, 0.04970857, 1, 1, 1, 1, 1,
-1.267196, 1.238132, 0.857382, 1, 1, 1, 1, 1,
-1.266774, 1.051297, -0.5612937, 1, 1, 1, 1, 1,
-1.265257, -1.087152, -0.8705679, 0, 0, 1, 1, 1,
-1.264182, -1.312058, -1.612995, 1, 0, 0, 1, 1,
-1.258844, -0.1073188, -1.380683, 1, 0, 0, 1, 1,
-1.257198, -0.3508992, -2.674428, 1, 0, 0, 1, 1,
-1.246643, 0.3413405, -1.077137, 1, 0, 0, 1, 1,
-1.231462, 0.2362796, -1.494654, 1, 0, 0, 1, 1,
-1.217229, -1.617594, -2.917481, 0, 0, 0, 1, 1,
-1.211109, 0.7085522, -3.190114, 0, 0, 0, 1, 1,
-1.210386, -1.118652, -2.083715, 0, 0, 0, 1, 1,
-1.20373, -0.7197191, -2.283742, 0, 0, 0, 1, 1,
-1.200546, 1.078506, -0.2258939, 0, 0, 0, 1, 1,
-1.192941, 0.5301709, -0.9239302, 0, 0, 0, 1, 1,
-1.185346, 0.02202011, -1.368864, 0, 0, 0, 1, 1,
-1.184951, 0.150095, -3.714686, 1, 1, 1, 1, 1,
-1.182592, -1.023568, -1.984854, 1, 1, 1, 1, 1,
-1.17864, -1.230354, -0.9417166, 1, 1, 1, 1, 1,
-1.162462, 1.438228, -0.1711326, 1, 1, 1, 1, 1,
-1.154595, -2.205458, -2.990495, 1, 1, 1, 1, 1,
-1.151537, -0.06959791, -2.668272, 1, 1, 1, 1, 1,
-1.149826, -1.694986, -2.601988, 1, 1, 1, 1, 1,
-1.144151, -0.2670914, -1.380922, 1, 1, 1, 1, 1,
-1.142781, 0.3186176, -1.735724, 1, 1, 1, 1, 1,
-1.14051, -0.2455056, -0.01069419, 1, 1, 1, 1, 1,
-1.139376, -0.4937514, -2.127439, 1, 1, 1, 1, 1,
-1.138945, -0.7091537, -3.042427, 1, 1, 1, 1, 1,
-1.134662, 0.1174887, -3.52123, 1, 1, 1, 1, 1,
-1.128868, 0.04017146, -2.8579, 1, 1, 1, 1, 1,
-1.122602, -1.8483, -3.02774, 1, 1, 1, 1, 1,
-1.12113, -0.8971986, -2.369947, 0, 0, 1, 1, 1,
-1.111922, -0.6469562, -1.526166, 1, 0, 0, 1, 1,
-1.107324, 0.1867595, -1.702528, 1, 0, 0, 1, 1,
-1.105264, 0.2778255, -2.336824, 1, 0, 0, 1, 1,
-1.10459, -0.532957, -1.940606, 1, 0, 0, 1, 1,
-1.104278, 1.169054, -1.600441, 1, 0, 0, 1, 1,
-1.103349, 0.03824228, -2.555937, 0, 0, 0, 1, 1,
-1.093229, 0.3841087, -1.973841, 0, 0, 0, 1, 1,
-1.085129, 0.4125045, -0.3153517, 0, 0, 0, 1, 1,
-1.076872, 0.04331504, -1.732783, 0, 0, 0, 1, 1,
-1.075875, -1.391984, -2.366176, 0, 0, 0, 1, 1,
-1.064763, -2.25411, -3.034977, 0, 0, 0, 1, 1,
-1.051111, 0.1883932, -1.057917, 0, 0, 0, 1, 1,
-1.034841, -0.6402918, -1.111107, 1, 1, 1, 1, 1,
-1.033029, -0.3224856, -2.922182, 1, 1, 1, 1, 1,
-1.027659, -1.633229, -4.847676, 1, 1, 1, 1, 1,
-1.027104, 0.9608228, -0.5441306, 1, 1, 1, 1, 1,
-1.024663, -1.726536, -2.797514, 1, 1, 1, 1, 1,
-1.022113, 1.016858, -0.2247032, 1, 1, 1, 1, 1,
-1.015447, -1.842551, -1.451768, 1, 1, 1, 1, 1,
-1.011213, 1.076503, 0.3703779, 1, 1, 1, 1, 1,
-1.00511, 0.01257119, -1.41144, 1, 1, 1, 1, 1,
-1.001571, 0.5947556, -1.961517, 1, 1, 1, 1, 1,
-0.9970773, -0.3973266, -2.711991, 1, 1, 1, 1, 1,
-0.9886974, -1.190892, -2.458364, 1, 1, 1, 1, 1,
-0.9886501, -0.7023549, -1.050903, 1, 1, 1, 1, 1,
-0.9852151, 1.84395, 0.1727772, 1, 1, 1, 1, 1,
-0.9796094, -2.015728, -2.224236, 1, 1, 1, 1, 1,
-0.9641037, 1.232729, -1.78581, 0, 0, 1, 1, 1,
-0.9614356, 1.102228, -0.4144941, 1, 0, 0, 1, 1,
-0.9574912, 1.737691, -0.782281, 1, 0, 0, 1, 1,
-0.9561693, 0.4832767, 0.4376045, 1, 0, 0, 1, 1,
-0.955765, 0.07012622, -2.236248, 1, 0, 0, 1, 1,
-0.9516113, -0.6293502, -2.910204, 1, 0, 0, 1, 1,
-0.9482048, 2.009088, 0.1051433, 0, 0, 0, 1, 1,
-0.9395881, -0.1631563, -2.263798, 0, 0, 0, 1, 1,
-0.9371091, -1.023409, -2.756741, 0, 0, 0, 1, 1,
-0.935789, -1.146308, -3.356455, 0, 0, 0, 1, 1,
-0.9344868, 0.5590267, -2.631296, 0, 0, 0, 1, 1,
-0.9301741, -0.4040634, -1.667222, 0, 0, 0, 1, 1,
-0.9261755, 0.6302276, -0.9486647, 0, 0, 0, 1, 1,
-0.9227791, 1.153791, -1.471369, 1, 1, 1, 1, 1,
-0.9202852, -2.411144, -2.19649, 1, 1, 1, 1, 1,
-0.9188818, -1.008688, -3.305145, 1, 1, 1, 1, 1,
-0.9173238, 0.9170725, -1.081034, 1, 1, 1, 1, 1,
-0.9125727, 0.3249779, -1.763923, 1, 1, 1, 1, 1,
-0.9125161, -1.250433, -2.992377, 1, 1, 1, 1, 1,
-0.910686, 1.350045, -0.7318184, 1, 1, 1, 1, 1,
-0.9105459, -1.036602, -3.069201, 1, 1, 1, 1, 1,
-0.9086227, -2.369366, -2.105778, 1, 1, 1, 1, 1,
-0.9054596, 0.1577634, -1.48237, 1, 1, 1, 1, 1,
-0.9027508, 0.2106975, -0.5456038, 1, 1, 1, 1, 1,
-0.9016436, -0.7439085, -2.73832, 1, 1, 1, 1, 1,
-0.8966349, 0.609035, -0.8823588, 1, 1, 1, 1, 1,
-0.8960678, -0.42268, -3.696819, 1, 1, 1, 1, 1,
-0.8957812, 1.541693, -0.2226965, 1, 1, 1, 1, 1,
-0.8946563, 1.380219, -1.02466, 0, 0, 1, 1, 1,
-0.8933458, -0.4785993, -0.9682767, 1, 0, 0, 1, 1,
-0.8893942, 0.7101578, -1.025187, 1, 0, 0, 1, 1,
-0.8797545, 0.7052814, -2.206463, 1, 0, 0, 1, 1,
-0.8774069, -0.04439218, -0.6490321, 1, 0, 0, 1, 1,
-0.8742199, -0.1245886, -0.8238068, 1, 0, 0, 1, 1,
-0.8722091, -0.9576176, -3.374573, 0, 0, 0, 1, 1,
-0.8624117, -1.37652, -2.084636, 0, 0, 0, 1, 1,
-0.8535705, -1.313497, -2.664732, 0, 0, 0, 1, 1,
-0.8518313, 0.9653792, -0.7269267, 0, 0, 0, 1, 1,
-0.8514424, -1.095057, -2.499852, 0, 0, 0, 1, 1,
-0.8480408, 0.5773035, 0.3463836, 0, 0, 0, 1, 1,
-0.8263005, 0.5294896, 0.1662658, 0, 0, 0, 1, 1,
-0.8190723, 1.214886, -1.504449, 1, 1, 1, 1, 1,
-0.8154812, 0.5039344, -2.071052, 1, 1, 1, 1, 1,
-0.8147786, -0.07944573, -0.2534986, 1, 1, 1, 1, 1,
-0.8138868, -0.1678212, -1.998319, 1, 1, 1, 1, 1,
-0.8135213, 0.9028741, -1.348597, 1, 1, 1, 1, 1,
-0.8129487, -1.324655, -2.717833, 1, 1, 1, 1, 1,
-0.8122852, -1.02276, -3.512574, 1, 1, 1, 1, 1,
-0.8091461, -0.09102688, -0.3924693, 1, 1, 1, 1, 1,
-0.8083882, 0.258942, -1.008494, 1, 1, 1, 1, 1,
-0.8055053, 1.789509, -0.2982265, 1, 1, 1, 1, 1,
-0.8054658, 1.331822, -1.469954, 1, 1, 1, 1, 1,
-0.8024691, 0.1089341, -0.7155435, 1, 1, 1, 1, 1,
-0.7998422, 0.6429518, 0.7801341, 1, 1, 1, 1, 1,
-0.7934287, -1.95219, -1.3042, 1, 1, 1, 1, 1,
-0.7932995, -0.2226679, -1.748492, 1, 1, 1, 1, 1,
-0.7931722, -1.074331, -3.160632, 0, 0, 1, 1, 1,
-0.7916266, 0.2004841, -1.122944, 1, 0, 0, 1, 1,
-0.7879565, -0.04203047, -3.909256, 1, 0, 0, 1, 1,
-0.7842563, 0.94553, 0.3460145, 1, 0, 0, 1, 1,
-0.7807209, -0.8910257, -1.564853, 1, 0, 0, 1, 1,
-0.780593, -1.370917, -2.303617, 1, 0, 0, 1, 1,
-0.7747742, 0.6324861, -0.04663417, 0, 0, 0, 1, 1,
-0.7741004, -0.06560963, -3.336866, 0, 0, 0, 1, 1,
-0.7739003, 0.3565092, -2.323755, 0, 0, 0, 1, 1,
-0.7731225, -0.4434536, -1.15648, 0, 0, 0, 1, 1,
-0.7721087, 2.420809, -0.5609524, 0, 0, 0, 1, 1,
-0.7709249, 0.5777007, -0.7299498, 0, 0, 0, 1, 1,
-0.7690707, 1.044683, 0.114555, 0, 0, 0, 1, 1,
-0.7644374, -1.484835, -2.988882, 1, 1, 1, 1, 1,
-0.7641457, -0.09501468, -0.6361243, 1, 1, 1, 1, 1,
-0.7615035, 1.140272, -2.242431, 1, 1, 1, 1, 1,
-0.7587669, -0.8274948, -2.921916, 1, 1, 1, 1, 1,
-0.7555604, 1.281474, -1.507804, 1, 1, 1, 1, 1,
-0.754374, -1.618205, -3.606539, 1, 1, 1, 1, 1,
-0.7366223, 0.7597154, 0.174347, 1, 1, 1, 1, 1,
-0.7362115, 0.1503341, -3.644859, 1, 1, 1, 1, 1,
-0.7348016, -1.352366, -2.345867, 1, 1, 1, 1, 1,
-0.7299765, -0.6984217, -3.942234, 1, 1, 1, 1, 1,
-0.7283143, 0.9758978, -0.6803012, 1, 1, 1, 1, 1,
-0.7188534, -0.4867227, -2.081361, 1, 1, 1, 1, 1,
-0.7153404, 1.294473, -1.851351, 1, 1, 1, 1, 1,
-0.7114052, 0.8235658, -1.589372, 1, 1, 1, 1, 1,
-0.7096638, -0.0888521, 0.5124879, 1, 1, 1, 1, 1,
-0.6972065, 1.018314, -2.031342, 0, 0, 1, 1, 1,
-0.6966521, 0.2991602, -2.962806, 1, 0, 0, 1, 1,
-0.6960248, -0.1383232, -1.803535, 1, 0, 0, 1, 1,
-0.6951508, -0.6953169, -3.468815, 1, 0, 0, 1, 1,
-0.6927737, -2.370373, -2.982158, 1, 0, 0, 1, 1,
-0.6926869, -1.434266, -3.099196, 1, 0, 0, 1, 1,
-0.6808104, 0.7740767, 0.5913659, 0, 0, 0, 1, 1,
-0.6747474, -2.107998, -2.142382, 0, 0, 0, 1, 1,
-0.6710037, -1.554407, -4.693002, 0, 0, 0, 1, 1,
-0.6689301, -0.1223906, -3.602685, 0, 0, 0, 1, 1,
-0.6680871, -0.5554551, -3.068226, 0, 0, 0, 1, 1,
-0.6565976, -0.2538868, -2.402127, 0, 0, 0, 1, 1,
-0.6540235, 0.3980824, -1.568758, 0, 0, 0, 1, 1,
-0.6522268, 1.359419, -1.57956, 1, 1, 1, 1, 1,
-0.6517871, 1.672812, -0.05446097, 1, 1, 1, 1, 1,
-0.6466261, -0.5452839, -2.641829, 1, 1, 1, 1, 1,
-0.6454318, 1.253045, -0.3663295, 1, 1, 1, 1, 1,
-0.6391662, 0.1297858, 0.06644832, 1, 1, 1, 1, 1,
-0.6391414, 0.3970474, -1.426185, 1, 1, 1, 1, 1,
-0.6376392, -0.4706462, -1.46765, 1, 1, 1, 1, 1,
-0.6263655, 0.8763011, -1.563695, 1, 1, 1, 1, 1,
-0.6235404, 1.945005, -0.5780975, 1, 1, 1, 1, 1,
-0.6223127, -0.6508865, -2.790194, 1, 1, 1, 1, 1,
-0.6090443, -0.2302346, -3.090638, 1, 1, 1, 1, 1,
-0.6068153, -0.4779984, -2.793822, 1, 1, 1, 1, 1,
-0.6021512, -0.6454353, -1.91906, 1, 1, 1, 1, 1,
-0.6012686, 1.457278, -1.160227, 1, 1, 1, 1, 1,
-0.596476, 0.6038874, -1.279476, 1, 1, 1, 1, 1,
-0.5942173, 0.8679164, -0.5200107, 0, 0, 1, 1, 1,
-0.5933649, -0.7387769, -2.73478, 1, 0, 0, 1, 1,
-0.5883353, -0.81054, -2.386352, 1, 0, 0, 1, 1,
-0.5831558, -0.8926214, -2.863736, 1, 0, 0, 1, 1,
-0.5781215, 0.3674911, -1.423373, 1, 0, 0, 1, 1,
-0.5712879, -0.3637578, -1.807806, 1, 0, 0, 1, 1,
-0.5704654, 1.014934, -0.05456102, 0, 0, 0, 1, 1,
-0.568886, 0.2218985, -1.318716, 0, 0, 0, 1, 1,
-0.5676462, -0.9854244, -3.895891, 0, 0, 0, 1, 1,
-0.5621859, 1.105724, 0.854852, 0, 0, 0, 1, 1,
-0.5584123, 2.077507, -0.2451164, 0, 0, 0, 1, 1,
-0.5577562, -0.1429535, -0.1820457, 0, 0, 0, 1, 1,
-0.5559876, -0.6263116, -1.253293, 0, 0, 0, 1, 1,
-0.5536786, -0.6717921, -1.602424, 1, 1, 1, 1, 1,
-0.5459348, 0.2303824, -1.650147, 1, 1, 1, 1, 1,
-0.5450453, 1.703339, -0.2168297, 1, 1, 1, 1, 1,
-0.5440415, 1.987163, -0.4138089, 1, 1, 1, 1, 1,
-0.5424135, -0.7775349, -3.694868, 1, 1, 1, 1, 1,
-0.5385237, -1.087874, -3.434645, 1, 1, 1, 1, 1,
-0.5334389, 0.6859508, 0.2554728, 1, 1, 1, 1, 1,
-0.5293213, -0.7906741, -3.17588, 1, 1, 1, 1, 1,
-0.5279726, -1.333754, -2.917892, 1, 1, 1, 1, 1,
-0.5252768, -0.321477, -1.758801, 1, 1, 1, 1, 1,
-0.5217853, 0.5372542, -1.403803, 1, 1, 1, 1, 1,
-0.5210037, -1.095367, -2.536686, 1, 1, 1, 1, 1,
-0.5191587, -0.1389754, -2.196017, 1, 1, 1, 1, 1,
-0.5186471, 1.08811, 0.1565702, 1, 1, 1, 1, 1,
-0.5148657, -0.4444769, -2.494386, 1, 1, 1, 1, 1,
-0.5116984, 1.180622, 1.405918, 0, 0, 1, 1, 1,
-0.5113288, 0.1395658, -1.698857, 1, 0, 0, 1, 1,
-0.5107123, -1.430034, -2.189554, 1, 0, 0, 1, 1,
-0.5088416, 1.366125, -0.2177624, 1, 0, 0, 1, 1,
-0.5084378, 0.2667676, -0.06293696, 1, 0, 0, 1, 1,
-0.5039241, -0.6533086, -2.574874, 1, 0, 0, 1, 1,
-0.5037188, 1.326081, -0.6262072, 0, 0, 0, 1, 1,
-0.5033237, -0.6136159, -1.530118, 0, 0, 0, 1, 1,
-0.4985059, -0.9242349, -3.042282, 0, 0, 0, 1, 1,
-0.4928735, 0.4336254, -1.187074, 0, 0, 0, 1, 1,
-0.4868672, -0.8961459, -1.349439, 0, 0, 0, 1, 1,
-0.486562, 0.295122, -0.801965, 0, 0, 0, 1, 1,
-0.4819264, 1.648899, -1.020642, 0, 0, 0, 1, 1,
-0.4772136, -0.3953278, -1.906856, 1, 1, 1, 1, 1,
-0.4767714, 0.2256307, -3.355923, 1, 1, 1, 1, 1,
-0.4738764, 0.2795461, -2.317986, 1, 1, 1, 1, 1,
-0.473603, -0.8720422, -2.002348, 1, 1, 1, 1, 1,
-0.4732177, 0.3335146, -1.281459, 1, 1, 1, 1, 1,
-0.4698348, 0.1701997, -0.8351325, 1, 1, 1, 1, 1,
-0.4629416, 1.455456, 0.02185166, 1, 1, 1, 1, 1,
-0.4618754, 0.3177132, 0.8445071, 1, 1, 1, 1, 1,
-0.4599536, 0.5888251, -0.9744157, 1, 1, 1, 1, 1,
-0.4590905, -2.07094, -4.151414, 1, 1, 1, 1, 1,
-0.4555893, 0.6526592, -0.05423192, 1, 1, 1, 1, 1,
-0.4541579, -0.6004153, -2.992747, 1, 1, 1, 1, 1,
-0.4529397, -0.8067572, -1.8374, 1, 1, 1, 1, 1,
-0.4514559, 0.4282441, -1.485263, 1, 1, 1, 1, 1,
-0.4474146, 0.08615933, -1.910892, 1, 1, 1, 1, 1,
-0.4439167, 1.232787, -1.169523, 0, 0, 1, 1, 1,
-0.4436465, -1.444333, -2.409122, 1, 0, 0, 1, 1,
-0.4420014, -0.6642522, -2.854028, 1, 0, 0, 1, 1,
-0.4388279, 0.849114, -0.2539355, 1, 0, 0, 1, 1,
-0.4379116, -1.124551, -1.420106, 1, 0, 0, 1, 1,
-0.4360003, -1.255509, -3.496311, 1, 0, 0, 1, 1,
-0.431361, 0.08806162, -1.740737, 0, 0, 0, 1, 1,
-0.4306307, 0.8524731, -0.8221391, 0, 0, 0, 1, 1,
-0.427388, 1.047542, -0.8469457, 0, 0, 0, 1, 1,
-0.4250852, -0.5117749, -2.673168, 0, 0, 0, 1, 1,
-0.4247767, -2.133185, -4.569182, 0, 0, 0, 1, 1,
-0.4242188, -0.3737998, -3.054535, 0, 0, 0, 1, 1,
-0.4212312, -0.3801193, -1.209295, 0, 0, 0, 1, 1,
-0.4194133, 0.09679432, -0.429134, 1, 1, 1, 1, 1,
-0.4086732, 1.448315, -0.7738273, 1, 1, 1, 1, 1,
-0.4086414, 0.5252994, -0.4243853, 1, 1, 1, 1, 1,
-0.4065276, -1.354269, -2.721368, 1, 1, 1, 1, 1,
-0.403116, -0.05859624, -0.489138, 1, 1, 1, 1, 1,
-0.4020646, -0.5482997, -3.720581, 1, 1, 1, 1, 1,
-0.4018845, 0.3856002, -1.655184, 1, 1, 1, 1, 1,
-0.3951634, -0.6152086, -2.556584, 1, 1, 1, 1, 1,
-0.3926538, -0.6219323, -0.6020039, 1, 1, 1, 1, 1,
-0.3896552, -0.7666941, -3.121055, 1, 1, 1, 1, 1,
-0.3834979, -2.264081, -3.361607, 1, 1, 1, 1, 1,
-0.3819217, 0.6925336, -1.015009, 1, 1, 1, 1, 1,
-0.3794377, 1.9592, 0.473959, 1, 1, 1, 1, 1,
-0.3760143, 0.1115985, -0.5170044, 1, 1, 1, 1, 1,
-0.3756099, 0.1396679, -3.319307, 1, 1, 1, 1, 1,
-0.3748024, 1.358737, -0.3115501, 0, 0, 1, 1, 1,
-0.3708226, -0.9559938, -1.588594, 1, 0, 0, 1, 1,
-0.3684077, -1.320581, -2.784626, 1, 0, 0, 1, 1,
-0.3633496, 0.6145486, 0.04605252, 1, 0, 0, 1, 1,
-0.359572, -0.9137742, -3.088912, 1, 0, 0, 1, 1,
-0.3593857, 0.803126, -0.07369132, 1, 0, 0, 1, 1,
-0.3587601, -0.07823032, -2.801008, 0, 0, 0, 1, 1,
-0.357258, 0.6326004, 0.7386437, 0, 0, 0, 1, 1,
-0.3550946, -0.9460518, -2.316165, 0, 0, 0, 1, 1,
-0.35507, -0.3385264, -2.189364, 0, 0, 0, 1, 1,
-0.354693, -0.7315475, -2.351022, 0, 0, 0, 1, 1,
-0.3539754, 0.3198204, -0.8887303, 0, 0, 0, 1, 1,
-0.3516264, 1.32739, 1.816274, 0, 0, 0, 1, 1,
-0.349712, 1.436477, -0.540271, 1, 1, 1, 1, 1,
-0.349266, -0.1899018, -3.490831, 1, 1, 1, 1, 1,
-0.3484213, 0.7418915, -0.5597203, 1, 1, 1, 1, 1,
-0.3473705, -0.2511192, -3.114357, 1, 1, 1, 1, 1,
-0.3462316, 0.7138765, -2.130967, 1, 1, 1, 1, 1,
-0.3437084, -1.481241, -4.828358, 1, 1, 1, 1, 1,
-0.343483, 2.329362, -0.02953956, 1, 1, 1, 1, 1,
-0.3417664, -0.704756, -3.553465, 1, 1, 1, 1, 1,
-0.3407451, -0.04862292, -1.240258, 1, 1, 1, 1, 1,
-0.3390655, 0.5392061, -1.173017, 1, 1, 1, 1, 1,
-0.3324944, -0.6773088, -3.567794, 1, 1, 1, 1, 1,
-0.3303654, -0.180452, -2.200756, 1, 1, 1, 1, 1,
-0.3303247, -0.07863131, -1.671458, 1, 1, 1, 1, 1,
-0.3272857, 0.05351555, -2.751667, 1, 1, 1, 1, 1,
-0.3270926, 1.11507, -0.5136686, 1, 1, 1, 1, 1,
-0.3266294, -1.615078, -2.584069, 0, 0, 1, 1, 1,
-0.3249545, 0.1713607, -0.5233223, 1, 0, 0, 1, 1,
-0.3236558, -0.9440651, -2.273141, 1, 0, 0, 1, 1,
-0.3211833, 0.5080776, -0.7631717, 1, 0, 0, 1, 1,
-0.3205561, 0.2170866, -0.3446665, 1, 0, 0, 1, 1,
-0.3198937, 2.006404, 0.5373452, 1, 0, 0, 1, 1,
-0.3188548, -0.263202, -1.195578, 0, 0, 0, 1, 1,
-0.3179041, -1.262574, -3.250319, 0, 0, 0, 1, 1,
-0.313173, 1.585085, -0.02442296, 0, 0, 0, 1, 1,
-0.3128685, -1.079373, -4.321172, 0, 0, 0, 1, 1,
-0.3101588, -1.553384, -1.099216, 0, 0, 0, 1, 1,
-0.3096231, -0.7530993, -2.111013, 0, 0, 0, 1, 1,
-0.3075675, -1.340037, -1.723177, 0, 0, 0, 1, 1,
-0.3071465, -0.301536, -2.449518, 1, 1, 1, 1, 1,
-0.2999602, 1.488756, 2.412355, 1, 1, 1, 1, 1,
-0.2976864, 0.4603573, 1.946195, 1, 1, 1, 1, 1,
-0.2955356, 0.672735, -1.006344, 1, 1, 1, 1, 1,
-0.2948957, 2.070993, 0.09148245, 1, 1, 1, 1, 1,
-0.2947756, 0.1472366, -2.21472, 1, 1, 1, 1, 1,
-0.2926175, 0.3619073, -2.35094, 1, 1, 1, 1, 1,
-0.2921601, -1.348302, -0.4561194, 1, 1, 1, 1, 1,
-0.2918635, -0.2151607, -0.3840541, 1, 1, 1, 1, 1,
-0.2911072, -1.103322, -3.861201, 1, 1, 1, 1, 1,
-0.2881803, -0.757184, -3.327646, 1, 1, 1, 1, 1,
-0.2835446, 0.6739529, -0.3333663, 1, 1, 1, 1, 1,
-0.2826545, -0.6259573, -1.270024, 1, 1, 1, 1, 1,
-0.2821378, 0.2822765, -1.573211, 1, 1, 1, 1, 1,
-0.2808299, 0.960874, -0.7201357, 1, 1, 1, 1, 1,
-0.2768438, 1.247384, -1.062433, 0, 0, 1, 1, 1,
-0.2649783, -2.001218, -4.095757, 1, 0, 0, 1, 1,
-0.2561052, -0.8058879, -3.812366, 1, 0, 0, 1, 1,
-0.254327, 1.25114, 0.9230351, 1, 0, 0, 1, 1,
-0.2532034, 0.6076313, 0.3780035, 1, 0, 0, 1, 1,
-0.2503157, 0.6938705, -0.3833915, 1, 0, 0, 1, 1,
-0.2493078, 1.69637, -1.892573, 0, 0, 0, 1, 1,
-0.2280809, -0.9954326, -2.894796, 0, 0, 0, 1, 1,
-0.2258837, 1.377607, 0.8452588, 0, 0, 0, 1, 1,
-0.2234145, 1.788294, -1.480624, 0, 0, 0, 1, 1,
-0.2161192, -0.5239512, -2.137152, 0, 0, 0, 1, 1,
-0.215044, -2.283782, -1.976614, 0, 0, 0, 1, 1,
-0.208282, -0.4855323, -3.239347, 0, 0, 0, 1, 1,
-0.2077883, -0.2494832, -3.05384, 1, 1, 1, 1, 1,
-0.2019807, 0.962512, 2.32579, 1, 1, 1, 1, 1,
-0.2003308, -1.199788, -5.137142, 1, 1, 1, 1, 1,
-0.1980722, -1.28407, -2.959871, 1, 1, 1, 1, 1,
-0.1973487, -0.6648272, -2.9206, 1, 1, 1, 1, 1,
-0.1958235, 0.6157714, -0.2266935, 1, 1, 1, 1, 1,
-0.1881671, -1.526848, -3.239048, 1, 1, 1, 1, 1,
-0.1859604, 1.173833, -0.06329505, 1, 1, 1, 1, 1,
-0.1831429, -0.5196436, -2.716906, 1, 1, 1, 1, 1,
-0.1757349, 1.405754, -0.6238154, 1, 1, 1, 1, 1,
-0.1749412, 0.1565577, -1.883773, 1, 1, 1, 1, 1,
-0.1747723, 1.02228, 0.4280957, 1, 1, 1, 1, 1,
-0.171012, -0.5173062, -3.652258, 1, 1, 1, 1, 1,
-0.1685639, -0.5915449, -2.571235, 1, 1, 1, 1, 1,
-0.1640998, -0.1753169, -1.85973, 1, 1, 1, 1, 1,
-0.1612452, -0.00163037, -2.504668, 0, 0, 1, 1, 1,
-0.161062, -0.1020518, -2.728107, 1, 0, 0, 1, 1,
-0.1608719, -1.137146, -4.275664, 1, 0, 0, 1, 1,
-0.1578481, 0.1782913, -2.146965, 1, 0, 0, 1, 1,
-0.1567154, 1.597748, 0.5148695, 1, 0, 0, 1, 1,
-0.155408, -0.1790434, -1.525849, 1, 0, 0, 1, 1,
-0.1539793, -0.1284582, -1.381952, 0, 0, 0, 1, 1,
-0.1534482, -0.5242796, -1.221363, 0, 0, 0, 1, 1,
-0.153106, 1.514239, -0.5570429, 0, 0, 0, 1, 1,
-0.1464088, 0.5343024, -0.5827487, 0, 0, 0, 1, 1,
-0.144959, 1.064031, -0.08907261, 0, 0, 0, 1, 1,
-0.1438449, 2.110073, -0.3032675, 0, 0, 0, 1, 1,
-0.1411062, -0.6237796, -5.105201, 0, 0, 0, 1, 1,
-0.1351755, 0.8037592, -0.3916688, 1, 1, 1, 1, 1,
-0.1122972, -0.4815204, -2.231399, 1, 1, 1, 1, 1,
-0.1080825, -0.390142, -2.140582, 1, 1, 1, 1, 1,
-0.1059711, -0.6394399, -0.6994321, 1, 1, 1, 1, 1,
-0.1037932, -2.970423, -2.315021, 1, 1, 1, 1, 1,
-0.09956317, -1.010852, -1.971877, 1, 1, 1, 1, 1,
-0.09796843, -1.15671, -2.231721, 1, 1, 1, 1, 1,
-0.09241102, -0.7723299, -1.726758, 1, 1, 1, 1, 1,
-0.09126139, 0.06263314, -0.9336978, 1, 1, 1, 1, 1,
-0.0908115, 1.326737, 0.009032606, 1, 1, 1, 1, 1,
-0.08839778, -0.5104325, -2.135128, 1, 1, 1, 1, 1,
-0.08657553, 0.3587812, 0.1688147, 1, 1, 1, 1, 1,
-0.08226629, 0.1331208, -0.6397114, 1, 1, 1, 1, 1,
-0.07820994, -0.7082412, -3.824075, 1, 1, 1, 1, 1,
-0.07730189, 0.1817712, -1.699888, 1, 1, 1, 1, 1,
-0.07674166, -1.364094, -3.851928, 0, 0, 1, 1, 1,
-0.07568614, 0.1894184, 1.45387, 1, 0, 0, 1, 1,
-0.07420573, -1.457302, -3.509253, 1, 0, 0, 1, 1,
-0.071422, 0.8214816, 0.8648366, 1, 0, 0, 1, 1,
-0.07025515, -0.7626622, -3.597535, 1, 0, 0, 1, 1,
-0.06821036, 1.135447, -0.5214778, 1, 0, 0, 1, 1,
-0.06708602, 0.1164962, 0.06250634, 0, 0, 0, 1, 1,
-0.06251933, 0.187612, 1.14009, 0, 0, 0, 1, 1,
-0.06157533, 1.728688, 0.5846446, 0, 0, 0, 1, 1,
-0.0605089, -1.368017, -3.082435, 0, 0, 0, 1, 1,
-0.05944758, 0.9937776, -0.4055995, 0, 0, 0, 1, 1,
-0.05678308, 1.837722, -1.40645, 0, 0, 0, 1, 1,
-0.05419119, -2.245017, -3.148749, 0, 0, 0, 1, 1,
-0.05313188, -0.5643376, -2.594502, 1, 1, 1, 1, 1,
-0.05220535, -2.133082, -2.578157, 1, 1, 1, 1, 1,
-0.05147128, -0.09171782, -3.407521, 1, 1, 1, 1, 1,
-0.04747805, -0.4898021, -2.782257, 1, 1, 1, 1, 1,
-0.0374409, -0.3119772, -3.537932, 1, 1, 1, 1, 1,
-0.03634623, 2.429902, -0.4302508, 1, 1, 1, 1, 1,
-0.03613508, -0.9086212, -3.362513, 1, 1, 1, 1, 1,
-0.02913231, -0.1237474, -2.949022, 1, 1, 1, 1, 1,
-0.02253574, 0.1316146, 0.6941067, 1, 1, 1, 1, 1,
-0.01695432, -0.3691738, -3.661754, 1, 1, 1, 1, 1,
-0.01423843, -0.6579762, -3.102071, 1, 1, 1, 1, 1,
-0.01028256, -0.1876698, -4.029088, 1, 1, 1, 1, 1,
-0.00345048, 0.6771434, -0.254905, 1, 1, 1, 1, 1,
-0.002195334, -1.040087, -3.758949, 1, 1, 1, 1, 1,
-0.002106513, -0.1112801, -3.698601, 1, 1, 1, 1, 1,
0.001780442, -1.017742, 4.654697, 0, 0, 1, 1, 1,
0.005952911, 0.2347445, 0.4816262, 1, 0, 0, 1, 1,
0.006353984, -0.5207057, 3.605435, 1, 0, 0, 1, 1,
0.006950836, 0.2974559, -0.6939796, 1, 0, 0, 1, 1,
0.007787984, 0.08255994, -1.884943, 1, 0, 0, 1, 1,
0.009834751, 1.234973, 1.086753, 1, 0, 0, 1, 1,
0.01415175, -0.6651288, 4.539186, 0, 0, 0, 1, 1,
0.01497747, -1.2876, 3.683542, 0, 0, 0, 1, 1,
0.01612805, -0.4992474, 2.726237, 0, 0, 0, 1, 1,
0.0266096, 1.069418, -1.714639, 0, 0, 0, 1, 1,
0.02952573, 0.08024515, 0.4505362, 0, 0, 0, 1, 1,
0.02966162, -1.35445, 2.603574, 0, 0, 0, 1, 1,
0.03023662, 0.8278781, 1.970474, 0, 0, 0, 1, 1,
0.03325695, -0.3622763, 2.954365, 1, 1, 1, 1, 1,
0.03491072, 0.608811, -1.662925, 1, 1, 1, 1, 1,
0.03633681, 0.2456489, -0.07009834, 1, 1, 1, 1, 1,
0.04052568, 1.753258, -1.218718, 1, 1, 1, 1, 1,
0.04114072, 1.582811, -1.645841, 1, 1, 1, 1, 1,
0.04440215, -0.1038828, 3.367358, 1, 1, 1, 1, 1,
0.04773658, 1.305259, 0.8862405, 1, 1, 1, 1, 1,
0.04905571, 1.079211, -1.321771, 1, 1, 1, 1, 1,
0.05803885, 0.554389, 1.987764, 1, 1, 1, 1, 1,
0.06049864, -0.1812819, 3.304991, 1, 1, 1, 1, 1,
0.06416818, -0.3741365, 3.648367, 1, 1, 1, 1, 1,
0.06743664, 0.2158038, 1.969763, 1, 1, 1, 1, 1,
0.06935646, 0.6508625, 0.454715, 1, 1, 1, 1, 1,
0.071307, -1.319222, 1.810154, 1, 1, 1, 1, 1,
0.07158694, 0.7023679, -0.2126659, 1, 1, 1, 1, 1,
0.07211336, -0.1737618, 4.233878, 0, 0, 1, 1, 1,
0.07906643, -0.1879251, 1.204056, 1, 0, 0, 1, 1,
0.08277448, -0.7356259, 3.296938, 1, 0, 0, 1, 1,
0.08559003, -0.1956268, 2.875176, 1, 0, 0, 1, 1,
0.09025659, 1.573158, -1.203859, 1, 0, 0, 1, 1,
0.09132925, 0.0813875, -0.7370111, 1, 0, 0, 1, 1,
0.09198394, -0.1562689, 1.744848, 0, 0, 0, 1, 1,
0.09198862, -0.00325954, 0.9210727, 0, 0, 0, 1, 1,
0.09460144, 0.9406746, 1.066441, 0, 0, 0, 1, 1,
0.09661827, -2.290791, 2.773605, 0, 0, 0, 1, 1,
0.09916139, 0.2915523, 0.8569887, 0, 0, 0, 1, 1,
0.09927382, -0.1900533, 1.359476, 0, 0, 0, 1, 1,
0.1001945, 1.080726, -0.5794964, 0, 0, 0, 1, 1,
0.102022, -0.4993464, 3.076376, 1, 1, 1, 1, 1,
0.1027252, 1.346456, -0.3928347, 1, 1, 1, 1, 1,
0.1040338, -0.02252373, 0.4067149, 1, 1, 1, 1, 1,
0.1097726, 0.5503849, -0.298243, 1, 1, 1, 1, 1,
0.1099601, -0.1142931, 2.032226, 1, 1, 1, 1, 1,
0.110389, -0.1014313, 2.494227, 1, 1, 1, 1, 1,
0.1108698, -1.822322, 3.865438, 1, 1, 1, 1, 1,
0.1110486, 0.3653711, 1.121233, 1, 1, 1, 1, 1,
0.1140871, -0.3956435, 2.790502, 1, 1, 1, 1, 1,
0.1186244, 1.717244, 0.4521722, 1, 1, 1, 1, 1,
0.121908, 0.06346719, 0.9305791, 1, 1, 1, 1, 1,
0.1220319, 0.05082007, 1.941049, 1, 1, 1, 1, 1,
0.127633, 0.8945689, 0.2552698, 1, 1, 1, 1, 1,
0.1299901, -3.045543, 2.703047, 1, 1, 1, 1, 1,
0.1309296, -0.350813, 4.856522, 1, 1, 1, 1, 1,
0.1322663, 2.126555, 0.6193347, 0, 0, 1, 1, 1,
0.136631, -0.2389523, 4.95091, 1, 0, 0, 1, 1,
0.1367171, -0.8211268, 4.013515, 1, 0, 0, 1, 1,
0.1402899, 0.3163647, -0.5654358, 1, 0, 0, 1, 1,
0.1427471, -1.446648, 2.962908, 1, 0, 0, 1, 1,
0.1466878, 0.3263065, 0.3235488, 1, 0, 0, 1, 1,
0.1478751, 0.8706782, -0.4995178, 0, 0, 0, 1, 1,
0.1556682, 0.05415734, 2.185125, 0, 0, 0, 1, 1,
0.1602513, 0.3509036, 1.128318, 0, 0, 0, 1, 1,
0.1605474, 0.9256838, 1.359523, 0, 0, 0, 1, 1,
0.1638824, 0.7624506, -1.065409, 0, 0, 0, 1, 1,
0.1700999, -1.550188, 4.753066, 0, 0, 0, 1, 1,
0.1780812, -1.269387, 3.524534, 0, 0, 0, 1, 1,
0.1791594, 0.1008545, 1.54024, 1, 1, 1, 1, 1,
0.1793546, 0.8327938, 0.9074436, 1, 1, 1, 1, 1,
0.1931953, 0.6666255, 1.060009, 1, 1, 1, 1, 1,
0.1968014, 0.7898425, -0.3424457, 1, 1, 1, 1, 1,
0.203883, 0.6776792, -0.8878718, 1, 1, 1, 1, 1,
0.2046873, -0.2762276, 1.803527, 1, 1, 1, 1, 1,
0.2051354, 0.008178289, 0.1161846, 1, 1, 1, 1, 1,
0.2063025, 0.7890563, 0.9041675, 1, 1, 1, 1, 1,
0.2091431, 1.035558, 1.220606, 1, 1, 1, 1, 1,
0.2144021, 0.9629965, 0.3314248, 1, 1, 1, 1, 1,
0.2181928, 0.2911447, 0.8074751, 1, 1, 1, 1, 1,
0.2182212, 1.436953, 1.151164, 1, 1, 1, 1, 1,
0.2228231, 0.6810786, 0.8132212, 1, 1, 1, 1, 1,
0.2233578, 1.106851, 0.3276488, 1, 1, 1, 1, 1,
0.2275575, -0.02889811, 0.5949733, 1, 1, 1, 1, 1,
0.2292198, -1.498438, 3.000204, 0, 0, 1, 1, 1,
0.2320842, -1.513343, 3.268066, 1, 0, 0, 1, 1,
0.232109, 1.539715, 0.3541379, 1, 0, 0, 1, 1,
0.233756, -0.8555661, 1.425921, 1, 0, 0, 1, 1,
0.2349821, 0.008998356, 2.699816, 1, 0, 0, 1, 1,
0.2353837, -0.05716742, 2.2375, 1, 0, 0, 1, 1,
0.2365344, 0.5921405, 1.080667, 0, 0, 0, 1, 1,
0.2383806, 0.9779532, 1.450263, 0, 0, 0, 1, 1,
0.2411305, -0.1521875, 1.633799, 0, 0, 0, 1, 1,
0.2424161, -1.429516, 1.655393, 0, 0, 0, 1, 1,
0.2436731, -0.1040013, 1.649212, 0, 0, 0, 1, 1,
0.2543355, -0.9297052, 2.425434, 0, 0, 0, 1, 1,
0.2553096, -0.8576919, 4.132916, 0, 0, 0, 1, 1,
0.2579321, 1.645218, 0.1208768, 1, 1, 1, 1, 1,
0.2597816, 1.300022, -1.220452, 1, 1, 1, 1, 1,
0.2696399, 0.5278065, 1.46651, 1, 1, 1, 1, 1,
0.2719126, 0.5161343, 0.2916325, 1, 1, 1, 1, 1,
0.2721708, 0.2937666, 0.1030863, 1, 1, 1, 1, 1,
0.2722051, 0.6630813, 0.6776046, 1, 1, 1, 1, 1,
0.2736673, 0.5440533, -0.9843408, 1, 1, 1, 1, 1,
0.273971, 0.2525509, 1.025596, 1, 1, 1, 1, 1,
0.282065, -0.2208146, 4.015272, 1, 1, 1, 1, 1,
0.2825633, -0.5484346, 4.418886, 1, 1, 1, 1, 1,
0.2845365, 0.4731362, 1.073583, 1, 1, 1, 1, 1,
0.2846237, 0.7793925, 0.6979175, 1, 1, 1, 1, 1,
0.2865541, -1.642962, 3.067462, 1, 1, 1, 1, 1,
0.2881452, 0.1742965, 0.4730341, 1, 1, 1, 1, 1,
0.2881776, -0.4296533, 1.764352, 1, 1, 1, 1, 1,
0.2891943, -0.5233655, 3.634301, 0, 0, 1, 1, 1,
0.2906094, -0.6845887, 1.336398, 1, 0, 0, 1, 1,
0.293704, 0.6530508, -0.7767524, 1, 0, 0, 1, 1,
0.2963841, 2.296363, 0.2592659, 1, 0, 0, 1, 1,
0.2971992, 0.6920775, 0.8505921, 1, 0, 0, 1, 1,
0.3043435, 0.1288732, 1.143187, 1, 0, 0, 1, 1,
0.3046719, -0.2022743, 2.772427, 0, 0, 0, 1, 1,
0.3051164, -1.928741, 1.777014, 0, 0, 0, 1, 1,
0.3094485, -0.1121304, 1.62579, 0, 0, 0, 1, 1,
0.3123544, -0.1933909, -0.02958312, 0, 0, 0, 1, 1,
0.3129116, -0.7741494, 2.522084, 0, 0, 0, 1, 1,
0.3140122, -0.8453026, 3.964629, 0, 0, 0, 1, 1,
0.3141153, -0.6320379, 1.958924, 0, 0, 0, 1, 1,
0.3146481, 0.07416058, 0.8073165, 1, 1, 1, 1, 1,
0.3147615, 0.3331822, -0.8716345, 1, 1, 1, 1, 1,
0.3226623, -0.1116017, 0.7929259, 1, 1, 1, 1, 1,
0.3260008, 1.525974, -1.413341, 1, 1, 1, 1, 1,
0.3269594, 2.805537, 0.3234354, 1, 1, 1, 1, 1,
0.3358133, -0.2414342, 3.081608, 1, 1, 1, 1, 1,
0.3438187, 0.7430409, 0.3853869, 1, 1, 1, 1, 1,
0.3438547, 0.006402869, 0.3712648, 1, 1, 1, 1, 1,
0.3460994, -1.613716, 1.87676, 1, 1, 1, 1, 1,
0.3461606, 2.157964, 0.1392504, 1, 1, 1, 1, 1,
0.3516129, -0.08262693, 1.0022, 1, 1, 1, 1, 1,
0.3544742, 0.6315218, 1.044922, 1, 1, 1, 1, 1,
0.3603249, -0.1300491, 1.892345, 1, 1, 1, 1, 1,
0.3627822, -0.7662238, 4.144122, 1, 1, 1, 1, 1,
0.3642293, -0.1857132, 2.509146, 1, 1, 1, 1, 1,
0.3648522, -2.061881, 2.947598, 0, 0, 1, 1, 1,
0.3671838, -0.5100909, 2.113106, 1, 0, 0, 1, 1,
0.3804119, 1.65729, 1.289961, 1, 0, 0, 1, 1,
0.3806463, 0.9218354, 0.2284168, 1, 0, 0, 1, 1,
0.3807274, -1.362775, 2.34043, 1, 0, 0, 1, 1,
0.3816097, 1.749706, -0.8124383, 1, 0, 0, 1, 1,
0.3839371, 1.340112, -0.5558724, 0, 0, 0, 1, 1,
0.3848647, 0.6129606, 1.022206, 0, 0, 0, 1, 1,
0.3858092, 0.930258, 0.5674797, 0, 0, 0, 1, 1,
0.3879226, -0.4214812, 1.695859, 0, 0, 0, 1, 1,
0.3883587, -1.515374, 3.318901, 0, 0, 0, 1, 1,
0.3909623, -1.087234, 2.700656, 0, 0, 0, 1, 1,
0.3913777, 1.029702, 0.2288162, 0, 0, 0, 1, 1,
0.3936542, -0.32479, 0.6372459, 1, 1, 1, 1, 1,
0.3939814, -0.5167637, 1.804152, 1, 1, 1, 1, 1,
0.3940182, -0.1319263, 0.6533629, 1, 1, 1, 1, 1,
0.3992022, -0.4619046, 0.8703901, 1, 1, 1, 1, 1,
0.3992616, -1.346149, 3.194541, 1, 1, 1, 1, 1,
0.4011388, -0.3146923, 3.679557, 1, 1, 1, 1, 1,
0.4031791, 0.1337753, 0.9216521, 1, 1, 1, 1, 1,
0.4065548, -0.2401213, 1.540244, 1, 1, 1, 1, 1,
0.408985, 0.1158857, 1.142899, 1, 1, 1, 1, 1,
0.4106176, 0.6706734, 0.5995651, 1, 1, 1, 1, 1,
0.4111121, 0.1879411, 1.681025, 1, 1, 1, 1, 1,
0.4167085, 0.4950695, -0.3394688, 1, 1, 1, 1, 1,
0.4167295, -0.3732873, 2.142041, 1, 1, 1, 1, 1,
0.4170332, 1.033077, 0.8792254, 1, 1, 1, 1, 1,
0.4189185, -0.5996078, 1.81744, 1, 1, 1, 1, 1,
0.425754, 0.6840702, 0.6813485, 0, 0, 1, 1, 1,
0.4284292, 1.126323, 0.5797697, 1, 0, 0, 1, 1,
0.430474, -1.239539, 3.770277, 1, 0, 0, 1, 1,
0.4330762, 0.2200322, 1.518873, 1, 0, 0, 1, 1,
0.4330827, -1.78899, 3.274404, 1, 0, 0, 1, 1,
0.4484616, -0.3285312, 3.135743, 1, 0, 0, 1, 1,
0.4494365, 1.671759, -1.605389, 0, 0, 0, 1, 1,
0.4512577, -0.8943366, 4.472518, 0, 0, 0, 1, 1,
0.4558791, 6.401388e-05, 2.708309, 0, 0, 0, 1, 1,
0.46174, 1.063338, 0.132359, 0, 0, 0, 1, 1,
0.462332, 1.430726, 0.9756205, 0, 0, 0, 1, 1,
0.4673691, -0.5151083, 3.270703, 0, 0, 0, 1, 1,
0.476467, 0.4267524, 2.387293, 0, 0, 0, 1, 1,
0.4767099, -0.66552, 2.905256, 1, 1, 1, 1, 1,
0.4809825, 0.6777604, 0.06983627, 1, 1, 1, 1, 1,
0.4816054, 1.12547, 0.9608154, 1, 1, 1, 1, 1,
0.4839561, 0.1111366, 1.675329, 1, 1, 1, 1, 1,
0.4851595, -1.483484, 4.057154, 1, 1, 1, 1, 1,
0.4919596, -1.745809, 3.489537, 1, 1, 1, 1, 1,
0.4920143, 0.03256888, 0.9775342, 1, 1, 1, 1, 1,
0.4920687, -0.5156652, 3.17058, 1, 1, 1, 1, 1,
0.4955778, 0.5642795, -1.145186, 1, 1, 1, 1, 1,
0.498909, 0.7872078, 1.465352, 1, 1, 1, 1, 1,
0.5021372, -0.3795144, 2.804323, 1, 1, 1, 1, 1,
0.5037457, -0.1955706, 1.85634, 1, 1, 1, 1, 1,
0.5119201, 0.09156891, 2.343321, 1, 1, 1, 1, 1,
0.5123159, 0.5727751, 0.6025076, 1, 1, 1, 1, 1,
0.5141166, 1.014219, -0.1052433, 1, 1, 1, 1, 1,
0.5166792, -0.2995625, 1.939911, 0, 0, 1, 1, 1,
0.5197788, 1.863028, 0.7914177, 1, 0, 0, 1, 1,
0.5225097, -0.8532394, -0.3220318, 1, 0, 0, 1, 1,
0.523357, 1.713575, 0.6549106, 1, 0, 0, 1, 1,
0.5236841, -0.07313628, 0.6123206, 1, 0, 0, 1, 1,
0.5247766, 0.7061141, 0.7331218, 1, 0, 0, 1, 1,
0.5307984, 0.3564797, 2.473396, 0, 0, 0, 1, 1,
0.5320507, -1.253676, 2.023972, 0, 0, 0, 1, 1,
0.532054, -0.3274637, 1.674387, 0, 0, 0, 1, 1,
0.5328034, 0.9285518, -1.153981, 0, 0, 0, 1, 1,
0.5356253, -2.752868, 2.7353, 0, 0, 0, 1, 1,
0.53662, 0.4329329, 1.170934, 0, 0, 0, 1, 1,
0.5378813, -1.430762, 3.17768, 0, 0, 0, 1, 1,
0.5388306, 1.060904, 1.577133, 1, 1, 1, 1, 1,
0.5400064, -0.358499, 2.190887, 1, 1, 1, 1, 1,
0.5438474, 2.181366, 0.8889196, 1, 1, 1, 1, 1,
0.5448635, -0.09913743, 4.40449, 1, 1, 1, 1, 1,
0.5460948, -0.4301121, 2.508749, 1, 1, 1, 1, 1,
0.5576587, 0.6268513, 2.364389, 1, 1, 1, 1, 1,
0.5577344, 1.28018, 0.9993008, 1, 1, 1, 1, 1,
0.561596, 1.547327, 0.8764277, 1, 1, 1, 1, 1,
0.5690385, 1.257469, 1.828767, 1, 1, 1, 1, 1,
0.572788, 2.345658, 1.548309, 1, 1, 1, 1, 1,
0.5756335, -0.3936647, 1.276122, 1, 1, 1, 1, 1,
0.5783693, 0.2656052, 2.157711, 1, 1, 1, 1, 1,
0.5789291, 0.6958318, 0.1645935, 1, 1, 1, 1, 1,
0.5798405, -1.030348, 0.7333602, 1, 1, 1, 1, 1,
0.580336, -0.5738394, 1.891406, 1, 1, 1, 1, 1,
0.5819871, -0.585684, 2.555345, 0, 0, 1, 1, 1,
0.5834643, 0.6468091, 2.166463, 1, 0, 0, 1, 1,
0.5866246, -0.4365382, 2.420146, 1, 0, 0, 1, 1,
0.5872214, 1.052399, -0.4243188, 1, 0, 0, 1, 1,
0.5930042, 0.7899197, 2.10252, 1, 0, 0, 1, 1,
0.597953, 1.380606, 0.3403756, 1, 0, 0, 1, 1,
0.6006138, -0.06233225, 2.109345, 0, 0, 0, 1, 1,
0.6017078, -0.9625531, 1.714553, 0, 0, 0, 1, 1,
0.6031021, 0.1717223, 1.042579, 0, 0, 0, 1, 1,
0.6046913, -1.408816, 4.188318, 0, 0, 0, 1, 1,
0.606737, 0.4047101, 0.860864, 0, 0, 0, 1, 1,
0.6096562, -0.03078718, 0.9819627, 0, 0, 0, 1, 1,
0.6189815, 0.2153031, 2.619097, 0, 0, 0, 1, 1,
0.6215498, 0.09364463, 3.30945, 1, 1, 1, 1, 1,
0.6272737, -0.3730537, 2.41217, 1, 1, 1, 1, 1,
0.6286052, -1.441113, 0.6701, 1, 1, 1, 1, 1,
0.6419233, 1.656808, -0.4711765, 1, 1, 1, 1, 1,
0.6513874, 1.063386, 1.328694, 1, 1, 1, 1, 1,
0.6518561, -0.02080769, -0.04838714, 1, 1, 1, 1, 1,
0.6560763, -0.7949297, 3.811826, 1, 1, 1, 1, 1,
0.6598182, -1.213904, 2.377525, 1, 1, 1, 1, 1,
0.6610554, 0.3209299, 2.641582, 1, 1, 1, 1, 1,
0.6611444, 1.421572, -0.8374149, 1, 1, 1, 1, 1,
0.6729538, -0.1293303, 0.4445267, 1, 1, 1, 1, 1,
0.6778622, 0.3376894, 0.5366056, 1, 1, 1, 1, 1,
0.6849402, 0.4994236, 1.202149, 1, 1, 1, 1, 1,
0.6872982, -0.4094316, 1.781957, 1, 1, 1, 1, 1,
0.6912082, -0.8619531, 1.629612, 1, 1, 1, 1, 1,
0.7032107, -0.2160622, 1.818532, 0, 0, 1, 1, 1,
0.7050454, 0.3631855, 0.0648792, 1, 0, 0, 1, 1,
0.7091168, 2.067237, -0.2112225, 1, 0, 0, 1, 1,
0.7154931, 0.1010793, 0.9329661, 1, 0, 0, 1, 1,
0.7166626, -0.05490895, 0.9708295, 1, 0, 0, 1, 1,
0.7174154, 1.998442, -1.079432, 1, 0, 0, 1, 1,
0.7189483, 0.6508458, 0.6816853, 0, 0, 0, 1, 1,
0.7219129, 0.8874325, -0.07071123, 0, 0, 0, 1, 1,
0.7276646, -0.2843617, 1.920661, 0, 0, 0, 1, 1,
0.7288193, -0.5982808, 2.291044, 0, 0, 0, 1, 1,
0.7352626, -0.1133398, 1.158364, 0, 0, 0, 1, 1,
0.7355131, -0.02554164, 2.572095, 0, 0, 0, 1, 1,
0.735635, 0.03824289, 2.522808, 0, 0, 0, 1, 1,
0.7395386, -1.572936, 1.674008, 1, 1, 1, 1, 1,
0.742196, -0.6118809, 2.502541, 1, 1, 1, 1, 1,
0.7424025, 0.1813227, 1.678193, 1, 1, 1, 1, 1,
0.7439101, 0.359662, 0.6145876, 1, 1, 1, 1, 1,
0.7481547, -1.055732, 4.140181, 1, 1, 1, 1, 1,
0.7516989, 0.4013569, 0.3584795, 1, 1, 1, 1, 1,
0.7519385, -0.3692575, 3.612982, 1, 1, 1, 1, 1,
0.7520574, 1.322139, -0.916481, 1, 1, 1, 1, 1,
0.7539583, 0.4855226, 1.227511, 1, 1, 1, 1, 1,
0.7557693, 2.133198, 0.5169559, 1, 1, 1, 1, 1,
0.7607142, -0.5736285, 1.635874, 1, 1, 1, 1, 1,
0.771373, 0.927988, 1.278976, 1, 1, 1, 1, 1,
0.7767466, 1.472705, 1.78708, 1, 1, 1, 1, 1,
0.7793821, 0.6720487, -0.1242742, 1, 1, 1, 1, 1,
0.7846422, 0.3152327, 0.5459053, 1, 1, 1, 1, 1,
0.7853391, -2.811276, 3.839921, 0, 0, 1, 1, 1,
0.7873094, -2.07726, 1.676711, 1, 0, 0, 1, 1,
0.7949468, 0.4864258, 0.4375614, 1, 0, 0, 1, 1,
0.7975106, 0.5935338, 0.4179922, 1, 0, 0, 1, 1,
0.7995847, -2.48222, -0.2559915, 1, 0, 0, 1, 1,
0.804007, -0.2845021, 1.225314, 1, 0, 0, 1, 1,
0.8056748, -0.6895789, 2.259445, 0, 0, 0, 1, 1,
0.8087105, -0.7312542, 3.372777, 0, 0, 0, 1, 1,
0.8106387, 1.591905, -0.6285688, 0, 0, 0, 1, 1,
0.8116999, -0.7369133, 3.207091, 0, 0, 0, 1, 1,
0.8121508, -2.398363, 4.081069, 0, 0, 0, 1, 1,
0.8203493, 1.528028, 1.56845, 0, 0, 0, 1, 1,
0.820828, 0.4330459, 1.050095, 0, 0, 0, 1, 1,
0.8262431, -0.5207587, 2.057124, 1, 1, 1, 1, 1,
0.8404117, 0.4903706, 0.756838, 1, 1, 1, 1, 1,
0.8404228, 0.53552, -0.7906032, 1, 1, 1, 1, 1,
0.8406699, 1.72341, -0.9408346, 1, 1, 1, 1, 1,
0.8427812, -0.2915933, 3.202793, 1, 1, 1, 1, 1,
0.8456818, -0.6947642, 1.06653, 1, 1, 1, 1, 1,
0.8478422, -1.024177, 3.398398, 1, 1, 1, 1, 1,
0.8545356, 0.3923603, 2.479293, 1, 1, 1, 1, 1,
0.8579492, 0.9372992, 0.5312117, 1, 1, 1, 1, 1,
0.8591955, 0.4034227, 2.469553, 1, 1, 1, 1, 1,
0.8599743, -0.7688088, 1.734802, 1, 1, 1, 1, 1,
0.8620874, -0.3277337, 2.182003, 1, 1, 1, 1, 1,
0.868085, -0.3789081, 1.896699, 1, 1, 1, 1, 1,
0.8703673, -0.7193422, 3.209143, 1, 1, 1, 1, 1,
0.8718002, 0.6548187, 1.612411, 1, 1, 1, 1, 1,
0.8762596, 0.2735612, 0.7091141, 0, 0, 1, 1, 1,
0.8834834, 0.08224403, 2.847994, 1, 0, 0, 1, 1,
0.8923334, 0.5389376, 0.973669, 1, 0, 0, 1, 1,
0.8936299, 0.2115241, 0.7723907, 1, 0, 0, 1, 1,
0.8947313, 2.660416, 1.702482, 1, 0, 0, 1, 1,
0.9047279, -0.373525, 2.004691, 1, 0, 0, 1, 1,
0.910989, -1.264668, 2.907336, 0, 0, 0, 1, 1,
0.9165667, 2.587525, -0.8071773, 0, 0, 0, 1, 1,
0.9206213, 0.1965915, 0.7837315, 0, 0, 0, 1, 1,
0.9275718, -0.5425332, 0.5457402, 0, 0, 0, 1, 1,
0.9294457, -1.400468, 1.356534, 0, 0, 0, 1, 1,
0.9310247, 0.7224684, -0.8955264, 0, 0, 0, 1, 1,
0.9331858, -2.488991, 3.451669, 0, 0, 0, 1, 1,
0.9352361, 1.001701, 1.252879, 1, 1, 1, 1, 1,
0.9444413, 0.6300118, 0.4394006, 1, 1, 1, 1, 1,
0.9487443, -0.3382524, 2.110567, 1, 1, 1, 1, 1,
0.9493873, 0.2388672, 1.754895, 1, 1, 1, 1, 1,
0.9521846, 0.7689046, -0.8257237, 1, 1, 1, 1, 1,
0.9565933, -0.4532309, 2.23863, 1, 1, 1, 1, 1,
0.9604231, -0.03929847, 1.740347, 1, 1, 1, 1, 1,
0.9652145, -1.64977, 0.7072248, 1, 1, 1, 1, 1,
0.9750996, -0.7369999, 4.792784, 1, 1, 1, 1, 1,
0.9754226, 0.2482567, 2.217565, 1, 1, 1, 1, 1,
0.9757541, -0.3040366, 1.700104, 1, 1, 1, 1, 1,
0.9776136, 0.1765731, 1.084361, 1, 1, 1, 1, 1,
0.9779431, -0.6233491, 1.172655, 1, 1, 1, 1, 1,
0.9844323, 0.3006809, 0.2416118, 1, 1, 1, 1, 1,
0.9877872, 0.5746778, -0.09420972, 1, 1, 1, 1, 1,
0.9878366, -0.7504175, 2.593108, 0, 0, 1, 1, 1,
0.9880572, -0.6604424, 3.506329, 1, 0, 0, 1, 1,
0.9902913, -2.110902, 2.812859, 1, 0, 0, 1, 1,
0.9903771, -0.1980568, 1.169464, 1, 0, 0, 1, 1,
0.9950278, -0.1113429, 1.220505, 1, 0, 0, 1, 1,
1.002164, 0.4814117, -0.9971294, 1, 0, 0, 1, 1,
1.002907, 0.334108, 0.2790257, 0, 0, 0, 1, 1,
1.004269, 1.758879, 0.3026631, 0, 0, 0, 1, 1,
1.006345, -1.847967, 2.382116, 0, 0, 0, 1, 1,
1.013611, 0.07078867, 1.212008, 0, 0, 0, 1, 1,
1.015858, 0.8876581, -0.3370011, 0, 0, 0, 1, 1,
1.019955, -0.08178875, 2.190148, 0, 0, 0, 1, 1,
1.030535, 0.2968067, 0.7708806, 0, 0, 0, 1, 1,
1.031166, 1.103151, 1.32627, 1, 1, 1, 1, 1,
1.031746, 0.8039702, 1.936147, 1, 1, 1, 1, 1,
1.040331, -0.6566821, 2.614202, 1, 1, 1, 1, 1,
1.041189, -0.6206087, 1.335135, 1, 1, 1, 1, 1,
1.055358, 0.1108667, 1.717385, 1, 1, 1, 1, 1,
1.059577, 0.9755623, 1.506069, 1, 1, 1, 1, 1,
1.063619, 1.273537, -0.2767872, 1, 1, 1, 1, 1,
1.065905, 0.6779478, -0.2178334, 1, 1, 1, 1, 1,
1.072828, -0.1273899, 1.818946, 1, 1, 1, 1, 1,
1.076015, -0.3480688, 3.677966, 1, 1, 1, 1, 1,
1.082989, -0.2416007, 1.981927, 1, 1, 1, 1, 1,
1.084316, 0.9004585, 0.3953783, 1, 1, 1, 1, 1,
1.092286, -0.9124758, -0.2257383, 1, 1, 1, 1, 1,
1.095156, 1.784017, -0.06750128, 1, 1, 1, 1, 1,
1.103046, 0.64081, 0.7800297, 1, 1, 1, 1, 1,
1.107231, 0.4905937, -0.230514, 0, 0, 1, 1, 1,
1.1082, -0.6683242, 1.832594, 1, 0, 0, 1, 1,
1.112171, 1.094034, 2.200072, 1, 0, 0, 1, 1,
1.113174, 0.6693454, 1.00937, 1, 0, 0, 1, 1,
1.124903, 0.6567739, 1.65794, 1, 0, 0, 1, 1,
1.126271, -0.2532423, 2.579108, 1, 0, 0, 1, 1,
1.130988, 0.9587749, 0.8588994, 0, 0, 0, 1, 1,
1.131549, -1.058031, 1.163562, 0, 0, 0, 1, 1,
1.134688, -1.024756, 1.60145, 0, 0, 0, 1, 1,
1.135013, -0.6127298, 1.909193, 0, 0, 0, 1, 1,
1.139163, 0.6363984, 1.303262, 0, 0, 0, 1, 1,
1.14648, 0.05186521, 0.5880229, 0, 0, 0, 1, 1,
1.152948, -1.914253, 3.600363, 0, 0, 0, 1, 1,
1.154695, -0.2341093, 1.044223, 1, 1, 1, 1, 1,
1.155989, 0.6147218, 2.397071, 1, 1, 1, 1, 1,
1.165539, -0.6345512, 2.692677, 1, 1, 1, 1, 1,
1.166635, 0.8580078, 1.316268, 1, 1, 1, 1, 1,
1.173889, 0.3987105, 2.022119, 1, 1, 1, 1, 1,
1.192482, -0.3367923, -0.2779217, 1, 1, 1, 1, 1,
1.199068, -1.230253, 2.946878, 1, 1, 1, 1, 1,
1.20051, 1.199704, 0.3896092, 1, 1, 1, 1, 1,
1.209111, 0.4317122, 0.1465451, 1, 1, 1, 1, 1,
1.213672, -0.183792, 2.188496, 1, 1, 1, 1, 1,
1.215855, 0.8147387, -0.3470633, 1, 1, 1, 1, 1,
1.21944, 0.09569523, 0.5837155, 1, 1, 1, 1, 1,
1.231475, -0.1817173, 2.600951, 1, 1, 1, 1, 1,
1.232952, 0.5345875, 1.046129, 1, 1, 1, 1, 1,
1.233332, 1.971155, 0.4746072, 1, 1, 1, 1, 1,
1.240247, -0.0008403498, 1.513557, 0, 0, 1, 1, 1,
1.264006, -1.861629, 2.58306, 1, 0, 0, 1, 1,
1.270292, 0.1775255, 1.271503, 1, 0, 0, 1, 1,
1.271918, -0.07020269, 2.445814, 1, 0, 0, 1, 1,
1.283202, -1.769279, 1.438344, 1, 0, 0, 1, 1,
1.289173, 0.466391, 0.5855448, 1, 0, 0, 1, 1,
1.290283, 1.414769, 0.1047142, 0, 0, 0, 1, 1,
1.317152, -1.039104, 1.901184, 0, 0, 0, 1, 1,
1.317442, -0.4730834, 1.713405, 0, 0, 0, 1, 1,
1.319014, 0.009713508, 1.311457, 0, 0, 0, 1, 1,
1.319776, -0.2062268, 0.6963387, 0, 0, 0, 1, 1,
1.323132, -0.2791182, 1.878636, 0, 0, 0, 1, 1,
1.343673, -0.6958994, 1.522685, 0, 0, 0, 1, 1,
1.345096, 0.0299243, 2.220096, 1, 1, 1, 1, 1,
1.346844, -0.9852132, 4.746724, 1, 1, 1, 1, 1,
1.350228, 0.7975137, 2.033564, 1, 1, 1, 1, 1,
1.36961, -0.04361336, 0.5179, 1, 1, 1, 1, 1,
1.370515, -0.242565, 2.229629, 1, 1, 1, 1, 1,
1.372299, 2.125119, -0.8874361, 1, 1, 1, 1, 1,
1.376688, 0.4640432, 4.343509, 1, 1, 1, 1, 1,
1.381527, -0.5709239, 1.780921, 1, 1, 1, 1, 1,
1.391272, 0.03063646, 1.109578, 1, 1, 1, 1, 1,
1.399821, -1.027907, 2.051515, 1, 1, 1, 1, 1,
1.416964, 1.694963, 0.1095045, 1, 1, 1, 1, 1,
1.418524, -0.1852561, 2.284363, 1, 1, 1, 1, 1,
1.420594, 1.013544, 0.7603137, 1, 1, 1, 1, 1,
1.421538, 0.156477, 1.673479, 1, 1, 1, 1, 1,
1.421664, 0.197147, 2.404274, 1, 1, 1, 1, 1,
1.423492, -0.3510636, 3.00145, 0, 0, 1, 1, 1,
1.426111, -1.366261, 2.149307, 1, 0, 0, 1, 1,
1.428337, 1.204685, 1.314385, 1, 0, 0, 1, 1,
1.441118, -0.3277509, 0.3765513, 1, 0, 0, 1, 1,
1.442714, -0.2903755, -0.1015367, 1, 0, 0, 1, 1,
1.443526, 0.7544996, 0.4256307, 1, 0, 0, 1, 1,
1.453383, -0.4661745, 0.5651335, 0, 0, 0, 1, 1,
1.466056, 0.8562427, -0.5611147, 0, 0, 0, 1, 1,
1.475262, -0.6318799, 1.041331, 0, 0, 0, 1, 1,
1.475377, 0.1713297, 1.183285, 0, 0, 0, 1, 1,
1.478487, 0.8590165, 0.4212386, 0, 0, 0, 1, 1,
1.481484, 0.7338501, 1.933012, 0, 0, 0, 1, 1,
1.489421, -0.6126677, 1.649261, 0, 0, 0, 1, 1,
1.490486, -0.2144414, 2.30846, 1, 1, 1, 1, 1,
1.4929, 2.945755, 0.07108946, 1, 1, 1, 1, 1,
1.500057, -0.4022316, 0.760334, 1, 1, 1, 1, 1,
1.50108, -0.02462149, 1.249189, 1, 1, 1, 1, 1,
1.510556, 0.4355513, 1.619676, 1, 1, 1, 1, 1,
1.514069, 0.3493677, 0.8727764, 1, 1, 1, 1, 1,
1.5276, 3.10408, 2.344773, 1, 1, 1, 1, 1,
1.527892, -0.5649476, 1.645879, 1, 1, 1, 1, 1,
1.564686, 0.02958732, 2.401023, 1, 1, 1, 1, 1,
1.569846, 0.4291883, 2.250125, 1, 1, 1, 1, 1,
1.571612, 0.3140095, 1.581582, 1, 1, 1, 1, 1,
1.576935, 0.6522866, 1.637922, 1, 1, 1, 1, 1,
1.578452, -0.5448472, 2.452541, 1, 1, 1, 1, 1,
1.579406, -1.019771, 2.827405, 1, 1, 1, 1, 1,
1.586939, -0.7340729, 1.215318, 1, 1, 1, 1, 1,
1.592949, -0.8655196, 0.911216, 0, 0, 1, 1, 1,
1.60787, 0.4326985, 0.4116448, 1, 0, 0, 1, 1,
1.617367, -1.71702, 2.208464, 1, 0, 0, 1, 1,
1.646682, 0.07263399, 0.2690335, 1, 0, 0, 1, 1,
1.647731, -0.7079259, 0.9027485, 1, 0, 0, 1, 1,
1.649683, 1.247881, -0.1347008, 1, 0, 0, 1, 1,
1.665571, -0.1817364, 1.477648, 0, 0, 0, 1, 1,
1.691187, 0.9117846, 2.474717, 0, 0, 0, 1, 1,
1.692557, 1.829833, -0.1168859, 0, 0, 0, 1, 1,
1.707302, -0.5512254, 1.443166, 0, 0, 0, 1, 1,
1.711202, 0.02828266, 1.881999, 0, 0, 0, 1, 1,
1.724843, -1.547657, 1.573032, 0, 0, 0, 1, 1,
1.740517, -0.1057051, 0.9522765, 0, 0, 0, 1, 1,
1.75817, -0.08678333, 2.201109, 1, 1, 1, 1, 1,
1.776769, -0.4431939, 0.9374794, 1, 1, 1, 1, 1,
1.790304, 1.373526, 0.6293843, 1, 1, 1, 1, 1,
1.805162, 0.1306562, 2.243749, 1, 1, 1, 1, 1,
1.806141, -0.6367269, 2.622995, 1, 1, 1, 1, 1,
1.816828, -0.234905, 2.912616, 1, 1, 1, 1, 1,
1.830758, 0.428414, 0.008759049, 1, 1, 1, 1, 1,
1.835161, 0.9658611, 0.2563168, 1, 1, 1, 1, 1,
1.847394, -0.141129, 0.9702089, 1, 1, 1, 1, 1,
1.882675, 3.210319, -0.8751367, 1, 1, 1, 1, 1,
1.883664, -1.211807, 1.724345, 1, 1, 1, 1, 1,
1.907345, 0.8436233, 0.02548729, 1, 1, 1, 1, 1,
1.94775, -1.66889, 4.349975, 1, 1, 1, 1, 1,
1.987094, 2.297294, 1.009961, 1, 1, 1, 1, 1,
1.995202, -1.187945, 1.4538, 1, 1, 1, 1, 1,
2.002279, 1.208892, 0.5554647, 0, 0, 1, 1, 1,
2.081728, -0.9827728, 1.636444, 1, 0, 0, 1, 1,
2.115746, -0.3933252, 2.777788, 1, 0, 0, 1, 1,
2.116769, 0.2430716, 2.495119, 1, 0, 0, 1, 1,
2.133645, -0.2179646, 1.10803, 1, 0, 0, 1, 1,
2.197236, -2.635614, 2.714463, 1, 0, 0, 1, 1,
2.234167, 0.4950832, 2.191503, 0, 0, 0, 1, 1,
2.240318, 1.696799, 2.128238, 0, 0, 0, 1, 1,
2.241997, 1.04874, 0.7001275, 0, 0, 0, 1, 1,
2.304122, -0.7575744, 0.680563, 0, 0, 0, 1, 1,
2.313374, 0.06220816, 1.837334, 0, 0, 0, 1, 1,
2.34703, -0.03191766, 2.37793, 0, 0, 0, 1, 1,
2.37328, -0.03167162, 2.236652, 0, 0, 0, 1, 1,
2.480181, 0.9037238, 1.257487, 1, 1, 1, 1, 1,
2.520744, -0.7492119, 3.722065, 1, 1, 1, 1, 1,
2.654686, -1.12952, 3.119565, 1, 1, 1, 1, 1,
2.721903, -1.259434, 3.294247, 1, 1, 1, 1, 1,
2.831629, -0.6683517, 1.27556, 1, 1, 1, 1, 1,
2.893696, -0.3929392, 0.8279216, 1, 1, 1, 1, 1,
3.759118, 0.6136426, 1.272162, 1, 1, 1, 1, 1
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
var radius = 9.499909;
var distance = 33.36803;
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
mvMatrix.translate( -0.174875, -0.08238792, 0.09311581 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36803);
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
