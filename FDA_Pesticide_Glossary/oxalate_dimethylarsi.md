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
-3.645374, -2.707533, -3.525436, 1, 0, 0, 1,
-3.557529, 0.3457625, -1.344147, 1, 0.007843138, 0, 1,
-3.217222, 0.6195547, -1.051058, 1, 0.01176471, 0, 1,
-2.483997, 0.4527891, -1.381446, 1, 0.01960784, 0, 1,
-2.477096, -0.771592, -2.272478, 1, 0.02352941, 0, 1,
-2.45058, -2.56354, -3.59943, 1, 0.03137255, 0, 1,
-2.446027, -1.34696, -2.960664, 1, 0.03529412, 0, 1,
-2.417817, -0.1149685, -2.926977, 1, 0.04313726, 0, 1,
-2.390878, -0.6219991, -2.206172, 1, 0.04705882, 0, 1,
-2.385119, -0.2781319, -1.884194, 1, 0.05490196, 0, 1,
-2.256428, -0.1811952, -1.409584, 1, 0.05882353, 0, 1,
-2.255615, -1.004127, -0.9111363, 1, 0.06666667, 0, 1,
-2.1629, -0.7595966, -1.872894, 1, 0.07058824, 0, 1,
-2.15843, 1.884792, -0.936546, 1, 0.07843138, 0, 1,
-2.148416, 1.132856, -0.6790045, 1, 0.08235294, 0, 1,
-2.131348, 0.6974886, -1.84234, 1, 0.09019608, 0, 1,
-1.983647, -0.04593433, -2.325164, 1, 0.09411765, 0, 1,
-1.971592, 0.1302818, -1.194971, 1, 0.1019608, 0, 1,
-1.950534, 0.2503296, -1.974015, 1, 0.1098039, 0, 1,
-1.943828, 0.2292665, -2.396027, 1, 0.1137255, 0, 1,
-1.941014, -1.792868, -3.419104, 1, 0.1215686, 0, 1,
-1.940087, -1.43933, -2.651446, 1, 0.1254902, 0, 1,
-1.905207, 0.536981, -1.830576, 1, 0.1333333, 0, 1,
-1.878648, -0.197907, -1.685198, 1, 0.1372549, 0, 1,
-1.867949, -1.318349, -1.916276, 1, 0.145098, 0, 1,
-1.866654, 0.2125564, -1.844478, 1, 0.1490196, 0, 1,
-1.864773, 1.117033, -0.7913421, 1, 0.1568628, 0, 1,
-1.862338, 0.6938612, -3.177121, 1, 0.1607843, 0, 1,
-1.858849, -1.222912, -1.662874, 1, 0.1686275, 0, 1,
-1.854212, -0.1235916, -0.8878295, 1, 0.172549, 0, 1,
-1.827641, 0.1966151, -2.296933, 1, 0.1803922, 0, 1,
-1.807919, 0.7476761, -0.02350036, 1, 0.1843137, 0, 1,
-1.80716, -1.719936, -1.685266, 1, 0.1921569, 0, 1,
-1.802284, 0.9169505, -0.9160348, 1, 0.1960784, 0, 1,
-1.787561, -0.2651066, -0.778573, 1, 0.2039216, 0, 1,
-1.784802, -0.3142123, -2.601983, 1, 0.2117647, 0, 1,
-1.775699, 0.7093411, 0.4368676, 1, 0.2156863, 0, 1,
-1.773551, -2.518769, -1.518095, 1, 0.2235294, 0, 1,
-1.753764, -0.04699681, -1.946551, 1, 0.227451, 0, 1,
-1.751883, -0.003212253, -0.8074384, 1, 0.2352941, 0, 1,
-1.74706, 0.03694176, -1.380615, 1, 0.2392157, 0, 1,
-1.742955, 0.1162502, -0.6898176, 1, 0.2470588, 0, 1,
-1.739292, -0.530723, -1.915689, 1, 0.2509804, 0, 1,
-1.728527, -0.07677174, -1.079197, 1, 0.2588235, 0, 1,
-1.713578, -0.2285585, -2.107314, 1, 0.2627451, 0, 1,
-1.712494, -0.8781008, -1.449066, 1, 0.2705882, 0, 1,
-1.701334, 0.6278893, -1.50627, 1, 0.2745098, 0, 1,
-1.695117, -0.7464837, -4.692739, 1, 0.282353, 0, 1,
-1.681412, -0.2210811, -2.09434, 1, 0.2862745, 0, 1,
-1.653715, -3.005537, -1.45605, 1, 0.2941177, 0, 1,
-1.647345, -0.3023093, -2.123406, 1, 0.3019608, 0, 1,
-1.635724, -1.115948, -1.51475, 1, 0.3058824, 0, 1,
-1.630961, -0.6853086, -2.66751, 1, 0.3137255, 0, 1,
-1.624732, 0.4890417, -1.485582, 1, 0.3176471, 0, 1,
-1.623195, 0.8094485, 0.4239605, 1, 0.3254902, 0, 1,
-1.612139, -1.082185, -2.214252, 1, 0.3294118, 0, 1,
-1.597306, -1.480656, -1.342008, 1, 0.3372549, 0, 1,
-1.576985, 0.836172, -0.7189323, 1, 0.3411765, 0, 1,
-1.553171, 0.7380511, -1.418653, 1, 0.3490196, 0, 1,
-1.552287, -0.1343611, -1.300946, 1, 0.3529412, 0, 1,
-1.538425, 0.7058257, 0.6623217, 1, 0.3607843, 0, 1,
-1.530141, 1.032105, -2.488422, 1, 0.3647059, 0, 1,
-1.528897, -1.468633, -0.8167088, 1, 0.372549, 0, 1,
-1.52854, -1.770607, -1.874274, 1, 0.3764706, 0, 1,
-1.516013, 0.9439837, -0.4433388, 1, 0.3843137, 0, 1,
-1.505251, -0.3640607, -1.091529, 1, 0.3882353, 0, 1,
-1.495971, 0.7180915, -2.596258, 1, 0.3960784, 0, 1,
-1.485183, -1.475932, -0.8607548, 1, 0.4039216, 0, 1,
-1.465917, -0.5009131, -1.643673, 1, 0.4078431, 0, 1,
-1.455514, -1.280388, -2.146339, 1, 0.4156863, 0, 1,
-1.436969, -1.5164, -0.6425269, 1, 0.4196078, 0, 1,
-1.43579, 1.036155, -1.307991, 1, 0.427451, 0, 1,
-1.423167, 0.8682307, -2.072807, 1, 0.4313726, 0, 1,
-1.418672, -0.5104877, -1.29066, 1, 0.4392157, 0, 1,
-1.417556, -0.3875757, -1.844152, 1, 0.4431373, 0, 1,
-1.413717, -0.6595283, -3.042037, 1, 0.4509804, 0, 1,
-1.407557, 0.3401377, -1.285836, 1, 0.454902, 0, 1,
-1.405604, 0.1897925, -1.840664, 1, 0.4627451, 0, 1,
-1.390108, 0.004854808, -1.17124, 1, 0.4666667, 0, 1,
-1.388862, -1.962252, -2.288425, 1, 0.4745098, 0, 1,
-1.377315, 1.241445, 2.007592, 1, 0.4784314, 0, 1,
-1.368185, -0.2170144, -2.46191, 1, 0.4862745, 0, 1,
-1.358407, -0.7961665, -0.7090648, 1, 0.4901961, 0, 1,
-1.357071, -0.2492467, -0.573054, 1, 0.4980392, 0, 1,
-1.354556, 0.183074, -2.149486, 1, 0.5058824, 0, 1,
-1.350106, 0.4942265, -2.116643, 1, 0.509804, 0, 1,
-1.350039, -0.488641, -3.745903, 1, 0.5176471, 0, 1,
-1.347944, 0.6693866, 0.3684896, 1, 0.5215687, 0, 1,
-1.347823, -0.3412268, -2.998085, 1, 0.5294118, 0, 1,
-1.332542, 0.7569962, -0.9283658, 1, 0.5333334, 0, 1,
-1.331445, -0.005525765, -2.134717, 1, 0.5411765, 0, 1,
-1.329374, 1.468377, -0.4332275, 1, 0.5450981, 0, 1,
-1.322324, -0.8999448, -3.083806, 1, 0.5529412, 0, 1,
-1.304562, 0.4046458, -0.9470872, 1, 0.5568628, 0, 1,
-1.304142, -1.08316, -0.7053959, 1, 0.5647059, 0, 1,
-1.297028, 1.166406, -1.139505, 1, 0.5686275, 0, 1,
-1.29108, -1.980722, -2.896986, 1, 0.5764706, 0, 1,
-1.289407, 1.054824, -0.9369964, 1, 0.5803922, 0, 1,
-1.275526, 0.5220102, -0.5548549, 1, 0.5882353, 0, 1,
-1.274785, 0.3349961, -1.627727, 1, 0.5921569, 0, 1,
-1.273393, 0.8681953, -2.653599, 1, 0.6, 0, 1,
-1.264284, -2.142981, -2.306, 1, 0.6078432, 0, 1,
-1.263614, 0.06516168, -0.6443047, 1, 0.6117647, 0, 1,
-1.261455, 0.3284971, -2.80871, 1, 0.6196079, 0, 1,
-1.259382, -0.4929803, -1.953206, 1, 0.6235294, 0, 1,
-1.258641, 0.9095588, -0.09837165, 1, 0.6313726, 0, 1,
-1.255617, -0.4032741, -2.002793, 1, 0.6352941, 0, 1,
-1.234113, 0.736029, -1.52622, 1, 0.6431373, 0, 1,
-1.231914, -0.9495737, -2.539032, 1, 0.6470588, 0, 1,
-1.231855, 1.540502, -0.186353, 1, 0.654902, 0, 1,
-1.230523, -0.3305117, -0.04330772, 1, 0.6588235, 0, 1,
-1.228701, 1.521738, -1.016268, 1, 0.6666667, 0, 1,
-1.224509, 0.5917248, -0.5239242, 1, 0.6705883, 0, 1,
-1.224323, 1.207548, 0.3157602, 1, 0.6784314, 0, 1,
-1.221382, -0.1086875, -2.112313, 1, 0.682353, 0, 1,
-1.208521, -1.213418, -1.118433, 1, 0.6901961, 0, 1,
-1.201164, 1.729735, -0.527715, 1, 0.6941177, 0, 1,
-1.189103, -1.609241, -0.3956143, 1, 0.7019608, 0, 1,
-1.187876, -0.5261859, -1.541248, 1, 0.7098039, 0, 1,
-1.187011, 0.9416128, -0.9538623, 1, 0.7137255, 0, 1,
-1.186851, 1.344861, -0.896438, 1, 0.7215686, 0, 1,
-1.182718, -0.567022, -1.210844, 1, 0.7254902, 0, 1,
-1.178334, 0.6253991, -2.198277, 1, 0.7333333, 0, 1,
-1.175599, 0.4283793, -1.971553, 1, 0.7372549, 0, 1,
-1.174834, 0.9769674, -2.325856, 1, 0.7450981, 0, 1,
-1.172483, 0.9727623, -2.07448, 1, 0.7490196, 0, 1,
-1.167878, 1.976802, -0.5074831, 1, 0.7568628, 0, 1,
-1.160935, 0.9902232, -1.500382, 1, 0.7607843, 0, 1,
-1.159058, 0.6001595, -0.08669835, 1, 0.7686275, 0, 1,
-1.133021, 0.1373007, -1.850908, 1, 0.772549, 0, 1,
-1.131526, 0.4434957, -0.7078181, 1, 0.7803922, 0, 1,
-1.130705, -0.5576959, -0.9077212, 1, 0.7843137, 0, 1,
-1.13007, -0.6674852, -1.425478, 1, 0.7921569, 0, 1,
-1.119188, -0.07036106, -1.749508, 1, 0.7960784, 0, 1,
-1.117234, 1.271834, -1.354864, 1, 0.8039216, 0, 1,
-1.110317, -1.586935, -3.169441, 1, 0.8117647, 0, 1,
-1.109707, -0.4065306, -3.617577, 1, 0.8156863, 0, 1,
-1.10936, -1.152233, -4.132838, 1, 0.8235294, 0, 1,
-1.105856, -0.05741874, -1.067963, 1, 0.827451, 0, 1,
-1.104589, -0.6325928, -2.078003, 1, 0.8352941, 0, 1,
-1.101671, -1.712236, -4.609941, 1, 0.8392157, 0, 1,
-1.10121, -0.6595254, -2.15536, 1, 0.8470588, 0, 1,
-1.100479, -0.7737039, -1.73734, 1, 0.8509804, 0, 1,
-1.098529, 1.466037, 0.3235179, 1, 0.8588235, 0, 1,
-1.096857, -0.2229085, -2.508536, 1, 0.8627451, 0, 1,
-1.086744, 0.3200481, -1.650943, 1, 0.8705882, 0, 1,
-1.081491, 1.099926, -1.341684, 1, 0.8745098, 0, 1,
-1.077747, -0.3759576, -0.5575497, 1, 0.8823529, 0, 1,
-1.065573, -1.091456, -2.79668, 1, 0.8862745, 0, 1,
-1.058747, -0.2617613, -0.3221476, 1, 0.8941177, 0, 1,
-1.056484, 0.1483551, -1.870804, 1, 0.8980392, 0, 1,
-1.055765, 0.8022221, 0.09472457, 1, 0.9058824, 0, 1,
-1.049211, -0.5204024, -2.237431, 1, 0.9137255, 0, 1,
-1.048309, 0.5904907, -1.53801, 1, 0.9176471, 0, 1,
-1.046731, 0.221187, 0.9423621, 1, 0.9254902, 0, 1,
-1.046291, 1.763659, 0.4779283, 1, 0.9294118, 0, 1,
-1.034386, -0.1162721, -2.444414, 1, 0.9372549, 0, 1,
-1.02718, 1.551088, 0.02622614, 1, 0.9411765, 0, 1,
-1.022536, -0.6842954, -0.574275, 1, 0.9490196, 0, 1,
-1.021981, -0.7544187, -2.843654, 1, 0.9529412, 0, 1,
-1.017446, 0.1772864, -1.815866, 1, 0.9607843, 0, 1,
-1.013993, -0.9934343, -2.573914, 1, 0.9647059, 0, 1,
-1.011294, -1.597422, -2.253206, 1, 0.972549, 0, 1,
-1.004934, -0.0001063297, -0.536515, 1, 0.9764706, 0, 1,
-0.9974078, -0.3042982, -1.97979, 1, 0.9843137, 0, 1,
-0.9958192, -0.192204, -2.720665, 1, 0.9882353, 0, 1,
-0.995576, -0.438316, -1.607526, 1, 0.9960784, 0, 1,
-0.991663, -0.6403046, -1.825315, 0.9960784, 1, 0, 1,
-0.99109, 0.1693221, 0.1980835, 0.9921569, 1, 0, 1,
-0.9894327, 0.9895986, -3.370933, 0.9843137, 1, 0, 1,
-0.988802, 0.2936584, -1.651217, 0.9803922, 1, 0, 1,
-0.9797089, 1.240382, -1.033311, 0.972549, 1, 0, 1,
-0.9785129, -1.783479, -1.091611, 0.9686275, 1, 0, 1,
-0.9759787, -1.334543, -3.55752, 0.9607843, 1, 0, 1,
-0.9736997, 0.2511742, 0.3599401, 0.9568627, 1, 0, 1,
-0.964289, -0.03443489, -1.682676, 0.9490196, 1, 0, 1,
-0.9596265, 1.169186, -0.6749569, 0.945098, 1, 0, 1,
-0.9592892, -2.114809, -3.72471, 0.9372549, 1, 0, 1,
-0.9569242, -0.7350296, -3.060649, 0.9333333, 1, 0, 1,
-0.9563207, -0.2363986, -1.575362, 0.9254902, 1, 0, 1,
-0.9490058, -0.7804842, -1.776489, 0.9215686, 1, 0, 1,
-0.9424543, -1.047022, -3.786691, 0.9137255, 1, 0, 1,
-0.9360766, -0.06566159, -1.797732, 0.9098039, 1, 0, 1,
-0.9318929, -0.8224013, -3.416905, 0.9019608, 1, 0, 1,
-0.9211371, -0.5190569, -1.468662, 0.8941177, 1, 0, 1,
-0.9188413, 0.03368408, -1.777653, 0.8901961, 1, 0, 1,
-0.9172287, 0.5467494, -0.5524545, 0.8823529, 1, 0, 1,
-0.9051728, -0.3191747, -1.925504, 0.8784314, 1, 0, 1,
-0.9035, 1.080691, -1.747424, 0.8705882, 1, 0, 1,
-0.9018088, -0.9849147, -3.018148, 0.8666667, 1, 0, 1,
-0.8957149, -0.9591358, -2.968423, 0.8588235, 1, 0, 1,
-0.895057, -0.04933522, -1.560565, 0.854902, 1, 0, 1,
-0.8908277, -1.662435, -3.53883, 0.8470588, 1, 0, 1,
-0.8894005, 0.2799743, -0.6383586, 0.8431373, 1, 0, 1,
-0.8887421, 0.4886236, -0.04662434, 0.8352941, 1, 0, 1,
-0.8830588, -0.2355992, -1.706641, 0.8313726, 1, 0, 1,
-0.8799644, 1.260813, 0.4788139, 0.8235294, 1, 0, 1,
-0.8770409, -0.01255722, -1.428989, 0.8196079, 1, 0, 1,
-0.8703095, -0.1955987, -1.359247, 0.8117647, 1, 0, 1,
-0.8687351, 0.5922868, -0.7650029, 0.8078431, 1, 0, 1,
-0.8683441, 0.2906857, -1.416763, 0.8, 1, 0, 1,
-0.8659329, -0.6773973, -1.041464, 0.7921569, 1, 0, 1,
-0.8613015, 1.44291, -0.6694674, 0.7882353, 1, 0, 1,
-0.85909, 2.398407, -1.826346, 0.7803922, 1, 0, 1,
-0.8548127, 0.8258443, -1.914245, 0.7764706, 1, 0, 1,
-0.8528631, 0.5287216, -1.27495, 0.7686275, 1, 0, 1,
-0.8483122, -1.933118, -3.223409, 0.7647059, 1, 0, 1,
-0.8434725, -0.05131036, -2.359787, 0.7568628, 1, 0, 1,
-0.8434157, 0.6691452, -0.6782053, 0.7529412, 1, 0, 1,
-0.8416044, -0.5057017, -0.8374708, 0.7450981, 1, 0, 1,
-0.840158, 0.5532272, -0.1192058, 0.7411765, 1, 0, 1,
-0.8391712, 0.8491089, -1.772914, 0.7333333, 1, 0, 1,
-0.8319349, -1.491161, -3.222375, 0.7294118, 1, 0, 1,
-0.8313751, 0.1333041, -1.227584, 0.7215686, 1, 0, 1,
-0.8301207, -0.9606407, -3.074802, 0.7176471, 1, 0, 1,
-0.8203213, -0.1170807, -1.001273, 0.7098039, 1, 0, 1,
-0.819579, -0.2819124, -2.156619, 0.7058824, 1, 0, 1,
-0.8068243, -0.2604572, -2.544124, 0.6980392, 1, 0, 1,
-0.7988133, 0.9899033, -1.070528, 0.6901961, 1, 0, 1,
-0.7979623, 0.3247974, -1.789608, 0.6862745, 1, 0, 1,
-0.7965961, 0.4825105, -1.031133, 0.6784314, 1, 0, 1,
-0.7879213, 0.9814383, -1.375473, 0.6745098, 1, 0, 1,
-0.7867735, 0.3289944, 0.3885424, 0.6666667, 1, 0, 1,
-0.7844579, -0.72003, 0.315388, 0.6627451, 1, 0, 1,
-0.7826746, 0.7609355, -0.7920434, 0.654902, 1, 0, 1,
-0.7773092, -0.6377134, -2.330483, 0.6509804, 1, 0, 1,
-0.7769718, -0.1465985, -1.739631, 0.6431373, 1, 0, 1,
-0.7765372, 0.9437281, 0.2122463, 0.6392157, 1, 0, 1,
-0.7740701, -0.4697118, -1.807543, 0.6313726, 1, 0, 1,
-0.7694876, 0.02254279, -1.482624, 0.627451, 1, 0, 1,
-0.7598014, 1.415892, -0.5640285, 0.6196079, 1, 0, 1,
-0.7574783, 0.6748436, -1.028242, 0.6156863, 1, 0, 1,
-0.7519287, -1.15089, -4.30209, 0.6078432, 1, 0, 1,
-0.7473453, 0.8991932, 0.4733439, 0.6039216, 1, 0, 1,
-0.7438123, 1.066775, 1.799908, 0.5960785, 1, 0, 1,
-0.7366632, 0.5882792, -1.171178, 0.5882353, 1, 0, 1,
-0.7360698, 0.1931124, -2.7025, 0.5843138, 1, 0, 1,
-0.7334325, 0.4748216, -0.3182418, 0.5764706, 1, 0, 1,
-0.7312611, -0.8900295, -1.540072, 0.572549, 1, 0, 1,
-0.729107, 0.6128285, 1.002993, 0.5647059, 1, 0, 1,
-0.7288764, 0.789031, -0.5568104, 0.5607843, 1, 0, 1,
-0.7273241, 0.07752566, -0.2175214, 0.5529412, 1, 0, 1,
-0.7260693, 0.5183848, 0.1212605, 0.5490196, 1, 0, 1,
-0.7175159, -0.938908, -3.655828, 0.5411765, 1, 0, 1,
-0.715369, 1.083856, -0.4932971, 0.5372549, 1, 0, 1,
-0.7136616, 0.6550978, 0.03688173, 0.5294118, 1, 0, 1,
-0.7126796, 0.1163565, -2.855175, 0.5254902, 1, 0, 1,
-0.709823, 0.08795582, -1.448274, 0.5176471, 1, 0, 1,
-0.7092633, -1.367339, -3.087363, 0.5137255, 1, 0, 1,
-0.7073371, -0.6126902, -0.8922188, 0.5058824, 1, 0, 1,
-0.7045388, -1.297509, -1.425849, 0.5019608, 1, 0, 1,
-0.7001554, 0.2377052, -1.689972, 0.4941176, 1, 0, 1,
-0.6992677, 1.016603, -0.1927268, 0.4862745, 1, 0, 1,
-0.698657, -0.1501446, -1.728012, 0.4823529, 1, 0, 1,
-0.6980326, -0.7088138, -2.046171, 0.4745098, 1, 0, 1,
-0.6974756, -1.466317, -2.051256, 0.4705882, 1, 0, 1,
-0.6947877, -0.1596909, -2.087469, 0.4627451, 1, 0, 1,
-0.6892627, -2.269231, -2.818328, 0.4588235, 1, 0, 1,
-0.6803857, 0.8734442, -3.02306, 0.4509804, 1, 0, 1,
-0.675557, 0.9986196, -0.4810291, 0.4470588, 1, 0, 1,
-0.671823, -0.7085601, -1.639653, 0.4392157, 1, 0, 1,
-0.6665276, 0.5505303, -1.117276, 0.4352941, 1, 0, 1,
-0.6642556, 0.7932787, 1.778149, 0.427451, 1, 0, 1,
-0.661138, 1.083319, 0.1715855, 0.4235294, 1, 0, 1,
-0.65853, -1.307595, -3.467851, 0.4156863, 1, 0, 1,
-0.6584639, -0.173327, -3.315119, 0.4117647, 1, 0, 1,
-0.6566218, -1.019085, -2.718972, 0.4039216, 1, 0, 1,
-0.6552868, -1.292302, -2.32414, 0.3960784, 1, 0, 1,
-0.6547487, -1.169143, -2.57013, 0.3921569, 1, 0, 1,
-0.654119, -0.1128035, -1.765748, 0.3843137, 1, 0, 1,
-0.653247, -0.08004805, -2.179067, 0.3803922, 1, 0, 1,
-0.6529113, -0.4027613, -1.737733, 0.372549, 1, 0, 1,
-0.6521712, -1.118496, -3.480182, 0.3686275, 1, 0, 1,
-0.6482707, 2.828113, -0.1144891, 0.3607843, 1, 0, 1,
-0.6470007, -0.03386125, -2.871735, 0.3568628, 1, 0, 1,
-0.6402161, -2.30051, -5.007055, 0.3490196, 1, 0, 1,
-0.6397759, 1.518893, -0.06926733, 0.345098, 1, 0, 1,
-0.6332566, -1.240541, -3.02525, 0.3372549, 1, 0, 1,
-0.6325975, 0.4961776, -1.018777, 0.3333333, 1, 0, 1,
-0.6283039, 0.06995516, -3.350469, 0.3254902, 1, 0, 1,
-0.6259486, 1.010058, 1.145825, 0.3215686, 1, 0, 1,
-0.6255376, 1.256854, 0.9818352, 0.3137255, 1, 0, 1,
-0.6237405, -0.3096014, -0.573303, 0.3098039, 1, 0, 1,
-0.6175985, 0.158304, 1.377205, 0.3019608, 1, 0, 1,
-0.6108329, -1.955881, -2.492876, 0.2941177, 1, 0, 1,
-0.6073425, -1.077822, -3.841018, 0.2901961, 1, 0, 1,
-0.606361, -0.5013749, -1.343511, 0.282353, 1, 0, 1,
-0.6058493, -0.9503891, 0.3109467, 0.2784314, 1, 0, 1,
-0.6021781, -2.026852, -3.723248, 0.2705882, 1, 0, 1,
-0.5925997, -0.2647188, -2.712902, 0.2666667, 1, 0, 1,
-0.5845143, 0.7163377, 0.7400463, 0.2588235, 1, 0, 1,
-0.5818508, -0.07950316, -1.617887, 0.254902, 1, 0, 1,
-0.5783911, -1.318498, -4.347372, 0.2470588, 1, 0, 1,
-0.5755408, -0.3853147, -1.463726, 0.2431373, 1, 0, 1,
-0.5752641, -1.939312, -1.770447, 0.2352941, 1, 0, 1,
-0.5683461, 0.07753171, -1.746499, 0.2313726, 1, 0, 1,
-0.5648819, 0.2110555, -4.742002, 0.2235294, 1, 0, 1,
-0.5629863, 0.1721896, -0.4932401, 0.2196078, 1, 0, 1,
-0.5622811, 0.02906358, -2.355805, 0.2117647, 1, 0, 1,
-0.5619149, 0.9405709, -1.018399, 0.2078431, 1, 0, 1,
-0.5606429, -1.265303, -4.728724, 0.2, 1, 0, 1,
-0.5570456, -0.4442367, -1.782433, 0.1921569, 1, 0, 1,
-0.5554833, -0.784185, -1.818441, 0.1882353, 1, 0, 1,
-0.554787, -0.2720197, -3.363516, 0.1803922, 1, 0, 1,
-0.5543851, 1.824285, -0.426362, 0.1764706, 1, 0, 1,
-0.5515642, -1.062226, -1.244695, 0.1686275, 1, 0, 1,
-0.5506443, 0.8901008, 0.3293113, 0.1647059, 1, 0, 1,
-0.5505563, -0.6755261, -4.003601, 0.1568628, 1, 0, 1,
-0.5467278, -0.6166636, -3.531895, 0.1529412, 1, 0, 1,
-0.5424259, 0.3324343, 0.1387086, 0.145098, 1, 0, 1,
-0.5408009, -0.4632338, -2.452465, 0.1411765, 1, 0, 1,
-0.5402083, -0.2715526, -3.071428, 0.1333333, 1, 0, 1,
-0.5388829, -1.313985, -2.460078, 0.1294118, 1, 0, 1,
-0.5361717, 0.8938444, -1.33945, 0.1215686, 1, 0, 1,
-0.5289609, 2.431853, 0.5317709, 0.1176471, 1, 0, 1,
-0.5253551, 0.7178051, -0.9236025, 0.1098039, 1, 0, 1,
-0.5236664, 0.6849285, -1.354249, 0.1058824, 1, 0, 1,
-0.5127506, -0.817613, -1.192339, 0.09803922, 1, 0, 1,
-0.5112554, -0.4920059, -1.618994, 0.09019608, 1, 0, 1,
-0.5096102, 0.1445011, -0.5743518, 0.08627451, 1, 0, 1,
-0.5082988, 0.3658008, -1.862597, 0.07843138, 1, 0, 1,
-0.5035511, 1.048771, 0.3252847, 0.07450981, 1, 0, 1,
-0.5002142, -1.314809, -2.423192, 0.06666667, 1, 0, 1,
-0.4994115, 0.5740772, -1.68243, 0.0627451, 1, 0, 1,
-0.4970256, -1.286156, -2.027896, 0.05490196, 1, 0, 1,
-0.4896159, -1.180903, -3.483021, 0.05098039, 1, 0, 1,
-0.4885868, 1.130158, -0.463998, 0.04313726, 1, 0, 1,
-0.4884141, 0.2201984, -0.9356155, 0.03921569, 1, 0, 1,
-0.4833021, 1.171636, -1.081881, 0.03137255, 1, 0, 1,
-0.4800422, 0.7117379, 1.950101, 0.02745098, 1, 0, 1,
-0.4800239, -1.943739, -2.682757, 0.01960784, 1, 0, 1,
-0.4795575, -0.4964287, -2.071341, 0.01568628, 1, 0, 1,
-0.472553, -0.6767956, -1.098439, 0.007843138, 1, 0, 1,
-0.4657425, -0.219282, -0.45623, 0.003921569, 1, 0, 1,
-0.4572956, 0.139197, -0.8979449, 0, 1, 0.003921569, 1,
-0.4528764, 0.9837505, 0.1225056, 0, 1, 0.01176471, 1,
-0.4476967, -1.194846, -2.218332, 0, 1, 0.01568628, 1,
-0.4476056, -0.2856429, -1.895294, 0, 1, 0.02352941, 1,
-0.4374015, 0.951079, -1.009647, 0, 1, 0.02745098, 1,
-0.4364879, 3.43348, 0.2754223, 0, 1, 0.03529412, 1,
-0.4343555, -1.263915, -2.43606, 0, 1, 0.03921569, 1,
-0.4329115, 0.6361979, -0.824665, 0, 1, 0.04705882, 1,
-0.4261281, 1.069364, -1.561279, 0, 1, 0.05098039, 1,
-0.4248048, -2.084414, -3.420595, 0, 1, 0.05882353, 1,
-0.4227856, -0.4236445, -2.003785, 0, 1, 0.0627451, 1,
-0.419602, -0.3915842, -3.318619, 0, 1, 0.07058824, 1,
-0.4134569, -0.3588494, -2.888738, 0, 1, 0.07450981, 1,
-0.4122423, 0.9295166, -0.9986191, 0, 1, 0.08235294, 1,
-0.4045918, -0.5411151, -0.6583299, 0, 1, 0.08627451, 1,
-0.4043963, 0.5478113, -1.601588, 0, 1, 0.09411765, 1,
-0.4001603, 0.2128296, -0.3379511, 0, 1, 0.1019608, 1,
-0.3992462, 0.276603, -0.7537565, 0, 1, 0.1058824, 1,
-0.3939577, 0.3130344, -0.5278699, 0, 1, 0.1137255, 1,
-0.3919967, -1.778775, -2.527213, 0, 1, 0.1176471, 1,
-0.3913453, -0.05996634, -1.731283, 0, 1, 0.1254902, 1,
-0.3902, -1.143591, -1.939282, 0, 1, 0.1294118, 1,
-0.3860809, 0.1384451, -0.08675441, 0, 1, 0.1372549, 1,
-0.3741199, 0.3486344, -2.354098, 0, 1, 0.1411765, 1,
-0.371718, -2.222258, -2.955313, 0, 1, 0.1490196, 1,
-0.3707773, 0.3737824, -1.303941, 0, 1, 0.1529412, 1,
-0.3684745, 0.7114986, 0.512652, 0, 1, 0.1607843, 1,
-0.3684167, 1.076719, -0.1042681, 0, 1, 0.1647059, 1,
-0.3617311, -0.2707923, -2.379177, 0, 1, 0.172549, 1,
-0.3617028, -0.1754209, -3.466672, 0, 1, 0.1764706, 1,
-0.3602147, -0.3680309, -3.425177, 0, 1, 0.1843137, 1,
-0.3602121, 0.7427365, 0.1981076, 0, 1, 0.1882353, 1,
-0.360194, 0.5409033, -0.06697912, 0, 1, 0.1960784, 1,
-0.3580832, 1.4466, -1.785798, 0, 1, 0.2039216, 1,
-0.3578048, -0.2721039, -2.264707, 0, 1, 0.2078431, 1,
-0.3512704, 0.6430315, 0.02534576, 0, 1, 0.2156863, 1,
-0.3450558, 0.09165417, -0.07840033, 0, 1, 0.2196078, 1,
-0.341287, 1.138386, 0.4881459, 0, 1, 0.227451, 1,
-0.3401023, 0.5952663, -1.091526, 0, 1, 0.2313726, 1,
-0.3339906, 0.3514169, -1.068143, 0, 1, 0.2392157, 1,
-0.333738, 0.4118057, -2.628508, 0, 1, 0.2431373, 1,
-0.33305, 0.4158005, -1.291211, 0, 1, 0.2509804, 1,
-0.3287165, 1.246408, 1.729262, 0, 1, 0.254902, 1,
-0.3269063, -0.3912729, -2.527171, 0, 1, 0.2627451, 1,
-0.3115465, -0.3178918, -3.27447, 0, 1, 0.2666667, 1,
-0.3113883, 1.379902, 0.6554937, 0, 1, 0.2745098, 1,
-0.3041755, -0.4591429, -1.659878, 0, 1, 0.2784314, 1,
-0.3010703, -0.5029287, -2.394868, 0, 1, 0.2862745, 1,
-0.2978914, 0.5609169, -0.7793756, 0, 1, 0.2901961, 1,
-0.2962155, 0.2641168, -1.904643, 0, 1, 0.2980392, 1,
-0.2903525, -1.681151, -2.792984, 0, 1, 0.3058824, 1,
-0.2884967, -1.525895, -4.339087, 0, 1, 0.3098039, 1,
-0.2823939, 0.8705381, 0.1021213, 0, 1, 0.3176471, 1,
-0.2820646, 0.9282447, -0.383406, 0, 1, 0.3215686, 1,
-0.2816676, 1.973767, -0.248893, 0, 1, 0.3294118, 1,
-0.278629, -0.7279738, -5.306843, 0, 1, 0.3333333, 1,
-0.2705729, 0.5659274, 0.9407898, 0, 1, 0.3411765, 1,
-0.2651683, -1.450306, -3.330455, 0, 1, 0.345098, 1,
-0.2648826, 0.1360139, 0.2567601, 0, 1, 0.3529412, 1,
-0.2523844, 0.8012919, 0.01363301, 0, 1, 0.3568628, 1,
-0.2509384, 1.375064, -1.779443, 0, 1, 0.3647059, 1,
-0.2486334, -0.1345357, -1.47986, 0, 1, 0.3686275, 1,
-0.248604, 0.3876641, -1.723682, 0, 1, 0.3764706, 1,
-0.2439939, 1.125131, 0.04540842, 0, 1, 0.3803922, 1,
-0.2439192, 1.945967, 0.4864959, 0, 1, 0.3882353, 1,
-0.2426296, 1.422491, -1.004795, 0, 1, 0.3921569, 1,
-0.2365817, 0.4701605, -1.68025, 0, 1, 0.4, 1,
-0.2352441, 0.1305536, -2.603841, 0, 1, 0.4078431, 1,
-0.2345356, 1.216782, -0.6198116, 0, 1, 0.4117647, 1,
-0.2322567, -0.7471634, -1.566548, 0, 1, 0.4196078, 1,
-0.230985, 0.1792329, -2.562016, 0, 1, 0.4235294, 1,
-0.2305176, 0.6762902, -0.8372961, 0, 1, 0.4313726, 1,
-0.2272807, 1.349338, 0.9406031, 0, 1, 0.4352941, 1,
-0.2268901, 2.163638, 0.3182269, 0, 1, 0.4431373, 1,
-0.2259506, -1.495405, -4.396105, 0, 1, 0.4470588, 1,
-0.2241775, 0.1266261, -1.883903, 0, 1, 0.454902, 1,
-0.2231966, -0.4105353, -3.039576, 0, 1, 0.4588235, 1,
-0.2219995, -0.5109894, -3.392169, 0, 1, 0.4666667, 1,
-0.2204706, -0.008949034, -2.737003, 0, 1, 0.4705882, 1,
-0.2183418, 0.9419691, -1.107419, 0, 1, 0.4784314, 1,
-0.2107962, -0.5600609, -2.051598, 0, 1, 0.4823529, 1,
-0.2059567, 0.3154956, 0.5411539, 0, 1, 0.4901961, 1,
-0.203832, 1.346571, -1.236327, 0, 1, 0.4941176, 1,
-0.2029632, -0.8924549, -1.915761, 0, 1, 0.5019608, 1,
-0.2007803, -0.2860998, -2.248967, 0, 1, 0.509804, 1,
-0.1958999, -0.6972584, -2.768904, 0, 1, 0.5137255, 1,
-0.1928035, -1.919236, -2.021881, 0, 1, 0.5215687, 1,
-0.1919968, 0.1981494, 0.3137985, 0, 1, 0.5254902, 1,
-0.1861427, -0.8474842, -4.009202, 0, 1, 0.5333334, 1,
-0.1815351, -0.47379, -1.546938, 0, 1, 0.5372549, 1,
-0.181262, 2.524491, 0.8938874, 0, 1, 0.5450981, 1,
-0.1798408, -0.4810653, -3.387285, 0, 1, 0.5490196, 1,
-0.1776968, 1.944319, 0.2152064, 0, 1, 0.5568628, 1,
-0.1774362, -0.226727, -1.179873, 0, 1, 0.5607843, 1,
-0.1770861, -0.2608843, -1.271469, 0, 1, 0.5686275, 1,
-0.176483, 0.4279504, -3.80719, 0, 1, 0.572549, 1,
-0.1737436, 1.762089, 0.002912208, 0, 1, 0.5803922, 1,
-0.1736674, 0.4221677, -0.3337506, 0, 1, 0.5843138, 1,
-0.1601333, -0.4671468, -2.518, 0, 1, 0.5921569, 1,
-0.1581589, -1.26465, -2.848263, 0, 1, 0.5960785, 1,
-0.1494205, 0.8086279, 0.3522353, 0, 1, 0.6039216, 1,
-0.1465575, 0.2164697, -2.928523, 0, 1, 0.6117647, 1,
-0.1332184, -0.03382189, -3.051649, 0, 1, 0.6156863, 1,
-0.1323759, -0.71967, -4.864776, 0, 1, 0.6235294, 1,
-0.1264542, -1.7894, -2.978632, 0, 1, 0.627451, 1,
-0.1248035, 0.0795521, -1.843258, 0, 1, 0.6352941, 1,
-0.1235953, -1.308472, -3.411638, 0, 1, 0.6392157, 1,
-0.1222889, 0.2240271, -0.8262253, 0, 1, 0.6470588, 1,
-0.1181729, -0.2018668, -2.383207, 0, 1, 0.6509804, 1,
-0.1160858, 1.067525, -1.634681, 0, 1, 0.6588235, 1,
-0.1153616, 0.4422337, 0.03640786, 0, 1, 0.6627451, 1,
-0.1152682, 0.8187464, -1.76119, 0, 1, 0.6705883, 1,
-0.1127789, -0.8114451, -3.323524, 0, 1, 0.6745098, 1,
-0.1127243, 0.2487439, -0.01464255, 0, 1, 0.682353, 1,
-0.1125637, -1.082763, -3.366521, 0, 1, 0.6862745, 1,
-0.112527, 1.731659, -0.4438981, 0, 1, 0.6941177, 1,
-0.1102622, -0.3903766, -3.247735, 0, 1, 0.7019608, 1,
-0.1100948, 0.0727056, -1.702428, 0, 1, 0.7058824, 1,
-0.1085835, 1.430445, 1.661083, 0, 1, 0.7137255, 1,
-0.1084803, 0.8923213, 0.9013416, 0, 1, 0.7176471, 1,
-0.1060458, 0.8726795, -0.4149192, 0, 1, 0.7254902, 1,
-0.09509742, 0.1966622, -0.4725218, 0, 1, 0.7294118, 1,
-0.09344903, -1.020127, -2.842896, 0, 1, 0.7372549, 1,
-0.09245063, -1.489986, -2.561985, 0, 1, 0.7411765, 1,
-0.08839928, -0.2471549, -3.239718, 0, 1, 0.7490196, 1,
-0.08521859, -1.403854, -3.115032, 0, 1, 0.7529412, 1,
-0.08375239, -0.2581006, -4.149427, 0, 1, 0.7607843, 1,
-0.07515096, -0.4921431, -3.678695, 0, 1, 0.7647059, 1,
-0.07510266, -2.204953, -2.007481, 0, 1, 0.772549, 1,
-0.07353175, -0.4856737, -4.104723, 0, 1, 0.7764706, 1,
-0.07053976, 0.6525633, -1.580292, 0, 1, 0.7843137, 1,
-0.06836727, -0.3454145, -2.544327, 0, 1, 0.7882353, 1,
-0.06337702, 0.3136763, 0.8512731, 0, 1, 0.7960784, 1,
-0.06069156, -0.903459, -4.119167, 0, 1, 0.8039216, 1,
-0.05870607, 0.7473182, 0.17386, 0, 1, 0.8078431, 1,
-0.05703483, 0.5633668, -0.8289738, 0, 1, 0.8156863, 1,
-0.05624922, 0.2648121, 2.978024, 0, 1, 0.8196079, 1,
-0.05474905, 0.1672878, -0.7958371, 0, 1, 0.827451, 1,
-0.05337913, 0.6508649, 0.4156837, 0, 1, 0.8313726, 1,
-0.05218842, 0.06082997, -1.625809, 0, 1, 0.8392157, 1,
-0.05048852, -0.3810699, -2.378033, 0, 1, 0.8431373, 1,
-0.04920858, 1.549893, 0.7928112, 0, 1, 0.8509804, 1,
-0.04463247, 0.2907822, -0.2588655, 0, 1, 0.854902, 1,
-0.04312701, 0.817363, 0.2204023, 0, 1, 0.8627451, 1,
-0.04276891, -0.3681959, -2.966785, 0, 1, 0.8666667, 1,
-0.04258069, -0.5001425, -2.871866, 0, 1, 0.8745098, 1,
-0.03892109, 0.8333261, 1.812361, 0, 1, 0.8784314, 1,
-0.03679947, -0.8551632, -3.393354, 0, 1, 0.8862745, 1,
-0.03664503, -1.294801, -3.483919, 0, 1, 0.8901961, 1,
-0.03365232, -0.7444652, -1.69202, 0, 1, 0.8980392, 1,
-0.03270767, 0.9434903, -0.4183733, 0, 1, 0.9058824, 1,
-0.02996539, 0.09317695, -0.04643013, 0, 1, 0.9098039, 1,
-0.02917646, 1.057385, -0.3110989, 0, 1, 0.9176471, 1,
-0.02757768, 1.478174, 1.859791, 0, 1, 0.9215686, 1,
-0.02570619, 0.6898214, -0.07270011, 0, 1, 0.9294118, 1,
-0.02035735, -1.301397, -4.533182, 0, 1, 0.9333333, 1,
-0.01442822, 0.4376225, -0.2396597, 0, 1, 0.9411765, 1,
-0.01411033, 0.1167223, 0.03183179, 0, 1, 0.945098, 1,
-0.01245012, -0.4518006, -2.863491, 0, 1, 0.9529412, 1,
-0.01217053, -0.4445357, -4.004159, 0, 1, 0.9568627, 1,
-0.006781314, -0.3361239, -3.552895, 0, 1, 0.9647059, 1,
-0.002678836, -0.5334876, -4.361161, 0, 1, 0.9686275, 1,
-0.001384975, 1.531703, 1.599801, 0, 1, 0.9764706, 1,
0.001199406, -0.002492358, 0.4057795, 0, 1, 0.9803922, 1,
0.003760302, -0.04291128, 2.357573, 0, 1, 0.9882353, 1,
0.005794711, 1.912833, -1.264457, 0, 1, 0.9921569, 1,
0.006890735, 0.7311604, 0.0776256, 0, 1, 1, 1,
0.006917676, 0.1488402, -0.04546271, 0, 0.9921569, 1, 1,
0.009407457, 0.8249676, 1.232676, 0, 0.9882353, 1, 1,
0.01498625, -1.591404, 4.063895, 0, 0.9803922, 1, 1,
0.01572184, -0.3426712, 2.421106, 0, 0.9764706, 1, 1,
0.01776227, 1.450543, 1.23301, 0, 0.9686275, 1, 1,
0.01998793, -0.1862606, 3.111056, 0, 0.9647059, 1, 1,
0.02201035, 0.678116, 0.02220538, 0, 0.9568627, 1, 1,
0.02353868, -0.311969, 2.680645, 0, 0.9529412, 1, 1,
0.02800009, -0.08190017, 1.42929, 0, 0.945098, 1, 1,
0.02823463, 1.084468, -0.01354421, 0, 0.9411765, 1, 1,
0.02839118, 1.146415, -0.373772, 0, 0.9333333, 1, 1,
0.02847695, 0.06377755, -0.645683, 0, 0.9294118, 1, 1,
0.03428864, -1.108365, 5.524466, 0, 0.9215686, 1, 1,
0.03466133, -0.2425054, 2.971318, 0, 0.9176471, 1, 1,
0.03525245, -0.3477903, 4.699391, 0, 0.9098039, 1, 1,
0.03743965, 0.8178115, -2.735512, 0, 0.9058824, 1, 1,
0.03769825, 0.8943346, 0.453045, 0, 0.8980392, 1, 1,
0.0385512, 0.782787, 0.8450739, 0, 0.8901961, 1, 1,
0.04016304, -0.4650549, 1.904686, 0, 0.8862745, 1, 1,
0.04031191, -1.255652, 4.69903, 0, 0.8784314, 1, 1,
0.04105951, 0.3449064, -1.300491, 0, 0.8745098, 1, 1,
0.0421988, 1.195062, 0.9477986, 0, 0.8666667, 1, 1,
0.04570584, -0.9115885, 3.209394, 0, 0.8627451, 1, 1,
0.04651539, -1.420575, 4.540847, 0, 0.854902, 1, 1,
0.05262972, 1.958503, 0.1233462, 0, 0.8509804, 1, 1,
0.05610112, -3.240971, 3.124316, 0, 0.8431373, 1, 1,
0.05841611, 1.052199, -0.07036508, 0, 0.8392157, 1, 1,
0.05862932, 0.1010086, 0.6428443, 0, 0.8313726, 1, 1,
0.05959939, -0.857222, 3.489269, 0, 0.827451, 1, 1,
0.06119729, -0.6260796, 2.632186, 0, 0.8196079, 1, 1,
0.06211635, 0.6092917, 0.5600597, 0, 0.8156863, 1, 1,
0.06485923, 0.1129606, 1.112827, 0, 0.8078431, 1, 1,
0.06543639, 0.5706723, 0.1550384, 0, 0.8039216, 1, 1,
0.06737572, -0.1661122, 2.32658, 0, 0.7960784, 1, 1,
0.06746423, -0.7591053, 4.198986, 0, 0.7882353, 1, 1,
0.06914612, 1.699965, 1.103813, 0, 0.7843137, 1, 1,
0.07377814, 0.4424319, -0.002361461, 0, 0.7764706, 1, 1,
0.07516579, -1.504731, 3.525255, 0, 0.772549, 1, 1,
0.07589076, -1.231129, 3.411504, 0, 0.7647059, 1, 1,
0.07641677, -1.125834, 2.62469, 0, 0.7607843, 1, 1,
0.07666502, 0.3647888, -0.7216079, 0, 0.7529412, 1, 1,
0.07771052, -2.808397, 4.241879, 0, 0.7490196, 1, 1,
0.084387, -0.4380418, 0.8439525, 0, 0.7411765, 1, 1,
0.08565591, 0.835838, 0.4267459, 0, 0.7372549, 1, 1,
0.09360247, 0.4888708, 2.047703, 0, 0.7294118, 1, 1,
0.09670789, 0.5228228, -0.4840201, 0, 0.7254902, 1, 1,
0.09954628, -0.2127672, 3.350945, 0, 0.7176471, 1, 1,
0.1017634, 0.5742667, -0.4737992, 0, 0.7137255, 1, 1,
0.1026051, 1.357383, 1.103416, 0, 0.7058824, 1, 1,
0.1026282, -0.7470396, 2.115864, 0, 0.6980392, 1, 1,
0.106371, 0.6901658, -0.8177088, 0, 0.6941177, 1, 1,
0.1084794, -1.839801, 4.287529, 0, 0.6862745, 1, 1,
0.1113337, 0.3906283, 0.1282877, 0, 0.682353, 1, 1,
0.1143577, -0.05916328, 2.660595, 0, 0.6745098, 1, 1,
0.1150523, 0.3833296, 0.1905155, 0, 0.6705883, 1, 1,
0.1189155, -0.8102452, 2.118906, 0, 0.6627451, 1, 1,
0.1203167, -1.481994, 3.022892, 0, 0.6588235, 1, 1,
0.1217185, -2.624239, 3.591213, 0, 0.6509804, 1, 1,
0.1290767, 1.043759, 0.6892926, 0, 0.6470588, 1, 1,
0.1322996, -0.3814716, 2.564641, 0, 0.6392157, 1, 1,
0.140236, 0.6366861, -1.773188, 0, 0.6352941, 1, 1,
0.1449796, 0.02591941, 0.09474025, 0, 0.627451, 1, 1,
0.147256, -1.383563, 3.944777, 0, 0.6235294, 1, 1,
0.1485952, 0.0313427, 2.847709, 0, 0.6156863, 1, 1,
0.1509372, -1.00237, 2.80558, 0, 0.6117647, 1, 1,
0.1511359, -0.6223717, 3.823341, 0, 0.6039216, 1, 1,
0.1536477, -0.9822238, 3.072859, 0, 0.5960785, 1, 1,
0.1601359, 0.6694199, 0.02366417, 0, 0.5921569, 1, 1,
0.166318, 1.458906, -0.2851728, 0, 0.5843138, 1, 1,
0.1666087, 1.581561, -0.6599338, 0, 0.5803922, 1, 1,
0.1719596, -1.607775, 3.305006, 0, 0.572549, 1, 1,
0.1733346, 0.5050681, -0.03752292, 0, 0.5686275, 1, 1,
0.1741979, 1.570243, -0.8741255, 0, 0.5607843, 1, 1,
0.1780173, 0.7232832, -1.451172, 0, 0.5568628, 1, 1,
0.1793203, -0.1753879, 3.36107, 0, 0.5490196, 1, 1,
0.1816863, 0.9685549, 1.701817, 0, 0.5450981, 1, 1,
0.1847266, 2.118572, -1.207725, 0, 0.5372549, 1, 1,
0.1912853, -1.25753, 6.151054, 0, 0.5333334, 1, 1,
0.1917736, -0.5692438, 1.790045, 0, 0.5254902, 1, 1,
0.1926525, 1.103269, -1.002084, 0, 0.5215687, 1, 1,
0.1930829, 1.114802, 0.2763562, 0, 0.5137255, 1, 1,
0.1950499, -0.001572659, 1.979067, 0, 0.509804, 1, 1,
0.2003748, 0.5670397, -0.7156236, 0, 0.5019608, 1, 1,
0.2017883, -1.57685, 4.130541, 0, 0.4941176, 1, 1,
0.2064069, -0.3905886, 3.757001, 0, 0.4901961, 1, 1,
0.2095269, -1.032039, 2.829341, 0, 0.4823529, 1, 1,
0.2120555, -0.9506698, 2.295211, 0, 0.4784314, 1, 1,
0.2136549, -0.5463189, 2.82799, 0, 0.4705882, 1, 1,
0.2140397, 0.9306743, 0.4631723, 0, 0.4666667, 1, 1,
0.2165439, 1.222344, 0.3460232, 0, 0.4588235, 1, 1,
0.2196404, -1.122601, 0.9956324, 0, 0.454902, 1, 1,
0.2209592, 0.2265305, 0.3067046, 0, 0.4470588, 1, 1,
0.2211934, -0.6784879, 3.654357, 0, 0.4431373, 1, 1,
0.221206, -0.2493042, 3.886805, 0, 0.4352941, 1, 1,
0.2224207, 0.5069504, 1.660513, 0, 0.4313726, 1, 1,
0.22384, 1.84745, -0.2161504, 0, 0.4235294, 1, 1,
0.2275753, -0.05094485, 1.230565, 0, 0.4196078, 1, 1,
0.2298702, 0.2689346, 0.130591, 0, 0.4117647, 1, 1,
0.2305, 1.666235, -0.8184035, 0, 0.4078431, 1, 1,
0.2311704, 0.1030108, 0.43546, 0, 0.4, 1, 1,
0.2315414, -0.8460014, 2.47757, 0, 0.3921569, 1, 1,
0.231972, 1.160835, -0.3757316, 0, 0.3882353, 1, 1,
0.2323976, -1.269196, 4.475733, 0, 0.3803922, 1, 1,
0.2423379, -2.167305, 3.33338, 0, 0.3764706, 1, 1,
0.2508675, 0.4528468, 0.8032322, 0, 0.3686275, 1, 1,
0.2543477, -1.885873, 2.751406, 0, 0.3647059, 1, 1,
0.2600418, -0.4171249, 3.409405, 0, 0.3568628, 1, 1,
0.2606655, 0.2744455, 1.534452, 0, 0.3529412, 1, 1,
0.2608946, -1.498279, 3.489612, 0, 0.345098, 1, 1,
0.2657646, 1.26992, -0.8823665, 0, 0.3411765, 1, 1,
0.2687875, 0.6119696, -0.08069314, 0, 0.3333333, 1, 1,
0.2722444, 0.9641511, -0.6740429, 0, 0.3294118, 1, 1,
0.2724023, 0.2816574, 0.9331676, 0, 0.3215686, 1, 1,
0.2748296, -0.2181321, 2.75279, 0, 0.3176471, 1, 1,
0.2774735, -1.006823, 2.871922, 0, 0.3098039, 1, 1,
0.2780985, -1.636951, 2.467087, 0, 0.3058824, 1, 1,
0.2796381, -0.2990408, 3.587832, 0, 0.2980392, 1, 1,
0.2815737, -0.5656059, 3.848056, 0, 0.2901961, 1, 1,
0.2856755, 2.067477, 1.030108, 0, 0.2862745, 1, 1,
0.2926665, -0.1184042, 4.127842, 0, 0.2784314, 1, 1,
0.2952488, 1.678511, -1.647331, 0, 0.2745098, 1, 1,
0.300277, -2.318341, 3.374776, 0, 0.2666667, 1, 1,
0.3058363, -2.286052, 3.337602, 0, 0.2627451, 1, 1,
0.3100288, 0.9981858, 0.6440468, 0, 0.254902, 1, 1,
0.3125097, -1.493754, 1.481842, 0, 0.2509804, 1, 1,
0.3175275, -0.4609854, 3.829527, 0, 0.2431373, 1, 1,
0.3200283, 0.09774959, 1.731745, 0, 0.2392157, 1, 1,
0.3228686, -1.26692, 1.844783, 0, 0.2313726, 1, 1,
0.3296597, -0.1180277, 2.266106, 0, 0.227451, 1, 1,
0.3318465, 1.185553, -0.2665655, 0, 0.2196078, 1, 1,
0.3340744, 1.012802, 0.4953443, 0, 0.2156863, 1, 1,
0.3375573, 1.760159, -0.7668219, 0, 0.2078431, 1, 1,
0.3425691, 1.024951, -0.6919507, 0, 0.2039216, 1, 1,
0.3463089, 0.3059326, 0.2025045, 0, 0.1960784, 1, 1,
0.3493645, -0.8733227, 2.449406, 0, 0.1882353, 1, 1,
0.3517523, 0.372356, 1.574649, 0, 0.1843137, 1, 1,
0.3605804, -0.666936, 1.067264, 0, 0.1764706, 1, 1,
0.3648817, 1.76404, 1.042855, 0, 0.172549, 1, 1,
0.3649591, 0.1526735, 1.546917, 0, 0.1647059, 1, 1,
0.3708715, -0.5860686, 2.7947, 0, 0.1607843, 1, 1,
0.3709336, -0.04719691, 1.677321, 0, 0.1529412, 1, 1,
0.3739808, -1.409628, 2.108152, 0, 0.1490196, 1, 1,
0.3744747, 0.8548868, -2.251474, 0, 0.1411765, 1, 1,
0.3759734, 1.715001, 2.461229, 0, 0.1372549, 1, 1,
0.3799148, -1.019043, 2.593933, 0, 0.1294118, 1, 1,
0.3809811, -0.6391865, 1.669029, 0, 0.1254902, 1, 1,
0.3814811, -1.54758, 2.574619, 0, 0.1176471, 1, 1,
0.3826126, 0.2142224, 0.8975289, 0, 0.1137255, 1, 1,
0.386595, 1.374704, 2.933007, 0, 0.1058824, 1, 1,
0.3876622, -0.9274092, 2.590672, 0, 0.09803922, 1, 1,
0.3885033, 1.460864, -0.755444, 0, 0.09411765, 1, 1,
0.3918575, -0.9920087, 3.763962, 0, 0.08627451, 1, 1,
0.3945749, 0.09183443, 2.080156, 0, 0.08235294, 1, 1,
0.4085386, 1.321301, 1.928671, 0, 0.07450981, 1, 1,
0.4099207, 0.7945925, 1.437577, 0, 0.07058824, 1, 1,
0.414228, -0.1303389, 3.265002, 0, 0.0627451, 1, 1,
0.4150307, 0.4158538, 1.803984, 0, 0.05882353, 1, 1,
0.4156734, -0.5853565, 2.987008, 0, 0.05098039, 1, 1,
0.4166975, -0.07050583, 2.419299, 0, 0.04705882, 1, 1,
0.4214613, -1.378569, 2.601939, 0, 0.03921569, 1, 1,
0.4237238, -0.3191685, 1.591802, 0, 0.03529412, 1, 1,
0.4247394, -1.991071, 3.115002, 0, 0.02745098, 1, 1,
0.4255118, 0.7149447, 2.684463, 0, 0.02352941, 1, 1,
0.4266062, 1.216734, 1.546845, 0, 0.01568628, 1, 1,
0.4300881, -0.1107668, 1.699361, 0, 0.01176471, 1, 1,
0.437357, 0.3495011, 1.153793, 0, 0.003921569, 1, 1,
0.4406445, -2.030521, 3.218251, 0.003921569, 0, 1, 1,
0.4421723, 1.556212, 0.8693061, 0.007843138, 0, 1, 1,
0.4476667, 1.388093, -0.7442831, 0.01568628, 0, 1, 1,
0.4501236, 1.667275, 1.298994, 0.01960784, 0, 1, 1,
0.4507216, -0.6734633, 2.384475, 0.02745098, 0, 1, 1,
0.4512654, -0.3262508, 2.763279, 0.03137255, 0, 1, 1,
0.4524146, -2.45188, 3.530286, 0.03921569, 0, 1, 1,
0.4567173, -0.5720652, 2.477897, 0.04313726, 0, 1, 1,
0.4573818, -0.03924814, 2.201164, 0.05098039, 0, 1, 1,
0.4580157, 0.6676648, 1.314409, 0.05490196, 0, 1, 1,
0.467631, 0.7153885, 1.05814, 0.0627451, 0, 1, 1,
0.4694706, 1.408027, -0.02770896, 0.06666667, 0, 1, 1,
0.4717458, -0.77227, 1.896267, 0.07450981, 0, 1, 1,
0.4782155, 1.259053, 2.132522, 0.07843138, 0, 1, 1,
0.4827567, 0.8297874, 0.317699, 0.08627451, 0, 1, 1,
0.4846658, 1.381502, -0.1377239, 0.09019608, 0, 1, 1,
0.484825, -0.9316742, 2.227262, 0.09803922, 0, 1, 1,
0.4849342, -1.53851, 3.321384, 0.1058824, 0, 1, 1,
0.4860108, 0.8873083, 0.6711518, 0.1098039, 0, 1, 1,
0.4957886, 0.1247647, -0.4805535, 0.1176471, 0, 1, 1,
0.5086841, 1.643809, 0.3792551, 0.1215686, 0, 1, 1,
0.5095835, -0.4763328, 3.074728, 0.1294118, 0, 1, 1,
0.5110686, -0.7541692, 2.621898, 0.1333333, 0, 1, 1,
0.5119722, -1.110743, 2.410464, 0.1411765, 0, 1, 1,
0.5171936, 1.606933, -0.5521245, 0.145098, 0, 1, 1,
0.5177436, -0.9326902, 4.234067, 0.1529412, 0, 1, 1,
0.5244398, -1.321956, 4.322052, 0.1568628, 0, 1, 1,
0.5255622, -1.401827, 2.597009, 0.1647059, 0, 1, 1,
0.5283858, 1.142633, 1.662535, 0.1686275, 0, 1, 1,
0.5301229, 1.097319, 0.3720578, 0.1764706, 0, 1, 1,
0.5388876, 0.0124808, 1.873383, 0.1803922, 0, 1, 1,
0.5477912, 0.591991, -0.8332976, 0.1882353, 0, 1, 1,
0.5484127, -1.360613, 0.971176, 0.1921569, 0, 1, 1,
0.5485819, 0.3007169, 0.835471, 0.2, 0, 1, 1,
0.5674537, -1.041562, 3.441287, 0.2078431, 0, 1, 1,
0.5679265, -0.4821256, 1.890568, 0.2117647, 0, 1, 1,
0.5728641, 0.02019368, 1.671138, 0.2196078, 0, 1, 1,
0.5742343, -0.09521881, 2.191822, 0.2235294, 0, 1, 1,
0.5766385, 0.06223318, 1.219625, 0.2313726, 0, 1, 1,
0.5838453, 1.570539, -0.2024322, 0.2352941, 0, 1, 1,
0.5839792, 0.7473408, 1.075508, 0.2431373, 0, 1, 1,
0.5848815, 0.8739445, 1.321155, 0.2470588, 0, 1, 1,
0.5853156, 1.15676, 1.199906, 0.254902, 0, 1, 1,
0.5859029, -0.5473071, 0.6857328, 0.2588235, 0, 1, 1,
0.5859507, -0.6212348, 2.753102, 0.2666667, 0, 1, 1,
0.5881591, -0.6818227, 1.610342, 0.2705882, 0, 1, 1,
0.5897053, -1.501207, 3.170693, 0.2784314, 0, 1, 1,
0.5924664, 0.7735966, -0.03444937, 0.282353, 0, 1, 1,
0.5961388, -0.8370112, 2.007374, 0.2901961, 0, 1, 1,
0.6009123, 0.2908981, 0.2593576, 0.2941177, 0, 1, 1,
0.6019924, 0.3370382, 1.178076, 0.3019608, 0, 1, 1,
0.6034853, 0.710437, -0.2272408, 0.3098039, 0, 1, 1,
0.6037176, -0.1687496, 2.517951, 0.3137255, 0, 1, 1,
0.6044588, -1.174541, 3.96162, 0.3215686, 0, 1, 1,
0.6083269, -0.6464546, 2.261042, 0.3254902, 0, 1, 1,
0.6134399, -0.4646232, 1.36467, 0.3333333, 0, 1, 1,
0.6166264, -0.5191113, 1.461865, 0.3372549, 0, 1, 1,
0.6282154, 0.0002674334, 1.948669, 0.345098, 0, 1, 1,
0.6297084, -1.413867, 2.458967, 0.3490196, 0, 1, 1,
0.6321986, 2.078933, -0.751334, 0.3568628, 0, 1, 1,
0.6385385, -1.135409, 1.872522, 0.3607843, 0, 1, 1,
0.6444086, -0.08484206, 1.875485, 0.3686275, 0, 1, 1,
0.6491382, 0.05051025, 1.677975, 0.372549, 0, 1, 1,
0.6525903, 0.3045339, 3.112078, 0.3803922, 0, 1, 1,
0.6528317, -0.4395066, 1.021683, 0.3843137, 0, 1, 1,
0.66019, 1.269907, -0.2830883, 0.3921569, 0, 1, 1,
0.660248, 0.2763443, 0.76544, 0.3960784, 0, 1, 1,
0.6610888, -1.373304, 2.768989, 0.4039216, 0, 1, 1,
0.6654991, 1.425204, 1.156581, 0.4117647, 0, 1, 1,
0.6657832, 0.4357921, 1.542731, 0.4156863, 0, 1, 1,
0.6670541, -0.4948727, -0.1783746, 0.4235294, 0, 1, 1,
0.6719196, -0.3666239, 2.610706, 0.427451, 0, 1, 1,
0.6822278, 0.2215446, 1.044276, 0.4352941, 0, 1, 1,
0.6858289, -0.04221775, 2.038668, 0.4392157, 0, 1, 1,
0.6919379, 0.3349279, 1.072294, 0.4470588, 0, 1, 1,
0.694212, -0.6442198, 2.739612, 0.4509804, 0, 1, 1,
0.6951467, -0.4809827, 2.893346, 0.4588235, 0, 1, 1,
0.696955, -0.445606, 1.679658, 0.4627451, 0, 1, 1,
0.6971664, 0.01690432, 3.111752, 0.4705882, 0, 1, 1,
0.7009454, -0.4807551, 2.152511, 0.4745098, 0, 1, 1,
0.704499, -0.3574034, 2.114078, 0.4823529, 0, 1, 1,
0.711923, 1.487291, 1.374058, 0.4862745, 0, 1, 1,
0.7241624, -1.141505, 2.820337, 0.4941176, 0, 1, 1,
0.7306746, 0.158773, 1.619423, 0.5019608, 0, 1, 1,
0.7352678, -1.283134, 2.223236, 0.5058824, 0, 1, 1,
0.7364783, 0.4872435, 2.938637, 0.5137255, 0, 1, 1,
0.7371688, 0.7113854, 0.7584303, 0.5176471, 0, 1, 1,
0.7408615, -0.6626729, 1.324353, 0.5254902, 0, 1, 1,
0.7495224, -1.626128, 1.878522, 0.5294118, 0, 1, 1,
0.7512464, -0.6584916, 1.270471, 0.5372549, 0, 1, 1,
0.7521014, -0.5430981, 0.6954236, 0.5411765, 0, 1, 1,
0.7523577, 1.437075, -1.537477, 0.5490196, 0, 1, 1,
0.7525466, -0.4281081, 2.312868, 0.5529412, 0, 1, 1,
0.7587241, -1.31995, 2.44893, 0.5607843, 0, 1, 1,
0.7588897, 1.012512, 0.4337685, 0.5647059, 0, 1, 1,
0.7608156, -0.162392, 2.005107, 0.572549, 0, 1, 1,
0.7628651, -1.846869, 3.879799, 0.5764706, 0, 1, 1,
0.766218, 0.5954509, 1.7818, 0.5843138, 0, 1, 1,
0.7666802, 0.0773305, 2.135166, 0.5882353, 0, 1, 1,
0.7738925, 2.317087, -1.562724, 0.5960785, 0, 1, 1,
0.7749078, -2.339589, 3.202762, 0.6039216, 0, 1, 1,
0.7753778, -0.9228097, 3.63603, 0.6078432, 0, 1, 1,
0.7770935, 0.6838672, -1.451905, 0.6156863, 0, 1, 1,
0.7796787, 1.799445, -1.089812, 0.6196079, 0, 1, 1,
0.7820308, 0.5236042, -0.3616403, 0.627451, 0, 1, 1,
0.7887147, -2.009352, 2.458723, 0.6313726, 0, 1, 1,
0.7893497, 0.4351869, 1.096005, 0.6392157, 0, 1, 1,
0.7907538, 0.7545195, -0.8683256, 0.6431373, 0, 1, 1,
0.7914084, -0.8821111, 2.403649, 0.6509804, 0, 1, 1,
0.794691, 0.1971585, 1.567117, 0.654902, 0, 1, 1,
0.8003662, 1.223271, 1.544701, 0.6627451, 0, 1, 1,
0.8010133, 0.7127181, 0.3112667, 0.6666667, 0, 1, 1,
0.8016829, -0.2046644, 1.155052, 0.6745098, 0, 1, 1,
0.8019912, -2.553382, 1.89497, 0.6784314, 0, 1, 1,
0.8023422, -0.7707026, 2.762671, 0.6862745, 0, 1, 1,
0.8036493, -0.4802857, 1.509751, 0.6901961, 0, 1, 1,
0.8066072, 0.07296013, 0.521262, 0.6980392, 0, 1, 1,
0.8142735, -1.719041, 3.689424, 0.7058824, 0, 1, 1,
0.8195732, 0.2307121, 1.890488, 0.7098039, 0, 1, 1,
0.8204261, 1.225006, -0.4419574, 0.7176471, 0, 1, 1,
0.8253565, -0.1018774, 0.1282221, 0.7215686, 0, 1, 1,
0.8376349, 0.3066858, 3.186372, 0.7294118, 0, 1, 1,
0.8377596, 0.5518659, 2.144657, 0.7333333, 0, 1, 1,
0.8417819, 0.403536, 0.723065, 0.7411765, 0, 1, 1,
0.8433039, 0.4711224, 0.402391, 0.7450981, 0, 1, 1,
0.8474602, 0.9188058, -0.7008583, 0.7529412, 0, 1, 1,
0.8491979, -0.40513, -0.08290733, 0.7568628, 0, 1, 1,
0.8547497, -1.766828, 1.476474, 0.7647059, 0, 1, 1,
0.8568943, -0.0776246, 0.6794532, 0.7686275, 0, 1, 1,
0.8569314, -0.3421067, 2.868745, 0.7764706, 0, 1, 1,
0.8576367, 0.9931332, 0.6396792, 0.7803922, 0, 1, 1,
0.8659393, -1.168146, 2.348535, 0.7882353, 0, 1, 1,
0.866085, -0.4857267, 1.146008, 0.7921569, 0, 1, 1,
0.8699341, -0.05129601, 2.402096, 0.8, 0, 1, 1,
0.8725766, -0.5051557, 1.275134, 0.8078431, 0, 1, 1,
0.8746896, 0.8131374, -0.1741901, 0.8117647, 0, 1, 1,
0.8848304, 0.5697767, 0.9678523, 0.8196079, 0, 1, 1,
0.8910338, 1.866632, -0.6666393, 0.8235294, 0, 1, 1,
0.9062229, -0.9258471, 1.55888, 0.8313726, 0, 1, 1,
0.9107941, 2.22628, -0.1810995, 0.8352941, 0, 1, 1,
0.916179, -0.3015419, 2.678585, 0.8431373, 0, 1, 1,
0.9197434, 0.5018964, 2.033072, 0.8470588, 0, 1, 1,
0.9238738, -1.791132, 2.860955, 0.854902, 0, 1, 1,
0.9269118, -0.3110752, 3.031971, 0.8588235, 0, 1, 1,
0.9324692, 0.7666298, 1.268065, 0.8666667, 0, 1, 1,
0.9428121, -0.8207815, 2.983577, 0.8705882, 0, 1, 1,
0.9501897, -0.5136098, 1.265952, 0.8784314, 0, 1, 1,
0.9525438, -0.2178857, 3.360139, 0.8823529, 0, 1, 1,
0.9546995, -1.273155, 1.045063, 0.8901961, 0, 1, 1,
0.9642862, 0.7416501, 0.317199, 0.8941177, 0, 1, 1,
0.9673657, -0.2077891, 1.854648, 0.9019608, 0, 1, 1,
0.9698129, 0.3524415, 1.894793, 0.9098039, 0, 1, 1,
0.9705314, 0.4691988, 1.511361, 0.9137255, 0, 1, 1,
0.9778525, -1.002709, 1.858319, 0.9215686, 0, 1, 1,
0.9793738, 0.6548557, 0.4251095, 0.9254902, 0, 1, 1,
0.9848906, 0.05355311, 2.132232, 0.9333333, 0, 1, 1,
0.9905269, -0.4133386, 1.020248, 0.9372549, 0, 1, 1,
0.9911404, -0.2783776, 2.367863, 0.945098, 0, 1, 1,
0.9974647, 0.298972, 0.5317146, 0.9490196, 0, 1, 1,
0.9979703, -0.3378633, 0.6861713, 0.9568627, 0, 1, 1,
0.9997985, -0.05750438, 1.912989, 0.9607843, 0, 1, 1,
1.008023, 0.733743, -0.1922944, 0.9686275, 0, 1, 1,
1.009361, 1.391104, 1.071967, 0.972549, 0, 1, 1,
1.010967, 0.6066236, 0.8724617, 0.9803922, 0, 1, 1,
1.012107, 0.03796438, 3.154477, 0.9843137, 0, 1, 1,
1.025168, -0.119986, 3.384111, 0.9921569, 0, 1, 1,
1.029234, 0.7329543, 1.570477, 0.9960784, 0, 1, 1,
1.030031, -0.01654961, 1.573996, 1, 0, 0.9960784, 1,
1.030584, 0.3311081, 1.944417, 1, 0, 0.9882353, 1,
1.031234, 1.211878, -0.1364672, 1, 0, 0.9843137, 1,
1.035788, 0.7458532, 1.555771, 1, 0, 0.9764706, 1,
1.03784, 0.7913805, 0.3625352, 1, 0, 0.972549, 1,
1.040459, 1.083504, 0.3409879, 1, 0, 0.9647059, 1,
1.042414, -0.2247323, 0.8947148, 1, 0, 0.9607843, 1,
1.042782, -0.5487064, 1.549243, 1, 0, 0.9529412, 1,
1.057735, -0.7499802, 2.443711, 1, 0, 0.9490196, 1,
1.059043, 1.057279, -0.1984718, 1, 0, 0.9411765, 1,
1.060399, 0.9642717, 1.023799, 1, 0, 0.9372549, 1,
1.062287, -0.002600134, 1.90905, 1, 0, 0.9294118, 1,
1.063368, -0.6931536, 0.5306633, 1, 0, 0.9254902, 1,
1.07175, -0.1598016, 1.395278, 1, 0, 0.9176471, 1,
1.076251, 0.6232626, 2.108143, 1, 0, 0.9137255, 1,
1.080692, 0.3169085, 3.196484, 1, 0, 0.9058824, 1,
1.087665, 0.5841811, 0.3058029, 1, 0, 0.9019608, 1,
1.088038, -0.7252622, 2.643519, 1, 0, 0.8941177, 1,
1.090274, 0.00628848, 1.979805, 1, 0, 0.8862745, 1,
1.090653, 0.5291519, 3.505447, 1, 0, 0.8823529, 1,
1.096053, 0.2875473, 1.733201, 1, 0, 0.8745098, 1,
1.096101, -1.130355, 1.316653, 1, 0, 0.8705882, 1,
1.104908, 0.9574186, 2.934518, 1, 0, 0.8627451, 1,
1.107503, -0.5047827, 1.337059, 1, 0, 0.8588235, 1,
1.125461, 0.8672651, 2.642673, 1, 0, 0.8509804, 1,
1.127064, -0.5867326, 1.38193, 1, 0, 0.8470588, 1,
1.127229, -0.7280267, 0.6164264, 1, 0, 0.8392157, 1,
1.130698, 0.429959, 0.7984701, 1, 0, 0.8352941, 1,
1.130908, 0.3425291, 2.951115, 1, 0, 0.827451, 1,
1.1501, -0.4191598, 1.940288, 1, 0, 0.8235294, 1,
1.153087, -1.872797, 5.078156, 1, 0, 0.8156863, 1,
1.1614, -0.3705046, 0.7171404, 1, 0, 0.8117647, 1,
1.167162, -0.7300602, 4.11387, 1, 0, 0.8039216, 1,
1.16727, 0.947251, 1.582234, 1, 0, 0.7960784, 1,
1.173282, 0.7297395, 0.8135021, 1, 0, 0.7921569, 1,
1.177247, -1.857339, 0.5765442, 1, 0, 0.7843137, 1,
1.180638, -1.062173, 1.495875, 1, 0, 0.7803922, 1,
1.183936, 0.5274391, 0.4397354, 1, 0, 0.772549, 1,
1.189639, 0.01673415, 2.635714, 1, 0, 0.7686275, 1,
1.19624, 0.2923871, 0.121545, 1, 0, 0.7607843, 1,
1.206756, -0.61699, 2.489495, 1, 0, 0.7568628, 1,
1.214487, -1.029487, 2.02538, 1, 0, 0.7490196, 1,
1.214964, -2.255574, 2.897307, 1, 0, 0.7450981, 1,
1.226959, 1.032282, -0.2827135, 1, 0, 0.7372549, 1,
1.236428, -1.382156, 2.526228, 1, 0, 0.7333333, 1,
1.2382, -0.6927465, 2.096236, 1, 0, 0.7254902, 1,
1.246604, -0.3880457, 0.9737247, 1, 0, 0.7215686, 1,
1.247963, -0.9893996, 2.64566, 1, 0, 0.7137255, 1,
1.249909, -0.7279344, 2.370941, 1, 0, 0.7098039, 1,
1.249967, 0.03565457, 2.496504, 1, 0, 0.7019608, 1,
1.257376, 0.4693696, 1.98131, 1, 0, 0.6941177, 1,
1.261174, -2.402016, 3.306256, 1, 0, 0.6901961, 1,
1.263294, 1.86287, 0.2970535, 1, 0, 0.682353, 1,
1.267377, 0.1521863, 2.163058, 1, 0, 0.6784314, 1,
1.270472, 0.3076477, 2.510489, 1, 0, 0.6705883, 1,
1.272669, -0.4489035, 3.551439, 1, 0, 0.6666667, 1,
1.281066, 2.631695, 0.9124706, 1, 0, 0.6588235, 1,
1.28398, -0.5234491, 2.064161, 1, 0, 0.654902, 1,
1.285133, -0.1113841, 2.330358, 1, 0, 0.6470588, 1,
1.29163, -0.8076433, 2.176583, 1, 0, 0.6431373, 1,
1.301238, 1.085918, 0.4408765, 1, 0, 0.6352941, 1,
1.302874, 1.330436, 0.6695122, 1, 0, 0.6313726, 1,
1.30698, 0.9829392, 0.3446937, 1, 0, 0.6235294, 1,
1.318625, -0.9448527, 2.776251, 1, 0, 0.6196079, 1,
1.320377, -1.60097, 2.499818, 1, 0, 0.6117647, 1,
1.321393, -1.413267, 3.31561, 1, 0, 0.6078432, 1,
1.323232, 0.5568579, 1.790884, 1, 0, 0.6, 1,
1.338382, -0.2342802, 0.4525152, 1, 0, 0.5921569, 1,
1.33952, -1.215601, 1.653389, 1, 0, 0.5882353, 1,
1.340724, -1.538677, 0.09575968, 1, 0, 0.5803922, 1,
1.347466, 0.02680736, -0.02178735, 1, 0, 0.5764706, 1,
1.349243, -0.3438111, 3.337341, 1, 0, 0.5686275, 1,
1.351638, -1.320442, 0.9167667, 1, 0, 0.5647059, 1,
1.355957, -0.4148242, 2.672717, 1, 0, 0.5568628, 1,
1.359416, 0.3886919, 0.9820634, 1, 0, 0.5529412, 1,
1.363774, -0.02957468, 1.965378, 1, 0, 0.5450981, 1,
1.363943, -1.813955, 2.603521, 1, 0, 0.5411765, 1,
1.368245, -0.720023, 2.786828, 1, 0, 0.5333334, 1,
1.369857, -0.4751964, 2.112906, 1, 0, 0.5294118, 1,
1.380159, 0.02225647, 1.681537, 1, 0, 0.5215687, 1,
1.385213, -0.3023656, 1.751002, 1, 0, 0.5176471, 1,
1.390402, 0.2927927, 0.2270799, 1, 0, 0.509804, 1,
1.402054, -0.6314486, 1.844931, 1, 0, 0.5058824, 1,
1.402306, -0.3762726, 3.754114, 1, 0, 0.4980392, 1,
1.408787, -1.040643, 2.749975, 1, 0, 0.4901961, 1,
1.412759, -0.4821195, 3.036837, 1, 0, 0.4862745, 1,
1.422512, -0.9478645, 3.260768, 1, 0, 0.4784314, 1,
1.430093, 0.7662123, -1.548245, 1, 0, 0.4745098, 1,
1.441974, -0.6994224, 1.416899, 1, 0, 0.4666667, 1,
1.445852, -0.7607164, 3.080342, 1, 0, 0.4627451, 1,
1.452077, -0.5566664, 3.492236, 1, 0, 0.454902, 1,
1.458394, -0.4924392, 2.097451, 1, 0, 0.4509804, 1,
1.463808, 0.3868153, 0.3710544, 1, 0, 0.4431373, 1,
1.465097, -1.513036, 1.88743, 1, 0, 0.4392157, 1,
1.471024, 0.397247, 1.545328, 1, 0, 0.4313726, 1,
1.474569, 0.9329644, 1.856319, 1, 0, 0.427451, 1,
1.48014, -0.2690426, 2.12066, 1, 0, 0.4196078, 1,
1.484009, 1.184806, 1.410781, 1, 0, 0.4156863, 1,
1.489372, -0.6997386, 2.919841, 1, 0, 0.4078431, 1,
1.528242, 1.157286, -0.2675273, 1, 0, 0.4039216, 1,
1.538559, -0.6614747, 1.146641, 1, 0, 0.3960784, 1,
1.55539, -0.8476989, 1.604982, 1, 0, 0.3882353, 1,
1.564793, 0.8920804, 2.211447, 1, 0, 0.3843137, 1,
1.572662, -0.6584583, 2.583733, 1, 0, 0.3764706, 1,
1.588402, -0.7220663, 0.9140409, 1, 0, 0.372549, 1,
1.589084, 0.8533078, -0.5527312, 1, 0, 0.3647059, 1,
1.590393, -0.5905089, 0.701968, 1, 0, 0.3607843, 1,
1.598775, 0.1396777, 0.6055063, 1, 0, 0.3529412, 1,
1.605625, 1.057727, 1.503572, 1, 0, 0.3490196, 1,
1.6066, 0.3147703, 1.957414, 1, 0, 0.3411765, 1,
1.612857, -0.300148, 0.7585106, 1, 0, 0.3372549, 1,
1.614586, -0.3541964, 2.706043, 1, 0, 0.3294118, 1,
1.618361, -1.98952, 1.587159, 1, 0, 0.3254902, 1,
1.618564, -1.057127, 2.149659, 1, 0, 0.3176471, 1,
1.622638, 1.256881, 1.576965, 1, 0, 0.3137255, 1,
1.628428, 1.907746, 0.1607824, 1, 0, 0.3058824, 1,
1.649793, 0.3795095, 1.276201, 1, 0, 0.2980392, 1,
1.653678, -0.02676116, 0.8350416, 1, 0, 0.2941177, 1,
1.68956, 2.406813, -0.7617537, 1, 0, 0.2862745, 1,
1.689842, -0.5387454, 3.359818, 1, 0, 0.282353, 1,
1.701609, 0.5183055, 2.105329, 1, 0, 0.2745098, 1,
1.704601, 1.292336, 0.482125, 1, 0, 0.2705882, 1,
1.707354, 0.06436157, 0.5552598, 1, 0, 0.2627451, 1,
1.707789, 0.01579121, 1.14047, 1, 0, 0.2588235, 1,
1.708413, -0.2848341, 0.08714803, 1, 0, 0.2509804, 1,
1.712977, 2.168234, 0.5969995, 1, 0, 0.2470588, 1,
1.717213, 0.5898244, -0.748562, 1, 0, 0.2392157, 1,
1.724062, 0.3545164, 1.497811, 1, 0, 0.2352941, 1,
1.732313, 1.202441, 1.693635, 1, 0, 0.227451, 1,
1.73994, 1.205538, 0.7733959, 1, 0, 0.2235294, 1,
1.76601, -0.6368252, 1.407734, 1, 0, 0.2156863, 1,
1.784738, -0.8174297, 3.669097, 1, 0, 0.2117647, 1,
1.800496, 1.11835, 0.8450623, 1, 0, 0.2039216, 1,
1.822823, 0.4987443, 2.654218, 1, 0, 0.1960784, 1,
1.823195, 1.527559, -0.8034191, 1, 0, 0.1921569, 1,
1.83298, -1.871789, 0.9757658, 1, 0, 0.1843137, 1,
1.835282, -2.71347, 2.567034, 1, 0, 0.1803922, 1,
1.856206, -0.8604991, 3.008043, 1, 0, 0.172549, 1,
1.869172, -0.648461, 0.9263003, 1, 0, 0.1686275, 1,
1.874181, -1.564783, 1.844095, 1, 0, 0.1607843, 1,
1.893495, -0.6737104, 2.49094, 1, 0, 0.1568628, 1,
1.934871, 0.8614012, 1.583121, 1, 0, 0.1490196, 1,
1.966034, -1.074235, 2.844736, 1, 0, 0.145098, 1,
1.991595, -1.020625, 2.182992, 1, 0, 0.1372549, 1,
2.002659, -1.369189, 2.028987, 1, 0, 0.1333333, 1,
2.03537, -1.281424, 0.09331309, 1, 0, 0.1254902, 1,
2.040013, 0.5014698, 3.206556, 1, 0, 0.1215686, 1,
2.041539, -0.5356613, 3.73008, 1, 0, 0.1137255, 1,
2.076873, -0.1000338, 2.175921, 1, 0, 0.1098039, 1,
2.077816, 0.8062001, 1.364396, 1, 0, 0.1019608, 1,
2.105824, 0.1881441, 1.602075, 1, 0, 0.09411765, 1,
2.106284, -0.6356933, 1.574614, 1, 0, 0.09019608, 1,
2.119341, 1.987148, 1.650686, 1, 0, 0.08235294, 1,
2.143303, 0.5323969, 1.321483, 1, 0, 0.07843138, 1,
2.145242, -0.3649635, 0.2049171, 1, 0, 0.07058824, 1,
2.204395, 0.700458, 2.703758, 1, 0, 0.06666667, 1,
2.336291, 0.01867101, 1.998854, 1, 0, 0.05882353, 1,
2.378102, 0.6621858, 1.179335, 1, 0, 0.05490196, 1,
2.493052, 0.8751438, 4.005839, 1, 0, 0.04705882, 1,
2.517404, -3.331082, 4.397188, 1, 0, 0.04313726, 1,
2.550391, 1.203007, 3.047502, 1, 0, 0.03529412, 1,
2.592877, 2.269524, 1.252207, 1, 0, 0.03137255, 1,
2.621314, -0.4483495, -1.05531, 1, 0, 0.02352941, 1,
2.996444, 1.210714, -0.2129574, 1, 0, 0.01960784, 1,
3.109093, 0.07875728, 0.7826244, 1, 0, 0.01176471, 1,
3.262938, -0.2722724, 2.650356, 1, 0, 0.007843138, 1
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
-0.191218, -4.477675, -7.248956, 0, -0.5, 0.5, 0.5,
-0.191218, -4.477675, -7.248956, 1, -0.5, 0.5, 0.5,
-0.191218, -4.477675, -7.248956, 1, 1.5, 0.5, 0.5,
-0.191218, -4.477675, -7.248956, 0, 1.5, 0.5, 0.5
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
-4.816333, 0.05119896, -7.248956, 0, -0.5, 0.5, 0.5,
-4.816333, 0.05119896, -7.248956, 1, -0.5, 0.5, 0.5,
-4.816333, 0.05119896, -7.248956, 1, 1.5, 0.5, 0.5,
-4.816333, 0.05119896, -7.248956, 0, 1.5, 0.5, 0.5
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
-4.816333, -4.477675, 0.4221058, 0, -0.5, 0.5, 0.5,
-4.816333, -4.477675, 0.4221058, 1, -0.5, 0.5, 0.5,
-4.816333, -4.477675, 0.4221058, 1, 1.5, 0.5, 0.5,
-4.816333, -4.477675, 0.4221058, 0, 1.5, 0.5, 0.5
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
-3, -3.43255, -5.478711,
3, -3.43255, -5.478711,
-3, -3.43255, -5.478711,
-3, -3.606738, -5.773752,
-2, -3.43255, -5.478711,
-2, -3.606738, -5.773752,
-1, -3.43255, -5.478711,
-1, -3.606738, -5.773752,
0, -3.43255, -5.478711,
0, -3.606738, -5.773752,
1, -3.43255, -5.478711,
1, -3.606738, -5.773752,
2, -3.43255, -5.478711,
2, -3.606738, -5.773752,
3, -3.43255, -5.478711,
3, -3.606738, -5.773752
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
-3, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
-3, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
-3, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
-3, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
-2, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
-2, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
-2, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
-2, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
-1, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
-1, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
-1, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
-1, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
0, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
0, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
0, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
0, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
1, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
1, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
1, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
1, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
2, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
2, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
2, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
2, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5,
3, -3.955113, -6.363834, 0, -0.5, 0.5, 0.5,
3, -3.955113, -6.363834, 1, -0.5, 0.5, 0.5,
3, -3.955113, -6.363834, 1, 1.5, 0.5, 0.5,
3, -3.955113, -6.363834, 0, 1.5, 0.5, 0.5
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
-3.748999, -3, -5.478711,
-3.748999, 3, -5.478711,
-3.748999, -3, -5.478711,
-3.926888, -3, -5.773752,
-3.748999, -2, -5.478711,
-3.926888, -2, -5.773752,
-3.748999, -1, -5.478711,
-3.926888, -1, -5.773752,
-3.748999, 0, -5.478711,
-3.926888, 0, -5.773752,
-3.748999, 1, -5.478711,
-3.926888, 1, -5.773752,
-3.748999, 2, -5.478711,
-3.926888, 2, -5.773752,
-3.748999, 3, -5.478711,
-3.926888, 3, -5.773752
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
-4.282666, -3, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, -3, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, -3, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, -3, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, -2, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, -2, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, -2, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, -2, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, -1, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, -1, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, -1, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, -1, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, 0, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, 0, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, 0, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, 0, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, 1, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, 1, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, 1, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, 1, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, 2, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, 2, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, 2, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, 2, -6.363834, 0, 1.5, 0.5, 0.5,
-4.282666, 3, -6.363834, 0, -0.5, 0.5, 0.5,
-4.282666, 3, -6.363834, 1, -0.5, 0.5, 0.5,
-4.282666, 3, -6.363834, 1, 1.5, 0.5, 0.5,
-4.282666, 3, -6.363834, 0, 1.5, 0.5, 0.5
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
-3.748999, -3.43255, -4,
-3.748999, -3.43255, 6,
-3.748999, -3.43255, -4,
-3.926888, -3.606738, -4,
-3.748999, -3.43255, -2,
-3.926888, -3.606738, -2,
-3.748999, -3.43255, 0,
-3.926888, -3.606738, 0,
-3.748999, -3.43255, 2,
-3.926888, -3.606738, 2,
-3.748999, -3.43255, 4,
-3.926888, -3.606738, 4,
-3.748999, -3.43255, 6,
-3.926888, -3.606738, 6
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
"4",
"6"
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
-4.282666, -3.955113, -4, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, -4, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, -4, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, -4, 0, 1.5, 0.5, 0.5,
-4.282666, -3.955113, -2, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, -2, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, -2, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, -2, 0, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 0, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 0, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 0, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 0, 0, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 2, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 2, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 2, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 2, 0, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 4, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 4, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 4, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 4, 0, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 6, 0, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 6, 1, -0.5, 0.5, 0.5,
-4.282666, -3.955113, 6, 1, 1.5, 0.5, 0.5,
-4.282666, -3.955113, 6, 0, 1.5, 0.5, 0.5
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
-3.748999, -3.43255, -5.478711,
-3.748999, 3.534948, -5.478711,
-3.748999, -3.43255, 6.322923,
-3.748999, 3.534948, 6.322923,
-3.748999, -3.43255, -5.478711,
-3.748999, -3.43255, 6.322923,
-3.748999, 3.534948, -5.478711,
-3.748999, 3.534948, 6.322923,
-3.748999, -3.43255, -5.478711,
3.366563, -3.43255, -5.478711,
-3.748999, -3.43255, 6.322923,
3.366563, -3.43255, 6.322923,
-3.748999, 3.534948, -5.478711,
3.366563, 3.534948, -5.478711,
-3.748999, 3.534948, 6.322923,
3.366563, 3.534948, 6.322923,
3.366563, -3.43255, -5.478711,
3.366563, 3.534948, -5.478711,
3.366563, -3.43255, 6.322923,
3.366563, 3.534948, 6.322923,
3.366563, -3.43255, -5.478711,
3.366563, -3.43255, 6.322923,
3.366563, 3.534948, -5.478711,
3.366563, 3.534948, 6.322923
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
var radius = 8.245736;
var distance = 36.68621;
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
mvMatrix.translate( 0.191218, -0.05119896, -0.4221058 );
mvMatrix.scale( 1.252951, 1.279577, 0.7554421 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.68621);
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
oxalate_dimethylarsi<-read.table("oxalate_dimethylarsi.xyz", skip=1)
```

```
## Error in read.table("oxalate_dimethylarsi.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-oxalate_dimethylarsi$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
```

```r
y<-oxalate_dimethylarsi$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
```

```r
z<-oxalate_dimethylarsi$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxalate_dimethylarsi' not found
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
-3.645374, -2.707533, -3.525436, 0, 0, 1, 1, 1,
-3.557529, 0.3457625, -1.344147, 1, 0, 0, 1, 1,
-3.217222, 0.6195547, -1.051058, 1, 0, 0, 1, 1,
-2.483997, 0.4527891, -1.381446, 1, 0, 0, 1, 1,
-2.477096, -0.771592, -2.272478, 1, 0, 0, 1, 1,
-2.45058, -2.56354, -3.59943, 1, 0, 0, 1, 1,
-2.446027, -1.34696, -2.960664, 0, 0, 0, 1, 1,
-2.417817, -0.1149685, -2.926977, 0, 0, 0, 1, 1,
-2.390878, -0.6219991, -2.206172, 0, 0, 0, 1, 1,
-2.385119, -0.2781319, -1.884194, 0, 0, 0, 1, 1,
-2.256428, -0.1811952, -1.409584, 0, 0, 0, 1, 1,
-2.255615, -1.004127, -0.9111363, 0, 0, 0, 1, 1,
-2.1629, -0.7595966, -1.872894, 0, 0, 0, 1, 1,
-2.15843, 1.884792, -0.936546, 1, 1, 1, 1, 1,
-2.148416, 1.132856, -0.6790045, 1, 1, 1, 1, 1,
-2.131348, 0.6974886, -1.84234, 1, 1, 1, 1, 1,
-1.983647, -0.04593433, -2.325164, 1, 1, 1, 1, 1,
-1.971592, 0.1302818, -1.194971, 1, 1, 1, 1, 1,
-1.950534, 0.2503296, -1.974015, 1, 1, 1, 1, 1,
-1.943828, 0.2292665, -2.396027, 1, 1, 1, 1, 1,
-1.941014, -1.792868, -3.419104, 1, 1, 1, 1, 1,
-1.940087, -1.43933, -2.651446, 1, 1, 1, 1, 1,
-1.905207, 0.536981, -1.830576, 1, 1, 1, 1, 1,
-1.878648, -0.197907, -1.685198, 1, 1, 1, 1, 1,
-1.867949, -1.318349, -1.916276, 1, 1, 1, 1, 1,
-1.866654, 0.2125564, -1.844478, 1, 1, 1, 1, 1,
-1.864773, 1.117033, -0.7913421, 1, 1, 1, 1, 1,
-1.862338, 0.6938612, -3.177121, 1, 1, 1, 1, 1,
-1.858849, -1.222912, -1.662874, 0, 0, 1, 1, 1,
-1.854212, -0.1235916, -0.8878295, 1, 0, 0, 1, 1,
-1.827641, 0.1966151, -2.296933, 1, 0, 0, 1, 1,
-1.807919, 0.7476761, -0.02350036, 1, 0, 0, 1, 1,
-1.80716, -1.719936, -1.685266, 1, 0, 0, 1, 1,
-1.802284, 0.9169505, -0.9160348, 1, 0, 0, 1, 1,
-1.787561, -0.2651066, -0.778573, 0, 0, 0, 1, 1,
-1.784802, -0.3142123, -2.601983, 0, 0, 0, 1, 1,
-1.775699, 0.7093411, 0.4368676, 0, 0, 0, 1, 1,
-1.773551, -2.518769, -1.518095, 0, 0, 0, 1, 1,
-1.753764, -0.04699681, -1.946551, 0, 0, 0, 1, 1,
-1.751883, -0.003212253, -0.8074384, 0, 0, 0, 1, 1,
-1.74706, 0.03694176, -1.380615, 0, 0, 0, 1, 1,
-1.742955, 0.1162502, -0.6898176, 1, 1, 1, 1, 1,
-1.739292, -0.530723, -1.915689, 1, 1, 1, 1, 1,
-1.728527, -0.07677174, -1.079197, 1, 1, 1, 1, 1,
-1.713578, -0.2285585, -2.107314, 1, 1, 1, 1, 1,
-1.712494, -0.8781008, -1.449066, 1, 1, 1, 1, 1,
-1.701334, 0.6278893, -1.50627, 1, 1, 1, 1, 1,
-1.695117, -0.7464837, -4.692739, 1, 1, 1, 1, 1,
-1.681412, -0.2210811, -2.09434, 1, 1, 1, 1, 1,
-1.653715, -3.005537, -1.45605, 1, 1, 1, 1, 1,
-1.647345, -0.3023093, -2.123406, 1, 1, 1, 1, 1,
-1.635724, -1.115948, -1.51475, 1, 1, 1, 1, 1,
-1.630961, -0.6853086, -2.66751, 1, 1, 1, 1, 1,
-1.624732, 0.4890417, -1.485582, 1, 1, 1, 1, 1,
-1.623195, 0.8094485, 0.4239605, 1, 1, 1, 1, 1,
-1.612139, -1.082185, -2.214252, 1, 1, 1, 1, 1,
-1.597306, -1.480656, -1.342008, 0, 0, 1, 1, 1,
-1.576985, 0.836172, -0.7189323, 1, 0, 0, 1, 1,
-1.553171, 0.7380511, -1.418653, 1, 0, 0, 1, 1,
-1.552287, -0.1343611, -1.300946, 1, 0, 0, 1, 1,
-1.538425, 0.7058257, 0.6623217, 1, 0, 0, 1, 1,
-1.530141, 1.032105, -2.488422, 1, 0, 0, 1, 1,
-1.528897, -1.468633, -0.8167088, 0, 0, 0, 1, 1,
-1.52854, -1.770607, -1.874274, 0, 0, 0, 1, 1,
-1.516013, 0.9439837, -0.4433388, 0, 0, 0, 1, 1,
-1.505251, -0.3640607, -1.091529, 0, 0, 0, 1, 1,
-1.495971, 0.7180915, -2.596258, 0, 0, 0, 1, 1,
-1.485183, -1.475932, -0.8607548, 0, 0, 0, 1, 1,
-1.465917, -0.5009131, -1.643673, 0, 0, 0, 1, 1,
-1.455514, -1.280388, -2.146339, 1, 1, 1, 1, 1,
-1.436969, -1.5164, -0.6425269, 1, 1, 1, 1, 1,
-1.43579, 1.036155, -1.307991, 1, 1, 1, 1, 1,
-1.423167, 0.8682307, -2.072807, 1, 1, 1, 1, 1,
-1.418672, -0.5104877, -1.29066, 1, 1, 1, 1, 1,
-1.417556, -0.3875757, -1.844152, 1, 1, 1, 1, 1,
-1.413717, -0.6595283, -3.042037, 1, 1, 1, 1, 1,
-1.407557, 0.3401377, -1.285836, 1, 1, 1, 1, 1,
-1.405604, 0.1897925, -1.840664, 1, 1, 1, 1, 1,
-1.390108, 0.004854808, -1.17124, 1, 1, 1, 1, 1,
-1.388862, -1.962252, -2.288425, 1, 1, 1, 1, 1,
-1.377315, 1.241445, 2.007592, 1, 1, 1, 1, 1,
-1.368185, -0.2170144, -2.46191, 1, 1, 1, 1, 1,
-1.358407, -0.7961665, -0.7090648, 1, 1, 1, 1, 1,
-1.357071, -0.2492467, -0.573054, 1, 1, 1, 1, 1,
-1.354556, 0.183074, -2.149486, 0, 0, 1, 1, 1,
-1.350106, 0.4942265, -2.116643, 1, 0, 0, 1, 1,
-1.350039, -0.488641, -3.745903, 1, 0, 0, 1, 1,
-1.347944, 0.6693866, 0.3684896, 1, 0, 0, 1, 1,
-1.347823, -0.3412268, -2.998085, 1, 0, 0, 1, 1,
-1.332542, 0.7569962, -0.9283658, 1, 0, 0, 1, 1,
-1.331445, -0.005525765, -2.134717, 0, 0, 0, 1, 1,
-1.329374, 1.468377, -0.4332275, 0, 0, 0, 1, 1,
-1.322324, -0.8999448, -3.083806, 0, 0, 0, 1, 1,
-1.304562, 0.4046458, -0.9470872, 0, 0, 0, 1, 1,
-1.304142, -1.08316, -0.7053959, 0, 0, 0, 1, 1,
-1.297028, 1.166406, -1.139505, 0, 0, 0, 1, 1,
-1.29108, -1.980722, -2.896986, 0, 0, 0, 1, 1,
-1.289407, 1.054824, -0.9369964, 1, 1, 1, 1, 1,
-1.275526, 0.5220102, -0.5548549, 1, 1, 1, 1, 1,
-1.274785, 0.3349961, -1.627727, 1, 1, 1, 1, 1,
-1.273393, 0.8681953, -2.653599, 1, 1, 1, 1, 1,
-1.264284, -2.142981, -2.306, 1, 1, 1, 1, 1,
-1.263614, 0.06516168, -0.6443047, 1, 1, 1, 1, 1,
-1.261455, 0.3284971, -2.80871, 1, 1, 1, 1, 1,
-1.259382, -0.4929803, -1.953206, 1, 1, 1, 1, 1,
-1.258641, 0.9095588, -0.09837165, 1, 1, 1, 1, 1,
-1.255617, -0.4032741, -2.002793, 1, 1, 1, 1, 1,
-1.234113, 0.736029, -1.52622, 1, 1, 1, 1, 1,
-1.231914, -0.9495737, -2.539032, 1, 1, 1, 1, 1,
-1.231855, 1.540502, -0.186353, 1, 1, 1, 1, 1,
-1.230523, -0.3305117, -0.04330772, 1, 1, 1, 1, 1,
-1.228701, 1.521738, -1.016268, 1, 1, 1, 1, 1,
-1.224509, 0.5917248, -0.5239242, 0, 0, 1, 1, 1,
-1.224323, 1.207548, 0.3157602, 1, 0, 0, 1, 1,
-1.221382, -0.1086875, -2.112313, 1, 0, 0, 1, 1,
-1.208521, -1.213418, -1.118433, 1, 0, 0, 1, 1,
-1.201164, 1.729735, -0.527715, 1, 0, 0, 1, 1,
-1.189103, -1.609241, -0.3956143, 1, 0, 0, 1, 1,
-1.187876, -0.5261859, -1.541248, 0, 0, 0, 1, 1,
-1.187011, 0.9416128, -0.9538623, 0, 0, 0, 1, 1,
-1.186851, 1.344861, -0.896438, 0, 0, 0, 1, 1,
-1.182718, -0.567022, -1.210844, 0, 0, 0, 1, 1,
-1.178334, 0.6253991, -2.198277, 0, 0, 0, 1, 1,
-1.175599, 0.4283793, -1.971553, 0, 0, 0, 1, 1,
-1.174834, 0.9769674, -2.325856, 0, 0, 0, 1, 1,
-1.172483, 0.9727623, -2.07448, 1, 1, 1, 1, 1,
-1.167878, 1.976802, -0.5074831, 1, 1, 1, 1, 1,
-1.160935, 0.9902232, -1.500382, 1, 1, 1, 1, 1,
-1.159058, 0.6001595, -0.08669835, 1, 1, 1, 1, 1,
-1.133021, 0.1373007, -1.850908, 1, 1, 1, 1, 1,
-1.131526, 0.4434957, -0.7078181, 1, 1, 1, 1, 1,
-1.130705, -0.5576959, -0.9077212, 1, 1, 1, 1, 1,
-1.13007, -0.6674852, -1.425478, 1, 1, 1, 1, 1,
-1.119188, -0.07036106, -1.749508, 1, 1, 1, 1, 1,
-1.117234, 1.271834, -1.354864, 1, 1, 1, 1, 1,
-1.110317, -1.586935, -3.169441, 1, 1, 1, 1, 1,
-1.109707, -0.4065306, -3.617577, 1, 1, 1, 1, 1,
-1.10936, -1.152233, -4.132838, 1, 1, 1, 1, 1,
-1.105856, -0.05741874, -1.067963, 1, 1, 1, 1, 1,
-1.104589, -0.6325928, -2.078003, 1, 1, 1, 1, 1,
-1.101671, -1.712236, -4.609941, 0, 0, 1, 1, 1,
-1.10121, -0.6595254, -2.15536, 1, 0, 0, 1, 1,
-1.100479, -0.7737039, -1.73734, 1, 0, 0, 1, 1,
-1.098529, 1.466037, 0.3235179, 1, 0, 0, 1, 1,
-1.096857, -0.2229085, -2.508536, 1, 0, 0, 1, 1,
-1.086744, 0.3200481, -1.650943, 1, 0, 0, 1, 1,
-1.081491, 1.099926, -1.341684, 0, 0, 0, 1, 1,
-1.077747, -0.3759576, -0.5575497, 0, 0, 0, 1, 1,
-1.065573, -1.091456, -2.79668, 0, 0, 0, 1, 1,
-1.058747, -0.2617613, -0.3221476, 0, 0, 0, 1, 1,
-1.056484, 0.1483551, -1.870804, 0, 0, 0, 1, 1,
-1.055765, 0.8022221, 0.09472457, 0, 0, 0, 1, 1,
-1.049211, -0.5204024, -2.237431, 0, 0, 0, 1, 1,
-1.048309, 0.5904907, -1.53801, 1, 1, 1, 1, 1,
-1.046731, 0.221187, 0.9423621, 1, 1, 1, 1, 1,
-1.046291, 1.763659, 0.4779283, 1, 1, 1, 1, 1,
-1.034386, -0.1162721, -2.444414, 1, 1, 1, 1, 1,
-1.02718, 1.551088, 0.02622614, 1, 1, 1, 1, 1,
-1.022536, -0.6842954, -0.574275, 1, 1, 1, 1, 1,
-1.021981, -0.7544187, -2.843654, 1, 1, 1, 1, 1,
-1.017446, 0.1772864, -1.815866, 1, 1, 1, 1, 1,
-1.013993, -0.9934343, -2.573914, 1, 1, 1, 1, 1,
-1.011294, -1.597422, -2.253206, 1, 1, 1, 1, 1,
-1.004934, -0.0001063297, -0.536515, 1, 1, 1, 1, 1,
-0.9974078, -0.3042982, -1.97979, 1, 1, 1, 1, 1,
-0.9958192, -0.192204, -2.720665, 1, 1, 1, 1, 1,
-0.995576, -0.438316, -1.607526, 1, 1, 1, 1, 1,
-0.991663, -0.6403046, -1.825315, 1, 1, 1, 1, 1,
-0.99109, 0.1693221, 0.1980835, 0, 0, 1, 1, 1,
-0.9894327, 0.9895986, -3.370933, 1, 0, 0, 1, 1,
-0.988802, 0.2936584, -1.651217, 1, 0, 0, 1, 1,
-0.9797089, 1.240382, -1.033311, 1, 0, 0, 1, 1,
-0.9785129, -1.783479, -1.091611, 1, 0, 0, 1, 1,
-0.9759787, -1.334543, -3.55752, 1, 0, 0, 1, 1,
-0.9736997, 0.2511742, 0.3599401, 0, 0, 0, 1, 1,
-0.964289, -0.03443489, -1.682676, 0, 0, 0, 1, 1,
-0.9596265, 1.169186, -0.6749569, 0, 0, 0, 1, 1,
-0.9592892, -2.114809, -3.72471, 0, 0, 0, 1, 1,
-0.9569242, -0.7350296, -3.060649, 0, 0, 0, 1, 1,
-0.9563207, -0.2363986, -1.575362, 0, 0, 0, 1, 1,
-0.9490058, -0.7804842, -1.776489, 0, 0, 0, 1, 1,
-0.9424543, -1.047022, -3.786691, 1, 1, 1, 1, 1,
-0.9360766, -0.06566159, -1.797732, 1, 1, 1, 1, 1,
-0.9318929, -0.8224013, -3.416905, 1, 1, 1, 1, 1,
-0.9211371, -0.5190569, -1.468662, 1, 1, 1, 1, 1,
-0.9188413, 0.03368408, -1.777653, 1, 1, 1, 1, 1,
-0.9172287, 0.5467494, -0.5524545, 1, 1, 1, 1, 1,
-0.9051728, -0.3191747, -1.925504, 1, 1, 1, 1, 1,
-0.9035, 1.080691, -1.747424, 1, 1, 1, 1, 1,
-0.9018088, -0.9849147, -3.018148, 1, 1, 1, 1, 1,
-0.8957149, -0.9591358, -2.968423, 1, 1, 1, 1, 1,
-0.895057, -0.04933522, -1.560565, 1, 1, 1, 1, 1,
-0.8908277, -1.662435, -3.53883, 1, 1, 1, 1, 1,
-0.8894005, 0.2799743, -0.6383586, 1, 1, 1, 1, 1,
-0.8887421, 0.4886236, -0.04662434, 1, 1, 1, 1, 1,
-0.8830588, -0.2355992, -1.706641, 1, 1, 1, 1, 1,
-0.8799644, 1.260813, 0.4788139, 0, 0, 1, 1, 1,
-0.8770409, -0.01255722, -1.428989, 1, 0, 0, 1, 1,
-0.8703095, -0.1955987, -1.359247, 1, 0, 0, 1, 1,
-0.8687351, 0.5922868, -0.7650029, 1, 0, 0, 1, 1,
-0.8683441, 0.2906857, -1.416763, 1, 0, 0, 1, 1,
-0.8659329, -0.6773973, -1.041464, 1, 0, 0, 1, 1,
-0.8613015, 1.44291, -0.6694674, 0, 0, 0, 1, 1,
-0.85909, 2.398407, -1.826346, 0, 0, 0, 1, 1,
-0.8548127, 0.8258443, -1.914245, 0, 0, 0, 1, 1,
-0.8528631, 0.5287216, -1.27495, 0, 0, 0, 1, 1,
-0.8483122, -1.933118, -3.223409, 0, 0, 0, 1, 1,
-0.8434725, -0.05131036, -2.359787, 0, 0, 0, 1, 1,
-0.8434157, 0.6691452, -0.6782053, 0, 0, 0, 1, 1,
-0.8416044, -0.5057017, -0.8374708, 1, 1, 1, 1, 1,
-0.840158, 0.5532272, -0.1192058, 1, 1, 1, 1, 1,
-0.8391712, 0.8491089, -1.772914, 1, 1, 1, 1, 1,
-0.8319349, -1.491161, -3.222375, 1, 1, 1, 1, 1,
-0.8313751, 0.1333041, -1.227584, 1, 1, 1, 1, 1,
-0.8301207, -0.9606407, -3.074802, 1, 1, 1, 1, 1,
-0.8203213, -0.1170807, -1.001273, 1, 1, 1, 1, 1,
-0.819579, -0.2819124, -2.156619, 1, 1, 1, 1, 1,
-0.8068243, -0.2604572, -2.544124, 1, 1, 1, 1, 1,
-0.7988133, 0.9899033, -1.070528, 1, 1, 1, 1, 1,
-0.7979623, 0.3247974, -1.789608, 1, 1, 1, 1, 1,
-0.7965961, 0.4825105, -1.031133, 1, 1, 1, 1, 1,
-0.7879213, 0.9814383, -1.375473, 1, 1, 1, 1, 1,
-0.7867735, 0.3289944, 0.3885424, 1, 1, 1, 1, 1,
-0.7844579, -0.72003, 0.315388, 1, 1, 1, 1, 1,
-0.7826746, 0.7609355, -0.7920434, 0, 0, 1, 1, 1,
-0.7773092, -0.6377134, -2.330483, 1, 0, 0, 1, 1,
-0.7769718, -0.1465985, -1.739631, 1, 0, 0, 1, 1,
-0.7765372, 0.9437281, 0.2122463, 1, 0, 0, 1, 1,
-0.7740701, -0.4697118, -1.807543, 1, 0, 0, 1, 1,
-0.7694876, 0.02254279, -1.482624, 1, 0, 0, 1, 1,
-0.7598014, 1.415892, -0.5640285, 0, 0, 0, 1, 1,
-0.7574783, 0.6748436, -1.028242, 0, 0, 0, 1, 1,
-0.7519287, -1.15089, -4.30209, 0, 0, 0, 1, 1,
-0.7473453, 0.8991932, 0.4733439, 0, 0, 0, 1, 1,
-0.7438123, 1.066775, 1.799908, 0, 0, 0, 1, 1,
-0.7366632, 0.5882792, -1.171178, 0, 0, 0, 1, 1,
-0.7360698, 0.1931124, -2.7025, 0, 0, 0, 1, 1,
-0.7334325, 0.4748216, -0.3182418, 1, 1, 1, 1, 1,
-0.7312611, -0.8900295, -1.540072, 1, 1, 1, 1, 1,
-0.729107, 0.6128285, 1.002993, 1, 1, 1, 1, 1,
-0.7288764, 0.789031, -0.5568104, 1, 1, 1, 1, 1,
-0.7273241, 0.07752566, -0.2175214, 1, 1, 1, 1, 1,
-0.7260693, 0.5183848, 0.1212605, 1, 1, 1, 1, 1,
-0.7175159, -0.938908, -3.655828, 1, 1, 1, 1, 1,
-0.715369, 1.083856, -0.4932971, 1, 1, 1, 1, 1,
-0.7136616, 0.6550978, 0.03688173, 1, 1, 1, 1, 1,
-0.7126796, 0.1163565, -2.855175, 1, 1, 1, 1, 1,
-0.709823, 0.08795582, -1.448274, 1, 1, 1, 1, 1,
-0.7092633, -1.367339, -3.087363, 1, 1, 1, 1, 1,
-0.7073371, -0.6126902, -0.8922188, 1, 1, 1, 1, 1,
-0.7045388, -1.297509, -1.425849, 1, 1, 1, 1, 1,
-0.7001554, 0.2377052, -1.689972, 1, 1, 1, 1, 1,
-0.6992677, 1.016603, -0.1927268, 0, 0, 1, 1, 1,
-0.698657, -0.1501446, -1.728012, 1, 0, 0, 1, 1,
-0.6980326, -0.7088138, -2.046171, 1, 0, 0, 1, 1,
-0.6974756, -1.466317, -2.051256, 1, 0, 0, 1, 1,
-0.6947877, -0.1596909, -2.087469, 1, 0, 0, 1, 1,
-0.6892627, -2.269231, -2.818328, 1, 0, 0, 1, 1,
-0.6803857, 0.8734442, -3.02306, 0, 0, 0, 1, 1,
-0.675557, 0.9986196, -0.4810291, 0, 0, 0, 1, 1,
-0.671823, -0.7085601, -1.639653, 0, 0, 0, 1, 1,
-0.6665276, 0.5505303, -1.117276, 0, 0, 0, 1, 1,
-0.6642556, 0.7932787, 1.778149, 0, 0, 0, 1, 1,
-0.661138, 1.083319, 0.1715855, 0, 0, 0, 1, 1,
-0.65853, -1.307595, -3.467851, 0, 0, 0, 1, 1,
-0.6584639, -0.173327, -3.315119, 1, 1, 1, 1, 1,
-0.6566218, -1.019085, -2.718972, 1, 1, 1, 1, 1,
-0.6552868, -1.292302, -2.32414, 1, 1, 1, 1, 1,
-0.6547487, -1.169143, -2.57013, 1, 1, 1, 1, 1,
-0.654119, -0.1128035, -1.765748, 1, 1, 1, 1, 1,
-0.653247, -0.08004805, -2.179067, 1, 1, 1, 1, 1,
-0.6529113, -0.4027613, -1.737733, 1, 1, 1, 1, 1,
-0.6521712, -1.118496, -3.480182, 1, 1, 1, 1, 1,
-0.6482707, 2.828113, -0.1144891, 1, 1, 1, 1, 1,
-0.6470007, -0.03386125, -2.871735, 1, 1, 1, 1, 1,
-0.6402161, -2.30051, -5.007055, 1, 1, 1, 1, 1,
-0.6397759, 1.518893, -0.06926733, 1, 1, 1, 1, 1,
-0.6332566, -1.240541, -3.02525, 1, 1, 1, 1, 1,
-0.6325975, 0.4961776, -1.018777, 1, 1, 1, 1, 1,
-0.6283039, 0.06995516, -3.350469, 1, 1, 1, 1, 1,
-0.6259486, 1.010058, 1.145825, 0, 0, 1, 1, 1,
-0.6255376, 1.256854, 0.9818352, 1, 0, 0, 1, 1,
-0.6237405, -0.3096014, -0.573303, 1, 0, 0, 1, 1,
-0.6175985, 0.158304, 1.377205, 1, 0, 0, 1, 1,
-0.6108329, -1.955881, -2.492876, 1, 0, 0, 1, 1,
-0.6073425, -1.077822, -3.841018, 1, 0, 0, 1, 1,
-0.606361, -0.5013749, -1.343511, 0, 0, 0, 1, 1,
-0.6058493, -0.9503891, 0.3109467, 0, 0, 0, 1, 1,
-0.6021781, -2.026852, -3.723248, 0, 0, 0, 1, 1,
-0.5925997, -0.2647188, -2.712902, 0, 0, 0, 1, 1,
-0.5845143, 0.7163377, 0.7400463, 0, 0, 0, 1, 1,
-0.5818508, -0.07950316, -1.617887, 0, 0, 0, 1, 1,
-0.5783911, -1.318498, -4.347372, 0, 0, 0, 1, 1,
-0.5755408, -0.3853147, -1.463726, 1, 1, 1, 1, 1,
-0.5752641, -1.939312, -1.770447, 1, 1, 1, 1, 1,
-0.5683461, 0.07753171, -1.746499, 1, 1, 1, 1, 1,
-0.5648819, 0.2110555, -4.742002, 1, 1, 1, 1, 1,
-0.5629863, 0.1721896, -0.4932401, 1, 1, 1, 1, 1,
-0.5622811, 0.02906358, -2.355805, 1, 1, 1, 1, 1,
-0.5619149, 0.9405709, -1.018399, 1, 1, 1, 1, 1,
-0.5606429, -1.265303, -4.728724, 1, 1, 1, 1, 1,
-0.5570456, -0.4442367, -1.782433, 1, 1, 1, 1, 1,
-0.5554833, -0.784185, -1.818441, 1, 1, 1, 1, 1,
-0.554787, -0.2720197, -3.363516, 1, 1, 1, 1, 1,
-0.5543851, 1.824285, -0.426362, 1, 1, 1, 1, 1,
-0.5515642, -1.062226, -1.244695, 1, 1, 1, 1, 1,
-0.5506443, 0.8901008, 0.3293113, 1, 1, 1, 1, 1,
-0.5505563, -0.6755261, -4.003601, 1, 1, 1, 1, 1,
-0.5467278, -0.6166636, -3.531895, 0, 0, 1, 1, 1,
-0.5424259, 0.3324343, 0.1387086, 1, 0, 0, 1, 1,
-0.5408009, -0.4632338, -2.452465, 1, 0, 0, 1, 1,
-0.5402083, -0.2715526, -3.071428, 1, 0, 0, 1, 1,
-0.5388829, -1.313985, -2.460078, 1, 0, 0, 1, 1,
-0.5361717, 0.8938444, -1.33945, 1, 0, 0, 1, 1,
-0.5289609, 2.431853, 0.5317709, 0, 0, 0, 1, 1,
-0.5253551, 0.7178051, -0.9236025, 0, 0, 0, 1, 1,
-0.5236664, 0.6849285, -1.354249, 0, 0, 0, 1, 1,
-0.5127506, -0.817613, -1.192339, 0, 0, 0, 1, 1,
-0.5112554, -0.4920059, -1.618994, 0, 0, 0, 1, 1,
-0.5096102, 0.1445011, -0.5743518, 0, 0, 0, 1, 1,
-0.5082988, 0.3658008, -1.862597, 0, 0, 0, 1, 1,
-0.5035511, 1.048771, 0.3252847, 1, 1, 1, 1, 1,
-0.5002142, -1.314809, -2.423192, 1, 1, 1, 1, 1,
-0.4994115, 0.5740772, -1.68243, 1, 1, 1, 1, 1,
-0.4970256, -1.286156, -2.027896, 1, 1, 1, 1, 1,
-0.4896159, -1.180903, -3.483021, 1, 1, 1, 1, 1,
-0.4885868, 1.130158, -0.463998, 1, 1, 1, 1, 1,
-0.4884141, 0.2201984, -0.9356155, 1, 1, 1, 1, 1,
-0.4833021, 1.171636, -1.081881, 1, 1, 1, 1, 1,
-0.4800422, 0.7117379, 1.950101, 1, 1, 1, 1, 1,
-0.4800239, -1.943739, -2.682757, 1, 1, 1, 1, 1,
-0.4795575, -0.4964287, -2.071341, 1, 1, 1, 1, 1,
-0.472553, -0.6767956, -1.098439, 1, 1, 1, 1, 1,
-0.4657425, -0.219282, -0.45623, 1, 1, 1, 1, 1,
-0.4572956, 0.139197, -0.8979449, 1, 1, 1, 1, 1,
-0.4528764, 0.9837505, 0.1225056, 1, 1, 1, 1, 1,
-0.4476967, -1.194846, -2.218332, 0, 0, 1, 1, 1,
-0.4476056, -0.2856429, -1.895294, 1, 0, 0, 1, 1,
-0.4374015, 0.951079, -1.009647, 1, 0, 0, 1, 1,
-0.4364879, 3.43348, 0.2754223, 1, 0, 0, 1, 1,
-0.4343555, -1.263915, -2.43606, 1, 0, 0, 1, 1,
-0.4329115, 0.6361979, -0.824665, 1, 0, 0, 1, 1,
-0.4261281, 1.069364, -1.561279, 0, 0, 0, 1, 1,
-0.4248048, -2.084414, -3.420595, 0, 0, 0, 1, 1,
-0.4227856, -0.4236445, -2.003785, 0, 0, 0, 1, 1,
-0.419602, -0.3915842, -3.318619, 0, 0, 0, 1, 1,
-0.4134569, -0.3588494, -2.888738, 0, 0, 0, 1, 1,
-0.4122423, 0.9295166, -0.9986191, 0, 0, 0, 1, 1,
-0.4045918, -0.5411151, -0.6583299, 0, 0, 0, 1, 1,
-0.4043963, 0.5478113, -1.601588, 1, 1, 1, 1, 1,
-0.4001603, 0.2128296, -0.3379511, 1, 1, 1, 1, 1,
-0.3992462, 0.276603, -0.7537565, 1, 1, 1, 1, 1,
-0.3939577, 0.3130344, -0.5278699, 1, 1, 1, 1, 1,
-0.3919967, -1.778775, -2.527213, 1, 1, 1, 1, 1,
-0.3913453, -0.05996634, -1.731283, 1, 1, 1, 1, 1,
-0.3902, -1.143591, -1.939282, 1, 1, 1, 1, 1,
-0.3860809, 0.1384451, -0.08675441, 1, 1, 1, 1, 1,
-0.3741199, 0.3486344, -2.354098, 1, 1, 1, 1, 1,
-0.371718, -2.222258, -2.955313, 1, 1, 1, 1, 1,
-0.3707773, 0.3737824, -1.303941, 1, 1, 1, 1, 1,
-0.3684745, 0.7114986, 0.512652, 1, 1, 1, 1, 1,
-0.3684167, 1.076719, -0.1042681, 1, 1, 1, 1, 1,
-0.3617311, -0.2707923, -2.379177, 1, 1, 1, 1, 1,
-0.3617028, -0.1754209, -3.466672, 1, 1, 1, 1, 1,
-0.3602147, -0.3680309, -3.425177, 0, 0, 1, 1, 1,
-0.3602121, 0.7427365, 0.1981076, 1, 0, 0, 1, 1,
-0.360194, 0.5409033, -0.06697912, 1, 0, 0, 1, 1,
-0.3580832, 1.4466, -1.785798, 1, 0, 0, 1, 1,
-0.3578048, -0.2721039, -2.264707, 1, 0, 0, 1, 1,
-0.3512704, 0.6430315, 0.02534576, 1, 0, 0, 1, 1,
-0.3450558, 0.09165417, -0.07840033, 0, 0, 0, 1, 1,
-0.341287, 1.138386, 0.4881459, 0, 0, 0, 1, 1,
-0.3401023, 0.5952663, -1.091526, 0, 0, 0, 1, 1,
-0.3339906, 0.3514169, -1.068143, 0, 0, 0, 1, 1,
-0.333738, 0.4118057, -2.628508, 0, 0, 0, 1, 1,
-0.33305, 0.4158005, -1.291211, 0, 0, 0, 1, 1,
-0.3287165, 1.246408, 1.729262, 0, 0, 0, 1, 1,
-0.3269063, -0.3912729, -2.527171, 1, 1, 1, 1, 1,
-0.3115465, -0.3178918, -3.27447, 1, 1, 1, 1, 1,
-0.3113883, 1.379902, 0.6554937, 1, 1, 1, 1, 1,
-0.3041755, -0.4591429, -1.659878, 1, 1, 1, 1, 1,
-0.3010703, -0.5029287, -2.394868, 1, 1, 1, 1, 1,
-0.2978914, 0.5609169, -0.7793756, 1, 1, 1, 1, 1,
-0.2962155, 0.2641168, -1.904643, 1, 1, 1, 1, 1,
-0.2903525, -1.681151, -2.792984, 1, 1, 1, 1, 1,
-0.2884967, -1.525895, -4.339087, 1, 1, 1, 1, 1,
-0.2823939, 0.8705381, 0.1021213, 1, 1, 1, 1, 1,
-0.2820646, 0.9282447, -0.383406, 1, 1, 1, 1, 1,
-0.2816676, 1.973767, -0.248893, 1, 1, 1, 1, 1,
-0.278629, -0.7279738, -5.306843, 1, 1, 1, 1, 1,
-0.2705729, 0.5659274, 0.9407898, 1, 1, 1, 1, 1,
-0.2651683, -1.450306, -3.330455, 1, 1, 1, 1, 1,
-0.2648826, 0.1360139, 0.2567601, 0, 0, 1, 1, 1,
-0.2523844, 0.8012919, 0.01363301, 1, 0, 0, 1, 1,
-0.2509384, 1.375064, -1.779443, 1, 0, 0, 1, 1,
-0.2486334, -0.1345357, -1.47986, 1, 0, 0, 1, 1,
-0.248604, 0.3876641, -1.723682, 1, 0, 0, 1, 1,
-0.2439939, 1.125131, 0.04540842, 1, 0, 0, 1, 1,
-0.2439192, 1.945967, 0.4864959, 0, 0, 0, 1, 1,
-0.2426296, 1.422491, -1.004795, 0, 0, 0, 1, 1,
-0.2365817, 0.4701605, -1.68025, 0, 0, 0, 1, 1,
-0.2352441, 0.1305536, -2.603841, 0, 0, 0, 1, 1,
-0.2345356, 1.216782, -0.6198116, 0, 0, 0, 1, 1,
-0.2322567, -0.7471634, -1.566548, 0, 0, 0, 1, 1,
-0.230985, 0.1792329, -2.562016, 0, 0, 0, 1, 1,
-0.2305176, 0.6762902, -0.8372961, 1, 1, 1, 1, 1,
-0.2272807, 1.349338, 0.9406031, 1, 1, 1, 1, 1,
-0.2268901, 2.163638, 0.3182269, 1, 1, 1, 1, 1,
-0.2259506, -1.495405, -4.396105, 1, 1, 1, 1, 1,
-0.2241775, 0.1266261, -1.883903, 1, 1, 1, 1, 1,
-0.2231966, -0.4105353, -3.039576, 1, 1, 1, 1, 1,
-0.2219995, -0.5109894, -3.392169, 1, 1, 1, 1, 1,
-0.2204706, -0.008949034, -2.737003, 1, 1, 1, 1, 1,
-0.2183418, 0.9419691, -1.107419, 1, 1, 1, 1, 1,
-0.2107962, -0.5600609, -2.051598, 1, 1, 1, 1, 1,
-0.2059567, 0.3154956, 0.5411539, 1, 1, 1, 1, 1,
-0.203832, 1.346571, -1.236327, 1, 1, 1, 1, 1,
-0.2029632, -0.8924549, -1.915761, 1, 1, 1, 1, 1,
-0.2007803, -0.2860998, -2.248967, 1, 1, 1, 1, 1,
-0.1958999, -0.6972584, -2.768904, 1, 1, 1, 1, 1,
-0.1928035, -1.919236, -2.021881, 0, 0, 1, 1, 1,
-0.1919968, 0.1981494, 0.3137985, 1, 0, 0, 1, 1,
-0.1861427, -0.8474842, -4.009202, 1, 0, 0, 1, 1,
-0.1815351, -0.47379, -1.546938, 1, 0, 0, 1, 1,
-0.181262, 2.524491, 0.8938874, 1, 0, 0, 1, 1,
-0.1798408, -0.4810653, -3.387285, 1, 0, 0, 1, 1,
-0.1776968, 1.944319, 0.2152064, 0, 0, 0, 1, 1,
-0.1774362, -0.226727, -1.179873, 0, 0, 0, 1, 1,
-0.1770861, -0.2608843, -1.271469, 0, 0, 0, 1, 1,
-0.176483, 0.4279504, -3.80719, 0, 0, 0, 1, 1,
-0.1737436, 1.762089, 0.002912208, 0, 0, 0, 1, 1,
-0.1736674, 0.4221677, -0.3337506, 0, 0, 0, 1, 1,
-0.1601333, -0.4671468, -2.518, 0, 0, 0, 1, 1,
-0.1581589, -1.26465, -2.848263, 1, 1, 1, 1, 1,
-0.1494205, 0.8086279, 0.3522353, 1, 1, 1, 1, 1,
-0.1465575, 0.2164697, -2.928523, 1, 1, 1, 1, 1,
-0.1332184, -0.03382189, -3.051649, 1, 1, 1, 1, 1,
-0.1323759, -0.71967, -4.864776, 1, 1, 1, 1, 1,
-0.1264542, -1.7894, -2.978632, 1, 1, 1, 1, 1,
-0.1248035, 0.0795521, -1.843258, 1, 1, 1, 1, 1,
-0.1235953, -1.308472, -3.411638, 1, 1, 1, 1, 1,
-0.1222889, 0.2240271, -0.8262253, 1, 1, 1, 1, 1,
-0.1181729, -0.2018668, -2.383207, 1, 1, 1, 1, 1,
-0.1160858, 1.067525, -1.634681, 1, 1, 1, 1, 1,
-0.1153616, 0.4422337, 0.03640786, 1, 1, 1, 1, 1,
-0.1152682, 0.8187464, -1.76119, 1, 1, 1, 1, 1,
-0.1127789, -0.8114451, -3.323524, 1, 1, 1, 1, 1,
-0.1127243, 0.2487439, -0.01464255, 1, 1, 1, 1, 1,
-0.1125637, -1.082763, -3.366521, 0, 0, 1, 1, 1,
-0.112527, 1.731659, -0.4438981, 1, 0, 0, 1, 1,
-0.1102622, -0.3903766, -3.247735, 1, 0, 0, 1, 1,
-0.1100948, 0.0727056, -1.702428, 1, 0, 0, 1, 1,
-0.1085835, 1.430445, 1.661083, 1, 0, 0, 1, 1,
-0.1084803, 0.8923213, 0.9013416, 1, 0, 0, 1, 1,
-0.1060458, 0.8726795, -0.4149192, 0, 0, 0, 1, 1,
-0.09509742, 0.1966622, -0.4725218, 0, 0, 0, 1, 1,
-0.09344903, -1.020127, -2.842896, 0, 0, 0, 1, 1,
-0.09245063, -1.489986, -2.561985, 0, 0, 0, 1, 1,
-0.08839928, -0.2471549, -3.239718, 0, 0, 0, 1, 1,
-0.08521859, -1.403854, -3.115032, 0, 0, 0, 1, 1,
-0.08375239, -0.2581006, -4.149427, 0, 0, 0, 1, 1,
-0.07515096, -0.4921431, -3.678695, 1, 1, 1, 1, 1,
-0.07510266, -2.204953, -2.007481, 1, 1, 1, 1, 1,
-0.07353175, -0.4856737, -4.104723, 1, 1, 1, 1, 1,
-0.07053976, 0.6525633, -1.580292, 1, 1, 1, 1, 1,
-0.06836727, -0.3454145, -2.544327, 1, 1, 1, 1, 1,
-0.06337702, 0.3136763, 0.8512731, 1, 1, 1, 1, 1,
-0.06069156, -0.903459, -4.119167, 1, 1, 1, 1, 1,
-0.05870607, 0.7473182, 0.17386, 1, 1, 1, 1, 1,
-0.05703483, 0.5633668, -0.8289738, 1, 1, 1, 1, 1,
-0.05624922, 0.2648121, 2.978024, 1, 1, 1, 1, 1,
-0.05474905, 0.1672878, -0.7958371, 1, 1, 1, 1, 1,
-0.05337913, 0.6508649, 0.4156837, 1, 1, 1, 1, 1,
-0.05218842, 0.06082997, -1.625809, 1, 1, 1, 1, 1,
-0.05048852, -0.3810699, -2.378033, 1, 1, 1, 1, 1,
-0.04920858, 1.549893, 0.7928112, 1, 1, 1, 1, 1,
-0.04463247, 0.2907822, -0.2588655, 0, 0, 1, 1, 1,
-0.04312701, 0.817363, 0.2204023, 1, 0, 0, 1, 1,
-0.04276891, -0.3681959, -2.966785, 1, 0, 0, 1, 1,
-0.04258069, -0.5001425, -2.871866, 1, 0, 0, 1, 1,
-0.03892109, 0.8333261, 1.812361, 1, 0, 0, 1, 1,
-0.03679947, -0.8551632, -3.393354, 1, 0, 0, 1, 1,
-0.03664503, -1.294801, -3.483919, 0, 0, 0, 1, 1,
-0.03365232, -0.7444652, -1.69202, 0, 0, 0, 1, 1,
-0.03270767, 0.9434903, -0.4183733, 0, 0, 0, 1, 1,
-0.02996539, 0.09317695, -0.04643013, 0, 0, 0, 1, 1,
-0.02917646, 1.057385, -0.3110989, 0, 0, 0, 1, 1,
-0.02757768, 1.478174, 1.859791, 0, 0, 0, 1, 1,
-0.02570619, 0.6898214, -0.07270011, 0, 0, 0, 1, 1,
-0.02035735, -1.301397, -4.533182, 1, 1, 1, 1, 1,
-0.01442822, 0.4376225, -0.2396597, 1, 1, 1, 1, 1,
-0.01411033, 0.1167223, 0.03183179, 1, 1, 1, 1, 1,
-0.01245012, -0.4518006, -2.863491, 1, 1, 1, 1, 1,
-0.01217053, -0.4445357, -4.004159, 1, 1, 1, 1, 1,
-0.006781314, -0.3361239, -3.552895, 1, 1, 1, 1, 1,
-0.002678836, -0.5334876, -4.361161, 1, 1, 1, 1, 1,
-0.001384975, 1.531703, 1.599801, 1, 1, 1, 1, 1,
0.001199406, -0.002492358, 0.4057795, 1, 1, 1, 1, 1,
0.003760302, -0.04291128, 2.357573, 1, 1, 1, 1, 1,
0.005794711, 1.912833, -1.264457, 1, 1, 1, 1, 1,
0.006890735, 0.7311604, 0.0776256, 1, 1, 1, 1, 1,
0.006917676, 0.1488402, -0.04546271, 1, 1, 1, 1, 1,
0.009407457, 0.8249676, 1.232676, 1, 1, 1, 1, 1,
0.01498625, -1.591404, 4.063895, 1, 1, 1, 1, 1,
0.01572184, -0.3426712, 2.421106, 0, 0, 1, 1, 1,
0.01776227, 1.450543, 1.23301, 1, 0, 0, 1, 1,
0.01998793, -0.1862606, 3.111056, 1, 0, 0, 1, 1,
0.02201035, 0.678116, 0.02220538, 1, 0, 0, 1, 1,
0.02353868, -0.311969, 2.680645, 1, 0, 0, 1, 1,
0.02800009, -0.08190017, 1.42929, 1, 0, 0, 1, 1,
0.02823463, 1.084468, -0.01354421, 0, 0, 0, 1, 1,
0.02839118, 1.146415, -0.373772, 0, 0, 0, 1, 1,
0.02847695, 0.06377755, -0.645683, 0, 0, 0, 1, 1,
0.03428864, -1.108365, 5.524466, 0, 0, 0, 1, 1,
0.03466133, -0.2425054, 2.971318, 0, 0, 0, 1, 1,
0.03525245, -0.3477903, 4.699391, 0, 0, 0, 1, 1,
0.03743965, 0.8178115, -2.735512, 0, 0, 0, 1, 1,
0.03769825, 0.8943346, 0.453045, 1, 1, 1, 1, 1,
0.0385512, 0.782787, 0.8450739, 1, 1, 1, 1, 1,
0.04016304, -0.4650549, 1.904686, 1, 1, 1, 1, 1,
0.04031191, -1.255652, 4.69903, 1, 1, 1, 1, 1,
0.04105951, 0.3449064, -1.300491, 1, 1, 1, 1, 1,
0.0421988, 1.195062, 0.9477986, 1, 1, 1, 1, 1,
0.04570584, -0.9115885, 3.209394, 1, 1, 1, 1, 1,
0.04651539, -1.420575, 4.540847, 1, 1, 1, 1, 1,
0.05262972, 1.958503, 0.1233462, 1, 1, 1, 1, 1,
0.05610112, -3.240971, 3.124316, 1, 1, 1, 1, 1,
0.05841611, 1.052199, -0.07036508, 1, 1, 1, 1, 1,
0.05862932, 0.1010086, 0.6428443, 1, 1, 1, 1, 1,
0.05959939, -0.857222, 3.489269, 1, 1, 1, 1, 1,
0.06119729, -0.6260796, 2.632186, 1, 1, 1, 1, 1,
0.06211635, 0.6092917, 0.5600597, 1, 1, 1, 1, 1,
0.06485923, 0.1129606, 1.112827, 0, 0, 1, 1, 1,
0.06543639, 0.5706723, 0.1550384, 1, 0, 0, 1, 1,
0.06737572, -0.1661122, 2.32658, 1, 0, 0, 1, 1,
0.06746423, -0.7591053, 4.198986, 1, 0, 0, 1, 1,
0.06914612, 1.699965, 1.103813, 1, 0, 0, 1, 1,
0.07377814, 0.4424319, -0.002361461, 1, 0, 0, 1, 1,
0.07516579, -1.504731, 3.525255, 0, 0, 0, 1, 1,
0.07589076, -1.231129, 3.411504, 0, 0, 0, 1, 1,
0.07641677, -1.125834, 2.62469, 0, 0, 0, 1, 1,
0.07666502, 0.3647888, -0.7216079, 0, 0, 0, 1, 1,
0.07771052, -2.808397, 4.241879, 0, 0, 0, 1, 1,
0.084387, -0.4380418, 0.8439525, 0, 0, 0, 1, 1,
0.08565591, 0.835838, 0.4267459, 0, 0, 0, 1, 1,
0.09360247, 0.4888708, 2.047703, 1, 1, 1, 1, 1,
0.09670789, 0.5228228, -0.4840201, 1, 1, 1, 1, 1,
0.09954628, -0.2127672, 3.350945, 1, 1, 1, 1, 1,
0.1017634, 0.5742667, -0.4737992, 1, 1, 1, 1, 1,
0.1026051, 1.357383, 1.103416, 1, 1, 1, 1, 1,
0.1026282, -0.7470396, 2.115864, 1, 1, 1, 1, 1,
0.106371, 0.6901658, -0.8177088, 1, 1, 1, 1, 1,
0.1084794, -1.839801, 4.287529, 1, 1, 1, 1, 1,
0.1113337, 0.3906283, 0.1282877, 1, 1, 1, 1, 1,
0.1143577, -0.05916328, 2.660595, 1, 1, 1, 1, 1,
0.1150523, 0.3833296, 0.1905155, 1, 1, 1, 1, 1,
0.1189155, -0.8102452, 2.118906, 1, 1, 1, 1, 1,
0.1203167, -1.481994, 3.022892, 1, 1, 1, 1, 1,
0.1217185, -2.624239, 3.591213, 1, 1, 1, 1, 1,
0.1290767, 1.043759, 0.6892926, 1, 1, 1, 1, 1,
0.1322996, -0.3814716, 2.564641, 0, 0, 1, 1, 1,
0.140236, 0.6366861, -1.773188, 1, 0, 0, 1, 1,
0.1449796, 0.02591941, 0.09474025, 1, 0, 0, 1, 1,
0.147256, -1.383563, 3.944777, 1, 0, 0, 1, 1,
0.1485952, 0.0313427, 2.847709, 1, 0, 0, 1, 1,
0.1509372, -1.00237, 2.80558, 1, 0, 0, 1, 1,
0.1511359, -0.6223717, 3.823341, 0, 0, 0, 1, 1,
0.1536477, -0.9822238, 3.072859, 0, 0, 0, 1, 1,
0.1601359, 0.6694199, 0.02366417, 0, 0, 0, 1, 1,
0.166318, 1.458906, -0.2851728, 0, 0, 0, 1, 1,
0.1666087, 1.581561, -0.6599338, 0, 0, 0, 1, 1,
0.1719596, -1.607775, 3.305006, 0, 0, 0, 1, 1,
0.1733346, 0.5050681, -0.03752292, 0, 0, 0, 1, 1,
0.1741979, 1.570243, -0.8741255, 1, 1, 1, 1, 1,
0.1780173, 0.7232832, -1.451172, 1, 1, 1, 1, 1,
0.1793203, -0.1753879, 3.36107, 1, 1, 1, 1, 1,
0.1816863, 0.9685549, 1.701817, 1, 1, 1, 1, 1,
0.1847266, 2.118572, -1.207725, 1, 1, 1, 1, 1,
0.1912853, -1.25753, 6.151054, 1, 1, 1, 1, 1,
0.1917736, -0.5692438, 1.790045, 1, 1, 1, 1, 1,
0.1926525, 1.103269, -1.002084, 1, 1, 1, 1, 1,
0.1930829, 1.114802, 0.2763562, 1, 1, 1, 1, 1,
0.1950499, -0.001572659, 1.979067, 1, 1, 1, 1, 1,
0.2003748, 0.5670397, -0.7156236, 1, 1, 1, 1, 1,
0.2017883, -1.57685, 4.130541, 1, 1, 1, 1, 1,
0.2064069, -0.3905886, 3.757001, 1, 1, 1, 1, 1,
0.2095269, -1.032039, 2.829341, 1, 1, 1, 1, 1,
0.2120555, -0.9506698, 2.295211, 1, 1, 1, 1, 1,
0.2136549, -0.5463189, 2.82799, 0, 0, 1, 1, 1,
0.2140397, 0.9306743, 0.4631723, 1, 0, 0, 1, 1,
0.2165439, 1.222344, 0.3460232, 1, 0, 0, 1, 1,
0.2196404, -1.122601, 0.9956324, 1, 0, 0, 1, 1,
0.2209592, 0.2265305, 0.3067046, 1, 0, 0, 1, 1,
0.2211934, -0.6784879, 3.654357, 1, 0, 0, 1, 1,
0.221206, -0.2493042, 3.886805, 0, 0, 0, 1, 1,
0.2224207, 0.5069504, 1.660513, 0, 0, 0, 1, 1,
0.22384, 1.84745, -0.2161504, 0, 0, 0, 1, 1,
0.2275753, -0.05094485, 1.230565, 0, 0, 0, 1, 1,
0.2298702, 0.2689346, 0.130591, 0, 0, 0, 1, 1,
0.2305, 1.666235, -0.8184035, 0, 0, 0, 1, 1,
0.2311704, 0.1030108, 0.43546, 0, 0, 0, 1, 1,
0.2315414, -0.8460014, 2.47757, 1, 1, 1, 1, 1,
0.231972, 1.160835, -0.3757316, 1, 1, 1, 1, 1,
0.2323976, -1.269196, 4.475733, 1, 1, 1, 1, 1,
0.2423379, -2.167305, 3.33338, 1, 1, 1, 1, 1,
0.2508675, 0.4528468, 0.8032322, 1, 1, 1, 1, 1,
0.2543477, -1.885873, 2.751406, 1, 1, 1, 1, 1,
0.2600418, -0.4171249, 3.409405, 1, 1, 1, 1, 1,
0.2606655, 0.2744455, 1.534452, 1, 1, 1, 1, 1,
0.2608946, -1.498279, 3.489612, 1, 1, 1, 1, 1,
0.2657646, 1.26992, -0.8823665, 1, 1, 1, 1, 1,
0.2687875, 0.6119696, -0.08069314, 1, 1, 1, 1, 1,
0.2722444, 0.9641511, -0.6740429, 1, 1, 1, 1, 1,
0.2724023, 0.2816574, 0.9331676, 1, 1, 1, 1, 1,
0.2748296, -0.2181321, 2.75279, 1, 1, 1, 1, 1,
0.2774735, -1.006823, 2.871922, 1, 1, 1, 1, 1,
0.2780985, -1.636951, 2.467087, 0, 0, 1, 1, 1,
0.2796381, -0.2990408, 3.587832, 1, 0, 0, 1, 1,
0.2815737, -0.5656059, 3.848056, 1, 0, 0, 1, 1,
0.2856755, 2.067477, 1.030108, 1, 0, 0, 1, 1,
0.2926665, -0.1184042, 4.127842, 1, 0, 0, 1, 1,
0.2952488, 1.678511, -1.647331, 1, 0, 0, 1, 1,
0.300277, -2.318341, 3.374776, 0, 0, 0, 1, 1,
0.3058363, -2.286052, 3.337602, 0, 0, 0, 1, 1,
0.3100288, 0.9981858, 0.6440468, 0, 0, 0, 1, 1,
0.3125097, -1.493754, 1.481842, 0, 0, 0, 1, 1,
0.3175275, -0.4609854, 3.829527, 0, 0, 0, 1, 1,
0.3200283, 0.09774959, 1.731745, 0, 0, 0, 1, 1,
0.3228686, -1.26692, 1.844783, 0, 0, 0, 1, 1,
0.3296597, -0.1180277, 2.266106, 1, 1, 1, 1, 1,
0.3318465, 1.185553, -0.2665655, 1, 1, 1, 1, 1,
0.3340744, 1.012802, 0.4953443, 1, 1, 1, 1, 1,
0.3375573, 1.760159, -0.7668219, 1, 1, 1, 1, 1,
0.3425691, 1.024951, -0.6919507, 1, 1, 1, 1, 1,
0.3463089, 0.3059326, 0.2025045, 1, 1, 1, 1, 1,
0.3493645, -0.8733227, 2.449406, 1, 1, 1, 1, 1,
0.3517523, 0.372356, 1.574649, 1, 1, 1, 1, 1,
0.3605804, -0.666936, 1.067264, 1, 1, 1, 1, 1,
0.3648817, 1.76404, 1.042855, 1, 1, 1, 1, 1,
0.3649591, 0.1526735, 1.546917, 1, 1, 1, 1, 1,
0.3708715, -0.5860686, 2.7947, 1, 1, 1, 1, 1,
0.3709336, -0.04719691, 1.677321, 1, 1, 1, 1, 1,
0.3739808, -1.409628, 2.108152, 1, 1, 1, 1, 1,
0.3744747, 0.8548868, -2.251474, 1, 1, 1, 1, 1,
0.3759734, 1.715001, 2.461229, 0, 0, 1, 1, 1,
0.3799148, -1.019043, 2.593933, 1, 0, 0, 1, 1,
0.3809811, -0.6391865, 1.669029, 1, 0, 0, 1, 1,
0.3814811, -1.54758, 2.574619, 1, 0, 0, 1, 1,
0.3826126, 0.2142224, 0.8975289, 1, 0, 0, 1, 1,
0.386595, 1.374704, 2.933007, 1, 0, 0, 1, 1,
0.3876622, -0.9274092, 2.590672, 0, 0, 0, 1, 1,
0.3885033, 1.460864, -0.755444, 0, 0, 0, 1, 1,
0.3918575, -0.9920087, 3.763962, 0, 0, 0, 1, 1,
0.3945749, 0.09183443, 2.080156, 0, 0, 0, 1, 1,
0.4085386, 1.321301, 1.928671, 0, 0, 0, 1, 1,
0.4099207, 0.7945925, 1.437577, 0, 0, 0, 1, 1,
0.414228, -0.1303389, 3.265002, 0, 0, 0, 1, 1,
0.4150307, 0.4158538, 1.803984, 1, 1, 1, 1, 1,
0.4156734, -0.5853565, 2.987008, 1, 1, 1, 1, 1,
0.4166975, -0.07050583, 2.419299, 1, 1, 1, 1, 1,
0.4214613, -1.378569, 2.601939, 1, 1, 1, 1, 1,
0.4237238, -0.3191685, 1.591802, 1, 1, 1, 1, 1,
0.4247394, -1.991071, 3.115002, 1, 1, 1, 1, 1,
0.4255118, 0.7149447, 2.684463, 1, 1, 1, 1, 1,
0.4266062, 1.216734, 1.546845, 1, 1, 1, 1, 1,
0.4300881, -0.1107668, 1.699361, 1, 1, 1, 1, 1,
0.437357, 0.3495011, 1.153793, 1, 1, 1, 1, 1,
0.4406445, -2.030521, 3.218251, 1, 1, 1, 1, 1,
0.4421723, 1.556212, 0.8693061, 1, 1, 1, 1, 1,
0.4476667, 1.388093, -0.7442831, 1, 1, 1, 1, 1,
0.4501236, 1.667275, 1.298994, 1, 1, 1, 1, 1,
0.4507216, -0.6734633, 2.384475, 1, 1, 1, 1, 1,
0.4512654, -0.3262508, 2.763279, 0, 0, 1, 1, 1,
0.4524146, -2.45188, 3.530286, 1, 0, 0, 1, 1,
0.4567173, -0.5720652, 2.477897, 1, 0, 0, 1, 1,
0.4573818, -0.03924814, 2.201164, 1, 0, 0, 1, 1,
0.4580157, 0.6676648, 1.314409, 1, 0, 0, 1, 1,
0.467631, 0.7153885, 1.05814, 1, 0, 0, 1, 1,
0.4694706, 1.408027, -0.02770896, 0, 0, 0, 1, 1,
0.4717458, -0.77227, 1.896267, 0, 0, 0, 1, 1,
0.4782155, 1.259053, 2.132522, 0, 0, 0, 1, 1,
0.4827567, 0.8297874, 0.317699, 0, 0, 0, 1, 1,
0.4846658, 1.381502, -0.1377239, 0, 0, 0, 1, 1,
0.484825, -0.9316742, 2.227262, 0, 0, 0, 1, 1,
0.4849342, -1.53851, 3.321384, 0, 0, 0, 1, 1,
0.4860108, 0.8873083, 0.6711518, 1, 1, 1, 1, 1,
0.4957886, 0.1247647, -0.4805535, 1, 1, 1, 1, 1,
0.5086841, 1.643809, 0.3792551, 1, 1, 1, 1, 1,
0.5095835, -0.4763328, 3.074728, 1, 1, 1, 1, 1,
0.5110686, -0.7541692, 2.621898, 1, 1, 1, 1, 1,
0.5119722, -1.110743, 2.410464, 1, 1, 1, 1, 1,
0.5171936, 1.606933, -0.5521245, 1, 1, 1, 1, 1,
0.5177436, -0.9326902, 4.234067, 1, 1, 1, 1, 1,
0.5244398, -1.321956, 4.322052, 1, 1, 1, 1, 1,
0.5255622, -1.401827, 2.597009, 1, 1, 1, 1, 1,
0.5283858, 1.142633, 1.662535, 1, 1, 1, 1, 1,
0.5301229, 1.097319, 0.3720578, 1, 1, 1, 1, 1,
0.5388876, 0.0124808, 1.873383, 1, 1, 1, 1, 1,
0.5477912, 0.591991, -0.8332976, 1, 1, 1, 1, 1,
0.5484127, -1.360613, 0.971176, 1, 1, 1, 1, 1,
0.5485819, 0.3007169, 0.835471, 0, 0, 1, 1, 1,
0.5674537, -1.041562, 3.441287, 1, 0, 0, 1, 1,
0.5679265, -0.4821256, 1.890568, 1, 0, 0, 1, 1,
0.5728641, 0.02019368, 1.671138, 1, 0, 0, 1, 1,
0.5742343, -0.09521881, 2.191822, 1, 0, 0, 1, 1,
0.5766385, 0.06223318, 1.219625, 1, 0, 0, 1, 1,
0.5838453, 1.570539, -0.2024322, 0, 0, 0, 1, 1,
0.5839792, 0.7473408, 1.075508, 0, 0, 0, 1, 1,
0.5848815, 0.8739445, 1.321155, 0, 0, 0, 1, 1,
0.5853156, 1.15676, 1.199906, 0, 0, 0, 1, 1,
0.5859029, -0.5473071, 0.6857328, 0, 0, 0, 1, 1,
0.5859507, -0.6212348, 2.753102, 0, 0, 0, 1, 1,
0.5881591, -0.6818227, 1.610342, 0, 0, 0, 1, 1,
0.5897053, -1.501207, 3.170693, 1, 1, 1, 1, 1,
0.5924664, 0.7735966, -0.03444937, 1, 1, 1, 1, 1,
0.5961388, -0.8370112, 2.007374, 1, 1, 1, 1, 1,
0.6009123, 0.2908981, 0.2593576, 1, 1, 1, 1, 1,
0.6019924, 0.3370382, 1.178076, 1, 1, 1, 1, 1,
0.6034853, 0.710437, -0.2272408, 1, 1, 1, 1, 1,
0.6037176, -0.1687496, 2.517951, 1, 1, 1, 1, 1,
0.6044588, -1.174541, 3.96162, 1, 1, 1, 1, 1,
0.6083269, -0.6464546, 2.261042, 1, 1, 1, 1, 1,
0.6134399, -0.4646232, 1.36467, 1, 1, 1, 1, 1,
0.6166264, -0.5191113, 1.461865, 1, 1, 1, 1, 1,
0.6282154, 0.0002674334, 1.948669, 1, 1, 1, 1, 1,
0.6297084, -1.413867, 2.458967, 1, 1, 1, 1, 1,
0.6321986, 2.078933, -0.751334, 1, 1, 1, 1, 1,
0.6385385, -1.135409, 1.872522, 1, 1, 1, 1, 1,
0.6444086, -0.08484206, 1.875485, 0, 0, 1, 1, 1,
0.6491382, 0.05051025, 1.677975, 1, 0, 0, 1, 1,
0.6525903, 0.3045339, 3.112078, 1, 0, 0, 1, 1,
0.6528317, -0.4395066, 1.021683, 1, 0, 0, 1, 1,
0.66019, 1.269907, -0.2830883, 1, 0, 0, 1, 1,
0.660248, 0.2763443, 0.76544, 1, 0, 0, 1, 1,
0.6610888, -1.373304, 2.768989, 0, 0, 0, 1, 1,
0.6654991, 1.425204, 1.156581, 0, 0, 0, 1, 1,
0.6657832, 0.4357921, 1.542731, 0, 0, 0, 1, 1,
0.6670541, -0.4948727, -0.1783746, 0, 0, 0, 1, 1,
0.6719196, -0.3666239, 2.610706, 0, 0, 0, 1, 1,
0.6822278, 0.2215446, 1.044276, 0, 0, 0, 1, 1,
0.6858289, -0.04221775, 2.038668, 0, 0, 0, 1, 1,
0.6919379, 0.3349279, 1.072294, 1, 1, 1, 1, 1,
0.694212, -0.6442198, 2.739612, 1, 1, 1, 1, 1,
0.6951467, -0.4809827, 2.893346, 1, 1, 1, 1, 1,
0.696955, -0.445606, 1.679658, 1, 1, 1, 1, 1,
0.6971664, 0.01690432, 3.111752, 1, 1, 1, 1, 1,
0.7009454, -0.4807551, 2.152511, 1, 1, 1, 1, 1,
0.704499, -0.3574034, 2.114078, 1, 1, 1, 1, 1,
0.711923, 1.487291, 1.374058, 1, 1, 1, 1, 1,
0.7241624, -1.141505, 2.820337, 1, 1, 1, 1, 1,
0.7306746, 0.158773, 1.619423, 1, 1, 1, 1, 1,
0.7352678, -1.283134, 2.223236, 1, 1, 1, 1, 1,
0.7364783, 0.4872435, 2.938637, 1, 1, 1, 1, 1,
0.7371688, 0.7113854, 0.7584303, 1, 1, 1, 1, 1,
0.7408615, -0.6626729, 1.324353, 1, 1, 1, 1, 1,
0.7495224, -1.626128, 1.878522, 1, 1, 1, 1, 1,
0.7512464, -0.6584916, 1.270471, 0, 0, 1, 1, 1,
0.7521014, -0.5430981, 0.6954236, 1, 0, 0, 1, 1,
0.7523577, 1.437075, -1.537477, 1, 0, 0, 1, 1,
0.7525466, -0.4281081, 2.312868, 1, 0, 0, 1, 1,
0.7587241, -1.31995, 2.44893, 1, 0, 0, 1, 1,
0.7588897, 1.012512, 0.4337685, 1, 0, 0, 1, 1,
0.7608156, -0.162392, 2.005107, 0, 0, 0, 1, 1,
0.7628651, -1.846869, 3.879799, 0, 0, 0, 1, 1,
0.766218, 0.5954509, 1.7818, 0, 0, 0, 1, 1,
0.7666802, 0.0773305, 2.135166, 0, 0, 0, 1, 1,
0.7738925, 2.317087, -1.562724, 0, 0, 0, 1, 1,
0.7749078, -2.339589, 3.202762, 0, 0, 0, 1, 1,
0.7753778, -0.9228097, 3.63603, 0, 0, 0, 1, 1,
0.7770935, 0.6838672, -1.451905, 1, 1, 1, 1, 1,
0.7796787, 1.799445, -1.089812, 1, 1, 1, 1, 1,
0.7820308, 0.5236042, -0.3616403, 1, 1, 1, 1, 1,
0.7887147, -2.009352, 2.458723, 1, 1, 1, 1, 1,
0.7893497, 0.4351869, 1.096005, 1, 1, 1, 1, 1,
0.7907538, 0.7545195, -0.8683256, 1, 1, 1, 1, 1,
0.7914084, -0.8821111, 2.403649, 1, 1, 1, 1, 1,
0.794691, 0.1971585, 1.567117, 1, 1, 1, 1, 1,
0.8003662, 1.223271, 1.544701, 1, 1, 1, 1, 1,
0.8010133, 0.7127181, 0.3112667, 1, 1, 1, 1, 1,
0.8016829, -0.2046644, 1.155052, 1, 1, 1, 1, 1,
0.8019912, -2.553382, 1.89497, 1, 1, 1, 1, 1,
0.8023422, -0.7707026, 2.762671, 1, 1, 1, 1, 1,
0.8036493, -0.4802857, 1.509751, 1, 1, 1, 1, 1,
0.8066072, 0.07296013, 0.521262, 1, 1, 1, 1, 1,
0.8142735, -1.719041, 3.689424, 0, 0, 1, 1, 1,
0.8195732, 0.2307121, 1.890488, 1, 0, 0, 1, 1,
0.8204261, 1.225006, -0.4419574, 1, 0, 0, 1, 1,
0.8253565, -0.1018774, 0.1282221, 1, 0, 0, 1, 1,
0.8376349, 0.3066858, 3.186372, 1, 0, 0, 1, 1,
0.8377596, 0.5518659, 2.144657, 1, 0, 0, 1, 1,
0.8417819, 0.403536, 0.723065, 0, 0, 0, 1, 1,
0.8433039, 0.4711224, 0.402391, 0, 0, 0, 1, 1,
0.8474602, 0.9188058, -0.7008583, 0, 0, 0, 1, 1,
0.8491979, -0.40513, -0.08290733, 0, 0, 0, 1, 1,
0.8547497, -1.766828, 1.476474, 0, 0, 0, 1, 1,
0.8568943, -0.0776246, 0.6794532, 0, 0, 0, 1, 1,
0.8569314, -0.3421067, 2.868745, 0, 0, 0, 1, 1,
0.8576367, 0.9931332, 0.6396792, 1, 1, 1, 1, 1,
0.8659393, -1.168146, 2.348535, 1, 1, 1, 1, 1,
0.866085, -0.4857267, 1.146008, 1, 1, 1, 1, 1,
0.8699341, -0.05129601, 2.402096, 1, 1, 1, 1, 1,
0.8725766, -0.5051557, 1.275134, 1, 1, 1, 1, 1,
0.8746896, 0.8131374, -0.1741901, 1, 1, 1, 1, 1,
0.8848304, 0.5697767, 0.9678523, 1, 1, 1, 1, 1,
0.8910338, 1.866632, -0.6666393, 1, 1, 1, 1, 1,
0.9062229, -0.9258471, 1.55888, 1, 1, 1, 1, 1,
0.9107941, 2.22628, -0.1810995, 1, 1, 1, 1, 1,
0.916179, -0.3015419, 2.678585, 1, 1, 1, 1, 1,
0.9197434, 0.5018964, 2.033072, 1, 1, 1, 1, 1,
0.9238738, -1.791132, 2.860955, 1, 1, 1, 1, 1,
0.9269118, -0.3110752, 3.031971, 1, 1, 1, 1, 1,
0.9324692, 0.7666298, 1.268065, 1, 1, 1, 1, 1,
0.9428121, -0.8207815, 2.983577, 0, 0, 1, 1, 1,
0.9501897, -0.5136098, 1.265952, 1, 0, 0, 1, 1,
0.9525438, -0.2178857, 3.360139, 1, 0, 0, 1, 1,
0.9546995, -1.273155, 1.045063, 1, 0, 0, 1, 1,
0.9642862, 0.7416501, 0.317199, 1, 0, 0, 1, 1,
0.9673657, -0.2077891, 1.854648, 1, 0, 0, 1, 1,
0.9698129, 0.3524415, 1.894793, 0, 0, 0, 1, 1,
0.9705314, 0.4691988, 1.511361, 0, 0, 0, 1, 1,
0.9778525, -1.002709, 1.858319, 0, 0, 0, 1, 1,
0.9793738, 0.6548557, 0.4251095, 0, 0, 0, 1, 1,
0.9848906, 0.05355311, 2.132232, 0, 0, 0, 1, 1,
0.9905269, -0.4133386, 1.020248, 0, 0, 0, 1, 1,
0.9911404, -0.2783776, 2.367863, 0, 0, 0, 1, 1,
0.9974647, 0.298972, 0.5317146, 1, 1, 1, 1, 1,
0.9979703, -0.3378633, 0.6861713, 1, 1, 1, 1, 1,
0.9997985, -0.05750438, 1.912989, 1, 1, 1, 1, 1,
1.008023, 0.733743, -0.1922944, 1, 1, 1, 1, 1,
1.009361, 1.391104, 1.071967, 1, 1, 1, 1, 1,
1.010967, 0.6066236, 0.8724617, 1, 1, 1, 1, 1,
1.012107, 0.03796438, 3.154477, 1, 1, 1, 1, 1,
1.025168, -0.119986, 3.384111, 1, 1, 1, 1, 1,
1.029234, 0.7329543, 1.570477, 1, 1, 1, 1, 1,
1.030031, -0.01654961, 1.573996, 1, 1, 1, 1, 1,
1.030584, 0.3311081, 1.944417, 1, 1, 1, 1, 1,
1.031234, 1.211878, -0.1364672, 1, 1, 1, 1, 1,
1.035788, 0.7458532, 1.555771, 1, 1, 1, 1, 1,
1.03784, 0.7913805, 0.3625352, 1, 1, 1, 1, 1,
1.040459, 1.083504, 0.3409879, 1, 1, 1, 1, 1,
1.042414, -0.2247323, 0.8947148, 0, 0, 1, 1, 1,
1.042782, -0.5487064, 1.549243, 1, 0, 0, 1, 1,
1.057735, -0.7499802, 2.443711, 1, 0, 0, 1, 1,
1.059043, 1.057279, -0.1984718, 1, 0, 0, 1, 1,
1.060399, 0.9642717, 1.023799, 1, 0, 0, 1, 1,
1.062287, -0.002600134, 1.90905, 1, 0, 0, 1, 1,
1.063368, -0.6931536, 0.5306633, 0, 0, 0, 1, 1,
1.07175, -0.1598016, 1.395278, 0, 0, 0, 1, 1,
1.076251, 0.6232626, 2.108143, 0, 0, 0, 1, 1,
1.080692, 0.3169085, 3.196484, 0, 0, 0, 1, 1,
1.087665, 0.5841811, 0.3058029, 0, 0, 0, 1, 1,
1.088038, -0.7252622, 2.643519, 0, 0, 0, 1, 1,
1.090274, 0.00628848, 1.979805, 0, 0, 0, 1, 1,
1.090653, 0.5291519, 3.505447, 1, 1, 1, 1, 1,
1.096053, 0.2875473, 1.733201, 1, 1, 1, 1, 1,
1.096101, -1.130355, 1.316653, 1, 1, 1, 1, 1,
1.104908, 0.9574186, 2.934518, 1, 1, 1, 1, 1,
1.107503, -0.5047827, 1.337059, 1, 1, 1, 1, 1,
1.125461, 0.8672651, 2.642673, 1, 1, 1, 1, 1,
1.127064, -0.5867326, 1.38193, 1, 1, 1, 1, 1,
1.127229, -0.7280267, 0.6164264, 1, 1, 1, 1, 1,
1.130698, 0.429959, 0.7984701, 1, 1, 1, 1, 1,
1.130908, 0.3425291, 2.951115, 1, 1, 1, 1, 1,
1.1501, -0.4191598, 1.940288, 1, 1, 1, 1, 1,
1.153087, -1.872797, 5.078156, 1, 1, 1, 1, 1,
1.1614, -0.3705046, 0.7171404, 1, 1, 1, 1, 1,
1.167162, -0.7300602, 4.11387, 1, 1, 1, 1, 1,
1.16727, 0.947251, 1.582234, 1, 1, 1, 1, 1,
1.173282, 0.7297395, 0.8135021, 0, 0, 1, 1, 1,
1.177247, -1.857339, 0.5765442, 1, 0, 0, 1, 1,
1.180638, -1.062173, 1.495875, 1, 0, 0, 1, 1,
1.183936, 0.5274391, 0.4397354, 1, 0, 0, 1, 1,
1.189639, 0.01673415, 2.635714, 1, 0, 0, 1, 1,
1.19624, 0.2923871, 0.121545, 1, 0, 0, 1, 1,
1.206756, -0.61699, 2.489495, 0, 0, 0, 1, 1,
1.214487, -1.029487, 2.02538, 0, 0, 0, 1, 1,
1.214964, -2.255574, 2.897307, 0, 0, 0, 1, 1,
1.226959, 1.032282, -0.2827135, 0, 0, 0, 1, 1,
1.236428, -1.382156, 2.526228, 0, 0, 0, 1, 1,
1.2382, -0.6927465, 2.096236, 0, 0, 0, 1, 1,
1.246604, -0.3880457, 0.9737247, 0, 0, 0, 1, 1,
1.247963, -0.9893996, 2.64566, 1, 1, 1, 1, 1,
1.249909, -0.7279344, 2.370941, 1, 1, 1, 1, 1,
1.249967, 0.03565457, 2.496504, 1, 1, 1, 1, 1,
1.257376, 0.4693696, 1.98131, 1, 1, 1, 1, 1,
1.261174, -2.402016, 3.306256, 1, 1, 1, 1, 1,
1.263294, 1.86287, 0.2970535, 1, 1, 1, 1, 1,
1.267377, 0.1521863, 2.163058, 1, 1, 1, 1, 1,
1.270472, 0.3076477, 2.510489, 1, 1, 1, 1, 1,
1.272669, -0.4489035, 3.551439, 1, 1, 1, 1, 1,
1.281066, 2.631695, 0.9124706, 1, 1, 1, 1, 1,
1.28398, -0.5234491, 2.064161, 1, 1, 1, 1, 1,
1.285133, -0.1113841, 2.330358, 1, 1, 1, 1, 1,
1.29163, -0.8076433, 2.176583, 1, 1, 1, 1, 1,
1.301238, 1.085918, 0.4408765, 1, 1, 1, 1, 1,
1.302874, 1.330436, 0.6695122, 1, 1, 1, 1, 1,
1.30698, 0.9829392, 0.3446937, 0, 0, 1, 1, 1,
1.318625, -0.9448527, 2.776251, 1, 0, 0, 1, 1,
1.320377, -1.60097, 2.499818, 1, 0, 0, 1, 1,
1.321393, -1.413267, 3.31561, 1, 0, 0, 1, 1,
1.323232, 0.5568579, 1.790884, 1, 0, 0, 1, 1,
1.338382, -0.2342802, 0.4525152, 1, 0, 0, 1, 1,
1.33952, -1.215601, 1.653389, 0, 0, 0, 1, 1,
1.340724, -1.538677, 0.09575968, 0, 0, 0, 1, 1,
1.347466, 0.02680736, -0.02178735, 0, 0, 0, 1, 1,
1.349243, -0.3438111, 3.337341, 0, 0, 0, 1, 1,
1.351638, -1.320442, 0.9167667, 0, 0, 0, 1, 1,
1.355957, -0.4148242, 2.672717, 0, 0, 0, 1, 1,
1.359416, 0.3886919, 0.9820634, 0, 0, 0, 1, 1,
1.363774, -0.02957468, 1.965378, 1, 1, 1, 1, 1,
1.363943, -1.813955, 2.603521, 1, 1, 1, 1, 1,
1.368245, -0.720023, 2.786828, 1, 1, 1, 1, 1,
1.369857, -0.4751964, 2.112906, 1, 1, 1, 1, 1,
1.380159, 0.02225647, 1.681537, 1, 1, 1, 1, 1,
1.385213, -0.3023656, 1.751002, 1, 1, 1, 1, 1,
1.390402, 0.2927927, 0.2270799, 1, 1, 1, 1, 1,
1.402054, -0.6314486, 1.844931, 1, 1, 1, 1, 1,
1.402306, -0.3762726, 3.754114, 1, 1, 1, 1, 1,
1.408787, -1.040643, 2.749975, 1, 1, 1, 1, 1,
1.412759, -0.4821195, 3.036837, 1, 1, 1, 1, 1,
1.422512, -0.9478645, 3.260768, 1, 1, 1, 1, 1,
1.430093, 0.7662123, -1.548245, 1, 1, 1, 1, 1,
1.441974, -0.6994224, 1.416899, 1, 1, 1, 1, 1,
1.445852, -0.7607164, 3.080342, 1, 1, 1, 1, 1,
1.452077, -0.5566664, 3.492236, 0, 0, 1, 1, 1,
1.458394, -0.4924392, 2.097451, 1, 0, 0, 1, 1,
1.463808, 0.3868153, 0.3710544, 1, 0, 0, 1, 1,
1.465097, -1.513036, 1.88743, 1, 0, 0, 1, 1,
1.471024, 0.397247, 1.545328, 1, 0, 0, 1, 1,
1.474569, 0.9329644, 1.856319, 1, 0, 0, 1, 1,
1.48014, -0.2690426, 2.12066, 0, 0, 0, 1, 1,
1.484009, 1.184806, 1.410781, 0, 0, 0, 1, 1,
1.489372, -0.6997386, 2.919841, 0, 0, 0, 1, 1,
1.528242, 1.157286, -0.2675273, 0, 0, 0, 1, 1,
1.538559, -0.6614747, 1.146641, 0, 0, 0, 1, 1,
1.55539, -0.8476989, 1.604982, 0, 0, 0, 1, 1,
1.564793, 0.8920804, 2.211447, 0, 0, 0, 1, 1,
1.572662, -0.6584583, 2.583733, 1, 1, 1, 1, 1,
1.588402, -0.7220663, 0.9140409, 1, 1, 1, 1, 1,
1.589084, 0.8533078, -0.5527312, 1, 1, 1, 1, 1,
1.590393, -0.5905089, 0.701968, 1, 1, 1, 1, 1,
1.598775, 0.1396777, 0.6055063, 1, 1, 1, 1, 1,
1.605625, 1.057727, 1.503572, 1, 1, 1, 1, 1,
1.6066, 0.3147703, 1.957414, 1, 1, 1, 1, 1,
1.612857, -0.300148, 0.7585106, 1, 1, 1, 1, 1,
1.614586, -0.3541964, 2.706043, 1, 1, 1, 1, 1,
1.618361, -1.98952, 1.587159, 1, 1, 1, 1, 1,
1.618564, -1.057127, 2.149659, 1, 1, 1, 1, 1,
1.622638, 1.256881, 1.576965, 1, 1, 1, 1, 1,
1.628428, 1.907746, 0.1607824, 1, 1, 1, 1, 1,
1.649793, 0.3795095, 1.276201, 1, 1, 1, 1, 1,
1.653678, -0.02676116, 0.8350416, 1, 1, 1, 1, 1,
1.68956, 2.406813, -0.7617537, 0, 0, 1, 1, 1,
1.689842, -0.5387454, 3.359818, 1, 0, 0, 1, 1,
1.701609, 0.5183055, 2.105329, 1, 0, 0, 1, 1,
1.704601, 1.292336, 0.482125, 1, 0, 0, 1, 1,
1.707354, 0.06436157, 0.5552598, 1, 0, 0, 1, 1,
1.707789, 0.01579121, 1.14047, 1, 0, 0, 1, 1,
1.708413, -0.2848341, 0.08714803, 0, 0, 0, 1, 1,
1.712977, 2.168234, 0.5969995, 0, 0, 0, 1, 1,
1.717213, 0.5898244, -0.748562, 0, 0, 0, 1, 1,
1.724062, 0.3545164, 1.497811, 0, 0, 0, 1, 1,
1.732313, 1.202441, 1.693635, 0, 0, 0, 1, 1,
1.73994, 1.205538, 0.7733959, 0, 0, 0, 1, 1,
1.76601, -0.6368252, 1.407734, 0, 0, 0, 1, 1,
1.784738, -0.8174297, 3.669097, 1, 1, 1, 1, 1,
1.800496, 1.11835, 0.8450623, 1, 1, 1, 1, 1,
1.822823, 0.4987443, 2.654218, 1, 1, 1, 1, 1,
1.823195, 1.527559, -0.8034191, 1, 1, 1, 1, 1,
1.83298, -1.871789, 0.9757658, 1, 1, 1, 1, 1,
1.835282, -2.71347, 2.567034, 1, 1, 1, 1, 1,
1.856206, -0.8604991, 3.008043, 1, 1, 1, 1, 1,
1.869172, -0.648461, 0.9263003, 1, 1, 1, 1, 1,
1.874181, -1.564783, 1.844095, 1, 1, 1, 1, 1,
1.893495, -0.6737104, 2.49094, 1, 1, 1, 1, 1,
1.934871, 0.8614012, 1.583121, 1, 1, 1, 1, 1,
1.966034, -1.074235, 2.844736, 1, 1, 1, 1, 1,
1.991595, -1.020625, 2.182992, 1, 1, 1, 1, 1,
2.002659, -1.369189, 2.028987, 1, 1, 1, 1, 1,
2.03537, -1.281424, 0.09331309, 1, 1, 1, 1, 1,
2.040013, 0.5014698, 3.206556, 0, 0, 1, 1, 1,
2.041539, -0.5356613, 3.73008, 1, 0, 0, 1, 1,
2.076873, -0.1000338, 2.175921, 1, 0, 0, 1, 1,
2.077816, 0.8062001, 1.364396, 1, 0, 0, 1, 1,
2.105824, 0.1881441, 1.602075, 1, 0, 0, 1, 1,
2.106284, -0.6356933, 1.574614, 1, 0, 0, 1, 1,
2.119341, 1.987148, 1.650686, 0, 0, 0, 1, 1,
2.143303, 0.5323969, 1.321483, 0, 0, 0, 1, 1,
2.145242, -0.3649635, 0.2049171, 0, 0, 0, 1, 1,
2.204395, 0.700458, 2.703758, 0, 0, 0, 1, 1,
2.336291, 0.01867101, 1.998854, 0, 0, 0, 1, 1,
2.378102, 0.6621858, 1.179335, 0, 0, 0, 1, 1,
2.493052, 0.8751438, 4.005839, 0, 0, 0, 1, 1,
2.517404, -3.331082, 4.397188, 1, 1, 1, 1, 1,
2.550391, 1.203007, 3.047502, 1, 1, 1, 1, 1,
2.592877, 2.269524, 1.252207, 1, 1, 1, 1, 1,
2.621314, -0.4483495, -1.05531, 1, 1, 1, 1, 1,
2.996444, 1.210714, -0.2129574, 1, 1, 1, 1, 1,
3.109093, 0.07875728, 0.7826244, 1, 1, 1, 1, 1,
3.262938, -0.2722724, 2.650356, 1, 1, 1, 1, 1
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
var radius = 10.10101;
var distance = 35.47937;
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
mvMatrix.translate( 0.1912181, -0.05119896, -0.4221058 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.47937);
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
