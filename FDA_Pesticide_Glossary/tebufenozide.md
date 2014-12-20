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
-3.106118, 0.6073593, -1.503657, 1, 0, 0, 1,
-2.884227, 0.5338723, -2.372747, 1, 0.007843138, 0, 1,
-2.814221, 0.4509738, -1.488662, 1, 0.01176471, 0, 1,
-2.810227, 1.802684, -0.6627027, 1, 0.01960784, 0, 1,
-2.738521, -0.3927991, -2.079611, 1, 0.02352941, 0, 1,
-2.709768, 1.033477, -3.090065, 1, 0.03137255, 0, 1,
-2.705277, -0.4164716, -1.273688, 1, 0.03529412, 0, 1,
-2.69868, -0.8524832, 0.08696804, 1, 0.04313726, 0, 1,
-2.465285, 0.05413415, -2.83068, 1, 0.04705882, 0, 1,
-2.45598, 0.3464507, -3.492013, 1, 0.05490196, 0, 1,
-2.444288, 0.6882628, -0.7868122, 1, 0.05882353, 0, 1,
-2.397042, -0.4946411, -1.790498, 1, 0.06666667, 0, 1,
-2.381989, -0.1284485, -2.097836, 1, 0.07058824, 0, 1,
-2.375196, 0.539799, -0.1938498, 1, 0.07843138, 0, 1,
-2.355039, 0.7174121, -0.6261799, 1, 0.08235294, 0, 1,
-2.276248, 0.4148974, -0.05350204, 1, 0.09019608, 0, 1,
-2.265622, -0.3750204, -1.1185, 1, 0.09411765, 0, 1,
-2.23345, -0.8350133, -0.9579312, 1, 0.1019608, 0, 1,
-2.222647, 1.331123, -0.5024711, 1, 0.1098039, 0, 1,
-2.185325, -1.608226, -2.919461, 1, 0.1137255, 0, 1,
-2.182007, 0.02284979, -2.631491, 1, 0.1215686, 0, 1,
-2.152037, -0.5031265, -1.718755, 1, 0.1254902, 0, 1,
-2.122542, 0.5097432, -0.7156876, 1, 0.1333333, 0, 1,
-2.120923, -1.915016, -2.542787, 1, 0.1372549, 0, 1,
-2.110569, -0.4028421, -2.294974, 1, 0.145098, 0, 1,
-2.107792, 0.7002323, 0.9392689, 1, 0.1490196, 0, 1,
-2.095647, -0.007848955, -2.225818, 1, 0.1568628, 0, 1,
-2.064785, -1.163543, -1.607824, 1, 0.1607843, 0, 1,
-2.054491, -0.8238018, -2.340412, 1, 0.1686275, 0, 1,
-2.03767, -0.8178752, -0.9863188, 1, 0.172549, 0, 1,
-2.031569, 2.754275, -1.173856, 1, 0.1803922, 0, 1,
-2.016382, -0.9953281, -2.879557, 1, 0.1843137, 0, 1,
-2.01374, 1.975077, -0.5804305, 1, 0.1921569, 0, 1,
-2.008695, -0.5339637, -1.377935, 1, 0.1960784, 0, 1,
-1.977008, 0.11714, -1.686815, 1, 0.2039216, 0, 1,
-1.975242, 1.118573, -0.7858101, 1, 0.2117647, 0, 1,
-1.95968, -1.728801, -3.340302, 1, 0.2156863, 0, 1,
-1.947095, -0.2183522, -1.779809, 1, 0.2235294, 0, 1,
-1.9119, -0.2849997, -2.166442, 1, 0.227451, 0, 1,
-1.909524, -1.488394, -1.09258, 1, 0.2352941, 0, 1,
-1.899118, -0.5549046, -1.005951, 1, 0.2392157, 0, 1,
-1.877934, -0.6437717, -2.317976, 1, 0.2470588, 0, 1,
-1.865187, -0.2621831, -1.146007, 1, 0.2509804, 0, 1,
-1.851769, 0.2458944, -0.6427369, 1, 0.2588235, 0, 1,
-1.851051, 0.6072517, -1.431347, 1, 0.2627451, 0, 1,
-1.834918, -0.4495355, -1.009837, 1, 0.2705882, 0, 1,
-1.8214, 1.306115, -2.147379, 1, 0.2745098, 0, 1,
-1.8192, 0.8659434, -1.578986, 1, 0.282353, 0, 1,
-1.80562, 1.082423, -1.60582, 1, 0.2862745, 0, 1,
-1.79036, 0.5011163, -0.7261354, 1, 0.2941177, 0, 1,
-1.784366, -0.09500997, -1.746909, 1, 0.3019608, 0, 1,
-1.765778, -0.2467264, -3.362696, 1, 0.3058824, 0, 1,
-1.708489, 0.8312219, -0.1543707, 1, 0.3137255, 0, 1,
-1.706371, -2.28871, -2.40826, 1, 0.3176471, 0, 1,
-1.699167, 1.302156, -0.4026748, 1, 0.3254902, 0, 1,
-1.666599, -0.2292694, -1.432434, 1, 0.3294118, 0, 1,
-1.662549, 0.02954525, 0.3410763, 1, 0.3372549, 0, 1,
-1.646052, 2.784782, 0.6817495, 1, 0.3411765, 0, 1,
-1.619616, -0.7195585, -4.160324, 1, 0.3490196, 0, 1,
-1.617293, 0.07860859, -1.768599, 1, 0.3529412, 0, 1,
-1.613708, 0.2679488, 1.245471, 1, 0.3607843, 0, 1,
-1.601297, 1.001155, -2.004159, 1, 0.3647059, 0, 1,
-1.601031, -0.3492118, -1.003815, 1, 0.372549, 0, 1,
-1.596216, 1.215375, -1.619565, 1, 0.3764706, 0, 1,
-1.591037, -0.2198818, -2.228716, 1, 0.3843137, 0, 1,
-1.586445, 0.1433662, -1.387445, 1, 0.3882353, 0, 1,
-1.58463, 0.1455613, -0.3927253, 1, 0.3960784, 0, 1,
-1.55478, -0.5425202, -1.758358, 1, 0.4039216, 0, 1,
-1.554551, 0.4413694, -0.7282944, 1, 0.4078431, 0, 1,
-1.539653, -1.513193, -3.541131, 1, 0.4156863, 0, 1,
-1.524565, 0.4021291, -1.41369, 1, 0.4196078, 0, 1,
-1.51712, -0.5883911, -0.5140215, 1, 0.427451, 0, 1,
-1.511057, 0.3982636, -1.589932, 1, 0.4313726, 0, 1,
-1.49667, 0.3140318, -0.9434451, 1, 0.4392157, 0, 1,
-1.496379, 0.8711541, -2.047434, 1, 0.4431373, 0, 1,
-1.493696, -0.1758485, -2.209268, 1, 0.4509804, 0, 1,
-1.481737, -0.8189806, -3.619061, 1, 0.454902, 0, 1,
-1.481067, -0.930047, -1.905065, 1, 0.4627451, 0, 1,
-1.478115, 0.8280723, -1.507832, 1, 0.4666667, 0, 1,
-1.461005, -0.2614683, -1.323963, 1, 0.4745098, 0, 1,
-1.457442, 0.8248299, -2.039219, 1, 0.4784314, 0, 1,
-1.457139, -0.0206854, -2.450624, 1, 0.4862745, 0, 1,
-1.456071, -0.3932827, -0.7972639, 1, 0.4901961, 0, 1,
-1.453543, 1.652638, -0.9137991, 1, 0.4980392, 0, 1,
-1.451332, 1.636216, -1.74713, 1, 0.5058824, 0, 1,
-1.449277, -0.3109639, -0.01635583, 1, 0.509804, 0, 1,
-1.448892, 1.493101, 0.1778185, 1, 0.5176471, 0, 1,
-1.447674, 1.743665, -0.6484804, 1, 0.5215687, 0, 1,
-1.439664, -2.100135, -1.779532, 1, 0.5294118, 0, 1,
-1.418958, 1.338706, -2.450253, 1, 0.5333334, 0, 1,
-1.417282, 0.3886077, 0.07067733, 1, 0.5411765, 0, 1,
-1.401113, -2.476672, -4.315956, 1, 0.5450981, 0, 1,
-1.399861, 0.2116715, -1.299311, 1, 0.5529412, 0, 1,
-1.384369, 0.7186393, -0.9495536, 1, 0.5568628, 0, 1,
-1.375698, 0.4233603, -2.512939, 1, 0.5647059, 0, 1,
-1.359635, 1.278245, -0.06061332, 1, 0.5686275, 0, 1,
-1.354699, -0.4067999, -1.375265, 1, 0.5764706, 0, 1,
-1.350466, -1.069387, -2.335254, 1, 0.5803922, 0, 1,
-1.348661, 0.8155347, -2.381564, 1, 0.5882353, 0, 1,
-1.34636, -1.269287, -2.92344, 1, 0.5921569, 0, 1,
-1.345185, -1.922736, -3.85801, 1, 0.6, 0, 1,
-1.342968, -0.5825559, -1.585257, 1, 0.6078432, 0, 1,
-1.335545, -0.3686956, -1.778811, 1, 0.6117647, 0, 1,
-1.334768, -1.227874, -3.240644, 1, 0.6196079, 0, 1,
-1.333768, -0.4176094, -0.8817239, 1, 0.6235294, 0, 1,
-1.32828, -0.8959829, -2.114236, 1, 0.6313726, 0, 1,
-1.312436, -1.318104, -2.040081, 1, 0.6352941, 0, 1,
-1.299099, -0.2781883, -0.7347825, 1, 0.6431373, 0, 1,
-1.298662, 0.8061706, -2.295573, 1, 0.6470588, 0, 1,
-1.296627, -0.220064, -1.616778, 1, 0.654902, 0, 1,
-1.294912, -1.613844, -0.7464087, 1, 0.6588235, 0, 1,
-1.293954, -1.027228, -4.056299, 1, 0.6666667, 0, 1,
-1.285054, 0.1491673, -0.03731802, 1, 0.6705883, 0, 1,
-1.269885, 0.07698017, -1.265597, 1, 0.6784314, 0, 1,
-1.260005, -0.9487845, -0.6009218, 1, 0.682353, 0, 1,
-1.251377, -0.6455417, -0.4863477, 1, 0.6901961, 0, 1,
-1.241444, 0.543798, -1.863746, 1, 0.6941177, 0, 1,
-1.240153, -1.167894, -2.698079, 1, 0.7019608, 0, 1,
-1.239036, 0.4828796, -1.036031, 1, 0.7098039, 0, 1,
-1.234312, -0.2029017, -2.11844, 1, 0.7137255, 0, 1,
-1.226748, -0.8573987, -2.296535, 1, 0.7215686, 0, 1,
-1.216567, 1.722618, -0.9302673, 1, 0.7254902, 0, 1,
-1.194066, -1.949457, -2.215523, 1, 0.7333333, 0, 1,
-1.192776, 0.0651243, -1.560858, 1, 0.7372549, 0, 1,
-1.185872, -0.2018078, -1.574422, 1, 0.7450981, 0, 1,
-1.18427, -0.1044815, -0.5593595, 1, 0.7490196, 0, 1,
-1.169768, 0.7431313, -1.473743, 1, 0.7568628, 0, 1,
-1.167715, -1.59272, -3.569293, 1, 0.7607843, 0, 1,
-1.149482, 1.006726, -0.8038684, 1, 0.7686275, 0, 1,
-1.147612, 0.5773473, 0.919585, 1, 0.772549, 0, 1,
-1.145195, -0.2145029, -1.929731, 1, 0.7803922, 0, 1,
-1.142278, 2.462919, -0.7241005, 1, 0.7843137, 0, 1,
-1.136767, 1.262053, -0.3382514, 1, 0.7921569, 0, 1,
-1.134506, 0.3830488, -1.147218, 1, 0.7960784, 0, 1,
-1.133988, -0.5130493, -1.609472, 1, 0.8039216, 0, 1,
-1.128126, 0.474488, -2.531883, 1, 0.8117647, 0, 1,
-1.123739, -1.686481, -2.30751, 1, 0.8156863, 0, 1,
-1.123558, -0.2611741, -3.427293, 1, 0.8235294, 0, 1,
-1.122756, 0.1413052, -0.7825071, 1, 0.827451, 0, 1,
-1.119649, 0.09574814, -2.043645, 1, 0.8352941, 0, 1,
-1.119149, -0.1647486, -1.327203, 1, 0.8392157, 0, 1,
-1.117851, 0.6472198, 0.3051861, 1, 0.8470588, 0, 1,
-1.117538, -0.6263099, -2.43649, 1, 0.8509804, 0, 1,
-1.116863, -1.351571, -2.191456, 1, 0.8588235, 0, 1,
-1.106466, 1.092812, -0.9508809, 1, 0.8627451, 0, 1,
-1.101777, -1.653165, -1.683667, 1, 0.8705882, 0, 1,
-1.101013, 0.4774493, -0.22129, 1, 0.8745098, 0, 1,
-1.098431, 0.8121808, -1.415599, 1, 0.8823529, 0, 1,
-1.09254, 0.06590632, -0.2565275, 1, 0.8862745, 0, 1,
-1.09233, 0.705458, -1.316898, 1, 0.8941177, 0, 1,
-1.086782, -0.5571674, -2.016353, 1, 0.8980392, 0, 1,
-1.086244, -1.319612, -2.301949, 1, 0.9058824, 0, 1,
-1.085732, 0.1233199, -1.248044, 1, 0.9137255, 0, 1,
-1.077743, 2.119695, -0.1506161, 1, 0.9176471, 0, 1,
-1.073416, -0.9782584, -1.899912, 1, 0.9254902, 0, 1,
-1.071387, -1.106195, -2.034223, 1, 0.9294118, 0, 1,
-1.069952, -0.08888489, -2.62193, 1, 0.9372549, 0, 1,
-1.058936, -0.2831662, -1.062404, 1, 0.9411765, 0, 1,
-1.052049, 1.662974, -2.248341, 1, 0.9490196, 0, 1,
-1.049743, 0.06747857, -1.751411, 1, 0.9529412, 0, 1,
-1.041464, 0.7308523, 0.06149312, 1, 0.9607843, 0, 1,
-1.03155, -0.3567793, -2.188972, 1, 0.9647059, 0, 1,
-1.030693, 2.469925, 0.4903431, 1, 0.972549, 0, 1,
-1.02538, 1.263302, 0.5029793, 1, 0.9764706, 0, 1,
-1.022606, -0.4913876, -1.99735, 1, 0.9843137, 0, 1,
-1.012537, -0.7678346, -1.198585, 1, 0.9882353, 0, 1,
-1.009138, -0.344671, -2.503136, 1, 0.9960784, 0, 1,
-1.008536, 0.05340283, -1.320694, 0.9960784, 1, 0, 1,
-1.005986, 0.1228942, 0.197077, 0.9921569, 1, 0, 1,
-0.999372, -0.7823644, -2.848609, 0.9843137, 1, 0, 1,
-0.9971372, 0.80146, -1.000785, 0.9803922, 1, 0, 1,
-0.9919716, 0.6956807, -1.247807, 0.972549, 1, 0, 1,
-0.9882451, 0.09805262, -2.362165, 0.9686275, 1, 0, 1,
-0.9859297, 1.879508, 0.7391657, 0.9607843, 1, 0, 1,
-0.9817626, 0.1083033, -2.157727, 0.9568627, 1, 0, 1,
-0.9757841, 0.3271191, -1.512081, 0.9490196, 1, 0, 1,
-0.9752599, -1.647837, -1.781068, 0.945098, 1, 0, 1,
-0.9724309, 0.03378407, -3.829888, 0.9372549, 1, 0, 1,
-0.968749, -0.6295528, -1.904123, 0.9333333, 1, 0, 1,
-0.9681805, 2.480232, 0.8553471, 0.9254902, 1, 0, 1,
-0.9679536, 1.009374, -0.5907583, 0.9215686, 1, 0, 1,
-0.9668842, 0.3062939, -1.444846, 0.9137255, 1, 0, 1,
-0.9622867, -1.727957, -3.016702, 0.9098039, 1, 0, 1,
-0.9606935, -0.4464489, -3.401506, 0.9019608, 1, 0, 1,
-0.9465238, 1.870172, 0.1340088, 0.8941177, 1, 0, 1,
-0.9464338, -0.06848591, -1.653796, 0.8901961, 1, 0, 1,
-0.9404468, 0.04742061, -1.435731, 0.8823529, 1, 0, 1,
-0.9258916, 0.2143233, -0.786298, 0.8784314, 1, 0, 1,
-0.9208901, -0.7186207, -3.839223, 0.8705882, 1, 0, 1,
-0.9185129, 0.4536694, -1.577263, 0.8666667, 1, 0, 1,
-0.9168516, 0.4416809, 0.2276888, 0.8588235, 1, 0, 1,
-0.9165922, 1.707022, 0.7367628, 0.854902, 1, 0, 1,
-0.9142191, -1.357271, -2.211901, 0.8470588, 1, 0, 1,
-0.9138759, -0.13609, -1.341144, 0.8431373, 1, 0, 1,
-0.9123728, -0.3259911, -1.809662, 0.8352941, 1, 0, 1,
-0.9102898, 0.2301669, -1.461892, 0.8313726, 1, 0, 1,
-0.8858789, -0.7123318, -2.990299, 0.8235294, 1, 0, 1,
-0.8851606, 1.10975, -0.3416618, 0.8196079, 1, 0, 1,
-0.8744124, -1.1364, -1.204254, 0.8117647, 1, 0, 1,
-0.8709655, -0.0651601, -1.563555, 0.8078431, 1, 0, 1,
-0.8632522, 1.908666, 0.04512768, 0.8, 1, 0, 1,
-0.8555365, -2.801121, -3.939299, 0.7921569, 1, 0, 1,
-0.8552256, 0.9783386, 0.6558872, 0.7882353, 1, 0, 1,
-0.8477218, -0.7183363, -1.359555, 0.7803922, 1, 0, 1,
-0.8461608, 1.524099, -0.2182676, 0.7764706, 1, 0, 1,
-0.8456597, 0.6223189, -2.288969, 0.7686275, 1, 0, 1,
-0.8434445, -0.2708039, -1.437048, 0.7647059, 1, 0, 1,
-0.8340027, 0.4258212, -1.423751, 0.7568628, 1, 0, 1,
-0.832391, -0.8669192, -3.045154, 0.7529412, 1, 0, 1,
-0.8302363, 0.2122807, -1.158201, 0.7450981, 1, 0, 1,
-0.8293449, -0.1437297, -1.583583, 0.7411765, 1, 0, 1,
-0.8238086, 0.3408195, -1.565563, 0.7333333, 1, 0, 1,
-0.8221568, 0.3900111, -2.471182, 0.7294118, 1, 0, 1,
-0.8174008, -0.3504933, -0.3583468, 0.7215686, 1, 0, 1,
-0.8140395, 0.3278234, -0.550823, 0.7176471, 1, 0, 1,
-0.8132831, 1.060983, 2.43686, 0.7098039, 1, 0, 1,
-0.8125879, -1.242162, -1.999174, 0.7058824, 1, 0, 1,
-0.8085755, -1.751939, -3.420166, 0.6980392, 1, 0, 1,
-0.807797, 0.8904988, -1.850382, 0.6901961, 1, 0, 1,
-0.8072329, 0.3730571, -1.573678, 0.6862745, 1, 0, 1,
-0.8055655, -0.848285, -3.124686, 0.6784314, 1, 0, 1,
-0.8044755, 0.162365, -0.19107, 0.6745098, 1, 0, 1,
-0.8038486, 0.8641146, 0.4044558, 0.6666667, 1, 0, 1,
-0.79324, 0.04949769, -0.8441676, 0.6627451, 1, 0, 1,
-0.7924461, 0.4569674, 0.8014663, 0.654902, 1, 0, 1,
-0.7899758, 0.2055813, -0.2138818, 0.6509804, 1, 0, 1,
-0.7887699, 1.141455, -2.477054, 0.6431373, 1, 0, 1,
-0.7851682, -0.2023147, -2.379843, 0.6392157, 1, 0, 1,
-0.784584, 0.3803976, -0.6869102, 0.6313726, 1, 0, 1,
-0.7816439, 0.6011624, 1.254467, 0.627451, 1, 0, 1,
-0.7788154, 0.01392588, -1.971108, 0.6196079, 1, 0, 1,
-0.7768911, 0.4640799, -0.4769222, 0.6156863, 1, 0, 1,
-0.7767704, 0.2456792, -2.789315, 0.6078432, 1, 0, 1,
-0.7752957, 1.327617, -2.503307, 0.6039216, 1, 0, 1,
-0.7722643, 0.8664966, -0.3017885, 0.5960785, 1, 0, 1,
-0.766944, 1.375945, -1.243767, 0.5882353, 1, 0, 1,
-0.7649409, -2.385631, -2.24837, 0.5843138, 1, 0, 1,
-0.7638989, 0.7565856, -0.6337101, 0.5764706, 1, 0, 1,
-0.7629802, 1.453551, 0.03416464, 0.572549, 1, 0, 1,
-0.7590514, -0.127926, -2.344686, 0.5647059, 1, 0, 1,
-0.7518699, 1.261526, -0.7855629, 0.5607843, 1, 0, 1,
-0.7500787, 0.4353692, -0.9375072, 0.5529412, 1, 0, 1,
-0.7480196, -0.4926948, -2.602912, 0.5490196, 1, 0, 1,
-0.7473714, -0.003746743, -1.577391, 0.5411765, 1, 0, 1,
-0.741078, 1.291991, 0.6312867, 0.5372549, 1, 0, 1,
-0.7390326, -1.617077, -2.518763, 0.5294118, 1, 0, 1,
-0.7357369, 0.03323087, -1.828163, 0.5254902, 1, 0, 1,
-0.7338606, 1.62303, -1.066495, 0.5176471, 1, 0, 1,
-0.7332435, 1.262668, -2.165843, 0.5137255, 1, 0, 1,
-0.7315337, -0.6384796, -3.438534, 0.5058824, 1, 0, 1,
-0.7303424, 1.175283, -0.6875238, 0.5019608, 1, 0, 1,
-0.7188408, -0.3715871, -1.779028, 0.4941176, 1, 0, 1,
-0.7087134, -0.1002822, -1.563654, 0.4862745, 1, 0, 1,
-0.7030711, 0.6437437, 0.2479547, 0.4823529, 1, 0, 1,
-0.7000916, 1.850985, 1.473761, 0.4745098, 1, 0, 1,
-0.6982858, -0.3213778, -1.960081, 0.4705882, 1, 0, 1,
-0.6951057, 0.01138071, -0.1565295, 0.4627451, 1, 0, 1,
-0.6826316, 0.3250481, 0.8133014, 0.4588235, 1, 0, 1,
-0.675696, 1.17295, -1.729318, 0.4509804, 1, 0, 1,
-0.673974, -1.104061, -3.884679, 0.4470588, 1, 0, 1,
-0.6731883, 0.6533247, 0.2335228, 0.4392157, 1, 0, 1,
-0.6725462, 0.7894948, -1.405936, 0.4352941, 1, 0, 1,
-0.6720701, 0.02034472, -1.32916, 0.427451, 1, 0, 1,
-0.6718984, -0.6150413, -3.775115, 0.4235294, 1, 0, 1,
-0.6694911, 1.672905, 1.221387, 0.4156863, 1, 0, 1,
-0.6694686, -2.558479, -2.832243, 0.4117647, 1, 0, 1,
-0.6572033, -0.6512335, -1.392493, 0.4039216, 1, 0, 1,
-0.6547056, 0.850413, -2.367833, 0.3960784, 1, 0, 1,
-0.6517208, 0.1497876, -1.791494, 0.3921569, 1, 0, 1,
-0.6510699, -1.344466, -4.580019, 0.3843137, 1, 0, 1,
-0.6510178, -0.2194386, -1.256305, 0.3803922, 1, 0, 1,
-0.6436622, 0.322589, -0.3989857, 0.372549, 1, 0, 1,
-0.6367303, 0.1212241, -0.7434078, 0.3686275, 1, 0, 1,
-0.6366095, -0.9233731, -2.893963, 0.3607843, 1, 0, 1,
-0.6361182, -1.155239, -4.933629, 0.3568628, 1, 0, 1,
-0.6347848, 0.4506798, -0.6093779, 0.3490196, 1, 0, 1,
-0.628437, 0.9722607, 0.5344314, 0.345098, 1, 0, 1,
-0.6257044, 0.5516028, -1.812615, 0.3372549, 1, 0, 1,
-0.6254249, 0.3511647, -0.2253083, 0.3333333, 1, 0, 1,
-0.6210214, -0.6538467, -2.153603, 0.3254902, 1, 0, 1,
-0.6189581, -0.3876155, -4.171373, 0.3215686, 1, 0, 1,
-0.6161413, -0.4268574, -1.843687, 0.3137255, 1, 0, 1,
-0.6068842, -0.3008687, -1.749439, 0.3098039, 1, 0, 1,
-0.6063001, 0.1175367, -1.935169, 0.3019608, 1, 0, 1,
-0.6058205, -1.057733, -2.356032, 0.2941177, 1, 0, 1,
-0.6058185, 0.2040631, -1.970254, 0.2901961, 1, 0, 1,
-0.6053687, 1.235468, 1.176117, 0.282353, 1, 0, 1,
-0.6040117, 2.402633, 0.2532176, 0.2784314, 1, 0, 1,
-0.603106, 0.4446734, -0.8539187, 0.2705882, 1, 0, 1,
-0.6002246, 0.4251032, -1.027366, 0.2666667, 1, 0, 1,
-0.5969927, -1.00521, -3.594856, 0.2588235, 1, 0, 1,
-0.5920224, 0.8780352, 0.307221, 0.254902, 1, 0, 1,
-0.5916154, 1.087881, 0.2078878, 0.2470588, 1, 0, 1,
-0.5913094, -1.306785, -2.237778, 0.2431373, 1, 0, 1,
-0.5904381, -0.5385167, -3.282149, 0.2352941, 1, 0, 1,
-0.5875139, -1.208987, -3.93666, 0.2313726, 1, 0, 1,
-0.5861894, -0.9992828, -4.179265, 0.2235294, 1, 0, 1,
-0.5851098, 1.319116, -0.552176, 0.2196078, 1, 0, 1,
-0.5840999, 0.8712158, -0.3390774, 0.2117647, 1, 0, 1,
-0.5777578, 0.17759, -0.9830396, 0.2078431, 1, 0, 1,
-0.5776464, 1.639819, -0.1057343, 0.2, 1, 0, 1,
-0.5758048, 0.8924152, 0.1318022, 0.1921569, 1, 0, 1,
-0.5738856, -0.8489596, -1.647173, 0.1882353, 1, 0, 1,
-0.5732991, -0.4909255, -1.201149, 0.1803922, 1, 0, 1,
-0.5729628, -1.380622, -4.136911, 0.1764706, 1, 0, 1,
-0.5714903, 0.3742033, -0.3688176, 0.1686275, 1, 0, 1,
-0.564396, -0.801771, -2.078968, 0.1647059, 1, 0, 1,
-0.5597345, 2.283151, -0.04075478, 0.1568628, 1, 0, 1,
-0.5571985, 0.02480539, -1.80987, 0.1529412, 1, 0, 1,
-0.5564609, -0.5839352, -3.394198, 0.145098, 1, 0, 1,
-0.5555479, -0.09985491, -1.87187, 0.1411765, 1, 0, 1,
-0.5550016, -1.711183, -2.157943, 0.1333333, 1, 0, 1,
-0.5519615, 1.042623, 0.5232295, 0.1294118, 1, 0, 1,
-0.5498115, 0.9874505, -0.8886957, 0.1215686, 1, 0, 1,
-0.5488686, 0.7548333, -0.1989059, 0.1176471, 1, 0, 1,
-0.5430746, -1.167482, -2.853026, 0.1098039, 1, 0, 1,
-0.5418761, 0.6563697, 0.1062888, 0.1058824, 1, 0, 1,
-0.541741, 0.3077148, -1.080672, 0.09803922, 1, 0, 1,
-0.5406836, 1.402842, -1.524611, 0.09019608, 1, 0, 1,
-0.5386115, 0.5830473, -1.93216, 0.08627451, 1, 0, 1,
-0.5370361, -0.1784677, -3.861171, 0.07843138, 1, 0, 1,
-0.5258822, 0.3547441, -1.784277, 0.07450981, 1, 0, 1,
-0.5243877, 0.42899, -0.3733031, 0.06666667, 1, 0, 1,
-0.523185, 0.1394323, -2.293102, 0.0627451, 1, 0, 1,
-0.5203118, 0.4362611, -3.328492, 0.05490196, 1, 0, 1,
-0.5200729, 0.9874955, -2.502827, 0.05098039, 1, 0, 1,
-0.5187604, 0.02011356, -0.8682174, 0.04313726, 1, 0, 1,
-0.5142926, -1.386707, -1.74409, 0.03921569, 1, 0, 1,
-0.5074716, 1.297668, -1.700559, 0.03137255, 1, 0, 1,
-0.5073773, 1.010901, -1.124591, 0.02745098, 1, 0, 1,
-0.501191, -0.1184532, -1.303848, 0.01960784, 1, 0, 1,
-0.4987592, 1.070557, 0.5888956, 0.01568628, 1, 0, 1,
-0.4934963, -2.237325, -1.951752, 0.007843138, 1, 0, 1,
-0.4906692, -0.04273565, -0.332229, 0.003921569, 1, 0, 1,
-0.4853851, 0.3807316, -1.078846, 0, 1, 0.003921569, 1,
-0.4774742, -0.2164697, -1.182386, 0, 1, 0.01176471, 1,
-0.4747768, -2.109431, -4.036919, 0, 1, 0.01568628, 1,
-0.4739812, -0.500489, -3.304567, 0, 1, 0.02352941, 1,
-0.4734735, -0.346035, -2.174658, 0, 1, 0.02745098, 1,
-0.4729159, 0.3471274, -0.8383209, 0, 1, 0.03529412, 1,
-0.4604907, -0.7240847, -2.85486, 0, 1, 0.03921569, 1,
-0.4601318, 1.586605, -0.8768141, 0, 1, 0.04705882, 1,
-0.4584039, -0.8190899, -3.895747, 0, 1, 0.05098039, 1,
-0.4536882, 1.517427, -0.3964188, 0, 1, 0.05882353, 1,
-0.452887, 2.189674, 1.195752, 0, 1, 0.0627451, 1,
-0.4466445, 1.322367, 0.3875004, 0, 1, 0.07058824, 1,
-0.4448917, 1.748091, 0.126867, 0, 1, 0.07450981, 1,
-0.4376068, -0.3267204, -2.451457, 0, 1, 0.08235294, 1,
-0.4368694, 0.7436873, -0.2243406, 0, 1, 0.08627451, 1,
-0.4354388, -0.4221444, -0.575105, 0, 1, 0.09411765, 1,
-0.4334838, -0.07233801, -2.036282, 0, 1, 0.1019608, 1,
-0.425101, -0.03315015, -2.569262, 0, 1, 0.1058824, 1,
-0.4248085, 0.005540584, -3.160985, 0, 1, 0.1137255, 1,
-0.4220884, 0.3485064, -0.5402679, 0, 1, 0.1176471, 1,
-0.4216186, 0.04112257, -1.109869, 0, 1, 0.1254902, 1,
-0.4213158, -1.716453, -3.668298, 0, 1, 0.1294118, 1,
-0.4137824, -0.03045158, -0.7872074, 0, 1, 0.1372549, 1,
-0.4081274, -0.6424705, -3.19264, 0, 1, 0.1411765, 1,
-0.4058474, 0.5918083, 0.245091, 0, 1, 0.1490196, 1,
-0.3989664, 0.4632379, -1.566632, 0, 1, 0.1529412, 1,
-0.3983778, -0.5858029, -3.02268, 0, 1, 0.1607843, 1,
-0.3963561, -0.3880869, -4.787772, 0, 1, 0.1647059, 1,
-0.3954649, 0.07333469, -2.629687, 0, 1, 0.172549, 1,
-0.3891589, -0.6387833, -3.453654, 0, 1, 0.1764706, 1,
-0.389035, 0.04709353, -1.239333, 0, 1, 0.1843137, 1,
-0.3866019, -1.513607, -2.214145, 0, 1, 0.1882353, 1,
-0.385062, 1.250494, -0.6848661, 0, 1, 0.1960784, 1,
-0.3836264, 0.6874263, -1.618407, 0, 1, 0.2039216, 1,
-0.3797973, -1.651033, -3.932396, 0, 1, 0.2078431, 1,
-0.3795418, 0.4251492, -0.6176221, 0, 1, 0.2156863, 1,
-0.3776596, -0.8324364, -2.520273, 0, 1, 0.2196078, 1,
-0.3776176, -0.5090955, -3.400076, 0, 1, 0.227451, 1,
-0.376801, -0.248708, -3.046679, 0, 1, 0.2313726, 1,
-0.3747459, 1.353486, -0.5311719, 0, 1, 0.2392157, 1,
-0.3743893, -1.189214, -2.059517, 0, 1, 0.2431373, 1,
-0.373549, 0.1129764, -0.5859472, 0, 1, 0.2509804, 1,
-0.3733574, -2.466634, -3.464586, 0, 1, 0.254902, 1,
-0.3729545, 1.114751, -2.641685, 0, 1, 0.2627451, 1,
-0.3727694, 0.2463408, -1.671876, 0, 1, 0.2666667, 1,
-0.3714599, -0.4843749, -3.332659, 0, 1, 0.2745098, 1,
-0.3689901, -0.1669089, -3.305493, 0, 1, 0.2784314, 1,
-0.3685303, -0.2123889, -1.896945, 0, 1, 0.2862745, 1,
-0.3683363, -0.2220798, -0.8636949, 0, 1, 0.2901961, 1,
-0.363194, -1.329086, -2.597022, 0, 1, 0.2980392, 1,
-0.3611854, -0.1023138, -1.28245, 0, 1, 0.3058824, 1,
-0.3568072, 1.972575, -0.8476242, 0, 1, 0.3098039, 1,
-0.3545656, 0.6645927, -0.03346246, 0, 1, 0.3176471, 1,
-0.350665, -0.5466525, -2.990638, 0, 1, 0.3215686, 1,
-0.3500067, -0.08980852, -1.649739, 0, 1, 0.3294118, 1,
-0.3477953, -0.1110476, -1.211256, 0, 1, 0.3333333, 1,
-0.3474845, -1.198914, -4.22228, 0, 1, 0.3411765, 1,
-0.3449199, 0.4253892, 1.338363, 0, 1, 0.345098, 1,
-0.3429027, 0.8455559, 1.093374, 0, 1, 0.3529412, 1,
-0.3358299, 0.1260186, -0.4404692, 0, 1, 0.3568628, 1,
-0.3347339, 0.03011918, -1.313466, 0, 1, 0.3647059, 1,
-0.334227, -1.172819, -2.380471, 0, 1, 0.3686275, 1,
-0.3335485, 1.12066, -0.4743714, 0, 1, 0.3764706, 1,
-0.3312178, -0.7764176, -3.015784, 0, 1, 0.3803922, 1,
-0.3298357, 1.79946, -0.541006, 0, 1, 0.3882353, 1,
-0.3261547, 0.1706983, -1.382648, 0, 1, 0.3921569, 1,
-0.3205685, 0.1196274, 1.194278, 0, 1, 0.4, 1,
-0.3199561, 0.5709414, 0.702979, 0, 1, 0.4078431, 1,
-0.3196248, 2.062443, 2.075901, 0, 1, 0.4117647, 1,
-0.319177, -0.04753922, -2.628413, 0, 1, 0.4196078, 1,
-0.318601, 0.2458008, -2.02388, 0, 1, 0.4235294, 1,
-0.3125381, -1.490131, -3.00212, 0, 1, 0.4313726, 1,
-0.3075677, -1.585967, -0.960229, 0, 1, 0.4352941, 1,
-0.3050602, 0.9746522, -0.3284355, 0, 1, 0.4431373, 1,
-0.3038157, 0.2344213, -1.411712, 0, 1, 0.4470588, 1,
-0.3022221, -2.279417, -2.587296, 0, 1, 0.454902, 1,
-0.301966, 0.5178626, -0.4551227, 0, 1, 0.4588235, 1,
-0.3018645, -0.3174123, -3.279326, 0, 1, 0.4666667, 1,
-0.2993608, -0.2996149, -2.824987, 0, 1, 0.4705882, 1,
-0.2982812, -0.9512988, -4.952664, 0, 1, 0.4784314, 1,
-0.2978435, 1.286718, -0.5330545, 0, 1, 0.4823529, 1,
-0.2969683, -2.059892, -4.295003, 0, 1, 0.4901961, 1,
-0.291004, 1.50466, -1.133576, 0, 1, 0.4941176, 1,
-0.2816755, -0.6760016, -2.858769, 0, 1, 0.5019608, 1,
-0.2776209, -0.3493548, -1.896153, 0, 1, 0.509804, 1,
-0.2728707, 0.02261182, -1.460385, 0, 1, 0.5137255, 1,
-0.2706546, -1.758802, -2.833026, 0, 1, 0.5215687, 1,
-0.2698545, -0.1039053, -0.5823672, 0, 1, 0.5254902, 1,
-0.2696837, 1.165972, -1.023615, 0, 1, 0.5333334, 1,
-0.2688799, -0.7596205, -2.380839, 0, 1, 0.5372549, 1,
-0.2653539, -1.459065, -3.62099, 0, 1, 0.5450981, 1,
-0.2647781, 0.8644285, -0.866859, 0, 1, 0.5490196, 1,
-0.2590837, 0.2611675, -1.669828, 0, 1, 0.5568628, 1,
-0.2589157, 1.032116, 0.06049435, 0, 1, 0.5607843, 1,
-0.2577266, -0.5976557, -1.167765, 0, 1, 0.5686275, 1,
-0.2574582, -0.7879158, -3.268689, 0, 1, 0.572549, 1,
-0.2555028, -0.5471889, -1.344049, 0, 1, 0.5803922, 1,
-0.2523452, 1.4434, -0.4513009, 0, 1, 0.5843138, 1,
-0.2496982, -0.01857698, -2.040881, 0, 1, 0.5921569, 1,
-0.2487862, 1.011991, -0.4393345, 0, 1, 0.5960785, 1,
-0.2465511, -0.7118212, -2.512513, 0, 1, 0.6039216, 1,
-0.2458592, 0.1911066, -1.180827, 0, 1, 0.6117647, 1,
-0.2408258, 0.3042472, -0.4291747, 0, 1, 0.6156863, 1,
-0.2342703, 0.1259281, -0.6201978, 0, 1, 0.6235294, 1,
-0.2338161, 0.219143, 0.9127096, 0, 1, 0.627451, 1,
-0.2335939, 1.608811, -0.5781437, 0, 1, 0.6352941, 1,
-0.2311703, 1.187663, 0.2916733, 0, 1, 0.6392157, 1,
-0.2290041, 0.6692963, 0.2427784, 0, 1, 0.6470588, 1,
-0.2266665, -0.2121362, -2.412451, 0, 1, 0.6509804, 1,
-0.225709, 0.29045, -2.188954, 0, 1, 0.6588235, 1,
-0.2246798, -2.420863, -4.215944, 0, 1, 0.6627451, 1,
-0.2226308, 1.311378, -1.986882, 0, 1, 0.6705883, 1,
-0.2224823, -0.5760098, -3.582699, 0, 1, 0.6745098, 1,
-0.2222032, -0.6254418, -3.793335, 0, 1, 0.682353, 1,
-0.2215501, 2.351752, -0.8451197, 0, 1, 0.6862745, 1,
-0.2213357, 0.936399, -1.726174, 0, 1, 0.6941177, 1,
-0.2189762, -0.3758361, -3.104784, 0, 1, 0.7019608, 1,
-0.2184859, 0.9618886, 0.2921878, 0, 1, 0.7058824, 1,
-0.2132871, 1.25175, -0.677218, 0, 1, 0.7137255, 1,
-0.207517, 0.1109087, -0.4520166, 0, 1, 0.7176471, 1,
-0.2034963, 1.666055, -0.7266601, 0, 1, 0.7254902, 1,
-0.1973222, 0.499088, -1.045486, 0, 1, 0.7294118, 1,
-0.1966965, 0.4809892, 0.3229658, 0, 1, 0.7372549, 1,
-0.1951532, 1.429956, 1.056479, 0, 1, 0.7411765, 1,
-0.192342, 0.8471316, -0.34396, 0, 1, 0.7490196, 1,
-0.1886342, -0.8376457, -2.600566, 0, 1, 0.7529412, 1,
-0.1884946, -0.937062, -3.954392, 0, 1, 0.7607843, 1,
-0.1874491, -0.4271309, -1.583483, 0, 1, 0.7647059, 1,
-0.184971, -0.3365308, -3.450063, 0, 1, 0.772549, 1,
-0.1839231, 0.1058154, -0.4946445, 0, 1, 0.7764706, 1,
-0.1829946, 1.557792, -0.2212257, 0, 1, 0.7843137, 1,
-0.1822991, 1.023787, -0.01265613, 0, 1, 0.7882353, 1,
-0.1822943, -1.742362, -2.234968, 0, 1, 0.7960784, 1,
-0.1819207, 1.922961, 0.01038899, 0, 1, 0.8039216, 1,
-0.1809928, -1.12444, -2.694175, 0, 1, 0.8078431, 1,
-0.174489, 0.7035954, 1.611029, 0, 1, 0.8156863, 1,
-0.1738697, 0.07814242, -2.814245, 0, 1, 0.8196079, 1,
-0.1731238, -1.281157, -2.560959, 0, 1, 0.827451, 1,
-0.1720921, 2.098531, -0.3665144, 0, 1, 0.8313726, 1,
-0.1674482, -0.3986587, -3.818763, 0, 1, 0.8392157, 1,
-0.1638519, 0.6036997, -1.500759, 0, 1, 0.8431373, 1,
-0.1626446, 0.5193149, 0.03528706, 0, 1, 0.8509804, 1,
-0.1617684, -0.2844052, -2.04626, 0, 1, 0.854902, 1,
-0.160578, 0.155354, -0.9122624, 0, 1, 0.8627451, 1,
-0.1585867, -0.2069384, -2.406218, 0, 1, 0.8666667, 1,
-0.1581689, 1.683288, -1.625624, 0, 1, 0.8745098, 1,
-0.1547762, 0.5072019, 0.4509303, 0, 1, 0.8784314, 1,
-0.1478569, 0.2585321, -0.3747905, 0, 1, 0.8862745, 1,
-0.1476586, -0.5828884, -2.553652, 0, 1, 0.8901961, 1,
-0.1438052, 0.2566854, 1.0552, 0, 1, 0.8980392, 1,
-0.1407837, 1.047062, -0.2272842, 0, 1, 0.9058824, 1,
-0.1368034, 1.240989, 1.397992, 0, 1, 0.9098039, 1,
-0.1350478, 0.2954923, -1.117256, 0, 1, 0.9176471, 1,
-0.1335304, -0.01096517, -2.783662, 0, 1, 0.9215686, 1,
-0.1309225, 0.07031783, -0.6140022, 0, 1, 0.9294118, 1,
-0.1279212, 1.223876, -0.4485707, 0, 1, 0.9333333, 1,
-0.1255163, -0.4055863, 0.284676, 0, 1, 0.9411765, 1,
-0.1210222, -0.6268778, -2.388263, 0, 1, 0.945098, 1,
-0.1120896, -0.7363107, -3.070827, 0, 1, 0.9529412, 1,
-0.1098349, -1.174397, -4.315689, 0, 1, 0.9568627, 1,
-0.1096881, 1.618139, -0.9656635, 0, 1, 0.9647059, 1,
-0.1084473, 0.3251123, 0.6164358, 0, 1, 0.9686275, 1,
-0.1081791, -0.7364445, -3.114124, 0, 1, 0.9764706, 1,
-0.1081589, -0.9081408, -2.703777, 0, 1, 0.9803922, 1,
-0.1066298, 0.3812535, 0.8774872, 0, 1, 0.9882353, 1,
-0.1043295, 0.2899181, -1.345896, 0, 1, 0.9921569, 1,
-0.1020765, 1.100412, -0.2139013, 0, 1, 1, 1,
-0.09629786, -0.2486343, -3.272761, 0, 0.9921569, 1, 1,
-0.0960337, 0.06656092, -0.8180875, 0, 0.9882353, 1, 1,
-0.09351066, 0.02089268, -0.1123779, 0, 0.9803922, 1, 1,
-0.09119223, 0.01847384, -2.493263, 0, 0.9764706, 1, 1,
-0.08695094, 1.220618, 1.009063, 0, 0.9686275, 1, 1,
-0.08402284, -0.3024196, -2.013704, 0, 0.9647059, 1, 1,
-0.08258544, 1.405995, -1.197362, 0, 0.9568627, 1, 1,
-0.07723724, -0.5081861, -2.070934, 0, 0.9529412, 1, 1,
-0.07540789, 0.7238121, 0.6187161, 0, 0.945098, 1, 1,
-0.073094, -0.4285349, -2.57684, 0, 0.9411765, 1, 1,
-0.07124102, -1.894405, -2.728631, 0, 0.9333333, 1, 1,
-0.06672005, 0.5833566, -1.040002, 0, 0.9294118, 1, 1,
-0.06456938, 0.7808097, -0.1287433, 0, 0.9215686, 1, 1,
-0.0641461, 0.0628195, 0.4653915, 0, 0.9176471, 1, 1,
-0.05747406, 0.5172027, -0.7466064, 0, 0.9098039, 1, 1,
-0.0574093, 1.471439, 1.450367, 0, 0.9058824, 1, 1,
-0.05713663, -0.6246255, -2.836623, 0, 0.8980392, 1, 1,
-0.05711634, -0.08091566, -2.878847, 0, 0.8901961, 1, 1,
-0.05694491, 0.4785322, -1.980574, 0, 0.8862745, 1, 1,
-0.05398797, 1.276707, -1.94232, 0, 0.8784314, 1, 1,
-0.05323704, -0.5726787, -2.281275, 0, 0.8745098, 1, 1,
-0.05205582, -0.4014211, -2.751563, 0, 0.8666667, 1, 1,
-0.05195969, 0.1507875, -1.235664, 0, 0.8627451, 1, 1,
-0.05108726, 0.3488006, -0.5929007, 0, 0.854902, 1, 1,
-0.04533721, -1.113318, -5.195549, 0, 0.8509804, 1, 1,
-0.04330259, 0.8379315, 0.679358, 0, 0.8431373, 1, 1,
-0.04224426, -0.3323817, -4.446201, 0, 0.8392157, 1, 1,
-0.03925191, 0.423702, -0.8436919, 0, 0.8313726, 1, 1,
-0.03744764, -1.693011, -3.007644, 0, 0.827451, 1, 1,
-0.03734526, -0.9363108, -2.910168, 0, 0.8196079, 1, 1,
-0.03162891, -0.919894, -2.116692, 0, 0.8156863, 1, 1,
-0.02886975, 0.7619939, -0.6999353, 0, 0.8078431, 1, 1,
-0.02401516, 1.709613, -1.13245, 0, 0.8039216, 1, 1,
-0.02218517, -0.6927099, -3.702812, 0, 0.7960784, 1, 1,
-0.02021578, -0.1893902, -1.854658, 0, 0.7882353, 1, 1,
-0.01892248, -1.418032, -2.843132, 0, 0.7843137, 1, 1,
-0.01825311, 2.646422, -0.8971628, 0, 0.7764706, 1, 1,
-0.01616966, -0.04067763, -2.396083, 0, 0.772549, 1, 1,
-0.01060213, -0.3336088, -5.872541, 0, 0.7647059, 1, 1,
-0.008934234, -0.1235713, -4.457754, 0, 0.7607843, 1, 1,
-0.008114007, -0.4316151, -3.700196, 0, 0.7529412, 1, 1,
-0.0072694, -0.1096623, -2.991218, 0, 0.7490196, 1, 1,
-0.006474025, -1.322404, -2.20163, 0, 0.7411765, 1, 1,
-0.005115494, 0.4466442, -1.251666, 0, 0.7372549, 1, 1,
-6.250018e-05, 0.6650278, 0.4704952, 0, 0.7294118, 1, 1,
0.0027339, 0.390492, -1.44163, 0, 0.7254902, 1, 1,
0.005132094, 1.318188, 0.07730831, 0, 0.7176471, 1, 1,
0.00615005, 0.9071139, 0.5351681, 0, 0.7137255, 1, 1,
0.007236782, -0.2907014, 3.446419, 0, 0.7058824, 1, 1,
0.007755231, -0.5038085, 3.722669, 0, 0.6980392, 1, 1,
0.008055553, 0.6228998, -0.7234268, 0, 0.6941177, 1, 1,
0.01760063, 0.5529494, 0.9335722, 0, 0.6862745, 1, 1,
0.01771414, 1.965717, 1.073189, 0, 0.682353, 1, 1,
0.02139843, 0.2391107, -0.7462726, 0, 0.6745098, 1, 1,
0.0226546, 1.163518, -1.553197, 0, 0.6705883, 1, 1,
0.02681242, -0.5258507, 5.026826, 0, 0.6627451, 1, 1,
0.02715958, -0.06574042, 2.018921, 0, 0.6588235, 1, 1,
0.0276432, 0.001637348, 1.856946, 0, 0.6509804, 1, 1,
0.0288135, -0.8588858, 4.263782, 0, 0.6470588, 1, 1,
0.03436149, -1.543712, 3.72023, 0, 0.6392157, 1, 1,
0.03522778, -1.044239, 4.396734, 0, 0.6352941, 1, 1,
0.03532496, -2.360016, 5.836781, 0, 0.627451, 1, 1,
0.03888826, -0.4216046, 1.56453, 0, 0.6235294, 1, 1,
0.04111655, -0.3767245, 3.751017, 0, 0.6156863, 1, 1,
0.04177802, -0.6510488, 2.211624, 0, 0.6117647, 1, 1,
0.04268653, 1.222189, 1.636326, 0, 0.6039216, 1, 1,
0.04720561, 1.137055, 0.920001, 0, 0.5960785, 1, 1,
0.04798216, -0.05176394, 2.99886, 0, 0.5921569, 1, 1,
0.05154137, -1.927151, 3.980336, 0, 0.5843138, 1, 1,
0.05345455, 0.8280478, -0.2546518, 0, 0.5803922, 1, 1,
0.05496734, 0.9682005, 1.185624, 0, 0.572549, 1, 1,
0.06441832, 0.6233452, 2.381187, 0, 0.5686275, 1, 1,
0.06607773, -0.6330154, 3.64903, 0, 0.5607843, 1, 1,
0.07521727, -1.220318, 3.382465, 0, 0.5568628, 1, 1,
0.0772156, 0.8396665, 1.374892, 0, 0.5490196, 1, 1,
0.07838161, -0.04707484, 2.067088, 0, 0.5450981, 1, 1,
0.08033641, -0.6365957, 2.498783, 0, 0.5372549, 1, 1,
0.08830661, 0.7437767, 0.08871514, 0, 0.5333334, 1, 1,
0.08900624, 0.9754444, 0.2078808, 0, 0.5254902, 1, 1,
0.09415022, 0.6933057, 1.856743, 0, 0.5215687, 1, 1,
0.09419886, 1.059342, 1.038644, 0, 0.5137255, 1, 1,
0.1027156, 1.045981, 0.3524204, 0, 0.509804, 1, 1,
0.1074937, 0.6901907, 0.7061524, 0, 0.5019608, 1, 1,
0.1079892, -0.2030328, 1.411275, 0, 0.4941176, 1, 1,
0.1152331, -0.4299894, 4.079236, 0, 0.4901961, 1, 1,
0.1192961, -0.1091092, 2.657543, 0, 0.4823529, 1, 1,
0.1234101, 0.5200496, 1.404874, 0, 0.4784314, 1, 1,
0.1271049, 0.2191472, 0.82955, 0, 0.4705882, 1, 1,
0.14412, 0.8611037, 0.294129, 0, 0.4666667, 1, 1,
0.1469533, 1.342784, -0.9395097, 0, 0.4588235, 1, 1,
0.1471508, -0.7739702, 3.760723, 0, 0.454902, 1, 1,
0.148065, -0.1969934, 1.875494, 0, 0.4470588, 1, 1,
0.1490666, 0.6235585, 1.735902, 0, 0.4431373, 1, 1,
0.150289, -0.6204205, 1.448834, 0, 0.4352941, 1, 1,
0.1503677, 0.9393412, -0.7177444, 0, 0.4313726, 1, 1,
0.1506007, 0.6813933, -0.2734727, 0, 0.4235294, 1, 1,
0.1514157, -2.308443, 4.282598, 0, 0.4196078, 1, 1,
0.1566891, -0.94, 3.179319, 0, 0.4117647, 1, 1,
0.1647398, 1.710606, 1.161032, 0, 0.4078431, 1, 1,
0.1682803, 0.2059138, -0.1789743, 0, 0.4, 1, 1,
0.170154, -1.366099, 3.4924, 0, 0.3921569, 1, 1,
0.1827633, -1.55988, 2.539581, 0, 0.3882353, 1, 1,
0.1836968, -0.1835254, 2.572524, 0, 0.3803922, 1, 1,
0.1845845, 1.451502, -0.5009205, 0, 0.3764706, 1, 1,
0.1846729, 0.3197689, -0.7378774, 0, 0.3686275, 1, 1,
0.1855184, -1.906228, 2.900908, 0, 0.3647059, 1, 1,
0.185635, 0.5897093, -0.1501599, 0, 0.3568628, 1, 1,
0.1884092, 1.698851, -0.2854497, 0, 0.3529412, 1, 1,
0.191561, 0.05872799, 1.18154, 0, 0.345098, 1, 1,
0.1932791, -1.201598, 2.598466, 0, 0.3411765, 1, 1,
0.2007067, 0.5533292, 0.4135803, 0, 0.3333333, 1, 1,
0.2009344, 2.29987, -1.311826, 0, 0.3294118, 1, 1,
0.2020264, 0.2483673, -0.7312517, 0, 0.3215686, 1, 1,
0.2022531, -0.6212932, 4.118057, 0, 0.3176471, 1, 1,
0.2049436, 0.3695859, 0.6862017, 0, 0.3098039, 1, 1,
0.2169215, 0.4599805, 0.6839491, 0, 0.3058824, 1, 1,
0.2189422, -0.39778, 1.142542, 0, 0.2980392, 1, 1,
0.220116, 0.4847482, 0.4467416, 0, 0.2901961, 1, 1,
0.2216558, -1.825823, 4.140845, 0, 0.2862745, 1, 1,
0.2229751, 2.281998, -0.9138014, 0, 0.2784314, 1, 1,
0.2240078, 1.385596, 0.935306, 0, 0.2745098, 1, 1,
0.2281516, -0.3242533, 4.064866, 0, 0.2666667, 1, 1,
0.2289881, -2.038535, 3.46332, 0, 0.2627451, 1, 1,
0.2361456, 0.5407096, 0.9111809, 0, 0.254902, 1, 1,
0.2365642, 3.3633, -0.4747775, 0, 0.2509804, 1, 1,
0.2375648, 0.2286551, 1.754429, 0, 0.2431373, 1, 1,
0.2384635, -0.4679208, 2.516025, 0, 0.2392157, 1, 1,
0.2391593, -1.157824, 2.778414, 0, 0.2313726, 1, 1,
0.2397817, 0.6288394, 0.838527, 0, 0.227451, 1, 1,
0.2403534, -0.3929884, 1.212401, 0, 0.2196078, 1, 1,
0.2481126, -1.047016, 4.084425, 0, 0.2156863, 1, 1,
0.2485125, -0.3465083, 1.656862, 0, 0.2078431, 1, 1,
0.2489276, 0.7916277, 0.6453324, 0, 0.2039216, 1, 1,
0.2515179, -0.9059567, 5.263985, 0, 0.1960784, 1, 1,
0.2537102, -1.412814, 2.389549, 0, 0.1882353, 1, 1,
0.2543712, 1.169134, 2.787169, 0, 0.1843137, 1, 1,
0.2546399, 0.2906954, 1.451797, 0, 0.1764706, 1, 1,
0.2568403, 1.228193, 0.3884388, 0, 0.172549, 1, 1,
0.2570718, 0.2603447, -0.4621745, 0, 0.1647059, 1, 1,
0.2571857, -0.2833194, 2.818445, 0, 0.1607843, 1, 1,
0.257893, 1.2397, 1.076643, 0, 0.1529412, 1, 1,
0.2636886, -1.124567, 2.108503, 0, 0.1490196, 1, 1,
0.2735779, -1.389324, 1.243688, 0, 0.1411765, 1, 1,
0.2744897, 0.5822277, -0.2400755, 0, 0.1372549, 1, 1,
0.2766037, -1.875793, 2.549758, 0, 0.1294118, 1, 1,
0.2792863, 0.5294758, -0.1253906, 0, 0.1254902, 1, 1,
0.2860041, -0.1316239, 1.195851, 0, 0.1176471, 1, 1,
0.2860264, -0.650075, 1.689788, 0, 0.1137255, 1, 1,
0.2866041, -1.551405, 3.598109, 0, 0.1058824, 1, 1,
0.2876701, -1.940264, 4.464737, 0, 0.09803922, 1, 1,
0.2898829, 2.821952, 0.9734659, 0, 0.09411765, 1, 1,
0.2930689, 0.3369072, -1.09666, 0, 0.08627451, 1, 1,
0.2932116, 3.028505, -1.234564, 0, 0.08235294, 1, 1,
0.2990065, 0.3428396, -0.3602659, 0, 0.07450981, 1, 1,
0.3072349, -0.4186721, 3.062479, 0, 0.07058824, 1, 1,
0.3085277, -1.646909, 2.938702, 0, 0.0627451, 1, 1,
0.3151806, -0.3352018, 3.416696, 0, 0.05882353, 1, 1,
0.3155205, 0.8986154, 0.2975036, 0, 0.05098039, 1, 1,
0.3197525, 0.3669812, 0.02109977, 0, 0.04705882, 1, 1,
0.3202091, 1.0696, 0.7954025, 0, 0.03921569, 1, 1,
0.3226563, 0.5768509, 0.4904577, 0, 0.03529412, 1, 1,
0.324897, -2.191699, 3.666843, 0, 0.02745098, 1, 1,
0.3254154, -1.254556, 4.382285, 0, 0.02352941, 1, 1,
0.3270719, 0.4088318, 0.2255033, 0, 0.01568628, 1, 1,
0.3298666, 0.007852565, 0.3021903, 0, 0.01176471, 1, 1,
0.3380081, -1.043745, 2.411602, 0, 0.003921569, 1, 1,
0.3380979, 1.376348, -0.8715568, 0.003921569, 0, 1, 1,
0.3384169, 0.6034505, -0.09401391, 0.007843138, 0, 1, 1,
0.3445597, -0.07333735, 3.194093, 0.01568628, 0, 1, 1,
0.3449511, -0.8568395, 3.723515, 0.01960784, 0, 1, 1,
0.3465751, -1.047705, 2.958475, 0.02745098, 0, 1, 1,
0.3503897, 0.0675666, 2.561141, 0.03137255, 0, 1, 1,
0.3573565, -0.8971151, 3.544706, 0.03921569, 0, 1, 1,
0.3673489, -1.084849, 2.8574, 0.04313726, 0, 1, 1,
0.3675589, -0.7538007, 3.311221, 0.05098039, 0, 1, 1,
0.3686266, 1.0588, -0.3724721, 0.05490196, 0, 1, 1,
0.3763501, 1.24866, -0.5447336, 0.0627451, 0, 1, 1,
0.378939, 0.3159754, 2.160542, 0.06666667, 0, 1, 1,
0.3901194, -1.407817, 3.341103, 0.07450981, 0, 1, 1,
0.3940658, 1.857846, -1.711914, 0.07843138, 0, 1, 1,
0.3944059, 0.3979072, -1.137972, 0.08627451, 0, 1, 1,
0.4003468, -0.2713028, 2.012822, 0.09019608, 0, 1, 1,
0.4029621, -0.4412079, 2.938132, 0.09803922, 0, 1, 1,
0.4051549, -0.833225, 2.822038, 0.1058824, 0, 1, 1,
0.4075704, 0.4153019, 1.809167, 0.1098039, 0, 1, 1,
0.4083999, 1.42394, 0.2883859, 0.1176471, 0, 1, 1,
0.4085105, -0.1625597, 0.9506886, 0.1215686, 0, 1, 1,
0.4098962, 2.327469, -0.5892518, 0.1294118, 0, 1, 1,
0.4114584, -1.859714, 3.110235, 0.1333333, 0, 1, 1,
0.4116382, 0.2279031, 2.127614, 0.1411765, 0, 1, 1,
0.4149852, -0.4798515, 2.711335, 0.145098, 0, 1, 1,
0.4237933, 0.4139964, 0.8711177, 0.1529412, 0, 1, 1,
0.4292111, 1.517904, 1.369218, 0.1568628, 0, 1, 1,
0.4296098, -1.162091, 1.725887, 0.1647059, 0, 1, 1,
0.4308171, -0.5543124, 0.7193207, 0.1686275, 0, 1, 1,
0.4315245, 1.56084, -1.088797, 0.1764706, 0, 1, 1,
0.437537, -1.777509, 0.6700389, 0.1803922, 0, 1, 1,
0.4436759, 1.411826, -0.1823001, 0.1882353, 0, 1, 1,
0.4443795, 1.658563, 0.1241252, 0.1921569, 0, 1, 1,
0.4453509, 0.7515953, 0.4483537, 0.2, 0, 1, 1,
0.4481373, -1.147291, 4.904952, 0.2078431, 0, 1, 1,
0.4570557, -1.332116, 2.947299, 0.2117647, 0, 1, 1,
0.4580132, 0.3175099, 2.778563, 0.2196078, 0, 1, 1,
0.4627923, -1.057966, 3.282363, 0.2235294, 0, 1, 1,
0.462851, -0.7972711, 3.883162, 0.2313726, 0, 1, 1,
0.4631201, -0.0696842, 1.951678, 0.2352941, 0, 1, 1,
0.4638349, 0.9990948, -1.220219, 0.2431373, 0, 1, 1,
0.4669563, 1.689715, 0.9214097, 0.2470588, 0, 1, 1,
0.4703273, 0.4267311, 1.293346, 0.254902, 0, 1, 1,
0.4770633, 0.7542579, 0.08166142, 0.2588235, 0, 1, 1,
0.4852165, -0.1323431, 0.6074813, 0.2666667, 0, 1, 1,
0.4860272, -1.211292, 2.869507, 0.2705882, 0, 1, 1,
0.491179, -0.4601986, 2.721837, 0.2784314, 0, 1, 1,
0.4928051, 0.2909043, 0.2074323, 0.282353, 0, 1, 1,
0.4949046, -0.06519808, 1.375374, 0.2901961, 0, 1, 1,
0.4990179, -0.04738798, 2.486465, 0.2941177, 0, 1, 1,
0.4997596, -0.5879691, 3.128339, 0.3019608, 0, 1, 1,
0.4999284, 1.099907, 0.6424239, 0.3098039, 0, 1, 1,
0.5041339, 1.011294, -1.22128, 0.3137255, 0, 1, 1,
0.5106739, 1.928656, 0.9799248, 0.3215686, 0, 1, 1,
0.5231892, -0.3050687, 2.271672, 0.3254902, 0, 1, 1,
0.5292529, 0.02352607, 0.6847635, 0.3333333, 0, 1, 1,
0.5294175, -1.011362, 4.845426, 0.3372549, 0, 1, 1,
0.5330746, 0.658879, -0.2701912, 0.345098, 0, 1, 1,
0.5360291, -0.1334158, 2.037278, 0.3490196, 0, 1, 1,
0.5395015, 0.6181657, -0.06069903, 0.3568628, 0, 1, 1,
0.539837, -1.180736, 1.923282, 0.3607843, 0, 1, 1,
0.5435804, -1.763979, 2.710007, 0.3686275, 0, 1, 1,
0.5437732, 0.3721858, 1.331828, 0.372549, 0, 1, 1,
0.5489579, 0.5787112, -0.4893874, 0.3803922, 0, 1, 1,
0.5521033, -0.5127121, 1.575512, 0.3843137, 0, 1, 1,
0.5611291, 0.9480285, -0.9575123, 0.3921569, 0, 1, 1,
0.5614363, -0.3712773, 1.899363, 0.3960784, 0, 1, 1,
0.5635287, 0.1049149, 0.6101871, 0.4039216, 0, 1, 1,
0.5707864, 1.682999, -0.9986708, 0.4117647, 0, 1, 1,
0.5742716, -1.195878, 1.726321, 0.4156863, 0, 1, 1,
0.5783603, 0.4469178, 2.126974, 0.4235294, 0, 1, 1,
0.5826861, -0.6353449, 2.862821, 0.427451, 0, 1, 1,
0.5884055, 0.4641164, 0.9775092, 0.4352941, 0, 1, 1,
0.593356, 0.8871768, -0.2680623, 0.4392157, 0, 1, 1,
0.6018003, -1.186123, 4.578203, 0.4470588, 0, 1, 1,
0.6062821, -0.02028759, 1.523712, 0.4509804, 0, 1, 1,
0.6081681, 2.260731, 0.8695475, 0.4588235, 0, 1, 1,
0.6129757, -1.616328, 1.754633, 0.4627451, 0, 1, 1,
0.6182814, 0.1516785, 0.8106358, 0.4705882, 0, 1, 1,
0.6244082, 1.301788, -1.537273, 0.4745098, 0, 1, 1,
0.6261824, 1.833822, -0.02945837, 0.4823529, 0, 1, 1,
0.6302342, 0.6696001, 1.618973, 0.4862745, 0, 1, 1,
0.6307303, -0.7091559, 3.50697, 0.4941176, 0, 1, 1,
0.6343473, -0.04590741, 2.43286, 0.5019608, 0, 1, 1,
0.6351975, -0.04684753, 0.8795153, 0.5058824, 0, 1, 1,
0.6366574, -0.9583901, 1.034911, 0.5137255, 0, 1, 1,
0.645759, -1.061879, 2.786078, 0.5176471, 0, 1, 1,
0.65119, 2.409876, -0.06245078, 0.5254902, 0, 1, 1,
0.6534107, 0.5720958, -0.09573598, 0.5294118, 0, 1, 1,
0.655019, -0.8100224, 2.283373, 0.5372549, 0, 1, 1,
0.6591386, -0.8586538, 1.579594, 0.5411765, 0, 1, 1,
0.6686387, -0.7441957, 2.286255, 0.5490196, 0, 1, 1,
0.6748145, 0.03844202, 1.745411, 0.5529412, 0, 1, 1,
0.6777866, 0.377178, 2.217759, 0.5607843, 0, 1, 1,
0.6783151, -1.550168, 2.407964, 0.5647059, 0, 1, 1,
0.6814855, -1.158991, 1.976446, 0.572549, 0, 1, 1,
0.6839686, 0.6376087, -0.322821, 0.5764706, 0, 1, 1,
0.6881137, 0.4937734, 0.6658651, 0.5843138, 0, 1, 1,
0.6905792, 0.7326785, 1.312516, 0.5882353, 0, 1, 1,
0.692026, 1.105056, 1.099335, 0.5960785, 0, 1, 1,
0.6930028, -2.17737, 1.803833, 0.6039216, 0, 1, 1,
0.6948698, 0.09676945, 0.7240664, 0.6078432, 0, 1, 1,
0.6993625, -0.4593393, 1.548232, 0.6156863, 0, 1, 1,
0.7054533, -0.9171643, 2.808403, 0.6196079, 0, 1, 1,
0.7070219, 0.02755208, 1.991224, 0.627451, 0, 1, 1,
0.7073409, 0.2175309, 1.322838, 0.6313726, 0, 1, 1,
0.7081167, -0.6633866, 2.155475, 0.6392157, 0, 1, 1,
0.709216, 0.4492348, 1.619199, 0.6431373, 0, 1, 1,
0.7111043, 0.4937117, 0.2112759, 0.6509804, 0, 1, 1,
0.7117789, -0.1123041, 1.713587, 0.654902, 0, 1, 1,
0.7262598, -1.858244, 3.318959, 0.6627451, 0, 1, 1,
0.7273634, 1.252487, 0.3032667, 0.6666667, 0, 1, 1,
0.7304285, -0.6485729, 3.021638, 0.6745098, 0, 1, 1,
0.7350618, 0.41005, 0.09726992, 0.6784314, 0, 1, 1,
0.7469571, 0.240182, 0.2696086, 0.6862745, 0, 1, 1,
0.7478681, -0.6922792, 3.310577, 0.6901961, 0, 1, 1,
0.7517572, -0.9857596, 2.065422, 0.6980392, 0, 1, 1,
0.7565483, -0.2897275, 3.178989, 0.7058824, 0, 1, 1,
0.7567388, 0.7416559, 1.574181, 0.7098039, 0, 1, 1,
0.7627896, 1.000438, -0.8009046, 0.7176471, 0, 1, 1,
0.769942, -0.2926655, 1.657862, 0.7215686, 0, 1, 1,
0.7714791, 0.2253196, -0.1286039, 0.7294118, 0, 1, 1,
0.7746647, -0.6653286, 1.221407, 0.7333333, 0, 1, 1,
0.7802073, -0.1011655, 1.147914, 0.7411765, 0, 1, 1,
0.7818351, -0.2426613, 3.08179, 0.7450981, 0, 1, 1,
0.7838456, 2.226759, 0.1064741, 0.7529412, 0, 1, 1,
0.7863188, -0.2482624, 2.533257, 0.7568628, 0, 1, 1,
0.7936239, -1.12735, 2.235438, 0.7647059, 0, 1, 1,
0.7955032, -0.7342506, 1.980918, 0.7686275, 0, 1, 1,
0.7991036, 2.182075, 0.4912588, 0.7764706, 0, 1, 1,
0.8020232, 0.3118904, 2.258982, 0.7803922, 0, 1, 1,
0.8023984, 0.5686592, -0.2798008, 0.7882353, 0, 1, 1,
0.8112336, 0.5615321, 1.509222, 0.7921569, 0, 1, 1,
0.8172457, -0.4230244, 0.9721935, 0.8, 0, 1, 1,
0.8188134, 1.219782, 0.8831265, 0.8078431, 0, 1, 1,
0.8251994, 0.2149279, 1.478374, 0.8117647, 0, 1, 1,
0.8252428, -0.7363046, 2.833239, 0.8196079, 0, 1, 1,
0.8265803, -1.166451, 3.663521, 0.8235294, 0, 1, 1,
0.835658, -2.453562, 3.493099, 0.8313726, 0, 1, 1,
0.8414925, -0.8172197, 2.220981, 0.8352941, 0, 1, 1,
0.8469008, 0.1869254, 0.09115585, 0.8431373, 0, 1, 1,
0.8505944, -0.1983264, 0.5673444, 0.8470588, 0, 1, 1,
0.851895, -1.355298, 2.356492, 0.854902, 0, 1, 1,
0.8539004, 0.7573469, 0.4061195, 0.8588235, 0, 1, 1,
0.8572335, -1.352687, 3.206901, 0.8666667, 0, 1, 1,
0.8576862, -0.1716043, 1.914314, 0.8705882, 0, 1, 1,
0.8690243, 0.8694988, 1.919544, 0.8784314, 0, 1, 1,
0.8693783, -0.186819, -0.004417565, 0.8823529, 0, 1, 1,
0.8727749, 0.3889144, 1.144818, 0.8901961, 0, 1, 1,
0.8741508, 0.9739815, 0.9977232, 0.8941177, 0, 1, 1,
0.8766168, -0.4144166, 1.907329, 0.9019608, 0, 1, 1,
0.8830735, -0.2424121, 2.325669, 0.9098039, 0, 1, 1,
0.8850292, -0.3186414, 1.588744, 0.9137255, 0, 1, 1,
0.8919654, -0.6852011, 3.075855, 0.9215686, 0, 1, 1,
0.8977242, -0.3054398, 2.522091, 0.9254902, 0, 1, 1,
0.9080674, -0.04730105, 0.7853461, 0.9333333, 0, 1, 1,
0.9134166, 0.5175732, 1.594875, 0.9372549, 0, 1, 1,
0.9136059, 0.4662815, 1.131046, 0.945098, 0, 1, 1,
0.9176849, -0.5819199, 2.97082, 0.9490196, 0, 1, 1,
0.917956, 0.8829798, 0.5727546, 0.9568627, 0, 1, 1,
0.918353, -1.102205, 1.964731, 0.9607843, 0, 1, 1,
0.9196082, -1.618197, 3.039844, 0.9686275, 0, 1, 1,
0.9210849, -0.2515788, 1.037566, 0.972549, 0, 1, 1,
0.9275265, -1.477255, 2.555704, 0.9803922, 0, 1, 1,
0.9287266, -0.0006728377, 2.518311, 0.9843137, 0, 1, 1,
0.9346674, 1.253147, -0.7647657, 0.9921569, 0, 1, 1,
0.9469729, -0.3450975, 1.997959, 0.9960784, 0, 1, 1,
0.9480125, -1.464495, 2.931828, 1, 0, 0.9960784, 1,
0.9491442, -0.1185407, 1.839429, 1, 0, 0.9882353, 1,
0.9492902, 2.504068, 0.6302941, 1, 0, 0.9843137, 1,
0.9510522, 0.1635955, 1.047997, 1, 0, 0.9764706, 1,
0.9532148, 0.09896301, -0.8675517, 1, 0, 0.972549, 1,
0.9540581, -0.7372268, 2.736938, 1, 0, 0.9647059, 1,
0.954378, 1.31, 1.810573, 1, 0, 0.9607843, 1,
0.968091, -1.387697, 3.417631, 1, 0, 0.9529412, 1,
0.9682075, 0.3757656, 1.413033, 1, 0, 0.9490196, 1,
0.9751004, 1.558177, 1.227832, 1, 0, 0.9411765, 1,
0.9791911, 1.499333, 1.099963, 1, 0, 0.9372549, 1,
0.9874477, 0.9957967, 2.00945, 1, 0, 0.9294118, 1,
0.9909311, 0.9061377, 0.3677748, 1, 0, 0.9254902, 1,
0.9910848, -0.08239826, 2.632685, 1, 0, 0.9176471, 1,
0.9932145, -0.8170353, 1.514753, 1, 0, 0.9137255, 1,
0.9995455, -0.4299319, 1.867638, 1, 0, 0.9058824, 1,
1.001593, -0.1450237, 2.418214, 1, 0, 0.9019608, 1,
1.002381, -1.285422, 1.31376, 1, 0, 0.8941177, 1,
1.012582, -1.91821, 4.451586, 1, 0, 0.8862745, 1,
1.014806, 0.98431, 1.380288, 1, 0, 0.8823529, 1,
1.020753, -0.7988397, 1.535682, 1, 0, 0.8745098, 1,
1.021732, 0.3988815, 2.629979, 1, 0, 0.8705882, 1,
1.030123, 0.1855746, 1.61536, 1, 0, 0.8627451, 1,
1.037024, 1.098674, 0.2886809, 1, 0, 0.8588235, 1,
1.037528, -0.2501134, -0.3655474, 1, 0, 0.8509804, 1,
1.04444, 1.115514, 0.3620511, 1, 0, 0.8470588, 1,
1.064808, 0.5318156, 2.292082, 1, 0, 0.8392157, 1,
1.067049, 0.7675812, 1.804306, 1, 0, 0.8352941, 1,
1.076193, -1.360985, 2.09337, 1, 0, 0.827451, 1,
1.086229, 2.296237, 0.09881467, 1, 0, 0.8235294, 1,
1.087512, 0.1534502, 1.28197, 1, 0, 0.8156863, 1,
1.08792, -0.9747421, 2.237529, 1, 0, 0.8117647, 1,
1.088939, -1.017281, 2.812283, 1, 0, 0.8039216, 1,
1.088953, 0.7715504, 0.4040007, 1, 0, 0.7960784, 1,
1.089977, -1.134771, 2.616206, 1, 0, 0.7921569, 1,
1.098263, 1.770291, 0.1721364, 1, 0, 0.7843137, 1,
1.101972, 0.1815118, 2.770354, 1, 0, 0.7803922, 1,
1.123188, -1.262666, 0.7973703, 1, 0, 0.772549, 1,
1.123188, -2.139465, 5.227164, 1, 0, 0.7686275, 1,
1.128876, 1.285272, -0.488026, 1, 0, 0.7607843, 1,
1.130586, -0.6816752, 2.729064, 1, 0, 0.7568628, 1,
1.132866, 1.084811, 3.81419, 1, 0, 0.7490196, 1,
1.140079, 0.8887444, -0.4447023, 1, 0, 0.7450981, 1,
1.143009, 0.3655294, -1.200971, 1, 0, 0.7372549, 1,
1.147052, 1.339734, 0.06186496, 1, 0, 0.7333333, 1,
1.149267, -1.158284, 2.821915, 1, 0, 0.7254902, 1,
1.152175, -0.4815462, 2.107433, 1, 0, 0.7215686, 1,
1.157218, -0.8366668, 0.1647221, 1, 0, 0.7137255, 1,
1.163458, 1.739624, 1.273749, 1, 0, 0.7098039, 1,
1.176649, 0.884162, 1.494598, 1, 0, 0.7019608, 1,
1.181387, 2.227494, 0.9563896, 1, 0, 0.6941177, 1,
1.183355, -0.7604231, 2.183294, 1, 0, 0.6901961, 1,
1.187806, 0.6843389, -0.4379018, 1, 0, 0.682353, 1,
1.192271, 2.603864, 0.2803614, 1, 0, 0.6784314, 1,
1.200588, -0.6018425, 0.9657312, 1, 0, 0.6705883, 1,
1.201271, 2.414258, 0.25662, 1, 0, 0.6666667, 1,
1.203987, 0.8372105, -0.0414322, 1, 0, 0.6588235, 1,
1.207721, -1.554415, 3.219386, 1, 0, 0.654902, 1,
1.210512, -1.427871, 0.9859345, 1, 0, 0.6470588, 1,
1.213448, -0.7990678, 1.025819, 1, 0, 0.6431373, 1,
1.213506, -1.081492, 1.722099, 1, 0, 0.6352941, 1,
1.217729, -0.2456872, 1.699382, 1, 0, 0.6313726, 1,
1.226312, -0.9921863, 2.747393, 1, 0, 0.6235294, 1,
1.227541, -1.022599, 3.154427, 1, 0, 0.6196079, 1,
1.231704, -1.256493, 1.612321, 1, 0, 0.6117647, 1,
1.237236, -0.9259691, 2.665771, 1, 0, 0.6078432, 1,
1.251749, 0.008497777, 1.562431, 1, 0, 0.6, 1,
1.255733, -0.4555281, 2.20574, 1, 0, 0.5921569, 1,
1.260162, -0.8867955, 2.985524, 1, 0, 0.5882353, 1,
1.264641, -0.8083487, 1.556766, 1, 0, 0.5803922, 1,
1.265492, 0.630081, 1.269867, 1, 0, 0.5764706, 1,
1.27724, -1.77722, 3.485251, 1, 0, 0.5686275, 1,
1.282794, -0.1570354, 2.956, 1, 0, 0.5647059, 1,
1.287229, -0.4630394, 2.871395, 1, 0, 0.5568628, 1,
1.297967, 1.474911, 1.771413, 1, 0, 0.5529412, 1,
1.306712, -0.7255219, 0.8739287, 1, 0, 0.5450981, 1,
1.309922, 0.9938395, 0.4069818, 1, 0, 0.5411765, 1,
1.310892, -1.439129, 2.099387, 1, 0, 0.5333334, 1,
1.315274, -0.7499332, 2.226414, 1, 0, 0.5294118, 1,
1.317226, 0.05964763, 2.320461, 1, 0, 0.5215687, 1,
1.325857, -1.411041, 3.044508, 1, 0, 0.5176471, 1,
1.352182, 1.968798, -0.3555563, 1, 0, 0.509804, 1,
1.353284, -1.492631, 2.246967, 1, 0, 0.5058824, 1,
1.362072, 0.8516818, 1.419283, 1, 0, 0.4980392, 1,
1.363571, 0.5395586, 1.049496, 1, 0, 0.4901961, 1,
1.367436, -0.5515147, 0.5763299, 1, 0, 0.4862745, 1,
1.368225, -0.8554697, 1.282204, 1, 0, 0.4784314, 1,
1.40228, -0.3416654, 3.040064, 1, 0, 0.4745098, 1,
1.410388, 0.556917, 0.5174692, 1, 0, 0.4666667, 1,
1.414536, 1.150231, -0.2222766, 1, 0, 0.4627451, 1,
1.422423, -1.143775, 2.692944, 1, 0, 0.454902, 1,
1.422766, -0.2239522, 0.7010043, 1, 0, 0.4509804, 1,
1.425397, -1.889475, 2.101093, 1, 0, 0.4431373, 1,
1.429726, -1.252889, 2.899509, 1, 0, 0.4392157, 1,
1.441059, 0.7545431, 2.620388, 1, 0, 0.4313726, 1,
1.453981, -0.489981, 0.2445651, 1, 0, 0.427451, 1,
1.479849, 0.3475862, 0.1104563, 1, 0, 0.4196078, 1,
1.481029, 0.1701015, 1.839013, 1, 0, 0.4156863, 1,
1.493229, 2.980181, -0.1070979, 1, 0, 0.4078431, 1,
1.500747, 2.014122, -0.2417894, 1, 0, 0.4039216, 1,
1.50496, 0.07316902, 1.645828, 1, 0, 0.3960784, 1,
1.517446, -1.518563, 3.432824, 1, 0, 0.3882353, 1,
1.51956, 1.118578, -0.1363061, 1, 0, 0.3843137, 1,
1.51976, 0.7060323, 2.934698, 1, 0, 0.3764706, 1,
1.530558, -1.381793, 2.781541, 1, 0, 0.372549, 1,
1.537043, -1.396622, 2.081774, 1, 0, 0.3647059, 1,
1.539891, -0.2253253, 1.865711, 1, 0, 0.3607843, 1,
1.554103, -0.75386, -1.550412, 1, 0, 0.3529412, 1,
1.563215, 0.3219764, -0.1274444, 1, 0, 0.3490196, 1,
1.566918, -1.58944, 2.631382, 1, 0, 0.3411765, 1,
1.570993, -0.8008854, 2.479042, 1, 0, 0.3372549, 1,
1.609521, 0.02449653, 3.181171, 1, 0, 0.3294118, 1,
1.620457, -0.01116082, -1.384721, 1, 0, 0.3254902, 1,
1.622224, 1.870973, 1.432422, 1, 0, 0.3176471, 1,
1.624208, 0.8996432, 0.2439439, 1, 0, 0.3137255, 1,
1.633393, 2.163764, 0.4948046, 1, 0, 0.3058824, 1,
1.641087, 0.6331093, 0.6551135, 1, 0, 0.2980392, 1,
1.646615, 1.19072, 2.589948, 1, 0, 0.2941177, 1,
1.680875, 1.837601, 0.7904053, 1, 0, 0.2862745, 1,
1.681231, 1.516108, 1.155055, 1, 0, 0.282353, 1,
1.708583, -0.89385, 2.794087, 1, 0, 0.2745098, 1,
1.726562, 0.3106506, 2.648892, 1, 0, 0.2705882, 1,
1.738754, -0.4532882, 2.420434, 1, 0, 0.2627451, 1,
1.740482, 0.09277165, 3.896667, 1, 0, 0.2588235, 1,
1.743837, 0.6880023, 0.9941775, 1, 0, 0.2509804, 1,
1.755446, -0.2717719, 1.586106, 1, 0, 0.2470588, 1,
1.768435, 0.7399328, 0.9579666, 1, 0, 0.2392157, 1,
1.793678, -1.672891, 2.329519, 1, 0, 0.2352941, 1,
1.817903, -0.2400551, -0.07377948, 1, 0, 0.227451, 1,
1.829826, 0.5195391, 2.046443, 1, 0, 0.2235294, 1,
1.850892, -1.319982, 2.368689, 1, 0, 0.2156863, 1,
1.851399, 1.174789, 1.82687, 1, 0, 0.2117647, 1,
1.851954, -0.151099, 3.647029, 1, 0, 0.2039216, 1,
1.853166, 0.5742175, 1.176495, 1, 0, 0.1960784, 1,
1.857494, -1.017986, 1.150204, 1, 0, 0.1921569, 1,
1.87202, -0.7687165, 1.482614, 1, 0, 0.1843137, 1,
1.872088, 0.4300351, 0.02556595, 1, 0, 0.1803922, 1,
1.872406, 0.5962108, 1.955, 1, 0, 0.172549, 1,
1.875702, -0.535648, 0.3744394, 1, 0, 0.1686275, 1,
1.891542, 0.3653452, -0.02152558, 1, 0, 0.1607843, 1,
1.920282, -1.433528, 2.173596, 1, 0, 0.1568628, 1,
1.922574, -0.7410328, 0.9748729, 1, 0, 0.1490196, 1,
1.933795, 0.1877517, 0.9039501, 1, 0, 0.145098, 1,
1.937063, 1.160092, 0.974503, 1, 0, 0.1372549, 1,
1.945745, -0.2586212, 3.683633, 1, 0, 0.1333333, 1,
1.956511, -0.2754547, 0.5668507, 1, 0, 0.1254902, 1,
1.987967, 1.383691, 1.134403, 1, 0, 0.1215686, 1,
2.000321, 1.776367, 1.030099, 1, 0, 0.1137255, 1,
2.00685, 0.2638296, 2.12478, 1, 0, 0.1098039, 1,
2.03067, 0.371333, 2.252553, 1, 0, 0.1019608, 1,
2.043097, -0.1477092, 2.956459, 1, 0, 0.09411765, 1,
2.05602, -0.698321, 0.2105403, 1, 0, 0.09019608, 1,
2.079237, 1.651982, 0.6467977, 1, 0, 0.08235294, 1,
2.095439, 0.9960652, -0.04177357, 1, 0, 0.07843138, 1,
2.100336, -1.599082, 1.211036, 1, 0, 0.07058824, 1,
2.182042, 0.02134431, 1.513404, 1, 0, 0.06666667, 1,
2.217234, -1.653015, 1.66741, 1, 0, 0.05882353, 1,
2.224766, 1.796924, 0.6410131, 1, 0, 0.05490196, 1,
2.260138, -0.5774394, 1.026405, 1, 0, 0.04705882, 1,
2.269074, 1.54301, 1.384429, 1, 0, 0.04313726, 1,
2.509859, -0.03940782, 2.336232, 1, 0, 0.03529412, 1,
2.637177, 2.131551, 3.217575, 1, 0, 0.03137255, 1,
2.738959, 0.7193598, 1.602031, 1, 0, 0.02352941, 1,
2.740673, -0.08173637, 2.276024, 1, 0, 0.01960784, 1,
3.083993, -1.518574, 2.810995, 1, 0, 0.01176471, 1,
3.090536, -0.5548393, -1.296638, 1, 0, 0.007843138, 1
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
-0.007791042, -3.845991, -7.857272, 0, -0.5, 0.5, 0.5,
-0.007791042, -3.845991, -7.857272, 1, -0.5, 0.5, 0.5,
-0.007791042, -3.845991, -7.857272, 1, 1.5, 0.5, 0.5,
-0.007791042, -3.845991, -7.857272, 0, 1.5, 0.5, 0.5
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
-4.156451, 0.2810893, -7.857272, 0, -0.5, 0.5, 0.5,
-4.156451, 0.2810893, -7.857272, 1, -0.5, 0.5, 0.5,
-4.156451, 0.2810893, -7.857272, 1, 1.5, 0.5, 0.5,
-4.156451, 0.2810893, -7.857272, 0, 1.5, 0.5, 0.5
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
-4.156451, -3.845991, -0.0178802, 0, -0.5, 0.5, 0.5,
-4.156451, -3.845991, -0.0178802, 1, -0.5, 0.5, 0.5,
-4.156451, -3.845991, -0.0178802, 1, 1.5, 0.5, 0.5,
-4.156451, -3.845991, -0.0178802, 0, 1.5, 0.5, 0.5
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
-3, -2.893588, -6.048181,
3, -2.893588, -6.048181,
-3, -2.893588, -6.048181,
-3, -3.052322, -6.349696,
-2, -2.893588, -6.048181,
-2, -3.052322, -6.349696,
-1, -2.893588, -6.048181,
-1, -3.052322, -6.349696,
0, -2.893588, -6.048181,
0, -3.052322, -6.349696,
1, -2.893588, -6.048181,
1, -3.052322, -6.349696,
2, -2.893588, -6.048181,
2, -3.052322, -6.349696,
3, -2.893588, -6.048181,
3, -3.052322, -6.349696
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
-3, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
-3, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
-3, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
-3, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
-2, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
-2, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
-2, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
-2, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
-1, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
-1, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
-1, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
-1, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
0, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
0, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
0, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
0, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
1, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
1, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
1, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
1, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
2, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
2, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
2, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
2, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5,
3, -3.369789, -6.952726, 0, -0.5, 0.5, 0.5,
3, -3.369789, -6.952726, 1, -0.5, 0.5, 0.5,
3, -3.369789, -6.952726, 1, 1.5, 0.5, 0.5,
3, -3.369789, -6.952726, 0, 1.5, 0.5, 0.5
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
-3.199068, -2, -6.048181,
-3.199068, 3, -6.048181,
-3.199068, -2, -6.048181,
-3.358632, -2, -6.349696,
-3.199068, -1, -6.048181,
-3.358632, -1, -6.349696,
-3.199068, 0, -6.048181,
-3.358632, 0, -6.349696,
-3.199068, 1, -6.048181,
-3.358632, 1, -6.349696,
-3.199068, 2, -6.048181,
-3.358632, 2, -6.349696,
-3.199068, 3, -6.048181,
-3.358632, 3, -6.349696
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
-3.67776, -2, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, -2, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, -2, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, -2, -6.952726, 0, 1.5, 0.5, 0.5,
-3.67776, -1, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, -1, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, -1, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, -1, -6.952726, 0, 1.5, 0.5, 0.5,
-3.67776, 0, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, 0, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, 0, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, 0, -6.952726, 0, 1.5, 0.5, 0.5,
-3.67776, 1, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, 1, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, 1, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, 1, -6.952726, 0, 1.5, 0.5, 0.5,
-3.67776, 2, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, 2, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, 2, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, 2, -6.952726, 0, 1.5, 0.5, 0.5,
-3.67776, 3, -6.952726, 0, -0.5, 0.5, 0.5,
-3.67776, 3, -6.952726, 1, -0.5, 0.5, 0.5,
-3.67776, 3, -6.952726, 1, 1.5, 0.5, 0.5,
-3.67776, 3, -6.952726, 0, 1.5, 0.5, 0.5
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
-3.199068, -2.893588, -4,
-3.199068, -2.893588, 4,
-3.199068, -2.893588, -4,
-3.358632, -3.052322, -4,
-3.199068, -2.893588, -2,
-3.358632, -3.052322, -2,
-3.199068, -2.893588, 0,
-3.358632, -3.052322, 0,
-3.199068, -2.893588, 2,
-3.358632, -3.052322, 2,
-3.199068, -2.893588, 4,
-3.358632, -3.052322, 4
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
-3.67776, -3.369789, -4, 0, -0.5, 0.5, 0.5,
-3.67776, -3.369789, -4, 1, -0.5, 0.5, 0.5,
-3.67776, -3.369789, -4, 1, 1.5, 0.5, 0.5,
-3.67776, -3.369789, -4, 0, 1.5, 0.5, 0.5,
-3.67776, -3.369789, -2, 0, -0.5, 0.5, 0.5,
-3.67776, -3.369789, -2, 1, -0.5, 0.5, 0.5,
-3.67776, -3.369789, -2, 1, 1.5, 0.5, 0.5,
-3.67776, -3.369789, -2, 0, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 0, 0, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 0, 1, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 0, 1, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 0, 0, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 2, 0, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 2, 1, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 2, 1, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 2, 0, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 4, 0, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 4, 1, -0.5, 0.5, 0.5,
-3.67776, -3.369789, 4, 1, 1.5, 0.5, 0.5,
-3.67776, -3.369789, 4, 0, 1.5, 0.5, 0.5
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
-3.199068, -2.893588, -6.048181,
-3.199068, 3.455766, -6.048181,
-3.199068, -2.893588, 6.012421,
-3.199068, 3.455766, 6.012421,
-3.199068, -2.893588, -6.048181,
-3.199068, -2.893588, 6.012421,
-3.199068, 3.455766, -6.048181,
-3.199068, 3.455766, 6.012421,
-3.199068, -2.893588, -6.048181,
3.183486, -2.893588, -6.048181,
-3.199068, -2.893588, 6.012421,
3.183486, -2.893588, 6.012421,
-3.199068, 3.455766, -6.048181,
3.183486, 3.455766, -6.048181,
-3.199068, 3.455766, 6.012421,
3.183486, 3.455766, 6.012421,
3.183486, -2.893588, -6.048181,
3.183486, 3.455766, -6.048181,
3.183486, -2.893588, 6.012421,
3.183486, 3.455766, 6.012421,
3.183486, -2.893588, -6.048181,
3.183486, -2.893588, 6.012421,
3.183486, 3.455766, -6.048181,
3.183486, 3.455766, 6.012421
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
var radius = 8.036531;
var distance = 35.75543;
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
mvMatrix.translate( 0.007791042, -0.2810893, 0.0178802 );
mvMatrix.scale( 1.361407, 1.368526, 0.7204661 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75543);
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
tebufenozide<-read.table("tebufenozide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tebufenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'tebufenozide' not found
```

```r
y<-tebufenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'tebufenozide' not found
```

```r
z<-tebufenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'tebufenozide' not found
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
-3.106118, 0.6073593, -1.503657, 0, 0, 1, 1, 1,
-2.884227, 0.5338723, -2.372747, 1, 0, 0, 1, 1,
-2.814221, 0.4509738, -1.488662, 1, 0, 0, 1, 1,
-2.810227, 1.802684, -0.6627027, 1, 0, 0, 1, 1,
-2.738521, -0.3927991, -2.079611, 1, 0, 0, 1, 1,
-2.709768, 1.033477, -3.090065, 1, 0, 0, 1, 1,
-2.705277, -0.4164716, -1.273688, 0, 0, 0, 1, 1,
-2.69868, -0.8524832, 0.08696804, 0, 0, 0, 1, 1,
-2.465285, 0.05413415, -2.83068, 0, 0, 0, 1, 1,
-2.45598, 0.3464507, -3.492013, 0, 0, 0, 1, 1,
-2.444288, 0.6882628, -0.7868122, 0, 0, 0, 1, 1,
-2.397042, -0.4946411, -1.790498, 0, 0, 0, 1, 1,
-2.381989, -0.1284485, -2.097836, 0, 0, 0, 1, 1,
-2.375196, 0.539799, -0.1938498, 1, 1, 1, 1, 1,
-2.355039, 0.7174121, -0.6261799, 1, 1, 1, 1, 1,
-2.276248, 0.4148974, -0.05350204, 1, 1, 1, 1, 1,
-2.265622, -0.3750204, -1.1185, 1, 1, 1, 1, 1,
-2.23345, -0.8350133, -0.9579312, 1, 1, 1, 1, 1,
-2.222647, 1.331123, -0.5024711, 1, 1, 1, 1, 1,
-2.185325, -1.608226, -2.919461, 1, 1, 1, 1, 1,
-2.182007, 0.02284979, -2.631491, 1, 1, 1, 1, 1,
-2.152037, -0.5031265, -1.718755, 1, 1, 1, 1, 1,
-2.122542, 0.5097432, -0.7156876, 1, 1, 1, 1, 1,
-2.120923, -1.915016, -2.542787, 1, 1, 1, 1, 1,
-2.110569, -0.4028421, -2.294974, 1, 1, 1, 1, 1,
-2.107792, 0.7002323, 0.9392689, 1, 1, 1, 1, 1,
-2.095647, -0.007848955, -2.225818, 1, 1, 1, 1, 1,
-2.064785, -1.163543, -1.607824, 1, 1, 1, 1, 1,
-2.054491, -0.8238018, -2.340412, 0, 0, 1, 1, 1,
-2.03767, -0.8178752, -0.9863188, 1, 0, 0, 1, 1,
-2.031569, 2.754275, -1.173856, 1, 0, 0, 1, 1,
-2.016382, -0.9953281, -2.879557, 1, 0, 0, 1, 1,
-2.01374, 1.975077, -0.5804305, 1, 0, 0, 1, 1,
-2.008695, -0.5339637, -1.377935, 1, 0, 0, 1, 1,
-1.977008, 0.11714, -1.686815, 0, 0, 0, 1, 1,
-1.975242, 1.118573, -0.7858101, 0, 0, 0, 1, 1,
-1.95968, -1.728801, -3.340302, 0, 0, 0, 1, 1,
-1.947095, -0.2183522, -1.779809, 0, 0, 0, 1, 1,
-1.9119, -0.2849997, -2.166442, 0, 0, 0, 1, 1,
-1.909524, -1.488394, -1.09258, 0, 0, 0, 1, 1,
-1.899118, -0.5549046, -1.005951, 0, 0, 0, 1, 1,
-1.877934, -0.6437717, -2.317976, 1, 1, 1, 1, 1,
-1.865187, -0.2621831, -1.146007, 1, 1, 1, 1, 1,
-1.851769, 0.2458944, -0.6427369, 1, 1, 1, 1, 1,
-1.851051, 0.6072517, -1.431347, 1, 1, 1, 1, 1,
-1.834918, -0.4495355, -1.009837, 1, 1, 1, 1, 1,
-1.8214, 1.306115, -2.147379, 1, 1, 1, 1, 1,
-1.8192, 0.8659434, -1.578986, 1, 1, 1, 1, 1,
-1.80562, 1.082423, -1.60582, 1, 1, 1, 1, 1,
-1.79036, 0.5011163, -0.7261354, 1, 1, 1, 1, 1,
-1.784366, -0.09500997, -1.746909, 1, 1, 1, 1, 1,
-1.765778, -0.2467264, -3.362696, 1, 1, 1, 1, 1,
-1.708489, 0.8312219, -0.1543707, 1, 1, 1, 1, 1,
-1.706371, -2.28871, -2.40826, 1, 1, 1, 1, 1,
-1.699167, 1.302156, -0.4026748, 1, 1, 1, 1, 1,
-1.666599, -0.2292694, -1.432434, 1, 1, 1, 1, 1,
-1.662549, 0.02954525, 0.3410763, 0, 0, 1, 1, 1,
-1.646052, 2.784782, 0.6817495, 1, 0, 0, 1, 1,
-1.619616, -0.7195585, -4.160324, 1, 0, 0, 1, 1,
-1.617293, 0.07860859, -1.768599, 1, 0, 0, 1, 1,
-1.613708, 0.2679488, 1.245471, 1, 0, 0, 1, 1,
-1.601297, 1.001155, -2.004159, 1, 0, 0, 1, 1,
-1.601031, -0.3492118, -1.003815, 0, 0, 0, 1, 1,
-1.596216, 1.215375, -1.619565, 0, 0, 0, 1, 1,
-1.591037, -0.2198818, -2.228716, 0, 0, 0, 1, 1,
-1.586445, 0.1433662, -1.387445, 0, 0, 0, 1, 1,
-1.58463, 0.1455613, -0.3927253, 0, 0, 0, 1, 1,
-1.55478, -0.5425202, -1.758358, 0, 0, 0, 1, 1,
-1.554551, 0.4413694, -0.7282944, 0, 0, 0, 1, 1,
-1.539653, -1.513193, -3.541131, 1, 1, 1, 1, 1,
-1.524565, 0.4021291, -1.41369, 1, 1, 1, 1, 1,
-1.51712, -0.5883911, -0.5140215, 1, 1, 1, 1, 1,
-1.511057, 0.3982636, -1.589932, 1, 1, 1, 1, 1,
-1.49667, 0.3140318, -0.9434451, 1, 1, 1, 1, 1,
-1.496379, 0.8711541, -2.047434, 1, 1, 1, 1, 1,
-1.493696, -0.1758485, -2.209268, 1, 1, 1, 1, 1,
-1.481737, -0.8189806, -3.619061, 1, 1, 1, 1, 1,
-1.481067, -0.930047, -1.905065, 1, 1, 1, 1, 1,
-1.478115, 0.8280723, -1.507832, 1, 1, 1, 1, 1,
-1.461005, -0.2614683, -1.323963, 1, 1, 1, 1, 1,
-1.457442, 0.8248299, -2.039219, 1, 1, 1, 1, 1,
-1.457139, -0.0206854, -2.450624, 1, 1, 1, 1, 1,
-1.456071, -0.3932827, -0.7972639, 1, 1, 1, 1, 1,
-1.453543, 1.652638, -0.9137991, 1, 1, 1, 1, 1,
-1.451332, 1.636216, -1.74713, 0, 0, 1, 1, 1,
-1.449277, -0.3109639, -0.01635583, 1, 0, 0, 1, 1,
-1.448892, 1.493101, 0.1778185, 1, 0, 0, 1, 1,
-1.447674, 1.743665, -0.6484804, 1, 0, 0, 1, 1,
-1.439664, -2.100135, -1.779532, 1, 0, 0, 1, 1,
-1.418958, 1.338706, -2.450253, 1, 0, 0, 1, 1,
-1.417282, 0.3886077, 0.07067733, 0, 0, 0, 1, 1,
-1.401113, -2.476672, -4.315956, 0, 0, 0, 1, 1,
-1.399861, 0.2116715, -1.299311, 0, 0, 0, 1, 1,
-1.384369, 0.7186393, -0.9495536, 0, 0, 0, 1, 1,
-1.375698, 0.4233603, -2.512939, 0, 0, 0, 1, 1,
-1.359635, 1.278245, -0.06061332, 0, 0, 0, 1, 1,
-1.354699, -0.4067999, -1.375265, 0, 0, 0, 1, 1,
-1.350466, -1.069387, -2.335254, 1, 1, 1, 1, 1,
-1.348661, 0.8155347, -2.381564, 1, 1, 1, 1, 1,
-1.34636, -1.269287, -2.92344, 1, 1, 1, 1, 1,
-1.345185, -1.922736, -3.85801, 1, 1, 1, 1, 1,
-1.342968, -0.5825559, -1.585257, 1, 1, 1, 1, 1,
-1.335545, -0.3686956, -1.778811, 1, 1, 1, 1, 1,
-1.334768, -1.227874, -3.240644, 1, 1, 1, 1, 1,
-1.333768, -0.4176094, -0.8817239, 1, 1, 1, 1, 1,
-1.32828, -0.8959829, -2.114236, 1, 1, 1, 1, 1,
-1.312436, -1.318104, -2.040081, 1, 1, 1, 1, 1,
-1.299099, -0.2781883, -0.7347825, 1, 1, 1, 1, 1,
-1.298662, 0.8061706, -2.295573, 1, 1, 1, 1, 1,
-1.296627, -0.220064, -1.616778, 1, 1, 1, 1, 1,
-1.294912, -1.613844, -0.7464087, 1, 1, 1, 1, 1,
-1.293954, -1.027228, -4.056299, 1, 1, 1, 1, 1,
-1.285054, 0.1491673, -0.03731802, 0, 0, 1, 1, 1,
-1.269885, 0.07698017, -1.265597, 1, 0, 0, 1, 1,
-1.260005, -0.9487845, -0.6009218, 1, 0, 0, 1, 1,
-1.251377, -0.6455417, -0.4863477, 1, 0, 0, 1, 1,
-1.241444, 0.543798, -1.863746, 1, 0, 0, 1, 1,
-1.240153, -1.167894, -2.698079, 1, 0, 0, 1, 1,
-1.239036, 0.4828796, -1.036031, 0, 0, 0, 1, 1,
-1.234312, -0.2029017, -2.11844, 0, 0, 0, 1, 1,
-1.226748, -0.8573987, -2.296535, 0, 0, 0, 1, 1,
-1.216567, 1.722618, -0.9302673, 0, 0, 0, 1, 1,
-1.194066, -1.949457, -2.215523, 0, 0, 0, 1, 1,
-1.192776, 0.0651243, -1.560858, 0, 0, 0, 1, 1,
-1.185872, -0.2018078, -1.574422, 0, 0, 0, 1, 1,
-1.18427, -0.1044815, -0.5593595, 1, 1, 1, 1, 1,
-1.169768, 0.7431313, -1.473743, 1, 1, 1, 1, 1,
-1.167715, -1.59272, -3.569293, 1, 1, 1, 1, 1,
-1.149482, 1.006726, -0.8038684, 1, 1, 1, 1, 1,
-1.147612, 0.5773473, 0.919585, 1, 1, 1, 1, 1,
-1.145195, -0.2145029, -1.929731, 1, 1, 1, 1, 1,
-1.142278, 2.462919, -0.7241005, 1, 1, 1, 1, 1,
-1.136767, 1.262053, -0.3382514, 1, 1, 1, 1, 1,
-1.134506, 0.3830488, -1.147218, 1, 1, 1, 1, 1,
-1.133988, -0.5130493, -1.609472, 1, 1, 1, 1, 1,
-1.128126, 0.474488, -2.531883, 1, 1, 1, 1, 1,
-1.123739, -1.686481, -2.30751, 1, 1, 1, 1, 1,
-1.123558, -0.2611741, -3.427293, 1, 1, 1, 1, 1,
-1.122756, 0.1413052, -0.7825071, 1, 1, 1, 1, 1,
-1.119649, 0.09574814, -2.043645, 1, 1, 1, 1, 1,
-1.119149, -0.1647486, -1.327203, 0, 0, 1, 1, 1,
-1.117851, 0.6472198, 0.3051861, 1, 0, 0, 1, 1,
-1.117538, -0.6263099, -2.43649, 1, 0, 0, 1, 1,
-1.116863, -1.351571, -2.191456, 1, 0, 0, 1, 1,
-1.106466, 1.092812, -0.9508809, 1, 0, 0, 1, 1,
-1.101777, -1.653165, -1.683667, 1, 0, 0, 1, 1,
-1.101013, 0.4774493, -0.22129, 0, 0, 0, 1, 1,
-1.098431, 0.8121808, -1.415599, 0, 0, 0, 1, 1,
-1.09254, 0.06590632, -0.2565275, 0, 0, 0, 1, 1,
-1.09233, 0.705458, -1.316898, 0, 0, 0, 1, 1,
-1.086782, -0.5571674, -2.016353, 0, 0, 0, 1, 1,
-1.086244, -1.319612, -2.301949, 0, 0, 0, 1, 1,
-1.085732, 0.1233199, -1.248044, 0, 0, 0, 1, 1,
-1.077743, 2.119695, -0.1506161, 1, 1, 1, 1, 1,
-1.073416, -0.9782584, -1.899912, 1, 1, 1, 1, 1,
-1.071387, -1.106195, -2.034223, 1, 1, 1, 1, 1,
-1.069952, -0.08888489, -2.62193, 1, 1, 1, 1, 1,
-1.058936, -0.2831662, -1.062404, 1, 1, 1, 1, 1,
-1.052049, 1.662974, -2.248341, 1, 1, 1, 1, 1,
-1.049743, 0.06747857, -1.751411, 1, 1, 1, 1, 1,
-1.041464, 0.7308523, 0.06149312, 1, 1, 1, 1, 1,
-1.03155, -0.3567793, -2.188972, 1, 1, 1, 1, 1,
-1.030693, 2.469925, 0.4903431, 1, 1, 1, 1, 1,
-1.02538, 1.263302, 0.5029793, 1, 1, 1, 1, 1,
-1.022606, -0.4913876, -1.99735, 1, 1, 1, 1, 1,
-1.012537, -0.7678346, -1.198585, 1, 1, 1, 1, 1,
-1.009138, -0.344671, -2.503136, 1, 1, 1, 1, 1,
-1.008536, 0.05340283, -1.320694, 1, 1, 1, 1, 1,
-1.005986, 0.1228942, 0.197077, 0, 0, 1, 1, 1,
-0.999372, -0.7823644, -2.848609, 1, 0, 0, 1, 1,
-0.9971372, 0.80146, -1.000785, 1, 0, 0, 1, 1,
-0.9919716, 0.6956807, -1.247807, 1, 0, 0, 1, 1,
-0.9882451, 0.09805262, -2.362165, 1, 0, 0, 1, 1,
-0.9859297, 1.879508, 0.7391657, 1, 0, 0, 1, 1,
-0.9817626, 0.1083033, -2.157727, 0, 0, 0, 1, 1,
-0.9757841, 0.3271191, -1.512081, 0, 0, 0, 1, 1,
-0.9752599, -1.647837, -1.781068, 0, 0, 0, 1, 1,
-0.9724309, 0.03378407, -3.829888, 0, 0, 0, 1, 1,
-0.968749, -0.6295528, -1.904123, 0, 0, 0, 1, 1,
-0.9681805, 2.480232, 0.8553471, 0, 0, 0, 1, 1,
-0.9679536, 1.009374, -0.5907583, 0, 0, 0, 1, 1,
-0.9668842, 0.3062939, -1.444846, 1, 1, 1, 1, 1,
-0.9622867, -1.727957, -3.016702, 1, 1, 1, 1, 1,
-0.9606935, -0.4464489, -3.401506, 1, 1, 1, 1, 1,
-0.9465238, 1.870172, 0.1340088, 1, 1, 1, 1, 1,
-0.9464338, -0.06848591, -1.653796, 1, 1, 1, 1, 1,
-0.9404468, 0.04742061, -1.435731, 1, 1, 1, 1, 1,
-0.9258916, 0.2143233, -0.786298, 1, 1, 1, 1, 1,
-0.9208901, -0.7186207, -3.839223, 1, 1, 1, 1, 1,
-0.9185129, 0.4536694, -1.577263, 1, 1, 1, 1, 1,
-0.9168516, 0.4416809, 0.2276888, 1, 1, 1, 1, 1,
-0.9165922, 1.707022, 0.7367628, 1, 1, 1, 1, 1,
-0.9142191, -1.357271, -2.211901, 1, 1, 1, 1, 1,
-0.9138759, -0.13609, -1.341144, 1, 1, 1, 1, 1,
-0.9123728, -0.3259911, -1.809662, 1, 1, 1, 1, 1,
-0.9102898, 0.2301669, -1.461892, 1, 1, 1, 1, 1,
-0.8858789, -0.7123318, -2.990299, 0, 0, 1, 1, 1,
-0.8851606, 1.10975, -0.3416618, 1, 0, 0, 1, 1,
-0.8744124, -1.1364, -1.204254, 1, 0, 0, 1, 1,
-0.8709655, -0.0651601, -1.563555, 1, 0, 0, 1, 1,
-0.8632522, 1.908666, 0.04512768, 1, 0, 0, 1, 1,
-0.8555365, -2.801121, -3.939299, 1, 0, 0, 1, 1,
-0.8552256, 0.9783386, 0.6558872, 0, 0, 0, 1, 1,
-0.8477218, -0.7183363, -1.359555, 0, 0, 0, 1, 1,
-0.8461608, 1.524099, -0.2182676, 0, 0, 0, 1, 1,
-0.8456597, 0.6223189, -2.288969, 0, 0, 0, 1, 1,
-0.8434445, -0.2708039, -1.437048, 0, 0, 0, 1, 1,
-0.8340027, 0.4258212, -1.423751, 0, 0, 0, 1, 1,
-0.832391, -0.8669192, -3.045154, 0, 0, 0, 1, 1,
-0.8302363, 0.2122807, -1.158201, 1, 1, 1, 1, 1,
-0.8293449, -0.1437297, -1.583583, 1, 1, 1, 1, 1,
-0.8238086, 0.3408195, -1.565563, 1, 1, 1, 1, 1,
-0.8221568, 0.3900111, -2.471182, 1, 1, 1, 1, 1,
-0.8174008, -0.3504933, -0.3583468, 1, 1, 1, 1, 1,
-0.8140395, 0.3278234, -0.550823, 1, 1, 1, 1, 1,
-0.8132831, 1.060983, 2.43686, 1, 1, 1, 1, 1,
-0.8125879, -1.242162, -1.999174, 1, 1, 1, 1, 1,
-0.8085755, -1.751939, -3.420166, 1, 1, 1, 1, 1,
-0.807797, 0.8904988, -1.850382, 1, 1, 1, 1, 1,
-0.8072329, 0.3730571, -1.573678, 1, 1, 1, 1, 1,
-0.8055655, -0.848285, -3.124686, 1, 1, 1, 1, 1,
-0.8044755, 0.162365, -0.19107, 1, 1, 1, 1, 1,
-0.8038486, 0.8641146, 0.4044558, 1, 1, 1, 1, 1,
-0.79324, 0.04949769, -0.8441676, 1, 1, 1, 1, 1,
-0.7924461, 0.4569674, 0.8014663, 0, 0, 1, 1, 1,
-0.7899758, 0.2055813, -0.2138818, 1, 0, 0, 1, 1,
-0.7887699, 1.141455, -2.477054, 1, 0, 0, 1, 1,
-0.7851682, -0.2023147, -2.379843, 1, 0, 0, 1, 1,
-0.784584, 0.3803976, -0.6869102, 1, 0, 0, 1, 1,
-0.7816439, 0.6011624, 1.254467, 1, 0, 0, 1, 1,
-0.7788154, 0.01392588, -1.971108, 0, 0, 0, 1, 1,
-0.7768911, 0.4640799, -0.4769222, 0, 0, 0, 1, 1,
-0.7767704, 0.2456792, -2.789315, 0, 0, 0, 1, 1,
-0.7752957, 1.327617, -2.503307, 0, 0, 0, 1, 1,
-0.7722643, 0.8664966, -0.3017885, 0, 0, 0, 1, 1,
-0.766944, 1.375945, -1.243767, 0, 0, 0, 1, 1,
-0.7649409, -2.385631, -2.24837, 0, 0, 0, 1, 1,
-0.7638989, 0.7565856, -0.6337101, 1, 1, 1, 1, 1,
-0.7629802, 1.453551, 0.03416464, 1, 1, 1, 1, 1,
-0.7590514, -0.127926, -2.344686, 1, 1, 1, 1, 1,
-0.7518699, 1.261526, -0.7855629, 1, 1, 1, 1, 1,
-0.7500787, 0.4353692, -0.9375072, 1, 1, 1, 1, 1,
-0.7480196, -0.4926948, -2.602912, 1, 1, 1, 1, 1,
-0.7473714, -0.003746743, -1.577391, 1, 1, 1, 1, 1,
-0.741078, 1.291991, 0.6312867, 1, 1, 1, 1, 1,
-0.7390326, -1.617077, -2.518763, 1, 1, 1, 1, 1,
-0.7357369, 0.03323087, -1.828163, 1, 1, 1, 1, 1,
-0.7338606, 1.62303, -1.066495, 1, 1, 1, 1, 1,
-0.7332435, 1.262668, -2.165843, 1, 1, 1, 1, 1,
-0.7315337, -0.6384796, -3.438534, 1, 1, 1, 1, 1,
-0.7303424, 1.175283, -0.6875238, 1, 1, 1, 1, 1,
-0.7188408, -0.3715871, -1.779028, 1, 1, 1, 1, 1,
-0.7087134, -0.1002822, -1.563654, 0, 0, 1, 1, 1,
-0.7030711, 0.6437437, 0.2479547, 1, 0, 0, 1, 1,
-0.7000916, 1.850985, 1.473761, 1, 0, 0, 1, 1,
-0.6982858, -0.3213778, -1.960081, 1, 0, 0, 1, 1,
-0.6951057, 0.01138071, -0.1565295, 1, 0, 0, 1, 1,
-0.6826316, 0.3250481, 0.8133014, 1, 0, 0, 1, 1,
-0.675696, 1.17295, -1.729318, 0, 0, 0, 1, 1,
-0.673974, -1.104061, -3.884679, 0, 0, 0, 1, 1,
-0.6731883, 0.6533247, 0.2335228, 0, 0, 0, 1, 1,
-0.6725462, 0.7894948, -1.405936, 0, 0, 0, 1, 1,
-0.6720701, 0.02034472, -1.32916, 0, 0, 0, 1, 1,
-0.6718984, -0.6150413, -3.775115, 0, 0, 0, 1, 1,
-0.6694911, 1.672905, 1.221387, 0, 0, 0, 1, 1,
-0.6694686, -2.558479, -2.832243, 1, 1, 1, 1, 1,
-0.6572033, -0.6512335, -1.392493, 1, 1, 1, 1, 1,
-0.6547056, 0.850413, -2.367833, 1, 1, 1, 1, 1,
-0.6517208, 0.1497876, -1.791494, 1, 1, 1, 1, 1,
-0.6510699, -1.344466, -4.580019, 1, 1, 1, 1, 1,
-0.6510178, -0.2194386, -1.256305, 1, 1, 1, 1, 1,
-0.6436622, 0.322589, -0.3989857, 1, 1, 1, 1, 1,
-0.6367303, 0.1212241, -0.7434078, 1, 1, 1, 1, 1,
-0.6366095, -0.9233731, -2.893963, 1, 1, 1, 1, 1,
-0.6361182, -1.155239, -4.933629, 1, 1, 1, 1, 1,
-0.6347848, 0.4506798, -0.6093779, 1, 1, 1, 1, 1,
-0.628437, 0.9722607, 0.5344314, 1, 1, 1, 1, 1,
-0.6257044, 0.5516028, -1.812615, 1, 1, 1, 1, 1,
-0.6254249, 0.3511647, -0.2253083, 1, 1, 1, 1, 1,
-0.6210214, -0.6538467, -2.153603, 1, 1, 1, 1, 1,
-0.6189581, -0.3876155, -4.171373, 0, 0, 1, 1, 1,
-0.6161413, -0.4268574, -1.843687, 1, 0, 0, 1, 1,
-0.6068842, -0.3008687, -1.749439, 1, 0, 0, 1, 1,
-0.6063001, 0.1175367, -1.935169, 1, 0, 0, 1, 1,
-0.6058205, -1.057733, -2.356032, 1, 0, 0, 1, 1,
-0.6058185, 0.2040631, -1.970254, 1, 0, 0, 1, 1,
-0.6053687, 1.235468, 1.176117, 0, 0, 0, 1, 1,
-0.6040117, 2.402633, 0.2532176, 0, 0, 0, 1, 1,
-0.603106, 0.4446734, -0.8539187, 0, 0, 0, 1, 1,
-0.6002246, 0.4251032, -1.027366, 0, 0, 0, 1, 1,
-0.5969927, -1.00521, -3.594856, 0, 0, 0, 1, 1,
-0.5920224, 0.8780352, 0.307221, 0, 0, 0, 1, 1,
-0.5916154, 1.087881, 0.2078878, 0, 0, 0, 1, 1,
-0.5913094, -1.306785, -2.237778, 1, 1, 1, 1, 1,
-0.5904381, -0.5385167, -3.282149, 1, 1, 1, 1, 1,
-0.5875139, -1.208987, -3.93666, 1, 1, 1, 1, 1,
-0.5861894, -0.9992828, -4.179265, 1, 1, 1, 1, 1,
-0.5851098, 1.319116, -0.552176, 1, 1, 1, 1, 1,
-0.5840999, 0.8712158, -0.3390774, 1, 1, 1, 1, 1,
-0.5777578, 0.17759, -0.9830396, 1, 1, 1, 1, 1,
-0.5776464, 1.639819, -0.1057343, 1, 1, 1, 1, 1,
-0.5758048, 0.8924152, 0.1318022, 1, 1, 1, 1, 1,
-0.5738856, -0.8489596, -1.647173, 1, 1, 1, 1, 1,
-0.5732991, -0.4909255, -1.201149, 1, 1, 1, 1, 1,
-0.5729628, -1.380622, -4.136911, 1, 1, 1, 1, 1,
-0.5714903, 0.3742033, -0.3688176, 1, 1, 1, 1, 1,
-0.564396, -0.801771, -2.078968, 1, 1, 1, 1, 1,
-0.5597345, 2.283151, -0.04075478, 1, 1, 1, 1, 1,
-0.5571985, 0.02480539, -1.80987, 0, 0, 1, 1, 1,
-0.5564609, -0.5839352, -3.394198, 1, 0, 0, 1, 1,
-0.5555479, -0.09985491, -1.87187, 1, 0, 0, 1, 1,
-0.5550016, -1.711183, -2.157943, 1, 0, 0, 1, 1,
-0.5519615, 1.042623, 0.5232295, 1, 0, 0, 1, 1,
-0.5498115, 0.9874505, -0.8886957, 1, 0, 0, 1, 1,
-0.5488686, 0.7548333, -0.1989059, 0, 0, 0, 1, 1,
-0.5430746, -1.167482, -2.853026, 0, 0, 0, 1, 1,
-0.5418761, 0.6563697, 0.1062888, 0, 0, 0, 1, 1,
-0.541741, 0.3077148, -1.080672, 0, 0, 0, 1, 1,
-0.5406836, 1.402842, -1.524611, 0, 0, 0, 1, 1,
-0.5386115, 0.5830473, -1.93216, 0, 0, 0, 1, 1,
-0.5370361, -0.1784677, -3.861171, 0, 0, 0, 1, 1,
-0.5258822, 0.3547441, -1.784277, 1, 1, 1, 1, 1,
-0.5243877, 0.42899, -0.3733031, 1, 1, 1, 1, 1,
-0.523185, 0.1394323, -2.293102, 1, 1, 1, 1, 1,
-0.5203118, 0.4362611, -3.328492, 1, 1, 1, 1, 1,
-0.5200729, 0.9874955, -2.502827, 1, 1, 1, 1, 1,
-0.5187604, 0.02011356, -0.8682174, 1, 1, 1, 1, 1,
-0.5142926, -1.386707, -1.74409, 1, 1, 1, 1, 1,
-0.5074716, 1.297668, -1.700559, 1, 1, 1, 1, 1,
-0.5073773, 1.010901, -1.124591, 1, 1, 1, 1, 1,
-0.501191, -0.1184532, -1.303848, 1, 1, 1, 1, 1,
-0.4987592, 1.070557, 0.5888956, 1, 1, 1, 1, 1,
-0.4934963, -2.237325, -1.951752, 1, 1, 1, 1, 1,
-0.4906692, -0.04273565, -0.332229, 1, 1, 1, 1, 1,
-0.4853851, 0.3807316, -1.078846, 1, 1, 1, 1, 1,
-0.4774742, -0.2164697, -1.182386, 1, 1, 1, 1, 1,
-0.4747768, -2.109431, -4.036919, 0, 0, 1, 1, 1,
-0.4739812, -0.500489, -3.304567, 1, 0, 0, 1, 1,
-0.4734735, -0.346035, -2.174658, 1, 0, 0, 1, 1,
-0.4729159, 0.3471274, -0.8383209, 1, 0, 0, 1, 1,
-0.4604907, -0.7240847, -2.85486, 1, 0, 0, 1, 1,
-0.4601318, 1.586605, -0.8768141, 1, 0, 0, 1, 1,
-0.4584039, -0.8190899, -3.895747, 0, 0, 0, 1, 1,
-0.4536882, 1.517427, -0.3964188, 0, 0, 0, 1, 1,
-0.452887, 2.189674, 1.195752, 0, 0, 0, 1, 1,
-0.4466445, 1.322367, 0.3875004, 0, 0, 0, 1, 1,
-0.4448917, 1.748091, 0.126867, 0, 0, 0, 1, 1,
-0.4376068, -0.3267204, -2.451457, 0, 0, 0, 1, 1,
-0.4368694, 0.7436873, -0.2243406, 0, 0, 0, 1, 1,
-0.4354388, -0.4221444, -0.575105, 1, 1, 1, 1, 1,
-0.4334838, -0.07233801, -2.036282, 1, 1, 1, 1, 1,
-0.425101, -0.03315015, -2.569262, 1, 1, 1, 1, 1,
-0.4248085, 0.005540584, -3.160985, 1, 1, 1, 1, 1,
-0.4220884, 0.3485064, -0.5402679, 1, 1, 1, 1, 1,
-0.4216186, 0.04112257, -1.109869, 1, 1, 1, 1, 1,
-0.4213158, -1.716453, -3.668298, 1, 1, 1, 1, 1,
-0.4137824, -0.03045158, -0.7872074, 1, 1, 1, 1, 1,
-0.4081274, -0.6424705, -3.19264, 1, 1, 1, 1, 1,
-0.4058474, 0.5918083, 0.245091, 1, 1, 1, 1, 1,
-0.3989664, 0.4632379, -1.566632, 1, 1, 1, 1, 1,
-0.3983778, -0.5858029, -3.02268, 1, 1, 1, 1, 1,
-0.3963561, -0.3880869, -4.787772, 1, 1, 1, 1, 1,
-0.3954649, 0.07333469, -2.629687, 1, 1, 1, 1, 1,
-0.3891589, -0.6387833, -3.453654, 1, 1, 1, 1, 1,
-0.389035, 0.04709353, -1.239333, 0, 0, 1, 1, 1,
-0.3866019, -1.513607, -2.214145, 1, 0, 0, 1, 1,
-0.385062, 1.250494, -0.6848661, 1, 0, 0, 1, 1,
-0.3836264, 0.6874263, -1.618407, 1, 0, 0, 1, 1,
-0.3797973, -1.651033, -3.932396, 1, 0, 0, 1, 1,
-0.3795418, 0.4251492, -0.6176221, 1, 0, 0, 1, 1,
-0.3776596, -0.8324364, -2.520273, 0, 0, 0, 1, 1,
-0.3776176, -0.5090955, -3.400076, 0, 0, 0, 1, 1,
-0.376801, -0.248708, -3.046679, 0, 0, 0, 1, 1,
-0.3747459, 1.353486, -0.5311719, 0, 0, 0, 1, 1,
-0.3743893, -1.189214, -2.059517, 0, 0, 0, 1, 1,
-0.373549, 0.1129764, -0.5859472, 0, 0, 0, 1, 1,
-0.3733574, -2.466634, -3.464586, 0, 0, 0, 1, 1,
-0.3729545, 1.114751, -2.641685, 1, 1, 1, 1, 1,
-0.3727694, 0.2463408, -1.671876, 1, 1, 1, 1, 1,
-0.3714599, -0.4843749, -3.332659, 1, 1, 1, 1, 1,
-0.3689901, -0.1669089, -3.305493, 1, 1, 1, 1, 1,
-0.3685303, -0.2123889, -1.896945, 1, 1, 1, 1, 1,
-0.3683363, -0.2220798, -0.8636949, 1, 1, 1, 1, 1,
-0.363194, -1.329086, -2.597022, 1, 1, 1, 1, 1,
-0.3611854, -0.1023138, -1.28245, 1, 1, 1, 1, 1,
-0.3568072, 1.972575, -0.8476242, 1, 1, 1, 1, 1,
-0.3545656, 0.6645927, -0.03346246, 1, 1, 1, 1, 1,
-0.350665, -0.5466525, -2.990638, 1, 1, 1, 1, 1,
-0.3500067, -0.08980852, -1.649739, 1, 1, 1, 1, 1,
-0.3477953, -0.1110476, -1.211256, 1, 1, 1, 1, 1,
-0.3474845, -1.198914, -4.22228, 1, 1, 1, 1, 1,
-0.3449199, 0.4253892, 1.338363, 1, 1, 1, 1, 1,
-0.3429027, 0.8455559, 1.093374, 0, 0, 1, 1, 1,
-0.3358299, 0.1260186, -0.4404692, 1, 0, 0, 1, 1,
-0.3347339, 0.03011918, -1.313466, 1, 0, 0, 1, 1,
-0.334227, -1.172819, -2.380471, 1, 0, 0, 1, 1,
-0.3335485, 1.12066, -0.4743714, 1, 0, 0, 1, 1,
-0.3312178, -0.7764176, -3.015784, 1, 0, 0, 1, 1,
-0.3298357, 1.79946, -0.541006, 0, 0, 0, 1, 1,
-0.3261547, 0.1706983, -1.382648, 0, 0, 0, 1, 1,
-0.3205685, 0.1196274, 1.194278, 0, 0, 0, 1, 1,
-0.3199561, 0.5709414, 0.702979, 0, 0, 0, 1, 1,
-0.3196248, 2.062443, 2.075901, 0, 0, 0, 1, 1,
-0.319177, -0.04753922, -2.628413, 0, 0, 0, 1, 1,
-0.318601, 0.2458008, -2.02388, 0, 0, 0, 1, 1,
-0.3125381, -1.490131, -3.00212, 1, 1, 1, 1, 1,
-0.3075677, -1.585967, -0.960229, 1, 1, 1, 1, 1,
-0.3050602, 0.9746522, -0.3284355, 1, 1, 1, 1, 1,
-0.3038157, 0.2344213, -1.411712, 1, 1, 1, 1, 1,
-0.3022221, -2.279417, -2.587296, 1, 1, 1, 1, 1,
-0.301966, 0.5178626, -0.4551227, 1, 1, 1, 1, 1,
-0.3018645, -0.3174123, -3.279326, 1, 1, 1, 1, 1,
-0.2993608, -0.2996149, -2.824987, 1, 1, 1, 1, 1,
-0.2982812, -0.9512988, -4.952664, 1, 1, 1, 1, 1,
-0.2978435, 1.286718, -0.5330545, 1, 1, 1, 1, 1,
-0.2969683, -2.059892, -4.295003, 1, 1, 1, 1, 1,
-0.291004, 1.50466, -1.133576, 1, 1, 1, 1, 1,
-0.2816755, -0.6760016, -2.858769, 1, 1, 1, 1, 1,
-0.2776209, -0.3493548, -1.896153, 1, 1, 1, 1, 1,
-0.2728707, 0.02261182, -1.460385, 1, 1, 1, 1, 1,
-0.2706546, -1.758802, -2.833026, 0, 0, 1, 1, 1,
-0.2698545, -0.1039053, -0.5823672, 1, 0, 0, 1, 1,
-0.2696837, 1.165972, -1.023615, 1, 0, 0, 1, 1,
-0.2688799, -0.7596205, -2.380839, 1, 0, 0, 1, 1,
-0.2653539, -1.459065, -3.62099, 1, 0, 0, 1, 1,
-0.2647781, 0.8644285, -0.866859, 1, 0, 0, 1, 1,
-0.2590837, 0.2611675, -1.669828, 0, 0, 0, 1, 1,
-0.2589157, 1.032116, 0.06049435, 0, 0, 0, 1, 1,
-0.2577266, -0.5976557, -1.167765, 0, 0, 0, 1, 1,
-0.2574582, -0.7879158, -3.268689, 0, 0, 0, 1, 1,
-0.2555028, -0.5471889, -1.344049, 0, 0, 0, 1, 1,
-0.2523452, 1.4434, -0.4513009, 0, 0, 0, 1, 1,
-0.2496982, -0.01857698, -2.040881, 0, 0, 0, 1, 1,
-0.2487862, 1.011991, -0.4393345, 1, 1, 1, 1, 1,
-0.2465511, -0.7118212, -2.512513, 1, 1, 1, 1, 1,
-0.2458592, 0.1911066, -1.180827, 1, 1, 1, 1, 1,
-0.2408258, 0.3042472, -0.4291747, 1, 1, 1, 1, 1,
-0.2342703, 0.1259281, -0.6201978, 1, 1, 1, 1, 1,
-0.2338161, 0.219143, 0.9127096, 1, 1, 1, 1, 1,
-0.2335939, 1.608811, -0.5781437, 1, 1, 1, 1, 1,
-0.2311703, 1.187663, 0.2916733, 1, 1, 1, 1, 1,
-0.2290041, 0.6692963, 0.2427784, 1, 1, 1, 1, 1,
-0.2266665, -0.2121362, -2.412451, 1, 1, 1, 1, 1,
-0.225709, 0.29045, -2.188954, 1, 1, 1, 1, 1,
-0.2246798, -2.420863, -4.215944, 1, 1, 1, 1, 1,
-0.2226308, 1.311378, -1.986882, 1, 1, 1, 1, 1,
-0.2224823, -0.5760098, -3.582699, 1, 1, 1, 1, 1,
-0.2222032, -0.6254418, -3.793335, 1, 1, 1, 1, 1,
-0.2215501, 2.351752, -0.8451197, 0, 0, 1, 1, 1,
-0.2213357, 0.936399, -1.726174, 1, 0, 0, 1, 1,
-0.2189762, -0.3758361, -3.104784, 1, 0, 0, 1, 1,
-0.2184859, 0.9618886, 0.2921878, 1, 0, 0, 1, 1,
-0.2132871, 1.25175, -0.677218, 1, 0, 0, 1, 1,
-0.207517, 0.1109087, -0.4520166, 1, 0, 0, 1, 1,
-0.2034963, 1.666055, -0.7266601, 0, 0, 0, 1, 1,
-0.1973222, 0.499088, -1.045486, 0, 0, 0, 1, 1,
-0.1966965, 0.4809892, 0.3229658, 0, 0, 0, 1, 1,
-0.1951532, 1.429956, 1.056479, 0, 0, 0, 1, 1,
-0.192342, 0.8471316, -0.34396, 0, 0, 0, 1, 1,
-0.1886342, -0.8376457, -2.600566, 0, 0, 0, 1, 1,
-0.1884946, -0.937062, -3.954392, 0, 0, 0, 1, 1,
-0.1874491, -0.4271309, -1.583483, 1, 1, 1, 1, 1,
-0.184971, -0.3365308, -3.450063, 1, 1, 1, 1, 1,
-0.1839231, 0.1058154, -0.4946445, 1, 1, 1, 1, 1,
-0.1829946, 1.557792, -0.2212257, 1, 1, 1, 1, 1,
-0.1822991, 1.023787, -0.01265613, 1, 1, 1, 1, 1,
-0.1822943, -1.742362, -2.234968, 1, 1, 1, 1, 1,
-0.1819207, 1.922961, 0.01038899, 1, 1, 1, 1, 1,
-0.1809928, -1.12444, -2.694175, 1, 1, 1, 1, 1,
-0.174489, 0.7035954, 1.611029, 1, 1, 1, 1, 1,
-0.1738697, 0.07814242, -2.814245, 1, 1, 1, 1, 1,
-0.1731238, -1.281157, -2.560959, 1, 1, 1, 1, 1,
-0.1720921, 2.098531, -0.3665144, 1, 1, 1, 1, 1,
-0.1674482, -0.3986587, -3.818763, 1, 1, 1, 1, 1,
-0.1638519, 0.6036997, -1.500759, 1, 1, 1, 1, 1,
-0.1626446, 0.5193149, 0.03528706, 1, 1, 1, 1, 1,
-0.1617684, -0.2844052, -2.04626, 0, 0, 1, 1, 1,
-0.160578, 0.155354, -0.9122624, 1, 0, 0, 1, 1,
-0.1585867, -0.2069384, -2.406218, 1, 0, 0, 1, 1,
-0.1581689, 1.683288, -1.625624, 1, 0, 0, 1, 1,
-0.1547762, 0.5072019, 0.4509303, 1, 0, 0, 1, 1,
-0.1478569, 0.2585321, -0.3747905, 1, 0, 0, 1, 1,
-0.1476586, -0.5828884, -2.553652, 0, 0, 0, 1, 1,
-0.1438052, 0.2566854, 1.0552, 0, 0, 0, 1, 1,
-0.1407837, 1.047062, -0.2272842, 0, 0, 0, 1, 1,
-0.1368034, 1.240989, 1.397992, 0, 0, 0, 1, 1,
-0.1350478, 0.2954923, -1.117256, 0, 0, 0, 1, 1,
-0.1335304, -0.01096517, -2.783662, 0, 0, 0, 1, 1,
-0.1309225, 0.07031783, -0.6140022, 0, 0, 0, 1, 1,
-0.1279212, 1.223876, -0.4485707, 1, 1, 1, 1, 1,
-0.1255163, -0.4055863, 0.284676, 1, 1, 1, 1, 1,
-0.1210222, -0.6268778, -2.388263, 1, 1, 1, 1, 1,
-0.1120896, -0.7363107, -3.070827, 1, 1, 1, 1, 1,
-0.1098349, -1.174397, -4.315689, 1, 1, 1, 1, 1,
-0.1096881, 1.618139, -0.9656635, 1, 1, 1, 1, 1,
-0.1084473, 0.3251123, 0.6164358, 1, 1, 1, 1, 1,
-0.1081791, -0.7364445, -3.114124, 1, 1, 1, 1, 1,
-0.1081589, -0.9081408, -2.703777, 1, 1, 1, 1, 1,
-0.1066298, 0.3812535, 0.8774872, 1, 1, 1, 1, 1,
-0.1043295, 0.2899181, -1.345896, 1, 1, 1, 1, 1,
-0.1020765, 1.100412, -0.2139013, 1, 1, 1, 1, 1,
-0.09629786, -0.2486343, -3.272761, 1, 1, 1, 1, 1,
-0.0960337, 0.06656092, -0.8180875, 1, 1, 1, 1, 1,
-0.09351066, 0.02089268, -0.1123779, 1, 1, 1, 1, 1,
-0.09119223, 0.01847384, -2.493263, 0, 0, 1, 1, 1,
-0.08695094, 1.220618, 1.009063, 1, 0, 0, 1, 1,
-0.08402284, -0.3024196, -2.013704, 1, 0, 0, 1, 1,
-0.08258544, 1.405995, -1.197362, 1, 0, 0, 1, 1,
-0.07723724, -0.5081861, -2.070934, 1, 0, 0, 1, 1,
-0.07540789, 0.7238121, 0.6187161, 1, 0, 0, 1, 1,
-0.073094, -0.4285349, -2.57684, 0, 0, 0, 1, 1,
-0.07124102, -1.894405, -2.728631, 0, 0, 0, 1, 1,
-0.06672005, 0.5833566, -1.040002, 0, 0, 0, 1, 1,
-0.06456938, 0.7808097, -0.1287433, 0, 0, 0, 1, 1,
-0.0641461, 0.0628195, 0.4653915, 0, 0, 0, 1, 1,
-0.05747406, 0.5172027, -0.7466064, 0, 0, 0, 1, 1,
-0.0574093, 1.471439, 1.450367, 0, 0, 0, 1, 1,
-0.05713663, -0.6246255, -2.836623, 1, 1, 1, 1, 1,
-0.05711634, -0.08091566, -2.878847, 1, 1, 1, 1, 1,
-0.05694491, 0.4785322, -1.980574, 1, 1, 1, 1, 1,
-0.05398797, 1.276707, -1.94232, 1, 1, 1, 1, 1,
-0.05323704, -0.5726787, -2.281275, 1, 1, 1, 1, 1,
-0.05205582, -0.4014211, -2.751563, 1, 1, 1, 1, 1,
-0.05195969, 0.1507875, -1.235664, 1, 1, 1, 1, 1,
-0.05108726, 0.3488006, -0.5929007, 1, 1, 1, 1, 1,
-0.04533721, -1.113318, -5.195549, 1, 1, 1, 1, 1,
-0.04330259, 0.8379315, 0.679358, 1, 1, 1, 1, 1,
-0.04224426, -0.3323817, -4.446201, 1, 1, 1, 1, 1,
-0.03925191, 0.423702, -0.8436919, 1, 1, 1, 1, 1,
-0.03744764, -1.693011, -3.007644, 1, 1, 1, 1, 1,
-0.03734526, -0.9363108, -2.910168, 1, 1, 1, 1, 1,
-0.03162891, -0.919894, -2.116692, 1, 1, 1, 1, 1,
-0.02886975, 0.7619939, -0.6999353, 0, 0, 1, 1, 1,
-0.02401516, 1.709613, -1.13245, 1, 0, 0, 1, 1,
-0.02218517, -0.6927099, -3.702812, 1, 0, 0, 1, 1,
-0.02021578, -0.1893902, -1.854658, 1, 0, 0, 1, 1,
-0.01892248, -1.418032, -2.843132, 1, 0, 0, 1, 1,
-0.01825311, 2.646422, -0.8971628, 1, 0, 0, 1, 1,
-0.01616966, -0.04067763, -2.396083, 0, 0, 0, 1, 1,
-0.01060213, -0.3336088, -5.872541, 0, 0, 0, 1, 1,
-0.008934234, -0.1235713, -4.457754, 0, 0, 0, 1, 1,
-0.008114007, -0.4316151, -3.700196, 0, 0, 0, 1, 1,
-0.0072694, -0.1096623, -2.991218, 0, 0, 0, 1, 1,
-0.006474025, -1.322404, -2.20163, 0, 0, 0, 1, 1,
-0.005115494, 0.4466442, -1.251666, 0, 0, 0, 1, 1,
-6.250018e-05, 0.6650278, 0.4704952, 1, 1, 1, 1, 1,
0.0027339, 0.390492, -1.44163, 1, 1, 1, 1, 1,
0.005132094, 1.318188, 0.07730831, 1, 1, 1, 1, 1,
0.00615005, 0.9071139, 0.5351681, 1, 1, 1, 1, 1,
0.007236782, -0.2907014, 3.446419, 1, 1, 1, 1, 1,
0.007755231, -0.5038085, 3.722669, 1, 1, 1, 1, 1,
0.008055553, 0.6228998, -0.7234268, 1, 1, 1, 1, 1,
0.01760063, 0.5529494, 0.9335722, 1, 1, 1, 1, 1,
0.01771414, 1.965717, 1.073189, 1, 1, 1, 1, 1,
0.02139843, 0.2391107, -0.7462726, 1, 1, 1, 1, 1,
0.0226546, 1.163518, -1.553197, 1, 1, 1, 1, 1,
0.02681242, -0.5258507, 5.026826, 1, 1, 1, 1, 1,
0.02715958, -0.06574042, 2.018921, 1, 1, 1, 1, 1,
0.0276432, 0.001637348, 1.856946, 1, 1, 1, 1, 1,
0.0288135, -0.8588858, 4.263782, 1, 1, 1, 1, 1,
0.03436149, -1.543712, 3.72023, 0, 0, 1, 1, 1,
0.03522778, -1.044239, 4.396734, 1, 0, 0, 1, 1,
0.03532496, -2.360016, 5.836781, 1, 0, 0, 1, 1,
0.03888826, -0.4216046, 1.56453, 1, 0, 0, 1, 1,
0.04111655, -0.3767245, 3.751017, 1, 0, 0, 1, 1,
0.04177802, -0.6510488, 2.211624, 1, 0, 0, 1, 1,
0.04268653, 1.222189, 1.636326, 0, 0, 0, 1, 1,
0.04720561, 1.137055, 0.920001, 0, 0, 0, 1, 1,
0.04798216, -0.05176394, 2.99886, 0, 0, 0, 1, 1,
0.05154137, -1.927151, 3.980336, 0, 0, 0, 1, 1,
0.05345455, 0.8280478, -0.2546518, 0, 0, 0, 1, 1,
0.05496734, 0.9682005, 1.185624, 0, 0, 0, 1, 1,
0.06441832, 0.6233452, 2.381187, 0, 0, 0, 1, 1,
0.06607773, -0.6330154, 3.64903, 1, 1, 1, 1, 1,
0.07521727, -1.220318, 3.382465, 1, 1, 1, 1, 1,
0.0772156, 0.8396665, 1.374892, 1, 1, 1, 1, 1,
0.07838161, -0.04707484, 2.067088, 1, 1, 1, 1, 1,
0.08033641, -0.6365957, 2.498783, 1, 1, 1, 1, 1,
0.08830661, 0.7437767, 0.08871514, 1, 1, 1, 1, 1,
0.08900624, 0.9754444, 0.2078808, 1, 1, 1, 1, 1,
0.09415022, 0.6933057, 1.856743, 1, 1, 1, 1, 1,
0.09419886, 1.059342, 1.038644, 1, 1, 1, 1, 1,
0.1027156, 1.045981, 0.3524204, 1, 1, 1, 1, 1,
0.1074937, 0.6901907, 0.7061524, 1, 1, 1, 1, 1,
0.1079892, -0.2030328, 1.411275, 1, 1, 1, 1, 1,
0.1152331, -0.4299894, 4.079236, 1, 1, 1, 1, 1,
0.1192961, -0.1091092, 2.657543, 1, 1, 1, 1, 1,
0.1234101, 0.5200496, 1.404874, 1, 1, 1, 1, 1,
0.1271049, 0.2191472, 0.82955, 0, 0, 1, 1, 1,
0.14412, 0.8611037, 0.294129, 1, 0, 0, 1, 1,
0.1469533, 1.342784, -0.9395097, 1, 0, 0, 1, 1,
0.1471508, -0.7739702, 3.760723, 1, 0, 0, 1, 1,
0.148065, -0.1969934, 1.875494, 1, 0, 0, 1, 1,
0.1490666, 0.6235585, 1.735902, 1, 0, 0, 1, 1,
0.150289, -0.6204205, 1.448834, 0, 0, 0, 1, 1,
0.1503677, 0.9393412, -0.7177444, 0, 0, 0, 1, 1,
0.1506007, 0.6813933, -0.2734727, 0, 0, 0, 1, 1,
0.1514157, -2.308443, 4.282598, 0, 0, 0, 1, 1,
0.1566891, -0.94, 3.179319, 0, 0, 0, 1, 1,
0.1647398, 1.710606, 1.161032, 0, 0, 0, 1, 1,
0.1682803, 0.2059138, -0.1789743, 0, 0, 0, 1, 1,
0.170154, -1.366099, 3.4924, 1, 1, 1, 1, 1,
0.1827633, -1.55988, 2.539581, 1, 1, 1, 1, 1,
0.1836968, -0.1835254, 2.572524, 1, 1, 1, 1, 1,
0.1845845, 1.451502, -0.5009205, 1, 1, 1, 1, 1,
0.1846729, 0.3197689, -0.7378774, 1, 1, 1, 1, 1,
0.1855184, -1.906228, 2.900908, 1, 1, 1, 1, 1,
0.185635, 0.5897093, -0.1501599, 1, 1, 1, 1, 1,
0.1884092, 1.698851, -0.2854497, 1, 1, 1, 1, 1,
0.191561, 0.05872799, 1.18154, 1, 1, 1, 1, 1,
0.1932791, -1.201598, 2.598466, 1, 1, 1, 1, 1,
0.2007067, 0.5533292, 0.4135803, 1, 1, 1, 1, 1,
0.2009344, 2.29987, -1.311826, 1, 1, 1, 1, 1,
0.2020264, 0.2483673, -0.7312517, 1, 1, 1, 1, 1,
0.2022531, -0.6212932, 4.118057, 1, 1, 1, 1, 1,
0.2049436, 0.3695859, 0.6862017, 1, 1, 1, 1, 1,
0.2169215, 0.4599805, 0.6839491, 0, 0, 1, 1, 1,
0.2189422, -0.39778, 1.142542, 1, 0, 0, 1, 1,
0.220116, 0.4847482, 0.4467416, 1, 0, 0, 1, 1,
0.2216558, -1.825823, 4.140845, 1, 0, 0, 1, 1,
0.2229751, 2.281998, -0.9138014, 1, 0, 0, 1, 1,
0.2240078, 1.385596, 0.935306, 1, 0, 0, 1, 1,
0.2281516, -0.3242533, 4.064866, 0, 0, 0, 1, 1,
0.2289881, -2.038535, 3.46332, 0, 0, 0, 1, 1,
0.2361456, 0.5407096, 0.9111809, 0, 0, 0, 1, 1,
0.2365642, 3.3633, -0.4747775, 0, 0, 0, 1, 1,
0.2375648, 0.2286551, 1.754429, 0, 0, 0, 1, 1,
0.2384635, -0.4679208, 2.516025, 0, 0, 0, 1, 1,
0.2391593, -1.157824, 2.778414, 0, 0, 0, 1, 1,
0.2397817, 0.6288394, 0.838527, 1, 1, 1, 1, 1,
0.2403534, -0.3929884, 1.212401, 1, 1, 1, 1, 1,
0.2481126, -1.047016, 4.084425, 1, 1, 1, 1, 1,
0.2485125, -0.3465083, 1.656862, 1, 1, 1, 1, 1,
0.2489276, 0.7916277, 0.6453324, 1, 1, 1, 1, 1,
0.2515179, -0.9059567, 5.263985, 1, 1, 1, 1, 1,
0.2537102, -1.412814, 2.389549, 1, 1, 1, 1, 1,
0.2543712, 1.169134, 2.787169, 1, 1, 1, 1, 1,
0.2546399, 0.2906954, 1.451797, 1, 1, 1, 1, 1,
0.2568403, 1.228193, 0.3884388, 1, 1, 1, 1, 1,
0.2570718, 0.2603447, -0.4621745, 1, 1, 1, 1, 1,
0.2571857, -0.2833194, 2.818445, 1, 1, 1, 1, 1,
0.257893, 1.2397, 1.076643, 1, 1, 1, 1, 1,
0.2636886, -1.124567, 2.108503, 1, 1, 1, 1, 1,
0.2735779, -1.389324, 1.243688, 1, 1, 1, 1, 1,
0.2744897, 0.5822277, -0.2400755, 0, 0, 1, 1, 1,
0.2766037, -1.875793, 2.549758, 1, 0, 0, 1, 1,
0.2792863, 0.5294758, -0.1253906, 1, 0, 0, 1, 1,
0.2860041, -0.1316239, 1.195851, 1, 0, 0, 1, 1,
0.2860264, -0.650075, 1.689788, 1, 0, 0, 1, 1,
0.2866041, -1.551405, 3.598109, 1, 0, 0, 1, 1,
0.2876701, -1.940264, 4.464737, 0, 0, 0, 1, 1,
0.2898829, 2.821952, 0.9734659, 0, 0, 0, 1, 1,
0.2930689, 0.3369072, -1.09666, 0, 0, 0, 1, 1,
0.2932116, 3.028505, -1.234564, 0, 0, 0, 1, 1,
0.2990065, 0.3428396, -0.3602659, 0, 0, 0, 1, 1,
0.3072349, -0.4186721, 3.062479, 0, 0, 0, 1, 1,
0.3085277, -1.646909, 2.938702, 0, 0, 0, 1, 1,
0.3151806, -0.3352018, 3.416696, 1, 1, 1, 1, 1,
0.3155205, 0.8986154, 0.2975036, 1, 1, 1, 1, 1,
0.3197525, 0.3669812, 0.02109977, 1, 1, 1, 1, 1,
0.3202091, 1.0696, 0.7954025, 1, 1, 1, 1, 1,
0.3226563, 0.5768509, 0.4904577, 1, 1, 1, 1, 1,
0.324897, -2.191699, 3.666843, 1, 1, 1, 1, 1,
0.3254154, -1.254556, 4.382285, 1, 1, 1, 1, 1,
0.3270719, 0.4088318, 0.2255033, 1, 1, 1, 1, 1,
0.3298666, 0.007852565, 0.3021903, 1, 1, 1, 1, 1,
0.3380081, -1.043745, 2.411602, 1, 1, 1, 1, 1,
0.3380979, 1.376348, -0.8715568, 1, 1, 1, 1, 1,
0.3384169, 0.6034505, -0.09401391, 1, 1, 1, 1, 1,
0.3445597, -0.07333735, 3.194093, 1, 1, 1, 1, 1,
0.3449511, -0.8568395, 3.723515, 1, 1, 1, 1, 1,
0.3465751, -1.047705, 2.958475, 1, 1, 1, 1, 1,
0.3503897, 0.0675666, 2.561141, 0, 0, 1, 1, 1,
0.3573565, -0.8971151, 3.544706, 1, 0, 0, 1, 1,
0.3673489, -1.084849, 2.8574, 1, 0, 0, 1, 1,
0.3675589, -0.7538007, 3.311221, 1, 0, 0, 1, 1,
0.3686266, 1.0588, -0.3724721, 1, 0, 0, 1, 1,
0.3763501, 1.24866, -0.5447336, 1, 0, 0, 1, 1,
0.378939, 0.3159754, 2.160542, 0, 0, 0, 1, 1,
0.3901194, -1.407817, 3.341103, 0, 0, 0, 1, 1,
0.3940658, 1.857846, -1.711914, 0, 0, 0, 1, 1,
0.3944059, 0.3979072, -1.137972, 0, 0, 0, 1, 1,
0.4003468, -0.2713028, 2.012822, 0, 0, 0, 1, 1,
0.4029621, -0.4412079, 2.938132, 0, 0, 0, 1, 1,
0.4051549, -0.833225, 2.822038, 0, 0, 0, 1, 1,
0.4075704, 0.4153019, 1.809167, 1, 1, 1, 1, 1,
0.4083999, 1.42394, 0.2883859, 1, 1, 1, 1, 1,
0.4085105, -0.1625597, 0.9506886, 1, 1, 1, 1, 1,
0.4098962, 2.327469, -0.5892518, 1, 1, 1, 1, 1,
0.4114584, -1.859714, 3.110235, 1, 1, 1, 1, 1,
0.4116382, 0.2279031, 2.127614, 1, 1, 1, 1, 1,
0.4149852, -0.4798515, 2.711335, 1, 1, 1, 1, 1,
0.4237933, 0.4139964, 0.8711177, 1, 1, 1, 1, 1,
0.4292111, 1.517904, 1.369218, 1, 1, 1, 1, 1,
0.4296098, -1.162091, 1.725887, 1, 1, 1, 1, 1,
0.4308171, -0.5543124, 0.7193207, 1, 1, 1, 1, 1,
0.4315245, 1.56084, -1.088797, 1, 1, 1, 1, 1,
0.437537, -1.777509, 0.6700389, 1, 1, 1, 1, 1,
0.4436759, 1.411826, -0.1823001, 1, 1, 1, 1, 1,
0.4443795, 1.658563, 0.1241252, 1, 1, 1, 1, 1,
0.4453509, 0.7515953, 0.4483537, 0, 0, 1, 1, 1,
0.4481373, -1.147291, 4.904952, 1, 0, 0, 1, 1,
0.4570557, -1.332116, 2.947299, 1, 0, 0, 1, 1,
0.4580132, 0.3175099, 2.778563, 1, 0, 0, 1, 1,
0.4627923, -1.057966, 3.282363, 1, 0, 0, 1, 1,
0.462851, -0.7972711, 3.883162, 1, 0, 0, 1, 1,
0.4631201, -0.0696842, 1.951678, 0, 0, 0, 1, 1,
0.4638349, 0.9990948, -1.220219, 0, 0, 0, 1, 1,
0.4669563, 1.689715, 0.9214097, 0, 0, 0, 1, 1,
0.4703273, 0.4267311, 1.293346, 0, 0, 0, 1, 1,
0.4770633, 0.7542579, 0.08166142, 0, 0, 0, 1, 1,
0.4852165, -0.1323431, 0.6074813, 0, 0, 0, 1, 1,
0.4860272, -1.211292, 2.869507, 0, 0, 0, 1, 1,
0.491179, -0.4601986, 2.721837, 1, 1, 1, 1, 1,
0.4928051, 0.2909043, 0.2074323, 1, 1, 1, 1, 1,
0.4949046, -0.06519808, 1.375374, 1, 1, 1, 1, 1,
0.4990179, -0.04738798, 2.486465, 1, 1, 1, 1, 1,
0.4997596, -0.5879691, 3.128339, 1, 1, 1, 1, 1,
0.4999284, 1.099907, 0.6424239, 1, 1, 1, 1, 1,
0.5041339, 1.011294, -1.22128, 1, 1, 1, 1, 1,
0.5106739, 1.928656, 0.9799248, 1, 1, 1, 1, 1,
0.5231892, -0.3050687, 2.271672, 1, 1, 1, 1, 1,
0.5292529, 0.02352607, 0.6847635, 1, 1, 1, 1, 1,
0.5294175, -1.011362, 4.845426, 1, 1, 1, 1, 1,
0.5330746, 0.658879, -0.2701912, 1, 1, 1, 1, 1,
0.5360291, -0.1334158, 2.037278, 1, 1, 1, 1, 1,
0.5395015, 0.6181657, -0.06069903, 1, 1, 1, 1, 1,
0.539837, -1.180736, 1.923282, 1, 1, 1, 1, 1,
0.5435804, -1.763979, 2.710007, 0, 0, 1, 1, 1,
0.5437732, 0.3721858, 1.331828, 1, 0, 0, 1, 1,
0.5489579, 0.5787112, -0.4893874, 1, 0, 0, 1, 1,
0.5521033, -0.5127121, 1.575512, 1, 0, 0, 1, 1,
0.5611291, 0.9480285, -0.9575123, 1, 0, 0, 1, 1,
0.5614363, -0.3712773, 1.899363, 1, 0, 0, 1, 1,
0.5635287, 0.1049149, 0.6101871, 0, 0, 0, 1, 1,
0.5707864, 1.682999, -0.9986708, 0, 0, 0, 1, 1,
0.5742716, -1.195878, 1.726321, 0, 0, 0, 1, 1,
0.5783603, 0.4469178, 2.126974, 0, 0, 0, 1, 1,
0.5826861, -0.6353449, 2.862821, 0, 0, 0, 1, 1,
0.5884055, 0.4641164, 0.9775092, 0, 0, 0, 1, 1,
0.593356, 0.8871768, -0.2680623, 0, 0, 0, 1, 1,
0.6018003, -1.186123, 4.578203, 1, 1, 1, 1, 1,
0.6062821, -0.02028759, 1.523712, 1, 1, 1, 1, 1,
0.6081681, 2.260731, 0.8695475, 1, 1, 1, 1, 1,
0.6129757, -1.616328, 1.754633, 1, 1, 1, 1, 1,
0.6182814, 0.1516785, 0.8106358, 1, 1, 1, 1, 1,
0.6244082, 1.301788, -1.537273, 1, 1, 1, 1, 1,
0.6261824, 1.833822, -0.02945837, 1, 1, 1, 1, 1,
0.6302342, 0.6696001, 1.618973, 1, 1, 1, 1, 1,
0.6307303, -0.7091559, 3.50697, 1, 1, 1, 1, 1,
0.6343473, -0.04590741, 2.43286, 1, 1, 1, 1, 1,
0.6351975, -0.04684753, 0.8795153, 1, 1, 1, 1, 1,
0.6366574, -0.9583901, 1.034911, 1, 1, 1, 1, 1,
0.645759, -1.061879, 2.786078, 1, 1, 1, 1, 1,
0.65119, 2.409876, -0.06245078, 1, 1, 1, 1, 1,
0.6534107, 0.5720958, -0.09573598, 1, 1, 1, 1, 1,
0.655019, -0.8100224, 2.283373, 0, 0, 1, 1, 1,
0.6591386, -0.8586538, 1.579594, 1, 0, 0, 1, 1,
0.6686387, -0.7441957, 2.286255, 1, 0, 0, 1, 1,
0.6748145, 0.03844202, 1.745411, 1, 0, 0, 1, 1,
0.6777866, 0.377178, 2.217759, 1, 0, 0, 1, 1,
0.6783151, -1.550168, 2.407964, 1, 0, 0, 1, 1,
0.6814855, -1.158991, 1.976446, 0, 0, 0, 1, 1,
0.6839686, 0.6376087, -0.322821, 0, 0, 0, 1, 1,
0.6881137, 0.4937734, 0.6658651, 0, 0, 0, 1, 1,
0.6905792, 0.7326785, 1.312516, 0, 0, 0, 1, 1,
0.692026, 1.105056, 1.099335, 0, 0, 0, 1, 1,
0.6930028, -2.17737, 1.803833, 0, 0, 0, 1, 1,
0.6948698, 0.09676945, 0.7240664, 0, 0, 0, 1, 1,
0.6993625, -0.4593393, 1.548232, 1, 1, 1, 1, 1,
0.7054533, -0.9171643, 2.808403, 1, 1, 1, 1, 1,
0.7070219, 0.02755208, 1.991224, 1, 1, 1, 1, 1,
0.7073409, 0.2175309, 1.322838, 1, 1, 1, 1, 1,
0.7081167, -0.6633866, 2.155475, 1, 1, 1, 1, 1,
0.709216, 0.4492348, 1.619199, 1, 1, 1, 1, 1,
0.7111043, 0.4937117, 0.2112759, 1, 1, 1, 1, 1,
0.7117789, -0.1123041, 1.713587, 1, 1, 1, 1, 1,
0.7262598, -1.858244, 3.318959, 1, 1, 1, 1, 1,
0.7273634, 1.252487, 0.3032667, 1, 1, 1, 1, 1,
0.7304285, -0.6485729, 3.021638, 1, 1, 1, 1, 1,
0.7350618, 0.41005, 0.09726992, 1, 1, 1, 1, 1,
0.7469571, 0.240182, 0.2696086, 1, 1, 1, 1, 1,
0.7478681, -0.6922792, 3.310577, 1, 1, 1, 1, 1,
0.7517572, -0.9857596, 2.065422, 1, 1, 1, 1, 1,
0.7565483, -0.2897275, 3.178989, 0, 0, 1, 1, 1,
0.7567388, 0.7416559, 1.574181, 1, 0, 0, 1, 1,
0.7627896, 1.000438, -0.8009046, 1, 0, 0, 1, 1,
0.769942, -0.2926655, 1.657862, 1, 0, 0, 1, 1,
0.7714791, 0.2253196, -0.1286039, 1, 0, 0, 1, 1,
0.7746647, -0.6653286, 1.221407, 1, 0, 0, 1, 1,
0.7802073, -0.1011655, 1.147914, 0, 0, 0, 1, 1,
0.7818351, -0.2426613, 3.08179, 0, 0, 0, 1, 1,
0.7838456, 2.226759, 0.1064741, 0, 0, 0, 1, 1,
0.7863188, -0.2482624, 2.533257, 0, 0, 0, 1, 1,
0.7936239, -1.12735, 2.235438, 0, 0, 0, 1, 1,
0.7955032, -0.7342506, 1.980918, 0, 0, 0, 1, 1,
0.7991036, 2.182075, 0.4912588, 0, 0, 0, 1, 1,
0.8020232, 0.3118904, 2.258982, 1, 1, 1, 1, 1,
0.8023984, 0.5686592, -0.2798008, 1, 1, 1, 1, 1,
0.8112336, 0.5615321, 1.509222, 1, 1, 1, 1, 1,
0.8172457, -0.4230244, 0.9721935, 1, 1, 1, 1, 1,
0.8188134, 1.219782, 0.8831265, 1, 1, 1, 1, 1,
0.8251994, 0.2149279, 1.478374, 1, 1, 1, 1, 1,
0.8252428, -0.7363046, 2.833239, 1, 1, 1, 1, 1,
0.8265803, -1.166451, 3.663521, 1, 1, 1, 1, 1,
0.835658, -2.453562, 3.493099, 1, 1, 1, 1, 1,
0.8414925, -0.8172197, 2.220981, 1, 1, 1, 1, 1,
0.8469008, 0.1869254, 0.09115585, 1, 1, 1, 1, 1,
0.8505944, -0.1983264, 0.5673444, 1, 1, 1, 1, 1,
0.851895, -1.355298, 2.356492, 1, 1, 1, 1, 1,
0.8539004, 0.7573469, 0.4061195, 1, 1, 1, 1, 1,
0.8572335, -1.352687, 3.206901, 1, 1, 1, 1, 1,
0.8576862, -0.1716043, 1.914314, 0, 0, 1, 1, 1,
0.8690243, 0.8694988, 1.919544, 1, 0, 0, 1, 1,
0.8693783, -0.186819, -0.004417565, 1, 0, 0, 1, 1,
0.8727749, 0.3889144, 1.144818, 1, 0, 0, 1, 1,
0.8741508, 0.9739815, 0.9977232, 1, 0, 0, 1, 1,
0.8766168, -0.4144166, 1.907329, 1, 0, 0, 1, 1,
0.8830735, -0.2424121, 2.325669, 0, 0, 0, 1, 1,
0.8850292, -0.3186414, 1.588744, 0, 0, 0, 1, 1,
0.8919654, -0.6852011, 3.075855, 0, 0, 0, 1, 1,
0.8977242, -0.3054398, 2.522091, 0, 0, 0, 1, 1,
0.9080674, -0.04730105, 0.7853461, 0, 0, 0, 1, 1,
0.9134166, 0.5175732, 1.594875, 0, 0, 0, 1, 1,
0.9136059, 0.4662815, 1.131046, 0, 0, 0, 1, 1,
0.9176849, -0.5819199, 2.97082, 1, 1, 1, 1, 1,
0.917956, 0.8829798, 0.5727546, 1, 1, 1, 1, 1,
0.918353, -1.102205, 1.964731, 1, 1, 1, 1, 1,
0.9196082, -1.618197, 3.039844, 1, 1, 1, 1, 1,
0.9210849, -0.2515788, 1.037566, 1, 1, 1, 1, 1,
0.9275265, -1.477255, 2.555704, 1, 1, 1, 1, 1,
0.9287266, -0.0006728377, 2.518311, 1, 1, 1, 1, 1,
0.9346674, 1.253147, -0.7647657, 1, 1, 1, 1, 1,
0.9469729, -0.3450975, 1.997959, 1, 1, 1, 1, 1,
0.9480125, -1.464495, 2.931828, 1, 1, 1, 1, 1,
0.9491442, -0.1185407, 1.839429, 1, 1, 1, 1, 1,
0.9492902, 2.504068, 0.6302941, 1, 1, 1, 1, 1,
0.9510522, 0.1635955, 1.047997, 1, 1, 1, 1, 1,
0.9532148, 0.09896301, -0.8675517, 1, 1, 1, 1, 1,
0.9540581, -0.7372268, 2.736938, 1, 1, 1, 1, 1,
0.954378, 1.31, 1.810573, 0, 0, 1, 1, 1,
0.968091, -1.387697, 3.417631, 1, 0, 0, 1, 1,
0.9682075, 0.3757656, 1.413033, 1, 0, 0, 1, 1,
0.9751004, 1.558177, 1.227832, 1, 0, 0, 1, 1,
0.9791911, 1.499333, 1.099963, 1, 0, 0, 1, 1,
0.9874477, 0.9957967, 2.00945, 1, 0, 0, 1, 1,
0.9909311, 0.9061377, 0.3677748, 0, 0, 0, 1, 1,
0.9910848, -0.08239826, 2.632685, 0, 0, 0, 1, 1,
0.9932145, -0.8170353, 1.514753, 0, 0, 0, 1, 1,
0.9995455, -0.4299319, 1.867638, 0, 0, 0, 1, 1,
1.001593, -0.1450237, 2.418214, 0, 0, 0, 1, 1,
1.002381, -1.285422, 1.31376, 0, 0, 0, 1, 1,
1.012582, -1.91821, 4.451586, 0, 0, 0, 1, 1,
1.014806, 0.98431, 1.380288, 1, 1, 1, 1, 1,
1.020753, -0.7988397, 1.535682, 1, 1, 1, 1, 1,
1.021732, 0.3988815, 2.629979, 1, 1, 1, 1, 1,
1.030123, 0.1855746, 1.61536, 1, 1, 1, 1, 1,
1.037024, 1.098674, 0.2886809, 1, 1, 1, 1, 1,
1.037528, -0.2501134, -0.3655474, 1, 1, 1, 1, 1,
1.04444, 1.115514, 0.3620511, 1, 1, 1, 1, 1,
1.064808, 0.5318156, 2.292082, 1, 1, 1, 1, 1,
1.067049, 0.7675812, 1.804306, 1, 1, 1, 1, 1,
1.076193, -1.360985, 2.09337, 1, 1, 1, 1, 1,
1.086229, 2.296237, 0.09881467, 1, 1, 1, 1, 1,
1.087512, 0.1534502, 1.28197, 1, 1, 1, 1, 1,
1.08792, -0.9747421, 2.237529, 1, 1, 1, 1, 1,
1.088939, -1.017281, 2.812283, 1, 1, 1, 1, 1,
1.088953, 0.7715504, 0.4040007, 1, 1, 1, 1, 1,
1.089977, -1.134771, 2.616206, 0, 0, 1, 1, 1,
1.098263, 1.770291, 0.1721364, 1, 0, 0, 1, 1,
1.101972, 0.1815118, 2.770354, 1, 0, 0, 1, 1,
1.123188, -1.262666, 0.7973703, 1, 0, 0, 1, 1,
1.123188, -2.139465, 5.227164, 1, 0, 0, 1, 1,
1.128876, 1.285272, -0.488026, 1, 0, 0, 1, 1,
1.130586, -0.6816752, 2.729064, 0, 0, 0, 1, 1,
1.132866, 1.084811, 3.81419, 0, 0, 0, 1, 1,
1.140079, 0.8887444, -0.4447023, 0, 0, 0, 1, 1,
1.143009, 0.3655294, -1.200971, 0, 0, 0, 1, 1,
1.147052, 1.339734, 0.06186496, 0, 0, 0, 1, 1,
1.149267, -1.158284, 2.821915, 0, 0, 0, 1, 1,
1.152175, -0.4815462, 2.107433, 0, 0, 0, 1, 1,
1.157218, -0.8366668, 0.1647221, 1, 1, 1, 1, 1,
1.163458, 1.739624, 1.273749, 1, 1, 1, 1, 1,
1.176649, 0.884162, 1.494598, 1, 1, 1, 1, 1,
1.181387, 2.227494, 0.9563896, 1, 1, 1, 1, 1,
1.183355, -0.7604231, 2.183294, 1, 1, 1, 1, 1,
1.187806, 0.6843389, -0.4379018, 1, 1, 1, 1, 1,
1.192271, 2.603864, 0.2803614, 1, 1, 1, 1, 1,
1.200588, -0.6018425, 0.9657312, 1, 1, 1, 1, 1,
1.201271, 2.414258, 0.25662, 1, 1, 1, 1, 1,
1.203987, 0.8372105, -0.0414322, 1, 1, 1, 1, 1,
1.207721, -1.554415, 3.219386, 1, 1, 1, 1, 1,
1.210512, -1.427871, 0.9859345, 1, 1, 1, 1, 1,
1.213448, -0.7990678, 1.025819, 1, 1, 1, 1, 1,
1.213506, -1.081492, 1.722099, 1, 1, 1, 1, 1,
1.217729, -0.2456872, 1.699382, 1, 1, 1, 1, 1,
1.226312, -0.9921863, 2.747393, 0, 0, 1, 1, 1,
1.227541, -1.022599, 3.154427, 1, 0, 0, 1, 1,
1.231704, -1.256493, 1.612321, 1, 0, 0, 1, 1,
1.237236, -0.9259691, 2.665771, 1, 0, 0, 1, 1,
1.251749, 0.008497777, 1.562431, 1, 0, 0, 1, 1,
1.255733, -0.4555281, 2.20574, 1, 0, 0, 1, 1,
1.260162, -0.8867955, 2.985524, 0, 0, 0, 1, 1,
1.264641, -0.8083487, 1.556766, 0, 0, 0, 1, 1,
1.265492, 0.630081, 1.269867, 0, 0, 0, 1, 1,
1.27724, -1.77722, 3.485251, 0, 0, 0, 1, 1,
1.282794, -0.1570354, 2.956, 0, 0, 0, 1, 1,
1.287229, -0.4630394, 2.871395, 0, 0, 0, 1, 1,
1.297967, 1.474911, 1.771413, 0, 0, 0, 1, 1,
1.306712, -0.7255219, 0.8739287, 1, 1, 1, 1, 1,
1.309922, 0.9938395, 0.4069818, 1, 1, 1, 1, 1,
1.310892, -1.439129, 2.099387, 1, 1, 1, 1, 1,
1.315274, -0.7499332, 2.226414, 1, 1, 1, 1, 1,
1.317226, 0.05964763, 2.320461, 1, 1, 1, 1, 1,
1.325857, -1.411041, 3.044508, 1, 1, 1, 1, 1,
1.352182, 1.968798, -0.3555563, 1, 1, 1, 1, 1,
1.353284, -1.492631, 2.246967, 1, 1, 1, 1, 1,
1.362072, 0.8516818, 1.419283, 1, 1, 1, 1, 1,
1.363571, 0.5395586, 1.049496, 1, 1, 1, 1, 1,
1.367436, -0.5515147, 0.5763299, 1, 1, 1, 1, 1,
1.368225, -0.8554697, 1.282204, 1, 1, 1, 1, 1,
1.40228, -0.3416654, 3.040064, 1, 1, 1, 1, 1,
1.410388, 0.556917, 0.5174692, 1, 1, 1, 1, 1,
1.414536, 1.150231, -0.2222766, 1, 1, 1, 1, 1,
1.422423, -1.143775, 2.692944, 0, 0, 1, 1, 1,
1.422766, -0.2239522, 0.7010043, 1, 0, 0, 1, 1,
1.425397, -1.889475, 2.101093, 1, 0, 0, 1, 1,
1.429726, -1.252889, 2.899509, 1, 0, 0, 1, 1,
1.441059, 0.7545431, 2.620388, 1, 0, 0, 1, 1,
1.453981, -0.489981, 0.2445651, 1, 0, 0, 1, 1,
1.479849, 0.3475862, 0.1104563, 0, 0, 0, 1, 1,
1.481029, 0.1701015, 1.839013, 0, 0, 0, 1, 1,
1.493229, 2.980181, -0.1070979, 0, 0, 0, 1, 1,
1.500747, 2.014122, -0.2417894, 0, 0, 0, 1, 1,
1.50496, 0.07316902, 1.645828, 0, 0, 0, 1, 1,
1.517446, -1.518563, 3.432824, 0, 0, 0, 1, 1,
1.51956, 1.118578, -0.1363061, 0, 0, 0, 1, 1,
1.51976, 0.7060323, 2.934698, 1, 1, 1, 1, 1,
1.530558, -1.381793, 2.781541, 1, 1, 1, 1, 1,
1.537043, -1.396622, 2.081774, 1, 1, 1, 1, 1,
1.539891, -0.2253253, 1.865711, 1, 1, 1, 1, 1,
1.554103, -0.75386, -1.550412, 1, 1, 1, 1, 1,
1.563215, 0.3219764, -0.1274444, 1, 1, 1, 1, 1,
1.566918, -1.58944, 2.631382, 1, 1, 1, 1, 1,
1.570993, -0.8008854, 2.479042, 1, 1, 1, 1, 1,
1.609521, 0.02449653, 3.181171, 1, 1, 1, 1, 1,
1.620457, -0.01116082, -1.384721, 1, 1, 1, 1, 1,
1.622224, 1.870973, 1.432422, 1, 1, 1, 1, 1,
1.624208, 0.8996432, 0.2439439, 1, 1, 1, 1, 1,
1.633393, 2.163764, 0.4948046, 1, 1, 1, 1, 1,
1.641087, 0.6331093, 0.6551135, 1, 1, 1, 1, 1,
1.646615, 1.19072, 2.589948, 1, 1, 1, 1, 1,
1.680875, 1.837601, 0.7904053, 0, 0, 1, 1, 1,
1.681231, 1.516108, 1.155055, 1, 0, 0, 1, 1,
1.708583, -0.89385, 2.794087, 1, 0, 0, 1, 1,
1.726562, 0.3106506, 2.648892, 1, 0, 0, 1, 1,
1.738754, -0.4532882, 2.420434, 1, 0, 0, 1, 1,
1.740482, 0.09277165, 3.896667, 1, 0, 0, 1, 1,
1.743837, 0.6880023, 0.9941775, 0, 0, 0, 1, 1,
1.755446, -0.2717719, 1.586106, 0, 0, 0, 1, 1,
1.768435, 0.7399328, 0.9579666, 0, 0, 0, 1, 1,
1.793678, -1.672891, 2.329519, 0, 0, 0, 1, 1,
1.817903, -0.2400551, -0.07377948, 0, 0, 0, 1, 1,
1.829826, 0.5195391, 2.046443, 0, 0, 0, 1, 1,
1.850892, -1.319982, 2.368689, 0, 0, 0, 1, 1,
1.851399, 1.174789, 1.82687, 1, 1, 1, 1, 1,
1.851954, -0.151099, 3.647029, 1, 1, 1, 1, 1,
1.853166, 0.5742175, 1.176495, 1, 1, 1, 1, 1,
1.857494, -1.017986, 1.150204, 1, 1, 1, 1, 1,
1.87202, -0.7687165, 1.482614, 1, 1, 1, 1, 1,
1.872088, 0.4300351, 0.02556595, 1, 1, 1, 1, 1,
1.872406, 0.5962108, 1.955, 1, 1, 1, 1, 1,
1.875702, -0.535648, 0.3744394, 1, 1, 1, 1, 1,
1.891542, 0.3653452, -0.02152558, 1, 1, 1, 1, 1,
1.920282, -1.433528, 2.173596, 1, 1, 1, 1, 1,
1.922574, -0.7410328, 0.9748729, 1, 1, 1, 1, 1,
1.933795, 0.1877517, 0.9039501, 1, 1, 1, 1, 1,
1.937063, 1.160092, 0.974503, 1, 1, 1, 1, 1,
1.945745, -0.2586212, 3.683633, 1, 1, 1, 1, 1,
1.956511, -0.2754547, 0.5668507, 1, 1, 1, 1, 1,
1.987967, 1.383691, 1.134403, 0, 0, 1, 1, 1,
2.000321, 1.776367, 1.030099, 1, 0, 0, 1, 1,
2.00685, 0.2638296, 2.12478, 1, 0, 0, 1, 1,
2.03067, 0.371333, 2.252553, 1, 0, 0, 1, 1,
2.043097, -0.1477092, 2.956459, 1, 0, 0, 1, 1,
2.05602, -0.698321, 0.2105403, 1, 0, 0, 1, 1,
2.079237, 1.651982, 0.6467977, 0, 0, 0, 1, 1,
2.095439, 0.9960652, -0.04177357, 0, 0, 0, 1, 1,
2.100336, -1.599082, 1.211036, 0, 0, 0, 1, 1,
2.182042, 0.02134431, 1.513404, 0, 0, 0, 1, 1,
2.217234, -1.653015, 1.66741, 0, 0, 0, 1, 1,
2.224766, 1.796924, 0.6410131, 0, 0, 0, 1, 1,
2.260138, -0.5774394, 1.026405, 0, 0, 0, 1, 1,
2.269074, 1.54301, 1.384429, 1, 1, 1, 1, 1,
2.509859, -0.03940782, 2.336232, 1, 1, 1, 1, 1,
2.637177, 2.131551, 3.217575, 1, 1, 1, 1, 1,
2.738959, 0.7193598, 1.602031, 1, 1, 1, 1, 1,
2.740673, -0.08173637, 2.276024, 1, 1, 1, 1, 1,
3.083993, -1.518574, 2.810995, 1, 1, 1, 1, 1,
3.090536, -0.5548393, -1.296638, 1, 1, 1, 1, 1
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
var radius = 9.866155;
var distance = 34.65445;
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
mvMatrix.translate( 0.007791042, -0.2810894, 0.0178802 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.65445);
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
