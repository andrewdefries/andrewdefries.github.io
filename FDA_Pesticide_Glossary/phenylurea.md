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
-2.840025, -1.366006, -1.219097, 1, 0, 0, 1,
-2.70744, 1.792928, -1.160964, 1, 0.007843138, 0, 1,
-2.606659, 1.450868, -1.428749, 1, 0.01176471, 0, 1,
-2.606421, -0.5538735, -0.4298035, 1, 0.01960784, 0, 1,
-2.594417, -0.8103608, -0.783967, 1, 0.02352941, 0, 1,
-2.463336, -0.5366099, -1.536647, 1, 0.03137255, 0, 1,
-2.336399, -0.5916601, -1.294507, 1, 0.03529412, 0, 1,
-2.184809, -0.5145217, -2.946432, 1, 0.04313726, 0, 1,
-2.157575, -0.6295883, -2.337434, 1, 0.04705882, 0, 1,
-2.129651, 0.8672506, -3.212547, 1, 0.05490196, 0, 1,
-2.093516, -0.6081263, -1.945626, 1, 0.05882353, 0, 1,
-2.081752, -0.8258607, -1.17295, 1, 0.06666667, 0, 1,
-2.066412, -0.8063835, -1.540644, 1, 0.07058824, 0, 1,
-2.05666, -0.9162145, -3.024631, 1, 0.07843138, 0, 1,
-2.034955, -0.405425, -2.23643, 1, 0.08235294, 0, 1,
-2.02433, 0.350517, -1.195808, 1, 0.09019608, 0, 1,
-2.020919, 1.314035, -2.455796, 1, 0.09411765, 0, 1,
-2.003796, 1.095905, -0.2010083, 1, 0.1019608, 0, 1,
-1.993461, -0.7494246, -1.11053, 1, 0.1098039, 0, 1,
-1.981808, -0.1654161, -1.043164, 1, 0.1137255, 0, 1,
-1.97973, 1.169367, 1.136245, 1, 0.1215686, 0, 1,
-1.961462, 1.057119, -0.850149, 1, 0.1254902, 0, 1,
-1.95784, -1.064342, -0.3987336, 1, 0.1333333, 0, 1,
-1.942745, -1.315346, -1.74729, 1, 0.1372549, 0, 1,
-1.939714, 0.5762609, -0.6485734, 1, 0.145098, 0, 1,
-1.909967, 1.421873, -0.7999352, 1, 0.1490196, 0, 1,
-1.871966, 1.818761, -1.673301, 1, 0.1568628, 0, 1,
-1.805772, 0.8329741, 1.361391, 1, 0.1607843, 0, 1,
-1.795567, 0.1617452, -2.572567, 1, 0.1686275, 0, 1,
-1.791057, 0.3679959, -1.766325, 1, 0.172549, 0, 1,
-1.75864, 0.9143686, -1.483131, 1, 0.1803922, 0, 1,
-1.753539, -1.044825, -1.594517, 1, 0.1843137, 0, 1,
-1.724688, -1.367195, -0.7742562, 1, 0.1921569, 0, 1,
-1.680109, 0.2732002, -2.602797, 1, 0.1960784, 0, 1,
-1.67984, 0.998929, -1.918323, 1, 0.2039216, 0, 1,
-1.676339, -1.480581, -1.829625, 1, 0.2117647, 0, 1,
-1.657983, -1.126085, -2.404707, 1, 0.2156863, 0, 1,
-1.637007, -0.428481, -1.260567, 1, 0.2235294, 0, 1,
-1.626004, 1.576693, -2.458115, 1, 0.227451, 0, 1,
-1.619052, 0.7394459, -0.5000892, 1, 0.2352941, 0, 1,
-1.61835, 1.29526, -0.5741248, 1, 0.2392157, 0, 1,
-1.618039, 0.9727897, -0.7043598, 1, 0.2470588, 0, 1,
-1.609955, -0.9742701, -0.7092404, 1, 0.2509804, 0, 1,
-1.608243, 0.4929543, -0.3418509, 1, 0.2588235, 0, 1,
-1.605706, -0.3347789, -0.8952525, 1, 0.2627451, 0, 1,
-1.59659, -1.064865, -3.707953, 1, 0.2705882, 0, 1,
-1.594806, 0.4136076, -1.440415, 1, 0.2745098, 0, 1,
-1.593598, 0.8010653, 0.2165118, 1, 0.282353, 0, 1,
-1.591437, 0.3992532, -1.1546, 1, 0.2862745, 0, 1,
-1.590516, 0.7926454, -0.6450912, 1, 0.2941177, 0, 1,
-1.58359, 2.414068, -0.9003994, 1, 0.3019608, 0, 1,
-1.567438, 0.9140581, -0.01774313, 1, 0.3058824, 0, 1,
-1.562366, 1.263663, -0.8958321, 1, 0.3137255, 0, 1,
-1.553227, -1.142066, -1.84469, 1, 0.3176471, 0, 1,
-1.552465, -0.25339, -2.132653, 1, 0.3254902, 0, 1,
-1.547611, -0.9599661, -2.73762, 1, 0.3294118, 0, 1,
-1.542957, 0.09869041, -2.236751, 1, 0.3372549, 0, 1,
-1.542757, 1.599471, -0.621376, 1, 0.3411765, 0, 1,
-1.536314, -0.6950239, -1.962587, 1, 0.3490196, 0, 1,
-1.529301, -0.321631, -1.935821, 1, 0.3529412, 0, 1,
-1.520841, -1.999112, -3.098923, 1, 0.3607843, 0, 1,
-1.520161, 0.8185788, -2.135017, 1, 0.3647059, 0, 1,
-1.517747, -1.178999, -0.9123309, 1, 0.372549, 0, 1,
-1.516094, 0.6006207, -1.318215, 1, 0.3764706, 0, 1,
-1.515106, 0.3609732, -1.777483, 1, 0.3843137, 0, 1,
-1.510009, -1.222999, -3.508179, 1, 0.3882353, 0, 1,
-1.487646, -0.1846035, -0.2801815, 1, 0.3960784, 0, 1,
-1.477787, 1.338954, 0.2534347, 1, 0.4039216, 0, 1,
-1.463005, 0.9453963, -0.3561165, 1, 0.4078431, 0, 1,
-1.459961, -0.6644529, -0.8317475, 1, 0.4156863, 0, 1,
-1.459912, -0.03070019, -1.580107, 1, 0.4196078, 0, 1,
-1.451337, -0.8771734, -1.978871, 1, 0.427451, 0, 1,
-1.448978, -0.8015747, -2.343638, 1, 0.4313726, 0, 1,
-1.447573, 0.4647102, -0.4484574, 1, 0.4392157, 0, 1,
-1.435596, -0.6670864, -4.208979, 1, 0.4431373, 0, 1,
-1.432229, 1.468615, 0.7253275, 1, 0.4509804, 0, 1,
-1.419653, 1.113798, -1.639922, 1, 0.454902, 0, 1,
-1.417508, -0.09421504, -0.6982102, 1, 0.4627451, 0, 1,
-1.413579, -1.947773, -3.407072, 1, 0.4666667, 0, 1,
-1.409009, -0.6198174, -1.521471, 1, 0.4745098, 0, 1,
-1.396837, 0.6436431, -0.2130715, 1, 0.4784314, 0, 1,
-1.3825, 0.4389328, 0.08887833, 1, 0.4862745, 0, 1,
-1.378077, -0.6409018, -2.474178, 1, 0.4901961, 0, 1,
-1.373136, -2.538732, -3.290699, 1, 0.4980392, 0, 1,
-1.370669, 1.612287, -1.268633, 1, 0.5058824, 0, 1,
-1.36798, -0.3944453, -1.748653, 1, 0.509804, 0, 1,
-1.365015, -1.459877, -3.134952, 1, 0.5176471, 0, 1,
-1.36335, -0.7251143, -1.942383, 1, 0.5215687, 0, 1,
-1.344997, 1.457305, 1.72988, 1, 0.5294118, 0, 1,
-1.331362, 0.2570498, -4.159704, 1, 0.5333334, 0, 1,
-1.315566, -1.86115, -4.089846, 1, 0.5411765, 0, 1,
-1.312986, 0.256846, -1.390082, 1, 0.5450981, 0, 1,
-1.301344, -0.9738466, -2.312134, 1, 0.5529412, 0, 1,
-1.299211, 1.133811, -1.839354, 1, 0.5568628, 0, 1,
-1.299074, -1.370225, -1.417066, 1, 0.5647059, 0, 1,
-1.289284, -0.008304697, -0.1840323, 1, 0.5686275, 0, 1,
-1.282926, 2.1437, -2.098037, 1, 0.5764706, 0, 1,
-1.281896, 0.5945099, -1.272744, 1, 0.5803922, 0, 1,
-1.280871, 0.1044221, -2.251167, 1, 0.5882353, 0, 1,
-1.27627, -0.4844124, -1.782187, 1, 0.5921569, 0, 1,
-1.272527, -0.2212859, -1.006798, 1, 0.6, 0, 1,
-1.267262, -0.4183814, -1.728265, 1, 0.6078432, 0, 1,
-1.249382, -0.656085, -3.001094, 1, 0.6117647, 0, 1,
-1.234687, -0.2981676, -1.778758, 1, 0.6196079, 0, 1,
-1.233873, -0.8551891, -0.7644323, 1, 0.6235294, 0, 1,
-1.231242, -0.7113255, -0.9695117, 1, 0.6313726, 0, 1,
-1.22968, 0.5193047, 1.417692, 1, 0.6352941, 0, 1,
-1.229025, -1.065271, -3.669001, 1, 0.6431373, 0, 1,
-1.222088, -0.7328402, -1.833352, 1, 0.6470588, 0, 1,
-1.220039, -0.8624255, -1.024627, 1, 0.654902, 0, 1,
-1.213942, -0.53092, -2.515009, 1, 0.6588235, 0, 1,
-1.211302, 1.737895, -0.8931062, 1, 0.6666667, 0, 1,
-1.209608, -1.175252, -2.915449, 1, 0.6705883, 0, 1,
-1.205666, -1.099674, -4.341818, 1, 0.6784314, 0, 1,
-1.197129, 0.6929176, -1.146332, 1, 0.682353, 0, 1,
-1.194306, 0.3855913, -2.064135, 1, 0.6901961, 0, 1,
-1.189395, -0.2252686, -2.468204, 1, 0.6941177, 0, 1,
-1.18829, -1.940292, -3.346385, 1, 0.7019608, 0, 1,
-1.185683, -0.3716961, -0.7518029, 1, 0.7098039, 0, 1,
-1.182267, -0.2992726, -0.5599445, 1, 0.7137255, 0, 1,
-1.178791, -1.60392, -2.189939, 1, 0.7215686, 0, 1,
-1.17446, 0.416274, -2.204462, 1, 0.7254902, 0, 1,
-1.157711, 1.113801, -0.5047934, 1, 0.7333333, 0, 1,
-1.157506, -2.058707, -4.771526, 1, 0.7372549, 0, 1,
-1.1511, -0.9214175, -2.030269, 1, 0.7450981, 0, 1,
-1.150381, -1.348877, -0.7508882, 1, 0.7490196, 0, 1,
-1.1336, 0.01403241, -0.7726935, 1, 0.7568628, 0, 1,
-1.121914, -0.3532477, -0.345767, 1, 0.7607843, 0, 1,
-1.117959, -0.1523055, -1.184049, 1, 0.7686275, 0, 1,
-1.117895, 0.4786712, 0.9539254, 1, 0.772549, 0, 1,
-1.111327, 0.1137313, -2.897157, 1, 0.7803922, 0, 1,
-1.107696, 1.587627, -0.6150216, 1, 0.7843137, 0, 1,
-1.104012, 0.1622196, -0.9411955, 1, 0.7921569, 0, 1,
-1.10154, -1.123571, -2.755727, 1, 0.7960784, 0, 1,
-1.084832, -0.7209705, -2.737461, 1, 0.8039216, 0, 1,
-1.083632, -0.9152424, -2.316698, 1, 0.8117647, 0, 1,
-1.074224, 0.8547489, -2.23298, 1, 0.8156863, 0, 1,
-1.065246, 0.5202301, -0.1121039, 1, 0.8235294, 0, 1,
-1.06506, 0.6387452, -2.400104, 1, 0.827451, 0, 1,
-1.064762, -1.967775, -1.73748, 1, 0.8352941, 0, 1,
-1.06437, 0.5872812, -1.819062, 1, 0.8392157, 0, 1,
-1.061644, -0.3930322, -1.926585, 1, 0.8470588, 0, 1,
-1.059463, 2.250487, -1.693521, 1, 0.8509804, 0, 1,
-1.051918, 0.02710637, -2.048564, 1, 0.8588235, 0, 1,
-1.0497, -0.04642202, -1.460496, 1, 0.8627451, 0, 1,
-1.047906, 0.9796292, -2.315163, 1, 0.8705882, 0, 1,
-1.047536, -0.5924098, -1.814895, 1, 0.8745098, 0, 1,
-1.046638, -0.5414763, -1.461959, 1, 0.8823529, 0, 1,
-1.039044, 1.882142, -2.106661, 1, 0.8862745, 0, 1,
-1.037647, -0.3365034, -3.463385, 1, 0.8941177, 0, 1,
-1.03759, -0.2339151, -2.329772, 1, 0.8980392, 0, 1,
-1.034462, 0.2886288, -2.217222, 1, 0.9058824, 0, 1,
-1.026732, -0.1132937, -2.852795, 1, 0.9137255, 0, 1,
-1.017666, 1.036014, 0.6741822, 1, 0.9176471, 0, 1,
-1.017629, 1.916522, -0.3310705, 1, 0.9254902, 0, 1,
-1.016133, 0.3772302, -1.420025, 1, 0.9294118, 0, 1,
-1.011942, 1.238151, -0.1748817, 1, 0.9372549, 0, 1,
-1.007639, -0.8410717, -3.438113, 1, 0.9411765, 0, 1,
-1.007004, 0.1695505, -2.227939, 1, 0.9490196, 0, 1,
-1.005098, -1.362117, -2.192042, 1, 0.9529412, 0, 1,
-0.9961014, 0.0918725, -1.936306, 1, 0.9607843, 0, 1,
-0.9950429, -0.6740056, -1.452748, 1, 0.9647059, 0, 1,
-0.9943238, -0.2715217, -2.173729, 1, 0.972549, 0, 1,
-0.9918787, 0.4027072, -2.365764, 1, 0.9764706, 0, 1,
-0.9814965, 0.9236565, 0.06378119, 1, 0.9843137, 0, 1,
-0.9811839, 0.1328913, -0.7540934, 1, 0.9882353, 0, 1,
-0.9806536, 1.05022, 0.01421251, 1, 0.9960784, 0, 1,
-0.9743872, 0.8251686, -0.9036102, 0.9960784, 1, 0, 1,
-0.9679368, -0.2085177, -1.475864, 0.9921569, 1, 0, 1,
-0.96332, 0.4516158, -0.4206894, 0.9843137, 1, 0, 1,
-0.9627, -1.454949, -0.7959604, 0.9803922, 1, 0, 1,
-0.959259, 1.213349, -0.6495658, 0.972549, 1, 0, 1,
-0.9575285, 0.7677097, -0.456923, 0.9686275, 1, 0, 1,
-0.9562806, 1.026178, -0.6754507, 0.9607843, 1, 0, 1,
-0.9539712, -1.127647, -4.152729, 0.9568627, 1, 0, 1,
-0.9519223, -1.179445, -1.222436, 0.9490196, 1, 0, 1,
-0.9515887, 0.6669265, -0.2943508, 0.945098, 1, 0, 1,
-0.9485506, -0.4381531, 0.6134749, 0.9372549, 1, 0, 1,
-0.9453457, -0.4649475, -0.9091898, 0.9333333, 1, 0, 1,
-0.937851, 0.1034422, -2.837344, 0.9254902, 1, 0, 1,
-0.9359858, 0.3404955, -0.3402326, 0.9215686, 1, 0, 1,
-0.9348472, -0.2882897, -0.6105648, 0.9137255, 1, 0, 1,
-0.9339945, -0.1797724, -1.444254, 0.9098039, 1, 0, 1,
-0.9339309, -0.5643143, -1.059426, 0.9019608, 1, 0, 1,
-0.9338858, -0.9274101, -2.231364, 0.8941177, 1, 0, 1,
-0.9331679, -0.8627512, -2.086427, 0.8901961, 1, 0, 1,
-0.9329575, -1.293243, -2.140502, 0.8823529, 1, 0, 1,
-0.9301389, -0.1578056, -2.318501, 0.8784314, 1, 0, 1,
-0.9295584, 1.555322, -1.365095, 0.8705882, 1, 0, 1,
-0.927595, -0.9890173, -2.311174, 0.8666667, 1, 0, 1,
-0.9249015, 1.37156, -1.551407, 0.8588235, 1, 0, 1,
-0.9220623, -1.73016, -2.071387, 0.854902, 1, 0, 1,
-0.9211939, 1.60856, -0.03408147, 0.8470588, 1, 0, 1,
-0.9092453, -0.3607767, -1.372694, 0.8431373, 1, 0, 1,
-0.9042121, 0.5500969, 0.1737677, 0.8352941, 1, 0, 1,
-0.9011733, 0.2531772, -1.011606, 0.8313726, 1, 0, 1,
-0.9010358, 1.845926, 0.8446448, 0.8235294, 1, 0, 1,
-0.9005531, -0.4275746, 0.7349545, 0.8196079, 1, 0, 1,
-0.8991215, -1.018549, -1.451559, 0.8117647, 1, 0, 1,
-0.8944443, 0.8098564, -2.202242, 0.8078431, 1, 0, 1,
-0.893015, -0.4263301, -2.499317, 0.8, 1, 0, 1,
-0.891508, 0.5553977, 1.261145, 0.7921569, 1, 0, 1,
-0.8846335, -0.2465739, -1.372102, 0.7882353, 1, 0, 1,
-0.8784603, 0.3558567, -0.9899036, 0.7803922, 1, 0, 1,
-0.8774998, -0.4411308, -2.660402, 0.7764706, 1, 0, 1,
-0.874211, 0.8089835, -1.243964, 0.7686275, 1, 0, 1,
-0.8667578, 1.380684, 0.4177991, 0.7647059, 1, 0, 1,
-0.8626584, 0.7021518, -1.570133, 0.7568628, 1, 0, 1,
-0.8567911, 0.9996089, -0.6453279, 0.7529412, 1, 0, 1,
-0.8458498, 0.8934934, 0.3695273, 0.7450981, 1, 0, 1,
-0.844295, 0.02767624, -1.199641, 0.7411765, 1, 0, 1,
-0.8433915, 0.05137775, -2.791233, 0.7333333, 1, 0, 1,
-0.8416569, -0.4700392, -1.452186, 0.7294118, 1, 0, 1,
-0.8408188, 1.091488, -0.7494516, 0.7215686, 1, 0, 1,
-0.8345032, -0.9123734, -3.461204, 0.7176471, 1, 0, 1,
-0.8327375, 0.7941346, -0.6314617, 0.7098039, 1, 0, 1,
-0.8311603, 0.1036753, -0.6467595, 0.7058824, 1, 0, 1,
-0.8220994, 0.3871915, -2.193599, 0.6980392, 1, 0, 1,
-0.8204428, -1.304272, -3.137736, 0.6901961, 1, 0, 1,
-0.8188955, -0.9238117, -1.350931, 0.6862745, 1, 0, 1,
-0.81589, -1.554568, -3.061853, 0.6784314, 1, 0, 1,
-0.8095213, -0.3234611, -2.645764, 0.6745098, 1, 0, 1,
-0.808677, 0.3781147, -2.800555, 0.6666667, 1, 0, 1,
-0.8086447, 0.6998052, -0.3110184, 0.6627451, 1, 0, 1,
-0.8013188, -0.09091706, -1.754323, 0.654902, 1, 0, 1,
-0.7963544, -0.02106584, -1.220022, 0.6509804, 1, 0, 1,
-0.7963474, 1.422403, -1.936147, 0.6431373, 1, 0, 1,
-0.7826771, 1.94687, -1.593868, 0.6392157, 1, 0, 1,
-0.7699932, 1.255266, -1.45706, 0.6313726, 1, 0, 1,
-0.7688009, -0.5176014, -2.553949, 0.627451, 1, 0, 1,
-0.7618161, 1.445151, -0.2877882, 0.6196079, 1, 0, 1,
-0.7575044, -0.7411619, -0.5914047, 0.6156863, 1, 0, 1,
-0.7571923, -0.1528131, -2.505515, 0.6078432, 1, 0, 1,
-0.7568972, 0.1369675, -1.471552, 0.6039216, 1, 0, 1,
-0.7550166, 0.2490212, -0.4454777, 0.5960785, 1, 0, 1,
-0.7538328, 1.537591, -0.1475806, 0.5882353, 1, 0, 1,
-0.7515505, 0.5344271, -1.114132, 0.5843138, 1, 0, 1,
-0.7450772, 0.3068579, -1.367326, 0.5764706, 1, 0, 1,
-0.7439094, -0.0498499, -0.629559, 0.572549, 1, 0, 1,
-0.7426512, -0.1748957, -1.190226, 0.5647059, 1, 0, 1,
-0.7404835, -0.7041591, -4.0098, 0.5607843, 1, 0, 1,
-0.7387885, 0.1006726, -1.088431, 0.5529412, 1, 0, 1,
-0.7380196, -2.03017, -1.820796, 0.5490196, 1, 0, 1,
-0.7372311, -0.7759897, -1.939473, 0.5411765, 1, 0, 1,
-0.7366523, -0.3611836, -2.358082, 0.5372549, 1, 0, 1,
-0.7357921, 0.0776187, -1.595734, 0.5294118, 1, 0, 1,
-0.7342004, 0.4769598, -2.030354, 0.5254902, 1, 0, 1,
-0.7312312, -0.3241247, -2.924271, 0.5176471, 1, 0, 1,
-0.7278925, 0.6432915, 0.7006738, 0.5137255, 1, 0, 1,
-0.7201746, 0.2039099, -1.533085, 0.5058824, 1, 0, 1,
-0.7136426, -0.2664971, -1.649112, 0.5019608, 1, 0, 1,
-0.7118217, -0.6016676, -2.776314, 0.4941176, 1, 0, 1,
-0.71064, 0.08279832, -0.5745298, 0.4862745, 1, 0, 1,
-0.7078221, -1.49298, -2.691154, 0.4823529, 1, 0, 1,
-0.7006326, -1.694017, -3.076962, 0.4745098, 1, 0, 1,
-0.6987737, 1.251052, -0.2226087, 0.4705882, 1, 0, 1,
-0.6960233, 0.6284261, 0.5425544, 0.4627451, 1, 0, 1,
-0.6862146, 0.1635362, -1.792417, 0.4588235, 1, 0, 1,
-0.6706292, -0.4970325, -0.5673677, 0.4509804, 1, 0, 1,
-0.6640429, 1.33642, -0.7997484, 0.4470588, 1, 0, 1,
-0.6577353, -0.689506, -2.483875, 0.4392157, 1, 0, 1,
-0.6547156, 0.0263263, -0.2368151, 0.4352941, 1, 0, 1,
-0.6535698, -0.5634305, -2.829507, 0.427451, 1, 0, 1,
-0.6535631, 0.7921358, -0.04026541, 0.4235294, 1, 0, 1,
-0.6458563, -0.1658682, -0.3771336, 0.4156863, 1, 0, 1,
-0.6456738, -1.519865, -2.519567, 0.4117647, 1, 0, 1,
-0.641606, -0.7542542, -0.4831073, 0.4039216, 1, 0, 1,
-0.6414018, 0.6302601, -1.034819, 0.3960784, 1, 0, 1,
-0.6384817, 1.711233, 0.3607693, 0.3921569, 1, 0, 1,
-0.6382766, 0.7531627, -0.8996562, 0.3843137, 1, 0, 1,
-0.6345505, -0.01419686, -1.817713, 0.3803922, 1, 0, 1,
-0.6330614, -0.6833541, -2.097851, 0.372549, 1, 0, 1,
-0.6316673, -0.53025, -2.069962, 0.3686275, 1, 0, 1,
-0.6239098, -0.5159711, -3.207057, 0.3607843, 1, 0, 1,
-0.6165025, 0.1440035, -1.019177, 0.3568628, 1, 0, 1,
-0.6164708, 0.3098249, -2.016379, 0.3490196, 1, 0, 1,
-0.6139005, -0.8620772, -3.112146, 0.345098, 1, 0, 1,
-0.612505, 1.080234, 0.3476677, 0.3372549, 1, 0, 1,
-0.5977592, -2.416314, -2.831066, 0.3333333, 1, 0, 1,
-0.5969198, -0.4139106, -1.916521, 0.3254902, 1, 0, 1,
-0.595641, 0.323171, -1.020661, 0.3215686, 1, 0, 1,
-0.5933121, 0.6121001, -0.1144062, 0.3137255, 1, 0, 1,
-0.5909116, 1.898846, -0.9517724, 0.3098039, 1, 0, 1,
-0.5898242, 0.3917311, -1.837829, 0.3019608, 1, 0, 1,
-0.5843558, -1.93057, -2.953127, 0.2941177, 1, 0, 1,
-0.5830773, 0.008066007, -2.415597, 0.2901961, 1, 0, 1,
-0.5816125, -1.061737, -2.767531, 0.282353, 1, 0, 1,
-0.580355, 0.3411866, -1.957446, 0.2784314, 1, 0, 1,
-0.5751187, 0.9539914, -0.232819, 0.2705882, 1, 0, 1,
-0.5715348, -0.2076269, -2.442832, 0.2666667, 1, 0, 1,
-0.5707637, 0.4777396, -0.3776038, 0.2588235, 1, 0, 1,
-0.5687559, 0.05159869, -2.857343, 0.254902, 1, 0, 1,
-0.5686423, 0.2732488, -1.344587, 0.2470588, 1, 0, 1,
-0.5656869, 1.32583, -0.8151079, 0.2431373, 1, 0, 1,
-0.5611753, -1.003209, -2.822656, 0.2352941, 1, 0, 1,
-0.5595171, -1.942985, -1.988883, 0.2313726, 1, 0, 1,
-0.550937, -0.2912624, -1.294844, 0.2235294, 1, 0, 1,
-0.5470493, -1.306206, -2.1288, 0.2196078, 1, 0, 1,
-0.5448349, -1.599492, -2.296348, 0.2117647, 1, 0, 1,
-0.541504, -0.07207012, -0.6546795, 0.2078431, 1, 0, 1,
-0.5392253, -0.3299238, -2.859483, 0.2, 1, 0, 1,
-0.5383123, -0.3083533, -2.051243, 0.1921569, 1, 0, 1,
-0.5318894, -2.494538, -3.562479, 0.1882353, 1, 0, 1,
-0.5297394, 0.800033, 1.189411, 0.1803922, 1, 0, 1,
-0.5291433, -2.631662, -1.848842, 0.1764706, 1, 0, 1,
-0.529111, 1.306945, -0.906602, 0.1686275, 1, 0, 1,
-0.5277801, 0.4427004, -0.3706184, 0.1647059, 1, 0, 1,
-0.5243962, 1.451098, -0.721885, 0.1568628, 1, 0, 1,
-0.5184062, -0.2702981, -2.365579, 0.1529412, 1, 0, 1,
-0.5138508, 0.2780722, -0.7811877, 0.145098, 1, 0, 1,
-0.5071713, 1.02989, 0.4251957, 0.1411765, 1, 0, 1,
-0.5041716, 0.06316426, -2.759508, 0.1333333, 1, 0, 1,
-0.4988863, 1.923301, -0.4427074, 0.1294118, 1, 0, 1,
-0.4947312, -0.4788397, -3.037635, 0.1215686, 1, 0, 1,
-0.494329, -0.05844096, -2.762146, 0.1176471, 1, 0, 1,
-0.4915402, 0.5765585, -0.4264997, 0.1098039, 1, 0, 1,
-0.4896624, -0.8783123, -2.369113, 0.1058824, 1, 0, 1,
-0.4894617, 1.657411, 0.2232613, 0.09803922, 1, 0, 1,
-0.4885047, 1.020181, -0.8942038, 0.09019608, 1, 0, 1,
-0.4881321, 1.407088, -0.2364121, 0.08627451, 1, 0, 1,
-0.4866702, 0.02479762, -0.159309, 0.07843138, 1, 0, 1,
-0.4698635, -1.649348, -3.19126, 0.07450981, 1, 0, 1,
-0.4697405, 0.3219315, -2.21572, 0.06666667, 1, 0, 1,
-0.4671818, -0.6270382, -2.080064, 0.0627451, 1, 0, 1,
-0.4649308, 1.301968, 0.8524289, 0.05490196, 1, 0, 1,
-0.4627064, 0.2647, -1.287946, 0.05098039, 1, 0, 1,
-0.4585128, -1.403388, -4.046473, 0.04313726, 1, 0, 1,
-0.4572777, 2.495156, -1.430326, 0.03921569, 1, 0, 1,
-0.4567102, 0.4379057, -1.96748, 0.03137255, 1, 0, 1,
-0.453194, 1.371639, 0.1741946, 0.02745098, 1, 0, 1,
-0.449465, -2.058524, -3.436028, 0.01960784, 1, 0, 1,
-0.4464482, 0.8018571, -1.573057, 0.01568628, 1, 0, 1,
-0.4432442, 1.188874, -1.254756, 0.007843138, 1, 0, 1,
-0.4338579, -0.3547831, -2.066122, 0.003921569, 1, 0, 1,
-0.4313132, 0.4184409, -0.6851097, 0, 1, 0.003921569, 1,
-0.4285264, -0.2958874, -1.765934, 0, 1, 0.01176471, 1,
-0.4202396, -2.633571, -1.664809, 0, 1, 0.01568628, 1,
-0.4180268, -1.94273, -1.330555, 0, 1, 0.02352941, 1,
-0.4175497, 1.823152, -0.6381599, 0, 1, 0.02745098, 1,
-0.4166804, -1.103449, -1.493209, 0, 1, 0.03529412, 1,
-0.4160924, 0.4232937, -1.431274, 0, 1, 0.03921569, 1,
-0.4139505, -0.6454971, -1.958696, 0, 1, 0.04705882, 1,
-0.4135608, -0.7225307, -3.790023, 0, 1, 0.05098039, 1,
-0.4095594, -0.4176396, -1.97912, 0, 1, 0.05882353, 1,
-0.4084529, 1.067421, 0.7406965, 0, 1, 0.0627451, 1,
-0.4070256, 1.04483, 0.4155479, 0, 1, 0.07058824, 1,
-0.4060896, -0.2561083, -1.814502, 0, 1, 0.07450981, 1,
-0.4036937, -0.9341558, -3.063611, 0, 1, 0.08235294, 1,
-0.3983784, -1.015358, -3.075294, 0, 1, 0.08627451, 1,
-0.3928602, 0.5627214, -0.07267792, 0, 1, 0.09411765, 1,
-0.3917071, -1.30374, -4.56215, 0, 1, 0.1019608, 1,
-0.389012, 0.1191104, -0.1615535, 0, 1, 0.1058824, 1,
-0.3880936, -1.901169, -4.688967, 0, 1, 0.1137255, 1,
-0.3865528, -0.05879877, -1.867713, 0, 1, 0.1176471, 1,
-0.3863978, 0.5565091, -1.609837, 0, 1, 0.1254902, 1,
-0.3862323, -0.8541572, -2.446881, 0, 1, 0.1294118, 1,
-0.3857357, 1.866214, 0.3723014, 0, 1, 0.1372549, 1,
-0.385045, -1.535498, -3.609988, 0, 1, 0.1411765, 1,
-0.3844879, 1.173337, -0.7246009, 0, 1, 0.1490196, 1,
-0.384123, -0.1221607, -2.034952, 0, 1, 0.1529412, 1,
-0.382725, 0.3269651, -1.979541, 0, 1, 0.1607843, 1,
-0.3826811, 0.9430938, 0.8163897, 0, 1, 0.1647059, 1,
-0.3815002, -0.8155106, -1.916866, 0, 1, 0.172549, 1,
-0.3789879, 0.1964168, -0.0765373, 0, 1, 0.1764706, 1,
-0.37628, 0.5439792, -1.250842, 0, 1, 0.1843137, 1,
-0.3738176, -0.7622233, -2.784505, 0, 1, 0.1882353, 1,
-0.3730856, 0.557939, -0.9215661, 0, 1, 0.1960784, 1,
-0.3696394, -0.8243701, -2.685798, 0, 1, 0.2039216, 1,
-0.3686576, 0.8605996, -0.2976025, 0, 1, 0.2078431, 1,
-0.3659268, 0.134594, -0.5926268, 0, 1, 0.2156863, 1,
-0.3644463, 1.008811, -0.01578807, 0, 1, 0.2196078, 1,
-0.3628902, -0.86871, -2.756014, 0, 1, 0.227451, 1,
-0.3608897, 0.726745, -0.8707942, 0, 1, 0.2313726, 1,
-0.354126, 0.3779559, -1.642143, 0, 1, 0.2392157, 1,
-0.3533094, 0.06897925, -2.047179, 0, 1, 0.2431373, 1,
-0.3492194, 0.275362, -0.2334742, 0, 1, 0.2509804, 1,
-0.3464675, 0.6764421, -1.182398, 0, 1, 0.254902, 1,
-0.3435821, -1.46514, -2.891386, 0, 1, 0.2627451, 1,
-0.3346729, -0.6598817, -1.865595, 0, 1, 0.2666667, 1,
-0.3326235, 1.483776, -0.02378653, 0, 1, 0.2745098, 1,
-0.3310303, -0.4207934, -3.604855, 0, 1, 0.2784314, 1,
-0.3223561, -0.5677804, -3.186289, 0, 1, 0.2862745, 1,
-0.31936, 0.08282977, -2.425669, 0, 1, 0.2901961, 1,
-0.3162849, -1.98702, -2.017526, 0, 1, 0.2980392, 1,
-0.3148581, 1.284508, -0.1514185, 0, 1, 0.3058824, 1,
-0.3127736, 0.9423046, -1.61286, 0, 1, 0.3098039, 1,
-0.3084846, 0.6010514, -1.917105, 0, 1, 0.3176471, 1,
-0.3003564, 0.6582893, 0.07165205, 0, 1, 0.3215686, 1,
-0.2965291, 0.219235, -0.3079068, 0, 1, 0.3294118, 1,
-0.2934761, 1.138703, 0.4275635, 0, 1, 0.3333333, 1,
-0.2922078, 1.13747, -0.4743001, 0, 1, 0.3411765, 1,
-0.2890137, 1.093068, -0.3073368, 0, 1, 0.345098, 1,
-0.2834257, 1.427513, -0.4547044, 0, 1, 0.3529412, 1,
-0.2810947, -0.3510216, -1.403244, 0, 1, 0.3568628, 1,
-0.2804538, 0.4124722, -1.861295, 0, 1, 0.3647059, 1,
-0.2785691, -0.6667131, -3.023682, 0, 1, 0.3686275, 1,
-0.2749542, -1.491042, -3.005816, 0, 1, 0.3764706, 1,
-0.2704298, -0.8026538, -1.147781, 0, 1, 0.3803922, 1,
-0.2692076, 0.04069144, -3.398682, 0, 1, 0.3882353, 1,
-0.2605728, 0.0005916574, -1.689351, 0, 1, 0.3921569, 1,
-0.2526066, 0.2409528, -1.454214, 0, 1, 0.4, 1,
-0.2516888, -0.04284128, -2.325406, 0, 1, 0.4078431, 1,
-0.2507329, -0.6639647, -0.9756162, 0, 1, 0.4117647, 1,
-0.2478693, 0.5763503, 0.7682278, 0, 1, 0.4196078, 1,
-0.2463074, 0.2482464, -1.643865, 0, 1, 0.4235294, 1,
-0.2452311, 0.386173, -0.8046752, 0, 1, 0.4313726, 1,
-0.2445112, -0.3754041, -1.816268, 0, 1, 0.4352941, 1,
-0.2440079, 0.05246837, -1.575901, 0, 1, 0.4431373, 1,
-0.240262, -1.000061, -4.603794, 0, 1, 0.4470588, 1,
-0.2401371, -1.615207, -3.461938, 0, 1, 0.454902, 1,
-0.2377988, -0.5591806, -3.778747, 0, 1, 0.4588235, 1,
-0.2343123, -0.6606051, -2.024649, 0, 1, 0.4666667, 1,
-0.2257082, -0.04529944, -2.454506, 0, 1, 0.4705882, 1,
-0.2234454, -0.296751, -3.197584, 0, 1, 0.4784314, 1,
-0.2206015, 2.913399, 0.6129444, 0, 1, 0.4823529, 1,
-0.2205459, 1.242059, -0.8624474, 0, 1, 0.4901961, 1,
-0.219801, -1.988121, -3.537289, 0, 1, 0.4941176, 1,
-0.2196115, 1.346078, 1.162871, 0, 1, 0.5019608, 1,
-0.2169014, 0.3391617, -0.4536234, 0, 1, 0.509804, 1,
-0.216498, -0.7802268, -3.461925, 0, 1, 0.5137255, 1,
-0.2121376, -0.5056121, -1.279705, 0, 1, 0.5215687, 1,
-0.2045079, 0.9397324, 0.2574324, 0, 1, 0.5254902, 1,
-0.2010585, 0.1872268, -0.5607203, 0, 1, 0.5333334, 1,
-0.2006122, 0.596154, -1.150007, 0, 1, 0.5372549, 1,
-0.1917518, -2.288565, -1.96601, 0, 1, 0.5450981, 1,
-0.1913283, -0.9066343, -3.478668, 0, 1, 0.5490196, 1,
-0.1859563, 0.7621405, -0.5189306, 0, 1, 0.5568628, 1,
-0.1830855, 1.289047, 0.9339618, 0, 1, 0.5607843, 1,
-0.1814492, 1.615223, 2.235852, 0, 1, 0.5686275, 1,
-0.1799188, -0.809133, -1.824945, 0, 1, 0.572549, 1,
-0.1795071, 0.5375345, -1.091273, 0, 1, 0.5803922, 1,
-0.1703806, 0.6806622, -1.23109, 0, 1, 0.5843138, 1,
-0.1703158, 1.683645, -1.738881, 0, 1, 0.5921569, 1,
-0.1694839, -0.4140713, -3.834971, 0, 1, 0.5960785, 1,
-0.1677811, 0.2477934, 0.7169604, 0, 1, 0.6039216, 1,
-0.1669762, -0.2579903, -1.373237, 0, 1, 0.6117647, 1,
-0.1645795, 0.109639, 0.4790593, 0, 1, 0.6156863, 1,
-0.1638222, 0.7384676, -0.1561726, 0, 1, 0.6235294, 1,
-0.1593496, -1.256058, -3.456921, 0, 1, 0.627451, 1,
-0.1591051, -0.5244704, -4.404425, 0, 1, 0.6352941, 1,
-0.1526731, 0.2376173, -0.04924453, 0, 1, 0.6392157, 1,
-0.1524087, -0.5102825, -0.6567768, 0, 1, 0.6470588, 1,
-0.1491428, 0.9476318, 0.06574892, 0, 1, 0.6509804, 1,
-0.1466631, 1.200217, -0.5846555, 0, 1, 0.6588235, 1,
-0.1463046, 0.5954342, -0.2594909, 0, 1, 0.6627451, 1,
-0.144737, -0.07965297, -2.954201, 0, 1, 0.6705883, 1,
-0.1412595, 1.542051, 0.2712957, 0, 1, 0.6745098, 1,
-0.1405579, 1.60625, 0.8593031, 0, 1, 0.682353, 1,
-0.1372049, -0.5276473, -4.579561, 0, 1, 0.6862745, 1,
-0.1363172, 0.700215, -0.5483733, 0, 1, 0.6941177, 1,
-0.1299539, 0.7796056, -0.4240362, 0, 1, 0.7019608, 1,
-0.1240276, -1.356582, -2.604158, 0, 1, 0.7058824, 1,
-0.1228108, -0.005268968, -0.07315188, 0, 1, 0.7137255, 1,
-0.1189997, -1.572629, -1.641076, 0, 1, 0.7176471, 1,
-0.1186658, 0.053005, -0.823134, 0, 1, 0.7254902, 1,
-0.1185312, 0.7473987, 0.1748675, 0, 1, 0.7294118, 1,
-0.1181178, 0.5117489, -1.399196, 0, 1, 0.7372549, 1,
-0.1147557, 0.388624, -1.507714, 0, 1, 0.7411765, 1,
-0.1110003, 2.202106, 1.129371, 0, 1, 0.7490196, 1,
-0.1106124, 0.6831851, -0.4146333, 0, 1, 0.7529412, 1,
-0.1090825, 2.191462, -0.2198849, 0, 1, 0.7607843, 1,
-0.105166, 2.176174, 0.4321728, 0, 1, 0.7647059, 1,
-0.1022068, -0.815645, -4.773671, 0, 1, 0.772549, 1,
-0.09960669, -0.7969941, -2.330923, 0, 1, 0.7764706, 1,
-0.09851191, 0.3509407, -0.5632228, 0, 1, 0.7843137, 1,
-0.09444491, -0.4078096, -3.175593, 0, 1, 0.7882353, 1,
-0.09046335, -0.7470013, -2.117047, 0, 1, 0.7960784, 1,
-0.08921976, 0.703052, -0.5367605, 0, 1, 0.8039216, 1,
-0.08761568, 0.2324504, -1.64836, 0, 1, 0.8078431, 1,
-0.07513353, 0.3468066, 0.5648921, 0, 1, 0.8156863, 1,
-0.06797413, 1.872541, 0.1753417, 0, 1, 0.8196079, 1,
-0.06755997, -0.04028508, -1.148364, 0, 1, 0.827451, 1,
-0.05972707, -0.480092, -2.145564, 0, 1, 0.8313726, 1,
-0.05740432, 0.4233624, 0.5789071, 0, 1, 0.8392157, 1,
-0.05697889, 0.2251628, -0.794398, 0, 1, 0.8431373, 1,
-0.05481502, 0.7026627, -0.9784523, 0, 1, 0.8509804, 1,
-0.05217734, 0.4406449, 0.7705008, 0, 1, 0.854902, 1,
-0.051724, 0.1391533, -0.01540136, 0, 1, 0.8627451, 1,
-0.04368806, 1.569651, 0.2429109, 0, 1, 0.8666667, 1,
-0.04219598, 0.2932582, -0.1969325, 0, 1, 0.8745098, 1,
-0.04082071, -2.183841, -2.721005, 0, 1, 0.8784314, 1,
-0.04014623, -1.017669, -2.399844, 0, 1, 0.8862745, 1,
-0.03951525, -0.9157324, -3.698391, 0, 1, 0.8901961, 1,
-0.03440424, 0.8638743, -1.021544, 0, 1, 0.8980392, 1,
-0.0338827, 0.8572972, 0.200121, 0, 1, 0.9058824, 1,
-0.03139745, -0.5295939, -1.736801, 0, 1, 0.9098039, 1,
-0.02792398, -2.152437, -4.242874, 0, 1, 0.9176471, 1,
-0.02744533, 0.9777403, -0.09981722, 0, 1, 0.9215686, 1,
-0.02640846, -0.6452865, -3.412668, 0, 1, 0.9294118, 1,
-0.02516924, 1.049865, -1.967802, 0, 1, 0.9333333, 1,
-0.02420931, -0.3867857, -4.753811, 0, 1, 0.9411765, 1,
-0.02307152, 1.713637, -0.2921649, 0, 1, 0.945098, 1,
-0.02302929, -1.014664, -3.557965, 0, 1, 0.9529412, 1,
-0.02042152, 0.356342, 1.075883, 0, 1, 0.9568627, 1,
-0.005868887, 0.2862245, -1.171456, 0, 1, 0.9647059, 1,
-0.003353764, -0.7681009, -3.082643, 0, 1, 0.9686275, 1,
-0.002493071, 1.302253, 0.782308, 0, 1, 0.9764706, 1,
0.001502535, 0.2270366, -0.7083309, 0, 1, 0.9803922, 1,
0.003585565, -1.301274, 3.166167, 0, 1, 0.9882353, 1,
0.00509253, 1.441576, 1.478477, 0, 1, 0.9921569, 1,
0.005905271, 0.04178037, 0.6634904, 0, 1, 1, 1,
0.009862175, -0.3019278, 2.141071, 0, 0.9921569, 1, 1,
0.01010244, 1.33285, -1.089204, 0, 0.9882353, 1, 1,
0.01626495, 0.2812145, 1.584492, 0, 0.9803922, 1, 1,
0.02020819, -0.5316306, 4.64898, 0, 0.9764706, 1, 1,
0.02567484, -0.05574413, 3.221882, 0, 0.9686275, 1, 1,
0.02706598, -0.7925857, 3.6634, 0, 0.9647059, 1, 1,
0.02988971, 0.7170274, 0.4958593, 0, 0.9568627, 1, 1,
0.03736878, 1.198344, -1.756145, 0, 0.9529412, 1, 1,
0.03945012, -0.1813464, 2.99272, 0, 0.945098, 1, 1,
0.04048376, -0.05134092, 4.174527, 0, 0.9411765, 1, 1,
0.04730071, 0.4308754, 0.4901624, 0, 0.9333333, 1, 1,
0.04775249, 2.102441, 0.2636799, 0, 0.9294118, 1, 1,
0.05467612, 0.6557164, 0.5617889, 0, 0.9215686, 1, 1,
0.05484181, 0.04963797, -0.3610612, 0, 0.9176471, 1, 1,
0.05649524, -0.4946863, 2.750296, 0, 0.9098039, 1, 1,
0.05855523, 2.112915, 0.799113, 0, 0.9058824, 1, 1,
0.05900395, 1.491152, 1.008182, 0, 0.8980392, 1, 1,
0.05969375, -0.599359, 3.773017, 0, 0.8901961, 1, 1,
0.06449585, -0.1499415, 2.242921, 0, 0.8862745, 1, 1,
0.06917773, 0.2533941, 1.159442, 0, 0.8784314, 1, 1,
0.07227605, -0.1918935, 3.618695, 0, 0.8745098, 1, 1,
0.07688884, -0.5446522, 1.926914, 0, 0.8666667, 1, 1,
0.07885153, -0.06791132, 1.408976, 0, 0.8627451, 1, 1,
0.08320363, -0.24963, 3.90379, 0, 0.854902, 1, 1,
0.08341365, 0.5187113, 0.257705, 0, 0.8509804, 1, 1,
0.08696919, 2.113007, 1.148666, 0, 0.8431373, 1, 1,
0.08757517, 0.3697493, 1.803691, 0, 0.8392157, 1, 1,
0.08971933, -0.3862804, 3.697141, 0, 0.8313726, 1, 1,
0.09124011, -1.213194, 1.349562, 0, 0.827451, 1, 1,
0.09126078, -1.67484, 1.678729, 0, 0.8196079, 1, 1,
0.09410886, -1.024847, 2.509961, 0, 0.8156863, 1, 1,
0.09722896, -1.135383, 2.105069, 0, 0.8078431, 1, 1,
0.097731, -0.5006313, 3.172287, 0, 0.8039216, 1, 1,
0.1027526, 1.223443, 1.355438, 0, 0.7960784, 1, 1,
0.1059829, 0.896574, -0.2654978, 0, 0.7882353, 1, 1,
0.1077294, 0.1456239, 1.920516, 0, 0.7843137, 1, 1,
0.1091979, 0.1824725, 0.3118771, 0, 0.7764706, 1, 1,
0.110092, -1.556919, 2.709963, 0, 0.772549, 1, 1,
0.1125609, 0.1150159, 1.024786, 0, 0.7647059, 1, 1,
0.1131892, -2.035577, 3.429123, 0, 0.7607843, 1, 1,
0.1134484, -0.756379, 3.418742, 0, 0.7529412, 1, 1,
0.1135388, -0.4928209, 4.233259, 0, 0.7490196, 1, 1,
0.1214488, -0.09077635, 1.397174, 0, 0.7411765, 1, 1,
0.1227339, -1.289482, 4.772812, 0, 0.7372549, 1, 1,
0.1238054, 0.003852495, 0.3802285, 0, 0.7294118, 1, 1,
0.126572, 0.4190484, 1.010346, 0, 0.7254902, 1, 1,
0.1296443, 0.7700867, -0.6238075, 0, 0.7176471, 1, 1,
0.1339894, -0.6745668, 3.235704, 0, 0.7137255, 1, 1,
0.1346721, -2.105205, 2.639131, 0, 0.7058824, 1, 1,
0.1352154, -0.8297607, 4.557037, 0, 0.6980392, 1, 1,
0.137316, 0.1522269, 0.3343774, 0, 0.6941177, 1, 1,
0.1439345, 0.4096798, -0.004889893, 0, 0.6862745, 1, 1,
0.1452821, -0.8101909, 2.958164, 0, 0.682353, 1, 1,
0.1472053, -0.7958843, 1.260256, 0, 0.6745098, 1, 1,
0.1500372, -0.9376622, 3.052357, 0, 0.6705883, 1, 1,
0.1501507, 0.2276777, 0.8021657, 0, 0.6627451, 1, 1,
0.1528445, 1.19932, -0.07394488, 0, 0.6588235, 1, 1,
0.157222, 1.550441, -0.4570858, 0, 0.6509804, 1, 1,
0.1633741, -0.05618102, 2.785398, 0, 0.6470588, 1, 1,
0.1709829, -0.5862458, 3.024425, 0, 0.6392157, 1, 1,
0.17411, 1.058771, 0.03877686, 0, 0.6352941, 1, 1,
0.1744161, 0.2873421, 1.191367, 0, 0.627451, 1, 1,
0.1761118, -1.175376, 3.86413, 0, 0.6235294, 1, 1,
0.176826, -0.05470756, 0.4690756, 0, 0.6156863, 1, 1,
0.1837267, 0.07717805, 2.076486, 0, 0.6117647, 1, 1,
0.187025, 0.4142803, -0.6915466, 0, 0.6039216, 1, 1,
0.1880712, 0.6012087, 0.05245785, 0, 0.5960785, 1, 1,
0.1927226, -0.8800747, 3.0581, 0, 0.5921569, 1, 1,
0.1965898, 0.5076065, 0.30384, 0, 0.5843138, 1, 1,
0.2009648, -0.4986048, 4.588594, 0, 0.5803922, 1, 1,
0.2012533, 0.5862962, 0.8558921, 0, 0.572549, 1, 1,
0.202324, -0.07549705, 3.708605, 0, 0.5686275, 1, 1,
0.2113856, -0.3338464, 1.100031, 0, 0.5607843, 1, 1,
0.2129604, -0.1384439, 2.313072, 0, 0.5568628, 1, 1,
0.2142039, -0.3572583, 3.093815, 0, 0.5490196, 1, 1,
0.2170548, -0.5968821, 1.872442, 0, 0.5450981, 1, 1,
0.2177489, 2.302465, -0.6265185, 0, 0.5372549, 1, 1,
0.2189396, -1.002536, 2.423267, 0, 0.5333334, 1, 1,
0.2189602, -0.8186044, 2.559581, 0, 0.5254902, 1, 1,
0.2195557, -1.490403, 3.252412, 0, 0.5215687, 1, 1,
0.2219995, -1.519316, 3.143194, 0, 0.5137255, 1, 1,
0.2244905, 0.4771297, 0.1871278, 0, 0.509804, 1, 1,
0.2262668, -1.108205, 2.727745, 0, 0.5019608, 1, 1,
0.2266275, -0.6540299, 2.620221, 0, 0.4941176, 1, 1,
0.2269578, -1.127117, 3.102803, 0, 0.4901961, 1, 1,
0.2270388, -0.01603177, 1.824998, 0, 0.4823529, 1, 1,
0.2277192, 0.5747109, -0.6372275, 0, 0.4784314, 1, 1,
0.2290214, -1.515942, 2.159162, 0, 0.4705882, 1, 1,
0.2330701, -1.616964, 3.138942, 0, 0.4666667, 1, 1,
0.2357467, 0.0681239, 1.594363, 0, 0.4588235, 1, 1,
0.236477, -1.198568, 3.87979, 0, 0.454902, 1, 1,
0.2475363, 0.5310042, 0.9114531, 0, 0.4470588, 1, 1,
0.2485523, 0.9537814, -1.466841, 0, 0.4431373, 1, 1,
0.2487218, 0.6206016, 1.259946, 0, 0.4352941, 1, 1,
0.2503136, 0.08388881, 0.2189279, 0, 0.4313726, 1, 1,
0.253474, 1.521141, 0.0638347, 0, 0.4235294, 1, 1,
0.2581617, 0.7697573, 0.9247004, 0, 0.4196078, 1, 1,
0.2595557, 1.369211, 1.020737, 0, 0.4117647, 1, 1,
0.2598659, -0.03666134, 2.855109, 0, 0.4078431, 1, 1,
0.2606302, -0.3471779, 3.585688, 0, 0.4, 1, 1,
0.2632315, -0.659196, 2.12293, 0, 0.3921569, 1, 1,
0.2669115, -0.128883, 2.104513, 0, 0.3882353, 1, 1,
0.2701038, 0.6360092, 1.408935, 0, 0.3803922, 1, 1,
0.2727305, 1.036866, 1.643485, 0, 0.3764706, 1, 1,
0.2747812, -0.7475564, 2.661344, 0, 0.3686275, 1, 1,
0.2806771, 0.8402575, -0.453267, 0, 0.3647059, 1, 1,
0.2829288, -0.3483939, 2.176845, 0, 0.3568628, 1, 1,
0.2844539, -0.6547875, 1.522707, 0, 0.3529412, 1, 1,
0.2856249, -0.4957184, 3.029726, 0, 0.345098, 1, 1,
0.285991, -0.5024457, 3.083701, 0, 0.3411765, 1, 1,
0.286573, 0.1884529, 0.3240041, 0, 0.3333333, 1, 1,
0.2896667, 0.0007674923, 1.799398, 0, 0.3294118, 1, 1,
0.2909802, -0.1469658, 2.333341, 0, 0.3215686, 1, 1,
0.2917393, 1.526401, 1.075792, 0, 0.3176471, 1, 1,
0.2917765, 0.2567462, 1.149727, 0, 0.3098039, 1, 1,
0.2946569, -0.4112457, 2.997491, 0, 0.3058824, 1, 1,
0.2946643, 1.250668, -0.5876623, 0, 0.2980392, 1, 1,
0.2952347, -0.9623685, 1.877745, 0, 0.2901961, 1, 1,
0.2963789, -2.324705, 4.736136, 0, 0.2862745, 1, 1,
0.2991316, -1.846873, 3.469913, 0, 0.2784314, 1, 1,
0.3057583, -0.5394077, 2.52936, 0, 0.2745098, 1, 1,
0.3105152, 1.093143, 0.9640119, 0, 0.2666667, 1, 1,
0.3109362, -0.2125528, 2.907899, 0, 0.2627451, 1, 1,
0.3126919, 1.023114, 0.5263067, 0, 0.254902, 1, 1,
0.3134792, 0.8978017, -0.5830106, 0, 0.2509804, 1, 1,
0.3153846, -1.116982, 3.547387, 0, 0.2431373, 1, 1,
0.3159632, 0.2768866, -0.9717606, 0, 0.2392157, 1, 1,
0.3172466, 2.474159, -1.129602, 0, 0.2313726, 1, 1,
0.3176256, -0.2602323, 1.937904, 0, 0.227451, 1, 1,
0.3190468, -0.06516333, 4.51863, 0, 0.2196078, 1, 1,
0.3225543, 0.2951164, 0.4831851, 0, 0.2156863, 1, 1,
0.3231012, -1.239959, 2.859094, 0, 0.2078431, 1, 1,
0.324239, -1.460506, 4.543229, 0, 0.2039216, 1, 1,
0.327392, 0.9819906, 0.2027011, 0, 0.1960784, 1, 1,
0.3314564, -0.5528934, 2.141474, 0, 0.1882353, 1, 1,
0.3338643, 1.234991, -1.358047, 0, 0.1843137, 1, 1,
0.3354512, 1.374694, 0.7024338, 0, 0.1764706, 1, 1,
0.3361763, -2.535125, 3.140138, 0, 0.172549, 1, 1,
0.3435072, 0.04291517, 1.881701, 0, 0.1647059, 1, 1,
0.3454759, 0.3923122, 1.361029, 0, 0.1607843, 1, 1,
0.3478577, 0.1113003, -0.7052395, 0, 0.1529412, 1, 1,
0.3481753, -1.108313, 2.665862, 0, 0.1490196, 1, 1,
0.3506801, -1.025621, 1.220775, 0, 0.1411765, 1, 1,
0.3528308, -0.4896671, 2.351791, 0, 0.1372549, 1, 1,
0.3543589, 0.4392664, 0.05590869, 0, 0.1294118, 1, 1,
0.3551004, -0.4792506, 3.072027, 0, 0.1254902, 1, 1,
0.358642, 0.009415195, 1.187543, 0, 0.1176471, 1, 1,
0.3665752, 0.1525626, 1.944966, 0, 0.1137255, 1, 1,
0.3715918, 0.1733904, 0.2653095, 0, 0.1058824, 1, 1,
0.3719605, -1.444669, 2.122318, 0, 0.09803922, 1, 1,
0.3742396, 0.8155851, 1.333097, 0, 0.09411765, 1, 1,
0.3790136, -0.9646741, 3.537232, 0, 0.08627451, 1, 1,
0.3804441, 0.08201071, 0.396253, 0, 0.08235294, 1, 1,
0.3815874, 0.655786, 0.04488559, 0, 0.07450981, 1, 1,
0.3844181, -0.5905037, 2.335397, 0, 0.07058824, 1, 1,
0.3854726, -1.326204, 2.84934, 0, 0.0627451, 1, 1,
0.3860324, -0.7918295, 2.160789, 0, 0.05882353, 1, 1,
0.3861929, 0.09167378, 1.145177, 0, 0.05098039, 1, 1,
0.3883446, -0.6995554, 1.775878, 0, 0.04705882, 1, 1,
0.3972057, 0.3751367, -0.3501112, 0, 0.03921569, 1, 1,
0.397915, -2.570451, 2.223595, 0, 0.03529412, 1, 1,
0.3988507, -0.9996694, 2.428681, 0, 0.02745098, 1, 1,
0.4019557, 0.3156312, -0.6433992, 0, 0.02352941, 1, 1,
0.4062997, -1.097565, 3.459914, 0, 0.01568628, 1, 1,
0.4064908, -0.5326707, 3.498233, 0, 0.01176471, 1, 1,
0.4102345, 0.618103, 0.3145475, 0, 0.003921569, 1, 1,
0.4151258, -1.962603, 2.943852, 0.003921569, 0, 1, 1,
0.4175891, -0.1287544, 0.4904607, 0.007843138, 0, 1, 1,
0.4214188, -0.112991, 2.53121, 0.01568628, 0, 1, 1,
0.4214295, 1.806141, 0.4217345, 0.01960784, 0, 1, 1,
0.4216097, -1.993899, 3.848652, 0.02745098, 0, 1, 1,
0.4238766, 0.08136287, 2.566498, 0.03137255, 0, 1, 1,
0.4253036, -0.2571305, 3.360193, 0.03921569, 0, 1, 1,
0.4269865, 0.2698569, 1.30327, 0.04313726, 0, 1, 1,
0.4330072, 0.5595555, -0.8875235, 0.05098039, 0, 1, 1,
0.4356741, -1.340788, 2.272671, 0.05490196, 0, 1, 1,
0.4373664, 0.5218855, 0.4759124, 0.0627451, 0, 1, 1,
0.4388943, 1.058102, 1.972826, 0.06666667, 0, 1, 1,
0.4400524, 1.615094, -0.03665847, 0.07450981, 0, 1, 1,
0.4403824, 1.11832, 0.5265541, 0.07843138, 0, 1, 1,
0.440976, -0.03033481, 1.375168, 0.08627451, 0, 1, 1,
0.4443516, 1.253966, 0.1697068, 0.09019608, 0, 1, 1,
0.445406, -0.2221175, 3.039913, 0.09803922, 0, 1, 1,
0.4470103, -1.640287, 2.269758, 0.1058824, 0, 1, 1,
0.4481885, -0.05050968, 0.7988393, 0.1098039, 0, 1, 1,
0.4507349, -0.7360145, 3.555143, 0.1176471, 0, 1, 1,
0.4508123, -0.5909959, 3.76615, 0.1215686, 0, 1, 1,
0.4544566, 1.555154, 0.1998135, 0.1294118, 0, 1, 1,
0.4575624, -1.638051, 2.390002, 0.1333333, 0, 1, 1,
0.4577377, -0.3066431, 2.785713, 0.1411765, 0, 1, 1,
0.4588583, 0.6506152, 0.6527519, 0.145098, 0, 1, 1,
0.4615678, -0.5881361, 1.850543, 0.1529412, 0, 1, 1,
0.4629607, -1.357915, 2.988254, 0.1568628, 0, 1, 1,
0.4647885, 1.37707, -0.965329, 0.1647059, 0, 1, 1,
0.4666834, 0.09967633, 2.452152, 0.1686275, 0, 1, 1,
0.4745872, -1.21817, 4.743205, 0.1764706, 0, 1, 1,
0.4756871, -0.2867427, 0.7011868, 0.1803922, 0, 1, 1,
0.4802317, 0.8166445, 0.3870995, 0.1882353, 0, 1, 1,
0.483519, -1.817544, 2.176737, 0.1921569, 0, 1, 1,
0.4839821, -0.1453148, 1.260559, 0.2, 0, 1, 1,
0.490517, -0.9001123, 3.358858, 0.2078431, 0, 1, 1,
0.496894, 0.5059723, -0.6531553, 0.2117647, 0, 1, 1,
0.5000084, -0.09699665, 1.293772, 0.2196078, 0, 1, 1,
0.5009181, 0.2774358, 0.3126401, 0.2235294, 0, 1, 1,
0.5037233, 0.03786463, 0.434361, 0.2313726, 0, 1, 1,
0.5045609, 0.4765925, -0.6365993, 0.2352941, 0, 1, 1,
0.5116312, -1.16085, 2.019745, 0.2431373, 0, 1, 1,
0.5142785, 0.002774903, 1.697139, 0.2470588, 0, 1, 1,
0.5222481, -0.4644519, 1.51524, 0.254902, 0, 1, 1,
0.5287368, -0.2517714, 1.139814, 0.2588235, 0, 1, 1,
0.5294033, -0.03095478, 1.83716, 0.2666667, 0, 1, 1,
0.5358285, 0.43559, 0.3690803, 0.2705882, 0, 1, 1,
0.5448901, -0.5862278, 1.147163, 0.2784314, 0, 1, 1,
0.5485312, -1.23171, 2.795505, 0.282353, 0, 1, 1,
0.5590022, -3.460674, 3.554487, 0.2901961, 0, 1, 1,
0.5603608, -0.3743499, 2.652274, 0.2941177, 0, 1, 1,
0.5642086, 0.00492812, 1.856754, 0.3019608, 0, 1, 1,
0.5655503, -2.179811, 2.168518, 0.3098039, 0, 1, 1,
0.5667323, -0.208412, 1.035293, 0.3137255, 0, 1, 1,
0.567057, -0.219499, 2.212049, 0.3215686, 0, 1, 1,
0.5674589, 0.3203382, 2.004706, 0.3254902, 0, 1, 1,
0.5837942, 0.07053532, 2.196777, 0.3333333, 0, 1, 1,
0.5839456, -0.8366747, 2.712007, 0.3372549, 0, 1, 1,
0.5862625, 0.9676644, 0.8622157, 0.345098, 0, 1, 1,
0.5876566, 2.279922, 1.445647, 0.3490196, 0, 1, 1,
0.5910415, 1.399357, -0.8729009, 0.3568628, 0, 1, 1,
0.5919909, -0.8855975, 1.448224, 0.3607843, 0, 1, 1,
0.5997759, -0.1955708, 0.9336191, 0.3686275, 0, 1, 1,
0.6018343, 0.937277, 0.8388186, 0.372549, 0, 1, 1,
0.6055978, 0.1499017, 0.4322438, 0.3803922, 0, 1, 1,
0.6060355, -0.8704457, 1.485996, 0.3843137, 0, 1, 1,
0.6062849, -0.04567677, 3.066587, 0.3921569, 0, 1, 1,
0.6087891, -0.6499357, 3.509974, 0.3960784, 0, 1, 1,
0.6110221, 0.381794, 1.888783, 0.4039216, 0, 1, 1,
0.6133038, -0.350753, 2.990636, 0.4117647, 0, 1, 1,
0.6134062, 0.147467, 0.7758201, 0.4156863, 0, 1, 1,
0.6141698, 0.4451176, 2.405304, 0.4235294, 0, 1, 1,
0.6185168, -0.4177097, 3.694674, 0.427451, 0, 1, 1,
0.6204152, -1.141004, 2.475172, 0.4352941, 0, 1, 1,
0.6252024, -1.254809, 2.6267, 0.4392157, 0, 1, 1,
0.6283289, 1.343092, 1.235737, 0.4470588, 0, 1, 1,
0.6314177, 1.496134, -0.09759399, 0.4509804, 0, 1, 1,
0.6328777, 0.2801292, 0.9370815, 0.4588235, 0, 1, 1,
0.6333452, -2.088882, 2.934602, 0.4627451, 0, 1, 1,
0.6386427, 0.1061714, 1.167153, 0.4705882, 0, 1, 1,
0.6390353, -0.1870868, 1.877337, 0.4745098, 0, 1, 1,
0.6445099, -1.027417, 5.394528, 0.4823529, 0, 1, 1,
0.6448674, -0.6413618, 2.082966, 0.4862745, 0, 1, 1,
0.6463813, 0.5053671, 3.839558, 0.4941176, 0, 1, 1,
0.6617268, 1.420134, 2.064535, 0.5019608, 0, 1, 1,
0.6643772, -0.6237845, 3.45412, 0.5058824, 0, 1, 1,
0.6651911, -0.5381423, 0.8032216, 0.5137255, 0, 1, 1,
0.666741, -0.07943556, 1.872832, 0.5176471, 0, 1, 1,
0.6752057, 0.3327646, 1.742548, 0.5254902, 0, 1, 1,
0.6801397, -0.01410517, -0.08568099, 0.5294118, 0, 1, 1,
0.6883207, 1.750239, -0.1838879, 0.5372549, 0, 1, 1,
0.6908928, 1.194662, 0.2269668, 0.5411765, 0, 1, 1,
0.6970057, -1.337431, 2.210874, 0.5490196, 0, 1, 1,
0.6975484, 0.1110616, 1.676192, 0.5529412, 0, 1, 1,
0.7051202, -0.7830244, 1.931023, 0.5607843, 0, 1, 1,
0.7065724, -0.6977229, 2.862119, 0.5647059, 0, 1, 1,
0.7099121, -0.7792813, 1.707288, 0.572549, 0, 1, 1,
0.7102901, 0.9774703, 1.743649, 0.5764706, 0, 1, 1,
0.7124897, -1.18946, 3.072932, 0.5843138, 0, 1, 1,
0.7156931, 1.952483, -0.5037169, 0.5882353, 0, 1, 1,
0.7229509, 0.3485542, -0.4059939, 0.5960785, 0, 1, 1,
0.7307189, -1.747265, 3.629251, 0.6039216, 0, 1, 1,
0.73202, 0.6099772, 1.287212, 0.6078432, 0, 1, 1,
0.7401513, -0.3601201, 1.89692, 0.6156863, 0, 1, 1,
0.7419505, 0.3862568, 0.2127317, 0.6196079, 0, 1, 1,
0.7431054, 0.9542942, 1.439902, 0.627451, 0, 1, 1,
0.7454298, -0.4323138, 2.690112, 0.6313726, 0, 1, 1,
0.7454794, 1.419447, 0.4661943, 0.6392157, 0, 1, 1,
0.7461157, -1.757372, 1.158282, 0.6431373, 0, 1, 1,
0.7493793, -0.07324786, 1.843198, 0.6509804, 0, 1, 1,
0.7520901, 0.4342347, 0.8245337, 0.654902, 0, 1, 1,
0.7548736, -0.223001, 2.672361, 0.6627451, 0, 1, 1,
0.7569744, 0.1765818, 1.60735, 0.6666667, 0, 1, 1,
0.7620609, 0.3496589, 0.3614703, 0.6745098, 0, 1, 1,
0.7639994, 0.3564599, 0.6616271, 0.6784314, 0, 1, 1,
0.7654847, -0.1988609, 1.950456, 0.6862745, 0, 1, 1,
0.7710959, 0.8778054, 2.256905, 0.6901961, 0, 1, 1,
0.7824554, -1.427147, 3.539402, 0.6980392, 0, 1, 1,
0.7935184, -0.1557007, 3.107772, 0.7058824, 0, 1, 1,
0.7966241, -0.3418014, 3.286767, 0.7098039, 0, 1, 1,
0.7977651, -0.1787376, 3.389622, 0.7176471, 0, 1, 1,
0.8065651, 2.031595, 0.1266802, 0.7215686, 0, 1, 1,
0.807102, 0.5444876, 0.8068519, 0.7294118, 0, 1, 1,
0.810212, -0.1914393, 1.755275, 0.7333333, 0, 1, 1,
0.818629, 0.2034278, -0.1899618, 0.7411765, 0, 1, 1,
0.8188788, 1.23061, -0.6681308, 0.7450981, 0, 1, 1,
0.8367446, 1.377557, 0.1231297, 0.7529412, 0, 1, 1,
0.838003, 0.5261638, 1.755778, 0.7568628, 0, 1, 1,
0.8384568, 0.7930347, 0.274964, 0.7647059, 0, 1, 1,
0.8396524, 1.613675, -0.8514646, 0.7686275, 0, 1, 1,
0.8403702, -0.2190465, 1.82693, 0.7764706, 0, 1, 1,
0.8446854, -0.1355505, 2.421512, 0.7803922, 0, 1, 1,
0.8450119, 1.393333, 1.356974, 0.7882353, 0, 1, 1,
0.8456248, 2.246179, 0.2907085, 0.7921569, 0, 1, 1,
0.849308, -0.2228214, 1.633245, 0.8, 0, 1, 1,
0.850283, 0.6760899, 1.714243, 0.8078431, 0, 1, 1,
0.8546054, 0.2984203, 2.315083, 0.8117647, 0, 1, 1,
0.8566774, -0.9945764, 1.85423, 0.8196079, 0, 1, 1,
0.8578971, 0.8058221, 1.789448, 0.8235294, 0, 1, 1,
0.8583939, 0.8514491, 0.4623053, 0.8313726, 0, 1, 1,
0.8586144, 0.5851132, 0.1571936, 0.8352941, 0, 1, 1,
0.8633316, 0.09607975, 1.346054, 0.8431373, 0, 1, 1,
0.8668449, 0.9433819, -0.7681907, 0.8470588, 0, 1, 1,
0.8683372, 3.495768, 0.7558311, 0.854902, 0, 1, 1,
0.869975, 1.146395, 1.069399, 0.8588235, 0, 1, 1,
0.8708569, 0.3832711, 0.4928182, 0.8666667, 0, 1, 1,
0.8735567, -0.6004238, 2.070129, 0.8705882, 0, 1, 1,
0.887124, -1.034975, 1.673652, 0.8784314, 0, 1, 1,
0.8886409, -0.7484751, 4.597874, 0.8823529, 0, 1, 1,
0.8887414, -1.126115, 3.352697, 0.8901961, 0, 1, 1,
0.8953388, 0.726969, 0.8542199, 0.8941177, 0, 1, 1,
0.8972828, 0.6212333, 2.177407, 0.9019608, 0, 1, 1,
0.9037817, 0.1215484, 1.696302, 0.9098039, 0, 1, 1,
0.9044978, 1.599905, -0.6116347, 0.9137255, 0, 1, 1,
0.9074076, -0.4254441, 2.37983, 0.9215686, 0, 1, 1,
0.914139, 1.338118, -0.5674149, 0.9254902, 0, 1, 1,
0.9180835, 1.614188, 1.587603, 0.9333333, 0, 1, 1,
0.9263127, 0.2889381, 1.830987, 0.9372549, 0, 1, 1,
0.9265286, 0.3974288, 2.77726, 0.945098, 0, 1, 1,
0.9265343, 0.1079764, 1.325384, 0.9490196, 0, 1, 1,
0.9298781, 0.435352, 2.396502, 0.9568627, 0, 1, 1,
0.934329, -0.198817, 2.123823, 0.9607843, 0, 1, 1,
0.9441207, 1.51785, 1.252365, 0.9686275, 0, 1, 1,
0.95005, 1.615759, 2.494497, 0.972549, 0, 1, 1,
0.9524906, -1.407677, 2.909886, 0.9803922, 0, 1, 1,
0.9527656, -1.18897, 3.383912, 0.9843137, 0, 1, 1,
0.9577596, -0.9304155, 2.916243, 0.9921569, 0, 1, 1,
0.9602712, -1.26268, 0.02874202, 0.9960784, 0, 1, 1,
0.9672205, 0.1977402, -0.598336, 1, 0, 0.9960784, 1,
0.9683607, -0.01434434, 1.29264, 1, 0, 0.9882353, 1,
0.9687153, -1.303669, 1.260992, 1, 0, 0.9843137, 1,
0.9736235, -0.7134414, 3.337738, 1, 0, 0.9764706, 1,
0.9746801, 1.430108, -0.5492495, 1, 0, 0.972549, 1,
0.9771038, -1.846966, 2.933939, 1, 0, 0.9647059, 1,
0.9799474, -0.9276512, 3.847026, 1, 0, 0.9607843, 1,
0.9840962, -0.05486437, 0.4135234, 1, 0, 0.9529412, 1,
0.9914192, 0.3186523, 1.790561, 1, 0, 0.9490196, 1,
0.992061, 0.4516191, 1.779656, 1, 0, 0.9411765, 1,
0.9953943, 0.7968492, 1.560429, 1, 0, 0.9372549, 1,
1.000663, -1.018848, 3.838404, 1, 0, 0.9294118, 1,
1.001205, -1.012361, 3.128689, 1, 0, 0.9254902, 1,
1.002255, -0.2210846, 2.745528, 1, 0, 0.9176471, 1,
1.006855, 0.7712806, -0.848124, 1, 0, 0.9137255, 1,
1.00857, 0.02718847, 0.9802755, 1, 0, 0.9058824, 1,
1.009747, -0.2305824, 2.806819, 1, 0, 0.9019608, 1,
1.011364, 0.270862, 2.378279, 1, 0, 0.8941177, 1,
1.01377, 0.9957342, 0.9720038, 1, 0, 0.8862745, 1,
1.014556, -0.3049897, 2.502227, 1, 0, 0.8823529, 1,
1.014655, 0.1960292, 2.249212, 1, 0, 0.8745098, 1,
1.016621, 0.5892209, -0.0303932, 1, 0, 0.8705882, 1,
1.023782, 0.385746, -0.1058232, 1, 0, 0.8627451, 1,
1.027508, 1.472322, 2.385003, 1, 0, 0.8588235, 1,
1.027764, 0.6929067, -0.2694461, 1, 0, 0.8509804, 1,
1.030168, 0.8336307, 1.243394, 1, 0, 0.8470588, 1,
1.033175, 0.1365872, 2.684391, 1, 0, 0.8392157, 1,
1.054193, 0.2617836, 2.252566, 1, 0, 0.8352941, 1,
1.06195, -0.4341851, 2.050697, 1, 0, 0.827451, 1,
1.077891, 1.718248, 2.315452, 1, 0, 0.8235294, 1,
1.079103, 1.165221, 1.077733, 1, 0, 0.8156863, 1,
1.080551, 1.434974, 0.6611881, 1, 0, 0.8117647, 1,
1.085174, 1.608387, 0.9821224, 1, 0, 0.8039216, 1,
1.092579, -0.9531712, 2.635879, 1, 0, 0.7960784, 1,
1.092778, 0.09795233, 2.142712, 1, 0, 0.7921569, 1,
1.09297, 0.3857359, 2.097374, 1, 0, 0.7843137, 1,
1.102067, -0.8685092, 2.207446, 1, 0, 0.7803922, 1,
1.103876, -0.5534672, 3.298269, 1, 0, 0.772549, 1,
1.10397, 0.3041647, 1.920936, 1, 0, 0.7686275, 1,
1.108023, 0.3580289, -0.02354175, 1, 0, 0.7607843, 1,
1.108668, -0.3689693, -0.01635976, 1, 0, 0.7568628, 1,
1.120941, -1.191017, 2.573838, 1, 0, 0.7490196, 1,
1.128353, 0.1653881, 1.413927, 1, 0, 0.7450981, 1,
1.134905, -0.1849741, 2.120281, 1, 0, 0.7372549, 1,
1.146396, 0.8426591, -0.03889589, 1, 0, 0.7333333, 1,
1.151178, 0.3023707, 1.496904, 1, 0, 0.7254902, 1,
1.154602, -0.3932435, 1.937175, 1, 0, 0.7215686, 1,
1.156048, 1.607329, 0.8657541, 1, 0, 0.7137255, 1,
1.166839, 0.2052789, 2.146664, 1, 0, 0.7098039, 1,
1.170078, -0.7079962, 0.7016856, 1, 0, 0.7019608, 1,
1.170365, -2.397545, 4.329519, 1, 0, 0.6941177, 1,
1.172886, -1.276177, 2.80835, 1, 0, 0.6901961, 1,
1.179476, 0.9470552, 1.556309, 1, 0, 0.682353, 1,
1.181708, 0.0783525, 1.201781, 1, 0, 0.6784314, 1,
1.185393, 0.6268898, 1.62136, 1, 0, 0.6705883, 1,
1.19974, 2.08176, 1.731552, 1, 0, 0.6666667, 1,
1.204285, -1.421197, 1.860634, 1, 0, 0.6588235, 1,
1.211558, 1.002366, 1.694526, 1, 0, 0.654902, 1,
1.213117, 1.995735, 1.34292, 1, 0, 0.6470588, 1,
1.215957, -0.7369704, -0.087042, 1, 0, 0.6431373, 1,
1.220716, 0.8422656, 0.4578561, 1, 0, 0.6352941, 1,
1.225154, 0.2936733, 0.7164976, 1, 0, 0.6313726, 1,
1.231826, -0.4848113, 2.467853, 1, 0, 0.6235294, 1,
1.236182, -0.8177325, 2.744641, 1, 0, 0.6196079, 1,
1.237755, 0.1834252, 1.790072, 1, 0, 0.6117647, 1,
1.237987, -0.3406546, 0.8974866, 1, 0, 0.6078432, 1,
1.244772, 1.189276, 1.302424, 1, 0, 0.6, 1,
1.255256, -0.90253, 0.2223369, 1, 0, 0.5921569, 1,
1.256409, -0.07390539, 0.1300553, 1, 0, 0.5882353, 1,
1.257516, -0.3101168, 2.627197, 1, 0, 0.5803922, 1,
1.259676, -1.276374, 1.41553, 1, 0, 0.5764706, 1,
1.261186, -0.974519, 2.810329, 1, 0, 0.5686275, 1,
1.263272, 0.0167112, 2.245278, 1, 0, 0.5647059, 1,
1.265917, -0.8820129, 1.294464, 1, 0, 0.5568628, 1,
1.270907, 0.5319555, 0.008946632, 1, 0, 0.5529412, 1,
1.272385, -0.818601, 2.659265, 1, 0, 0.5450981, 1,
1.277137, -1.01386, 3.065864, 1, 0, 0.5411765, 1,
1.282182, -0.2820108, 3.998653, 1, 0, 0.5333334, 1,
1.29117, 0.418543, 1.68273, 1, 0, 0.5294118, 1,
1.292996, -0.6561757, 1.264529, 1, 0, 0.5215687, 1,
1.300189, -1.248255, 2.80653, 1, 0, 0.5176471, 1,
1.301762, -0.2248492, 3.382934, 1, 0, 0.509804, 1,
1.310549, -0.1269312, 2.942197, 1, 0, 0.5058824, 1,
1.322158, -0.1208183, 2.239803, 1, 0, 0.4980392, 1,
1.323801, 1.214362, 0.2114662, 1, 0, 0.4901961, 1,
1.32444, -0.3567768, 1.385241, 1, 0, 0.4862745, 1,
1.330699, -0.3483041, 0.8394415, 1, 0, 0.4784314, 1,
1.333725, -0.5641098, 2.094681, 1, 0, 0.4745098, 1,
1.334604, 2.187115, -0.1926238, 1, 0, 0.4666667, 1,
1.335258, 0.8098747, 0.8676941, 1, 0, 0.4627451, 1,
1.338957, 1.423987, -0.1507169, 1, 0, 0.454902, 1,
1.344733, -0.2864738, 0.3863392, 1, 0, 0.4509804, 1,
1.353654, -0.1973366, 0.1512905, 1, 0, 0.4431373, 1,
1.364415, -1.125589, 1.356103, 1, 0, 0.4392157, 1,
1.367108, -0.5626367, 1.056231, 1, 0, 0.4313726, 1,
1.373141, 0.04156281, 1.229806, 1, 0, 0.427451, 1,
1.37637, 0.574901, 0.1735436, 1, 0, 0.4196078, 1,
1.379855, 0.9655781, 1.67015, 1, 0, 0.4156863, 1,
1.382056, -0.684526, 4.380265, 1, 0, 0.4078431, 1,
1.382351, 1.200993, 0.3625337, 1, 0, 0.4039216, 1,
1.394759, 0.08179039, 2.666208, 1, 0, 0.3960784, 1,
1.395827, -0.1904166, 2.369838, 1, 0, 0.3882353, 1,
1.406883, -1.12744, 2.15178, 1, 0, 0.3843137, 1,
1.425056, -0.1276558, 0.2825794, 1, 0, 0.3764706, 1,
1.443999, -0.3978859, 1.359856, 1, 0, 0.372549, 1,
1.444473, 1.125496, 2.063911, 1, 0, 0.3647059, 1,
1.458244, -0.6103495, 1.506498, 1, 0, 0.3607843, 1,
1.462626, 0.9212318, 1.185223, 1, 0, 0.3529412, 1,
1.468157, -1.165411, 3.603001, 1, 0, 0.3490196, 1,
1.473342, 1.473723, 0.4851259, 1, 0, 0.3411765, 1,
1.48257, -1.222592, 2.374805, 1, 0, 0.3372549, 1,
1.498216, 0.03340586, -0.1518247, 1, 0, 0.3294118, 1,
1.499561, -1.04912, 2.803468, 1, 0, 0.3254902, 1,
1.501332, -1.564324, 3.660837, 1, 0, 0.3176471, 1,
1.508858, -1.241413, 2.689504, 1, 0, 0.3137255, 1,
1.513643, 0.4770057, 0.2637299, 1, 0, 0.3058824, 1,
1.528725, -1.232273, 2.756574, 1, 0, 0.2980392, 1,
1.542551, 0.7701201, 0.9110049, 1, 0, 0.2941177, 1,
1.568264, -0.4280099, 0.565911, 1, 0, 0.2862745, 1,
1.568868, -0.5474868, 1.51264, 1, 0, 0.282353, 1,
1.577971, -0.8645201, 0.7551209, 1, 0, 0.2745098, 1,
1.58868, -0.9662017, 2.626951, 1, 0, 0.2705882, 1,
1.591667, -0.3974175, 1.197566, 1, 0, 0.2627451, 1,
1.607895, -2.177153, 3.744662, 1, 0, 0.2588235, 1,
1.614802, 0.6957318, 1.675073, 1, 0, 0.2509804, 1,
1.649461, -0.7230086, 3.162952, 1, 0, 0.2470588, 1,
1.654496, -0.7828119, 2.621891, 1, 0, 0.2392157, 1,
1.658789, -0.9338537, 1.529409, 1, 0, 0.2352941, 1,
1.708063, -0.3129361, 0.04744429, 1, 0, 0.227451, 1,
1.719505, 0.3604815, 1.928963, 1, 0, 0.2235294, 1,
1.73359, -0.4209114, 1.919966, 1, 0, 0.2156863, 1,
1.741937, -0.9426661, 2.603261, 1, 0, 0.2117647, 1,
1.756536, -0.3440447, 2.443896, 1, 0, 0.2039216, 1,
1.768323, 0.4194469, 1.084937, 1, 0, 0.1960784, 1,
1.773605, -1.749709, 2.287527, 1, 0, 0.1921569, 1,
1.78013, -0.8286862, 2.826617, 1, 0, 0.1843137, 1,
1.783075, -1.141727, 1.794579, 1, 0, 0.1803922, 1,
1.797165, -0.7443099, 1.269801, 1, 0, 0.172549, 1,
1.805145, 1.463508, 1.50969, 1, 0, 0.1686275, 1,
1.811899, -1.649875, 1.571138, 1, 0, 0.1607843, 1,
1.835406, 0.3492593, 0.2351262, 1, 0, 0.1568628, 1,
1.854771, -0.4547934, 2.111257, 1, 0, 0.1490196, 1,
1.872962, 0.331943, 1.520985, 1, 0, 0.145098, 1,
1.892806, 1.134549, 2.857399, 1, 0, 0.1372549, 1,
1.895383, -0.007600699, -0.1863143, 1, 0, 0.1333333, 1,
1.898143, -0.9870338, 1.521568, 1, 0, 0.1254902, 1,
1.929305, 1.270726, 1.825929, 1, 0, 0.1215686, 1,
1.96225, -1.133384, 1.863812, 1, 0, 0.1137255, 1,
1.968777, -0.333375, 1.113328, 1, 0, 0.1098039, 1,
1.988687, -0.5375454, 2.0058, 1, 0, 0.1019608, 1,
1.990397, 1.692193, 1.840761, 1, 0, 0.09411765, 1,
2.009982, 0.6188315, 2.174012, 1, 0, 0.09019608, 1,
2.019527, -0.7341024, 3.275514, 1, 0, 0.08235294, 1,
2.059682, -2.420012, 1.729031, 1, 0, 0.07843138, 1,
2.071081, 0.6914573, 2.148782, 1, 0, 0.07058824, 1,
2.13909, 0.7706993, 0.5954252, 1, 0, 0.06666667, 1,
2.225245, 0.2977245, 0.9984553, 1, 0, 0.05882353, 1,
2.253077, 1.762897, 1.023532, 1, 0, 0.05490196, 1,
2.285554, -0.6807035, 1.431945, 1, 0, 0.04705882, 1,
2.384365, 0.0980268, 1.645928, 1, 0, 0.04313726, 1,
2.459415, 1.129426, 0.9969034, 1, 0, 0.03529412, 1,
2.466798, 0.5414611, 0.563727, 1, 0, 0.03137255, 1,
2.491832, -0.4504787, 0.4479629, 1, 0, 0.02352941, 1,
2.562528, -0.2893569, 0.6405701, 1, 0, 0.01960784, 1,
2.7147, 0.3284741, -0.4543744, 1, 0, 0.01176471, 1,
3.308578, -0.08650373, 0.9301322, 1, 0, 0.007843138, 1
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
0.2342764, -4.639791, -6.49718, 0, -0.5, 0.5, 0.5,
0.2342764, -4.639791, -6.49718, 1, -0.5, 0.5, 0.5,
0.2342764, -4.639791, -6.49718, 1, 1.5, 0.5, 0.5,
0.2342764, -4.639791, -6.49718, 0, 1.5, 0.5, 0.5
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
-3.882213, 0.01754713, -6.49718, 0, -0.5, 0.5, 0.5,
-3.882213, 0.01754713, -6.49718, 1, -0.5, 0.5, 0.5,
-3.882213, 0.01754713, -6.49718, 1, 1.5, 0.5, 0.5,
-3.882213, 0.01754713, -6.49718, 0, 1.5, 0.5, 0.5
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
-3.882213, -4.639791, 0.3104286, 0, -0.5, 0.5, 0.5,
-3.882213, -4.639791, 0.3104286, 1, -0.5, 0.5, 0.5,
-3.882213, -4.639791, 0.3104286, 1, 1.5, 0.5, 0.5,
-3.882213, -4.639791, 0.3104286, 0, 1.5, 0.5, 0.5
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
-2, -3.56502, -4.926194,
3, -3.56502, -4.926194,
-2, -3.56502, -4.926194,
-2, -3.744148, -5.188025,
-1, -3.56502, -4.926194,
-1, -3.744148, -5.188025,
0, -3.56502, -4.926194,
0, -3.744148, -5.188025,
1, -3.56502, -4.926194,
1, -3.744148, -5.188025,
2, -3.56502, -4.926194,
2, -3.744148, -5.188025,
3, -3.56502, -4.926194,
3, -3.744148, -5.188025
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
-2, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
-2, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
-2, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
-2, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5,
-1, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
-1, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
-1, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
-1, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5,
0, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
0, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
0, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
0, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5,
1, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
1, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
1, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
1, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5,
2, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
2, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
2, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
2, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5,
3, -4.102405, -5.711687, 0, -0.5, 0.5, 0.5,
3, -4.102405, -5.711687, 1, -0.5, 0.5, 0.5,
3, -4.102405, -5.711687, 1, 1.5, 0.5, 0.5,
3, -4.102405, -5.711687, 0, 1.5, 0.5, 0.5
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
-2.932254, -3, -4.926194,
-2.932254, 3, -4.926194,
-2.932254, -3, -4.926194,
-3.090581, -3, -5.188025,
-2.932254, -2, -4.926194,
-3.090581, -2, -5.188025,
-2.932254, -1, -4.926194,
-3.090581, -1, -5.188025,
-2.932254, 0, -4.926194,
-3.090581, 0, -5.188025,
-2.932254, 1, -4.926194,
-3.090581, 1, -5.188025,
-2.932254, 2, -4.926194,
-3.090581, 2, -5.188025,
-2.932254, 3, -4.926194,
-3.090581, 3, -5.188025
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
-3.407234, -3, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, -3, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, -3, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, -3, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, -2, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, -2, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, -2, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, -2, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, -1, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, -1, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, -1, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, -1, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, 0, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, 0, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, 0, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, 0, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, 1, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, 1, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, 1, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, 1, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, 2, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, 2, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, 2, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, 2, -5.711687, 0, 1.5, 0.5, 0.5,
-3.407234, 3, -5.711687, 0, -0.5, 0.5, 0.5,
-3.407234, 3, -5.711687, 1, -0.5, 0.5, 0.5,
-3.407234, 3, -5.711687, 1, 1.5, 0.5, 0.5,
-3.407234, 3, -5.711687, 0, 1.5, 0.5, 0.5
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
-2.932254, -3.56502, -4,
-2.932254, -3.56502, 4,
-2.932254, -3.56502, -4,
-3.090581, -3.744148, -4,
-2.932254, -3.56502, -2,
-3.090581, -3.744148, -2,
-2.932254, -3.56502, 0,
-3.090581, -3.744148, 0,
-2.932254, -3.56502, 2,
-3.090581, -3.744148, 2,
-2.932254, -3.56502, 4,
-3.090581, -3.744148, 4
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
-3.407234, -4.102405, -4, 0, -0.5, 0.5, 0.5,
-3.407234, -4.102405, -4, 1, -0.5, 0.5, 0.5,
-3.407234, -4.102405, -4, 1, 1.5, 0.5, 0.5,
-3.407234, -4.102405, -4, 0, 1.5, 0.5, 0.5,
-3.407234, -4.102405, -2, 0, -0.5, 0.5, 0.5,
-3.407234, -4.102405, -2, 1, -0.5, 0.5, 0.5,
-3.407234, -4.102405, -2, 1, 1.5, 0.5, 0.5,
-3.407234, -4.102405, -2, 0, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 0, 0, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 0, 1, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 0, 1, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 0, 0, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 2, 0, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 2, 1, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 2, 1, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 2, 0, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 4, 0, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 4, 1, -0.5, 0.5, 0.5,
-3.407234, -4.102405, 4, 1, 1.5, 0.5, 0.5,
-3.407234, -4.102405, 4, 0, 1.5, 0.5, 0.5
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
-2.932254, -3.56502, -4.926194,
-2.932254, 3.600114, -4.926194,
-2.932254, -3.56502, 5.547051,
-2.932254, 3.600114, 5.547051,
-2.932254, -3.56502, -4.926194,
-2.932254, -3.56502, 5.547051,
-2.932254, 3.600114, -4.926194,
-2.932254, 3.600114, 5.547051,
-2.932254, -3.56502, -4.926194,
3.400807, -3.56502, -4.926194,
-2.932254, -3.56502, 5.547051,
3.400807, -3.56502, 5.547051,
-2.932254, 3.600114, -4.926194,
3.400807, 3.600114, -4.926194,
-2.932254, 3.600114, 5.547051,
3.400807, 3.600114, 5.547051,
3.400807, -3.56502, -4.926194,
3.400807, 3.600114, -4.926194,
3.400807, -3.56502, 5.547051,
3.400807, 3.600114, 5.547051,
3.400807, -3.56502, -4.926194,
3.400807, -3.56502, 5.547051,
3.400807, 3.600114, -4.926194,
3.400807, 3.600114, 5.547051
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
var radius = 7.573036;
var distance = 33.69329;
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
mvMatrix.translate( -0.2342764, -0.01754713, -0.3104286 );
mvMatrix.scale( 1.292916, 1.142772, 0.7818126 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69329);
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
phenylurea<-read.table("phenylurea.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenylurea$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
y<-phenylurea$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
```

```r
z<-phenylurea$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenylurea' not found
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
-2.840025, -1.366006, -1.219097, 0, 0, 1, 1, 1,
-2.70744, 1.792928, -1.160964, 1, 0, 0, 1, 1,
-2.606659, 1.450868, -1.428749, 1, 0, 0, 1, 1,
-2.606421, -0.5538735, -0.4298035, 1, 0, 0, 1, 1,
-2.594417, -0.8103608, -0.783967, 1, 0, 0, 1, 1,
-2.463336, -0.5366099, -1.536647, 1, 0, 0, 1, 1,
-2.336399, -0.5916601, -1.294507, 0, 0, 0, 1, 1,
-2.184809, -0.5145217, -2.946432, 0, 0, 0, 1, 1,
-2.157575, -0.6295883, -2.337434, 0, 0, 0, 1, 1,
-2.129651, 0.8672506, -3.212547, 0, 0, 0, 1, 1,
-2.093516, -0.6081263, -1.945626, 0, 0, 0, 1, 1,
-2.081752, -0.8258607, -1.17295, 0, 0, 0, 1, 1,
-2.066412, -0.8063835, -1.540644, 0, 0, 0, 1, 1,
-2.05666, -0.9162145, -3.024631, 1, 1, 1, 1, 1,
-2.034955, -0.405425, -2.23643, 1, 1, 1, 1, 1,
-2.02433, 0.350517, -1.195808, 1, 1, 1, 1, 1,
-2.020919, 1.314035, -2.455796, 1, 1, 1, 1, 1,
-2.003796, 1.095905, -0.2010083, 1, 1, 1, 1, 1,
-1.993461, -0.7494246, -1.11053, 1, 1, 1, 1, 1,
-1.981808, -0.1654161, -1.043164, 1, 1, 1, 1, 1,
-1.97973, 1.169367, 1.136245, 1, 1, 1, 1, 1,
-1.961462, 1.057119, -0.850149, 1, 1, 1, 1, 1,
-1.95784, -1.064342, -0.3987336, 1, 1, 1, 1, 1,
-1.942745, -1.315346, -1.74729, 1, 1, 1, 1, 1,
-1.939714, 0.5762609, -0.6485734, 1, 1, 1, 1, 1,
-1.909967, 1.421873, -0.7999352, 1, 1, 1, 1, 1,
-1.871966, 1.818761, -1.673301, 1, 1, 1, 1, 1,
-1.805772, 0.8329741, 1.361391, 1, 1, 1, 1, 1,
-1.795567, 0.1617452, -2.572567, 0, 0, 1, 1, 1,
-1.791057, 0.3679959, -1.766325, 1, 0, 0, 1, 1,
-1.75864, 0.9143686, -1.483131, 1, 0, 0, 1, 1,
-1.753539, -1.044825, -1.594517, 1, 0, 0, 1, 1,
-1.724688, -1.367195, -0.7742562, 1, 0, 0, 1, 1,
-1.680109, 0.2732002, -2.602797, 1, 0, 0, 1, 1,
-1.67984, 0.998929, -1.918323, 0, 0, 0, 1, 1,
-1.676339, -1.480581, -1.829625, 0, 0, 0, 1, 1,
-1.657983, -1.126085, -2.404707, 0, 0, 0, 1, 1,
-1.637007, -0.428481, -1.260567, 0, 0, 0, 1, 1,
-1.626004, 1.576693, -2.458115, 0, 0, 0, 1, 1,
-1.619052, 0.7394459, -0.5000892, 0, 0, 0, 1, 1,
-1.61835, 1.29526, -0.5741248, 0, 0, 0, 1, 1,
-1.618039, 0.9727897, -0.7043598, 1, 1, 1, 1, 1,
-1.609955, -0.9742701, -0.7092404, 1, 1, 1, 1, 1,
-1.608243, 0.4929543, -0.3418509, 1, 1, 1, 1, 1,
-1.605706, -0.3347789, -0.8952525, 1, 1, 1, 1, 1,
-1.59659, -1.064865, -3.707953, 1, 1, 1, 1, 1,
-1.594806, 0.4136076, -1.440415, 1, 1, 1, 1, 1,
-1.593598, 0.8010653, 0.2165118, 1, 1, 1, 1, 1,
-1.591437, 0.3992532, -1.1546, 1, 1, 1, 1, 1,
-1.590516, 0.7926454, -0.6450912, 1, 1, 1, 1, 1,
-1.58359, 2.414068, -0.9003994, 1, 1, 1, 1, 1,
-1.567438, 0.9140581, -0.01774313, 1, 1, 1, 1, 1,
-1.562366, 1.263663, -0.8958321, 1, 1, 1, 1, 1,
-1.553227, -1.142066, -1.84469, 1, 1, 1, 1, 1,
-1.552465, -0.25339, -2.132653, 1, 1, 1, 1, 1,
-1.547611, -0.9599661, -2.73762, 1, 1, 1, 1, 1,
-1.542957, 0.09869041, -2.236751, 0, 0, 1, 1, 1,
-1.542757, 1.599471, -0.621376, 1, 0, 0, 1, 1,
-1.536314, -0.6950239, -1.962587, 1, 0, 0, 1, 1,
-1.529301, -0.321631, -1.935821, 1, 0, 0, 1, 1,
-1.520841, -1.999112, -3.098923, 1, 0, 0, 1, 1,
-1.520161, 0.8185788, -2.135017, 1, 0, 0, 1, 1,
-1.517747, -1.178999, -0.9123309, 0, 0, 0, 1, 1,
-1.516094, 0.6006207, -1.318215, 0, 0, 0, 1, 1,
-1.515106, 0.3609732, -1.777483, 0, 0, 0, 1, 1,
-1.510009, -1.222999, -3.508179, 0, 0, 0, 1, 1,
-1.487646, -0.1846035, -0.2801815, 0, 0, 0, 1, 1,
-1.477787, 1.338954, 0.2534347, 0, 0, 0, 1, 1,
-1.463005, 0.9453963, -0.3561165, 0, 0, 0, 1, 1,
-1.459961, -0.6644529, -0.8317475, 1, 1, 1, 1, 1,
-1.459912, -0.03070019, -1.580107, 1, 1, 1, 1, 1,
-1.451337, -0.8771734, -1.978871, 1, 1, 1, 1, 1,
-1.448978, -0.8015747, -2.343638, 1, 1, 1, 1, 1,
-1.447573, 0.4647102, -0.4484574, 1, 1, 1, 1, 1,
-1.435596, -0.6670864, -4.208979, 1, 1, 1, 1, 1,
-1.432229, 1.468615, 0.7253275, 1, 1, 1, 1, 1,
-1.419653, 1.113798, -1.639922, 1, 1, 1, 1, 1,
-1.417508, -0.09421504, -0.6982102, 1, 1, 1, 1, 1,
-1.413579, -1.947773, -3.407072, 1, 1, 1, 1, 1,
-1.409009, -0.6198174, -1.521471, 1, 1, 1, 1, 1,
-1.396837, 0.6436431, -0.2130715, 1, 1, 1, 1, 1,
-1.3825, 0.4389328, 0.08887833, 1, 1, 1, 1, 1,
-1.378077, -0.6409018, -2.474178, 1, 1, 1, 1, 1,
-1.373136, -2.538732, -3.290699, 1, 1, 1, 1, 1,
-1.370669, 1.612287, -1.268633, 0, 0, 1, 1, 1,
-1.36798, -0.3944453, -1.748653, 1, 0, 0, 1, 1,
-1.365015, -1.459877, -3.134952, 1, 0, 0, 1, 1,
-1.36335, -0.7251143, -1.942383, 1, 0, 0, 1, 1,
-1.344997, 1.457305, 1.72988, 1, 0, 0, 1, 1,
-1.331362, 0.2570498, -4.159704, 1, 0, 0, 1, 1,
-1.315566, -1.86115, -4.089846, 0, 0, 0, 1, 1,
-1.312986, 0.256846, -1.390082, 0, 0, 0, 1, 1,
-1.301344, -0.9738466, -2.312134, 0, 0, 0, 1, 1,
-1.299211, 1.133811, -1.839354, 0, 0, 0, 1, 1,
-1.299074, -1.370225, -1.417066, 0, 0, 0, 1, 1,
-1.289284, -0.008304697, -0.1840323, 0, 0, 0, 1, 1,
-1.282926, 2.1437, -2.098037, 0, 0, 0, 1, 1,
-1.281896, 0.5945099, -1.272744, 1, 1, 1, 1, 1,
-1.280871, 0.1044221, -2.251167, 1, 1, 1, 1, 1,
-1.27627, -0.4844124, -1.782187, 1, 1, 1, 1, 1,
-1.272527, -0.2212859, -1.006798, 1, 1, 1, 1, 1,
-1.267262, -0.4183814, -1.728265, 1, 1, 1, 1, 1,
-1.249382, -0.656085, -3.001094, 1, 1, 1, 1, 1,
-1.234687, -0.2981676, -1.778758, 1, 1, 1, 1, 1,
-1.233873, -0.8551891, -0.7644323, 1, 1, 1, 1, 1,
-1.231242, -0.7113255, -0.9695117, 1, 1, 1, 1, 1,
-1.22968, 0.5193047, 1.417692, 1, 1, 1, 1, 1,
-1.229025, -1.065271, -3.669001, 1, 1, 1, 1, 1,
-1.222088, -0.7328402, -1.833352, 1, 1, 1, 1, 1,
-1.220039, -0.8624255, -1.024627, 1, 1, 1, 1, 1,
-1.213942, -0.53092, -2.515009, 1, 1, 1, 1, 1,
-1.211302, 1.737895, -0.8931062, 1, 1, 1, 1, 1,
-1.209608, -1.175252, -2.915449, 0, 0, 1, 1, 1,
-1.205666, -1.099674, -4.341818, 1, 0, 0, 1, 1,
-1.197129, 0.6929176, -1.146332, 1, 0, 0, 1, 1,
-1.194306, 0.3855913, -2.064135, 1, 0, 0, 1, 1,
-1.189395, -0.2252686, -2.468204, 1, 0, 0, 1, 1,
-1.18829, -1.940292, -3.346385, 1, 0, 0, 1, 1,
-1.185683, -0.3716961, -0.7518029, 0, 0, 0, 1, 1,
-1.182267, -0.2992726, -0.5599445, 0, 0, 0, 1, 1,
-1.178791, -1.60392, -2.189939, 0, 0, 0, 1, 1,
-1.17446, 0.416274, -2.204462, 0, 0, 0, 1, 1,
-1.157711, 1.113801, -0.5047934, 0, 0, 0, 1, 1,
-1.157506, -2.058707, -4.771526, 0, 0, 0, 1, 1,
-1.1511, -0.9214175, -2.030269, 0, 0, 0, 1, 1,
-1.150381, -1.348877, -0.7508882, 1, 1, 1, 1, 1,
-1.1336, 0.01403241, -0.7726935, 1, 1, 1, 1, 1,
-1.121914, -0.3532477, -0.345767, 1, 1, 1, 1, 1,
-1.117959, -0.1523055, -1.184049, 1, 1, 1, 1, 1,
-1.117895, 0.4786712, 0.9539254, 1, 1, 1, 1, 1,
-1.111327, 0.1137313, -2.897157, 1, 1, 1, 1, 1,
-1.107696, 1.587627, -0.6150216, 1, 1, 1, 1, 1,
-1.104012, 0.1622196, -0.9411955, 1, 1, 1, 1, 1,
-1.10154, -1.123571, -2.755727, 1, 1, 1, 1, 1,
-1.084832, -0.7209705, -2.737461, 1, 1, 1, 1, 1,
-1.083632, -0.9152424, -2.316698, 1, 1, 1, 1, 1,
-1.074224, 0.8547489, -2.23298, 1, 1, 1, 1, 1,
-1.065246, 0.5202301, -0.1121039, 1, 1, 1, 1, 1,
-1.06506, 0.6387452, -2.400104, 1, 1, 1, 1, 1,
-1.064762, -1.967775, -1.73748, 1, 1, 1, 1, 1,
-1.06437, 0.5872812, -1.819062, 0, 0, 1, 1, 1,
-1.061644, -0.3930322, -1.926585, 1, 0, 0, 1, 1,
-1.059463, 2.250487, -1.693521, 1, 0, 0, 1, 1,
-1.051918, 0.02710637, -2.048564, 1, 0, 0, 1, 1,
-1.0497, -0.04642202, -1.460496, 1, 0, 0, 1, 1,
-1.047906, 0.9796292, -2.315163, 1, 0, 0, 1, 1,
-1.047536, -0.5924098, -1.814895, 0, 0, 0, 1, 1,
-1.046638, -0.5414763, -1.461959, 0, 0, 0, 1, 1,
-1.039044, 1.882142, -2.106661, 0, 0, 0, 1, 1,
-1.037647, -0.3365034, -3.463385, 0, 0, 0, 1, 1,
-1.03759, -0.2339151, -2.329772, 0, 0, 0, 1, 1,
-1.034462, 0.2886288, -2.217222, 0, 0, 0, 1, 1,
-1.026732, -0.1132937, -2.852795, 0, 0, 0, 1, 1,
-1.017666, 1.036014, 0.6741822, 1, 1, 1, 1, 1,
-1.017629, 1.916522, -0.3310705, 1, 1, 1, 1, 1,
-1.016133, 0.3772302, -1.420025, 1, 1, 1, 1, 1,
-1.011942, 1.238151, -0.1748817, 1, 1, 1, 1, 1,
-1.007639, -0.8410717, -3.438113, 1, 1, 1, 1, 1,
-1.007004, 0.1695505, -2.227939, 1, 1, 1, 1, 1,
-1.005098, -1.362117, -2.192042, 1, 1, 1, 1, 1,
-0.9961014, 0.0918725, -1.936306, 1, 1, 1, 1, 1,
-0.9950429, -0.6740056, -1.452748, 1, 1, 1, 1, 1,
-0.9943238, -0.2715217, -2.173729, 1, 1, 1, 1, 1,
-0.9918787, 0.4027072, -2.365764, 1, 1, 1, 1, 1,
-0.9814965, 0.9236565, 0.06378119, 1, 1, 1, 1, 1,
-0.9811839, 0.1328913, -0.7540934, 1, 1, 1, 1, 1,
-0.9806536, 1.05022, 0.01421251, 1, 1, 1, 1, 1,
-0.9743872, 0.8251686, -0.9036102, 1, 1, 1, 1, 1,
-0.9679368, -0.2085177, -1.475864, 0, 0, 1, 1, 1,
-0.96332, 0.4516158, -0.4206894, 1, 0, 0, 1, 1,
-0.9627, -1.454949, -0.7959604, 1, 0, 0, 1, 1,
-0.959259, 1.213349, -0.6495658, 1, 0, 0, 1, 1,
-0.9575285, 0.7677097, -0.456923, 1, 0, 0, 1, 1,
-0.9562806, 1.026178, -0.6754507, 1, 0, 0, 1, 1,
-0.9539712, -1.127647, -4.152729, 0, 0, 0, 1, 1,
-0.9519223, -1.179445, -1.222436, 0, 0, 0, 1, 1,
-0.9515887, 0.6669265, -0.2943508, 0, 0, 0, 1, 1,
-0.9485506, -0.4381531, 0.6134749, 0, 0, 0, 1, 1,
-0.9453457, -0.4649475, -0.9091898, 0, 0, 0, 1, 1,
-0.937851, 0.1034422, -2.837344, 0, 0, 0, 1, 1,
-0.9359858, 0.3404955, -0.3402326, 0, 0, 0, 1, 1,
-0.9348472, -0.2882897, -0.6105648, 1, 1, 1, 1, 1,
-0.9339945, -0.1797724, -1.444254, 1, 1, 1, 1, 1,
-0.9339309, -0.5643143, -1.059426, 1, 1, 1, 1, 1,
-0.9338858, -0.9274101, -2.231364, 1, 1, 1, 1, 1,
-0.9331679, -0.8627512, -2.086427, 1, 1, 1, 1, 1,
-0.9329575, -1.293243, -2.140502, 1, 1, 1, 1, 1,
-0.9301389, -0.1578056, -2.318501, 1, 1, 1, 1, 1,
-0.9295584, 1.555322, -1.365095, 1, 1, 1, 1, 1,
-0.927595, -0.9890173, -2.311174, 1, 1, 1, 1, 1,
-0.9249015, 1.37156, -1.551407, 1, 1, 1, 1, 1,
-0.9220623, -1.73016, -2.071387, 1, 1, 1, 1, 1,
-0.9211939, 1.60856, -0.03408147, 1, 1, 1, 1, 1,
-0.9092453, -0.3607767, -1.372694, 1, 1, 1, 1, 1,
-0.9042121, 0.5500969, 0.1737677, 1, 1, 1, 1, 1,
-0.9011733, 0.2531772, -1.011606, 1, 1, 1, 1, 1,
-0.9010358, 1.845926, 0.8446448, 0, 0, 1, 1, 1,
-0.9005531, -0.4275746, 0.7349545, 1, 0, 0, 1, 1,
-0.8991215, -1.018549, -1.451559, 1, 0, 0, 1, 1,
-0.8944443, 0.8098564, -2.202242, 1, 0, 0, 1, 1,
-0.893015, -0.4263301, -2.499317, 1, 0, 0, 1, 1,
-0.891508, 0.5553977, 1.261145, 1, 0, 0, 1, 1,
-0.8846335, -0.2465739, -1.372102, 0, 0, 0, 1, 1,
-0.8784603, 0.3558567, -0.9899036, 0, 0, 0, 1, 1,
-0.8774998, -0.4411308, -2.660402, 0, 0, 0, 1, 1,
-0.874211, 0.8089835, -1.243964, 0, 0, 0, 1, 1,
-0.8667578, 1.380684, 0.4177991, 0, 0, 0, 1, 1,
-0.8626584, 0.7021518, -1.570133, 0, 0, 0, 1, 1,
-0.8567911, 0.9996089, -0.6453279, 0, 0, 0, 1, 1,
-0.8458498, 0.8934934, 0.3695273, 1, 1, 1, 1, 1,
-0.844295, 0.02767624, -1.199641, 1, 1, 1, 1, 1,
-0.8433915, 0.05137775, -2.791233, 1, 1, 1, 1, 1,
-0.8416569, -0.4700392, -1.452186, 1, 1, 1, 1, 1,
-0.8408188, 1.091488, -0.7494516, 1, 1, 1, 1, 1,
-0.8345032, -0.9123734, -3.461204, 1, 1, 1, 1, 1,
-0.8327375, 0.7941346, -0.6314617, 1, 1, 1, 1, 1,
-0.8311603, 0.1036753, -0.6467595, 1, 1, 1, 1, 1,
-0.8220994, 0.3871915, -2.193599, 1, 1, 1, 1, 1,
-0.8204428, -1.304272, -3.137736, 1, 1, 1, 1, 1,
-0.8188955, -0.9238117, -1.350931, 1, 1, 1, 1, 1,
-0.81589, -1.554568, -3.061853, 1, 1, 1, 1, 1,
-0.8095213, -0.3234611, -2.645764, 1, 1, 1, 1, 1,
-0.808677, 0.3781147, -2.800555, 1, 1, 1, 1, 1,
-0.8086447, 0.6998052, -0.3110184, 1, 1, 1, 1, 1,
-0.8013188, -0.09091706, -1.754323, 0, 0, 1, 1, 1,
-0.7963544, -0.02106584, -1.220022, 1, 0, 0, 1, 1,
-0.7963474, 1.422403, -1.936147, 1, 0, 0, 1, 1,
-0.7826771, 1.94687, -1.593868, 1, 0, 0, 1, 1,
-0.7699932, 1.255266, -1.45706, 1, 0, 0, 1, 1,
-0.7688009, -0.5176014, -2.553949, 1, 0, 0, 1, 1,
-0.7618161, 1.445151, -0.2877882, 0, 0, 0, 1, 1,
-0.7575044, -0.7411619, -0.5914047, 0, 0, 0, 1, 1,
-0.7571923, -0.1528131, -2.505515, 0, 0, 0, 1, 1,
-0.7568972, 0.1369675, -1.471552, 0, 0, 0, 1, 1,
-0.7550166, 0.2490212, -0.4454777, 0, 0, 0, 1, 1,
-0.7538328, 1.537591, -0.1475806, 0, 0, 0, 1, 1,
-0.7515505, 0.5344271, -1.114132, 0, 0, 0, 1, 1,
-0.7450772, 0.3068579, -1.367326, 1, 1, 1, 1, 1,
-0.7439094, -0.0498499, -0.629559, 1, 1, 1, 1, 1,
-0.7426512, -0.1748957, -1.190226, 1, 1, 1, 1, 1,
-0.7404835, -0.7041591, -4.0098, 1, 1, 1, 1, 1,
-0.7387885, 0.1006726, -1.088431, 1, 1, 1, 1, 1,
-0.7380196, -2.03017, -1.820796, 1, 1, 1, 1, 1,
-0.7372311, -0.7759897, -1.939473, 1, 1, 1, 1, 1,
-0.7366523, -0.3611836, -2.358082, 1, 1, 1, 1, 1,
-0.7357921, 0.0776187, -1.595734, 1, 1, 1, 1, 1,
-0.7342004, 0.4769598, -2.030354, 1, 1, 1, 1, 1,
-0.7312312, -0.3241247, -2.924271, 1, 1, 1, 1, 1,
-0.7278925, 0.6432915, 0.7006738, 1, 1, 1, 1, 1,
-0.7201746, 0.2039099, -1.533085, 1, 1, 1, 1, 1,
-0.7136426, -0.2664971, -1.649112, 1, 1, 1, 1, 1,
-0.7118217, -0.6016676, -2.776314, 1, 1, 1, 1, 1,
-0.71064, 0.08279832, -0.5745298, 0, 0, 1, 1, 1,
-0.7078221, -1.49298, -2.691154, 1, 0, 0, 1, 1,
-0.7006326, -1.694017, -3.076962, 1, 0, 0, 1, 1,
-0.6987737, 1.251052, -0.2226087, 1, 0, 0, 1, 1,
-0.6960233, 0.6284261, 0.5425544, 1, 0, 0, 1, 1,
-0.6862146, 0.1635362, -1.792417, 1, 0, 0, 1, 1,
-0.6706292, -0.4970325, -0.5673677, 0, 0, 0, 1, 1,
-0.6640429, 1.33642, -0.7997484, 0, 0, 0, 1, 1,
-0.6577353, -0.689506, -2.483875, 0, 0, 0, 1, 1,
-0.6547156, 0.0263263, -0.2368151, 0, 0, 0, 1, 1,
-0.6535698, -0.5634305, -2.829507, 0, 0, 0, 1, 1,
-0.6535631, 0.7921358, -0.04026541, 0, 0, 0, 1, 1,
-0.6458563, -0.1658682, -0.3771336, 0, 0, 0, 1, 1,
-0.6456738, -1.519865, -2.519567, 1, 1, 1, 1, 1,
-0.641606, -0.7542542, -0.4831073, 1, 1, 1, 1, 1,
-0.6414018, 0.6302601, -1.034819, 1, 1, 1, 1, 1,
-0.6384817, 1.711233, 0.3607693, 1, 1, 1, 1, 1,
-0.6382766, 0.7531627, -0.8996562, 1, 1, 1, 1, 1,
-0.6345505, -0.01419686, -1.817713, 1, 1, 1, 1, 1,
-0.6330614, -0.6833541, -2.097851, 1, 1, 1, 1, 1,
-0.6316673, -0.53025, -2.069962, 1, 1, 1, 1, 1,
-0.6239098, -0.5159711, -3.207057, 1, 1, 1, 1, 1,
-0.6165025, 0.1440035, -1.019177, 1, 1, 1, 1, 1,
-0.6164708, 0.3098249, -2.016379, 1, 1, 1, 1, 1,
-0.6139005, -0.8620772, -3.112146, 1, 1, 1, 1, 1,
-0.612505, 1.080234, 0.3476677, 1, 1, 1, 1, 1,
-0.5977592, -2.416314, -2.831066, 1, 1, 1, 1, 1,
-0.5969198, -0.4139106, -1.916521, 1, 1, 1, 1, 1,
-0.595641, 0.323171, -1.020661, 0, 0, 1, 1, 1,
-0.5933121, 0.6121001, -0.1144062, 1, 0, 0, 1, 1,
-0.5909116, 1.898846, -0.9517724, 1, 0, 0, 1, 1,
-0.5898242, 0.3917311, -1.837829, 1, 0, 0, 1, 1,
-0.5843558, -1.93057, -2.953127, 1, 0, 0, 1, 1,
-0.5830773, 0.008066007, -2.415597, 1, 0, 0, 1, 1,
-0.5816125, -1.061737, -2.767531, 0, 0, 0, 1, 1,
-0.580355, 0.3411866, -1.957446, 0, 0, 0, 1, 1,
-0.5751187, 0.9539914, -0.232819, 0, 0, 0, 1, 1,
-0.5715348, -0.2076269, -2.442832, 0, 0, 0, 1, 1,
-0.5707637, 0.4777396, -0.3776038, 0, 0, 0, 1, 1,
-0.5687559, 0.05159869, -2.857343, 0, 0, 0, 1, 1,
-0.5686423, 0.2732488, -1.344587, 0, 0, 0, 1, 1,
-0.5656869, 1.32583, -0.8151079, 1, 1, 1, 1, 1,
-0.5611753, -1.003209, -2.822656, 1, 1, 1, 1, 1,
-0.5595171, -1.942985, -1.988883, 1, 1, 1, 1, 1,
-0.550937, -0.2912624, -1.294844, 1, 1, 1, 1, 1,
-0.5470493, -1.306206, -2.1288, 1, 1, 1, 1, 1,
-0.5448349, -1.599492, -2.296348, 1, 1, 1, 1, 1,
-0.541504, -0.07207012, -0.6546795, 1, 1, 1, 1, 1,
-0.5392253, -0.3299238, -2.859483, 1, 1, 1, 1, 1,
-0.5383123, -0.3083533, -2.051243, 1, 1, 1, 1, 1,
-0.5318894, -2.494538, -3.562479, 1, 1, 1, 1, 1,
-0.5297394, 0.800033, 1.189411, 1, 1, 1, 1, 1,
-0.5291433, -2.631662, -1.848842, 1, 1, 1, 1, 1,
-0.529111, 1.306945, -0.906602, 1, 1, 1, 1, 1,
-0.5277801, 0.4427004, -0.3706184, 1, 1, 1, 1, 1,
-0.5243962, 1.451098, -0.721885, 1, 1, 1, 1, 1,
-0.5184062, -0.2702981, -2.365579, 0, 0, 1, 1, 1,
-0.5138508, 0.2780722, -0.7811877, 1, 0, 0, 1, 1,
-0.5071713, 1.02989, 0.4251957, 1, 0, 0, 1, 1,
-0.5041716, 0.06316426, -2.759508, 1, 0, 0, 1, 1,
-0.4988863, 1.923301, -0.4427074, 1, 0, 0, 1, 1,
-0.4947312, -0.4788397, -3.037635, 1, 0, 0, 1, 1,
-0.494329, -0.05844096, -2.762146, 0, 0, 0, 1, 1,
-0.4915402, 0.5765585, -0.4264997, 0, 0, 0, 1, 1,
-0.4896624, -0.8783123, -2.369113, 0, 0, 0, 1, 1,
-0.4894617, 1.657411, 0.2232613, 0, 0, 0, 1, 1,
-0.4885047, 1.020181, -0.8942038, 0, 0, 0, 1, 1,
-0.4881321, 1.407088, -0.2364121, 0, 0, 0, 1, 1,
-0.4866702, 0.02479762, -0.159309, 0, 0, 0, 1, 1,
-0.4698635, -1.649348, -3.19126, 1, 1, 1, 1, 1,
-0.4697405, 0.3219315, -2.21572, 1, 1, 1, 1, 1,
-0.4671818, -0.6270382, -2.080064, 1, 1, 1, 1, 1,
-0.4649308, 1.301968, 0.8524289, 1, 1, 1, 1, 1,
-0.4627064, 0.2647, -1.287946, 1, 1, 1, 1, 1,
-0.4585128, -1.403388, -4.046473, 1, 1, 1, 1, 1,
-0.4572777, 2.495156, -1.430326, 1, 1, 1, 1, 1,
-0.4567102, 0.4379057, -1.96748, 1, 1, 1, 1, 1,
-0.453194, 1.371639, 0.1741946, 1, 1, 1, 1, 1,
-0.449465, -2.058524, -3.436028, 1, 1, 1, 1, 1,
-0.4464482, 0.8018571, -1.573057, 1, 1, 1, 1, 1,
-0.4432442, 1.188874, -1.254756, 1, 1, 1, 1, 1,
-0.4338579, -0.3547831, -2.066122, 1, 1, 1, 1, 1,
-0.4313132, 0.4184409, -0.6851097, 1, 1, 1, 1, 1,
-0.4285264, -0.2958874, -1.765934, 1, 1, 1, 1, 1,
-0.4202396, -2.633571, -1.664809, 0, 0, 1, 1, 1,
-0.4180268, -1.94273, -1.330555, 1, 0, 0, 1, 1,
-0.4175497, 1.823152, -0.6381599, 1, 0, 0, 1, 1,
-0.4166804, -1.103449, -1.493209, 1, 0, 0, 1, 1,
-0.4160924, 0.4232937, -1.431274, 1, 0, 0, 1, 1,
-0.4139505, -0.6454971, -1.958696, 1, 0, 0, 1, 1,
-0.4135608, -0.7225307, -3.790023, 0, 0, 0, 1, 1,
-0.4095594, -0.4176396, -1.97912, 0, 0, 0, 1, 1,
-0.4084529, 1.067421, 0.7406965, 0, 0, 0, 1, 1,
-0.4070256, 1.04483, 0.4155479, 0, 0, 0, 1, 1,
-0.4060896, -0.2561083, -1.814502, 0, 0, 0, 1, 1,
-0.4036937, -0.9341558, -3.063611, 0, 0, 0, 1, 1,
-0.3983784, -1.015358, -3.075294, 0, 0, 0, 1, 1,
-0.3928602, 0.5627214, -0.07267792, 1, 1, 1, 1, 1,
-0.3917071, -1.30374, -4.56215, 1, 1, 1, 1, 1,
-0.389012, 0.1191104, -0.1615535, 1, 1, 1, 1, 1,
-0.3880936, -1.901169, -4.688967, 1, 1, 1, 1, 1,
-0.3865528, -0.05879877, -1.867713, 1, 1, 1, 1, 1,
-0.3863978, 0.5565091, -1.609837, 1, 1, 1, 1, 1,
-0.3862323, -0.8541572, -2.446881, 1, 1, 1, 1, 1,
-0.3857357, 1.866214, 0.3723014, 1, 1, 1, 1, 1,
-0.385045, -1.535498, -3.609988, 1, 1, 1, 1, 1,
-0.3844879, 1.173337, -0.7246009, 1, 1, 1, 1, 1,
-0.384123, -0.1221607, -2.034952, 1, 1, 1, 1, 1,
-0.382725, 0.3269651, -1.979541, 1, 1, 1, 1, 1,
-0.3826811, 0.9430938, 0.8163897, 1, 1, 1, 1, 1,
-0.3815002, -0.8155106, -1.916866, 1, 1, 1, 1, 1,
-0.3789879, 0.1964168, -0.0765373, 1, 1, 1, 1, 1,
-0.37628, 0.5439792, -1.250842, 0, 0, 1, 1, 1,
-0.3738176, -0.7622233, -2.784505, 1, 0, 0, 1, 1,
-0.3730856, 0.557939, -0.9215661, 1, 0, 0, 1, 1,
-0.3696394, -0.8243701, -2.685798, 1, 0, 0, 1, 1,
-0.3686576, 0.8605996, -0.2976025, 1, 0, 0, 1, 1,
-0.3659268, 0.134594, -0.5926268, 1, 0, 0, 1, 1,
-0.3644463, 1.008811, -0.01578807, 0, 0, 0, 1, 1,
-0.3628902, -0.86871, -2.756014, 0, 0, 0, 1, 1,
-0.3608897, 0.726745, -0.8707942, 0, 0, 0, 1, 1,
-0.354126, 0.3779559, -1.642143, 0, 0, 0, 1, 1,
-0.3533094, 0.06897925, -2.047179, 0, 0, 0, 1, 1,
-0.3492194, 0.275362, -0.2334742, 0, 0, 0, 1, 1,
-0.3464675, 0.6764421, -1.182398, 0, 0, 0, 1, 1,
-0.3435821, -1.46514, -2.891386, 1, 1, 1, 1, 1,
-0.3346729, -0.6598817, -1.865595, 1, 1, 1, 1, 1,
-0.3326235, 1.483776, -0.02378653, 1, 1, 1, 1, 1,
-0.3310303, -0.4207934, -3.604855, 1, 1, 1, 1, 1,
-0.3223561, -0.5677804, -3.186289, 1, 1, 1, 1, 1,
-0.31936, 0.08282977, -2.425669, 1, 1, 1, 1, 1,
-0.3162849, -1.98702, -2.017526, 1, 1, 1, 1, 1,
-0.3148581, 1.284508, -0.1514185, 1, 1, 1, 1, 1,
-0.3127736, 0.9423046, -1.61286, 1, 1, 1, 1, 1,
-0.3084846, 0.6010514, -1.917105, 1, 1, 1, 1, 1,
-0.3003564, 0.6582893, 0.07165205, 1, 1, 1, 1, 1,
-0.2965291, 0.219235, -0.3079068, 1, 1, 1, 1, 1,
-0.2934761, 1.138703, 0.4275635, 1, 1, 1, 1, 1,
-0.2922078, 1.13747, -0.4743001, 1, 1, 1, 1, 1,
-0.2890137, 1.093068, -0.3073368, 1, 1, 1, 1, 1,
-0.2834257, 1.427513, -0.4547044, 0, 0, 1, 1, 1,
-0.2810947, -0.3510216, -1.403244, 1, 0, 0, 1, 1,
-0.2804538, 0.4124722, -1.861295, 1, 0, 0, 1, 1,
-0.2785691, -0.6667131, -3.023682, 1, 0, 0, 1, 1,
-0.2749542, -1.491042, -3.005816, 1, 0, 0, 1, 1,
-0.2704298, -0.8026538, -1.147781, 1, 0, 0, 1, 1,
-0.2692076, 0.04069144, -3.398682, 0, 0, 0, 1, 1,
-0.2605728, 0.0005916574, -1.689351, 0, 0, 0, 1, 1,
-0.2526066, 0.2409528, -1.454214, 0, 0, 0, 1, 1,
-0.2516888, -0.04284128, -2.325406, 0, 0, 0, 1, 1,
-0.2507329, -0.6639647, -0.9756162, 0, 0, 0, 1, 1,
-0.2478693, 0.5763503, 0.7682278, 0, 0, 0, 1, 1,
-0.2463074, 0.2482464, -1.643865, 0, 0, 0, 1, 1,
-0.2452311, 0.386173, -0.8046752, 1, 1, 1, 1, 1,
-0.2445112, -0.3754041, -1.816268, 1, 1, 1, 1, 1,
-0.2440079, 0.05246837, -1.575901, 1, 1, 1, 1, 1,
-0.240262, -1.000061, -4.603794, 1, 1, 1, 1, 1,
-0.2401371, -1.615207, -3.461938, 1, 1, 1, 1, 1,
-0.2377988, -0.5591806, -3.778747, 1, 1, 1, 1, 1,
-0.2343123, -0.6606051, -2.024649, 1, 1, 1, 1, 1,
-0.2257082, -0.04529944, -2.454506, 1, 1, 1, 1, 1,
-0.2234454, -0.296751, -3.197584, 1, 1, 1, 1, 1,
-0.2206015, 2.913399, 0.6129444, 1, 1, 1, 1, 1,
-0.2205459, 1.242059, -0.8624474, 1, 1, 1, 1, 1,
-0.219801, -1.988121, -3.537289, 1, 1, 1, 1, 1,
-0.2196115, 1.346078, 1.162871, 1, 1, 1, 1, 1,
-0.2169014, 0.3391617, -0.4536234, 1, 1, 1, 1, 1,
-0.216498, -0.7802268, -3.461925, 1, 1, 1, 1, 1,
-0.2121376, -0.5056121, -1.279705, 0, 0, 1, 1, 1,
-0.2045079, 0.9397324, 0.2574324, 1, 0, 0, 1, 1,
-0.2010585, 0.1872268, -0.5607203, 1, 0, 0, 1, 1,
-0.2006122, 0.596154, -1.150007, 1, 0, 0, 1, 1,
-0.1917518, -2.288565, -1.96601, 1, 0, 0, 1, 1,
-0.1913283, -0.9066343, -3.478668, 1, 0, 0, 1, 1,
-0.1859563, 0.7621405, -0.5189306, 0, 0, 0, 1, 1,
-0.1830855, 1.289047, 0.9339618, 0, 0, 0, 1, 1,
-0.1814492, 1.615223, 2.235852, 0, 0, 0, 1, 1,
-0.1799188, -0.809133, -1.824945, 0, 0, 0, 1, 1,
-0.1795071, 0.5375345, -1.091273, 0, 0, 0, 1, 1,
-0.1703806, 0.6806622, -1.23109, 0, 0, 0, 1, 1,
-0.1703158, 1.683645, -1.738881, 0, 0, 0, 1, 1,
-0.1694839, -0.4140713, -3.834971, 1, 1, 1, 1, 1,
-0.1677811, 0.2477934, 0.7169604, 1, 1, 1, 1, 1,
-0.1669762, -0.2579903, -1.373237, 1, 1, 1, 1, 1,
-0.1645795, 0.109639, 0.4790593, 1, 1, 1, 1, 1,
-0.1638222, 0.7384676, -0.1561726, 1, 1, 1, 1, 1,
-0.1593496, -1.256058, -3.456921, 1, 1, 1, 1, 1,
-0.1591051, -0.5244704, -4.404425, 1, 1, 1, 1, 1,
-0.1526731, 0.2376173, -0.04924453, 1, 1, 1, 1, 1,
-0.1524087, -0.5102825, -0.6567768, 1, 1, 1, 1, 1,
-0.1491428, 0.9476318, 0.06574892, 1, 1, 1, 1, 1,
-0.1466631, 1.200217, -0.5846555, 1, 1, 1, 1, 1,
-0.1463046, 0.5954342, -0.2594909, 1, 1, 1, 1, 1,
-0.144737, -0.07965297, -2.954201, 1, 1, 1, 1, 1,
-0.1412595, 1.542051, 0.2712957, 1, 1, 1, 1, 1,
-0.1405579, 1.60625, 0.8593031, 1, 1, 1, 1, 1,
-0.1372049, -0.5276473, -4.579561, 0, 0, 1, 1, 1,
-0.1363172, 0.700215, -0.5483733, 1, 0, 0, 1, 1,
-0.1299539, 0.7796056, -0.4240362, 1, 0, 0, 1, 1,
-0.1240276, -1.356582, -2.604158, 1, 0, 0, 1, 1,
-0.1228108, -0.005268968, -0.07315188, 1, 0, 0, 1, 1,
-0.1189997, -1.572629, -1.641076, 1, 0, 0, 1, 1,
-0.1186658, 0.053005, -0.823134, 0, 0, 0, 1, 1,
-0.1185312, 0.7473987, 0.1748675, 0, 0, 0, 1, 1,
-0.1181178, 0.5117489, -1.399196, 0, 0, 0, 1, 1,
-0.1147557, 0.388624, -1.507714, 0, 0, 0, 1, 1,
-0.1110003, 2.202106, 1.129371, 0, 0, 0, 1, 1,
-0.1106124, 0.6831851, -0.4146333, 0, 0, 0, 1, 1,
-0.1090825, 2.191462, -0.2198849, 0, 0, 0, 1, 1,
-0.105166, 2.176174, 0.4321728, 1, 1, 1, 1, 1,
-0.1022068, -0.815645, -4.773671, 1, 1, 1, 1, 1,
-0.09960669, -0.7969941, -2.330923, 1, 1, 1, 1, 1,
-0.09851191, 0.3509407, -0.5632228, 1, 1, 1, 1, 1,
-0.09444491, -0.4078096, -3.175593, 1, 1, 1, 1, 1,
-0.09046335, -0.7470013, -2.117047, 1, 1, 1, 1, 1,
-0.08921976, 0.703052, -0.5367605, 1, 1, 1, 1, 1,
-0.08761568, 0.2324504, -1.64836, 1, 1, 1, 1, 1,
-0.07513353, 0.3468066, 0.5648921, 1, 1, 1, 1, 1,
-0.06797413, 1.872541, 0.1753417, 1, 1, 1, 1, 1,
-0.06755997, -0.04028508, -1.148364, 1, 1, 1, 1, 1,
-0.05972707, -0.480092, -2.145564, 1, 1, 1, 1, 1,
-0.05740432, 0.4233624, 0.5789071, 1, 1, 1, 1, 1,
-0.05697889, 0.2251628, -0.794398, 1, 1, 1, 1, 1,
-0.05481502, 0.7026627, -0.9784523, 1, 1, 1, 1, 1,
-0.05217734, 0.4406449, 0.7705008, 0, 0, 1, 1, 1,
-0.051724, 0.1391533, -0.01540136, 1, 0, 0, 1, 1,
-0.04368806, 1.569651, 0.2429109, 1, 0, 0, 1, 1,
-0.04219598, 0.2932582, -0.1969325, 1, 0, 0, 1, 1,
-0.04082071, -2.183841, -2.721005, 1, 0, 0, 1, 1,
-0.04014623, -1.017669, -2.399844, 1, 0, 0, 1, 1,
-0.03951525, -0.9157324, -3.698391, 0, 0, 0, 1, 1,
-0.03440424, 0.8638743, -1.021544, 0, 0, 0, 1, 1,
-0.0338827, 0.8572972, 0.200121, 0, 0, 0, 1, 1,
-0.03139745, -0.5295939, -1.736801, 0, 0, 0, 1, 1,
-0.02792398, -2.152437, -4.242874, 0, 0, 0, 1, 1,
-0.02744533, 0.9777403, -0.09981722, 0, 0, 0, 1, 1,
-0.02640846, -0.6452865, -3.412668, 0, 0, 0, 1, 1,
-0.02516924, 1.049865, -1.967802, 1, 1, 1, 1, 1,
-0.02420931, -0.3867857, -4.753811, 1, 1, 1, 1, 1,
-0.02307152, 1.713637, -0.2921649, 1, 1, 1, 1, 1,
-0.02302929, -1.014664, -3.557965, 1, 1, 1, 1, 1,
-0.02042152, 0.356342, 1.075883, 1, 1, 1, 1, 1,
-0.005868887, 0.2862245, -1.171456, 1, 1, 1, 1, 1,
-0.003353764, -0.7681009, -3.082643, 1, 1, 1, 1, 1,
-0.002493071, 1.302253, 0.782308, 1, 1, 1, 1, 1,
0.001502535, 0.2270366, -0.7083309, 1, 1, 1, 1, 1,
0.003585565, -1.301274, 3.166167, 1, 1, 1, 1, 1,
0.00509253, 1.441576, 1.478477, 1, 1, 1, 1, 1,
0.005905271, 0.04178037, 0.6634904, 1, 1, 1, 1, 1,
0.009862175, -0.3019278, 2.141071, 1, 1, 1, 1, 1,
0.01010244, 1.33285, -1.089204, 1, 1, 1, 1, 1,
0.01626495, 0.2812145, 1.584492, 1, 1, 1, 1, 1,
0.02020819, -0.5316306, 4.64898, 0, 0, 1, 1, 1,
0.02567484, -0.05574413, 3.221882, 1, 0, 0, 1, 1,
0.02706598, -0.7925857, 3.6634, 1, 0, 0, 1, 1,
0.02988971, 0.7170274, 0.4958593, 1, 0, 0, 1, 1,
0.03736878, 1.198344, -1.756145, 1, 0, 0, 1, 1,
0.03945012, -0.1813464, 2.99272, 1, 0, 0, 1, 1,
0.04048376, -0.05134092, 4.174527, 0, 0, 0, 1, 1,
0.04730071, 0.4308754, 0.4901624, 0, 0, 0, 1, 1,
0.04775249, 2.102441, 0.2636799, 0, 0, 0, 1, 1,
0.05467612, 0.6557164, 0.5617889, 0, 0, 0, 1, 1,
0.05484181, 0.04963797, -0.3610612, 0, 0, 0, 1, 1,
0.05649524, -0.4946863, 2.750296, 0, 0, 0, 1, 1,
0.05855523, 2.112915, 0.799113, 0, 0, 0, 1, 1,
0.05900395, 1.491152, 1.008182, 1, 1, 1, 1, 1,
0.05969375, -0.599359, 3.773017, 1, 1, 1, 1, 1,
0.06449585, -0.1499415, 2.242921, 1, 1, 1, 1, 1,
0.06917773, 0.2533941, 1.159442, 1, 1, 1, 1, 1,
0.07227605, -0.1918935, 3.618695, 1, 1, 1, 1, 1,
0.07688884, -0.5446522, 1.926914, 1, 1, 1, 1, 1,
0.07885153, -0.06791132, 1.408976, 1, 1, 1, 1, 1,
0.08320363, -0.24963, 3.90379, 1, 1, 1, 1, 1,
0.08341365, 0.5187113, 0.257705, 1, 1, 1, 1, 1,
0.08696919, 2.113007, 1.148666, 1, 1, 1, 1, 1,
0.08757517, 0.3697493, 1.803691, 1, 1, 1, 1, 1,
0.08971933, -0.3862804, 3.697141, 1, 1, 1, 1, 1,
0.09124011, -1.213194, 1.349562, 1, 1, 1, 1, 1,
0.09126078, -1.67484, 1.678729, 1, 1, 1, 1, 1,
0.09410886, -1.024847, 2.509961, 1, 1, 1, 1, 1,
0.09722896, -1.135383, 2.105069, 0, 0, 1, 1, 1,
0.097731, -0.5006313, 3.172287, 1, 0, 0, 1, 1,
0.1027526, 1.223443, 1.355438, 1, 0, 0, 1, 1,
0.1059829, 0.896574, -0.2654978, 1, 0, 0, 1, 1,
0.1077294, 0.1456239, 1.920516, 1, 0, 0, 1, 1,
0.1091979, 0.1824725, 0.3118771, 1, 0, 0, 1, 1,
0.110092, -1.556919, 2.709963, 0, 0, 0, 1, 1,
0.1125609, 0.1150159, 1.024786, 0, 0, 0, 1, 1,
0.1131892, -2.035577, 3.429123, 0, 0, 0, 1, 1,
0.1134484, -0.756379, 3.418742, 0, 0, 0, 1, 1,
0.1135388, -0.4928209, 4.233259, 0, 0, 0, 1, 1,
0.1214488, -0.09077635, 1.397174, 0, 0, 0, 1, 1,
0.1227339, -1.289482, 4.772812, 0, 0, 0, 1, 1,
0.1238054, 0.003852495, 0.3802285, 1, 1, 1, 1, 1,
0.126572, 0.4190484, 1.010346, 1, 1, 1, 1, 1,
0.1296443, 0.7700867, -0.6238075, 1, 1, 1, 1, 1,
0.1339894, -0.6745668, 3.235704, 1, 1, 1, 1, 1,
0.1346721, -2.105205, 2.639131, 1, 1, 1, 1, 1,
0.1352154, -0.8297607, 4.557037, 1, 1, 1, 1, 1,
0.137316, 0.1522269, 0.3343774, 1, 1, 1, 1, 1,
0.1439345, 0.4096798, -0.004889893, 1, 1, 1, 1, 1,
0.1452821, -0.8101909, 2.958164, 1, 1, 1, 1, 1,
0.1472053, -0.7958843, 1.260256, 1, 1, 1, 1, 1,
0.1500372, -0.9376622, 3.052357, 1, 1, 1, 1, 1,
0.1501507, 0.2276777, 0.8021657, 1, 1, 1, 1, 1,
0.1528445, 1.19932, -0.07394488, 1, 1, 1, 1, 1,
0.157222, 1.550441, -0.4570858, 1, 1, 1, 1, 1,
0.1633741, -0.05618102, 2.785398, 1, 1, 1, 1, 1,
0.1709829, -0.5862458, 3.024425, 0, 0, 1, 1, 1,
0.17411, 1.058771, 0.03877686, 1, 0, 0, 1, 1,
0.1744161, 0.2873421, 1.191367, 1, 0, 0, 1, 1,
0.1761118, -1.175376, 3.86413, 1, 0, 0, 1, 1,
0.176826, -0.05470756, 0.4690756, 1, 0, 0, 1, 1,
0.1837267, 0.07717805, 2.076486, 1, 0, 0, 1, 1,
0.187025, 0.4142803, -0.6915466, 0, 0, 0, 1, 1,
0.1880712, 0.6012087, 0.05245785, 0, 0, 0, 1, 1,
0.1927226, -0.8800747, 3.0581, 0, 0, 0, 1, 1,
0.1965898, 0.5076065, 0.30384, 0, 0, 0, 1, 1,
0.2009648, -0.4986048, 4.588594, 0, 0, 0, 1, 1,
0.2012533, 0.5862962, 0.8558921, 0, 0, 0, 1, 1,
0.202324, -0.07549705, 3.708605, 0, 0, 0, 1, 1,
0.2113856, -0.3338464, 1.100031, 1, 1, 1, 1, 1,
0.2129604, -0.1384439, 2.313072, 1, 1, 1, 1, 1,
0.2142039, -0.3572583, 3.093815, 1, 1, 1, 1, 1,
0.2170548, -0.5968821, 1.872442, 1, 1, 1, 1, 1,
0.2177489, 2.302465, -0.6265185, 1, 1, 1, 1, 1,
0.2189396, -1.002536, 2.423267, 1, 1, 1, 1, 1,
0.2189602, -0.8186044, 2.559581, 1, 1, 1, 1, 1,
0.2195557, -1.490403, 3.252412, 1, 1, 1, 1, 1,
0.2219995, -1.519316, 3.143194, 1, 1, 1, 1, 1,
0.2244905, 0.4771297, 0.1871278, 1, 1, 1, 1, 1,
0.2262668, -1.108205, 2.727745, 1, 1, 1, 1, 1,
0.2266275, -0.6540299, 2.620221, 1, 1, 1, 1, 1,
0.2269578, -1.127117, 3.102803, 1, 1, 1, 1, 1,
0.2270388, -0.01603177, 1.824998, 1, 1, 1, 1, 1,
0.2277192, 0.5747109, -0.6372275, 1, 1, 1, 1, 1,
0.2290214, -1.515942, 2.159162, 0, 0, 1, 1, 1,
0.2330701, -1.616964, 3.138942, 1, 0, 0, 1, 1,
0.2357467, 0.0681239, 1.594363, 1, 0, 0, 1, 1,
0.236477, -1.198568, 3.87979, 1, 0, 0, 1, 1,
0.2475363, 0.5310042, 0.9114531, 1, 0, 0, 1, 1,
0.2485523, 0.9537814, -1.466841, 1, 0, 0, 1, 1,
0.2487218, 0.6206016, 1.259946, 0, 0, 0, 1, 1,
0.2503136, 0.08388881, 0.2189279, 0, 0, 0, 1, 1,
0.253474, 1.521141, 0.0638347, 0, 0, 0, 1, 1,
0.2581617, 0.7697573, 0.9247004, 0, 0, 0, 1, 1,
0.2595557, 1.369211, 1.020737, 0, 0, 0, 1, 1,
0.2598659, -0.03666134, 2.855109, 0, 0, 0, 1, 1,
0.2606302, -0.3471779, 3.585688, 0, 0, 0, 1, 1,
0.2632315, -0.659196, 2.12293, 1, 1, 1, 1, 1,
0.2669115, -0.128883, 2.104513, 1, 1, 1, 1, 1,
0.2701038, 0.6360092, 1.408935, 1, 1, 1, 1, 1,
0.2727305, 1.036866, 1.643485, 1, 1, 1, 1, 1,
0.2747812, -0.7475564, 2.661344, 1, 1, 1, 1, 1,
0.2806771, 0.8402575, -0.453267, 1, 1, 1, 1, 1,
0.2829288, -0.3483939, 2.176845, 1, 1, 1, 1, 1,
0.2844539, -0.6547875, 1.522707, 1, 1, 1, 1, 1,
0.2856249, -0.4957184, 3.029726, 1, 1, 1, 1, 1,
0.285991, -0.5024457, 3.083701, 1, 1, 1, 1, 1,
0.286573, 0.1884529, 0.3240041, 1, 1, 1, 1, 1,
0.2896667, 0.0007674923, 1.799398, 1, 1, 1, 1, 1,
0.2909802, -0.1469658, 2.333341, 1, 1, 1, 1, 1,
0.2917393, 1.526401, 1.075792, 1, 1, 1, 1, 1,
0.2917765, 0.2567462, 1.149727, 1, 1, 1, 1, 1,
0.2946569, -0.4112457, 2.997491, 0, 0, 1, 1, 1,
0.2946643, 1.250668, -0.5876623, 1, 0, 0, 1, 1,
0.2952347, -0.9623685, 1.877745, 1, 0, 0, 1, 1,
0.2963789, -2.324705, 4.736136, 1, 0, 0, 1, 1,
0.2991316, -1.846873, 3.469913, 1, 0, 0, 1, 1,
0.3057583, -0.5394077, 2.52936, 1, 0, 0, 1, 1,
0.3105152, 1.093143, 0.9640119, 0, 0, 0, 1, 1,
0.3109362, -0.2125528, 2.907899, 0, 0, 0, 1, 1,
0.3126919, 1.023114, 0.5263067, 0, 0, 0, 1, 1,
0.3134792, 0.8978017, -0.5830106, 0, 0, 0, 1, 1,
0.3153846, -1.116982, 3.547387, 0, 0, 0, 1, 1,
0.3159632, 0.2768866, -0.9717606, 0, 0, 0, 1, 1,
0.3172466, 2.474159, -1.129602, 0, 0, 0, 1, 1,
0.3176256, -0.2602323, 1.937904, 1, 1, 1, 1, 1,
0.3190468, -0.06516333, 4.51863, 1, 1, 1, 1, 1,
0.3225543, 0.2951164, 0.4831851, 1, 1, 1, 1, 1,
0.3231012, -1.239959, 2.859094, 1, 1, 1, 1, 1,
0.324239, -1.460506, 4.543229, 1, 1, 1, 1, 1,
0.327392, 0.9819906, 0.2027011, 1, 1, 1, 1, 1,
0.3314564, -0.5528934, 2.141474, 1, 1, 1, 1, 1,
0.3338643, 1.234991, -1.358047, 1, 1, 1, 1, 1,
0.3354512, 1.374694, 0.7024338, 1, 1, 1, 1, 1,
0.3361763, -2.535125, 3.140138, 1, 1, 1, 1, 1,
0.3435072, 0.04291517, 1.881701, 1, 1, 1, 1, 1,
0.3454759, 0.3923122, 1.361029, 1, 1, 1, 1, 1,
0.3478577, 0.1113003, -0.7052395, 1, 1, 1, 1, 1,
0.3481753, -1.108313, 2.665862, 1, 1, 1, 1, 1,
0.3506801, -1.025621, 1.220775, 1, 1, 1, 1, 1,
0.3528308, -0.4896671, 2.351791, 0, 0, 1, 1, 1,
0.3543589, 0.4392664, 0.05590869, 1, 0, 0, 1, 1,
0.3551004, -0.4792506, 3.072027, 1, 0, 0, 1, 1,
0.358642, 0.009415195, 1.187543, 1, 0, 0, 1, 1,
0.3665752, 0.1525626, 1.944966, 1, 0, 0, 1, 1,
0.3715918, 0.1733904, 0.2653095, 1, 0, 0, 1, 1,
0.3719605, -1.444669, 2.122318, 0, 0, 0, 1, 1,
0.3742396, 0.8155851, 1.333097, 0, 0, 0, 1, 1,
0.3790136, -0.9646741, 3.537232, 0, 0, 0, 1, 1,
0.3804441, 0.08201071, 0.396253, 0, 0, 0, 1, 1,
0.3815874, 0.655786, 0.04488559, 0, 0, 0, 1, 1,
0.3844181, -0.5905037, 2.335397, 0, 0, 0, 1, 1,
0.3854726, -1.326204, 2.84934, 0, 0, 0, 1, 1,
0.3860324, -0.7918295, 2.160789, 1, 1, 1, 1, 1,
0.3861929, 0.09167378, 1.145177, 1, 1, 1, 1, 1,
0.3883446, -0.6995554, 1.775878, 1, 1, 1, 1, 1,
0.3972057, 0.3751367, -0.3501112, 1, 1, 1, 1, 1,
0.397915, -2.570451, 2.223595, 1, 1, 1, 1, 1,
0.3988507, -0.9996694, 2.428681, 1, 1, 1, 1, 1,
0.4019557, 0.3156312, -0.6433992, 1, 1, 1, 1, 1,
0.4062997, -1.097565, 3.459914, 1, 1, 1, 1, 1,
0.4064908, -0.5326707, 3.498233, 1, 1, 1, 1, 1,
0.4102345, 0.618103, 0.3145475, 1, 1, 1, 1, 1,
0.4151258, -1.962603, 2.943852, 1, 1, 1, 1, 1,
0.4175891, -0.1287544, 0.4904607, 1, 1, 1, 1, 1,
0.4214188, -0.112991, 2.53121, 1, 1, 1, 1, 1,
0.4214295, 1.806141, 0.4217345, 1, 1, 1, 1, 1,
0.4216097, -1.993899, 3.848652, 1, 1, 1, 1, 1,
0.4238766, 0.08136287, 2.566498, 0, 0, 1, 1, 1,
0.4253036, -0.2571305, 3.360193, 1, 0, 0, 1, 1,
0.4269865, 0.2698569, 1.30327, 1, 0, 0, 1, 1,
0.4330072, 0.5595555, -0.8875235, 1, 0, 0, 1, 1,
0.4356741, -1.340788, 2.272671, 1, 0, 0, 1, 1,
0.4373664, 0.5218855, 0.4759124, 1, 0, 0, 1, 1,
0.4388943, 1.058102, 1.972826, 0, 0, 0, 1, 1,
0.4400524, 1.615094, -0.03665847, 0, 0, 0, 1, 1,
0.4403824, 1.11832, 0.5265541, 0, 0, 0, 1, 1,
0.440976, -0.03033481, 1.375168, 0, 0, 0, 1, 1,
0.4443516, 1.253966, 0.1697068, 0, 0, 0, 1, 1,
0.445406, -0.2221175, 3.039913, 0, 0, 0, 1, 1,
0.4470103, -1.640287, 2.269758, 0, 0, 0, 1, 1,
0.4481885, -0.05050968, 0.7988393, 1, 1, 1, 1, 1,
0.4507349, -0.7360145, 3.555143, 1, 1, 1, 1, 1,
0.4508123, -0.5909959, 3.76615, 1, 1, 1, 1, 1,
0.4544566, 1.555154, 0.1998135, 1, 1, 1, 1, 1,
0.4575624, -1.638051, 2.390002, 1, 1, 1, 1, 1,
0.4577377, -0.3066431, 2.785713, 1, 1, 1, 1, 1,
0.4588583, 0.6506152, 0.6527519, 1, 1, 1, 1, 1,
0.4615678, -0.5881361, 1.850543, 1, 1, 1, 1, 1,
0.4629607, -1.357915, 2.988254, 1, 1, 1, 1, 1,
0.4647885, 1.37707, -0.965329, 1, 1, 1, 1, 1,
0.4666834, 0.09967633, 2.452152, 1, 1, 1, 1, 1,
0.4745872, -1.21817, 4.743205, 1, 1, 1, 1, 1,
0.4756871, -0.2867427, 0.7011868, 1, 1, 1, 1, 1,
0.4802317, 0.8166445, 0.3870995, 1, 1, 1, 1, 1,
0.483519, -1.817544, 2.176737, 1, 1, 1, 1, 1,
0.4839821, -0.1453148, 1.260559, 0, 0, 1, 1, 1,
0.490517, -0.9001123, 3.358858, 1, 0, 0, 1, 1,
0.496894, 0.5059723, -0.6531553, 1, 0, 0, 1, 1,
0.5000084, -0.09699665, 1.293772, 1, 0, 0, 1, 1,
0.5009181, 0.2774358, 0.3126401, 1, 0, 0, 1, 1,
0.5037233, 0.03786463, 0.434361, 1, 0, 0, 1, 1,
0.5045609, 0.4765925, -0.6365993, 0, 0, 0, 1, 1,
0.5116312, -1.16085, 2.019745, 0, 0, 0, 1, 1,
0.5142785, 0.002774903, 1.697139, 0, 0, 0, 1, 1,
0.5222481, -0.4644519, 1.51524, 0, 0, 0, 1, 1,
0.5287368, -0.2517714, 1.139814, 0, 0, 0, 1, 1,
0.5294033, -0.03095478, 1.83716, 0, 0, 0, 1, 1,
0.5358285, 0.43559, 0.3690803, 0, 0, 0, 1, 1,
0.5448901, -0.5862278, 1.147163, 1, 1, 1, 1, 1,
0.5485312, -1.23171, 2.795505, 1, 1, 1, 1, 1,
0.5590022, -3.460674, 3.554487, 1, 1, 1, 1, 1,
0.5603608, -0.3743499, 2.652274, 1, 1, 1, 1, 1,
0.5642086, 0.00492812, 1.856754, 1, 1, 1, 1, 1,
0.5655503, -2.179811, 2.168518, 1, 1, 1, 1, 1,
0.5667323, -0.208412, 1.035293, 1, 1, 1, 1, 1,
0.567057, -0.219499, 2.212049, 1, 1, 1, 1, 1,
0.5674589, 0.3203382, 2.004706, 1, 1, 1, 1, 1,
0.5837942, 0.07053532, 2.196777, 1, 1, 1, 1, 1,
0.5839456, -0.8366747, 2.712007, 1, 1, 1, 1, 1,
0.5862625, 0.9676644, 0.8622157, 1, 1, 1, 1, 1,
0.5876566, 2.279922, 1.445647, 1, 1, 1, 1, 1,
0.5910415, 1.399357, -0.8729009, 1, 1, 1, 1, 1,
0.5919909, -0.8855975, 1.448224, 1, 1, 1, 1, 1,
0.5997759, -0.1955708, 0.9336191, 0, 0, 1, 1, 1,
0.6018343, 0.937277, 0.8388186, 1, 0, 0, 1, 1,
0.6055978, 0.1499017, 0.4322438, 1, 0, 0, 1, 1,
0.6060355, -0.8704457, 1.485996, 1, 0, 0, 1, 1,
0.6062849, -0.04567677, 3.066587, 1, 0, 0, 1, 1,
0.6087891, -0.6499357, 3.509974, 1, 0, 0, 1, 1,
0.6110221, 0.381794, 1.888783, 0, 0, 0, 1, 1,
0.6133038, -0.350753, 2.990636, 0, 0, 0, 1, 1,
0.6134062, 0.147467, 0.7758201, 0, 0, 0, 1, 1,
0.6141698, 0.4451176, 2.405304, 0, 0, 0, 1, 1,
0.6185168, -0.4177097, 3.694674, 0, 0, 0, 1, 1,
0.6204152, -1.141004, 2.475172, 0, 0, 0, 1, 1,
0.6252024, -1.254809, 2.6267, 0, 0, 0, 1, 1,
0.6283289, 1.343092, 1.235737, 1, 1, 1, 1, 1,
0.6314177, 1.496134, -0.09759399, 1, 1, 1, 1, 1,
0.6328777, 0.2801292, 0.9370815, 1, 1, 1, 1, 1,
0.6333452, -2.088882, 2.934602, 1, 1, 1, 1, 1,
0.6386427, 0.1061714, 1.167153, 1, 1, 1, 1, 1,
0.6390353, -0.1870868, 1.877337, 1, 1, 1, 1, 1,
0.6445099, -1.027417, 5.394528, 1, 1, 1, 1, 1,
0.6448674, -0.6413618, 2.082966, 1, 1, 1, 1, 1,
0.6463813, 0.5053671, 3.839558, 1, 1, 1, 1, 1,
0.6617268, 1.420134, 2.064535, 1, 1, 1, 1, 1,
0.6643772, -0.6237845, 3.45412, 1, 1, 1, 1, 1,
0.6651911, -0.5381423, 0.8032216, 1, 1, 1, 1, 1,
0.666741, -0.07943556, 1.872832, 1, 1, 1, 1, 1,
0.6752057, 0.3327646, 1.742548, 1, 1, 1, 1, 1,
0.6801397, -0.01410517, -0.08568099, 1, 1, 1, 1, 1,
0.6883207, 1.750239, -0.1838879, 0, 0, 1, 1, 1,
0.6908928, 1.194662, 0.2269668, 1, 0, 0, 1, 1,
0.6970057, -1.337431, 2.210874, 1, 0, 0, 1, 1,
0.6975484, 0.1110616, 1.676192, 1, 0, 0, 1, 1,
0.7051202, -0.7830244, 1.931023, 1, 0, 0, 1, 1,
0.7065724, -0.6977229, 2.862119, 1, 0, 0, 1, 1,
0.7099121, -0.7792813, 1.707288, 0, 0, 0, 1, 1,
0.7102901, 0.9774703, 1.743649, 0, 0, 0, 1, 1,
0.7124897, -1.18946, 3.072932, 0, 0, 0, 1, 1,
0.7156931, 1.952483, -0.5037169, 0, 0, 0, 1, 1,
0.7229509, 0.3485542, -0.4059939, 0, 0, 0, 1, 1,
0.7307189, -1.747265, 3.629251, 0, 0, 0, 1, 1,
0.73202, 0.6099772, 1.287212, 0, 0, 0, 1, 1,
0.7401513, -0.3601201, 1.89692, 1, 1, 1, 1, 1,
0.7419505, 0.3862568, 0.2127317, 1, 1, 1, 1, 1,
0.7431054, 0.9542942, 1.439902, 1, 1, 1, 1, 1,
0.7454298, -0.4323138, 2.690112, 1, 1, 1, 1, 1,
0.7454794, 1.419447, 0.4661943, 1, 1, 1, 1, 1,
0.7461157, -1.757372, 1.158282, 1, 1, 1, 1, 1,
0.7493793, -0.07324786, 1.843198, 1, 1, 1, 1, 1,
0.7520901, 0.4342347, 0.8245337, 1, 1, 1, 1, 1,
0.7548736, -0.223001, 2.672361, 1, 1, 1, 1, 1,
0.7569744, 0.1765818, 1.60735, 1, 1, 1, 1, 1,
0.7620609, 0.3496589, 0.3614703, 1, 1, 1, 1, 1,
0.7639994, 0.3564599, 0.6616271, 1, 1, 1, 1, 1,
0.7654847, -0.1988609, 1.950456, 1, 1, 1, 1, 1,
0.7710959, 0.8778054, 2.256905, 1, 1, 1, 1, 1,
0.7824554, -1.427147, 3.539402, 1, 1, 1, 1, 1,
0.7935184, -0.1557007, 3.107772, 0, 0, 1, 1, 1,
0.7966241, -0.3418014, 3.286767, 1, 0, 0, 1, 1,
0.7977651, -0.1787376, 3.389622, 1, 0, 0, 1, 1,
0.8065651, 2.031595, 0.1266802, 1, 0, 0, 1, 1,
0.807102, 0.5444876, 0.8068519, 1, 0, 0, 1, 1,
0.810212, -0.1914393, 1.755275, 1, 0, 0, 1, 1,
0.818629, 0.2034278, -0.1899618, 0, 0, 0, 1, 1,
0.8188788, 1.23061, -0.6681308, 0, 0, 0, 1, 1,
0.8367446, 1.377557, 0.1231297, 0, 0, 0, 1, 1,
0.838003, 0.5261638, 1.755778, 0, 0, 0, 1, 1,
0.8384568, 0.7930347, 0.274964, 0, 0, 0, 1, 1,
0.8396524, 1.613675, -0.8514646, 0, 0, 0, 1, 1,
0.8403702, -0.2190465, 1.82693, 0, 0, 0, 1, 1,
0.8446854, -0.1355505, 2.421512, 1, 1, 1, 1, 1,
0.8450119, 1.393333, 1.356974, 1, 1, 1, 1, 1,
0.8456248, 2.246179, 0.2907085, 1, 1, 1, 1, 1,
0.849308, -0.2228214, 1.633245, 1, 1, 1, 1, 1,
0.850283, 0.6760899, 1.714243, 1, 1, 1, 1, 1,
0.8546054, 0.2984203, 2.315083, 1, 1, 1, 1, 1,
0.8566774, -0.9945764, 1.85423, 1, 1, 1, 1, 1,
0.8578971, 0.8058221, 1.789448, 1, 1, 1, 1, 1,
0.8583939, 0.8514491, 0.4623053, 1, 1, 1, 1, 1,
0.8586144, 0.5851132, 0.1571936, 1, 1, 1, 1, 1,
0.8633316, 0.09607975, 1.346054, 1, 1, 1, 1, 1,
0.8668449, 0.9433819, -0.7681907, 1, 1, 1, 1, 1,
0.8683372, 3.495768, 0.7558311, 1, 1, 1, 1, 1,
0.869975, 1.146395, 1.069399, 1, 1, 1, 1, 1,
0.8708569, 0.3832711, 0.4928182, 1, 1, 1, 1, 1,
0.8735567, -0.6004238, 2.070129, 0, 0, 1, 1, 1,
0.887124, -1.034975, 1.673652, 1, 0, 0, 1, 1,
0.8886409, -0.7484751, 4.597874, 1, 0, 0, 1, 1,
0.8887414, -1.126115, 3.352697, 1, 0, 0, 1, 1,
0.8953388, 0.726969, 0.8542199, 1, 0, 0, 1, 1,
0.8972828, 0.6212333, 2.177407, 1, 0, 0, 1, 1,
0.9037817, 0.1215484, 1.696302, 0, 0, 0, 1, 1,
0.9044978, 1.599905, -0.6116347, 0, 0, 0, 1, 1,
0.9074076, -0.4254441, 2.37983, 0, 0, 0, 1, 1,
0.914139, 1.338118, -0.5674149, 0, 0, 0, 1, 1,
0.9180835, 1.614188, 1.587603, 0, 0, 0, 1, 1,
0.9263127, 0.2889381, 1.830987, 0, 0, 0, 1, 1,
0.9265286, 0.3974288, 2.77726, 0, 0, 0, 1, 1,
0.9265343, 0.1079764, 1.325384, 1, 1, 1, 1, 1,
0.9298781, 0.435352, 2.396502, 1, 1, 1, 1, 1,
0.934329, -0.198817, 2.123823, 1, 1, 1, 1, 1,
0.9441207, 1.51785, 1.252365, 1, 1, 1, 1, 1,
0.95005, 1.615759, 2.494497, 1, 1, 1, 1, 1,
0.9524906, -1.407677, 2.909886, 1, 1, 1, 1, 1,
0.9527656, -1.18897, 3.383912, 1, 1, 1, 1, 1,
0.9577596, -0.9304155, 2.916243, 1, 1, 1, 1, 1,
0.9602712, -1.26268, 0.02874202, 1, 1, 1, 1, 1,
0.9672205, 0.1977402, -0.598336, 1, 1, 1, 1, 1,
0.9683607, -0.01434434, 1.29264, 1, 1, 1, 1, 1,
0.9687153, -1.303669, 1.260992, 1, 1, 1, 1, 1,
0.9736235, -0.7134414, 3.337738, 1, 1, 1, 1, 1,
0.9746801, 1.430108, -0.5492495, 1, 1, 1, 1, 1,
0.9771038, -1.846966, 2.933939, 1, 1, 1, 1, 1,
0.9799474, -0.9276512, 3.847026, 0, 0, 1, 1, 1,
0.9840962, -0.05486437, 0.4135234, 1, 0, 0, 1, 1,
0.9914192, 0.3186523, 1.790561, 1, 0, 0, 1, 1,
0.992061, 0.4516191, 1.779656, 1, 0, 0, 1, 1,
0.9953943, 0.7968492, 1.560429, 1, 0, 0, 1, 1,
1.000663, -1.018848, 3.838404, 1, 0, 0, 1, 1,
1.001205, -1.012361, 3.128689, 0, 0, 0, 1, 1,
1.002255, -0.2210846, 2.745528, 0, 0, 0, 1, 1,
1.006855, 0.7712806, -0.848124, 0, 0, 0, 1, 1,
1.00857, 0.02718847, 0.9802755, 0, 0, 0, 1, 1,
1.009747, -0.2305824, 2.806819, 0, 0, 0, 1, 1,
1.011364, 0.270862, 2.378279, 0, 0, 0, 1, 1,
1.01377, 0.9957342, 0.9720038, 0, 0, 0, 1, 1,
1.014556, -0.3049897, 2.502227, 1, 1, 1, 1, 1,
1.014655, 0.1960292, 2.249212, 1, 1, 1, 1, 1,
1.016621, 0.5892209, -0.0303932, 1, 1, 1, 1, 1,
1.023782, 0.385746, -0.1058232, 1, 1, 1, 1, 1,
1.027508, 1.472322, 2.385003, 1, 1, 1, 1, 1,
1.027764, 0.6929067, -0.2694461, 1, 1, 1, 1, 1,
1.030168, 0.8336307, 1.243394, 1, 1, 1, 1, 1,
1.033175, 0.1365872, 2.684391, 1, 1, 1, 1, 1,
1.054193, 0.2617836, 2.252566, 1, 1, 1, 1, 1,
1.06195, -0.4341851, 2.050697, 1, 1, 1, 1, 1,
1.077891, 1.718248, 2.315452, 1, 1, 1, 1, 1,
1.079103, 1.165221, 1.077733, 1, 1, 1, 1, 1,
1.080551, 1.434974, 0.6611881, 1, 1, 1, 1, 1,
1.085174, 1.608387, 0.9821224, 1, 1, 1, 1, 1,
1.092579, -0.9531712, 2.635879, 1, 1, 1, 1, 1,
1.092778, 0.09795233, 2.142712, 0, 0, 1, 1, 1,
1.09297, 0.3857359, 2.097374, 1, 0, 0, 1, 1,
1.102067, -0.8685092, 2.207446, 1, 0, 0, 1, 1,
1.103876, -0.5534672, 3.298269, 1, 0, 0, 1, 1,
1.10397, 0.3041647, 1.920936, 1, 0, 0, 1, 1,
1.108023, 0.3580289, -0.02354175, 1, 0, 0, 1, 1,
1.108668, -0.3689693, -0.01635976, 0, 0, 0, 1, 1,
1.120941, -1.191017, 2.573838, 0, 0, 0, 1, 1,
1.128353, 0.1653881, 1.413927, 0, 0, 0, 1, 1,
1.134905, -0.1849741, 2.120281, 0, 0, 0, 1, 1,
1.146396, 0.8426591, -0.03889589, 0, 0, 0, 1, 1,
1.151178, 0.3023707, 1.496904, 0, 0, 0, 1, 1,
1.154602, -0.3932435, 1.937175, 0, 0, 0, 1, 1,
1.156048, 1.607329, 0.8657541, 1, 1, 1, 1, 1,
1.166839, 0.2052789, 2.146664, 1, 1, 1, 1, 1,
1.170078, -0.7079962, 0.7016856, 1, 1, 1, 1, 1,
1.170365, -2.397545, 4.329519, 1, 1, 1, 1, 1,
1.172886, -1.276177, 2.80835, 1, 1, 1, 1, 1,
1.179476, 0.9470552, 1.556309, 1, 1, 1, 1, 1,
1.181708, 0.0783525, 1.201781, 1, 1, 1, 1, 1,
1.185393, 0.6268898, 1.62136, 1, 1, 1, 1, 1,
1.19974, 2.08176, 1.731552, 1, 1, 1, 1, 1,
1.204285, -1.421197, 1.860634, 1, 1, 1, 1, 1,
1.211558, 1.002366, 1.694526, 1, 1, 1, 1, 1,
1.213117, 1.995735, 1.34292, 1, 1, 1, 1, 1,
1.215957, -0.7369704, -0.087042, 1, 1, 1, 1, 1,
1.220716, 0.8422656, 0.4578561, 1, 1, 1, 1, 1,
1.225154, 0.2936733, 0.7164976, 1, 1, 1, 1, 1,
1.231826, -0.4848113, 2.467853, 0, 0, 1, 1, 1,
1.236182, -0.8177325, 2.744641, 1, 0, 0, 1, 1,
1.237755, 0.1834252, 1.790072, 1, 0, 0, 1, 1,
1.237987, -0.3406546, 0.8974866, 1, 0, 0, 1, 1,
1.244772, 1.189276, 1.302424, 1, 0, 0, 1, 1,
1.255256, -0.90253, 0.2223369, 1, 0, 0, 1, 1,
1.256409, -0.07390539, 0.1300553, 0, 0, 0, 1, 1,
1.257516, -0.3101168, 2.627197, 0, 0, 0, 1, 1,
1.259676, -1.276374, 1.41553, 0, 0, 0, 1, 1,
1.261186, -0.974519, 2.810329, 0, 0, 0, 1, 1,
1.263272, 0.0167112, 2.245278, 0, 0, 0, 1, 1,
1.265917, -0.8820129, 1.294464, 0, 0, 0, 1, 1,
1.270907, 0.5319555, 0.008946632, 0, 0, 0, 1, 1,
1.272385, -0.818601, 2.659265, 1, 1, 1, 1, 1,
1.277137, -1.01386, 3.065864, 1, 1, 1, 1, 1,
1.282182, -0.2820108, 3.998653, 1, 1, 1, 1, 1,
1.29117, 0.418543, 1.68273, 1, 1, 1, 1, 1,
1.292996, -0.6561757, 1.264529, 1, 1, 1, 1, 1,
1.300189, -1.248255, 2.80653, 1, 1, 1, 1, 1,
1.301762, -0.2248492, 3.382934, 1, 1, 1, 1, 1,
1.310549, -0.1269312, 2.942197, 1, 1, 1, 1, 1,
1.322158, -0.1208183, 2.239803, 1, 1, 1, 1, 1,
1.323801, 1.214362, 0.2114662, 1, 1, 1, 1, 1,
1.32444, -0.3567768, 1.385241, 1, 1, 1, 1, 1,
1.330699, -0.3483041, 0.8394415, 1, 1, 1, 1, 1,
1.333725, -0.5641098, 2.094681, 1, 1, 1, 1, 1,
1.334604, 2.187115, -0.1926238, 1, 1, 1, 1, 1,
1.335258, 0.8098747, 0.8676941, 1, 1, 1, 1, 1,
1.338957, 1.423987, -0.1507169, 0, 0, 1, 1, 1,
1.344733, -0.2864738, 0.3863392, 1, 0, 0, 1, 1,
1.353654, -0.1973366, 0.1512905, 1, 0, 0, 1, 1,
1.364415, -1.125589, 1.356103, 1, 0, 0, 1, 1,
1.367108, -0.5626367, 1.056231, 1, 0, 0, 1, 1,
1.373141, 0.04156281, 1.229806, 1, 0, 0, 1, 1,
1.37637, 0.574901, 0.1735436, 0, 0, 0, 1, 1,
1.379855, 0.9655781, 1.67015, 0, 0, 0, 1, 1,
1.382056, -0.684526, 4.380265, 0, 0, 0, 1, 1,
1.382351, 1.200993, 0.3625337, 0, 0, 0, 1, 1,
1.394759, 0.08179039, 2.666208, 0, 0, 0, 1, 1,
1.395827, -0.1904166, 2.369838, 0, 0, 0, 1, 1,
1.406883, -1.12744, 2.15178, 0, 0, 0, 1, 1,
1.425056, -0.1276558, 0.2825794, 1, 1, 1, 1, 1,
1.443999, -0.3978859, 1.359856, 1, 1, 1, 1, 1,
1.444473, 1.125496, 2.063911, 1, 1, 1, 1, 1,
1.458244, -0.6103495, 1.506498, 1, 1, 1, 1, 1,
1.462626, 0.9212318, 1.185223, 1, 1, 1, 1, 1,
1.468157, -1.165411, 3.603001, 1, 1, 1, 1, 1,
1.473342, 1.473723, 0.4851259, 1, 1, 1, 1, 1,
1.48257, -1.222592, 2.374805, 1, 1, 1, 1, 1,
1.498216, 0.03340586, -0.1518247, 1, 1, 1, 1, 1,
1.499561, -1.04912, 2.803468, 1, 1, 1, 1, 1,
1.501332, -1.564324, 3.660837, 1, 1, 1, 1, 1,
1.508858, -1.241413, 2.689504, 1, 1, 1, 1, 1,
1.513643, 0.4770057, 0.2637299, 1, 1, 1, 1, 1,
1.528725, -1.232273, 2.756574, 1, 1, 1, 1, 1,
1.542551, 0.7701201, 0.9110049, 1, 1, 1, 1, 1,
1.568264, -0.4280099, 0.565911, 0, 0, 1, 1, 1,
1.568868, -0.5474868, 1.51264, 1, 0, 0, 1, 1,
1.577971, -0.8645201, 0.7551209, 1, 0, 0, 1, 1,
1.58868, -0.9662017, 2.626951, 1, 0, 0, 1, 1,
1.591667, -0.3974175, 1.197566, 1, 0, 0, 1, 1,
1.607895, -2.177153, 3.744662, 1, 0, 0, 1, 1,
1.614802, 0.6957318, 1.675073, 0, 0, 0, 1, 1,
1.649461, -0.7230086, 3.162952, 0, 0, 0, 1, 1,
1.654496, -0.7828119, 2.621891, 0, 0, 0, 1, 1,
1.658789, -0.9338537, 1.529409, 0, 0, 0, 1, 1,
1.708063, -0.3129361, 0.04744429, 0, 0, 0, 1, 1,
1.719505, 0.3604815, 1.928963, 0, 0, 0, 1, 1,
1.73359, -0.4209114, 1.919966, 0, 0, 0, 1, 1,
1.741937, -0.9426661, 2.603261, 1, 1, 1, 1, 1,
1.756536, -0.3440447, 2.443896, 1, 1, 1, 1, 1,
1.768323, 0.4194469, 1.084937, 1, 1, 1, 1, 1,
1.773605, -1.749709, 2.287527, 1, 1, 1, 1, 1,
1.78013, -0.8286862, 2.826617, 1, 1, 1, 1, 1,
1.783075, -1.141727, 1.794579, 1, 1, 1, 1, 1,
1.797165, -0.7443099, 1.269801, 1, 1, 1, 1, 1,
1.805145, 1.463508, 1.50969, 1, 1, 1, 1, 1,
1.811899, -1.649875, 1.571138, 1, 1, 1, 1, 1,
1.835406, 0.3492593, 0.2351262, 1, 1, 1, 1, 1,
1.854771, -0.4547934, 2.111257, 1, 1, 1, 1, 1,
1.872962, 0.331943, 1.520985, 1, 1, 1, 1, 1,
1.892806, 1.134549, 2.857399, 1, 1, 1, 1, 1,
1.895383, -0.007600699, -0.1863143, 1, 1, 1, 1, 1,
1.898143, -0.9870338, 1.521568, 1, 1, 1, 1, 1,
1.929305, 1.270726, 1.825929, 0, 0, 1, 1, 1,
1.96225, -1.133384, 1.863812, 1, 0, 0, 1, 1,
1.968777, -0.333375, 1.113328, 1, 0, 0, 1, 1,
1.988687, -0.5375454, 2.0058, 1, 0, 0, 1, 1,
1.990397, 1.692193, 1.840761, 1, 0, 0, 1, 1,
2.009982, 0.6188315, 2.174012, 1, 0, 0, 1, 1,
2.019527, -0.7341024, 3.275514, 0, 0, 0, 1, 1,
2.059682, -2.420012, 1.729031, 0, 0, 0, 1, 1,
2.071081, 0.6914573, 2.148782, 0, 0, 0, 1, 1,
2.13909, 0.7706993, 0.5954252, 0, 0, 0, 1, 1,
2.225245, 0.2977245, 0.9984553, 0, 0, 0, 1, 1,
2.253077, 1.762897, 1.023532, 0, 0, 0, 1, 1,
2.285554, -0.6807035, 1.431945, 0, 0, 0, 1, 1,
2.384365, 0.0980268, 1.645928, 1, 1, 1, 1, 1,
2.459415, 1.129426, 0.9969034, 1, 1, 1, 1, 1,
2.466798, 0.5414611, 0.563727, 1, 1, 1, 1, 1,
2.491832, -0.4504787, 0.4479629, 1, 1, 1, 1, 1,
2.562528, -0.2893569, 0.6405701, 1, 1, 1, 1, 1,
2.7147, 0.3284741, -0.4543744, 1, 1, 1, 1, 1,
3.308578, -0.08650373, 0.9301322, 1, 1, 1, 1, 1
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
var radius = 9.441477;
var distance = 33.16279;
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
mvMatrix.translate( -0.2342764, -0.01754713, -0.3104286 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16279);
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
