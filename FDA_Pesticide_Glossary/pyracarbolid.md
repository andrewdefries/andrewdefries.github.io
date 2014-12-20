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
-3.323527, -0.402286, -2.791647, 1, 0, 0, 1,
-2.726374, -0.2742302, -3.123612, 1, 0.007843138, 0, 1,
-2.570937, 0.2609649, -0.4109201, 1, 0.01176471, 0, 1,
-2.500758, -1.452864, -3.075108, 1, 0.01960784, 0, 1,
-2.450757, -0.2631631, -2.211388, 1, 0.02352941, 0, 1,
-2.249229, 1.222122, -2.052488, 1, 0.03137255, 0, 1,
-2.220981, -1.392214, -1.943314, 1, 0.03529412, 0, 1,
-2.195178, -0.9628704, -1.579139, 1, 0.04313726, 0, 1,
-2.192892, -1.571871, -2.225657, 1, 0.04705882, 0, 1,
-2.189781, -0.0663243, -0.8311344, 1, 0.05490196, 0, 1,
-2.104929, -0.4404477, -1.783214, 1, 0.05882353, 0, 1,
-2.08616, -0.5450299, -0.3280629, 1, 0.06666667, 0, 1,
-2.081628, 0.8294883, -1.197726, 1, 0.07058824, 0, 1,
-2.075799, 2.313063, -1.792136, 1, 0.07843138, 0, 1,
-2.058414, -1.269095, -0.8187554, 1, 0.08235294, 0, 1,
-2.058131, -0.160216, -1.908953, 1, 0.09019608, 0, 1,
-1.994781, -1.964123, -3.395899, 1, 0.09411765, 0, 1,
-1.957596, -0.8858906, -1.175238, 1, 0.1019608, 0, 1,
-1.919528, 1.372907, -1.218247, 1, 0.1098039, 0, 1,
-1.917696, -1.836331, -2.245807, 1, 0.1137255, 0, 1,
-1.894548, -1.044372, -3.813696, 1, 0.1215686, 0, 1,
-1.866924, -0.4423484, -1.976394, 1, 0.1254902, 0, 1,
-1.861234, 0.8193607, -1.630045, 1, 0.1333333, 0, 1,
-1.860331, -0.6327687, -0.1078411, 1, 0.1372549, 0, 1,
-1.846866, 0.05877991, -2.071358, 1, 0.145098, 0, 1,
-1.830339, -0.7275558, -0.7351601, 1, 0.1490196, 0, 1,
-1.819055, -0.8737748, -1.605821, 1, 0.1568628, 0, 1,
-1.782411, 0.6551909, 1.947976, 1, 0.1607843, 0, 1,
-1.78074, 0.8748506, -0.7044592, 1, 0.1686275, 0, 1,
-1.773657, 0.9510362, -2.018617, 1, 0.172549, 0, 1,
-1.770893, -0.1718162, -3.885815, 1, 0.1803922, 0, 1,
-1.768045, -1.143874, -2.866281, 1, 0.1843137, 0, 1,
-1.764848, -0.2055697, -0.2849428, 1, 0.1921569, 0, 1,
-1.750177, -1.070953, -1.444312, 1, 0.1960784, 0, 1,
-1.71894, 0.09392446, -0.9940175, 1, 0.2039216, 0, 1,
-1.712963, -1.257145, -2.682708, 1, 0.2117647, 0, 1,
-1.710101, -2.211712, -2.306234, 1, 0.2156863, 0, 1,
-1.698452, -0.2406533, -2.599448, 1, 0.2235294, 0, 1,
-1.698048, -0.3741504, -2.280428, 1, 0.227451, 0, 1,
-1.68598, 0.08506324, -3.078609, 1, 0.2352941, 0, 1,
-1.685592, -0.5686355, -2.993096, 1, 0.2392157, 0, 1,
-1.676024, -0.3060274, -1.483704, 1, 0.2470588, 0, 1,
-1.647324, 0.7462381, -0.7261621, 1, 0.2509804, 0, 1,
-1.646558, 1.240407, -0.1411275, 1, 0.2588235, 0, 1,
-1.624966, 0.2189836, -3.490432, 1, 0.2627451, 0, 1,
-1.622755, 0.1702285, -1.08322, 1, 0.2705882, 0, 1,
-1.621817, -1.888002, -2.59276, 1, 0.2745098, 0, 1,
-1.619309, -0.6089044, -2.396144, 1, 0.282353, 0, 1,
-1.615156, 0.8419858, -2.451758, 1, 0.2862745, 0, 1,
-1.61164, -0.9277656, -1.228696, 1, 0.2941177, 0, 1,
-1.611171, 0.6010201, -0.7035742, 1, 0.3019608, 0, 1,
-1.607819, 0.60543, -0.1952345, 1, 0.3058824, 0, 1,
-1.592466, 0.1000469, -1.276264, 1, 0.3137255, 0, 1,
-1.590218, 1.452923, -0.5555744, 1, 0.3176471, 0, 1,
-1.560582, -0.726362, -2.606266, 1, 0.3254902, 0, 1,
-1.559185, 1.400854, -1.88176, 1, 0.3294118, 0, 1,
-1.557718, 0.387845, -0.2983441, 1, 0.3372549, 0, 1,
-1.549387, -1.385444, -1.377055, 1, 0.3411765, 0, 1,
-1.54488, -0.4584126, -2.49813, 1, 0.3490196, 0, 1,
-1.539391, 0.5650199, -0.8228875, 1, 0.3529412, 0, 1,
-1.529454, 0.11653, -0.5783998, 1, 0.3607843, 0, 1,
-1.519382, 1.444712, 0.2886992, 1, 0.3647059, 0, 1,
-1.508133, 0.5983223, -2.71325, 1, 0.372549, 0, 1,
-1.506546, -0.5594166, -0.4335085, 1, 0.3764706, 0, 1,
-1.499951, -1.04167, -3.03061, 1, 0.3843137, 0, 1,
-1.499534, -1.496908, -3.224403, 1, 0.3882353, 0, 1,
-1.474516, -1.616794, -1.959208, 1, 0.3960784, 0, 1,
-1.472273, -0.9873197, -0.7450758, 1, 0.4039216, 0, 1,
-1.471545, -0.185074, -1.645397, 1, 0.4078431, 0, 1,
-1.470604, -0.8048047, -1.266613, 1, 0.4156863, 0, 1,
-1.45207, -0.1940015, -2.362978, 1, 0.4196078, 0, 1,
-1.446411, 0.2675966, -2.424284, 1, 0.427451, 0, 1,
-1.438462, 0.6063101, -0.9436355, 1, 0.4313726, 0, 1,
-1.437805, 0.2878661, -0.4414165, 1, 0.4392157, 0, 1,
-1.424897, -0.6495526, -2.13142, 1, 0.4431373, 0, 1,
-1.421327, 0.6730551, -1.224363, 1, 0.4509804, 0, 1,
-1.417857, 0.1611791, -3.284529, 1, 0.454902, 0, 1,
-1.397641, 0.4573007, -2.623163, 1, 0.4627451, 0, 1,
-1.38971, -1.145642, -2.647292, 1, 0.4666667, 0, 1,
-1.385644, 0.2923148, -1.344029, 1, 0.4745098, 0, 1,
-1.382714, -0.1970199, -1.289747, 1, 0.4784314, 0, 1,
-1.35662, -1.103847, -0.4136073, 1, 0.4862745, 0, 1,
-1.353971, -0.5382916, -1.740877, 1, 0.4901961, 0, 1,
-1.352285, -1.108373, -3.044026, 1, 0.4980392, 0, 1,
-1.344475, 1.290435, -0.5541258, 1, 0.5058824, 0, 1,
-1.340169, -0.714148, -2.777532, 1, 0.509804, 0, 1,
-1.336415, 2.409154, 0.1129452, 1, 0.5176471, 0, 1,
-1.334284, -0.5476153, -2.111239, 1, 0.5215687, 0, 1,
-1.329783, 0.02268363, -0.9593838, 1, 0.5294118, 0, 1,
-1.329276, -0.9267435, -3.280379, 1, 0.5333334, 0, 1,
-1.32162, -0.393112, -1.918847, 1, 0.5411765, 0, 1,
-1.315833, 1.462045, 0.1763902, 1, 0.5450981, 0, 1,
-1.29642, 0.4402902, -1.050866, 1, 0.5529412, 0, 1,
-1.285878, 0.9828474, 0.6998935, 1, 0.5568628, 0, 1,
-1.283726, -1.327135, -3.158735, 1, 0.5647059, 0, 1,
-1.278972, -0.07945774, -1.551952, 1, 0.5686275, 0, 1,
-1.273378, -0.7991487, -0.9599007, 1, 0.5764706, 0, 1,
-1.268142, -0.01435514, -2.440698, 1, 0.5803922, 0, 1,
-1.26278, -0.989401, -0.1390577, 1, 0.5882353, 0, 1,
-1.255176, 0.7948672, -2.626776, 1, 0.5921569, 0, 1,
-1.251582, -1.603606, -2.942188, 1, 0.6, 0, 1,
-1.25046, 0.1827014, -0.2417236, 1, 0.6078432, 0, 1,
-1.243961, -0.6923643, -1.720514, 1, 0.6117647, 0, 1,
-1.24317, -1.527721, -1.110241, 1, 0.6196079, 0, 1,
-1.237001, -0.6879247, -2.170555, 1, 0.6235294, 0, 1,
-1.235214, -0.6032919, -0.7278909, 1, 0.6313726, 0, 1,
-1.218201, -0.2970476, -2.081587, 1, 0.6352941, 0, 1,
-1.216805, 0.9222913, -1.433823, 1, 0.6431373, 0, 1,
-1.193055, 0.8170229, 0.631786, 1, 0.6470588, 0, 1,
-1.191507, -0.3417535, -2.514654, 1, 0.654902, 0, 1,
-1.184376, 0.3596855, -0.533089, 1, 0.6588235, 0, 1,
-1.17817, -0.4425735, -1.597084, 1, 0.6666667, 0, 1,
-1.177024, 0.1310912, -1.148601, 1, 0.6705883, 0, 1,
-1.164491, -1.080899, -0.9433419, 1, 0.6784314, 0, 1,
-1.160335, 0.3935475, -2.428114, 1, 0.682353, 0, 1,
-1.155772, 0.5535108, -1.11289, 1, 0.6901961, 0, 1,
-1.153765, 0.4113204, -0.05511421, 1, 0.6941177, 0, 1,
-1.15089, -0.9188774, -2.238359, 1, 0.7019608, 0, 1,
-1.145454, -0.6892184, -1.946773, 1, 0.7098039, 0, 1,
-1.145139, 0.9296479, 0.3570882, 1, 0.7137255, 0, 1,
-1.144723, -0.4321536, -2.366335, 1, 0.7215686, 0, 1,
-1.140936, 0.994692, -1.175678, 1, 0.7254902, 0, 1,
-1.139329, -1.465308, -1.527608, 1, 0.7333333, 0, 1,
-1.132377, -0.281931, -2.758091, 1, 0.7372549, 0, 1,
-1.131634, 0.143745, -1.02324, 1, 0.7450981, 0, 1,
-1.114345, 0.5855026, -2.011782, 1, 0.7490196, 0, 1,
-1.099315, -0.274455, -2.577141, 1, 0.7568628, 0, 1,
-1.087873, 0.2586324, -2.094732, 1, 0.7607843, 0, 1,
-1.075775, -0.1439554, -2.608934, 1, 0.7686275, 0, 1,
-1.074149, -0.4391354, -3.107564, 1, 0.772549, 0, 1,
-1.067065, 0.8032215, -1.50835, 1, 0.7803922, 0, 1,
-1.057133, 0.07277772, -2.365266, 1, 0.7843137, 0, 1,
-1.055097, -2.4611, -1.113308, 1, 0.7921569, 0, 1,
-1.054622, -0.1637442, -1.677552, 1, 0.7960784, 0, 1,
-1.052963, 0.5524926, 0.02476159, 1, 0.8039216, 0, 1,
-1.049403, -0.03625213, -1.21009, 1, 0.8117647, 0, 1,
-1.040126, 0.7694222, 0.4164849, 1, 0.8156863, 0, 1,
-1.03958, -0.6117929, -2.037498, 1, 0.8235294, 0, 1,
-1.037106, -0.3080414, -2.179529, 1, 0.827451, 0, 1,
-1.032439, 1.057632, 0.9243845, 1, 0.8352941, 0, 1,
-1.031664, -0.5312653, -4.101637, 1, 0.8392157, 0, 1,
-1.026896, 0.1034899, -0.4104089, 1, 0.8470588, 0, 1,
-1.019541, 0.1177611, 0.2712145, 1, 0.8509804, 0, 1,
-1.016364, -0.2661878, -1.97487, 1, 0.8588235, 0, 1,
-1.003436, -0.9665776, -1.770079, 1, 0.8627451, 0, 1,
-1.002823, 1.884246, -1.119803, 1, 0.8705882, 0, 1,
-0.9951857, 0.8131654, -0.8740891, 1, 0.8745098, 0, 1,
-0.9905596, -0.4313745, -1.801701, 1, 0.8823529, 0, 1,
-0.9905037, 0.5623894, -0.659391, 1, 0.8862745, 0, 1,
-0.9887904, -1.197809, -3.250828, 1, 0.8941177, 0, 1,
-0.9884955, 1.520009, -0.8319708, 1, 0.8980392, 0, 1,
-0.9879044, 1.155051, -0.01096215, 1, 0.9058824, 0, 1,
-0.9834264, 0.394442, -1.682582, 1, 0.9137255, 0, 1,
-0.971765, 1.293277, -1.827959, 1, 0.9176471, 0, 1,
-0.9582648, -0.9042857, -2.424191, 1, 0.9254902, 0, 1,
-0.9496688, 1.114438, -1.802946, 1, 0.9294118, 0, 1,
-0.9455816, -0.09280953, -1.016525, 1, 0.9372549, 0, 1,
-0.9421252, -2.742008, -1.464993, 1, 0.9411765, 0, 1,
-0.9373916, -1.608139, -3.206739, 1, 0.9490196, 0, 1,
-0.9372318, 0.5216383, -1.079361, 1, 0.9529412, 0, 1,
-0.9367797, 0.8684941, -0.15631, 1, 0.9607843, 0, 1,
-0.9284123, -0.1494351, -2.428352, 1, 0.9647059, 0, 1,
-0.9187569, 0.1625113, -2.388846, 1, 0.972549, 0, 1,
-0.9158363, 0.2086521, -1.843804, 1, 0.9764706, 0, 1,
-0.9150194, 0.7476041, 0.07106923, 1, 0.9843137, 0, 1,
-0.9145651, 0.43624, -1.064776, 1, 0.9882353, 0, 1,
-0.9112759, 0.123738, -1.614954, 1, 0.9960784, 0, 1,
-0.9001096, -0.1096296, -1.819709, 0.9960784, 1, 0, 1,
-0.8971749, -0.5938879, -3.392064, 0.9921569, 1, 0, 1,
-0.8933668, 0.07143794, -1.896992, 0.9843137, 1, 0, 1,
-0.8871218, -0.8398478, -2.811341, 0.9803922, 1, 0, 1,
-0.8825778, 0.9862314, -0.7158815, 0.972549, 1, 0, 1,
-0.8820465, -0.4805119, -2.095214, 0.9686275, 1, 0, 1,
-0.8750672, 0.2006639, 0.05810035, 0.9607843, 1, 0, 1,
-0.8722016, 0.5188885, -2.406363, 0.9568627, 1, 0, 1,
-0.8716564, -0.9402789, -1.97347, 0.9490196, 1, 0, 1,
-0.8690344, 0.4628202, -0.2584276, 0.945098, 1, 0, 1,
-0.8651556, -1.407173, -2.110813, 0.9372549, 1, 0, 1,
-0.8620128, -1.445483, -2.89684, 0.9333333, 1, 0, 1,
-0.8606352, 0.4682343, -1.149699, 0.9254902, 1, 0, 1,
-0.8586385, -0.2287893, -1.226792, 0.9215686, 1, 0, 1,
-0.857888, -0.3659467, -0.5489816, 0.9137255, 1, 0, 1,
-0.8563782, -1.786993, -2.565807, 0.9098039, 1, 0, 1,
-0.8488665, -0.3369365, -1.725468, 0.9019608, 1, 0, 1,
-0.8478014, -0.1033345, -0.3107374, 0.8941177, 1, 0, 1,
-0.8473741, 0.2343078, -2.353777, 0.8901961, 1, 0, 1,
-0.8450479, 0.01474042, -1.885066, 0.8823529, 1, 0, 1,
-0.8390041, 2.075753, 0.07535628, 0.8784314, 1, 0, 1,
-0.8352832, 1.948802, 0.0213435, 0.8705882, 1, 0, 1,
-0.8329064, 1.277003, -1.158252, 0.8666667, 1, 0, 1,
-0.8323237, -0.6234887, 0.1353386, 0.8588235, 1, 0, 1,
-0.828981, -1.38058, -0.8930405, 0.854902, 1, 0, 1,
-0.8283753, 0.1122453, -1.701368, 0.8470588, 1, 0, 1,
-0.8260846, -0.3697875, -2.661443, 0.8431373, 1, 0, 1,
-0.8171951, 2.446874, -1.032315, 0.8352941, 1, 0, 1,
-0.8115859, -0.478385, -2.739138, 0.8313726, 1, 0, 1,
-0.8063642, 0.6054556, -0.8674061, 0.8235294, 1, 0, 1,
-0.7991515, -0.7267465, -0.8551099, 0.8196079, 1, 0, 1,
-0.798974, -0.09780117, -3.480324, 0.8117647, 1, 0, 1,
-0.7884735, 0.00559981, -0.9965638, 0.8078431, 1, 0, 1,
-0.787365, 0.2160074, -0.2367447, 0.8, 1, 0, 1,
-0.7821723, -1.876559, -3.334876, 0.7921569, 1, 0, 1,
-0.7806354, -1.687324, -3.635554, 0.7882353, 1, 0, 1,
-0.777079, -1.375694, -2.229358, 0.7803922, 1, 0, 1,
-0.7755292, -0.3371338, -2.137429, 0.7764706, 1, 0, 1,
-0.7738602, -1.041692, -2.920485, 0.7686275, 1, 0, 1,
-0.7736403, 1.867828, 0.5806821, 0.7647059, 1, 0, 1,
-0.7685837, -0.1990941, -3.23864, 0.7568628, 1, 0, 1,
-0.7660584, 1.119827, -1.021343, 0.7529412, 1, 0, 1,
-0.7650644, -0.6903055, -2.924387, 0.7450981, 1, 0, 1,
-0.7621225, 0.08467703, -2.54782, 0.7411765, 1, 0, 1,
-0.7611021, 0.2903281, -0.6861852, 0.7333333, 1, 0, 1,
-0.7587765, 1.977524, 0.05183138, 0.7294118, 1, 0, 1,
-0.7563792, 1.160491, -1.678934, 0.7215686, 1, 0, 1,
-0.7555786, -0.6402364, -1.609834, 0.7176471, 1, 0, 1,
-0.755069, -0.8917497, -2.519064, 0.7098039, 1, 0, 1,
-0.7511157, 0.2830605, 0.3296081, 0.7058824, 1, 0, 1,
-0.7504285, -0.1422102, -2.152171, 0.6980392, 1, 0, 1,
-0.7335507, -2.223899, -2.563674, 0.6901961, 1, 0, 1,
-0.7285306, -1.228361, -0.1394283, 0.6862745, 1, 0, 1,
-0.7187429, -0.4594497, -2.925399, 0.6784314, 1, 0, 1,
-0.7129505, -0.5837176, -3.535378, 0.6745098, 1, 0, 1,
-0.7102104, -1.049641, -3.096388, 0.6666667, 1, 0, 1,
-0.7096995, 0.2635123, -0.6412074, 0.6627451, 1, 0, 1,
-0.7055284, 0.7074361, -1.230315, 0.654902, 1, 0, 1,
-0.7040259, -0.5993747, -3.065306, 0.6509804, 1, 0, 1,
-0.7026513, 1.164456, -0.6334695, 0.6431373, 1, 0, 1,
-0.6951628, -1.063542, -2.717209, 0.6392157, 1, 0, 1,
-0.694113, -0.1129313, -1.878659, 0.6313726, 1, 0, 1,
-0.6864663, 0.6257732, 0.559646, 0.627451, 1, 0, 1,
-0.6826431, -0.1790937, -1.272184, 0.6196079, 1, 0, 1,
-0.6803591, 0.9586928, 0.3500853, 0.6156863, 1, 0, 1,
-0.6686493, 0.7059836, -0.9609506, 0.6078432, 1, 0, 1,
-0.6652726, -2.011419, -2.59143, 0.6039216, 1, 0, 1,
-0.6646279, 0.6155338, -1.982985, 0.5960785, 1, 0, 1,
-0.6621798, 1.653231, 1.123065, 0.5882353, 1, 0, 1,
-0.661803, 1.705173, 0.5553144, 0.5843138, 1, 0, 1,
-0.657684, 0.7451219, 0.5957243, 0.5764706, 1, 0, 1,
-0.6546651, 1.016612, -1.80929, 0.572549, 1, 0, 1,
-0.6539509, -0.009002876, -2.543673, 0.5647059, 1, 0, 1,
-0.6515385, -2.422266, -4.053225, 0.5607843, 1, 0, 1,
-0.6500612, 2.315209, -3.238185, 0.5529412, 1, 0, 1,
-0.6490365, -2.211908, -3.569728, 0.5490196, 1, 0, 1,
-0.6473916, -0.7143102, -2.030143, 0.5411765, 1, 0, 1,
-0.647019, -1.554977, -4.001537, 0.5372549, 1, 0, 1,
-0.645082, 0.7405694, -0.6649499, 0.5294118, 1, 0, 1,
-0.6415151, -1.181093, -3.527496, 0.5254902, 1, 0, 1,
-0.6411492, -1.401293, -2.548331, 0.5176471, 1, 0, 1,
-0.6409745, 1.498658, -0.5024635, 0.5137255, 1, 0, 1,
-0.6358114, -0.3326544, -1.385713, 0.5058824, 1, 0, 1,
-0.633822, -0.5905679, -0.1145213, 0.5019608, 1, 0, 1,
-0.62953, 1.243235, -2.043432, 0.4941176, 1, 0, 1,
-0.6283391, 0.162575, -2.060676, 0.4862745, 1, 0, 1,
-0.6283269, -1.15834, -1.934226, 0.4823529, 1, 0, 1,
-0.6189107, 0.5675454, -2.49309, 0.4745098, 1, 0, 1,
-0.6136187, -0.4922533, -1.489607, 0.4705882, 1, 0, 1,
-0.6129201, 0.06996128, -2.321224, 0.4627451, 1, 0, 1,
-0.6125436, -1.214799, -3.472869, 0.4588235, 1, 0, 1,
-0.6084201, 0.01833396, -2.283257, 0.4509804, 1, 0, 1,
-0.604735, 0.7347286, 0.2954882, 0.4470588, 1, 0, 1,
-0.6027105, 0.3008549, -1.184714, 0.4392157, 1, 0, 1,
-0.6012871, 1.081256, -1.006115, 0.4352941, 1, 0, 1,
-0.6006708, 0.2026914, -0.6563494, 0.427451, 1, 0, 1,
-0.5936577, -0.146426, -1.242305, 0.4235294, 1, 0, 1,
-0.5850068, -2.322523, -2.335386, 0.4156863, 1, 0, 1,
-0.583806, -0.532271, -1.814997, 0.4117647, 1, 0, 1,
-0.5829296, 0.3596775, -1.196186, 0.4039216, 1, 0, 1,
-0.5812039, 0.01079403, -1.873702, 0.3960784, 1, 0, 1,
-0.5792047, 0.8722147, -0.432098, 0.3921569, 1, 0, 1,
-0.5717804, -0.2224117, -1.325918, 0.3843137, 1, 0, 1,
-0.5715632, -0.4177319, -0.6404551, 0.3803922, 1, 0, 1,
-0.5693145, 0.0029831, -0.3478482, 0.372549, 1, 0, 1,
-0.5662383, 0.8617516, 1.441827, 0.3686275, 1, 0, 1,
-0.5611674, 0.2107444, -1.111136, 0.3607843, 1, 0, 1,
-0.5596138, -0.3694465, -1.937701, 0.3568628, 1, 0, 1,
-0.5594455, -2.515722, -1.983146, 0.3490196, 1, 0, 1,
-0.5577351, 0.1166602, -0.6643624, 0.345098, 1, 0, 1,
-0.5542399, -0.1424857, -4.144113, 0.3372549, 1, 0, 1,
-0.550373, 1.520806, 1.068424, 0.3333333, 1, 0, 1,
-0.5498269, 0.8963256, -1.70874, 0.3254902, 1, 0, 1,
-0.546829, -0.1638076, -2.129822, 0.3215686, 1, 0, 1,
-0.5464642, 0.4792274, -0.5935751, 0.3137255, 1, 0, 1,
-0.5455996, -0.3954874, -1.440048, 0.3098039, 1, 0, 1,
-0.5452305, 1.334441, -0.5585141, 0.3019608, 1, 0, 1,
-0.5410098, 0.9585778, -0.07990199, 0.2941177, 1, 0, 1,
-0.540616, 0.4672292, -1.249796, 0.2901961, 1, 0, 1,
-0.5399708, -0.2750051, -3.311512, 0.282353, 1, 0, 1,
-0.529723, 0.3098119, -2.518407, 0.2784314, 1, 0, 1,
-0.5241799, 1.199318, -0.4357941, 0.2705882, 1, 0, 1,
-0.5216374, 0.4904815, -0.08996098, 0.2666667, 1, 0, 1,
-0.5209039, 0.01259171, -1.915433, 0.2588235, 1, 0, 1,
-0.5179377, 0.5318791, -1.485592, 0.254902, 1, 0, 1,
-0.5170141, 1.346691, -0.2145869, 0.2470588, 1, 0, 1,
-0.5161541, 0.1123074, -1.879652, 0.2431373, 1, 0, 1,
-0.5156035, 1.000509, -0.8024997, 0.2352941, 1, 0, 1,
-0.5122883, 2.130359, -0.9427354, 0.2313726, 1, 0, 1,
-0.5105311, 0.6871958, 0.7530796, 0.2235294, 1, 0, 1,
-0.500861, 0.537044, 1.761951, 0.2196078, 1, 0, 1,
-0.4927618, -0.2555209, -3.913202, 0.2117647, 1, 0, 1,
-0.4900815, -0.5295812, -3.142325, 0.2078431, 1, 0, 1,
-0.4873168, 0.8655322, 0.4530197, 0.2, 1, 0, 1,
-0.4838799, 1.635344, 0.1658285, 0.1921569, 1, 0, 1,
-0.4838572, -0.4346932, -3.058853, 0.1882353, 1, 0, 1,
-0.4813547, 0.5348185, -1.277536, 0.1803922, 1, 0, 1,
-0.4808784, 0.0990518, -1.184926, 0.1764706, 1, 0, 1,
-0.4781847, 0.2507044, -1.280908, 0.1686275, 1, 0, 1,
-0.4768418, 0.3895024, 1.197764, 0.1647059, 1, 0, 1,
-0.4735472, -0.2557952, -1.749785, 0.1568628, 1, 0, 1,
-0.4680306, 1.483211, 0.5396377, 0.1529412, 1, 0, 1,
-0.46639, -1.609416, -3.844607, 0.145098, 1, 0, 1,
-0.4555508, -1.83618, -2.038877, 0.1411765, 1, 0, 1,
-0.4509464, 1.992628, -0.4489474, 0.1333333, 1, 0, 1,
-0.4496735, 0.8916145, -0.6584123, 0.1294118, 1, 0, 1,
-0.4468892, -0.07734953, -2.549256, 0.1215686, 1, 0, 1,
-0.44542, -0.3927667, -0.4090292, 0.1176471, 1, 0, 1,
-0.4382108, 0.07504609, -2.146221, 0.1098039, 1, 0, 1,
-0.4364839, -0.2979742, -2.166258, 0.1058824, 1, 0, 1,
-0.4342987, 0.4212589, -0.544874, 0.09803922, 1, 0, 1,
-0.4327201, -0.002050054, -3.075093, 0.09019608, 1, 0, 1,
-0.4315996, 0.2554894, -1.239469, 0.08627451, 1, 0, 1,
-0.4310078, 1.334697, -0.166286, 0.07843138, 1, 0, 1,
-0.4291828, -0.3718353, -3.249586, 0.07450981, 1, 0, 1,
-0.4265028, 0.3986789, -0.4761187, 0.06666667, 1, 0, 1,
-0.4257906, -0.8283932, -3.267429, 0.0627451, 1, 0, 1,
-0.424687, -0.2220163, -1.408516, 0.05490196, 1, 0, 1,
-0.424645, 0.5888363, -1.146939, 0.05098039, 1, 0, 1,
-0.4220794, 1.437637, -1.515108, 0.04313726, 1, 0, 1,
-0.4168223, 0.6437126, -0.08771864, 0.03921569, 1, 0, 1,
-0.4096263, -0.5206352, -2.961506, 0.03137255, 1, 0, 1,
-0.4084036, 0.7455571, -1.240245, 0.02745098, 1, 0, 1,
-0.4058226, 0.1865835, -0.765961, 0.01960784, 1, 0, 1,
-0.4043635, -1.205357, -3.176194, 0.01568628, 1, 0, 1,
-0.394008, -0.7352145, -3.429649, 0.007843138, 1, 0, 1,
-0.3913569, -0.8692768, -3.709923, 0.003921569, 1, 0, 1,
-0.3901972, 0.2424529, -2.5843, 0, 1, 0.003921569, 1,
-0.389766, 0.5301566, -1.783385, 0, 1, 0.01176471, 1,
-0.3884358, -0.5153298, -1.477836, 0, 1, 0.01568628, 1,
-0.3878437, 1.92883, -0.006468114, 0, 1, 0.02352941, 1,
-0.386139, -0.4297493, -1.823376, 0, 1, 0.02745098, 1,
-0.3859675, 0.6576002, -0.1312962, 0, 1, 0.03529412, 1,
-0.3777139, 0.2722897, -1.525029, 0, 1, 0.03921569, 1,
-0.3723803, 0.072428, -1.868831, 0, 1, 0.04705882, 1,
-0.3722086, 0.2494828, 0.102687, 0, 1, 0.05098039, 1,
-0.3706062, 0.3860651, 1.507246, 0, 1, 0.05882353, 1,
-0.3703156, -1.87543, -1.37595, 0, 1, 0.0627451, 1,
-0.3692719, -0.4425089, -1.679857, 0, 1, 0.07058824, 1,
-0.3666853, 0.08702973, -0.2144958, 0, 1, 0.07450981, 1,
-0.3663895, 1.398749, 0.8988146, 0, 1, 0.08235294, 1,
-0.3608907, 0.4057082, 0.6377989, 0, 1, 0.08627451, 1,
-0.3592548, 0.3919402, -0.5218555, 0, 1, 0.09411765, 1,
-0.3567463, -0.8360764, -2.16863, 0, 1, 0.1019608, 1,
-0.3544185, -0.6940336, -2.12634, 0, 1, 0.1058824, 1,
-0.3445517, -1.115018, -4.26878, 0, 1, 0.1137255, 1,
-0.3433672, -0.4111131, -2.331886, 0, 1, 0.1176471, 1,
-0.3406359, 0.4720807, -1.371158, 0, 1, 0.1254902, 1,
-0.3405243, 0.829764, 0.7782835, 0, 1, 0.1294118, 1,
-0.3348304, 0.03305508, -2.264275, 0, 1, 0.1372549, 1,
-0.3303818, -0.4202884, -2.167019, 0, 1, 0.1411765, 1,
-0.3303481, 1.096916, -1.69677, 0, 1, 0.1490196, 1,
-0.3296847, 0.05342856, -2.15745, 0, 1, 0.1529412, 1,
-0.3260276, -1.714189, -1.844209, 0, 1, 0.1607843, 1,
-0.3255502, 0.6181461, -2.481311, 0, 1, 0.1647059, 1,
-0.3243916, 0.4054441, 0.9335939, 0, 1, 0.172549, 1,
-0.324242, -0.9373331, -3.258353, 0, 1, 0.1764706, 1,
-0.3241971, 0.2986005, -1.757194, 0, 1, 0.1843137, 1,
-0.3218625, -0.5753251, -0.9906443, 0, 1, 0.1882353, 1,
-0.3214344, 1.901446, -0.3437983, 0, 1, 0.1960784, 1,
-0.3196947, 0.5443437, 0.5280318, 0, 1, 0.2039216, 1,
-0.318664, -0.9315971, -0.908985, 0, 1, 0.2078431, 1,
-0.3167068, 0.3977545, -1.060246, 0, 1, 0.2156863, 1,
-0.3081984, 0.3797917, -2.670514, 0, 1, 0.2196078, 1,
-0.3069393, -0.5380322, -2.703525, 0, 1, 0.227451, 1,
-0.3037643, 0.7311168, -1.555745, 0, 1, 0.2313726, 1,
-0.2991064, 0.9165108, -0.5356194, 0, 1, 0.2392157, 1,
-0.2965813, -0.6812697, -2.661702, 0, 1, 0.2431373, 1,
-0.2962567, -0.1771027, -0.6011961, 0, 1, 0.2509804, 1,
-0.2962216, 1.418488, 3.484927, 0, 1, 0.254902, 1,
-0.2893037, 1.197766, -0.206089, 0, 1, 0.2627451, 1,
-0.2889122, 0.4213914, 0.4620031, 0, 1, 0.2666667, 1,
-0.2829852, -0.2372697, -0.4781542, 0, 1, 0.2745098, 1,
-0.2822144, 0.5672951, 0.3999247, 0, 1, 0.2784314, 1,
-0.274716, 0.9414389, 0.9345043, 0, 1, 0.2862745, 1,
-0.2718348, 2.574602, -1.874834, 0, 1, 0.2901961, 1,
-0.268264, 0.6113585, -2.034772, 0, 1, 0.2980392, 1,
-0.2681201, -0.1951806, -1.633563, 0, 1, 0.3058824, 1,
-0.2659214, 0.1543923, -1.611218, 0, 1, 0.3098039, 1,
-0.2613309, 0.5716478, 1.211258, 0, 1, 0.3176471, 1,
-0.2610931, 1.77062, -1.744211, 0, 1, 0.3215686, 1,
-0.2584478, -0.2188447, -1.422078, 0, 1, 0.3294118, 1,
-0.2533449, 0.1771639, -1.344102, 0, 1, 0.3333333, 1,
-0.2529741, -0.9310426, -1.078637, 0, 1, 0.3411765, 1,
-0.2528896, -0.03165175, -3.65066, 0, 1, 0.345098, 1,
-0.2517601, -1.378619, -2.75268, 0, 1, 0.3529412, 1,
-0.2510923, -0.9551803, -4.523848, 0, 1, 0.3568628, 1,
-0.2504808, 0.7356657, -1.259971, 0, 1, 0.3647059, 1,
-0.2435789, -0.229479, -0.4742371, 0, 1, 0.3686275, 1,
-0.2424176, -2.428209, -3.363127, 0, 1, 0.3764706, 1,
-0.2390759, -0.08602357, -1.739916, 0, 1, 0.3803922, 1,
-0.2327383, -1.284141, -2.526402, 0, 1, 0.3882353, 1,
-0.2306138, 0.5304105, -1.829504, 0, 1, 0.3921569, 1,
-0.2281487, -0.6476737, -1.864244, 0, 1, 0.4, 1,
-0.2274959, -0.2335095, -0.9205285, 0, 1, 0.4078431, 1,
-0.2224377, 1.208697, -1.204034, 0, 1, 0.4117647, 1,
-0.2217, 1.075919, 0.1967839, 0, 1, 0.4196078, 1,
-0.2206075, 0.8142825, 0.4584629, 0, 1, 0.4235294, 1,
-0.21991, 0.5252761, 0.01654016, 0, 1, 0.4313726, 1,
-0.2165147, -1.01045, -4.603035, 0, 1, 0.4352941, 1,
-0.2158148, -0.4334415, -2.211526, 0, 1, 0.4431373, 1,
-0.2132069, -0.3396244, -3.425025, 0, 1, 0.4470588, 1,
-0.2128369, 1.520416, 1.534122, 0, 1, 0.454902, 1,
-0.2055424, 0.1010668, 0.6470442, 0, 1, 0.4588235, 1,
-0.2021117, -2.019799, -4.181409, 0, 1, 0.4666667, 1,
-0.2021005, 0.7129875, -0.5460591, 0, 1, 0.4705882, 1,
-0.1938512, -0.9644965, -2.753682, 0, 1, 0.4784314, 1,
-0.1934138, -0.2396394, -1.926921, 0, 1, 0.4823529, 1,
-0.1910466, -0.3507481, -1.828308, 0, 1, 0.4901961, 1,
-0.1900389, 0.8039509, 0.002783743, 0, 1, 0.4941176, 1,
-0.1884702, 0.5098657, -0.378825, 0, 1, 0.5019608, 1,
-0.187794, 2.568171, 0.06857198, 0, 1, 0.509804, 1,
-0.1830207, -2.358566, -4.409985, 0, 1, 0.5137255, 1,
-0.1809752, -0.5853713, -2.106684, 0, 1, 0.5215687, 1,
-0.1808221, 0.660686, -2.047322, 0, 1, 0.5254902, 1,
-0.1787628, 1.854425, 0.7115273, 0, 1, 0.5333334, 1,
-0.169593, 0.9018, -1.304374, 0, 1, 0.5372549, 1,
-0.1677953, 0.479405, -1.622377, 0, 1, 0.5450981, 1,
-0.1669648, -0.522936, -0.3595435, 0, 1, 0.5490196, 1,
-0.1620409, 1.268673, -0.3285593, 0, 1, 0.5568628, 1,
-0.1537623, -1.414901, -1.839483, 0, 1, 0.5607843, 1,
-0.1507266, 0.1476506, -0.07807572, 0, 1, 0.5686275, 1,
-0.149351, -0.5346102, -4.233016, 0, 1, 0.572549, 1,
-0.1468859, -0.71097, -1.734779, 0, 1, 0.5803922, 1,
-0.1447905, -1.023049, -4.80548, 0, 1, 0.5843138, 1,
-0.1433929, 2.095379, -1.268351, 0, 1, 0.5921569, 1,
-0.1433853, 0.1960818, -3.668176, 0, 1, 0.5960785, 1,
-0.1405047, -1.558394, -3.703413, 0, 1, 0.6039216, 1,
-0.1373907, -1.311524, -3.452571, 0, 1, 0.6117647, 1,
-0.1365462, 1.283764, -1.977627, 0, 1, 0.6156863, 1,
-0.1365146, -0.5817531, -3.080668, 0, 1, 0.6235294, 1,
-0.1311427, -0.3182653, -0.7068528, 0, 1, 0.627451, 1,
-0.1298945, -0.454314, -3.904183, 0, 1, 0.6352941, 1,
-0.1296813, 0.9091339, -1.984752, 0, 1, 0.6392157, 1,
-0.1249051, 0.3252701, -0.3777857, 0, 1, 0.6470588, 1,
-0.1214065, -0.2184204, -1.8495, 0, 1, 0.6509804, 1,
-0.1213946, 1.015394, 0.7114661, 0, 1, 0.6588235, 1,
-0.1204968, 0.2936848, -0.7104587, 0, 1, 0.6627451, 1,
-0.1175755, 0.7001598, -0.2086521, 0, 1, 0.6705883, 1,
-0.1101738, 0.5104901, 1.082139, 0, 1, 0.6745098, 1,
-0.1095306, 0.669541, 0.7277697, 0, 1, 0.682353, 1,
-0.1089395, 1.055761, 0.3426201, 0, 1, 0.6862745, 1,
-0.1086617, -0.8080137, -1.801614, 0, 1, 0.6941177, 1,
-0.1053789, 0.4908896, -0.6805166, 0, 1, 0.7019608, 1,
-0.1040988, 0.2443504, -0.7147658, 0, 1, 0.7058824, 1,
-0.1038254, -1.365924, -2.667481, 0, 1, 0.7137255, 1,
-0.1031322, -0.7526417, -4.483349, 0, 1, 0.7176471, 1,
-0.1015251, 0.2481233, -1.038904, 0, 1, 0.7254902, 1,
-0.09666348, 0.7121685, -1.274094, 0, 1, 0.7294118, 1,
-0.09554517, 1.417019, -0.298573, 0, 1, 0.7372549, 1,
-0.09388571, -0.1320684, -1.429685, 0, 1, 0.7411765, 1,
-0.09166283, -0.7308218, -3.375958, 0, 1, 0.7490196, 1,
-0.09137391, -0.3701015, -3.911432, 0, 1, 0.7529412, 1,
-0.0911843, -0.4663422, -1.872025, 0, 1, 0.7607843, 1,
-0.08744943, -1.082201, -2.988903, 0, 1, 0.7647059, 1,
-0.08131632, 0.5817577, -0.3531203, 0, 1, 0.772549, 1,
-0.08051474, 0.6116996, 1.376181, 0, 1, 0.7764706, 1,
-0.07596644, -0.7145268, -3.693859, 0, 1, 0.7843137, 1,
-0.0735601, 0.7566593, -1.206223, 0, 1, 0.7882353, 1,
-0.07220498, 0.2139561, 0.2662746, 0, 1, 0.7960784, 1,
-0.0697151, 0.4718563, 1.159707, 0, 1, 0.8039216, 1,
-0.06678157, -0.3337027, -1.950256, 0, 1, 0.8078431, 1,
-0.06393688, 0.6463746, 0.1582739, 0, 1, 0.8156863, 1,
-0.06259145, 1.42263, 0.1417007, 0, 1, 0.8196079, 1,
-0.06238973, -0.8835552, -2.919971, 0, 1, 0.827451, 1,
-0.06170974, 1.095598, -1.236921, 0, 1, 0.8313726, 1,
-0.05898702, 0.290235, -1.824836, 0, 1, 0.8392157, 1,
-0.05607993, 0.5588416, 0.3841876, 0, 1, 0.8431373, 1,
-0.05219444, 0.2219902, 0.4550276, 0, 1, 0.8509804, 1,
-0.05107808, 0.2742568, 0.5994918, 0, 1, 0.854902, 1,
-0.05039319, -0.3532131, -2.600887, 0, 1, 0.8627451, 1,
-0.05035893, -0.1507418, -1.955564, 0, 1, 0.8666667, 1,
-0.04631515, 1.164519, 1.010829, 0, 1, 0.8745098, 1,
-0.0434737, 0.3673758, 1.168233, 0, 1, 0.8784314, 1,
-0.04323214, -0.2363119, -2.504238, 0, 1, 0.8862745, 1,
-0.03867371, 0.6747735, 0.2027221, 0, 1, 0.8901961, 1,
-0.03738261, -0.6193587, -2.352965, 0, 1, 0.8980392, 1,
-0.03558742, 0.1194077, -0.2448674, 0, 1, 0.9058824, 1,
-0.03513227, 0.1231, -1.249217, 0, 1, 0.9098039, 1,
-0.03478661, -0.2840649, -3.087616, 0, 1, 0.9176471, 1,
-0.03076094, 0.3042748, 0.9341393, 0, 1, 0.9215686, 1,
-0.02438079, -0.5877857, -3.05902, 0, 1, 0.9294118, 1,
-0.01651291, 0.7658897, -2.797257, 0, 1, 0.9333333, 1,
-0.01313794, -1.484114, -3.622354, 0, 1, 0.9411765, 1,
-0.01210325, 0.5508662, -1.469932, 0, 1, 0.945098, 1,
-0.01007918, 0.8602215, 0.3555607, 0, 1, 0.9529412, 1,
-0.006693896, 0.4898047, 0.01177684, 0, 1, 0.9568627, 1,
-0.006280635, 1.320338, 0.6753579, 0, 1, 0.9647059, 1,
-0.005678486, 0.991644, -0.4015348, 0, 1, 0.9686275, 1,
-0.003951237, -0.95664, -2.845526, 0, 1, 0.9764706, 1,
0.001508738, 0.6857043, 1.069754, 0, 1, 0.9803922, 1,
0.001954457, -0.1926254, 3.202354, 0, 1, 0.9882353, 1,
0.004373811, 0.8009183, 0.1482594, 0, 1, 0.9921569, 1,
0.008141949, 0.265334, 1.957358, 0, 1, 1, 1,
0.008719872, 0.6731095, 0.2981092, 0, 0.9921569, 1, 1,
0.01360571, -1.940979, 5.133162, 0, 0.9882353, 1, 1,
0.01361073, 0.7460058, 1.556219, 0, 0.9803922, 1, 1,
0.01678877, 2.01547, 2.068478, 0, 0.9764706, 1, 1,
0.01784152, 1.37695, -0.7496104, 0, 0.9686275, 1, 1,
0.02644648, -0.8821123, 4.28915, 0, 0.9647059, 1, 1,
0.03260932, 0.8044882, -0.2854356, 0, 0.9568627, 1, 1,
0.03430308, 1.455685, -0.3590209, 0, 0.9529412, 1, 1,
0.03506366, -1.477085, 2.659928, 0, 0.945098, 1, 1,
0.03675737, -0.1149706, 3.177399, 0, 0.9411765, 1, 1,
0.03719921, 0.8770151, -0.1570345, 0, 0.9333333, 1, 1,
0.04276166, -0.5311517, 4.376972, 0, 0.9294118, 1, 1,
0.04413063, -0.5087835, 3.132829, 0, 0.9215686, 1, 1,
0.04420144, -0.4871744, 2.062999, 0, 0.9176471, 1, 1,
0.04549573, 0.9447643, -0.329715, 0, 0.9098039, 1, 1,
0.04813088, 0.4534807, -0.01541526, 0, 0.9058824, 1, 1,
0.05482202, -1.851767, 1.827538, 0, 0.8980392, 1, 1,
0.05588359, 0.1242904, 0.9673885, 0, 0.8901961, 1, 1,
0.05721184, -0.9974163, 3.107338, 0, 0.8862745, 1, 1,
0.06858114, 1.455502, 0.2786672, 0, 0.8784314, 1, 1,
0.07064345, -0.7580947, 1.617557, 0, 0.8745098, 1, 1,
0.07644638, 1.096607, 1.263551, 0, 0.8666667, 1, 1,
0.07680573, 0.03940191, 0.9689987, 0, 0.8627451, 1, 1,
0.07957792, -1.311985, 2.291065, 0, 0.854902, 1, 1,
0.08110307, -0.4501501, 3.10008, 0, 0.8509804, 1, 1,
0.08406552, -0.4863398, 3.211285, 0, 0.8431373, 1, 1,
0.08410689, 0.3215953, -0.3780368, 0, 0.8392157, 1, 1,
0.08628937, 0.9055635, -0.01116506, 0, 0.8313726, 1, 1,
0.08646239, -1.390407, 1.881048, 0, 0.827451, 1, 1,
0.09232838, -0.6980226, 1.453636, 0, 0.8196079, 1, 1,
0.09347112, 0.1444742, 2.03105, 0, 0.8156863, 1, 1,
0.1046783, 0.1606893, 0.237236, 0, 0.8078431, 1, 1,
0.1070732, 1.445574, 0.9097248, 0, 0.8039216, 1, 1,
0.1089403, -1.35926, 3.184496, 0, 0.7960784, 1, 1,
0.1092277, 0.8533401, 1.558302, 0, 0.7882353, 1, 1,
0.1159135, -1.389895, 2.998513, 0, 0.7843137, 1, 1,
0.1207634, -0.7436401, 3.119765, 0, 0.7764706, 1, 1,
0.1258305, -0.8234907, 3.325644, 0, 0.772549, 1, 1,
0.1259354, -1.800062, 4.325572, 0, 0.7647059, 1, 1,
0.1273183, 0.5939336, 0.7119738, 0, 0.7607843, 1, 1,
0.1281524, 2.658289, 0.4300956, 0, 0.7529412, 1, 1,
0.1311103, -1.284631, 3.247881, 0, 0.7490196, 1, 1,
0.1322536, 0.02960183, 2.658782, 0, 0.7411765, 1, 1,
0.1370286, 0.321804, 0.2713824, 0, 0.7372549, 1, 1,
0.1400109, 1.990126, 1.803786, 0, 0.7294118, 1, 1,
0.1485608, 2.320577, 1.223715, 0, 0.7254902, 1, 1,
0.1510133, 0.4317138, 0.4977656, 0, 0.7176471, 1, 1,
0.1624645, -0.7352929, 4.284503, 0, 0.7137255, 1, 1,
0.1657967, -0.2272307, 3.565004, 0, 0.7058824, 1, 1,
0.1685873, -0.5203623, 3.743202, 0, 0.6980392, 1, 1,
0.1748128, -0.9783638, 3.568535, 0, 0.6941177, 1, 1,
0.1764638, -0.5481125, 3.345236, 0, 0.6862745, 1, 1,
0.1804683, -0.4473355, 1.990487, 0, 0.682353, 1, 1,
0.1855199, 1.03497, 1.373656, 0, 0.6745098, 1, 1,
0.1882676, 0.2085401, 0.04145024, 0, 0.6705883, 1, 1,
0.1887072, 0.2083035, 3.653859, 0, 0.6627451, 1, 1,
0.1888423, -1.01546, 2.240622, 0, 0.6588235, 1, 1,
0.1943014, -0.9808363, 3.318841, 0, 0.6509804, 1, 1,
0.1946313, 1.502156, 0.545226, 0, 0.6470588, 1, 1,
0.19623, 0.3151903, -0.2553278, 0, 0.6392157, 1, 1,
0.2003797, -1.495288, 5.705075, 0, 0.6352941, 1, 1,
0.2011846, 0.2631432, -1.257456, 0, 0.627451, 1, 1,
0.2011943, -0.829962, 2.35495, 0, 0.6235294, 1, 1,
0.201437, 2.476482, -0.1429478, 0, 0.6156863, 1, 1,
0.2029199, -0.1452936, 1.28926, 0, 0.6117647, 1, 1,
0.2098982, 0.2543888, 1.343498, 0, 0.6039216, 1, 1,
0.2122256, -0.269392, 2.491931, 0, 0.5960785, 1, 1,
0.2137604, -0.0604981, 1.500638, 0, 0.5921569, 1, 1,
0.2157554, -0.8413512, 3.373263, 0, 0.5843138, 1, 1,
0.219427, -0.5843283, 0.5923264, 0, 0.5803922, 1, 1,
0.2204877, -0.5416786, 1.113811, 0, 0.572549, 1, 1,
0.228638, 1.131973, 1.322412, 0, 0.5686275, 1, 1,
0.2291034, -0.866106, 2.98956, 0, 0.5607843, 1, 1,
0.2311465, 2.005465, 1.273735, 0, 0.5568628, 1, 1,
0.2314513, 1.747261, -0.8542867, 0, 0.5490196, 1, 1,
0.2316042, -0.08268671, 3.463977, 0, 0.5450981, 1, 1,
0.2328431, -0.9046139, 3.607267, 0, 0.5372549, 1, 1,
0.235251, -0.5521863, 1.643851, 0, 0.5333334, 1, 1,
0.237505, 1.145982, 1.01182, 0, 0.5254902, 1, 1,
0.2388193, -0.3208937, 1.461842, 0, 0.5215687, 1, 1,
0.2390573, 1.103466, 0.372233, 0, 0.5137255, 1, 1,
0.2399136, 0.01535343, 0.01985649, 0, 0.509804, 1, 1,
0.2404141, -0.2901019, 1.202313, 0, 0.5019608, 1, 1,
0.2438659, -0.7827398, 2.474183, 0, 0.4941176, 1, 1,
0.2439755, 0.3551927, 0.5805665, 0, 0.4901961, 1, 1,
0.2452233, 0.7630896, 0.5669283, 0, 0.4823529, 1, 1,
0.2470164, 1.476072, 0.3893291, 0, 0.4784314, 1, 1,
0.2478617, 0.3486884, 2.035623, 0, 0.4705882, 1, 1,
0.2487504, -0.4342563, 2.621832, 0, 0.4666667, 1, 1,
0.2518131, -2.628759, 2.284005, 0, 0.4588235, 1, 1,
0.2534968, -1.422149, 4.029544, 0, 0.454902, 1, 1,
0.2545024, 0.7234612, 1.807095, 0, 0.4470588, 1, 1,
0.2562594, -0.450936, 1.539838, 0, 0.4431373, 1, 1,
0.2601849, 1.372313, 0.9199355, 0, 0.4352941, 1, 1,
0.2620123, -0.3840698, 0.8736987, 0, 0.4313726, 1, 1,
0.2636586, 0.02968186, 2.037606, 0, 0.4235294, 1, 1,
0.2705899, -1.890828, 2.69349, 0, 0.4196078, 1, 1,
0.2732376, -0.4468755, 4.670063, 0, 0.4117647, 1, 1,
0.2741052, -1.104702, 3.702124, 0, 0.4078431, 1, 1,
0.276893, -1.693212, 2.643819, 0, 0.4, 1, 1,
0.2850059, 0.6621064, -0.8828793, 0, 0.3921569, 1, 1,
0.2858539, -1.346221, 1.730551, 0, 0.3882353, 1, 1,
0.2859872, -0.4366586, 0.87003, 0, 0.3803922, 1, 1,
0.2905918, -0.7830417, 4.154239, 0, 0.3764706, 1, 1,
0.2975362, -0.5129262, 1.557171, 0, 0.3686275, 1, 1,
0.3039171, 1.58723, 0.4869755, 0, 0.3647059, 1, 1,
0.3140752, -2.340858, 4.071627, 0, 0.3568628, 1, 1,
0.3159072, -0.07017478, 1.339483, 0, 0.3529412, 1, 1,
0.3177253, 1.67261, 2.332475, 0, 0.345098, 1, 1,
0.3196506, 0.3560327, 1.025323, 0, 0.3411765, 1, 1,
0.3218912, 0.174874, 0.1305801, 0, 0.3333333, 1, 1,
0.3229531, 1.113397, 0.4115594, 0, 0.3294118, 1, 1,
0.3257981, -0.9382398, 3.296343, 0, 0.3215686, 1, 1,
0.3274312, -0.9338062, 2.080408, 0, 0.3176471, 1, 1,
0.3306918, -0.9419307, 2.667363, 0, 0.3098039, 1, 1,
0.3318499, -0.54489, 3.898495, 0, 0.3058824, 1, 1,
0.3376015, 0.7524683, 0.8333063, 0, 0.2980392, 1, 1,
0.340522, 1.111188, 1.671177, 0, 0.2901961, 1, 1,
0.340899, 1.878362, -0.04970165, 0, 0.2862745, 1, 1,
0.3422822, -0.9048467, 0.7252445, 0, 0.2784314, 1, 1,
0.3442152, 1.742906, -0.5441753, 0, 0.2745098, 1, 1,
0.3489639, 0.2729358, 0.7782819, 0, 0.2666667, 1, 1,
0.3514306, 0.5232219, 1.299081, 0, 0.2627451, 1, 1,
0.353029, -0.9023902, 4.425486, 0, 0.254902, 1, 1,
0.3534328, -0.3409809, 1.063338, 0, 0.2509804, 1, 1,
0.355142, -0.4439256, 3.397191, 0, 0.2431373, 1, 1,
0.3552465, -0.7315857, 2.560186, 0, 0.2392157, 1, 1,
0.3628247, 1.167049, -0.5854397, 0, 0.2313726, 1, 1,
0.3643765, 0.7920485, 0.7164401, 0, 0.227451, 1, 1,
0.3647127, -1.958505, 5.478766, 0, 0.2196078, 1, 1,
0.3656274, 1.084082, -0.9193121, 0, 0.2156863, 1, 1,
0.3714607, 0.6845665, 0.07468996, 0, 0.2078431, 1, 1,
0.3752675, -1.007917, 4.450286, 0, 0.2039216, 1, 1,
0.3757843, 1.749496, -0.03359142, 0, 0.1960784, 1, 1,
0.3793446, 0.3815356, -0.4783579, 0, 0.1882353, 1, 1,
0.3852617, -0.7714382, 3.364785, 0, 0.1843137, 1, 1,
0.3926022, 0.2904723, -0.8063989, 0, 0.1764706, 1, 1,
0.3932225, -0.5810948, 3.749078, 0, 0.172549, 1, 1,
0.3992391, 0.8694451, 1.195017, 0, 0.1647059, 1, 1,
0.3999596, -0.9390612, 3.675729, 0, 0.1607843, 1, 1,
0.4011085, 0.8014861, -0.1280617, 0, 0.1529412, 1, 1,
0.4045008, 0.017905, 2.382998, 0, 0.1490196, 1, 1,
0.4109624, 0.1209778, 1.795537, 0, 0.1411765, 1, 1,
0.4120874, 0.2352106, 2.07497, 0, 0.1372549, 1, 1,
0.4155616, -0.6239644, 1.424614, 0, 0.1294118, 1, 1,
0.4170159, 1.382524, 1.255418, 0, 0.1254902, 1, 1,
0.422924, 0.3692709, 0.3955829, 0, 0.1176471, 1, 1,
0.4249353, 0.445532, 0.6599571, 0, 0.1137255, 1, 1,
0.4257862, 0.09550632, 0.2521019, 0, 0.1058824, 1, 1,
0.4276943, 0.5133098, 0.08254589, 0, 0.09803922, 1, 1,
0.4282217, 0.1499431, -1.098868, 0, 0.09411765, 1, 1,
0.4308586, -0.7086296, 2.068571, 0, 0.08627451, 1, 1,
0.4398829, 0.7840123, 0.5708535, 0, 0.08235294, 1, 1,
0.4408135, -0.1898801, 2.777117, 0, 0.07450981, 1, 1,
0.4409098, 0.6651266, 1.259369, 0, 0.07058824, 1, 1,
0.4453837, 0.4598078, 1.305542, 0, 0.0627451, 1, 1,
0.4495319, 2.128367, -0.6551728, 0, 0.05882353, 1, 1,
0.4563003, -0.2743371, 2.318475, 0, 0.05098039, 1, 1,
0.460202, 1.150708, -0.7235625, 0, 0.04705882, 1, 1,
0.4696898, -0.2027471, 1.672485, 0, 0.03921569, 1, 1,
0.4702035, 0.5973907, 0.635225, 0, 0.03529412, 1, 1,
0.4757461, -0.5401518, 2.717219, 0, 0.02745098, 1, 1,
0.4800264, 1.48595, -0.5145675, 0, 0.02352941, 1, 1,
0.4802146, 1.518779, 0.599665, 0, 0.01568628, 1, 1,
0.4805991, 0.253302, 0.5376126, 0, 0.01176471, 1, 1,
0.4813874, -1.084575, 1.520526, 0, 0.003921569, 1, 1,
0.486995, 0.1777382, 1.43828, 0.003921569, 0, 1, 1,
0.4896856, 0.2365087, 2.054193, 0.007843138, 0, 1, 1,
0.5023845, 0.1925223, 0.2384606, 0.01568628, 0, 1, 1,
0.5030515, -1.744895, 3.420576, 0.01960784, 0, 1, 1,
0.5036373, 0.9412214, -0.6527648, 0.02745098, 0, 1, 1,
0.5052036, -0.7956168, 4.121874, 0.03137255, 0, 1, 1,
0.5072801, -0.3420469, 1.761076, 0.03921569, 0, 1, 1,
0.5106581, -0.2563537, 1.604038, 0.04313726, 0, 1, 1,
0.5120733, -0.0803207, 2.399395, 0.05098039, 0, 1, 1,
0.516458, -0.120613, 3.797362, 0.05490196, 0, 1, 1,
0.5168122, 1.510025, 0.9524347, 0.0627451, 0, 1, 1,
0.5223413, -0.4492485, 1.381276, 0.06666667, 0, 1, 1,
0.5253901, -1.721373, 3.667428, 0.07450981, 0, 1, 1,
0.525403, 0.7910288, 0.9789535, 0.07843138, 0, 1, 1,
0.5279906, 0.1702181, -0.03857097, 0.08627451, 0, 1, 1,
0.5292883, 0.08841064, 1.536393, 0.09019608, 0, 1, 1,
0.5363634, -1.372281, 2.543036, 0.09803922, 0, 1, 1,
0.5364818, 0.1068596, 2.481143, 0.1058824, 0, 1, 1,
0.5380185, -0.1700599, 0.9725856, 0.1098039, 0, 1, 1,
0.5402386, 0.2815371, 2.049781, 0.1176471, 0, 1, 1,
0.5432792, -0.1680781, 2.611181, 0.1215686, 0, 1, 1,
0.544112, 0.03492225, 1.107011, 0.1294118, 0, 1, 1,
0.5455083, 0.2185524, 0.7217968, 0.1333333, 0, 1, 1,
0.5519879, 0.6875656, -0.2744821, 0.1411765, 0, 1, 1,
0.5537036, -0.1448467, -0.001351054, 0.145098, 0, 1, 1,
0.5598904, -0.4890716, 1.100108, 0.1529412, 0, 1, 1,
0.5607061, 0.09855731, 0.8910122, 0.1568628, 0, 1, 1,
0.5714833, -1.458198, 4.388565, 0.1647059, 0, 1, 1,
0.5742965, -0.1350295, 1.328339, 0.1686275, 0, 1, 1,
0.5770984, -0.9007645, 3.831455, 0.1764706, 0, 1, 1,
0.5796886, -0.07866845, 0.321152, 0.1803922, 0, 1, 1,
0.5858514, 0.2885992, 2.046532, 0.1882353, 0, 1, 1,
0.59682, -1.210581, 1.827749, 0.1921569, 0, 1, 1,
0.5993564, -0.171967, -0.008040828, 0.2, 0, 1, 1,
0.6034233, 1.630193, -1.017084, 0.2078431, 0, 1, 1,
0.6088936, 0.6860815, 0.837347, 0.2117647, 0, 1, 1,
0.6118505, -0.8372005, 2.37478, 0.2196078, 0, 1, 1,
0.6134932, -0.9882296, 2.556378, 0.2235294, 0, 1, 1,
0.6139826, 0.8252054, 1.508122, 0.2313726, 0, 1, 1,
0.6218575, -0.5114803, 1.454115, 0.2352941, 0, 1, 1,
0.6266381, -1.233443, 3.423286, 0.2431373, 0, 1, 1,
0.6296524, 0.3032793, 1.659688, 0.2470588, 0, 1, 1,
0.6364712, -0.4793262, 1.781037, 0.254902, 0, 1, 1,
0.6403056, -1.257737, 3.014852, 0.2588235, 0, 1, 1,
0.6414515, 0.5249406, 0.1570841, 0.2666667, 0, 1, 1,
0.6463094, 0.8023886, 0.06720789, 0.2705882, 0, 1, 1,
0.6474651, 2.026094, -0.2311119, 0.2784314, 0, 1, 1,
0.6493095, 2.067368, 1.662737, 0.282353, 0, 1, 1,
0.6516096, -2.673892, 3.277864, 0.2901961, 0, 1, 1,
0.654696, -1.4708, 2.303607, 0.2941177, 0, 1, 1,
0.6588852, 0.3013718, 2.04566, 0.3019608, 0, 1, 1,
0.6613815, 0.5333168, 0.8833984, 0.3098039, 0, 1, 1,
0.6652594, 2.471122, 0.1140365, 0.3137255, 0, 1, 1,
0.6716417, 0.9804733, -0.5051141, 0.3215686, 0, 1, 1,
0.6755027, 0.4253575, 0.4634851, 0.3254902, 0, 1, 1,
0.6816984, -0.5697535, 2.88663, 0.3333333, 0, 1, 1,
0.6825117, 1.192026, 0.1656965, 0.3372549, 0, 1, 1,
0.684922, 0.8618479, -0.6294593, 0.345098, 0, 1, 1,
0.6852264, -0.1011151, 1.387832, 0.3490196, 0, 1, 1,
0.6866952, -0.6602356, 2.84512, 0.3568628, 0, 1, 1,
0.6881236, 0.7013845, 0.2621213, 0.3607843, 0, 1, 1,
0.6911161, 0.1944579, 3.362739, 0.3686275, 0, 1, 1,
0.6955225, 0.2442996, 1.038174, 0.372549, 0, 1, 1,
0.6965993, 0.9919704, 1.477973, 0.3803922, 0, 1, 1,
0.6966947, 0.03630568, -1.102496, 0.3843137, 0, 1, 1,
0.6968514, -0.8238772, 3.573673, 0.3921569, 0, 1, 1,
0.7024434, 0.08648854, 2.108716, 0.3960784, 0, 1, 1,
0.7092265, -0.9038389, 2.976154, 0.4039216, 0, 1, 1,
0.713761, -1.373176, 2.144208, 0.4117647, 0, 1, 1,
0.7172969, 0.5849845, -2.344337, 0.4156863, 0, 1, 1,
0.7197831, -0.5674737, 0.7640551, 0.4235294, 0, 1, 1,
0.7248712, -0.8028379, 2.272069, 0.427451, 0, 1, 1,
0.7257972, 0.288443, -0.4832975, 0.4352941, 0, 1, 1,
0.7343215, -0.2178182, 2.249732, 0.4392157, 0, 1, 1,
0.7357953, -0.004882939, 0.9213768, 0.4470588, 0, 1, 1,
0.7389207, 1.583232, 0.3604674, 0.4509804, 0, 1, 1,
0.7390554, -0.3620948, 0.4188264, 0.4588235, 0, 1, 1,
0.7465501, -1.280999, 1.964547, 0.4627451, 0, 1, 1,
0.7470113, 0.07549453, 1.736095, 0.4705882, 0, 1, 1,
0.7481159, -0.2646396, 1.937897, 0.4745098, 0, 1, 1,
0.7512869, -1.550944, 3.651191, 0.4823529, 0, 1, 1,
0.7550264, -0.2596343, 3.702895, 0.4862745, 0, 1, 1,
0.75832, -0.5792318, 1.899957, 0.4941176, 0, 1, 1,
0.7586761, -1.466053, 1.105518, 0.5019608, 0, 1, 1,
0.7592008, 0.5280151, 1.029361, 0.5058824, 0, 1, 1,
0.7621772, 0.3030964, 3.467712, 0.5137255, 0, 1, 1,
0.7624819, -0.4701797, 2.264274, 0.5176471, 0, 1, 1,
0.7677259, 1.657491, -0.2862581, 0.5254902, 0, 1, 1,
0.770576, 1.987117, -0.1684957, 0.5294118, 0, 1, 1,
0.7756737, 0.3235205, 0.446961, 0.5372549, 0, 1, 1,
0.777133, 0.543183, 2.529634, 0.5411765, 0, 1, 1,
0.7829856, -2.896015, 2.188986, 0.5490196, 0, 1, 1,
0.7875454, 0.2295828, 2.277462, 0.5529412, 0, 1, 1,
0.7909731, -0.5137552, 1.920991, 0.5607843, 0, 1, 1,
0.792509, -0.1502916, 2.65794, 0.5647059, 0, 1, 1,
0.7932792, 0.4454625, 0.6689918, 0.572549, 0, 1, 1,
0.7933331, -0.990986, 0.6718296, 0.5764706, 0, 1, 1,
0.7940892, -0.912465, 1.475395, 0.5843138, 0, 1, 1,
0.7947812, 0.2758124, 1.278104, 0.5882353, 0, 1, 1,
0.7959837, 0.08145238, 1.544431, 0.5960785, 0, 1, 1,
0.8024247, -0.8262706, 2.875497, 0.6039216, 0, 1, 1,
0.8055009, -1.039419, 3.150694, 0.6078432, 0, 1, 1,
0.8056182, 1.069921, 2.491921, 0.6156863, 0, 1, 1,
0.8067098, -0.2812574, 0.6117628, 0.6196079, 0, 1, 1,
0.8072451, 0.5357959, 1.749019, 0.627451, 0, 1, 1,
0.8075843, 1.577362, 1.387023, 0.6313726, 0, 1, 1,
0.8081735, 2.518627, 2.109453, 0.6392157, 0, 1, 1,
0.8113283, 0.528308, 0.9443272, 0.6431373, 0, 1, 1,
0.8142298, 0.3039005, 1.914185, 0.6509804, 0, 1, 1,
0.8144085, 0.02198144, 0.7931969, 0.654902, 0, 1, 1,
0.8159118, -0.3180853, 2.713964, 0.6627451, 0, 1, 1,
0.8221208, -0.2657171, 1.562228, 0.6666667, 0, 1, 1,
0.8264015, -2.146018, 1.239484, 0.6745098, 0, 1, 1,
0.8289911, 0.7503031, 2.337944, 0.6784314, 0, 1, 1,
0.8297406, 1.336989, -0.3795929, 0.6862745, 0, 1, 1,
0.8318709, 0.3418285, 2.37325, 0.6901961, 0, 1, 1,
0.8344672, -1.139316, 2.828393, 0.6980392, 0, 1, 1,
0.8400007, -0.2642383, 2.241791, 0.7058824, 0, 1, 1,
0.8410856, 0.5920187, 0.9033811, 0.7098039, 0, 1, 1,
0.8433579, -0.7506877, 4.091328, 0.7176471, 0, 1, 1,
0.8460346, 0.7095966, 0.4817891, 0.7215686, 0, 1, 1,
0.8465946, -0.2202593, 1.122563, 0.7294118, 0, 1, 1,
0.8476705, -0.3983536, 2.537359, 0.7333333, 0, 1, 1,
0.8485106, -0.1832568, 1.97963, 0.7411765, 0, 1, 1,
0.8492112, -1.12754, 1.891621, 0.7450981, 0, 1, 1,
0.8538646, -0.2402794, 2.298614, 0.7529412, 0, 1, 1,
0.8699917, -0.5270733, 2.022267, 0.7568628, 0, 1, 1,
0.8711235, -1.913769, 1.536569, 0.7647059, 0, 1, 1,
0.873363, 1.378217, -0.2012662, 0.7686275, 0, 1, 1,
0.879541, -0.61014, 1.815158, 0.7764706, 0, 1, 1,
0.8902004, -0.1303543, 1.32697, 0.7803922, 0, 1, 1,
0.891356, -0.9488151, 3.144563, 0.7882353, 0, 1, 1,
0.8917443, -0.7410703, 2.508068, 0.7921569, 0, 1, 1,
0.8948181, 0.5161772, 0.8544518, 0.8, 0, 1, 1,
0.90231, 0.2854231, 1.092081, 0.8078431, 0, 1, 1,
0.9232782, -0.9465119, 1.299671, 0.8117647, 0, 1, 1,
0.9238443, 0.8809258, 0.6847805, 0.8196079, 0, 1, 1,
0.930304, -0.7608003, 2.057832, 0.8235294, 0, 1, 1,
0.9334102, -0.5368353, 0.8701566, 0.8313726, 0, 1, 1,
0.9346215, -2.088024, 3.373534, 0.8352941, 0, 1, 1,
0.9371358, 0.9508079, 2.730593, 0.8431373, 0, 1, 1,
0.9386181, 3.51371, -0.8685814, 0.8470588, 0, 1, 1,
0.9395713, 0.2131124, 0.1063275, 0.854902, 0, 1, 1,
0.9456593, -0.99779, 2.936434, 0.8588235, 0, 1, 1,
0.95603, -0.9218923, 2.853112, 0.8666667, 0, 1, 1,
0.9582281, 1.166763, 0.2802007, 0.8705882, 0, 1, 1,
0.9586294, 0.631126, 1.091794, 0.8784314, 0, 1, 1,
0.966125, 1.304592, 1.605188, 0.8823529, 0, 1, 1,
0.9672789, -0.6110337, 1.164192, 0.8901961, 0, 1, 1,
0.9687092, -0.09798972, 0.7888072, 0.8941177, 0, 1, 1,
0.9689167, 0.7575133, 0.8962618, 0.9019608, 0, 1, 1,
0.9703513, 1.331155, 0.5175304, 0.9098039, 0, 1, 1,
0.9722373, 0.1992854, 1.465455, 0.9137255, 0, 1, 1,
0.9818134, 0.9685531, 0.7615687, 0.9215686, 0, 1, 1,
0.9823178, 0.3126915, 3.476923, 0.9254902, 0, 1, 1,
0.9837104, 0.510043, 0.8199608, 0.9333333, 0, 1, 1,
0.9858027, -0.4218017, 1.689298, 0.9372549, 0, 1, 1,
0.9891091, -0.7994521, 1.59417, 0.945098, 0, 1, 1,
0.9964884, 2.625468, 0.9708374, 0.9490196, 0, 1, 1,
1.000974, -0.3022889, 2.898836, 0.9568627, 0, 1, 1,
1.006104, -0.4137119, 2.467684, 0.9607843, 0, 1, 1,
1.00619, -0.4329678, 2.091433, 0.9686275, 0, 1, 1,
1.014892, 0.569465, 1.142444, 0.972549, 0, 1, 1,
1.022577, -0.02307514, 3.373346, 0.9803922, 0, 1, 1,
1.023063, 0.3746282, 0.2211552, 0.9843137, 0, 1, 1,
1.023357, 0.2030987, 2.418327, 0.9921569, 0, 1, 1,
1.027375, -1.680118, 0.6363603, 0.9960784, 0, 1, 1,
1.027661, -0.7546862, -0.8954177, 1, 0, 0.9960784, 1,
1.037402, 0.5482873, -0.546313, 1, 0, 0.9882353, 1,
1.039639, 0.03368415, 2.4201, 1, 0, 0.9843137, 1,
1.042053, 1.596097, -0.05696264, 1, 0, 0.9764706, 1,
1.04437, -2.359746, 3.090836, 1, 0, 0.972549, 1,
1.053756, 1.109326, 0.1608362, 1, 0, 0.9647059, 1,
1.054525, 1.04009, 1.522255, 1, 0, 0.9607843, 1,
1.0546, -0.4888275, 0.2449877, 1, 0, 0.9529412, 1,
1.055506, -1.517101, 1.78835, 1, 0, 0.9490196, 1,
1.057326, 0.1590963, 0.5786338, 1, 0, 0.9411765, 1,
1.068723, 0.9036807, 1.325424, 1, 0, 0.9372549, 1,
1.06973, -0.5536724, 1.062998, 1, 0, 0.9294118, 1,
1.086164, -1.523011, 3.734148, 1, 0, 0.9254902, 1,
1.091725, 0.64312, 0.01548172, 1, 0, 0.9176471, 1,
1.096302, 1.600017, -0.3213355, 1, 0, 0.9137255, 1,
1.09666, -0.1734793, 2.094336, 1, 0, 0.9058824, 1,
1.103354, -0.4868042, 2.029982, 1, 0, 0.9019608, 1,
1.107814, 0.579426, 1.496735, 1, 0, 0.8941177, 1,
1.110215, -0.7275031, 1.829071, 1, 0, 0.8862745, 1,
1.128551, -1.160888, 1.838917, 1, 0, 0.8823529, 1,
1.146411, -0.8597287, 0.9091203, 1, 0, 0.8745098, 1,
1.15198, 1.73217, 0.9692796, 1, 0, 0.8705882, 1,
1.153691, -1.029429, 2.205117, 1, 0, 0.8627451, 1,
1.156418, -0.03246127, 1.669623, 1, 0, 0.8588235, 1,
1.156662, -2.208953, 1.792098, 1, 0, 0.8509804, 1,
1.162352, -1.094218, 0.2503822, 1, 0, 0.8470588, 1,
1.16246, -0.2465359, 3.267888, 1, 0, 0.8392157, 1,
1.163814, -0.534322, 0.6495342, 1, 0, 0.8352941, 1,
1.17326, 1.293707, -0.9360908, 1, 0, 0.827451, 1,
1.176971, -0.3468622, 2.858586, 1, 0, 0.8235294, 1,
1.177381, 0.1824682, 2.663343, 1, 0, 0.8156863, 1,
1.186964, 0.5375351, 0.2763328, 1, 0, 0.8117647, 1,
1.188144, 1.99253, 1.170933, 1, 0, 0.8039216, 1,
1.198455, -0.6235962, 3.163906, 1, 0, 0.7960784, 1,
1.19932, -0.4200507, 1.536762, 1, 0, 0.7921569, 1,
1.203529, 0.5659948, 1.184543, 1, 0, 0.7843137, 1,
1.213113, 0.09307244, 0.1715648, 1, 0, 0.7803922, 1,
1.222012, 0.3545981, 0.2518239, 1, 0, 0.772549, 1,
1.232597, -0.2112027, 0.9239216, 1, 0, 0.7686275, 1,
1.235871, -0.5317109, 0.925158, 1, 0, 0.7607843, 1,
1.245898, 0.04446569, 2.64715, 1, 0, 0.7568628, 1,
1.253142, -1.120178, 2.176522, 1, 0, 0.7490196, 1,
1.259968, -0.9649185, 1.391861, 1, 0, 0.7450981, 1,
1.276265, 0.8848102, 1.977855, 1, 0, 0.7372549, 1,
1.278906, -0.03789341, 0.663031, 1, 0, 0.7333333, 1,
1.284228, -0.3074559, 2.330062, 1, 0, 0.7254902, 1,
1.28475, 0.6918056, 0.006866134, 1, 0, 0.7215686, 1,
1.289449, 2.052202, 0.4562193, 1, 0, 0.7137255, 1,
1.317903, 0.2620443, 0.9326622, 1, 0, 0.7098039, 1,
1.318651, 1.145438, 3.340073, 1, 0, 0.7019608, 1,
1.324165, 0.2721758, 1.609005, 1, 0, 0.6941177, 1,
1.324255, -0.34052, 1.508513, 1, 0, 0.6901961, 1,
1.328564, -1.520223, 1.635096, 1, 0, 0.682353, 1,
1.333478, 0.2154815, 1.78792, 1, 0, 0.6784314, 1,
1.334036, -1.131245, 1.913557, 1, 0, 0.6705883, 1,
1.342056, -2.013347, 2.682591, 1, 0, 0.6666667, 1,
1.353962, 0.6148744, 1.084484, 1, 0, 0.6588235, 1,
1.369078, 0.09691305, 0.1366708, 1, 0, 0.654902, 1,
1.381388, 2.471824, 0.4753889, 1, 0, 0.6470588, 1,
1.390327, -0.6717554, 1.472964, 1, 0, 0.6431373, 1,
1.399006, -0.9604694, 1.141827, 1, 0, 0.6352941, 1,
1.40387, 1.063575, 0.6336461, 1, 0, 0.6313726, 1,
1.41303, -0.1946376, 2.321605, 1, 0, 0.6235294, 1,
1.417509, -0.6052015, 0.835899, 1, 0, 0.6196079, 1,
1.418432, -1.433701, 2.106055, 1, 0, 0.6117647, 1,
1.424261, -1.212938, 3.833624, 1, 0, 0.6078432, 1,
1.424758, 0.8943836, -1.539773, 1, 0, 0.6, 1,
1.424947, 0.5930413, -1.043628, 1, 0, 0.5921569, 1,
1.436093, 1.101734, 0.1436438, 1, 0, 0.5882353, 1,
1.436456, -0.3878334, 3.072225, 1, 0, 0.5803922, 1,
1.4404, 0.1622348, 2.862283, 1, 0, 0.5764706, 1,
1.445426, -0.1424862, 1.225173, 1, 0, 0.5686275, 1,
1.456242, 0.8543037, 0.3544014, 1, 0, 0.5647059, 1,
1.458, 0.8095687, 0.2424838, 1, 0, 0.5568628, 1,
1.460194, -0.987625, 3.703057, 1, 0, 0.5529412, 1,
1.470699, -1.182716, 2.749398, 1, 0, 0.5450981, 1,
1.483462, 0.6389226, -0.6666412, 1, 0, 0.5411765, 1,
1.490785, 1.09915, 1.823253, 1, 0, 0.5333334, 1,
1.501306, 0.06853817, 2.57038, 1, 0, 0.5294118, 1,
1.508823, -0.5729071, 0.4445387, 1, 0, 0.5215687, 1,
1.52108, -0.2898961, 1.37761, 1, 0, 0.5176471, 1,
1.529924, -0.435267, 1.980309, 1, 0, 0.509804, 1,
1.532843, 0.1260324, 1.549199, 1, 0, 0.5058824, 1,
1.534031, -2.369332, 2.314969, 1, 0, 0.4980392, 1,
1.543072, 0.8700304, 1.375974, 1, 0, 0.4901961, 1,
1.546742, 0.3016436, 1.49177, 1, 0, 0.4862745, 1,
1.551169, 1.107568, 1.488116, 1, 0, 0.4784314, 1,
1.565844, 0.8347523, 1.160197, 1, 0, 0.4745098, 1,
1.577793, 0.6633246, 1.219098, 1, 0, 0.4666667, 1,
1.578902, -0.589057, 0.4178796, 1, 0, 0.4627451, 1,
1.59565, -0.657431, 2.184853, 1, 0, 0.454902, 1,
1.599919, -1.079323, 2.854102, 1, 0, 0.4509804, 1,
1.602748, 1.662636, 0.8392449, 1, 0, 0.4431373, 1,
1.606415, 0.8451838, 1.330781, 1, 0, 0.4392157, 1,
1.607079, -1.532211, 0.5186048, 1, 0, 0.4313726, 1,
1.607715, 0.8707471, 1.065232, 1, 0, 0.427451, 1,
1.613945, 0.8627403, 0.6312438, 1, 0, 0.4196078, 1,
1.615146, 2.505704, 0.7936763, 1, 0, 0.4156863, 1,
1.623096, -1.763861, 2.558573, 1, 0, 0.4078431, 1,
1.623343, -0.306997, 1.544712, 1, 0, 0.4039216, 1,
1.640148, 1.31902, 2.169276, 1, 0, 0.3960784, 1,
1.644219, -0.5585781, 1.236849, 1, 0, 0.3882353, 1,
1.647232, -0.7666122, 2.551926, 1, 0, 0.3843137, 1,
1.648304, -0.4605558, 0.4650715, 1, 0, 0.3764706, 1,
1.650023, -0.1304812, 1.630254, 1, 0, 0.372549, 1,
1.656669, 0.8861054, 0.3437109, 1, 0, 0.3647059, 1,
1.665711, -0.2013022, 0.6172954, 1, 0, 0.3607843, 1,
1.666957, -0.5144532, 3.629351, 1, 0, 0.3529412, 1,
1.667055, 1.339734, -0.4225972, 1, 0, 0.3490196, 1,
1.675334, -2.454129, 2.327585, 1, 0, 0.3411765, 1,
1.677924, 1.6923, 1.901484, 1, 0, 0.3372549, 1,
1.681696, -0.0955956, 1.63239, 1, 0, 0.3294118, 1,
1.685231, -0.247115, 0.7193186, 1, 0, 0.3254902, 1,
1.696637, 2.153989, 2.630732, 1, 0, 0.3176471, 1,
1.703512, 1.021874, 0.4426454, 1, 0, 0.3137255, 1,
1.703729, -1.212235, 2.033327, 1, 0, 0.3058824, 1,
1.716406, -0.2157213, 2.379972, 1, 0, 0.2980392, 1,
1.722466, -1.189572, 1.565922, 1, 0, 0.2941177, 1,
1.731875, 0.1020822, 0.932937, 1, 0, 0.2862745, 1,
1.734755, 0.07504553, 1.97002, 1, 0, 0.282353, 1,
1.741309, -0.6905639, 1.989476, 1, 0, 0.2745098, 1,
1.750728, 0.550953, 2.327172, 1, 0, 0.2705882, 1,
1.753596, -0.3687187, 3.603991, 1, 0, 0.2627451, 1,
1.765034, 0.6215344, 0.3008163, 1, 0, 0.2588235, 1,
1.766791, -0.452585, 2.087568, 1, 0, 0.2509804, 1,
1.766987, 0.2115746, -0.6907799, 1, 0, 0.2470588, 1,
1.768065, 1.01274, 1.415132, 1, 0, 0.2392157, 1,
1.773603, -0.05634922, 2.052088, 1, 0, 0.2352941, 1,
1.781117, 0.8947594, 2.218683, 1, 0, 0.227451, 1,
1.819117, -0.459191, 1.542964, 1, 0, 0.2235294, 1,
1.822061, 1.297198, 0.9169073, 1, 0, 0.2156863, 1,
1.84446, -0.05763813, 1.401491, 1, 0, 0.2117647, 1,
1.902854, -0.8400574, 2.971278, 1, 0, 0.2039216, 1,
1.906845, 1.608374, 0.7481804, 1, 0, 0.1960784, 1,
1.910404, -0.8158408, 0.9982714, 1, 0, 0.1921569, 1,
1.921902, 0.5879565, 2.045993, 1, 0, 0.1843137, 1,
1.929116, -0.006326061, 0.5264703, 1, 0, 0.1803922, 1,
1.929393, -1.086603, 2.324994, 1, 0, 0.172549, 1,
1.953782, -0.2021034, 0.6252632, 1, 0, 0.1686275, 1,
1.973749, 0.4969847, 0.7596066, 1, 0, 0.1607843, 1,
1.983775, -1.898692, 1.800958, 1, 0, 0.1568628, 1,
2.020584, 1.474111, -0.3458052, 1, 0, 0.1490196, 1,
2.043406, 0.9082528, -1.020775, 1, 0, 0.145098, 1,
2.082312, -1.318138, 2.008156, 1, 0, 0.1372549, 1,
2.153257, -0.5723927, -0.02989841, 1, 0, 0.1333333, 1,
2.202296, 1.251583, 1.924021, 1, 0, 0.1254902, 1,
2.232662, -1.635819, 2.268542, 1, 0, 0.1215686, 1,
2.249699, -0.4554928, 0.6072636, 1, 0, 0.1137255, 1,
2.251541, 0.8898211, 1.884533, 1, 0, 0.1098039, 1,
2.279202, -0.0624486, 1.315281, 1, 0, 0.1019608, 1,
2.289129, -0.4396006, 0.6442045, 1, 0, 0.09411765, 1,
2.314343, -0.1886354, -0.04684454, 1, 0, 0.09019608, 1,
2.338412, 0.568133, 2.830872, 1, 0, 0.08235294, 1,
2.347377, -0.7485179, 2.038509, 1, 0, 0.07843138, 1,
2.362256, -0.6850168, -0.1967634, 1, 0, 0.07058824, 1,
2.406826, -0.7551908, 1.966436, 1, 0, 0.06666667, 1,
2.419118, 1.482906, 0.04198327, 1, 0, 0.05882353, 1,
2.463655, 0.5142519, 0.7306252, 1, 0, 0.05490196, 1,
2.51196, 0.3690061, 0.4531269, 1, 0, 0.04705882, 1,
2.593306, -1.125802, 2.571172, 1, 0, 0.04313726, 1,
2.701896, 0.4230785, 0.8364458, 1, 0, 0.03529412, 1,
2.772086, -0.5787088, 1.937549, 1, 0, 0.03137255, 1,
2.787292, 0.8267047, 1.899603, 1, 0, 0.02352941, 1,
3.202696, 1.253627, 0.8536398, 1, 0, 0.01960784, 1,
3.295642, 0.3081412, 0.7714917, 1, 0, 0.01176471, 1,
3.489407, 0.9922593, -0.4132229, 1, 0, 0.007843138, 1
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
0.08293998, -3.982463, -6.587018, 0, -0.5, 0.5, 0.5,
0.08293998, -3.982463, -6.587018, 1, -0.5, 0.5, 0.5,
0.08293998, -3.982463, -6.587018, 1, 1.5, 0.5, 0.5,
0.08293998, -3.982463, -6.587018, 0, 1.5, 0.5, 0.5
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
-4.478319, 0.3088475, -6.587018, 0, -0.5, 0.5, 0.5,
-4.478319, 0.3088475, -6.587018, 1, -0.5, 0.5, 0.5,
-4.478319, 0.3088475, -6.587018, 1, 1.5, 0.5, 0.5,
-4.478319, 0.3088475, -6.587018, 0, 1.5, 0.5, 0.5
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
-4.478319, -3.982463, 0.4497976, 0, -0.5, 0.5, 0.5,
-4.478319, -3.982463, 0.4497976, 1, -0.5, 0.5, 0.5,
-4.478319, -3.982463, 0.4497976, 1, 1.5, 0.5, 0.5,
-4.478319, -3.982463, 0.4497976, 0, 1.5, 0.5, 0.5
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
-3, -2.992161, -4.963138,
3, -2.992161, -4.963138,
-3, -2.992161, -4.963138,
-3, -3.157211, -5.233785,
-2, -2.992161, -4.963138,
-2, -3.157211, -5.233785,
-1, -2.992161, -4.963138,
-1, -3.157211, -5.233785,
0, -2.992161, -4.963138,
0, -3.157211, -5.233785,
1, -2.992161, -4.963138,
1, -3.157211, -5.233785,
2, -2.992161, -4.963138,
2, -3.157211, -5.233785,
3, -2.992161, -4.963138,
3, -3.157211, -5.233785
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
-3, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
-3, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
-3, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
-3, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
-2, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
-2, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
-2, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
-2, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
-1, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
-1, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
-1, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
-1, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
0, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
0, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
0, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
0, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
1, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
1, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
1, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
1, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
2, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
2, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
2, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
2, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5,
3, -3.487312, -5.775078, 0, -0.5, 0.5, 0.5,
3, -3.487312, -5.775078, 1, -0.5, 0.5, 0.5,
3, -3.487312, -5.775078, 1, 1.5, 0.5, 0.5,
3, -3.487312, -5.775078, 0, 1.5, 0.5, 0.5
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
-3.425721, -2, -4.963138,
-3.425721, 3, -4.963138,
-3.425721, -2, -4.963138,
-3.601154, -2, -5.233785,
-3.425721, -1, -4.963138,
-3.601154, -1, -5.233785,
-3.425721, 0, -4.963138,
-3.601154, 0, -5.233785,
-3.425721, 1, -4.963138,
-3.601154, 1, -5.233785,
-3.425721, 2, -4.963138,
-3.601154, 2, -5.233785,
-3.425721, 3, -4.963138,
-3.601154, 3, -5.233785
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
-3.95202, -2, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, -2, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, -2, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, -2, -5.775078, 0, 1.5, 0.5, 0.5,
-3.95202, -1, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, -1, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, -1, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, -1, -5.775078, 0, 1.5, 0.5, 0.5,
-3.95202, 0, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, 0, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, 0, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, 0, -5.775078, 0, 1.5, 0.5, 0.5,
-3.95202, 1, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, 1, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, 1, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, 1, -5.775078, 0, 1.5, 0.5, 0.5,
-3.95202, 2, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, 2, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, 2, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, 2, -5.775078, 0, 1.5, 0.5, 0.5,
-3.95202, 3, -5.775078, 0, -0.5, 0.5, 0.5,
-3.95202, 3, -5.775078, 1, -0.5, 0.5, 0.5,
-3.95202, 3, -5.775078, 1, 1.5, 0.5, 0.5,
-3.95202, 3, -5.775078, 0, 1.5, 0.5, 0.5
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
-3.425721, -2.992161, -4,
-3.425721, -2.992161, 4,
-3.425721, -2.992161, -4,
-3.601154, -3.157211, -4,
-3.425721, -2.992161, -2,
-3.601154, -3.157211, -2,
-3.425721, -2.992161, 0,
-3.601154, -3.157211, 0,
-3.425721, -2.992161, 2,
-3.601154, -3.157211, 2,
-3.425721, -2.992161, 4,
-3.601154, -3.157211, 4
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
-3.95202, -3.487312, -4, 0, -0.5, 0.5, 0.5,
-3.95202, -3.487312, -4, 1, -0.5, 0.5, 0.5,
-3.95202, -3.487312, -4, 1, 1.5, 0.5, 0.5,
-3.95202, -3.487312, -4, 0, 1.5, 0.5, 0.5,
-3.95202, -3.487312, -2, 0, -0.5, 0.5, 0.5,
-3.95202, -3.487312, -2, 1, -0.5, 0.5, 0.5,
-3.95202, -3.487312, -2, 1, 1.5, 0.5, 0.5,
-3.95202, -3.487312, -2, 0, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 0, 0, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 0, 1, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 0, 1, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 0, 0, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 2, 0, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 2, 1, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 2, 1, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 2, 0, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 4, 0, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 4, 1, -0.5, 0.5, 0.5,
-3.95202, -3.487312, 4, 1, 1.5, 0.5, 0.5,
-3.95202, -3.487312, 4, 0, 1.5, 0.5, 0.5
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
-3.425721, -2.992161, -4.963138,
-3.425721, 3.609856, -4.963138,
-3.425721, -2.992161, 5.862733,
-3.425721, 3.609856, 5.862733,
-3.425721, -2.992161, -4.963138,
-3.425721, -2.992161, 5.862733,
-3.425721, 3.609856, -4.963138,
-3.425721, 3.609856, 5.862733,
-3.425721, -2.992161, -4.963138,
3.591601, -2.992161, -4.963138,
-3.425721, -2.992161, 5.862733,
3.591601, -2.992161, 5.862733,
-3.425721, 3.609856, -4.963138,
3.591601, 3.609856, -4.963138,
-3.425721, 3.609856, 5.862733,
3.591601, 3.609856, 5.862733,
3.591601, -2.992161, -4.963138,
3.591601, 3.609856, -4.963138,
3.591601, -2.992161, 5.862733,
3.591601, 3.609856, 5.862733,
3.591601, -2.992161, -4.963138,
3.591601, -2.992161, 5.862733,
3.591601, 3.609856, -4.963138,
3.591601, 3.609856, 5.862733
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
var radius = 7.738646;
var distance = 34.43011;
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
mvMatrix.translate( -0.08293998, -0.3088475, -0.4497976 );
mvMatrix.scale( 1.19236, 1.267367, 0.7728871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43011);
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
pyracarbolid<-read.table("pyracarbolid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyracarbolid$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
y<-pyracarbolid$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
```

```r
z<-pyracarbolid$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyracarbolid' not found
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
-3.323527, -0.402286, -2.791647, 0, 0, 1, 1, 1,
-2.726374, -0.2742302, -3.123612, 1, 0, 0, 1, 1,
-2.570937, 0.2609649, -0.4109201, 1, 0, 0, 1, 1,
-2.500758, -1.452864, -3.075108, 1, 0, 0, 1, 1,
-2.450757, -0.2631631, -2.211388, 1, 0, 0, 1, 1,
-2.249229, 1.222122, -2.052488, 1, 0, 0, 1, 1,
-2.220981, -1.392214, -1.943314, 0, 0, 0, 1, 1,
-2.195178, -0.9628704, -1.579139, 0, 0, 0, 1, 1,
-2.192892, -1.571871, -2.225657, 0, 0, 0, 1, 1,
-2.189781, -0.0663243, -0.8311344, 0, 0, 0, 1, 1,
-2.104929, -0.4404477, -1.783214, 0, 0, 0, 1, 1,
-2.08616, -0.5450299, -0.3280629, 0, 0, 0, 1, 1,
-2.081628, 0.8294883, -1.197726, 0, 0, 0, 1, 1,
-2.075799, 2.313063, -1.792136, 1, 1, 1, 1, 1,
-2.058414, -1.269095, -0.8187554, 1, 1, 1, 1, 1,
-2.058131, -0.160216, -1.908953, 1, 1, 1, 1, 1,
-1.994781, -1.964123, -3.395899, 1, 1, 1, 1, 1,
-1.957596, -0.8858906, -1.175238, 1, 1, 1, 1, 1,
-1.919528, 1.372907, -1.218247, 1, 1, 1, 1, 1,
-1.917696, -1.836331, -2.245807, 1, 1, 1, 1, 1,
-1.894548, -1.044372, -3.813696, 1, 1, 1, 1, 1,
-1.866924, -0.4423484, -1.976394, 1, 1, 1, 1, 1,
-1.861234, 0.8193607, -1.630045, 1, 1, 1, 1, 1,
-1.860331, -0.6327687, -0.1078411, 1, 1, 1, 1, 1,
-1.846866, 0.05877991, -2.071358, 1, 1, 1, 1, 1,
-1.830339, -0.7275558, -0.7351601, 1, 1, 1, 1, 1,
-1.819055, -0.8737748, -1.605821, 1, 1, 1, 1, 1,
-1.782411, 0.6551909, 1.947976, 1, 1, 1, 1, 1,
-1.78074, 0.8748506, -0.7044592, 0, 0, 1, 1, 1,
-1.773657, 0.9510362, -2.018617, 1, 0, 0, 1, 1,
-1.770893, -0.1718162, -3.885815, 1, 0, 0, 1, 1,
-1.768045, -1.143874, -2.866281, 1, 0, 0, 1, 1,
-1.764848, -0.2055697, -0.2849428, 1, 0, 0, 1, 1,
-1.750177, -1.070953, -1.444312, 1, 0, 0, 1, 1,
-1.71894, 0.09392446, -0.9940175, 0, 0, 0, 1, 1,
-1.712963, -1.257145, -2.682708, 0, 0, 0, 1, 1,
-1.710101, -2.211712, -2.306234, 0, 0, 0, 1, 1,
-1.698452, -0.2406533, -2.599448, 0, 0, 0, 1, 1,
-1.698048, -0.3741504, -2.280428, 0, 0, 0, 1, 1,
-1.68598, 0.08506324, -3.078609, 0, 0, 0, 1, 1,
-1.685592, -0.5686355, -2.993096, 0, 0, 0, 1, 1,
-1.676024, -0.3060274, -1.483704, 1, 1, 1, 1, 1,
-1.647324, 0.7462381, -0.7261621, 1, 1, 1, 1, 1,
-1.646558, 1.240407, -0.1411275, 1, 1, 1, 1, 1,
-1.624966, 0.2189836, -3.490432, 1, 1, 1, 1, 1,
-1.622755, 0.1702285, -1.08322, 1, 1, 1, 1, 1,
-1.621817, -1.888002, -2.59276, 1, 1, 1, 1, 1,
-1.619309, -0.6089044, -2.396144, 1, 1, 1, 1, 1,
-1.615156, 0.8419858, -2.451758, 1, 1, 1, 1, 1,
-1.61164, -0.9277656, -1.228696, 1, 1, 1, 1, 1,
-1.611171, 0.6010201, -0.7035742, 1, 1, 1, 1, 1,
-1.607819, 0.60543, -0.1952345, 1, 1, 1, 1, 1,
-1.592466, 0.1000469, -1.276264, 1, 1, 1, 1, 1,
-1.590218, 1.452923, -0.5555744, 1, 1, 1, 1, 1,
-1.560582, -0.726362, -2.606266, 1, 1, 1, 1, 1,
-1.559185, 1.400854, -1.88176, 1, 1, 1, 1, 1,
-1.557718, 0.387845, -0.2983441, 0, 0, 1, 1, 1,
-1.549387, -1.385444, -1.377055, 1, 0, 0, 1, 1,
-1.54488, -0.4584126, -2.49813, 1, 0, 0, 1, 1,
-1.539391, 0.5650199, -0.8228875, 1, 0, 0, 1, 1,
-1.529454, 0.11653, -0.5783998, 1, 0, 0, 1, 1,
-1.519382, 1.444712, 0.2886992, 1, 0, 0, 1, 1,
-1.508133, 0.5983223, -2.71325, 0, 0, 0, 1, 1,
-1.506546, -0.5594166, -0.4335085, 0, 0, 0, 1, 1,
-1.499951, -1.04167, -3.03061, 0, 0, 0, 1, 1,
-1.499534, -1.496908, -3.224403, 0, 0, 0, 1, 1,
-1.474516, -1.616794, -1.959208, 0, 0, 0, 1, 1,
-1.472273, -0.9873197, -0.7450758, 0, 0, 0, 1, 1,
-1.471545, -0.185074, -1.645397, 0, 0, 0, 1, 1,
-1.470604, -0.8048047, -1.266613, 1, 1, 1, 1, 1,
-1.45207, -0.1940015, -2.362978, 1, 1, 1, 1, 1,
-1.446411, 0.2675966, -2.424284, 1, 1, 1, 1, 1,
-1.438462, 0.6063101, -0.9436355, 1, 1, 1, 1, 1,
-1.437805, 0.2878661, -0.4414165, 1, 1, 1, 1, 1,
-1.424897, -0.6495526, -2.13142, 1, 1, 1, 1, 1,
-1.421327, 0.6730551, -1.224363, 1, 1, 1, 1, 1,
-1.417857, 0.1611791, -3.284529, 1, 1, 1, 1, 1,
-1.397641, 0.4573007, -2.623163, 1, 1, 1, 1, 1,
-1.38971, -1.145642, -2.647292, 1, 1, 1, 1, 1,
-1.385644, 0.2923148, -1.344029, 1, 1, 1, 1, 1,
-1.382714, -0.1970199, -1.289747, 1, 1, 1, 1, 1,
-1.35662, -1.103847, -0.4136073, 1, 1, 1, 1, 1,
-1.353971, -0.5382916, -1.740877, 1, 1, 1, 1, 1,
-1.352285, -1.108373, -3.044026, 1, 1, 1, 1, 1,
-1.344475, 1.290435, -0.5541258, 0, 0, 1, 1, 1,
-1.340169, -0.714148, -2.777532, 1, 0, 0, 1, 1,
-1.336415, 2.409154, 0.1129452, 1, 0, 0, 1, 1,
-1.334284, -0.5476153, -2.111239, 1, 0, 0, 1, 1,
-1.329783, 0.02268363, -0.9593838, 1, 0, 0, 1, 1,
-1.329276, -0.9267435, -3.280379, 1, 0, 0, 1, 1,
-1.32162, -0.393112, -1.918847, 0, 0, 0, 1, 1,
-1.315833, 1.462045, 0.1763902, 0, 0, 0, 1, 1,
-1.29642, 0.4402902, -1.050866, 0, 0, 0, 1, 1,
-1.285878, 0.9828474, 0.6998935, 0, 0, 0, 1, 1,
-1.283726, -1.327135, -3.158735, 0, 0, 0, 1, 1,
-1.278972, -0.07945774, -1.551952, 0, 0, 0, 1, 1,
-1.273378, -0.7991487, -0.9599007, 0, 0, 0, 1, 1,
-1.268142, -0.01435514, -2.440698, 1, 1, 1, 1, 1,
-1.26278, -0.989401, -0.1390577, 1, 1, 1, 1, 1,
-1.255176, 0.7948672, -2.626776, 1, 1, 1, 1, 1,
-1.251582, -1.603606, -2.942188, 1, 1, 1, 1, 1,
-1.25046, 0.1827014, -0.2417236, 1, 1, 1, 1, 1,
-1.243961, -0.6923643, -1.720514, 1, 1, 1, 1, 1,
-1.24317, -1.527721, -1.110241, 1, 1, 1, 1, 1,
-1.237001, -0.6879247, -2.170555, 1, 1, 1, 1, 1,
-1.235214, -0.6032919, -0.7278909, 1, 1, 1, 1, 1,
-1.218201, -0.2970476, -2.081587, 1, 1, 1, 1, 1,
-1.216805, 0.9222913, -1.433823, 1, 1, 1, 1, 1,
-1.193055, 0.8170229, 0.631786, 1, 1, 1, 1, 1,
-1.191507, -0.3417535, -2.514654, 1, 1, 1, 1, 1,
-1.184376, 0.3596855, -0.533089, 1, 1, 1, 1, 1,
-1.17817, -0.4425735, -1.597084, 1, 1, 1, 1, 1,
-1.177024, 0.1310912, -1.148601, 0, 0, 1, 1, 1,
-1.164491, -1.080899, -0.9433419, 1, 0, 0, 1, 1,
-1.160335, 0.3935475, -2.428114, 1, 0, 0, 1, 1,
-1.155772, 0.5535108, -1.11289, 1, 0, 0, 1, 1,
-1.153765, 0.4113204, -0.05511421, 1, 0, 0, 1, 1,
-1.15089, -0.9188774, -2.238359, 1, 0, 0, 1, 1,
-1.145454, -0.6892184, -1.946773, 0, 0, 0, 1, 1,
-1.145139, 0.9296479, 0.3570882, 0, 0, 0, 1, 1,
-1.144723, -0.4321536, -2.366335, 0, 0, 0, 1, 1,
-1.140936, 0.994692, -1.175678, 0, 0, 0, 1, 1,
-1.139329, -1.465308, -1.527608, 0, 0, 0, 1, 1,
-1.132377, -0.281931, -2.758091, 0, 0, 0, 1, 1,
-1.131634, 0.143745, -1.02324, 0, 0, 0, 1, 1,
-1.114345, 0.5855026, -2.011782, 1, 1, 1, 1, 1,
-1.099315, -0.274455, -2.577141, 1, 1, 1, 1, 1,
-1.087873, 0.2586324, -2.094732, 1, 1, 1, 1, 1,
-1.075775, -0.1439554, -2.608934, 1, 1, 1, 1, 1,
-1.074149, -0.4391354, -3.107564, 1, 1, 1, 1, 1,
-1.067065, 0.8032215, -1.50835, 1, 1, 1, 1, 1,
-1.057133, 0.07277772, -2.365266, 1, 1, 1, 1, 1,
-1.055097, -2.4611, -1.113308, 1, 1, 1, 1, 1,
-1.054622, -0.1637442, -1.677552, 1, 1, 1, 1, 1,
-1.052963, 0.5524926, 0.02476159, 1, 1, 1, 1, 1,
-1.049403, -0.03625213, -1.21009, 1, 1, 1, 1, 1,
-1.040126, 0.7694222, 0.4164849, 1, 1, 1, 1, 1,
-1.03958, -0.6117929, -2.037498, 1, 1, 1, 1, 1,
-1.037106, -0.3080414, -2.179529, 1, 1, 1, 1, 1,
-1.032439, 1.057632, 0.9243845, 1, 1, 1, 1, 1,
-1.031664, -0.5312653, -4.101637, 0, 0, 1, 1, 1,
-1.026896, 0.1034899, -0.4104089, 1, 0, 0, 1, 1,
-1.019541, 0.1177611, 0.2712145, 1, 0, 0, 1, 1,
-1.016364, -0.2661878, -1.97487, 1, 0, 0, 1, 1,
-1.003436, -0.9665776, -1.770079, 1, 0, 0, 1, 1,
-1.002823, 1.884246, -1.119803, 1, 0, 0, 1, 1,
-0.9951857, 0.8131654, -0.8740891, 0, 0, 0, 1, 1,
-0.9905596, -0.4313745, -1.801701, 0, 0, 0, 1, 1,
-0.9905037, 0.5623894, -0.659391, 0, 0, 0, 1, 1,
-0.9887904, -1.197809, -3.250828, 0, 0, 0, 1, 1,
-0.9884955, 1.520009, -0.8319708, 0, 0, 0, 1, 1,
-0.9879044, 1.155051, -0.01096215, 0, 0, 0, 1, 1,
-0.9834264, 0.394442, -1.682582, 0, 0, 0, 1, 1,
-0.971765, 1.293277, -1.827959, 1, 1, 1, 1, 1,
-0.9582648, -0.9042857, -2.424191, 1, 1, 1, 1, 1,
-0.9496688, 1.114438, -1.802946, 1, 1, 1, 1, 1,
-0.9455816, -0.09280953, -1.016525, 1, 1, 1, 1, 1,
-0.9421252, -2.742008, -1.464993, 1, 1, 1, 1, 1,
-0.9373916, -1.608139, -3.206739, 1, 1, 1, 1, 1,
-0.9372318, 0.5216383, -1.079361, 1, 1, 1, 1, 1,
-0.9367797, 0.8684941, -0.15631, 1, 1, 1, 1, 1,
-0.9284123, -0.1494351, -2.428352, 1, 1, 1, 1, 1,
-0.9187569, 0.1625113, -2.388846, 1, 1, 1, 1, 1,
-0.9158363, 0.2086521, -1.843804, 1, 1, 1, 1, 1,
-0.9150194, 0.7476041, 0.07106923, 1, 1, 1, 1, 1,
-0.9145651, 0.43624, -1.064776, 1, 1, 1, 1, 1,
-0.9112759, 0.123738, -1.614954, 1, 1, 1, 1, 1,
-0.9001096, -0.1096296, -1.819709, 1, 1, 1, 1, 1,
-0.8971749, -0.5938879, -3.392064, 0, 0, 1, 1, 1,
-0.8933668, 0.07143794, -1.896992, 1, 0, 0, 1, 1,
-0.8871218, -0.8398478, -2.811341, 1, 0, 0, 1, 1,
-0.8825778, 0.9862314, -0.7158815, 1, 0, 0, 1, 1,
-0.8820465, -0.4805119, -2.095214, 1, 0, 0, 1, 1,
-0.8750672, 0.2006639, 0.05810035, 1, 0, 0, 1, 1,
-0.8722016, 0.5188885, -2.406363, 0, 0, 0, 1, 1,
-0.8716564, -0.9402789, -1.97347, 0, 0, 0, 1, 1,
-0.8690344, 0.4628202, -0.2584276, 0, 0, 0, 1, 1,
-0.8651556, -1.407173, -2.110813, 0, 0, 0, 1, 1,
-0.8620128, -1.445483, -2.89684, 0, 0, 0, 1, 1,
-0.8606352, 0.4682343, -1.149699, 0, 0, 0, 1, 1,
-0.8586385, -0.2287893, -1.226792, 0, 0, 0, 1, 1,
-0.857888, -0.3659467, -0.5489816, 1, 1, 1, 1, 1,
-0.8563782, -1.786993, -2.565807, 1, 1, 1, 1, 1,
-0.8488665, -0.3369365, -1.725468, 1, 1, 1, 1, 1,
-0.8478014, -0.1033345, -0.3107374, 1, 1, 1, 1, 1,
-0.8473741, 0.2343078, -2.353777, 1, 1, 1, 1, 1,
-0.8450479, 0.01474042, -1.885066, 1, 1, 1, 1, 1,
-0.8390041, 2.075753, 0.07535628, 1, 1, 1, 1, 1,
-0.8352832, 1.948802, 0.0213435, 1, 1, 1, 1, 1,
-0.8329064, 1.277003, -1.158252, 1, 1, 1, 1, 1,
-0.8323237, -0.6234887, 0.1353386, 1, 1, 1, 1, 1,
-0.828981, -1.38058, -0.8930405, 1, 1, 1, 1, 1,
-0.8283753, 0.1122453, -1.701368, 1, 1, 1, 1, 1,
-0.8260846, -0.3697875, -2.661443, 1, 1, 1, 1, 1,
-0.8171951, 2.446874, -1.032315, 1, 1, 1, 1, 1,
-0.8115859, -0.478385, -2.739138, 1, 1, 1, 1, 1,
-0.8063642, 0.6054556, -0.8674061, 0, 0, 1, 1, 1,
-0.7991515, -0.7267465, -0.8551099, 1, 0, 0, 1, 1,
-0.798974, -0.09780117, -3.480324, 1, 0, 0, 1, 1,
-0.7884735, 0.00559981, -0.9965638, 1, 0, 0, 1, 1,
-0.787365, 0.2160074, -0.2367447, 1, 0, 0, 1, 1,
-0.7821723, -1.876559, -3.334876, 1, 0, 0, 1, 1,
-0.7806354, -1.687324, -3.635554, 0, 0, 0, 1, 1,
-0.777079, -1.375694, -2.229358, 0, 0, 0, 1, 1,
-0.7755292, -0.3371338, -2.137429, 0, 0, 0, 1, 1,
-0.7738602, -1.041692, -2.920485, 0, 0, 0, 1, 1,
-0.7736403, 1.867828, 0.5806821, 0, 0, 0, 1, 1,
-0.7685837, -0.1990941, -3.23864, 0, 0, 0, 1, 1,
-0.7660584, 1.119827, -1.021343, 0, 0, 0, 1, 1,
-0.7650644, -0.6903055, -2.924387, 1, 1, 1, 1, 1,
-0.7621225, 0.08467703, -2.54782, 1, 1, 1, 1, 1,
-0.7611021, 0.2903281, -0.6861852, 1, 1, 1, 1, 1,
-0.7587765, 1.977524, 0.05183138, 1, 1, 1, 1, 1,
-0.7563792, 1.160491, -1.678934, 1, 1, 1, 1, 1,
-0.7555786, -0.6402364, -1.609834, 1, 1, 1, 1, 1,
-0.755069, -0.8917497, -2.519064, 1, 1, 1, 1, 1,
-0.7511157, 0.2830605, 0.3296081, 1, 1, 1, 1, 1,
-0.7504285, -0.1422102, -2.152171, 1, 1, 1, 1, 1,
-0.7335507, -2.223899, -2.563674, 1, 1, 1, 1, 1,
-0.7285306, -1.228361, -0.1394283, 1, 1, 1, 1, 1,
-0.7187429, -0.4594497, -2.925399, 1, 1, 1, 1, 1,
-0.7129505, -0.5837176, -3.535378, 1, 1, 1, 1, 1,
-0.7102104, -1.049641, -3.096388, 1, 1, 1, 1, 1,
-0.7096995, 0.2635123, -0.6412074, 1, 1, 1, 1, 1,
-0.7055284, 0.7074361, -1.230315, 0, 0, 1, 1, 1,
-0.7040259, -0.5993747, -3.065306, 1, 0, 0, 1, 1,
-0.7026513, 1.164456, -0.6334695, 1, 0, 0, 1, 1,
-0.6951628, -1.063542, -2.717209, 1, 0, 0, 1, 1,
-0.694113, -0.1129313, -1.878659, 1, 0, 0, 1, 1,
-0.6864663, 0.6257732, 0.559646, 1, 0, 0, 1, 1,
-0.6826431, -0.1790937, -1.272184, 0, 0, 0, 1, 1,
-0.6803591, 0.9586928, 0.3500853, 0, 0, 0, 1, 1,
-0.6686493, 0.7059836, -0.9609506, 0, 0, 0, 1, 1,
-0.6652726, -2.011419, -2.59143, 0, 0, 0, 1, 1,
-0.6646279, 0.6155338, -1.982985, 0, 0, 0, 1, 1,
-0.6621798, 1.653231, 1.123065, 0, 0, 0, 1, 1,
-0.661803, 1.705173, 0.5553144, 0, 0, 0, 1, 1,
-0.657684, 0.7451219, 0.5957243, 1, 1, 1, 1, 1,
-0.6546651, 1.016612, -1.80929, 1, 1, 1, 1, 1,
-0.6539509, -0.009002876, -2.543673, 1, 1, 1, 1, 1,
-0.6515385, -2.422266, -4.053225, 1, 1, 1, 1, 1,
-0.6500612, 2.315209, -3.238185, 1, 1, 1, 1, 1,
-0.6490365, -2.211908, -3.569728, 1, 1, 1, 1, 1,
-0.6473916, -0.7143102, -2.030143, 1, 1, 1, 1, 1,
-0.647019, -1.554977, -4.001537, 1, 1, 1, 1, 1,
-0.645082, 0.7405694, -0.6649499, 1, 1, 1, 1, 1,
-0.6415151, -1.181093, -3.527496, 1, 1, 1, 1, 1,
-0.6411492, -1.401293, -2.548331, 1, 1, 1, 1, 1,
-0.6409745, 1.498658, -0.5024635, 1, 1, 1, 1, 1,
-0.6358114, -0.3326544, -1.385713, 1, 1, 1, 1, 1,
-0.633822, -0.5905679, -0.1145213, 1, 1, 1, 1, 1,
-0.62953, 1.243235, -2.043432, 1, 1, 1, 1, 1,
-0.6283391, 0.162575, -2.060676, 0, 0, 1, 1, 1,
-0.6283269, -1.15834, -1.934226, 1, 0, 0, 1, 1,
-0.6189107, 0.5675454, -2.49309, 1, 0, 0, 1, 1,
-0.6136187, -0.4922533, -1.489607, 1, 0, 0, 1, 1,
-0.6129201, 0.06996128, -2.321224, 1, 0, 0, 1, 1,
-0.6125436, -1.214799, -3.472869, 1, 0, 0, 1, 1,
-0.6084201, 0.01833396, -2.283257, 0, 0, 0, 1, 1,
-0.604735, 0.7347286, 0.2954882, 0, 0, 0, 1, 1,
-0.6027105, 0.3008549, -1.184714, 0, 0, 0, 1, 1,
-0.6012871, 1.081256, -1.006115, 0, 0, 0, 1, 1,
-0.6006708, 0.2026914, -0.6563494, 0, 0, 0, 1, 1,
-0.5936577, -0.146426, -1.242305, 0, 0, 0, 1, 1,
-0.5850068, -2.322523, -2.335386, 0, 0, 0, 1, 1,
-0.583806, -0.532271, -1.814997, 1, 1, 1, 1, 1,
-0.5829296, 0.3596775, -1.196186, 1, 1, 1, 1, 1,
-0.5812039, 0.01079403, -1.873702, 1, 1, 1, 1, 1,
-0.5792047, 0.8722147, -0.432098, 1, 1, 1, 1, 1,
-0.5717804, -0.2224117, -1.325918, 1, 1, 1, 1, 1,
-0.5715632, -0.4177319, -0.6404551, 1, 1, 1, 1, 1,
-0.5693145, 0.0029831, -0.3478482, 1, 1, 1, 1, 1,
-0.5662383, 0.8617516, 1.441827, 1, 1, 1, 1, 1,
-0.5611674, 0.2107444, -1.111136, 1, 1, 1, 1, 1,
-0.5596138, -0.3694465, -1.937701, 1, 1, 1, 1, 1,
-0.5594455, -2.515722, -1.983146, 1, 1, 1, 1, 1,
-0.5577351, 0.1166602, -0.6643624, 1, 1, 1, 1, 1,
-0.5542399, -0.1424857, -4.144113, 1, 1, 1, 1, 1,
-0.550373, 1.520806, 1.068424, 1, 1, 1, 1, 1,
-0.5498269, 0.8963256, -1.70874, 1, 1, 1, 1, 1,
-0.546829, -0.1638076, -2.129822, 0, 0, 1, 1, 1,
-0.5464642, 0.4792274, -0.5935751, 1, 0, 0, 1, 1,
-0.5455996, -0.3954874, -1.440048, 1, 0, 0, 1, 1,
-0.5452305, 1.334441, -0.5585141, 1, 0, 0, 1, 1,
-0.5410098, 0.9585778, -0.07990199, 1, 0, 0, 1, 1,
-0.540616, 0.4672292, -1.249796, 1, 0, 0, 1, 1,
-0.5399708, -0.2750051, -3.311512, 0, 0, 0, 1, 1,
-0.529723, 0.3098119, -2.518407, 0, 0, 0, 1, 1,
-0.5241799, 1.199318, -0.4357941, 0, 0, 0, 1, 1,
-0.5216374, 0.4904815, -0.08996098, 0, 0, 0, 1, 1,
-0.5209039, 0.01259171, -1.915433, 0, 0, 0, 1, 1,
-0.5179377, 0.5318791, -1.485592, 0, 0, 0, 1, 1,
-0.5170141, 1.346691, -0.2145869, 0, 0, 0, 1, 1,
-0.5161541, 0.1123074, -1.879652, 1, 1, 1, 1, 1,
-0.5156035, 1.000509, -0.8024997, 1, 1, 1, 1, 1,
-0.5122883, 2.130359, -0.9427354, 1, 1, 1, 1, 1,
-0.5105311, 0.6871958, 0.7530796, 1, 1, 1, 1, 1,
-0.500861, 0.537044, 1.761951, 1, 1, 1, 1, 1,
-0.4927618, -0.2555209, -3.913202, 1, 1, 1, 1, 1,
-0.4900815, -0.5295812, -3.142325, 1, 1, 1, 1, 1,
-0.4873168, 0.8655322, 0.4530197, 1, 1, 1, 1, 1,
-0.4838799, 1.635344, 0.1658285, 1, 1, 1, 1, 1,
-0.4838572, -0.4346932, -3.058853, 1, 1, 1, 1, 1,
-0.4813547, 0.5348185, -1.277536, 1, 1, 1, 1, 1,
-0.4808784, 0.0990518, -1.184926, 1, 1, 1, 1, 1,
-0.4781847, 0.2507044, -1.280908, 1, 1, 1, 1, 1,
-0.4768418, 0.3895024, 1.197764, 1, 1, 1, 1, 1,
-0.4735472, -0.2557952, -1.749785, 1, 1, 1, 1, 1,
-0.4680306, 1.483211, 0.5396377, 0, 0, 1, 1, 1,
-0.46639, -1.609416, -3.844607, 1, 0, 0, 1, 1,
-0.4555508, -1.83618, -2.038877, 1, 0, 0, 1, 1,
-0.4509464, 1.992628, -0.4489474, 1, 0, 0, 1, 1,
-0.4496735, 0.8916145, -0.6584123, 1, 0, 0, 1, 1,
-0.4468892, -0.07734953, -2.549256, 1, 0, 0, 1, 1,
-0.44542, -0.3927667, -0.4090292, 0, 0, 0, 1, 1,
-0.4382108, 0.07504609, -2.146221, 0, 0, 0, 1, 1,
-0.4364839, -0.2979742, -2.166258, 0, 0, 0, 1, 1,
-0.4342987, 0.4212589, -0.544874, 0, 0, 0, 1, 1,
-0.4327201, -0.002050054, -3.075093, 0, 0, 0, 1, 1,
-0.4315996, 0.2554894, -1.239469, 0, 0, 0, 1, 1,
-0.4310078, 1.334697, -0.166286, 0, 0, 0, 1, 1,
-0.4291828, -0.3718353, -3.249586, 1, 1, 1, 1, 1,
-0.4265028, 0.3986789, -0.4761187, 1, 1, 1, 1, 1,
-0.4257906, -0.8283932, -3.267429, 1, 1, 1, 1, 1,
-0.424687, -0.2220163, -1.408516, 1, 1, 1, 1, 1,
-0.424645, 0.5888363, -1.146939, 1, 1, 1, 1, 1,
-0.4220794, 1.437637, -1.515108, 1, 1, 1, 1, 1,
-0.4168223, 0.6437126, -0.08771864, 1, 1, 1, 1, 1,
-0.4096263, -0.5206352, -2.961506, 1, 1, 1, 1, 1,
-0.4084036, 0.7455571, -1.240245, 1, 1, 1, 1, 1,
-0.4058226, 0.1865835, -0.765961, 1, 1, 1, 1, 1,
-0.4043635, -1.205357, -3.176194, 1, 1, 1, 1, 1,
-0.394008, -0.7352145, -3.429649, 1, 1, 1, 1, 1,
-0.3913569, -0.8692768, -3.709923, 1, 1, 1, 1, 1,
-0.3901972, 0.2424529, -2.5843, 1, 1, 1, 1, 1,
-0.389766, 0.5301566, -1.783385, 1, 1, 1, 1, 1,
-0.3884358, -0.5153298, -1.477836, 0, 0, 1, 1, 1,
-0.3878437, 1.92883, -0.006468114, 1, 0, 0, 1, 1,
-0.386139, -0.4297493, -1.823376, 1, 0, 0, 1, 1,
-0.3859675, 0.6576002, -0.1312962, 1, 0, 0, 1, 1,
-0.3777139, 0.2722897, -1.525029, 1, 0, 0, 1, 1,
-0.3723803, 0.072428, -1.868831, 1, 0, 0, 1, 1,
-0.3722086, 0.2494828, 0.102687, 0, 0, 0, 1, 1,
-0.3706062, 0.3860651, 1.507246, 0, 0, 0, 1, 1,
-0.3703156, -1.87543, -1.37595, 0, 0, 0, 1, 1,
-0.3692719, -0.4425089, -1.679857, 0, 0, 0, 1, 1,
-0.3666853, 0.08702973, -0.2144958, 0, 0, 0, 1, 1,
-0.3663895, 1.398749, 0.8988146, 0, 0, 0, 1, 1,
-0.3608907, 0.4057082, 0.6377989, 0, 0, 0, 1, 1,
-0.3592548, 0.3919402, -0.5218555, 1, 1, 1, 1, 1,
-0.3567463, -0.8360764, -2.16863, 1, 1, 1, 1, 1,
-0.3544185, -0.6940336, -2.12634, 1, 1, 1, 1, 1,
-0.3445517, -1.115018, -4.26878, 1, 1, 1, 1, 1,
-0.3433672, -0.4111131, -2.331886, 1, 1, 1, 1, 1,
-0.3406359, 0.4720807, -1.371158, 1, 1, 1, 1, 1,
-0.3405243, 0.829764, 0.7782835, 1, 1, 1, 1, 1,
-0.3348304, 0.03305508, -2.264275, 1, 1, 1, 1, 1,
-0.3303818, -0.4202884, -2.167019, 1, 1, 1, 1, 1,
-0.3303481, 1.096916, -1.69677, 1, 1, 1, 1, 1,
-0.3296847, 0.05342856, -2.15745, 1, 1, 1, 1, 1,
-0.3260276, -1.714189, -1.844209, 1, 1, 1, 1, 1,
-0.3255502, 0.6181461, -2.481311, 1, 1, 1, 1, 1,
-0.3243916, 0.4054441, 0.9335939, 1, 1, 1, 1, 1,
-0.324242, -0.9373331, -3.258353, 1, 1, 1, 1, 1,
-0.3241971, 0.2986005, -1.757194, 0, 0, 1, 1, 1,
-0.3218625, -0.5753251, -0.9906443, 1, 0, 0, 1, 1,
-0.3214344, 1.901446, -0.3437983, 1, 0, 0, 1, 1,
-0.3196947, 0.5443437, 0.5280318, 1, 0, 0, 1, 1,
-0.318664, -0.9315971, -0.908985, 1, 0, 0, 1, 1,
-0.3167068, 0.3977545, -1.060246, 1, 0, 0, 1, 1,
-0.3081984, 0.3797917, -2.670514, 0, 0, 0, 1, 1,
-0.3069393, -0.5380322, -2.703525, 0, 0, 0, 1, 1,
-0.3037643, 0.7311168, -1.555745, 0, 0, 0, 1, 1,
-0.2991064, 0.9165108, -0.5356194, 0, 0, 0, 1, 1,
-0.2965813, -0.6812697, -2.661702, 0, 0, 0, 1, 1,
-0.2962567, -0.1771027, -0.6011961, 0, 0, 0, 1, 1,
-0.2962216, 1.418488, 3.484927, 0, 0, 0, 1, 1,
-0.2893037, 1.197766, -0.206089, 1, 1, 1, 1, 1,
-0.2889122, 0.4213914, 0.4620031, 1, 1, 1, 1, 1,
-0.2829852, -0.2372697, -0.4781542, 1, 1, 1, 1, 1,
-0.2822144, 0.5672951, 0.3999247, 1, 1, 1, 1, 1,
-0.274716, 0.9414389, 0.9345043, 1, 1, 1, 1, 1,
-0.2718348, 2.574602, -1.874834, 1, 1, 1, 1, 1,
-0.268264, 0.6113585, -2.034772, 1, 1, 1, 1, 1,
-0.2681201, -0.1951806, -1.633563, 1, 1, 1, 1, 1,
-0.2659214, 0.1543923, -1.611218, 1, 1, 1, 1, 1,
-0.2613309, 0.5716478, 1.211258, 1, 1, 1, 1, 1,
-0.2610931, 1.77062, -1.744211, 1, 1, 1, 1, 1,
-0.2584478, -0.2188447, -1.422078, 1, 1, 1, 1, 1,
-0.2533449, 0.1771639, -1.344102, 1, 1, 1, 1, 1,
-0.2529741, -0.9310426, -1.078637, 1, 1, 1, 1, 1,
-0.2528896, -0.03165175, -3.65066, 1, 1, 1, 1, 1,
-0.2517601, -1.378619, -2.75268, 0, 0, 1, 1, 1,
-0.2510923, -0.9551803, -4.523848, 1, 0, 0, 1, 1,
-0.2504808, 0.7356657, -1.259971, 1, 0, 0, 1, 1,
-0.2435789, -0.229479, -0.4742371, 1, 0, 0, 1, 1,
-0.2424176, -2.428209, -3.363127, 1, 0, 0, 1, 1,
-0.2390759, -0.08602357, -1.739916, 1, 0, 0, 1, 1,
-0.2327383, -1.284141, -2.526402, 0, 0, 0, 1, 1,
-0.2306138, 0.5304105, -1.829504, 0, 0, 0, 1, 1,
-0.2281487, -0.6476737, -1.864244, 0, 0, 0, 1, 1,
-0.2274959, -0.2335095, -0.9205285, 0, 0, 0, 1, 1,
-0.2224377, 1.208697, -1.204034, 0, 0, 0, 1, 1,
-0.2217, 1.075919, 0.1967839, 0, 0, 0, 1, 1,
-0.2206075, 0.8142825, 0.4584629, 0, 0, 0, 1, 1,
-0.21991, 0.5252761, 0.01654016, 1, 1, 1, 1, 1,
-0.2165147, -1.01045, -4.603035, 1, 1, 1, 1, 1,
-0.2158148, -0.4334415, -2.211526, 1, 1, 1, 1, 1,
-0.2132069, -0.3396244, -3.425025, 1, 1, 1, 1, 1,
-0.2128369, 1.520416, 1.534122, 1, 1, 1, 1, 1,
-0.2055424, 0.1010668, 0.6470442, 1, 1, 1, 1, 1,
-0.2021117, -2.019799, -4.181409, 1, 1, 1, 1, 1,
-0.2021005, 0.7129875, -0.5460591, 1, 1, 1, 1, 1,
-0.1938512, -0.9644965, -2.753682, 1, 1, 1, 1, 1,
-0.1934138, -0.2396394, -1.926921, 1, 1, 1, 1, 1,
-0.1910466, -0.3507481, -1.828308, 1, 1, 1, 1, 1,
-0.1900389, 0.8039509, 0.002783743, 1, 1, 1, 1, 1,
-0.1884702, 0.5098657, -0.378825, 1, 1, 1, 1, 1,
-0.187794, 2.568171, 0.06857198, 1, 1, 1, 1, 1,
-0.1830207, -2.358566, -4.409985, 1, 1, 1, 1, 1,
-0.1809752, -0.5853713, -2.106684, 0, 0, 1, 1, 1,
-0.1808221, 0.660686, -2.047322, 1, 0, 0, 1, 1,
-0.1787628, 1.854425, 0.7115273, 1, 0, 0, 1, 1,
-0.169593, 0.9018, -1.304374, 1, 0, 0, 1, 1,
-0.1677953, 0.479405, -1.622377, 1, 0, 0, 1, 1,
-0.1669648, -0.522936, -0.3595435, 1, 0, 0, 1, 1,
-0.1620409, 1.268673, -0.3285593, 0, 0, 0, 1, 1,
-0.1537623, -1.414901, -1.839483, 0, 0, 0, 1, 1,
-0.1507266, 0.1476506, -0.07807572, 0, 0, 0, 1, 1,
-0.149351, -0.5346102, -4.233016, 0, 0, 0, 1, 1,
-0.1468859, -0.71097, -1.734779, 0, 0, 0, 1, 1,
-0.1447905, -1.023049, -4.80548, 0, 0, 0, 1, 1,
-0.1433929, 2.095379, -1.268351, 0, 0, 0, 1, 1,
-0.1433853, 0.1960818, -3.668176, 1, 1, 1, 1, 1,
-0.1405047, -1.558394, -3.703413, 1, 1, 1, 1, 1,
-0.1373907, -1.311524, -3.452571, 1, 1, 1, 1, 1,
-0.1365462, 1.283764, -1.977627, 1, 1, 1, 1, 1,
-0.1365146, -0.5817531, -3.080668, 1, 1, 1, 1, 1,
-0.1311427, -0.3182653, -0.7068528, 1, 1, 1, 1, 1,
-0.1298945, -0.454314, -3.904183, 1, 1, 1, 1, 1,
-0.1296813, 0.9091339, -1.984752, 1, 1, 1, 1, 1,
-0.1249051, 0.3252701, -0.3777857, 1, 1, 1, 1, 1,
-0.1214065, -0.2184204, -1.8495, 1, 1, 1, 1, 1,
-0.1213946, 1.015394, 0.7114661, 1, 1, 1, 1, 1,
-0.1204968, 0.2936848, -0.7104587, 1, 1, 1, 1, 1,
-0.1175755, 0.7001598, -0.2086521, 1, 1, 1, 1, 1,
-0.1101738, 0.5104901, 1.082139, 1, 1, 1, 1, 1,
-0.1095306, 0.669541, 0.7277697, 1, 1, 1, 1, 1,
-0.1089395, 1.055761, 0.3426201, 0, 0, 1, 1, 1,
-0.1086617, -0.8080137, -1.801614, 1, 0, 0, 1, 1,
-0.1053789, 0.4908896, -0.6805166, 1, 0, 0, 1, 1,
-0.1040988, 0.2443504, -0.7147658, 1, 0, 0, 1, 1,
-0.1038254, -1.365924, -2.667481, 1, 0, 0, 1, 1,
-0.1031322, -0.7526417, -4.483349, 1, 0, 0, 1, 1,
-0.1015251, 0.2481233, -1.038904, 0, 0, 0, 1, 1,
-0.09666348, 0.7121685, -1.274094, 0, 0, 0, 1, 1,
-0.09554517, 1.417019, -0.298573, 0, 0, 0, 1, 1,
-0.09388571, -0.1320684, -1.429685, 0, 0, 0, 1, 1,
-0.09166283, -0.7308218, -3.375958, 0, 0, 0, 1, 1,
-0.09137391, -0.3701015, -3.911432, 0, 0, 0, 1, 1,
-0.0911843, -0.4663422, -1.872025, 0, 0, 0, 1, 1,
-0.08744943, -1.082201, -2.988903, 1, 1, 1, 1, 1,
-0.08131632, 0.5817577, -0.3531203, 1, 1, 1, 1, 1,
-0.08051474, 0.6116996, 1.376181, 1, 1, 1, 1, 1,
-0.07596644, -0.7145268, -3.693859, 1, 1, 1, 1, 1,
-0.0735601, 0.7566593, -1.206223, 1, 1, 1, 1, 1,
-0.07220498, 0.2139561, 0.2662746, 1, 1, 1, 1, 1,
-0.0697151, 0.4718563, 1.159707, 1, 1, 1, 1, 1,
-0.06678157, -0.3337027, -1.950256, 1, 1, 1, 1, 1,
-0.06393688, 0.6463746, 0.1582739, 1, 1, 1, 1, 1,
-0.06259145, 1.42263, 0.1417007, 1, 1, 1, 1, 1,
-0.06238973, -0.8835552, -2.919971, 1, 1, 1, 1, 1,
-0.06170974, 1.095598, -1.236921, 1, 1, 1, 1, 1,
-0.05898702, 0.290235, -1.824836, 1, 1, 1, 1, 1,
-0.05607993, 0.5588416, 0.3841876, 1, 1, 1, 1, 1,
-0.05219444, 0.2219902, 0.4550276, 1, 1, 1, 1, 1,
-0.05107808, 0.2742568, 0.5994918, 0, 0, 1, 1, 1,
-0.05039319, -0.3532131, -2.600887, 1, 0, 0, 1, 1,
-0.05035893, -0.1507418, -1.955564, 1, 0, 0, 1, 1,
-0.04631515, 1.164519, 1.010829, 1, 0, 0, 1, 1,
-0.0434737, 0.3673758, 1.168233, 1, 0, 0, 1, 1,
-0.04323214, -0.2363119, -2.504238, 1, 0, 0, 1, 1,
-0.03867371, 0.6747735, 0.2027221, 0, 0, 0, 1, 1,
-0.03738261, -0.6193587, -2.352965, 0, 0, 0, 1, 1,
-0.03558742, 0.1194077, -0.2448674, 0, 0, 0, 1, 1,
-0.03513227, 0.1231, -1.249217, 0, 0, 0, 1, 1,
-0.03478661, -0.2840649, -3.087616, 0, 0, 0, 1, 1,
-0.03076094, 0.3042748, 0.9341393, 0, 0, 0, 1, 1,
-0.02438079, -0.5877857, -3.05902, 0, 0, 0, 1, 1,
-0.01651291, 0.7658897, -2.797257, 1, 1, 1, 1, 1,
-0.01313794, -1.484114, -3.622354, 1, 1, 1, 1, 1,
-0.01210325, 0.5508662, -1.469932, 1, 1, 1, 1, 1,
-0.01007918, 0.8602215, 0.3555607, 1, 1, 1, 1, 1,
-0.006693896, 0.4898047, 0.01177684, 1, 1, 1, 1, 1,
-0.006280635, 1.320338, 0.6753579, 1, 1, 1, 1, 1,
-0.005678486, 0.991644, -0.4015348, 1, 1, 1, 1, 1,
-0.003951237, -0.95664, -2.845526, 1, 1, 1, 1, 1,
0.001508738, 0.6857043, 1.069754, 1, 1, 1, 1, 1,
0.001954457, -0.1926254, 3.202354, 1, 1, 1, 1, 1,
0.004373811, 0.8009183, 0.1482594, 1, 1, 1, 1, 1,
0.008141949, 0.265334, 1.957358, 1, 1, 1, 1, 1,
0.008719872, 0.6731095, 0.2981092, 1, 1, 1, 1, 1,
0.01360571, -1.940979, 5.133162, 1, 1, 1, 1, 1,
0.01361073, 0.7460058, 1.556219, 1, 1, 1, 1, 1,
0.01678877, 2.01547, 2.068478, 0, 0, 1, 1, 1,
0.01784152, 1.37695, -0.7496104, 1, 0, 0, 1, 1,
0.02644648, -0.8821123, 4.28915, 1, 0, 0, 1, 1,
0.03260932, 0.8044882, -0.2854356, 1, 0, 0, 1, 1,
0.03430308, 1.455685, -0.3590209, 1, 0, 0, 1, 1,
0.03506366, -1.477085, 2.659928, 1, 0, 0, 1, 1,
0.03675737, -0.1149706, 3.177399, 0, 0, 0, 1, 1,
0.03719921, 0.8770151, -0.1570345, 0, 0, 0, 1, 1,
0.04276166, -0.5311517, 4.376972, 0, 0, 0, 1, 1,
0.04413063, -0.5087835, 3.132829, 0, 0, 0, 1, 1,
0.04420144, -0.4871744, 2.062999, 0, 0, 0, 1, 1,
0.04549573, 0.9447643, -0.329715, 0, 0, 0, 1, 1,
0.04813088, 0.4534807, -0.01541526, 0, 0, 0, 1, 1,
0.05482202, -1.851767, 1.827538, 1, 1, 1, 1, 1,
0.05588359, 0.1242904, 0.9673885, 1, 1, 1, 1, 1,
0.05721184, -0.9974163, 3.107338, 1, 1, 1, 1, 1,
0.06858114, 1.455502, 0.2786672, 1, 1, 1, 1, 1,
0.07064345, -0.7580947, 1.617557, 1, 1, 1, 1, 1,
0.07644638, 1.096607, 1.263551, 1, 1, 1, 1, 1,
0.07680573, 0.03940191, 0.9689987, 1, 1, 1, 1, 1,
0.07957792, -1.311985, 2.291065, 1, 1, 1, 1, 1,
0.08110307, -0.4501501, 3.10008, 1, 1, 1, 1, 1,
0.08406552, -0.4863398, 3.211285, 1, 1, 1, 1, 1,
0.08410689, 0.3215953, -0.3780368, 1, 1, 1, 1, 1,
0.08628937, 0.9055635, -0.01116506, 1, 1, 1, 1, 1,
0.08646239, -1.390407, 1.881048, 1, 1, 1, 1, 1,
0.09232838, -0.6980226, 1.453636, 1, 1, 1, 1, 1,
0.09347112, 0.1444742, 2.03105, 1, 1, 1, 1, 1,
0.1046783, 0.1606893, 0.237236, 0, 0, 1, 1, 1,
0.1070732, 1.445574, 0.9097248, 1, 0, 0, 1, 1,
0.1089403, -1.35926, 3.184496, 1, 0, 0, 1, 1,
0.1092277, 0.8533401, 1.558302, 1, 0, 0, 1, 1,
0.1159135, -1.389895, 2.998513, 1, 0, 0, 1, 1,
0.1207634, -0.7436401, 3.119765, 1, 0, 0, 1, 1,
0.1258305, -0.8234907, 3.325644, 0, 0, 0, 1, 1,
0.1259354, -1.800062, 4.325572, 0, 0, 0, 1, 1,
0.1273183, 0.5939336, 0.7119738, 0, 0, 0, 1, 1,
0.1281524, 2.658289, 0.4300956, 0, 0, 0, 1, 1,
0.1311103, -1.284631, 3.247881, 0, 0, 0, 1, 1,
0.1322536, 0.02960183, 2.658782, 0, 0, 0, 1, 1,
0.1370286, 0.321804, 0.2713824, 0, 0, 0, 1, 1,
0.1400109, 1.990126, 1.803786, 1, 1, 1, 1, 1,
0.1485608, 2.320577, 1.223715, 1, 1, 1, 1, 1,
0.1510133, 0.4317138, 0.4977656, 1, 1, 1, 1, 1,
0.1624645, -0.7352929, 4.284503, 1, 1, 1, 1, 1,
0.1657967, -0.2272307, 3.565004, 1, 1, 1, 1, 1,
0.1685873, -0.5203623, 3.743202, 1, 1, 1, 1, 1,
0.1748128, -0.9783638, 3.568535, 1, 1, 1, 1, 1,
0.1764638, -0.5481125, 3.345236, 1, 1, 1, 1, 1,
0.1804683, -0.4473355, 1.990487, 1, 1, 1, 1, 1,
0.1855199, 1.03497, 1.373656, 1, 1, 1, 1, 1,
0.1882676, 0.2085401, 0.04145024, 1, 1, 1, 1, 1,
0.1887072, 0.2083035, 3.653859, 1, 1, 1, 1, 1,
0.1888423, -1.01546, 2.240622, 1, 1, 1, 1, 1,
0.1943014, -0.9808363, 3.318841, 1, 1, 1, 1, 1,
0.1946313, 1.502156, 0.545226, 1, 1, 1, 1, 1,
0.19623, 0.3151903, -0.2553278, 0, 0, 1, 1, 1,
0.2003797, -1.495288, 5.705075, 1, 0, 0, 1, 1,
0.2011846, 0.2631432, -1.257456, 1, 0, 0, 1, 1,
0.2011943, -0.829962, 2.35495, 1, 0, 0, 1, 1,
0.201437, 2.476482, -0.1429478, 1, 0, 0, 1, 1,
0.2029199, -0.1452936, 1.28926, 1, 0, 0, 1, 1,
0.2098982, 0.2543888, 1.343498, 0, 0, 0, 1, 1,
0.2122256, -0.269392, 2.491931, 0, 0, 0, 1, 1,
0.2137604, -0.0604981, 1.500638, 0, 0, 0, 1, 1,
0.2157554, -0.8413512, 3.373263, 0, 0, 0, 1, 1,
0.219427, -0.5843283, 0.5923264, 0, 0, 0, 1, 1,
0.2204877, -0.5416786, 1.113811, 0, 0, 0, 1, 1,
0.228638, 1.131973, 1.322412, 0, 0, 0, 1, 1,
0.2291034, -0.866106, 2.98956, 1, 1, 1, 1, 1,
0.2311465, 2.005465, 1.273735, 1, 1, 1, 1, 1,
0.2314513, 1.747261, -0.8542867, 1, 1, 1, 1, 1,
0.2316042, -0.08268671, 3.463977, 1, 1, 1, 1, 1,
0.2328431, -0.9046139, 3.607267, 1, 1, 1, 1, 1,
0.235251, -0.5521863, 1.643851, 1, 1, 1, 1, 1,
0.237505, 1.145982, 1.01182, 1, 1, 1, 1, 1,
0.2388193, -0.3208937, 1.461842, 1, 1, 1, 1, 1,
0.2390573, 1.103466, 0.372233, 1, 1, 1, 1, 1,
0.2399136, 0.01535343, 0.01985649, 1, 1, 1, 1, 1,
0.2404141, -0.2901019, 1.202313, 1, 1, 1, 1, 1,
0.2438659, -0.7827398, 2.474183, 1, 1, 1, 1, 1,
0.2439755, 0.3551927, 0.5805665, 1, 1, 1, 1, 1,
0.2452233, 0.7630896, 0.5669283, 1, 1, 1, 1, 1,
0.2470164, 1.476072, 0.3893291, 1, 1, 1, 1, 1,
0.2478617, 0.3486884, 2.035623, 0, 0, 1, 1, 1,
0.2487504, -0.4342563, 2.621832, 1, 0, 0, 1, 1,
0.2518131, -2.628759, 2.284005, 1, 0, 0, 1, 1,
0.2534968, -1.422149, 4.029544, 1, 0, 0, 1, 1,
0.2545024, 0.7234612, 1.807095, 1, 0, 0, 1, 1,
0.2562594, -0.450936, 1.539838, 1, 0, 0, 1, 1,
0.2601849, 1.372313, 0.9199355, 0, 0, 0, 1, 1,
0.2620123, -0.3840698, 0.8736987, 0, 0, 0, 1, 1,
0.2636586, 0.02968186, 2.037606, 0, 0, 0, 1, 1,
0.2705899, -1.890828, 2.69349, 0, 0, 0, 1, 1,
0.2732376, -0.4468755, 4.670063, 0, 0, 0, 1, 1,
0.2741052, -1.104702, 3.702124, 0, 0, 0, 1, 1,
0.276893, -1.693212, 2.643819, 0, 0, 0, 1, 1,
0.2850059, 0.6621064, -0.8828793, 1, 1, 1, 1, 1,
0.2858539, -1.346221, 1.730551, 1, 1, 1, 1, 1,
0.2859872, -0.4366586, 0.87003, 1, 1, 1, 1, 1,
0.2905918, -0.7830417, 4.154239, 1, 1, 1, 1, 1,
0.2975362, -0.5129262, 1.557171, 1, 1, 1, 1, 1,
0.3039171, 1.58723, 0.4869755, 1, 1, 1, 1, 1,
0.3140752, -2.340858, 4.071627, 1, 1, 1, 1, 1,
0.3159072, -0.07017478, 1.339483, 1, 1, 1, 1, 1,
0.3177253, 1.67261, 2.332475, 1, 1, 1, 1, 1,
0.3196506, 0.3560327, 1.025323, 1, 1, 1, 1, 1,
0.3218912, 0.174874, 0.1305801, 1, 1, 1, 1, 1,
0.3229531, 1.113397, 0.4115594, 1, 1, 1, 1, 1,
0.3257981, -0.9382398, 3.296343, 1, 1, 1, 1, 1,
0.3274312, -0.9338062, 2.080408, 1, 1, 1, 1, 1,
0.3306918, -0.9419307, 2.667363, 1, 1, 1, 1, 1,
0.3318499, -0.54489, 3.898495, 0, 0, 1, 1, 1,
0.3376015, 0.7524683, 0.8333063, 1, 0, 0, 1, 1,
0.340522, 1.111188, 1.671177, 1, 0, 0, 1, 1,
0.340899, 1.878362, -0.04970165, 1, 0, 0, 1, 1,
0.3422822, -0.9048467, 0.7252445, 1, 0, 0, 1, 1,
0.3442152, 1.742906, -0.5441753, 1, 0, 0, 1, 1,
0.3489639, 0.2729358, 0.7782819, 0, 0, 0, 1, 1,
0.3514306, 0.5232219, 1.299081, 0, 0, 0, 1, 1,
0.353029, -0.9023902, 4.425486, 0, 0, 0, 1, 1,
0.3534328, -0.3409809, 1.063338, 0, 0, 0, 1, 1,
0.355142, -0.4439256, 3.397191, 0, 0, 0, 1, 1,
0.3552465, -0.7315857, 2.560186, 0, 0, 0, 1, 1,
0.3628247, 1.167049, -0.5854397, 0, 0, 0, 1, 1,
0.3643765, 0.7920485, 0.7164401, 1, 1, 1, 1, 1,
0.3647127, -1.958505, 5.478766, 1, 1, 1, 1, 1,
0.3656274, 1.084082, -0.9193121, 1, 1, 1, 1, 1,
0.3714607, 0.6845665, 0.07468996, 1, 1, 1, 1, 1,
0.3752675, -1.007917, 4.450286, 1, 1, 1, 1, 1,
0.3757843, 1.749496, -0.03359142, 1, 1, 1, 1, 1,
0.3793446, 0.3815356, -0.4783579, 1, 1, 1, 1, 1,
0.3852617, -0.7714382, 3.364785, 1, 1, 1, 1, 1,
0.3926022, 0.2904723, -0.8063989, 1, 1, 1, 1, 1,
0.3932225, -0.5810948, 3.749078, 1, 1, 1, 1, 1,
0.3992391, 0.8694451, 1.195017, 1, 1, 1, 1, 1,
0.3999596, -0.9390612, 3.675729, 1, 1, 1, 1, 1,
0.4011085, 0.8014861, -0.1280617, 1, 1, 1, 1, 1,
0.4045008, 0.017905, 2.382998, 1, 1, 1, 1, 1,
0.4109624, 0.1209778, 1.795537, 1, 1, 1, 1, 1,
0.4120874, 0.2352106, 2.07497, 0, 0, 1, 1, 1,
0.4155616, -0.6239644, 1.424614, 1, 0, 0, 1, 1,
0.4170159, 1.382524, 1.255418, 1, 0, 0, 1, 1,
0.422924, 0.3692709, 0.3955829, 1, 0, 0, 1, 1,
0.4249353, 0.445532, 0.6599571, 1, 0, 0, 1, 1,
0.4257862, 0.09550632, 0.2521019, 1, 0, 0, 1, 1,
0.4276943, 0.5133098, 0.08254589, 0, 0, 0, 1, 1,
0.4282217, 0.1499431, -1.098868, 0, 0, 0, 1, 1,
0.4308586, -0.7086296, 2.068571, 0, 0, 0, 1, 1,
0.4398829, 0.7840123, 0.5708535, 0, 0, 0, 1, 1,
0.4408135, -0.1898801, 2.777117, 0, 0, 0, 1, 1,
0.4409098, 0.6651266, 1.259369, 0, 0, 0, 1, 1,
0.4453837, 0.4598078, 1.305542, 0, 0, 0, 1, 1,
0.4495319, 2.128367, -0.6551728, 1, 1, 1, 1, 1,
0.4563003, -0.2743371, 2.318475, 1, 1, 1, 1, 1,
0.460202, 1.150708, -0.7235625, 1, 1, 1, 1, 1,
0.4696898, -0.2027471, 1.672485, 1, 1, 1, 1, 1,
0.4702035, 0.5973907, 0.635225, 1, 1, 1, 1, 1,
0.4757461, -0.5401518, 2.717219, 1, 1, 1, 1, 1,
0.4800264, 1.48595, -0.5145675, 1, 1, 1, 1, 1,
0.4802146, 1.518779, 0.599665, 1, 1, 1, 1, 1,
0.4805991, 0.253302, 0.5376126, 1, 1, 1, 1, 1,
0.4813874, -1.084575, 1.520526, 1, 1, 1, 1, 1,
0.486995, 0.1777382, 1.43828, 1, 1, 1, 1, 1,
0.4896856, 0.2365087, 2.054193, 1, 1, 1, 1, 1,
0.5023845, 0.1925223, 0.2384606, 1, 1, 1, 1, 1,
0.5030515, -1.744895, 3.420576, 1, 1, 1, 1, 1,
0.5036373, 0.9412214, -0.6527648, 1, 1, 1, 1, 1,
0.5052036, -0.7956168, 4.121874, 0, 0, 1, 1, 1,
0.5072801, -0.3420469, 1.761076, 1, 0, 0, 1, 1,
0.5106581, -0.2563537, 1.604038, 1, 0, 0, 1, 1,
0.5120733, -0.0803207, 2.399395, 1, 0, 0, 1, 1,
0.516458, -0.120613, 3.797362, 1, 0, 0, 1, 1,
0.5168122, 1.510025, 0.9524347, 1, 0, 0, 1, 1,
0.5223413, -0.4492485, 1.381276, 0, 0, 0, 1, 1,
0.5253901, -1.721373, 3.667428, 0, 0, 0, 1, 1,
0.525403, 0.7910288, 0.9789535, 0, 0, 0, 1, 1,
0.5279906, 0.1702181, -0.03857097, 0, 0, 0, 1, 1,
0.5292883, 0.08841064, 1.536393, 0, 0, 0, 1, 1,
0.5363634, -1.372281, 2.543036, 0, 0, 0, 1, 1,
0.5364818, 0.1068596, 2.481143, 0, 0, 0, 1, 1,
0.5380185, -0.1700599, 0.9725856, 1, 1, 1, 1, 1,
0.5402386, 0.2815371, 2.049781, 1, 1, 1, 1, 1,
0.5432792, -0.1680781, 2.611181, 1, 1, 1, 1, 1,
0.544112, 0.03492225, 1.107011, 1, 1, 1, 1, 1,
0.5455083, 0.2185524, 0.7217968, 1, 1, 1, 1, 1,
0.5519879, 0.6875656, -0.2744821, 1, 1, 1, 1, 1,
0.5537036, -0.1448467, -0.001351054, 1, 1, 1, 1, 1,
0.5598904, -0.4890716, 1.100108, 1, 1, 1, 1, 1,
0.5607061, 0.09855731, 0.8910122, 1, 1, 1, 1, 1,
0.5714833, -1.458198, 4.388565, 1, 1, 1, 1, 1,
0.5742965, -0.1350295, 1.328339, 1, 1, 1, 1, 1,
0.5770984, -0.9007645, 3.831455, 1, 1, 1, 1, 1,
0.5796886, -0.07866845, 0.321152, 1, 1, 1, 1, 1,
0.5858514, 0.2885992, 2.046532, 1, 1, 1, 1, 1,
0.59682, -1.210581, 1.827749, 1, 1, 1, 1, 1,
0.5993564, -0.171967, -0.008040828, 0, 0, 1, 1, 1,
0.6034233, 1.630193, -1.017084, 1, 0, 0, 1, 1,
0.6088936, 0.6860815, 0.837347, 1, 0, 0, 1, 1,
0.6118505, -0.8372005, 2.37478, 1, 0, 0, 1, 1,
0.6134932, -0.9882296, 2.556378, 1, 0, 0, 1, 1,
0.6139826, 0.8252054, 1.508122, 1, 0, 0, 1, 1,
0.6218575, -0.5114803, 1.454115, 0, 0, 0, 1, 1,
0.6266381, -1.233443, 3.423286, 0, 0, 0, 1, 1,
0.6296524, 0.3032793, 1.659688, 0, 0, 0, 1, 1,
0.6364712, -0.4793262, 1.781037, 0, 0, 0, 1, 1,
0.6403056, -1.257737, 3.014852, 0, 0, 0, 1, 1,
0.6414515, 0.5249406, 0.1570841, 0, 0, 0, 1, 1,
0.6463094, 0.8023886, 0.06720789, 0, 0, 0, 1, 1,
0.6474651, 2.026094, -0.2311119, 1, 1, 1, 1, 1,
0.6493095, 2.067368, 1.662737, 1, 1, 1, 1, 1,
0.6516096, -2.673892, 3.277864, 1, 1, 1, 1, 1,
0.654696, -1.4708, 2.303607, 1, 1, 1, 1, 1,
0.6588852, 0.3013718, 2.04566, 1, 1, 1, 1, 1,
0.6613815, 0.5333168, 0.8833984, 1, 1, 1, 1, 1,
0.6652594, 2.471122, 0.1140365, 1, 1, 1, 1, 1,
0.6716417, 0.9804733, -0.5051141, 1, 1, 1, 1, 1,
0.6755027, 0.4253575, 0.4634851, 1, 1, 1, 1, 1,
0.6816984, -0.5697535, 2.88663, 1, 1, 1, 1, 1,
0.6825117, 1.192026, 0.1656965, 1, 1, 1, 1, 1,
0.684922, 0.8618479, -0.6294593, 1, 1, 1, 1, 1,
0.6852264, -0.1011151, 1.387832, 1, 1, 1, 1, 1,
0.6866952, -0.6602356, 2.84512, 1, 1, 1, 1, 1,
0.6881236, 0.7013845, 0.2621213, 1, 1, 1, 1, 1,
0.6911161, 0.1944579, 3.362739, 0, 0, 1, 1, 1,
0.6955225, 0.2442996, 1.038174, 1, 0, 0, 1, 1,
0.6965993, 0.9919704, 1.477973, 1, 0, 0, 1, 1,
0.6966947, 0.03630568, -1.102496, 1, 0, 0, 1, 1,
0.6968514, -0.8238772, 3.573673, 1, 0, 0, 1, 1,
0.7024434, 0.08648854, 2.108716, 1, 0, 0, 1, 1,
0.7092265, -0.9038389, 2.976154, 0, 0, 0, 1, 1,
0.713761, -1.373176, 2.144208, 0, 0, 0, 1, 1,
0.7172969, 0.5849845, -2.344337, 0, 0, 0, 1, 1,
0.7197831, -0.5674737, 0.7640551, 0, 0, 0, 1, 1,
0.7248712, -0.8028379, 2.272069, 0, 0, 0, 1, 1,
0.7257972, 0.288443, -0.4832975, 0, 0, 0, 1, 1,
0.7343215, -0.2178182, 2.249732, 0, 0, 0, 1, 1,
0.7357953, -0.004882939, 0.9213768, 1, 1, 1, 1, 1,
0.7389207, 1.583232, 0.3604674, 1, 1, 1, 1, 1,
0.7390554, -0.3620948, 0.4188264, 1, 1, 1, 1, 1,
0.7465501, -1.280999, 1.964547, 1, 1, 1, 1, 1,
0.7470113, 0.07549453, 1.736095, 1, 1, 1, 1, 1,
0.7481159, -0.2646396, 1.937897, 1, 1, 1, 1, 1,
0.7512869, -1.550944, 3.651191, 1, 1, 1, 1, 1,
0.7550264, -0.2596343, 3.702895, 1, 1, 1, 1, 1,
0.75832, -0.5792318, 1.899957, 1, 1, 1, 1, 1,
0.7586761, -1.466053, 1.105518, 1, 1, 1, 1, 1,
0.7592008, 0.5280151, 1.029361, 1, 1, 1, 1, 1,
0.7621772, 0.3030964, 3.467712, 1, 1, 1, 1, 1,
0.7624819, -0.4701797, 2.264274, 1, 1, 1, 1, 1,
0.7677259, 1.657491, -0.2862581, 1, 1, 1, 1, 1,
0.770576, 1.987117, -0.1684957, 1, 1, 1, 1, 1,
0.7756737, 0.3235205, 0.446961, 0, 0, 1, 1, 1,
0.777133, 0.543183, 2.529634, 1, 0, 0, 1, 1,
0.7829856, -2.896015, 2.188986, 1, 0, 0, 1, 1,
0.7875454, 0.2295828, 2.277462, 1, 0, 0, 1, 1,
0.7909731, -0.5137552, 1.920991, 1, 0, 0, 1, 1,
0.792509, -0.1502916, 2.65794, 1, 0, 0, 1, 1,
0.7932792, 0.4454625, 0.6689918, 0, 0, 0, 1, 1,
0.7933331, -0.990986, 0.6718296, 0, 0, 0, 1, 1,
0.7940892, -0.912465, 1.475395, 0, 0, 0, 1, 1,
0.7947812, 0.2758124, 1.278104, 0, 0, 0, 1, 1,
0.7959837, 0.08145238, 1.544431, 0, 0, 0, 1, 1,
0.8024247, -0.8262706, 2.875497, 0, 0, 0, 1, 1,
0.8055009, -1.039419, 3.150694, 0, 0, 0, 1, 1,
0.8056182, 1.069921, 2.491921, 1, 1, 1, 1, 1,
0.8067098, -0.2812574, 0.6117628, 1, 1, 1, 1, 1,
0.8072451, 0.5357959, 1.749019, 1, 1, 1, 1, 1,
0.8075843, 1.577362, 1.387023, 1, 1, 1, 1, 1,
0.8081735, 2.518627, 2.109453, 1, 1, 1, 1, 1,
0.8113283, 0.528308, 0.9443272, 1, 1, 1, 1, 1,
0.8142298, 0.3039005, 1.914185, 1, 1, 1, 1, 1,
0.8144085, 0.02198144, 0.7931969, 1, 1, 1, 1, 1,
0.8159118, -0.3180853, 2.713964, 1, 1, 1, 1, 1,
0.8221208, -0.2657171, 1.562228, 1, 1, 1, 1, 1,
0.8264015, -2.146018, 1.239484, 1, 1, 1, 1, 1,
0.8289911, 0.7503031, 2.337944, 1, 1, 1, 1, 1,
0.8297406, 1.336989, -0.3795929, 1, 1, 1, 1, 1,
0.8318709, 0.3418285, 2.37325, 1, 1, 1, 1, 1,
0.8344672, -1.139316, 2.828393, 1, 1, 1, 1, 1,
0.8400007, -0.2642383, 2.241791, 0, 0, 1, 1, 1,
0.8410856, 0.5920187, 0.9033811, 1, 0, 0, 1, 1,
0.8433579, -0.7506877, 4.091328, 1, 0, 0, 1, 1,
0.8460346, 0.7095966, 0.4817891, 1, 0, 0, 1, 1,
0.8465946, -0.2202593, 1.122563, 1, 0, 0, 1, 1,
0.8476705, -0.3983536, 2.537359, 1, 0, 0, 1, 1,
0.8485106, -0.1832568, 1.97963, 0, 0, 0, 1, 1,
0.8492112, -1.12754, 1.891621, 0, 0, 0, 1, 1,
0.8538646, -0.2402794, 2.298614, 0, 0, 0, 1, 1,
0.8699917, -0.5270733, 2.022267, 0, 0, 0, 1, 1,
0.8711235, -1.913769, 1.536569, 0, 0, 0, 1, 1,
0.873363, 1.378217, -0.2012662, 0, 0, 0, 1, 1,
0.879541, -0.61014, 1.815158, 0, 0, 0, 1, 1,
0.8902004, -0.1303543, 1.32697, 1, 1, 1, 1, 1,
0.891356, -0.9488151, 3.144563, 1, 1, 1, 1, 1,
0.8917443, -0.7410703, 2.508068, 1, 1, 1, 1, 1,
0.8948181, 0.5161772, 0.8544518, 1, 1, 1, 1, 1,
0.90231, 0.2854231, 1.092081, 1, 1, 1, 1, 1,
0.9232782, -0.9465119, 1.299671, 1, 1, 1, 1, 1,
0.9238443, 0.8809258, 0.6847805, 1, 1, 1, 1, 1,
0.930304, -0.7608003, 2.057832, 1, 1, 1, 1, 1,
0.9334102, -0.5368353, 0.8701566, 1, 1, 1, 1, 1,
0.9346215, -2.088024, 3.373534, 1, 1, 1, 1, 1,
0.9371358, 0.9508079, 2.730593, 1, 1, 1, 1, 1,
0.9386181, 3.51371, -0.8685814, 1, 1, 1, 1, 1,
0.9395713, 0.2131124, 0.1063275, 1, 1, 1, 1, 1,
0.9456593, -0.99779, 2.936434, 1, 1, 1, 1, 1,
0.95603, -0.9218923, 2.853112, 1, 1, 1, 1, 1,
0.9582281, 1.166763, 0.2802007, 0, 0, 1, 1, 1,
0.9586294, 0.631126, 1.091794, 1, 0, 0, 1, 1,
0.966125, 1.304592, 1.605188, 1, 0, 0, 1, 1,
0.9672789, -0.6110337, 1.164192, 1, 0, 0, 1, 1,
0.9687092, -0.09798972, 0.7888072, 1, 0, 0, 1, 1,
0.9689167, 0.7575133, 0.8962618, 1, 0, 0, 1, 1,
0.9703513, 1.331155, 0.5175304, 0, 0, 0, 1, 1,
0.9722373, 0.1992854, 1.465455, 0, 0, 0, 1, 1,
0.9818134, 0.9685531, 0.7615687, 0, 0, 0, 1, 1,
0.9823178, 0.3126915, 3.476923, 0, 0, 0, 1, 1,
0.9837104, 0.510043, 0.8199608, 0, 0, 0, 1, 1,
0.9858027, -0.4218017, 1.689298, 0, 0, 0, 1, 1,
0.9891091, -0.7994521, 1.59417, 0, 0, 0, 1, 1,
0.9964884, 2.625468, 0.9708374, 1, 1, 1, 1, 1,
1.000974, -0.3022889, 2.898836, 1, 1, 1, 1, 1,
1.006104, -0.4137119, 2.467684, 1, 1, 1, 1, 1,
1.00619, -0.4329678, 2.091433, 1, 1, 1, 1, 1,
1.014892, 0.569465, 1.142444, 1, 1, 1, 1, 1,
1.022577, -0.02307514, 3.373346, 1, 1, 1, 1, 1,
1.023063, 0.3746282, 0.2211552, 1, 1, 1, 1, 1,
1.023357, 0.2030987, 2.418327, 1, 1, 1, 1, 1,
1.027375, -1.680118, 0.6363603, 1, 1, 1, 1, 1,
1.027661, -0.7546862, -0.8954177, 1, 1, 1, 1, 1,
1.037402, 0.5482873, -0.546313, 1, 1, 1, 1, 1,
1.039639, 0.03368415, 2.4201, 1, 1, 1, 1, 1,
1.042053, 1.596097, -0.05696264, 1, 1, 1, 1, 1,
1.04437, -2.359746, 3.090836, 1, 1, 1, 1, 1,
1.053756, 1.109326, 0.1608362, 1, 1, 1, 1, 1,
1.054525, 1.04009, 1.522255, 0, 0, 1, 1, 1,
1.0546, -0.4888275, 0.2449877, 1, 0, 0, 1, 1,
1.055506, -1.517101, 1.78835, 1, 0, 0, 1, 1,
1.057326, 0.1590963, 0.5786338, 1, 0, 0, 1, 1,
1.068723, 0.9036807, 1.325424, 1, 0, 0, 1, 1,
1.06973, -0.5536724, 1.062998, 1, 0, 0, 1, 1,
1.086164, -1.523011, 3.734148, 0, 0, 0, 1, 1,
1.091725, 0.64312, 0.01548172, 0, 0, 0, 1, 1,
1.096302, 1.600017, -0.3213355, 0, 0, 0, 1, 1,
1.09666, -0.1734793, 2.094336, 0, 0, 0, 1, 1,
1.103354, -0.4868042, 2.029982, 0, 0, 0, 1, 1,
1.107814, 0.579426, 1.496735, 0, 0, 0, 1, 1,
1.110215, -0.7275031, 1.829071, 0, 0, 0, 1, 1,
1.128551, -1.160888, 1.838917, 1, 1, 1, 1, 1,
1.146411, -0.8597287, 0.9091203, 1, 1, 1, 1, 1,
1.15198, 1.73217, 0.9692796, 1, 1, 1, 1, 1,
1.153691, -1.029429, 2.205117, 1, 1, 1, 1, 1,
1.156418, -0.03246127, 1.669623, 1, 1, 1, 1, 1,
1.156662, -2.208953, 1.792098, 1, 1, 1, 1, 1,
1.162352, -1.094218, 0.2503822, 1, 1, 1, 1, 1,
1.16246, -0.2465359, 3.267888, 1, 1, 1, 1, 1,
1.163814, -0.534322, 0.6495342, 1, 1, 1, 1, 1,
1.17326, 1.293707, -0.9360908, 1, 1, 1, 1, 1,
1.176971, -0.3468622, 2.858586, 1, 1, 1, 1, 1,
1.177381, 0.1824682, 2.663343, 1, 1, 1, 1, 1,
1.186964, 0.5375351, 0.2763328, 1, 1, 1, 1, 1,
1.188144, 1.99253, 1.170933, 1, 1, 1, 1, 1,
1.198455, -0.6235962, 3.163906, 1, 1, 1, 1, 1,
1.19932, -0.4200507, 1.536762, 0, 0, 1, 1, 1,
1.203529, 0.5659948, 1.184543, 1, 0, 0, 1, 1,
1.213113, 0.09307244, 0.1715648, 1, 0, 0, 1, 1,
1.222012, 0.3545981, 0.2518239, 1, 0, 0, 1, 1,
1.232597, -0.2112027, 0.9239216, 1, 0, 0, 1, 1,
1.235871, -0.5317109, 0.925158, 1, 0, 0, 1, 1,
1.245898, 0.04446569, 2.64715, 0, 0, 0, 1, 1,
1.253142, -1.120178, 2.176522, 0, 0, 0, 1, 1,
1.259968, -0.9649185, 1.391861, 0, 0, 0, 1, 1,
1.276265, 0.8848102, 1.977855, 0, 0, 0, 1, 1,
1.278906, -0.03789341, 0.663031, 0, 0, 0, 1, 1,
1.284228, -0.3074559, 2.330062, 0, 0, 0, 1, 1,
1.28475, 0.6918056, 0.006866134, 0, 0, 0, 1, 1,
1.289449, 2.052202, 0.4562193, 1, 1, 1, 1, 1,
1.317903, 0.2620443, 0.9326622, 1, 1, 1, 1, 1,
1.318651, 1.145438, 3.340073, 1, 1, 1, 1, 1,
1.324165, 0.2721758, 1.609005, 1, 1, 1, 1, 1,
1.324255, -0.34052, 1.508513, 1, 1, 1, 1, 1,
1.328564, -1.520223, 1.635096, 1, 1, 1, 1, 1,
1.333478, 0.2154815, 1.78792, 1, 1, 1, 1, 1,
1.334036, -1.131245, 1.913557, 1, 1, 1, 1, 1,
1.342056, -2.013347, 2.682591, 1, 1, 1, 1, 1,
1.353962, 0.6148744, 1.084484, 1, 1, 1, 1, 1,
1.369078, 0.09691305, 0.1366708, 1, 1, 1, 1, 1,
1.381388, 2.471824, 0.4753889, 1, 1, 1, 1, 1,
1.390327, -0.6717554, 1.472964, 1, 1, 1, 1, 1,
1.399006, -0.9604694, 1.141827, 1, 1, 1, 1, 1,
1.40387, 1.063575, 0.6336461, 1, 1, 1, 1, 1,
1.41303, -0.1946376, 2.321605, 0, 0, 1, 1, 1,
1.417509, -0.6052015, 0.835899, 1, 0, 0, 1, 1,
1.418432, -1.433701, 2.106055, 1, 0, 0, 1, 1,
1.424261, -1.212938, 3.833624, 1, 0, 0, 1, 1,
1.424758, 0.8943836, -1.539773, 1, 0, 0, 1, 1,
1.424947, 0.5930413, -1.043628, 1, 0, 0, 1, 1,
1.436093, 1.101734, 0.1436438, 0, 0, 0, 1, 1,
1.436456, -0.3878334, 3.072225, 0, 0, 0, 1, 1,
1.4404, 0.1622348, 2.862283, 0, 0, 0, 1, 1,
1.445426, -0.1424862, 1.225173, 0, 0, 0, 1, 1,
1.456242, 0.8543037, 0.3544014, 0, 0, 0, 1, 1,
1.458, 0.8095687, 0.2424838, 0, 0, 0, 1, 1,
1.460194, -0.987625, 3.703057, 0, 0, 0, 1, 1,
1.470699, -1.182716, 2.749398, 1, 1, 1, 1, 1,
1.483462, 0.6389226, -0.6666412, 1, 1, 1, 1, 1,
1.490785, 1.09915, 1.823253, 1, 1, 1, 1, 1,
1.501306, 0.06853817, 2.57038, 1, 1, 1, 1, 1,
1.508823, -0.5729071, 0.4445387, 1, 1, 1, 1, 1,
1.52108, -0.2898961, 1.37761, 1, 1, 1, 1, 1,
1.529924, -0.435267, 1.980309, 1, 1, 1, 1, 1,
1.532843, 0.1260324, 1.549199, 1, 1, 1, 1, 1,
1.534031, -2.369332, 2.314969, 1, 1, 1, 1, 1,
1.543072, 0.8700304, 1.375974, 1, 1, 1, 1, 1,
1.546742, 0.3016436, 1.49177, 1, 1, 1, 1, 1,
1.551169, 1.107568, 1.488116, 1, 1, 1, 1, 1,
1.565844, 0.8347523, 1.160197, 1, 1, 1, 1, 1,
1.577793, 0.6633246, 1.219098, 1, 1, 1, 1, 1,
1.578902, -0.589057, 0.4178796, 1, 1, 1, 1, 1,
1.59565, -0.657431, 2.184853, 0, 0, 1, 1, 1,
1.599919, -1.079323, 2.854102, 1, 0, 0, 1, 1,
1.602748, 1.662636, 0.8392449, 1, 0, 0, 1, 1,
1.606415, 0.8451838, 1.330781, 1, 0, 0, 1, 1,
1.607079, -1.532211, 0.5186048, 1, 0, 0, 1, 1,
1.607715, 0.8707471, 1.065232, 1, 0, 0, 1, 1,
1.613945, 0.8627403, 0.6312438, 0, 0, 0, 1, 1,
1.615146, 2.505704, 0.7936763, 0, 0, 0, 1, 1,
1.623096, -1.763861, 2.558573, 0, 0, 0, 1, 1,
1.623343, -0.306997, 1.544712, 0, 0, 0, 1, 1,
1.640148, 1.31902, 2.169276, 0, 0, 0, 1, 1,
1.644219, -0.5585781, 1.236849, 0, 0, 0, 1, 1,
1.647232, -0.7666122, 2.551926, 0, 0, 0, 1, 1,
1.648304, -0.4605558, 0.4650715, 1, 1, 1, 1, 1,
1.650023, -0.1304812, 1.630254, 1, 1, 1, 1, 1,
1.656669, 0.8861054, 0.3437109, 1, 1, 1, 1, 1,
1.665711, -0.2013022, 0.6172954, 1, 1, 1, 1, 1,
1.666957, -0.5144532, 3.629351, 1, 1, 1, 1, 1,
1.667055, 1.339734, -0.4225972, 1, 1, 1, 1, 1,
1.675334, -2.454129, 2.327585, 1, 1, 1, 1, 1,
1.677924, 1.6923, 1.901484, 1, 1, 1, 1, 1,
1.681696, -0.0955956, 1.63239, 1, 1, 1, 1, 1,
1.685231, -0.247115, 0.7193186, 1, 1, 1, 1, 1,
1.696637, 2.153989, 2.630732, 1, 1, 1, 1, 1,
1.703512, 1.021874, 0.4426454, 1, 1, 1, 1, 1,
1.703729, -1.212235, 2.033327, 1, 1, 1, 1, 1,
1.716406, -0.2157213, 2.379972, 1, 1, 1, 1, 1,
1.722466, -1.189572, 1.565922, 1, 1, 1, 1, 1,
1.731875, 0.1020822, 0.932937, 0, 0, 1, 1, 1,
1.734755, 0.07504553, 1.97002, 1, 0, 0, 1, 1,
1.741309, -0.6905639, 1.989476, 1, 0, 0, 1, 1,
1.750728, 0.550953, 2.327172, 1, 0, 0, 1, 1,
1.753596, -0.3687187, 3.603991, 1, 0, 0, 1, 1,
1.765034, 0.6215344, 0.3008163, 1, 0, 0, 1, 1,
1.766791, -0.452585, 2.087568, 0, 0, 0, 1, 1,
1.766987, 0.2115746, -0.6907799, 0, 0, 0, 1, 1,
1.768065, 1.01274, 1.415132, 0, 0, 0, 1, 1,
1.773603, -0.05634922, 2.052088, 0, 0, 0, 1, 1,
1.781117, 0.8947594, 2.218683, 0, 0, 0, 1, 1,
1.819117, -0.459191, 1.542964, 0, 0, 0, 1, 1,
1.822061, 1.297198, 0.9169073, 0, 0, 0, 1, 1,
1.84446, -0.05763813, 1.401491, 1, 1, 1, 1, 1,
1.902854, -0.8400574, 2.971278, 1, 1, 1, 1, 1,
1.906845, 1.608374, 0.7481804, 1, 1, 1, 1, 1,
1.910404, -0.8158408, 0.9982714, 1, 1, 1, 1, 1,
1.921902, 0.5879565, 2.045993, 1, 1, 1, 1, 1,
1.929116, -0.006326061, 0.5264703, 1, 1, 1, 1, 1,
1.929393, -1.086603, 2.324994, 1, 1, 1, 1, 1,
1.953782, -0.2021034, 0.6252632, 1, 1, 1, 1, 1,
1.973749, 0.4969847, 0.7596066, 1, 1, 1, 1, 1,
1.983775, -1.898692, 1.800958, 1, 1, 1, 1, 1,
2.020584, 1.474111, -0.3458052, 1, 1, 1, 1, 1,
2.043406, 0.9082528, -1.020775, 1, 1, 1, 1, 1,
2.082312, -1.318138, 2.008156, 1, 1, 1, 1, 1,
2.153257, -0.5723927, -0.02989841, 1, 1, 1, 1, 1,
2.202296, 1.251583, 1.924021, 1, 1, 1, 1, 1,
2.232662, -1.635819, 2.268542, 0, 0, 1, 1, 1,
2.249699, -0.4554928, 0.6072636, 1, 0, 0, 1, 1,
2.251541, 0.8898211, 1.884533, 1, 0, 0, 1, 1,
2.279202, -0.0624486, 1.315281, 1, 0, 0, 1, 1,
2.289129, -0.4396006, 0.6442045, 1, 0, 0, 1, 1,
2.314343, -0.1886354, -0.04684454, 1, 0, 0, 1, 1,
2.338412, 0.568133, 2.830872, 0, 0, 0, 1, 1,
2.347377, -0.7485179, 2.038509, 0, 0, 0, 1, 1,
2.362256, -0.6850168, -0.1967634, 0, 0, 0, 1, 1,
2.406826, -0.7551908, 1.966436, 0, 0, 0, 1, 1,
2.419118, 1.482906, 0.04198327, 0, 0, 0, 1, 1,
2.463655, 0.5142519, 0.7306252, 0, 0, 0, 1, 1,
2.51196, 0.3690061, 0.4531269, 0, 0, 0, 1, 1,
2.593306, -1.125802, 2.571172, 1, 1, 1, 1, 1,
2.701896, 0.4230785, 0.8364458, 1, 1, 1, 1, 1,
2.772086, -0.5787088, 1.937549, 1, 1, 1, 1, 1,
2.787292, 0.8267047, 1.899603, 1, 1, 1, 1, 1,
3.202696, 1.253627, 0.8536398, 1, 1, 1, 1, 1,
3.295642, 0.3081412, 0.7714917, 1, 1, 1, 1, 1,
3.489407, 0.9922593, -0.4132229, 1, 1, 1, 1, 1
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
var radius = 9.603845;
var distance = 33.73309;
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
mvMatrix.translate( -0.08293986, -0.3088475, -0.4497976 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73309);
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
