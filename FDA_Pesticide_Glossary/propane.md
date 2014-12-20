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
-3.366278, -0.2025403, -1.735826, 1, 0, 0, 1,
-3.204193, -0.1135491, -0.8820419, 1, 0.007843138, 0, 1,
-2.771644, 0.247482, -3.244967, 1, 0.01176471, 0, 1,
-2.625496, 1.268011, -0.9779752, 1, 0.01960784, 0, 1,
-2.599246, -0.5680532, -1.443004, 1, 0.02352941, 0, 1,
-2.50028, -0.1634649, -1.084695, 1, 0.03137255, 0, 1,
-2.44645, -0.91077, -1.976958, 1, 0.03529412, 0, 1,
-2.43819, -1.102199, -1.399392, 1, 0.04313726, 0, 1,
-2.390587, -2.014128, -2.639179, 1, 0.04705882, 0, 1,
-2.334392, 0.3648097, -0.9771526, 1, 0.05490196, 0, 1,
-2.307356, -1.119408, -0.239597, 1, 0.05882353, 0, 1,
-2.244578, 0.3728086, 0.08177364, 1, 0.06666667, 0, 1,
-2.212935, 1.550588, 1.583813, 1, 0.07058824, 0, 1,
-2.203965, -1.310381, -2.799923, 1, 0.07843138, 0, 1,
-2.195299, 0.7150207, -2.046875, 1, 0.08235294, 0, 1,
-2.187232, 1.501188, -2.611331, 1, 0.09019608, 0, 1,
-2.147975, -0.5527099, -1.215034, 1, 0.09411765, 0, 1,
-2.136698, -0.4302427, -0.4754117, 1, 0.1019608, 0, 1,
-2.122913, 0.1613983, -0.6862975, 1, 0.1098039, 0, 1,
-2.112007, -0.383777, -1.814293, 1, 0.1137255, 0, 1,
-2.092644, -0.1256486, -3.102068, 1, 0.1215686, 0, 1,
-2.085576, -1.133797, -1.264609, 1, 0.1254902, 0, 1,
-2.050174, -1.108241, -1.496069, 1, 0.1333333, 0, 1,
-2.04413, -0.2339568, -2.908128, 1, 0.1372549, 0, 1,
-2.008017, -0.3169065, -1.960901, 1, 0.145098, 0, 1,
-1.982788, 0.09182839, -1.729569, 1, 0.1490196, 0, 1,
-1.982358, 0.1374065, -1.224882, 1, 0.1568628, 0, 1,
-1.95055, -0.1640165, -0.222661, 1, 0.1607843, 0, 1,
-1.944603, 1.014053, 0.6328323, 1, 0.1686275, 0, 1,
-1.942623, 1.602728, 1.000344, 1, 0.172549, 0, 1,
-1.918801, 0.4456741, -2.16765, 1, 0.1803922, 0, 1,
-1.917419, 1.836398, -1.656384, 1, 0.1843137, 0, 1,
-1.900429, 1.134977, -0.665607, 1, 0.1921569, 0, 1,
-1.864598, 0.5656272, -1.256407, 1, 0.1960784, 0, 1,
-1.859661, 0.3747758, -1.122541, 1, 0.2039216, 0, 1,
-1.850867, 0.5055236, -2.006688, 1, 0.2117647, 0, 1,
-1.843538, 1.003256, -2.180925, 1, 0.2156863, 0, 1,
-1.814209, 1.499908, 0.8437628, 1, 0.2235294, 0, 1,
-1.780564, -0.276773, -1.883412, 1, 0.227451, 0, 1,
-1.770347, -0.8358769, -2.390532, 1, 0.2352941, 0, 1,
-1.756705, 0.8671539, -1.310011, 1, 0.2392157, 0, 1,
-1.756451, -0.7641928, -2.617561, 1, 0.2470588, 0, 1,
-1.738506, 0.2089046, -0.05801301, 1, 0.2509804, 0, 1,
-1.73621, 1.064324, -0.03996904, 1, 0.2588235, 0, 1,
-1.73042, 0.4966571, 0.1977395, 1, 0.2627451, 0, 1,
-1.725813, 0.6476817, -0.2050322, 1, 0.2705882, 0, 1,
-1.718459, -1.136676, -1.257585, 1, 0.2745098, 0, 1,
-1.714821, -0.3054425, -1.393479, 1, 0.282353, 0, 1,
-1.707506, -0.1275213, -1.778335, 1, 0.2862745, 0, 1,
-1.694329, -1.398215, -2.803425, 1, 0.2941177, 0, 1,
-1.693865, 0.2078474, -1.952771, 1, 0.3019608, 0, 1,
-1.679159, 1.795641, -0.5917024, 1, 0.3058824, 0, 1,
-1.672883, 2.928264, -0.9445927, 1, 0.3137255, 0, 1,
-1.663225, 1.975826, -0.6317922, 1, 0.3176471, 0, 1,
-1.656412, -0.5745159, -1.921728, 1, 0.3254902, 0, 1,
-1.64674, 0.4560933, 0.224848, 1, 0.3294118, 0, 1,
-1.63371, 0.8130059, -1.127219, 1, 0.3372549, 0, 1,
-1.629588, -0.2210095, -1.919544, 1, 0.3411765, 0, 1,
-1.627838, 1.134997, -2.637793, 1, 0.3490196, 0, 1,
-1.626232, 1.629024, 0.7035706, 1, 0.3529412, 0, 1,
-1.626219, -0.6199157, -1.981468, 1, 0.3607843, 0, 1,
-1.579165, 0.3607961, -2.06388, 1, 0.3647059, 0, 1,
-1.561447, 0.07431067, -1.15286, 1, 0.372549, 0, 1,
-1.560611, 0.3657094, -2.176767, 1, 0.3764706, 0, 1,
-1.5599, 1.49487, -2.623182, 1, 0.3843137, 0, 1,
-1.545962, 1.12249, -1.258282, 1, 0.3882353, 0, 1,
-1.51967, 0.08322729, 0.010936, 1, 0.3960784, 0, 1,
-1.517555, -0.2253741, -0.6626987, 1, 0.4039216, 0, 1,
-1.512806, 0.07023372, -0.4928919, 1, 0.4078431, 0, 1,
-1.504978, -0.4284224, -3.188252, 1, 0.4156863, 0, 1,
-1.504046, -1.591581, -3.325363, 1, 0.4196078, 0, 1,
-1.50385, -1.321983, -2.313674, 1, 0.427451, 0, 1,
-1.503593, 1.295445, -0.2851458, 1, 0.4313726, 0, 1,
-1.491961, -0.1796097, -1.737763, 1, 0.4392157, 0, 1,
-1.487545, 0.1514098, -1.165119, 1, 0.4431373, 0, 1,
-1.478455, -1.074662, -2.49052, 1, 0.4509804, 0, 1,
-1.472569, 2.141405, 0.6846153, 1, 0.454902, 0, 1,
-1.454478, -1.468188, -3.544575, 1, 0.4627451, 0, 1,
-1.446426, 1.179392, -1.332881, 1, 0.4666667, 0, 1,
-1.438417, 0.5231636, 0.5166427, 1, 0.4745098, 0, 1,
-1.437643, -0.6394386, -1.230256, 1, 0.4784314, 0, 1,
-1.431172, 0.5024508, -2.037912, 1, 0.4862745, 0, 1,
-1.424989, 0.668225, 1.961999, 1, 0.4901961, 0, 1,
-1.419386, 0.971654, 0.1049282, 1, 0.4980392, 0, 1,
-1.409692, -0.09417548, -2.528911, 1, 0.5058824, 0, 1,
-1.40737, 0.1031794, -3.577456, 1, 0.509804, 0, 1,
-1.387944, -1.013112, -1.640476, 1, 0.5176471, 0, 1,
-1.384443, -1.241547, -1.994775, 1, 0.5215687, 0, 1,
-1.376654, 0.06917933, -1.9773, 1, 0.5294118, 0, 1,
-1.376016, -0.3754573, -4.349181, 1, 0.5333334, 0, 1,
-1.371058, 0.4013562, -0.586525, 1, 0.5411765, 0, 1,
-1.36227, 0.6763858, 0.3774291, 1, 0.5450981, 0, 1,
-1.350636, 1.976965, -1.550532, 1, 0.5529412, 0, 1,
-1.319876, -0.4244731, -1.764511, 1, 0.5568628, 0, 1,
-1.303898, 1.183928, -0.9686466, 1, 0.5647059, 0, 1,
-1.298157, -0.1281005, -1.732939, 1, 0.5686275, 0, 1,
-1.291523, 0.5510195, 0.2227036, 1, 0.5764706, 0, 1,
-1.283345, -2.695478, -3.946386, 1, 0.5803922, 0, 1,
-1.28056, -1.430104, -1.474626, 1, 0.5882353, 0, 1,
-1.278763, 0.2901646, -2.557719, 1, 0.5921569, 0, 1,
-1.277155, 0.8458519, -2.282859, 1, 0.6, 0, 1,
-1.253913, 0.3132857, 0.1445337, 1, 0.6078432, 0, 1,
-1.253281, 0.9568474, -0.9070741, 1, 0.6117647, 0, 1,
-1.250058, -0.4368921, -2.546568, 1, 0.6196079, 0, 1,
-1.24766, 0.4550264, -1.319085, 1, 0.6235294, 0, 1,
-1.240493, -0.0181904, 1.103901, 1, 0.6313726, 0, 1,
-1.220421, 0.3858464, -1.939439, 1, 0.6352941, 0, 1,
-1.219895, -2.176355, -3.235189, 1, 0.6431373, 0, 1,
-1.20311, 1.109275, 0.4700867, 1, 0.6470588, 0, 1,
-1.194686, 0.4659303, -1.924954, 1, 0.654902, 0, 1,
-1.183919, -1.128319, -3.050776, 1, 0.6588235, 0, 1,
-1.173845, -0.4183576, -3.472623, 1, 0.6666667, 0, 1,
-1.173069, -0.5837502, -2.67471, 1, 0.6705883, 0, 1,
-1.165083, 0.9156229, -0.293759, 1, 0.6784314, 0, 1,
-1.155549, -1.203977, -2.996122, 1, 0.682353, 0, 1,
-1.153846, -1.132204, -2.041418, 1, 0.6901961, 0, 1,
-1.150736, -0.07066423, -3.015865, 1, 0.6941177, 0, 1,
-1.135302, 1.270351, -0.9008073, 1, 0.7019608, 0, 1,
-1.132511, -0.3615065, -0.918005, 1, 0.7098039, 0, 1,
-1.132054, 0.6049232, -0.6941768, 1, 0.7137255, 0, 1,
-1.130123, -0.08670847, -1.788199, 1, 0.7215686, 0, 1,
-1.123116, 0.4803255, -1.472022, 1, 0.7254902, 0, 1,
-1.117114, 1.059001, -2.066993, 1, 0.7333333, 0, 1,
-1.1143, 1.8015, 0.02728233, 1, 0.7372549, 0, 1,
-1.101681, -0.4972947, -1.422464, 1, 0.7450981, 0, 1,
-1.092233, 1.283993, -1.18645, 1, 0.7490196, 0, 1,
-1.09133, 0.1953541, -2.218297, 1, 0.7568628, 0, 1,
-1.087443, -1.644007, -2.387443, 1, 0.7607843, 0, 1,
-1.085578, -0.7007971, -1.625494, 1, 0.7686275, 0, 1,
-1.083848, -0.6413348, -1.925682, 1, 0.772549, 0, 1,
-1.083606, -0.9254389, -3.763515, 1, 0.7803922, 0, 1,
-1.083026, -0.837922, -1.948319, 1, 0.7843137, 0, 1,
-1.082933, -0.7029701, -3.26517, 1, 0.7921569, 0, 1,
-1.082591, -1.316444, -2.28732, 1, 0.7960784, 0, 1,
-1.075506, 0.3505201, -2.119703, 1, 0.8039216, 0, 1,
-1.07503, -1.388582, -1.472365, 1, 0.8117647, 0, 1,
-1.063141, 0.8659898, -0.590536, 1, 0.8156863, 0, 1,
-1.058352, 0.918054, -0.6013243, 1, 0.8235294, 0, 1,
-1.057261, -1.499789, -3.405033, 1, 0.827451, 0, 1,
-1.041219, -0.1765946, -1.325008, 1, 0.8352941, 0, 1,
-1.041074, 0.05361073, -3.119772, 1, 0.8392157, 0, 1,
-1.039224, -0.6951744, -2.166023, 1, 0.8470588, 0, 1,
-1.037169, -0.32216, -3.183793, 1, 0.8509804, 0, 1,
-1.031854, 0.7861974, -1.419233, 1, 0.8588235, 0, 1,
-1.031685, -0.4755144, -0.4147674, 1, 0.8627451, 0, 1,
-1.029148, -0.5111306, -1.696704, 1, 0.8705882, 0, 1,
-1.028899, -0.8472531, -0.9784061, 1, 0.8745098, 0, 1,
-1.02677, 0.4415996, -1.85506, 1, 0.8823529, 0, 1,
-1.019142, -0.8824255, -2.997296, 1, 0.8862745, 0, 1,
-1.017805, 1.283812, -0.4139639, 1, 0.8941177, 0, 1,
-1.016364, 0.1443236, -1.065141, 1, 0.8980392, 0, 1,
-1.014847, -0.03602988, -2.726257, 1, 0.9058824, 0, 1,
-1.014094, -0.2538163, -0.5018006, 1, 0.9137255, 0, 1,
-1.013176, -0.02100614, -2.86613, 1, 0.9176471, 0, 1,
-1.012907, -0.3751397, -0.5695801, 1, 0.9254902, 0, 1,
-1.011513, -0.1406228, -0.5084906, 1, 0.9294118, 0, 1,
-1.004099, 2.453575, -0.5954468, 1, 0.9372549, 0, 1,
-0.9977536, -0.1737158, -2.064192, 1, 0.9411765, 0, 1,
-0.9935879, -0.849542, -1.482931, 1, 0.9490196, 0, 1,
-0.9918424, 1.235759, 0.2969074, 1, 0.9529412, 0, 1,
-0.9892727, -0.1030358, -1.486776, 1, 0.9607843, 0, 1,
-0.9686054, 0.1485714, -0.3274644, 1, 0.9647059, 0, 1,
-0.9671321, -0.5364941, -1.827933, 1, 0.972549, 0, 1,
-0.9651951, 0.2739859, -0.2845025, 1, 0.9764706, 0, 1,
-0.9643094, 0.376856, -0.6239952, 1, 0.9843137, 0, 1,
-0.9526719, 0.1793112, 1.006411, 1, 0.9882353, 0, 1,
-0.951932, 1.004658, -1.069716, 1, 0.9960784, 0, 1,
-0.9464486, 1.218432, -0.3027821, 0.9960784, 1, 0, 1,
-0.9437732, 0.954821, -0.9998202, 0.9921569, 1, 0, 1,
-0.9355119, -1.547952, -1.229948, 0.9843137, 1, 0, 1,
-0.9340187, 0.9425063, -0.0454881, 0.9803922, 1, 0, 1,
-0.9290881, 0.7039859, -0.7756353, 0.972549, 1, 0, 1,
-0.9238187, 0.5804963, -2.233439, 0.9686275, 1, 0, 1,
-0.9233891, 0.1412022, -0.7891187, 0.9607843, 1, 0, 1,
-0.9223791, -1.546977, -2.247822, 0.9568627, 1, 0, 1,
-0.9164677, -1.699966, -3.028532, 0.9490196, 1, 0, 1,
-0.9067852, 0.6009316, -1.524953, 0.945098, 1, 0, 1,
-0.9065948, 1.548395, -1.19108, 0.9372549, 1, 0, 1,
-0.9065589, -1.428428, -3.318891, 0.9333333, 1, 0, 1,
-0.9064229, -1.773318, -3.85849, 0.9254902, 1, 0, 1,
-0.9021344, -0.7332602, -2.997621, 0.9215686, 1, 0, 1,
-0.8996421, -0.3794532, -2.222329, 0.9137255, 1, 0, 1,
-0.8949827, -1.299708, -2.521521, 0.9098039, 1, 0, 1,
-0.8942841, -0.8641923, -3.117897, 0.9019608, 1, 0, 1,
-0.8876479, 1.111967, -0.1184145, 0.8941177, 1, 0, 1,
-0.8782055, 0.9617018, -1.096537, 0.8901961, 1, 0, 1,
-0.8734415, -2.087661, -0.619463, 0.8823529, 1, 0, 1,
-0.8731439, -0.04621312, -3.461257, 0.8784314, 1, 0, 1,
-0.8715929, 1.224535, -1.972229, 0.8705882, 1, 0, 1,
-0.8694571, 0.03416947, -2.200813, 0.8666667, 1, 0, 1,
-0.8665249, 0.2650582, -2.749778, 0.8588235, 1, 0, 1,
-0.8622368, 1.230161, -2.167831, 0.854902, 1, 0, 1,
-0.8618932, -0.9704728, -2.262658, 0.8470588, 1, 0, 1,
-0.8537608, -0.6777071, -2.658317, 0.8431373, 1, 0, 1,
-0.8514373, 0.1356626, -3.262483, 0.8352941, 1, 0, 1,
-0.8510281, 0.1836445, -1.474489, 0.8313726, 1, 0, 1,
-0.8495835, -1.643947, -3.368845, 0.8235294, 1, 0, 1,
-0.8465406, -1.807757, -1.507983, 0.8196079, 1, 0, 1,
-0.8448622, 1.523687, -0.1441725, 0.8117647, 1, 0, 1,
-0.8445482, -0.9739622, -2.415082, 0.8078431, 1, 0, 1,
-0.8377973, -1.043641, -1.419842, 0.8, 1, 0, 1,
-0.8363145, -1.6661, -2.248206, 0.7921569, 1, 0, 1,
-0.8287294, -0.528031, -2.307251, 0.7882353, 1, 0, 1,
-0.8284515, 0.2358986, -0.6832067, 0.7803922, 1, 0, 1,
-0.8264226, -1.86509, -3.31395, 0.7764706, 1, 0, 1,
-0.8217104, 0.1071994, -0.05361065, 0.7686275, 1, 0, 1,
-0.816747, -0.1676577, -1.324644, 0.7647059, 1, 0, 1,
-0.8131544, -0.8581746, -2.265266, 0.7568628, 1, 0, 1,
-0.8093415, 0.9438216, -0.5473784, 0.7529412, 1, 0, 1,
-0.8043941, 0.4609196, -0.6496366, 0.7450981, 1, 0, 1,
-0.802794, 0.0788454, -0.5403783, 0.7411765, 1, 0, 1,
-0.8007151, -1.199451, -0.8695444, 0.7333333, 1, 0, 1,
-0.7954555, 0.5465438, -0.1345379, 0.7294118, 1, 0, 1,
-0.7948437, 0.2175916, -0.7652854, 0.7215686, 1, 0, 1,
-0.7884828, 0.5154192, 0.1037262, 0.7176471, 1, 0, 1,
-0.7827117, 2.15873, 0.2702457, 0.7098039, 1, 0, 1,
-0.7805749, -0.4711882, -0.6392432, 0.7058824, 1, 0, 1,
-0.778334, 0.4364051, -0.4461849, 0.6980392, 1, 0, 1,
-0.7777871, 1.070688, -0.9258525, 0.6901961, 1, 0, 1,
-0.7750074, -1.003942, -4.64969, 0.6862745, 1, 0, 1,
-0.7749155, 0.1680006, -1.019238, 0.6784314, 1, 0, 1,
-0.7674023, 0.4133279, -1.1004, 0.6745098, 1, 0, 1,
-0.7617081, -1.758084, -2.842518, 0.6666667, 1, 0, 1,
-0.7556581, -0.6556122, -3.651882, 0.6627451, 1, 0, 1,
-0.7536457, 0.916648, -1.179998, 0.654902, 1, 0, 1,
-0.724693, 1.177226, 0.1815398, 0.6509804, 1, 0, 1,
-0.7240463, 0.04131444, -0.7765159, 0.6431373, 1, 0, 1,
-0.7201019, 0.2630084, 0.4256811, 0.6392157, 1, 0, 1,
-0.7199819, -0.9365741, -2.7149, 0.6313726, 1, 0, 1,
-0.7135733, 0.913011, -1.118659, 0.627451, 1, 0, 1,
-0.713188, 0.3772559, -2.981312, 0.6196079, 1, 0, 1,
-0.7113256, -0.3254529, 0.05223688, 0.6156863, 1, 0, 1,
-0.7108554, -0.03589531, -2.169151, 0.6078432, 1, 0, 1,
-0.7077817, -0.9840226, -4.204076, 0.6039216, 1, 0, 1,
-0.7023209, 0.2374222, -2.099686, 0.5960785, 1, 0, 1,
-0.7016718, -0.09791571, -1.026636, 0.5882353, 1, 0, 1,
-0.6994295, 0.9801581, 0.2181009, 0.5843138, 1, 0, 1,
-0.6973687, -1.265581, -0.09425604, 0.5764706, 1, 0, 1,
-0.6888794, -0.2318458, -3.023213, 0.572549, 1, 0, 1,
-0.6868136, -1.061502, -2.221644, 0.5647059, 1, 0, 1,
-0.6758549, 0.225893, -0.4374993, 0.5607843, 1, 0, 1,
-0.6753181, -2.015825, -1.221715, 0.5529412, 1, 0, 1,
-0.6738265, 0.3932751, -1.475523, 0.5490196, 1, 0, 1,
-0.672378, 1.715774, -0.4319896, 0.5411765, 1, 0, 1,
-0.6722183, 0.3283498, -1.975261, 0.5372549, 1, 0, 1,
-0.6715336, -1.378011, -1.731898, 0.5294118, 1, 0, 1,
-0.6672667, -0.4994779, -3.072113, 0.5254902, 1, 0, 1,
-0.6647114, 0.8531163, -0.7927631, 0.5176471, 1, 0, 1,
-0.6602271, -1.083262, -1.805942, 0.5137255, 1, 0, 1,
-0.6492983, 1.535787, -2.04929, 0.5058824, 1, 0, 1,
-0.6361309, -0.991537, -1.887967, 0.5019608, 1, 0, 1,
-0.6323598, -0.7801802, -2.80844, 0.4941176, 1, 0, 1,
-0.6294733, -0.969451, -3.658721, 0.4862745, 1, 0, 1,
-0.6289436, 0.8229774, -0.4599996, 0.4823529, 1, 0, 1,
-0.6281582, 0.1026497, -2.636075, 0.4745098, 1, 0, 1,
-0.6228817, -0.9271429, -3.597198, 0.4705882, 1, 0, 1,
-0.6221763, -0.3081516, -3.417064, 0.4627451, 1, 0, 1,
-0.616511, -0.2328543, -2.255582, 0.4588235, 1, 0, 1,
-0.6156561, -0.1485466, -1.139522, 0.4509804, 1, 0, 1,
-0.6151888, 0.1363861, -1.525258, 0.4470588, 1, 0, 1,
-0.6071918, 0.6252439, -0.3377768, 0.4392157, 1, 0, 1,
-0.605881, -0.3022797, -1.743021, 0.4352941, 1, 0, 1,
-0.6046609, 0.120406, -0.5184719, 0.427451, 1, 0, 1,
-0.6039791, 0.3181538, -2.182259, 0.4235294, 1, 0, 1,
-0.6036652, 1.021894, 0.03359581, 0.4156863, 1, 0, 1,
-0.6015667, -0.009581412, -1.428658, 0.4117647, 1, 0, 1,
-0.5989491, 0.9256667, -1.502017, 0.4039216, 1, 0, 1,
-0.5950778, -0.1666049, -2.653855, 0.3960784, 1, 0, 1,
-0.5854741, 0.559754, -0.7307723, 0.3921569, 1, 0, 1,
-0.578031, 0.2782201, 0.1670635, 0.3843137, 1, 0, 1,
-0.5756424, 1.131879, -0.5173662, 0.3803922, 1, 0, 1,
-0.5733891, -1.491552, -3.725425, 0.372549, 1, 0, 1,
-0.5669897, -0.2767069, -1.912308, 0.3686275, 1, 0, 1,
-0.5618939, -0.1570194, -3.219167, 0.3607843, 1, 0, 1,
-0.5592589, 0.8111582, -2.055675, 0.3568628, 1, 0, 1,
-0.5568265, -0.680546, -1.877391, 0.3490196, 1, 0, 1,
-0.5554541, -2.392375, -3.207186, 0.345098, 1, 0, 1,
-0.5535518, -0.1457483, -0.1523996, 0.3372549, 1, 0, 1,
-0.5506002, -0.2909009, -2.02622, 0.3333333, 1, 0, 1,
-0.5458978, -0.5993023, -2.604587, 0.3254902, 1, 0, 1,
-0.5446157, 0.05393745, -0.2648363, 0.3215686, 1, 0, 1,
-0.5439939, -0.4002111, -1.519358, 0.3137255, 1, 0, 1,
-0.5405882, 0.3212603, -1.767954, 0.3098039, 1, 0, 1,
-0.5392941, 1.457918, 0.1356554, 0.3019608, 1, 0, 1,
-0.5337608, -0.09208251, -1.413321, 0.2941177, 1, 0, 1,
-0.530667, 0.3290617, -0.8725321, 0.2901961, 1, 0, 1,
-0.5216984, 0.09880328, -1.950245, 0.282353, 1, 0, 1,
-0.520497, -0.2879032, -2.938129, 0.2784314, 1, 0, 1,
-0.5106078, 0.8106676, 0.7180154, 0.2705882, 1, 0, 1,
-0.5079045, 0.790769, -0.8922602, 0.2666667, 1, 0, 1,
-0.5076349, 0.1944085, -1.737658, 0.2588235, 1, 0, 1,
-0.5062036, -0.1624594, -0.7209849, 0.254902, 1, 0, 1,
-0.5045892, 0.4937174, 1.444293, 0.2470588, 1, 0, 1,
-0.5008078, -1.527607, -3.53237, 0.2431373, 1, 0, 1,
-0.4955751, 1.195112, -1.221342, 0.2352941, 1, 0, 1,
-0.4899033, 1.169217, -0.4073011, 0.2313726, 1, 0, 1,
-0.4892838, 0.8450191, -0.5994868, 0.2235294, 1, 0, 1,
-0.4839014, 1.614346, 0.8993002, 0.2196078, 1, 0, 1,
-0.4821165, -0.2079836, -1.92147, 0.2117647, 1, 0, 1,
-0.4772663, -1.167295, -2.714637, 0.2078431, 1, 0, 1,
-0.4741455, -1.051397, -1.558464, 0.2, 1, 0, 1,
-0.4628631, 0.7372245, 0.5392104, 0.1921569, 1, 0, 1,
-0.4616111, 0.8144848, 0.1402479, 0.1882353, 1, 0, 1,
-0.4521867, 1.81943, -1.398477, 0.1803922, 1, 0, 1,
-0.4511578, 1.139395, -1.450469, 0.1764706, 1, 0, 1,
-0.4497389, 0.7923313, -0.845297, 0.1686275, 1, 0, 1,
-0.4488084, 1.955872, -1.945826, 0.1647059, 1, 0, 1,
-0.4467873, 0.000970354, -2.894825, 0.1568628, 1, 0, 1,
-0.4449242, -0.1779781, -1.450507, 0.1529412, 1, 0, 1,
-0.4446737, -0.225218, -2.940497, 0.145098, 1, 0, 1,
-0.4417985, 0.4685659, 0.4541884, 0.1411765, 1, 0, 1,
-0.4367099, 0.1077899, -0.7889714, 0.1333333, 1, 0, 1,
-0.4347031, 1.683741, -0.396154, 0.1294118, 1, 0, 1,
-0.4324715, -0.2129843, -3.065443, 0.1215686, 1, 0, 1,
-0.431048, -0.1340911, -1.746892, 0.1176471, 1, 0, 1,
-0.4306346, -1.619521, -3.379687, 0.1098039, 1, 0, 1,
-0.4302588, 0.6155038, 0.1503471, 0.1058824, 1, 0, 1,
-0.429479, 0.8396327, 0.5604331, 0.09803922, 1, 0, 1,
-0.4275214, 0.3063478, -1.194967, 0.09019608, 1, 0, 1,
-0.4270943, 0.7393323, -0.9343917, 0.08627451, 1, 0, 1,
-0.4243549, 1.445262, -2.317657, 0.07843138, 1, 0, 1,
-0.4230272, 3.634467, 0.298168, 0.07450981, 1, 0, 1,
-0.4228884, 1.611693, 0.5276067, 0.06666667, 1, 0, 1,
-0.4227346, -0.7520727, -3.930965, 0.0627451, 1, 0, 1,
-0.4177381, 1.093985, 0.01374932, 0.05490196, 1, 0, 1,
-0.4161104, 0.4738697, 1.768426, 0.05098039, 1, 0, 1,
-0.4150202, -0.2541704, -2.979209, 0.04313726, 1, 0, 1,
-0.4144576, 1.219103, 0.2462955, 0.03921569, 1, 0, 1,
-0.4088692, -1.307485, -1.432641, 0.03137255, 1, 0, 1,
-0.4086392, 0.5157346, -1.489136, 0.02745098, 1, 0, 1,
-0.4054691, -1.158032, -2.55493, 0.01960784, 1, 0, 1,
-0.4043529, -0.1023945, -0.4942651, 0.01568628, 1, 0, 1,
-0.3982651, -0.1735886, -3.189684, 0.007843138, 1, 0, 1,
-0.3973298, 1.077789, -0.2172374, 0.003921569, 1, 0, 1,
-0.3962757, -1.603672, -3.777065, 0, 1, 0.003921569, 1,
-0.396093, -0.3884567, -3.501713, 0, 1, 0.01176471, 1,
-0.393281, 1.846761, 0.2842895, 0, 1, 0.01568628, 1,
-0.3927394, 0.2021583, 0.7579779, 0, 1, 0.02352941, 1,
-0.3897925, -1.503594, -2.367709, 0, 1, 0.02745098, 1,
-0.3895569, 1.284791, -0.4211937, 0, 1, 0.03529412, 1,
-0.3868677, -1.516628, -3.283822, 0, 1, 0.03921569, 1,
-0.3808791, 0.781136, 0.1573873, 0, 1, 0.04705882, 1,
-0.3744918, 1.538295, 0.7410043, 0, 1, 0.05098039, 1,
-0.3677641, -0.1311802, -1.882942, 0, 1, 0.05882353, 1,
-0.3671621, 0.860016, -1.820185, 0, 1, 0.0627451, 1,
-0.3646843, -0.7621238, -2.840873, 0, 1, 0.07058824, 1,
-0.3560228, -0.36955, -1.658414, 0, 1, 0.07450981, 1,
-0.3551394, 0.1737141, -1.455945, 0, 1, 0.08235294, 1,
-0.353806, -1.441334, -4.389118, 0, 1, 0.08627451, 1,
-0.3502701, 0.9786361, 0.5037155, 0, 1, 0.09411765, 1,
-0.3438303, -0.796114, -2.609535, 0, 1, 0.1019608, 1,
-0.3428772, 0.6383002, 0.7755159, 0, 1, 0.1058824, 1,
-0.3283555, 0.2038131, -0.6914238, 0, 1, 0.1137255, 1,
-0.3267571, 0.1054059, -0.9142715, 0, 1, 0.1176471, 1,
-0.3229151, 1.02167, -0.3066339, 0, 1, 0.1254902, 1,
-0.3207355, -0.05687009, 0.004444847, 0, 1, 0.1294118, 1,
-0.3185215, 0.1690023, 0.3295911, 0, 1, 0.1372549, 1,
-0.3142773, -0.05845713, -0.3887065, 0, 1, 0.1411765, 1,
-0.311135, 0.5854134, -1.78678, 0, 1, 0.1490196, 1,
-0.3101487, 1.84084, 0.04209058, 0, 1, 0.1529412, 1,
-0.3034006, 0.2366752, -2.09696, 0, 1, 0.1607843, 1,
-0.3029057, -1.938017, -3.364025, 0, 1, 0.1647059, 1,
-0.2968986, -1.296438, -3.040931, 0, 1, 0.172549, 1,
-0.2961755, 0.3108494, -1.663378, 0, 1, 0.1764706, 1,
-0.2922229, -0.6639016, -3.06482, 0, 1, 0.1843137, 1,
-0.2904897, -1.217483, -3.728164, 0, 1, 0.1882353, 1,
-0.2880095, -1.30785, -3.739059, 0, 1, 0.1960784, 1,
-0.2863745, -0.4210759, -3.830833, 0, 1, 0.2039216, 1,
-0.2743313, -0.389046, -3.266829, 0, 1, 0.2078431, 1,
-0.2680216, 0.4634235, 0.8444063, 0, 1, 0.2156863, 1,
-0.2671963, 1.336096, 0.9555749, 0, 1, 0.2196078, 1,
-0.2658517, -0.1350688, -2.795092, 0, 1, 0.227451, 1,
-0.2635265, 0.4381323, 0.06051883, 0, 1, 0.2313726, 1,
-0.2626619, 0.4970504, -0.6991137, 0, 1, 0.2392157, 1,
-0.261023, -0.4022473, -4.583594, 0, 1, 0.2431373, 1,
-0.2567691, 0.4145981, -1.228327, 0, 1, 0.2509804, 1,
-0.2557358, 0.5305264, -2.18329, 0, 1, 0.254902, 1,
-0.2523391, -0.4475032, -3.238895, 0, 1, 0.2627451, 1,
-0.2515309, 0.8278576, -1.748867, 0, 1, 0.2666667, 1,
-0.247626, 1.072005, 0.2326351, 0, 1, 0.2745098, 1,
-0.2472688, 0.5422334, -0.5525298, 0, 1, 0.2784314, 1,
-0.2460571, 0.2255562, -1.154806, 0, 1, 0.2862745, 1,
-0.2314319, 0.3373325, 2.187404, 0, 1, 0.2901961, 1,
-0.2284969, 0.6208172, 0.2892234, 0, 1, 0.2980392, 1,
-0.2280744, 0.4076657, -0.2063948, 0, 1, 0.3058824, 1,
-0.2266053, 1.379608, 0.1000172, 0, 1, 0.3098039, 1,
-0.2246729, -1.333996, -3.35537, 0, 1, 0.3176471, 1,
-0.2235451, 0.2716887, -1.525958, 0, 1, 0.3215686, 1,
-0.2202507, 0.4800844, -2.406997, 0, 1, 0.3294118, 1,
-0.2197354, 0.9412313, -0.1403755, 0, 1, 0.3333333, 1,
-0.2129075, -0.4930091, -3.444351, 0, 1, 0.3411765, 1,
-0.2122423, -0.8442985, -3.873526, 0, 1, 0.345098, 1,
-0.2083409, -0.4084668, -0.9280453, 0, 1, 0.3529412, 1,
-0.2061519, -0.0621585, -2.596944, 0, 1, 0.3568628, 1,
-0.1987445, -0.6234292, -1.459547, 0, 1, 0.3647059, 1,
-0.1980356, 0.573778, -2.352781, 0, 1, 0.3686275, 1,
-0.1971984, 1.474734, 0.5771526, 0, 1, 0.3764706, 1,
-0.1964321, -1.389032, -1.747918, 0, 1, 0.3803922, 1,
-0.1950405, -1.089409, -2.734127, 0, 1, 0.3882353, 1,
-0.1928938, -0.5309722, -2.150623, 0, 1, 0.3921569, 1,
-0.1827209, -1.110165, -2.763745, 0, 1, 0.4, 1,
-0.1810204, 2.195565, -0.5717606, 0, 1, 0.4078431, 1,
-0.1786818, -0.2720779, -3.589093, 0, 1, 0.4117647, 1,
-0.1777204, 0.6318626, -0.8627918, 0, 1, 0.4196078, 1,
-0.1749082, -2.088801, -4.526041, 0, 1, 0.4235294, 1,
-0.1736984, 0.3882889, -1.37287, 0, 1, 0.4313726, 1,
-0.17084, 1.067293, 0.5014055, 0, 1, 0.4352941, 1,
-0.1702323, -0.3862497, -2.666695, 0, 1, 0.4431373, 1,
-0.1696072, -0.7739151, -1.456463, 0, 1, 0.4470588, 1,
-0.1654172, -0.9892334, -4.135804, 0, 1, 0.454902, 1,
-0.1617012, 0.6742269, -0.6290888, 0, 1, 0.4588235, 1,
-0.1604924, 2.030319, -0.4228232, 0, 1, 0.4666667, 1,
-0.1600031, 1.683983, 0.7064921, 0, 1, 0.4705882, 1,
-0.1597358, 1.118891, 1.800604, 0, 1, 0.4784314, 1,
-0.1563387, -0.4368236, -4.267109, 0, 1, 0.4823529, 1,
-0.1487842, -0.9300355, -3.016092, 0, 1, 0.4901961, 1,
-0.1453563, -1.379917, -3.642952, 0, 1, 0.4941176, 1,
-0.1433446, 0.1450935, 0.508983, 0, 1, 0.5019608, 1,
-0.1417825, 1.049732, 1.233511, 0, 1, 0.509804, 1,
-0.1417117, -0.2468933, -2.882899, 0, 1, 0.5137255, 1,
-0.1401604, -0.3263833, -2.354809, 0, 1, 0.5215687, 1,
-0.1284726, 1.213464, -0.4672104, 0, 1, 0.5254902, 1,
-0.1283818, -0.06275795, -2.739393, 0, 1, 0.5333334, 1,
-0.1280498, -1.209972, -3.928582, 0, 1, 0.5372549, 1,
-0.120209, -0.5271971, -3.431944, 0, 1, 0.5450981, 1,
-0.1169582, -0.6729595, -2.052571, 0, 1, 0.5490196, 1,
-0.1168071, 0.4597134, -0.1572371, 0, 1, 0.5568628, 1,
-0.1163681, -0.4328385, -4.963808, 0, 1, 0.5607843, 1,
-0.1152078, -0.7626157, -2.282791, 0, 1, 0.5686275, 1,
-0.1116496, 0.448251, -0.2979506, 0, 1, 0.572549, 1,
-0.1059211, 0.5991614, -0.3519222, 0, 1, 0.5803922, 1,
-0.1034452, 0.5608118, -0.5112328, 0, 1, 0.5843138, 1,
-0.09869467, 0.6745415, 1.080821, 0, 1, 0.5921569, 1,
-0.09758561, -0.3484998, -2.097862, 0, 1, 0.5960785, 1,
-0.09537847, -0.1296137, -3.110255, 0, 1, 0.6039216, 1,
-0.08391391, -0.3203331, -3.214027, 0, 1, 0.6117647, 1,
-0.08242316, -0.8251526, -3.252939, 0, 1, 0.6156863, 1,
-0.07303818, -0.4721901, -3.557117, 0, 1, 0.6235294, 1,
-0.07031661, -1.448857, -3.843738, 0, 1, 0.627451, 1,
-0.06766608, -0.9902427, -3.31216, 0, 1, 0.6352941, 1,
-0.0648466, 0.5247396, -0.2746685, 0, 1, 0.6392157, 1,
-0.06131322, 0.9895809, 0.6015064, 0, 1, 0.6470588, 1,
-0.06082627, -0.9607591, -3.188552, 0, 1, 0.6509804, 1,
-0.05871354, -0.338291, -2.187787, 0, 1, 0.6588235, 1,
-0.05650999, -0.8675965, -2.006374, 0, 1, 0.6627451, 1,
-0.05621197, -0.8481749, 0.3925838, 0, 1, 0.6705883, 1,
-0.049916, -1.161076, -3.020839, 0, 1, 0.6745098, 1,
-0.04867546, 2.075454, -0.1839078, 0, 1, 0.682353, 1,
-0.04804722, 0.4616632, -1.461454, 0, 1, 0.6862745, 1,
-0.04731489, -0.3393353, -1.575174, 0, 1, 0.6941177, 1,
-0.04674443, -0.1810198, -1.671772, 0, 1, 0.7019608, 1,
-0.04638408, -1.146886, -4.387399, 0, 1, 0.7058824, 1,
-0.04540736, 1.682459, 0.8308882, 0, 1, 0.7137255, 1,
-0.04515264, -0.6152494, -2.311562, 0, 1, 0.7176471, 1,
-0.04505776, 1.733056, -0.2030464, 0, 1, 0.7254902, 1,
-0.0369853, 0.5156724, 0.006531815, 0, 1, 0.7294118, 1,
-0.036258, -0.3531222, -4.757337, 0, 1, 0.7372549, 1,
-0.03216087, -2.043844, -2.650642, 0, 1, 0.7411765, 1,
-0.0293322, 1.062888, 2.293988, 0, 1, 0.7490196, 1,
-0.02691988, 1.411154, 0.5235246, 0, 1, 0.7529412, 1,
-0.0267808, -0.8763598, -3.773524, 0, 1, 0.7607843, 1,
-0.02614951, -0.2229876, -4.065544, 0, 1, 0.7647059, 1,
-0.0254548, -0.5754248, -3.875538, 0, 1, 0.772549, 1,
-0.02375579, -0.1434806, -4.053711, 0, 1, 0.7764706, 1,
-0.02228473, -1.794108, -1.265706, 0, 1, 0.7843137, 1,
-0.02175068, 0.4690596, 0.3460598, 0, 1, 0.7882353, 1,
-0.02154757, -1.236292, -2.104044, 0, 1, 0.7960784, 1,
-0.02121221, 0.4505062, -0.7048711, 0, 1, 0.8039216, 1,
-0.01885153, 1.140531, 0.441662, 0, 1, 0.8078431, 1,
-0.01849399, 0.07645203, 0.5746419, 0, 1, 0.8156863, 1,
-0.01597569, -0.5963064, -3.261514, 0, 1, 0.8196079, 1,
-0.01550983, 2.645786, -0.2463828, 0, 1, 0.827451, 1,
-0.01489586, -0.448161, -2.481288, 0, 1, 0.8313726, 1,
-0.01446582, -1.198594, -3.071183, 0, 1, 0.8392157, 1,
-0.01444277, 1.054061, 0.8843108, 0, 1, 0.8431373, 1,
-0.01366056, -2.330215, -4.056527, 0, 1, 0.8509804, 1,
-0.01299957, 2.554485, 0.3552727, 0, 1, 0.854902, 1,
-0.01176015, -1.10483, -3.033015, 0, 1, 0.8627451, 1,
-0.006305988, 0.5180393, 1.207692, 0, 1, 0.8666667, 1,
-0.006048019, 0.4520563, -1.302592, 0, 1, 0.8745098, 1,
-0.00417699, -1.448326, -2.900029, 0, 1, 0.8784314, 1,
-0.003931146, -0.1055448, -5.763026, 0, 1, 0.8862745, 1,
-0.001675921, -0.6343142, -2.16696, 0, 1, 0.8901961, 1,
-0.001142721, -0.1193589, -2.600725, 0, 1, 0.8980392, 1,
0.001475153, -0.9945229, 4.285703, 0, 1, 0.9058824, 1,
0.002760772, 0.7269041, -1.220694, 0, 1, 0.9098039, 1,
0.01049652, -1.507988, 3.291981, 0, 1, 0.9176471, 1,
0.01295182, 0.3690109, 0.1169504, 0, 1, 0.9215686, 1,
0.01572945, -1.799216, 2.289461, 0, 1, 0.9294118, 1,
0.02322237, -1.080149, 4.01399, 0, 1, 0.9333333, 1,
0.02322688, 0.1004004, -0.4799105, 0, 1, 0.9411765, 1,
0.02566037, 0.2406067, 1.988707, 0, 1, 0.945098, 1,
0.02569364, -0.323914, 4.306475, 0, 1, 0.9529412, 1,
0.02616894, 1.994265, 0.3606539, 0, 1, 0.9568627, 1,
0.02718132, -0.1550668, 4.394019, 0, 1, 0.9647059, 1,
0.03039424, -0.9595158, 2.321426, 0, 1, 0.9686275, 1,
0.03152293, -1.392371, 2.658968, 0, 1, 0.9764706, 1,
0.03314564, -2.462379, 4.625101, 0, 1, 0.9803922, 1,
0.03440133, 0.2120651, -1.968842, 0, 1, 0.9882353, 1,
0.03529286, 1.411976, 1.119453, 0, 1, 0.9921569, 1,
0.03693677, 0.3311897, 0.04702901, 0, 1, 1, 1,
0.04427551, -0.2923287, 0.9421889, 0, 0.9921569, 1, 1,
0.04595544, 1.212032, -1.111462, 0, 0.9882353, 1, 1,
0.05013981, 0.6026519, -1.358699, 0, 0.9803922, 1, 1,
0.05066438, 0.4169446, -0.2259894, 0, 0.9764706, 1, 1,
0.05635845, 0.5171243, -0.7748862, 0, 0.9686275, 1, 1,
0.05639677, 0.4098653, -1.830869, 0, 0.9647059, 1, 1,
0.05899102, 0.2736903, -1.213133, 0, 0.9568627, 1, 1,
0.06301718, -2.342808, 4.21488, 0, 0.9529412, 1, 1,
0.06511788, 0.6592445, -0.9469738, 0, 0.945098, 1, 1,
0.06664314, -0.007894452, 1.268043, 0, 0.9411765, 1, 1,
0.06782545, 1.59532, 1.793426, 0, 0.9333333, 1, 1,
0.07063855, 1.635742, 0.2785328, 0, 0.9294118, 1, 1,
0.07139441, -1.14271, 2.494838, 0, 0.9215686, 1, 1,
0.07237641, 0.6222354, 1.572205, 0, 0.9176471, 1, 1,
0.07744186, -1.5094, 3.985101, 0, 0.9098039, 1, 1,
0.07863692, -0.2277987, 3.005211, 0, 0.9058824, 1, 1,
0.07869931, -0.3077268, 1.817704, 0, 0.8980392, 1, 1,
0.07996082, 0.9681369, -0.9592868, 0, 0.8901961, 1, 1,
0.08208662, -0.6825998, 2.024501, 0, 0.8862745, 1, 1,
0.08417768, 1.318021, -0.03302994, 0, 0.8784314, 1, 1,
0.08437359, -0.3541009, 3.137966, 0, 0.8745098, 1, 1,
0.08651614, 1.134839, 0.1954447, 0, 0.8666667, 1, 1,
0.08771565, -1.206445, 2.971777, 0, 0.8627451, 1, 1,
0.08846551, -0.6877593, 2.309494, 0, 0.854902, 1, 1,
0.09467728, -0.451995, 1.539572, 0, 0.8509804, 1, 1,
0.09474856, 1.094074, -1.078004, 0, 0.8431373, 1, 1,
0.09622372, 0.05520594, 1.247066, 0, 0.8392157, 1, 1,
0.09754372, 0.9432393, -1.042577, 0, 0.8313726, 1, 1,
0.0979, 1.005567, -0.5804679, 0, 0.827451, 1, 1,
0.0985261, 0.9169101, 0.3495573, 0, 0.8196079, 1, 1,
0.1062626, 2.063047, 0.9307212, 0, 0.8156863, 1, 1,
0.106812, -0.2147368, 3.565366, 0, 0.8078431, 1, 1,
0.1071762, -0.8952109, 2.456297, 0, 0.8039216, 1, 1,
0.108349, 1.041755, -0.1918935, 0, 0.7960784, 1, 1,
0.1107315, 0.08986586, 1.519288, 0, 0.7882353, 1, 1,
0.1121304, 0.5962212, -0.1062702, 0, 0.7843137, 1, 1,
0.1169732, -0.1318419, 1.263492, 0, 0.7764706, 1, 1,
0.1175696, -0.5463955, 1.930568, 0, 0.772549, 1, 1,
0.1186965, 0.1246062, 0.3951723, 0, 0.7647059, 1, 1,
0.1227687, -0.306143, 2.531277, 0, 0.7607843, 1, 1,
0.1240003, 0.3344713, 0.3308017, 0, 0.7529412, 1, 1,
0.1248193, -0.6449888, 2.884854, 0, 0.7490196, 1, 1,
0.1265316, -0.1062879, 4.543158, 0, 0.7411765, 1, 1,
0.1316153, 0.8880891, 0.8424702, 0, 0.7372549, 1, 1,
0.1346152, 0.9009279, 0.8747047, 0, 0.7294118, 1, 1,
0.1362221, -0.7616777, 1.840647, 0, 0.7254902, 1, 1,
0.136668, 0.4301792, 0.479017, 0, 0.7176471, 1, 1,
0.1392057, 1.453451, -1.301364, 0, 0.7137255, 1, 1,
0.1440139, 0.5788821, 0.6009495, 0, 0.7058824, 1, 1,
0.1493402, 0.734942, -0.4074912, 0, 0.6980392, 1, 1,
0.1494137, 0.5641991, -1.669877, 0, 0.6941177, 1, 1,
0.1495622, -2.169295, 3.063867, 0, 0.6862745, 1, 1,
0.1528638, -1.468405, 3.105768, 0, 0.682353, 1, 1,
0.1531527, -0.02475791, 2.267005, 0, 0.6745098, 1, 1,
0.1531648, 0.8930545, -0.6114416, 0, 0.6705883, 1, 1,
0.1557054, 0.2159187, 1.863818, 0, 0.6627451, 1, 1,
0.1580618, -0.3010285, 3.572358, 0, 0.6588235, 1, 1,
0.1594441, 0.155872, 0.2459132, 0, 0.6509804, 1, 1,
0.1630322, -0.3937453, 3.423783, 0, 0.6470588, 1, 1,
0.165153, -0.3645848, 1.950829, 0, 0.6392157, 1, 1,
0.1659765, -0.2559807, 3.075995, 0, 0.6352941, 1, 1,
0.1665118, 1.17089, 0.7171808, 0, 0.627451, 1, 1,
0.1688207, 0.9075886, -0.1976632, 0, 0.6235294, 1, 1,
0.1712273, -1.121898, 1.24576, 0, 0.6156863, 1, 1,
0.1735369, -1.71156, 2.79435, 0, 0.6117647, 1, 1,
0.1768117, -0.3573923, 1.487288, 0, 0.6039216, 1, 1,
0.1772592, -0.07201514, 2.705271, 0, 0.5960785, 1, 1,
0.1789375, 0.4873354, -0.6935763, 0, 0.5921569, 1, 1,
0.18243, 0.06297208, 0.5751053, 0, 0.5843138, 1, 1,
0.187928, -0.7661121, 4.710972, 0, 0.5803922, 1, 1,
0.1891472, 2.26805, 0.1195551, 0, 0.572549, 1, 1,
0.1907898, 0.07196289, -0.128958, 0, 0.5686275, 1, 1,
0.1922383, 0.3972452, 0.2756967, 0, 0.5607843, 1, 1,
0.1933633, -0.932641, 3.211244, 0, 0.5568628, 1, 1,
0.195446, -0.4706755, 3.328476, 0, 0.5490196, 1, 1,
0.1970173, -0.7468479, 4.844216, 0, 0.5450981, 1, 1,
0.198293, 0.3543723, -0.8491972, 0, 0.5372549, 1, 1,
0.2031996, 0.5485754, 2.112648, 0, 0.5333334, 1, 1,
0.2088552, -0.3630011, 1.996373, 0, 0.5254902, 1, 1,
0.2128564, -1.171257, 2.438599, 0, 0.5215687, 1, 1,
0.2133214, 0.1554508, -0.1650244, 0, 0.5137255, 1, 1,
0.2133837, -0.7839879, 5.088446, 0, 0.509804, 1, 1,
0.2153333, 2.726517, 0.7901163, 0, 0.5019608, 1, 1,
0.2160675, -0.8431722, 2.092884, 0, 0.4941176, 1, 1,
0.2181128, 0.1935349, 0.6365725, 0, 0.4901961, 1, 1,
0.2186369, 0.5216882, -1.307355, 0, 0.4823529, 1, 1,
0.2193236, -0.5358051, 2.334142, 0, 0.4784314, 1, 1,
0.2197962, -1.123721, 3.865112, 0, 0.4705882, 1, 1,
0.2260623, 1.37805, 0.8143376, 0, 0.4666667, 1, 1,
0.2295065, 0.838958, 1.181077, 0, 0.4588235, 1, 1,
0.2324986, 1.408318, 2.223056, 0, 0.454902, 1, 1,
0.2350556, 1.456191, -0.8617136, 0, 0.4470588, 1, 1,
0.2351239, -0.8050829, 1.776671, 0, 0.4431373, 1, 1,
0.2363643, -0.6126653, 2.553637, 0, 0.4352941, 1, 1,
0.2464959, -0.5853808, 2.00968, 0, 0.4313726, 1, 1,
0.2476978, -0.1607422, -1.426513, 0, 0.4235294, 1, 1,
0.2480815, -0.892522, 2.833204, 0, 0.4196078, 1, 1,
0.2584768, 0.04833047, 2.073819, 0, 0.4117647, 1, 1,
0.2611147, 0.3730016, 0.5102841, 0, 0.4078431, 1, 1,
0.2685753, 2.031322, -0.5301554, 0, 0.4, 1, 1,
0.2688767, 1.23874, 0.146009, 0, 0.3921569, 1, 1,
0.2696036, -0.6023388, 2.062734, 0, 0.3882353, 1, 1,
0.2744362, 0.1063965, -2.290163, 0, 0.3803922, 1, 1,
0.2752655, -0.1018633, 0.6488914, 0, 0.3764706, 1, 1,
0.2783649, -0.6797517, 2.875329, 0, 0.3686275, 1, 1,
0.2816479, -1.94045, 3.104159, 0, 0.3647059, 1, 1,
0.2827504, 1.35467, 0.6058413, 0, 0.3568628, 1, 1,
0.2872507, 1.488678, -0.2073628, 0, 0.3529412, 1, 1,
0.2910111, -0.7824959, 1.307863, 0, 0.345098, 1, 1,
0.2926683, 0.5459607, -0.3992049, 0, 0.3411765, 1, 1,
0.2939965, -1.501828, 2.999246, 0, 0.3333333, 1, 1,
0.2955497, 0.7690654, 1.596482, 0, 0.3294118, 1, 1,
0.2989914, 0.8047078, -0.7218237, 0, 0.3215686, 1, 1,
0.302095, -0.3130621, 2.313604, 0, 0.3176471, 1, 1,
0.3022193, 1.159931, 0.1930733, 0, 0.3098039, 1, 1,
0.3022501, 0.5448868, 0.3173073, 0, 0.3058824, 1, 1,
0.3051193, 0.01319929, -0.2225836, 0, 0.2980392, 1, 1,
0.3102081, 0.3153301, 0.9926028, 0, 0.2901961, 1, 1,
0.3108252, -0.1689279, 2.812513, 0, 0.2862745, 1, 1,
0.314618, -0.187892, 3.161585, 0, 0.2784314, 1, 1,
0.3164833, -1.468756, 2.043085, 0, 0.2745098, 1, 1,
0.3169256, -0.5575579, 1.984559, 0, 0.2666667, 1, 1,
0.3182868, -0.9704515, 2.563499, 0, 0.2627451, 1, 1,
0.3186207, 2.217589, 0.1754638, 0, 0.254902, 1, 1,
0.3216141, -0.7274935, 1.926768, 0, 0.2509804, 1, 1,
0.3220929, 0.2368356, 0.4526083, 0, 0.2431373, 1, 1,
0.3256882, 0.09157883, 0.6671825, 0, 0.2392157, 1, 1,
0.3262255, 0.5944088, -1.953623, 0, 0.2313726, 1, 1,
0.3290994, 1.955542, -0.2782217, 0, 0.227451, 1, 1,
0.3317431, -0.1733, 3.621926, 0, 0.2196078, 1, 1,
0.3320429, -0.9888562, 2.652958, 0, 0.2156863, 1, 1,
0.3335423, 0.159336, 0.8236979, 0, 0.2078431, 1, 1,
0.33507, 1.217602, 1.166505, 0, 0.2039216, 1, 1,
0.33707, -0.01254879, 0.6470562, 0, 0.1960784, 1, 1,
0.3374695, -1.249982, 2.469806, 0, 0.1882353, 1, 1,
0.3394839, -1.162155, 0.8681632, 0, 0.1843137, 1, 1,
0.3403412, -0.1469627, 0.8812593, 0, 0.1764706, 1, 1,
0.3415884, -0.8035124, 3.2448, 0, 0.172549, 1, 1,
0.3426699, -1.137051, 1.954936, 0, 0.1647059, 1, 1,
0.3479387, 0.3950077, 2.392238, 0, 0.1607843, 1, 1,
0.3490053, 0.5354187, -0.4602499, 0, 0.1529412, 1, 1,
0.3531781, -1.329054, 1.990095, 0, 0.1490196, 1, 1,
0.3601466, -0.08673273, 0.8558947, 0, 0.1411765, 1, 1,
0.3606682, -2.368449, 4.236084, 0, 0.1372549, 1, 1,
0.3615655, -0.1921616, 2.9757, 0, 0.1294118, 1, 1,
0.3617182, -0.1120998, 2.033887, 0, 0.1254902, 1, 1,
0.3663306, -0.1528666, 1.070711, 0, 0.1176471, 1, 1,
0.369622, 0.5617039, 0.5274085, 0, 0.1137255, 1, 1,
0.3717736, -0.3653784, 0.826261, 0, 0.1058824, 1, 1,
0.3733899, -0.6522368, 3.663927, 0, 0.09803922, 1, 1,
0.3744106, -0.7728125, 1.807509, 0, 0.09411765, 1, 1,
0.3774868, -1.344362, 3.658017, 0, 0.08627451, 1, 1,
0.3776301, -0.2095584, 1.648069, 0, 0.08235294, 1, 1,
0.378842, -0.9789935, 2.496284, 0, 0.07450981, 1, 1,
0.3794039, -0.4658518, 2.806017, 0, 0.07058824, 1, 1,
0.3855059, -1.856782, 3.178313, 0, 0.0627451, 1, 1,
0.3868944, 0.9198426, 2.698189, 0, 0.05882353, 1, 1,
0.3872148, -0.7477928, 1.20621, 0, 0.05098039, 1, 1,
0.3925851, 1.271295, -1.307098, 0, 0.04705882, 1, 1,
0.3931131, 0.794793, -0.3105129, 0, 0.03921569, 1, 1,
0.3983884, -0.505018, 1.756969, 0, 0.03529412, 1, 1,
0.4008653, -0.2740323, 1.630234, 0, 0.02745098, 1, 1,
0.4012905, 1.017732, 0.1153917, 0, 0.02352941, 1, 1,
0.4045633, 1.020396, 0.8717427, 0, 0.01568628, 1, 1,
0.4078725, -0.5937115, 4.190504, 0, 0.01176471, 1, 1,
0.4083997, -0.9607989, 2.848958, 0, 0.003921569, 1, 1,
0.4127158, -0.2543992, 2.594842, 0.003921569, 0, 1, 1,
0.4138812, -3.182467, 3.012517, 0.007843138, 0, 1, 1,
0.414275, 0.6626563, 2.543377, 0.01568628, 0, 1, 1,
0.4191654, 1.348015, -0.04228469, 0.01960784, 0, 1, 1,
0.4224126, -1.774332, 1.72613, 0.02745098, 0, 1, 1,
0.4309346, -0.6030664, 0.7656135, 0.03137255, 0, 1, 1,
0.4320776, 0.9983575, -0.731756, 0.03921569, 0, 1, 1,
0.4408494, 0.8339481, 1.350098, 0.04313726, 0, 1, 1,
0.4447847, 1.390062, -0.3547669, 0.05098039, 0, 1, 1,
0.4453285, 0.09107185, 1.202683, 0.05490196, 0, 1, 1,
0.4488979, 0.9042849, 1.127775, 0.0627451, 0, 1, 1,
0.4518947, 2.561025, 1.718448, 0.06666667, 0, 1, 1,
0.452835, 0.7026845, -0.6514597, 0.07450981, 0, 1, 1,
0.4549849, 0.6070697, 0.4538365, 0.07843138, 0, 1, 1,
0.4552883, 0.09444808, 1.838751, 0.08627451, 0, 1, 1,
0.4570123, -0.5175452, 2.724759, 0.09019608, 0, 1, 1,
0.4626574, -0.3559138, 0.4048587, 0.09803922, 0, 1, 1,
0.4677839, 0.8321185, 3.117013, 0.1058824, 0, 1, 1,
0.4704343, -0.1514399, 1.369815, 0.1098039, 0, 1, 1,
0.470785, -0.9356167, 2.64387, 0.1176471, 0, 1, 1,
0.4736938, -0.04202214, 1.827704, 0.1215686, 0, 1, 1,
0.4788649, -0.1492529, 3.325953, 0.1294118, 0, 1, 1,
0.4879444, -0.6409746, 2.334955, 0.1333333, 0, 1, 1,
0.4919159, 0.3834059, -0.07858484, 0.1411765, 0, 1, 1,
0.4947424, 0.6004312, -0.3671044, 0.145098, 0, 1, 1,
0.4952637, 1.46871, -1.40707, 0.1529412, 0, 1, 1,
0.5032049, -1.197494, 1.144721, 0.1568628, 0, 1, 1,
0.5042191, 1.668372, 0.8330382, 0.1647059, 0, 1, 1,
0.5060292, -2.054829, 2.528724, 0.1686275, 0, 1, 1,
0.5083157, -1.069478, 1.671609, 0.1764706, 0, 1, 1,
0.5091642, 0.130737, 1.137401, 0.1803922, 0, 1, 1,
0.5096818, -0.0998341, 0.782981, 0.1882353, 0, 1, 1,
0.5167664, -1.358536, 5.230333, 0.1921569, 0, 1, 1,
0.5223469, 0.9873524, -0.1445266, 0.2, 0, 1, 1,
0.5231105, -0.384272, 2.298945, 0.2078431, 0, 1, 1,
0.5237929, -1.098289, 2.198642, 0.2117647, 0, 1, 1,
0.527947, -1.052329, 2.535665, 0.2196078, 0, 1, 1,
0.5285289, -0.204723, 1.389083, 0.2235294, 0, 1, 1,
0.5293887, -2.007255, 1.99333, 0.2313726, 0, 1, 1,
0.5323893, 0.1805431, -0.7206763, 0.2352941, 0, 1, 1,
0.5389464, 0.4524682, 0.3515254, 0.2431373, 0, 1, 1,
0.5458542, 1.484944, -0.5185022, 0.2470588, 0, 1, 1,
0.5512809, -1.277551, 4.099673, 0.254902, 0, 1, 1,
0.5539672, -1.282818, 2.473068, 0.2588235, 0, 1, 1,
0.5587084, -0.1262771, 1.67443, 0.2666667, 0, 1, 1,
0.5594141, 0.8312027, 1.8957, 0.2705882, 0, 1, 1,
0.5612947, -0.5619667, 2.773483, 0.2784314, 0, 1, 1,
0.5628384, 0.4304485, -1.120458, 0.282353, 0, 1, 1,
0.5654873, 1.218451, -1.364085, 0.2901961, 0, 1, 1,
0.5667936, -0.1564528, -0.5217295, 0.2941177, 0, 1, 1,
0.5669639, 0.2639929, 1.696209, 0.3019608, 0, 1, 1,
0.5737154, -0.296892, 2.621608, 0.3098039, 0, 1, 1,
0.5769773, -0.8203548, 1.682416, 0.3137255, 0, 1, 1,
0.5799049, -1.144746, 4.17511, 0.3215686, 0, 1, 1,
0.5896754, -0.4290754, 0.08960699, 0.3254902, 0, 1, 1,
0.594969, 0.3662548, 2.395464, 0.3333333, 0, 1, 1,
0.5967103, -0.5899587, 1.060229, 0.3372549, 0, 1, 1,
0.6015659, 0.3295659, 1.629156, 0.345098, 0, 1, 1,
0.6136903, 2.424364, -0.4937483, 0.3490196, 0, 1, 1,
0.6145879, -1.779216, 4.121413, 0.3568628, 0, 1, 1,
0.617494, 0.9824677, 1.916261, 0.3607843, 0, 1, 1,
0.6196685, -2.166175, 1.416815, 0.3686275, 0, 1, 1,
0.6224967, -1.727856, 3.869213, 0.372549, 0, 1, 1,
0.6250238, 0.405388, 2.281139, 0.3803922, 0, 1, 1,
0.6321498, 0.31362, 2.508085, 0.3843137, 0, 1, 1,
0.6349977, -0.4738639, 2.244625, 0.3921569, 0, 1, 1,
0.637941, -0.6232387, 4.68865, 0.3960784, 0, 1, 1,
0.6400055, -1.142542, 2.237119, 0.4039216, 0, 1, 1,
0.6408321, 0.3123296, 1.526691, 0.4117647, 0, 1, 1,
0.6444678, 0.06810657, 4.323243, 0.4156863, 0, 1, 1,
0.6452591, -0.2429398, 1.43877, 0.4235294, 0, 1, 1,
0.6488315, -0.1284861, 2.143871, 0.427451, 0, 1, 1,
0.6497111, 0.8579552, -0.5002618, 0.4352941, 0, 1, 1,
0.6517915, -1.470822, 1.239265, 0.4392157, 0, 1, 1,
0.655944, -1.329958, 2.426936, 0.4470588, 0, 1, 1,
0.6570258, -0.2094103, 1.540356, 0.4509804, 0, 1, 1,
0.6575659, 0.02103115, 3.244951, 0.4588235, 0, 1, 1,
0.6586531, -0.3704504, 1.055022, 0.4627451, 0, 1, 1,
0.6651763, 0.4889614, 0.1078456, 0.4705882, 0, 1, 1,
0.6706077, 2.337093, -1.687486, 0.4745098, 0, 1, 1,
0.6713861, 2.427254, 1.317821, 0.4823529, 0, 1, 1,
0.6788077, 0.3127515, 0.5405932, 0.4862745, 0, 1, 1,
0.6863173, 0.6536136, 0.2225238, 0.4941176, 0, 1, 1,
0.6875269, -0.996926, 3.044532, 0.5019608, 0, 1, 1,
0.7042284, -0.3057721, 3.620649, 0.5058824, 0, 1, 1,
0.7044827, -0.09972577, 3.03321, 0.5137255, 0, 1, 1,
0.7062513, 3.008885, 1.160012, 0.5176471, 0, 1, 1,
0.7096609, 1.047908, 0.3038607, 0.5254902, 0, 1, 1,
0.7129586, 0.03017499, 1.364974, 0.5294118, 0, 1, 1,
0.7132736, -0.2615641, 1.163951, 0.5372549, 0, 1, 1,
0.7163871, 1.428572, 0.07970537, 0.5411765, 0, 1, 1,
0.7169609, -0.7441483, 1.726452, 0.5490196, 0, 1, 1,
0.7234427, -0.2937927, 0.6230533, 0.5529412, 0, 1, 1,
0.7273326, 0.63955, -0.5357651, 0.5607843, 0, 1, 1,
0.7393951, 0.06734843, 2.223245, 0.5647059, 0, 1, 1,
0.7500052, 0.05690631, 2.380716, 0.572549, 0, 1, 1,
0.757278, -1.426666, 1.210525, 0.5764706, 0, 1, 1,
0.7626616, 0.007758252, 1.279687, 0.5843138, 0, 1, 1,
0.76315, -0.09633587, 1.235811, 0.5882353, 0, 1, 1,
0.7632018, 0.2495906, 2.645128, 0.5960785, 0, 1, 1,
0.7647994, 0.6729612, 0.806479, 0.6039216, 0, 1, 1,
0.766906, -1.070958, 0.960501, 0.6078432, 0, 1, 1,
0.769235, 1.854845, 0.5930989, 0.6156863, 0, 1, 1,
0.7786012, -0.4492981, 1.268965, 0.6196079, 0, 1, 1,
0.781446, -0.1040827, 1.685003, 0.627451, 0, 1, 1,
0.7882612, 0.478868, 0.2853101, 0.6313726, 0, 1, 1,
0.7904135, 0.6329988, 2.056679, 0.6392157, 0, 1, 1,
0.7946544, 1.134307, 0.4417826, 0.6431373, 0, 1, 1,
0.7958358, 0.2849156, 1.167267, 0.6509804, 0, 1, 1,
0.7978985, 1.29786, -0.6131158, 0.654902, 0, 1, 1,
0.799156, -1.234983, 2.410927, 0.6627451, 0, 1, 1,
0.8057554, 0.1824525, 1.267205, 0.6666667, 0, 1, 1,
0.8075079, -0.8025922, 3.415534, 0.6745098, 0, 1, 1,
0.8104714, -1.266599, 1.15547, 0.6784314, 0, 1, 1,
0.8105502, 0.8210142, 0.4879863, 0.6862745, 0, 1, 1,
0.8108754, -0.1953697, 0.02082315, 0.6901961, 0, 1, 1,
0.8129451, 0.09125528, 1.850212, 0.6980392, 0, 1, 1,
0.8172609, 1.377003, -0.6285405, 0.7058824, 0, 1, 1,
0.825363, 1.210502, -1.412182, 0.7098039, 0, 1, 1,
0.8308741, 0.4467014, 1.390356, 0.7176471, 0, 1, 1,
0.8351681, 0.2295667, 1.53967, 0.7215686, 0, 1, 1,
0.8442639, 0.4204655, 2.366982, 0.7294118, 0, 1, 1,
0.8493249, -1.240139, 3.549675, 0.7333333, 0, 1, 1,
0.8624108, 0.1646218, 3.579006, 0.7411765, 0, 1, 1,
0.8625102, 1.049252, 0.9502493, 0.7450981, 0, 1, 1,
0.8633184, -0.3662906, 1.822795, 0.7529412, 0, 1, 1,
0.8656152, -1.372865, 2.351723, 0.7568628, 0, 1, 1,
0.8684658, -0.7681348, 2.256088, 0.7647059, 0, 1, 1,
0.8689826, 2.830273, -0.7095053, 0.7686275, 0, 1, 1,
0.8699741, 1.39436, 0.06394193, 0.7764706, 0, 1, 1,
0.8766289, -1.725785, 3.828141, 0.7803922, 0, 1, 1,
0.8768899, 0.6958091, 0.6154705, 0.7882353, 0, 1, 1,
0.8818997, -0.5084572, 3.320647, 0.7921569, 0, 1, 1,
0.8827131, -0.3025379, 2.02937, 0.8, 0, 1, 1,
0.8862879, -2.237774, 1.713635, 0.8078431, 0, 1, 1,
0.8867962, 1.381652, -0.09150098, 0.8117647, 0, 1, 1,
0.8904615, -0.9341096, 2.710115, 0.8196079, 0, 1, 1,
0.8941355, -1.764978, 2.603076, 0.8235294, 0, 1, 1,
0.8952043, -0.8049959, 4.537124, 0.8313726, 0, 1, 1,
0.8990705, -0.4133801, 0.9279002, 0.8352941, 0, 1, 1,
0.9005525, 0.301998, 2.120882, 0.8431373, 0, 1, 1,
0.911337, -0.3686785, 2.62923, 0.8470588, 0, 1, 1,
0.9148724, 0.4887571, 0.6134706, 0.854902, 0, 1, 1,
0.9196909, -0.1087541, 0.1853814, 0.8588235, 0, 1, 1,
0.9215766, 0.101193, 1.648955, 0.8666667, 0, 1, 1,
0.9228945, 0.6022899, -0.535769, 0.8705882, 0, 1, 1,
0.9248414, 0.5188903, 1.361904, 0.8784314, 0, 1, 1,
0.9283581, 0.01594661, 0.481261, 0.8823529, 0, 1, 1,
0.9398118, -0.615899, 2.022661, 0.8901961, 0, 1, 1,
0.9407623, -0.5147973, 2.092103, 0.8941177, 0, 1, 1,
0.9482301, -0.9610316, 0.4761951, 0.9019608, 0, 1, 1,
0.9564982, -0.06348805, -0.2025692, 0.9098039, 0, 1, 1,
0.9702058, -0.6628414, 0.9202607, 0.9137255, 0, 1, 1,
0.9712492, 0.219517, 0.6379509, 0.9215686, 0, 1, 1,
0.9738526, 1.012851, 0.4737208, 0.9254902, 0, 1, 1,
0.9785713, 0.5606859, 1.151138, 0.9333333, 0, 1, 1,
0.9806032, 0.1559058, 1.210532, 0.9372549, 0, 1, 1,
0.9811175, 0.6611023, 1.494147, 0.945098, 0, 1, 1,
0.9825341, -1.080942, 3.727139, 0.9490196, 0, 1, 1,
0.9833145, 0.8447163, 1.580033, 0.9568627, 0, 1, 1,
0.9856755, 1.825845, 0.1228266, 0.9607843, 0, 1, 1,
0.9868698, -0.2581249, 2.546017, 0.9686275, 0, 1, 1,
0.9886076, -0.7764762, 3.404459, 0.972549, 0, 1, 1,
0.9977093, -0.09711108, 2.555566, 0.9803922, 0, 1, 1,
1.000462, 0.8923315, 1.086771, 0.9843137, 0, 1, 1,
1.008334, -0.8323566, 3.643083, 0.9921569, 0, 1, 1,
1.017035, 0.9141949, 0.9815316, 0.9960784, 0, 1, 1,
1.019938, -1.146458, 1.063434, 1, 0, 0.9960784, 1,
1.020891, 1.529538, -0.2372946, 1, 0, 0.9882353, 1,
1.030472, -1.406418, 1.647261, 1, 0, 0.9843137, 1,
1.039254, -0.04812093, 2.459522, 1, 0, 0.9764706, 1,
1.045554, 1.139387, 0.3029214, 1, 0, 0.972549, 1,
1.064564, 0.3990052, 0.3176018, 1, 0, 0.9647059, 1,
1.070901, 0.03792822, 1.156289, 1, 0, 0.9607843, 1,
1.07742, -0.7962996, 2.394084, 1, 0, 0.9529412, 1,
1.077816, 0.6852519, 0.3439878, 1, 0, 0.9490196, 1,
1.079092, -0.9759263, 3.071575, 1, 0, 0.9411765, 1,
1.080787, -0.585894, 1.648317, 1, 0, 0.9372549, 1,
1.081311, 0.1463637, 1.242802, 1, 0, 0.9294118, 1,
1.08326, -1.490507, 3.013036, 1, 0, 0.9254902, 1,
1.089091, 0.9524446, 1.292199, 1, 0, 0.9176471, 1,
1.093866, -0.178218, 2.30161, 1, 0, 0.9137255, 1,
1.094683, 2.1912, 0.1956762, 1, 0, 0.9058824, 1,
1.095175, -1.180019, 2.100239, 1, 0, 0.9019608, 1,
1.0982, 2.147114, 0.5863945, 1, 0, 0.8941177, 1,
1.106689, -0.03025606, 0.007327588, 1, 0, 0.8862745, 1,
1.121522, 0.3903922, 2.092202, 1, 0, 0.8823529, 1,
1.121804, -0.1137962, 2.086789, 1, 0, 0.8745098, 1,
1.123159, 2.382876, -0.3278626, 1, 0, 0.8705882, 1,
1.1246, -1.37236, 5.305597, 1, 0, 0.8627451, 1,
1.124963, -0.02185891, 2.964363, 1, 0, 0.8588235, 1,
1.144479, 0.8457655, 0.4838086, 1, 0, 0.8509804, 1,
1.149366, 1.981056, -0.6081274, 1, 0, 0.8470588, 1,
1.151205, 0.6154751, 1.118075, 1, 0, 0.8392157, 1,
1.152913, 0.4794166, 0.6334314, 1, 0, 0.8352941, 1,
1.154389, 2.749018, -0.1605201, 1, 0, 0.827451, 1,
1.158056, -0.5174243, 1.348354, 1, 0, 0.8235294, 1,
1.159206, -0.8040779, 2.053237, 1, 0, 0.8156863, 1,
1.164914, -0.6170826, 1.565243, 1, 0, 0.8117647, 1,
1.168175, -1.406723, 2.257367, 1, 0, 0.8039216, 1,
1.17037, -0.240899, 1.105603, 1, 0, 0.7960784, 1,
1.172027, -1.002087, 2.185211, 1, 0, 0.7921569, 1,
1.175347, -0.9173883, 2.781458, 1, 0, 0.7843137, 1,
1.177241, 0.5887803, 2.409889, 1, 0, 0.7803922, 1,
1.182065, 0.798375, 0.9719238, 1, 0, 0.772549, 1,
1.207636, -1.569282, 2.630957, 1, 0, 0.7686275, 1,
1.212172, -0.8853137, 1.708251, 1, 0, 0.7607843, 1,
1.221589, 1.758768, -0.8288727, 1, 0, 0.7568628, 1,
1.221823, 1.248385, 0.2449737, 1, 0, 0.7490196, 1,
1.224573, -0.6256286, 2.403651, 1, 0, 0.7450981, 1,
1.241048, -0.04251811, 1.407642, 1, 0, 0.7372549, 1,
1.254526, -0.6348953, 2.8568, 1, 0, 0.7333333, 1,
1.25771, 0.4225221, 1.128313, 1, 0, 0.7254902, 1,
1.260519, 1.598077, 1.959957, 1, 0, 0.7215686, 1,
1.263952, 0.02741823, 1.520224, 1, 0, 0.7137255, 1,
1.267939, -0.5911957, 3.546051, 1, 0, 0.7098039, 1,
1.279116, -0.06692078, 2.409063, 1, 0, 0.7019608, 1,
1.283974, 1.273851, 0.7453294, 1, 0, 0.6941177, 1,
1.284042, 0.4825784, 0.690347, 1, 0, 0.6901961, 1,
1.288884, -0.3853978, 2.492149, 1, 0, 0.682353, 1,
1.289791, 2.167386, 1.038798, 1, 0, 0.6784314, 1,
1.302025, 1.011347, 0.5732732, 1, 0, 0.6705883, 1,
1.306249, -0.0008331261, 0.6026601, 1, 0, 0.6666667, 1,
1.318167, 0.1269331, 1.597184, 1, 0, 0.6588235, 1,
1.31933, -1.750598, 1.329733, 1, 0, 0.654902, 1,
1.320083, 1.288386, 0.9989271, 1, 0, 0.6470588, 1,
1.324519, 0.1921613, 0.8102319, 1, 0, 0.6431373, 1,
1.333467, -0.2176629, 1.559767, 1, 0, 0.6352941, 1,
1.334034, -0.7932368, 0.9119657, 1, 0, 0.6313726, 1,
1.335814, -0.4323777, 2.369639, 1, 0, 0.6235294, 1,
1.338739, 0.6924537, 1.661172, 1, 0, 0.6196079, 1,
1.342404, -0.2321442, 1.568014, 1, 0, 0.6117647, 1,
1.348674, -0.4359635, 3.64046, 1, 0, 0.6078432, 1,
1.357865, 0.08257165, 1.753634, 1, 0, 0.6, 1,
1.370069, -0.2403225, 1.012476, 1, 0, 0.5921569, 1,
1.374803, 1.384496, 0.4098317, 1, 0, 0.5882353, 1,
1.377132, -1.186122, 3.243898, 1, 0, 0.5803922, 1,
1.377917, -0.1422935, 3.759547, 1, 0, 0.5764706, 1,
1.379097, 0.2125123, 1.066013, 1, 0, 0.5686275, 1,
1.382983, 0.3992159, 1.252566, 1, 0, 0.5647059, 1,
1.386802, 0.2088207, 1.569525, 1, 0, 0.5568628, 1,
1.387852, -0.222372, 1.700563, 1, 0, 0.5529412, 1,
1.38994, -0.02804709, 0.7948862, 1, 0, 0.5450981, 1,
1.396472, -1.61908, 1.148125, 1, 0, 0.5411765, 1,
1.401804, -1.403077, 2.380756, 1, 0, 0.5333334, 1,
1.403832, 1.721952, 1.503973, 1, 0, 0.5294118, 1,
1.405761, -0.4489915, 3.064019, 1, 0, 0.5215687, 1,
1.408732, 1.165929, 1.548789, 1, 0, 0.5176471, 1,
1.412671, 0.2073013, 1.475551, 1, 0, 0.509804, 1,
1.414056, 0.3000872, 1.953949, 1, 0, 0.5058824, 1,
1.436216, 1.638744, 1.104743, 1, 0, 0.4980392, 1,
1.437317, -1.214326, 1.75562, 1, 0, 0.4901961, 1,
1.465362, 0.2174934, -0.291075, 1, 0, 0.4862745, 1,
1.4726, -0.2269255, 0.8983989, 1, 0, 0.4784314, 1,
1.494094, 3.420288, 0.5553482, 1, 0, 0.4745098, 1,
1.505011, 0.8571177, 1.38685, 1, 0, 0.4666667, 1,
1.506112, -0.9940199, 2.997319, 1, 0, 0.4627451, 1,
1.510504, 1.050846, 0.9701719, 1, 0, 0.454902, 1,
1.515904, 0.7144092, 2.03644, 1, 0, 0.4509804, 1,
1.525156, 0.6338017, 2.004333, 1, 0, 0.4431373, 1,
1.526193, -2.526142, 2.431784, 1, 0, 0.4392157, 1,
1.527763, 0.1163284, 1.186185, 1, 0, 0.4313726, 1,
1.528027, 0.2001663, 1.038368, 1, 0, 0.427451, 1,
1.551409, 0.4386403, 2.047632, 1, 0, 0.4196078, 1,
1.562848, 0.4438332, 0.5989207, 1, 0, 0.4156863, 1,
1.577225, 0.5593707, 3.040081, 1, 0, 0.4078431, 1,
1.578631, -1.711931, 2.317144, 1, 0, 0.4039216, 1,
1.586546, -1.253085, 4.595383, 1, 0, 0.3960784, 1,
1.598879, 0.4139949, 1.632832, 1, 0, 0.3882353, 1,
1.599034, 0.8774667, 0.6261919, 1, 0, 0.3843137, 1,
1.601255, 0.1039584, 2.014662, 1, 0, 0.3764706, 1,
1.607975, -0.5351274, 1.529065, 1, 0, 0.372549, 1,
1.61457, 0.6468107, 0.4860512, 1, 0, 0.3647059, 1,
1.625879, 0.4056757, 1.257651, 1, 0, 0.3607843, 1,
1.632335, 0.08612194, -1.26758, 1, 0, 0.3529412, 1,
1.633614, 0.191946, 2.011885, 1, 0, 0.3490196, 1,
1.645718, 0.5292677, 0.7280929, 1, 0, 0.3411765, 1,
1.646063, 0.5900323, 2.065176, 1, 0, 0.3372549, 1,
1.648199, -0.9247691, 1.177322, 1, 0, 0.3294118, 1,
1.655035, -0.310851, -0.1445788, 1, 0, 0.3254902, 1,
1.661252, 0.4634841, 2.650385, 1, 0, 0.3176471, 1,
1.667151, -0.1572526, 0.02569716, 1, 0, 0.3137255, 1,
1.677505, -0.09533522, 3.270953, 1, 0, 0.3058824, 1,
1.683411, -1.087847, 1.765251, 1, 0, 0.2980392, 1,
1.688309, 0.7278385, 0.8733064, 1, 0, 0.2941177, 1,
1.693921, 1.520386, -0.01694378, 1, 0, 0.2862745, 1,
1.699638, 0.1252592, 1.318733, 1, 0, 0.282353, 1,
1.699951, -1.005732, 0.01427047, 1, 0, 0.2745098, 1,
1.707312, 0.04894637, 3.523342, 1, 0, 0.2705882, 1,
1.720207, 0.1955831, 1.268123, 1, 0, 0.2627451, 1,
1.73026, 0.2562734, -0.04553238, 1, 0, 0.2588235, 1,
1.742902, 0.1808857, 1.708036, 1, 0, 0.2509804, 1,
1.757174, 0.5013936, 2.350415, 1, 0, 0.2470588, 1,
1.806504, -1.507443, 1.526847, 1, 0, 0.2392157, 1,
1.807738, -0.5581262, 1.458785, 1, 0, 0.2352941, 1,
1.809262, -1.218185, 3.028254, 1, 0, 0.227451, 1,
1.816855, -1.292078, 3.197773, 1, 0, 0.2235294, 1,
1.838444, -0.8780451, 1.722958, 1, 0, 0.2156863, 1,
1.842806, -0.4565367, 1.566499, 1, 0, 0.2117647, 1,
1.849277, -0.5640317, 1.302821, 1, 0, 0.2039216, 1,
1.863523, 1.582973, -0.1941075, 1, 0, 0.1960784, 1,
1.866309, -0.09662513, 1.24361, 1, 0, 0.1921569, 1,
1.876793, -0.689584, 0.6018556, 1, 0, 0.1843137, 1,
1.892776, 0.4840977, 1.162148, 1, 0, 0.1803922, 1,
1.901635, 0.5398521, -0.6094722, 1, 0, 0.172549, 1,
1.914002, -0.7047517, 0.8460215, 1, 0, 0.1686275, 1,
1.928024, -1.264629, 4.192773, 1, 0, 0.1607843, 1,
1.929099, -0.6272731, 3.862149, 1, 0, 0.1568628, 1,
1.929208, -0.7352268, 2.334895, 1, 0, 0.1490196, 1,
1.932981, 0.8570349, -0.7919164, 1, 0, 0.145098, 1,
1.94647, -0.2529397, 2.438953, 1, 0, 0.1372549, 1,
1.967144, -1.111822, 1.438327, 1, 0, 0.1333333, 1,
2.000155, -1.122908, 1.688027, 1, 0, 0.1254902, 1,
2.014843, -1.593122, 2.423781, 1, 0, 0.1215686, 1,
2.02278, 0.9862529, 2.07789, 1, 0, 0.1137255, 1,
2.037475, -1.235925, 0.4488939, 1, 0, 0.1098039, 1,
2.056573, -0.7322966, 1.444024, 1, 0, 0.1019608, 1,
2.057691, 1.018836, 1.284785, 1, 0, 0.09411765, 1,
2.065306, -1.190369, 3.390458, 1, 0, 0.09019608, 1,
2.076243, 2.139035, 1.532258, 1, 0, 0.08235294, 1,
2.125497, -1.24106, 1.041221, 1, 0, 0.07843138, 1,
2.132547, 0.8055869, 0.1584284, 1, 0, 0.07058824, 1,
2.161223, -1.303589, 5.187118, 1, 0, 0.06666667, 1,
2.20286, -0.4544027, 2.276349, 1, 0, 0.05882353, 1,
2.246448, 0.3697904, 1.317753, 1, 0, 0.05490196, 1,
2.314465, 0.7421089, 1.794049, 1, 0, 0.04705882, 1,
2.319353, -0.746934, 0.06797751, 1, 0, 0.04313726, 1,
2.404656, -0.02130136, -0.5258599, 1, 0, 0.03529412, 1,
2.427205, -1.11144, 3.282967, 1, 0, 0.03137255, 1,
2.435358, 0.6649264, 1.455414, 1, 0, 0.02352941, 1,
2.529714, -1.570241, 1.569973, 1, 0, 0.01960784, 1,
2.599463, -0.899761, 0.7970409, 1, 0, 0.01176471, 1,
3.186901, 1.519961, -0.2455861, 1, 0, 0.007843138, 1
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
-0.08968878, -4.337937, -7.639158, 0, -0.5, 0.5, 0.5,
-0.08968878, -4.337937, -7.639158, 1, -0.5, 0.5, 0.5,
-0.08968878, -4.337937, -7.639158, 1, 1.5, 0.5, 0.5,
-0.08968878, -4.337937, -7.639158, 0, 1.5, 0.5, 0.5
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
-4.477042, 0.2260004, -7.639158, 0, -0.5, 0.5, 0.5,
-4.477042, 0.2260004, -7.639158, 1, -0.5, 0.5, 0.5,
-4.477042, 0.2260004, -7.639158, 1, 1.5, 0.5, 0.5,
-4.477042, 0.2260004, -7.639158, 0, 1.5, 0.5, 0.5
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
-4.477042, -4.337937, -0.2287145, 0, -0.5, 0.5, 0.5,
-4.477042, -4.337937, -0.2287145, 1, -0.5, 0.5, 0.5,
-4.477042, -4.337937, -0.2287145, 1, 1.5, 0.5, 0.5,
-4.477042, -4.337937, -0.2287145, 0, 1.5, 0.5, 0.5
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
-3, -3.28472, -5.929056,
3, -3.28472, -5.929056,
-3, -3.28472, -5.929056,
-3, -3.460257, -6.214073,
-2, -3.28472, -5.929056,
-2, -3.460257, -6.214073,
-1, -3.28472, -5.929056,
-1, -3.460257, -6.214073,
0, -3.28472, -5.929056,
0, -3.460257, -6.214073,
1, -3.28472, -5.929056,
1, -3.460257, -6.214073,
2, -3.28472, -5.929056,
2, -3.460257, -6.214073,
3, -3.28472, -5.929056,
3, -3.460257, -6.214073
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
-3, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
-3, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
-3, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
-3, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
-2, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
-2, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
-2, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
-2, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
-1, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
-1, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
-1, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
-1, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
0, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
0, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
0, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
0, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
1, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
1, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
1, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
1, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
2, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
2, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
2, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
2, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5,
3, -3.811329, -6.784107, 0, -0.5, 0.5, 0.5,
3, -3.811329, -6.784107, 1, -0.5, 0.5, 0.5,
3, -3.811329, -6.784107, 1, 1.5, 0.5, 0.5,
3, -3.811329, -6.784107, 0, 1.5, 0.5, 0.5
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
-3.464576, -3, -5.929056,
-3.464576, 3, -5.929056,
-3.464576, -3, -5.929056,
-3.633321, -3, -6.214073,
-3.464576, -2, -5.929056,
-3.633321, -2, -6.214073,
-3.464576, -1, -5.929056,
-3.633321, -1, -6.214073,
-3.464576, 0, -5.929056,
-3.633321, 0, -6.214073,
-3.464576, 1, -5.929056,
-3.633321, 1, -6.214073,
-3.464576, 2, -5.929056,
-3.633321, 2, -6.214073,
-3.464576, 3, -5.929056,
-3.633321, 3, -6.214073
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
-3.970809, -3, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, -3, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, -3, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, -3, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, -2, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, -2, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, -2, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, -2, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, -1, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, -1, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, -1, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, -1, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, 0, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, 0, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, 0, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, 0, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, 1, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, 1, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, 1, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, 1, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, 2, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, 2, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, 2, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, 2, -6.784107, 0, 1.5, 0.5, 0.5,
-3.970809, 3, -6.784107, 0, -0.5, 0.5, 0.5,
-3.970809, 3, -6.784107, 1, -0.5, 0.5, 0.5,
-3.970809, 3, -6.784107, 1, 1.5, 0.5, 0.5,
-3.970809, 3, -6.784107, 0, 1.5, 0.5, 0.5
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
-3.464576, -3.28472, -4,
-3.464576, -3.28472, 4,
-3.464576, -3.28472, -4,
-3.633321, -3.460257, -4,
-3.464576, -3.28472, -2,
-3.633321, -3.460257, -2,
-3.464576, -3.28472, 0,
-3.633321, -3.460257, 0,
-3.464576, -3.28472, 2,
-3.633321, -3.460257, 2,
-3.464576, -3.28472, 4,
-3.633321, -3.460257, 4
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
-3.970809, -3.811329, -4, 0, -0.5, 0.5, 0.5,
-3.970809, -3.811329, -4, 1, -0.5, 0.5, 0.5,
-3.970809, -3.811329, -4, 1, 1.5, 0.5, 0.5,
-3.970809, -3.811329, -4, 0, 1.5, 0.5, 0.5,
-3.970809, -3.811329, -2, 0, -0.5, 0.5, 0.5,
-3.970809, -3.811329, -2, 1, -0.5, 0.5, 0.5,
-3.970809, -3.811329, -2, 1, 1.5, 0.5, 0.5,
-3.970809, -3.811329, -2, 0, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 0, 0, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 0, 1, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 0, 1, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 0, 0, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 2, 0, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 2, 1, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 2, 1, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 2, 0, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 4, 0, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 4, 1, -0.5, 0.5, 0.5,
-3.970809, -3.811329, 4, 1, 1.5, 0.5, 0.5,
-3.970809, -3.811329, 4, 0, 1.5, 0.5, 0.5
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
-3.464576, -3.28472, -5.929056,
-3.464576, 3.736721, -5.929056,
-3.464576, -3.28472, 5.471627,
-3.464576, 3.736721, 5.471627,
-3.464576, -3.28472, -5.929056,
-3.464576, -3.28472, 5.471627,
-3.464576, 3.736721, -5.929056,
-3.464576, 3.736721, 5.471627,
-3.464576, -3.28472, -5.929056,
3.285198, -3.28472, -5.929056,
-3.464576, -3.28472, 5.471627,
3.285198, -3.28472, 5.471627,
-3.464576, 3.736721, -5.929056,
3.285198, 3.736721, -5.929056,
-3.464576, 3.736721, 5.471627,
3.285198, 3.736721, 5.471627,
3.285198, -3.28472, -5.929056,
3.285198, 3.736721, -5.929056,
3.285198, -3.28472, 5.471627,
3.285198, 3.736721, 5.471627,
3.285198, -3.28472, -5.929056,
3.285198, -3.28472, 5.471627,
3.285198, 3.736721, -5.929056,
3.285198, 3.736721, 5.471627
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
var radius = 8.006783;
var distance = 35.62308;
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
mvMatrix.translate( 0.08968878, -0.2260004, 0.2287145 );
mvMatrix.scale( 1.282575, 1.232951, 0.7593485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62308);
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
propane<-read.table("propane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propane$V2
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
```

```r
y<-propane$V3
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
```

```r
z<-propane$V4
```

```
## Error in eval(expr, envir, enclos): object 'propane' not found
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
-3.366278, -0.2025403, -1.735826, 0, 0, 1, 1, 1,
-3.204193, -0.1135491, -0.8820419, 1, 0, 0, 1, 1,
-2.771644, 0.247482, -3.244967, 1, 0, 0, 1, 1,
-2.625496, 1.268011, -0.9779752, 1, 0, 0, 1, 1,
-2.599246, -0.5680532, -1.443004, 1, 0, 0, 1, 1,
-2.50028, -0.1634649, -1.084695, 1, 0, 0, 1, 1,
-2.44645, -0.91077, -1.976958, 0, 0, 0, 1, 1,
-2.43819, -1.102199, -1.399392, 0, 0, 0, 1, 1,
-2.390587, -2.014128, -2.639179, 0, 0, 0, 1, 1,
-2.334392, 0.3648097, -0.9771526, 0, 0, 0, 1, 1,
-2.307356, -1.119408, -0.239597, 0, 0, 0, 1, 1,
-2.244578, 0.3728086, 0.08177364, 0, 0, 0, 1, 1,
-2.212935, 1.550588, 1.583813, 0, 0, 0, 1, 1,
-2.203965, -1.310381, -2.799923, 1, 1, 1, 1, 1,
-2.195299, 0.7150207, -2.046875, 1, 1, 1, 1, 1,
-2.187232, 1.501188, -2.611331, 1, 1, 1, 1, 1,
-2.147975, -0.5527099, -1.215034, 1, 1, 1, 1, 1,
-2.136698, -0.4302427, -0.4754117, 1, 1, 1, 1, 1,
-2.122913, 0.1613983, -0.6862975, 1, 1, 1, 1, 1,
-2.112007, -0.383777, -1.814293, 1, 1, 1, 1, 1,
-2.092644, -0.1256486, -3.102068, 1, 1, 1, 1, 1,
-2.085576, -1.133797, -1.264609, 1, 1, 1, 1, 1,
-2.050174, -1.108241, -1.496069, 1, 1, 1, 1, 1,
-2.04413, -0.2339568, -2.908128, 1, 1, 1, 1, 1,
-2.008017, -0.3169065, -1.960901, 1, 1, 1, 1, 1,
-1.982788, 0.09182839, -1.729569, 1, 1, 1, 1, 1,
-1.982358, 0.1374065, -1.224882, 1, 1, 1, 1, 1,
-1.95055, -0.1640165, -0.222661, 1, 1, 1, 1, 1,
-1.944603, 1.014053, 0.6328323, 0, 0, 1, 1, 1,
-1.942623, 1.602728, 1.000344, 1, 0, 0, 1, 1,
-1.918801, 0.4456741, -2.16765, 1, 0, 0, 1, 1,
-1.917419, 1.836398, -1.656384, 1, 0, 0, 1, 1,
-1.900429, 1.134977, -0.665607, 1, 0, 0, 1, 1,
-1.864598, 0.5656272, -1.256407, 1, 0, 0, 1, 1,
-1.859661, 0.3747758, -1.122541, 0, 0, 0, 1, 1,
-1.850867, 0.5055236, -2.006688, 0, 0, 0, 1, 1,
-1.843538, 1.003256, -2.180925, 0, 0, 0, 1, 1,
-1.814209, 1.499908, 0.8437628, 0, 0, 0, 1, 1,
-1.780564, -0.276773, -1.883412, 0, 0, 0, 1, 1,
-1.770347, -0.8358769, -2.390532, 0, 0, 0, 1, 1,
-1.756705, 0.8671539, -1.310011, 0, 0, 0, 1, 1,
-1.756451, -0.7641928, -2.617561, 1, 1, 1, 1, 1,
-1.738506, 0.2089046, -0.05801301, 1, 1, 1, 1, 1,
-1.73621, 1.064324, -0.03996904, 1, 1, 1, 1, 1,
-1.73042, 0.4966571, 0.1977395, 1, 1, 1, 1, 1,
-1.725813, 0.6476817, -0.2050322, 1, 1, 1, 1, 1,
-1.718459, -1.136676, -1.257585, 1, 1, 1, 1, 1,
-1.714821, -0.3054425, -1.393479, 1, 1, 1, 1, 1,
-1.707506, -0.1275213, -1.778335, 1, 1, 1, 1, 1,
-1.694329, -1.398215, -2.803425, 1, 1, 1, 1, 1,
-1.693865, 0.2078474, -1.952771, 1, 1, 1, 1, 1,
-1.679159, 1.795641, -0.5917024, 1, 1, 1, 1, 1,
-1.672883, 2.928264, -0.9445927, 1, 1, 1, 1, 1,
-1.663225, 1.975826, -0.6317922, 1, 1, 1, 1, 1,
-1.656412, -0.5745159, -1.921728, 1, 1, 1, 1, 1,
-1.64674, 0.4560933, 0.224848, 1, 1, 1, 1, 1,
-1.63371, 0.8130059, -1.127219, 0, 0, 1, 1, 1,
-1.629588, -0.2210095, -1.919544, 1, 0, 0, 1, 1,
-1.627838, 1.134997, -2.637793, 1, 0, 0, 1, 1,
-1.626232, 1.629024, 0.7035706, 1, 0, 0, 1, 1,
-1.626219, -0.6199157, -1.981468, 1, 0, 0, 1, 1,
-1.579165, 0.3607961, -2.06388, 1, 0, 0, 1, 1,
-1.561447, 0.07431067, -1.15286, 0, 0, 0, 1, 1,
-1.560611, 0.3657094, -2.176767, 0, 0, 0, 1, 1,
-1.5599, 1.49487, -2.623182, 0, 0, 0, 1, 1,
-1.545962, 1.12249, -1.258282, 0, 0, 0, 1, 1,
-1.51967, 0.08322729, 0.010936, 0, 0, 0, 1, 1,
-1.517555, -0.2253741, -0.6626987, 0, 0, 0, 1, 1,
-1.512806, 0.07023372, -0.4928919, 0, 0, 0, 1, 1,
-1.504978, -0.4284224, -3.188252, 1, 1, 1, 1, 1,
-1.504046, -1.591581, -3.325363, 1, 1, 1, 1, 1,
-1.50385, -1.321983, -2.313674, 1, 1, 1, 1, 1,
-1.503593, 1.295445, -0.2851458, 1, 1, 1, 1, 1,
-1.491961, -0.1796097, -1.737763, 1, 1, 1, 1, 1,
-1.487545, 0.1514098, -1.165119, 1, 1, 1, 1, 1,
-1.478455, -1.074662, -2.49052, 1, 1, 1, 1, 1,
-1.472569, 2.141405, 0.6846153, 1, 1, 1, 1, 1,
-1.454478, -1.468188, -3.544575, 1, 1, 1, 1, 1,
-1.446426, 1.179392, -1.332881, 1, 1, 1, 1, 1,
-1.438417, 0.5231636, 0.5166427, 1, 1, 1, 1, 1,
-1.437643, -0.6394386, -1.230256, 1, 1, 1, 1, 1,
-1.431172, 0.5024508, -2.037912, 1, 1, 1, 1, 1,
-1.424989, 0.668225, 1.961999, 1, 1, 1, 1, 1,
-1.419386, 0.971654, 0.1049282, 1, 1, 1, 1, 1,
-1.409692, -0.09417548, -2.528911, 0, 0, 1, 1, 1,
-1.40737, 0.1031794, -3.577456, 1, 0, 0, 1, 1,
-1.387944, -1.013112, -1.640476, 1, 0, 0, 1, 1,
-1.384443, -1.241547, -1.994775, 1, 0, 0, 1, 1,
-1.376654, 0.06917933, -1.9773, 1, 0, 0, 1, 1,
-1.376016, -0.3754573, -4.349181, 1, 0, 0, 1, 1,
-1.371058, 0.4013562, -0.586525, 0, 0, 0, 1, 1,
-1.36227, 0.6763858, 0.3774291, 0, 0, 0, 1, 1,
-1.350636, 1.976965, -1.550532, 0, 0, 0, 1, 1,
-1.319876, -0.4244731, -1.764511, 0, 0, 0, 1, 1,
-1.303898, 1.183928, -0.9686466, 0, 0, 0, 1, 1,
-1.298157, -0.1281005, -1.732939, 0, 0, 0, 1, 1,
-1.291523, 0.5510195, 0.2227036, 0, 0, 0, 1, 1,
-1.283345, -2.695478, -3.946386, 1, 1, 1, 1, 1,
-1.28056, -1.430104, -1.474626, 1, 1, 1, 1, 1,
-1.278763, 0.2901646, -2.557719, 1, 1, 1, 1, 1,
-1.277155, 0.8458519, -2.282859, 1, 1, 1, 1, 1,
-1.253913, 0.3132857, 0.1445337, 1, 1, 1, 1, 1,
-1.253281, 0.9568474, -0.9070741, 1, 1, 1, 1, 1,
-1.250058, -0.4368921, -2.546568, 1, 1, 1, 1, 1,
-1.24766, 0.4550264, -1.319085, 1, 1, 1, 1, 1,
-1.240493, -0.0181904, 1.103901, 1, 1, 1, 1, 1,
-1.220421, 0.3858464, -1.939439, 1, 1, 1, 1, 1,
-1.219895, -2.176355, -3.235189, 1, 1, 1, 1, 1,
-1.20311, 1.109275, 0.4700867, 1, 1, 1, 1, 1,
-1.194686, 0.4659303, -1.924954, 1, 1, 1, 1, 1,
-1.183919, -1.128319, -3.050776, 1, 1, 1, 1, 1,
-1.173845, -0.4183576, -3.472623, 1, 1, 1, 1, 1,
-1.173069, -0.5837502, -2.67471, 0, 0, 1, 1, 1,
-1.165083, 0.9156229, -0.293759, 1, 0, 0, 1, 1,
-1.155549, -1.203977, -2.996122, 1, 0, 0, 1, 1,
-1.153846, -1.132204, -2.041418, 1, 0, 0, 1, 1,
-1.150736, -0.07066423, -3.015865, 1, 0, 0, 1, 1,
-1.135302, 1.270351, -0.9008073, 1, 0, 0, 1, 1,
-1.132511, -0.3615065, -0.918005, 0, 0, 0, 1, 1,
-1.132054, 0.6049232, -0.6941768, 0, 0, 0, 1, 1,
-1.130123, -0.08670847, -1.788199, 0, 0, 0, 1, 1,
-1.123116, 0.4803255, -1.472022, 0, 0, 0, 1, 1,
-1.117114, 1.059001, -2.066993, 0, 0, 0, 1, 1,
-1.1143, 1.8015, 0.02728233, 0, 0, 0, 1, 1,
-1.101681, -0.4972947, -1.422464, 0, 0, 0, 1, 1,
-1.092233, 1.283993, -1.18645, 1, 1, 1, 1, 1,
-1.09133, 0.1953541, -2.218297, 1, 1, 1, 1, 1,
-1.087443, -1.644007, -2.387443, 1, 1, 1, 1, 1,
-1.085578, -0.7007971, -1.625494, 1, 1, 1, 1, 1,
-1.083848, -0.6413348, -1.925682, 1, 1, 1, 1, 1,
-1.083606, -0.9254389, -3.763515, 1, 1, 1, 1, 1,
-1.083026, -0.837922, -1.948319, 1, 1, 1, 1, 1,
-1.082933, -0.7029701, -3.26517, 1, 1, 1, 1, 1,
-1.082591, -1.316444, -2.28732, 1, 1, 1, 1, 1,
-1.075506, 0.3505201, -2.119703, 1, 1, 1, 1, 1,
-1.07503, -1.388582, -1.472365, 1, 1, 1, 1, 1,
-1.063141, 0.8659898, -0.590536, 1, 1, 1, 1, 1,
-1.058352, 0.918054, -0.6013243, 1, 1, 1, 1, 1,
-1.057261, -1.499789, -3.405033, 1, 1, 1, 1, 1,
-1.041219, -0.1765946, -1.325008, 1, 1, 1, 1, 1,
-1.041074, 0.05361073, -3.119772, 0, 0, 1, 1, 1,
-1.039224, -0.6951744, -2.166023, 1, 0, 0, 1, 1,
-1.037169, -0.32216, -3.183793, 1, 0, 0, 1, 1,
-1.031854, 0.7861974, -1.419233, 1, 0, 0, 1, 1,
-1.031685, -0.4755144, -0.4147674, 1, 0, 0, 1, 1,
-1.029148, -0.5111306, -1.696704, 1, 0, 0, 1, 1,
-1.028899, -0.8472531, -0.9784061, 0, 0, 0, 1, 1,
-1.02677, 0.4415996, -1.85506, 0, 0, 0, 1, 1,
-1.019142, -0.8824255, -2.997296, 0, 0, 0, 1, 1,
-1.017805, 1.283812, -0.4139639, 0, 0, 0, 1, 1,
-1.016364, 0.1443236, -1.065141, 0, 0, 0, 1, 1,
-1.014847, -0.03602988, -2.726257, 0, 0, 0, 1, 1,
-1.014094, -0.2538163, -0.5018006, 0, 0, 0, 1, 1,
-1.013176, -0.02100614, -2.86613, 1, 1, 1, 1, 1,
-1.012907, -0.3751397, -0.5695801, 1, 1, 1, 1, 1,
-1.011513, -0.1406228, -0.5084906, 1, 1, 1, 1, 1,
-1.004099, 2.453575, -0.5954468, 1, 1, 1, 1, 1,
-0.9977536, -0.1737158, -2.064192, 1, 1, 1, 1, 1,
-0.9935879, -0.849542, -1.482931, 1, 1, 1, 1, 1,
-0.9918424, 1.235759, 0.2969074, 1, 1, 1, 1, 1,
-0.9892727, -0.1030358, -1.486776, 1, 1, 1, 1, 1,
-0.9686054, 0.1485714, -0.3274644, 1, 1, 1, 1, 1,
-0.9671321, -0.5364941, -1.827933, 1, 1, 1, 1, 1,
-0.9651951, 0.2739859, -0.2845025, 1, 1, 1, 1, 1,
-0.9643094, 0.376856, -0.6239952, 1, 1, 1, 1, 1,
-0.9526719, 0.1793112, 1.006411, 1, 1, 1, 1, 1,
-0.951932, 1.004658, -1.069716, 1, 1, 1, 1, 1,
-0.9464486, 1.218432, -0.3027821, 1, 1, 1, 1, 1,
-0.9437732, 0.954821, -0.9998202, 0, 0, 1, 1, 1,
-0.9355119, -1.547952, -1.229948, 1, 0, 0, 1, 1,
-0.9340187, 0.9425063, -0.0454881, 1, 0, 0, 1, 1,
-0.9290881, 0.7039859, -0.7756353, 1, 0, 0, 1, 1,
-0.9238187, 0.5804963, -2.233439, 1, 0, 0, 1, 1,
-0.9233891, 0.1412022, -0.7891187, 1, 0, 0, 1, 1,
-0.9223791, -1.546977, -2.247822, 0, 0, 0, 1, 1,
-0.9164677, -1.699966, -3.028532, 0, 0, 0, 1, 1,
-0.9067852, 0.6009316, -1.524953, 0, 0, 0, 1, 1,
-0.9065948, 1.548395, -1.19108, 0, 0, 0, 1, 1,
-0.9065589, -1.428428, -3.318891, 0, 0, 0, 1, 1,
-0.9064229, -1.773318, -3.85849, 0, 0, 0, 1, 1,
-0.9021344, -0.7332602, -2.997621, 0, 0, 0, 1, 1,
-0.8996421, -0.3794532, -2.222329, 1, 1, 1, 1, 1,
-0.8949827, -1.299708, -2.521521, 1, 1, 1, 1, 1,
-0.8942841, -0.8641923, -3.117897, 1, 1, 1, 1, 1,
-0.8876479, 1.111967, -0.1184145, 1, 1, 1, 1, 1,
-0.8782055, 0.9617018, -1.096537, 1, 1, 1, 1, 1,
-0.8734415, -2.087661, -0.619463, 1, 1, 1, 1, 1,
-0.8731439, -0.04621312, -3.461257, 1, 1, 1, 1, 1,
-0.8715929, 1.224535, -1.972229, 1, 1, 1, 1, 1,
-0.8694571, 0.03416947, -2.200813, 1, 1, 1, 1, 1,
-0.8665249, 0.2650582, -2.749778, 1, 1, 1, 1, 1,
-0.8622368, 1.230161, -2.167831, 1, 1, 1, 1, 1,
-0.8618932, -0.9704728, -2.262658, 1, 1, 1, 1, 1,
-0.8537608, -0.6777071, -2.658317, 1, 1, 1, 1, 1,
-0.8514373, 0.1356626, -3.262483, 1, 1, 1, 1, 1,
-0.8510281, 0.1836445, -1.474489, 1, 1, 1, 1, 1,
-0.8495835, -1.643947, -3.368845, 0, 0, 1, 1, 1,
-0.8465406, -1.807757, -1.507983, 1, 0, 0, 1, 1,
-0.8448622, 1.523687, -0.1441725, 1, 0, 0, 1, 1,
-0.8445482, -0.9739622, -2.415082, 1, 0, 0, 1, 1,
-0.8377973, -1.043641, -1.419842, 1, 0, 0, 1, 1,
-0.8363145, -1.6661, -2.248206, 1, 0, 0, 1, 1,
-0.8287294, -0.528031, -2.307251, 0, 0, 0, 1, 1,
-0.8284515, 0.2358986, -0.6832067, 0, 0, 0, 1, 1,
-0.8264226, -1.86509, -3.31395, 0, 0, 0, 1, 1,
-0.8217104, 0.1071994, -0.05361065, 0, 0, 0, 1, 1,
-0.816747, -0.1676577, -1.324644, 0, 0, 0, 1, 1,
-0.8131544, -0.8581746, -2.265266, 0, 0, 0, 1, 1,
-0.8093415, 0.9438216, -0.5473784, 0, 0, 0, 1, 1,
-0.8043941, 0.4609196, -0.6496366, 1, 1, 1, 1, 1,
-0.802794, 0.0788454, -0.5403783, 1, 1, 1, 1, 1,
-0.8007151, -1.199451, -0.8695444, 1, 1, 1, 1, 1,
-0.7954555, 0.5465438, -0.1345379, 1, 1, 1, 1, 1,
-0.7948437, 0.2175916, -0.7652854, 1, 1, 1, 1, 1,
-0.7884828, 0.5154192, 0.1037262, 1, 1, 1, 1, 1,
-0.7827117, 2.15873, 0.2702457, 1, 1, 1, 1, 1,
-0.7805749, -0.4711882, -0.6392432, 1, 1, 1, 1, 1,
-0.778334, 0.4364051, -0.4461849, 1, 1, 1, 1, 1,
-0.7777871, 1.070688, -0.9258525, 1, 1, 1, 1, 1,
-0.7750074, -1.003942, -4.64969, 1, 1, 1, 1, 1,
-0.7749155, 0.1680006, -1.019238, 1, 1, 1, 1, 1,
-0.7674023, 0.4133279, -1.1004, 1, 1, 1, 1, 1,
-0.7617081, -1.758084, -2.842518, 1, 1, 1, 1, 1,
-0.7556581, -0.6556122, -3.651882, 1, 1, 1, 1, 1,
-0.7536457, 0.916648, -1.179998, 0, 0, 1, 1, 1,
-0.724693, 1.177226, 0.1815398, 1, 0, 0, 1, 1,
-0.7240463, 0.04131444, -0.7765159, 1, 0, 0, 1, 1,
-0.7201019, 0.2630084, 0.4256811, 1, 0, 0, 1, 1,
-0.7199819, -0.9365741, -2.7149, 1, 0, 0, 1, 1,
-0.7135733, 0.913011, -1.118659, 1, 0, 0, 1, 1,
-0.713188, 0.3772559, -2.981312, 0, 0, 0, 1, 1,
-0.7113256, -0.3254529, 0.05223688, 0, 0, 0, 1, 1,
-0.7108554, -0.03589531, -2.169151, 0, 0, 0, 1, 1,
-0.7077817, -0.9840226, -4.204076, 0, 0, 0, 1, 1,
-0.7023209, 0.2374222, -2.099686, 0, 0, 0, 1, 1,
-0.7016718, -0.09791571, -1.026636, 0, 0, 0, 1, 1,
-0.6994295, 0.9801581, 0.2181009, 0, 0, 0, 1, 1,
-0.6973687, -1.265581, -0.09425604, 1, 1, 1, 1, 1,
-0.6888794, -0.2318458, -3.023213, 1, 1, 1, 1, 1,
-0.6868136, -1.061502, -2.221644, 1, 1, 1, 1, 1,
-0.6758549, 0.225893, -0.4374993, 1, 1, 1, 1, 1,
-0.6753181, -2.015825, -1.221715, 1, 1, 1, 1, 1,
-0.6738265, 0.3932751, -1.475523, 1, 1, 1, 1, 1,
-0.672378, 1.715774, -0.4319896, 1, 1, 1, 1, 1,
-0.6722183, 0.3283498, -1.975261, 1, 1, 1, 1, 1,
-0.6715336, -1.378011, -1.731898, 1, 1, 1, 1, 1,
-0.6672667, -0.4994779, -3.072113, 1, 1, 1, 1, 1,
-0.6647114, 0.8531163, -0.7927631, 1, 1, 1, 1, 1,
-0.6602271, -1.083262, -1.805942, 1, 1, 1, 1, 1,
-0.6492983, 1.535787, -2.04929, 1, 1, 1, 1, 1,
-0.6361309, -0.991537, -1.887967, 1, 1, 1, 1, 1,
-0.6323598, -0.7801802, -2.80844, 1, 1, 1, 1, 1,
-0.6294733, -0.969451, -3.658721, 0, 0, 1, 1, 1,
-0.6289436, 0.8229774, -0.4599996, 1, 0, 0, 1, 1,
-0.6281582, 0.1026497, -2.636075, 1, 0, 0, 1, 1,
-0.6228817, -0.9271429, -3.597198, 1, 0, 0, 1, 1,
-0.6221763, -0.3081516, -3.417064, 1, 0, 0, 1, 1,
-0.616511, -0.2328543, -2.255582, 1, 0, 0, 1, 1,
-0.6156561, -0.1485466, -1.139522, 0, 0, 0, 1, 1,
-0.6151888, 0.1363861, -1.525258, 0, 0, 0, 1, 1,
-0.6071918, 0.6252439, -0.3377768, 0, 0, 0, 1, 1,
-0.605881, -0.3022797, -1.743021, 0, 0, 0, 1, 1,
-0.6046609, 0.120406, -0.5184719, 0, 0, 0, 1, 1,
-0.6039791, 0.3181538, -2.182259, 0, 0, 0, 1, 1,
-0.6036652, 1.021894, 0.03359581, 0, 0, 0, 1, 1,
-0.6015667, -0.009581412, -1.428658, 1, 1, 1, 1, 1,
-0.5989491, 0.9256667, -1.502017, 1, 1, 1, 1, 1,
-0.5950778, -0.1666049, -2.653855, 1, 1, 1, 1, 1,
-0.5854741, 0.559754, -0.7307723, 1, 1, 1, 1, 1,
-0.578031, 0.2782201, 0.1670635, 1, 1, 1, 1, 1,
-0.5756424, 1.131879, -0.5173662, 1, 1, 1, 1, 1,
-0.5733891, -1.491552, -3.725425, 1, 1, 1, 1, 1,
-0.5669897, -0.2767069, -1.912308, 1, 1, 1, 1, 1,
-0.5618939, -0.1570194, -3.219167, 1, 1, 1, 1, 1,
-0.5592589, 0.8111582, -2.055675, 1, 1, 1, 1, 1,
-0.5568265, -0.680546, -1.877391, 1, 1, 1, 1, 1,
-0.5554541, -2.392375, -3.207186, 1, 1, 1, 1, 1,
-0.5535518, -0.1457483, -0.1523996, 1, 1, 1, 1, 1,
-0.5506002, -0.2909009, -2.02622, 1, 1, 1, 1, 1,
-0.5458978, -0.5993023, -2.604587, 1, 1, 1, 1, 1,
-0.5446157, 0.05393745, -0.2648363, 0, 0, 1, 1, 1,
-0.5439939, -0.4002111, -1.519358, 1, 0, 0, 1, 1,
-0.5405882, 0.3212603, -1.767954, 1, 0, 0, 1, 1,
-0.5392941, 1.457918, 0.1356554, 1, 0, 0, 1, 1,
-0.5337608, -0.09208251, -1.413321, 1, 0, 0, 1, 1,
-0.530667, 0.3290617, -0.8725321, 1, 0, 0, 1, 1,
-0.5216984, 0.09880328, -1.950245, 0, 0, 0, 1, 1,
-0.520497, -0.2879032, -2.938129, 0, 0, 0, 1, 1,
-0.5106078, 0.8106676, 0.7180154, 0, 0, 0, 1, 1,
-0.5079045, 0.790769, -0.8922602, 0, 0, 0, 1, 1,
-0.5076349, 0.1944085, -1.737658, 0, 0, 0, 1, 1,
-0.5062036, -0.1624594, -0.7209849, 0, 0, 0, 1, 1,
-0.5045892, 0.4937174, 1.444293, 0, 0, 0, 1, 1,
-0.5008078, -1.527607, -3.53237, 1, 1, 1, 1, 1,
-0.4955751, 1.195112, -1.221342, 1, 1, 1, 1, 1,
-0.4899033, 1.169217, -0.4073011, 1, 1, 1, 1, 1,
-0.4892838, 0.8450191, -0.5994868, 1, 1, 1, 1, 1,
-0.4839014, 1.614346, 0.8993002, 1, 1, 1, 1, 1,
-0.4821165, -0.2079836, -1.92147, 1, 1, 1, 1, 1,
-0.4772663, -1.167295, -2.714637, 1, 1, 1, 1, 1,
-0.4741455, -1.051397, -1.558464, 1, 1, 1, 1, 1,
-0.4628631, 0.7372245, 0.5392104, 1, 1, 1, 1, 1,
-0.4616111, 0.8144848, 0.1402479, 1, 1, 1, 1, 1,
-0.4521867, 1.81943, -1.398477, 1, 1, 1, 1, 1,
-0.4511578, 1.139395, -1.450469, 1, 1, 1, 1, 1,
-0.4497389, 0.7923313, -0.845297, 1, 1, 1, 1, 1,
-0.4488084, 1.955872, -1.945826, 1, 1, 1, 1, 1,
-0.4467873, 0.000970354, -2.894825, 1, 1, 1, 1, 1,
-0.4449242, -0.1779781, -1.450507, 0, 0, 1, 1, 1,
-0.4446737, -0.225218, -2.940497, 1, 0, 0, 1, 1,
-0.4417985, 0.4685659, 0.4541884, 1, 0, 0, 1, 1,
-0.4367099, 0.1077899, -0.7889714, 1, 0, 0, 1, 1,
-0.4347031, 1.683741, -0.396154, 1, 0, 0, 1, 1,
-0.4324715, -0.2129843, -3.065443, 1, 0, 0, 1, 1,
-0.431048, -0.1340911, -1.746892, 0, 0, 0, 1, 1,
-0.4306346, -1.619521, -3.379687, 0, 0, 0, 1, 1,
-0.4302588, 0.6155038, 0.1503471, 0, 0, 0, 1, 1,
-0.429479, 0.8396327, 0.5604331, 0, 0, 0, 1, 1,
-0.4275214, 0.3063478, -1.194967, 0, 0, 0, 1, 1,
-0.4270943, 0.7393323, -0.9343917, 0, 0, 0, 1, 1,
-0.4243549, 1.445262, -2.317657, 0, 0, 0, 1, 1,
-0.4230272, 3.634467, 0.298168, 1, 1, 1, 1, 1,
-0.4228884, 1.611693, 0.5276067, 1, 1, 1, 1, 1,
-0.4227346, -0.7520727, -3.930965, 1, 1, 1, 1, 1,
-0.4177381, 1.093985, 0.01374932, 1, 1, 1, 1, 1,
-0.4161104, 0.4738697, 1.768426, 1, 1, 1, 1, 1,
-0.4150202, -0.2541704, -2.979209, 1, 1, 1, 1, 1,
-0.4144576, 1.219103, 0.2462955, 1, 1, 1, 1, 1,
-0.4088692, -1.307485, -1.432641, 1, 1, 1, 1, 1,
-0.4086392, 0.5157346, -1.489136, 1, 1, 1, 1, 1,
-0.4054691, -1.158032, -2.55493, 1, 1, 1, 1, 1,
-0.4043529, -0.1023945, -0.4942651, 1, 1, 1, 1, 1,
-0.3982651, -0.1735886, -3.189684, 1, 1, 1, 1, 1,
-0.3973298, 1.077789, -0.2172374, 1, 1, 1, 1, 1,
-0.3962757, -1.603672, -3.777065, 1, 1, 1, 1, 1,
-0.396093, -0.3884567, -3.501713, 1, 1, 1, 1, 1,
-0.393281, 1.846761, 0.2842895, 0, 0, 1, 1, 1,
-0.3927394, 0.2021583, 0.7579779, 1, 0, 0, 1, 1,
-0.3897925, -1.503594, -2.367709, 1, 0, 0, 1, 1,
-0.3895569, 1.284791, -0.4211937, 1, 0, 0, 1, 1,
-0.3868677, -1.516628, -3.283822, 1, 0, 0, 1, 1,
-0.3808791, 0.781136, 0.1573873, 1, 0, 0, 1, 1,
-0.3744918, 1.538295, 0.7410043, 0, 0, 0, 1, 1,
-0.3677641, -0.1311802, -1.882942, 0, 0, 0, 1, 1,
-0.3671621, 0.860016, -1.820185, 0, 0, 0, 1, 1,
-0.3646843, -0.7621238, -2.840873, 0, 0, 0, 1, 1,
-0.3560228, -0.36955, -1.658414, 0, 0, 0, 1, 1,
-0.3551394, 0.1737141, -1.455945, 0, 0, 0, 1, 1,
-0.353806, -1.441334, -4.389118, 0, 0, 0, 1, 1,
-0.3502701, 0.9786361, 0.5037155, 1, 1, 1, 1, 1,
-0.3438303, -0.796114, -2.609535, 1, 1, 1, 1, 1,
-0.3428772, 0.6383002, 0.7755159, 1, 1, 1, 1, 1,
-0.3283555, 0.2038131, -0.6914238, 1, 1, 1, 1, 1,
-0.3267571, 0.1054059, -0.9142715, 1, 1, 1, 1, 1,
-0.3229151, 1.02167, -0.3066339, 1, 1, 1, 1, 1,
-0.3207355, -0.05687009, 0.004444847, 1, 1, 1, 1, 1,
-0.3185215, 0.1690023, 0.3295911, 1, 1, 1, 1, 1,
-0.3142773, -0.05845713, -0.3887065, 1, 1, 1, 1, 1,
-0.311135, 0.5854134, -1.78678, 1, 1, 1, 1, 1,
-0.3101487, 1.84084, 0.04209058, 1, 1, 1, 1, 1,
-0.3034006, 0.2366752, -2.09696, 1, 1, 1, 1, 1,
-0.3029057, -1.938017, -3.364025, 1, 1, 1, 1, 1,
-0.2968986, -1.296438, -3.040931, 1, 1, 1, 1, 1,
-0.2961755, 0.3108494, -1.663378, 1, 1, 1, 1, 1,
-0.2922229, -0.6639016, -3.06482, 0, 0, 1, 1, 1,
-0.2904897, -1.217483, -3.728164, 1, 0, 0, 1, 1,
-0.2880095, -1.30785, -3.739059, 1, 0, 0, 1, 1,
-0.2863745, -0.4210759, -3.830833, 1, 0, 0, 1, 1,
-0.2743313, -0.389046, -3.266829, 1, 0, 0, 1, 1,
-0.2680216, 0.4634235, 0.8444063, 1, 0, 0, 1, 1,
-0.2671963, 1.336096, 0.9555749, 0, 0, 0, 1, 1,
-0.2658517, -0.1350688, -2.795092, 0, 0, 0, 1, 1,
-0.2635265, 0.4381323, 0.06051883, 0, 0, 0, 1, 1,
-0.2626619, 0.4970504, -0.6991137, 0, 0, 0, 1, 1,
-0.261023, -0.4022473, -4.583594, 0, 0, 0, 1, 1,
-0.2567691, 0.4145981, -1.228327, 0, 0, 0, 1, 1,
-0.2557358, 0.5305264, -2.18329, 0, 0, 0, 1, 1,
-0.2523391, -0.4475032, -3.238895, 1, 1, 1, 1, 1,
-0.2515309, 0.8278576, -1.748867, 1, 1, 1, 1, 1,
-0.247626, 1.072005, 0.2326351, 1, 1, 1, 1, 1,
-0.2472688, 0.5422334, -0.5525298, 1, 1, 1, 1, 1,
-0.2460571, 0.2255562, -1.154806, 1, 1, 1, 1, 1,
-0.2314319, 0.3373325, 2.187404, 1, 1, 1, 1, 1,
-0.2284969, 0.6208172, 0.2892234, 1, 1, 1, 1, 1,
-0.2280744, 0.4076657, -0.2063948, 1, 1, 1, 1, 1,
-0.2266053, 1.379608, 0.1000172, 1, 1, 1, 1, 1,
-0.2246729, -1.333996, -3.35537, 1, 1, 1, 1, 1,
-0.2235451, 0.2716887, -1.525958, 1, 1, 1, 1, 1,
-0.2202507, 0.4800844, -2.406997, 1, 1, 1, 1, 1,
-0.2197354, 0.9412313, -0.1403755, 1, 1, 1, 1, 1,
-0.2129075, -0.4930091, -3.444351, 1, 1, 1, 1, 1,
-0.2122423, -0.8442985, -3.873526, 1, 1, 1, 1, 1,
-0.2083409, -0.4084668, -0.9280453, 0, 0, 1, 1, 1,
-0.2061519, -0.0621585, -2.596944, 1, 0, 0, 1, 1,
-0.1987445, -0.6234292, -1.459547, 1, 0, 0, 1, 1,
-0.1980356, 0.573778, -2.352781, 1, 0, 0, 1, 1,
-0.1971984, 1.474734, 0.5771526, 1, 0, 0, 1, 1,
-0.1964321, -1.389032, -1.747918, 1, 0, 0, 1, 1,
-0.1950405, -1.089409, -2.734127, 0, 0, 0, 1, 1,
-0.1928938, -0.5309722, -2.150623, 0, 0, 0, 1, 1,
-0.1827209, -1.110165, -2.763745, 0, 0, 0, 1, 1,
-0.1810204, 2.195565, -0.5717606, 0, 0, 0, 1, 1,
-0.1786818, -0.2720779, -3.589093, 0, 0, 0, 1, 1,
-0.1777204, 0.6318626, -0.8627918, 0, 0, 0, 1, 1,
-0.1749082, -2.088801, -4.526041, 0, 0, 0, 1, 1,
-0.1736984, 0.3882889, -1.37287, 1, 1, 1, 1, 1,
-0.17084, 1.067293, 0.5014055, 1, 1, 1, 1, 1,
-0.1702323, -0.3862497, -2.666695, 1, 1, 1, 1, 1,
-0.1696072, -0.7739151, -1.456463, 1, 1, 1, 1, 1,
-0.1654172, -0.9892334, -4.135804, 1, 1, 1, 1, 1,
-0.1617012, 0.6742269, -0.6290888, 1, 1, 1, 1, 1,
-0.1604924, 2.030319, -0.4228232, 1, 1, 1, 1, 1,
-0.1600031, 1.683983, 0.7064921, 1, 1, 1, 1, 1,
-0.1597358, 1.118891, 1.800604, 1, 1, 1, 1, 1,
-0.1563387, -0.4368236, -4.267109, 1, 1, 1, 1, 1,
-0.1487842, -0.9300355, -3.016092, 1, 1, 1, 1, 1,
-0.1453563, -1.379917, -3.642952, 1, 1, 1, 1, 1,
-0.1433446, 0.1450935, 0.508983, 1, 1, 1, 1, 1,
-0.1417825, 1.049732, 1.233511, 1, 1, 1, 1, 1,
-0.1417117, -0.2468933, -2.882899, 1, 1, 1, 1, 1,
-0.1401604, -0.3263833, -2.354809, 0, 0, 1, 1, 1,
-0.1284726, 1.213464, -0.4672104, 1, 0, 0, 1, 1,
-0.1283818, -0.06275795, -2.739393, 1, 0, 0, 1, 1,
-0.1280498, -1.209972, -3.928582, 1, 0, 0, 1, 1,
-0.120209, -0.5271971, -3.431944, 1, 0, 0, 1, 1,
-0.1169582, -0.6729595, -2.052571, 1, 0, 0, 1, 1,
-0.1168071, 0.4597134, -0.1572371, 0, 0, 0, 1, 1,
-0.1163681, -0.4328385, -4.963808, 0, 0, 0, 1, 1,
-0.1152078, -0.7626157, -2.282791, 0, 0, 0, 1, 1,
-0.1116496, 0.448251, -0.2979506, 0, 0, 0, 1, 1,
-0.1059211, 0.5991614, -0.3519222, 0, 0, 0, 1, 1,
-0.1034452, 0.5608118, -0.5112328, 0, 0, 0, 1, 1,
-0.09869467, 0.6745415, 1.080821, 0, 0, 0, 1, 1,
-0.09758561, -0.3484998, -2.097862, 1, 1, 1, 1, 1,
-0.09537847, -0.1296137, -3.110255, 1, 1, 1, 1, 1,
-0.08391391, -0.3203331, -3.214027, 1, 1, 1, 1, 1,
-0.08242316, -0.8251526, -3.252939, 1, 1, 1, 1, 1,
-0.07303818, -0.4721901, -3.557117, 1, 1, 1, 1, 1,
-0.07031661, -1.448857, -3.843738, 1, 1, 1, 1, 1,
-0.06766608, -0.9902427, -3.31216, 1, 1, 1, 1, 1,
-0.0648466, 0.5247396, -0.2746685, 1, 1, 1, 1, 1,
-0.06131322, 0.9895809, 0.6015064, 1, 1, 1, 1, 1,
-0.06082627, -0.9607591, -3.188552, 1, 1, 1, 1, 1,
-0.05871354, -0.338291, -2.187787, 1, 1, 1, 1, 1,
-0.05650999, -0.8675965, -2.006374, 1, 1, 1, 1, 1,
-0.05621197, -0.8481749, 0.3925838, 1, 1, 1, 1, 1,
-0.049916, -1.161076, -3.020839, 1, 1, 1, 1, 1,
-0.04867546, 2.075454, -0.1839078, 1, 1, 1, 1, 1,
-0.04804722, 0.4616632, -1.461454, 0, 0, 1, 1, 1,
-0.04731489, -0.3393353, -1.575174, 1, 0, 0, 1, 1,
-0.04674443, -0.1810198, -1.671772, 1, 0, 0, 1, 1,
-0.04638408, -1.146886, -4.387399, 1, 0, 0, 1, 1,
-0.04540736, 1.682459, 0.8308882, 1, 0, 0, 1, 1,
-0.04515264, -0.6152494, -2.311562, 1, 0, 0, 1, 1,
-0.04505776, 1.733056, -0.2030464, 0, 0, 0, 1, 1,
-0.0369853, 0.5156724, 0.006531815, 0, 0, 0, 1, 1,
-0.036258, -0.3531222, -4.757337, 0, 0, 0, 1, 1,
-0.03216087, -2.043844, -2.650642, 0, 0, 0, 1, 1,
-0.0293322, 1.062888, 2.293988, 0, 0, 0, 1, 1,
-0.02691988, 1.411154, 0.5235246, 0, 0, 0, 1, 1,
-0.0267808, -0.8763598, -3.773524, 0, 0, 0, 1, 1,
-0.02614951, -0.2229876, -4.065544, 1, 1, 1, 1, 1,
-0.0254548, -0.5754248, -3.875538, 1, 1, 1, 1, 1,
-0.02375579, -0.1434806, -4.053711, 1, 1, 1, 1, 1,
-0.02228473, -1.794108, -1.265706, 1, 1, 1, 1, 1,
-0.02175068, 0.4690596, 0.3460598, 1, 1, 1, 1, 1,
-0.02154757, -1.236292, -2.104044, 1, 1, 1, 1, 1,
-0.02121221, 0.4505062, -0.7048711, 1, 1, 1, 1, 1,
-0.01885153, 1.140531, 0.441662, 1, 1, 1, 1, 1,
-0.01849399, 0.07645203, 0.5746419, 1, 1, 1, 1, 1,
-0.01597569, -0.5963064, -3.261514, 1, 1, 1, 1, 1,
-0.01550983, 2.645786, -0.2463828, 1, 1, 1, 1, 1,
-0.01489586, -0.448161, -2.481288, 1, 1, 1, 1, 1,
-0.01446582, -1.198594, -3.071183, 1, 1, 1, 1, 1,
-0.01444277, 1.054061, 0.8843108, 1, 1, 1, 1, 1,
-0.01366056, -2.330215, -4.056527, 1, 1, 1, 1, 1,
-0.01299957, 2.554485, 0.3552727, 0, 0, 1, 1, 1,
-0.01176015, -1.10483, -3.033015, 1, 0, 0, 1, 1,
-0.006305988, 0.5180393, 1.207692, 1, 0, 0, 1, 1,
-0.006048019, 0.4520563, -1.302592, 1, 0, 0, 1, 1,
-0.00417699, -1.448326, -2.900029, 1, 0, 0, 1, 1,
-0.003931146, -0.1055448, -5.763026, 1, 0, 0, 1, 1,
-0.001675921, -0.6343142, -2.16696, 0, 0, 0, 1, 1,
-0.001142721, -0.1193589, -2.600725, 0, 0, 0, 1, 1,
0.001475153, -0.9945229, 4.285703, 0, 0, 0, 1, 1,
0.002760772, 0.7269041, -1.220694, 0, 0, 0, 1, 1,
0.01049652, -1.507988, 3.291981, 0, 0, 0, 1, 1,
0.01295182, 0.3690109, 0.1169504, 0, 0, 0, 1, 1,
0.01572945, -1.799216, 2.289461, 0, 0, 0, 1, 1,
0.02322237, -1.080149, 4.01399, 1, 1, 1, 1, 1,
0.02322688, 0.1004004, -0.4799105, 1, 1, 1, 1, 1,
0.02566037, 0.2406067, 1.988707, 1, 1, 1, 1, 1,
0.02569364, -0.323914, 4.306475, 1, 1, 1, 1, 1,
0.02616894, 1.994265, 0.3606539, 1, 1, 1, 1, 1,
0.02718132, -0.1550668, 4.394019, 1, 1, 1, 1, 1,
0.03039424, -0.9595158, 2.321426, 1, 1, 1, 1, 1,
0.03152293, -1.392371, 2.658968, 1, 1, 1, 1, 1,
0.03314564, -2.462379, 4.625101, 1, 1, 1, 1, 1,
0.03440133, 0.2120651, -1.968842, 1, 1, 1, 1, 1,
0.03529286, 1.411976, 1.119453, 1, 1, 1, 1, 1,
0.03693677, 0.3311897, 0.04702901, 1, 1, 1, 1, 1,
0.04427551, -0.2923287, 0.9421889, 1, 1, 1, 1, 1,
0.04595544, 1.212032, -1.111462, 1, 1, 1, 1, 1,
0.05013981, 0.6026519, -1.358699, 1, 1, 1, 1, 1,
0.05066438, 0.4169446, -0.2259894, 0, 0, 1, 1, 1,
0.05635845, 0.5171243, -0.7748862, 1, 0, 0, 1, 1,
0.05639677, 0.4098653, -1.830869, 1, 0, 0, 1, 1,
0.05899102, 0.2736903, -1.213133, 1, 0, 0, 1, 1,
0.06301718, -2.342808, 4.21488, 1, 0, 0, 1, 1,
0.06511788, 0.6592445, -0.9469738, 1, 0, 0, 1, 1,
0.06664314, -0.007894452, 1.268043, 0, 0, 0, 1, 1,
0.06782545, 1.59532, 1.793426, 0, 0, 0, 1, 1,
0.07063855, 1.635742, 0.2785328, 0, 0, 0, 1, 1,
0.07139441, -1.14271, 2.494838, 0, 0, 0, 1, 1,
0.07237641, 0.6222354, 1.572205, 0, 0, 0, 1, 1,
0.07744186, -1.5094, 3.985101, 0, 0, 0, 1, 1,
0.07863692, -0.2277987, 3.005211, 0, 0, 0, 1, 1,
0.07869931, -0.3077268, 1.817704, 1, 1, 1, 1, 1,
0.07996082, 0.9681369, -0.9592868, 1, 1, 1, 1, 1,
0.08208662, -0.6825998, 2.024501, 1, 1, 1, 1, 1,
0.08417768, 1.318021, -0.03302994, 1, 1, 1, 1, 1,
0.08437359, -0.3541009, 3.137966, 1, 1, 1, 1, 1,
0.08651614, 1.134839, 0.1954447, 1, 1, 1, 1, 1,
0.08771565, -1.206445, 2.971777, 1, 1, 1, 1, 1,
0.08846551, -0.6877593, 2.309494, 1, 1, 1, 1, 1,
0.09467728, -0.451995, 1.539572, 1, 1, 1, 1, 1,
0.09474856, 1.094074, -1.078004, 1, 1, 1, 1, 1,
0.09622372, 0.05520594, 1.247066, 1, 1, 1, 1, 1,
0.09754372, 0.9432393, -1.042577, 1, 1, 1, 1, 1,
0.0979, 1.005567, -0.5804679, 1, 1, 1, 1, 1,
0.0985261, 0.9169101, 0.3495573, 1, 1, 1, 1, 1,
0.1062626, 2.063047, 0.9307212, 1, 1, 1, 1, 1,
0.106812, -0.2147368, 3.565366, 0, 0, 1, 1, 1,
0.1071762, -0.8952109, 2.456297, 1, 0, 0, 1, 1,
0.108349, 1.041755, -0.1918935, 1, 0, 0, 1, 1,
0.1107315, 0.08986586, 1.519288, 1, 0, 0, 1, 1,
0.1121304, 0.5962212, -0.1062702, 1, 0, 0, 1, 1,
0.1169732, -0.1318419, 1.263492, 1, 0, 0, 1, 1,
0.1175696, -0.5463955, 1.930568, 0, 0, 0, 1, 1,
0.1186965, 0.1246062, 0.3951723, 0, 0, 0, 1, 1,
0.1227687, -0.306143, 2.531277, 0, 0, 0, 1, 1,
0.1240003, 0.3344713, 0.3308017, 0, 0, 0, 1, 1,
0.1248193, -0.6449888, 2.884854, 0, 0, 0, 1, 1,
0.1265316, -0.1062879, 4.543158, 0, 0, 0, 1, 1,
0.1316153, 0.8880891, 0.8424702, 0, 0, 0, 1, 1,
0.1346152, 0.9009279, 0.8747047, 1, 1, 1, 1, 1,
0.1362221, -0.7616777, 1.840647, 1, 1, 1, 1, 1,
0.136668, 0.4301792, 0.479017, 1, 1, 1, 1, 1,
0.1392057, 1.453451, -1.301364, 1, 1, 1, 1, 1,
0.1440139, 0.5788821, 0.6009495, 1, 1, 1, 1, 1,
0.1493402, 0.734942, -0.4074912, 1, 1, 1, 1, 1,
0.1494137, 0.5641991, -1.669877, 1, 1, 1, 1, 1,
0.1495622, -2.169295, 3.063867, 1, 1, 1, 1, 1,
0.1528638, -1.468405, 3.105768, 1, 1, 1, 1, 1,
0.1531527, -0.02475791, 2.267005, 1, 1, 1, 1, 1,
0.1531648, 0.8930545, -0.6114416, 1, 1, 1, 1, 1,
0.1557054, 0.2159187, 1.863818, 1, 1, 1, 1, 1,
0.1580618, -0.3010285, 3.572358, 1, 1, 1, 1, 1,
0.1594441, 0.155872, 0.2459132, 1, 1, 1, 1, 1,
0.1630322, -0.3937453, 3.423783, 1, 1, 1, 1, 1,
0.165153, -0.3645848, 1.950829, 0, 0, 1, 1, 1,
0.1659765, -0.2559807, 3.075995, 1, 0, 0, 1, 1,
0.1665118, 1.17089, 0.7171808, 1, 0, 0, 1, 1,
0.1688207, 0.9075886, -0.1976632, 1, 0, 0, 1, 1,
0.1712273, -1.121898, 1.24576, 1, 0, 0, 1, 1,
0.1735369, -1.71156, 2.79435, 1, 0, 0, 1, 1,
0.1768117, -0.3573923, 1.487288, 0, 0, 0, 1, 1,
0.1772592, -0.07201514, 2.705271, 0, 0, 0, 1, 1,
0.1789375, 0.4873354, -0.6935763, 0, 0, 0, 1, 1,
0.18243, 0.06297208, 0.5751053, 0, 0, 0, 1, 1,
0.187928, -0.7661121, 4.710972, 0, 0, 0, 1, 1,
0.1891472, 2.26805, 0.1195551, 0, 0, 0, 1, 1,
0.1907898, 0.07196289, -0.128958, 0, 0, 0, 1, 1,
0.1922383, 0.3972452, 0.2756967, 1, 1, 1, 1, 1,
0.1933633, -0.932641, 3.211244, 1, 1, 1, 1, 1,
0.195446, -0.4706755, 3.328476, 1, 1, 1, 1, 1,
0.1970173, -0.7468479, 4.844216, 1, 1, 1, 1, 1,
0.198293, 0.3543723, -0.8491972, 1, 1, 1, 1, 1,
0.2031996, 0.5485754, 2.112648, 1, 1, 1, 1, 1,
0.2088552, -0.3630011, 1.996373, 1, 1, 1, 1, 1,
0.2128564, -1.171257, 2.438599, 1, 1, 1, 1, 1,
0.2133214, 0.1554508, -0.1650244, 1, 1, 1, 1, 1,
0.2133837, -0.7839879, 5.088446, 1, 1, 1, 1, 1,
0.2153333, 2.726517, 0.7901163, 1, 1, 1, 1, 1,
0.2160675, -0.8431722, 2.092884, 1, 1, 1, 1, 1,
0.2181128, 0.1935349, 0.6365725, 1, 1, 1, 1, 1,
0.2186369, 0.5216882, -1.307355, 1, 1, 1, 1, 1,
0.2193236, -0.5358051, 2.334142, 1, 1, 1, 1, 1,
0.2197962, -1.123721, 3.865112, 0, 0, 1, 1, 1,
0.2260623, 1.37805, 0.8143376, 1, 0, 0, 1, 1,
0.2295065, 0.838958, 1.181077, 1, 0, 0, 1, 1,
0.2324986, 1.408318, 2.223056, 1, 0, 0, 1, 1,
0.2350556, 1.456191, -0.8617136, 1, 0, 0, 1, 1,
0.2351239, -0.8050829, 1.776671, 1, 0, 0, 1, 1,
0.2363643, -0.6126653, 2.553637, 0, 0, 0, 1, 1,
0.2464959, -0.5853808, 2.00968, 0, 0, 0, 1, 1,
0.2476978, -0.1607422, -1.426513, 0, 0, 0, 1, 1,
0.2480815, -0.892522, 2.833204, 0, 0, 0, 1, 1,
0.2584768, 0.04833047, 2.073819, 0, 0, 0, 1, 1,
0.2611147, 0.3730016, 0.5102841, 0, 0, 0, 1, 1,
0.2685753, 2.031322, -0.5301554, 0, 0, 0, 1, 1,
0.2688767, 1.23874, 0.146009, 1, 1, 1, 1, 1,
0.2696036, -0.6023388, 2.062734, 1, 1, 1, 1, 1,
0.2744362, 0.1063965, -2.290163, 1, 1, 1, 1, 1,
0.2752655, -0.1018633, 0.6488914, 1, 1, 1, 1, 1,
0.2783649, -0.6797517, 2.875329, 1, 1, 1, 1, 1,
0.2816479, -1.94045, 3.104159, 1, 1, 1, 1, 1,
0.2827504, 1.35467, 0.6058413, 1, 1, 1, 1, 1,
0.2872507, 1.488678, -0.2073628, 1, 1, 1, 1, 1,
0.2910111, -0.7824959, 1.307863, 1, 1, 1, 1, 1,
0.2926683, 0.5459607, -0.3992049, 1, 1, 1, 1, 1,
0.2939965, -1.501828, 2.999246, 1, 1, 1, 1, 1,
0.2955497, 0.7690654, 1.596482, 1, 1, 1, 1, 1,
0.2989914, 0.8047078, -0.7218237, 1, 1, 1, 1, 1,
0.302095, -0.3130621, 2.313604, 1, 1, 1, 1, 1,
0.3022193, 1.159931, 0.1930733, 1, 1, 1, 1, 1,
0.3022501, 0.5448868, 0.3173073, 0, 0, 1, 1, 1,
0.3051193, 0.01319929, -0.2225836, 1, 0, 0, 1, 1,
0.3102081, 0.3153301, 0.9926028, 1, 0, 0, 1, 1,
0.3108252, -0.1689279, 2.812513, 1, 0, 0, 1, 1,
0.314618, -0.187892, 3.161585, 1, 0, 0, 1, 1,
0.3164833, -1.468756, 2.043085, 1, 0, 0, 1, 1,
0.3169256, -0.5575579, 1.984559, 0, 0, 0, 1, 1,
0.3182868, -0.9704515, 2.563499, 0, 0, 0, 1, 1,
0.3186207, 2.217589, 0.1754638, 0, 0, 0, 1, 1,
0.3216141, -0.7274935, 1.926768, 0, 0, 0, 1, 1,
0.3220929, 0.2368356, 0.4526083, 0, 0, 0, 1, 1,
0.3256882, 0.09157883, 0.6671825, 0, 0, 0, 1, 1,
0.3262255, 0.5944088, -1.953623, 0, 0, 0, 1, 1,
0.3290994, 1.955542, -0.2782217, 1, 1, 1, 1, 1,
0.3317431, -0.1733, 3.621926, 1, 1, 1, 1, 1,
0.3320429, -0.9888562, 2.652958, 1, 1, 1, 1, 1,
0.3335423, 0.159336, 0.8236979, 1, 1, 1, 1, 1,
0.33507, 1.217602, 1.166505, 1, 1, 1, 1, 1,
0.33707, -0.01254879, 0.6470562, 1, 1, 1, 1, 1,
0.3374695, -1.249982, 2.469806, 1, 1, 1, 1, 1,
0.3394839, -1.162155, 0.8681632, 1, 1, 1, 1, 1,
0.3403412, -0.1469627, 0.8812593, 1, 1, 1, 1, 1,
0.3415884, -0.8035124, 3.2448, 1, 1, 1, 1, 1,
0.3426699, -1.137051, 1.954936, 1, 1, 1, 1, 1,
0.3479387, 0.3950077, 2.392238, 1, 1, 1, 1, 1,
0.3490053, 0.5354187, -0.4602499, 1, 1, 1, 1, 1,
0.3531781, -1.329054, 1.990095, 1, 1, 1, 1, 1,
0.3601466, -0.08673273, 0.8558947, 1, 1, 1, 1, 1,
0.3606682, -2.368449, 4.236084, 0, 0, 1, 1, 1,
0.3615655, -0.1921616, 2.9757, 1, 0, 0, 1, 1,
0.3617182, -0.1120998, 2.033887, 1, 0, 0, 1, 1,
0.3663306, -0.1528666, 1.070711, 1, 0, 0, 1, 1,
0.369622, 0.5617039, 0.5274085, 1, 0, 0, 1, 1,
0.3717736, -0.3653784, 0.826261, 1, 0, 0, 1, 1,
0.3733899, -0.6522368, 3.663927, 0, 0, 0, 1, 1,
0.3744106, -0.7728125, 1.807509, 0, 0, 0, 1, 1,
0.3774868, -1.344362, 3.658017, 0, 0, 0, 1, 1,
0.3776301, -0.2095584, 1.648069, 0, 0, 0, 1, 1,
0.378842, -0.9789935, 2.496284, 0, 0, 0, 1, 1,
0.3794039, -0.4658518, 2.806017, 0, 0, 0, 1, 1,
0.3855059, -1.856782, 3.178313, 0, 0, 0, 1, 1,
0.3868944, 0.9198426, 2.698189, 1, 1, 1, 1, 1,
0.3872148, -0.7477928, 1.20621, 1, 1, 1, 1, 1,
0.3925851, 1.271295, -1.307098, 1, 1, 1, 1, 1,
0.3931131, 0.794793, -0.3105129, 1, 1, 1, 1, 1,
0.3983884, -0.505018, 1.756969, 1, 1, 1, 1, 1,
0.4008653, -0.2740323, 1.630234, 1, 1, 1, 1, 1,
0.4012905, 1.017732, 0.1153917, 1, 1, 1, 1, 1,
0.4045633, 1.020396, 0.8717427, 1, 1, 1, 1, 1,
0.4078725, -0.5937115, 4.190504, 1, 1, 1, 1, 1,
0.4083997, -0.9607989, 2.848958, 1, 1, 1, 1, 1,
0.4127158, -0.2543992, 2.594842, 1, 1, 1, 1, 1,
0.4138812, -3.182467, 3.012517, 1, 1, 1, 1, 1,
0.414275, 0.6626563, 2.543377, 1, 1, 1, 1, 1,
0.4191654, 1.348015, -0.04228469, 1, 1, 1, 1, 1,
0.4224126, -1.774332, 1.72613, 1, 1, 1, 1, 1,
0.4309346, -0.6030664, 0.7656135, 0, 0, 1, 1, 1,
0.4320776, 0.9983575, -0.731756, 1, 0, 0, 1, 1,
0.4408494, 0.8339481, 1.350098, 1, 0, 0, 1, 1,
0.4447847, 1.390062, -0.3547669, 1, 0, 0, 1, 1,
0.4453285, 0.09107185, 1.202683, 1, 0, 0, 1, 1,
0.4488979, 0.9042849, 1.127775, 1, 0, 0, 1, 1,
0.4518947, 2.561025, 1.718448, 0, 0, 0, 1, 1,
0.452835, 0.7026845, -0.6514597, 0, 0, 0, 1, 1,
0.4549849, 0.6070697, 0.4538365, 0, 0, 0, 1, 1,
0.4552883, 0.09444808, 1.838751, 0, 0, 0, 1, 1,
0.4570123, -0.5175452, 2.724759, 0, 0, 0, 1, 1,
0.4626574, -0.3559138, 0.4048587, 0, 0, 0, 1, 1,
0.4677839, 0.8321185, 3.117013, 0, 0, 0, 1, 1,
0.4704343, -0.1514399, 1.369815, 1, 1, 1, 1, 1,
0.470785, -0.9356167, 2.64387, 1, 1, 1, 1, 1,
0.4736938, -0.04202214, 1.827704, 1, 1, 1, 1, 1,
0.4788649, -0.1492529, 3.325953, 1, 1, 1, 1, 1,
0.4879444, -0.6409746, 2.334955, 1, 1, 1, 1, 1,
0.4919159, 0.3834059, -0.07858484, 1, 1, 1, 1, 1,
0.4947424, 0.6004312, -0.3671044, 1, 1, 1, 1, 1,
0.4952637, 1.46871, -1.40707, 1, 1, 1, 1, 1,
0.5032049, -1.197494, 1.144721, 1, 1, 1, 1, 1,
0.5042191, 1.668372, 0.8330382, 1, 1, 1, 1, 1,
0.5060292, -2.054829, 2.528724, 1, 1, 1, 1, 1,
0.5083157, -1.069478, 1.671609, 1, 1, 1, 1, 1,
0.5091642, 0.130737, 1.137401, 1, 1, 1, 1, 1,
0.5096818, -0.0998341, 0.782981, 1, 1, 1, 1, 1,
0.5167664, -1.358536, 5.230333, 1, 1, 1, 1, 1,
0.5223469, 0.9873524, -0.1445266, 0, 0, 1, 1, 1,
0.5231105, -0.384272, 2.298945, 1, 0, 0, 1, 1,
0.5237929, -1.098289, 2.198642, 1, 0, 0, 1, 1,
0.527947, -1.052329, 2.535665, 1, 0, 0, 1, 1,
0.5285289, -0.204723, 1.389083, 1, 0, 0, 1, 1,
0.5293887, -2.007255, 1.99333, 1, 0, 0, 1, 1,
0.5323893, 0.1805431, -0.7206763, 0, 0, 0, 1, 1,
0.5389464, 0.4524682, 0.3515254, 0, 0, 0, 1, 1,
0.5458542, 1.484944, -0.5185022, 0, 0, 0, 1, 1,
0.5512809, -1.277551, 4.099673, 0, 0, 0, 1, 1,
0.5539672, -1.282818, 2.473068, 0, 0, 0, 1, 1,
0.5587084, -0.1262771, 1.67443, 0, 0, 0, 1, 1,
0.5594141, 0.8312027, 1.8957, 0, 0, 0, 1, 1,
0.5612947, -0.5619667, 2.773483, 1, 1, 1, 1, 1,
0.5628384, 0.4304485, -1.120458, 1, 1, 1, 1, 1,
0.5654873, 1.218451, -1.364085, 1, 1, 1, 1, 1,
0.5667936, -0.1564528, -0.5217295, 1, 1, 1, 1, 1,
0.5669639, 0.2639929, 1.696209, 1, 1, 1, 1, 1,
0.5737154, -0.296892, 2.621608, 1, 1, 1, 1, 1,
0.5769773, -0.8203548, 1.682416, 1, 1, 1, 1, 1,
0.5799049, -1.144746, 4.17511, 1, 1, 1, 1, 1,
0.5896754, -0.4290754, 0.08960699, 1, 1, 1, 1, 1,
0.594969, 0.3662548, 2.395464, 1, 1, 1, 1, 1,
0.5967103, -0.5899587, 1.060229, 1, 1, 1, 1, 1,
0.6015659, 0.3295659, 1.629156, 1, 1, 1, 1, 1,
0.6136903, 2.424364, -0.4937483, 1, 1, 1, 1, 1,
0.6145879, -1.779216, 4.121413, 1, 1, 1, 1, 1,
0.617494, 0.9824677, 1.916261, 1, 1, 1, 1, 1,
0.6196685, -2.166175, 1.416815, 0, 0, 1, 1, 1,
0.6224967, -1.727856, 3.869213, 1, 0, 0, 1, 1,
0.6250238, 0.405388, 2.281139, 1, 0, 0, 1, 1,
0.6321498, 0.31362, 2.508085, 1, 0, 0, 1, 1,
0.6349977, -0.4738639, 2.244625, 1, 0, 0, 1, 1,
0.637941, -0.6232387, 4.68865, 1, 0, 0, 1, 1,
0.6400055, -1.142542, 2.237119, 0, 0, 0, 1, 1,
0.6408321, 0.3123296, 1.526691, 0, 0, 0, 1, 1,
0.6444678, 0.06810657, 4.323243, 0, 0, 0, 1, 1,
0.6452591, -0.2429398, 1.43877, 0, 0, 0, 1, 1,
0.6488315, -0.1284861, 2.143871, 0, 0, 0, 1, 1,
0.6497111, 0.8579552, -0.5002618, 0, 0, 0, 1, 1,
0.6517915, -1.470822, 1.239265, 0, 0, 0, 1, 1,
0.655944, -1.329958, 2.426936, 1, 1, 1, 1, 1,
0.6570258, -0.2094103, 1.540356, 1, 1, 1, 1, 1,
0.6575659, 0.02103115, 3.244951, 1, 1, 1, 1, 1,
0.6586531, -0.3704504, 1.055022, 1, 1, 1, 1, 1,
0.6651763, 0.4889614, 0.1078456, 1, 1, 1, 1, 1,
0.6706077, 2.337093, -1.687486, 1, 1, 1, 1, 1,
0.6713861, 2.427254, 1.317821, 1, 1, 1, 1, 1,
0.6788077, 0.3127515, 0.5405932, 1, 1, 1, 1, 1,
0.6863173, 0.6536136, 0.2225238, 1, 1, 1, 1, 1,
0.6875269, -0.996926, 3.044532, 1, 1, 1, 1, 1,
0.7042284, -0.3057721, 3.620649, 1, 1, 1, 1, 1,
0.7044827, -0.09972577, 3.03321, 1, 1, 1, 1, 1,
0.7062513, 3.008885, 1.160012, 1, 1, 1, 1, 1,
0.7096609, 1.047908, 0.3038607, 1, 1, 1, 1, 1,
0.7129586, 0.03017499, 1.364974, 1, 1, 1, 1, 1,
0.7132736, -0.2615641, 1.163951, 0, 0, 1, 1, 1,
0.7163871, 1.428572, 0.07970537, 1, 0, 0, 1, 1,
0.7169609, -0.7441483, 1.726452, 1, 0, 0, 1, 1,
0.7234427, -0.2937927, 0.6230533, 1, 0, 0, 1, 1,
0.7273326, 0.63955, -0.5357651, 1, 0, 0, 1, 1,
0.7393951, 0.06734843, 2.223245, 1, 0, 0, 1, 1,
0.7500052, 0.05690631, 2.380716, 0, 0, 0, 1, 1,
0.757278, -1.426666, 1.210525, 0, 0, 0, 1, 1,
0.7626616, 0.007758252, 1.279687, 0, 0, 0, 1, 1,
0.76315, -0.09633587, 1.235811, 0, 0, 0, 1, 1,
0.7632018, 0.2495906, 2.645128, 0, 0, 0, 1, 1,
0.7647994, 0.6729612, 0.806479, 0, 0, 0, 1, 1,
0.766906, -1.070958, 0.960501, 0, 0, 0, 1, 1,
0.769235, 1.854845, 0.5930989, 1, 1, 1, 1, 1,
0.7786012, -0.4492981, 1.268965, 1, 1, 1, 1, 1,
0.781446, -0.1040827, 1.685003, 1, 1, 1, 1, 1,
0.7882612, 0.478868, 0.2853101, 1, 1, 1, 1, 1,
0.7904135, 0.6329988, 2.056679, 1, 1, 1, 1, 1,
0.7946544, 1.134307, 0.4417826, 1, 1, 1, 1, 1,
0.7958358, 0.2849156, 1.167267, 1, 1, 1, 1, 1,
0.7978985, 1.29786, -0.6131158, 1, 1, 1, 1, 1,
0.799156, -1.234983, 2.410927, 1, 1, 1, 1, 1,
0.8057554, 0.1824525, 1.267205, 1, 1, 1, 1, 1,
0.8075079, -0.8025922, 3.415534, 1, 1, 1, 1, 1,
0.8104714, -1.266599, 1.15547, 1, 1, 1, 1, 1,
0.8105502, 0.8210142, 0.4879863, 1, 1, 1, 1, 1,
0.8108754, -0.1953697, 0.02082315, 1, 1, 1, 1, 1,
0.8129451, 0.09125528, 1.850212, 1, 1, 1, 1, 1,
0.8172609, 1.377003, -0.6285405, 0, 0, 1, 1, 1,
0.825363, 1.210502, -1.412182, 1, 0, 0, 1, 1,
0.8308741, 0.4467014, 1.390356, 1, 0, 0, 1, 1,
0.8351681, 0.2295667, 1.53967, 1, 0, 0, 1, 1,
0.8442639, 0.4204655, 2.366982, 1, 0, 0, 1, 1,
0.8493249, -1.240139, 3.549675, 1, 0, 0, 1, 1,
0.8624108, 0.1646218, 3.579006, 0, 0, 0, 1, 1,
0.8625102, 1.049252, 0.9502493, 0, 0, 0, 1, 1,
0.8633184, -0.3662906, 1.822795, 0, 0, 0, 1, 1,
0.8656152, -1.372865, 2.351723, 0, 0, 0, 1, 1,
0.8684658, -0.7681348, 2.256088, 0, 0, 0, 1, 1,
0.8689826, 2.830273, -0.7095053, 0, 0, 0, 1, 1,
0.8699741, 1.39436, 0.06394193, 0, 0, 0, 1, 1,
0.8766289, -1.725785, 3.828141, 1, 1, 1, 1, 1,
0.8768899, 0.6958091, 0.6154705, 1, 1, 1, 1, 1,
0.8818997, -0.5084572, 3.320647, 1, 1, 1, 1, 1,
0.8827131, -0.3025379, 2.02937, 1, 1, 1, 1, 1,
0.8862879, -2.237774, 1.713635, 1, 1, 1, 1, 1,
0.8867962, 1.381652, -0.09150098, 1, 1, 1, 1, 1,
0.8904615, -0.9341096, 2.710115, 1, 1, 1, 1, 1,
0.8941355, -1.764978, 2.603076, 1, 1, 1, 1, 1,
0.8952043, -0.8049959, 4.537124, 1, 1, 1, 1, 1,
0.8990705, -0.4133801, 0.9279002, 1, 1, 1, 1, 1,
0.9005525, 0.301998, 2.120882, 1, 1, 1, 1, 1,
0.911337, -0.3686785, 2.62923, 1, 1, 1, 1, 1,
0.9148724, 0.4887571, 0.6134706, 1, 1, 1, 1, 1,
0.9196909, -0.1087541, 0.1853814, 1, 1, 1, 1, 1,
0.9215766, 0.101193, 1.648955, 1, 1, 1, 1, 1,
0.9228945, 0.6022899, -0.535769, 0, 0, 1, 1, 1,
0.9248414, 0.5188903, 1.361904, 1, 0, 0, 1, 1,
0.9283581, 0.01594661, 0.481261, 1, 0, 0, 1, 1,
0.9398118, -0.615899, 2.022661, 1, 0, 0, 1, 1,
0.9407623, -0.5147973, 2.092103, 1, 0, 0, 1, 1,
0.9482301, -0.9610316, 0.4761951, 1, 0, 0, 1, 1,
0.9564982, -0.06348805, -0.2025692, 0, 0, 0, 1, 1,
0.9702058, -0.6628414, 0.9202607, 0, 0, 0, 1, 1,
0.9712492, 0.219517, 0.6379509, 0, 0, 0, 1, 1,
0.9738526, 1.012851, 0.4737208, 0, 0, 0, 1, 1,
0.9785713, 0.5606859, 1.151138, 0, 0, 0, 1, 1,
0.9806032, 0.1559058, 1.210532, 0, 0, 0, 1, 1,
0.9811175, 0.6611023, 1.494147, 0, 0, 0, 1, 1,
0.9825341, -1.080942, 3.727139, 1, 1, 1, 1, 1,
0.9833145, 0.8447163, 1.580033, 1, 1, 1, 1, 1,
0.9856755, 1.825845, 0.1228266, 1, 1, 1, 1, 1,
0.9868698, -0.2581249, 2.546017, 1, 1, 1, 1, 1,
0.9886076, -0.7764762, 3.404459, 1, 1, 1, 1, 1,
0.9977093, -0.09711108, 2.555566, 1, 1, 1, 1, 1,
1.000462, 0.8923315, 1.086771, 1, 1, 1, 1, 1,
1.008334, -0.8323566, 3.643083, 1, 1, 1, 1, 1,
1.017035, 0.9141949, 0.9815316, 1, 1, 1, 1, 1,
1.019938, -1.146458, 1.063434, 1, 1, 1, 1, 1,
1.020891, 1.529538, -0.2372946, 1, 1, 1, 1, 1,
1.030472, -1.406418, 1.647261, 1, 1, 1, 1, 1,
1.039254, -0.04812093, 2.459522, 1, 1, 1, 1, 1,
1.045554, 1.139387, 0.3029214, 1, 1, 1, 1, 1,
1.064564, 0.3990052, 0.3176018, 1, 1, 1, 1, 1,
1.070901, 0.03792822, 1.156289, 0, 0, 1, 1, 1,
1.07742, -0.7962996, 2.394084, 1, 0, 0, 1, 1,
1.077816, 0.6852519, 0.3439878, 1, 0, 0, 1, 1,
1.079092, -0.9759263, 3.071575, 1, 0, 0, 1, 1,
1.080787, -0.585894, 1.648317, 1, 0, 0, 1, 1,
1.081311, 0.1463637, 1.242802, 1, 0, 0, 1, 1,
1.08326, -1.490507, 3.013036, 0, 0, 0, 1, 1,
1.089091, 0.9524446, 1.292199, 0, 0, 0, 1, 1,
1.093866, -0.178218, 2.30161, 0, 0, 0, 1, 1,
1.094683, 2.1912, 0.1956762, 0, 0, 0, 1, 1,
1.095175, -1.180019, 2.100239, 0, 0, 0, 1, 1,
1.0982, 2.147114, 0.5863945, 0, 0, 0, 1, 1,
1.106689, -0.03025606, 0.007327588, 0, 0, 0, 1, 1,
1.121522, 0.3903922, 2.092202, 1, 1, 1, 1, 1,
1.121804, -0.1137962, 2.086789, 1, 1, 1, 1, 1,
1.123159, 2.382876, -0.3278626, 1, 1, 1, 1, 1,
1.1246, -1.37236, 5.305597, 1, 1, 1, 1, 1,
1.124963, -0.02185891, 2.964363, 1, 1, 1, 1, 1,
1.144479, 0.8457655, 0.4838086, 1, 1, 1, 1, 1,
1.149366, 1.981056, -0.6081274, 1, 1, 1, 1, 1,
1.151205, 0.6154751, 1.118075, 1, 1, 1, 1, 1,
1.152913, 0.4794166, 0.6334314, 1, 1, 1, 1, 1,
1.154389, 2.749018, -0.1605201, 1, 1, 1, 1, 1,
1.158056, -0.5174243, 1.348354, 1, 1, 1, 1, 1,
1.159206, -0.8040779, 2.053237, 1, 1, 1, 1, 1,
1.164914, -0.6170826, 1.565243, 1, 1, 1, 1, 1,
1.168175, -1.406723, 2.257367, 1, 1, 1, 1, 1,
1.17037, -0.240899, 1.105603, 1, 1, 1, 1, 1,
1.172027, -1.002087, 2.185211, 0, 0, 1, 1, 1,
1.175347, -0.9173883, 2.781458, 1, 0, 0, 1, 1,
1.177241, 0.5887803, 2.409889, 1, 0, 0, 1, 1,
1.182065, 0.798375, 0.9719238, 1, 0, 0, 1, 1,
1.207636, -1.569282, 2.630957, 1, 0, 0, 1, 1,
1.212172, -0.8853137, 1.708251, 1, 0, 0, 1, 1,
1.221589, 1.758768, -0.8288727, 0, 0, 0, 1, 1,
1.221823, 1.248385, 0.2449737, 0, 0, 0, 1, 1,
1.224573, -0.6256286, 2.403651, 0, 0, 0, 1, 1,
1.241048, -0.04251811, 1.407642, 0, 0, 0, 1, 1,
1.254526, -0.6348953, 2.8568, 0, 0, 0, 1, 1,
1.25771, 0.4225221, 1.128313, 0, 0, 0, 1, 1,
1.260519, 1.598077, 1.959957, 0, 0, 0, 1, 1,
1.263952, 0.02741823, 1.520224, 1, 1, 1, 1, 1,
1.267939, -0.5911957, 3.546051, 1, 1, 1, 1, 1,
1.279116, -0.06692078, 2.409063, 1, 1, 1, 1, 1,
1.283974, 1.273851, 0.7453294, 1, 1, 1, 1, 1,
1.284042, 0.4825784, 0.690347, 1, 1, 1, 1, 1,
1.288884, -0.3853978, 2.492149, 1, 1, 1, 1, 1,
1.289791, 2.167386, 1.038798, 1, 1, 1, 1, 1,
1.302025, 1.011347, 0.5732732, 1, 1, 1, 1, 1,
1.306249, -0.0008331261, 0.6026601, 1, 1, 1, 1, 1,
1.318167, 0.1269331, 1.597184, 1, 1, 1, 1, 1,
1.31933, -1.750598, 1.329733, 1, 1, 1, 1, 1,
1.320083, 1.288386, 0.9989271, 1, 1, 1, 1, 1,
1.324519, 0.1921613, 0.8102319, 1, 1, 1, 1, 1,
1.333467, -0.2176629, 1.559767, 1, 1, 1, 1, 1,
1.334034, -0.7932368, 0.9119657, 1, 1, 1, 1, 1,
1.335814, -0.4323777, 2.369639, 0, 0, 1, 1, 1,
1.338739, 0.6924537, 1.661172, 1, 0, 0, 1, 1,
1.342404, -0.2321442, 1.568014, 1, 0, 0, 1, 1,
1.348674, -0.4359635, 3.64046, 1, 0, 0, 1, 1,
1.357865, 0.08257165, 1.753634, 1, 0, 0, 1, 1,
1.370069, -0.2403225, 1.012476, 1, 0, 0, 1, 1,
1.374803, 1.384496, 0.4098317, 0, 0, 0, 1, 1,
1.377132, -1.186122, 3.243898, 0, 0, 0, 1, 1,
1.377917, -0.1422935, 3.759547, 0, 0, 0, 1, 1,
1.379097, 0.2125123, 1.066013, 0, 0, 0, 1, 1,
1.382983, 0.3992159, 1.252566, 0, 0, 0, 1, 1,
1.386802, 0.2088207, 1.569525, 0, 0, 0, 1, 1,
1.387852, -0.222372, 1.700563, 0, 0, 0, 1, 1,
1.38994, -0.02804709, 0.7948862, 1, 1, 1, 1, 1,
1.396472, -1.61908, 1.148125, 1, 1, 1, 1, 1,
1.401804, -1.403077, 2.380756, 1, 1, 1, 1, 1,
1.403832, 1.721952, 1.503973, 1, 1, 1, 1, 1,
1.405761, -0.4489915, 3.064019, 1, 1, 1, 1, 1,
1.408732, 1.165929, 1.548789, 1, 1, 1, 1, 1,
1.412671, 0.2073013, 1.475551, 1, 1, 1, 1, 1,
1.414056, 0.3000872, 1.953949, 1, 1, 1, 1, 1,
1.436216, 1.638744, 1.104743, 1, 1, 1, 1, 1,
1.437317, -1.214326, 1.75562, 1, 1, 1, 1, 1,
1.465362, 0.2174934, -0.291075, 1, 1, 1, 1, 1,
1.4726, -0.2269255, 0.8983989, 1, 1, 1, 1, 1,
1.494094, 3.420288, 0.5553482, 1, 1, 1, 1, 1,
1.505011, 0.8571177, 1.38685, 1, 1, 1, 1, 1,
1.506112, -0.9940199, 2.997319, 1, 1, 1, 1, 1,
1.510504, 1.050846, 0.9701719, 0, 0, 1, 1, 1,
1.515904, 0.7144092, 2.03644, 1, 0, 0, 1, 1,
1.525156, 0.6338017, 2.004333, 1, 0, 0, 1, 1,
1.526193, -2.526142, 2.431784, 1, 0, 0, 1, 1,
1.527763, 0.1163284, 1.186185, 1, 0, 0, 1, 1,
1.528027, 0.2001663, 1.038368, 1, 0, 0, 1, 1,
1.551409, 0.4386403, 2.047632, 0, 0, 0, 1, 1,
1.562848, 0.4438332, 0.5989207, 0, 0, 0, 1, 1,
1.577225, 0.5593707, 3.040081, 0, 0, 0, 1, 1,
1.578631, -1.711931, 2.317144, 0, 0, 0, 1, 1,
1.586546, -1.253085, 4.595383, 0, 0, 0, 1, 1,
1.598879, 0.4139949, 1.632832, 0, 0, 0, 1, 1,
1.599034, 0.8774667, 0.6261919, 0, 0, 0, 1, 1,
1.601255, 0.1039584, 2.014662, 1, 1, 1, 1, 1,
1.607975, -0.5351274, 1.529065, 1, 1, 1, 1, 1,
1.61457, 0.6468107, 0.4860512, 1, 1, 1, 1, 1,
1.625879, 0.4056757, 1.257651, 1, 1, 1, 1, 1,
1.632335, 0.08612194, -1.26758, 1, 1, 1, 1, 1,
1.633614, 0.191946, 2.011885, 1, 1, 1, 1, 1,
1.645718, 0.5292677, 0.7280929, 1, 1, 1, 1, 1,
1.646063, 0.5900323, 2.065176, 1, 1, 1, 1, 1,
1.648199, -0.9247691, 1.177322, 1, 1, 1, 1, 1,
1.655035, -0.310851, -0.1445788, 1, 1, 1, 1, 1,
1.661252, 0.4634841, 2.650385, 1, 1, 1, 1, 1,
1.667151, -0.1572526, 0.02569716, 1, 1, 1, 1, 1,
1.677505, -0.09533522, 3.270953, 1, 1, 1, 1, 1,
1.683411, -1.087847, 1.765251, 1, 1, 1, 1, 1,
1.688309, 0.7278385, 0.8733064, 1, 1, 1, 1, 1,
1.693921, 1.520386, -0.01694378, 0, 0, 1, 1, 1,
1.699638, 0.1252592, 1.318733, 1, 0, 0, 1, 1,
1.699951, -1.005732, 0.01427047, 1, 0, 0, 1, 1,
1.707312, 0.04894637, 3.523342, 1, 0, 0, 1, 1,
1.720207, 0.1955831, 1.268123, 1, 0, 0, 1, 1,
1.73026, 0.2562734, -0.04553238, 1, 0, 0, 1, 1,
1.742902, 0.1808857, 1.708036, 0, 0, 0, 1, 1,
1.757174, 0.5013936, 2.350415, 0, 0, 0, 1, 1,
1.806504, -1.507443, 1.526847, 0, 0, 0, 1, 1,
1.807738, -0.5581262, 1.458785, 0, 0, 0, 1, 1,
1.809262, -1.218185, 3.028254, 0, 0, 0, 1, 1,
1.816855, -1.292078, 3.197773, 0, 0, 0, 1, 1,
1.838444, -0.8780451, 1.722958, 0, 0, 0, 1, 1,
1.842806, -0.4565367, 1.566499, 1, 1, 1, 1, 1,
1.849277, -0.5640317, 1.302821, 1, 1, 1, 1, 1,
1.863523, 1.582973, -0.1941075, 1, 1, 1, 1, 1,
1.866309, -0.09662513, 1.24361, 1, 1, 1, 1, 1,
1.876793, -0.689584, 0.6018556, 1, 1, 1, 1, 1,
1.892776, 0.4840977, 1.162148, 1, 1, 1, 1, 1,
1.901635, 0.5398521, -0.6094722, 1, 1, 1, 1, 1,
1.914002, -0.7047517, 0.8460215, 1, 1, 1, 1, 1,
1.928024, -1.264629, 4.192773, 1, 1, 1, 1, 1,
1.929099, -0.6272731, 3.862149, 1, 1, 1, 1, 1,
1.929208, -0.7352268, 2.334895, 1, 1, 1, 1, 1,
1.932981, 0.8570349, -0.7919164, 1, 1, 1, 1, 1,
1.94647, -0.2529397, 2.438953, 1, 1, 1, 1, 1,
1.967144, -1.111822, 1.438327, 1, 1, 1, 1, 1,
2.000155, -1.122908, 1.688027, 1, 1, 1, 1, 1,
2.014843, -1.593122, 2.423781, 0, 0, 1, 1, 1,
2.02278, 0.9862529, 2.07789, 1, 0, 0, 1, 1,
2.037475, -1.235925, 0.4488939, 1, 0, 0, 1, 1,
2.056573, -0.7322966, 1.444024, 1, 0, 0, 1, 1,
2.057691, 1.018836, 1.284785, 1, 0, 0, 1, 1,
2.065306, -1.190369, 3.390458, 1, 0, 0, 1, 1,
2.076243, 2.139035, 1.532258, 0, 0, 0, 1, 1,
2.125497, -1.24106, 1.041221, 0, 0, 0, 1, 1,
2.132547, 0.8055869, 0.1584284, 0, 0, 0, 1, 1,
2.161223, -1.303589, 5.187118, 0, 0, 0, 1, 1,
2.20286, -0.4544027, 2.276349, 0, 0, 0, 1, 1,
2.246448, 0.3697904, 1.317753, 0, 0, 0, 1, 1,
2.314465, 0.7421089, 1.794049, 0, 0, 0, 1, 1,
2.319353, -0.746934, 0.06797751, 1, 1, 1, 1, 1,
2.404656, -0.02130136, -0.5258599, 1, 1, 1, 1, 1,
2.427205, -1.11144, 3.282967, 1, 1, 1, 1, 1,
2.435358, 0.6649264, 1.455414, 1, 1, 1, 1, 1,
2.529714, -1.570241, 1.569973, 1, 1, 1, 1, 1,
2.599463, -0.899761, 0.7970409, 1, 1, 1, 1, 1,
3.186901, 1.519961, -0.2455861, 1, 1, 1, 1, 1
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
var radius = 9.864555;
var distance = 34.64883;
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
mvMatrix.translate( 0.08968878, -0.2260003, 0.2287145 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.64883);
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
