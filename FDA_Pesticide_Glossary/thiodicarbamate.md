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
-3.158523, -0.6448175, -3.172469, 1, 0, 0, 1,
-2.94307, 0.7375076, -1.521392, 1, 0.007843138, 0, 1,
-2.841068, -0.4216293, -0.7142653, 1, 0.01176471, 0, 1,
-2.789039, 0.4770408, -2.132636, 1, 0.01960784, 0, 1,
-2.706958, 0.1401204, -2.595207, 1, 0.02352941, 0, 1,
-2.63377, 0.9646896, 0.1227239, 1, 0.03137255, 0, 1,
-2.561343, -1.643885, -2.094198, 1, 0.03529412, 0, 1,
-2.542881, -0.5694093, -2.73375, 1, 0.04313726, 0, 1,
-2.419528, -0.5711471, -2.290419, 1, 0.04705882, 0, 1,
-2.380485, -1.224734, -2.944946, 1, 0.05490196, 0, 1,
-2.363844, -0.6848903, -1.468017, 1, 0.05882353, 0, 1,
-2.34781, -1.85414, -0.8832814, 1, 0.06666667, 0, 1,
-2.279728, -0.9359552, -2.574549, 1, 0.07058824, 0, 1,
-2.180609, -0.5780171, -1.359602, 1, 0.07843138, 0, 1,
-2.157928, 0.7530308, -1.340495, 1, 0.08235294, 0, 1,
-2.120806, -0.6685119, -1.842891, 1, 0.09019608, 0, 1,
-2.074921, 0.458683, -1.224411, 1, 0.09411765, 0, 1,
-2.072397, -1.539024, -2.539544, 1, 0.1019608, 0, 1,
-2.062273, -0.1971327, -0.998859, 1, 0.1098039, 0, 1,
-2.059819, -0.8386939, -1.695081, 1, 0.1137255, 0, 1,
-2.011855, -0.005802981, 0.4009181, 1, 0.1215686, 0, 1,
-2.007803, -1.756033, -3.31793, 1, 0.1254902, 0, 1,
-2.001152, -0.7222461, -2.554284, 1, 0.1333333, 0, 1,
-1.995437, 0.9564345, -0.7220821, 1, 0.1372549, 0, 1,
-1.974462, -1.359823, -3.628511, 1, 0.145098, 0, 1,
-1.891836, -0.06614175, -0.6259142, 1, 0.1490196, 0, 1,
-1.862753, 0.6585022, -1.378557, 1, 0.1568628, 0, 1,
-1.858903, 0.2842119, -1.371008, 1, 0.1607843, 0, 1,
-1.797791, -0.7666302, -2.558157, 1, 0.1686275, 0, 1,
-1.787259, 0.2449812, 0.0944574, 1, 0.172549, 0, 1,
-1.786083, 1.096481, -3.036988, 1, 0.1803922, 0, 1,
-1.784479, 0.5894901, -1.05798, 1, 0.1843137, 0, 1,
-1.778408, 0.3389218, 0.8394012, 1, 0.1921569, 0, 1,
-1.777164, 1.718042, -0.9935754, 1, 0.1960784, 0, 1,
-1.775029, -1.001607, -1.703694, 1, 0.2039216, 0, 1,
-1.764754, -0.4480109, -1.96969, 1, 0.2117647, 0, 1,
-1.755024, 0.1699341, -4.039566, 1, 0.2156863, 0, 1,
-1.738074, -0.03712276, -3.796839, 1, 0.2235294, 0, 1,
-1.705007, 1.468364, -1.746549, 1, 0.227451, 0, 1,
-1.703969, 1.433042, -1.036832, 1, 0.2352941, 0, 1,
-1.700688, -0.6829728, -2.189701, 1, 0.2392157, 0, 1,
-1.70008, 0.1086809, -1.681039, 1, 0.2470588, 0, 1,
-1.683717, -2.669289, -3.765882, 1, 0.2509804, 0, 1,
-1.679864, -0.4867903, -2.77788, 1, 0.2588235, 0, 1,
-1.671427, 0.4343332, -2.123126, 1, 0.2627451, 0, 1,
-1.653739, 1.168348, -0.03052736, 1, 0.2705882, 0, 1,
-1.652275, -2.381249, -3.847605, 1, 0.2745098, 0, 1,
-1.609423, 1.023704, 0.1056685, 1, 0.282353, 0, 1,
-1.607561, 0.4625404, -2.524707, 1, 0.2862745, 0, 1,
-1.600327, 1.307515, -0.746546, 1, 0.2941177, 0, 1,
-1.592606, 0.3166943, -2.381614, 1, 0.3019608, 0, 1,
-1.590494, -0.5132714, -1.516126, 1, 0.3058824, 0, 1,
-1.562282, 0.3416556, -1.770672, 1, 0.3137255, 0, 1,
-1.559339, -2.818022, -2.011657, 1, 0.3176471, 0, 1,
-1.552044, 0.09146485, -1.29846, 1, 0.3254902, 0, 1,
-1.549875, -0.07164838, -1.948781, 1, 0.3294118, 0, 1,
-1.547372, 0.006580121, -4.154161, 1, 0.3372549, 0, 1,
-1.539514, 1.60293, -0.7571066, 1, 0.3411765, 0, 1,
-1.534768, 0.1975395, -0.891598, 1, 0.3490196, 0, 1,
-1.529816, -1.530167, -2.995306, 1, 0.3529412, 0, 1,
-1.524333, 0.5210396, -1.562422, 1, 0.3607843, 0, 1,
-1.516773, 0.2890641, -1.042233, 1, 0.3647059, 0, 1,
-1.516466, 0.1100359, -1.53724, 1, 0.372549, 0, 1,
-1.511131, 1.035267, -0.1885932, 1, 0.3764706, 0, 1,
-1.505291, -0.3702874, -2.72675, 1, 0.3843137, 0, 1,
-1.497082, 1.767459, -0.54364, 1, 0.3882353, 0, 1,
-1.495826, 0.2465322, -0.472164, 1, 0.3960784, 0, 1,
-1.483757, -1.363186, -1.945377, 1, 0.4039216, 0, 1,
-1.481428, 0.3387032, -0.3441237, 1, 0.4078431, 0, 1,
-1.466137, -0.1186975, -2.580239, 1, 0.4156863, 0, 1,
-1.462757, 0.6577626, -1.818173, 1, 0.4196078, 0, 1,
-1.455165, -1.184767, -1.876445, 1, 0.427451, 0, 1,
-1.4432, -1.175426, -1.925897, 1, 0.4313726, 0, 1,
-1.426997, 0.7703792, -0.1970009, 1, 0.4392157, 0, 1,
-1.413866, 0.6876771, -0.8445775, 1, 0.4431373, 0, 1,
-1.400815, -1.20747, -3.624769, 1, 0.4509804, 0, 1,
-1.399488, 0.0139107, -3.008178, 1, 0.454902, 0, 1,
-1.386637, -0.7776952, -3.538593, 1, 0.4627451, 0, 1,
-1.385759, -0.3189964, -2.851948, 1, 0.4666667, 0, 1,
-1.381884, 0.7554665, -3.414262, 1, 0.4745098, 0, 1,
-1.37949, 0.6422303, 1.344947, 1, 0.4784314, 0, 1,
-1.371831, -1.8705, -2.391737, 1, 0.4862745, 0, 1,
-1.361251, -1.654585, -2.896597, 1, 0.4901961, 0, 1,
-1.359846, 1.72991, -0.0604599, 1, 0.4980392, 0, 1,
-1.359779, 0.3544867, -1.837604, 1, 0.5058824, 0, 1,
-1.342467, -0.04418986, -2.987795, 1, 0.509804, 0, 1,
-1.340906, -0.3730053, -3.4193, 1, 0.5176471, 0, 1,
-1.339176, 0.06229856, -2.862139, 1, 0.5215687, 0, 1,
-1.33408, -0.9565904, -2.002469, 1, 0.5294118, 0, 1,
-1.322026, 0.5790634, 0.04389264, 1, 0.5333334, 0, 1,
-1.31898, 1.112749, -0.9671602, 1, 0.5411765, 0, 1,
-1.314063, 0.07972413, -0.416134, 1, 0.5450981, 0, 1,
-1.313874, -1.367622, -0.7573173, 1, 0.5529412, 0, 1,
-1.309614, -0.7868796, -2.658633, 1, 0.5568628, 0, 1,
-1.308276, -1.16305, -1.977075, 1, 0.5647059, 0, 1,
-1.300833, -0.467181, -1.395893, 1, 0.5686275, 0, 1,
-1.272496, -0.5525324, -1.512269, 1, 0.5764706, 0, 1,
-1.263865, 1.184068, -1.09833, 1, 0.5803922, 0, 1,
-1.261341, 0.6007833, 0.6231465, 1, 0.5882353, 0, 1,
-1.255783, 1.065854, -1.777132, 1, 0.5921569, 0, 1,
-1.252451, -1.106534, -2.23869, 1, 0.6, 0, 1,
-1.252069, -0.2574082, -1.172587, 1, 0.6078432, 0, 1,
-1.240915, -0.9537593, -2.157446, 1, 0.6117647, 0, 1,
-1.23405, 0.2278512, -2.581519, 1, 0.6196079, 0, 1,
-1.21676, 0.3578474, -1.130556, 1, 0.6235294, 0, 1,
-1.215002, -1.313359, -2.288429, 1, 0.6313726, 0, 1,
-1.208189, -0.1309314, -2.04683, 1, 0.6352941, 0, 1,
-1.204198, -0.701369, -0.160699, 1, 0.6431373, 0, 1,
-1.202276, -0.7429578, -1.614905, 1, 0.6470588, 0, 1,
-1.192804, -0.4988899, -2.709341, 1, 0.654902, 0, 1,
-1.18096, 0.2041849, -0.5748288, 1, 0.6588235, 0, 1,
-1.179, -0.2504015, -0.2516951, 1, 0.6666667, 0, 1,
-1.178693, -0.3301304, -2.564991, 1, 0.6705883, 0, 1,
-1.173341, -1.391734, -2.688878, 1, 0.6784314, 0, 1,
-1.169486, -0.4016809, -2.770307, 1, 0.682353, 0, 1,
-1.161642, -3.051183, -3.108942, 1, 0.6901961, 0, 1,
-1.16159, 1.422789, 0.2647769, 1, 0.6941177, 0, 1,
-1.158907, -1.242875, -2.810913, 1, 0.7019608, 0, 1,
-1.154815, 0.7550287, -2.102309, 1, 0.7098039, 0, 1,
-1.144192, 1.430909, -1.479578, 1, 0.7137255, 0, 1,
-1.142086, 0.9385768, -0.7331145, 1, 0.7215686, 0, 1,
-1.140008, 0.4950135, -2.473951, 1, 0.7254902, 0, 1,
-1.139156, -0.3930064, -2.216835, 1, 0.7333333, 0, 1,
-1.12139, 0.5285846, -1.0971, 1, 0.7372549, 0, 1,
-1.110235, 0.528588, -0.7409556, 1, 0.7450981, 0, 1,
-1.106779, -0.1816781, -1.800335, 1, 0.7490196, 0, 1,
-1.103808, -0.3144147, -2.783027, 1, 0.7568628, 0, 1,
-1.097304, 0.09354748, -1.547057, 1, 0.7607843, 0, 1,
-1.088682, -0.6847, -2.290885, 1, 0.7686275, 0, 1,
-1.087066, -0.763587, -2.487357, 1, 0.772549, 0, 1,
-1.082711, 0.3751882, -2.154176, 1, 0.7803922, 0, 1,
-1.077102, 1.577776, -2.003124, 1, 0.7843137, 0, 1,
-1.072284, 1.180565, -0.155086, 1, 0.7921569, 0, 1,
-1.072165, -1.331599, -2.5251, 1, 0.7960784, 0, 1,
-1.072154, 0.7900813, -0.7693709, 1, 0.8039216, 0, 1,
-1.063216, 1.109857, 1.264805, 1, 0.8117647, 0, 1,
-1.060834, 0.198388, -2.247483, 1, 0.8156863, 0, 1,
-1.060017, 1.711857, -0.9635876, 1, 0.8235294, 0, 1,
-1.050733, -0.5476127, -3.92737, 1, 0.827451, 0, 1,
-1.048885, 1.37667, -1.61357, 1, 0.8352941, 0, 1,
-1.047356, -0.8810658, -3.366225, 1, 0.8392157, 0, 1,
-1.041549, -1.206888, -2.34519, 1, 0.8470588, 0, 1,
-1.039164, -0.2191013, -0.731515, 1, 0.8509804, 0, 1,
-1.038241, 1.05927, -1.132702, 1, 0.8588235, 0, 1,
-1.036776, -0.1970806, -1.301823, 1, 0.8627451, 0, 1,
-1.036341, -1.150872, -1.541796, 1, 0.8705882, 0, 1,
-1.032879, -1.025727, -2.834219, 1, 0.8745098, 0, 1,
-1.015068, -0.03294504, -1.488557, 1, 0.8823529, 0, 1,
-1.009731, -0.5560592, -2.58029, 1, 0.8862745, 0, 1,
-1.009237, 0.3433909, -1.638578, 1, 0.8941177, 0, 1,
-1.004694, 0.3254302, -1.071063, 1, 0.8980392, 0, 1,
-1.003806, 3.006028, -0.4428518, 1, 0.9058824, 0, 1,
-1.003434, 0.978121, -0.796795, 1, 0.9137255, 0, 1,
-1.003361, -0.01355559, -0.7732652, 1, 0.9176471, 0, 1,
-1.001269, -1.921427, -3.705703, 1, 0.9254902, 0, 1,
-1.001153, -0.57421, -2.352157, 1, 0.9294118, 0, 1,
-1.001116, -0.4526364, -2.274572, 1, 0.9372549, 0, 1,
-0.9976938, -2.567585, -3.208509, 1, 0.9411765, 0, 1,
-0.9961929, 1.613532, -0.832861, 1, 0.9490196, 0, 1,
-0.9908263, -0.2909394, -2.939568, 1, 0.9529412, 0, 1,
-0.9898682, -1.412141, -3.550868, 1, 0.9607843, 0, 1,
-0.9885485, 0.2929477, -0.6327412, 1, 0.9647059, 0, 1,
-0.9824953, 0.1071533, -2.124065, 1, 0.972549, 0, 1,
-0.9785019, -0.242368, -3.283427, 1, 0.9764706, 0, 1,
-0.9732372, -1.003365, -2.466277, 1, 0.9843137, 0, 1,
-0.9684317, -0.3361075, -1.655655, 1, 0.9882353, 0, 1,
-0.9545606, 0.6115644, -2.008715, 1, 0.9960784, 0, 1,
-0.9478039, -1.365788, -1.083842, 0.9960784, 1, 0, 1,
-0.9420362, 0.178205, -2.312239, 0.9921569, 1, 0, 1,
-0.9359855, -0.7339626, -1.125252, 0.9843137, 1, 0, 1,
-0.9323948, -0.4965896, -3.024456, 0.9803922, 1, 0, 1,
-0.9314311, -0.6525825, -2.471599, 0.972549, 1, 0, 1,
-0.9286397, 0.7607259, -1.078724, 0.9686275, 1, 0, 1,
-0.9279288, -0.9176208, -2.715715, 0.9607843, 1, 0, 1,
-0.9257864, -1.351049, -4.154482, 0.9568627, 1, 0, 1,
-0.9220033, -0.2358971, -2.298215, 0.9490196, 1, 0, 1,
-0.9198378, -0.4048325, -3.687744, 0.945098, 1, 0, 1,
-0.9091519, 0.9866293, 0.3660007, 0.9372549, 1, 0, 1,
-0.8961032, -0.5120106, -2.198043, 0.9333333, 1, 0, 1,
-0.8952188, 0.6492481, -0.680226, 0.9254902, 1, 0, 1,
-0.8948469, 0.1021761, -2.818333, 0.9215686, 1, 0, 1,
-0.889263, 0.8257349, -2.195979, 0.9137255, 1, 0, 1,
-0.8864421, 0.7035366, -1.651466, 0.9098039, 1, 0, 1,
-0.8709994, -0.1417186, -2.780229, 0.9019608, 1, 0, 1,
-0.8694071, 1.008938, -0.9418351, 0.8941177, 1, 0, 1,
-0.8654073, 0.006480004, -1.117014, 0.8901961, 1, 0, 1,
-0.8649645, 0.1311114, -1.680109, 0.8823529, 1, 0, 1,
-0.8618741, 0.5265793, -0.5842765, 0.8784314, 1, 0, 1,
-0.8581262, -1.265279, -2.59034, 0.8705882, 1, 0, 1,
-0.8540316, 0.07091537, -1.277527, 0.8666667, 1, 0, 1,
-0.8463892, -0.733716, -1.320824, 0.8588235, 1, 0, 1,
-0.8437658, 0.7713248, -0.2920673, 0.854902, 1, 0, 1,
-0.8425426, 0.8678018, 0.2713179, 0.8470588, 1, 0, 1,
-0.8374799, 0.2798465, -1.590339, 0.8431373, 1, 0, 1,
-0.8362386, 0.01649718, -3.375819, 0.8352941, 1, 0, 1,
-0.8327287, -0.2684035, -2.202254, 0.8313726, 1, 0, 1,
-0.8307206, -1.114289, -3.544092, 0.8235294, 1, 0, 1,
-0.8289155, -0.6903985, -4.301863, 0.8196079, 1, 0, 1,
-0.8278095, -0.1317508, -2.16604, 0.8117647, 1, 0, 1,
-0.8258363, -0.5920234, -2.18956, 0.8078431, 1, 0, 1,
-0.8243614, -0.6458795, 0.1597371, 0.8, 1, 0, 1,
-0.821898, 1.799502, 0.08802959, 0.7921569, 1, 0, 1,
-0.8215809, -0.8277521, -2.221978, 0.7882353, 1, 0, 1,
-0.8187077, -0.1520827, 0.5631019, 0.7803922, 1, 0, 1,
-0.8177549, 0.3185827, -1.00958, 0.7764706, 1, 0, 1,
-0.8170792, 0.2056072, -1.536101, 0.7686275, 1, 0, 1,
-0.8151363, -0.7457514, -2.095958, 0.7647059, 1, 0, 1,
-0.8099005, 0.7442524, -2.340354, 0.7568628, 1, 0, 1,
-0.8064574, 0.1901554, -1.419649, 0.7529412, 1, 0, 1,
-0.8029659, -2.009627, -3.977752, 0.7450981, 1, 0, 1,
-0.7970121, 2.431523, -2.536592, 0.7411765, 1, 0, 1,
-0.7940433, 1.298417, -2.155841, 0.7333333, 1, 0, 1,
-0.7875419, 0.648674, -0.405937, 0.7294118, 1, 0, 1,
-0.7851291, -1.263081, -2.279692, 0.7215686, 1, 0, 1,
-0.7822856, 1.004407, -0.9202009, 0.7176471, 1, 0, 1,
-0.7717194, 1.048645, -1.280308, 0.7098039, 1, 0, 1,
-0.7701508, -0.7873163, -3.94623, 0.7058824, 1, 0, 1,
-0.7663836, -1.576293, -2.231441, 0.6980392, 1, 0, 1,
-0.7621318, -0.969145, -1.172984, 0.6901961, 1, 0, 1,
-0.7564836, 0.2417995, -1.532291, 0.6862745, 1, 0, 1,
-0.7548006, 0.8306983, -0.08035389, 0.6784314, 1, 0, 1,
-0.7532226, 1.665751, -0.5812706, 0.6745098, 1, 0, 1,
-0.7519839, 0.9109099, -1.070764, 0.6666667, 1, 0, 1,
-0.7500405, 0.2785035, -0.9845136, 0.6627451, 1, 0, 1,
-0.7473792, -0.549583, -0.4447533, 0.654902, 1, 0, 1,
-0.7375296, 0.2404831, -0.8880906, 0.6509804, 1, 0, 1,
-0.7360865, -1.300237, -2.191818, 0.6431373, 1, 0, 1,
-0.7337924, -1.353979, -1.570974, 0.6392157, 1, 0, 1,
-0.732972, -0.5177165, -3.300472, 0.6313726, 1, 0, 1,
-0.7232299, -0.3818281, -1.722431, 0.627451, 1, 0, 1,
-0.7230092, -0.4365099, -2.418389, 0.6196079, 1, 0, 1,
-0.718141, 0.2591242, -0.1029786, 0.6156863, 1, 0, 1,
-0.7123886, -0.7484433, -2.275366, 0.6078432, 1, 0, 1,
-0.7114186, -0.7543592, -2.855624, 0.6039216, 1, 0, 1,
-0.7099987, 0.4602188, -0.4454892, 0.5960785, 1, 0, 1,
-0.7073439, 1.576096, -2.191135, 0.5882353, 1, 0, 1,
-0.7034203, -0.3754598, -2.069252, 0.5843138, 1, 0, 1,
-0.700873, 1.700268, -0.7205211, 0.5764706, 1, 0, 1,
-0.6982237, -0.1666652, -2.919861, 0.572549, 1, 0, 1,
-0.6976792, -2.344151, -3.673863, 0.5647059, 1, 0, 1,
-0.695838, 0.1163801, -2.224823, 0.5607843, 1, 0, 1,
-0.6952033, -0.1690819, -2.631854, 0.5529412, 1, 0, 1,
-0.6863237, -1.225574, -1.960731, 0.5490196, 1, 0, 1,
-0.6845037, -0.1187534, -1.775647, 0.5411765, 1, 0, 1,
-0.6777666, -0.2210118, -1.164545, 0.5372549, 1, 0, 1,
-0.6765297, 0.7057218, -0.8455909, 0.5294118, 1, 0, 1,
-0.6742228, 1.065197, -1.330199, 0.5254902, 1, 0, 1,
-0.6729927, -0.871135, -2.314097, 0.5176471, 1, 0, 1,
-0.6706868, -1.127633, -2.730772, 0.5137255, 1, 0, 1,
-0.6675475, -0.208441, -1.521464, 0.5058824, 1, 0, 1,
-0.667322, -0.3751017, -1.310966, 0.5019608, 1, 0, 1,
-0.6566276, -0.430454, -3.087657, 0.4941176, 1, 0, 1,
-0.6477804, 0.01967064, -2.363348, 0.4862745, 1, 0, 1,
-0.6456735, 2.993345, 0.3566299, 0.4823529, 1, 0, 1,
-0.6414722, 1.400212, -0.360467, 0.4745098, 1, 0, 1,
-0.6411341, -1.400093, -1.772857, 0.4705882, 1, 0, 1,
-0.6381248, 0.8086657, -0.4908023, 0.4627451, 1, 0, 1,
-0.6364021, -0.2600245, -1.893702, 0.4588235, 1, 0, 1,
-0.6341575, -1.051091, -1.970261, 0.4509804, 1, 0, 1,
-0.6297276, 0.1939353, 0.7424495, 0.4470588, 1, 0, 1,
-0.6199275, -0.519397, -0.7504539, 0.4392157, 1, 0, 1,
-0.6169805, 0.09649924, -3.117915, 0.4352941, 1, 0, 1,
-0.6154798, -0.2388652, -1.292522, 0.427451, 1, 0, 1,
-0.6153933, -0.8239447, -1.910682, 0.4235294, 1, 0, 1,
-0.6131608, -0.3206228, -0.2031748, 0.4156863, 1, 0, 1,
-0.6096858, 2.315127, -1.10085, 0.4117647, 1, 0, 1,
-0.6092124, -0.3133338, -3.430118, 0.4039216, 1, 0, 1,
-0.6082621, -1.018335, -1.70197, 0.3960784, 1, 0, 1,
-0.6072142, -0.8595398, -2.941684, 0.3921569, 1, 0, 1,
-0.5964248, 0.7179478, -0.1247618, 0.3843137, 1, 0, 1,
-0.5906056, 0.8111336, -1.433303, 0.3803922, 1, 0, 1,
-0.5881932, 0.1385937, 0.3258743, 0.372549, 1, 0, 1,
-0.5868966, 0.5069183, -1.162208, 0.3686275, 1, 0, 1,
-0.5829644, 0.3895655, -1.796834, 0.3607843, 1, 0, 1,
-0.573736, 0.1603233, -2.019088, 0.3568628, 1, 0, 1,
-0.5702875, -0.4167252, -3.001252, 0.3490196, 1, 0, 1,
-0.5669501, -0.591434, -3.154318, 0.345098, 1, 0, 1,
-0.5653877, -0.806751, -2.357877, 0.3372549, 1, 0, 1,
-0.5651462, -1.109912, -1.805715, 0.3333333, 1, 0, 1,
-0.5651147, -0.3405285, -1.916096, 0.3254902, 1, 0, 1,
-0.5594354, 1.807624, -0.4464639, 0.3215686, 1, 0, 1,
-0.5593967, 0.8279442, -1.965979, 0.3137255, 1, 0, 1,
-0.5586467, 0.6845821, -0.9943689, 0.3098039, 1, 0, 1,
-0.5576785, 0.5611628, 0.5382516, 0.3019608, 1, 0, 1,
-0.5573447, 0.1697481, -1.178541, 0.2941177, 1, 0, 1,
-0.5531757, -0.3688918, -4.130986, 0.2901961, 1, 0, 1,
-0.5510536, -1.129636, -2.682071, 0.282353, 1, 0, 1,
-0.550073, -1.776036, -3.578343, 0.2784314, 1, 0, 1,
-0.5454668, -1.837556, -2.482533, 0.2705882, 1, 0, 1,
-0.5448819, -3.545878, -2.137484, 0.2666667, 1, 0, 1,
-0.5400148, 0.2889551, -0.2564847, 0.2588235, 1, 0, 1,
-0.5397442, -1.12983, -3.952894, 0.254902, 1, 0, 1,
-0.536188, 0.988097, -1.316981, 0.2470588, 1, 0, 1,
-0.534692, -0.7051715, -1.114729, 0.2431373, 1, 0, 1,
-0.5337904, 2.52836, 0.1351527, 0.2352941, 1, 0, 1,
-0.5334311, 0.04262374, -2.440418, 0.2313726, 1, 0, 1,
-0.5333744, 0.4166971, -0.3390076, 0.2235294, 1, 0, 1,
-0.5194702, -0.9590843, -1.814727, 0.2196078, 1, 0, 1,
-0.513786, 0.05364211, -2.642788, 0.2117647, 1, 0, 1,
-0.5134458, -0.6597707, -3.070184, 0.2078431, 1, 0, 1,
-0.5123044, 0.3122024, -0.4106234, 0.2, 1, 0, 1,
-0.5096326, -0.4804532, -0.1821813, 0.1921569, 1, 0, 1,
-0.5074027, 2.145256, 0.1097098, 0.1882353, 1, 0, 1,
-0.5037431, -0.4125701, -1.917745, 0.1803922, 1, 0, 1,
-0.5027686, -1.450969, -2.601493, 0.1764706, 1, 0, 1,
-0.4971638, -0.1375845, -1.604564, 0.1686275, 1, 0, 1,
-0.4969518, 1.826949, -0.5380825, 0.1647059, 1, 0, 1,
-0.4922132, 0.1637223, -3.034492, 0.1568628, 1, 0, 1,
-0.4900294, -0.8665244, -1.840313, 0.1529412, 1, 0, 1,
-0.4885027, 0.002540515, -2.203912, 0.145098, 1, 0, 1,
-0.4861382, 1.11079, -2.088224, 0.1411765, 1, 0, 1,
-0.4792882, -0.408921, -1.154872, 0.1333333, 1, 0, 1,
-0.4740491, -0.08366811, -0.9836337, 0.1294118, 1, 0, 1,
-0.4730111, -0.004130766, -2.060529, 0.1215686, 1, 0, 1,
-0.4715913, -0.4622398, -2.568768, 0.1176471, 1, 0, 1,
-0.4689213, -0.9142587, -3.647596, 0.1098039, 1, 0, 1,
-0.4677096, 0.2976307, -0.3698057, 0.1058824, 1, 0, 1,
-0.4651778, 0.2949659, -0.5752159, 0.09803922, 1, 0, 1,
-0.4642946, 1.411535, -1.462232, 0.09019608, 1, 0, 1,
-0.4620129, -1.225546, -2.393107, 0.08627451, 1, 0, 1,
-0.4614569, -0.6418056, -1.774826, 0.07843138, 1, 0, 1,
-0.4594721, -1.002056, -2.777985, 0.07450981, 1, 0, 1,
-0.4581336, -0.5129018, -2.853901, 0.06666667, 1, 0, 1,
-0.4560736, -0.6877983, -2.795115, 0.0627451, 1, 0, 1,
-0.4523815, 0.9577374, 0.6392098, 0.05490196, 1, 0, 1,
-0.4487196, -0.5121448, -1.805866, 0.05098039, 1, 0, 1,
-0.4463179, 0.4365315, 0.8183649, 0.04313726, 1, 0, 1,
-0.4442551, 0.2509823, -1.804134, 0.03921569, 1, 0, 1,
-0.4434608, -0.4711602, -0.1096069, 0.03137255, 1, 0, 1,
-0.4422084, -0.7024336, -1.599549, 0.02745098, 1, 0, 1,
-0.4383106, -0.9742156, -3.971467, 0.01960784, 1, 0, 1,
-0.4373742, 1.264539, -0.1714072, 0.01568628, 1, 0, 1,
-0.4334978, -0.1849644, -3.520008, 0.007843138, 1, 0, 1,
-0.4224491, -1.241442, -2.772943, 0.003921569, 1, 0, 1,
-0.4122483, 0.5871964, -2.127884, 0, 1, 0.003921569, 1,
-0.4091654, -0.5162678, -5.584602, 0, 1, 0.01176471, 1,
-0.4045247, 0.1413879, -2.352147, 0, 1, 0.01568628, 1,
-0.4035357, 0.6481678, -0.1618182, 0, 1, 0.02352941, 1,
-0.4025384, -2.238868, -2.794381, 0, 1, 0.02745098, 1,
-0.4024018, 1.526754, 0.5920411, 0, 1, 0.03529412, 1,
-0.4022574, 1.641364, -0.3623587, 0, 1, 0.03921569, 1,
-0.4010989, 0.6774973, -0.595898, 0, 1, 0.04705882, 1,
-0.4006879, -1.48895, -4.697155, 0, 1, 0.05098039, 1,
-0.39898, 2.522878, 0.2013814, 0, 1, 0.05882353, 1,
-0.3980395, -0.2015782, -1.152462, 0, 1, 0.0627451, 1,
-0.3951381, 0.9997011, -0.8031711, 0, 1, 0.07058824, 1,
-0.3940541, 0.08840657, -1.720888, 0, 1, 0.07450981, 1,
-0.3934772, -1.111094, -4.611174, 0, 1, 0.08235294, 1,
-0.3918424, 0.9274555, -1.12212, 0, 1, 0.08627451, 1,
-0.3870128, -0.06750929, -0.4352925, 0, 1, 0.09411765, 1,
-0.3834727, -1.114817, -4.089753, 0, 1, 0.1019608, 1,
-0.383127, -1.158373, -3.477633, 0, 1, 0.1058824, 1,
-0.3827733, 1.578344, 1.461841, 0, 1, 0.1137255, 1,
-0.3786836, 0.2373059, -0.5750644, 0, 1, 0.1176471, 1,
-0.3771766, 1.38803, -1.607678, 0, 1, 0.1254902, 1,
-0.3679276, -0.4847871, -2.677961, 0, 1, 0.1294118, 1,
-0.3670657, 0.8721827, -1.027413, 0, 1, 0.1372549, 1,
-0.3645727, -1.72666, -4.192494, 0, 1, 0.1411765, 1,
-0.3631994, 0.7721931, -0.9345986, 0, 1, 0.1490196, 1,
-0.3611088, 0.01527455, -2.100171, 0, 1, 0.1529412, 1,
-0.3597687, 0.303328, -2.236172, 0, 1, 0.1607843, 1,
-0.3543267, 0.2113914, -0.1678658, 0, 1, 0.1647059, 1,
-0.353957, 1.287103, -0.9607387, 0, 1, 0.172549, 1,
-0.3529009, 2.481836, -0.5632848, 0, 1, 0.1764706, 1,
-0.3386054, 1.527121, 0.6353276, 0, 1, 0.1843137, 1,
-0.3352857, 0.1621463, -0.3261244, 0, 1, 0.1882353, 1,
-0.3289638, 0.5659685, 1.48901, 0, 1, 0.1960784, 1,
-0.3271385, 0.3350133, 1.390381, 0, 1, 0.2039216, 1,
-0.325567, -1.001884, -0.8477593, 0, 1, 0.2078431, 1,
-0.3254819, 0.7524576, -0.1466905, 0, 1, 0.2156863, 1,
-0.3251098, -0.1219733, -3.222352, 0, 1, 0.2196078, 1,
-0.3241379, -1.276363, -2.171299, 0, 1, 0.227451, 1,
-0.3238953, -0.3528284, -1.68235, 0, 1, 0.2313726, 1,
-0.3212896, -0.3380861, -3.120716, 0, 1, 0.2392157, 1,
-0.317886, 0.5362975, -1.747687, 0, 1, 0.2431373, 1,
-0.3165091, -0.1404096, -2.735776, 0, 1, 0.2509804, 1,
-0.3118788, -0.5502006, -3.314577, 0, 1, 0.254902, 1,
-0.3059941, -1.562617, -4.280722, 0, 1, 0.2627451, 1,
-0.2997721, -0.6793402, -1.873916, 0, 1, 0.2666667, 1,
-0.2986207, 0.2471601, -0.8612668, 0, 1, 0.2745098, 1,
-0.2940943, 0.9441906, 1.561567, 0, 1, 0.2784314, 1,
-0.2904253, -0.6784065, -2.945159, 0, 1, 0.2862745, 1,
-0.2892505, -1.184852, -3.88478, 0, 1, 0.2901961, 1,
-0.2886128, 0.3439073, -1.286073, 0, 1, 0.2980392, 1,
-0.2872167, -0.3819877, -3.832026, 0, 1, 0.3058824, 1,
-0.2852768, -0.3380895, -3.544729, 0, 1, 0.3098039, 1,
-0.2849771, 0.8464031, 0.1365636, 0, 1, 0.3176471, 1,
-0.2845961, -1.625839, -5.054149, 0, 1, 0.3215686, 1,
-0.2844578, -1.639752, -2.810775, 0, 1, 0.3294118, 1,
-0.2827899, -0.8259032, -2.643082, 0, 1, 0.3333333, 1,
-0.2823965, 0.9491638, 1.018587, 0, 1, 0.3411765, 1,
-0.2815352, -0.9137087, -1.266551, 0, 1, 0.345098, 1,
-0.2813027, -0.4622998, -3.498469, 0, 1, 0.3529412, 1,
-0.2811721, -0.129704, -2.910569, 0, 1, 0.3568628, 1,
-0.2807538, -0.06435884, -3.092584, 0, 1, 0.3647059, 1,
-0.2715901, -2.760316, -4.643243, 0, 1, 0.3686275, 1,
-0.2700954, -0.8646917, -3.390322, 0, 1, 0.3764706, 1,
-0.2700335, -0.6395519, -2.752003, 0, 1, 0.3803922, 1,
-0.2689066, -0.4332888, -1.833026, 0, 1, 0.3882353, 1,
-0.2669874, -1.98116, -3.690272, 0, 1, 0.3921569, 1,
-0.2595323, 0.1752174, -1.474244, 0, 1, 0.4, 1,
-0.2556368, 0.2264043, -2.570526, 0, 1, 0.4078431, 1,
-0.2553422, -2.137765, -3.267437, 0, 1, 0.4117647, 1,
-0.2487393, -1.039164, -0.3592238, 0, 1, 0.4196078, 1,
-0.2474134, 0.01888238, -1.114663, 0, 1, 0.4235294, 1,
-0.2449074, -1.375854, -3.086327, 0, 1, 0.4313726, 1,
-0.2417934, 0.3951399, -0.9722067, 0, 1, 0.4352941, 1,
-0.2417797, -0.2784355, -1.913423, 0, 1, 0.4431373, 1,
-0.2414081, -0.8803784, -4.058216, 0, 1, 0.4470588, 1,
-0.2332464, -1.165843, -3.32901, 0, 1, 0.454902, 1,
-0.223188, 0.3545707, -0.9044976, 0, 1, 0.4588235, 1,
-0.2179172, -1.663589, -2.674028, 0, 1, 0.4666667, 1,
-0.2151554, 1.423262, -1.904308, 0, 1, 0.4705882, 1,
-0.2136485, -0.1027601, -0.4940681, 0, 1, 0.4784314, 1,
-0.2021338, -0.1351745, -1.813409, 0, 1, 0.4823529, 1,
-0.1948972, -0.6648301, -3.108591, 0, 1, 0.4901961, 1,
-0.1915944, 0.3885733, -0.03455217, 0, 1, 0.4941176, 1,
-0.1893621, 0.3287427, -0.1953674, 0, 1, 0.5019608, 1,
-0.1892583, -0.5594594, -3.460834, 0, 1, 0.509804, 1,
-0.1892406, -0.8210331, -3.146075, 0, 1, 0.5137255, 1,
-0.1813217, 0.8518563, 0.07368711, 0, 1, 0.5215687, 1,
-0.1813139, -0.4081904, -0.9304519, 0, 1, 0.5254902, 1,
-0.1780252, 0.4488067, -2.309153, 0, 1, 0.5333334, 1,
-0.1769463, 0.9419348, -0.4646538, 0, 1, 0.5372549, 1,
-0.1754812, -0.01741484, -1.558716, 0, 1, 0.5450981, 1,
-0.1752842, -0.5964176, -2.797093, 0, 1, 0.5490196, 1,
-0.1750385, -0.8326164, -2.057111, 0, 1, 0.5568628, 1,
-0.1723493, 2.003638, 0.2779112, 0, 1, 0.5607843, 1,
-0.1692932, -0.7831192, -2.848276, 0, 1, 0.5686275, 1,
-0.1684463, -0.3226935, -3.449046, 0, 1, 0.572549, 1,
-0.1679364, 0.6708723, -0.3945149, 0, 1, 0.5803922, 1,
-0.1615695, -0.9753512, -2.525128, 0, 1, 0.5843138, 1,
-0.1607151, -0.754191, -1.719682, 0, 1, 0.5921569, 1,
-0.1590999, 0.08461072, -0.6413482, 0, 1, 0.5960785, 1,
-0.157491, -0.9426981, -2.566446, 0, 1, 0.6039216, 1,
-0.1533018, -1.997849, -2.84925, 0, 1, 0.6117647, 1,
-0.1530004, 0.7526054, 2.236929, 0, 1, 0.6156863, 1,
-0.1474632, -0.1381994, -2.083415, 0, 1, 0.6235294, 1,
-0.1423461, -2.298335, -2.541787, 0, 1, 0.627451, 1,
-0.1403204, -0.3971806, -3.672285, 0, 1, 0.6352941, 1,
-0.1360856, 1.235171, -0.4458476, 0, 1, 0.6392157, 1,
-0.1352647, 0.7400911, -0.6986522, 0, 1, 0.6470588, 1,
-0.1338495, 0.09259981, -1.853626, 0, 1, 0.6509804, 1,
-0.133066, 0.9908031, 0.8117085, 0, 1, 0.6588235, 1,
-0.1314773, -0.3505564, -3.330788, 0, 1, 0.6627451, 1,
-0.1303147, 1.416952, 0.7933614, 0, 1, 0.6705883, 1,
-0.1283366, -0.4881147, -1.785163, 0, 1, 0.6745098, 1,
-0.126673, 1.07931, 0.3296472, 0, 1, 0.682353, 1,
-0.124267, 0.9527624, 0.6359119, 0, 1, 0.6862745, 1,
-0.122917, -2.681653, -3.379733, 0, 1, 0.6941177, 1,
-0.1223389, 0.493602, -1.502501, 0, 1, 0.7019608, 1,
-0.1189763, 0.2270659, -0.5458717, 0, 1, 0.7058824, 1,
-0.1158546, 0.5454475, -1.305505, 0, 1, 0.7137255, 1,
-0.1050271, -1.671251, -2.064177, 0, 1, 0.7176471, 1,
-0.1020165, 0.293994, -0.6498749, 0, 1, 0.7254902, 1,
-0.09830032, -0.3751949, -2.649081, 0, 1, 0.7294118, 1,
-0.09705658, 0.00477556, -2.07893, 0, 1, 0.7372549, 1,
-0.09368464, -3.557072, -4.879477, 0, 1, 0.7411765, 1,
-0.093416, 1.182183, -0.8167691, 0, 1, 0.7490196, 1,
-0.09253892, 0.3505151, -0.08922358, 0, 1, 0.7529412, 1,
-0.08990159, 1.15014, 0.321272, 0, 1, 0.7607843, 1,
-0.08770526, 0.5779932, 0.2199041, 0, 1, 0.7647059, 1,
-0.08497086, -1.04214, -2.725873, 0, 1, 0.772549, 1,
-0.08250616, -0.1072934, -2.782376, 0, 1, 0.7764706, 1,
-0.08155662, 2.246724, 0.1530239, 0, 1, 0.7843137, 1,
-0.08031296, 0.7273443, 0.06194027, 0, 1, 0.7882353, 1,
-0.07842482, 0.8318824, -0.5209631, 0, 1, 0.7960784, 1,
-0.07563619, -0.1084525, -1.948711, 0, 1, 0.8039216, 1,
-0.07490566, 0.7722327, 0.807204, 0, 1, 0.8078431, 1,
-0.07135054, 1.124859, -0.9818302, 0, 1, 0.8156863, 1,
-0.06536047, 0.8077347, -0.4310025, 0, 1, 0.8196079, 1,
-0.05825417, 1.380847, 1.226025, 0, 1, 0.827451, 1,
-0.05800854, -0.537532, -1.778314, 0, 1, 0.8313726, 1,
-0.05544779, 0.4535836, 0.599232, 0, 1, 0.8392157, 1,
-0.05308774, 0.06510994, 0.2566748, 0, 1, 0.8431373, 1,
-0.04734916, 1.344831, 0.5587103, 0, 1, 0.8509804, 1,
-0.04588981, 0.3306948, -0.04916221, 0, 1, 0.854902, 1,
-0.045876, 0.02818459, -0.6723098, 0, 1, 0.8627451, 1,
-0.04336048, -0.7828014, -3.363002, 0, 1, 0.8666667, 1,
-0.04289617, -1.32646, -2.760582, 0, 1, 0.8745098, 1,
-0.04146682, -0.06479124, -3.168545, 0, 1, 0.8784314, 1,
-0.04086101, 1.146528, -0.04307266, 0, 1, 0.8862745, 1,
-0.0365251, 1.97131, -2.021289, 0, 1, 0.8901961, 1,
-0.02895718, 0.2666676, 1.572537, 0, 1, 0.8980392, 1,
-0.02857254, -0.06284679, -3.011147, 0, 1, 0.9058824, 1,
-0.02504307, -0.7643574, -3.371139, 0, 1, 0.9098039, 1,
-0.02041252, -1.902166, -2.713424, 0, 1, 0.9176471, 1,
-0.0177474, -0.2017535, -2.435292, 0, 1, 0.9215686, 1,
-0.005642281, -0.134894, -3.696711, 0, 1, 0.9294118, 1,
-0.005408658, -1.031443, -2.277785, 0, 1, 0.9333333, 1,
-0.0004330301, 0.7052327, 0.9690674, 0, 1, 0.9411765, 1,
0.001121948, -1.59031, 3.59865, 0, 1, 0.945098, 1,
0.001953831, -0.6561407, 3.604427, 0, 1, 0.9529412, 1,
0.002016681, -0.8762027, 2.871669, 0, 1, 0.9568627, 1,
0.003393018, -0.9764021, 2.018783, 0, 1, 0.9647059, 1,
0.004100138, 1.574783, 0.195817, 0, 1, 0.9686275, 1,
0.004132236, 1.2102, 1.146351, 0, 1, 0.9764706, 1,
0.01727254, -2.445258, 3.868042, 0, 1, 0.9803922, 1,
0.02328914, -0.86606, 2.349763, 0, 1, 0.9882353, 1,
0.02369727, 0.755631, -0.02791083, 0, 1, 0.9921569, 1,
0.02483771, -0.07330202, 2.604146, 0, 1, 1, 1,
0.02617776, -0.4572341, 4.152081, 0, 0.9921569, 1, 1,
0.02793229, 0.5052667, 0.4579434, 0, 0.9882353, 1, 1,
0.02877775, 0.2956443, -0.2013863, 0, 0.9803922, 1, 1,
0.02991041, 0.3488563, -0.2079189, 0, 0.9764706, 1, 1,
0.0326266, 1.179331, -0.9219418, 0, 0.9686275, 1, 1,
0.03390291, 0.3256528, 1.368616, 0, 0.9647059, 1, 1,
0.03438289, 0.7226796, 0.4599056, 0, 0.9568627, 1, 1,
0.0353739, 1.108912, -0.3994924, 0, 0.9529412, 1, 1,
0.03963258, 0.5722589, -1.91829, 0, 0.945098, 1, 1,
0.04191952, 0.09493121, -0.03646272, 0, 0.9411765, 1, 1,
0.04197709, 1.246298, -1.005535, 0, 0.9333333, 1, 1,
0.04536884, -0.2778377, 4.886218, 0, 0.9294118, 1, 1,
0.04577104, -1.580841, 3.155838, 0, 0.9215686, 1, 1,
0.04608326, -0.7379251, 3.377918, 0, 0.9176471, 1, 1,
0.05384222, 0.04317643, 1.013208, 0, 0.9098039, 1, 1,
0.0557153, -0.3534978, 3.433901, 0, 0.9058824, 1, 1,
0.05649446, 0.7160047, 0.02128994, 0, 0.8980392, 1, 1,
0.06222498, 0.3807701, -0.8384798, 0, 0.8901961, 1, 1,
0.06247959, 1.412945, 1.339299, 0, 0.8862745, 1, 1,
0.06756184, -0.3653033, 4.15498, 0, 0.8784314, 1, 1,
0.06948496, 1.056496, 0.7482046, 0, 0.8745098, 1, 1,
0.06992166, 0.3970673, -0.7514885, 0, 0.8666667, 1, 1,
0.0719818, -0.2566113, 2.857595, 0, 0.8627451, 1, 1,
0.0734843, 1.50464, -0.05214404, 0, 0.854902, 1, 1,
0.07397348, 0.1888587, -0.1083013, 0, 0.8509804, 1, 1,
0.07501029, 0.09445642, 0.2308831, 0, 0.8431373, 1, 1,
0.07592919, 0.5052196, 1.275602, 0, 0.8392157, 1, 1,
0.07701016, 0.3195128, -1.06004, 0, 0.8313726, 1, 1,
0.08495913, -0.2331562, 2.585051, 0, 0.827451, 1, 1,
0.08674408, 0.3227446, 0.4024809, 0, 0.8196079, 1, 1,
0.09068538, 0.2949263, 1.965198, 0, 0.8156863, 1, 1,
0.09112511, -0.2070817, 2.377844, 0, 0.8078431, 1, 1,
0.09691847, -0.8051883, 3.810165, 0, 0.8039216, 1, 1,
0.09809364, 0.02400405, 2.121293, 0, 0.7960784, 1, 1,
0.1017514, -0.1191598, 5.453482, 0, 0.7882353, 1, 1,
0.101901, 0.1047654, -2.112844, 0, 0.7843137, 1, 1,
0.1023655, 0.2665527, -0.7676695, 0, 0.7764706, 1, 1,
0.1028316, 0.2735752, 0.6624708, 0, 0.772549, 1, 1,
0.1029888, -0.2677459, 4.080381, 0, 0.7647059, 1, 1,
0.1042204, 0.7578134, -0.6502269, 0, 0.7607843, 1, 1,
0.1086783, 0.8049561, -0.6997632, 0, 0.7529412, 1, 1,
0.1163951, 0.1455601, 1.600852, 0, 0.7490196, 1, 1,
0.1169775, 0.6005613, 0.2635628, 0, 0.7411765, 1, 1,
0.1201347, 1.307234, -0.4923868, 0, 0.7372549, 1, 1,
0.123147, 0.2446863, 2.099352, 0, 0.7294118, 1, 1,
0.1255895, -1.504334, 2.418795, 0, 0.7254902, 1, 1,
0.126812, -1.153833, 4.99853, 0, 0.7176471, 1, 1,
0.1294892, -0.9914612, 1.380461, 0, 0.7137255, 1, 1,
0.1382679, -1.269902, 2.630499, 0, 0.7058824, 1, 1,
0.1386965, -0.3761818, 3.510603, 0, 0.6980392, 1, 1,
0.1408642, 0.8157896, -1.370804, 0, 0.6941177, 1, 1,
0.1472521, -2.352108, 4.300678, 0, 0.6862745, 1, 1,
0.1478692, -1.595766, 2.584407, 0, 0.682353, 1, 1,
0.1479364, -1.150143, 3.601725, 0, 0.6745098, 1, 1,
0.1502297, 1.854345, -1.594206, 0, 0.6705883, 1, 1,
0.1510782, 2.054403, -1.051098, 0, 0.6627451, 1, 1,
0.1568813, 0.1461485, 0.4825791, 0, 0.6588235, 1, 1,
0.1579081, -0.638428, 2.290144, 0, 0.6509804, 1, 1,
0.158238, -1.395257, 2.51353, 0, 0.6470588, 1, 1,
0.1605326, 1.413436, -1.401327, 0, 0.6392157, 1, 1,
0.1608839, -1.917889, 4.350764, 0, 0.6352941, 1, 1,
0.1625443, -1.116904, 4.201106, 0, 0.627451, 1, 1,
0.168643, -0.4302693, 1.750005, 0, 0.6235294, 1, 1,
0.1693915, -0.8958229, 3.251501, 0, 0.6156863, 1, 1,
0.1704015, 1.158301, 0.9873897, 0, 0.6117647, 1, 1,
0.1723011, 0.4341149, -0.1277248, 0, 0.6039216, 1, 1,
0.1780037, 2.400811, 1.848862, 0, 0.5960785, 1, 1,
0.1802786, 0.3494802, -0.1698509, 0, 0.5921569, 1, 1,
0.1812015, 0.6094943, 1.352069, 0, 0.5843138, 1, 1,
0.1861195, 0.3576686, 1.218567, 0, 0.5803922, 1, 1,
0.1951503, -0.7844412, 2.033147, 0, 0.572549, 1, 1,
0.1952381, 0.5751827, 0.2396696, 0, 0.5686275, 1, 1,
0.1979559, 0.4545265, -0.2058787, 0, 0.5607843, 1, 1,
0.1983543, 1.67344, -0.6531777, 0, 0.5568628, 1, 1,
0.2002561, 1.875889, 0.5041108, 0, 0.5490196, 1, 1,
0.2021842, 1.355664, 1.001266, 0, 0.5450981, 1, 1,
0.2039296, 0.9198639, 0.4971989, 0, 0.5372549, 1, 1,
0.2047753, -0.8429103, 2.229695, 0, 0.5333334, 1, 1,
0.2060035, -0.6364143, 1.836906, 0, 0.5254902, 1, 1,
0.2061525, 0.9738259, 1.627938, 0, 0.5215687, 1, 1,
0.2064003, -1.441561, 3.45842, 0, 0.5137255, 1, 1,
0.2145002, 0.4571844, 2.125364, 0, 0.509804, 1, 1,
0.2174439, -0.4394184, 2.999422, 0, 0.5019608, 1, 1,
0.2179857, 0.8829872, 0.1195027, 0, 0.4941176, 1, 1,
0.2182252, 0.1158478, 1.913027, 0, 0.4901961, 1, 1,
0.2190372, -0.7730511, 4.239789, 0, 0.4823529, 1, 1,
0.2200845, -0.8342723, 0.03724187, 0, 0.4784314, 1, 1,
0.2221661, 0.8675789, 0.2666173, 0, 0.4705882, 1, 1,
0.2222209, 0.3924869, -0.7909905, 0, 0.4666667, 1, 1,
0.2271965, -0.4506683, 2.317432, 0, 0.4588235, 1, 1,
0.2288168, 0.5048729, -0.738465, 0, 0.454902, 1, 1,
0.2299767, -1.470506, 2.345916, 0, 0.4470588, 1, 1,
0.2339388, 0.2408756, 1.353153, 0, 0.4431373, 1, 1,
0.2353256, -0.3668807, 2.005263, 0, 0.4352941, 1, 1,
0.2380936, -0.8212562, 3.156797, 0, 0.4313726, 1, 1,
0.2417386, 0.5126292, 0.5985159, 0, 0.4235294, 1, 1,
0.2446164, -0.4071778, 3.032368, 0, 0.4196078, 1, 1,
0.2491898, 0.6267578, 0.09512136, 0, 0.4117647, 1, 1,
0.2503536, 0.8424504, 0.7591703, 0, 0.4078431, 1, 1,
0.2508894, -1.322086, 4.22958, 0, 0.4, 1, 1,
0.2518117, -0.9517793, 2.408872, 0, 0.3921569, 1, 1,
0.2521915, 0.8441397, 0.7224444, 0, 0.3882353, 1, 1,
0.2523934, -1.284888, 2.504007, 0, 0.3803922, 1, 1,
0.2546783, -0.2968947, 1.621532, 0, 0.3764706, 1, 1,
0.2551193, 1.112507, 0.340537, 0, 0.3686275, 1, 1,
0.257851, 0.1779334, -0.3038827, 0, 0.3647059, 1, 1,
0.2586456, 0.6824606, -0.3938614, 0, 0.3568628, 1, 1,
0.2600087, 0.4382996, 0.5188152, 0, 0.3529412, 1, 1,
0.2600139, -1.446847, 1.879535, 0, 0.345098, 1, 1,
0.2689745, 0.05078515, 2.623674, 0, 0.3411765, 1, 1,
0.271378, 1.065661, 0.3588317, 0, 0.3333333, 1, 1,
0.2781868, 0.4886391, 1.459846, 0, 0.3294118, 1, 1,
0.2792458, 0.6410013, 0.5610712, 0, 0.3215686, 1, 1,
0.2836685, -0.0925559, 1.738648, 0, 0.3176471, 1, 1,
0.2849633, 0.7043343, 1.240941, 0, 0.3098039, 1, 1,
0.306371, -1.188058, 1.568543, 0, 0.3058824, 1, 1,
0.307615, -0.6340925, 3.702162, 0, 0.2980392, 1, 1,
0.3129895, -0.9071797, -0.1017601, 0, 0.2901961, 1, 1,
0.3163487, -0.2990122, 3.304126, 0, 0.2862745, 1, 1,
0.3231823, 0.3171548, 0.8911501, 0, 0.2784314, 1, 1,
0.325183, 0.3654247, 0.6807394, 0, 0.2745098, 1, 1,
0.3299907, 1.147831, -1.465805, 0, 0.2666667, 1, 1,
0.3306456, 1.473494, -1.26421, 0, 0.2627451, 1, 1,
0.3352095, 0.07111157, 0.02534077, 0, 0.254902, 1, 1,
0.3357338, 0.02322148, 1.467688, 0, 0.2509804, 1, 1,
0.3370637, -1.676469, 2.016309, 0, 0.2431373, 1, 1,
0.3413608, -0.8776113, 0.3700896, 0, 0.2392157, 1, 1,
0.3416952, 1.192819, 0.3422655, 0, 0.2313726, 1, 1,
0.3433286, 3.618075, 1.101229, 0, 0.227451, 1, 1,
0.3446953, 1.87195, 1.525238, 0, 0.2196078, 1, 1,
0.3478111, 0.231229, 1.577131, 0, 0.2156863, 1, 1,
0.3488752, 0.09867768, 0.02876311, 0, 0.2078431, 1, 1,
0.3497579, 0.04446131, 1.313784, 0, 0.2039216, 1, 1,
0.3497901, -1.114444, 2.602749, 0, 0.1960784, 1, 1,
0.3511596, 0.162468, 1.76909, 0, 0.1882353, 1, 1,
0.3523324, -0.1660814, 3.955355, 0, 0.1843137, 1, 1,
0.3549934, -1.188189, 3.643808, 0, 0.1764706, 1, 1,
0.3582845, -0.7043023, 2.452224, 0, 0.172549, 1, 1,
0.358521, 2.587415, -0.04320314, 0, 0.1647059, 1, 1,
0.3612274, -1.601956, 3.237864, 0, 0.1607843, 1, 1,
0.3658116, 0.197634, 1.504213, 0, 0.1529412, 1, 1,
0.3699878, -0.03621453, 1.130648, 0, 0.1490196, 1, 1,
0.3711131, -1.465599, 3.453665, 0, 0.1411765, 1, 1,
0.3740694, 0.1832602, 0.7562265, 0, 0.1372549, 1, 1,
0.3774514, -0.8085905, 2.584761, 0, 0.1294118, 1, 1,
0.3788362, 1.401309, 0.2617115, 0, 0.1254902, 1, 1,
0.379765, -0.4104193, 2.652884, 0, 0.1176471, 1, 1,
0.3864585, 1.136063, 1.656463, 0, 0.1137255, 1, 1,
0.3867985, 0.006821711, 0.3069283, 0, 0.1058824, 1, 1,
0.3884368, -0.2659885, 2.28691, 0, 0.09803922, 1, 1,
0.3977339, -0.6861568, 2.107967, 0, 0.09411765, 1, 1,
0.4006156, 0.3407, 0.5081416, 0, 0.08627451, 1, 1,
0.4040561, -0.3704962, 2.158555, 0, 0.08235294, 1, 1,
0.4110328, -0.285641, 0.9993747, 0, 0.07450981, 1, 1,
0.411567, 0.7293078, 0.4152832, 0, 0.07058824, 1, 1,
0.4122619, -0.7403976, 1.277709, 0, 0.0627451, 1, 1,
0.4214969, -0.05576649, 1.413186, 0, 0.05882353, 1, 1,
0.4287561, -0.5570942, 0.4363145, 0, 0.05098039, 1, 1,
0.4305893, 0.3191799, -0.3462571, 0, 0.04705882, 1, 1,
0.4327696, 2.059038, -1.491296, 0, 0.03921569, 1, 1,
0.4333869, 0.6377066, 0.127316, 0, 0.03529412, 1, 1,
0.4344659, -2.152682, 3.204298, 0, 0.02745098, 1, 1,
0.435044, 1.244484, -0.0511524, 0, 0.02352941, 1, 1,
0.4366909, -1.217624, 2.425669, 0, 0.01568628, 1, 1,
0.4429272, 1.131073, 1.355497, 0, 0.01176471, 1, 1,
0.4438968, -1.84313, 2.430032, 0, 0.003921569, 1, 1,
0.4440223, 1.803065, 0.6294163, 0.003921569, 0, 1, 1,
0.4476963, 0.7491105, 1.518255, 0.007843138, 0, 1, 1,
0.4590573, 0.1823141, 3.28282, 0.01568628, 0, 1, 1,
0.4640366, -0.7700607, 2.58526, 0.01960784, 0, 1, 1,
0.4663054, -0.5963396, 3.368859, 0.02745098, 0, 1, 1,
0.4669339, -0.5588713, 3.309309, 0.03137255, 0, 1, 1,
0.4698928, 0.3921461, -0.001593155, 0.03921569, 0, 1, 1,
0.4709227, 1.378609, 0.1518094, 0.04313726, 0, 1, 1,
0.4769709, -0.9344985, 4.876203, 0.05098039, 0, 1, 1,
0.4798242, -0.5597332, 2.626265, 0.05490196, 0, 1, 1,
0.480351, -1.543475, 4.564923, 0.0627451, 0, 1, 1,
0.4828345, 1.686597, -0.5890825, 0.06666667, 0, 1, 1,
0.4853693, -0.1754338, 2.285336, 0.07450981, 0, 1, 1,
0.4923136, 0.3902312, -0.05333367, 0.07843138, 0, 1, 1,
0.495372, -1.156242, 2.389752, 0.08627451, 0, 1, 1,
0.4967465, 0.2040664, 1.546665, 0.09019608, 0, 1, 1,
0.5031153, -0.7441443, 2.719918, 0.09803922, 0, 1, 1,
0.505533, 0.528272, 2.478495, 0.1058824, 0, 1, 1,
0.5065093, 0.9193503, -0.8923512, 0.1098039, 0, 1, 1,
0.5095213, 0.3784443, -0.7395968, 0.1176471, 0, 1, 1,
0.5124123, -1.524424, 5.629733, 0.1215686, 0, 1, 1,
0.5126432, 0.3600155, -0.4373851, 0.1294118, 0, 1, 1,
0.5134042, -0.3974126, 3.653172, 0.1333333, 0, 1, 1,
0.5160957, -0.9579787, 2.586584, 0.1411765, 0, 1, 1,
0.5176042, -0.5896869, 2.748252, 0.145098, 0, 1, 1,
0.5176347, 2.407488, 1.400965, 0.1529412, 0, 1, 1,
0.5206841, 1.989381, 0.3970492, 0.1568628, 0, 1, 1,
0.5211588, -1.777106, 2.82443, 0.1647059, 0, 1, 1,
0.5222823, -1.33789, 1.508164, 0.1686275, 0, 1, 1,
0.5223788, -2.403063, 3.963689, 0.1764706, 0, 1, 1,
0.5359392, 0.6572378, 0.006124781, 0.1803922, 0, 1, 1,
0.5374572, -0.48162, 4.167924, 0.1882353, 0, 1, 1,
0.5390736, 1.229357, -0.08908456, 0.1921569, 0, 1, 1,
0.5392528, 2.258816, -0.1071945, 0.2, 0, 1, 1,
0.5393533, 1.133356, -0.5601926, 0.2078431, 0, 1, 1,
0.543295, -0.3949865, 1.795278, 0.2117647, 0, 1, 1,
0.5436018, -0.1069204, 1.404453, 0.2196078, 0, 1, 1,
0.5475416, -0.1724066, -0.6984795, 0.2235294, 0, 1, 1,
0.5511547, -1.225908, 2.714417, 0.2313726, 0, 1, 1,
0.5523397, 0.8819538, 1.129285, 0.2352941, 0, 1, 1,
0.5538557, 0.9489987, -0.001298831, 0.2431373, 0, 1, 1,
0.5556173, -0.2197042, 3.441978, 0.2470588, 0, 1, 1,
0.5624737, 0.4187225, 2.447554, 0.254902, 0, 1, 1,
0.5625533, 1.001598, 1.833936, 0.2588235, 0, 1, 1,
0.564723, 0.8427082, -0.07294075, 0.2666667, 0, 1, 1,
0.5698605, 0.08786377, 0.8208758, 0.2705882, 0, 1, 1,
0.5721242, 0.1781768, 0.4315443, 0.2784314, 0, 1, 1,
0.5737834, 0.5686395, 1.416827, 0.282353, 0, 1, 1,
0.5768995, -1.060124, 2.504681, 0.2901961, 0, 1, 1,
0.5774249, -1.207739, 3.244401, 0.2941177, 0, 1, 1,
0.5795879, -1.166691, 2.118292, 0.3019608, 0, 1, 1,
0.5806049, 0.1620706, 1.476051, 0.3098039, 0, 1, 1,
0.5824432, -1.002716, 4.087502, 0.3137255, 0, 1, 1,
0.5853829, -0.1218931, 3.331546, 0.3215686, 0, 1, 1,
0.5898771, -0.8767542, 2.383645, 0.3254902, 0, 1, 1,
0.5899249, -0.1437378, 1.998538, 0.3333333, 0, 1, 1,
0.5948382, -0.1549891, 1.899671, 0.3372549, 0, 1, 1,
0.5952728, 0.8198292, 0.8878893, 0.345098, 0, 1, 1,
0.6048355, -0.749303, 3.306842, 0.3490196, 0, 1, 1,
0.6058133, -1.57199, 3.188644, 0.3568628, 0, 1, 1,
0.606694, -0.3685833, 2.484421, 0.3607843, 0, 1, 1,
0.606701, 0.2598453, 1.263592, 0.3686275, 0, 1, 1,
0.6091526, 0.2061214, 0.63281, 0.372549, 0, 1, 1,
0.6098611, -2.258688, 4.715827, 0.3803922, 0, 1, 1,
0.6151613, 1.675875, -1.538991, 0.3843137, 0, 1, 1,
0.6162713, -0.3167531, 2.410904, 0.3921569, 0, 1, 1,
0.6168457, 0.06774116, 3.041638, 0.3960784, 0, 1, 1,
0.6179454, -0.9603789, 1.907158, 0.4039216, 0, 1, 1,
0.619816, -0.5020681, 0.9577172, 0.4117647, 0, 1, 1,
0.6202695, -1.420483, 3.225606, 0.4156863, 0, 1, 1,
0.6222199, 0.09857811, 1.435867, 0.4235294, 0, 1, 1,
0.6313387, -0.4165609, 2.703868, 0.427451, 0, 1, 1,
0.6338867, 0.9262053, 0.1086877, 0.4352941, 0, 1, 1,
0.6352308, 0.8508081, 1.892898, 0.4392157, 0, 1, 1,
0.6391596, 0.0892151, 2.891096, 0.4470588, 0, 1, 1,
0.6396831, 1.08517, -0.7166178, 0.4509804, 0, 1, 1,
0.646727, -0.9108669, 2.403135, 0.4588235, 0, 1, 1,
0.6550629, 0.5100646, 0.5041305, 0.4627451, 0, 1, 1,
0.6591257, -0.177792, 2.691154, 0.4705882, 0, 1, 1,
0.6594407, 1.421483, -0.7265323, 0.4745098, 0, 1, 1,
0.6645487, 1.437699, -0.222929, 0.4823529, 0, 1, 1,
0.6672796, 0.1161776, 1.805204, 0.4862745, 0, 1, 1,
0.6713867, 0.6174445, -0.5563822, 0.4941176, 0, 1, 1,
0.6737782, -0.4753616, 2.191486, 0.5019608, 0, 1, 1,
0.674593, -0.170121, 1.080005, 0.5058824, 0, 1, 1,
0.6844361, -0.04035429, 1.349186, 0.5137255, 0, 1, 1,
0.6866266, -0.5054744, 3.62619, 0.5176471, 0, 1, 1,
0.6867403, 0.8896711, 0.7588766, 0.5254902, 0, 1, 1,
0.6877652, -0.4061035, 3.161343, 0.5294118, 0, 1, 1,
0.6922436, 2.274188, -0.4899623, 0.5372549, 0, 1, 1,
0.6973079, 1.220363, -0.8005791, 0.5411765, 0, 1, 1,
0.7026278, 1.238521, 1.86704, 0.5490196, 0, 1, 1,
0.7026477, -2.33782, 4.120697, 0.5529412, 0, 1, 1,
0.7071833, -2.231255, 3.385942, 0.5607843, 0, 1, 1,
0.7118298, -0.983175, 0.08933207, 0.5647059, 0, 1, 1,
0.7153719, -0.5918295, 1.850555, 0.572549, 0, 1, 1,
0.7173781, 0.9037071, -0.6745789, 0.5764706, 0, 1, 1,
0.7176397, -0.5516238, 2.307366, 0.5843138, 0, 1, 1,
0.7197297, 0.84115, 2.237412, 0.5882353, 0, 1, 1,
0.7254198, 1.014196, 0.8437701, 0.5960785, 0, 1, 1,
0.7297034, -1.273943, 1.784779, 0.6039216, 0, 1, 1,
0.7313235, -0.2403087, 2.748077, 0.6078432, 0, 1, 1,
0.7350454, -0.9407467, 3.746841, 0.6156863, 0, 1, 1,
0.7397726, 0.4589669, -1.068587, 0.6196079, 0, 1, 1,
0.7446837, 0.5351743, 1.488955, 0.627451, 0, 1, 1,
0.7466071, -0.7115917, 1.539726, 0.6313726, 0, 1, 1,
0.7518495, 0.4558858, 1.836721, 0.6392157, 0, 1, 1,
0.752818, 1.138871, 0.4783674, 0.6431373, 0, 1, 1,
0.7574243, -0.3928881, 1.489417, 0.6509804, 0, 1, 1,
0.7618183, -0.8615881, 2.299302, 0.654902, 0, 1, 1,
0.7619662, -0.1472437, 2.677159, 0.6627451, 0, 1, 1,
0.7645181, 0.3379263, 0.4056482, 0.6666667, 0, 1, 1,
0.7656673, 1.588217, 0.6988198, 0.6745098, 0, 1, 1,
0.7731248, -1.39189, 1.440322, 0.6784314, 0, 1, 1,
0.7763753, 0.7305703, 1.793766, 0.6862745, 0, 1, 1,
0.783911, -0.2050424, 0.956046, 0.6901961, 0, 1, 1,
0.7872192, -2.01521, 3.576129, 0.6980392, 0, 1, 1,
0.799329, 0.1823669, 1.736694, 0.7058824, 0, 1, 1,
0.799574, -0.8642588, 3.468308, 0.7098039, 0, 1, 1,
0.8049697, 0.1237293, 0.9743369, 0.7176471, 0, 1, 1,
0.8104329, -1.211307, 1.751476, 0.7215686, 0, 1, 1,
0.8172349, 0.4517446, 2.14233, 0.7294118, 0, 1, 1,
0.8188632, 0.4480991, 1.758513, 0.7333333, 0, 1, 1,
0.8190947, -1.6614, 3.750286, 0.7411765, 0, 1, 1,
0.8214604, 0.4456154, 1.566407, 0.7450981, 0, 1, 1,
0.8216246, -0.08500881, 1.741155, 0.7529412, 0, 1, 1,
0.8241665, 0.4499834, 1.250653, 0.7568628, 0, 1, 1,
0.8261463, -1.13626, 4.144383, 0.7647059, 0, 1, 1,
0.8267906, -1.439761, 3.611091, 0.7686275, 0, 1, 1,
0.8317227, 0.3754822, 0.4396396, 0.7764706, 0, 1, 1,
0.83763, 1.903605, 2.285995, 0.7803922, 0, 1, 1,
0.8497368, 1.01087, 1.405439, 0.7882353, 0, 1, 1,
0.8590907, 0.6933207, 0.9280252, 0.7921569, 0, 1, 1,
0.8662784, 1.267725, -1.327972, 0.8, 0, 1, 1,
0.8676901, 1.268429, 1.218412, 0.8078431, 0, 1, 1,
0.8712344, 0.03904312, 3.389279, 0.8117647, 0, 1, 1,
0.8716952, 1.338499, 0.7489291, 0.8196079, 0, 1, 1,
0.8761322, -0.20419, 3.170564, 0.8235294, 0, 1, 1,
0.883502, 1.60078, -1.487544, 0.8313726, 0, 1, 1,
0.8851702, -0.3195015, 1.589213, 0.8352941, 0, 1, 1,
0.890549, -0.5314947, 1.863121, 0.8431373, 0, 1, 1,
0.8911481, 1.462527, 0.7008011, 0.8470588, 0, 1, 1,
0.8950503, -0.1939785, 1.715756, 0.854902, 0, 1, 1,
0.8951983, 0.5821545, 0.5811661, 0.8588235, 0, 1, 1,
0.8976533, -0.37593, 1.377978, 0.8666667, 0, 1, 1,
0.9050013, 1.714848, 1.24915, 0.8705882, 0, 1, 1,
0.9108626, 1.24958, 0.6727954, 0.8784314, 0, 1, 1,
0.9135575, -0.3310581, 2.251382, 0.8823529, 0, 1, 1,
0.9135962, 0.2503776, 0.6447085, 0.8901961, 0, 1, 1,
0.9197789, 0.01682157, 2.596168, 0.8941177, 0, 1, 1,
0.9216898, 1.518834, 1.00188, 0.9019608, 0, 1, 1,
0.9226683, 1.365118, 0.9190881, 0.9098039, 0, 1, 1,
0.9256093, 1.966357, 2.378241, 0.9137255, 0, 1, 1,
0.9330922, 1.58584, 0.786992, 0.9215686, 0, 1, 1,
0.9340388, 0.3285391, 1.635481, 0.9254902, 0, 1, 1,
0.936241, 0.6006932, 0.5066453, 0.9333333, 0, 1, 1,
0.9399021, 0.0309384, -0.006531751, 0.9372549, 0, 1, 1,
0.9511498, 1.31708, 0.7661994, 0.945098, 0, 1, 1,
0.9516609, 1.996159, 2.696697, 0.9490196, 0, 1, 1,
0.9536048, -0.1389346, 2.581573, 0.9568627, 0, 1, 1,
0.956013, -0.6783814, 1.887844, 0.9607843, 0, 1, 1,
0.961368, -1.289182, 1.367366, 0.9686275, 0, 1, 1,
0.9634025, -1.721039, 4.074603, 0.972549, 0, 1, 1,
0.9639947, 1.030404, 1.311135, 0.9803922, 0, 1, 1,
0.9750809, -0.1391409, 2.816681, 0.9843137, 0, 1, 1,
0.9765875, -1.594236, 3.541166, 0.9921569, 0, 1, 1,
0.976761, 0.2861553, 1.86088, 0.9960784, 0, 1, 1,
0.9826026, -0.4080432, 2.251558, 1, 0, 0.9960784, 1,
0.9869626, 0.289273, 1.492811, 1, 0, 0.9882353, 1,
0.9923425, 0.3946201, -0.1214151, 1, 0, 0.9843137, 1,
0.9970264, -1.334806, 2.930258, 1, 0, 0.9764706, 1,
1.006931, 0.31326, 2.075899, 1, 0, 0.972549, 1,
1.012242, -0.3451638, 2.766965, 1, 0, 0.9647059, 1,
1.012902, -0.8196863, 3.681288, 1, 0, 0.9607843, 1,
1.014622, -0.9295224, 2.353363, 1, 0, 0.9529412, 1,
1.016482, -0.990348, 2.816143, 1, 0, 0.9490196, 1,
1.031045, -1.226338, 2.744474, 1, 0, 0.9411765, 1,
1.04045, 0.405915, -0.2847312, 1, 0, 0.9372549, 1,
1.041233, -1.114197, 3.044796, 1, 0, 0.9294118, 1,
1.041565, -0.7246678, 2.178483, 1, 0, 0.9254902, 1,
1.044205, -0.497161, 0.921979, 1, 0, 0.9176471, 1,
1.047536, -0.6676449, 2.193912, 1, 0, 0.9137255, 1,
1.050555, -1.643403, 2.323801, 1, 0, 0.9058824, 1,
1.052577, -0.3767839, 2.663068, 1, 0, 0.9019608, 1,
1.065684, -1.076432, 1.841628, 1, 0, 0.8941177, 1,
1.075564, -1.470541, 2.520146, 1, 0, 0.8862745, 1,
1.082542, -0.3498475, 1.034153, 1, 0, 0.8823529, 1,
1.084955, 0.1320677, 1.968371, 1, 0, 0.8745098, 1,
1.093668, 0.2667916, 0.7287318, 1, 0, 0.8705882, 1,
1.09405, 0.3037697, 2.449134, 1, 0, 0.8627451, 1,
1.095121, -0.4046488, 1.527663, 1, 0, 0.8588235, 1,
1.102884, 0.2652548, 0.06078544, 1, 0, 0.8509804, 1,
1.105648, -2.304688, 2.294464, 1, 0, 0.8470588, 1,
1.106274, -0.07305522, 2.175446, 1, 0, 0.8392157, 1,
1.111673, 0.7117788, 0.9929969, 1, 0, 0.8352941, 1,
1.116059, -0.3905105, 3.262051, 1, 0, 0.827451, 1,
1.119377, 1.601477, 1.166996, 1, 0, 0.8235294, 1,
1.121207, -1.275642, 1.563595, 1, 0, 0.8156863, 1,
1.122335, 0.3667582, 1.005037, 1, 0, 0.8117647, 1,
1.122942, 0.6681609, 0.8303224, 1, 0, 0.8039216, 1,
1.12403, 0.01796107, 1.661372, 1, 0, 0.7960784, 1,
1.124663, -0.2172051, 1.789268, 1, 0, 0.7921569, 1,
1.128297, 0.758119, 0.2846707, 1, 0, 0.7843137, 1,
1.130446, -0.2142118, 0.3334811, 1, 0, 0.7803922, 1,
1.132491, -0.2711658, -0.2090174, 1, 0, 0.772549, 1,
1.133506, 0.3307709, -1.156212, 1, 0, 0.7686275, 1,
1.138206, -0.004334421, 1.21972, 1, 0, 0.7607843, 1,
1.138807, -0.4565411, 3.040536, 1, 0, 0.7568628, 1,
1.148263, -0.962629, 0.9850401, 1, 0, 0.7490196, 1,
1.154131, 0.5465164, 1.282564, 1, 0, 0.7450981, 1,
1.15437, 0.1097191, 0.2673353, 1, 0, 0.7372549, 1,
1.162035, -1.953752, 2.259992, 1, 0, 0.7333333, 1,
1.162563, 1.501978, 0.3927071, 1, 0, 0.7254902, 1,
1.166666, 0.01250779, 1.116813, 1, 0, 0.7215686, 1,
1.167714, 0.5849258, 1.333883, 1, 0, 0.7137255, 1,
1.172357, -0.3922907, 2.51176, 1, 0, 0.7098039, 1,
1.178519, -0.1591882, 0.8744348, 1, 0, 0.7019608, 1,
1.180077, 1.188603, 2.454579, 1, 0, 0.6941177, 1,
1.188545, -0.6632748, 1.146996, 1, 0, 0.6901961, 1,
1.196632, 0.03133143, 0.7238355, 1, 0, 0.682353, 1,
1.199859, -1.065918, 1.997658, 1, 0, 0.6784314, 1,
1.201461, 0.5684972, 1.64275, 1, 0, 0.6705883, 1,
1.205918, -0.3621935, 2.262514, 1, 0, 0.6666667, 1,
1.208898, -0.1101796, 1.442324, 1, 0, 0.6588235, 1,
1.22175, -0.6248017, 2.31379, 1, 0, 0.654902, 1,
1.22793, 0.8931683, 1.357649, 1, 0, 0.6470588, 1,
1.232432, 1.84344, 1.920869, 1, 0, 0.6431373, 1,
1.241297, -1.122725, 2.178365, 1, 0, 0.6352941, 1,
1.245226, 0.2726743, 0.493878, 1, 0, 0.6313726, 1,
1.259323, -0.4146133, 1.769236, 1, 0, 0.6235294, 1,
1.262835, 0.4921449, 1.363934, 1, 0, 0.6196079, 1,
1.284666, 0.2351552, 1.637059, 1, 0, 0.6117647, 1,
1.290689, -0.00566077, 1.767132, 1, 0, 0.6078432, 1,
1.294366, -0.3966811, 1.210244, 1, 0, 0.6, 1,
1.306867, -0.02811232, 1.196466, 1, 0, 0.5921569, 1,
1.310968, -1.022914, 2.680734, 1, 0, 0.5882353, 1,
1.312717, 0.0901562, 2.320048, 1, 0, 0.5803922, 1,
1.316694, 0.3462684, 1.482633, 1, 0, 0.5764706, 1,
1.323038, 0.2322493, -0.9297056, 1, 0, 0.5686275, 1,
1.323549, 0.07481138, 0.02295175, 1, 0, 0.5647059, 1,
1.323947, -0.2068027, 2.673535, 1, 0, 0.5568628, 1,
1.326434, 2.052519, -1.608834, 1, 0, 0.5529412, 1,
1.335939, -0.02227778, 1.039814, 1, 0, 0.5450981, 1,
1.345425, 1.729976, 0.6569768, 1, 0, 0.5411765, 1,
1.347063, 0.826854, -0.6573504, 1, 0, 0.5333334, 1,
1.351901, -0.5434511, 2.765302, 1, 0, 0.5294118, 1,
1.361562, -1.09626, 0.9721881, 1, 0, 0.5215687, 1,
1.375185, -1.808632, 2.558132, 1, 0, 0.5176471, 1,
1.38817, 0.8749461, 1.172434, 1, 0, 0.509804, 1,
1.39166, 0.557412, 0.5329525, 1, 0, 0.5058824, 1,
1.394578, 0.1773563, 0.8963249, 1, 0, 0.4980392, 1,
1.396027, -0.3953715, 2.649447, 1, 0, 0.4901961, 1,
1.399804, 0.9332871, 0.6371135, 1, 0, 0.4862745, 1,
1.422804, -0.980006, 0.2533171, 1, 0, 0.4784314, 1,
1.445424, -0.3824065, 0.5007051, 1, 0, 0.4745098, 1,
1.448972, 0.1135341, 2.052819, 1, 0, 0.4666667, 1,
1.453541, 0.9994455, 0.1768275, 1, 0, 0.4627451, 1,
1.455004, -0.1460764, 1.348593, 1, 0, 0.454902, 1,
1.468919, 0.5146759, 0.9380637, 1, 0, 0.4509804, 1,
1.473247, 1.100605, 2.509026, 1, 0, 0.4431373, 1,
1.480564, -0.43699, 0.5851752, 1, 0, 0.4392157, 1,
1.5149, 0.1991707, 2.79967, 1, 0, 0.4313726, 1,
1.5242, -0.5306699, 0.8817695, 1, 0, 0.427451, 1,
1.5246, -1.635634, 2.764752, 1, 0, 0.4196078, 1,
1.525561, 0.6443036, -0.4275551, 1, 0, 0.4156863, 1,
1.531386, -0.9000731, 0.8165083, 1, 0, 0.4078431, 1,
1.533018, 0.3034233, 2.546905, 1, 0, 0.4039216, 1,
1.541384, 1.559479, 0.2045848, 1, 0, 0.3960784, 1,
1.548938, -0.07220264, 1.430086, 1, 0, 0.3882353, 1,
1.551476, 0.01994866, 0.4180001, 1, 0, 0.3843137, 1,
1.573485, -2.304695, 2.24603, 1, 0, 0.3764706, 1,
1.579437, -0.2100948, 2.4932, 1, 0, 0.372549, 1,
1.580384, 1.113179, -0.7205741, 1, 0, 0.3647059, 1,
1.585036, -0.6609203, 3.727206, 1, 0, 0.3607843, 1,
1.597577, 0.3607282, 2.54171, 1, 0, 0.3529412, 1,
1.604491, 0.1772262, 1.377061, 1, 0, 0.3490196, 1,
1.615338, -0.8911087, 1.741117, 1, 0, 0.3411765, 1,
1.616904, -1.13532, 2.462055, 1, 0, 0.3372549, 1,
1.645391, -0.9910889, 1.984396, 1, 0, 0.3294118, 1,
1.69243, 1.493515, 0.9815838, 1, 0, 0.3254902, 1,
1.69425, -1.744468, 2.071495, 1, 0, 0.3176471, 1,
1.710083, -0.9195966, 1.179695, 1, 0, 0.3137255, 1,
1.714872, 0.1558331, 1.696921, 1, 0, 0.3058824, 1,
1.715417, 1.091678, 0.7834532, 1, 0, 0.2980392, 1,
1.730719, -0.3051721, 1.011847, 1, 0, 0.2941177, 1,
1.737667, -0.6341979, 0.196734, 1, 0, 0.2862745, 1,
1.738002, 0.9288855, 0.6726194, 1, 0, 0.282353, 1,
1.760623, -1.116, 3.302214, 1, 0, 0.2745098, 1,
1.762622, -0.692537, 1.074193, 1, 0, 0.2705882, 1,
1.770833, 1.050856, -0.5780863, 1, 0, 0.2627451, 1,
1.778068, -0.624989, 1.992992, 1, 0, 0.2588235, 1,
1.783462, 0.8626774, 0.7821433, 1, 0, 0.2509804, 1,
1.786033, -0.288779, -0.1644683, 1, 0, 0.2470588, 1,
1.791511, -1.625796, 1.428728, 1, 0, 0.2392157, 1,
1.864045, 1.31246, -0.03030851, 1, 0, 0.2352941, 1,
1.865874, -1.634186, 3.291624, 1, 0, 0.227451, 1,
1.867405, -0.004756817, 1.911336, 1, 0, 0.2235294, 1,
1.869543, -0.9970853, 4.16837, 1, 0, 0.2156863, 1,
1.888269, 0.7702793, 1.455264, 1, 0, 0.2117647, 1,
1.902809, -1.361493, 3.160657, 1, 0, 0.2039216, 1,
1.905356, -0.1643119, 2.279507, 1, 0, 0.1960784, 1,
1.919218, 0.2251052, 2.432039, 1, 0, 0.1921569, 1,
1.930928, -1.899428, 0.1969748, 1, 0, 0.1843137, 1,
1.946107, 0.8297113, 2.143779, 1, 0, 0.1803922, 1,
1.960796, -0.9436487, 2.172446, 1, 0, 0.172549, 1,
1.971335, 0.8577162, -0.3748726, 1, 0, 0.1686275, 1,
2.025858, 0.4886748, 2.046029, 1, 0, 0.1607843, 1,
2.049022, -0.2962778, -0.6125667, 1, 0, 0.1568628, 1,
2.063253, -0.01326374, 1.573271, 1, 0, 0.1490196, 1,
2.064541, 0.3555762, 2.637727, 1, 0, 0.145098, 1,
2.069972, -0.4566864, 2.451378, 1, 0, 0.1372549, 1,
2.145278, -0.9533654, 1.794852, 1, 0, 0.1333333, 1,
2.168545, -0.7337221, 1.620376, 1, 0, 0.1254902, 1,
2.170244, 0.01351598, 1.61865, 1, 0, 0.1215686, 1,
2.184737, -0.5553999, 2.811846, 1, 0, 0.1137255, 1,
2.215391, 1.416788, 1.228106, 1, 0, 0.1098039, 1,
2.233218, -0.09712988, 2.382407, 1, 0, 0.1019608, 1,
2.234828, -1.254191, -0.08350448, 1, 0, 0.09411765, 1,
2.285806, 0.8994535, 1.685342, 1, 0, 0.09019608, 1,
2.366521, 0.4205885, 1.127876, 1, 0, 0.08235294, 1,
2.460235, -0.5244254, 0.4045446, 1, 0, 0.07843138, 1,
2.493919, -0.1438171, 1.970073, 1, 0, 0.07058824, 1,
2.508204, -0.02029266, 2.228115, 1, 0, 0.06666667, 1,
2.52445, -1.114017, 1.712816, 1, 0, 0.05882353, 1,
2.562949, 0.3067084, 0.7042852, 1, 0, 0.05490196, 1,
2.580256, -0.4133546, 1.065906, 1, 0, 0.04705882, 1,
2.623503, -1.177232, 1.940162, 1, 0, 0.04313726, 1,
2.661478, 0.5114102, 0.04949832, 1, 0, 0.03529412, 1,
2.707708, 0.6292767, 2.62681, 1, 0, 0.03137255, 1,
2.838523, 1.405418, 2.540489, 1, 0, 0.02352941, 1,
3.067494, -1.479947, 1.595944, 1, 0, 0.01960784, 1,
3.205515, -0.3569755, 1.110539, 1, 0, 0.01176471, 1,
4.06711, -0.1169722, 2.513954, 1, 0, 0.007843138, 1
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
0.4542933, -4.773259, -7.485432, 0, -0.5, 0.5, 0.5,
0.4542933, -4.773259, -7.485432, 1, -0.5, 0.5, 0.5,
0.4542933, -4.773259, -7.485432, 1, 1.5, 0.5, 0.5,
0.4542933, -4.773259, -7.485432, 0, 1.5, 0.5, 0.5
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
-4.383268, 0.03050148, -7.485432, 0, -0.5, 0.5, 0.5,
-4.383268, 0.03050148, -7.485432, 1, -0.5, 0.5, 0.5,
-4.383268, 0.03050148, -7.485432, 1, 1.5, 0.5, 0.5,
-4.383268, 0.03050148, -7.485432, 0, 1.5, 0.5, 0.5
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
-4.383268, -4.773259, 0.02256536, 0, -0.5, 0.5, 0.5,
-4.383268, -4.773259, 0.02256536, 1, -0.5, 0.5, 0.5,
-4.383268, -4.773259, 0.02256536, 1, 1.5, 0.5, 0.5,
-4.383268, -4.773259, 0.02256536, 0, 1.5, 0.5, 0.5
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
-2, -3.664699, -5.752817,
4, -3.664699, -5.752817,
-2, -3.664699, -5.752817,
-2, -3.849459, -6.041586,
0, -3.664699, -5.752817,
0, -3.849459, -6.041586,
2, -3.664699, -5.752817,
2, -3.849459, -6.041586,
4, -3.664699, -5.752817,
4, -3.849459, -6.041586
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
"2",
"4"
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
-2, -4.218979, -6.619125, 0, -0.5, 0.5, 0.5,
-2, -4.218979, -6.619125, 1, -0.5, 0.5, 0.5,
-2, -4.218979, -6.619125, 1, 1.5, 0.5, 0.5,
-2, -4.218979, -6.619125, 0, 1.5, 0.5, 0.5,
0, -4.218979, -6.619125, 0, -0.5, 0.5, 0.5,
0, -4.218979, -6.619125, 1, -0.5, 0.5, 0.5,
0, -4.218979, -6.619125, 1, 1.5, 0.5, 0.5,
0, -4.218979, -6.619125, 0, 1.5, 0.5, 0.5,
2, -4.218979, -6.619125, 0, -0.5, 0.5, 0.5,
2, -4.218979, -6.619125, 1, -0.5, 0.5, 0.5,
2, -4.218979, -6.619125, 1, 1.5, 0.5, 0.5,
2, -4.218979, -6.619125, 0, 1.5, 0.5, 0.5,
4, -4.218979, -6.619125, 0, -0.5, 0.5, 0.5,
4, -4.218979, -6.619125, 1, -0.5, 0.5, 0.5,
4, -4.218979, -6.619125, 1, 1.5, 0.5, 0.5,
4, -4.218979, -6.619125, 0, 1.5, 0.5, 0.5
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
-3.266908, -2, -5.752817,
-3.266908, 2, -5.752817,
-3.266908, -2, -5.752817,
-3.452968, -2, -6.041586,
-3.266908, 0, -5.752817,
-3.452968, 0, -6.041586,
-3.266908, 2, -5.752817,
-3.452968, 2, -6.041586
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
-3.825088, -2, -6.619125, 0, -0.5, 0.5, 0.5,
-3.825088, -2, -6.619125, 1, -0.5, 0.5, 0.5,
-3.825088, -2, -6.619125, 1, 1.5, 0.5, 0.5,
-3.825088, -2, -6.619125, 0, 1.5, 0.5, 0.5,
-3.825088, 0, -6.619125, 0, -0.5, 0.5, 0.5,
-3.825088, 0, -6.619125, 1, -0.5, 0.5, 0.5,
-3.825088, 0, -6.619125, 1, 1.5, 0.5, 0.5,
-3.825088, 0, -6.619125, 0, 1.5, 0.5, 0.5,
-3.825088, 2, -6.619125, 0, -0.5, 0.5, 0.5,
-3.825088, 2, -6.619125, 1, -0.5, 0.5, 0.5,
-3.825088, 2, -6.619125, 1, 1.5, 0.5, 0.5,
-3.825088, 2, -6.619125, 0, 1.5, 0.5, 0.5
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
-3.266908, -3.664699, -4,
-3.266908, -3.664699, 4,
-3.266908, -3.664699, -4,
-3.452968, -3.849459, -4,
-3.266908, -3.664699, -2,
-3.452968, -3.849459, -2,
-3.266908, -3.664699, 0,
-3.452968, -3.849459, 0,
-3.266908, -3.664699, 2,
-3.452968, -3.849459, 2,
-3.266908, -3.664699, 4,
-3.452968, -3.849459, 4
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
-3.825088, -4.218979, -4, 0, -0.5, 0.5, 0.5,
-3.825088, -4.218979, -4, 1, -0.5, 0.5, 0.5,
-3.825088, -4.218979, -4, 1, 1.5, 0.5, 0.5,
-3.825088, -4.218979, -4, 0, 1.5, 0.5, 0.5,
-3.825088, -4.218979, -2, 0, -0.5, 0.5, 0.5,
-3.825088, -4.218979, -2, 1, -0.5, 0.5, 0.5,
-3.825088, -4.218979, -2, 1, 1.5, 0.5, 0.5,
-3.825088, -4.218979, -2, 0, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 0, 0, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 0, 1, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 0, 1, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 0, 0, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 2, 0, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 2, 1, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 2, 1, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 2, 0, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 4, 0, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 4, 1, -0.5, 0.5, 0.5,
-3.825088, -4.218979, 4, 1, 1.5, 0.5, 0.5,
-3.825088, -4.218979, 4, 0, 1.5, 0.5, 0.5
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
-3.266908, -3.664699, -5.752817,
-3.266908, 3.725702, -5.752817,
-3.266908, -3.664699, 5.797948,
-3.266908, 3.725702, 5.797948,
-3.266908, -3.664699, -5.752817,
-3.266908, -3.664699, 5.797948,
-3.266908, 3.725702, -5.752817,
-3.266908, 3.725702, 5.797948,
-3.266908, -3.664699, -5.752817,
4.175494, -3.664699, -5.752817,
-3.266908, -3.664699, 5.797948,
4.175494, -3.664699, 5.797948,
-3.266908, 3.725702, -5.752817,
4.175494, 3.725702, -5.752817,
-3.266908, 3.725702, 5.797948,
4.175494, 3.725702, 5.797948,
4.175494, -3.664699, -5.752817,
4.175494, 3.725702, -5.752817,
4.175494, -3.664699, 5.797948,
4.175494, 3.725702, 5.797948,
4.175494, -3.664699, -5.752817,
4.175494, -3.664699, 5.797948,
4.175494, 3.725702, -5.752817,
4.175494, 3.725702, 5.797948
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
var radius = 8.331253;
var distance = 37.06669;
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
mvMatrix.translate( -0.4542933, -0.03050148, -0.02256536 );
mvMatrix.scale( 1.210351, 1.218867, 0.7798543 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.06669);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
thiodicarbamate<-read.table("thiodicarbamate.xyz")
```

```
## Error in read.table("thiodicarbamate.xyz"): no lines available in input
```

```r
x<-thiodicarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
y<-thiodicarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
```

```r
z<-thiodicarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarbamate' not found
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
-3.158523, -0.6448175, -3.172469, 0, 0, 1, 1, 1,
-2.94307, 0.7375076, -1.521392, 1, 0, 0, 1, 1,
-2.841068, -0.4216293, -0.7142653, 1, 0, 0, 1, 1,
-2.789039, 0.4770408, -2.132636, 1, 0, 0, 1, 1,
-2.706958, 0.1401204, -2.595207, 1, 0, 0, 1, 1,
-2.63377, 0.9646896, 0.1227239, 1, 0, 0, 1, 1,
-2.561343, -1.643885, -2.094198, 0, 0, 0, 1, 1,
-2.542881, -0.5694093, -2.73375, 0, 0, 0, 1, 1,
-2.419528, -0.5711471, -2.290419, 0, 0, 0, 1, 1,
-2.380485, -1.224734, -2.944946, 0, 0, 0, 1, 1,
-2.363844, -0.6848903, -1.468017, 0, 0, 0, 1, 1,
-2.34781, -1.85414, -0.8832814, 0, 0, 0, 1, 1,
-2.279728, -0.9359552, -2.574549, 0, 0, 0, 1, 1,
-2.180609, -0.5780171, -1.359602, 1, 1, 1, 1, 1,
-2.157928, 0.7530308, -1.340495, 1, 1, 1, 1, 1,
-2.120806, -0.6685119, -1.842891, 1, 1, 1, 1, 1,
-2.074921, 0.458683, -1.224411, 1, 1, 1, 1, 1,
-2.072397, -1.539024, -2.539544, 1, 1, 1, 1, 1,
-2.062273, -0.1971327, -0.998859, 1, 1, 1, 1, 1,
-2.059819, -0.8386939, -1.695081, 1, 1, 1, 1, 1,
-2.011855, -0.005802981, 0.4009181, 1, 1, 1, 1, 1,
-2.007803, -1.756033, -3.31793, 1, 1, 1, 1, 1,
-2.001152, -0.7222461, -2.554284, 1, 1, 1, 1, 1,
-1.995437, 0.9564345, -0.7220821, 1, 1, 1, 1, 1,
-1.974462, -1.359823, -3.628511, 1, 1, 1, 1, 1,
-1.891836, -0.06614175, -0.6259142, 1, 1, 1, 1, 1,
-1.862753, 0.6585022, -1.378557, 1, 1, 1, 1, 1,
-1.858903, 0.2842119, -1.371008, 1, 1, 1, 1, 1,
-1.797791, -0.7666302, -2.558157, 0, 0, 1, 1, 1,
-1.787259, 0.2449812, 0.0944574, 1, 0, 0, 1, 1,
-1.786083, 1.096481, -3.036988, 1, 0, 0, 1, 1,
-1.784479, 0.5894901, -1.05798, 1, 0, 0, 1, 1,
-1.778408, 0.3389218, 0.8394012, 1, 0, 0, 1, 1,
-1.777164, 1.718042, -0.9935754, 1, 0, 0, 1, 1,
-1.775029, -1.001607, -1.703694, 0, 0, 0, 1, 1,
-1.764754, -0.4480109, -1.96969, 0, 0, 0, 1, 1,
-1.755024, 0.1699341, -4.039566, 0, 0, 0, 1, 1,
-1.738074, -0.03712276, -3.796839, 0, 0, 0, 1, 1,
-1.705007, 1.468364, -1.746549, 0, 0, 0, 1, 1,
-1.703969, 1.433042, -1.036832, 0, 0, 0, 1, 1,
-1.700688, -0.6829728, -2.189701, 0, 0, 0, 1, 1,
-1.70008, 0.1086809, -1.681039, 1, 1, 1, 1, 1,
-1.683717, -2.669289, -3.765882, 1, 1, 1, 1, 1,
-1.679864, -0.4867903, -2.77788, 1, 1, 1, 1, 1,
-1.671427, 0.4343332, -2.123126, 1, 1, 1, 1, 1,
-1.653739, 1.168348, -0.03052736, 1, 1, 1, 1, 1,
-1.652275, -2.381249, -3.847605, 1, 1, 1, 1, 1,
-1.609423, 1.023704, 0.1056685, 1, 1, 1, 1, 1,
-1.607561, 0.4625404, -2.524707, 1, 1, 1, 1, 1,
-1.600327, 1.307515, -0.746546, 1, 1, 1, 1, 1,
-1.592606, 0.3166943, -2.381614, 1, 1, 1, 1, 1,
-1.590494, -0.5132714, -1.516126, 1, 1, 1, 1, 1,
-1.562282, 0.3416556, -1.770672, 1, 1, 1, 1, 1,
-1.559339, -2.818022, -2.011657, 1, 1, 1, 1, 1,
-1.552044, 0.09146485, -1.29846, 1, 1, 1, 1, 1,
-1.549875, -0.07164838, -1.948781, 1, 1, 1, 1, 1,
-1.547372, 0.006580121, -4.154161, 0, 0, 1, 1, 1,
-1.539514, 1.60293, -0.7571066, 1, 0, 0, 1, 1,
-1.534768, 0.1975395, -0.891598, 1, 0, 0, 1, 1,
-1.529816, -1.530167, -2.995306, 1, 0, 0, 1, 1,
-1.524333, 0.5210396, -1.562422, 1, 0, 0, 1, 1,
-1.516773, 0.2890641, -1.042233, 1, 0, 0, 1, 1,
-1.516466, 0.1100359, -1.53724, 0, 0, 0, 1, 1,
-1.511131, 1.035267, -0.1885932, 0, 0, 0, 1, 1,
-1.505291, -0.3702874, -2.72675, 0, 0, 0, 1, 1,
-1.497082, 1.767459, -0.54364, 0, 0, 0, 1, 1,
-1.495826, 0.2465322, -0.472164, 0, 0, 0, 1, 1,
-1.483757, -1.363186, -1.945377, 0, 0, 0, 1, 1,
-1.481428, 0.3387032, -0.3441237, 0, 0, 0, 1, 1,
-1.466137, -0.1186975, -2.580239, 1, 1, 1, 1, 1,
-1.462757, 0.6577626, -1.818173, 1, 1, 1, 1, 1,
-1.455165, -1.184767, -1.876445, 1, 1, 1, 1, 1,
-1.4432, -1.175426, -1.925897, 1, 1, 1, 1, 1,
-1.426997, 0.7703792, -0.1970009, 1, 1, 1, 1, 1,
-1.413866, 0.6876771, -0.8445775, 1, 1, 1, 1, 1,
-1.400815, -1.20747, -3.624769, 1, 1, 1, 1, 1,
-1.399488, 0.0139107, -3.008178, 1, 1, 1, 1, 1,
-1.386637, -0.7776952, -3.538593, 1, 1, 1, 1, 1,
-1.385759, -0.3189964, -2.851948, 1, 1, 1, 1, 1,
-1.381884, 0.7554665, -3.414262, 1, 1, 1, 1, 1,
-1.37949, 0.6422303, 1.344947, 1, 1, 1, 1, 1,
-1.371831, -1.8705, -2.391737, 1, 1, 1, 1, 1,
-1.361251, -1.654585, -2.896597, 1, 1, 1, 1, 1,
-1.359846, 1.72991, -0.0604599, 1, 1, 1, 1, 1,
-1.359779, 0.3544867, -1.837604, 0, 0, 1, 1, 1,
-1.342467, -0.04418986, -2.987795, 1, 0, 0, 1, 1,
-1.340906, -0.3730053, -3.4193, 1, 0, 0, 1, 1,
-1.339176, 0.06229856, -2.862139, 1, 0, 0, 1, 1,
-1.33408, -0.9565904, -2.002469, 1, 0, 0, 1, 1,
-1.322026, 0.5790634, 0.04389264, 1, 0, 0, 1, 1,
-1.31898, 1.112749, -0.9671602, 0, 0, 0, 1, 1,
-1.314063, 0.07972413, -0.416134, 0, 0, 0, 1, 1,
-1.313874, -1.367622, -0.7573173, 0, 0, 0, 1, 1,
-1.309614, -0.7868796, -2.658633, 0, 0, 0, 1, 1,
-1.308276, -1.16305, -1.977075, 0, 0, 0, 1, 1,
-1.300833, -0.467181, -1.395893, 0, 0, 0, 1, 1,
-1.272496, -0.5525324, -1.512269, 0, 0, 0, 1, 1,
-1.263865, 1.184068, -1.09833, 1, 1, 1, 1, 1,
-1.261341, 0.6007833, 0.6231465, 1, 1, 1, 1, 1,
-1.255783, 1.065854, -1.777132, 1, 1, 1, 1, 1,
-1.252451, -1.106534, -2.23869, 1, 1, 1, 1, 1,
-1.252069, -0.2574082, -1.172587, 1, 1, 1, 1, 1,
-1.240915, -0.9537593, -2.157446, 1, 1, 1, 1, 1,
-1.23405, 0.2278512, -2.581519, 1, 1, 1, 1, 1,
-1.21676, 0.3578474, -1.130556, 1, 1, 1, 1, 1,
-1.215002, -1.313359, -2.288429, 1, 1, 1, 1, 1,
-1.208189, -0.1309314, -2.04683, 1, 1, 1, 1, 1,
-1.204198, -0.701369, -0.160699, 1, 1, 1, 1, 1,
-1.202276, -0.7429578, -1.614905, 1, 1, 1, 1, 1,
-1.192804, -0.4988899, -2.709341, 1, 1, 1, 1, 1,
-1.18096, 0.2041849, -0.5748288, 1, 1, 1, 1, 1,
-1.179, -0.2504015, -0.2516951, 1, 1, 1, 1, 1,
-1.178693, -0.3301304, -2.564991, 0, 0, 1, 1, 1,
-1.173341, -1.391734, -2.688878, 1, 0, 0, 1, 1,
-1.169486, -0.4016809, -2.770307, 1, 0, 0, 1, 1,
-1.161642, -3.051183, -3.108942, 1, 0, 0, 1, 1,
-1.16159, 1.422789, 0.2647769, 1, 0, 0, 1, 1,
-1.158907, -1.242875, -2.810913, 1, 0, 0, 1, 1,
-1.154815, 0.7550287, -2.102309, 0, 0, 0, 1, 1,
-1.144192, 1.430909, -1.479578, 0, 0, 0, 1, 1,
-1.142086, 0.9385768, -0.7331145, 0, 0, 0, 1, 1,
-1.140008, 0.4950135, -2.473951, 0, 0, 0, 1, 1,
-1.139156, -0.3930064, -2.216835, 0, 0, 0, 1, 1,
-1.12139, 0.5285846, -1.0971, 0, 0, 0, 1, 1,
-1.110235, 0.528588, -0.7409556, 0, 0, 0, 1, 1,
-1.106779, -0.1816781, -1.800335, 1, 1, 1, 1, 1,
-1.103808, -0.3144147, -2.783027, 1, 1, 1, 1, 1,
-1.097304, 0.09354748, -1.547057, 1, 1, 1, 1, 1,
-1.088682, -0.6847, -2.290885, 1, 1, 1, 1, 1,
-1.087066, -0.763587, -2.487357, 1, 1, 1, 1, 1,
-1.082711, 0.3751882, -2.154176, 1, 1, 1, 1, 1,
-1.077102, 1.577776, -2.003124, 1, 1, 1, 1, 1,
-1.072284, 1.180565, -0.155086, 1, 1, 1, 1, 1,
-1.072165, -1.331599, -2.5251, 1, 1, 1, 1, 1,
-1.072154, 0.7900813, -0.7693709, 1, 1, 1, 1, 1,
-1.063216, 1.109857, 1.264805, 1, 1, 1, 1, 1,
-1.060834, 0.198388, -2.247483, 1, 1, 1, 1, 1,
-1.060017, 1.711857, -0.9635876, 1, 1, 1, 1, 1,
-1.050733, -0.5476127, -3.92737, 1, 1, 1, 1, 1,
-1.048885, 1.37667, -1.61357, 1, 1, 1, 1, 1,
-1.047356, -0.8810658, -3.366225, 0, 0, 1, 1, 1,
-1.041549, -1.206888, -2.34519, 1, 0, 0, 1, 1,
-1.039164, -0.2191013, -0.731515, 1, 0, 0, 1, 1,
-1.038241, 1.05927, -1.132702, 1, 0, 0, 1, 1,
-1.036776, -0.1970806, -1.301823, 1, 0, 0, 1, 1,
-1.036341, -1.150872, -1.541796, 1, 0, 0, 1, 1,
-1.032879, -1.025727, -2.834219, 0, 0, 0, 1, 1,
-1.015068, -0.03294504, -1.488557, 0, 0, 0, 1, 1,
-1.009731, -0.5560592, -2.58029, 0, 0, 0, 1, 1,
-1.009237, 0.3433909, -1.638578, 0, 0, 0, 1, 1,
-1.004694, 0.3254302, -1.071063, 0, 0, 0, 1, 1,
-1.003806, 3.006028, -0.4428518, 0, 0, 0, 1, 1,
-1.003434, 0.978121, -0.796795, 0, 0, 0, 1, 1,
-1.003361, -0.01355559, -0.7732652, 1, 1, 1, 1, 1,
-1.001269, -1.921427, -3.705703, 1, 1, 1, 1, 1,
-1.001153, -0.57421, -2.352157, 1, 1, 1, 1, 1,
-1.001116, -0.4526364, -2.274572, 1, 1, 1, 1, 1,
-0.9976938, -2.567585, -3.208509, 1, 1, 1, 1, 1,
-0.9961929, 1.613532, -0.832861, 1, 1, 1, 1, 1,
-0.9908263, -0.2909394, -2.939568, 1, 1, 1, 1, 1,
-0.9898682, -1.412141, -3.550868, 1, 1, 1, 1, 1,
-0.9885485, 0.2929477, -0.6327412, 1, 1, 1, 1, 1,
-0.9824953, 0.1071533, -2.124065, 1, 1, 1, 1, 1,
-0.9785019, -0.242368, -3.283427, 1, 1, 1, 1, 1,
-0.9732372, -1.003365, -2.466277, 1, 1, 1, 1, 1,
-0.9684317, -0.3361075, -1.655655, 1, 1, 1, 1, 1,
-0.9545606, 0.6115644, -2.008715, 1, 1, 1, 1, 1,
-0.9478039, -1.365788, -1.083842, 1, 1, 1, 1, 1,
-0.9420362, 0.178205, -2.312239, 0, 0, 1, 1, 1,
-0.9359855, -0.7339626, -1.125252, 1, 0, 0, 1, 1,
-0.9323948, -0.4965896, -3.024456, 1, 0, 0, 1, 1,
-0.9314311, -0.6525825, -2.471599, 1, 0, 0, 1, 1,
-0.9286397, 0.7607259, -1.078724, 1, 0, 0, 1, 1,
-0.9279288, -0.9176208, -2.715715, 1, 0, 0, 1, 1,
-0.9257864, -1.351049, -4.154482, 0, 0, 0, 1, 1,
-0.9220033, -0.2358971, -2.298215, 0, 0, 0, 1, 1,
-0.9198378, -0.4048325, -3.687744, 0, 0, 0, 1, 1,
-0.9091519, 0.9866293, 0.3660007, 0, 0, 0, 1, 1,
-0.8961032, -0.5120106, -2.198043, 0, 0, 0, 1, 1,
-0.8952188, 0.6492481, -0.680226, 0, 0, 0, 1, 1,
-0.8948469, 0.1021761, -2.818333, 0, 0, 0, 1, 1,
-0.889263, 0.8257349, -2.195979, 1, 1, 1, 1, 1,
-0.8864421, 0.7035366, -1.651466, 1, 1, 1, 1, 1,
-0.8709994, -0.1417186, -2.780229, 1, 1, 1, 1, 1,
-0.8694071, 1.008938, -0.9418351, 1, 1, 1, 1, 1,
-0.8654073, 0.006480004, -1.117014, 1, 1, 1, 1, 1,
-0.8649645, 0.1311114, -1.680109, 1, 1, 1, 1, 1,
-0.8618741, 0.5265793, -0.5842765, 1, 1, 1, 1, 1,
-0.8581262, -1.265279, -2.59034, 1, 1, 1, 1, 1,
-0.8540316, 0.07091537, -1.277527, 1, 1, 1, 1, 1,
-0.8463892, -0.733716, -1.320824, 1, 1, 1, 1, 1,
-0.8437658, 0.7713248, -0.2920673, 1, 1, 1, 1, 1,
-0.8425426, 0.8678018, 0.2713179, 1, 1, 1, 1, 1,
-0.8374799, 0.2798465, -1.590339, 1, 1, 1, 1, 1,
-0.8362386, 0.01649718, -3.375819, 1, 1, 1, 1, 1,
-0.8327287, -0.2684035, -2.202254, 1, 1, 1, 1, 1,
-0.8307206, -1.114289, -3.544092, 0, 0, 1, 1, 1,
-0.8289155, -0.6903985, -4.301863, 1, 0, 0, 1, 1,
-0.8278095, -0.1317508, -2.16604, 1, 0, 0, 1, 1,
-0.8258363, -0.5920234, -2.18956, 1, 0, 0, 1, 1,
-0.8243614, -0.6458795, 0.1597371, 1, 0, 0, 1, 1,
-0.821898, 1.799502, 0.08802959, 1, 0, 0, 1, 1,
-0.8215809, -0.8277521, -2.221978, 0, 0, 0, 1, 1,
-0.8187077, -0.1520827, 0.5631019, 0, 0, 0, 1, 1,
-0.8177549, 0.3185827, -1.00958, 0, 0, 0, 1, 1,
-0.8170792, 0.2056072, -1.536101, 0, 0, 0, 1, 1,
-0.8151363, -0.7457514, -2.095958, 0, 0, 0, 1, 1,
-0.8099005, 0.7442524, -2.340354, 0, 0, 0, 1, 1,
-0.8064574, 0.1901554, -1.419649, 0, 0, 0, 1, 1,
-0.8029659, -2.009627, -3.977752, 1, 1, 1, 1, 1,
-0.7970121, 2.431523, -2.536592, 1, 1, 1, 1, 1,
-0.7940433, 1.298417, -2.155841, 1, 1, 1, 1, 1,
-0.7875419, 0.648674, -0.405937, 1, 1, 1, 1, 1,
-0.7851291, -1.263081, -2.279692, 1, 1, 1, 1, 1,
-0.7822856, 1.004407, -0.9202009, 1, 1, 1, 1, 1,
-0.7717194, 1.048645, -1.280308, 1, 1, 1, 1, 1,
-0.7701508, -0.7873163, -3.94623, 1, 1, 1, 1, 1,
-0.7663836, -1.576293, -2.231441, 1, 1, 1, 1, 1,
-0.7621318, -0.969145, -1.172984, 1, 1, 1, 1, 1,
-0.7564836, 0.2417995, -1.532291, 1, 1, 1, 1, 1,
-0.7548006, 0.8306983, -0.08035389, 1, 1, 1, 1, 1,
-0.7532226, 1.665751, -0.5812706, 1, 1, 1, 1, 1,
-0.7519839, 0.9109099, -1.070764, 1, 1, 1, 1, 1,
-0.7500405, 0.2785035, -0.9845136, 1, 1, 1, 1, 1,
-0.7473792, -0.549583, -0.4447533, 0, 0, 1, 1, 1,
-0.7375296, 0.2404831, -0.8880906, 1, 0, 0, 1, 1,
-0.7360865, -1.300237, -2.191818, 1, 0, 0, 1, 1,
-0.7337924, -1.353979, -1.570974, 1, 0, 0, 1, 1,
-0.732972, -0.5177165, -3.300472, 1, 0, 0, 1, 1,
-0.7232299, -0.3818281, -1.722431, 1, 0, 0, 1, 1,
-0.7230092, -0.4365099, -2.418389, 0, 0, 0, 1, 1,
-0.718141, 0.2591242, -0.1029786, 0, 0, 0, 1, 1,
-0.7123886, -0.7484433, -2.275366, 0, 0, 0, 1, 1,
-0.7114186, -0.7543592, -2.855624, 0, 0, 0, 1, 1,
-0.7099987, 0.4602188, -0.4454892, 0, 0, 0, 1, 1,
-0.7073439, 1.576096, -2.191135, 0, 0, 0, 1, 1,
-0.7034203, -0.3754598, -2.069252, 0, 0, 0, 1, 1,
-0.700873, 1.700268, -0.7205211, 1, 1, 1, 1, 1,
-0.6982237, -0.1666652, -2.919861, 1, 1, 1, 1, 1,
-0.6976792, -2.344151, -3.673863, 1, 1, 1, 1, 1,
-0.695838, 0.1163801, -2.224823, 1, 1, 1, 1, 1,
-0.6952033, -0.1690819, -2.631854, 1, 1, 1, 1, 1,
-0.6863237, -1.225574, -1.960731, 1, 1, 1, 1, 1,
-0.6845037, -0.1187534, -1.775647, 1, 1, 1, 1, 1,
-0.6777666, -0.2210118, -1.164545, 1, 1, 1, 1, 1,
-0.6765297, 0.7057218, -0.8455909, 1, 1, 1, 1, 1,
-0.6742228, 1.065197, -1.330199, 1, 1, 1, 1, 1,
-0.6729927, -0.871135, -2.314097, 1, 1, 1, 1, 1,
-0.6706868, -1.127633, -2.730772, 1, 1, 1, 1, 1,
-0.6675475, -0.208441, -1.521464, 1, 1, 1, 1, 1,
-0.667322, -0.3751017, -1.310966, 1, 1, 1, 1, 1,
-0.6566276, -0.430454, -3.087657, 1, 1, 1, 1, 1,
-0.6477804, 0.01967064, -2.363348, 0, 0, 1, 1, 1,
-0.6456735, 2.993345, 0.3566299, 1, 0, 0, 1, 1,
-0.6414722, 1.400212, -0.360467, 1, 0, 0, 1, 1,
-0.6411341, -1.400093, -1.772857, 1, 0, 0, 1, 1,
-0.6381248, 0.8086657, -0.4908023, 1, 0, 0, 1, 1,
-0.6364021, -0.2600245, -1.893702, 1, 0, 0, 1, 1,
-0.6341575, -1.051091, -1.970261, 0, 0, 0, 1, 1,
-0.6297276, 0.1939353, 0.7424495, 0, 0, 0, 1, 1,
-0.6199275, -0.519397, -0.7504539, 0, 0, 0, 1, 1,
-0.6169805, 0.09649924, -3.117915, 0, 0, 0, 1, 1,
-0.6154798, -0.2388652, -1.292522, 0, 0, 0, 1, 1,
-0.6153933, -0.8239447, -1.910682, 0, 0, 0, 1, 1,
-0.6131608, -0.3206228, -0.2031748, 0, 0, 0, 1, 1,
-0.6096858, 2.315127, -1.10085, 1, 1, 1, 1, 1,
-0.6092124, -0.3133338, -3.430118, 1, 1, 1, 1, 1,
-0.6082621, -1.018335, -1.70197, 1, 1, 1, 1, 1,
-0.6072142, -0.8595398, -2.941684, 1, 1, 1, 1, 1,
-0.5964248, 0.7179478, -0.1247618, 1, 1, 1, 1, 1,
-0.5906056, 0.8111336, -1.433303, 1, 1, 1, 1, 1,
-0.5881932, 0.1385937, 0.3258743, 1, 1, 1, 1, 1,
-0.5868966, 0.5069183, -1.162208, 1, 1, 1, 1, 1,
-0.5829644, 0.3895655, -1.796834, 1, 1, 1, 1, 1,
-0.573736, 0.1603233, -2.019088, 1, 1, 1, 1, 1,
-0.5702875, -0.4167252, -3.001252, 1, 1, 1, 1, 1,
-0.5669501, -0.591434, -3.154318, 1, 1, 1, 1, 1,
-0.5653877, -0.806751, -2.357877, 1, 1, 1, 1, 1,
-0.5651462, -1.109912, -1.805715, 1, 1, 1, 1, 1,
-0.5651147, -0.3405285, -1.916096, 1, 1, 1, 1, 1,
-0.5594354, 1.807624, -0.4464639, 0, 0, 1, 1, 1,
-0.5593967, 0.8279442, -1.965979, 1, 0, 0, 1, 1,
-0.5586467, 0.6845821, -0.9943689, 1, 0, 0, 1, 1,
-0.5576785, 0.5611628, 0.5382516, 1, 0, 0, 1, 1,
-0.5573447, 0.1697481, -1.178541, 1, 0, 0, 1, 1,
-0.5531757, -0.3688918, -4.130986, 1, 0, 0, 1, 1,
-0.5510536, -1.129636, -2.682071, 0, 0, 0, 1, 1,
-0.550073, -1.776036, -3.578343, 0, 0, 0, 1, 1,
-0.5454668, -1.837556, -2.482533, 0, 0, 0, 1, 1,
-0.5448819, -3.545878, -2.137484, 0, 0, 0, 1, 1,
-0.5400148, 0.2889551, -0.2564847, 0, 0, 0, 1, 1,
-0.5397442, -1.12983, -3.952894, 0, 0, 0, 1, 1,
-0.536188, 0.988097, -1.316981, 0, 0, 0, 1, 1,
-0.534692, -0.7051715, -1.114729, 1, 1, 1, 1, 1,
-0.5337904, 2.52836, 0.1351527, 1, 1, 1, 1, 1,
-0.5334311, 0.04262374, -2.440418, 1, 1, 1, 1, 1,
-0.5333744, 0.4166971, -0.3390076, 1, 1, 1, 1, 1,
-0.5194702, -0.9590843, -1.814727, 1, 1, 1, 1, 1,
-0.513786, 0.05364211, -2.642788, 1, 1, 1, 1, 1,
-0.5134458, -0.6597707, -3.070184, 1, 1, 1, 1, 1,
-0.5123044, 0.3122024, -0.4106234, 1, 1, 1, 1, 1,
-0.5096326, -0.4804532, -0.1821813, 1, 1, 1, 1, 1,
-0.5074027, 2.145256, 0.1097098, 1, 1, 1, 1, 1,
-0.5037431, -0.4125701, -1.917745, 1, 1, 1, 1, 1,
-0.5027686, -1.450969, -2.601493, 1, 1, 1, 1, 1,
-0.4971638, -0.1375845, -1.604564, 1, 1, 1, 1, 1,
-0.4969518, 1.826949, -0.5380825, 1, 1, 1, 1, 1,
-0.4922132, 0.1637223, -3.034492, 1, 1, 1, 1, 1,
-0.4900294, -0.8665244, -1.840313, 0, 0, 1, 1, 1,
-0.4885027, 0.002540515, -2.203912, 1, 0, 0, 1, 1,
-0.4861382, 1.11079, -2.088224, 1, 0, 0, 1, 1,
-0.4792882, -0.408921, -1.154872, 1, 0, 0, 1, 1,
-0.4740491, -0.08366811, -0.9836337, 1, 0, 0, 1, 1,
-0.4730111, -0.004130766, -2.060529, 1, 0, 0, 1, 1,
-0.4715913, -0.4622398, -2.568768, 0, 0, 0, 1, 1,
-0.4689213, -0.9142587, -3.647596, 0, 0, 0, 1, 1,
-0.4677096, 0.2976307, -0.3698057, 0, 0, 0, 1, 1,
-0.4651778, 0.2949659, -0.5752159, 0, 0, 0, 1, 1,
-0.4642946, 1.411535, -1.462232, 0, 0, 0, 1, 1,
-0.4620129, -1.225546, -2.393107, 0, 0, 0, 1, 1,
-0.4614569, -0.6418056, -1.774826, 0, 0, 0, 1, 1,
-0.4594721, -1.002056, -2.777985, 1, 1, 1, 1, 1,
-0.4581336, -0.5129018, -2.853901, 1, 1, 1, 1, 1,
-0.4560736, -0.6877983, -2.795115, 1, 1, 1, 1, 1,
-0.4523815, 0.9577374, 0.6392098, 1, 1, 1, 1, 1,
-0.4487196, -0.5121448, -1.805866, 1, 1, 1, 1, 1,
-0.4463179, 0.4365315, 0.8183649, 1, 1, 1, 1, 1,
-0.4442551, 0.2509823, -1.804134, 1, 1, 1, 1, 1,
-0.4434608, -0.4711602, -0.1096069, 1, 1, 1, 1, 1,
-0.4422084, -0.7024336, -1.599549, 1, 1, 1, 1, 1,
-0.4383106, -0.9742156, -3.971467, 1, 1, 1, 1, 1,
-0.4373742, 1.264539, -0.1714072, 1, 1, 1, 1, 1,
-0.4334978, -0.1849644, -3.520008, 1, 1, 1, 1, 1,
-0.4224491, -1.241442, -2.772943, 1, 1, 1, 1, 1,
-0.4122483, 0.5871964, -2.127884, 1, 1, 1, 1, 1,
-0.4091654, -0.5162678, -5.584602, 1, 1, 1, 1, 1,
-0.4045247, 0.1413879, -2.352147, 0, 0, 1, 1, 1,
-0.4035357, 0.6481678, -0.1618182, 1, 0, 0, 1, 1,
-0.4025384, -2.238868, -2.794381, 1, 0, 0, 1, 1,
-0.4024018, 1.526754, 0.5920411, 1, 0, 0, 1, 1,
-0.4022574, 1.641364, -0.3623587, 1, 0, 0, 1, 1,
-0.4010989, 0.6774973, -0.595898, 1, 0, 0, 1, 1,
-0.4006879, -1.48895, -4.697155, 0, 0, 0, 1, 1,
-0.39898, 2.522878, 0.2013814, 0, 0, 0, 1, 1,
-0.3980395, -0.2015782, -1.152462, 0, 0, 0, 1, 1,
-0.3951381, 0.9997011, -0.8031711, 0, 0, 0, 1, 1,
-0.3940541, 0.08840657, -1.720888, 0, 0, 0, 1, 1,
-0.3934772, -1.111094, -4.611174, 0, 0, 0, 1, 1,
-0.3918424, 0.9274555, -1.12212, 0, 0, 0, 1, 1,
-0.3870128, -0.06750929, -0.4352925, 1, 1, 1, 1, 1,
-0.3834727, -1.114817, -4.089753, 1, 1, 1, 1, 1,
-0.383127, -1.158373, -3.477633, 1, 1, 1, 1, 1,
-0.3827733, 1.578344, 1.461841, 1, 1, 1, 1, 1,
-0.3786836, 0.2373059, -0.5750644, 1, 1, 1, 1, 1,
-0.3771766, 1.38803, -1.607678, 1, 1, 1, 1, 1,
-0.3679276, -0.4847871, -2.677961, 1, 1, 1, 1, 1,
-0.3670657, 0.8721827, -1.027413, 1, 1, 1, 1, 1,
-0.3645727, -1.72666, -4.192494, 1, 1, 1, 1, 1,
-0.3631994, 0.7721931, -0.9345986, 1, 1, 1, 1, 1,
-0.3611088, 0.01527455, -2.100171, 1, 1, 1, 1, 1,
-0.3597687, 0.303328, -2.236172, 1, 1, 1, 1, 1,
-0.3543267, 0.2113914, -0.1678658, 1, 1, 1, 1, 1,
-0.353957, 1.287103, -0.9607387, 1, 1, 1, 1, 1,
-0.3529009, 2.481836, -0.5632848, 1, 1, 1, 1, 1,
-0.3386054, 1.527121, 0.6353276, 0, 0, 1, 1, 1,
-0.3352857, 0.1621463, -0.3261244, 1, 0, 0, 1, 1,
-0.3289638, 0.5659685, 1.48901, 1, 0, 0, 1, 1,
-0.3271385, 0.3350133, 1.390381, 1, 0, 0, 1, 1,
-0.325567, -1.001884, -0.8477593, 1, 0, 0, 1, 1,
-0.3254819, 0.7524576, -0.1466905, 1, 0, 0, 1, 1,
-0.3251098, -0.1219733, -3.222352, 0, 0, 0, 1, 1,
-0.3241379, -1.276363, -2.171299, 0, 0, 0, 1, 1,
-0.3238953, -0.3528284, -1.68235, 0, 0, 0, 1, 1,
-0.3212896, -0.3380861, -3.120716, 0, 0, 0, 1, 1,
-0.317886, 0.5362975, -1.747687, 0, 0, 0, 1, 1,
-0.3165091, -0.1404096, -2.735776, 0, 0, 0, 1, 1,
-0.3118788, -0.5502006, -3.314577, 0, 0, 0, 1, 1,
-0.3059941, -1.562617, -4.280722, 1, 1, 1, 1, 1,
-0.2997721, -0.6793402, -1.873916, 1, 1, 1, 1, 1,
-0.2986207, 0.2471601, -0.8612668, 1, 1, 1, 1, 1,
-0.2940943, 0.9441906, 1.561567, 1, 1, 1, 1, 1,
-0.2904253, -0.6784065, -2.945159, 1, 1, 1, 1, 1,
-0.2892505, -1.184852, -3.88478, 1, 1, 1, 1, 1,
-0.2886128, 0.3439073, -1.286073, 1, 1, 1, 1, 1,
-0.2872167, -0.3819877, -3.832026, 1, 1, 1, 1, 1,
-0.2852768, -0.3380895, -3.544729, 1, 1, 1, 1, 1,
-0.2849771, 0.8464031, 0.1365636, 1, 1, 1, 1, 1,
-0.2845961, -1.625839, -5.054149, 1, 1, 1, 1, 1,
-0.2844578, -1.639752, -2.810775, 1, 1, 1, 1, 1,
-0.2827899, -0.8259032, -2.643082, 1, 1, 1, 1, 1,
-0.2823965, 0.9491638, 1.018587, 1, 1, 1, 1, 1,
-0.2815352, -0.9137087, -1.266551, 1, 1, 1, 1, 1,
-0.2813027, -0.4622998, -3.498469, 0, 0, 1, 1, 1,
-0.2811721, -0.129704, -2.910569, 1, 0, 0, 1, 1,
-0.2807538, -0.06435884, -3.092584, 1, 0, 0, 1, 1,
-0.2715901, -2.760316, -4.643243, 1, 0, 0, 1, 1,
-0.2700954, -0.8646917, -3.390322, 1, 0, 0, 1, 1,
-0.2700335, -0.6395519, -2.752003, 1, 0, 0, 1, 1,
-0.2689066, -0.4332888, -1.833026, 0, 0, 0, 1, 1,
-0.2669874, -1.98116, -3.690272, 0, 0, 0, 1, 1,
-0.2595323, 0.1752174, -1.474244, 0, 0, 0, 1, 1,
-0.2556368, 0.2264043, -2.570526, 0, 0, 0, 1, 1,
-0.2553422, -2.137765, -3.267437, 0, 0, 0, 1, 1,
-0.2487393, -1.039164, -0.3592238, 0, 0, 0, 1, 1,
-0.2474134, 0.01888238, -1.114663, 0, 0, 0, 1, 1,
-0.2449074, -1.375854, -3.086327, 1, 1, 1, 1, 1,
-0.2417934, 0.3951399, -0.9722067, 1, 1, 1, 1, 1,
-0.2417797, -0.2784355, -1.913423, 1, 1, 1, 1, 1,
-0.2414081, -0.8803784, -4.058216, 1, 1, 1, 1, 1,
-0.2332464, -1.165843, -3.32901, 1, 1, 1, 1, 1,
-0.223188, 0.3545707, -0.9044976, 1, 1, 1, 1, 1,
-0.2179172, -1.663589, -2.674028, 1, 1, 1, 1, 1,
-0.2151554, 1.423262, -1.904308, 1, 1, 1, 1, 1,
-0.2136485, -0.1027601, -0.4940681, 1, 1, 1, 1, 1,
-0.2021338, -0.1351745, -1.813409, 1, 1, 1, 1, 1,
-0.1948972, -0.6648301, -3.108591, 1, 1, 1, 1, 1,
-0.1915944, 0.3885733, -0.03455217, 1, 1, 1, 1, 1,
-0.1893621, 0.3287427, -0.1953674, 1, 1, 1, 1, 1,
-0.1892583, -0.5594594, -3.460834, 1, 1, 1, 1, 1,
-0.1892406, -0.8210331, -3.146075, 1, 1, 1, 1, 1,
-0.1813217, 0.8518563, 0.07368711, 0, 0, 1, 1, 1,
-0.1813139, -0.4081904, -0.9304519, 1, 0, 0, 1, 1,
-0.1780252, 0.4488067, -2.309153, 1, 0, 0, 1, 1,
-0.1769463, 0.9419348, -0.4646538, 1, 0, 0, 1, 1,
-0.1754812, -0.01741484, -1.558716, 1, 0, 0, 1, 1,
-0.1752842, -0.5964176, -2.797093, 1, 0, 0, 1, 1,
-0.1750385, -0.8326164, -2.057111, 0, 0, 0, 1, 1,
-0.1723493, 2.003638, 0.2779112, 0, 0, 0, 1, 1,
-0.1692932, -0.7831192, -2.848276, 0, 0, 0, 1, 1,
-0.1684463, -0.3226935, -3.449046, 0, 0, 0, 1, 1,
-0.1679364, 0.6708723, -0.3945149, 0, 0, 0, 1, 1,
-0.1615695, -0.9753512, -2.525128, 0, 0, 0, 1, 1,
-0.1607151, -0.754191, -1.719682, 0, 0, 0, 1, 1,
-0.1590999, 0.08461072, -0.6413482, 1, 1, 1, 1, 1,
-0.157491, -0.9426981, -2.566446, 1, 1, 1, 1, 1,
-0.1533018, -1.997849, -2.84925, 1, 1, 1, 1, 1,
-0.1530004, 0.7526054, 2.236929, 1, 1, 1, 1, 1,
-0.1474632, -0.1381994, -2.083415, 1, 1, 1, 1, 1,
-0.1423461, -2.298335, -2.541787, 1, 1, 1, 1, 1,
-0.1403204, -0.3971806, -3.672285, 1, 1, 1, 1, 1,
-0.1360856, 1.235171, -0.4458476, 1, 1, 1, 1, 1,
-0.1352647, 0.7400911, -0.6986522, 1, 1, 1, 1, 1,
-0.1338495, 0.09259981, -1.853626, 1, 1, 1, 1, 1,
-0.133066, 0.9908031, 0.8117085, 1, 1, 1, 1, 1,
-0.1314773, -0.3505564, -3.330788, 1, 1, 1, 1, 1,
-0.1303147, 1.416952, 0.7933614, 1, 1, 1, 1, 1,
-0.1283366, -0.4881147, -1.785163, 1, 1, 1, 1, 1,
-0.126673, 1.07931, 0.3296472, 1, 1, 1, 1, 1,
-0.124267, 0.9527624, 0.6359119, 0, 0, 1, 1, 1,
-0.122917, -2.681653, -3.379733, 1, 0, 0, 1, 1,
-0.1223389, 0.493602, -1.502501, 1, 0, 0, 1, 1,
-0.1189763, 0.2270659, -0.5458717, 1, 0, 0, 1, 1,
-0.1158546, 0.5454475, -1.305505, 1, 0, 0, 1, 1,
-0.1050271, -1.671251, -2.064177, 1, 0, 0, 1, 1,
-0.1020165, 0.293994, -0.6498749, 0, 0, 0, 1, 1,
-0.09830032, -0.3751949, -2.649081, 0, 0, 0, 1, 1,
-0.09705658, 0.00477556, -2.07893, 0, 0, 0, 1, 1,
-0.09368464, -3.557072, -4.879477, 0, 0, 0, 1, 1,
-0.093416, 1.182183, -0.8167691, 0, 0, 0, 1, 1,
-0.09253892, 0.3505151, -0.08922358, 0, 0, 0, 1, 1,
-0.08990159, 1.15014, 0.321272, 0, 0, 0, 1, 1,
-0.08770526, 0.5779932, 0.2199041, 1, 1, 1, 1, 1,
-0.08497086, -1.04214, -2.725873, 1, 1, 1, 1, 1,
-0.08250616, -0.1072934, -2.782376, 1, 1, 1, 1, 1,
-0.08155662, 2.246724, 0.1530239, 1, 1, 1, 1, 1,
-0.08031296, 0.7273443, 0.06194027, 1, 1, 1, 1, 1,
-0.07842482, 0.8318824, -0.5209631, 1, 1, 1, 1, 1,
-0.07563619, -0.1084525, -1.948711, 1, 1, 1, 1, 1,
-0.07490566, 0.7722327, 0.807204, 1, 1, 1, 1, 1,
-0.07135054, 1.124859, -0.9818302, 1, 1, 1, 1, 1,
-0.06536047, 0.8077347, -0.4310025, 1, 1, 1, 1, 1,
-0.05825417, 1.380847, 1.226025, 1, 1, 1, 1, 1,
-0.05800854, -0.537532, -1.778314, 1, 1, 1, 1, 1,
-0.05544779, 0.4535836, 0.599232, 1, 1, 1, 1, 1,
-0.05308774, 0.06510994, 0.2566748, 1, 1, 1, 1, 1,
-0.04734916, 1.344831, 0.5587103, 1, 1, 1, 1, 1,
-0.04588981, 0.3306948, -0.04916221, 0, 0, 1, 1, 1,
-0.045876, 0.02818459, -0.6723098, 1, 0, 0, 1, 1,
-0.04336048, -0.7828014, -3.363002, 1, 0, 0, 1, 1,
-0.04289617, -1.32646, -2.760582, 1, 0, 0, 1, 1,
-0.04146682, -0.06479124, -3.168545, 1, 0, 0, 1, 1,
-0.04086101, 1.146528, -0.04307266, 1, 0, 0, 1, 1,
-0.0365251, 1.97131, -2.021289, 0, 0, 0, 1, 1,
-0.02895718, 0.2666676, 1.572537, 0, 0, 0, 1, 1,
-0.02857254, -0.06284679, -3.011147, 0, 0, 0, 1, 1,
-0.02504307, -0.7643574, -3.371139, 0, 0, 0, 1, 1,
-0.02041252, -1.902166, -2.713424, 0, 0, 0, 1, 1,
-0.0177474, -0.2017535, -2.435292, 0, 0, 0, 1, 1,
-0.005642281, -0.134894, -3.696711, 0, 0, 0, 1, 1,
-0.005408658, -1.031443, -2.277785, 1, 1, 1, 1, 1,
-0.0004330301, 0.7052327, 0.9690674, 1, 1, 1, 1, 1,
0.001121948, -1.59031, 3.59865, 1, 1, 1, 1, 1,
0.001953831, -0.6561407, 3.604427, 1, 1, 1, 1, 1,
0.002016681, -0.8762027, 2.871669, 1, 1, 1, 1, 1,
0.003393018, -0.9764021, 2.018783, 1, 1, 1, 1, 1,
0.004100138, 1.574783, 0.195817, 1, 1, 1, 1, 1,
0.004132236, 1.2102, 1.146351, 1, 1, 1, 1, 1,
0.01727254, -2.445258, 3.868042, 1, 1, 1, 1, 1,
0.02328914, -0.86606, 2.349763, 1, 1, 1, 1, 1,
0.02369727, 0.755631, -0.02791083, 1, 1, 1, 1, 1,
0.02483771, -0.07330202, 2.604146, 1, 1, 1, 1, 1,
0.02617776, -0.4572341, 4.152081, 1, 1, 1, 1, 1,
0.02793229, 0.5052667, 0.4579434, 1, 1, 1, 1, 1,
0.02877775, 0.2956443, -0.2013863, 1, 1, 1, 1, 1,
0.02991041, 0.3488563, -0.2079189, 0, 0, 1, 1, 1,
0.0326266, 1.179331, -0.9219418, 1, 0, 0, 1, 1,
0.03390291, 0.3256528, 1.368616, 1, 0, 0, 1, 1,
0.03438289, 0.7226796, 0.4599056, 1, 0, 0, 1, 1,
0.0353739, 1.108912, -0.3994924, 1, 0, 0, 1, 1,
0.03963258, 0.5722589, -1.91829, 1, 0, 0, 1, 1,
0.04191952, 0.09493121, -0.03646272, 0, 0, 0, 1, 1,
0.04197709, 1.246298, -1.005535, 0, 0, 0, 1, 1,
0.04536884, -0.2778377, 4.886218, 0, 0, 0, 1, 1,
0.04577104, -1.580841, 3.155838, 0, 0, 0, 1, 1,
0.04608326, -0.7379251, 3.377918, 0, 0, 0, 1, 1,
0.05384222, 0.04317643, 1.013208, 0, 0, 0, 1, 1,
0.0557153, -0.3534978, 3.433901, 0, 0, 0, 1, 1,
0.05649446, 0.7160047, 0.02128994, 1, 1, 1, 1, 1,
0.06222498, 0.3807701, -0.8384798, 1, 1, 1, 1, 1,
0.06247959, 1.412945, 1.339299, 1, 1, 1, 1, 1,
0.06756184, -0.3653033, 4.15498, 1, 1, 1, 1, 1,
0.06948496, 1.056496, 0.7482046, 1, 1, 1, 1, 1,
0.06992166, 0.3970673, -0.7514885, 1, 1, 1, 1, 1,
0.0719818, -0.2566113, 2.857595, 1, 1, 1, 1, 1,
0.0734843, 1.50464, -0.05214404, 1, 1, 1, 1, 1,
0.07397348, 0.1888587, -0.1083013, 1, 1, 1, 1, 1,
0.07501029, 0.09445642, 0.2308831, 1, 1, 1, 1, 1,
0.07592919, 0.5052196, 1.275602, 1, 1, 1, 1, 1,
0.07701016, 0.3195128, -1.06004, 1, 1, 1, 1, 1,
0.08495913, -0.2331562, 2.585051, 1, 1, 1, 1, 1,
0.08674408, 0.3227446, 0.4024809, 1, 1, 1, 1, 1,
0.09068538, 0.2949263, 1.965198, 1, 1, 1, 1, 1,
0.09112511, -0.2070817, 2.377844, 0, 0, 1, 1, 1,
0.09691847, -0.8051883, 3.810165, 1, 0, 0, 1, 1,
0.09809364, 0.02400405, 2.121293, 1, 0, 0, 1, 1,
0.1017514, -0.1191598, 5.453482, 1, 0, 0, 1, 1,
0.101901, 0.1047654, -2.112844, 1, 0, 0, 1, 1,
0.1023655, 0.2665527, -0.7676695, 1, 0, 0, 1, 1,
0.1028316, 0.2735752, 0.6624708, 0, 0, 0, 1, 1,
0.1029888, -0.2677459, 4.080381, 0, 0, 0, 1, 1,
0.1042204, 0.7578134, -0.6502269, 0, 0, 0, 1, 1,
0.1086783, 0.8049561, -0.6997632, 0, 0, 0, 1, 1,
0.1163951, 0.1455601, 1.600852, 0, 0, 0, 1, 1,
0.1169775, 0.6005613, 0.2635628, 0, 0, 0, 1, 1,
0.1201347, 1.307234, -0.4923868, 0, 0, 0, 1, 1,
0.123147, 0.2446863, 2.099352, 1, 1, 1, 1, 1,
0.1255895, -1.504334, 2.418795, 1, 1, 1, 1, 1,
0.126812, -1.153833, 4.99853, 1, 1, 1, 1, 1,
0.1294892, -0.9914612, 1.380461, 1, 1, 1, 1, 1,
0.1382679, -1.269902, 2.630499, 1, 1, 1, 1, 1,
0.1386965, -0.3761818, 3.510603, 1, 1, 1, 1, 1,
0.1408642, 0.8157896, -1.370804, 1, 1, 1, 1, 1,
0.1472521, -2.352108, 4.300678, 1, 1, 1, 1, 1,
0.1478692, -1.595766, 2.584407, 1, 1, 1, 1, 1,
0.1479364, -1.150143, 3.601725, 1, 1, 1, 1, 1,
0.1502297, 1.854345, -1.594206, 1, 1, 1, 1, 1,
0.1510782, 2.054403, -1.051098, 1, 1, 1, 1, 1,
0.1568813, 0.1461485, 0.4825791, 1, 1, 1, 1, 1,
0.1579081, -0.638428, 2.290144, 1, 1, 1, 1, 1,
0.158238, -1.395257, 2.51353, 1, 1, 1, 1, 1,
0.1605326, 1.413436, -1.401327, 0, 0, 1, 1, 1,
0.1608839, -1.917889, 4.350764, 1, 0, 0, 1, 1,
0.1625443, -1.116904, 4.201106, 1, 0, 0, 1, 1,
0.168643, -0.4302693, 1.750005, 1, 0, 0, 1, 1,
0.1693915, -0.8958229, 3.251501, 1, 0, 0, 1, 1,
0.1704015, 1.158301, 0.9873897, 1, 0, 0, 1, 1,
0.1723011, 0.4341149, -0.1277248, 0, 0, 0, 1, 1,
0.1780037, 2.400811, 1.848862, 0, 0, 0, 1, 1,
0.1802786, 0.3494802, -0.1698509, 0, 0, 0, 1, 1,
0.1812015, 0.6094943, 1.352069, 0, 0, 0, 1, 1,
0.1861195, 0.3576686, 1.218567, 0, 0, 0, 1, 1,
0.1951503, -0.7844412, 2.033147, 0, 0, 0, 1, 1,
0.1952381, 0.5751827, 0.2396696, 0, 0, 0, 1, 1,
0.1979559, 0.4545265, -0.2058787, 1, 1, 1, 1, 1,
0.1983543, 1.67344, -0.6531777, 1, 1, 1, 1, 1,
0.2002561, 1.875889, 0.5041108, 1, 1, 1, 1, 1,
0.2021842, 1.355664, 1.001266, 1, 1, 1, 1, 1,
0.2039296, 0.9198639, 0.4971989, 1, 1, 1, 1, 1,
0.2047753, -0.8429103, 2.229695, 1, 1, 1, 1, 1,
0.2060035, -0.6364143, 1.836906, 1, 1, 1, 1, 1,
0.2061525, 0.9738259, 1.627938, 1, 1, 1, 1, 1,
0.2064003, -1.441561, 3.45842, 1, 1, 1, 1, 1,
0.2145002, 0.4571844, 2.125364, 1, 1, 1, 1, 1,
0.2174439, -0.4394184, 2.999422, 1, 1, 1, 1, 1,
0.2179857, 0.8829872, 0.1195027, 1, 1, 1, 1, 1,
0.2182252, 0.1158478, 1.913027, 1, 1, 1, 1, 1,
0.2190372, -0.7730511, 4.239789, 1, 1, 1, 1, 1,
0.2200845, -0.8342723, 0.03724187, 1, 1, 1, 1, 1,
0.2221661, 0.8675789, 0.2666173, 0, 0, 1, 1, 1,
0.2222209, 0.3924869, -0.7909905, 1, 0, 0, 1, 1,
0.2271965, -0.4506683, 2.317432, 1, 0, 0, 1, 1,
0.2288168, 0.5048729, -0.738465, 1, 0, 0, 1, 1,
0.2299767, -1.470506, 2.345916, 1, 0, 0, 1, 1,
0.2339388, 0.2408756, 1.353153, 1, 0, 0, 1, 1,
0.2353256, -0.3668807, 2.005263, 0, 0, 0, 1, 1,
0.2380936, -0.8212562, 3.156797, 0, 0, 0, 1, 1,
0.2417386, 0.5126292, 0.5985159, 0, 0, 0, 1, 1,
0.2446164, -0.4071778, 3.032368, 0, 0, 0, 1, 1,
0.2491898, 0.6267578, 0.09512136, 0, 0, 0, 1, 1,
0.2503536, 0.8424504, 0.7591703, 0, 0, 0, 1, 1,
0.2508894, -1.322086, 4.22958, 0, 0, 0, 1, 1,
0.2518117, -0.9517793, 2.408872, 1, 1, 1, 1, 1,
0.2521915, 0.8441397, 0.7224444, 1, 1, 1, 1, 1,
0.2523934, -1.284888, 2.504007, 1, 1, 1, 1, 1,
0.2546783, -0.2968947, 1.621532, 1, 1, 1, 1, 1,
0.2551193, 1.112507, 0.340537, 1, 1, 1, 1, 1,
0.257851, 0.1779334, -0.3038827, 1, 1, 1, 1, 1,
0.2586456, 0.6824606, -0.3938614, 1, 1, 1, 1, 1,
0.2600087, 0.4382996, 0.5188152, 1, 1, 1, 1, 1,
0.2600139, -1.446847, 1.879535, 1, 1, 1, 1, 1,
0.2689745, 0.05078515, 2.623674, 1, 1, 1, 1, 1,
0.271378, 1.065661, 0.3588317, 1, 1, 1, 1, 1,
0.2781868, 0.4886391, 1.459846, 1, 1, 1, 1, 1,
0.2792458, 0.6410013, 0.5610712, 1, 1, 1, 1, 1,
0.2836685, -0.0925559, 1.738648, 1, 1, 1, 1, 1,
0.2849633, 0.7043343, 1.240941, 1, 1, 1, 1, 1,
0.306371, -1.188058, 1.568543, 0, 0, 1, 1, 1,
0.307615, -0.6340925, 3.702162, 1, 0, 0, 1, 1,
0.3129895, -0.9071797, -0.1017601, 1, 0, 0, 1, 1,
0.3163487, -0.2990122, 3.304126, 1, 0, 0, 1, 1,
0.3231823, 0.3171548, 0.8911501, 1, 0, 0, 1, 1,
0.325183, 0.3654247, 0.6807394, 1, 0, 0, 1, 1,
0.3299907, 1.147831, -1.465805, 0, 0, 0, 1, 1,
0.3306456, 1.473494, -1.26421, 0, 0, 0, 1, 1,
0.3352095, 0.07111157, 0.02534077, 0, 0, 0, 1, 1,
0.3357338, 0.02322148, 1.467688, 0, 0, 0, 1, 1,
0.3370637, -1.676469, 2.016309, 0, 0, 0, 1, 1,
0.3413608, -0.8776113, 0.3700896, 0, 0, 0, 1, 1,
0.3416952, 1.192819, 0.3422655, 0, 0, 0, 1, 1,
0.3433286, 3.618075, 1.101229, 1, 1, 1, 1, 1,
0.3446953, 1.87195, 1.525238, 1, 1, 1, 1, 1,
0.3478111, 0.231229, 1.577131, 1, 1, 1, 1, 1,
0.3488752, 0.09867768, 0.02876311, 1, 1, 1, 1, 1,
0.3497579, 0.04446131, 1.313784, 1, 1, 1, 1, 1,
0.3497901, -1.114444, 2.602749, 1, 1, 1, 1, 1,
0.3511596, 0.162468, 1.76909, 1, 1, 1, 1, 1,
0.3523324, -0.1660814, 3.955355, 1, 1, 1, 1, 1,
0.3549934, -1.188189, 3.643808, 1, 1, 1, 1, 1,
0.3582845, -0.7043023, 2.452224, 1, 1, 1, 1, 1,
0.358521, 2.587415, -0.04320314, 1, 1, 1, 1, 1,
0.3612274, -1.601956, 3.237864, 1, 1, 1, 1, 1,
0.3658116, 0.197634, 1.504213, 1, 1, 1, 1, 1,
0.3699878, -0.03621453, 1.130648, 1, 1, 1, 1, 1,
0.3711131, -1.465599, 3.453665, 1, 1, 1, 1, 1,
0.3740694, 0.1832602, 0.7562265, 0, 0, 1, 1, 1,
0.3774514, -0.8085905, 2.584761, 1, 0, 0, 1, 1,
0.3788362, 1.401309, 0.2617115, 1, 0, 0, 1, 1,
0.379765, -0.4104193, 2.652884, 1, 0, 0, 1, 1,
0.3864585, 1.136063, 1.656463, 1, 0, 0, 1, 1,
0.3867985, 0.006821711, 0.3069283, 1, 0, 0, 1, 1,
0.3884368, -0.2659885, 2.28691, 0, 0, 0, 1, 1,
0.3977339, -0.6861568, 2.107967, 0, 0, 0, 1, 1,
0.4006156, 0.3407, 0.5081416, 0, 0, 0, 1, 1,
0.4040561, -0.3704962, 2.158555, 0, 0, 0, 1, 1,
0.4110328, -0.285641, 0.9993747, 0, 0, 0, 1, 1,
0.411567, 0.7293078, 0.4152832, 0, 0, 0, 1, 1,
0.4122619, -0.7403976, 1.277709, 0, 0, 0, 1, 1,
0.4214969, -0.05576649, 1.413186, 1, 1, 1, 1, 1,
0.4287561, -0.5570942, 0.4363145, 1, 1, 1, 1, 1,
0.4305893, 0.3191799, -0.3462571, 1, 1, 1, 1, 1,
0.4327696, 2.059038, -1.491296, 1, 1, 1, 1, 1,
0.4333869, 0.6377066, 0.127316, 1, 1, 1, 1, 1,
0.4344659, -2.152682, 3.204298, 1, 1, 1, 1, 1,
0.435044, 1.244484, -0.0511524, 1, 1, 1, 1, 1,
0.4366909, -1.217624, 2.425669, 1, 1, 1, 1, 1,
0.4429272, 1.131073, 1.355497, 1, 1, 1, 1, 1,
0.4438968, -1.84313, 2.430032, 1, 1, 1, 1, 1,
0.4440223, 1.803065, 0.6294163, 1, 1, 1, 1, 1,
0.4476963, 0.7491105, 1.518255, 1, 1, 1, 1, 1,
0.4590573, 0.1823141, 3.28282, 1, 1, 1, 1, 1,
0.4640366, -0.7700607, 2.58526, 1, 1, 1, 1, 1,
0.4663054, -0.5963396, 3.368859, 1, 1, 1, 1, 1,
0.4669339, -0.5588713, 3.309309, 0, 0, 1, 1, 1,
0.4698928, 0.3921461, -0.001593155, 1, 0, 0, 1, 1,
0.4709227, 1.378609, 0.1518094, 1, 0, 0, 1, 1,
0.4769709, -0.9344985, 4.876203, 1, 0, 0, 1, 1,
0.4798242, -0.5597332, 2.626265, 1, 0, 0, 1, 1,
0.480351, -1.543475, 4.564923, 1, 0, 0, 1, 1,
0.4828345, 1.686597, -0.5890825, 0, 0, 0, 1, 1,
0.4853693, -0.1754338, 2.285336, 0, 0, 0, 1, 1,
0.4923136, 0.3902312, -0.05333367, 0, 0, 0, 1, 1,
0.495372, -1.156242, 2.389752, 0, 0, 0, 1, 1,
0.4967465, 0.2040664, 1.546665, 0, 0, 0, 1, 1,
0.5031153, -0.7441443, 2.719918, 0, 0, 0, 1, 1,
0.505533, 0.528272, 2.478495, 0, 0, 0, 1, 1,
0.5065093, 0.9193503, -0.8923512, 1, 1, 1, 1, 1,
0.5095213, 0.3784443, -0.7395968, 1, 1, 1, 1, 1,
0.5124123, -1.524424, 5.629733, 1, 1, 1, 1, 1,
0.5126432, 0.3600155, -0.4373851, 1, 1, 1, 1, 1,
0.5134042, -0.3974126, 3.653172, 1, 1, 1, 1, 1,
0.5160957, -0.9579787, 2.586584, 1, 1, 1, 1, 1,
0.5176042, -0.5896869, 2.748252, 1, 1, 1, 1, 1,
0.5176347, 2.407488, 1.400965, 1, 1, 1, 1, 1,
0.5206841, 1.989381, 0.3970492, 1, 1, 1, 1, 1,
0.5211588, -1.777106, 2.82443, 1, 1, 1, 1, 1,
0.5222823, -1.33789, 1.508164, 1, 1, 1, 1, 1,
0.5223788, -2.403063, 3.963689, 1, 1, 1, 1, 1,
0.5359392, 0.6572378, 0.006124781, 1, 1, 1, 1, 1,
0.5374572, -0.48162, 4.167924, 1, 1, 1, 1, 1,
0.5390736, 1.229357, -0.08908456, 1, 1, 1, 1, 1,
0.5392528, 2.258816, -0.1071945, 0, 0, 1, 1, 1,
0.5393533, 1.133356, -0.5601926, 1, 0, 0, 1, 1,
0.543295, -0.3949865, 1.795278, 1, 0, 0, 1, 1,
0.5436018, -0.1069204, 1.404453, 1, 0, 0, 1, 1,
0.5475416, -0.1724066, -0.6984795, 1, 0, 0, 1, 1,
0.5511547, -1.225908, 2.714417, 1, 0, 0, 1, 1,
0.5523397, 0.8819538, 1.129285, 0, 0, 0, 1, 1,
0.5538557, 0.9489987, -0.001298831, 0, 0, 0, 1, 1,
0.5556173, -0.2197042, 3.441978, 0, 0, 0, 1, 1,
0.5624737, 0.4187225, 2.447554, 0, 0, 0, 1, 1,
0.5625533, 1.001598, 1.833936, 0, 0, 0, 1, 1,
0.564723, 0.8427082, -0.07294075, 0, 0, 0, 1, 1,
0.5698605, 0.08786377, 0.8208758, 0, 0, 0, 1, 1,
0.5721242, 0.1781768, 0.4315443, 1, 1, 1, 1, 1,
0.5737834, 0.5686395, 1.416827, 1, 1, 1, 1, 1,
0.5768995, -1.060124, 2.504681, 1, 1, 1, 1, 1,
0.5774249, -1.207739, 3.244401, 1, 1, 1, 1, 1,
0.5795879, -1.166691, 2.118292, 1, 1, 1, 1, 1,
0.5806049, 0.1620706, 1.476051, 1, 1, 1, 1, 1,
0.5824432, -1.002716, 4.087502, 1, 1, 1, 1, 1,
0.5853829, -0.1218931, 3.331546, 1, 1, 1, 1, 1,
0.5898771, -0.8767542, 2.383645, 1, 1, 1, 1, 1,
0.5899249, -0.1437378, 1.998538, 1, 1, 1, 1, 1,
0.5948382, -0.1549891, 1.899671, 1, 1, 1, 1, 1,
0.5952728, 0.8198292, 0.8878893, 1, 1, 1, 1, 1,
0.6048355, -0.749303, 3.306842, 1, 1, 1, 1, 1,
0.6058133, -1.57199, 3.188644, 1, 1, 1, 1, 1,
0.606694, -0.3685833, 2.484421, 1, 1, 1, 1, 1,
0.606701, 0.2598453, 1.263592, 0, 0, 1, 1, 1,
0.6091526, 0.2061214, 0.63281, 1, 0, 0, 1, 1,
0.6098611, -2.258688, 4.715827, 1, 0, 0, 1, 1,
0.6151613, 1.675875, -1.538991, 1, 0, 0, 1, 1,
0.6162713, -0.3167531, 2.410904, 1, 0, 0, 1, 1,
0.6168457, 0.06774116, 3.041638, 1, 0, 0, 1, 1,
0.6179454, -0.9603789, 1.907158, 0, 0, 0, 1, 1,
0.619816, -0.5020681, 0.9577172, 0, 0, 0, 1, 1,
0.6202695, -1.420483, 3.225606, 0, 0, 0, 1, 1,
0.6222199, 0.09857811, 1.435867, 0, 0, 0, 1, 1,
0.6313387, -0.4165609, 2.703868, 0, 0, 0, 1, 1,
0.6338867, 0.9262053, 0.1086877, 0, 0, 0, 1, 1,
0.6352308, 0.8508081, 1.892898, 0, 0, 0, 1, 1,
0.6391596, 0.0892151, 2.891096, 1, 1, 1, 1, 1,
0.6396831, 1.08517, -0.7166178, 1, 1, 1, 1, 1,
0.646727, -0.9108669, 2.403135, 1, 1, 1, 1, 1,
0.6550629, 0.5100646, 0.5041305, 1, 1, 1, 1, 1,
0.6591257, -0.177792, 2.691154, 1, 1, 1, 1, 1,
0.6594407, 1.421483, -0.7265323, 1, 1, 1, 1, 1,
0.6645487, 1.437699, -0.222929, 1, 1, 1, 1, 1,
0.6672796, 0.1161776, 1.805204, 1, 1, 1, 1, 1,
0.6713867, 0.6174445, -0.5563822, 1, 1, 1, 1, 1,
0.6737782, -0.4753616, 2.191486, 1, 1, 1, 1, 1,
0.674593, -0.170121, 1.080005, 1, 1, 1, 1, 1,
0.6844361, -0.04035429, 1.349186, 1, 1, 1, 1, 1,
0.6866266, -0.5054744, 3.62619, 1, 1, 1, 1, 1,
0.6867403, 0.8896711, 0.7588766, 1, 1, 1, 1, 1,
0.6877652, -0.4061035, 3.161343, 1, 1, 1, 1, 1,
0.6922436, 2.274188, -0.4899623, 0, 0, 1, 1, 1,
0.6973079, 1.220363, -0.8005791, 1, 0, 0, 1, 1,
0.7026278, 1.238521, 1.86704, 1, 0, 0, 1, 1,
0.7026477, -2.33782, 4.120697, 1, 0, 0, 1, 1,
0.7071833, -2.231255, 3.385942, 1, 0, 0, 1, 1,
0.7118298, -0.983175, 0.08933207, 1, 0, 0, 1, 1,
0.7153719, -0.5918295, 1.850555, 0, 0, 0, 1, 1,
0.7173781, 0.9037071, -0.6745789, 0, 0, 0, 1, 1,
0.7176397, -0.5516238, 2.307366, 0, 0, 0, 1, 1,
0.7197297, 0.84115, 2.237412, 0, 0, 0, 1, 1,
0.7254198, 1.014196, 0.8437701, 0, 0, 0, 1, 1,
0.7297034, -1.273943, 1.784779, 0, 0, 0, 1, 1,
0.7313235, -0.2403087, 2.748077, 0, 0, 0, 1, 1,
0.7350454, -0.9407467, 3.746841, 1, 1, 1, 1, 1,
0.7397726, 0.4589669, -1.068587, 1, 1, 1, 1, 1,
0.7446837, 0.5351743, 1.488955, 1, 1, 1, 1, 1,
0.7466071, -0.7115917, 1.539726, 1, 1, 1, 1, 1,
0.7518495, 0.4558858, 1.836721, 1, 1, 1, 1, 1,
0.752818, 1.138871, 0.4783674, 1, 1, 1, 1, 1,
0.7574243, -0.3928881, 1.489417, 1, 1, 1, 1, 1,
0.7618183, -0.8615881, 2.299302, 1, 1, 1, 1, 1,
0.7619662, -0.1472437, 2.677159, 1, 1, 1, 1, 1,
0.7645181, 0.3379263, 0.4056482, 1, 1, 1, 1, 1,
0.7656673, 1.588217, 0.6988198, 1, 1, 1, 1, 1,
0.7731248, -1.39189, 1.440322, 1, 1, 1, 1, 1,
0.7763753, 0.7305703, 1.793766, 1, 1, 1, 1, 1,
0.783911, -0.2050424, 0.956046, 1, 1, 1, 1, 1,
0.7872192, -2.01521, 3.576129, 1, 1, 1, 1, 1,
0.799329, 0.1823669, 1.736694, 0, 0, 1, 1, 1,
0.799574, -0.8642588, 3.468308, 1, 0, 0, 1, 1,
0.8049697, 0.1237293, 0.9743369, 1, 0, 0, 1, 1,
0.8104329, -1.211307, 1.751476, 1, 0, 0, 1, 1,
0.8172349, 0.4517446, 2.14233, 1, 0, 0, 1, 1,
0.8188632, 0.4480991, 1.758513, 1, 0, 0, 1, 1,
0.8190947, -1.6614, 3.750286, 0, 0, 0, 1, 1,
0.8214604, 0.4456154, 1.566407, 0, 0, 0, 1, 1,
0.8216246, -0.08500881, 1.741155, 0, 0, 0, 1, 1,
0.8241665, 0.4499834, 1.250653, 0, 0, 0, 1, 1,
0.8261463, -1.13626, 4.144383, 0, 0, 0, 1, 1,
0.8267906, -1.439761, 3.611091, 0, 0, 0, 1, 1,
0.8317227, 0.3754822, 0.4396396, 0, 0, 0, 1, 1,
0.83763, 1.903605, 2.285995, 1, 1, 1, 1, 1,
0.8497368, 1.01087, 1.405439, 1, 1, 1, 1, 1,
0.8590907, 0.6933207, 0.9280252, 1, 1, 1, 1, 1,
0.8662784, 1.267725, -1.327972, 1, 1, 1, 1, 1,
0.8676901, 1.268429, 1.218412, 1, 1, 1, 1, 1,
0.8712344, 0.03904312, 3.389279, 1, 1, 1, 1, 1,
0.8716952, 1.338499, 0.7489291, 1, 1, 1, 1, 1,
0.8761322, -0.20419, 3.170564, 1, 1, 1, 1, 1,
0.883502, 1.60078, -1.487544, 1, 1, 1, 1, 1,
0.8851702, -0.3195015, 1.589213, 1, 1, 1, 1, 1,
0.890549, -0.5314947, 1.863121, 1, 1, 1, 1, 1,
0.8911481, 1.462527, 0.7008011, 1, 1, 1, 1, 1,
0.8950503, -0.1939785, 1.715756, 1, 1, 1, 1, 1,
0.8951983, 0.5821545, 0.5811661, 1, 1, 1, 1, 1,
0.8976533, -0.37593, 1.377978, 1, 1, 1, 1, 1,
0.9050013, 1.714848, 1.24915, 0, 0, 1, 1, 1,
0.9108626, 1.24958, 0.6727954, 1, 0, 0, 1, 1,
0.9135575, -0.3310581, 2.251382, 1, 0, 0, 1, 1,
0.9135962, 0.2503776, 0.6447085, 1, 0, 0, 1, 1,
0.9197789, 0.01682157, 2.596168, 1, 0, 0, 1, 1,
0.9216898, 1.518834, 1.00188, 1, 0, 0, 1, 1,
0.9226683, 1.365118, 0.9190881, 0, 0, 0, 1, 1,
0.9256093, 1.966357, 2.378241, 0, 0, 0, 1, 1,
0.9330922, 1.58584, 0.786992, 0, 0, 0, 1, 1,
0.9340388, 0.3285391, 1.635481, 0, 0, 0, 1, 1,
0.936241, 0.6006932, 0.5066453, 0, 0, 0, 1, 1,
0.9399021, 0.0309384, -0.006531751, 0, 0, 0, 1, 1,
0.9511498, 1.31708, 0.7661994, 0, 0, 0, 1, 1,
0.9516609, 1.996159, 2.696697, 1, 1, 1, 1, 1,
0.9536048, -0.1389346, 2.581573, 1, 1, 1, 1, 1,
0.956013, -0.6783814, 1.887844, 1, 1, 1, 1, 1,
0.961368, -1.289182, 1.367366, 1, 1, 1, 1, 1,
0.9634025, -1.721039, 4.074603, 1, 1, 1, 1, 1,
0.9639947, 1.030404, 1.311135, 1, 1, 1, 1, 1,
0.9750809, -0.1391409, 2.816681, 1, 1, 1, 1, 1,
0.9765875, -1.594236, 3.541166, 1, 1, 1, 1, 1,
0.976761, 0.2861553, 1.86088, 1, 1, 1, 1, 1,
0.9826026, -0.4080432, 2.251558, 1, 1, 1, 1, 1,
0.9869626, 0.289273, 1.492811, 1, 1, 1, 1, 1,
0.9923425, 0.3946201, -0.1214151, 1, 1, 1, 1, 1,
0.9970264, -1.334806, 2.930258, 1, 1, 1, 1, 1,
1.006931, 0.31326, 2.075899, 1, 1, 1, 1, 1,
1.012242, -0.3451638, 2.766965, 1, 1, 1, 1, 1,
1.012902, -0.8196863, 3.681288, 0, 0, 1, 1, 1,
1.014622, -0.9295224, 2.353363, 1, 0, 0, 1, 1,
1.016482, -0.990348, 2.816143, 1, 0, 0, 1, 1,
1.031045, -1.226338, 2.744474, 1, 0, 0, 1, 1,
1.04045, 0.405915, -0.2847312, 1, 0, 0, 1, 1,
1.041233, -1.114197, 3.044796, 1, 0, 0, 1, 1,
1.041565, -0.7246678, 2.178483, 0, 0, 0, 1, 1,
1.044205, -0.497161, 0.921979, 0, 0, 0, 1, 1,
1.047536, -0.6676449, 2.193912, 0, 0, 0, 1, 1,
1.050555, -1.643403, 2.323801, 0, 0, 0, 1, 1,
1.052577, -0.3767839, 2.663068, 0, 0, 0, 1, 1,
1.065684, -1.076432, 1.841628, 0, 0, 0, 1, 1,
1.075564, -1.470541, 2.520146, 0, 0, 0, 1, 1,
1.082542, -0.3498475, 1.034153, 1, 1, 1, 1, 1,
1.084955, 0.1320677, 1.968371, 1, 1, 1, 1, 1,
1.093668, 0.2667916, 0.7287318, 1, 1, 1, 1, 1,
1.09405, 0.3037697, 2.449134, 1, 1, 1, 1, 1,
1.095121, -0.4046488, 1.527663, 1, 1, 1, 1, 1,
1.102884, 0.2652548, 0.06078544, 1, 1, 1, 1, 1,
1.105648, -2.304688, 2.294464, 1, 1, 1, 1, 1,
1.106274, -0.07305522, 2.175446, 1, 1, 1, 1, 1,
1.111673, 0.7117788, 0.9929969, 1, 1, 1, 1, 1,
1.116059, -0.3905105, 3.262051, 1, 1, 1, 1, 1,
1.119377, 1.601477, 1.166996, 1, 1, 1, 1, 1,
1.121207, -1.275642, 1.563595, 1, 1, 1, 1, 1,
1.122335, 0.3667582, 1.005037, 1, 1, 1, 1, 1,
1.122942, 0.6681609, 0.8303224, 1, 1, 1, 1, 1,
1.12403, 0.01796107, 1.661372, 1, 1, 1, 1, 1,
1.124663, -0.2172051, 1.789268, 0, 0, 1, 1, 1,
1.128297, 0.758119, 0.2846707, 1, 0, 0, 1, 1,
1.130446, -0.2142118, 0.3334811, 1, 0, 0, 1, 1,
1.132491, -0.2711658, -0.2090174, 1, 0, 0, 1, 1,
1.133506, 0.3307709, -1.156212, 1, 0, 0, 1, 1,
1.138206, -0.004334421, 1.21972, 1, 0, 0, 1, 1,
1.138807, -0.4565411, 3.040536, 0, 0, 0, 1, 1,
1.148263, -0.962629, 0.9850401, 0, 0, 0, 1, 1,
1.154131, 0.5465164, 1.282564, 0, 0, 0, 1, 1,
1.15437, 0.1097191, 0.2673353, 0, 0, 0, 1, 1,
1.162035, -1.953752, 2.259992, 0, 0, 0, 1, 1,
1.162563, 1.501978, 0.3927071, 0, 0, 0, 1, 1,
1.166666, 0.01250779, 1.116813, 0, 0, 0, 1, 1,
1.167714, 0.5849258, 1.333883, 1, 1, 1, 1, 1,
1.172357, -0.3922907, 2.51176, 1, 1, 1, 1, 1,
1.178519, -0.1591882, 0.8744348, 1, 1, 1, 1, 1,
1.180077, 1.188603, 2.454579, 1, 1, 1, 1, 1,
1.188545, -0.6632748, 1.146996, 1, 1, 1, 1, 1,
1.196632, 0.03133143, 0.7238355, 1, 1, 1, 1, 1,
1.199859, -1.065918, 1.997658, 1, 1, 1, 1, 1,
1.201461, 0.5684972, 1.64275, 1, 1, 1, 1, 1,
1.205918, -0.3621935, 2.262514, 1, 1, 1, 1, 1,
1.208898, -0.1101796, 1.442324, 1, 1, 1, 1, 1,
1.22175, -0.6248017, 2.31379, 1, 1, 1, 1, 1,
1.22793, 0.8931683, 1.357649, 1, 1, 1, 1, 1,
1.232432, 1.84344, 1.920869, 1, 1, 1, 1, 1,
1.241297, -1.122725, 2.178365, 1, 1, 1, 1, 1,
1.245226, 0.2726743, 0.493878, 1, 1, 1, 1, 1,
1.259323, -0.4146133, 1.769236, 0, 0, 1, 1, 1,
1.262835, 0.4921449, 1.363934, 1, 0, 0, 1, 1,
1.284666, 0.2351552, 1.637059, 1, 0, 0, 1, 1,
1.290689, -0.00566077, 1.767132, 1, 0, 0, 1, 1,
1.294366, -0.3966811, 1.210244, 1, 0, 0, 1, 1,
1.306867, -0.02811232, 1.196466, 1, 0, 0, 1, 1,
1.310968, -1.022914, 2.680734, 0, 0, 0, 1, 1,
1.312717, 0.0901562, 2.320048, 0, 0, 0, 1, 1,
1.316694, 0.3462684, 1.482633, 0, 0, 0, 1, 1,
1.323038, 0.2322493, -0.9297056, 0, 0, 0, 1, 1,
1.323549, 0.07481138, 0.02295175, 0, 0, 0, 1, 1,
1.323947, -0.2068027, 2.673535, 0, 0, 0, 1, 1,
1.326434, 2.052519, -1.608834, 0, 0, 0, 1, 1,
1.335939, -0.02227778, 1.039814, 1, 1, 1, 1, 1,
1.345425, 1.729976, 0.6569768, 1, 1, 1, 1, 1,
1.347063, 0.826854, -0.6573504, 1, 1, 1, 1, 1,
1.351901, -0.5434511, 2.765302, 1, 1, 1, 1, 1,
1.361562, -1.09626, 0.9721881, 1, 1, 1, 1, 1,
1.375185, -1.808632, 2.558132, 1, 1, 1, 1, 1,
1.38817, 0.8749461, 1.172434, 1, 1, 1, 1, 1,
1.39166, 0.557412, 0.5329525, 1, 1, 1, 1, 1,
1.394578, 0.1773563, 0.8963249, 1, 1, 1, 1, 1,
1.396027, -0.3953715, 2.649447, 1, 1, 1, 1, 1,
1.399804, 0.9332871, 0.6371135, 1, 1, 1, 1, 1,
1.422804, -0.980006, 0.2533171, 1, 1, 1, 1, 1,
1.445424, -0.3824065, 0.5007051, 1, 1, 1, 1, 1,
1.448972, 0.1135341, 2.052819, 1, 1, 1, 1, 1,
1.453541, 0.9994455, 0.1768275, 1, 1, 1, 1, 1,
1.455004, -0.1460764, 1.348593, 0, 0, 1, 1, 1,
1.468919, 0.5146759, 0.9380637, 1, 0, 0, 1, 1,
1.473247, 1.100605, 2.509026, 1, 0, 0, 1, 1,
1.480564, -0.43699, 0.5851752, 1, 0, 0, 1, 1,
1.5149, 0.1991707, 2.79967, 1, 0, 0, 1, 1,
1.5242, -0.5306699, 0.8817695, 1, 0, 0, 1, 1,
1.5246, -1.635634, 2.764752, 0, 0, 0, 1, 1,
1.525561, 0.6443036, -0.4275551, 0, 0, 0, 1, 1,
1.531386, -0.9000731, 0.8165083, 0, 0, 0, 1, 1,
1.533018, 0.3034233, 2.546905, 0, 0, 0, 1, 1,
1.541384, 1.559479, 0.2045848, 0, 0, 0, 1, 1,
1.548938, -0.07220264, 1.430086, 0, 0, 0, 1, 1,
1.551476, 0.01994866, 0.4180001, 0, 0, 0, 1, 1,
1.573485, -2.304695, 2.24603, 1, 1, 1, 1, 1,
1.579437, -0.2100948, 2.4932, 1, 1, 1, 1, 1,
1.580384, 1.113179, -0.7205741, 1, 1, 1, 1, 1,
1.585036, -0.6609203, 3.727206, 1, 1, 1, 1, 1,
1.597577, 0.3607282, 2.54171, 1, 1, 1, 1, 1,
1.604491, 0.1772262, 1.377061, 1, 1, 1, 1, 1,
1.615338, -0.8911087, 1.741117, 1, 1, 1, 1, 1,
1.616904, -1.13532, 2.462055, 1, 1, 1, 1, 1,
1.645391, -0.9910889, 1.984396, 1, 1, 1, 1, 1,
1.69243, 1.493515, 0.9815838, 1, 1, 1, 1, 1,
1.69425, -1.744468, 2.071495, 1, 1, 1, 1, 1,
1.710083, -0.9195966, 1.179695, 1, 1, 1, 1, 1,
1.714872, 0.1558331, 1.696921, 1, 1, 1, 1, 1,
1.715417, 1.091678, 0.7834532, 1, 1, 1, 1, 1,
1.730719, -0.3051721, 1.011847, 1, 1, 1, 1, 1,
1.737667, -0.6341979, 0.196734, 0, 0, 1, 1, 1,
1.738002, 0.9288855, 0.6726194, 1, 0, 0, 1, 1,
1.760623, -1.116, 3.302214, 1, 0, 0, 1, 1,
1.762622, -0.692537, 1.074193, 1, 0, 0, 1, 1,
1.770833, 1.050856, -0.5780863, 1, 0, 0, 1, 1,
1.778068, -0.624989, 1.992992, 1, 0, 0, 1, 1,
1.783462, 0.8626774, 0.7821433, 0, 0, 0, 1, 1,
1.786033, -0.288779, -0.1644683, 0, 0, 0, 1, 1,
1.791511, -1.625796, 1.428728, 0, 0, 0, 1, 1,
1.864045, 1.31246, -0.03030851, 0, 0, 0, 1, 1,
1.865874, -1.634186, 3.291624, 0, 0, 0, 1, 1,
1.867405, -0.004756817, 1.911336, 0, 0, 0, 1, 1,
1.869543, -0.9970853, 4.16837, 0, 0, 0, 1, 1,
1.888269, 0.7702793, 1.455264, 1, 1, 1, 1, 1,
1.902809, -1.361493, 3.160657, 1, 1, 1, 1, 1,
1.905356, -0.1643119, 2.279507, 1, 1, 1, 1, 1,
1.919218, 0.2251052, 2.432039, 1, 1, 1, 1, 1,
1.930928, -1.899428, 0.1969748, 1, 1, 1, 1, 1,
1.946107, 0.8297113, 2.143779, 1, 1, 1, 1, 1,
1.960796, -0.9436487, 2.172446, 1, 1, 1, 1, 1,
1.971335, 0.8577162, -0.3748726, 1, 1, 1, 1, 1,
2.025858, 0.4886748, 2.046029, 1, 1, 1, 1, 1,
2.049022, -0.2962778, -0.6125667, 1, 1, 1, 1, 1,
2.063253, -0.01326374, 1.573271, 1, 1, 1, 1, 1,
2.064541, 0.3555762, 2.637727, 1, 1, 1, 1, 1,
2.069972, -0.4566864, 2.451378, 1, 1, 1, 1, 1,
2.145278, -0.9533654, 1.794852, 1, 1, 1, 1, 1,
2.168545, -0.7337221, 1.620376, 1, 1, 1, 1, 1,
2.170244, 0.01351598, 1.61865, 0, 0, 1, 1, 1,
2.184737, -0.5553999, 2.811846, 1, 0, 0, 1, 1,
2.215391, 1.416788, 1.228106, 1, 0, 0, 1, 1,
2.233218, -0.09712988, 2.382407, 1, 0, 0, 1, 1,
2.234828, -1.254191, -0.08350448, 1, 0, 0, 1, 1,
2.285806, 0.8994535, 1.685342, 1, 0, 0, 1, 1,
2.366521, 0.4205885, 1.127876, 0, 0, 0, 1, 1,
2.460235, -0.5244254, 0.4045446, 0, 0, 0, 1, 1,
2.493919, -0.1438171, 1.970073, 0, 0, 0, 1, 1,
2.508204, -0.02029266, 2.228115, 0, 0, 0, 1, 1,
2.52445, -1.114017, 1.712816, 0, 0, 0, 1, 1,
2.562949, 0.3067084, 0.7042852, 0, 0, 0, 1, 1,
2.580256, -0.4133546, 1.065906, 0, 0, 0, 1, 1,
2.623503, -1.177232, 1.940162, 1, 1, 1, 1, 1,
2.661478, 0.5114102, 0.04949832, 1, 1, 1, 1, 1,
2.707708, 0.6292767, 2.62681, 1, 1, 1, 1, 1,
2.838523, 1.405418, 2.540489, 1, 1, 1, 1, 1,
3.067494, -1.479947, 1.595944, 1, 1, 1, 1, 1,
3.205515, -0.3569755, 1.110539, 1, 1, 1, 1, 1,
4.06711, -0.1169722, 2.513954, 1, 1, 1, 1, 1
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
var radius = 10.19971;
var distance = 35.82605;
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
mvMatrix.translate( -0.4542933, -0.0305016, -0.02256536 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.82605);
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
