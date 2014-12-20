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
-3.409342, -1.714535, -1.460835, 1, 0, 0, 1,
-2.98786, 0.2261866, -1.293777, 1, 0.007843138, 0, 1,
-2.886948, 0.1029972, -0.4349548, 1, 0.01176471, 0, 1,
-2.767658, -2.004781, -1.808118, 1, 0.01960784, 0, 1,
-2.733168, 0.1326779, -0.3595506, 1, 0.02352941, 0, 1,
-2.727777, 0.08453102, -4.519918, 1, 0.03137255, 0, 1,
-2.624834, 0.09969018, -2.568828, 1, 0.03529412, 0, 1,
-2.527885, -1.834393, -3.848119, 1, 0.04313726, 0, 1,
-2.360451, 1.153895, -1.131195, 1, 0.04705882, 0, 1,
-2.336252, -0.1412786, -1.263973, 1, 0.05490196, 0, 1,
-2.275495, -0.9449041, -2.254242, 1, 0.05882353, 0, 1,
-2.270441, 0.1261763, 0.7630187, 1, 0.06666667, 0, 1,
-2.247637, -1.362028, -1.73123, 1, 0.07058824, 0, 1,
-2.241997, -0.1771613, -0.7500708, 1, 0.07843138, 0, 1,
-2.21029, 0.5040215, -1.363284, 1, 0.08235294, 0, 1,
-2.191357, -0.6050479, -2.116368, 1, 0.09019608, 0, 1,
-2.170079, -0.5309727, -1.430023, 1, 0.09411765, 0, 1,
-2.120587, 0.06491277, -0.4134035, 1, 0.1019608, 0, 1,
-2.11963, 0.1075743, -2.181156, 1, 0.1098039, 0, 1,
-2.103822, 0.2314173, 0.3383403, 1, 0.1137255, 0, 1,
-2.094782, -0.1527997, -2.216094, 1, 0.1215686, 0, 1,
-2.072467, 0.04235404, -2.124698, 1, 0.1254902, 0, 1,
-2.051159, -0.7823743, -2.197384, 1, 0.1333333, 0, 1,
-2.028707, -0.06633681, 0.2646841, 1, 0.1372549, 0, 1,
-1.996688, 0.2379809, 0.7791609, 1, 0.145098, 0, 1,
-1.973685, 0.1061283, 0.444051, 1, 0.1490196, 0, 1,
-1.963236, 0.5607608, -1.636213, 1, 0.1568628, 0, 1,
-1.932413, 0.4795595, -0.5089955, 1, 0.1607843, 0, 1,
-1.909004, 0.821694, -2.144685, 1, 0.1686275, 0, 1,
-1.904925, 1.288803, 0.2298515, 1, 0.172549, 0, 1,
-1.895153, 0.7043926, -0.988126, 1, 0.1803922, 0, 1,
-1.88247, -1.529227, -3.777436, 1, 0.1843137, 0, 1,
-1.881604, -0.5016968, -0.6607046, 1, 0.1921569, 0, 1,
-1.869978, 0.2860339, -1.825124, 1, 0.1960784, 0, 1,
-1.86496, -1.307725, -2.739299, 1, 0.2039216, 0, 1,
-1.862438, 1.108975, -0.01151314, 1, 0.2117647, 0, 1,
-1.859846, 0.7416965, 0.7941791, 1, 0.2156863, 0, 1,
-1.850003, -1.581858, -2.407602, 1, 0.2235294, 0, 1,
-1.837333, 0.9357625, 0.05079801, 1, 0.227451, 0, 1,
-1.813439, 1.09277, 0.4661648, 1, 0.2352941, 0, 1,
-1.797248, 0.8613024, -1.571395, 1, 0.2392157, 0, 1,
-1.769919, 2.171999, 0.2745073, 1, 0.2470588, 0, 1,
-1.759104, -0.1061194, -1.805159, 1, 0.2509804, 0, 1,
-1.721917, 0.3696415, -1.892082, 1, 0.2588235, 0, 1,
-1.707788, -1.328249, -0.6937857, 1, 0.2627451, 0, 1,
-1.701936, -0.7802586, -2.285552, 1, 0.2705882, 0, 1,
-1.698758, 0.1794978, -1.384888, 1, 0.2745098, 0, 1,
-1.658534, 2.001226, -0.07170812, 1, 0.282353, 0, 1,
-1.639249, 0.0206367, -2.579384, 1, 0.2862745, 0, 1,
-1.626066, 2.297848, -0.1369151, 1, 0.2941177, 0, 1,
-1.611613, 1.135766, -1.094541, 1, 0.3019608, 0, 1,
-1.61153, -0.6694923, -1.97267, 1, 0.3058824, 0, 1,
-1.588197, 1.331581, -0.538559, 1, 0.3137255, 0, 1,
-1.587561, -1.289139, -2.479183, 1, 0.3176471, 0, 1,
-1.580161, -0.163069, -2.231506, 1, 0.3254902, 0, 1,
-1.577031, 0.03159742, 0.5980554, 1, 0.3294118, 0, 1,
-1.573894, -0.1503673, -0.9954792, 1, 0.3372549, 0, 1,
-1.56876, 0.01870857, -1.805082, 1, 0.3411765, 0, 1,
-1.551328, -0.6258054, -2.133366, 1, 0.3490196, 0, 1,
-1.53561, -0.04511685, -1.784043, 1, 0.3529412, 0, 1,
-1.530116, 0.5221335, 0.1580338, 1, 0.3607843, 0, 1,
-1.525515, 1.126858, -0.7348518, 1, 0.3647059, 0, 1,
-1.521809, -0.7621948, -1.994641, 1, 0.372549, 0, 1,
-1.516717, -0.4445708, -1.235096, 1, 0.3764706, 0, 1,
-1.505606, -0.07643703, -3.284983, 1, 0.3843137, 0, 1,
-1.505497, -0.02934533, -0.2224496, 1, 0.3882353, 0, 1,
-1.505478, -0.2685117, -3.285833, 1, 0.3960784, 0, 1,
-1.502101, -0.9553667, -2.592172, 1, 0.4039216, 0, 1,
-1.498552, 1.747775, 0.3332326, 1, 0.4078431, 0, 1,
-1.497983, 1.682739, -1.180913, 1, 0.4156863, 0, 1,
-1.494044, -0.3504877, -0.7869374, 1, 0.4196078, 0, 1,
-1.47412, 0.1750759, -3.323812, 1, 0.427451, 0, 1,
-1.470106, -0.9458553, -0.3636431, 1, 0.4313726, 0, 1,
-1.461181, -0.3583546, -2.308402, 1, 0.4392157, 0, 1,
-1.457142, -0.3313946, -2.059322, 1, 0.4431373, 0, 1,
-1.448985, 0.1589355, -1.353445, 1, 0.4509804, 0, 1,
-1.440082, 0.7671955, -0.363108, 1, 0.454902, 0, 1,
-1.437033, -0.6553482, -1.740722, 1, 0.4627451, 0, 1,
-1.434559, 0.3959238, -1.381166, 1, 0.4666667, 0, 1,
-1.43404, -0.427404, -0.3422596, 1, 0.4745098, 0, 1,
-1.432634, -1.517762, -2.460287, 1, 0.4784314, 0, 1,
-1.425879, -0.758171, -2.932795, 1, 0.4862745, 0, 1,
-1.425788, 1.339969, -0.7410391, 1, 0.4901961, 0, 1,
-1.424754, 0.960154, -0.7838808, 1, 0.4980392, 0, 1,
-1.41963, -0.3213139, -1.272596, 1, 0.5058824, 0, 1,
-1.418966, -0.3159492, -2.270819, 1, 0.509804, 0, 1,
-1.413093, -1.824253, -1.285149, 1, 0.5176471, 0, 1,
-1.410001, 0.5648718, -0.04650334, 1, 0.5215687, 0, 1,
-1.409714, 0.739127, -1.632629, 1, 0.5294118, 0, 1,
-1.403221, -0.9260324, -1.927366, 1, 0.5333334, 0, 1,
-1.399041, -0.433675, -1.617079, 1, 0.5411765, 0, 1,
-1.396506, -1.238524, -2.570733, 1, 0.5450981, 0, 1,
-1.373964, -0.05186052, 0.7074242, 1, 0.5529412, 0, 1,
-1.366967, -1.427967, -1.989941, 1, 0.5568628, 0, 1,
-1.364064, 0.116436, -1.339251, 1, 0.5647059, 0, 1,
-1.361536, -2.086971, -0.8155411, 1, 0.5686275, 0, 1,
-1.350531, -0.09314781, -2.313127, 1, 0.5764706, 0, 1,
-1.321532, 2.177856, -0.9338081, 1, 0.5803922, 0, 1,
-1.305483, 0.2162038, -1.698404, 1, 0.5882353, 0, 1,
-1.304401, 1.307273, -1.531887, 1, 0.5921569, 0, 1,
-1.304319, 0.2770494, -0.8083988, 1, 0.6, 0, 1,
-1.29319, -1.770642, -3.72002, 1, 0.6078432, 0, 1,
-1.282528, 0.9103649, -2.426611, 1, 0.6117647, 0, 1,
-1.278019, 1.212463, -1.677342, 1, 0.6196079, 0, 1,
-1.277888, 0.01827405, -3.415789, 1, 0.6235294, 0, 1,
-1.27322, -0.7660587, -1.518353, 1, 0.6313726, 0, 1,
-1.268923, 1.061593, -0.12362, 1, 0.6352941, 0, 1,
-1.260094, -0.013167, -1.773349, 1, 0.6431373, 0, 1,
-1.236138, 0.9160097, -0.2716813, 1, 0.6470588, 0, 1,
-1.213441, -1.155539, -1.789536, 1, 0.654902, 0, 1,
-1.211957, -0.5897099, -1.691855, 1, 0.6588235, 0, 1,
-1.211498, 1.441087, -2.315549, 1, 0.6666667, 0, 1,
-1.201663, 2.358103, -1.502097, 1, 0.6705883, 0, 1,
-1.20104, 0.6961188, -2.710499, 1, 0.6784314, 0, 1,
-1.200229, 0.01397398, -1.644078, 1, 0.682353, 0, 1,
-1.19647, -1.334204, -4.791683, 1, 0.6901961, 0, 1,
-1.187009, 0.09743771, -1.853496, 1, 0.6941177, 0, 1,
-1.179229, -0.04503301, -0.1350787, 1, 0.7019608, 0, 1,
-1.172229, 1.811622, 0.04302975, 1, 0.7098039, 0, 1,
-1.169066, -1.225387, -0.6851779, 1, 0.7137255, 0, 1,
-1.150734, -0.6378447, -2.058676, 1, 0.7215686, 0, 1,
-1.147556, 2.306752, -0.1640473, 1, 0.7254902, 0, 1,
-1.147431, -0.06427833, -0.1499369, 1, 0.7333333, 0, 1,
-1.13709, -0.3586363, -1.377064, 1, 0.7372549, 0, 1,
-1.132465, 0.9537856, -1.00291, 1, 0.7450981, 0, 1,
-1.120046, -0.7601191, -2.345722, 1, 0.7490196, 0, 1,
-1.117954, -2.283828, -2.216179, 1, 0.7568628, 0, 1,
-1.117942, 0.4422485, -0.8141232, 1, 0.7607843, 0, 1,
-1.117199, 2.111488, -2.189582, 1, 0.7686275, 0, 1,
-1.110784, 0.4188724, -0.2875721, 1, 0.772549, 0, 1,
-1.108661, -0.4284737, -0.2734747, 1, 0.7803922, 0, 1,
-1.1084, -0.6248592, 0.60471, 1, 0.7843137, 0, 1,
-1.107532, -0.8949539, -1.862961, 1, 0.7921569, 0, 1,
-1.095424, 0.2558996, -1.707716, 1, 0.7960784, 0, 1,
-1.077337, -0.527603, -1.525385, 1, 0.8039216, 0, 1,
-1.075205, -0.1219443, -1.082215, 1, 0.8117647, 0, 1,
-1.066826, -0.6371918, -2.211745, 1, 0.8156863, 0, 1,
-1.062843, -0.793376, 0.05123921, 1, 0.8235294, 0, 1,
-1.05907, -0.577902, -2.206585, 1, 0.827451, 0, 1,
-1.057171, -0.4081657, -1.865106, 1, 0.8352941, 0, 1,
-1.056909, -0.3567816, -2.060564, 1, 0.8392157, 0, 1,
-1.053209, 1.119186, -0.9652852, 1, 0.8470588, 0, 1,
-1.051204, 2.232467, -0.6718382, 1, 0.8509804, 0, 1,
-1.035184, 0.701151, -0.6745721, 1, 0.8588235, 0, 1,
-1.03387, -0.07086241, -1.603298, 1, 0.8627451, 0, 1,
-1.033169, -1.106608, -2.364937, 1, 0.8705882, 0, 1,
-1.025831, -1.541034, -3.021361, 1, 0.8745098, 0, 1,
-1.020918, 0.964489, -1.615934, 1, 0.8823529, 0, 1,
-1.019959, 0.6260644, -3.518166, 1, 0.8862745, 0, 1,
-1.015483, 0.4143458, -0.7133423, 1, 0.8941177, 0, 1,
-1.013034, 0.4741477, -0.4230591, 1, 0.8980392, 0, 1,
-1.011512, 0.2405611, -1.642324, 1, 0.9058824, 0, 1,
-1.00734, -0.4525495, -1.697374, 1, 0.9137255, 0, 1,
-1.002547, 1.952368, -1.861836, 1, 0.9176471, 0, 1,
-0.9790537, -0.2766163, -1.617044, 1, 0.9254902, 0, 1,
-0.9760952, -0.5359846, -2.759368, 1, 0.9294118, 0, 1,
-0.971375, 1.465751, -0.1079929, 1, 0.9372549, 0, 1,
-0.9654902, -0.2317696, -0.2495789, 1, 0.9411765, 0, 1,
-0.9624191, -0.33267, -3.493987, 1, 0.9490196, 0, 1,
-0.9570904, 0.7225407, 1.340406, 1, 0.9529412, 0, 1,
-0.9521732, -0.8017025, -2.191835, 1, 0.9607843, 0, 1,
-0.9442046, 0.2838496, 0.3872376, 1, 0.9647059, 0, 1,
-0.9397001, 0.9201925, 0.9948409, 1, 0.972549, 0, 1,
-0.934734, -0.7065423, -1.909432, 1, 0.9764706, 0, 1,
-0.9343695, -0.1950064, -1.929103, 1, 0.9843137, 0, 1,
-0.9294912, 0.3312787, 0.2381922, 1, 0.9882353, 0, 1,
-0.9256616, 1.235243, -1.800913, 1, 0.9960784, 0, 1,
-0.9184825, 0.3239844, -0.3874139, 0.9960784, 1, 0, 1,
-0.9184794, -0.7889232, -2.581611, 0.9921569, 1, 0, 1,
-0.9166301, -0.4367489, -2.358316, 0.9843137, 1, 0, 1,
-0.9111579, -0.8098193, -2.121776, 0.9803922, 1, 0, 1,
-0.9007917, -0.1089533, 0.742598, 0.972549, 1, 0, 1,
-0.8982236, -0.6616285, -3.056264, 0.9686275, 1, 0, 1,
-0.8905487, -0.5853989, -0.4063789, 0.9607843, 1, 0, 1,
-0.8807146, 0.5060837, -1.183684, 0.9568627, 1, 0, 1,
-0.8799565, 0.2537208, -0.8941376, 0.9490196, 1, 0, 1,
-0.8770777, 0.6160184, -0.7337365, 0.945098, 1, 0, 1,
-0.8688484, -0.560488, -1.386685, 0.9372549, 1, 0, 1,
-0.8577861, 0.07016396, -2.373178, 0.9333333, 1, 0, 1,
-0.8501626, -1.206574, -2.330888, 0.9254902, 1, 0, 1,
-0.8500004, -1.360198, -2.846951, 0.9215686, 1, 0, 1,
-0.8491323, -0.05365345, -2.724857, 0.9137255, 1, 0, 1,
-0.8485584, -1.817968, -1.217989, 0.9098039, 1, 0, 1,
-0.8458079, 0.8125984, -0.2038298, 0.9019608, 1, 0, 1,
-0.8438792, 2.515479, 0.4569479, 0.8941177, 1, 0, 1,
-0.8324709, 0.7274671, -1.418876, 0.8901961, 1, 0, 1,
-0.8295226, -2.040194, -3.666331, 0.8823529, 1, 0, 1,
-0.8291457, 0.8219581, -1.230611, 0.8784314, 1, 0, 1,
-0.8290561, 0.2883223, -3.903743, 0.8705882, 1, 0, 1,
-0.8220408, 0.6697254, -1.792205, 0.8666667, 1, 0, 1,
-0.8173279, -0.1252944, -1.282432, 0.8588235, 1, 0, 1,
-0.8168696, 0.972604, -0.5528958, 0.854902, 1, 0, 1,
-0.8150823, -0.4192128, -1.209795, 0.8470588, 1, 0, 1,
-0.807655, -0.1906674, 0.9723685, 0.8431373, 1, 0, 1,
-0.8071481, 0.003922687, -1.357945, 0.8352941, 1, 0, 1,
-0.8039883, 2.537752, -2.008076, 0.8313726, 1, 0, 1,
-0.7970603, 0.6512921, -1.055596, 0.8235294, 1, 0, 1,
-0.7959896, 0.06342423, -3.12598, 0.8196079, 1, 0, 1,
-0.7952511, 2.38419, -1.656188, 0.8117647, 1, 0, 1,
-0.7945962, -1.982402, -2.49129, 0.8078431, 1, 0, 1,
-0.7936152, -1.241217, -4.025161, 0.8, 1, 0, 1,
-0.7902212, -0.4659384, -3.177471, 0.7921569, 1, 0, 1,
-0.7867891, 0.2255649, -1.687465, 0.7882353, 1, 0, 1,
-0.7852988, -0.5451046, -1.493706, 0.7803922, 1, 0, 1,
-0.7802015, -0.8312352, -1.794864, 0.7764706, 1, 0, 1,
-0.7796709, -1.053168, -2.88625, 0.7686275, 1, 0, 1,
-0.7774999, 0.11546, -0.8488675, 0.7647059, 1, 0, 1,
-0.7630836, 1.469996, -0.3438139, 0.7568628, 1, 0, 1,
-0.7585386, 0.2737725, -2.823118, 0.7529412, 1, 0, 1,
-0.7576632, 0.913432, -2.111131, 0.7450981, 1, 0, 1,
-0.7511033, -0.03660179, -1.604527, 0.7411765, 1, 0, 1,
-0.7484664, -0.445027, -3.146824, 0.7333333, 1, 0, 1,
-0.7475187, 0.1689261, -2.926682, 0.7294118, 1, 0, 1,
-0.746238, 1.55087, -0.2060984, 0.7215686, 1, 0, 1,
-0.7431117, -0.6903528, -1.113165, 0.7176471, 1, 0, 1,
-0.7423131, -2.357984, -3.683614, 0.7098039, 1, 0, 1,
-0.7365029, -0.5959992, -3.324786, 0.7058824, 1, 0, 1,
-0.7360818, 0.5415611, -1.589101, 0.6980392, 1, 0, 1,
-0.7346809, 0.3484631, -0.9661942, 0.6901961, 1, 0, 1,
-0.7314831, -1.10192, -1.720709, 0.6862745, 1, 0, 1,
-0.7280197, 0.3378145, -0.01126266, 0.6784314, 1, 0, 1,
-0.7276288, -0.5426227, -2.511621, 0.6745098, 1, 0, 1,
-0.7276091, 0.6494343, -1.970066, 0.6666667, 1, 0, 1,
-0.7255177, 1.469978, -0.4714194, 0.6627451, 1, 0, 1,
-0.7180455, 0.1323009, -0.6255348, 0.654902, 1, 0, 1,
-0.7166604, -0.6794584, -2.384462, 0.6509804, 1, 0, 1,
-0.698426, -0.6974608, -1.876478, 0.6431373, 1, 0, 1,
-0.6943597, 0.3926468, -0.2676732, 0.6392157, 1, 0, 1,
-0.6908202, 0.07988459, -1.624018, 0.6313726, 1, 0, 1,
-0.6861449, -0.1556266, -1.228044, 0.627451, 1, 0, 1,
-0.681736, 3.728714, -0.4805038, 0.6196079, 1, 0, 1,
-0.6812758, -0.2146385, -2.998732, 0.6156863, 1, 0, 1,
-0.6775081, -0.7122052, -2.494143, 0.6078432, 1, 0, 1,
-0.6754677, -0.7051718, -2.507898, 0.6039216, 1, 0, 1,
-0.6738557, -0.7822222, -1.354465, 0.5960785, 1, 0, 1,
-0.6691518, -0.03571727, -1.500279, 0.5882353, 1, 0, 1,
-0.6666795, 0.2528221, -1.18808, 0.5843138, 1, 0, 1,
-0.6656358, 0.8679014, 0.2553791, 0.5764706, 1, 0, 1,
-0.6632314, 0.5899675, -1.933416, 0.572549, 1, 0, 1,
-0.6621678, -1.408506, -2.811838, 0.5647059, 1, 0, 1,
-0.6580322, -0.2874267, -1.512943, 0.5607843, 1, 0, 1,
-0.6542179, -1.188791, -3.931623, 0.5529412, 1, 0, 1,
-0.644317, 2.028504, 0.4861812, 0.5490196, 1, 0, 1,
-0.6430434, 2.687939, -1.358453, 0.5411765, 1, 0, 1,
-0.6425533, 0.04658406, -3.697125, 0.5372549, 1, 0, 1,
-0.6419625, 0.4323558, 0.7221193, 0.5294118, 1, 0, 1,
-0.6369703, -0.7266396, -1.868479, 0.5254902, 1, 0, 1,
-0.6340094, -0.6250507, -2.3849, 0.5176471, 1, 0, 1,
-0.6337876, -0.6908419, -2.945201, 0.5137255, 1, 0, 1,
-0.6325722, -1.264683, -2.710505, 0.5058824, 1, 0, 1,
-0.6299325, -1.755706, -3.805872, 0.5019608, 1, 0, 1,
-0.6255786, -0.8950208, -1.097339, 0.4941176, 1, 0, 1,
-0.6245671, -1.087769, -2.841915, 0.4862745, 1, 0, 1,
-0.623514, 1.561517, -1.357884, 0.4823529, 1, 0, 1,
-0.6200052, 0.6409152, 0.221801, 0.4745098, 1, 0, 1,
-0.6183959, -0.6253526, -1.77334, 0.4705882, 1, 0, 1,
-0.6157745, 1.018333, -2.394037, 0.4627451, 1, 0, 1,
-0.6153022, 0.7972432, -2.067894, 0.4588235, 1, 0, 1,
-0.6137239, 0.1156776, -1.599544, 0.4509804, 1, 0, 1,
-0.6094493, 0.1566504, -1.344458, 0.4470588, 1, 0, 1,
-0.6088999, -0.2972804, -0.2456134, 0.4392157, 1, 0, 1,
-0.6064858, 0.7075154, -0.1428361, 0.4352941, 1, 0, 1,
-0.6016036, -0.1489141, -3.055052, 0.427451, 1, 0, 1,
-0.5979564, 0.3366844, -0.8067679, 0.4235294, 1, 0, 1,
-0.595023, 0.8076936, -0.6508899, 0.4156863, 1, 0, 1,
-0.5950109, -1.430744, -1.560444, 0.4117647, 1, 0, 1,
-0.5894634, -2.121572, -2.905483, 0.4039216, 1, 0, 1,
-0.5845474, 0.5494801, 0.1776468, 0.3960784, 1, 0, 1,
-0.5805564, -1.889581, -2.348973, 0.3921569, 1, 0, 1,
-0.5789418, 0.8445098, 0.6845607, 0.3843137, 1, 0, 1,
-0.5730633, 1.217139, -1.190376, 0.3803922, 1, 0, 1,
-0.5723345, -1.326349, -2.75929, 0.372549, 1, 0, 1,
-0.5678983, -1.434228, -3.087197, 0.3686275, 1, 0, 1,
-0.5656889, 0.08614276, -0.7521774, 0.3607843, 1, 0, 1,
-0.5599251, 0.334258, -1.698058, 0.3568628, 1, 0, 1,
-0.5579324, 0.6554146, -1.818764, 0.3490196, 1, 0, 1,
-0.5574133, 2.032684, -0.1199246, 0.345098, 1, 0, 1,
-0.5561827, -1.406143, -2.555809, 0.3372549, 1, 0, 1,
-0.5486657, -0.2570611, -3.489578, 0.3333333, 1, 0, 1,
-0.5467868, 1.351684, 1.477896, 0.3254902, 1, 0, 1,
-0.5441745, -0.1562855, -1.310675, 0.3215686, 1, 0, 1,
-0.5424794, 1.138817, -0.02413279, 0.3137255, 1, 0, 1,
-0.5411755, 0.392707, -1.202015, 0.3098039, 1, 0, 1,
-0.5373945, -1.287895, -3.103141, 0.3019608, 1, 0, 1,
-0.534322, -0.1407849, -2.032549, 0.2941177, 1, 0, 1,
-0.5330139, -0.2841063, -1.451149, 0.2901961, 1, 0, 1,
-0.5321972, -0.2108869, -2.457719, 0.282353, 1, 0, 1,
-0.5251234, 0.4360293, 0.001146821, 0.2784314, 1, 0, 1,
-0.5247277, 0.9150918, 0.6860633, 0.2705882, 1, 0, 1,
-0.5227822, 1.529062, -0.2702788, 0.2666667, 1, 0, 1,
-0.5196353, 0.959005, -0.3428852, 0.2588235, 1, 0, 1,
-0.5190484, -0.2794472, -2.240409, 0.254902, 1, 0, 1,
-0.5176973, 0.5751895, -1.216424, 0.2470588, 1, 0, 1,
-0.5109456, 0.6058999, -0.3555046, 0.2431373, 1, 0, 1,
-0.5088087, 1.458826, 1.620263, 0.2352941, 1, 0, 1,
-0.5078552, 0.298804, -0.7858537, 0.2313726, 1, 0, 1,
-0.507418, -0.302238, -0.4091164, 0.2235294, 1, 0, 1,
-0.5069548, 0.2064765, -1.407523, 0.2196078, 1, 0, 1,
-0.5063421, -1.47309, -3.447703, 0.2117647, 1, 0, 1,
-0.5032855, 0.4282644, -2.525324, 0.2078431, 1, 0, 1,
-0.5026729, 1.079383, 0.08382127, 0.2, 1, 0, 1,
-0.5015053, -0.5488242, -2.557134, 0.1921569, 1, 0, 1,
-0.4970013, -0.4855314, -2.233877, 0.1882353, 1, 0, 1,
-0.4957706, -1.382851, -2.224263, 0.1803922, 1, 0, 1,
-0.4953714, 0.3995143, 0.3826523, 0.1764706, 1, 0, 1,
-0.4953616, 1.521942, -0.3598531, 0.1686275, 1, 0, 1,
-0.4902124, 0.191622, -1.192268, 0.1647059, 1, 0, 1,
-0.4869606, 0.08302273, -1.709717, 0.1568628, 1, 0, 1,
-0.4856685, -1.192356, -2.783391, 0.1529412, 1, 0, 1,
-0.4809578, -0.3191285, -3.066921, 0.145098, 1, 0, 1,
-0.4750301, -0.7080534, -1.758616, 0.1411765, 1, 0, 1,
-0.4741384, -1.790159, -5.004622, 0.1333333, 1, 0, 1,
-0.4579277, 0.5596671, 0.2658931, 0.1294118, 1, 0, 1,
-0.4501496, 0.1938237, 0.4257141, 0.1215686, 1, 0, 1,
-0.4471284, -0.1804744, -4.807261, 0.1176471, 1, 0, 1,
-0.4446303, 0.6709664, -0.4305348, 0.1098039, 1, 0, 1,
-0.4433072, 0.005885761, -1.631569, 0.1058824, 1, 0, 1,
-0.4431274, -0.8770297, -2.166075, 0.09803922, 1, 0, 1,
-0.4393885, -1.200005, -2.625118, 0.09019608, 1, 0, 1,
-0.429873, 0.1485947, -1.859958, 0.08627451, 1, 0, 1,
-0.4284495, -0.03012096, -2.352538, 0.07843138, 1, 0, 1,
-0.4258193, -0.2379699, -2.954543, 0.07450981, 1, 0, 1,
-0.4243827, 1.248682, -0.03893579, 0.06666667, 1, 0, 1,
-0.4175652, 0.0883641, -0.4586224, 0.0627451, 1, 0, 1,
-0.4167617, -1.662152, -2.360166, 0.05490196, 1, 0, 1,
-0.4132287, -0.6790593, -3.75948, 0.05098039, 1, 0, 1,
-0.4129865, 1.791172, -1.832478, 0.04313726, 1, 0, 1,
-0.4112819, -0.7359299, -4.225319, 0.03921569, 1, 0, 1,
-0.409814, 1.023249, -1.012683, 0.03137255, 1, 0, 1,
-0.4085588, 0.8463873, 0.6832158, 0.02745098, 1, 0, 1,
-0.4080338, 1.121125, -0.08133185, 0.01960784, 1, 0, 1,
-0.4023921, 2.15766, -0.6700258, 0.01568628, 1, 0, 1,
-0.4005517, 1.096175, 0.6554162, 0.007843138, 1, 0, 1,
-0.4000514, -0.7571529, -3.268273, 0.003921569, 1, 0, 1,
-0.3956413, -1.052819, -2.216165, 0, 1, 0.003921569, 1,
-0.3946308, 1.621118, 0.8785352, 0, 1, 0.01176471, 1,
-0.3906288, 1.235121, -0.3381572, 0, 1, 0.01568628, 1,
-0.3895463, 0.4619478, -1.332735, 0, 1, 0.02352941, 1,
-0.389004, 0.849268, -1.560035, 0, 1, 0.02745098, 1,
-0.37769, 1.827906, -0.1493058, 0, 1, 0.03529412, 1,
-0.3770005, 3.92868, 1.244529, 0, 1, 0.03921569, 1,
-0.3733152, -1.102534, -4.329784, 0, 1, 0.04705882, 1,
-0.3727433, -0.8927034, -4.27065, 0, 1, 0.05098039, 1,
-0.3726311, 0.5564337, -0.2598052, 0, 1, 0.05882353, 1,
-0.3671556, -1.09827, -1.269733, 0, 1, 0.0627451, 1,
-0.3655202, -1.470914, -1.406057, 0, 1, 0.07058824, 1,
-0.3575388, 0.01623245, -1.266081, 0, 1, 0.07450981, 1,
-0.3506791, -0.6496302, -1.658013, 0, 1, 0.08235294, 1,
-0.3503831, -0.1114625, -1.511616, 0, 1, 0.08627451, 1,
-0.3501332, -0.1795294, -0.9850811, 0, 1, 0.09411765, 1,
-0.3497837, 0.4560071, -0.805275, 0, 1, 0.1019608, 1,
-0.3464079, -0.6558381, -1.995374, 0, 1, 0.1058824, 1,
-0.3444403, 0.2802717, -0.5902626, 0, 1, 0.1137255, 1,
-0.3438742, -0.7463803, -2.072383, 0, 1, 0.1176471, 1,
-0.3434699, 0.5177304, -0.400618, 0, 1, 0.1254902, 1,
-0.3419863, 1.377071, 0.2111133, 0, 1, 0.1294118, 1,
-0.3380136, -2.467522, -3.081293, 0, 1, 0.1372549, 1,
-0.3367408, 0.5421519, -0.8484051, 0, 1, 0.1411765, 1,
-0.336051, -2.098229, -3.520052, 0, 1, 0.1490196, 1,
-0.3349659, 0.5948516, -0.9873566, 0, 1, 0.1529412, 1,
-0.3342594, 0.02287628, -2.164985, 0, 1, 0.1607843, 1,
-0.3337352, 0.3498486, -0.09689608, 0, 1, 0.1647059, 1,
-0.332224, 0.2165874, -0.9794673, 0, 1, 0.172549, 1,
-0.3302355, -1.522081, -3.261258, 0, 1, 0.1764706, 1,
-0.3244152, -0.8360921, -3.116321, 0, 1, 0.1843137, 1,
-0.3167692, -1.037122, -2.709416, 0, 1, 0.1882353, 1,
-0.3153993, -0.2673521, 0.02364322, 0, 1, 0.1960784, 1,
-0.3145715, 1.39504, 0.415308, 0, 1, 0.2039216, 1,
-0.3055747, 0.04352541, -1.139685, 0, 1, 0.2078431, 1,
-0.301314, 0.2272841, 1.299121, 0, 1, 0.2156863, 1,
-0.3011599, 1.172541, -0.7202383, 0, 1, 0.2196078, 1,
-0.298181, -0.6742895, -1.758623, 0, 1, 0.227451, 1,
-0.2953776, -1.176732, -4.881952, 0, 1, 0.2313726, 1,
-0.2950498, 0.6083003, -1.185432, 0, 1, 0.2392157, 1,
-0.2933492, -0.3844246, -1.499566, 0, 1, 0.2431373, 1,
-0.2923022, -0.5119344, -3.760984, 0, 1, 0.2509804, 1,
-0.2859071, -0.8512694, -2.007085, 0, 1, 0.254902, 1,
-0.2851759, -0.5546135, -2.682374, 0, 1, 0.2627451, 1,
-0.2811437, -0.06869249, -1.389721, 0, 1, 0.2666667, 1,
-0.2783808, -0.8929167, -2.083304, 0, 1, 0.2745098, 1,
-0.2706173, 0.1725173, -1.881388, 0, 1, 0.2784314, 1,
-0.26793, -1.007164, -1.829555, 0, 1, 0.2862745, 1,
-0.267549, -0.0460746, -0.6669711, 0, 1, 0.2901961, 1,
-0.2673976, 2.106219, -0.7110357, 0, 1, 0.2980392, 1,
-0.2629819, -0.3607673, -1.28268, 0, 1, 0.3058824, 1,
-0.2616276, -0.8690988, -3.532783, 0, 1, 0.3098039, 1,
-0.2572192, -1.98735, -1.224278, 0, 1, 0.3176471, 1,
-0.2516538, -0.8084124, -3.337118, 0, 1, 0.3215686, 1,
-0.2492676, -1.473141, -3.335952, 0, 1, 0.3294118, 1,
-0.2466024, 0.8843229, 1.641991, 0, 1, 0.3333333, 1,
-0.2459107, -0.5697305, -3.71169, 0, 1, 0.3411765, 1,
-0.2345043, 0.1637653, -0.9064983, 0, 1, 0.345098, 1,
-0.2337453, -0.4752492, -2.929178, 0, 1, 0.3529412, 1,
-0.2328529, 0.4006264, 0.5385411, 0, 1, 0.3568628, 1,
-0.230478, 0.5009704, -1.482791, 0, 1, 0.3647059, 1,
-0.2303562, 0.4786307, 0.176567, 0, 1, 0.3686275, 1,
-0.2299581, -0.4612236, -3.80777, 0, 1, 0.3764706, 1,
-0.2296795, 0.9598368, -0.5108695, 0, 1, 0.3803922, 1,
-0.2291572, -1.80102, -2.833616, 0, 1, 0.3882353, 1,
-0.226579, 0.007050337, -1.5894, 0, 1, 0.3921569, 1,
-0.2256775, -0.5584652, -2.252023, 0, 1, 0.4, 1,
-0.2256327, 0.9286928, 1.040053, 0, 1, 0.4078431, 1,
-0.2250161, 1.199223, 0.3237486, 0, 1, 0.4117647, 1,
-0.2230471, -0.07910174, -3.160728, 0, 1, 0.4196078, 1,
-0.2220245, 0.3946511, -1.239419, 0, 1, 0.4235294, 1,
-0.2219073, 0.006605495, -2.032849, 0, 1, 0.4313726, 1,
-0.2179566, 0.176308, -2.73454, 0, 1, 0.4352941, 1,
-0.2052907, -0.2772039, -0.6498663, 0, 1, 0.4431373, 1,
-0.2047597, -0.5293071, -3.876291, 0, 1, 0.4470588, 1,
-0.2039262, -0.5107415, -4.250058, 0, 1, 0.454902, 1,
-0.198958, 0.5962054, -1.465136, 0, 1, 0.4588235, 1,
-0.198344, -0.6625422, -2.026889, 0, 1, 0.4666667, 1,
-0.1941715, -2.236373, -1.584507, 0, 1, 0.4705882, 1,
-0.1924308, -1.222793, -3.625279, 0, 1, 0.4784314, 1,
-0.1907085, -0.4160628, -0.7150727, 0, 1, 0.4823529, 1,
-0.1879253, -1.453006, -1.853096, 0, 1, 0.4901961, 1,
-0.187336, -0.5405642, -2.647052, 0, 1, 0.4941176, 1,
-0.1837798, 0.7502785, -0.05190659, 0, 1, 0.5019608, 1,
-0.181381, -1.270488, -3.787873, 0, 1, 0.509804, 1,
-0.1796, 2.378786, -1.715067, 0, 1, 0.5137255, 1,
-0.1785496, 1.178156, -0.3251273, 0, 1, 0.5215687, 1,
-0.1751859, 1.32744, -0.4328314, 0, 1, 0.5254902, 1,
-0.174689, -0.8316274, -1.744555, 0, 1, 0.5333334, 1,
-0.1689017, -0.9429778, -3.719095, 0, 1, 0.5372549, 1,
-0.1655518, 0.4198531, -0.1992018, 0, 1, 0.5450981, 1,
-0.1619985, -0.02048175, -1.437275, 0, 1, 0.5490196, 1,
-0.1613799, -0.09020118, -2.355125, 0, 1, 0.5568628, 1,
-0.160093, -1.169899, -3.37286, 0, 1, 0.5607843, 1,
-0.1590794, 0.6018577, -0.7402632, 0, 1, 0.5686275, 1,
-0.1529901, -0.8618493, -1.304956, 0, 1, 0.572549, 1,
-0.1529893, -0.04794583, -1.838429, 0, 1, 0.5803922, 1,
-0.1506057, 0.03305972, -1.20824, 0, 1, 0.5843138, 1,
-0.1501603, 0.3724643, -1.577125, 0, 1, 0.5921569, 1,
-0.1501141, 1.683045, -0.09642032, 0, 1, 0.5960785, 1,
-0.1453351, 0.3139054, 2.025151, 0, 1, 0.6039216, 1,
-0.1409944, -0.2242133, -2.865223, 0, 1, 0.6117647, 1,
-0.1403099, 0.4388588, 0.8805861, 0, 1, 0.6156863, 1,
-0.1359273, 0.7641121, 0.8369559, 0, 1, 0.6235294, 1,
-0.1335139, 1.704188, 0.8582587, 0, 1, 0.627451, 1,
-0.1300419, -1.519669, -4.203744, 0, 1, 0.6352941, 1,
-0.1298606, -0.2497108, -3.357518, 0, 1, 0.6392157, 1,
-0.1292867, -2.677414, -1.489485, 0, 1, 0.6470588, 1,
-0.1278759, 1.54245, -0.5193173, 0, 1, 0.6509804, 1,
-0.1278076, -0.8019695, -2.07621, 0, 1, 0.6588235, 1,
-0.1254425, 0.04290133, -0.8442605, 0, 1, 0.6627451, 1,
-0.1251439, 0.5578583, -1.7659, 0, 1, 0.6705883, 1,
-0.1226617, 0.9371822, 0.1332774, 0, 1, 0.6745098, 1,
-0.1224068, -1.749626, -2.581689, 0, 1, 0.682353, 1,
-0.1181247, -0.4776122, -1.721797, 0, 1, 0.6862745, 1,
-0.1146394, 1.842479, -1.122275, 0, 1, 0.6941177, 1,
-0.1133963, 0.7798049, -0.135631, 0, 1, 0.7019608, 1,
-0.1109653, -0.3185037, -3.935194, 0, 1, 0.7058824, 1,
-0.1065178, -1.583126, -2.125023, 0, 1, 0.7137255, 1,
-0.1063497, 0.5224689, 0.1786144, 0, 1, 0.7176471, 1,
-0.1047251, 0.1505133, -2.142618, 0, 1, 0.7254902, 1,
-0.1043057, -1.250087, -4.135592, 0, 1, 0.7294118, 1,
-0.09166263, 0.04255389, 0.2274235, 0, 1, 0.7372549, 1,
-0.09103473, 0.04127638, -0.3817103, 0, 1, 0.7411765, 1,
-0.08975314, 0.3805741, 0.4680931, 0, 1, 0.7490196, 1,
-0.08921681, -1.403316, -2.904089, 0, 1, 0.7529412, 1,
-0.08629898, -0.3157277, -2.225996, 0, 1, 0.7607843, 1,
-0.08619384, 2.576544, -1.120235, 0, 1, 0.7647059, 1,
-0.08450035, -1.036031, -3.257965, 0, 1, 0.772549, 1,
-0.0790875, 1.81128, -1.092872, 0, 1, 0.7764706, 1,
-0.07748512, -0.7104582, -3.122671, 0, 1, 0.7843137, 1,
-0.07667542, 1.246775, 1.628221, 0, 1, 0.7882353, 1,
-0.07597172, 0.5243315, -1.116527, 0, 1, 0.7960784, 1,
-0.06524087, -0.06985497, -1.643572, 0, 1, 0.8039216, 1,
-0.06465531, -1.170971, -2.751912, 0, 1, 0.8078431, 1,
-0.06451032, -0.3375355, -3.695156, 0, 1, 0.8156863, 1,
-0.06365076, 0.9469423, 0.2473677, 0, 1, 0.8196079, 1,
-0.06121657, -0.7812923, -4.410364, 0, 1, 0.827451, 1,
-0.05985618, -0.9376182, -3.265416, 0, 1, 0.8313726, 1,
-0.05470907, 0.5792365, 0.07891803, 0, 1, 0.8392157, 1,
-0.04929801, -1.234709, -2.282719, 0, 1, 0.8431373, 1,
-0.04245728, -0.6628962, -2.537111, 0, 1, 0.8509804, 1,
-0.04196633, 0.4092813, -0.371739, 0, 1, 0.854902, 1,
-0.04102186, 1.703573, -0.7022126, 0, 1, 0.8627451, 1,
-0.03469494, -0.2138946, -3.456805, 0, 1, 0.8666667, 1,
-0.03460831, 0.186476, -0.6425657, 0, 1, 0.8745098, 1,
-0.03299153, -0.02068145, -0.138279, 0, 1, 0.8784314, 1,
-0.03253455, 1.179699, -0.1436573, 0, 1, 0.8862745, 1,
-0.02920147, -1.154073, -2.17759, 0, 1, 0.8901961, 1,
-0.02867938, 0.2282668, 0.936372, 0, 1, 0.8980392, 1,
-0.02581482, 0.5522995, -0.2191779, 0, 1, 0.9058824, 1,
-0.02492893, -0.7661144, -3.983659, 0, 1, 0.9098039, 1,
-0.02413866, 0.11969, 1.232842, 0, 1, 0.9176471, 1,
-0.02021516, -0.9529365, -2.160924, 0, 1, 0.9215686, 1,
-0.02020423, -0.4569769, -4.225086, 0, 1, 0.9294118, 1,
-0.01765046, -0.4603141, -3.682589, 0, 1, 0.9333333, 1,
-0.01692091, -0.4554572, -4.440228, 0, 1, 0.9411765, 1,
-0.004904536, 0.6103833, 0.1839362, 0, 1, 0.945098, 1,
-0.003748546, 0.6967413, 0.4102386, 0, 1, 0.9529412, 1,
-0.002345651, -0.08218206, -3.402439, 0, 1, 0.9568627, 1,
0.000826124, 1.510101, -0.3710522, 0, 1, 0.9647059, 1,
0.00329394, -0.1114376, 2.601281, 0, 1, 0.9686275, 1,
0.01107061, -0.9884856, 3.485338, 0, 1, 0.9764706, 1,
0.01151295, -1.375979, 4.110943, 0, 1, 0.9803922, 1,
0.01508912, 0.05880093, -0.7057243, 0, 1, 0.9882353, 1,
0.01621254, 1.090649, -0.5024256, 0, 1, 0.9921569, 1,
0.0202243, -0.7390389, 4.510201, 0, 1, 1, 1,
0.02385021, 0.6195387, 1.310203, 0, 0.9921569, 1, 1,
0.02422378, 1.644274, 0.9135699, 0, 0.9882353, 1, 1,
0.03466409, 0.4061712, 1.675401, 0, 0.9803922, 1, 1,
0.03996785, 0.3230123, 1.684801, 0, 0.9764706, 1, 1,
0.04385061, 0.08107323, 2.821338, 0, 0.9686275, 1, 1,
0.04433169, -0.4167018, 1.420499, 0, 0.9647059, 1, 1,
0.0489627, -0.2432549, 2.161784, 0, 0.9568627, 1, 1,
0.05017252, 0.7904146, 1.546728, 0, 0.9529412, 1, 1,
0.05034765, 0.8947854, -1.286197, 0, 0.945098, 1, 1,
0.05156187, 0.3698701, -1.402195, 0, 0.9411765, 1, 1,
0.0558407, -1.920706, 2.833851, 0, 0.9333333, 1, 1,
0.06026328, -1.808157, 3.39024, 0, 0.9294118, 1, 1,
0.06055541, -1.071793, 3.011636, 0, 0.9215686, 1, 1,
0.06089605, 1.403188, -1.012443, 0, 0.9176471, 1, 1,
0.07190669, 0.4319832, -0.007517644, 0, 0.9098039, 1, 1,
0.07371431, -1.670493, 3.025431, 0, 0.9058824, 1, 1,
0.07784936, 0.6155866, 0.1699366, 0, 0.8980392, 1, 1,
0.0783847, -0.853177, 3.044236, 0, 0.8901961, 1, 1,
0.08431736, 3.250963, 0.1970981, 0, 0.8862745, 1, 1,
0.08448042, -0.7124614, 1.754994, 0, 0.8784314, 1, 1,
0.09408616, 0.07216481, 0.01189583, 0, 0.8745098, 1, 1,
0.09898452, 1.130062, 0.03093888, 0, 0.8666667, 1, 1,
0.1069203, -1.149161, 3.095483, 0, 0.8627451, 1, 1,
0.1140592, 0.2838287, 1.302065, 0, 0.854902, 1, 1,
0.1144611, -0.9355497, 3.88925, 0, 0.8509804, 1, 1,
0.1204367, 0.1988125, 1.733791, 0, 0.8431373, 1, 1,
0.1212769, -1.243481, 3.057304, 0, 0.8392157, 1, 1,
0.1215017, -0.9643423, 2.579297, 0, 0.8313726, 1, 1,
0.1232317, 0.4577354, 1.610519, 0, 0.827451, 1, 1,
0.1273039, 0.1137225, 1.281854, 0, 0.8196079, 1, 1,
0.1281775, 0.4683037, -1.524538, 0, 0.8156863, 1, 1,
0.1306813, -2.264799, 2.396331, 0, 0.8078431, 1, 1,
0.1308607, 0.4578781, 1.350442, 0, 0.8039216, 1, 1,
0.1317597, -0.502124, 1.435798, 0, 0.7960784, 1, 1,
0.1368322, 0.1394409, -0.6278663, 0, 0.7882353, 1, 1,
0.1370649, -0.8231959, 4.562364, 0, 0.7843137, 1, 1,
0.1389541, -1.281024, 2.945709, 0, 0.7764706, 1, 1,
0.1431828, 0.780604, 0.4985505, 0, 0.772549, 1, 1,
0.1441164, 1.391884, 1.231782, 0, 0.7647059, 1, 1,
0.1497415, 0.7494483, 0.4401196, 0, 0.7607843, 1, 1,
0.1507127, 0.2406964, -1.03906, 0, 0.7529412, 1, 1,
0.1537352, 0.9253233, 0.5648827, 0, 0.7490196, 1, 1,
0.1560057, -0.3505679, 1.335744, 0, 0.7411765, 1, 1,
0.156281, 0.5061398, -0.336403, 0, 0.7372549, 1, 1,
0.1590436, -0.05701754, 1.016602, 0, 0.7294118, 1, 1,
0.1595784, 0.7445161, 1.074467, 0, 0.7254902, 1, 1,
0.1641506, -0.1280895, 3.304082, 0, 0.7176471, 1, 1,
0.1664865, 2.618349, 0.275955, 0, 0.7137255, 1, 1,
0.1673376, 0.0559659, 1.2929, 0, 0.7058824, 1, 1,
0.16741, 1.949785, 0.5442187, 0, 0.6980392, 1, 1,
0.1743048, -2.218116, 1.599136, 0, 0.6941177, 1, 1,
0.1782452, -1.103657, 2.705136, 0, 0.6862745, 1, 1,
0.1787964, -1.719294, 2.515266, 0, 0.682353, 1, 1,
0.1804437, -0.6924453, 3.866618, 0, 0.6745098, 1, 1,
0.1905614, 0.08666763, 0.9285547, 0, 0.6705883, 1, 1,
0.1909329, 2.46192, 1.90399, 0, 0.6627451, 1, 1,
0.1933386, 0.9625674, 0.9415467, 0, 0.6588235, 1, 1,
0.1935955, 0.01370779, 0.8724768, 0, 0.6509804, 1, 1,
0.1951781, -0.297977, 2.171534, 0, 0.6470588, 1, 1,
0.1960172, 0.2812804, -1.815489, 0, 0.6392157, 1, 1,
0.1961398, -2.00002, 5.383481, 0, 0.6352941, 1, 1,
0.1972366, 0.5048892, 0.8689986, 0, 0.627451, 1, 1,
0.203983, 0.4339918, 2.478226, 0, 0.6235294, 1, 1,
0.2097149, 1.209081, 0.9718498, 0, 0.6156863, 1, 1,
0.2119413, -1.217727, 3.644427, 0, 0.6117647, 1, 1,
0.2139876, 0.869435, 0.8841986, 0, 0.6039216, 1, 1,
0.2173689, -0.1786781, 3.948745, 0, 0.5960785, 1, 1,
0.2205673, 0.3851613, -0.9502897, 0, 0.5921569, 1, 1,
0.2225219, -2.14824, 3.323247, 0, 0.5843138, 1, 1,
0.2229103, -0.268066, 2.884143, 0, 0.5803922, 1, 1,
0.2241583, 0.9461521, 0.2496246, 0, 0.572549, 1, 1,
0.2242958, -0.59479, 1.346207, 0, 0.5686275, 1, 1,
0.2294562, -1.085749, 2.768777, 0, 0.5607843, 1, 1,
0.2316949, -0.8651231, 2.251271, 0, 0.5568628, 1, 1,
0.2359377, 0.9401996, 1.152882, 0, 0.5490196, 1, 1,
0.2380977, 0.6377184, 0.5586804, 0, 0.5450981, 1, 1,
0.2408999, 0.1416403, 0.4663638, 0, 0.5372549, 1, 1,
0.2421814, -0.7493167, 2.145741, 0, 0.5333334, 1, 1,
0.2452223, -2.037732, 2.573459, 0, 0.5254902, 1, 1,
0.2513728, -1.417686, 3.650379, 0, 0.5215687, 1, 1,
0.251673, -0.1531832, 0.351925, 0, 0.5137255, 1, 1,
0.2517583, -0.2287557, 4.018091, 0, 0.509804, 1, 1,
0.2523028, -0.5062199, 2.831274, 0, 0.5019608, 1, 1,
0.2567023, 0.5766749, 0.1872885, 0, 0.4941176, 1, 1,
0.2602696, -0.3677096, 1.55204, 0, 0.4901961, 1, 1,
0.2634628, 1.694714, 0.343172, 0, 0.4823529, 1, 1,
0.2642493, 0.3780755, 1.943606, 0, 0.4784314, 1, 1,
0.2647329, -0.6570573, 1.667407, 0, 0.4705882, 1, 1,
0.2682097, 0.4993716, 0.3139777, 0, 0.4666667, 1, 1,
0.2733743, -0.0308464, 0.004808119, 0, 0.4588235, 1, 1,
0.2751452, -1.615763, 3.714246, 0, 0.454902, 1, 1,
0.2762364, -0.884886, 3.175606, 0, 0.4470588, 1, 1,
0.2773644, -1.457852, 2.603357, 0, 0.4431373, 1, 1,
0.2819942, 1.807824, 0.3140752, 0, 0.4352941, 1, 1,
0.2821458, -0.2270265, 1.331863, 0, 0.4313726, 1, 1,
0.2828231, -0.1990549, 2.082633, 0, 0.4235294, 1, 1,
0.2858523, 1.448309, -0.4111589, 0, 0.4196078, 1, 1,
0.2866926, -1.28904, 2.72193, 0, 0.4117647, 1, 1,
0.2883548, -0.3387322, 2.017964, 0, 0.4078431, 1, 1,
0.2885937, -0.2869892, 3.090587, 0, 0.4, 1, 1,
0.2887866, -0.3813928, 3.538728, 0, 0.3921569, 1, 1,
0.2915746, 1.643365, -0.7270926, 0, 0.3882353, 1, 1,
0.2948815, -0.03098238, -0.3038934, 0, 0.3803922, 1, 1,
0.2952812, 0.9903882, 0.9240486, 0, 0.3764706, 1, 1,
0.2983254, -1.02234, 4.198723, 0, 0.3686275, 1, 1,
0.307174, 1.121172, 0.7131862, 0, 0.3647059, 1, 1,
0.3071992, 1.309266, -0.01735579, 0, 0.3568628, 1, 1,
0.3075461, -0.9926584, 1.828819, 0, 0.3529412, 1, 1,
0.3095932, 0.1740676, 1.848146, 0, 0.345098, 1, 1,
0.310035, 0.5234276, 0.2598023, 0, 0.3411765, 1, 1,
0.3179694, 0.2574395, 0.8090039, 0, 0.3333333, 1, 1,
0.3182765, -0.4120208, 3.213006, 0, 0.3294118, 1, 1,
0.3184243, 1.601991, -1.412403, 0, 0.3215686, 1, 1,
0.319443, 0.1437266, 1.459583, 0, 0.3176471, 1, 1,
0.3213594, 0.3552441, 2.203623, 0, 0.3098039, 1, 1,
0.3225728, 0.6140529, 0.7896826, 0, 0.3058824, 1, 1,
0.3282488, 1.106866, 1.360869, 0, 0.2980392, 1, 1,
0.3338294, -0.8158225, 1.657128, 0, 0.2901961, 1, 1,
0.3401956, 1.392833, 0.3353099, 0, 0.2862745, 1, 1,
0.3414599, -1.037482, 2.882279, 0, 0.2784314, 1, 1,
0.3456264, -0.2026606, 1.039683, 0, 0.2745098, 1, 1,
0.3478141, 0.6845028, 0.5534313, 0, 0.2666667, 1, 1,
0.3481704, -1.615431, 2.768841, 0, 0.2627451, 1, 1,
0.3494423, -1.604224, 5.142832, 0, 0.254902, 1, 1,
0.3494555, 0.890431, -0.1938501, 0, 0.2509804, 1, 1,
0.3517443, -0.1561907, 1.239998, 0, 0.2431373, 1, 1,
0.3525979, -1.398188, 0.06448943, 0, 0.2392157, 1, 1,
0.3527678, -1.514516, 1.269935, 0, 0.2313726, 1, 1,
0.3542707, 3.039603, 1.310388, 0, 0.227451, 1, 1,
0.3551039, 0.2212088, 1.120105, 0, 0.2196078, 1, 1,
0.3552583, 1.39914, 0.2564615, 0, 0.2156863, 1, 1,
0.3588392, 1.176642, 0.3977797, 0, 0.2078431, 1, 1,
0.3651685, -1.129947, 2.064695, 0, 0.2039216, 1, 1,
0.3686662, -0.09174386, 2.836107, 0, 0.1960784, 1, 1,
0.3692735, -1.533754, 2.521985, 0, 0.1882353, 1, 1,
0.3721235, -0.2263489, 3.065262, 0, 0.1843137, 1, 1,
0.3724522, 0.8037053, 1.05267, 0, 0.1764706, 1, 1,
0.3746243, 0.2473534, 0.7672006, 0, 0.172549, 1, 1,
0.3746668, -1.80804, 2.521797, 0, 0.1647059, 1, 1,
0.3748604, 0.5722399, 1.846152, 0, 0.1607843, 1, 1,
0.3772227, 0.3336299, 0.1336801, 0, 0.1529412, 1, 1,
0.3780994, 0.8954633, 1.227793, 0, 0.1490196, 1, 1,
0.3795795, -0.1680188, 1.433084, 0, 0.1411765, 1, 1,
0.3805513, -1.39063, 3.003441, 0, 0.1372549, 1, 1,
0.3811596, -0.1880204, 1.694523, 0, 0.1294118, 1, 1,
0.3834327, 0.8547103, -0.830603, 0, 0.1254902, 1, 1,
0.3932759, 2.89901, -0.3549514, 0, 0.1176471, 1, 1,
0.3955663, -1.141293, 2.414212, 0, 0.1137255, 1, 1,
0.3981174, -0.5573433, 2.132303, 0, 0.1058824, 1, 1,
0.3993596, 1.199051, -0.5997207, 0, 0.09803922, 1, 1,
0.4002024, -0.4020397, 2.70909, 0, 0.09411765, 1, 1,
0.4005172, 0.09270097, 0.7532029, 0, 0.08627451, 1, 1,
0.400627, -0.2580896, 1.688958, 0, 0.08235294, 1, 1,
0.4024693, -0.3998849, 2.832828, 0, 0.07450981, 1, 1,
0.4064343, 0.319268, 1.215039, 0, 0.07058824, 1, 1,
0.4100946, 0.3734828, 0.1487788, 0, 0.0627451, 1, 1,
0.4131067, 0.4770967, 0.4346876, 0, 0.05882353, 1, 1,
0.4179124, 0.04558754, 2.060596, 0, 0.05098039, 1, 1,
0.4210497, -0.2363486, 1.427749, 0, 0.04705882, 1, 1,
0.4242892, 0.5141738, -0.277417, 0, 0.03921569, 1, 1,
0.4274465, 0.1092162, 2.024357, 0, 0.03529412, 1, 1,
0.4324186, 2.269248, -0.7280032, 0, 0.02745098, 1, 1,
0.4325043, 0.2028791, 1.500646, 0, 0.02352941, 1, 1,
0.4340307, 0.6590319, 2.436844, 0, 0.01568628, 1, 1,
0.435074, 1.162564, -1.83126, 0, 0.01176471, 1, 1,
0.4531118, 0.1798528, 1.665047, 0, 0.003921569, 1, 1,
0.4587774, -0.6142042, 1.604881, 0.003921569, 0, 1, 1,
0.4604856, 1.252314, 0.3058118, 0.007843138, 0, 1, 1,
0.4613214, -1.002281, 1.959759, 0.01568628, 0, 1, 1,
0.463961, 0.8337787, 0.5708885, 0.01960784, 0, 1, 1,
0.465715, -1.328858, 3.431103, 0.02745098, 0, 1, 1,
0.4666921, -0.7238193, 4.08974, 0.03137255, 0, 1, 1,
0.4683106, -1.422678, 2.502555, 0.03921569, 0, 1, 1,
0.4698956, -0.09471403, 1.227414, 0.04313726, 0, 1, 1,
0.4723058, -1.622585, 3.930313, 0.05098039, 0, 1, 1,
0.4724691, 0.05805075, 2.528679, 0.05490196, 0, 1, 1,
0.4766365, 0.6762611, 0.1094882, 0.0627451, 0, 1, 1,
0.4797733, 0.9800913, -0.0432017, 0.06666667, 0, 1, 1,
0.4822486, -1.232886, 2.215513, 0.07450981, 0, 1, 1,
0.4823849, 1.794363, -0.4218802, 0.07843138, 0, 1, 1,
0.4826059, 1.114376, 1.441943, 0.08627451, 0, 1, 1,
0.4933605, -0.5947186, 2.741096, 0.09019608, 0, 1, 1,
0.498825, 1.244026, 0.8995993, 0.09803922, 0, 1, 1,
0.5018276, -1.263144, 3.469303, 0.1058824, 0, 1, 1,
0.5021535, -0.1323076, 1.833381, 0.1098039, 0, 1, 1,
0.5034803, 0.6947582, -0.4461211, 0.1176471, 0, 1, 1,
0.5045989, 1.234641, 1.065123, 0.1215686, 0, 1, 1,
0.5110421, 1.195805, 0.2495804, 0.1294118, 0, 1, 1,
0.5156317, 0.2565828, 0.2627268, 0.1333333, 0, 1, 1,
0.5156463, -0.5258302, 2.336286, 0.1411765, 0, 1, 1,
0.515736, -0.6626838, 1.790738, 0.145098, 0, 1, 1,
0.5162358, 0.1304603, 0.4160778, 0.1529412, 0, 1, 1,
0.5180319, -0.1667873, 1.636738, 0.1568628, 0, 1, 1,
0.519161, 0.5266951, 1.272251, 0.1647059, 0, 1, 1,
0.5209048, 0.9988251, -1.005074, 0.1686275, 0, 1, 1,
0.5216628, -0.1082069, 1.747037, 0.1764706, 0, 1, 1,
0.5221376, -0.1344849, 1.290922, 0.1803922, 0, 1, 1,
0.5224515, -0.2849186, 3.634624, 0.1882353, 0, 1, 1,
0.5263625, -0.6873165, 1.744215, 0.1921569, 0, 1, 1,
0.5289428, 1.63631, 0.87994, 0.2, 0, 1, 1,
0.5304695, -1.575674, 3.348006, 0.2078431, 0, 1, 1,
0.532064, -0.3338152, 1.760551, 0.2117647, 0, 1, 1,
0.5330312, 0.2513878, -0.5539347, 0.2196078, 0, 1, 1,
0.5331937, 0.332303, 1.365191, 0.2235294, 0, 1, 1,
0.5356132, -0.7627113, 2.675408, 0.2313726, 0, 1, 1,
0.5370688, -1.163153, 3.19988, 0.2352941, 0, 1, 1,
0.5421267, 0.8628209, -0.9888114, 0.2431373, 0, 1, 1,
0.5514035, -0.2498592, 0.7204524, 0.2470588, 0, 1, 1,
0.5531843, 0.2566855, 0.9687184, 0.254902, 0, 1, 1,
0.5586081, 3.049601, -0.4916196, 0.2588235, 0, 1, 1,
0.559624, -1.230463, 1.852832, 0.2666667, 0, 1, 1,
0.5640399, 0.5691493, -1.814168, 0.2705882, 0, 1, 1,
0.564935, -0.3916566, 3.170224, 0.2784314, 0, 1, 1,
0.5698555, 0.61395, -0.9278834, 0.282353, 0, 1, 1,
0.5748692, 0.2628011, 1.057512, 0.2901961, 0, 1, 1,
0.5772365, 0.5602082, 0.06279174, 0.2941177, 0, 1, 1,
0.5868417, -1.417573, 3.235123, 0.3019608, 0, 1, 1,
0.591873, 0.1354466, 2.543421, 0.3098039, 0, 1, 1,
0.5930098, -0.7694039, 1.583758, 0.3137255, 0, 1, 1,
0.593014, 0.9863057, -0.8809339, 0.3215686, 0, 1, 1,
0.5962397, -0.3878861, 3.125814, 0.3254902, 0, 1, 1,
0.5973279, 0.7595403, 1.208381, 0.3333333, 0, 1, 1,
0.6064098, -0.004161216, 1.449875, 0.3372549, 0, 1, 1,
0.6072356, -0.9288439, 3.263295, 0.345098, 0, 1, 1,
0.6097468, -0.3723795, 1.997665, 0.3490196, 0, 1, 1,
0.6110639, 0.2245745, 0.9179492, 0.3568628, 0, 1, 1,
0.6150244, -1.008459, 3.117311, 0.3607843, 0, 1, 1,
0.6177253, 0.895764, 0.105989, 0.3686275, 0, 1, 1,
0.6183512, -0.4679499, 1.273311, 0.372549, 0, 1, 1,
0.6191626, -0.8482071, 1.858104, 0.3803922, 0, 1, 1,
0.6196221, -1.30416, 1.955217, 0.3843137, 0, 1, 1,
0.6251446, 0.7597551, 0.4724188, 0.3921569, 0, 1, 1,
0.6266916, -0.8008151, 3.157582, 0.3960784, 0, 1, 1,
0.6277741, -0.4494213, 2.622292, 0.4039216, 0, 1, 1,
0.631346, -0.3002676, 0.4690427, 0.4117647, 0, 1, 1,
0.6321465, -0.8126755, 2.032298, 0.4156863, 0, 1, 1,
0.6324733, -1.16107, 0.8386144, 0.4235294, 0, 1, 1,
0.6327375, 0.6260221, 1.411777, 0.427451, 0, 1, 1,
0.6348446, 0.4318721, 0.5147149, 0.4352941, 0, 1, 1,
0.6389547, -1.211838, 4.791508, 0.4392157, 0, 1, 1,
0.6397805, 0.1289596, 0.9087181, 0.4470588, 0, 1, 1,
0.6428978, -0.4674438, 2.493934, 0.4509804, 0, 1, 1,
0.6433066, -0.131519, 0.01730894, 0.4588235, 0, 1, 1,
0.6496967, -0.4964388, 3.879711, 0.4627451, 0, 1, 1,
0.6525749, 0.9325199, 0.7893193, 0.4705882, 0, 1, 1,
0.6594017, -1.406286, 1.945037, 0.4745098, 0, 1, 1,
0.6600125, -1.331505, 1.535412, 0.4823529, 0, 1, 1,
0.6630571, 0.8688908, 0.6787879, 0.4862745, 0, 1, 1,
0.6646108, -0.6816656, 1.234566, 0.4941176, 0, 1, 1,
0.6690997, 0.7889096, 0.9312738, 0.5019608, 0, 1, 1,
0.6706824, 1.73293, 1.346468, 0.5058824, 0, 1, 1,
0.6711325, 1.747538, 0.8761096, 0.5137255, 0, 1, 1,
0.6726262, 0.7198315, 0.861785, 0.5176471, 0, 1, 1,
0.6768467, 0.1837955, 1.267474, 0.5254902, 0, 1, 1,
0.6790295, 2.285456, -0.5355545, 0.5294118, 0, 1, 1,
0.6806334, -0.5806923, 2.162415, 0.5372549, 0, 1, 1,
0.6810469, -1.042425, 2.108402, 0.5411765, 0, 1, 1,
0.6831447, 1.05099, 2.08503, 0.5490196, 0, 1, 1,
0.6833583, -1.021386, 1.756078, 0.5529412, 0, 1, 1,
0.6860943, 1.011414, -0.3935681, 0.5607843, 0, 1, 1,
0.6865351, 0.08832967, 0.03299515, 0.5647059, 0, 1, 1,
0.6866605, -0.4870433, 2.408643, 0.572549, 0, 1, 1,
0.6997799, -0.07392258, -0.07405883, 0.5764706, 0, 1, 1,
0.7004639, -0.1852222, 1.266546, 0.5843138, 0, 1, 1,
0.7132249, -0.8735371, 3.03756, 0.5882353, 0, 1, 1,
0.7139398, 0.7353191, 2.333998, 0.5960785, 0, 1, 1,
0.7144536, -2.605274, 3.243813, 0.6039216, 0, 1, 1,
0.7186429, -0.5299978, 2.787752, 0.6078432, 0, 1, 1,
0.7329586, -0.03396468, -0.271533, 0.6156863, 0, 1, 1,
0.7361092, 0.5685518, 0.6386374, 0.6196079, 0, 1, 1,
0.7526913, 1.100997, -1.353327, 0.627451, 0, 1, 1,
0.7619057, 0.7651487, 0.1295293, 0.6313726, 0, 1, 1,
0.762796, -0.7745122, 2.57525, 0.6392157, 0, 1, 1,
0.7642581, -0.2562182, 1.901523, 0.6431373, 0, 1, 1,
0.7726018, 0.2505992, 0.5063693, 0.6509804, 0, 1, 1,
0.7751402, 1.337892, 1.315552, 0.654902, 0, 1, 1,
0.7760523, -0.6251168, 2.540389, 0.6627451, 0, 1, 1,
0.7853202, -0.3736165, 1.165649, 0.6666667, 0, 1, 1,
0.7872125, 2.765211, 0.3842039, 0.6745098, 0, 1, 1,
0.7889125, 0.2258517, 1.328544, 0.6784314, 0, 1, 1,
0.7924527, 1.507016, -0.4591822, 0.6862745, 0, 1, 1,
0.7970264, 0.4842699, 2.702782, 0.6901961, 0, 1, 1,
0.7978987, 1.455887, -0.1031387, 0.6980392, 0, 1, 1,
0.800698, 0.8012244, 0.75568, 0.7058824, 0, 1, 1,
0.8202459, 1.162326, 1.301553, 0.7098039, 0, 1, 1,
0.8265858, 1.201137, 1.056206, 0.7176471, 0, 1, 1,
0.8301629, -0.2739032, 2.218955, 0.7215686, 0, 1, 1,
0.8302457, 1.858642, 1.304691, 0.7294118, 0, 1, 1,
0.8373469, 1.285102, 0.789226, 0.7333333, 0, 1, 1,
0.8412452, 0.09090794, 1.041549, 0.7411765, 0, 1, 1,
0.8440896, 1.369289, 0.4958877, 0.7450981, 0, 1, 1,
0.8481098, 0.05666171, 2.07653, 0.7529412, 0, 1, 1,
0.8486974, 0.2311417, -0.4717621, 0.7568628, 0, 1, 1,
0.8520735, 0.5850575, -0.1294877, 0.7647059, 0, 1, 1,
0.8533692, 0.3265707, -0.4673748, 0.7686275, 0, 1, 1,
0.8572746, -0.4083656, 1.310125, 0.7764706, 0, 1, 1,
0.8583476, 0.3785044, 1.427654, 0.7803922, 0, 1, 1,
0.859286, -1.030668, 2.12742, 0.7882353, 0, 1, 1,
0.8766634, 0.3686826, 1.612432, 0.7921569, 0, 1, 1,
0.8793921, 0.4099396, 0.2162686, 0.8, 0, 1, 1,
0.8795319, 1.092611, 0.00202825, 0.8078431, 0, 1, 1,
0.8815511, -0.03133405, 1.747809, 0.8117647, 0, 1, 1,
0.8831647, 0.5518674, 1.755508, 0.8196079, 0, 1, 1,
0.8874745, -1.028225, 1.130899, 0.8235294, 0, 1, 1,
0.8879454, 0.5607772, 0.6589486, 0.8313726, 0, 1, 1,
0.8902539, -0.7038549, 2.198858, 0.8352941, 0, 1, 1,
0.8913337, -1.282443, 2.137201, 0.8431373, 0, 1, 1,
0.9014342, 1.83047, 0.7711281, 0.8470588, 0, 1, 1,
0.9018719, -0.4663387, 2.914714, 0.854902, 0, 1, 1,
0.9094962, -0.9874546, 1.733666, 0.8588235, 0, 1, 1,
0.9107742, 0.9190767, 0.5442899, 0.8666667, 0, 1, 1,
0.9213539, -1.478962, 1.928295, 0.8705882, 0, 1, 1,
0.9255995, 0.5665743, 3.175588, 0.8784314, 0, 1, 1,
0.9284939, 0.3379941, -0.214093, 0.8823529, 0, 1, 1,
0.9323684, -1.380903, 3.162415, 0.8901961, 0, 1, 1,
0.9352522, 0.3591998, 2.94745, 0.8941177, 0, 1, 1,
0.9353203, -0.474907, 2.40625, 0.9019608, 0, 1, 1,
0.9363708, 0.09979562, 0.1626129, 0.9098039, 0, 1, 1,
0.9384155, 1.603922, -0.3252356, 0.9137255, 0, 1, 1,
0.9386096, 0.4471249, 1.216677, 0.9215686, 0, 1, 1,
0.943401, -0.6570287, 1.57313, 0.9254902, 0, 1, 1,
0.9464672, -1.308432, 3.26067, 0.9333333, 0, 1, 1,
0.9477155, -1.192918, 1.748493, 0.9372549, 0, 1, 1,
0.9486387, 0.1812942, 1.238746, 0.945098, 0, 1, 1,
0.9510776, 0.2945029, 1.405889, 0.9490196, 0, 1, 1,
0.9564084, -0.7368308, 2.142498, 0.9568627, 0, 1, 1,
0.9600607, 0.3931522, 0.1606431, 0.9607843, 0, 1, 1,
0.9641203, -1.136294, 1.261075, 0.9686275, 0, 1, 1,
0.9682351, -0.2300157, -0.2462296, 0.972549, 0, 1, 1,
0.9698239, -0.2207207, 0.657338, 0.9803922, 0, 1, 1,
0.9729804, 1.192444, -0.5020261, 0.9843137, 0, 1, 1,
0.9744278, -0.9459375, 3.304254, 0.9921569, 0, 1, 1,
0.9756017, 0.04675586, 1.892399, 0.9960784, 0, 1, 1,
0.9790877, -0.8620813, 3.276915, 1, 0, 0.9960784, 1,
0.9840419, -0.7293946, -0.09718748, 1, 0, 0.9882353, 1,
0.9849216, -0.01868243, 2.440438, 1, 0, 0.9843137, 1,
0.9881788, 0.1460348, 2.391747, 1, 0, 0.9764706, 1,
0.9934661, -1.531978, 1.839951, 1, 0, 0.972549, 1,
0.9956662, -0.2973143, 0.6481619, 1, 0, 0.9647059, 1,
0.9995626, 1.907479, 0.9906614, 1, 0, 0.9607843, 1,
1.004563, 0.4491516, 2.869677, 1, 0, 0.9529412, 1,
1.007192, -2.054471, 3.738601, 1, 0, 0.9490196, 1,
1.010211, -0.8678222, 2.031867, 1, 0, 0.9411765, 1,
1.013479, -0.6104856, 2.317296, 1, 0, 0.9372549, 1,
1.015688, 0.726513, 0.835067, 1, 0, 0.9294118, 1,
1.016763, -0.05683012, 1.755341, 1, 0, 0.9254902, 1,
1.021076, 0.9107291, 2.962556, 1, 0, 0.9176471, 1,
1.021582, -1.002924, 1.339103, 1, 0, 0.9137255, 1,
1.023411, 0.6625981, 0.8295147, 1, 0, 0.9058824, 1,
1.025101, 1.352266, 0.5530225, 1, 0, 0.9019608, 1,
1.029148, -0.07788641, 2.08512, 1, 0, 0.8941177, 1,
1.033594, -0.6856995, 3.34999, 1, 0, 0.8862745, 1,
1.036737, 0.6137438, 1.65839, 1, 0, 0.8823529, 1,
1.036762, -0.5184836, 2.231863, 1, 0, 0.8745098, 1,
1.037982, -0.3323701, 2.007445, 1, 0, 0.8705882, 1,
1.042274, 0.7745509, 1.195701, 1, 0, 0.8627451, 1,
1.049179, -1.954736, 2.655388, 1, 0, 0.8588235, 1,
1.050128, -1.579754, 3.161171, 1, 0, 0.8509804, 1,
1.050958, -0.4039527, 2.037064, 1, 0, 0.8470588, 1,
1.056298, -0.3728709, 2.596814, 1, 0, 0.8392157, 1,
1.06513, 0.07315729, 1.538584, 1, 0, 0.8352941, 1,
1.069023, 0.5651821, 1.749435, 1, 0, 0.827451, 1,
1.070338, -0.4710639, 0.4912452, 1, 0, 0.8235294, 1,
1.071522, -0.138109, 2.183659, 1, 0, 0.8156863, 1,
1.073128, -1.958482, 3.254473, 1, 0, 0.8117647, 1,
1.075684, 1.6121, -1.695226, 1, 0, 0.8039216, 1,
1.076327, -0.3905378, 2.310412, 1, 0, 0.7960784, 1,
1.084035, -0.8334153, 2.898864, 1, 0, 0.7921569, 1,
1.088935, -0.7698587, 1.473242, 1, 0, 0.7843137, 1,
1.097381, 0.7501131, 0.4808302, 1, 0, 0.7803922, 1,
1.105966, -0.04011198, 3.215285, 1, 0, 0.772549, 1,
1.116134, -0.2866367, 2.575561, 1, 0, 0.7686275, 1,
1.133447, -0.9438509, 2.450712, 1, 0, 0.7607843, 1,
1.146689, 0.5681254, 0.407934, 1, 0, 0.7568628, 1,
1.152778, 0.03596563, 2.673028, 1, 0, 0.7490196, 1,
1.163614, 0.3606522, 0.7088495, 1, 0, 0.7450981, 1,
1.16664, -0.6404409, 2.01654, 1, 0, 0.7372549, 1,
1.167142, 0.06588119, 2.126757, 1, 0, 0.7333333, 1,
1.173029, 0.6319553, 1.124864, 1, 0, 0.7254902, 1,
1.175115, -0.5352669, 1.719411, 1, 0, 0.7215686, 1,
1.175758, -0.5449016, 1.801875, 1, 0, 0.7137255, 1,
1.178946, 1.235515, 1.905208, 1, 0, 0.7098039, 1,
1.199071, -0.2652239, 3.212239, 1, 0, 0.7019608, 1,
1.21852, 0.5510602, -1.843732, 1, 0, 0.6941177, 1,
1.230767, 0.1183314, 1.467604, 1, 0, 0.6901961, 1,
1.237316, -0.4253551, 1.699679, 1, 0, 0.682353, 1,
1.237494, -0.6857935, 2.116276, 1, 0, 0.6784314, 1,
1.244096, 1.62189, -1.368471, 1, 0, 0.6705883, 1,
1.24609, 1.965221, 0.1786204, 1, 0, 0.6666667, 1,
1.24685, 0.795871, 2.410151, 1, 0, 0.6588235, 1,
1.248094, -0.9221981, 2.158901, 1, 0, 0.654902, 1,
1.249962, 1.598574, 0.8062965, 1, 0, 0.6470588, 1,
1.258542, -0.1966886, 1.33202, 1, 0, 0.6431373, 1,
1.258665, 0.3256662, -0.03761742, 1, 0, 0.6352941, 1,
1.262738, -0.3333696, 1.191166, 1, 0, 0.6313726, 1,
1.264361, 2.413201, 0.46841, 1, 0, 0.6235294, 1,
1.272935, -0.4237729, 1.647, 1, 0, 0.6196079, 1,
1.284929, 0.9481086, -0.24187, 1, 0, 0.6117647, 1,
1.287598, -1.343901, 2.760453, 1, 0, 0.6078432, 1,
1.290332, 1.392145, 0.4236682, 1, 0, 0.6, 1,
1.29326, 1.818738, 3.130581, 1, 0, 0.5921569, 1,
1.305252, 0.7011484, -0.137276, 1, 0, 0.5882353, 1,
1.306031, 1.097544, 2.424129, 1, 0, 0.5803922, 1,
1.308639, 0.6529086, 1.559989, 1, 0, 0.5764706, 1,
1.32119, -1.267115, 2.107715, 1, 0, 0.5686275, 1,
1.323529, 1.337299, -0.5530415, 1, 0, 0.5647059, 1,
1.324942, -0.6702699, 1.589947, 1, 0, 0.5568628, 1,
1.330709, -0.3049569, 2.374355, 1, 0, 0.5529412, 1,
1.330839, -0.391396, 2.522771, 1, 0, 0.5450981, 1,
1.331893, 0.6599354, 1.199861, 1, 0, 0.5411765, 1,
1.33273, 1.255207, 1.369339, 1, 0, 0.5333334, 1,
1.365673, -1.612723, 2.985265, 1, 0, 0.5294118, 1,
1.373944, -1.035923, 0.6422576, 1, 0, 0.5215687, 1,
1.381223, 1.513928, -0.1520337, 1, 0, 0.5176471, 1,
1.387922, -0.842556, 2.937762, 1, 0, 0.509804, 1,
1.390785, -0.250727, 1.868146, 1, 0, 0.5058824, 1,
1.401053, -0.4681703, 2.028664, 1, 0, 0.4980392, 1,
1.410274, 0.2908933, 1.614844, 1, 0, 0.4901961, 1,
1.417337, 0.001396942, 2.180772, 1, 0, 0.4862745, 1,
1.4218, 0.08600307, 1.888381, 1, 0, 0.4784314, 1,
1.423085, 0.4597863, 0.2206283, 1, 0, 0.4745098, 1,
1.434556, -0.1318043, 0.7719555, 1, 0, 0.4666667, 1,
1.4384, -0.9898033, 2.34549, 1, 0, 0.4627451, 1,
1.447151, 1.323472, 0.934014, 1, 0, 0.454902, 1,
1.447568, 0.8042099, 2.093324, 1, 0, 0.4509804, 1,
1.448088, -0.09788409, 1.395895, 1, 0, 0.4431373, 1,
1.460402, -1.326486, 2.534339, 1, 0, 0.4392157, 1,
1.460607, 0.7598359, 1.486179, 1, 0, 0.4313726, 1,
1.461035, -0.9352582, 0.4746159, 1, 0, 0.427451, 1,
1.461339, -1.176016, 2.99439, 1, 0, 0.4196078, 1,
1.463491, -1.317477, 2.813982, 1, 0, 0.4156863, 1,
1.465298, -1.082865, 2.582683, 1, 0, 0.4078431, 1,
1.486745, 1.152709, 0.5018212, 1, 0, 0.4039216, 1,
1.509047, 0.2740186, -0.8022764, 1, 0, 0.3960784, 1,
1.509977, -0.9702113, 3.516095, 1, 0, 0.3882353, 1,
1.525722, -1.503961, 0.7263916, 1, 0, 0.3843137, 1,
1.532843, 0.7096918, 1.008357, 1, 0, 0.3764706, 1,
1.537056, -2.036729, 1.570408, 1, 0, 0.372549, 1,
1.556714, -0.2261644, 2.875253, 1, 0, 0.3647059, 1,
1.562429, 1.03481, 2.160546, 1, 0, 0.3607843, 1,
1.569062, 0.1933937, 0.9590802, 1, 0, 0.3529412, 1,
1.571575, 0.2918342, 2.350054, 1, 0, 0.3490196, 1,
1.588589, 0.3593137, 2.124094, 1, 0, 0.3411765, 1,
1.592821, 0.233232, 0.8843682, 1, 0, 0.3372549, 1,
1.592936, 0.2124753, 1.140424, 1, 0, 0.3294118, 1,
1.598418, -1.825994, 0.8044945, 1, 0, 0.3254902, 1,
1.610335, 1.187216, 0.5380328, 1, 0, 0.3176471, 1,
1.616602, 0.9193708, -0.3083418, 1, 0, 0.3137255, 1,
1.621902, 1.110488, -1.76933, 1, 0, 0.3058824, 1,
1.624751, -1.031392, 1.514476, 1, 0, 0.2980392, 1,
1.630651, -0.3520532, 3.447942, 1, 0, 0.2941177, 1,
1.633224, -0.2837151, 0.9398666, 1, 0, 0.2862745, 1,
1.637984, -0.4361541, 2.505987, 1, 0, 0.282353, 1,
1.647947, 0.6055614, 1.269497, 1, 0, 0.2745098, 1,
1.657179, 0.4079849, 1.248703, 1, 0, 0.2705882, 1,
1.68132, -0.06200414, 0.8953869, 1, 0, 0.2627451, 1,
1.683731, 0.1372919, 1.279132, 1, 0, 0.2588235, 1,
1.700234, 0.4020533, 2.46782, 1, 0, 0.2509804, 1,
1.703385, 0.339539, 1.06382, 1, 0, 0.2470588, 1,
1.737013, -0.9659182, 2.994724, 1, 0, 0.2392157, 1,
1.756192, -0.525945, 3.536084, 1, 0, 0.2352941, 1,
1.764333, 0.04033295, 0.2645038, 1, 0, 0.227451, 1,
1.804335, -0.4798254, 0.9045181, 1, 0, 0.2235294, 1,
1.815087, 0.8416915, 0.2366428, 1, 0, 0.2156863, 1,
1.836843, -0.2354831, 1.293676, 1, 0, 0.2117647, 1,
1.855469, -0.3525938, 1.207674, 1, 0, 0.2039216, 1,
1.88833, 0.07428642, 0.3892157, 1, 0, 0.1960784, 1,
1.898821, -0.5473184, -0.3410839, 1, 0, 0.1921569, 1,
1.903677, 0.4940665, -0.3140824, 1, 0, 0.1843137, 1,
1.912971, 0.09089661, 1.011043, 1, 0, 0.1803922, 1,
1.921323, 0.01145579, 1.972858, 1, 0, 0.172549, 1,
1.946131, -0.3422056, 2.011099, 1, 0, 0.1686275, 1,
1.953597, -0.2005935, 3.224979, 1, 0, 0.1607843, 1,
2.053797, -0.655469, 2.154337, 1, 0, 0.1568628, 1,
2.061047, -0.1468883, 1.939922, 1, 0, 0.1490196, 1,
2.07164, 3.284262, 0.3325554, 1, 0, 0.145098, 1,
2.074484, 0.209485, 1.17174, 1, 0, 0.1372549, 1,
2.091679, -0.580504, 3.185592, 1, 0, 0.1333333, 1,
2.147753, 2.474329, 2.236218, 1, 0, 0.1254902, 1,
2.159446, -2.158419, 2.087925, 1, 0, 0.1215686, 1,
2.160392, -2.439514, 2.72583, 1, 0, 0.1137255, 1,
2.223219, 0.05800887, 1.354393, 1, 0, 0.1098039, 1,
2.254442, -0.776713, 1.380375, 1, 0, 0.1019608, 1,
2.276139, -1.504785, 3.38964, 1, 0, 0.09411765, 1,
2.283512, -1.691307, 1.260466, 1, 0, 0.09019608, 1,
2.346279, -1.775887, 1.13527, 1, 0, 0.08235294, 1,
2.377162, -0.6281811, 2.568966, 1, 0, 0.07843138, 1,
2.438787, 0.1610323, 1.075055, 1, 0, 0.07058824, 1,
2.445518, 0.7766604, 2.24453, 1, 0, 0.06666667, 1,
2.473403, 1.120439, 2.100478, 1, 0, 0.05882353, 1,
2.480441, -1.158198, 1.798491, 1, 0, 0.05490196, 1,
2.551522, -0.6456222, 0.8458814, 1, 0, 0.04705882, 1,
2.609965, 0.2839795, 0.2054973, 1, 0, 0.04313726, 1,
2.650293, -0.9225353, 1.268271, 1, 0, 0.03529412, 1,
2.765457, 0.2190168, 1.622945, 1, 0, 0.03137255, 1,
3.027869, 0.5594803, 2.375243, 1, 0, 0.02352941, 1,
3.027967, 0.9195302, 1.349133, 1, 0, 0.01960784, 1,
3.127535, 0.9155095, -0.08771811, 1, 0, 0.01176471, 1,
3.213779, 1.274523, 3.211252, 1, 0, 0.007843138, 1
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
-0.09778142, -3.797147, -6.765406, 0, -0.5, 0.5, 0.5,
-0.09778142, -3.797147, -6.765406, 1, -0.5, 0.5, 0.5,
-0.09778142, -3.797147, -6.765406, 1, 1.5, 0.5, 0.5,
-0.09778142, -3.797147, -6.765406, 0, 1.5, 0.5, 0.5
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
-4.531961, 0.6256334, -6.765406, 0, -0.5, 0.5, 0.5,
-4.531961, 0.6256334, -6.765406, 1, -0.5, 0.5, 0.5,
-4.531961, 0.6256334, -6.765406, 1, 1.5, 0.5, 0.5,
-4.531961, 0.6256334, -6.765406, 0, 1.5, 0.5, 0.5
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
-4.531961, -3.797147, 0.1894295, 0, -0.5, 0.5, 0.5,
-4.531961, -3.797147, 0.1894295, 1, -0.5, 0.5, 0.5,
-4.531961, -3.797147, 0.1894295, 1, 1.5, 0.5, 0.5,
-4.531961, -3.797147, 0.1894295, 0, 1.5, 0.5, 0.5
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
-3, -2.776505, -5.160443,
3, -2.776505, -5.160443,
-3, -2.776505, -5.160443,
-3, -2.946612, -5.427937,
-2, -2.776505, -5.160443,
-2, -2.946612, -5.427937,
-1, -2.776505, -5.160443,
-1, -2.946612, -5.427937,
0, -2.776505, -5.160443,
0, -2.946612, -5.427937,
1, -2.776505, -5.160443,
1, -2.946612, -5.427937,
2, -2.776505, -5.160443,
2, -2.946612, -5.427937,
3, -2.776505, -5.160443,
3, -2.946612, -5.427937
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
-3, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
-3, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
-3, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
-3, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
-2, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
-2, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
-2, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
-2, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
-1, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
-1, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
-1, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
-1, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
0, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
0, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
0, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
0, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
1, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
1, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
1, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
1, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
2, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
2, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
2, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
2, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5,
3, -3.286826, -5.962924, 0, -0.5, 0.5, 0.5,
3, -3.286826, -5.962924, 1, -0.5, 0.5, 0.5,
3, -3.286826, -5.962924, 1, 1.5, 0.5, 0.5,
3, -3.286826, -5.962924, 0, 1.5, 0.5, 0.5
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
-3.508689, -2, -5.160443,
-3.508689, 3, -5.160443,
-3.508689, -2, -5.160443,
-3.679234, -2, -5.427937,
-3.508689, -1, -5.160443,
-3.679234, -1, -5.427937,
-3.508689, 0, -5.160443,
-3.679234, 0, -5.427937,
-3.508689, 1, -5.160443,
-3.679234, 1, -5.427937,
-3.508689, 2, -5.160443,
-3.679234, 2, -5.427937,
-3.508689, 3, -5.160443,
-3.679234, 3, -5.427937
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
-4.020325, -2, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, -2, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, -2, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, -2, -5.962924, 0, 1.5, 0.5, 0.5,
-4.020325, -1, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, -1, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, -1, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, -1, -5.962924, 0, 1.5, 0.5, 0.5,
-4.020325, 0, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, 0, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, 0, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, 0, -5.962924, 0, 1.5, 0.5, 0.5,
-4.020325, 1, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, 1, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, 1, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, 1, -5.962924, 0, 1.5, 0.5, 0.5,
-4.020325, 2, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, 2, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, 2, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, 2, -5.962924, 0, 1.5, 0.5, 0.5,
-4.020325, 3, -5.962924, 0, -0.5, 0.5, 0.5,
-4.020325, 3, -5.962924, 1, -0.5, 0.5, 0.5,
-4.020325, 3, -5.962924, 1, 1.5, 0.5, 0.5,
-4.020325, 3, -5.962924, 0, 1.5, 0.5, 0.5
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
-3.508689, -2.776505, -4,
-3.508689, -2.776505, 4,
-3.508689, -2.776505, -4,
-3.679234, -2.946612, -4,
-3.508689, -2.776505, -2,
-3.679234, -2.946612, -2,
-3.508689, -2.776505, 0,
-3.679234, -2.946612, 0,
-3.508689, -2.776505, 2,
-3.679234, -2.946612, 2,
-3.508689, -2.776505, 4,
-3.679234, -2.946612, 4
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
-4.020325, -3.286826, -4, 0, -0.5, 0.5, 0.5,
-4.020325, -3.286826, -4, 1, -0.5, 0.5, 0.5,
-4.020325, -3.286826, -4, 1, 1.5, 0.5, 0.5,
-4.020325, -3.286826, -4, 0, 1.5, 0.5, 0.5,
-4.020325, -3.286826, -2, 0, -0.5, 0.5, 0.5,
-4.020325, -3.286826, -2, 1, -0.5, 0.5, 0.5,
-4.020325, -3.286826, -2, 1, 1.5, 0.5, 0.5,
-4.020325, -3.286826, -2, 0, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 0, 0, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 0, 1, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 0, 1, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 0, 0, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 2, 0, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 2, 1, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 2, 1, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 2, 0, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 4, 0, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 4, 1, -0.5, 0.5, 0.5,
-4.020325, -3.286826, 4, 1, 1.5, 0.5, 0.5,
-4.020325, -3.286826, 4, 0, 1.5, 0.5, 0.5
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
-3.508689, -2.776505, -5.160443,
-3.508689, 4.027772, -5.160443,
-3.508689, -2.776505, 5.539302,
-3.508689, 4.027772, 5.539302,
-3.508689, -2.776505, -5.160443,
-3.508689, -2.776505, 5.539302,
-3.508689, 4.027772, -5.160443,
-3.508689, 4.027772, 5.539302,
-3.508689, -2.776505, -5.160443,
3.313126, -2.776505, -5.160443,
-3.508689, -2.776505, 5.539302,
3.313126, -2.776505, 5.539302,
-3.508689, 4.027772, -5.160443,
3.313126, 4.027772, -5.160443,
-3.508689, 4.027772, 5.539302,
3.313126, 4.027772, 5.539302,
3.313126, -2.776505, -5.160443,
3.313126, 4.027772, -5.160443,
3.313126, -2.776505, 5.539302,
3.313126, 4.027772, 5.539302,
3.313126, -2.776505, -5.160443,
3.313126, -2.776505, 5.539302,
3.313126, 4.027772, -5.160443,
3.313126, 4.027772, 5.539302
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
var radius = 7.688577;
var distance = 34.20735;
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
mvMatrix.translate( 0.09778142, -0.6256334, -0.1894295 );
mvMatrix.scale( 1.218597, 1.221738, 0.7769381 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.20735);
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
pyridazine_N-oxide<-read.table("pyridazine_N-oxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridazine_N-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
```

```r
y<-pyridazine_N-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
```

```r
z<-pyridazine_N-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
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
-3.409342, -1.714535, -1.460835, 0, 0, 1, 1, 1,
-2.98786, 0.2261866, -1.293777, 1, 0, 0, 1, 1,
-2.886948, 0.1029972, -0.4349548, 1, 0, 0, 1, 1,
-2.767658, -2.004781, -1.808118, 1, 0, 0, 1, 1,
-2.733168, 0.1326779, -0.3595506, 1, 0, 0, 1, 1,
-2.727777, 0.08453102, -4.519918, 1, 0, 0, 1, 1,
-2.624834, 0.09969018, -2.568828, 0, 0, 0, 1, 1,
-2.527885, -1.834393, -3.848119, 0, 0, 0, 1, 1,
-2.360451, 1.153895, -1.131195, 0, 0, 0, 1, 1,
-2.336252, -0.1412786, -1.263973, 0, 0, 0, 1, 1,
-2.275495, -0.9449041, -2.254242, 0, 0, 0, 1, 1,
-2.270441, 0.1261763, 0.7630187, 0, 0, 0, 1, 1,
-2.247637, -1.362028, -1.73123, 0, 0, 0, 1, 1,
-2.241997, -0.1771613, -0.7500708, 1, 1, 1, 1, 1,
-2.21029, 0.5040215, -1.363284, 1, 1, 1, 1, 1,
-2.191357, -0.6050479, -2.116368, 1, 1, 1, 1, 1,
-2.170079, -0.5309727, -1.430023, 1, 1, 1, 1, 1,
-2.120587, 0.06491277, -0.4134035, 1, 1, 1, 1, 1,
-2.11963, 0.1075743, -2.181156, 1, 1, 1, 1, 1,
-2.103822, 0.2314173, 0.3383403, 1, 1, 1, 1, 1,
-2.094782, -0.1527997, -2.216094, 1, 1, 1, 1, 1,
-2.072467, 0.04235404, -2.124698, 1, 1, 1, 1, 1,
-2.051159, -0.7823743, -2.197384, 1, 1, 1, 1, 1,
-2.028707, -0.06633681, 0.2646841, 1, 1, 1, 1, 1,
-1.996688, 0.2379809, 0.7791609, 1, 1, 1, 1, 1,
-1.973685, 0.1061283, 0.444051, 1, 1, 1, 1, 1,
-1.963236, 0.5607608, -1.636213, 1, 1, 1, 1, 1,
-1.932413, 0.4795595, -0.5089955, 1, 1, 1, 1, 1,
-1.909004, 0.821694, -2.144685, 0, 0, 1, 1, 1,
-1.904925, 1.288803, 0.2298515, 1, 0, 0, 1, 1,
-1.895153, 0.7043926, -0.988126, 1, 0, 0, 1, 1,
-1.88247, -1.529227, -3.777436, 1, 0, 0, 1, 1,
-1.881604, -0.5016968, -0.6607046, 1, 0, 0, 1, 1,
-1.869978, 0.2860339, -1.825124, 1, 0, 0, 1, 1,
-1.86496, -1.307725, -2.739299, 0, 0, 0, 1, 1,
-1.862438, 1.108975, -0.01151314, 0, 0, 0, 1, 1,
-1.859846, 0.7416965, 0.7941791, 0, 0, 0, 1, 1,
-1.850003, -1.581858, -2.407602, 0, 0, 0, 1, 1,
-1.837333, 0.9357625, 0.05079801, 0, 0, 0, 1, 1,
-1.813439, 1.09277, 0.4661648, 0, 0, 0, 1, 1,
-1.797248, 0.8613024, -1.571395, 0, 0, 0, 1, 1,
-1.769919, 2.171999, 0.2745073, 1, 1, 1, 1, 1,
-1.759104, -0.1061194, -1.805159, 1, 1, 1, 1, 1,
-1.721917, 0.3696415, -1.892082, 1, 1, 1, 1, 1,
-1.707788, -1.328249, -0.6937857, 1, 1, 1, 1, 1,
-1.701936, -0.7802586, -2.285552, 1, 1, 1, 1, 1,
-1.698758, 0.1794978, -1.384888, 1, 1, 1, 1, 1,
-1.658534, 2.001226, -0.07170812, 1, 1, 1, 1, 1,
-1.639249, 0.0206367, -2.579384, 1, 1, 1, 1, 1,
-1.626066, 2.297848, -0.1369151, 1, 1, 1, 1, 1,
-1.611613, 1.135766, -1.094541, 1, 1, 1, 1, 1,
-1.61153, -0.6694923, -1.97267, 1, 1, 1, 1, 1,
-1.588197, 1.331581, -0.538559, 1, 1, 1, 1, 1,
-1.587561, -1.289139, -2.479183, 1, 1, 1, 1, 1,
-1.580161, -0.163069, -2.231506, 1, 1, 1, 1, 1,
-1.577031, 0.03159742, 0.5980554, 1, 1, 1, 1, 1,
-1.573894, -0.1503673, -0.9954792, 0, 0, 1, 1, 1,
-1.56876, 0.01870857, -1.805082, 1, 0, 0, 1, 1,
-1.551328, -0.6258054, -2.133366, 1, 0, 0, 1, 1,
-1.53561, -0.04511685, -1.784043, 1, 0, 0, 1, 1,
-1.530116, 0.5221335, 0.1580338, 1, 0, 0, 1, 1,
-1.525515, 1.126858, -0.7348518, 1, 0, 0, 1, 1,
-1.521809, -0.7621948, -1.994641, 0, 0, 0, 1, 1,
-1.516717, -0.4445708, -1.235096, 0, 0, 0, 1, 1,
-1.505606, -0.07643703, -3.284983, 0, 0, 0, 1, 1,
-1.505497, -0.02934533, -0.2224496, 0, 0, 0, 1, 1,
-1.505478, -0.2685117, -3.285833, 0, 0, 0, 1, 1,
-1.502101, -0.9553667, -2.592172, 0, 0, 0, 1, 1,
-1.498552, 1.747775, 0.3332326, 0, 0, 0, 1, 1,
-1.497983, 1.682739, -1.180913, 1, 1, 1, 1, 1,
-1.494044, -0.3504877, -0.7869374, 1, 1, 1, 1, 1,
-1.47412, 0.1750759, -3.323812, 1, 1, 1, 1, 1,
-1.470106, -0.9458553, -0.3636431, 1, 1, 1, 1, 1,
-1.461181, -0.3583546, -2.308402, 1, 1, 1, 1, 1,
-1.457142, -0.3313946, -2.059322, 1, 1, 1, 1, 1,
-1.448985, 0.1589355, -1.353445, 1, 1, 1, 1, 1,
-1.440082, 0.7671955, -0.363108, 1, 1, 1, 1, 1,
-1.437033, -0.6553482, -1.740722, 1, 1, 1, 1, 1,
-1.434559, 0.3959238, -1.381166, 1, 1, 1, 1, 1,
-1.43404, -0.427404, -0.3422596, 1, 1, 1, 1, 1,
-1.432634, -1.517762, -2.460287, 1, 1, 1, 1, 1,
-1.425879, -0.758171, -2.932795, 1, 1, 1, 1, 1,
-1.425788, 1.339969, -0.7410391, 1, 1, 1, 1, 1,
-1.424754, 0.960154, -0.7838808, 1, 1, 1, 1, 1,
-1.41963, -0.3213139, -1.272596, 0, 0, 1, 1, 1,
-1.418966, -0.3159492, -2.270819, 1, 0, 0, 1, 1,
-1.413093, -1.824253, -1.285149, 1, 0, 0, 1, 1,
-1.410001, 0.5648718, -0.04650334, 1, 0, 0, 1, 1,
-1.409714, 0.739127, -1.632629, 1, 0, 0, 1, 1,
-1.403221, -0.9260324, -1.927366, 1, 0, 0, 1, 1,
-1.399041, -0.433675, -1.617079, 0, 0, 0, 1, 1,
-1.396506, -1.238524, -2.570733, 0, 0, 0, 1, 1,
-1.373964, -0.05186052, 0.7074242, 0, 0, 0, 1, 1,
-1.366967, -1.427967, -1.989941, 0, 0, 0, 1, 1,
-1.364064, 0.116436, -1.339251, 0, 0, 0, 1, 1,
-1.361536, -2.086971, -0.8155411, 0, 0, 0, 1, 1,
-1.350531, -0.09314781, -2.313127, 0, 0, 0, 1, 1,
-1.321532, 2.177856, -0.9338081, 1, 1, 1, 1, 1,
-1.305483, 0.2162038, -1.698404, 1, 1, 1, 1, 1,
-1.304401, 1.307273, -1.531887, 1, 1, 1, 1, 1,
-1.304319, 0.2770494, -0.8083988, 1, 1, 1, 1, 1,
-1.29319, -1.770642, -3.72002, 1, 1, 1, 1, 1,
-1.282528, 0.9103649, -2.426611, 1, 1, 1, 1, 1,
-1.278019, 1.212463, -1.677342, 1, 1, 1, 1, 1,
-1.277888, 0.01827405, -3.415789, 1, 1, 1, 1, 1,
-1.27322, -0.7660587, -1.518353, 1, 1, 1, 1, 1,
-1.268923, 1.061593, -0.12362, 1, 1, 1, 1, 1,
-1.260094, -0.013167, -1.773349, 1, 1, 1, 1, 1,
-1.236138, 0.9160097, -0.2716813, 1, 1, 1, 1, 1,
-1.213441, -1.155539, -1.789536, 1, 1, 1, 1, 1,
-1.211957, -0.5897099, -1.691855, 1, 1, 1, 1, 1,
-1.211498, 1.441087, -2.315549, 1, 1, 1, 1, 1,
-1.201663, 2.358103, -1.502097, 0, 0, 1, 1, 1,
-1.20104, 0.6961188, -2.710499, 1, 0, 0, 1, 1,
-1.200229, 0.01397398, -1.644078, 1, 0, 0, 1, 1,
-1.19647, -1.334204, -4.791683, 1, 0, 0, 1, 1,
-1.187009, 0.09743771, -1.853496, 1, 0, 0, 1, 1,
-1.179229, -0.04503301, -0.1350787, 1, 0, 0, 1, 1,
-1.172229, 1.811622, 0.04302975, 0, 0, 0, 1, 1,
-1.169066, -1.225387, -0.6851779, 0, 0, 0, 1, 1,
-1.150734, -0.6378447, -2.058676, 0, 0, 0, 1, 1,
-1.147556, 2.306752, -0.1640473, 0, 0, 0, 1, 1,
-1.147431, -0.06427833, -0.1499369, 0, 0, 0, 1, 1,
-1.13709, -0.3586363, -1.377064, 0, 0, 0, 1, 1,
-1.132465, 0.9537856, -1.00291, 0, 0, 0, 1, 1,
-1.120046, -0.7601191, -2.345722, 1, 1, 1, 1, 1,
-1.117954, -2.283828, -2.216179, 1, 1, 1, 1, 1,
-1.117942, 0.4422485, -0.8141232, 1, 1, 1, 1, 1,
-1.117199, 2.111488, -2.189582, 1, 1, 1, 1, 1,
-1.110784, 0.4188724, -0.2875721, 1, 1, 1, 1, 1,
-1.108661, -0.4284737, -0.2734747, 1, 1, 1, 1, 1,
-1.1084, -0.6248592, 0.60471, 1, 1, 1, 1, 1,
-1.107532, -0.8949539, -1.862961, 1, 1, 1, 1, 1,
-1.095424, 0.2558996, -1.707716, 1, 1, 1, 1, 1,
-1.077337, -0.527603, -1.525385, 1, 1, 1, 1, 1,
-1.075205, -0.1219443, -1.082215, 1, 1, 1, 1, 1,
-1.066826, -0.6371918, -2.211745, 1, 1, 1, 1, 1,
-1.062843, -0.793376, 0.05123921, 1, 1, 1, 1, 1,
-1.05907, -0.577902, -2.206585, 1, 1, 1, 1, 1,
-1.057171, -0.4081657, -1.865106, 1, 1, 1, 1, 1,
-1.056909, -0.3567816, -2.060564, 0, 0, 1, 1, 1,
-1.053209, 1.119186, -0.9652852, 1, 0, 0, 1, 1,
-1.051204, 2.232467, -0.6718382, 1, 0, 0, 1, 1,
-1.035184, 0.701151, -0.6745721, 1, 0, 0, 1, 1,
-1.03387, -0.07086241, -1.603298, 1, 0, 0, 1, 1,
-1.033169, -1.106608, -2.364937, 1, 0, 0, 1, 1,
-1.025831, -1.541034, -3.021361, 0, 0, 0, 1, 1,
-1.020918, 0.964489, -1.615934, 0, 0, 0, 1, 1,
-1.019959, 0.6260644, -3.518166, 0, 0, 0, 1, 1,
-1.015483, 0.4143458, -0.7133423, 0, 0, 0, 1, 1,
-1.013034, 0.4741477, -0.4230591, 0, 0, 0, 1, 1,
-1.011512, 0.2405611, -1.642324, 0, 0, 0, 1, 1,
-1.00734, -0.4525495, -1.697374, 0, 0, 0, 1, 1,
-1.002547, 1.952368, -1.861836, 1, 1, 1, 1, 1,
-0.9790537, -0.2766163, -1.617044, 1, 1, 1, 1, 1,
-0.9760952, -0.5359846, -2.759368, 1, 1, 1, 1, 1,
-0.971375, 1.465751, -0.1079929, 1, 1, 1, 1, 1,
-0.9654902, -0.2317696, -0.2495789, 1, 1, 1, 1, 1,
-0.9624191, -0.33267, -3.493987, 1, 1, 1, 1, 1,
-0.9570904, 0.7225407, 1.340406, 1, 1, 1, 1, 1,
-0.9521732, -0.8017025, -2.191835, 1, 1, 1, 1, 1,
-0.9442046, 0.2838496, 0.3872376, 1, 1, 1, 1, 1,
-0.9397001, 0.9201925, 0.9948409, 1, 1, 1, 1, 1,
-0.934734, -0.7065423, -1.909432, 1, 1, 1, 1, 1,
-0.9343695, -0.1950064, -1.929103, 1, 1, 1, 1, 1,
-0.9294912, 0.3312787, 0.2381922, 1, 1, 1, 1, 1,
-0.9256616, 1.235243, -1.800913, 1, 1, 1, 1, 1,
-0.9184825, 0.3239844, -0.3874139, 1, 1, 1, 1, 1,
-0.9184794, -0.7889232, -2.581611, 0, 0, 1, 1, 1,
-0.9166301, -0.4367489, -2.358316, 1, 0, 0, 1, 1,
-0.9111579, -0.8098193, -2.121776, 1, 0, 0, 1, 1,
-0.9007917, -0.1089533, 0.742598, 1, 0, 0, 1, 1,
-0.8982236, -0.6616285, -3.056264, 1, 0, 0, 1, 1,
-0.8905487, -0.5853989, -0.4063789, 1, 0, 0, 1, 1,
-0.8807146, 0.5060837, -1.183684, 0, 0, 0, 1, 1,
-0.8799565, 0.2537208, -0.8941376, 0, 0, 0, 1, 1,
-0.8770777, 0.6160184, -0.7337365, 0, 0, 0, 1, 1,
-0.8688484, -0.560488, -1.386685, 0, 0, 0, 1, 1,
-0.8577861, 0.07016396, -2.373178, 0, 0, 0, 1, 1,
-0.8501626, -1.206574, -2.330888, 0, 0, 0, 1, 1,
-0.8500004, -1.360198, -2.846951, 0, 0, 0, 1, 1,
-0.8491323, -0.05365345, -2.724857, 1, 1, 1, 1, 1,
-0.8485584, -1.817968, -1.217989, 1, 1, 1, 1, 1,
-0.8458079, 0.8125984, -0.2038298, 1, 1, 1, 1, 1,
-0.8438792, 2.515479, 0.4569479, 1, 1, 1, 1, 1,
-0.8324709, 0.7274671, -1.418876, 1, 1, 1, 1, 1,
-0.8295226, -2.040194, -3.666331, 1, 1, 1, 1, 1,
-0.8291457, 0.8219581, -1.230611, 1, 1, 1, 1, 1,
-0.8290561, 0.2883223, -3.903743, 1, 1, 1, 1, 1,
-0.8220408, 0.6697254, -1.792205, 1, 1, 1, 1, 1,
-0.8173279, -0.1252944, -1.282432, 1, 1, 1, 1, 1,
-0.8168696, 0.972604, -0.5528958, 1, 1, 1, 1, 1,
-0.8150823, -0.4192128, -1.209795, 1, 1, 1, 1, 1,
-0.807655, -0.1906674, 0.9723685, 1, 1, 1, 1, 1,
-0.8071481, 0.003922687, -1.357945, 1, 1, 1, 1, 1,
-0.8039883, 2.537752, -2.008076, 1, 1, 1, 1, 1,
-0.7970603, 0.6512921, -1.055596, 0, 0, 1, 1, 1,
-0.7959896, 0.06342423, -3.12598, 1, 0, 0, 1, 1,
-0.7952511, 2.38419, -1.656188, 1, 0, 0, 1, 1,
-0.7945962, -1.982402, -2.49129, 1, 0, 0, 1, 1,
-0.7936152, -1.241217, -4.025161, 1, 0, 0, 1, 1,
-0.7902212, -0.4659384, -3.177471, 1, 0, 0, 1, 1,
-0.7867891, 0.2255649, -1.687465, 0, 0, 0, 1, 1,
-0.7852988, -0.5451046, -1.493706, 0, 0, 0, 1, 1,
-0.7802015, -0.8312352, -1.794864, 0, 0, 0, 1, 1,
-0.7796709, -1.053168, -2.88625, 0, 0, 0, 1, 1,
-0.7774999, 0.11546, -0.8488675, 0, 0, 0, 1, 1,
-0.7630836, 1.469996, -0.3438139, 0, 0, 0, 1, 1,
-0.7585386, 0.2737725, -2.823118, 0, 0, 0, 1, 1,
-0.7576632, 0.913432, -2.111131, 1, 1, 1, 1, 1,
-0.7511033, -0.03660179, -1.604527, 1, 1, 1, 1, 1,
-0.7484664, -0.445027, -3.146824, 1, 1, 1, 1, 1,
-0.7475187, 0.1689261, -2.926682, 1, 1, 1, 1, 1,
-0.746238, 1.55087, -0.2060984, 1, 1, 1, 1, 1,
-0.7431117, -0.6903528, -1.113165, 1, 1, 1, 1, 1,
-0.7423131, -2.357984, -3.683614, 1, 1, 1, 1, 1,
-0.7365029, -0.5959992, -3.324786, 1, 1, 1, 1, 1,
-0.7360818, 0.5415611, -1.589101, 1, 1, 1, 1, 1,
-0.7346809, 0.3484631, -0.9661942, 1, 1, 1, 1, 1,
-0.7314831, -1.10192, -1.720709, 1, 1, 1, 1, 1,
-0.7280197, 0.3378145, -0.01126266, 1, 1, 1, 1, 1,
-0.7276288, -0.5426227, -2.511621, 1, 1, 1, 1, 1,
-0.7276091, 0.6494343, -1.970066, 1, 1, 1, 1, 1,
-0.7255177, 1.469978, -0.4714194, 1, 1, 1, 1, 1,
-0.7180455, 0.1323009, -0.6255348, 0, 0, 1, 1, 1,
-0.7166604, -0.6794584, -2.384462, 1, 0, 0, 1, 1,
-0.698426, -0.6974608, -1.876478, 1, 0, 0, 1, 1,
-0.6943597, 0.3926468, -0.2676732, 1, 0, 0, 1, 1,
-0.6908202, 0.07988459, -1.624018, 1, 0, 0, 1, 1,
-0.6861449, -0.1556266, -1.228044, 1, 0, 0, 1, 1,
-0.681736, 3.728714, -0.4805038, 0, 0, 0, 1, 1,
-0.6812758, -0.2146385, -2.998732, 0, 0, 0, 1, 1,
-0.6775081, -0.7122052, -2.494143, 0, 0, 0, 1, 1,
-0.6754677, -0.7051718, -2.507898, 0, 0, 0, 1, 1,
-0.6738557, -0.7822222, -1.354465, 0, 0, 0, 1, 1,
-0.6691518, -0.03571727, -1.500279, 0, 0, 0, 1, 1,
-0.6666795, 0.2528221, -1.18808, 0, 0, 0, 1, 1,
-0.6656358, 0.8679014, 0.2553791, 1, 1, 1, 1, 1,
-0.6632314, 0.5899675, -1.933416, 1, 1, 1, 1, 1,
-0.6621678, -1.408506, -2.811838, 1, 1, 1, 1, 1,
-0.6580322, -0.2874267, -1.512943, 1, 1, 1, 1, 1,
-0.6542179, -1.188791, -3.931623, 1, 1, 1, 1, 1,
-0.644317, 2.028504, 0.4861812, 1, 1, 1, 1, 1,
-0.6430434, 2.687939, -1.358453, 1, 1, 1, 1, 1,
-0.6425533, 0.04658406, -3.697125, 1, 1, 1, 1, 1,
-0.6419625, 0.4323558, 0.7221193, 1, 1, 1, 1, 1,
-0.6369703, -0.7266396, -1.868479, 1, 1, 1, 1, 1,
-0.6340094, -0.6250507, -2.3849, 1, 1, 1, 1, 1,
-0.6337876, -0.6908419, -2.945201, 1, 1, 1, 1, 1,
-0.6325722, -1.264683, -2.710505, 1, 1, 1, 1, 1,
-0.6299325, -1.755706, -3.805872, 1, 1, 1, 1, 1,
-0.6255786, -0.8950208, -1.097339, 1, 1, 1, 1, 1,
-0.6245671, -1.087769, -2.841915, 0, 0, 1, 1, 1,
-0.623514, 1.561517, -1.357884, 1, 0, 0, 1, 1,
-0.6200052, 0.6409152, 0.221801, 1, 0, 0, 1, 1,
-0.6183959, -0.6253526, -1.77334, 1, 0, 0, 1, 1,
-0.6157745, 1.018333, -2.394037, 1, 0, 0, 1, 1,
-0.6153022, 0.7972432, -2.067894, 1, 0, 0, 1, 1,
-0.6137239, 0.1156776, -1.599544, 0, 0, 0, 1, 1,
-0.6094493, 0.1566504, -1.344458, 0, 0, 0, 1, 1,
-0.6088999, -0.2972804, -0.2456134, 0, 0, 0, 1, 1,
-0.6064858, 0.7075154, -0.1428361, 0, 0, 0, 1, 1,
-0.6016036, -0.1489141, -3.055052, 0, 0, 0, 1, 1,
-0.5979564, 0.3366844, -0.8067679, 0, 0, 0, 1, 1,
-0.595023, 0.8076936, -0.6508899, 0, 0, 0, 1, 1,
-0.5950109, -1.430744, -1.560444, 1, 1, 1, 1, 1,
-0.5894634, -2.121572, -2.905483, 1, 1, 1, 1, 1,
-0.5845474, 0.5494801, 0.1776468, 1, 1, 1, 1, 1,
-0.5805564, -1.889581, -2.348973, 1, 1, 1, 1, 1,
-0.5789418, 0.8445098, 0.6845607, 1, 1, 1, 1, 1,
-0.5730633, 1.217139, -1.190376, 1, 1, 1, 1, 1,
-0.5723345, -1.326349, -2.75929, 1, 1, 1, 1, 1,
-0.5678983, -1.434228, -3.087197, 1, 1, 1, 1, 1,
-0.5656889, 0.08614276, -0.7521774, 1, 1, 1, 1, 1,
-0.5599251, 0.334258, -1.698058, 1, 1, 1, 1, 1,
-0.5579324, 0.6554146, -1.818764, 1, 1, 1, 1, 1,
-0.5574133, 2.032684, -0.1199246, 1, 1, 1, 1, 1,
-0.5561827, -1.406143, -2.555809, 1, 1, 1, 1, 1,
-0.5486657, -0.2570611, -3.489578, 1, 1, 1, 1, 1,
-0.5467868, 1.351684, 1.477896, 1, 1, 1, 1, 1,
-0.5441745, -0.1562855, -1.310675, 0, 0, 1, 1, 1,
-0.5424794, 1.138817, -0.02413279, 1, 0, 0, 1, 1,
-0.5411755, 0.392707, -1.202015, 1, 0, 0, 1, 1,
-0.5373945, -1.287895, -3.103141, 1, 0, 0, 1, 1,
-0.534322, -0.1407849, -2.032549, 1, 0, 0, 1, 1,
-0.5330139, -0.2841063, -1.451149, 1, 0, 0, 1, 1,
-0.5321972, -0.2108869, -2.457719, 0, 0, 0, 1, 1,
-0.5251234, 0.4360293, 0.001146821, 0, 0, 0, 1, 1,
-0.5247277, 0.9150918, 0.6860633, 0, 0, 0, 1, 1,
-0.5227822, 1.529062, -0.2702788, 0, 0, 0, 1, 1,
-0.5196353, 0.959005, -0.3428852, 0, 0, 0, 1, 1,
-0.5190484, -0.2794472, -2.240409, 0, 0, 0, 1, 1,
-0.5176973, 0.5751895, -1.216424, 0, 0, 0, 1, 1,
-0.5109456, 0.6058999, -0.3555046, 1, 1, 1, 1, 1,
-0.5088087, 1.458826, 1.620263, 1, 1, 1, 1, 1,
-0.5078552, 0.298804, -0.7858537, 1, 1, 1, 1, 1,
-0.507418, -0.302238, -0.4091164, 1, 1, 1, 1, 1,
-0.5069548, 0.2064765, -1.407523, 1, 1, 1, 1, 1,
-0.5063421, -1.47309, -3.447703, 1, 1, 1, 1, 1,
-0.5032855, 0.4282644, -2.525324, 1, 1, 1, 1, 1,
-0.5026729, 1.079383, 0.08382127, 1, 1, 1, 1, 1,
-0.5015053, -0.5488242, -2.557134, 1, 1, 1, 1, 1,
-0.4970013, -0.4855314, -2.233877, 1, 1, 1, 1, 1,
-0.4957706, -1.382851, -2.224263, 1, 1, 1, 1, 1,
-0.4953714, 0.3995143, 0.3826523, 1, 1, 1, 1, 1,
-0.4953616, 1.521942, -0.3598531, 1, 1, 1, 1, 1,
-0.4902124, 0.191622, -1.192268, 1, 1, 1, 1, 1,
-0.4869606, 0.08302273, -1.709717, 1, 1, 1, 1, 1,
-0.4856685, -1.192356, -2.783391, 0, 0, 1, 1, 1,
-0.4809578, -0.3191285, -3.066921, 1, 0, 0, 1, 1,
-0.4750301, -0.7080534, -1.758616, 1, 0, 0, 1, 1,
-0.4741384, -1.790159, -5.004622, 1, 0, 0, 1, 1,
-0.4579277, 0.5596671, 0.2658931, 1, 0, 0, 1, 1,
-0.4501496, 0.1938237, 0.4257141, 1, 0, 0, 1, 1,
-0.4471284, -0.1804744, -4.807261, 0, 0, 0, 1, 1,
-0.4446303, 0.6709664, -0.4305348, 0, 0, 0, 1, 1,
-0.4433072, 0.005885761, -1.631569, 0, 0, 0, 1, 1,
-0.4431274, -0.8770297, -2.166075, 0, 0, 0, 1, 1,
-0.4393885, -1.200005, -2.625118, 0, 0, 0, 1, 1,
-0.429873, 0.1485947, -1.859958, 0, 0, 0, 1, 1,
-0.4284495, -0.03012096, -2.352538, 0, 0, 0, 1, 1,
-0.4258193, -0.2379699, -2.954543, 1, 1, 1, 1, 1,
-0.4243827, 1.248682, -0.03893579, 1, 1, 1, 1, 1,
-0.4175652, 0.0883641, -0.4586224, 1, 1, 1, 1, 1,
-0.4167617, -1.662152, -2.360166, 1, 1, 1, 1, 1,
-0.4132287, -0.6790593, -3.75948, 1, 1, 1, 1, 1,
-0.4129865, 1.791172, -1.832478, 1, 1, 1, 1, 1,
-0.4112819, -0.7359299, -4.225319, 1, 1, 1, 1, 1,
-0.409814, 1.023249, -1.012683, 1, 1, 1, 1, 1,
-0.4085588, 0.8463873, 0.6832158, 1, 1, 1, 1, 1,
-0.4080338, 1.121125, -0.08133185, 1, 1, 1, 1, 1,
-0.4023921, 2.15766, -0.6700258, 1, 1, 1, 1, 1,
-0.4005517, 1.096175, 0.6554162, 1, 1, 1, 1, 1,
-0.4000514, -0.7571529, -3.268273, 1, 1, 1, 1, 1,
-0.3956413, -1.052819, -2.216165, 1, 1, 1, 1, 1,
-0.3946308, 1.621118, 0.8785352, 1, 1, 1, 1, 1,
-0.3906288, 1.235121, -0.3381572, 0, 0, 1, 1, 1,
-0.3895463, 0.4619478, -1.332735, 1, 0, 0, 1, 1,
-0.389004, 0.849268, -1.560035, 1, 0, 0, 1, 1,
-0.37769, 1.827906, -0.1493058, 1, 0, 0, 1, 1,
-0.3770005, 3.92868, 1.244529, 1, 0, 0, 1, 1,
-0.3733152, -1.102534, -4.329784, 1, 0, 0, 1, 1,
-0.3727433, -0.8927034, -4.27065, 0, 0, 0, 1, 1,
-0.3726311, 0.5564337, -0.2598052, 0, 0, 0, 1, 1,
-0.3671556, -1.09827, -1.269733, 0, 0, 0, 1, 1,
-0.3655202, -1.470914, -1.406057, 0, 0, 0, 1, 1,
-0.3575388, 0.01623245, -1.266081, 0, 0, 0, 1, 1,
-0.3506791, -0.6496302, -1.658013, 0, 0, 0, 1, 1,
-0.3503831, -0.1114625, -1.511616, 0, 0, 0, 1, 1,
-0.3501332, -0.1795294, -0.9850811, 1, 1, 1, 1, 1,
-0.3497837, 0.4560071, -0.805275, 1, 1, 1, 1, 1,
-0.3464079, -0.6558381, -1.995374, 1, 1, 1, 1, 1,
-0.3444403, 0.2802717, -0.5902626, 1, 1, 1, 1, 1,
-0.3438742, -0.7463803, -2.072383, 1, 1, 1, 1, 1,
-0.3434699, 0.5177304, -0.400618, 1, 1, 1, 1, 1,
-0.3419863, 1.377071, 0.2111133, 1, 1, 1, 1, 1,
-0.3380136, -2.467522, -3.081293, 1, 1, 1, 1, 1,
-0.3367408, 0.5421519, -0.8484051, 1, 1, 1, 1, 1,
-0.336051, -2.098229, -3.520052, 1, 1, 1, 1, 1,
-0.3349659, 0.5948516, -0.9873566, 1, 1, 1, 1, 1,
-0.3342594, 0.02287628, -2.164985, 1, 1, 1, 1, 1,
-0.3337352, 0.3498486, -0.09689608, 1, 1, 1, 1, 1,
-0.332224, 0.2165874, -0.9794673, 1, 1, 1, 1, 1,
-0.3302355, -1.522081, -3.261258, 1, 1, 1, 1, 1,
-0.3244152, -0.8360921, -3.116321, 0, 0, 1, 1, 1,
-0.3167692, -1.037122, -2.709416, 1, 0, 0, 1, 1,
-0.3153993, -0.2673521, 0.02364322, 1, 0, 0, 1, 1,
-0.3145715, 1.39504, 0.415308, 1, 0, 0, 1, 1,
-0.3055747, 0.04352541, -1.139685, 1, 0, 0, 1, 1,
-0.301314, 0.2272841, 1.299121, 1, 0, 0, 1, 1,
-0.3011599, 1.172541, -0.7202383, 0, 0, 0, 1, 1,
-0.298181, -0.6742895, -1.758623, 0, 0, 0, 1, 1,
-0.2953776, -1.176732, -4.881952, 0, 0, 0, 1, 1,
-0.2950498, 0.6083003, -1.185432, 0, 0, 0, 1, 1,
-0.2933492, -0.3844246, -1.499566, 0, 0, 0, 1, 1,
-0.2923022, -0.5119344, -3.760984, 0, 0, 0, 1, 1,
-0.2859071, -0.8512694, -2.007085, 0, 0, 0, 1, 1,
-0.2851759, -0.5546135, -2.682374, 1, 1, 1, 1, 1,
-0.2811437, -0.06869249, -1.389721, 1, 1, 1, 1, 1,
-0.2783808, -0.8929167, -2.083304, 1, 1, 1, 1, 1,
-0.2706173, 0.1725173, -1.881388, 1, 1, 1, 1, 1,
-0.26793, -1.007164, -1.829555, 1, 1, 1, 1, 1,
-0.267549, -0.0460746, -0.6669711, 1, 1, 1, 1, 1,
-0.2673976, 2.106219, -0.7110357, 1, 1, 1, 1, 1,
-0.2629819, -0.3607673, -1.28268, 1, 1, 1, 1, 1,
-0.2616276, -0.8690988, -3.532783, 1, 1, 1, 1, 1,
-0.2572192, -1.98735, -1.224278, 1, 1, 1, 1, 1,
-0.2516538, -0.8084124, -3.337118, 1, 1, 1, 1, 1,
-0.2492676, -1.473141, -3.335952, 1, 1, 1, 1, 1,
-0.2466024, 0.8843229, 1.641991, 1, 1, 1, 1, 1,
-0.2459107, -0.5697305, -3.71169, 1, 1, 1, 1, 1,
-0.2345043, 0.1637653, -0.9064983, 1, 1, 1, 1, 1,
-0.2337453, -0.4752492, -2.929178, 0, 0, 1, 1, 1,
-0.2328529, 0.4006264, 0.5385411, 1, 0, 0, 1, 1,
-0.230478, 0.5009704, -1.482791, 1, 0, 0, 1, 1,
-0.2303562, 0.4786307, 0.176567, 1, 0, 0, 1, 1,
-0.2299581, -0.4612236, -3.80777, 1, 0, 0, 1, 1,
-0.2296795, 0.9598368, -0.5108695, 1, 0, 0, 1, 1,
-0.2291572, -1.80102, -2.833616, 0, 0, 0, 1, 1,
-0.226579, 0.007050337, -1.5894, 0, 0, 0, 1, 1,
-0.2256775, -0.5584652, -2.252023, 0, 0, 0, 1, 1,
-0.2256327, 0.9286928, 1.040053, 0, 0, 0, 1, 1,
-0.2250161, 1.199223, 0.3237486, 0, 0, 0, 1, 1,
-0.2230471, -0.07910174, -3.160728, 0, 0, 0, 1, 1,
-0.2220245, 0.3946511, -1.239419, 0, 0, 0, 1, 1,
-0.2219073, 0.006605495, -2.032849, 1, 1, 1, 1, 1,
-0.2179566, 0.176308, -2.73454, 1, 1, 1, 1, 1,
-0.2052907, -0.2772039, -0.6498663, 1, 1, 1, 1, 1,
-0.2047597, -0.5293071, -3.876291, 1, 1, 1, 1, 1,
-0.2039262, -0.5107415, -4.250058, 1, 1, 1, 1, 1,
-0.198958, 0.5962054, -1.465136, 1, 1, 1, 1, 1,
-0.198344, -0.6625422, -2.026889, 1, 1, 1, 1, 1,
-0.1941715, -2.236373, -1.584507, 1, 1, 1, 1, 1,
-0.1924308, -1.222793, -3.625279, 1, 1, 1, 1, 1,
-0.1907085, -0.4160628, -0.7150727, 1, 1, 1, 1, 1,
-0.1879253, -1.453006, -1.853096, 1, 1, 1, 1, 1,
-0.187336, -0.5405642, -2.647052, 1, 1, 1, 1, 1,
-0.1837798, 0.7502785, -0.05190659, 1, 1, 1, 1, 1,
-0.181381, -1.270488, -3.787873, 1, 1, 1, 1, 1,
-0.1796, 2.378786, -1.715067, 1, 1, 1, 1, 1,
-0.1785496, 1.178156, -0.3251273, 0, 0, 1, 1, 1,
-0.1751859, 1.32744, -0.4328314, 1, 0, 0, 1, 1,
-0.174689, -0.8316274, -1.744555, 1, 0, 0, 1, 1,
-0.1689017, -0.9429778, -3.719095, 1, 0, 0, 1, 1,
-0.1655518, 0.4198531, -0.1992018, 1, 0, 0, 1, 1,
-0.1619985, -0.02048175, -1.437275, 1, 0, 0, 1, 1,
-0.1613799, -0.09020118, -2.355125, 0, 0, 0, 1, 1,
-0.160093, -1.169899, -3.37286, 0, 0, 0, 1, 1,
-0.1590794, 0.6018577, -0.7402632, 0, 0, 0, 1, 1,
-0.1529901, -0.8618493, -1.304956, 0, 0, 0, 1, 1,
-0.1529893, -0.04794583, -1.838429, 0, 0, 0, 1, 1,
-0.1506057, 0.03305972, -1.20824, 0, 0, 0, 1, 1,
-0.1501603, 0.3724643, -1.577125, 0, 0, 0, 1, 1,
-0.1501141, 1.683045, -0.09642032, 1, 1, 1, 1, 1,
-0.1453351, 0.3139054, 2.025151, 1, 1, 1, 1, 1,
-0.1409944, -0.2242133, -2.865223, 1, 1, 1, 1, 1,
-0.1403099, 0.4388588, 0.8805861, 1, 1, 1, 1, 1,
-0.1359273, 0.7641121, 0.8369559, 1, 1, 1, 1, 1,
-0.1335139, 1.704188, 0.8582587, 1, 1, 1, 1, 1,
-0.1300419, -1.519669, -4.203744, 1, 1, 1, 1, 1,
-0.1298606, -0.2497108, -3.357518, 1, 1, 1, 1, 1,
-0.1292867, -2.677414, -1.489485, 1, 1, 1, 1, 1,
-0.1278759, 1.54245, -0.5193173, 1, 1, 1, 1, 1,
-0.1278076, -0.8019695, -2.07621, 1, 1, 1, 1, 1,
-0.1254425, 0.04290133, -0.8442605, 1, 1, 1, 1, 1,
-0.1251439, 0.5578583, -1.7659, 1, 1, 1, 1, 1,
-0.1226617, 0.9371822, 0.1332774, 1, 1, 1, 1, 1,
-0.1224068, -1.749626, -2.581689, 1, 1, 1, 1, 1,
-0.1181247, -0.4776122, -1.721797, 0, 0, 1, 1, 1,
-0.1146394, 1.842479, -1.122275, 1, 0, 0, 1, 1,
-0.1133963, 0.7798049, -0.135631, 1, 0, 0, 1, 1,
-0.1109653, -0.3185037, -3.935194, 1, 0, 0, 1, 1,
-0.1065178, -1.583126, -2.125023, 1, 0, 0, 1, 1,
-0.1063497, 0.5224689, 0.1786144, 1, 0, 0, 1, 1,
-0.1047251, 0.1505133, -2.142618, 0, 0, 0, 1, 1,
-0.1043057, -1.250087, -4.135592, 0, 0, 0, 1, 1,
-0.09166263, 0.04255389, 0.2274235, 0, 0, 0, 1, 1,
-0.09103473, 0.04127638, -0.3817103, 0, 0, 0, 1, 1,
-0.08975314, 0.3805741, 0.4680931, 0, 0, 0, 1, 1,
-0.08921681, -1.403316, -2.904089, 0, 0, 0, 1, 1,
-0.08629898, -0.3157277, -2.225996, 0, 0, 0, 1, 1,
-0.08619384, 2.576544, -1.120235, 1, 1, 1, 1, 1,
-0.08450035, -1.036031, -3.257965, 1, 1, 1, 1, 1,
-0.0790875, 1.81128, -1.092872, 1, 1, 1, 1, 1,
-0.07748512, -0.7104582, -3.122671, 1, 1, 1, 1, 1,
-0.07667542, 1.246775, 1.628221, 1, 1, 1, 1, 1,
-0.07597172, 0.5243315, -1.116527, 1, 1, 1, 1, 1,
-0.06524087, -0.06985497, -1.643572, 1, 1, 1, 1, 1,
-0.06465531, -1.170971, -2.751912, 1, 1, 1, 1, 1,
-0.06451032, -0.3375355, -3.695156, 1, 1, 1, 1, 1,
-0.06365076, 0.9469423, 0.2473677, 1, 1, 1, 1, 1,
-0.06121657, -0.7812923, -4.410364, 1, 1, 1, 1, 1,
-0.05985618, -0.9376182, -3.265416, 1, 1, 1, 1, 1,
-0.05470907, 0.5792365, 0.07891803, 1, 1, 1, 1, 1,
-0.04929801, -1.234709, -2.282719, 1, 1, 1, 1, 1,
-0.04245728, -0.6628962, -2.537111, 1, 1, 1, 1, 1,
-0.04196633, 0.4092813, -0.371739, 0, 0, 1, 1, 1,
-0.04102186, 1.703573, -0.7022126, 1, 0, 0, 1, 1,
-0.03469494, -0.2138946, -3.456805, 1, 0, 0, 1, 1,
-0.03460831, 0.186476, -0.6425657, 1, 0, 0, 1, 1,
-0.03299153, -0.02068145, -0.138279, 1, 0, 0, 1, 1,
-0.03253455, 1.179699, -0.1436573, 1, 0, 0, 1, 1,
-0.02920147, -1.154073, -2.17759, 0, 0, 0, 1, 1,
-0.02867938, 0.2282668, 0.936372, 0, 0, 0, 1, 1,
-0.02581482, 0.5522995, -0.2191779, 0, 0, 0, 1, 1,
-0.02492893, -0.7661144, -3.983659, 0, 0, 0, 1, 1,
-0.02413866, 0.11969, 1.232842, 0, 0, 0, 1, 1,
-0.02021516, -0.9529365, -2.160924, 0, 0, 0, 1, 1,
-0.02020423, -0.4569769, -4.225086, 0, 0, 0, 1, 1,
-0.01765046, -0.4603141, -3.682589, 1, 1, 1, 1, 1,
-0.01692091, -0.4554572, -4.440228, 1, 1, 1, 1, 1,
-0.004904536, 0.6103833, 0.1839362, 1, 1, 1, 1, 1,
-0.003748546, 0.6967413, 0.4102386, 1, 1, 1, 1, 1,
-0.002345651, -0.08218206, -3.402439, 1, 1, 1, 1, 1,
0.000826124, 1.510101, -0.3710522, 1, 1, 1, 1, 1,
0.00329394, -0.1114376, 2.601281, 1, 1, 1, 1, 1,
0.01107061, -0.9884856, 3.485338, 1, 1, 1, 1, 1,
0.01151295, -1.375979, 4.110943, 1, 1, 1, 1, 1,
0.01508912, 0.05880093, -0.7057243, 1, 1, 1, 1, 1,
0.01621254, 1.090649, -0.5024256, 1, 1, 1, 1, 1,
0.0202243, -0.7390389, 4.510201, 1, 1, 1, 1, 1,
0.02385021, 0.6195387, 1.310203, 1, 1, 1, 1, 1,
0.02422378, 1.644274, 0.9135699, 1, 1, 1, 1, 1,
0.03466409, 0.4061712, 1.675401, 1, 1, 1, 1, 1,
0.03996785, 0.3230123, 1.684801, 0, 0, 1, 1, 1,
0.04385061, 0.08107323, 2.821338, 1, 0, 0, 1, 1,
0.04433169, -0.4167018, 1.420499, 1, 0, 0, 1, 1,
0.0489627, -0.2432549, 2.161784, 1, 0, 0, 1, 1,
0.05017252, 0.7904146, 1.546728, 1, 0, 0, 1, 1,
0.05034765, 0.8947854, -1.286197, 1, 0, 0, 1, 1,
0.05156187, 0.3698701, -1.402195, 0, 0, 0, 1, 1,
0.0558407, -1.920706, 2.833851, 0, 0, 0, 1, 1,
0.06026328, -1.808157, 3.39024, 0, 0, 0, 1, 1,
0.06055541, -1.071793, 3.011636, 0, 0, 0, 1, 1,
0.06089605, 1.403188, -1.012443, 0, 0, 0, 1, 1,
0.07190669, 0.4319832, -0.007517644, 0, 0, 0, 1, 1,
0.07371431, -1.670493, 3.025431, 0, 0, 0, 1, 1,
0.07784936, 0.6155866, 0.1699366, 1, 1, 1, 1, 1,
0.0783847, -0.853177, 3.044236, 1, 1, 1, 1, 1,
0.08431736, 3.250963, 0.1970981, 1, 1, 1, 1, 1,
0.08448042, -0.7124614, 1.754994, 1, 1, 1, 1, 1,
0.09408616, 0.07216481, 0.01189583, 1, 1, 1, 1, 1,
0.09898452, 1.130062, 0.03093888, 1, 1, 1, 1, 1,
0.1069203, -1.149161, 3.095483, 1, 1, 1, 1, 1,
0.1140592, 0.2838287, 1.302065, 1, 1, 1, 1, 1,
0.1144611, -0.9355497, 3.88925, 1, 1, 1, 1, 1,
0.1204367, 0.1988125, 1.733791, 1, 1, 1, 1, 1,
0.1212769, -1.243481, 3.057304, 1, 1, 1, 1, 1,
0.1215017, -0.9643423, 2.579297, 1, 1, 1, 1, 1,
0.1232317, 0.4577354, 1.610519, 1, 1, 1, 1, 1,
0.1273039, 0.1137225, 1.281854, 1, 1, 1, 1, 1,
0.1281775, 0.4683037, -1.524538, 1, 1, 1, 1, 1,
0.1306813, -2.264799, 2.396331, 0, 0, 1, 1, 1,
0.1308607, 0.4578781, 1.350442, 1, 0, 0, 1, 1,
0.1317597, -0.502124, 1.435798, 1, 0, 0, 1, 1,
0.1368322, 0.1394409, -0.6278663, 1, 0, 0, 1, 1,
0.1370649, -0.8231959, 4.562364, 1, 0, 0, 1, 1,
0.1389541, -1.281024, 2.945709, 1, 0, 0, 1, 1,
0.1431828, 0.780604, 0.4985505, 0, 0, 0, 1, 1,
0.1441164, 1.391884, 1.231782, 0, 0, 0, 1, 1,
0.1497415, 0.7494483, 0.4401196, 0, 0, 0, 1, 1,
0.1507127, 0.2406964, -1.03906, 0, 0, 0, 1, 1,
0.1537352, 0.9253233, 0.5648827, 0, 0, 0, 1, 1,
0.1560057, -0.3505679, 1.335744, 0, 0, 0, 1, 1,
0.156281, 0.5061398, -0.336403, 0, 0, 0, 1, 1,
0.1590436, -0.05701754, 1.016602, 1, 1, 1, 1, 1,
0.1595784, 0.7445161, 1.074467, 1, 1, 1, 1, 1,
0.1641506, -0.1280895, 3.304082, 1, 1, 1, 1, 1,
0.1664865, 2.618349, 0.275955, 1, 1, 1, 1, 1,
0.1673376, 0.0559659, 1.2929, 1, 1, 1, 1, 1,
0.16741, 1.949785, 0.5442187, 1, 1, 1, 1, 1,
0.1743048, -2.218116, 1.599136, 1, 1, 1, 1, 1,
0.1782452, -1.103657, 2.705136, 1, 1, 1, 1, 1,
0.1787964, -1.719294, 2.515266, 1, 1, 1, 1, 1,
0.1804437, -0.6924453, 3.866618, 1, 1, 1, 1, 1,
0.1905614, 0.08666763, 0.9285547, 1, 1, 1, 1, 1,
0.1909329, 2.46192, 1.90399, 1, 1, 1, 1, 1,
0.1933386, 0.9625674, 0.9415467, 1, 1, 1, 1, 1,
0.1935955, 0.01370779, 0.8724768, 1, 1, 1, 1, 1,
0.1951781, -0.297977, 2.171534, 1, 1, 1, 1, 1,
0.1960172, 0.2812804, -1.815489, 0, 0, 1, 1, 1,
0.1961398, -2.00002, 5.383481, 1, 0, 0, 1, 1,
0.1972366, 0.5048892, 0.8689986, 1, 0, 0, 1, 1,
0.203983, 0.4339918, 2.478226, 1, 0, 0, 1, 1,
0.2097149, 1.209081, 0.9718498, 1, 0, 0, 1, 1,
0.2119413, -1.217727, 3.644427, 1, 0, 0, 1, 1,
0.2139876, 0.869435, 0.8841986, 0, 0, 0, 1, 1,
0.2173689, -0.1786781, 3.948745, 0, 0, 0, 1, 1,
0.2205673, 0.3851613, -0.9502897, 0, 0, 0, 1, 1,
0.2225219, -2.14824, 3.323247, 0, 0, 0, 1, 1,
0.2229103, -0.268066, 2.884143, 0, 0, 0, 1, 1,
0.2241583, 0.9461521, 0.2496246, 0, 0, 0, 1, 1,
0.2242958, -0.59479, 1.346207, 0, 0, 0, 1, 1,
0.2294562, -1.085749, 2.768777, 1, 1, 1, 1, 1,
0.2316949, -0.8651231, 2.251271, 1, 1, 1, 1, 1,
0.2359377, 0.9401996, 1.152882, 1, 1, 1, 1, 1,
0.2380977, 0.6377184, 0.5586804, 1, 1, 1, 1, 1,
0.2408999, 0.1416403, 0.4663638, 1, 1, 1, 1, 1,
0.2421814, -0.7493167, 2.145741, 1, 1, 1, 1, 1,
0.2452223, -2.037732, 2.573459, 1, 1, 1, 1, 1,
0.2513728, -1.417686, 3.650379, 1, 1, 1, 1, 1,
0.251673, -0.1531832, 0.351925, 1, 1, 1, 1, 1,
0.2517583, -0.2287557, 4.018091, 1, 1, 1, 1, 1,
0.2523028, -0.5062199, 2.831274, 1, 1, 1, 1, 1,
0.2567023, 0.5766749, 0.1872885, 1, 1, 1, 1, 1,
0.2602696, -0.3677096, 1.55204, 1, 1, 1, 1, 1,
0.2634628, 1.694714, 0.343172, 1, 1, 1, 1, 1,
0.2642493, 0.3780755, 1.943606, 1, 1, 1, 1, 1,
0.2647329, -0.6570573, 1.667407, 0, 0, 1, 1, 1,
0.2682097, 0.4993716, 0.3139777, 1, 0, 0, 1, 1,
0.2733743, -0.0308464, 0.004808119, 1, 0, 0, 1, 1,
0.2751452, -1.615763, 3.714246, 1, 0, 0, 1, 1,
0.2762364, -0.884886, 3.175606, 1, 0, 0, 1, 1,
0.2773644, -1.457852, 2.603357, 1, 0, 0, 1, 1,
0.2819942, 1.807824, 0.3140752, 0, 0, 0, 1, 1,
0.2821458, -0.2270265, 1.331863, 0, 0, 0, 1, 1,
0.2828231, -0.1990549, 2.082633, 0, 0, 0, 1, 1,
0.2858523, 1.448309, -0.4111589, 0, 0, 0, 1, 1,
0.2866926, -1.28904, 2.72193, 0, 0, 0, 1, 1,
0.2883548, -0.3387322, 2.017964, 0, 0, 0, 1, 1,
0.2885937, -0.2869892, 3.090587, 0, 0, 0, 1, 1,
0.2887866, -0.3813928, 3.538728, 1, 1, 1, 1, 1,
0.2915746, 1.643365, -0.7270926, 1, 1, 1, 1, 1,
0.2948815, -0.03098238, -0.3038934, 1, 1, 1, 1, 1,
0.2952812, 0.9903882, 0.9240486, 1, 1, 1, 1, 1,
0.2983254, -1.02234, 4.198723, 1, 1, 1, 1, 1,
0.307174, 1.121172, 0.7131862, 1, 1, 1, 1, 1,
0.3071992, 1.309266, -0.01735579, 1, 1, 1, 1, 1,
0.3075461, -0.9926584, 1.828819, 1, 1, 1, 1, 1,
0.3095932, 0.1740676, 1.848146, 1, 1, 1, 1, 1,
0.310035, 0.5234276, 0.2598023, 1, 1, 1, 1, 1,
0.3179694, 0.2574395, 0.8090039, 1, 1, 1, 1, 1,
0.3182765, -0.4120208, 3.213006, 1, 1, 1, 1, 1,
0.3184243, 1.601991, -1.412403, 1, 1, 1, 1, 1,
0.319443, 0.1437266, 1.459583, 1, 1, 1, 1, 1,
0.3213594, 0.3552441, 2.203623, 1, 1, 1, 1, 1,
0.3225728, 0.6140529, 0.7896826, 0, 0, 1, 1, 1,
0.3282488, 1.106866, 1.360869, 1, 0, 0, 1, 1,
0.3338294, -0.8158225, 1.657128, 1, 0, 0, 1, 1,
0.3401956, 1.392833, 0.3353099, 1, 0, 0, 1, 1,
0.3414599, -1.037482, 2.882279, 1, 0, 0, 1, 1,
0.3456264, -0.2026606, 1.039683, 1, 0, 0, 1, 1,
0.3478141, 0.6845028, 0.5534313, 0, 0, 0, 1, 1,
0.3481704, -1.615431, 2.768841, 0, 0, 0, 1, 1,
0.3494423, -1.604224, 5.142832, 0, 0, 0, 1, 1,
0.3494555, 0.890431, -0.1938501, 0, 0, 0, 1, 1,
0.3517443, -0.1561907, 1.239998, 0, 0, 0, 1, 1,
0.3525979, -1.398188, 0.06448943, 0, 0, 0, 1, 1,
0.3527678, -1.514516, 1.269935, 0, 0, 0, 1, 1,
0.3542707, 3.039603, 1.310388, 1, 1, 1, 1, 1,
0.3551039, 0.2212088, 1.120105, 1, 1, 1, 1, 1,
0.3552583, 1.39914, 0.2564615, 1, 1, 1, 1, 1,
0.3588392, 1.176642, 0.3977797, 1, 1, 1, 1, 1,
0.3651685, -1.129947, 2.064695, 1, 1, 1, 1, 1,
0.3686662, -0.09174386, 2.836107, 1, 1, 1, 1, 1,
0.3692735, -1.533754, 2.521985, 1, 1, 1, 1, 1,
0.3721235, -0.2263489, 3.065262, 1, 1, 1, 1, 1,
0.3724522, 0.8037053, 1.05267, 1, 1, 1, 1, 1,
0.3746243, 0.2473534, 0.7672006, 1, 1, 1, 1, 1,
0.3746668, -1.80804, 2.521797, 1, 1, 1, 1, 1,
0.3748604, 0.5722399, 1.846152, 1, 1, 1, 1, 1,
0.3772227, 0.3336299, 0.1336801, 1, 1, 1, 1, 1,
0.3780994, 0.8954633, 1.227793, 1, 1, 1, 1, 1,
0.3795795, -0.1680188, 1.433084, 1, 1, 1, 1, 1,
0.3805513, -1.39063, 3.003441, 0, 0, 1, 1, 1,
0.3811596, -0.1880204, 1.694523, 1, 0, 0, 1, 1,
0.3834327, 0.8547103, -0.830603, 1, 0, 0, 1, 1,
0.3932759, 2.89901, -0.3549514, 1, 0, 0, 1, 1,
0.3955663, -1.141293, 2.414212, 1, 0, 0, 1, 1,
0.3981174, -0.5573433, 2.132303, 1, 0, 0, 1, 1,
0.3993596, 1.199051, -0.5997207, 0, 0, 0, 1, 1,
0.4002024, -0.4020397, 2.70909, 0, 0, 0, 1, 1,
0.4005172, 0.09270097, 0.7532029, 0, 0, 0, 1, 1,
0.400627, -0.2580896, 1.688958, 0, 0, 0, 1, 1,
0.4024693, -0.3998849, 2.832828, 0, 0, 0, 1, 1,
0.4064343, 0.319268, 1.215039, 0, 0, 0, 1, 1,
0.4100946, 0.3734828, 0.1487788, 0, 0, 0, 1, 1,
0.4131067, 0.4770967, 0.4346876, 1, 1, 1, 1, 1,
0.4179124, 0.04558754, 2.060596, 1, 1, 1, 1, 1,
0.4210497, -0.2363486, 1.427749, 1, 1, 1, 1, 1,
0.4242892, 0.5141738, -0.277417, 1, 1, 1, 1, 1,
0.4274465, 0.1092162, 2.024357, 1, 1, 1, 1, 1,
0.4324186, 2.269248, -0.7280032, 1, 1, 1, 1, 1,
0.4325043, 0.2028791, 1.500646, 1, 1, 1, 1, 1,
0.4340307, 0.6590319, 2.436844, 1, 1, 1, 1, 1,
0.435074, 1.162564, -1.83126, 1, 1, 1, 1, 1,
0.4531118, 0.1798528, 1.665047, 1, 1, 1, 1, 1,
0.4587774, -0.6142042, 1.604881, 1, 1, 1, 1, 1,
0.4604856, 1.252314, 0.3058118, 1, 1, 1, 1, 1,
0.4613214, -1.002281, 1.959759, 1, 1, 1, 1, 1,
0.463961, 0.8337787, 0.5708885, 1, 1, 1, 1, 1,
0.465715, -1.328858, 3.431103, 1, 1, 1, 1, 1,
0.4666921, -0.7238193, 4.08974, 0, 0, 1, 1, 1,
0.4683106, -1.422678, 2.502555, 1, 0, 0, 1, 1,
0.4698956, -0.09471403, 1.227414, 1, 0, 0, 1, 1,
0.4723058, -1.622585, 3.930313, 1, 0, 0, 1, 1,
0.4724691, 0.05805075, 2.528679, 1, 0, 0, 1, 1,
0.4766365, 0.6762611, 0.1094882, 1, 0, 0, 1, 1,
0.4797733, 0.9800913, -0.0432017, 0, 0, 0, 1, 1,
0.4822486, -1.232886, 2.215513, 0, 0, 0, 1, 1,
0.4823849, 1.794363, -0.4218802, 0, 0, 0, 1, 1,
0.4826059, 1.114376, 1.441943, 0, 0, 0, 1, 1,
0.4933605, -0.5947186, 2.741096, 0, 0, 0, 1, 1,
0.498825, 1.244026, 0.8995993, 0, 0, 0, 1, 1,
0.5018276, -1.263144, 3.469303, 0, 0, 0, 1, 1,
0.5021535, -0.1323076, 1.833381, 1, 1, 1, 1, 1,
0.5034803, 0.6947582, -0.4461211, 1, 1, 1, 1, 1,
0.5045989, 1.234641, 1.065123, 1, 1, 1, 1, 1,
0.5110421, 1.195805, 0.2495804, 1, 1, 1, 1, 1,
0.5156317, 0.2565828, 0.2627268, 1, 1, 1, 1, 1,
0.5156463, -0.5258302, 2.336286, 1, 1, 1, 1, 1,
0.515736, -0.6626838, 1.790738, 1, 1, 1, 1, 1,
0.5162358, 0.1304603, 0.4160778, 1, 1, 1, 1, 1,
0.5180319, -0.1667873, 1.636738, 1, 1, 1, 1, 1,
0.519161, 0.5266951, 1.272251, 1, 1, 1, 1, 1,
0.5209048, 0.9988251, -1.005074, 1, 1, 1, 1, 1,
0.5216628, -0.1082069, 1.747037, 1, 1, 1, 1, 1,
0.5221376, -0.1344849, 1.290922, 1, 1, 1, 1, 1,
0.5224515, -0.2849186, 3.634624, 1, 1, 1, 1, 1,
0.5263625, -0.6873165, 1.744215, 1, 1, 1, 1, 1,
0.5289428, 1.63631, 0.87994, 0, 0, 1, 1, 1,
0.5304695, -1.575674, 3.348006, 1, 0, 0, 1, 1,
0.532064, -0.3338152, 1.760551, 1, 0, 0, 1, 1,
0.5330312, 0.2513878, -0.5539347, 1, 0, 0, 1, 1,
0.5331937, 0.332303, 1.365191, 1, 0, 0, 1, 1,
0.5356132, -0.7627113, 2.675408, 1, 0, 0, 1, 1,
0.5370688, -1.163153, 3.19988, 0, 0, 0, 1, 1,
0.5421267, 0.8628209, -0.9888114, 0, 0, 0, 1, 1,
0.5514035, -0.2498592, 0.7204524, 0, 0, 0, 1, 1,
0.5531843, 0.2566855, 0.9687184, 0, 0, 0, 1, 1,
0.5586081, 3.049601, -0.4916196, 0, 0, 0, 1, 1,
0.559624, -1.230463, 1.852832, 0, 0, 0, 1, 1,
0.5640399, 0.5691493, -1.814168, 0, 0, 0, 1, 1,
0.564935, -0.3916566, 3.170224, 1, 1, 1, 1, 1,
0.5698555, 0.61395, -0.9278834, 1, 1, 1, 1, 1,
0.5748692, 0.2628011, 1.057512, 1, 1, 1, 1, 1,
0.5772365, 0.5602082, 0.06279174, 1, 1, 1, 1, 1,
0.5868417, -1.417573, 3.235123, 1, 1, 1, 1, 1,
0.591873, 0.1354466, 2.543421, 1, 1, 1, 1, 1,
0.5930098, -0.7694039, 1.583758, 1, 1, 1, 1, 1,
0.593014, 0.9863057, -0.8809339, 1, 1, 1, 1, 1,
0.5962397, -0.3878861, 3.125814, 1, 1, 1, 1, 1,
0.5973279, 0.7595403, 1.208381, 1, 1, 1, 1, 1,
0.6064098, -0.004161216, 1.449875, 1, 1, 1, 1, 1,
0.6072356, -0.9288439, 3.263295, 1, 1, 1, 1, 1,
0.6097468, -0.3723795, 1.997665, 1, 1, 1, 1, 1,
0.6110639, 0.2245745, 0.9179492, 1, 1, 1, 1, 1,
0.6150244, -1.008459, 3.117311, 1, 1, 1, 1, 1,
0.6177253, 0.895764, 0.105989, 0, 0, 1, 1, 1,
0.6183512, -0.4679499, 1.273311, 1, 0, 0, 1, 1,
0.6191626, -0.8482071, 1.858104, 1, 0, 0, 1, 1,
0.6196221, -1.30416, 1.955217, 1, 0, 0, 1, 1,
0.6251446, 0.7597551, 0.4724188, 1, 0, 0, 1, 1,
0.6266916, -0.8008151, 3.157582, 1, 0, 0, 1, 1,
0.6277741, -0.4494213, 2.622292, 0, 0, 0, 1, 1,
0.631346, -0.3002676, 0.4690427, 0, 0, 0, 1, 1,
0.6321465, -0.8126755, 2.032298, 0, 0, 0, 1, 1,
0.6324733, -1.16107, 0.8386144, 0, 0, 0, 1, 1,
0.6327375, 0.6260221, 1.411777, 0, 0, 0, 1, 1,
0.6348446, 0.4318721, 0.5147149, 0, 0, 0, 1, 1,
0.6389547, -1.211838, 4.791508, 0, 0, 0, 1, 1,
0.6397805, 0.1289596, 0.9087181, 1, 1, 1, 1, 1,
0.6428978, -0.4674438, 2.493934, 1, 1, 1, 1, 1,
0.6433066, -0.131519, 0.01730894, 1, 1, 1, 1, 1,
0.6496967, -0.4964388, 3.879711, 1, 1, 1, 1, 1,
0.6525749, 0.9325199, 0.7893193, 1, 1, 1, 1, 1,
0.6594017, -1.406286, 1.945037, 1, 1, 1, 1, 1,
0.6600125, -1.331505, 1.535412, 1, 1, 1, 1, 1,
0.6630571, 0.8688908, 0.6787879, 1, 1, 1, 1, 1,
0.6646108, -0.6816656, 1.234566, 1, 1, 1, 1, 1,
0.6690997, 0.7889096, 0.9312738, 1, 1, 1, 1, 1,
0.6706824, 1.73293, 1.346468, 1, 1, 1, 1, 1,
0.6711325, 1.747538, 0.8761096, 1, 1, 1, 1, 1,
0.6726262, 0.7198315, 0.861785, 1, 1, 1, 1, 1,
0.6768467, 0.1837955, 1.267474, 1, 1, 1, 1, 1,
0.6790295, 2.285456, -0.5355545, 1, 1, 1, 1, 1,
0.6806334, -0.5806923, 2.162415, 0, 0, 1, 1, 1,
0.6810469, -1.042425, 2.108402, 1, 0, 0, 1, 1,
0.6831447, 1.05099, 2.08503, 1, 0, 0, 1, 1,
0.6833583, -1.021386, 1.756078, 1, 0, 0, 1, 1,
0.6860943, 1.011414, -0.3935681, 1, 0, 0, 1, 1,
0.6865351, 0.08832967, 0.03299515, 1, 0, 0, 1, 1,
0.6866605, -0.4870433, 2.408643, 0, 0, 0, 1, 1,
0.6997799, -0.07392258, -0.07405883, 0, 0, 0, 1, 1,
0.7004639, -0.1852222, 1.266546, 0, 0, 0, 1, 1,
0.7132249, -0.8735371, 3.03756, 0, 0, 0, 1, 1,
0.7139398, 0.7353191, 2.333998, 0, 0, 0, 1, 1,
0.7144536, -2.605274, 3.243813, 0, 0, 0, 1, 1,
0.7186429, -0.5299978, 2.787752, 0, 0, 0, 1, 1,
0.7329586, -0.03396468, -0.271533, 1, 1, 1, 1, 1,
0.7361092, 0.5685518, 0.6386374, 1, 1, 1, 1, 1,
0.7526913, 1.100997, -1.353327, 1, 1, 1, 1, 1,
0.7619057, 0.7651487, 0.1295293, 1, 1, 1, 1, 1,
0.762796, -0.7745122, 2.57525, 1, 1, 1, 1, 1,
0.7642581, -0.2562182, 1.901523, 1, 1, 1, 1, 1,
0.7726018, 0.2505992, 0.5063693, 1, 1, 1, 1, 1,
0.7751402, 1.337892, 1.315552, 1, 1, 1, 1, 1,
0.7760523, -0.6251168, 2.540389, 1, 1, 1, 1, 1,
0.7853202, -0.3736165, 1.165649, 1, 1, 1, 1, 1,
0.7872125, 2.765211, 0.3842039, 1, 1, 1, 1, 1,
0.7889125, 0.2258517, 1.328544, 1, 1, 1, 1, 1,
0.7924527, 1.507016, -0.4591822, 1, 1, 1, 1, 1,
0.7970264, 0.4842699, 2.702782, 1, 1, 1, 1, 1,
0.7978987, 1.455887, -0.1031387, 1, 1, 1, 1, 1,
0.800698, 0.8012244, 0.75568, 0, 0, 1, 1, 1,
0.8202459, 1.162326, 1.301553, 1, 0, 0, 1, 1,
0.8265858, 1.201137, 1.056206, 1, 0, 0, 1, 1,
0.8301629, -0.2739032, 2.218955, 1, 0, 0, 1, 1,
0.8302457, 1.858642, 1.304691, 1, 0, 0, 1, 1,
0.8373469, 1.285102, 0.789226, 1, 0, 0, 1, 1,
0.8412452, 0.09090794, 1.041549, 0, 0, 0, 1, 1,
0.8440896, 1.369289, 0.4958877, 0, 0, 0, 1, 1,
0.8481098, 0.05666171, 2.07653, 0, 0, 0, 1, 1,
0.8486974, 0.2311417, -0.4717621, 0, 0, 0, 1, 1,
0.8520735, 0.5850575, -0.1294877, 0, 0, 0, 1, 1,
0.8533692, 0.3265707, -0.4673748, 0, 0, 0, 1, 1,
0.8572746, -0.4083656, 1.310125, 0, 0, 0, 1, 1,
0.8583476, 0.3785044, 1.427654, 1, 1, 1, 1, 1,
0.859286, -1.030668, 2.12742, 1, 1, 1, 1, 1,
0.8766634, 0.3686826, 1.612432, 1, 1, 1, 1, 1,
0.8793921, 0.4099396, 0.2162686, 1, 1, 1, 1, 1,
0.8795319, 1.092611, 0.00202825, 1, 1, 1, 1, 1,
0.8815511, -0.03133405, 1.747809, 1, 1, 1, 1, 1,
0.8831647, 0.5518674, 1.755508, 1, 1, 1, 1, 1,
0.8874745, -1.028225, 1.130899, 1, 1, 1, 1, 1,
0.8879454, 0.5607772, 0.6589486, 1, 1, 1, 1, 1,
0.8902539, -0.7038549, 2.198858, 1, 1, 1, 1, 1,
0.8913337, -1.282443, 2.137201, 1, 1, 1, 1, 1,
0.9014342, 1.83047, 0.7711281, 1, 1, 1, 1, 1,
0.9018719, -0.4663387, 2.914714, 1, 1, 1, 1, 1,
0.9094962, -0.9874546, 1.733666, 1, 1, 1, 1, 1,
0.9107742, 0.9190767, 0.5442899, 1, 1, 1, 1, 1,
0.9213539, -1.478962, 1.928295, 0, 0, 1, 1, 1,
0.9255995, 0.5665743, 3.175588, 1, 0, 0, 1, 1,
0.9284939, 0.3379941, -0.214093, 1, 0, 0, 1, 1,
0.9323684, -1.380903, 3.162415, 1, 0, 0, 1, 1,
0.9352522, 0.3591998, 2.94745, 1, 0, 0, 1, 1,
0.9353203, -0.474907, 2.40625, 1, 0, 0, 1, 1,
0.9363708, 0.09979562, 0.1626129, 0, 0, 0, 1, 1,
0.9384155, 1.603922, -0.3252356, 0, 0, 0, 1, 1,
0.9386096, 0.4471249, 1.216677, 0, 0, 0, 1, 1,
0.943401, -0.6570287, 1.57313, 0, 0, 0, 1, 1,
0.9464672, -1.308432, 3.26067, 0, 0, 0, 1, 1,
0.9477155, -1.192918, 1.748493, 0, 0, 0, 1, 1,
0.9486387, 0.1812942, 1.238746, 0, 0, 0, 1, 1,
0.9510776, 0.2945029, 1.405889, 1, 1, 1, 1, 1,
0.9564084, -0.7368308, 2.142498, 1, 1, 1, 1, 1,
0.9600607, 0.3931522, 0.1606431, 1, 1, 1, 1, 1,
0.9641203, -1.136294, 1.261075, 1, 1, 1, 1, 1,
0.9682351, -0.2300157, -0.2462296, 1, 1, 1, 1, 1,
0.9698239, -0.2207207, 0.657338, 1, 1, 1, 1, 1,
0.9729804, 1.192444, -0.5020261, 1, 1, 1, 1, 1,
0.9744278, -0.9459375, 3.304254, 1, 1, 1, 1, 1,
0.9756017, 0.04675586, 1.892399, 1, 1, 1, 1, 1,
0.9790877, -0.8620813, 3.276915, 1, 1, 1, 1, 1,
0.9840419, -0.7293946, -0.09718748, 1, 1, 1, 1, 1,
0.9849216, -0.01868243, 2.440438, 1, 1, 1, 1, 1,
0.9881788, 0.1460348, 2.391747, 1, 1, 1, 1, 1,
0.9934661, -1.531978, 1.839951, 1, 1, 1, 1, 1,
0.9956662, -0.2973143, 0.6481619, 1, 1, 1, 1, 1,
0.9995626, 1.907479, 0.9906614, 0, 0, 1, 1, 1,
1.004563, 0.4491516, 2.869677, 1, 0, 0, 1, 1,
1.007192, -2.054471, 3.738601, 1, 0, 0, 1, 1,
1.010211, -0.8678222, 2.031867, 1, 0, 0, 1, 1,
1.013479, -0.6104856, 2.317296, 1, 0, 0, 1, 1,
1.015688, 0.726513, 0.835067, 1, 0, 0, 1, 1,
1.016763, -0.05683012, 1.755341, 0, 0, 0, 1, 1,
1.021076, 0.9107291, 2.962556, 0, 0, 0, 1, 1,
1.021582, -1.002924, 1.339103, 0, 0, 0, 1, 1,
1.023411, 0.6625981, 0.8295147, 0, 0, 0, 1, 1,
1.025101, 1.352266, 0.5530225, 0, 0, 0, 1, 1,
1.029148, -0.07788641, 2.08512, 0, 0, 0, 1, 1,
1.033594, -0.6856995, 3.34999, 0, 0, 0, 1, 1,
1.036737, 0.6137438, 1.65839, 1, 1, 1, 1, 1,
1.036762, -0.5184836, 2.231863, 1, 1, 1, 1, 1,
1.037982, -0.3323701, 2.007445, 1, 1, 1, 1, 1,
1.042274, 0.7745509, 1.195701, 1, 1, 1, 1, 1,
1.049179, -1.954736, 2.655388, 1, 1, 1, 1, 1,
1.050128, -1.579754, 3.161171, 1, 1, 1, 1, 1,
1.050958, -0.4039527, 2.037064, 1, 1, 1, 1, 1,
1.056298, -0.3728709, 2.596814, 1, 1, 1, 1, 1,
1.06513, 0.07315729, 1.538584, 1, 1, 1, 1, 1,
1.069023, 0.5651821, 1.749435, 1, 1, 1, 1, 1,
1.070338, -0.4710639, 0.4912452, 1, 1, 1, 1, 1,
1.071522, -0.138109, 2.183659, 1, 1, 1, 1, 1,
1.073128, -1.958482, 3.254473, 1, 1, 1, 1, 1,
1.075684, 1.6121, -1.695226, 1, 1, 1, 1, 1,
1.076327, -0.3905378, 2.310412, 1, 1, 1, 1, 1,
1.084035, -0.8334153, 2.898864, 0, 0, 1, 1, 1,
1.088935, -0.7698587, 1.473242, 1, 0, 0, 1, 1,
1.097381, 0.7501131, 0.4808302, 1, 0, 0, 1, 1,
1.105966, -0.04011198, 3.215285, 1, 0, 0, 1, 1,
1.116134, -0.2866367, 2.575561, 1, 0, 0, 1, 1,
1.133447, -0.9438509, 2.450712, 1, 0, 0, 1, 1,
1.146689, 0.5681254, 0.407934, 0, 0, 0, 1, 1,
1.152778, 0.03596563, 2.673028, 0, 0, 0, 1, 1,
1.163614, 0.3606522, 0.7088495, 0, 0, 0, 1, 1,
1.16664, -0.6404409, 2.01654, 0, 0, 0, 1, 1,
1.167142, 0.06588119, 2.126757, 0, 0, 0, 1, 1,
1.173029, 0.6319553, 1.124864, 0, 0, 0, 1, 1,
1.175115, -0.5352669, 1.719411, 0, 0, 0, 1, 1,
1.175758, -0.5449016, 1.801875, 1, 1, 1, 1, 1,
1.178946, 1.235515, 1.905208, 1, 1, 1, 1, 1,
1.199071, -0.2652239, 3.212239, 1, 1, 1, 1, 1,
1.21852, 0.5510602, -1.843732, 1, 1, 1, 1, 1,
1.230767, 0.1183314, 1.467604, 1, 1, 1, 1, 1,
1.237316, -0.4253551, 1.699679, 1, 1, 1, 1, 1,
1.237494, -0.6857935, 2.116276, 1, 1, 1, 1, 1,
1.244096, 1.62189, -1.368471, 1, 1, 1, 1, 1,
1.24609, 1.965221, 0.1786204, 1, 1, 1, 1, 1,
1.24685, 0.795871, 2.410151, 1, 1, 1, 1, 1,
1.248094, -0.9221981, 2.158901, 1, 1, 1, 1, 1,
1.249962, 1.598574, 0.8062965, 1, 1, 1, 1, 1,
1.258542, -0.1966886, 1.33202, 1, 1, 1, 1, 1,
1.258665, 0.3256662, -0.03761742, 1, 1, 1, 1, 1,
1.262738, -0.3333696, 1.191166, 1, 1, 1, 1, 1,
1.264361, 2.413201, 0.46841, 0, 0, 1, 1, 1,
1.272935, -0.4237729, 1.647, 1, 0, 0, 1, 1,
1.284929, 0.9481086, -0.24187, 1, 0, 0, 1, 1,
1.287598, -1.343901, 2.760453, 1, 0, 0, 1, 1,
1.290332, 1.392145, 0.4236682, 1, 0, 0, 1, 1,
1.29326, 1.818738, 3.130581, 1, 0, 0, 1, 1,
1.305252, 0.7011484, -0.137276, 0, 0, 0, 1, 1,
1.306031, 1.097544, 2.424129, 0, 0, 0, 1, 1,
1.308639, 0.6529086, 1.559989, 0, 0, 0, 1, 1,
1.32119, -1.267115, 2.107715, 0, 0, 0, 1, 1,
1.323529, 1.337299, -0.5530415, 0, 0, 0, 1, 1,
1.324942, -0.6702699, 1.589947, 0, 0, 0, 1, 1,
1.330709, -0.3049569, 2.374355, 0, 0, 0, 1, 1,
1.330839, -0.391396, 2.522771, 1, 1, 1, 1, 1,
1.331893, 0.6599354, 1.199861, 1, 1, 1, 1, 1,
1.33273, 1.255207, 1.369339, 1, 1, 1, 1, 1,
1.365673, -1.612723, 2.985265, 1, 1, 1, 1, 1,
1.373944, -1.035923, 0.6422576, 1, 1, 1, 1, 1,
1.381223, 1.513928, -0.1520337, 1, 1, 1, 1, 1,
1.387922, -0.842556, 2.937762, 1, 1, 1, 1, 1,
1.390785, -0.250727, 1.868146, 1, 1, 1, 1, 1,
1.401053, -0.4681703, 2.028664, 1, 1, 1, 1, 1,
1.410274, 0.2908933, 1.614844, 1, 1, 1, 1, 1,
1.417337, 0.001396942, 2.180772, 1, 1, 1, 1, 1,
1.4218, 0.08600307, 1.888381, 1, 1, 1, 1, 1,
1.423085, 0.4597863, 0.2206283, 1, 1, 1, 1, 1,
1.434556, -0.1318043, 0.7719555, 1, 1, 1, 1, 1,
1.4384, -0.9898033, 2.34549, 1, 1, 1, 1, 1,
1.447151, 1.323472, 0.934014, 0, 0, 1, 1, 1,
1.447568, 0.8042099, 2.093324, 1, 0, 0, 1, 1,
1.448088, -0.09788409, 1.395895, 1, 0, 0, 1, 1,
1.460402, -1.326486, 2.534339, 1, 0, 0, 1, 1,
1.460607, 0.7598359, 1.486179, 1, 0, 0, 1, 1,
1.461035, -0.9352582, 0.4746159, 1, 0, 0, 1, 1,
1.461339, -1.176016, 2.99439, 0, 0, 0, 1, 1,
1.463491, -1.317477, 2.813982, 0, 0, 0, 1, 1,
1.465298, -1.082865, 2.582683, 0, 0, 0, 1, 1,
1.486745, 1.152709, 0.5018212, 0, 0, 0, 1, 1,
1.509047, 0.2740186, -0.8022764, 0, 0, 0, 1, 1,
1.509977, -0.9702113, 3.516095, 0, 0, 0, 1, 1,
1.525722, -1.503961, 0.7263916, 0, 0, 0, 1, 1,
1.532843, 0.7096918, 1.008357, 1, 1, 1, 1, 1,
1.537056, -2.036729, 1.570408, 1, 1, 1, 1, 1,
1.556714, -0.2261644, 2.875253, 1, 1, 1, 1, 1,
1.562429, 1.03481, 2.160546, 1, 1, 1, 1, 1,
1.569062, 0.1933937, 0.9590802, 1, 1, 1, 1, 1,
1.571575, 0.2918342, 2.350054, 1, 1, 1, 1, 1,
1.588589, 0.3593137, 2.124094, 1, 1, 1, 1, 1,
1.592821, 0.233232, 0.8843682, 1, 1, 1, 1, 1,
1.592936, 0.2124753, 1.140424, 1, 1, 1, 1, 1,
1.598418, -1.825994, 0.8044945, 1, 1, 1, 1, 1,
1.610335, 1.187216, 0.5380328, 1, 1, 1, 1, 1,
1.616602, 0.9193708, -0.3083418, 1, 1, 1, 1, 1,
1.621902, 1.110488, -1.76933, 1, 1, 1, 1, 1,
1.624751, -1.031392, 1.514476, 1, 1, 1, 1, 1,
1.630651, -0.3520532, 3.447942, 1, 1, 1, 1, 1,
1.633224, -0.2837151, 0.9398666, 0, 0, 1, 1, 1,
1.637984, -0.4361541, 2.505987, 1, 0, 0, 1, 1,
1.647947, 0.6055614, 1.269497, 1, 0, 0, 1, 1,
1.657179, 0.4079849, 1.248703, 1, 0, 0, 1, 1,
1.68132, -0.06200414, 0.8953869, 1, 0, 0, 1, 1,
1.683731, 0.1372919, 1.279132, 1, 0, 0, 1, 1,
1.700234, 0.4020533, 2.46782, 0, 0, 0, 1, 1,
1.703385, 0.339539, 1.06382, 0, 0, 0, 1, 1,
1.737013, -0.9659182, 2.994724, 0, 0, 0, 1, 1,
1.756192, -0.525945, 3.536084, 0, 0, 0, 1, 1,
1.764333, 0.04033295, 0.2645038, 0, 0, 0, 1, 1,
1.804335, -0.4798254, 0.9045181, 0, 0, 0, 1, 1,
1.815087, 0.8416915, 0.2366428, 0, 0, 0, 1, 1,
1.836843, -0.2354831, 1.293676, 1, 1, 1, 1, 1,
1.855469, -0.3525938, 1.207674, 1, 1, 1, 1, 1,
1.88833, 0.07428642, 0.3892157, 1, 1, 1, 1, 1,
1.898821, -0.5473184, -0.3410839, 1, 1, 1, 1, 1,
1.903677, 0.4940665, -0.3140824, 1, 1, 1, 1, 1,
1.912971, 0.09089661, 1.011043, 1, 1, 1, 1, 1,
1.921323, 0.01145579, 1.972858, 1, 1, 1, 1, 1,
1.946131, -0.3422056, 2.011099, 1, 1, 1, 1, 1,
1.953597, -0.2005935, 3.224979, 1, 1, 1, 1, 1,
2.053797, -0.655469, 2.154337, 1, 1, 1, 1, 1,
2.061047, -0.1468883, 1.939922, 1, 1, 1, 1, 1,
2.07164, 3.284262, 0.3325554, 1, 1, 1, 1, 1,
2.074484, 0.209485, 1.17174, 1, 1, 1, 1, 1,
2.091679, -0.580504, 3.185592, 1, 1, 1, 1, 1,
2.147753, 2.474329, 2.236218, 1, 1, 1, 1, 1,
2.159446, -2.158419, 2.087925, 0, 0, 1, 1, 1,
2.160392, -2.439514, 2.72583, 1, 0, 0, 1, 1,
2.223219, 0.05800887, 1.354393, 1, 0, 0, 1, 1,
2.254442, -0.776713, 1.380375, 1, 0, 0, 1, 1,
2.276139, -1.504785, 3.38964, 1, 0, 0, 1, 1,
2.283512, -1.691307, 1.260466, 1, 0, 0, 1, 1,
2.346279, -1.775887, 1.13527, 0, 0, 0, 1, 1,
2.377162, -0.6281811, 2.568966, 0, 0, 0, 1, 1,
2.438787, 0.1610323, 1.075055, 0, 0, 0, 1, 1,
2.445518, 0.7766604, 2.24453, 0, 0, 0, 1, 1,
2.473403, 1.120439, 2.100478, 0, 0, 0, 1, 1,
2.480441, -1.158198, 1.798491, 0, 0, 0, 1, 1,
2.551522, -0.6456222, 0.8458814, 0, 0, 0, 1, 1,
2.609965, 0.2839795, 0.2054973, 1, 1, 1, 1, 1,
2.650293, -0.9225353, 1.268271, 1, 1, 1, 1, 1,
2.765457, 0.2190168, 1.622945, 1, 1, 1, 1, 1,
3.027869, 0.5594803, 2.375243, 1, 1, 1, 1, 1,
3.027967, 0.9195302, 1.349133, 1, 1, 1, 1, 1,
3.127535, 0.9155095, -0.08771811, 1, 1, 1, 1, 1,
3.213779, 1.274523, 3.211252, 1, 1, 1, 1, 1
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
var radius = 9.556211;
var distance = 33.56578;
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
mvMatrix.translate( 0.09778142, -0.6256334, -0.1894295 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56578);
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
