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
-2.851301, -2.327929, -0.286006, 1, 0, 0, 1,
-2.731849, -0.2571621, -0.5549771, 1, 0.007843138, 0, 1,
-2.658246, -2.245529, -1.402969, 1, 0.01176471, 0, 1,
-2.646397, 0.6085578, -1.884604, 1, 0.01960784, 0, 1,
-2.642513, -1.749993, -1.64479, 1, 0.02352941, 0, 1,
-2.633921, 0.6488912, -1.986633, 1, 0.03137255, 0, 1,
-2.596303, -0.8235167, -0.9653456, 1, 0.03529412, 0, 1,
-2.4094, 0.09406716, -2.053783, 1, 0.04313726, 0, 1,
-2.362752, -2.790977, -1.776775, 1, 0.04705882, 0, 1,
-2.314157, -0.4943213, -0.7211085, 1, 0.05490196, 0, 1,
-2.243521, 0.7541544, -1.543417, 1, 0.05882353, 0, 1,
-2.190667, 0.8353993, -0.4496293, 1, 0.06666667, 0, 1,
-2.146577, 0.1134446, -1.823885, 1, 0.07058824, 0, 1,
-2.14103, -1.365524, -2.279007, 1, 0.07843138, 0, 1,
-2.12231, -1.469486, -0.9519532, 1, 0.08235294, 0, 1,
-2.114559, -0.6423957, -0.8299381, 1, 0.09019608, 0, 1,
-2.108125, 0.1803827, -2.114861, 1, 0.09411765, 0, 1,
-2.106825, -0.5436243, -2.837156, 1, 0.1019608, 0, 1,
-2.081087, 0.2309288, 0.002116411, 1, 0.1098039, 0, 1,
-2.061148, -0.3735201, -2.352665, 1, 0.1137255, 0, 1,
-2.051066, 0.2207844, -0.8614557, 1, 0.1215686, 0, 1,
-2.049698, -0.2769971, 0.1589661, 1, 0.1254902, 0, 1,
-2.042223, -0.1170178, -0.4452212, 1, 0.1333333, 0, 1,
-2.036603, 1.688454, -2.0735, 1, 0.1372549, 0, 1,
-2.013206, -0.4640534, -1.804824, 1, 0.145098, 0, 1,
-1.98422, -0.1978225, -2.011741, 1, 0.1490196, 0, 1,
-1.946014, -0.9586916, -2.587862, 1, 0.1568628, 0, 1,
-1.919754, -0.9683191, -1.139481, 1, 0.1607843, 0, 1,
-1.918593, -1.231109, -1.146166, 1, 0.1686275, 0, 1,
-1.911149, -0.2480919, -1.514096, 1, 0.172549, 0, 1,
-1.893259, 1.530433, -0.9595862, 1, 0.1803922, 0, 1,
-1.885537, -2.183531, -1.969112, 1, 0.1843137, 0, 1,
-1.871056, 1.349177, 0.4343005, 1, 0.1921569, 0, 1,
-1.866926, 0.253261, -2.683574, 1, 0.1960784, 0, 1,
-1.842843, 1.036294, 0.3712617, 1, 0.2039216, 0, 1,
-1.834315, 0.865159, -1.850065, 1, 0.2117647, 0, 1,
-1.811903, 0.1192059, -0.6079801, 1, 0.2156863, 0, 1,
-1.80834, -0.4906427, -2.031761, 1, 0.2235294, 0, 1,
-1.807255, -1.351781, -2.813974, 1, 0.227451, 0, 1,
-1.783889, -1.361782, -1.750478, 1, 0.2352941, 0, 1,
-1.771781, 0.9024678, -0.5923845, 1, 0.2392157, 0, 1,
-1.77154, -0.6213804, -1.632718, 1, 0.2470588, 0, 1,
-1.768528, -1.51316, -2.505109, 1, 0.2509804, 0, 1,
-1.757287, 0.1203215, -0.592124, 1, 0.2588235, 0, 1,
-1.736342, -0.7791678, -1.578999, 1, 0.2627451, 0, 1,
-1.734166, 1.685902, -0.9868412, 1, 0.2705882, 0, 1,
-1.730413, 0.2325975, -1.350011, 1, 0.2745098, 0, 1,
-1.727083, -0.7213426, -1.765725, 1, 0.282353, 0, 1,
-1.726257, 0.5952904, -1.482149, 1, 0.2862745, 0, 1,
-1.710193, -0.7416524, -1.092435, 1, 0.2941177, 0, 1,
-1.700569, 1.019476, -0.7303723, 1, 0.3019608, 0, 1,
-1.684246, -0.6614763, -0.5582691, 1, 0.3058824, 0, 1,
-1.67332, 0.2161112, -0.8681664, 1, 0.3137255, 0, 1,
-1.66736, 0.6416984, -2.593132, 1, 0.3176471, 0, 1,
-1.657032, 0.2592122, -2.42619, 1, 0.3254902, 0, 1,
-1.64901, -0.04035063, -0.8199732, 1, 0.3294118, 0, 1,
-1.63339, 0.6151416, 0.4281308, 1, 0.3372549, 0, 1,
-1.63132, -0.9548869, -2.966945, 1, 0.3411765, 0, 1,
-1.626887, 0.541955, -0.7232825, 1, 0.3490196, 0, 1,
-1.619017, 0.7743509, -1.340696, 1, 0.3529412, 0, 1,
-1.612093, 0.1208694, -2.617661, 1, 0.3607843, 0, 1,
-1.587097, -0.8605746, -0.7817467, 1, 0.3647059, 0, 1,
-1.58178, 0.5827252, -3.058462, 1, 0.372549, 0, 1,
-1.57864, 1.273086, 1.358506, 1, 0.3764706, 0, 1,
-1.576917, -0.932354, -1.718607, 1, 0.3843137, 0, 1,
-1.573975, -1.419867, -3.560236, 1, 0.3882353, 0, 1,
-1.56932, -1.770496, -2.941043, 1, 0.3960784, 0, 1,
-1.558193, -0.4476044, -1.236857, 1, 0.4039216, 0, 1,
-1.55521, 0.1694233, -1.045741, 1, 0.4078431, 0, 1,
-1.537388, 0.09569138, -2.303868, 1, 0.4156863, 0, 1,
-1.532042, 0.4812087, -2.989386, 1, 0.4196078, 0, 1,
-1.529678, -1.286227, -2.160966, 1, 0.427451, 0, 1,
-1.525501, 0.1142738, -0.3843801, 1, 0.4313726, 0, 1,
-1.524243, 1.619494, -1.614008, 1, 0.4392157, 0, 1,
-1.524157, 0.01104184, -1.136441, 1, 0.4431373, 0, 1,
-1.5226, -0.883442, -1.442084, 1, 0.4509804, 0, 1,
-1.519435, -0.3738717, -0.5188066, 1, 0.454902, 0, 1,
-1.513276, 0.133703, -1.385678, 1, 0.4627451, 0, 1,
-1.489049, -0.0521639, 0.02737285, 1, 0.4666667, 0, 1,
-1.483527, 1.052337, 0.4026803, 1, 0.4745098, 0, 1,
-1.468627, 0.42567, -2.765191, 1, 0.4784314, 0, 1,
-1.452188, 0.2609241, -2.498197, 1, 0.4862745, 0, 1,
-1.436275, -0.5855849, -1.008921, 1, 0.4901961, 0, 1,
-1.432945, 1.330925, -0.2610345, 1, 0.4980392, 0, 1,
-1.424142, 0.3091027, -2.243872, 1, 0.5058824, 0, 1,
-1.423216, -0.7504614, -4.602325, 1, 0.509804, 0, 1,
-1.421978, 1.676337, -0.353143, 1, 0.5176471, 0, 1,
-1.406763, -1.463904, -2.533558, 1, 0.5215687, 0, 1,
-1.400426, -0.5903106, -1.090955, 1, 0.5294118, 0, 1,
-1.399494, 1.806825, -2.256966, 1, 0.5333334, 0, 1,
-1.398602, -0.1463728, -2.317034, 1, 0.5411765, 0, 1,
-1.388095, -0.5004536, -3.394674, 1, 0.5450981, 0, 1,
-1.381388, -1.784259, -3.647134, 1, 0.5529412, 0, 1,
-1.355058, -0.717823, -1.8741, 1, 0.5568628, 0, 1,
-1.350916, -2.407469, -2.775397, 1, 0.5647059, 0, 1,
-1.337033, 0.3568037, -0.2968856, 1, 0.5686275, 0, 1,
-1.327441, -0.1522347, 0.7644907, 1, 0.5764706, 0, 1,
-1.325701, 0.6884609, 0.5516368, 1, 0.5803922, 0, 1,
-1.324822, 0.635855, -1.675066, 1, 0.5882353, 0, 1,
-1.318284, -2.047766, -1.845465, 1, 0.5921569, 0, 1,
-1.316704, 0.05573867, -0.5055094, 1, 0.6, 0, 1,
-1.302353, -0.668676, -1.794477, 1, 0.6078432, 0, 1,
-1.290585, 1.310263, -0.2717513, 1, 0.6117647, 0, 1,
-1.290126, -0.3123148, -1.413038, 1, 0.6196079, 0, 1,
-1.283428, 3.150018, 0.7565782, 1, 0.6235294, 0, 1,
-1.270197, -0.9316983, -1.258416, 1, 0.6313726, 0, 1,
-1.269346, -1.691625, -1.452466, 1, 0.6352941, 0, 1,
-1.262656, 0.7948354, -0.6389341, 1, 0.6431373, 0, 1,
-1.257872, -0.06258539, -2.031159, 1, 0.6470588, 0, 1,
-1.25175, -0.506788, -2.742049, 1, 0.654902, 0, 1,
-1.247691, 0.5905514, -1.854071, 1, 0.6588235, 0, 1,
-1.247193, 0.2659509, -2.177515, 1, 0.6666667, 0, 1,
-1.241647, 0.09948646, -2.11254, 1, 0.6705883, 0, 1,
-1.236551, 0.9584562, 0.422068, 1, 0.6784314, 0, 1,
-1.23238, -0.5370587, -0.5936199, 1, 0.682353, 0, 1,
-1.231165, 2.721563, 0.1708402, 1, 0.6901961, 0, 1,
-1.230073, 0.5307888, -2.723186, 1, 0.6941177, 0, 1,
-1.219179, 1.921075, -0.1665386, 1, 0.7019608, 0, 1,
-1.212206, 1.3111, -1.195532, 1, 0.7098039, 0, 1,
-1.204321, 1.479484, -1.21861, 1, 0.7137255, 0, 1,
-1.197581, 0.489469, -1.91771, 1, 0.7215686, 0, 1,
-1.180394, -0.6071431, -1.540056, 1, 0.7254902, 0, 1,
-1.172432, 1.532795, -1.508292, 1, 0.7333333, 0, 1,
-1.170312, -0.1023149, -1.649302, 1, 0.7372549, 0, 1,
-1.166027, 1.135995, 0.9603804, 1, 0.7450981, 0, 1,
-1.16221, -0.4738756, -4.077026, 1, 0.7490196, 0, 1,
-1.140657, -0.03975308, -3.144918, 1, 0.7568628, 0, 1,
-1.139269, 0.4478701, -2.797234, 1, 0.7607843, 0, 1,
-1.135753, -0.9431456, -0.1032081, 1, 0.7686275, 0, 1,
-1.130774, -1.626722, -2.355659, 1, 0.772549, 0, 1,
-1.127975, -0.07793047, -0.4509252, 1, 0.7803922, 0, 1,
-1.126778, 0.523292, -1.50812, 1, 0.7843137, 0, 1,
-1.124596, -1.808756, -3.302092, 1, 0.7921569, 0, 1,
-1.124392, -0.8631284, -3.174958, 1, 0.7960784, 0, 1,
-1.124178, 0.8718583, -0.6132444, 1, 0.8039216, 0, 1,
-1.12163, -0.3549492, -1.043049, 1, 0.8117647, 0, 1,
-1.121225, -0.6519809, -2.839355, 1, 0.8156863, 0, 1,
-1.118019, -1.398788, -3.223312, 1, 0.8235294, 0, 1,
-1.10849, 0.8522435, -3.262287, 1, 0.827451, 0, 1,
-1.107698, 0.9516425, -1.310942, 1, 0.8352941, 0, 1,
-1.100494, 1.379516, -0.2670836, 1, 0.8392157, 0, 1,
-1.097218, 0.5691262, -1.038307, 1, 0.8470588, 0, 1,
-1.091604, 1.357961, -0.5195757, 1, 0.8509804, 0, 1,
-1.090861, -0.05733479, -0.522846, 1, 0.8588235, 0, 1,
-1.084829, 1.541802, -1.787866, 1, 0.8627451, 0, 1,
-1.071904, -2.131279, -1.99854, 1, 0.8705882, 0, 1,
-1.070061, -0.4226382, 0.4545153, 1, 0.8745098, 0, 1,
-1.061868, -1.042974, -1.170007, 1, 0.8823529, 0, 1,
-1.058546, 0.06686115, 0.06229692, 1, 0.8862745, 0, 1,
-1.050889, -0.9075121, -1.08187, 1, 0.8941177, 0, 1,
-1.049352, 0.3280604, -0.5945935, 1, 0.8980392, 0, 1,
-1.045049, 0.7851877, 0.7517348, 1, 0.9058824, 0, 1,
-1.044275, 0.7488061, 0.164349, 1, 0.9137255, 0, 1,
-1.040434, 1.229169, -0.475186, 1, 0.9176471, 0, 1,
-1.034051, -1.286118, -3.932414, 1, 0.9254902, 0, 1,
-1.015619, -0.9336838, -1.407234, 1, 0.9294118, 0, 1,
-1.000356, -1.30465, -1.705002, 1, 0.9372549, 0, 1,
-0.997803, -1.496074, -2.100224, 1, 0.9411765, 0, 1,
-0.9961228, 0.3806526, -0.43148, 1, 0.9490196, 0, 1,
-0.9927286, 0.8849566, -0.7068707, 1, 0.9529412, 0, 1,
-0.9926452, 1.245205, -0.2417592, 1, 0.9607843, 0, 1,
-0.9842116, 0.4594612, -1.410335, 1, 0.9647059, 0, 1,
-0.9833754, 0.2178223, -1.582987, 1, 0.972549, 0, 1,
-0.9816351, -0.1899114, -0.9601529, 1, 0.9764706, 0, 1,
-0.9662023, 0.08215062, -1.611968, 1, 0.9843137, 0, 1,
-0.9624341, 0.4153148, -1.45775, 1, 0.9882353, 0, 1,
-0.958269, -1.249276, -2.170324, 1, 0.9960784, 0, 1,
-0.9513969, 0.06685388, -3.447891, 0.9960784, 1, 0, 1,
-0.9444561, -2.564287, -2.191064, 0.9921569, 1, 0, 1,
-0.9427236, -1.204495, -2.639208, 0.9843137, 1, 0, 1,
-0.9382637, -0.9454764, -2.46689, 0.9803922, 1, 0, 1,
-0.9317328, -0.1753287, -3.687396, 0.972549, 1, 0, 1,
-0.9302469, 1.454353, 0.2992872, 0.9686275, 1, 0, 1,
-0.9253379, 2.030171, -0.6335266, 0.9607843, 1, 0, 1,
-0.9176769, 0.4256932, -2.117822, 0.9568627, 1, 0, 1,
-0.9075342, 1.156948, -1.25903, 0.9490196, 1, 0, 1,
-0.8996737, -0.08722048, -0.8592169, 0.945098, 1, 0, 1,
-0.8951022, 0.6514032, -4.279531, 0.9372549, 1, 0, 1,
-0.8679137, 1.543581, -0.6030222, 0.9333333, 1, 0, 1,
-0.8667983, -0.8694435, -3.068163, 0.9254902, 1, 0, 1,
-0.8654065, 0.8582147, -0.8313372, 0.9215686, 1, 0, 1,
-0.8610276, 0.4690031, -0.2326667, 0.9137255, 1, 0, 1,
-0.8566587, -0.6748747, -2.056858, 0.9098039, 1, 0, 1,
-0.8562136, 0.4371002, 0.6666917, 0.9019608, 1, 0, 1,
-0.8528183, -0.3577887, -1.75569, 0.8941177, 1, 0, 1,
-0.8521317, 0.1113543, -1.970058, 0.8901961, 1, 0, 1,
-0.8476713, 1.368562, -1.104437, 0.8823529, 1, 0, 1,
-0.8474766, 0.7926204, -0.6827206, 0.8784314, 1, 0, 1,
-0.8384606, 0.8937595, -1.702133, 0.8705882, 1, 0, 1,
-0.836532, 0.7026749, -1.500621, 0.8666667, 1, 0, 1,
-0.8304824, -1.381357, -2.388469, 0.8588235, 1, 0, 1,
-0.8288873, -0.9366947, -1.177128, 0.854902, 1, 0, 1,
-0.8287566, -2.945477, -3.668049, 0.8470588, 1, 0, 1,
-0.8245047, -0.5792141, -1.448348, 0.8431373, 1, 0, 1,
-0.8183542, 0.3263351, -0.1618191, 0.8352941, 1, 0, 1,
-0.808872, 0.01693901, -2.690559, 0.8313726, 1, 0, 1,
-0.8046427, -1.585694, -2.286053, 0.8235294, 1, 0, 1,
-0.7990918, 0.5580864, -1.112598, 0.8196079, 1, 0, 1,
-0.7963419, 0.3556162, -1.702799, 0.8117647, 1, 0, 1,
-0.7956402, -0.8701141, -3.150834, 0.8078431, 1, 0, 1,
-0.7911856, 1.101109, -0.3377619, 0.8, 1, 0, 1,
-0.7830332, -0.5281744, -2.209726, 0.7921569, 1, 0, 1,
-0.7769334, -0.07492734, -1.826073, 0.7882353, 1, 0, 1,
-0.7765391, 0.3964586, -0.03881896, 0.7803922, 1, 0, 1,
-0.7748897, 1.383673, -0.9269696, 0.7764706, 1, 0, 1,
-0.7731278, -1.143773, -2.717845, 0.7686275, 1, 0, 1,
-0.7723356, -0.1400416, -1.475867, 0.7647059, 1, 0, 1,
-0.7663273, 0.3206606, -2.064754, 0.7568628, 1, 0, 1,
-0.7631018, -0.01223393, -2.228073, 0.7529412, 1, 0, 1,
-0.7620656, -1.040575, -2.597483, 0.7450981, 1, 0, 1,
-0.7590435, 0.1230543, -3.108535, 0.7411765, 1, 0, 1,
-0.7547944, -0.9055592, -2.780903, 0.7333333, 1, 0, 1,
-0.7535551, -0.8773661, -3.528788, 0.7294118, 1, 0, 1,
-0.7502749, -0.7418275, -4.026199, 0.7215686, 1, 0, 1,
-0.7471707, -1.311858, -1.962319, 0.7176471, 1, 0, 1,
-0.743691, 0.4551522, -2.260166, 0.7098039, 1, 0, 1,
-0.7413822, -1.482123, -1.927275, 0.7058824, 1, 0, 1,
-0.74122, -0.7058222, -1.706674, 0.6980392, 1, 0, 1,
-0.7349585, -0.4896873, -2.174417, 0.6901961, 1, 0, 1,
-0.7346891, -2.036344, -3.665947, 0.6862745, 1, 0, 1,
-0.7299163, -0.317539, -1.92858, 0.6784314, 1, 0, 1,
-0.7283162, 0.1814255, -1.564574, 0.6745098, 1, 0, 1,
-0.7273864, 0.8475682, -1.709821, 0.6666667, 1, 0, 1,
-0.7267674, -1.288709, -2.876095, 0.6627451, 1, 0, 1,
-0.7251944, -0.1114085, -1.500546, 0.654902, 1, 0, 1,
-0.7234504, 0.4103539, -0.4071302, 0.6509804, 1, 0, 1,
-0.7198179, 0.3783788, -1.597465, 0.6431373, 1, 0, 1,
-0.7186792, -2.32137, -2.977717, 0.6392157, 1, 0, 1,
-0.7162149, -0.1799583, -4.771457, 0.6313726, 1, 0, 1,
-0.7158861, 1.525581, -1.428589, 0.627451, 1, 0, 1,
-0.7094571, -0.08562671, -1.574834, 0.6196079, 1, 0, 1,
-0.7036372, 0.9692467, -1.871834, 0.6156863, 1, 0, 1,
-0.7032291, 0.4128045, -0.8203029, 0.6078432, 1, 0, 1,
-0.7026199, 1.143445, -1.614915, 0.6039216, 1, 0, 1,
-0.697724, 0.3341101, -1.508916, 0.5960785, 1, 0, 1,
-0.6977213, -1.130524, -3.281026, 0.5882353, 1, 0, 1,
-0.6967565, -0.6115314, -4.235691, 0.5843138, 1, 0, 1,
-0.69514, 0.8456999, -0.5029241, 0.5764706, 1, 0, 1,
-0.6933066, 1.188417, -1.234215, 0.572549, 1, 0, 1,
-0.6932125, -1.105135, -1.529554, 0.5647059, 1, 0, 1,
-0.6920977, -0.8650254, -1.809702, 0.5607843, 1, 0, 1,
-0.6920652, 0.6925739, -1.452304, 0.5529412, 1, 0, 1,
-0.6897816, 0.9407687, -0.5833446, 0.5490196, 1, 0, 1,
-0.6893254, 0.6727283, -2.331456, 0.5411765, 1, 0, 1,
-0.6872767, -0.03980259, -2.638218, 0.5372549, 1, 0, 1,
-0.6870587, 0.07764494, -2.854924, 0.5294118, 1, 0, 1,
-0.6860237, -0.5546094, -1.901674, 0.5254902, 1, 0, 1,
-0.6846985, 2.580398, 0.1078907, 0.5176471, 1, 0, 1,
-0.667585, 0.5596266, -1.057488, 0.5137255, 1, 0, 1,
-0.6620849, 0.7731056, -2.160559, 0.5058824, 1, 0, 1,
-0.65847, 1.604768, -1.363573, 0.5019608, 1, 0, 1,
-0.6567008, -1.193501, -2.431452, 0.4941176, 1, 0, 1,
-0.652454, -1.017377, -1.972327, 0.4862745, 1, 0, 1,
-0.6510437, 0.0320024, -1.894295, 0.4823529, 1, 0, 1,
-0.6479983, 0.7831563, -0.4339864, 0.4745098, 1, 0, 1,
-0.6295736, 1.51089, -0.6363341, 0.4705882, 1, 0, 1,
-0.6285464, -0.2229474, -0.2731047, 0.4627451, 1, 0, 1,
-0.627836, -0.6602225, -3.865765, 0.4588235, 1, 0, 1,
-0.6275285, -0.3992648, -1.799351, 0.4509804, 1, 0, 1,
-0.6240989, 0.3866524, -1.849048, 0.4470588, 1, 0, 1,
-0.623441, 0.02362857, -2.805932, 0.4392157, 1, 0, 1,
-0.6206303, 1.063407, -1.645101, 0.4352941, 1, 0, 1,
-0.6194268, 0.5697841, -0.6539176, 0.427451, 1, 0, 1,
-0.6190978, -0.4034784, -0.2345871, 0.4235294, 1, 0, 1,
-0.6186383, 0.582947, -1.3479, 0.4156863, 1, 0, 1,
-0.6133305, -0.5364721, -2.714001, 0.4117647, 1, 0, 1,
-0.6127026, -1.65106, 0.2002609, 0.4039216, 1, 0, 1,
-0.608876, -1.113045, -2.241902, 0.3960784, 1, 0, 1,
-0.6054654, 0.1006734, -1.760342, 0.3921569, 1, 0, 1,
-0.604776, -0.5055401, -0.2554472, 0.3843137, 1, 0, 1,
-0.6016356, -1.365435, -1.531621, 0.3803922, 1, 0, 1,
-0.6008803, 1.174285, -1.445345, 0.372549, 1, 0, 1,
-0.5993659, 0.2926358, 0.4601158, 0.3686275, 1, 0, 1,
-0.5992126, 0.3213652, -1.202897, 0.3607843, 1, 0, 1,
-0.5927144, 0.05919794, -1.810759, 0.3568628, 1, 0, 1,
-0.591844, 0.56247, -2.625578, 0.3490196, 1, 0, 1,
-0.5865896, 0.1042577, -2.698778, 0.345098, 1, 0, 1,
-0.5830928, 0.01116793, -2.158822, 0.3372549, 1, 0, 1,
-0.5801808, 0.1140863, -1.119371, 0.3333333, 1, 0, 1,
-0.5728912, 1.919143, -0.01947875, 0.3254902, 1, 0, 1,
-0.5700925, 1.787221, -1.5199, 0.3215686, 1, 0, 1,
-0.5671153, 1.337973, -0.01147012, 0.3137255, 1, 0, 1,
-0.5654777, -0.2872974, -2.665078, 0.3098039, 1, 0, 1,
-0.5619523, 0.5413828, -0.9720052, 0.3019608, 1, 0, 1,
-0.561174, -0.291298, -1.100664, 0.2941177, 1, 0, 1,
-0.5570131, 0.8726079, 1.121713, 0.2901961, 1, 0, 1,
-0.5562587, 0.348298, -1.028132, 0.282353, 1, 0, 1,
-0.5550331, -1.490928, -2.535866, 0.2784314, 1, 0, 1,
-0.5520328, -0.7548563, -2.259021, 0.2705882, 1, 0, 1,
-0.5514119, 0.4632995, 0.368571, 0.2666667, 1, 0, 1,
-0.5511464, 0.9603823, -0.9531095, 0.2588235, 1, 0, 1,
-0.5459197, -1.672786, -1.728579, 0.254902, 1, 0, 1,
-0.5395705, -0.9338944, -3.188706, 0.2470588, 1, 0, 1,
-0.5359921, 0.2061194, 0.4581225, 0.2431373, 1, 0, 1,
-0.533597, 0.2719658, -2.921709, 0.2352941, 1, 0, 1,
-0.5296132, -0.4930168, -2.148258, 0.2313726, 1, 0, 1,
-0.529146, -0.04761884, 0.07875897, 0.2235294, 1, 0, 1,
-0.5259707, -0.6354527, -3.027263, 0.2196078, 1, 0, 1,
-0.5191717, -0.5015709, -2.918678, 0.2117647, 1, 0, 1,
-0.5157688, -0.06823483, -0.6919931, 0.2078431, 1, 0, 1,
-0.5125006, -0.8386781, -4.611371, 0.2, 1, 0, 1,
-0.510981, -0.6244538, -3.279255, 0.1921569, 1, 0, 1,
-0.5101488, 0.6672198, -0.8328704, 0.1882353, 1, 0, 1,
-0.5094422, 0.1943107, -0.04488331, 0.1803922, 1, 0, 1,
-0.503584, -0.354191, -0.5229626, 0.1764706, 1, 0, 1,
-0.5023368, 1.879564, -0.4669594, 0.1686275, 1, 0, 1,
-0.5019357, -0.1129997, -2.716285, 0.1647059, 1, 0, 1,
-0.5002568, -0.747423, -2.482169, 0.1568628, 1, 0, 1,
-0.4984084, -0.6250482, -3.724819, 0.1529412, 1, 0, 1,
-0.4972758, 0.907574, -0.1807543, 0.145098, 1, 0, 1,
-0.4929748, -0.906996, -2.967964, 0.1411765, 1, 0, 1,
-0.4899957, -1.733245, -1.203345, 0.1333333, 1, 0, 1,
-0.4894009, 1.129029, -1.326463, 0.1294118, 1, 0, 1,
-0.4872305, -0.4757057, -1.944393, 0.1215686, 1, 0, 1,
-0.484165, 0.421405, -2.341176, 0.1176471, 1, 0, 1,
-0.4822901, -1.444825, -3.048035, 0.1098039, 1, 0, 1,
-0.4796396, 0.08049574, -0.9422447, 0.1058824, 1, 0, 1,
-0.4791737, 0.7501701, -1.456978, 0.09803922, 1, 0, 1,
-0.4785799, -1.536431, -2.030379, 0.09019608, 1, 0, 1,
-0.4701262, -0.3096464, -0.8816764, 0.08627451, 1, 0, 1,
-0.4693895, -0.9242957, -2.011568, 0.07843138, 1, 0, 1,
-0.4674388, 0.8860558, -0.08831399, 0.07450981, 1, 0, 1,
-0.4660069, -0.6222934, 1.573997, 0.06666667, 1, 0, 1,
-0.4567901, -0.4557839, -2.127062, 0.0627451, 1, 0, 1,
-0.4540837, -1.436996, -2.136025, 0.05490196, 1, 0, 1,
-0.4481955, 0.9009708, 1.197598, 0.05098039, 1, 0, 1,
-0.4479043, 1.325757, 1.016595, 0.04313726, 1, 0, 1,
-0.4445913, -0.9996508, -1.6163, 0.03921569, 1, 0, 1,
-0.4427695, -0.1738655, 0.5751456, 0.03137255, 1, 0, 1,
-0.4367834, -0.9021355, -2.640058, 0.02745098, 1, 0, 1,
-0.4346678, 1.451736, -2.379747, 0.01960784, 1, 0, 1,
-0.4320242, -2.19664, -4.043766, 0.01568628, 1, 0, 1,
-0.4250276, -0.85014, -2.145788, 0.007843138, 1, 0, 1,
-0.4248821, 0.7651673, 0.05757622, 0.003921569, 1, 0, 1,
-0.420903, -1.384365, -3.485721, 0, 1, 0.003921569, 1,
-0.4185255, -0.8524896, -4.203532, 0, 1, 0.01176471, 1,
-0.414137, -0.278409, -2.943507, 0, 1, 0.01568628, 1,
-0.4134832, 0.9855891, -0.97526, 0, 1, 0.02352941, 1,
-0.4079566, -0.06363767, -1.073643, 0, 1, 0.02745098, 1,
-0.4023944, -2.001144, -4.792408, 0, 1, 0.03529412, 1,
-0.3966918, -0.1910258, -0.08127324, 0, 1, 0.03921569, 1,
-0.3955384, 0.7525235, -0.1137497, 0, 1, 0.04705882, 1,
-0.3936679, -0.4731336, -1.790041, 0, 1, 0.05098039, 1,
-0.3918802, 0.03644447, -1.446141, 0, 1, 0.05882353, 1,
-0.3906928, 0.06392916, -0.6408633, 0, 1, 0.0627451, 1,
-0.3873083, 1.413537, -1.208326, 0, 1, 0.07058824, 1,
-0.3841791, -1.012339, -3.282633, 0, 1, 0.07450981, 1,
-0.3815216, -0.05637919, -1.456963, 0, 1, 0.08235294, 1,
-0.3772289, 1.429186, 0.2308308, 0, 1, 0.08627451, 1,
-0.3765011, -1.131138, -4.047404, 0, 1, 0.09411765, 1,
-0.3752061, 0.136587, -2.706954, 0, 1, 0.1019608, 1,
-0.373537, 0.6353315, -1.112851, 0, 1, 0.1058824, 1,
-0.3710318, -0.4049189, -1.093065, 0, 1, 0.1137255, 1,
-0.3666732, -0.2170921, -2.513293, 0, 1, 0.1176471, 1,
-0.3659233, -0.08300114, -2.775218, 0, 1, 0.1254902, 1,
-0.3640258, 0.02061294, -1.311939, 0, 1, 0.1294118, 1,
-0.3635442, -2.440102, -2.149571, 0, 1, 0.1372549, 1,
-0.3616442, -0.08596873, -1.414265, 0, 1, 0.1411765, 1,
-0.3521601, -1.283543, -3.902852, 0, 1, 0.1490196, 1,
-0.3514958, -0.4476504, -1.010676, 0, 1, 0.1529412, 1,
-0.3508594, 1.573596, -0.6614079, 0, 1, 0.1607843, 1,
-0.3465834, -2.234567, -2.507158, 0, 1, 0.1647059, 1,
-0.3407924, 0.5021809, -2.488963, 0, 1, 0.172549, 1,
-0.3404482, -2.596103, -2.503886, 0, 1, 0.1764706, 1,
-0.3366573, 0.2143444, -1.508137, 0, 1, 0.1843137, 1,
-0.3365098, 0.01259033, -1.9665, 0, 1, 0.1882353, 1,
-0.3362895, -0.4716575, -2.725642, 0, 1, 0.1960784, 1,
-0.3349748, 0.4923475, 1.378917, 0, 1, 0.2039216, 1,
-0.3337534, -1.319543, -2.303781, 0, 1, 0.2078431, 1,
-0.3255309, -0.1678344, -1.65185, 0, 1, 0.2156863, 1,
-0.3252092, -1.341896, -3.802984, 0, 1, 0.2196078, 1,
-0.324774, 0.2039122, -0.7235145, 0, 1, 0.227451, 1,
-0.3157597, 0.3827631, -0.7622319, 0, 1, 0.2313726, 1,
-0.3143338, -1.954223, -4.125031, 0, 1, 0.2392157, 1,
-0.3106831, 0.3162764, -0.9390346, 0, 1, 0.2431373, 1,
-0.3064139, 2.005436, 0.421906, 0, 1, 0.2509804, 1,
-0.3032721, -1.361315, -4.012033, 0, 1, 0.254902, 1,
-0.3032097, -0.6443403, -3.449901, 0, 1, 0.2627451, 1,
-0.3004974, 0.385165, 0.6972961, 0, 1, 0.2666667, 1,
-0.2966718, 0.7268156, -1.241194, 0, 1, 0.2745098, 1,
-0.294445, 1.693507, -0.4786629, 0, 1, 0.2784314, 1,
-0.290899, -2.221439, -2.863224, 0, 1, 0.2862745, 1,
-0.2859387, -0.3654879, -1.822252, 0, 1, 0.2901961, 1,
-0.2805739, 2.963671, -0.6308183, 0, 1, 0.2980392, 1,
-0.2798313, -0.7647232, -2.815939, 0, 1, 0.3058824, 1,
-0.2796743, -1.598987, -2.699418, 0, 1, 0.3098039, 1,
-0.2782832, -0.7106923, -2.361025, 0, 1, 0.3176471, 1,
-0.2776816, 0.6656176, 1.609064, 0, 1, 0.3215686, 1,
-0.2766578, -1.12905, -1.749128, 0, 1, 0.3294118, 1,
-0.2744541, -0.04269062, -3.342644, 0, 1, 0.3333333, 1,
-0.2722878, 0.8605437, -1.730557, 0, 1, 0.3411765, 1,
-0.2711274, 0.303744, -1.720269, 0, 1, 0.345098, 1,
-0.2679657, 2.253374, -0.1173839, 0, 1, 0.3529412, 1,
-0.2672244, 0.1259589, -0.1538252, 0, 1, 0.3568628, 1,
-0.2645179, 0.7431121, 1.118295, 0, 1, 0.3647059, 1,
-0.2634639, 0.5792242, -2.651568, 0, 1, 0.3686275, 1,
-0.2609808, -0.4300118, -0.1841764, 0, 1, 0.3764706, 1,
-0.2591935, 1.338572, 1.024085, 0, 1, 0.3803922, 1,
-0.2474613, -1.191446, -3.451681, 0, 1, 0.3882353, 1,
-0.2456835, -0.6156626, -1.349569, 0, 1, 0.3921569, 1,
-0.2406987, -1.85384, -4.596624, 0, 1, 0.4, 1,
-0.2368446, 0.00977926, -2.787768, 0, 1, 0.4078431, 1,
-0.2334432, 1.941154, -0.07608916, 0, 1, 0.4117647, 1,
-0.2307016, -1.029685, -1.612553, 0, 1, 0.4196078, 1,
-0.2292775, 0.6014113, 0.7311071, 0, 1, 0.4235294, 1,
-0.2217776, -1.198993, -4.196809, 0, 1, 0.4313726, 1,
-0.221141, -0.1900436, -0.4211812, 0, 1, 0.4352941, 1,
-0.2159289, 0.8142131, -1.222251, 0, 1, 0.4431373, 1,
-0.2144573, -0.08101387, -2.478228, 0, 1, 0.4470588, 1,
-0.2141305, -2.18459, -1.956806, 0, 1, 0.454902, 1,
-0.212183, -1.11357, -1.381183, 0, 1, 0.4588235, 1,
-0.2109315, 1.136035, -1.561385, 0, 1, 0.4666667, 1,
-0.2053999, -0.4292081, -2.496849, 0, 1, 0.4705882, 1,
-0.2032888, -0.2911371, -2.1429, 0, 1, 0.4784314, 1,
-0.2002654, 1.151211, 0.1605886, 0, 1, 0.4823529, 1,
-0.1935118, -0.7086216, -3.280589, 0, 1, 0.4901961, 1,
-0.1918563, 0.4846462, 1.200019, 0, 1, 0.4941176, 1,
-0.1902121, 0.01128587, -3.285591, 0, 1, 0.5019608, 1,
-0.188122, 1.015875, -0.2425537, 0, 1, 0.509804, 1,
-0.1844595, -1.119214, -3.059643, 0, 1, 0.5137255, 1,
-0.1835275, -0.2879958, -1.985844, 0, 1, 0.5215687, 1,
-0.1796193, -0.285556, -4.226729, 0, 1, 0.5254902, 1,
-0.1752355, 0.7333586, -0.6014264, 0, 1, 0.5333334, 1,
-0.1738862, 1.102301, -2.321733, 0, 1, 0.5372549, 1,
-0.1726926, -0.2656032, -0.991132, 0, 1, 0.5450981, 1,
-0.1709703, -0.02895656, -1.502579, 0, 1, 0.5490196, 1,
-0.170346, -0.1792993, -2.812302, 0, 1, 0.5568628, 1,
-0.1702587, -0.5747078, -3.16305, 0, 1, 0.5607843, 1,
-0.1688551, 0.3133372, 2.163031, 0, 1, 0.5686275, 1,
-0.1657173, 1.309411, -2.925362, 0, 1, 0.572549, 1,
-0.1641448, 0.2023699, -1.473739, 0, 1, 0.5803922, 1,
-0.1618784, 0.8727586, -0.9818659, 0, 1, 0.5843138, 1,
-0.1577943, -0.3457291, -1.875889, 0, 1, 0.5921569, 1,
-0.1536132, -0.7992887, -3.30398, 0, 1, 0.5960785, 1,
-0.1531444, -1.742136, -3.69012, 0, 1, 0.6039216, 1,
-0.1493412, -0.9867193, -3.528991, 0, 1, 0.6117647, 1,
-0.1478575, 1.190587, -2.840152, 0, 1, 0.6156863, 1,
-0.1473548, 0.4023964, 0.4799037, 0, 1, 0.6235294, 1,
-0.1468362, 1.138803, 1.552346, 0, 1, 0.627451, 1,
-0.142117, -0.05855328, -1.552715, 0, 1, 0.6352941, 1,
-0.1410661, -0.3436854, -3.371869, 0, 1, 0.6392157, 1,
-0.1403099, -2.062708, -3.772573, 0, 1, 0.6470588, 1,
-0.1395609, 0.4304584, -0.5855366, 0, 1, 0.6509804, 1,
-0.1368573, 0.3627119, 0.4131137, 0, 1, 0.6588235, 1,
-0.1337266, -0.04216307, -1.88168, 0, 1, 0.6627451, 1,
-0.1328564, 0.5207754, -0.6075281, 0, 1, 0.6705883, 1,
-0.1305195, 0.5277299, 0.4763592, 0, 1, 0.6745098, 1,
-0.1228919, -0.1269629, -1.949832, 0, 1, 0.682353, 1,
-0.1212329, 0.3424187, 0.6677079, 0, 1, 0.6862745, 1,
-0.118475, -0.7991169, -1.49088, 0, 1, 0.6941177, 1,
-0.1112424, -0.2041658, -4.373452, 0, 1, 0.7019608, 1,
-0.109857, -0.3080458, -3.104455, 0, 1, 0.7058824, 1,
-0.1098491, 1.098212, -0.2166271, 0, 1, 0.7137255, 1,
-0.1057217, 0.2642936, -2.269998, 0, 1, 0.7176471, 1,
-0.100689, -0.1688482, -2.256673, 0, 1, 0.7254902, 1,
-0.0988804, -0.577175, -2.942493, 0, 1, 0.7294118, 1,
-0.09729461, 0.2097596, 0.1838364, 0, 1, 0.7372549, 1,
-0.09652163, 0.1223962, 0.3931815, 0, 1, 0.7411765, 1,
-0.09218714, -1.487058, -2.907344, 0, 1, 0.7490196, 1,
-0.08722053, 0.3462878, 0.3718623, 0, 1, 0.7529412, 1,
-0.08333632, -2.069004, -4.713242, 0, 1, 0.7607843, 1,
-0.07605786, 0.3757167, 1.185748, 0, 1, 0.7647059, 1,
-0.07014833, -1.852189, -1.998925, 0, 1, 0.772549, 1,
-0.06629591, -0.9492485, -4.22697, 0, 1, 0.7764706, 1,
-0.06100766, -0.6440778, -3.166355, 0, 1, 0.7843137, 1,
-0.06007992, -1.263243, -0.9095554, 0, 1, 0.7882353, 1,
-0.0585782, -0.6511764, -3.443861, 0, 1, 0.7960784, 1,
-0.05672428, 0.9829657, -0.2325464, 0, 1, 0.8039216, 1,
-0.05512861, -2.270016, -4.619535, 0, 1, 0.8078431, 1,
-0.05390554, 1.595399, 1.801123, 0, 1, 0.8156863, 1,
-0.05332608, 0.8655313, 0.7804475, 0, 1, 0.8196079, 1,
-0.05057653, 1.086076, -0.4816347, 0, 1, 0.827451, 1,
-0.04813423, 0.7218058, -0.2745733, 0, 1, 0.8313726, 1,
-0.04448984, 0.8340585, -0.4531671, 0, 1, 0.8392157, 1,
-0.04208984, -0.5190505, -2.279603, 0, 1, 0.8431373, 1,
-0.03600994, -0.7743756, -2.202066, 0, 1, 0.8509804, 1,
-0.0342443, 1.090746, -0.07378324, 0, 1, 0.854902, 1,
-0.03186271, -0.2579475, -2.499669, 0, 1, 0.8627451, 1,
-0.02802107, -0.1249872, -2.33485, 0, 1, 0.8666667, 1,
-0.02568982, -0.8876653, -2.32411, 0, 1, 0.8745098, 1,
-0.0236825, 0.4463425, -1.298844, 0, 1, 0.8784314, 1,
-0.02053794, -0.06013034, -2.8934, 0, 1, 0.8862745, 1,
-0.01749747, 0.8075712, -1.363344, 0, 1, 0.8901961, 1,
-0.01433304, -1.491838, -4.25776, 0, 1, 0.8980392, 1,
-0.01298872, 1.678581, -0.2894719, 0, 1, 0.9058824, 1,
-0.008194396, -1.971238, -4.117743, 0, 1, 0.9098039, 1,
-0.007160055, 0.4605029, -0.3667403, 0, 1, 0.9176471, 1,
-0.005219135, 1.726343, 0.836898, 0, 1, 0.9215686, 1,
-0.005174073, -0.7983125, -2.978072, 0, 1, 0.9294118, 1,
-0.001697001, 1.979729, -1.342142, 0, 1, 0.9333333, 1,
-0.0003810881, 0.3135992, 0.8285385, 0, 1, 0.9411765, 1,
0.002569657, 0.5802932, 1.197222, 0, 1, 0.945098, 1,
0.006721651, 0.1455739, 0.9823718, 0, 1, 0.9529412, 1,
0.00983192, -0.5977255, 3.247797, 0, 1, 0.9568627, 1,
0.01068397, -0.2572721, 4.627022, 0, 1, 0.9647059, 1,
0.01214871, 0.9985907, -2.120815, 0, 1, 0.9686275, 1,
0.01232936, 0.4214485, -1.157901, 0, 1, 0.9764706, 1,
0.01336763, -2.712672, 2.296516, 0, 1, 0.9803922, 1,
0.01354669, 0.05548136, 0.1629107, 0, 1, 0.9882353, 1,
0.01873365, 0.9474714, 1.201848, 0, 1, 0.9921569, 1,
0.02476881, -0.515164, 2.624065, 0, 1, 1, 1,
0.02499461, 0.6168381, 0.4046881, 0, 0.9921569, 1, 1,
0.03077565, 1.965358, -0.8382331, 0, 0.9882353, 1, 1,
0.03618841, 0.4327531, -1.096165, 0, 0.9803922, 1, 1,
0.03954959, -2.246864, 3.158294, 0, 0.9764706, 1, 1,
0.03976108, -0.8172004, 3.597946, 0, 0.9686275, 1, 1,
0.04187071, 0.3517886, -2.100868, 0, 0.9647059, 1, 1,
0.04229735, -0.1905887, 3.865666, 0, 0.9568627, 1, 1,
0.04432816, -1.985221, 2.370993, 0, 0.9529412, 1, 1,
0.04443193, 0.07929122, 0.7913277, 0, 0.945098, 1, 1,
0.04767168, 0.6669404, -1.413717, 0, 0.9411765, 1, 1,
0.04885998, 1.162545, -0.5015643, 0, 0.9333333, 1, 1,
0.05042332, -1.245381, 3.613299, 0, 0.9294118, 1, 1,
0.05256197, -0.7365124, 2.776541, 0, 0.9215686, 1, 1,
0.05399086, -0.8142411, 2.563822, 0, 0.9176471, 1, 1,
0.05430804, -1.325904, 3.270115, 0, 0.9098039, 1, 1,
0.05564207, 1.11927, 0.172078, 0, 0.9058824, 1, 1,
0.05592424, 0.7528843, 1.170756, 0, 0.8980392, 1, 1,
0.05899844, 1.888889, -1.118578, 0, 0.8901961, 1, 1,
0.05988238, 0.1909043, -0.4537755, 0, 0.8862745, 1, 1,
0.06319468, 1.348332, 0.962516, 0, 0.8784314, 1, 1,
0.06348169, 0.1878775, 2.320948, 0, 0.8745098, 1, 1,
0.06593672, -1.823645, 4.931553, 0, 0.8666667, 1, 1,
0.0684348, -0.3151838, 2.10587, 0, 0.8627451, 1, 1,
0.06968428, 0.5126401, -1.273742, 0, 0.854902, 1, 1,
0.06984188, 0.09514944, 0.8687996, 0, 0.8509804, 1, 1,
0.07644703, -1.032393, 2.117348, 0, 0.8431373, 1, 1,
0.08135828, 1.074109, -0.6670693, 0, 0.8392157, 1, 1,
0.08830874, -1.547845, 5.898273, 0, 0.8313726, 1, 1,
0.08872064, 0.2938741, -1.216798, 0, 0.827451, 1, 1,
0.09039952, 0.06533322, 1.469504, 0, 0.8196079, 1, 1,
0.09118293, -1.182088, 3.100574, 0, 0.8156863, 1, 1,
0.09973106, 0.04885277, 1.110376, 0, 0.8078431, 1, 1,
0.1015468, 0.7519253, 0.3880163, 0, 0.8039216, 1, 1,
0.101638, -0.7356515, 3.117413, 0, 0.7960784, 1, 1,
0.1026464, 0.9037455, 1.891443, 0, 0.7882353, 1, 1,
0.1044179, 0.7323024, -0.5493603, 0, 0.7843137, 1, 1,
0.1063665, 0.195396, -0.5775586, 0, 0.7764706, 1, 1,
0.1068373, -1.945889, 2.533022, 0, 0.772549, 1, 1,
0.1087724, 0.398049, 1.217302, 0, 0.7647059, 1, 1,
0.1126675, -0.5137202, 3.00961, 0, 0.7607843, 1, 1,
0.1130022, 0.1124837, 0.2673425, 0, 0.7529412, 1, 1,
0.1130988, -2.265653, 4.158931, 0, 0.7490196, 1, 1,
0.1144303, -1.576705, 3.024957, 0, 0.7411765, 1, 1,
0.1151685, -0.01155556, 2.49196, 0, 0.7372549, 1, 1,
0.1159437, -0.7726569, 1.65512, 0, 0.7294118, 1, 1,
0.116925, 1.23713, -1.910642, 0, 0.7254902, 1, 1,
0.1189824, -0.4651258, 2.014291, 0, 0.7176471, 1, 1,
0.1218274, -1.803563, 1.6807, 0, 0.7137255, 1, 1,
0.1282138, 0.3348525, 2.878561, 0, 0.7058824, 1, 1,
0.1328241, -0.01786271, 4.008716, 0, 0.6980392, 1, 1,
0.1329893, 2.145465, -0.4656963, 0, 0.6941177, 1, 1,
0.1419416, -1.355544, 4.618592, 0, 0.6862745, 1, 1,
0.142034, -1.00681, 2.669873, 0, 0.682353, 1, 1,
0.1488152, -1.07861, 1.924044, 0, 0.6745098, 1, 1,
0.151364, -0.7550302, 3.654379, 0, 0.6705883, 1, 1,
0.1518103, -0.4267437, 3.275981, 0, 0.6627451, 1, 1,
0.1573527, 0.7603266, 2.452484, 0, 0.6588235, 1, 1,
0.1599825, -1.163412, 4.392207, 0, 0.6509804, 1, 1,
0.16101, 0.691502, 0.7449407, 0, 0.6470588, 1, 1,
0.1654122, -0.4316762, 4.035729, 0, 0.6392157, 1, 1,
0.1661828, 0.217076, 1.00822, 0, 0.6352941, 1, 1,
0.166479, 0.1414478, 0.9509762, 0, 0.627451, 1, 1,
0.1688541, -0.2950643, 2.29252, 0, 0.6235294, 1, 1,
0.1690034, -1.493556, 3.820553, 0, 0.6156863, 1, 1,
0.1717519, 0.3612411, 0.8189496, 0, 0.6117647, 1, 1,
0.1735101, 0.1399442, -0.01091476, 0, 0.6039216, 1, 1,
0.1841748, -0.5195788, 2.660966, 0, 0.5960785, 1, 1,
0.1860922, -1.402162, 2.821333, 0, 0.5921569, 1, 1,
0.1870955, -0.9195871, 4.791924, 0, 0.5843138, 1, 1,
0.1871824, -0.6088498, 3.623336, 0, 0.5803922, 1, 1,
0.1918443, 1.36768, -0.4067633, 0, 0.572549, 1, 1,
0.1920416, 0.2825628, 0.5078216, 0, 0.5686275, 1, 1,
0.1943326, 0.6421309, 0.3773509, 0, 0.5607843, 1, 1,
0.1947383, 1.270511, -0.2152433, 0, 0.5568628, 1, 1,
0.19574, 0.1502617, 0.8468428, 0, 0.5490196, 1, 1,
0.1958733, 0.6495985, -1.462837, 0, 0.5450981, 1, 1,
0.198606, -0.02912496, 1.040496, 0, 0.5372549, 1, 1,
0.2064027, -0.5926508, 4.557672, 0, 0.5333334, 1, 1,
0.2115974, 1.52405, -0.4157613, 0, 0.5254902, 1, 1,
0.2161637, 0.7454537, 0.8669841, 0, 0.5215687, 1, 1,
0.2213662, 0.5763906, -0.5095079, 0, 0.5137255, 1, 1,
0.2243401, -0.6727608, 3.160675, 0, 0.509804, 1, 1,
0.2252156, 0.6231778, -1.575547, 0, 0.5019608, 1, 1,
0.2277437, -0.2436428, 0.9321996, 0, 0.4941176, 1, 1,
0.2293335, 0.3502119, -0.8165675, 0, 0.4901961, 1, 1,
0.2314863, 0.3018533, -0.02796178, 0, 0.4823529, 1, 1,
0.2317884, 0.3095191, 1.626929, 0, 0.4784314, 1, 1,
0.2330542, -1.155766, 1.358814, 0, 0.4705882, 1, 1,
0.2332062, 0.4421977, 1.911632, 0, 0.4666667, 1, 1,
0.2354472, -1.384492, 1.457503, 0, 0.4588235, 1, 1,
0.2399321, -2.001876, 2.808446, 0, 0.454902, 1, 1,
0.2464765, 0.5174913, -0.8423237, 0, 0.4470588, 1, 1,
0.2509334, -1.455701, 1.527194, 0, 0.4431373, 1, 1,
0.252251, -2.463306, 3.298892, 0, 0.4352941, 1, 1,
0.2541848, -0.2467989, 1.864093, 0, 0.4313726, 1, 1,
0.2596028, 1.331641, -0.3070388, 0, 0.4235294, 1, 1,
0.2644884, -0.1039743, 1.711112, 0, 0.4196078, 1, 1,
0.2653714, 1.00109, -0.3217982, 0, 0.4117647, 1, 1,
0.2665621, 0.472001, 0.1688735, 0, 0.4078431, 1, 1,
0.2693093, -2.192684, 2.156786, 0, 0.4, 1, 1,
0.2708983, 0.5883006, 1.851545, 0, 0.3921569, 1, 1,
0.2721707, 0.1616472, 1.557086, 0, 0.3882353, 1, 1,
0.2780499, -0.2960459, 3.177819, 0, 0.3803922, 1, 1,
0.2792697, 1.330209, -0.4579659, 0, 0.3764706, 1, 1,
0.2865556, -1.083865, 4.873101, 0, 0.3686275, 1, 1,
0.2882679, -0.8611308, 2.520895, 0, 0.3647059, 1, 1,
0.2890253, 0.4298201, 0.1997623, 0, 0.3568628, 1, 1,
0.292776, -0.8167667, 3.895939, 0, 0.3529412, 1, 1,
0.2928221, -0.626074, 2.216441, 0, 0.345098, 1, 1,
0.2960777, 0.5911949, -0.5671207, 0, 0.3411765, 1, 1,
0.2982841, 0.2145958, 1.637218, 0, 0.3333333, 1, 1,
0.2984042, 0.1250285, 0.7673153, 0, 0.3294118, 1, 1,
0.2990794, 0.7670273, 1.70498, 0, 0.3215686, 1, 1,
0.2996065, -1.035081, 5.234437, 0, 0.3176471, 1, 1,
0.3030947, -1.275648, 4.804626, 0, 0.3098039, 1, 1,
0.3037661, 0.9150583, 0.1185327, 0, 0.3058824, 1, 1,
0.3038075, 0.5937582, 0.02478526, 0, 0.2980392, 1, 1,
0.3058426, -1.643994, 4.258278, 0, 0.2901961, 1, 1,
0.3062063, -0.9605152, 3.82351, 0, 0.2862745, 1, 1,
0.3125178, 2.388946, 0.4179782, 0, 0.2784314, 1, 1,
0.3129582, -0.9496639, 2.698228, 0, 0.2745098, 1, 1,
0.3144715, 0.0485243, 2.804669, 0, 0.2666667, 1, 1,
0.3145268, -0.2928235, 4.3196, 0, 0.2627451, 1, 1,
0.3177456, 0.1514987, 3.699121, 0, 0.254902, 1, 1,
0.3178032, 0.1253279, 0.05575439, 0, 0.2509804, 1, 1,
0.3201919, 1.972902, -0.04057824, 0, 0.2431373, 1, 1,
0.321357, -1.302979, 0.8640267, 0, 0.2392157, 1, 1,
0.3251658, -1.220561, 3.420139, 0, 0.2313726, 1, 1,
0.3281288, 1.419006, -0.8842166, 0, 0.227451, 1, 1,
0.3281792, 0.5647243, -1.529171, 0, 0.2196078, 1, 1,
0.3289373, 0.7048437, 1.498755, 0, 0.2156863, 1, 1,
0.3338945, -0.3765956, 1.826073, 0, 0.2078431, 1, 1,
0.3363012, -0.7720894, 2.771277, 0, 0.2039216, 1, 1,
0.3368232, 0.6469517, 2.166499, 0, 0.1960784, 1, 1,
0.3381665, -0.0886364, 0.7382876, 0, 0.1882353, 1, 1,
0.3382488, -1.129591, 1.656271, 0, 0.1843137, 1, 1,
0.3423531, -0.7083613, 2.23912, 0, 0.1764706, 1, 1,
0.3423889, -1.235582, 2.073773, 0, 0.172549, 1, 1,
0.3484298, -0.2650748, 1.055766, 0, 0.1647059, 1, 1,
0.3491637, -1.034193, 2.874332, 0, 0.1607843, 1, 1,
0.3550043, 1.89821, -0.3829288, 0, 0.1529412, 1, 1,
0.3565115, 0.2006173, -0.2150925, 0, 0.1490196, 1, 1,
0.3609315, -2.047081, 3.157669, 0, 0.1411765, 1, 1,
0.3657335, 1.154426, 1.570845, 0, 0.1372549, 1, 1,
0.3671263, -1.446346, 3.060582, 0, 0.1294118, 1, 1,
0.3672776, -0.7463921, 3.795276, 0, 0.1254902, 1, 1,
0.368523, 3.405351, 0.2129639, 0, 0.1176471, 1, 1,
0.3686341, 0.03676232, 0.9633679, 0, 0.1137255, 1, 1,
0.3693772, -0.3424032, 2.19691, 0, 0.1058824, 1, 1,
0.3700122, -0.3590572, 1.916368, 0, 0.09803922, 1, 1,
0.3739816, 1.49596, 0.8388983, 0, 0.09411765, 1, 1,
0.3766366, 0.5362573, 0.456522, 0, 0.08627451, 1, 1,
0.3768763, -1.661702, 2.818144, 0, 0.08235294, 1, 1,
0.3775567, -0.1195719, 3.056643, 0, 0.07450981, 1, 1,
0.3781152, -0.3249869, 1.092705, 0, 0.07058824, 1, 1,
0.3805806, 0.1738058, 1.549546, 0, 0.0627451, 1, 1,
0.3855886, 0.8702387, 0.09263617, 0, 0.05882353, 1, 1,
0.38704, 0.6563333, 0.7846652, 0, 0.05098039, 1, 1,
0.3883886, 0.9009598, 0.5359944, 0, 0.04705882, 1, 1,
0.3884969, 1.424146, 1.095022, 0, 0.03921569, 1, 1,
0.3943943, 0.2315738, 1.325892, 0, 0.03529412, 1, 1,
0.3953189, 0.7824721, 0.7501711, 0, 0.02745098, 1, 1,
0.395629, 1.552403, 0.5981077, 0, 0.02352941, 1, 1,
0.4025683, 0.006079114, 1.893076, 0, 0.01568628, 1, 1,
0.4036447, -1.721679, 2.791436, 0, 0.01176471, 1, 1,
0.4037466, -0.703505, 3.339562, 0, 0.003921569, 1, 1,
0.4044782, 0.7065326, -1.576415, 0.003921569, 0, 1, 1,
0.4049123, -1.854756, 3.548138, 0.007843138, 0, 1, 1,
0.4052723, -0.1393066, 1.911722, 0.01568628, 0, 1, 1,
0.4053777, 0.5857965, 0.1104681, 0.01960784, 0, 1, 1,
0.4073002, -1.111577, 1.529211, 0.02745098, 0, 1, 1,
0.4084118, -0.1916298, 1.813521, 0.03137255, 0, 1, 1,
0.4126943, -0.8241, 2.074889, 0.03921569, 0, 1, 1,
0.4297691, 0.4440349, -0.04752816, 0.04313726, 0, 1, 1,
0.4305154, -0.04562715, 0.01546621, 0.05098039, 0, 1, 1,
0.4378197, 0.1438631, -0.5245638, 0.05490196, 0, 1, 1,
0.4403947, -2.901707, 2.575003, 0.0627451, 0, 1, 1,
0.4423826, -1.915218, 2.991014, 0.06666667, 0, 1, 1,
0.4456574, 0.8833179, -0.4052354, 0.07450981, 0, 1, 1,
0.4461907, -0.1860163, 2.38045, 0.07843138, 0, 1, 1,
0.45034, 0.255051, 1.62675, 0.08627451, 0, 1, 1,
0.4561769, 0.556106, 1.244072, 0.09019608, 0, 1, 1,
0.4565122, 0.1370179, 0.5438208, 0.09803922, 0, 1, 1,
0.4614984, 1.407939, -0.02939468, 0.1058824, 0, 1, 1,
0.4718376, -0.736828, 2.120811, 0.1098039, 0, 1, 1,
0.4734347, 0.204125, 1.305372, 0.1176471, 0, 1, 1,
0.4779185, -0.1766208, 1.491623, 0.1215686, 0, 1, 1,
0.4792582, 0.6820277, -0.6648454, 0.1294118, 0, 1, 1,
0.4816129, 1.079663, -1.779788, 0.1333333, 0, 1, 1,
0.4868286, 0.05765445, 1.488441, 0.1411765, 0, 1, 1,
0.5006596, -0.6119756, 1.288089, 0.145098, 0, 1, 1,
0.50086, 0.5954489, 0.9729605, 0.1529412, 0, 1, 1,
0.5092665, 0.09868313, 1.203322, 0.1568628, 0, 1, 1,
0.511476, -0.137842, 1.784996, 0.1647059, 0, 1, 1,
0.514457, 0.5786815, -0.4225117, 0.1686275, 0, 1, 1,
0.5152879, 0.1911278, 1.711867, 0.1764706, 0, 1, 1,
0.5181434, -1.571994, 2.580909, 0.1803922, 0, 1, 1,
0.5201355, -0.291919, 2.361736, 0.1882353, 0, 1, 1,
0.5203382, -0.6728541, 3.015683, 0.1921569, 0, 1, 1,
0.5220786, 0.8641265, 0.2118936, 0.2, 0, 1, 1,
0.5239357, -0.3881782, 1.582079, 0.2078431, 0, 1, 1,
0.5258937, 0.6787941, -1.52427, 0.2117647, 0, 1, 1,
0.5279962, 0.1085884, 1.970524, 0.2196078, 0, 1, 1,
0.5329801, 0.2998556, 2.265721, 0.2235294, 0, 1, 1,
0.5348457, -0.5975707, 0.05931615, 0.2313726, 0, 1, 1,
0.541864, 1.049853, 0.2625791, 0.2352941, 0, 1, 1,
0.5429107, 0.002842197, 2.188786, 0.2431373, 0, 1, 1,
0.5435407, 0.6327181, 0.04373312, 0.2470588, 0, 1, 1,
0.54585, -1.380177, 1.843059, 0.254902, 0, 1, 1,
0.5524697, 1.125289, -0.3735041, 0.2588235, 0, 1, 1,
0.555379, -0.9857507, 3.507519, 0.2666667, 0, 1, 1,
0.5590751, -0.2431508, 1.413035, 0.2705882, 0, 1, 1,
0.5622638, 0.4113048, -1.239052, 0.2784314, 0, 1, 1,
0.5678209, 0.5561211, 0.538026, 0.282353, 0, 1, 1,
0.5696132, 0.7006306, 1.22028, 0.2901961, 0, 1, 1,
0.5711917, 1.365734, -0.2657377, 0.2941177, 0, 1, 1,
0.5714029, 0.6940882, 0.7584277, 0.3019608, 0, 1, 1,
0.5733684, -0.7319797, 0.9251696, 0.3098039, 0, 1, 1,
0.5806997, 2.134045, 1.337063, 0.3137255, 0, 1, 1,
0.5820339, -0.3641277, 1.204653, 0.3215686, 0, 1, 1,
0.5877586, -0.57461, 3.020254, 0.3254902, 0, 1, 1,
0.5972905, -0.5337908, 2.013279, 0.3333333, 0, 1, 1,
0.6011649, 0.6402091, 1.27524, 0.3372549, 0, 1, 1,
0.6026884, 0.04493881, 1.708763, 0.345098, 0, 1, 1,
0.610451, -1.654665, 3.305806, 0.3490196, 0, 1, 1,
0.6154683, -1.239789, 2.616455, 0.3568628, 0, 1, 1,
0.6183299, -0.8605247, 1.423404, 0.3607843, 0, 1, 1,
0.6197793, -0.1081003, 2.114615, 0.3686275, 0, 1, 1,
0.623134, 0.4834412, 1.462227, 0.372549, 0, 1, 1,
0.6272053, 0.5087129, -0.0584739, 0.3803922, 0, 1, 1,
0.6326303, -0.6627074, 1.167041, 0.3843137, 0, 1, 1,
0.6327198, 0.2292973, 1.061604, 0.3921569, 0, 1, 1,
0.6408768, 1.123667, -0.4514178, 0.3960784, 0, 1, 1,
0.6419572, -0.6426301, 1.96084, 0.4039216, 0, 1, 1,
0.6436195, -0.2835322, 2.087662, 0.4117647, 0, 1, 1,
0.6467899, -0.5015005, 3.198465, 0.4156863, 0, 1, 1,
0.6509443, 0.2095348, 0.6158085, 0.4235294, 0, 1, 1,
0.6530352, -0.3089256, 0.9502899, 0.427451, 0, 1, 1,
0.6545284, -0.5028239, 2.814387, 0.4352941, 0, 1, 1,
0.6557322, 0.4364495, 1.465912, 0.4392157, 0, 1, 1,
0.6562004, -0.2070583, 1.59669, 0.4470588, 0, 1, 1,
0.6579298, -1.041979, 3.759902, 0.4509804, 0, 1, 1,
0.6609259, -1.299543, 3.082888, 0.4588235, 0, 1, 1,
0.6659639, -0.2373461, 3.820599, 0.4627451, 0, 1, 1,
0.6660533, -0.4055586, 1.024377, 0.4705882, 0, 1, 1,
0.6683304, -0.1440569, 1.608587, 0.4745098, 0, 1, 1,
0.6717078, 0.9219561, -0.3546217, 0.4823529, 0, 1, 1,
0.6721548, -1.047747, 2.638781, 0.4862745, 0, 1, 1,
0.6738243, -0.7317781, 1.511539, 0.4941176, 0, 1, 1,
0.6777751, 1.374288, 0.265051, 0.5019608, 0, 1, 1,
0.6832367, 0.1463171, 1.428434, 0.5058824, 0, 1, 1,
0.6872486, 0.3904041, 1.563221, 0.5137255, 0, 1, 1,
0.6895908, 0.5388354, 1.220946, 0.5176471, 0, 1, 1,
0.7054591, -2.872838, 4.757215, 0.5254902, 0, 1, 1,
0.7077814, -1.643794, 2.298856, 0.5294118, 0, 1, 1,
0.7081845, -0.8412493, 2.204388, 0.5372549, 0, 1, 1,
0.7101695, -0.3694683, 4.050879, 0.5411765, 0, 1, 1,
0.7116962, 0.4181639, 2.512448, 0.5490196, 0, 1, 1,
0.7121902, 0.6056742, -0.1465867, 0.5529412, 0, 1, 1,
0.7131709, 0.7669935, 2.069341, 0.5607843, 0, 1, 1,
0.7134174, -0.3085741, 2.543578, 0.5647059, 0, 1, 1,
0.7209373, 0.08394025, 0.8848285, 0.572549, 0, 1, 1,
0.7230703, -0.4124557, 1.855322, 0.5764706, 0, 1, 1,
0.723153, 0.1234241, 1.087942, 0.5843138, 0, 1, 1,
0.7237277, 1.850483, 1.265802, 0.5882353, 0, 1, 1,
0.7315714, 0.3632006, 1.593912, 0.5960785, 0, 1, 1,
0.7333388, 0.5045422, -1.003346, 0.6039216, 0, 1, 1,
0.736316, -0.2687204, 1.367898, 0.6078432, 0, 1, 1,
0.7364956, 0.8530272, 1.030577, 0.6156863, 0, 1, 1,
0.7385596, -1.286236, 2.018844, 0.6196079, 0, 1, 1,
0.7433959, 0.1587971, 2.219645, 0.627451, 0, 1, 1,
0.743784, -0.02480058, 1.925331, 0.6313726, 0, 1, 1,
0.744053, -0.9824721, 1.352488, 0.6392157, 0, 1, 1,
0.747983, 0.533654, 0.4721949, 0.6431373, 0, 1, 1,
0.7532113, -1.159043, 3.503465, 0.6509804, 0, 1, 1,
0.7564597, 0.5238721, 1.886162, 0.654902, 0, 1, 1,
0.7571247, -1.26436, 2.518262, 0.6627451, 0, 1, 1,
0.7571499, -1.26766, 2.606439, 0.6666667, 0, 1, 1,
0.7595066, 0.2088686, -0.3660402, 0.6745098, 0, 1, 1,
0.7677544, -0.7895519, 2.4821, 0.6784314, 0, 1, 1,
0.7682482, 0.7052495, 0.4040757, 0.6862745, 0, 1, 1,
0.7695306, 0.3569488, -1.401191, 0.6901961, 0, 1, 1,
0.7787622, 0.4973744, 1.163232, 0.6980392, 0, 1, 1,
0.7818092, 0.7143838, 1.844874, 0.7058824, 0, 1, 1,
0.7821336, 0.3909801, 1.502421, 0.7098039, 0, 1, 1,
0.7822939, -0.3165105, 1.63326, 0.7176471, 0, 1, 1,
0.7842605, 0.5967898, 3.104021, 0.7215686, 0, 1, 1,
0.7909222, -1.47975, 3.976101, 0.7294118, 0, 1, 1,
0.7944782, -1.439785, 3.041709, 0.7333333, 0, 1, 1,
0.7981262, -1.143079, 3.534298, 0.7411765, 0, 1, 1,
0.7981589, 1.504815, -0.2730604, 0.7450981, 0, 1, 1,
0.7987706, -0.01912282, 1.037253, 0.7529412, 0, 1, 1,
0.8026733, -0.495329, 3.72247, 0.7568628, 0, 1, 1,
0.8032875, -0.7510974, 2.21898, 0.7647059, 0, 1, 1,
0.8108904, -0.4299242, 1.841801, 0.7686275, 0, 1, 1,
0.8142924, -0.1888588, -0.2449327, 0.7764706, 0, 1, 1,
0.8145903, 1.977579, 0.1485457, 0.7803922, 0, 1, 1,
0.814859, -1.423765, 3.603188, 0.7882353, 0, 1, 1,
0.8151913, 0.1084591, 0.3149379, 0.7921569, 0, 1, 1,
0.8157166, 1.484556, 1.955572, 0.8, 0, 1, 1,
0.8164315, 0.1932761, 1.89232, 0.8078431, 0, 1, 1,
0.826476, -0.3890195, 1.829761, 0.8117647, 0, 1, 1,
0.8308759, 0.9373081, -0.1239756, 0.8196079, 0, 1, 1,
0.8328617, 0.1750058, 1.863439, 0.8235294, 0, 1, 1,
0.8386972, 0.01986202, 1.076295, 0.8313726, 0, 1, 1,
0.8436033, 0.9883286, 1.746192, 0.8352941, 0, 1, 1,
0.8451344, -0.5153407, 3.330916, 0.8431373, 0, 1, 1,
0.8468366, -0.2611252, 3.328375, 0.8470588, 0, 1, 1,
0.8536476, -1.654918, 3.085993, 0.854902, 0, 1, 1,
0.8598061, -0.4592331, 2.306581, 0.8588235, 0, 1, 1,
0.8679579, 1.379062, -0.6244207, 0.8666667, 0, 1, 1,
0.8720032, -1.683388, 1.853579, 0.8705882, 0, 1, 1,
0.8809242, -0.8865182, 2.180152, 0.8784314, 0, 1, 1,
0.8856974, -0.2536631, 2.71043, 0.8823529, 0, 1, 1,
0.8965501, -0.2656447, 2.225058, 0.8901961, 0, 1, 1,
0.8980148, -0.2505501, 0.1567631, 0.8941177, 0, 1, 1,
0.9008436, 1.30269, -0.5017248, 0.9019608, 0, 1, 1,
0.902862, -1.13757, 2.282897, 0.9098039, 0, 1, 1,
0.9160424, -1.183623, 2.854211, 0.9137255, 0, 1, 1,
0.9171237, 0.1649323, 0.8739673, 0.9215686, 0, 1, 1,
0.9172338, 0.3285707, 1.455297, 0.9254902, 0, 1, 1,
0.9233012, 0.5697871, 0.8837074, 0.9333333, 0, 1, 1,
0.9236553, -2.802896, 3.08067, 0.9372549, 0, 1, 1,
0.9310941, 0.0529271, 1.029409, 0.945098, 0, 1, 1,
0.9312033, 0.1557813, 2.54264, 0.9490196, 0, 1, 1,
0.943132, 0.5315696, 0.7603517, 0.9568627, 0, 1, 1,
0.9483273, 1.113494, 0.2921802, 0.9607843, 0, 1, 1,
0.9483847, -0.3550082, 2.742694, 0.9686275, 0, 1, 1,
0.9521453, 0.7693115, 1.013821, 0.972549, 0, 1, 1,
0.955664, 1.335286, 0.6582077, 0.9803922, 0, 1, 1,
0.9714348, 0.6180872, 1.389577, 0.9843137, 0, 1, 1,
0.9723096, -0.61725, 3.661427, 0.9921569, 0, 1, 1,
0.9756866, 0.8698773, -0.3646212, 0.9960784, 0, 1, 1,
0.9776775, 1.581795, -0.2526787, 1, 0, 0.9960784, 1,
0.9819527, 0.9037105, -0.197502, 1, 0, 0.9882353, 1,
0.9819728, 0.1487056, 2.224306, 1, 0, 0.9843137, 1,
0.9881492, -0.5136436, 3.597094, 1, 0, 0.9764706, 1,
0.9917212, -0.5578318, 2.663652, 1, 0, 0.972549, 1,
0.9936298, 0.6953439, 0.3874541, 1, 0, 0.9647059, 1,
1.012204, 1.680535, -0.05525304, 1, 0, 0.9607843, 1,
1.019248, -0.9464693, 1.523585, 1, 0, 0.9529412, 1,
1.026529, -0.1040725, 2.007053, 1, 0, 0.9490196, 1,
1.032266, -0.7982552, 1.834903, 1, 0, 0.9411765, 1,
1.033736, -0.3715354, 1.128403, 1, 0, 0.9372549, 1,
1.046331, 0.6633603, 1.281972, 1, 0, 0.9294118, 1,
1.046354, -0.2481704, 1.919341, 1, 0, 0.9254902, 1,
1.051373, 0.1958437, 2.570496, 1, 0, 0.9176471, 1,
1.052624, -0.1700738, 1.987126, 1, 0, 0.9137255, 1,
1.061818, 1.315993, 2.370804, 1, 0, 0.9058824, 1,
1.065026, -0.5057745, 2.660712, 1, 0, 0.9019608, 1,
1.066643, 0.8602415, 2.146155, 1, 0, 0.8941177, 1,
1.070977, -0.01973797, 1.133531, 1, 0, 0.8862745, 1,
1.074821, -0.4072648, 0.1302471, 1, 0, 0.8823529, 1,
1.075807, -0.06068797, 2.945313, 1, 0, 0.8745098, 1,
1.079907, -1.482451, 2.573152, 1, 0, 0.8705882, 1,
1.081037, -0.8261189, 3.335376, 1, 0, 0.8627451, 1,
1.08955, 2.054618, 0.1291514, 1, 0, 0.8588235, 1,
1.091533, -0.7444875, 2.424645, 1, 0, 0.8509804, 1,
1.092454, 1.457067, -0.02194237, 1, 0, 0.8470588, 1,
1.092642, 0.3816061, 2.486506, 1, 0, 0.8392157, 1,
1.094441, -0.5388616, 2.732221, 1, 0, 0.8352941, 1,
1.100138, -1.268267, 2.326334, 1, 0, 0.827451, 1,
1.102637, 0.6112343, 2.880163, 1, 0, 0.8235294, 1,
1.104361, 0.5289117, -0.1289629, 1, 0, 0.8156863, 1,
1.106815, -1.401005, 2.604066, 1, 0, 0.8117647, 1,
1.11062, -0.02452119, 3.051944, 1, 0, 0.8039216, 1,
1.112275, 0.36359, 2.248699, 1, 0, 0.7960784, 1,
1.115002, -1.122012, 3.094149, 1, 0, 0.7921569, 1,
1.118326, 0.7001017, 1.118685, 1, 0, 0.7843137, 1,
1.121085, 0.5889192, 2.574791, 1, 0, 0.7803922, 1,
1.121452, 0.01350564, 1.662755, 1, 0, 0.772549, 1,
1.125672, -0.4040581, 1.460104, 1, 0, 0.7686275, 1,
1.14035, -0.4433531, 2.029364, 1, 0, 0.7607843, 1,
1.141239, -1.481994, 1.846105, 1, 0, 0.7568628, 1,
1.149207, -0.5540348, 1.911386, 1, 0, 0.7490196, 1,
1.150487, -1.619395, 3.728301, 1, 0, 0.7450981, 1,
1.150947, 0.4139647, 1.448094, 1, 0, 0.7372549, 1,
1.151752, -0.509805, 1.301488, 1, 0, 0.7333333, 1,
1.157394, 0.0786965, 0.5977694, 1, 0, 0.7254902, 1,
1.158482, -0.6170612, 0.1907849, 1, 0, 0.7215686, 1,
1.164965, -0.2628364, 3.165054, 1, 0, 0.7137255, 1,
1.168855, 3.22795, -0.2501489, 1, 0, 0.7098039, 1,
1.169608, 1.447832, 1.023276, 1, 0, 0.7019608, 1,
1.174613, 0.04663401, 2.349511, 1, 0, 0.6941177, 1,
1.174755, -0.1184212, 0.4355046, 1, 0, 0.6901961, 1,
1.18721, -0.8605981, 2.897405, 1, 0, 0.682353, 1,
1.187445, -0.6355327, -0.3738667, 1, 0, 0.6784314, 1,
1.193463, 0.7970188, 1.528743, 1, 0, 0.6705883, 1,
1.20593, -2.260264, 3.058231, 1, 0, 0.6666667, 1,
1.213467, -0.7088333, 4.028896, 1, 0, 0.6588235, 1,
1.22119, 0.06334472, 1.709376, 1, 0, 0.654902, 1,
1.224104, -0.5218321, 2.508125, 1, 0, 0.6470588, 1,
1.23639, -0.4289657, 2.656924, 1, 0, 0.6431373, 1,
1.242728, -0.2608866, 1.580122, 1, 0, 0.6352941, 1,
1.244484, 0.6221107, 1.452595, 1, 0, 0.6313726, 1,
1.262924, 0.6110393, 2.136337, 1, 0, 0.6235294, 1,
1.269802, 1.304587, -0.01871604, 1, 0, 0.6196079, 1,
1.272606, -0.7751741, 2.401122, 1, 0, 0.6117647, 1,
1.27887, -0.4174261, 1.991614, 1, 0, 0.6078432, 1,
1.29071, 1.853989, 1.693774, 1, 0, 0.6, 1,
1.291632, 0.8106426, 1.709716, 1, 0, 0.5921569, 1,
1.293875, -0.4628067, 0.1473471, 1, 0, 0.5882353, 1,
1.301384, -0.3827373, 1.168717, 1, 0, 0.5803922, 1,
1.303486, 0.3944429, 2.02742, 1, 0, 0.5764706, 1,
1.303675, 0.1709953, 3.701089, 1, 0, 0.5686275, 1,
1.310556, -1.288789, 1.504993, 1, 0, 0.5647059, 1,
1.312873, 0.7599711, 1.838232, 1, 0, 0.5568628, 1,
1.313239, -0.9084983, 1.960097, 1, 0, 0.5529412, 1,
1.316846, -0.3039805, 2.804163, 1, 0, 0.5450981, 1,
1.317259, 1.254178, 2.112348, 1, 0, 0.5411765, 1,
1.320467, 0.1612803, 2.088537, 1, 0, 0.5333334, 1,
1.321207, 0.4085829, 0.7846448, 1, 0, 0.5294118, 1,
1.32246, -1.052262, 1.479865, 1, 0, 0.5215687, 1,
1.326936, 1.449271, 1.034843, 1, 0, 0.5176471, 1,
1.32702, -0.3463158, 2.85957, 1, 0, 0.509804, 1,
1.327092, 2.974867, 2.066447, 1, 0, 0.5058824, 1,
1.330502, 0.570524, 3.518064, 1, 0, 0.4980392, 1,
1.331253, 1.463604, 0.4250756, 1, 0, 0.4901961, 1,
1.33566, 1.225595, 0.1274981, 1, 0, 0.4862745, 1,
1.340203, 0.2756361, 2.374033, 1, 0, 0.4784314, 1,
1.345824, 0.3572044, 2.714315, 1, 0, 0.4745098, 1,
1.346564, -0.3253979, -0.2966426, 1, 0, 0.4666667, 1,
1.34798, -0.04763754, 1.231368, 1, 0, 0.4627451, 1,
1.357686, 1.498109, -0.1678672, 1, 0, 0.454902, 1,
1.361007, -0.3944241, 0.6651512, 1, 0, 0.4509804, 1,
1.368268, 0.9318369, 0.1560598, 1, 0, 0.4431373, 1,
1.379654, -0.5228965, 3.183539, 1, 0, 0.4392157, 1,
1.401561, -0.899698, 2.830064, 1, 0, 0.4313726, 1,
1.409482, -0.8889837, 3.129879, 1, 0, 0.427451, 1,
1.419148, -0.1153109, 0.2092962, 1, 0, 0.4196078, 1,
1.427432, -1.228673, 1.213601, 1, 0, 0.4156863, 1,
1.433262, 0.2444233, 1.139315, 1, 0, 0.4078431, 1,
1.453742, 0.1761325, 0.8467308, 1, 0, 0.4039216, 1,
1.462881, -0.7408776, 0.7260857, 1, 0, 0.3960784, 1,
1.467555, 0.1244551, 1.601162, 1, 0, 0.3882353, 1,
1.47292, 1.303394, 1.382899, 1, 0, 0.3843137, 1,
1.475586, 0.3497055, 2.995062, 1, 0, 0.3764706, 1,
1.485167, 0.3464545, 3.284068, 1, 0, 0.372549, 1,
1.487006, 1.017922, 1.905647, 1, 0, 0.3647059, 1,
1.487965, -0.390734, 2.53268, 1, 0, 0.3607843, 1,
1.503443, 0.3401069, 1.819629, 1, 0, 0.3529412, 1,
1.509116, 2.001541, -0.5186178, 1, 0, 0.3490196, 1,
1.511624, 1.782324, 1.189597, 1, 0, 0.3411765, 1,
1.513007, -0.71621, 1.566509, 1, 0, 0.3372549, 1,
1.524886, -1.6451, 4.03113, 1, 0, 0.3294118, 1,
1.531045, -1.269358, 0.761941, 1, 0, 0.3254902, 1,
1.533593, 2.410362, 0.5724551, 1, 0, 0.3176471, 1,
1.547772, -0.5215726, 1.547079, 1, 0, 0.3137255, 1,
1.561639, 1.760327, -0.2902009, 1, 0, 0.3058824, 1,
1.562437, 0.9964311, 1.890926, 1, 0, 0.2980392, 1,
1.572643, 0.7793468, 1.032352, 1, 0, 0.2941177, 1,
1.582249, 1.153407, 1.842178, 1, 0, 0.2862745, 1,
1.596146, -2.394468, 3.324867, 1, 0, 0.282353, 1,
1.598175, -0.3596023, 0.8985474, 1, 0, 0.2745098, 1,
1.599748, 1.083399, 0.004480151, 1, 0, 0.2705882, 1,
1.609309, -1.24496, 3.092654, 1, 0, 0.2627451, 1,
1.620352, 1.153205, 0.1601227, 1, 0, 0.2588235, 1,
1.625426, 0.4013211, 1.226168, 1, 0, 0.2509804, 1,
1.630626, -0.5802367, 1.612741, 1, 0, 0.2470588, 1,
1.634253, 1.410199, -1.32599, 1, 0, 0.2392157, 1,
1.647685, 0.6020356, 1.361902, 1, 0, 0.2352941, 1,
1.700252, -0.5311375, 3.091888, 1, 0, 0.227451, 1,
1.705162, -0.8382168, 1.264544, 1, 0, 0.2235294, 1,
1.712584, 0.07166252, 1.601007, 1, 0, 0.2156863, 1,
1.723079, -0.0862377, 1.90952, 1, 0, 0.2117647, 1,
1.768366, -0.2827697, 2.07596, 1, 0, 0.2039216, 1,
1.774658, 2.003545, 1.298123, 1, 0, 0.1960784, 1,
1.782591, 0.2024644, -0.8844342, 1, 0, 0.1921569, 1,
1.81254, -0.2696737, 1.220246, 1, 0, 0.1843137, 1,
1.814672, 1.04516, 0.1623593, 1, 0, 0.1803922, 1,
1.82764, 0.7330785, 0.7295598, 1, 0, 0.172549, 1,
1.851505, 0.7300435, 1.276505, 1, 0, 0.1686275, 1,
1.866291, -1.922549, 1.805063, 1, 0, 0.1607843, 1,
1.873946, -0.3712404, 1.764988, 1, 0, 0.1568628, 1,
1.975685, 1.005246, 0.5683168, 1, 0, 0.1490196, 1,
1.988869, 0.5974095, 1.634611, 1, 0, 0.145098, 1,
2.020043, 0.5572813, 1.367835, 1, 0, 0.1372549, 1,
2.050937, 0.2258184, 1.958432, 1, 0, 0.1333333, 1,
2.078594, -1.518263, 3.687505, 1, 0, 0.1254902, 1,
2.092174, -0.7668309, 1.355066, 1, 0, 0.1215686, 1,
2.129489, 1.219858, 1.59037, 1, 0, 0.1137255, 1,
2.142755, 0.5226917, 4.364972, 1, 0, 0.1098039, 1,
2.143353, 1.17517, 2.375096, 1, 0, 0.1019608, 1,
2.145243, 0.02486597, 1.388029, 1, 0, 0.09411765, 1,
2.170337, -0.4547687, 1.672149, 1, 0, 0.09019608, 1,
2.219467, 0.5163532, -0.1199039, 1, 0, 0.08235294, 1,
2.258678, 0.5268899, 1.466351, 1, 0, 0.07843138, 1,
2.268149, 0.3779789, 1.591145, 1, 0, 0.07058824, 1,
2.291444, -3.216434, 3.540044, 1, 0, 0.06666667, 1,
2.473099, -0.2765731, -1.339227, 1, 0, 0.05882353, 1,
2.481, -0.8244923, 1.848267, 1, 0, 0.05490196, 1,
2.506345, 1.402382, 0.9681975, 1, 0, 0.04705882, 1,
2.543228, -0.4718162, 2.090096, 1, 0, 0.04313726, 1,
2.595677, -0.7026796, 0.6081197, 1, 0, 0.03529412, 1,
2.622356, -0.3548099, 0.7844422, 1, 0, 0.03137255, 1,
2.762384, -0.9923991, 3.270838, 1, 0, 0.02352941, 1,
3.013636, 0.5370123, 0.8705235, 1, 0, 0.01960784, 1,
3.365324, -0.2741522, -0.2988321, 1, 0, 0.01176471, 1,
3.439348, -1.040315, 1.989123, 1, 0, 0.007843138, 1
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
0.2940238, -4.338826, -6.604478, 0, -0.5, 0.5, 0.5,
0.2940238, -4.338826, -6.604478, 1, -0.5, 0.5, 0.5,
0.2940238, -4.338826, -6.604478, 1, 1.5, 0.5, 0.5,
0.2940238, -4.338826, -6.604478, 0, 1.5, 0.5, 0.5
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
-3.917566, 0.09445858, -6.604478, 0, -0.5, 0.5, 0.5,
-3.917566, 0.09445858, -6.604478, 1, -0.5, 0.5, 0.5,
-3.917566, 0.09445858, -6.604478, 1, 1.5, 0.5, 0.5,
-3.917566, 0.09445858, -6.604478, 0, 1.5, 0.5, 0.5
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
-3.917566, -4.338826, 0.5529325, 0, -0.5, 0.5, 0.5,
-3.917566, -4.338826, 0.5529325, 1, -0.5, 0.5, 0.5,
-3.917566, -4.338826, 0.5529325, 1, 1.5, 0.5, 0.5,
-3.917566, -4.338826, 0.5529325, 0, 1.5, 0.5, 0.5
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
-2, -3.31576, -4.952768,
3, -3.31576, -4.952768,
-2, -3.31576, -4.952768,
-2, -3.486271, -5.228053,
-1, -3.31576, -4.952768,
-1, -3.486271, -5.228053,
0, -3.31576, -4.952768,
0, -3.486271, -5.228053,
1, -3.31576, -4.952768,
1, -3.486271, -5.228053,
2, -3.31576, -4.952768,
2, -3.486271, -5.228053,
3, -3.31576, -4.952768,
3, -3.486271, -5.228053
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
-2, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
-2, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
-2, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
-2, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5,
-1, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
-1, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
-1, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
-1, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5,
0, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
0, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
0, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
0, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5,
1, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
1, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
1, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
1, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5,
2, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
2, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
2, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
2, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5,
3, -3.827293, -5.778623, 0, -0.5, 0.5, 0.5,
3, -3.827293, -5.778623, 1, -0.5, 0.5, 0.5,
3, -3.827293, -5.778623, 1, 1.5, 0.5, 0.5,
3, -3.827293, -5.778623, 0, 1.5, 0.5, 0.5
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
-2.94566, -3, -4.952768,
-2.94566, 3, -4.952768,
-2.94566, -3, -4.952768,
-3.107645, -3, -5.228053,
-2.94566, -2, -4.952768,
-3.107645, -2, -5.228053,
-2.94566, -1, -4.952768,
-3.107645, -1, -5.228053,
-2.94566, 0, -4.952768,
-3.107645, 0, -5.228053,
-2.94566, 1, -4.952768,
-3.107645, 1, -5.228053,
-2.94566, 2, -4.952768,
-3.107645, 2, -5.228053,
-2.94566, 3, -4.952768,
-3.107645, 3, -5.228053
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
-3.431613, -3, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, -3, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, -3, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, -3, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, -2, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, -2, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, -2, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, -2, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, -1, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, -1, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, -1, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, -1, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, 0, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, 0, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, 0, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, 0, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, 1, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, 1, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, 1, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, 1, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, 2, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, 2, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, 2, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, 2, -5.778623, 0, 1.5, 0.5, 0.5,
-3.431613, 3, -5.778623, 0, -0.5, 0.5, 0.5,
-3.431613, 3, -5.778623, 1, -0.5, 0.5, 0.5,
-3.431613, 3, -5.778623, 1, 1.5, 0.5, 0.5,
-3.431613, 3, -5.778623, 0, 1.5, 0.5, 0.5
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
-2.94566, -3.31576, -4,
-2.94566, -3.31576, 4,
-2.94566, -3.31576, -4,
-3.107645, -3.486271, -4,
-2.94566, -3.31576, -2,
-3.107645, -3.486271, -2,
-2.94566, -3.31576, 0,
-3.107645, -3.486271, 0,
-2.94566, -3.31576, 2,
-3.107645, -3.486271, 2,
-2.94566, -3.31576, 4,
-3.107645, -3.486271, 4
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
-3.431613, -3.827293, -4, 0, -0.5, 0.5, 0.5,
-3.431613, -3.827293, -4, 1, -0.5, 0.5, 0.5,
-3.431613, -3.827293, -4, 1, 1.5, 0.5, 0.5,
-3.431613, -3.827293, -4, 0, 1.5, 0.5, 0.5,
-3.431613, -3.827293, -2, 0, -0.5, 0.5, 0.5,
-3.431613, -3.827293, -2, 1, -0.5, 0.5, 0.5,
-3.431613, -3.827293, -2, 1, 1.5, 0.5, 0.5,
-3.431613, -3.827293, -2, 0, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 0, 0, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 0, 1, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 0, 1, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 0, 0, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 2, 0, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 2, 1, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 2, 1, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 2, 0, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 4, 0, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 4, 1, -0.5, 0.5, 0.5,
-3.431613, -3.827293, 4, 1, 1.5, 0.5, 0.5,
-3.431613, -3.827293, 4, 0, 1.5, 0.5, 0.5
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
-2.94566, -3.31576, -4.952768,
-2.94566, 3.504678, -4.952768,
-2.94566, -3.31576, 6.058633,
-2.94566, 3.504678, 6.058633,
-2.94566, -3.31576, -4.952768,
-2.94566, -3.31576, 6.058633,
-2.94566, 3.504678, -4.952768,
-2.94566, 3.504678, 6.058633,
-2.94566, -3.31576, -4.952768,
3.533708, -3.31576, -4.952768,
-2.94566, -3.31576, 6.058633,
3.533708, -3.31576, 6.058633,
-2.94566, 3.504678, -4.952768,
3.533708, 3.504678, -4.952768,
-2.94566, 3.504678, 6.058633,
3.533708, 3.504678, 6.058633,
3.533708, -3.31576, -4.952768,
3.533708, 3.504678, -4.952768,
3.533708, -3.31576, 6.058633,
3.533708, 3.504678, 6.058633,
3.533708, -3.31576, -4.952768,
3.533708, -3.31576, 6.058633,
3.533708, 3.504678, -4.952768,
3.533708, 3.504678, 6.058633
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
var radius = 7.733535;
var distance = 34.40737;
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
mvMatrix.translate( -0.2940238, -0.09445858, -0.5529325 );
mvMatrix.scale( 1.290504, 1.22597, 0.7593629 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40737);
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
pebulate<-read.table("pebulate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pebulate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pebulate' not found
```

```r
y<-pebulate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pebulate' not found
```

```r
z<-pebulate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pebulate' not found
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
-2.851301, -2.327929, -0.286006, 0, 0, 1, 1, 1,
-2.731849, -0.2571621, -0.5549771, 1, 0, 0, 1, 1,
-2.658246, -2.245529, -1.402969, 1, 0, 0, 1, 1,
-2.646397, 0.6085578, -1.884604, 1, 0, 0, 1, 1,
-2.642513, -1.749993, -1.64479, 1, 0, 0, 1, 1,
-2.633921, 0.6488912, -1.986633, 1, 0, 0, 1, 1,
-2.596303, -0.8235167, -0.9653456, 0, 0, 0, 1, 1,
-2.4094, 0.09406716, -2.053783, 0, 0, 0, 1, 1,
-2.362752, -2.790977, -1.776775, 0, 0, 0, 1, 1,
-2.314157, -0.4943213, -0.7211085, 0, 0, 0, 1, 1,
-2.243521, 0.7541544, -1.543417, 0, 0, 0, 1, 1,
-2.190667, 0.8353993, -0.4496293, 0, 0, 0, 1, 1,
-2.146577, 0.1134446, -1.823885, 0, 0, 0, 1, 1,
-2.14103, -1.365524, -2.279007, 1, 1, 1, 1, 1,
-2.12231, -1.469486, -0.9519532, 1, 1, 1, 1, 1,
-2.114559, -0.6423957, -0.8299381, 1, 1, 1, 1, 1,
-2.108125, 0.1803827, -2.114861, 1, 1, 1, 1, 1,
-2.106825, -0.5436243, -2.837156, 1, 1, 1, 1, 1,
-2.081087, 0.2309288, 0.002116411, 1, 1, 1, 1, 1,
-2.061148, -0.3735201, -2.352665, 1, 1, 1, 1, 1,
-2.051066, 0.2207844, -0.8614557, 1, 1, 1, 1, 1,
-2.049698, -0.2769971, 0.1589661, 1, 1, 1, 1, 1,
-2.042223, -0.1170178, -0.4452212, 1, 1, 1, 1, 1,
-2.036603, 1.688454, -2.0735, 1, 1, 1, 1, 1,
-2.013206, -0.4640534, -1.804824, 1, 1, 1, 1, 1,
-1.98422, -0.1978225, -2.011741, 1, 1, 1, 1, 1,
-1.946014, -0.9586916, -2.587862, 1, 1, 1, 1, 1,
-1.919754, -0.9683191, -1.139481, 1, 1, 1, 1, 1,
-1.918593, -1.231109, -1.146166, 0, 0, 1, 1, 1,
-1.911149, -0.2480919, -1.514096, 1, 0, 0, 1, 1,
-1.893259, 1.530433, -0.9595862, 1, 0, 0, 1, 1,
-1.885537, -2.183531, -1.969112, 1, 0, 0, 1, 1,
-1.871056, 1.349177, 0.4343005, 1, 0, 0, 1, 1,
-1.866926, 0.253261, -2.683574, 1, 0, 0, 1, 1,
-1.842843, 1.036294, 0.3712617, 0, 0, 0, 1, 1,
-1.834315, 0.865159, -1.850065, 0, 0, 0, 1, 1,
-1.811903, 0.1192059, -0.6079801, 0, 0, 0, 1, 1,
-1.80834, -0.4906427, -2.031761, 0, 0, 0, 1, 1,
-1.807255, -1.351781, -2.813974, 0, 0, 0, 1, 1,
-1.783889, -1.361782, -1.750478, 0, 0, 0, 1, 1,
-1.771781, 0.9024678, -0.5923845, 0, 0, 0, 1, 1,
-1.77154, -0.6213804, -1.632718, 1, 1, 1, 1, 1,
-1.768528, -1.51316, -2.505109, 1, 1, 1, 1, 1,
-1.757287, 0.1203215, -0.592124, 1, 1, 1, 1, 1,
-1.736342, -0.7791678, -1.578999, 1, 1, 1, 1, 1,
-1.734166, 1.685902, -0.9868412, 1, 1, 1, 1, 1,
-1.730413, 0.2325975, -1.350011, 1, 1, 1, 1, 1,
-1.727083, -0.7213426, -1.765725, 1, 1, 1, 1, 1,
-1.726257, 0.5952904, -1.482149, 1, 1, 1, 1, 1,
-1.710193, -0.7416524, -1.092435, 1, 1, 1, 1, 1,
-1.700569, 1.019476, -0.7303723, 1, 1, 1, 1, 1,
-1.684246, -0.6614763, -0.5582691, 1, 1, 1, 1, 1,
-1.67332, 0.2161112, -0.8681664, 1, 1, 1, 1, 1,
-1.66736, 0.6416984, -2.593132, 1, 1, 1, 1, 1,
-1.657032, 0.2592122, -2.42619, 1, 1, 1, 1, 1,
-1.64901, -0.04035063, -0.8199732, 1, 1, 1, 1, 1,
-1.63339, 0.6151416, 0.4281308, 0, 0, 1, 1, 1,
-1.63132, -0.9548869, -2.966945, 1, 0, 0, 1, 1,
-1.626887, 0.541955, -0.7232825, 1, 0, 0, 1, 1,
-1.619017, 0.7743509, -1.340696, 1, 0, 0, 1, 1,
-1.612093, 0.1208694, -2.617661, 1, 0, 0, 1, 1,
-1.587097, -0.8605746, -0.7817467, 1, 0, 0, 1, 1,
-1.58178, 0.5827252, -3.058462, 0, 0, 0, 1, 1,
-1.57864, 1.273086, 1.358506, 0, 0, 0, 1, 1,
-1.576917, -0.932354, -1.718607, 0, 0, 0, 1, 1,
-1.573975, -1.419867, -3.560236, 0, 0, 0, 1, 1,
-1.56932, -1.770496, -2.941043, 0, 0, 0, 1, 1,
-1.558193, -0.4476044, -1.236857, 0, 0, 0, 1, 1,
-1.55521, 0.1694233, -1.045741, 0, 0, 0, 1, 1,
-1.537388, 0.09569138, -2.303868, 1, 1, 1, 1, 1,
-1.532042, 0.4812087, -2.989386, 1, 1, 1, 1, 1,
-1.529678, -1.286227, -2.160966, 1, 1, 1, 1, 1,
-1.525501, 0.1142738, -0.3843801, 1, 1, 1, 1, 1,
-1.524243, 1.619494, -1.614008, 1, 1, 1, 1, 1,
-1.524157, 0.01104184, -1.136441, 1, 1, 1, 1, 1,
-1.5226, -0.883442, -1.442084, 1, 1, 1, 1, 1,
-1.519435, -0.3738717, -0.5188066, 1, 1, 1, 1, 1,
-1.513276, 0.133703, -1.385678, 1, 1, 1, 1, 1,
-1.489049, -0.0521639, 0.02737285, 1, 1, 1, 1, 1,
-1.483527, 1.052337, 0.4026803, 1, 1, 1, 1, 1,
-1.468627, 0.42567, -2.765191, 1, 1, 1, 1, 1,
-1.452188, 0.2609241, -2.498197, 1, 1, 1, 1, 1,
-1.436275, -0.5855849, -1.008921, 1, 1, 1, 1, 1,
-1.432945, 1.330925, -0.2610345, 1, 1, 1, 1, 1,
-1.424142, 0.3091027, -2.243872, 0, 0, 1, 1, 1,
-1.423216, -0.7504614, -4.602325, 1, 0, 0, 1, 1,
-1.421978, 1.676337, -0.353143, 1, 0, 0, 1, 1,
-1.406763, -1.463904, -2.533558, 1, 0, 0, 1, 1,
-1.400426, -0.5903106, -1.090955, 1, 0, 0, 1, 1,
-1.399494, 1.806825, -2.256966, 1, 0, 0, 1, 1,
-1.398602, -0.1463728, -2.317034, 0, 0, 0, 1, 1,
-1.388095, -0.5004536, -3.394674, 0, 0, 0, 1, 1,
-1.381388, -1.784259, -3.647134, 0, 0, 0, 1, 1,
-1.355058, -0.717823, -1.8741, 0, 0, 0, 1, 1,
-1.350916, -2.407469, -2.775397, 0, 0, 0, 1, 1,
-1.337033, 0.3568037, -0.2968856, 0, 0, 0, 1, 1,
-1.327441, -0.1522347, 0.7644907, 0, 0, 0, 1, 1,
-1.325701, 0.6884609, 0.5516368, 1, 1, 1, 1, 1,
-1.324822, 0.635855, -1.675066, 1, 1, 1, 1, 1,
-1.318284, -2.047766, -1.845465, 1, 1, 1, 1, 1,
-1.316704, 0.05573867, -0.5055094, 1, 1, 1, 1, 1,
-1.302353, -0.668676, -1.794477, 1, 1, 1, 1, 1,
-1.290585, 1.310263, -0.2717513, 1, 1, 1, 1, 1,
-1.290126, -0.3123148, -1.413038, 1, 1, 1, 1, 1,
-1.283428, 3.150018, 0.7565782, 1, 1, 1, 1, 1,
-1.270197, -0.9316983, -1.258416, 1, 1, 1, 1, 1,
-1.269346, -1.691625, -1.452466, 1, 1, 1, 1, 1,
-1.262656, 0.7948354, -0.6389341, 1, 1, 1, 1, 1,
-1.257872, -0.06258539, -2.031159, 1, 1, 1, 1, 1,
-1.25175, -0.506788, -2.742049, 1, 1, 1, 1, 1,
-1.247691, 0.5905514, -1.854071, 1, 1, 1, 1, 1,
-1.247193, 0.2659509, -2.177515, 1, 1, 1, 1, 1,
-1.241647, 0.09948646, -2.11254, 0, 0, 1, 1, 1,
-1.236551, 0.9584562, 0.422068, 1, 0, 0, 1, 1,
-1.23238, -0.5370587, -0.5936199, 1, 0, 0, 1, 1,
-1.231165, 2.721563, 0.1708402, 1, 0, 0, 1, 1,
-1.230073, 0.5307888, -2.723186, 1, 0, 0, 1, 1,
-1.219179, 1.921075, -0.1665386, 1, 0, 0, 1, 1,
-1.212206, 1.3111, -1.195532, 0, 0, 0, 1, 1,
-1.204321, 1.479484, -1.21861, 0, 0, 0, 1, 1,
-1.197581, 0.489469, -1.91771, 0, 0, 0, 1, 1,
-1.180394, -0.6071431, -1.540056, 0, 0, 0, 1, 1,
-1.172432, 1.532795, -1.508292, 0, 0, 0, 1, 1,
-1.170312, -0.1023149, -1.649302, 0, 0, 0, 1, 1,
-1.166027, 1.135995, 0.9603804, 0, 0, 0, 1, 1,
-1.16221, -0.4738756, -4.077026, 1, 1, 1, 1, 1,
-1.140657, -0.03975308, -3.144918, 1, 1, 1, 1, 1,
-1.139269, 0.4478701, -2.797234, 1, 1, 1, 1, 1,
-1.135753, -0.9431456, -0.1032081, 1, 1, 1, 1, 1,
-1.130774, -1.626722, -2.355659, 1, 1, 1, 1, 1,
-1.127975, -0.07793047, -0.4509252, 1, 1, 1, 1, 1,
-1.126778, 0.523292, -1.50812, 1, 1, 1, 1, 1,
-1.124596, -1.808756, -3.302092, 1, 1, 1, 1, 1,
-1.124392, -0.8631284, -3.174958, 1, 1, 1, 1, 1,
-1.124178, 0.8718583, -0.6132444, 1, 1, 1, 1, 1,
-1.12163, -0.3549492, -1.043049, 1, 1, 1, 1, 1,
-1.121225, -0.6519809, -2.839355, 1, 1, 1, 1, 1,
-1.118019, -1.398788, -3.223312, 1, 1, 1, 1, 1,
-1.10849, 0.8522435, -3.262287, 1, 1, 1, 1, 1,
-1.107698, 0.9516425, -1.310942, 1, 1, 1, 1, 1,
-1.100494, 1.379516, -0.2670836, 0, 0, 1, 1, 1,
-1.097218, 0.5691262, -1.038307, 1, 0, 0, 1, 1,
-1.091604, 1.357961, -0.5195757, 1, 0, 0, 1, 1,
-1.090861, -0.05733479, -0.522846, 1, 0, 0, 1, 1,
-1.084829, 1.541802, -1.787866, 1, 0, 0, 1, 1,
-1.071904, -2.131279, -1.99854, 1, 0, 0, 1, 1,
-1.070061, -0.4226382, 0.4545153, 0, 0, 0, 1, 1,
-1.061868, -1.042974, -1.170007, 0, 0, 0, 1, 1,
-1.058546, 0.06686115, 0.06229692, 0, 0, 0, 1, 1,
-1.050889, -0.9075121, -1.08187, 0, 0, 0, 1, 1,
-1.049352, 0.3280604, -0.5945935, 0, 0, 0, 1, 1,
-1.045049, 0.7851877, 0.7517348, 0, 0, 0, 1, 1,
-1.044275, 0.7488061, 0.164349, 0, 0, 0, 1, 1,
-1.040434, 1.229169, -0.475186, 1, 1, 1, 1, 1,
-1.034051, -1.286118, -3.932414, 1, 1, 1, 1, 1,
-1.015619, -0.9336838, -1.407234, 1, 1, 1, 1, 1,
-1.000356, -1.30465, -1.705002, 1, 1, 1, 1, 1,
-0.997803, -1.496074, -2.100224, 1, 1, 1, 1, 1,
-0.9961228, 0.3806526, -0.43148, 1, 1, 1, 1, 1,
-0.9927286, 0.8849566, -0.7068707, 1, 1, 1, 1, 1,
-0.9926452, 1.245205, -0.2417592, 1, 1, 1, 1, 1,
-0.9842116, 0.4594612, -1.410335, 1, 1, 1, 1, 1,
-0.9833754, 0.2178223, -1.582987, 1, 1, 1, 1, 1,
-0.9816351, -0.1899114, -0.9601529, 1, 1, 1, 1, 1,
-0.9662023, 0.08215062, -1.611968, 1, 1, 1, 1, 1,
-0.9624341, 0.4153148, -1.45775, 1, 1, 1, 1, 1,
-0.958269, -1.249276, -2.170324, 1, 1, 1, 1, 1,
-0.9513969, 0.06685388, -3.447891, 1, 1, 1, 1, 1,
-0.9444561, -2.564287, -2.191064, 0, 0, 1, 1, 1,
-0.9427236, -1.204495, -2.639208, 1, 0, 0, 1, 1,
-0.9382637, -0.9454764, -2.46689, 1, 0, 0, 1, 1,
-0.9317328, -0.1753287, -3.687396, 1, 0, 0, 1, 1,
-0.9302469, 1.454353, 0.2992872, 1, 0, 0, 1, 1,
-0.9253379, 2.030171, -0.6335266, 1, 0, 0, 1, 1,
-0.9176769, 0.4256932, -2.117822, 0, 0, 0, 1, 1,
-0.9075342, 1.156948, -1.25903, 0, 0, 0, 1, 1,
-0.8996737, -0.08722048, -0.8592169, 0, 0, 0, 1, 1,
-0.8951022, 0.6514032, -4.279531, 0, 0, 0, 1, 1,
-0.8679137, 1.543581, -0.6030222, 0, 0, 0, 1, 1,
-0.8667983, -0.8694435, -3.068163, 0, 0, 0, 1, 1,
-0.8654065, 0.8582147, -0.8313372, 0, 0, 0, 1, 1,
-0.8610276, 0.4690031, -0.2326667, 1, 1, 1, 1, 1,
-0.8566587, -0.6748747, -2.056858, 1, 1, 1, 1, 1,
-0.8562136, 0.4371002, 0.6666917, 1, 1, 1, 1, 1,
-0.8528183, -0.3577887, -1.75569, 1, 1, 1, 1, 1,
-0.8521317, 0.1113543, -1.970058, 1, 1, 1, 1, 1,
-0.8476713, 1.368562, -1.104437, 1, 1, 1, 1, 1,
-0.8474766, 0.7926204, -0.6827206, 1, 1, 1, 1, 1,
-0.8384606, 0.8937595, -1.702133, 1, 1, 1, 1, 1,
-0.836532, 0.7026749, -1.500621, 1, 1, 1, 1, 1,
-0.8304824, -1.381357, -2.388469, 1, 1, 1, 1, 1,
-0.8288873, -0.9366947, -1.177128, 1, 1, 1, 1, 1,
-0.8287566, -2.945477, -3.668049, 1, 1, 1, 1, 1,
-0.8245047, -0.5792141, -1.448348, 1, 1, 1, 1, 1,
-0.8183542, 0.3263351, -0.1618191, 1, 1, 1, 1, 1,
-0.808872, 0.01693901, -2.690559, 1, 1, 1, 1, 1,
-0.8046427, -1.585694, -2.286053, 0, 0, 1, 1, 1,
-0.7990918, 0.5580864, -1.112598, 1, 0, 0, 1, 1,
-0.7963419, 0.3556162, -1.702799, 1, 0, 0, 1, 1,
-0.7956402, -0.8701141, -3.150834, 1, 0, 0, 1, 1,
-0.7911856, 1.101109, -0.3377619, 1, 0, 0, 1, 1,
-0.7830332, -0.5281744, -2.209726, 1, 0, 0, 1, 1,
-0.7769334, -0.07492734, -1.826073, 0, 0, 0, 1, 1,
-0.7765391, 0.3964586, -0.03881896, 0, 0, 0, 1, 1,
-0.7748897, 1.383673, -0.9269696, 0, 0, 0, 1, 1,
-0.7731278, -1.143773, -2.717845, 0, 0, 0, 1, 1,
-0.7723356, -0.1400416, -1.475867, 0, 0, 0, 1, 1,
-0.7663273, 0.3206606, -2.064754, 0, 0, 0, 1, 1,
-0.7631018, -0.01223393, -2.228073, 0, 0, 0, 1, 1,
-0.7620656, -1.040575, -2.597483, 1, 1, 1, 1, 1,
-0.7590435, 0.1230543, -3.108535, 1, 1, 1, 1, 1,
-0.7547944, -0.9055592, -2.780903, 1, 1, 1, 1, 1,
-0.7535551, -0.8773661, -3.528788, 1, 1, 1, 1, 1,
-0.7502749, -0.7418275, -4.026199, 1, 1, 1, 1, 1,
-0.7471707, -1.311858, -1.962319, 1, 1, 1, 1, 1,
-0.743691, 0.4551522, -2.260166, 1, 1, 1, 1, 1,
-0.7413822, -1.482123, -1.927275, 1, 1, 1, 1, 1,
-0.74122, -0.7058222, -1.706674, 1, 1, 1, 1, 1,
-0.7349585, -0.4896873, -2.174417, 1, 1, 1, 1, 1,
-0.7346891, -2.036344, -3.665947, 1, 1, 1, 1, 1,
-0.7299163, -0.317539, -1.92858, 1, 1, 1, 1, 1,
-0.7283162, 0.1814255, -1.564574, 1, 1, 1, 1, 1,
-0.7273864, 0.8475682, -1.709821, 1, 1, 1, 1, 1,
-0.7267674, -1.288709, -2.876095, 1, 1, 1, 1, 1,
-0.7251944, -0.1114085, -1.500546, 0, 0, 1, 1, 1,
-0.7234504, 0.4103539, -0.4071302, 1, 0, 0, 1, 1,
-0.7198179, 0.3783788, -1.597465, 1, 0, 0, 1, 1,
-0.7186792, -2.32137, -2.977717, 1, 0, 0, 1, 1,
-0.7162149, -0.1799583, -4.771457, 1, 0, 0, 1, 1,
-0.7158861, 1.525581, -1.428589, 1, 0, 0, 1, 1,
-0.7094571, -0.08562671, -1.574834, 0, 0, 0, 1, 1,
-0.7036372, 0.9692467, -1.871834, 0, 0, 0, 1, 1,
-0.7032291, 0.4128045, -0.8203029, 0, 0, 0, 1, 1,
-0.7026199, 1.143445, -1.614915, 0, 0, 0, 1, 1,
-0.697724, 0.3341101, -1.508916, 0, 0, 0, 1, 1,
-0.6977213, -1.130524, -3.281026, 0, 0, 0, 1, 1,
-0.6967565, -0.6115314, -4.235691, 0, 0, 0, 1, 1,
-0.69514, 0.8456999, -0.5029241, 1, 1, 1, 1, 1,
-0.6933066, 1.188417, -1.234215, 1, 1, 1, 1, 1,
-0.6932125, -1.105135, -1.529554, 1, 1, 1, 1, 1,
-0.6920977, -0.8650254, -1.809702, 1, 1, 1, 1, 1,
-0.6920652, 0.6925739, -1.452304, 1, 1, 1, 1, 1,
-0.6897816, 0.9407687, -0.5833446, 1, 1, 1, 1, 1,
-0.6893254, 0.6727283, -2.331456, 1, 1, 1, 1, 1,
-0.6872767, -0.03980259, -2.638218, 1, 1, 1, 1, 1,
-0.6870587, 0.07764494, -2.854924, 1, 1, 1, 1, 1,
-0.6860237, -0.5546094, -1.901674, 1, 1, 1, 1, 1,
-0.6846985, 2.580398, 0.1078907, 1, 1, 1, 1, 1,
-0.667585, 0.5596266, -1.057488, 1, 1, 1, 1, 1,
-0.6620849, 0.7731056, -2.160559, 1, 1, 1, 1, 1,
-0.65847, 1.604768, -1.363573, 1, 1, 1, 1, 1,
-0.6567008, -1.193501, -2.431452, 1, 1, 1, 1, 1,
-0.652454, -1.017377, -1.972327, 0, 0, 1, 1, 1,
-0.6510437, 0.0320024, -1.894295, 1, 0, 0, 1, 1,
-0.6479983, 0.7831563, -0.4339864, 1, 0, 0, 1, 1,
-0.6295736, 1.51089, -0.6363341, 1, 0, 0, 1, 1,
-0.6285464, -0.2229474, -0.2731047, 1, 0, 0, 1, 1,
-0.627836, -0.6602225, -3.865765, 1, 0, 0, 1, 1,
-0.6275285, -0.3992648, -1.799351, 0, 0, 0, 1, 1,
-0.6240989, 0.3866524, -1.849048, 0, 0, 0, 1, 1,
-0.623441, 0.02362857, -2.805932, 0, 0, 0, 1, 1,
-0.6206303, 1.063407, -1.645101, 0, 0, 0, 1, 1,
-0.6194268, 0.5697841, -0.6539176, 0, 0, 0, 1, 1,
-0.6190978, -0.4034784, -0.2345871, 0, 0, 0, 1, 1,
-0.6186383, 0.582947, -1.3479, 0, 0, 0, 1, 1,
-0.6133305, -0.5364721, -2.714001, 1, 1, 1, 1, 1,
-0.6127026, -1.65106, 0.2002609, 1, 1, 1, 1, 1,
-0.608876, -1.113045, -2.241902, 1, 1, 1, 1, 1,
-0.6054654, 0.1006734, -1.760342, 1, 1, 1, 1, 1,
-0.604776, -0.5055401, -0.2554472, 1, 1, 1, 1, 1,
-0.6016356, -1.365435, -1.531621, 1, 1, 1, 1, 1,
-0.6008803, 1.174285, -1.445345, 1, 1, 1, 1, 1,
-0.5993659, 0.2926358, 0.4601158, 1, 1, 1, 1, 1,
-0.5992126, 0.3213652, -1.202897, 1, 1, 1, 1, 1,
-0.5927144, 0.05919794, -1.810759, 1, 1, 1, 1, 1,
-0.591844, 0.56247, -2.625578, 1, 1, 1, 1, 1,
-0.5865896, 0.1042577, -2.698778, 1, 1, 1, 1, 1,
-0.5830928, 0.01116793, -2.158822, 1, 1, 1, 1, 1,
-0.5801808, 0.1140863, -1.119371, 1, 1, 1, 1, 1,
-0.5728912, 1.919143, -0.01947875, 1, 1, 1, 1, 1,
-0.5700925, 1.787221, -1.5199, 0, 0, 1, 1, 1,
-0.5671153, 1.337973, -0.01147012, 1, 0, 0, 1, 1,
-0.5654777, -0.2872974, -2.665078, 1, 0, 0, 1, 1,
-0.5619523, 0.5413828, -0.9720052, 1, 0, 0, 1, 1,
-0.561174, -0.291298, -1.100664, 1, 0, 0, 1, 1,
-0.5570131, 0.8726079, 1.121713, 1, 0, 0, 1, 1,
-0.5562587, 0.348298, -1.028132, 0, 0, 0, 1, 1,
-0.5550331, -1.490928, -2.535866, 0, 0, 0, 1, 1,
-0.5520328, -0.7548563, -2.259021, 0, 0, 0, 1, 1,
-0.5514119, 0.4632995, 0.368571, 0, 0, 0, 1, 1,
-0.5511464, 0.9603823, -0.9531095, 0, 0, 0, 1, 1,
-0.5459197, -1.672786, -1.728579, 0, 0, 0, 1, 1,
-0.5395705, -0.9338944, -3.188706, 0, 0, 0, 1, 1,
-0.5359921, 0.2061194, 0.4581225, 1, 1, 1, 1, 1,
-0.533597, 0.2719658, -2.921709, 1, 1, 1, 1, 1,
-0.5296132, -0.4930168, -2.148258, 1, 1, 1, 1, 1,
-0.529146, -0.04761884, 0.07875897, 1, 1, 1, 1, 1,
-0.5259707, -0.6354527, -3.027263, 1, 1, 1, 1, 1,
-0.5191717, -0.5015709, -2.918678, 1, 1, 1, 1, 1,
-0.5157688, -0.06823483, -0.6919931, 1, 1, 1, 1, 1,
-0.5125006, -0.8386781, -4.611371, 1, 1, 1, 1, 1,
-0.510981, -0.6244538, -3.279255, 1, 1, 1, 1, 1,
-0.5101488, 0.6672198, -0.8328704, 1, 1, 1, 1, 1,
-0.5094422, 0.1943107, -0.04488331, 1, 1, 1, 1, 1,
-0.503584, -0.354191, -0.5229626, 1, 1, 1, 1, 1,
-0.5023368, 1.879564, -0.4669594, 1, 1, 1, 1, 1,
-0.5019357, -0.1129997, -2.716285, 1, 1, 1, 1, 1,
-0.5002568, -0.747423, -2.482169, 1, 1, 1, 1, 1,
-0.4984084, -0.6250482, -3.724819, 0, 0, 1, 1, 1,
-0.4972758, 0.907574, -0.1807543, 1, 0, 0, 1, 1,
-0.4929748, -0.906996, -2.967964, 1, 0, 0, 1, 1,
-0.4899957, -1.733245, -1.203345, 1, 0, 0, 1, 1,
-0.4894009, 1.129029, -1.326463, 1, 0, 0, 1, 1,
-0.4872305, -0.4757057, -1.944393, 1, 0, 0, 1, 1,
-0.484165, 0.421405, -2.341176, 0, 0, 0, 1, 1,
-0.4822901, -1.444825, -3.048035, 0, 0, 0, 1, 1,
-0.4796396, 0.08049574, -0.9422447, 0, 0, 0, 1, 1,
-0.4791737, 0.7501701, -1.456978, 0, 0, 0, 1, 1,
-0.4785799, -1.536431, -2.030379, 0, 0, 0, 1, 1,
-0.4701262, -0.3096464, -0.8816764, 0, 0, 0, 1, 1,
-0.4693895, -0.9242957, -2.011568, 0, 0, 0, 1, 1,
-0.4674388, 0.8860558, -0.08831399, 1, 1, 1, 1, 1,
-0.4660069, -0.6222934, 1.573997, 1, 1, 1, 1, 1,
-0.4567901, -0.4557839, -2.127062, 1, 1, 1, 1, 1,
-0.4540837, -1.436996, -2.136025, 1, 1, 1, 1, 1,
-0.4481955, 0.9009708, 1.197598, 1, 1, 1, 1, 1,
-0.4479043, 1.325757, 1.016595, 1, 1, 1, 1, 1,
-0.4445913, -0.9996508, -1.6163, 1, 1, 1, 1, 1,
-0.4427695, -0.1738655, 0.5751456, 1, 1, 1, 1, 1,
-0.4367834, -0.9021355, -2.640058, 1, 1, 1, 1, 1,
-0.4346678, 1.451736, -2.379747, 1, 1, 1, 1, 1,
-0.4320242, -2.19664, -4.043766, 1, 1, 1, 1, 1,
-0.4250276, -0.85014, -2.145788, 1, 1, 1, 1, 1,
-0.4248821, 0.7651673, 0.05757622, 1, 1, 1, 1, 1,
-0.420903, -1.384365, -3.485721, 1, 1, 1, 1, 1,
-0.4185255, -0.8524896, -4.203532, 1, 1, 1, 1, 1,
-0.414137, -0.278409, -2.943507, 0, 0, 1, 1, 1,
-0.4134832, 0.9855891, -0.97526, 1, 0, 0, 1, 1,
-0.4079566, -0.06363767, -1.073643, 1, 0, 0, 1, 1,
-0.4023944, -2.001144, -4.792408, 1, 0, 0, 1, 1,
-0.3966918, -0.1910258, -0.08127324, 1, 0, 0, 1, 1,
-0.3955384, 0.7525235, -0.1137497, 1, 0, 0, 1, 1,
-0.3936679, -0.4731336, -1.790041, 0, 0, 0, 1, 1,
-0.3918802, 0.03644447, -1.446141, 0, 0, 0, 1, 1,
-0.3906928, 0.06392916, -0.6408633, 0, 0, 0, 1, 1,
-0.3873083, 1.413537, -1.208326, 0, 0, 0, 1, 1,
-0.3841791, -1.012339, -3.282633, 0, 0, 0, 1, 1,
-0.3815216, -0.05637919, -1.456963, 0, 0, 0, 1, 1,
-0.3772289, 1.429186, 0.2308308, 0, 0, 0, 1, 1,
-0.3765011, -1.131138, -4.047404, 1, 1, 1, 1, 1,
-0.3752061, 0.136587, -2.706954, 1, 1, 1, 1, 1,
-0.373537, 0.6353315, -1.112851, 1, 1, 1, 1, 1,
-0.3710318, -0.4049189, -1.093065, 1, 1, 1, 1, 1,
-0.3666732, -0.2170921, -2.513293, 1, 1, 1, 1, 1,
-0.3659233, -0.08300114, -2.775218, 1, 1, 1, 1, 1,
-0.3640258, 0.02061294, -1.311939, 1, 1, 1, 1, 1,
-0.3635442, -2.440102, -2.149571, 1, 1, 1, 1, 1,
-0.3616442, -0.08596873, -1.414265, 1, 1, 1, 1, 1,
-0.3521601, -1.283543, -3.902852, 1, 1, 1, 1, 1,
-0.3514958, -0.4476504, -1.010676, 1, 1, 1, 1, 1,
-0.3508594, 1.573596, -0.6614079, 1, 1, 1, 1, 1,
-0.3465834, -2.234567, -2.507158, 1, 1, 1, 1, 1,
-0.3407924, 0.5021809, -2.488963, 1, 1, 1, 1, 1,
-0.3404482, -2.596103, -2.503886, 1, 1, 1, 1, 1,
-0.3366573, 0.2143444, -1.508137, 0, 0, 1, 1, 1,
-0.3365098, 0.01259033, -1.9665, 1, 0, 0, 1, 1,
-0.3362895, -0.4716575, -2.725642, 1, 0, 0, 1, 1,
-0.3349748, 0.4923475, 1.378917, 1, 0, 0, 1, 1,
-0.3337534, -1.319543, -2.303781, 1, 0, 0, 1, 1,
-0.3255309, -0.1678344, -1.65185, 1, 0, 0, 1, 1,
-0.3252092, -1.341896, -3.802984, 0, 0, 0, 1, 1,
-0.324774, 0.2039122, -0.7235145, 0, 0, 0, 1, 1,
-0.3157597, 0.3827631, -0.7622319, 0, 0, 0, 1, 1,
-0.3143338, -1.954223, -4.125031, 0, 0, 0, 1, 1,
-0.3106831, 0.3162764, -0.9390346, 0, 0, 0, 1, 1,
-0.3064139, 2.005436, 0.421906, 0, 0, 0, 1, 1,
-0.3032721, -1.361315, -4.012033, 0, 0, 0, 1, 1,
-0.3032097, -0.6443403, -3.449901, 1, 1, 1, 1, 1,
-0.3004974, 0.385165, 0.6972961, 1, 1, 1, 1, 1,
-0.2966718, 0.7268156, -1.241194, 1, 1, 1, 1, 1,
-0.294445, 1.693507, -0.4786629, 1, 1, 1, 1, 1,
-0.290899, -2.221439, -2.863224, 1, 1, 1, 1, 1,
-0.2859387, -0.3654879, -1.822252, 1, 1, 1, 1, 1,
-0.2805739, 2.963671, -0.6308183, 1, 1, 1, 1, 1,
-0.2798313, -0.7647232, -2.815939, 1, 1, 1, 1, 1,
-0.2796743, -1.598987, -2.699418, 1, 1, 1, 1, 1,
-0.2782832, -0.7106923, -2.361025, 1, 1, 1, 1, 1,
-0.2776816, 0.6656176, 1.609064, 1, 1, 1, 1, 1,
-0.2766578, -1.12905, -1.749128, 1, 1, 1, 1, 1,
-0.2744541, -0.04269062, -3.342644, 1, 1, 1, 1, 1,
-0.2722878, 0.8605437, -1.730557, 1, 1, 1, 1, 1,
-0.2711274, 0.303744, -1.720269, 1, 1, 1, 1, 1,
-0.2679657, 2.253374, -0.1173839, 0, 0, 1, 1, 1,
-0.2672244, 0.1259589, -0.1538252, 1, 0, 0, 1, 1,
-0.2645179, 0.7431121, 1.118295, 1, 0, 0, 1, 1,
-0.2634639, 0.5792242, -2.651568, 1, 0, 0, 1, 1,
-0.2609808, -0.4300118, -0.1841764, 1, 0, 0, 1, 1,
-0.2591935, 1.338572, 1.024085, 1, 0, 0, 1, 1,
-0.2474613, -1.191446, -3.451681, 0, 0, 0, 1, 1,
-0.2456835, -0.6156626, -1.349569, 0, 0, 0, 1, 1,
-0.2406987, -1.85384, -4.596624, 0, 0, 0, 1, 1,
-0.2368446, 0.00977926, -2.787768, 0, 0, 0, 1, 1,
-0.2334432, 1.941154, -0.07608916, 0, 0, 0, 1, 1,
-0.2307016, -1.029685, -1.612553, 0, 0, 0, 1, 1,
-0.2292775, 0.6014113, 0.7311071, 0, 0, 0, 1, 1,
-0.2217776, -1.198993, -4.196809, 1, 1, 1, 1, 1,
-0.221141, -0.1900436, -0.4211812, 1, 1, 1, 1, 1,
-0.2159289, 0.8142131, -1.222251, 1, 1, 1, 1, 1,
-0.2144573, -0.08101387, -2.478228, 1, 1, 1, 1, 1,
-0.2141305, -2.18459, -1.956806, 1, 1, 1, 1, 1,
-0.212183, -1.11357, -1.381183, 1, 1, 1, 1, 1,
-0.2109315, 1.136035, -1.561385, 1, 1, 1, 1, 1,
-0.2053999, -0.4292081, -2.496849, 1, 1, 1, 1, 1,
-0.2032888, -0.2911371, -2.1429, 1, 1, 1, 1, 1,
-0.2002654, 1.151211, 0.1605886, 1, 1, 1, 1, 1,
-0.1935118, -0.7086216, -3.280589, 1, 1, 1, 1, 1,
-0.1918563, 0.4846462, 1.200019, 1, 1, 1, 1, 1,
-0.1902121, 0.01128587, -3.285591, 1, 1, 1, 1, 1,
-0.188122, 1.015875, -0.2425537, 1, 1, 1, 1, 1,
-0.1844595, -1.119214, -3.059643, 1, 1, 1, 1, 1,
-0.1835275, -0.2879958, -1.985844, 0, 0, 1, 1, 1,
-0.1796193, -0.285556, -4.226729, 1, 0, 0, 1, 1,
-0.1752355, 0.7333586, -0.6014264, 1, 0, 0, 1, 1,
-0.1738862, 1.102301, -2.321733, 1, 0, 0, 1, 1,
-0.1726926, -0.2656032, -0.991132, 1, 0, 0, 1, 1,
-0.1709703, -0.02895656, -1.502579, 1, 0, 0, 1, 1,
-0.170346, -0.1792993, -2.812302, 0, 0, 0, 1, 1,
-0.1702587, -0.5747078, -3.16305, 0, 0, 0, 1, 1,
-0.1688551, 0.3133372, 2.163031, 0, 0, 0, 1, 1,
-0.1657173, 1.309411, -2.925362, 0, 0, 0, 1, 1,
-0.1641448, 0.2023699, -1.473739, 0, 0, 0, 1, 1,
-0.1618784, 0.8727586, -0.9818659, 0, 0, 0, 1, 1,
-0.1577943, -0.3457291, -1.875889, 0, 0, 0, 1, 1,
-0.1536132, -0.7992887, -3.30398, 1, 1, 1, 1, 1,
-0.1531444, -1.742136, -3.69012, 1, 1, 1, 1, 1,
-0.1493412, -0.9867193, -3.528991, 1, 1, 1, 1, 1,
-0.1478575, 1.190587, -2.840152, 1, 1, 1, 1, 1,
-0.1473548, 0.4023964, 0.4799037, 1, 1, 1, 1, 1,
-0.1468362, 1.138803, 1.552346, 1, 1, 1, 1, 1,
-0.142117, -0.05855328, -1.552715, 1, 1, 1, 1, 1,
-0.1410661, -0.3436854, -3.371869, 1, 1, 1, 1, 1,
-0.1403099, -2.062708, -3.772573, 1, 1, 1, 1, 1,
-0.1395609, 0.4304584, -0.5855366, 1, 1, 1, 1, 1,
-0.1368573, 0.3627119, 0.4131137, 1, 1, 1, 1, 1,
-0.1337266, -0.04216307, -1.88168, 1, 1, 1, 1, 1,
-0.1328564, 0.5207754, -0.6075281, 1, 1, 1, 1, 1,
-0.1305195, 0.5277299, 0.4763592, 1, 1, 1, 1, 1,
-0.1228919, -0.1269629, -1.949832, 1, 1, 1, 1, 1,
-0.1212329, 0.3424187, 0.6677079, 0, 0, 1, 1, 1,
-0.118475, -0.7991169, -1.49088, 1, 0, 0, 1, 1,
-0.1112424, -0.2041658, -4.373452, 1, 0, 0, 1, 1,
-0.109857, -0.3080458, -3.104455, 1, 0, 0, 1, 1,
-0.1098491, 1.098212, -0.2166271, 1, 0, 0, 1, 1,
-0.1057217, 0.2642936, -2.269998, 1, 0, 0, 1, 1,
-0.100689, -0.1688482, -2.256673, 0, 0, 0, 1, 1,
-0.0988804, -0.577175, -2.942493, 0, 0, 0, 1, 1,
-0.09729461, 0.2097596, 0.1838364, 0, 0, 0, 1, 1,
-0.09652163, 0.1223962, 0.3931815, 0, 0, 0, 1, 1,
-0.09218714, -1.487058, -2.907344, 0, 0, 0, 1, 1,
-0.08722053, 0.3462878, 0.3718623, 0, 0, 0, 1, 1,
-0.08333632, -2.069004, -4.713242, 0, 0, 0, 1, 1,
-0.07605786, 0.3757167, 1.185748, 1, 1, 1, 1, 1,
-0.07014833, -1.852189, -1.998925, 1, 1, 1, 1, 1,
-0.06629591, -0.9492485, -4.22697, 1, 1, 1, 1, 1,
-0.06100766, -0.6440778, -3.166355, 1, 1, 1, 1, 1,
-0.06007992, -1.263243, -0.9095554, 1, 1, 1, 1, 1,
-0.0585782, -0.6511764, -3.443861, 1, 1, 1, 1, 1,
-0.05672428, 0.9829657, -0.2325464, 1, 1, 1, 1, 1,
-0.05512861, -2.270016, -4.619535, 1, 1, 1, 1, 1,
-0.05390554, 1.595399, 1.801123, 1, 1, 1, 1, 1,
-0.05332608, 0.8655313, 0.7804475, 1, 1, 1, 1, 1,
-0.05057653, 1.086076, -0.4816347, 1, 1, 1, 1, 1,
-0.04813423, 0.7218058, -0.2745733, 1, 1, 1, 1, 1,
-0.04448984, 0.8340585, -0.4531671, 1, 1, 1, 1, 1,
-0.04208984, -0.5190505, -2.279603, 1, 1, 1, 1, 1,
-0.03600994, -0.7743756, -2.202066, 1, 1, 1, 1, 1,
-0.0342443, 1.090746, -0.07378324, 0, 0, 1, 1, 1,
-0.03186271, -0.2579475, -2.499669, 1, 0, 0, 1, 1,
-0.02802107, -0.1249872, -2.33485, 1, 0, 0, 1, 1,
-0.02568982, -0.8876653, -2.32411, 1, 0, 0, 1, 1,
-0.0236825, 0.4463425, -1.298844, 1, 0, 0, 1, 1,
-0.02053794, -0.06013034, -2.8934, 1, 0, 0, 1, 1,
-0.01749747, 0.8075712, -1.363344, 0, 0, 0, 1, 1,
-0.01433304, -1.491838, -4.25776, 0, 0, 0, 1, 1,
-0.01298872, 1.678581, -0.2894719, 0, 0, 0, 1, 1,
-0.008194396, -1.971238, -4.117743, 0, 0, 0, 1, 1,
-0.007160055, 0.4605029, -0.3667403, 0, 0, 0, 1, 1,
-0.005219135, 1.726343, 0.836898, 0, 0, 0, 1, 1,
-0.005174073, -0.7983125, -2.978072, 0, 0, 0, 1, 1,
-0.001697001, 1.979729, -1.342142, 1, 1, 1, 1, 1,
-0.0003810881, 0.3135992, 0.8285385, 1, 1, 1, 1, 1,
0.002569657, 0.5802932, 1.197222, 1, 1, 1, 1, 1,
0.006721651, 0.1455739, 0.9823718, 1, 1, 1, 1, 1,
0.00983192, -0.5977255, 3.247797, 1, 1, 1, 1, 1,
0.01068397, -0.2572721, 4.627022, 1, 1, 1, 1, 1,
0.01214871, 0.9985907, -2.120815, 1, 1, 1, 1, 1,
0.01232936, 0.4214485, -1.157901, 1, 1, 1, 1, 1,
0.01336763, -2.712672, 2.296516, 1, 1, 1, 1, 1,
0.01354669, 0.05548136, 0.1629107, 1, 1, 1, 1, 1,
0.01873365, 0.9474714, 1.201848, 1, 1, 1, 1, 1,
0.02476881, -0.515164, 2.624065, 1, 1, 1, 1, 1,
0.02499461, 0.6168381, 0.4046881, 1, 1, 1, 1, 1,
0.03077565, 1.965358, -0.8382331, 1, 1, 1, 1, 1,
0.03618841, 0.4327531, -1.096165, 1, 1, 1, 1, 1,
0.03954959, -2.246864, 3.158294, 0, 0, 1, 1, 1,
0.03976108, -0.8172004, 3.597946, 1, 0, 0, 1, 1,
0.04187071, 0.3517886, -2.100868, 1, 0, 0, 1, 1,
0.04229735, -0.1905887, 3.865666, 1, 0, 0, 1, 1,
0.04432816, -1.985221, 2.370993, 1, 0, 0, 1, 1,
0.04443193, 0.07929122, 0.7913277, 1, 0, 0, 1, 1,
0.04767168, 0.6669404, -1.413717, 0, 0, 0, 1, 1,
0.04885998, 1.162545, -0.5015643, 0, 0, 0, 1, 1,
0.05042332, -1.245381, 3.613299, 0, 0, 0, 1, 1,
0.05256197, -0.7365124, 2.776541, 0, 0, 0, 1, 1,
0.05399086, -0.8142411, 2.563822, 0, 0, 0, 1, 1,
0.05430804, -1.325904, 3.270115, 0, 0, 0, 1, 1,
0.05564207, 1.11927, 0.172078, 0, 0, 0, 1, 1,
0.05592424, 0.7528843, 1.170756, 1, 1, 1, 1, 1,
0.05899844, 1.888889, -1.118578, 1, 1, 1, 1, 1,
0.05988238, 0.1909043, -0.4537755, 1, 1, 1, 1, 1,
0.06319468, 1.348332, 0.962516, 1, 1, 1, 1, 1,
0.06348169, 0.1878775, 2.320948, 1, 1, 1, 1, 1,
0.06593672, -1.823645, 4.931553, 1, 1, 1, 1, 1,
0.0684348, -0.3151838, 2.10587, 1, 1, 1, 1, 1,
0.06968428, 0.5126401, -1.273742, 1, 1, 1, 1, 1,
0.06984188, 0.09514944, 0.8687996, 1, 1, 1, 1, 1,
0.07644703, -1.032393, 2.117348, 1, 1, 1, 1, 1,
0.08135828, 1.074109, -0.6670693, 1, 1, 1, 1, 1,
0.08830874, -1.547845, 5.898273, 1, 1, 1, 1, 1,
0.08872064, 0.2938741, -1.216798, 1, 1, 1, 1, 1,
0.09039952, 0.06533322, 1.469504, 1, 1, 1, 1, 1,
0.09118293, -1.182088, 3.100574, 1, 1, 1, 1, 1,
0.09973106, 0.04885277, 1.110376, 0, 0, 1, 1, 1,
0.1015468, 0.7519253, 0.3880163, 1, 0, 0, 1, 1,
0.101638, -0.7356515, 3.117413, 1, 0, 0, 1, 1,
0.1026464, 0.9037455, 1.891443, 1, 0, 0, 1, 1,
0.1044179, 0.7323024, -0.5493603, 1, 0, 0, 1, 1,
0.1063665, 0.195396, -0.5775586, 1, 0, 0, 1, 1,
0.1068373, -1.945889, 2.533022, 0, 0, 0, 1, 1,
0.1087724, 0.398049, 1.217302, 0, 0, 0, 1, 1,
0.1126675, -0.5137202, 3.00961, 0, 0, 0, 1, 1,
0.1130022, 0.1124837, 0.2673425, 0, 0, 0, 1, 1,
0.1130988, -2.265653, 4.158931, 0, 0, 0, 1, 1,
0.1144303, -1.576705, 3.024957, 0, 0, 0, 1, 1,
0.1151685, -0.01155556, 2.49196, 0, 0, 0, 1, 1,
0.1159437, -0.7726569, 1.65512, 1, 1, 1, 1, 1,
0.116925, 1.23713, -1.910642, 1, 1, 1, 1, 1,
0.1189824, -0.4651258, 2.014291, 1, 1, 1, 1, 1,
0.1218274, -1.803563, 1.6807, 1, 1, 1, 1, 1,
0.1282138, 0.3348525, 2.878561, 1, 1, 1, 1, 1,
0.1328241, -0.01786271, 4.008716, 1, 1, 1, 1, 1,
0.1329893, 2.145465, -0.4656963, 1, 1, 1, 1, 1,
0.1419416, -1.355544, 4.618592, 1, 1, 1, 1, 1,
0.142034, -1.00681, 2.669873, 1, 1, 1, 1, 1,
0.1488152, -1.07861, 1.924044, 1, 1, 1, 1, 1,
0.151364, -0.7550302, 3.654379, 1, 1, 1, 1, 1,
0.1518103, -0.4267437, 3.275981, 1, 1, 1, 1, 1,
0.1573527, 0.7603266, 2.452484, 1, 1, 1, 1, 1,
0.1599825, -1.163412, 4.392207, 1, 1, 1, 1, 1,
0.16101, 0.691502, 0.7449407, 1, 1, 1, 1, 1,
0.1654122, -0.4316762, 4.035729, 0, 0, 1, 1, 1,
0.1661828, 0.217076, 1.00822, 1, 0, 0, 1, 1,
0.166479, 0.1414478, 0.9509762, 1, 0, 0, 1, 1,
0.1688541, -0.2950643, 2.29252, 1, 0, 0, 1, 1,
0.1690034, -1.493556, 3.820553, 1, 0, 0, 1, 1,
0.1717519, 0.3612411, 0.8189496, 1, 0, 0, 1, 1,
0.1735101, 0.1399442, -0.01091476, 0, 0, 0, 1, 1,
0.1841748, -0.5195788, 2.660966, 0, 0, 0, 1, 1,
0.1860922, -1.402162, 2.821333, 0, 0, 0, 1, 1,
0.1870955, -0.9195871, 4.791924, 0, 0, 0, 1, 1,
0.1871824, -0.6088498, 3.623336, 0, 0, 0, 1, 1,
0.1918443, 1.36768, -0.4067633, 0, 0, 0, 1, 1,
0.1920416, 0.2825628, 0.5078216, 0, 0, 0, 1, 1,
0.1943326, 0.6421309, 0.3773509, 1, 1, 1, 1, 1,
0.1947383, 1.270511, -0.2152433, 1, 1, 1, 1, 1,
0.19574, 0.1502617, 0.8468428, 1, 1, 1, 1, 1,
0.1958733, 0.6495985, -1.462837, 1, 1, 1, 1, 1,
0.198606, -0.02912496, 1.040496, 1, 1, 1, 1, 1,
0.2064027, -0.5926508, 4.557672, 1, 1, 1, 1, 1,
0.2115974, 1.52405, -0.4157613, 1, 1, 1, 1, 1,
0.2161637, 0.7454537, 0.8669841, 1, 1, 1, 1, 1,
0.2213662, 0.5763906, -0.5095079, 1, 1, 1, 1, 1,
0.2243401, -0.6727608, 3.160675, 1, 1, 1, 1, 1,
0.2252156, 0.6231778, -1.575547, 1, 1, 1, 1, 1,
0.2277437, -0.2436428, 0.9321996, 1, 1, 1, 1, 1,
0.2293335, 0.3502119, -0.8165675, 1, 1, 1, 1, 1,
0.2314863, 0.3018533, -0.02796178, 1, 1, 1, 1, 1,
0.2317884, 0.3095191, 1.626929, 1, 1, 1, 1, 1,
0.2330542, -1.155766, 1.358814, 0, 0, 1, 1, 1,
0.2332062, 0.4421977, 1.911632, 1, 0, 0, 1, 1,
0.2354472, -1.384492, 1.457503, 1, 0, 0, 1, 1,
0.2399321, -2.001876, 2.808446, 1, 0, 0, 1, 1,
0.2464765, 0.5174913, -0.8423237, 1, 0, 0, 1, 1,
0.2509334, -1.455701, 1.527194, 1, 0, 0, 1, 1,
0.252251, -2.463306, 3.298892, 0, 0, 0, 1, 1,
0.2541848, -0.2467989, 1.864093, 0, 0, 0, 1, 1,
0.2596028, 1.331641, -0.3070388, 0, 0, 0, 1, 1,
0.2644884, -0.1039743, 1.711112, 0, 0, 0, 1, 1,
0.2653714, 1.00109, -0.3217982, 0, 0, 0, 1, 1,
0.2665621, 0.472001, 0.1688735, 0, 0, 0, 1, 1,
0.2693093, -2.192684, 2.156786, 0, 0, 0, 1, 1,
0.2708983, 0.5883006, 1.851545, 1, 1, 1, 1, 1,
0.2721707, 0.1616472, 1.557086, 1, 1, 1, 1, 1,
0.2780499, -0.2960459, 3.177819, 1, 1, 1, 1, 1,
0.2792697, 1.330209, -0.4579659, 1, 1, 1, 1, 1,
0.2865556, -1.083865, 4.873101, 1, 1, 1, 1, 1,
0.2882679, -0.8611308, 2.520895, 1, 1, 1, 1, 1,
0.2890253, 0.4298201, 0.1997623, 1, 1, 1, 1, 1,
0.292776, -0.8167667, 3.895939, 1, 1, 1, 1, 1,
0.2928221, -0.626074, 2.216441, 1, 1, 1, 1, 1,
0.2960777, 0.5911949, -0.5671207, 1, 1, 1, 1, 1,
0.2982841, 0.2145958, 1.637218, 1, 1, 1, 1, 1,
0.2984042, 0.1250285, 0.7673153, 1, 1, 1, 1, 1,
0.2990794, 0.7670273, 1.70498, 1, 1, 1, 1, 1,
0.2996065, -1.035081, 5.234437, 1, 1, 1, 1, 1,
0.3030947, -1.275648, 4.804626, 1, 1, 1, 1, 1,
0.3037661, 0.9150583, 0.1185327, 0, 0, 1, 1, 1,
0.3038075, 0.5937582, 0.02478526, 1, 0, 0, 1, 1,
0.3058426, -1.643994, 4.258278, 1, 0, 0, 1, 1,
0.3062063, -0.9605152, 3.82351, 1, 0, 0, 1, 1,
0.3125178, 2.388946, 0.4179782, 1, 0, 0, 1, 1,
0.3129582, -0.9496639, 2.698228, 1, 0, 0, 1, 1,
0.3144715, 0.0485243, 2.804669, 0, 0, 0, 1, 1,
0.3145268, -0.2928235, 4.3196, 0, 0, 0, 1, 1,
0.3177456, 0.1514987, 3.699121, 0, 0, 0, 1, 1,
0.3178032, 0.1253279, 0.05575439, 0, 0, 0, 1, 1,
0.3201919, 1.972902, -0.04057824, 0, 0, 0, 1, 1,
0.321357, -1.302979, 0.8640267, 0, 0, 0, 1, 1,
0.3251658, -1.220561, 3.420139, 0, 0, 0, 1, 1,
0.3281288, 1.419006, -0.8842166, 1, 1, 1, 1, 1,
0.3281792, 0.5647243, -1.529171, 1, 1, 1, 1, 1,
0.3289373, 0.7048437, 1.498755, 1, 1, 1, 1, 1,
0.3338945, -0.3765956, 1.826073, 1, 1, 1, 1, 1,
0.3363012, -0.7720894, 2.771277, 1, 1, 1, 1, 1,
0.3368232, 0.6469517, 2.166499, 1, 1, 1, 1, 1,
0.3381665, -0.0886364, 0.7382876, 1, 1, 1, 1, 1,
0.3382488, -1.129591, 1.656271, 1, 1, 1, 1, 1,
0.3423531, -0.7083613, 2.23912, 1, 1, 1, 1, 1,
0.3423889, -1.235582, 2.073773, 1, 1, 1, 1, 1,
0.3484298, -0.2650748, 1.055766, 1, 1, 1, 1, 1,
0.3491637, -1.034193, 2.874332, 1, 1, 1, 1, 1,
0.3550043, 1.89821, -0.3829288, 1, 1, 1, 1, 1,
0.3565115, 0.2006173, -0.2150925, 1, 1, 1, 1, 1,
0.3609315, -2.047081, 3.157669, 1, 1, 1, 1, 1,
0.3657335, 1.154426, 1.570845, 0, 0, 1, 1, 1,
0.3671263, -1.446346, 3.060582, 1, 0, 0, 1, 1,
0.3672776, -0.7463921, 3.795276, 1, 0, 0, 1, 1,
0.368523, 3.405351, 0.2129639, 1, 0, 0, 1, 1,
0.3686341, 0.03676232, 0.9633679, 1, 0, 0, 1, 1,
0.3693772, -0.3424032, 2.19691, 1, 0, 0, 1, 1,
0.3700122, -0.3590572, 1.916368, 0, 0, 0, 1, 1,
0.3739816, 1.49596, 0.8388983, 0, 0, 0, 1, 1,
0.3766366, 0.5362573, 0.456522, 0, 0, 0, 1, 1,
0.3768763, -1.661702, 2.818144, 0, 0, 0, 1, 1,
0.3775567, -0.1195719, 3.056643, 0, 0, 0, 1, 1,
0.3781152, -0.3249869, 1.092705, 0, 0, 0, 1, 1,
0.3805806, 0.1738058, 1.549546, 0, 0, 0, 1, 1,
0.3855886, 0.8702387, 0.09263617, 1, 1, 1, 1, 1,
0.38704, 0.6563333, 0.7846652, 1, 1, 1, 1, 1,
0.3883886, 0.9009598, 0.5359944, 1, 1, 1, 1, 1,
0.3884969, 1.424146, 1.095022, 1, 1, 1, 1, 1,
0.3943943, 0.2315738, 1.325892, 1, 1, 1, 1, 1,
0.3953189, 0.7824721, 0.7501711, 1, 1, 1, 1, 1,
0.395629, 1.552403, 0.5981077, 1, 1, 1, 1, 1,
0.4025683, 0.006079114, 1.893076, 1, 1, 1, 1, 1,
0.4036447, -1.721679, 2.791436, 1, 1, 1, 1, 1,
0.4037466, -0.703505, 3.339562, 1, 1, 1, 1, 1,
0.4044782, 0.7065326, -1.576415, 1, 1, 1, 1, 1,
0.4049123, -1.854756, 3.548138, 1, 1, 1, 1, 1,
0.4052723, -0.1393066, 1.911722, 1, 1, 1, 1, 1,
0.4053777, 0.5857965, 0.1104681, 1, 1, 1, 1, 1,
0.4073002, -1.111577, 1.529211, 1, 1, 1, 1, 1,
0.4084118, -0.1916298, 1.813521, 0, 0, 1, 1, 1,
0.4126943, -0.8241, 2.074889, 1, 0, 0, 1, 1,
0.4297691, 0.4440349, -0.04752816, 1, 0, 0, 1, 1,
0.4305154, -0.04562715, 0.01546621, 1, 0, 0, 1, 1,
0.4378197, 0.1438631, -0.5245638, 1, 0, 0, 1, 1,
0.4403947, -2.901707, 2.575003, 1, 0, 0, 1, 1,
0.4423826, -1.915218, 2.991014, 0, 0, 0, 1, 1,
0.4456574, 0.8833179, -0.4052354, 0, 0, 0, 1, 1,
0.4461907, -0.1860163, 2.38045, 0, 0, 0, 1, 1,
0.45034, 0.255051, 1.62675, 0, 0, 0, 1, 1,
0.4561769, 0.556106, 1.244072, 0, 0, 0, 1, 1,
0.4565122, 0.1370179, 0.5438208, 0, 0, 0, 1, 1,
0.4614984, 1.407939, -0.02939468, 0, 0, 0, 1, 1,
0.4718376, -0.736828, 2.120811, 1, 1, 1, 1, 1,
0.4734347, 0.204125, 1.305372, 1, 1, 1, 1, 1,
0.4779185, -0.1766208, 1.491623, 1, 1, 1, 1, 1,
0.4792582, 0.6820277, -0.6648454, 1, 1, 1, 1, 1,
0.4816129, 1.079663, -1.779788, 1, 1, 1, 1, 1,
0.4868286, 0.05765445, 1.488441, 1, 1, 1, 1, 1,
0.5006596, -0.6119756, 1.288089, 1, 1, 1, 1, 1,
0.50086, 0.5954489, 0.9729605, 1, 1, 1, 1, 1,
0.5092665, 0.09868313, 1.203322, 1, 1, 1, 1, 1,
0.511476, -0.137842, 1.784996, 1, 1, 1, 1, 1,
0.514457, 0.5786815, -0.4225117, 1, 1, 1, 1, 1,
0.5152879, 0.1911278, 1.711867, 1, 1, 1, 1, 1,
0.5181434, -1.571994, 2.580909, 1, 1, 1, 1, 1,
0.5201355, -0.291919, 2.361736, 1, 1, 1, 1, 1,
0.5203382, -0.6728541, 3.015683, 1, 1, 1, 1, 1,
0.5220786, 0.8641265, 0.2118936, 0, 0, 1, 1, 1,
0.5239357, -0.3881782, 1.582079, 1, 0, 0, 1, 1,
0.5258937, 0.6787941, -1.52427, 1, 0, 0, 1, 1,
0.5279962, 0.1085884, 1.970524, 1, 0, 0, 1, 1,
0.5329801, 0.2998556, 2.265721, 1, 0, 0, 1, 1,
0.5348457, -0.5975707, 0.05931615, 1, 0, 0, 1, 1,
0.541864, 1.049853, 0.2625791, 0, 0, 0, 1, 1,
0.5429107, 0.002842197, 2.188786, 0, 0, 0, 1, 1,
0.5435407, 0.6327181, 0.04373312, 0, 0, 0, 1, 1,
0.54585, -1.380177, 1.843059, 0, 0, 0, 1, 1,
0.5524697, 1.125289, -0.3735041, 0, 0, 0, 1, 1,
0.555379, -0.9857507, 3.507519, 0, 0, 0, 1, 1,
0.5590751, -0.2431508, 1.413035, 0, 0, 0, 1, 1,
0.5622638, 0.4113048, -1.239052, 1, 1, 1, 1, 1,
0.5678209, 0.5561211, 0.538026, 1, 1, 1, 1, 1,
0.5696132, 0.7006306, 1.22028, 1, 1, 1, 1, 1,
0.5711917, 1.365734, -0.2657377, 1, 1, 1, 1, 1,
0.5714029, 0.6940882, 0.7584277, 1, 1, 1, 1, 1,
0.5733684, -0.7319797, 0.9251696, 1, 1, 1, 1, 1,
0.5806997, 2.134045, 1.337063, 1, 1, 1, 1, 1,
0.5820339, -0.3641277, 1.204653, 1, 1, 1, 1, 1,
0.5877586, -0.57461, 3.020254, 1, 1, 1, 1, 1,
0.5972905, -0.5337908, 2.013279, 1, 1, 1, 1, 1,
0.6011649, 0.6402091, 1.27524, 1, 1, 1, 1, 1,
0.6026884, 0.04493881, 1.708763, 1, 1, 1, 1, 1,
0.610451, -1.654665, 3.305806, 1, 1, 1, 1, 1,
0.6154683, -1.239789, 2.616455, 1, 1, 1, 1, 1,
0.6183299, -0.8605247, 1.423404, 1, 1, 1, 1, 1,
0.6197793, -0.1081003, 2.114615, 0, 0, 1, 1, 1,
0.623134, 0.4834412, 1.462227, 1, 0, 0, 1, 1,
0.6272053, 0.5087129, -0.0584739, 1, 0, 0, 1, 1,
0.6326303, -0.6627074, 1.167041, 1, 0, 0, 1, 1,
0.6327198, 0.2292973, 1.061604, 1, 0, 0, 1, 1,
0.6408768, 1.123667, -0.4514178, 1, 0, 0, 1, 1,
0.6419572, -0.6426301, 1.96084, 0, 0, 0, 1, 1,
0.6436195, -0.2835322, 2.087662, 0, 0, 0, 1, 1,
0.6467899, -0.5015005, 3.198465, 0, 0, 0, 1, 1,
0.6509443, 0.2095348, 0.6158085, 0, 0, 0, 1, 1,
0.6530352, -0.3089256, 0.9502899, 0, 0, 0, 1, 1,
0.6545284, -0.5028239, 2.814387, 0, 0, 0, 1, 1,
0.6557322, 0.4364495, 1.465912, 0, 0, 0, 1, 1,
0.6562004, -0.2070583, 1.59669, 1, 1, 1, 1, 1,
0.6579298, -1.041979, 3.759902, 1, 1, 1, 1, 1,
0.6609259, -1.299543, 3.082888, 1, 1, 1, 1, 1,
0.6659639, -0.2373461, 3.820599, 1, 1, 1, 1, 1,
0.6660533, -0.4055586, 1.024377, 1, 1, 1, 1, 1,
0.6683304, -0.1440569, 1.608587, 1, 1, 1, 1, 1,
0.6717078, 0.9219561, -0.3546217, 1, 1, 1, 1, 1,
0.6721548, -1.047747, 2.638781, 1, 1, 1, 1, 1,
0.6738243, -0.7317781, 1.511539, 1, 1, 1, 1, 1,
0.6777751, 1.374288, 0.265051, 1, 1, 1, 1, 1,
0.6832367, 0.1463171, 1.428434, 1, 1, 1, 1, 1,
0.6872486, 0.3904041, 1.563221, 1, 1, 1, 1, 1,
0.6895908, 0.5388354, 1.220946, 1, 1, 1, 1, 1,
0.7054591, -2.872838, 4.757215, 1, 1, 1, 1, 1,
0.7077814, -1.643794, 2.298856, 1, 1, 1, 1, 1,
0.7081845, -0.8412493, 2.204388, 0, 0, 1, 1, 1,
0.7101695, -0.3694683, 4.050879, 1, 0, 0, 1, 1,
0.7116962, 0.4181639, 2.512448, 1, 0, 0, 1, 1,
0.7121902, 0.6056742, -0.1465867, 1, 0, 0, 1, 1,
0.7131709, 0.7669935, 2.069341, 1, 0, 0, 1, 1,
0.7134174, -0.3085741, 2.543578, 1, 0, 0, 1, 1,
0.7209373, 0.08394025, 0.8848285, 0, 0, 0, 1, 1,
0.7230703, -0.4124557, 1.855322, 0, 0, 0, 1, 1,
0.723153, 0.1234241, 1.087942, 0, 0, 0, 1, 1,
0.7237277, 1.850483, 1.265802, 0, 0, 0, 1, 1,
0.7315714, 0.3632006, 1.593912, 0, 0, 0, 1, 1,
0.7333388, 0.5045422, -1.003346, 0, 0, 0, 1, 1,
0.736316, -0.2687204, 1.367898, 0, 0, 0, 1, 1,
0.7364956, 0.8530272, 1.030577, 1, 1, 1, 1, 1,
0.7385596, -1.286236, 2.018844, 1, 1, 1, 1, 1,
0.7433959, 0.1587971, 2.219645, 1, 1, 1, 1, 1,
0.743784, -0.02480058, 1.925331, 1, 1, 1, 1, 1,
0.744053, -0.9824721, 1.352488, 1, 1, 1, 1, 1,
0.747983, 0.533654, 0.4721949, 1, 1, 1, 1, 1,
0.7532113, -1.159043, 3.503465, 1, 1, 1, 1, 1,
0.7564597, 0.5238721, 1.886162, 1, 1, 1, 1, 1,
0.7571247, -1.26436, 2.518262, 1, 1, 1, 1, 1,
0.7571499, -1.26766, 2.606439, 1, 1, 1, 1, 1,
0.7595066, 0.2088686, -0.3660402, 1, 1, 1, 1, 1,
0.7677544, -0.7895519, 2.4821, 1, 1, 1, 1, 1,
0.7682482, 0.7052495, 0.4040757, 1, 1, 1, 1, 1,
0.7695306, 0.3569488, -1.401191, 1, 1, 1, 1, 1,
0.7787622, 0.4973744, 1.163232, 1, 1, 1, 1, 1,
0.7818092, 0.7143838, 1.844874, 0, 0, 1, 1, 1,
0.7821336, 0.3909801, 1.502421, 1, 0, 0, 1, 1,
0.7822939, -0.3165105, 1.63326, 1, 0, 0, 1, 1,
0.7842605, 0.5967898, 3.104021, 1, 0, 0, 1, 1,
0.7909222, -1.47975, 3.976101, 1, 0, 0, 1, 1,
0.7944782, -1.439785, 3.041709, 1, 0, 0, 1, 1,
0.7981262, -1.143079, 3.534298, 0, 0, 0, 1, 1,
0.7981589, 1.504815, -0.2730604, 0, 0, 0, 1, 1,
0.7987706, -0.01912282, 1.037253, 0, 0, 0, 1, 1,
0.8026733, -0.495329, 3.72247, 0, 0, 0, 1, 1,
0.8032875, -0.7510974, 2.21898, 0, 0, 0, 1, 1,
0.8108904, -0.4299242, 1.841801, 0, 0, 0, 1, 1,
0.8142924, -0.1888588, -0.2449327, 0, 0, 0, 1, 1,
0.8145903, 1.977579, 0.1485457, 1, 1, 1, 1, 1,
0.814859, -1.423765, 3.603188, 1, 1, 1, 1, 1,
0.8151913, 0.1084591, 0.3149379, 1, 1, 1, 1, 1,
0.8157166, 1.484556, 1.955572, 1, 1, 1, 1, 1,
0.8164315, 0.1932761, 1.89232, 1, 1, 1, 1, 1,
0.826476, -0.3890195, 1.829761, 1, 1, 1, 1, 1,
0.8308759, 0.9373081, -0.1239756, 1, 1, 1, 1, 1,
0.8328617, 0.1750058, 1.863439, 1, 1, 1, 1, 1,
0.8386972, 0.01986202, 1.076295, 1, 1, 1, 1, 1,
0.8436033, 0.9883286, 1.746192, 1, 1, 1, 1, 1,
0.8451344, -0.5153407, 3.330916, 1, 1, 1, 1, 1,
0.8468366, -0.2611252, 3.328375, 1, 1, 1, 1, 1,
0.8536476, -1.654918, 3.085993, 1, 1, 1, 1, 1,
0.8598061, -0.4592331, 2.306581, 1, 1, 1, 1, 1,
0.8679579, 1.379062, -0.6244207, 1, 1, 1, 1, 1,
0.8720032, -1.683388, 1.853579, 0, 0, 1, 1, 1,
0.8809242, -0.8865182, 2.180152, 1, 0, 0, 1, 1,
0.8856974, -0.2536631, 2.71043, 1, 0, 0, 1, 1,
0.8965501, -0.2656447, 2.225058, 1, 0, 0, 1, 1,
0.8980148, -0.2505501, 0.1567631, 1, 0, 0, 1, 1,
0.9008436, 1.30269, -0.5017248, 1, 0, 0, 1, 1,
0.902862, -1.13757, 2.282897, 0, 0, 0, 1, 1,
0.9160424, -1.183623, 2.854211, 0, 0, 0, 1, 1,
0.9171237, 0.1649323, 0.8739673, 0, 0, 0, 1, 1,
0.9172338, 0.3285707, 1.455297, 0, 0, 0, 1, 1,
0.9233012, 0.5697871, 0.8837074, 0, 0, 0, 1, 1,
0.9236553, -2.802896, 3.08067, 0, 0, 0, 1, 1,
0.9310941, 0.0529271, 1.029409, 0, 0, 0, 1, 1,
0.9312033, 0.1557813, 2.54264, 1, 1, 1, 1, 1,
0.943132, 0.5315696, 0.7603517, 1, 1, 1, 1, 1,
0.9483273, 1.113494, 0.2921802, 1, 1, 1, 1, 1,
0.9483847, -0.3550082, 2.742694, 1, 1, 1, 1, 1,
0.9521453, 0.7693115, 1.013821, 1, 1, 1, 1, 1,
0.955664, 1.335286, 0.6582077, 1, 1, 1, 1, 1,
0.9714348, 0.6180872, 1.389577, 1, 1, 1, 1, 1,
0.9723096, -0.61725, 3.661427, 1, 1, 1, 1, 1,
0.9756866, 0.8698773, -0.3646212, 1, 1, 1, 1, 1,
0.9776775, 1.581795, -0.2526787, 1, 1, 1, 1, 1,
0.9819527, 0.9037105, -0.197502, 1, 1, 1, 1, 1,
0.9819728, 0.1487056, 2.224306, 1, 1, 1, 1, 1,
0.9881492, -0.5136436, 3.597094, 1, 1, 1, 1, 1,
0.9917212, -0.5578318, 2.663652, 1, 1, 1, 1, 1,
0.9936298, 0.6953439, 0.3874541, 1, 1, 1, 1, 1,
1.012204, 1.680535, -0.05525304, 0, 0, 1, 1, 1,
1.019248, -0.9464693, 1.523585, 1, 0, 0, 1, 1,
1.026529, -0.1040725, 2.007053, 1, 0, 0, 1, 1,
1.032266, -0.7982552, 1.834903, 1, 0, 0, 1, 1,
1.033736, -0.3715354, 1.128403, 1, 0, 0, 1, 1,
1.046331, 0.6633603, 1.281972, 1, 0, 0, 1, 1,
1.046354, -0.2481704, 1.919341, 0, 0, 0, 1, 1,
1.051373, 0.1958437, 2.570496, 0, 0, 0, 1, 1,
1.052624, -0.1700738, 1.987126, 0, 0, 0, 1, 1,
1.061818, 1.315993, 2.370804, 0, 0, 0, 1, 1,
1.065026, -0.5057745, 2.660712, 0, 0, 0, 1, 1,
1.066643, 0.8602415, 2.146155, 0, 0, 0, 1, 1,
1.070977, -0.01973797, 1.133531, 0, 0, 0, 1, 1,
1.074821, -0.4072648, 0.1302471, 1, 1, 1, 1, 1,
1.075807, -0.06068797, 2.945313, 1, 1, 1, 1, 1,
1.079907, -1.482451, 2.573152, 1, 1, 1, 1, 1,
1.081037, -0.8261189, 3.335376, 1, 1, 1, 1, 1,
1.08955, 2.054618, 0.1291514, 1, 1, 1, 1, 1,
1.091533, -0.7444875, 2.424645, 1, 1, 1, 1, 1,
1.092454, 1.457067, -0.02194237, 1, 1, 1, 1, 1,
1.092642, 0.3816061, 2.486506, 1, 1, 1, 1, 1,
1.094441, -0.5388616, 2.732221, 1, 1, 1, 1, 1,
1.100138, -1.268267, 2.326334, 1, 1, 1, 1, 1,
1.102637, 0.6112343, 2.880163, 1, 1, 1, 1, 1,
1.104361, 0.5289117, -0.1289629, 1, 1, 1, 1, 1,
1.106815, -1.401005, 2.604066, 1, 1, 1, 1, 1,
1.11062, -0.02452119, 3.051944, 1, 1, 1, 1, 1,
1.112275, 0.36359, 2.248699, 1, 1, 1, 1, 1,
1.115002, -1.122012, 3.094149, 0, 0, 1, 1, 1,
1.118326, 0.7001017, 1.118685, 1, 0, 0, 1, 1,
1.121085, 0.5889192, 2.574791, 1, 0, 0, 1, 1,
1.121452, 0.01350564, 1.662755, 1, 0, 0, 1, 1,
1.125672, -0.4040581, 1.460104, 1, 0, 0, 1, 1,
1.14035, -0.4433531, 2.029364, 1, 0, 0, 1, 1,
1.141239, -1.481994, 1.846105, 0, 0, 0, 1, 1,
1.149207, -0.5540348, 1.911386, 0, 0, 0, 1, 1,
1.150487, -1.619395, 3.728301, 0, 0, 0, 1, 1,
1.150947, 0.4139647, 1.448094, 0, 0, 0, 1, 1,
1.151752, -0.509805, 1.301488, 0, 0, 0, 1, 1,
1.157394, 0.0786965, 0.5977694, 0, 0, 0, 1, 1,
1.158482, -0.6170612, 0.1907849, 0, 0, 0, 1, 1,
1.164965, -0.2628364, 3.165054, 1, 1, 1, 1, 1,
1.168855, 3.22795, -0.2501489, 1, 1, 1, 1, 1,
1.169608, 1.447832, 1.023276, 1, 1, 1, 1, 1,
1.174613, 0.04663401, 2.349511, 1, 1, 1, 1, 1,
1.174755, -0.1184212, 0.4355046, 1, 1, 1, 1, 1,
1.18721, -0.8605981, 2.897405, 1, 1, 1, 1, 1,
1.187445, -0.6355327, -0.3738667, 1, 1, 1, 1, 1,
1.193463, 0.7970188, 1.528743, 1, 1, 1, 1, 1,
1.20593, -2.260264, 3.058231, 1, 1, 1, 1, 1,
1.213467, -0.7088333, 4.028896, 1, 1, 1, 1, 1,
1.22119, 0.06334472, 1.709376, 1, 1, 1, 1, 1,
1.224104, -0.5218321, 2.508125, 1, 1, 1, 1, 1,
1.23639, -0.4289657, 2.656924, 1, 1, 1, 1, 1,
1.242728, -0.2608866, 1.580122, 1, 1, 1, 1, 1,
1.244484, 0.6221107, 1.452595, 1, 1, 1, 1, 1,
1.262924, 0.6110393, 2.136337, 0, 0, 1, 1, 1,
1.269802, 1.304587, -0.01871604, 1, 0, 0, 1, 1,
1.272606, -0.7751741, 2.401122, 1, 0, 0, 1, 1,
1.27887, -0.4174261, 1.991614, 1, 0, 0, 1, 1,
1.29071, 1.853989, 1.693774, 1, 0, 0, 1, 1,
1.291632, 0.8106426, 1.709716, 1, 0, 0, 1, 1,
1.293875, -0.4628067, 0.1473471, 0, 0, 0, 1, 1,
1.301384, -0.3827373, 1.168717, 0, 0, 0, 1, 1,
1.303486, 0.3944429, 2.02742, 0, 0, 0, 1, 1,
1.303675, 0.1709953, 3.701089, 0, 0, 0, 1, 1,
1.310556, -1.288789, 1.504993, 0, 0, 0, 1, 1,
1.312873, 0.7599711, 1.838232, 0, 0, 0, 1, 1,
1.313239, -0.9084983, 1.960097, 0, 0, 0, 1, 1,
1.316846, -0.3039805, 2.804163, 1, 1, 1, 1, 1,
1.317259, 1.254178, 2.112348, 1, 1, 1, 1, 1,
1.320467, 0.1612803, 2.088537, 1, 1, 1, 1, 1,
1.321207, 0.4085829, 0.7846448, 1, 1, 1, 1, 1,
1.32246, -1.052262, 1.479865, 1, 1, 1, 1, 1,
1.326936, 1.449271, 1.034843, 1, 1, 1, 1, 1,
1.32702, -0.3463158, 2.85957, 1, 1, 1, 1, 1,
1.327092, 2.974867, 2.066447, 1, 1, 1, 1, 1,
1.330502, 0.570524, 3.518064, 1, 1, 1, 1, 1,
1.331253, 1.463604, 0.4250756, 1, 1, 1, 1, 1,
1.33566, 1.225595, 0.1274981, 1, 1, 1, 1, 1,
1.340203, 0.2756361, 2.374033, 1, 1, 1, 1, 1,
1.345824, 0.3572044, 2.714315, 1, 1, 1, 1, 1,
1.346564, -0.3253979, -0.2966426, 1, 1, 1, 1, 1,
1.34798, -0.04763754, 1.231368, 1, 1, 1, 1, 1,
1.357686, 1.498109, -0.1678672, 0, 0, 1, 1, 1,
1.361007, -0.3944241, 0.6651512, 1, 0, 0, 1, 1,
1.368268, 0.9318369, 0.1560598, 1, 0, 0, 1, 1,
1.379654, -0.5228965, 3.183539, 1, 0, 0, 1, 1,
1.401561, -0.899698, 2.830064, 1, 0, 0, 1, 1,
1.409482, -0.8889837, 3.129879, 1, 0, 0, 1, 1,
1.419148, -0.1153109, 0.2092962, 0, 0, 0, 1, 1,
1.427432, -1.228673, 1.213601, 0, 0, 0, 1, 1,
1.433262, 0.2444233, 1.139315, 0, 0, 0, 1, 1,
1.453742, 0.1761325, 0.8467308, 0, 0, 0, 1, 1,
1.462881, -0.7408776, 0.7260857, 0, 0, 0, 1, 1,
1.467555, 0.1244551, 1.601162, 0, 0, 0, 1, 1,
1.47292, 1.303394, 1.382899, 0, 0, 0, 1, 1,
1.475586, 0.3497055, 2.995062, 1, 1, 1, 1, 1,
1.485167, 0.3464545, 3.284068, 1, 1, 1, 1, 1,
1.487006, 1.017922, 1.905647, 1, 1, 1, 1, 1,
1.487965, -0.390734, 2.53268, 1, 1, 1, 1, 1,
1.503443, 0.3401069, 1.819629, 1, 1, 1, 1, 1,
1.509116, 2.001541, -0.5186178, 1, 1, 1, 1, 1,
1.511624, 1.782324, 1.189597, 1, 1, 1, 1, 1,
1.513007, -0.71621, 1.566509, 1, 1, 1, 1, 1,
1.524886, -1.6451, 4.03113, 1, 1, 1, 1, 1,
1.531045, -1.269358, 0.761941, 1, 1, 1, 1, 1,
1.533593, 2.410362, 0.5724551, 1, 1, 1, 1, 1,
1.547772, -0.5215726, 1.547079, 1, 1, 1, 1, 1,
1.561639, 1.760327, -0.2902009, 1, 1, 1, 1, 1,
1.562437, 0.9964311, 1.890926, 1, 1, 1, 1, 1,
1.572643, 0.7793468, 1.032352, 1, 1, 1, 1, 1,
1.582249, 1.153407, 1.842178, 0, 0, 1, 1, 1,
1.596146, -2.394468, 3.324867, 1, 0, 0, 1, 1,
1.598175, -0.3596023, 0.8985474, 1, 0, 0, 1, 1,
1.599748, 1.083399, 0.004480151, 1, 0, 0, 1, 1,
1.609309, -1.24496, 3.092654, 1, 0, 0, 1, 1,
1.620352, 1.153205, 0.1601227, 1, 0, 0, 1, 1,
1.625426, 0.4013211, 1.226168, 0, 0, 0, 1, 1,
1.630626, -0.5802367, 1.612741, 0, 0, 0, 1, 1,
1.634253, 1.410199, -1.32599, 0, 0, 0, 1, 1,
1.647685, 0.6020356, 1.361902, 0, 0, 0, 1, 1,
1.700252, -0.5311375, 3.091888, 0, 0, 0, 1, 1,
1.705162, -0.8382168, 1.264544, 0, 0, 0, 1, 1,
1.712584, 0.07166252, 1.601007, 0, 0, 0, 1, 1,
1.723079, -0.0862377, 1.90952, 1, 1, 1, 1, 1,
1.768366, -0.2827697, 2.07596, 1, 1, 1, 1, 1,
1.774658, 2.003545, 1.298123, 1, 1, 1, 1, 1,
1.782591, 0.2024644, -0.8844342, 1, 1, 1, 1, 1,
1.81254, -0.2696737, 1.220246, 1, 1, 1, 1, 1,
1.814672, 1.04516, 0.1623593, 1, 1, 1, 1, 1,
1.82764, 0.7330785, 0.7295598, 1, 1, 1, 1, 1,
1.851505, 0.7300435, 1.276505, 1, 1, 1, 1, 1,
1.866291, -1.922549, 1.805063, 1, 1, 1, 1, 1,
1.873946, -0.3712404, 1.764988, 1, 1, 1, 1, 1,
1.975685, 1.005246, 0.5683168, 1, 1, 1, 1, 1,
1.988869, 0.5974095, 1.634611, 1, 1, 1, 1, 1,
2.020043, 0.5572813, 1.367835, 1, 1, 1, 1, 1,
2.050937, 0.2258184, 1.958432, 1, 1, 1, 1, 1,
2.078594, -1.518263, 3.687505, 1, 1, 1, 1, 1,
2.092174, -0.7668309, 1.355066, 0, 0, 1, 1, 1,
2.129489, 1.219858, 1.59037, 1, 0, 0, 1, 1,
2.142755, 0.5226917, 4.364972, 1, 0, 0, 1, 1,
2.143353, 1.17517, 2.375096, 1, 0, 0, 1, 1,
2.145243, 0.02486597, 1.388029, 1, 0, 0, 1, 1,
2.170337, -0.4547687, 1.672149, 1, 0, 0, 1, 1,
2.219467, 0.5163532, -0.1199039, 0, 0, 0, 1, 1,
2.258678, 0.5268899, 1.466351, 0, 0, 0, 1, 1,
2.268149, 0.3779789, 1.591145, 0, 0, 0, 1, 1,
2.291444, -3.216434, 3.540044, 0, 0, 0, 1, 1,
2.473099, -0.2765731, -1.339227, 0, 0, 0, 1, 1,
2.481, -0.8244923, 1.848267, 0, 0, 0, 1, 1,
2.506345, 1.402382, 0.9681975, 0, 0, 0, 1, 1,
2.543228, -0.4718162, 2.090096, 1, 1, 1, 1, 1,
2.595677, -0.7026796, 0.6081197, 1, 1, 1, 1, 1,
2.622356, -0.3548099, 0.7844422, 1, 1, 1, 1, 1,
2.762384, -0.9923991, 3.270838, 1, 1, 1, 1, 1,
3.013636, 0.5370123, 0.8705235, 1, 1, 1, 1, 1,
3.365324, -0.2741522, -0.2988321, 1, 1, 1, 1, 1,
3.439348, -1.040315, 1.989123, 1, 1, 1, 1, 1
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
var radius = 9.591524;
var distance = 33.68982;
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
mvMatrix.translate( -0.2940238, -0.09445858, -0.5529325 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68982);
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