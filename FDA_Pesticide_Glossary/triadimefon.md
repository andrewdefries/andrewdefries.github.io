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
-3.325537, -1.278292, -1.404365, 1, 0, 0, 1,
-3.260213, 1.226826, -1.037301, 1, 0.007843138, 0, 1,
-2.717378, -1.068802, -1.090872, 1, 0.01176471, 0, 1,
-2.610438, 0.3500741, -0.2594399, 1, 0.01960784, 0, 1,
-2.453254, 0.6087639, -0.6182925, 1, 0.02352941, 0, 1,
-2.421111, 0.9980494, -2.066168, 1, 0.03137255, 0, 1,
-2.405535, 1.047648, 0.4793219, 1, 0.03529412, 0, 1,
-2.38237, -0.1953161, -1.683831, 1, 0.04313726, 0, 1,
-2.379074, 0.0795368, -2.560323, 1, 0.04705882, 0, 1,
-2.298617, 0.2799362, -3.224854, 1, 0.05490196, 0, 1,
-2.292685, 0.5786273, -2.048554, 1, 0.05882353, 0, 1,
-2.274353, 0.2413965, -0.4238354, 1, 0.06666667, 0, 1,
-2.235854, -0.1137132, -1.409169, 1, 0.07058824, 0, 1,
-2.204539, 0.6577583, -2.02706, 1, 0.07843138, 0, 1,
-2.169225, -1.191949, -1.76152, 1, 0.08235294, 0, 1,
-2.133022, 0.3193652, -0.9449701, 1, 0.09019608, 0, 1,
-2.121509, 2.248399, 0.7681463, 1, 0.09411765, 0, 1,
-2.10373, 1.03049, -1.212934, 1, 0.1019608, 0, 1,
-2.101058, 0.091223, -1.70252, 1, 0.1098039, 0, 1,
-2.072248, 0.5145057, -2.356033, 1, 0.1137255, 0, 1,
-2.066289, 0.9568044, -3.177939, 1, 0.1215686, 0, 1,
-2.063391, 0.7393047, -2.195758, 1, 0.1254902, 0, 1,
-2.028646, 1.124371, -1.130517, 1, 0.1333333, 0, 1,
-2.006775, -0.5689294, -1.94073, 1, 0.1372549, 0, 1,
-2.006167, 0.2897514, -0.2085498, 1, 0.145098, 0, 1,
-1.996299, -2.385556, -3.046266, 1, 0.1490196, 0, 1,
-1.986147, 0.02453798, -2.347868, 1, 0.1568628, 0, 1,
-1.977881, 1.969926, -1.204712, 1, 0.1607843, 0, 1,
-1.958668, 0.3338673, -1.440871, 1, 0.1686275, 0, 1,
-1.95252, -0.6620805, -1.469065, 1, 0.172549, 0, 1,
-1.925295, 2.429363, -2.30753, 1, 0.1803922, 0, 1,
-1.90981, 0.6208922, -0.5152017, 1, 0.1843137, 0, 1,
-1.908737, 1.123894, -0.1733732, 1, 0.1921569, 0, 1,
-1.90274, 0.1697644, -2.709738, 1, 0.1960784, 0, 1,
-1.902221, 1.367256, -0.8771071, 1, 0.2039216, 0, 1,
-1.895524, 0.7651882, 0.385679, 1, 0.2117647, 0, 1,
-1.859782, 1.813397, -1.493538, 1, 0.2156863, 0, 1,
-1.857581, 1.005984, -1.928851, 1, 0.2235294, 0, 1,
-1.855108, 1.46777, -1.305322, 1, 0.227451, 0, 1,
-1.849449, -1.123446, -3.263947, 1, 0.2352941, 0, 1,
-1.84141, 0.5782988, -2.635322, 1, 0.2392157, 0, 1,
-1.840184, 0.5614215, -0.2460098, 1, 0.2470588, 0, 1,
-1.809863, 0.06418899, -2.293286, 1, 0.2509804, 0, 1,
-1.787849, -0.9723198, -1.319254, 1, 0.2588235, 0, 1,
-1.776307, -0.6914371, -1.693624, 1, 0.2627451, 0, 1,
-1.774787, 0.5084777, -1.871078, 1, 0.2705882, 0, 1,
-1.764324, -1.438681, -2.073665, 1, 0.2745098, 0, 1,
-1.761322, 0.6696808, -2.70666, 1, 0.282353, 0, 1,
-1.753764, -0.09028792, -1.435558, 1, 0.2862745, 0, 1,
-1.747756, 2.367293, -0.6686193, 1, 0.2941177, 0, 1,
-1.703279, -0.6677273, -3.729653, 1, 0.3019608, 0, 1,
-1.680792, -0.4810603, -4.815821, 1, 0.3058824, 0, 1,
-1.660928, -1.857196, -1.778773, 1, 0.3137255, 0, 1,
-1.659076, -0.9512791, -2.059649, 1, 0.3176471, 0, 1,
-1.645968, -1.333647, -1.176288, 1, 0.3254902, 0, 1,
-1.641734, -1.149538, -2.577735, 1, 0.3294118, 0, 1,
-1.628286, 1.208416, -1.428413, 1, 0.3372549, 0, 1,
-1.625497, 0.1854965, -0.9388357, 1, 0.3411765, 0, 1,
-1.623382, -1.679234, -2.589456, 1, 0.3490196, 0, 1,
-1.622876, -0.08204073, -2.156082, 1, 0.3529412, 0, 1,
-1.61437, -0.1603991, -1.26327, 1, 0.3607843, 0, 1,
-1.61278, 0.1060515, -2.098837, 1, 0.3647059, 0, 1,
-1.612665, -0.4212372, -0.7975452, 1, 0.372549, 0, 1,
-1.611705, 0.9886109, -1.786645, 1, 0.3764706, 0, 1,
-1.611012, 0.1970264, -0.6909897, 1, 0.3843137, 0, 1,
-1.606831, -0.6243186, -2.365287, 1, 0.3882353, 0, 1,
-1.606595, 1.784424, -0.8144835, 1, 0.3960784, 0, 1,
-1.597997, 0.7717247, -1.291743, 1, 0.4039216, 0, 1,
-1.590495, -0.7604046, -1.383073, 1, 0.4078431, 0, 1,
-1.578213, -0.1743719, -1.624589, 1, 0.4156863, 0, 1,
-1.57707, 1.367724, -0.6334143, 1, 0.4196078, 0, 1,
-1.548149, 1.826617, -1.458548, 1, 0.427451, 0, 1,
-1.546048, -0.5361091, -1.578524, 1, 0.4313726, 0, 1,
-1.538197, -1.104532, -2.59214, 1, 0.4392157, 0, 1,
-1.534579, 1.20692, -0.8338706, 1, 0.4431373, 0, 1,
-1.515158, 0.08849991, -2.40284, 1, 0.4509804, 0, 1,
-1.490316, 0.5531483, -2.021629, 1, 0.454902, 0, 1,
-1.481156, 0.1812193, -0.8530285, 1, 0.4627451, 0, 1,
-1.474741, 0.9130601, -0.354542, 1, 0.4666667, 0, 1,
-1.439136, 1.127374, -1.586702, 1, 0.4745098, 0, 1,
-1.437104, -0.1879547, 1.534738, 1, 0.4784314, 0, 1,
-1.431847, 0.6677682, -0.1352302, 1, 0.4862745, 0, 1,
-1.420987, -0.5132326, -2.546006, 1, 0.4901961, 0, 1,
-1.413647, -0.5069717, -1.383429, 1, 0.4980392, 0, 1,
-1.410651, 0.6049231, -2.659442, 1, 0.5058824, 0, 1,
-1.408273, 0.4068136, -3.058931, 1, 0.509804, 0, 1,
-1.391295, 0.359622, -1.053503, 1, 0.5176471, 0, 1,
-1.387735, -0.2454531, -1.557955, 1, 0.5215687, 0, 1,
-1.38673, 0.3503326, 0.1333702, 1, 0.5294118, 0, 1,
-1.386204, -0.1154974, -2.556596, 1, 0.5333334, 0, 1,
-1.380702, -0.4079478, -1.36345, 1, 0.5411765, 0, 1,
-1.35866, -0.2653227, -0.8325232, 1, 0.5450981, 0, 1,
-1.345984, -0.3000678, -1.442673, 1, 0.5529412, 0, 1,
-1.345864, -1.442669, -3.966622, 1, 0.5568628, 0, 1,
-1.34181, -0.6457006, -2.806901, 1, 0.5647059, 0, 1,
-1.325738, 0.6008587, -1.254336, 1, 0.5686275, 0, 1,
-1.322074, -1.246354, -3.079806, 1, 0.5764706, 0, 1,
-1.311027, -1.322142, -1.773623, 1, 0.5803922, 0, 1,
-1.304069, 0.01790235, -0.05241338, 1, 0.5882353, 0, 1,
-1.294695, -0.6112933, -0.8232172, 1, 0.5921569, 0, 1,
-1.28156, 0.9450257, -1.218533, 1, 0.6, 0, 1,
-1.27707, -1.97529, -3.063507, 1, 0.6078432, 0, 1,
-1.26803, 0.099095, -0.9218195, 1, 0.6117647, 0, 1,
-1.263677, 0.5784658, -0.3704022, 1, 0.6196079, 0, 1,
-1.257684, 1.384295, -0.7743188, 1, 0.6235294, 0, 1,
-1.257247, 0.2609839, -0.8524818, 1, 0.6313726, 0, 1,
-1.255234, -0.3950198, -3.787819, 1, 0.6352941, 0, 1,
-1.255097, -0.4435296, -2.716163, 1, 0.6431373, 0, 1,
-1.252929, 1.976587, -0.7089396, 1, 0.6470588, 0, 1,
-1.252483, 0.02976184, -1.334954, 1, 0.654902, 0, 1,
-1.247629, 0.3689168, -2.894344, 1, 0.6588235, 0, 1,
-1.240255, -0.4807656, -2.30177, 1, 0.6666667, 0, 1,
-1.232765, 1.419665, -2.601125, 1, 0.6705883, 0, 1,
-1.229074, 1.307109, -1.678206, 1, 0.6784314, 0, 1,
-1.22531, 0.5769826, -4.107643, 1, 0.682353, 0, 1,
-1.224002, -0.90213, -2.34424, 1, 0.6901961, 0, 1,
-1.218706, -0.5910909, -0.6005334, 1, 0.6941177, 0, 1,
-1.214119, -1.559645, -1.851016, 1, 0.7019608, 0, 1,
-1.202829, -0.3845877, -1.564986, 1, 0.7098039, 0, 1,
-1.199804, -0.4082542, -2.327913, 1, 0.7137255, 0, 1,
-1.193359, -0.420812, -1.961908, 1, 0.7215686, 0, 1,
-1.18224, -0.8009993, -3.12512, 1, 0.7254902, 0, 1,
-1.182238, -0.5327036, -2.998296, 1, 0.7333333, 0, 1,
-1.181054, 1.777141, -1.194768, 1, 0.7372549, 0, 1,
-1.180962, -0.03903738, -1.242173, 1, 0.7450981, 0, 1,
-1.171176, -2.151756, -3.453375, 1, 0.7490196, 0, 1,
-1.170496, -0.3465247, -0.8197811, 1, 0.7568628, 0, 1,
-1.159235, -1.051095, -2.322986, 1, 0.7607843, 0, 1,
-1.148133, -1.179209, -0.6421751, 1, 0.7686275, 0, 1,
-1.14463, 0.5443852, -0.4768053, 1, 0.772549, 0, 1,
-1.140486, -0.5041682, -2.208074, 1, 0.7803922, 0, 1,
-1.140285, -0.1688183, -3.02989, 1, 0.7843137, 0, 1,
-1.138131, 0.5523192, -2.187812, 1, 0.7921569, 0, 1,
-1.131207, -0.3585325, -3.391155, 1, 0.7960784, 0, 1,
-1.130898, 0.8152578, 0.4317222, 1, 0.8039216, 0, 1,
-1.1302, -0.02401308, -1.470151, 1, 0.8117647, 0, 1,
-1.128183, -0.3489279, -1.80462, 1, 0.8156863, 0, 1,
-1.126301, -0.3671264, 0.3783837, 1, 0.8235294, 0, 1,
-1.12578, 1.146424, -0.0660558, 1, 0.827451, 0, 1,
-1.121476, 0.6635993, 0.1082444, 1, 0.8352941, 0, 1,
-1.117122, 1.004651, 0.5740454, 1, 0.8392157, 0, 1,
-1.116297, -0.2997259, -2.082279, 1, 0.8470588, 0, 1,
-1.111933, 1.299015, -0.3868217, 1, 0.8509804, 0, 1,
-1.108764, 0.6252777, -1.760494, 1, 0.8588235, 0, 1,
-1.093484, -0.2998717, -2.019871, 1, 0.8627451, 0, 1,
-1.09334, 1.221611, -0.2341914, 1, 0.8705882, 0, 1,
-1.092224, 0.7228094, -0.08834858, 1, 0.8745098, 0, 1,
-1.090737, -0.2002501, -1.594809, 1, 0.8823529, 0, 1,
-1.083687, -0.8876891, -0.1042857, 1, 0.8862745, 0, 1,
-1.075542, 0.4020781, -1.191812, 1, 0.8941177, 0, 1,
-1.072814, -0.8933634, -2.338954, 1, 0.8980392, 0, 1,
-1.055837, -0.3482185, -2.626081, 1, 0.9058824, 0, 1,
-1.054407, 0.8115313, -0.02694507, 1, 0.9137255, 0, 1,
-1.051276, -1.246574, -2.748864, 1, 0.9176471, 0, 1,
-1.04859, 1.717159, -1.434129, 1, 0.9254902, 0, 1,
-1.041064, 1.164997, -0.1629183, 1, 0.9294118, 0, 1,
-1.038868, 0.5415029, -2.521965, 1, 0.9372549, 0, 1,
-1.035397, -1.500764, -3.146591, 1, 0.9411765, 0, 1,
-1.032881, 3.238699, -0.511621, 1, 0.9490196, 0, 1,
-1.031315, -0.3772085, -1.989377, 1, 0.9529412, 0, 1,
-1.012572, -2.620533, -1.922398, 1, 0.9607843, 0, 1,
-1.010264, 0.6449887, -0.9421511, 1, 0.9647059, 0, 1,
-1.0022, -1.871333, -1.388399, 1, 0.972549, 0, 1,
-1.001279, 0.04281222, -1.383347, 1, 0.9764706, 0, 1,
-0.9989751, 2.067773, -1.255908, 1, 0.9843137, 0, 1,
-0.9920014, -0.5595123, -1.047688, 1, 0.9882353, 0, 1,
-0.9870699, -0.299611, -3.306883, 1, 0.9960784, 0, 1,
-0.9807618, 0.6671444, -2.242751, 0.9960784, 1, 0, 1,
-0.9791996, 1.353305, 0.5497908, 0.9921569, 1, 0, 1,
-0.978546, -0.1698645, -1.042231, 0.9843137, 1, 0, 1,
-0.9785071, 1.627349, 1.891662, 0.9803922, 1, 0, 1,
-0.9728026, -0.3416294, -2.790134, 0.972549, 1, 0, 1,
-0.9650226, 1.207529, 0.07749917, 0.9686275, 1, 0, 1,
-0.9641273, -1.82462, -3.118987, 0.9607843, 1, 0, 1,
-0.9581836, 1.417366, -1.219954, 0.9568627, 1, 0, 1,
-0.9520417, 1.623989, -0.8712, 0.9490196, 1, 0, 1,
-0.9503239, -0.6310289, -3.696605, 0.945098, 1, 0, 1,
-0.9501007, 1.805142, -1.295542, 0.9372549, 1, 0, 1,
-0.9496607, 0.2647623, 0.1760369, 0.9333333, 1, 0, 1,
-0.9492373, 0.633222, -1.622778, 0.9254902, 1, 0, 1,
-0.94175, -1.166655, -4.382179, 0.9215686, 1, 0, 1,
-0.9335182, 0.6624396, -1.529536, 0.9137255, 1, 0, 1,
-0.9318622, 0.6610015, -1.591092, 0.9098039, 1, 0, 1,
-0.9283661, -0.5847728, -1.952173, 0.9019608, 1, 0, 1,
-0.9275287, -0.4801373, -2.202994, 0.8941177, 1, 0, 1,
-0.9269114, -0.1954588, -1.651788, 0.8901961, 1, 0, 1,
-0.9258227, -0.4407819, -1.848098, 0.8823529, 1, 0, 1,
-0.9239973, 0.6435066, -3.312243, 0.8784314, 1, 0, 1,
-0.923638, -1.637027, -3.597856, 0.8705882, 1, 0, 1,
-0.9217532, -1.139173, -1.349952, 0.8666667, 1, 0, 1,
-0.9210069, -1.084254, -3.377324, 0.8588235, 1, 0, 1,
-0.9173852, 0.03346529, 0.6615633, 0.854902, 1, 0, 1,
-0.9146747, -0.04136105, -3.818212, 0.8470588, 1, 0, 1,
-0.9097677, -0.4216627, -1.638906, 0.8431373, 1, 0, 1,
-0.9096108, -2.033092, -1.719156, 0.8352941, 1, 0, 1,
-0.900339, 1.339586, -1.065262, 0.8313726, 1, 0, 1,
-0.9001785, 0.949742, -1.132783, 0.8235294, 1, 0, 1,
-0.8946496, -0.3163893, -1.408035, 0.8196079, 1, 0, 1,
-0.8943172, -0.2952565, -1.500234, 0.8117647, 1, 0, 1,
-0.8914834, -0.8433651, -3.456879, 0.8078431, 1, 0, 1,
-0.8827224, 0.7768373, -2.126835, 0.8, 1, 0, 1,
-0.8819239, -1.075358, -2.860106, 0.7921569, 1, 0, 1,
-0.8751706, 0.4788848, -0.4561091, 0.7882353, 1, 0, 1,
-0.8739511, 0.1243418, 0.5336082, 0.7803922, 1, 0, 1,
-0.8679522, 0.2055767, 0.04319029, 0.7764706, 1, 0, 1,
-0.8654316, -0.30536, -0.6080285, 0.7686275, 1, 0, 1,
-0.8587022, -0.4307876, -2.225231, 0.7647059, 1, 0, 1,
-0.8518338, -0.8348936, -2.337435, 0.7568628, 1, 0, 1,
-0.8430353, -0.5513583, -0.7167217, 0.7529412, 1, 0, 1,
-0.8406702, -1.702606, -3.777297, 0.7450981, 1, 0, 1,
-0.8390668, -0.3982123, -2.303149, 0.7411765, 1, 0, 1,
-0.8382465, -0.9726769, -2.872422, 0.7333333, 1, 0, 1,
-0.8298344, 1.053945, -1.340358, 0.7294118, 1, 0, 1,
-0.8275063, 0.1819934, 0.9041671, 0.7215686, 1, 0, 1,
-0.8269709, 0.511093, -1.497829, 0.7176471, 1, 0, 1,
-0.8238949, 1.077836, -0.5529751, 0.7098039, 1, 0, 1,
-0.8232919, 0.02108915, -1.172382, 0.7058824, 1, 0, 1,
-0.8138589, -0.6118882, -1.414362, 0.6980392, 1, 0, 1,
-0.8063412, 1.315382, -0.9085687, 0.6901961, 1, 0, 1,
-0.8026271, -0.06967121, 0.04304795, 0.6862745, 1, 0, 1,
-0.8013333, -0.1936432, -1.952028, 0.6784314, 1, 0, 1,
-0.7983075, -0.4078974, -3.639705, 0.6745098, 1, 0, 1,
-0.7980326, 0.5181713, -0.6426595, 0.6666667, 1, 0, 1,
-0.7978181, -1.688074, -2.642993, 0.6627451, 1, 0, 1,
-0.7962133, -0.3377013, -1.580394, 0.654902, 1, 0, 1,
-0.7937917, -0.4808981, -2.325609, 0.6509804, 1, 0, 1,
-0.7914463, -0.2484286, -0.9487743, 0.6431373, 1, 0, 1,
-0.7884994, -0.3296414, -1.746949, 0.6392157, 1, 0, 1,
-0.7786152, 0.1282488, -1.156032, 0.6313726, 1, 0, 1,
-0.7782951, -1.193735, -2.107892, 0.627451, 1, 0, 1,
-0.775847, -2.039157, -3.960989, 0.6196079, 1, 0, 1,
-0.77254, -0.127601, -0.7522472, 0.6156863, 1, 0, 1,
-0.7699636, 1.659275, 1.007446, 0.6078432, 1, 0, 1,
-0.7697686, 0.4845924, -1.672416, 0.6039216, 1, 0, 1,
-0.7694862, 0.09852674, -2.859485, 0.5960785, 1, 0, 1,
-0.7653305, -0.05050838, 0.5140023, 0.5882353, 1, 0, 1,
-0.7607642, -0.07883465, -0.3610449, 0.5843138, 1, 0, 1,
-0.7560916, -0.003807804, -2.031497, 0.5764706, 1, 0, 1,
-0.7560887, -0.008966041, -1.113804, 0.572549, 1, 0, 1,
-0.7473902, 0.2841797, -0.6430457, 0.5647059, 1, 0, 1,
-0.7469835, -0.1133238, -1.045307, 0.5607843, 1, 0, 1,
-0.7416728, 1.340103, 0.3418856, 0.5529412, 1, 0, 1,
-0.7389869, -1.027362, -3.407366, 0.5490196, 1, 0, 1,
-0.7354445, -0.06552617, -1.75696, 0.5411765, 1, 0, 1,
-0.7333236, 1.966611, -0.8162383, 0.5372549, 1, 0, 1,
-0.7324305, -0.1572722, -2.856475, 0.5294118, 1, 0, 1,
-0.7246215, -0.2917404, -3.544789, 0.5254902, 1, 0, 1,
-0.7224247, -1.647075, -2.647966, 0.5176471, 1, 0, 1,
-0.7218963, 0.5134718, -1.184543, 0.5137255, 1, 0, 1,
-0.7185022, 0.2836996, -3.328721, 0.5058824, 1, 0, 1,
-0.7182856, 1.141828, 0.3783546, 0.5019608, 1, 0, 1,
-0.7179407, 0.3455882, -2.991363, 0.4941176, 1, 0, 1,
-0.7164177, -0.6907178, -2.629586, 0.4862745, 1, 0, 1,
-0.7047869, -0.4313288, -1.22088, 0.4823529, 1, 0, 1,
-0.7032392, -0.6099713, -2.868509, 0.4745098, 1, 0, 1,
-0.6988704, 0.9094095, -0.5291548, 0.4705882, 1, 0, 1,
-0.697362, -0.5087556, -2.204556, 0.4627451, 1, 0, 1,
-0.6967949, -1.343701, -3.659142, 0.4588235, 1, 0, 1,
-0.6954292, 1.972699, -1.774426, 0.4509804, 1, 0, 1,
-0.6946494, -1.003043, 0.3759547, 0.4470588, 1, 0, 1,
-0.6864137, -0.7582915, -2.852682, 0.4392157, 1, 0, 1,
-0.6863575, 1.302167, -0.5171972, 0.4352941, 1, 0, 1,
-0.6862842, 0.3331824, -2.06786, 0.427451, 1, 0, 1,
-0.683579, 0.617864, -0.6252754, 0.4235294, 1, 0, 1,
-0.673355, 0.4301707, -1.549012, 0.4156863, 1, 0, 1,
-0.6632514, 0.4717314, -2.087758, 0.4117647, 1, 0, 1,
-0.6590182, -0.4077598, -1.761331, 0.4039216, 1, 0, 1,
-0.6581708, -1.211857, -1.475492, 0.3960784, 1, 0, 1,
-0.6580436, 0.09366901, -2.39212, 0.3921569, 1, 0, 1,
-0.6560722, -0.6030921, -2.44994, 0.3843137, 1, 0, 1,
-0.6556674, 0.16432, -1.309129, 0.3803922, 1, 0, 1,
-0.6507747, 1.816451, -1.190439, 0.372549, 1, 0, 1,
-0.6502748, -0.3970021, -2.895885, 0.3686275, 1, 0, 1,
-0.6472018, 1.526859, -1.663112, 0.3607843, 1, 0, 1,
-0.6397665, 1.370412, 0.5833529, 0.3568628, 1, 0, 1,
-0.6397414, 1.975884, -0.624723, 0.3490196, 1, 0, 1,
-0.6334421, -0.1938892, -1.14339, 0.345098, 1, 0, 1,
-0.6313469, 0.7664996, -1.235138, 0.3372549, 1, 0, 1,
-0.6301119, 0.7311013, -0.6797476, 0.3333333, 1, 0, 1,
-0.6294448, 1.167842, -2.227122, 0.3254902, 1, 0, 1,
-0.6289764, 0.6974463, -0.3005794, 0.3215686, 1, 0, 1,
-0.6224077, 0.002656921, -2.184196, 0.3137255, 1, 0, 1,
-0.6138902, -0.03813109, -3.004852, 0.3098039, 1, 0, 1,
-0.6136364, 0.746607, -0.8797511, 0.3019608, 1, 0, 1,
-0.6134424, 1.768533, -1.373389, 0.2941177, 1, 0, 1,
-0.6125889, -0.1646078, -0.3349181, 0.2901961, 1, 0, 1,
-0.6124818, -0.5230389, -3.978674, 0.282353, 1, 0, 1,
-0.6101307, 1.038983, -0.3131086, 0.2784314, 1, 0, 1,
-0.6097524, 1.120289, -2.122733, 0.2705882, 1, 0, 1,
-0.6093803, -0.7407948, -1.534738, 0.2666667, 1, 0, 1,
-0.6077875, -1.382188, -1.031047, 0.2588235, 1, 0, 1,
-0.6035936, -0.4741344, -3.12041, 0.254902, 1, 0, 1,
-0.6026183, 0.1365507, -0.4818276, 0.2470588, 1, 0, 1,
-0.5971072, -0.3935047, -1.444977, 0.2431373, 1, 0, 1,
-0.5970163, 1.240915, -0.3982271, 0.2352941, 1, 0, 1,
-0.59439, -3.119905, -2.444034, 0.2313726, 1, 0, 1,
-0.5904475, 1.950206, -1.2055, 0.2235294, 1, 0, 1,
-0.5837771, 1.659493, 1.238786, 0.2196078, 1, 0, 1,
-0.5799, -0.7689551, -0.1420757, 0.2117647, 1, 0, 1,
-0.5798431, 0.3524097, -0.006944405, 0.2078431, 1, 0, 1,
-0.5717498, -1.994135, -2.513973, 0.2, 1, 0, 1,
-0.5686784, -0.126559, -1.535058, 0.1921569, 1, 0, 1,
-0.5683299, -2.714015, -3.86999, 0.1882353, 1, 0, 1,
-0.5669388, 1.133169, -0.01686967, 0.1803922, 1, 0, 1,
-0.5651882, -2.107369, -3.066977, 0.1764706, 1, 0, 1,
-0.5643786, 0.3020551, 1.104392, 0.1686275, 1, 0, 1,
-0.5641748, 0.2322906, -1.262456, 0.1647059, 1, 0, 1,
-0.5635124, 0.6587511, 0.4220836, 0.1568628, 1, 0, 1,
-0.5577663, -0.2032796, -2.539426, 0.1529412, 1, 0, 1,
-0.553808, 0.380122, 0.2494169, 0.145098, 1, 0, 1,
-0.5397462, -2.143758, -2.513498, 0.1411765, 1, 0, 1,
-0.5381801, -1.240384, -3.549129, 0.1333333, 1, 0, 1,
-0.537811, 1.040972, -0.8254189, 0.1294118, 1, 0, 1,
-0.5377867, 1.120607, 1.227714, 0.1215686, 1, 0, 1,
-0.5317063, -0.5628763, -3.160383, 0.1176471, 1, 0, 1,
-0.5316573, 0.06308694, 0.159456, 0.1098039, 1, 0, 1,
-0.5254961, -0.06813996, 0.2486088, 0.1058824, 1, 0, 1,
-0.5237424, 0.5950819, -0.6257455, 0.09803922, 1, 0, 1,
-0.5227185, -0.445593, -0.5552925, 0.09019608, 1, 0, 1,
-0.519708, 0.7592981, -1.249428, 0.08627451, 1, 0, 1,
-0.5196272, 2.408605, 0.1679292, 0.07843138, 1, 0, 1,
-0.5117941, -0.09950335, -2.205184, 0.07450981, 1, 0, 1,
-0.5089413, -0.8155187, -2.580082, 0.06666667, 1, 0, 1,
-0.5043681, -1.287329, -2.169099, 0.0627451, 1, 0, 1,
-0.5009087, 0.1162237, 0.6046029, 0.05490196, 1, 0, 1,
-0.4983894, -0.1330932, -2.113798, 0.05098039, 1, 0, 1,
-0.4915501, -1.110395, -2.268795, 0.04313726, 1, 0, 1,
-0.4880945, 1.658284, -0.9034947, 0.03921569, 1, 0, 1,
-0.4815283, -0.185669, -0.8545239, 0.03137255, 1, 0, 1,
-0.4745489, 1.92768, 1.052857, 0.02745098, 1, 0, 1,
-0.4712645, -1.667633, -2.225914, 0.01960784, 1, 0, 1,
-0.4671974, 0.161269, -2.350055, 0.01568628, 1, 0, 1,
-0.4659291, -0.2716241, -0.4366097, 0.007843138, 1, 0, 1,
-0.4638918, 0.2575893, -2.591071, 0.003921569, 1, 0, 1,
-0.4553598, -1.792506, -3.319705, 0, 1, 0.003921569, 1,
-0.4498185, -0.6484884, -2.994081, 0, 1, 0.01176471, 1,
-0.4493099, -1.240127, -4.403585, 0, 1, 0.01568628, 1,
-0.4448565, 2.043841, 0.3832679, 0, 1, 0.02352941, 1,
-0.4407965, 1.920923, -0.1746496, 0, 1, 0.02745098, 1,
-0.4370489, 0.639027, -0.9922737, 0, 1, 0.03529412, 1,
-0.4365301, 0.3751405, -0.5877784, 0, 1, 0.03921569, 1,
-0.4346078, -2.682814, -0.1986127, 0, 1, 0.04705882, 1,
-0.4333749, 0.1986766, -2.198405, 0, 1, 0.05098039, 1,
-0.4304549, -1.528378, -4.685965, 0, 1, 0.05882353, 1,
-0.4290351, 0.2954128, 0.5696137, 0, 1, 0.0627451, 1,
-0.4271688, -0.03679768, -1.984368, 0, 1, 0.07058824, 1,
-0.4249444, -0.04319175, -1.778469, 0, 1, 0.07450981, 1,
-0.4190091, -0.5706758, -2.763299, 0, 1, 0.08235294, 1,
-0.4175355, 0.4675038, -1.531251, 0, 1, 0.08627451, 1,
-0.415931, -1.566731, -2.523323, 0, 1, 0.09411765, 1,
-0.4038337, 2.054539, -0.7800412, 0, 1, 0.1019608, 1,
-0.4034979, -0.5624333, -3.718368, 0, 1, 0.1058824, 1,
-0.4014358, -0.4260387, -2.757812, 0, 1, 0.1137255, 1,
-0.3995236, -0.3441823, -2.568408, 0, 1, 0.1176471, 1,
-0.3985519, -0.01654544, -1.854037, 0, 1, 0.1254902, 1,
-0.3951218, 1.219178, -0.5594809, 0, 1, 0.1294118, 1,
-0.3843778, 0.7984533, 0.497608, 0, 1, 0.1372549, 1,
-0.3791932, 0.4301244, -1.549297, 0, 1, 0.1411765, 1,
-0.3779396, 0.4299771, -0.889871, 0, 1, 0.1490196, 1,
-0.3770595, -1.514558, -3.676458, 0, 1, 0.1529412, 1,
-0.3723154, -1.628849, -1.373237, 0, 1, 0.1607843, 1,
-0.3698845, 0.9664328, -1.350629, 0, 1, 0.1647059, 1,
-0.3663142, 0.3741566, -0.6349471, 0, 1, 0.172549, 1,
-0.3613367, 0.01378163, -1.938299, 0, 1, 0.1764706, 1,
-0.3538868, -0.1721145, -2.178123, 0, 1, 0.1843137, 1,
-0.3538256, -0.9152222, -2.005664, 0, 1, 0.1882353, 1,
-0.3537275, -1.310688, -1.90562, 0, 1, 0.1960784, 1,
-0.3478522, -1.177492, -2.084283, 0, 1, 0.2039216, 1,
-0.3381447, 0.257489, -0.2417723, 0, 1, 0.2078431, 1,
-0.3314523, 0.7487022, -1.560603, 0, 1, 0.2156863, 1,
-0.3268554, -0.8391573, -2.906693, 0, 1, 0.2196078, 1,
-0.3248949, 1.866026, 0.2650386, 0, 1, 0.227451, 1,
-0.3240051, 1.186515, 0.2428476, 0, 1, 0.2313726, 1,
-0.3195011, 0.5357113, 0.5728384, 0, 1, 0.2392157, 1,
-0.3168081, 0.4619347, 0.3792995, 0, 1, 0.2431373, 1,
-0.3109423, 0.07146616, -1.691974, 0, 1, 0.2509804, 1,
-0.3091703, 0.8576924, -1.920449, 0, 1, 0.254902, 1,
-0.304478, -0.8115795, -1.900862, 0, 1, 0.2627451, 1,
-0.303733, -0.1939076, -1.06422, 0, 1, 0.2666667, 1,
-0.2978038, 0.2083184, -1.1701, 0, 1, 0.2745098, 1,
-0.292367, 2.832154, 0.4852475, 0, 1, 0.2784314, 1,
-0.2902298, 1.531923, -0.2356399, 0, 1, 0.2862745, 1,
-0.289478, -0.366827, -1.862048, 0, 1, 0.2901961, 1,
-0.2880325, -2.099787, -3.0517, 0, 1, 0.2980392, 1,
-0.2872039, -1.226481, -5.526677, 0, 1, 0.3058824, 1,
-0.284901, -1.556738, -3.630507, 0, 1, 0.3098039, 1,
-0.2793294, -1.641922, -1.826197, 0, 1, 0.3176471, 1,
-0.2776996, -0.8400511, -1.631557, 0, 1, 0.3215686, 1,
-0.2764908, -1.296068, -1.707572, 0, 1, 0.3294118, 1,
-0.2725354, -0.3207905, -2.702914, 0, 1, 0.3333333, 1,
-0.2714682, 0.359812, 0.7369403, 0, 1, 0.3411765, 1,
-0.2665234, -0.09900997, -1.532191, 0, 1, 0.345098, 1,
-0.2654064, -1.463339, -2.221708, 0, 1, 0.3529412, 1,
-0.2650191, -0.6123658, -0.9062157, 0, 1, 0.3568628, 1,
-0.2594638, -0.1299446, -2.863127, 0, 1, 0.3647059, 1,
-0.2572941, -2.412556, -3.471863, 0, 1, 0.3686275, 1,
-0.2546103, 0.1000742, -0.5158894, 0, 1, 0.3764706, 1,
-0.2540596, -2.558934, -3.558412, 0, 1, 0.3803922, 1,
-0.2528511, 0.5504467, -0.1354185, 0, 1, 0.3882353, 1,
-0.2522696, -0.4731476, -3.684832, 0, 1, 0.3921569, 1,
-0.2495594, 0.68514, -0.7641852, 0, 1, 0.4, 1,
-0.2472549, 0.950601, 0.05990465, 0, 1, 0.4078431, 1,
-0.247016, 0.6765975, 1.269536, 0, 1, 0.4117647, 1,
-0.2464768, 0.2409068, -0.7547693, 0, 1, 0.4196078, 1,
-0.2446876, 0.1690081, -1.941338, 0, 1, 0.4235294, 1,
-0.2429448, 0.7958264, 0.8420656, 0, 1, 0.4313726, 1,
-0.2424846, 0.002548592, -1.546293, 0, 1, 0.4352941, 1,
-0.2421797, 0.5148959, 1.738073, 0, 1, 0.4431373, 1,
-0.2395156, -0.6138741, -2.544517, 0, 1, 0.4470588, 1,
-0.2386828, -2.114451, -2.213505, 0, 1, 0.454902, 1,
-0.2330711, 1.52485, -2.661567, 0, 1, 0.4588235, 1,
-0.2258879, 2.159562, -0.525835, 0, 1, 0.4666667, 1,
-0.2205361, -0.5425352, -3.015098, 0, 1, 0.4705882, 1,
-0.2188238, 1.370189, -2.781713, 0, 1, 0.4784314, 1,
-0.2169754, 0.6380743, 1.081088, 0, 1, 0.4823529, 1,
-0.2162392, -0.03883973, -4.092483, 0, 1, 0.4901961, 1,
-0.2127504, 1.336079, -2.136428, 0, 1, 0.4941176, 1,
-0.2114472, 0.03236993, -1.108129, 0, 1, 0.5019608, 1,
-0.2072237, 0.7968852, -0.01522925, 0, 1, 0.509804, 1,
-0.2059705, 1.713184, 0.8283795, 0, 1, 0.5137255, 1,
-0.2042121, 0.4281583, -1.152511, 0, 1, 0.5215687, 1,
-0.1984058, -0.2236608, -2.836516, 0, 1, 0.5254902, 1,
-0.1900028, -1.226686, -4.500717, 0, 1, 0.5333334, 1,
-0.1885233, 1.623915, -0.2561705, 0, 1, 0.5372549, 1,
-0.1881408, 0.5961709, -0.1295293, 0, 1, 0.5450981, 1,
-0.1880258, 0.6748046, 0.03773432, 0, 1, 0.5490196, 1,
-0.1877108, 0.2549541, -3.176647, 0, 1, 0.5568628, 1,
-0.1819988, 1.126667, -0.6846721, 0, 1, 0.5607843, 1,
-0.180654, -0.05166616, -2.058544, 0, 1, 0.5686275, 1,
-0.1783526, 1.191612, 0.5923697, 0, 1, 0.572549, 1,
-0.1747591, -0.9988233, -3.120768, 0, 1, 0.5803922, 1,
-0.1706594, -0.4523954, -2.43073, 0, 1, 0.5843138, 1,
-0.1678389, -0.1219442, -0.6456347, 0, 1, 0.5921569, 1,
-0.1673112, 0.3493384, -0.1261605, 0, 1, 0.5960785, 1,
-0.1643878, -0.06842979, -0.4569227, 0, 1, 0.6039216, 1,
-0.1641209, -0.4940385, -1.95949, 0, 1, 0.6117647, 1,
-0.1599106, -0.7251372, -2.270624, 0, 1, 0.6156863, 1,
-0.1554624, 0.9905263, 1.756307, 0, 1, 0.6235294, 1,
-0.1530193, 1.608183, -0.09417777, 0, 1, 0.627451, 1,
-0.152689, 0.5322744, 0.1235079, 0, 1, 0.6352941, 1,
-0.1488884, -0.7032226, -1.510517, 0, 1, 0.6392157, 1,
-0.1463078, 2.140043, -0.3224958, 0, 1, 0.6470588, 1,
-0.1455733, 1.376027, -0.7211376, 0, 1, 0.6509804, 1,
-0.1444817, 1.007494, -0.4667973, 0, 1, 0.6588235, 1,
-0.1443662, 0.5780379, -0.9330869, 0, 1, 0.6627451, 1,
-0.1395676, 1.802832, -2.188307, 0, 1, 0.6705883, 1,
-0.1382514, -0.4088696, -2.217193, 0, 1, 0.6745098, 1,
-0.1355171, 0.5768979, -0.2208459, 0, 1, 0.682353, 1,
-0.1341568, 1.893203, -1.893972, 0, 1, 0.6862745, 1,
-0.1291949, -1.385914, -2.466593, 0, 1, 0.6941177, 1,
-0.1286573, 0.8222244, -0.8487131, 0, 1, 0.7019608, 1,
-0.1275632, 1.038881, -1.160327, 0, 1, 0.7058824, 1,
-0.1250783, -0.3562683, -3.472781, 0, 1, 0.7137255, 1,
-0.122061, 0.3101547, -0.4937813, 0, 1, 0.7176471, 1,
-0.1208097, -0.4730099, -2.671927, 0, 1, 0.7254902, 1,
-0.1207465, 0.0296535, 2.039426, 0, 1, 0.7294118, 1,
-0.1184844, -0.5025227, -0.9905193, 0, 1, 0.7372549, 1,
-0.1183288, -0.2555616, -1.660144, 0, 1, 0.7411765, 1,
-0.1170074, -1.853229, -3.262708, 0, 1, 0.7490196, 1,
-0.1137115, 0.0209542, 0.1791951, 0, 1, 0.7529412, 1,
-0.112332, -1.768883, -4.880541, 0, 1, 0.7607843, 1,
-0.1104573, 0.4621069, -0.9751191, 0, 1, 0.7647059, 1,
-0.1102601, -1.015275, -0.9754322, 0, 1, 0.772549, 1,
-0.1102031, -0.5263654, -3.070484, 0, 1, 0.7764706, 1,
-0.107405, -0.832608, -2.61497, 0, 1, 0.7843137, 1,
-0.1051593, 0.642562, -1.28721, 0, 1, 0.7882353, 1,
-0.1015401, -0.1793161, -2.086642, 0, 1, 0.7960784, 1,
-0.100175, -2.163749, -4.425522, 0, 1, 0.8039216, 1,
-0.09995567, -0.5348338, -1.988105, 0, 1, 0.8078431, 1,
-0.09950064, 0.3675689, -0.8884479, 0, 1, 0.8156863, 1,
-0.09783983, 1.131222, -1.208025, 0, 1, 0.8196079, 1,
-0.09616917, -0.4926948, -4.753422, 0, 1, 0.827451, 1,
-0.09486806, -1.54029, -2.928181, 0, 1, 0.8313726, 1,
-0.09466299, -0.6479982, -3.880092, 0, 1, 0.8392157, 1,
-0.09435286, 0.8216072, -1.037148, 0, 1, 0.8431373, 1,
-0.09293097, -0.5461068, -4.197776, 0, 1, 0.8509804, 1,
-0.0914811, -0.4753738, -3.040318, 0, 1, 0.854902, 1,
-0.08866904, -1.060083, -3.045499, 0, 1, 0.8627451, 1,
-0.08824275, 0.1806061, -0.6000956, 0, 1, 0.8666667, 1,
-0.08720428, -0.08965264, -2.639648, 0, 1, 0.8745098, 1,
-0.08669277, -1.620175, -2.970368, 0, 1, 0.8784314, 1,
-0.08658905, -0.05485058, -2.351417, 0, 1, 0.8862745, 1,
-0.08603452, 0.9923555, -0.07127189, 0, 1, 0.8901961, 1,
-0.08553662, 0.2190275, -1.092004, 0, 1, 0.8980392, 1,
-0.08398975, 1.39368, -0.8805963, 0, 1, 0.9058824, 1,
-0.08331014, -0.6976315, -4.590201, 0, 1, 0.9098039, 1,
-0.07315662, -0.5329382, -3.124949, 0, 1, 0.9176471, 1,
-0.07162707, 0.120082, -0.8409851, 0, 1, 0.9215686, 1,
-0.07139821, -0.7419193, -4.828868, 0, 1, 0.9294118, 1,
-0.06863013, 2.917367, -1.001562, 0, 1, 0.9333333, 1,
-0.06720386, 1.033919, 1.525574, 0, 1, 0.9411765, 1,
-0.06583796, -0.858954, -2.136877, 0, 1, 0.945098, 1,
-0.06487208, 0.4359405, 0.06037797, 0, 1, 0.9529412, 1,
-0.06405689, 0.6426035, 2.071191, 0, 1, 0.9568627, 1,
-0.061959, -1.599719, -3.209449, 0, 1, 0.9647059, 1,
-0.06120682, 0.7451448, -0.7904015, 0, 1, 0.9686275, 1,
-0.05955661, 0.7990591, -0.5353749, 0, 1, 0.9764706, 1,
-0.05737694, 0.7699882, 0.6686642, 0, 1, 0.9803922, 1,
-0.05624507, 0.4210605, 0.6244245, 0, 1, 0.9882353, 1,
-0.05078367, -0.1794935, -2.491449, 0, 1, 0.9921569, 1,
-0.05071309, 0.1425957, -1.143522, 0, 1, 1, 1,
-0.0499642, 1.401479, 0.1632595, 0, 0.9921569, 1, 1,
-0.04863619, 2.003459, 0.9379864, 0, 0.9882353, 1, 1,
-0.04672392, 2.488703, -0.4257538, 0, 0.9803922, 1, 1,
-0.04656025, -0.1449049, -1.663153, 0, 0.9764706, 1, 1,
-0.04637904, -0.9396253, -3.156633, 0, 0.9686275, 1, 1,
-0.039149, -2.290494, -3.364938, 0, 0.9647059, 1, 1,
-0.03590384, 0.6797363, -0.8967079, 0, 0.9568627, 1, 1,
-0.03382612, 0.1931005, 0.6028478, 0, 0.9529412, 1, 1,
-0.02718487, -1.069099, -4.069556, 0, 0.945098, 1, 1,
-0.02632081, -0.9268008, -3.739249, 0, 0.9411765, 1, 1,
-0.02498513, -0.6733091, -2.151935, 0, 0.9333333, 1, 1,
-0.02327285, -1.660138, -3.952215, 0, 0.9294118, 1, 1,
-0.02213871, 0.288586, -0.145979, 0, 0.9215686, 1, 1,
-0.02069709, 0.1680036, 0.1311506, 0, 0.9176471, 1, 1,
-0.0190263, 0.3659403, 0.01567684, 0, 0.9098039, 1, 1,
-0.01604775, -1.773747, -4.582301, 0, 0.9058824, 1, 1,
-0.01556596, 0.3607617, 0.2707432, 0, 0.8980392, 1, 1,
-0.01489915, 1.59844, -1.04682, 0, 0.8901961, 1, 1,
-0.01463273, -0.8719067, -4.61982, 0, 0.8862745, 1, 1,
-0.01430092, -0.3075547, -2.534904, 0, 0.8784314, 1, 1,
-0.01402628, 0.9858767, -0.8072333, 0, 0.8745098, 1, 1,
-0.01302997, -0.3615581, -1.794824, 0, 0.8666667, 1, 1,
-0.01214278, -0.2236526, -2.946811, 0, 0.8627451, 1, 1,
-0.009690952, -0.2935969, -3.0007, 0, 0.854902, 1, 1,
-0.007715057, 0.2979091, -2.47544, 0, 0.8509804, 1, 1,
-0.007549964, -0.7496408, -1.763188, 0, 0.8431373, 1, 1,
-0.00652026, -2.16001, -2.937064, 0, 0.8392157, 1, 1,
-0.0003522738, -0.7260644, -2.847487, 0, 0.8313726, 1, 1,
-6.833151e-05, -1.018223, -2.481172, 0, 0.827451, 1, 1,
0.001636617, -0.4606194, 2.950522, 0, 0.8196079, 1, 1,
0.003770505, -0.850574, 2.414721, 0, 0.8156863, 1, 1,
0.004213401, -0.5705956, 4.536699, 0, 0.8078431, 1, 1,
0.009041049, 0.129628, -0.4050453, 0, 0.8039216, 1, 1,
0.00909061, -1.535098, 1.771997, 0, 0.7960784, 1, 1,
0.01495159, -0.001394224, 1.584251, 0, 0.7882353, 1, 1,
0.01567325, 0.7958751, -0.06146699, 0, 0.7843137, 1, 1,
0.01793058, -0.3950512, 2.018465, 0, 0.7764706, 1, 1,
0.03020835, 0.4545991, -2.209996, 0, 0.772549, 1, 1,
0.0380587, -0.8291758, 3.597176, 0, 0.7647059, 1, 1,
0.04023486, -0.8571372, 4.360843, 0, 0.7607843, 1, 1,
0.04103626, -0.5718626, 4.432904, 0, 0.7529412, 1, 1,
0.04220001, -1.010833, 3.596958, 0, 0.7490196, 1, 1,
0.04316658, -0.8879279, 3.658024, 0, 0.7411765, 1, 1,
0.04465092, 1.21942, 0.6757956, 0, 0.7372549, 1, 1,
0.04524289, 0.7730189, 1.093272, 0, 0.7294118, 1, 1,
0.04675053, -0.172976, 3.351393, 0, 0.7254902, 1, 1,
0.05195757, -0.4601223, 1.652878, 0, 0.7176471, 1, 1,
0.05334734, -0.2338432, 2.994831, 0, 0.7137255, 1, 1,
0.0561708, -1.363859, 1.947036, 0, 0.7058824, 1, 1,
0.05656525, -0.9173246, 3.406923, 0, 0.6980392, 1, 1,
0.05907341, 0.4131112, 2.618562, 0, 0.6941177, 1, 1,
0.06095438, 0.3049327, 0.09965447, 0, 0.6862745, 1, 1,
0.06179012, -1.782715, 1.879593, 0, 0.682353, 1, 1,
0.06266102, -1.008924, 3.311049, 0, 0.6745098, 1, 1,
0.0648063, -0.6136097, 3.202377, 0, 0.6705883, 1, 1,
0.06604414, -0.1255912, 4.425256, 0, 0.6627451, 1, 1,
0.07054487, 0.9740309, 1.78466, 0, 0.6588235, 1, 1,
0.07399309, 1.538166, -0.1895587, 0, 0.6509804, 1, 1,
0.08093275, -0.2337075, 3.066169, 0, 0.6470588, 1, 1,
0.09237523, 0.4956861, -1.752631, 0, 0.6392157, 1, 1,
0.09386882, -0.5723611, 3.797776, 0, 0.6352941, 1, 1,
0.09464402, 1.069115, 1.370288, 0, 0.627451, 1, 1,
0.09508236, -0.09800306, 2.775582, 0, 0.6235294, 1, 1,
0.09584536, -0.1642873, 2.527993, 0, 0.6156863, 1, 1,
0.1002604, -0.5575959, 4.289943, 0, 0.6117647, 1, 1,
0.1068344, -0.664367, 3.384771, 0, 0.6039216, 1, 1,
0.107277, 1.55759, -2.472862, 0, 0.5960785, 1, 1,
0.1106613, -1.420404, 3.470936, 0, 0.5921569, 1, 1,
0.1129185, -0.5441062, 2.614651, 0, 0.5843138, 1, 1,
0.1141295, -0.308342, 1.961454, 0, 0.5803922, 1, 1,
0.1165227, -1.083411, 4.118324, 0, 0.572549, 1, 1,
0.1166389, -2.603512, 2.676545, 0, 0.5686275, 1, 1,
0.1185799, 0.7792329, -0.4270507, 0, 0.5607843, 1, 1,
0.1201974, 1.106962, 0.1223791, 0, 0.5568628, 1, 1,
0.1220925, 0.860788, -0.9381322, 0, 0.5490196, 1, 1,
0.1258715, -0.366068, 2.643492, 0, 0.5450981, 1, 1,
0.1296338, -0.1166982, 2.317106, 0, 0.5372549, 1, 1,
0.1296993, 0.4134116, 1.992112, 0, 0.5333334, 1, 1,
0.1340475, -1.453373, 3.89652, 0, 0.5254902, 1, 1,
0.1341682, 1.768747, -1.138695, 0, 0.5215687, 1, 1,
0.1345714, 0.2108141, 0.9467769, 0, 0.5137255, 1, 1,
0.1361317, 0.1789289, 0.3598334, 0, 0.509804, 1, 1,
0.1384828, 0.209636, 0.6184236, 0, 0.5019608, 1, 1,
0.1385893, -2.175767, 3.869765, 0, 0.4941176, 1, 1,
0.1400509, 1.232872, 0.5611587, 0, 0.4901961, 1, 1,
0.1410246, 1.014111, -0.7785655, 0, 0.4823529, 1, 1,
0.1414842, 0.07874514, 2.992958, 0, 0.4784314, 1, 1,
0.1443095, -0.2689112, 2.587744, 0, 0.4705882, 1, 1,
0.1457842, 1.232776, 0.1798868, 0, 0.4666667, 1, 1,
0.147372, 1.090896, 1.368997, 0, 0.4588235, 1, 1,
0.152824, -0.395817, 2.905469, 0, 0.454902, 1, 1,
0.1572676, -0.5878463, 1.533934, 0, 0.4470588, 1, 1,
0.1602052, -2.657282, 4.138369, 0, 0.4431373, 1, 1,
0.1642365, -2.279821, 3.744799, 0, 0.4352941, 1, 1,
0.1646355, 1.21757, 0.6453693, 0, 0.4313726, 1, 1,
0.164684, -0.9594316, 4.081321, 0, 0.4235294, 1, 1,
0.1739109, 0.2250992, 2.101625, 0, 0.4196078, 1, 1,
0.1753244, 0.9825594, -0.3563041, 0, 0.4117647, 1, 1,
0.1762511, 0.1813073, 0.6514253, 0, 0.4078431, 1, 1,
0.1847575, 0.3309281, 0.6543535, 0, 0.4, 1, 1,
0.1874543, 0.3631014, 3.148402, 0, 0.3921569, 1, 1,
0.1876168, -0.5372855, 3.41615, 0, 0.3882353, 1, 1,
0.1901052, -1.195098, 2.439537, 0, 0.3803922, 1, 1,
0.1908282, 0.5450459, 0.7232395, 0, 0.3764706, 1, 1,
0.1919515, -0.1958738, 3.323049, 0, 0.3686275, 1, 1,
0.1943731, 1.024882, 1.355007, 0, 0.3647059, 1, 1,
0.1957154, 0.7400836, -0.3766206, 0, 0.3568628, 1, 1,
0.1957396, 1.101762, 0.5278007, 0, 0.3529412, 1, 1,
0.1969188, 1.59426, 0.08109746, 0, 0.345098, 1, 1,
0.1973458, 0.02279831, 0.8096784, 0, 0.3411765, 1, 1,
0.1977204, 0.9318656, -0.6163569, 0, 0.3333333, 1, 1,
0.2060302, 1.159315, 0.2772204, 0, 0.3294118, 1, 1,
0.2112903, 0.1626177, -0.01035512, 0, 0.3215686, 1, 1,
0.2117123, 1.064933, 1.091549, 0, 0.3176471, 1, 1,
0.2163051, -0.3192137, -0.5770416, 0, 0.3098039, 1, 1,
0.2192196, 1.378923, -0.7138004, 0, 0.3058824, 1, 1,
0.21945, -0.9710968, 2.719635, 0, 0.2980392, 1, 1,
0.2206131, -1.43124, 2.981121, 0, 0.2901961, 1, 1,
0.2220662, 1.032012, 1.609363, 0, 0.2862745, 1, 1,
0.2255665, 1.742803, 0.415049, 0, 0.2784314, 1, 1,
0.2261549, -0.7695467, 1.31025, 0, 0.2745098, 1, 1,
0.2361643, -0.1215682, 3.847387, 0, 0.2666667, 1, 1,
0.2391098, -1.920628, 4.315639, 0, 0.2627451, 1, 1,
0.2397783, 0.9211376, 0.7088044, 0, 0.254902, 1, 1,
0.240608, -0.1048319, 2.164427, 0, 0.2509804, 1, 1,
0.2465689, -1.846617, 3.065693, 0, 0.2431373, 1, 1,
0.249981, -0.2199193, 3.381239, 0, 0.2392157, 1, 1,
0.2518624, -0.8105068, 4.333617, 0, 0.2313726, 1, 1,
0.2521045, 0.6032141, -0.08531109, 0, 0.227451, 1, 1,
0.2534319, 0.507746, -1.01178, 0, 0.2196078, 1, 1,
0.260604, 0.4396054, -0.3369325, 0, 0.2156863, 1, 1,
0.2627122, -0.7573785, 3.880127, 0, 0.2078431, 1, 1,
0.2629099, 0.4536755, 1.632648, 0, 0.2039216, 1, 1,
0.2648849, 0.246228, 1.101832, 0, 0.1960784, 1, 1,
0.2675352, 1.60836, -1.672398, 0, 0.1882353, 1, 1,
0.2685131, -0.7496908, 4.197408, 0, 0.1843137, 1, 1,
0.2687707, -0.3018394, 2.879315, 0, 0.1764706, 1, 1,
0.2728173, 0.3437755, 1.239745, 0, 0.172549, 1, 1,
0.2729979, 0.2652812, 1.387886, 0, 0.1647059, 1, 1,
0.2743597, -0.4879703, 3.520793, 0, 0.1607843, 1, 1,
0.2777391, 0.9637027, 2.198666, 0, 0.1529412, 1, 1,
0.2789851, 1.441349, -0.3215044, 0, 0.1490196, 1, 1,
0.28435, 0.4713173, 0.2758573, 0, 0.1411765, 1, 1,
0.2886409, 1.607009, -0.2784627, 0, 0.1372549, 1, 1,
0.2945042, -0.2922593, 0.5870422, 0, 0.1294118, 1, 1,
0.2965174, 0.3906199, 1.898854, 0, 0.1254902, 1, 1,
0.3011526, 0.6688125, -0.8628058, 0, 0.1176471, 1, 1,
0.3043947, 0.5241535, 1.736279, 0, 0.1137255, 1, 1,
0.3044734, -0.5866988, 4.166317, 0, 0.1058824, 1, 1,
0.3083819, -0.501965, 1.676702, 0, 0.09803922, 1, 1,
0.308788, -0.4121825, 1.696862, 0, 0.09411765, 1, 1,
0.3110912, 0.4490976, 0.3010826, 0, 0.08627451, 1, 1,
0.3144402, 0.1800665, 0.7516763, 0, 0.08235294, 1, 1,
0.3148576, -1.224217, 1.526047, 0, 0.07450981, 1, 1,
0.3152357, -0.1901469, 3.174448, 0, 0.07058824, 1, 1,
0.3155464, -1.03751, 3.373267, 0, 0.0627451, 1, 1,
0.3172302, 0.2500595, 1.056195, 0, 0.05882353, 1, 1,
0.3185356, -0.5035135, 2.342211, 0, 0.05098039, 1, 1,
0.3231601, 0.2430865, -0.1930745, 0, 0.04705882, 1, 1,
0.3247492, -0.8516065, 1.913428, 0, 0.03921569, 1, 1,
0.3265664, -0.8965207, -0.1333488, 0, 0.03529412, 1, 1,
0.3268122, -2.162649, 0.8798313, 0, 0.02745098, 1, 1,
0.3325923, 1.086908, 0.9947485, 0, 0.02352941, 1, 1,
0.3366969, 1.141368, -0.4991503, 0, 0.01568628, 1, 1,
0.3419668, -0.1978721, 1.44859, 0, 0.01176471, 1, 1,
0.3471187, 1.188141, -0.6265871, 0, 0.003921569, 1, 1,
0.3583198, -0.8131269, 1.62217, 0.003921569, 0, 1, 1,
0.3584368, 0.7741541, -0.1114751, 0.007843138, 0, 1, 1,
0.3613505, -2.374406, 3.656053, 0.01568628, 0, 1, 1,
0.3686259, 1.094811, -0.1625532, 0.01960784, 0, 1, 1,
0.3737657, 1.127717, 1.237755, 0.02745098, 0, 1, 1,
0.3794446, -1.601606, 4.182411, 0.03137255, 0, 1, 1,
0.3903953, 2.231214, 0.8128763, 0.03921569, 0, 1, 1,
0.3913951, -0.7027439, 3.133702, 0.04313726, 0, 1, 1,
0.3939233, -1.247645, 2.550344, 0.05098039, 0, 1, 1,
0.3946662, 1.817846, -0.7346957, 0.05490196, 0, 1, 1,
0.3982163, 0.5516707, 1.633223, 0.0627451, 0, 1, 1,
0.4033597, 0.3208357, -0.3114684, 0.06666667, 0, 1, 1,
0.4117, -1.222058, 2.021401, 0.07450981, 0, 1, 1,
0.4174728, 2.908685, -0.6123583, 0.07843138, 0, 1, 1,
0.4217537, -0.5463047, 4.191747, 0.08627451, 0, 1, 1,
0.4223837, -0.7161813, 3.817455, 0.09019608, 0, 1, 1,
0.4242678, -1.200158, 2.15315, 0.09803922, 0, 1, 1,
0.4274773, -0.7636249, 1.435258, 0.1058824, 0, 1, 1,
0.4283382, 0.3074172, 0.9518861, 0.1098039, 0, 1, 1,
0.432305, -0.08051044, 2.374181, 0.1176471, 0, 1, 1,
0.4447885, 0.5736334, 0.3024206, 0.1215686, 0, 1, 1,
0.4474015, -0.7025394, 3.022562, 0.1294118, 0, 1, 1,
0.448553, -1.373816, 1.510342, 0.1333333, 0, 1, 1,
0.4512633, 0.1821012, 1.559765, 0.1411765, 0, 1, 1,
0.4524907, 0.7248607, 1.485723, 0.145098, 0, 1, 1,
0.4538971, -0.461861, 1.925034, 0.1529412, 0, 1, 1,
0.4579939, -0.6935372, 2.998903, 0.1568628, 0, 1, 1,
0.458818, -0.2386252, 2.27155, 0.1647059, 0, 1, 1,
0.4656434, 0.007810799, 1.912752, 0.1686275, 0, 1, 1,
0.4696531, 0.5874534, 0.375339, 0.1764706, 0, 1, 1,
0.4711317, 1.026628, -1.133079, 0.1803922, 0, 1, 1,
0.4718249, 1.031054, -1.101581, 0.1882353, 0, 1, 1,
0.4733055, -1.033974, 3.293566, 0.1921569, 0, 1, 1,
0.4747748, 1.306514, -0.8290499, 0.2, 0, 1, 1,
0.4792984, -0.3843554, 3.013087, 0.2078431, 0, 1, 1,
0.4804796, 0.7614927, 0.0690946, 0.2117647, 0, 1, 1,
0.4807927, -0.3317122, 1.463903, 0.2196078, 0, 1, 1,
0.4856284, 0.1007609, 1.681978, 0.2235294, 0, 1, 1,
0.4861904, -0.6770816, 1.15976, 0.2313726, 0, 1, 1,
0.4867465, -0.2243658, 2.925907, 0.2352941, 0, 1, 1,
0.4878284, 1.026985, -0.7214735, 0.2431373, 0, 1, 1,
0.4925909, 2.090778, -0.8679721, 0.2470588, 0, 1, 1,
0.4929758, 0.6175852, 0.6945276, 0.254902, 0, 1, 1,
0.49338, -0.07955606, 2.338243, 0.2588235, 0, 1, 1,
0.4949526, 0.9274154, 1.158043, 0.2666667, 0, 1, 1,
0.4957772, -1.896621, 3.232959, 0.2705882, 0, 1, 1,
0.4960442, -0.5332094, 2.727293, 0.2784314, 0, 1, 1,
0.4988409, 0.7126667, 0.2726786, 0.282353, 0, 1, 1,
0.4990713, -0.611055, 2.033623, 0.2901961, 0, 1, 1,
0.5055133, 1.136568, 0.05258548, 0.2941177, 0, 1, 1,
0.5076118, 0.05781361, 1.112756, 0.3019608, 0, 1, 1,
0.5209326, -1.290125, 4.984482, 0.3098039, 0, 1, 1,
0.5221545, 0.206643, 3.285198, 0.3137255, 0, 1, 1,
0.5253564, -0.1157169, 1.576405, 0.3215686, 0, 1, 1,
0.5283593, 0.07589518, 0.1583139, 0.3254902, 0, 1, 1,
0.5288376, 0.3075476, 0.3627034, 0.3333333, 0, 1, 1,
0.5302029, -1.076884, 3.59792, 0.3372549, 0, 1, 1,
0.5334379, -1.410483, 2.41729, 0.345098, 0, 1, 1,
0.5353271, -0.7194255, 3.367813, 0.3490196, 0, 1, 1,
0.5355071, 1.184994, 1.515202, 0.3568628, 0, 1, 1,
0.5363748, -1.888595, 3.308319, 0.3607843, 0, 1, 1,
0.5400074, 1.720441, -0.2619283, 0.3686275, 0, 1, 1,
0.5414364, 0.2646172, 0.9209822, 0.372549, 0, 1, 1,
0.5502163, -1.966963, 1.644776, 0.3803922, 0, 1, 1,
0.5529206, -0.2330159, 2.071682, 0.3843137, 0, 1, 1,
0.5571045, -0.4622692, 2.610336, 0.3921569, 0, 1, 1,
0.5597901, 0.4477786, -0.4166551, 0.3960784, 0, 1, 1,
0.5624596, -1.334955, 3.490309, 0.4039216, 0, 1, 1,
0.565439, 1.211993, -0.1931089, 0.4117647, 0, 1, 1,
0.5681192, 1.034458, 1.937437, 0.4156863, 0, 1, 1,
0.5692222, -2.305935, 0.8054594, 0.4235294, 0, 1, 1,
0.574702, 0.6434154, 0.3834437, 0.427451, 0, 1, 1,
0.5768544, 0.571618, 0.5345826, 0.4352941, 0, 1, 1,
0.5786414, -0.8489708, 0.1136371, 0.4392157, 0, 1, 1,
0.5800081, -1.401416, 3.518396, 0.4470588, 0, 1, 1,
0.580985, 1.913276, 0.9191722, 0.4509804, 0, 1, 1,
0.5880632, -0.6209759, 2.468828, 0.4588235, 0, 1, 1,
0.5919077, 0.6442659, 2.167518, 0.4627451, 0, 1, 1,
0.5949746, -0.9768975, 2.773449, 0.4705882, 0, 1, 1,
0.5986903, -1.603797, 3.554308, 0.4745098, 0, 1, 1,
0.599601, 1.207372, 1.150939, 0.4823529, 0, 1, 1,
0.6002921, 0.4060214, 2.471834, 0.4862745, 0, 1, 1,
0.6048888, -0.2812864, 2.114733, 0.4941176, 0, 1, 1,
0.6183198, 0.6057486, 1.910941, 0.5019608, 0, 1, 1,
0.6290755, 0.8696591, 0.4154023, 0.5058824, 0, 1, 1,
0.6300102, 0.6275974, 0.2966647, 0.5137255, 0, 1, 1,
0.6304442, -0.02684007, 3.01175, 0.5176471, 0, 1, 1,
0.6314675, -0.2530746, 2.866135, 0.5254902, 0, 1, 1,
0.6353082, -1.017301, 0.7955986, 0.5294118, 0, 1, 1,
0.635926, -1.760884, 3.952647, 0.5372549, 0, 1, 1,
0.6381331, -0.1402315, 1.043754, 0.5411765, 0, 1, 1,
0.6400669, -1.178155, 2.326028, 0.5490196, 0, 1, 1,
0.6459681, -0.1739976, 1.341064, 0.5529412, 0, 1, 1,
0.6481066, 0.02724733, 2.024026, 0.5607843, 0, 1, 1,
0.6570124, 0.3359204, 2.296539, 0.5647059, 0, 1, 1,
0.6588994, 0.1253982, 1.261602, 0.572549, 0, 1, 1,
0.666384, 0.9283372, 1.175085, 0.5764706, 0, 1, 1,
0.6718188, -0.570611, 1.221707, 0.5843138, 0, 1, 1,
0.6782123, 1.525383, 0.09211548, 0.5882353, 0, 1, 1,
0.6809788, -0.5463347, 4.124438, 0.5960785, 0, 1, 1,
0.6814804, -0.7520254, 1.344081, 0.6039216, 0, 1, 1,
0.6876938, -0.1577265, 2.041341, 0.6078432, 0, 1, 1,
0.6880616, -0.7593068, 2.648812, 0.6156863, 0, 1, 1,
0.6933428, -0.1242653, 1.349519, 0.6196079, 0, 1, 1,
0.693857, 0.3838162, 0.5718527, 0.627451, 0, 1, 1,
0.6952155, -0.1533596, 2.331093, 0.6313726, 0, 1, 1,
0.6994271, -1.224741, 1.493717, 0.6392157, 0, 1, 1,
0.6997917, -0.557314, 1.709313, 0.6431373, 0, 1, 1,
0.7029802, 0.8367637, -0.3372597, 0.6509804, 0, 1, 1,
0.7063719, 0.0779193, 1.019624, 0.654902, 0, 1, 1,
0.7105031, 0.4702231, 0.824312, 0.6627451, 0, 1, 1,
0.7119832, 0.08885992, 2.029735, 0.6666667, 0, 1, 1,
0.7137151, -0.4272271, 1.800714, 0.6745098, 0, 1, 1,
0.7143714, -2.19959, 2.570301, 0.6784314, 0, 1, 1,
0.7192959, 0.4713694, 0.8587527, 0.6862745, 0, 1, 1,
0.7194307, -0.7698416, 3.060588, 0.6901961, 0, 1, 1,
0.7220058, 0.3821476, 1.023752, 0.6980392, 0, 1, 1,
0.7296857, -1.573049, 3.422426, 0.7058824, 0, 1, 1,
0.7331218, -0.1677534, 1.655857, 0.7098039, 0, 1, 1,
0.7365423, 0.09914984, 1.308962, 0.7176471, 0, 1, 1,
0.7397768, -0.8048646, 2.865458, 0.7215686, 0, 1, 1,
0.741068, -0.4649534, 2.03747, 0.7294118, 0, 1, 1,
0.7421595, -1.14752, 2.168629, 0.7333333, 0, 1, 1,
0.7426704, -0.6700368, 2.688802, 0.7411765, 0, 1, 1,
0.7443121, -0.8245481, 2.282849, 0.7450981, 0, 1, 1,
0.7458052, -1.507819, 2.600403, 0.7529412, 0, 1, 1,
0.7470296, -0.006364479, 3.390824, 0.7568628, 0, 1, 1,
0.7500715, -0.3808062, 1.75899, 0.7647059, 0, 1, 1,
0.7522331, 0.5218231, 1.560732, 0.7686275, 0, 1, 1,
0.7551485, 2.361117, -0.6923086, 0.7764706, 0, 1, 1,
0.7553071, -0.4026363, 2.422966, 0.7803922, 0, 1, 1,
0.7660347, -0.1843043, 2.861893, 0.7882353, 0, 1, 1,
0.7719679, 0.2096976, 2.576355, 0.7921569, 0, 1, 1,
0.7729779, 0.9753668, 0.05690569, 0.8, 0, 1, 1,
0.7775674, 0.7194418, 0.6352949, 0.8078431, 0, 1, 1,
0.7789799, -0.5124987, 3.57694, 0.8117647, 0, 1, 1,
0.7791879, 1.033209, 1.14983, 0.8196079, 0, 1, 1,
0.7910461, 0.9413716, 0.8683176, 0.8235294, 0, 1, 1,
0.8061454, -0.3263841, 1.617337, 0.8313726, 0, 1, 1,
0.8128027, 0.08480116, 1.017609, 0.8352941, 0, 1, 1,
0.8141004, 0.2289335, 2.473195, 0.8431373, 0, 1, 1,
0.8151468, 0.8927544, 1.048308, 0.8470588, 0, 1, 1,
0.8156373, 0.3594611, -0.6113189, 0.854902, 0, 1, 1,
0.8177882, -0.2165702, 2.198993, 0.8588235, 0, 1, 1,
0.8219571, 0.4948301, 1.407744, 0.8666667, 0, 1, 1,
0.8291489, 0.9837931, 0.7038462, 0.8705882, 0, 1, 1,
0.833809, 0.05930787, 1.730669, 0.8784314, 0, 1, 1,
0.8500043, 1.880037, -0.1697931, 0.8823529, 0, 1, 1,
0.8522087, -0.2518077, 1.301729, 0.8901961, 0, 1, 1,
0.853686, -1.490069, 4.81092, 0.8941177, 0, 1, 1,
0.8559155, -0.880218, 0.3643244, 0.9019608, 0, 1, 1,
0.8589919, -0.8358645, 2.020816, 0.9098039, 0, 1, 1,
0.861717, -0.4579069, 1.438151, 0.9137255, 0, 1, 1,
0.8685539, 0.4174348, 1.720865, 0.9215686, 0, 1, 1,
0.8693245, 2.526844, 1.442749, 0.9254902, 0, 1, 1,
0.8726, -2.057942, 2.440915, 0.9333333, 0, 1, 1,
0.8736253, -1.327683, 3.552856, 0.9372549, 0, 1, 1,
0.8780048, -0.2791857, 1.947456, 0.945098, 0, 1, 1,
0.880048, 0.6473783, 1.332831, 0.9490196, 0, 1, 1,
0.8838044, 0.1728051, 0.9197851, 0.9568627, 0, 1, 1,
0.8855541, -0.699249, 3.165498, 0.9607843, 0, 1, 1,
0.8875862, -0.02915839, 0.4192062, 0.9686275, 0, 1, 1,
0.8941346, 0.5673553, 1.297789, 0.972549, 0, 1, 1,
0.8950434, -0.3222632, 2.321787, 0.9803922, 0, 1, 1,
0.8972979, -0.1296885, 0.4392305, 0.9843137, 0, 1, 1,
0.9007014, 0.2762885, 0.5487168, 0.9921569, 0, 1, 1,
0.9048715, -1.357168, 4.090029, 0.9960784, 0, 1, 1,
0.9060352, -0.7856548, 1.427591, 1, 0, 0.9960784, 1,
0.9094313, 0.446339, -0.7469368, 1, 0, 0.9882353, 1,
0.9106719, 2.048897, -0.4903897, 1, 0, 0.9843137, 1,
0.9130594, 0.3840432, 2.087204, 1, 0, 0.9764706, 1,
0.9135181, -1.358827, 2.117766, 1, 0, 0.972549, 1,
0.9142894, -0.9219461, 1.082187, 1, 0, 0.9647059, 1,
0.9171745, -1.05117, 2.222602, 1, 0, 0.9607843, 1,
0.9221713, -0.5254878, 2.308627, 1, 0, 0.9529412, 1,
0.9250094, -0.4769995, 2.638623, 1, 0, 0.9490196, 1,
0.9287328, 1.521196, 1.356004, 1, 0, 0.9411765, 1,
0.9312308, 1.722524, 0.8445148, 1, 0, 0.9372549, 1,
0.9326761, 0.872763, 0.84034, 1, 0, 0.9294118, 1,
0.9366215, 0.8926223, 0.5331854, 1, 0, 0.9254902, 1,
0.9375899, 1.60496, 0.8703939, 1, 0, 0.9176471, 1,
0.9378856, 1.701185, 0.08886515, 1, 0, 0.9137255, 1,
0.9472954, -0.2544398, -0.3601244, 1, 0, 0.9058824, 1,
0.9493564, -0.3971059, 3.424709, 1, 0, 0.9019608, 1,
0.9601288, -1.509163, 1.60682, 1, 0, 0.8941177, 1,
0.9651014, 0.4805535, 1.651725, 1, 0, 0.8862745, 1,
0.96856, -0.4534948, 0.3056205, 1, 0, 0.8823529, 1,
0.9716293, 0.7318304, 0.2911015, 1, 0, 0.8745098, 1,
0.9735692, 0.8114676, 1.079688, 1, 0, 0.8705882, 1,
0.9764116, 0.1318418, 1.696573, 1, 0, 0.8627451, 1,
0.9852462, -0.1363417, 3.082212, 1, 0, 0.8588235, 1,
0.9853181, 0.04730484, 2.134737, 1, 0, 0.8509804, 1,
0.9875188, 0.3020874, 1.394352, 1, 0, 0.8470588, 1,
0.9948238, -0.3347495, 3.259526, 1, 0, 0.8392157, 1,
0.9958123, -0.8217737, 2.868017, 1, 0, 0.8352941, 1,
0.9972836, 0.3234951, 0.2821622, 1, 0, 0.827451, 1,
1.004364, 0.3903828, 0.4073426, 1, 0, 0.8235294, 1,
1.007994, 1.166705, 0.9557281, 1, 0, 0.8156863, 1,
1.017014, -0.6816251, 2.338431, 1, 0, 0.8117647, 1,
1.01879, 0.919127, 2.0885, 1, 0, 0.8039216, 1,
1.020632, -0.3785739, 1.05587, 1, 0, 0.7960784, 1,
1.021684, 0.7569217, 0.7689019, 1, 0, 0.7921569, 1,
1.024639, 0.5271423, 2.204047, 1, 0, 0.7843137, 1,
1.025059, 0.8017789, 1.57782, 1, 0, 0.7803922, 1,
1.025845, -0.03904656, 1.567071, 1, 0, 0.772549, 1,
1.042743, -1.014436, 2.766448, 1, 0, 0.7686275, 1,
1.048867, 0.1456167, 2.236973, 1, 0, 0.7607843, 1,
1.049723, -0.1851554, 2.996309, 1, 0, 0.7568628, 1,
1.055926, -0.2843522, 1.758167, 1, 0, 0.7490196, 1,
1.06484, 0.762724, 0.1221092, 1, 0, 0.7450981, 1,
1.06563, 0.3405676, 0.5116834, 1, 0, 0.7372549, 1,
1.076321, -1.324967, 3.572843, 1, 0, 0.7333333, 1,
1.077024, 0.9092039, 1.832875, 1, 0, 0.7254902, 1,
1.091803, 1.656355, 0.5154506, 1, 0, 0.7215686, 1,
1.095747, 0.5736771, 1.625869, 1, 0, 0.7137255, 1,
1.107964, -0.3313436, 1.362787, 1, 0, 0.7098039, 1,
1.108616, -1.01133, 1.860336, 1, 0, 0.7019608, 1,
1.109079, 1.723074, -0.929599, 1, 0, 0.6941177, 1,
1.113815, -1.730119, 3.457095, 1, 0, 0.6901961, 1,
1.129042, 0.01340998, 3.516992, 1, 0, 0.682353, 1,
1.14356, -0.8145503, 2.178754, 1, 0, 0.6784314, 1,
1.144559, 0.4017537, 1.297129, 1, 0, 0.6705883, 1,
1.146215, -2.733396, 3.84162, 1, 0, 0.6666667, 1,
1.1537, -0.4384403, 1.184522, 1, 0, 0.6588235, 1,
1.153888, -1.61402, 2.951241, 1, 0, 0.654902, 1,
1.154787, 0.2155385, 1.542534, 1, 0, 0.6470588, 1,
1.1583, 0.3675563, -0.003675902, 1, 0, 0.6431373, 1,
1.160292, 1.286212, 2.314329, 1, 0, 0.6352941, 1,
1.167156, -0.524936, 3.127864, 1, 0, 0.6313726, 1,
1.169482, -0.3182172, 0.4214641, 1, 0, 0.6235294, 1,
1.169991, 0.7966806, -1.32083, 1, 0, 0.6196079, 1,
1.178544, 1.657962, 1.66076, 1, 0, 0.6117647, 1,
1.186136, 2.361931, -0.2865143, 1, 0, 0.6078432, 1,
1.194768, -0.009176964, 2.649865, 1, 0, 0.6, 1,
1.19854, 0.2520026, 0.4329535, 1, 0, 0.5921569, 1,
1.222292, 0.3437152, 0.6848736, 1, 0, 0.5882353, 1,
1.222539, 0.8456137, 1.291049, 1, 0, 0.5803922, 1,
1.226055, -0.4093857, 0.3542534, 1, 0, 0.5764706, 1,
1.244109, 2.411416, -0.4808355, 1, 0, 0.5686275, 1,
1.250791, -0.06185694, -0.2561636, 1, 0, 0.5647059, 1,
1.255623, -0.04040704, 2.06117, 1, 0, 0.5568628, 1,
1.261632, 0.5388133, 1.019365, 1, 0, 0.5529412, 1,
1.265662, -0.3636256, 0.8046858, 1, 0, 0.5450981, 1,
1.276852, 0.3865485, 0.9808915, 1, 0, 0.5411765, 1,
1.277335, 0.08899816, 2.114111, 1, 0, 0.5333334, 1,
1.27735, 0.4114364, 0.309187, 1, 0, 0.5294118, 1,
1.277529, 0.6839145, 1.476324, 1, 0, 0.5215687, 1,
1.286979, 0.3295989, 2.062781, 1, 0, 0.5176471, 1,
1.293884, 0.3229707, 1.903418, 1, 0, 0.509804, 1,
1.30451, 0.09598979, 0.6502026, 1, 0, 0.5058824, 1,
1.309899, 0.080818, 1.856675, 1, 0, 0.4980392, 1,
1.317325, -0.2775967, 2.226043, 1, 0, 0.4901961, 1,
1.356601, 1.735347, 0.7140579, 1, 0, 0.4862745, 1,
1.359596, -0.7838439, 4.009867, 1, 0, 0.4784314, 1,
1.368948, -1.131022, 2.664029, 1, 0, 0.4745098, 1,
1.37014, 0.2343133, 0.3657836, 1, 0, 0.4666667, 1,
1.379807, 1.070214, 0.6048148, 1, 0, 0.4627451, 1,
1.384375, -0.2623343, 2.516681, 1, 0, 0.454902, 1,
1.384648, 0.9164727, 2.299216, 1, 0, 0.4509804, 1,
1.388205, -0.8142915, 4.536913, 1, 0, 0.4431373, 1,
1.388303, -1.284197, 3.294484, 1, 0, 0.4392157, 1,
1.417533, 0.1249286, 3.0722, 1, 0, 0.4313726, 1,
1.420425, 1.43173, -0.1657981, 1, 0, 0.427451, 1,
1.424874, 0.6458194, -0.4139717, 1, 0, 0.4196078, 1,
1.431059, -0.7124631, 0.6381637, 1, 0, 0.4156863, 1,
1.436834, -0.1396273, 2.609991, 1, 0, 0.4078431, 1,
1.449019, 1.266271, 1.95445, 1, 0, 0.4039216, 1,
1.450584, 1.820162, -0.3184367, 1, 0, 0.3960784, 1,
1.456428, -0.6437301, 1.380295, 1, 0, 0.3882353, 1,
1.477995, 0.4834701, -0.2016069, 1, 0, 0.3843137, 1,
1.48433, -1.046681, 2.800391, 1, 0, 0.3764706, 1,
1.485578, 0.7035782, 1.78233, 1, 0, 0.372549, 1,
1.490911, -0.09194613, 0.3059184, 1, 0, 0.3647059, 1,
1.491864, 1.52116, 0.1788481, 1, 0, 0.3607843, 1,
1.500207, 0.1315651, 1.50504, 1, 0, 0.3529412, 1,
1.509783, -0.8129028, 2.503835, 1, 0, 0.3490196, 1,
1.522865, 0.1572361, 1.114575, 1, 0, 0.3411765, 1,
1.523454, -0.1194076, 0.6803818, 1, 0, 0.3372549, 1,
1.523845, 0.5559193, 0.9482757, 1, 0, 0.3294118, 1,
1.52394, -0.7723541, 1.879226, 1, 0, 0.3254902, 1,
1.528628, -1.001624, 2.225162, 1, 0, 0.3176471, 1,
1.536809, -0.7671384, 2.685, 1, 0, 0.3137255, 1,
1.544201, -0.2247968, 0.6990045, 1, 0, 0.3058824, 1,
1.545804, 0.6943449, 1.271568, 1, 0, 0.2980392, 1,
1.55778, -1.809533, 3.483213, 1, 0, 0.2941177, 1,
1.564158, -0.7689096, 3.175299, 1, 0, 0.2862745, 1,
1.58372, 1.083301, 1.562749, 1, 0, 0.282353, 1,
1.584045, 1.155776, -1.239866, 1, 0, 0.2745098, 1,
1.597247, -0.7218499, 3.28464, 1, 0, 0.2705882, 1,
1.631857, -0.6483555, 2.840453, 1, 0, 0.2627451, 1,
1.632248, -1.225532, 3.013711, 1, 0, 0.2588235, 1,
1.652907, -1.565494, 1.464771, 1, 0, 0.2509804, 1,
1.661309, -2.611332, 1.623229, 1, 0, 0.2470588, 1,
1.666904, 0.3545774, 1.512367, 1, 0, 0.2392157, 1,
1.678003, 2.374773, -0.2801727, 1, 0, 0.2352941, 1,
1.704535, -0.7222257, 2.335365, 1, 0, 0.227451, 1,
1.709112, 0.5810373, 0.3096423, 1, 0, 0.2235294, 1,
1.714322, -1.01639, 1.799886, 1, 0, 0.2156863, 1,
1.720558, 0.5408309, 1.96266, 1, 0, 0.2117647, 1,
1.73954, 1.48839, 0.6972667, 1, 0, 0.2039216, 1,
1.752436, -0.6935816, 0.7465204, 1, 0, 0.1960784, 1,
1.766967, 0.002801548, 0.1334681, 1, 0, 0.1921569, 1,
1.779488, -0.5201822, 2.436411, 1, 0, 0.1843137, 1,
1.785106, -0.6024011, 3.618583, 1, 0, 0.1803922, 1,
1.808966, -0.5236276, 2.2553, 1, 0, 0.172549, 1,
1.825887, -0.454438, 2.389283, 1, 0, 0.1686275, 1,
1.82745, 1.117131, 1.115962, 1, 0, 0.1607843, 1,
1.833736, 0.4407937, 2.597423, 1, 0, 0.1568628, 1,
1.884678, 0.08058065, 1.936286, 1, 0, 0.1490196, 1,
1.889805, 1.387548, 0.4153169, 1, 0, 0.145098, 1,
1.89166, -0.100005, 0.2416312, 1, 0, 0.1372549, 1,
1.901257, 0.6470552, 2.510339, 1, 0, 0.1333333, 1,
1.909866, 0.05696907, 1.28654, 1, 0, 0.1254902, 1,
1.998608, -1.781975, 1.974637, 1, 0, 0.1215686, 1,
2.087839, 0.3195364, 1.212525, 1, 0, 0.1137255, 1,
2.113579, -0.3982853, 1.683789, 1, 0, 0.1098039, 1,
2.14486, -0.4977705, 1.407607, 1, 0, 0.1019608, 1,
2.171934, 0.1071636, 2.136591, 1, 0, 0.09411765, 1,
2.186673, 0.8351542, 1.522158, 1, 0, 0.09019608, 1,
2.221459, -0.9301214, 3.423716, 1, 0, 0.08235294, 1,
2.245994, -1.626248, 2.401096, 1, 0, 0.07843138, 1,
2.271238, -0.03490106, 1.148973, 1, 0, 0.07058824, 1,
2.297323, -0.05963725, 0.8639315, 1, 0, 0.06666667, 1,
2.391629, 1.219793, 0.5781452, 1, 0, 0.05882353, 1,
2.414446, -1.064162, 2.300548, 1, 0, 0.05490196, 1,
2.467125, 1.005988, 1.737525, 1, 0, 0.04705882, 1,
2.503427, 1.01063, 2.031344, 1, 0, 0.04313726, 1,
2.509794, -1.145821, 2.894932, 1, 0, 0.03529412, 1,
2.545162, 0.4049701, 1.342686, 1, 0, 0.03137255, 1,
2.584046, -0.2758468, 1.879382, 1, 0, 0.02352941, 1,
2.945423, -0.7264846, 0.9406939, 1, 0, 0.01960784, 1,
2.991804, -0.7026519, 0.9741971, 1, 0, 0.01176471, 1,
3.075943, -0.8475794, 3.119561, 1, 0, 0.007843138, 1
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
-0.1247972, -4.197688, -7.308318, 0, -0.5, 0.5, 0.5,
-0.1247972, -4.197688, -7.308318, 1, -0.5, 0.5, 0.5,
-0.1247972, -4.197688, -7.308318, 1, 1.5, 0.5, 0.5,
-0.1247972, -4.197688, -7.308318, 0, 1.5, 0.5, 0.5
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
-4.410588, 0.05939722, -7.308318, 0, -0.5, 0.5, 0.5,
-4.410588, 0.05939722, -7.308318, 1, -0.5, 0.5, 0.5,
-4.410588, 0.05939722, -7.308318, 1, 1.5, 0.5, 0.5,
-4.410588, 0.05939722, -7.308318, 0, 1.5, 0.5, 0.5
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
-4.410588, -4.197688, -0.2710972, 0, -0.5, 0.5, 0.5,
-4.410588, -4.197688, -0.2710972, 1, -0.5, 0.5, 0.5,
-4.410588, -4.197688, -0.2710972, 1, 1.5, 0.5, 0.5,
-4.410588, -4.197688, -0.2710972, 0, 1.5, 0.5, 0.5
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
-3, -3.215284, -5.684344,
3, -3.215284, -5.684344,
-3, -3.215284, -5.684344,
-3, -3.379018, -5.955007,
-2, -3.215284, -5.684344,
-2, -3.379018, -5.955007,
-1, -3.215284, -5.684344,
-1, -3.379018, -5.955007,
0, -3.215284, -5.684344,
0, -3.379018, -5.955007,
1, -3.215284, -5.684344,
1, -3.379018, -5.955007,
2, -3.215284, -5.684344,
2, -3.379018, -5.955007,
3, -3.215284, -5.684344,
3, -3.379018, -5.955007
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
-3, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
-3, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
-3, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
-3, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
-2, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
-2, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
-2, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
-2, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
-1, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
-1, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
-1, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
-1, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
0, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
0, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
0, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
0, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
1, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
1, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
1, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
1, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
2, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
2, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
2, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
2, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5,
3, -3.706486, -6.496331, 0, -0.5, 0.5, 0.5,
3, -3.706486, -6.496331, 1, -0.5, 0.5, 0.5,
3, -3.706486, -6.496331, 1, 1.5, 0.5, 0.5,
3, -3.706486, -6.496331, 0, 1.5, 0.5, 0.5
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
-3.421559, -3, -5.684344,
-3.421559, 3, -5.684344,
-3.421559, -3, -5.684344,
-3.586397, -3, -5.955007,
-3.421559, -2, -5.684344,
-3.586397, -2, -5.955007,
-3.421559, -1, -5.684344,
-3.586397, -1, -5.955007,
-3.421559, 0, -5.684344,
-3.586397, 0, -5.955007,
-3.421559, 1, -5.684344,
-3.586397, 1, -5.955007,
-3.421559, 2, -5.684344,
-3.586397, 2, -5.955007,
-3.421559, 3, -5.684344,
-3.586397, 3, -5.955007
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
-3.916074, -3, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, -3, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, -3, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, -3, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, -2, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, -2, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, -2, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, -2, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, -1, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, -1, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, -1, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, -1, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, 0, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, 0, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, 0, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, 0, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, 1, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, 1, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, 1, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, 1, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, 2, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, 2, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, 2, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, 2, -6.496331, 0, 1.5, 0.5, 0.5,
-3.916074, 3, -6.496331, 0, -0.5, 0.5, 0.5,
-3.916074, 3, -6.496331, 1, -0.5, 0.5, 0.5,
-3.916074, 3, -6.496331, 1, 1.5, 0.5, 0.5,
-3.916074, 3, -6.496331, 0, 1.5, 0.5, 0.5
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
-3.421559, -3.215284, -4,
-3.421559, -3.215284, 4,
-3.421559, -3.215284, -4,
-3.586397, -3.379018, -4,
-3.421559, -3.215284, -2,
-3.586397, -3.379018, -2,
-3.421559, -3.215284, 0,
-3.586397, -3.379018, 0,
-3.421559, -3.215284, 2,
-3.586397, -3.379018, 2,
-3.421559, -3.215284, 4,
-3.586397, -3.379018, 4
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
-3.916074, -3.706486, -4, 0, -0.5, 0.5, 0.5,
-3.916074, -3.706486, -4, 1, -0.5, 0.5, 0.5,
-3.916074, -3.706486, -4, 1, 1.5, 0.5, 0.5,
-3.916074, -3.706486, -4, 0, 1.5, 0.5, 0.5,
-3.916074, -3.706486, -2, 0, -0.5, 0.5, 0.5,
-3.916074, -3.706486, -2, 1, -0.5, 0.5, 0.5,
-3.916074, -3.706486, -2, 1, 1.5, 0.5, 0.5,
-3.916074, -3.706486, -2, 0, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 0, 0, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 0, 1, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 0, 1, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 0, 0, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 2, 0, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 2, 1, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 2, 1, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 2, 0, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 4, 0, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 4, 1, -0.5, 0.5, 0.5,
-3.916074, -3.706486, 4, 1, 1.5, 0.5, 0.5,
-3.916074, -3.706486, 4, 0, 1.5, 0.5, 0.5
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
-3.421559, -3.215284, -5.684344,
-3.421559, 3.334078, -5.684344,
-3.421559, -3.215284, 5.142149,
-3.421559, 3.334078, 5.142149,
-3.421559, -3.215284, -5.684344,
-3.421559, -3.215284, 5.142149,
-3.421559, 3.334078, -5.684344,
-3.421559, 3.334078, 5.142149,
-3.421559, -3.215284, -5.684344,
3.171965, -3.215284, -5.684344,
-3.421559, -3.215284, 5.142149,
3.171965, -3.215284, 5.142149,
-3.421559, 3.334078, -5.684344,
3.171965, 3.334078, -5.684344,
-3.421559, 3.334078, 5.142149,
3.171965, 3.334078, 5.142149,
3.171965, -3.215284, -5.684344,
3.171965, 3.334078, -5.684344,
3.171965, -3.215284, 5.142149,
3.171965, 3.334078, 5.142149,
3.171965, -3.215284, -5.684344,
3.171965, -3.215284, 5.142149,
3.171965, 3.334078, -5.684344,
3.171965, 3.334078, 5.142149
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
var radius = 7.618944;
var distance = 33.89754;
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
mvMatrix.translate( 0.1247972, -0.05939722, 0.2710972 );
mvMatrix.scale( 1.24937, 1.257794, 0.7608883 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89754);
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
triadimefon<-read.table("triadimefon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triadimefon$V2
```

```
## Error in eval(expr, envir, enclos): object 'triadimefon' not found
```

```r
y<-triadimefon$V3
```

```
## Error in eval(expr, envir, enclos): object 'triadimefon' not found
```

```r
z<-triadimefon$V4
```

```
## Error in eval(expr, envir, enclos): object 'triadimefon' not found
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
-3.325537, -1.278292, -1.404365, 0, 0, 1, 1, 1,
-3.260213, 1.226826, -1.037301, 1, 0, 0, 1, 1,
-2.717378, -1.068802, -1.090872, 1, 0, 0, 1, 1,
-2.610438, 0.3500741, -0.2594399, 1, 0, 0, 1, 1,
-2.453254, 0.6087639, -0.6182925, 1, 0, 0, 1, 1,
-2.421111, 0.9980494, -2.066168, 1, 0, 0, 1, 1,
-2.405535, 1.047648, 0.4793219, 0, 0, 0, 1, 1,
-2.38237, -0.1953161, -1.683831, 0, 0, 0, 1, 1,
-2.379074, 0.0795368, -2.560323, 0, 0, 0, 1, 1,
-2.298617, 0.2799362, -3.224854, 0, 0, 0, 1, 1,
-2.292685, 0.5786273, -2.048554, 0, 0, 0, 1, 1,
-2.274353, 0.2413965, -0.4238354, 0, 0, 0, 1, 1,
-2.235854, -0.1137132, -1.409169, 0, 0, 0, 1, 1,
-2.204539, 0.6577583, -2.02706, 1, 1, 1, 1, 1,
-2.169225, -1.191949, -1.76152, 1, 1, 1, 1, 1,
-2.133022, 0.3193652, -0.9449701, 1, 1, 1, 1, 1,
-2.121509, 2.248399, 0.7681463, 1, 1, 1, 1, 1,
-2.10373, 1.03049, -1.212934, 1, 1, 1, 1, 1,
-2.101058, 0.091223, -1.70252, 1, 1, 1, 1, 1,
-2.072248, 0.5145057, -2.356033, 1, 1, 1, 1, 1,
-2.066289, 0.9568044, -3.177939, 1, 1, 1, 1, 1,
-2.063391, 0.7393047, -2.195758, 1, 1, 1, 1, 1,
-2.028646, 1.124371, -1.130517, 1, 1, 1, 1, 1,
-2.006775, -0.5689294, -1.94073, 1, 1, 1, 1, 1,
-2.006167, 0.2897514, -0.2085498, 1, 1, 1, 1, 1,
-1.996299, -2.385556, -3.046266, 1, 1, 1, 1, 1,
-1.986147, 0.02453798, -2.347868, 1, 1, 1, 1, 1,
-1.977881, 1.969926, -1.204712, 1, 1, 1, 1, 1,
-1.958668, 0.3338673, -1.440871, 0, 0, 1, 1, 1,
-1.95252, -0.6620805, -1.469065, 1, 0, 0, 1, 1,
-1.925295, 2.429363, -2.30753, 1, 0, 0, 1, 1,
-1.90981, 0.6208922, -0.5152017, 1, 0, 0, 1, 1,
-1.908737, 1.123894, -0.1733732, 1, 0, 0, 1, 1,
-1.90274, 0.1697644, -2.709738, 1, 0, 0, 1, 1,
-1.902221, 1.367256, -0.8771071, 0, 0, 0, 1, 1,
-1.895524, 0.7651882, 0.385679, 0, 0, 0, 1, 1,
-1.859782, 1.813397, -1.493538, 0, 0, 0, 1, 1,
-1.857581, 1.005984, -1.928851, 0, 0, 0, 1, 1,
-1.855108, 1.46777, -1.305322, 0, 0, 0, 1, 1,
-1.849449, -1.123446, -3.263947, 0, 0, 0, 1, 1,
-1.84141, 0.5782988, -2.635322, 0, 0, 0, 1, 1,
-1.840184, 0.5614215, -0.2460098, 1, 1, 1, 1, 1,
-1.809863, 0.06418899, -2.293286, 1, 1, 1, 1, 1,
-1.787849, -0.9723198, -1.319254, 1, 1, 1, 1, 1,
-1.776307, -0.6914371, -1.693624, 1, 1, 1, 1, 1,
-1.774787, 0.5084777, -1.871078, 1, 1, 1, 1, 1,
-1.764324, -1.438681, -2.073665, 1, 1, 1, 1, 1,
-1.761322, 0.6696808, -2.70666, 1, 1, 1, 1, 1,
-1.753764, -0.09028792, -1.435558, 1, 1, 1, 1, 1,
-1.747756, 2.367293, -0.6686193, 1, 1, 1, 1, 1,
-1.703279, -0.6677273, -3.729653, 1, 1, 1, 1, 1,
-1.680792, -0.4810603, -4.815821, 1, 1, 1, 1, 1,
-1.660928, -1.857196, -1.778773, 1, 1, 1, 1, 1,
-1.659076, -0.9512791, -2.059649, 1, 1, 1, 1, 1,
-1.645968, -1.333647, -1.176288, 1, 1, 1, 1, 1,
-1.641734, -1.149538, -2.577735, 1, 1, 1, 1, 1,
-1.628286, 1.208416, -1.428413, 0, 0, 1, 1, 1,
-1.625497, 0.1854965, -0.9388357, 1, 0, 0, 1, 1,
-1.623382, -1.679234, -2.589456, 1, 0, 0, 1, 1,
-1.622876, -0.08204073, -2.156082, 1, 0, 0, 1, 1,
-1.61437, -0.1603991, -1.26327, 1, 0, 0, 1, 1,
-1.61278, 0.1060515, -2.098837, 1, 0, 0, 1, 1,
-1.612665, -0.4212372, -0.7975452, 0, 0, 0, 1, 1,
-1.611705, 0.9886109, -1.786645, 0, 0, 0, 1, 1,
-1.611012, 0.1970264, -0.6909897, 0, 0, 0, 1, 1,
-1.606831, -0.6243186, -2.365287, 0, 0, 0, 1, 1,
-1.606595, 1.784424, -0.8144835, 0, 0, 0, 1, 1,
-1.597997, 0.7717247, -1.291743, 0, 0, 0, 1, 1,
-1.590495, -0.7604046, -1.383073, 0, 0, 0, 1, 1,
-1.578213, -0.1743719, -1.624589, 1, 1, 1, 1, 1,
-1.57707, 1.367724, -0.6334143, 1, 1, 1, 1, 1,
-1.548149, 1.826617, -1.458548, 1, 1, 1, 1, 1,
-1.546048, -0.5361091, -1.578524, 1, 1, 1, 1, 1,
-1.538197, -1.104532, -2.59214, 1, 1, 1, 1, 1,
-1.534579, 1.20692, -0.8338706, 1, 1, 1, 1, 1,
-1.515158, 0.08849991, -2.40284, 1, 1, 1, 1, 1,
-1.490316, 0.5531483, -2.021629, 1, 1, 1, 1, 1,
-1.481156, 0.1812193, -0.8530285, 1, 1, 1, 1, 1,
-1.474741, 0.9130601, -0.354542, 1, 1, 1, 1, 1,
-1.439136, 1.127374, -1.586702, 1, 1, 1, 1, 1,
-1.437104, -0.1879547, 1.534738, 1, 1, 1, 1, 1,
-1.431847, 0.6677682, -0.1352302, 1, 1, 1, 1, 1,
-1.420987, -0.5132326, -2.546006, 1, 1, 1, 1, 1,
-1.413647, -0.5069717, -1.383429, 1, 1, 1, 1, 1,
-1.410651, 0.6049231, -2.659442, 0, 0, 1, 1, 1,
-1.408273, 0.4068136, -3.058931, 1, 0, 0, 1, 1,
-1.391295, 0.359622, -1.053503, 1, 0, 0, 1, 1,
-1.387735, -0.2454531, -1.557955, 1, 0, 0, 1, 1,
-1.38673, 0.3503326, 0.1333702, 1, 0, 0, 1, 1,
-1.386204, -0.1154974, -2.556596, 1, 0, 0, 1, 1,
-1.380702, -0.4079478, -1.36345, 0, 0, 0, 1, 1,
-1.35866, -0.2653227, -0.8325232, 0, 0, 0, 1, 1,
-1.345984, -0.3000678, -1.442673, 0, 0, 0, 1, 1,
-1.345864, -1.442669, -3.966622, 0, 0, 0, 1, 1,
-1.34181, -0.6457006, -2.806901, 0, 0, 0, 1, 1,
-1.325738, 0.6008587, -1.254336, 0, 0, 0, 1, 1,
-1.322074, -1.246354, -3.079806, 0, 0, 0, 1, 1,
-1.311027, -1.322142, -1.773623, 1, 1, 1, 1, 1,
-1.304069, 0.01790235, -0.05241338, 1, 1, 1, 1, 1,
-1.294695, -0.6112933, -0.8232172, 1, 1, 1, 1, 1,
-1.28156, 0.9450257, -1.218533, 1, 1, 1, 1, 1,
-1.27707, -1.97529, -3.063507, 1, 1, 1, 1, 1,
-1.26803, 0.099095, -0.9218195, 1, 1, 1, 1, 1,
-1.263677, 0.5784658, -0.3704022, 1, 1, 1, 1, 1,
-1.257684, 1.384295, -0.7743188, 1, 1, 1, 1, 1,
-1.257247, 0.2609839, -0.8524818, 1, 1, 1, 1, 1,
-1.255234, -0.3950198, -3.787819, 1, 1, 1, 1, 1,
-1.255097, -0.4435296, -2.716163, 1, 1, 1, 1, 1,
-1.252929, 1.976587, -0.7089396, 1, 1, 1, 1, 1,
-1.252483, 0.02976184, -1.334954, 1, 1, 1, 1, 1,
-1.247629, 0.3689168, -2.894344, 1, 1, 1, 1, 1,
-1.240255, -0.4807656, -2.30177, 1, 1, 1, 1, 1,
-1.232765, 1.419665, -2.601125, 0, 0, 1, 1, 1,
-1.229074, 1.307109, -1.678206, 1, 0, 0, 1, 1,
-1.22531, 0.5769826, -4.107643, 1, 0, 0, 1, 1,
-1.224002, -0.90213, -2.34424, 1, 0, 0, 1, 1,
-1.218706, -0.5910909, -0.6005334, 1, 0, 0, 1, 1,
-1.214119, -1.559645, -1.851016, 1, 0, 0, 1, 1,
-1.202829, -0.3845877, -1.564986, 0, 0, 0, 1, 1,
-1.199804, -0.4082542, -2.327913, 0, 0, 0, 1, 1,
-1.193359, -0.420812, -1.961908, 0, 0, 0, 1, 1,
-1.18224, -0.8009993, -3.12512, 0, 0, 0, 1, 1,
-1.182238, -0.5327036, -2.998296, 0, 0, 0, 1, 1,
-1.181054, 1.777141, -1.194768, 0, 0, 0, 1, 1,
-1.180962, -0.03903738, -1.242173, 0, 0, 0, 1, 1,
-1.171176, -2.151756, -3.453375, 1, 1, 1, 1, 1,
-1.170496, -0.3465247, -0.8197811, 1, 1, 1, 1, 1,
-1.159235, -1.051095, -2.322986, 1, 1, 1, 1, 1,
-1.148133, -1.179209, -0.6421751, 1, 1, 1, 1, 1,
-1.14463, 0.5443852, -0.4768053, 1, 1, 1, 1, 1,
-1.140486, -0.5041682, -2.208074, 1, 1, 1, 1, 1,
-1.140285, -0.1688183, -3.02989, 1, 1, 1, 1, 1,
-1.138131, 0.5523192, -2.187812, 1, 1, 1, 1, 1,
-1.131207, -0.3585325, -3.391155, 1, 1, 1, 1, 1,
-1.130898, 0.8152578, 0.4317222, 1, 1, 1, 1, 1,
-1.1302, -0.02401308, -1.470151, 1, 1, 1, 1, 1,
-1.128183, -0.3489279, -1.80462, 1, 1, 1, 1, 1,
-1.126301, -0.3671264, 0.3783837, 1, 1, 1, 1, 1,
-1.12578, 1.146424, -0.0660558, 1, 1, 1, 1, 1,
-1.121476, 0.6635993, 0.1082444, 1, 1, 1, 1, 1,
-1.117122, 1.004651, 0.5740454, 0, 0, 1, 1, 1,
-1.116297, -0.2997259, -2.082279, 1, 0, 0, 1, 1,
-1.111933, 1.299015, -0.3868217, 1, 0, 0, 1, 1,
-1.108764, 0.6252777, -1.760494, 1, 0, 0, 1, 1,
-1.093484, -0.2998717, -2.019871, 1, 0, 0, 1, 1,
-1.09334, 1.221611, -0.2341914, 1, 0, 0, 1, 1,
-1.092224, 0.7228094, -0.08834858, 0, 0, 0, 1, 1,
-1.090737, -0.2002501, -1.594809, 0, 0, 0, 1, 1,
-1.083687, -0.8876891, -0.1042857, 0, 0, 0, 1, 1,
-1.075542, 0.4020781, -1.191812, 0, 0, 0, 1, 1,
-1.072814, -0.8933634, -2.338954, 0, 0, 0, 1, 1,
-1.055837, -0.3482185, -2.626081, 0, 0, 0, 1, 1,
-1.054407, 0.8115313, -0.02694507, 0, 0, 0, 1, 1,
-1.051276, -1.246574, -2.748864, 1, 1, 1, 1, 1,
-1.04859, 1.717159, -1.434129, 1, 1, 1, 1, 1,
-1.041064, 1.164997, -0.1629183, 1, 1, 1, 1, 1,
-1.038868, 0.5415029, -2.521965, 1, 1, 1, 1, 1,
-1.035397, -1.500764, -3.146591, 1, 1, 1, 1, 1,
-1.032881, 3.238699, -0.511621, 1, 1, 1, 1, 1,
-1.031315, -0.3772085, -1.989377, 1, 1, 1, 1, 1,
-1.012572, -2.620533, -1.922398, 1, 1, 1, 1, 1,
-1.010264, 0.6449887, -0.9421511, 1, 1, 1, 1, 1,
-1.0022, -1.871333, -1.388399, 1, 1, 1, 1, 1,
-1.001279, 0.04281222, -1.383347, 1, 1, 1, 1, 1,
-0.9989751, 2.067773, -1.255908, 1, 1, 1, 1, 1,
-0.9920014, -0.5595123, -1.047688, 1, 1, 1, 1, 1,
-0.9870699, -0.299611, -3.306883, 1, 1, 1, 1, 1,
-0.9807618, 0.6671444, -2.242751, 1, 1, 1, 1, 1,
-0.9791996, 1.353305, 0.5497908, 0, 0, 1, 1, 1,
-0.978546, -0.1698645, -1.042231, 1, 0, 0, 1, 1,
-0.9785071, 1.627349, 1.891662, 1, 0, 0, 1, 1,
-0.9728026, -0.3416294, -2.790134, 1, 0, 0, 1, 1,
-0.9650226, 1.207529, 0.07749917, 1, 0, 0, 1, 1,
-0.9641273, -1.82462, -3.118987, 1, 0, 0, 1, 1,
-0.9581836, 1.417366, -1.219954, 0, 0, 0, 1, 1,
-0.9520417, 1.623989, -0.8712, 0, 0, 0, 1, 1,
-0.9503239, -0.6310289, -3.696605, 0, 0, 0, 1, 1,
-0.9501007, 1.805142, -1.295542, 0, 0, 0, 1, 1,
-0.9496607, 0.2647623, 0.1760369, 0, 0, 0, 1, 1,
-0.9492373, 0.633222, -1.622778, 0, 0, 0, 1, 1,
-0.94175, -1.166655, -4.382179, 0, 0, 0, 1, 1,
-0.9335182, 0.6624396, -1.529536, 1, 1, 1, 1, 1,
-0.9318622, 0.6610015, -1.591092, 1, 1, 1, 1, 1,
-0.9283661, -0.5847728, -1.952173, 1, 1, 1, 1, 1,
-0.9275287, -0.4801373, -2.202994, 1, 1, 1, 1, 1,
-0.9269114, -0.1954588, -1.651788, 1, 1, 1, 1, 1,
-0.9258227, -0.4407819, -1.848098, 1, 1, 1, 1, 1,
-0.9239973, 0.6435066, -3.312243, 1, 1, 1, 1, 1,
-0.923638, -1.637027, -3.597856, 1, 1, 1, 1, 1,
-0.9217532, -1.139173, -1.349952, 1, 1, 1, 1, 1,
-0.9210069, -1.084254, -3.377324, 1, 1, 1, 1, 1,
-0.9173852, 0.03346529, 0.6615633, 1, 1, 1, 1, 1,
-0.9146747, -0.04136105, -3.818212, 1, 1, 1, 1, 1,
-0.9097677, -0.4216627, -1.638906, 1, 1, 1, 1, 1,
-0.9096108, -2.033092, -1.719156, 1, 1, 1, 1, 1,
-0.900339, 1.339586, -1.065262, 1, 1, 1, 1, 1,
-0.9001785, 0.949742, -1.132783, 0, 0, 1, 1, 1,
-0.8946496, -0.3163893, -1.408035, 1, 0, 0, 1, 1,
-0.8943172, -0.2952565, -1.500234, 1, 0, 0, 1, 1,
-0.8914834, -0.8433651, -3.456879, 1, 0, 0, 1, 1,
-0.8827224, 0.7768373, -2.126835, 1, 0, 0, 1, 1,
-0.8819239, -1.075358, -2.860106, 1, 0, 0, 1, 1,
-0.8751706, 0.4788848, -0.4561091, 0, 0, 0, 1, 1,
-0.8739511, 0.1243418, 0.5336082, 0, 0, 0, 1, 1,
-0.8679522, 0.2055767, 0.04319029, 0, 0, 0, 1, 1,
-0.8654316, -0.30536, -0.6080285, 0, 0, 0, 1, 1,
-0.8587022, -0.4307876, -2.225231, 0, 0, 0, 1, 1,
-0.8518338, -0.8348936, -2.337435, 0, 0, 0, 1, 1,
-0.8430353, -0.5513583, -0.7167217, 0, 0, 0, 1, 1,
-0.8406702, -1.702606, -3.777297, 1, 1, 1, 1, 1,
-0.8390668, -0.3982123, -2.303149, 1, 1, 1, 1, 1,
-0.8382465, -0.9726769, -2.872422, 1, 1, 1, 1, 1,
-0.8298344, 1.053945, -1.340358, 1, 1, 1, 1, 1,
-0.8275063, 0.1819934, 0.9041671, 1, 1, 1, 1, 1,
-0.8269709, 0.511093, -1.497829, 1, 1, 1, 1, 1,
-0.8238949, 1.077836, -0.5529751, 1, 1, 1, 1, 1,
-0.8232919, 0.02108915, -1.172382, 1, 1, 1, 1, 1,
-0.8138589, -0.6118882, -1.414362, 1, 1, 1, 1, 1,
-0.8063412, 1.315382, -0.9085687, 1, 1, 1, 1, 1,
-0.8026271, -0.06967121, 0.04304795, 1, 1, 1, 1, 1,
-0.8013333, -0.1936432, -1.952028, 1, 1, 1, 1, 1,
-0.7983075, -0.4078974, -3.639705, 1, 1, 1, 1, 1,
-0.7980326, 0.5181713, -0.6426595, 1, 1, 1, 1, 1,
-0.7978181, -1.688074, -2.642993, 1, 1, 1, 1, 1,
-0.7962133, -0.3377013, -1.580394, 0, 0, 1, 1, 1,
-0.7937917, -0.4808981, -2.325609, 1, 0, 0, 1, 1,
-0.7914463, -0.2484286, -0.9487743, 1, 0, 0, 1, 1,
-0.7884994, -0.3296414, -1.746949, 1, 0, 0, 1, 1,
-0.7786152, 0.1282488, -1.156032, 1, 0, 0, 1, 1,
-0.7782951, -1.193735, -2.107892, 1, 0, 0, 1, 1,
-0.775847, -2.039157, -3.960989, 0, 0, 0, 1, 1,
-0.77254, -0.127601, -0.7522472, 0, 0, 0, 1, 1,
-0.7699636, 1.659275, 1.007446, 0, 0, 0, 1, 1,
-0.7697686, 0.4845924, -1.672416, 0, 0, 0, 1, 1,
-0.7694862, 0.09852674, -2.859485, 0, 0, 0, 1, 1,
-0.7653305, -0.05050838, 0.5140023, 0, 0, 0, 1, 1,
-0.7607642, -0.07883465, -0.3610449, 0, 0, 0, 1, 1,
-0.7560916, -0.003807804, -2.031497, 1, 1, 1, 1, 1,
-0.7560887, -0.008966041, -1.113804, 1, 1, 1, 1, 1,
-0.7473902, 0.2841797, -0.6430457, 1, 1, 1, 1, 1,
-0.7469835, -0.1133238, -1.045307, 1, 1, 1, 1, 1,
-0.7416728, 1.340103, 0.3418856, 1, 1, 1, 1, 1,
-0.7389869, -1.027362, -3.407366, 1, 1, 1, 1, 1,
-0.7354445, -0.06552617, -1.75696, 1, 1, 1, 1, 1,
-0.7333236, 1.966611, -0.8162383, 1, 1, 1, 1, 1,
-0.7324305, -0.1572722, -2.856475, 1, 1, 1, 1, 1,
-0.7246215, -0.2917404, -3.544789, 1, 1, 1, 1, 1,
-0.7224247, -1.647075, -2.647966, 1, 1, 1, 1, 1,
-0.7218963, 0.5134718, -1.184543, 1, 1, 1, 1, 1,
-0.7185022, 0.2836996, -3.328721, 1, 1, 1, 1, 1,
-0.7182856, 1.141828, 0.3783546, 1, 1, 1, 1, 1,
-0.7179407, 0.3455882, -2.991363, 1, 1, 1, 1, 1,
-0.7164177, -0.6907178, -2.629586, 0, 0, 1, 1, 1,
-0.7047869, -0.4313288, -1.22088, 1, 0, 0, 1, 1,
-0.7032392, -0.6099713, -2.868509, 1, 0, 0, 1, 1,
-0.6988704, 0.9094095, -0.5291548, 1, 0, 0, 1, 1,
-0.697362, -0.5087556, -2.204556, 1, 0, 0, 1, 1,
-0.6967949, -1.343701, -3.659142, 1, 0, 0, 1, 1,
-0.6954292, 1.972699, -1.774426, 0, 0, 0, 1, 1,
-0.6946494, -1.003043, 0.3759547, 0, 0, 0, 1, 1,
-0.6864137, -0.7582915, -2.852682, 0, 0, 0, 1, 1,
-0.6863575, 1.302167, -0.5171972, 0, 0, 0, 1, 1,
-0.6862842, 0.3331824, -2.06786, 0, 0, 0, 1, 1,
-0.683579, 0.617864, -0.6252754, 0, 0, 0, 1, 1,
-0.673355, 0.4301707, -1.549012, 0, 0, 0, 1, 1,
-0.6632514, 0.4717314, -2.087758, 1, 1, 1, 1, 1,
-0.6590182, -0.4077598, -1.761331, 1, 1, 1, 1, 1,
-0.6581708, -1.211857, -1.475492, 1, 1, 1, 1, 1,
-0.6580436, 0.09366901, -2.39212, 1, 1, 1, 1, 1,
-0.6560722, -0.6030921, -2.44994, 1, 1, 1, 1, 1,
-0.6556674, 0.16432, -1.309129, 1, 1, 1, 1, 1,
-0.6507747, 1.816451, -1.190439, 1, 1, 1, 1, 1,
-0.6502748, -0.3970021, -2.895885, 1, 1, 1, 1, 1,
-0.6472018, 1.526859, -1.663112, 1, 1, 1, 1, 1,
-0.6397665, 1.370412, 0.5833529, 1, 1, 1, 1, 1,
-0.6397414, 1.975884, -0.624723, 1, 1, 1, 1, 1,
-0.6334421, -0.1938892, -1.14339, 1, 1, 1, 1, 1,
-0.6313469, 0.7664996, -1.235138, 1, 1, 1, 1, 1,
-0.6301119, 0.7311013, -0.6797476, 1, 1, 1, 1, 1,
-0.6294448, 1.167842, -2.227122, 1, 1, 1, 1, 1,
-0.6289764, 0.6974463, -0.3005794, 0, 0, 1, 1, 1,
-0.6224077, 0.002656921, -2.184196, 1, 0, 0, 1, 1,
-0.6138902, -0.03813109, -3.004852, 1, 0, 0, 1, 1,
-0.6136364, 0.746607, -0.8797511, 1, 0, 0, 1, 1,
-0.6134424, 1.768533, -1.373389, 1, 0, 0, 1, 1,
-0.6125889, -0.1646078, -0.3349181, 1, 0, 0, 1, 1,
-0.6124818, -0.5230389, -3.978674, 0, 0, 0, 1, 1,
-0.6101307, 1.038983, -0.3131086, 0, 0, 0, 1, 1,
-0.6097524, 1.120289, -2.122733, 0, 0, 0, 1, 1,
-0.6093803, -0.7407948, -1.534738, 0, 0, 0, 1, 1,
-0.6077875, -1.382188, -1.031047, 0, 0, 0, 1, 1,
-0.6035936, -0.4741344, -3.12041, 0, 0, 0, 1, 1,
-0.6026183, 0.1365507, -0.4818276, 0, 0, 0, 1, 1,
-0.5971072, -0.3935047, -1.444977, 1, 1, 1, 1, 1,
-0.5970163, 1.240915, -0.3982271, 1, 1, 1, 1, 1,
-0.59439, -3.119905, -2.444034, 1, 1, 1, 1, 1,
-0.5904475, 1.950206, -1.2055, 1, 1, 1, 1, 1,
-0.5837771, 1.659493, 1.238786, 1, 1, 1, 1, 1,
-0.5799, -0.7689551, -0.1420757, 1, 1, 1, 1, 1,
-0.5798431, 0.3524097, -0.006944405, 1, 1, 1, 1, 1,
-0.5717498, -1.994135, -2.513973, 1, 1, 1, 1, 1,
-0.5686784, -0.126559, -1.535058, 1, 1, 1, 1, 1,
-0.5683299, -2.714015, -3.86999, 1, 1, 1, 1, 1,
-0.5669388, 1.133169, -0.01686967, 1, 1, 1, 1, 1,
-0.5651882, -2.107369, -3.066977, 1, 1, 1, 1, 1,
-0.5643786, 0.3020551, 1.104392, 1, 1, 1, 1, 1,
-0.5641748, 0.2322906, -1.262456, 1, 1, 1, 1, 1,
-0.5635124, 0.6587511, 0.4220836, 1, 1, 1, 1, 1,
-0.5577663, -0.2032796, -2.539426, 0, 0, 1, 1, 1,
-0.553808, 0.380122, 0.2494169, 1, 0, 0, 1, 1,
-0.5397462, -2.143758, -2.513498, 1, 0, 0, 1, 1,
-0.5381801, -1.240384, -3.549129, 1, 0, 0, 1, 1,
-0.537811, 1.040972, -0.8254189, 1, 0, 0, 1, 1,
-0.5377867, 1.120607, 1.227714, 1, 0, 0, 1, 1,
-0.5317063, -0.5628763, -3.160383, 0, 0, 0, 1, 1,
-0.5316573, 0.06308694, 0.159456, 0, 0, 0, 1, 1,
-0.5254961, -0.06813996, 0.2486088, 0, 0, 0, 1, 1,
-0.5237424, 0.5950819, -0.6257455, 0, 0, 0, 1, 1,
-0.5227185, -0.445593, -0.5552925, 0, 0, 0, 1, 1,
-0.519708, 0.7592981, -1.249428, 0, 0, 0, 1, 1,
-0.5196272, 2.408605, 0.1679292, 0, 0, 0, 1, 1,
-0.5117941, -0.09950335, -2.205184, 1, 1, 1, 1, 1,
-0.5089413, -0.8155187, -2.580082, 1, 1, 1, 1, 1,
-0.5043681, -1.287329, -2.169099, 1, 1, 1, 1, 1,
-0.5009087, 0.1162237, 0.6046029, 1, 1, 1, 1, 1,
-0.4983894, -0.1330932, -2.113798, 1, 1, 1, 1, 1,
-0.4915501, -1.110395, -2.268795, 1, 1, 1, 1, 1,
-0.4880945, 1.658284, -0.9034947, 1, 1, 1, 1, 1,
-0.4815283, -0.185669, -0.8545239, 1, 1, 1, 1, 1,
-0.4745489, 1.92768, 1.052857, 1, 1, 1, 1, 1,
-0.4712645, -1.667633, -2.225914, 1, 1, 1, 1, 1,
-0.4671974, 0.161269, -2.350055, 1, 1, 1, 1, 1,
-0.4659291, -0.2716241, -0.4366097, 1, 1, 1, 1, 1,
-0.4638918, 0.2575893, -2.591071, 1, 1, 1, 1, 1,
-0.4553598, -1.792506, -3.319705, 1, 1, 1, 1, 1,
-0.4498185, -0.6484884, -2.994081, 1, 1, 1, 1, 1,
-0.4493099, -1.240127, -4.403585, 0, 0, 1, 1, 1,
-0.4448565, 2.043841, 0.3832679, 1, 0, 0, 1, 1,
-0.4407965, 1.920923, -0.1746496, 1, 0, 0, 1, 1,
-0.4370489, 0.639027, -0.9922737, 1, 0, 0, 1, 1,
-0.4365301, 0.3751405, -0.5877784, 1, 0, 0, 1, 1,
-0.4346078, -2.682814, -0.1986127, 1, 0, 0, 1, 1,
-0.4333749, 0.1986766, -2.198405, 0, 0, 0, 1, 1,
-0.4304549, -1.528378, -4.685965, 0, 0, 0, 1, 1,
-0.4290351, 0.2954128, 0.5696137, 0, 0, 0, 1, 1,
-0.4271688, -0.03679768, -1.984368, 0, 0, 0, 1, 1,
-0.4249444, -0.04319175, -1.778469, 0, 0, 0, 1, 1,
-0.4190091, -0.5706758, -2.763299, 0, 0, 0, 1, 1,
-0.4175355, 0.4675038, -1.531251, 0, 0, 0, 1, 1,
-0.415931, -1.566731, -2.523323, 1, 1, 1, 1, 1,
-0.4038337, 2.054539, -0.7800412, 1, 1, 1, 1, 1,
-0.4034979, -0.5624333, -3.718368, 1, 1, 1, 1, 1,
-0.4014358, -0.4260387, -2.757812, 1, 1, 1, 1, 1,
-0.3995236, -0.3441823, -2.568408, 1, 1, 1, 1, 1,
-0.3985519, -0.01654544, -1.854037, 1, 1, 1, 1, 1,
-0.3951218, 1.219178, -0.5594809, 1, 1, 1, 1, 1,
-0.3843778, 0.7984533, 0.497608, 1, 1, 1, 1, 1,
-0.3791932, 0.4301244, -1.549297, 1, 1, 1, 1, 1,
-0.3779396, 0.4299771, -0.889871, 1, 1, 1, 1, 1,
-0.3770595, -1.514558, -3.676458, 1, 1, 1, 1, 1,
-0.3723154, -1.628849, -1.373237, 1, 1, 1, 1, 1,
-0.3698845, 0.9664328, -1.350629, 1, 1, 1, 1, 1,
-0.3663142, 0.3741566, -0.6349471, 1, 1, 1, 1, 1,
-0.3613367, 0.01378163, -1.938299, 1, 1, 1, 1, 1,
-0.3538868, -0.1721145, -2.178123, 0, 0, 1, 1, 1,
-0.3538256, -0.9152222, -2.005664, 1, 0, 0, 1, 1,
-0.3537275, -1.310688, -1.90562, 1, 0, 0, 1, 1,
-0.3478522, -1.177492, -2.084283, 1, 0, 0, 1, 1,
-0.3381447, 0.257489, -0.2417723, 1, 0, 0, 1, 1,
-0.3314523, 0.7487022, -1.560603, 1, 0, 0, 1, 1,
-0.3268554, -0.8391573, -2.906693, 0, 0, 0, 1, 1,
-0.3248949, 1.866026, 0.2650386, 0, 0, 0, 1, 1,
-0.3240051, 1.186515, 0.2428476, 0, 0, 0, 1, 1,
-0.3195011, 0.5357113, 0.5728384, 0, 0, 0, 1, 1,
-0.3168081, 0.4619347, 0.3792995, 0, 0, 0, 1, 1,
-0.3109423, 0.07146616, -1.691974, 0, 0, 0, 1, 1,
-0.3091703, 0.8576924, -1.920449, 0, 0, 0, 1, 1,
-0.304478, -0.8115795, -1.900862, 1, 1, 1, 1, 1,
-0.303733, -0.1939076, -1.06422, 1, 1, 1, 1, 1,
-0.2978038, 0.2083184, -1.1701, 1, 1, 1, 1, 1,
-0.292367, 2.832154, 0.4852475, 1, 1, 1, 1, 1,
-0.2902298, 1.531923, -0.2356399, 1, 1, 1, 1, 1,
-0.289478, -0.366827, -1.862048, 1, 1, 1, 1, 1,
-0.2880325, -2.099787, -3.0517, 1, 1, 1, 1, 1,
-0.2872039, -1.226481, -5.526677, 1, 1, 1, 1, 1,
-0.284901, -1.556738, -3.630507, 1, 1, 1, 1, 1,
-0.2793294, -1.641922, -1.826197, 1, 1, 1, 1, 1,
-0.2776996, -0.8400511, -1.631557, 1, 1, 1, 1, 1,
-0.2764908, -1.296068, -1.707572, 1, 1, 1, 1, 1,
-0.2725354, -0.3207905, -2.702914, 1, 1, 1, 1, 1,
-0.2714682, 0.359812, 0.7369403, 1, 1, 1, 1, 1,
-0.2665234, -0.09900997, -1.532191, 1, 1, 1, 1, 1,
-0.2654064, -1.463339, -2.221708, 0, 0, 1, 1, 1,
-0.2650191, -0.6123658, -0.9062157, 1, 0, 0, 1, 1,
-0.2594638, -0.1299446, -2.863127, 1, 0, 0, 1, 1,
-0.2572941, -2.412556, -3.471863, 1, 0, 0, 1, 1,
-0.2546103, 0.1000742, -0.5158894, 1, 0, 0, 1, 1,
-0.2540596, -2.558934, -3.558412, 1, 0, 0, 1, 1,
-0.2528511, 0.5504467, -0.1354185, 0, 0, 0, 1, 1,
-0.2522696, -0.4731476, -3.684832, 0, 0, 0, 1, 1,
-0.2495594, 0.68514, -0.7641852, 0, 0, 0, 1, 1,
-0.2472549, 0.950601, 0.05990465, 0, 0, 0, 1, 1,
-0.247016, 0.6765975, 1.269536, 0, 0, 0, 1, 1,
-0.2464768, 0.2409068, -0.7547693, 0, 0, 0, 1, 1,
-0.2446876, 0.1690081, -1.941338, 0, 0, 0, 1, 1,
-0.2429448, 0.7958264, 0.8420656, 1, 1, 1, 1, 1,
-0.2424846, 0.002548592, -1.546293, 1, 1, 1, 1, 1,
-0.2421797, 0.5148959, 1.738073, 1, 1, 1, 1, 1,
-0.2395156, -0.6138741, -2.544517, 1, 1, 1, 1, 1,
-0.2386828, -2.114451, -2.213505, 1, 1, 1, 1, 1,
-0.2330711, 1.52485, -2.661567, 1, 1, 1, 1, 1,
-0.2258879, 2.159562, -0.525835, 1, 1, 1, 1, 1,
-0.2205361, -0.5425352, -3.015098, 1, 1, 1, 1, 1,
-0.2188238, 1.370189, -2.781713, 1, 1, 1, 1, 1,
-0.2169754, 0.6380743, 1.081088, 1, 1, 1, 1, 1,
-0.2162392, -0.03883973, -4.092483, 1, 1, 1, 1, 1,
-0.2127504, 1.336079, -2.136428, 1, 1, 1, 1, 1,
-0.2114472, 0.03236993, -1.108129, 1, 1, 1, 1, 1,
-0.2072237, 0.7968852, -0.01522925, 1, 1, 1, 1, 1,
-0.2059705, 1.713184, 0.8283795, 1, 1, 1, 1, 1,
-0.2042121, 0.4281583, -1.152511, 0, 0, 1, 1, 1,
-0.1984058, -0.2236608, -2.836516, 1, 0, 0, 1, 1,
-0.1900028, -1.226686, -4.500717, 1, 0, 0, 1, 1,
-0.1885233, 1.623915, -0.2561705, 1, 0, 0, 1, 1,
-0.1881408, 0.5961709, -0.1295293, 1, 0, 0, 1, 1,
-0.1880258, 0.6748046, 0.03773432, 1, 0, 0, 1, 1,
-0.1877108, 0.2549541, -3.176647, 0, 0, 0, 1, 1,
-0.1819988, 1.126667, -0.6846721, 0, 0, 0, 1, 1,
-0.180654, -0.05166616, -2.058544, 0, 0, 0, 1, 1,
-0.1783526, 1.191612, 0.5923697, 0, 0, 0, 1, 1,
-0.1747591, -0.9988233, -3.120768, 0, 0, 0, 1, 1,
-0.1706594, -0.4523954, -2.43073, 0, 0, 0, 1, 1,
-0.1678389, -0.1219442, -0.6456347, 0, 0, 0, 1, 1,
-0.1673112, 0.3493384, -0.1261605, 1, 1, 1, 1, 1,
-0.1643878, -0.06842979, -0.4569227, 1, 1, 1, 1, 1,
-0.1641209, -0.4940385, -1.95949, 1, 1, 1, 1, 1,
-0.1599106, -0.7251372, -2.270624, 1, 1, 1, 1, 1,
-0.1554624, 0.9905263, 1.756307, 1, 1, 1, 1, 1,
-0.1530193, 1.608183, -0.09417777, 1, 1, 1, 1, 1,
-0.152689, 0.5322744, 0.1235079, 1, 1, 1, 1, 1,
-0.1488884, -0.7032226, -1.510517, 1, 1, 1, 1, 1,
-0.1463078, 2.140043, -0.3224958, 1, 1, 1, 1, 1,
-0.1455733, 1.376027, -0.7211376, 1, 1, 1, 1, 1,
-0.1444817, 1.007494, -0.4667973, 1, 1, 1, 1, 1,
-0.1443662, 0.5780379, -0.9330869, 1, 1, 1, 1, 1,
-0.1395676, 1.802832, -2.188307, 1, 1, 1, 1, 1,
-0.1382514, -0.4088696, -2.217193, 1, 1, 1, 1, 1,
-0.1355171, 0.5768979, -0.2208459, 1, 1, 1, 1, 1,
-0.1341568, 1.893203, -1.893972, 0, 0, 1, 1, 1,
-0.1291949, -1.385914, -2.466593, 1, 0, 0, 1, 1,
-0.1286573, 0.8222244, -0.8487131, 1, 0, 0, 1, 1,
-0.1275632, 1.038881, -1.160327, 1, 0, 0, 1, 1,
-0.1250783, -0.3562683, -3.472781, 1, 0, 0, 1, 1,
-0.122061, 0.3101547, -0.4937813, 1, 0, 0, 1, 1,
-0.1208097, -0.4730099, -2.671927, 0, 0, 0, 1, 1,
-0.1207465, 0.0296535, 2.039426, 0, 0, 0, 1, 1,
-0.1184844, -0.5025227, -0.9905193, 0, 0, 0, 1, 1,
-0.1183288, -0.2555616, -1.660144, 0, 0, 0, 1, 1,
-0.1170074, -1.853229, -3.262708, 0, 0, 0, 1, 1,
-0.1137115, 0.0209542, 0.1791951, 0, 0, 0, 1, 1,
-0.112332, -1.768883, -4.880541, 0, 0, 0, 1, 1,
-0.1104573, 0.4621069, -0.9751191, 1, 1, 1, 1, 1,
-0.1102601, -1.015275, -0.9754322, 1, 1, 1, 1, 1,
-0.1102031, -0.5263654, -3.070484, 1, 1, 1, 1, 1,
-0.107405, -0.832608, -2.61497, 1, 1, 1, 1, 1,
-0.1051593, 0.642562, -1.28721, 1, 1, 1, 1, 1,
-0.1015401, -0.1793161, -2.086642, 1, 1, 1, 1, 1,
-0.100175, -2.163749, -4.425522, 1, 1, 1, 1, 1,
-0.09995567, -0.5348338, -1.988105, 1, 1, 1, 1, 1,
-0.09950064, 0.3675689, -0.8884479, 1, 1, 1, 1, 1,
-0.09783983, 1.131222, -1.208025, 1, 1, 1, 1, 1,
-0.09616917, -0.4926948, -4.753422, 1, 1, 1, 1, 1,
-0.09486806, -1.54029, -2.928181, 1, 1, 1, 1, 1,
-0.09466299, -0.6479982, -3.880092, 1, 1, 1, 1, 1,
-0.09435286, 0.8216072, -1.037148, 1, 1, 1, 1, 1,
-0.09293097, -0.5461068, -4.197776, 1, 1, 1, 1, 1,
-0.0914811, -0.4753738, -3.040318, 0, 0, 1, 1, 1,
-0.08866904, -1.060083, -3.045499, 1, 0, 0, 1, 1,
-0.08824275, 0.1806061, -0.6000956, 1, 0, 0, 1, 1,
-0.08720428, -0.08965264, -2.639648, 1, 0, 0, 1, 1,
-0.08669277, -1.620175, -2.970368, 1, 0, 0, 1, 1,
-0.08658905, -0.05485058, -2.351417, 1, 0, 0, 1, 1,
-0.08603452, 0.9923555, -0.07127189, 0, 0, 0, 1, 1,
-0.08553662, 0.2190275, -1.092004, 0, 0, 0, 1, 1,
-0.08398975, 1.39368, -0.8805963, 0, 0, 0, 1, 1,
-0.08331014, -0.6976315, -4.590201, 0, 0, 0, 1, 1,
-0.07315662, -0.5329382, -3.124949, 0, 0, 0, 1, 1,
-0.07162707, 0.120082, -0.8409851, 0, 0, 0, 1, 1,
-0.07139821, -0.7419193, -4.828868, 0, 0, 0, 1, 1,
-0.06863013, 2.917367, -1.001562, 1, 1, 1, 1, 1,
-0.06720386, 1.033919, 1.525574, 1, 1, 1, 1, 1,
-0.06583796, -0.858954, -2.136877, 1, 1, 1, 1, 1,
-0.06487208, 0.4359405, 0.06037797, 1, 1, 1, 1, 1,
-0.06405689, 0.6426035, 2.071191, 1, 1, 1, 1, 1,
-0.061959, -1.599719, -3.209449, 1, 1, 1, 1, 1,
-0.06120682, 0.7451448, -0.7904015, 1, 1, 1, 1, 1,
-0.05955661, 0.7990591, -0.5353749, 1, 1, 1, 1, 1,
-0.05737694, 0.7699882, 0.6686642, 1, 1, 1, 1, 1,
-0.05624507, 0.4210605, 0.6244245, 1, 1, 1, 1, 1,
-0.05078367, -0.1794935, -2.491449, 1, 1, 1, 1, 1,
-0.05071309, 0.1425957, -1.143522, 1, 1, 1, 1, 1,
-0.0499642, 1.401479, 0.1632595, 1, 1, 1, 1, 1,
-0.04863619, 2.003459, 0.9379864, 1, 1, 1, 1, 1,
-0.04672392, 2.488703, -0.4257538, 1, 1, 1, 1, 1,
-0.04656025, -0.1449049, -1.663153, 0, 0, 1, 1, 1,
-0.04637904, -0.9396253, -3.156633, 1, 0, 0, 1, 1,
-0.039149, -2.290494, -3.364938, 1, 0, 0, 1, 1,
-0.03590384, 0.6797363, -0.8967079, 1, 0, 0, 1, 1,
-0.03382612, 0.1931005, 0.6028478, 1, 0, 0, 1, 1,
-0.02718487, -1.069099, -4.069556, 1, 0, 0, 1, 1,
-0.02632081, -0.9268008, -3.739249, 0, 0, 0, 1, 1,
-0.02498513, -0.6733091, -2.151935, 0, 0, 0, 1, 1,
-0.02327285, -1.660138, -3.952215, 0, 0, 0, 1, 1,
-0.02213871, 0.288586, -0.145979, 0, 0, 0, 1, 1,
-0.02069709, 0.1680036, 0.1311506, 0, 0, 0, 1, 1,
-0.0190263, 0.3659403, 0.01567684, 0, 0, 0, 1, 1,
-0.01604775, -1.773747, -4.582301, 0, 0, 0, 1, 1,
-0.01556596, 0.3607617, 0.2707432, 1, 1, 1, 1, 1,
-0.01489915, 1.59844, -1.04682, 1, 1, 1, 1, 1,
-0.01463273, -0.8719067, -4.61982, 1, 1, 1, 1, 1,
-0.01430092, -0.3075547, -2.534904, 1, 1, 1, 1, 1,
-0.01402628, 0.9858767, -0.8072333, 1, 1, 1, 1, 1,
-0.01302997, -0.3615581, -1.794824, 1, 1, 1, 1, 1,
-0.01214278, -0.2236526, -2.946811, 1, 1, 1, 1, 1,
-0.009690952, -0.2935969, -3.0007, 1, 1, 1, 1, 1,
-0.007715057, 0.2979091, -2.47544, 1, 1, 1, 1, 1,
-0.007549964, -0.7496408, -1.763188, 1, 1, 1, 1, 1,
-0.00652026, -2.16001, -2.937064, 1, 1, 1, 1, 1,
-0.0003522738, -0.7260644, -2.847487, 1, 1, 1, 1, 1,
-6.833151e-05, -1.018223, -2.481172, 1, 1, 1, 1, 1,
0.001636617, -0.4606194, 2.950522, 1, 1, 1, 1, 1,
0.003770505, -0.850574, 2.414721, 1, 1, 1, 1, 1,
0.004213401, -0.5705956, 4.536699, 0, 0, 1, 1, 1,
0.009041049, 0.129628, -0.4050453, 1, 0, 0, 1, 1,
0.00909061, -1.535098, 1.771997, 1, 0, 0, 1, 1,
0.01495159, -0.001394224, 1.584251, 1, 0, 0, 1, 1,
0.01567325, 0.7958751, -0.06146699, 1, 0, 0, 1, 1,
0.01793058, -0.3950512, 2.018465, 1, 0, 0, 1, 1,
0.03020835, 0.4545991, -2.209996, 0, 0, 0, 1, 1,
0.0380587, -0.8291758, 3.597176, 0, 0, 0, 1, 1,
0.04023486, -0.8571372, 4.360843, 0, 0, 0, 1, 1,
0.04103626, -0.5718626, 4.432904, 0, 0, 0, 1, 1,
0.04220001, -1.010833, 3.596958, 0, 0, 0, 1, 1,
0.04316658, -0.8879279, 3.658024, 0, 0, 0, 1, 1,
0.04465092, 1.21942, 0.6757956, 0, 0, 0, 1, 1,
0.04524289, 0.7730189, 1.093272, 1, 1, 1, 1, 1,
0.04675053, -0.172976, 3.351393, 1, 1, 1, 1, 1,
0.05195757, -0.4601223, 1.652878, 1, 1, 1, 1, 1,
0.05334734, -0.2338432, 2.994831, 1, 1, 1, 1, 1,
0.0561708, -1.363859, 1.947036, 1, 1, 1, 1, 1,
0.05656525, -0.9173246, 3.406923, 1, 1, 1, 1, 1,
0.05907341, 0.4131112, 2.618562, 1, 1, 1, 1, 1,
0.06095438, 0.3049327, 0.09965447, 1, 1, 1, 1, 1,
0.06179012, -1.782715, 1.879593, 1, 1, 1, 1, 1,
0.06266102, -1.008924, 3.311049, 1, 1, 1, 1, 1,
0.0648063, -0.6136097, 3.202377, 1, 1, 1, 1, 1,
0.06604414, -0.1255912, 4.425256, 1, 1, 1, 1, 1,
0.07054487, 0.9740309, 1.78466, 1, 1, 1, 1, 1,
0.07399309, 1.538166, -0.1895587, 1, 1, 1, 1, 1,
0.08093275, -0.2337075, 3.066169, 1, 1, 1, 1, 1,
0.09237523, 0.4956861, -1.752631, 0, 0, 1, 1, 1,
0.09386882, -0.5723611, 3.797776, 1, 0, 0, 1, 1,
0.09464402, 1.069115, 1.370288, 1, 0, 0, 1, 1,
0.09508236, -0.09800306, 2.775582, 1, 0, 0, 1, 1,
0.09584536, -0.1642873, 2.527993, 1, 0, 0, 1, 1,
0.1002604, -0.5575959, 4.289943, 1, 0, 0, 1, 1,
0.1068344, -0.664367, 3.384771, 0, 0, 0, 1, 1,
0.107277, 1.55759, -2.472862, 0, 0, 0, 1, 1,
0.1106613, -1.420404, 3.470936, 0, 0, 0, 1, 1,
0.1129185, -0.5441062, 2.614651, 0, 0, 0, 1, 1,
0.1141295, -0.308342, 1.961454, 0, 0, 0, 1, 1,
0.1165227, -1.083411, 4.118324, 0, 0, 0, 1, 1,
0.1166389, -2.603512, 2.676545, 0, 0, 0, 1, 1,
0.1185799, 0.7792329, -0.4270507, 1, 1, 1, 1, 1,
0.1201974, 1.106962, 0.1223791, 1, 1, 1, 1, 1,
0.1220925, 0.860788, -0.9381322, 1, 1, 1, 1, 1,
0.1258715, -0.366068, 2.643492, 1, 1, 1, 1, 1,
0.1296338, -0.1166982, 2.317106, 1, 1, 1, 1, 1,
0.1296993, 0.4134116, 1.992112, 1, 1, 1, 1, 1,
0.1340475, -1.453373, 3.89652, 1, 1, 1, 1, 1,
0.1341682, 1.768747, -1.138695, 1, 1, 1, 1, 1,
0.1345714, 0.2108141, 0.9467769, 1, 1, 1, 1, 1,
0.1361317, 0.1789289, 0.3598334, 1, 1, 1, 1, 1,
0.1384828, 0.209636, 0.6184236, 1, 1, 1, 1, 1,
0.1385893, -2.175767, 3.869765, 1, 1, 1, 1, 1,
0.1400509, 1.232872, 0.5611587, 1, 1, 1, 1, 1,
0.1410246, 1.014111, -0.7785655, 1, 1, 1, 1, 1,
0.1414842, 0.07874514, 2.992958, 1, 1, 1, 1, 1,
0.1443095, -0.2689112, 2.587744, 0, 0, 1, 1, 1,
0.1457842, 1.232776, 0.1798868, 1, 0, 0, 1, 1,
0.147372, 1.090896, 1.368997, 1, 0, 0, 1, 1,
0.152824, -0.395817, 2.905469, 1, 0, 0, 1, 1,
0.1572676, -0.5878463, 1.533934, 1, 0, 0, 1, 1,
0.1602052, -2.657282, 4.138369, 1, 0, 0, 1, 1,
0.1642365, -2.279821, 3.744799, 0, 0, 0, 1, 1,
0.1646355, 1.21757, 0.6453693, 0, 0, 0, 1, 1,
0.164684, -0.9594316, 4.081321, 0, 0, 0, 1, 1,
0.1739109, 0.2250992, 2.101625, 0, 0, 0, 1, 1,
0.1753244, 0.9825594, -0.3563041, 0, 0, 0, 1, 1,
0.1762511, 0.1813073, 0.6514253, 0, 0, 0, 1, 1,
0.1847575, 0.3309281, 0.6543535, 0, 0, 0, 1, 1,
0.1874543, 0.3631014, 3.148402, 1, 1, 1, 1, 1,
0.1876168, -0.5372855, 3.41615, 1, 1, 1, 1, 1,
0.1901052, -1.195098, 2.439537, 1, 1, 1, 1, 1,
0.1908282, 0.5450459, 0.7232395, 1, 1, 1, 1, 1,
0.1919515, -0.1958738, 3.323049, 1, 1, 1, 1, 1,
0.1943731, 1.024882, 1.355007, 1, 1, 1, 1, 1,
0.1957154, 0.7400836, -0.3766206, 1, 1, 1, 1, 1,
0.1957396, 1.101762, 0.5278007, 1, 1, 1, 1, 1,
0.1969188, 1.59426, 0.08109746, 1, 1, 1, 1, 1,
0.1973458, 0.02279831, 0.8096784, 1, 1, 1, 1, 1,
0.1977204, 0.9318656, -0.6163569, 1, 1, 1, 1, 1,
0.2060302, 1.159315, 0.2772204, 1, 1, 1, 1, 1,
0.2112903, 0.1626177, -0.01035512, 1, 1, 1, 1, 1,
0.2117123, 1.064933, 1.091549, 1, 1, 1, 1, 1,
0.2163051, -0.3192137, -0.5770416, 1, 1, 1, 1, 1,
0.2192196, 1.378923, -0.7138004, 0, 0, 1, 1, 1,
0.21945, -0.9710968, 2.719635, 1, 0, 0, 1, 1,
0.2206131, -1.43124, 2.981121, 1, 0, 0, 1, 1,
0.2220662, 1.032012, 1.609363, 1, 0, 0, 1, 1,
0.2255665, 1.742803, 0.415049, 1, 0, 0, 1, 1,
0.2261549, -0.7695467, 1.31025, 1, 0, 0, 1, 1,
0.2361643, -0.1215682, 3.847387, 0, 0, 0, 1, 1,
0.2391098, -1.920628, 4.315639, 0, 0, 0, 1, 1,
0.2397783, 0.9211376, 0.7088044, 0, 0, 0, 1, 1,
0.240608, -0.1048319, 2.164427, 0, 0, 0, 1, 1,
0.2465689, -1.846617, 3.065693, 0, 0, 0, 1, 1,
0.249981, -0.2199193, 3.381239, 0, 0, 0, 1, 1,
0.2518624, -0.8105068, 4.333617, 0, 0, 0, 1, 1,
0.2521045, 0.6032141, -0.08531109, 1, 1, 1, 1, 1,
0.2534319, 0.507746, -1.01178, 1, 1, 1, 1, 1,
0.260604, 0.4396054, -0.3369325, 1, 1, 1, 1, 1,
0.2627122, -0.7573785, 3.880127, 1, 1, 1, 1, 1,
0.2629099, 0.4536755, 1.632648, 1, 1, 1, 1, 1,
0.2648849, 0.246228, 1.101832, 1, 1, 1, 1, 1,
0.2675352, 1.60836, -1.672398, 1, 1, 1, 1, 1,
0.2685131, -0.7496908, 4.197408, 1, 1, 1, 1, 1,
0.2687707, -0.3018394, 2.879315, 1, 1, 1, 1, 1,
0.2728173, 0.3437755, 1.239745, 1, 1, 1, 1, 1,
0.2729979, 0.2652812, 1.387886, 1, 1, 1, 1, 1,
0.2743597, -0.4879703, 3.520793, 1, 1, 1, 1, 1,
0.2777391, 0.9637027, 2.198666, 1, 1, 1, 1, 1,
0.2789851, 1.441349, -0.3215044, 1, 1, 1, 1, 1,
0.28435, 0.4713173, 0.2758573, 1, 1, 1, 1, 1,
0.2886409, 1.607009, -0.2784627, 0, 0, 1, 1, 1,
0.2945042, -0.2922593, 0.5870422, 1, 0, 0, 1, 1,
0.2965174, 0.3906199, 1.898854, 1, 0, 0, 1, 1,
0.3011526, 0.6688125, -0.8628058, 1, 0, 0, 1, 1,
0.3043947, 0.5241535, 1.736279, 1, 0, 0, 1, 1,
0.3044734, -0.5866988, 4.166317, 1, 0, 0, 1, 1,
0.3083819, -0.501965, 1.676702, 0, 0, 0, 1, 1,
0.308788, -0.4121825, 1.696862, 0, 0, 0, 1, 1,
0.3110912, 0.4490976, 0.3010826, 0, 0, 0, 1, 1,
0.3144402, 0.1800665, 0.7516763, 0, 0, 0, 1, 1,
0.3148576, -1.224217, 1.526047, 0, 0, 0, 1, 1,
0.3152357, -0.1901469, 3.174448, 0, 0, 0, 1, 1,
0.3155464, -1.03751, 3.373267, 0, 0, 0, 1, 1,
0.3172302, 0.2500595, 1.056195, 1, 1, 1, 1, 1,
0.3185356, -0.5035135, 2.342211, 1, 1, 1, 1, 1,
0.3231601, 0.2430865, -0.1930745, 1, 1, 1, 1, 1,
0.3247492, -0.8516065, 1.913428, 1, 1, 1, 1, 1,
0.3265664, -0.8965207, -0.1333488, 1, 1, 1, 1, 1,
0.3268122, -2.162649, 0.8798313, 1, 1, 1, 1, 1,
0.3325923, 1.086908, 0.9947485, 1, 1, 1, 1, 1,
0.3366969, 1.141368, -0.4991503, 1, 1, 1, 1, 1,
0.3419668, -0.1978721, 1.44859, 1, 1, 1, 1, 1,
0.3471187, 1.188141, -0.6265871, 1, 1, 1, 1, 1,
0.3583198, -0.8131269, 1.62217, 1, 1, 1, 1, 1,
0.3584368, 0.7741541, -0.1114751, 1, 1, 1, 1, 1,
0.3613505, -2.374406, 3.656053, 1, 1, 1, 1, 1,
0.3686259, 1.094811, -0.1625532, 1, 1, 1, 1, 1,
0.3737657, 1.127717, 1.237755, 1, 1, 1, 1, 1,
0.3794446, -1.601606, 4.182411, 0, 0, 1, 1, 1,
0.3903953, 2.231214, 0.8128763, 1, 0, 0, 1, 1,
0.3913951, -0.7027439, 3.133702, 1, 0, 0, 1, 1,
0.3939233, -1.247645, 2.550344, 1, 0, 0, 1, 1,
0.3946662, 1.817846, -0.7346957, 1, 0, 0, 1, 1,
0.3982163, 0.5516707, 1.633223, 1, 0, 0, 1, 1,
0.4033597, 0.3208357, -0.3114684, 0, 0, 0, 1, 1,
0.4117, -1.222058, 2.021401, 0, 0, 0, 1, 1,
0.4174728, 2.908685, -0.6123583, 0, 0, 0, 1, 1,
0.4217537, -0.5463047, 4.191747, 0, 0, 0, 1, 1,
0.4223837, -0.7161813, 3.817455, 0, 0, 0, 1, 1,
0.4242678, -1.200158, 2.15315, 0, 0, 0, 1, 1,
0.4274773, -0.7636249, 1.435258, 0, 0, 0, 1, 1,
0.4283382, 0.3074172, 0.9518861, 1, 1, 1, 1, 1,
0.432305, -0.08051044, 2.374181, 1, 1, 1, 1, 1,
0.4447885, 0.5736334, 0.3024206, 1, 1, 1, 1, 1,
0.4474015, -0.7025394, 3.022562, 1, 1, 1, 1, 1,
0.448553, -1.373816, 1.510342, 1, 1, 1, 1, 1,
0.4512633, 0.1821012, 1.559765, 1, 1, 1, 1, 1,
0.4524907, 0.7248607, 1.485723, 1, 1, 1, 1, 1,
0.4538971, -0.461861, 1.925034, 1, 1, 1, 1, 1,
0.4579939, -0.6935372, 2.998903, 1, 1, 1, 1, 1,
0.458818, -0.2386252, 2.27155, 1, 1, 1, 1, 1,
0.4656434, 0.007810799, 1.912752, 1, 1, 1, 1, 1,
0.4696531, 0.5874534, 0.375339, 1, 1, 1, 1, 1,
0.4711317, 1.026628, -1.133079, 1, 1, 1, 1, 1,
0.4718249, 1.031054, -1.101581, 1, 1, 1, 1, 1,
0.4733055, -1.033974, 3.293566, 1, 1, 1, 1, 1,
0.4747748, 1.306514, -0.8290499, 0, 0, 1, 1, 1,
0.4792984, -0.3843554, 3.013087, 1, 0, 0, 1, 1,
0.4804796, 0.7614927, 0.0690946, 1, 0, 0, 1, 1,
0.4807927, -0.3317122, 1.463903, 1, 0, 0, 1, 1,
0.4856284, 0.1007609, 1.681978, 1, 0, 0, 1, 1,
0.4861904, -0.6770816, 1.15976, 1, 0, 0, 1, 1,
0.4867465, -0.2243658, 2.925907, 0, 0, 0, 1, 1,
0.4878284, 1.026985, -0.7214735, 0, 0, 0, 1, 1,
0.4925909, 2.090778, -0.8679721, 0, 0, 0, 1, 1,
0.4929758, 0.6175852, 0.6945276, 0, 0, 0, 1, 1,
0.49338, -0.07955606, 2.338243, 0, 0, 0, 1, 1,
0.4949526, 0.9274154, 1.158043, 0, 0, 0, 1, 1,
0.4957772, -1.896621, 3.232959, 0, 0, 0, 1, 1,
0.4960442, -0.5332094, 2.727293, 1, 1, 1, 1, 1,
0.4988409, 0.7126667, 0.2726786, 1, 1, 1, 1, 1,
0.4990713, -0.611055, 2.033623, 1, 1, 1, 1, 1,
0.5055133, 1.136568, 0.05258548, 1, 1, 1, 1, 1,
0.5076118, 0.05781361, 1.112756, 1, 1, 1, 1, 1,
0.5209326, -1.290125, 4.984482, 1, 1, 1, 1, 1,
0.5221545, 0.206643, 3.285198, 1, 1, 1, 1, 1,
0.5253564, -0.1157169, 1.576405, 1, 1, 1, 1, 1,
0.5283593, 0.07589518, 0.1583139, 1, 1, 1, 1, 1,
0.5288376, 0.3075476, 0.3627034, 1, 1, 1, 1, 1,
0.5302029, -1.076884, 3.59792, 1, 1, 1, 1, 1,
0.5334379, -1.410483, 2.41729, 1, 1, 1, 1, 1,
0.5353271, -0.7194255, 3.367813, 1, 1, 1, 1, 1,
0.5355071, 1.184994, 1.515202, 1, 1, 1, 1, 1,
0.5363748, -1.888595, 3.308319, 1, 1, 1, 1, 1,
0.5400074, 1.720441, -0.2619283, 0, 0, 1, 1, 1,
0.5414364, 0.2646172, 0.9209822, 1, 0, 0, 1, 1,
0.5502163, -1.966963, 1.644776, 1, 0, 0, 1, 1,
0.5529206, -0.2330159, 2.071682, 1, 0, 0, 1, 1,
0.5571045, -0.4622692, 2.610336, 1, 0, 0, 1, 1,
0.5597901, 0.4477786, -0.4166551, 1, 0, 0, 1, 1,
0.5624596, -1.334955, 3.490309, 0, 0, 0, 1, 1,
0.565439, 1.211993, -0.1931089, 0, 0, 0, 1, 1,
0.5681192, 1.034458, 1.937437, 0, 0, 0, 1, 1,
0.5692222, -2.305935, 0.8054594, 0, 0, 0, 1, 1,
0.574702, 0.6434154, 0.3834437, 0, 0, 0, 1, 1,
0.5768544, 0.571618, 0.5345826, 0, 0, 0, 1, 1,
0.5786414, -0.8489708, 0.1136371, 0, 0, 0, 1, 1,
0.5800081, -1.401416, 3.518396, 1, 1, 1, 1, 1,
0.580985, 1.913276, 0.9191722, 1, 1, 1, 1, 1,
0.5880632, -0.6209759, 2.468828, 1, 1, 1, 1, 1,
0.5919077, 0.6442659, 2.167518, 1, 1, 1, 1, 1,
0.5949746, -0.9768975, 2.773449, 1, 1, 1, 1, 1,
0.5986903, -1.603797, 3.554308, 1, 1, 1, 1, 1,
0.599601, 1.207372, 1.150939, 1, 1, 1, 1, 1,
0.6002921, 0.4060214, 2.471834, 1, 1, 1, 1, 1,
0.6048888, -0.2812864, 2.114733, 1, 1, 1, 1, 1,
0.6183198, 0.6057486, 1.910941, 1, 1, 1, 1, 1,
0.6290755, 0.8696591, 0.4154023, 1, 1, 1, 1, 1,
0.6300102, 0.6275974, 0.2966647, 1, 1, 1, 1, 1,
0.6304442, -0.02684007, 3.01175, 1, 1, 1, 1, 1,
0.6314675, -0.2530746, 2.866135, 1, 1, 1, 1, 1,
0.6353082, -1.017301, 0.7955986, 1, 1, 1, 1, 1,
0.635926, -1.760884, 3.952647, 0, 0, 1, 1, 1,
0.6381331, -0.1402315, 1.043754, 1, 0, 0, 1, 1,
0.6400669, -1.178155, 2.326028, 1, 0, 0, 1, 1,
0.6459681, -0.1739976, 1.341064, 1, 0, 0, 1, 1,
0.6481066, 0.02724733, 2.024026, 1, 0, 0, 1, 1,
0.6570124, 0.3359204, 2.296539, 1, 0, 0, 1, 1,
0.6588994, 0.1253982, 1.261602, 0, 0, 0, 1, 1,
0.666384, 0.9283372, 1.175085, 0, 0, 0, 1, 1,
0.6718188, -0.570611, 1.221707, 0, 0, 0, 1, 1,
0.6782123, 1.525383, 0.09211548, 0, 0, 0, 1, 1,
0.6809788, -0.5463347, 4.124438, 0, 0, 0, 1, 1,
0.6814804, -0.7520254, 1.344081, 0, 0, 0, 1, 1,
0.6876938, -0.1577265, 2.041341, 0, 0, 0, 1, 1,
0.6880616, -0.7593068, 2.648812, 1, 1, 1, 1, 1,
0.6933428, -0.1242653, 1.349519, 1, 1, 1, 1, 1,
0.693857, 0.3838162, 0.5718527, 1, 1, 1, 1, 1,
0.6952155, -0.1533596, 2.331093, 1, 1, 1, 1, 1,
0.6994271, -1.224741, 1.493717, 1, 1, 1, 1, 1,
0.6997917, -0.557314, 1.709313, 1, 1, 1, 1, 1,
0.7029802, 0.8367637, -0.3372597, 1, 1, 1, 1, 1,
0.7063719, 0.0779193, 1.019624, 1, 1, 1, 1, 1,
0.7105031, 0.4702231, 0.824312, 1, 1, 1, 1, 1,
0.7119832, 0.08885992, 2.029735, 1, 1, 1, 1, 1,
0.7137151, -0.4272271, 1.800714, 1, 1, 1, 1, 1,
0.7143714, -2.19959, 2.570301, 1, 1, 1, 1, 1,
0.7192959, 0.4713694, 0.8587527, 1, 1, 1, 1, 1,
0.7194307, -0.7698416, 3.060588, 1, 1, 1, 1, 1,
0.7220058, 0.3821476, 1.023752, 1, 1, 1, 1, 1,
0.7296857, -1.573049, 3.422426, 0, 0, 1, 1, 1,
0.7331218, -0.1677534, 1.655857, 1, 0, 0, 1, 1,
0.7365423, 0.09914984, 1.308962, 1, 0, 0, 1, 1,
0.7397768, -0.8048646, 2.865458, 1, 0, 0, 1, 1,
0.741068, -0.4649534, 2.03747, 1, 0, 0, 1, 1,
0.7421595, -1.14752, 2.168629, 1, 0, 0, 1, 1,
0.7426704, -0.6700368, 2.688802, 0, 0, 0, 1, 1,
0.7443121, -0.8245481, 2.282849, 0, 0, 0, 1, 1,
0.7458052, -1.507819, 2.600403, 0, 0, 0, 1, 1,
0.7470296, -0.006364479, 3.390824, 0, 0, 0, 1, 1,
0.7500715, -0.3808062, 1.75899, 0, 0, 0, 1, 1,
0.7522331, 0.5218231, 1.560732, 0, 0, 0, 1, 1,
0.7551485, 2.361117, -0.6923086, 0, 0, 0, 1, 1,
0.7553071, -0.4026363, 2.422966, 1, 1, 1, 1, 1,
0.7660347, -0.1843043, 2.861893, 1, 1, 1, 1, 1,
0.7719679, 0.2096976, 2.576355, 1, 1, 1, 1, 1,
0.7729779, 0.9753668, 0.05690569, 1, 1, 1, 1, 1,
0.7775674, 0.7194418, 0.6352949, 1, 1, 1, 1, 1,
0.7789799, -0.5124987, 3.57694, 1, 1, 1, 1, 1,
0.7791879, 1.033209, 1.14983, 1, 1, 1, 1, 1,
0.7910461, 0.9413716, 0.8683176, 1, 1, 1, 1, 1,
0.8061454, -0.3263841, 1.617337, 1, 1, 1, 1, 1,
0.8128027, 0.08480116, 1.017609, 1, 1, 1, 1, 1,
0.8141004, 0.2289335, 2.473195, 1, 1, 1, 1, 1,
0.8151468, 0.8927544, 1.048308, 1, 1, 1, 1, 1,
0.8156373, 0.3594611, -0.6113189, 1, 1, 1, 1, 1,
0.8177882, -0.2165702, 2.198993, 1, 1, 1, 1, 1,
0.8219571, 0.4948301, 1.407744, 1, 1, 1, 1, 1,
0.8291489, 0.9837931, 0.7038462, 0, 0, 1, 1, 1,
0.833809, 0.05930787, 1.730669, 1, 0, 0, 1, 1,
0.8500043, 1.880037, -0.1697931, 1, 0, 0, 1, 1,
0.8522087, -0.2518077, 1.301729, 1, 0, 0, 1, 1,
0.853686, -1.490069, 4.81092, 1, 0, 0, 1, 1,
0.8559155, -0.880218, 0.3643244, 1, 0, 0, 1, 1,
0.8589919, -0.8358645, 2.020816, 0, 0, 0, 1, 1,
0.861717, -0.4579069, 1.438151, 0, 0, 0, 1, 1,
0.8685539, 0.4174348, 1.720865, 0, 0, 0, 1, 1,
0.8693245, 2.526844, 1.442749, 0, 0, 0, 1, 1,
0.8726, -2.057942, 2.440915, 0, 0, 0, 1, 1,
0.8736253, -1.327683, 3.552856, 0, 0, 0, 1, 1,
0.8780048, -0.2791857, 1.947456, 0, 0, 0, 1, 1,
0.880048, 0.6473783, 1.332831, 1, 1, 1, 1, 1,
0.8838044, 0.1728051, 0.9197851, 1, 1, 1, 1, 1,
0.8855541, -0.699249, 3.165498, 1, 1, 1, 1, 1,
0.8875862, -0.02915839, 0.4192062, 1, 1, 1, 1, 1,
0.8941346, 0.5673553, 1.297789, 1, 1, 1, 1, 1,
0.8950434, -0.3222632, 2.321787, 1, 1, 1, 1, 1,
0.8972979, -0.1296885, 0.4392305, 1, 1, 1, 1, 1,
0.9007014, 0.2762885, 0.5487168, 1, 1, 1, 1, 1,
0.9048715, -1.357168, 4.090029, 1, 1, 1, 1, 1,
0.9060352, -0.7856548, 1.427591, 1, 1, 1, 1, 1,
0.9094313, 0.446339, -0.7469368, 1, 1, 1, 1, 1,
0.9106719, 2.048897, -0.4903897, 1, 1, 1, 1, 1,
0.9130594, 0.3840432, 2.087204, 1, 1, 1, 1, 1,
0.9135181, -1.358827, 2.117766, 1, 1, 1, 1, 1,
0.9142894, -0.9219461, 1.082187, 1, 1, 1, 1, 1,
0.9171745, -1.05117, 2.222602, 0, 0, 1, 1, 1,
0.9221713, -0.5254878, 2.308627, 1, 0, 0, 1, 1,
0.9250094, -0.4769995, 2.638623, 1, 0, 0, 1, 1,
0.9287328, 1.521196, 1.356004, 1, 0, 0, 1, 1,
0.9312308, 1.722524, 0.8445148, 1, 0, 0, 1, 1,
0.9326761, 0.872763, 0.84034, 1, 0, 0, 1, 1,
0.9366215, 0.8926223, 0.5331854, 0, 0, 0, 1, 1,
0.9375899, 1.60496, 0.8703939, 0, 0, 0, 1, 1,
0.9378856, 1.701185, 0.08886515, 0, 0, 0, 1, 1,
0.9472954, -0.2544398, -0.3601244, 0, 0, 0, 1, 1,
0.9493564, -0.3971059, 3.424709, 0, 0, 0, 1, 1,
0.9601288, -1.509163, 1.60682, 0, 0, 0, 1, 1,
0.9651014, 0.4805535, 1.651725, 0, 0, 0, 1, 1,
0.96856, -0.4534948, 0.3056205, 1, 1, 1, 1, 1,
0.9716293, 0.7318304, 0.2911015, 1, 1, 1, 1, 1,
0.9735692, 0.8114676, 1.079688, 1, 1, 1, 1, 1,
0.9764116, 0.1318418, 1.696573, 1, 1, 1, 1, 1,
0.9852462, -0.1363417, 3.082212, 1, 1, 1, 1, 1,
0.9853181, 0.04730484, 2.134737, 1, 1, 1, 1, 1,
0.9875188, 0.3020874, 1.394352, 1, 1, 1, 1, 1,
0.9948238, -0.3347495, 3.259526, 1, 1, 1, 1, 1,
0.9958123, -0.8217737, 2.868017, 1, 1, 1, 1, 1,
0.9972836, 0.3234951, 0.2821622, 1, 1, 1, 1, 1,
1.004364, 0.3903828, 0.4073426, 1, 1, 1, 1, 1,
1.007994, 1.166705, 0.9557281, 1, 1, 1, 1, 1,
1.017014, -0.6816251, 2.338431, 1, 1, 1, 1, 1,
1.01879, 0.919127, 2.0885, 1, 1, 1, 1, 1,
1.020632, -0.3785739, 1.05587, 1, 1, 1, 1, 1,
1.021684, 0.7569217, 0.7689019, 0, 0, 1, 1, 1,
1.024639, 0.5271423, 2.204047, 1, 0, 0, 1, 1,
1.025059, 0.8017789, 1.57782, 1, 0, 0, 1, 1,
1.025845, -0.03904656, 1.567071, 1, 0, 0, 1, 1,
1.042743, -1.014436, 2.766448, 1, 0, 0, 1, 1,
1.048867, 0.1456167, 2.236973, 1, 0, 0, 1, 1,
1.049723, -0.1851554, 2.996309, 0, 0, 0, 1, 1,
1.055926, -0.2843522, 1.758167, 0, 0, 0, 1, 1,
1.06484, 0.762724, 0.1221092, 0, 0, 0, 1, 1,
1.06563, 0.3405676, 0.5116834, 0, 0, 0, 1, 1,
1.076321, -1.324967, 3.572843, 0, 0, 0, 1, 1,
1.077024, 0.9092039, 1.832875, 0, 0, 0, 1, 1,
1.091803, 1.656355, 0.5154506, 0, 0, 0, 1, 1,
1.095747, 0.5736771, 1.625869, 1, 1, 1, 1, 1,
1.107964, -0.3313436, 1.362787, 1, 1, 1, 1, 1,
1.108616, -1.01133, 1.860336, 1, 1, 1, 1, 1,
1.109079, 1.723074, -0.929599, 1, 1, 1, 1, 1,
1.113815, -1.730119, 3.457095, 1, 1, 1, 1, 1,
1.129042, 0.01340998, 3.516992, 1, 1, 1, 1, 1,
1.14356, -0.8145503, 2.178754, 1, 1, 1, 1, 1,
1.144559, 0.4017537, 1.297129, 1, 1, 1, 1, 1,
1.146215, -2.733396, 3.84162, 1, 1, 1, 1, 1,
1.1537, -0.4384403, 1.184522, 1, 1, 1, 1, 1,
1.153888, -1.61402, 2.951241, 1, 1, 1, 1, 1,
1.154787, 0.2155385, 1.542534, 1, 1, 1, 1, 1,
1.1583, 0.3675563, -0.003675902, 1, 1, 1, 1, 1,
1.160292, 1.286212, 2.314329, 1, 1, 1, 1, 1,
1.167156, -0.524936, 3.127864, 1, 1, 1, 1, 1,
1.169482, -0.3182172, 0.4214641, 0, 0, 1, 1, 1,
1.169991, 0.7966806, -1.32083, 1, 0, 0, 1, 1,
1.178544, 1.657962, 1.66076, 1, 0, 0, 1, 1,
1.186136, 2.361931, -0.2865143, 1, 0, 0, 1, 1,
1.194768, -0.009176964, 2.649865, 1, 0, 0, 1, 1,
1.19854, 0.2520026, 0.4329535, 1, 0, 0, 1, 1,
1.222292, 0.3437152, 0.6848736, 0, 0, 0, 1, 1,
1.222539, 0.8456137, 1.291049, 0, 0, 0, 1, 1,
1.226055, -0.4093857, 0.3542534, 0, 0, 0, 1, 1,
1.244109, 2.411416, -0.4808355, 0, 0, 0, 1, 1,
1.250791, -0.06185694, -0.2561636, 0, 0, 0, 1, 1,
1.255623, -0.04040704, 2.06117, 0, 0, 0, 1, 1,
1.261632, 0.5388133, 1.019365, 0, 0, 0, 1, 1,
1.265662, -0.3636256, 0.8046858, 1, 1, 1, 1, 1,
1.276852, 0.3865485, 0.9808915, 1, 1, 1, 1, 1,
1.277335, 0.08899816, 2.114111, 1, 1, 1, 1, 1,
1.27735, 0.4114364, 0.309187, 1, 1, 1, 1, 1,
1.277529, 0.6839145, 1.476324, 1, 1, 1, 1, 1,
1.286979, 0.3295989, 2.062781, 1, 1, 1, 1, 1,
1.293884, 0.3229707, 1.903418, 1, 1, 1, 1, 1,
1.30451, 0.09598979, 0.6502026, 1, 1, 1, 1, 1,
1.309899, 0.080818, 1.856675, 1, 1, 1, 1, 1,
1.317325, -0.2775967, 2.226043, 1, 1, 1, 1, 1,
1.356601, 1.735347, 0.7140579, 1, 1, 1, 1, 1,
1.359596, -0.7838439, 4.009867, 1, 1, 1, 1, 1,
1.368948, -1.131022, 2.664029, 1, 1, 1, 1, 1,
1.37014, 0.2343133, 0.3657836, 1, 1, 1, 1, 1,
1.379807, 1.070214, 0.6048148, 1, 1, 1, 1, 1,
1.384375, -0.2623343, 2.516681, 0, 0, 1, 1, 1,
1.384648, 0.9164727, 2.299216, 1, 0, 0, 1, 1,
1.388205, -0.8142915, 4.536913, 1, 0, 0, 1, 1,
1.388303, -1.284197, 3.294484, 1, 0, 0, 1, 1,
1.417533, 0.1249286, 3.0722, 1, 0, 0, 1, 1,
1.420425, 1.43173, -0.1657981, 1, 0, 0, 1, 1,
1.424874, 0.6458194, -0.4139717, 0, 0, 0, 1, 1,
1.431059, -0.7124631, 0.6381637, 0, 0, 0, 1, 1,
1.436834, -0.1396273, 2.609991, 0, 0, 0, 1, 1,
1.449019, 1.266271, 1.95445, 0, 0, 0, 1, 1,
1.450584, 1.820162, -0.3184367, 0, 0, 0, 1, 1,
1.456428, -0.6437301, 1.380295, 0, 0, 0, 1, 1,
1.477995, 0.4834701, -0.2016069, 0, 0, 0, 1, 1,
1.48433, -1.046681, 2.800391, 1, 1, 1, 1, 1,
1.485578, 0.7035782, 1.78233, 1, 1, 1, 1, 1,
1.490911, -0.09194613, 0.3059184, 1, 1, 1, 1, 1,
1.491864, 1.52116, 0.1788481, 1, 1, 1, 1, 1,
1.500207, 0.1315651, 1.50504, 1, 1, 1, 1, 1,
1.509783, -0.8129028, 2.503835, 1, 1, 1, 1, 1,
1.522865, 0.1572361, 1.114575, 1, 1, 1, 1, 1,
1.523454, -0.1194076, 0.6803818, 1, 1, 1, 1, 1,
1.523845, 0.5559193, 0.9482757, 1, 1, 1, 1, 1,
1.52394, -0.7723541, 1.879226, 1, 1, 1, 1, 1,
1.528628, -1.001624, 2.225162, 1, 1, 1, 1, 1,
1.536809, -0.7671384, 2.685, 1, 1, 1, 1, 1,
1.544201, -0.2247968, 0.6990045, 1, 1, 1, 1, 1,
1.545804, 0.6943449, 1.271568, 1, 1, 1, 1, 1,
1.55778, -1.809533, 3.483213, 1, 1, 1, 1, 1,
1.564158, -0.7689096, 3.175299, 0, 0, 1, 1, 1,
1.58372, 1.083301, 1.562749, 1, 0, 0, 1, 1,
1.584045, 1.155776, -1.239866, 1, 0, 0, 1, 1,
1.597247, -0.7218499, 3.28464, 1, 0, 0, 1, 1,
1.631857, -0.6483555, 2.840453, 1, 0, 0, 1, 1,
1.632248, -1.225532, 3.013711, 1, 0, 0, 1, 1,
1.652907, -1.565494, 1.464771, 0, 0, 0, 1, 1,
1.661309, -2.611332, 1.623229, 0, 0, 0, 1, 1,
1.666904, 0.3545774, 1.512367, 0, 0, 0, 1, 1,
1.678003, 2.374773, -0.2801727, 0, 0, 0, 1, 1,
1.704535, -0.7222257, 2.335365, 0, 0, 0, 1, 1,
1.709112, 0.5810373, 0.3096423, 0, 0, 0, 1, 1,
1.714322, -1.01639, 1.799886, 0, 0, 0, 1, 1,
1.720558, 0.5408309, 1.96266, 1, 1, 1, 1, 1,
1.73954, 1.48839, 0.6972667, 1, 1, 1, 1, 1,
1.752436, -0.6935816, 0.7465204, 1, 1, 1, 1, 1,
1.766967, 0.002801548, 0.1334681, 1, 1, 1, 1, 1,
1.779488, -0.5201822, 2.436411, 1, 1, 1, 1, 1,
1.785106, -0.6024011, 3.618583, 1, 1, 1, 1, 1,
1.808966, -0.5236276, 2.2553, 1, 1, 1, 1, 1,
1.825887, -0.454438, 2.389283, 1, 1, 1, 1, 1,
1.82745, 1.117131, 1.115962, 1, 1, 1, 1, 1,
1.833736, 0.4407937, 2.597423, 1, 1, 1, 1, 1,
1.884678, 0.08058065, 1.936286, 1, 1, 1, 1, 1,
1.889805, 1.387548, 0.4153169, 1, 1, 1, 1, 1,
1.89166, -0.100005, 0.2416312, 1, 1, 1, 1, 1,
1.901257, 0.6470552, 2.510339, 1, 1, 1, 1, 1,
1.909866, 0.05696907, 1.28654, 1, 1, 1, 1, 1,
1.998608, -1.781975, 1.974637, 0, 0, 1, 1, 1,
2.087839, 0.3195364, 1.212525, 1, 0, 0, 1, 1,
2.113579, -0.3982853, 1.683789, 1, 0, 0, 1, 1,
2.14486, -0.4977705, 1.407607, 1, 0, 0, 1, 1,
2.171934, 0.1071636, 2.136591, 1, 0, 0, 1, 1,
2.186673, 0.8351542, 1.522158, 1, 0, 0, 1, 1,
2.221459, -0.9301214, 3.423716, 0, 0, 0, 1, 1,
2.245994, -1.626248, 2.401096, 0, 0, 0, 1, 1,
2.271238, -0.03490106, 1.148973, 0, 0, 0, 1, 1,
2.297323, -0.05963725, 0.8639315, 0, 0, 0, 1, 1,
2.391629, 1.219793, 0.5781452, 0, 0, 0, 1, 1,
2.414446, -1.064162, 2.300548, 0, 0, 0, 1, 1,
2.467125, 1.005988, 1.737525, 0, 0, 0, 1, 1,
2.503427, 1.01063, 2.031344, 1, 1, 1, 1, 1,
2.509794, -1.145821, 2.894932, 1, 1, 1, 1, 1,
2.545162, 0.4049701, 1.342686, 1, 1, 1, 1, 1,
2.584046, -0.2758468, 1.879382, 1, 1, 1, 1, 1,
2.945423, -0.7264846, 0.9406939, 1, 1, 1, 1, 1,
2.991804, -0.7026519, 0.9741971, 1, 1, 1, 1, 1,
3.075943, -0.8475794, 3.119561, 1, 1, 1, 1, 1
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
var radius = 9.478212;
var distance = 33.29182;
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
mvMatrix.translate( 0.1247971, -0.05939722, 0.2710972 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29182);
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
