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
-3.073713, 0.114514, -2.935707, 1, 0, 0, 1,
-3.002629, 0.8569654, -1.209916, 1, 0.007843138, 0, 1,
-2.975265, -0.8082546, -0.6954008, 1, 0.01176471, 0, 1,
-2.826104, 1.426526, -1.461967, 1, 0.01960784, 0, 1,
-2.806134, -0.6050369, -1.545905, 1, 0.02352941, 0, 1,
-2.748166, 0.5432178, -1.83153, 1, 0.03137255, 0, 1,
-2.559278, -0.1601201, -1.568839, 1, 0.03529412, 0, 1,
-2.491651, -1.063421, -1.530752, 1, 0.04313726, 0, 1,
-2.47952, -0.6416813, -1.557042, 1, 0.04705882, 0, 1,
-2.40493, -1.416008, -1.449544, 1, 0.05490196, 0, 1,
-2.363995, -0.8433276, -2.854718, 1, 0.05882353, 0, 1,
-2.342453, -1.623257, -2.855183, 1, 0.06666667, 0, 1,
-2.255512, -0.8532413, -2.10449, 1, 0.07058824, 0, 1,
-2.250153, 0.6600417, 0.9319959, 1, 0.07843138, 0, 1,
-2.214909, -0.3659959, -2.295514, 1, 0.08235294, 0, 1,
-2.212774, -0.5280189, -4.580187, 1, 0.09019608, 0, 1,
-2.162426, 0.2512124, -0.156206, 1, 0.09411765, 0, 1,
-2.156981, -0.200193, -2.118715, 1, 0.1019608, 0, 1,
-2.105394, -0.1416812, -2.196734, 1, 0.1098039, 0, 1,
-2.102882, -1.615436, -3.050039, 1, 0.1137255, 0, 1,
-2.023175, 1.102029, -0.9539791, 1, 0.1215686, 0, 1,
-2.012369, -0.7581441, -2.370532, 1, 0.1254902, 0, 1,
-2.007084, -1.632888, -0.6012225, 1, 0.1333333, 0, 1,
-2.002866, -0.3984371, -1.376204, 1, 0.1372549, 0, 1,
-1.992686, 1.882097, -1.829314, 1, 0.145098, 0, 1,
-1.962459, -0.5067183, -0.7247863, 1, 0.1490196, 0, 1,
-1.95541, -0.5830128, -2.765918, 1, 0.1568628, 0, 1,
-1.913764, 1.259775, 0.3544619, 1, 0.1607843, 0, 1,
-1.908657, 2.548457, -0.2339981, 1, 0.1686275, 0, 1,
-1.907684, -0.4954893, -1.336305, 1, 0.172549, 0, 1,
-1.886064, -1.057572, -1.934761, 1, 0.1803922, 0, 1,
-1.877917, -0.8327209, -1.853395, 1, 0.1843137, 0, 1,
-1.869085, -2.142997, -2.058307, 1, 0.1921569, 0, 1,
-1.847526, 1.649944, -2.781535, 1, 0.1960784, 0, 1,
-1.836922, 0.8127934, -0.8340075, 1, 0.2039216, 0, 1,
-1.824345, -0.7610524, -2.129749, 1, 0.2117647, 0, 1,
-1.820088, 0.05012674, -1.242591, 1, 0.2156863, 0, 1,
-1.813516, 0.7475945, -1.404677, 1, 0.2235294, 0, 1,
-1.789415, 0.4009289, -0.1768854, 1, 0.227451, 0, 1,
-1.783791, 0.1951425, 0.1296182, 1, 0.2352941, 0, 1,
-1.771469, -2.569808, -3.639999, 1, 0.2392157, 0, 1,
-1.767597, 0.90479, -0.7653174, 1, 0.2470588, 0, 1,
-1.759722, -0.09452167, -2.102943, 1, 0.2509804, 0, 1,
-1.757796, 1.475086, 0.3101723, 1, 0.2588235, 0, 1,
-1.729591, -0.7274753, -2.250033, 1, 0.2627451, 0, 1,
-1.728169, 0.39797, -1.605898, 1, 0.2705882, 0, 1,
-1.691482, 0.7925122, 0.2378772, 1, 0.2745098, 0, 1,
-1.690394, -1.609414, -0.560635, 1, 0.282353, 0, 1,
-1.68799, -0.1693784, -1.043127, 1, 0.2862745, 0, 1,
-1.682955, -0.3382411, -3.284859, 1, 0.2941177, 0, 1,
-1.682484, -1.181215, -1.095052, 1, 0.3019608, 0, 1,
-1.67408, -2.512331, -3.329752, 1, 0.3058824, 0, 1,
-1.662264, 0.3156773, -0.08424775, 1, 0.3137255, 0, 1,
-1.654399, 0.1118306, -1.36326, 1, 0.3176471, 0, 1,
-1.649924, 1.635313, -1.288208, 1, 0.3254902, 0, 1,
-1.642869, 0.1967294, -2.027841, 1, 0.3294118, 0, 1,
-1.628306, -0.4613172, -4.287652, 1, 0.3372549, 0, 1,
-1.609878, 0.7152337, -0.6087527, 1, 0.3411765, 0, 1,
-1.600639, 0.1834333, -2.694791, 1, 0.3490196, 0, 1,
-1.583679, -1.074779, -1.143036, 1, 0.3529412, 0, 1,
-1.577474, 0.4924434, -1.152728, 1, 0.3607843, 0, 1,
-1.557892, 1.138551, -0.7784659, 1, 0.3647059, 0, 1,
-1.548927, -0.08782007, -2.219927, 1, 0.372549, 0, 1,
-1.548298, -0.04345318, -0.8874818, 1, 0.3764706, 0, 1,
-1.535728, 0.3272855, -2.206276, 1, 0.3843137, 0, 1,
-1.535537, -2.155403, -3.720519, 1, 0.3882353, 0, 1,
-1.52616, 1.106756, -0.7463743, 1, 0.3960784, 0, 1,
-1.522466, -1.019825, -2.470912, 1, 0.4039216, 0, 1,
-1.521036, -1.054633, -3.236669, 1, 0.4078431, 0, 1,
-1.518577, 0.6125947, -0.938493, 1, 0.4156863, 0, 1,
-1.51812, 0.05846613, -2.445889, 1, 0.4196078, 0, 1,
-1.515207, 0.4158733, -3.190106, 1, 0.427451, 0, 1,
-1.505743, 0.922469, -1.692912, 1, 0.4313726, 0, 1,
-1.505495, 0.1918479, -1.907357, 1, 0.4392157, 0, 1,
-1.503639, 0.8103142, -0.8190463, 1, 0.4431373, 0, 1,
-1.500369, 1.14664, -1.06234, 1, 0.4509804, 0, 1,
-1.49332, 0.1336496, -2.483627, 1, 0.454902, 0, 1,
-1.486746, -1.246401, -1.577477, 1, 0.4627451, 0, 1,
-1.481724, 0.8212521, -0.1876904, 1, 0.4666667, 0, 1,
-1.47214, -0.1081728, -3.169887, 1, 0.4745098, 0, 1,
-1.45521, 0.7949228, -0.09375072, 1, 0.4784314, 0, 1,
-1.452847, -0.06224899, -1.516484, 1, 0.4862745, 0, 1,
-1.45284, 0.1148483, -1.589633, 1, 0.4901961, 0, 1,
-1.439906, -0.6917184, -0.4111555, 1, 0.4980392, 0, 1,
-1.43496, 0.3959077, -1.134861, 1, 0.5058824, 0, 1,
-1.415339, 0.2102593, -1.632392, 1, 0.509804, 0, 1,
-1.409847, -0.380817, -1.140867, 1, 0.5176471, 0, 1,
-1.409519, -0.5055791, -2.217579, 1, 0.5215687, 0, 1,
-1.398691, 0.9761416, 0.3845808, 1, 0.5294118, 0, 1,
-1.398383, -0.6345026, -2.775639, 1, 0.5333334, 0, 1,
-1.392033, -1.344798, -2.615566, 1, 0.5411765, 0, 1,
-1.391853, -1.266101, -2.342284, 1, 0.5450981, 0, 1,
-1.38015, 1.197892, -0.9580724, 1, 0.5529412, 0, 1,
-1.3714, -0.07047671, -2.243598, 1, 0.5568628, 0, 1,
-1.367432, -0.4003611, -3.830612, 1, 0.5647059, 0, 1,
-1.365408, -0.08020024, -1.607379, 1, 0.5686275, 0, 1,
-1.353184, 2.171993, 0.9652118, 1, 0.5764706, 0, 1,
-1.349973, -0.6344649, -0.2931209, 1, 0.5803922, 0, 1,
-1.341703, -0.4891697, -4.173442, 1, 0.5882353, 0, 1,
-1.341187, -1.235546, -3.023039, 1, 0.5921569, 0, 1,
-1.340443, 0.2100839, -3.152856, 1, 0.6, 0, 1,
-1.339456, 0.3095118, -2.84473, 1, 0.6078432, 0, 1,
-1.339441, 1.321265, -0.447916, 1, 0.6117647, 0, 1,
-1.337861, -1.147599, -0.6156918, 1, 0.6196079, 0, 1,
-1.337445, 1.465185, 0.02155764, 1, 0.6235294, 0, 1,
-1.336173, 1.116692, 0.5771336, 1, 0.6313726, 0, 1,
-1.335533, -1.505666, -1.765282, 1, 0.6352941, 0, 1,
-1.324534, 0.8592965, -1.727051, 1, 0.6431373, 0, 1,
-1.307639, 2.188641, -0.6242293, 1, 0.6470588, 0, 1,
-1.307226, 1.19851, 0.350198, 1, 0.654902, 0, 1,
-1.301298, 0.6325549, 0.3802237, 1, 0.6588235, 0, 1,
-1.295673, 0.479335, 0.8916018, 1, 0.6666667, 0, 1,
-1.282222, 0.2144815, -0.6323346, 1, 0.6705883, 0, 1,
-1.272573, -0.1255306, -2.117389, 1, 0.6784314, 0, 1,
-1.269374, 0.1145598, -0.5248156, 1, 0.682353, 0, 1,
-1.267215, -0.2216479, -0.8311041, 1, 0.6901961, 0, 1,
-1.266731, 0.4128952, 0.7737156, 1, 0.6941177, 0, 1,
-1.262423, -0.08031102, -1.014799, 1, 0.7019608, 0, 1,
-1.260307, 0.2175756, -3.078137, 1, 0.7098039, 0, 1,
-1.254682, -0.1927839, -0.8511024, 1, 0.7137255, 0, 1,
-1.251284, -0.03166838, -0.9177126, 1, 0.7215686, 0, 1,
-1.247595, -0.1205321, -2.036583, 1, 0.7254902, 0, 1,
-1.236183, -0.7561349, -3.240867, 1, 0.7333333, 0, 1,
-1.231588, -1.563278, -2.706816, 1, 0.7372549, 0, 1,
-1.225776, -0.3971001, 0.01313534, 1, 0.7450981, 0, 1,
-1.223068, -0.8381608, -2.561603, 1, 0.7490196, 0, 1,
-1.215564, -0.285697, -2.131579, 1, 0.7568628, 0, 1,
-1.209987, 0.8421735, -1.320134, 1, 0.7607843, 0, 1,
-1.202296, 2.10858, -2.107252, 1, 0.7686275, 0, 1,
-1.189834, 0.2089485, -0.1118008, 1, 0.772549, 0, 1,
-1.175041, 1.705967, 0.1899615, 1, 0.7803922, 0, 1,
-1.173317, 0.5261587, -2.128417, 1, 0.7843137, 0, 1,
-1.167324, 0.9956877, -2.170171, 1, 0.7921569, 0, 1,
-1.164454, 2.766095, -0.5201547, 1, 0.7960784, 0, 1,
-1.157475, 1.427613, 0.6521901, 1, 0.8039216, 0, 1,
-1.15445, -2.379113, -1.944347, 1, 0.8117647, 0, 1,
-1.146911, -1.36065, -2.491894, 1, 0.8156863, 0, 1,
-1.146515, 1.201104, -2.895022, 1, 0.8235294, 0, 1,
-1.139059, -0.3326424, -1.018895, 1, 0.827451, 0, 1,
-1.135571, 0.7973972, -1.205177, 1, 0.8352941, 0, 1,
-1.128449, -0.8423234, -1.365225, 1, 0.8392157, 0, 1,
-1.124473, 1.107643, -0.3675322, 1, 0.8470588, 0, 1,
-1.124092, -0.6426542, -1.856175, 1, 0.8509804, 0, 1,
-1.123856, 0.4589966, 0.5389537, 1, 0.8588235, 0, 1,
-1.113998, -1.537865, -2.579347, 1, 0.8627451, 0, 1,
-1.113565, 2.303055, 0.5242274, 1, 0.8705882, 0, 1,
-1.10858, 0.3271971, -2.383849, 1, 0.8745098, 0, 1,
-1.107231, 0.9605023, -0.3173247, 1, 0.8823529, 0, 1,
-1.102281, 0.2718267, -0.700767, 1, 0.8862745, 0, 1,
-1.096365, 1.662765, -0.8768657, 1, 0.8941177, 0, 1,
-1.095036, 0.1152538, 0.7963949, 1, 0.8980392, 0, 1,
-1.087733, 0.9390447, -0.5392132, 1, 0.9058824, 0, 1,
-1.08712, -0.2714964, -1.396939, 1, 0.9137255, 0, 1,
-1.072959, 1.221584, -1.323351, 1, 0.9176471, 0, 1,
-1.070904, 0.2928212, -0.9855909, 1, 0.9254902, 0, 1,
-1.070218, -1.589695, -1.910195, 1, 0.9294118, 0, 1,
-1.069057, -0.8268125, -3.397299, 1, 0.9372549, 0, 1,
-1.061523, 0.4972923, 0.1529311, 1, 0.9411765, 0, 1,
-1.060844, -0.9164537, -2.613485, 1, 0.9490196, 0, 1,
-1.055644, -1.374638, -2.886075, 1, 0.9529412, 0, 1,
-1.054395, 0.03169351, -5.238377, 1, 0.9607843, 0, 1,
-1.042958, -1.027251, -1.755995, 1, 0.9647059, 0, 1,
-1.041814, -0.8263918, -1.228102, 1, 0.972549, 0, 1,
-1.041318, -0.9379066, -1.051102, 1, 0.9764706, 0, 1,
-1.039266, -1.254018, -2.77125, 1, 0.9843137, 0, 1,
-1.035334, -2.484732, -4.36928, 1, 0.9882353, 0, 1,
-1.034087, -0.5206097, -0.8644333, 1, 0.9960784, 0, 1,
-1.025197, -1.054103, -3.329355, 0.9960784, 1, 0, 1,
-1.020211, -0.5816419, -1.057772, 0.9921569, 1, 0, 1,
-1.016891, 1.184076, -1.483524, 0.9843137, 1, 0, 1,
-1.010062, -0.6836443, -2.281831, 0.9803922, 1, 0, 1,
-1.003899, -1.64194, -4.063743, 0.972549, 1, 0, 1,
-0.9970694, -1.514545, -2.629735, 0.9686275, 1, 0, 1,
-0.996379, 0.01564721, -0.9802095, 0.9607843, 1, 0, 1,
-0.994704, 1.2778, -1.68116, 0.9568627, 1, 0, 1,
-0.9942402, -1.046343, -3.886675, 0.9490196, 1, 0, 1,
-0.9900265, -0.4172057, -2.128788, 0.945098, 1, 0, 1,
-0.9892066, -1.008698, -3.153786, 0.9372549, 1, 0, 1,
-0.9887339, -0.8213863, -2.858028, 0.9333333, 1, 0, 1,
-0.9880843, -1.650099, -1.852615, 0.9254902, 1, 0, 1,
-0.9784976, -0.8054317, -2.868185, 0.9215686, 1, 0, 1,
-0.9771206, 2.344653, -0.3591903, 0.9137255, 1, 0, 1,
-0.9736393, 0.3370943, -1.057409, 0.9098039, 1, 0, 1,
-0.9705917, -1.823107, -1.833001, 0.9019608, 1, 0, 1,
-0.9699055, 0.2061801, -2.191584, 0.8941177, 1, 0, 1,
-0.9636312, -0.2651684, -3.825513, 0.8901961, 1, 0, 1,
-0.9627228, -1.037941, -2.264174, 0.8823529, 1, 0, 1,
-0.9604185, 0.130983, -1.779873, 0.8784314, 1, 0, 1,
-0.9593332, -0.6457736, -2.982732, 0.8705882, 1, 0, 1,
-0.9531322, -0.6076702, -2.186951, 0.8666667, 1, 0, 1,
-0.9522682, -0.9474345, -1.574017, 0.8588235, 1, 0, 1,
-0.9518042, -0.2595437, -3.574291, 0.854902, 1, 0, 1,
-0.9458574, -0.3974253, -3.02785, 0.8470588, 1, 0, 1,
-0.9408966, -0.8144232, -1.609146, 0.8431373, 1, 0, 1,
-0.9364388, 0.6441568, -2.762542, 0.8352941, 1, 0, 1,
-0.9245458, 0.1702493, -1.223825, 0.8313726, 1, 0, 1,
-0.9230303, -1.769358, -4.309888, 0.8235294, 1, 0, 1,
-0.9227542, -0.8212236, -1.837351, 0.8196079, 1, 0, 1,
-0.9212369, -0.1717875, -1.756896, 0.8117647, 1, 0, 1,
-0.9100783, 0.7342309, -2.186211, 0.8078431, 1, 0, 1,
-0.9098145, 1.156019, -0.4228773, 0.8, 1, 0, 1,
-0.9033154, 0.04953931, -2.302056, 0.7921569, 1, 0, 1,
-0.9014456, 0.9231163, -1.967866, 0.7882353, 1, 0, 1,
-0.8940835, 0.1700489, -0.8194763, 0.7803922, 1, 0, 1,
-0.89248, -1.27804, -3.03591, 0.7764706, 1, 0, 1,
-0.8832158, -0.1982245, -0.2636967, 0.7686275, 1, 0, 1,
-0.8811841, -0.445622, -3.862641, 0.7647059, 1, 0, 1,
-0.8783908, 0.8979468, -1.547403, 0.7568628, 1, 0, 1,
-0.8781516, 0.6418675, -0.4009995, 0.7529412, 1, 0, 1,
-0.8772598, -0.42582, -2.749787, 0.7450981, 1, 0, 1,
-0.8686805, 0.3062231, -3.144562, 0.7411765, 1, 0, 1,
-0.861913, -0.7927075, -3.597807, 0.7333333, 1, 0, 1,
-0.8561941, 1.669674, 0.2055705, 0.7294118, 1, 0, 1,
-0.8544772, -0.4863973, -1.945288, 0.7215686, 1, 0, 1,
-0.8446303, 2.303988, -0.1201753, 0.7176471, 1, 0, 1,
-0.840435, 2.023487, 1.711334, 0.7098039, 1, 0, 1,
-0.8399045, -0.2322907, -1.530496, 0.7058824, 1, 0, 1,
-0.8341198, -0.3159738, -0.8195928, 0.6980392, 1, 0, 1,
-0.8317986, -0.958823, -3.063529, 0.6901961, 1, 0, 1,
-0.8310301, -0.1957639, -2.241526, 0.6862745, 1, 0, 1,
-0.8240365, 0.0862329, -2.744394, 0.6784314, 1, 0, 1,
-0.8045794, 1.113052, -1.392503, 0.6745098, 1, 0, 1,
-0.8039219, -1.456299, -2.944348, 0.6666667, 1, 0, 1,
-0.7968894, 0.2112332, -1.356932, 0.6627451, 1, 0, 1,
-0.7958196, 1.042938, 0.4063042, 0.654902, 1, 0, 1,
-0.7954236, 0.633322, 0.3769376, 0.6509804, 1, 0, 1,
-0.7847632, 1.578919, -0.2522263, 0.6431373, 1, 0, 1,
-0.7803178, 0.0457513, -1.99464, 0.6392157, 1, 0, 1,
-0.7790527, -0.8949654, -4.527133, 0.6313726, 1, 0, 1,
-0.778203, 1.387247, -1.035909, 0.627451, 1, 0, 1,
-0.7747027, 0.937943, -0.8842862, 0.6196079, 1, 0, 1,
-0.7734863, -1.596324, -3.355792, 0.6156863, 1, 0, 1,
-0.7715279, 0.5538327, -1.604439, 0.6078432, 1, 0, 1,
-0.7701685, 0.2914484, -1.191534, 0.6039216, 1, 0, 1,
-0.767324, -0.07692542, -0.9934036, 0.5960785, 1, 0, 1,
-0.7670245, -0.0958662, -1.167484, 0.5882353, 1, 0, 1,
-0.763715, -0.2922477, -2.463608, 0.5843138, 1, 0, 1,
-0.7611464, 0.483424, -1.511184, 0.5764706, 1, 0, 1,
-0.7591788, 0.2732152, -2.26869, 0.572549, 1, 0, 1,
-0.7527984, -0.04369769, -2.927488, 0.5647059, 1, 0, 1,
-0.750571, -0.2041513, -1.901591, 0.5607843, 1, 0, 1,
-0.749653, -1.124286, -0.009093713, 0.5529412, 1, 0, 1,
-0.7482963, -0.8508115, -2.851856, 0.5490196, 1, 0, 1,
-0.743426, 1.074564, -1.325149, 0.5411765, 1, 0, 1,
-0.7387932, -0.5712934, -1.969537, 0.5372549, 1, 0, 1,
-0.7362432, 0.5163868, -1.508025, 0.5294118, 1, 0, 1,
-0.7362394, 2.72707, 1.277995, 0.5254902, 1, 0, 1,
-0.735826, 0.8035407, -2.443165, 0.5176471, 1, 0, 1,
-0.7306569, -1.743549, -4.463147, 0.5137255, 1, 0, 1,
-0.7282409, 0.7115046, -0.9495528, 0.5058824, 1, 0, 1,
-0.7281941, -1.173078, -1.470281, 0.5019608, 1, 0, 1,
-0.7268328, 0.9430277, -1.25373, 0.4941176, 1, 0, 1,
-0.7258716, -0.6057566, -2.524481, 0.4862745, 1, 0, 1,
-0.7244418, -0.2932351, -2.371471, 0.4823529, 1, 0, 1,
-0.7208057, 0.720525, 0.7468786, 0.4745098, 1, 0, 1,
-0.7199586, -0.7949714, -1.535354, 0.4705882, 1, 0, 1,
-0.7084325, 0.03196079, -1.039771, 0.4627451, 1, 0, 1,
-0.7073218, 0.8857222, -0.8749567, 0.4588235, 1, 0, 1,
-0.7050591, -0.48968, -1.389597, 0.4509804, 1, 0, 1,
-0.7011781, -1.026363, -1.055803, 0.4470588, 1, 0, 1,
-0.6987531, 0.04200288, -0.6824509, 0.4392157, 1, 0, 1,
-0.6962801, 0.7358131, -1.743963, 0.4352941, 1, 0, 1,
-0.6923792, 1.305671, -0.5603309, 0.427451, 1, 0, 1,
-0.6922192, 0.7717081, 0.7349444, 0.4235294, 1, 0, 1,
-0.6920421, 0.7572207, -1.183966, 0.4156863, 1, 0, 1,
-0.6892139, 1.72634, 0.955282, 0.4117647, 1, 0, 1,
-0.6797956, 1.747218, -0.07277807, 0.4039216, 1, 0, 1,
-0.6779405, 0.6728784, -1.89152, 0.3960784, 1, 0, 1,
-0.6715638, -0.452366, -3.36508, 0.3921569, 1, 0, 1,
-0.6614763, -0.7882989, -2.693115, 0.3843137, 1, 0, 1,
-0.6575951, 2.394866, -0.196641, 0.3803922, 1, 0, 1,
-0.6493187, -1.392176, -2.551504, 0.372549, 1, 0, 1,
-0.6469842, -1.113275, -4.210362, 0.3686275, 1, 0, 1,
-0.6430787, -0.738275, -4.165804, 0.3607843, 1, 0, 1,
-0.6430321, 0.739399, -2.021137, 0.3568628, 1, 0, 1,
-0.6414717, 0.868307, 0.6824988, 0.3490196, 1, 0, 1,
-0.635181, -1.336256, -2.963979, 0.345098, 1, 0, 1,
-0.6321715, -0.1234637, -1.483343, 0.3372549, 1, 0, 1,
-0.6289383, 0.8168679, -0.90465, 0.3333333, 1, 0, 1,
-0.6219962, -2.299457, -3.395427, 0.3254902, 1, 0, 1,
-0.6171558, -0.5532762, -1.622044, 0.3215686, 1, 0, 1,
-0.6097319, -0.4004622, -1.465696, 0.3137255, 1, 0, 1,
-0.6058289, -1.95047, -3.085365, 0.3098039, 1, 0, 1,
-0.6035883, 0.7414663, -1.420554, 0.3019608, 1, 0, 1,
-0.6022084, 1.137955, -1.544742, 0.2941177, 1, 0, 1,
-0.6012188, -0.6908917, -2.013224, 0.2901961, 1, 0, 1,
-0.6000234, -1.736622, -4.901125, 0.282353, 1, 0, 1,
-0.599788, -0.2371707, -0.5660192, 0.2784314, 1, 0, 1,
-0.5937752, 1.566138, 0.6133884, 0.2705882, 1, 0, 1,
-0.5897148, 0.8247762, 0.9081731, 0.2666667, 1, 0, 1,
-0.5867087, 0.03353327, -1.373948, 0.2588235, 1, 0, 1,
-0.5856138, 2.034001, -0.4901289, 0.254902, 1, 0, 1,
-0.5814071, -0.9238047, -4.239564, 0.2470588, 1, 0, 1,
-0.5813013, -0.6756805, -3.192034, 0.2431373, 1, 0, 1,
-0.5798656, 0.08572003, -1.694719, 0.2352941, 1, 0, 1,
-0.5786427, -0.4566435, -2.611602, 0.2313726, 1, 0, 1,
-0.5733625, -0.5255746, -3.808765, 0.2235294, 1, 0, 1,
-0.5727906, 0.7868551, -2.403808, 0.2196078, 1, 0, 1,
-0.5722169, -0.2780102, -1.846566, 0.2117647, 1, 0, 1,
-0.5716056, -0.9143381, -4.724385, 0.2078431, 1, 0, 1,
-0.5685038, 2.001604, 1.738593, 0.2, 1, 0, 1,
-0.5680652, -1.104868, -3.178675, 0.1921569, 1, 0, 1,
-0.5677002, -1.10296, -2.142513, 0.1882353, 1, 0, 1,
-0.5624024, 0.7510991, -1.654159, 0.1803922, 1, 0, 1,
-0.5568131, 0.2484442, -1.463854, 0.1764706, 1, 0, 1,
-0.5549145, -0.6061547, -1.898577, 0.1686275, 1, 0, 1,
-0.5522076, -0.1579774, -2.178361, 0.1647059, 1, 0, 1,
-0.5490599, -1.426069, -2.35543, 0.1568628, 1, 0, 1,
-0.5420856, -1.713742, -3.290258, 0.1529412, 1, 0, 1,
-0.5388461, -0.4721466, -2.864314, 0.145098, 1, 0, 1,
-0.53859, 0.004048567, -0.4036914, 0.1411765, 1, 0, 1,
-0.5374144, 1.134113, -1.534531, 0.1333333, 1, 0, 1,
-0.5368952, -1.090431, -2.296877, 0.1294118, 1, 0, 1,
-0.53277, -1.583009, -4.184932, 0.1215686, 1, 0, 1,
-0.5327597, 1.97426, -1.176607, 0.1176471, 1, 0, 1,
-0.5259427, -0.7710497, -1.498722, 0.1098039, 1, 0, 1,
-0.5210677, -0.2936054, -1.583042, 0.1058824, 1, 0, 1,
-0.512432, 1.764124, -1.800057, 0.09803922, 1, 0, 1,
-0.5120342, -0.1330967, -1.537843, 0.09019608, 1, 0, 1,
-0.5078186, 0.7428335, 0.412677, 0.08627451, 1, 0, 1,
-0.5076771, 0.2051513, -2.705687, 0.07843138, 1, 0, 1,
-0.5075943, 1.15734, -0.2596368, 0.07450981, 1, 0, 1,
-0.506968, 0.4975704, -0.3760818, 0.06666667, 1, 0, 1,
-0.5065142, 2.089935, -0.03097486, 0.0627451, 1, 0, 1,
-0.5057933, 1.637092, 0.7118647, 0.05490196, 1, 0, 1,
-0.5045727, 0.5944138, -0.5257055, 0.05098039, 1, 0, 1,
-0.5022144, -1.817898, -2.996085, 0.04313726, 1, 0, 1,
-0.4995504, 0.8555092, 0.205609, 0.03921569, 1, 0, 1,
-0.4967782, 1.649665, -1.344556, 0.03137255, 1, 0, 1,
-0.496536, -0.48586, -1.15842, 0.02745098, 1, 0, 1,
-0.4936838, -0.4288471, -1.791812, 0.01960784, 1, 0, 1,
-0.491634, 1.564353, 2.361476, 0.01568628, 1, 0, 1,
-0.4897958, -0.2482316, -0.9045976, 0.007843138, 1, 0, 1,
-0.4883301, -0.4509581, -2.911779, 0.003921569, 1, 0, 1,
-0.4870971, -2.303742, -1.884519, 0, 1, 0.003921569, 1,
-0.4853276, -2.364068, -3.672374, 0, 1, 0.01176471, 1,
-0.4807021, 0.2239032, -0.9630662, 0, 1, 0.01568628, 1,
-0.4706832, 0.07532462, -3.103123, 0, 1, 0.02352941, 1,
-0.4692134, 1.50713, 2.661181, 0, 1, 0.02745098, 1,
-0.4646987, 0.7350943, -0.6888503, 0, 1, 0.03529412, 1,
-0.4577717, 1.000304, -1.869759, 0, 1, 0.03921569, 1,
-0.4572906, -2.34228, -2.679283, 0, 1, 0.04705882, 1,
-0.4560994, 0.2803173, -2.496061, 0, 1, 0.05098039, 1,
-0.4549516, -0.786976, -2.400919, 0, 1, 0.05882353, 1,
-0.4478769, -0.2563305, -3.491309, 0, 1, 0.0627451, 1,
-0.4447765, 1.145382, -1.263214, 0, 1, 0.07058824, 1,
-0.444483, -0.5691558, -4.160626, 0, 1, 0.07450981, 1,
-0.4440717, -1.887435, -2.955539, 0, 1, 0.08235294, 1,
-0.4427186, -1.118753, -1.308173, 0, 1, 0.08627451, 1,
-0.4416169, 0.4918098, -1.682883, 0, 1, 0.09411765, 1,
-0.4385335, -1.385114, -2.545356, 0, 1, 0.1019608, 1,
-0.4344363, 1.372888, -0.2779396, 0, 1, 0.1058824, 1,
-0.4306911, 0.4249248, -1.69391, 0, 1, 0.1137255, 1,
-0.4299303, 0.9051653, 0.4384305, 0, 1, 0.1176471, 1,
-0.4293652, 0.6886005, -0.5463613, 0, 1, 0.1254902, 1,
-0.4286508, 0.746721, 0.2815577, 0, 1, 0.1294118, 1,
-0.4271062, 0.553333, -0.1340759, 0, 1, 0.1372549, 1,
-0.4246541, 0.03215171, -2.017588, 0, 1, 0.1411765, 1,
-0.423609, 0.3582223, -0.2207681, 0, 1, 0.1490196, 1,
-0.4181681, -0.2812256, -1.494877, 0, 1, 0.1529412, 1,
-0.412755, 0.2598694, -1.509542, 0, 1, 0.1607843, 1,
-0.4096453, 0.9479067, -0.5008544, 0, 1, 0.1647059, 1,
-0.409587, -2.176739, -2.99876, 0, 1, 0.172549, 1,
-0.4074906, 0.008388562, -1.7746, 0, 1, 0.1764706, 1,
-0.4067748, 0.6286099, -1.016594, 0, 1, 0.1843137, 1,
-0.3962898, -0.5288969, -3.168655, 0, 1, 0.1882353, 1,
-0.396155, 0.3120232, -1.272159, 0, 1, 0.1960784, 1,
-0.3932645, 0.4983146, -1.459679, 0, 1, 0.2039216, 1,
-0.3931031, 1.430992, -0.1113744, 0, 1, 0.2078431, 1,
-0.391894, -0.1939565, -2.214309, 0, 1, 0.2156863, 1,
-0.3918398, -1.435251, -1.669842, 0, 1, 0.2196078, 1,
-0.3898222, 1.20929, 0.150317, 0, 1, 0.227451, 1,
-0.3895369, 0.908232, 0.6496518, 0, 1, 0.2313726, 1,
-0.3884128, 0.6567104, -0.09965894, 0, 1, 0.2392157, 1,
-0.3880897, -1.48706, -2.10534, 0, 1, 0.2431373, 1,
-0.3847246, 1.091224, -0.9787138, 0, 1, 0.2509804, 1,
-0.3806174, -1.317466, -1.874826, 0, 1, 0.254902, 1,
-0.3723995, -1.30295, -3.072538, 0, 1, 0.2627451, 1,
-0.3713366, -1.116334, -4.081133, 0, 1, 0.2666667, 1,
-0.3699062, -0.50456, -2.030452, 0, 1, 0.2745098, 1,
-0.3678557, -0.5670455, -1.939072, 0, 1, 0.2784314, 1,
-0.3634579, -0.7863788, -1.053287, 0, 1, 0.2862745, 1,
-0.3627485, -0.6004783, -4.593017, 0, 1, 0.2901961, 1,
-0.3576303, 1.926116, -1.454305, 0, 1, 0.2980392, 1,
-0.3560737, -0.03490454, -1.951544, 0, 1, 0.3058824, 1,
-0.3532743, 0.7039425, -0.06619214, 0, 1, 0.3098039, 1,
-0.351247, 0.6756141, -0.7589228, 0, 1, 0.3176471, 1,
-0.3502304, 0.1285303, -0.8712066, 0, 1, 0.3215686, 1,
-0.3493755, -1.467319, -2.09166, 0, 1, 0.3294118, 1,
-0.3484683, 0.6851972, -0.6650991, 0, 1, 0.3333333, 1,
-0.3423714, -0.2994381, -1.742273, 0, 1, 0.3411765, 1,
-0.340977, -1.554797, -2.789787, 0, 1, 0.345098, 1,
-0.3381771, 0.9661413, -1.629037, 0, 1, 0.3529412, 1,
-0.3378491, 1.63875, -1.450545, 0, 1, 0.3568628, 1,
-0.3344273, -0.1047284, -0.6679212, 0, 1, 0.3647059, 1,
-0.3342827, -1.173997, -3.089677, 0, 1, 0.3686275, 1,
-0.3331731, -0.6817147, -3.038094, 0, 1, 0.3764706, 1,
-0.3294379, -2.102028, -3.540373, 0, 1, 0.3803922, 1,
-0.3271846, -0.5419894, -3.289881, 0, 1, 0.3882353, 1,
-0.3264591, -0.2729484, -1.937241, 0, 1, 0.3921569, 1,
-0.3248978, 1.003394, -2.463861, 0, 1, 0.4, 1,
-0.3238499, 1.513548, 0.4830787, 0, 1, 0.4078431, 1,
-0.3218166, -1.838635, -1.329524, 0, 1, 0.4117647, 1,
-0.3196544, 0.1267233, -1.967076, 0, 1, 0.4196078, 1,
-0.3164956, -0.04408267, -1.769122, 0, 1, 0.4235294, 1,
-0.3157207, 0.03984649, -2.32436, 0, 1, 0.4313726, 1,
-0.3125975, -1.452946, -4.980706, 0, 1, 0.4352941, 1,
-0.2949346, -0.8509541, -0.9320228, 0, 1, 0.4431373, 1,
-0.2903326, -0.6058062, -5.01397, 0, 1, 0.4470588, 1,
-0.2895553, 1.078889, -0.501106, 0, 1, 0.454902, 1,
-0.2889321, -0.5276707, -3.067597, 0, 1, 0.4588235, 1,
-0.287793, 0.5390182, -1.569281, 0, 1, 0.4666667, 1,
-0.2789582, 1.901676, 0.4981551, 0, 1, 0.4705882, 1,
-0.2783907, 1.529478, 0.6653737, 0, 1, 0.4784314, 1,
-0.2775223, -1.037379, -2.427571, 0, 1, 0.4823529, 1,
-0.2749834, 0.7785815, -0.8727485, 0, 1, 0.4901961, 1,
-0.2715183, -0.1526497, -1.919167, 0, 1, 0.4941176, 1,
-0.2546852, 0.6492981, -0.1659776, 0, 1, 0.5019608, 1,
-0.2536331, -2.350917, -3.512305, 0, 1, 0.509804, 1,
-0.2533143, 0.3643873, 1.079554, 0, 1, 0.5137255, 1,
-0.2458532, 0.0416618, -0.9596089, 0, 1, 0.5215687, 1,
-0.2426761, -0.8261994, -3.244032, 0, 1, 0.5254902, 1,
-0.2307792, -0.5042914, -4.048686, 0, 1, 0.5333334, 1,
-0.2259555, 0.3039296, 1.005738, 0, 1, 0.5372549, 1,
-0.2238532, 1.069223, -0.3804264, 0, 1, 0.5450981, 1,
-0.2225165, -0.218441, -1.68892, 0, 1, 0.5490196, 1,
-0.2213006, -0.1964694, -0.681512, 0, 1, 0.5568628, 1,
-0.2183802, -1.295683, -3.363358, 0, 1, 0.5607843, 1,
-0.2154249, 1.631274, -0.2095096, 0, 1, 0.5686275, 1,
-0.2136065, -1.06902, -3.592707, 0, 1, 0.572549, 1,
-0.2107514, 0.5607566, 0.2903459, 0, 1, 0.5803922, 1,
-0.2082928, -0.7376246, -3.511315, 0, 1, 0.5843138, 1,
-0.2008721, 0.1417114, -1.833227, 0, 1, 0.5921569, 1,
-0.2005762, 0.34678, -0.6156027, 0, 1, 0.5960785, 1,
-0.2001796, -1.440391, -4.004337, 0, 1, 0.6039216, 1,
-0.2001703, 0.3853444, -1.118884, 0, 1, 0.6117647, 1,
-0.1965294, 1.464904, -1.17686, 0, 1, 0.6156863, 1,
-0.1964533, -1.331293, -3.044169, 0, 1, 0.6235294, 1,
-0.1957537, 0.2399666, -0.339339, 0, 1, 0.627451, 1,
-0.1944197, -1.022418, -2.532958, 0, 1, 0.6352941, 1,
-0.1895734, -1.469289, -4.015777, 0, 1, 0.6392157, 1,
-0.1852742, 1.132702, -1.219467, 0, 1, 0.6470588, 1,
-0.1828813, 1.185959, 0.7420521, 0, 1, 0.6509804, 1,
-0.1827426, -0.245392, -4.378688, 0, 1, 0.6588235, 1,
-0.1811323, 0.7646445, -0.4800764, 0, 1, 0.6627451, 1,
-0.1805959, -2.140797, -1.683422, 0, 1, 0.6705883, 1,
-0.1782159, 0.1207635, -2.102208, 0, 1, 0.6745098, 1,
-0.1775934, -0.5677324, -2.852406, 0, 1, 0.682353, 1,
-0.174613, -0.9690133, -3.44802, 0, 1, 0.6862745, 1,
-0.1704949, -0.3257552, -4.14964, 0, 1, 0.6941177, 1,
-0.1702866, -2.186997, -1.387702, 0, 1, 0.7019608, 1,
-0.1657374, 0.2773207, -2.316638, 0, 1, 0.7058824, 1,
-0.1605823, -0.6061202, -2.387848, 0, 1, 0.7137255, 1,
-0.1596993, -0.558143, -0.4136654, 0, 1, 0.7176471, 1,
-0.1554604, -0.522657, -2.456712, 0, 1, 0.7254902, 1,
-0.1470909, 0.007727105, -0.1952429, 0, 1, 0.7294118, 1,
-0.1459548, 0.971742, 0.3755859, 0, 1, 0.7372549, 1,
-0.1423452, -0.1939496, -1.075779, 0, 1, 0.7411765, 1,
-0.1393518, -1.260692, 0.1084661, 0, 1, 0.7490196, 1,
-0.1358562, 0.8116341, 0.1938363, 0, 1, 0.7529412, 1,
-0.1349848, 0.6346299, -1.133671, 0, 1, 0.7607843, 1,
-0.1322836, -0.4526236, -2.996434, 0, 1, 0.7647059, 1,
-0.1265687, 0.1463498, 1.415607, 0, 1, 0.772549, 1,
-0.1256255, 0.6863685, -0.2803618, 0, 1, 0.7764706, 1,
-0.1236303, 1.049868, 0.9363163, 0, 1, 0.7843137, 1,
-0.1195998, -0.7408116, -4.480492, 0, 1, 0.7882353, 1,
-0.1192525, 0.719728, -0.01109206, 0, 1, 0.7960784, 1,
-0.1170816, 2.112923, -0.4581021, 0, 1, 0.8039216, 1,
-0.1164062, -1.466846, -3.458591, 0, 1, 0.8078431, 1,
-0.1140279, 0.66065, 0.03512168, 0, 1, 0.8156863, 1,
-0.1138579, -0.03917766, -3.05131, 0, 1, 0.8196079, 1,
-0.1118822, 1.53511, -2.507354, 0, 1, 0.827451, 1,
-0.1099363, 1.180663, -0.8514026, 0, 1, 0.8313726, 1,
-0.1089462, 0.3375849, 1.45939, 0, 1, 0.8392157, 1,
-0.1076273, 0.2026552, -1.577091, 0, 1, 0.8431373, 1,
-0.09801707, -0.2692347, -3.350208, 0, 1, 0.8509804, 1,
-0.09679738, -0.6275769, -2.967591, 0, 1, 0.854902, 1,
-0.09611657, 0.5617504, -0.01269507, 0, 1, 0.8627451, 1,
-0.09397318, -4.243088, -3.230314, 0, 1, 0.8666667, 1,
-0.08935592, 2.752255, 0.9495571, 0, 1, 0.8745098, 1,
-0.08835325, -0.6504823, -2.77226, 0, 1, 0.8784314, 1,
-0.08735333, -0.6315927, -1.77248, 0, 1, 0.8862745, 1,
-0.08380917, -0.9626083, -1.934964, 0, 1, 0.8901961, 1,
-0.08138196, 0.5300419, -0.08254138, 0, 1, 0.8980392, 1,
-0.07781377, -0.3223155, -3.498663, 0, 1, 0.9058824, 1,
-0.07194324, 0.3562647, -1.488824, 0, 1, 0.9098039, 1,
-0.07150256, 0.5909557, -0.4564126, 0, 1, 0.9176471, 1,
-0.06511091, -1.370149, -2.648245, 0, 1, 0.9215686, 1,
-0.06492712, -0.03311045, -2.08404, 0, 1, 0.9294118, 1,
-0.06454054, -0.9929362, -3.726257, 0, 1, 0.9333333, 1,
-0.0545779, 0.06259137, -0.9113657, 0, 1, 0.9411765, 1,
-0.0500435, 0.09396236, -2.18857, 0, 1, 0.945098, 1,
-0.04906533, 0.7186015, -0.4572226, 0, 1, 0.9529412, 1,
-0.04747466, 0.3992897, -0.7555656, 0, 1, 0.9568627, 1,
-0.03893245, -0.9799961, -3.123621, 0, 1, 0.9647059, 1,
-0.0370585, -0.5323882, -3.092534, 0, 1, 0.9686275, 1,
-0.03498659, 3.219268, -0.7716072, 0, 1, 0.9764706, 1,
-0.03423049, -1.532798, -2.386888, 0, 1, 0.9803922, 1,
-0.033379, 1.223117, -0.3821923, 0, 1, 0.9882353, 1,
-0.03256124, -3.857279, -4.245929, 0, 1, 0.9921569, 1,
-0.03172987, 0.1958022, -0.1558088, 0, 1, 1, 1,
-0.03120989, -0.03610877, -1.750193, 0, 0.9921569, 1, 1,
-0.03062129, 1.403195, -0.7405054, 0, 0.9882353, 1, 1,
-0.02346732, 1.581029, 1.460605, 0, 0.9803922, 1, 1,
-0.02276642, 0.5014741, -0.7636257, 0, 0.9764706, 1, 1,
-0.01855829, 0.04700428, 0.03915558, 0, 0.9686275, 1, 1,
-0.01644104, 0.1905225, 0.2163632, 0, 0.9647059, 1, 1,
-0.007514089, -0.5750303, -1.80483, 0, 0.9568627, 1, 1,
-0.00708675, 0.6948018, 0.1542141, 0, 0.9529412, 1, 1,
-0.006888356, -0.3109891, -2.238209, 0, 0.945098, 1, 1,
-0.006234393, 0.9727242, 0.5517404, 0, 0.9411765, 1, 1,
-0.003297715, -0.05626111, -2.801354, 0, 0.9333333, 1, 1,
0.001887281, 0.6681493, -0.8159471, 0, 0.9294118, 1, 1,
0.004915724, 2.353765, 0.09067249, 0, 0.9215686, 1, 1,
0.005752013, 1.016409, 0.8161486, 0, 0.9176471, 1, 1,
0.007263889, -0.4313847, 2.823718, 0, 0.9098039, 1, 1,
0.009366849, 0.6091095, -0.3557431, 0, 0.9058824, 1, 1,
0.009957718, -0.3797948, 4.430349, 0, 0.8980392, 1, 1,
0.01210025, 0.4900837, -1.996877, 0, 0.8901961, 1, 1,
0.0134587, 0.6357733, -0.7115792, 0, 0.8862745, 1, 1,
0.01473907, 0.3602403, 1.45541, 0, 0.8784314, 1, 1,
0.01590835, 0.4096252, -0.9051206, 0, 0.8745098, 1, 1,
0.01806295, 0.2127088, 0.4974416, 0, 0.8666667, 1, 1,
0.02177467, 1.009665, -0.1537015, 0, 0.8627451, 1, 1,
0.03065036, -1.456615, 4.815527, 0, 0.854902, 1, 1,
0.03848275, 0.5858525, 0.9705918, 0, 0.8509804, 1, 1,
0.04090017, -2.074016, 3.641957, 0, 0.8431373, 1, 1,
0.04195805, 0.616949, 0.519991, 0, 0.8392157, 1, 1,
0.0463656, 0.7943383, 0.2111468, 0, 0.8313726, 1, 1,
0.04721668, -1.919857, 3.394348, 0, 0.827451, 1, 1,
0.0475458, -0.3770043, 2.733947, 0, 0.8196079, 1, 1,
0.04802765, 0.4636137, -0.4831776, 0, 0.8156863, 1, 1,
0.05343182, -1.541366, 2.190027, 0, 0.8078431, 1, 1,
0.05540026, -0.9993299, 2.889531, 0, 0.8039216, 1, 1,
0.06105796, -0.2343092, 2.134813, 0, 0.7960784, 1, 1,
0.0664112, 0.3413627, -0.1937537, 0, 0.7882353, 1, 1,
0.08230555, 1.367249, -0.6087325, 0, 0.7843137, 1, 1,
0.08380652, 1.579866, 0.2075506, 0, 0.7764706, 1, 1,
0.08532682, 2.764883, 1.697956, 0, 0.772549, 1, 1,
0.08880224, -0.7825457, 2.459386, 0, 0.7647059, 1, 1,
0.08953814, 0.4733697, -1.025439, 0, 0.7607843, 1, 1,
0.0899343, -0.5623167, 2.489201, 0, 0.7529412, 1, 1,
0.09164724, 0.3829727, -0.3827801, 0, 0.7490196, 1, 1,
0.09476256, -0.1020774, 3.539717, 0, 0.7411765, 1, 1,
0.09676555, -1.234752, 1.850318, 0, 0.7372549, 1, 1,
0.1006016, 0.4405498, -1.632396, 0, 0.7294118, 1, 1,
0.1025525, -1.134291, 2.269144, 0, 0.7254902, 1, 1,
0.1079505, -2.780579, 0.797391, 0, 0.7176471, 1, 1,
0.1085773, 1.061057, 0.9873341, 0, 0.7137255, 1, 1,
0.1088689, 0.8863339, 0.544189, 0, 0.7058824, 1, 1,
0.1120643, 0.8031681, 0.4656057, 0, 0.6980392, 1, 1,
0.1136342, -1.817965, 3.864261, 0, 0.6941177, 1, 1,
0.1176048, 0.7191164, 0.2993365, 0, 0.6862745, 1, 1,
0.1233734, 0.27762, 1.600283, 0, 0.682353, 1, 1,
0.1242017, 0.7770485, 0.9043305, 0, 0.6745098, 1, 1,
0.1264081, 0.1203581, 1.405813, 0, 0.6705883, 1, 1,
0.1272315, -2.19996, 1.959079, 0, 0.6627451, 1, 1,
0.1293094, -1.73368, 2.148841, 0, 0.6588235, 1, 1,
0.1340519, 1.577071, -0.5048316, 0, 0.6509804, 1, 1,
0.1342463, -0.9434451, 1.668134, 0, 0.6470588, 1, 1,
0.1359106, 0.1111962, 0.02427479, 0, 0.6392157, 1, 1,
0.1391392, -0.4564589, 3.445714, 0, 0.6352941, 1, 1,
0.1394693, 1.923059, 0.9503641, 0, 0.627451, 1, 1,
0.1421604, -0.08057525, 4.038397, 0, 0.6235294, 1, 1,
0.1421697, 0.04404136, 1.390769, 0, 0.6156863, 1, 1,
0.1441851, 0.739804, 2.038319, 0, 0.6117647, 1, 1,
0.144771, 1.686925, 0.09754378, 0, 0.6039216, 1, 1,
0.145981, -1.903619, 1.862798, 0, 0.5960785, 1, 1,
0.1470013, -1.062621, 3.164271, 0, 0.5921569, 1, 1,
0.1524852, -1.944163, 2.197749, 0, 0.5843138, 1, 1,
0.153077, -0.4542088, 4.297694, 0, 0.5803922, 1, 1,
0.1532318, -1.224565, 2.310216, 0, 0.572549, 1, 1,
0.1537037, -0.7664368, 4.140875, 0, 0.5686275, 1, 1,
0.1559426, -1.156628, 4.040595, 0, 0.5607843, 1, 1,
0.1606219, 0.7335406, 1.718568, 0, 0.5568628, 1, 1,
0.1630141, 0.8916867, 0.2773899, 0, 0.5490196, 1, 1,
0.1696356, -0.3386598, 2.481222, 0, 0.5450981, 1, 1,
0.1717976, 0.925256, 1.096913, 0, 0.5372549, 1, 1,
0.1721845, 1.829358, 1.165454, 0, 0.5333334, 1, 1,
0.172482, 0.9634754, 1.897096, 0, 0.5254902, 1, 1,
0.176851, -0.8839252, 2.530551, 0, 0.5215687, 1, 1,
0.1797243, 0.694742, -0.4373659, 0, 0.5137255, 1, 1,
0.1885505, 1.921994, 1.140051, 0, 0.509804, 1, 1,
0.1900019, -0.6880383, 3.922371, 0, 0.5019608, 1, 1,
0.1938135, -0.2305911, 2.230292, 0, 0.4941176, 1, 1,
0.1958192, 1.377183, 0.7376838, 0, 0.4901961, 1, 1,
0.2001612, 0.9757883, -2.363654, 0, 0.4823529, 1, 1,
0.200218, -0.1698552, 1.904941, 0, 0.4784314, 1, 1,
0.2026191, 0.6202601, 0.8554363, 0, 0.4705882, 1, 1,
0.2061601, 0.1317843, 1.010712, 0, 0.4666667, 1, 1,
0.2094048, 0.8132613, 0.3031644, 0, 0.4588235, 1, 1,
0.210514, 1.385369, 0.4738116, 0, 0.454902, 1, 1,
0.2139086, 1.49726, 0.0196869, 0, 0.4470588, 1, 1,
0.2153359, -0.5123859, 3.126085, 0, 0.4431373, 1, 1,
0.2171864, -1.705888, 3.3719, 0, 0.4352941, 1, 1,
0.2224691, 0.3525626, 0.6196085, 0, 0.4313726, 1, 1,
0.2225857, 0.9420529, -1.273783, 0, 0.4235294, 1, 1,
0.2266392, -1.90315, 3.023704, 0, 0.4196078, 1, 1,
0.2350509, -0.9776992, 2.452061, 0, 0.4117647, 1, 1,
0.2355773, -1.546683, 2.330434, 0, 0.4078431, 1, 1,
0.236515, -0.9488816, 2.468573, 0, 0.4, 1, 1,
0.2375177, 0.9280913, -0.1678666, 0, 0.3921569, 1, 1,
0.2375916, 1.067618, 0.2821393, 0, 0.3882353, 1, 1,
0.2393424, 1.020002, -0.1353634, 0, 0.3803922, 1, 1,
0.2431611, 0.2530555, 1.158331, 0, 0.3764706, 1, 1,
0.2569396, 0.03529533, 1.348465, 0, 0.3686275, 1, 1,
0.2633062, -0.1302135, 4.061087, 0, 0.3647059, 1, 1,
0.2659684, 0.4983775, 1.372556, 0, 0.3568628, 1, 1,
0.2662002, 0.1196118, 2.379463, 0, 0.3529412, 1, 1,
0.2667218, -0.3007903, 1.424227, 0, 0.345098, 1, 1,
0.2775571, 1.49641, -1.199302, 0, 0.3411765, 1, 1,
0.2793866, -1.010964, 3.476471, 0, 0.3333333, 1, 1,
0.2799797, -0.2258418, 2.126007, 0, 0.3294118, 1, 1,
0.2811489, 0.2221324, 0.2343387, 0, 0.3215686, 1, 1,
0.281855, 0.403725, -0.03420484, 0, 0.3176471, 1, 1,
0.2846436, -1.33724, 2.804246, 0, 0.3098039, 1, 1,
0.2896861, -0.06879088, 1.028296, 0, 0.3058824, 1, 1,
0.2910649, -0.5394761, 1.671568, 0, 0.2980392, 1, 1,
0.2945633, 0.01580556, 1.443851, 0, 0.2901961, 1, 1,
0.2981184, -0.3700636, 1.292722, 0, 0.2862745, 1, 1,
0.303582, 1.047788, -0.0660131, 0, 0.2784314, 1, 1,
0.3050558, 0.8315417, 1.110974, 0, 0.2745098, 1, 1,
0.3064961, -0.379212, 2.805387, 0, 0.2666667, 1, 1,
0.3092594, -1.432483, 1.011014, 0, 0.2627451, 1, 1,
0.3126321, -0.2347421, 3.692761, 0, 0.254902, 1, 1,
0.3140206, 0.6976553, -0.2698371, 0, 0.2509804, 1, 1,
0.3165127, -0.9411476, 4.336032, 0, 0.2431373, 1, 1,
0.321241, -0.1693135, 3.45235, 0, 0.2392157, 1, 1,
0.3214859, 0.5955343, -0.6537858, 0, 0.2313726, 1, 1,
0.3248509, -1.841383, 1.971072, 0, 0.227451, 1, 1,
0.3287193, -1.969925, 2.671474, 0, 0.2196078, 1, 1,
0.328726, -0.1485793, 1.465243, 0, 0.2156863, 1, 1,
0.3302775, -2.338073, 2.49171, 0, 0.2078431, 1, 1,
0.3305765, -2.059269, 2.664872, 0, 0.2039216, 1, 1,
0.3358002, -0.3488289, 2.933575, 0, 0.1960784, 1, 1,
0.3390558, -1.075233, 3.734686, 0, 0.1882353, 1, 1,
0.3403565, 2.406082, -2.508217, 0, 0.1843137, 1, 1,
0.3453749, 1.221951, 1.516398, 0, 0.1764706, 1, 1,
0.3464321, 0.0180047, -0.7580439, 0, 0.172549, 1, 1,
0.346765, 0.9798589, 1.088161, 0, 0.1647059, 1, 1,
0.3512814, 1.808883, 0.5747016, 0, 0.1607843, 1, 1,
0.3543913, -0.3484145, 1.19645, 0, 0.1529412, 1, 1,
0.3549053, -1.134646, 4.531765, 0, 0.1490196, 1, 1,
0.3568442, 0.6848083, 0.1827654, 0, 0.1411765, 1, 1,
0.3584127, -2.414815, 2.623695, 0, 0.1372549, 1, 1,
0.3675906, -0.4086674, 2.347724, 0, 0.1294118, 1, 1,
0.3705956, 0.160387, -0.4337512, 0, 0.1254902, 1, 1,
0.373716, -0.3863556, 2.971181, 0, 0.1176471, 1, 1,
0.373826, -0.2338095, 1.54812, 0, 0.1137255, 1, 1,
0.3766106, 0.02744024, 1.233409, 0, 0.1058824, 1, 1,
0.3775569, -0.1858447, 2.126177, 0, 0.09803922, 1, 1,
0.3778876, -0.6343589, 3.84433, 0, 0.09411765, 1, 1,
0.3877777, -1.155271, 1.229736, 0, 0.08627451, 1, 1,
0.3881466, -1.148011, 4.128822, 0, 0.08235294, 1, 1,
0.3945519, 1.19334, 1.884501, 0, 0.07450981, 1, 1,
0.396302, -0.04986685, 1.372012, 0, 0.07058824, 1, 1,
0.405656, -0.5567241, 2.011793, 0, 0.0627451, 1, 1,
0.4061634, 1.184914, -0.04385635, 0, 0.05882353, 1, 1,
0.406519, 0.1018677, 0.2384591, 0, 0.05098039, 1, 1,
0.4146705, 0.1405231, 1.14468, 0, 0.04705882, 1, 1,
0.4160351, 0.05488933, 1.874969, 0, 0.03921569, 1, 1,
0.4174793, -0.3260043, 3.622206, 0, 0.03529412, 1, 1,
0.4179498, 0.9323065, 0.05332047, 0, 0.02745098, 1, 1,
0.4269764, -1.270223, 2.436102, 0, 0.02352941, 1, 1,
0.4308085, -1.090461, 2.874949, 0, 0.01568628, 1, 1,
0.4311532, 1.368541, 0.5099468, 0, 0.01176471, 1, 1,
0.4313414, -0.2712547, 1.674461, 0, 0.003921569, 1, 1,
0.434076, -0.1919579, 2.444845, 0.003921569, 0, 1, 1,
0.4351377, 0.6808601, 0.5919015, 0.007843138, 0, 1, 1,
0.4361979, -3.440897, 5.135515, 0.01568628, 0, 1, 1,
0.4375107, -0.4942425, 3.331864, 0.01960784, 0, 1, 1,
0.4386885, 0.8578126, -0.6655523, 0.02745098, 0, 1, 1,
0.4387612, 1.219635, -0.08369379, 0.03137255, 0, 1, 1,
0.4418317, -2.193481, 3.395319, 0.03921569, 0, 1, 1,
0.4516566, -1.881238, 6.25149, 0.04313726, 0, 1, 1,
0.4523374, 0.4341316, -0.841497, 0.05098039, 0, 1, 1,
0.4588789, 2.01469, 0.8613964, 0.05490196, 0, 1, 1,
0.459888, -1.937273, 2.240768, 0.0627451, 0, 1, 1,
0.4693764, 0.7876556, 1.662875, 0.06666667, 0, 1, 1,
0.4785959, 0.4051439, 0.9942525, 0.07450981, 0, 1, 1,
0.4813368, 0.1251628, 1.191747, 0.07843138, 0, 1, 1,
0.4823371, 0.161328, 1.739637, 0.08627451, 0, 1, 1,
0.4869616, 0.5050177, 1.755946, 0.09019608, 0, 1, 1,
0.487579, 0.6046863, 0.7260416, 0.09803922, 0, 1, 1,
0.4903412, -0.3226981, 1.693954, 0.1058824, 0, 1, 1,
0.4919822, 1.101558, 1.054213, 0.1098039, 0, 1, 1,
0.4955462, 0.03982228, 1.216185, 0.1176471, 0, 1, 1,
0.4965415, -0.9851872, 1.745727, 0.1215686, 0, 1, 1,
0.5019975, -1.026393, 2.842825, 0.1294118, 0, 1, 1,
0.5063087, 0.05137982, 2.555224, 0.1333333, 0, 1, 1,
0.5067813, 0.9243114, 1.646394, 0.1411765, 0, 1, 1,
0.5136805, 0.4141941, 0.312984, 0.145098, 0, 1, 1,
0.5166394, -0.7365327, 2.368741, 0.1529412, 0, 1, 1,
0.5169891, 0.7816367, 0.2531754, 0.1568628, 0, 1, 1,
0.5202596, -1.02277, 4.022835, 0.1647059, 0, 1, 1,
0.5203559, 0.2307217, 1.843926, 0.1686275, 0, 1, 1,
0.5206223, 0.7995443, 1.240873, 0.1764706, 0, 1, 1,
0.5211724, 0.3605168, 2.474309, 0.1803922, 0, 1, 1,
0.5241613, -1.047172, 4.431964, 0.1882353, 0, 1, 1,
0.525218, 1.631683, -0.6863713, 0.1921569, 0, 1, 1,
0.5288933, 0.1668652, 1.8425, 0.2, 0, 1, 1,
0.5291399, 1.25473, 0.9268056, 0.2078431, 0, 1, 1,
0.5305159, -0.4390341, 0.8801879, 0.2117647, 0, 1, 1,
0.5311982, 1.97617, 0.1602156, 0.2196078, 0, 1, 1,
0.5315598, -0.1497495, 1.133133, 0.2235294, 0, 1, 1,
0.532609, 0.09286596, 1.34052, 0.2313726, 0, 1, 1,
0.532816, -0.09829626, -0.2038188, 0.2352941, 0, 1, 1,
0.5328851, 0.756791, 0.4081633, 0.2431373, 0, 1, 1,
0.5443461, 0.7571316, -0.8035684, 0.2470588, 0, 1, 1,
0.5465147, 0.1777452, 1.35654, 0.254902, 0, 1, 1,
0.5465772, -0.5575304, 3.152297, 0.2588235, 0, 1, 1,
0.5475011, -0.2020821, 1.896009, 0.2666667, 0, 1, 1,
0.5478924, -0.4407521, 1.439921, 0.2705882, 0, 1, 1,
0.5481465, 0.1437521, 0.7743886, 0.2784314, 0, 1, 1,
0.5520575, 0.5144988, -0.0347026, 0.282353, 0, 1, 1,
0.5532757, 0.4602512, 1.76717, 0.2901961, 0, 1, 1,
0.5578613, 1.218119, 0.1024461, 0.2941177, 0, 1, 1,
0.5580268, 1.4986, 0.3177816, 0.3019608, 0, 1, 1,
0.560711, -0.7725536, 3.73538, 0.3098039, 0, 1, 1,
0.5615512, 0.2573999, -0.4250844, 0.3137255, 0, 1, 1,
0.5626957, -0.7953104, 3.350322, 0.3215686, 0, 1, 1,
0.5636622, 0.09793939, 0.1980852, 0.3254902, 0, 1, 1,
0.5643455, -1.253846, 2.570295, 0.3333333, 0, 1, 1,
0.5696085, 0.2198896, 0.1364017, 0.3372549, 0, 1, 1,
0.573234, -0.369673, 1.814744, 0.345098, 0, 1, 1,
0.5747988, -0.2794028, 2.022702, 0.3490196, 0, 1, 1,
0.5760964, -1.14412, 0.909577, 0.3568628, 0, 1, 1,
0.5810989, 0.3292979, 2.720714, 0.3607843, 0, 1, 1,
0.5836907, -1.794338, 3.51722, 0.3686275, 0, 1, 1,
0.5840853, -0.2287429, 1.231329, 0.372549, 0, 1, 1,
0.5876392, -0.5447889, 2.354719, 0.3803922, 0, 1, 1,
0.5911232, -0.127693, 2.771332, 0.3843137, 0, 1, 1,
0.596251, -1.2534, 1.6881, 0.3921569, 0, 1, 1,
0.5966743, 0.6619517, 2.836216, 0.3960784, 0, 1, 1,
0.5983734, 0.5884169, 0.4560075, 0.4039216, 0, 1, 1,
0.6029533, 1.51425, -1.649651, 0.4117647, 0, 1, 1,
0.6053125, 1.3559, 0.01102396, 0.4156863, 0, 1, 1,
0.6073265, -1.614953, 2.288832, 0.4235294, 0, 1, 1,
0.6119482, 1.268366, 1.488494, 0.427451, 0, 1, 1,
0.6211589, -1.562223, 2.501319, 0.4352941, 0, 1, 1,
0.6235345, -0.1426469, -0.3965389, 0.4392157, 0, 1, 1,
0.6268157, 1.607833, -0.4285984, 0.4470588, 0, 1, 1,
0.6290194, 0.9560843, 0.2380123, 0.4509804, 0, 1, 1,
0.6305382, 1.185542, 2.090513, 0.4588235, 0, 1, 1,
0.6339417, 0.8627018, -0.03474297, 0.4627451, 0, 1, 1,
0.6423633, -0.1579155, 1.026884, 0.4705882, 0, 1, 1,
0.6519325, 0.9307538, 0.9084589, 0.4745098, 0, 1, 1,
0.6603032, -0.7775822, 2.944836, 0.4823529, 0, 1, 1,
0.6729527, -0.1819659, -0.03118288, 0.4862745, 0, 1, 1,
0.6752884, -0.1104661, 0.9808926, 0.4941176, 0, 1, 1,
0.6779793, -0.6089095, 2.125126, 0.5019608, 0, 1, 1,
0.6788217, -1.104105, 1.764285, 0.5058824, 0, 1, 1,
0.6860556, 0.970803, 1.694587, 0.5137255, 0, 1, 1,
0.6876876, -0.7393749, 3.966552, 0.5176471, 0, 1, 1,
0.6912642, 0.5966952, 0.850114, 0.5254902, 0, 1, 1,
0.6954066, 1.008445, 1.649717, 0.5294118, 0, 1, 1,
0.6969696, 1.375657, 0.2571611, 0.5372549, 0, 1, 1,
0.7002761, -0.2734767, 2.269193, 0.5411765, 0, 1, 1,
0.7065938, -0.2457217, 1.173141, 0.5490196, 0, 1, 1,
0.7075717, 0.6821116, -0.003346753, 0.5529412, 0, 1, 1,
0.710346, -0.3398605, 2.699209, 0.5607843, 0, 1, 1,
0.7162294, 0.07438899, -0.7759308, 0.5647059, 0, 1, 1,
0.7165365, 0.1103986, 0.574136, 0.572549, 0, 1, 1,
0.7187446, 0.966818, 0.3901722, 0.5764706, 0, 1, 1,
0.7211927, 2.151837, 0.7447247, 0.5843138, 0, 1, 1,
0.7248231, 0.4687206, 0.1136332, 0.5882353, 0, 1, 1,
0.7265652, 0.7987, -0.4934274, 0.5960785, 0, 1, 1,
0.728053, 0.7013367, 1.002135, 0.6039216, 0, 1, 1,
0.7289461, -1.219479, 4.352873, 0.6078432, 0, 1, 1,
0.729987, 1.815162, 1.358837, 0.6156863, 0, 1, 1,
0.7342216, -0.06822247, 1.089659, 0.6196079, 0, 1, 1,
0.7348455, 1.448997, 0.7347066, 0.627451, 0, 1, 1,
0.7403178, -0.3730835, 2.36134, 0.6313726, 0, 1, 1,
0.7466546, 0.1145789, 0.6080955, 0.6392157, 0, 1, 1,
0.7478084, 2.241134, 0.955196, 0.6431373, 0, 1, 1,
0.7488546, -1.471819, 3.473778, 0.6509804, 0, 1, 1,
0.7488801, -0.2844654, 1.519771, 0.654902, 0, 1, 1,
0.7504624, -0.3961322, 1.083867, 0.6627451, 0, 1, 1,
0.7604262, 0.6707993, 1.195065, 0.6666667, 0, 1, 1,
0.7611134, 0.6305391, 0.03478168, 0.6745098, 0, 1, 1,
0.764126, 0.0363434, 1.440701, 0.6784314, 0, 1, 1,
0.7642152, -0.07631926, 0.5800843, 0.6862745, 0, 1, 1,
0.7645879, 0.5131243, 1.163502, 0.6901961, 0, 1, 1,
0.7646576, 0.4729848, 0.3785103, 0.6980392, 0, 1, 1,
0.7681859, 0.4807116, 1.778766, 0.7058824, 0, 1, 1,
0.7690861, 1.475041, 0.8585795, 0.7098039, 0, 1, 1,
0.774816, -0.8937899, 3.939285, 0.7176471, 0, 1, 1,
0.7798767, 0.013796, 1.926099, 0.7215686, 0, 1, 1,
0.7803574, 0.7545891, -0.8075403, 0.7294118, 0, 1, 1,
0.7804862, -1.932992, 0.1993342, 0.7333333, 0, 1, 1,
0.7810777, -0.4410758, 3.41804, 0.7411765, 0, 1, 1,
0.7838136, -1.275234, 2.669252, 0.7450981, 0, 1, 1,
0.7927968, 1.468309, 1.177293, 0.7529412, 0, 1, 1,
0.796477, -0.05104509, 1.321805, 0.7568628, 0, 1, 1,
0.7993038, 0.6435569, -1.401156, 0.7647059, 0, 1, 1,
0.7997491, -2.25545, 3.342144, 0.7686275, 0, 1, 1,
0.8025088, 0.7551127, 0.6179616, 0.7764706, 0, 1, 1,
0.8037126, -0.6611567, 3.263888, 0.7803922, 0, 1, 1,
0.8038044, 0.9925926, 0.2081493, 0.7882353, 0, 1, 1,
0.8078148, 3.410014, 0.460824, 0.7921569, 0, 1, 1,
0.8104379, 0.7360451, 2.958988, 0.8, 0, 1, 1,
0.8182876, 1.323457, 1.526715, 0.8078431, 0, 1, 1,
0.8269197, 1.416833, 0.529919, 0.8117647, 0, 1, 1,
0.8344309, -0.2751942, 2.878173, 0.8196079, 0, 1, 1,
0.8358029, -1.719527, 3.07868, 0.8235294, 0, 1, 1,
0.8530068, -0.7660671, 1.340529, 0.8313726, 0, 1, 1,
0.8590574, -1.206595, 2.548133, 0.8352941, 0, 1, 1,
0.864144, -2.047464, 2.751898, 0.8431373, 0, 1, 1,
0.8685046, -0.2751561, 1.866001, 0.8470588, 0, 1, 1,
0.8738195, -2.160989, 2.536157, 0.854902, 0, 1, 1,
0.881235, -0.8623857, 0.5429291, 0.8588235, 0, 1, 1,
0.8875037, -0.1515513, 3.082857, 0.8666667, 0, 1, 1,
0.8893273, 1.013682, -0.1864041, 0.8705882, 0, 1, 1,
0.8980562, -0.5450897, 3.60852, 0.8784314, 0, 1, 1,
0.898497, 0.2629194, 0.669242, 0.8823529, 0, 1, 1,
0.8990887, -0.2791258, 1.382291, 0.8901961, 0, 1, 1,
0.900217, 0.1026812, 0.05747767, 0.8941177, 0, 1, 1,
0.9011669, 0.5473385, 0.9216673, 0.9019608, 0, 1, 1,
0.9086423, -0.4695719, 2.429372, 0.9098039, 0, 1, 1,
0.9095902, 0.1958326, 0.9979678, 0.9137255, 0, 1, 1,
0.9129005, 0.308936, 1.200095, 0.9215686, 0, 1, 1,
0.9170064, -0.5781615, 2.59545, 0.9254902, 0, 1, 1,
0.9257473, -1.07948, 2.157743, 0.9333333, 0, 1, 1,
0.9271929, 2.49056, 0.6264067, 0.9372549, 0, 1, 1,
0.9308632, -0.01497197, 1.143237, 0.945098, 0, 1, 1,
0.9372937, 0.4186895, 2.614533, 0.9490196, 0, 1, 1,
0.9388205, 0.5490487, 0.21555, 0.9568627, 0, 1, 1,
0.9416006, 0.4395196, -0.4164732, 0.9607843, 0, 1, 1,
0.9432737, -1.603262, 2.116177, 0.9686275, 0, 1, 1,
0.9477125, 1.252697, 0.4050786, 0.972549, 0, 1, 1,
0.9485249, 0.2758032, 1.544277, 0.9803922, 0, 1, 1,
0.9508393, -0.2450736, 3.012818, 0.9843137, 0, 1, 1,
0.9513584, 1.120583, 1.546214, 0.9921569, 0, 1, 1,
0.951986, 0.8171729, 0.41691, 0.9960784, 0, 1, 1,
0.9550605, -0.2834751, 2.922507, 1, 0, 0.9960784, 1,
0.9569631, 0.04681226, 0.7512954, 1, 0, 0.9882353, 1,
0.9573983, 1.043268, 0.7464861, 1, 0, 0.9843137, 1,
0.9582756, 0.2926229, 1.653926, 1, 0, 0.9764706, 1,
0.9614749, -0.3447793, 1.591293, 1, 0, 0.972549, 1,
0.9679908, -0.02699562, 2.274793, 1, 0, 0.9647059, 1,
0.9680359, -0.4699124, 1.513132, 1, 0, 0.9607843, 1,
0.9727529, -0.2210479, 1.364504, 1, 0, 0.9529412, 1,
0.9768224, -0.04986826, 2.522149, 1, 0, 0.9490196, 1,
0.9815505, -0.4204943, 0.8235512, 1, 0, 0.9411765, 1,
0.9869646, -0.2733321, 2.050667, 1, 0, 0.9372549, 1,
0.9892918, -0.6716238, 1.533942, 1, 0, 0.9294118, 1,
0.9911943, 0.6267506, 2.355909, 1, 0, 0.9254902, 1,
0.9920418, -1.145802, 1.382669, 1, 0, 0.9176471, 1,
0.9961832, -0.4656926, 2.834829, 1, 0, 0.9137255, 1,
0.9986163, 0.4894158, 1.445643, 1, 0, 0.9058824, 1,
1.000172, -0.5583906, 4.39346, 1, 0, 0.9019608, 1,
1.003786, -0.8481519, 1.270964, 1, 0, 0.8941177, 1,
1.00399, -0.5364302, 1.451097, 1, 0, 0.8862745, 1,
1.005387, -0.8025426, 1.049235, 1, 0, 0.8823529, 1,
1.007281, -0.1220842, 2.447284, 1, 0, 0.8745098, 1,
1.007373, 0.06167875, 2.500845, 1, 0, 0.8705882, 1,
1.008651, 0.7904223, 1.547976, 1, 0, 0.8627451, 1,
1.013372, 0.30998, 1.882637, 1, 0, 0.8588235, 1,
1.023178, -1.035482, 4.548366, 1, 0, 0.8509804, 1,
1.051499, 0.1946682, 0.8102462, 1, 0, 0.8470588, 1,
1.053967, 0.4912373, 3.689035, 1, 0, 0.8392157, 1,
1.054368, 0.3607152, -0.3181367, 1, 0, 0.8352941, 1,
1.057082, 1.432628, 0.1501527, 1, 0, 0.827451, 1,
1.065693, -1.571891, 2.376404, 1, 0, 0.8235294, 1,
1.067492, 0.02360543, 1.03236, 1, 0, 0.8156863, 1,
1.068308, 0.2273271, 0.6519347, 1, 0, 0.8117647, 1,
1.074626, 0.9948434, 0.6803882, 1, 0, 0.8039216, 1,
1.077683, 2.007741, 2.806429, 1, 0, 0.7960784, 1,
1.08003, 0.6689221, 0.5702842, 1, 0, 0.7921569, 1,
1.090658, -2.244465, 2.865861, 1, 0, 0.7843137, 1,
1.091785, 0.8997905, 0.8772789, 1, 0, 0.7803922, 1,
1.093207, 1.149449, 0.2060056, 1, 0, 0.772549, 1,
1.094282, 0.1760531, 1.874095, 1, 0, 0.7686275, 1,
1.096469, -0.5639419, 1.775177, 1, 0, 0.7607843, 1,
1.100153, -0.2266454, 0.5094807, 1, 0, 0.7568628, 1,
1.103281, 0.9720239, 0.594831, 1, 0, 0.7490196, 1,
1.104046, 2.590232, -0.4572165, 1, 0, 0.7450981, 1,
1.107748, 1.203951, 0.2750017, 1, 0, 0.7372549, 1,
1.111742, 0.7070051, -1.333769, 1, 0, 0.7333333, 1,
1.112641, -0.2469557, 3.868155, 1, 0, 0.7254902, 1,
1.115453, -0.6262884, 1.50265, 1, 0, 0.7215686, 1,
1.119496, -0.1426201, 1.243725, 1, 0, 0.7137255, 1,
1.121877, 0.8496566, 1.243606, 1, 0, 0.7098039, 1,
1.139601, -0.08400572, 1.826673, 1, 0, 0.7019608, 1,
1.150417, -2.14047, 4.17064, 1, 0, 0.6941177, 1,
1.155466, -0.3746376, 1.465084, 1, 0, 0.6901961, 1,
1.159164, -0.05350859, 1.900969, 1, 0, 0.682353, 1,
1.163042, 0.965352, 0.2235758, 1, 0, 0.6784314, 1,
1.180808, -1.147353, 2.498768, 1, 0, 0.6705883, 1,
1.18473, 0.6117719, 0.587019, 1, 0, 0.6666667, 1,
1.186984, 0.464148, 0.4114935, 1, 0, 0.6588235, 1,
1.188994, -0.1653135, 0.8627287, 1, 0, 0.654902, 1,
1.189827, 0.08262184, -0.5521392, 1, 0, 0.6470588, 1,
1.1965, 0.3022196, -0.2843657, 1, 0, 0.6431373, 1,
1.196824, -0.02917315, 0.8067853, 1, 0, 0.6352941, 1,
1.197615, -0.5161532, 3.175933, 1, 0, 0.6313726, 1,
1.199058, 1.462623, 0.011362, 1, 0, 0.6235294, 1,
1.202801, -0.4591764, 2.850814, 1, 0, 0.6196079, 1,
1.2041, -0.586055, 2.04817, 1, 0, 0.6117647, 1,
1.214819, -0.05278299, 2.885232, 1, 0, 0.6078432, 1,
1.226271, 0.4621819, 1.280129, 1, 0, 0.6, 1,
1.234481, 1.984219, 2.209889, 1, 0, 0.5921569, 1,
1.236792, 0.5564165, 0.6252379, 1, 0, 0.5882353, 1,
1.241681, -0.9673089, 2.479674, 1, 0, 0.5803922, 1,
1.247426, -0.537313, 1.590793, 1, 0, 0.5764706, 1,
1.254194, 1.126657, 1.535418, 1, 0, 0.5686275, 1,
1.266021, -1.748394, 3.261655, 1, 0, 0.5647059, 1,
1.267751, -1.457818, 1.999462, 1, 0, 0.5568628, 1,
1.272314, -0.4103056, 2.424268, 1, 0, 0.5529412, 1,
1.277309, -1.474163, 2.318618, 1, 0, 0.5450981, 1,
1.278104, 0.950189, 0.5895525, 1, 0, 0.5411765, 1,
1.28888, -0.134422, 0.5014214, 1, 0, 0.5333334, 1,
1.295718, -0.3804112, 1.191351, 1, 0, 0.5294118, 1,
1.295794, -0.2820704, 2.110128, 1, 0, 0.5215687, 1,
1.311134, 0.6561508, 3.137044, 1, 0, 0.5176471, 1,
1.316553, -0.3519132, 3.006362, 1, 0, 0.509804, 1,
1.331247, -0.8265597, 1.423166, 1, 0, 0.5058824, 1,
1.331874, -0.6495574, 2.139186, 1, 0, 0.4980392, 1,
1.340196, -0.1924623, 1.755921, 1, 0, 0.4901961, 1,
1.358636, 1.545163, -0.317412, 1, 0, 0.4862745, 1,
1.364074, -0.5516676, 1.752086, 1, 0, 0.4784314, 1,
1.425348, 0.8114859, 2.584108, 1, 0, 0.4745098, 1,
1.425974, -1.165729, 1.174331, 1, 0, 0.4666667, 1,
1.433052, -0.7499681, 1.069188, 1, 0, 0.4627451, 1,
1.435956, 0.965176, 3.0365, 1, 0, 0.454902, 1,
1.436427, -0.6000282, 0.5563028, 1, 0, 0.4509804, 1,
1.438512, 1.678576, 1.019106, 1, 0, 0.4431373, 1,
1.440497, -0.2523887, 2.776506, 1, 0, 0.4392157, 1,
1.443778, -1.088344, 2.264712, 1, 0, 0.4313726, 1,
1.444304, 0.5262225, 1.519038, 1, 0, 0.427451, 1,
1.44618, -0.01729804, 0.6759555, 1, 0, 0.4196078, 1,
1.455045, -1.736127, 2.835707, 1, 0, 0.4156863, 1,
1.4558, 0.3908133, 1.33475, 1, 0, 0.4078431, 1,
1.456956, -0.8906779, 1.721966, 1, 0, 0.4039216, 1,
1.469775, 0.7263436, 1.052949, 1, 0, 0.3960784, 1,
1.477187, -0.4604065, 1.286151, 1, 0, 0.3882353, 1,
1.478757, -1.497585, 3.390263, 1, 0, 0.3843137, 1,
1.492812, 0.1184773, 0.8649074, 1, 0, 0.3764706, 1,
1.527303, -0.6876043, 1.817344, 1, 0, 0.372549, 1,
1.52836, -1.670416, 3.723516, 1, 0, 0.3647059, 1,
1.532342, 1.303936, -0.9539171, 1, 0, 0.3607843, 1,
1.549401, -1.490002, 0.2498782, 1, 0, 0.3529412, 1,
1.562058, 1.800641, 2.331976, 1, 0, 0.3490196, 1,
1.567807, -0.7926586, 2.278193, 1, 0, 0.3411765, 1,
1.570118, 0.9100661, 1.149979, 1, 0, 0.3372549, 1,
1.573083, -1.792494, 2.468019, 1, 0, 0.3294118, 1,
1.585756, 0.1471651, 2.164819, 1, 0, 0.3254902, 1,
1.586422, 0.8230494, -1.021654, 1, 0, 0.3176471, 1,
1.589916, -0.2340874, 1.284918, 1, 0, 0.3137255, 1,
1.595036, 0.0542588, 2.25465, 1, 0, 0.3058824, 1,
1.619226, 0.4097716, 2.168649, 1, 0, 0.2980392, 1,
1.619234, 0.5074938, -0.2615305, 1, 0, 0.2941177, 1,
1.63018, 1.475197, 1.196379, 1, 0, 0.2862745, 1,
1.631498, -1.664098, 1.475154, 1, 0, 0.282353, 1,
1.63299, 0.3560501, 1.70362, 1, 0, 0.2745098, 1,
1.635372, 0.3325272, 1.304916, 1, 0, 0.2705882, 1,
1.640098, 1.260254, 3.943692, 1, 0, 0.2627451, 1,
1.653741, -0.01115876, 0.7503502, 1, 0, 0.2588235, 1,
1.658824, -1.530276, 1.969675, 1, 0, 0.2509804, 1,
1.681226, -0.4779045, 2.618631, 1, 0, 0.2470588, 1,
1.712704, -0.3657634, 0.7987831, 1, 0, 0.2392157, 1,
1.720252, -0.5028808, 2.545679, 1, 0, 0.2352941, 1,
1.726652, 0.1027535, 1.50222, 1, 0, 0.227451, 1,
1.757917, 0.3227167, 1.622931, 1, 0, 0.2235294, 1,
1.809331, -1.089804, 1.11012, 1, 0, 0.2156863, 1,
1.810551, 0.1859625, 3.218394, 1, 0, 0.2117647, 1,
1.821709, -2.038621, 2.094998, 1, 0, 0.2039216, 1,
1.845157, -1.941885, 2.028105, 1, 0, 0.1960784, 1,
1.848602, -3.15785, 2.817014, 1, 0, 0.1921569, 1,
1.88982, -0.827678, 1.779212, 1, 0, 0.1843137, 1,
1.891116, -0.04978559, 2.682132, 1, 0, 0.1803922, 1,
1.897768, -1.246354, 3.009755, 1, 0, 0.172549, 1,
1.897813, -0.3351351, 3.788108, 1, 0, 0.1686275, 1,
1.905751, -1.404833, 3.417515, 1, 0, 0.1607843, 1,
1.921613, -1.007684, 0.5484486, 1, 0, 0.1568628, 1,
1.946857, -0.8701533, 1.028559, 1, 0, 0.1490196, 1,
1.9761, 1.515028, 0.1432853, 1, 0, 0.145098, 1,
2.003132, -0.2842775, 1.245512, 1, 0, 0.1372549, 1,
2.039498, 0.5045204, 2.136776, 1, 0, 0.1333333, 1,
2.063342, 0.9499187, 2.070814, 1, 0, 0.1254902, 1,
2.064123, 0.512401, 1.972273, 1, 0, 0.1215686, 1,
2.101985, 0.6826276, 0.7042193, 1, 0, 0.1137255, 1,
2.124689, -0.3664075, 0.7332353, 1, 0, 0.1098039, 1,
2.151966, -1.862398, 1.896582, 1, 0, 0.1019608, 1,
2.169254, -0.2914735, 0.4548186, 1, 0, 0.09411765, 1,
2.18291, 1.273919, 3.618417, 1, 0, 0.09019608, 1,
2.206731, -0.442828, 2.602446, 1, 0, 0.08235294, 1,
2.222484, 1.822309, 0.7842004, 1, 0, 0.07843138, 1,
2.281949, -1.171171, 2.563224, 1, 0, 0.07058824, 1,
2.30403, -0.8307604, 0.7855192, 1, 0, 0.06666667, 1,
2.310023, 0.552752, 1.431072, 1, 0, 0.05882353, 1,
2.314031, 0.3989358, 1.312592, 1, 0, 0.05490196, 1,
2.339996, -0.3461975, 1.879841, 1, 0, 0.04705882, 1,
2.354134, 2.118187, 0.03682169, 1, 0, 0.04313726, 1,
2.512963, 0.8049431, -0.520194, 1, 0, 0.03529412, 1,
2.543355, 1.921605, 0.6586635, 1, 0, 0.03137255, 1,
2.573041, -0.3975892, 2.437405, 1, 0, 0.02352941, 1,
2.578139, -1.221861, 1.489252, 1, 0, 0.01960784, 1,
3.033177, 0.8275229, 1.299725, 1, 0, 0.01176471, 1,
3.364231, -0.265115, 0.9788449, 1, 0, 0.007843138, 1
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
0.145259, -5.540289, -7.18591, 0, -0.5, 0.5, 0.5,
0.145259, -5.540289, -7.18591, 1, -0.5, 0.5, 0.5,
0.145259, -5.540289, -7.18591, 1, 1.5, 0.5, 0.5,
0.145259, -5.540289, -7.18591, 0, 1.5, 0.5, 0.5
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
-4.164945, -0.4165369, -7.18591, 0, -0.5, 0.5, 0.5,
-4.164945, -0.4165369, -7.18591, 1, -0.5, 0.5, 0.5,
-4.164945, -0.4165369, -7.18591, 1, 1.5, 0.5, 0.5,
-4.164945, -0.4165369, -7.18591, 0, 1.5, 0.5, 0.5
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
-4.164945, -5.540289, 0.5065565, 0, -0.5, 0.5, 0.5,
-4.164945, -5.540289, 0.5065565, 1, -0.5, 0.5, 0.5,
-4.164945, -5.540289, 0.5065565, 1, 1.5, 0.5, 0.5,
-4.164945, -5.540289, 0.5065565, 0, 1.5, 0.5, 0.5
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
-3, -4.357885, -5.410725,
3, -4.357885, -5.410725,
-3, -4.357885, -5.410725,
-3, -4.554952, -5.706589,
-2, -4.357885, -5.410725,
-2, -4.554952, -5.706589,
-1, -4.357885, -5.410725,
-1, -4.554952, -5.706589,
0, -4.357885, -5.410725,
0, -4.554952, -5.706589,
1, -4.357885, -5.410725,
1, -4.554952, -5.706589,
2, -4.357885, -5.410725,
2, -4.554952, -5.706589,
3, -4.357885, -5.410725,
3, -4.554952, -5.706589
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
-3, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
-3, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
-3, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
-3, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
-2, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
-2, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
-2, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
-2, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
-1, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
-1, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
-1, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
-1, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
0, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
0, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
0, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
0, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
1, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
1, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
1, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
1, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
2, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
2, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
2, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
2, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5,
3, -4.949087, -6.298317, 0, -0.5, 0.5, 0.5,
3, -4.949087, -6.298317, 1, -0.5, 0.5, 0.5,
3, -4.949087, -6.298317, 1, 1.5, 0.5, 0.5,
3, -4.949087, -6.298317, 0, 1.5, 0.5, 0.5
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
-3.170282, -4, -5.410725,
-3.170282, 2, -5.410725,
-3.170282, -4, -5.410725,
-3.33606, -4, -5.706589,
-3.170282, -2, -5.410725,
-3.33606, -2, -5.706589,
-3.170282, 0, -5.410725,
-3.33606, 0, -5.706589,
-3.170282, 2, -5.410725,
-3.33606, 2, -5.706589
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
"-4",
"-2",
"0",
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
-3.667614, -4, -6.298317, 0, -0.5, 0.5, 0.5,
-3.667614, -4, -6.298317, 1, -0.5, 0.5, 0.5,
-3.667614, -4, -6.298317, 1, 1.5, 0.5, 0.5,
-3.667614, -4, -6.298317, 0, 1.5, 0.5, 0.5,
-3.667614, -2, -6.298317, 0, -0.5, 0.5, 0.5,
-3.667614, -2, -6.298317, 1, -0.5, 0.5, 0.5,
-3.667614, -2, -6.298317, 1, 1.5, 0.5, 0.5,
-3.667614, -2, -6.298317, 0, 1.5, 0.5, 0.5,
-3.667614, 0, -6.298317, 0, -0.5, 0.5, 0.5,
-3.667614, 0, -6.298317, 1, -0.5, 0.5, 0.5,
-3.667614, 0, -6.298317, 1, 1.5, 0.5, 0.5,
-3.667614, 0, -6.298317, 0, 1.5, 0.5, 0.5,
-3.667614, 2, -6.298317, 0, -0.5, 0.5, 0.5,
-3.667614, 2, -6.298317, 1, -0.5, 0.5, 0.5,
-3.667614, 2, -6.298317, 1, 1.5, 0.5, 0.5,
-3.667614, 2, -6.298317, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.170282, -4.357885, -4,
-3.170282, -4.357885, 6,
-3.170282, -4.357885, -4,
-3.33606, -4.554952, -4,
-3.170282, -4.357885, -2,
-3.33606, -4.554952, -2,
-3.170282, -4.357885, 0,
-3.33606, -4.554952, 0,
-3.170282, -4.357885, 2,
-3.33606, -4.554952, 2,
-3.170282, -4.357885, 4,
-3.33606, -4.554952, 4,
-3.170282, -4.357885, 6,
-3.33606, -4.554952, 6
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
-3.667614, -4.949087, -4, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, -4, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, -4, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, -4, 0, 1.5, 0.5, 0.5,
-3.667614, -4.949087, -2, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, -2, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, -2, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, -2, 0, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 0, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 0, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 0, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 0, 0, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 2, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 2, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 2, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 2, 0, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 4, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 4, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 4, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 4, 0, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 6, 0, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 6, 1, -0.5, 0.5, 0.5,
-3.667614, -4.949087, 6, 1, 1.5, 0.5, 0.5,
-3.667614, -4.949087, 6, 0, 1.5, 0.5, 0.5
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
-3.170282, -4.357885, -5.410725,
-3.170282, 3.524811, -5.410725,
-3.170282, -4.357885, 6.423838,
-3.170282, 3.524811, 6.423838,
-3.170282, -4.357885, -5.410725,
-3.170282, -4.357885, 6.423838,
-3.170282, 3.524811, -5.410725,
-3.170282, 3.524811, 6.423838,
-3.170282, -4.357885, -5.410725,
3.4608, -4.357885, -5.410725,
-3.170282, -4.357885, 6.423838,
3.4608, -4.357885, 6.423838,
-3.170282, 3.524811, -5.410725,
3.4608, 3.524811, -5.410725,
-3.170282, 3.524811, 6.423838,
3.4608, 3.524811, 6.423838,
3.4608, -4.357885, -5.410725,
3.4608, 3.524811, -5.410725,
3.4608, -4.357885, 6.423838,
3.4608, 3.524811, 6.423838,
3.4608, -4.357885, -5.410725,
3.4608, -4.357885, 6.423838,
3.4608, 3.524811, -5.410725,
3.4608, 3.524811, 6.423838
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
var radius = 8.377967;
var distance = 37.27452;
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
mvMatrix.translate( -0.145259, 0.4165369, -0.5065565 );
mvMatrix.scale( 1.366055, 1.149153, 0.7654209 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.27452);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
pirimiphos_ethyl<-read.table("pirimiphos_ethyl.xyz")
```

```
## Error in read.table("pirimiphos_ethyl.xyz"): no lines available in input
```

```r
x<-pirimiphos_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
y<-pirimiphos_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
```

```r
z<-pirimiphos_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pirimiphos_ethyl' not found
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
-3.073713, 0.114514, -2.935707, 0, 0, 1, 1, 1,
-3.002629, 0.8569654, -1.209916, 1, 0, 0, 1, 1,
-2.975265, -0.8082546, -0.6954008, 1, 0, 0, 1, 1,
-2.826104, 1.426526, -1.461967, 1, 0, 0, 1, 1,
-2.806134, -0.6050369, -1.545905, 1, 0, 0, 1, 1,
-2.748166, 0.5432178, -1.83153, 1, 0, 0, 1, 1,
-2.559278, -0.1601201, -1.568839, 0, 0, 0, 1, 1,
-2.491651, -1.063421, -1.530752, 0, 0, 0, 1, 1,
-2.47952, -0.6416813, -1.557042, 0, 0, 0, 1, 1,
-2.40493, -1.416008, -1.449544, 0, 0, 0, 1, 1,
-2.363995, -0.8433276, -2.854718, 0, 0, 0, 1, 1,
-2.342453, -1.623257, -2.855183, 0, 0, 0, 1, 1,
-2.255512, -0.8532413, -2.10449, 0, 0, 0, 1, 1,
-2.250153, 0.6600417, 0.9319959, 1, 1, 1, 1, 1,
-2.214909, -0.3659959, -2.295514, 1, 1, 1, 1, 1,
-2.212774, -0.5280189, -4.580187, 1, 1, 1, 1, 1,
-2.162426, 0.2512124, -0.156206, 1, 1, 1, 1, 1,
-2.156981, -0.200193, -2.118715, 1, 1, 1, 1, 1,
-2.105394, -0.1416812, -2.196734, 1, 1, 1, 1, 1,
-2.102882, -1.615436, -3.050039, 1, 1, 1, 1, 1,
-2.023175, 1.102029, -0.9539791, 1, 1, 1, 1, 1,
-2.012369, -0.7581441, -2.370532, 1, 1, 1, 1, 1,
-2.007084, -1.632888, -0.6012225, 1, 1, 1, 1, 1,
-2.002866, -0.3984371, -1.376204, 1, 1, 1, 1, 1,
-1.992686, 1.882097, -1.829314, 1, 1, 1, 1, 1,
-1.962459, -0.5067183, -0.7247863, 1, 1, 1, 1, 1,
-1.95541, -0.5830128, -2.765918, 1, 1, 1, 1, 1,
-1.913764, 1.259775, 0.3544619, 1, 1, 1, 1, 1,
-1.908657, 2.548457, -0.2339981, 0, 0, 1, 1, 1,
-1.907684, -0.4954893, -1.336305, 1, 0, 0, 1, 1,
-1.886064, -1.057572, -1.934761, 1, 0, 0, 1, 1,
-1.877917, -0.8327209, -1.853395, 1, 0, 0, 1, 1,
-1.869085, -2.142997, -2.058307, 1, 0, 0, 1, 1,
-1.847526, 1.649944, -2.781535, 1, 0, 0, 1, 1,
-1.836922, 0.8127934, -0.8340075, 0, 0, 0, 1, 1,
-1.824345, -0.7610524, -2.129749, 0, 0, 0, 1, 1,
-1.820088, 0.05012674, -1.242591, 0, 0, 0, 1, 1,
-1.813516, 0.7475945, -1.404677, 0, 0, 0, 1, 1,
-1.789415, 0.4009289, -0.1768854, 0, 0, 0, 1, 1,
-1.783791, 0.1951425, 0.1296182, 0, 0, 0, 1, 1,
-1.771469, -2.569808, -3.639999, 0, 0, 0, 1, 1,
-1.767597, 0.90479, -0.7653174, 1, 1, 1, 1, 1,
-1.759722, -0.09452167, -2.102943, 1, 1, 1, 1, 1,
-1.757796, 1.475086, 0.3101723, 1, 1, 1, 1, 1,
-1.729591, -0.7274753, -2.250033, 1, 1, 1, 1, 1,
-1.728169, 0.39797, -1.605898, 1, 1, 1, 1, 1,
-1.691482, 0.7925122, 0.2378772, 1, 1, 1, 1, 1,
-1.690394, -1.609414, -0.560635, 1, 1, 1, 1, 1,
-1.68799, -0.1693784, -1.043127, 1, 1, 1, 1, 1,
-1.682955, -0.3382411, -3.284859, 1, 1, 1, 1, 1,
-1.682484, -1.181215, -1.095052, 1, 1, 1, 1, 1,
-1.67408, -2.512331, -3.329752, 1, 1, 1, 1, 1,
-1.662264, 0.3156773, -0.08424775, 1, 1, 1, 1, 1,
-1.654399, 0.1118306, -1.36326, 1, 1, 1, 1, 1,
-1.649924, 1.635313, -1.288208, 1, 1, 1, 1, 1,
-1.642869, 0.1967294, -2.027841, 1, 1, 1, 1, 1,
-1.628306, -0.4613172, -4.287652, 0, 0, 1, 1, 1,
-1.609878, 0.7152337, -0.6087527, 1, 0, 0, 1, 1,
-1.600639, 0.1834333, -2.694791, 1, 0, 0, 1, 1,
-1.583679, -1.074779, -1.143036, 1, 0, 0, 1, 1,
-1.577474, 0.4924434, -1.152728, 1, 0, 0, 1, 1,
-1.557892, 1.138551, -0.7784659, 1, 0, 0, 1, 1,
-1.548927, -0.08782007, -2.219927, 0, 0, 0, 1, 1,
-1.548298, -0.04345318, -0.8874818, 0, 0, 0, 1, 1,
-1.535728, 0.3272855, -2.206276, 0, 0, 0, 1, 1,
-1.535537, -2.155403, -3.720519, 0, 0, 0, 1, 1,
-1.52616, 1.106756, -0.7463743, 0, 0, 0, 1, 1,
-1.522466, -1.019825, -2.470912, 0, 0, 0, 1, 1,
-1.521036, -1.054633, -3.236669, 0, 0, 0, 1, 1,
-1.518577, 0.6125947, -0.938493, 1, 1, 1, 1, 1,
-1.51812, 0.05846613, -2.445889, 1, 1, 1, 1, 1,
-1.515207, 0.4158733, -3.190106, 1, 1, 1, 1, 1,
-1.505743, 0.922469, -1.692912, 1, 1, 1, 1, 1,
-1.505495, 0.1918479, -1.907357, 1, 1, 1, 1, 1,
-1.503639, 0.8103142, -0.8190463, 1, 1, 1, 1, 1,
-1.500369, 1.14664, -1.06234, 1, 1, 1, 1, 1,
-1.49332, 0.1336496, -2.483627, 1, 1, 1, 1, 1,
-1.486746, -1.246401, -1.577477, 1, 1, 1, 1, 1,
-1.481724, 0.8212521, -0.1876904, 1, 1, 1, 1, 1,
-1.47214, -0.1081728, -3.169887, 1, 1, 1, 1, 1,
-1.45521, 0.7949228, -0.09375072, 1, 1, 1, 1, 1,
-1.452847, -0.06224899, -1.516484, 1, 1, 1, 1, 1,
-1.45284, 0.1148483, -1.589633, 1, 1, 1, 1, 1,
-1.439906, -0.6917184, -0.4111555, 1, 1, 1, 1, 1,
-1.43496, 0.3959077, -1.134861, 0, 0, 1, 1, 1,
-1.415339, 0.2102593, -1.632392, 1, 0, 0, 1, 1,
-1.409847, -0.380817, -1.140867, 1, 0, 0, 1, 1,
-1.409519, -0.5055791, -2.217579, 1, 0, 0, 1, 1,
-1.398691, 0.9761416, 0.3845808, 1, 0, 0, 1, 1,
-1.398383, -0.6345026, -2.775639, 1, 0, 0, 1, 1,
-1.392033, -1.344798, -2.615566, 0, 0, 0, 1, 1,
-1.391853, -1.266101, -2.342284, 0, 0, 0, 1, 1,
-1.38015, 1.197892, -0.9580724, 0, 0, 0, 1, 1,
-1.3714, -0.07047671, -2.243598, 0, 0, 0, 1, 1,
-1.367432, -0.4003611, -3.830612, 0, 0, 0, 1, 1,
-1.365408, -0.08020024, -1.607379, 0, 0, 0, 1, 1,
-1.353184, 2.171993, 0.9652118, 0, 0, 0, 1, 1,
-1.349973, -0.6344649, -0.2931209, 1, 1, 1, 1, 1,
-1.341703, -0.4891697, -4.173442, 1, 1, 1, 1, 1,
-1.341187, -1.235546, -3.023039, 1, 1, 1, 1, 1,
-1.340443, 0.2100839, -3.152856, 1, 1, 1, 1, 1,
-1.339456, 0.3095118, -2.84473, 1, 1, 1, 1, 1,
-1.339441, 1.321265, -0.447916, 1, 1, 1, 1, 1,
-1.337861, -1.147599, -0.6156918, 1, 1, 1, 1, 1,
-1.337445, 1.465185, 0.02155764, 1, 1, 1, 1, 1,
-1.336173, 1.116692, 0.5771336, 1, 1, 1, 1, 1,
-1.335533, -1.505666, -1.765282, 1, 1, 1, 1, 1,
-1.324534, 0.8592965, -1.727051, 1, 1, 1, 1, 1,
-1.307639, 2.188641, -0.6242293, 1, 1, 1, 1, 1,
-1.307226, 1.19851, 0.350198, 1, 1, 1, 1, 1,
-1.301298, 0.6325549, 0.3802237, 1, 1, 1, 1, 1,
-1.295673, 0.479335, 0.8916018, 1, 1, 1, 1, 1,
-1.282222, 0.2144815, -0.6323346, 0, 0, 1, 1, 1,
-1.272573, -0.1255306, -2.117389, 1, 0, 0, 1, 1,
-1.269374, 0.1145598, -0.5248156, 1, 0, 0, 1, 1,
-1.267215, -0.2216479, -0.8311041, 1, 0, 0, 1, 1,
-1.266731, 0.4128952, 0.7737156, 1, 0, 0, 1, 1,
-1.262423, -0.08031102, -1.014799, 1, 0, 0, 1, 1,
-1.260307, 0.2175756, -3.078137, 0, 0, 0, 1, 1,
-1.254682, -0.1927839, -0.8511024, 0, 0, 0, 1, 1,
-1.251284, -0.03166838, -0.9177126, 0, 0, 0, 1, 1,
-1.247595, -0.1205321, -2.036583, 0, 0, 0, 1, 1,
-1.236183, -0.7561349, -3.240867, 0, 0, 0, 1, 1,
-1.231588, -1.563278, -2.706816, 0, 0, 0, 1, 1,
-1.225776, -0.3971001, 0.01313534, 0, 0, 0, 1, 1,
-1.223068, -0.8381608, -2.561603, 1, 1, 1, 1, 1,
-1.215564, -0.285697, -2.131579, 1, 1, 1, 1, 1,
-1.209987, 0.8421735, -1.320134, 1, 1, 1, 1, 1,
-1.202296, 2.10858, -2.107252, 1, 1, 1, 1, 1,
-1.189834, 0.2089485, -0.1118008, 1, 1, 1, 1, 1,
-1.175041, 1.705967, 0.1899615, 1, 1, 1, 1, 1,
-1.173317, 0.5261587, -2.128417, 1, 1, 1, 1, 1,
-1.167324, 0.9956877, -2.170171, 1, 1, 1, 1, 1,
-1.164454, 2.766095, -0.5201547, 1, 1, 1, 1, 1,
-1.157475, 1.427613, 0.6521901, 1, 1, 1, 1, 1,
-1.15445, -2.379113, -1.944347, 1, 1, 1, 1, 1,
-1.146911, -1.36065, -2.491894, 1, 1, 1, 1, 1,
-1.146515, 1.201104, -2.895022, 1, 1, 1, 1, 1,
-1.139059, -0.3326424, -1.018895, 1, 1, 1, 1, 1,
-1.135571, 0.7973972, -1.205177, 1, 1, 1, 1, 1,
-1.128449, -0.8423234, -1.365225, 0, 0, 1, 1, 1,
-1.124473, 1.107643, -0.3675322, 1, 0, 0, 1, 1,
-1.124092, -0.6426542, -1.856175, 1, 0, 0, 1, 1,
-1.123856, 0.4589966, 0.5389537, 1, 0, 0, 1, 1,
-1.113998, -1.537865, -2.579347, 1, 0, 0, 1, 1,
-1.113565, 2.303055, 0.5242274, 1, 0, 0, 1, 1,
-1.10858, 0.3271971, -2.383849, 0, 0, 0, 1, 1,
-1.107231, 0.9605023, -0.3173247, 0, 0, 0, 1, 1,
-1.102281, 0.2718267, -0.700767, 0, 0, 0, 1, 1,
-1.096365, 1.662765, -0.8768657, 0, 0, 0, 1, 1,
-1.095036, 0.1152538, 0.7963949, 0, 0, 0, 1, 1,
-1.087733, 0.9390447, -0.5392132, 0, 0, 0, 1, 1,
-1.08712, -0.2714964, -1.396939, 0, 0, 0, 1, 1,
-1.072959, 1.221584, -1.323351, 1, 1, 1, 1, 1,
-1.070904, 0.2928212, -0.9855909, 1, 1, 1, 1, 1,
-1.070218, -1.589695, -1.910195, 1, 1, 1, 1, 1,
-1.069057, -0.8268125, -3.397299, 1, 1, 1, 1, 1,
-1.061523, 0.4972923, 0.1529311, 1, 1, 1, 1, 1,
-1.060844, -0.9164537, -2.613485, 1, 1, 1, 1, 1,
-1.055644, -1.374638, -2.886075, 1, 1, 1, 1, 1,
-1.054395, 0.03169351, -5.238377, 1, 1, 1, 1, 1,
-1.042958, -1.027251, -1.755995, 1, 1, 1, 1, 1,
-1.041814, -0.8263918, -1.228102, 1, 1, 1, 1, 1,
-1.041318, -0.9379066, -1.051102, 1, 1, 1, 1, 1,
-1.039266, -1.254018, -2.77125, 1, 1, 1, 1, 1,
-1.035334, -2.484732, -4.36928, 1, 1, 1, 1, 1,
-1.034087, -0.5206097, -0.8644333, 1, 1, 1, 1, 1,
-1.025197, -1.054103, -3.329355, 1, 1, 1, 1, 1,
-1.020211, -0.5816419, -1.057772, 0, 0, 1, 1, 1,
-1.016891, 1.184076, -1.483524, 1, 0, 0, 1, 1,
-1.010062, -0.6836443, -2.281831, 1, 0, 0, 1, 1,
-1.003899, -1.64194, -4.063743, 1, 0, 0, 1, 1,
-0.9970694, -1.514545, -2.629735, 1, 0, 0, 1, 1,
-0.996379, 0.01564721, -0.9802095, 1, 0, 0, 1, 1,
-0.994704, 1.2778, -1.68116, 0, 0, 0, 1, 1,
-0.9942402, -1.046343, -3.886675, 0, 0, 0, 1, 1,
-0.9900265, -0.4172057, -2.128788, 0, 0, 0, 1, 1,
-0.9892066, -1.008698, -3.153786, 0, 0, 0, 1, 1,
-0.9887339, -0.8213863, -2.858028, 0, 0, 0, 1, 1,
-0.9880843, -1.650099, -1.852615, 0, 0, 0, 1, 1,
-0.9784976, -0.8054317, -2.868185, 0, 0, 0, 1, 1,
-0.9771206, 2.344653, -0.3591903, 1, 1, 1, 1, 1,
-0.9736393, 0.3370943, -1.057409, 1, 1, 1, 1, 1,
-0.9705917, -1.823107, -1.833001, 1, 1, 1, 1, 1,
-0.9699055, 0.2061801, -2.191584, 1, 1, 1, 1, 1,
-0.9636312, -0.2651684, -3.825513, 1, 1, 1, 1, 1,
-0.9627228, -1.037941, -2.264174, 1, 1, 1, 1, 1,
-0.9604185, 0.130983, -1.779873, 1, 1, 1, 1, 1,
-0.9593332, -0.6457736, -2.982732, 1, 1, 1, 1, 1,
-0.9531322, -0.6076702, -2.186951, 1, 1, 1, 1, 1,
-0.9522682, -0.9474345, -1.574017, 1, 1, 1, 1, 1,
-0.9518042, -0.2595437, -3.574291, 1, 1, 1, 1, 1,
-0.9458574, -0.3974253, -3.02785, 1, 1, 1, 1, 1,
-0.9408966, -0.8144232, -1.609146, 1, 1, 1, 1, 1,
-0.9364388, 0.6441568, -2.762542, 1, 1, 1, 1, 1,
-0.9245458, 0.1702493, -1.223825, 1, 1, 1, 1, 1,
-0.9230303, -1.769358, -4.309888, 0, 0, 1, 1, 1,
-0.9227542, -0.8212236, -1.837351, 1, 0, 0, 1, 1,
-0.9212369, -0.1717875, -1.756896, 1, 0, 0, 1, 1,
-0.9100783, 0.7342309, -2.186211, 1, 0, 0, 1, 1,
-0.9098145, 1.156019, -0.4228773, 1, 0, 0, 1, 1,
-0.9033154, 0.04953931, -2.302056, 1, 0, 0, 1, 1,
-0.9014456, 0.9231163, -1.967866, 0, 0, 0, 1, 1,
-0.8940835, 0.1700489, -0.8194763, 0, 0, 0, 1, 1,
-0.89248, -1.27804, -3.03591, 0, 0, 0, 1, 1,
-0.8832158, -0.1982245, -0.2636967, 0, 0, 0, 1, 1,
-0.8811841, -0.445622, -3.862641, 0, 0, 0, 1, 1,
-0.8783908, 0.8979468, -1.547403, 0, 0, 0, 1, 1,
-0.8781516, 0.6418675, -0.4009995, 0, 0, 0, 1, 1,
-0.8772598, -0.42582, -2.749787, 1, 1, 1, 1, 1,
-0.8686805, 0.3062231, -3.144562, 1, 1, 1, 1, 1,
-0.861913, -0.7927075, -3.597807, 1, 1, 1, 1, 1,
-0.8561941, 1.669674, 0.2055705, 1, 1, 1, 1, 1,
-0.8544772, -0.4863973, -1.945288, 1, 1, 1, 1, 1,
-0.8446303, 2.303988, -0.1201753, 1, 1, 1, 1, 1,
-0.840435, 2.023487, 1.711334, 1, 1, 1, 1, 1,
-0.8399045, -0.2322907, -1.530496, 1, 1, 1, 1, 1,
-0.8341198, -0.3159738, -0.8195928, 1, 1, 1, 1, 1,
-0.8317986, -0.958823, -3.063529, 1, 1, 1, 1, 1,
-0.8310301, -0.1957639, -2.241526, 1, 1, 1, 1, 1,
-0.8240365, 0.0862329, -2.744394, 1, 1, 1, 1, 1,
-0.8045794, 1.113052, -1.392503, 1, 1, 1, 1, 1,
-0.8039219, -1.456299, -2.944348, 1, 1, 1, 1, 1,
-0.7968894, 0.2112332, -1.356932, 1, 1, 1, 1, 1,
-0.7958196, 1.042938, 0.4063042, 0, 0, 1, 1, 1,
-0.7954236, 0.633322, 0.3769376, 1, 0, 0, 1, 1,
-0.7847632, 1.578919, -0.2522263, 1, 0, 0, 1, 1,
-0.7803178, 0.0457513, -1.99464, 1, 0, 0, 1, 1,
-0.7790527, -0.8949654, -4.527133, 1, 0, 0, 1, 1,
-0.778203, 1.387247, -1.035909, 1, 0, 0, 1, 1,
-0.7747027, 0.937943, -0.8842862, 0, 0, 0, 1, 1,
-0.7734863, -1.596324, -3.355792, 0, 0, 0, 1, 1,
-0.7715279, 0.5538327, -1.604439, 0, 0, 0, 1, 1,
-0.7701685, 0.2914484, -1.191534, 0, 0, 0, 1, 1,
-0.767324, -0.07692542, -0.9934036, 0, 0, 0, 1, 1,
-0.7670245, -0.0958662, -1.167484, 0, 0, 0, 1, 1,
-0.763715, -0.2922477, -2.463608, 0, 0, 0, 1, 1,
-0.7611464, 0.483424, -1.511184, 1, 1, 1, 1, 1,
-0.7591788, 0.2732152, -2.26869, 1, 1, 1, 1, 1,
-0.7527984, -0.04369769, -2.927488, 1, 1, 1, 1, 1,
-0.750571, -0.2041513, -1.901591, 1, 1, 1, 1, 1,
-0.749653, -1.124286, -0.009093713, 1, 1, 1, 1, 1,
-0.7482963, -0.8508115, -2.851856, 1, 1, 1, 1, 1,
-0.743426, 1.074564, -1.325149, 1, 1, 1, 1, 1,
-0.7387932, -0.5712934, -1.969537, 1, 1, 1, 1, 1,
-0.7362432, 0.5163868, -1.508025, 1, 1, 1, 1, 1,
-0.7362394, 2.72707, 1.277995, 1, 1, 1, 1, 1,
-0.735826, 0.8035407, -2.443165, 1, 1, 1, 1, 1,
-0.7306569, -1.743549, -4.463147, 1, 1, 1, 1, 1,
-0.7282409, 0.7115046, -0.9495528, 1, 1, 1, 1, 1,
-0.7281941, -1.173078, -1.470281, 1, 1, 1, 1, 1,
-0.7268328, 0.9430277, -1.25373, 1, 1, 1, 1, 1,
-0.7258716, -0.6057566, -2.524481, 0, 0, 1, 1, 1,
-0.7244418, -0.2932351, -2.371471, 1, 0, 0, 1, 1,
-0.7208057, 0.720525, 0.7468786, 1, 0, 0, 1, 1,
-0.7199586, -0.7949714, -1.535354, 1, 0, 0, 1, 1,
-0.7084325, 0.03196079, -1.039771, 1, 0, 0, 1, 1,
-0.7073218, 0.8857222, -0.8749567, 1, 0, 0, 1, 1,
-0.7050591, -0.48968, -1.389597, 0, 0, 0, 1, 1,
-0.7011781, -1.026363, -1.055803, 0, 0, 0, 1, 1,
-0.6987531, 0.04200288, -0.6824509, 0, 0, 0, 1, 1,
-0.6962801, 0.7358131, -1.743963, 0, 0, 0, 1, 1,
-0.6923792, 1.305671, -0.5603309, 0, 0, 0, 1, 1,
-0.6922192, 0.7717081, 0.7349444, 0, 0, 0, 1, 1,
-0.6920421, 0.7572207, -1.183966, 0, 0, 0, 1, 1,
-0.6892139, 1.72634, 0.955282, 1, 1, 1, 1, 1,
-0.6797956, 1.747218, -0.07277807, 1, 1, 1, 1, 1,
-0.6779405, 0.6728784, -1.89152, 1, 1, 1, 1, 1,
-0.6715638, -0.452366, -3.36508, 1, 1, 1, 1, 1,
-0.6614763, -0.7882989, -2.693115, 1, 1, 1, 1, 1,
-0.6575951, 2.394866, -0.196641, 1, 1, 1, 1, 1,
-0.6493187, -1.392176, -2.551504, 1, 1, 1, 1, 1,
-0.6469842, -1.113275, -4.210362, 1, 1, 1, 1, 1,
-0.6430787, -0.738275, -4.165804, 1, 1, 1, 1, 1,
-0.6430321, 0.739399, -2.021137, 1, 1, 1, 1, 1,
-0.6414717, 0.868307, 0.6824988, 1, 1, 1, 1, 1,
-0.635181, -1.336256, -2.963979, 1, 1, 1, 1, 1,
-0.6321715, -0.1234637, -1.483343, 1, 1, 1, 1, 1,
-0.6289383, 0.8168679, -0.90465, 1, 1, 1, 1, 1,
-0.6219962, -2.299457, -3.395427, 1, 1, 1, 1, 1,
-0.6171558, -0.5532762, -1.622044, 0, 0, 1, 1, 1,
-0.6097319, -0.4004622, -1.465696, 1, 0, 0, 1, 1,
-0.6058289, -1.95047, -3.085365, 1, 0, 0, 1, 1,
-0.6035883, 0.7414663, -1.420554, 1, 0, 0, 1, 1,
-0.6022084, 1.137955, -1.544742, 1, 0, 0, 1, 1,
-0.6012188, -0.6908917, -2.013224, 1, 0, 0, 1, 1,
-0.6000234, -1.736622, -4.901125, 0, 0, 0, 1, 1,
-0.599788, -0.2371707, -0.5660192, 0, 0, 0, 1, 1,
-0.5937752, 1.566138, 0.6133884, 0, 0, 0, 1, 1,
-0.5897148, 0.8247762, 0.9081731, 0, 0, 0, 1, 1,
-0.5867087, 0.03353327, -1.373948, 0, 0, 0, 1, 1,
-0.5856138, 2.034001, -0.4901289, 0, 0, 0, 1, 1,
-0.5814071, -0.9238047, -4.239564, 0, 0, 0, 1, 1,
-0.5813013, -0.6756805, -3.192034, 1, 1, 1, 1, 1,
-0.5798656, 0.08572003, -1.694719, 1, 1, 1, 1, 1,
-0.5786427, -0.4566435, -2.611602, 1, 1, 1, 1, 1,
-0.5733625, -0.5255746, -3.808765, 1, 1, 1, 1, 1,
-0.5727906, 0.7868551, -2.403808, 1, 1, 1, 1, 1,
-0.5722169, -0.2780102, -1.846566, 1, 1, 1, 1, 1,
-0.5716056, -0.9143381, -4.724385, 1, 1, 1, 1, 1,
-0.5685038, 2.001604, 1.738593, 1, 1, 1, 1, 1,
-0.5680652, -1.104868, -3.178675, 1, 1, 1, 1, 1,
-0.5677002, -1.10296, -2.142513, 1, 1, 1, 1, 1,
-0.5624024, 0.7510991, -1.654159, 1, 1, 1, 1, 1,
-0.5568131, 0.2484442, -1.463854, 1, 1, 1, 1, 1,
-0.5549145, -0.6061547, -1.898577, 1, 1, 1, 1, 1,
-0.5522076, -0.1579774, -2.178361, 1, 1, 1, 1, 1,
-0.5490599, -1.426069, -2.35543, 1, 1, 1, 1, 1,
-0.5420856, -1.713742, -3.290258, 0, 0, 1, 1, 1,
-0.5388461, -0.4721466, -2.864314, 1, 0, 0, 1, 1,
-0.53859, 0.004048567, -0.4036914, 1, 0, 0, 1, 1,
-0.5374144, 1.134113, -1.534531, 1, 0, 0, 1, 1,
-0.5368952, -1.090431, -2.296877, 1, 0, 0, 1, 1,
-0.53277, -1.583009, -4.184932, 1, 0, 0, 1, 1,
-0.5327597, 1.97426, -1.176607, 0, 0, 0, 1, 1,
-0.5259427, -0.7710497, -1.498722, 0, 0, 0, 1, 1,
-0.5210677, -0.2936054, -1.583042, 0, 0, 0, 1, 1,
-0.512432, 1.764124, -1.800057, 0, 0, 0, 1, 1,
-0.5120342, -0.1330967, -1.537843, 0, 0, 0, 1, 1,
-0.5078186, 0.7428335, 0.412677, 0, 0, 0, 1, 1,
-0.5076771, 0.2051513, -2.705687, 0, 0, 0, 1, 1,
-0.5075943, 1.15734, -0.2596368, 1, 1, 1, 1, 1,
-0.506968, 0.4975704, -0.3760818, 1, 1, 1, 1, 1,
-0.5065142, 2.089935, -0.03097486, 1, 1, 1, 1, 1,
-0.5057933, 1.637092, 0.7118647, 1, 1, 1, 1, 1,
-0.5045727, 0.5944138, -0.5257055, 1, 1, 1, 1, 1,
-0.5022144, -1.817898, -2.996085, 1, 1, 1, 1, 1,
-0.4995504, 0.8555092, 0.205609, 1, 1, 1, 1, 1,
-0.4967782, 1.649665, -1.344556, 1, 1, 1, 1, 1,
-0.496536, -0.48586, -1.15842, 1, 1, 1, 1, 1,
-0.4936838, -0.4288471, -1.791812, 1, 1, 1, 1, 1,
-0.491634, 1.564353, 2.361476, 1, 1, 1, 1, 1,
-0.4897958, -0.2482316, -0.9045976, 1, 1, 1, 1, 1,
-0.4883301, -0.4509581, -2.911779, 1, 1, 1, 1, 1,
-0.4870971, -2.303742, -1.884519, 1, 1, 1, 1, 1,
-0.4853276, -2.364068, -3.672374, 1, 1, 1, 1, 1,
-0.4807021, 0.2239032, -0.9630662, 0, 0, 1, 1, 1,
-0.4706832, 0.07532462, -3.103123, 1, 0, 0, 1, 1,
-0.4692134, 1.50713, 2.661181, 1, 0, 0, 1, 1,
-0.4646987, 0.7350943, -0.6888503, 1, 0, 0, 1, 1,
-0.4577717, 1.000304, -1.869759, 1, 0, 0, 1, 1,
-0.4572906, -2.34228, -2.679283, 1, 0, 0, 1, 1,
-0.4560994, 0.2803173, -2.496061, 0, 0, 0, 1, 1,
-0.4549516, -0.786976, -2.400919, 0, 0, 0, 1, 1,
-0.4478769, -0.2563305, -3.491309, 0, 0, 0, 1, 1,
-0.4447765, 1.145382, -1.263214, 0, 0, 0, 1, 1,
-0.444483, -0.5691558, -4.160626, 0, 0, 0, 1, 1,
-0.4440717, -1.887435, -2.955539, 0, 0, 0, 1, 1,
-0.4427186, -1.118753, -1.308173, 0, 0, 0, 1, 1,
-0.4416169, 0.4918098, -1.682883, 1, 1, 1, 1, 1,
-0.4385335, -1.385114, -2.545356, 1, 1, 1, 1, 1,
-0.4344363, 1.372888, -0.2779396, 1, 1, 1, 1, 1,
-0.4306911, 0.4249248, -1.69391, 1, 1, 1, 1, 1,
-0.4299303, 0.9051653, 0.4384305, 1, 1, 1, 1, 1,
-0.4293652, 0.6886005, -0.5463613, 1, 1, 1, 1, 1,
-0.4286508, 0.746721, 0.2815577, 1, 1, 1, 1, 1,
-0.4271062, 0.553333, -0.1340759, 1, 1, 1, 1, 1,
-0.4246541, 0.03215171, -2.017588, 1, 1, 1, 1, 1,
-0.423609, 0.3582223, -0.2207681, 1, 1, 1, 1, 1,
-0.4181681, -0.2812256, -1.494877, 1, 1, 1, 1, 1,
-0.412755, 0.2598694, -1.509542, 1, 1, 1, 1, 1,
-0.4096453, 0.9479067, -0.5008544, 1, 1, 1, 1, 1,
-0.409587, -2.176739, -2.99876, 1, 1, 1, 1, 1,
-0.4074906, 0.008388562, -1.7746, 1, 1, 1, 1, 1,
-0.4067748, 0.6286099, -1.016594, 0, 0, 1, 1, 1,
-0.3962898, -0.5288969, -3.168655, 1, 0, 0, 1, 1,
-0.396155, 0.3120232, -1.272159, 1, 0, 0, 1, 1,
-0.3932645, 0.4983146, -1.459679, 1, 0, 0, 1, 1,
-0.3931031, 1.430992, -0.1113744, 1, 0, 0, 1, 1,
-0.391894, -0.1939565, -2.214309, 1, 0, 0, 1, 1,
-0.3918398, -1.435251, -1.669842, 0, 0, 0, 1, 1,
-0.3898222, 1.20929, 0.150317, 0, 0, 0, 1, 1,
-0.3895369, 0.908232, 0.6496518, 0, 0, 0, 1, 1,
-0.3884128, 0.6567104, -0.09965894, 0, 0, 0, 1, 1,
-0.3880897, -1.48706, -2.10534, 0, 0, 0, 1, 1,
-0.3847246, 1.091224, -0.9787138, 0, 0, 0, 1, 1,
-0.3806174, -1.317466, -1.874826, 0, 0, 0, 1, 1,
-0.3723995, -1.30295, -3.072538, 1, 1, 1, 1, 1,
-0.3713366, -1.116334, -4.081133, 1, 1, 1, 1, 1,
-0.3699062, -0.50456, -2.030452, 1, 1, 1, 1, 1,
-0.3678557, -0.5670455, -1.939072, 1, 1, 1, 1, 1,
-0.3634579, -0.7863788, -1.053287, 1, 1, 1, 1, 1,
-0.3627485, -0.6004783, -4.593017, 1, 1, 1, 1, 1,
-0.3576303, 1.926116, -1.454305, 1, 1, 1, 1, 1,
-0.3560737, -0.03490454, -1.951544, 1, 1, 1, 1, 1,
-0.3532743, 0.7039425, -0.06619214, 1, 1, 1, 1, 1,
-0.351247, 0.6756141, -0.7589228, 1, 1, 1, 1, 1,
-0.3502304, 0.1285303, -0.8712066, 1, 1, 1, 1, 1,
-0.3493755, -1.467319, -2.09166, 1, 1, 1, 1, 1,
-0.3484683, 0.6851972, -0.6650991, 1, 1, 1, 1, 1,
-0.3423714, -0.2994381, -1.742273, 1, 1, 1, 1, 1,
-0.340977, -1.554797, -2.789787, 1, 1, 1, 1, 1,
-0.3381771, 0.9661413, -1.629037, 0, 0, 1, 1, 1,
-0.3378491, 1.63875, -1.450545, 1, 0, 0, 1, 1,
-0.3344273, -0.1047284, -0.6679212, 1, 0, 0, 1, 1,
-0.3342827, -1.173997, -3.089677, 1, 0, 0, 1, 1,
-0.3331731, -0.6817147, -3.038094, 1, 0, 0, 1, 1,
-0.3294379, -2.102028, -3.540373, 1, 0, 0, 1, 1,
-0.3271846, -0.5419894, -3.289881, 0, 0, 0, 1, 1,
-0.3264591, -0.2729484, -1.937241, 0, 0, 0, 1, 1,
-0.3248978, 1.003394, -2.463861, 0, 0, 0, 1, 1,
-0.3238499, 1.513548, 0.4830787, 0, 0, 0, 1, 1,
-0.3218166, -1.838635, -1.329524, 0, 0, 0, 1, 1,
-0.3196544, 0.1267233, -1.967076, 0, 0, 0, 1, 1,
-0.3164956, -0.04408267, -1.769122, 0, 0, 0, 1, 1,
-0.3157207, 0.03984649, -2.32436, 1, 1, 1, 1, 1,
-0.3125975, -1.452946, -4.980706, 1, 1, 1, 1, 1,
-0.2949346, -0.8509541, -0.9320228, 1, 1, 1, 1, 1,
-0.2903326, -0.6058062, -5.01397, 1, 1, 1, 1, 1,
-0.2895553, 1.078889, -0.501106, 1, 1, 1, 1, 1,
-0.2889321, -0.5276707, -3.067597, 1, 1, 1, 1, 1,
-0.287793, 0.5390182, -1.569281, 1, 1, 1, 1, 1,
-0.2789582, 1.901676, 0.4981551, 1, 1, 1, 1, 1,
-0.2783907, 1.529478, 0.6653737, 1, 1, 1, 1, 1,
-0.2775223, -1.037379, -2.427571, 1, 1, 1, 1, 1,
-0.2749834, 0.7785815, -0.8727485, 1, 1, 1, 1, 1,
-0.2715183, -0.1526497, -1.919167, 1, 1, 1, 1, 1,
-0.2546852, 0.6492981, -0.1659776, 1, 1, 1, 1, 1,
-0.2536331, -2.350917, -3.512305, 1, 1, 1, 1, 1,
-0.2533143, 0.3643873, 1.079554, 1, 1, 1, 1, 1,
-0.2458532, 0.0416618, -0.9596089, 0, 0, 1, 1, 1,
-0.2426761, -0.8261994, -3.244032, 1, 0, 0, 1, 1,
-0.2307792, -0.5042914, -4.048686, 1, 0, 0, 1, 1,
-0.2259555, 0.3039296, 1.005738, 1, 0, 0, 1, 1,
-0.2238532, 1.069223, -0.3804264, 1, 0, 0, 1, 1,
-0.2225165, -0.218441, -1.68892, 1, 0, 0, 1, 1,
-0.2213006, -0.1964694, -0.681512, 0, 0, 0, 1, 1,
-0.2183802, -1.295683, -3.363358, 0, 0, 0, 1, 1,
-0.2154249, 1.631274, -0.2095096, 0, 0, 0, 1, 1,
-0.2136065, -1.06902, -3.592707, 0, 0, 0, 1, 1,
-0.2107514, 0.5607566, 0.2903459, 0, 0, 0, 1, 1,
-0.2082928, -0.7376246, -3.511315, 0, 0, 0, 1, 1,
-0.2008721, 0.1417114, -1.833227, 0, 0, 0, 1, 1,
-0.2005762, 0.34678, -0.6156027, 1, 1, 1, 1, 1,
-0.2001796, -1.440391, -4.004337, 1, 1, 1, 1, 1,
-0.2001703, 0.3853444, -1.118884, 1, 1, 1, 1, 1,
-0.1965294, 1.464904, -1.17686, 1, 1, 1, 1, 1,
-0.1964533, -1.331293, -3.044169, 1, 1, 1, 1, 1,
-0.1957537, 0.2399666, -0.339339, 1, 1, 1, 1, 1,
-0.1944197, -1.022418, -2.532958, 1, 1, 1, 1, 1,
-0.1895734, -1.469289, -4.015777, 1, 1, 1, 1, 1,
-0.1852742, 1.132702, -1.219467, 1, 1, 1, 1, 1,
-0.1828813, 1.185959, 0.7420521, 1, 1, 1, 1, 1,
-0.1827426, -0.245392, -4.378688, 1, 1, 1, 1, 1,
-0.1811323, 0.7646445, -0.4800764, 1, 1, 1, 1, 1,
-0.1805959, -2.140797, -1.683422, 1, 1, 1, 1, 1,
-0.1782159, 0.1207635, -2.102208, 1, 1, 1, 1, 1,
-0.1775934, -0.5677324, -2.852406, 1, 1, 1, 1, 1,
-0.174613, -0.9690133, -3.44802, 0, 0, 1, 1, 1,
-0.1704949, -0.3257552, -4.14964, 1, 0, 0, 1, 1,
-0.1702866, -2.186997, -1.387702, 1, 0, 0, 1, 1,
-0.1657374, 0.2773207, -2.316638, 1, 0, 0, 1, 1,
-0.1605823, -0.6061202, -2.387848, 1, 0, 0, 1, 1,
-0.1596993, -0.558143, -0.4136654, 1, 0, 0, 1, 1,
-0.1554604, -0.522657, -2.456712, 0, 0, 0, 1, 1,
-0.1470909, 0.007727105, -0.1952429, 0, 0, 0, 1, 1,
-0.1459548, 0.971742, 0.3755859, 0, 0, 0, 1, 1,
-0.1423452, -0.1939496, -1.075779, 0, 0, 0, 1, 1,
-0.1393518, -1.260692, 0.1084661, 0, 0, 0, 1, 1,
-0.1358562, 0.8116341, 0.1938363, 0, 0, 0, 1, 1,
-0.1349848, 0.6346299, -1.133671, 0, 0, 0, 1, 1,
-0.1322836, -0.4526236, -2.996434, 1, 1, 1, 1, 1,
-0.1265687, 0.1463498, 1.415607, 1, 1, 1, 1, 1,
-0.1256255, 0.6863685, -0.2803618, 1, 1, 1, 1, 1,
-0.1236303, 1.049868, 0.9363163, 1, 1, 1, 1, 1,
-0.1195998, -0.7408116, -4.480492, 1, 1, 1, 1, 1,
-0.1192525, 0.719728, -0.01109206, 1, 1, 1, 1, 1,
-0.1170816, 2.112923, -0.4581021, 1, 1, 1, 1, 1,
-0.1164062, -1.466846, -3.458591, 1, 1, 1, 1, 1,
-0.1140279, 0.66065, 0.03512168, 1, 1, 1, 1, 1,
-0.1138579, -0.03917766, -3.05131, 1, 1, 1, 1, 1,
-0.1118822, 1.53511, -2.507354, 1, 1, 1, 1, 1,
-0.1099363, 1.180663, -0.8514026, 1, 1, 1, 1, 1,
-0.1089462, 0.3375849, 1.45939, 1, 1, 1, 1, 1,
-0.1076273, 0.2026552, -1.577091, 1, 1, 1, 1, 1,
-0.09801707, -0.2692347, -3.350208, 1, 1, 1, 1, 1,
-0.09679738, -0.6275769, -2.967591, 0, 0, 1, 1, 1,
-0.09611657, 0.5617504, -0.01269507, 1, 0, 0, 1, 1,
-0.09397318, -4.243088, -3.230314, 1, 0, 0, 1, 1,
-0.08935592, 2.752255, 0.9495571, 1, 0, 0, 1, 1,
-0.08835325, -0.6504823, -2.77226, 1, 0, 0, 1, 1,
-0.08735333, -0.6315927, -1.77248, 1, 0, 0, 1, 1,
-0.08380917, -0.9626083, -1.934964, 0, 0, 0, 1, 1,
-0.08138196, 0.5300419, -0.08254138, 0, 0, 0, 1, 1,
-0.07781377, -0.3223155, -3.498663, 0, 0, 0, 1, 1,
-0.07194324, 0.3562647, -1.488824, 0, 0, 0, 1, 1,
-0.07150256, 0.5909557, -0.4564126, 0, 0, 0, 1, 1,
-0.06511091, -1.370149, -2.648245, 0, 0, 0, 1, 1,
-0.06492712, -0.03311045, -2.08404, 0, 0, 0, 1, 1,
-0.06454054, -0.9929362, -3.726257, 1, 1, 1, 1, 1,
-0.0545779, 0.06259137, -0.9113657, 1, 1, 1, 1, 1,
-0.0500435, 0.09396236, -2.18857, 1, 1, 1, 1, 1,
-0.04906533, 0.7186015, -0.4572226, 1, 1, 1, 1, 1,
-0.04747466, 0.3992897, -0.7555656, 1, 1, 1, 1, 1,
-0.03893245, -0.9799961, -3.123621, 1, 1, 1, 1, 1,
-0.0370585, -0.5323882, -3.092534, 1, 1, 1, 1, 1,
-0.03498659, 3.219268, -0.7716072, 1, 1, 1, 1, 1,
-0.03423049, -1.532798, -2.386888, 1, 1, 1, 1, 1,
-0.033379, 1.223117, -0.3821923, 1, 1, 1, 1, 1,
-0.03256124, -3.857279, -4.245929, 1, 1, 1, 1, 1,
-0.03172987, 0.1958022, -0.1558088, 1, 1, 1, 1, 1,
-0.03120989, -0.03610877, -1.750193, 1, 1, 1, 1, 1,
-0.03062129, 1.403195, -0.7405054, 1, 1, 1, 1, 1,
-0.02346732, 1.581029, 1.460605, 1, 1, 1, 1, 1,
-0.02276642, 0.5014741, -0.7636257, 0, 0, 1, 1, 1,
-0.01855829, 0.04700428, 0.03915558, 1, 0, 0, 1, 1,
-0.01644104, 0.1905225, 0.2163632, 1, 0, 0, 1, 1,
-0.007514089, -0.5750303, -1.80483, 1, 0, 0, 1, 1,
-0.00708675, 0.6948018, 0.1542141, 1, 0, 0, 1, 1,
-0.006888356, -0.3109891, -2.238209, 1, 0, 0, 1, 1,
-0.006234393, 0.9727242, 0.5517404, 0, 0, 0, 1, 1,
-0.003297715, -0.05626111, -2.801354, 0, 0, 0, 1, 1,
0.001887281, 0.6681493, -0.8159471, 0, 0, 0, 1, 1,
0.004915724, 2.353765, 0.09067249, 0, 0, 0, 1, 1,
0.005752013, 1.016409, 0.8161486, 0, 0, 0, 1, 1,
0.007263889, -0.4313847, 2.823718, 0, 0, 0, 1, 1,
0.009366849, 0.6091095, -0.3557431, 0, 0, 0, 1, 1,
0.009957718, -0.3797948, 4.430349, 1, 1, 1, 1, 1,
0.01210025, 0.4900837, -1.996877, 1, 1, 1, 1, 1,
0.0134587, 0.6357733, -0.7115792, 1, 1, 1, 1, 1,
0.01473907, 0.3602403, 1.45541, 1, 1, 1, 1, 1,
0.01590835, 0.4096252, -0.9051206, 1, 1, 1, 1, 1,
0.01806295, 0.2127088, 0.4974416, 1, 1, 1, 1, 1,
0.02177467, 1.009665, -0.1537015, 1, 1, 1, 1, 1,
0.03065036, -1.456615, 4.815527, 1, 1, 1, 1, 1,
0.03848275, 0.5858525, 0.9705918, 1, 1, 1, 1, 1,
0.04090017, -2.074016, 3.641957, 1, 1, 1, 1, 1,
0.04195805, 0.616949, 0.519991, 1, 1, 1, 1, 1,
0.0463656, 0.7943383, 0.2111468, 1, 1, 1, 1, 1,
0.04721668, -1.919857, 3.394348, 1, 1, 1, 1, 1,
0.0475458, -0.3770043, 2.733947, 1, 1, 1, 1, 1,
0.04802765, 0.4636137, -0.4831776, 1, 1, 1, 1, 1,
0.05343182, -1.541366, 2.190027, 0, 0, 1, 1, 1,
0.05540026, -0.9993299, 2.889531, 1, 0, 0, 1, 1,
0.06105796, -0.2343092, 2.134813, 1, 0, 0, 1, 1,
0.0664112, 0.3413627, -0.1937537, 1, 0, 0, 1, 1,
0.08230555, 1.367249, -0.6087325, 1, 0, 0, 1, 1,
0.08380652, 1.579866, 0.2075506, 1, 0, 0, 1, 1,
0.08532682, 2.764883, 1.697956, 0, 0, 0, 1, 1,
0.08880224, -0.7825457, 2.459386, 0, 0, 0, 1, 1,
0.08953814, 0.4733697, -1.025439, 0, 0, 0, 1, 1,
0.0899343, -0.5623167, 2.489201, 0, 0, 0, 1, 1,
0.09164724, 0.3829727, -0.3827801, 0, 0, 0, 1, 1,
0.09476256, -0.1020774, 3.539717, 0, 0, 0, 1, 1,
0.09676555, -1.234752, 1.850318, 0, 0, 0, 1, 1,
0.1006016, 0.4405498, -1.632396, 1, 1, 1, 1, 1,
0.1025525, -1.134291, 2.269144, 1, 1, 1, 1, 1,
0.1079505, -2.780579, 0.797391, 1, 1, 1, 1, 1,
0.1085773, 1.061057, 0.9873341, 1, 1, 1, 1, 1,
0.1088689, 0.8863339, 0.544189, 1, 1, 1, 1, 1,
0.1120643, 0.8031681, 0.4656057, 1, 1, 1, 1, 1,
0.1136342, -1.817965, 3.864261, 1, 1, 1, 1, 1,
0.1176048, 0.7191164, 0.2993365, 1, 1, 1, 1, 1,
0.1233734, 0.27762, 1.600283, 1, 1, 1, 1, 1,
0.1242017, 0.7770485, 0.9043305, 1, 1, 1, 1, 1,
0.1264081, 0.1203581, 1.405813, 1, 1, 1, 1, 1,
0.1272315, -2.19996, 1.959079, 1, 1, 1, 1, 1,
0.1293094, -1.73368, 2.148841, 1, 1, 1, 1, 1,
0.1340519, 1.577071, -0.5048316, 1, 1, 1, 1, 1,
0.1342463, -0.9434451, 1.668134, 1, 1, 1, 1, 1,
0.1359106, 0.1111962, 0.02427479, 0, 0, 1, 1, 1,
0.1391392, -0.4564589, 3.445714, 1, 0, 0, 1, 1,
0.1394693, 1.923059, 0.9503641, 1, 0, 0, 1, 1,
0.1421604, -0.08057525, 4.038397, 1, 0, 0, 1, 1,
0.1421697, 0.04404136, 1.390769, 1, 0, 0, 1, 1,
0.1441851, 0.739804, 2.038319, 1, 0, 0, 1, 1,
0.144771, 1.686925, 0.09754378, 0, 0, 0, 1, 1,
0.145981, -1.903619, 1.862798, 0, 0, 0, 1, 1,
0.1470013, -1.062621, 3.164271, 0, 0, 0, 1, 1,
0.1524852, -1.944163, 2.197749, 0, 0, 0, 1, 1,
0.153077, -0.4542088, 4.297694, 0, 0, 0, 1, 1,
0.1532318, -1.224565, 2.310216, 0, 0, 0, 1, 1,
0.1537037, -0.7664368, 4.140875, 0, 0, 0, 1, 1,
0.1559426, -1.156628, 4.040595, 1, 1, 1, 1, 1,
0.1606219, 0.7335406, 1.718568, 1, 1, 1, 1, 1,
0.1630141, 0.8916867, 0.2773899, 1, 1, 1, 1, 1,
0.1696356, -0.3386598, 2.481222, 1, 1, 1, 1, 1,
0.1717976, 0.925256, 1.096913, 1, 1, 1, 1, 1,
0.1721845, 1.829358, 1.165454, 1, 1, 1, 1, 1,
0.172482, 0.9634754, 1.897096, 1, 1, 1, 1, 1,
0.176851, -0.8839252, 2.530551, 1, 1, 1, 1, 1,
0.1797243, 0.694742, -0.4373659, 1, 1, 1, 1, 1,
0.1885505, 1.921994, 1.140051, 1, 1, 1, 1, 1,
0.1900019, -0.6880383, 3.922371, 1, 1, 1, 1, 1,
0.1938135, -0.2305911, 2.230292, 1, 1, 1, 1, 1,
0.1958192, 1.377183, 0.7376838, 1, 1, 1, 1, 1,
0.2001612, 0.9757883, -2.363654, 1, 1, 1, 1, 1,
0.200218, -0.1698552, 1.904941, 1, 1, 1, 1, 1,
0.2026191, 0.6202601, 0.8554363, 0, 0, 1, 1, 1,
0.2061601, 0.1317843, 1.010712, 1, 0, 0, 1, 1,
0.2094048, 0.8132613, 0.3031644, 1, 0, 0, 1, 1,
0.210514, 1.385369, 0.4738116, 1, 0, 0, 1, 1,
0.2139086, 1.49726, 0.0196869, 1, 0, 0, 1, 1,
0.2153359, -0.5123859, 3.126085, 1, 0, 0, 1, 1,
0.2171864, -1.705888, 3.3719, 0, 0, 0, 1, 1,
0.2224691, 0.3525626, 0.6196085, 0, 0, 0, 1, 1,
0.2225857, 0.9420529, -1.273783, 0, 0, 0, 1, 1,
0.2266392, -1.90315, 3.023704, 0, 0, 0, 1, 1,
0.2350509, -0.9776992, 2.452061, 0, 0, 0, 1, 1,
0.2355773, -1.546683, 2.330434, 0, 0, 0, 1, 1,
0.236515, -0.9488816, 2.468573, 0, 0, 0, 1, 1,
0.2375177, 0.9280913, -0.1678666, 1, 1, 1, 1, 1,
0.2375916, 1.067618, 0.2821393, 1, 1, 1, 1, 1,
0.2393424, 1.020002, -0.1353634, 1, 1, 1, 1, 1,
0.2431611, 0.2530555, 1.158331, 1, 1, 1, 1, 1,
0.2569396, 0.03529533, 1.348465, 1, 1, 1, 1, 1,
0.2633062, -0.1302135, 4.061087, 1, 1, 1, 1, 1,
0.2659684, 0.4983775, 1.372556, 1, 1, 1, 1, 1,
0.2662002, 0.1196118, 2.379463, 1, 1, 1, 1, 1,
0.2667218, -0.3007903, 1.424227, 1, 1, 1, 1, 1,
0.2775571, 1.49641, -1.199302, 1, 1, 1, 1, 1,
0.2793866, -1.010964, 3.476471, 1, 1, 1, 1, 1,
0.2799797, -0.2258418, 2.126007, 1, 1, 1, 1, 1,
0.2811489, 0.2221324, 0.2343387, 1, 1, 1, 1, 1,
0.281855, 0.403725, -0.03420484, 1, 1, 1, 1, 1,
0.2846436, -1.33724, 2.804246, 1, 1, 1, 1, 1,
0.2896861, -0.06879088, 1.028296, 0, 0, 1, 1, 1,
0.2910649, -0.5394761, 1.671568, 1, 0, 0, 1, 1,
0.2945633, 0.01580556, 1.443851, 1, 0, 0, 1, 1,
0.2981184, -0.3700636, 1.292722, 1, 0, 0, 1, 1,
0.303582, 1.047788, -0.0660131, 1, 0, 0, 1, 1,
0.3050558, 0.8315417, 1.110974, 1, 0, 0, 1, 1,
0.3064961, -0.379212, 2.805387, 0, 0, 0, 1, 1,
0.3092594, -1.432483, 1.011014, 0, 0, 0, 1, 1,
0.3126321, -0.2347421, 3.692761, 0, 0, 0, 1, 1,
0.3140206, 0.6976553, -0.2698371, 0, 0, 0, 1, 1,
0.3165127, -0.9411476, 4.336032, 0, 0, 0, 1, 1,
0.321241, -0.1693135, 3.45235, 0, 0, 0, 1, 1,
0.3214859, 0.5955343, -0.6537858, 0, 0, 0, 1, 1,
0.3248509, -1.841383, 1.971072, 1, 1, 1, 1, 1,
0.3287193, -1.969925, 2.671474, 1, 1, 1, 1, 1,
0.328726, -0.1485793, 1.465243, 1, 1, 1, 1, 1,
0.3302775, -2.338073, 2.49171, 1, 1, 1, 1, 1,
0.3305765, -2.059269, 2.664872, 1, 1, 1, 1, 1,
0.3358002, -0.3488289, 2.933575, 1, 1, 1, 1, 1,
0.3390558, -1.075233, 3.734686, 1, 1, 1, 1, 1,
0.3403565, 2.406082, -2.508217, 1, 1, 1, 1, 1,
0.3453749, 1.221951, 1.516398, 1, 1, 1, 1, 1,
0.3464321, 0.0180047, -0.7580439, 1, 1, 1, 1, 1,
0.346765, 0.9798589, 1.088161, 1, 1, 1, 1, 1,
0.3512814, 1.808883, 0.5747016, 1, 1, 1, 1, 1,
0.3543913, -0.3484145, 1.19645, 1, 1, 1, 1, 1,
0.3549053, -1.134646, 4.531765, 1, 1, 1, 1, 1,
0.3568442, 0.6848083, 0.1827654, 1, 1, 1, 1, 1,
0.3584127, -2.414815, 2.623695, 0, 0, 1, 1, 1,
0.3675906, -0.4086674, 2.347724, 1, 0, 0, 1, 1,
0.3705956, 0.160387, -0.4337512, 1, 0, 0, 1, 1,
0.373716, -0.3863556, 2.971181, 1, 0, 0, 1, 1,
0.373826, -0.2338095, 1.54812, 1, 0, 0, 1, 1,
0.3766106, 0.02744024, 1.233409, 1, 0, 0, 1, 1,
0.3775569, -0.1858447, 2.126177, 0, 0, 0, 1, 1,
0.3778876, -0.6343589, 3.84433, 0, 0, 0, 1, 1,
0.3877777, -1.155271, 1.229736, 0, 0, 0, 1, 1,
0.3881466, -1.148011, 4.128822, 0, 0, 0, 1, 1,
0.3945519, 1.19334, 1.884501, 0, 0, 0, 1, 1,
0.396302, -0.04986685, 1.372012, 0, 0, 0, 1, 1,
0.405656, -0.5567241, 2.011793, 0, 0, 0, 1, 1,
0.4061634, 1.184914, -0.04385635, 1, 1, 1, 1, 1,
0.406519, 0.1018677, 0.2384591, 1, 1, 1, 1, 1,
0.4146705, 0.1405231, 1.14468, 1, 1, 1, 1, 1,
0.4160351, 0.05488933, 1.874969, 1, 1, 1, 1, 1,
0.4174793, -0.3260043, 3.622206, 1, 1, 1, 1, 1,
0.4179498, 0.9323065, 0.05332047, 1, 1, 1, 1, 1,
0.4269764, -1.270223, 2.436102, 1, 1, 1, 1, 1,
0.4308085, -1.090461, 2.874949, 1, 1, 1, 1, 1,
0.4311532, 1.368541, 0.5099468, 1, 1, 1, 1, 1,
0.4313414, -0.2712547, 1.674461, 1, 1, 1, 1, 1,
0.434076, -0.1919579, 2.444845, 1, 1, 1, 1, 1,
0.4351377, 0.6808601, 0.5919015, 1, 1, 1, 1, 1,
0.4361979, -3.440897, 5.135515, 1, 1, 1, 1, 1,
0.4375107, -0.4942425, 3.331864, 1, 1, 1, 1, 1,
0.4386885, 0.8578126, -0.6655523, 1, 1, 1, 1, 1,
0.4387612, 1.219635, -0.08369379, 0, 0, 1, 1, 1,
0.4418317, -2.193481, 3.395319, 1, 0, 0, 1, 1,
0.4516566, -1.881238, 6.25149, 1, 0, 0, 1, 1,
0.4523374, 0.4341316, -0.841497, 1, 0, 0, 1, 1,
0.4588789, 2.01469, 0.8613964, 1, 0, 0, 1, 1,
0.459888, -1.937273, 2.240768, 1, 0, 0, 1, 1,
0.4693764, 0.7876556, 1.662875, 0, 0, 0, 1, 1,
0.4785959, 0.4051439, 0.9942525, 0, 0, 0, 1, 1,
0.4813368, 0.1251628, 1.191747, 0, 0, 0, 1, 1,
0.4823371, 0.161328, 1.739637, 0, 0, 0, 1, 1,
0.4869616, 0.5050177, 1.755946, 0, 0, 0, 1, 1,
0.487579, 0.6046863, 0.7260416, 0, 0, 0, 1, 1,
0.4903412, -0.3226981, 1.693954, 0, 0, 0, 1, 1,
0.4919822, 1.101558, 1.054213, 1, 1, 1, 1, 1,
0.4955462, 0.03982228, 1.216185, 1, 1, 1, 1, 1,
0.4965415, -0.9851872, 1.745727, 1, 1, 1, 1, 1,
0.5019975, -1.026393, 2.842825, 1, 1, 1, 1, 1,
0.5063087, 0.05137982, 2.555224, 1, 1, 1, 1, 1,
0.5067813, 0.9243114, 1.646394, 1, 1, 1, 1, 1,
0.5136805, 0.4141941, 0.312984, 1, 1, 1, 1, 1,
0.5166394, -0.7365327, 2.368741, 1, 1, 1, 1, 1,
0.5169891, 0.7816367, 0.2531754, 1, 1, 1, 1, 1,
0.5202596, -1.02277, 4.022835, 1, 1, 1, 1, 1,
0.5203559, 0.2307217, 1.843926, 1, 1, 1, 1, 1,
0.5206223, 0.7995443, 1.240873, 1, 1, 1, 1, 1,
0.5211724, 0.3605168, 2.474309, 1, 1, 1, 1, 1,
0.5241613, -1.047172, 4.431964, 1, 1, 1, 1, 1,
0.525218, 1.631683, -0.6863713, 1, 1, 1, 1, 1,
0.5288933, 0.1668652, 1.8425, 0, 0, 1, 1, 1,
0.5291399, 1.25473, 0.9268056, 1, 0, 0, 1, 1,
0.5305159, -0.4390341, 0.8801879, 1, 0, 0, 1, 1,
0.5311982, 1.97617, 0.1602156, 1, 0, 0, 1, 1,
0.5315598, -0.1497495, 1.133133, 1, 0, 0, 1, 1,
0.532609, 0.09286596, 1.34052, 1, 0, 0, 1, 1,
0.532816, -0.09829626, -0.2038188, 0, 0, 0, 1, 1,
0.5328851, 0.756791, 0.4081633, 0, 0, 0, 1, 1,
0.5443461, 0.7571316, -0.8035684, 0, 0, 0, 1, 1,
0.5465147, 0.1777452, 1.35654, 0, 0, 0, 1, 1,
0.5465772, -0.5575304, 3.152297, 0, 0, 0, 1, 1,
0.5475011, -0.2020821, 1.896009, 0, 0, 0, 1, 1,
0.5478924, -0.4407521, 1.439921, 0, 0, 0, 1, 1,
0.5481465, 0.1437521, 0.7743886, 1, 1, 1, 1, 1,
0.5520575, 0.5144988, -0.0347026, 1, 1, 1, 1, 1,
0.5532757, 0.4602512, 1.76717, 1, 1, 1, 1, 1,
0.5578613, 1.218119, 0.1024461, 1, 1, 1, 1, 1,
0.5580268, 1.4986, 0.3177816, 1, 1, 1, 1, 1,
0.560711, -0.7725536, 3.73538, 1, 1, 1, 1, 1,
0.5615512, 0.2573999, -0.4250844, 1, 1, 1, 1, 1,
0.5626957, -0.7953104, 3.350322, 1, 1, 1, 1, 1,
0.5636622, 0.09793939, 0.1980852, 1, 1, 1, 1, 1,
0.5643455, -1.253846, 2.570295, 1, 1, 1, 1, 1,
0.5696085, 0.2198896, 0.1364017, 1, 1, 1, 1, 1,
0.573234, -0.369673, 1.814744, 1, 1, 1, 1, 1,
0.5747988, -0.2794028, 2.022702, 1, 1, 1, 1, 1,
0.5760964, -1.14412, 0.909577, 1, 1, 1, 1, 1,
0.5810989, 0.3292979, 2.720714, 1, 1, 1, 1, 1,
0.5836907, -1.794338, 3.51722, 0, 0, 1, 1, 1,
0.5840853, -0.2287429, 1.231329, 1, 0, 0, 1, 1,
0.5876392, -0.5447889, 2.354719, 1, 0, 0, 1, 1,
0.5911232, -0.127693, 2.771332, 1, 0, 0, 1, 1,
0.596251, -1.2534, 1.6881, 1, 0, 0, 1, 1,
0.5966743, 0.6619517, 2.836216, 1, 0, 0, 1, 1,
0.5983734, 0.5884169, 0.4560075, 0, 0, 0, 1, 1,
0.6029533, 1.51425, -1.649651, 0, 0, 0, 1, 1,
0.6053125, 1.3559, 0.01102396, 0, 0, 0, 1, 1,
0.6073265, -1.614953, 2.288832, 0, 0, 0, 1, 1,
0.6119482, 1.268366, 1.488494, 0, 0, 0, 1, 1,
0.6211589, -1.562223, 2.501319, 0, 0, 0, 1, 1,
0.6235345, -0.1426469, -0.3965389, 0, 0, 0, 1, 1,
0.6268157, 1.607833, -0.4285984, 1, 1, 1, 1, 1,
0.6290194, 0.9560843, 0.2380123, 1, 1, 1, 1, 1,
0.6305382, 1.185542, 2.090513, 1, 1, 1, 1, 1,
0.6339417, 0.8627018, -0.03474297, 1, 1, 1, 1, 1,
0.6423633, -0.1579155, 1.026884, 1, 1, 1, 1, 1,
0.6519325, 0.9307538, 0.9084589, 1, 1, 1, 1, 1,
0.6603032, -0.7775822, 2.944836, 1, 1, 1, 1, 1,
0.6729527, -0.1819659, -0.03118288, 1, 1, 1, 1, 1,
0.6752884, -0.1104661, 0.9808926, 1, 1, 1, 1, 1,
0.6779793, -0.6089095, 2.125126, 1, 1, 1, 1, 1,
0.6788217, -1.104105, 1.764285, 1, 1, 1, 1, 1,
0.6860556, 0.970803, 1.694587, 1, 1, 1, 1, 1,
0.6876876, -0.7393749, 3.966552, 1, 1, 1, 1, 1,
0.6912642, 0.5966952, 0.850114, 1, 1, 1, 1, 1,
0.6954066, 1.008445, 1.649717, 1, 1, 1, 1, 1,
0.6969696, 1.375657, 0.2571611, 0, 0, 1, 1, 1,
0.7002761, -0.2734767, 2.269193, 1, 0, 0, 1, 1,
0.7065938, -0.2457217, 1.173141, 1, 0, 0, 1, 1,
0.7075717, 0.6821116, -0.003346753, 1, 0, 0, 1, 1,
0.710346, -0.3398605, 2.699209, 1, 0, 0, 1, 1,
0.7162294, 0.07438899, -0.7759308, 1, 0, 0, 1, 1,
0.7165365, 0.1103986, 0.574136, 0, 0, 0, 1, 1,
0.7187446, 0.966818, 0.3901722, 0, 0, 0, 1, 1,
0.7211927, 2.151837, 0.7447247, 0, 0, 0, 1, 1,
0.7248231, 0.4687206, 0.1136332, 0, 0, 0, 1, 1,
0.7265652, 0.7987, -0.4934274, 0, 0, 0, 1, 1,
0.728053, 0.7013367, 1.002135, 0, 0, 0, 1, 1,
0.7289461, -1.219479, 4.352873, 0, 0, 0, 1, 1,
0.729987, 1.815162, 1.358837, 1, 1, 1, 1, 1,
0.7342216, -0.06822247, 1.089659, 1, 1, 1, 1, 1,
0.7348455, 1.448997, 0.7347066, 1, 1, 1, 1, 1,
0.7403178, -0.3730835, 2.36134, 1, 1, 1, 1, 1,
0.7466546, 0.1145789, 0.6080955, 1, 1, 1, 1, 1,
0.7478084, 2.241134, 0.955196, 1, 1, 1, 1, 1,
0.7488546, -1.471819, 3.473778, 1, 1, 1, 1, 1,
0.7488801, -0.2844654, 1.519771, 1, 1, 1, 1, 1,
0.7504624, -0.3961322, 1.083867, 1, 1, 1, 1, 1,
0.7604262, 0.6707993, 1.195065, 1, 1, 1, 1, 1,
0.7611134, 0.6305391, 0.03478168, 1, 1, 1, 1, 1,
0.764126, 0.0363434, 1.440701, 1, 1, 1, 1, 1,
0.7642152, -0.07631926, 0.5800843, 1, 1, 1, 1, 1,
0.7645879, 0.5131243, 1.163502, 1, 1, 1, 1, 1,
0.7646576, 0.4729848, 0.3785103, 1, 1, 1, 1, 1,
0.7681859, 0.4807116, 1.778766, 0, 0, 1, 1, 1,
0.7690861, 1.475041, 0.8585795, 1, 0, 0, 1, 1,
0.774816, -0.8937899, 3.939285, 1, 0, 0, 1, 1,
0.7798767, 0.013796, 1.926099, 1, 0, 0, 1, 1,
0.7803574, 0.7545891, -0.8075403, 1, 0, 0, 1, 1,
0.7804862, -1.932992, 0.1993342, 1, 0, 0, 1, 1,
0.7810777, -0.4410758, 3.41804, 0, 0, 0, 1, 1,
0.7838136, -1.275234, 2.669252, 0, 0, 0, 1, 1,
0.7927968, 1.468309, 1.177293, 0, 0, 0, 1, 1,
0.796477, -0.05104509, 1.321805, 0, 0, 0, 1, 1,
0.7993038, 0.6435569, -1.401156, 0, 0, 0, 1, 1,
0.7997491, -2.25545, 3.342144, 0, 0, 0, 1, 1,
0.8025088, 0.7551127, 0.6179616, 0, 0, 0, 1, 1,
0.8037126, -0.6611567, 3.263888, 1, 1, 1, 1, 1,
0.8038044, 0.9925926, 0.2081493, 1, 1, 1, 1, 1,
0.8078148, 3.410014, 0.460824, 1, 1, 1, 1, 1,
0.8104379, 0.7360451, 2.958988, 1, 1, 1, 1, 1,
0.8182876, 1.323457, 1.526715, 1, 1, 1, 1, 1,
0.8269197, 1.416833, 0.529919, 1, 1, 1, 1, 1,
0.8344309, -0.2751942, 2.878173, 1, 1, 1, 1, 1,
0.8358029, -1.719527, 3.07868, 1, 1, 1, 1, 1,
0.8530068, -0.7660671, 1.340529, 1, 1, 1, 1, 1,
0.8590574, -1.206595, 2.548133, 1, 1, 1, 1, 1,
0.864144, -2.047464, 2.751898, 1, 1, 1, 1, 1,
0.8685046, -0.2751561, 1.866001, 1, 1, 1, 1, 1,
0.8738195, -2.160989, 2.536157, 1, 1, 1, 1, 1,
0.881235, -0.8623857, 0.5429291, 1, 1, 1, 1, 1,
0.8875037, -0.1515513, 3.082857, 1, 1, 1, 1, 1,
0.8893273, 1.013682, -0.1864041, 0, 0, 1, 1, 1,
0.8980562, -0.5450897, 3.60852, 1, 0, 0, 1, 1,
0.898497, 0.2629194, 0.669242, 1, 0, 0, 1, 1,
0.8990887, -0.2791258, 1.382291, 1, 0, 0, 1, 1,
0.900217, 0.1026812, 0.05747767, 1, 0, 0, 1, 1,
0.9011669, 0.5473385, 0.9216673, 1, 0, 0, 1, 1,
0.9086423, -0.4695719, 2.429372, 0, 0, 0, 1, 1,
0.9095902, 0.1958326, 0.9979678, 0, 0, 0, 1, 1,
0.9129005, 0.308936, 1.200095, 0, 0, 0, 1, 1,
0.9170064, -0.5781615, 2.59545, 0, 0, 0, 1, 1,
0.9257473, -1.07948, 2.157743, 0, 0, 0, 1, 1,
0.9271929, 2.49056, 0.6264067, 0, 0, 0, 1, 1,
0.9308632, -0.01497197, 1.143237, 0, 0, 0, 1, 1,
0.9372937, 0.4186895, 2.614533, 1, 1, 1, 1, 1,
0.9388205, 0.5490487, 0.21555, 1, 1, 1, 1, 1,
0.9416006, 0.4395196, -0.4164732, 1, 1, 1, 1, 1,
0.9432737, -1.603262, 2.116177, 1, 1, 1, 1, 1,
0.9477125, 1.252697, 0.4050786, 1, 1, 1, 1, 1,
0.9485249, 0.2758032, 1.544277, 1, 1, 1, 1, 1,
0.9508393, -0.2450736, 3.012818, 1, 1, 1, 1, 1,
0.9513584, 1.120583, 1.546214, 1, 1, 1, 1, 1,
0.951986, 0.8171729, 0.41691, 1, 1, 1, 1, 1,
0.9550605, -0.2834751, 2.922507, 1, 1, 1, 1, 1,
0.9569631, 0.04681226, 0.7512954, 1, 1, 1, 1, 1,
0.9573983, 1.043268, 0.7464861, 1, 1, 1, 1, 1,
0.9582756, 0.2926229, 1.653926, 1, 1, 1, 1, 1,
0.9614749, -0.3447793, 1.591293, 1, 1, 1, 1, 1,
0.9679908, -0.02699562, 2.274793, 1, 1, 1, 1, 1,
0.9680359, -0.4699124, 1.513132, 0, 0, 1, 1, 1,
0.9727529, -0.2210479, 1.364504, 1, 0, 0, 1, 1,
0.9768224, -0.04986826, 2.522149, 1, 0, 0, 1, 1,
0.9815505, -0.4204943, 0.8235512, 1, 0, 0, 1, 1,
0.9869646, -0.2733321, 2.050667, 1, 0, 0, 1, 1,
0.9892918, -0.6716238, 1.533942, 1, 0, 0, 1, 1,
0.9911943, 0.6267506, 2.355909, 0, 0, 0, 1, 1,
0.9920418, -1.145802, 1.382669, 0, 0, 0, 1, 1,
0.9961832, -0.4656926, 2.834829, 0, 0, 0, 1, 1,
0.9986163, 0.4894158, 1.445643, 0, 0, 0, 1, 1,
1.000172, -0.5583906, 4.39346, 0, 0, 0, 1, 1,
1.003786, -0.8481519, 1.270964, 0, 0, 0, 1, 1,
1.00399, -0.5364302, 1.451097, 0, 0, 0, 1, 1,
1.005387, -0.8025426, 1.049235, 1, 1, 1, 1, 1,
1.007281, -0.1220842, 2.447284, 1, 1, 1, 1, 1,
1.007373, 0.06167875, 2.500845, 1, 1, 1, 1, 1,
1.008651, 0.7904223, 1.547976, 1, 1, 1, 1, 1,
1.013372, 0.30998, 1.882637, 1, 1, 1, 1, 1,
1.023178, -1.035482, 4.548366, 1, 1, 1, 1, 1,
1.051499, 0.1946682, 0.8102462, 1, 1, 1, 1, 1,
1.053967, 0.4912373, 3.689035, 1, 1, 1, 1, 1,
1.054368, 0.3607152, -0.3181367, 1, 1, 1, 1, 1,
1.057082, 1.432628, 0.1501527, 1, 1, 1, 1, 1,
1.065693, -1.571891, 2.376404, 1, 1, 1, 1, 1,
1.067492, 0.02360543, 1.03236, 1, 1, 1, 1, 1,
1.068308, 0.2273271, 0.6519347, 1, 1, 1, 1, 1,
1.074626, 0.9948434, 0.6803882, 1, 1, 1, 1, 1,
1.077683, 2.007741, 2.806429, 1, 1, 1, 1, 1,
1.08003, 0.6689221, 0.5702842, 0, 0, 1, 1, 1,
1.090658, -2.244465, 2.865861, 1, 0, 0, 1, 1,
1.091785, 0.8997905, 0.8772789, 1, 0, 0, 1, 1,
1.093207, 1.149449, 0.2060056, 1, 0, 0, 1, 1,
1.094282, 0.1760531, 1.874095, 1, 0, 0, 1, 1,
1.096469, -0.5639419, 1.775177, 1, 0, 0, 1, 1,
1.100153, -0.2266454, 0.5094807, 0, 0, 0, 1, 1,
1.103281, 0.9720239, 0.594831, 0, 0, 0, 1, 1,
1.104046, 2.590232, -0.4572165, 0, 0, 0, 1, 1,
1.107748, 1.203951, 0.2750017, 0, 0, 0, 1, 1,
1.111742, 0.7070051, -1.333769, 0, 0, 0, 1, 1,
1.112641, -0.2469557, 3.868155, 0, 0, 0, 1, 1,
1.115453, -0.6262884, 1.50265, 0, 0, 0, 1, 1,
1.119496, -0.1426201, 1.243725, 1, 1, 1, 1, 1,
1.121877, 0.8496566, 1.243606, 1, 1, 1, 1, 1,
1.139601, -0.08400572, 1.826673, 1, 1, 1, 1, 1,
1.150417, -2.14047, 4.17064, 1, 1, 1, 1, 1,
1.155466, -0.3746376, 1.465084, 1, 1, 1, 1, 1,
1.159164, -0.05350859, 1.900969, 1, 1, 1, 1, 1,
1.163042, 0.965352, 0.2235758, 1, 1, 1, 1, 1,
1.180808, -1.147353, 2.498768, 1, 1, 1, 1, 1,
1.18473, 0.6117719, 0.587019, 1, 1, 1, 1, 1,
1.186984, 0.464148, 0.4114935, 1, 1, 1, 1, 1,
1.188994, -0.1653135, 0.8627287, 1, 1, 1, 1, 1,
1.189827, 0.08262184, -0.5521392, 1, 1, 1, 1, 1,
1.1965, 0.3022196, -0.2843657, 1, 1, 1, 1, 1,
1.196824, -0.02917315, 0.8067853, 1, 1, 1, 1, 1,
1.197615, -0.5161532, 3.175933, 1, 1, 1, 1, 1,
1.199058, 1.462623, 0.011362, 0, 0, 1, 1, 1,
1.202801, -0.4591764, 2.850814, 1, 0, 0, 1, 1,
1.2041, -0.586055, 2.04817, 1, 0, 0, 1, 1,
1.214819, -0.05278299, 2.885232, 1, 0, 0, 1, 1,
1.226271, 0.4621819, 1.280129, 1, 0, 0, 1, 1,
1.234481, 1.984219, 2.209889, 1, 0, 0, 1, 1,
1.236792, 0.5564165, 0.6252379, 0, 0, 0, 1, 1,
1.241681, -0.9673089, 2.479674, 0, 0, 0, 1, 1,
1.247426, -0.537313, 1.590793, 0, 0, 0, 1, 1,
1.254194, 1.126657, 1.535418, 0, 0, 0, 1, 1,
1.266021, -1.748394, 3.261655, 0, 0, 0, 1, 1,
1.267751, -1.457818, 1.999462, 0, 0, 0, 1, 1,
1.272314, -0.4103056, 2.424268, 0, 0, 0, 1, 1,
1.277309, -1.474163, 2.318618, 1, 1, 1, 1, 1,
1.278104, 0.950189, 0.5895525, 1, 1, 1, 1, 1,
1.28888, -0.134422, 0.5014214, 1, 1, 1, 1, 1,
1.295718, -0.3804112, 1.191351, 1, 1, 1, 1, 1,
1.295794, -0.2820704, 2.110128, 1, 1, 1, 1, 1,
1.311134, 0.6561508, 3.137044, 1, 1, 1, 1, 1,
1.316553, -0.3519132, 3.006362, 1, 1, 1, 1, 1,
1.331247, -0.8265597, 1.423166, 1, 1, 1, 1, 1,
1.331874, -0.6495574, 2.139186, 1, 1, 1, 1, 1,
1.340196, -0.1924623, 1.755921, 1, 1, 1, 1, 1,
1.358636, 1.545163, -0.317412, 1, 1, 1, 1, 1,
1.364074, -0.5516676, 1.752086, 1, 1, 1, 1, 1,
1.425348, 0.8114859, 2.584108, 1, 1, 1, 1, 1,
1.425974, -1.165729, 1.174331, 1, 1, 1, 1, 1,
1.433052, -0.7499681, 1.069188, 1, 1, 1, 1, 1,
1.435956, 0.965176, 3.0365, 0, 0, 1, 1, 1,
1.436427, -0.6000282, 0.5563028, 1, 0, 0, 1, 1,
1.438512, 1.678576, 1.019106, 1, 0, 0, 1, 1,
1.440497, -0.2523887, 2.776506, 1, 0, 0, 1, 1,
1.443778, -1.088344, 2.264712, 1, 0, 0, 1, 1,
1.444304, 0.5262225, 1.519038, 1, 0, 0, 1, 1,
1.44618, -0.01729804, 0.6759555, 0, 0, 0, 1, 1,
1.455045, -1.736127, 2.835707, 0, 0, 0, 1, 1,
1.4558, 0.3908133, 1.33475, 0, 0, 0, 1, 1,
1.456956, -0.8906779, 1.721966, 0, 0, 0, 1, 1,
1.469775, 0.7263436, 1.052949, 0, 0, 0, 1, 1,
1.477187, -0.4604065, 1.286151, 0, 0, 0, 1, 1,
1.478757, -1.497585, 3.390263, 0, 0, 0, 1, 1,
1.492812, 0.1184773, 0.8649074, 1, 1, 1, 1, 1,
1.527303, -0.6876043, 1.817344, 1, 1, 1, 1, 1,
1.52836, -1.670416, 3.723516, 1, 1, 1, 1, 1,
1.532342, 1.303936, -0.9539171, 1, 1, 1, 1, 1,
1.549401, -1.490002, 0.2498782, 1, 1, 1, 1, 1,
1.562058, 1.800641, 2.331976, 1, 1, 1, 1, 1,
1.567807, -0.7926586, 2.278193, 1, 1, 1, 1, 1,
1.570118, 0.9100661, 1.149979, 1, 1, 1, 1, 1,
1.573083, -1.792494, 2.468019, 1, 1, 1, 1, 1,
1.585756, 0.1471651, 2.164819, 1, 1, 1, 1, 1,
1.586422, 0.8230494, -1.021654, 1, 1, 1, 1, 1,
1.589916, -0.2340874, 1.284918, 1, 1, 1, 1, 1,
1.595036, 0.0542588, 2.25465, 1, 1, 1, 1, 1,
1.619226, 0.4097716, 2.168649, 1, 1, 1, 1, 1,
1.619234, 0.5074938, -0.2615305, 1, 1, 1, 1, 1,
1.63018, 1.475197, 1.196379, 0, 0, 1, 1, 1,
1.631498, -1.664098, 1.475154, 1, 0, 0, 1, 1,
1.63299, 0.3560501, 1.70362, 1, 0, 0, 1, 1,
1.635372, 0.3325272, 1.304916, 1, 0, 0, 1, 1,
1.640098, 1.260254, 3.943692, 1, 0, 0, 1, 1,
1.653741, -0.01115876, 0.7503502, 1, 0, 0, 1, 1,
1.658824, -1.530276, 1.969675, 0, 0, 0, 1, 1,
1.681226, -0.4779045, 2.618631, 0, 0, 0, 1, 1,
1.712704, -0.3657634, 0.7987831, 0, 0, 0, 1, 1,
1.720252, -0.5028808, 2.545679, 0, 0, 0, 1, 1,
1.726652, 0.1027535, 1.50222, 0, 0, 0, 1, 1,
1.757917, 0.3227167, 1.622931, 0, 0, 0, 1, 1,
1.809331, -1.089804, 1.11012, 0, 0, 0, 1, 1,
1.810551, 0.1859625, 3.218394, 1, 1, 1, 1, 1,
1.821709, -2.038621, 2.094998, 1, 1, 1, 1, 1,
1.845157, -1.941885, 2.028105, 1, 1, 1, 1, 1,
1.848602, -3.15785, 2.817014, 1, 1, 1, 1, 1,
1.88982, -0.827678, 1.779212, 1, 1, 1, 1, 1,
1.891116, -0.04978559, 2.682132, 1, 1, 1, 1, 1,
1.897768, -1.246354, 3.009755, 1, 1, 1, 1, 1,
1.897813, -0.3351351, 3.788108, 1, 1, 1, 1, 1,
1.905751, -1.404833, 3.417515, 1, 1, 1, 1, 1,
1.921613, -1.007684, 0.5484486, 1, 1, 1, 1, 1,
1.946857, -0.8701533, 1.028559, 1, 1, 1, 1, 1,
1.9761, 1.515028, 0.1432853, 1, 1, 1, 1, 1,
2.003132, -0.2842775, 1.245512, 1, 1, 1, 1, 1,
2.039498, 0.5045204, 2.136776, 1, 1, 1, 1, 1,
2.063342, 0.9499187, 2.070814, 1, 1, 1, 1, 1,
2.064123, 0.512401, 1.972273, 0, 0, 1, 1, 1,
2.101985, 0.6826276, 0.7042193, 1, 0, 0, 1, 1,
2.124689, -0.3664075, 0.7332353, 1, 0, 0, 1, 1,
2.151966, -1.862398, 1.896582, 1, 0, 0, 1, 1,
2.169254, -0.2914735, 0.4548186, 1, 0, 0, 1, 1,
2.18291, 1.273919, 3.618417, 1, 0, 0, 1, 1,
2.206731, -0.442828, 2.602446, 0, 0, 0, 1, 1,
2.222484, 1.822309, 0.7842004, 0, 0, 0, 1, 1,
2.281949, -1.171171, 2.563224, 0, 0, 0, 1, 1,
2.30403, -0.8307604, 0.7855192, 0, 0, 0, 1, 1,
2.310023, 0.552752, 1.431072, 0, 0, 0, 1, 1,
2.314031, 0.3989358, 1.312592, 0, 0, 0, 1, 1,
2.339996, -0.3461975, 1.879841, 0, 0, 0, 1, 1,
2.354134, 2.118187, 0.03682169, 1, 1, 1, 1, 1,
2.512963, 0.8049431, -0.520194, 1, 1, 1, 1, 1,
2.543355, 1.921605, 0.6586635, 1, 1, 1, 1, 1,
2.573041, -0.3975892, 2.437405, 1, 1, 1, 1, 1,
2.578139, -1.221861, 1.489252, 1, 1, 1, 1, 1,
3.033177, 0.8275229, 1.299725, 1, 1, 1, 1, 1,
3.364231, -0.265115, 0.9788449, 1, 1, 1, 1, 1
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
var radius = 10.23588;
var distance = 35.95309;
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
mvMatrix.translate( -0.1452589, 0.416537, -0.5065565 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.95309);
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
