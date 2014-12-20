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
-3.012408, -0.1401462, -1.600367, 1, 0, 0, 1,
-2.950457, -1.016488, -3.122285, 1, 0.007843138, 0, 1,
-2.891971, -3.293295, -2.022281, 1, 0.01176471, 0, 1,
-2.878286, -1.005018, -2.736338, 1, 0.01960784, 0, 1,
-2.518036, -0.6028939, -1.246463, 1, 0.02352941, 0, 1,
-2.477601, -0.3185334, -1.686824, 1, 0.03137255, 0, 1,
-2.417271, -1.319953, -3.418637, 1, 0.03529412, 0, 1,
-2.40516, -0.4101299, -0.3430055, 1, 0.04313726, 0, 1,
-2.319953, 0.3320102, -2.06137, 1, 0.04705882, 0, 1,
-2.29704, -0.8482627, -2.728124, 1, 0.05490196, 0, 1,
-2.234624, -0.1845857, -2.501938, 1, 0.05882353, 0, 1,
-2.09266, 1.365661, -0.7031219, 1, 0.06666667, 0, 1,
-2.058402, -1.545689, -4.367115, 1, 0.07058824, 0, 1,
-2.005944, -1.11803, -2.573545, 1, 0.07843138, 0, 1,
-2.005874, -0.4905955, -3.147176, 1, 0.08235294, 0, 1,
-1.974562, 0.007035717, -1.367945, 1, 0.09019608, 0, 1,
-1.954436, 0.4644493, -2.521205, 1, 0.09411765, 0, 1,
-1.952069, -0.2657564, -2.074378, 1, 0.1019608, 0, 1,
-1.920465, 0.3991929, -1.046785, 1, 0.1098039, 0, 1,
-1.917928, 0.1625157, -1.741639, 1, 0.1137255, 0, 1,
-1.914689, -0.5619084, -1.703693, 1, 0.1215686, 0, 1,
-1.896851, 0.1861671, -1.899782, 1, 0.1254902, 0, 1,
-1.894302, -0.2981923, -3.479181, 1, 0.1333333, 0, 1,
-1.878642, -1.13257, -2.020885, 1, 0.1372549, 0, 1,
-1.877879, 1.364474, -2.591555, 1, 0.145098, 0, 1,
-1.85752, -0.1573942, -1.326359, 1, 0.1490196, 0, 1,
-1.856935, -1.386297, -3.18994, 1, 0.1568628, 0, 1,
-1.84489, -1.788597, -2.566869, 1, 0.1607843, 0, 1,
-1.830816, 0.07349879, -1.343997, 1, 0.1686275, 0, 1,
-1.829177, -0.44688, -0.6827123, 1, 0.172549, 0, 1,
-1.826677, -0.5329278, -0.1718271, 1, 0.1803922, 0, 1,
-1.824577, -0.04956076, -1.381822, 1, 0.1843137, 0, 1,
-1.815576, 0.7384384, -0.733248, 1, 0.1921569, 0, 1,
-1.796965, 0.8253392, -0.6114793, 1, 0.1960784, 0, 1,
-1.796895, 0.236989, -1.303077, 1, 0.2039216, 0, 1,
-1.796611, -1.993829, -3.796769, 1, 0.2117647, 0, 1,
-1.784923, 1.715357, -0.9342281, 1, 0.2156863, 0, 1,
-1.774664, 0.5247402, -1.360407, 1, 0.2235294, 0, 1,
-1.772586, -0.6183338, -3.006783, 1, 0.227451, 0, 1,
-1.768323, 1.245236, -1.551174, 1, 0.2352941, 0, 1,
-1.756089, -0.6298983, -2.059244, 1, 0.2392157, 0, 1,
-1.756023, -0.9068085, -1.926884, 1, 0.2470588, 0, 1,
-1.73741, 0.6616966, -2.032825, 1, 0.2509804, 0, 1,
-1.718291, 0.01793993, -3.185876, 1, 0.2588235, 0, 1,
-1.714836, 1.012944, 0.7534359, 1, 0.2627451, 0, 1,
-1.712773, -1.830243, -2.815221, 1, 0.2705882, 0, 1,
-1.711921, -1.512755, -2.396417, 1, 0.2745098, 0, 1,
-1.705418, -0.2356967, -1.912163, 1, 0.282353, 0, 1,
-1.691421, 0.4501207, -1.438254, 1, 0.2862745, 0, 1,
-1.679771, -0.4353394, -3.141627, 1, 0.2941177, 0, 1,
-1.673729, 0.4048609, -0.8193375, 1, 0.3019608, 0, 1,
-1.671316, -0.3890203, -1.489789, 1, 0.3058824, 0, 1,
-1.666327, -0.954815, -3.257152, 1, 0.3137255, 0, 1,
-1.65301, -0.1519624, -2.918802, 1, 0.3176471, 0, 1,
-1.652865, -1.164087, -1.668875, 1, 0.3254902, 0, 1,
-1.640619, -1.025748, -1.401297, 1, 0.3294118, 0, 1,
-1.626849, -0.3310509, -2.37364, 1, 0.3372549, 0, 1,
-1.612745, -0.3881387, -0.3323529, 1, 0.3411765, 0, 1,
-1.601153, -0.151841, -1.374267, 1, 0.3490196, 0, 1,
-1.586328, -0.174797, -2.404307, 1, 0.3529412, 0, 1,
-1.569305, 0.04792232, -0.870189, 1, 0.3607843, 0, 1,
-1.547819, -1.24405, -2.145429, 1, 0.3647059, 0, 1,
-1.543604, 0.6328034, -0.522008, 1, 0.372549, 0, 1,
-1.540998, 0.2957924, -0.5536721, 1, 0.3764706, 0, 1,
-1.54008, 0.2919234, 0.1758589, 1, 0.3843137, 0, 1,
-1.537286, -1.125634, -2.911998, 1, 0.3882353, 0, 1,
-1.526493, 0.5101328, -0.9252387, 1, 0.3960784, 0, 1,
-1.517377, -1.591725, -0.5850636, 1, 0.4039216, 0, 1,
-1.516726, -0.3032252, -1.415076, 1, 0.4078431, 0, 1,
-1.510096, 0.2798469, -1.228007, 1, 0.4156863, 0, 1,
-1.509354, 0.02919603, -2.00999, 1, 0.4196078, 0, 1,
-1.496675, -1.15518, -0.2863867, 1, 0.427451, 0, 1,
-1.488827, -0.0565345, -1.333515, 1, 0.4313726, 0, 1,
-1.488315, -0.6328999, -2.094891, 1, 0.4392157, 0, 1,
-1.468077, -1.778167, -0.8420665, 1, 0.4431373, 0, 1,
-1.467478, 2.024964, -1.01317, 1, 0.4509804, 0, 1,
-1.467417, -0.9676377, -1.691842, 1, 0.454902, 0, 1,
-1.446451, 0.05872773, -3.592956, 1, 0.4627451, 0, 1,
-1.441468, 1.035172, -0.4479291, 1, 0.4666667, 0, 1,
-1.430882, 1.75023, -1.533441, 1, 0.4745098, 0, 1,
-1.429638, 0.6710086, -1.650036, 1, 0.4784314, 0, 1,
-1.425668, -0.8006477, -2.741309, 1, 0.4862745, 0, 1,
-1.423068, 0.4015198, 0.07415155, 1, 0.4901961, 0, 1,
-1.420929, 0.2531992, -2.611911, 1, 0.4980392, 0, 1,
-1.411094, -1.147303, -2.01614, 1, 0.5058824, 0, 1,
-1.402152, -0.3749972, -1.028936, 1, 0.509804, 0, 1,
-1.389422, 1.320439, -0.7761648, 1, 0.5176471, 0, 1,
-1.384865, -1.496078, -1.528655, 1, 0.5215687, 0, 1,
-1.377158, 1.04248, -0.7644256, 1, 0.5294118, 0, 1,
-1.374853, 1.648068, -0.4084136, 1, 0.5333334, 0, 1,
-1.370072, 1.675922, -0.3010977, 1, 0.5411765, 0, 1,
-1.36008, -0.1688481, -2.850663, 1, 0.5450981, 0, 1,
-1.357057, -0.2404732, -0.994124, 1, 0.5529412, 0, 1,
-1.356544, 1.24496, -1.774459, 1, 0.5568628, 0, 1,
-1.345307, -1.677566, -2.046592, 1, 0.5647059, 0, 1,
-1.341797, 1.070753, -0.647298, 1, 0.5686275, 0, 1,
-1.332847, 1.901109, -1.244051, 1, 0.5764706, 0, 1,
-1.328768, 0.3017249, -1.32688, 1, 0.5803922, 0, 1,
-1.324296, -0.8311394, -2.693302, 1, 0.5882353, 0, 1,
-1.316275, -0.04882532, -0.9851561, 1, 0.5921569, 0, 1,
-1.314566, -0.2370466, -2.708868, 1, 0.6, 0, 1,
-1.301398, 0.4776768, -2.244513, 1, 0.6078432, 0, 1,
-1.289771, 0.6784243, -1.587277, 1, 0.6117647, 0, 1,
-1.286774, 0.6010957, -0.5057873, 1, 0.6196079, 0, 1,
-1.271401, 0.3128277, 0.4744707, 1, 0.6235294, 0, 1,
-1.269179, 0.05200209, -2.959373, 1, 0.6313726, 0, 1,
-1.267291, -1.402263, -3.586255, 1, 0.6352941, 0, 1,
-1.265994, -0.4480984, -1.583427, 1, 0.6431373, 0, 1,
-1.262461, 0.3327664, -2.103211, 1, 0.6470588, 0, 1,
-1.257447, -0.3990768, 0.08354935, 1, 0.654902, 0, 1,
-1.252414, 0.156937, 0.1258919, 1, 0.6588235, 0, 1,
-1.252199, -1.257316, -2.848874, 1, 0.6666667, 0, 1,
-1.234358, 0.367848, -2.009169, 1, 0.6705883, 0, 1,
-1.226467, -0.8961853, -0.805606, 1, 0.6784314, 0, 1,
-1.215394, 0.5049697, 0.9425159, 1, 0.682353, 0, 1,
-1.210597, 2.663651, -1.086083, 1, 0.6901961, 0, 1,
-1.210031, -0.1070723, -0.7708415, 1, 0.6941177, 0, 1,
-1.2025, 1.296532, -1.821495, 1, 0.7019608, 0, 1,
-1.191407, 1.07553, -1.444206, 1, 0.7098039, 0, 1,
-1.188974, 0.9858569, 0.7268233, 1, 0.7137255, 0, 1,
-1.18724, -0.05561993, -2.32045, 1, 0.7215686, 0, 1,
-1.183033, -0.2668158, -1.002369, 1, 0.7254902, 0, 1,
-1.182492, 0.9524683, -1.649376, 1, 0.7333333, 0, 1,
-1.182132, 0.4770505, -2.166138, 1, 0.7372549, 0, 1,
-1.181376, -0.4657132, -2.268989, 1, 0.7450981, 0, 1,
-1.177684, -0.07966506, -2.756136, 1, 0.7490196, 0, 1,
-1.167596, 0.4945441, -1.727382, 1, 0.7568628, 0, 1,
-1.166544, 1.510515, 0.4871366, 1, 0.7607843, 0, 1,
-1.160149, 0.07685389, -1.116775, 1, 0.7686275, 0, 1,
-1.156271, -1.476875, -3.439602, 1, 0.772549, 0, 1,
-1.155127, -0.4873823, -2.153864, 1, 0.7803922, 0, 1,
-1.150344, -0.3586897, -3.119612, 1, 0.7843137, 0, 1,
-1.148064, -0.1020664, -1.943112, 1, 0.7921569, 0, 1,
-1.142262, -1.20045, -4.394656, 1, 0.7960784, 0, 1,
-1.138435, -0.207117, -2.933592, 1, 0.8039216, 0, 1,
-1.125008, 1.293875, -1.657027, 1, 0.8117647, 0, 1,
-1.122669, -2.062086, -1.741531, 1, 0.8156863, 0, 1,
-1.12045, 0.5696244, -0.5190536, 1, 0.8235294, 0, 1,
-1.116978, -0.5015927, -1.946283, 1, 0.827451, 0, 1,
-1.116597, -0.3354462, -1.303741, 1, 0.8352941, 0, 1,
-1.110081, 0.08512863, -0.6188586, 1, 0.8392157, 0, 1,
-1.105988, 0.4993074, -1.226894, 1, 0.8470588, 0, 1,
-1.104023, 2.227656, 0.8055069, 1, 0.8509804, 0, 1,
-1.099618, -0.6701221, -3.002405, 1, 0.8588235, 0, 1,
-1.093336, -0.2175697, -0.530485, 1, 0.8627451, 0, 1,
-1.091537, 0.2752129, 0.03850365, 1, 0.8705882, 0, 1,
-1.087624, -0.5027102, -1.752881, 1, 0.8745098, 0, 1,
-1.085756, 1.270266, -0.433589, 1, 0.8823529, 0, 1,
-1.084444, -0.4934013, -2.651168, 1, 0.8862745, 0, 1,
-1.083182, 1.141263, 0.5454264, 1, 0.8941177, 0, 1,
-1.064935, 0.4120419, -2.778193, 1, 0.8980392, 0, 1,
-1.06417, 1.039184, -0.5442182, 1, 0.9058824, 0, 1,
-1.057798, 0.8081704, -2.896699, 1, 0.9137255, 0, 1,
-1.0556, 0.4635762, -0.9140745, 1, 0.9176471, 0, 1,
-1.045146, 1.573703, 0.3516594, 1, 0.9254902, 0, 1,
-1.039978, 0.569168, 0.8685444, 1, 0.9294118, 0, 1,
-1.033176, -0.1331318, -1.273306, 1, 0.9372549, 0, 1,
-1.019487, 0.07931146, -1.018387, 1, 0.9411765, 0, 1,
-1.015296, -0.3166897, -1.266425, 1, 0.9490196, 0, 1,
-1.013905, 0.6231902, -2.247763, 1, 0.9529412, 0, 1,
-1.012578, 0.03411269, 0.4045026, 1, 0.9607843, 0, 1,
-1.003255, 1.292948, -2.751084, 1, 0.9647059, 0, 1,
-1.000819, 1.058216, 0.415308, 1, 0.972549, 0, 1,
-0.9951173, -0.1813072, -1.950835, 1, 0.9764706, 0, 1,
-0.9938936, 2.506492, -1.822292, 1, 0.9843137, 0, 1,
-0.9845404, 1.451053, -2.032048, 1, 0.9882353, 0, 1,
-0.9825486, -0.7288352, -2.575842, 1, 0.9960784, 0, 1,
-0.9789886, -1.204016, -3.662674, 0.9960784, 1, 0, 1,
-0.9717227, -1.414555, -3.439829, 0.9921569, 1, 0, 1,
-0.9712387, -0.7319943, -2.181597, 0.9843137, 1, 0, 1,
-0.9669382, -0.8438637, -2.234494, 0.9803922, 1, 0, 1,
-0.961374, 0.04861714, -2.333621, 0.972549, 1, 0, 1,
-0.9322501, 0.02324194, -1.51358, 0.9686275, 1, 0, 1,
-0.9194822, -0.2446312, -1.407656, 0.9607843, 1, 0, 1,
-0.9193128, -0.1698492, -0.8103795, 0.9568627, 1, 0, 1,
-0.9099129, -0.05425492, -1.110779, 0.9490196, 1, 0, 1,
-0.9095566, -0.2912478, -2.987894, 0.945098, 1, 0, 1,
-0.906472, 0.3413056, -2.428683, 0.9372549, 1, 0, 1,
-0.8953724, 1.434636, -1.765269, 0.9333333, 1, 0, 1,
-0.8933187, 0.9889054, -0.6308052, 0.9254902, 1, 0, 1,
-0.8922393, 0.8832946, -0.676984, 0.9215686, 1, 0, 1,
-0.88951, -0.9411229, -1.754894, 0.9137255, 1, 0, 1,
-0.8827159, 1.330584, -0.497456, 0.9098039, 1, 0, 1,
-0.8803943, -1.081533, -2.769251, 0.9019608, 1, 0, 1,
-0.8803694, -0.2996789, -0.2377402, 0.8941177, 1, 0, 1,
-0.8748876, -0.1591098, -0.4579999, 0.8901961, 1, 0, 1,
-0.8745013, -1.025282, -3.14163, 0.8823529, 1, 0, 1,
-0.8692209, 0.4380959, -2.350236, 0.8784314, 1, 0, 1,
-0.8671617, 0.0006645467, -1.326989, 0.8705882, 1, 0, 1,
-0.8638494, -0.5480137, -3.391744, 0.8666667, 1, 0, 1,
-0.8575746, 0.1451193, -2.32392, 0.8588235, 1, 0, 1,
-0.8575231, -1.582823, -1.337479, 0.854902, 1, 0, 1,
-0.8534123, 0.6833743, -0.5736011, 0.8470588, 1, 0, 1,
-0.850251, 0.001151196, -1.714707, 0.8431373, 1, 0, 1,
-0.8486302, 0.5607494, -0.659826, 0.8352941, 1, 0, 1,
-0.8466758, -0.6441529, -1.350263, 0.8313726, 1, 0, 1,
-0.8393884, 1.022353, -1.859538, 0.8235294, 1, 0, 1,
-0.8290398, -1.46325, -3.631761, 0.8196079, 1, 0, 1,
-0.8272939, -0.071005, -0.1979496, 0.8117647, 1, 0, 1,
-0.8200124, -1.544226, -2.666015, 0.8078431, 1, 0, 1,
-0.8187391, -0.1698751, -1.89711, 0.8, 1, 0, 1,
-0.8094196, 0.8326564, 0.06037069, 0.7921569, 1, 0, 1,
-0.7932307, -0.775942, -3.205572, 0.7882353, 1, 0, 1,
-0.7925369, -0.6119664, -2.026169, 0.7803922, 1, 0, 1,
-0.7917309, -1.161847, -2.009636, 0.7764706, 1, 0, 1,
-0.7824191, -0.7008, -2.757133, 0.7686275, 1, 0, 1,
-0.7756369, 0.8691937, -0.8156559, 0.7647059, 1, 0, 1,
-0.7754611, -0.02956633, 0.5966455, 0.7568628, 1, 0, 1,
-0.7746261, 1.077293, -0.1282142, 0.7529412, 1, 0, 1,
-0.7723777, 0.1314664, -2.403939, 0.7450981, 1, 0, 1,
-0.772119, -0.3650185, -1.346674, 0.7411765, 1, 0, 1,
-0.7650866, -0.4079499, -2.375471, 0.7333333, 1, 0, 1,
-0.7645231, 0.1050212, -2.953434, 0.7294118, 1, 0, 1,
-0.7585744, -0.1505916, -1.27032, 0.7215686, 1, 0, 1,
-0.7585639, -1.308024, -4.654366, 0.7176471, 1, 0, 1,
-0.7584493, -0.8390679, -3.471008, 0.7098039, 1, 0, 1,
-0.7579781, 0.2995894, -2.384367, 0.7058824, 1, 0, 1,
-0.7549554, 0.5551914, -1.620011, 0.6980392, 1, 0, 1,
-0.7538494, 1.084151, -0.02874983, 0.6901961, 1, 0, 1,
-0.7527255, 0.1614399, -1.907623, 0.6862745, 1, 0, 1,
-0.7523824, 0.9372451, -0.5569422, 0.6784314, 1, 0, 1,
-0.7522157, 1.317651, -1.883683, 0.6745098, 1, 0, 1,
-0.7514799, -0.1215553, -2.283214, 0.6666667, 1, 0, 1,
-0.7483395, 1.012975, -1.419507, 0.6627451, 1, 0, 1,
-0.7458591, -1.058075, -2.80458, 0.654902, 1, 0, 1,
-0.7447906, 0.5464403, -1.555399, 0.6509804, 1, 0, 1,
-0.7446453, -0.3599221, -2.984911, 0.6431373, 1, 0, 1,
-0.7341548, 0.6262062, -1.54118, 0.6392157, 1, 0, 1,
-0.7313885, -0.02659925, -4.2421, 0.6313726, 1, 0, 1,
-0.7297743, -0.802159, -1.450434, 0.627451, 1, 0, 1,
-0.7292349, 1.203129, -2.144058, 0.6196079, 1, 0, 1,
-0.7256781, 1.700511, -1.925894, 0.6156863, 1, 0, 1,
-0.7189955, -0.5148626, -1.895177, 0.6078432, 1, 0, 1,
-0.7150095, -0.8713083, -3.273773, 0.6039216, 1, 0, 1,
-0.7114666, 1.523735, 0.1905416, 0.5960785, 1, 0, 1,
-0.6973321, -0.07217696, -2.204545, 0.5882353, 1, 0, 1,
-0.6953882, -1.222366, -1.154439, 0.5843138, 1, 0, 1,
-0.6942756, -0.9592233, -3.175228, 0.5764706, 1, 0, 1,
-0.6942481, 1.609927, 0.00364675, 0.572549, 1, 0, 1,
-0.693063, 1.148366, -1.823752, 0.5647059, 1, 0, 1,
-0.6878641, -0.3469657, -2.442711, 0.5607843, 1, 0, 1,
-0.6837185, 0.1733588, -0.291513, 0.5529412, 1, 0, 1,
-0.6834577, -0.6126564, -1.006134, 0.5490196, 1, 0, 1,
-0.6764656, 0.6091954, -1.711575, 0.5411765, 1, 0, 1,
-0.6725668, 0.3282134, -1.84805, 0.5372549, 1, 0, 1,
-0.6704224, -0.8813689, -2.862646, 0.5294118, 1, 0, 1,
-0.6656558, 1.154455, 0.402934, 0.5254902, 1, 0, 1,
-0.6451926, 0.439419, -1.324362, 0.5176471, 1, 0, 1,
-0.639688, 1.204047, -0.2129991, 0.5137255, 1, 0, 1,
-0.6391826, 0.2367047, -2.328584, 0.5058824, 1, 0, 1,
-0.6383898, 0.1109786, -0.2204255, 0.5019608, 1, 0, 1,
-0.6342716, -2.795309, -2.31435, 0.4941176, 1, 0, 1,
-0.633041, -2.544415, -4.63618, 0.4862745, 1, 0, 1,
-0.6285328, 1.884806, -0.3327533, 0.4823529, 1, 0, 1,
-0.6218128, -0.04069403, -1.831958, 0.4745098, 1, 0, 1,
-0.6208228, -0.370432, -1.860334, 0.4705882, 1, 0, 1,
-0.6188214, 1.00795, -1.189573, 0.4627451, 1, 0, 1,
-0.617866, -0.2166757, -2.657395, 0.4588235, 1, 0, 1,
-0.6132777, 0.4395117, -1.2133, 0.4509804, 1, 0, 1,
-0.610929, 0.6323372, -0.2158937, 0.4470588, 1, 0, 1,
-0.6093514, -0.7175566, -1.481541, 0.4392157, 1, 0, 1,
-0.6083503, -0.5542341, -1.316647, 0.4352941, 1, 0, 1,
-0.6071267, 1.13768, -0.8391898, 0.427451, 1, 0, 1,
-0.6054596, 1.792868, -1.067088, 0.4235294, 1, 0, 1,
-0.6032534, -0.30037, -3.304259, 0.4156863, 1, 0, 1,
-0.603226, -0.01155229, -1.544699, 0.4117647, 1, 0, 1,
-0.6007029, -0.134472, -1.987933, 0.4039216, 1, 0, 1,
-0.5955111, 0.3826532, -0.7660249, 0.3960784, 1, 0, 1,
-0.5924658, 1.19283, 0.644068, 0.3921569, 1, 0, 1,
-0.5923105, -1.390728, -1.493834, 0.3843137, 1, 0, 1,
-0.5883597, -0.2473881, -2.109534, 0.3803922, 1, 0, 1,
-0.5817617, 0.2130107, -1.039675, 0.372549, 1, 0, 1,
-0.5774472, 0.1759244, -1.389094, 0.3686275, 1, 0, 1,
-0.5769305, -1.201019, -0.6709065, 0.3607843, 1, 0, 1,
-0.5715846, 1.830947, -0.4996499, 0.3568628, 1, 0, 1,
-0.5708936, -1.232734, -2.567937, 0.3490196, 1, 0, 1,
-0.5631632, 0.405738, 0.01750756, 0.345098, 1, 0, 1,
-0.5581838, 0.6658386, -0.1148501, 0.3372549, 1, 0, 1,
-0.5556508, 1.720359, -0.5337489, 0.3333333, 1, 0, 1,
-0.5540569, -1.469865, -2.5494, 0.3254902, 1, 0, 1,
-0.5493272, -2.035722, -2.118027, 0.3215686, 1, 0, 1,
-0.5459535, 1.137414, 0.3488349, 0.3137255, 1, 0, 1,
-0.5409408, 0.3880111, -0.477959, 0.3098039, 1, 0, 1,
-0.5391319, -1.765776, -2.932489, 0.3019608, 1, 0, 1,
-0.5364108, -0.3626854, -2.080979, 0.2941177, 1, 0, 1,
-0.5318702, -0.1375011, -2.918852, 0.2901961, 1, 0, 1,
-0.5309352, -0.7394938, -3.192996, 0.282353, 1, 0, 1,
-0.5281228, 0.8836501, 0.9644654, 0.2784314, 1, 0, 1,
-0.5254201, -0.6535717, -0.8812863, 0.2705882, 1, 0, 1,
-0.5237073, -0.1636244, -3.587219, 0.2666667, 1, 0, 1,
-0.5124547, 2.032515, 1.545062, 0.2588235, 1, 0, 1,
-0.5102521, 0.2054066, -0.517961, 0.254902, 1, 0, 1,
-0.5087732, -1.172135, -3.779957, 0.2470588, 1, 0, 1,
-0.5028045, -0.3824455, -2.259988, 0.2431373, 1, 0, 1,
-0.5021374, 0.6949193, 0.9631134, 0.2352941, 1, 0, 1,
-0.499465, -1.46237, -4.68094, 0.2313726, 1, 0, 1,
-0.4985258, -0.5767288, -3.764091, 0.2235294, 1, 0, 1,
-0.4963301, 0.8513364, -0.6293977, 0.2196078, 1, 0, 1,
-0.4955251, -0.4319471, -2.069392, 0.2117647, 1, 0, 1,
-0.4949793, 0.7654572, 0.9223942, 0.2078431, 1, 0, 1,
-0.4898634, -0.2107571, -2.555763, 0.2, 1, 0, 1,
-0.4895788, 0.2487575, -1.201865, 0.1921569, 1, 0, 1,
-0.487032, 0.3761859, -3.253628, 0.1882353, 1, 0, 1,
-0.4821143, -0.2035773, -2.700263, 0.1803922, 1, 0, 1,
-0.4807267, -0.8416142, -0.6825082, 0.1764706, 1, 0, 1,
-0.4781621, 2.007882, -0.8245278, 0.1686275, 1, 0, 1,
-0.470984, 0.5047803, 1.092817, 0.1647059, 1, 0, 1,
-0.4685489, 1.176509, 0.1948895, 0.1568628, 1, 0, 1,
-0.4673344, 0.5480918, -0.8594612, 0.1529412, 1, 0, 1,
-0.4636079, 0.3502613, -1.89882, 0.145098, 1, 0, 1,
-0.4633452, -0.3381058, -1.898733, 0.1411765, 1, 0, 1,
-0.4585676, -0.324883, -2.856008, 0.1333333, 1, 0, 1,
-0.4581393, -0.2499626, -0.5900772, 0.1294118, 1, 0, 1,
-0.4549893, 1.434932, -0.9652182, 0.1215686, 1, 0, 1,
-0.452641, 0.6619685, -0.389985, 0.1176471, 1, 0, 1,
-0.4475687, 0.5904222, 0.6031551, 0.1098039, 1, 0, 1,
-0.4421342, -0.3965153, -2.71383, 0.1058824, 1, 0, 1,
-0.4346955, -0.5964693, -1.580702, 0.09803922, 1, 0, 1,
-0.4307901, 0.555774, -1.133122, 0.09019608, 1, 0, 1,
-0.428493, -1.305518, -3.266472, 0.08627451, 1, 0, 1,
-0.4278839, 1.153334, -1.595451, 0.07843138, 1, 0, 1,
-0.4248115, -0.921284, -2.558776, 0.07450981, 1, 0, 1,
-0.4233849, 0.6959148, 1.966759, 0.06666667, 1, 0, 1,
-0.4182104, -0.2106451, -2.539635, 0.0627451, 1, 0, 1,
-0.4135715, 0.8008322, 0.619535, 0.05490196, 1, 0, 1,
-0.413265, 0.7290418, -2.203464, 0.05098039, 1, 0, 1,
-0.4089077, 0.7058414, -1.236944, 0.04313726, 1, 0, 1,
-0.4088034, -0.7357037, -1.424942, 0.03921569, 1, 0, 1,
-0.4076616, 0.3653248, -0.5536279, 0.03137255, 1, 0, 1,
-0.4070804, -0.6002324, -2.626301, 0.02745098, 1, 0, 1,
-0.4067843, 0.5530008, -1.362391, 0.01960784, 1, 0, 1,
-0.4064056, 0.2769215, -0.6119541, 0.01568628, 1, 0, 1,
-0.4056745, -0.8257163, -1.760762, 0.007843138, 1, 0, 1,
-0.4053272, -0.3736959, -2.04811, 0.003921569, 1, 0, 1,
-0.4050739, -0.8792669, -3.16055, 0, 1, 0.003921569, 1,
-0.4006152, 0.3119503, -0.1214096, 0, 1, 0.01176471, 1,
-0.3967632, -0.09423649, -2.434846, 0, 1, 0.01568628, 1,
-0.3952369, 0.5465285, -0.3868591, 0, 1, 0.02352941, 1,
-0.394096, 2.53363, -0.94116, 0, 1, 0.02745098, 1,
-0.3902602, 0.3660676, -0.7064492, 0, 1, 0.03529412, 1,
-0.3892184, -1.412573, -2.684071, 0, 1, 0.03921569, 1,
-0.3878536, 0.6517743, 0.2666743, 0, 1, 0.04705882, 1,
-0.3808831, -2.563356, -4.085357, 0, 1, 0.05098039, 1,
-0.3795391, -0.8417653, -1.704738, 0, 1, 0.05882353, 1,
-0.3773907, 0.7487126, -1.076559, 0, 1, 0.0627451, 1,
-0.3745064, -0.3928671, 0.13753, 0, 1, 0.07058824, 1,
-0.3712651, 0.09701438, -0.9982095, 0, 1, 0.07450981, 1,
-0.3703052, -1.453727, -3.124793, 0, 1, 0.08235294, 1,
-0.3692887, -0.3392122, -0.4125781, 0, 1, 0.08627451, 1,
-0.3683248, 1.53809, 0.07067987, 0, 1, 0.09411765, 1,
-0.3670793, -1.572694, -3.414089, 0, 1, 0.1019608, 1,
-0.3668901, -2.028688, -3.404409, 0, 1, 0.1058824, 1,
-0.3666383, 0.3791324, -1.891129, 0, 1, 0.1137255, 1,
-0.3653291, 1.369484, -1.498015, 0, 1, 0.1176471, 1,
-0.364371, 1.606131, -1.485546, 0, 1, 0.1254902, 1,
-0.3595788, -1.083283, -3.058902, 0, 1, 0.1294118, 1,
-0.3578519, 0.1033074, -3.101909, 0, 1, 0.1372549, 1,
-0.3570184, -1.059715, -3.392108, 0, 1, 0.1411765, 1,
-0.3466672, -1.978775, -4.40236, 0, 1, 0.1490196, 1,
-0.3444727, 1.089086, -0.6224634, 0, 1, 0.1529412, 1,
-0.3390544, -0.3391648, -4.932882, 0, 1, 0.1607843, 1,
-0.3385783, -0.1786827, -2.201151, 0, 1, 0.1647059, 1,
-0.3336726, -0.8853194, 0.1390466, 0, 1, 0.172549, 1,
-0.3309516, -1.004144, -1.692178, 0, 1, 0.1764706, 1,
-0.3295557, -0.8264607, -2.005651, 0, 1, 0.1843137, 1,
-0.3268017, -0.6140693, -0.4346244, 0, 1, 0.1882353, 1,
-0.3264858, 1.78918, -0.5800816, 0, 1, 0.1960784, 1,
-0.32147, 0.5481008, -2.176202, 0, 1, 0.2039216, 1,
-0.3187403, 0.2931413, -0.8977026, 0, 1, 0.2078431, 1,
-0.3138357, 1.07269, -1.517155, 0, 1, 0.2156863, 1,
-0.3105457, -0.03080005, -1.702448, 0, 1, 0.2196078, 1,
-0.3073253, 0.597454, 0.6297482, 0, 1, 0.227451, 1,
-0.3044614, -0.8593935, -2.380316, 0, 1, 0.2313726, 1,
-0.3032824, 0.4709717, 0.1395182, 0, 1, 0.2392157, 1,
-0.3026766, -1.864587, -0.3049431, 0, 1, 0.2431373, 1,
-0.2976483, 0.7603127, -2.252146, 0, 1, 0.2509804, 1,
-0.297096, 0.1497238, 0.243378, 0, 1, 0.254902, 1,
-0.2962824, -0.4444786, -4.103868, 0, 1, 0.2627451, 1,
-0.296101, 1.010554, 0.8575056, 0, 1, 0.2666667, 1,
-0.2949967, -2.151591, -3.503248, 0, 1, 0.2745098, 1,
-0.2940481, -0.5776452, -1.201389, 0, 1, 0.2784314, 1,
-0.293291, -0.6025947, -3.52313, 0, 1, 0.2862745, 1,
-0.2910594, -0.09286332, -2.074984, 0, 1, 0.2901961, 1,
-0.2875582, 0.2712053, 0.2215464, 0, 1, 0.2980392, 1,
-0.2873632, -2.225534, -1.954452, 0, 1, 0.3058824, 1,
-0.2861052, 0.03524233, -2.234228, 0, 1, 0.3098039, 1,
-0.2850441, 1.275805, -0.9509817, 0, 1, 0.3176471, 1,
-0.2848126, 0.06573364, -0.7709513, 0, 1, 0.3215686, 1,
-0.2839921, 0.4041439, -0.2214576, 0, 1, 0.3294118, 1,
-0.2810566, -0.3836056, -3.496071, 0, 1, 0.3333333, 1,
-0.2793708, 0.08302487, -0.3092288, 0, 1, 0.3411765, 1,
-0.2787489, -0.3510708, -3.247117, 0, 1, 0.345098, 1,
-0.277928, 0.1496478, -1.469574, 0, 1, 0.3529412, 1,
-0.2772172, -0.505091, -1.814664, 0, 1, 0.3568628, 1,
-0.2723965, 1.133468, 0.8368973, 0, 1, 0.3647059, 1,
-0.2722697, 1.084101, -0.3048076, 0, 1, 0.3686275, 1,
-0.2690243, 0.1204079, -0.8661262, 0, 1, 0.3764706, 1,
-0.262185, 0.5855095, -1.523088, 0, 1, 0.3803922, 1,
-0.2613949, 0.4309386, -0.5540289, 0, 1, 0.3882353, 1,
-0.2591352, 1.6817, -1.637975, 0, 1, 0.3921569, 1,
-0.2579096, 0.8153123, -0.6779195, 0, 1, 0.4, 1,
-0.2516271, 0.5101907, -1.23325, 0, 1, 0.4078431, 1,
-0.250173, -0.8269502, -2.668694, 0, 1, 0.4117647, 1,
-0.2492296, 0.6560206, -0.07408375, 0, 1, 0.4196078, 1,
-0.2478436, -0.3756079, -2.442759, 0, 1, 0.4235294, 1,
-0.24274, -1.098798, -2.918237, 0, 1, 0.4313726, 1,
-0.2396569, -0.02712613, -2.237338, 0, 1, 0.4352941, 1,
-0.2380792, -1.265011, -2.086191, 0, 1, 0.4431373, 1,
-0.2369715, -0.1185327, -0.2299532, 0, 1, 0.4470588, 1,
-0.234587, 0.3730443, 0.03567224, 0, 1, 0.454902, 1,
-0.2341808, 0.6649107, 0.1425758, 0, 1, 0.4588235, 1,
-0.233198, -1.05835, -4.429801, 0, 1, 0.4666667, 1,
-0.2330145, 0.9511904, 0.5625029, 0, 1, 0.4705882, 1,
-0.2208402, -0.5678704, -4.758395, 0, 1, 0.4784314, 1,
-0.2146983, 0.6543964, -1.137056, 0, 1, 0.4823529, 1,
-0.2144686, -0.929507, -1.561241, 0, 1, 0.4901961, 1,
-0.2094262, -0.1950406, -3.19819, 0, 1, 0.4941176, 1,
-0.2074605, -0.07557273, -1.752435, 0, 1, 0.5019608, 1,
-0.2070502, -0.3861972, -3.109328, 0, 1, 0.509804, 1,
-0.2069926, 0.6236385, 0.7368228, 0, 1, 0.5137255, 1,
-0.2055234, 1.715467, 0.8249838, 0, 1, 0.5215687, 1,
-0.2042297, 2.012033, -0.07795886, 0, 1, 0.5254902, 1,
-0.2030053, 0.1211758, -0.2927468, 0, 1, 0.5333334, 1,
-0.2004764, 0.7402108, -0.3665421, 0, 1, 0.5372549, 1,
-0.191728, 1.247529, 1.405997, 0, 1, 0.5450981, 1,
-0.1899809, -0.8401244, -3.919899, 0, 1, 0.5490196, 1,
-0.1896913, -0.2317789, -2.324729, 0, 1, 0.5568628, 1,
-0.1852812, -1.043355, -3.467754, 0, 1, 0.5607843, 1,
-0.1805914, 0.3622901, 1.266134, 0, 1, 0.5686275, 1,
-0.1771298, 1.354618, 0.9352855, 0, 1, 0.572549, 1,
-0.176049, -2.616893, -4.221416, 0, 1, 0.5803922, 1,
-0.1726394, -0.5351977, -4.138747, 0, 1, 0.5843138, 1,
-0.1722407, -0.3974737, -3.559802, 0, 1, 0.5921569, 1,
-0.1715132, -0.0284955, -1.899028, 0, 1, 0.5960785, 1,
-0.1700482, -1.087049, -3.215958, 0, 1, 0.6039216, 1,
-0.1602769, 0.503459, 0.9724606, 0, 1, 0.6117647, 1,
-0.1589008, 1.412389, -0.6591182, 0, 1, 0.6156863, 1,
-0.1583812, -0.9297042, -3.929739, 0, 1, 0.6235294, 1,
-0.1568257, 0.4436011, 0.1318132, 0, 1, 0.627451, 1,
-0.1519668, 0.8829688, -0.3426945, 0, 1, 0.6352941, 1,
-0.1507902, -0.7786181, -4.360732, 0, 1, 0.6392157, 1,
-0.1497264, 1.473068, -0.7121192, 0, 1, 0.6470588, 1,
-0.1488366, 0.2375829, -1.068654, 0, 1, 0.6509804, 1,
-0.1427287, -0.0397004, -3.38688, 0, 1, 0.6588235, 1,
-0.142492, 0.3967468, -1.416237, 0, 1, 0.6627451, 1,
-0.1382561, 2.052326, -1.360582, 0, 1, 0.6705883, 1,
-0.1371055, -1.61785, -1.998323, 0, 1, 0.6745098, 1,
-0.1335416, -0.3926704, -3.87634, 0, 1, 0.682353, 1,
-0.1333202, 0.01642952, -1.40627, 0, 1, 0.6862745, 1,
-0.131985, -0.2865938, -4.340891, 0, 1, 0.6941177, 1,
-0.1306967, 0.4921083, -0.8424026, 0, 1, 0.7019608, 1,
-0.12897, 0.04862467, -1.254251, 0, 1, 0.7058824, 1,
-0.1230851, -0.7687699, -3.157001, 0, 1, 0.7137255, 1,
-0.122867, 1.215521, -0.1142072, 0, 1, 0.7176471, 1,
-0.1207706, -0.9099127, -2.356291, 0, 1, 0.7254902, 1,
-0.1195913, 1.32418, 1.60118, 0, 1, 0.7294118, 1,
-0.1169402, 0.5361428, -1.506804, 0, 1, 0.7372549, 1,
-0.1078322, -1.179378, -1.730027, 0, 1, 0.7411765, 1,
-0.1053622, 0.06333619, -0.2490146, 0, 1, 0.7490196, 1,
-0.1050127, 0.2212268, 0.2199937, 0, 1, 0.7529412, 1,
-0.1030844, 1.171916, -0.0940171, 0, 1, 0.7607843, 1,
-0.1006586, -0.5379743, -2.925978, 0, 1, 0.7647059, 1,
-0.09891797, -0.4045344, -2.721174, 0, 1, 0.772549, 1,
-0.09632227, 1.851638, -0.6616477, 0, 1, 0.7764706, 1,
-0.09298792, -0.04478639, -3.156225, 0, 1, 0.7843137, 1,
-0.08975165, 2.038411, 0.5731226, 0, 1, 0.7882353, 1,
-0.08953752, -0.7520041, -3.663025, 0, 1, 0.7960784, 1,
-0.08893944, -1.431527, -3.303145, 0, 1, 0.8039216, 1,
-0.08830219, -0.8264763, -2.811731, 0, 1, 0.8078431, 1,
-0.08703076, -0.7762035, -3.368288, 0, 1, 0.8156863, 1,
-0.08626541, -0.09062319, -1.479053, 0, 1, 0.8196079, 1,
-0.08540317, 0.2491796, -0.1102297, 0, 1, 0.827451, 1,
-0.08406471, -0.2996367, -1.503691, 0, 1, 0.8313726, 1,
-0.08290391, -0.2798513, -2.786058, 0, 1, 0.8392157, 1,
-0.07932273, -0.6664462, -3.881628, 0, 1, 0.8431373, 1,
-0.07824999, -1.622524, -3.612105, 0, 1, 0.8509804, 1,
-0.07822832, 0.7397094, -0.7455946, 0, 1, 0.854902, 1,
-0.07142912, -0.2577658, -1.150174, 0, 1, 0.8627451, 1,
-0.06944672, 0.8351317, -0.1508675, 0, 1, 0.8666667, 1,
-0.06269046, -0.621938, -2.73401, 0, 1, 0.8745098, 1,
-0.06158886, 1.144687, -1.456234, 0, 1, 0.8784314, 1,
-0.05420669, -1.183929, -3.378071, 0, 1, 0.8862745, 1,
-0.0529066, -2.500055, -2.416764, 0, 1, 0.8901961, 1,
-0.05188753, -1.27098, -1.543286, 0, 1, 0.8980392, 1,
-0.04827826, -0.2994699, -4.532334, 0, 1, 0.9058824, 1,
-0.047891, 0.7158003, -1.453763, 0, 1, 0.9098039, 1,
-0.04694753, 0.3447314, 1.282056, 0, 1, 0.9176471, 1,
-0.0467697, -0.357332, -4.097225, 0, 1, 0.9215686, 1,
-0.04532846, -0.4463794, -3.247274, 0, 1, 0.9294118, 1,
-0.04500355, -1.288221, -3.551387, 0, 1, 0.9333333, 1,
-0.03900483, 0.5809312, 0.98013, 0, 1, 0.9411765, 1,
-0.03619102, 1.555002, -0.05388834, 0, 1, 0.945098, 1,
-0.03178339, 0.6482115, -0.9931402, 0, 1, 0.9529412, 1,
-0.03167739, -0.3190557, -4.033268, 0, 1, 0.9568627, 1,
-0.02970408, 1.725885, 0.576947, 0, 1, 0.9647059, 1,
-0.02945701, -2.218643, -3.720446, 0, 1, 0.9686275, 1,
-0.01968199, 1.129559, 0.161006, 0, 1, 0.9764706, 1,
-0.01947724, 1.165037, 0.8296707, 0, 1, 0.9803922, 1,
-0.01886455, 0.7641681, 1.037453, 0, 1, 0.9882353, 1,
-0.01765849, -0.2238105, -2.411233, 0, 1, 0.9921569, 1,
-0.01758306, 0.01024664, -1.242062, 0, 1, 1, 1,
-0.01754356, 1.146704, 0.1338736, 0, 0.9921569, 1, 1,
-0.01545841, -0.1773799, -1.767916, 0, 0.9882353, 1, 1,
-0.00646882, -2.027364, -2.666076, 0, 0.9803922, 1, 1,
-0.001608823, 0.5739481, 0.1053368, 0, 0.9764706, 1, 1,
-0.0003297795, 0.1723564, -0.383585, 0, 0.9686275, 1, 1,
0.007022328, 0.3366535, -1.62087, 0, 0.9647059, 1, 1,
0.00775093, 1.150384, -0.963869, 0, 0.9568627, 1, 1,
0.007965817, -0.4759902, 2.63974, 0, 0.9529412, 1, 1,
0.008191836, 0.60905, -0.06306387, 0, 0.945098, 1, 1,
0.01104431, 0.2133938, -1.51239, 0, 0.9411765, 1, 1,
0.01105093, 0.2894221, -0.01438698, 0, 0.9333333, 1, 1,
0.01670017, 0.2164674, 1.318476, 0, 0.9294118, 1, 1,
0.0190633, -1.913241, 4.685612, 0, 0.9215686, 1, 1,
0.02391042, 0.3988362, 1.75993, 0, 0.9176471, 1, 1,
0.02612945, -1.509208, 2.694001, 0, 0.9098039, 1, 1,
0.02724666, -1.297731, 2.261727, 0, 0.9058824, 1, 1,
0.02754055, -2.500555, 2.992965, 0, 0.8980392, 1, 1,
0.02929734, 0.280284, -0.2219991, 0, 0.8901961, 1, 1,
0.03714227, -0.2030933, 0.6865761, 0, 0.8862745, 1, 1,
0.03769563, -2.142247, 1.894376, 0, 0.8784314, 1, 1,
0.03967298, 0.4239566, -0.9923573, 0, 0.8745098, 1, 1,
0.03977013, -2.015828, 4.063147, 0, 0.8666667, 1, 1,
0.03980242, -0.05083624, 2.245845, 0, 0.8627451, 1, 1,
0.04170242, -1.171902, 2.370548, 0, 0.854902, 1, 1,
0.0426389, -1.252962, 4.127697, 0, 0.8509804, 1, 1,
0.04750407, -1.04337, 1.981646, 0, 0.8431373, 1, 1,
0.05039062, 0.1051385, 1.409701, 0, 0.8392157, 1, 1,
0.05488734, -0.4961182, 4.375341, 0, 0.8313726, 1, 1,
0.05494033, -0.5180183, 2.689665, 0, 0.827451, 1, 1,
0.05576053, -1.008242, 3.566283, 0, 0.8196079, 1, 1,
0.05585103, 0.3305375, -0.1099987, 0, 0.8156863, 1, 1,
0.05736129, -1.705306, 3.849699, 0, 0.8078431, 1, 1,
0.07482496, 0.6168584, 0.7442744, 0, 0.8039216, 1, 1,
0.07687444, -1.725016, 3.27779, 0, 0.7960784, 1, 1,
0.0812957, -0.1662217, 2.077928, 0, 0.7882353, 1, 1,
0.08401228, 0.04548524, -0.8561184, 0, 0.7843137, 1, 1,
0.08458705, 0.4374206, -1.239071, 0, 0.7764706, 1, 1,
0.08740021, -0.9347605, 2.651091, 0, 0.772549, 1, 1,
0.0911724, 0.8632738, 0.4660189, 0, 0.7647059, 1, 1,
0.09128191, -0.9493642, 2.292396, 0, 0.7607843, 1, 1,
0.09187503, 1.872862, -0.8408911, 0, 0.7529412, 1, 1,
0.096828, -1.054773, 2.883347, 0, 0.7490196, 1, 1,
0.09692416, -0.4452555, 3.898351, 0, 0.7411765, 1, 1,
0.1002515, 0.0009012289, 4.005824, 0, 0.7372549, 1, 1,
0.1026322, -0.08140948, 1.836418, 0, 0.7294118, 1, 1,
0.1042705, -0.3528353, 5.009556, 0, 0.7254902, 1, 1,
0.107657, -0.4873875, 4.676754, 0, 0.7176471, 1, 1,
0.1088392, -1.161035, 4.033479, 0, 0.7137255, 1, 1,
0.1167922, -1.471966, 3.364223, 0, 0.7058824, 1, 1,
0.1171401, -0.3797821, 2.917731, 0, 0.6980392, 1, 1,
0.1199363, 0.9482685, 1.977449, 0, 0.6941177, 1, 1,
0.1209332, -0.4745835, 3.297263, 0, 0.6862745, 1, 1,
0.1214509, -1.365154, 4.578375, 0, 0.682353, 1, 1,
0.1227355, -0.02384573, 0.9179178, 0, 0.6745098, 1, 1,
0.1238933, 0.02936897, 2.205798, 0, 0.6705883, 1, 1,
0.1252826, 1.168909, -0.1864771, 0, 0.6627451, 1, 1,
0.127736, 0.4805397, 0.4784816, 0, 0.6588235, 1, 1,
0.1290679, 1.568216, -0.2862591, 0, 0.6509804, 1, 1,
0.1308411, -0.1039787, 2.8404, 0, 0.6470588, 1, 1,
0.138411, -1.391503, 2.310377, 0, 0.6392157, 1, 1,
0.1432031, -0.2125176, 4.129719, 0, 0.6352941, 1, 1,
0.1437509, 1.968187, 1.988364, 0, 0.627451, 1, 1,
0.1471983, -0.1722165, 2.543276, 0, 0.6235294, 1, 1,
0.1477285, 0.1750526, -0.5316809, 0, 0.6156863, 1, 1,
0.1486489, -0.7046909, 2.585331, 0, 0.6117647, 1, 1,
0.1495939, 1.596231, -0.4501647, 0, 0.6039216, 1, 1,
0.1583248, 0.2623387, -0.7637985, 0, 0.5960785, 1, 1,
0.1618074, 0.01779441, 1.473158, 0, 0.5921569, 1, 1,
0.1629637, -1.074665, 1.076284, 0, 0.5843138, 1, 1,
0.1641295, -0.05280127, 2.994342, 0, 0.5803922, 1, 1,
0.1729954, 0.1975384, 1.263227, 0, 0.572549, 1, 1,
0.1741133, 0.6892229, 0.7924826, 0, 0.5686275, 1, 1,
0.1761819, 0.2309024, -0.04471088, 0, 0.5607843, 1, 1,
0.1786326, -0.1709324, 2.796836, 0, 0.5568628, 1, 1,
0.1819571, 0.7028215, -0.7637424, 0, 0.5490196, 1, 1,
0.1854722, 0.2442403, 2.184868, 0, 0.5450981, 1, 1,
0.1856631, -1.004684, 3.958326, 0, 0.5372549, 1, 1,
0.1952162, -0.05320728, 0.7405725, 0, 0.5333334, 1, 1,
0.196871, -1.382182, 3.443532, 0, 0.5254902, 1, 1,
0.1990403, 2.419297, 1.371878, 0, 0.5215687, 1, 1,
0.203012, -1.077385, 1.504811, 0, 0.5137255, 1, 1,
0.2090649, -1.722999, 1.050849, 0, 0.509804, 1, 1,
0.2094775, 1.043576, 0.4629482, 0, 0.5019608, 1, 1,
0.2120813, 0.3172309, 0.8113742, 0, 0.4941176, 1, 1,
0.214003, 0.3241347, 1.417857, 0, 0.4901961, 1, 1,
0.2144427, 0.9263093, 3.099618, 0, 0.4823529, 1, 1,
0.2153742, -0.281558, 2.644618, 0, 0.4784314, 1, 1,
0.2194266, -0.05768403, 1.514642, 0, 0.4705882, 1, 1,
0.2195578, -0.2452547, 1.904266, 0, 0.4666667, 1, 1,
0.222892, -1.050167, 2.768933, 0, 0.4588235, 1, 1,
0.2251482, -0.8890814, 2.945182, 0, 0.454902, 1, 1,
0.2266507, 0.9938045, -1.388938, 0, 0.4470588, 1, 1,
0.2298943, -0.8740413, 1.715481, 0, 0.4431373, 1, 1,
0.2306832, -1.18238, 4.081749, 0, 0.4352941, 1, 1,
0.2336487, 1.346712, -0.8135627, 0, 0.4313726, 1, 1,
0.2338449, -1.798709, 2.086007, 0, 0.4235294, 1, 1,
0.2344384, -0.5666111, 2.089754, 0, 0.4196078, 1, 1,
0.237759, -0.5078614, 3.137148, 0, 0.4117647, 1, 1,
0.2391372, -0.5775214, 4.147335, 0, 0.4078431, 1, 1,
0.2442574, -0.844236, 4.469372, 0, 0.4, 1, 1,
0.2460587, 0.4280825, 0.5130499, 0, 0.3921569, 1, 1,
0.2464463, -0.5007865, 3.890218, 0, 0.3882353, 1, 1,
0.253107, 0.6940152, -0.07045082, 0, 0.3803922, 1, 1,
0.2550224, 1.401795, 1.307109, 0, 0.3764706, 1, 1,
0.2588794, 0.342199, -0.2717882, 0, 0.3686275, 1, 1,
0.2610665, 0.1406971, 1.558566, 0, 0.3647059, 1, 1,
0.2616783, 0.8209295, 0.8065833, 0, 0.3568628, 1, 1,
0.2638904, -0.1045987, 2.005031, 0, 0.3529412, 1, 1,
0.2655281, -0.5178976, 3.202867, 0, 0.345098, 1, 1,
0.2672319, 0.5007411, 0.2657269, 0, 0.3411765, 1, 1,
0.2705921, 0.2369327, 0.4305932, 0, 0.3333333, 1, 1,
0.2826728, -1.127668, 4.417098, 0, 0.3294118, 1, 1,
0.2833956, -0.3768586, 2.121742, 0, 0.3215686, 1, 1,
0.2881085, -0.7862375, 2.417924, 0, 0.3176471, 1, 1,
0.2888052, 0.0836191, 0.9021417, 0, 0.3098039, 1, 1,
0.2929552, -0.0054339, 2.087566, 0, 0.3058824, 1, 1,
0.2943377, -0.1121549, 2.958612, 0, 0.2980392, 1, 1,
0.294945, 0.2767195, 0.3081603, 0, 0.2901961, 1, 1,
0.2962643, -0.1246421, 2.463274, 0, 0.2862745, 1, 1,
0.2964642, 0.5293809, 1.13959, 0, 0.2784314, 1, 1,
0.2972473, 0.7021555, 1.237535, 0, 0.2745098, 1, 1,
0.2975709, -0.108784, 1.126939, 0, 0.2666667, 1, 1,
0.2988317, 0.6500131, -0.7871075, 0, 0.2627451, 1, 1,
0.3072537, -0.2963695, 2.911239, 0, 0.254902, 1, 1,
0.3092842, 0.1654354, -0.2324056, 0, 0.2509804, 1, 1,
0.3145145, 0.2857926, 1.089268, 0, 0.2431373, 1, 1,
0.3176302, 0.2502587, 2.054684, 0, 0.2392157, 1, 1,
0.3184817, -1.029177, 2.108562, 0, 0.2313726, 1, 1,
0.3186486, -0.2262624, 2.642904, 0, 0.227451, 1, 1,
0.3215029, -0.533539, 1.030024, 0, 0.2196078, 1, 1,
0.3215038, 1.849362, 0.7761381, 0, 0.2156863, 1, 1,
0.3235621, 0.3938946, 1.475158, 0, 0.2078431, 1, 1,
0.3269294, -0.03522363, 2.347148, 0, 0.2039216, 1, 1,
0.3274842, 0.9091279, -0.9348599, 0, 0.1960784, 1, 1,
0.3296783, 0.4218145, 1.503533, 0, 0.1882353, 1, 1,
0.3331694, -2.929921, 4.356045, 0, 0.1843137, 1, 1,
0.3369648, -1.928787, 2.356024, 0, 0.1764706, 1, 1,
0.3369834, 0.1766784, 0.6596068, 0, 0.172549, 1, 1,
0.3390231, -0.8447698, 2.083572, 0, 0.1647059, 1, 1,
0.3413965, 0.01574114, 1.102103, 0, 0.1607843, 1, 1,
0.3440537, 0.95938, 0.6259571, 0, 0.1529412, 1, 1,
0.3469527, 0.2195446, 1.312871, 0, 0.1490196, 1, 1,
0.3510624, 0.03062492, 2.331172, 0, 0.1411765, 1, 1,
0.3551592, -0.8018891, 1.734091, 0, 0.1372549, 1, 1,
0.3612048, -0.5391744, 1.580912, 0, 0.1294118, 1, 1,
0.362612, -0.459484, 2.736916, 0, 0.1254902, 1, 1,
0.3631543, 0.9803925, 0.4072749, 0, 0.1176471, 1, 1,
0.3655078, -0.2270834, 2.037812, 0, 0.1137255, 1, 1,
0.3689523, -0.3855709, 2.658032, 0, 0.1058824, 1, 1,
0.3710086, -0.238934, 2.746341, 0, 0.09803922, 1, 1,
0.3711486, -1.31819, 2.365853, 0, 0.09411765, 1, 1,
0.372187, 0.8704143, -1.102057, 0, 0.08627451, 1, 1,
0.3741944, -0.6251202, 2.53634, 0, 0.08235294, 1, 1,
0.3757241, 0.1543422, 1.836933, 0, 0.07450981, 1, 1,
0.3783918, -1.080752, 2.59285, 0, 0.07058824, 1, 1,
0.3796289, 0.09616735, 1.648002, 0, 0.0627451, 1, 1,
0.3816456, -0.7439649, 2.307197, 0, 0.05882353, 1, 1,
0.390051, -2.481366, 3.762454, 0, 0.05098039, 1, 1,
0.3911316, 0.7275147, -0.5406211, 0, 0.04705882, 1, 1,
0.3954946, 0.5849438, 1.571782, 0, 0.03921569, 1, 1,
0.3988087, 1.269656, -0.1861283, 0, 0.03529412, 1, 1,
0.3996948, 0.6883987, 0.9069068, 0, 0.02745098, 1, 1,
0.3999034, -0.2451882, 2.663358, 0, 0.02352941, 1, 1,
0.4018742, -1.183051, 3.922638, 0, 0.01568628, 1, 1,
0.404427, 1.674825, 1.112311, 0, 0.01176471, 1, 1,
0.4090152, 0.4301624, -0.4997305, 0, 0.003921569, 1, 1,
0.4097505, -0.2891856, 2.000986, 0.003921569, 0, 1, 1,
0.4100042, 0.4142196, 1.503946, 0.007843138, 0, 1, 1,
0.4117186, 1.481871, -1.77834, 0.01568628, 0, 1, 1,
0.4143744, 0.3314593, 2.299845, 0.01960784, 0, 1, 1,
0.4163875, 0.3830703, 1.27872, 0.02745098, 0, 1, 1,
0.417899, 0.3382747, 0.4156254, 0.03137255, 0, 1, 1,
0.4179406, 1.384615, 1.652795, 0.03921569, 0, 1, 1,
0.4203582, 0.2473814, 2.096943, 0.04313726, 0, 1, 1,
0.424801, 0.668398, -0.2952627, 0.05098039, 0, 1, 1,
0.4285062, -1.16618, 2.113718, 0.05490196, 0, 1, 1,
0.4310181, -0.6403158, 1.76373, 0.0627451, 0, 1, 1,
0.4311639, 0.3708388, -0.05361904, 0.06666667, 0, 1, 1,
0.4362222, 0.1359402, -1.092129, 0.07450981, 0, 1, 1,
0.4391685, 1.315454, -0.3175782, 0.07843138, 0, 1, 1,
0.4477774, 1.482018, 1.369041, 0.08627451, 0, 1, 1,
0.4490184, -1.369191, 2.591692, 0.09019608, 0, 1, 1,
0.4492961, -0.2473701, 3.136291, 0.09803922, 0, 1, 1,
0.4522978, 0.7635021, -1.593454, 0.1058824, 0, 1, 1,
0.4550827, 0.1223031, 1.437785, 0.1098039, 0, 1, 1,
0.4591577, -0.3725221, 1.464693, 0.1176471, 0, 1, 1,
0.4606031, -0.3136975, 3.17056, 0.1215686, 0, 1, 1,
0.4615068, 0.2756322, -0.4269301, 0.1294118, 0, 1, 1,
0.4655422, 0.4981478, 0.3807911, 0.1333333, 0, 1, 1,
0.4657114, 1.326299, -0.8733168, 0.1411765, 0, 1, 1,
0.4753278, -1.072844, 3.532217, 0.145098, 0, 1, 1,
0.4785784, 0.3309903, 0.4906943, 0.1529412, 0, 1, 1,
0.4801626, -2.567922, 2.331608, 0.1568628, 0, 1, 1,
0.4804819, 1.552759, -0.3100839, 0.1647059, 0, 1, 1,
0.4808015, -1.367208, 3.403739, 0.1686275, 0, 1, 1,
0.4825097, 0.1256729, 1.140171, 0.1764706, 0, 1, 1,
0.4848329, -0.6600304, 3.522911, 0.1803922, 0, 1, 1,
0.4887242, -1.411901, 3.417762, 0.1882353, 0, 1, 1,
0.4944421, 0.3316664, 1.026705, 0.1921569, 0, 1, 1,
0.4947556, 0.1357056, 2.480795, 0.2, 0, 1, 1,
0.4972165, -0.5827907, 3.872211, 0.2078431, 0, 1, 1,
0.5037555, -1.472148, 3.47034, 0.2117647, 0, 1, 1,
0.503931, -1.366712, 1.380394, 0.2196078, 0, 1, 1,
0.5046092, 1.844523, -0.09264489, 0.2235294, 0, 1, 1,
0.5065906, 0.2818539, 2.156748, 0.2313726, 0, 1, 1,
0.5069313, -0.2231653, 2.646458, 0.2352941, 0, 1, 1,
0.5096061, 1.153957, 0.3501043, 0.2431373, 0, 1, 1,
0.5156164, 0.7274452, -0.8554574, 0.2470588, 0, 1, 1,
0.5218866, -0.1787983, 2.564674, 0.254902, 0, 1, 1,
0.5223205, 1.072083, 2.692711, 0.2588235, 0, 1, 1,
0.5242281, 0.09942155, 2.051286, 0.2666667, 0, 1, 1,
0.5281908, 1.551803, 0.5132192, 0.2705882, 0, 1, 1,
0.5318941, 0.845143, -0.2247349, 0.2784314, 0, 1, 1,
0.5328936, -1.762297, 1.803666, 0.282353, 0, 1, 1,
0.5380372, 1.742567, 0.6565169, 0.2901961, 0, 1, 1,
0.5402921, -0.8177489, 2.209394, 0.2941177, 0, 1, 1,
0.5429282, -0.8938099, 1.724175, 0.3019608, 0, 1, 1,
0.5450354, -1.284236, 3.124509, 0.3098039, 0, 1, 1,
0.5472866, 0.2728985, 0.1846257, 0.3137255, 0, 1, 1,
0.5479257, 2.414163, -0.8047842, 0.3215686, 0, 1, 1,
0.5565835, -0.681358, 1.846128, 0.3254902, 0, 1, 1,
0.5599106, 0.872849, 0.4238199, 0.3333333, 0, 1, 1,
0.5599592, -0.08303756, 1.526367, 0.3372549, 0, 1, 1,
0.561212, -2.086028, 2.525119, 0.345098, 0, 1, 1,
0.5637531, -0.3263023, 1.90211, 0.3490196, 0, 1, 1,
0.563877, -0.2500864, 2.627522, 0.3568628, 0, 1, 1,
0.5643527, -0.7622394, 1.177018, 0.3607843, 0, 1, 1,
0.568743, -1.428892, 2.591942, 0.3686275, 0, 1, 1,
0.5718688, 1.025542, 1.052292, 0.372549, 0, 1, 1,
0.5750483, 0.08140332, 0.3293471, 0.3803922, 0, 1, 1,
0.5757804, -0.6607821, 3.543928, 0.3843137, 0, 1, 1,
0.5774898, -0.1687917, 2.750592, 0.3921569, 0, 1, 1,
0.5831398, -0.4834321, 3.847233, 0.3960784, 0, 1, 1,
0.5872099, -1.205105, 2.328715, 0.4039216, 0, 1, 1,
0.5878677, -0.3224365, 3.133823, 0.4117647, 0, 1, 1,
0.5914798, 0.4831907, 0.8775359, 0.4156863, 0, 1, 1,
0.5938354, -0.6218776, 4.630563, 0.4235294, 0, 1, 1,
0.5939339, -0.4666474, 4.358207, 0.427451, 0, 1, 1,
0.5971879, 0.3779131, 1.661211, 0.4352941, 0, 1, 1,
0.5974746, -0.174587, 0.7102076, 0.4392157, 0, 1, 1,
0.5981387, 0.3330349, 1.532329, 0.4470588, 0, 1, 1,
0.5982021, -0.4557285, 2.846012, 0.4509804, 0, 1, 1,
0.5983729, -0.514429, 1.945386, 0.4588235, 0, 1, 1,
0.6025238, 0.8981166, 2.01264, 0.4627451, 0, 1, 1,
0.6062635, 0.1391688, -1.724965, 0.4705882, 0, 1, 1,
0.6073551, -0.5510102, 2.139786, 0.4745098, 0, 1, 1,
0.6079382, 0.7101144, 1.437128, 0.4823529, 0, 1, 1,
0.6113372, 0.07909387, 0.6438416, 0.4862745, 0, 1, 1,
0.6124797, 0.7151373, -0.1906289, 0.4941176, 0, 1, 1,
0.612957, 0.38904, -1.006304, 0.5019608, 0, 1, 1,
0.620262, -1.062792, 2.820629, 0.5058824, 0, 1, 1,
0.6292111, 0.3128056, 0.356326, 0.5137255, 0, 1, 1,
0.6297354, 1.060898, 0.9827366, 0.5176471, 0, 1, 1,
0.6303823, 1.072768, 0.02561468, 0.5254902, 0, 1, 1,
0.6307282, 0.2242138, 2.036016, 0.5294118, 0, 1, 1,
0.6344701, 1.747342, -0.3416771, 0.5372549, 0, 1, 1,
0.637053, -0.5727552, 2.608442, 0.5411765, 0, 1, 1,
0.6386746, 0.5573353, 0.0187506, 0.5490196, 0, 1, 1,
0.639013, 0.2553866, 0.9515067, 0.5529412, 0, 1, 1,
0.6436478, -0.5038563, 1.831807, 0.5607843, 0, 1, 1,
0.6463572, -0.7396216, 2.099932, 0.5647059, 0, 1, 1,
0.6524727, 0.8814064, -1.432008, 0.572549, 0, 1, 1,
0.6535543, -0.4623004, -0.02555161, 0.5764706, 0, 1, 1,
0.6551992, -0.06875761, 0.7699732, 0.5843138, 0, 1, 1,
0.6563147, 1.383625, 0.5834882, 0.5882353, 0, 1, 1,
0.6575552, -1.378674, 4.578491, 0.5960785, 0, 1, 1,
0.6587577, 0.02766895, -0.04371802, 0.6039216, 0, 1, 1,
0.6626076, 1.333877, 0.2546629, 0.6078432, 0, 1, 1,
0.6647422, 0.06801999, 0.4377336, 0.6156863, 0, 1, 1,
0.6660281, 0.8853284, 0.4644409, 0.6196079, 0, 1, 1,
0.6662863, 0.3585142, 1.969367, 0.627451, 0, 1, 1,
0.668, -0.0848574, 1.549865, 0.6313726, 0, 1, 1,
0.669493, 1.549308, 2.082676, 0.6392157, 0, 1, 1,
0.6698962, 0.1935026, 1.055696, 0.6431373, 0, 1, 1,
0.6704425, 0.162338, 0.7873492, 0.6509804, 0, 1, 1,
0.6768249, 1.578084, 0.3949341, 0.654902, 0, 1, 1,
0.6797783, 1.152783, 0.2158126, 0.6627451, 0, 1, 1,
0.6841068, -0.5171208, 1.049577, 0.6666667, 0, 1, 1,
0.6849902, -0.8219408, 2.141225, 0.6745098, 0, 1, 1,
0.687457, -0.3118425, 2.708279, 0.6784314, 0, 1, 1,
0.6898385, -0.08492227, 1.271714, 0.6862745, 0, 1, 1,
0.6980646, -1.115463, 3.731275, 0.6901961, 0, 1, 1,
0.7043269, -1.157422, 1.904365, 0.6980392, 0, 1, 1,
0.709452, 1.09471, 1.338681, 0.7058824, 0, 1, 1,
0.7206596, -0.1899091, 2.908732, 0.7098039, 0, 1, 1,
0.722711, -0.4631925, 0.6647125, 0.7176471, 0, 1, 1,
0.7232339, 0.907087, 0.3746434, 0.7215686, 0, 1, 1,
0.724045, -0.01903042, 0.9174507, 0.7294118, 0, 1, 1,
0.7246137, -3.347685, 2.53156, 0.7333333, 0, 1, 1,
0.7257288, -0.2275638, 2.833011, 0.7411765, 0, 1, 1,
0.7280757, 1.040656, -0.2363481, 0.7450981, 0, 1, 1,
0.728209, -2.121706, 4.817763, 0.7529412, 0, 1, 1,
0.7322814, -1.083081, 3.380824, 0.7568628, 0, 1, 1,
0.733326, -1.751831, 2.819383, 0.7647059, 0, 1, 1,
0.7370155, -1.379162, 4.658314, 0.7686275, 0, 1, 1,
0.7395423, 1.185526, 0.712296, 0.7764706, 0, 1, 1,
0.7400527, 0.06963553, 3.518114, 0.7803922, 0, 1, 1,
0.7404789, 0.2194775, 1.21285, 0.7882353, 0, 1, 1,
0.7475991, -0.009981048, 3.43768, 0.7921569, 0, 1, 1,
0.7519909, 0.5223145, 2.10438, 0.8, 0, 1, 1,
0.7523318, -0.9603661, 2.218616, 0.8078431, 0, 1, 1,
0.7579585, -0.5763438, 2.703388, 0.8117647, 0, 1, 1,
0.7654319, -0.5054807, 3.264267, 0.8196079, 0, 1, 1,
0.77618, -0.6973358, 4.247317, 0.8235294, 0, 1, 1,
0.7871842, 0.1697081, 1.767209, 0.8313726, 0, 1, 1,
0.7875404, -1.491148, 3.117702, 0.8352941, 0, 1, 1,
0.7899542, -0.3412378, 3.283895, 0.8431373, 0, 1, 1,
0.7902076, 1.669657, 3.075381, 0.8470588, 0, 1, 1,
0.7947891, 0.4479373, 0.04457758, 0.854902, 0, 1, 1,
0.7952214, -0.8845813, 2.806867, 0.8588235, 0, 1, 1,
0.804458, 2.038981, 1.676409, 0.8666667, 0, 1, 1,
0.8076446, 0.9473916, 0.9471629, 0.8705882, 0, 1, 1,
0.8165014, 0.05891531, 0.7121257, 0.8784314, 0, 1, 1,
0.819465, 0.5061706, 0.2836891, 0.8823529, 0, 1, 1,
0.8266998, -0.1785502, 0.5702428, 0.8901961, 0, 1, 1,
0.8287376, -0.8610249, 2.560831, 0.8941177, 0, 1, 1,
0.8320911, 1.646919, 1.58166, 0.9019608, 0, 1, 1,
0.8415713, 0.4515812, 0.7476147, 0.9098039, 0, 1, 1,
0.8425729, 0.5774668, 1.545499, 0.9137255, 0, 1, 1,
0.8440698, 1.334555, 1.910233, 0.9215686, 0, 1, 1,
0.8502859, -0.4724376, 2.380139, 0.9254902, 0, 1, 1,
0.850989, -0.732906, 2.819605, 0.9333333, 0, 1, 1,
0.8567551, 0.5808727, -1.090684, 0.9372549, 0, 1, 1,
0.8586184, -0.6667557, 0.925281, 0.945098, 0, 1, 1,
0.8648598, 0.05200997, 2.256453, 0.9490196, 0, 1, 1,
0.8670372, -0.7769051, 1.169252, 0.9568627, 0, 1, 1,
0.8732494, 1.800241, -0.4274159, 0.9607843, 0, 1, 1,
0.8795028, 0.8218448, 2.04462, 0.9686275, 0, 1, 1,
0.8796746, 1.114277, 2.085156, 0.972549, 0, 1, 1,
0.8804987, 1.263106, -0.6031914, 0.9803922, 0, 1, 1,
0.881116, -0.2330313, 2.153155, 0.9843137, 0, 1, 1,
0.8855355, -0.8228669, 3.255056, 0.9921569, 0, 1, 1,
0.8862334, 1.559278, 0.2726391, 0.9960784, 0, 1, 1,
0.887643, 1.250355, 1.727295, 1, 0, 0.9960784, 1,
0.8888727, -2.428818, 2.532119, 1, 0, 0.9882353, 1,
0.8969561, -0.8268245, 2.986972, 1, 0, 0.9843137, 1,
0.906352, 0.9997911, -0.3312672, 1, 0, 0.9764706, 1,
0.9075071, -1.70875, 1.79042, 1, 0, 0.972549, 1,
0.9268869, -0.703908, 1.490989, 1, 0, 0.9647059, 1,
0.9290924, -0.2926268, 1.361266, 1, 0, 0.9607843, 1,
0.9331678, 2.039346, 0.9607533, 1, 0, 0.9529412, 1,
0.9348748, 1.198179, 1.020737, 1, 0, 0.9490196, 1,
0.9378594, 1.089857, 2.643436, 1, 0, 0.9411765, 1,
0.9477264, 0.2812785, 1.034177, 1, 0, 0.9372549, 1,
0.9504516, 1.448203, 1.956622, 1, 0, 0.9294118, 1,
0.9525124, 0.1686764, 1.615696, 1, 0, 0.9254902, 1,
0.9531585, -1.408973, 4.102819, 1, 0, 0.9176471, 1,
0.9541699, 1.083783, 1.875, 1, 0, 0.9137255, 1,
0.964083, 0.1587571, 0.1890281, 1, 0, 0.9058824, 1,
0.9669892, -1.163835, 2.396955, 1, 0, 0.9019608, 1,
0.9723194, 1.566595, -1.685549, 1, 0, 0.8941177, 1,
0.9779797, -2.141281, 2.914973, 1, 0, 0.8862745, 1,
0.9796582, -1.133294, 3.179527, 1, 0, 0.8823529, 1,
0.9849399, -1.390495, 3.124586, 1, 0, 0.8745098, 1,
0.9851307, -0.133083, 1.032268, 1, 0, 0.8705882, 1,
0.9889295, -1.463408, 2.249729, 1, 0, 0.8627451, 1,
0.9947743, 1.117917, -1.259221, 1, 0, 0.8588235, 1,
1.004828, -1.120473, 4.099417, 1, 0, 0.8509804, 1,
1.013835, -1.143905, 3.313972, 1, 0, 0.8470588, 1,
1.018852, 0.3936342, 1.385352, 1, 0, 0.8392157, 1,
1.034667, 0.8143375, 1.152303, 1, 0, 0.8352941, 1,
1.039291, 0.6449721, -0.442533, 1, 0, 0.827451, 1,
1.040464, -2.234679, 2.412819, 1, 0, 0.8235294, 1,
1.042328, 1.520869, 1.504492, 1, 0, 0.8156863, 1,
1.052533, -0.6267326, 1.836074, 1, 0, 0.8117647, 1,
1.055877, 0.8773176, 1.206431, 1, 0, 0.8039216, 1,
1.075437, -1.059809, 2.960921, 1, 0, 0.7960784, 1,
1.077859, 0.3762121, 3.012707, 1, 0, 0.7921569, 1,
1.090549, 1.034169, -1.629786, 1, 0, 0.7843137, 1,
1.094286, 0.479233, 1.890566, 1, 0, 0.7803922, 1,
1.095768, 0.6180408, 0.7456009, 1, 0, 0.772549, 1,
1.101337, -0.06290448, 3.000792, 1, 0, 0.7686275, 1,
1.121385, 0.3489672, 2.375972, 1, 0, 0.7607843, 1,
1.124495, 0.3434011, 0.990932, 1, 0, 0.7568628, 1,
1.125156, -1.21611, 2.436836, 1, 0, 0.7490196, 1,
1.125803, 0.4147353, 2.457286, 1, 0, 0.7450981, 1,
1.128405, -1.703492, 3.166409, 1, 0, 0.7372549, 1,
1.129101, 0.7175807, -0.3732623, 1, 0, 0.7333333, 1,
1.131338, 0.2285607, -0.1872016, 1, 0, 0.7254902, 1,
1.131838, 0.05688451, 1.927869, 1, 0, 0.7215686, 1,
1.138539, 2.257202, 0.5963683, 1, 0, 0.7137255, 1,
1.146219, 1.021474, 1.024026, 1, 0, 0.7098039, 1,
1.148412, 0.2302596, 1.914902, 1, 0, 0.7019608, 1,
1.149955, -1.71441, 3.584953, 1, 0, 0.6941177, 1,
1.150261, 1.219802, 1.156325, 1, 0, 0.6901961, 1,
1.154735, -1.240668, 2.458831, 1, 0, 0.682353, 1,
1.159079, -0.0794116, 1.203507, 1, 0, 0.6784314, 1,
1.161944, -0.3031832, 2.322334, 1, 0, 0.6705883, 1,
1.162651, -0.6637957, 3.374364, 1, 0, 0.6666667, 1,
1.164544, -0.8602485, 3.179607, 1, 0, 0.6588235, 1,
1.169273, 1.031735, -0.1482618, 1, 0, 0.654902, 1,
1.17052, -0.3285989, 1.861799, 1, 0, 0.6470588, 1,
1.17824, 1.456205, 0.6660174, 1, 0, 0.6431373, 1,
1.180244, 0.3478098, 1.42204, 1, 0, 0.6352941, 1,
1.182353, 0.8028072, 0.4917579, 1, 0, 0.6313726, 1,
1.185261, -1.665127, 3.143621, 1, 0, 0.6235294, 1,
1.186882, -0.6693659, 1.739836, 1, 0, 0.6196079, 1,
1.219539, 1.013412, 0.5746794, 1, 0, 0.6117647, 1,
1.220909, 0.2389721, 1.255287, 1, 0, 0.6078432, 1,
1.223346, 0.2426124, 1.549247, 1, 0, 0.6, 1,
1.223852, 2.164611, 0.2258915, 1, 0, 0.5921569, 1,
1.232546, 1.925232, 0.3984026, 1, 0, 0.5882353, 1,
1.244637, 0.6508141, 1.23204, 1, 0, 0.5803922, 1,
1.253018, -0.2988687, 4.308097, 1, 0, 0.5764706, 1,
1.255829, -0.5556256, 2.527987, 1, 0, 0.5686275, 1,
1.267636, -0.132451, 1.382023, 1, 0, 0.5647059, 1,
1.280852, -0.4639019, 1.984318, 1, 0, 0.5568628, 1,
1.298613, -0.8194017, 2.477037, 1, 0, 0.5529412, 1,
1.314551, -0.2982114, 1.779595, 1, 0, 0.5450981, 1,
1.315104, -0.8187381, 2.60024, 1, 0, 0.5411765, 1,
1.326002, -0.02872784, 2.877805, 1, 0, 0.5333334, 1,
1.340339, 0.6072237, 1.026711, 1, 0, 0.5294118, 1,
1.340368, 0.2717399, 2.581615, 1, 0, 0.5215687, 1,
1.342823, -0.1229005, 1.095224, 1, 0, 0.5176471, 1,
1.348232, 0.4412374, 2.331912, 1, 0, 0.509804, 1,
1.350733, 1.266247, 0.9832801, 1, 0, 0.5058824, 1,
1.350897, 0.2962036, 0.6870315, 1, 0, 0.4980392, 1,
1.37101, -0.0579906, 2.67881, 1, 0, 0.4901961, 1,
1.375296, 1.77635, 1.621191, 1, 0, 0.4862745, 1,
1.387269, 0.9185685, 0.2753223, 1, 0, 0.4784314, 1,
1.390869, -1.460291, 2.14626, 1, 0, 0.4745098, 1,
1.400585, 0.6914453, 0.3735059, 1, 0, 0.4666667, 1,
1.401698, -0.05933286, 1.370539, 1, 0, 0.4627451, 1,
1.411944, -1.092603, 0.9751486, 1, 0, 0.454902, 1,
1.418213, -0.8666975, 2.340784, 1, 0, 0.4509804, 1,
1.426008, -0.4415186, 1.805052, 1, 0, 0.4431373, 1,
1.436473, 1.377068, 0.5637774, 1, 0, 0.4392157, 1,
1.444569, -0.2818348, 1.670437, 1, 0, 0.4313726, 1,
1.44895, -0.1842621, 2.868197, 1, 0, 0.427451, 1,
1.470506, 0.259681, 0.08358172, 1, 0, 0.4196078, 1,
1.483397, -0.1180077, 3.842299, 1, 0, 0.4156863, 1,
1.484277, -0.1851816, 2.027955, 1, 0, 0.4078431, 1,
1.488488, -0.7241236, 2.405848, 1, 0, 0.4039216, 1,
1.508285, -1.608734, 1.632308, 1, 0, 0.3960784, 1,
1.511252, 0.2888055, 2.037262, 1, 0, 0.3882353, 1,
1.522164, -0.2908868, -0.5470045, 1, 0, 0.3843137, 1,
1.523748, 0.3503969, 1.173915, 1, 0, 0.3764706, 1,
1.525338, 0.5227343, 2.006966, 1, 0, 0.372549, 1,
1.525766, -0.076451, 1.69246, 1, 0, 0.3647059, 1,
1.547017, -0.1563023, 2.198591, 1, 0, 0.3607843, 1,
1.59157, 0.08990518, 1.957695, 1, 0, 0.3529412, 1,
1.606253, -2.034123, 2.49852, 1, 0, 0.3490196, 1,
1.607932, -0.9104543, 3.269431, 1, 0, 0.3411765, 1,
1.634856, -1.206862, 3.484896, 1, 0, 0.3372549, 1,
1.645872, -1.427693, 1.787161, 1, 0, 0.3294118, 1,
1.649, -0.5936475, 2.595139, 1, 0, 0.3254902, 1,
1.652584, -0.6283726, 1.916846, 1, 0, 0.3176471, 1,
1.659862, -0.5323569, 1.683326, 1, 0, 0.3137255, 1,
1.664603, -2.035372, 3.143404, 1, 0, 0.3058824, 1,
1.672808, 0.1619451, 1.851821, 1, 0, 0.2980392, 1,
1.689334, 0.3143316, -0.1380073, 1, 0, 0.2941177, 1,
1.690402, 0.02022183, 0.7310681, 1, 0, 0.2862745, 1,
1.698446, 0.2978498, 3.157501, 1, 0, 0.282353, 1,
1.706935, 1.547318, 1.414287, 1, 0, 0.2745098, 1,
1.708199, -1.440055, 2.930578, 1, 0, 0.2705882, 1,
1.709756, -0.174994, 1.285787, 1, 0, 0.2627451, 1,
1.71834, -0.242906, 1.699827, 1, 0, 0.2588235, 1,
1.725413, 0.7174374, 2.092204, 1, 0, 0.2509804, 1,
1.731959, 1.336216, 2.356629, 1, 0, 0.2470588, 1,
1.754611, 0.9357781, -0.4177021, 1, 0, 0.2392157, 1,
1.756752, 2.184144, 0.6176577, 1, 0, 0.2352941, 1,
1.763559, 0.3593493, -0.3215788, 1, 0, 0.227451, 1,
1.788462, -0.007522643, 1.594344, 1, 0, 0.2235294, 1,
1.833319, 1.011325, 1.26834, 1, 0, 0.2156863, 1,
1.840974, -0.3790471, 1.822846, 1, 0, 0.2117647, 1,
1.858428, 0.4175959, 0.7419103, 1, 0, 0.2039216, 1,
1.867845, 0.7899802, 2.245862, 1, 0, 0.1960784, 1,
1.873459, -0.816035, 0.8886942, 1, 0, 0.1921569, 1,
1.877723, 1.701599, 2.077842, 1, 0, 0.1843137, 1,
1.907735, 0.7838894, 2.027124, 1, 0, 0.1803922, 1,
1.924667, -0.2418016, 2.302452, 1, 0, 0.172549, 1,
1.936606, -0.6692167, 1.243253, 1, 0, 0.1686275, 1,
1.942044, 1.070576, 1.681038, 1, 0, 0.1607843, 1,
1.943211, 1.010222, 0.5252323, 1, 0, 0.1568628, 1,
1.970693, -0.5956089, 1.747145, 1, 0, 0.1490196, 1,
1.974146, 0.4040114, 0.7191427, 1, 0, 0.145098, 1,
1.981586, 0.7095668, 1.816159, 1, 0, 0.1372549, 1,
2.015591, -1.044362, 1.755327, 1, 0, 0.1333333, 1,
2.016913, 0.923593, 1.446514, 1, 0, 0.1254902, 1,
2.022243, 2.259935, 0.6834744, 1, 0, 0.1215686, 1,
2.062564, -0.1495895, 1.319159, 1, 0, 0.1137255, 1,
2.114495, 1.459797, 3.016043, 1, 0, 0.1098039, 1,
2.120901, -0.5279114, 0.9428804, 1, 0, 0.1019608, 1,
2.131231, 1.35341, 1.92078, 1, 0, 0.09411765, 1,
2.133233, -1.013453, 2.417709, 1, 0, 0.09019608, 1,
2.150751, -0.9475845, 2.36386, 1, 0, 0.08235294, 1,
2.171271, 0.64823, 0.626674, 1, 0, 0.07843138, 1,
2.222677, 0.2263215, 1.079682, 1, 0, 0.07058824, 1,
2.238244, -0.6101837, 2.446044, 1, 0, 0.06666667, 1,
2.268744, -0.5300602, 2.707303, 1, 0, 0.05882353, 1,
2.284141, -0.09884855, 1.168969, 1, 0, 0.05490196, 1,
2.306188, -0.2000685, 1.550567, 1, 0, 0.04705882, 1,
2.362439, 0.5655614, 1.384711, 1, 0, 0.04313726, 1,
2.431129, 0.8356594, 0.6932663, 1, 0, 0.03529412, 1,
2.500599, 0.0188201, 2.406045, 1, 0, 0.03137255, 1,
2.625154, 0.7093609, -0.701932, 1, 0, 0.02352941, 1,
2.966543, 2.192065, 0.5409198, 1, 0, 0.01960784, 1,
3.148593, -1.340134, 1.700171, 1, 0, 0.01176471, 1,
3.334687, -0.2181076, 3.301548, 1, 0, 0.007843138, 1
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
0.16114, -4.366607, -6.618125, 0, -0.5, 0.5, 0.5,
0.16114, -4.366607, -6.618125, 1, -0.5, 0.5, 0.5,
0.16114, -4.366607, -6.618125, 1, 1.5, 0.5, 0.5,
0.16114, -4.366607, -6.618125, 0, 1.5, 0.5, 0.5
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
-4.08824, -0.3420172, -6.618125, 0, -0.5, 0.5, 0.5,
-4.08824, -0.3420172, -6.618125, 1, -0.5, 0.5, 0.5,
-4.08824, -0.3420172, -6.618125, 1, 1.5, 0.5, 0.5,
-4.08824, -0.3420172, -6.618125, 0, 1.5, 0.5, 0.5
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
-4.08824, -4.366607, 0.03833699, 0, -0.5, 0.5, 0.5,
-4.08824, -4.366607, 0.03833699, 1, -0.5, 0.5, 0.5,
-4.08824, -4.366607, 0.03833699, 1, 1.5, 0.5, 0.5,
-4.08824, -4.366607, 0.03833699, 0, 1.5, 0.5, 0.5
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
-3, -3.437855, -5.082018,
3, -3.437855, -5.082018,
-3, -3.437855, -5.082018,
-3, -3.592647, -5.338036,
-2, -3.437855, -5.082018,
-2, -3.592647, -5.338036,
-1, -3.437855, -5.082018,
-1, -3.592647, -5.338036,
0, -3.437855, -5.082018,
0, -3.592647, -5.338036,
1, -3.437855, -5.082018,
1, -3.592647, -5.338036,
2, -3.437855, -5.082018,
2, -3.592647, -5.338036,
3, -3.437855, -5.082018,
3, -3.592647, -5.338036
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
-3, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
-3, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
-3, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
-3, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
-2, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
-2, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
-2, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
-2, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
-1, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
-1, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
-1, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
-1, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
0, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
0, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
0, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
0, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
1, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
1, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
1, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
1, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
2, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
2, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
2, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
2, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5,
3, -3.902231, -5.850072, 0, -0.5, 0.5, 0.5,
3, -3.902231, -5.850072, 1, -0.5, 0.5, 0.5,
3, -3.902231, -5.850072, 1, 1.5, 0.5, 0.5,
3, -3.902231, -5.850072, 0, 1.5, 0.5, 0.5
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
-3.107614, -3, -5.082018,
-3.107614, 2, -5.082018,
-3.107614, -3, -5.082018,
-3.271052, -3, -5.338036,
-3.107614, -2, -5.082018,
-3.271052, -2, -5.338036,
-3.107614, -1, -5.082018,
-3.271052, -1, -5.338036,
-3.107614, 0, -5.082018,
-3.271052, 0, -5.338036,
-3.107614, 1, -5.082018,
-3.271052, 1, -5.338036,
-3.107614, 2, -5.082018,
-3.271052, 2, -5.338036
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
-3.597927, -3, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, -3, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, -3, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, -3, -5.850072, 0, 1.5, 0.5, 0.5,
-3.597927, -2, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, -2, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, -2, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, -2, -5.850072, 0, 1.5, 0.5, 0.5,
-3.597927, -1, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, -1, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, -1, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, -1, -5.850072, 0, 1.5, 0.5, 0.5,
-3.597927, 0, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, 0, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, 0, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, 0, -5.850072, 0, 1.5, 0.5, 0.5,
-3.597927, 1, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, 1, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, 1, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, 1, -5.850072, 0, 1.5, 0.5, 0.5,
-3.597927, 2, -5.850072, 0, -0.5, 0.5, 0.5,
-3.597927, 2, -5.850072, 1, -0.5, 0.5, 0.5,
-3.597927, 2, -5.850072, 1, 1.5, 0.5, 0.5,
-3.597927, 2, -5.850072, 0, 1.5, 0.5, 0.5
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
-3.107614, -3.437855, -4,
-3.107614, -3.437855, 4,
-3.107614, -3.437855, -4,
-3.271052, -3.592647, -4,
-3.107614, -3.437855, -2,
-3.271052, -3.592647, -2,
-3.107614, -3.437855, 0,
-3.271052, -3.592647, 0,
-3.107614, -3.437855, 2,
-3.271052, -3.592647, 2,
-3.107614, -3.437855, 4,
-3.271052, -3.592647, 4
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
-3.597927, -3.902231, -4, 0, -0.5, 0.5, 0.5,
-3.597927, -3.902231, -4, 1, -0.5, 0.5, 0.5,
-3.597927, -3.902231, -4, 1, 1.5, 0.5, 0.5,
-3.597927, -3.902231, -4, 0, 1.5, 0.5, 0.5,
-3.597927, -3.902231, -2, 0, -0.5, 0.5, 0.5,
-3.597927, -3.902231, -2, 1, -0.5, 0.5, 0.5,
-3.597927, -3.902231, -2, 1, 1.5, 0.5, 0.5,
-3.597927, -3.902231, -2, 0, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 0, 0, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 0, 1, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 0, 1, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 0, 0, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 2, 0, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 2, 1, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 2, 1, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 2, 0, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 4, 0, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 4, 1, -0.5, 0.5, 0.5,
-3.597927, -3.902231, 4, 1, 1.5, 0.5, 0.5,
-3.597927, -3.902231, 4, 0, 1.5, 0.5, 0.5
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
-3.107614, -3.437855, -5.082018,
-3.107614, 2.753821, -5.082018,
-3.107614, -3.437855, 5.158692,
-3.107614, 2.753821, 5.158692,
-3.107614, -3.437855, -5.082018,
-3.107614, -3.437855, 5.158692,
-3.107614, 2.753821, -5.082018,
-3.107614, 2.753821, 5.158692,
-3.107614, -3.437855, -5.082018,
3.429894, -3.437855, -5.082018,
-3.107614, -3.437855, 5.158692,
3.429894, -3.437855, 5.158692,
-3.107614, 2.753821, -5.082018,
3.429894, 2.753821, -5.082018,
-3.107614, 2.753821, 5.158692,
3.429894, 2.753821, 5.158692,
3.429894, -3.437855, -5.082018,
3.429894, 2.753821, -5.082018,
3.429894, -3.437855, 5.158692,
3.429894, 2.753821, 5.158692,
3.429894, -3.437855, -5.082018,
3.429894, -3.437855, 5.158692,
3.429894, 2.753821, -5.082018,
3.429894, 2.753821, 5.158692
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
var radius = 7.281507;
var distance = 32.39624;
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
mvMatrix.translate( -0.16114, 0.3420172, -0.03833699 );
mvMatrix.scale( 1.204267, 1.271531, 0.7687852 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.39624);
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
sesamex<-read.table("sesamex.xyz")
```

```
## Error in read.table("sesamex.xyz"): no lines available in input
```

```r
x<-sesamex$V2
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
y<-sesamex$V3
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
z<-sesamex$V4
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
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
-3.012408, -0.1401462, -1.600367, 0, 0, 1, 1, 1,
-2.950457, -1.016488, -3.122285, 1, 0, 0, 1, 1,
-2.891971, -3.293295, -2.022281, 1, 0, 0, 1, 1,
-2.878286, -1.005018, -2.736338, 1, 0, 0, 1, 1,
-2.518036, -0.6028939, -1.246463, 1, 0, 0, 1, 1,
-2.477601, -0.3185334, -1.686824, 1, 0, 0, 1, 1,
-2.417271, -1.319953, -3.418637, 0, 0, 0, 1, 1,
-2.40516, -0.4101299, -0.3430055, 0, 0, 0, 1, 1,
-2.319953, 0.3320102, -2.06137, 0, 0, 0, 1, 1,
-2.29704, -0.8482627, -2.728124, 0, 0, 0, 1, 1,
-2.234624, -0.1845857, -2.501938, 0, 0, 0, 1, 1,
-2.09266, 1.365661, -0.7031219, 0, 0, 0, 1, 1,
-2.058402, -1.545689, -4.367115, 0, 0, 0, 1, 1,
-2.005944, -1.11803, -2.573545, 1, 1, 1, 1, 1,
-2.005874, -0.4905955, -3.147176, 1, 1, 1, 1, 1,
-1.974562, 0.007035717, -1.367945, 1, 1, 1, 1, 1,
-1.954436, 0.4644493, -2.521205, 1, 1, 1, 1, 1,
-1.952069, -0.2657564, -2.074378, 1, 1, 1, 1, 1,
-1.920465, 0.3991929, -1.046785, 1, 1, 1, 1, 1,
-1.917928, 0.1625157, -1.741639, 1, 1, 1, 1, 1,
-1.914689, -0.5619084, -1.703693, 1, 1, 1, 1, 1,
-1.896851, 0.1861671, -1.899782, 1, 1, 1, 1, 1,
-1.894302, -0.2981923, -3.479181, 1, 1, 1, 1, 1,
-1.878642, -1.13257, -2.020885, 1, 1, 1, 1, 1,
-1.877879, 1.364474, -2.591555, 1, 1, 1, 1, 1,
-1.85752, -0.1573942, -1.326359, 1, 1, 1, 1, 1,
-1.856935, -1.386297, -3.18994, 1, 1, 1, 1, 1,
-1.84489, -1.788597, -2.566869, 1, 1, 1, 1, 1,
-1.830816, 0.07349879, -1.343997, 0, 0, 1, 1, 1,
-1.829177, -0.44688, -0.6827123, 1, 0, 0, 1, 1,
-1.826677, -0.5329278, -0.1718271, 1, 0, 0, 1, 1,
-1.824577, -0.04956076, -1.381822, 1, 0, 0, 1, 1,
-1.815576, 0.7384384, -0.733248, 1, 0, 0, 1, 1,
-1.796965, 0.8253392, -0.6114793, 1, 0, 0, 1, 1,
-1.796895, 0.236989, -1.303077, 0, 0, 0, 1, 1,
-1.796611, -1.993829, -3.796769, 0, 0, 0, 1, 1,
-1.784923, 1.715357, -0.9342281, 0, 0, 0, 1, 1,
-1.774664, 0.5247402, -1.360407, 0, 0, 0, 1, 1,
-1.772586, -0.6183338, -3.006783, 0, 0, 0, 1, 1,
-1.768323, 1.245236, -1.551174, 0, 0, 0, 1, 1,
-1.756089, -0.6298983, -2.059244, 0, 0, 0, 1, 1,
-1.756023, -0.9068085, -1.926884, 1, 1, 1, 1, 1,
-1.73741, 0.6616966, -2.032825, 1, 1, 1, 1, 1,
-1.718291, 0.01793993, -3.185876, 1, 1, 1, 1, 1,
-1.714836, 1.012944, 0.7534359, 1, 1, 1, 1, 1,
-1.712773, -1.830243, -2.815221, 1, 1, 1, 1, 1,
-1.711921, -1.512755, -2.396417, 1, 1, 1, 1, 1,
-1.705418, -0.2356967, -1.912163, 1, 1, 1, 1, 1,
-1.691421, 0.4501207, -1.438254, 1, 1, 1, 1, 1,
-1.679771, -0.4353394, -3.141627, 1, 1, 1, 1, 1,
-1.673729, 0.4048609, -0.8193375, 1, 1, 1, 1, 1,
-1.671316, -0.3890203, -1.489789, 1, 1, 1, 1, 1,
-1.666327, -0.954815, -3.257152, 1, 1, 1, 1, 1,
-1.65301, -0.1519624, -2.918802, 1, 1, 1, 1, 1,
-1.652865, -1.164087, -1.668875, 1, 1, 1, 1, 1,
-1.640619, -1.025748, -1.401297, 1, 1, 1, 1, 1,
-1.626849, -0.3310509, -2.37364, 0, 0, 1, 1, 1,
-1.612745, -0.3881387, -0.3323529, 1, 0, 0, 1, 1,
-1.601153, -0.151841, -1.374267, 1, 0, 0, 1, 1,
-1.586328, -0.174797, -2.404307, 1, 0, 0, 1, 1,
-1.569305, 0.04792232, -0.870189, 1, 0, 0, 1, 1,
-1.547819, -1.24405, -2.145429, 1, 0, 0, 1, 1,
-1.543604, 0.6328034, -0.522008, 0, 0, 0, 1, 1,
-1.540998, 0.2957924, -0.5536721, 0, 0, 0, 1, 1,
-1.54008, 0.2919234, 0.1758589, 0, 0, 0, 1, 1,
-1.537286, -1.125634, -2.911998, 0, 0, 0, 1, 1,
-1.526493, 0.5101328, -0.9252387, 0, 0, 0, 1, 1,
-1.517377, -1.591725, -0.5850636, 0, 0, 0, 1, 1,
-1.516726, -0.3032252, -1.415076, 0, 0, 0, 1, 1,
-1.510096, 0.2798469, -1.228007, 1, 1, 1, 1, 1,
-1.509354, 0.02919603, -2.00999, 1, 1, 1, 1, 1,
-1.496675, -1.15518, -0.2863867, 1, 1, 1, 1, 1,
-1.488827, -0.0565345, -1.333515, 1, 1, 1, 1, 1,
-1.488315, -0.6328999, -2.094891, 1, 1, 1, 1, 1,
-1.468077, -1.778167, -0.8420665, 1, 1, 1, 1, 1,
-1.467478, 2.024964, -1.01317, 1, 1, 1, 1, 1,
-1.467417, -0.9676377, -1.691842, 1, 1, 1, 1, 1,
-1.446451, 0.05872773, -3.592956, 1, 1, 1, 1, 1,
-1.441468, 1.035172, -0.4479291, 1, 1, 1, 1, 1,
-1.430882, 1.75023, -1.533441, 1, 1, 1, 1, 1,
-1.429638, 0.6710086, -1.650036, 1, 1, 1, 1, 1,
-1.425668, -0.8006477, -2.741309, 1, 1, 1, 1, 1,
-1.423068, 0.4015198, 0.07415155, 1, 1, 1, 1, 1,
-1.420929, 0.2531992, -2.611911, 1, 1, 1, 1, 1,
-1.411094, -1.147303, -2.01614, 0, 0, 1, 1, 1,
-1.402152, -0.3749972, -1.028936, 1, 0, 0, 1, 1,
-1.389422, 1.320439, -0.7761648, 1, 0, 0, 1, 1,
-1.384865, -1.496078, -1.528655, 1, 0, 0, 1, 1,
-1.377158, 1.04248, -0.7644256, 1, 0, 0, 1, 1,
-1.374853, 1.648068, -0.4084136, 1, 0, 0, 1, 1,
-1.370072, 1.675922, -0.3010977, 0, 0, 0, 1, 1,
-1.36008, -0.1688481, -2.850663, 0, 0, 0, 1, 1,
-1.357057, -0.2404732, -0.994124, 0, 0, 0, 1, 1,
-1.356544, 1.24496, -1.774459, 0, 0, 0, 1, 1,
-1.345307, -1.677566, -2.046592, 0, 0, 0, 1, 1,
-1.341797, 1.070753, -0.647298, 0, 0, 0, 1, 1,
-1.332847, 1.901109, -1.244051, 0, 0, 0, 1, 1,
-1.328768, 0.3017249, -1.32688, 1, 1, 1, 1, 1,
-1.324296, -0.8311394, -2.693302, 1, 1, 1, 1, 1,
-1.316275, -0.04882532, -0.9851561, 1, 1, 1, 1, 1,
-1.314566, -0.2370466, -2.708868, 1, 1, 1, 1, 1,
-1.301398, 0.4776768, -2.244513, 1, 1, 1, 1, 1,
-1.289771, 0.6784243, -1.587277, 1, 1, 1, 1, 1,
-1.286774, 0.6010957, -0.5057873, 1, 1, 1, 1, 1,
-1.271401, 0.3128277, 0.4744707, 1, 1, 1, 1, 1,
-1.269179, 0.05200209, -2.959373, 1, 1, 1, 1, 1,
-1.267291, -1.402263, -3.586255, 1, 1, 1, 1, 1,
-1.265994, -0.4480984, -1.583427, 1, 1, 1, 1, 1,
-1.262461, 0.3327664, -2.103211, 1, 1, 1, 1, 1,
-1.257447, -0.3990768, 0.08354935, 1, 1, 1, 1, 1,
-1.252414, 0.156937, 0.1258919, 1, 1, 1, 1, 1,
-1.252199, -1.257316, -2.848874, 1, 1, 1, 1, 1,
-1.234358, 0.367848, -2.009169, 0, 0, 1, 1, 1,
-1.226467, -0.8961853, -0.805606, 1, 0, 0, 1, 1,
-1.215394, 0.5049697, 0.9425159, 1, 0, 0, 1, 1,
-1.210597, 2.663651, -1.086083, 1, 0, 0, 1, 1,
-1.210031, -0.1070723, -0.7708415, 1, 0, 0, 1, 1,
-1.2025, 1.296532, -1.821495, 1, 0, 0, 1, 1,
-1.191407, 1.07553, -1.444206, 0, 0, 0, 1, 1,
-1.188974, 0.9858569, 0.7268233, 0, 0, 0, 1, 1,
-1.18724, -0.05561993, -2.32045, 0, 0, 0, 1, 1,
-1.183033, -0.2668158, -1.002369, 0, 0, 0, 1, 1,
-1.182492, 0.9524683, -1.649376, 0, 0, 0, 1, 1,
-1.182132, 0.4770505, -2.166138, 0, 0, 0, 1, 1,
-1.181376, -0.4657132, -2.268989, 0, 0, 0, 1, 1,
-1.177684, -0.07966506, -2.756136, 1, 1, 1, 1, 1,
-1.167596, 0.4945441, -1.727382, 1, 1, 1, 1, 1,
-1.166544, 1.510515, 0.4871366, 1, 1, 1, 1, 1,
-1.160149, 0.07685389, -1.116775, 1, 1, 1, 1, 1,
-1.156271, -1.476875, -3.439602, 1, 1, 1, 1, 1,
-1.155127, -0.4873823, -2.153864, 1, 1, 1, 1, 1,
-1.150344, -0.3586897, -3.119612, 1, 1, 1, 1, 1,
-1.148064, -0.1020664, -1.943112, 1, 1, 1, 1, 1,
-1.142262, -1.20045, -4.394656, 1, 1, 1, 1, 1,
-1.138435, -0.207117, -2.933592, 1, 1, 1, 1, 1,
-1.125008, 1.293875, -1.657027, 1, 1, 1, 1, 1,
-1.122669, -2.062086, -1.741531, 1, 1, 1, 1, 1,
-1.12045, 0.5696244, -0.5190536, 1, 1, 1, 1, 1,
-1.116978, -0.5015927, -1.946283, 1, 1, 1, 1, 1,
-1.116597, -0.3354462, -1.303741, 1, 1, 1, 1, 1,
-1.110081, 0.08512863, -0.6188586, 0, 0, 1, 1, 1,
-1.105988, 0.4993074, -1.226894, 1, 0, 0, 1, 1,
-1.104023, 2.227656, 0.8055069, 1, 0, 0, 1, 1,
-1.099618, -0.6701221, -3.002405, 1, 0, 0, 1, 1,
-1.093336, -0.2175697, -0.530485, 1, 0, 0, 1, 1,
-1.091537, 0.2752129, 0.03850365, 1, 0, 0, 1, 1,
-1.087624, -0.5027102, -1.752881, 0, 0, 0, 1, 1,
-1.085756, 1.270266, -0.433589, 0, 0, 0, 1, 1,
-1.084444, -0.4934013, -2.651168, 0, 0, 0, 1, 1,
-1.083182, 1.141263, 0.5454264, 0, 0, 0, 1, 1,
-1.064935, 0.4120419, -2.778193, 0, 0, 0, 1, 1,
-1.06417, 1.039184, -0.5442182, 0, 0, 0, 1, 1,
-1.057798, 0.8081704, -2.896699, 0, 0, 0, 1, 1,
-1.0556, 0.4635762, -0.9140745, 1, 1, 1, 1, 1,
-1.045146, 1.573703, 0.3516594, 1, 1, 1, 1, 1,
-1.039978, 0.569168, 0.8685444, 1, 1, 1, 1, 1,
-1.033176, -0.1331318, -1.273306, 1, 1, 1, 1, 1,
-1.019487, 0.07931146, -1.018387, 1, 1, 1, 1, 1,
-1.015296, -0.3166897, -1.266425, 1, 1, 1, 1, 1,
-1.013905, 0.6231902, -2.247763, 1, 1, 1, 1, 1,
-1.012578, 0.03411269, 0.4045026, 1, 1, 1, 1, 1,
-1.003255, 1.292948, -2.751084, 1, 1, 1, 1, 1,
-1.000819, 1.058216, 0.415308, 1, 1, 1, 1, 1,
-0.9951173, -0.1813072, -1.950835, 1, 1, 1, 1, 1,
-0.9938936, 2.506492, -1.822292, 1, 1, 1, 1, 1,
-0.9845404, 1.451053, -2.032048, 1, 1, 1, 1, 1,
-0.9825486, -0.7288352, -2.575842, 1, 1, 1, 1, 1,
-0.9789886, -1.204016, -3.662674, 1, 1, 1, 1, 1,
-0.9717227, -1.414555, -3.439829, 0, 0, 1, 1, 1,
-0.9712387, -0.7319943, -2.181597, 1, 0, 0, 1, 1,
-0.9669382, -0.8438637, -2.234494, 1, 0, 0, 1, 1,
-0.961374, 0.04861714, -2.333621, 1, 0, 0, 1, 1,
-0.9322501, 0.02324194, -1.51358, 1, 0, 0, 1, 1,
-0.9194822, -0.2446312, -1.407656, 1, 0, 0, 1, 1,
-0.9193128, -0.1698492, -0.8103795, 0, 0, 0, 1, 1,
-0.9099129, -0.05425492, -1.110779, 0, 0, 0, 1, 1,
-0.9095566, -0.2912478, -2.987894, 0, 0, 0, 1, 1,
-0.906472, 0.3413056, -2.428683, 0, 0, 0, 1, 1,
-0.8953724, 1.434636, -1.765269, 0, 0, 0, 1, 1,
-0.8933187, 0.9889054, -0.6308052, 0, 0, 0, 1, 1,
-0.8922393, 0.8832946, -0.676984, 0, 0, 0, 1, 1,
-0.88951, -0.9411229, -1.754894, 1, 1, 1, 1, 1,
-0.8827159, 1.330584, -0.497456, 1, 1, 1, 1, 1,
-0.8803943, -1.081533, -2.769251, 1, 1, 1, 1, 1,
-0.8803694, -0.2996789, -0.2377402, 1, 1, 1, 1, 1,
-0.8748876, -0.1591098, -0.4579999, 1, 1, 1, 1, 1,
-0.8745013, -1.025282, -3.14163, 1, 1, 1, 1, 1,
-0.8692209, 0.4380959, -2.350236, 1, 1, 1, 1, 1,
-0.8671617, 0.0006645467, -1.326989, 1, 1, 1, 1, 1,
-0.8638494, -0.5480137, -3.391744, 1, 1, 1, 1, 1,
-0.8575746, 0.1451193, -2.32392, 1, 1, 1, 1, 1,
-0.8575231, -1.582823, -1.337479, 1, 1, 1, 1, 1,
-0.8534123, 0.6833743, -0.5736011, 1, 1, 1, 1, 1,
-0.850251, 0.001151196, -1.714707, 1, 1, 1, 1, 1,
-0.8486302, 0.5607494, -0.659826, 1, 1, 1, 1, 1,
-0.8466758, -0.6441529, -1.350263, 1, 1, 1, 1, 1,
-0.8393884, 1.022353, -1.859538, 0, 0, 1, 1, 1,
-0.8290398, -1.46325, -3.631761, 1, 0, 0, 1, 1,
-0.8272939, -0.071005, -0.1979496, 1, 0, 0, 1, 1,
-0.8200124, -1.544226, -2.666015, 1, 0, 0, 1, 1,
-0.8187391, -0.1698751, -1.89711, 1, 0, 0, 1, 1,
-0.8094196, 0.8326564, 0.06037069, 1, 0, 0, 1, 1,
-0.7932307, -0.775942, -3.205572, 0, 0, 0, 1, 1,
-0.7925369, -0.6119664, -2.026169, 0, 0, 0, 1, 1,
-0.7917309, -1.161847, -2.009636, 0, 0, 0, 1, 1,
-0.7824191, -0.7008, -2.757133, 0, 0, 0, 1, 1,
-0.7756369, 0.8691937, -0.8156559, 0, 0, 0, 1, 1,
-0.7754611, -0.02956633, 0.5966455, 0, 0, 0, 1, 1,
-0.7746261, 1.077293, -0.1282142, 0, 0, 0, 1, 1,
-0.7723777, 0.1314664, -2.403939, 1, 1, 1, 1, 1,
-0.772119, -0.3650185, -1.346674, 1, 1, 1, 1, 1,
-0.7650866, -0.4079499, -2.375471, 1, 1, 1, 1, 1,
-0.7645231, 0.1050212, -2.953434, 1, 1, 1, 1, 1,
-0.7585744, -0.1505916, -1.27032, 1, 1, 1, 1, 1,
-0.7585639, -1.308024, -4.654366, 1, 1, 1, 1, 1,
-0.7584493, -0.8390679, -3.471008, 1, 1, 1, 1, 1,
-0.7579781, 0.2995894, -2.384367, 1, 1, 1, 1, 1,
-0.7549554, 0.5551914, -1.620011, 1, 1, 1, 1, 1,
-0.7538494, 1.084151, -0.02874983, 1, 1, 1, 1, 1,
-0.7527255, 0.1614399, -1.907623, 1, 1, 1, 1, 1,
-0.7523824, 0.9372451, -0.5569422, 1, 1, 1, 1, 1,
-0.7522157, 1.317651, -1.883683, 1, 1, 1, 1, 1,
-0.7514799, -0.1215553, -2.283214, 1, 1, 1, 1, 1,
-0.7483395, 1.012975, -1.419507, 1, 1, 1, 1, 1,
-0.7458591, -1.058075, -2.80458, 0, 0, 1, 1, 1,
-0.7447906, 0.5464403, -1.555399, 1, 0, 0, 1, 1,
-0.7446453, -0.3599221, -2.984911, 1, 0, 0, 1, 1,
-0.7341548, 0.6262062, -1.54118, 1, 0, 0, 1, 1,
-0.7313885, -0.02659925, -4.2421, 1, 0, 0, 1, 1,
-0.7297743, -0.802159, -1.450434, 1, 0, 0, 1, 1,
-0.7292349, 1.203129, -2.144058, 0, 0, 0, 1, 1,
-0.7256781, 1.700511, -1.925894, 0, 0, 0, 1, 1,
-0.7189955, -0.5148626, -1.895177, 0, 0, 0, 1, 1,
-0.7150095, -0.8713083, -3.273773, 0, 0, 0, 1, 1,
-0.7114666, 1.523735, 0.1905416, 0, 0, 0, 1, 1,
-0.6973321, -0.07217696, -2.204545, 0, 0, 0, 1, 1,
-0.6953882, -1.222366, -1.154439, 0, 0, 0, 1, 1,
-0.6942756, -0.9592233, -3.175228, 1, 1, 1, 1, 1,
-0.6942481, 1.609927, 0.00364675, 1, 1, 1, 1, 1,
-0.693063, 1.148366, -1.823752, 1, 1, 1, 1, 1,
-0.6878641, -0.3469657, -2.442711, 1, 1, 1, 1, 1,
-0.6837185, 0.1733588, -0.291513, 1, 1, 1, 1, 1,
-0.6834577, -0.6126564, -1.006134, 1, 1, 1, 1, 1,
-0.6764656, 0.6091954, -1.711575, 1, 1, 1, 1, 1,
-0.6725668, 0.3282134, -1.84805, 1, 1, 1, 1, 1,
-0.6704224, -0.8813689, -2.862646, 1, 1, 1, 1, 1,
-0.6656558, 1.154455, 0.402934, 1, 1, 1, 1, 1,
-0.6451926, 0.439419, -1.324362, 1, 1, 1, 1, 1,
-0.639688, 1.204047, -0.2129991, 1, 1, 1, 1, 1,
-0.6391826, 0.2367047, -2.328584, 1, 1, 1, 1, 1,
-0.6383898, 0.1109786, -0.2204255, 1, 1, 1, 1, 1,
-0.6342716, -2.795309, -2.31435, 1, 1, 1, 1, 1,
-0.633041, -2.544415, -4.63618, 0, 0, 1, 1, 1,
-0.6285328, 1.884806, -0.3327533, 1, 0, 0, 1, 1,
-0.6218128, -0.04069403, -1.831958, 1, 0, 0, 1, 1,
-0.6208228, -0.370432, -1.860334, 1, 0, 0, 1, 1,
-0.6188214, 1.00795, -1.189573, 1, 0, 0, 1, 1,
-0.617866, -0.2166757, -2.657395, 1, 0, 0, 1, 1,
-0.6132777, 0.4395117, -1.2133, 0, 0, 0, 1, 1,
-0.610929, 0.6323372, -0.2158937, 0, 0, 0, 1, 1,
-0.6093514, -0.7175566, -1.481541, 0, 0, 0, 1, 1,
-0.6083503, -0.5542341, -1.316647, 0, 0, 0, 1, 1,
-0.6071267, 1.13768, -0.8391898, 0, 0, 0, 1, 1,
-0.6054596, 1.792868, -1.067088, 0, 0, 0, 1, 1,
-0.6032534, -0.30037, -3.304259, 0, 0, 0, 1, 1,
-0.603226, -0.01155229, -1.544699, 1, 1, 1, 1, 1,
-0.6007029, -0.134472, -1.987933, 1, 1, 1, 1, 1,
-0.5955111, 0.3826532, -0.7660249, 1, 1, 1, 1, 1,
-0.5924658, 1.19283, 0.644068, 1, 1, 1, 1, 1,
-0.5923105, -1.390728, -1.493834, 1, 1, 1, 1, 1,
-0.5883597, -0.2473881, -2.109534, 1, 1, 1, 1, 1,
-0.5817617, 0.2130107, -1.039675, 1, 1, 1, 1, 1,
-0.5774472, 0.1759244, -1.389094, 1, 1, 1, 1, 1,
-0.5769305, -1.201019, -0.6709065, 1, 1, 1, 1, 1,
-0.5715846, 1.830947, -0.4996499, 1, 1, 1, 1, 1,
-0.5708936, -1.232734, -2.567937, 1, 1, 1, 1, 1,
-0.5631632, 0.405738, 0.01750756, 1, 1, 1, 1, 1,
-0.5581838, 0.6658386, -0.1148501, 1, 1, 1, 1, 1,
-0.5556508, 1.720359, -0.5337489, 1, 1, 1, 1, 1,
-0.5540569, -1.469865, -2.5494, 1, 1, 1, 1, 1,
-0.5493272, -2.035722, -2.118027, 0, 0, 1, 1, 1,
-0.5459535, 1.137414, 0.3488349, 1, 0, 0, 1, 1,
-0.5409408, 0.3880111, -0.477959, 1, 0, 0, 1, 1,
-0.5391319, -1.765776, -2.932489, 1, 0, 0, 1, 1,
-0.5364108, -0.3626854, -2.080979, 1, 0, 0, 1, 1,
-0.5318702, -0.1375011, -2.918852, 1, 0, 0, 1, 1,
-0.5309352, -0.7394938, -3.192996, 0, 0, 0, 1, 1,
-0.5281228, 0.8836501, 0.9644654, 0, 0, 0, 1, 1,
-0.5254201, -0.6535717, -0.8812863, 0, 0, 0, 1, 1,
-0.5237073, -0.1636244, -3.587219, 0, 0, 0, 1, 1,
-0.5124547, 2.032515, 1.545062, 0, 0, 0, 1, 1,
-0.5102521, 0.2054066, -0.517961, 0, 0, 0, 1, 1,
-0.5087732, -1.172135, -3.779957, 0, 0, 0, 1, 1,
-0.5028045, -0.3824455, -2.259988, 1, 1, 1, 1, 1,
-0.5021374, 0.6949193, 0.9631134, 1, 1, 1, 1, 1,
-0.499465, -1.46237, -4.68094, 1, 1, 1, 1, 1,
-0.4985258, -0.5767288, -3.764091, 1, 1, 1, 1, 1,
-0.4963301, 0.8513364, -0.6293977, 1, 1, 1, 1, 1,
-0.4955251, -0.4319471, -2.069392, 1, 1, 1, 1, 1,
-0.4949793, 0.7654572, 0.9223942, 1, 1, 1, 1, 1,
-0.4898634, -0.2107571, -2.555763, 1, 1, 1, 1, 1,
-0.4895788, 0.2487575, -1.201865, 1, 1, 1, 1, 1,
-0.487032, 0.3761859, -3.253628, 1, 1, 1, 1, 1,
-0.4821143, -0.2035773, -2.700263, 1, 1, 1, 1, 1,
-0.4807267, -0.8416142, -0.6825082, 1, 1, 1, 1, 1,
-0.4781621, 2.007882, -0.8245278, 1, 1, 1, 1, 1,
-0.470984, 0.5047803, 1.092817, 1, 1, 1, 1, 1,
-0.4685489, 1.176509, 0.1948895, 1, 1, 1, 1, 1,
-0.4673344, 0.5480918, -0.8594612, 0, 0, 1, 1, 1,
-0.4636079, 0.3502613, -1.89882, 1, 0, 0, 1, 1,
-0.4633452, -0.3381058, -1.898733, 1, 0, 0, 1, 1,
-0.4585676, -0.324883, -2.856008, 1, 0, 0, 1, 1,
-0.4581393, -0.2499626, -0.5900772, 1, 0, 0, 1, 1,
-0.4549893, 1.434932, -0.9652182, 1, 0, 0, 1, 1,
-0.452641, 0.6619685, -0.389985, 0, 0, 0, 1, 1,
-0.4475687, 0.5904222, 0.6031551, 0, 0, 0, 1, 1,
-0.4421342, -0.3965153, -2.71383, 0, 0, 0, 1, 1,
-0.4346955, -0.5964693, -1.580702, 0, 0, 0, 1, 1,
-0.4307901, 0.555774, -1.133122, 0, 0, 0, 1, 1,
-0.428493, -1.305518, -3.266472, 0, 0, 0, 1, 1,
-0.4278839, 1.153334, -1.595451, 0, 0, 0, 1, 1,
-0.4248115, -0.921284, -2.558776, 1, 1, 1, 1, 1,
-0.4233849, 0.6959148, 1.966759, 1, 1, 1, 1, 1,
-0.4182104, -0.2106451, -2.539635, 1, 1, 1, 1, 1,
-0.4135715, 0.8008322, 0.619535, 1, 1, 1, 1, 1,
-0.413265, 0.7290418, -2.203464, 1, 1, 1, 1, 1,
-0.4089077, 0.7058414, -1.236944, 1, 1, 1, 1, 1,
-0.4088034, -0.7357037, -1.424942, 1, 1, 1, 1, 1,
-0.4076616, 0.3653248, -0.5536279, 1, 1, 1, 1, 1,
-0.4070804, -0.6002324, -2.626301, 1, 1, 1, 1, 1,
-0.4067843, 0.5530008, -1.362391, 1, 1, 1, 1, 1,
-0.4064056, 0.2769215, -0.6119541, 1, 1, 1, 1, 1,
-0.4056745, -0.8257163, -1.760762, 1, 1, 1, 1, 1,
-0.4053272, -0.3736959, -2.04811, 1, 1, 1, 1, 1,
-0.4050739, -0.8792669, -3.16055, 1, 1, 1, 1, 1,
-0.4006152, 0.3119503, -0.1214096, 1, 1, 1, 1, 1,
-0.3967632, -0.09423649, -2.434846, 0, 0, 1, 1, 1,
-0.3952369, 0.5465285, -0.3868591, 1, 0, 0, 1, 1,
-0.394096, 2.53363, -0.94116, 1, 0, 0, 1, 1,
-0.3902602, 0.3660676, -0.7064492, 1, 0, 0, 1, 1,
-0.3892184, -1.412573, -2.684071, 1, 0, 0, 1, 1,
-0.3878536, 0.6517743, 0.2666743, 1, 0, 0, 1, 1,
-0.3808831, -2.563356, -4.085357, 0, 0, 0, 1, 1,
-0.3795391, -0.8417653, -1.704738, 0, 0, 0, 1, 1,
-0.3773907, 0.7487126, -1.076559, 0, 0, 0, 1, 1,
-0.3745064, -0.3928671, 0.13753, 0, 0, 0, 1, 1,
-0.3712651, 0.09701438, -0.9982095, 0, 0, 0, 1, 1,
-0.3703052, -1.453727, -3.124793, 0, 0, 0, 1, 1,
-0.3692887, -0.3392122, -0.4125781, 0, 0, 0, 1, 1,
-0.3683248, 1.53809, 0.07067987, 1, 1, 1, 1, 1,
-0.3670793, -1.572694, -3.414089, 1, 1, 1, 1, 1,
-0.3668901, -2.028688, -3.404409, 1, 1, 1, 1, 1,
-0.3666383, 0.3791324, -1.891129, 1, 1, 1, 1, 1,
-0.3653291, 1.369484, -1.498015, 1, 1, 1, 1, 1,
-0.364371, 1.606131, -1.485546, 1, 1, 1, 1, 1,
-0.3595788, -1.083283, -3.058902, 1, 1, 1, 1, 1,
-0.3578519, 0.1033074, -3.101909, 1, 1, 1, 1, 1,
-0.3570184, -1.059715, -3.392108, 1, 1, 1, 1, 1,
-0.3466672, -1.978775, -4.40236, 1, 1, 1, 1, 1,
-0.3444727, 1.089086, -0.6224634, 1, 1, 1, 1, 1,
-0.3390544, -0.3391648, -4.932882, 1, 1, 1, 1, 1,
-0.3385783, -0.1786827, -2.201151, 1, 1, 1, 1, 1,
-0.3336726, -0.8853194, 0.1390466, 1, 1, 1, 1, 1,
-0.3309516, -1.004144, -1.692178, 1, 1, 1, 1, 1,
-0.3295557, -0.8264607, -2.005651, 0, 0, 1, 1, 1,
-0.3268017, -0.6140693, -0.4346244, 1, 0, 0, 1, 1,
-0.3264858, 1.78918, -0.5800816, 1, 0, 0, 1, 1,
-0.32147, 0.5481008, -2.176202, 1, 0, 0, 1, 1,
-0.3187403, 0.2931413, -0.8977026, 1, 0, 0, 1, 1,
-0.3138357, 1.07269, -1.517155, 1, 0, 0, 1, 1,
-0.3105457, -0.03080005, -1.702448, 0, 0, 0, 1, 1,
-0.3073253, 0.597454, 0.6297482, 0, 0, 0, 1, 1,
-0.3044614, -0.8593935, -2.380316, 0, 0, 0, 1, 1,
-0.3032824, 0.4709717, 0.1395182, 0, 0, 0, 1, 1,
-0.3026766, -1.864587, -0.3049431, 0, 0, 0, 1, 1,
-0.2976483, 0.7603127, -2.252146, 0, 0, 0, 1, 1,
-0.297096, 0.1497238, 0.243378, 0, 0, 0, 1, 1,
-0.2962824, -0.4444786, -4.103868, 1, 1, 1, 1, 1,
-0.296101, 1.010554, 0.8575056, 1, 1, 1, 1, 1,
-0.2949967, -2.151591, -3.503248, 1, 1, 1, 1, 1,
-0.2940481, -0.5776452, -1.201389, 1, 1, 1, 1, 1,
-0.293291, -0.6025947, -3.52313, 1, 1, 1, 1, 1,
-0.2910594, -0.09286332, -2.074984, 1, 1, 1, 1, 1,
-0.2875582, 0.2712053, 0.2215464, 1, 1, 1, 1, 1,
-0.2873632, -2.225534, -1.954452, 1, 1, 1, 1, 1,
-0.2861052, 0.03524233, -2.234228, 1, 1, 1, 1, 1,
-0.2850441, 1.275805, -0.9509817, 1, 1, 1, 1, 1,
-0.2848126, 0.06573364, -0.7709513, 1, 1, 1, 1, 1,
-0.2839921, 0.4041439, -0.2214576, 1, 1, 1, 1, 1,
-0.2810566, -0.3836056, -3.496071, 1, 1, 1, 1, 1,
-0.2793708, 0.08302487, -0.3092288, 1, 1, 1, 1, 1,
-0.2787489, -0.3510708, -3.247117, 1, 1, 1, 1, 1,
-0.277928, 0.1496478, -1.469574, 0, 0, 1, 1, 1,
-0.2772172, -0.505091, -1.814664, 1, 0, 0, 1, 1,
-0.2723965, 1.133468, 0.8368973, 1, 0, 0, 1, 1,
-0.2722697, 1.084101, -0.3048076, 1, 0, 0, 1, 1,
-0.2690243, 0.1204079, -0.8661262, 1, 0, 0, 1, 1,
-0.262185, 0.5855095, -1.523088, 1, 0, 0, 1, 1,
-0.2613949, 0.4309386, -0.5540289, 0, 0, 0, 1, 1,
-0.2591352, 1.6817, -1.637975, 0, 0, 0, 1, 1,
-0.2579096, 0.8153123, -0.6779195, 0, 0, 0, 1, 1,
-0.2516271, 0.5101907, -1.23325, 0, 0, 0, 1, 1,
-0.250173, -0.8269502, -2.668694, 0, 0, 0, 1, 1,
-0.2492296, 0.6560206, -0.07408375, 0, 0, 0, 1, 1,
-0.2478436, -0.3756079, -2.442759, 0, 0, 0, 1, 1,
-0.24274, -1.098798, -2.918237, 1, 1, 1, 1, 1,
-0.2396569, -0.02712613, -2.237338, 1, 1, 1, 1, 1,
-0.2380792, -1.265011, -2.086191, 1, 1, 1, 1, 1,
-0.2369715, -0.1185327, -0.2299532, 1, 1, 1, 1, 1,
-0.234587, 0.3730443, 0.03567224, 1, 1, 1, 1, 1,
-0.2341808, 0.6649107, 0.1425758, 1, 1, 1, 1, 1,
-0.233198, -1.05835, -4.429801, 1, 1, 1, 1, 1,
-0.2330145, 0.9511904, 0.5625029, 1, 1, 1, 1, 1,
-0.2208402, -0.5678704, -4.758395, 1, 1, 1, 1, 1,
-0.2146983, 0.6543964, -1.137056, 1, 1, 1, 1, 1,
-0.2144686, -0.929507, -1.561241, 1, 1, 1, 1, 1,
-0.2094262, -0.1950406, -3.19819, 1, 1, 1, 1, 1,
-0.2074605, -0.07557273, -1.752435, 1, 1, 1, 1, 1,
-0.2070502, -0.3861972, -3.109328, 1, 1, 1, 1, 1,
-0.2069926, 0.6236385, 0.7368228, 1, 1, 1, 1, 1,
-0.2055234, 1.715467, 0.8249838, 0, 0, 1, 1, 1,
-0.2042297, 2.012033, -0.07795886, 1, 0, 0, 1, 1,
-0.2030053, 0.1211758, -0.2927468, 1, 0, 0, 1, 1,
-0.2004764, 0.7402108, -0.3665421, 1, 0, 0, 1, 1,
-0.191728, 1.247529, 1.405997, 1, 0, 0, 1, 1,
-0.1899809, -0.8401244, -3.919899, 1, 0, 0, 1, 1,
-0.1896913, -0.2317789, -2.324729, 0, 0, 0, 1, 1,
-0.1852812, -1.043355, -3.467754, 0, 0, 0, 1, 1,
-0.1805914, 0.3622901, 1.266134, 0, 0, 0, 1, 1,
-0.1771298, 1.354618, 0.9352855, 0, 0, 0, 1, 1,
-0.176049, -2.616893, -4.221416, 0, 0, 0, 1, 1,
-0.1726394, -0.5351977, -4.138747, 0, 0, 0, 1, 1,
-0.1722407, -0.3974737, -3.559802, 0, 0, 0, 1, 1,
-0.1715132, -0.0284955, -1.899028, 1, 1, 1, 1, 1,
-0.1700482, -1.087049, -3.215958, 1, 1, 1, 1, 1,
-0.1602769, 0.503459, 0.9724606, 1, 1, 1, 1, 1,
-0.1589008, 1.412389, -0.6591182, 1, 1, 1, 1, 1,
-0.1583812, -0.9297042, -3.929739, 1, 1, 1, 1, 1,
-0.1568257, 0.4436011, 0.1318132, 1, 1, 1, 1, 1,
-0.1519668, 0.8829688, -0.3426945, 1, 1, 1, 1, 1,
-0.1507902, -0.7786181, -4.360732, 1, 1, 1, 1, 1,
-0.1497264, 1.473068, -0.7121192, 1, 1, 1, 1, 1,
-0.1488366, 0.2375829, -1.068654, 1, 1, 1, 1, 1,
-0.1427287, -0.0397004, -3.38688, 1, 1, 1, 1, 1,
-0.142492, 0.3967468, -1.416237, 1, 1, 1, 1, 1,
-0.1382561, 2.052326, -1.360582, 1, 1, 1, 1, 1,
-0.1371055, -1.61785, -1.998323, 1, 1, 1, 1, 1,
-0.1335416, -0.3926704, -3.87634, 1, 1, 1, 1, 1,
-0.1333202, 0.01642952, -1.40627, 0, 0, 1, 1, 1,
-0.131985, -0.2865938, -4.340891, 1, 0, 0, 1, 1,
-0.1306967, 0.4921083, -0.8424026, 1, 0, 0, 1, 1,
-0.12897, 0.04862467, -1.254251, 1, 0, 0, 1, 1,
-0.1230851, -0.7687699, -3.157001, 1, 0, 0, 1, 1,
-0.122867, 1.215521, -0.1142072, 1, 0, 0, 1, 1,
-0.1207706, -0.9099127, -2.356291, 0, 0, 0, 1, 1,
-0.1195913, 1.32418, 1.60118, 0, 0, 0, 1, 1,
-0.1169402, 0.5361428, -1.506804, 0, 0, 0, 1, 1,
-0.1078322, -1.179378, -1.730027, 0, 0, 0, 1, 1,
-0.1053622, 0.06333619, -0.2490146, 0, 0, 0, 1, 1,
-0.1050127, 0.2212268, 0.2199937, 0, 0, 0, 1, 1,
-0.1030844, 1.171916, -0.0940171, 0, 0, 0, 1, 1,
-0.1006586, -0.5379743, -2.925978, 1, 1, 1, 1, 1,
-0.09891797, -0.4045344, -2.721174, 1, 1, 1, 1, 1,
-0.09632227, 1.851638, -0.6616477, 1, 1, 1, 1, 1,
-0.09298792, -0.04478639, -3.156225, 1, 1, 1, 1, 1,
-0.08975165, 2.038411, 0.5731226, 1, 1, 1, 1, 1,
-0.08953752, -0.7520041, -3.663025, 1, 1, 1, 1, 1,
-0.08893944, -1.431527, -3.303145, 1, 1, 1, 1, 1,
-0.08830219, -0.8264763, -2.811731, 1, 1, 1, 1, 1,
-0.08703076, -0.7762035, -3.368288, 1, 1, 1, 1, 1,
-0.08626541, -0.09062319, -1.479053, 1, 1, 1, 1, 1,
-0.08540317, 0.2491796, -0.1102297, 1, 1, 1, 1, 1,
-0.08406471, -0.2996367, -1.503691, 1, 1, 1, 1, 1,
-0.08290391, -0.2798513, -2.786058, 1, 1, 1, 1, 1,
-0.07932273, -0.6664462, -3.881628, 1, 1, 1, 1, 1,
-0.07824999, -1.622524, -3.612105, 1, 1, 1, 1, 1,
-0.07822832, 0.7397094, -0.7455946, 0, 0, 1, 1, 1,
-0.07142912, -0.2577658, -1.150174, 1, 0, 0, 1, 1,
-0.06944672, 0.8351317, -0.1508675, 1, 0, 0, 1, 1,
-0.06269046, -0.621938, -2.73401, 1, 0, 0, 1, 1,
-0.06158886, 1.144687, -1.456234, 1, 0, 0, 1, 1,
-0.05420669, -1.183929, -3.378071, 1, 0, 0, 1, 1,
-0.0529066, -2.500055, -2.416764, 0, 0, 0, 1, 1,
-0.05188753, -1.27098, -1.543286, 0, 0, 0, 1, 1,
-0.04827826, -0.2994699, -4.532334, 0, 0, 0, 1, 1,
-0.047891, 0.7158003, -1.453763, 0, 0, 0, 1, 1,
-0.04694753, 0.3447314, 1.282056, 0, 0, 0, 1, 1,
-0.0467697, -0.357332, -4.097225, 0, 0, 0, 1, 1,
-0.04532846, -0.4463794, -3.247274, 0, 0, 0, 1, 1,
-0.04500355, -1.288221, -3.551387, 1, 1, 1, 1, 1,
-0.03900483, 0.5809312, 0.98013, 1, 1, 1, 1, 1,
-0.03619102, 1.555002, -0.05388834, 1, 1, 1, 1, 1,
-0.03178339, 0.6482115, -0.9931402, 1, 1, 1, 1, 1,
-0.03167739, -0.3190557, -4.033268, 1, 1, 1, 1, 1,
-0.02970408, 1.725885, 0.576947, 1, 1, 1, 1, 1,
-0.02945701, -2.218643, -3.720446, 1, 1, 1, 1, 1,
-0.01968199, 1.129559, 0.161006, 1, 1, 1, 1, 1,
-0.01947724, 1.165037, 0.8296707, 1, 1, 1, 1, 1,
-0.01886455, 0.7641681, 1.037453, 1, 1, 1, 1, 1,
-0.01765849, -0.2238105, -2.411233, 1, 1, 1, 1, 1,
-0.01758306, 0.01024664, -1.242062, 1, 1, 1, 1, 1,
-0.01754356, 1.146704, 0.1338736, 1, 1, 1, 1, 1,
-0.01545841, -0.1773799, -1.767916, 1, 1, 1, 1, 1,
-0.00646882, -2.027364, -2.666076, 1, 1, 1, 1, 1,
-0.001608823, 0.5739481, 0.1053368, 0, 0, 1, 1, 1,
-0.0003297795, 0.1723564, -0.383585, 1, 0, 0, 1, 1,
0.007022328, 0.3366535, -1.62087, 1, 0, 0, 1, 1,
0.00775093, 1.150384, -0.963869, 1, 0, 0, 1, 1,
0.007965817, -0.4759902, 2.63974, 1, 0, 0, 1, 1,
0.008191836, 0.60905, -0.06306387, 1, 0, 0, 1, 1,
0.01104431, 0.2133938, -1.51239, 0, 0, 0, 1, 1,
0.01105093, 0.2894221, -0.01438698, 0, 0, 0, 1, 1,
0.01670017, 0.2164674, 1.318476, 0, 0, 0, 1, 1,
0.0190633, -1.913241, 4.685612, 0, 0, 0, 1, 1,
0.02391042, 0.3988362, 1.75993, 0, 0, 0, 1, 1,
0.02612945, -1.509208, 2.694001, 0, 0, 0, 1, 1,
0.02724666, -1.297731, 2.261727, 0, 0, 0, 1, 1,
0.02754055, -2.500555, 2.992965, 1, 1, 1, 1, 1,
0.02929734, 0.280284, -0.2219991, 1, 1, 1, 1, 1,
0.03714227, -0.2030933, 0.6865761, 1, 1, 1, 1, 1,
0.03769563, -2.142247, 1.894376, 1, 1, 1, 1, 1,
0.03967298, 0.4239566, -0.9923573, 1, 1, 1, 1, 1,
0.03977013, -2.015828, 4.063147, 1, 1, 1, 1, 1,
0.03980242, -0.05083624, 2.245845, 1, 1, 1, 1, 1,
0.04170242, -1.171902, 2.370548, 1, 1, 1, 1, 1,
0.0426389, -1.252962, 4.127697, 1, 1, 1, 1, 1,
0.04750407, -1.04337, 1.981646, 1, 1, 1, 1, 1,
0.05039062, 0.1051385, 1.409701, 1, 1, 1, 1, 1,
0.05488734, -0.4961182, 4.375341, 1, 1, 1, 1, 1,
0.05494033, -0.5180183, 2.689665, 1, 1, 1, 1, 1,
0.05576053, -1.008242, 3.566283, 1, 1, 1, 1, 1,
0.05585103, 0.3305375, -0.1099987, 1, 1, 1, 1, 1,
0.05736129, -1.705306, 3.849699, 0, 0, 1, 1, 1,
0.07482496, 0.6168584, 0.7442744, 1, 0, 0, 1, 1,
0.07687444, -1.725016, 3.27779, 1, 0, 0, 1, 1,
0.0812957, -0.1662217, 2.077928, 1, 0, 0, 1, 1,
0.08401228, 0.04548524, -0.8561184, 1, 0, 0, 1, 1,
0.08458705, 0.4374206, -1.239071, 1, 0, 0, 1, 1,
0.08740021, -0.9347605, 2.651091, 0, 0, 0, 1, 1,
0.0911724, 0.8632738, 0.4660189, 0, 0, 0, 1, 1,
0.09128191, -0.9493642, 2.292396, 0, 0, 0, 1, 1,
0.09187503, 1.872862, -0.8408911, 0, 0, 0, 1, 1,
0.096828, -1.054773, 2.883347, 0, 0, 0, 1, 1,
0.09692416, -0.4452555, 3.898351, 0, 0, 0, 1, 1,
0.1002515, 0.0009012289, 4.005824, 0, 0, 0, 1, 1,
0.1026322, -0.08140948, 1.836418, 1, 1, 1, 1, 1,
0.1042705, -0.3528353, 5.009556, 1, 1, 1, 1, 1,
0.107657, -0.4873875, 4.676754, 1, 1, 1, 1, 1,
0.1088392, -1.161035, 4.033479, 1, 1, 1, 1, 1,
0.1167922, -1.471966, 3.364223, 1, 1, 1, 1, 1,
0.1171401, -0.3797821, 2.917731, 1, 1, 1, 1, 1,
0.1199363, 0.9482685, 1.977449, 1, 1, 1, 1, 1,
0.1209332, -0.4745835, 3.297263, 1, 1, 1, 1, 1,
0.1214509, -1.365154, 4.578375, 1, 1, 1, 1, 1,
0.1227355, -0.02384573, 0.9179178, 1, 1, 1, 1, 1,
0.1238933, 0.02936897, 2.205798, 1, 1, 1, 1, 1,
0.1252826, 1.168909, -0.1864771, 1, 1, 1, 1, 1,
0.127736, 0.4805397, 0.4784816, 1, 1, 1, 1, 1,
0.1290679, 1.568216, -0.2862591, 1, 1, 1, 1, 1,
0.1308411, -0.1039787, 2.8404, 1, 1, 1, 1, 1,
0.138411, -1.391503, 2.310377, 0, 0, 1, 1, 1,
0.1432031, -0.2125176, 4.129719, 1, 0, 0, 1, 1,
0.1437509, 1.968187, 1.988364, 1, 0, 0, 1, 1,
0.1471983, -0.1722165, 2.543276, 1, 0, 0, 1, 1,
0.1477285, 0.1750526, -0.5316809, 1, 0, 0, 1, 1,
0.1486489, -0.7046909, 2.585331, 1, 0, 0, 1, 1,
0.1495939, 1.596231, -0.4501647, 0, 0, 0, 1, 1,
0.1583248, 0.2623387, -0.7637985, 0, 0, 0, 1, 1,
0.1618074, 0.01779441, 1.473158, 0, 0, 0, 1, 1,
0.1629637, -1.074665, 1.076284, 0, 0, 0, 1, 1,
0.1641295, -0.05280127, 2.994342, 0, 0, 0, 1, 1,
0.1729954, 0.1975384, 1.263227, 0, 0, 0, 1, 1,
0.1741133, 0.6892229, 0.7924826, 0, 0, 0, 1, 1,
0.1761819, 0.2309024, -0.04471088, 1, 1, 1, 1, 1,
0.1786326, -0.1709324, 2.796836, 1, 1, 1, 1, 1,
0.1819571, 0.7028215, -0.7637424, 1, 1, 1, 1, 1,
0.1854722, 0.2442403, 2.184868, 1, 1, 1, 1, 1,
0.1856631, -1.004684, 3.958326, 1, 1, 1, 1, 1,
0.1952162, -0.05320728, 0.7405725, 1, 1, 1, 1, 1,
0.196871, -1.382182, 3.443532, 1, 1, 1, 1, 1,
0.1990403, 2.419297, 1.371878, 1, 1, 1, 1, 1,
0.203012, -1.077385, 1.504811, 1, 1, 1, 1, 1,
0.2090649, -1.722999, 1.050849, 1, 1, 1, 1, 1,
0.2094775, 1.043576, 0.4629482, 1, 1, 1, 1, 1,
0.2120813, 0.3172309, 0.8113742, 1, 1, 1, 1, 1,
0.214003, 0.3241347, 1.417857, 1, 1, 1, 1, 1,
0.2144427, 0.9263093, 3.099618, 1, 1, 1, 1, 1,
0.2153742, -0.281558, 2.644618, 1, 1, 1, 1, 1,
0.2194266, -0.05768403, 1.514642, 0, 0, 1, 1, 1,
0.2195578, -0.2452547, 1.904266, 1, 0, 0, 1, 1,
0.222892, -1.050167, 2.768933, 1, 0, 0, 1, 1,
0.2251482, -0.8890814, 2.945182, 1, 0, 0, 1, 1,
0.2266507, 0.9938045, -1.388938, 1, 0, 0, 1, 1,
0.2298943, -0.8740413, 1.715481, 1, 0, 0, 1, 1,
0.2306832, -1.18238, 4.081749, 0, 0, 0, 1, 1,
0.2336487, 1.346712, -0.8135627, 0, 0, 0, 1, 1,
0.2338449, -1.798709, 2.086007, 0, 0, 0, 1, 1,
0.2344384, -0.5666111, 2.089754, 0, 0, 0, 1, 1,
0.237759, -0.5078614, 3.137148, 0, 0, 0, 1, 1,
0.2391372, -0.5775214, 4.147335, 0, 0, 0, 1, 1,
0.2442574, -0.844236, 4.469372, 0, 0, 0, 1, 1,
0.2460587, 0.4280825, 0.5130499, 1, 1, 1, 1, 1,
0.2464463, -0.5007865, 3.890218, 1, 1, 1, 1, 1,
0.253107, 0.6940152, -0.07045082, 1, 1, 1, 1, 1,
0.2550224, 1.401795, 1.307109, 1, 1, 1, 1, 1,
0.2588794, 0.342199, -0.2717882, 1, 1, 1, 1, 1,
0.2610665, 0.1406971, 1.558566, 1, 1, 1, 1, 1,
0.2616783, 0.8209295, 0.8065833, 1, 1, 1, 1, 1,
0.2638904, -0.1045987, 2.005031, 1, 1, 1, 1, 1,
0.2655281, -0.5178976, 3.202867, 1, 1, 1, 1, 1,
0.2672319, 0.5007411, 0.2657269, 1, 1, 1, 1, 1,
0.2705921, 0.2369327, 0.4305932, 1, 1, 1, 1, 1,
0.2826728, -1.127668, 4.417098, 1, 1, 1, 1, 1,
0.2833956, -0.3768586, 2.121742, 1, 1, 1, 1, 1,
0.2881085, -0.7862375, 2.417924, 1, 1, 1, 1, 1,
0.2888052, 0.0836191, 0.9021417, 1, 1, 1, 1, 1,
0.2929552, -0.0054339, 2.087566, 0, 0, 1, 1, 1,
0.2943377, -0.1121549, 2.958612, 1, 0, 0, 1, 1,
0.294945, 0.2767195, 0.3081603, 1, 0, 0, 1, 1,
0.2962643, -0.1246421, 2.463274, 1, 0, 0, 1, 1,
0.2964642, 0.5293809, 1.13959, 1, 0, 0, 1, 1,
0.2972473, 0.7021555, 1.237535, 1, 0, 0, 1, 1,
0.2975709, -0.108784, 1.126939, 0, 0, 0, 1, 1,
0.2988317, 0.6500131, -0.7871075, 0, 0, 0, 1, 1,
0.3072537, -0.2963695, 2.911239, 0, 0, 0, 1, 1,
0.3092842, 0.1654354, -0.2324056, 0, 0, 0, 1, 1,
0.3145145, 0.2857926, 1.089268, 0, 0, 0, 1, 1,
0.3176302, 0.2502587, 2.054684, 0, 0, 0, 1, 1,
0.3184817, -1.029177, 2.108562, 0, 0, 0, 1, 1,
0.3186486, -0.2262624, 2.642904, 1, 1, 1, 1, 1,
0.3215029, -0.533539, 1.030024, 1, 1, 1, 1, 1,
0.3215038, 1.849362, 0.7761381, 1, 1, 1, 1, 1,
0.3235621, 0.3938946, 1.475158, 1, 1, 1, 1, 1,
0.3269294, -0.03522363, 2.347148, 1, 1, 1, 1, 1,
0.3274842, 0.9091279, -0.9348599, 1, 1, 1, 1, 1,
0.3296783, 0.4218145, 1.503533, 1, 1, 1, 1, 1,
0.3331694, -2.929921, 4.356045, 1, 1, 1, 1, 1,
0.3369648, -1.928787, 2.356024, 1, 1, 1, 1, 1,
0.3369834, 0.1766784, 0.6596068, 1, 1, 1, 1, 1,
0.3390231, -0.8447698, 2.083572, 1, 1, 1, 1, 1,
0.3413965, 0.01574114, 1.102103, 1, 1, 1, 1, 1,
0.3440537, 0.95938, 0.6259571, 1, 1, 1, 1, 1,
0.3469527, 0.2195446, 1.312871, 1, 1, 1, 1, 1,
0.3510624, 0.03062492, 2.331172, 1, 1, 1, 1, 1,
0.3551592, -0.8018891, 1.734091, 0, 0, 1, 1, 1,
0.3612048, -0.5391744, 1.580912, 1, 0, 0, 1, 1,
0.362612, -0.459484, 2.736916, 1, 0, 0, 1, 1,
0.3631543, 0.9803925, 0.4072749, 1, 0, 0, 1, 1,
0.3655078, -0.2270834, 2.037812, 1, 0, 0, 1, 1,
0.3689523, -0.3855709, 2.658032, 1, 0, 0, 1, 1,
0.3710086, -0.238934, 2.746341, 0, 0, 0, 1, 1,
0.3711486, -1.31819, 2.365853, 0, 0, 0, 1, 1,
0.372187, 0.8704143, -1.102057, 0, 0, 0, 1, 1,
0.3741944, -0.6251202, 2.53634, 0, 0, 0, 1, 1,
0.3757241, 0.1543422, 1.836933, 0, 0, 0, 1, 1,
0.3783918, -1.080752, 2.59285, 0, 0, 0, 1, 1,
0.3796289, 0.09616735, 1.648002, 0, 0, 0, 1, 1,
0.3816456, -0.7439649, 2.307197, 1, 1, 1, 1, 1,
0.390051, -2.481366, 3.762454, 1, 1, 1, 1, 1,
0.3911316, 0.7275147, -0.5406211, 1, 1, 1, 1, 1,
0.3954946, 0.5849438, 1.571782, 1, 1, 1, 1, 1,
0.3988087, 1.269656, -0.1861283, 1, 1, 1, 1, 1,
0.3996948, 0.6883987, 0.9069068, 1, 1, 1, 1, 1,
0.3999034, -0.2451882, 2.663358, 1, 1, 1, 1, 1,
0.4018742, -1.183051, 3.922638, 1, 1, 1, 1, 1,
0.404427, 1.674825, 1.112311, 1, 1, 1, 1, 1,
0.4090152, 0.4301624, -0.4997305, 1, 1, 1, 1, 1,
0.4097505, -0.2891856, 2.000986, 1, 1, 1, 1, 1,
0.4100042, 0.4142196, 1.503946, 1, 1, 1, 1, 1,
0.4117186, 1.481871, -1.77834, 1, 1, 1, 1, 1,
0.4143744, 0.3314593, 2.299845, 1, 1, 1, 1, 1,
0.4163875, 0.3830703, 1.27872, 1, 1, 1, 1, 1,
0.417899, 0.3382747, 0.4156254, 0, 0, 1, 1, 1,
0.4179406, 1.384615, 1.652795, 1, 0, 0, 1, 1,
0.4203582, 0.2473814, 2.096943, 1, 0, 0, 1, 1,
0.424801, 0.668398, -0.2952627, 1, 0, 0, 1, 1,
0.4285062, -1.16618, 2.113718, 1, 0, 0, 1, 1,
0.4310181, -0.6403158, 1.76373, 1, 0, 0, 1, 1,
0.4311639, 0.3708388, -0.05361904, 0, 0, 0, 1, 1,
0.4362222, 0.1359402, -1.092129, 0, 0, 0, 1, 1,
0.4391685, 1.315454, -0.3175782, 0, 0, 0, 1, 1,
0.4477774, 1.482018, 1.369041, 0, 0, 0, 1, 1,
0.4490184, -1.369191, 2.591692, 0, 0, 0, 1, 1,
0.4492961, -0.2473701, 3.136291, 0, 0, 0, 1, 1,
0.4522978, 0.7635021, -1.593454, 0, 0, 0, 1, 1,
0.4550827, 0.1223031, 1.437785, 1, 1, 1, 1, 1,
0.4591577, -0.3725221, 1.464693, 1, 1, 1, 1, 1,
0.4606031, -0.3136975, 3.17056, 1, 1, 1, 1, 1,
0.4615068, 0.2756322, -0.4269301, 1, 1, 1, 1, 1,
0.4655422, 0.4981478, 0.3807911, 1, 1, 1, 1, 1,
0.4657114, 1.326299, -0.8733168, 1, 1, 1, 1, 1,
0.4753278, -1.072844, 3.532217, 1, 1, 1, 1, 1,
0.4785784, 0.3309903, 0.4906943, 1, 1, 1, 1, 1,
0.4801626, -2.567922, 2.331608, 1, 1, 1, 1, 1,
0.4804819, 1.552759, -0.3100839, 1, 1, 1, 1, 1,
0.4808015, -1.367208, 3.403739, 1, 1, 1, 1, 1,
0.4825097, 0.1256729, 1.140171, 1, 1, 1, 1, 1,
0.4848329, -0.6600304, 3.522911, 1, 1, 1, 1, 1,
0.4887242, -1.411901, 3.417762, 1, 1, 1, 1, 1,
0.4944421, 0.3316664, 1.026705, 1, 1, 1, 1, 1,
0.4947556, 0.1357056, 2.480795, 0, 0, 1, 1, 1,
0.4972165, -0.5827907, 3.872211, 1, 0, 0, 1, 1,
0.5037555, -1.472148, 3.47034, 1, 0, 0, 1, 1,
0.503931, -1.366712, 1.380394, 1, 0, 0, 1, 1,
0.5046092, 1.844523, -0.09264489, 1, 0, 0, 1, 1,
0.5065906, 0.2818539, 2.156748, 1, 0, 0, 1, 1,
0.5069313, -0.2231653, 2.646458, 0, 0, 0, 1, 1,
0.5096061, 1.153957, 0.3501043, 0, 0, 0, 1, 1,
0.5156164, 0.7274452, -0.8554574, 0, 0, 0, 1, 1,
0.5218866, -0.1787983, 2.564674, 0, 0, 0, 1, 1,
0.5223205, 1.072083, 2.692711, 0, 0, 0, 1, 1,
0.5242281, 0.09942155, 2.051286, 0, 0, 0, 1, 1,
0.5281908, 1.551803, 0.5132192, 0, 0, 0, 1, 1,
0.5318941, 0.845143, -0.2247349, 1, 1, 1, 1, 1,
0.5328936, -1.762297, 1.803666, 1, 1, 1, 1, 1,
0.5380372, 1.742567, 0.6565169, 1, 1, 1, 1, 1,
0.5402921, -0.8177489, 2.209394, 1, 1, 1, 1, 1,
0.5429282, -0.8938099, 1.724175, 1, 1, 1, 1, 1,
0.5450354, -1.284236, 3.124509, 1, 1, 1, 1, 1,
0.5472866, 0.2728985, 0.1846257, 1, 1, 1, 1, 1,
0.5479257, 2.414163, -0.8047842, 1, 1, 1, 1, 1,
0.5565835, -0.681358, 1.846128, 1, 1, 1, 1, 1,
0.5599106, 0.872849, 0.4238199, 1, 1, 1, 1, 1,
0.5599592, -0.08303756, 1.526367, 1, 1, 1, 1, 1,
0.561212, -2.086028, 2.525119, 1, 1, 1, 1, 1,
0.5637531, -0.3263023, 1.90211, 1, 1, 1, 1, 1,
0.563877, -0.2500864, 2.627522, 1, 1, 1, 1, 1,
0.5643527, -0.7622394, 1.177018, 1, 1, 1, 1, 1,
0.568743, -1.428892, 2.591942, 0, 0, 1, 1, 1,
0.5718688, 1.025542, 1.052292, 1, 0, 0, 1, 1,
0.5750483, 0.08140332, 0.3293471, 1, 0, 0, 1, 1,
0.5757804, -0.6607821, 3.543928, 1, 0, 0, 1, 1,
0.5774898, -0.1687917, 2.750592, 1, 0, 0, 1, 1,
0.5831398, -0.4834321, 3.847233, 1, 0, 0, 1, 1,
0.5872099, -1.205105, 2.328715, 0, 0, 0, 1, 1,
0.5878677, -0.3224365, 3.133823, 0, 0, 0, 1, 1,
0.5914798, 0.4831907, 0.8775359, 0, 0, 0, 1, 1,
0.5938354, -0.6218776, 4.630563, 0, 0, 0, 1, 1,
0.5939339, -0.4666474, 4.358207, 0, 0, 0, 1, 1,
0.5971879, 0.3779131, 1.661211, 0, 0, 0, 1, 1,
0.5974746, -0.174587, 0.7102076, 0, 0, 0, 1, 1,
0.5981387, 0.3330349, 1.532329, 1, 1, 1, 1, 1,
0.5982021, -0.4557285, 2.846012, 1, 1, 1, 1, 1,
0.5983729, -0.514429, 1.945386, 1, 1, 1, 1, 1,
0.6025238, 0.8981166, 2.01264, 1, 1, 1, 1, 1,
0.6062635, 0.1391688, -1.724965, 1, 1, 1, 1, 1,
0.6073551, -0.5510102, 2.139786, 1, 1, 1, 1, 1,
0.6079382, 0.7101144, 1.437128, 1, 1, 1, 1, 1,
0.6113372, 0.07909387, 0.6438416, 1, 1, 1, 1, 1,
0.6124797, 0.7151373, -0.1906289, 1, 1, 1, 1, 1,
0.612957, 0.38904, -1.006304, 1, 1, 1, 1, 1,
0.620262, -1.062792, 2.820629, 1, 1, 1, 1, 1,
0.6292111, 0.3128056, 0.356326, 1, 1, 1, 1, 1,
0.6297354, 1.060898, 0.9827366, 1, 1, 1, 1, 1,
0.6303823, 1.072768, 0.02561468, 1, 1, 1, 1, 1,
0.6307282, 0.2242138, 2.036016, 1, 1, 1, 1, 1,
0.6344701, 1.747342, -0.3416771, 0, 0, 1, 1, 1,
0.637053, -0.5727552, 2.608442, 1, 0, 0, 1, 1,
0.6386746, 0.5573353, 0.0187506, 1, 0, 0, 1, 1,
0.639013, 0.2553866, 0.9515067, 1, 0, 0, 1, 1,
0.6436478, -0.5038563, 1.831807, 1, 0, 0, 1, 1,
0.6463572, -0.7396216, 2.099932, 1, 0, 0, 1, 1,
0.6524727, 0.8814064, -1.432008, 0, 0, 0, 1, 1,
0.6535543, -0.4623004, -0.02555161, 0, 0, 0, 1, 1,
0.6551992, -0.06875761, 0.7699732, 0, 0, 0, 1, 1,
0.6563147, 1.383625, 0.5834882, 0, 0, 0, 1, 1,
0.6575552, -1.378674, 4.578491, 0, 0, 0, 1, 1,
0.6587577, 0.02766895, -0.04371802, 0, 0, 0, 1, 1,
0.6626076, 1.333877, 0.2546629, 0, 0, 0, 1, 1,
0.6647422, 0.06801999, 0.4377336, 1, 1, 1, 1, 1,
0.6660281, 0.8853284, 0.4644409, 1, 1, 1, 1, 1,
0.6662863, 0.3585142, 1.969367, 1, 1, 1, 1, 1,
0.668, -0.0848574, 1.549865, 1, 1, 1, 1, 1,
0.669493, 1.549308, 2.082676, 1, 1, 1, 1, 1,
0.6698962, 0.1935026, 1.055696, 1, 1, 1, 1, 1,
0.6704425, 0.162338, 0.7873492, 1, 1, 1, 1, 1,
0.6768249, 1.578084, 0.3949341, 1, 1, 1, 1, 1,
0.6797783, 1.152783, 0.2158126, 1, 1, 1, 1, 1,
0.6841068, -0.5171208, 1.049577, 1, 1, 1, 1, 1,
0.6849902, -0.8219408, 2.141225, 1, 1, 1, 1, 1,
0.687457, -0.3118425, 2.708279, 1, 1, 1, 1, 1,
0.6898385, -0.08492227, 1.271714, 1, 1, 1, 1, 1,
0.6980646, -1.115463, 3.731275, 1, 1, 1, 1, 1,
0.7043269, -1.157422, 1.904365, 1, 1, 1, 1, 1,
0.709452, 1.09471, 1.338681, 0, 0, 1, 1, 1,
0.7206596, -0.1899091, 2.908732, 1, 0, 0, 1, 1,
0.722711, -0.4631925, 0.6647125, 1, 0, 0, 1, 1,
0.7232339, 0.907087, 0.3746434, 1, 0, 0, 1, 1,
0.724045, -0.01903042, 0.9174507, 1, 0, 0, 1, 1,
0.7246137, -3.347685, 2.53156, 1, 0, 0, 1, 1,
0.7257288, -0.2275638, 2.833011, 0, 0, 0, 1, 1,
0.7280757, 1.040656, -0.2363481, 0, 0, 0, 1, 1,
0.728209, -2.121706, 4.817763, 0, 0, 0, 1, 1,
0.7322814, -1.083081, 3.380824, 0, 0, 0, 1, 1,
0.733326, -1.751831, 2.819383, 0, 0, 0, 1, 1,
0.7370155, -1.379162, 4.658314, 0, 0, 0, 1, 1,
0.7395423, 1.185526, 0.712296, 0, 0, 0, 1, 1,
0.7400527, 0.06963553, 3.518114, 1, 1, 1, 1, 1,
0.7404789, 0.2194775, 1.21285, 1, 1, 1, 1, 1,
0.7475991, -0.009981048, 3.43768, 1, 1, 1, 1, 1,
0.7519909, 0.5223145, 2.10438, 1, 1, 1, 1, 1,
0.7523318, -0.9603661, 2.218616, 1, 1, 1, 1, 1,
0.7579585, -0.5763438, 2.703388, 1, 1, 1, 1, 1,
0.7654319, -0.5054807, 3.264267, 1, 1, 1, 1, 1,
0.77618, -0.6973358, 4.247317, 1, 1, 1, 1, 1,
0.7871842, 0.1697081, 1.767209, 1, 1, 1, 1, 1,
0.7875404, -1.491148, 3.117702, 1, 1, 1, 1, 1,
0.7899542, -0.3412378, 3.283895, 1, 1, 1, 1, 1,
0.7902076, 1.669657, 3.075381, 1, 1, 1, 1, 1,
0.7947891, 0.4479373, 0.04457758, 1, 1, 1, 1, 1,
0.7952214, -0.8845813, 2.806867, 1, 1, 1, 1, 1,
0.804458, 2.038981, 1.676409, 1, 1, 1, 1, 1,
0.8076446, 0.9473916, 0.9471629, 0, 0, 1, 1, 1,
0.8165014, 0.05891531, 0.7121257, 1, 0, 0, 1, 1,
0.819465, 0.5061706, 0.2836891, 1, 0, 0, 1, 1,
0.8266998, -0.1785502, 0.5702428, 1, 0, 0, 1, 1,
0.8287376, -0.8610249, 2.560831, 1, 0, 0, 1, 1,
0.8320911, 1.646919, 1.58166, 1, 0, 0, 1, 1,
0.8415713, 0.4515812, 0.7476147, 0, 0, 0, 1, 1,
0.8425729, 0.5774668, 1.545499, 0, 0, 0, 1, 1,
0.8440698, 1.334555, 1.910233, 0, 0, 0, 1, 1,
0.8502859, -0.4724376, 2.380139, 0, 0, 0, 1, 1,
0.850989, -0.732906, 2.819605, 0, 0, 0, 1, 1,
0.8567551, 0.5808727, -1.090684, 0, 0, 0, 1, 1,
0.8586184, -0.6667557, 0.925281, 0, 0, 0, 1, 1,
0.8648598, 0.05200997, 2.256453, 1, 1, 1, 1, 1,
0.8670372, -0.7769051, 1.169252, 1, 1, 1, 1, 1,
0.8732494, 1.800241, -0.4274159, 1, 1, 1, 1, 1,
0.8795028, 0.8218448, 2.04462, 1, 1, 1, 1, 1,
0.8796746, 1.114277, 2.085156, 1, 1, 1, 1, 1,
0.8804987, 1.263106, -0.6031914, 1, 1, 1, 1, 1,
0.881116, -0.2330313, 2.153155, 1, 1, 1, 1, 1,
0.8855355, -0.8228669, 3.255056, 1, 1, 1, 1, 1,
0.8862334, 1.559278, 0.2726391, 1, 1, 1, 1, 1,
0.887643, 1.250355, 1.727295, 1, 1, 1, 1, 1,
0.8888727, -2.428818, 2.532119, 1, 1, 1, 1, 1,
0.8969561, -0.8268245, 2.986972, 1, 1, 1, 1, 1,
0.906352, 0.9997911, -0.3312672, 1, 1, 1, 1, 1,
0.9075071, -1.70875, 1.79042, 1, 1, 1, 1, 1,
0.9268869, -0.703908, 1.490989, 1, 1, 1, 1, 1,
0.9290924, -0.2926268, 1.361266, 0, 0, 1, 1, 1,
0.9331678, 2.039346, 0.9607533, 1, 0, 0, 1, 1,
0.9348748, 1.198179, 1.020737, 1, 0, 0, 1, 1,
0.9378594, 1.089857, 2.643436, 1, 0, 0, 1, 1,
0.9477264, 0.2812785, 1.034177, 1, 0, 0, 1, 1,
0.9504516, 1.448203, 1.956622, 1, 0, 0, 1, 1,
0.9525124, 0.1686764, 1.615696, 0, 0, 0, 1, 1,
0.9531585, -1.408973, 4.102819, 0, 0, 0, 1, 1,
0.9541699, 1.083783, 1.875, 0, 0, 0, 1, 1,
0.964083, 0.1587571, 0.1890281, 0, 0, 0, 1, 1,
0.9669892, -1.163835, 2.396955, 0, 0, 0, 1, 1,
0.9723194, 1.566595, -1.685549, 0, 0, 0, 1, 1,
0.9779797, -2.141281, 2.914973, 0, 0, 0, 1, 1,
0.9796582, -1.133294, 3.179527, 1, 1, 1, 1, 1,
0.9849399, -1.390495, 3.124586, 1, 1, 1, 1, 1,
0.9851307, -0.133083, 1.032268, 1, 1, 1, 1, 1,
0.9889295, -1.463408, 2.249729, 1, 1, 1, 1, 1,
0.9947743, 1.117917, -1.259221, 1, 1, 1, 1, 1,
1.004828, -1.120473, 4.099417, 1, 1, 1, 1, 1,
1.013835, -1.143905, 3.313972, 1, 1, 1, 1, 1,
1.018852, 0.3936342, 1.385352, 1, 1, 1, 1, 1,
1.034667, 0.8143375, 1.152303, 1, 1, 1, 1, 1,
1.039291, 0.6449721, -0.442533, 1, 1, 1, 1, 1,
1.040464, -2.234679, 2.412819, 1, 1, 1, 1, 1,
1.042328, 1.520869, 1.504492, 1, 1, 1, 1, 1,
1.052533, -0.6267326, 1.836074, 1, 1, 1, 1, 1,
1.055877, 0.8773176, 1.206431, 1, 1, 1, 1, 1,
1.075437, -1.059809, 2.960921, 1, 1, 1, 1, 1,
1.077859, 0.3762121, 3.012707, 0, 0, 1, 1, 1,
1.090549, 1.034169, -1.629786, 1, 0, 0, 1, 1,
1.094286, 0.479233, 1.890566, 1, 0, 0, 1, 1,
1.095768, 0.6180408, 0.7456009, 1, 0, 0, 1, 1,
1.101337, -0.06290448, 3.000792, 1, 0, 0, 1, 1,
1.121385, 0.3489672, 2.375972, 1, 0, 0, 1, 1,
1.124495, 0.3434011, 0.990932, 0, 0, 0, 1, 1,
1.125156, -1.21611, 2.436836, 0, 0, 0, 1, 1,
1.125803, 0.4147353, 2.457286, 0, 0, 0, 1, 1,
1.128405, -1.703492, 3.166409, 0, 0, 0, 1, 1,
1.129101, 0.7175807, -0.3732623, 0, 0, 0, 1, 1,
1.131338, 0.2285607, -0.1872016, 0, 0, 0, 1, 1,
1.131838, 0.05688451, 1.927869, 0, 0, 0, 1, 1,
1.138539, 2.257202, 0.5963683, 1, 1, 1, 1, 1,
1.146219, 1.021474, 1.024026, 1, 1, 1, 1, 1,
1.148412, 0.2302596, 1.914902, 1, 1, 1, 1, 1,
1.149955, -1.71441, 3.584953, 1, 1, 1, 1, 1,
1.150261, 1.219802, 1.156325, 1, 1, 1, 1, 1,
1.154735, -1.240668, 2.458831, 1, 1, 1, 1, 1,
1.159079, -0.0794116, 1.203507, 1, 1, 1, 1, 1,
1.161944, -0.3031832, 2.322334, 1, 1, 1, 1, 1,
1.162651, -0.6637957, 3.374364, 1, 1, 1, 1, 1,
1.164544, -0.8602485, 3.179607, 1, 1, 1, 1, 1,
1.169273, 1.031735, -0.1482618, 1, 1, 1, 1, 1,
1.17052, -0.3285989, 1.861799, 1, 1, 1, 1, 1,
1.17824, 1.456205, 0.6660174, 1, 1, 1, 1, 1,
1.180244, 0.3478098, 1.42204, 1, 1, 1, 1, 1,
1.182353, 0.8028072, 0.4917579, 1, 1, 1, 1, 1,
1.185261, -1.665127, 3.143621, 0, 0, 1, 1, 1,
1.186882, -0.6693659, 1.739836, 1, 0, 0, 1, 1,
1.219539, 1.013412, 0.5746794, 1, 0, 0, 1, 1,
1.220909, 0.2389721, 1.255287, 1, 0, 0, 1, 1,
1.223346, 0.2426124, 1.549247, 1, 0, 0, 1, 1,
1.223852, 2.164611, 0.2258915, 1, 0, 0, 1, 1,
1.232546, 1.925232, 0.3984026, 0, 0, 0, 1, 1,
1.244637, 0.6508141, 1.23204, 0, 0, 0, 1, 1,
1.253018, -0.2988687, 4.308097, 0, 0, 0, 1, 1,
1.255829, -0.5556256, 2.527987, 0, 0, 0, 1, 1,
1.267636, -0.132451, 1.382023, 0, 0, 0, 1, 1,
1.280852, -0.4639019, 1.984318, 0, 0, 0, 1, 1,
1.298613, -0.8194017, 2.477037, 0, 0, 0, 1, 1,
1.314551, -0.2982114, 1.779595, 1, 1, 1, 1, 1,
1.315104, -0.8187381, 2.60024, 1, 1, 1, 1, 1,
1.326002, -0.02872784, 2.877805, 1, 1, 1, 1, 1,
1.340339, 0.6072237, 1.026711, 1, 1, 1, 1, 1,
1.340368, 0.2717399, 2.581615, 1, 1, 1, 1, 1,
1.342823, -0.1229005, 1.095224, 1, 1, 1, 1, 1,
1.348232, 0.4412374, 2.331912, 1, 1, 1, 1, 1,
1.350733, 1.266247, 0.9832801, 1, 1, 1, 1, 1,
1.350897, 0.2962036, 0.6870315, 1, 1, 1, 1, 1,
1.37101, -0.0579906, 2.67881, 1, 1, 1, 1, 1,
1.375296, 1.77635, 1.621191, 1, 1, 1, 1, 1,
1.387269, 0.9185685, 0.2753223, 1, 1, 1, 1, 1,
1.390869, -1.460291, 2.14626, 1, 1, 1, 1, 1,
1.400585, 0.6914453, 0.3735059, 1, 1, 1, 1, 1,
1.401698, -0.05933286, 1.370539, 1, 1, 1, 1, 1,
1.411944, -1.092603, 0.9751486, 0, 0, 1, 1, 1,
1.418213, -0.8666975, 2.340784, 1, 0, 0, 1, 1,
1.426008, -0.4415186, 1.805052, 1, 0, 0, 1, 1,
1.436473, 1.377068, 0.5637774, 1, 0, 0, 1, 1,
1.444569, -0.2818348, 1.670437, 1, 0, 0, 1, 1,
1.44895, -0.1842621, 2.868197, 1, 0, 0, 1, 1,
1.470506, 0.259681, 0.08358172, 0, 0, 0, 1, 1,
1.483397, -0.1180077, 3.842299, 0, 0, 0, 1, 1,
1.484277, -0.1851816, 2.027955, 0, 0, 0, 1, 1,
1.488488, -0.7241236, 2.405848, 0, 0, 0, 1, 1,
1.508285, -1.608734, 1.632308, 0, 0, 0, 1, 1,
1.511252, 0.2888055, 2.037262, 0, 0, 0, 1, 1,
1.522164, -0.2908868, -0.5470045, 0, 0, 0, 1, 1,
1.523748, 0.3503969, 1.173915, 1, 1, 1, 1, 1,
1.525338, 0.5227343, 2.006966, 1, 1, 1, 1, 1,
1.525766, -0.076451, 1.69246, 1, 1, 1, 1, 1,
1.547017, -0.1563023, 2.198591, 1, 1, 1, 1, 1,
1.59157, 0.08990518, 1.957695, 1, 1, 1, 1, 1,
1.606253, -2.034123, 2.49852, 1, 1, 1, 1, 1,
1.607932, -0.9104543, 3.269431, 1, 1, 1, 1, 1,
1.634856, -1.206862, 3.484896, 1, 1, 1, 1, 1,
1.645872, -1.427693, 1.787161, 1, 1, 1, 1, 1,
1.649, -0.5936475, 2.595139, 1, 1, 1, 1, 1,
1.652584, -0.6283726, 1.916846, 1, 1, 1, 1, 1,
1.659862, -0.5323569, 1.683326, 1, 1, 1, 1, 1,
1.664603, -2.035372, 3.143404, 1, 1, 1, 1, 1,
1.672808, 0.1619451, 1.851821, 1, 1, 1, 1, 1,
1.689334, 0.3143316, -0.1380073, 1, 1, 1, 1, 1,
1.690402, 0.02022183, 0.7310681, 0, 0, 1, 1, 1,
1.698446, 0.2978498, 3.157501, 1, 0, 0, 1, 1,
1.706935, 1.547318, 1.414287, 1, 0, 0, 1, 1,
1.708199, -1.440055, 2.930578, 1, 0, 0, 1, 1,
1.709756, -0.174994, 1.285787, 1, 0, 0, 1, 1,
1.71834, -0.242906, 1.699827, 1, 0, 0, 1, 1,
1.725413, 0.7174374, 2.092204, 0, 0, 0, 1, 1,
1.731959, 1.336216, 2.356629, 0, 0, 0, 1, 1,
1.754611, 0.9357781, -0.4177021, 0, 0, 0, 1, 1,
1.756752, 2.184144, 0.6176577, 0, 0, 0, 1, 1,
1.763559, 0.3593493, -0.3215788, 0, 0, 0, 1, 1,
1.788462, -0.007522643, 1.594344, 0, 0, 0, 1, 1,
1.833319, 1.011325, 1.26834, 0, 0, 0, 1, 1,
1.840974, -0.3790471, 1.822846, 1, 1, 1, 1, 1,
1.858428, 0.4175959, 0.7419103, 1, 1, 1, 1, 1,
1.867845, 0.7899802, 2.245862, 1, 1, 1, 1, 1,
1.873459, -0.816035, 0.8886942, 1, 1, 1, 1, 1,
1.877723, 1.701599, 2.077842, 1, 1, 1, 1, 1,
1.907735, 0.7838894, 2.027124, 1, 1, 1, 1, 1,
1.924667, -0.2418016, 2.302452, 1, 1, 1, 1, 1,
1.936606, -0.6692167, 1.243253, 1, 1, 1, 1, 1,
1.942044, 1.070576, 1.681038, 1, 1, 1, 1, 1,
1.943211, 1.010222, 0.5252323, 1, 1, 1, 1, 1,
1.970693, -0.5956089, 1.747145, 1, 1, 1, 1, 1,
1.974146, 0.4040114, 0.7191427, 1, 1, 1, 1, 1,
1.981586, 0.7095668, 1.816159, 1, 1, 1, 1, 1,
2.015591, -1.044362, 1.755327, 1, 1, 1, 1, 1,
2.016913, 0.923593, 1.446514, 1, 1, 1, 1, 1,
2.022243, 2.259935, 0.6834744, 0, 0, 1, 1, 1,
2.062564, -0.1495895, 1.319159, 1, 0, 0, 1, 1,
2.114495, 1.459797, 3.016043, 1, 0, 0, 1, 1,
2.120901, -0.5279114, 0.9428804, 1, 0, 0, 1, 1,
2.131231, 1.35341, 1.92078, 1, 0, 0, 1, 1,
2.133233, -1.013453, 2.417709, 1, 0, 0, 1, 1,
2.150751, -0.9475845, 2.36386, 0, 0, 0, 1, 1,
2.171271, 0.64823, 0.626674, 0, 0, 0, 1, 1,
2.222677, 0.2263215, 1.079682, 0, 0, 0, 1, 1,
2.238244, -0.6101837, 2.446044, 0, 0, 0, 1, 1,
2.268744, -0.5300602, 2.707303, 0, 0, 0, 1, 1,
2.284141, -0.09884855, 1.168969, 0, 0, 0, 1, 1,
2.306188, -0.2000685, 1.550567, 0, 0, 0, 1, 1,
2.362439, 0.5655614, 1.384711, 1, 1, 1, 1, 1,
2.431129, 0.8356594, 0.6932663, 1, 1, 1, 1, 1,
2.500599, 0.0188201, 2.406045, 1, 1, 1, 1, 1,
2.625154, 0.7093609, -0.701932, 1, 1, 1, 1, 1,
2.966543, 2.192065, 0.5409198, 1, 1, 1, 1, 1,
3.148593, -1.340134, 1.700171, 1, 1, 1, 1, 1,
3.334687, -0.2181076, 3.301548, 1, 1, 1, 1, 1
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
var radius = 9.145184;
var distance = 32.12207;
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
mvMatrix.translate( -0.16114, 0.3420171, -0.03833699 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.12207);
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
