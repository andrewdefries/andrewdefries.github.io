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
-3.270436, 0.6493384, 0.07334182, 1, 0, 0, 1,
-3.05992, 0.8352554, -1.330393, 1, 0.007843138, 0, 1,
-3.041764, -0.3646744, -1.723191, 1, 0.01176471, 0, 1,
-2.922231, -1.683065, -1.724281, 1, 0.01960784, 0, 1,
-2.797723, 0.2936665, -1.603111, 1, 0.02352941, 0, 1,
-2.6281, -0.3733827, -2.953252, 1, 0.03137255, 0, 1,
-2.555134, 1.88936, 0.02031635, 1, 0.03529412, 0, 1,
-2.413185, -0.940838, -3.092206, 1, 0.04313726, 0, 1,
-2.377037, 0.2711957, -1.996447, 1, 0.04705882, 0, 1,
-2.372373, 2.491735, -1.738589, 1, 0.05490196, 0, 1,
-2.364891, -0.4507661, -1.192688, 1, 0.05882353, 0, 1,
-2.363087, -2.34448, -1.997059, 1, 0.06666667, 0, 1,
-2.329607, -2.100884, -2.960402, 1, 0.07058824, 0, 1,
-2.250152, -1.997254, -0.1667672, 1, 0.07843138, 0, 1,
-2.228714, -1.699909, -3.544168, 1, 0.08235294, 0, 1,
-2.220591, 0.48029, 0.2127511, 1, 0.09019608, 0, 1,
-2.172932, 0.1971554, -2.325554, 1, 0.09411765, 0, 1,
-2.138794, 0.2570524, -0.6693254, 1, 0.1019608, 0, 1,
-2.057631, -0.9085989, -1.531948, 1, 0.1098039, 0, 1,
-2.003796, -0.0162053, -2.171674, 1, 0.1137255, 0, 1,
-1.999554, -0.4222527, -1.513653, 1, 0.1215686, 0, 1,
-1.989982, -0.3083939, -1.185114, 1, 0.1254902, 0, 1,
-1.988566, -0.6654406, -1.355209, 1, 0.1333333, 0, 1,
-1.980693, 1.361996, 0.1370864, 1, 0.1372549, 0, 1,
-1.971732, 0.6177283, -1.790245, 1, 0.145098, 0, 1,
-1.959439, 0.03402427, -1.35155, 1, 0.1490196, 0, 1,
-1.918508, -1.689638, -1.712562, 1, 0.1568628, 0, 1,
-1.887331, 1.219808, 0.2222832, 1, 0.1607843, 0, 1,
-1.874799, 1.583444, -1.788507, 1, 0.1686275, 0, 1,
-1.865055, 1.394106, -1.185234, 1, 0.172549, 0, 1,
-1.851168, 1.645157, 0.2395679, 1, 0.1803922, 0, 1,
-1.832448, 0.651526, -2.680899, 1, 0.1843137, 0, 1,
-1.831276, -0.2418387, -2.547931, 1, 0.1921569, 0, 1,
-1.797706, -0.5671681, -1.964232, 1, 0.1960784, 0, 1,
-1.766143, 0.8832929, 0.3500914, 1, 0.2039216, 0, 1,
-1.756257, -1.229211, -3.188978, 1, 0.2117647, 0, 1,
-1.749998, -0.9146644, -1.49288, 1, 0.2156863, 0, 1,
-1.74398, -0.4405396, -2.241724, 1, 0.2235294, 0, 1,
-1.742465, -1.437956, -1.734049, 1, 0.227451, 0, 1,
-1.716804, 0.1204003, -1.038452, 1, 0.2352941, 0, 1,
-1.70858, 1.057404, -0.6257283, 1, 0.2392157, 0, 1,
-1.707556, 0.1461682, -1.265981, 1, 0.2470588, 0, 1,
-1.689896, 0.5784363, -2.524254, 1, 0.2509804, 0, 1,
-1.687743, -0.4526814, -3.876081, 1, 0.2588235, 0, 1,
-1.679094, -0.8845493, -0.8645892, 1, 0.2627451, 0, 1,
-1.672303, 1.772347, -0.6674955, 1, 0.2705882, 0, 1,
-1.65502, -0.006909258, -2.24734, 1, 0.2745098, 0, 1,
-1.652933, 0.08848482, -0.8847798, 1, 0.282353, 0, 1,
-1.642863, 1.506647, -2.128338, 1, 0.2862745, 0, 1,
-1.639621, 0.7067748, -2.626694, 1, 0.2941177, 0, 1,
-1.631638, 1.435377, 1.291735, 1, 0.3019608, 0, 1,
-1.630631, 1.465694, -2.695928, 1, 0.3058824, 0, 1,
-1.628626, -0.8798522, -2.348211, 1, 0.3137255, 0, 1,
-1.622832, 1.723383, -0.6103464, 1, 0.3176471, 0, 1,
-1.619868, 0.6047158, -0.6603699, 1, 0.3254902, 0, 1,
-1.614063, -0.2501676, -1.683666, 1, 0.3294118, 0, 1,
-1.610411, -2.001217, -2.496403, 1, 0.3372549, 0, 1,
-1.609106, 0.1717971, -0.6432985, 1, 0.3411765, 0, 1,
-1.607677, 1.546335, 0.06643461, 1, 0.3490196, 0, 1,
-1.60736, 1.589796, -0.682682, 1, 0.3529412, 0, 1,
-1.604597, -0.2026011, -2.349973, 1, 0.3607843, 0, 1,
-1.603088, 0.8877643, -2.124828, 1, 0.3647059, 0, 1,
-1.598903, -1.56927, -1.5198, 1, 0.372549, 0, 1,
-1.598569, -0.5539765, -1.906771, 1, 0.3764706, 0, 1,
-1.5914, 1.351613, 0.0006446567, 1, 0.3843137, 0, 1,
-1.579932, -1.645193, -2.147018, 1, 0.3882353, 0, 1,
-1.573869, 0.1284994, -2.719507, 1, 0.3960784, 0, 1,
-1.562508, -0.1007044, -0.3639442, 1, 0.4039216, 0, 1,
-1.557398, -0.01195513, -2.796998, 1, 0.4078431, 0, 1,
-1.556917, -1.32811, -3.154199, 1, 0.4156863, 0, 1,
-1.54782, -0.3508458, -2.138165, 1, 0.4196078, 0, 1,
-1.53926, 0.1329619, -2.171318, 1, 0.427451, 0, 1,
-1.528977, 1.169235, -0.8795661, 1, 0.4313726, 0, 1,
-1.507355, -2.331065, -1.790731, 1, 0.4392157, 0, 1,
-1.507114, 0.4465708, -1.640757, 1, 0.4431373, 0, 1,
-1.499052, -0.6225216, -2.746067, 1, 0.4509804, 0, 1,
-1.49561, 1.604977, -1.491031, 1, 0.454902, 0, 1,
-1.478346, 0.2012391, -1.861778, 1, 0.4627451, 0, 1,
-1.466636, -0.02933986, -2.47227, 1, 0.4666667, 0, 1,
-1.46297, -1.089986, -2.726567, 1, 0.4745098, 0, 1,
-1.456696, 2.233012, -0.2266151, 1, 0.4784314, 0, 1,
-1.442435, 0.9894134, -1.00332, 1, 0.4862745, 0, 1,
-1.440926, -0.9831069, -0.5924628, 1, 0.4901961, 0, 1,
-1.43973, 0.3255452, -2.134765, 1, 0.4980392, 0, 1,
-1.438327, -0.5091769, -1.916925, 1, 0.5058824, 0, 1,
-1.432566, -0.9958751, -1.215931, 1, 0.509804, 0, 1,
-1.431001, 0.6801329, 0.2369467, 1, 0.5176471, 0, 1,
-1.419599, -0.09720773, -1.10584, 1, 0.5215687, 0, 1,
-1.407027, -1.072567, -1.498277, 1, 0.5294118, 0, 1,
-1.385216, 0.1057535, -1.502765, 1, 0.5333334, 0, 1,
-1.383893, -0.000944602, -3.940004, 1, 0.5411765, 0, 1,
-1.383123, 0.127702, -2.044846, 1, 0.5450981, 0, 1,
-1.375248, 1.058092, -0.9674016, 1, 0.5529412, 0, 1,
-1.371322, 0.1073366, -0.9724354, 1, 0.5568628, 0, 1,
-1.367631, 0.2005022, -1.967445, 1, 0.5647059, 0, 1,
-1.364489, -2.251529, -0.3756406, 1, 0.5686275, 0, 1,
-1.362877, -0.5602655, -2.768267, 1, 0.5764706, 0, 1,
-1.360616, 0.07685518, 0.09135776, 1, 0.5803922, 0, 1,
-1.360194, -0.9995095, -1.173738, 1, 0.5882353, 0, 1,
-1.359301, 1.533697, -1.525488, 1, 0.5921569, 0, 1,
-1.356347, -0.2728883, -0.7517622, 1, 0.6, 0, 1,
-1.354021, 0.7304708, -0.9186621, 1, 0.6078432, 0, 1,
-1.352396, -0.2512846, -2.043924, 1, 0.6117647, 0, 1,
-1.351986, -0.3371918, -1.230203, 1, 0.6196079, 0, 1,
-1.350502, 1.966291, -1.633983, 1, 0.6235294, 0, 1,
-1.344435, 0.6683291, -1.052076, 1, 0.6313726, 0, 1,
-1.340268, 0.4056242, -0.7085718, 1, 0.6352941, 0, 1,
-1.324255, 0.8779546, -0.5582292, 1, 0.6431373, 0, 1,
-1.317735, 2.609939, -0.2363628, 1, 0.6470588, 0, 1,
-1.311712, 0.5654436, -2.838837, 1, 0.654902, 0, 1,
-1.305584, 0.30571, 1.656628, 1, 0.6588235, 0, 1,
-1.284087, 1.014579, -0.2165779, 1, 0.6666667, 0, 1,
-1.282926, -0.01300547, 0.3210659, 1, 0.6705883, 0, 1,
-1.281937, 0.5298725, -0.1415931, 1, 0.6784314, 0, 1,
-1.271787, -0.2161617, -2.012409, 1, 0.682353, 0, 1,
-1.267682, 0.6513183, -1.29167, 1, 0.6901961, 0, 1,
-1.252426, -0.9420013, -0.6091808, 1, 0.6941177, 0, 1,
-1.252303, -1.512502, -2.876283, 1, 0.7019608, 0, 1,
-1.251083, 0.8990148, -1.184678, 1, 0.7098039, 0, 1,
-1.248058, 0.9854953, -0.4018877, 1, 0.7137255, 0, 1,
-1.237688, -1.214325, -1.860157, 1, 0.7215686, 0, 1,
-1.235215, -0.2382936, -1.516287, 1, 0.7254902, 0, 1,
-1.230128, 1.250279, -1.569652, 1, 0.7333333, 0, 1,
-1.22967, 0.1124242, -1.516072, 1, 0.7372549, 0, 1,
-1.227508, -1.712793, -1.704954, 1, 0.7450981, 0, 1,
-1.214919, 1.014061, 0.04615585, 1, 0.7490196, 0, 1,
-1.212683, 0.6293954, -0.4584416, 1, 0.7568628, 0, 1,
-1.211095, 0.672935, -0.09596121, 1, 0.7607843, 0, 1,
-1.206182, 0.4499504, -0.2892055, 1, 0.7686275, 0, 1,
-1.201841, -1.040112, -0.492004, 1, 0.772549, 0, 1,
-1.201233, -0.2635356, -3.086569, 1, 0.7803922, 0, 1,
-1.196155, 0.8312842, -1.880077, 1, 0.7843137, 0, 1,
-1.18787, 0.3927155, 0.5423828, 1, 0.7921569, 0, 1,
-1.185471, 1.428788, -0.6134955, 1, 0.7960784, 0, 1,
-1.184786, -0.6599078, -1.00062, 1, 0.8039216, 0, 1,
-1.183578, -0.108368, -2.55711, 1, 0.8117647, 0, 1,
-1.182979, 0.9099882, -1.103798, 1, 0.8156863, 0, 1,
-1.170606, -0.03404977, -0.9470508, 1, 0.8235294, 0, 1,
-1.140584, -0.9851235, -3.090958, 1, 0.827451, 0, 1,
-1.137037, 0.5434377, -1.272254, 1, 0.8352941, 0, 1,
-1.133491, 0.5563046, -1.809677, 1, 0.8392157, 0, 1,
-1.123557, 0.3814948, 0.3133809, 1, 0.8470588, 0, 1,
-1.120788, -1.452289, -2.129236, 1, 0.8509804, 0, 1,
-1.1164, 0.01319986, -1.484333, 1, 0.8588235, 0, 1,
-1.111968, -0.335769, -1.840422, 1, 0.8627451, 0, 1,
-1.105234, 1.136038, -0.56586, 1, 0.8705882, 0, 1,
-1.092203, -1.71091, -2.979237, 1, 0.8745098, 0, 1,
-1.091795, 0.7142791, -3.250053, 1, 0.8823529, 0, 1,
-1.091394, 0.9364959, 0.06178847, 1, 0.8862745, 0, 1,
-1.087519, 0.06379994, -2.046531, 1, 0.8941177, 0, 1,
-1.073301, -0.8977858, -1.063396, 1, 0.8980392, 0, 1,
-1.070633, 0.4489277, 0.3903752, 1, 0.9058824, 0, 1,
-1.06766, -0.1080796, -3.212382, 1, 0.9137255, 0, 1,
-1.06135, -0.7466634, -3.923811, 1, 0.9176471, 0, 1,
-1.05362, -1.827661, -4.598829, 1, 0.9254902, 0, 1,
-1.053144, -0.2755909, -2.077627, 1, 0.9294118, 0, 1,
-1.052602, -1.335471, -4.907579, 1, 0.9372549, 0, 1,
-1.051485, -0.2306666, -1.727983, 1, 0.9411765, 0, 1,
-1.048955, 0.301709, -1.489339, 1, 0.9490196, 0, 1,
-1.046184, 0.4300648, -0.9109463, 1, 0.9529412, 0, 1,
-1.045384, -0.09891301, -2.249568, 1, 0.9607843, 0, 1,
-1.032959, -1.128241, -2.020309, 1, 0.9647059, 0, 1,
-1.031703, 1.757211, -0.6196984, 1, 0.972549, 0, 1,
-1.02146, 0.5095016, -1.668861, 1, 0.9764706, 0, 1,
-1.011993, 0.2933929, -0.1941012, 1, 0.9843137, 0, 1,
-1.003142, -0.6756411, -3.290598, 1, 0.9882353, 0, 1,
-1.002521, 1.249529, 0.7423886, 1, 0.9960784, 0, 1,
-0.990347, 0.3294174, -2.867336, 0.9960784, 1, 0, 1,
-0.9897894, 0.2576582, -0.3951833, 0.9921569, 1, 0, 1,
-0.9873703, -1.026155, -1.855606, 0.9843137, 1, 0, 1,
-0.9841858, -0.391268, -2.780655, 0.9803922, 1, 0, 1,
-0.9827924, -0.6446677, -4.6823, 0.972549, 1, 0, 1,
-0.9721808, 1.904366, -0.5109984, 0.9686275, 1, 0, 1,
-0.9713346, -1.035367, -3.062316, 0.9607843, 1, 0, 1,
-0.9679047, -0.4435113, -1.897361, 0.9568627, 1, 0, 1,
-0.9599757, -0.07086206, -0.722618, 0.9490196, 1, 0, 1,
-0.957132, -0.1246429, -1.819639, 0.945098, 1, 0, 1,
-0.9549879, -2.344901, -2.920607, 0.9372549, 1, 0, 1,
-0.947172, -0.3164744, -0.5650587, 0.9333333, 1, 0, 1,
-0.9429997, 0.8953549, -1.620005, 0.9254902, 1, 0, 1,
-0.9394172, -1.156137, -5.52414, 0.9215686, 1, 0, 1,
-0.9276717, 0.004623831, -0.1176934, 0.9137255, 1, 0, 1,
-0.9257916, 0.2840745, -1.22372, 0.9098039, 1, 0, 1,
-0.9241477, -0.73825, -2.032813, 0.9019608, 1, 0, 1,
-0.9208565, -0.1771989, -3.699952, 0.8941177, 1, 0, 1,
-0.9172001, 1.172613, -3.715691, 0.8901961, 1, 0, 1,
-0.9162233, -0.2786313, -3.682141, 0.8823529, 1, 0, 1,
-0.9135067, 0.1676337, -2.139584, 0.8784314, 1, 0, 1,
-0.9118392, 0.5480652, -0.5469253, 0.8705882, 1, 0, 1,
-0.9097854, -1.708436, -3.105267, 0.8666667, 1, 0, 1,
-0.9062842, 0.1112628, -1.401624, 0.8588235, 1, 0, 1,
-0.9053531, 0.4492262, 0.6059138, 0.854902, 1, 0, 1,
-0.9041739, 0.9553666, 0.348121, 0.8470588, 1, 0, 1,
-0.9029598, 0.9179522, 0.2285086, 0.8431373, 1, 0, 1,
-0.902092, -1.234123, -2.352094, 0.8352941, 1, 0, 1,
-0.9005184, -0.601999, -0.6612735, 0.8313726, 1, 0, 1,
-0.8978522, 0.09242538, 1.383696, 0.8235294, 1, 0, 1,
-0.8922424, -1.465894, -1.443577, 0.8196079, 1, 0, 1,
-0.8837432, -1.112003, -1.335855, 0.8117647, 1, 0, 1,
-0.8817924, -1.083764, -1.230585, 0.8078431, 1, 0, 1,
-0.880694, 0.8810484, -1.345296, 0.8, 1, 0, 1,
-0.8793937, -0.02066587, -2.285203, 0.7921569, 1, 0, 1,
-0.8743036, 0.5380796, -2.052745, 0.7882353, 1, 0, 1,
-0.8711757, 0.8383476, -1.100833, 0.7803922, 1, 0, 1,
-0.8708484, -0.3367882, -1.718512, 0.7764706, 1, 0, 1,
-0.8669878, 0.8084618, -1.481651, 0.7686275, 1, 0, 1,
-0.8622366, -0.8283324, -1.778837, 0.7647059, 1, 0, 1,
-0.8614541, -1.359836, -3.786177, 0.7568628, 1, 0, 1,
-0.8483123, 0.4833761, -1.764199, 0.7529412, 1, 0, 1,
-0.8468639, -0.1886823, -0.7281672, 0.7450981, 1, 0, 1,
-0.8391969, 0.6034212, 0.08496047, 0.7411765, 1, 0, 1,
-0.8386794, -0.5806092, -2.173841, 0.7333333, 1, 0, 1,
-0.8378831, 0.7896418, -1.276406, 0.7294118, 1, 0, 1,
-0.835799, 0.4206908, 0.9378571, 0.7215686, 1, 0, 1,
-0.8357269, 1.626511, -1.13621, 0.7176471, 1, 0, 1,
-0.8352166, -0.1711164, -1.980736, 0.7098039, 1, 0, 1,
-0.8335134, -0.4610727, -2.659325, 0.7058824, 1, 0, 1,
-0.8308561, -0.3536237, -2.211298, 0.6980392, 1, 0, 1,
-0.8211839, 0.1965746, -1.736356, 0.6901961, 1, 0, 1,
-0.8203968, 0.8933974, -0.2034954, 0.6862745, 1, 0, 1,
-0.8188625, -1.195089, -2.142184, 0.6784314, 1, 0, 1,
-0.8185856, 0.4102, -1.784992, 0.6745098, 1, 0, 1,
-0.816555, -0.5193807, -1.043477, 0.6666667, 1, 0, 1,
-0.8147053, -0.6345903, -0.7478381, 0.6627451, 1, 0, 1,
-0.8141447, 0.2605207, 1.006317, 0.654902, 1, 0, 1,
-0.8130857, 0.051069, -0.6643373, 0.6509804, 1, 0, 1,
-0.8130002, -0.5627429, -3.344326, 0.6431373, 1, 0, 1,
-0.8037817, 0.05888538, -1.739196, 0.6392157, 1, 0, 1,
-0.8014422, 1.984788, -1.165945, 0.6313726, 1, 0, 1,
-0.7980026, -0.1885064, -1.403927, 0.627451, 1, 0, 1,
-0.7971418, 1.338231, -2.038045, 0.6196079, 1, 0, 1,
-0.7963362, 0.1175929, -2.909926, 0.6156863, 1, 0, 1,
-0.7958713, 1.365251, -1.716999, 0.6078432, 1, 0, 1,
-0.7950452, 1.664938, 0.5539555, 0.6039216, 1, 0, 1,
-0.7882783, -1.40277, 0.1995365, 0.5960785, 1, 0, 1,
-0.7834207, 0.9315304, -1.484498, 0.5882353, 1, 0, 1,
-0.7767259, 0.3185928, -1.099542, 0.5843138, 1, 0, 1,
-0.7742747, -0.3768434, -1.545356, 0.5764706, 1, 0, 1,
-0.7739674, -0.07118411, -3.008057, 0.572549, 1, 0, 1,
-0.7734519, 0.2450806, -1.604281, 0.5647059, 1, 0, 1,
-0.7689587, 1.279227, 1.27348, 0.5607843, 1, 0, 1,
-0.7663498, 0.1482176, -0.5550752, 0.5529412, 1, 0, 1,
-0.7600125, 2.392147, -0.8363618, 0.5490196, 1, 0, 1,
-0.7542877, -0.4726118, -1.049762, 0.5411765, 1, 0, 1,
-0.7534866, -0.9638414, -2.412429, 0.5372549, 1, 0, 1,
-0.7527178, 1.313703, 0.3811179, 0.5294118, 1, 0, 1,
-0.7494202, 3.37762, -1.470487, 0.5254902, 1, 0, 1,
-0.7488779, 1.176857, 0.01235854, 0.5176471, 1, 0, 1,
-0.747179, -0.6773689, -1.424487, 0.5137255, 1, 0, 1,
-0.747066, -1.684214, -3.48965, 0.5058824, 1, 0, 1,
-0.7467564, 0.05239392, -0.2499451, 0.5019608, 1, 0, 1,
-0.7463078, -0.2529435, -1.033995, 0.4941176, 1, 0, 1,
-0.7437115, -0.3823036, -2.057523, 0.4862745, 1, 0, 1,
-0.7402197, 0.3706852, -1.276554, 0.4823529, 1, 0, 1,
-0.7392708, 1.418549, -0.1974121, 0.4745098, 1, 0, 1,
-0.7389114, 1.043557, -0.4442227, 0.4705882, 1, 0, 1,
-0.7350105, -0.03954761, -2.676451, 0.4627451, 1, 0, 1,
-0.7200615, -0.1351589, -2.947068, 0.4588235, 1, 0, 1,
-0.7185253, -0.08854528, -2.63225, 0.4509804, 1, 0, 1,
-0.7178116, -0.2359672, -2.740648, 0.4470588, 1, 0, 1,
-0.7122048, -1.031582, -2.938798, 0.4392157, 1, 0, 1,
-0.7058041, -0.1203863, -2.163759, 0.4352941, 1, 0, 1,
-0.70057, -2.015512, -3.695575, 0.427451, 1, 0, 1,
-0.687599, 1.344221, -2.98384, 0.4235294, 1, 0, 1,
-0.678137, 0.07651837, -0.7673265, 0.4156863, 1, 0, 1,
-0.6762418, -1.419036, -2.443343, 0.4117647, 1, 0, 1,
-0.6741604, 0.5805838, 0.3417025, 0.4039216, 1, 0, 1,
-0.6710425, 1.911673, 0.4089023, 0.3960784, 1, 0, 1,
-0.6703718, 1.039747, -1.444692, 0.3921569, 1, 0, 1,
-0.6596824, 2.478187, 0.3638175, 0.3843137, 1, 0, 1,
-0.658716, -0.2328874, -2.730304, 0.3803922, 1, 0, 1,
-0.6457033, 0.3230619, 0.08422839, 0.372549, 1, 0, 1,
-0.6448097, 0.7969875, -0.6733262, 0.3686275, 1, 0, 1,
-0.6429635, -0.6316307, -2.096602, 0.3607843, 1, 0, 1,
-0.6388245, -1.064841, -3.317125, 0.3568628, 1, 0, 1,
-0.6372628, 0.4603976, -1.776378, 0.3490196, 1, 0, 1,
-0.6323718, -1.189072, -4.201205, 0.345098, 1, 0, 1,
-0.6319067, -0.0956503, 0.8798194, 0.3372549, 1, 0, 1,
-0.6232573, 0.4859551, -1.541902, 0.3333333, 1, 0, 1,
-0.6224155, 0.1019015, -1.880046, 0.3254902, 1, 0, 1,
-0.6219593, 0.6181107, 1.060033, 0.3215686, 1, 0, 1,
-0.6205437, -1.089987, -3.240586, 0.3137255, 1, 0, 1,
-0.6195625, 0.3521827, -0.8962536, 0.3098039, 1, 0, 1,
-0.6194936, 1.146825, -2.819763, 0.3019608, 1, 0, 1,
-0.6193307, 1.642162, 0.1840128, 0.2941177, 1, 0, 1,
-0.6189555, 1.030531, -0.7686807, 0.2901961, 1, 0, 1,
-0.6122863, 0.03282779, -2.034763, 0.282353, 1, 0, 1,
-0.6116862, 0.7509614, -0.9415717, 0.2784314, 1, 0, 1,
-0.6114116, -0.2560826, -1.710415, 0.2705882, 1, 0, 1,
-0.6109518, -1.409133, -3.182403, 0.2666667, 1, 0, 1,
-0.6058704, -0.5184419, -0.9529541, 0.2588235, 1, 0, 1,
-0.6054878, 1.133435, -0.4862154, 0.254902, 1, 0, 1,
-0.60537, -0.3078804, -1.889146, 0.2470588, 1, 0, 1,
-0.5953998, -1.520374, -3.144185, 0.2431373, 1, 0, 1,
-0.593143, 0.1548996, -3.468083, 0.2352941, 1, 0, 1,
-0.5786204, 1.850059, -0.3112654, 0.2313726, 1, 0, 1,
-0.5721785, -0.5737333, -3.92211, 0.2235294, 1, 0, 1,
-0.5668672, 0.006279169, -0.9404828, 0.2196078, 1, 0, 1,
-0.5605673, 0.4651743, -0.682035, 0.2117647, 1, 0, 1,
-0.559585, 1.251689, 0.7664812, 0.2078431, 1, 0, 1,
-0.5567845, -0.7535765, -2.383241, 0.2, 1, 0, 1,
-0.5565416, -0.09025905, -1.133844, 0.1921569, 1, 0, 1,
-0.5470893, -0.9839915, -2.716926, 0.1882353, 1, 0, 1,
-0.5393835, -0.01440342, -3.225449, 0.1803922, 1, 0, 1,
-0.533821, -1.56607, -3.766178, 0.1764706, 1, 0, 1,
-0.5308719, 1.281095, -1.28966, 0.1686275, 1, 0, 1,
-0.5289702, 0.7739711, -0.4762708, 0.1647059, 1, 0, 1,
-0.5288591, 1.954078, 0.5144448, 0.1568628, 1, 0, 1,
-0.5272977, -1.344305, -3.792279, 0.1529412, 1, 0, 1,
-0.5240925, 1.122954, 1.762208, 0.145098, 1, 0, 1,
-0.5234658, -1.741089, -2.627265, 0.1411765, 1, 0, 1,
-0.5155536, -0.8765428, -0.8700635, 0.1333333, 1, 0, 1,
-0.5154622, 0.3691159, 0.02329189, 0.1294118, 1, 0, 1,
-0.5129187, 0.05726428, -1.142385, 0.1215686, 1, 0, 1,
-0.5113216, -0.8573408, -2.449484, 0.1176471, 1, 0, 1,
-0.5104976, 0.7025723, -0.7096623, 0.1098039, 1, 0, 1,
-0.5104165, 1.335683, -0.958347, 0.1058824, 1, 0, 1,
-0.4982723, 0.5598547, -1.776882, 0.09803922, 1, 0, 1,
-0.4808869, 0.6900412, -0.8081337, 0.09019608, 1, 0, 1,
-0.4739704, 0.927177, 0.04607457, 0.08627451, 1, 0, 1,
-0.4713688, -0.2848772, -2.900134, 0.07843138, 1, 0, 1,
-0.4694472, 0.1591761, -1.289035, 0.07450981, 1, 0, 1,
-0.4674801, -0.9843661, -2.983025, 0.06666667, 1, 0, 1,
-0.4662039, 2.480628, -1.21891, 0.0627451, 1, 0, 1,
-0.4633132, 0.2831459, -1.158038, 0.05490196, 1, 0, 1,
-0.4582265, -0.3662208, -4.045434, 0.05098039, 1, 0, 1,
-0.4574786, 0.6802766, -0.5430401, 0.04313726, 1, 0, 1,
-0.4548597, -0.328902, -4.691204, 0.03921569, 1, 0, 1,
-0.4548024, 1.143511, -0.8072744, 0.03137255, 1, 0, 1,
-0.4547156, 0.9234015, -0.4634229, 0.02745098, 1, 0, 1,
-0.4512184, 0.814662, 0.5351797, 0.01960784, 1, 0, 1,
-0.4499435, 0.5584892, 0.7689022, 0.01568628, 1, 0, 1,
-0.4496154, 1.682872, -0.5573435, 0.007843138, 1, 0, 1,
-0.4489186, -0.07033408, -1.051936, 0.003921569, 1, 0, 1,
-0.448821, -0.2010988, -1.241717, 0, 1, 0.003921569, 1,
-0.4452188, 0.3503388, 0.2088085, 0, 1, 0.01176471, 1,
-0.4436839, -0.7232632, -1.934692, 0, 1, 0.01568628, 1,
-0.4416806, 0.3009195, -0.6305813, 0, 1, 0.02352941, 1,
-0.4399827, -0.3696634, -2.83628, 0, 1, 0.02745098, 1,
-0.4355696, 0.9339098, -1.323539, 0, 1, 0.03529412, 1,
-0.4331019, 0.226531, -1.934943, 0, 1, 0.03921569, 1,
-0.4289708, -1.750555, -3.432685, 0, 1, 0.04705882, 1,
-0.4287283, 1.143543, -0.9747382, 0, 1, 0.05098039, 1,
-0.4281459, -1.208224, -2.255538, 0, 1, 0.05882353, 1,
-0.4260543, 0.8335394, -1.394517, 0, 1, 0.0627451, 1,
-0.4248493, -0.05497336, -1.976886, 0, 1, 0.07058824, 1,
-0.418317, 0.5104306, -1.729786, 0, 1, 0.07450981, 1,
-0.4059067, -1.721963, -3.648407, 0, 1, 0.08235294, 1,
-0.4043226, 0.9715561, -1.645717, 0, 1, 0.08627451, 1,
-0.4040857, -1.242001, -3.568808, 0, 1, 0.09411765, 1,
-0.4022759, 0.1060294, -0.3079965, 0, 1, 0.1019608, 1,
-0.4018735, 1.669623, 1.355911, 0, 1, 0.1058824, 1,
-0.4004598, 1.393116, 1.352633, 0, 1, 0.1137255, 1,
-0.3980253, -0.8025112, -3.762657, 0, 1, 0.1176471, 1,
-0.394109, -0.7019176, -2.814153, 0, 1, 0.1254902, 1,
-0.3938381, -1.111042, -1.127697, 0, 1, 0.1294118, 1,
-0.3897948, -0.2756703, -2.144481, 0, 1, 0.1372549, 1,
-0.3884462, -0.2169821, -2.315078, 0, 1, 0.1411765, 1,
-0.3755138, -1.401594, -2.853669, 0, 1, 0.1490196, 1,
-0.3729417, 0.2137468, -2.328981, 0, 1, 0.1529412, 1,
-0.3729148, -0.3634327, -2.792605, 0, 1, 0.1607843, 1,
-0.3704344, -0.4074349, -2.618058, 0, 1, 0.1647059, 1,
-0.3683, 0.07303869, -0.6248887, 0, 1, 0.172549, 1,
-0.366679, 0.9831535, -1.856789, 0, 1, 0.1764706, 1,
-0.3573763, -0.05473744, -2.887568, 0, 1, 0.1843137, 1,
-0.355159, -0.424925, -3.650479, 0, 1, 0.1882353, 1,
-0.3504475, 0.4433421, -0.4113319, 0, 1, 0.1960784, 1,
-0.3493439, 1.055292, 0.6146165, 0, 1, 0.2039216, 1,
-0.3454675, 0.5425897, -1.455428, 0, 1, 0.2078431, 1,
-0.3422996, 0.1841402, -2.933777, 0, 1, 0.2156863, 1,
-0.3397315, -0.6246705, -2.745822, 0, 1, 0.2196078, 1,
-0.3390139, -1.121023, -2.605136, 0, 1, 0.227451, 1,
-0.3388922, 0.5721017, 0.7517333, 0, 1, 0.2313726, 1,
-0.3370402, -0.9067794, -3.439782, 0, 1, 0.2392157, 1,
-0.3355238, -0.3732107, -1.329975, 0, 1, 0.2431373, 1,
-0.3346224, -0.1785924, -1.422944, 0, 1, 0.2509804, 1,
-0.3270091, 2.006531, -0.02235245, 0, 1, 0.254902, 1,
-0.326724, 2.113177, -1.466682, 0, 1, 0.2627451, 1,
-0.321624, 0.740429, -0.137104, 0, 1, 0.2666667, 1,
-0.3211251, 0.223466, -1.428434, 0, 1, 0.2745098, 1,
-0.3207439, -0.9975166, -4.467684, 0, 1, 0.2784314, 1,
-0.3176652, 1.284059, -0.04751703, 0, 1, 0.2862745, 1,
-0.3156242, 0.3377222, 0.4640603, 0, 1, 0.2901961, 1,
-0.3153006, -0.1137238, -2.801111, 0, 1, 0.2980392, 1,
-0.3143144, -0.06335825, -3.332044, 0, 1, 0.3058824, 1,
-0.3042349, -2.362873, -3.309774, 0, 1, 0.3098039, 1,
-0.3032371, -0.9157855, -1.816981, 0, 1, 0.3176471, 1,
-0.3023278, 1.037591, -0.3517831, 0, 1, 0.3215686, 1,
-0.2988467, -0.8005595, -2.769741, 0, 1, 0.3294118, 1,
-0.2986437, 0.8166043, -0.4905899, 0, 1, 0.3333333, 1,
-0.2949613, -0.3518259, -1.660725, 0, 1, 0.3411765, 1,
-0.2944841, 2.216616, -1.591511, 0, 1, 0.345098, 1,
-0.2940207, 1.141029, 1.023734, 0, 1, 0.3529412, 1,
-0.2906018, 1.58528, -0.2280653, 0, 1, 0.3568628, 1,
-0.2900979, 0.6386139, -0.3721281, 0, 1, 0.3647059, 1,
-0.2897951, -0.4935931, -2.950808, 0, 1, 0.3686275, 1,
-0.2883485, 0.1161114, -1.342549, 0, 1, 0.3764706, 1,
-0.2863058, -0.4976458, -3.879407, 0, 1, 0.3803922, 1,
-0.2828746, 0.8991886, -0.5482349, 0, 1, 0.3882353, 1,
-0.2783328, -0.3247075, -1.787047, 0, 1, 0.3921569, 1,
-0.2738357, -1.33662, -3.287739, 0, 1, 0.4, 1,
-0.2706608, -1.727339, -2.549751, 0, 1, 0.4078431, 1,
-0.2685872, 0.8788957, 0.4925469, 0, 1, 0.4117647, 1,
-0.2674276, -0.7564182, -4.65937, 0, 1, 0.4196078, 1,
-0.2662567, -0.2775598, -1.793964, 0, 1, 0.4235294, 1,
-0.265633, -1.255357, -2.019824, 0, 1, 0.4313726, 1,
-0.2624913, 1.0259, -1.014869, 0, 1, 0.4352941, 1,
-0.2617419, 1.875295, 0.4326328, 0, 1, 0.4431373, 1,
-0.2614091, 0.4382435, 0.4745836, 0, 1, 0.4470588, 1,
-0.2562588, 0.5530461, 0.7138546, 0, 1, 0.454902, 1,
-0.2537523, -0.4312939, -1.594915, 0, 1, 0.4588235, 1,
-0.2528353, 0.5973982, -0.1817056, 0, 1, 0.4666667, 1,
-0.239372, 1.351506, -1.238014, 0, 1, 0.4705882, 1,
-0.2361503, 1.372509, -0.4555606, 0, 1, 0.4784314, 1,
-0.2332561, -0.932487, -1.758356, 0, 1, 0.4823529, 1,
-0.2251375, -1.877586, -2.679414, 0, 1, 0.4901961, 1,
-0.2229797, -1.115435, -3.441991, 0, 1, 0.4941176, 1,
-0.2178839, 1.797184, 1.013322, 0, 1, 0.5019608, 1,
-0.2088205, -0.6029515, -4.018391, 0, 1, 0.509804, 1,
-0.2077288, 1.205084, -0.9734691, 0, 1, 0.5137255, 1,
-0.2047225, -0.2862554, -2.011725, 0, 1, 0.5215687, 1,
-0.2037487, -0.1783926, -1.480033, 0, 1, 0.5254902, 1,
-0.1993398, 1.88165, -0.8833818, 0, 1, 0.5333334, 1,
-0.1984193, -1.299886, -4.585968, 0, 1, 0.5372549, 1,
-0.1981672, 0.2163309, -0.5066605, 0, 1, 0.5450981, 1,
-0.1972758, 1.903477, -1.776358, 0, 1, 0.5490196, 1,
-0.1971271, -1.520666, -3.874195, 0, 1, 0.5568628, 1,
-0.1947558, 0.1906767, -1.324009, 0, 1, 0.5607843, 1,
-0.1932724, 0.2518495, -0.2242412, 0, 1, 0.5686275, 1,
-0.18577, -0.02122816, -2.230815, 0, 1, 0.572549, 1,
-0.1847829, 0.2983535, 0.1304868, 0, 1, 0.5803922, 1,
-0.183846, -1.354754, -3.623691, 0, 1, 0.5843138, 1,
-0.1829888, -1.215075, -1.929206, 0, 1, 0.5921569, 1,
-0.1828812, -0.04754787, -0.4929551, 0, 1, 0.5960785, 1,
-0.1775961, -0.3781277, -2.430764, 0, 1, 0.6039216, 1,
-0.1767288, -1.297455, -2.35596, 0, 1, 0.6117647, 1,
-0.1755613, -1.888666, -1.445236, 0, 1, 0.6156863, 1,
-0.1629554, 0.3902045, -1.252304, 0, 1, 0.6235294, 1,
-0.1581905, 1.736026, 0.2153961, 0, 1, 0.627451, 1,
-0.155384, 0.6446611, -0.8937376, 0, 1, 0.6352941, 1,
-0.1545376, -0.553982, -2.235763, 0, 1, 0.6392157, 1,
-0.1534531, -0.3374, -3.075193, 0, 1, 0.6470588, 1,
-0.1464244, -0.3810709, -3.383775, 0, 1, 0.6509804, 1,
-0.1444155, -1.271119, -3.841669, 0, 1, 0.6588235, 1,
-0.1420471, -0.6051934, -2.370592, 0, 1, 0.6627451, 1,
-0.1406966, -0.0234657, -1.438023, 0, 1, 0.6705883, 1,
-0.1406167, -1.031253, -3.750752, 0, 1, 0.6745098, 1,
-0.1397459, 0.4895788, 0.1543883, 0, 1, 0.682353, 1,
-0.1309209, -1.568831, -1.23862, 0, 1, 0.6862745, 1,
-0.1250643, -0.3081512, -3.489827, 0, 1, 0.6941177, 1,
-0.1245034, -0.297779, -2.782037, 0, 1, 0.7019608, 1,
-0.1113905, 1.24152, -0.8885121, 0, 1, 0.7058824, 1,
-0.1105581, -1.47662, -2.448691, 0, 1, 0.7137255, 1,
-0.1103683, 1.070189, 0.6188483, 0, 1, 0.7176471, 1,
-0.1089941, -0.5794829, -3.589921, 0, 1, 0.7254902, 1,
-0.1045698, 1.391039, 0.8959694, 0, 1, 0.7294118, 1,
-0.09731765, -1.38575, -3.595191, 0, 1, 0.7372549, 1,
-0.09648748, -0.614078, -0.81204, 0, 1, 0.7411765, 1,
-0.09608641, 0.6809109, -0.6907744, 0, 1, 0.7490196, 1,
-0.09485468, 0.7656584, -0.2539696, 0, 1, 0.7529412, 1,
-0.09471257, -0.1886362, -0.1224936, 0, 1, 0.7607843, 1,
-0.09056843, 0.6041614, -1.795015, 0, 1, 0.7647059, 1,
-0.09049843, 0.2323808, -0.5751254, 0, 1, 0.772549, 1,
-0.09028533, 1.467877, -1.337854, 0, 1, 0.7764706, 1,
-0.08685745, 0.3956662, 0.4214052, 0, 1, 0.7843137, 1,
-0.08668481, 1.112399, 0.911816, 0, 1, 0.7882353, 1,
-0.08637027, -0.9112089, -4.103905, 0, 1, 0.7960784, 1,
-0.08402029, 0.6978094, -0.05386087, 0, 1, 0.8039216, 1,
-0.08371909, -0.7071147, -3.14297, 0, 1, 0.8078431, 1,
-0.08219942, 1.4546, -0.708279, 0, 1, 0.8156863, 1,
-0.07995415, 0.7472437, 1.275718, 0, 1, 0.8196079, 1,
-0.07822792, -0.5861863, -2.977988, 0, 1, 0.827451, 1,
-0.07435822, -0.9918531, -3.315439, 0, 1, 0.8313726, 1,
-0.07179584, 1.758229, 1.626948, 0, 1, 0.8392157, 1,
-0.07148806, -0.1881864, -1.122022, 0, 1, 0.8431373, 1,
-0.06646173, 1.127602, -0.7989372, 0, 1, 0.8509804, 1,
-0.06380311, -0.5789063, -2.66797, 0, 1, 0.854902, 1,
-0.05993123, -0.2765217, -4.481514, 0, 1, 0.8627451, 1,
-0.05764538, 0.9480971, 1.294777, 0, 1, 0.8666667, 1,
-0.05675318, -1.70901, -3.712429, 0, 1, 0.8745098, 1,
-0.05456289, -1.270476, -2.312288, 0, 1, 0.8784314, 1,
-0.05415898, -0.03910476, -0.6828026, 0, 1, 0.8862745, 1,
-0.05363312, 0.8553386, -0.4833965, 0, 1, 0.8901961, 1,
-0.04104599, -0.04816488, -1.20233, 0, 1, 0.8980392, 1,
-0.03919546, 0.07083793, 1.700823, 0, 1, 0.9058824, 1,
-0.02380908, 2.525527, 0.2733594, 0, 1, 0.9098039, 1,
-0.01890255, -0.1912371, -2.112035, 0, 1, 0.9176471, 1,
-0.0175633, -1.492965, -3.1543, 0, 1, 0.9215686, 1,
-0.0165208, 0.6979567, 1.010304, 0, 1, 0.9294118, 1,
-0.01527918, 0.0280899, -0.3276706, 0, 1, 0.9333333, 1,
-0.01179283, 0.6333531, 0.006251558, 0, 1, 0.9411765, 1,
-0.009812181, -0.07614304, -3.251945, 0, 1, 0.945098, 1,
-0.009511485, 0.1546548, -1.398305, 0, 1, 0.9529412, 1,
-0.006749456, 0.8807533, -0.2082091, 0, 1, 0.9568627, 1,
-0.001776683, 0.5263128, 1.090503, 0, 1, 0.9647059, 1,
-0.0006024245, -1.504917, -3.264326, 0, 1, 0.9686275, 1,
-0.0003778049, -0.3773564, -3.32344, 0, 1, 0.9764706, 1,
0.0003161483, -0.7108854, 2.664327, 0, 1, 0.9803922, 1,
0.005694784, 1.279206, -0.2452947, 0, 1, 0.9882353, 1,
0.005955277, 1.039671, 1.755917, 0, 1, 0.9921569, 1,
0.006670319, -0.7187037, 1.531789, 0, 1, 1, 1,
0.01025204, -0.9747339, 3.454162, 0, 0.9921569, 1, 1,
0.01028292, -0.7374889, 3.260845, 0, 0.9882353, 1, 1,
0.01043579, -0.2677403, 2.651661, 0, 0.9803922, 1, 1,
0.0108592, 0.8680932, -0.3403856, 0, 0.9764706, 1, 1,
0.02207725, 0.5574427, 0.6606708, 0, 0.9686275, 1, 1,
0.02216543, 0.01668121, 3.9912, 0, 0.9647059, 1, 1,
0.02577288, 0.4207782, 0.7410344, 0, 0.9568627, 1, 1,
0.02819623, 0.1224841, 0.7024179, 0, 0.9529412, 1, 1,
0.02875034, -3.597226, 3.170301, 0, 0.945098, 1, 1,
0.03907526, -2.420472, 4.095419, 0, 0.9411765, 1, 1,
0.04129094, 1.029354, 0.2571914, 0, 0.9333333, 1, 1,
0.04205213, -0.5086373, 3.448675, 0, 0.9294118, 1, 1,
0.04552674, 0.4609487, 0.3700651, 0, 0.9215686, 1, 1,
0.0472597, -0.410433, 3.240578, 0, 0.9176471, 1, 1,
0.04814404, -0.192211, 2.919425, 0, 0.9098039, 1, 1,
0.0507516, -0.4553452, 2.39332, 0, 0.9058824, 1, 1,
0.05439248, 0.770391, 0.5256026, 0, 0.8980392, 1, 1,
0.0609493, -0.4586111, 3.608398, 0, 0.8901961, 1, 1,
0.06175196, -0.4420963, 1.246525, 0, 0.8862745, 1, 1,
0.06494826, -0.9485022, 2.302627, 0, 0.8784314, 1, 1,
0.06832974, 0.8020234, -1.57546, 0, 0.8745098, 1, 1,
0.06889857, 1.411629, 0.2121157, 0, 0.8666667, 1, 1,
0.07265083, 0.006985999, 1.33419, 0, 0.8627451, 1, 1,
0.0814321, 1.078843, -0.2393327, 0, 0.854902, 1, 1,
0.08185723, -0.4497843, 2.378466, 0, 0.8509804, 1, 1,
0.08481956, -0.533983, 1.681961, 0, 0.8431373, 1, 1,
0.08607566, 0.00838609, 0.6465323, 0, 0.8392157, 1, 1,
0.08942446, -1.15848, 4.035494, 0, 0.8313726, 1, 1,
0.089586, 0.9213215, 0.03930624, 0, 0.827451, 1, 1,
0.0897416, -2.269181, 3.591738, 0, 0.8196079, 1, 1,
0.09049817, -0.05252306, 1.783456, 0, 0.8156863, 1, 1,
0.09327512, 0.592209, 1.15748, 0, 0.8078431, 1, 1,
0.09543222, -0.6212699, 1.043854, 0, 0.8039216, 1, 1,
0.09711417, 0.7715775, 0.07008065, 0, 0.7960784, 1, 1,
0.0990826, 1.400672, -0.5876476, 0, 0.7882353, 1, 1,
0.09965415, -0.4721749, 3.110888, 0, 0.7843137, 1, 1,
0.1021663, 1.374703, -0.04596618, 0, 0.7764706, 1, 1,
0.102718, -0.7409241, 3.803703, 0, 0.772549, 1, 1,
0.1083387, -0.4192788, 2.674811, 0, 0.7647059, 1, 1,
0.109037, 0.4829616, -0.3049249, 0, 0.7607843, 1, 1,
0.112186, -2.251793, 2.607008, 0, 0.7529412, 1, 1,
0.1139222, 0.5762054, -0.9096237, 0, 0.7490196, 1, 1,
0.1140011, 0.4477442, -0.5619015, 0, 0.7411765, 1, 1,
0.114272, -1.098892, 3.44312, 0, 0.7372549, 1, 1,
0.1160693, 1.296542, -1.183339, 0, 0.7294118, 1, 1,
0.1184096, 0.02100444, 0.6963898, 0, 0.7254902, 1, 1,
0.1235266, -0.5461296, 3.337689, 0, 0.7176471, 1, 1,
0.1237836, 1.336509, 0.2501532, 0, 0.7137255, 1, 1,
0.1238345, -1.427903, 1.458734, 0, 0.7058824, 1, 1,
0.1249357, 1.972525, 0.6582784, 0, 0.6980392, 1, 1,
0.1326314, -0.5662571, 2.304109, 0, 0.6941177, 1, 1,
0.1370302, 0.5961916, 0.6936114, 0, 0.6862745, 1, 1,
0.138976, 0.5167318, -0.46176, 0, 0.682353, 1, 1,
0.1397401, -1.150791, 5.490291, 0, 0.6745098, 1, 1,
0.1403843, -0.8906304, 2.715933, 0, 0.6705883, 1, 1,
0.1455703, -0.5926161, 2.613244, 0, 0.6627451, 1, 1,
0.1458567, 1.593682, 0.1248114, 0, 0.6588235, 1, 1,
0.1472223, -1.613811, 4.183429, 0, 0.6509804, 1, 1,
0.1484351, -0.6320247, 3.417049, 0, 0.6470588, 1, 1,
0.1505576, 0.5226395, 1.524644, 0, 0.6392157, 1, 1,
0.1508068, -0.871863, 1.407262, 0, 0.6352941, 1, 1,
0.1630464, -0.2791849, 1.68248, 0, 0.627451, 1, 1,
0.163286, -1.158823, 3.910564, 0, 0.6235294, 1, 1,
0.168181, 1.153966, 2.134484, 0, 0.6156863, 1, 1,
0.1685269, -0.4817069, 3.927268, 0, 0.6117647, 1, 1,
0.1697429, -0.07572877, 1.838717, 0, 0.6039216, 1, 1,
0.1711727, 2.799034, 1.575111, 0, 0.5960785, 1, 1,
0.1724579, -0.9866055, 3.502194, 0, 0.5921569, 1, 1,
0.1736958, -1.544212, 3.775967, 0, 0.5843138, 1, 1,
0.1755731, 0.3127755, 2.064553, 0, 0.5803922, 1, 1,
0.1761132, 1.634069, 0.1017438, 0, 0.572549, 1, 1,
0.1792718, 0.9682835, -0.08149506, 0, 0.5686275, 1, 1,
0.1793962, -1.126853, 2.359222, 0, 0.5607843, 1, 1,
0.1856401, -0.3835743, 2.031927, 0, 0.5568628, 1, 1,
0.1861974, 0.237671, 1.399831, 0, 0.5490196, 1, 1,
0.1866961, -0.7852129, 3.447474, 0, 0.5450981, 1, 1,
0.1886094, -0.7197192, 2.78447, 0, 0.5372549, 1, 1,
0.1915002, -0.8260831, 2.535414, 0, 0.5333334, 1, 1,
0.1975194, -0.1803477, 1.414211, 0, 0.5254902, 1, 1,
0.2005262, 1.674997, 1.105263, 0, 0.5215687, 1, 1,
0.2038996, 2.267406, 0.9314573, 0, 0.5137255, 1, 1,
0.2072555, -1.128862, 3.526762, 0, 0.509804, 1, 1,
0.2076759, 0.2652138, -0.3078073, 0, 0.5019608, 1, 1,
0.2126823, -0.43328, 1.421616, 0, 0.4941176, 1, 1,
0.2145383, 0.9254339, -0.7098785, 0, 0.4901961, 1, 1,
0.2176943, -0.1954812, 1.083811, 0, 0.4823529, 1, 1,
0.2177921, -0.6585125, 1.685431, 0, 0.4784314, 1, 1,
0.2205192, 2.244694, 0.1050362, 0, 0.4705882, 1, 1,
0.2227492, -0.7762173, 3.114363, 0, 0.4666667, 1, 1,
0.2233243, -0.1334397, 2.612857, 0, 0.4588235, 1, 1,
0.2270645, 0.03876966, 3.540461, 0, 0.454902, 1, 1,
0.2286186, 0.2521039, -0.4418252, 0, 0.4470588, 1, 1,
0.2293385, 0.7370165, -0.2711381, 0, 0.4431373, 1, 1,
0.2301893, -1.045345, 2.400195, 0, 0.4352941, 1, 1,
0.2343465, 1.390795, 3.092497, 0, 0.4313726, 1, 1,
0.2371136, 0.06497546, 0.6245991, 0, 0.4235294, 1, 1,
0.2385219, -2.087962, 1.644005, 0, 0.4196078, 1, 1,
0.2451338, -0.413203, 1.928295, 0, 0.4117647, 1, 1,
0.2508219, -0.9048166, 3.110896, 0, 0.4078431, 1, 1,
0.2541571, 1.185727, 0.09230368, 0, 0.4, 1, 1,
0.2551723, 1.475307, -0.01526078, 0, 0.3921569, 1, 1,
0.2571988, 1.419852, 1.124592, 0, 0.3882353, 1, 1,
0.2586466, -1.155183, 3.875355, 0, 0.3803922, 1, 1,
0.2606531, -0.7000036, 1.428926, 0, 0.3764706, 1, 1,
0.2619761, 0.3920738, 1.157701, 0, 0.3686275, 1, 1,
0.2624592, 0.2503439, 2.37648, 0, 0.3647059, 1, 1,
0.2643169, 0.1550097, 3.784883, 0, 0.3568628, 1, 1,
0.2651777, 1.196019, 0.8246149, 0, 0.3529412, 1, 1,
0.2686245, -1.799298, 4.194887, 0, 0.345098, 1, 1,
0.2697973, -0.3991966, 2.466967, 0, 0.3411765, 1, 1,
0.2724409, -0.09047297, 0.8826959, 0, 0.3333333, 1, 1,
0.2725718, -1.149366, 1.765551, 0, 0.3294118, 1, 1,
0.2732359, -0.3093379, 2.400278, 0, 0.3215686, 1, 1,
0.2765729, 0.4153858, -0.3538499, 0, 0.3176471, 1, 1,
0.2775948, 0.6082639, -0.3941372, 0, 0.3098039, 1, 1,
0.2798446, 0.4620891, -0.8225467, 0, 0.3058824, 1, 1,
0.2815198, 1.011797, -0.1831033, 0, 0.2980392, 1, 1,
0.282966, 1.382389, 0.2093035, 0, 0.2901961, 1, 1,
0.2832437, 1.061806, 0.9051264, 0, 0.2862745, 1, 1,
0.2844013, -1.446583, 3.108885, 0, 0.2784314, 1, 1,
0.2846373, 0.6865591, 0.1819804, 0, 0.2745098, 1, 1,
0.2857037, -3.058004, 2.451011, 0, 0.2666667, 1, 1,
0.2894526, 1.30018, 0.1098364, 0, 0.2627451, 1, 1,
0.2905157, 0.2596872, -0.05988611, 0, 0.254902, 1, 1,
0.2975809, -1.3518, 2.634309, 0, 0.2509804, 1, 1,
0.3131478, 0.5066475, -1.182036, 0, 0.2431373, 1, 1,
0.3139129, -0.07993937, 1.173257, 0, 0.2392157, 1, 1,
0.3149296, -0.8344288, 2.914276, 0, 0.2313726, 1, 1,
0.3171053, 0.9686304, 0.2451715, 0, 0.227451, 1, 1,
0.3190527, -0.6007597, 1.711269, 0, 0.2196078, 1, 1,
0.322058, 0.9283745, -0.3353863, 0, 0.2156863, 1, 1,
0.3251436, 1.207107, -0.1087922, 0, 0.2078431, 1, 1,
0.3251622, -0.5059125, 0.9117879, 0, 0.2039216, 1, 1,
0.3261152, 0.3484361, -0.362742, 0, 0.1960784, 1, 1,
0.3263704, -1.103274, 2.703808, 0, 0.1882353, 1, 1,
0.3336999, -1.016948, 1.7853, 0, 0.1843137, 1, 1,
0.3343285, 0.2837971, -1.024954, 0, 0.1764706, 1, 1,
0.3376001, 0.07587355, 2.35998, 0, 0.172549, 1, 1,
0.3377472, -1.188455, 4.232939, 0, 0.1647059, 1, 1,
0.3406052, 0.01295167, 0.4136069, 0, 0.1607843, 1, 1,
0.3423505, 0.4675058, 0.966939, 0, 0.1529412, 1, 1,
0.3445581, 0.8614371, 0.1524212, 0, 0.1490196, 1, 1,
0.3486847, 0.397529, 1.408528, 0, 0.1411765, 1, 1,
0.3490206, 0.3630483, -1.359952, 0, 0.1372549, 1, 1,
0.3505896, 1.184093, 1.54934, 0, 0.1294118, 1, 1,
0.3524543, 0.3504017, 0.6649117, 0, 0.1254902, 1, 1,
0.352631, -1.36436, 3.141551, 0, 0.1176471, 1, 1,
0.3527943, -0.3626096, 0.9943866, 0, 0.1137255, 1, 1,
0.3528091, 1.75766, 0.314896, 0, 0.1058824, 1, 1,
0.3581413, -0.525345, 2.772219, 0, 0.09803922, 1, 1,
0.3583162, -1.313748, 4.046175, 0, 0.09411765, 1, 1,
0.3617819, 1.0651, 0.9143044, 0, 0.08627451, 1, 1,
0.3702769, 0.003285685, 1.641241, 0, 0.08235294, 1, 1,
0.3726026, 0.4640747, -0.07424861, 0, 0.07450981, 1, 1,
0.372843, 0.7853951, 1.515486, 0, 0.07058824, 1, 1,
0.3757416, 0.0881677, 3.437073, 0, 0.0627451, 1, 1,
0.3836755, -1.439787, 2.976338, 0, 0.05882353, 1, 1,
0.3856901, 1.169309, 1.354203, 0, 0.05098039, 1, 1,
0.3874063, 0.004859942, -0.1939691, 0, 0.04705882, 1, 1,
0.3894493, -0.2500046, 1.969072, 0, 0.03921569, 1, 1,
0.3919813, -0.8417263, 4.136548, 0, 0.03529412, 1, 1,
0.3923908, -1.467035, 1.67854, 0, 0.02745098, 1, 1,
0.3931183, -1.365131, 2.508485, 0, 0.02352941, 1, 1,
0.393602, -0.05219759, 1.754178, 0, 0.01568628, 1, 1,
0.4066692, 0.03651603, 1.058756, 0, 0.01176471, 1, 1,
0.4091152, -1.829087, 2.123738, 0, 0.003921569, 1, 1,
0.4101179, -0.1059289, 1.051521, 0.003921569, 0, 1, 1,
0.4114019, 2.050256, -1.308372, 0.007843138, 0, 1, 1,
0.4119958, 0.5207599, 1.103956, 0.01568628, 0, 1, 1,
0.4134359, -1.437187, 2.929541, 0.01960784, 0, 1, 1,
0.4165019, 0.8039107, 0.9180777, 0.02745098, 0, 1, 1,
0.4173274, 0.9719933, 1.91871, 0.03137255, 0, 1, 1,
0.4187253, -0.2262477, 3.291723, 0.03921569, 0, 1, 1,
0.4215767, -1.762256, 2.54532, 0.04313726, 0, 1, 1,
0.4250105, -0.08068216, 4.020376, 0.05098039, 0, 1, 1,
0.4252736, 1.028628, 2.117846, 0.05490196, 0, 1, 1,
0.4301589, 0.1795065, 0.2379828, 0.0627451, 0, 1, 1,
0.4347174, 0.9327141, -0.471247, 0.06666667, 0, 1, 1,
0.4424327, -0.01483624, 0.7628888, 0.07450981, 0, 1, 1,
0.443776, -0.1358726, 2.336076, 0.07843138, 0, 1, 1,
0.4439901, 0.6454444, 0.7341589, 0.08627451, 0, 1, 1,
0.4472209, -0.3995141, 2.393004, 0.09019608, 0, 1, 1,
0.4493361, 0.3970164, -0.1534423, 0.09803922, 0, 1, 1,
0.4511826, -0.9966408, 3.393985, 0.1058824, 0, 1, 1,
0.4542862, -0.3358895, 3.072761, 0.1098039, 0, 1, 1,
0.4544347, -0.2635352, 3.642755, 0.1176471, 0, 1, 1,
0.4608047, -1.932618, 4.662014, 0.1215686, 0, 1, 1,
0.4665647, -0.741585, 2.964471, 0.1294118, 0, 1, 1,
0.4708575, 1.05993, -0.593223, 0.1333333, 0, 1, 1,
0.4723626, 1.396418, -0.3552494, 0.1411765, 0, 1, 1,
0.4728664, 1.68455, 1.328743, 0.145098, 0, 1, 1,
0.4747861, -0.6182542, 2.805951, 0.1529412, 0, 1, 1,
0.4767132, 1.427404, -0.223145, 0.1568628, 0, 1, 1,
0.4772363, -0.8506597, 2.564131, 0.1647059, 0, 1, 1,
0.4830315, 0.8948482, -0.2242282, 0.1686275, 0, 1, 1,
0.4844093, -0.9118677, 3.900609, 0.1764706, 0, 1, 1,
0.4858421, -0.8536696, -0.4871651, 0.1803922, 0, 1, 1,
0.4876949, 1.165574, 0.1134253, 0.1882353, 0, 1, 1,
0.4878119, 2.594764, -0.3284676, 0.1921569, 0, 1, 1,
0.4900588, -0.9629951, 1.576235, 0.2, 0, 1, 1,
0.4917066, -1.307087, 2.230201, 0.2078431, 0, 1, 1,
0.494547, 0.5294226, 3.459389, 0.2117647, 0, 1, 1,
0.494798, 1.825811, 0.3893224, 0.2196078, 0, 1, 1,
0.4971626, -0.8696226, 3.13335, 0.2235294, 0, 1, 1,
0.4974486, 0.07401288, -0.2174254, 0.2313726, 0, 1, 1,
0.5033739, 0.2806996, -0.4431908, 0.2352941, 0, 1, 1,
0.503485, 0.6053002, -0.3015953, 0.2431373, 0, 1, 1,
0.5055418, 0.2025603, 2.692366, 0.2470588, 0, 1, 1,
0.5102939, 0.6222656, 1.533567, 0.254902, 0, 1, 1,
0.5139408, -0.06838519, 1.528704, 0.2588235, 0, 1, 1,
0.5149119, 0.2225436, 1.634522, 0.2666667, 0, 1, 1,
0.5235645, 0.3097899, 1.52955, 0.2705882, 0, 1, 1,
0.52372, -0.4942583, 2.356499, 0.2784314, 0, 1, 1,
0.5330676, -0.1957058, -0.09590942, 0.282353, 0, 1, 1,
0.534523, 0.8007055, 0.261165, 0.2901961, 0, 1, 1,
0.5350208, 0.6071545, 0.4324957, 0.2941177, 0, 1, 1,
0.546499, 0.3341819, 0.2548267, 0.3019608, 0, 1, 1,
0.5484644, -0.07610748, 2.182083, 0.3098039, 0, 1, 1,
0.5544416, 0.223501, 1.0874, 0.3137255, 0, 1, 1,
0.5562844, 0.6237469, 1.333256, 0.3215686, 0, 1, 1,
0.5599777, -0.7682592, 3.400057, 0.3254902, 0, 1, 1,
0.5663125, 0.4854659, -0.04745873, 0.3333333, 0, 1, 1,
0.5769343, -0.1894195, 1.684999, 0.3372549, 0, 1, 1,
0.5835635, 0.03115662, 0.205767, 0.345098, 0, 1, 1,
0.5907227, -0.2230158, 1.310932, 0.3490196, 0, 1, 1,
0.5951334, 1.15477, 0.3314704, 0.3568628, 0, 1, 1,
0.5985379, -0.5090523, 2.236224, 0.3607843, 0, 1, 1,
0.601804, -0.05497641, 0.3661784, 0.3686275, 0, 1, 1,
0.6028547, -0.3611791, 2.982027, 0.372549, 0, 1, 1,
0.6051133, -0.2998423, 2.460563, 0.3803922, 0, 1, 1,
0.6067909, -1.77432, 1.512937, 0.3843137, 0, 1, 1,
0.608902, 0.03449302, 0.9517693, 0.3921569, 0, 1, 1,
0.6091241, 0.1829959, 0.3572068, 0.3960784, 0, 1, 1,
0.6173789, 2.0797, -0.1210273, 0.4039216, 0, 1, 1,
0.6241998, 1.132151, 0.8438378, 0.4117647, 0, 1, 1,
0.6247204, -1.405402, 1.884068, 0.4156863, 0, 1, 1,
0.6253153, 1.836868, -1.711642, 0.4235294, 0, 1, 1,
0.6266007, -1.281839, 0.1734054, 0.427451, 0, 1, 1,
0.6275645, -0.8412266, 3.121305, 0.4352941, 0, 1, 1,
0.6279316, -0.1445097, 2.371083, 0.4392157, 0, 1, 1,
0.6399093, -1.158701, 1.76195, 0.4470588, 0, 1, 1,
0.6453891, 1.07432, -0.7643331, 0.4509804, 0, 1, 1,
0.6554826, -0.7172928, 3.973266, 0.4588235, 0, 1, 1,
0.6590146, 0.02801237, 1.197087, 0.4627451, 0, 1, 1,
0.6613013, 0.7885516, 0.5527052, 0.4705882, 0, 1, 1,
0.6649918, 0.0201457, 2.55266, 0.4745098, 0, 1, 1,
0.6649954, -0.6158851, 2.563521, 0.4823529, 0, 1, 1,
0.672747, 0.6715419, 1.108573, 0.4862745, 0, 1, 1,
0.6747491, -1.876261, 4.987296, 0.4941176, 0, 1, 1,
0.6774104, -0.5058644, 2.629052, 0.5019608, 0, 1, 1,
0.6787422, 0.7479292, -1.073823, 0.5058824, 0, 1, 1,
0.6896624, 0.1481928, -0.1230034, 0.5137255, 0, 1, 1,
0.6904984, 0.2499007, 1.279073, 0.5176471, 0, 1, 1,
0.6941898, -0.2143971, 1.067348, 0.5254902, 0, 1, 1,
0.6955813, -0.8556168, 2.981145, 0.5294118, 0, 1, 1,
0.6956881, -0.3562335, 1.16654, 0.5372549, 0, 1, 1,
0.6963326, -0.0006454777, 1.71919, 0.5411765, 0, 1, 1,
0.7004674, -1.059816, 2.380958, 0.5490196, 0, 1, 1,
0.7005254, -0.7868522, 2.859231, 0.5529412, 0, 1, 1,
0.7020229, 0.483533, 0.3511733, 0.5607843, 0, 1, 1,
0.7029637, -0.4606917, 1.930398, 0.5647059, 0, 1, 1,
0.7059187, 0.296966, 0.4086764, 0.572549, 0, 1, 1,
0.7096045, 0.05609217, -0.04848164, 0.5764706, 0, 1, 1,
0.7176408, -0.7981785, 4.157181, 0.5843138, 0, 1, 1,
0.7294726, -0.2186607, 0.005219738, 0.5882353, 0, 1, 1,
0.7312293, -1.233054, 1.909711, 0.5960785, 0, 1, 1,
0.7494143, 1.739828, 1.011909, 0.6039216, 0, 1, 1,
0.749742, -0.8017, 0.4873704, 0.6078432, 0, 1, 1,
0.765768, -0.2342119, 1.116546, 0.6156863, 0, 1, 1,
0.7684012, -0.05515152, 0.8583196, 0.6196079, 0, 1, 1,
0.7702579, 0.6260834, 2.040107, 0.627451, 0, 1, 1,
0.7713514, 1.156547, 0.2086045, 0.6313726, 0, 1, 1,
0.771686, -0.4726166, 2.285582, 0.6392157, 0, 1, 1,
0.7726797, 0.2925139, 2.054592, 0.6431373, 0, 1, 1,
0.7769893, 1.76377, 1.129974, 0.6509804, 0, 1, 1,
0.7791768, -0.5026515, 2.027033, 0.654902, 0, 1, 1,
0.7792264, -0.1880345, 2.318562, 0.6627451, 0, 1, 1,
0.7805324, 2.301377, 0.9614822, 0.6666667, 0, 1, 1,
0.7917897, -0.1434025, 2.322341, 0.6745098, 0, 1, 1,
0.7922671, -0.775842, 3.217072, 0.6784314, 0, 1, 1,
0.7926294, 1.803868, 0.1609268, 0.6862745, 0, 1, 1,
0.7931212, 0.3412354, 2.687207, 0.6901961, 0, 1, 1,
0.7935059, 0.7600687, 1.488206, 0.6980392, 0, 1, 1,
0.7964108, 1.646203, 0.6551163, 0.7058824, 0, 1, 1,
0.8026578, 1.170744, -0.1090537, 0.7098039, 0, 1, 1,
0.8034902, 0.9835284, -0.9651103, 0.7176471, 0, 1, 1,
0.8040659, 0.9304128, -0.3116337, 0.7215686, 0, 1, 1,
0.8069226, -0.7494598, 1.787443, 0.7294118, 0, 1, 1,
0.8071468, 1.532448, -0.3517252, 0.7333333, 0, 1, 1,
0.8119406, -0.05902358, 2.385274, 0.7411765, 0, 1, 1,
0.8147528, 0.243702, 0.4121248, 0.7450981, 0, 1, 1,
0.8176813, 0.4591247, 2.718601, 0.7529412, 0, 1, 1,
0.8199396, -1.507289, 2.133494, 0.7568628, 0, 1, 1,
0.8199627, 0.6331197, -0.104504, 0.7647059, 0, 1, 1,
0.8213255, -0.2464444, 1.163247, 0.7686275, 0, 1, 1,
0.8261556, 0.7108696, 0.9123778, 0.7764706, 0, 1, 1,
0.8288652, -0.5909575, 2.625054, 0.7803922, 0, 1, 1,
0.8299623, 0.463249, -0.2107838, 0.7882353, 0, 1, 1,
0.8450672, -0.5540743, 1.765025, 0.7921569, 0, 1, 1,
0.8484145, 1.254662, 0.4149312, 0.8, 0, 1, 1,
0.8499709, 0.1735209, 1.012188, 0.8078431, 0, 1, 1,
0.8543189, -0.06963877, 0.3954298, 0.8117647, 0, 1, 1,
0.8578684, 1.012951, -0.5253349, 0.8196079, 0, 1, 1,
0.8628368, -0.6878176, 1.622588, 0.8235294, 0, 1, 1,
0.8735631, -1.337133, 1.955703, 0.8313726, 0, 1, 1,
0.8736392, -0.7360249, 2.473248, 0.8352941, 0, 1, 1,
0.8764963, 0.4390306, -0.710542, 0.8431373, 0, 1, 1,
0.87813, 0.1589355, 1.026786, 0.8470588, 0, 1, 1,
0.8785986, -0.5864756, 2.74117, 0.854902, 0, 1, 1,
0.8807117, -0.8765122, 0.1865826, 0.8588235, 0, 1, 1,
0.8885308, -0.8744288, 1.519919, 0.8666667, 0, 1, 1,
0.8919175, 0.2268216, 1.159281, 0.8705882, 0, 1, 1,
0.8947737, -0.2740334, 0.5231648, 0.8784314, 0, 1, 1,
0.8950352, 0.8804774, 1.404309, 0.8823529, 0, 1, 1,
0.9004271, -0.7716326, 3.057937, 0.8901961, 0, 1, 1,
0.9016408, 0.3220085, 1.135026, 0.8941177, 0, 1, 1,
0.9018626, 0.3997113, 1.354427, 0.9019608, 0, 1, 1,
0.9023972, 0.9996693, -0.5345805, 0.9098039, 0, 1, 1,
0.9040236, 0.7283031, 0.8898241, 0.9137255, 0, 1, 1,
0.9157919, 0.1122181, 1.144411, 0.9215686, 0, 1, 1,
0.9172465, 1.77022, 0.3486886, 0.9254902, 0, 1, 1,
0.9176555, -0.08751225, 2.316806, 0.9333333, 0, 1, 1,
0.9241017, -0.07403282, 2.356109, 0.9372549, 0, 1, 1,
0.9304705, -1.278435, 2.658628, 0.945098, 0, 1, 1,
0.9328154, 0.8773332, -0.4022475, 0.9490196, 0, 1, 1,
0.9361798, -2.028413, 3.112144, 0.9568627, 0, 1, 1,
0.948402, 0.1536176, 1.891555, 0.9607843, 0, 1, 1,
0.9496758, -1.119742, 2.711382, 0.9686275, 0, 1, 1,
0.9532299, -0.3622729, 2.390278, 0.972549, 0, 1, 1,
0.9551904, -1.359975, 2.745133, 0.9803922, 0, 1, 1,
0.9582694, -0.3546364, 3.228452, 0.9843137, 0, 1, 1,
0.9611259, 0.6031432, 1.031, 0.9921569, 0, 1, 1,
0.9625748, -0.462247, 2.398896, 0.9960784, 0, 1, 1,
0.9632786, -0.05862335, 3.430107, 1, 0, 0.9960784, 1,
0.9653425, -0.06947996, 1.486901, 1, 0, 0.9882353, 1,
0.9702767, 1.82886, 0.489207, 1, 0, 0.9843137, 1,
0.9716305, 0.2694359, 1.222793, 1, 0, 0.9764706, 1,
0.9776646, -1.333233, 2.901633, 1, 0, 0.972549, 1,
0.9792004, 2.312984, 1.646833, 1, 0, 0.9647059, 1,
0.9894528, -1.81041, 2.523879, 1, 0, 0.9607843, 1,
0.9898862, -0.006124325, 1.605148, 1, 0, 0.9529412, 1,
1.009769, 0.2687639, 1.872843, 1, 0, 0.9490196, 1,
1.020114, 0.7808741, 0.9863127, 1, 0, 0.9411765, 1,
1.021418, 1.028526, 1.601228, 1, 0, 0.9372549, 1,
1.022553, -0.6834993, 3.403128, 1, 0, 0.9294118, 1,
1.022907, 0.9040691, 1.644809, 1, 0, 0.9254902, 1,
1.026522, 0.03766945, 0.880933, 1, 0, 0.9176471, 1,
1.029698, -0.8568757, 2.410467, 1, 0, 0.9137255, 1,
1.031358, -1.355789, 2.844208, 1, 0, 0.9058824, 1,
1.036459, 0.8272585, 2.403851, 1, 0, 0.9019608, 1,
1.038905, -1.082174, 1.635908, 1, 0, 0.8941177, 1,
1.03977, 0.6243836, 0.9904009, 1, 0, 0.8862745, 1,
1.050601, -0.8453708, 1.266274, 1, 0, 0.8823529, 1,
1.053803, -1.152132, 1.909914, 1, 0, 0.8745098, 1,
1.05951, 0.227309, -0.3922173, 1, 0, 0.8705882, 1,
1.068635, 0.08142045, 1.217567, 1, 0, 0.8627451, 1,
1.072808, -0.6606022, 1.370288, 1, 0, 0.8588235, 1,
1.07631, -1.075038, 2.567199, 1, 0, 0.8509804, 1,
1.078138, 0.5027744, -0.1027936, 1, 0, 0.8470588, 1,
1.079498, -0.2048878, 2.964216, 1, 0, 0.8392157, 1,
1.080586, 1.280091, 0.4649753, 1, 0, 0.8352941, 1,
1.083235, 0.1410451, 1.482823, 1, 0, 0.827451, 1,
1.084874, 0.1862577, 1.409715, 1, 0, 0.8235294, 1,
1.086433, 0.4921472, 2.093688, 1, 0, 0.8156863, 1,
1.087442, 0.5098462, 0.006809758, 1, 0, 0.8117647, 1,
1.088812, -0.4399908, 0.5863368, 1, 0, 0.8039216, 1,
1.08925, 0.0762879, 0.8658442, 1, 0, 0.7960784, 1,
1.091585, -0.6156296, 1.124954, 1, 0, 0.7921569, 1,
1.096759, 2.381532, 0.663214, 1, 0, 0.7843137, 1,
1.097548, 1.113449, 2.177654, 1, 0, 0.7803922, 1,
1.098114, -0.3376508, 2.148849, 1, 0, 0.772549, 1,
1.102104, -0.06116587, 1.285505, 1, 0, 0.7686275, 1,
1.105045, -0.07891808, 1.51031, 1, 0, 0.7607843, 1,
1.107242, 0.6139832, 0.445431, 1, 0, 0.7568628, 1,
1.110968, 1.171816, 0.3415558, 1, 0, 0.7490196, 1,
1.113434, -1.203138, 1.588718, 1, 0, 0.7450981, 1,
1.117745, -0.7853021, 4.397742, 1, 0, 0.7372549, 1,
1.121156, 0.4196596, 3.301592, 1, 0, 0.7333333, 1,
1.131563, -0.02207769, 1.757726, 1, 0, 0.7254902, 1,
1.132016, 1.147137, 0.07627803, 1, 0, 0.7215686, 1,
1.144509, -0.2321013, 1.082555, 1, 0, 0.7137255, 1,
1.145183, -0.6464416, 3.063793, 1, 0, 0.7098039, 1,
1.154217, 1.16882, 1.078496, 1, 0, 0.7019608, 1,
1.159557, -1.00878, 2.036309, 1, 0, 0.6941177, 1,
1.160825, 0.2527335, 1.211846, 1, 0, 0.6901961, 1,
1.170878, -1.096568, 1.89087, 1, 0, 0.682353, 1,
1.177529, 1.136818, 0.4452794, 1, 0, 0.6784314, 1,
1.178047, -1.670534, 1.681412, 1, 0, 0.6705883, 1,
1.183182, 2.297433, -0.4862649, 1, 0, 0.6666667, 1,
1.190388, -1.893305, 2.596439, 1, 0, 0.6588235, 1,
1.198623, 0.6893179, 3.446597, 1, 0, 0.654902, 1,
1.202515, -0.3316844, 1.643884, 1, 0, 0.6470588, 1,
1.205889, -0.2210294, 1.600687, 1, 0, 0.6431373, 1,
1.213584, -0.02010624, 0.9157839, 1, 0, 0.6352941, 1,
1.2232, 0.3409156, 2.661881, 1, 0, 0.6313726, 1,
1.230739, -0.5253218, 2.308124, 1, 0, 0.6235294, 1,
1.23769, 0.3061246, 2.254288, 1, 0, 0.6196079, 1,
1.245099, 0.3760598, 0.7788726, 1, 0, 0.6117647, 1,
1.251028, 1.057805, -0.975531, 1, 0, 0.6078432, 1,
1.260598, -1.664901, 3.590951, 1, 0, 0.6, 1,
1.262845, 1.229279, 1.971891, 1, 0, 0.5921569, 1,
1.264623, -0.4070362, 2.031991, 1, 0, 0.5882353, 1,
1.267893, 0.03938643, 2.340502, 1, 0, 0.5803922, 1,
1.270838, 0.207654, 0.5222188, 1, 0, 0.5764706, 1,
1.272868, 1.081183, 0.9308449, 1, 0, 0.5686275, 1,
1.280906, 0.1523161, 1.625335, 1, 0, 0.5647059, 1,
1.300605, 0.8347264, 2.235102, 1, 0, 0.5568628, 1,
1.301261, -1.264502, 3.182264, 1, 0, 0.5529412, 1,
1.310224, -1.086884, 2.294024, 1, 0, 0.5450981, 1,
1.312875, 0.1611375, 0.4213148, 1, 0, 0.5411765, 1,
1.314986, -0.1019451, 2.922769, 1, 0, 0.5333334, 1,
1.320857, 0.7489441, 2.510522, 1, 0, 0.5294118, 1,
1.326318, 1.230412, -0.9792421, 1, 0, 0.5215687, 1,
1.337397, -0.6550695, 2.603393, 1, 0, 0.5176471, 1,
1.340643, 2.004817, -0.6095205, 1, 0, 0.509804, 1,
1.34132, -0.3825637, 1.839505, 1, 0, 0.5058824, 1,
1.346306, 0.1939566, 1.297392, 1, 0, 0.4980392, 1,
1.348004, -0.05806183, 0.7124059, 1, 0, 0.4901961, 1,
1.348246, -0.5749463, 2.980477, 1, 0, 0.4862745, 1,
1.360109, 0.998706, -0.5955678, 1, 0, 0.4784314, 1,
1.362875, -1.695833, 0.5965156, 1, 0, 0.4745098, 1,
1.366571, -0.5487172, 1.208092, 1, 0, 0.4666667, 1,
1.374946, -0.9535223, 1.789765, 1, 0, 0.4627451, 1,
1.393425, -0.02343662, 2.136972, 1, 0, 0.454902, 1,
1.40853, 1.48589, 0.1566108, 1, 0, 0.4509804, 1,
1.409279, 0.3878416, 0.5318695, 1, 0, 0.4431373, 1,
1.428918, 1.535525, 0.1124768, 1, 0, 0.4392157, 1,
1.437373, -1.132619, -0.3324119, 1, 0, 0.4313726, 1,
1.439567, -0.545355, 1.669194, 1, 0, 0.427451, 1,
1.446086, 0.4562636, 0.7026197, 1, 0, 0.4196078, 1,
1.461389, 0.124457, 2.882033, 1, 0, 0.4156863, 1,
1.467084, -0.9226242, 1.769068, 1, 0, 0.4078431, 1,
1.467113, -1.109608, 2.616995, 1, 0, 0.4039216, 1,
1.47994, -1.901327, 0.3664156, 1, 0, 0.3960784, 1,
1.492424, 0.2858297, 0.4361486, 1, 0, 0.3882353, 1,
1.493939, -1.037822, 0.8756189, 1, 0, 0.3843137, 1,
1.495795, -1.740651, 1.947008, 1, 0, 0.3764706, 1,
1.501308, -0.5139596, 2.290833, 1, 0, 0.372549, 1,
1.515601, -1.656509, 3.013266, 1, 0, 0.3647059, 1,
1.520901, -0.3855959, 3.340871, 1, 0, 0.3607843, 1,
1.521553, -0.9562562, 2.136917, 1, 0, 0.3529412, 1,
1.526363, -0.4377544, 0.982916, 1, 0, 0.3490196, 1,
1.530533, -1.090141, 3.668408, 1, 0, 0.3411765, 1,
1.555209, 1.08321, 0.249136, 1, 0, 0.3372549, 1,
1.563682, -0.8003607, 2.334595, 1, 0, 0.3294118, 1,
1.57307, 0.7447871, 2.4746, 1, 0, 0.3254902, 1,
1.575308, -1.190794, 0.4808987, 1, 0, 0.3176471, 1,
1.595107, -0.3632899, 1.908913, 1, 0, 0.3137255, 1,
1.595276, 0.9279948, 1.037756, 1, 0, 0.3058824, 1,
1.599576, -0.2893748, 0.5287028, 1, 0, 0.2980392, 1,
1.606914, 0.4593928, 1.28867, 1, 0, 0.2941177, 1,
1.613054, -0.01701355, 0.8336083, 1, 0, 0.2862745, 1,
1.62554, 0.5075305, 1.471727, 1, 0, 0.282353, 1,
1.641579, 0.1238933, 1.788875, 1, 0, 0.2745098, 1,
1.648543, 0.7185558, 1.944675, 1, 0, 0.2705882, 1,
1.667271, 0.5576364, 1.996799, 1, 0, 0.2627451, 1,
1.674839, 0.7812293, 0.5677053, 1, 0, 0.2588235, 1,
1.687324, 1.146663, 0.8431313, 1, 0, 0.2509804, 1,
1.689549, 0.7514648, 0.9985988, 1, 0, 0.2470588, 1,
1.697597, -1.288378, 2.23872, 1, 0, 0.2392157, 1,
1.707667, -0.1785722, -0.1435608, 1, 0, 0.2352941, 1,
1.716576, 0.06700815, 0.08717824, 1, 0, 0.227451, 1,
1.74515, 1.754688, 0.544627, 1, 0, 0.2235294, 1,
1.759124, -0.4033195, 2.352705, 1, 0, 0.2156863, 1,
1.763562, -0.4886814, 0.9897704, 1, 0, 0.2117647, 1,
1.777509, -1.127689, 3.774422, 1, 0, 0.2039216, 1,
1.807564, 0.9336033, -0.9755188, 1, 0, 0.1960784, 1,
1.824284, 0.7997813, -0.7859247, 1, 0, 0.1921569, 1,
1.826368, 0.6101952, 1.637568, 1, 0, 0.1843137, 1,
1.829891, -0.5479867, 2.084947, 1, 0, 0.1803922, 1,
1.833411, 2.324627, -0.5821622, 1, 0, 0.172549, 1,
1.851002, 0.8000911, 2.388738, 1, 0, 0.1686275, 1,
1.852154, -0.7537715, 2.050517, 1, 0, 0.1607843, 1,
1.858563, 1.394274, 0.08897068, 1, 0, 0.1568628, 1,
1.86768, -0.852775, -0.6435927, 1, 0, 0.1490196, 1,
1.879591, -1.618745, 1.915459, 1, 0, 0.145098, 1,
1.882522, 0.02314536, 1.776577, 1, 0, 0.1372549, 1,
1.947163, -0.2582062, 1.663942, 1, 0, 0.1333333, 1,
1.950485, -1.132257, 3.282379, 1, 0, 0.1254902, 1,
1.96383, 0.226048, 4.240035, 1, 0, 0.1215686, 1,
1.964418, 0.2129165, 1.335319, 1, 0, 0.1137255, 1,
1.990533, 0.1683403, 1.51775, 1, 0, 0.1098039, 1,
1.996661, 0.5264626, 1.987272, 1, 0, 0.1019608, 1,
2.018075, -0.2205717, 0.869742, 1, 0, 0.09411765, 1,
2.032509, 1.133664, 0.92055, 1, 0, 0.09019608, 1,
2.072336, -1.154865, 2.352642, 1, 0, 0.08235294, 1,
2.094912, 0.5016748, 1.982794, 1, 0, 0.07843138, 1,
2.116243, -0.7038854, 2.488539, 1, 0, 0.07058824, 1,
2.172587, -0.4202469, 2.161762, 1, 0, 0.06666667, 1,
2.180916, -0.1069624, 1.919296, 1, 0, 0.05882353, 1,
2.223117, -1.135908, 1.859402, 1, 0, 0.05490196, 1,
2.264804, -0.5310615, 2.615667, 1, 0, 0.04705882, 1,
2.33575, 0.0431888, 1.694978, 1, 0, 0.04313726, 1,
2.342773, 1.480861, 1.772484, 1, 0, 0.03529412, 1,
2.584989, -0.9209367, 1.604879, 1, 0, 0.03137255, 1,
2.707782, -0.3186211, 1.416511, 1, 0, 0.02352941, 1,
2.79783, -0.4069151, 0.779466, 1, 0, 0.01960784, 1,
3.154511, 0.7785687, 0.502146, 1, 0, 0.01176471, 1,
3.455669, -0.8181608, 1.413311, 1, 0, 0.007843138, 1
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
0.09261632, -4.779462, -7.391086, 0, -0.5, 0.5, 0.5,
0.09261632, -4.779462, -7.391086, 1, -0.5, 0.5, 0.5,
0.09261632, -4.779462, -7.391086, 1, 1.5, 0.5, 0.5,
0.09261632, -4.779462, -7.391086, 0, 1.5, 0.5, 0.5
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
-4.410511, -0.1098027, -7.391086, 0, -0.5, 0.5, 0.5,
-4.410511, -0.1098027, -7.391086, 1, -0.5, 0.5, 0.5,
-4.410511, -0.1098027, -7.391086, 1, 1.5, 0.5, 0.5,
-4.410511, -0.1098027, -7.391086, 0, 1.5, 0.5, 0.5
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
-4.410511, -4.779462, -0.01692438, 0, -0.5, 0.5, 0.5,
-4.410511, -4.779462, -0.01692438, 1, -0.5, 0.5, 0.5,
-4.410511, -4.779462, -0.01692438, 1, 1.5, 0.5, 0.5,
-4.410511, -4.779462, -0.01692438, 0, 1.5, 0.5, 0.5
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
-3, -3.701849, -5.689356,
3, -3.701849, -5.689356,
-3, -3.701849, -5.689356,
-3, -3.881451, -5.972978,
-2, -3.701849, -5.689356,
-2, -3.881451, -5.972978,
-1, -3.701849, -5.689356,
-1, -3.881451, -5.972978,
0, -3.701849, -5.689356,
0, -3.881451, -5.972978,
1, -3.701849, -5.689356,
1, -3.881451, -5.972978,
2, -3.701849, -5.689356,
2, -3.881451, -5.972978,
3, -3.701849, -5.689356,
3, -3.881451, -5.972978
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
-3, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
-3, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
-3, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
-3, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
-2, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
-2, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
-2, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
-2, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
-1, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
-1, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
-1, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
-1, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
0, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
0, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
0, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
0, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
1, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
1, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
1, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
1, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
2, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
2, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
2, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
2, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5,
3, -4.240655, -6.540221, 0, -0.5, 0.5, 0.5,
3, -4.240655, -6.540221, 1, -0.5, 0.5, 0.5,
3, -4.240655, -6.540221, 1, 1.5, 0.5, 0.5,
3, -4.240655, -6.540221, 0, 1.5, 0.5, 0.5
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
-3.371328, -3, -5.689356,
-3.371328, 3, -5.689356,
-3.371328, -3, -5.689356,
-3.544525, -3, -5.972978,
-3.371328, -2, -5.689356,
-3.544525, -2, -5.972978,
-3.371328, -1, -5.689356,
-3.544525, -1, -5.972978,
-3.371328, 0, -5.689356,
-3.544525, 0, -5.972978,
-3.371328, 1, -5.689356,
-3.544525, 1, -5.972978,
-3.371328, 2, -5.689356,
-3.544525, 2, -5.972978,
-3.371328, 3, -5.689356,
-3.544525, 3, -5.972978
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
-3.890919, -3, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, -3, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, -3, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, -3, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, -2, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, -2, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, -2, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, -2, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, -1, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, -1, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, -1, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, -1, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, 0, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, 0, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, 0, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, 0, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, 1, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, 1, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, 1, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, 1, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, 2, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, 2, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, 2, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, 2, -6.540221, 0, 1.5, 0.5, 0.5,
-3.890919, 3, -6.540221, 0, -0.5, 0.5, 0.5,
-3.890919, 3, -6.540221, 1, -0.5, 0.5, 0.5,
-3.890919, 3, -6.540221, 1, 1.5, 0.5, 0.5,
-3.890919, 3, -6.540221, 0, 1.5, 0.5, 0.5
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
-3.371328, -3.701849, -4,
-3.371328, -3.701849, 4,
-3.371328, -3.701849, -4,
-3.544525, -3.881451, -4,
-3.371328, -3.701849, -2,
-3.544525, -3.881451, -2,
-3.371328, -3.701849, 0,
-3.544525, -3.881451, 0,
-3.371328, -3.701849, 2,
-3.544525, -3.881451, 2,
-3.371328, -3.701849, 4,
-3.544525, -3.881451, 4
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
-3.890919, -4.240655, -4, 0, -0.5, 0.5, 0.5,
-3.890919, -4.240655, -4, 1, -0.5, 0.5, 0.5,
-3.890919, -4.240655, -4, 1, 1.5, 0.5, 0.5,
-3.890919, -4.240655, -4, 0, 1.5, 0.5, 0.5,
-3.890919, -4.240655, -2, 0, -0.5, 0.5, 0.5,
-3.890919, -4.240655, -2, 1, -0.5, 0.5, 0.5,
-3.890919, -4.240655, -2, 1, 1.5, 0.5, 0.5,
-3.890919, -4.240655, -2, 0, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 0, 0, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 0, 1, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 0, 1, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 0, 0, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 2, 0, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 2, 1, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 2, 1, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 2, 0, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 4, 0, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 4, 1, -0.5, 0.5, 0.5,
-3.890919, -4.240655, 4, 1, 1.5, 0.5, 0.5,
-3.890919, -4.240655, 4, 0, 1.5, 0.5, 0.5
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
-3.371328, -3.701849, -5.689356,
-3.371328, 3.482243, -5.689356,
-3.371328, -3.701849, 5.655508,
-3.371328, 3.482243, 5.655508,
-3.371328, -3.701849, -5.689356,
-3.371328, -3.701849, 5.655508,
-3.371328, 3.482243, -5.689356,
-3.371328, 3.482243, 5.655508,
-3.371328, -3.701849, -5.689356,
3.55656, -3.701849, -5.689356,
-3.371328, -3.701849, 5.655508,
3.55656, -3.701849, 5.655508,
-3.371328, 3.482243, -5.689356,
3.55656, 3.482243, -5.689356,
-3.371328, 3.482243, 5.655508,
3.55656, 3.482243, 5.655508,
3.55656, -3.701849, -5.689356,
3.55656, 3.482243, -5.689356,
3.55656, -3.701849, 5.655508,
3.55656, 3.482243, 5.655508,
3.55656, -3.701849, -5.689356,
3.55656, -3.701849, 5.655508,
3.55656, 3.482243, -5.689356,
3.55656, 3.482243, 5.655508
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
var radius = 8.068458;
var distance = 35.89748;
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
mvMatrix.translate( -0.09261632, 0.1098027, 0.01692438 );
mvMatrix.scale( 1.259226, 1.214318, 0.7689625 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89748);
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
triflumizole<-read.table("triflumizole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triflumizole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
```

```r
y<-triflumizole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
```

```r
z<-triflumizole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflumizole' not found
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
-3.270436, 0.6493384, 0.07334182, 0, 0, 1, 1, 1,
-3.05992, 0.8352554, -1.330393, 1, 0, 0, 1, 1,
-3.041764, -0.3646744, -1.723191, 1, 0, 0, 1, 1,
-2.922231, -1.683065, -1.724281, 1, 0, 0, 1, 1,
-2.797723, 0.2936665, -1.603111, 1, 0, 0, 1, 1,
-2.6281, -0.3733827, -2.953252, 1, 0, 0, 1, 1,
-2.555134, 1.88936, 0.02031635, 0, 0, 0, 1, 1,
-2.413185, -0.940838, -3.092206, 0, 0, 0, 1, 1,
-2.377037, 0.2711957, -1.996447, 0, 0, 0, 1, 1,
-2.372373, 2.491735, -1.738589, 0, 0, 0, 1, 1,
-2.364891, -0.4507661, -1.192688, 0, 0, 0, 1, 1,
-2.363087, -2.34448, -1.997059, 0, 0, 0, 1, 1,
-2.329607, -2.100884, -2.960402, 0, 0, 0, 1, 1,
-2.250152, -1.997254, -0.1667672, 1, 1, 1, 1, 1,
-2.228714, -1.699909, -3.544168, 1, 1, 1, 1, 1,
-2.220591, 0.48029, 0.2127511, 1, 1, 1, 1, 1,
-2.172932, 0.1971554, -2.325554, 1, 1, 1, 1, 1,
-2.138794, 0.2570524, -0.6693254, 1, 1, 1, 1, 1,
-2.057631, -0.9085989, -1.531948, 1, 1, 1, 1, 1,
-2.003796, -0.0162053, -2.171674, 1, 1, 1, 1, 1,
-1.999554, -0.4222527, -1.513653, 1, 1, 1, 1, 1,
-1.989982, -0.3083939, -1.185114, 1, 1, 1, 1, 1,
-1.988566, -0.6654406, -1.355209, 1, 1, 1, 1, 1,
-1.980693, 1.361996, 0.1370864, 1, 1, 1, 1, 1,
-1.971732, 0.6177283, -1.790245, 1, 1, 1, 1, 1,
-1.959439, 0.03402427, -1.35155, 1, 1, 1, 1, 1,
-1.918508, -1.689638, -1.712562, 1, 1, 1, 1, 1,
-1.887331, 1.219808, 0.2222832, 1, 1, 1, 1, 1,
-1.874799, 1.583444, -1.788507, 0, 0, 1, 1, 1,
-1.865055, 1.394106, -1.185234, 1, 0, 0, 1, 1,
-1.851168, 1.645157, 0.2395679, 1, 0, 0, 1, 1,
-1.832448, 0.651526, -2.680899, 1, 0, 0, 1, 1,
-1.831276, -0.2418387, -2.547931, 1, 0, 0, 1, 1,
-1.797706, -0.5671681, -1.964232, 1, 0, 0, 1, 1,
-1.766143, 0.8832929, 0.3500914, 0, 0, 0, 1, 1,
-1.756257, -1.229211, -3.188978, 0, 0, 0, 1, 1,
-1.749998, -0.9146644, -1.49288, 0, 0, 0, 1, 1,
-1.74398, -0.4405396, -2.241724, 0, 0, 0, 1, 1,
-1.742465, -1.437956, -1.734049, 0, 0, 0, 1, 1,
-1.716804, 0.1204003, -1.038452, 0, 0, 0, 1, 1,
-1.70858, 1.057404, -0.6257283, 0, 0, 0, 1, 1,
-1.707556, 0.1461682, -1.265981, 1, 1, 1, 1, 1,
-1.689896, 0.5784363, -2.524254, 1, 1, 1, 1, 1,
-1.687743, -0.4526814, -3.876081, 1, 1, 1, 1, 1,
-1.679094, -0.8845493, -0.8645892, 1, 1, 1, 1, 1,
-1.672303, 1.772347, -0.6674955, 1, 1, 1, 1, 1,
-1.65502, -0.006909258, -2.24734, 1, 1, 1, 1, 1,
-1.652933, 0.08848482, -0.8847798, 1, 1, 1, 1, 1,
-1.642863, 1.506647, -2.128338, 1, 1, 1, 1, 1,
-1.639621, 0.7067748, -2.626694, 1, 1, 1, 1, 1,
-1.631638, 1.435377, 1.291735, 1, 1, 1, 1, 1,
-1.630631, 1.465694, -2.695928, 1, 1, 1, 1, 1,
-1.628626, -0.8798522, -2.348211, 1, 1, 1, 1, 1,
-1.622832, 1.723383, -0.6103464, 1, 1, 1, 1, 1,
-1.619868, 0.6047158, -0.6603699, 1, 1, 1, 1, 1,
-1.614063, -0.2501676, -1.683666, 1, 1, 1, 1, 1,
-1.610411, -2.001217, -2.496403, 0, 0, 1, 1, 1,
-1.609106, 0.1717971, -0.6432985, 1, 0, 0, 1, 1,
-1.607677, 1.546335, 0.06643461, 1, 0, 0, 1, 1,
-1.60736, 1.589796, -0.682682, 1, 0, 0, 1, 1,
-1.604597, -0.2026011, -2.349973, 1, 0, 0, 1, 1,
-1.603088, 0.8877643, -2.124828, 1, 0, 0, 1, 1,
-1.598903, -1.56927, -1.5198, 0, 0, 0, 1, 1,
-1.598569, -0.5539765, -1.906771, 0, 0, 0, 1, 1,
-1.5914, 1.351613, 0.0006446567, 0, 0, 0, 1, 1,
-1.579932, -1.645193, -2.147018, 0, 0, 0, 1, 1,
-1.573869, 0.1284994, -2.719507, 0, 0, 0, 1, 1,
-1.562508, -0.1007044, -0.3639442, 0, 0, 0, 1, 1,
-1.557398, -0.01195513, -2.796998, 0, 0, 0, 1, 1,
-1.556917, -1.32811, -3.154199, 1, 1, 1, 1, 1,
-1.54782, -0.3508458, -2.138165, 1, 1, 1, 1, 1,
-1.53926, 0.1329619, -2.171318, 1, 1, 1, 1, 1,
-1.528977, 1.169235, -0.8795661, 1, 1, 1, 1, 1,
-1.507355, -2.331065, -1.790731, 1, 1, 1, 1, 1,
-1.507114, 0.4465708, -1.640757, 1, 1, 1, 1, 1,
-1.499052, -0.6225216, -2.746067, 1, 1, 1, 1, 1,
-1.49561, 1.604977, -1.491031, 1, 1, 1, 1, 1,
-1.478346, 0.2012391, -1.861778, 1, 1, 1, 1, 1,
-1.466636, -0.02933986, -2.47227, 1, 1, 1, 1, 1,
-1.46297, -1.089986, -2.726567, 1, 1, 1, 1, 1,
-1.456696, 2.233012, -0.2266151, 1, 1, 1, 1, 1,
-1.442435, 0.9894134, -1.00332, 1, 1, 1, 1, 1,
-1.440926, -0.9831069, -0.5924628, 1, 1, 1, 1, 1,
-1.43973, 0.3255452, -2.134765, 1, 1, 1, 1, 1,
-1.438327, -0.5091769, -1.916925, 0, 0, 1, 1, 1,
-1.432566, -0.9958751, -1.215931, 1, 0, 0, 1, 1,
-1.431001, 0.6801329, 0.2369467, 1, 0, 0, 1, 1,
-1.419599, -0.09720773, -1.10584, 1, 0, 0, 1, 1,
-1.407027, -1.072567, -1.498277, 1, 0, 0, 1, 1,
-1.385216, 0.1057535, -1.502765, 1, 0, 0, 1, 1,
-1.383893, -0.000944602, -3.940004, 0, 0, 0, 1, 1,
-1.383123, 0.127702, -2.044846, 0, 0, 0, 1, 1,
-1.375248, 1.058092, -0.9674016, 0, 0, 0, 1, 1,
-1.371322, 0.1073366, -0.9724354, 0, 0, 0, 1, 1,
-1.367631, 0.2005022, -1.967445, 0, 0, 0, 1, 1,
-1.364489, -2.251529, -0.3756406, 0, 0, 0, 1, 1,
-1.362877, -0.5602655, -2.768267, 0, 0, 0, 1, 1,
-1.360616, 0.07685518, 0.09135776, 1, 1, 1, 1, 1,
-1.360194, -0.9995095, -1.173738, 1, 1, 1, 1, 1,
-1.359301, 1.533697, -1.525488, 1, 1, 1, 1, 1,
-1.356347, -0.2728883, -0.7517622, 1, 1, 1, 1, 1,
-1.354021, 0.7304708, -0.9186621, 1, 1, 1, 1, 1,
-1.352396, -0.2512846, -2.043924, 1, 1, 1, 1, 1,
-1.351986, -0.3371918, -1.230203, 1, 1, 1, 1, 1,
-1.350502, 1.966291, -1.633983, 1, 1, 1, 1, 1,
-1.344435, 0.6683291, -1.052076, 1, 1, 1, 1, 1,
-1.340268, 0.4056242, -0.7085718, 1, 1, 1, 1, 1,
-1.324255, 0.8779546, -0.5582292, 1, 1, 1, 1, 1,
-1.317735, 2.609939, -0.2363628, 1, 1, 1, 1, 1,
-1.311712, 0.5654436, -2.838837, 1, 1, 1, 1, 1,
-1.305584, 0.30571, 1.656628, 1, 1, 1, 1, 1,
-1.284087, 1.014579, -0.2165779, 1, 1, 1, 1, 1,
-1.282926, -0.01300547, 0.3210659, 0, 0, 1, 1, 1,
-1.281937, 0.5298725, -0.1415931, 1, 0, 0, 1, 1,
-1.271787, -0.2161617, -2.012409, 1, 0, 0, 1, 1,
-1.267682, 0.6513183, -1.29167, 1, 0, 0, 1, 1,
-1.252426, -0.9420013, -0.6091808, 1, 0, 0, 1, 1,
-1.252303, -1.512502, -2.876283, 1, 0, 0, 1, 1,
-1.251083, 0.8990148, -1.184678, 0, 0, 0, 1, 1,
-1.248058, 0.9854953, -0.4018877, 0, 0, 0, 1, 1,
-1.237688, -1.214325, -1.860157, 0, 0, 0, 1, 1,
-1.235215, -0.2382936, -1.516287, 0, 0, 0, 1, 1,
-1.230128, 1.250279, -1.569652, 0, 0, 0, 1, 1,
-1.22967, 0.1124242, -1.516072, 0, 0, 0, 1, 1,
-1.227508, -1.712793, -1.704954, 0, 0, 0, 1, 1,
-1.214919, 1.014061, 0.04615585, 1, 1, 1, 1, 1,
-1.212683, 0.6293954, -0.4584416, 1, 1, 1, 1, 1,
-1.211095, 0.672935, -0.09596121, 1, 1, 1, 1, 1,
-1.206182, 0.4499504, -0.2892055, 1, 1, 1, 1, 1,
-1.201841, -1.040112, -0.492004, 1, 1, 1, 1, 1,
-1.201233, -0.2635356, -3.086569, 1, 1, 1, 1, 1,
-1.196155, 0.8312842, -1.880077, 1, 1, 1, 1, 1,
-1.18787, 0.3927155, 0.5423828, 1, 1, 1, 1, 1,
-1.185471, 1.428788, -0.6134955, 1, 1, 1, 1, 1,
-1.184786, -0.6599078, -1.00062, 1, 1, 1, 1, 1,
-1.183578, -0.108368, -2.55711, 1, 1, 1, 1, 1,
-1.182979, 0.9099882, -1.103798, 1, 1, 1, 1, 1,
-1.170606, -0.03404977, -0.9470508, 1, 1, 1, 1, 1,
-1.140584, -0.9851235, -3.090958, 1, 1, 1, 1, 1,
-1.137037, 0.5434377, -1.272254, 1, 1, 1, 1, 1,
-1.133491, 0.5563046, -1.809677, 0, 0, 1, 1, 1,
-1.123557, 0.3814948, 0.3133809, 1, 0, 0, 1, 1,
-1.120788, -1.452289, -2.129236, 1, 0, 0, 1, 1,
-1.1164, 0.01319986, -1.484333, 1, 0, 0, 1, 1,
-1.111968, -0.335769, -1.840422, 1, 0, 0, 1, 1,
-1.105234, 1.136038, -0.56586, 1, 0, 0, 1, 1,
-1.092203, -1.71091, -2.979237, 0, 0, 0, 1, 1,
-1.091795, 0.7142791, -3.250053, 0, 0, 0, 1, 1,
-1.091394, 0.9364959, 0.06178847, 0, 0, 0, 1, 1,
-1.087519, 0.06379994, -2.046531, 0, 0, 0, 1, 1,
-1.073301, -0.8977858, -1.063396, 0, 0, 0, 1, 1,
-1.070633, 0.4489277, 0.3903752, 0, 0, 0, 1, 1,
-1.06766, -0.1080796, -3.212382, 0, 0, 0, 1, 1,
-1.06135, -0.7466634, -3.923811, 1, 1, 1, 1, 1,
-1.05362, -1.827661, -4.598829, 1, 1, 1, 1, 1,
-1.053144, -0.2755909, -2.077627, 1, 1, 1, 1, 1,
-1.052602, -1.335471, -4.907579, 1, 1, 1, 1, 1,
-1.051485, -0.2306666, -1.727983, 1, 1, 1, 1, 1,
-1.048955, 0.301709, -1.489339, 1, 1, 1, 1, 1,
-1.046184, 0.4300648, -0.9109463, 1, 1, 1, 1, 1,
-1.045384, -0.09891301, -2.249568, 1, 1, 1, 1, 1,
-1.032959, -1.128241, -2.020309, 1, 1, 1, 1, 1,
-1.031703, 1.757211, -0.6196984, 1, 1, 1, 1, 1,
-1.02146, 0.5095016, -1.668861, 1, 1, 1, 1, 1,
-1.011993, 0.2933929, -0.1941012, 1, 1, 1, 1, 1,
-1.003142, -0.6756411, -3.290598, 1, 1, 1, 1, 1,
-1.002521, 1.249529, 0.7423886, 1, 1, 1, 1, 1,
-0.990347, 0.3294174, -2.867336, 1, 1, 1, 1, 1,
-0.9897894, 0.2576582, -0.3951833, 0, 0, 1, 1, 1,
-0.9873703, -1.026155, -1.855606, 1, 0, 0, 1, 1,
-0.9841858, -0.391268, -2.780655, 1, 0, 0, 1, 1,
-0.9827924, -0.6446677, -4.6823, 1, 0, 0, 1, 1,
-0.9721808, 1.904366, -0.5109984, 1, 0, 0, 1, 1,
-0.9713346, -1.035367, -3.062316, 1, 0, 0, 1, 1,
-0.9679047, -0.4435113, -1.897361, 0, 0, 0, 1, 1,
-0.9599757, -0.07086206, -0.722618, 0, 0, 0, 1, 1,
-0.957132, -0.1246429, -1.819639, 0, 0, 0, 1, 1,
-0.9549879, -2.344901, -2.920607, 0, 0, 0, 1, 1,
-0.947172, -0.3164744, -0.5650587, 0, 0, 0, 1, 1,
-0.9429997, 0.8953549, -1.620005, 0, 0, 0, 1, 1,
-0.9394172, -1.156137, -5.52414, 0, 0, 0, 1, 1,
-0.9276717, 0.004623831, -0.1176934, 1, 1, 1, 1, 1,
-0.9257916, 0.2840745, -1.22372, 1, 1, 1, 1, 1,
-0.9241477, -0.73825, -2.032813, 1, 1, 1, 1, 1,
-0.9208565, -0.1771989, -3.699952, 1, 1, 1, 1, 1,
-0.9172001, 1.172613, -3.715691, 1, 1, 1, 1, 1,
-0.9162233, -0.2786313, -3.682141, 1, 1, 1, 1, 1,
-0.9135067, 0.1676337, -2.139584, 1, 1, 1, 1, 1,
-0.9118392, 0.5480652, -0.5469253, 1, 1, 1, 1, 1,
-0.9097854, -1.708436, -3.105267, 1, 1, 1, 1, 1,
-0.9062842, 0.1112628, -1.401624, 1, 1, 1, 1, 1,
-0.9053531, 0.4492262, 0.6059138, 1, 1, 1, 1, 1,
-0.9041739, 0.9553666, 0.348121, 1, 1, 1, 1, 1,
-0.9029598, 0.9179522, 0.2285086, 1, 1, 1, 1, 1,
-0.902092, -1.234123, -2.352094, 1, 1, 1, 1, 1,
-0.9005184, -0.601999, -0.6612735, 1, 1, 1, 1, 1,
-0.8978522, 0.09242538, 1.383696, 0, 0, 1, 1, 1,
-0.8922424, -1.465894, -1.443577, 1, 0, 0, 1, 1,
-0.8837432, -1.112003, -1.335855, 1, 0, 0, 1, 1,
-0.8817924, -1.083764, -1.230585, 1, 0, 0, 1, 1,
-0.880694, 0.8810484, -1.345296, 1, 0, 0, 1, 1,
-0.8793937, -0.02066587, -2.285203, 1, 0, 0, 1, 1,
-0.8743036, 0.5380796, -2.052745, 0, 0, 0, 1, 1,
-0.8711757, 0.8383476, -1.100833, 0, 0, 0, 1, 1,
-0.8708484, -0.3367882, -1.718512, 0, 0, 0, 1, 1,
-0.8669878, 0.8084618, -1.481651, 0, 0, 0, 1, 1,
-0.8622366, -0.8283324, -1.778837, 0, 0, 0, 1, 1,
-0.8614541, -1.359836, -3.786177, 0, 0, 0, 1, 1,
-0.8483123, 0.4833761, -1.764199, 0, 0, 0, 1, 1,
-0.8468639, -0.1886823, -0.7281672, 1, 1, 1, 1, 1,
-0.8391969, 0.6034212, 0.08496047, 1, 1, 1, 1, 1,
-0.8386794, -0.5806092, -2.173841, 1, 1, 1, 1, 1,
-0.8378831, 0.7896418, -1.276406, 1, 1, 1, 1, 1,
-0.835799, 0.4206908, 0.9378571, 1, 1, 1, 1, 1,
-0.8357269, 1.626511, -1.13621, 1, 1, 1, 1, 1,
-0.8352166, -0.1711164, -1.980736, 1, 1, 1, 1, 1,
-0.8335134, -0.4610727, -2.659325, 1, 1, 1, 1, 1,
-0.8308561, -0.3536237, -2.211298, 1, 1, 1, 1, 1,
-0.8211839, 0.1965746, -1.736356, 1, 1, 1, 1, 1,
-0.8203968, 0.8933974, -0.2034954, 1, 1, 1, 1, 1,
-0.8188625, -1.195089, -2.142184, 1, 1, 1, 1, 1,
-0.8185856, 0.4102, -1.784992, 1, 1, 1, 1, 1,
-0.816555, -0.5193807, -1.043477, 1, 1, 1, 1, 1,
-0.8147053, -0.6345903, -0.7478381, 1, 1, 1, 1, 1,
-0.8141447, 0.2605207, 1.006317, 0, 0, 1, 1, 1,
-0.8130857, 0.051069, -0.6643373, 1, 0, 0, 1, 1,
-0.8130002, -0.5627429, -3.344326, 1, 0, 0, 1, 1,
-0.8037817, 0.05888538, -1.739196, 1, 0, 0, 1, 1,
-0.8014422, 1.984788, -1.165945, 1, 0, 0, 1, 1,
-0.7980026, -0.1885064, -1.403927, 1, 0, 0, 1, 1,
-0.7971418, 1.338231, -2.038045, 0, 0, 0, 1, 1,
-0.7963362, 0.1175929, -2.909926, 0, 0, 0, 1, 1,
-0.7958713, 1.365251, -1.716999, 0, 0, 0, 1, 1,
-0.7950452, 1.664938, 0.5539555, 0, 0, 0, 1, 1,
-0.7882783, -1.40277, 0.1995365, 0, 0, 0, 1, 1,
-0.7834207, 0.9315304, -1.484498, 0, 0, 0, 1, 1,
-0.7767259, 0.3185928, -1.099542, 0, 0, 0, 1, 1,
-0.7742747, -0.3768434, -1.545356, 1, 1, 1, 1, 1,
-0.7739674, -0.07118411, -3.008057, 1, 1, 1, 1, 1,
-0.7734519, 0.2450806, -1.604281, 1, 1, 1, 1, 1,
-0.7689587, 1.279227, 1.27348, 1, 1, 1, 1, 1,
-0.7663498, 0.1482176, -0.5550752, 1, 1, 1, 1, 1,
-0.7600125, 2.392147, -0.8363618, 1, 1, 1, 1, 1,
-0.7542877, -0.4726118, -1.049762, 1, 1, 1, 1, 1,
-0.7534866, -0.9638414, -2.412429, 1, 1, 1, 1, 1,
-0.7527178, 1.313703, 0.3811179, 1, 1, 1, 1, 1,
-0.7494202, 3.37762, -1.470487, 1, 1, 1, 1, 1,
-0.7488779, 1.176857, 0.01235854, 1, 1, 1, 1, 1,
-0.747179, -0.6773689, -1.424487, 1, 1, 1, 1, 1,
-0.747066, -1.684214, -3.48965, 1, 1, 1, 1, 1,
-0.7467564, 0.05239392, -0.2499451, 1, 1, 1, 1, 1,
-0.7463078, -0.2529435, -1.033995, 1, 1, 1, 1, 1,
-0.7437115, -0.3823036, -2.057523, 0, 0, 1, 1, 1,
-0.7402197, 0.3706852, -1.276554, 1, 0, 0, 1, 1,
-0.7392708, 1.418549, -0.1974121, 1, 0, 0, 1, 1,
-0.7389114, 1.043557, -0.4442227, 1, 0, 0, 1, 1,
-0.7350105, -0.03954761, -2.676451, 1, 0, 0, 1, 1,
-0.7200615, -0.1351589, -2.947068, 1, 0, 0, 1, 1,
-0.7185253, -0.08854528, -2.63225, 0, 0, 0, 1, 1,
-0.7178116, -0.2359672, -2.740648, 0, 0, 0, 1, 1,
-0.7122048, -1.031582, -2.938798, 0, 0, 0, 1, 1,
-0.7058041, -0.1203863, -2.163759, 0, 0, 0, 1, 1,
-0.70057, -2.015512, -3.695575, 0, 0, 0, 1, 1,
-0.687599, 1.344221, -2.98384, 0, 0, 0, 1, 1,
-0.678137, 0.07651837, -0.7673265, 0, 0, 0, 1, 1,
-0.6762418, -1.419036, -2.443343, 1, 1, 1, 1, 1,
-0.6741604, 0.5805838, 0.3417025, 1, 1, 1, 1, 1,
-0.6710425, 1.911673, 0.4089023, 1, 1, 1, 1, 1,
-0.6703718, 1.039747, -1.444692, 1, 1, 1, 1, 1,
-0.6596824, 2.478187, 0.3638175, 1, 1, 1, 1, 1,
-0.658716, -0.2328874, -2.730304, 1, 1, 1, 1, 1,
-0.6457033, 0.3230619, 0.08422839, 1, 1, 1, 1, 1,
-0.6448097, 0.7969875, -0.6733262, 1, 1, 1, 1, 1,
-0.6429635, -0.6316307, -2.096602, 1, 1, 1, 1, 1,
-0.6388245, -1.064841, -3.317125, 1, 1, 1, 1, 1,
-0.6372628, 0.4603976, -1.776378, 1, 1, 1, 1, 1,
-0.6323718, -1.189072, -4.201205, 1, 1, 1, 1, 1,
-0.6319067, -0.0956503, 0.8798194, 1, 1, 1, 1, 1,
-0.6232573, 0.4859551, -1.541902, 1, 1, 1, 1, 1,
-0.6224155, 0.1019015, -1.880046, 1, 1, 1, 1, 1,
-0.6219593, 0.6181107, 1.060033, 0, 0, 1, 1, 1,
-0.6205437, -1.089987, -3.240586, 1, 0, 0, 1, 1,
-0.6195625, 0.3521827, -0.8962536, 1, 0, 0, 1, 1,
-0.6194936, 1.146825, -2.819763, 1, 0, 0, 1, 1,
-0.6193307, 1.642162, 0.1840128, 1, 0, 0, 1, 1,
-0.6189555, 1.030531, -0.7686807, 1, 0, 0, 1, 1,
-0.6122863, 0.03282779, -2.034763, 0, 0, 0, 1, 1,
-0.6116862, 0.7509614, -0.9415717, 0, 0, 0, 1, 1,
-0.6114116, -0.2560826, -1.710415, 0, 0, 0, 1, 1,
-0.6109518, -1.409133, -3.182403, 0, 0, 0, 1, 1,
-0.6058704, -0.5184419, -0.9529541, 0, 0, 0, 1, 1,
-0.6054878, 1.133435, -0.4862154, 0, 0, 0, 1, 1,
-0.60537, -0.3078804, -1.889146, 0, 0, 0, 1, 1,
-0.5953998, -1.520374, -3.144185, 1, 1, 1, 1, 1,
-0.593143, 0.1548996, -3.468083, 1, 1, 1, 1, 1,
-0.5786204, 1.850059, -0.3112654, 1, 1, 1, 1, 1,
-0.5721785, -0.5737333, -3.92211, 1, 1, 1, 1, 1,
-0.5668672, 0.006279169, -0.9404828, 1, 1, 1, 1, 1,
-0.5605673, 0.4651743, -0.682035, 1, 1, 1, 1, 1,
-0.559585, 1.251689, 0.7664812, 1, 1, 1, 1, 1,
-0.5567845, -0.7535765, -2.383241, 1, 1, 1, 1, 1,
-0.5565416, -0.09025905, -1.133844, 1, 1, 1, 1, 1,
-0.5470893, -0.9839915, -2.716926, 1, 1, 1, 1, 1,
-0.5393835, -0.01440342, -3.225449, 1, 1, 1, 1, 1,
-0.533821, -1.56607, -3.766178, 1, 1, 1, 1, 1,
-0.5308719, 1.281095, -1.28966, 1, 1, 1, 1, 1,
-0.5289702, 0.7739711, -0.4762708, 1, 1, 1, 1, 1,
-0.5288591, 1.954078, 0.5144448, 1, 1, 1, 1, 1,
-0.5272977, -1.344305, -3.792279, 0, 0, 1, 1, 1,
-0.5240925, 1.122954, 1.762208, 1, 0, 0, 1, 1,
-0.5234658, -1.741089, -2.627265, 1, 0, 0, 1, 1,
-0.5155536, -0.8765428, -0.8700635, 1, 0, 0, 1, 1,
-0.5154622, 0.3691159, 0.02329189, 1, 0, 0, 1, 1,
-0.5129187, 0.05726428, -1.142385, 1, 0, 0, 1, 1,
-0.5113216, -0.8573408, -2.449484, 0, 0, 0, 1, 1,
-0.5104976, 0.7025723, -0.7096623, 0, 0, 0, 1, 1,
-0.5104165, 1.335683, -0.958347, 0, 0, 0, 1, 1,
-0.4982723, 0.5598547, -1.776882, 0, 0, 0, 1, 1,
-0.4808869, 0.6900412, -0.8081337, 0, 0, 0, 1, 1,
-0.4739704, 0.927177, 0.04607457, 0, 0, 0, 1, 1,
-0.4713688, -0.2848772, -2.900134, 0, 0, 0, 1, 1,
-0.4694472, 0.1591761, -1.289035, 1, 1, 1, 1, 1,
-0.4674801, -0.9843661, -2.983025, 1, 1, 1, 1, 1,
-0.4662039, 2.480628, -1.21891, 1, 1, 1, 1, 1,
-0.4633132, 0.2831459, -1.158038, 1, 1, 1, 1, 1,
-0.4582265, -0.3662208, -4.045434, 1, 1, 1, 1, 1,
-0.4574786, 0.6802766, -0.5430401, 1, 1, 1, 1, 1,
-0.4548597, -0.328902, -4.691204, 1, 1, 1, 1, 1,
-0.4548024, 1.143511, -0.8072744, 1, 1, 1, 1, 1,
-0.4547156, 0.9234015, -0.4634229, 1, 1, 1, 1, 1,
-0.4512184, 0.814662, 0.5351797, 1, 1, 1, 1, 1,
-0.4499435, 0.5584892, 0.7689022, 1, 1, 1, 1, 1,
-0.4496154, 1.682872, -0.5573435, 1, 1, 1, 1, 1,
-0.4489186, -0.07033408, -1.051936, 1, 1, 1, 1, 1,
-0.448821, -0.2010988, -1.241717, 1, 1, 1, 1, 1,
-0.4452188, 0.3503388, 0.2088085, 1, 1, 1, 1, 1,
-0.4436839, -0.7232632, -1.934692, 0, 0, 1, 1, 1,
-0.4416806, 0.3009195, -0.6305813, 1, 0, 0, 1, 1,
-0.4399827, -0.3696634, -2.83628, 1, 0, 0, 1, 1,
-0.4355696, 0.9339098, -1.323539, 1, 0, 0, 1, 1,
-0.4331019, 0.226531, -1.934943, 1, 0, 0, 1, 1,
-0.4289708, -1.750555, -3.432685, 1, 0, 0, 1, 1,
-0.4287283, 1.143543, -0.9747382, 0, 0, 0, 1, 1,
-0.4281459, -1.208224, -2.255538, 0, 0, 0, 1, 1,
-0.4260543, 0.8335394, -1.394517, 0, 0, 0, 1, 1,
-0.4248493, -0.05497336, -1.976886, 0, 0, 0, 1, 1,
-0.418317, 0.5104306, -1.729786, 0, 0, 0, 1, 1,
-0.4059067, -1.721963, -3.648407, 0, 0, 0, 1, 1,
-0.4043226, 0.9715561, -1.645717, 0, 0, 0, 1, 1,
-0.4040857, -1.242001, -3.568808, 1, 1, 1, 1, 1,
-0.4022759, 0.1060294, -0.3079965, 1, 1, 1, 1, 1,
-0.4018735, 1.669623, 1.355911, 1, 1, 1, 1, 1,
-0.4004598, 1.393116, 1.352633, 1, 1, 1, 1, 1,
-0.3980253, -0.8025112, -3.762657, 1, 1, 1, 1, 1,
-0.394109, -0.7019176, -2.814153, 1, 1, 1, 1, 1,
-0.3938381, -1.111042, -1.127697, 1, 1, 1, 1, 1,
-0.3897948, -0.2756703, -2.144481, 1, 1, 1, 1, 1,
-0.3884462, -0.2169821, -2.315078, 1, 1, 1, 1, 1,
-0.3755138, -1.401594, -2.853669, 1, 1, 1, 1, 1,
-0.3729417, 0.2137468, -2.328981, 1, 1, 1, 1, 1,
-0.3729148, -0.3634327, -2.792605, 1, 1, 1, 1, 1,
-0.3704344, -0.4074349, -2.618058, 1, 1, 1, 1, 1,
-0.3683, 0.07303869, -0.6248887, 1, 1, 1, 1, 1,
-0.366679, 0.9831535, -1.856789, 1, 1, 1, 1, 1,
-0.3573763, -0.05473744, -2.887568, 0, 0, 1, 1, 1,
-0.355159, -0.424925, -3.650479, 1, 0, 0, 1, 1,
-0.3504475, 0.4433421, -0.4113319, 1, 0, 0, 1, 1,
-0.3493439, 1.055292, 0.6146165, 1, 0, 0, 1, 1,
-0.3454675, 0.5425897, -1.455428, 1, 0, 0, 1, 1,
-0.3422996, 0.1841402, -2.933777, 1, 0, 0, 1, 1,
-0.3397315, -0.6246705, -2.745822, 0, 0, 0, 1, 1,
-0.3390139, -1.121023, -2.605136, 0, 0, 0, 1, 1,
-0.3388922, 0.5721017, 0.7517333, 0, 0, 0, 1, 1,
-0.3370402, -0.9067794, -3.439782, 0, 0, 0, 1, 1,
-0.3355238, -0.3732107, -1.329975, 0, 0, 0, 1, 1,
-0.3346224, -0.1785924, -1.422944, 0, 0, 0, 1, 1,
-0.3270091, 2.006531, -0.02235245, 0, 0, 0, 1, 1,
-0.326724, 2.113177, -1.466682, 1, 1, 1, 1, 1,
-0.321624, 0.740429, -0.137104, 1, 1, 1, 1, 1,
-0.3211251, 0.223466, -1.428434, 1, 1, 1, 1, 1,
-0.3207439, -0.9975166, -4.467684, 1, 1, 1, 1, 1,
-0.3176652, 1.284059, -0.04751703, 1, 1, 1, 1, 1,
-0.3156242, 0.3377222, 0.4640603, 1, 1, 1, 1, 1,
-0.3153006, -0.1137238, -2.801111, 1, 1, 1, 1, 1,
-0.3143144, -0.06335825, -3.332044, 1, 1, 1, 1, 1,
-0.3042349, -2.362873, -3.309774, 1, 1, 1, 1, 1,
-0.3032371, -0.9157855, -1.816981, 1, 1, 1, 1, 1,
-0.3023278, 1.037591, -0.3517831, 1, 1, 1, 1, 1,
-0.2988467, -0.8005595, -2.769741, 1, 1, 1, 1, 1,
-0.2986437, 0.8166043, -0.4905899, 1, 1, 1, 1, 1,
-0.2949613, -0.3518259, -1.660725, 1, 1, 1, 1, 1,
-0.2944841, 2.216616, -1.591511, 1, 1, 1, 1, 1,
-0.2940207, 1.141029, 1.023734, 0, 0, 1, 1, 1,
-0.2906018, 1.58528, -0.2280653, 1, 0, 0, 1, 1,
-0.2900979, 0.6386139, -0.3721281, 1, 0, 0, 1, 1,
-0.2897951, -0.4935931, -2.950808, 1, 0, 0, 1, 1,
-0.2883485, 0.1161114, -1.342549, 1, 0, 0, 1, 1,
-0.2863058, -0.4976458, -3.879407, 1, 0, 0, 1, 1,
-0.2828746, 0.8991886, -0.5482349, 0, 0, 0, 1, 1,
-0.2783328, -0.3247075, -1.787047, 0, 0, 0, 1, 1,
-0.2738357, -1.33662, -3.287739, 0, 0, 0, 1, 1,
-0.2706608, -1.727339, -2.549751, 0, 0, 0, 1, 1,
-0.2685872, 0.8788957, 0.4925469, 0, 0, 0, 1, 1,
-0.2674276, -0.7564182, -4.65937, 0, 0, 0, 1, 1,
-0.2662567, -0.2775598, -1.793964, 0, 0, 0, 1, 1,
-0.265633, -1.255357, -2.019824, 1, 1, 1, 1, 1,
-0.2624913, 1.0259, -1.014869, 1, 1, 1, 1, 1,
-0.2617419, 1.875295, 0.4326328, 1, 1, 1, 1, 1,
-0.2614091, 0.4382435, 0.4745836, 1, 1, 1, 1, 1,
-0.2562588, 0.5530461, 0.7138546, 1, 1, 1, 1, 1,
-0.2537523, -0.4312939, -1.594915, 1, 1, 1, 1, 1,
-0.2528353, 0.5973982, -0.1817056, 1, 1, 1, 1, 1,
-0.239372, 1.351506, -1.238014, 1, 1, 1, 1, 1,
-0.2361503, 1.372509, -0.4555606, 1, 1, 1, 1, 1,
-0.2332561, -0.932487, -1.758356, 1, 1, 1, 1, 1,
-0.2251375, -1.877586, -2.679414, 1, 1, 1, 1, 1,
-0.2229797, -1.115435, -3.441991, 1, 1, 1, 1, 1,
-0.2178839, 1.797184, 1.013322, 1, 1, 1, 1, 1,
-0.2088205, -0.6029515, -4.018391, 1, 1, 1, 1, 1,
-0.2077288, 1.205084, -0.9734691, 1, 1, 1, 1, 1,
-0.2047225, -0.2862554, -2.011725, 0, 0, 1, 1, 1,
-0.2037487, -0.1783926, -1.480033, 1, 0, 0, 1, 1,
-0.1993398, 1.88165, -0.8833818, 1, 0, 0, 1, 1,
-0.1984193, -1.299886, -4.585968, 1, 0, 0, 1, 1,
-0.1981672, 0.2163309, -0.5066605, 1, 0, 0, 1, 1,
-0.1972758, 1.903477, -1.776358, 1, 0, 0, 1, 1,
-0.1971271, -1.520666, -3.874195, 0, 0, 0, 1, 1,
-0.1947558, 0.1906767, -1.324009, 0, 0, 0, 1, 1,
-0.1932724, 0.2518495, -0.2242412, 0, 0, 0, 1, 1,
-0.18577, -0.02122816, -2.230815, 0, 0, 0, 1, 1,
-0.1847829, 0.2983535, 0.1304868, 0, 0, 0, 1, 1,
-0.183846, -1.354754, -3.623691, 0, 0, 0, 1, 1,
-0.1829888, -1.215075, -1.929206, 0, 0, 0, 1, 1,
-0.1828812, -0.04754787, -0.4929551, 1, 1, 1, 1, 1,
-0.1775961, -0.3781277, -2.430764, 1, 1, 1, 1, 1,
-0.1767288, -1.297455, -2.35596, 1, 1, 1, 1, 1,
-0.1755613, -1.888666, -1.445236, 1, 1, 1, 1, 1,
-0.1629554, 0.3902045, -1.252304, 1, 1, 1, 1, 1,
-0.1581905, 1.736026, 0.2153961, 1, 1, 1, 1, 1,
-0.155384, 0.6446611, -0.8937376, 1, 1, 1, 1, 1,
-0.1545376, -0.553982, -2.235763, 1, 1, 1, 1, 1,
-0.1534531, -0.3374, -3.075193, 1, 1, 1, 1, 1,
-0.1464244, -0.3810709, -3.383775, 1, 1, 1, 1, 1,
-0.1444155, -1.271119, -3.841669, 1, 1, 1, 1, 1,
-0.1420471, -0.6051934, -2.370592, 1, 1, 1, 1, 1,
-0.1406966, -0.0234657, -1.438023, 1, 1, 1, 1, 1,
-0.1406167, -1.031253, -3.750752, 1, 1, 1, 1, 1,
-0.1397459, 0.4895788, 0.1543883, 1, 1, 1, 1, 1,
-0.1309209, -1.568831, -1.23862, 0, 0, 1, 1, 1,
-0.1250643, -0.3081512, -3.489827, 1, 0, 0, 1, 1,
-0.1245034, -0.297779, -2.782037, 1, 0, 0, 1, 1,
-0.1113905, 1.24152, -0.8885121, 1, 0, 0, 1, 1,
-0.1105581, -1.47662, -2.448691, 1, 0, 0, 1, 1,
-0.1103683, 1.070189, 0.6188483, 1, 0, 0, 1, 1,
-0.1089941, -0.5794829, -3.589921, 0, 0, 0, 1, 1,
-0.1045698, 1.391039, 0.8959694, 0, 0, 0, 1, 1,
-0.09731765, -1.38575, -3.595191, 0, 0, 0, 1, 1,
-0.09648748, -0.614078, -0.81204, 0, 0, 0, 1, 1,
-0.09608641, 0.6809109, -0.6907744, 0, 0, 0, 1, 1,
-0.09485468, 0.7656584, -0.2539696, 0, 0, 0, 1, 1,
-0.09471257, -0.1886362, -0.1224936, 0, 0, 0, 1, 1,
-0.09056843, 0.6041614, -1.795015, 1, 1, 1, 1, 1,
-0.09049843, 0.2323808, -0.5751254, 1, 1, 1, 1, 1,
-0.09028533, 1.467877, -1.337854, 1, 1, 1, 1, 1,
-0.08685745, 0.3956662, 0.4214052, 1, 1, 1, 1, 1,
-0.08668481, 1.112399, 0.911816, 1, 1, 1, 1, 1,
-0.08637027, -0.9112089, -4.103905, 1, 1, 1, 1, 1,
-0.08402029, 0.6978094, -0.05386087, 1, 1, 1, 1, 1,
-0.08371909, -0.7071147, -3.14297, 1, 1, 1, 1, 1,
-0.08219942, 1.4546, -0.708279, 1, 1, 1, 1, 1,
-0.07995415, 0.7472437, 1.275718, 1, 1, 1, 1, 1,
-0.07822792, -0.5861863, -2.977988, 1, 1, 1, 1, 1,
-0.07435822, -0.9918531, -3.315439, 1, 1, 1, 1, 1,
-0.07179584, 1.758229, 1.626948, 1, 1, 1, 1, 1,
-0.07148806, -0.1881864, -1.122022, 1, 1, 1, 1, 1,
-0.06646173, 1.127602, -0.7989372, 1, 1, 1, 1, 1,
-0.06380311, -0.5789063, -2.66797, 0, 0, 1, 1, 1,
-0.05993123, -0.2765217, -4.481514, 1, 0, 0, 1, 1,
-0.05764538, 0.9480971, 1.294777, 1, 0, 0, 1, 1,
-0.05675318, -1.70901, -3.712429, 1, 0, 0, 1, 1,
-0.05456289, -1.270476, -2.312288, 1, 0, 0, 1, 1,
-0.05415898, -0.03910476, -0.6828026, 1, 0, 0, 1, 1,
-0.05363312, 0.8553386, -0.4833965, 0, 0, 0, 1, 1,
-0.04104599, -0.04816488, -1.20233, 0, 0, 0, 1, 1,
-0.03919546, 0.07083793, 1.700823, 0, 0, 0, 1, 1,
-0.02380908, 2.525527, 0.2733594, 0, 0, 0, 1, 1,
-0.01890255, -0.1912371, -2.112035, 0, 0, 0, 1, 1,
-0.0175633, -1.492965, -3.1543, 0, 0, 0, 1, 1,
-0.0165208, 0.6979567, 1.010304, 0, 0, 0, 1, 1,
-0.01527918, 0.0280899, -0.3276706, 1, 1, 1, 1, 1,
-0.01179283, 0.6333531, 0.006251558, 1, 1, 1, 1, 1,
-0.009812181, -0.07614304, -3.251945, 1, 1, 1, 1, 1,
-0.009511485, 0.1546548, -1.398305, 1, 1, 1, 1, 1,
-0.006749456, 0.8807533, -0.2082091, 1, 1, 1, 1, 1,
-0.001776683, 0.5263128, 1.090503, 1, 1, 1, 1, 1,
-0.0006024245, -1.504917, -3.264326, 1, 1, 1, 1, 1,
-0.0003778049, -0.3773564, -3.32344, 1, 1, 1, 1, 1,
0.0003161483, -0.7108854, 2.664327, 1, 1, 1, 1, 1,
0.005694784, 1.279206, -0.2452947, 1, 1, 1, 1, 1,
0.005955277, 1.039671, 1.755917, 1, 1, 1, 1, 1,
0.006670319, -0.7187037, 1.531789, 1, 1, 1, 1, 1,
0.01025204, -0.9747339, 3.454162, 1, 1, 1, 1, 1,
0.01028292, -0.7374889, 3.260845, 1, 1, 1, 1, 1,
0.01043579, -0.2677403, 2.651661, 1, 1, 1, 1, 1,
0.0108592, 0.8680932, -0.3403856, 0, 0, 1, 1, 1,
0.02207725, 0.5574427, 0.6606708, 1, 0, 0, 1, 1,
0.02216543, 0.01668121, 3.9912, 1, 0, 0, 1, 1,
0.02577288, 0.4207782, 0.7410344, 1, 0, 0, 1, 1,
0.02819623, 0.1224841, 0.7024179, 1, 0, 0, 1, 1,
0.02875034, -3.597226, 3.170301, 1, 0, 0, 1, 1,
0.03907526, -2.420472, 4.095419, 0, 0, 0, 1, 1,
0.04129094, 1.029354, 0.2571914, 0, 0, 0, 1, 1,
0.04205213, -0.5086373, 3.448675, 0, 0, 0, 1, 1,
0.04552674, 0.4609487, 0.3700651, 0, 0, 0, 1, 1,
0.0472597, -0.410433, 3.240578, 0, 0, 0, 1, 1,
0.04814404, -0.192211, 2.919425, 0, 0, 0, 1, 1,
0.0507516, -0.4553452, 2.39332, 0, 0, 0, 1, 1,
0.05439248, 0.770391, 0.5256026, 1, 1, 1, 1, 1,
0.0609493, -0.4586111, 3.608398, 1, 1, 1, 1, 1,
0.06175196, -0.4420963, 1.246525, 1, 1, 1, 1, 1,
0.06494826, -0.9485022, 2.302627, 1, 1, 1, 1, 1,
0.06832974, 0.8020234, -1.57546, 1, 1, 1, 1, 1,
0.06889857, 1.411629, 0.2121157, 1, 1, 1, 1, 1,
0.07265083, 0.006985999, 1.33419, 1, 1, 1, 1, 1,
0.0814321, 1.078843, -0.2393327, 1, 1, 1, 1, 1,
0.08185723, -0.4497843, 2.378466, 1, 1, 1, 1, 1,
0.08481956, -0.533983, 1.681961, 1, 1, 1, 1, 1,
0.08607566, 0.00838609, 0.6465323, 1, 1, 1, 1, 1,
0.08942446, -1.15848, 4.035494, 1, 1, 1, 1, 1,
0.089586, 0.9213215, 0.03930624, 1, 1, 1, 1, 1,
0.0897416, -2.269181, 3.591738, 1, 1, 1, 1, 1,
0.09049817, -0.05252306, 1.783456, 1, 1, 1, 1, 1,
0.09327512, 0.592209, 1.15748, 0, 0, 1, 1, 1,
0.09543222, -0.6212699, 1.043854, 1, 0, 0, 1, 1,
0.09711417, 0.7715775, 0.07008065, 1, 0, 0, 1, 1,
0.0990826, 1.400672, -0.5876476, 1, 0, 0, 1, 1,
0.09965415, -0.4721749, 3.110888, 1, 0, 0, 1, 1,
0.1021663, 1.374703, -0.04596618, 1, 0, 0, 1, 1,
0.102718, -0.7409241, 3.803703, 0, 0, 0, 1, 1,
0.1083387, -0.4192788, 2.674811, 0, 0, 0, 1, 1,
0.109037, 0.4829616, -0.3049249, 0, 0, 0, 1, 1,
0.112186, -2.251793, 2.607008, 0, 0, 0, 1, 1,
0.1139222, 0.5762054, -0.9096237, 0, 0, 0, 1, 1,
0.1140011, 0.4477442, -0.5619015, 0, 0, 0, 1, 1,
0.114272, -1.098892, 3.44312, 0, 0, 0, 1, 1,
0.1160693, 1.296542, -1.183339, 1, 1, 1, 1, 1,
0.1184096, 0.02100444, 0.6963898, 1, 1, 1, 1, 1,
0.1235266, -0.5461296, 3.337689, 1, 1, 1, 1, 1,
0.1237836, 1.336509, 0.2501532, 1, 1, 1, 1, 1,
0.1238345, -1.427903, 1.458734, 1, 1, 1, 1, 1,
0.1249357, 1.972525, 0.6582784, 1, 1, 1, 1, 1,
0.1326314, -0.5662571, 2.304109, 1, 1, 1, 1, 1,
0.1370302, 0.5961916, 0.6936114, 1, 1, 1, 1, 1,
0.138976, 0.5167318, -0.46176, 1, 1, 1, 1, 1,
0.1397401, -1.150791, 5.490291, 1, 1, 1, 1, 1,
0.1403843, -0.8906304, 2.715933, 1, 1, 1, 1, 1,
0.1455703, -0.5926161, 2.613244, 1, 1, 1, 1, 1,
0.1458567, 1.593682, 0.1248114, 1, 1, 1, 1, 1,
0.1472223, -1.613811, 4.183429, 1, 1, 1, 1, 1,
0.1484351, -0.6320247, 3.417049, 1, 1, 1, 1, 1,
0.1505576, 0.5226395, 1.524644, 0, 0, 1, 1, 1,
0.1508068, -0.871863, 1.407262, 1, 0, 0, 1, 1,
0.1630464, -0.2791849, 1.68248, 1, 0, 0, 1, 1,
0.163286, -1.158823, 3.910564, 1, 0, 0, 1, 1,
0.168181, 1.153966, 2.134484, 1, 0, 0, 1, 1,
0.1685269, -0.4817069, 3.927268, 1, 0, 0, 1, 1,
0.1697429, -0.07572877, 1.838717, 0, 0, 0, 1, 1,
0.1711727, 2.799034, 1.575111, 0, 0, 0, 1, 1,
0.1724579, -0.9866055, 3.502194, 0, 0, 0, 1, 1,
0.1736958, -1.544212, 3.775967, 0, 0, 0, 1, 1,
0.1755731, 0.3127755, 2.064553, 0, 0, 0, 1, 1,
0.1761132, 1.634069, 0.1017438, 0, 0, 0, 1, 1,
0.1792718, 0.9682835, -0.08149506, 0, 0, 0, 1, 1,
0.1793962, -1.126853, 2.359222, 1, 1, 1, 1, 1,
0.1856401, -0.3835743, 2.031927, 1, 1, 1, 1, 1,
0.1861974, 0.237671, 1.399831, 1, 1, 1, 1, 1,
0.1866961, -0.7852129, 3.447474, 1, 1, 1, 1, 1,
0.1886094, -0.7197192, 2.78447, 1, 1, 1, 1, 1,
0.1915002, -0.8260831, 2.535414, 1, 1, 1, 1, 1,
0.1975194, -0.1803477, 1.414211, 1, 1, 1, 1, 1,
0.2005262, 1.674997, 1.105263, 1, 1, 1, 1, 1,
0.2038996, 2.267406, 0.9314573, 1, 1, 1, 1, 1,
0.2072555, -1.128862, 3.526762, 1, 1, 1, 1, 1,
0.2076759, 0.2652138, -0.3078073, 1, 1, 1, 1, 1,
0.2126823, -0.43328, 1.421616, 1, 1, 1, 1, 1,
0.2145383, 0.9254339, -0.7098785, 1, 1, 1, 1, 1,
0.2176943, -0.1954812, 1.083811, 1, 1, 1, 1, 1,
0.2177921, -0.6585125, 1.685431, 1, 1, 1, 1, 1,
0.2205192, 2.244694, 0.1050362, 0, 0, 1, 1, 1,
0.2227492, -0.7762173, 3.114363, 1, 0, 0, 1, 1,
0.2233243, -0.1334397, 2.612857, 1, 0, 0, 1, 1,
0.2270645, 0.03876966, 3.540461, 1, 0, 0, 1, 1,
0.2286186, 0.2521039, -0.4418252, 1, 0, 0, 1, 1,
0.2293385, 0.7370165, -0.2711381, 1, 0, 0, 1, 1,
0.2301893, -1.045345, 2.400195, 0, 0, 0, 1, 1,
0.2343465, 1.390795, 3.092497, 0, 0, 0, 1, 1,
0.2371136, 0.06497546, 0.6245991, 0, 0, 0, 1, 1,
0.2385219, -2.087962, 1.644005, 0, 0, 0, 1, 1,
0.2451338, -0.413203, 1.928295, 0, 0, 0, 1, 1,
0.2508219, -0.9048166, 3.110896, 0, 0, 0, 1, 1,
0.2541571, 1.185727, 0.09230368, 0, 0, 0, 1, 1,
0.2551723, 1.475307, -0.01526078, 1, 1, 1, 1, 1,
0.2571988, 1.419852, 1.124592, 1, 1, 1, 1, 1,
0.2586466, -1.155183, 3.875355, 1, 1, 1, 1, 1,
0.2606531, -0.7000036, 1.428926, 1, 1, 1, 1, 1,
0.2619761, 0.3920738, 1.157701, 1, 1, 1, 1, 1,
0.2624592, 0.2503439, 2.37648, 1, 1, 1, 1, 1,
0.2643169, 0.1550097, 3.784883, 1, 1, 1, 1, 1,
0.2651777, 1.196019, 0.8246149, 1, 1, 1, 1, 1,
0.2686245, -1.799298, 4.194887, 1, 1, 1, 1, 1,
0.2697973, -0.3991966, 2.466967, 1, 1, 1, 1, 1,
0.2724409, -0.09047297, 0.8826959, 1, 1, 1, 1, 1,
0.2725718, -1.149366, 1.765551, 1, 1, 1, 1, 1,
0.2732359, -0.3093379, 2.400278, 1, 1, 1, 1, 1,
0.2765729, 0.4153858, -0.3538499, 1, 1, 1, 1, 1,
0.2775948, 0.6082639, -0.3941372, 1, 1, 1, 1, 1,
0.2798446, 0.4620891, -0.8225467, 0, 0, 1, 1, 1,
0.2815198, 1.011797, -0.1831033, 1, 0, 0, 1, 1,
0.282966, 1.382389, 0.2093035, 1, 0, 0, 1, 1,
0.2832437, 1.061806, 0.9051264, 1, 0, 0, 1, 1,
0.2844013, -1.446583, 3.108885, 1, 0, 0, 1, 1,
0.2846373, 0.6865591, 0.1819804, 1, 0, 0, 1, 1,
0.2857037, -3.058004, 2.451011, 0, 0, 0, 1, 1,
0.2894526, 1.30018, 0.1098364, 0, 0, 0, 1, 1,
0.2905157, 0.2596872, -0.05988611, 0, 0, 0, 1, 1,
0.2975809, -1.3518, 2.634309, 0, 0, 0, 1, 1,
0.3131478, 0.5066475, -1.182036, 0, 0, 0, 1, 1,
0.3139129, -0.07993937, 1.173257, 0, 0, 0, 1, 1,
0.3149296, -0.8344288, 2.914276, 0, 0, 0, 1, 1,
0.3171053, 0.9686304, 0.2451715, 1, 1, 1, 1, 1,
0.3190527, -0.6007597, 1.711269, 1, 1, 1, 1, 1,
0.322058, 0.9283745, -0.3353863, 1, 1, 1, 1, 1,
0.3251436, 1.207107, -0.1087922, 1, 1, 1, 1, 1,
0.3251622, -0.5059125, 0.9117879, 1, 1, 1, 1, 1,
0.3261152, 0.3484361, -0.362742, 1, 1, 1, 1, 1,
0.3263704, -1.103274, 2.703808, 1, 1, 1, 1, 1,
0.3336999, -1.016948, 1.7853, 1, 1, 1, 1, 1,
0.3343285, 0.2837971, -1.024954, 1, 1, 1, 1, 1,
0.3376001, 0.07587355, 2.35998, 1, 1, 1, 1, 1,
0.3377472, -1.188455, 4.232939, 1, 1, 1, 1, 1,
0.3406052, 0.01295167, 0.4136069, 1, 1, 1, 1, 1,
0.3423505, 0.4675058, 0.966939, 1, 1, 1, 1, 1,
0.3445581, 0.8614371, 0.1524212, 1, 1, 1, 1, 1,
0.3486847, 0.397529, 1.408528, 1, 1, 1, 1, 1,
0.3490206, 0.3630483, -1.359952, 0, 0, 1, 1, 1,
0.3505896, 1.184093, 1.54934, 1, 0, 0, 1, 1,
0.3524543, 0.3504017, 0.6649117, 1, 0, 0, 1, 1,
0.352631, -1.36436, 3.141551, 1, 0, 0, 1, 1,
0.3527943, -0.3626096, 0.9943866, 1, 0, 0, 1, 1,
0.3528091, 1.75766, 0.314896, 1, 0, 0, 1, 1,
0.3581413, -0.525345, 2.772219, 0, 0, 0, 1, 1,
0.3583162, -1.313748, 4.046175, 0, 0, 0, 1, 1,
0.3617819, 1.0651, 0.9143044, 0, 0, 0, 1, 1,
0.3702769, 0.003285685, 1.641241, 0, 0, 0, 1, 1,
0.3726026, 0.4640747, -0.07424861, 0, 0, 0, 1, 1,
0.372843, 0.7853951, 1.515486, 0, 0, 0, 1, 1,
0.3757416, 0.0881677, 3.437073, 0, 0, 0, 1, 1,
0.3836755, -1.439787, 2.976338, 1, 1, 1, 1, 1,
0.3856901, 1.169309, 1.354203, 1, 1, 1, 1, 1,
0.3874063, 0.004859942, -0.1939691, 1, 1, 1, 1, 1,
0.3894493, -0.2500046, 1.969072, 1, 1, 1, 1, 1,
0.3919813, -0.8417263, 4.136548, 1, 1, 1, 1, 1,
0.3923908, -1.467035, 1.67854, 1, 1, 1, 1, 1,
0.3931183, -1.365131, 2.508485, 1, 1, 1, 1, 1,
0.393602, -0.05219759, 1.754178, 1, 1, 1, 1, 1,
0.4066692, 0.03651603, 1.058756, 1, 1, 1, 1, 1,
0.4091152, -1.829087, 2.123738, 1, 1, 1, 1, 1,
0.4101179, -0.1059289, 1.051521, 1, 1, 1, 1, 1,
0.4114019, 2.050256, -1.308372, 1, 1, 1, 1, 1,
0.4119958, 0.5207599, 1.103956, 1, 1, 1, 1, 1,
0.4134359, -1.437187, 2.929541, 1, 1, 1, 1, 1,
0.4165019, 0.8039107, 0.9180777, 1, 1, 1, 1, 1,
0.4173274, 0.9719933, 1.91871, 0, 0, 1, 1, 1,
0.4187253, -0.2262477, 3.291723, 1, 0, 0, 1, 1,
0.4215767, -1.762256, 2.54532, 1, 0, 0, 1, 1,
0.4250105, -0.08068216, 4.020376, 1, 0, 0, 1, 1,
0.4252736, 1.028628, 2.117846, 1, 0, 0, 1, 1,
0.4301589, 0.1795065, 0.2379828, 1, 0, 0, 1, 1,
0.4347174, 0.9327141, -0.471247, 0, 0, 0, 1, 1,
0.4424327, -0.01483624, 0.7628888, 0, 0, 0, 1, 1,
0.443776, -0.1358726, 2.336076, 0, 0, 0, 1, 1,
0.4439901, 0.6454444, 0.7341589, 0, 0, 0, 1, 1,
0.4472209, -0.3995141, 2.393004, 0, 0, 0, 1, 1,
0.4493361, 0.3970164, -0.1534423, 0, 0, 0, 1, 1,
0.4511826, -0.9966408, 3.393985, 0, 0, 0, 1, 1,
0.4542862, -0.3358895, 3.072761, 1, 1, 1, 1, 1,
0.4544347, -0.2635352, 3.642755, 1, 1, 1, 1, 1,
0.4608047, -1.932618, 4.662014, 1, 1, 1, 1, 1,
0.4665647, -0.741585, 2.964471, 1, 1, 1, 1, 1,
0.4708575, 1.05993, -0.593223, 1, 1, 1, 1, 1,
0.4723626, 1.396418, -0.3552494, 1, 1, 1, 1, 1,
0.4728664, 1.68455, 1.328743, 1, 1, 1, 1, 1,
0.4747861, -0.6182542, 2.805951, 1, 1, 1, 1, 1,
0.4767132, 1.427404, -0.223145, 1, 1, 1, 1, 1,
0.4772363, -0.8506597, 2.564131, 1, 1, 1, 1, 1,
0.4830315, 0.8948482, -0.2242282, 1, 1, 1, 1, 1,
0.4844093, -0.9118677, 3.900609, 1, 1, 1, 1, 1,
0.4858421, -0.8536696, -0.4871651, 1, 1, 1, 1, 1,
0.4876949, 1.165574, 0.1134253, 1, 1, 1, 1, 1,
0.4878119, 2.594764, -0.3284676, 1, 1, 1, 1, 1,
0.4900588, -0.9629951, 1.576235, 0, 0, 1, 1, 1,
0.4917066, -1.307087, 2.230201, 1, 0, 0, 1, 1,
0.494547, 0.5294226, 3.459389, 1, 0, 0, 1, 1,
0.494798, 1.825811, 0.3893224, 1, 0, 0, 1, 1,
0.4971626, -0.8696226, 3.13335, 1, 0, 0, 1, 1,
0.4974486, 0.07401288, -0.2174254, 1, 0, 0, 1, 1,
0.5033739, 0.2806996, -0.4431908, 0, 0, 0, 1, 1,
0.503485, 0.6053002, -0.3015953, 0, 0, 0, 1, 1,
0.5055418, 0.2025603, 2.692366, 0, 0, 0, 1, 1,
0.5102939, 0.6222656, 1.533567, 0, 0, 0, 1, 1,
0.5139408, -0.06838519, 1.528704, 0, 0, 0, 1, 1,
0.5149119, 0.2225436, 1.634522, 0, 0, 0, 1, 1,
0.5235645, 0.3097899, 1.52955, 0, 0, 0, 1, 1,
0.52372, -0.4942583, 2.356499, 1, 1, 1, 1, 1,
0.5330676, -0.1957058, -0.09590942, 1, 1, 1, 1, 1,
0.534523, 0.8007055, 0.261165, 1, 1, 1, 1, 1,
0.5350208, 0.6071545, 0.4324957, 1, 1, 1, 1, 1,
0.546499, 0.3341819, 0.2548267, 1, 1, 1, 1, 1,
0.5484644, -0.07610748, 2.182083, 1, 1, 1, 1, 1,
0.5544416, 0.223501, 1.0874, 1, 1, 1, 1, 1,
0.5562844, 0.6237469, 1.333256, 1, 1, 1, 1, 1,
0.5599777, -0.7682592, 3.400057, 1, 1, 1, 1, 1,
0.5663125, 0.4854659, -0.04745873, 1, 1, 1, 1, 1,
0.5769343, -0.1894195, 1.684999, 1, 1, 1, 1, 1,
0.5835635, 0.03115662, 0.205767, 1, 1, 1, 1, 1,
0.5907227, -0.2230158, 1.310932, 1, 1, 1, 1, 1,
0.5951334, 1.15477, 0.3314704, 1, 1, 1, 1, 1,
0.5985379, -0.5090523, 2.236224, 1, 1, 1, 1, 1,
0.601804, -0.05497641, 0.3661784, 0, 0, 1, 1, 1,
0.6028547, -0.3611791, 2.982027, 1, 0, 0, 1, 1,
0.6051133, -0.2998423, 2.460563, 1, 0, 0, 1, 1,
0.6067909, -1.77432, 1.512937, 1, 0, 0, 1, 1,
0.608902, 0.03449302, 0.9517693, 1, 0, 0, 1, 1,
0.6091241, 0.1829959, 0.3572068, 1, 0, 0, 1, 1,
0.6173789, 2.0797, -0.1210273, 0, 0, 0, 1, 1,
0.6241998, 1.132151, 0.8438378, 0, 0, 0, 1, 1,
0.6247204, -1.405402, 1.884068, 0, 0, 0, 1, 1,
0.6253153, 1.836868, -1.711642, 0, 0, 0, 1, 1,
0.6266007, -1.281839, 0.1734054, 0, 0, 0, 1, 1,
0.6275645, -0.8412266, 3.121305, 0, 0, 0, 1, 1,
0.6279316, -0.1445097, 2.371083, 0, 0, 0, 1, 1,
0.6399093, -1.158701, 1.76195, 1, 1, 1, 1, 1,
0.6453891, 1.07432, -0.7643331, 1, 1, 1, 1, 1,
0.6554826, -0.7172928, 3.973266, 1, 1, 1, 1, 1,
0.6590146, 0.02801237, 1.197087, 1, 1, 1, 1, 1,
0.6613013, 0.7885516, 0.5527052, 1, 1, 1, 1, 1,
0.6649918, 0.0201457, 2.55266, 1, 1, 1, 1, 1,
0.6649954, -0.6158851, 2.563521, 1, 1, 1, 1, 1,
0.672747, 0.6715419, 1.108573, 1, 1, 1, 1, 1,
0.6747491, -1.876261, 4.987296, 1, 1, 1, 1, 1,
0.6774104, -0.5058644, 2.629052, 1, 1, 1, 1, 1,
0.6787422, 0.7479292, -1.073823, 1, 1, 1, 1, 1,
0.6896624, 0.1481928, -0.1230034, 1, 1, 1, 1, 1,
0.6904984, 0.2499007, 1.279073, 1, 1, 1, 1, 1,
0.6941898, -0.2143971, 1.067348, 1, 1, 1, 1, 1,
0.6955813, -0.8556168, 2.981145, 1, 1, 1, 1, 1,
0.6956881, -0.3562335, 1.16654, 0, 0, 1, 1, 1,
0.6963326, -0.0006454777, 1.71919, 1, 0, 0, 1, 1,
0.7004674, -1.059816, 2.380958, 1, 0, 0, 1, 1,
0.7005254, -0.7868522, 2.859231, 1, 0, 0, 1, 1,
0.7020229, 0.483533, 0.3511733, 1, 0, 0, 1, 1,
0.7029637, -0.4606917, 1.930398, 1, 0, 0, 1, 1,
0.7059187, 0.296966, 0.4086764, 0, 0, 0, 1, 1,
0.7096045, 0.05609217, -0.04848164, 0, 0, 0, 1, 1,
0.7176408, -0.7981785, 4.157181, 0, 0, 0, 1, 1,
0.7294726, -0.2186607, 0.005219738, 0, 0, 0, 1, 1,
0.7312293, -1.233054, 1.909711, 0, 0, 0, 1, 1,
0.7494143, 1.739828, 1.011909, 0, 0, 0, 1, 1,
0.749742, -0.8017, 0.4873704, 0, 0, 0, 1, 1,
0.765768, -0.2342119, 1.116546, 1, 1, 1, 1, 1,
0.7684012, -0.05515152, 0.8583196, 1, 1, 1, 1, 1,
0.7702579, 0.6260834, 2.040107, 1, 1, 1, 1, 1,
0.7713514, 1.156547, 0.2086045, 1, 1, 1, 1, 1,
0.771686, -0.4726166, 2.285582, 1, 1, 1, 1, 1,
0.7726797, 0.2925139, 2.054592, 1, 1, 1, 1, 1,
0.7769893, 1.76377, 1.129974, 1, 1, 1, 1, 1,
0.7791768, -0.5026515, 2.027033, 1, 1, 1, 1, 1,
0.7792264, -0.1880345, 2.318562, 1, 1, 1, 1, 1,
0.7805324, 2.301377, 0.9614822, 1, 1, 1, 1, 1,
0.7917897, -0.1434025, 2.322341, 1, 1, 1, 1, 1,
0.7922671, -0.775842, 3.217072, 1, 1, 1, 1, 1,
0.7926294, 1.803868, 0.1609268, 1, 1, 1, 1, 1,
0.7931212, 0.3412354, 2.687207, 1, 1, 1, 1, 1,
0.7935059, 0.7600687, 1.488206, 1, 1, 1, 1, 1,
0.7964108, 1.646203, 0.6551163, 0, 0, 1, 1, 1,
0.8026578, 1.170744, -0.1090537, 1, 0, 0, 1, 1,
0.8034902, 0.9835284, -0.9651103, 1, 0, 0, 1, 1,
0.8040659, 0.9304128, -0.3116337, 1, 0, 0, 1, 1,
0.8069226, -0.7494598, 1.787443, 1, 0, 0, 1, 1,
0.8071468, 1.532448, -0.3517252, 1, 0, 0, 1, 1,
0.8119406, -0.05902358, 2.385274, 0, 0, 0, 1, 1,
0.8147528, 0.243702, 0.4121248, 0, 0, 0, 1, 1,
0.8176813, 0.4591247, 2.718601, 0, 0, 0, 1, 1,
0.8199396, -1.507289, 2.133494, 0, 0, 0, 1, 1,
0.8199627, 0.6331197, -0.104504, 0, 0, 0, 1, 1,
0.8213255, -0.2464444, 1.163247, 0, 0, 0, 1, 1,
0.8261556, 0.7108696, 0.9123778, 0, 0, 0, 1, 1,
0.8288652, -0.5909575, 2.625054, 1, 1, 1, 1, 1,
0.8299623, 0.463249, -0.2107838, 1, 1, 1, 1, 1,
0.8450672, -0.5540743, 1.765025, 1, 1, 1, 1, 1,
0.8484145, 1.254662, 0.4149312, 1, 1, 1, 1, 1,
0.8499709, 0.1735209, 1.012188, 1, 1, 1, 1, 1,
0.8543189, -0.06963877, 0.3954298, 1, 1, 1, 1, 1,
0.8578684, 1.012951, -0.5253349, 1, 1, 1, 1, 1,
0.8628368, -0.6878176, 1.622588, 1, 1, 1, 1, 1,
0.8735631, -1.337133, 1.955703, 1, 1, 1, 1, 1,
0.8736392, -0.7360249, 2.473248, 1, 1, 1, 1, 1,
0.8764963, 0.4390306, -0.710542, 1, 1, 1, 1, 1,
0.87813, 0.1589355, 1.026786, 1, 1, 1, 1, 1,
0.8785986, -0.5864756, 2.74117, 1, 1, 1, 1, 1,
0.8807117, -0.8765122, 0.1865826, 1, 1, 1, 1, 1,
0.8885308, -0.8744288, 1.519919, 1, 1, 1, 1, 1,
0.8919175, 0.2268216, 1.159281, 0, 0, 1, 1, 1,
0.8947737, -0.2740334, 0.5231648, 1, 0, 0, 1, 1,
0.8950352, 0.8804774, 1.404309, 1, 0, 0, 1, 1,
0.9004271, -0.7716326, 3.057937, 1, 0, 0, 1, 1,
0.9016408, 0.3220085, 1.135026, 1, 0, 0, 1, 1,
0.9018626, 0.3997113, 1.354427, 1, 0, 0, 1, 1,
0.9023972, 0.9996693, -0.5345805, 0, 0, 0, 1, 1,
0.9040236, 0.7283031, 0.8898241, 0, 0, 0, 1, 1,
0.9157919, 0.1122181, 1.144411, 0, 0, 0, 1, 1,
0.9172465, 1.77022, 0.3486886, 0, 0, 0, 1, 1,
0.9176555, -0.08751225, 2.316806, 0, 0, 0, 1, 1,
0.9241017, -0.07403282, 2.356109, 0, 0, 0, 1, 1,
0.9304705, -1.278435, 2.658628, 0, 0, 0, 1, 1,
0.9328154, 0.8773332, -0.4022475, 1, 1, 1, 1, 1,
0.9361798, -2.028413, 3.112144, 1, 1, 1, 1, 1,
0.948402, 0.1536176, 1.891555, 1, 1, 1, 1, 1,
0.9496758, -1.119742, 2.711382, 1, 1, 1, 1, 1,
0.9532299, -0.3622729, 2.390278, 1, 1, 1, 1, 1,
0.9551904, -1.359975, 2.745133, 1, 1, 1, 1, 1,
0.9582694, -0.3546364, 3.228452, 1, 1, 1, 1, 1,
0.9611259, 0.6031432, 1.031, 1, 1, 1, 1, 1,
0.9625748, -0.462247, 2.398896, 1, 1, 1, 1, 1,
0.9632786, -0.05862335, 3.430107, 1, 1, 1, 1, 1,
0.9653425, -0.06947996, 1.486901, 1, 1, 1, 1, 1,
0.9702767, 1.82886, 0.489207, 1, 1, 1, 1, 1,
0.9716305, 0.2694359, 1.222793, 1, 1, 1, 1, 1,
0.9776646, -1.333233, 2.901633, 1, 1, 1, 1, 1,
0.9792004, 2.312984, 1.646833, 1, 1, 1, 1, 1,
0.9894528, -1.81041, 2.523879, 0, 0, 1, 1, 1,
0.9898862, -0.006124325, 1.605148, 1, 0, 0, 1, 1,
1.009769, 0.2687639, 1.872843, 1, 0, 0, 1, 1,
1.020114, 0.7808741, 0.9863127, 1, 0, 0, 1, 1,
1.021418, 1.028526, 1.601228, 1, 0, 0, 1, 1,
1.022553, -0.6834993, 3.403128, 1, 0, 0, 1, 1,
1.022907, 0.9040691, 1.644809, 0, 0, 0, 1, 1,
1.026522, 0.03766945, 0.880933, 0, 0, 0, 1, 1,
1.029698, -0.8568757, 2.410467, 0, 0, 0, 1, 1,
1.031358, -1.355789, 2.844208, 0, 0, 0, 1, 1,
1.036459, 0.8272585, 2.403851, 0, 0, 0, 1, 1,
1.038905, -1.082174, 1.635908, 0, 0, 0, 1, 1,
1.03977, 0.6243836, 0.9904009, 0, 0, 0, 1, 1,
1.050601, -0.8453708, 1.266274, 1, 1, 1, 1, 1,
1.053803, -1.152132, 1.909914, 1, 1, 1, 1, 1,
1.05951, 0.227309, -0.3922173, 1, 1, 1, 1, 1,
1.068635, 0.08142045, 1.217567, 1, 1, 1, 1, 1,
1.072808, -0.6606022, 1.370288, 1, 1, 1, 1, 1,
1.07631, -1.075038, 2.567199, 1, 1, 1, 1, 1,
1.078138, 0.5027744, -0.1027936, 1, 1, 1, 1, 1,
1.079498, -0.2048878, 2.964216, 1, 1, 1, 1, 1,
1.080586, 1.280091, 0.4649753, 1, 1, 1, 1, 1,
1.083235, 0.1410451, 1.482823, 1, 1, 1, 1, 1,
1.084874, 0.1862577, 1.409715, 1, 1, 1, 1, 1,
1.086433, 0.4921472, 2.093688, 1, 1, 1, 1, 1,
1.087442, 0.5098462, 0.006809758, 1, 1, 1, 1, 1,
1.088812, -0.4399908, 0.5863368, 1, 1, 1, 1, 1,
1.08925, 0.0762879, 0.8658442, 1, 1, 1, 1, 1,
1.091585, -0.6156296, 1.124954, 0, 0, 1, 1, 1,
1.096759, 2.381532, 0.663214, 1, 0, 0, 1, 1,
1.097548, 1.113449, 2.177654, 1, 0, 0, 1, 1,
1.098114, -0.3376508, 2.148849, 1, 0, 0, 1, 1,
1.102104, -0.06116587, 1.285505, 1, 0, 0, 1, 1,
1.105045, -0.07891808, 1.51031, 1, 0, 0, 1, 1,
1.107242, 0.6139832, 0.445431, 0, 0, 0, 1, 1,
1.110968, 1.171816, 0.3415558, 0, 0, 0, 1, 1,
1.113434, -1.203138, 1.588718, 0, 0, 0, 1, 1,
1.117745, -0.7853021, 4.397742, 0, 0, 0, 1, 1,
1.121156, 0.4196596, 3.301592, 0, 0, 0, 1, 1,
1.131563, -0.02207769, 1.757726, 0, 0, 0, 1, 1,
1.132016, 1.147137, 0.07627803, 0, 0, 0, 1, 1,
1.144509, -0.2321013, 1.082555, 1, 1, 1, 1, 1,
1.145183, -0.6464416, 3.063793, 1, 1, 1, 1, 1,
1.154217, 1.16882, 1.078496, 1, 1, 1, 1, 1,
1.159557, -1.00878, 2.036309, 1, 1, 1, 1, 1,
1.160825, 0.2527335, 1.211846, 1, 1, 1, 1, 1,
1.170878, -1.096568, 1.89087, 1, 1, 1, 1, 1,
1.177529, 1.136818, 0.4452794, 1, 1, 1, 1, 1,
1.178047, -1.670534, 1.681412, 1, 1, 1, 1, 1,
1.183182, 2.297433, -0.4862649, 1, 1, 1, 1, 1,
1.190388, -1.893305, 2.596439, 1, 1, 1, 1, 1,
1.198623, 0.6893179, 3.446597, 1, 1, 1, 1, 1,
1.202515, -0.3316844, 1.643884, 1, 1, 1, 1, 1,
1.205889, -0.2210294, 1.600687, 1, 1, 1, 1, 1,
1.213584, -0.02010624, 0.9157839, 1, 1, 1, 1, 1,
1.2232, 0.3409156, 2.661881, 1, 1, 1, 1, 1,
1.230739, -0.5253218, 2.308124, 0, 0, 1, 1, 1,
1.23769, 0.3061246, 2.254288, 1, 0, 0, 1, 1,
1.245099, 0.3760598, 0.7788726, 1, 0, 0, 1, 1,
1.251028, 1.057805, -0.975531, 1, 0, 0, 1, 1,
1.260598, -1.664901, 3.590951, 1, 0, 0, 1, 1,
1.262845, 1.229279, 1.971891, 1, 0, 0, 1, 1,
1.264623, -0.4070362, 2.031991, 0, 0, 0, 1, 1,
1.267893, 0.03938643, 2.340502, 0, 0, 0, 1, 1,
1.270838, 0.207654, 0.5222188, 0, 0, 0, 1, 1,
1.272868, 1.081183, 0.9308449, 0, 0, 0, 1, 1,
1.280906, 0.1523161, 1.625335, 0, 0, 0, 1, 1,
1.300605, 0.8347264, 2.235102, 0, 0, 0, 1, 1,
1.301261, -1.264502, 3.182264, 0, 0, 0, 1, 1,
1.310224, -1.086884, 2.294024, 1, 1, 1, 1, 1,
1.312875, 0.1611375, 0.4213148, 1, 1, 1, 1, 1,
1.314986, -0.1019451, 2.922769, 1, 1, 1, 1, 1,
1.320857, 0.7489441, 2.510522, 1, 1, 1, 1, 1,
1.326318, 1.230412, -0.9792421, 1, 1, 1, 1, 1,
1.337397, -0.6550695, 2.603393, 1, 1, 1, 1, 1,
1.340643, 2.004817, -0.6095205, 1, 1, 1, 1, 1,
1.34132, -0.3825637, 1.839505, 1, 1, 1, 1, 1,
1.346306, 0.1939566, 1.297392, 1, 1, 1, 1, 1,
1.348004, -0.05806183, 0.7124059, 1, 1, 1, 1, 1,
1.348246, -0.5749463, 2.980477, 1, 1, 1, 1, 1,
1.360109, 0.998706, -0.5955678, 1, 1, 1, 1, 1,
1.362875, -1.695833, 0.5965156, 1, 1, 1, 1, 1,
1.366571, -0.5487172, 1.208092, 1, 1, 1, 1, 1,
1.374946, -0.9535223, 1.789765, 1, 1, 1, 1, 1,
1.393425, -0.02343662, 2.136972, 0, 0, 1, 1, 1,
1.40853, 1.48589, 0.1566108, 1, 0, 0, 1, 1,
1.409279, 0.3878416, 0.5318695, 1, 0, 0, 1, 1,
1.428918, 1.535525, 0.1124768, 1, 0, 0, 1, 1,
1.437373, -1.132619, -0.3324119, 1, 0, 0, 1, 1,
1.439567, -0.545355, 1.669194, 1, 0, 0, 1, 1,
1.446086, 0.4562636, 0.7026197, 0, 0, 0, 1, 1,
1.461389, 0.124457, 2.882033, 0, 0, 0, 1, 1,
1.467084, -0.9226242, 1.769068, 0, 0, 0, 1, 1,
1.467113, -1.109608, 2.616995, 0, 0, 0, 1, 1,
1.47994, -1.901327, 0.3664156, 0, 0, 0, 1, 1,
1.492424, 0.2858297, 0.4361486, 0, 0, 0, 1, 1,
1.493939, -1.037822, 0.8756189, 0, 0, 0, 1, 1,
1.495795, -1.740651, 1.947008, 1, 1, 1, 1, 1,
1.501308, -0.5139596, 2.290833, 1, 1, 1, 1, 1,
1.515601, -1.656509, 3.013266, 1, 1, 1, 1, 1,
1.520901, -0.3855959, 3.340871, 1, 1, 1, 1, 1,
1.521553, -0.9562562, 2.136917, 1, 1, 1, 1, 1,
1.526363, -0.4377544, 0.982916, 1, 1, 1, 1, 1,
1.530533, -1.090141, 3.668408, 1, 1, 1, 1, 1,
1.555209, 1.08321, 0.249136, 1, 1, 1, 1, 1,
1.563682, -0.8003607, 2.334595, 1, 1, 1, 1, 1,
1.57307, 0.7447871, 2.4746, 1, 1, 1, 1, 1,
1.575308, -1.190794, 0.4808987, 1, 1, 1, 1, 1,
1.595107, -0.3632899, 1.908913, 1, 1, 1, 1, 1,
1.595276, 0.9279948, 1.037756, 1, 1, 1, 1, 1,
1.599576, -0.2893748, 0.5287028, 1, 1, 1, 1, 1,
1.606914, 0.4593928, 1.28867, 1, 1, 1, 1, 1,
1.613054, -0.01701355, 0.8336083, 0, 0, 1, 1, 1,
1.62554, 0.5075305, 1.471727, 1, 0, 0, 1, 1,
1.641579, 0.1238933, 1.788875, 1, 0, 0, 1, 1,
1.648543, 0.7185558, 1.944675, 1, 0, 0, 1, 1,
1.667271, 0.5576364, 1.996799, 1, 0, 0, 1, 1,
1.674839, 0.7812293, 0.5677053, 1, 0, 0, 1, 1,
1.687324, 1.146663, 0.8431313, 0, 0, 0, 1, 1,
1.689549, 0.7514648, 0.9985988, 0, 0, 0, 1, 1,
1.697597, -1.288378, 2.23872, 0, 0, 0, 1, 1,
1.707667, -0.1785722, -0.1435608, 0, 0, 0, 1, 1,
1.716576, 0.06700815, 0.08717824, 0, 0, 0, 1, 1,
1.74515, 1.754688, 0.544627, 0, 0, 0, 1, 1,
1.759124, -0.4033195, 2.352705, 0, 0, 0, 1, 1,
1.763562, -0.4886814, 0.9897704, 1, 1, 1, 1, 1,
1.777509, -1.127689, 3.774422, 1, 1, 1, 1, 1,
1.807564, 0.9336033, -0.9755188, 1, 1, 1, 1, 1,
1.824284, 0.7997813, -0.7859247, 1, 1, 1, 1, 1,
1.826368, 0.6101952, 1.637568, 1, 1, 1, 1, 1,
1.829891, -0.5479867, 2.084947, 1, 1, 1, 1, 1,
1.833411, 2.324627, -0.5821622, 1, 1, 1, 1, 1,
1.851002, 0.8000911, 2.388738, 1, 1, 1, 1, 1,
1.852154, -0.7537715, 2.050517, 1, 1, 1, 1, 1,
1.858563, 1.394274, 0.08897068, 1, 1, 1, 1, 1,
1.86768, -0.852775, -0.6435927, 1, 1, 1, 1, 1,
1.879591, -1.618745, 1.915459, 1, 1, 1, 1, 1,
1.882522, 0.02314536, 1.776577, 1, 1, 1, 1, 1,
1.947163, -0.2582062, 1.663942, 1, 1, 1, 1, 1,
1.950485, -1.132257, 3.282379, 1, 1, 1, 1, 1,
1.96383, 0.226048, 4.240035, 0, 0, 1, 1, 1,
1.964418, 0.2129165, 1.335319, 1, 0, 0, 1, 1,
1.990533, 0.1683403, 1.51775, 1, 0, 0, 1, 1,
1.996661, 0.5264626, 1.987272, 1, 0, 0, 1, 1,
2.018075, -0.2205717, 0.869742, 1, 0, 0, 1, 1,
2.032509, 1.133664, 0.92055, 1, 0, 0, 1, 1,
2.072336, -1.154865, 2.352642, 0, 0, 0, 1, 1,
2.094912, 0.5016748, 1.982794, 0, 0, 0, 1, 1,
2.116243, -0.7038854, 2.488539, 0, 0, 0, 1, 1,
2.172587, -0.4202469, 2.161762, 0, 0, 0, 1, 1,
2.180916, -0.1069624, 1.919296, 0, 0, 0, 1, 1,
2.223117, -1.135908, 1.859402, 0, 0, 0, 1, 1,
2.264804, -0.5310615, 2.615667, 0, 0, 0, 1, 1,
2.33575, 0.0431888, 1.694978, 1, 1, 1, 1, 1,
2.342773, 1.480861, 1.772484, 1, 1, 1, 1, 1,
2.584989, -0.9209367, 1.604879, 1, 1, 1, 1, 1,
2.707782, -0.3186211, 1.416511, 1, 1, 1, 1, 1,
2.79783, -0.4069151, 0.779466, 1, 1, 1, 1, 1,
3.154511, 0.7785687, 0.502146, 1, 1, 1, 1, 1,
3.455669, -0.8181608, 1.413311, 1, 1, 1, 1, 1
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
var radius = 9.931547;
var distance = 34.88414;
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
mvMatrix.translate( -0.09261608, 0.1098027, 0.01692438 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88414);
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