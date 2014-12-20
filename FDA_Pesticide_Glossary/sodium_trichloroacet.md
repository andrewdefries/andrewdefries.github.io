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
-3.980979, 0.610569, 1.37011, 1, 0, 0, 1,
-3.129442, -0.6360202, -1.529925, 1, 0.007843138, 0, 1,
-2.819831, 0.6013869, -0.940617, 1, 0.01176471, 0, 1,
-2.740682, 1.332629, -1.143052, 1, 0.01960784, 0, 1,
-2.575605, -0.8634959, -1.880986, 1, 0.02352941, 0, 1,
-2.462551, 1.162468, -1.624493, 1, 0.03137255, 0, 1,
-2.445333, -0.3955962, -0.5034798, 1, 0.03529412, 0, 1,
-2.415985, 0.3817872, -0.3858592, 1, 0.04313726, 0, 1,
-2.306987, 2.557884, -1.740448, 1, 0.04705882, 0, 1,
-2.304472, -0.2019175, -1.789397, 1, 0.05490196, 0, 1,
-2.29119, 1.386516, -3.070054, 1, 0.05882353, 0, 1,
-2.216403, -1.825891, -2.362264, 1, 0.06666667, 0, 1,
-2.170189, -0.4815936, -1.717611, 1, 0.07058824, 0, 1,
-2.137997, -2.468835, -1.583424, 1, 0.07843138, 0, 1,
-2.131874, -0.261536, -0.0710049, 1, 0.08235294, 0, 1,
-2.11218, -1.023073, -2.022468, 1, 0.09019608, 0, 1,
-2.072089, -1.794228, -2.439435, 1, 0.09411765, 0, 1,
-2.063474, 0.8120977, -0.6749221, 1, 0.1019608, 0, 1,
-2.051841, 2.303145, -2.154324, 1, 0.1098039, 0, 1,
-2.037893, 1.025531, -0.8700969, 1, 0.1137255, 0, 1,
-2.009811, 1.629246, -1.361342, 1, 0.1215686, 0, 1,
-2.008981, 1.372512, -1.435919, 1, 0.1254902, 0, 1,
-1.989916, -0.1821732, -1.549212, 1, 0.1333333, 0, 1,
-1.981588, 0.6614081, -1.201833, 1, 0.1372549, 0, 1,
-1.964245, 0.9231092, -0.7583373, 1, 0.145098, 0, 1,
-1.961905, -0.7834953, -3.629917, 1, 0.1490196, 0, 1,
-1.957087, -0.05150578, -2.60389, 1, 0.1568628, 0, 1,
-1.932926, -1.121648, -2.977, 1, 0.1607843, 0, 1,
-1.923414, 1.52452, -0.4661236, 1, 0.1686275, 0, 1,
-1.886198, -1.003169, -0.4520575, 1, 0.172549, 0, 1,
-1.884168, -0.723901, -1.898831, 1, 0.1803922, 0, 1,
-1.871548, -0.9499065, -2.132809, 1, 0.1843137, 0, 1,
-1.853038, 0.9560995, -1.727645, 1, 0.1921569, 0, 1,
-1.838649, 0.8986449, 0.0315682, 1, 0.1960784, 0, 1,
-1.82688, 0.08038619, -0.9963868, 1, 0.2039216, 0, 1,
-1.816476, -0.3467326, -2.328671, 1, 0.2117647, 0, 1,
-1.80717, 0.04887072, -0.09106541, 1, 0.2156863, 0, 1,
-1.794698, 1.349675, -1.072355, 1, 0.2235294, 0, 1,
-1.773903, -0.6116982, -0.06866391, 1, 0.227451, 0, 1,
-1.756582, -0.6402032, -2.273638, 1, 0.2352941, 0, 1,
-1.750948, 0.9151551, -0.9659227, 1, 0.2392157, 0, 1,
-1.749813, -1.614217, -4.146275, 1, 0.2470588, 0, 1,
-1.714801, -1.030507, -1.14052, 1, 0.2509804, 0, 1,
-1.707081, 1.161042, 0.4922674, 1, 0.2588235, 0, 1,
-1.700224, -0.3268841, -2.402795, 1, 0.2627451, 0, 1,
-1.697987, -0.8951725, -0.9676268, 1, 0.2705882, 0, 1,
-1.688649, -0.5773275, -1.331073, 1, 0.2745098, 0, 1,
-1.652123, 0.3893715, -0.7183449, 1, 0.282353, 0, 1,
-1.637916, 0.8867642, -1.735609, 1, 0.2862745, 0, 1,
-1.633773, 1.515995, -1.048512, 1, 0.2941177, 0, 1,
-1.633216, -0.6754258, -1.464815, 1, 0.3019608, 0, 1,
-1.614899, -1.408896, -2.864615, 1, 0.3058824, 0, 1,
-1.612906, 0.2329749, -0.2348019, 1, 0.3137255, 0, 1,
-1.610796, -0.967962, -1.605666, 1, 0.3176471, 0, 1,
-1.610008, 1.469053, -1.456262, 1, 0.3254902, 0, 1,
-1.609623, 1.223028, -0.9539228, 1, 0.3294118, 0, 1,
-1.601173, -0.5120958, -2.993081, 1, 0.3372549, 0, 1,
-1.597324, -0.7015412, -2.361133, 1, 0.3411765, 0, 1,
-1.590289, -0.4944271, -2.713443, 1, 0.3490196, 0, 1,
-1.577167, 1.733219, -0.1664601, 1, 0.3529412, 0, 1,
-1.569031, -0.5389356, -1.525259, 1, 0.3607843, 0, 1,
-1.56275, -0.1511218, -0.07747731, 1, 0.3647059, 0, 1,
-1.56086, 0.8344576, -0.5880704, 1, 0.372549, 0, 1,
-1.559417, -0.8822443, -2.267949, 1, 0.3764706, 0, 1,
-1.555355, -0.6429837, -2.039228, 1, 0.3843137, 0, 1,
-1.5498, -1.792078, -0.9468733, 1, 0.3882353, 0, 1,
-1.548296, 1.381443, -0.2622499, 1, 0.3960784, 0, 1,
-1.530241, -1.76279, -2.311357, 1, 0.4039216, 0, 1,
-1.529781, -1.042449, -4.341068, 1, 0.4078431, 0, 1,
-1.527079, -0.5893181, -1.622503, 1, 0.4156863, 0, 1,
-1.518732, -0.1488147, -1.32729, 1, 0.4196078, 0, 1,
-1.494545, -0.2997761, -3.014447, 1, 0.427451, 0, 1,
-1.471322, -0.8605971, -0.9994633, 1, 0.4313726, 0, 1,
-1.459182, -1.310512, -1.046464, 1, 0.4392157, 0, 1,
-1.448415, 1.311891, -1.141965, 1, 0.4431373, 0, 1,
-1.445475, -0.129327, -2.029588, 1, 0.4509804, 0, 1,
-1.442807, 0.5819348, -1.678221, 1, 0.454902, 0, 1,
-1.442231, 2.066338, 0.9284457, 1, 0.4627451, 0, 1,
-1.440138, -0.5495382, -0.4381897, 1, 0.4666667, 0, 1,
-1.439679, -1.051555, -0.250984, 1, 0.4745098, 0, 1,
-1.428391, 0.01959235, -1.339666, 1, 0.4784314, 0, 1,
-1.424912, -0.5741127, -1.770398, 1, 0.4862745, 0, 1,
-1.402689, 0.4052346, -2.102586, 1, 0.4901961, 0, 1,
-1.397795, 1.6652, -1.947079, 1, 0.4980392, 0, 1,
-1.395331, -2.651023, -1.450621, 1, 0.5058824, 0, 1,
-1.386886, 0.06331473, -1.592058, 1, 0.509804, 0, 1,
-1.385369, 0.02515945, -1.76086, 1, 0.5176471, 0, 1,
-1.379493, -0.9226637, -3.271193, 1, 0.5215687, 0, 1,
-1.379141, 0.4377756, -2.334928, 1, 0.5294118, 0, 1,
-1.373847, -0.02766921, -2.023271, 1, 0.5333334, 0, 1,
-1.37374, 0.663431, -2.145154, 1, 0.5411765, 0, 1,
-1.360262, 2.189233, 0.2699083, 1, 0.5450981, 0, 1,
-1.358201, 1.863737, -0.3185636, 1, 0.5529412, 0, 1,
-1.357273, -0.2918392, -1.927545, 1, 0.5568628, 0, 1,
-1.350548, -1.998179, -4.210491, 1, 0.5647059, 0, 1,
-1.337744, -0.04928838, -0.7276601, 1, 0.5686275, 0, 1,
-1.323396, -1.000799, -2.306878, 1, 0.5764706, 0, 1,
-1.31594, 0.003849262, -1.451211, 1, 0.5803922, 0, 1,
-1.310609, 0.8671427, 1.26123, 1, 0.5882353, 0, 1,
-1.295067, 1.899677, 0.7844217, 1, 0.5921569, 0, 1,
-1.293176, 0.1027527, -1.321515, 1, 0.6, 0, 1,
-1.290149, -3.160357, -1.456153, 1, 0.6078432, 0, 1,
-1.284541, -0.5154858, -1.834378, 1, 0.6117647, 0, 1,
-1.28392, -0.2203919, -0.2047735, 1, 0.6196079, 0, 1,
-1.281042, 0.6901669, -1.989979, 1, 0.6235294, 0, 1,
-1.266911, -1.222252, -1.356916, 1, 0.6313726, 0, 1,
-1.259456, 0.2163946, -1.529109, 1, 0.6352941, 0, 1,
-1.254492, 0.2887769, -2.44241, 1, 0.6431373, 0, 1,
-1.247449, 0.4637752, -1.225206, 1, 0.6470588, 0, 1,
-1.244112, -0.4931583, -0.3923109, 1, 0.654902, 0, 1,
-1.238113, 2.026183, 0.05555096, 1, 0.6588235, 0, 1,
-1.235364, 0.3072655, -1.196448, 1, 0.6666667, 0, 1,
-1.232615, 0.264069, -0.4545548, 1, 0.6705883, 0, 1,
-1.232059, -0.091612, -1.023853, 1, 0.6784314, 0, 1,
-1.231167, -0.9829029, -1.369913, 1, 0.682353, 0, 1,
-1.223242, 1.48181, -0.7660799, 1, 0.6901961, 0, 1,
-1.221073, -1.60611, -3.065802, 1, 0.6941177, 0, 1,
-1.219317, -1.647006, -2.855072, 1, 0.7019608, 0, 1,
-1.217923, 0.3733501, -1.706221, 1, 0.7098039, 0, 1,
-1.215371, -0.8695042, -3.785273, 1, 0.7137255, 0, 1,
-1.211639, -1.46137, -2.78683, 1, 0.7215686, 0, 1,
-1.20767, -0.4326139, -2.588723, 1, 0.7254902, 0, 1,
-1.20551, -0.9001973, -3.633502, 1, 0.7333333, 0, 1,
-1.205427, -0.6172912, -0.578147, 1, 0.7372549, 0, 1,
-1.197368, -0.6940191, -3.882936, 1, 0.7450981, 0, 1,
-1.186983, 0.07660121, -2.351021, 1, 0.7490196, 0, 1,
-1.18375, -0.6248547, -2.405439, 1, 0.7568628, 0, 1,
-1.176304, 0.6670234, -0.06631297, 1, 0.7607843, 0, 1,
-1.169312, -0.6058032, -1.740406, 1, 0.7686275, 0, 1,
-1.16522, -1.840404, -2.952474, 1, 0.772549, 0, 1,
-1.159695, 0.2820501, -1.323735, 1, 0.7803922, 0, 1,
-1.158967, -0.4299246, -1.930719, 1, 0.7843137, 0, 1,
-1.12973, -0.3549477, -2.293237, 1, 0.7921569, 0, 1,
-1.12177, 0.5973685, -1.260867, 1, 0.7960784, 0, 1,
-1.114414, -0.09607083, -1.918064, 1, 0.8039216, 0, 1,
-1.108246, 0.09353462, -2.587532, 1, 0.8117647, 0, 1,
-1.103429, 0.1612477, -1.473645, 1, 0.8156863, 0, 1,
-1.099855, 0.7432904, -0.1975821, 1, 0.8235294, 0, 1,
-1.097399, 0.3935621, -1.472603, 1, 0.827451, 0, 1,
-1.097163, -0.2487044, -3.270041, 1, 0.8352941, 0, 1,
-1.091069, -0.5602081, 0.125622, 1, 0.8392157, 0, 1,
-1.083495, 1.404508, -1.705374, 1, 0.8470588, 0, 1,
-1.082391, 0.2827741, -2.049624, 1, 0.8509804, 0, 1,
-1.082055, -0.3755597, -1.51165, 1, 0.8588235, 0, 1,
-1.080607, -0.3155126, -2.296993, 1, 0.8627451, 0, 1,
-1.078124, 0.822687, -0.9787439, 1, 0.8705882, 0, 1,
-1.073293, -0.06054454, -1.032544, 1, 0.8745098, 0, 1,
-1.071221, 0.3583395, -1.075375, 1, 0.8823529, 0, 1,
-1.06812, 0.116254, -0.6363866, 1, 0.8862745, 0, 1,
-1.0669, 0.1192381, 0.4510155, 1, 0.8941177, 0, 1,
-1.062388, -0.5281024, -2.142209, 1, 0.8980392, 0, 1,
-1.05614, -0.0536783, -1.076345, 1, 0.9058824, 0, 1,
-1.046739, -0.9509678, -0.5077939, 1, 0.9137255, 0, 1,
-1.043071, 0.3874887, -1.35525, 1, 0.9176471, 0, 1,
-1.035399, 0.4785461, -1.637993, 1, 0.9254902, 0, 1,
-1.029739, -0.8971785, -1.885936, 1, 0.9294118, 0, 1,
-1.027733, 1.423226, -0.311123, 1, 0.9372549, 0, 1,
-1.027364, 1.578909, -1.034116, 1, 0.9411765, 0, 1,
-1.021171, -1.553041, -4.05616, 1, 0.9490196, 0, 1,
-1.018648, 0.6862125, 0.3711137, 1, 0.9529412, 0, 1,
-1.018164, 0.9630498, -2.159675, 1, 0.9607843, 0, 1,
-1.013232, 1.019247, -1.455342, 1, 0.9647059, 0, 1,
-0.9977618, -1.703512, -2.30153, 1, 0.972549, 0, 1,
-0.9950493, -0.6497525, -3.54363, 1, 0.9764706, 0, 1,
-0.9947162, -2.150246, -4.354825, 1, 0.9843137, 0, 1,
-0.9940915, 0.2916748, -1.089283, 1, 0.9882353, 0, 1,
-0.9940823, -1.176192, -1.530026, 1, 0.9960784, 0, 1,
-0.9883927, 0.5482656, -0.3347894, 0.9960784, 1, 0, 1,
-0.9695414, -1.075351, -1.122877, 0.9921569, 1, 0, 1,
-0.9650759, -1.399158, -2.093836, 0.9843137, 1, 0, 1,
-0.9649601, 0.52245, -1.5411, 0.9803922, 1, 0, 1,
-0.9649104, -0.7186246, -1.418759, 0.972549, 1, 0, 1,
-0.9624296, -0.7959599, 0.459178, 0.9686275, 1, 0, 1,
-0.9601694, -0.1321338, -0.8625354, 0.9607843, 1, 0, 1,
-0.948411, 0.8758151, 0.3716403, 0.9568627, 1, 0, 1,
-0.9482851, 1.43998, -0.7626356, 0.9490196, 1, 0, 1,
-0.9447437, -1.057745, -1.780285, 0.945098, 1, 0, 1,
-0.9422022, -0.05943352, 0.03028294, 0.9372549, 1, 0, 1,
-0.9380862, 0.7807211, -0.7432168, 0.9333333, 1, 0, 1,
-0.9291086, -0.2247186, -0.8001202, 0.9254902, 1, 0, 1,
-0.9289047, -0.2751914, -0.5606274, 0.9215686, 1, 0, 1,
-0.9277411, 0.3045978, -0.8993167, 0.9137255, 1, 0, 1,
-0.9243886, -0.3668757, -1.641905, 0.9098039, 1, 0, 1,
-0.9229727, -0.8367705, -3.527268, 0.9019608, 1, 0, 1,
-0.9214882, -0.3852519, -2.206803, 0.8941177, 1, 0, 1,
-0.9193494, 0.7015135, -0.8637216, 0.8901961, 1, 0, 1,
-0.9103864, 1.267683, -1.064245, 0.8823529, 1, 0, 1,
-0.9099723, -0.9946583, -2.177309, 0.8784314, 1, 0, 1,
-0.9098595, -1.318109, -4.265061, 0.8705882, 1, 0, 1,
-0.9064882, -0.9801786, -2.709378, 0.8666667, 1, 0, 1,
-0.9000012, 0.3808425, 0.8998549, 0.8588235, 1, 0, 1,
-0.8999274, 0.005369304, -2.273143, 0.854902, 1, 0, 1,
-0.8747804, 1.592397, 1.538883, 0.8470588, 1, 0, 1,
-0.868308, 0.5842089, 1.147559, 0.8431373, 1, 0, 1,
-0.8442591, -0.2367087, -0.5612966, 0.8352941, 1, 0, 1,
-0.8432629, -1.109067, -1.249694, 0.8313726, 1, 0, 1,
-0.8420051, -0.2101761, -1.470818, 0.8235294, 1, 0, 1,
-0.8357301, 1.684687, 0.1767738, 0.8196079, 1, 0, 1,
-0.8302731, -0.2037936, -1.360493, 0.8117647, 1, 0, 1,
-0.8241975, -2.12772, -1.874672, 0.8078431, 1, 0, 1,
-0.805092, -0.2376497, -3.486571, 0.8, 1, 0, 1,
-0.804842, 1.577249, -1.984728, 0.7921569, 1, 0, 1,
-0.7935781, 0.8676702, -0.5001407, 0.7882353, 1, 0, 1,
-0.7895688, -1.092294, -2.012972, 0.7803922, 1, 0, 1,
-0.7865868, -0.9004454, -1.761516, 0.7764706, 1, 0, 1,
-0.785455, 1.993655, -0.6457546, 0.7686275, 1, 0, 1,
-0.7821431, 0.6567258, -0.4156689, 0.7647059, 1, 0, 1,
-0.7811219, -0.3875787, -0.3117365, 0.7568628, 1, 0, 1,
-0.7754317, -2.031153, -4.90239, 0.7529412, 1, 0, 1,
-0.7743525, -1.082111, -0.5669686, 0.7450981, 1, 0, 1,
-0.7730995, -0.4709224, -3.007692, 0.7411765, 1, 0, 1,
-0.7710999, 1.345594, 0.9520205, 0.7333333, 1, 0, 1,
-0.7667347, -1.362358, -3.109091, 0.7294118, 1, 0, 1,
-0.7660455, 0.1240576, -1.616246, 0.7215686, 1, 0, 1,
-0.7625343, 1.433409, -2.181154, 0.7176471, 1, 0, 1,
-0.7548509, -0.4027562, -2.900454, 0.7098039, 1, 0, 1,
-0.7524404, -0.4046492, -2.4858, 0.7058824, 1, 0, 1,
-0.7492552, -0.829729, -2.46268, 0.6980392, 1, 0, 1,
-0.7465045, -0.4913817, -1.822951, 0.6901961, 1, 0, 1,
-0.7461203, -2.112858, -1.504343, 0.6862745, 1, 0, 1,
-0.7422541, 1.151841, 1.613325, 0.6784314, 1, 0, 1,
-0.7416973, 1.743895, -1.438075, 0.6745098, 1, 0, 1,
-0.7410675, -0.7983641, -2.912363, 0.6666667, 1, 0, 1,
-0.739878, -1.431061, -2.422037, 0.6627451, 1, 0, 1,
-0.7371777, 0.1850606, -2.272262, 0.654902, 1, 0, 1,
-0.7355497, 1.090989, -0.2521767, 0.6509804, 1, 0, 1,
-0.7346597, -2.266147, -3.916395, 0.6431373, 1, 0, 1,
-0.7344246, 0.129706, -3.020058, 0.6392157, 1, 0, 1,
-0.733712, 0.9983022, -1.752186, 0.6313726, 1, 0, 1,
-0.7254755, 0.9893473, -2.039459, 0.627451, 1, 0, 1,
-0.7225785, -0.6329961, -0.2339981, 0.6196079, 1, 0, 1,
-0.7201365, -1.545151, -1.527346, 0.6156863, 1, 0, 1,
-0.7157807, 0.1404371, -1.083734, 0.6078432, 1, 0, 1,
-0.7141008, 1.051368, 1.272456, 0.6039216, 1, 0, 1,
-0.7128127, 0.04612059, -0.8759005, 0.5960785, 1, 0, 1,
-0.7061843, 0.3353607, -1.762876, 0.5882353, 1, 0, 1,
-0.6953062, 1.699502, -1.57882, 0.5843138, 1, 0, 1,
-0.688547, -1.667638, -3.136541, 0.5764706, 1, 0, 1,
-0.6883456, 1.033694, 0.6869361, 0.572549, 1, 0, 1,
-0.6858721, -1.40715, -0.8772756, 0.5647059, 1, 0, 1,
-0.6834259, -0.7305055, -3.851704, 0.5607843, 1, 0, 1,
-0.6741313, -0.8336258, -2.85141, 0.5529412, 1, 0, 1,
-0.6713405, 0.04096761, -3.584146, 0.5490196, 1, 0, 1,
-0.6685378, 1.186321, -0.5899806, 0.5411765, 1, 0, 1,
-0.6667594, -0.05373627, -4.014332, 0.5372549, 1, 0, 1,
-0.6573288, 1.569185, -0.4954231, 0.5294118, 1, 0, 1,
-0.6557429, 0.7529353, -1.081462, 0.5254902, 1, 0, 1,
-0.6552263, -0.178759, -3.465019, 0.5176471, 1, 0, 1,
-0.65514, -0.261699, -2.651061, 0.5137255, 1, 0, 1,
-0.6545199, 0.8509567, -0.5071106, 0.5058824, 1, 0, 1,
-0.6478893, -0.3759578, -1.465685, 0.5019608, 1, 0, 1,
-0.644558, -1.545016, -2.358921, 0.4941176, 1, 0, 1,
-0.6368977, -0.07865541, -1.296658, 0.4862745, 1, 0, 1,
-0.6311222, 0.5876304, 0.797651, 0.4823529, 1, 0, 1,
-0.6284094, 1.850116, 0.04388523, 0.4745098, 1, 0, 1,
-0.6209567, -1.540252, -2.880851, 0.4705882, 1, 0, 1,
-0.6189789, 0.3496799, -0.6820921, 0.4627451, 1, 0, 1,
-0.6171417, -0.2768142, -2.299657, 0.4588235, 1, 0, 1,
-0.6155152, -1.445205, -1.672371, 0.4509804, 1, 0, 1,
-0.6152492, 1.514256, -1.861866, 0.4470588, 1, 0, 1,
-0.6109209, -0.7719979, -2.73762, 0.4392157, 1, 0, 1,
-0.6097986, -1.371438, -3.302333, 0.4352941, 1, 0, 1,
-0.6040546, -1.063468, -3.935851, 0.427451, 1, 0, 1,
-0.6026406, 1.151941, -1.104275, 0.4235294, 1, 0, 1,
-0.6022291, 0.9256954, 0.3598347, 0.4156863, 1, 0, 1,
-0.6001903, 1.361548, -0.8843088, 0.4117647, 1, 0, 1,
-0.5922462, -0.896069, -4.025377, 0.4039216, 1, 0, 1,
-0.5832959, -0.3680696, -2.311272, 0.3960784, 1, 0, 1,
-0.5831528, 0.3606928, -3.508535, 0.3921569, 1, 0, 1,
-0.5794303, 0.8206767, -0.1512986, 0.3843137, 1, 0, 1,
-0.571678, -0.2642861, -1.035033, 0.3803922, 1, 0, 1,
-0.5709813, 0.07176777, -1.626275, 0.372549, 1, 0, 1,
-0.5633882, -0.2729851, -1.594731, 0.3686275, 1, 0, 1,
-0.5628789, -0.6504601, -2.343383, 0.3607843, 1, 0, 1,
-0.5617834, -0.2244031, -0.7931027, 0.3568628, 1, 0, 1,
-0.5609873, 0.6936958, -0.4587579, 0.3490196, 1, 0, 1,
-0.5595106, 0.3342477, -0.09174974, 0.345098, 1, 0, 1,
-0.5592768, 0.5254174, -1.733232, 0.3372549, 1, 0, 1,
-0.553494, -1.020174, -2.950608, 0.3333333, 1, 0, 1,
-0.5494674, 1.203716, -0.2033443, 0.3254902, 1, 0, 1,
-0.5444714, -1.599562, -4.153947, 0.3215686, 1, 0, 1,
-0.5406924, 0.6465775, -1.566569, 0.3137255, 1, 0, 1,
-0.5392094, -2.495133, -1.437032, 0.3098039, 1, 0, 1,
-0.532534, 0.2760984, -1.967447, 0.3019608, 1, 0, 1,
-0.5280964, -0.6438963, -2.553844, 0.2941177, 1, 0, 1,
-0.5234263, 0.2613297, 0.08123105, 0.2901961, 1, 0, 1,
-0.5197868, 0.5437863, 0.4220911, 0.282353, 1, 0, 1,
-0.5119084, -0.7965879, -2.509612, 0.2784314, 1, 0, 1,
-0.5104007, 1.827454, 1.131998, 0.2705882, 1, 0, 1,
-0.5010292, 0.491273, -1.592268, 0.2666667, 1, 0, 1,
-0.4957868, -0.1281607, -2.938468, 0.2588235, 1, 0, 1,
-0.4918759, -0.7500772, -1.236951, 0.254902, 1, 0, 1,
-0.4884023, -0.6303157, -3.096429, 0.2470588, 1, 0, 1,
-0.4815486, 0.4739308, -0.6126562, 0.2431373, 1, 0, 1,
-0.4770099, 0.6796671, -0.9711835, 0.2352941, 1, 0, 1,
-0.4769047, 1.499205, 0.8787503, 0.2313726, 1, 0, 1,
-0.4705986, -0.03939014, -2.629313, 0.2235294, 1, 0, 1,
-0.4686735, 0.6885519, 0.2855545, 0.2196078, 1, 0, 1,
-0.4664221, -0.8841938, -2.85296, 0.2117647, 1, 0, 1,
-0.4661008, -0.5601668, -2.734703, 0.2078431, 1, 0, 1,
-0.4637761, -0.3271016, -2.232399, 0.2, 1, 0, 1,
-0.4632065, -0.6319907, -3.161808, 0.1921569, 1, 0, 1,
-0.4623761, 0.19733, -0.2214925, 0.1882353, 1, 0, 1,
-0.4609838, -0.5963023, -2.625825, 0.1803922, 1, 0, 1,
-0.4607181, 0.4172435, -1.266868, 0.1764706, 1, 0, 1,
-0.4603639, -0.2418995, -2.581925, 0.1686275, 1, 0, 1,
-0.4588151, -0.9047362, -1.452809, 0.1647059, 1, 0, 1,
-0.4555353, 0.6103882, -0.03543552, 0.1568628, 1, 0, 1,
-0.4532196, -0.7253013, -0.8089561, 0.1529412, 1, 0, 1,
-0.4500763, -2.424922, -2.622206, 0.145098, 1, 0, 1,
-0.4457397, 0.5734246, -0.8655628, 0.1411765, 1, 0, 1,
-0.4441261, -1.023359, -2.207097, 0.1333333, 1, 0, 1,
-0.4400906, -0.425233, -3.83619, 0.1294118, 1, 0, 1,
-0.4336818, 0.9119945, -1.881009, 0.1215686, 1, 0, 1,
-0.4333745, -0.2581666, -3.097638, 0.1176471, 1, 0, 1,
-0.4251058, -0.6208542, -2.51682, 0.1098039, 1, 0, 1,
-0.4243399, -0.7514865, -4.108716, 0.1058824, 1, 0, 1,
-0.4187149, -0.8034236, -3.418952, 0.09803922, 1, 0, 1,
-0.4174688, -1.408565, -1.929836, 0.09019608, 1, 0, 1,
-0.4167474, -1.274939, -2.775692, 0.08627451, 1, 0, 1,
-0.4159302, 0.2994316, 0.4833521, 0.07843138, 1, 0, 1,
-0.4148439, 0.529517, -1.383066, 0.07450981, 1, 0, 1,
-0.4141205, 1.78766, 0.4155794, 0.06666667, 1, 0, 1,
-0.4120257, -0.4573765, -0.4433225, 0.0627451, 1, 0, 1,
-0.4111525, 0.1386137, -2.663062, 0.05490196, 1, 0, 1,
-0.4105041, -0.8265609, -1.375871, 0.05098039, 1, 0, 1,
-0.4078131, -0.04598283, -0.7430384, 0.04313726, 1, 0, 1,
-0.4021255, 0.41587, -0.7925529, 0.03921569, 1, 0, 1,
-0.4005183, -1.369363, -3.064373, 0.03137255, 1, 0, 1,
-0.3979154, -0.0003113227, -1.254973, 0.02745098, 1, 0, 1,
-0.3974975, -0.3950424, -2.552609, 0.01960784, 1, 0, 1,
-0.395698, 1.710247, -0.1563545, 0.01568628, 1, 0, 1,
-0.3939028, -1.593724, -0.9969084, 0.007843138, 1, 0, 1,
-0.3917719, 1.851928, 1.442846, 0.003921569, 1, 0, 1,
-0.3908538, 0.04909238, 0.237665, 0, 1, 0.003921569, 1,
-0.3893169, -0.4946658, -2.46757, 0, 1, 0.01176471, 1,
-0.3870948, 1.27999, -0.5901319, 0, 1, 0.01568628, 1,
-0.3855694, -0.3174658, -1.922551, 0, 1, 0.02352941, 1,
-0.3803985, 0.2970268, -0.4196834, 0, 1, 0.02745098, 1,
-0.3744311, -0.8641534, -1.99901, 0, 1, 0.03529412, 1,
-0.3680024, -0.624203, -2.943206, 0, 1, 0.03921569, 1,
-0.3657852, 0.5158945, -0.3770043, 0, 1, 0.04705882, 1,
-0.3652123, 0.1439866, -1.6554, 0, 1, 0.05098039, 1,
-0.3635677, 0.843638, -0.9348788, 0, 1, 0.05882353, 1,
-0.3621657, 0.1752599, -0.8077781, 0, 1, 0.0627451, 1,
-0.3599472, -1.647051, -4.017994, 0, 1, 0.07058824, 1,
-0.3522621, -1.573955, -3.920958, 0, 1, 0.07450981, 1,
-0.3509689, -1.15088, -1.432476, 0, 1, 0.08235294, 1,
-0.3484505, 0.5556818, 1.398126, 0, 1, 0.08627451, 1,
-0.3470245, 0.2574262, -1.290773, 0, 1, 0.09411765, 1,
-0.3398807, 0.07828267, -1.346303, 0, 1, 0.1019608, 1,
-0.3398471, -1.039892, -3.26811, 0, 1, 0.1058824, 1,
-0.339732, -0.36758, -2.1528, 0, 1, 0.1137255, 1,
-0.3389649, 0.03665271, -1.550676, 0, 1, 0.1176471, 1,
-0.3388219, 1.009563, -1.516321, 0, 1, 0.1254902, 1,
-0.3347166, -0.9433554, -1.81491, 0, 1, 0.1294118, 1,
-0.3315117, 0.1618181, -0.05749545, 0, 1, 0.1372549, 1,
-0.3294036, -1.179124, -1.15957, 0, 1, 0.1411765, 1,
-0.3287552, -0.03793394, -0.8565828, 0, 1, 0.1490196, 1,
-0.3273888, 0.09131547, -1.803658, 0, 1, 0.1529412, 1,
-0.3260277, -0.5288532, -2.36147, 0, 1, 0.1607843, 1,
-0.3222383, 0.2986688, -0.1264291, 0, 1, 0.1647059, 1,
-0.3191641, 2.05012, -0.252983, 0, 1, 0.172549, 1,
-0.3168498, 2.224899, -0.5072944, 0, 1, 0.1764706, 1,
-0.3123127, 1.48814, 1.092369, 0, 1, 0.1843137, 1,
-0.306707, -0.06109672, -2.165554, 0, 1, 0.1882353, 1,
-0.2981842, -1.164487, -3.026218, 0, 1, 0.1960784, 1,
-0.297195, -0.1977046, -1.40337, 0, 1, 0.2039216, 1,
-0.2950879, -0.4361815, -2.464429, 0, 1, 0.2078431, 1,
-0.2909839, -0.724533, -2.19602, 0, 1, 0.2156863, 1,
-0.287641, 0.3459211, -2.312713, 0, 1, 0.2196078, 1,
-0.2867311, 0.5078381, 0.7539681, 0, 1, 0.227451, 1,
-0.2821261, 0.03788121, 0.5862669, 0, 1, 0.2313726, 1,
-0.2813101, -1.431179, -0.9634191, 0, 1, 0.2392157, 1,
-0.2810532, -0.6653332, -0.8579317, 0, 1, 0.2431373, 1,
-0.2764566, -0.3762376, -3.104766, 0, 1, 0.2509804, 1,
-0.2735547, -2.333803, -2.731079, 0, 1, 0.254902, 1,
-0.2717692, 0.495057, -1.235175, 0, 1, 0.2627451, 1,
-0.2711156, -0.8759462, -3.375385, 0, 1, 0.2666667, 1,
-0.270348, 0.007647321, -0.2518955, 0, 1, 0.2745098, 1,
-0.2677227, 0.4021848, -2.204841, 0, 1, 0.2784314, 1,
-0.2587862, -0.5825852, -2.19859, 0, 1, 0.2862745, 1,
-0.2520851, -0.007289869, -0.8338099, 0, 1, 0.2901961, 1,
-0.2503158, -0.6158264, -2.448098, 0, 1, 0.2980392, 1,
-0.2502555, -0.5313289, -1.440239, 0, 1, 0.3058824, 1,
-0.2497262, 0.05768842, 0.1166671, 0, 1, 0.3098039, 1,
-0.2374589, -1.424976, -3.031788, 0, 1, 0.3176471, 1,
-0.2370183, -2.427913, -4.003056, 0, 1, 0.3215686, 1,
-0.228013, 0.3830035, -1.861781, 0, 1, 0.3294118, 1,
-0.2258558, -1.67449, -2.009892, 0, 1, 0.3333333, 1,
-0.2254447, 0.7320499, -0.6811257, 0, 1, 0.3411765, 1,
-0.2249726, 1.332204, -0.292337, 0, 1, 0.345098, 1,
-0.2232533, -0.1166205, -2.585382, 0, 1, 0.3529412, 1,
-0.2227086, -0.4987599, -2.876948, 0, 1, 0.3568628, 1,
-0.2216063, 1.30789, -1.53329, 0, 1, 0.3647059, 1,
-0.2171214, 2.212656, 0.02521241, 0, 1, 0.3686275, 1,
-0.2153232, -1.058459, -4.811729, 0, 1, 0.3764706, 1,
-0.2133983, -1.023914, -3.496094, 0, 1, 0.3803922, 1,
-0.2128965, -1.092645, -1.022455, 0, 1, 0.3882353, 1,
-0.2070809, 0.443847, 0.540345, 0, 1, 0.3921569, 1,
-0.2016108, -0.9959898, -2.822051, 0, 1, 0.4, 1,
-0.2011078, -1.312354, -3.270258, 0, 1, 0.4078431, 1,
-0.2005254, -0.5431634, -0.9856034, 0, 1, 0.4117647, 1,
-0.199828, 2.043076, 0.3022245, 0, 1, 0.4196078, 1,
-0.1985115, 0.8901006, -1.93844, 0, 1, 0.4235294, 1,
-0.1934512, 0.04420517, -1.531272, 0, 1, 0.4313726, 1,
-0.1907326, 0.5872432, -1.024694, 0, 1, 0.4352941, 1,
-0.188644, -1.656003, -2.284233, 0, 1, 0.4431373, 1,
-0.1830681, -1.230326, -3.752256, 0, 1, 0.4470588, 1,
-0.1781962, 0.05661535, -2.003257, 0, 1, 0.454902, 1,
-0.1749279, -0.9249305, -2.794567, 0, 1, 0.4588235, 1,
-0.1726412, -0.0187482, -1.980763, 0, 1, 0.4666667, 1,
-0.171369, -1.194635, -3.842962, 0, 1, 0.4705882, 1,
-0.1679345, -0.4668404, -2.272581, 0, 1, 0.4784314, 1,
-0.1674886, 1.740872, -0.6168708, 0, 1, 0.4823529, 1,
-0.1642014, 0.576081, -1.906191, 0, 1, 0.4901961, 1,
-0.1632003, 0.9057027, 0.101604, 0, 1, 0.4941176, 1,
-0.1601143, -0.6834924, -4.305952, 0, 1, 0.5019608, 1,
-0.1501411, 0.3167482, -1.978989, 0, 1, 0.509804, 1,
-0.1468169, 0.5153731, 0.6074535, 0, 1, 0.5137255, 1,
-0.140817, 0.5849147, 2.251642, 0, 1, 0.5215687, 1,
-0.1374064, -0.6943207, -2.817713, 0, 1, 0.5254902, 1,
-0.1355015, -0.2372501, -4.213546, 0, 1, 0.5333334, 1,
-0.135241, -0.2137682, -2.926747, 0, 1, 0.5372549, 1,
-0.1349151, 0.02410422, -3.79433, 0, 1, 0.5450981, 1,
-0.1337317, -1.048234, -2.588773, 0, 1, 0.5490196, 1,
-0.1303483, -0.3389954, -3.972761, 0, 1, 0.5568628, 1,
-0.1276161, 0.8254352, -0.960394, 0, 1, 0.5607843, 1,
-0.1249378, -0.2644849, -4.199372, 0, 1, 0.5686275, 1,
-0.1243071, -0.4619492, -1.068671, 0, 1, 0.572549, 1,
-0.1173273, -0.155557, -1.466519, 0, 1, 0.5803922, 1,
-0.1136911, -0.4430567, -2.911575, 0, 1, 0.5843138, 1,
-0.1087041, 0.822983, -0.526363, 0, 1, 0.5921569, 1,
-0.1073297, 1.393543, 0.01416744, 0, 1, 0.5960785, 1,
-0.1072438, -0.3818825, -4.432218, 0, 1, 0.6039216, 1,
-0.1046274, 2.121445, -1.018803, 0, 1, 0.6117647, 1,
-0.09787586, 0.3840835, 1.186039, 0, 1, 0.6156863, 1,
-0.09508821, 0.4094121, 0.9142873, 0, 1, 0.6235294, 1,
-0.09394505, 0.985401, -0.272204, 0, 1, 0.627451, 1,
-0.09169713, 0.4434883, 0.5703244, 0, 1, 0.6352941, 1,
-0.09155882, 1.811905, 1.835563, 0, 1, 0.6392157, 1,
-0.09058196, 0.1660711, -0.7006049, 0, 1, 0.6470588, 1,
-0.08996467, 1.719863, -0.3702243, 0, 1, 0.6509804, 1,
-0.0881726, 0.5505899, 0.4617231, 0, 1, 0.6588235, 1,
-0.08317369, -1.533127, -2.600861, 0, 1, 0.6627451, 1,
-0.08203903, -0.7291846, -2.543375, 0, 1, 0.6705883, 1,
-0.0786849, -0.9958261, -0.7262633, 0, 1, 0.6745098, 1,
-0.07578603, -1.573954, -3.026268, 0, 1, 0.682353, 1,
-0.06701652, 0.3151086, -0.8583045, 0, 1, 0.6862745, 1,
-0.06511268, -1.181547, -2.017747, 0, 1, 0.6941177, 1,
-0.06386593, -0.583589, -4.622246, 0, 1, 0.7019608, 1,
-0.06380016, 0.4447691, 1.073159, 0, 1, 0.7058824, 1,
-0.06304076, 0.3358105, -0.7813511, 0, 1, 0.7137255, 1,
-0.06061675, 0.1484736, 0.97381, 0, 1, 0.7176471, 1,
-0.06008742, -0.699516, -2.430001, 0, 1, 0.7254902, 1,
-0.05900241, -0.7716416, -0.9831895, 0, 1, 0.7294118, 1,
-0.05770552, 1.23565, 0.9221321, 0, 1, 0.7372549, 1,
-0.05474338, -2.001624, -3.085189, 0, 1, 0.7411765, 1,
-0.05052679, -0.07040861, -0.1106212, 0, 1, 0.7490196, 1,
-0.04829071, -1.098952, -4.407989, 0, 1, 0.7529412, 1,
-0.04704951, -0.7443599, -4.480734, 0, 1, 0.7607843, 1,
-0.04120276, -2.299161, -3.426052, 0, 1, 0.7647059, 1,
-0.04027639, -1.407127, -1.816925, 0, 1, 0.772549, 1,
-0.03895498, 2.333158, -0.7388654, 0, 1, 0.7764706, 1,
-0.0381298, 0.3224072, -0.3330008, 0, 1, 0.7843137, 1,
-0.03282601, -1.776931, -2.910381, 0, 1, 0.7882353, 1,
-0.02988854, -0.3199823, -2.443009, 0, 1, 0.7960784, 1,
-0.02920269, 1.604316, -2.473561, 0, 1, 0.8039216, 1,
-0.02390566, -0.3153061, -4.04239, 0, 1, 0.8078431, 1,
-0.02335678, -1.204569, -3.771332, 0, 1, 0.8156863, 1,
-0.02335221, -1.541283, -2.734666, 0, 1, 0.8196079, 1,
-0.02274711, 1.027502, -1.121279, 0, 1, 0.827451, 1,
-0.0196904, -0.7969326, -4.98536, 0, 1, 0.8313726, 1,
-0.01962449, -0.4059575, -1.956104, 0, 1, 0.8392157, 1,
-0.01937799, -0.8260389, -3.020565, 0, 1, 0.8431373, 1,
-0.01773468, 0.6677667, 1.057133, 0, 1, 0.8509804, 1,
-0.0161803, 0.8008873, -0.302213, 0, 1, 0.854902, 1,
-0.01606352, 1.229941, 1.472269, 0, 1, 0.8627451, 1,
-0.01484272, 0.7075218, -0.1228328, 0, 1, 0.8666667, 1,
-0.01483745, -1.319806, -3.737949, 0, 1, 0.8745098, 1,
-0.01285469, -0.7346871, -4.471077, 0, 1, 0.8784314, 1,
-0.01275221, 0.315504, -2.120701, 0, 1, 0.8862745, 1,
-0.0109677, 0.4638645, -1.686921, 0, 1, 0.8901961, 1,
-0.009539134, 2.909157, 0.9185939, 0, 1, 0.8980392, 1,
-0.007633671, 0.6965671, -1.066853, 0, 1, 0.9058824, 1,
-0.005112512, -1.502515, -3.804201, 0, 1, 0.9098039, 1,
-0.002813492, -0.8252999, -4.582062, 0, 1, 0.9176471, 1,
-0.0006062409, -0.9282342, -3.228885, 0, 1, 0.9215686, 1,
0.001221582, -0.09785682, 4.184674, 0, 1, 0.9294118, 1,
0.009564736, -0.07554478, 3.779463, 0, 1, 0.9333333, 1,
0.01329339, 0.412416, -2.061898, 0, 1, 0.9411765, 1,
0.01354215, -0.6409348, 2.356467, 0, 1, 0.945098, 1,
0.01507075, 0.04605483, -1.732393, 0, 1, 0.9529412, 1,
0.01641438, 1.331477, -0.3514113, 0, 1, 0.9568627, 1,
0.02024351, -0.7918194, 5.779564, 0, 1, 0.9647059, 1,
0.02033228, 0.01916959, 2.371001, 0, 1, 0.9686275, 1,
0.02129651, -1.260488, 2.74247, 0, 1, 0.9764706, 1,
0.02416332, -0.8681894, 2.249278, 0, 1, 0.9803922, 1,
0.02437576, 0.7791094, 1.617664, 0, 1, 0.9882353, 1,
0.02789717, -0.07281164, 3.364652, 0, 1, 0.9921569, 1,
0.02793714, 0.2892795, -1.977041, 0, 1, 1, 1,
0.02928224, -0.5351254, 2.292378, 0, 0.9921569, 1, 1,
0.02964061, -0.8178236, 4.018339, 0, 0.9882353, 1, 1,
0.03012382, 1.910774, 2.418616, 0, 0.9803922, 1, 1,
0.03042417, -0.579228, 3.529871, 0, 0.9764706, 1, 1,
0.03120819, 0.622185, 1.168121, 0, 0.9686275, 1, 1,
0.0312133, -0.8501843, 2.762177, 0, 0.9647059, 1, 1,
0.03347863, -0.9773934, 3.822122, 0, 0.9568627, 1, 1,
0.03359987, -0.3325241, 2.850698, 0, 0.9529412, 1, 1,
0.03985078, 1.313152, 0.2918177, 0, 0.945098, 1, 1,
0.04257574, 0.3829952, -0.002262029, 0, 0.9411765, 1, 1,
0.04521793, 1.017655, -1.490193, 0, 0.9333333, 1, 1,
0.0471642, -1.972295, 2.675747, 0, 0.9294118, 1, 1,
0.05037267, 0.09571414, 0.3765656, 0, 0.9215686, 1, 1,
0.05162904, -1.138725, 3.724257, 0, 0.9176471, 1, 1,
0.05447407, 1.466564, -0.4365672, 0, 0.9098039, 1, 1,
0.05809897, 0.4462355, 0.04675373, 0, 0.9058824, 1, 1,
0.062996, -0.6801434, 1.942559, 0, 0.8980392, 1, 1,
0.06369132, 0.9935366, 0.07330455, 0, 0.8901961, 1, 1,
0.06622364, -0.6596121, 2.951311, 0, 0.8862745, 1, 1,
0.06920667, 0.2389407, 0.3204615, 0, 0.8784314, 1, 1,
0.07542229, -0.4334923, 3.34697, 0, 0.8745098, 1, 1,
0.07947709, 0.03559709, 1.310941, 0, 0.8666667, 1, 1,
0.08202387, 0.2162648, 0.6865503, 0, 0.8627451, 1, 1,
0.08226153, -0.01152152, 3.208919, 0, 0.854902, 1, 1,
0.08249152, -0.6454792, 5.468235, 0, 0.8509804, 1, 1,
0.08371269, 0.2115145, 1.170008, 0, 0.8431373, 1, 1,
0.08464722, 0.9310705, 0.1085233, 0, 0.8392157, 1, 1,
0.0852509, -0.4381105, 3.285537, 0, 0.8313726, 1, 1,
0.08612002, -0.7137116, 4.045336, 0, 0.827451, 1, 1,
0.08617537, -0.1967944, 2.097395, 0, 0.8196079, 1, 1,
0.08770294, -1.219742, 3.594809, 0, 0.8156863, 1, 1,
0.08814237, -0.5343912, 2.077615, 0, 0.8078431, 1, 1,
0.08931982, -1.681221, 3.929751, 0, 0.8039216, 1, 1,
0.08993699, 3.457259, -0.3099266, 0, 0.7960784, 1, 1,
0.09399299, 0.7281607, -1.164008, 0, 0.7882353, 1, 1,
0.09651423, 0.8838871, 0.113213, 0, 0.7843137, 1, 1,
0.09888589, -0.5696488, 1.887252, 0, 0.7764706, 1, 1,
0.1071765, -1.013965, 2.50537, 0, 0.772549, 1, 1,
0.1076666, 1.157045, 0.4396517, 0, 0.7647059, 1, 1,
0.1081598, -0.4585347, 2.088562, 0, 0.7607843, 1, 1,
0.1096151, -0.3966101, 1.72771, 0, 0.7529412, 1, 1,
0.1168501, 1.881223, -0.3807696, 0, 0.7490196, 1, 1,
0.1170814, 0.3156638, 0.08554303, 0, 0.7411765, 1, 1,
0.120701, 0.742974, -0.514383, 0, 0.7372549, 1, 1,
0.1260144, -1.00655, 2.088031, 0, 0.7294118, 1, 1,
0.1345977, 0.7936321, -0.6277428, 0, 0.7254902, 1, 1,
0.1375476, 0.2328638, -0.1470677, 0, 0.7176471, 1, 1,
0.1376809, 0.14231, 1.426753, 0, 0.7137255, 1, 1,
0.1376824, 1.851512, 0.1902482, 0, 0.7058824, 1, 1,
0.139699, 1.712798, -1.046643, 0, 0.6980392, 1, 1,
0.1405065, -1.718116, 3.641564, 0, 0.6941177, 1, 1,
0.1430699, -0.1022102, 2.13152, 0, 0.6862745, 1, 1,
0.1458307, 0.7001863, -0.5087702, 0, 0.682353, 1, 1,
0.1461623, 0.3435853, 0.6072121, 0, 0.6745098, 1, 1,
0.1487727, 0.4138965, -0.2960706, 0, 0.6705883, 1, 1,
0.1527333, 0.5880908, -1.119216, 0, 0.6627451, 1, 1,
0.1566145, 1.193769, 1.914476, 0, 0.6588235, 1, 1,
0.1583205, -1.276578, 2.7396, 0, 0.6509804, 1, 1,
0.1609239, 0.285871, -0.9617544, 0, 0.6470588, 1, 1,
0.1623825, 0.4526839, -0.3263317, 0, 0.6392157, 1, 1,
0.1655287, 0.3782814, 0.07625478, 0, 0.6352941, 1, 1,
0.1689695, 0.6868278, -0.4596389, 0, 0.627451, 1, 1,
0.1698895, -0.07278258, 1.899318, 0, 0.6235294, 1, 1,
0.1715427, -0.5915656, 4.523794, 0, 0.6156863, 1, 1,
0.1739463, -1.17492, 3.202994, 0, 0.6117647, 1, 1,
0.1774746, 0.2942614, 0.3431552, 0, 0.6039216, 1, 1,
0.1806233, -0.9013702, 3.200775, 0, 0.5960785, 1, 1,
0.1831487, -0.230396, 1.753181, 0, 0.5921569, 1, 1,
0.1845681, 1.353435, 1.072715, 0, 0.5843138, 1, 1,
0.1849476, -0.1057588, 1.572837, 0, 0.5803922, 1, 1,
0.1869339, 1.103075, 1.20786, 0, 0.572549, 1, 1,
0.1874985, 0.3776032, -0.9088654, 0, 0.5686275, 1, 1,
0.1883018, 0.8897097, -0.2705342, 0, 0.5607843, 1, 1,
0.1927469, -1.034853, 2.59862, 0, 0.5568628, 1, 1,
0.194587, 0.625364, 0.8990023, 0, 0.5490196, 1, 1,
0.1975316, 1.513231, -1.280574, 0, 0.5450981, 1, 1,
0.1986789, -0.825581, 3.778679, 0, 0.5372549, 1, 1,
0.2011787, 0.5493785, -0.383598, 0, 0.5333334, 1, 1,
0.202587, -0.1480958, 1.290777, 0, 0.5254902, 1, 1,
0.2077146, 0.1176508, 0.4479863, 0, 0.5215687, 1, 1,
0.2080146, -0.02141631, 3.112456, 0, 0.5137255, 1, 1,
0.2087897, -0.5590027, 2.847942, 0, 0.509804, 1, 1,
0.2099367, -0.4295122, 2.110512, 0, 0.5019608, 1, 1,
0.2110905, -0.003050234, 1.844137, 0, 0.4941176, 1, 1,
0.2111639, 0.2645843, 0.672487, 0, 0.4901961, 1, 1,
0.2125913, 2.504915, 1.139044, 0, 0.4823529, 1, 1,
0.2127347, -0.1284661, 2.461349, 0, 0.4784314, 1, 1,
0.2176026, 0.8175778, 0.05830204, 0, 0.4705882, 1, 1,
0.2190777, 1.170434, -1.294739, 0, 0.4666667, 1, 1,
0.2222841, 0.8910081, 0.765277, 0, 0.4588235, 1, 1,
0.2227735, 1.83781, 0.2952081, 0, 0.454902, 1, 1,
0.2247653, 0.2470847, 1.053881, 0, 0.4470588, 1, 1,
0.2438288, 0.6250536, 0.8358847, 0, 0.4431373, 1, 1,
0.2460596, -0.550167, 4.513421, 0, 0.4352941, 1, 1,
0.2474201, -0.6046211, 3.543995, 0, 0.4313726, 1, 1,
0.2546804, -1.279371, 2.135651, 0, 0.4235294, 1, 1,
0.2552129, -0.883108, 3.502876, 0, 0.4196078, 1, 1,
0.2576797, -1.522158, 1.784428, 0, 0.4117647, 1, 1,
0.2580652, -0.4303622, 2.814583, 0, 0.4078431, 1, 1,
0.2595332, -1.484182, 2.473862, 0, 0.4, 1, 1,
0.2596189, 2.231164, 2.093774, 0, 0.3921569, 1, 1,
0.2620175, -0.7960961, 2.524746, 0, 0.3882353, 1, 1,
0.263712, -1.441423, 3.689097, 0, 0.3803922, 1, 1,
0.2679606, 1.06208, 1.980053, 0, 0.3764706, 1, 1,
0.2688173, -0.3952063, 1.101535, 0, 0.3686275, 1, 1,
0.2722426, 2.589566, 0.112551, 0, 0.3647059, 1, 1,
0.2726485, -0.04630888, 0.8896467, 0, 0.3568628, 1, 1,
0.2748886, 0.0521072, 2.383249, 0, 0.3529412, 1, 1,
0.2751149, 1.809474, 0.4030234, 0, 0.345098, 1, 1,
0.2771158, 1.056826, 0.7564601, 0, 0.3411765, 1, 1,
0.2809453, 0.9169869, 0.8277045, 0, 0.3333333, 1, 1,
0.281971, -0.8551249, 2.659147, 0, 0.3294118, 1, 1,
0.2831147, 0.3398807, 2.398279, 0, 0.3215686, 1, 1,
0.2841622, -0.757139, 4.962402, 0, 0.3176471, 1, 1,
0.2860157, 0.4666025, 0.8984081, 0, 0.3098039, 1, 1,
0.2863179, -0.4728008, 4.268243, 0, 0.3058824, 1, 1,
0.287329, 1.166632, -0.1346977, 0, 0.2980392, 1, 1,
0.2889325, -1.746027, 3.360447, 0, 0.2901961, 1, 1,
0.2894023, -0.1252459, 2.091027, 0, 0.2862745, 1, 1,
0.2894701, -0.5858094, 2.672627, 0, 0.2784314, 1, 1,
0.2909405, 0.4764419, -0.4069662, 0, 0.2745098, 1, 1,
0.303693, -0.6453183, 2.623498, 0, 0.2666667, 1, 1,
0.3048865, 0.8059301, 0.3646059, 0, 0.2627451, 1, 1,
0.3123255, -0.9944177, 0.5661497, 0, 0.254902, 1, 1,
0.3158582, 0.9855762, 0.4217718, 0, 0.2509804, 1, 1,
0.3172349, 1.593306, -1.857814, 0, 0.2431373, 1, 1,
0.3182327, -0.6908611, 3.335523, 0, 0.2392157, 1, 1,
0.3200672, 0.008412095, 1.676376, 0, 0.2313726, 1, 1,
0.3217591, -0.1045787, 1.753942, 0, 0.227451, 1, 1,
0.3257464, -0.23325, 3.493433, 0, 0.2196078, 1, 1,
0.3335516, 0.08081981, 1.591887, 0, 0.2156863, 1, 1,
0.3360707, -0.7697171, 3.529825, 0, 0.2078431, 1, 1,
0.3371346, 2.142015, -0.117654, 0, 0.2039216, 1, 1,
0.3388984, -0.6655462, 1.126075, 0, 0.1960784, 1, 1,
0.3389254, 0.3332712, 3.402659, 0, 0.1882353, 1, 1,
0.3396554, -2.487263, 2.979411, 0, 0.1843137, 1, 1,
0.3397197, 2.325269, -0.8009025, 0, 0.1764706, 1, 1,
0.3428794, -1.201302, 3.321253, 0, 0.172549, 1, 1,
0.3450456, 0.329138, 1.948518, 0, 0.1647059, 1, 1,
0.3468588, 0.1792819, -0.02483159, 0, 0.1607843, 1, 1,
0.3490275, 0.7986737, -0.6246634, 0, 0.1529412, 1, 1,
0.3500445, 1.47145, 0.850563, 0, 0.1490196, 1, 1,
0.3513905, -0.4371544, 2.161423, 0, 0.1411765, 1, 1,
0.3552567, 0.4839571, -0.6181053, 0, 0.1372549, 1, 1,
0.3571258, -1.274518, 1.593457, 0, 0.1294118, 1, 1,
0.3577889, 0.6189294, 0.8534064, 0, 0.1254902, 1, 1,
0.359394, -0.6346003, 1.525747, 0, 0.1176471, 1, 1,
0.3602514, -0.1027747, 0.2458273, 0, 0.1137255, 1, 1,
0.3604916, 0.7361001, -1.486545, 0, 0.1058824, 1, 1,
0.3610966, 0.5943546, 0.5852697, 0, 0.09803922, 1, 1,
0.3755068, -1.648108, 3.211244, 0, 0.09411765, 1, 1,
0.3760219, 0.5479744, 2.679088, 0, 0.08627451, 1, 1,
0.377147, 0.2711633, 1.066722, 0, 0.08235294, 1, 1,
0.3792221, -0.286583, 3.23948, 0, 0.07450981, 1, 1,
0.380466, -0.3054996, 1.846203, 0, 0.07058824, 1, 1,
0.3881521, -0.4443786, 3.034235, 0, 0.0627451, 1, 1,
0.3928329, 0.612679, 2.868588, 0, 0.05882353, 1, 1,
0.3966312, 0.3210736, -0.4077718, 0, 0.05098039, 1, 1,
0.3976387, 2.742456, 0.7680629, 0, 0.04705882, 1, 1,
0.4054108, -0.9877959, 1.363937, 0, 0.03921569, 1, 1,
0.4057472, 0.2973975, 0.2485676, 0, 0.03529412, 1, 1,
0.4078149, 0.09838647, 0.01516885, 0, 0.02745098, 1, 1,
0.4084232, -0.1238278, 3.145754, 0, 0.02352941, 1, 1,
0.4125711, 0.5965976, 2.745164, 0, 0.01568628, 1, 1,
0.4164349, 0.2865956, -0.5177884, 0, 0.01176471, 1, 1,
0.4187775, 0.4956273, 3.664751, 0, 0.003921569, 1, 1,
0.4253556, -1.197104, 4.589869, 0.003921569, 0, 1, 1,
0.4318491, 0.6119893, 0.04630438, 0.007843138, 0, 1, 1,
0.4338325, -0.0676188, 1.10452, 0.01568628, 0, 1, 1,
0.441496, 1.174381, 1.39124, 0.01960784, 0, 1, 1,
0.4415681, 0.4194234, 1.258999, 0.02745098, 0, 1, 1,
0.4416841, -0.1122416, 1.393949, 0.03137255, 0, 1, 1,
0.4430161, -0.3400058, 1.103598, 0.03921569, 0, 1, 1,
0.4452011, 0.9463293, -0.3693289, 0.04313726, 0, 1, 1,
0.4491156, -0.1464474, 3.717988, 0.05098039, 0, 1, 1,
0.4493329, 0.7268154, 0.147036, 0.05490196, 0, 1, 1,
0.4510776, -1.810649, 2.762537, 0.0627451, 0, 1, 1,
0.4536281, 1.201045, 1.079071, 0.06666667, 0, 1, 1,
0.4544566, 0.3654719, 0.8093125, 0.07450981, 0, 1, 1,
0.4577248, 0.7900167, -0.5620563, 0.07843138, 0, 1, 1,
0.4619744, -0.3850777, 2.15233, 0.08627451, 0, 1, 1,
0.4639691, 1.10893, -0.3455916, 0.09019608, 0, 1, 1,
0.4683433, -0.272167, 2.761487, 0.09803922, 0, 1, 1,
0.4690326, -1.102905, 2.044319, 0.1058824, 0, 1, 1,
0.4712174, 0.2580813, 1.565051, 0.1098039, 0, 1, 1,
0.4734521, -0.6146679, 3.85244, 0.1176471, 0, 1, 1,
0.482086, 0.2851375, 1.269036, 0.1215686, 0, 1, 1,
0.4835906, -0.7425831, 2.359339, 0.1294118, 0, 1, 1,
0.4864222, 0.7781817, -0.02351825, 0.1333333, 0, 1, 1,
0.4887172, -0.6747661, 1.31892, 0.1411765, 0, 1, 1,
0.4889395, 1.533156, -0.2794608, 0.145098, 0, 1, 1,
0.4976866, 0.2804005, 1.26186, 0.1529412, 0, 1, 1,
0.4977187, -1.148047, 1.721403, 0.1568628, 0, 1, 1,
0.4996554, 0.3280979, 0.5812014, 0.1647059, 0, 1, 1,
0.5009817, 0.1839701, 1.782421, 0.1686275, 0, 1, 1,
0.5032766, -0.3345205, 3.256456, 0.1764706, 0, 1, 1,
0.5063145, 2.43746, -0.2068368, 0.1803922, 0, 1, 1,
0.5084756, 0.2564619, 3.188004, 0.1882353, 0, 1, 1,
0.5143435, -0.6743412, 2.428301, 0.1921569, 0, 1, 1,
0.5145231, -1.280617, 3.545511, 0.2, 0, 1, 1,
0.5219979, 0.5230315, 1.241843, 0.2078431, 0, 1, 1,
0.5264857, 0.2488728, 1.423917, 0.2117647, 0, 1, 1,
0.533404, 2.295295, -0.08797924, 0.2196078, 0, 1, 1,
0.5350174, 1.238715, 1.526444, 0.2235294, 0, 1, 1,
0.5378017, 0.8843908, 1.702506, 0.2313726, 0, 1, 1,
0.5406585, 0.09459076, 1.588902, 0.2352941, 0, 1, 1,
0.5414607, -0.04905004, 2.869884, 0.2431373, 0, 1, 1,
0.5460666, -0.7734663, 2.627824, 0.2470588, 0, 1, 1,
0.5477458, 0.6136051, 2.056458, 0.254902, 0, 1, 1,
0.5526131, -0.0591069, 1.657535, 0.2588235, 0, 1, 1,
0.5585887, 0.6800138, 0.8946517, 0.2666667, 0, 1, 1,
0.5671328, -0.2218646, 3.378604, 0.2705882, 0, 1, 1,
0.5713951, -0.5076342, 1.972646, 0.2784314, 0, 1, 1,
0.5716543, 0.453424, 1.992894, 0.282353, 0, 1, 1,
0.5735252, -0.9231728, 1.615448, 0.2901961, 0, 1, 1,
0.5772445, 0.2113186, 1.444329, 0.2941177, 0, 1, 1,
0.5822421, 0.1610578, 2.137838, 0.3019608, 0, 1, 1,
0.5824255, -1.680864, 3.248501, 0.3098039, 0, 1, 1,
0.5890429, -0.7980112, 0.3960534, 0.3137255, 0, 1, 1,
0.589321, -0.937753, 2.872416, 0.3215686, 0, 1, 1,
0.59258, 0.9325275, -0.31514, 0.3254902, 0, 1, 1,
0.5956305, 1.353367, 0.2055622, 0.3333333, 0, 1, 1,
0.5977042, 0.4223411, 1.184846, 0.3372549, 0, 1, 1,
0.6003839, 0.3861066, 0.7092322, 0.345098, 0, 1, 1,
0.6044068, 1.036799, 0.0916989, 0.3490196, 0, 1, 1,
0.6065534, 0.7207885, 1.683067, 0.3568628, 0, 1, 1,
0.60696, -0.01566254, 2.56587, 0.3607843, 0, 1, 1,
0.6140608, -2.233434, 2.089065, 0.3686275, 0, 1, 1,
0.6202742, 0.07027951, 0.5170519, 0.372549, 0, 1, 1,
0.6224633, 0.4312207, 0.7534877, 0.3803922, 0, 1, 1,
0.627475, -0.5891253, 2.575886, 0.3843137, 0, 1, 1,
0.635382, 0.2625402, 1.185089, 0.3921569, 0, 1, 1,
0.6381454, 0.5495861, 1.967916, 0.3960784, 0, 1, 1,
0.638925, 0.7274095, 0.6357428, 0.4039216, 0, 1, 1,
0.6412382, -1.488923, 3.007185, 0.4117647, 0, 1, 1,
0.6431046, -0.740083, 2.62596, 0.4156863, 0, 1, 1,
0.6510537, -0.02910055, 2.622911, 0.4235294, 0, 1, 1,
0.651897, -0.1855824, 0.9302986, 0.427451, 0, 1, 1,
0.6538494, -0.1190026, 1.463519, 0.4352941, 0, 1, 1,
0.6632242, 0.7414706, 1.105947, 0.4392157, 0, 1, 1,
0.6634321, -2.538464, 3.800485, 0.4470588, 0, 1, 1,
0.6636576, -0.6585877, 2.601125, 0.4509804, 0, 1, 1,
0.6667945, 1.465424, 0.904659, 0.4588235, 0, 1, 1,
0.6686017, -1.591245, 3.076124, 0.4627451, 0, 1, 1,
0.67159, -0.6585496, 3.775978, 0.4705882, 0, 1, 1,
0.6761678, 0.06928936, 1.740075, 0.4745098, 0, 1, 1,
0.6837368, 0.04304281, -0.2098424, 0.4823529, 0, 1, 1,
0.6871821, 0.3176925, 0.4482078, 0.4862745, 0, 1, 1,
0.6974018, 1.697526, 0.4230478, 0.4941176, 0, 1, 1,
0.7048677, 0.260386, 1.672306, 0.5019608, 0, 1, 1,
0.7059383, -0.7941499, 2.172045, 0.5058824, 0, 1, 1,
0.7103344, 0.08287, 0.2032297, 0.5137255, 0, 1, 1,
0.7107136, -1.695809, 5.56429, 0.5176471, 0, 1, 1,
0.7134251, 0.1194035, 0.2463212, 0.5254902, 0, 1, 1,
0.7170092, -1.325759, 4.804826, 0.5294118, 0, 1, 1,
0.7204581, 0.87106, 2.290657, 0.5372549, 0, 1, 1,
0.7255024, 0.8720108, 0.9885998, 0.5411765, 0, 1, 1,
0.7257256, -1.816913, 3.622622, 0.5490196, 0, 1, 1,
0.7439661, 1.161137, 1.556655, 0.5529412, 0, 1, 1,
0.7507889, -0.005034293, 0.5333908, 0.5607843, 0, 1, 1,
0.7513195, -0.7607533, 3.558406, 0.5647059, 0, 1, 1,
0.7546855, -0.5785878, 0.9023889, 0.572549, 0, 1, 1,
0.7637398, -0.2056871, 2.335667, 0.5764706, 0, 1, 1,
0.7645669, -0.6432422, 1.855258, 0.5843138, 0, 1, 1,
0.7659461, -0.9339828, 2.633123, 0.5882353, 0, 1, 1,
0.7665169, -0.5762329, 2.634402, 0.5960785, 0, 1, 1,
0.7682067, 0.5403685, 2.751233, 0.6039216, 0, 1, 1,
0.7703522, -0.004483178, 1.778004, 0.6078432, 0, 1, 1,
0.7714595, 0.6425747, 1.194329, 0.6156863, 0, 1, 1,
0.7751582, 0.6326547, 0.3470726, 0.6196079, 0, 1, 1,
0.7842004, -1.53066, 2.430733, 0.627451, 0, 1, 1,
0.7846686, -1.114681, 2.890119, 0.6313726, 0, 1, 1,
0.7869586, -0.3610618, 1.722966, 0.6392157, 0, 1, 1,
0.7872553, 0.5068266, 0.9383097, 0.6431373, 0, 1, 1,
0.788652, 2.097459, 0.6551116, 0.6509804, 0, 1, 1,
0.7905391, -1.085098, 1.551701, 0.654902, 0, 1, 1,
0.790947, -0.2066333, 3.10909, 0.6627451, 0, 1, 1,
0.7924258, 1.2551, 0.3143813, 0.6666667, 0, 1, 1,
0.793373, -1.24131, 2.162017, 0.6745098, 0, 1, 1,
0.7956918, 0.5552933, 0.2540542, 0.6784314, 0, 1, 1,
0.7969663, 0.4235564, -0.4821688, 0.6862745, 0, 1, 1,
0.8019992, 0.8523617, 0.5460974, 0.6901961, 0, 1, 1,
0.8020366, -0.3621795, 1.90166, 0.6980392, 0, 1, 1,
0.8031675, -1.224061, 1.687709, 0.7058824, 0, 1, 1,
0.8055649, 0.2261453, 1.31345, 0.7098039, 0, 1, 1,
0.8063085, -0.1400925, 2.63347, 0.7176471, 0, 1, 1,
0.8065287, 0.08200992, 0.5649583, 0.7215686, 0, 1, 1,
0.8111268, 1.245618, 1.437588, 0.7294118, 0, 1, 1,
0.8203161, -0.5230228, 3.536316, 0.7333333, 0, 1, 1,
0.8214357, 1.432483, 1.091576, 0.7411765, 0, 1, 1,
0.8280447, -0.1244082, 0.668617, 0.7450981, 0, 1, 1,
0.830398, -0.02136202, -0.5333751, 0.7529412, 0, 1, 1,
0.8310392, 0.2891585, 0.5325283, 0.7568628, 0, 1, 1,
0.8324169, 0.1284257, 0.2913968, 0.7647059, 0, 1, 1,
0.8329757, -0.5298161, 3.724339, 0.7686275, 0, 1, 1,
0.8341019, 0.7952515, 2.494751, 0.7764706, 0, 1, 1,
0.8364941, 0.1881164, 0.8552009, 0.7803922, 0, 1, 1,
0.8384906, 1.379417, 1.911088, 0.7882353, 0, 1, 1,
0.8416987, -1.405504, 2.234804, 0.7921569, 0, 1, 1,
0.8550041, 0.3870635, 1.833433, 0.8, 0, 1, 1,
0.8581858, 0.009388875, 1.068267, 0.8078431, 0, 1, 1,
0.865032, 0.5787643, 1.263686, 0.8117647, 0, 1, 1,
0.8674562, 0.7384145, 1.841503, 0.8196079, 0, 1, 1,
0.8681805, -0.09723822, 1.14437, 0.8235294, 0, 1, 1,
0.8747357, 0.9094723, 1.411257, 0.8313726, 0, 1, 1,
0.8866053, 0.90338, 1.235721, 0.8352941, 0, 1, 1,
0.887811, 1.831456, -1.160355, 0.8431373, 0, 1, 1,
0.8879067, -1.593415, 1.335496, 0.8470588, 0, 1, 1,
0.8901126, 0.1315206, 1.290835, 0.854902, 0, 1, 1,
0.8943838, -0.07773554, 0.1623259, 0.8588235, 0, 1, 1,
0.896005, 0.837339, 1.088602, 0.8666667, 0, 1, 1,
0.8970716, -0.839625, 0.3468132, 0.8705882, 0, 1, 1,
0.9003693, -0.5933977, 0.8630838, 0.8784314, 0, 1, 1,
0.9078339, -1.619088, 2.661069, 0.8823529, 0, 1, 1,
0.911896, -0.7488551, 2.243089, 0.8901961, 0, 1, 1,
0.9148346, 1.500009, -0.2250309, 0.8941177, 0, 1, 1,
0.9152564, 0.4249161, 1.610319, 0.9019608, 0, 1, 1,
0.926299, 0.7560732, 3.037771, 0.9098039, 0, 1, 1,
0.9272581, -1.478261, 2.941159, 0.9137255, 0, 1, 1,
0.9335112, 1.338425, 0.2083586, 0.9215686, 0, 1, 1,
0.9337267, -0.1823231, 2.27405, 0.9254902, 0, 1, 1,
0.9395187, 0.8225473, -0.6964207, 0.9333333, 0, 1, 1,
0.9423223, 0.1437874, 3.178159, 0.9372549, 0, 1, 1,
0.9442744, 0.1353182, 1.560238, 0.945098, 0, 1, 1,
0.9442846, 1.172133, 1.357551, 0.9490196, 0, 1, 1,
0.9533022, -1.126546, 2.991239, 0.9568627, 0, 1, 1,
0.9616793, 1.370826, -0.1188209, 0.9607843, 0, 1, 1,
0.9684958, -1.815981, 2.166986, 0.9686275, 0, 1, 1,
0.9790139, 0.4464579, 1.362301, 0.972549, 0, 1, 1,
0.9800871, 0.5382197, 0.9379796, 0.9803922, 0, 1, 1,
0.9807929, -1.281131, 3.23286, 0.9843137, 0, 1, 1,
0.984952, 1.444508, 2.280168, 0.9921569, 0, 1, 1,
0.9929003, 0.234185, 1.44839, 0.9960784, 0, 1, 1,
0.9943847, 0.9455762, -0.04300612, 1, 0, 0.9960784, 1,
0.9968148, -1.14642, 1.79221, 1, 0, 0.9882353, 1,
0.998929, 1.342472, 0.5401215, 1, 0, 0.9843137, 1,
1.000653, -0.8026859, 3.227619, 1, 0, 0.9764706, 1,
1.001307, 1.371994, 1.123809, 1, 0, 0.972549, 1,
1.006465, 0.4222476, 0.8847352, 1, 0, 0.9647059, 1,
1.006534, -0.6704078, 1.840948, 1, 0, 0.9607843, 1,
1.007323, -0.1176155, 0.2147746, 1, 0, 0.9529412, 1,
1.010993, -0.5073018, 0.1418054, 1, 0, 0.9490196, 1,
1.021617, 0.6274568, 0.5891489, 1, 0, 0.9411765, 1,
1.037898, -1.236277, 1.521099, 1, 0, 0.9372549, 1,
1.038087, 1.623437, 1.897527, 1, 0, 0.9294118, 1,
1.03928, 0.2333991, 0.5836905, 1, 0, 0.9254902, 1,
1.039869, -0.1025883, 0.3628413, 1, 0, 0.9176471, 1,
1.048183, -0.1303859, -0.3055713, 1, 0, 0.9137255, 1,
1.049758, -1.153418, 1.092722, 1, 0, 0.9058824, 1,
1.053732, 0.9570173, 2.372137, 1, 0, 0.9019608, 1,
1.056421, -1.004089, 2.16184, 1, 0, 0.8941177, 1,
1.057862, -0.7512972, 3.460476, 1, 0, 0.8862745, 1,
1.058281, 0.5393187, -0.5970194, 1, 0, 0.8823529, 1,
1.059169, 0.03514405, -0.3841335, 1, 0, 0.8745098, 1,
1.064198, -1.720084, 4.231955, 1, 0, 0.8705882, 1,
1.066509, 1.12741, 1.430874, 1, 0, 0.8627451, 1,
1.078319, -0.1768852, 0.8168312, 1, 0, 0.8588235, 1,
1.080069, 0.6579785, 1.111032, 1, 0, 0.8509804, 1,
1.088183, -0.5842392, 1.726857, 1, 0, 0.8470588, 1,
1.088441, 0.8050027, 1.392157, 1, 0, 0.8392157, 1,
1.089747, -0.9974338, 3.867262, 1, 0, 0.8352941, 1,
1.099109, -0.8281204, 1.289297, 1, 0, 0.827451, 1,
1.102733, 0.7592322, 2.194661, 1, 0, 0.8235294, 1,
1.11062, 1.215127, 0.7816333, 1, 0, 0.8156863, 1,
1.112013, -0.188069, 1.642341, 1, 0, 0.8117647, 1,
1.130733, -0.6959007, 1.288728, 1, 0, 0.8039216, 1,
1.136098, 0.4490549, 1.60382, 1, 0, 0.7960784, 1,
1.138371, -0.160215, 2.917119, 1, 0, 0.7921569, 1,
1.150821, -0.5033126, 2.027445, 1, 0, 0.7843137, 1,
1.151458, 0.9399369, -0.1847524, 1, 0, 0.7803922, 1,
1.15189, 2.110086, 1.22235, 1, 0, 0.772549, 1,
1.154335, 0.7644408, 0.5443241, 1, 0, 0.7686275, 1,
1.156496, 1.578577, 0.9867494, 1, 0, 0.7607843, 1,
1.15679, -0.7077518, 1.070516, 1, 0, 0.7568628, 1,
1.158497, 0.1339112, 0.3738046, 1, 0, 0.7490196, 1,
1.161286, -0.3391844, 2.011143, 1, 0, 0.7450981, 1,
1.176396, 1.628095, 1.145801, 1, 0, 0.7372549, 1,
1.193522, 0.229718, 2.244885, 1, 0, 0.7333333, 1,
1.197401, 0.1579413, 2.584767, 1, 0, 0.7254902, 1,
1.19839, 0.9348139, 2.022732, 1, 0, 0.7215686, 1,
1.208054, 0.09036969, 0.6348252, 1, 0, 0.7137255, 1,
1.210596, -0.4641545, 1.844029, 1, 0, 0.7098039, 1,
1.218264, -1.084049, 2.486145, 1, 0, 0.7019608, 1,
1.219535, 0.6450087, 0.8893016, 1, 0, 0.6941177, 1,
1.225838, -1.246915, 0.7251202, 1, 0, 0.6901961, 1,
1.245668, 0.4951423, 0.4863177, 1, 0, 0.682353, 1,
1.246074, 0.00346778, 1.914284, 1, 0, 0.6784314, 1,
1.266044, 1.021888, -1.263745, 1, 0, 0.6705883, 1,
1.267151, -0.2223145, 1.038091, 1, 0, 0.6666667, 1,
1.271579, 0.9900792, 0.8732821, 1, 0, 0.6588235, 1,
1.280537, -1.217629, 1.506405, 1, 0, 0.654902, 1,
1.281242, 1.657362, 0.9280669, 1, 0, 0.6470588, 1,
1.285731, -0.07135955, 2.069873, 1, 0, 0.6431373, 1,
1.290859, -0.7639882, 1.621048, 1, 0, 0.6352941, 1,
1.294185, -1.220432, 2.66855, 1, 0, 0.6313726, 1,
1.309653, -1.276758, 1.503256, 1, 0, 0.6235294, 1,
1.328089, 0.5593324, 1.867691, 1, 0, 0.6196079, 1,
1.331092, -0.6600409, 1.604872, 1, 0, 0.6117647, 1,
1.338899, -1.3728, 3.9453, 1, 0, 0.6078432, 1,
1.344771, 0.3633351, 1.399165, 1, 0, 0.6, 1,
1.362487, 0.8336345, 2.377449, 1, 0, 0.5921569, 1,
1.363797, 0.6516099, -0.9437233, 1, 0, 0.5882353, 1,
1.376244, 0.7572464, 2.810482, 1, 0, 0.5803922, 1,
1.396252, -1.171645, 3.364579, 1, 0, 0.5764706, 1,
1.398983, -0.2292906, 2.44076, 1, 0, 0.5686275, 1,
1.401318, -0.1223708, 0.5140086, 1, 0, 0.5647059, 1,
1.416731, 0.06835418, 1.321132, 1, 0, 0.5568628, 1,
1.422678, -0.9879964, -0.0711587, 1, 0, 0.5529412, 1,
1.422808, 2.060801, 1.309984, 1, 0, 0.5450981, 1,
1.429336, -2.553949, 3.653851, 1, 0, 0.5411765, 1,
1.443946, -0.9885044, 3.394966, 1, 0, 0.5333334, 1,
1.445938, -1.720034, 4.110513, 1, 0, 0.5294118, 1,
1.447473, -0.2865559, 2.006654, 1, 0, 0.5215687, 1,
1.452726, 0.5456113, 0.8120483, 1, 0, 0.5176471, 1,
1.454913, 1.024276, 0.907949, 1, 0, 0.509804, 1,
1.456539, 0.07279434, 1.252749, 1, 0, 0.5058824, 1,
1.466943, 0.7809637, 1.784986, 1, 0, 0.4980392, 1,
1.480743, -1.884263, 2.181384, 1, 0, 0.4901961, 1,
1.483527, -0.4885468, 0.7947344, 1, 0, 0.4862745, 1,
1.483869, -0.2066592, 0.6710736, 1, 0, 0.4784314, 1,
1.485723, -0.659509, 3.448346, 1, 0, 0.4745098, 1,
1.485933, -1.739302, 2.186908, 1, 0, 0.4666667, 1,
1.487554, 0.6378101, 0.1363482, 1, 0, 0.4627451, 1,
1.515964, -0.1722263, 2.814021, 1, 0, 0.454902, 1,
1.534962, -0.03982982, 0.6061662, 1, 0, 0.4509804, 1,
1.55502, 1.53256, 0.488895, 1, 0, 0.4431373, 1,
1.573249, 0.7750856, 0.8370755, 1, 0, 0.4392157, 1,
1.575217, 0.2699177, 2.060854, 1, 0, 0.4313726, 1,
1.575259, 2.039737, -0.3956051, 1, 0, 0.427451, 1,
1.578265, -0.4089081, 2.990119, 1, 0, 0.4196078, 1,
1.580857, -1.084722, 1.947485, 1, 0, 0.4156863, 1,
1.582605, 1.317227, -0.6541753, 1, 0, 0.4078431, 1,
1.582904, -1.837858, 2.193543, 1, 0, 0.4039216, 1,
1.599009, 0.9127133, 1.174313, 1, 0, 0.3960784, 1,
1.603906, -0.1259898, -0.06042831, 1, 0, 0.3882353, 1,
1.624989, 2.082546, 2.094845, 1, 0, 0.3843137, 1,
1.630902, -0.7003897, 1.464714, 1, 0, 0.3764706, 1,
1.640291, -0.4897443, 4.133185, 1, 0, 0.372549, 1,
1.669087, 1.791526, -0.8323451, 1, 0, 0.3647059, 1,
1.669398, 0.7104453, 1.038635, 1, 0, 0.3607843, 1,
1.680542, 0.4495097, -0.6775861, 1, 0, 0.3529412, 1,
1.686259, 0.3020886, 1.869867, 1, 0, 0.3490196, 1,
1.70874, 0.2238387, 2.197758, 1, 0, 0.3411765, 1,
1.710853, -0.6598701, 1.777033, 1, 0, 0.3372549, 1,
1.712951, 1.677279, 1.031503, 1, 0, 0.3294118, 1,
1.730665, -0.3856985, 1.447998, 1, 0, 0.3254902, 1,
1.751479, 0.5832884, -0.1049787, 1, 0, 0.3176471, 1,
1.755754, -0.5404832, 1.396537, 1, 0, 0.3137255, 1,
1.758937, -0.375317, 2.244124, 1, 0, 0.3058824, 1,
1.761548, -0.1369188, 0.9343685, 1, 0, 0.2980392, 1,
1.768075, 0.9557415, 0.4941593, 1, 0, 0.2941177, 1,
1.826648, -0.5558483, 1.634614, 1, 0, 0.2862745, 1,
1.846364, -0.8412883, -0.2358725, 1, 0, 0.282353, 1,
1.865036, 0.6794249, 1.990565, 1, 0, 0.2745098, 1,
1.876867, -0.5312318, 4.042541, 1, 0, 0.2705882, 1,
1.885888, -0.8805069, 1.785255, 1, 0, 0.2627451, 1,
1.893931, -0.3230487, 0.5228314, 1, 0, 0.2588235, 1,
1.896025, 0.4233039, 1.295008, 1, 0, 0.2509804, 1,
1.898459, 0.4353836, 0.9307655, 1, 0, 0.2470588, 1,
1.907897, -0.3250656, 1.085976, 1, 0, 0.2392157, 1,
1.938428, 0.9522422, 1.650453, 1, 0, 0.2352941, 1,
1.964037, 1.099127, 0.9219604, 1, 0, 0.227451, 1,
1.975094, 0.09106003, 3.93347, 1, 0, 0.2235294, 1,
1.976274, -1.543308, 2.819267, 1, 0, 0.2156863, 1,
1.987346, 2.026595, -0.9284171, 1, 0, 0.2117647, 1,
2.015308, 1.732157, 1.165005, 1, 0, 0.2039216, 1,
2.016069, 0.0204011, 1.807953, 1, 0, 0.1960784, 1,
2.018373, -0.9592543, 1.190981, 1, 0, 0.1921569, 1,
2.021042, -0.01614761, 0.9321912, 1, 0, 0.1843137, 1,
2.027007, 1.241035, 0.1730965, 1, 0, 0.1803922, 1,
2.043681, -1.133614, 2.77823, 1, 0, 0.172549, 1,
2.050169, -0.7059273, 1.804189, 1, 0, 0.1686275, 1,
2.053552, 0.9594534, 1.631366, 1, 0, 0.1607843, 1,
2.17522, 0.4267357, 2.263422, 1, 0, 0.1568628, 1,
2.20252, -0.5791235, 2.347048, 1, 0, 0.1490196, 1,
2.24699, -0.2506391, -0.3365672, 1, 0, 0.145098, 1,
2.256838, 0.287181, 0.9464704, 1, 0, 0.1372549, 1,
2.276756, -0.3061911, 1.98726, 1, 0, 0.1333333, 1,
2.278546, 0.5633675, -0.7966744, 1, 0, 0.1254902, 1,
2.310457, 0.6845685, 1.983746, 1, 0, 0.1215686, 1,
2.345369, 1.153152, 1.584292, 1, 0, 0.1137255, 1,
2.371351, -0.7990534, 1.644626, 1, 0, 0.1098039, 1,
2.403116, 0.1217182, 0.2647972, 1, 0, 0.1019608, 1,
2.418369, 0.5649275, 0.5560291, 1, 0, 0.09411765, 1,
2.441192, -0.7681632, 2.840419, 1, 0, 0.09019608, 1,
2.458427, -0.01864327, 1.485976, 1, 0, 0.08235294, 1,
2.46139, 0.534582, 1.00704, 1, 0, 0.07843138, 1,
2.481127, 0.01166122, 2.417909, 1, 0, 0.07058824, 1,
2.61034, -0.9660891, 1.873859, 1, 0, 0.06666667, 1,
2.634638, 0.9824008, 2.411601, 1, 0, 0.05882353, 1,
2.701754, -0.7306331, 1.475901, 1, 0, 0.05490196, 1,
2.826191, 2.028342, -0.1173885, 1, 0, 0.04705882, 1,
2.837615, 1.165841, 1.337927, 1, 0, 0.04313726, 1,
2.863926, -0.02993799, 2.144301, 1, 0, 0.03529412, 1,
2.890692, 0.2033114, 0.05796821, 1, 0, 0.03137255, 1,
2.95395, 1.149092, 0.5523325, 1, 0, 0.02352941, 1,
2.984796, -0.7174026, 0.07589004, 1, 0, 0.01960784, 1,
3.123162, 0.1367441, 1.505052, 1, 0, 0.01176471, 1,
3.656218, -1.320305, 1.808396, 1, 0, 0.007843138, 1
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
-0.1623805, -4.282043, -6.810014, 0, -0.5, 0.5, 0.5,
-0.1623805, -4.282043, -6.810014, 1, -0.5, 0.5, 0.5,
-0.1623805, -4.282043, -6.810014, 1, 1.5, 0.5, 0.5,
-0.1623805, -4.282043, -6.810014, 0, 1.5, 0.5, 0.5
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
-5.275484, 0.1484512, -6.810014, 0, -0.5, 0.5, 0.5,
-5.275484, 0.1484512, -6.810014, 1, -0.5, 0.5, 0.5,
-5.275484, 0.1484512, -6.810014, 1, 1.5, 0.5, 0.5,
-5.275484, 0.1484512, -6.810014, 0, 1.5, 0.5, 0.5
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
-5.275484, -4.282043, 0.3971021, 0, -0.5, 0.5, 0.5,
-5.275484, -4.282043, 0.3971021, 1, -0.5, 0.5, 0.5,
-5.275484, -4.282043, 0.3971021, 1, 1.5, 0.5, 0.5,
-5.275484, -4.282043, 0.3971021, 0, 1.5, 0.5, 0.5
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
-2, -3.259621, -5.146833,
2, -3.259621, -5.146833,
-2, -3.259621, -5.146833,
-2, -3.430025, -5.42403,
0, -3.259621, -5.146833,
0, -3.430025, -5.42403,
2, -3.259621, -5.146833,
2, -3.430025, -5.42403
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
-2, -3.770832, -5.978424, 0, -0.5, 0.5, 0.5,
-2, -3.770832, -5.978424, 1, -0.5, 0.5, 0.5,
-2, -3.770832, -5.978424, 1, 1.5, 0.5, 0.5,
-2, -3.770832, -5.978424, 0, 1.5, 0.5, 0.5,
0, -3.770832, -5.978424, 0, -0.5, 0.5, 0.5,
0, -3.770832, -5.978424, 1, -0.5, 0.5, 0.5,
0, -3.770832, -5.978424, 1, 1.5, 0.5, 0.5,
0, -3.770832, -5.978424, 0, 1.5, 0.5, 0.5,
2, -3.770832, -5.978424, 0, -0.5, 0.5, 0.5,
2, -3.770832, -5.978424, 1, -0.5, 0.5, 0.5,
2, -3.770832, -5.978424, 1, 1.5, 0.5, 0.5,
2, -3.770832, -5.978424, 0, 1.5, 0.5, 0.5
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
-4.095537, -3, -5.146833,
-4.095537, 3, -5.146833,
-4.095537, -3, -5.146833,
-4.292195, -3, -5.42403,
-4.095537, -2, -5.146833,
-4.292195, -2, -5.42403,
-4.095537, -1, -5.146833,
-4.292195, -1, -5.42403,
-4.095537, 0, -5.146833,
-4.292195, 0, -5.42403,
-4.095537, 1, -5.146833,
-4.292195, 1, -5.42403,
-4.095537, 2, -5.146833,
-4.292195, 2, -5.42403,
-4.095537, 3, -5.146833,
-4.292195, 3, -5.42403
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
-4.68551, -3, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, -3, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, -3, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, -3, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, -2, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, -2, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, -2, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, -2, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, -1, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, -1, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, -1, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, -1, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, 0, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, 0, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, 0, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, 0, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, 1, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, 1, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, 1, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, 1, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, 2, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, 2, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, 2, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, 2, -5.978424, 0, 1.5, 0.5, 0.5,
-4.68551, 3, -5.978424, 0, -0.5, 0.5, 0.5,
-4.68551, 3, -5.978424, 1, -0.5, 0.5, 0.5,
-4.68551, 3, -5.978424, 1, 1.5, 0.5, 0.5,
-4.68551, 3, -5.978424, 0, 1.5, 0.5, 0.5
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
-4.095537, -3.259621, -4,
-4.095537, -3.259621, 4,
-4.095537, -3.259621, -4,
-4.292195, -3.430025, -4,
-4.095537, -3.259621, -2,
-4.292195, -3.430025, -2,
-4.095537, -3.259621, 0,
-4.292195, -3.430025, 0,
-4.095537, -3.259621, 2,
-4.292195, -3.430025, 2,
-4.095537, -3.259621, 4,
-4.292195, -3.430025, 4
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
-4.68551, -3.770832, -4, 0, -0.5, 0.5, 0.5,
-4.68551, -3.770832, -4, 1, -0.5, 0.5, 0.5,
-4.68551, -3.770832, -4, 1, 1.5, 0.5, 0.5,
-4.68551, -3.770832, -4, 0, 1.5, 0.5, 0.5,
-4.68551, -3.770832, -2, 0, -0.5, 0.5, 0.5,
-4.68551, -3.770832, -2, 1, -0.5, 0.5, 0.5,
-4.68551, -3.770832, -2, 1, 1.5, 0.5, 0.5,
-4.68551, -3.770832, -2, 0, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 0, 0, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 0, 1, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 0, 1, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 0, 0, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 2, 0, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 2, 1, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 2, 1, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 2, 0, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 4, 0, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 4, 1, -0.5, 0.5, 0.5,
-4.68551, -3.770832, 4, 1, 1.5, 0.5, 0.5,
-4.68551, -3.770832, 4, 0, 1.5, 0.5, 0.5
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
-4.095537, -3.259621, -5.146833,
-4.095537, 3.556523, -5.146833,
-4.095537, -3.259621, 5.941038,
-4.095537, 3.556523, 5.941038,
-4.095537, -3.259621, -5.146833,
-4.095537, -3.259621, 5.941038,
-4.095537, 3.556523, -5.146833,
-4.095537, 3.556523, 5.941038,
-4.095537, -3.259621, -5.146833,
3.770776, -3.259621, -5.146833,
-4.095537, -3.259621, 5.941038,
3.770776, -3.259621, 5.941038,
-4.095537, 3.556523, -5.146833,
3.770776, 3.556523, -5.146833,
-4.095537, 3.556523, 5.941038,
3.770776, 3.556523, 5.941038,
3.770776, -3.259621, -5.146833,
3.770776, 3.556523, -5.146833,
3.770776, -3.259621, 5.941038,
3.770776, 3.556523, 5.941038,
3.770776, -3.259621, -5.146833,
3.770776, -3.259621, 5.941038,
3.770776, 3.556523, -5.146833,
3.770776, 3.556523, 5.941038
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
var radius = 8.120712;
var distance = 36.12996;
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
mvMatrix.translate( 0.1623805, -0.1484512, -0.3971021 );
mvMatrix.scale( 1.116187, 1.288158, 0.7918808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.12996);
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
sodium_trichloroacet<-read.table("sodium_trichloroacet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_trichloroacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
```

```r
y<-sodium_trichloroacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
```

```r
z<-sodium_trichloroacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_trichloroacet' not found
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
-3.980979, 0.610569, 1.37011, 0, 0, 1, 1, 1,
-3.129442, -0.6360202, -1.529925, 1, 0, 0, 1, 1,
-2.819831, 0.6013869, -0.940617, 1, 0, 0, 1, 1,
-2.740682, 1.332629, -1.143052, 1, 0, 0, 1, 1,
-2.575605, -0.8634959, -1.880986, 1, 0, 0, 1, 1,
-2.462551, 1.162468, -1.624493, 1, 0, 0, 1, 1,
-2.445333, -0.3955962, -0.5034798, 0, 0, 0, 1, 1,
-2.415985, 0.3817872, -0.3858592, 0, 0, 0, 1, 1,
-2.306987, 2.557884, -1.740448, 0, 0, 0, 1, 1,
-2.304472, -0.2019175, -1.789397, 0, 0, 0, 1, 1,
-2.29119, 1.386516, -3.070054, 0, 0, 0, 1, 1,
-2.216403, -1.825891, -2.362264, 0, 0, 0, 1, 1,
-2.170189, -0.4815936, -1.717611, 0, 0, 0, 1, 1,
-2.137997, -2.468835, -1.583424, 1, 1, 1, 1, 1,
-2.131874, -0.261536, -0.0710049, 1, 1, 1, 1, 1,
-2.11218, -1.023073, -2.022468, 1, 1, 1, 1, 1,
-2.072089, -1.794228, -2.439435, 1, 1, 1, 1, 1,
-2.063474, 0.8120977, -0.6749221, 1, 1, 1, 1, 1,
-2.051841, 2.303145, -2.154324, 1, 1, 1, 1, 1,
-2.037893, 1.025531, -0.8700969, 1, 1, 1, 1, 1,
-2.009811, 1.629246, -1.361342, 1, 1, 1, 1, 1,
-2.008981, 1.372512, -1.435919, 1, 1, 1, 1, 1,
-1.989916, -0.1821732, -1.549212, 1, 1, 1, 1, 1,
-1.981588, 0.6614081, -1.201833, 1, 1, 1, 1, 1,
-1.964245, 0.9231092, -0.7583373, 1, 1, 1, 1, 1,
-1.961905, -0.7834953, -3.629917, 1, 1, 1, 1, 1,
-1.957087, -0.05150578, -2.60389, 1, 1, 1, 1, 1,
-1.932926, -1.121648, -2.977, 1, 1, 1, 1, 1,
-1.923414, 1.52452, -0.4661236, 0, 0, 1, 1, 1,
-1.886198, -1.003169, -0.4520575, 1, 0, 0, 1, 1,
-1.884168, -0.723901, -1.898831, 1, 0, 0, 1, 1,
-1.871548, -0.9499065, -2.132809, 1, 0, 0, 1, 1,
-1.853038, 0.9560995, -1.727645, 1, 0, 0, 1, 1,
-1.838649, 0.8986449, 0.0315682, 1, 0, 0, 1, 1,
-1.82688, 0.08038619, -0.9963868, 0, 0, 0, 1, 1,
-1.816476, -0.3467326, -2.328671, 0, 0, 0, 1, 1,
-1.80717, 0.04887072, -0.09106541, 0, 0, 0, 1, 1,
-1.794698, 1.349675, -1.072355, 0, 0, 0, 1, 1,
-1.773903, -0.6116982, -0.06866391, 0, 0, 0, 1, 1,
-1.756582, -0.6402032, -2.273638, 0, 0, 0, 1, 1,
-1.750948, 0.9151551, -0.9659227, 0, 0, 0, 1, 1,
-1.749813, -1.614217, -4.146275, 1, 1, 1, 1, 1,
-1.714801, -1.030507, -1.14052, 1, 1, 1, 1, 1,
-1.707081, 1.161042, 0.4922674, 1, 1, 1, 1, 1,
-1.700224, -0.3268841, -2.402795, 1, 1, 1, 1, 1,
-1.697987, -0.8951725, -0.9676268, 1, 1, 1, 1, 1,
-1.688649, -0.5773275, -1.331073, 1, 1, 1, 1, 1,
-1.652123, 0.3893715, -0.7183449, 1, 1, 1, 1, 1,
-1.637916, 0.8867642, -1.735609, 1, 1, 1, 1, 1,
-1.633773, 1.515995, -1.048512, 1, 1, 1, 1, 1,
-1.633216, -0.6754258, -1.464815, 1, 1, 1, 1, 1,
-1.614899, -1.408896, -2.864615, 1, 1, 1, 1, 1,
-1.612906, 0.2329749, -0.2348019, 1, 1, 1, 1, 1,
-1.610796, -0.967962, -1.605666, 1, 1, 1, 1, 1,
-1.610008, 1.469053, -1.456262, 1, 1, 1, 1, 1,
-1.609623, 1.223028, -0.9539228, 1, 1, 1, 1, 1,
-1.601173, -0.5120958, -2.993081, 0, 0, 1, 1, 1,
-1.597324, -0.7015412, -2.361133, 1, 0, 0, 1, 1,
-1.590289, -0.4944271, -2.713443, 1, 0, 0, 1, 1,
-1.577167, 1.733219, -0.1664601, 1, 0, 0, 1, 1,
-1.569031, -0.5389356, -1.525259, 1, 0, 0, 1, 1,
-1.56275, -0.1511218, -0.07747731, 1, 0, 0, 1, 1,
-1.56086, 0.8344576, -0.5880704, 0, 0, 0, 1, 1,
-1.559417, -0.8822443, -2.267949, 0, 0, 0, 1, 1,
-1.555355, -0.6429837, -2.039228, 0, 0, 0, 1, 1,
-1.5498, -1.792078, -0.9468733, 0, 0, 0, 1, 1,
-1.548296, 1.381443, -0.2622499, 0, 0, 0, 1, 1,
-1.530241, -1.76279, -2.311357, 0, 0, 0, 1, 1,
-1.529781, -1.042449, -4.341068, 0, 0, 0, 1, 1,
-1.527079, -0.5893181, -1.622503, 1, 1, 1, 1, 1,
-1.518732, -0.1488147, -1.32729, 1, 1, 1, 1, 1,
-1.494545, -0.2997761, -3.014447, 1, 1, 1, 1, 1,
-1.471322, -0.8605971, -0.9994633, 1, 1, 1, 1, 1,
-1.459182, -1.310512, -1.046464, 1, 1, 1, 1, 1,
-1.448415, 1.311891, -1.141965, 1, 1, 1, 1, 1,
-1.445475, -0.129327, -2.029588, 1, 1, 1, 1, 1,
-1.442807, 0.5819348, -1.678221, 1, 1, 1, 1, 1,
-1.442231, 2.066338, 0.9284457, 1, 1, 1, 1, 1,
-1.440138, -0.5495382, -0.4381897, 1, 1, 1, 1, 1,
-1.439679, -1.051555, -0.250984, 1, 1, 1, 1, 1,
-1.428391, 0.01959235, -1.339666, 1, 1, 1, 1, 1,
-1.424912, -0.5741127, -1.770398, 1, 1, 1, 1, 1,
-1.402689, 0.4052346, -2.102586, 1, 1, 1, 1, 1,
-1.397795, 1.6652, -1.947079, 1, 1, 1, 1, 1,
-1.395331, -2.651023, -1.450621, 0, 0, 1, 1, 1,
-1.386886, 0.06331473, -1.592058, 1, 0, 0, 1, 1,
-1.385369, 0.02515945, -1.76086, 1, 0, 0, 1, 1,
-1.379493, -0.9226637, -3.271193, 1, 0, 0, 1, 1,
-1.379141, 0.4377756, -2.334928, 1, 0, 0, 1, 1,
-1.373847, -0.02766921, -2.023271, 1, 0, 0, 1, 1,
-1.37374, 0.663431, -2.145154, 0, 0, 0, 1, 1,
-1.360262, 2.189233, 0.2699083, 0, 0, 0, 1, 1,
-1.358201, 1.863737, -0.3185636, 0, 0, 0, 1, 1,
-1.357273, -0.2918392, -1.927545, 0, 0, 0, 1, 1,
-1.350548, -1.998179, -4.210491, 0, 0, 0, 1, 1,
-1.337744, -0.04928838, -0.7276601, 0, 0, 0, 1, 1,
-1.323396, -1.000799, -2.306878, 0, 0, 0, 1, 1,
-1.31594, 0.003849262, -1.451211, 1, 1, 1, 1, 1,
-1.310609, 0.8671427, 1.26123, 1, 1, 1, 1, 1,
-1.295067, 1.899677, 0.7844217, 1, 1, 1, 1, 1,
-1.293176, 0.1027527, -1.321515, 1, 1, 1, 1, 1,
-1.290149, -3.160357, -1.456153, 1, 1, 1, 1, 1,
-1.284541, -0.5154858, -1.834378, 1, 1, 1, 1, 1,
-1.28392, -0.2203919, -0.2047735, 1, 1, 1, 1, 1,
-1.281042, 0.6901669, -1.989979, 1, 1, 1, 1, 1,
-1.266911, -1.222252, -1.356916, 1, 1, 1, 1, 1,
-1.259456, 0.2163946, -1.529109, 1, 1, 1, 1, 1,
-1.254492, 0.2887769, -2.44241, 1, 1, 1, 1, 1,
-1.247449, 0.4637752, -1.225206, 1, 1, 1, 1, 1,
-1.244112, -0.4931583, -0.3923109, 1, 1, 1, 1, 1,
-1.238113, 2.026183, 0.05555096, 1, 1, 1, 1, 1,
-1.235364, 0.3072655, -1.196448, 1, 1, 1, 1, 1,
-1.232615, 0.264069, -0.4545548, 0, 0, 1, 1, 1,
-1.232059, -0.091612, -1.023853, 1, 0, 0, 1, 1,
-1.231167, -0.9829029, -1.369913, 1, 0, 0, 1, 1,
-1.223242, 1.48181, -0.7660799, 1, 0, 0, 1, 1,
-1.221073, -1.60611, -3.065802, 1, 0, 0, 1, 1,
-1.219317, -1.647006, -2.855072, 1, 0, 0, 1, 1,
-1.217923, 0.3733501, -1.706221, 0, 0, 0, 1, 1,
-1.215371, -0.8695042, -3.785273, 0, 0, 0, 1, 1,
-1.211639, -1.46137, -2.78683, 0, 0, 0, 1, 1,
-1.20767, -0.4326139, -2.588723, 0, 0, 0, 1, 1,
-1.20551, -0.9001973, -3.633502, 0, 0, 0, 1, 1,
-1.205427, -0.6172912, -0.578147, 0, 0, 0, 1, 1,
-1.197368, -0.6940191, -3.882936, 0, 0, 0, 1, 1,
-1.186983, 0.07660121, -2.351021, 1, 1, 1, 1, 1,
-1.18375, -0.6248547, -2.405439, 1, 1, 1, 1, 1,
-1.176304, 0.6670234, -0.06631297, 1, 1, 1, 1, 1,
-1.169312, -0.6058032, -1.740406, 1, 1, 1, 1, 1,
-1.16522, -1.840404, -2.952474, 1, 1, 1, 1, 1,
-1.159695, 0.2820501, -1.323735, 1, 1, 1, 1, 1,
-1.158967, -0.4299246, -1.930719, 1, 1, 1, 1, 1,
-1.12973, -0.3549477, -2.293237, 1, 1, 1, 1, 1,
-1.12177, 0.5973685, -1.260867, 1, 1, 1, 1, 1,
-1.114414, -0.09607083, -1.918064, 1, 1, 1, 1, 1,
-1.108246, 0.09353462, -2.587532, 1, 1, 1, 1, 1,
-1.103429, 0.1612477, -1.473645, 1, 1, 1, 1, 1,
-1.099855, 0.7432904, -0.1975821, 1, 1, 1, 1, 1,
-1.097399, 0.3935621, -1.472603, 1, 1, 1, 1, 1,
-1.097163, -0.2487044, -3.270041, 1, 1, 1, 1, 1,
-1.091069, -0.5602081, 0.125622, 0, 0, 1, 1, 1,
-1.083495, 1.404508, -1.705374, 1, 0, 0, 1, 1,
-1.082391, 0.2827741, -2.049624, 1, 0, 0, 1, 1,
-1.082055, -0.3755597, -1.51165, 1, 0, 0, 1, 1,
-1.080607, -0.3155126, -2.296993, 1, 0, 0, 1, 1,
-1.078124, 0.822687, -0.9787439, 1, 0, 0, 1, 1,
-1.073293, -0.06054454, -1.032544, 0, 0, 0, 1, 1,
-1.071221, 0.3583395, -1.075375, 0, 0, 0, 1, 1,
-1.06812, 0.116254, -0.6363866, 0, 0, 0, 1, 1,
-1.0669, 0.1192381, 0.4510155, 0, 0, 0, 1, 1,
-1.062388, -0.5281024, -2.142209, 0, 0, 0, 1, 1,
-1.05614, -0.0536783, -1.076345, 0, 0, 0, 1, 1,
-1.046739, -0.9509678, -0.5077939, 0, 0, 0, 1, 1,
-1.043071, 0.3874887, -1.35525, 1, 1, 1, 1, 1,
-1.035399, 0.4785461, -1.637993, 1, 1, 1, 1, 1,
-1.029739, -0.8971785, -1.885936, 1, 1, 1, 1, 1,
-1.027733, 1.423226, -0.311123, 1, 1, 1, 1, 1,
-1.027364, 1.578909, -1.034116, 1, 1, 1, 1, 1,
-1.021171, -1.553041, -4.05616, 1, 1, 1, 1, 1,
-1.018648, 0.6862125, 0.3711137, 1, 1, 1, 1, 1,
-1.018164, 0.9630498, -2.159675, 1, 1, 1, 1, 1,
-1.013232, 1.019247, -1.455342, 1, 1, 1, 1, 1,
-0.9977618, -1.703512, -2.30153, 1, 1, 1, 1, 1,
-0.9950493, -0.6497525, -3.54363, 1, 1, 1, 1, 1,
-0.9947162, -2.150246, -4.354825, 1, 1, 1, 1, 1,
-0.9940915, 0.2916748, -1.089283, 1, 1, 1, 1, 1,
-0.9940823, -1.176192, -1.530026, 1, 1, 1, 1, 1,
-0.9883927, 0.5482656, -0.3347894, 1, 1, 1, 1, 1,
-0.9695414, -1.075351, -1.122877, 0, 0, 1, 1, 1,
-0.9650759, -1.399158, -2.093836, 1, 0, 0, 1, 1,
-0.9649601, 0.52245, -1.5411, 1, 0, 0, 1, 1,
-0.9649104, -0.7186246, -1.418759, 1, 0, 0, 1, 1,
-0.9624296, -0.7959599, 0.459178, 1, 0, 0, 1, 1,
-0.9601694, -0.1321338, -0.8625354, 1, 0, 0, 1, 1,
-0.948411, 0.8758151, 0.3716403, 0, 0, 0, 1, 1,
-0.9482851, 1.43998, -0.7626356, 0, 0, 0, 1, 1,
-0.9447437, -1.057745, -1.780285, 0, 0, 0, 1, 1,
-0.9422022, -0.05943352, 0.03028294, 0, 0, 0, 1, 1,
-0.9380862, 0.7807211, -0.7432168, 0, 0, 0, 1, 1,
-0.9291086, -0.2247186, -0.8001202, 0, 0, 0, 1, 1,
-0.9289047, -0.2751914, -0.5606274, 0, 0, 0, 1, 1,
-0.9277411, 0.3045978, -0.8993167, 1, 1, 1, 1, 1,
-0.9243886, -0.3668757, -1.641905, 1, 1, 1, 1, 1,
-0.9229727, -0.8367705, -3.527268, 1, 1, 1, 1, 1,
-0.9214882, -0.3852519, -2.206803, 1, 1, 1, 1, 1,
-0.9193494, 0.7015135, -0.8637216, 1, 1, 1, 1, 1,
-0.9103864, 1.267683, -1.064245, 1, 1, 1, 1, 1,
-0.9099723, -0.9946583, -2.177309, 1, 1, 1, 1, 1,
-0.9098595, -1.318109, -4.265061, 1, 1, 1, 1, 1,
-0.9064882, -0.9801786, -2.709378, 1, 1, 1, 1, 1,
-0.9000012, 0.3808425, 0.8998549, 1, 1, 1, 1, 1,
-0.8999274, 0.005369304, -2.273143, 1, 1, 1, 1, 1,
-0.8747804, 1.592397, 1.538883, 1, 1, 1, 1, 1,
-0.868308, 0.5842089, 1.147559, 1, 1, 1, 1, 1,
-0.8442591, -0.2367087, -0.5612966, 1, 1, 1, 1, 1,
-0.8432629, -1.109067, -1.249694, 1, 1, 1, 1, 1,
-0.8420051, -0.2101761, -1.470818, 0, 0, 1, 1, 1,
-0.8357301, 1.684687, 0.1767738, 1, 0, 0, 1, 1,
-0.8302731, -0.2037936, -1.360493, 1, 0, 0, 1, 1,
-0.8241975, -2.12772, -1.874672, 1, 0, 0, 1, 1,
-0.805092, -0.2376497, -3.486571, 1, 0, 0, 1, 1,
-0.804842, 1.577249, -1.984728, 1, 0, 0, 1, 1,
-0.7935781, 0.8676702, -0.5001407, 0, 0, 0, 1, 1,
-0.7895688, -1.092294, -2.012972, 0, 0, 0, 1, 1,
-0.7865868, -0.9004454, -1.761516, 0, 0, 0, 1, 1,
-0.785455, 1.993655, -0.6457546, 0, 0, 0, 1, 1,
-0.7821431, 0.6567258, -0.4156689, 0, 0, 0, 1, 1,
-0.7811219, -0.3875787, -0.3117365, 0, 0, 0, 1, 1,
-0.7754317, -2.031153, -4.90239, 0, 0, 0, 1, 1,
-0.7743525, -1.082111, -0.5669686, 1, 1, 1, 1, 1,
-0.7730995, -0.4709224, -3.007692, 1, 1, 1, 1, 1,
-0.7710999, 1.345594, 0.9520205, 1, 1, 1, 1, 1,
-0.7667347, -1.362358, -3.109091, 1, 1, 1, 1, 1,
-0.7660455, 0.1240576, -1.616246, 1, 1, 1, 1, 1,
-0.7625343, 1.433409, -2.181154, 1, 1, 1, 1, 1,
-0.7548509, -0.4027562, -2.900454, 1, 1, 1, 1, 1,
-0.7524404, -0.4046492, -2.4858, 1, 1, 1, 1, 1,
-0.7492552, -0.829729, -2.46268, 1, 1, 1, 1, 1,
-0.7465045, -0.4913817, -1.822951, 1, 1, 1, 1, 1,
-0.7461203, -2.112858, -1.504343, 1, 1, 1, 1, 1,
-0.7422541, 1.151841, 1.613325, 1, 1, 1, 1, 1,
-0.7416973, 1.743895, -1.438075, 1, 1, 1, 1, 1,
-0.7410675, -0.7983641, -2.912363, 1, 1, 1, 1, 1,
-0.739878, -1.431061, -2.422037, 1, 1, 1, 1, 1,
-0.7371777, 0.1850606, -2.272262, 0, 0, 1, 1, 1,
-0.7355497, 1.090989, -0.2521767, 1, 0, 0, 1, 1,
-0.7346597, -2.266147, -3.916395, 1, 0, 0, 1, 1,
-0.7344246, 0.129706, -3.020058, 1, 0, 0, 1, 1,
-0.733712, 0.9983022, -1.752186, 1, 0, 0, 1, 1,
-0.7254755, 0.9893473, -2.039459, 1, 0, 0, 1, 1,
-0.7225785, -0.6329961, -0.2339981, 0, 0, 0, 1, 1,
-0.7201365, -1.545151, -1.527346, 0, 0, 0, 1, 1,
-0.7157807, 0.1404371, -1.083734, 0, 0, 0, 1, 1,
-0.7141008, 1.051368, 1.272456, 0, 0, 0, 1, 1,
-0.7128127, 0.04612059, -0.8759005, 0, 0, 0, 1, 1,
-0.7061843, 0.3353607, -1.762876, 0, 0, 0, 1, 1,
-0.6953062, 1.699502, -1.57882, 0, 0, 0, 1, 1,
-0.688547, -1.667638, -3.136541, 1, 1, 1, 1, 1,
-0.6883456, 1.033694, 0.6869361, 1, 1, 1, 1, 1,
-0.6858721, -1.40715, -0.8772756, 1, 1, 1, 1, 1,
-0.6834259, -0.7305055, -3.851704, 1, 1, 1, 1, 1,
-0.6741313, -0.8336258, -2.85141, 1, 1, 1, 1, 1,
-0.6713405, 0.04096761, -3.584146, 1, 1, 1, 1, 1,
-0.6685378, 1.186321, -0.5899806, 1, 1, 1, 1, 1,
-0.6667594, -0.05373627, -4.014332, 1, 1, 1, 1, 1,
-0.6573288, 1.569185, -0.4954231, 1, 1, 1, 1, 1,
-0.6557429, 0.7529353, -1.081462, 1, 1, 1, 1, 1,
-0.6552263, -0.178759, -3.465019, 1, 1, 1, 1, 1,
-0.65514, -0.261699, -2.651061, 1, 1, 1, 1, 1,
-0.6545199, 0.8509567, -0.5071106, 1, 1, 1, 1, 1,
-0.6478893, -0.3759578, -1.465685, 1, 1, 1, 1, 1,
-0.644558, -1.545016, -2.358921, 1, 1, 1, 1, 1,
-0.6368977, -0.07865541, -1.296658, 0, 0, 1, 1, 1,
-0.6311222, 0.5876304, 0.797651, 1, 0, 0, 1, 1,
-0.6284094, 1.850116, 0.04388523, 1, 0, 0, 1, 1,
-0.6209567, -1.540252, -2.880851, 1, 0, 0, 1, 1,
-0.6189789, 0.3496799, -0.6820921, 1, 0, 0, 1, 1,
-0.6171417, -0.2768142, -2.299657, 1, 0, 0, 1, 1,
-0.6155152, -1.445205, -1.672371, 0, 0, 0, 1, 1,
-0.6152492, 1.514256, -1.861866, 0, 0, 0, 1, 1,
-0.6109209, -0.7719979, -2.73762, 0, 0, 0, 1, 1,
-0.6097986, -1.371438, -3.302333, 0, 0, 0, 1, 1,
-0.6040546, -1.063468, -3.935851, 0, 0, 0, 1, 1,
-0.6026406, 1.151941, -1.104275, 0, 0, 0, 1, 1,
-0.6022291, 0.9256954, 0.3598347, 0, 0, 0, 1, 1,
-0.6001903, 1.361548, -0.8843088, 1, 1, 1, 1, 1,
-0.5922462, -0.896069, -4.025377, 1, 1, 1, 1, 1,
-0.5832959, -0.3680696, -2.311272, 1, 1, 1, 1, 1,
-0.5831528, 0.3606928, -3.508535, 1, 1, 1, 1, 1,
-0.5794303, 0.8206767, -0.1512986, 1, 1, 1, 1, 1,
-0.571678, -0.2642861, -1.035033, 1, 1, 1, 1, 1,
-0.5709813, 0.07176777, -1.626275, 1, 1, 1, 1, 1,
-0.5633882, -0.2729851, -1.594731, 1, 1, 1, 1, 1,
-0.5628789, -0.6504601, -2.343383, 1, 1, 1, 1, 1,
-0.5617834, -0.2244031, -0.7931027, 1, 1, 1, 1, 1,
-0.5609873, 0.6936958, -0.4587579, 1, 1, 1, 1, 1,
-0.5595106, 0.3342477, -0.09174974, 1, 1, 1, 1, 1,
-0.5592768, 0.5254174, -1.733232, 1, 1, 1, 1, 1,
-0.553494, -1.020174, -2.950608, 1, 1, 1, 1, 1,
-0.5494674, 1.203716, -0.2033443, 1, 1, 1, 1, 1,
-0.5444714, -1.599562, -4.153947, 0, 0, 1, 1, 1,
-0.5406924, 0.6465775, -1.566569, 1, 0, 0, 1, 1,
-0.5392094, -2.495133, -1.437032, 1, 0, 0, 1, 1,
-0.532534, 0.2760984, -1.967447, 1, 0, 0, 1, 1,
-0.5280964, -0.6438963, -2.553844, 1, 0, 0, 1, 1,
-0.5234263, 0.2613297, 0.08123105, 1, 0, 0, 1, 1,
-0.5197868, 0.5437863, 0.4220911, 0, 0, 0, 1, 1,
-0.5119084, -0.7965879, -2.509612, 0, 0, 0, 1, 1,
-0.5104007, 1.827454, 1.131998, 0, 0, 0, 1, 1,
-0.5010292, 0.491273, -1.592268, 0, 0, 0, 1, 1,
-0.4957868, -0.1281607, -2.938468, 0, 0, 0, 1, 1,
-0.4918759, -0.7500772, -1.236951, 0, 0, 0, 1, 1,
-0.4884023, -0.6303157, -3.096429, 0, 0, 0, 1, 1,
-0.4815486, 0.4739308, -0.6126562, 1, 1, 1, 1, 1,
-0.4770099, 0.6796671, -0.9711835, 1, 1, 1, 1, 1,
-0.4769047, 1.499205, 0.8787503, 1, 1, 1, 1, 1,
-0.4705986, -0.03939014, -2.629313, 1, 1, 1, 1, 1,
-0.4686735, 0.6885519, 0.2855545, 1, 1, 1, 1, 1,
-0.4664221, -0.8841938, -2.85296, 1, 1, 1, 1, 1,
-0.4661008, -0.5601668, -2.734703, 1, 1, 1, 1, 1,
-0.4637761, -0.3271016, -2.232399, 1, 1, 1, 1, 1,
-0.4632065, -0.6319907, -3.161808, 1, 1, 1, 1, 1,
-0.4623761, 0.19733, -0.2214925, 1, 1, 1, 1, 1,
-0.4609838, -0.5963023, -2.625825, 1, 1, 1, 1, 1,
-0.4607181, 0.4172435, -1.266868, 1, 1, 1, 1, 1,
-0.4603639, -0.2418995, -2.581925, 1, 1, 1, 1, 1,
-0.4588151, -0.9047362, -1.452809, 1, 1, 1, 1, 1,
-0.4555353, 0.6103882, -0.03543552, 1, 1, 1, 1, 1,
-0.4532196, -0.7253013, -0.8089561, 0, 0, 1, 1, 1,
-0.4500763, -2.424922, -2.622206, 1, 0, 0, 1, 1,
-0.4457397, 0.5734246, -0.8655628, 1, 0, 0, 1, 1,
-0.4441261, -1.023359, -2.207097, 1, 0, 0, 1, 1,
-0.4400906, -0.425233, -3.83619, 1, 0, 0, 1, 1,
-0.4336818, 0.9119945, -1.881009, 1, 0, 0, 1, 1,
-0.4333745, -0.2581666, -3.097638, 0, 0, 0, 1, 1,
-0.4251058, -0.6208542, -2.51682, 0, 0, 0, 1, 1,
-0.4243399, -0.7514865, -4.108716, 0, 0, 0, 1, 1,
-0.4187149, -0.8034236, -3.418952, 0, 0, 0, 1, 1,
-0.4174688, -1.408565, -1.929836, 0, 0, 0, 1, 1,
-0.4167474, -1.274939, -2.775692, 0, 0, 0, 1, 1,
-0.4159302, 0.2994316, 0.4833521, 0, 0, 0, 1, 1,
-0.4148439, 0.529517, -1.383066, 1, 1, 1, 1, 1,
-0.4141205, 1.78766, 0.4155794, 1, 1, 1, 1, 1,
-0.4120257, -0.4573765, -0.4433225, 1, 1, 1, 1, 1,
-0.4111525, 0.1386137, -2.663062, 1, 1, 1, 1, 1,
-0.4105041, -0.8265609, -1.375871, 1, 1, 1, 1, 1,
-0.4078131, -0.04598283, -0.7430384, 1, 1, 1, 1, 1,
-0.4021255, 0.41587, -0.7925529, 1, 1, 1, 1, 1,
-0.4005183, -1.369363, -3.064373, 1, 1, 1, 1, 1,
-0.3979154, -0.0003113227, -1.254973, 1, 1, 1, 1, 1,
-0.3974975, -0.3950424, -2.552609, 1, 1, 1, 1, 1,
-0.395698, 1.710247, -0.1563545, 1, 1, 1, 1, 1,
-0.3939028, -1.593724, -0.9969084, 1, 1, 1, 1, 1,
-0.3917719, 1.851928, 1.442846, 1, 1, 1, 1, 1,
-0.3908538, 0.04909238, 0.237665, 1, 1, 1, 1, 1,
-0.3893169, -0.4946658, -2.46757, 1, 1, 1, 1, 1,
-0.3870948, 1.27999, -0.5901319, 0, 0, 1, 1, 1,
-0.3855694, -0.3174658, -1.922551, 1, 0, 0, 1, 1,
-0.3803985, 0.2970268, -0.4196834, 1, 0, 0, 1, 1,
-0.3744311, -0.8641534, -1.99901, 1, 0, 0, 1, 1,
-0.3680024, -0.624203, -2.943206, 1, 0, 0, 1, 1,
-0.3657852, 0.5158945, -0.3770043, 1, 0, 0, 1, 1,
-0.3652123, 0.1439866, -1.6554, 0, 0, 0, 1, 1,
-0.3635677, 0.843638, -0.9348788, 0, 0, 0, 1, 1,
-0.3621657, 0.1752599, -0.8077781, 0, 0, 0, 1, 1,
-0.3599472, -1.647051, -4.017994, 0, 0, 0, 1, 1,
-0.3522621, -1.573955, -3.920958, 0, 0, 0, 1, 1,
-0.3509689, -1.15088, -1.432476, 0, 0, 0, 1, 1,
-0.3484505, 0.5556818, 1.398126, 0, 0, 0, 1, 1,
-0.3470245, 0.2574262, -1.290773, 1, 1, 1, 1, 1,
-0.3398807, 0.07828267, -1.346303, 1, 1, 1, 1, 1,
-0.3398471, -1.039892, -3.26811, 1, 1, 1, 1, 1,
-0.339732, -0.36758, -2.1528, 1, 1, 1, 1, 1,
-0.3389649, 0.03665271, -1.550676, 1, 1, 1, 1, 1,
-0.3388219, 1.009563, -1.516321, 1, 1, 1, 1, 1,
-0.3347166, -0.9433554, -1.81491, 1, 1, 1, 1, 1,
-0.3315117, 0.1618181, -0.05749545, 1, 1, 1, 1, 1,
-0.3294036, -1.179124, -1.15957, 1, 1, 1, 1, 1,
-0.3287552, -0.03793394, -0.8565828, 1, 1, 1, 1, 1,
-0.3273888, 0.09131547, -1.803658, 1, 1, 1, 1, 1,
-0.3260277, -0.5288532, -2.36147, 1, 1, 1, 1, 1,
-0.3222383, 0.2986688, -0.1264291, 1, 1, 1, 1, 1,
-0.3191641, 2.05012, -0.252983, 1, 1, 1, 1, 1,
-0.3168498, 2.224899, -0.5072944, 1, 1, 1, 1, 1,
-0.3123127, 1.48814, 1.092369, 0, 0, 1, 1, 1,
-0.306707, -0.06109672, -2.165554, 1, 0, 0, 1, 1,
-0.2981842, -1.164487, -3.026218, 1, 0, 0, 1, 1,
-0.297195, -0.1977046, -1.40337, 1, 0, 0, 1, 1,
-0.2950879, -0.4361815, -2.464429, 1, 0, 0, 1, 1,
-0.2909839, -0.724533, -2.19602, 1, 0, 0, 1, 1,
-0.287641, 0.3459211, -2.312713, 0, 0, 0, 1, 1,
-0.2867311, 0.5078381, 0.7539681, 0, 0, 0, 1, 1,
-0.2821261, 0.03788121, 0.5862669, 0, 0, 0, 1, 1,
-0.2813101, -1.431179, -0.9634191, 0, 0, 0, 1, 1,
-0.2810532, -0.6653332, -0.8579317, 0, 0, 0, 1, 1,
-0.2764566, -0.3762376, -3.104766, 0, 0, 0, 1, 1,
-0.2735547, -2.333803, -2.731079, 0, 0, 0, 1, 1,
-0.2717692, 0.495057, -1.235175, 1, 1, 1, 1, 1,
-0.2711156, -0.8759462, -3.375385, 1, 1, 1, 1, 1,
-0.270348, 0.007647321, -0.2518955, 1, 1, 1, 1, 1,
-0.2677227, 0.4021848, -2.204841, 1, 1, 1, 1, 1,
-0.2587862, -0.5825852, -2.19859, 1, 1, 1, 1, 1,
-0.2520851, -0.007289869, -0.8338099, 1, 1, 1, 1, 1,
-0.2503158, -0.6158264, -2.448098, 1, 1, 1, 1, 1,
-0.2502555, -0.5313289, -1.440239, 1, 1, 1, 1, 1,
-0.2497262, 0.05768842, 0.1166671, 1, 1, 1, 1, 1,
-0.2374589, -1.424976, -3.031788, 1, 1, 1, 1, 1,
-0.2370183, -2.427913, -4.003056, 1, 1, 1, 1, 1,
-0.228013, 0.3830035, -1.861781, 1, 1, 1, 1, 1,
-0.2258558, -1.67449, -2.009892, 1, 1, 1, 1, 1,
-0.2254447, 0.7320499, -0.6811257, 1, 1, 1, 1, 1,
-0.2249726, 1.332204, -0.292337, 1, 1, 1, 1, 1,
-0.2232533, -0.1166205, -2.585382, 0, 0, 1, 1, 1,
-0.2227086, -0.4987599, -2.876948, 1, 0, 0, 1, 1,
-0.2216063, 1.30789, -1.53329, 1, 0, 0, 1, 1,
-0.2171214, 2.212656, 0.02521241, 1, 0, 0, 1, 1,
-0.2153232, -1.058459, -4.811729, 1, 0, 0, 1, 1,
-0.2133983, -1.023914, -3.496094, 1, 0, 0, 1, 1,
-0.2128965, -1.092645, -1.022455, 0, 0, 0, 1, 1,
-0.2070809, 0.443847, 0.540345, 0, 0, 0, 1, 1,
-0.2016108, -0.9959898, -2.822051, 0, 0, 0, 1, 1,
-0.2011078, -1.312354, -3.270258, 0, 0, 0, 1, 1,
-0.2005254, -0.5431634, -0.9856034, 0, 0, 0, 1, 1,
-0.199828, 2.043076, 0.3022245, 0, 0, 0, 1, 1,
-0.1985115, 0.8901006, -1.93844, 0, 0, 0, 1, 1,
-0.1934512, 0.04420517, -1.531272, 1, 1, 1, 1, 1,
-0.1907326, 0.5872432, -1.024694, 1, 1, 1, 1, 1,
-0.188644, -1.656003, -2.284233, 1, 1, 1, 1, 1,
-0.1830681, -1.230326, -3.752256, 1, 1, 1, 1, 1,
-0.1781962, 0.05661535, -2.003257, 1, 1, 1, 1, 1,
-0.1749279, -0.9249305, -2.794567, 1, 1, 1, 1, 1,
-0.1726412, -0.0187482, -1.980763, 1, 1, 1, 1, 1,
-0.171369, -1.194635, -3.842962, 1, 1, 1, 1, 1,
-0.1679345, -0.4668404, -2.272581, 1, 1, 1, 1, 1,
-0.1674886, 1.740872, -0.6168708, 1, 1, 1, 1, 1,
-0.1642014, 0.576081, -1.906191, 1, 1, 1, 1, 1,
-0.1632003, 0.9057027, 0.101604, 1, 1, 1, 1, 1,
-0.1601143, -0.6834924, -4.305952, 1, 1, 1, 1, 1,
-0.1501411, 0.3167482, -1.978989, 1, 1, 1, 1, 1,
-0.1468169, 0.5153731, 0.6074535, 1, 1, 1, 1, 1,
-0.140817, 0.5849147, 2.251642, 0, 0, 1, 1, 1,
-0.1374064, -0.6943207, -2.817713, 1, 0, 0, 1, 1,
-0.1355015, -0.2372501, -4.213546, 1, 0, 0, 1, 1,
-0.135241, -0.2137682, -2.926747, 1, 0, 0, 1, 1,
-0.1349151, 0.02410422, -3.79433, 1, 0, 0, 1, 1,
-0.1337317, -1.048234, -2.588773, 1, 0, 0, 1, 1,
-0.1303483, -0.3389954, -3.972761, 0, 0, 0, 1, 1,
-0.1276161, 0.8254352, -0.960394, 0, 0, 0, 1, 1,
-0.1249378, -0.2644849, -4.199372, 0, 0, 0, 1, 1,
-0.1243071, -0.4619492, -1.068671, 0, 0, 0, 1, 1,
-0.1173273, -0.155557, -1.466519, 0, 0, 0, 1, 1,
-0.1136911, -0.4430567, -2.911575, 0, 0, 0, 1, 1,
-0.1087041, 0.822983, -0.526363, 0, 0, 0, 1, 1,
-0.1073297, 1.393543, 0.01416744, 1, 1, 1, 1, 1,
-0.1072438, -0.3818825, -4.432218, 1, 1, 1, 1, 1,
-0.1046274, 2.121445, -1.018803, 1, 1, 1, 1, 1,
-0.09787586, 0.3840835, 1.186039, 1, 1, 1, 1, 1,
-0.09508821, 0.4094121, 0.9142873, 1, 1, 1, 1, 1,
-0.09394505, 0.985401, -0.272204, 1, 1, 1, 1, 1,
-0.09169713, 0.4434883, 0.5703244, 1, 1, 1, 1, 1,
-0.09155882, 1.811905, 1.835563, 1, 1, 1, 1, 1,
-0.09058196, 0.1660711, -0.7006049, 1, 1, 1, 1, 1,
-0.08996467, 1.719863, -0.3702243, 1, 1, 1, 1, 1,
-0.0881726, 0.5505899, 0.4617231, 1, 1, 1, 1, 1,
-0.08317369, -1.533127, -2.600861, 1, 1, 1, 1, 1,
-0.08203903, -0.7291846, -2.543375, 1, 1, 1, 1, 1,
-0.0786849, -0.9958261, -0.7262633, 1, 1, 1, 1, 1,
-0.07578603, -1.573954, -3.026268, 1, 1, 1, 1, 1,
-0.06701652, 0.3151086, -0.8583045, 0, 0, 1, 1, 1,
-0.06511268, -1.181547, -2.017747, 1, 0, 0, 1, 1,
-0.06386593, -0.583589, -4.622246, 1, 0, 0, 1, 1,
-0.06380016, 0.4447691, 1.073159, 1, 0, 0, 1, 1,
-0.06304076, 0.3358105, -0.7813511, 1, 0, 0, 1, 1,
-0.06061675, 0.1484736, 0.97381, 1, 0, 0, 1, 1,
-0.06008742, -0.699516, -2.430001, 0, 0, 0, 1, 1,
-0.05900241, -0.7716416, -0.9831895, 0, 0, 0, 1, 1,
-0.05770552, 1.23565, 0.9221321, 0, 0, 0, 1, 1,
-0.05474338, -2.001624, -3.085189, 0, 0, 0, 1, 1,
-0.05052679, -0.07040861, -0.1106212, 0, 0, 0, 1, 1,
-0.04829071, -1.098952, -4.407989, 0, 0, 0, 1, 1,
-0.04704951, -0.7443599, -4.480734, 0, 0, 0, 1, 1,
-0.04120276, -2.299161, -3.426052, 1, 1, 1, 1, 1,
-0.04027639, -1.407127, -1.816925, 1, 1, 1, 1, 1,
-0.03895498, 2.333158, -0.7388654, 1, 1, 1, 1, 1,
-0.0381298, 0.3224072, -0.3330008, 1, 1, 1, 1, 1,
-0.03282601, -1.776931, -2.910381, 1, 1, 1, 1, 1,
-0.02988854, -0.3199823, -2.443009, 1, 1, 1, 1, 1,
-0.02920269, 1.604316, -2.473561, 1, 1, 1, 1, 1,
-0.02390566, -0.3153061, -4.04239, 1, 1, 1, 1, 1,
-0.02335678, -1.204569, -3.771332, 1, 1, 1, 1, 1,
-0.02335221, -1.541283, -2.734666, 1, 1, 1, 1, 1,
-0.02274711, 1.027502, -1.121279, 1, 1, 1, 1, 1,
-0.0196904, -0.7969326, -4.98536, 1, 1, 1, 1, 1,
-0.01962449, -0.4059575, -1.956104, 1, 1, 1, 1, 1,
-0.01937799, -0.8260389, -3.020565, 1, 1, 1, 1, 1,
-0.01773468, 0.6677667, 1.057133, 1, 1, 1, 1, 1,
-0.0161803, 0.8008873, -0.302213, 0, 0, 1, 1, 1,
-0.01606352, 1.229941, 1.472269, 1, 0, 0, 1, 1,
-0.01484272, 0.7075218, -0.1228328, 1, 0, 0, 1, 1,
-0.01483745, -1.319806, -3.737949, 1, 0, 0, 1, 1,
-0.01285469, -0.7346871, -4.471077, 1, 0, 0, 1, 1,
-0.01275221, 0.315504, -2.120701, 1, 0, 0, 1, 1,
-0.0109677, 0.4638645, -1.686921, 0, 0, 0, 1, 1,
-0.009539134, 2.909157, 0.9185939, 0, 0, 0, 1, 1,
-0.007633671, 0.6965671, -1.066853, 0, 0, 0, 1, 1,
-0.005112512, -1.502515, -3.804201, 0, 0, 0, 1, 1,
-0.002813492, -0.8252999, -4.582062, 0, 0, 0, 1, 1,
-0.0006062409, -0.9282342, -3.228885, 0, 0, 0, 1, 1,
0.001221582, -0.09785682, 4.184674, 0, 0, 0, 1, 1,
0.009564736, -0.07554478, 3.779463, 1, 1, 1, 1, 1,
0.01329339, 0.412416, -2.061898, 1, 1, 1, 1, 1,
0.01354215, -0.6409348, 2.356467, 1, 1, 1, 1, 1,
0.01507075, 0.04605483, -1.732393, 1, 1, 1, 1, 1,
0.01641438, 1.331477, -0.3514113, 1, 1, 1, 1, 1,
0.02024351, -0.7918194, 5.779564, 1, 1, 1, 1, 1,
0.02033228, 0.01916959, 2.371001, 1, 1, 1, 1, 1,
0.02129651, -1.260488, 2.74247, 1, 1, 1, 1, 1,
0.02416332, -0.8681894, 2.249278, 1, 1, 1, 1, 1,
0.02437576, 0.7791094, 1.617664, 1, 1, 1, 1, 1,
0.02789717, -0.07281164, 3.364652, 1, 1, 1, 1, 1,
0.02793714, 0.2892795, -1.977041, 1, 1, 1, 1, 1,
0.02928224, -0.5351254, 2.292378, 1, 1, 1, 1, 1,
0.02964061, -0.8178236, 4.018339, 1, 1, 1, 1, 1,
0.03012382, 1.910774, 2.418616, 1, 1, 1, 1, 1,
0.03042417, -0.579228, 3.529871, 0, 0, 1, 1, 1,
0.03120819, 0.622185, 1.168121, 1, 0, 0, 1, 1,
0.0312133, -0.8501843, 2.762177, 1, 0, 0, 1, 1,
0.03347863, -0.9773934, 3.822122, 1, 0, 0, 1, 1,
0.03359987, -0.3325241, 2.850698, 1, 0, 0, 1, 1,
0.03985078, 1.313152, 0.2918177, 1, 0, 0, 1, 1,
0.04257574, 0.3829952, -0.002262029, 0, 0, 0, 1, 1,
0.04521793, 1.017655, -1.490193, 0, 0, 0, 1, 1,
0.0471642, -1.972295, 2.675747, 0, 0, 0, 1, 1,
0.05037267, 0.09571414, 0.3765656, 0, 0, 0, 1, 1,
0.05162904, -1.138725, 3.724257, 0, 0, 0, 1, 1,
0.05447407, 1.466564, -0.4365672, 0, 0, 0, 1, 1,
0.05809897, 0.4462355, 0.04675373, 0, 0, 0, 1, 1,
0.062996, -0.6801434, 1.942559, 1, 1, 1, 1, 1,
0.06369132, 0.9935366, 0.07330455, 1, 1, 1, 1, 1,
0.06622364, -0.6596121, 2.951311, 1, 1, 1, 1, 1,
0.06920667, 0.2389407, 0.3204615, 1, 1, 1, 1, 1,
0.07542229, -0.4334923, 3.34697, 1, 1, 1, 1, 1,
0.07947709, 0.03559709, 1.310941, 1, 1, 1, 1, 1,
0.08202387, 0.2162648, 0.6865503, 1, 1, 1, 1, 1,
0.08226153, -0.01152152, 3.208919, 1, 1, 1, 1, 1,
0.08249152, -0.6454792, 5.468235, 1, 1, 1, 1, 1,
0.08371269, 0.2115145, 1.170008, 1, 1, 1, 1, 1,
0.08464722, 0.9310705, 0.1085233, 1, 1, 1, 1, 1,
0.0852509, -0.4381105, 3.285537, 1, 1, 1, 1, 1,
0.08612002, -0.7137116, 4.045336, 1, 1, 1, 1, 1,
0.08617537, -0.1967944, 2.097395, 1, 1, 1, 1, 1,
0.08770294, -1.219742, 3.594809, 1, 1, 1, 1, 1,
0.08814237, -0.5343912, 2.077615, 0, 0, 1, 1, 1,
0.08931982, -1.681221, 3.929751, 1, 0, 0, 1, 1,
0.08993699, 3.457259, -0.3099266, 1, 0, 0, 1, 1,
0.09399299, 0.7281607, -1.164008, 1, 0, 0, 1, 1,
0.09651423, 0.8838871, 0.113213, 1, 0, 0, 1, 1,
0.09888589, -0.5696488, 1.887252, 1, 0, 0, 1, 1,
0.1071765, -1.013965, 2.50537, 0, 0, 0, 1, 1,
0.1076666, 1.157045, 0.4396517, 0, 0, 0, 1, 1,
0.1081598, -0.4585347, 2.088562, 0, 0, 0, 1, 1,
0.1096151, -0.3966101, 1.72771, 0, 0, 0, 1, 1,
0.1168501, 1.881223, -0.3807696, 0, 0, 0, 1, 1,
0.1170814, 0.3156638, 0.08554303, 0, 0, 0, 1, 1,
0.120701, 0.742974, -0.514383, 0, 0, 0, 1, 1,
0.1260144, -1.00655, 2.088031, 1, 1, 1, 1, 1,
0.1345977, 0.7936321, -0.6277428, 1, 1, 1, 1, 1,
0.1375476, 0.2328638, -0.1470677, 1, 1, 1, 1, 1,
0.1376809, 0.14231, 1.426753, 1, 1, 1, 1, 1,
0.1376824, 1.851512, 0.1902482, 1, 1, 1, 1, 1,
0.139699, 1.712798, -1.046643, 1, 1, 1, 1, 1,
0.1405065, -1.718116, 3.641564, 1, 1, 1, 1, 1,
0.1430699, -0.1022102, 2.13152, 1, 1, 1, 1, 1,
0.1458307, 0.7001863, -0.5087702, 1, 1, 1, 1, 1,
0.1461623, 0.3435853, 0.6072121, 1, 1, 1, 1, 1,
0.1487727, 0.4138965, -0.2960706, 1, 1, 1, 1, 1,
0.1527333, 0.5880908, -1.119216, 1, 1, 1, 1, 1,
0.1566145, 1.193769, 1.914476, 1, 1, 1, 1, 1,
0.1583205, -1.276578, 2.7396, 1, 1, 1, 1, 1,
0.1609239, 0.285871, -0.9617544, 1, 1, 1, 1, 1,
0.1623825, 0.4526839, -0.3263317, 0, 0, 1, 1, 1,
0.1655287, 0.3782814, 0.07625478, 1, 0, 0, 1, 1,
0.1689695, 0.6868278, -0.4596389, 1, 0, 0, 1, 1,
0.1698895, -0.07278258, 1.899318, 1, 0, 0, 1, 1,
0.1715427, -0.5915656, 4.523794, 1, 0, 0, 1, 1,
0.1739463, -1.17492, 3.202994, 1, 0, 0, 1, 1,
0.1774746, 0.2942614, 0.3431552, 0, 0, 0, 1, 1,
0.1806233, -0.9013702, 3.200775, 0, 0, 0, 1, 1,
0.1831487, -0.230396, 1.753181, 0, 0, 0, 1, 1,
0.1845681, 1.353435, 1.072715, 0, 0, 0, 1, 1,
0.1849476, -0.1057588, 1.572837, 0, 0, 0, 1, 1,
0.1869339, 1.103075, 1.20786, 0, 0, 0, 1, 1,
0.1874985, 0.3776032, -0.9088654, 0, 0, 0, 1, 1,
0.1883018, 0.8897097, -0.2705342, 1, 1, 1, 1, 1,
0.1927469, -1.034853, 2.59862, 1, 1, 1, 1, 1,
0.194587, 0.625364, 0.8990023, 1, 1, 1, 1, 1,
0.1975316, 1.513231, -1.280574, 1, 1, 1, 1, 1,
0.1986789, -0.825581, 3.778679, 1, 1, 1, 1, 1,
0.2011787, 0.5493785, -0.383598, 1, 1, 1, 1, 1,
0.202587, -0.1480958, 1.290777, 1, 1, 1, 1, 1,
0.2077146, 0.1176508, 0.4479863, 1, 1, 1, 1, 1,
0.2080146, -0.02141631, 3.112456, 1, 1, 1, 1, 1,
0.2087897, -0.5590027, 2.847942, 1, 1, 1, 1, 1,
0.2099367, -0.4295122, 2.110512, 1, 1, 1, 1, 1,
0.2110905, -0.003050234, 1.844137, 1, 1, 1, 1, 1,
0.2111639, 0.2645843, 0.672487, 1, 1, 1, 1, 1,
0.2125913, 2.504915, 1.139044, 1, 1, 1, 1, 1,
0.2127347, -0.1284661, 2.461349, 1, 1, 1, 1, 1,
0.2176026, 0.8175778, 0.05830204, 0, 0, 1, 1, 1,
0.2190777, 1.170434, -1.294739, 1, 0, 0, 1, 1,
0.2222841, 0.8910081, 0.765277, 1, 0, 0, 1, 1,
0.2227735, 1.83781, 0.2952081, 1, 0, 0, 1, 1,
0.2247653, 0.2470847, 1.053881, 1, 0, 0, 1, 1,
0.2438288, 0.6250536, 0.8358847, 1, 0, 0, 1, 1,
0.2460596, -0.550167, 4.513421, 0, 0, 0, 1, 1,
0.2474201, -0.6046211, 3.543995, 0, 0, 0, 1, 1,
0.2546804, -1.279371, 2.135651, 0, 0, 0, 1, 1,
0.2552129, -0.883108, 3.502876, 0, 0, 0, 1, 1,
0.2576797, -1.522158, 1.784428, 0, 0, 0, 1, 1,
0.2580652, -0.4303622, 2.814583, 0, 0, 0, 1, 1,
0.2595332, -1.484182, 2.473862, 0, 0, 0, 1, 1,
0.2596189, 2.231164, 2.093774, 1, 1, 1, 1, 1,
0.2620175, -0.7960961, 2.524746, 1, 1, 1, 1, 1,
0.263712, -1.441423, 3.689097, 1, 1, 1, 1, 1,
0.2679606, 1.06208, 1.980053, 1, 1, 1, 1, 1,
0.2688173, -0.3952063, 1.101535, 1, 1, 1, 1, 1,
0.2722426, 2.589566, 0.112551, 1, 1, 1, 1, 1,
0.2726485, -0.04630888, 0.8896467, 1, 1, 1, 1, 1,
0.2748886, 0.0521072, 2.383249, 1, 1, 1, 1, 1,
0.2751149, 1.809474, 0.4030234, 1, 1, 1, 1, 1,
0.2771158, 1.056826, 0.7564601, 1, 1, 1, 1, 1,
0.2809453, 0.9169869, 0.8277045, 1, 1, 1, 1, 1,
0.281971, -0.8551249, 2.659147, 1, 1, 1, 1, 1,
0.2831147, 0.3398807, 2.398279, 1, 1, 1, 1, 1,
0.2841622, -0.757139, 4.962402, 1, 1, 1, 1, 1,
0.2860157, 0.4666025, 0.8984081, 1, 1, 1, 1, 1,
0.2863179, -0.4728008, 4.268243, 0, 0, 1, 1, 1,
0.287329, 1.166632, -0.1346977, 1, 0, 0, 1, 1,
0.2889325, -1.746027, 3.360447, 1, 0, 0, 1, 1,
0.2894023, -0.1252459, 2.091027, 1, 0, 0, 1, 1,
0.2894701, -0.5858094, 2.672627, 1, 0, 0, 1, 1,
0.2909405, 0.4764419, -0.4069662, 1, 0, 0, 1, 1,
0.303693, -0.6453183, 2.623498, 0, 0, 0, 1, 1,
0.3048865, 0.8059301, 0.3646059, 0, 0, 0, 1, 1,
0.3123255, -0.9944177, 0.5661497, 0, 0, 0, 1, 1,
0.3158582, 0.9855762, 0.4217718, 0, 0, 0, 1, 1,
0.3172349, 1.593306, -1.857814, 0, 0, 0, 1, 1,
0.3182327, -0.6908611, 3.335523, 0, 0, 0, 1, 1,
0.3200672, 0.008412095, 1.676376, 0, 0, 0, 1, 1,
0.3217591, -0.1045787, 1.753942, 1, 1, 1, 1, 1,
0.3257464, -0.23325, 3.493433, 1, 1, 1, 1, 1,
0.3335516, 0.08081981, 1.591887, 1, 1, 1, 1, 1,
0.3360707, -0.7697171, 3.529825, 1, 1, 1, 1, 1,
0.3371346, 2.142015, -0.117654, 1, 1, 1, 1, 1,
0.3388984, -0.6655462, 1.126075, 1, 1, 1, 1, 1,
0.3389254, 0.3332712, 3.402659, 1, 1, 1, 1, 1,
0.3396554, -2.487263, 2.979411, 1, 1, 1, 1, 1,
0.3397197, 2.325269, -0.8009025, 1, 1, 1, 1, 1,
0.3428794, -1.201302, 3.321253, 1, 1, 1, 1, 1,
0.3450456, 0.329138, 1.948518, 1, 1, 1, 1, 1,
0.3468588, 0.1792819, -0.02483159, 1, 1, 1, 1, 1,
0.3490275, 0.7986737, -0.6246634, 1, 1, 1, 1, 1,
0.3500445, 1.47145, 0.850563, 1, 1, 1, 1, 1,
0.3513905, -0.4371544, 2.161423, 1, 1, 1, 1, 1,
0.3552567, 0.4839571, -0.6181053, 0, 0, 1, 1, 1,
0.3571258, -1.274518, 1.593457, 1, 0, 0, 1, 1,
0.3577889, 0.6189294, 0.8534064, 1, 0, 0, 1, 1,
0.359394, -0.6346003, 1.525747, 1, 0, 0, 1, 1,
0.3602514, -0.1027747, 0.2458273, 1, 0, 0, 1, 1,
0.3604916, 0.7361001, -1.486545, 1, 0, 0, 1, 1,
0.3610966, 0.5943546, 0.5852697, 0, 0, 0, 1, 1,
0.3755068, -1.648108, 3.211244, 0, 0, 0, 1, 1,
0.3760219, 0.5479744, 2.679088, 0, 0, 0, 1, 1,
0.377147, 0.2711633, 1.066722, 0, 0, 0, 1, 1,
0.3792221, -0.286583, 3.23948, 0, 0, 0, 1, 1,
0.380466, -0.3054996, 1.846203, 0, 0, 0, 1, 1,
0.3881521, -0.4443786, 3.034235, 0, 0, 0, 1, 1,
0.3928329, 0.612679, 2.868588, 1, 1, 1, 1, 1,
0.3966312, 0.3210736, -0.4077718, 1, 1, 1, 1, 1,
0.3976387, 2.742456, 0.7680629, 1, 1, 1, 1, 1,
0.4054108, -0.9877959, 1.363937, 1, 1, 1, 1, 1,
0.4057472, 0.2973975, 0.2485676, 1, 1, 1, 1, 1,
0.4078149, 0.09838647, 0.01516885, 1, 1, 1, 1, 1,
0.4084232, -0.1238278, 3.145754, 1, 1, 1, 1, 1,
0.4125711, 0.5965976, 2.745164, 1, 1, 1, 1, 1,
0.4164349, 0.2865956, -0.5177884, 1, 1, 1, 1, 1,
0.4187775, 0.4956273, 3.664751, 1, 1, 1, 1, 1,
0.4253556, -1.197104, 4.589869, 1, 1, 1, 1, 1,
0.4318491, 0.6119893, 0.04630438, 1, 1, 1, 1, 1,
0.4338325, -0.0676188, 1.10452, 1, 1, 1, 1, 1,
0.441496, 1.174381, 1.39124, 1, 1, 1, 1, 1,
0.4415681, 0.4194234, 1.258999, 1, 1, 1, 1, 1,
0.4416841, -0.1122416, 1.393949, 0, 0, 1, 1, 1,
0.4430161, -0.3400058, 1.103598, 1, 0, 0, 1, 1,
0.4452011, 0.9463293, -0.3693289, 1, 0, 0, 1, 1,
0.4491156, -0.1464474, 3.717988, 1, 0, 0, 1, 1,
0.4493329, 0.7268154, 0.147036, 1, 0, 0, 1, 1,
0.4510776, -1.810649, 2.762537, 1, 0, 0, 1, 1,
0.4536281, 1.201045, 1.079071, 0, 0, 0, 1, 1,
0.4544566, 0.3654719, 0.8093125, 0, 0, 0, 1, 1,
0.4577248, 0.7900167, -0.5620563, 0, 0, 0, 1, 1,
0.4619744, -0.3850777, 2.15233, 0, 0, 0, 1, 1,
0.4639691, 1.10893, -0.3455916, 0, 0, 0, 1, 1,
0.4683433, -0.272167, 2.761487, 0, 0, 0, 1, 1,
0.4690326, -1.102905, 2.044319, 0, 0, 0, 1, 1,
0.4712174, 0.2580813, 1.565051, 1, 1, 1, 1, 1,
0.4734521, -0.6146679, 3.85244, 1, 1, 1, 1, 1,
0.482086, 0.2851375, 1.269036, 1, 1, 1, 1, 1,
0.4835906, -0.7425831, 2.359339, 1, 1, 1, 1, 1,
0.4864222, 0.7781817, -0.02351825, 1, 1, 1, 1, 1,
0.4887172, -0.6747661, 1.31892, 1, 1, 1, 1, 1,
0.4889395, 1.533156, -0.2794608, 1, 1, 1, 1, 1,
0.4976866, 0.2804005, 1.26186, 1, 1, 1, 1, 1,
0.4977187, -1.148047, 1.721403, 1, 1, 1, 1, 1,
0.4996554, 0.3280979, 0.5812014, 1, 1, 1, 1, 1,
0.5009817, 0.1839701, 1.782421, 1, 1, 1, 1, 1,
0.5032766, -0.3345205, 3.256456, 1, 1, 1, 1, 1,
0.5063145, 2.43746, -0.2068368, 1, 1, 1, 1, 1,
0.5084756, 0.2564619, 3.188004, 1, 1, 1, 1, 1,
0.5143435, -0.6743412, 2.428301, 1, 1, 1, 1, 1,
0.5145231, -1.280617, 3.545511, 0, 0, 1, 1, 1,
0.5219979, 0.5230315, 1.241843, 1, 0, 0, 1, 1,
0.5264857, 0.2488728, 1.423917, 1, 0, 0, 1, 1,
0.533404, 2.295295, -0.08797924, 1, 0, 0, 1, 1,
0.5350174, 1.238715, 1.526444, 1, 0, 0, 1, 1,
0.5378017, 0.8843908, 1.702506, 1, 0, 0, 1, 1,
0.5406585, 0.09459076, 1.588902, 0, 0, 0, 1, 1,
0.5414607, -0.04905004, 2.869884, 0, 0, 0, 1, 1,
0.5460666, -0.7734663, 2.627824, 0, 0, 0, 1, 1,
0.5477458, 0.6136051, 2.056458, 0, 0, 0, 1, 1,
0.5526131, -0.0591069, 1.657535, 0, 0, 0, 1, 1,
0.5585887, 0.6800138, 0.8946517, 0, 0, 0, 1, 1,
0.5671328, -0.2218646, 3.378604, 0, 0, 0, 1, 1,
0.5713951, -0.5076342, 1.972646, 1, 1, 1, 1, 1,
0.5716543, 0.453424, 1.992894, 1, 1, 1, 1, 1,
0.5735252, -0.9231728, 1.615448, 1, 1, 1, 1, 1,
0.5772445, 0.2113186, 1.444329, 1, 1, 1, 1, 1,
0.5822421, 0.1610578, 2.137838, 1, 1, 1, 1, 1,
0.5824255, -1.680864, 3.248501, 1, 1, 1, 1, 1,
0.5890429, -0.7980112, 0.3960534, 1, 1, 1, 1, 1,
0.589321, -0.937753, 2.872416, 1, 1, 1, 1, 1,
0.59258, 0.9325275, -0.31514, 1, 1, 1, 1, 1,
0.5956305, 1.353367, 0.2055622, 1, 1, 1, 1, 1,
0.5977042, 0.4223411, 1.184846, 1, 1, 1, 1, 1,
0.6003839, 0.3861066, 0.7092322, 1, 1, 1, 1, 1,
0.6044068, 1.036799, 0.0916989, 1, 1, 1, 1, 1,
0.6065534, 0.7207885, 1.683067, 1, 1, 1, 1, 1,
0.60696, -0.01566254, 2.56587, 1, 1, 1, 1, 1,
0.6140608, -2.233434, 2.089065, 0, 0, 1, 1, 1,
0.6202742, 0.07027951, 0.5170519, 1, 0, 0, 1, 1,
0.6224633, 0.4312207, 0.7534877, 1, 0, 0, 1, 1,
0.627475, -0.5891253, 2.575886, 1, 0, 0, 1, 1,
0.635382, 0.2625402, 1.185089, 1, 0, 0, 1, 1,
0.6381454, 0.5495861, 1.967916, 1, 0, 0, 1, 1,
0.638925, 0.7274095, 0.6357428, 0, 0, 0, 1, 1,
0.6412382, -1.488923, 3.007185, 0, 0, 0, 1, 1,
0.6431046, -0.740083, 2.62596, 0, 0, 0, 1, 1,
0.6510537, -0.02910055, 2.622911, 0, 0, 0, 1, 1,
0.651897, -0.1855824, 0.9302986, 0, 0, 0, 1, 1,
0.6538494, -0.1190026, 1.463519, 0, 0, 0, 1, 1,
0.6632242, 0.7414706, 1.105947, 0, 0, 0, 1, 1,
0.6634321, -2.538464, 3.800485, 1, 1, 1, 1, 1,
0.6636576, -0.6585877, 2.601125, 1, 1, 1, 1, 1,
0.6667945, 1.465424, 0.904659, 1, 1, 1, 1, 1,
0.6686017, -1.591245, 3.076124, 1, 1, 1, 1, 1,
0.67159, -0.6585496, 3.775978, 1, 1, 1, 1, 1,
0.6761678, 0.06928936, 1.740075, 1, 1, 1, 1, 1,
0.6837368, 0.04304281, -0.2098424, 1, 1, 1, 1, 1,
0.6871821, 0.3176925, 0.4482078, 1, 1, 1, 1, 1,
0.6974018, 1.697526, 0.4230478, 1, 1, 1, 1, 1,
0.7048677, 0.260386, 1.672306, 1, 1, 1, 1, 1,
0.7059383, -0.7941499, 2.172045, 1, 1, 1, 1, 1,
0.7103344, 0.08287, 0.2032297, 1, 1, 1, 1, 1,
0.7107136, -1.695809, 5.56429, 1, 1, 1, 1, 1,
0.7134251, 0.1194035, 0.2463212, 1, 1, 1, 1, 1,
0.7170092, -1.325759, 4.804826, 1, 1, 1, 1, 1,
0.7204581, 0.87106, 2.290657, 0, 0, 1, 1, 1,
0.7255024, 0.8720108, 0.9885998, 1, 0, 0, 1, 1,
0.7257256, -1.816913, 3.622622, 1, 0, 0, 1, 1,
0.7439661, 1.161137, 1.556655, 1, 0, 0, 1, 1,
0.7507889, -0.005034293, 0.5333908, 1, 0, 0, 1, 1,
0.7513195, -0.7607533, 3.558406, 1, 0, 0, 1, 1,
0.7546855, -0.5785878, 0.9023889, 0, 0, 0, 1, 1,
0.7637398, -0.2056871, 2.335667, 0, 0, 0, 1, 1,
0.7645669, -0.6432422, 1.855258, 0, 0, 0, 1, 1,
0.7659461, -0.9339828, 2.633123, 0, 0, 0, 1, 1,
0.7665169, -0.5762329, 2.634402, 0, 0, 0, 1, 1,
0.7682067, 0.5403685, 2.751233, 0, 0, 0, 1, 1,
0.7703522, -0.004483178, 1.778004, 0, 0, 0, 1, 1,
0.7714595, 0.6425747, 1.194329, 1, 1, 1, 1, 1,
0.7751582, 0.6326547, 0.3470726, 1, 1, 1, 1, 1,
0.7842004, -1.53066, 2.430733, 1, 1, 1, 1, 1,
0.7846686, -1.114681, 2.890119, 1, 1, 1, 1, 1,
0.7869586, -0.3610618, 1.722966, 1, 1, 1, 1, 1,
0.7872553, 0.5068266, 0.9383097, 1, 1, 1, 1, 1,
0.788652, 2.097459, 0.6551116, 1, 1, 1, 1, 1,
0.7905391, -1.085098, 1.551701, 1, 1, 1, 1, 1,
0.790947, -0.2066333, 3.10909, 1, 1, 1, 1, 1,
0.7924258, 1.2551, 0.3143813, 1, 1, 1, 1, 1,
0.793373, -1.24131, 2.162017, 1, 1, 1, 1, 1,
0.7956918, 0.5552933, 0.2540542, 1, 1, 1, 1, 1,
0.7969663, 0.4235564, -0.4821688, 1, 1, 1, 1, 1,
0.8019992, 0.8523617, 0.5460974, 1, 1, 1, 1, 1,
0.8020366, -0.3621795, 1.90166, 1, 1, 1, 1, 1,
0.8031675, -1.224061, 1.687709, 0, 0, 1, 1, 1,
0.8055649, 0.2261453, 1.31345, 1, 0, 0, 1, 1,
0.8063085, -0.1400925, 2.63347, 1, 0, 0, 1, 1,
0.8065287, 0.08200992, 0.5649583, 1, 0, 0, 1, 1,
0.8111268, 1.245618, 1.437588, 1, 0, 0, 1, 1,
0.8203161, -0.5230228, 3.536316, 1, 0, 0, 1, 1,
0.8214357, 1.432483, 1.091576, 0, 0, 0, 1, 1,
0.8280447, -0.1244082, 0.668617, 0, 0, 0, 1, 1,
0.830398, -0.02136202, -0.5333751, 0, 0, 0, 1, 1,
0.8310392, 0.2891585, 0.5325283, 0, 0, 0, 1, 1,
0.8324169, 0.1284257, 0.2913968, 0, 0, 0, 1, 1,
0.8329757, -0.5298161, 3.724339, 0, 0, 0, 1, 1,
0.8341019, 0.7952515, 2.494751, 0, 0, 0, 1, 1,
0.8364941, 0.1881164, 0.8552009, 1, 1, 1, 1, 1,
0.8384906, 1.379417, 1.911088, 1, 1, 1, 1, 1,
0.8416987, -1.405504, 2.234804, 1, 1, 1, 1, 1,
0.8550041, 0.3870635, 1.833433, 1, 1, 1, 1, 1,
0.8581858, 0.009388875, 1.068267, 1, 1, 1, 1, 1,
0.865032, 0.5787643, 1.263686, 1, 1, 1, 1, 1,
0.8674562, 0.7384145, 1.841503, 1, 1, 1, 1, 1,
0.8681805, -0.09723822, 1.14437, 1, 1, 1, 1, 1,
0.8747357, 0.9094723, 1.411257, 1, 1, 1, 1, 1,
0.8866053, 0.90338, 1.235721, 1, 1, 1, 1, 1,
0.887811, 1.831456, -1.160355, 1, 1, 1, 1, 1,
0.8879067, -1.593415, 1.335496, 1, 1, 1, 1, 1,
0.8901126, 0.1315206, 1.290835, 1, 1, 1, 1, 1,
0.8943838, -0.07773554, 0.1623259, 1, 1, 1, 1, 1,
0.896005, 0.837339, 1.088602, 1, 1, 1, 1, 1,
0.8970716, -0.839625, 0.3468132, 0, 0, 1, 1, 1,
0.9003693, -0.5933977, 0.8630838, 1, 0, 0, 1, 1,
0.9078339, -1.619088, 2.661069, 1, 0, 0, 1, 1,
0.911896, -0.7488551, 2.243089, 1, 0, 0, 1, 1,
0.9148346, 1.500009, -0.2250309, 1, 0, 0, 1, 1,
0.9152564, 0.4249161, 1.610319, 1, 0, 0, 1, 1,
0.926299, 0.7560732, 3.037771, 0, 0, 0, 1, 1,
0.9272581, -1.478261, 2.941159, 0, 0, 0, 1, 1,
0.9335112, 1.338425, 0.2083586, 0, 0, 0, 1, 1,
0.9337267, -0.1823231, 2.27405, 0, 0, 0, 1, 1,
0.9395187, 0.8225473, -0.6964207, 0, 0, 0, 1, 1,
0.9423223, 0.1437874, 3.178159, 0, 0, 0, 1, 1,
0.9442744, 0.1353182, 1.560238, 0, 0, 0, 1, 1,
0.9442846, 1.172133, 1.357551, 1, 1, 1, 1, 1,
0.9533022, -1.126546, 2.991239, 1, 1, 1, 1, 1,
0.9616793, 1.370826, -0.1188209, 1, 1, 1, 1, 1,
0.9684958, -1.815981, 2.166986, 1, 1, 1, 1, 1,
0.9790139, 0.4464579, 1.362301, 1, 1, 1, 1, 1,
0.9800871, 0.5382197, 0.9379796, 1, 1, 1, 1, 1,
0.9807929, -1.281131, 3.23286, 1, 1, 1, 1, 1,
0.984952, 1.444508, 2.280168, 1, 1, 1, 1, 1,
0.9929003, 0.234185, 1.44839, 1, 1, 1, 1, 1,
0.9943847, 0.9455762, -0.04300612, 1, 1, 1, 1, 1,
0.9968148, -1.14642, 1.79221, 1, 1, 1, 1, 1,
0.998929, 1.342472, 0.5401215, 1, 1, 1, 1, 1,
1.000653, -0.8026859, 3.227619, 1, 1, 1, 1, 1,
1.001307, 1.371994, 1.123809, 1, 1, 1, 1, 1,
1.006465, 0.4222476, 0.8847352, 1, 1, 1, 1, 1,
1.006534, -0.6704078, 1.840948, 0, 0, 1, 1, 1,
1.007323, -0.1176155, 0.2147746, 1, 0, 0, 1, 1,
1.010993, -0.5073018, 0.1418054, 1, 0, 0, 1, 1,
1.021617, 0.6274568, 0.5891489, 1, 0, 0, 1, 1,
1.037898, -1.236277, 1.521099, 1, 0, 0, 1, 1,
1.038087, 1.623437, 1.897527, 1, 0, 0, 1, 1,
1.03928, 0.2333991, 0.5836905, 0, 0, 0, 1, 1,
1.039869, -0.1025883, 0.3628413, 0, 0, 0, 1, 1,
1.048183, -0.1303859, -0.3055713, 0, 0, 0, 1, 1,
1.049758, -1.153418, 1.092722, 0, 0, 0, 1, 1,
1.053732, 0.9570173, 2.372137, 0, 0, 0, 1, 1,
1.056421, -1.004089, 2.16184, 0, 0, 0, 1, 1,
1.057862, -0.7512972, 3.460476, 0, 0, 0, 1, 1,
1.058281, 0.5393187, -0.5970194, 1, 1, 1, 1, 1,
1.059169, 0.03514405, -0.3841335, 1, 1, 1, 1, 1,
1.064198, -1.720084, 4.231955, 1, 1, 1, 1, 1,
1.066509, 1.12741, 1.430874, 1, 1, 1, 1, 1,
1.078319, -0.1768852, 0.8168312, 1, 1, 1, 1, 1,
1.080069, 0.6579785, 1.111032, 1, 1, 1, 1, 1,
1.088183, -0.5842392, 1.726857, 1, 1, 1, 1, 1,
1.088441, 0.8050027, 1.392157, 1, 1, 1, 1, 1,
1.089747, -0.9974338, 3.867262, 1, 1, 1, 1, 1,
1.099109, -0.8281204, 1.289297, 1, 1, 1, 1, 1,
1.102733, 0.7592322, 2.194661, 1, 1, 1, 1, 1,
1.11062, 1.215127, 0.7816333, 1, 1, 1, 1, 1,
1.112013, -0.188069, 1.642341, 1, 1, 1, 1, 1,
1.130733, -0.6959007, 1.288728, 1, 1, 1, 1, 1,
1.136098, 0.4490549, 1.60382, 1, 1, 1, 1, 1,
1.138371, -0.160215, 2.917119, 0, 0, 1, 1, 1,
1.150821, -0.5033126, 2.027445, 1, 0, 0, 1, 1,
1.151458, 0.9399369, -0.1847524, 1, 0, 0, 1, 1,
1.15189, 2.110086, 1.22235, 1, 0, 0, 1, 1,
1.154335, 0.7644408, 0.5443241, 1, 0, 0, 1, 1,
1.156496, 1.578577, 0.9867494, 1, 0, 0, 1, 1,
1.15679, -0.7077518, 1.070516, 0, 0, 0, 1, 1,
1.158497, 0.1339112, 0.3738046, 0, 0, 0, 1, 1,
1.161286, -0.3391844, 2.011143, 0, 0, 0, 1, 1,
1.176396, 1.628095, 1.145801, 0, 0, 0, 1, 1,
1.193522, 0.229718, 2.244885, 0, 0, 0, 1, 1,
1.197401, 0.1579413, 2.584767, 0, 0, 0, 1, 1,
1.19839, 0.9348139, 2.022732, 0, 0, 0, 1, 1,
1.208054, 0.09036969, 0.6348252, 1, 1, 1, 1, 1,
1.210596, -0.4641545, 1.844029, 1, 1, 1, 1, 1,
1.218264, -1.084049, 2.486145, 1, 1, 1, 1, 1,
1.219535, 0.6450087, 0.8893016, 1, 1, 1, 1, 1,
1.225838, -1.246915, 0.7251202, 1, 1, 1, 1, 1,
1.245668, 0.4951423, 0.4863177, 1, 1, 1, 1, 1,
1.246074, 0.00346778, 1.914284, 1, 1, 1, 1, 1,
1.266044, 1.021888, -1.263745, 1, 1, 1, 1, 1,
1.267151, -0.2223145, 1.038091, 1, 1, 1, 1, 1,
1.271579, 0.9900792, 0.8732821, 1, 1, 1, 1, 1,
1.280537, -1.217629, 1.506405, 1, 1, 1, 1, 1,
1.281242, 1.657362, 0.9280669, 1, 1, 1, 1, 1,
1.285731, -0.07135955, 2.069873, 1, 1, 1, 1, 1,
1.290859, -0.7639882, 1.621048, 1, 1, 1, 1, 1,
1.294185, -1.220432, 2.66855, 1, 1, 1, 1, 1,
1.309653, -1.276758, 1.503256, 0, 0, 1, 1, 1,
1.328089, 0.5593324, 1.867691, 1, 0, 0, 1, 1,
1.331092, -0.6600409, 1.604872, 1, 0, 0, 1, 1,
1.338899, -1.3728, 3.9453, 1, 0, 0, 1, 1,
1.344771, 0.3633351, 1.399165, 1, 0, 0, 1, 1,
1.362487, 0.8336345, 2.377449, 1, 0, 0, 1, 1,
1.363797, 0.6516099, -0.9437233, 0, 0, 0, 1, 1,
1.376244, 0.7572464, 2.810482, 0, 0, 0, 1, 1,
1.396252, -1.171645, 3.364579, 0, 0, 0, 1, 1,
1.398983, -0.2292906, 2.44076, 0, 0, 0, 1, 1,
1.401318, -0.1223708, 0.5140086, 0, 0, 0, 1, 1,
1.416731, 0.06835418, 1.321132, 0, 0, 0, 1, 1,
1.422678, -0.9879964, -0.0711587, 0, 0, 0, 1, 1,
1.422808, 2.060801, 1.309984, 1, 1, 1, 1, 1,
1.429336, -2.553949, 3.653851, 1, 1, 1, 1, 1,
1.443946, -0.9885044, 3.394966, 1, 1, 1, 1, 1,
1.445938, -1.720034, 4.110513, 1, 1, 1, 1, 1,
1.447473, -0.2865559, 2.006654, 1, 1, 1, 1, 1,
1.452726, 0.5456113, 0.8120483, 1, 1, 1, 1, 1,
1.454913, 1.024276, 0.907949, 1, 1, 1, 1, 1,
1.456539, 0.07279434, 1.252749, 1, 1, 1, 1, 1,
1.466943, 0.7809637, 1.784986, 1, 1, 1, 1, 1,
1.480743, -1.884263, 2.181384, 1, 1, 1, 1, 1,
1.483527, -0.4885468, 0.7947344, 1, 1, 1, 1, 1,
1.483869, -0.2066592, 0.6710736, 1, 1, 1, 1, 1,
1.485723, -0.659509, 3.448346, 1, 1, 1, 1, 1,
1.485933, -1.739302, 2.186908, 1, 1, 1, 1, 1,
1.487554, 0.6378101, 0.1363482, 1, 1, 1, 1, 1,
1.515964, -0.1722263, 2.814021, 0, 0, 1, 1, 1,
1.534962, -0.03982982, 0.6061662, 1, 0, 0, 1, 1,
1.55502, 1.53256, 0.488895, 1, 0, 0, 1, 1,
1.573249, 0.7750856, 0.8370755, 1, 0, 0, 1, 1,
1.575217, 0.2699177, 2.060854, 1, 0, 0, 1, 1,
1.575259, 2.039737, -0.3956051, 1, 0, 0, 1, 1,
1.578265, -0.4089081, 2.990119, 0, 0, 0, 1, 1,
1.580857, -1.084722, 1.947485, 0, 0, 0, 1, 1,
1.582605, 1.317227, -0.6541753, 0, 0, 0, 1, 1,
1.582904, -1.837858, 2.193543, 0, 0, 0, 1, 1,
1.599009, 0.9127133, 1.174313, 0, 0, 0, 1, 1,
1.603906, -0.1259898, -0.06042831, 0, 0, 0, 1, 1,
1.624989, 2.082546, 2.094845, 0, 0, 0, 1, 1,
1.630902, -0.7003897, 1.464714, 1, 1, 1, 1, 1,
1.640291, -0.4897443, 4.133185, 1, 1, 1, 1, 1,
1.669087, 1.791526, -0.8323451, 1, 1, 1, 1, 1,
1.669398, 0.7104453, 1.038635, 1, 1, 1, 1, 1,
1.680542, 0.4495097, -0.6775861, 1, 1, 1, 1, 1,
1.686259, 0.3020886, 1.869867, 1, 1, 1, 1, 1,
1.70874, 0.2238387, 2.197758, 1, 1, 1, 1, 1,
1.710853, -0.6598701, 1.777033, 1, 1, 1, 1, 1,
1.712951, 1.677279, 1.031503, 1, 1, 1, 1, 1,
1.730665, -0.3856985, 1.447998, 1, 1, 1, 1, 1,
1.751479, 0.5832884, -0.1049787, 1, 1, 1, 1, 1,
1.755754, -0.5404832, 1.396537, 1, 1, 1, 1, 1,
1.758937, -0.375317, 2.244124, 1, 1, 1, 1, 1,
1.761548, -0.1369188, 0.9343685, 1, 1, 1, 1, 1,
1.768075, 0.9557415, 0.4941593, 1, 1, 1, 1, 1,
1.826648, -0.5558483, 1.634614, 0, 0, 1, 1, 1,
1.846364, -0.8412883, -0.2358725, 1, 0, 0, 1, 1,
1.865036, 0.6794249, 1.990565, 1, 0, 0, 1, 1,
1.876867, -0.5312318, 4.042541, 1, 0, 0, 1, 1,
1.885888, -0.8805069, 1.785255, 1, 0, 0, 1, 1,
1.893931, -0.3230487, 0.5228314, 1, 0, 0, 1, 1,
1.896025, 0.4233039, 1.295008, 0, 0, 0, 1, 1,
1.898459, 0.4353836, 0.9307655, 0, 0, 0, 1, 1,
1.907897, -0.3250656, 1.085976, 0, 0, 0, 1, 1,
1.938428, 0.9522422, 1.650453, 0, 0, 0, 1, 1,
1.964037, 1.099127, 0.9219604, 0, 0, 0, 1, 1,
1.975094, 0.09106003, 3.93347, 0, 0, 0, 1, 1,
1.976274, -1.543308, 2.819267, 0, 0, 0, 1, 1,
1.987346, 2.026595, -0.9284171, 1, 1, 1, 1, 1,
2.015308, 1.732157, 1.165005, 1, 1, 1, 1, 1,
2.016069, 0.0204011, 1.807953, 1, 1, 1, 1, 1,
2.018373, -0.9592543, 1.190981, 1, 1, 1, 1, 1,
2.021042, -0.01614761, 0.9321912, 1, 1, 1, 1, 1,
2.027007, 1.241035, 0.1730965, 1, 1, 1, 1, 1,
2.043681, -1.133614, 2.77823, 1, 1, 1, 1, 1,
2.050169, -0.7059273, 1.804189, 1, 1, 1, 1, 1,
2.053552, 0.9594534, 1.631366, 1, 1, 1, 1, 1,
2.17522, 0.4267357, 2.263422, 1, 1, 1, 1, 1,
2.20252, -0.5791235, 2.347048, 1, 1, 1, 1, 1,
2.24699, -0.2506391, -0.3365672, 1, 1, 1, 1, 1,
2.256838, 0.287181, 0.9464704, 1, 1, 1, 1, 1,
2.276756, -0.3061911, 1.98726, 1, 1, 1, 1, 1,
2.278546, 0.5633675, -0.7966744, 1, 1, 1, 1, 1,
2.310457, 0.6845685, 1.983746, 0, 0, 1, 1, 1,
2.345369, 1.153152, 1.584292, 1, 0, 0, 1, 1,
2.371351, -0.7990534, 1.644626, 1, 0, 0, 1, 1,
2.403116, 0.1217182, 0.2647972, 1, 0, 0, 1, 1,
2.418369, 0.5649275, 0.5560291, 1, 0, 0, 1, 1,
2.441192, -0.7681632, 2.840419, 1, 0, 0, 1, 1,
2.458427, -0.01864327, 1.485976, 0, 0, 0, 1, 1,
2.46139, 0.534582, 1.00704, 0, 0, 0, 1, 1,
2.481127, 0.01166122, 2.417909, 0, 0, 0, 1, 1,
2.61034, -0.9660891, 1.873859, 0, 0, 0, 1, 1,
2.634638, 0.9824008, 2.411601, 0, 0, 0, 1, 1,
2.701754, -0.7306331, 1.475901, 0, 0, 0, 1, 1,
2.826191, 2.028342, -0.1173885, 0, 0, 0, 1, 1,
2.837615, 1.165841, 1.337927, 1, 1, 1, 1, 1,
2.863926, -0.02993799, 2.144301, 1, 1, 1, 1, 1,
2.890692, 0.2033114, 0.05796821, 1, 1, 1, 1, 1,
2.95395, 1.149092, 0.5523325, 1, 1, 1, 1, 1,
2.984796, -0.7174026, 0.07589004, 1, 1, 1, 1, 1,
3.123162, 0.1367441, 1.505052, 1, 1, 1, 1, 1,
3.656218, -1.320305, 1.808396, 1, 1, 1, 1, 1
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
var radius = 9.99249;
var distance = 35.0982;
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
mvMatrix.translate( 0.1623805, -0.1484513, -0.3971021 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.0982);
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
