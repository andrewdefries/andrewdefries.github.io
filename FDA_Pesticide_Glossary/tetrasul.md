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
-2.774846, -1.363603, -1.257762, 1, 0, 0, 1,
-2.456295, 1.616161, -1.987726, 1, 0.007843138, 0, 1,
-2.384292, 0.1791936, -1.921586, 1, 0.01176471, 0, 1,
-2.360928, 0.2515651, -1.522511, 1, 0.01960784, 0, 1,
-2.337501, -0.3025599, -3.054086, 1, 0.02352941, 0, 1,
-2.269363, 2.228168, -2.308841, 1, 0.03137255, 0, 1,
-2.246496, 1.563326, -1.924697, 1, 0.03529412, 0, 1,
-2.196151, 0.4189854, -1.800563, 1, 0.04313726, 0, 1,
-2.152841, 0.1235389, -0.1807895, 1, 0.04705882, 0, 1,
-2.1187, -0.3302434, -2.599491, 1, 0.05490196, 0, 1,
-2.106971, 0.7606064, -3.295937, 1, 0.05882353, 0, 1,
-2.049983, 0.1966438, -2.250757, 1, 0.06666667, 0, 1,
-1.993898, 1.481289, -3.774704, 1, 0.07058824, 0, 1,
-1.991503, -0.4840338, -2.278559, 1, 0.07843138, 0, 1,
-1.984005, -0.3683859, -2.23572, 1, 0.08235294, 0, 1,
-1.971316, 0.6111772, -0.07586969, 1, 0.09019608, 0, 1,
-1.966241, -0.7019563, -1.052926, 1, 0.09411765, 0, 1,
-1.955426, 0.4689389, -2.001212, 1, 0.1019608, 0, 1,
-1.951603, 1.372615, -0.1242017, 1, 0.1098039, 0, 1,
-1.920492, 1.756976, -0.2872194, 1, 0.1137255, 0, 1,
-1.901435, 0.5021638, -0.7554327, 1, 0.1215686, 0, 1,
-1.896415, -0.1035592, -2.485743, 1, 0.1254902, 0, 1,
-1.895288, 1.118073, -0.7263203, 1, 0.1333333, 0, 1,
-1.891545, 0.4197946, -0.8135344, 1, 0.1372549, 0, 1,
-1.867478, -0.5430773, -1.965812, 1, 0.145098, 0, 1,
-1.855629, -0.7701486, -3.141927, 1, 0.1490196, 0, 1,
-1.823541, 0.4886546, -3.667744, 1, 0.1568628, 0, 1,
-1.785171, 0.531501, -3.256564, 1, 0.1607843, 0, 1,
-1.773349, -0.4054138, -1.454624, 1, 0.1686275, 0, 1,
-1.758888, -0.3139251, -0.5680212, 1, 0.172549, 0, 1,
-1.757324, 1.771702, -1.15149, 1, 0.1803922, 0, 1,
-1.747635, 0.1009229, -0.5230262, 1, 0.1843137, 0, 1,
-1.745295, -0.05056671, -1.929612, 1, 0.1921569, 0, 1,
-1.708512, 0.5170023, -0.9502482, 1, 0.1960784, 0, 1,
-1.702764, 0.577719, -2.072034, 1, 0.2039216, 0, 1,
-1.695372, 1.033562, -0.8945521, 1, 0.2117647, 0, 1,
-1.686558, -1.36551, -1.798218, 1, 0.2156863, 0, 1,
-1.686282, -0.03062697, -0.5947986, 1, 0.2235294, 0, 1,
-1.683913, -0.3748753, -1.385337, 1, 0.227451, 0, 1,
-1.668892, -1.921838, -2.713266, 1, 0.2352941, 0, 1,
-1.635159, -0.8413103, -2.387242, 1, 0.2392157, 0, 1,
-1.616625, -0.351965, -0.7740264, 1, 0.2470588, 0, 1,
-1.607212, -1.147493, -1.77137, 1, 0.2509804, 0, 1,
-1.597769, -1.059941, -3.010057, 1, 0.2588235, 0, 1,
-1.556543, -1.848815, -3.098465, 1, 0.2627451, 0, 1,
-1.553219, 0.6128948, -2.799545, 1, 0.2705882, 0, 1,
-1.551701, -0.2095434, -1.507932, 1, 0.2745098, 0, 1,
-1.54848, -0.7201543, -3.121909, 1, 0.282353, 0, 1,
-1.526043, 0.4882801, -0.7936123, 1, 0.2862745, 0, 1,
-1.52402, -0.6682574, 0.2112147, 1, 0.2941177, 0, 1,
-1.506288, -0.5952475, -1.045455, 1, 0.3019608, 0, 1,
-1.504782, 0.8698347, -0.5578774, 1, 0.3058824, 0, 1,
-1.493809, -0.6298696, -1.457551, 1, 0.3137255, 0, 1,
-1.482107, -0.8409402, -3.768034, 1, 0.3176471, 0, 1,
-1.468854, -1.208429, -2.729456, 1, 0.3254902, 0, 1,
-1.46856, -2.623672, -2.572631, 1, 0.3294118, 0, 1,
-1.463176, -0.9535819, -1.961087, 1, 0.3372549, 0, 1,
-1.462468, -0.09249687, -0.3611682, 1, 0.3411765, 0, 1,
-1.454756, 1.421804, -0.8918392, 1, 0.3490196, 0, 1,
-1.448733, -0.7476749, -2.423934, 1, 0.3529412, 0, 1,
-1.444883, -0.9741861, -0.5365512, 1, 0.3607843, 0, 1,
-1.438051, 0.7463804, -2.628498, 1, 0.3647059, 0, 1,
-1.43795, -0.3184691, -2.08458, 1, 0.372549, 0, 1,
-1.436958, -0.4020794, -2.727322, 1, 0.3764706, 0, 1,
-1.436398, -0.06281988, -2.436685, 1, 0.3843137, 0, 1,
-1.428091, -0.3682234, -2.045617, 1, 0.3882353, 0, 1,
-1.413921, -1.431306, -3.855574, 1, 0.3960784, 0, 1,
-1.407982, 0.378941, -1.842263, 1, 0.4039216, 0, 1,
-1.404385, 0.2248065, -2.195812, 1, 0.4078431, 0, 1,
-1.400996, 0.892108, -1.544654, 1, 0.4156863, 0, 1,
-1.394358, -1.239671, -0.4788933, 1, 0.4196078, 0, 1,
-1.392171, -0.4308994, -3.21402, 1, 0.427451, 0, 1,
-1.390509, 0.5828285, -0.7185477, 1, 0.4313726, 0, 1,
-1.385022, 0.8749874, -0.09721463, 1, 0.4392157, 0, 1,
-1.380388, 1.451392, -0.491781, 1, 0.4431373, 0, 1,
-1.369285, -0.1827297, -1.143643, 1, 0.4509804, 0, 1,
-1.350889, -0.8300517, -0.3102976, 1, 0.454902, 0, 1,
-1.350748, 0.4818186, -1.841003, 1, 0.4627451, 0, 1,
-1.347679, 0.6962327, -1.253543, 1, 0.4666667, 0, 1,
-1.32355, 1.582416, -0.2395621, 1, 0.4745098, 0, 1,
-1.323125, -0.01664154, -1.546197, 1, 0.4784314, 0, 1,
-1.321314, -0.1845848, -3.094323, 1, 0.4862745, 0, 1,
-1.320549, 0.006020899, -2.615551, 1, 0.4901961, 0, 1,
-1.319317, -0.1387465, -2.200196, 1, 0.4980392, 0, 1,
-1.316141, -0.6710806, -2.124904, 1, 0.5058824, 0, 1,
-1.305381, -0.3447549, -1.991941, 1, 0.509804, 0, 1,
-1.302264, -0.1056362, -2.568768, 1, 0.5176471, 0, 1,
-1.296311, 0.7164528, -2.518981, 1, 0.5215687, 0, 1,
-1.293723, 0.1635644, -2.355573, 1, 0.5294118, 0, 1,
-1.290492, 0.8244034, -2.553715, 1, 0.5333334, 0, 1,
-1.288091, 0.04083209, -1.083267, 1, 0.5411765, 0, 1,
-1.280845, 1.174406, 0.3905114, 1, 0.5450981, 0, 1,
-1.263058, 0.6992307, -0.6448603, 1, 0.5529412, 0, 1,
-1.262881, -0.6135828, -3.409157, 1, 0.5568628, 0, 1,
-1.255953, 1.448645, -0.9251785, 1, 0.5647059, 0, 1,
-1.255188, 0.2346515, -1.486249, 1, 0.5686275, 0, 1,
-1.251016, -0.228914, -1.82518, 1, 0.5764706, 0, 1,
-1.249566, -0.5817059, -1.156309, 1, 0.5803922, 0, 1,
-1.248962, -2.732609, -2.581501, 1, 0.5882353, 0, 1,
-1.240103, -1.00894, -2.17657, 1, 0.5921569, 0, 1,
-1.237907, -0.2395352, -3.214005, 1, 0.6, 0, 1,
-1.233502, -0.3718273, -2.52297, 1, 0.6078432, 0, 1,
-1.222348, 1.137113, -1.638833, 1, 0.6117647, 0, 1,
-1.222241, 0.9817299, -0.9863521, 1, 0.6196079, 0, 1,
-1.220029, 0.5104625, -2.352893, 1, 0.6235294, 0, 1,
-1.215552, -0.330474, -2.540169, 1, 0.6313726, 0, 1,
-1.212138, 0.2257615, -0.6386455, 1, 0.6352941, 0, 1,
-1.212073, 0.3373864, 1.88478, 1, 0.6431373, 0, 1,
-1.211777, 1.020454, 0.09814699, 1, 0.6470588, 0, 1,
-1.209863, -1.763335, -2.674777, 1, 0.654902, 0, 1,
-1.197126, 0.2425612, -0.1304903, 1, 0.6588235, 0, 1,
-1.190033, -0.3229257, 0.3672927, 1, 0.6666667, 0, 1,
-1.187961, -0.7696226, -1.501068, 1, 0.6705883, 0, 1,
-1.177068, -1.984886, -2.879593, 1, 0.6784314, 0, 1,
-1.17353, 0.7815767, 0.07991723, 1, 0.682353, 0, 1,
-1.161534, 0.5077176, -1.98721, 1, 0.6901961, 0, 1,
-1.15616, 1.349392, -0.5048744, 1, 0.6941177, 0, 1,
-1.153571, -0.5158466, -3.764098, 1, 0.7019608, 0, 1,
-1.14748, 1.972201, -1.284807, 1, 0.7098039, 0, 1,
-1.146546, -0.4528033, -0.9115553, 1, 0.7137255, 0, 1,
-1.140999, 0.6438425, -1.114788, 1, 0.7215686, 0, 1,
-1.140432, -0.495213, -0.4976206, 1, 0.7254902, 0, 1,
-1.129759, -0.2375808, -0.8112863, 1, 0.7333333, 0, 1,
-1.123083, 0.456132, -2.607243, 1, 0.7372549, 0, 1,
-1.121371, 0.5756009, -2.678896, 1, 0.7450981, 0, 1,
-1.120283, 0.679441, 0.7426038, 1, 0.7490196, 0, 1,
-1.101582, -0.5299342, -2.216604, 1, 0.7568628, 0, 1,
-1.099287, -0.3270604, -2.442571, 1, 0.7607843, 0, 1,
-1.093413, -1.691346, -2.861718, 1, 0.7686275, 0, 1,
-1.092679, 0.01478044, -1.578379, 1, 0.772549, 0, 1,
-1.091203, -1.859001, -4.582204, 1, 0.7803922, 0, 1,
-1.090355, -0.6821271, -2.284689, 1, 0.7843137, 0, 1,
-1.08034, 0.931605, -2.986287, 1, 0.7921569, 0, 1,
-1.072516, 0.3913061, -0.1227304, 1, 0.7960784, 0, 1,
-1.064484, 0.8455574, -1.916395, 1, 0.8039216, 0, 1,
-1.062284, -0.2223869, -1.33749, 1, 0.8117647, 0, 1,
-1.060549, -0.4346808, -0.7792773, 1, 0.8156863, 0, 1,
-1.058802, 1.455689, -0.3334294, 1, 0.8235294, 0, 1,
-1.057806, -0.8545834, -1.196037, 1, 0.827451, 0, 1,
-1.055322, -0.3224435, -2.984051, 1, 0.8352941, 0, 1,
-1.050516, 0.6814476, -1.093094, 1, 0.8392157, 0, 1,
-1.040981, -1.716558, -2.933471, 1, 0.8470588, 0, 1,
-1.036792, 0.4241555, -0.9504542, 1, 0.8509804, 0, 1,
-1.032272, 0.7133192, -0.7083218, 1, 0.8588235, 0, 1,
-1.031325, -1.141664, -2.599542, 1, 0.8627451, 0, 1,
-1.030921, 0.7094007, -0.4631826, 1, 0.8705882, 0, 1,
-1.030544, 0.6473193, -2.301244, 1, 0.8745098, 0, 1,
-1.025123, 0.5726112, 1.045847, 1, 0.8823529, 0, 1,
-1.025056, 0.3399847, -0.06541879, 1, 0.8862745, 0, 1,
-1.019669, -1.028108, -1.741024, 1, 0.8941177, 0, 1,
-1.019328, -1.014974, -1.335414, 1, 0.8980392, 0, 1,
-1.019081, 2.557662, -0.3250721, 1, 0.9058824, 0, 1,
-1.013234, -0.3514369, -2.458599, 1, 0.9137255, 0, 1,
-1.012344, -1.490804, -2.555253, 1, 0.9176471, 0, 1,
-1.009901, 0.1755258, -1.697734, 1, 0.9254902, 0, 1,
-1.003483, -1.198065, 0.0135229, 1, 0.9294118, 0, 1,
-1.002446, 0.1033537, -1.389213, 1, 0.9372549, 0, 1,
-0.9988943, -0.03871141, -3.485155, 1, 0.9411765, 0, 1,
-0.9914205, -1.18448, -4.736826, 1, 0.9490196, 0, 1,
-0.9718823, 0.8233433, -1.358179, 1, 0.9529412, 0, 1,
-0.9682396, 1.04138, -2.206117, 1, 0.9607843, 0, 1,
-0.9535961, 0.70625, -1.201538, 1, 0.9647059, 0, 1,
-0.9498603, 0.7449781, -1.772671, 1, 0.972549, 0, 1,
-0.942071, -0.7945033, -3.871424, 1, 0.9764706, 0, 1,
-0.9419679, 0.528547, -0.2400675, 1, 0.9843137, 0, 1,
-0.9396002, 0.2206794, -0.7694561, 1, 0.9882353, 0, 1,
-0.9276803, -0.4166974, -3.261034, 1, 0.9960784, 0, 1,
-0.9200374, -1.320392, -1.851409, 0.9960784, 1, 0, 1,
-0.918363, 0.331439, -0.2587315, 0.9921569, 1, 0, 1,
-0.917944, 1.410189, 0.3661286, 0.9843137, 1, 0, 1,
-0.9144363, 1.014712, -0.9995002, 0.9803922, 1, 0, 1,
-0.9116796, 1.111017, -0.433176, 0.972549, 1, 0, 1,
-0.9099421, -0.5837986, -2.820997, 0.9686275, 1, 0, 1,
-0.9085045, -0.2274282, -1.038273, 0.9607843, 1, 0, 1,
-0.904717, -1.265334, -1.645456, 0.9568627, 1, 0, 1,
-0.8994207, -0.1485859, 0.9408948, 0.9490196, 1, 0, 1,
-0.8841909, 2.303705, -0.5779542, 0.945098, 1, 0, 1,
-0.880057, 0.02541283, -1.238975, 0.9372549, 1, 0, 1,
-0.8756879, 0.8602868, 0.4200317, 0.9333333, 1, 0, 1,
-0.8720778, -0.3372855, -1.678169, 0.9254902, 1, 0, 1,
-0.8714784, 0.5504228, -1.508871, 0.9215686, 1, 0, 1,
-0.8653194, 0.8914936, -1.178941, 0.9137255, 1, 0, 1,
-0.8550825, -0.742573, -1.031627, 0.9098039, 1, 0, 1,
-0.8535944, -0.9104164, -2.501462, 0.9019608, 1, 0, 1,
-0.848767, -2.457327, -4.099934, 0.8941177, 1, 0, 1,
-0.847542, 0.9318726, -0.1345438, 0.8901961, 1, 0, 1,
-0.8470892, -0.241562, -0.3150342, 0.8823529, 1, 0, 1,
-0.8444765, -0.8382205, -4.828331, 0.8784314, 1, 0, 1,
-0.8428647, 0.8098374, -3.167663, 0.8705882, 1, 0, 1,
-0.8414447, 0.7176992, 0.3743268, 0.8666667, 1, 0, 1,
-0.8384452, -0.5121475, -1.527051, 0.8588235, 1, 0, 1,
-0.8379717, -1.145715, -2.04084, 0.854902, 1, 0, 1,
-0.8309225, -0.5367886, -3.981838, 0.8470588, 1, 0, 1,
-0.8285933, 1.624558, -1.476432, 0.8431373, 1, 0, 1,
-0.8283207, 1.444981, -0.6431994, 0.8352941, 1, 0, 1,
-0.8260175, 0.09102309, -2.293811, 0.8313726, 1, 0, 1,
-0.8181192, 2.168917, -0.7646924, 0.8235294, 1, 0, 1,
-0.8142852, -1.217371, -1.832771, 0.8196079, 1, 0, 1,
-0.8090233, -1.361191, -1.963426, 0.8117647, 1, 0, 1,
-0.8077019, 1.239557, -0.9719533, 0.8078431, 1, 0, 1,
-0.8072742, -0.6868091, 0.1227555, 0.8, 1, 0, 1,
-0.8071337, -0.4873708, -2.791918, 0.7921569, 1, 0, 1,
-0.8048944, -1.609123, -1.034809, 0.7882353, 1, 0, 1,
-0.8025616, 0.5798306, -1.078352, 0.7803922, 1, 0, 1,
-0.7972193, 0.2895946, -0.6799469, 0.7764706, 1, 0, 1,
-0.7950538, 1.13707, -0.6765615, 0.7686275, 1, 0, 1,
-0.7944177, 0.4141701, 0.129642, 0.7647059, 1, 0, 1,
-0.7930336, -1.620153, -1.560672, 0.7568628, 1, 0, 1,
-0.7928066, -1.541286, -2.027228, 0.7529412, 1, 0, 1,
-0.7890345, 0.4953701, -0.4071368, 0.7450981, 1, 0, 1,
-0.7843418, -0.55633, -3.771384, 0.7411765, 1, 0, 1,
-0.7698383, 0.9044501, -0.8460826, 0.7333333, 1, 0, 1,
-0.7654774, -0.7721974, -2.740182, 0.7294118, 1, 0, 1,
-0.7647466, 1.601773, 0.4583707, 0.7215686, 1, 0, 1,
-0.7595186, -0.08404633, -2.299619, 0.7176471, 1, 0, 1,
-0.7594436, 0.8221573, -1.092287, 0.7098039, 1, 0, 1,
-0.7555645, -0.8792217, -3.730652, 0.7058824, 1, 0, 1,
-0.7548209, 0.6244726, -0.3502055, 0.6980392, 1, 0, 1,
-0.7484535, 0.6479961, 0.1184861, 0.6901961, 1, 0, 1,
-0.7454246, -0.6232616, -2.356204, 0.6862745, 1, 0, 1,
-0.7438722, -0.2889524, -1.901446, 0.6784314, 1, 0, 1,
-0.7429, -1.237209, -2.885229, 0.6745098, 1, 0, 1,
-0.7377902, -0.5092627, -1.618202, 0.6666667, 1, 0, 1,
-0.7370266, -0.109736, -0.07378332, 0.6627451, 1, 0, 1,
-0.73589, 0.4739521, -1.536787, 0.654902, 1, 0, 1,
-0.7354974, -0.3255921, -3.083146, 0.6509804, 1, 0, 1,
-0.7342697, -0.8763912, 0.07757138, 0.6431373, 1, 0, 1,
-0.7331051, -1.342841, -1.465477, 0.6392157, 1, 0, 1,
-0.7302444, -0.1191522, -0.8236715, 0.6313726, 1, 0, 1,
-0.7299707, -0.0722345, -1.610853, 0.627451, 1, 0, 1,
-0.7294742, 0.1812043, -0.9751738, 0.6196079, 1, 0, 1,
-0.7286325, 1.001487, 0.1882243, 0.6156863, 1, 0, 1,
-0.713771, 1.084084, -0.300022, 0.6078432, 1, 0, 1,
-0.7116143, -0.3387317, -1.032791, 0.6039216, 1, 0, 1,
-0.7096049, -2.279579, -2.697404, 0.5960785, 1, 0, 1,
-0.7077324, 0.5770392, -2.31249, 0.5882353, 1, 0, 1,
-0.7059187, 0.2113363, -0.551461, 0.5843138, 1, 0, 1,
-0.7054134, -0.006737166, -0.6355021, 0.5764706, 1, 0, 1,
-0.7026671, -1.023782, -1.789928, 0.572549, 1, 0, 1,
-0.7025034, -0.707657, -1.208114, 0.5647059, 1, 0, 1,
-0.6997764, 0.3146136, -0.6525267, 0.5607843, 1, 0, 1,
-0.6898158, 0.121261, -2.164396, 0.5529412, 1, 0, 1,
-0.6820182, -2.863135, -1.682816, 0.5490196, 1, 0, 1,
-0.6735409, -1.25003, -2.185803, 0.5411765, 1, 0, 1,
-0.6716668, -0.3174729, -1.356298, 0.5372549, 1, 0, 1,
-0.6713213, -0.1066674, -2.063798, 0.5294118, 1, 0, 1,
-0.6676331, 0.2373411, -1.552, 0.5254902, 1, 0, 1,
-0.6625721, 1.185449, 0.4054717, 0.5176471, 1, 0, 1,
-0.6553742, 2.186398, 1.222657, 0.5137255, 1, 0, 1,
-0.6508541, 0.2496777, -2.37385, 0.5058824, 1, 0, 1,
-0.6498026, -0.2572235, -2.76539, 0.5019608, 1, 0, 1,
-0.6476041, 0.8882483, -0.9712045, 0.4941176, 1, 0, 1,
-0.6459488, -0.1671091, -2.223152, 0.4862745, 1, 0, 1,
-0.638344, -1.704665, -4.959471, 0.4823529, 1, 0, 1,
-0.637508, -2.08546, -5.034435, 0.4745098, 1, 0, 1,
-0.6256812, -0.7495541, -2.415199, 0.4705882, 1, 0, 1,
-0.6165186, -1.860499, -4.124189, 0.4627451, 1, 0, 1,
-0.6136149, -0.116024, -0.4494562, 0.4588235, 1, 0, 1,
-0.6124699, 0.8685724, -0.3677877, 0.4509804, 1, 0, 1,
-0.6068665, -1.050169, -2.074169, 0.4470588, 1, 0, 1,
-0.6062086, 0.7647428, 0.5237541, 0.4392157, 1, 0, 1,
-0.6040114, 0.359853, -2.391192, 0.4352941, 1, 0, 1,
-0.6014631, -0.3793485, -0.3501946, 0.427451, 1, 0, 1,
-0.5941077, -1.078812, -3.560989, 0.4235294, 1, 0, 1,
-0.5856634, 2.303852, -2.46244, 0.4156863, 1, 0, 1,
-0.5855139, 1.06101, -0.7087715, 0.4117647, 1, 0, 1,
-0.5852515, 0.9906231, -1.943979, 0.4039216, 1, 0, 1,
-0.5845401, 0.481123, -0.5557879, 0.3960784, 1, 0, 1,
-0.5840104, 0.878436, -1.185016, 0.3921569, 1, 0, 1,
-0.581389, 0.8933454, 0.4508602, 0.3843137, 1, 0, 1,
-0.5799515, -0.2934356, -4.614957, 0.3803922, 1, 0, 1,
-0.5791422, 0.8374884, -1.958329, 0.372549, 1, 0, 1,
-0.5751854, -0.6180694, -1.491636, 0.3686275, 1, 0, 1,
-0.5686306, 0.111701, -0.4215162, 0.3607843, 1, 0, 1,
-0.5671036, 1.073535, -0.5837255, 0.3568628, 1, 0, 1,
-0.5652471, -1.045869, -2.009779, 0.3490196, 1, 0, 1,
-0.5645803, 0.05066374, -0.6830645, 0.345098, 1, 0, 1,
-0.5616125, 1.734241, 0.09130224, 0.3372549, 1, 0, 1,
-0.5595651, 0.7230352, -0.7994258, 0.3333333, 1, 0, 1,
-0.5595054, 1.354994, -1.023057, 0.3254902, 1, 0, 1,
-0.5546528, -1.5373, -3.591332, 0.3215686, 1, 0, 1,
-0.5517129, -0.1529524, -2.061974, 0.3137255, 1, 0, 1,
-0.5493934, 0.9754276, -1.204792, 0.3098039, 1, 0, 1,
-0.5484381, 0.8525493, -0.7608098, 0.3019608, 1, 0, 1,
-0.5476257, -0.8088652, -2.555272, 0.2941177, 1, 0, 1,
-0.5440282, 0.4006424, -1.621457, 0.2901961, 1, 0, 1,
-0.5380087, 0.4127036, -0.6445271, 0.282353, 1, 0, 1,
-0.5366268, -1.534154, -0.4913166, 0.2784314, 1, 0, 1,
-0.5356815, 0.5307943, -0.03626268, 0.2705882, 1, 0, 1,
-0.5311882, -0.9474124, -1.874184, 0.2666667, 1, 0, 1,
-0.5298511, -0.321621, -1.554834, 0.2588235, 1, 0, 1,
-0.523977, 1.326729, -2.407034, 0.254902, 1, 0, 1,
-0.5207182, 0.2562087, -0.8226861, 0.2470588, 1, 0, 1,
-0.5206504, -2.249762, -2.908569, 0.2431373, 1, 0, 1,
-0.5097901, 0.03963957, -0.7988518, 0.2352941, 1, 0, 1,
-0.5090801, -0.5709479, -1.11051, 0.2313726, 1, 0, 1,
-0.5053717, -0.1682484, -2.416626, 0.2235294, 1, 0, 1,
-0.5050572, 0.383311, -1.482846, 0.2196078, 1, 0, 1,
-0.5043905, 0.4066847, -0.5959579, 0.2117647, 1, 0, 1,
-0.5035999, -0.4477879, -1.69418, 0.2078431, 1, 0, 1,
-0.5006919, -1.252492, -2.673291, 0.2, 1, 0, 1,
-0.4937817, 0.07658157, -0.663295, 0.1921569, 1, 0, 1,
-0.490739, -1.257145, -3.353312, 0.1882353, 1, 0, 1,
-0.4902336, 1.547301, 1.407343, 0.1803922, 1, 0, 1,
-0.4857602, -0.7482831, -2.085549, 0.1764706, 1, 0, 1,
-0.4834327, 0.685056, -1.75162, 0.1686275, 1, 0, 1,
-0.4823353, 0.8565314, 0.6477795, 0.1647059, 1, 0, 1,
-0.4739831, -0.5674204, -3.062186, 0.1568628, 1, 0, 1,
-0.467987, -1.337587, -1.639397, 0.1529412, 1, 0, 1,
-0.4676602, 1.843132, -0.7560433, 0.145098, 1, 0, 1,
-0.4670139, 0.7945277, -0.7388402, 0.1411765, 1, 0, 1,
-0.4634214, 1.843982, -0.7100363, 0.1333333, 1, 0, 1,
-0.463213, 0.8417462, -0.4927858, 0.1294118, 1, 0, 1,
-0.4626817, -0.4062278, -4.72043, 0.1215686, 1, 0, 1,
-0.4616193, 0.3231241, -2.757112, 0.1176471, 1, 0, 1,
-0.4607295, 0.1695155, 0.1329797, 0.1098039, 1, 0, 1,
-0.4568842, -1.600843, -2.211683, 0.1058824, 1, 0, 1,
-0.4567007, -1.049391, -2.827003, 0.09803922, 1, 0, 1,
-0.4565789, -0.9895973, -1.40317, 0.09019608, 1, 0, 1,
-0.4429866, 0.635564, -1.186728, 0.08627451, 1, 0, 1,
-0.4345768, -1.391006, -3.498553, 0.07843138, 1, 0, 1,
-0.4343143, 2.948929, 1.183405, 0.07450981, 1, 0, 1,
-0.4333377, 2.686629, -0.6142359, 0.06666667, 1, 0, 1,
-0.4274108, 0.109664, 0.1651349, 0.0627451, 1, 0, 1,
-0.4247212, -0.5845055, -3.915313, 0.05490196, 1, 0, 1,
-0.4233344, -0.8575093, -3.113356, 0.05098039, 1, 0, 1,
-0.4202339, 1.008599, -0.3765306, 0.04313726, 1, 0, 1,
-0.4126838, -0.348212, -4.03617, 0.03921569, 1, 0, 1,
-0.4089698, -0.5504552, -3.360403, 0.03137255, 1, 0, 1,
-0.4071305, 0.6784192, 0.4478505, 0.02745098, 1, 0, 1,
-0.4025707, -1.447755, -2.504557, 0.01960784, 1, 0, 1,
-0.4023836, -0.6478621, -3.392679, 0.01568628, 1, 0, 1,
-0.4011173, 1.121534, 0.3636836, 0.007843138, 1, 0, 1,
-0.3917004, -0.09567503, -0.3422561, 0.003921569, 1, 0, 1,
-0.384394, -0.04093989, -0.2603039, 0, 1, 0.003921569, 1,
-0.383757, -0.3742437, -2.55992, 0, 1, 0.01176471, 1,
-0.3796505, -1.162391, -2.678066, 0, 1, 0.01568628, 1,
-0.372021, 0.04326378, -1.634204, 0, 1, 0.02352941, 1,
-0.3645952, 0.1058672, -1.501821, 0, 1, 0.02745098, 1,
-0.3573807, -0.3539786, -2.029204, 0, 1, 0.03529412, 1,
-0.3569311, 0.3702606, -0.8077427, 0, 1, 0.03921569, 1,
-0.3522782, -0.2277011, -2.178178, 0, 1, 0.04705882, 1,
-0.3516124, -0.355854, -2.643571, 0, 1, 0.05098039, 1,
-0.3513772, 0.1142122, -0.4859517, 0, 1, 0.05882353, 1,
-0.3508438, -1.56495, -2.198556, 0, 1, 0.0627451, 1,
-0.3499503, 0.1358861, -1.99736, 0, 1, 0.07058824, 1,
-0.3454981, -0.1009505, -2.395207, 0, 1, 0.07450981, 1,
-0.3432516, -0.8675436, -3.324154, 0, 1, 0.08235294, 1,
-0.3430675, 0.6292982, -0.48207, 0, 1, 0.08627451, 1,
-0.3421041, 2.338281, 0.04168129, 0, 1, 0.09411765, 1,
-0.3419569, -1.279525, -2.740428, 0, 1, 0.1019608, 1,
-0.3418288, 0.05780255, -0.2160905, 0, 1, 0.1058824, 1,
-0.3412083, 1.004935, -3.367119, 0, 1, 0.1137255, 1,
-0.3331437, -0.8634313, -3.23533, 0, 1, 0.1176471, 1,
-0.3319769, 0.1055405, -0.8077408, 0, 1, 0.1254902, 1,
-0.3294087, 1.289293, 0.8956751, 0, 1, 0.1294118, 1,
-0.3224343, -0.05286871, -1.257561, 0, 1, 0.1372549, 1,
-0.3223379, -0.1655483, -2.41222, 0, 1, 0.1411765, 1,
-0.3197417, 0.579551, -0.6504165, 0, 1, 0.1490196, 1,
-0.3184279, -1.899863, -3.040064, 0, 1, 0.1529412, 1,
-0.3087727, 1.368759, 0.8506064, 0, 1, 0.1607843, 1,
-0.3053654, -0.8520986, -0.4088191, 0, 1, 0.1647059, 1,
-0.3043002, -0.04838661, -0.5793135, 0, 1, 0.172549, 1,
-0.2996564, 0.3266695, -0.2113438, 0, 1, 0.1764706, 1,
-0.2992613, 1.377006, 1.024809, 0, 1, 0.1843137, 1,
-0.2965896, -0.567894, -3.315572, 0, 1, 0.1882353, 1,
-0.2947752, -0.7368305, -2.101487, 0, 1, 0.1960784, 1,
-0.2887925, -0.1930066, -2.633552, 0, 1, 0.2039216, 1,
-0.2884273, -0.2040113, -2.378229, 0, 1, 0.2078431, 1,
-0.2862218, -0.6989048, -3.402781, 0, 1, 0.2156863, 1,
-0.2836507, 0.3980769, -0.9325829, 0, 1, 0.2196078, 1,
-0.2804412, -1.606702, -3.095985, 0, 1, 0.227451, 1,
-0.2771001, -0.4610852, -3.875849, 0, 1, 0.2313726, 1,
-0.2755661, 0.7586732, 0.05724691, 0, 1, 0.2392157, 1,
-0.268814, 0.5810431, -0.7685807, 0, 1, 0.2431373, 1,
-0.2649372, -0.4844333, -2.896491, 0, 1, 0.2509804, 1,
-0.2576427, -1.095751, -3.749344, 0, 1, 0.254902, 1,
-0.2553517, 1.480158, -0.721606, 0, 1, 0.2627451, 1,
-0.2527196, 1.404, 1.12925, 0, 1, 0.2666667, 1,
-0.2509373, 0.787591, -0.5699545, 0, 1, 0.2745098, 1,
-0.2492968, 0.6739021, -1.218004, 0, 1, 0.2784314, 1,
-0.240284, 0.4096993, -1.409222, 0, 1, 0.2862745, 1,
-0.2390483, -0.4515838, -4.190792, 0, 1, 0.2901961, 1,
-0.2380876, -0.4979979, -3.370719, 0, 1, 0.2980392, 1,
-0.2370372, -0.8360505, -5.634722, 0, 1, 0.3058824, 1,
-0.2318558, 0.8867427, -2.242474, 0, 1, 0.3098039, 1,
-0.2253429, 0.8102088, 0.0163293, 0, 1, 0.3176471, 1,
-0.2250194, 1.504968, -0.9953067, 0, 1, 0.3215686, 1,
-0.2248598, -2.255114, -2.226291, 0, 1, 0.3294118, 1,
-0.2244504, 1.064128, -0.436584, 0, 1, 0.3333333, 1,
-0.2232597, -0.4047718, -1.584363, 0, 1, 0.3411765, 1,
-0.2205318, 1.993906, -2.063137, 0, 1, 0.345098, 1,
-0.2189011, 0.690482, -0.4693258, 0, 1, 0.3529412, 1,
-0.2160618, 2.037273, 0.06665283, 0, 1, 0.3568628, 1,
-0.2158421, -0.4149118, -2.385294, 0, 1, 0.3647059, 1,
-0.2152895, -0.7942995, -3.736319, 0, 1, 0.3686275, 1,
-0.212211, 0.00860205, -0.7639574, 0, 1, 0.3764706, 1,
-0.2087763, 0.09439958, -1.587986, 0, 1, 0.3803922, 1,
-0.2045896, -0.5865276, -1.48362, 0, 1, 0.3882353, 1,
-0.2035159, 0.4906608, -0.3205794, 0, 1, 0.3921569, 1,
-0.2008107, -0.98693, -4.454451, 0, 1, 0.4, 1,
-0.1960293, -1.535613, -2.827286, 0, 1, 0.4078431, 1,
-0.1953052, 0.09353324, -2.701568, 0, 1, 0.4117647, 1,
-0.1943401, 0.2706282, -0.01726494, 0, 1, 0.4196078, 1,
-0.1907008, 2.702453, -2.194775, 0, 1, 0.4235294, 1,
-0.1902688, 0.06203049, -0.265983, 0, 1, 0.4313726, 1,
-0.1884126, -0.4894606, -1.421412, 0, 1, 0.4352941, 1,
-0.188082, -0.3012087, -2.704444, 0, 1, 0.4431373, 1,
-0.1863373, 0.6703823, 0.6199773, 0, 1, 0.4470588, 1,
-0.1860589, -0.9572117, -2.680492, 0, 1, 0.454902, 1,
-0.1850626, 0.6492602, -1.790537, 0, 1, 0.4588235, 1,
-0.1803019, -0.2473333, -1.142856, 0, 1, 0.4666667, 1,
-0.1764124, -0.7111465, -3.262015, 0, 1, 0.4705882, 1,
-0.1763256, -1.185532, -2.31213, 0, 1, 0.4784314, 1,
-0.1740166, 1.342349, -0.5055995, 0, 1, 0.4823529, 1,
-0.1736079, 0.4342816, -0.9441606, 0, 1, 0.4901961, 1,
-0.1625611, 0.8701913, 0.4602627, 0, 1, 0.4941176, 1,
-0.1599875, 0.290609, -1.289154, 0, 1, 0.5019608, 1,
-0.1585273, -0.8598878, -1.634516, 0, 1, 0.509804, 1,
-0.1564512, -0.1372488, -3.643714, 0, 1, 0.5137255, 1,
-0.1562506, 0.4665887, -1.685774, 0, 1, 0.5215687, 1,
-0.1551962, 1.458794, -0.1028279, 0, 1, 0.5254902, 1,
-0.1537944, -0.388154, -2.056504, 0, 1, 0.5333334, 1,
-0.1533672, 1.40332, -0.8488961, 0, 1, 0.5372549, 1,
-0.1493283, 0.736836, 0.8425418, 0, 1, 0.5450981, 1,
-0.1461913, -0.06475537, -3.455657, 0, 1, 0.5490196, 1,
-0.1454595, -1.077934, -3.345143, 0, 1, 0.5568628, 1,
-0.1445321, -2.484879, -2.622516, 0, 1, 0.5607843, 1,
-0.1434931, 0.4123116, 0.4573398, 0, 1, 0.5686275, 1,
-0.1434255, -0.8374928, -3.157397, 0, 1, 0.572549, 1,
-0.1423927, 0.4521062, 0.7094908, 0, 1, 0.5803922, 1,
-0.1386954, -1.30156, -2.886156, 0, 1, 0.5843138, 1,
-0.1371063, 0.6015591, 0.7722443, 0, 1, 0.5921569, 1,
-0.1355028, -0.454877, -1.662222, 0, 1, 0.5960785, 1,
-0.1328278, -1.238481, -3.141242, 0, 1, 0.6039216, 1,
-0.1304695, 3.138907, -0.3320765, 0, 1, 0.6117647, 1,
-0.1269902, -0.9706259, -4.614985, 0, 1, 0.6156863, 1,
-0.1255765, -0.3742096, -3.319963, 0, 1, 0.6235294, 1,
-0.125553, 0.4296726, -1.186039, 0, 1, 0.627451, 1,
-0.1242822, -0.4499426, -3.210148, 0, 1, 0.6352941, 1,
-0.1197147, -0.4787776, -4.225465, 0, 1, 0.6392157, 1,
-0.1189308, 0.2345401, 0.9064865, 0, 1, 0.6470588, 1,
-0.1159783, 0.795913, 0.924426, 0, 1, 0.6509804, 1,
-0.1136148, -0.5620236, -3.16546, 0, 1, 0.6588235, 1,
-0.1103088, 0.105192, -0.8251142, 0, 1, 0.6627451, 1,
-0.1030305, -0.3724035, -3.125666, 0, 1, 0.6705883, 1,
-0.10134, -1.26167, -2.530245, 0, 1, 0.6745098, 1,
-0.09955873, -0.6006913, -4.23696, 0, 1, 0.682353, 1,
-0.09906774, -0.7696183, -3.495937, 0, 1, 0.6862745, 1,
-0.09761132, -0.4391463, -3.597192, 0, 1, 0.6941177, 1,
-0.09445624, 0.7163734, 0.3624611, 0, 1, 0.7019608, 1,
-0.09404632, 0.05390894, -2.045243, 0, 1, 0.7058824, 1,
-0.09207574, 0.5862033, -0.3909802, 0, 1, 0.7137255, 1,
-0.08938662, 3.153265, -0.466038, 0, 1, 0.7176471, 1,
-0.08891459, -0.204375, -1.824967, 0, 1, 0.7254902, 1,
-0.08835883, 0.8827513, 0.0002806123, 0, 1, 0.7294118, 1,
-0.08818845, -1.401006, -2.499959, 0, 1, 0.7372549, 1,
-0.08221855, 0.2221609, 0.06108596, 0, 1, 0.7411765, 1,
-0.08220225, 0.277508, 2.650484, 0, 1, 0.7490196, 1,
-0.08039803, -0.1634764, -3.542285, 0, 1, 0.7529412, 1,
-0.07519452, 1.726918, -0.3811994, 0, 1, 0.7607843, 1,
-0.06660701, -0.02058331, -0.8042538, 0, 1, 0.7647059, 1,
-0.06200109, -0.5682449, -2.522312, 0, 1, 0.772549, 1,
-0.06195004, -0.2970974, -5.18314, 0, 1, 0.7764706, 1,
-0.06145769, 0.01047953, -1.586228, 0, 1, 0.7843137, 1,
-0.06110062, -1.03039, -3.959194, 0, 1, 0.7882353, 1,
-0.05460269, -0.07986306, -2.626998, 0, 1, 0.7960784, 1,
-0.05147575, 0.8485603, -0.3209954, 0, 1, 0.8039216, 1,
-0.04963599, -1.52035, -4.517179, 0, 1, 0.8078431, 1,
-0.04604596, 1.056204, 0.5299674, 0, 1, 0.8156863, 1,
-0.04245159, 1.443973, 1.059844, 0, 1, 0.8196079, 1,
-0.03477185, 0.6699099, 1.383604, 0, 1, 0.827451, 1,
-0.03318713, 1.376613, -1.045538, 0, 1, 0.8313726, 1,
-0.03135245, 0.136107, -1.097436, 0, 1, 0.8392157, 1,
-0.03100479, 0.482928, -0.855081, 0, 1, 0.8431373, 1,
-0.0279223, -1.678824, -3.953154, 0, 1, 0.8509804, 1,
-0.02559576, 0.2840198, -0.6134919, 0, 1, 0.854902, 1,
-0.02309893, -1.022538, -3.568726, 0, 1, 0.8627451, 1,
-0.02299006, -0.002869939, -1.746399, 0, 1, 0.8666667, 1,
-0.02018268, 1.377256, -1.027424, 0, 1, 0.8745098, 1,
-0.01967627, 0.04703296, -0.9896966, 0, 1, 0.8784314, 1,
-0.01781016, -2.350454, -3.098224, 0, 1, 0.8862745, 1,
-0.01707161, 1.193637, 0.741255, 0, 1, 0.8901961, 1,
-0.0168046, -0.2853817, -3.095512, 0, 1, 0.8980392, 1,
-0.01489519, -0.7150609, -2.998638, 0, 1, 0.9058824, 1,
-0.01290281, -1.27113, -2.806834, 0, 1, 0.9098039, 1,
-0.01215972, -3.425518, -4.796847, 0, 1, 0.9176471, 1,
-0.01163035, -0.6519813, -2.960018, 0, 1, 0.9215686, 1,
-0.01031163, -0.9872849, -3.208951, 0, 1, 0.9294118, 1,
-0.008549836, 1.228385, -1.565355, 0, 1, 0.9333333, 1,
-0.003498188, -1.21536, -1.30523, 0, 1, 0.9411765, 1,
-0.003155124, 0.07230326, -1.524583, 0, 1, 0.945098, 1,
0.001311164, 0.009082787, 1.249918, 0, 1, 0.9529412, 1,
0.002547298, 0.6518683, -0.9491804, 0, 1, 0.9568627, 1,
0.003005541, -0.6915832, 5.988352, 0, 1, 0.9647059, 1,
0.003512515, -0.633303, 2.631827, 0, 1, 0.9686275, 1,
0.003961934, -0.5659063, 2.627529, 0, 1, 0.9764706, 1,
0.00492799, -0.5626203, 3.106375, 0, 1, 0.9803922, 1,
0.01284301, -1.588378, 2.317993, 0, 1, 0.9882353, 1,
0.01289137, 0.273031, 1.234354, 0, 1, 0.9921569, 1,
0.01341145, 0.9380222, -0.931624, 0, 1, 1, 1,
0.01372823, 0.1674443, 0.3082805, 0, 0.9921569, 1, 1,
0.01938268, -2.029677, 3.866796, 0, 0.9882353, 1, 1,
0.02267932, -2.215332, 1.624233, 0, 0.9803922, 1, 1,
0.02293111, 0.6021593, 0.6488039, 0, 0.9764706, 1, 1,
0.02526451, -1.220954, 1.456728, 0, 0.9686275, 1, 1,
0.02785953, 0.2272974, -0.4908026, 0, 0.9647059, 1, 1,
0.03049844, -0.424588, 3.887839, 0, 0.9568627, 1, 1,
0.03302751, 0.4618507, 1.752732, 0, 0.9529412, 1, 1,
0.0338304, -1.889822, 1.900512, 0, 0.945098, 1, 1,
0.03548352, -1.421302, 3.901037, 0, 0.9411765, 1, 1,
0.0387125, -1.369562, 4.203443, 0, 0.9333333, 1, 1,
0.03958716, -0.8023717, 2.62388, 0, 0.9294118, 1, 1,
0.04008876, 0.859778, 1.446011, 0, 0.9215686, 1, 1,
0.04217973, 1.339081, 1.322512, 0, 0.9176471, 1, 1,
0.04480515, 0.8178164, 0.2172674, 0, 0.9098039, 1, 1,
0.04769599, 0.9124801, 0.3575315, 0, 0.9058824, 1, 1,
0.04926616, -1.121369, 2.588412, 0, 0.8980392, 1, 1,
0.05435043, 0.6721721, -1.301144, 0, 0.8901961, 1, 1,
0.05692597, -1.222026, 2.758771, 0, 0.8862745, 1, 1,
0.05874823, -0.6823182, 3.957614, 0, 0.8784314, 1, 1,
0.06252321, 0.1845837, 0.03035101, 0, 0.8745098, 1, 1,
0.06259578, 0.1321227, -0.9492446, 0, 0.8666667, 1, 1,
0.06760843, -0.4855357, 3.162691, 0, 0.8627451, 1, 1,
0.06887937, -0.2657824, 3.004224, 0, 0.854902, 1, 1,
0.06968526, -0.4705865, 2.499362, 0, 0.8509804, 1, 1,
0.07196683, -0.05399058, 0.004137144, 0, 0.8431373, 1, 1,
0.07220649, 0.8789302, -0.6153263, 0, 0.8392157, 1, 1,
0.07649298, -0.1123765, 1.743217, 0, 0.8313726, 1, 1,
0.07871667, -2.628532, 4.5244, 0, 0.827451, 1, 1,
0.07959692, -0.233065, 2.702584, 0, 0.8196079, 1, 1,
0.07984615, -0.4255821, 3.529436, 0, 0.8156863, 1, 1,
0.08624123, 0.1804458, -0.2080176, 0, 0.8078431, 1, 1,
0.08899044, -0.7956822, 3.86797, 0, 0.8039216, 1, 1,
0.09215458, -0.1082842, 3.490583, 0, 0.7960784, 1, 1,
0.092637, 0.283159, 0.00383063, 0, 0.7882353, 1, 1,
0.09437041, 1.875111, 0.05956376, 0, 0.7843137, 1, 1,
0.09604315, 0.1048515, -1.006948, 0, 0.7764706, 1, 1,
0.09925711, 1.350969, -1.209393, 0, 0.772549, 1, 1,
0.1006357, 1.012488, -1.811937, 0, 0.7647059, 1, 1,
0.1023414, -0.06887909, 1.449089, 0, 0.7607843, 1, 1,
0.1035053, -1.755471, 1.751538, 0, 0.7529412, 1, 1,
0.112609, -1.152824, 2.350428, 0, 0.7490196, 1, 1,
0.1131702, 0.8664055, -0.1829177, 0, 0.7411765, 1, 1,
0.1138142, -0.7247123, 4.222377, 0, 0.7372549, 1, 1,
0.1164612, 0.1301251, 0.5731855, 0, 0.7294118, 1, 1,
0.1166015, -1.862238, 3.205974, 0, 0.7254902, 1, 1,
0.1219948, -0.5571302, 1.336839, 0, 0.7176471, 1, 1,
0.1246355, 0.6002793, 1.040393, 0, 0.7137255, 1, 1,
0.1259526, 1.206508, 0.5923035, 0, 0.7058824, 1, 1,
0.1300728, -0.8215948, 1.642648, 0, 0.6980392, 1, 1,
0.1301303, 0.7395586, -1.727637, 0, 0.6941177, 1, 1,
0.1329404, -0.6203393, 1.6294, 0, 0.6862745, 1, 1,
0.1351068, 0.252938, -0.832786, 0, 0.682353, 1, 1,
0.1351764, -0.5097759, 2.396075, 0, 0.6745098, 1, 1,
0.1363612, 0.06790406, 1.106964, 0, 0.6705883, 1, 1,
0.1376899, -1.022417, 2.82899, 0, 0.6627451, 1, 1,
0.1437542, 0.3253411, 0.6257979, 0, 0.6588235, 1, 1,
0.1446767, -0.01065373, 0.2906053, 0, 0.6509804, 1, 1,
0.1483441, -0.3857428, 4.904675, 0, 0.6470588, 1, 1,
0.1510962, 0.8982237, 1.00234, 0, 0.6392157, 1, 1,
0.1615233, -0.9400123, 3.952539, 0, 0.6352941, 1, 1,
0.1633027, 0.2012298, -0.7119584, 0, 0.627451, 1, 1,
0.1634806, -0.70047, 2.337279, 0, 0.6235294, 1, 1,
0.1669108, 1.539446, 1.073142, 0, 0.6156863, 1, 1,
0.1751624, 1.475496, -0.5998339, 0, 0.6117647, 1, 1,
0.1790308, -0.5788545, 1.666334, 0, 0.6039216, 1, 1,
0.1824908, -0.1466515, 1.51412, 0, 0.5960785, 1, 1,
0.1857019, 0.904358, -0.21164, 0, 0.5921569, 1, 1,
0.187481, -0.5190467, 3.712016, 0, 0.5843138, 1, 1,
0.1883212, -0.6852369, 2.828151, 0, 0.5803922, 1, 1,
0.1907719, -1.84669, 3.543775, 0, 0.572549, 1, 1,
0.1942136, -1.094672, 2.832608, 0, 0.5686275, 1, 1,
0.1958295, 1.04139, 1.988165, 0, 0.5607843, 1, 1,
0.1967382, -1.270067, 3.0783, 0, 0.5568628, 1, 1,
0.2006375, -0.7280428, 1.014139, 0, 0.5490196, 1, 1,
0.2093922, -0.0351823, 1.48092, 0, 0.5450981, 1, 1,
0.2095551, -0.9769127, 3.489987, 0, 0.5372549, 1, 1,
0.2109545, -0.2638129, 2.616873, 0, 0.5333334, 1, 1,
0.2126883, -0.0418316, 1.079609, 0, 0.5254902, 1, 1,
0.2133895, -0.7881339, 2.127597, 0, 0.5215687, 1, 1,
0.2147695, -0.5656263, 2.943293, 0, 0.5137255, 1, 1,
0.2162741, 1.173593, 0.2521569, 0, 0.509804, 1, 1,
0.2177913, -0.2610376, 1.857815, 0, 0.5019608, 1, 1,
0.224118, 0.9008693, 0.1630865, 0, 0.4941176, 1, 1,
0.2252029, 0.6398126, 0.914861, 0, 0.4901961, 1, 1,
0.2258304, 1.925622, 1.733902, 0, 0.4823529, 1, 1,
0.2266081, 0.5690998, 2.484966, 0, 0.4784314, 1, 1,
0.2266414, 0.1666492, 0.1130355, 0, 0.4705882, 1, 1,
0.2310474, 0.1440331, -0.9117408, 0, 0.4666667, 1, 1,
0.2398793, 0.9656022, 0.736131, 0, 0.4588235, 1, 1,
0.2508434, 0.2303424, 0.3563225, 0, 0.454902, 1, 1,
0.2522028, -0.8943993, 2.779848, 0, 0.4470588, 1, 1,
0.2523735, 0.8255348, -0.8348103, 0, 0.4431373, 1, 1,
0.2529313, -0.2282918, 1.894066, 0, 0.4352941, 1, 1,
0.2565928, 0.01581982, 2.588314, 0, 0.4313726, 1, 1,
0.2571624, -0.7993324, 2.669093, 0, 0.4235294, 1, 1,
0.2572163, -1.062537, 3.404897, 0, 0.4196078, 1, 1,
0.2578107, -0.6395105, 2.128091, 0, 0.4117647, 1, 1,
0.258278, -0.1162007, 1.884623, 0, 0.4078431, 1, 1,
0.2584887, -0.6414027, 3.99797, 0, 0.4, 1, 1,
0.2616826, 2.390924, 0.59698, 0, 0.3921569, 1, 1,
0.2692095, -1.512351, 3.610472, 0, 0.3882353, 1, 1,
0.2704202, -0.3512754, 3.443932, 0, 0.3803922, 1, 1,
0.2707022, 1.065788, 1.517896, 0, 0.3764706, 1, 1,
0.2727136, 0.8052064, 1.706492, 0, 0.3686275, 1, 1,
0.2737924, -0.00583612, 0.9094365, 0, 0.3647059, 1, 1,
0.2793038, -0.02458979, 0.7535352, 0, 0.3568628, 1, 1,
0.2805554, -0.3384908, 3.471924, 0, 0.3529412, 1, 1,
0.2841539, 1.028004, -0.4206646, 0, 0.345098, 1, 1,
0.2867736, 0.3721635, 0.846738, 0, 0.3411765, 1, 1,
0.2900705, 1.480013, 0.9094069, 0, 0.3333333, 1, 1,
0.2930045, -0.9355866, 1.885526, 0, 0.3294118, 1, 1,
0.2984467, 0.6829165, 0.551468, 0, 0.3215686, 1, 1,
0.3023717, 0.6289874, 0.2683554, 0, 0.3176471, 1, 1,
0.3051039, 1.682386, -0.5798927, 0, 0.3098039, 1, 1,
0.3149629, -0.4480782, 2.367262, 0, 0.3058824, 1, 1,
0.3197116, 0.7278352, 0.03796866, 0, 0.2980392, 1, 1,
0.3226087, -1.018138, 2.471429, 0, 0.2901961, 1, 1,
0.32345, 0.1123444, -0.006638337, 0, 0.2862745, 1, 1,
0.3241143, 0.8192722, 1.592129, 0, 0.2784314, 1, 1,
0.3246904, 0.423147, 1.993927, 0, 0.2745098, 1, 1,
0.3269374, -0.3961155, 0.6870316, 0, 0.2666667, 1, 1,
0.3292963, 0.375078, 2.217616, 0, 0.2627451, 1, 1,
0.3347476, 1.658113, -0.7585738, 0, 0.254902, 1, 1,
0.3359589, 1.731929, -0.02491014, 0, 0.2509804, 1, 1,
0.337638, -2.029045, 2.763424, 0, 0.2431373, 1, 1,
0.3378397, 0.6230955, 1.463807, 0, 0.2392157, 1, 1,
0.3384373, -1.009361, 1.956615, 0, 0.2313726, 1, 1,
0.3394846, 0.5462327, -1.230187, 0, 0.227451, 1, 1,
0.3442547, 0.5493727, 0.1116203, 0, 0.2196078, 1, 1,
0.3444094, 0.2913125, 1.048115, 0, 0.2156863, 1, 1,
0.3488265, 0.07661351, 0.2665285, 0, 0.2078431, 1, 1,
0.3549143, -0.7248508, 3.463564, 0, 0.2039216, 1, 1,
0.3589754, 0.7659135, -0.5138232, 0, 0.1960784, 1, 1,
0.3621768, 0.6005548, 1.869103, 0, 0.1882353, 1, 1,
0.3642102, 1.959445, 0.222802, 0, 0.1843137, 1, 1,
0.3697644, -0.783625, 3.95263, 0, 0.1764706, 1, 1,
0.3702707, 0.5451989, 2.369564, 0, 0.172549, 1, 1,
0.3702915, -0.1258003, 0.8288039, 0, 0.1647059, 1, 1,
0.3732391, -1.486495, 2.274718, 0, 0.1607843, 1, 1,
0.3748273, -0.7808766, 4.449139, 0, 0.1529412, 1, 1,
0.3749287, -0.1203395, 2.313562, 0, 0.1490196, 1, 1,
0.3749666, 1.93742, -1.701331, 0, 0.1411765, 1, 1,
0.3756081, 1.184542, 0.6236175, 0, 0.1372549, 1, 1,
0.3792095, 1.295674, 1.134874, 0, 0.1294118, 1, 1,
0.3804081, 0.1242543, 2.955899, 0, 0.1254902, 1, 1,
0.3827251, 1.758099, 0.3937763, 0, 0.1176471, 1, 1,
0.3828438, 1.408391, 1.796232, 0, 0.1137255, 1, 1,
0.3856604, 1.500962, 0.02183616, 0, 0.1058824, 1, 1,
0.3933579, -0.1604538, 1.698971, 0, 0.09803922, 1, 1,
0.3934752, 1.290882, 1.184149, 0, 0.09411765, 1, 1,
0.3964046, 0.1398127, 0.4276793, 0, 0.08627451, 1, 1,
0.3993722, 1.094941, -0.4004633, 0, 0.08235294, 1, 1,
0.4016508, 1.29569, 1.313936, 0, 0.07450981, 1, 1,
0.4031933, -2.085582, 3.3969, 0, 0.07058824, 1, 1,
0.4048663, 0.3763141, 1.308677, 0, 0.0627451, 1, 1,
0.4100381, -1.295646, 2.905376, 0, 0.05882353, 1, 1,
0.4160077, -1.571921, 2.282252, 0, 0.05098039, 1, 1,
0.4162809, -0.9064332, 1.612889, 0, 0.04705882, 1, 1,
0.4316464, -0.7879016, 2.457736, 0, 0.03921569, 1, 1,
0.4361567, -0.6694293, 3.924407, 0, 0.03529412, 1, 1,
0.4416344, -0.07100248, 1.741628, 0, 0.02745098, 1, 1,
0.4487533, 0.04736261, 1.659765, 0, 0.02352941, 1, 1,
0.4530659, 1.797115, 1.082904, 0, 0.01568628, 1, 1,
0.4534156, -0.1818334, 2.345563, 0, 0.01176471, 1, 1,
0.4537415, 1.113753, -0.5217466, 0, 0.003921569, 1, 1,
0.4569008, -1.279538, 3.611805, 0.003921569, 0, 1, 1,
0.4689373, -0.8612559, 2.83966, 0.007843138, 0, 1, 1,
0.4734366, -0.1109863, 1.781977, 0.01568628, 0, 1, 1,
0.4748222, 0.2947359, 2.055735, 0.01960784, 0, 1, 1,
0.4784724, -0.329794, 2.317111, 0.02745098, 0, 1, 1,
0.4785766, -0.5750597, 0.5128084, 0.03137255, 0, 1, 1,
0.4789929, 1.659881, -1.362909, 0.03921569, 0, 1, 1,
0.4791309, 0.3917266, -0.2196338, 0.04313726, 0, 1, 1,
0.4802476, -0.9292377, 2.104057, 0.05098039, 0, 1, 1,
0.4821847, 0.1477081, 1.790643, 0.05490196, 0, 1, 1,
0.485245, 0.6056906, 0.6238442, 0.0627451, 0, 1, 1,
0.4888396, 0.0213831, 0.5179111, 0.06666667, 0, 1, 1,
0.4891185, 1.146093, 0.409746, 0.07450981, 0, 1, 1,
0.4936033, 1.099059, 0.4066727, 0.07843138, 0, 1, 1,
0.5028585, 2.010041, 0.3930758, 0.08627451, 0, 1, 1,
0.5029774, -2.076735, 5.042294, 0.09019608, 0, 1, 1,
0.5087677, -0.5244637, 3.070853, 0.09803922, 0, 1, 1,
0.5107686, 1.135184, -2.867323, 0.1058824, 0, 1, 1,
0.5114355, 0.7822114, 3.054219, 0.1098039, 0, 1, 1,
0.5133411, 0.4496176, 1.836956, 0.1176471, 0, 1, 1,
0.5173161, 1.469506, 0.5232033, 0.1215686, 0, 1, 1,
0.517589, -0.7065148, 2.498716, 0.1294118, 0, 1, 1,
0.5198238, 0.584495, 1.903645, 0.1333333, 0, 1, 1,
0.5202425, 0.06060361, 1.700786, 0.1411765, 0, 1, 1,
0.5266302, -1.519242, 4.175972, 0.145098, 0, 1, 1,
0.5267761, -0.5693763, 1.10877, 0.1529412, 0, 1, 1,
0.529376, -0.2486877, 1.649475, 0.1568628, 0, 1, 1,
0.5295496, -0.1181031, 1.31781, 0.1647059, 0, 1, 1,
0.5393355, 0.2859863, 1.739294, 0.1686275, 0, 1, 1,
0.5462599, -0.5942979, 2.404969, 0.1764706, 0, 1, 1,
0.5551788, -1.621819, 1.509529, 0.1803922, 0, 1, 1,
0.5560535, 1.038316, 1.297577, 0.1882353, 0, 1, 1,
0.5600711, 1.063788, -1.648124, 0.1921569, 0, 1, 1,
0.5607556, 0.130105, 2.567216, 0.2, 0, 1, 1,
0.5614923, 1.122322, 2.260081, 0.2078431, 0, 1, 1,
0.5618948, -1.993518, 3.523684, 0.2117647, 0, 1, 1,
0.5621529, -0.1551224, 2.514092, 0.2196078, 0, 1, 1,
0.5628631, -0.2618296, 1.923883, 0.2235294, 0, 1, 1,
0.5630113, -0.9341385, 1.205137, 0.2313726, 0, 1, 1,
0.5703365, 0.6099353, 0.7721875, 0.2352941, 0, 1, 1,
0.5704906, -0.1984814, 1.608622, 0.2431373, 0, 1, 1,
0.5727428, 0.9663939, 0.1829667, 0.2470588, 0, 1, 1,
0.5766236, -0.6916998, 3.520841, 0.254902, 0, 1, 1,
0.5849004, 0.3301403, 2.108123, 0.2588235, 0, 1, 1,
0.5862245, -0.5334207, 1.791633, 0.2666667, 0, 1, 1,
0.5869086, 0.01024397, 1.832576, 0.2705882, 0, 1, 1,
0.5945393, -0.6973991, 3.00497, 0.2784314, 0, 1, 1,
0.5949617, 0.3802419, 1.338547, 0.282353, 0, 1, 1,
0.5964697, -0.4469073, 2.851867, 0.2901961, 0, 1, 1,
0.5966328, 0.7791254, 0.06159479, 0.2941177, 0, 1, 1,
0.599651, -0.3249668, 3.860621, 0.3019608, 0, 1, 1,
0.6011666, -0.7138613, 2.909759, 0.3098039, 0, 1, 1,
0.6114697, 1.089383, -0.3118398, 0.3137255, 0, 1, 1,
0.6123229, -1.386397, 1.64634, 0.3215686, 0, 1, 1,
0.6129956, -1.733968, 2.183765, 0.3254902, 0, 1, 1,
0.6176683, 0.7483003, 0.4853782, 0.3333333, 0, 1, 1,
0.6218691, -1.207953, 1.88371, 0.3372549, 0, 1, 1,
0.6257714, -1.863606, 2.997948, 0.345098, 0, 1, 1,
0.6317118, 0.3328457, 1.981062, 0.3490196, 0, 1, 1,
0.6366866, -0.7643064, 2.562924, 0.3568628, 0, 1, 1,
0.6378956, -0.4281737, 1.636063, 0.3607843, 0, 1, 1,
0.6400207, 1.880562, 0.278381, 0.3686275, 0, 1, 1,
0.6404703, 0.2696935, -0.2692385, 0.372549, 0, 1, 1,
0.6469054, 1.186132, 1.126526, 0.3803922, 0, 1, 1,
0.6518562, 0.8322216, 0.8793592, 0.3843137, 0, 1, 1,
0.6543252, -0.07673152, 0.2189197, 0.3921569, 0, 1, 1,
0.6558123, -1.170552, 3.381144, 0.3960784, 0, 1, 1,
0.6563736, 1.319608, -0.550917, 0.4039216, 0, 1, 1,
0.6574405, 0.2378641, 1.117641, 0.4117647, 0, 1, 1,
0.6577184, 1.69664, 1.935106, 0.4156863, 0, 1, 1,
0.6631346, -0.8710778, 2.392157, 0.4235294, 0, 1, 1,
0.6679775, 1.717427, 0.9972192, 0.427451, 0, 1, 1,
0.6714283, -0.5896162, 2.596349, 0.4352941, 0, 1, 1,
0.6793627, 1.074677, -0.8444099, 0.4392157, 0, 1, 1,
0.6859702, -0.3590126, 1.903138, 0.4470588, 0, 1, 1,
0.6877063, -0.5877067, 2.847436, 0.4509804, 0, 1, 1,
0.6877108, -0.8389919, 2.295274, 0.4588235, 0, 1, 1,
0.6920595, -1.806025, 2.136817, 0.4627451, 0, 1, 1,
0.6946467, -0.7279865, 1.805728, 0.4705882, 0, 1, 1,
0.7018071, 1.292751, -0.2998362, 0.4745098, 0, 1, 1,
0.7138038, 2.182322, 0.2949526, 0.4823529, 0, 1, 1,
0.7146928, 0.1142124, 1.535215, 0.4862745, 0, 1, 1,
0.7191865, 0.0867305, 2.592935, 0.4941176, 0, 1, 1,
0.7226675, -0.9116921, 2.721386, 0.5019608, 0, 1, 1,
0.7266805, 1.096504, 1.093107, 0.5058824, 0, 1, 1,
0.7276824, 1.295515, -0.7892519, 0.5137255, 0, 1, 1,
0.7279044, 1.490058, -0.3978959, 0.5176471, 0, 1, 1,
0.7317533, -0.2683831, 1.436403, 0.5254902, 0, 1, 1,
0.7343821, 0.8401401, -2.015472, 0.5294118, 0, 1, 1,
0.7405647, -0.9487978, 3.084652, 0.5372549, 0, 1, 1,
0.7430296, 1.081964, -0.9089944, 0.5411765, 0, 1, 1,
0.7471414, -0.0261814, 2.163408, 0.5490196, 0, 1, 1,
0.7478315, 1.045354, -0.3930262, 0.5529412, 0, 1, 1,
0.7614563, 0.3517506, 1.105164, 0.5607843, 0, 1, 1,
0.7670825, -0.2349304, 2.153642, 0.5647059, 0, 1, 1,
0.7671882, 1.012992, 0.5493638, 0.572549, 0, 1, 1,
0.7746833, 0.1688152, 0.1662785, 0.5764706, 0, 1, 1,
0.775427, 0.08283826, 2.425634, 0.5843138, 0, 1, 1,
0.7758155, -0.5237125, 2.377318, 0.5882353, 0, 1, 1,
0.7789934, -0.4739186, 0.9812396, 0.5960785, 0, 1, 1,
0.7952371, 1.401463, 0.4980424, 0.6039216, 0, 1, 1,
0.8026739, -1.291196, 3.336267, 0.6078432, 0, 1, 1,
0.8058955, 0.683197, 1.161712, 0.6156863, 0, 1, 1,
0.8073022, 0.08284109, 0.8384262, 0.6196079, 0, 1, 1,
0.8074069, 1.056539, 0.9769183, 0.627451, 0, 1, 1,
0.8160463, -0.7567859, 3.309571, 0.6313726, 0, 1, 1,
0.8176801, -0.792476, 2.750959, 0.6392157, 0, 1, 1,
0.8187458, 0.8700761, 2.129364, 0.6431373, 0, 1, 1,
0.8239112, 0.794579, 0.6488097, 0.6509804, 0, 1, 1,
0.8241364, -1.900547, 2.441894, 0.654902, 0, 1, 1,
0.8264545, 0.06890891, -0.447235, 0.6627451, 0, 1, 1,
0.8328761, 1.177155, 1.516291, 0.6666667, 0, 1, 1,
0.8330039, 0.8958184, 0.7058373, 0.6745098, 0, 1, 1,
0.8358395, 0.215038, 1.190213, 0.6784314, 0, 1, 1,
0.8363556, 0.8778216, 0.4867326, 0.6862745, 0, 1, 1,
0.8369802, 0.2110251, 0.1945896, 0.6901961, 0, 1, 1,
0.8405099, 1.863795, -0.3191181, 0.6980392, 0, 1, 1,
0.8434004, 0.2036185, 1.093658, 0.7058824, 0, 1, 1,
0.846132, -0.4068211, 2.721103, 0.7098039, 0, 1, 1,
0.8476375, -0.9488702, 1.903162, 0.7176471, 0, 1, 1,
0.8513752, 1.23914, 1.218492, 0.7215686, 0, 1, 1,
0.8582789, -0.8665351, 2.674274, 0.7294118, 0, 1, 1,
0.8602168, -0.8701878, 3.166691, 0.7333333, 0, 1, 1,
0.8605291, 1.732661, 2.103787, 0.7411765, 0, 1, 1,
0.8607014, 0.1682298, 0.6071345, 0.7450981, 0, 1, 1,
0.8653737, 0.3857813, 1.099191, 0.7529412, 0, 1, 1,
0.8662883, -1.861683, 2.643875, 0.7568628, 0, 1, 1,
0.8667101, 0.1355269, 1.009, 0.7647059, 0, 1, 1,
0.8686577, 0.4221913, 1.081905, 0.7686275, 0, 1, 1,
0.8799628, 0.7041965, 1.108424, 0.7764706, 0, 1, 1,
0.8880729, -2.03763, 3.540537, 0.7803922, 0, 1, 1,
0.8897324, 0.6244121, 0.4719987, 0.7882353, 0, 1, 1,
0.8906489, -0.07892045, 1.449672, 0.7921569, 0, 1, 1,
0.8998725, 0.2331006, 1.216394, 0.8, 0, 1, 1,
0.9042645, -0.09020295, 0.8837654, 0.8078431, 0, 1, 1,
0.9055449, 0.6067441, -0.002317717, 0.8117647, 0, 1, 1,
0.915328, 1.361933, 2.149018, 0.8196079, 0, 1, 1,
0.9168367, -0.2452499, 1.115303, 0.8235294, 0, 1, 1,
0.9201798, 0.2761994, 1.248822, 0.8313726, 0, 1, 1,
0.9215218, 0.4427607, 0.8372207, 0.8352941, 0, 1, 1,
0.9235245, 0.3600824, 2.94748, 0.8431373, 0, 1, 1,
0.9279198, -1.266333, 2.056273, 0.8470588, 0, 1, 1,
0.9295298, 0.7186587, -1.579872, 0.854902, 0, 1, 1,
0.9333521, -0.4820333, 2.164534, 0.8588235, 0, 1, 1,
0.9334428, 0.4063571, 0.1996882, 0.8666667, 0, 1, 1,
0.9344859, 0.5220286, 2.61065, 0.8705882, 0, 1, 1,
0.9358343, -1.230873, 1.530859, 0.8784314, 0, 1, 1,
0.9394554, 0.4358323, 3.046028, 0.8823529, 0, 1, 1,
0.9406428, -0.997501, 1.648346, 0.8901961, 0, 1, 1,
0.9432179, 0.6047744, 1.044791, 0.8941177, 0, 1, 1,
0.9446977, -2.259681, -0.3445936, 0.9019608, 0, 1, 1,
0.9465193, 1.618477, 2.137401, 0.9098039, 0, 1, 1,
0.9473941, -0.4906207, 0.971195, 0.9137255, 0, 1, 1,
0.9489216, 0.5824326, 0.5509488, 0.9215686, 0, 1, 1,
0.9556257, 0.3059461, 1.640647, 0.9254902, 0, 1, 1,
0.9596568, 0.05077794, 1.469718, 0.9333333, 0, 1, 1,
0.9606178, 0.2854615, 1.852187, 0.9372549, 0, 1, 1,
0.9615265, -0.8940978, 1.421636, 0.945098, 0, 1, 1,
0.9660898, -0.6408396, 2.104079, 0.9490196, 0, 1, 1,
0.968794, 0.1807481, 1.489393, 0.9568627, 0, 1, 1,
0.9698106, 2.107568, 1.704263, 0.9607843, 0, 1, 1,
0.9720599, -0.7654359, 3.227886, 0.9686275, 0, 1, 1,
0.9739218, 0.4055795, 2.537429, 0.972549, 0, 1, 1,
0.9749659, 0.574872, -0.9747216, 0.9803922, 0, 1, 1,
0.9759396, 0.3657853, 0.2060652, 0.9843137, 0, 1, 1,
0.9807224, 0.6299471, 1.69335, 0.9921569, 0, 1, 1,
0.98128, -0.4586838, 2.420559, 0.9960784, 0, 1, 1,
0.9838035, -1.133624, 1.412876, 1, 0, 0.9960784, 1,
0.9902924, -0.2974071, 1.830028, 1, 0, 0.9882353, 1,
0.9929993, 0.05584715, 0.5866457, 1, 0, 0.9843137, 1,
0.9977522, 1.503126, 1.418163, 1, 0, 0.9764706, 1,
1.006086, 0.1925252, 0.4408648, 1, 0, 0.972549, 1,
1.009458, -1.383409, 4.202933, 1, 0, 0.9647059, 1,
1.01086, 0.09351492, 1.536948, 1, 0, 0.9607843, 1,
1.014064, -1.481939, 2.813755, 1, 0, 0.9529412, 1,
1.024304, 0.05185672, 0.2877372, 1, 0, 0.9490196, 1,
1.03095, 0.7395048, 0.4966947, 1, 0, 0.9411765, 1,
1.036883, -0.2711369, 1.492538, 1, 0, 0.9372549, 1,
1.041564, -1.329122, 1.693102, 1, 0, 0.9294118, 1,
1.042036, 1.046211, 0.530923, 1, 0, 0.9254902, 1,
1.046889, -0.3263971, -0.3554676, 1, 0, 0.9176471, 1,
1.047157, -0.6813809, 1.824714, 1, 0, 0.9137255, 1,
1.050088, -1.673467, 2.694543, 1, 0, 0.9058824, 1,
1.055856, -0.7714859, 1.972934, 1, 0, 0.9019608, 1,
1.064077, 0.7210258, -0.3489029, 1, 0, 0.8941177, 1,
1.06471, 0.2686075, 1.904328, 1, 0, 0.8862745, 1,
1.065575, -0.2221909, 1.534364, 1, 0, 0.8823529, 1,
1.067788, 0.5783532, 1.399946, 1, 0, 0.8745098, 1,
1.071449, 1.523675, 0.3990747, 1, 0, 0.8705882, 1,
1.08024, 0.2594326, 1.656914, 1, 0, 0.8627451, 1,
1.081978, -1.310353, 3.132807, 1, 0, 0.8588235, 1,
1.082097, 0.2307903, 0.8836448, 1, 0, 0.8509804, 1,
1.082384, -0.5792333, 3.696298, 1, 0, 0.8470588, 1,
1.082944, 2.3218, 0.8007697, 1, 0, 0.8392157, 1,
1.085229, 1.361655, 1.427873, 1, 0, 0.8352941, 1,
1.093782, -0.395052, 3.482845, 1, 0, 0.827451, 1,
1.095272, -0.2348804, 0.2519297, 1, 0, 0.8235294, 1,
1.095491, -0.6757189, 1.80416, 1, 0, 0.8156863, 1,
1.096683, 0.01966522, 0.9257357, 1, 0, 0.8117647, 1,
1.096732, 0.438024, 2.899568, 1, 0, 0.8039216, 1,
1.106201, -1.022416, 2.437043, 1, 0, 0.7960784, 1,
1.107028, 0.965847, -0.4325409, 1, 0, 0.7921569, 1,
1.107552, -0.567089, 3.77495, 1, 0, 0.7843137, 1,
1.110365, 0.00764948, 1.803725, 1, 0, 0.7803922, 1,
1.113232, 0.668852, 1.36967, 1, 0, 0.772549, 1,
1.117469, 1.768004, 1.805665, 1, 0, 0.7686275, 1,
1.122685, -2.020326, 2.613421, 1, 0, 0.7607843, 1,
1.127485, -0.1061322, 1.151366, 1, 0, 0.7568628, 1,
1.141237, -0.2965429, 3.257992, 1, 0, 0.7490196, 1,
1.14336, 0.04277943, 0.5645162, 1, 0, 0.7450981, 1,
1.148078, 1.631507, 0.3188999, 1, 0, 0.7372549, 1,
1.148292, 0.891129, 0.3976883, 1, 0, 0.7333333, 1,
1.152558, -0.6664959, 2.725623, 1, 0, 0.7254902, 1,
1.157925, 0.9292067, 2.458938, 1, 0, 0.7215686, 1,
1.160384, -1.583871, 1.812721, 1, 0, 0.7137255, 1,
1.160648, -1.139966, 2.071779, 1, 0, 0.7098039, 1,
1.163376, -1.1172, 1.771496, 1, 0, 0.7019608, 1,
1.165331, -0.5640917, 0.5446917, 1, 0, 0.6941177, 1,
1.167365, -0.02246712, 1.365624, 1, 0, 0.6901961, 1,
1.171227, -1.323787, 3.184067, 1, 0, 0.682353, 1,
1.173678, -0.1343401, 0.8445393, 1, 0, 0.6784314, 1,
1.181435, -1.745941, 5.200419, 1, 0, 0.6705883, 1,
1.182449, -0.846678, 2.826928, 1, 0, 0.6666667, 1,
1.184008, 0.02576322, 0.540802, 1, 0, 0.6588235, 1,
1.186146, -0.06609017, 2.597739, 1, 0, 0.654902, 1,
1.186587, -0.4223287, 0.7822971, 1, 0, 0.6470588, 1,
1.192403, -1.14757, 2.324149, 1, 0, 0.6431373, 1,
1.194807, -0.5377847, 1.087527, 1, 0, 0.6352941, 1,
1.202609, -0.604885, 1.432736, 1, 0, 0.6313726, 1,
1.211462, -1.154795, 0.9006672, 1, 0, 0.6235294, 1,
1.21582, 2.026761, 1.132861, 1, 0, 0.6196079, 1,
1.216685, -0.1139333, 0.9421421, 1, 0, 0.6117647, 1,
1.220764, -2.415467, 2.651407, 1, 0, 0.6078432, 1,
1.236545, 0.02629299, 0.9686162, 1, 0, 0.6, 1,
1.236775, -0.9417042, 2.672021, 1, 0, 0.5921569, 1,
1.239906, 0.493523, 0.3007476, 1, 0, 0.5882353, 1,
1.24209, 0.6706442, 1.410576, 1, 0, 0.5803922, 1,
1.244859, -0.3158303, 2.100118, 1, 0, 0.5764706, 1,
1.249059, 1.132843, 0.3958411, 1, 0, 0.5686275, 1,
1.251386, -2.065129, 3.233573, 1, 0, 0.5647059, 1,
1.252301, -1.519985, 2.601792, 1, 0, 0.5568628, 1,
1.255122, -0.7240623, 1.593637, 1, 0, 0.5529412, 1,
1.257042, 0.8177489, 1.139717, 1, 0, 0.5450981, 1,
1.269311, 1.496283, 2.573344, 1, 0, 0.5411765, 1,
1.272509, 0.3968073, 2.40936, 1, 0, 0.5333334, 1,
1.279547, -0.1988638, 2.02856, 1, 0, 0.5294118, 1,
1.282611, 0.6959434, 0.9796433, 1, 0, 0.5215687, 1,
1.288551, 1.263671, -0.6220601, 1, 0, 0.5176471, 1,
1.308076, -0.192885, 2.238811, 1, 0, 0.509804, 1,
1.308731, -1.978224, 2.914329, 1, 0, 0.5058824, 1,
1.311729, 0.9630333, -0.2544513, 1, 0, 0.4980392, 1,
1.312818, -0.4823831, 2.273782, 1, 0, 0.4901961, 1,
1.314743, 0.3955867, 1.177953, 1, 0, 0.4862745, 1,
1.317647, -0.6195708, 0.3949642, 1, 0, 0.4784314, 1,
1.325292, -2.137075, 1.309262, 1, 0, 0.4745098, 1,
1.34876, 0.4705559, 3.571919, 1, 0, 0.4666667, 1,
1.367515, -0.1219704, 1.531343, 1, 0, 0.4627451, 1,
1.384375, 1.285815, 2.237121, 1, 0, 0.454902, 1,
1.399793, 0.01384353, 2.640544, 1, 0, 0.4509804, 1,
1.40303, 0.7713988, 1.849443, 1, 0, 0.4431373, 1,
1.423814, -0.6706535, 1.508307, 1, 0, 0.4392157, 1,
1.435157, 0.2362594, 1.560848, 1, 0, 0.4313726, 1,
1.437617, -0.06180402, 1.50758, 1, 0, 0.427451, 1,
1.446876, 1.376768, 1.313417, 1, 0, 0.4196078, 1,
1.451619, 1.837259, 0.631635, 1, 0, 0.4156863, 1,
1.456827, 0.09496773, 2.723384, 1, 0, 0.4078431, 1,
1.467603, -0.4953162, 2.030931, 1, 0, 0.4039216, 1,
1.470179, 0.1881183, 3.191353, 1, 0, 0.3960784, 1,
1.470263, 1.338402, 1.016483, 1, 0, 0.3882353, 1,
1.516734, -0.08823176, 0.1166553, 1, 0, 0.3843137, 1,
1.52461, 0.017654, 1.590351, 1, 0, 0.3764706, 1,
1.53766, -0.8815261, 2.942149, 1, 0, 0.372549, 1,
1.537868, -1.205105, 1.766034, 1, 0, 0.3647059, 1,
1.556083, -0.7828787, 2.174615, 1, 0, 0.3607843, 1,
1.558397, 0.352182, 2.002652, 1, 0, 0.3529412, 1,
1.560494, 0.5801716, 0.8610874, 1, 0, 0.3490196, 1,
1.564519, 0.544984, 2.585225, 1, 0, 0.3411765, 1,
1.575647, 1.791454, 0.9408855, 1, 0, 0.3372549, 1,
1.576352, -1.171794, 2.985425, 1, 0, 0.3294118, 1,
1.588075, -0.5173733, 1.161392, 1, 0, 0.3254902, 1,
1.595654, -0.1504214, 2.233824, 1, 0, 0.3176471, 1,
1.596408, 0.795224, -0.04503713, 1, 0, 0.3137255, 1,
1.601213, -0.3113537, 2.627841, 1, 0, 0.3058824, 1,
1.608002, 0.1560008, 1.190368, 1, 0, 0.2980392, 1,
1.614454, 0.1229235, 2.307471, 1, 0, 0.2941177, 1,
1.617838, 1.454237, 1.529289, 1, 0, 0.2862745, 1,
1.621427, 0.1043042, 2.079067, 1, 0, 0.282353, 1,
1.634945, 0.4173431, 2.285501, 1, 0, 0.2745098, 1,
1.643821, 0.04677906, 1.241257, 1, 0, 0.2705882, 1,
1.675397, 0.7938758, 2.570517, 1, 0, 0.2627451, 1,
1.693686, 0.7557346, 1.143904, 1, 0, 0.2588235, 1,
1.6997, 0.1897878, 1.123135, 1, 0, 0.2509804, 1,
1.707942, -0.8243198, 1.296767, 1, 0, 0.2470588, 1,
1.714483, 0.4176531, 1.482033, 1, 0, 0.2392157, 1,
1.729321, -0.6376999, 2.778305, 1, 0, 0.2352941, 1,
1.748841, -0.8194363, 1.896563, 1, 0, 0.227451, 1,
1.752474, 0.009437568, 0.6355845, 1, 0, 0.2235294, 1,
1.783621, -1.992179, 3.00411, 1, 0, 0.2156863, 1,
1.804888, -0.2925292, 3.28351, 1, 0, 0.2117647, 1,
1.819599, -0.07578217, 1.184387, 1, 0, 0.2039216, 1,
1.821516, -0.006721952, 0.004632345, 1, 0, 0.1960784, 1,
1.83162, 0.8162826, 0.3612673, 1, 0, 0.1921569, 1,
1.835551, -1.075894, 2.938032, 1, 0, 0.1843137, 1,
1.8433, -0.6799979, 2.059367, 1, 0, 0.1803922, 1,
1.846721, 0.3097548, 0.7079087, 1, 0, 0.172549, 1,
1.857369, -1.068986, 1.877856, 1, 0, 0.1686275, 1,
1.878706, -1.394133, 1.665104, 1, 0, 0.1607843, 1,
1.914578, -0.3036902, 2.185605, 1, 0, 0.1568628, 1,
1.91461, 0.1580981, 1.881073, 1, 0, 0.1490196, 1,
1.920383, -0.7429658, 2.976454, 1, 0, 0.145098, 1,
1.957342, 1.210442, 0.0251205, 1, 0, 0.1372549, 1,
1.965729, 0.1217212, 1.102591, 1, 0, 0.1333333, 1,
1.966329, 1.814593, 0.6025616, 1, 0, 0.1254902, 1,
1.968608, -0.5275426, 0.803654, 1, 0, 0.1215686, 1,
1.974512, 1.753387, 0.02386813, 1, 0, 0.1137255, 1,
2.028019, 1.303824, 0.3306994, 1, 0, 0.1098039, 1,
2.047775, 1.191258, 2.392855, 1, 0, 0.1019608, 1,
2.064588, 0.4944543, 2.857044, 1, 0, 0.09411765, 1,
2.099387, -1.640127, 1.677829, 1, 0, 0.09019608, 1,
2.120062, -1.960418, 4.524422, 1, 0, 0.08235294, 1,
2.13725, -0.6633083, 2.338367, 1, 0, 0.07843138, 1,
2.161155, -1.204522, 2.908628, 1, 0, 0.07058824, 1,
2.182548, 0.02128717, 3.462261, 1, 0, 0.06666667, 1,
2.273658, 0.7499093, 0.8575163, 1, 0, 0.05882353, 1,
2.325472, 1.540183, 1.749826, 1, 0, 0.05490196, 1,
2.425791, -0.8255126, 3.258889, 1, 0, 0.04705882, 1,
2.460483, 0.2873857, 0.9060119, 1, 0, 0.04313726, 1,
2.515095, 0.8907474, 3.420615, 1, 0, 0.03529412, 1,
2.739861, 0.05131583, 2.288102, 1, 0, 0.03137255, 1,
2.831974, -1.317557, 0.2102224, 1, 0, 0.02352941, 1,
2.869264, -0.5686334, 0.7879537, 1, 0, 0.01960784, 1,
3.147752, 0.1617334, 2.861771, 1, 0, 0.01176471, 1,
3.416149, 0.9692452, 2.026983, 1, 0, 0.007843138, 1
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
0.3206517, -4.540622, -7.604833, 0, -0.5, 0.5, 0.5,
0.3206517, -4.540622, -7.604833, 1, -0.5, 0.5, 0.5,
0.3206517, -4.540622, -7.604833, 1, 1.5, 0.5, 0.5,
0.3206517, -4.540622, -7.604833, 0, 1.5, 0.5, 0.5
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
-3.824219, -0.1361262, -7.604833, 0, -0.5, 0.5, 0.5,
-3.824219, -0.1361262, -7.604833, 1, -0.5, 0.5, 0.5,
-3.824219, -0.1361262, -7.604833, 1, 1.5, 0.5, 0.5,
-3.824219, -0.1361262, -7.604833, 0, 1.5, 0.5, 0.5
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
-3.824219, -4.540622, 0.176815, 0, -0.5, 0.5, 0.5,
-3.824219, -4.540622, 0.176815, 1, -0.5, 0.5, 0.5,
-3.824219, -4.540622, 0.176815, 1, 1.5, 0.5, 0.5,
-3.824219, -4.540622, 0.176815, 0, 1.5, 0.5, 0.5
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
-2, -3.524199, -5.809068,
3, -3.524199, -5.809068,
-2, -3.524199, -5.809068,
-2, -3.693603, -6.108362,
-1, -3.524199, -5.809068,
-1, -3.693603, -6.108362,
0, -3.524199, -5.809068,
0, -3.693603, -6.108362,
1, -3.524199, -5.809068,
1, -3.693603, -6.108362,
2, -3.524199, -5.809068,
2, -3.693603, -6.108362,
3, -3.524199, -5.809068,
3, -3.693603, -6.108362
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
-2, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
-2, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
-2, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
-2, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5,
-1, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
-1, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
-1, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
-1, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5,
0, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
0, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
0, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
0, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5,
1, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
1, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
1, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
1, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5,
2, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
2, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
2, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
2, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5,
3, -4.032411, -6.70695, 0, -0.5, 0.5, 0.5,
3, -4.032411, -6.70695, 1, -0.5, 0.5, 0.5,
3, -4.032411, -6.70695, 1, 1.5, 0.5, 0.5,
3, -4.032411, -6.70695, 0, 1.5, 0.5, 0.5
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
-2.867711, -3, -5.809068,
-2.867711, 3, -5.809068,
-2.867711, -3, -5.809068,
-3.027129, -3, -6.108362,
-2.867711, -2, -5.809068,
-3.027129, -2, -6.108362,
-2.867711, -1, -5.809068,
-3.027129, -1, -6.108362,
-2.867711, 0, -5.809068,
-3.027129, 0, -6.108362,
-2.867711, 1, -5.809068,
-3.027129, 1, -6.108362,
-2.867711, 2, -5.809068,
-3.027129, 2, -6.108362,
-2.867711, 3, -5.809068,
-3.027129, 3, -6.108362
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
-3.345965, -3, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, -3, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, -3, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, -3, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, -2, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, -2, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, -2, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, -2, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, -1, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, -1, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, -1, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, -1, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, 0, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, 0, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, 0, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, 0, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, 1, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, 1, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, 1, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, 1, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, 2, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, 2, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, 2, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, 2, -6.70695, 0, 1.5, 0.5, 0.5,
-3.345965, 3, -6.70695, 0, -0.5, 0.5, 0.5,
-3.345965, 3, -6.70695, 1, -0.5, 0.5, 0.5,
-3.345965, 3, -6.70695, 1, 1.5, 0.5, 0.5,
-3.345965, 3, -6.70695, 0, 1.5, 0.5, 0.5
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
-2.867711, -3.524199, -4,
-2.867711, -3.524199, 4,
-2.867711, -3.524199, -4,
-3.027129, -3.693603, -4,
-2.867711, -3.524199, -2,
-3.027129, -3.693603, -2,
-2.867711, -3.524199, 0,
-3.027129, -3.693603, 0,
-2.867711, -3.524199, 2,
-3.027129, -3.693603, 2,
-2.867711, -3.524199, 4,
-3.027129, -3.693603, 4
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
-3.345965, -4.032411, -4, 0, -0.5, 0.5, 0.5,
-3.345965, -4.032411, -4, 1, -0.5, 0.5, 0.5,
-3.345965, -4.032411, -4, 1, 1.5, 0.5, 0.5,
-3.345965, -4.032411, -4, 0, 1.5, 0.5, 0.5,
-3.345965, -4.032411, -2, 0, -0.5, 0.5, 0.5,
-3.345965, -4.032411, -2, 1, -0.5, 0.5, 0.5,
-3.345965, -4.032411, -2, 1, 1.5, 0.5, 0.5,
-3.345965, -4.032411, -2, 0, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 0, 0, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 0, 1, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 0, 1, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 0, 0, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 2, 0, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 2, 1, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 2, 1, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 2, 0, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 4, 0, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 4, 1, -0.5, 0.5, 0.5,
-3.345965, -4.032411, 4, 1, 1.5, 0.5, 0.5,
-3.345965, -4.032411, 4, 0, 1.5, 0.5, 0.5
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
-2.867711, -3.524199, -5.809068,
-2.867711, 3.251947, -5.809068,
-2.867711, -3.524199, 6.162698,
-2.867711, 3.251947, 6.162698,
-2.867711, -3.524199, -5.809068,
-2.867711, -3.524199, 6.162698,
-2.867711, 3.251947, -5.809068,
-2.867711, 3.251947, 6.162698,
-2.867711, -3.524199, -5.809068,
3.509014, -3.524199, -5.809068,
-2.867711, -3.524199, 6.162698,
3.509014, -3.524199, 6.162698,
-2.867711, 3.251947, -5.809068,
3.509014, 3.251947, -5.809068,
-2.867711, 3.251947, 6.162698,
3.509014, 3.251947, 6.162698,
3.509014, -3.524199, -5.809068,
3.509014, 3.251947, -5.809068,
3.509014, -3.524199, 6.162698,
3.509014, 3.251947, 6.162698,
3.509014, -3.524199, -5.809068,
3.509014, -3.524199, 6.162698,
3.509014, 3.251947, -5.809068,
3.509014, 3.251947, 6.162698
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
var radius = 8.09649;
var distance = 36.0222;
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
mvMatrix.translate( -0.3206517, 0.1361262, -0.176815 );
mvMatrix.scale( 1.372818, 1.291897, 0.7312275 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0222);
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
tetrasul<-read.table("tetrasul.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetrasul$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetrasul' not found
```

```r
y<-tetrasul$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetrasul' not found
```

```r
z<-tetrasul$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetrasul' not found
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
-2.774846, -1.363603, -1.257762, 0, 0, 1, 1, 1,
-2.456295, 1.616161, -1.987726, 1, 0, 0, 1, 1,
-2.384292, 0.1791936, -1.921586, 1, 0, 0, 1, 1,
-2.360928, 0.2515651, -1.522511, 1, 0, 0, 1, 1,
-2.337501, -0.3025599, -3.054086, 1, 0, 0, 1, 1,
-2.269363, 2.228168, -2.308841, 1, 0, 0, 1, 1,
-2.246496, 1.563326, -1.924697, 0, 0, 0, 1, 1,
-2.196151, 0.4189854, -1.800563, 0, 0, 0, 1, 1,
-2.152841, 0.1235389, -0.1807895, 0, 0, 0, 1, 1,
-2.1187, -0.3302434, -2.599491, 0, 0, 0, 1, 1,
-2.106971, 0.7606064, -3.295937, 0, 0, 0, 1, 1,
-2.049983, 0.1966438, -2.250757, 0, 0, 0, 1, 1,
-1.993898, 1.481289, -3.774704, 0, 0, 0, 1, 1,
-1.991503, -0.4840338, -2.278559, 1, 1, 1, 1, 1,
-1.984005, -0.3683859, -2.23572, 1, 1, 1, 1, 1,
-1.971316, 0.6111772, -0.07586969, 1, 1, 1, 1, 1,
-1.966241, -0.7019563, -1.052926, 1, 1, 1, 1, 1,
-1.955426, 0.4689389, -2.001212, 1, 1, 1, 1, 1,
-1.951603, 1.372615, -0.1242017, 1, 1, 1, 1, 1,
-1.920492, 1.756976, -0.2872194, 1, 1, 1, 1, 1,
-1.901435, 0.5021638, -0.7554327, 1, 1, 1, 1, 1,
-1.896415, -0.1035592, -2.485743, 1, 1, 1, 1, 1,
-1.895288, 1.118073, -0.7263203, 1, 1, 1, 1, 1,
-1.891545, 0.4197946, -0.8135344, 1, 1, 1, 1, 1,
-1.867478, -0.5430773, -1.965812, 1, 1, 1, 1, 1,
-1.855629, -0.7701486, -3.141927, 1, 1, 1, 1, 1,
-1.823541, 0.4886546, -3.667744, 1, 1, 1, 1, 1,
-1.785171, 0.531501, -3.256564, 1, 1, 1, 1, 1,
-1.773349, -0.4054138, -1.454624, 0, 0, 1, 1, 1,
-1.758888, -0.3139251, -0.5680212, 1, 0, 0, 1, 1,
-1.757324, 1.771702, -1.15149, 1, 0, 0, 1, 1,
-1.747635, 0.1009229, -0.5230262, 1, 0, 0, 1, 1,
-1.745295, -0.05056671, -1.929612, 1, 0, 0, 1, 1,
-1.708512, 0.5170023, -0.9502482, 1, 0, 0, 1, 1,
-1.702764, 0.577719, -2.072034, 0, 0, 0, 1, 1,
-1.695372, 1.033562, -0.8945521, 0, 0, 0, 1, 1,
-1.686558, -1.36551, -1.798218, 0, 0, 0, 1, 1,
-1.686282, -0.03062697, -0.5947986, 0, 0, 0, 1, 1,
-1.683913, -0.3748753, -1.385337, 0, 0, 0, 1, 1,
-1.668892, -1.921838, -2.713266, 0, 0, 0, 1, 1,
-1.635159, -0.8413103, -2.387242, 0, 0, 0, 1, 1,
-1.616625, -0.351965, -0.7740264, 1, 1, 1, 1, 1,
-1.607212, -1.147493, -1.77137, 1, 1, 1, 1, 1,
-1.597769, -1.059941, -3.010057, 1, 1, 1, 1, 1,
-1.556543, -1.848815, -3.098465, 1, 1, 1, 1, 1,
-1.553219, 0.6128948, -2.799545, 1, 1, 1, 1, 1,
-1.551701, -0.2095434, -1.507932, 1, 1, 1, 1, 1,
-1.54848, -0.7201543, -3.121909, 1, 1, 1, 1, 1,
-1.526043, 0.4882801, -0.7936123, 1, 1, 1, 1, 1,
-1.52402, -0.6682574, 0.2112147, 1, 1, 1, 1, 1,
-1.506288, -0.5952475, -1.045455, 1, 1, 1, 1, 1,
-1.504782, 0.8698347, -0.5578774, 1, 1, 1, 1, 1,
-1.493809, -0.6298696, -1.457551, 1, 1, 1, 1, 1,
-1.482107, -0.8409402, -3.768034, 1, 1, 1, 1, 1,
-1.468854, -1.208429, -2.729456, 1, 1, 1, 1, 1,
-1.46856, -2.623672, -2.572631, 1, 1, 1, 1, 1,
-1.463176, -0.9535819, -1.961087, 0, 0, 1, 1, 1,
-1.462468, -0.09249687, -0.3611682, 1, 0, 0, 1, 1,
-1.454756, 1.421804, -0.8918392, 1, 0, 0, 1, 1,
-1.448733, -0.7476749, -2.423934, 1, 0, 0, 1, 1,
-1.444883, -0.9741861, -0.5365512, 1, 0, 0, 1, 1,
-1.438051, 0.7463804, -2.628498, 1, 0, 0, 1, 1,
-1.43795, -0.3184691, -2.08458, 0, 0, 0, 1, 1,
-1.436958, -0.4020794, -2.727322, 0, 0, 0, 1, 1,
-1.436398, -0.06281988, -2.436685, 0, 0, 0, 1, 1,
-1.428091, -0.3682234, -2.045617, 0, 0, 0, 1, 1,
-1.413921, -1.431306, -3.855574, 0, 0, 0, 1, 1,
-1.407982, 0.378941, -1.842263, 0, 0, 0, 1, 1,
-1.404385, 0.2248065, -2.195812, 0, 0, 0, 1, 1,
-1.400996, 0.892108, -1.544654, 1, 1, 1, 1, 1,
-1.394358, -1.239671, -0.4788933, 1, 1, 1, 1, 1,
-1.392171, -0.4308994, -3.21402, 1, 1, 1, 1, 1,
-1.390509, 0.5828285, -0.7185477, 1, 1, 1, 1, 1,
-1.385022, 0.8749874, -0.09721463, 1, 1, 1, 1, 1,
-1.380388, 1.451392, -0.491781, 1, 1, 1, 1, 1,
-1.369285, -0.1827297, -1.143643, 1, 1, 1, 1, 1,
-1.350889, -0.8300517, -0.3102976, 1, 1, 1, 1, 1,
-1.350748, 0.4818186, -1.841003, 1, 1, 1, 1, 1,
-1.347679, 0.6962327, -1.253543, 1, 1, 1, 1, 1,
-1.32355, 1.582416, -0.2395621, 1, 1, 1, 1, 1,
-1.323125, -0.01664154, -1.546197, 1, 1, 1, 1, 1,
-1.321314, -0.1845848, -3.094323, 1, 1, 1, 1, 1,
-1.320549, 0.006020899, -2.615551, 1, 1, 1, 1, 1,
-1.319317, -0.1387465, -2.200196, 1, 1, 1, 1, 1,
-1.316141, -0.6710806, -2.124904, 0, 0, 1, 1, 1,
-1.305381, -0.3447549, -1.991941, 1, 0, 0, 1, 1,
-1.302264, -0.1056362, -2.568768, 1, 0, 0, 1, 1,
-1.296311, 0.7164528, -2.518981, 1, 0, 0, 1, 1,
-1.293723, 0.1635644, -2.355573, 1, 0, 0, 1, 1,
-1.290492, 0.8244034, -2.553715, 1, 0, 0, 1, 1,
-1.288091, 0.04083209, -1.083267, 0, 0, 0, 1, 1,
-1.280845, 1.174406, 0.3905114, 0, 0, 0, 1, 1,
-1.263058, 0.6992307, -0.6448603, 0, 0, 0, 1, 1,
-1.262881, -0.6135828, -3.409157, 0, 0, 0, 1, 1,
-1.255953, 1.448645, -0.9251785, 0, 0, 0, 1, 1,
-1.255188, 0.2346515, -1.486249, 0, 0, 0, 1, 1,
-1.251016, -0.228914, -1.82518, 0, 0, 0, 1, 1,
-1.249566, -0.5817059, -1.156309, 1, 1, 1, 1, 1,
-1.248962, -2.732609, -2.581501, 1, 1, 1, 1, 1,
-1.240103, -1.00894, -2.17657, 1, 1, 1, 1, 1,
-1.237907, -0.2395352, -3.214005, 1, 1, 1, 1, 1,
-1.233502, -0.3718273, -2.52297, 1, 1, 1, 1, 1,
-1.222348, 1.137113, -1.638833, 1, 1, 1, 1, 1,
-1.222241, 0.9817299, -0.9863521, 1, 1, 1, 1, 1,
-1.220029, 0.5104625, -2.352893, 1, 1, 1, 1, 1,
-1.215552, -0.330474, -2.540169, 1, 1, 1, 1, 1,
-1.212138, 0.2257615, -0.6386455, 1, 1, 1, 1, 1,
-1.212073, 0.3373864, 1.88478, 1, 1, 1, 1, 1,
-1.211777, 1.020454, 0.09814699, 1, 1, 1, 1, 1,
-1.209863, -1.763335, -2.674777, 1, 1, 1, 1, 1,
-1.197126, 0.2425612, -0.1304903, 1, 1, 1, 1, 1,
-1.190033, -0.3229257, 0.3672927, 1, 1, 1, 1, 1,
-1.187961, -0.7696226, -1.501068, 0, 0, 1, 1, 1,
-1.177068, -1.984886, -2.879593, 1, 0, 0, 1, 1,
-1.17353, 0.7815767, 0.07991723, 1, 0, 0, 1, 1,
-1.161534, 0.5077176, -1.98721, 1, 0, 0, 1, 1,
-1.15616, 1.349392, -0.5048744, 1, 0, 0, 1, 1,
-1.153571, -0.5158466, -3.764098, 1, 0, 0, 1, 1,
-1.14748, 1.972201, -1.284807, 0, 0, 0, 1, 1,
-1.146546, -0.4528033, -0.9115553, 0, 0, 0, 1, 1,
-1.140999, 0.6438425, -1.114788, 0, 0, 0, 1, 1,
-1.140432, -0.495213, -0.4976206, 0, 0, 0, 1, 1,
-1.129759, -0.2375808, -0.8112863, 0, 0, 0, 1, 1,
-1.123083, 0.456132, -2.607243, 0, 0, 0, 1, 1,
-1.121371, 0.5756009, -2.678896, 0, 0, 0, 1, 1,
-1.120283, 0.679441, 0.7426038, 1, 1, 1, 1, 1,
-1.101582, -0.5299342, -2.216604, 1, 1, 1, 1, 1,
-1.099287, -0.3270604, -2.442571, 1, 1, 1, 1, 1,
-1.093413, -1.691346, -2.861718, 1, 1, 1, 1, 1,
-1.092679, 0.01478044, -1.578379, 1, 1, 1, 1, 1,
-1.091203, -1.859001, -4.582204, 1, 1, 1, 1, 1,
-1.090355, -0.6821271, -2.284689, 1, 1, 1, 1, 1,
-1.08034, 0.931605, -2.986287, 1, 1, 1, 1, 1,
-1.072516, 0.3913061, -0.1227304, 1, 1, 1, 1, 1,
-1.064484, 0.8455574, -1.916395, 1, 1, 1, 1, 1,
-1.062284, -0.2223869, -1.33749, 1, 1, 1, 1, 1,
-1.060549, -0.4346808, -0.7792773, 1, 1, 1, 1, 1,
-1.058802, 1.455689, -0.3334294, 1, 1, 1, 1, 1,
-1.057806, -0.8545834, -1.196037, 1, 1, 1, 1, 1,
-1.055322, -0.3224435, -2.984051, 1, 1, 1, 1, 1,
-1.050516, 0.6814476, -1.093094, 0, 0, 1, 1, 1,
-1.040981, -1.716558, -2.933471, 1, 0, 0, 1, 1,
-1.036792, 0.4241555, -0.9504542, 1, 0, 0, 1, 1,
-1.032272, 0.7133192, -0.7083218, 1, 0, 0, 1, 1,
-1.031325, -1.141664, -2.599542, 1, 0, 0, 1, 1,
-1.030921, 0.7094007, -0.4631826, 1, 0, 0, 1, 1,
-1.030544, 0.6473193, -2.301244, 0, 0, 0, 1, 1,
-1.025123, 0.5726112, 1.045847, 0, 0, 0, 1, 1,
-1.025056, 0.3399847, -0.06541879, 0, 0, 0, 1, 1,
-1.019669, -1.028108, -1.741024, 0, 0, 0, 1, 1,
-1.019328, -1.014974, -1.335414, 0, 0, 0, 1, 1,
-1.019081, 2.557662, -0.3250721, 0, 0, 0, 1, 1,
-1.013234, -0.3514369, -2.458599, 0, 0, 0, 1, 1,
-1.012344, -1.490804, -2.555253, 1, 1, 1, 1, 1,
-1.009901, 0.1755258, -1.697734, 1, 1, 1, 1, 1,
-1.003483, -1.198065, 0.0135229, 1, 1, 1, 1, 1,
-1.002446, 0.1033537, -1.389213, 1, 1, 1, 1, 1,
-0.9988943, -0.03871141, -3.485155, 1, 1, 1, 1, 1,
-0.9914205, -1.18448, -4.736826, 1, 1, 1, 1, 1,
-0.9718823, 0.8233433, -1.358179, 1, 1, 1, 1, 1,
-0.9682396, 1.04138, -2.206117, 1, 1, 1, 1, 1,
-0.9535961, 0.70625, -1.201538, 1, 1, 1, 1, 1,
-0.9498603, 0.7449781, -1.772671, 1, 1, 1, 1, 1,
-0.942071, -0.7945033, -3.871424, 1, 1, 1, 1, 1,
-0.9419679, 0.528547, -0.2400675, 1, 1, 1, 1, 1,
-0.9396002, 0.2206794, -0.7694561, 1, 1, 1, 1, 1,
-0.9276803, -0.4166974, -3.261034, 1, 1, 1, 1, 1,
-0.9200374, -1.320392, -1.851409, 1, 1, 1, 1, 1,
-0.918363, 0.331439, -0.2587315, 0, 0, 1, 1, 1,
-0.917944, 1.410189, 0.3661286, 1, 0, 0, 1, 1,
-0.9144363, 1.014712, -0.9995002, 1, 0, 0, 1, 1,
-0.9116796, 1.111017, -0.433176, 1, 0, 0, 1, 1,
-0.9099421, -0.5837986, -2.820997, 1, 0, 0, 1, 1,
-0.9085045, -0.2274282, -1.038273, 1, 0, 0, 1, 1,
-0.904717, -1.265334, -1.645456, 0, 0, 0, 1, 1,
-0.8994207, -0.1485859, 0.9408948, 0, 0, 0, 1, 1,
-0.8841909, 2.303705, -0.5779542, 0, 0, 0, 1, 1,
-0.880057, 0.02541283, -1.238975, 0, 0, 0, 1, 1,
-0.8756879, 0.8602868, 0.4200317, 0, 0, 0, 1, 1,
-0.8720778, -0.3372855, -1.678169, 0, 0, 0, 1, 1,
-0.8714784, 0.5504228, -1.508871, 0, 0, 0, 1, 1,
-0.8653194, 0.8914936, -1.178941, 1, 1, 1, 1, 1,
-0.8550825, -0.742573, -1.031627, 1, 1, 1, 1, 1,
-0.8535944, -0.9104164, -2.501462, 1, 1, 1, 1, 1,
-0.848767, -2.457327, -4.099934, 1, 1, 1, 1, 1,
-0.847542, 0.9318726, -0.1345438, 1, 1, 1, 1, 1,
-0.8470892, -0.241562, -0.3150342, 1, 1, 1, 1, 1,
-0.8444765, -0.8382205, -4.828331, 1, 1, 1, 1, 1,
-0.8428647, 0.8098374, -3.167663, 1, 1, 1, 1, 1,
-0.8414447, 0.7176992, 0.3743268, 1, 1, 1, 1, 1,
-0.8384452, -0.5121475, -1.527051, 1, 1, 1, 1, 1,
-0.8379717, -1.145715, -2.04084, 1, 1, 1, 1, 1,
-0.8309225, -0.5367886, -3.981838, 1, 1, 1, 1, 1,
-0.8285933, 1.624558, -1.476432, 1, 1, 1, 1, 1,
-0.8283207, 1.444981, -0.6431994, 1, 1, 1, 1, 1,
-0.8260175, 0.09102309, -2.293811, 1, 1, 1, 1, 1,
-0.8181192, 2.168917, -0.7646924, 0, 0, 1, 1, 1,
-0.8142852, -1.217371, -1.832771, 1, 0, 0, 1, 1,
-0.8090233, -1.361191, -1.963426, 1, 0, 0, 1, 1,
-0.8077019, 1.239557, -0.9719533, 1, 0, 0, 1, 1,
-0.8072742, -0.6868091, 0.1227555, 1, 0, 0, 1, 1,
-0.8071337, -0.4873708, -2.791918, 1, 0, 0, 1, 1,
-0.8048944, -1.609123, -1.034809, 0, 0, 0, 1, 1,
-0.8025616, 0.5798306, -1.078352, 0, 0, 0, 1, 1,
-0.7972193, 0.2895946, -0.6799469, 0, 0, 0, 1, 1,
-0.7950538, 1.13707, -0.6765615, 0, 0, 0, 1, 1,
-0.7944177, 0.4141701, 0.129642, 0, 0, 0, 1, 1,
-0.7930336, -1.620153, -1.560672, 0, 0, 0, 1, 1,
-0.7928066, -1.541286, -2.027228, 0, 0, 0, 1, 1,
-0.7890345, 0.4953701, -0.4071368, 1, 1, 1, 1, 1,
-0.7843418, -0.55633, -3.771384, 1, 1, 1, 1, 1,
-0.7698383, 0.9044501, -0.8460826, 1, 1, 1, 1, 1,
-0.7654774, -0.7721974, -2.740182, 1, 1, 1, 1, 1,
-0.7647466, 1.601773, 0.4583707, 1, 1, 1, 1, 1,
-0.7595186, -0.08404633, -2.299619, 1, 1, 1, 1, 1,
-0.7594436, 0.8221573, -1.092287, 1, 1, 1, 1, 1,
-0.7555645, -0.8792217, -3.730652, 1, 1, 1, 1, 1,
-0.7548209, 0.6244726, -0.3502055, 1, 1, 1, 1, 1,
-0.7484535, 0.6479961, 0.1184861, 1, 1, 1, 1, 1,
-0.7454246, -0.6232616, -2.356204, 1, 1, 1, 1, 1,
-0.7438722, -0.2889524, -1.901446, 1, 1, 1, 1, 1,
-0.7429, -1.237209, -2.885229, 1, 1, 1, 1, 1,
-0.7377902, -0.5092627, -1.618202, 1, 1, 1, 1, 1,
-0.7370266, -0.109736, -0.07378332, 1, 1, 1, 1, 1,
-0.73589, 0.4739521, -1.536787, 0, 0, 1, 1, 1,
-0.7354974, -0.3255921, -3.083146, 1, 0, 0, 1, 1,
-0.7342697, -0.8763912, 0.07757138, 1, 0, 0, 1, 1,
-0.7331051, -1.342841, -1.465477, 1, 0, 0, 1, 1,
-0.7302444, -0.1191522, -0.8236715, 1, 0, 0, 1, 1,
-0.7299707, -0.0722345, -1.610853, 1, 0, 0, 1, 1,
-0.7294742, 0.1812043, -0.9751738, 0, 0, 0, 1, 1,
-0.7286325, 1.001487, 0.1882243, 0, 0, 0, 1, 1,
-0.713771, 1.084084, -0.300022, 0, 0, 0, 1, 1,
-0.7116143, -0.3387317, -1.032791, 0, 0, 0, 1, 1,
-0.7096049, -2.279579, -2.697404, 0, 0, 0, 1, 1,
-0.7077324, 0.5770392, -2.31249, 0, 0, 0, 1, 1,
-0.7059187, 0.2113363, -0.551461, 0, 0, 0, 1, 1,
-0.7054134, -0.006737166, -0.6355021, 1, 1, 1, 1, 1,
-0.7026671, -1.023782, -1.789928, 1, 1, 1, 1, 1,
-0.7025034, -0.707657, -1.208114, 1, 1, 1, 1, 1,
-0.6997764, 0.3146136, -0.6525267, 1, 1, 1, 1, 1,
-0.6898158, 0.121261, -2.164396, 1, 1, 1, 1, 1,
-0.6820182, -2.863135, -1.682816, 1, 1, 1, 1, 1,
-0.6735409, -1.25003, -2.185803, 1, 1, 1, 1, 1,
-0.6716668, -0.3174729, -1.356298, 1, 1, 1, 1, 1,
-0.6713213, -0.1066674, -2.063798, 1, 1, 1, 1, 1,
-0.6676331, 0.2373411, -1.552, 1, 1, 1, 1, 1,
-0.6625721, 1.185449, 0.4054717, 1, 1, 1, 1, 1,
-0.6553742, 2.186398, 1.222657, 1, 1, 1, 1, 1,
-0.6508541, 0.2496777, -2.37385, 1, 1, 1, 1, 1,
-0.6498026, -0.2572235, -2.76539, 1, 1, 1, 1, 1,
-0.6476041, 0.8882483, -0.9712045, 1, 1, 1, 1, 1,
-0.6459488, -0.1671091, -2.223152, 0, 0, 1, 1, 1,
-0.638344, -1.704665, -4.959471, 1, 0, 0, 1, 1,
-0.637508, -2.08546, -5.034435, 1, 0, 0, 1, 1,
-0.6256812, -0.7495541, -2.415199, 1, 0, 0, 1, 1,
-0.6165186, -1.860499, -4.124189, 1, 0, 0, 1, 1,
-0.6136149, -0.116024, -0.4494562, 1, 0, 0, 1, 1,
-0.6124699, 0.8685724, -0.3677877, 0, 0, 0, 1, 1,
-0.6068665, -1.050169, -2.074169, 0, 0, 0, 1, 1,
-0.6062086, 0.7647428, 0.5237541, 0, 0, 0, 1, 1,
-0.6040114, 0.359853, -2.391192, 0, 0, 0, 1, 1,
-0.6014631, -0.3793485, -0.3501946, 0, 0, 0, 1, 1,
-0.5941077, -1.078812, -3.560989, 0, 0, 0, 1, 1,
-0.5856634, 2.303852, -2.46244, 0, 0, 0, 1, 1,
-0.5855139, 1.06101, -0.7087715, 1, 1, 1, 1, 1,
-0.5852515, 0.9906231, -1.943979, 1, 1, 1, 1, 1,
-0.5845401, 0.481123, -0.5557879, 1, 1, 1, 1, 1,
-0.5840104, 0.878436, -1.185016, 1, 1, 1, 1, 1,
-0.581389, 0.8933454, 0.4508602, 1, 1, 1, 1, 1,
-0.5799515, -0.2934356, -4.614957, 1, 1, 1, 1, 1,
-0.5791422, 0.8374884, -1.958329, 1, 1, 1, 1, 1,
-0.5751854, -0.6180694, -1.491636, 1, 1, 1, 1, 1,
-0.5686306, 0.111701, -0.4215162, 1, 1, 1, 1, 1,
-0.5671036, 1.073535, -0.5837255, 1, 1, 1, 1, 1,
-0.5652471, -1.045869, -2.009779, 1, 1, 1, 1, 1,
-0.5645803, 0.05066374, -0.6830645, 1, 1, 1, 1, 1,
-0.5616125, 1.734241, 0.09130224, 1, 1, 1, 1, 1,
-0.5595651, 0.7230352, -0.7994258, 1, 1, 1, 1, 1,
-0.5595054, 1.354994, -1.023057, 1, 1, 1, 1, 1,
-0.5546528, -1.5373, -3.591332, 0, 0, 1, 1, 1,
-0.5517129, -0.1529524, -2.061974, 1, 0, 0, 1, 1,
-0.5493934, 0.9754276, -1.204792, 1, 0, 0, 1, 1,
-0.5484381, 0.8525493, -0.7608098, 1, 0, 0, 1, 1,
-0.5476257, -0.8088652, -2.555272, 1, 0, 0, 1, 1,
-0.5440282, 0.4006424, -1.621457, 1, 0, 0, 1, 1,
-0.5380087, 0.4127036, -0.6445271, 0, 0, 0, 1, 1,
-0.5366268, -1.534154, -0.4913166, 0, 0, 0, 1, 1,
-0.5356815, 0.5307943, -0.03626268, 0, 0, 0, 1, 1,
-0.5311882, -0.9474124, -1.874184, 0, 0, 0, 1, 1,
-0.5298511, -0.321621, -1.554834, 0, 0, 0, 1, 1,
-0.523977, 1.326729, -2.407034, 0, 0, 0, 1, 1,
-0.5207182, 0.2562087, -0.8226861, 0, 0, 0, 1, 1,
-0.5206504, -2.249762, -2.908569, 1, 1, 1, 1, 1,
-0.5097901, 0.03963957, -0.7988518, 1, 1, 1, 1, 1,
-0.5090801, -0.5709479, -1.11051, 1, 1, 1, 1, 1,
-0.5053717, -0.1682484, -2.416626, 1, 1, 1, 1, 1,
-0.5050572, 0.383311, -1.482846, 1, 1, 1, 1, 1,
-0.5043905, 0.4066847, -0.5959579, 1, 1, 1, 1, 1,
-0.5035999, -0.4477879, -1.69418, 1, 1, 1, 1, 1,
-0.5006919, -1.252492, -2.673291, 1, 1, 1, 1, 1,
-0.4937817, 0.07658157, -0.663295, 1, 1, 1, 1, 1,
-0.490739, -1.257145, -3.353312, 1, 1, 1, 1, 1,
-0.4902336, 1.547301, 1.407343, 1, 1, 1, 1, 1,
-0.4857602, -0.7482831, -2.085549, 1, 1, 1, 1, 1,
-0.4834327, 0.685056, -1.75162, 1, 1, 1, 1, 1,
-0.4823353, 0.8565314, 0.6477795, 1, 1, 1, 1, 1,
-0.4739831, -0.5674204, -3.062186, 1, 1, 1, 1, 1,
-0.467987, -1.337587, -1.639397, 0, 0, 1, 1, 1,
-0.4676602, 1.843132, -0.7560433, 1, 0, 0, 1, 1,
-0.4670139, 0.7945277, -0.7388402, 1, 0, 0, 1, 1,
-0.4634214, 1.843982, -0.7100363, 1, 0, 0, 1, 1,
-0.463213, 0.8417462, -0.4927858, 1, 0, 0, 1, 1,
-0.4626817, -0.4062278, -4.72043, 1, 0, 0, 1, 1,
-0.4616193, 0.3231241, -2.757112, 0, 0, 0, 1, 1,
-0.4607295, 0.1695155, 0.1329797, 0, 0, 0, 1, 1,
-0.4568842, -1.600843, -2.211683, 0, 0, 0, 1, 1,
-0.4567007, -1.049391, -2.827003, 0, 0, 0, 1, 1,
-0.4565789, -0.9895973, -1.40317, 0, 0, 0, 1, 1,
-0.4429866, 0.635564, -1.186728, 0, 0, 0, 1, 1,
-0.4345768, -1.391006, -3.498553, 0, 0, 0, 1, 1,
-0.4343143, 2.948929, 1.183405, 1, 1, 1, 1, 1,
-0.4333377, 2.686629, -0.6142359, 1, 1, 1, 1, 1,
-0.4274108, 0.109664, 0.1651349, 1, 1, 1, 1, 1,
-0.4247212, -0.5845055, -3.915313, 1, 1, 1, 1, 1,
-0.4233344, -0.8575093, -3.113356, 1, 1, 1, 1, 1,
-0.4202339, 1.008599, -0.3765306, 1, 1, 1, 1, 1,
-0.4126838, -0.348212, -4.03617, 1, 1, 1, 1, 1,
-0.4089698, -0.5504552, -3.360403, 1, 1, 1, 1, 1,
-0.4071305, 0.6784192, 0.4478505, 1, 1, 1, 1, 1,
-0.4025707, -1.447755, -2.504557, 1, 1, 1, 1, 1,
-0.4023836, -0.6478621, -3.392679, 1, 1, 1, 1, 1,
-0.4011173, 1.121534, 0.3636836, 1, 1, 1, 1, 1,
-0.3917004, -0.09567503, -0.3422561, 1, 1, 1, 1, 1,
-0.384394, -0.04093989, -0.2603039, 1, 1, 1, 1, 1,
-0.383757, -0.3742437, -2.55992, 1, 1, 1, 1, 1,
-0.3796505, -1.162391, -2.678066, 0, 0, 1, 1, 1,
-0.372021, 0.04326378, -1.634204, 1, 0, 0, 1, 1,
-0.3645952, 0.1058672, -1.501821, 1, 0, 0, 1, 1,
-0.3573807, -0.3539786, -2.029204, 1, 0, 0, 1, 1,
-0.3569311, 0.3702606, -0.8077427, 1, 0, 0, 1, 1,
-0.3522782, -0.2277011, -2.178178, 1, 0, 0, 1, 1,
-0.3516124, -0.355854, -2.643571, 0, 0, 0, 1, 1,
-0.3513772, 0.1142122, -0.4859517, 0, 0, 0, 1, 1,
-0.3508438, -1.56495, -2.198556, 0, 0, 0, 1, 1,
-0.3499503, 0.1358861, -1.99736, 0, 0, 0, 1, 1,
-0.3454981, -0.1009505, -2.395207, 0, 0, 0, 1, 1,
-0.3432516, -0.8675436, -3.324154, 0, 0, 0, 1, 1,
-0.3430675, 0.6292982, -0.48207, 0, 0, 0, 1, 1,
-0.3421041, 2.338281, 0.04168129, 1, 1, 1, 1, 1,
-0.3419569, -1.279525, -2.740428, 1, 1, 1, 1, 1,
-0.3418288, 0.05780255, -0.2160905, 1, 1, 1, 1, 1,
-0.3412083, 1.004935, -3.367119, 1, 1, 1, 1, 1,
-0.3331437, -0.8634313, -3.23533, 1, 1, 1, 1, 1,
-0.3319769, 0.1055405, -0.8077408, 1, 1, 1, 1, 1,
-0.3294087, 1.289293, 0.8956751, 1, 1, 1, 1, 1,
-0.3224343, -0.05286871, -1.257561, 1, 1, 1, 1, 1,
-0.3223379, -0.1655483, -2.41222, 1, 1, 1, 1, 1,
-0.3197417, 0.579551, -0.6504165, 1, 1, 1, 1, 1,
-0.3184279, -1.899863, -3.040064, 1, 1, 1, 1, 1,
-0.3087727, 1.368759, 0.8506064, 1, 1, 1, 1, 1,
-0.3053654, -0.8520986, -0.4088191, 1, 1, 1, 1, 1,
-0.3043002, -0.04838661, -0.5793135, 1, 1, 1, 1, 1,
-0.2996564, 0.3266695, -0.2113438, 1, 1, 1, 1, 1,
-0.2992613, 1.377006, 1.024809, 0, 0, 1, 1, 1,
-0.2965896, -0.567894, -3.315572, 1, 0, 0, 1, 1,
-0.2947752, -0.7368305, -2.101487, 1, 0, 0, 1, 1,
-0.2887925, -0.1930066, -2.633552, 1, 0, 0, 1, 1,
-0.2884273, -0.2040113, -2.378229, 1, 0, 0, 1, 1,
-0.2862218, -0.6989048, -3.402781, 1, 0, 0, 1, 1,
-0.2836507, 0.3980769, -0.9325829, 0, 0, 0, 1, 1,
-0.2804412, -1.606702, -3.095985, 0, 0, 0, 1, 1,
-0.2771001, -0.4610852, -3.875849, 0, 0, 0, 1, 1,
-0.2755661, 0.7586732, 0.05724691, 0, 0, 0, 1, 1,
-0.268814, 0.5810431, -0.7685807, 0, 0, 0, 1, 1,
-0.2649372, -0.4844333, -2.896491, 0, 0, 0, 1, 1,
-0.2576427, -1.095751, -3.749344, 0, 0, 0, 1, 1,
-0.2553517, 1.480158, -0.721606, 1, 1, 1, 1, 1,
-0.2527196, 1.404, 1.12925, 1, 1, 1, 1, 1,
-0.2509373, 0.787591, -0.5699545, 1, 1, 1, 1, 1,
-0.2492968, 0.6739021, -1.218004, 1, 1, 1, 1, 1,
-0.240284, 0.4096993, -1.409222, 1, 1, 1, 1, 1,
-0.2390483, -0.4515838, -4.190792, 1, 1, 1, 1, 1,
-0.2380876, -0.4979979, -3.370719, 1, 1, 1, 1, 1,
-0.2370372, -0.8360505, -5.634722, 1, 1, 1, 1, 1,
-0.2318558, 0.8867427, -2.242474, 1, 1, 1, 1, 1,
-0.2253429, 0.8102088, 0.0163293, 1, 1, 1, 1, 1,
-0.2250194, 1.504968, -0.9953067, 1, 1, 1, 1, 1,
-0.2248598, -2.255114, -2.226291, 1, 1, 1, 1, 1,
-0.2244504, 1.064128, -0.436584, 1, 1, 1, 1, 1,
-0.2232597, -0.4047718, -1.584363, 1, 1, 1, 1, 1,
-0.2205318, 1.993906, -2.063137, 1, 1, 1, 1, 1,
-0.2189011, 0.690482, -0.4693258, 0, 0, 1, 1, 1,
-0.2160618, 2.037273, 0.06665283, 1, 0, 0, 1, 1,
-0.2158421, -0.4149118, -2.385294, 1, 0, 0, 1, 1,
-0.2152895, -0.7942995, -3.736319, 1, 0, 0, 1, 1,
-0.212211, 0.00860205, -0.7639574, 1, 0, 0, 1, 1,
-0.2087763, 0.09439958, -1.587986, 1, 0, 0, 1, 1,
-0.2045896, -0.5865276, -1.48362, 0, 0, 0, 1, 1,
-0.2035159, 0.4906608, -0.3205794, 0, 0, 0, 1, 1,
-0.2008107, -0.98693, -4.454451, 0, 0, 0, 1, 1,
-0.1960293, -1.535613, -2.827286, 0, 0, 0, 1, 1,
-0.1953052, 0.09353324, -2.701568, 0, 0, 0, 1, 1,
-0.1943401, 0.2706282, -0.01726494, 0, 0, 0, 1, 1,
-0.1907008, 2.702453, -2.194775, 0, 0, 0, 1, 1,
-0.1902688, 0.06203049, -0.265983, 1, 1, 1, 1, 1,
-0.1884126, -0.4894606, -1.421412, 1, 1, 1, 1, 1,
-0.188082, -0.3012087, -2.704444, 1, 1, 1, 1, 1,
-0.1863373, 0.6703823, 0.6199773, 1, 1, 1, 1, 1,
-0.1860589, -0.9572117, -2.680492, 1, 1, 1, 1, 1,
-0.1850626, 0.6492602, -1.790537, 1, 1, 1, 1, 1,
-0.1803019, -0.2473333, -1.142856, 1, 1, 1, 1, 1,
-0.1764124, -0.7111465, -3.262015, 1, 1, 1, 1, 1,
-0.1763256, -1.185532, -2.31213, 1, 1, 1, 1, 1,
-0.1740166, 1.342349, -0.5055995, 1, 1, 1, 1, 1,
-0.1736079, 0.4342816, -0.9441606, 1, 1, 1, 1, 1,
-0.1625611, 0.8701913, 0.4602627, 1, 1, 1, 1, 1,
-0.1599875, 0.290609, -1.289154, 1, 1, 1, 1, 1,
-0.1585273, -0.8598878, -1.634516, 1, 1, 1, 1, 1,
-0.1564512, -0.1372488, -3.643714, 1, 1, 1, 1, 1,
-0.1562506, 0.4665887, -1.685774, 0, 0, 1, 1, 1,
-0.1551962, 1.458794, -0.1028279, 1, 0, 0, 1, 1,
-0.1537944, -0.388154, -2.056504, 1, 0, 0, 1, 1,
-0.1533672, 1.40332, -0.8488961, 1, 0, 0, 1, 1,
-0.1493283, 0.736836, 0.8425418, 1, 0, 0, 1, 1,
-0.1461913, -0.06475537, -3.455657, 1, 0, 0, 1, 1,
-0.1454595, -1.077934, -3.345143, 0, 0, 0, 1, 1,
-0.1445321, -2.484879, -2.622516, 0, 0, 0, 1, 1,
-0.1434931, 0.4123116, 0.4573398, 0, 0, 0, 1, 1,
-0.1434255, -0.8374928, -3.157397, 0, 0, 0, 1, 1,
-0.1423927, 0.4521062, 0.7094908, 0, 0, 0, 1, 1,
-0.1386954, -1.30156, -2.886156, 0, 0, 0, 1, 1,
-0.1371063, 0.6015591, 0.7722443, 0, 0, 0, 1, 1,
-0.1355028, -0.454877, -1.662222, 1, 1, 1, 1, 1,
-0.1328278, -1.238481, -3.141242, 1, 1, 1, 1, 1,
-0.1304695, 3.138907, -0.3320765, 1, 1, 1, 1, 1,
-0.1269902, -0.9706259, -4.614985, 1, 1, 1, 1, 1,
-0.1255765, -0.3742096, -3.319963, 1, 1, 1, 1, 1,
-0.125553, 0.4296726, -1.186039, 1, 1, 1, 1, 1,
-0.1242822, -0.4499426, -3.210148, 1, 1, 1, 1, 1,
-0.1197147, -0.4787776, -4.225465, 1, 1, 1, 1, 1,
-0.1189308, 0.2345401, 0.9064865, 1, 1, 1, 1, 1,
-0.1159783, 0.795913, 0.924426, 1, 1, 1, 1, 1,
-0.1136148, -0.5620236, -3.16546, 1, 1, 1, 1, 1,
-0.1103088, 0.105192, -0.8251142, 1, 1, 1, 1, 1,
-0.1030305, -0.3724035, -3.125666, 1, 1, 1, 1, 1,
-0.10134, -1.26167, -2.530245, 1, 1, 1, 1, 1,
-0.09955873, -0.6006913, -4.23696, 1, 1, 1, 1, 1,
-0.09906774, -0.7696183, -3.495937, 0, 0, 1, 1, 1,
-0.09761132, -0.4391463, -3.597192, 1, 0, 0, 1, 1,
-0.09445624, 0.7163734, 0.3624611, 1, 0, 0, 1, 1,
-0.09404632, 0.05390894, -2.045243, 1, 0, 0, 1, 1,
-0.09207574, 0.5862033, -0.3909802, 1, 0, 0, 1, 1,
-0.08938662, 3.153265, -0.466038, 1, 0, 0, 1, 1,
-0.08891459, -0.204375, -1.824967, 0, 0, 0, 1, 1,
-0.08835883, 0.8827513, 0.0002806123, 0, 0, 0, 1, 1,
-0.08818845, -1.401006, -2.499959, 0, 0, 0, 1, 1,
-0.08221855, 0.2221609, 0.06108596, 0, 0, 0, 1, 1,
-0.08220225, 0.277508, 2.650484, 0, 0, 0, 1, 1,
-0.08039803, -0.1634764, -3.542285, 0, 0, 0, 1, 1,
-0.07519452, 1.726918, -0.3811994, 0, 0, 0, 1, 1,
-0.06660701, -0.02058331, -0.8042538, 1, 1, 1, 1, 1,
-0.06200109, -0.5682449, -2.522312, 1, 1, 1, 1, 1,
-0.06195004, -0.2970974, -5.18314, 1, 1, 1, 1, 1,
-0.06145769, 0.01047953, -1.586228, 1, 1, 1, 1, 1,
-0.06110062, -1.03039, -3.959194, 1, 1, 1, 1, 1,
-0.05460269, -0.07986306, -2.626998, 1, 1, 1, 1, 1,
-0.05147575, 0.8485603, -0.3209954, 1, 1, 1, 1, 1,
-0.04963599, -1.52035, -4.517179, 1, 1, 1, 1, 1,
-0.04604596, 1.056204, 0.5299674, 1, 1, 1, 1, 1,
-0.04245159, 1.443973, 1.059844, 1, 1, 1, 1, 1,
-0.03477185, 0.6699099, 1.383604, 1, 1, 1, 1, 1,
-0.03318713, 1.376613, -1.045538, 1, 1, 1, 1, 1,
-0.03135245, 0.136107, -1.097436, 1, 1, 1, 1, 1,
-0.03100479, 0.482928, -0.855081, 1, 1, 1, 1, 1,
-0.0279223, -1.678824, -3.953154, 1, 1, 1, 1, 1,
-0.02559576, 0.2840198, -0.6134919, 0, 0, 1, 1, 1,
-0.02309893, -1.022538, -3.568726, 1, 0, 0, 1, 1,
-0.02299006, -0.002869939, -1.746399, 1, 0, 0, 1, 1,
-0.02018268, 1.377256, -1.027424, 1, 0, 0, 1, 1,
-0.01967627, 0.04703296, -0.9896966, 1, 0, 0, 1, 1,
-0.01781016, -2.350454, -3.098224, 1, 0, 0, 1, 1,
-0.01707161, 1.193637, 0.741255, 0, 0, 0, 1, 1,
-0.0168046, -0.2853817, -3.095512, 0, 0, 0, 1, 1,
-0.01489519, -0.7150609, -2.998638, 0, 0, 0, 1, 1,
-0.01290281, -1.27113, -2.806834, 0, 0, 0, 1, 1,
-0.01215972, -3.425518, -4.796847, 0, 0, 0, 1, 1,
-0.01163035, -0.6519813, -2.960018, 0, 0, 0, 1, 1,
-0.01031163, -0.9872849, -3.208951, 0, 0, 0, 1, 1,
-0.008549836, 1.228385, -1.565355, 1, 1, 1, 1, 1,
-0.003498188, -1.21536, -1.30523, 1, 1, 1, 1, 1,
-0.003155124, 0.07230326, -1.524583, 1, 1, 1, 1, 1,
0.001311164, 0.009082787, 1.249918, 1, 1, 1, 1, 1,
0.002547298, 0.6518683, -0.9491804, 1, 1, 1, 1, 1,
0.003005541, -0.6915832, 5.988352, 1, 1, 1, 1, 1,
0.003512515, -0.633303, 2.631827, 1, 1, 1, 1, 1,
0.003961934, -0.5659063, 2.627529, 1, 1, 1, 1, 1,
0.00492799, -0.5626203, 3.106375, 1, 1, 1, 1, 1,
0.01284301, -1.588378, 2.317993, 1, 1, 1, 1, 1,
0.01289137, 0.273031, 1.234354, 1, 1, 1, 1, 1,
0.01341145, 0.9380222, -0.931624, 1, 1, 1, 1, 1,
0.01372823, 0.1674443, 0.3082805, 1, 1, 1, 1, 1,
0.01938268, -2.029677, 3.866796, 1, 1, 1, 1, 1,
0.02267932, -2.215332, 1.624233, 1, 1, 1, 1, 1,
0.02293111, 0.6021593, 0.6488039, 0, 0, 1, 1, 1,
0.02526451, -1.220954, 1.456728, 1, 0, 0, 1, 1,
0.02785953, 0.2272974, -0.4908026, 1, 0, 0, 1, 1,
0.03049844, -0.424588, 3.887839, 1, 0, 0, 1, 1,
0.03302751, 0.4618507, 1.752732, 1, 0, 0, 1, 1,
0.0338304, -1.889822, 1.900512, 1, 0, 0, 1, 1,
0.03548352, -1.421302, 3.901037, 0, 0, 0, 1, 1,
0.0387125, -1.369562, 4.203443, 0, 0, 0, 1, 1,
0.03958716, -0.8023717, 2.62388, 0, 0, 0, 1, 1,
0.04008876, 0.859778, 1.446011, 0, 0, 0, 1, 1,
0.04217973, 1.339081, 1.322512, 0, 0, 0, 1, 1,
0.04480515, 0.8178164, 0.2172674, 0, 0, 0, 1, 1,
0.04769599, 0.9124801, 0.3575315, 0, 0, 0, 1, 1,
0.04926616, -1.121369, 2.588412, 1, 1, 1, 1, 1,
0.05435043, 0.6721721, -1.301144, 1, 1, 1, 1, 1,
0.05692597, -1.222026, 2.758771, 1, 1, 1, 1, 1,
0.05874823, -0.6823182, 3.957614, 1, 1, 1, 1, 1,
0.06252321, 0.1845837, 0.03035101, 1, 1, 1, 1, 1,
0.06259578, 0.1321227, -0.9492446, 1, 1, 1, 1, 1,
0.06760843, -0.4855357, 3.162691, 1, 1, 1, 1, 1,
0.06887937, -0.2657824, 3.004224, 1, 1, 1, 1, 1,
0.06968526, -0.4705865, 2.499362, 1, 1, 1, 1, 1,
0.07196683, -0.05399058, 0.004137144, 1, 1, 1, 1, 1,
0.07220649, 0.8789302, -0.6153263, 1, 1, 1, 1, 1,
0.07649298, -0.1123765, 1.743217, 1, 1, 1, 1, 1,
0.07871667, -2.628532, 4.5244, 1, 1, 1, 1, 1,
0.07959692, -0.233065, 2.702584, 1, 1, 1, 1, 1,
0.07984615, -0.4255821, 3.529436, 1, 1, 1, 1, 1,
0.08624123, 0.1804458, -0.2080176, 0, 0, 1, 1, 1,
0.08899044, -0.7956822, 3.86797, 1, 0, 0, 1, 1,
0.09215458, -0.1082842, 3.490583, 1, 0, 0, 1, 1,
0.092637, 0.283159, 0.00383063, 1, 0, 0, 1, 1,
0.09437041, 1.875111, 0.05956376, 1, 0, 0, 1, 1,
0.09604315, 0.1048515, -1.006948, 1, 0, 0, 1, 1,
0.09925711, 1.350969, -1.209393, 0, 0, 0, 1, 1,
0.1006357, 1.012488, -1.811937, 0, 0, 0, 1, 1,
0.1023414, -0.06887909, 1.449089, 0, 0, 0, 1, 1,
0.1035053, -1.755471, 1.751538, 0, 0, 0, 1, 1,
0.112609, -1.152824, 2.350428, 0, 0, 0, 1, 1,
0.1131702, 0.8664055, -0.1829177, 0, 0, 0, 1, 1,
0.1138142, -0.7247123, 4.222377, 0, 0, 0, 1, 1,
0.1164612, 0.1301251, 0.5731855, 1, 1, 1, 1, 1,
0.1166015, -1.862238, 3.205974, 1, 1, 1, 1, 1,
0.1219948, -0.5571302, 1.336839, 1, 1, 1, 1, 1,
0.1246355, 0.6002793, 1.040393, 1, 1, 1, 1, 1,
0.1259526, 1.206508, 0.5923035, 1, 1, 1, 1, 1,
0.1300728, -0.8215948, 1.642648, 1, 1, 1, 1, 1,
0.1301303, 0.7395586, -1.727637, 1, 1, 1, 1, 1,
0.1329404, -0.6203393, 1.6294, 1, 1, 1, 1, 1,
0.1351068, 0.252938, -0.832786, 1, 1, 1, 1, 1,
0.1351764, -0.5097759, 2.396075, 1, 1, 1, 1, 1,
0.1363612, 0.06790406, 1.106964, 1, 1, 1, 1, 1,
0.1376899, -1.022417, 2.82899, 1, 1, 1, 1, 1,
0.1437542, 0.3253411, 0.6257979, 1, 1, 1, 1, 1,
0.1446767, -0.01065373, 0.2906053, 1, 1, 1, 1, 1,
0.1483441, -0.3857428, 4.904675, 1, 1, 1, 1, 1,
0.1510962, 0.8982237, 1.00234, 0, 0, 1, 1, 1,
0.1615233, -0.9400123, 3.952539, 1, 0, 0, 1, 1,
0.1633027, 0.2012298, -0.7119584, 1, 0, 0, 1, 1,
0.1634806, -0.70047, 2.337279, 1, 0, 0, 1, 1,
0.1669108, 1.539446, 1.073142, 1, 0, 0, 1, 1,
0.1751624, 1.475496, -0.5998339, 1, 0, 0, 1, 1,
0.1790308, -0.5788545, 1.666334, 0, 0, 0, 1, 1,
0.1824908, -0.1466515, 1.51412, 0, 0, 0, 1, 1,
0.1857019, 0.904358, -0.21164, 0, 0, 0, 1, 1,
0.187481, -0.5190467, 3.712016, 0, 0, 0, 1, 1,
0.1883212, -0.6852369, 2.828151, 0, 0, 0, 1, 1,
0.1907719, -1.84669, 3.543775, 0, 0, 0, 1, 1,
0.1942136, -1.094672, 2.832608, 0, 0, 0, 1, 1,
0.1958295, 1.04139, 1.988165, 1, 1, 1, 1, 1,
0.1967382, -1.270067, 3.0783, 1, 1, 1, 1, 1,
0.2006375, -0.7280428, 1.014139, 1, 1, 1, 1, 1,
0.2093922, -0.0351823, 1.48092, 1, 1, 1, 1, 1,
0.2095551, -0.9769127, 3.489987, 1, 1, 1, 1, 1,
0.2109545, -0.2638129, 2.616873, 1, 1, 1, 1, 1,
0.2126883, -0.0418316, 1.079609, 1, 1, 1, 1, 1,
0.2133895, -0.7881339, 2.127597, 1, 1, 1, 1, 1,
0.2147695, -0.5656263, 2.943293, 1, 1, 1, 1, 1,
0.2162741, 1.173593, 0.2521569, 1, 1, 1, 1, 1,
0.2177913, -0.2610376, 1.857815, 1, 1, 1, 1, 1,
0.224118, 0.9008693, 0.1630865, 1, 1, 1, 1, 1,
0.2252029, 0.6398126, 0.914861, 1, 1, 1, 1, 1,
0.2258304, 1.925622, 1.733902, 1, 1, 1, 1, 1,
0.2266081, 0.5690998, 2.484966, 1, 1, 1, 1, 1,
0.2266414, 0.1666492, 0.1130355, 0, 0, 1, 1, 1,
0.2310474, 0.1440331, -0.9117408, 1, 0, 0, 1, 1,
0.2398793, 0.9656022, 0.736131, 1, 0, 0, 1, 1,
0.2508434, 0.2303424, 0.3563225, 1, 0, 0, 1, 1,
0.2522028, -0.8943993, 2.779848, 1, 0, 0, 1, 1,
0.2523735, 0.8255348, -0.8348103, 1, 0, 0, 1, 1,
0.2529313, -0.2282918, 1.894066, 0, 0, 0, 1, 1,
0.2565928, 0.01581982, 2.588314, 0, 0, 0, 1, 1,
0.2571624, -0.7993324, 2.669093, 0, 0, 0, 1, 1,
0.2572163, -1.062537, 3.404897, 0, 0, 0, 1, 1,
0.2578107, -0.6395105, 2.128091, 0, 0, 0, 1, 1,
0.258278, -0.1162007, 1.884623, 0, 0, 0, 1, 1,
0.2584887, -0.6414027, 3.99797, 0, 0, 0, 1, 1,
0.2616826, 2.390924, 0.59698, 1, 1, 1, 1, 1,
0.2692095, -1.512351, 3.610472, 1, 1, 1, 1, 1,
0.2704202, -0.3512754, 3.443932, 1, 1, 1, 1, 1,
0.2707022, 1.065788, 1.517896, 1, 1, 1, 1, 1,
0.2727136, 0.8052064, 1.706492, 1, 1, 1, 1, 1,
0.2737924, -0.00583612, 0.9094365, 1, 1, 1, 1, 1,
0.2793038, -0.02458979, 0.7535352, 1, 1, 1, 1, 1,
0.2805554, -0.3384908, 3.471924, 1, 1, 1, 1, 1,
0.2841539, 1.028004, -0.4206646, 1, 1, 1, 1, 1,
0.2867736, 0.3721635, 0.846738, 1, 1, 1, 1, 1,
0.2900705, 1.480013, 0.9094069, 1, 1, 1, 1, 1,
0.2930045, -0.9355866, 1.885526, 1, 1, 1, 1, 1,
0.2984467, 0.6829165, 0.551468, 1, 1, 1, 1, 1,
0.3023717, 0.6289874, 0.2683554, 1, 1, 1, 1, 1,
0.3051039, 1.682386, -0.5798927, 1, 1, 1, 1, 1,
0.3149629, -0.4480782, 2.367262, 0, 0, 1, 1, 1,
0.3197116, 0.7278352, 0.03796866, 1, 0, 0, 1, 1,
0.3226087, -1.018138, 2.471429, 1, 0, 0, 1, 1,
0.32345, 0.1123444, -0.006638337, 1, 0, 0, 1, 1,
0.3241143, 0.8192722, 1.592129, 1, 0, 0, 1, 1,
0.3246904, 0.423147, 1.993927, 1, 0, 0, 1, 1,
0.3269374, -0.3961155, 0.6870316, 0, 0, 0, 1, 1,
0.3292963, 0.375078, 2.217616, 0, 0, 0, 1, 1,
0.3347476, 1.658113, -0.7585738, 0, 0, 0, 1, 1,
0.3359589, 1.731929, -0.02491014, 0, 0, 0, 1, 1,
0.337638, -2.029045, 2.763424, 0, 0, 0, 1, 1,
0.3378397, 0.6230955, 1.463807, 0, 0, 0, 1, 1,
0.3384373, -1.009361, 1.956615, 0, 0, 0, 1, 1,
0.3394846, 0.5462327, -1.230187, 1, 1, 1, 1, 1,
0.3442547, 0.5493727, 0.1116203, 1, 1, 1, 1, 1,
0.3444094, 0.2913125, 1.048115, 1, 1, 1, 1, 1,
0.3488265, 0.07661351, 0.2665285, 1, 1, 1, 1, 1,
0.3549143, -0.7248508, 3.463564, 1, 1, 1, 1, 1,
0.3589754, 0.7659135, -0.5138232, 1, 1, 1, 1, 1,
0.3621768, 0.6005548, 1.869103, 1, 1, 1, 1, 1,
0.3642102, 1.959445, 0.222802, 1, 1, 1, 1, 1,
0.3697644, -0.783625, 3.95263, 1, 1, 1, 1, 1,
0.3702707, 0.5451989, 2.369564, 1, 1, 1, 1, 1,
0.3702915, -0.1258003, 0.8288039, 1, 1, 1, 1, 1,
0.3732391, -1.486495, 2.274718, 1, 1, 1, 1, 1,
0.3748273, -0.7808766, 4.449139, 1, 1, 1, 1, 1,
0.3749287, -0.1203395, 2.313562, 1, 1, 1, 1, 1,
0.3749666, 1.93742, -1.701331, 1, 1, 1, 1, 1,
0.3756081, 1.184542, 0.6236175, 0, 0, 1, 1, 1,
0.3792095, 1.295674, 1.134874, 1, 0, 0, 1, 1,
0.3804081, 0.1242543, 2.955899, 1, 0, 0, 1, 1,
0.3827251, 1.758099, 0.3937763, 1, 0, 0, 1, 1,
0.3828438, 1.408391, 1.796232, 1, 0, 0, 1, 1,
0.3856604, 1.500962, 0.02183616, 1, 0, 0, 1, 1,
0.3933579, -0.1604538, 1.698971, 0, 0, 0, 1, 1,
0.3934752, 1.290882, 1.184149, 0, 0, 0, 1, 1,
0.3964046, 0.1398127, 0.4276793, 0, 0, 0, 1, 1,
0.3993722, 1.094941, -0.4004633, 0, 0, 0, 1, 1,
0.4016508, 1.29569, 1.313936, 0, 0, 0, 1, 1,
0.4031933, -2.085582, 3.3969, 0, 0, 0, 1, 1,
0.4048663, 0.3763141, 1.308677, 0, 0, 0, 1, 1,
0.4100381, -1.295646, 2.905376, 1, 1, 1, 1, 1,
0.4160077, -1.571921, 2.282252, 1, 1, 1, 1, 1,
0.4162809, -0.9064332, 1.612889, 1, 1, 1, 1, 1,
0.4316464, -0.7879016, 2.457736, 1, 1, 1, 1, 1,
0.4361567, -0.6694293, 3.924407, 1, 1, 1, 1, 1,
0.4416344, -0.07100248, 1.741628, 1, 1, 1, 1, 1,
0.4487533, 0.04736261, 1.659765, 1, 1, 1, 1, 1,
0.4530659, 1.797115, 1.082904, 1, 1, 1, 1, 1,
0.4534156, -0.1818334, 2.345563, 1, 1, 1, 1, 1,
0.4537415, 1.113753, -0.5217466, 1, 1, 1, 1, 1,
0.4569008, -1.279538, 3.611805, 1, 1, 1, 1, 1,
0.4689373, -0.8612559, 2.83966, 1, 1, 1, 1, 1,
0.4734366, -0.1109863, 1.781977, 1, 1, 1, 1, 1,
0.4748222, 0.2947359, 2.055735, 1, 1, 1, 1, 1,
0.4784724, -0.329794, 2.317111, 1, 1, 1, 1, 1,
0.4785766, -0.5750597, 0.5128084, 0, 0, 1, 1, 1,
0.4789929, 1.659881, -1.362909, 1, 0, 0, 1, 1,
0.4791309, 0.3917266, -0.2196338, 1, 0, 0, 1, 1,
0.4802476, -0.9292377, 2.104057, 1, 0, 0, 1, 1,
0.4821847, 0.1477081, 1.790643, 1, 0, 0, 1, 1,
0.485245, 0.6056906, 0.6238442, 1, 0, 0, 1, 1,
0.4888396, 0.0213831, 0.5179111, 0, 0, 0, 1, 1,
0.4891185, 1.146093, 0.409746, 0, 0, 0, 1, 1,
0.4936033, 1.099059, 0.4066727, 0, 0, 0, 1, 1,
0.5028585, 2.010041, 0.3930758, 0, 0, 0, 1, 1,
0.5029774, -2.076735, 5.042294, 0, 0, 0, 1, 1,
0.5087677, -0.5244637, 3.070853, 0, 0, 0, 1, 1,
0.5107686, 1.135184, -2.867323, 0, 0, 0, 1, 1,
0.5114355, 0.7822114, 3.054219, 1, 1, 1, 1, 1,
0.5133411, 0.4496176, 1.836956, 1, 1, 1, 1, 1,
0.5173161, 1.469506, 0.5232033, 1, 1, 1, 1, 1,
0.517589, -0.7065148, 2.498716, 1, 1, 1, 1, 1,
0.5198238, 0.584495, 1.903645, 1, 1, 1, 1, 1,
0.5202425, 0.06060361, 1.700786, 1, 1, 1, 1, 1,
0.5266302, -1.519242, 4.175972, 1, 1, 1, 1, 1,
0.5267761, -0.5693763, 1.10877, 1, 1, 1, 1, 1,
0.529376, -0.2486877, 1.649475, 1, 1, 1, 1, 1,
0.5295496, -0.1181031, 1.31781, 1, 1, 1, 1, 1,
0.5393355, 0.2859863, 1.739294, 1, 1, 1, 1, 1,
0.5462599, -0.5942979, 2.404969, 1, 1, 1, 1, 1,
0.5551788, -1.621819, 1.509529, 1, 1, 1, 1, 1,
0.5560535, 1.038316, 1.297577, 1, 1, 1, 1, 1,
0.5600711, 1.063788, -1.648124, 1, 1, 1, 1, 1,
0.5607556, 0.130105, 2.567216, 0, 0, 1, 1, 1,
0.5614923, 1.122322, 2.260081, 1, 0, 0, 1, 1,
0.5618948, -1.993518, 3.523684, 1, 0, 0, 1, 1,
0.5621529, -0.1551224, 2.514092, 1, 0, 0, 1, 1,
0.5628631, -0.2618296, 1.923883, 1, 0, 0, 1, 1,
0.5630113, -0.9341385, 1.205137, 1, 0, 0, 1, 1,
0.5703365, 0.6099353, 0.7721875, 0, 0, 0, 1, 1,
0.5704906, -0.1984814, 1.608622, 0, 0, 0, 1, 1,
0.5727428, 0.9663939, 0.1829667, 0, 0, 0, 1, 1,
0.5766236, -0.6916998, 3.520841, 0, 0, 0, 1, 1,
0.5849004, 0.3301403, 2.108123, 0, 0, 0, 1, 1,
0.5862245, -0.5334207, 1.791633, 0, 0, 0, 1, 1,
0.5869086, 0.01024397, 1.832576, 0, 0, 0, 1, 1,
0.5945393, -0.6973991, 3.00497, 1, 1, 1, 1, 1,
0.5949617, 0.3802419, 1.338547, 1, 1, 1, 1, 1,
0.5964697, -0.4469073, 2.851867, 1, 1, 1, 1, 1,
0.5966328, 0.7791254, 0.06159479, 1, 1, 1, 1, 1,
0.599651, -0.3249668, 3.860621, 1, 1, 1, 1, 1,
0.6011666, -0.7138613, 2.909759, 1, 1, 1, 1, 1,
0.6114697, 1.089383, -0.3118398, 1, 1, 1, 1, 1,
0.6123229, -1.386397, 1.64634, 1, 1, 1, 1, 1,
0.6129956, -1.733968, 2.183765, 1, 1, 1, 1, 1,
0.6176683, 0.7483003, 0.4853782, 1, 1, 1, 1, 1,
0.6218691, -1.207953, 1.88371, 1, 1, 1, 1, 1,
0.6257714, -1.863606, 2.997948, 1, 1, 1, 1, 1,
0.6317118, 0.3328457, 1.981062, 1, 1, 1, 1, 1,
0.6366866, -0.7643064, 2.562924, 1, 1, 1, 1, 1,
0.6378956, -0.4281737, 1.636063, 1, 1, 1, 1, 1,
0.6400207, 1.880562, 0.278381, 0, 0, 1, 1, 1,
0.6404703, 0.2696935, -0.2692385, 1, 0, 0, 1, 1,
0.6469054, 1.186132, 1.126526, 1, 0, 0, 1, 1,
0.6518562, 0.8322216, 0.8793592, 1, 0, 0, 1, 1,
0.6543252, -0.07673152, 0.2189197, 1, 0, 0, 1, 1,
0.6558123, -1.170552, 3.381144, 1, 0, 0, 1, 1,
0.6563736, 1.319608, -0.550917, 0, 0, 0, 1, 1,
0.6574405, 0.2378641, 1.117641, 0, 0, 0, 1, 1,
0.6577184, 1.69664, 1.935106, 0, 0, 0, 1, 1,
0.6631346, -0.8710778, 2.392157, 0, 0, 0, 1, 1,
0.6679775, 1.717427, 0.9972192, 0, 0, 0, 1, 1,
0.6714283, -0.5896162, 2.596349, 0, 0, 0, 1, 1,
0.6793627, 1.074677, -0.8444099, 0, 0, 0, 1, 1,
0.6859702, -0.3590126, 1.903138, 1, 1, 1, 1, 1,
0.6877063, -0.5877067, 2.847436, 1, 1, 1, 1, 1,
0.6877108, -0.8389919, 2.295274, 1, 1, 1, 1, 1,
0.6920595, -1.806025, 2.136817, 1, 1, 1, 1, 1,
0.6946467, -0.7279865, 1.805728, 1, 1, 1, 1, 1,
0.7018071, 1.292751, -0.2998362, 1, 1, 1, 1, 1,
0.7138038, 2.182322, 0.2949526, 1, 1, 1, 1, 1,
0.7146928, 0.1142124, 1.535215, 1, 1, 1, 1, 1,
0.7191865, 0.0867305, 2.592935, 1, 1, 1, 1, 1,
0.7226675, -0.9116921, 2.721386, 1, 1, 1, 1, 1,
0.7266805, 1.096504, 1.093107, 1, 1, 1, 1, 1,
0.7276824, 1.295515, -0.7892519, 1, 1, 1, 1, 1,
0.7279044, 1.490058, -0.3978959, 1, 1, 1, 1, 1,
0.7317533, -0.2683831, 1.436403, 1, 1, 1, 1, 1,
0.7343821, 0.8401401, -2.015472, 1, 1, 1, 1, 1,
0.7405647, -0.9487978, 3.084652, 0, 0, 1, 1, 1,
0.7430296, 1.081964, -0.9089944, 1, 0, 0, 1, 1,
0.7471414, -0.0261814, 2.163408, 1, 0, 0, 1, 1,
0.7478315, 1.045354, -0.3930262, 1, 0, 0, 1, 1,
0.7614563, 0.3517506, 1.105164, 1, 0, 0, 1, 1,
0.7670825, -0.2349304, 2.153642, 1, 0, 0, 1, 1,
0.7671882, 1.012992, 0.5493638, 0, 0, 0, 1, 1,
0.7746833, 0.1688152, 0.1662785, 0, 0, 0, 1, 1,
0.775427, 0.08283826, 2.425634, 0, 0, 0, 1, 1,
0.7758155, -0.5237125, 2.377318, 0, 0, 0, 1, 1,
0.7789934, -0.4739186, 0.9812396, 0, 0, 0, 1, 1,
0.7952371, 1.401463, 0.4980424, 0, 0, 0, 1, 1,
0.8026739, -1.291196, 3.336267, 0, 0, 0, 1, 1,
0.8058955, 0.683197, 1.161712, 1, 1, 1, 1, 1,
0.8073022, 0.08284109, 0.8384262, 1, 1, 1, 1, 1,
0.8074069, 1.056539, 0.9769183, 1, 1, 1, 1, 1,
0.8160463, -0.7567859, 3.309571, 1, 1, 1, 1, 1,
0.8176801, -0.792476, 2.750959, 1, 1, 1, 1, 1,
0.8187458, 0.8700761, 2.129364, 1, 1, 1, 1, 1,
0.8239112, 0.794579, 0.6488097, 1, 1, 1, 1, 1,
0.8241364, -1.900547, 2.441894, 1, 1, 1, 1, 1,
0.8264545, 0.06890891, -0.447235, 1, 1, 1, 1, 1,
0.8328761, 1.177155, 1.516291, 1, 1, 1, 1, 1,
0.8330039, 0.8958184, 0.7058373, 1, 1, 1, 1, 1,
0.8358395, 0.215038, 1.190213, 1, 1, 1, 1, 1,
0.8363556, 0.8778216, 0.4867326, 1, 1, 1, 1, 1,
0.8369802, 0.2110251, 0.1945896, 1, 1, 1, 1, 1,
0.8405099, 1.863795, -0.3191181, 1, 1, 1, 1, 1,
0.8434004, 0.2036185, 1.093658, 0, 0, 1, 1, 1,
0.846132, -0.4068211, 2.721103, 1, 0, 0, 1, 1,
0.8476375, -0.9488702, 1.903162, 1, 0, 0, 1, 1,
0.8513752, 1.23914, 1.218492, 1, 0, 0, 1, 1,
0.8582789, -0.8665351, 2.674274, 1, 0, 0, 1, 1,
0.8602168, -0.8701878, 3.166691, 1, 0, 0, 1, 1,
0.8605291, 1.732661, 2.103787, 0, 0, 0, 1, 1,
0.8607014, 0.1682298, 0.6071345, 0, 0, 0, 1, 1,
0.8653737, 0.3857813, 1.099191, 0, 0, 0, 1, 1,
0.8662883, -1.861683, 2.643875, 0, 0, 0, 1, 1,
0.8667101, 0.1355269, 1.009, 0, 0, 0, 1, 1,
0.8686577, 0.4221913, 1.081905, 0, 0, 0, 1, 1,
0.8799628, 0.7041965, 1.108424, 0, 0, 0, 1, 1,
0.8880729, -2.03763, 3.540537, 1, 1, 1, 1, 1,
0.8897324, 0.6244121, 0.4719987, 1, 1, 1, 1, 1,
0.8906489, -0.07892045, 1.449672, 1, 1, 1, 1, 1,
0.8998725, 0.2331006, 1.216394, 1, 1, 1, 1, 1,
0.9042645, -0.09020295, 0.8837654, 1, 1, 1, 1, 1,
0.9055449, 0.6067441, -0.002317717, 1, 1, 1, 1, 1,
0.915328, 1.361933, 2.149018, 1, 1, 1, 1, 1,
0.9168367, -0.2452499, 1.115303, 1, 1, 1, 1, 1,
0.9201798, 0.2761994, 1.248822, 1, 1, 1, 1, 1,
0.9215218, 0.4427607, 0.8372207, 1, 1, 1, 1, 1,
0.9235245, 0.3600824, 2.94748, 1, 1, 1, 1, 1,
0.9279198, -1.266333, 2.056273, 1, 1, 1, 1, 1,
0.9295298, 0.7186587, -1.579872, 1, 1, 1, 1, 1,
0.9333521, -0.4820333, 2.164534, 1, 1, 1, 1, 1,
0.9334428, 0.4063571, 0.1996882, 1, 1, 1, 1, 1,
0.9344859, 0.5220286, 2.61065, 0, 0, 1, 1, 1,
0.9358343, -1.230873, 1.530859, 1, 0, 0, 1, 1,
0.9394554, 0.4358323, 3.046028, 1, 0, 0, 1, 1,
0.9406428, -0.997501, 1.648346, 1, 0, 0, 1, 1,
0.9432179, 0.6047744, 1.044791, 1, 0, 0, 1, 1,
0.9446977, -2.259681, -0.3445936, 1, 0, 0, 1, 1,
0.9465193, 1.618477, 2.137401, 0, 0, 0, 1, 1,
0.9473941, -0.4906207, 0.971195, 0, 0, 0, 1, 1,
0.9489216, 0.5824326, 0.5509488, 0, 0, 0, 1, 1,
0.9556257, 0.3059461, 1.640647, 0, 0, 0, 1, 1,
0.9596568, 0.05077794, 1.469718, 0, 0, 0, 1, 1,
0.9606178, 0.2854615, 1.852187, 0, 0, 0, 1, 1,
0.9615265, -0.8940978, 1.421636, 0, 0, 0, 1, 1,
0.9660898, -0.6408396, 2.104079, 1, 1, 1, 1, 1,
0.968794, 0.1807481, 1.489393, 1, 1, 1, 1, 1,
0.9698106, 2.107568, 1.704263, 1, 1, 1, 1, 1,
0.9720599, -0.7654359, 3.227886, 1, 1, 1, 1, 1,
0.9739218, 0.4055795, 2.537429, 1, 1, 1, 1, 1,
0.9749659, 0.574872, -0.9747216, 1, 1, 1, 1, 1,
0.9759396, 0.3657853, 0.2060652, 1, 1, 1, 1, 1,
0.9807224, 0.6299471, 1.69335, 1, 1, 1, 1, 1,
0.98128, -0.4586838, 2.420559, 1, 1, 1, 1, 1,
0.9838035, -1.133624, 1.412876, 1, 1, 1, 1, 1,
0.9902924, -0.2974071, 1.830028, 1, 1, 1, 1, 1,
0.9929993, 0.05584715, 0.5866457, 1, 1, 1, 1, 1,
0.9977522, 1.503126, 1.418163, 1, 1, 1, 1, 1,
1.006086, 0.1925252, 0.4408648, 1, 1, 1, 1, 1,
1.009458, -1.383409, 4.202933, 1, 1, 1, 1, 1,
1.01086, 0.09351492, 1.536948, 0, 0, 1, 1, 1,
1.014064, -1.481939, 2.813755, 1, 0, 0, 1, 1,
1.024304, 0.05185672, 0.2877372, 1, 0, 0, 1, 1,
1.03095, 0.7395048, 0.4966947, 1, 0, 0, 1, 1,
1.036883, -0.2711369, 1.492538, 1, 0, 0, 1, 1,
1.041564, -1.329122, 1.693102, 1, 0, 0, 1, 1,
1.042036, 1.046211, 0.530923, 0, 0, 0, 1, 1,
1.046889, -0.3263971, -0.3554676, 0, 0, 0, 1, 1,
1.047157, -0.6813809, 1.824714, 0, 0, 0, 1, 1,
1.050088, -1.673467, 2.694543, 0, 0, 0, 1, 1,
1.055856, -0.7714859, 1.972934, 0, 0, 0, 1, 1,
1.064077, 0.7210258, -0.3489029, 0, 0, 0, 1, 1,
1.06471, 0.2686075, 1.904328, 0, 0, 0, 1, 1,
1.065575, -0.2221909, 1.534364, 1, 1, 1, 1, 1,
1.067788, 0.5783532, 1.399946, 1, 1, 1, 1, 1,
1.071449, 1.523675, 0.3990747, 1, 1, 1, 1, 1,
1.08024, 0.2594326, 1.656914, 1, 1, 1, 1, 1,
1.081978, -1.310353, 3.132807, 1, 1, 1, 1, 1,
1.082097, 0.2307903, 0.8836448, 1, 1, 1, 1, 1,
1.082384, -0.5792333, 3.696298, 1, 1, 1, 1, 1,
1.082944, 2.3218, 0.8007697, 1, 1, 1, 1, 1,
1.085229, 1.361655, 1.427873, 1, 1, 1, 1, 1,
1.093782, -0.395052, 3.482845, 1, 1, 1, 1, 1,
1.095272, -0.2348804, 0.2519297, 1, 1, 1, 1, 1,
1.095491, -0.6757189, 1.80416, 1, 1, 1, 1, 1,
1.096683, 0.01966522, 0.9257357, 1, 1, 1, 1, 1,
1.096732, 0.438024, 2.899568, 1, 1, 1, 1, 1,
1.106201, -1.022416, 2.437043, 1, 1, 1, 1, 1,
1.107028, 0.965847, -0.4325409, 0, 0, 1, 1, 1,
1.107552, -0.567089, 3.77495, 1, 0, 0, 1, 1,
1.110365, 0.00764948, 1.803725, 1, 0, 0, 1, 1,
1.113232, 0.668852, 1.36967, 1, 0, 0, 1, 1,
1.117469, 1.768004, 1.805665, 1, 0, 0, 1, 1,
1.122685, -2.020326, 2.613421, 1, 0, 0, 1, 1,
1.127485, -0.1061322, 1.151366, 0, 0, 0, 1, 1,
1.141237, -0.2965429, 3.257992, 0, 0, 0, 1, 1,
1.14336, 0.04277943, 0.5645162, 0, 0, 0, 1, 1,
1.148078, 1.631507, 0.3188999, 0, 0, 0, 1, 1,
1.148292, 0.891129, 0.3976883, 0, 0, 0, 1, 1,
1.152558, -0.6664959, 2.725623, 0, 0, 0, 1, 1,
1.157925, 0.9292067, 2.458938, 0, 0, 0, 1, 1,
1.160384, -1.583871, 1.812721, 1, 1, 1, 1, 1,
1.160648, -1.139966, 2.071779, 1, 1, 1, 1, 1,
1.163376, -1.1172, 1.771496, 1, 1, 1, 1, 1,
1.165331, -0.5640917, 0.5446917, 1, 1, 1, 1, 1,
1.167365, -0.02246712, 1.365624, 1, 1, 1, 1, 1,
1.171227, -1.323787, 3.184067, 1, 1, 1, 1, 1,
1.173678, -0.1343401, 0.8445393, 1, 1, 1, 1, 1,
1.181435, -1.745941, 5.200419, 1, 1, 1, 1, 1,
1.182449, -0.846678, 2.826928, 1, 1, 1, 1, 1,
1.184008, 0.02576322, 0.540802, 1, 1, 1, 1, 1,
1.186146, -0.06609017, 2.597739, 1, 1, 1, 1, 1,
1.186587, -0.4223287, 0.7822971, 1, 1, 1, 1, 1,
1.192403, -1.14757, 2.324149, 1, 1, 1, 1, 1,
1.194807, -0.5377847, 1.087527, 1, 1, 1, 1, 1,
1.202609, -0.604885, 1.432736, 1, 1, 1, 1, 1,
1.211462, -1.154795, 0.9006672, 0, 0, 1, 1, 1,
1.21582, 2.026761, 1.132861, 1, 0, 0, 1, 1,
1.216685, -0.1139333, 0.9421421, 1, 0, 0, 1, 1,
1.220764, -2.415467, 2.651407, 1, 0, 0, 1, 1,
1.236545, 0.02629299, 0.9686162, 1, 0, 0, 1, 1,
1.236775, -0.9417042, 2.672021, 1, 0, 0, 1, 1,
1.239906, 0.493523, 0.3007476, 0, 0, 0, 1, 1,
1.24209, 0.6706442, 1.410576, 0, 0, 0, 1, 1,
1.244859, -0.3158303, 2.100118, 0, 0, 0, 1, 1,
1.249059, 1.132843, 0.3958411, 0, 0, 0, 1, 1,
1.251386, -2.065129, 3.233573, 0, 0, 0, 1, 1,
1.252301, -1.519985, 2.601792, 0, 0, 0, 1, 1,
1.255122, -0.7240623, 1.593637, 0, 0, 0, 1, 1,
1.257042, 0.8177489, 1.139717, 1, 1, 1, 1, 1,
1.269311, 1.496283, 2.573344, 1, 1, 1, 1, 1,
1.272509, 0.3968073, 2.40936, 1, 1, 1, 1, 1,
1.279547, -0.1988638, 2.02856, 1, 1, 1, 1, 1,
1.282611, 0.6959434, 0.9796433, 1, 1, 1, 1, 1,
1.288551, 1.263671, -0.6220601, 1, 1, 1, 1, 1,
1.308076, -0.192885, 2.238811, 1, 1, 1, 1, 1,
1.308731, -1.978224, 2.914329, 1, 1, 1, 1, 1,
1.311729, 0.9630333, -0.2544513, 1, 1, 1, 1, 1,
1.312818, -0.4823831, 2.273782, 1, 1, 1, 1, 1,
1.314743, 0.3955867, 1.177953, 1, 1, 1, 1, 1,
1.317647, -0.6195708, 0.3949642, 1, 1, 1, 1, 1,
1.325292, -2.137075, 1.309262, 1, 1, 1, 1, 1,
1.34876, 0.4705559, 3.571919, 1, 1, 1, 1, 1,
1.367515, -0.1219704, 1.531343, 1, 1, 1, 1, 1,
1.384375, 1.285815, 2.237121, 0, 0, 1, 1, 1,
1.399793, 0.01384353, 2.640544, 1, 0, 0, 1, 1,
1.40303, 0.7713988, 1.849443, 1, 0, 0, 1, 1,
1.423814, -0.6706535, 1.508307, 1, 0, 0, 1, 1,
1.435157, 0.2362594, 1.560848, 1, 0, 0, 1, 1,
1.437617, -0.06180402, 1.50758, 1, 0, 0, 1, 1,
1.446876, 1.376768, 1.313417, 0, 0, 0, 1, 1,
1.451619, 1.837259, 0.631635, 0, 0, 0, 1, 1,
1.456827, 0.09496773, 2.723384, 0, 0, 0, 1, 1,
1.467603, -0.4953162, 2.030931, 0, 0, 0, 1, 1,
1.470179, 0.1881183, 3.191353, 0, 0, 0, 1, 1,
1.470263, 1.338402, 1.016483, 0, 0, 0, 1, 1,
1.516734, -0.08823176, 0.1166553, 0, 0, 0, 1, 1,
1.52461, 0.017654, 1.590351, 1, 1, 1, 1, 1,
1.53766, -0.8815261, 2.942149, 1, 1, 1, 1, 1,
1.537868, -1.205105, 1.766034, 1, 1, 1, 1, 1,
1.556083, -0.7828787, 2.174615, 1, 1, 1, 1, 1,
1.558397, 0.352182, 2.002652, 1, 1, 1, 1, 1,
1.560494, 0.5801716, 0.8610874, 1, 1, 1, 1, 1,
1.564519, 0.544984, 2.585225, 1, 1, 1, 1, 1,
1.575647, 1.791454, 0.9408855, 1, 1, 1, 1, 1,
1.576352, -1.171794, 2.985425, 1, 1, 1, 1, 1,
1.588075, -0.5173733, 1.161392, 1, 1, 1, 1, 1,
1.595654, -0.1504214, 2.233824, 1, 1, 1, 1, 1,
1.596408, 0.795224, -0.04503713, 1, 1, 1, 1, 1,
1.601213, -0.3113537, 2.627841, 1, 1, 1, 1, 1,
1.608002, 0.1560008, 1.190368, 1, 1, 1, 1, 1,
1.614454, 0.1229235, 2.307471, 1, 1, 1, 1, 1,
1.617838, 1.454237, 1.529289, 0, 0, 1, 1, 1,
1.621427, 0.1043042, 2.079067, 1, 0, 0, 1, 1,
1.634945, 0.4173431, 2.285501, 1, 0, 0, 1, 1,
1.643821, 0.04677906, 1.241257, 1, 0, 0, 1, 1,
1.675397, 0.7938758, 2.570517, 1, 0, 0, 1, 1,
1.693686, 0.7557346, 1.143904, 1, 0, 0, 1, 1,
1.6997, 0.1897878, 1.123135, 0, 0, 0, 1, 1,
1.707942, -0.8243198, 1.296767, 0, 0, 0, 1, 1,
1.714483, 0.4176531, 1.482033, 0, 0, 0, 1, 1,
1.729321, -0.6376999, 2.778305, 0, 0, 0, 1, 1,
1.748841, -0.8194363, 1.896563, 0, 0, 0, 1, 1,
1.752474, 0.009437568, 0.6355845, 0, 0, 0, 1, 1,
1.783621, -1.992179, 3.00411, 0, 0, 0, 1, 1,
1.804888, -0.2925292, 3.28351, 1, 1, 1, 1, 1,
1.819599, -0.07578217, 1.184387, 1, 1, 1, 1, 1,
1.821516, -0.006721952, 0.004632345, 1, 1, 1, 1, 1,
1.83162, 0.8162826, 0.3612673, 1, 1, 1, 1, 1,
1.835551, -1.075894, 2.938032, 1, 1, 1, 1, 1,
1.8433, -0.6799979, 2.059367, 1, 1, 1, 1, 1,
1.846721, 0.3097548, 0.7079087, 1, 1, 1, 1, 1,
1.857369, -1.068986, 1.877856, 1, 1, 1, 1, 1,
1.878706, -1.394133, 1.665104, 1, 1, 1, 1, 1,
1.914578, -0.3036902, 2.185605, 1, 1, 1, 1, 1,
1.91461, 0.1580981, 1.881073, 1, 1, 1, 1, 1,
1.920383, -0.7429658, 2.976454, 1, 1, 1, 1, 1,
1.957342, 1.210442, 0.0251205, 1, 1, 1, 1, 1,
1.965729, 0.1217212, 1.102591, 1, 1, 1, 1, 1,
1.966329, 1.814593, 0.6025616, 1, 1, 1, 1, 1,
1.968608, -0.5275426, 0.803654, 0, 0, 1, 1, 1,
1.974512, 1.753387, 0.02386813, 1, 0, 0, 1, 1,
2.028019, 1.303824, 0.3306994, 1, 0, 0, 1, 1,
2.047775, 1.191258, 2.392855, 1, 0, 0, 1, 1,
2.064588, 0.4944543, 2.857044, 1, 0, 0, 1, 1,
2.099387, -1.640127, 1.677829, 1, 0, 0, 1, 1,
2.120062, -1.960418, 4.524422, 0, 0, 0, 1, 1,
2.13725, -0.6633083, 2.338367, 0, 0, 0, 1, 1,
2.161155, -1.204522, 2.908628, 0, 0, 0, 1, 1,
2.182548, 0.02128717, 3.462261, 0, 0, 0, 1, 1,
2.273658, 0.7499093, 0.8575163, 0, 0, 0, 1, 1,
2.325472, 1.540183, 1.749826, 0, 0, 0, 1, 1,
2.425791, -0.8255126, 3.258889, 0, 0, 0, 1, 1,
2.460483, 0.2873857, 0.9060119, 1, 1, 1, 1, 1,
2.515095, 0.8907474, 3.420615, 1, 1, 1, 1, 1,
2.739861, 0.05131583, 2.288102, 1, 1, 1, 1, 1,
2.831974, -1.317557, 0.2102224, 1, 1, 1, 1, 1,
2.869264, -0.5686334, 0.7879537, 1, 1, 1, 1, 1,
3.147752, 0.1617334, 2.861771, 1, 1, 1, 1, 1,
3.416149, 0.9692452, 2.026983, 1, 1, 1, 1, 1
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
var radius = 9.934712;
var distance = 34.89525;
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
mvMatrix.translate( -0.3206518, 0.1361263, -0.176815 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.89525);
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
