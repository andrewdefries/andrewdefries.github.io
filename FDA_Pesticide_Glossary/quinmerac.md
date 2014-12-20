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
-2.977262, -0.6718404, -2.451154, 1, 0, 0, 1,
-2.864872, -1.211468, -1.810939, 1, 0.007843138, 0, 1,
-2.767516, -0.6292062, -0.8117319, 1, 0.01176471, 0, 1,
-2.766809, -1.700372, -0.7458223, 1, 0.01960784, 0, 1,
-2.747791, -1.715834, -3.233485, 1, 0.02352941, 0, 1,
-2.705615, 0.7153794, 0.7741739, 1, 0.03137255, 0, 1,
-2.640899, -1.172095, -0.8589289, 1, 0.03529412, 0, 1,
-2.586771, 1.023531, -1.458976, 1, 0.04313726, 0, 1,
-2.560114, -0.3324605, -1.844738, 1, 0.04705882, 0, 1,
-2.55211, 1.329235, -0.4264747, 1, 0.05490196, 0, 1,
-2.395335, -1.171694, -2.750027, 1, 0.05882353, 0, 1,
-2.383274, 0.5975268, -1.306295, 1, 0.06666667, 0, 1,
-2.320911, -0.2672888, -1.745129, 1, 0.07058824, 0, 1,
-2.30167, 1.882709, -2.017557, 1, 0.07843138, 0, 1,
-2.26349, -1.368471, -4.682199, 1, 0.08235294, 0, 1,
-2.229517, 0.1014855, -2.537296, 1, 0.09019608, 0, 1,
-2.219071, -1.798466, -2.706542, 1, 0.09411765, 0, 1,
-2.211719, -1.163946, -0.571702, 1, 0.1019608, 0, 1,
-2.17261, -0.835603, -3.285063, 1, 0.1098039, 0, 1,
-2.164752, -1.905406, -1.185538, 1, 0.1137255, 0, 1,
-2.091973, -1.341067, -1.178955, 1, 0.1215686, 0, 1,
-2.082291, 0.9822559, -0.8540561, 1, 0.1254902, 0, 1,
-2.068356, -0.4203551, -1.78246, 1, 0.1333333, 0, 1,
-2.025113, 0.05875893, -1.646706, 1, 0.1372549, 0, 1,
-2.003577, -0.8368187, -3.93061, 1, 0.145098, 0, 1,
-1.992803, -0.6687169, -1.834245, 1, 0.1490196, 0, 1,
-1.98421, 1.253271, -0.3653592, 1, 0.1568628, 0, 1,
-1.977104, 0.5603709, -0.1803882, 1, 0.1607843, 0, 1,
-1.974629, -1.110068, -2.389745, 1, 0.1686275, 0, 1,
-1.963133, -0.8978398, -1.435156, 1, 0.172549, 0, 1,
-1.913293, 0.1347628, -0.02228642, 1, 0.1803922, 0, 1,
-1.895849, -0.3734609, -3.343776, 1, 0.1843137, 0, 1,
-1.836315, -1.462472, -1.139045, 1, 0.1921569, 0, 1,
-1.835605, 0.9467549, -1.093822, 1, 0.1960784, 0, 1,
-1.835347, -1.799425, -2.441329, 1, 0.2039216, 0, 1,
-1.8294, -2.187083, -1.523996, 1, 0.2117647, 0, 1,
-1.80242, 0.4692351, -3.025602, 1, 0.2156863, 0, 1,
-1.793235, -0.2238517, -2.01649, 1, 0.2235294, 0, 1,
-1.768336, -0.5409821, -3.73479, 1, 0.227451, 0, 1,
-1.763553, 0.4388397, -0.4795048, 1, 0.2352941, 0, 1,
-1.75731, 0.8737546, -0.3679803, 1, 0.2392157, 0, 1,
-1.752472, -0.7943202, -0.9698259, 1, 0.2470588, 0, 1,
-1.747328, 1.308137, -0.1760502, 1, 0.2509804, 0, 1,
-1.72728, -1.148104, -1.15609, 1, 0.2588235, 0, 1,
-1.711107, 1.186095, -1.718257, 1, 0.2627451, 0, 1,
-1.707683, 0.6227523, -1.309295, 1, 0.2705882, 0, 1,
-1.696624, -0.7255661, -1.084434, 1, 0.2745098, 0, 1,
-1.684069, 0.575398, -1.69367, 1, 0.282353, 0, 1,
-1.682346, 2.375705, -0.6627115, 1, 0.2862745, 0, 1,
-1.677505, 0.8755032, -2.375672, 1, 0.2941177, 0, 1,
-1.675577, 2.007212, -0.7550154, 1, 0.3019608, 0, 1,
-1.670092, -0.8073053, -2.266321, 1, 0.3058824, 0, 1,
-1.650234, 0.573967, -2.482312, 1, 0.3137255, 0, 1,
-1.629315, -0.880716, -2.389283, 1, 0.3176471, 0, 1,
-1.625988, 1.887001, -1.742331, 1, 0.3254902, 0, 1,
-1.621459, 1.17058, -1.409998, 1, 0.3294118, 0, 1,
-1.595864, 0.5838698, -1.544528, 1, 0.3372549, 0, 1,
-1.57711, 0.4184601, -0.1220862, 1, 0.3411765, 0, 1,
-1.569975, 0.1410144, -0.3070493, 1, 0.3490196, 0, 1,
-1.562814, -0.340102, -1.866754, 1, 0.3529412, 0, 1,
-1.555659, -0.4995877, -2.442875, 1, 0.3607843, 0, 1,
-1.551184, -1.036791, -2.606785, 1, 0.3647059, 0, 1,
-1.531326, -0.2308574, -0.8886255, 1, 0.372549, 0, 1,
-1.530447, 0.9669188, -1.310945, 1, 0.3764706, 0, 1,
-1.52563, -1.128178, -2.487992, 1, 0.3843137, 0, 1,
-1.522253, 0.9527494, -1.632036, 1, 0.3882353, 0, 1,
-1.511604, -0.886641, -2.112692, 1, 0.3960784, 0, 1,
-1.496823, -2.001848, -3.415584, 1, 0.4039216, 0, 1,
-1.495906, -1.962087, -1.308112, 1, 0.4078431, 0, 1,
-1.492472, 0.613968, -1.517672, 1, 0.4156863, 0, 1,
-1.482498, -1.579747, -0.9285026, 1, 0.4196078, 0, 1,
-1.480801, 1.280607, -1.783023, 1, 0.427451, 0, 1,
-1.47457, 0.4370802, -1.480434, 1, 0.4313726, 0, 1,
-1.473518, -0.3625425, -1.893605, 1, 0.4392157, 0, 1,
-1.46049, -0.8742063, -2.418021, 1, 0.4431373, 0, 1,
-1.455759, -1.772699, -2.140346, 1, 0.4509804, 0, 1,
-1.453408, 1.155186, 0.4237737, 1, 0.454902, 0, 1,
-1.446602, -0.5102405, -1.479397, 1, 0.4627451, 0, 1,
-1.446106, -0.8115433, -0.1023436, 1, 0.4666667, 0, 1,
-1.434428, 0.04240126, -0.8459705, 1, 0.4745098, 0, 1,
-1.418737, 0.4781514, 0.2475773, 1, 0.4784314, 0, 1,
-1.414575, -1.449158, -2.10746, 1, 0.4862745, 0, 1,
-1.406501, -0.3354335, -1.347297, 1, 0.4901961, 0, 1,
-1.400176, 0.07525811, -1.998073, 1, 0.4980392, 0, 1,
-1.397453, -0.09807564, -2.75293, 1, 0.5058824, 0, 1,
-1.388485, 0.2763793, -1.597365, 1, 0.509804, 0, 1,
-1.378029, -0.4301383, -0.09068258, 1, 0.5176471, 0, 1,
-1.375793, 1.571087, 0.8280176, 1, 0.5215687, 0, 1,
-1.373621, -0.9623916, -1.562332, 1, 0.5294118, 0, 1,
-1.370162, 1.268821, 0.3536709, 1, 0.5333334, 0, 1,
-1.369686, 1.605403, -0.1961337, 1, 0.5411765, 0, 1,
-1.361489, -0.06011289, -1.252595, 1, 0.5450981, 0, 1,
-1.359165, 2.019375, 1.258425, 1, 0.5529412, 0, 1,
-1.348952, -0.6087211, -2.346731, 1, 0.5568628, 0, 1,
-1.34601, 0.4832437, -3.365288, 1, 0.5647059, 0, 1,
-1.341225, -0.5745804, -2.663586, 1, 0.5686275, 0, 1,
-1.334967, -0.8474925, -2.840954, 1, 0.5764706, 0, 1,
-1.32273, 0.588963, 0.1925802, 1, 0.5803922, 0, 1,
-1.316551, 0.8632693, -1.409952, 1, 0.5882353, 0, 1,
-1.314081, -0.5643571, -0.6134514, 1, 0.5921569, 0, 1,
-1.312655, 1.740576, 0.2142324, 1, 0.6, 0, 1,
-1.307895, 0.05220811, -2.431002, 1, 0.6078432, 0, 1,
-1.306086, 1.295491, -0.8561325, 1, 0.6117647, 0, 1,
-1.304984, 0.1829247, -1.657118, 1, 0.6196079, 0, 1,
-1.301524, 0.4877445, -0.4520682, 1, 0.6235294, 0, 1,
-1.292207, -1.455819, -3.129256, 1, 0.6313726, 0, 1,
-1.285295, 1.116115, -0.6649524, 1, 0.6352941, 0, 1,
-1.284498, -0.3214162, -1.279603, 1, 0.6431373, 0, 1,
-1.271069, 0.5556209, -1.294668, 1, 0.6470588, 0, 1,
-1.256592, -0.6465882, -1.840705, 1, 0.654902, 0, 1,
-1.253346, 0.3319779, -1.654877, 1, 0.6588235, 0, 1,
-1.24573, -1.847433, -2.171904, 1, 0.6666667, 0, 1,
-1.24333, -0.1362196, -1.840987, 1, 0.6705883, 0, 1,
-1.23929, 2.437464, 0.5078789, 1, 0.6784314, 0, 1,
-1.23439, 0.6851487, -0.8559673, 1, 0.682353, 0, 1,
-1.233789, 1.091995, 0.273003, 1, 0.6901961, 0, 1,
-1.228799, -1.33806, -2.888862, 1, 0.6941177, 0, 1,
-1.214973, -0.7815475, -2.019156, 1, 0.7019608, 0, 1,
-1.203334, 0.5889057, -3.053895, 1, 0.7098039, 0, 1,
-1.203247, -0.9467331, -1.740809, 1, 0.7137255, 0, 1,
-1.203003, 0.977639, -0.9518727, 1, 0.7215686, 0, 1,
-1.202382, -0.8626491, -1.524245, 1, 0.7254902, 0, 1,
-1.20158, 1.976605, 0.4991866, 1, 0.7333333, 0, 1,
-1.199304, 0.07282502, 1.002454, 1, 0.7372549, 0, 1,
-1.198162, -0.2227057, -0.4893733, 1, 0.7450981, 0, 1,
-1.189003, 0.576855, 1.103607, 1, 0.7490196, 0, 1,
-1.181834, 0.1783334, -1.767598, 1, 0.7568628, 0, 1,
-1.176795, -1.049929, -2.792395, 1, 0.7607843, 0, 1,
-1.175113, 0.5392646, -0.2112197, 1, 0.7686275, 0, 1,
-1.174117, -1.156575, -1.893556, 1, 0.772549, 0, 1,
-1.173925, -0.1565869, -2.692106, 1, 0.7803922, 0, 1,
-1.169475, 0.7840689, -0.1847281, 1, 0.7843137, 0, 1,
-1.167281, 1.496352, -1.57572, 1, 0.7921569, 0, 1,
-1.16457, -0.6004609, -1.418013, 1, 0.7960784, 0, 1,
-1.161903, 1.316341, -0.7146669, 1, 0.8039216, 0, 1,
-1.161268, -1.058679, -2.276271, 1, 0.8117647, 0, 1,
-1.149674, -0.8471422, -2.753448, 1, 0.8156863, 0, 1,
-1.144255, 1.177724, -1.093575, 1, 0.8235294, 0, 1,
-1.143124, -0.5497908, -2.249657, 1, 0.827451, 0, 1,
-1.141004, 0.3221759, -0.8359928, 1, 0.8352941, 0, 1,
-1.129213, -2.514425, -1.923886, 1, 0.8392157, 0, 1,
-1.114492, 0.1592709, -1.936454, 1, 0.8470588, 0, 1,
-1.099708, -1.112609, -1.289024, 1, 0.8509804, 0, 1,
-1.098058, 0.2685953, -0.6560262, 1, 0.8588235, 0, 1,
-1.095404, 0.2153592, -0.699205, 1, 0.8627451, 0, 1,
-1.089628, -0.4501153, -2.266773, 1, 0.8705882, 0, 1,
-1.075656, -1.236864, -2.145952, 1, 0.8745098, 0, 1,
-1.07223, -0.1807724, -2.828305, 1, 0.8823529, 0, 1,
-1.062783, -0.1425951, -1.672172, 1, 0.8862745, 0, 1,
-1.062095, -0.1412731, -0.8611996, 1, 0.8941177, 0, 1,
-1.059098, -0.9646033, -2.777927, 1, 0.8980392, 0, 1,
-1.05705, -0.4372552, -3.382025, 1, 0.9058824, 0, 1,
-1.051554, 1.021008, 1.103829, 1, 0.9137255, 0, 1,
-1.046532, -0.6553973, -3.53758, 1, 0.9176471, 0, 1,
-1.04574, -1.578583, -1.94058, 1, 0.9254902, 0, 1,
-1.033239, 1.465028, -0.6804688, 1, 0.9294118, 0, 1,
-1.032512, 0.7660094, -1.853623, 1, 0.9372549, 0, 1,
-1.031217, -1.51393, -2.394067, 1, 0.9411765, 0, 1,
-1.028647, 0.4913693, -1.184786, 1, 0.9490196, 0, 1,
-1.020454, 0.3931893, -1.993456, 1, 0.9529412, 0, 1,
-1.01984, -0.3971742, -2.239882, 1, 0.9607843, 0, 1,
-1.017438, -1.488662, -1.532446, 1, 0.9647059, 0, 1,
-1.012732, -0.2068021, -4.062558, 1, 0.972549, 0, 1,
-1.008808, 1.283105, -0.9197263, 1, 0.9764706, 0, 1,
-1.008731, 1.35305, -0.7993934, 1, 0.9843137, 0, 1,
-1.005269, 2.075027, -0.8238159, 1, 0.9882353, 0, 1,
-1.002573, -0.7711907, -3.381468, 1, 0.9960784, 0, 1,
-1.002544, -1.496558, -1.072856, 0.9960784, 1, 0, 1,
-0.9989794, -0.5941864, -3.066707, 0.9921569, 1, 0, 1,
-0.9960673, 0.9749149, -1.247827, 0.9843137, 1, 0, 1,
-0.9951523, -0.6075367, -2.613898, 0.9803922, 1, 0, 1,
-0.9925161, 1.9208, 0.3637352, 0.972549, 1, 0, 1,
-0.9911, 1.186154, 0.6835576, 0.9686275, 1, 0, 1,
-0.9858423, 1.761146, 0.1511344, 0.9607843, 1, 0, 1,
-0.9853449, -0.5509166, -2.240709, 0.9568627, 1, 0, 1,
-0.9724408, 0.1536236, -1.44804, 0.9490196, 1, 0, 1,
-0.9686714, -1.202066, -1.346792, 0.945098, 1, 0, 1,
-0.9612027, 0.6931022, -0.8985431, 0.9372549, 1, 0, 1,
-0.9594104, -0.1664087, -2.236779, 0.9333333, 1, 0, 1,
-0.9557405, -1.384644, -1.01796, 0.9254902, 1, 0, 1,
-0.9520987, 1.368557, 0.2921776, 0.9215686, 1, 0, 1,
-0.9500343, -0.4209324, -3.062797, 0.9137255, 1, 0, 1,
-0.9477469, 0.2556753, -0.2985095, 0.9098039, 1, 0, 1,
-0.9367367, 0.35446, -0.1580141, 0.9019608, 1, 0, 1,
-0.9327212, -1.983621, -2.200689, 0.8941177, 1, 0, 1,
-0.9232905, -1.292997, -1.639796, 0.8901961, 1, 0, 1,
-0.9221286, 0.6690958, -1.61407, 0.8823529, 1, 0, 1,
-0.918401, -0.02278275, -1.856032, 0.8784314, 1, 0, 1,
-0.9072372, -1.303117, -3.434464, 0.8705882, 1, 0, 1,
-0.9026222, 0.7218572, -0.3047142, 0.8666667, 1, 0, 1,
-0.9010797, 0.7247508, -0.9155775, 0.8588235, 1, 0, 1,
-0.8964387, -0.4791463, -3.208846, 0.854902, 1, 0, 1,
-0.893857, 1.040349, -1.595268, 0.8470588, 1, 0, 1,
-0.8929673, 0.2264344, -0.8611847, 0.8431373, 1, 0, 1,
-0.8918305, -1.43928, -1.598897, 0.8352941, 1, 0, 1,
-0.8908955, -1.397008, -3.075162, 0.8313726, 1, 0, 1,
-0.8901961, 0.2991724, -2.108963, 0.8235294, 1, 0, 1,
-0.8841396, -0.2526313, -4.020024, 0.8196079, 1, 0, 1,
-0.8836186, 0.660576, -1.367684, 0.8117647, 1, 0, 1,
-0.8832513, -0.7336996, -3.749512, 0.8078431, 1, 0, 1,
-0.8829702, 1.715445, 0.06471527, 0.8, 1, 0, 1,
-0.8795123, -1.036812, -3.122171, 0.7921569, 1, 0, 1,
-0.8728189, -0.4664566, -2.595205, 0.7882353, 1, 0, 1,
-0.8700421, -1.028963, -2.397271, 0.7803922, 1, 0, 1,
-0.8675041, -1.15318, -3.349138, 0.7764706, 1, 0, 1,
-0.8665314, -0.03409314, -1.553295, 0.7686275, 1, 0, 1,
-0.8642818, -0.6043692, -1.321906, 0.7647059, 1, 0, 1,
-0.8602936, 1.130767, 0.4523511, 0.7568628, 1, 0, 1,
-0.8585069, -0.1715575, -1.366795, 0.7529412, 1, 0, 1,
-0.8567326, 0.7812275, -1.387722, 0.7450981, 1, 0, 1,
-0.8476741, -1.488894, -2.118603, 0.7411765, 1, 0, 1,
-0.8441296, -0.3917003, -1.526412, 0.7333333, 1, 0, 1,
-0.8439031, -1.944755, -1.253482, 0.7294118, 1, 0, 1,
-0.8326622, -0.2240978, -2.422185, 0.7215686, 1, 0, 1,
-0.8283775, -0.7703236, -1.791434, 0.7176471, 1, 0, 1,
-0.8257656, -0.8892258, -3.53085, 0.7098039, 1, 0, 1,
-0.8253635, 0.1885258, 0.8655156, 0.7058824, 1, 0, 1,
-0.8251089, 0.7446902, -1.708266, 0.6980392, 1, 0, 1,
-0.821901, -0.8830258, -3.055572, 0.6901961, 1, 0, 1,
-0.8192609, -0.1434417, -1.873526, 0.6862745, 1, 0, 1,
-0.8154051, -1.270724, -2.632023, 0.6784314, 1, 0, 1,
-0.8125572, 2.282341, 1.169647, 0.6745098, 1, 0, 1,
-0.8046797, -1.292661, -2.331516, 0.6666667, 1, 0, 1,
-0.8044651, -0.2358253, -1.73979, 0.6627451, 1, 0, 1,
-0.7967837, 0.7622544, -0.8735186, 0.654902, 1, 0, 1,
-0.7908301, -0.6433399, -2.604584, 0.6509804, 1, 0, 1,
-0.7890031, -1.196791, -3.380482, 0.6431373, 1, 0, 1,
-0.7857538, 0.7383254, -1.443922, 0.6392157, 1, 0, 1,
-0.7852605, 0.9488443, -0.9102281, 0.6313726, 1, 0, 1,
-0.7839616, -0.1637185, -2.143476, 0.627451, 1, 0, 1,
-0.7829124, -0.4876308, -3.346118, 0.6196079, 1, 0, 1,
-0.7709169, 2.657743, -2.040655, 0.6156863, 1, 0, 1,
-0.7699297, 0.789233, -1.190051, 0.6078432, 1, 0, 1,
-0.7674121, -0.2522357, -1.479549, 0.6039216, 1, 0, 1,
-0.7666419, 0.2612534, -2.287397, 0.5960785, 1, 0, 1,
-0.7662568, 0.6484317, -1.587991, 0.5882353, 1, 0, 1,
-0.7601297, -0.7661903, -0.8857425, 0.5843138, 1, 0, 1,
-0.7536722, 0.7666501, 0.5050791, 0.5764706, 1, 0, 1,
-0.7497403, 0.3478673, -2.244578, 0.572549, 1, 0, 1,
-0.7458315, 1.976926, 0.5022663, 0.5647059, 1, 0, 1,
-0.7428244, 0.5820378, -1.527276, 0.5607843, 1, 0, 1,
-0.7386213, -0.3294479, -2.5749, 0.5529412, 1, 0, 1,
-0.7375914, 0.007960706, -2.240877, 0.5490196, 1, 0, 1,
-0.735854, 0.2942553, -0.309765, 0.5411765, 1, 0, 1,
-0.7354478, -0.2230456, -0.4199816, 0.5372549, 1, 0, 1,
-0.7262201, 0.4103984, -0.9676856, 0.5294118, 1, 0, 1,
-0.7250586, -0.7956865, -3.809485, 0.5254902, 1, 0, 1,
-0.7211367, 0.001819005, -2.351849, 0.5176471, 1, 0, 1,
-0.7188201, 0.6321263, -3.151331, 0.5137255, 1, 0, 1,
-0.7160598, 1.035593, -0.4593835, 0.5058824, 1, 0, 1,
-0.7112921, -0.5746207, -2.080954, 0.5019608, 1, 0, 1,
-0.7084709, 1.492064, 0.4562642, 0.4941176, 1, 0, 1,
-0.7039765, -1.134836, -2.548437, 0.4862745, 1, 0, 1,
-0.6974783, 0.6831741, 0.4291316, 0.4823529, 1, 0, 1,
-0.6905392, -0.1736682, -0.9683293, 0.4745098, 1, 0, 1,
-0.6904282, 0.9280581, 0.1142206, 0.4705882, 1, 0, 1,
-0.68396, -0.1400957, -3.07705, 0.4627451, 1, 0, 1,
-0.6798921, -0.5593983, -2.118887, 0.4588235, 1, 0, 1,
-0.6709164, 0.3566072, 1.313421, 0.4509804, 1, 0, 1,
-0.669926, 0.6270348, -1.384026, 0.4470588, 1, 0, 1,
-0.6656346, -0.4012093, -1.828323, 0.4392157, 1, 0, 1,
-0.6624916, 0.6766282, -1.408212, 0.4352941, 1, 0, 1,
-0.6612805, 0.7594633, -2.245396, 0.427451, 1, 0, 1,
-0.6607983, -0.1444523, -1.61618, 0.4235294, 1, 0, 1,
-0.6578275, -2.543061, -3.081121, 0.4156863, 1, 0, 1,
-0.6555602, 0.9493603, 0.4334022, 0.4117647, 1, 0, 1,
-0.6347998, 0.2596263, 0.1876713, 0.4039216, 1, 0, 1,
-0.6340572, -0.9615458, -1.626436, 0.3960784, 1, 0, 1,
-0.6333062, -1.809796, -5.965309, 0.3921569, 1, 0, 1,
-0.6293021, 1.159955, -0.3949274, 0.3843137, 1, 0, 1,
-0.6288311, 0.7210096, -0.3960389, 0.3803922, 1, 0, 1,
-0.6248268, 1.189942, -0.4418428, 0.372549, 1, 0, 1,
-0.6237122, 0.2744754, -0.9533212, 0.3686275, 1, 0, 1,
-0.6232097, -0.1392979, 0.2792974, 0.3607843, 1, 0, 1,
-0.621568, 0.5039694, 0.9005108, 0.3568628, 1, 0, 1,
-0.6189607, 1.075207, -0.7116973, 0.3490196, 1, 0, 1,
-0.6185503, 1.105182, 1.108414, 0.345098, 1, 0, 1,
-0.6178774, -1.099785, -2.713815, 0.3372549, 1, 0, 1,
-0.6175032, -0.6920907, -1.261019, 0.3333333, 1, 0, 1,
-0.6166021, 0.4592288, -1.3247, 0.3254902, 1, 0, 1,
-0.6125076, -0.522068, -3.795179, 0.3215686, 1, 0, 1,
-0.611932, 0.2860758, -2.430958, 0.3137255, 1, 0, 1,
-0.6068828, -0.3978311, -1.281958, 0.3098039, 1, 0, 1,
-0.6026077, 0.7813607, -1.464838, 0.3019608, 1, 0, 1,
-0.6013917, -0.9490114, -3.171273, 0.2941177, 1, 0, 1,
-0.6010516, -0.1237156, -1.585436, 0.2901961, 1, 0, 1,
-0.5996411, 0.6882703, -1.556131, 0.282353, 1, 0, 1,
-0.5988905, -1.705679, -3.105764, 0.2784314, 1, 0, 1,
-0.5967192, 1.119195, -1.126289, 0.2705882, 1, 0, 1,
-0.5902999, -0.2483834, -3.428854, 0.2666667, 1, 0, 1,
-0.5887167, 0.7786254, -0.8237861, 0.2588235, 1, 0, 1,
-0.5882353, -0.8722904, -2.24166, 0.254902, 1, 0, 1,
-0.5854257, -0.9510491, -2.842355, 0.2470588, 1, 0, 1,
-0.5823762, 0.4259352, -1.716467, 0.2431373, 1, 0, 1,
-0.5810659, 1.225055, -1.218865, 0.2352941, 1, 0, 1,
-0.5750721, 0.4671312, -1.80113, 0.2313726, 1, 0, 1,
-0.5735698, -0.5638238, -2.304529, 0.2235294, 1, 0, 1,
-0.5735368, 1.448063, -0.4844894, 0.2196078, 1, 0, 1,
-0.5698507, 0.2451358, -0.6423615, 0.2117647, 1, 0, 1,
-0.5633724, -0.5667157, -2.555862, 0.2078431, 1, 0, 1,
-0.5602981, 0.7851741, -0.9987677, 0.2, 1, 0, 1,
-0.5574633, -0.640725, -2.344022, 0.1921569, 1, 0, 1,
-0.5532479, 0.005740936, -3.717941, 0.1882353, 1, 0, 1,
-0.5519834, 1.587429, -1.186759, 0.1803922, 1, 0, 1,
-0.5519236, -1.554051, -1.792637, 0.1764706, 1, 0, 1,
-0.5514507, 0.8271503, 0.6409027, 0.1686275, 1, 0, 1,
-0.5497096, -1.946177, -3.165759, 0.1647059, 1, 0, 1,
-0.5398806, -1.30902, -2.246281, 0.1568628, 1, 0, 1,
-0.5324903, -0.7278865, -4.539594, 0.1529412, 1, 0, 1,
-0.5277704, 0.6085336, -1.002137, 0.145098, 1, 0, 1,
-0.524729, -0.05820741, -0.6777248, 0.1411765, 1, 0, 1,
-0.5228087, 1.756035, 0.2374693, 0.1333333, 1, 0, 1,
-0.5106362, 0.7091189, 0.7390167, 0.1294118, 1, 0, 1,
-0.5095394, -1.169729, -4.009935, 0.1215686, 1, 0, 1,
-0.5078761, -0.7073349, -2.177504, 0.1176471, 1, 0, 1,
-0.5045874, -0.6511607, -3.188735, 0.1098039, 1, 0, 1,
-0.5042171, 1.600358, 0.8228666, 0.1058824, 1, 0, 1,
-0.5038718, 1.41614, -0.2286202, 0.09803922, 1, 0, 1,
-0.5015984, -0.0692903, -2.000592, 0.09019608, 1, 0, 1,
-0.5013295, 0.8734747, -0.3058011, 0.08627451, 1, 0, 1,
-0.5000122, -0.9428434, 0.306922, 0.07843138, 1, 0, 1,
-0.4930475, -1.727303, -3.509751, 0.07450981, 1, 0, 1,
-0.491901, 0.9383111, 0.2042042, 0.06666667, 1, 0, 1,
-0.4875582, 0.6790108, -1.817702, 0.0627451, 1, 0, 1,
-0.4865746, -0.1832456, -1.70739, 0.05490196, 1, 0, 1,
-0.4847001, 0.1439332, -0.4071184, 0.05098039, 1, 0, 1,
-0.4701764, 0.1922315, 0.01784441, 0.04313726, 1, 0, 1,
-0.467804, 0.6863385, 1.404694, 0.03921569, 1, 0, 1,
-0.4638242, -0.9406111, -2.060053, 0.03137255, 1, 0, 1,
-0.4609984, -1.317133, -1.884184, 0.02745098, 1, 0, 1,
-0.4599915, 0.1347876, -1.26972, 0.01960784, 1, 0, 1,
-0.4598328, -0.2557775, -0.959503, 0.01568628, 1, 0, 1,
-0.4584807, -2.500293, -4.534146, 0.007843138, 1, 0, 1,
-0.4553274, 1.56971, 0.179105, 0.003921569, 1, 0, 1,
-0.4497429, 1.118976, -0.2788051, 0, 1, 0.003921569, 1,
-0.4491532, 0.1717184, -0.004346195, 0, 1, 0.01176471, 1,
-0.4441838, 0.291878, -1.349389, 0, 1, 0.01568628, 1,
-0.442157, 0.7183183, 0.5917029, 0, 1, 0.02352941, 1,
-0.4414756, 0.7268623, -1.924459, 0, 1, 0.02745098, 1,
-0.4392857, 0.5839988, -1.788402, 0, 1, 0.03529412, 1,
-0.4390709, 0.4067012, -1.364417, 0, 1, 0.03921569, 1,
-0.4374528, 0.04966473, -1.484538, 0, 1, 0.04705882, 1,
-0.4353538, 0.3195286, -2.39672, 0, 1, 0.05098039, 1,
-0.4287503, -0.7350665, -4.3204, 0, 1, 0.05882353, 1,
-0.4274569, 0.7260765, 1.495998, 0, 1, 0.0627451, 1,
-0.4259666, 0.3944339, 0.6746757, 0, 1, 0.07058824, 1,
-0.4232694, 1.76339, -0.8458282, 0, 1, 0.07450981, 1,
-0.4179415, 0.06703221, -3.300563, 0, 1, 0.08235294, 1,
-0.4162903, 0.9825578, -0.7816333, 0, 1, 0.08627451, 1,
-0.4148978, 1.556494, 0.4344641, 0, 1, 0.09411765, 1,
-0.4133731, 0.322832, -1.00541, 0, 1, 0.1019608, 1,
-0.4110934, -0.03228799, -2.325337, 0, 1, 0.1058824, 1,
-0.4083691, -0.2910639, -2.7398, 0, 1, 0.1137255, 1,
-0.4075723, -1.346368, -5.044246, 0, 1, 0.1176471, 1,
-0.4060533, 0.1056373, -2.826603, 0, 1, 0.1254902, 1,
-0.4048435, 0.7495652, -2.216825, 0, 1, 0.1294118, 1,
-0.4044927, 0.3386801, 0.121051, 0, 1, 0.1372549, 1,
-0.4035284, 0.1732085, -1.067818, 0, 1, 0.1411765, 1,
-0.3965655, -0.1153555, -0.9858932, 0, 1, 0.1490196, 1,
-0.3906859, 0.1310996, -1.027555, 0, 1, 0.1529412, 1,
-0.3904036, -2.137905, -3.288165, 0, 1, 0.1607843, 1,
-0.3899649, 0.8713605, -0.5136297, 0, 1, 0.1647059, 1,
-0.3896449, -0.0987492, -0.08823775, 0, 1, 0.172549, 1,
-0.3850499, 0.237274, 0.2831126, 0, 1, 0.1764706, 1,
-0.3844727, -0.4122864, -3.138455, 0, 1, 0.1843137, 1,
-0.3815172, -0.7495287, -1.485054, 0, 1, 0.1882353, 1,
-0.3786096, 0.6464092, 1.426072, 0, 1, 0.1960784, 1,
-0.3769875, 0.1232398, -1.558346, 0, 1, 0.2039216, 1,
-0.3728048, -0.3723742, -2.571961, 0, 1, 0.2078431, 1,
-0.3716893, 0.9644777, -0.3239867, 0, 1, 0.2156863, 1,
-0.3704031, 0.6491354, 0.1405071, 0, 1, 0.2196078, 1,
-0.3703576, 0.3156732, 0.1245591, 0, 1, 0.227451, 1,
-0.3649725, 0.5619588, 0.7657697, 0, 1, 0.2313726, 1,
-0.3605013, 0.6162468, -1.42547, 0, 1, 0.2392157, 1,
-0.3587487, 0.8558176, 1.359339, 0, 1, 0.2431373, 1,
-0.3577876, -0.994655, -2.688464, 0, 1, 0.2509804, 1,
-0.3569195, -0.5310314, -2.508098, 0, 1, 0.254902, 1,
-0.3562774, 0.9827788, -2.437542, 0, 1, 0.2627451, 1,
-0.3425021, 1.028798, -1.371527, 0, 1, 0.2666667, 1,
-0.3348979, -1.650151, -2.583648, 0, 1, 0.2745098, 1,
-0.3297115, 0.8327521, 0.6959345, 0, 1, 0.2784314, 1,
-0.3278327, -0.04259334, -0.8659509, 0, 1, 0.2862745, 1,
-0.3246769, 1.951205, -0.2473045, 0, 1, 0.2901961, 1,
-0.3194596, -0.7709819, -3.185112, 0, 1, 0.2980392, 1,
-0.3169776, -0.3960432, -3.231292, 0, 1, 0.3058824, 1,
-0.3142658, 0.3925049, -0.7480372, 0, 1, 0.3098039, 1,
-0.3070706, -0.04282229, -0.3136536, 0, 1, 0.3176471, 1,
-0.3001116, 0.2323928, -2.059594, 0, 1, 0.3215686, 1,
-0.3000977, 0.05043227, -1.614981, 0, 1, 0.3294118, 1,
-0.298359, -0.5108582, -2.976619, 0, 1, 0.3333333, 1,
-0.2981741, -0.183575, -1.346821, 0, 1, 0.3411765, 1,
-0.2973953, 1.580632, -0.7413148, 0, 1, 0.345098, 1,
-0.2952254, -1.039762, -3.913831, 0, 1, 0.3529412, 1,
-0.2951201, 0.8411204, -0.8458053, 0, 1, 0.3568628, 1,
-0.2910587, 0.149271, -1.864842, 0, 1, 0.3647059, 1,
-0.290708, 0.6473553, -0.1642314, 0, 1, 0.3686275, 1,
-0.2897322, -0.2433902, -2.251937, 0, 1, 0.3764706, 1,
-0.2896031, -1.929978, -1.972649, 0, 1, 0.3803922, 1,
-0.285271, -0.6411132, -4.268779, 0, 1, 0.3882353, 1,
-0.2852286, -0.2858782, -3.035533, 0, 1, 0.3921569, 1,
-0.2824773, -0.7016261, -2.691319, 0, 1, 0.4, 1,
-0.280927, -0.9738809, -2.022912, 0, 1, 0.4078431, 1,
-0.2768736, 0.2356032, -0.9577426, 0, 1, 0.4117647, 1,
-0.2762756, 0.7098769, 0.03517768, 0, 1, 0.4196078, 1,
-0.2754602, 0.7810124, 0.1964069, 0, 1, 0.4235294, 1,
-0.2739038, -0.09596948, -3.521226, 0, 1, 0.4313726, 1,
-0.2684473, 0.5173523, -1.795622, 0, 1, 0.4352941, 1,
-0.2664033, 0.03938342, -1.4125, 0, 1, 0.4431373, 1,
-0.2605609, 1.958905, -0.7805233, 0, 1, 0.4470588, 1,
-0.2604542, 0.8102665, -2.213573, 0, 1, 0.454902, 1,
-0.2594072, -1.402856, -2.769573, 0, 1, 0.4588235, 1,
-0.2555859, -1.38499, -2.225886, 0, 1, 0.4666667, 1,
-0.254291, -1.877147, -2.321425, 0, 1, 0.4705882, 1,
-0.2499235, -2.324769, -4.035643, 0, 1, 0.4784314, 1,
-0.2386828, 0.8529588, 2.07363, 0, 1, 0.4823529, 1,
-0.2339997, 0.509123, -0.2626156, 0, 1, 0.4901961, 1,
-0.2331849, 1.467152, -1.93737, 0, 1, 0.4941176, 1,
-0.2289642, 0.3715426, 0.248588, 0, 1, 0.5019608, 1,
-0.2282534, 1.240811, -0.6095878, 0, 1, 0.509804, 1,
-0.2275309, 0.3277886, 0.4706111, 0, 1, 0.5137255, 1,
-0.224889, -0.08491038, -0.4703105, 0, 1, 0.5215687, 1,
-0.2245593, 0.7957785, 0.229593, 0, 1, 0.5254902, 1,
-0.2242539, 0.4990241, -1.450942, 0, 1, 0.5333334, 1,
-0.223862, 1.847315, 0.8138316, 0, 1, 0.5372549, 1,
-0.2204439, 0.09511532, -0.548701, 0, 1, 0.5450981, 1,
-0.2167208, -1.277953, -3.701959, 0, 1, 0.5490196, 1,
-0.2060227, -0.2821251, -1.555431, 0, 1, 0.5568628, 1,
-0.2050807, -0.5389327, -2.830074, 0, 1, 0.5607843, 1,
-0.2044573, -0.4958299, -1.662894, 0, 1, 0.5686275, 1,
-0.2026295, -1.532253, -3.188619, 0, 1, 0.572549, 1,
-0.2014649, 1.260409, 0.1379739, 0, 1, 0.5803922, 1,
-0.192087, 0.5402407, 0.5739282, 0, 1, 0.5843138, 1,
-0.1881207, -1.114384, -3.074013, 0, 1, 0.5921569, 1,
-0.1854936, 0.9388078, 1.905902, 0, 1, 0.5960785, 1,
-0.1778484, 0.3461875, -0.9051213, 0, 1, 0.6039216, 1,
-0.1754838, -0.6508679, -1.950361, 0, 1, 0.6117647, 1,
-0.1724964, 0.4300527, -0.09629516, 0, 1, 0.6156863, 1,
-0.1685558, 0.5187165, -0.7180791, 0, 1, 0.6235294, 1,
-0.1670727, -1.105139, -3.394847, 0, 1, 0.627451, 1,
-0.166469, 1.343481, 0.1597511, 0, 1, 0.6352941, 1,
-0.1633738, -0.9579041, -3.719445, 0, 1, 0.6392157, 1,
-0.162427, -0.5350335, -2.06603, 0, 1, 0.6470588, 1,
-0.1568751, 1.417652, 0.6209342, 0, 1, 0.6509804, 1,
-0.1529688, -1.135306, -4.505436, 0, 1, 0.6588235, 1,
-0.1510588, -1.345498, -4.027816, 0, 1, 0.6627451, 1,
-0.1493163, -1.695261, -3.137012, 0, 1, 0.6705883, 1,
-0.1473936, 2.361744, 0.2245371, 0, 1, 0.6745098, 1,
-0.1431485, 1.302148, -1.083266, 0, 1, 0.682353, 1,
-0.1426873, -1.249308, -3.375709, 0, 1, 0.6862745, 1,
-0.1382753, 0.1780597, -1.306766, 0, 1, 0.6941177, 1,
-0.1380213, 0.6089877, -1.012925, 0, 1, 0.7019608, 1,
-0.1376183, -1.446034, -4.628632, 0, 1, 0.7058824, 1,
-0.1358719, -1.328415, -2.948409, 0, 1, 0.7137255, 1,
-0.1340366, 2.588063, 0.09103027, 0, 1, 0.7176471, 1,
-0.131572, 1.186749, 0.169293, 0, 1, 0.7254902, 1,
-0.1214559, 0.1570538, -0.1444373, 0, 1, 0.7294118, 1,
-0.120679, -0.5708275, -3.90932, 0, 1, 0.7372549, 1,
-0.1196231, -0.5205284, -1.516684, 0, 1, 0.7411765, 1,
-0.1157689, 0.5267864, 0.9644842, 0, 1, 0.7490196, 1,
-0.1156829, -1.18729, -1.564074, 0, 1, 0.7529412, 1,
-0.115268, -1.056403, -0.7779689, 0, 1, 0.7607843, 1,
-0.1143161, -0.1410599, -2.105176, 0, 1, 0.7647059, 1,
-0.1133816, 0.8211277, -1.320866, 0, 1, 0.772549, 1,
-0.1121784, -0.5051724, -3.582327, 0, 1, 0.7764706, 1,
-0.1072321, 1.151931, 0.6234533, 0, 1, 0.7843137, 1,
-0.1044105, 0.8706293, -0.7715576, 0, 1, 0.7882353, 1,
-0.09303319, 0.07383002, -0.4660698, 0, 1, 0.7960784, 1,
-0.09021555, 1.546282, -0.1111469, 0, 1, 0.8039216, 1,
-0.08683588, -0.4895314, -3.187546, 0, 1, 0.8078431, 1,
-0.08432244, 0.2977491, -2.26275, 0, 1, 0.8156863, 1,
-0.0842279, -1.384669, -2.080391, 0, 1, 0.8196079, 1,
-0.08408746, -1.628219, -3.875144, 0, 1, 0.827451, 1,
-0.07833443, 1.366992, -1.420261, 0, 1, 0.8313726, 1,
-0.07745001, 0.0291634, 0.6027336, 0, 1, 0.8392157, 1,
-0.07715449, 0.4770192, -0.2886864, 0, 1, 0.8431373, 1,
-0.07227495, -0.3650841, -3.767823, 0, 1, 0.8509804, 1,
-0.06515946, 1.04583, 0.527203, 0, 1, 0.854902, 1,
-0.06348372, -0.02700757, -2.955106, 0, 1, 0.8627451, 1,
-0.06254464, -0.8769823, -2.77204, 0, 1, 0.8666667, 1,
-0.06166929, 0.3982063, 1.15326, 0, 1, 0.8745098, 1,
-0.06047622, 0.7869079, -0.4867657, 0, 1, 0.8784314, 1,
-0.05321199, 2.266618, 0.8675042, 0, 1, 0.8862745, 1,
-0.04632952, 0.46984, -1.468702, 0, 1, 0.8901961, 1,
-0.04579654, -0.3899724, -2.052891, 0, 1, 0.8980392, 1,
-0.03966004, 1.210234, 0.3718021, 0, 1, 0.9058824, 1,
-0.03861662, -2.060049, -3.731917, 0, 1, 0.9098039, 1,
-0.03581587, -0.5805042, -2.998643, 0, 1, 0.9176471, 1,
-0.03388571, -0.2670656, -3.864716, 0, 1, 0.9215686, 1,
-0.0326235, 0.0336726, 0.7551563, 0, 1, 0.9294118, 1,
-0.02773662, 1.348458, -0.5663067, 0, 1, 0.9333333, 1,
-0.02161128, 0.3013174, 0.3254859, 0, 1, 0.9411765, 1,
-0.01692178, 0.53162, -0.7079445, 0, 1, 0.945098, 1,
-0.01367777, 0.9386491, -1.081894, 0, 1, 0.9529412, 1,
-0.01327774, -1.839936, -5.071538, 0, 1, 0.9568627, 1,
-0.01123798, -1.245615, -1.113485, 0, 1, 0.9647059, 1,
-0.009775197, -0.1593333, -2.495938, 0, 1, 0.9686275, 1,
-0.008903796, -0.3601816, -6.160311, 0, 1, 0.9764706, 1,
-0.006470478, -1.869919, -2.778883, 0, 1, 0.9803922, 1,
-0.005626088, -0.6126368, -2.970426, 0, 1, 0.9882353, 1,
-0.005115412, 0.1088514, 0.8741921, 0, 1, 0.9921569, 1,
-0.002619423, -0.339427, -2.632632, 0, 1, 1, 1,
-0.002497426, 0.02908793, -0.5173512, 0, 0.9921569, 1, 1,
-0.001611339, -0.8577455, -4.573729, 0, 0.9882353, 1, 1,
0.001203424, -0.3495696, 1.662099, 0, 0.9803922, 1, 1,
0.003972598, 1.307932, -0.2557325, 0, 0.9764706, 1, 1,
0.008199028, -0.5894057, 2.460422, 0, 0.9686275, 1, 1,
0.01120135, 1.542281, 0.1961209, 0, 0.9647059, 1, 1,
0.01586273, -1.387992, 3.356501, 0, 0.9568627, 1, 1,
0.01828352, 1.622317, -0.09144509, 0, 0.9529412, 1, 1,
0.01912563, -1.153483, 2.042601, 0, 0.945098, 1, 1,
0.02024584, 2.52042, -0.8575616, 0, 0.9411765, 1, 1,
0.02054041, 0.2312101, -0.2760531, 0, 0.9333333, 1, 1,
0.02189026, 1.09393, -0.4443271, 0, 0.9294118, 1, 1,
0.02438163, 1.028331, 0.5378297, 0, 0.9215686, 1, 1,
0.02557794, -0.6666855, 3.504106, 0, 0.9176471, 1, 1,
0.02629917, -1.104943, 1.705273, 0, 0.9098039, 1, 1,
0.03358649, -1.79288, 3.811945, 0, 0.9058824, 1, 1,
0.03366325, -0.3453261, 1.859575, 0, 0.8980392, 1, 1,
0.03562518, -1.88731, 2.906811, 0, 0.8901961, 1, 1,
0.03708455, -0.03138151, 2.842709, 0, 0.8862745, 1, 1,
0.04515192, -0.361065, 4.009148, 0, 0.8784314, 1, 1,
0.04544862, 1.302148, 1.561518, 0, 0.8745098, 1, 1,
0.04557647, 0.992449, -1.027986, 0, 0.8666667, 1, 1,
0.05033233, 0.3685493, 1.56919, 0, 0.8627451, 1, 1,
0.0547713, 0.4413002, -0.4504376, 0, 0.854902, 1, 1,
0.05623724, 0.5240009, -1.354975, 0, 0.8509804, 1, 1,
0.05659669, 0.04274099, 1.849153, 0, 0.8431373, 1, 1,
0.06252387, -0.1772452, 4.402174, 0, 0.8392157, 1, 1,
0.06502491, 0.09100346, 0.09535557, 0, 0.8313726, 1, 1,
0.0751664, 0.2419623, -1.65617, 0, 0.827451, 1, 1,
0.07519715, -0.7303239, 3.787127, 0, 0.8196079, 1, 1,
0.0756977, -1.166323, 2.422502, 0, 0.8156863, 1, 1,
0.07629921, 0.2147168, -0.3634337, 0, 0.8078431, 1, 1,
0.07661168, -0.1184108, 2.449019, 0, 0.8039216, 1, 1,
0.07781132, -1.19326, 4.577498, 0, 0.7960784, 1, 1,
0.08558582, 0.7460003, -0.1010397, 0, 0.7882353, 1, 1,
0.08675685, 0.4052982, 0.6306961, 0, 0.7843137, 1, 1,
0.09331769, 1.112543, -0.4021782, 0, 0.7764706, 1, 1,
0.09809335, -1.17161, 1.841269, 0, 0.772549, 1, 1,
0.1014872, -0.3765032, 3.030867, 0, 0.7647059, 1, 1,
0.101761, 2.189499, 0.9560767, 0, 0.7607843, 1, 1,
0.1097068, -0.9252582, 3.873393, 0, 0.7529412, 1, 1,
0.1190599, 0.3068146, -0.1118891, 0, 0.7490196, 1, 1,
0.1202574, -0.8266295, 3.490534, 0, 0.7411765, 1, 1,
0.1231757, -0.7908459, 2.636937, 0, 0.7372549, 1, 1,
0.1262733, -1.094289, 1.492189, 0, 0.7294118, 1, 1,
0.127535, 0.05302622, 0.7585604, 0, 0.7254902, 1, 1,
0.1310796, -0.306531, 1.751843, 0, 0.7176471, 1, 1,
0.1345104, 2.176725, -0.05299203, 0, 0.7137255, 1, 1,
0.1403131, 0.9501105, 0.07493666, 0, 0.7058824, 1, 1,
0.1406595, 1.904414, 0.5121893, 0, 0.6980392, 1, 1,
0.1453853, -0.1092932, 1.889392, 0, 0.6941177, 1, 1,
0.1460266, -0.3683715, 1.784718, 0, 0.6862745, 1, 1,
0.1476039, 0.1431137, 0.7659765, 0, 0.682353, 1, 1,
0.1476738, 0.9941005, -0.01682107, 0, 0.6745098, 1, 1,
0.155286, 0.5248837, -1.207155, 0, 0.6705883, 1, 1,
0.1569649, -0.3765161, 3.775611, 0, 0.6627451, 1, 1,
0.1574439, 0.7945149, 0.9701116, 0, 0.6588235, 1, 1,
0.1588775, 0.1985686, 1.33969, 0, 0.6509804, 1, 1,
0.1589866, -0.9444038, 2.754363, 0, 0.6470588, 1, 1,
0.1615711, -0.1139635, 2.321897, 0, 0.6392157, 1, 1,
0.1618457, 1.977777, 0.7393234, 0, 0.6352941, 1, 1,
0.1621928, 0.08038891, 1.495668, 0, 0.627451, 1, 1,
0.1778652, -0.04796251, -0.03005423, 0, 0.6235294, 1, 1,
0.1782344, -0.6643884, 4.285613, 0, 0.6156863, 1, 1,
0.1787848, 0.3894244, 0.2839265, 0, 0.6117647, 1, 1,
0.1807211, 1.234588, 0.4120617, 0, 0.6039216, 1, 1,
0.1810318, 0.8515528, 2.614359, 0, 0.5960785, 1, 1,
0.1862506, 0.6983441, 1.622417, 0, 0.5921569, 1, 1,
0.1917264, 0.7722074, -0.6297467, 0, 0.5843138, 1, 1,
0.193176, -1.298264, 2.611181, 0, 0.5803922, 1, 1,
0.1969783, -0.04927003, 1.525485, 0, 0.572549, 1, 1,
0.2012006, 0.3016251, 1.639767, 0, 0.5686275, 1, 1,
0.2012901, -0.5544426, 1.414651, 0, 0.5607843, 1, 1,
0.2015857, 2.387837, 0.2127665, 0, 0.5568628, 1, 1,
0.2026686, 1.293572, -0.3257179, 0, 0.5490196, 1, 1,
0.2033091, -0.5562598, 1.737573, 0, 0.5450981, 1, 1,
0.2094531, 1.629337, -0.1253027, 0, 0.5372549, 1, 1,
0.2111361, -0.1780265, 0.9104395, 0, 0.5333334, 1, 1,
0.2120559, 1.533426, 0.8704883, 0, 0.5254902, 1, 1,
0.2126251, -0.1209247, 2.106431, 0, 0.5215687, 1, 1,
0.2209072, 0.3217909, 1.126479, 0, 0.5137255, 1, 1,
0.2212144, 1.034305, 0.001303549, 0, 0.509804, 1, 1,
0.2345012, -2.283032, 2.869918, 0, 0.5019608, 1, 1,
0.2373355, -0.2994757, 3.45867, 0, 0.4941176, 1, 1,
0.2376103, 0.632322, 2.048441, 0, 0.4901961, 1, 1,
0.2380687, -1.267846, 2.156158, 0, 0.4823529, 1, 1,
0.2393688, -0.4324364, 2.041642, 0, 0.4784314, 1, 1,
0.2440066, 0.04893103, 2.31078, 0, 0.4705882, 1, 1,
0.2479047, 0.2847976, 1.808845, 0, 0.4666667, 1, 1,
0.2483979, 0.01131494, 2.248485, 0, 0.4588235, 1, 1,
0.2511209, 1.590333, 0.4551761, 0, 0.454902, 1, 1,
0.2555151, 0.2533891, 1.183672, 0, 0.4470588, 1, 1,
0.2601946, -0.8559685, 2.570548, 0, 0.4431373, 1, 1,
0.2617612, 0.7449269, 2.029441, 0, 0.4352941, 1, 1,
0.2629767, 0.9274331, 0.4105041, 0, 0.4313726, 1, 1,
0.2645915, 1.494859, -0.2696281, 0, 0.4235294, 1, 1,
0.2646902, 1.19484, 1.578993, 0, 0.4196078, 1, 1,
0.2676108, -0.177783, 1.073914, 0, 0.4117647, 1, 1,
0.2755146, 0.9622555, -1.323603, 0, 0.4078431, 1, 1,
0.278834, -0.8725775, 3.058682, 0, 0.4, 1, 1,
0.280104, -2.267181, 2.816144, 0, 0.3921569, 1, 1,
0.2804481, 2.724534, 0.5474942, 0, 0.3882353, 1, 1,
0.2856295, -0.7495027, 2.444905, 0, 0.3803922, 1, 1,
0.2868442, -0.08816768, 1.039031, 0, 0.3764706, 1, 1,
0.2913183, -0.6192561, 1.753595, 0, 0.3686275, 1, 1,
0.2920459, 0.1320024, 0.4010707, 0, 0.3647059, 1, 1,
0.2936268, -0.377283, 3.207588, 0, 0.3568628, 1, 1,
0.2967773, -0.8152059, 1.734328, 0, 0.3529412, 1, 1,
0.2998693, 0.2244762, 1.313486, 0, 0.345098, 1, 1,
0.3036037, 0.4853705, 1.580988, 0, 0.3411765, 1, 1,
0.3041696, -1.86586, 1.800365, 0, 0.3333333, 1, 1,
0.3095443, -0.3032886, 3.313421, 0, 0.3294118, 1, 1,
0.315341, 0.9542896, 0.9950494, 0, 0.3215686, 1, 1,
0.3190524, 1.339556, 0.528905, 0, 0.3176471, 1, 1,
0.3193314, 0.7247851, 0.4013116, 0, 0.3098039, 1, 1,
0.3219013, 0.6167409, -0.6704192, 0, 0.3058824, 1, 1,
0.3232304, 1.160787, 0.1968474, 0, 0.2980392, 1, 1,
0.3269913, -0.3725916, 3.071892, 0, 0.2901961, 1, 1,
0.32941, -0.6530029, 2.263992, 0, 0.2862745, 1, 1,
0.3327827, 0.3154626, 0.4841226, 0, 0.2784314, 1, 1,
0.332979, 0.520158, -0.1790824, 0, 0.2745098, 1, 1,
0.3347827, 0.404915, 0.6387723, 0, 0.2666667, 1, 1,
0.3360863, -0.1912814, 1.614807, 0, 0.2627451, 1, 1,
0.3368535, 1.148057, 1.594852, 0, 0.254902, 1, 1,
0.3424022, 0.4004831, 0.4010961, 0, 0.2509804, 1, 1,
0.3583642, 1.024888, -0.8250319, 0, 0.2431373, 1, 1,
0.3611697, -1.051043, 2.666299, 0, 0.2392157, 1, 1,
0.3616055, -1.248044, 4.512167, 0, 0.2313726, 1, 1,
0.3620529, 0.3980593, 1.261045, 0, 0.227451, 1, 1,
0.3657502, 0.2195954, 2.781724, 0, 0.2196078, 1, 1,
0.367301, 1.803968, -1.0989, 0, 0.2156863, 1, 1,
0.3700539, -1.397339, 1.88284, 0, 0.2078431, 1, 1,
0.370119, -0.2574879, 3.202354, 0, 0.2039216, 1, 1,
0.371395, -1.33981, 4.635458, 0, 0.1960784, 1, 1,
0.3763608, 0.1368391, 2.480671, 0, 0.1882353, 1, 1,
0.3792179, 1.116896, 0.02272916, 0, 0.1843137, 1, 1,
0.3826467, 1.684834, -0.8637677, 0, 0.1764706, 1, 1,
0.3829307, 0.04084291, 3.521415, 0, 0.172549, 1, 1,
0.3933283, -1.285284, 4.073096, 0, 0.1647059, 1, 1,
0.4010036, 0.6354052, 0.9784727, 0, 0.1607843, 1, 1,
0.4025335, 0.09233296, 1.443014, 0, 0.1529412, 1, 1,
0.4058128, -0.003433526, 1.359754, 0, 0.1490196, 1, 1,
0.4062574, -0.02444675, 1.094357, 0, 0.1411765, 1, 1,
0.4082772, 1.299358, -0.03508276, 0, 0.1372549, 1, 1,
0.410122, 0.2711595, 3.420759, 0, 0.1294118, 1, 1,
0.4148273, -0.1226538, 1.16086, 0, 0.1254902, 1, 1,
0.4193432, 0.254322, 1.213308, 0, 0.1176471, 1, 1,
0.4196733, 0.7197525, -0.3832297, 0, 0.1137255, 1, 1,
0.4231469, 0.3796307, 0.7693715, 0, 0.1058824, 1, 1,
0.4288854, -0.8601854, 2.374356, 0, 0.09803922, 1, 1,
0.4324777, -1.224283, 3.127245, 0, 0.09411765, 1, 1,
0.4381915, 1.42367, 0.2204343, 0, 0.08627451, 1, 1,
0.4382381, 0.9735644, 1.087402, 0, 0.08235294, 1, 1,
0.4413703, 1.573821, -1.805082, 0, 0.07450981, 1, 1,
0.443225, -0.3970256, 2.366307, 0, 0.07058824, 1, 1,
0.4455566, -0.09505602, 1.918318, 0, 0.0627451, 1, 1,
0.4480883, 1.381842, 1.380407, 0, 0.05882353, 1, 1,
0.4531983, -0.5660887, 3.147409, 0, 0.05098039, 1, 1,
0.4548921, 1.316616, 0.09508143, 0, 0.04705882, 1, 1,
0.4571409, -0.7346308, 4.281288, 0, 0.03921569, 1, 1,
0.4589569, 0.8966346, 0.9412926, 0, 0.03529412, 1, 1,
0.4638099, -0.5007418, 1.771907, 0, 0.02745098, 1, 1,
0.46912, -0.9689006, 0.8517621, 0, 0.02352941, 1, 1,
0.4691432, -0.1399818, 3.215698, 0, 0.01568628, 1, 1,
0.4692613, 1.286671, 1.076357, 0, 0.01176471, 1, 1,
0.4695115, -0.8207577, 3.516177, 0, 0.003921569, 1, 1,
0.469531, 0.3384513, 0.8077828, 0.003921569, 0, 1, 1,
0.4730102, -0.983727, 2.807484, 0.007843138, 0, 1, 1,
0.4756012, 1.106812, 0.7718178, 0.01568628, 0, 1, 1,
0.4758704, -0.7836937, 0.9246644, 0.01960784, 0, 1, 1,
0.479888, -2.352558, 4.261805, 0.02745098, 0, 1, 1,
0.4804013, 0.375362, -0.4770625, 0.03137255, 0, 1, 1,
0.485101, -0.5979953, 2.556655, 0.03921569, 0, 1, 1,
0.4868614, 1.219945, 1.485526, 0.04313726, 0, 1, 1,
0.4872276, -0.2893065, 3.103637, 0.05098039, 0, 1, 1,
0.4970178, 0.164918, 2.857326, 0.05490196, 0, 1, 1,
0.4997239, 0.009049112, 1.505919, 0.0627451, 0, 1, 1,
0.5053347, -2.973848, 2.017266, 0.06666667, 0, 1, 1,
0.5064848, 0.9421493, -0.6389185, 0.07450981, 0, 1, 1,
0.5084208, -0.09412818, 2.379482, 0.07843138, 0, 1, 1,
0.5089507, 0.2649875, -0.7107754, 0.08627451, 0, 1, 1,
0.5100069, 0.1484409, 2.335638, 0.09019608, 0, 1, 1,
0.5119483, 0.4556298, 0.674955, 0.09803922, 0, 1, 1,
0.5215456, 1.199761, -0.09514009, 0.1058824, 0, 1, 1,
0.5216219, 0.121719, 1.72787, 0.1098039, 0, 1, 1,
0.5241628, 0.3960492, 2.348514, 0.1176471, 0, 1, 1,
0.5343685, -0.3307103, 2.54549, 0.1215686, 0, 1, 1,
0.5441434, -1.192195, 3.067113, 0.1294118, 0, 1, 1,
0.5502181, 0.9732744, 0.4070533, 0.1333333, 0, 1, 1,
0.5513745, -0.1427386, 2.934627, 0.1411765, 0, 1, 1,
0.5525181, 0.397985, 0.5899335, 0.145098, 0, 1, 1,
0.5527826, 0.5743947, 1.198206, 0.1529412, 0, 1, 1,
0.5529484, 0.4420893, 2.338233, 0.1568628, 0, 1, 1,
0.5541701, 1.609319, -1.175973, 0.1647059, 0, 1, 1,
0.5580474, 2.07119, -1.144238, 0.1686275, 0, 1, 1,
0.5597335, 0.3436806, 0.8208234, 0.1764706, 0, 1, 1,
0.5601145, -0.2368718, 3.497695, 0.1803922, 0, 1, 1,
0.5604967, 1.528546, 0.9202407, 0.1882353, 0, 1, 1,
0.561021, 1.740151, 2.219087, 0.1921569, 0, 1, 1,
0.562921, -1.499755, 3.748646, 0.2, 0, 1, 1,
0.5653382, -0.3227034, 3.459716, 0.2078431, 0, 1, 1,
0.566251, -0.2277953, 2.274902, 0.2117647, 0, 1, 1,
0.5663077, 0.4530859, -0.2347003, 0.2196078, 0, 1, 1,
0.5692977, 0.5827839, 1.036938, 0.2235294, 0, 1, 1,
0.5698394, 0.4160079, 1.338923, 0.2313726, 0, 1, 1,
0.5718858, -0.6656574, 2.41585, 0.2352941, 0, 1, 1,
0.5727761, 2.308882, 0.5912812, 0.2431373, 0, 1, 1,
0.572884, -1.296441, 3.309049, 0.2470588, 0, 1, 1,
0.5757153, -0.8627855, 2.401078, 0.254902, 0, 1, 1,
0.5788665, -0.5405121, 2.968722, 0.2588235, 0, 1, 1,
0.5836229, -0.1966893, 1.55168, 0.2666667, 0, 1, 1,
0.5897446, -0.766251, 3.907409, 0.2705882, 0, 1, 1,
0.5922452, -1.199124, 4.559416, 0.2784314, 0, 1, 1,
0.5979434, 1.047784, 2.033284, 0.282353, 0, 1, 1,
0.5983452, 0.2506675, 0.9736216, 0.2901961, 0, 1, 1,
0.6053004, -1.063107, 1.550691, 0.2941177, 0, 1, 1,
0.6074529, 0.3049083, 0.5901206, 0.3019608, 0, 1, 1,
0.6080033, 0.6957976, 1.818416, 0.3098039, 0, 1, 1,
0.6144302, 0.6781077, 1.136311, 0.3137255, 0, 1, 1,
0.6185948, -0.960325, 1.697492, 0.3215686, 0, 1, 1,
0.6219895, 0.9809616, -1.134957, 0.3254902, 0, 1, 1,
0.6243386, 0.6715503, 0.4265218, 0.3333333, 0, 1, 1,
0.6254415, -1.170952, 3.629223, 0.3372549, 0, 1, 1,
0.6273044, -0.7356712, 3.066718, 0.345098, 0, 1, 1,
0.630174, 1.039454, 0.3464113, 0.3490196, 0, 1, 1,
0.6315542, 2.174161, 1.213654, 0.3568628, 0, 1, 1,
0.6329751, -0.6416137, 2.877053, 0.3607843, 0, 1, 1,
0.6333639, 0.8018665, 0.4177248, 0.3686275, 0, 1, 1,
0.6445418, 0.2813883, -2.091664, 0.372549, 0, 1, 1,
0.6484252, 0.7382566, 1.453026, 0.3803922, 0, 1, 1,
0.6492053, 0.7811744, -0.4394062, 0.3843137, 0, 1, 1,
0.6535333, -0.4397179, 2.335045, 0.3921569, 0, 1, 1,
0.6538163, 1.418255, 1.646757, 0.3960784, 0, 1, 1,
0.6540286, -1.403319, 2.67858, 0.4039216, 0, 1, 1,
0.6543354, 0.06640874, 2.165464, 0.4117647, 0, 1, 1,
0.6565802, -0.2334163, 2.357463, 0.4156863, 0, 1, 1,
0.660925, -0.157926, 0.8263891, 0.4235294, 0, 1, 1,
0.6628264, 1.585598, 1.752645, 0.427451, 0, 1, 1,
0.6647934, 0.06833275, 0.7042635, 0.4352941, 0, 1, 1,
0.6673882, 0.8567488, -1.667988, 0.4392157, 0, 1, 1,
0.6677366, -0.3547179, 0.8274238, 0.4470588, 0, 1, 1,
0.6712095, -0.4418541, 2.365277, 0.4509804, 0, 1, 1,
0.6749834, -0.8438287, 2.192699, 0.4588235, 0, 1, 1,
0.6800787, -0.1419448, 2.213989, 0.4627451, 0, 1, 1,
0.6810264, -0.2023194, 2.017344, 0.4705882, 0, 1, 1,
0.6816136, 1.496013, 1.253623, 0.4745098, 0, 1, 1,
0.6866136, -1.575744, 1.477791, 0.4823529, 0, 1, 1,
0.6909878, -0.4692475, 2.035176, 0.4862745, 0, 1, 1,
0.6950164, 1.576558, 0.7173246, 0.4941176, 0, 1, 1,
0.6981025, 1.154817, 1.123855, 0.5019608, 0, 1, 1,
0.6985761, -1.369295, 3.213443, 0.5058824, 0, 1, 1,
0.6993378, -0.5352648, 1.813367, 0.5137255, 0, 1, 1,
0.6996006, 0.6796151, 0.2038849, 0.5176471, 0, 1, 1,
0.7024983, -1.521908, 3.337395, 0.5254902, 0, 1, 1,
0.707208, 0.1433037, 1.337927, 0.5294118, 0, 1, 1,
0.7127783, -1.15315, 0.8076023, 0.5372549, 0, 1, 1,
0.721009, -0.511586, 2.403261, 0.5411765, 0, 1, 1,
0.723153, 0.255866, 0.1315302, 0.5490196, 0, 1, 1,
0.7323806, 1.519635, -0.198401, 0.5529412, 0, 1, 1,
0.7342419, 1.113273, 1.439858, 0.5607843, 0, 1, 1,
0.7357359, -0.6802725, 1.007594, 0.5647059, 0, 1, 1,
0.7380619, -1.673583, 3.60177, 0.572549, 0, 1, 1,
0.7391991, -0.6157569, 2.843779, 0.5764706, 0, 1, 1,
0.7428289, -0.5814052, 3.717575, 0.5843138, 0, 1, 1,
0.7434019, -1.91116, 1.388451, 0.5882353, 0, 1, 1,
0.7435791, 0.2540905, 0.3805166, 0.5960785, 0, 1, 1,
0.7463946, -0.6809474, 0.8729119, 0.6039216, 0, 1, 1,
0.7537645, -0.6179276, 3.75618, 0.6078432, 0, 1, 1,
0.7551997, 1.248496, 0.2272973, 0.6156863, 0, 1, 1,
0.7635948, 1.537521, 1.716259, 0.6196079, 0, 1, 1,
0.7672283, -0.4295961, 1.884885, 0.627451, 0, 1, 1,
0.7718507, -0.5669522, 2.355206, 0.6313726, 0, 1, 1,
0.7735157, -1.656303, 2.561202, 0.6392157, 0, 1, 1,
0.7763669, 2.872709, 1.318381, 0.6431373, 0, 1, 1,
0.7860021, 0.5917806, 1.91689, 0.6509804, 0, 1, 1,
0.7870674, 0.4009145, 2.108777, 0.654902, 0, 1, 1,
0.794782, -0.7181643, 2.347223, 0.6627451, 0, 1, 1,
0.7948236, 0.5410136, 0.5594158, 0.6666667, 0, 1, 1,
0.796151, 0.01228899, 3.325453, 0.6745098, 0, 1, 1,
0.7976179, -0.6270711, 1.633202, 0.6784314, 0, 1, 1,
0.8019207, -0.9420388, 2.058702, 0.6862745, 0, 1, 1,
0.8028169, -0.4447458, 2.510317, 0.6901961, 0, 1, 1,
0.8042733, 0.3136588, 0.7394491, 0.6980392, 0, 1, 1,
0.8180192, 0.1004357, 2.654195, 0.7058824, 0, 1, 1,
0.8220397, -0.5712538, 1.795065, 0.7098039, 0, 1, 1,
0.8246185, 0.1110102, 2.179833, 0.7176471, 0, 1, 1,
0.8326373, 1.269206, 0.1263942, 0.7215686, 0, 1, 1,
0.8443465, 0.04615059, 1.99915, 0.7294118, 0, 1, 1,
0.8455458, 0.01167737, 2.955409, 0.7333333, 0, 1, 1,
0.8503638, 1.426354, 0.2242256, 0.7411765, 0, 1, 1,
0.8504563, -0.08826804, 2.998058, 0.7450981, 0, 1, 1,
0.8552343, -0.4314585, 2.493174, 0.7529412, 0, 1, 1,
0.8564764, -1.271804, 1.5876, 0.7568628, 0, 1, 1,
0.85901, 0.1959829, 1.212535, 0.7647059, 0, 1, 1,
0.8613594, -0.8854772, 2.73251, 0.7686275, 0, 1, 1,
0.863965, 0.6261362, -0.5143557, 0.7764706, 0, 1, 1,
0.8660578, 0.02856424, 0.3641287, 0.7803922, 0, 1, 1,
0.8704087, 0.7879425, 2.520035, 0.7882353, 0, 1, 1,
0.8712713, 1.344062, 0.4564884, 0.7921569, 0, 1, 1,
0.8777639, 0.296866, 2.10798, 0.8, 0, 1, 1,
0.8785113, 1.020411, 1.17731, 0.8078431, 0, 1, 1,
0.8873659, -0.1740224, 1.681489, 0.8117647, 0, 1, 1,
0.8899188, -0.1331335, 2.15487, 0.8196079, 0, 1, 1,
0.893618, -0.4072485, 1.070667, 0.8235294, 0, 1, 1,
0.8944491, -1.893101, 2.231859, 0.8313726, 0, 1, 1,
0.8984338, 0.04252776, 0.6361625, 0.8352941, 0, 1, 1,
0.8993044, 1.516835, 1.190535, 0.8431373, 0, 1, 1,
0.900403, 0.8473769, -0.5144055, 0.8470588, 0, 1, 1,
0.9037356, -0.009400986, 2.519542, 0.854902, 0, 1, 1,
0.9074014, -0.1345066, 3.351511, 0.8588235, 0, 1, 1,
0.9124282, 1.073269, -0.2753051, 0.8666667, 0, 1, 1,
0.9180646, 0.8957141, 1.727629, 0.8705882, 0, 1, 1,
0.9182132, 0.00783285, 2.180276, 0.8784314, 0, 1, 1,
0.9347191, 2.29261, 0.4910127, 0.8823529, 0, 1, 1,
0.9372934, 0.2229892, 2.157754, 0.8901961, 0, 1, 1,
0.9470639, 1.081213, 0.8102116, 0.8941177, 0, 1, 1,
0.948204, 0.8762234, -0.2472952, 0.9019608, 0, 1, 1,
0.9531642, 0.9407805, -0.310242, 0.9098039, 0, 1, 1,
0.9550159, -0.3724124, 1.786835, 0.9137255, 0, 1, 1,
0.9623567, -0.7497468, 1.797093, 0.9215686, 0, 1, 1,
0.9631374, 0.6585747, 0.7774262, 0.9254902, 0, 1, 1,
0.9681104, -1.708276, 1.964684, 0.9333333, 0, 1, 1,
0.9684342, -1.484479, 3.93363, 0.9372549, 0, 1, 1,
0.9734172, -0.5089999, 2.086984, 0.945098, 0, 1, 1,
0.9778942, 0.266973, 1.907869, 0.9490196, 0, 1, 1,
0.9800602, -0.4255637, 0.6478365, 0.9568627, 0, 1, 1,
0.980112, -0.918914, 2.585478, 0.9607843, 0, 1, 1,
0.9836891, 0.2309448, 1.52629, 0.9686275, 0, 1, 1,
0.9837019, 0.02168405, 1.906375, 0.972549, 0, 1, 1,
1.002423, 1.176236, 0.5101241, 0.9803922, 0, 1, 1,
1.003648, 0.1742318, 3.008144, 0.9843137, 0, 1, 1,
1.008084, 1.054626, 1.777203, 0.9921569, 0, 1, 1,
1.012912, -0.4062207, 1.029596, 0.9960784, 0, 1, 1,
1.021907, 0.9136833, 1.847188, 1, 0, 0.9960784, 1,
1.025984, 2.253297, 1.438294, 1, 0, 0.9882353, 1,
1.030621, 1.420375, 1.740529, 1, 0, 0.9843137, 1,
1.036148, 1.466917, -0.03246231, 1, 0, 0.9764706, 1,
1.041025, -1.15818, 2.167975, 1, 0, 0.972549, 1,
1.042184, 0.06224105, 0.2835502, 1, 0, 0.9647059, 1,
1.044034, -0.5789446, 2.436101, 1, 0, 0.9607843, 1,
1.048331, -1.03437, 1.132422, 1, 0, 0.9529412, 1,
1.04867, 1.66921, -0.313984, 1, 0, 0.9490196, 1,
1.048907, -2.464817, 2.826858, 1, 0, 0.9411765, 1,
1.049728, 0.8240907, 1.825344, 1, 0, 0.9372549, 1,
1.063444, 0.6011688, 1.323892, 1, 0, 0.9294118, 1,
1.080561, 0.1048139, 1.781363, 1, 0, 0.9254902, 1,
1.082343, 0.3231123, 1.126835, 1, 0, 0.9176471, 1,
1.085741, 1.06762, 1.964617, 1, 0, 0.9137255, 1,
1.086533, 0.5613776, 1.105035, 1, 0, 0.9058824, 1,
1.090143, 3.073416, 0.8299611, 1, 0, 0.9019608, 1,
1.097856, -0.7128904, 1.602347, 1, 0, 0.8941177, 1,
1.10218, -0.08425631, 1.773865, 1, 0, 0.8862745, 1,
1.104574, -1.134141, 1.248665, 1, 0, 0.8823529, 1,
1.117363, 1.274544, 0.8612211, 1, 0, 0.8745098, 1,
1.127142, 0.7851637, 0.7698668, 1, 0, 0.8705882, 1,
1.129419, -0.1788207, 1.542724, 1, 0, 0.8627451, 1,
1.130168, 0.8482726, 1.562425, 1, 0, 0.8588235, 1,
1.136708, 1.131785, 1.08545, 1, 0, 0.8509804, 1,
1.141148, 0.379591, 0.6426365, 1, 0, 0.8470588, 1,
1.142816, -0.06687771, 3.134171, 1, 0, 0.8392157, 1,
1.144276, -0.3004654, 1.860355, 1, 0, 0.8352941, 1,
1.144661, 0.3999608, 1.070087, 1, 0, 0.827451, 1,
1.144794, 0.04161485, 2.018238, 1, 0, 0.8235294, 1,
1.147439, -0.5791017, 1.538991, 1, 0, 0.8156863, 1,
1.147593, -0.3552507, 2.903118, 1, 0, 0.8117647, 1,
1.159182, 0.4442457, 1.105742, 1, 0, 0.8039216, 1,
1.163532, 0.7570459, 1.045149, 1, 0, 0.7960784, 1,
1.170528, -1.7934, 2.694255, 1, 0, 0.7921569, 1,
1.173327, -1.259299, 3.122311, 1, 0, 0.7843137, 1,
1.17489, -0.6164454, 1.945707, 1, 0, 0.7803922, 1,
1.177657, -1.137405, 2.635034, 1, 0, 0.772549, 1,
1.178139, 1.407053, 0.3522526, 1, 0, 0.7686275, 1,
1.18079, -0.9359236, 1.734753, 1, 0, 0.7607843, 1,
1.181947, -0.186663, 1.581281, 1, 0, 0.7568628, 1,
1.184121, 0.3900481, -0.5855101, 1, 0, 0.7490196, 1,
1.187527, -0.2869817, 1.362343, 1, 0, 0.7450981, 1,
1.18814, 0.1502263, 1.225416, 1, 0, 0.7372549, 1,
1.195697, -0.6400721, 1.839581, 1, 0, 0.7333333, 1,
1.201115, -0.2731976, 1.932089, 1, 0, 0.7254902, 1,
1.204304, -0.08837993, -1.175316, 1, 0, 0.7215686, 1,
1.21078, -0.9748108, 2.269848, 1, 0, 0.7137255, 1,
1.212678, -1.852931, 1.313217, 1, 0, 0.7098039, 1,
1.212717, 1.2982, 1.017499, 1, 0, 0.7019608, 1,
1.215078, -0.8969517, 2.833318, 1, 0, 0.6941177, 1,
1.224475, 1.566353, 1.735612, 1, 0, 0.6901961, 1,
1.232311, 1.43798, 0.4582933, 1, 0, 0.682353, 1,
1.233364, -0.7025949, 2.222513, 1, 0, 0.6784314, 1,
1.235042, 0.2619714, 1.798028, 1, 0, 0.6705883, 1,
1.240308, -0.5698078, 1.768409, 1, 0, 0.6666667, 1,
1.243066, 1.263199, 0.7060264, 1, 0, 0.6588235, 1,
1.243805, 1.298253, 2.701636, 1, 0, 0.654902, 1,
1.25982, 0.6383823, 1.837518, 1, 0, 0.6470588, 1,
1.264493, 2.724134, 1.624771, 1, 0, 0.6431373, 1,
1.265989, 0.1893755, 1.687993, 1, 0, 0.6352941, 1,
1.271083, -1.523981, 1.072523, 1, 0, 0.6313726, 1,
1.279159, -0.1300364, 1.881088, 1, 0, 0.6235294, 1,
1.289668, -0.9394733, 2.934442, 1, 0, 0.6196079, 1,
1.299835, -0.4707448, 2.109157, 1, 0, 0.6117647, 1,
1.306229, 1.069643, -0.02007515, 1, 0, 0.6078432, 1,
1.306691, -2.671988, 2.759942, 1, 0, 0.6, 1,
1.314241, 0.8119529, 1.925933, 1, 0, 0.5921569, 1,
1.321706, -1.751006, 0.9119588, 1, 0, 0.5882353, 1,
1.332569, 0.05077676, 1.32184, 1, 0, 0.5803922, 1,
1.337747, 0.6097419, 0.1645585, 1, 0, 0.5764706, 1,
1.338422, -1.495485, 3.100894, 1, 0, 0.5686275, 1,
1.340957, 0.2216808, 1.086585, 1, 0, 0.5647059, 1,
1.342684, -0.6383195, 0.4797857, 1, 0, 0.5568628, 1,
1.347761, 0.3940629, 1.859553, 1, 0, 0.5529412, 1,
1.358036, -0.6515758, 3.190986, 1, 0, 0.5450981, 1,
1.362297, -3.051561, 4.121346, 1, 0, 0.5411765, 1,
1.374774, 0.5604299, 1.577747, 1, 0, 0.5333334, 1,
1.379863, -0.9708608, 2.955121, 1, 0, 0.5294118, 1,
1.380331, 0.6272466, -1.667856, 1, 0, 0.5215687, 1,
1.38084, -1.08724, 3.728143, 1, 0, 0.5176471, 1,
1.386224, 2.120654, 0.7080072, 1, 0, 0.509804, 1,
1.39525, 0.9843786, 0.8454615, 1, 0, 0.5058824, 1,
1.395878, 0.01126995, 2.062379, 1, 0, 0.4980392, 1,
1.404508, 0.7553957, 0.9936956, 1, 0, 0.4901961, 1,
1.408627, 0.03757507, 0.4284266, 1, 0, 0.4862745, 1,
1.410032, -0.6868315, 3.590967, 1, 0, 0.4784314, 1,
1.419446, -0.6881129, 3.209556, 1, 0, 0.4745098, 1,
1.431113, -0.5112557, 1.579893, 1, 0, 0.4666667, 1,
1.432993, -0.8159506, 2.623995, 1, 0, 0.4627451, 1,
1.433404, -0.9868257, 1.287978, 1, 0, 0.454902, 1,
1.438733, 1.41722, 0.9211757, 1, 0, 0.4509804, 1,
1.443821, -0.1315937, 2.279972, 1, 0, 0.4431373, 1,
1.449451, -0.1132017, 1.428873, 1, 0, 0.4392157, 1,
1.476273, 1.804376, 1.002689, 1, 0, 0.4313726, 1,
1.485127, -0.6608063, 2.611696, 1, 0, 0.427451, 1,
1.487481, 2.191799, 1.47869, 1, 0, 0.4196078, 1,
1.494077, -0.02149594, 2.455331, 1, 0, 0.4156863, 1,
1.494775, -0.03213455, 0.6367565, 1, 0, 0.4078431, 1,
1.507375, 0.3448005, 2.957553, 1, 0, 0.4039216, 1,
1.509909, 1.405106, 1.10374, 1, 0, 0.3960784, 1,
1.514571, -0.5713216, 1.742801, 1, 0, 0.3882353, 1,
1.517623, -0.6324825, 2.811091, 1, 0, 0.3843137, 1,
1.528273, 0.9233159, 0.361277, 1, 0, 0.3764706, 1,
1.528657, 0.59664, 0.5099644, 1, 0, 0.372549, 1,
1.529503, 0.235966, 1.214714, 1, 0, 0.3647059, 1,
1.531614, -0.5991142, 1.880896, 1, 0, 0.3607843, 1,
1.533229, -0.5818201, 1.161239, 1, 0, 0.3529412, 1,
1.545476, 1.289505, -0.3796748, 1, 0, 0.3490196, 1,
1.55101, -0.5706828, 1.642085, 1, 0, 0.3411765, 1,
1.555169, 1.385629, 0.6453899, 1, 0, 0.3372549, 1,
1.559776, -0.08871527, 1.601955, 1, 0, 0.3294118, 1,
1.567476, -0.2348359, 0.2244306, 1, 0, 0.3254902, 1,
1.573177, 0.9555492, 0.8098114, 1, 0, 0.3176471, 1,
1.608395, 1.338903, -0.6243728, 1, 0, 0.3137255, 1,
1.613135, -1.899448, 4.566974, 1, 0, 0.3058824, 1,
1.621426, -0.2868778, 1.239464, 1, 0, 0.2980392, 1,
1.626034, -1.199856, 0.8538437, 1, 0, 0.2941177, 1,
1.63732, 0.01704078, 2.523319, 1, 0, 0.2862745, 1,
1.643492, -0.3396196, 1.131956, 1, 0, 0.282353, 1,
1.650917, 0.156019, 2.439366, 1, 0, 0.2745098, 1,
1.65302, 0.3981681, 1.875562, 1, 0, 0.2705882, 1,
1.675619, -0.1318479, 3.329878, 1, 0, 0.2627451, 1,
1.68453, -0.166715, 1.687487, 1, 0, 0.2588235, 1,
1.69948, 1.712557, 3.344346, 1, 0, 0.2509804, 1,
1.749036, -0.6028237, 0.6970562, 1, 0, 0.2470588, 1,
1.780131, -0.749504, 0.8287899, 1, 0, 0.2392157, 1,
1.79388, -0.2968057, 2.933138, 1, 0, 0.2352941, 1,
1.796783, -1.41547, 2.355625, 1, 0, 0.227451, 1,
1.815871, 0.1457512, 0.8462502, 1, 0, 0.2235294, 1,
1.822809, 0.1359224, 2.701666, 1, 0, 0.2156863, 1,
1.83022, 1.056114, 1.177091, 1, 0, 0.2117647, 1,
1.863657, -0.2850024, 2.07043, 1, 0, 0.2039216, 1,
1.879611, 1.138633, 0.9459239, 1, 0, 0.1960784, 1,
1.88454, 1.733636, 0.6762623, 1, 0, 0.1921569, 1,
1.896518, -0.4768981, 0.3961293, 1, 0, 0.1843137, 1,
1.922715, -0.867008, 2.510652, 1, 0, 0.1803922, 1,
1.934267, 0.62853, -1.458551, 1, 0, 0.172549, 1,
1.940376, 1.788663, 1.720852, 1, 0, 0.1686275, 1,
1.948824, 2.17896, 0.3142166, 1, 0, 0.1607843, 1,
1.971736, -0.6788453, 1.968788, 1, 0, 0.1568628, 1,
1.975287, 1.89376, 2.735004, 1, 0, 0.1490196, 1,
1.995513, 0.6359557, 1.528559, 1, 0, 0.145098, 1,
1.997804, 0.508004, 2.049499, 1, 0, 0.1372549, 1,
2.001237, 0.7669932, 0.2435722, 1, 0, 0.1333333, 1,
2.00319, 0.1478057, 1.506345, 1, 0, 0.1254902, 1,
2.027049, -0.2212018, 0.6152403, 1, 0, 0.1215686, 1,
2.035503, 0.6327339, -0.6527268, 1, 0, 0.1137255, 1,
2.036767, -0.5589854, -0.2591194, 1, 0, 0.1098039, 1,
2.048231, 1.558488, -0.7580371, 1, 0, 0.1019608, 1,
2.061301, 1.667832, 1.609236, 1, 0, 0.09411765, 1,
2.070456, -0.5147539, 2.487714, 1, 0, 0.09019608, 1,
2.128927, 0.3350044, 1.852749, 1, 0, 0.08235294, 1,
2.140939, -0.441343, 1.546934, 1, 0, 0.07843138, 1,
2.199094, 1.597337, 0.02686339, 1, 0, 0.07058824, 1,
2.233304, -0.4299401, 0.6293024, 1, 0, 0.06666667, 1,
2.250236, -0.5022343, 0.1460386, 1, 0, 0.05882353, 1,
2.255951, 0.208444, 1.412985, 1, 0, 0.05490196, 1,
2.272206, 1.437832, -0.8276598, 1, 0, 0.04705882, 1,
2.342574, 0.5816278, 1.370631, 1, 0, 0.04313726, 1,
2.356682, 1.172362, 0.8968016, 1, 0, 0.03529412, 1,
2.4491, -0.937584, 0.8470344, 1, 0, 0.03137255, 1,
2.573094, -0.9851049, 1.939442, 1, 0, 0.02352941, 1,
2.847333, 0.7116148, 1.508205, 1, 0, 0.01960784, 1,
2.995826, -1.614959, 2.103394, 1, 0, 0.01176471, 1,
3.292515, -2.18542, 2.75293, 1, 0, 0.007843138, 1
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
0.1576267, -4.089744, -7.990194, 0, -0.5, 0.5, 0.5,
0.1576267, -4.089744, -7.990194, 1, -0.5, 0.5, 0.5,
0.1576267, -4.089744, -7.990194, 1, 1.5, 0.5, 0.5,
0.1576267, -4.089744, -7.990194, 0, 1.5, 0.5, 0.5
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
-4.039989, 0.01092792, -7.990194, 0, -0.5, 0.5, 0.5,
-4.039989, 0.01092792, -7.990194, 1, -0.5, 0.5, 0.5,
-4.039989, 0.01092792, -7.990194, 1, 1.5, 0.5, 0.5,
-4.039989, 0.01092792, -7.990194, 0, 1.5, 0.5, 0.5
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
-4.039989, -4.089744, -0.7624266, 0, -0.5, 0.5, 0.5,
-4.039989, -4.089744, -0.7624266, 1, -0.5, 0.5, 0.5,
-4.039989, -4.089744, -0.7624266, 1, 1.5, 0.5, 0.5,
-4.039989, -4.089744, -0.7624266, 0, 1.5, 0.5, 0.5
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
-2, -3.143435, -6.322248,
3, -3.143435, -6.322248,
-2, -3.143435, -6.322248,
-2, -3.301153, -6.600239,
-1, -3.143435, -6.322248,
-1, -3.301153, -6.600239,
0, -3.143435, -6.322248,
0, -3.301153, -6.600239,
1, -3.143435, -6.322248,
1, -3.301153, -6.600239,
2, -3.143435, -6.322248,
2, -3.301153, -6.600239,
3, -3.143435, -6.322248,
3, -3.301153, -6.600239
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
-2, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
-2, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
-2, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
-2, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5,
-1, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
-1, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
-1, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
-1, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5,
0, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
0, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
0, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
0, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5,
1, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
1, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
1, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
1, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5,
2, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
2, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
2, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
2, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5,
3, -3.61659, -7.156221, 0, -0.5, 0.5, 0.5,
3, -3.61659, -7.156221, 1, -0.5, 0.5, 0.5,
3, -3.61659, -7.156221, 1, 1.5, 0.5, 0.5,
3, -3.61659, -7.156221, 0, 1.5, 0.5, 0.5
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
-3.071308, -3, -6.322248,
-3.071308, 3, -6.322248,
-3.071308, -3, -6.322248,
-3.232755, -3, -6.600239,
-3.071308, -2, -6.322248,
-3.232755, -2, -6.600239,
-3.071308, -1, -6.322248,
-3.232755, -1, -6.600239,
-3.071308, 0, -6.322248,
-3.232755, 0, -6.600239,
-3.071308, 1, -6.322248,
-3.232755, 1, -6.600239,
-3.071308, 2, -6.322248,
-3.232755, 2, -6.600239,
-3.071308, 3, -6.322248,
-3.232755, 3, -6.600239
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
-3.555649, -3, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, -3, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, -3, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, -3, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, -2, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, -2, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, -2, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, -2, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, -1, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, -1, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, -1, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, -1, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, 0, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, 0, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, 0, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, 0, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, 1, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, 1, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, 1, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, 1, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, 2, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, 2, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, 2, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, 2, -7.156221, 0, 1.5, 0.5, 0.5,
-3.555649, 3, -7.156221, 0, -0.5, 0.5, 0.5,
-3.555649, 3, -7.156221, 1, -0.5, 0.5, 0.5,
-3.555649, 3, -7.156221, 1, 1.5, 0.5, 0.5,
-3.555649, 3, -7.156221, 0, 1.5, 0.5, 0.5
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
-3.071308, -3.143435, -6,
-3.071308, -3.143435, 4,
-3.071308, -3.143435, -6,
-3.232755, -3.301153, -6,
-3.071308, -3.143435, -4,
-3.232755, -3.301153, -4,
-3.071308, -3.143435, -2,
-3.232755, -3.301153, -2,
-3.071308, -3.143435, 0,
-3.232755, -3.301153, 0,
-3.071308, -3.143435, 2,
-3.232755, -3.301153, 2,
-3.071308, -3.143435, 4,
-3.232755, -3.301153, 4
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
-3.555649, -3.61659, -6, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -6, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -6, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, -6, 0, 1.5, 0.5, 0.5,
-3.555649, -3.61659, -4, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -4, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -4, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, -4, 0, 1.5, 0.5, 0.5,
-3.555649, -3.61659, -2, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -2, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, -2, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, -2, 0, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 0, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 0, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 0, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 0, 0, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 2, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 2, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 2, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 2, 0, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 4, 0, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 4, 1, -0.5, 0.5, 0.5,
-3.555649, -3.61659, 4, 1, 1.5, 0.5, 0.5,
-3.555649, -3.61659, 4, 0, 1.5, 0.5, 0.5
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
-3.071308, -3.143435, -6.322248,
-3.071308, 3.165291, -6.322248,
-3.071308, -3.143435, 4.797395,
-3.071308, 3.165291, 4.797395,
-3.071308, -3.143435, -6.322248,
-3.071308, -3.143435, 4.797395,
-3.071308, 3.165291, -6.322248,
-3.071308, 3.165291, 4.797395,
-3.071308, -3.143435, -6.322248,
3.386562, -3.143435, -6.322248,
-3.071308, -3.143435, 4.797395,
3.386562, -3.143435, 4.797395,
-3.071308, 3.165291, -6.322248,
3.386562, 3.165291, -6.322248,
-3.071308, 3.165291, 4.797395,
3.386562, 3.165291, 4.797395,
3.386562, -3.143435, -6.322248,
3.386562, 3.165291, -6.322248,
3.386562, -3.143435, 4.797395,
3.386562, 3.165291, 4.797395,
3.386562, -3.143435, -6.322248,
3.386562, -3.143435, 4.797395,
3.386562, 3.165291, -6.322248,
3.386562, 3.165291, 4.797395
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
var radius = 7.648246;
var distance = 34.02791;
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
mvMatrix.translate( -0.1576267, -0.01092792, 0.7624266 );
mvMatrix.scale( 1.28052, 1.310793, 0.743678 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.02791);
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
quinmerac<-read.table("quinmerac.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinmerac$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
```

```r
y<-quinmerac$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
```

```r
z<-quinmerac$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
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
-2.977262, -0.6718404, -2.451154, 0, 0, 1, 1, 1,
-2.864872, -1.211468, -1.810939, 1, 0, 0, 1, 1,
-2.767516, -0.6292062, -0.8117319, 1, 0, 0, 1, 1,
-2.766809, -1.700372, -0.7458223, 1, 0, 0, 1, 1,
-2.747791, -1.715834, -3.233485, 1, 0, 0, 1, 1,
-2.705615, 0.7153794, 0.7741739, 1, 0, 0, 1, 1,
-2.640899, -1.172095, -0.8589289, 0, 0, 0, 1, 1,
-2.586771, 1.023531, -1.458976, 0, 0, 0, 1, 1,
-2.560114, -0.3324605, -1.844738, 0, 0, 0, 1, 1,
-2.55211, 1.329235, -0.4264747, 0, 0, 0, 1, 1,
-2.395335, -1.171694, -2.750027, 0, 0, 0, 1, 1,
-2.383274, 0.5975268, -1.306295, 0, 0, 0, 1, 1,
-2.320911, -0.2672888, -1.745129, 0, 0, 0, 1, 1,
-2.30167, 1.882709, -2.017557, 1, 1, 1, 1, 1,
-2.26349, -1.368471, -4.682199, 1, 1, 1, 1, 1,
-2.229517, 0.1014855, -2.537296, 1, 1, 1, 1, 1,
-2.219071, -1.798466, -2.706542, 1, 1, 1, 1, 1,
-2.211719, -1.163946, -0.571702, 1, 1, 1, 1, 1,
-2.17261, -0.835603, -3.285063, 1, 1, 1, 1, 1,
-2.164752, -1.905406, -1.185538, 1, 1, 1, 1, 1,
-2.091973, -1.341067, -1.178955, 1, 1, 1, 1, 1,
-2.082291, 0.9822559, -0.8540561, 1, 1, 1, 1, 1,
-2.068356, -0.4203551, -1.78246, 1, 1, 1, 1, 1,
-2.025113, 0.05875893, -1.646706, 1, 1, 1, 1, 1,
-2.003577, -0.8368187, -3.93061, 1, 1, 1, 1, 1,
-1.992803, -0.6687169, -1.834245, 1, 1, 1, 1, 1,
-1.98421, 1.253271, -0.3653592, 1, 1, 1, 1, 1,
-1.977104, 0.5603709, -0.1803882, 1, 1, 1, 1, 1,
-1.974629, -1.110068, -2.389745, 0, 0, 1, 1, 1,
-1.963133, -0.8978398, -1.435156, 1, 0, 0, 1, 1,
-1.913293, 0.1347628, -0.02228642, 1, 0, 0, 1, 1,
-1.895849, -0.3734609, -3.343776, 1, 0, 0, 1, 1,
-1.836315, -1.462472, -1.139045, 1, 0, 0, 1, 1,
-1.835605, 0.9467549, -1.093822, 1, 0, 0, 1, 1,
-1.835347, -1.799425, -2.441329, 0, 0, 0, 1, 1,
-1.8294, -2.187083, -1.523996, 0, 0, 0, 1, 1,
-1.80242, 0.4692351, -3.025602, 0, 0, 0, 1, 1,
-1.793235, -0.2238517, -2.01649, 0, 0, 0, 1, 1,
-1.768336, -0.5409821, -3.73479, 0, 0, 0, 1, 1,
-1.763553, 0.4388397, -0.4795048, 0, 0, 0, 1, 1,
-1.75731, 0.8737546, -0.3679803, 0, 0, 0, 1, 1,
-1.752472, -0.7943202, -0.9698259, 1, 1, 1, 1, 1,
-1.747328, 1.308137, -0.1760502, 1, 1, 1, 1, 1,
-1.72728, -1.148104, -1.15609, 1, 1, 1, 1, 1,
-1.711107, 1.186095, -1.718257, 1, 1, 1, 1, 1,
-1.707683, 0.6227523, -1.309295, 1, 1, 1, 1, 1,
-1.696624, -0.7255661, -1.084434, 1, 1, 1, 1, 1,
-1.684069, 0.575398, -1.69367, 1, 1, 1, 1, 1,
-1.682346, 2.375705, -0.6627115, 1, 1, 1, 1, 1,
-1.677505, 0.8755032, -2.375672, 1, 1, 1, 1, 1,
-1.675577, 2.007212, -0.7550154, 1, 1, 1, 1, 1,
-1.670092, -0.8073053, -2.266321, 1, 1, 1, 1, 1,
-1.650234, 0.573967, -2.482312, 1, 1, 1, 1, 1,
-1.629315, -0.880716, -2.389283, 1, 1, 1, 1, 1,
-1.625988, 1.887001, -1.742331, 1, 1, 1, 1, 1,
-1.621459, 1.17058, -1.409998, 1, 1, 1, 1, 1,
-1.595864, 0.5838698, -1.544528, 0, 0, 1, 1, 1,
-1.57711, 0.4184601, -0.1220862, 1, 0, 0, 1, 1,
-1.569975, 0.1410144, -0.3070493, 1, 0, 0, 1, 1,
-1.562814, -0.340102, -1.866754, 1, 0, 0, 1, 1,
-1.555659, -0.4995877, -2.442875, 1, 0, 0, 1, 1,
-1.551184, -1.036791, -2.606785, 1, 0, 0, 1, 1,
-1.531326, -0.2308574, -0.8886255, 0, 0, 0, 1, 1,
-1.530447, 0.9669188, -1.310945, 0, 0, 0, 1, 1,
-1.52563, -1.128178, -2.487992, 0, 0, 0, 1, 1,
-1.522253, 0.9527494, -1.632036, 0, 0, 0, 1, 1,
-1.511604, -0.886641, -2.112692, 0, 0, 0, 1, 1,
-1.496823, -2.001848, -3.415584, 0, 0, 0, 1, 1,
-1.495906, -1.962087, -1.308112, 0, 0, 0, 1, 1,
-1.492472, 0.613968, -1.517672, 1, 1, 1, 1, 1,
-1.482498, -1.579747, -0.9285026, 1, 1, 1, 1, 1,
-1.480801, 1.280607, -1.783023, 1, 1, 1, 1, 1,
-1.47457, 0.4370802, -1.480434, 1, 1, 1, 1, 1,
-1.473518, -0.3625425, -1.893605, 1, 1, 1, 1, 1,
-1.46049, -0.8742063, -2.418021, 1, 1, 1, 1, 1,
-1.455759, -1.772699, -2.140346, 1, 1, 1, 1, 1,
-1.453408, 1.155186, 0.4237737, 1, 1, 1, 1, 1,
-1.446602, -0.5102405, -1.479397, 1, 1, 1, 1, 1,
-1.446106, -0.8115433, -0.1023436, 1, 1, 1, 1, 1,
-1.434428, 0.04240126, -0.8459705, 1, 1, 1, 1, 1,
-1.418737, 0.4781514, 0.2475773, 1, 1, 1, 1, 1,
-1.414575, -1.449158, -2.10746, 1, 1, 1, 1, 1,
-1.406501, -0.3354335, -1.347297, 1, 1, 1, 1, 1,
-1.400176, 0.07525811, -1.998073, 1, 1, 1, 1, 1,
-1.397453, -0.09807564, -2.75293, 0, 0, 1, 1, 1,
-1.388485, 0.2763793, -1.597365, 1, 0, 0, 1, 1,
-1.378029, -0.4301383, -0.09068258, 1, 0, 0, 1, 1,
-1.375793, 1.571087, 0.8280176, 1, 0, 0, 1, 1,
-1.373621, -0.9623916, -1.562332, 1, 0, 0, 1, 1,
-1.370162, 1.268821, 0.3536709, 1, 0, 0, 1, 1,
-1.369686, 1.605403, -0.1961337, 0, 0, 0, 1, 1,
-1.361489, -0.06011289, -1.252595, 0, 0, 0, 1, 1,
-1.359165, 2.019375, 1.258425, 0, 0, 0, 1, 1,
-1.348952, -0.6087211, -2.346731, 0, 0, 0, 1, 1,
-1.34601, 0.4832437, -3.365288, 0, 0, 0, 1, 1,
-1.341225, -0.5745804, -2.663586, 0, 0, 0, 1, 1,
-1.334967, -0.8474925, -2.840954, 0, 0, 0, 1, 1,
-1.32273, 0.588963, 0.1925802, 1, 1, 1, 1, 1,
-1.316551, 0.8632693, -1.409952, 1, 1, 1, 1, 1,
-1.314081, -0.5643571, -0.6134514, 1, 1, 1, 1, 1,
-1.312655, 1.740576, 0.2142324, 1, 1, 1, 1, 1,
-1.307895, 0.05220811, -2.431002, 1, 1, 1, 1, 1,
-1.306086, 1.295491, -0.8561325, 1, 1, 1, 1, 1,
-1.304984, 0.1829247, -1.657118, 1, 1, 1, 1, 1,
-1.301524, 0.4877445, -0.4520682, 1, 1, 1, 1, 1,
-1.292207, -1.455819, -3.129256, 1, 1, 1, 1, 1,
-1.285295, 1.116115, -0.6649524, 1, 1, 1, 1, 1,
-1.284498, -0.3214162, -1.279603, 1, 1, 1, 1, 1,
-1.271069, 0.5556209, -1.294668, 1, 1, 1, 1, 1,
-1.256592, -0.6465882, -1.840705, 1, 1, 1, 1, 1,
-1.253346, 0.3319779, -1.654877, 1, 1, 1, 1, 1,
-1.24573, -1.847433, -2.171904, 1, 1, 1, 1, 1,
-1.24333, -0.1362196, -1.840987, 0, 0, 1, 1, 1,
-1.23929, 2.437464, 0.5078789, 1, 0, 0, 1, 1,
-1.23439, 0.6851487, -0.8559673, 1, 0, 0, 1, 1,
-1.233789, 1.091995, 0.273003, 1, 0, 0, 1, 1,
-1.228799, -1.33806, -2.888862, 1, 0, 0, 1, 1,
-1.214973, -0.7815475, -2.019156, 1, 0, 0, 1, 1,
-1.203334, 0.5889057, -3.053895, 0, 0, 0, 1, 1,
-1.203247, -0.9467331, -1.740809, 0, 0, 0, 1, 1,
-1.203003, 0.977639, -0.9518727, 0, 0, 0, 1, 1,
-1.202382, -0.8626491, -1.524245, 0, 0, 0, 1, 1,
-1.20158, 1.976605, 0.4991866, 0, 0, 0, 1, 1,
-1.199304, 0.07282502, 1.002454, 0, 0, 0, 1, 1,
-1.198162, -0.2227057, -0.4893733, 0, 0, 0, 1, 1,
-1.189003, 0.576855, 1.103607, 1, 1, 1, 1, 1,
-1.181834, 0.1783334, -1.767598, 1, 1, 1, 1, 1,
-1.176795, -1.049929, -2.792395, 1, 1, 1, 1, 1,
-1.175113, 0.5392646, -0.2112197, 1, 1, 1, 1, 1,
-1.174117, -1.156575, -1.893556, 1, 1, 1, 1, 1,
-1.173925, -0.1565869, -2.692106, 1, 1, 1, 1, 1,
-1.169475, 0.7840689, -0.1847281, 1, 1, 1, 1, 1,
-1.167281, 1.496352, -1.57572, 1, 1, 1, 1, 1,
-1.16457, -0.6004609, -1.418013, 1, 1, 1, 1, 1,
-1.161903, 1.316341, -0.7146669, 1, 1, 1, 1, 1,
-1.161268, -1.058679, -2.276271, 1, 1, 1, 1, 1,
-1.149674, -0.8471422, -2.753448, 1, 1, 1, 1, 1,
-1.144255, 1.177724, -1.093575, 1, 1, 1, 1, 1,
-1.143124, -0.5497908, -2.249657, 1, 1, 1, 1, 1,
-1.141004, 0.3221759, -0.8359928, 1, 1, 1, 1, 1,
-1.129213, -2.514425, -1.923886, 0, 0, 1, 1, 1,
-1.114492, 0.1592709, -1.936454, 1, 0, 0, 1, 1,
-1.099708, -1.112609, -1.289024, 1, 0, 0, 1, 1,
-1.098058, 0.2685953, -0.6560262, 1, 0, 0, 1, 1,
-1.095404, 0.2153592, -0.699205, 1, 0, 0, 1, 1,
-1.089628, -0.4501153, -2.266773, 1, 0, 0, 1, 1,
-1.075656, -1.236864, -2.145952, 0, 0, 0, 1, 1,
-1.07223, -0.1807724, -2.828305, 0, 0, 0, 1, 1,
-1.062783, -0.1425951, -1.672172, 0, 0, 0, 1, 1,
-1.062095, -0.1412731, -0.8611996, 0, 0, 0, 1, 1,
-1.059098, -0.9646033, -2.777927, 0, 0, 0, 1, 1,
-1.05705, -0.4372552, -3.382025, 0, 0, 0, 1, 1,
-1.051554, 1.021008, 1.103829, 0, 0, 0, 1, 1,
-1.046532, -0.6553973, -3.53758, 1, 1, 1, 1, 1,
-1.04574, -1.578583, -1.94058, 1, 1, 1, 1, 1,
-1.033239, 1.465028, -0.6804688, 1, 1, 1, 1, 1,
-1.032512, 0.7660094, -1.853623, 1, 1, 1, 1, 1,
-1.031217, -1.51393, -2.394067, 1, 1, 1, 1, 1,
-1.028647, 0.4913693, -1.184786, 1, 1, 1, 1, 1,
-1.020454, 0.3931893, -1.993456, 1, 1, 1, 1, 1,
-1.01984, -0.3971742, -2.239882, 1, 1, 1, 1, 1,
-1.017438, -1.488662, -1.532446, 1, 1, 1, 1, 1,
-1.012732, -0.2068021, -4.062558, 1, 1, 1, 1, 1,
-1.008808, 1.283105, -0.9197263, 1, 1, 1, 1, 1,
-1.008731, 1.35305, -0.7993934, 1, 1, 1, 1, 1,
-1.005269, 2.075027, -0.8238159, 1, 1, 1, 1, 1,
-1.002573, -0.7711907, -3.381468, 1, 1, 1, 1, 1,
-1.002544, -1.496558, -1.072856, 1, 1, 1, 1, 1,
-0.9989794, -0.5941864, -3.066707, 0, 0, 1, 1, 1,
-0.9960673, 0.9749149, -1.247827, 1, 0, 0, 1, 1,
-0.9951523, -0.6075367, -2.613898, 1, 0, 0, 1, 1,
-0.9925161, 1.9208, 0.3637352, 1, 0, 0, 1, 1,
-0.9911, 1.186154, 0.6835576, 1, 0, 0, 1, 1,
-0.9858423, 1.761146, 0.1511344, 1, 0, 0, 1, 1,
-0.9853449, -0.5509166, -2.240709, 0, 0, 0, 1, 1,
-0.9724408, 0.1536236, -1.44804, 0, 0, 0, 1, 1,
-0.9686714, -1.202066, -1.346792, 0, 0, 0, 1, 1,
-0.9612027, 0.6931022, -0.8985431, 0, 0, 0, 1, 1,
-0.9594104, -0.1664087, -2.236779, 0, 0, 0, 1, 1,
-0.9557405, -1.384644, -1.01796, 0, 0, 0, 1, 1,
-0.9520987, 1.368557, 0.2921776, 0, 0, 0, 1, 1,
-0.9500343, -0.4209324, -3.062797, 1, 1, 1, 1, 1,
-0.9477469, 0.2556753, -0.2985095, 1, 1, 1, 1, 1,
-0.9367367, 0.35446, -0.1580141, 1, 1, 1, 1, 1,
-0.9327212, -1.983621, -2.200689, 1, 1, 1, 1, 1,
-0.9232905, -1.292997, -1.639796, 1, 1, 1, 1, 1,
-0.9221286, 0.6690958, -1.61407, 1, 1, 1, 1, 1,
-0.918401, -0.02278275, -1.856032, 1, 1, 1, 1, 1,
-0.9072372, -1.303117, -3.434464, 1, 1, 1, 1, 1,
-0.9026222, 0.7218572, -0.3047142, 1, 1, 1, 1, 1,
-0.9010797, 0.7247508, -0.9155775, 1, 1, 1, 1, 1,
-0.8964387, -0.4791463, -3.208846, 1, 1, 1, 1, 1,
-0.893857, 1.040349, -1.595268, 1, 1, 1, 1, 1,
-0.8929673, 0.2264344, -0.8611847, 1, 1, 1, 1, 1,
-0.8918305, -1.43928, -1.598897, 1, 1, 1, 1, 1,
-0.8908955, -1.397008, -3.075162, 1, 1, 1, 1, 1,
-0.8901961, 0.2991724, -2.108963, 0, 0, 1, 1, 1,
-0.8841396, -0.2526313, -4.020024, 1, 0, 0, 1, 1,
-0.8836186, 0.660576, -1.367684, 1, 0, 0, 1, 1,
-0.8832513, -0.7336996, -3.749512, 1, 0, 0, 1, 1,
-0.8829702, 1.715445, 0.06471527, 1, 0, 0, 1, 1,
-0.8795123, -1.036812, -3.122171, 1, 0, 0, 1, 1,
-0.8728189, -0.4664566, -2.595205, 0, 0, 0, 1, 1,
-0.8700421, -1.028963, -2.397271, 0, 0, 0, 1, 1,
-0.8675041, -1.15318, -3.349138, 0, 0, 0, 1, 1,
-0.8665314, -0.03409314, -1.553295, 0, 0, 0, 1, 1,
-0.8642818, -0.6043692, -1.321906, 0, 0, 0, 1, 1,
-0.8602936, 1.130767, 0.4523511, 0, 0, 0, 1, 1,
-0.8585069, -0.1715575, -1.366795, 0, 0, 0, 1, 1,
-0.8567326, 0.7812275, -1.387722, 1, 1, 1, 1, 1,
-0.8476741, -1.488894, -2.118603, 1, 1, 1, 1, 1,
-0.8441296, -0.3917003, -1.526412, 1, 1, 1, 1, 1,
-0.8439031, -1.944755, -1.253482, 1, 1, 1, 1, 1,
-0.8326622, -0.2240978, -2.422185, 1, 1, 1, 1, 1,
-0.8283775, -0.7703236, -1.791434, 1, 1, 1, 1, 1,
-0.8257656, -0.8892258, -3.53085, 1, 1, 1, 1, 1,
-0.8253635, 0.1885258, 0.8655156, 1, 1, 1, 1, 1,
-0.8251089, 0.7446902, -1.708266, 1, 1, 1, 1, 1,
-0.821901, -0.8830258, -3.055572, 1, 1, 1, 1, 1,
-0.8192609, -0.1434417, -1.873526, 1, 1, 1, 1, 1,
-0.8154051, -1.270724, -2.632023, 1, 1, 1, 1, 1,
-0.8125572, 2.282341, 1.169647, 1, 1, 1, 1, 1,
-0.8046797, -1.292661, -2.331516, 1, 1, 1, 1, 1,
-0.8044651, -0.2358253, -1.73979, 1, 1, 1, 1, 1,
-0.7967837, 0.7622544, -0.8735186, 0, 0, 1, 1, 1,
-0.7908301, -0.6433399, -2.604584, 1, 0, 0, 1, 1,
-0.7890031, -1.196791, -3.380482, 1, 0, 0, 1, 1,
-0.7857538, 0.7383254, -1.443922, 1, 0, 0, 1, 1,
-0.7852605, 0.9488443, -0.9102281, 1, 0, 0, 1, 1,
-0.7839616, -0.1637185, -2.143476, 1, 0, 0, 1, 1,
-0.7829124, -0.4876308, -3.346118, 0, 0, 0, 1, 1,
-0.7709169, 2.657743, -2.040655, 0, 0, 0, 1, 1,
-0.7699297, 0.789233, -1.190051, 0, 0, 0, 1, 1,
-0.7674121, -0.2522357, -1.479549, 0, 0, 0, 1, 1,
-0.7666419, 0.2612534, -2.287397, 0, 0, 0, 1, 1,
-0.7662568, 0.6484317, -1.587991, 0, 0, 0, 1, 1,
-0.7601297, -0.7661903, -0.8857425, 0, 0, 0, 1, 1,
-0.7536722, 0.7666501, 0.5050791, 1, 1, 1, 1, 1,
-0.7497403, 0.3478673, -2.244578, 1, 1, 1, 1, 1,
-0.7458315, 1.976926, 0.5022663, 1, 1, 1, 1, 1,
-0.7428244, 0.5820378, -1.527276, 1, 1, 1, 1, 1,
-0.7386213, -0.3294479, -2.5749, 1, 1, 1, 1, 1,
-0.7375914, 0.007960706, -2.240877, 1, 1, 1, 1, 1,
-0.735854, 0.2942553, -0.309765, 1, 1, 1, 1, 1,
-0.7354478, -0.2230456, -0.4199816, 1, 1, 1, 1, 1,
-0.7262201, 0.4103984, -0.9676856, 1, 1, 1, 1, 1,
-0.7250586, -0.7956865, -3.809485, 1, 1, 1, 1, 1,
-0.7211367, 0.001819005, -2.351849, 1, 1, 1, 1, 1,
-0.7188201, 0.6321263, -3.151331, 1, 1, 1, 1, 1,
-0.7160598, 1.035593, -0.4593835, 1, 1, 1, 1, 1,
-0.7112921, -0.5746207, -2.080954, 1, 1, 1, 1, 1,
-0.7084709, 1.492064, 0.4562642, 1, 1, 1, 1, 1,
-0.7039765, -1.134836, -2.548437, 0, 0, 1, 1, 1,
-0.6974783, 0.6831741, 0.4291316, 1, 0, 0, 1, 1,
-0.6905392, -0.1736682, -0.9683293, 1, 0, 0, 1, 1,
-0.6904282, 0.9280581, 0.1142206, 1, 0, 0, 1, 1,
-0.68396, -0.1400957, -3.07705, 1, 0, 0, 1, 1,
-0.6798921, -0.5593983, -2.118887, 1, 0, 0, 1, 1,
-0.6709164, 0.3566072, 1.313421, 0, 0, 0, 1, 1,
-0.669926, 0.6270348, -1.384026, 0, 0, 0, 1, 1,
-0.6656346, -0.4012093, -1.828323, 0, 0, 0, 1, 1,
-0.6624916, 0.6766282, -1.408212, 0, 0, 0, 1, 1,
-0.6612805, 0.7594633, -2.245396, 0, 0, 0, 1, 1,
-0.6607983, -0.1444523, -1.61618, 0, 0, 0, 1, 1,
-0.6578275, -2.543061, -3.081121, 0, 0, 0, 1, 1,
-0.6555602, 0.9493603, 0.4334022, 1, 1, 1, 1, 1,
-0.6347998, 0.2596263, 0.1876713, 1, 1, 1, 1, 1,
-0.6340572, -0.9615458, -1.626436, 1, 1, 1, 1, 1,
-0.6333062, -1.809796, -5.965309, 1, 1, 1, 1, 1,
-0.6293021, 1.159955, -0.3949274, 1, 1, 1, 1, 1,
-0.6288311, 0.7210096, -0.3960389, 1, 1, 1, 1, 1,
-0.6248268, 1.189942, -0.4418428, 1, 1, 1, 1, 1,
-0.6237122, 0.2744754, -0.9533212, 1, 1, 1, 1, 1,
-0.6232097, -0.1392979, 0.2792974, 1, 1, 1, 1, 1,
-0.621568, 0.5039694, 0.9005108, 1, 1, 1, 1, 1,
-0.6189607, 1.075207, -0.7116973, 1, 1, 1, 1, 1,
-0.6185503, 1.105182, 1.108414, 1, 1, 1, 1, 1,
-0.6178774, -1.099785, -2.713815, 1, 1, 1, 1, 1,
-0.6175032, -0.6920907, -1.261019, 1, 1, 1, 1, 1,
-0.6166021, 0.4592288, -1.3247, 1, 1, 1, 1, 1,
-0.6125076, -0.522068, -3.795179, 0, 0, 1, 1, 1,
-0.611932, 0.2860758, -2.430958, 1, 0, 0, 1, 1,
-0.6068828, -0.3978311, -1.281958, 1, 0, 0, 1, 1,
-0.6026077, 0.7813607, -1.464838, 1, 0, 0, 1, 1,
-0.6013917, -0.9490114, -3.171273, 1, 0, 0, 1, 1,
-0.6010516, -0.1237156, -1.585436, 1, 0, 0, 1, 1,
-0.5996411, 0.6882703, -1.556131, 0, 0, 0, 1, 1,
-0.5988905, -1.705679, -3.105764, 0, 0, 0, 1, 1,
-0.5967192, 1.119195, -1.126289, 0, 0, 0, 1, 1,
-0.5902999, -0.2483834, -3.428854, 0, 0, 0, 1, 1,
-0.5887167, 0.7786254, -0.8237861, 0, 0, 0, 1, 1,
-0.5882353, -0.8722904, -2.24166, 0, 0, 0, 1, 1,
-0.5854257, -0.9510491, -2.842355, 0, 0, 0, 1, 1,
-0.5823762, 0.4259352, -1.716467, 1, 1, 1, 1, 1,
-0.5810659, 1.225055, -1.218865, 1, 1, 1, 1, 1,
-0.5750721, 0.4671312, -1.80113, 1, 1, 1, 1, 1,
-0.5735698, -0.5638238, -2.304529, 1, 1, 1, 1, 1,
-0.5735368, 1.448063, -0.4844894, 1, 1, 1, 1, 1,
-0.5698507, 0.2451358, -0.6423615, 1, 1, 1, 1, 1,
-0.5633724, -0.5667157, -2.555862, 1, 1, 1, 1, 1,
-0.5602981, 0.7851741, -0.9987677, 1, 1, 1, 1, 1,
-0.5574633, -0.640725, -2.344022, 1, 1, 1, 1, 1,
-0.5532479, 0.005740936, -3.717941, 1, 1, 1, 1, 1,
-0.5519834, 1.587429, -1.186759, 1, 1, 1, 1, 1,
-0.5519236, -1.554051, -1.792637, 1, 1, 1, 1, 1,
-0.5514507, 0.8271503, 0.6409027, 1, 1, 1, 1, 1,
-0.5497096, -1.946177, -3.165759, 1, 1, 1, 1, 1,
-0.5398806, -1.30902, -2.246281, 1, 1, 1, 1, 1,
-0.5324903, -0.7278865, -4.539594, 0, 0, 1, 1, 1,
-0.5277704, 0.6085336, -1.002137, 1, 0, 0, 1, 1,
-0.524729, -0.05820741, -0.6777248, 1, 0, 0, 1, 1,
-0.5228087, 1.756035, 0.2374693, 1, 0, 0, 1, 1,
-0.5106362, 0.7091189, 0.7390167, 1, 0, 0, 1, 1,
-0.5095394, -1.169729, -4.009935, 1, 0, 0, 1, 1,
-0.5078761, -0.7073349, -2.177504, 0, 0, 0, 1, 1,
-0.5045874, -0.6511607, -3.188735, 0, 0, 0, 1, 1,
-0.5042171, 1.600358, 0.8228666, 0, 0, 0, 1, 1,
-0.5038718, 1.41614, -0.2286202, 0, 0, 0, 1, 1,
-0.5015984, -0.0692903, -2.000592, 0, 0, 0, 1, 1,
-0.5013295, 0.8734747, -0.3058011, 0, 0, 0, 1, 1,
-0.5000122, -0.9428434, 0.306922, 0, 0, 0, 1, 1,
-0.4930475, -1.727303, -3.509751, 1, 1, 1, 1, 1,
-0.491901, 0.9383111, 0.2042042, 1, 1, 1, 1, 1,
-0.4875582, 0.6790108, -1.817702, 1, 1, 1, 1, 1,
-0.4865746, -0.1832456, -1.70739, 1, 1, 1, 1, 1,
-0.4847001, 0.1439332, -0.4071184, 1, 1, 1, 1, 1,
-0.4701764, 0.1922315, 0.01784441, 1, 1, 1, 1, 1,
-0.467804, 0.6863385, 1.404694, 1, 1, 1, 1, 1,
-0.4638242, -0.9406111, -2.060053, 1, 1, 1, 1, 1,
-0.4609984, -1.317133, -1.884184, 1, 1, 1, 1, 1,
-0.4599915, 0.1347876, -1.26972, 1, 1, 1, 1, 1,
-0.4598328, -0.2557775, -0.959503, 1, 1, 1, 1, 1,
-0.4584807, -2.500293, -4.534146, 1, 1, 1, 1, 1,
-0.4553274, 1.56971, 0.179105, 1, 1, 1, 1, 1,
-0.4497429, 1.118976, -0.2788051, 1, 1, 1, 1, 1,
-0.4491532, 0.1717184, -0.004346195, 1, 1, 1, 1, 1,
-0.4441838, 0.291878, -1.349389, 0, 0, 1, 1, 1,
-0.442157, 0.7183183, 0.5917029, 1, 0, 0, 1, 1,
-0.4414756, 0.7268623, -1.924459, 1, 0, 0, 1, 1,
-0.4392857, 0.5839988, -1.788402, 1, 0, 0, 1, 1,
-0.4390709, 0.4067012, -1.364417, 1, 0, 0, 1, 1,
-0.4374528, 0.04966473, -1.484538, 1, 0, 0, 1, 1,
-0.4353538, 0.3195286, -2.39672, 0, 0, 0, 1, 1,
-0.4287503, -0.7350665, -4.3204, 0, 0, 0, 1, 1,
-0.4274569, 0.7260765, 1.495998, 0, 0, 0, 1, 1,
-0.4259666, 0.3944339, 0.6746757, 0, 0, 0, 1, 1,
-0.4232694, 1.76339, -0.8458282, 0, 0, 0, 1, 1,
-0.4179415, 0.06703221, -3.300563, 0, 0, 0, 1, 1,
-0.4162903, 0.9825578, -0.7816333, 0, 0, 0, 1, 1,
-0.4148978, 1.556494, 0.4344641, 1, 1, 1, 1, 1,
-0.4133731, 0.322832, -1.00541, 1, 1, 1, 1, 1,
-0.4110934, -0.03228799, -2.325337, 1, 1, 1, 1, 1,
-0.4083691, -0.2910639, -2.7398, 1, 1, 1, 1, 1,
-0.4075723, -1.346368, -5.044246, 1, 1, 1, 1, 1,
-0.4060533, 0.1056373, -2.826603, 1, 1, 1, 1, 1,
-0.4048435, 0.7495652, -2.216825, 1, 1, 1, 1, 1,
-0.4044927, 0.3386801, 0.121051, 1, 1, 1, 1, 1,
-0.4035284, 0.1732085, -1.067818, 1, 1, 1, 1, 1,
-0.3965655, -0.1153555, -0.9858932, 1, 1, 1, 1, 1,
-0.3906859, 0.1310996, -1.027555, 1, 1, 1, 1, 1,
-0.3904036, -2.137905, -3.288165, 1, 1, 1, 1, 1,
-0.3899649, 0.8713605, -0.5136297, 1, 1, 1, 1, 1,
-0.3896449, -0.0987492, -0.08823775, 1, 1, 1, 1, 1,
-0.3850499, 0.237274, 0.2831126, 1, 1, 1, 1, 1,
-0.3844727, -0.4122864, -3.138455, 0, 0, 1, 1, 1,
-0.3815172, -0.7495287, -1.485054, 1, 0, 0, 1, 1,
-0.3786096, 0.6464092, 1.426072, 1, 0, 0, 1, 1,
-0.3769875, 0.1232398, -1.558346, 1, 0, 0, 1, 1,
-0.3728048, -0.3723742, -2.571961, 1, 0, 0, 1, 1,
-0.3716893, 0.9644777, -0.3239867, 1, 0, 0, 1, 1,
-0.3704031, 0.6491354, 0.1405071, 0, 0, 0, 1, 1,
-0.3703576, 0.3156732, 0.1245591, 0, 0, 0, 1, 1,
-0.3649725, 0.5619588, 0.7657697, 0, 0, 0, 1, 1,
-0.3605013, 0.6162468, -1.42547, 0, 0, 0, 1, 1,
-0.3587487, 0.8558176, 1.359339, 0, 0, 0, 1, 1,
-0.3577876, -0.994655, -2.688464, 0, 0, 0, 1, 1,
-0.3569195, -0.5310314, -2.508098, 0, 0, 0, 1, 1,
-0.3562774, 0.9827788, -2.437542, 1, 1, 1, 1, 1,
-0.3425021, 1.028798, -1.371527, 1, 1, 1, 1, 1,
-0.3348979, -1.650151, -2.583648, 1, 1, 1, 1, 1,
-0.3297115, 0.8327521, 0.6959345, 1, 1, 1, 1, 1,
-0.3278327, -0.04259334, -0.8659509, 1, 1, 1, 1, 1,
-0.3246769, 1.951205, -0.2473045, 1, 1, 1, 1, 1,
-0.3194596, -0.7709819, -3.185112, 1, 1, 1, 1, 1,
-0.3169776, -0.3960432, -3.231292, 1, 1, 1, 1, 1,
-0.3142658, 0.3925049, -0.7480372, 1, 1, 1, 1, 1,
-0.3070706, -0.04282229, -0.3136536, 1, 1, 1, 1, 1,
-0.3001116, 0.2323928, -2.059594, 1, 1, 1, 1, 1,
-0.3000977, 0.05043227, -1.614981, 1, 1, 1, 1, 1,
-0.298359, -0.5108582, -2.976619, 1, 1, 1, 1, 1,
-0.2981741, -0.183575, -1.346821, 1, 1, 1, 1, 1,
-0.2973953, 1.580632, -0.7413148, 1, 1, 1, 1, 1,
-0.2952254, -1.039762, -3.913831, 0, 0, 1, 1, 1,
-0.2951201, 0.8411204, -0.8458053, 1, 0, 0, 1, 1,
-0.2910587, 0.149271, -1.864842, 1, 0, 0, 1, 1,
-0.290708, 0.6473553, -0.1642314, 1, 0, 0, 1, 1,
-0.2897322, -0.2433902, -2.251937, 1, 0, 0, 1, 1,
-0.2896031, -1.929978, -1.972649, 1, 0, 0, 1, 1,
-0.285271, -0.6411132, -4.268779, 0, 0, 0, 1, 1,
-0.2852286, -0.2858782, -3.035533, 0, 0, 0, 1, 1,
-0.2824773, -0.7016261, -2.691319, 0, 0, 0, 1, 1,
-0.280927, -0.9738809, -2.022912, 0, 0, 0, 1, 1,
-0.2768736, 0.2356032, -0.9577426, 0, 0, 0, 1, 1,
-0.2762756, 0.7098769, 0.03517768, 0, 0, 0, 1, 1,
-0.2754602, 0.7810124, 0.1964069, 0, 0, 0, 1, 1,
-0.2739038, -0.09596948, -3.521226, 1, 1, 1, 1, 1,
-0.2684473, 0.5173523, -1.795622, 1, 1, 1, 1, 1,
-0.2664033, 0.03938342, -1.4125, 1, 1, 1, 1, 1,
-0.2605609, 1.958905, -0.7805233, 1, 1, 1, 1, 1,
-0.2604542, 0.8102665, -2.213573, 1, 1, 1, 1, 1,
-0.2594072, -1.402856, -2.769573, 1, 1, 1, 1, 1,
-0.2555859, -1.38499, -2.225886, 1, 1, 1, 1, 1,
-0.254291, -1.877147, -2.321425, 1, 1, 1, 1, 1,
-0.2499235, -2.324769, -4.035643, 1, 1, 1, 1, 1,
-0.2386828, 0.8529588, 2.07363, 1, 1, 1, 1, 1,
-0.2339997, 0.509123, -0.2626156, 1, 1, 1, 1, 1,
-0.2331849, 1.467152, -1.93737, 1, 1, 1, 1, 1,
-0.2289642, 0.3715426, 0.248588, 1, 1, 1, 1, 1,
-0.2282534, 1.240811, -0.6095878, 1, 1, 1, 1, 1,
-0.2275309, 0.3277886, 0.4706111, 1, 1, 1, 1, 1,
-0.224889, -0.08491038, -0.4703105, 0, 0, 1, 1, 1,
-0.2245593, 0.7957785, 0.229593, 1, 0, 0, 1, 1,
-0.2242539, 0.4990241, -1.450942, 1, 0, 0, 1, 1,
-0.223862, 1.847315, 0.8138316, 1, 0, 0, 1, 1,
-0.2204439, 0.09511532, -0.548701, 1, 0, 0, 1, 1,
-0.2167208, -1.277953, -3.701959, 1, 0, 0, 1, 1,
-0.2060227, -0.2821251, -1.555431, 0, 0, 0, 1, 1,
-0.2050807, -0.5389327, -2.830074, 0, 0, 0, 1, 1,
-0.2044573, -0.4958299, -1.662894, 0, 0, 0, 1, 1,
-0.2026295, -1.532253, -3.188619, 0, 0, 0, 1, 1,
-0.2014649, 1.260409, 0.1379739, 0, 0, 0, 1, 1,
-0.192087, 0.5402407, 0.5739282, 0, 0, 0, 1, 1,
-0.1881207, -1.114384, -3.074013, 0, 0, 0, 1, 1,
-0.1854936, 0.9388078, 1.905902, 1, 1, 1, 1, 1,
-0.1778484, 0.3461875, -0.9051213, 1, 1, 1, 1, 1,
-0.1754838, -0.6508679, -1.950361, 1, 1, 1, 1, 1,
-0.1724964, 0.4300527, -0.09629516, 1, 1, 1, 1, 1,
-0.1685558, 0.5187165, -0.7180791, 1, 1, 1, 1, 1,
-0.1670727, -1.105139, -3.394847, 1, 1, 1, 1, 1,
-0.166469, 1.343481, 0.1597511, 1, 1, 1, 1, 1,
-0.1633738, -0.9579041, -3.719445, 1, 1, 1, 1, 1,
-0.162427, -0.5350335, -2.06603, 1, 1, 1, 1, 1,
-0.1568751, 1.417652, 0.6209342, 1, 1, 1, 1, 1,
-0.1529688, -1.135306, -4.505436, 1, 1, 1, 1, 1,
-0.1510588, -1.345498, -4.027816, 1, 1, 1, 1, 1,
-0.1493163, -1.695261, -3.137012, 1, 1, 1, 1, 1,
-0.1473936, 2.361744, 0.2245371, 1, 1, 1, 1, 1,
-0.1431485, 1.302148, -1.083266, 1, 1, 1, 1, 1,
-0.1426873, -1.249308, -3.375709, 0, 0, 1, 1, 1,
-0.1382753, 0.1780597, -1.306766, 1, 0, 0, 1, 1,
-0.1380213, 0.6089877, -1.012925, 1, 0, 0, 1, 1,
-0.1376183, -1.446034, -4.628632, 1, 0, 0, 1, 1,
-0.1358719, -1.328415, -2.948409, 1, 0, 0, 1, 1,
-0.1340366, 2.588063, 0.09103027, 1, 0, 0, 1, 1,
-0.131572, 1.186749, 0.169293, 0, 0, 0, 1, 1,
-0.1214559, 0.1570538, -0.1444373, 0, 0, 0, 1, 1,
-0.120679, -0.5708275, -3.90932, 0, 0, 0, 1, 1,
-0.1196231, -0.5205284, -1.516684, 0, 0, 0, 1, 1,
-0.1157689, 0.5267864, 0.9644842, 0, 0, 0, 1, 1,
-0.1156829, -1.18729, -1.564074, 0, 0, 0, 1, 1,
-0.115268, -1.056403, -0.7779689, 0, 0, 0, 1, 1,
-0.1143161, -0.1410599, -2.105176, 1, 1, 1, 1, 1,
-0.1133816, 0.8211277, -1.320866, 1, 1, 1, 1, 1,
-0.1121784, -0.5051724, -3.582327, 1, 1, 1, 1, 1,
-0.1072321, 1.151931, 0.6234533, 1, 1, 1, 1, 1,
-0.1044105, 0.8706293, -0.7715576, 1, 1, 1, 1, 1,
-0.09303319, 0.07383002, -0.4660698, 1, 1, 1, 1, 1,
-0.09021555, 1.546282, -0.1111469, 1, 1, 1, 1, 1,
-0.08683588, -0.4895314, -3.187546, 1, 1, 1, 1, 1,
-0.08432244, 0.2977491, -2.26275, 1, 1, 1, 1, 1,
-0.0842279, -1.384669, -2.080391, 1, 1, 1, 1, 1,
-0.08408746, -1.628219, -3.875144, 1, 1, 1, 1, 1,
-0.07833443, 1.366992, -1.420261, 1, 1, 1, 1, 1,
-0.07745001, 0.0291634, 0.6027336, 1, 1, 1, 1, 1,
-0.07715449, 0.4770192, -0.2886864, 1, 1, 1, 1, 1,
-0.07227495, -0.3650841, -3.767823, 1, 1, 1, 1, 1,
-0.06515946, 1.04583, 0.527203, 0, 0, 1, 1, 1,
-0.06348372, -0.02700757, -2.955106, 1, 0, 0, 1, 1,
-0.06254464, -0.8769823, -2.77204, 1, 0, 0, 1, 1,
-0.06166929, 0.3982063, 1.15326, 1, 0, 0, 1, 1,
-0.06047622, 0.7869079, -0.4867657, 1, 0, 0, 1, 1,
-0.05321199, 2.266618, 0.8675042, 1, 0, 0, 1, 1,
-0.04632952, 0.46984, -1.468702, 0, 0, 0, 1, 1,
-0.04579654, -0.3899724, -2.052891, 0, 0, 0, 1, 1,
-0.03966004, 1.210234, 0.3718021, 0, 0, 0, 1, 1,
-0.03861662, -2.060049, -3.731917, 0, 0, 0, 1, 1,
-0.03581587, -0.5805042, -2.998643, 0, 0, 0, 1, 1,
-0.03388571, -0.2670656, -3.864716, 0, 0, 0, 1, 1,
-0.0326235, 0.0336726, 0.7551563, 0, 0, 0, 1, 1,
-0.02773662, 1.348458, -0.5663067, 1, 1, 1, 1, 1,
-0.02161128, 0.3013174, 0.3254859, 1, 1, 1, 1, 1,
-0.01692178, 0.53162, -0.7079445, 1, 1, 1, 1, 1,
-0.01367777, 0.9386491, -1.081894, 1, 1, 1, 1, 1,
-0.01327774, -1.839936, -5.071538, 1, 1, 1, 1, 1,
-0.01123798, -1.245615, -1.113485, 1, 1, 1, 1, 1,
-0.009775197, -0.1593333, -2.495938, 1, 1, 1, 1, 1,
-0.008903796, -0.3601816, -6.160311, 1, 1, 1, 1, 1,
-0.006470478, -1.869919, -2.778883, 1, 1, 1, 1, 1,
-0.005626088, -0.6126368, -2.970426, 1, 1, 1, 1, 1,
-0.005115412, 0.1088514, 0.8741921, 1, 1, 1, 1, 1,
-0.002619423, -0.339427, -2.632632, 1, 1, 1, 1, 1,
-0.002497426, 0.02908793, -0.5173512, 1, 1, 1, 1, 1,
-0.001611339, -0.8577455, -4.573729, 1, 1, 1, 1, 1,
0.001203424, -0.3495696, 1.662099, 1, 1, 1, 1, 1,
0.003972598, 1.307932, -0.2557325, 0, 0, 1, 1, 1,
0.008199028, -0.5894057, 2.460422, 1, 0, 0, 1, 1,
0.01120135, 1.542281, 0.1961209, 1, 0, 0, 1, 1,
0.01586273, -1.387992, 3.356501, 1, 0, 0, 1, 1,
0.01828352, 1.622317, -0.09144509, 1, 0, 0, 1, 1,
0.01912563, -1.153483, 2.042601, 1, 0, 0, 1, 1,
0.02024584, 2.52042, -0.8575616, 0, 0, 0, 1, 1,
0.02054041, 0.2312101, -0.2760531, 0, 0, 0, 1, 1,
0.02189026, 1.09393, -0.4443271, 0, 0, 0, 1, 1,
0.02438163, 1.028331, 0.5378297, 0, 0, 0, 1, 1,
0.02557794, -0.6666855, 3.504106, 0, 0, 0, 1, 1,
0.02629917, -1.104943, 1.705273, 0, 0, 0, 1, 1,
0.03358649, -1.79288, 3.811945, 0, 0, 0, 1, 1,
0.03366325, -0.3453261, 1.859575, 1, 1, 1, 1, 1,
0.03562518, -1.88731, 2.906811, 1, 1, 1, 1, 1,
0.03708455, -0.03138151, 2.842709, 1, 1, 1, 1, 1,
0.04515192, -0.361065, 4.009148, 1, 1, 1, 1, 1,
0.04544862, 1.302148, 1.561518, 1, 1, 1, 1, 1,
0.04557647, 0.992449, -1.027986, 1, 1, 1, 1, 1,
0.05033233, 0.3685493, 1.56919, 1, 1, 1, 1, 1,
0.0547713, 0.4413002, -0.4504376, 1, 1, 1, 1, 1,
0.05623724, 0.5240009, -1.354975, 1, 1, 1, 1, 1,
0.05659669, 0.04274099, 1.849153, 1, 1, 1, 1, 1,
0.06252387, -0.1772452, 4.402174, 1, 1, 1, 1, 1,
0.06502491, 0.09100346, 0.09535557, 1, 1, 1, 1, 1,
0.0751664, 0.2419623, -1.65617, 1, 1, 1, 1, 1,
0.07519715, -0.7303239, 3.787127, 1, 1, 1, 1, 1,
0.0756977, -1.166323, 2.422502, 1, 1, 1, 1, 1,
0.07629921, 0.2147168, -0.3634337, 0, 0, 1, 1, 1,
0.07661168, -0.1184108, 2.449019, 1, 0, 0, 1, 1,
0.07781132, -1.19326, 4.577498, 1, 0, 0, 1, 1,
0.08558582, 0.7460003, -0.1010397, 1, 0, 0, 1, 1,
0.08675685, 0.4052982, 0.6306961, 1, 0, 0, 1, 1,
0.09331769, 1.112543, -0.4021782, 1, 0, 0, 1, 1,
0.09809335, -1.17161, 1.841269, 0, 0, 0, 1, 1,
0.1014872, -0.3765032, 3.030867, 0, 0, 0, 1, 1,
0.101761, 2.189499, 0.9560767, 0, 0, 0, 1, 1,
0.1097068, -0.9252582, 3.873393, 0, 0, 0, 1, 1,
0.1190599, 0.3068146, -0.1118891, 0, 0, 0, 1, 1,
0.1202574, -0.8266295, 3.490534, 0, 0, 0, 1, 1,
0.1231757, -0.7908459, 2.636937, 0, 0, 0, 1, 1,
0.1262733, -1.094289, 1.492189, 1, 1, 1, 1, 1,
0.127535, 0.05302622, 0.7585604, 1, 1, 1, 1, 1,
0.1310796, -0.306531, 1.751843, 1, 1, 1, 1, 1,
0.1345104, 2.176725, -0.05299203, 1, 1, 1, 1, 1,
0.1403131, 0.9501105, 0.07493666, 1, 1, 1, 1, 1,
0.1406595, 1.904414, 0.5121893, 1, 1, 1, 1, 1,
0.1453853, -0.1092932, 1.889392, 1, 1, 1, 1, 1,
0.1460266, -0.3683715, 1.784718, 1, 1, 1, 1, 1,
0.1476039, 0.1431137, 0.7659765, 1, 1, 1, 1, 1,
0.1476738, 0.9941005, -0.01682107, 1, 1, 1, 1, 1,
0.155286, 0.5248837, -1.207155, 1, 1, 1, 1, 1,
0.1569649, -0.3765161, 3.775611, 1, 1, 1, 1, 1,
0.1574439, 0.7945149, 0.9701116, 1, 1, 1, 1, 1,
0.1588775, 0.1985686, 1.33969, 1, 1, 1, 1, 1,
0.1589866, -0.9444038, 2.754363, 1, 1, 1, 1, 1,
0.1615711, -0.1139635, 2.321897, 0, 0, 1, 1, 1,
0.1618457, 1.977777, 0.7393234, 1, 0, 0, 1, 1,
0.1621928, 0.08038891, 1.495668, 1, 0, 0, 1, 1,
0.1778652, -0.04796251, -0.03005423, 1, 0, 0, 1, 1,
0.1782344, -0.6643884, 4.285613, 1, 0, 0, 1, 1,
0.1787848, 0.3894244, 0.2839265, 1, 0, 0, 1, 1,
0.1807211, 1.234588, 0.4120617, 0, 0, 0, 1, 1,
0.1810318, 0.8515528, 2.614359, 0, 0, 0, 1, 1,
0.1862506, 0.6983441, 1.622417, 0, 0, 0, 1, 1,
0.1917264, 0.7722074, -0.6297467, 0, 0, 0, 1, 1,
0.193176, -1.298264, 2.611181, 0, 0, 0, 1, 1,
0.1969783, -0.04927003, 1.525485, 0, 0, 0, 1, 1,
0.2012006, 0.3016251, 1.639767, 0, 0, 0, 1, 1,
0.2012901, -0.5544426, 1.414651, 1, 1, 1, 1, 1,
0.2015857, 2.387837, 0.2127665, 1, 1, 1, 1, 1,
0.2026686, 1.293572, -0.3257179, 1, 1, 1, 1, 1,
0.2033091, -0.5562598, 1.737573, 1, 1, 1, 1, 1,
0.2094531, 1.629337, -0.1253027, 1, 1, 1, 1, 1,
0.2111361, -0.1780265, 0.9104395, 1, 1, 1, 1, 1,
0.2120559, 1.533426, 0.8704883, 1, 1, 1, 1, 1,
0.2126251, -0.1209247, 2.106431, 1, 1, 1, 1, 1,
0.2209072, 0.3217909, 1.126479, 1, 1, 1, 1, 1,
0.2212144, 1.034305, 0.001303549, 1, 1, 1, 1, 1,
0.2345012, -2.283032, 2.869918, 1, 1, 1, 1, 1,
0.2373355, -0.2994757, 3.45867, 1, 1, 1, 1, 1,
0.2376103, 0.632322, 2.048441, 1, 1, 1, 1, 1,
0.2380687, -1.267846, 2.156158, 1, 1, 1, 1, 1,
0.2393688, -0.4324364, 2.041642, 1, 1, 1, 1, 1,
0.2440066, 0.04893103, 2.31078, 0, 0, 1, 1, 1,
0.2479047, 0.2847976, 1.808845, 1, 0, 0, 1, 1,
0.2483979, 0.01131494, 2.248485, 1, 0, 0, 1, 1,
0.2511209, 1.590333, 0.4551761, 1, 0, 0, 1, 1,
0.2555151, 0.2533891, 1.183672, 1, 0, 0, 1, 1,
0.2601946, -0.8559685, 2.570548, 1, 0, 0, 1, 1,
0.2617612, 0.7449269, 2.029441, 0, 0, 0, 1, 1,
0.2629767, 0.9274331, 0.4105041, 0, 0, 0, 1, 1,
0.2645915, 1.494859, -0.2696281, 0, 0, 0, 1, 1,
0.2646902, 1.19484, 1.578993, 0, 0, 0, 1, 1,
0.2676108, -0.177783, 1.073914, 0, 0, 0, 1, 1,
0.2755146, 0.9622555, -1.323603, 0, 0, 0, 1, 1,
0.278834, -0.8725775, 3.058682, 0, 0, 0, 1, 1,
0.280104, -2.267181, 2.816144, 1, 1, 1, 1, 1,
0.2804481, 2.724534, 0.5474942, 1, 1, 1, 1, 1,
0.2856295, -0.7495027, 2.444905, 1, 1, 1, 1, 1,
0.2868442, -0.08816768, 1.039031, 1, 1, 1, 1, 1,
0.2913183, -0.6192561, 1.753595, 1, 1, 1, 1, 1,
0.2920459, 0.1320024, 0.4010707, 1, 1, 1, 1, 1,
0.2936268, -0.377283, 3.207588, 1, 1, 1, 1, 1,
0.2967773, -0.8152059, 1.734328, 1, 1, 1, 1, 1,
0.2998693, 0.2244762, 1.313486, 1, 1, 1, 1, 1,
0.3036037, 0.4853705, 1.580988, 1, 1, 1, 1, 1,
0.3041696, -1.86586, 1.800365, 1, 1, 1, 1, 1,
0.3095443, -0.3032886, 3.313421, 1, 1, 1, 1, 1,
0.315341, 0.9542896, 0.9950494, 1, 1, 1, 1, 1,
0.3190524, 1.339556, 0.528905, 1, 1, 1, 1, 1,
0.3193314, 0.7247851, 0.4013116, 1, 1, 1, 1, 1,
0.3219013, 0.6167409, -0.6704192, 0, 0, 1, 1, 1,
0.3232304, 1.160787, 0.1968474, 1, 0, 0, 1, 1,
0.3269913, -0.3725916, 3.071892, 1, 0, 0, 1, 1,
0.32941, -0.6530029, 2.263992, 1, 0, 0, 1, 1,
0.3327827, 0.3154626, 0.4841226, 1, 0, 0, 1, 1,
0.332979, 0.520158, -0.1790824, 1, 0, 0, 1, 1,
0.3347827, 0.404915, 0.6387723, 0, 0, 0, 1, 1,
0.3360863, -0.1912814, 1.614807, 0, 0, 0, 1, 1,
0.3368535, 1.148057, 1.594852, 0, 0, 0, 1, 1,
0.3424022, 0.4004831, 0.4010961, 0, 0, 0, 1, 1,
0.3583642, 1.024888, -0.8250319, 0, 0, 0, 1, 1,
0.3611697, -1.051043, 2.666299, 0, 0, 0, 1, 1,
0.3616055, -1.248044, 4.512167, 0, 0, 0, 1, 1,
0.3620529, 0.3980593, 1.261045, 1, 1, 1, 1, 1,
0.3657502, 0.2195954, 2.781724, 1, 1, 1, 1, 1,
0.367301, 1.803968, -1.0989, 1, 1, 1, 1, 1,
0.3700539, -1.397339, 1.88284, 1, 1, 1, 1, 1,
0.370119, -0.2574879, 3.202354, 1, 1, 1, 1, 1,
0.371395, -1.33981, 4.635458, 1, 1, 1, 1, 1,
0.3763608, 0.1368391, 2.480671, 1, 1, 1, 1, 1,
0.3792179, 1.116896, 0.02272916, 1, 1, 1, 1, 1,
0.3826467, 1.684834, -0.8637677, 1, 1, 1, 1, 1,
0.3829307, 0.04084291, 3.521415, 1, 1, 1, 1, 1,
0.3933283, -1.285284, 4.073096, 1, 1, 1, 1, 1,
0.4010036, 0.6354052, 0.9784727, 1, 1, 1, 1, 1,
0.4025335, 0.09233296, 1.443014, 1, 1, 1, 1, 1,
0.4058128, -0.003433526, 1.359754, 1, 1, 1, 1, 1,
0.4062574, -0.02444675, 1.094357, 1, 1, 1, 1, 1,
0.4082772, 1.299358, -0.03508276, 0, 0, 1, 1, 1,
0.410122, 0.2711595, 3.420759, 1, 0, 0, 1, 1,
0.4148273, -0.1226538, 1.16086, 1, 0, 0, 1, 1,
0.4193432, 0.254322, 1.213308, 1, 0, 0, 1, 1,
0.4196733, 0.7197525, -0.3832297, 1, 0, 0, 1, 1,
0.4231469, 0.3796307, 0.7693715, 1, 0, 0, 1, 1,
0.4288854, -0.8601854, 2.374356, 0, 0, 0, 1, 1,
0.4324777, -1.224283, 3.127245, 0, 0, 0, 1, 1,
0.4381915, 1.42367, 0.2204343, 0, 0, 0, 1, 1,
0.4382381, 0.9735644, 1.087402, 0, 0, 0, 1, 1,
0.4413703, 1.573821, -1.805082, 0, 0, 0, 1, 1,
0.443225, -0.3970256, 2.366307, 0, 0, 0, 1, 1,
0.4455566, -0.09505602, 1.918318, 0, 0, 0, 1, 1,
0.4480883, 1.381842, 1.380407, 1, 1, 1, 1, 1,
0.4531983, -0.5660887, 3.147409, 1, 1, 1, 1, 1,
0.4548921, 1.316616, 0.09508143, 1, 1, 1, 1, 1,
0.4571409, -0.7346308, 4.281288, 1, 1, 1, 1, 1,
0.4589569, 0.8966346, 0.9412926, 1, 1, 1, 1, 1,
0.4638099, -0.5007418, 1.771907, 1, 1, 1, 1, 1,
0.46912, -0.9689006, 0.8517621, 1, 1, 1, 1, 1,
0.4691432, -0.1399818, 3.215698, 1, 1, 1, 1, 1,
0.4692613, 1.286671, 1.076357, 1, 1, 1, 1, 1,
0.4695115, -0.8207577, 3.516177, 1, 1, 1, 1, 1,
0.469531, 0.3384513, 0.8077828, 1, 1, 1, 1, 1,
0.4730102, -0.983727, 2.807484, 1, 1, 1, 1, 1,
0.4756012, 1.106812, 0.7718178, 1, 1, 1, 1, 1,
0.4758704, -0.7836937, 0.9246644, 1, 1, 1, 1, 1,
0.479888, -2.352558, 4.261805, 1, 1, 1, 1, 1,
0.4804013, 0.375362, -0.4770625, 0, 0, 1, 1, 1,
0.485101, -0.5979953, 2.556655, 1, 0, 0, 1, 1,
0.4868614, 1.219945, 1.485526, 1, 0, 0, 1, 1,
0.4872276, -0.2893065, 3.103637, 1, 0, 0, 1, 1,
0.4970178, 0.164918, 2.857326, 1, 0, 0, 1, 1,
0.4997239, 0.009049112, 1.505919, 1, 0, 0, 1, 1,
0.5053347, -2.973848, 2.017266, 0, 0, 0, 1, 1,
0.5064848, 0.9421493, -0.6389185, 0, 0, 0, 1, 1,
0.5084208, -0.09412818, 2.379482, 0, 0, 0, 1, 1,
0.5089507, 0.2649875, -0.7107754, 0, 0, 0, 1, 1,
0.5100069, 0.1484409, 2.335638, 0, 0, 0, 1, 1,
0.5119483, 0.4556298, 0.674955, 0, 0, 0, 1, 1,
0.5215456, 1.199761, -0.09514009, 0, 0, 0, 1, 1,
0.5216219, 0.121719, 1.72787, 1, 1, 1, 1, 1,
0.5241628, 0.3960492, 2.348514, 1, 1, 1, 1, 1,
0.5343685, -0.3307103, 2.54549, 1, 1, 1, 1, 1,
0.5441434, -1.192195, 3.067113, 1, 1, 1, 1, 1,
0.5502181, 0.9732744, 0.4070533, 1, 1, 1, 1, 1,
0.5513745, -0.1427386, 2.934627, 1, 1, 1, 1, 1,
0.5525181, 0.397985, 0.5899335, 1, 1, 1, 1, 1,
0.5527826, 0.5743947, 1.198206, 1, 1, 1, 1, 1,
0.5529484, 0.4420893, 2.338233, 1, 1, 1, 1, 1,
0.5541701, 1.609319, -1.175973, 1, 1, 1, 1, 1,
0.5580474, 2.07119, -1.144238, 1, 1, 1, 1, 1,
0.5597335, 0.3436806, 0.8208234, 1, 1, 1, 1, 1,
0.5601145, -0.2368718, 3.497695, 1, 1, 1, 1, 1,
0.5604967, 1.528546, 0.9202407, 1, 1, 1, 1, 1,
0.561021, 1.740151, 2.219087, 1, 1, 1, 1, 1,
0.562921, -1.499755, 3.748646, 0, 0, 1, 1, 1,
0.5653382, -0.3227034, 3.459716, 1, 0, 0, 1, 1,
0.566251, -0.2277953, 2.274902, 1, 0, 0, 1, 1,
0.5663077, 0.4530859, -0.2347003, 1, 0, 0, 1, 1,
0.5692977, 0.5827839, 1.036938, 1, 0, 0, 1, 1,
0.5698394, 0.4160079, 1.338923, 1, 0, 0, 1, 1,
0.5718858, -0.6656574, 2.41585, 0, 0, 0, 1, 1,
0.5727761, 2.308882, 0.5912812, 0, 0, 0, 1, 1,
0.572884, -1.296441, 3.309049, 0, 0, 0, 1, 1,
0.5757153, -0.8627855, 2.401078, 0, 0, 0, 1, 1,
0.5788665, -0.5405121, 2.968722, 0, 0, 0, 1, 1,
0.5836229, -0.1966893, 1.55168, 0, 0, 0, 1, 1,
0.5897446, -0.766251, 3.907409, 0, 0, 0, 1, 1,
0.5922452, -1.199124, 4.559416, 1, 1, 1, 1, 1,
0.5979434, 1.047784, 2.033284, 1, 1, 1, 1, 1,
0.5983452, 0.2506675, 0.9736216, 1, 1, 1, 1, 1,
0.6053004, -1.063107, 1.550691, 1, 1, 1, 1, 1,
0.6074529, 0.3049083, 0.5901206, 1, 1, 1, 1, 1,
0.6080033, 0.6957976, 1.818416, 1, 1, 1, 1, 1,
0.6144302, 0.6781077, 1.136311, 1, 1, 1, 1, 1,
0.6185948, -0.960325, 1.697492, 1, 1, 1, 1, 1,
0.6219895, 0.9809616, -1.134957, 1, 1, 1, 1, 1,
0.6243386, 0.6715503, 0.4265218, 1, 1, 1, 1, 1,
0.6254415, -1.170952, 3.629223, 1, 1, 1, 1, 1,
0.6273044, -0.7356712, 3.066718, 1, 1, 1, 1, 1,
0.630174, 1.039454, 0.3464113, 1, 1, 1, 1, 1,
0.6315542, 2.174161, 1.213654, 1, 1, 1, 1, 1,
0.6329751, -0.6416137, 2.877053, 1, 1, 1, 1, 1,
0.6333639, 0.8018665, 0.4177248, 0, 0, 1, 1, 1,
0.6445418, 0.2813883, -2.091664, 1, 0, 0, 1, 1,
0.6484252, 0.7382566, 1.453026, 1, 0, 0, 1, 1,
0.6492053, 0.7811744, -0.4394062, 1, 0, 0, 1, 1,
0.6535333, -0.4397179, 2.335045, 1, 0, 0, 1, 1,
0.6538163, 1.418255, 1.646757, 1, 0, 0, 1, 1,
0.6540286, -1.403319, 2.67858, 0, 0, 0, 1, 1,
0.6543354, 0.06640874, 2.165464, 0, 0, 0, 1, 1,
0.6565802, -0.2334163, 2.357463, 0, 0, 0, 1, 1,
0.660925, -0.157926, 0.8263891, 0, 0, 0, 1, 1,
0.6628264, 1.585598, 1.752645, 0, 0, 0, 1, 1,
0.6647934, 0.06833275, 0.7042635, 0, 0, 0, 1, 1,
0.6673882, 0.8567488, -1.667988, 0, 0, 0, 1, 1,
0.6677366, -0.3547179, 0.8274238, 1, 1, 1, 1, 1,
0.6712095, -0.4418541, 2.365277, 1, 1, 1, 1, 1,
0.6749834, -0.8438287, 2.192699, 1, 1, 1, 1, 1,
0.6800787, -0.1419448, 2.213989, 1, 1, 1, 1, 1,
0.6810264, -0.2023194, 2.017344, 1, 1, 1, 1, 1,
0.6816136, 1.496013, 1.253623, 1, 1, 1, 1, 1,
0.6866136, -1.575744, 1.477791, 1, 1, 1, 1, 1,
0.6909878, -0.4692475, 2.035176, 1, 1, 1, 1, 1,
0.6950164, 1.576558, 0.7173246, 1, 1, 1, 1, 1,
0.6981025, 1.154817, 1.123855, 1, 1, 1, 1, 1,
0.6985761, -1.369295, 3.213443, 1, 1, 1, 1, 1,
0.6993378, -0.5352648, 1.813367, 1, 1, 1, 1, 1,
0.6996006, 0.6796151, 0.2038849, 1, 1, 1, 1, 1,
0.7024983, -1.521908, 3.337395, 1, 1, 1, 1, 1,
0.707208, 0.1433037, 1.337927, 1, 1, 1, 1, 1,
0.7127783, -1.15315, 0.8076023, 0, 0, 1, 1, 1,
0.721009, -0.511586, 2.403261, 1, 0, 0, 1, 1,
0.723153, 0.255866, 0.1315302, 1, 0, 0, 1, 1,
0.7323806, 1.519635, -0.198401, 1, 0, 0, 1, 1,
0.7342419, 1.113273, 1.439858, 1, 0, 0, 1, 1,
0.7357359, -0.6802725, 1.007594, 1, 0, 0, 1, 1,
0.7380619, -1.673583, 3.60177, 0, 0, 0, 1, 1,
0.7391991, -0.6157569, 2.843779, 0, 0, 0, 1, 1,
0.7428289, -0.5814052, 3.717575, 0, 0, 0, 1, 1,
0.7434019, -1.91116, 1.388451, 0, 0, 0, 1, 1,
0.7435791, 0.2540905, 0.3805166, 0, 0, 0, 1, 1,
0.7463946, -0.6809474, 0.8729119, 0, 0, 0, 1, 1,
0.7537645, -0.6179276, 3.75618, 0, 0, 0, 1, 1,
0.7551997, 1.248496, 0.2272973, 1, 1, 1, 1, 1,
0.7635948, 1.537521, 1.716259, 1, 1, 1, 1, 1,
0.7672283, -0.4295961, 1.884885, 1, 1, 1, 1, 1,
0.7718507, -0.5669522, 2.355206, 1, 1, 1, 1, 1,
0.7735157, -1.656303, 2.561202, 1, 1, 1, 1, 1,
0.7763669, 2.872709, 1.318381, 1, 1, 1, 1, 1,
0.7860021, 0.5917806, 1.91689, 1, 1, 1, 1, 1,
0.7870674, 0.4009145, 2.108777, 1, 1, 1, 1, 1,
0.794782, -0.7181643, 2.347223, 1, 1, 1, 1, 1,
0.7948236, 0.5410136, 0.5594158, 1, 1, 1, 1, 1,
0.796151, 0.01228899, 3.325453, 1, 1, 1, 1, 1,
0.7976179, -0.6270711, 1.633202, 1, 1, 1, 1, 1,
0.8019207, -0.9420388, 2.058702, 1, 1, 1, 1, 1,
0.8028169, -0.4447458, 2.510317, 1, 1, 1, 1, 1,
0.8042733, 0.3136588, 0.7394491, 1, 1, 1, 1, 1,
0.8180192, 0.1004357, 2.654195, 0, 0, 1, 1, 1,
0.8220397, -0.5712538, 1.795065, 1, 0, 0, 1, 1,
0.8246185, 0.1110102, 2.179833, 1, 0, 0, 1, 1,
0.8326373, 1.269206, 0.1263942, 1, 0, 0, 1, 1,
0.8443465, 0.04615059, 1.99915, 1, 0, 0, 1, 1,
0.8455458, 0.01167737, 2.955409, 1, 0, 0, 1, 1,
0.8503638, 1.426354, 0.2242256, 0, 0, 0, 1, 1,
0.8504563, -0.08826804, 2.998058, 0, 0, 0, 1, 1,
0.8552343, -0.4314585, 2.493174, 0, 0, 0, 1, 1,
0.8564764, -1.271804, 1.5876, 0, 0, 0, 1, 1,
0.85901, 0.1959829, 1.212535, 0, 0, 0, 1, 1,
0.8613594, -0.8854772, 2.73251, 0, 0, 0, 1, 1,
0.863965, 0.6261362, -0.5143557, 0, 0, 0, 1, 1,
0.8660578, 0.02856424, 0.3641287, 1, 1, 1, 1, 1,
0.8704087, 0.7879425, 2.520035, 1, 1, 1, 1, 1,
0.8712713, 1.344062, 0.4564884, 1, 1, 1, 1, 1,
0.8777639, 0.296866, 2.10798, 1, 1, 1, 1, 1,
0.8785113, 1.020411, 1.17731, 1, 1, 1, 1, 1,
0.8873659, -0.1740224, 1.681489, 1, 1, 1, 1, 1,
0.8899188, -0.1331335, 2.15487, 1, 1, 1, 1, 1,
0.893618, -0.4072485, 1.070667, 1, 1, 1, 1, 1,
0.8944491, -1.893101, 2.231859, 1, 1, 1, 1, 1,
0.8984338, 0.04252776, 0.6361625, 1, 1, 1, 1, 1,
0.8993044, 1.516835, 1.190535, 1, 1, 1, 1, 1,
0.900403, 0.8473769, -0.5144055, 1, 1, 1, 1, 1,
0.9037356, -0.009400986, 2.519542, 1, 1, 1, 1, 1,
0.9074014, -0.1345066, 3.351511, 1, 1, 1, 1, 1,
0.9124282, 1.073269, -0.2753051, 1, 1, 1, 1, 1,
0.9180646, 0.8957141, 1.727629, 0, 0, 1, 1, 1,
0.9182132, 0.00783285, 2.180276, 1, 0, 0, 1, 1,
0.9347191, 2.29261, 0.4910127, 1, 0, 0, 1, 1,
0.9372934, 0.2229892, 2.157754, 1, 0, 0, 1, 1,
0.9470639, 1.081213, 0.8102116, 1, 0, 0, 1, 1,
0.948204, 0.8762234, -0.2472952, 1, 0, 0, 1, 1,
0.9531642, 0.9407805, -0.310242, 0, 0, 0, 1, 1,
0.9550159, -0.3724124, 1.786835, 0, 0, 0, 1, 1,
0.9623567, -0.7497468, 1.797093, 0, 0, 0, 1, 1,
0.9631374, 0.6585747, 0.7774262, 0, 0, 0, 1, 1,
0.9681104, -1.708276, 1.964684, 0, 0, 0, 1, 1,
0.9684342, -1.484479, 3.93363, 0, 0, 0, 1, 1,
0.9734172, -0.5089999, 2.086984, 0, 0, 0, 1, 1,
0.9778942, 0.266973, 1.907869, 1, 1, 1, 1, 1,
0.9800602, -0.4255637, 0.6478365, 1, 1, 1, 1, 1,
0.980112, -0.918914, 2.585478, 1, 1, 1, 1, 1,
0.9836891, 0.2309448, 1.52629, 1, 1, 1, 1, 1,
0.9837019, 0.02168405, 1.906375, 1, 1, 1, 1, 1,
1.002423, 1.176236, 0.5101241, 1, 1, 1, 1, 1,
1.003648, 0.1742318, 3.008144, 1, 1, 1, 1, 1,
1.008084, 1.054626, 1.777203, 1, 1, 1, 1, 1,
1.012912, -0.4062207, 1.029596, 1, 1, 1, 1, 1,
1.021907, 0.9136833, 1.847188, 1, 1, 1, 1, 1,
1.025984, 2.253297, 1.438294, 1, 1, 1, 1, 1,
1.030621, 1.420375, 1.740529, 1, 1, 1, 1, 1,
1.036148, 1.466917, -0.03246231, 1, 1, 1, 1, 1,
1.041025, -1.15818, 2.167975, 1, 1, 1, 1, 1,
1.042184, 0.06224105, 0.2835502, 1, 1, 1, 1, 1,
1.044034, -0.5789446, 2.436101, 0, 0, 1, 1, 1,
1.048331, -1.03437, 1.132422, 1, 0, 0, 1, 1,
1.04867, 1.66921, -0.313984, 1, 0, 0, 1, 1,
1.048907, -2.464817, 2.826858, 1, 0, 0, 1, 1,
1.049728, 0.8240907, 1.825344, 1, 0, 0, 1, 1,
1.063444, 0.6011688, 1.323892, 1, 0, 0, 1, 1,
1.080561, 0.1048139, 1.781363, 0, 0, 0, 1, 1,
1.082343, 0.3231123, 1.126835, 0, 0, 0, 1, 1,
1.085741, 1.06762, 1.964617, 0, 0, 0, 1, 1,
1.086533, 0.5613776, 1.105035, 0, 0, 0, 1, 1,
1.090143, 3.073416, 0.8299611, 0, 0, 0, 1, 1,
1.097856, -0.7128904, 1.602347, 0, 0, 0, 1, 1,
1.10218, -0.08425631, 1.773865, 0, 0, 0, 1, 1,
1.104574, -1.134141, 1.248665, 1, 1, 1, 1, 1,
1.117363, 1.274544, 0.8612211, 1, 1, 1, 1, 1,
1.127142, 0.7851637, 0.7698668, 1, 1, 1, 1, 1,
1.129419, -0.1788207, 1.542724, 1, 1, 1, 1, 1,
1.130168, 0.8482726, 1.562425, 1, 1, 1, 1, 1,
1.136708, 1.131785, 1.08545, 1, 1, 1, 1, 1,
1.141148, 0.379591, 0.6426365, 1, 1, 1, 1, 1,
1.142816, -0.06687771, 3.134171, 1, 1, 1, 1, 1,
1.144276, -0.3004654, 1.860355, 1, 1, 1, 1, 1,
1.144661, 0.3999608, 1.070087, 1, 1, 1, 1, 1,
1.144794, 0.04161485, 2.018238, 1, 1, 1, 1, 1,
1.147439, -0.5791017, 1.538991, 1, 1, 1, 1, 1,
1.147593, -0.3552507, 2.903118, 1, 1, 1, 1, 1,
1.159182, 0.4442457, 1.105742, 1, 1, 1, 1, 1,
1.163532, 0.7570459, 1.045149, 1, 1, 1, 1, 1,
1.170528, -1.7934, 2.694255, 0, 0, 1, 1, 1,
1.173327, -1.259299, 3.122311, 1, 0, 0, 1, 1,
1.17489, -0.6164454, 1.945707, 1, 0, 0, 1, 1,
1.177657, -1.137405, 2.635034, 1, 0, 0, 1, 1,
1.178139, 1.407053, 0.3522526, 1, 0, 0, 1, 1,
1.18079, -0.9359236, 1.734753, 1, 0, 0, 1, 1,
1.181947, -0.186663, 1.581281, 0, 0, 0, 1, 1,
1.184121, 0.3900481, -0.5855101, 0, 0, 0, 1, 1,
1.187527, -0.2869817, 1.362343, 0, 0, 0, 1, 1,
1.18814, 0.1502263, 1.225416, 0, 0, 0, 1, 1,
1.195697, -0.6400721, 1.839581, 0, 0, 0, 1, 1,
1.201115, -0.2731976, 1.932089, 0, 0, 0, 1, 1,
1.204304, -0.08837993, -1.175316, 0, 0, 0, 1, 1,
1.21078, -0.9748108, 2.269848, 1, 1, 1, 1, 1,
1.212678, -1.852931, 1.313217, 1, 1, 1, 1, 1,
1.212717, 1.2982, 1.017499, 1, 1, 1, 1, 1,
1.215078, -0.8969517, 2.833318, 1, 1, 1, 1, 1,
1.224475, 1.566353, 1.735612, 1, 1, 1, 1, 1,
1.232311, 1.43798, 0.4582933, 1, 1, 1, 1, 1,
1.233364, -0.7025949, 2.222513, 1, 1, 1, 1, 1,
1.235042, 0.2619714, 1.798028, 1, 1, 1, 1, 1,
1.240308, -0.5698078, 1.768409, 1, 1, 1, 1, 1,
1.243066, 1.263199, 0.7060264, 1, 1, 1, 1, 1,
1.243805, 1.298253, 2.701636, 1, 1, 1, 1, 1,
1.25982, 0.6383823, 1.837518, 1, 1, 1, 1, 1,
1.264493, 2.724134, 1.624771, 1, 1, 1, 1, 1,
1.265989, 0.1893755, 1.687993, 1, 1, 1, 1, 1,
1.271083, -1.523981, 1.072523, 1, 1, 1, 1, 1,
1.279159, -0.1300364, 1.881088, 0, 0, 1, 1, 1,
1.289668, -0.9394733, 2.934442, 1, 0, 0, 1, 1,
1.299835, -0.4707448, 2.109157, 1, 0, 0, 1, 1,
1.306229, 1.069643, -0.02007515, 1, 0, 0, 1, 1,
1.306691, -2.671988, 2.759942, 1, 0, 0, 1, 1,
1.314241, 0.8119529, 1.925933, 1, 0, 0, 1, 1,
1.321706, -1.751006, 0.9119588, 0, 0, 0, 1, 1,
1.332569, 0.05077676, 1.32184, 0, 0, 0, 1, 1,
1.337747, 0.6097419, 0.1645585, 0, 0, 0, 1, 1,
1.338422, -1.495485, 3.100894, 0, 0, 0, 1, 1,
1.340957, 0.2216808, 1.086585, 0, 0, 0, 1, 1,
1.342684, -0.6383195, 0.4797857, 0, 0, 0, 1, 1,
1.347761, 0.3940629, 1.859553, 0, 0, 0, 1, 1,
1.358036, -0.6515758, 3.190986, 1, 1, 1, 1, 1,
1.362297, -3.051561, 4.121346, 1, 1, 1, 1, 1,
1.374774, 0.5604299, 1.577747, 1, 1, 1, 1, 1,
1.379863, -0.9708608, 2.955121, 1, 1, 1, 1, 1,
1.380331, 0.6272466, -1.667856, 1, 1, 1, 1, 1,
1.38084, -1.08724, 3.728143, 1, 1, 1, 1, 1,
1.386224, 2.120654, 0.7080072, 1, 1, 1, 1, 1,
1.39525, 0.9843786, 0.8454615, 1, 1, 1, 1, 1,
1.395878, 0.01126995, 2.062379, 1, 1, 1, 1, 1,
1.404508, 0.7553957, 0.9936956, 1, 1, 1, 1, 1,
1.408627, 0.03757507, 0.4284266, 1, 1, 1, 1, 1,
1.410032, -0.6868315, 3.590967, 1, 1, 1, 1, 1,
1.419446, -0.6881129, 3.209556, 1, 1, 1, 1, 1,
1.431113, -0.5112557, 1.579893, 1, 1, 1, 1, 1,
1.432993, -0.8159506, 2.623995, 1, 1, 1, 1, 1,
1.433404, -0.9868257, 1.287978, 0, 0, 1, 1, 1,
1.438733, 1.41722, 0.9211757, 1, 0, 0, 1, 1,
1.443821, -0.1315937, 2.279972, 1, 0, 0, 1, 1,
1.449451, -0.1132017, 1.428873, 1, 0, 0, 1, 1,
1.476273, 1.804376, 1.002689, 1, 0, 0, 1, 1,
1.485127, -0.6608063, 2.611696, 1, 0, 0, 1, 1,
1.487481, 2.191799, 1.47869, 0, 0, 0, 1, 1,
1.494077, -0.02149594, 2.455331, 0, 0, 0, 1, 1,
1.494775, -0.03213455, 0.6367565, 0, 0, 0, 1, 1,
1.507375, 0.3448005, 2.957553, 0, 0, 0, 1, 1,
1.509909, 1.405106, 1.10374, 0, 0, 0, 1, 1,
1.514571, -0.5713216, 1.742801, 0, 0, 0, 1, 1,
1.517623, -0.6324825, 2.811091, 0, 0, 0, 1, 1,
1.528273, 0.9233159, 0.361277, 1, 1, 1, 1, 1,
1.528657, 0.59664, 0.5099644, 1, 1, 1, 1, 1,
1.529503, 0.235966, 1.214714, 1, 1, 1, 1, 1,
1.531614, -0.5991142, 1.880896, 1, 1, 1, 1, 1,
1.533229, -0.5818201, 1.161239, 1, 1, 1, 1, 1,
1.545476, 1.289505, -0.3796748, 1, 1, 1, 1, 1,
1.55101, -0.5706828, 1.642085, 1, 1, 1, 1, 1,
1.555169, 1.385629, 0.6453899, 1, 1, 1, 1, 1,
1.559776, -0.08871527, 1.601955, 1, 1, 1, 1, 1,
1.567476, -0.2348359, 0.2244306, 1, 1, 1, 1, 1,
1.573177, 0.9555492, 0.8098114, 1, 1, 1, 1, 1,
1.608395, 1.338903, -0.6243728, 1, 1, 1, 1, 1,
1.613135, -1.899448, 4.566974, 1, 1, 1, 1, 1,
1.621426, -0.2868778, 1.239464, 1, 1, 1, 1, 1,
1.626034, -1.199856, 0.8538437, 1, 1, 1, 1, 1,
1.63732, 0.01704078, 2.523319, 0, 0, 1, 1, 1,
1.643492, -0.3396196, 1.131956, 1, 0, 0, 1, 1,
1.650917, 0.156019, 2.439366, 1, 0, 0, 1, 1,
1.65302, 0.3981681, 1.875562, 1, 0, 0, 1, 1,
1.675619, -0.1318479, 3.329878, 1, 0, 0, 1, 1,
1.68453, -0.166715, 1.687487, 1, 0, 0, 1, 1,
1.69948, 1.712557, 3.344346, 0, 0, 0, 1, 1,
1.749036, -0.6028237, 0.6970562, 0, 0, 0, 1, 1,
1.780131, -0.749504, 0.8287899, 0, 0, 0, 1, 1,
1.79388, -0.2968057, 2.933138, 0, 0, 0, 1, 1,
1.796783, -1.41547, 2.355625, 0, 0, 0, 1, 1,
1.815871, 0.1457512, 0.8462502, 0, 0, 0, 1, 1,
1.822809, 0.1359224, 2.701666, 0, 0, 0, 1, 1,
1.83022, 1.056114, 1.177091, 1, 1, 1, 1, 1,
1.863657, -0.2850024, 2.07043, 1, 1, 1, 1, 1,
1.879611, 1.138633, 0.9459239, 1, 1, 1, 1, 1,
1.88454, 1.733636, 0.6762623, 1, 1, 1, 1, 1,
1.896518, -0.4768981, 0.3961293, 1, 1, 1, 1, 1,
1.922715, -0.867008, 2.510652, 1, 1, 1, 1, 1,
1.934267, 0.62853, -1.458551, 1, 1, 1, 1, 1,
1.940376, 1.788663, 1.720852, 1, 1, 1, 1, 1,
1.948824, 2.17896, 0.3142166, 1, 1, 1, 1, 1,
1.971736, -0.6788453, 1.968788, 1, 1, 1, 1, 1,
1.975287, 1.89376, 2.735004, 1, 1, 1, 1, 1,
1.995513, 0.6359557, 1.528559, 1, 1, 1, 1, 1,
1.997804, 0.508004, 2.049499, 1, 1, 1, 1, 1,
2.001237, 0.7669932, 0.2435722, 1, 1, 1, 1, 1,
2.00319, 0.1478057, 1.506345, 1, 1, 1, 1, 1,
2.027049, -0.2212018, 0.6152403, 0, 0, 1, 1, 1,
2.035503, 0.6327339, -0.6527268, 1, 0, 0, 1, 1,
2.036767, -0.5589854, -0.2591194, 1, 0, 0, 1, 1,
2.048231, 1.558488, -0.7580371, 1, 0, 0, 1, 1,
2.061301, 1.667832, 1.609236, 1, 0, 0, 1, 1,
2.070456, -0.5147539, 2.487714, 1, 0, 0, 1, 1,
2.128927, 0.3350044, 1.852749, 0, 0, 0, 1, 1,
2.140939, -0.441343, 1.546934, 0, 0, 0, 1, 1,
2.199094, 1.597337, 0.02686339, 0, 0, 0, 1, 1,
2.233304, -0.4299401, 0.6293024, 0, 0, 0, 1, 1,
2.250236, -0.5022343, 0.1460386, 0, 0, 0, 1, 1,
2.255951, 0.208444, 1.412985, 0, 0, 0, 1, 1,
2.272206, 1.437832, -0.8276598, 0, 0, 0, 1, 1,
2.342574, 0.5816278, 1.370631, 1, 1, 1, 1, 1,
2.356682, 1.172362, 0.8968016, 1, 1, 1, 1, 1,
2.4491, -0.937584, 0.8470344, 1, 1, 1, 1, 1,
2.573094, -0.9851049, 1.939442, 1, 1, 1, 1, 1,
2.847333, 0.7116148, 1.508205, 1, 1, 1, 1, 1,
2.995826, -1.614959, 2.103394, 1, 1, 1, 1, 1,
3.292515, -2.18542, 2.75293, 1, 1, 1, 1, 1
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
var radius = 9.496641;
var distance = 33.35655;
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
mvMatrix.translate( -0.1576267, -0.01092815, 0.7624266 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35655);
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
