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
-3.431033, -0.8170315, -2.890244, 1, 0, 0, 1,
-3.130216, 0.08168252, -1.236756, 1, 0.007843138, 0, 1,
-3.048726, -0.6177616, -2.030352, 1, 0.01176471, 0, 1,
-2.668739, -1.548717, -3.129983, 1, 0.01960784, 0, 1,
-2.506347, -0.3093044, -0.9895564, 1, 0.02352941, 0, 1,
-2.442154, -0.6981431, -2.029948, 1, 0.03137255, 0, 1,
-2.429129, 0.9372159, -0.6335121, 1, 0.03529412, 0, 1,
-2.35486, 0.8608588, -0.6506281, 1, 0.04313726, 0, 1,
-2.296809, 1.278169, -0.7581736, 1, 0.04705882, 0, 1,
-2.286645, 1.186264, -0.1755333, 1, 0.05490196, 0, 1,
-2.280597, -0.9571328, -2.513202, 1, 0.05882353, 0, 1,
-2.240832, -2.730705, -0.8736401, 1, 0.06666667, 0, 1,
-2.232284, -0.1540887, -1.196117, 1, 0.07058824, 0, 1,
-2.205713, -1.78538, -2.370668, 1, 0.07843138, 0, 1,
-2.203779, -0.03704384, -0.02619242, 1, 0.08235294, 0, 1,
-2.187685, -0.8808013, -3.455927, 1, 0.09019608, 0, 1,
-2.179579, -0.5079128, -1.062455, 1, 0.09411765, 0, 1,
-2.135869, 0.2255593, -1.813934, 1, 0.1019608, 0, 1,
-2.127754, -1.488519, -4.478224, 1, 0.1098039, 0, 1,
-2.111912, -0.6505955, -2.185975, 1, 0.1137255, 0, 1,
-2.098304, -0.009337027, -1.233308, 1, 0.1215686, 0, 1,
-2.081214, 1.030621, -0.2379141, 1, 0.1254902, 0, 1,
-2.069324, -1.031583, 0.1155123, 1, 0.1333333, 0, 1,
-2.038287, -0.03085223, -1.393435, 1, 0.1372549, 0, 1,
-2.030833, 1.155769, -1.017247, 1, 0.145098, 0, 1,
-2.019752, -0.4183593, -1.261922, 1, 0.1490196, 0, 1,
-2.016615, 0.199205, -2.000618, 1, 0.1568628, 0, 1,
-2.004692, 0.1835138, -2.011316, 1, 0.1607843, 0, 1,
-2.003122, -0.7416198, 0.7242469, 1, 0.1686275, 0, 1,
-1.987616, -2.568426, -4.229793, 1, 0.172549, 0, 1,
-1.986219, -1.160209, -2.738944, 1, 0.1803922, 0, 1,
-1.901268, -1.119045, -2.327502, 1, 0.1843137, 0, 1,
-1.877355, 1.204259, -1.193177, 1, 0.1921569, 0, 1,
-1.87309, -0.01589393, -3.081518, 1, 0.1960784, 0, 1,
-1.871313, 0.2378618, -2.519069, 1, 0.2039216, 0, 1,
-1.858264, 0.2529816, -0.0008803187, 1, 0.2117647, 0, 1,
-1.83944, -1.12805, -0.4847273, 1, 0.2156863, 0, 1,
-1.829935, -0.5872188, -2.421063, 1, 0.2235294, 0, 1,
-1.827028, -0.1670998, -1.682104, 1, 0.227451, 0, 1,
-1.826431, -1.871994, -3.969803, 1, 0.2352941, 0, 1,
-1.763198, 0.5537255, -0.1154679, 1, 0.2392157, 0, 1,
-1.738691, 0.05714056, -1.880589, 1, 0.2470588, 0, 1,
-1.713284, -0.8670086, -2.345468, 1, 0.2509804, 0, 1,
-1.694323, -1.649307, -2.692635, 1, 0.2588235, 0, 1,
-1.693178, -1.549884, -4.223531, 1, 0.2627451, 0, 1,
-1.692279, 1.195537, 1.452791, 1, 0.2705882, 0, 1,
-1.675619, 0.4197736, -0.1206602, 1, 0.2745098, 0, 1,
-1.673256, 1.310364, -2.230169, 1, 0.282353, 0, 1,
-1.671305, 0.7104378, -1.443042, 1, 0.2862745, 0, 1,
-1.668736, 0.8503012, -0.1565515, 1, 0.2941177, 0, 1,
-1.661756, 0.9929405, -0.7504024, 1, 0.3019608, 0, 1,
-1.653904, 0.2118432, -1.921292, 1, 0.3058824, 0, 1,
-1.650285, -1.267089, -3.738998, 1, 0.3137255, 0, 1,
-1.6487, -1.890266, -2.998999, 1, 0.3176471, 0, 1,
-1.644026, 0.4829768, -1.32945, 1, 0.3254902, 0, 1,
-1.640199, -0.7187969, -0.3319499, 1, 0.3294118, 0, 1,
-1.631325, 1.893501, -0.6201953, 1, 0.3372549, 0, 1,
-1.617865, -0.6624972, -2.39994, 1, 0.3411765, 0, 1,
-1.613161, 1.446362, -1.876668, 1, 0.3490196, 0, 1,
-1.601751, 0.5911535, -0.8562787, 1, 0.3529412, 0, 1,
-1.600323, -0.02643647, -1.282261, 1, 0.3607843, 0, 1,
-1.595232, -0.1479712, -1.841348, 1, 0.3647059, 0, 1,
-1.556273, 0.06495524, -1.310312, 1, 0.372549, 0, 1,
-1.553427, -1.296358, -2.123324, 1, 0.3764706, 0, 1,
-1.541713, 1.537594, 0.6327876, 1, 0.3843137, 0, 1,
-1.530518, -1.514178, -2.026415, 1, 0.3882353, 0, 1,
-1.530315, 0.8672959, -0.6482512, 1, 0.3960784, 0, 1,
-1.526929, -2.785002, -1.595343, 1, 0.4039216, 0, 1,
-1.515116, -0.1925624, -1.706633, 1, 0.4078431, 0, 1,
-1.509598, 1.647385, -0.9511166, 1, 0.4156863, 0, 1,
-1.49707, -0.4145357, -0.4235688, 1, 0.4196078, 0, 1,
-1.487284, 0.6360101, -0.7201675, 1, 0.427451, 0, 1,
-1.475871, 0.1328099, -0.6863371, 1, 0.4313726, 0, 1,
-1.472809, -2.349738, -2.125323, 1, 0.4392157, 0, 1,
-1.470757, 0.1751966, -1.474462, 1, 0.4431373, 0, 1,
-1.46959, -0.3361844, -2.295782, 1, 0.4509804, 0, 1,
-1.466804, -0.07866917, -1.891627, 1, 0.454902, 0, 1,
-1.466763, -0.03409228, -0.7066736, 1, 0.4627451, 0, 1,
-1.454889, -1.297351, -2.803774, 1, 0.4666667, 0, 1,
-1.452835, -0.7175233, -2.27873, 1, 0.4745098, 0, 1,
-1.436812, 1.090099, -1.579876, 1, 0.4784314, 0, 1,
-1.435342, 1.025958, -0.6709496, 1, 0.4862745, 0, 1,
-1.432198, 0.3217084, -0.2469173, 1, 0.4901961, 0, 1,
-1.429017, 1.34672, -0.2499065, 1, 0.4980392, 0, 1,
-1.426094, 0.9542735, -2.234609, 1, 0.5058824, 0, 1,
-1.425673, -0.5810456, -1.76547, 1, 0.509804, 0, 1,
-1.416957, -1.195111, -2.084862, 1, 0.5176471, 0, 1,
-1.416587, -0.627578, -1.641256, 1, 0.5215687, 0, 1,
-1.413612, 0.6621118, -1.592948, 1, 0.5294118, 0, 1,
-1.399318, -0.8444343, -3.365581, 1, 0.5333334, 0, 1,
-1.397232, -2.324745, -1.717481, 1, 0.5411765, 0, 1,
-1.387667, -1.735176, -2.118014, 1, 0.5450981, 0, 1,
-1.387554, -0.6828616, -1.422658, 1, 0.5529412, 0, 1,
-1.386521, -0.8756467, -2.561153, 1, 0.5568628, 0, 1,
-1.38482, -1.27207, -3.199022, 1, 0.5647059, 0, 1,
-1.374104, 1.509758, -1.960369, 1, 0.5686275, 0, 1,
-1.363636, -0.4872397, -3.436248, 1, 0.5764706, 0, 1,
-1.357472, 1.299251, -0.6977631, 1, 0.5803922, 0, 1,
-1.356151, -1.16134, -3.112174, 1, 0.5882353, 0, 1,
-1.352064, -1.52188, -3.667296, 1, 0.5921569, 0, 1,
-1.347693, -0.0154781, -0.9142879, 1, 0.6, 0, 1,
-1.346931, 0.05479718, -0.984742, 1, 0.6078432, 0, 1,
-1.340499, -1.304111, -0.5576286, 1, 0.6117647, 0, 1,
-1.339624, -0.5716455, -2.587095, 1, 0.6196079, 0, 1,
-1.335817, -1.337687, -4.029935, 1, 0.6235294, 0, 1,
-1.333514, 0.9010102, -0.0308081, 1, 0.6313726, 0, 1,
-1.330824, 1.208754, -1.372957, 1, 0.6352941, 0, 1,
-1.319274, 1.537649, -1.09146, 1, 0.6431373, 0, 1,
-1.312628, 0.3046088, -0.5330902, 1, 0.6470588, 0, 1,
-1.309299, 0.540152, -2.687469, 1, 0.654902, 0, 1,
-1.305821, 0.3671707, -0.9864882, 1, 0.6588235, 0, 1,
-1.298112, 1.142656, -0.4698021, 1, 0.6666667, 0, 1,
-1.296964, -0.6256471, -0.58766, 1, 0.6705883, 0, 1,
-1.291553, 0.03148746, -1.664181, 1, 0.6784314, 0, 1,
-1.287217, 0.8393959, -1.248843, 1, 0.682353, 0, 1,
-1.283439, 0.8275297, -0.1892373, 1, 0.6901961, 0, 1,
-1.276652, -2.607952, -1.492002, 1, 0.6941177, 0, 1,
-1.270082, 1.091966, -1.196065, 1, 0.7019608, 0, 1,
-1.265041, -0.529655, -1.730545, 1, 0.7098039, 0, 1,
-1.261663, -0.6507006, -1.853678, 1, 0.7137255, 0, 1,
-1.260951, -0.4800346, -2.970754, 1, 0.7215686, 0, 1,
-1.256063, -0.7864724, -2.548511, 1, 0.7254902, 0, 1,
-1.25151, -0.04249557, -3.684978, 1, 0.7333333, 0, 1,
-1.251083, -0.4736628, -0.2805761, 1, 0.7372549, 0, 1,
-1.247688, 1.473746, -2.433511, 1, 0.7450981, 0, 1,
-1.246851, -1.395097, -1.947641, 1, 0.7490196, 0, 1,
-1.241317, 0.4027318, -0.3295452, 1, 0.7568628, 0, 1,
-1.234779, -0.7758812, -2.22352, 1, 0.7607843, 0, 1,
-1.231819, 1.17584, -1.107894, 1, 0.7686275, 0, 1,
-1.224687, -0.7310454, -2.366437, 1, 0.772549, 0, 1,
-1.212296, 0.3129081, -2.927925, 1, 0.7803922, 0, 1,
-1.195421, -0.215881, -0.9464532, 1, 0.7843137, 0, 1,
-1.173429, 1.472339, 0.00724103, 1, 0.7921569, 0, 1,
-1.171511, -1.679282, -2.699659, 1, 0.7960784, 0, 1,
-1.170006, -0.599288, -3.428151, 1, 0.8039216, 0, 1,
-1.169047, -0.7285116, -1.34072, 1, 0.8117647, 0, 1,
-1.162469, -1.824706, -0.7050973, 1, 0.8156863, 0, 1,
-1.162321, -0.7080358, -1.322104, 1, 0.8235294, 0, 1,
-1.157649, -1.132781, -2.305765, 1, 0.827451, 0, 1,
-1.157341, 0.2295519, -2.151707, 1, 0.8352941, 0, 1,
-1.144413, -0.8495789, -1.560444, 1, 0.8392157, 0, 1,
-1.139814, -1.563946, -1.850128, 1, 0.8470588, 0, 1,
-1.131938, -0.4756644, -1.015515, 1, 0.8509804, 0, 1,
-1.128457, 1.538106, -0.3292879, 1, 0.8588235, 0, 1,
-1.12739, -0.4447846, -1.546593, 1, 0.8627451, 0, 1,
-1.125575, -0.1064281, -2.336411, 1, 0.8705882, 0, 1,
-1.119056, -0.580994, -0.3618372, 1, 0.8745098, 0, 1,
-1.104829, 0.6153024, -1.573796, 1, 0.8823529, 0, 1,
-1.103684, -1.029587, -2.243017, 1, 0.8862745, 0, 1,
-1.101564, 0.818257, 0.772663, 1, 0.8941177, 0, 1,
-1.098874, 2.0101, -0.03116434, 1, 0.8980392, 0, 1,
-1.095022, 0.1172576, -0.7828377, 1, 0.9058824, 0, 1,
-1.091201, 0.253976, -1.6779, 1, 0.9137255, 0, 1,
-1.088184, 0.132658, -0.9716969, 1, 0.9176471, 0, 1,
-1.085899, -0.6979579, -3.154634, 1, 0.9254902, 0, 1,
-1.07883, 0.4337945, -2.602462, 1, 0.9294118, 0, 1,
-1.077931, -1.030809, -3.215558, 1, 0.9372549, 0, 1,
-1.067944, 0.3553565, 0.6988026, 1, 0.9411765, 0, 1,
-1.062972, 0.1003073, -0.2740558, 1, 0.9490196, 0, 1,
-1.05806, 1.087187, -0.5887942, 1, 0.9529412, 0, 1,
-1.055456, 0.5232857, 0.1644535, 1, 0.9607843, 0, 1,
-1.055402, -0.4787637, -1.963396, 1, 0.9647059, 0, 1,
-1.053166, 0.2819223, -1.17928, 1, 0.972549, 0, 1,
-1.052935, 1.077218, -0.1710489, 1, 0.9764706, 0, 1,
-1.051343, 1.073694, -1.29369, 1, 0.9843137, 0, 1,
-1.037595, -1.813812, -4.404762, 1, 0.9882353, 0, 1,
-1.033302, -0.5210685, -1.899213, 1, 0.9960784, 0, 1,
-1.030152, -1.11752, -3.019024, 0.9960784, 1, 0, 1,
-1.025483, 1.196489, -1.968734, 0.9921569, 1, 0, 1,
-1.00242, -0.2090888, -1.288671, 0.9843137, 1, 0, 1,
-0.9969725, -0.579624, -2.481611, 0.9803922, 1, 0, 1,
-0.9964879, 1.467779, -1.843625, 0.972549, 1, 0, 1,
-0.9936869, -2.37669, -3.424836, 0.9686275, 1, 0, 1,
-0.985623, 1.28097, 0.6062084, 0.9607843, 1, 0, 1,
-0.9845605, -0.4339674, -1.333517, 0.9568627, 1, 0, 1,
-0.9751232, -0.0174753, -3.380919, 0.9490196, 1, 0, 1,
-0.9748485, -2.871285, -2.470674, 0.945098, 1, 0, 1,
-0.9742362, -0.9044216, -0.3139272, 0.9372549, 1, 0, 1,
-0.9590632, -0.1353433, -2.119397, 0.9333333, 1, 0, 1,
-0.9506726, 1.241873, 0.01230598, 0.9254902, 1, 0, 1,
-0.9460406, -0.1996282, 0.1637376, 0.9215686, 1, 0, 1,
-0.9431226, -0.05888988, -1.485239, 0.9137255, 1, 0, 1,
-0.9422265, -0.4999592, -2.805283, 0.9098039, 1, 0, 1,
-0.9330652, 1.388827, -0.9649519, 0.9019608, 1, 0, 1,
-0.9276462, 0.3945882, -0.1721695, 0.8941177, 1, 0, 1,
-0.9275265, -0.4138909, -2.287147, 0.8901961, 1, 0, 1,
-0.9270123, 0.9741119, -0.9297899, 0.8823529, 1, 0, 1,
-0.9243547, 0.2819518, -2.12983, 0.8784314, 1, 0, 1,
-0.9240342, -1.546105, -2.289568, 0.8705882, 1, 0, 1,
-0.92168, 1.076449, 0.3011039, 0.8666667, 1, 0, 1,
-0.9192396, 0.7987287, -0.9987295, 0.8588235, 1, 0, 1,
-0.9162975, 1.371745, -0.7481821, 0.854902, 1, 0, 1,
-0.9097899, -1.542224, -1.565126, 0.8470588, 1, 0, 1,
-0.9049967, 0.7680909, 0.03716826, 0.8431373, 1, 0, 1,
-0.904129, -1.716205, -2.313412, 0.8352941, 1, 0, 1,
-0.898985, -0.1556142, -1.442484, 0.8313726, 1, 0, 1,
-0.8924855, 0.05050253, -2.451174, 0.8235294, 1, 0, 1,
-0.8906, -0.07567474, -0.6510252, 0.8196079, 1, 0, 1,
-0.8890366, 1.013262, -1.010327, 0.8117647, 1, 0, 1,
-0.8843201, 0.9510055, -0.1827942, 0.8078431, 1, 0, 1,
-0.8770355, -0.3405017, -0.3007295, 0.8, 1, 0, 1,
-0.8757817, 0.6823282, 0.3414158, 0.7921569, 1, 0, 1,
-0.8749071, 0.2191366, 0.4210664, 0.7882353, 1, 0, 1,
-0.8726768, -0.7385821, -3.426266, 0.7803922, 1, 0, 1,
-0.862422, 0.9195281, 2.302487, 0.7764706, 1, 0, 1,
-0.858225, 2.232149, 0.2401785, 0.7686275, 1, 0, 1,
-0.8569836, 0.02997409, -2.045386, 0.7647059, 1, 0, 1,
-0.847873, 0.6034455, -2.004259, 0.7568628, 1, 0, 1,
-0.8440681, -0.07317522, -1.108677, 0.7529412, 1, 0, 1,
-0.8437147, 0.1280126, -1.847669, 0.7450981, 1, 0, 1,
-0.8402079, 1.0169, 0.6433047, 0.7411765, 1, 0, 1,
-0.837027, -0.3744645, -2.285781, 0.7333333, 1, 0, 1,
-0.8351696, -0.6249273, -1.664822, 0.7294118, 1, 0, 1,
-0.8345801, -0.2650298, -0.768022, 0.7215686, 1, 0, 1,
-0.8343477, 0.4018084, -2.591528, 0.7176471, 1, 0, 1,
-0.834154, -0.8210222, -1.574192, 0.7098039, 1, 0, 1,
-0.8335518, -1.430935, -3.152886, 0.7058824, 1, 0, 1,
-0.8279554, 1.52708, 0.4605049, 0.6980392, 1, 0, 1,
-0.8271307, -0.3743311, -1.641222, 0.6901961, 1, 0, 1,
-0.8195912, -0.2364558, -2.239128, 0.6862745, 1, 0, 1,
-0.8174239, 0.1318997, -1.644784, 0.6784314, 1, 0, 1,
-0.8161626, -1.735021, -2.812337, 0.6745098, 1, 0, 1,
-0.8068568, 0.06461454, -1.348184, 0.6666667, 1, 0, 1,
-0.8067391, -0.04347638, -3.320653, 0.6627451, 1, 0, 1,
-0.8043013, 0.9478254, -0.7382969, 0.654902, 1, 0, 1,
-0.7953885, 1.579373, -1.112118, 0.6509804, 1, 0, 1,
-0.7909388, 0.2273578, -1.590156, 0.6431373, 1, 0, 1,
-0.7908416, -0.01758141, -2.452085, 0.6392157, 1, 0, 1,
-0.788114, -1.041978, -0.8272518, 0.6313726, 1, 0, 1,
-0.7813661, -0.4510722, -1.206582, 0.627451, 1, 0, 1,
-0.7724389, -0.07221889, -0.1406268, 0.6196079, 1, 0, 1,
-0.7724237, 0.1176326, -2.177719, 0.6156863, 1, 0, 1,
-0.7697871, 0.7861344, 0.8579738, 0.6078432, 1, 0, 1,
-0.7683586, 0.1449138, -0.940179, 0.6039216, 1, 0, 1,
-0.763683, 0.7901964, -1.998359, 0.5960785, 1, 0, 1,
-0.7631578, -1.025782, -3.549296, 0.5882353, 1, 0, 1,
-0.7620499, -0.1107863, -4.050846, 0.5843138, 1, 0, 1,
-0.7611431, 0.3863177, -0.4896477, 0.5764706, 1, 0, 1,
-0.7608806, -0.6288069, -1.848929, 0.572549, 1, 0, 1,
-0.7547224, 1.126027, -3.07522e-05, 0.5647059, 1, 0, 1,
-0.7531002, -0.3705772, -2.514727, 0.5607843, 1, 0, 1,
-0.7377359, -0.4677284, -2.688344, 0.5529412, 1, 0, 1,
-0.7367135, 0.6288024, -0.812598, 0.5490196, 1, 0, 1,
-0.7357481, -0.7288606, -1.911218, 0.5411765, 1, 0, 1,
-0.7345744, -1.091143, -3.733979, 0.5372549, 1, 0, 1,
-0.7332522, -0.1921772, -1.797777, 0.5294118, 1, 0, 1,
-0.7215042, 1.834831, -0.9559643, 0.5254902, 1, 0, 1,
-0.7207003, -0.8284872, -1.649538, 0.5176471, 1, 0, 1,
-0.7174333, -0.2234159, -0.7921587, 0.5137255, 1, 0, 1,
-0.7162814, -1.06316, -2.547454, 0.5058824, 1, 0, 1,
-0.7131963, -1.849888, -2.685637, 0.5019608, 1, 0, 1,
-0.7064981, -0.3085553, 0.4109491, 0.4941176, 1, 0, 1,
-0.7019877, -1.386434, -0.9703924, 0.4862745, 1, 0, 1,
-0.6997761, -1.259844, -2.434954, 0.4823529, 1, 0, 1,
-0.6982729, -1.349115, -2.925347, 0.4745098, 1, 0, 1,
-0.6930276, 1.328444, 0.6998775, 0.4705882, 1, 0, 1,
-0.6855179, 0.7048119, -0.55739, 0.4627451, 1, 0, 1,
-0.6854866, 1.264879, -0.07663798, 0.4588235, 1, 0, 1,
-0.6844849, 1.073146, -2.640378, 0.4509804, 1, 0, 1,
-0.6829286, -0.1720936, -1.364069, 0.4470588, 1, 0, 1,
-0.6791448, 0.4196286, -0.299044, 0.4392157, 1, 0, 1,
-0.6748853, 0.3058174, -0.2861405, 0.4352941, 1, 0, 1,
-0.6718962, 0.08500052, 0.3547767, 0.427451, 1, 0, 1,
-0.668476, 0.3239595, -1.27117, 0.4235294, 1, 0, 1,
-0.6645142, -0.4718539, -2.033086, 0.4156863, 1, 0, 1,
-0.6551544, 1.1502, -0.342351, 0.4117647, 1, 0, 1,
-0.6499615, -0.8927613, -2.404299, 0.4039216, 1, 0, 1,
-0.6413254, -0.05405696, -1.707942, 0.3960784, 1, 0, 1,
-0.6407596, -1.068258, -3.728927, 0.3921569, 1, 0, 1,
-0.6352689, 0.2176453, -1.86035, 0.3843137, 1, 0, 1,
-0.6322442, 1.75221, 0.636223, 0.3803922, 1, 0, 1,
-0.6291646, -0.9325686, -2.654727, 0.372549, 1, 0, 1,
-0.6279505, -0.8970225, -1.65602, 0.3686275, 1, 0, 1,
-0.6243808, -1.133026, -0.6233583, 0.3607843, 1, 0, 1,
-0.6237276, -0.0007598718, -1.662534, 0.3568628, 1, 0, 1,
-0.6226146, 0.3286374, -1.589066, 0.3490196, 1, 0, 1,
-0.6187946, 0.6355363, -0.0497662, 0.345098, 1, 0, 1,
-0.6124316, 0.4105521, -0.1254961, 0.3372549, 1, 0, 1,
-0.6095755, -1.276196, -2.992801, 0.3333333, 1, 0, 1,
-0.6077728, 0.4247692, -0.9620897, 0.3254902, 1, 0, 1,
-0.6009637, 0.6829644, -0.5462527, 0.3215686, 1, 0, 1,
-0.5986425, 0.1403198, -3.288063, 0.3137255, 1, 0, 1,
-0.5968761, -0.3402958, -4.67325, 0.3098039, 1, 0, 1,
-0.5945168, -1.009339, -3.114318, 0.3019608, 1, 0, 1,
-0.5923798, -0.9939244, -3.354545, 0.2941177, 1, 0, 1,
-0.5896643, -1.156183, -3.205452, 0.2901961, 1, 0, 1,
-0.5890785, -0.6711563, -3.025573, 0.282353, 1, 0, 1,
-0.5821619, 1.096065, -1.827805, 0.2784314, 1, 0, 1,
-0.5800076, -0.2337596, -1.456378, 0.2705882, 1, 0, 1,
-0.5792822, 1.344862, 0.1165791, 0.2666667, 1, 0, 1,
-0.5716327, -0.2371354, -2.046492, 0.2588235, 1, 0, 1,
-0.5572336, -0.2434993, -2.386759, 0.254902, 1, 0, 1,
-0.5514734, -0.211128, -1.512708, 0.2470588, 1, 0, 1,
-0.5492645, 0.521293, -3.267279, 0.2431373, 1, 0, 1,
-0.5466475, -0.2733642, -0.3597449, 0.2352941, 1, 0, 1,
-0.5444789, 0.2682284, -0.5166717, 0.2313726, 1, 0, 1,
-0.5402461, 1.391828, 0.7580041, 0.2235294, 1, 0, 1,
-0.5378119, -0.3363618, -3.443727, 0.2196078, 1, 0, 1,
-0.5360376, 0.9204985, -0.7839803, 0.2117647, 1, 0, 1,
-0.5352046, 0.3808806, -0.8203168, 0.2078431, 1, 0, 1,
-0.5350723, -0.9547496, -1.993169, 0.2, 1, 0, 1,
-0.5283899, -0.07820712, -3.292499, 0.1921569, 1, 0, 1,
-0.5269902, -0.08943891, -1.195888, 0.1882353, 1, 0, 1,
-0.5254599, -1.687516, -4.787007, 0.1803922, 1, 0, 1,
-0.5251941, -0.2343623, -3.588876, 0.1764706, 1, 0, 1,
-0.5251091, 0.9328908, -0.8976688, 0.1686275, 1, 0, 1,
-0.5229981, -0.450921, -3.546211, 0.1647059, 1, 0, 1,
-0.5229765, 0.8629832, -1.226653, 0.1568628, 1, 0, 1,
-0.5194495, 0.7061726, 0.2677276, 0.1529412, 1, 0, 1,
-0.5167761, 0.1836816, -1.819813, 0.145098, 1, 0, 1,
-0.5166873, -0.3748555, -1.192805, 0.1411765, 1, 0, 1,
-0.5166838, -0.5290862, -2.128137, 0.1333333, 1, 0, 1,
-0.5127711, -0.3037517, -0.7159863, 0.1294118, 1, 0, 1,
-0.5113173, 0.5317371, -0.4863048, 0.1215686, 1, 0, 1,
-0.5099869, -0.7994323, -2.972917, 0.1176471, 1, 0, 1,
-0.5072996, -1.255425, -4.153687, 0.1098039, 1, 0, 1,
-0.5012309, 1.393979, 0.0008406204, 0.1058824, 1, 0, 1,
-0.4991543, -0.6956167, -3.092456, 0.09803922, 1, 0, 1,
-0.4944313, 1.988959, -0.2859286, 0.09019608, 1, 0, 1,
-0.4920028, 0.4976288, 0.1363692, 0.08627451, 1, 0, 1,
-0.4904772, 0.3025409, -1.33581, 0.07843138, 1, 0, 1,
-0.4903426, -1.438543, -4.761179, 0.07450981, 1, 0, 1,
-0.4903142, -0.3386861, -2.158064, 0.06666667, 1, 0, 1,
-0.4898961, 0.6149119, -1.221905, 0.0627451, 1, 0, 1,
-0.4892562, 1.586378, -1.708486, 0.05490196, 1, 0, 1,
-0.4876442, -1.197082, -2.792009, 0.05098039, 1, 0, 1,
-0.4870477, 0.4934019, -0.5832954, 0.04313726, 1, 0, 1,
-0.4867449, 1.083661, -1.618045, 0.03921569, 1, 0, 1,
-0.4862091, 0.2988327, -1.382429, 0.03137255, 1, 0, 1,
-0.4856932, -0.5142589, -2.540181, 0.02745098, 1, 0, 1,
-0.4832138, -1.416607, -2.741087, 0.01960784, 1, 0, 1,
-0.4831141, 0.5011067, -0.5463085, 0.01568628, 1, 0, 1,
-0.4815369, 0.74866, 0.8023301, 0.007843138, 1, 0, 1,
-0.4801815, -0.390557, -1.808374, 0.003921569, 1, 0, 1,
-0.4793322, -0.9435912, -1.179263, 0, 1, 0.003921569, 1,
-0.4782704, -0.9910552, -2.918884, 0, 1, 0.01176471, 1,
-0.4741175, 0.6863505, -0.3337218, 0, 1, 0.01568628, 1,
-0.4734313, -0.5223963, -2.130517, 0, 1, 0.02352941, 1,
-0.4724782, 0.5107733, -1.343785, 0, 1, 0.02745098, 1,
-0.471735, -0.4281614, -1.425834, 0, 1, 0.03529412, 1,
-0.4683982, 1.234269, -1.483567, 0, 1, 0.03921569, 1,
-0.4603108, 1.200686, -0.05662218, 0, 1, 0.04705882, 1,
-0.4590867, 2.404241, -0.3828864, 0, 1, 0.05098039, 1,
-0.4461558, 0.6959583, 0.331101, 0, 1, 0.05882353, 1,
-0.4444568, -0.6038966, -2.620964, 0, 1, 0.0627451, 1,
-0.442566, -0.9160997, -1.720115, 0, 1, 0.07058824, 1,
-0.4415627, -0.1505529, -1.48046, 0, 1, 0.07450981, 1,
-0.4390953, 0.2030996, -0.765373, 0, 1, 0.08235294, 1,
-0.4369071, -0.08023915, -2.1782, 0, 1, 0.08627451, 1,
-0.4347468, -0.89599, -0.2351897, 0, 1, 0.09411765, 1,
-0.42932, 1.43341, -0.06328431, 0, 1, 0.1019608, 1,
-0.428608, 0.8678584, 0.1259278, 0, 1, 0.1058824, 1,
-0.4240889, 0.9555659, -0.8313794, 0, 1, 0.1137255, 1,
-0.4221329, 0.3768097, -1.040289, 0, 1, 0.1176471, 1,
-0.4181667, 0.3595353, -0.3100913, 0, 1, 0.1254902, 1,
-0.4100232, -0.942737, -4.519876, 0, 1, 0.1294118, 1,
-0.4069168, 0.06300604, -1.044425, 0, 1, 0.1372549, 1,
-0.4066963, -0.5170647, -1.710411, 0, 1, 0.1411765, 1,
-0.4015515, 0.9706395, -0.8872129, 0, 1, 0.1490196, 1,
-0.4007781, -0.129198, -1.284113, 0, 1, 0.1529412, 1,
-0.3999705, 1.007353, 1.619497, 0, 1, 0.1607843, 1,
-0.3907419, -0.5762445, -2.15361, 0, 1, 0.1647059, 1,
-0.3864775, -1.094195, -2.656623, 0, 1, 0.172549, 1,
-0.38501, -1.580285, -4.199822, 0, 1, 0.1764706, 1,
-0.3809076, 1.82593, -0.712375, 0, 1, 0.1843137, 1,
-0.3803942, 0.8733924, -1.468552, 0, 1, 0.1882353, 1,
-0.3776751, -0.6045036, -0.6210593, 0, 1, 0.1960784, 1,
-0.3736697, 0.3275594, -0.6704346, 0, 1, 0.2039216, 1,
-0.3698679, 0.1312657, -1.580908, 0, 1, 0.2078431, 1,
-0.3670087, -0.8523763, -2.371906, 0, 1, 0.2156863, 1,
-0.3665697, -0.5185159, -2.155719, 0, 1, 0.2196078, 1,
-0.3658818, 0.1894775, -3.314494, 0, 1, 0.227451, 1,
-0.365687, 0.2660394, -2.962135, 0, 1, 0.2313726, 1,
-0.3641933, 0.7493821, 0.1921888, 0, 1, 0.2392157, 1,
-0.3635175, -1.41445, -3.234483, 0, 1, 0.2431373, 1,
-0.3628891, -1.715496, -2.514747, 0, 1, 0.2509804, 1,
-0.3617234, 1.254464, -1.174935, 0, 1, 0.254902, 1,
-0.3616269, -0.001898504, -1.355031, 0, 1, 0.2627451, 1,
-0.3614021, 0.09575985, -0.8019359, 0, 1, 0.2666667, 1,
-0.3572246, -1.669319, -2.854894, 0, 1, 0.2745098, 1,
-0.3505637, -1.578081, -2.836642, 0, 1, 0.2784314, 1,
-0.350077, 1.124958, 0.2760336, 0, 1, 0.2862745, 1,
-0.3499204, 1.169538, -0.06113015, 0, 1, 0.2901961, 1,
-0.3488749, 0.1680993, -1.771436, 0, 1, 0.2980392, 1,
-0.3464239, 0.1288944, -1.397863, 0, 1, 0.3058824, 1,
-0.3463528, 0.766336, 1.106826, 0, 1, 0.3098039, 1,
-0.3452051, 0.1583741, -1.382145, 0, 1, 0.3176471, 1,
-0.3448699, 0.1859705, 0.413917, 0, 1, 0.3215686, 1,
-0.3432011, 0.1561969, -2.229379, 0, 1, 0.3294118, 1,
-0.3424251, -0.3775641, -2.664634, 0, 1, 0.3333333, 1,
-0.3418637, 1.358129, 1.226775, 0, 1, 0.3411765, 1,
-0.3393106, -0.1830691, -2.482568, 0, 1, 0.345098, 1,
-0.3372209, -1.76145, -2.569065, 0, 1, 0.3529412, 1,
-0.3333857, 1.553148, -0.1672753, 0, 1, 0.3568628, 1,
-0.3330604, 0.27008, -0.7802289, 0, 1, 0.3647059, 1,
-0.3284981, 1.783092, -0.5692146, 0, 1, 0.3686275, 1,
-0.3206033, 0.1810094, -1.648401, 0, 1, 0.3764706, 1,
-0.309019, -0.1564887, -1.891456, 0, 1, 0.3803922, 1,
-0.3074397, -0.7808623, -4.601021, 0, 1, 0.3882353, 1,
-0.3049866, 0.4230348, -0.8345196, 0, 1, 0.3921569, 1,
-0.3005984, 0.2169897, -0.5341669, 0, 1, 0.4, 1,
-0.2986662, 1.116132, 0.7172204, 0, 1, 0.4078431, 1,
-0.2966482, 0.112416, -2.257425, 0, 1, 0.4117647, 1,
-0.2935311, 2.075841, -0.1336667, 0, 1, 0.4196078, 1,
-0.2908387, 3.151091, -0.589187, 0, 1, 0.4235294, 1,
-0.288547, 1.149331, -0.2381952, 0, 1, 0.4313726, 1,
-0.2855625, 2.04241, -0.2498021, 0, 1, 0.4352941, 1,
-0.2850425, -1.151474, -1.579031, 0, 1, 0.4431373, 1,
-0.2841976, 1.108644, 0.2197029, 0, 1, 0.4470588, 1,
-0.2800663, -0.8790841, -4.602716, 0, 1, 0.454902, 1,
-0.2798017, 0.006796779, -2.551431, 0, 1, 0.4588235, 1,
-0.2766317, -0.09169007, -1.850224, 0, 1, 0.4666667, 1,
-0.2669463, -1.389033, -4.578881, 0, 1, 0.4705882, 1,
-0.2553236, -0.6089875, -3.42749, 0, 1, 0.4784314, 1,
-0.2542459, 1.233121, -0.5679059, 0, 1, 0.4823529, 1,
-0.2483777, -0.304932, -2.501009, 0, 1, 0.4901961, 1,
-0.246911, -0.9252158, -4.202016, 0, 1, 0.4941176, 1,
-0.2434279, 0.6048254, 1.616801, 0, 1, 0.5019608, 1,
-0.2419801, 0.04656269, -2.172094, 0, 1, 0.509804, 1,
-0.2403079, 0.07032013, -3.048931, 0, 1, 0.5137255, 1,
-0.2368891, -1.322633, -2.837099, 0, 1, 0.5215687, 1,
-0.2367298, 1.458823, -1.360817, 0, 1, 0.5254902, 1,
-0.2337952, -1.190292, -3.956843, 0, 1, 0.5333334, 1,
-0.2150998, 0.318755, 2.771949, 0, 1, 0.5372549, 1,
-0.2137008, 0.3036097, -0.9644451, 0, 1, 0.5450981, 1,
-0.206922, -1.23955, -1.790387, 0, 1, 0.5490196, 1,
-0.2036873, -0.8379201, -3.743555, 0, 1, 0.5568628, 1,
-0.2025367, -1.084538, -3.30927, 0, 1, 0.5607843, 1,
-0.2012864, -1.343685, -4.439137, 0, 1, 0.5686275, 1,
-0.1993818, -0.4016187, -1.551732, 0, 1, 0.572549, 1,
-0.1982127, -0.2444006, -2.126205, 0, 1, 0.5803922, 1,
-0.1978717, -1.346687, -1.982377, 0, 1, 0.5843138, 1,
-0.193054, -0.03958154, -2.24509, 0, 1, 0.5921569, 1,
-0.1875613, 0.2063311, -0.8072343, 0, 1, 0.5960785, 1,
-0.1837787, -0.3306158, 0.114778, 0, 1, 0.6039216, 1,
-0.1836924, 1.809053, 0.06487519, 0, 1, 0.6117647, 1,
-0.1814569, -1.559253, -1.11622, 0, 1, 0.6156863, 1,
-0.1773874, -1.466981, -2.873925, 0, 1, 0.6235294, 1,
-0.1760169, 0.1803804, -1.201779, 0, 1, 0.627451, 1,
-0.174662, 0.9417995, -1.151017, 0, 1, 0.6352941, 1,
-0.1736659, 1.262663, 0.08260486, 0, 1, 0.6392157, 1,
-0.1677349, -0.4870483, -1.755339, 0, 1, 0.6470588, 1,
-0.1639919, -0.8666048, -2.031206, 0, 1, 0.6509804, 1,
-0.1594461, -0.1587706, -2.212553, 0, 1, 0.6588235, 1,
-0.1572906, -0.1978049, -0.6793802, 0, 1, 0.6627451, 1,
-0.1563758, -1.54665, -2.037841, 0, 1, 0.6705883, 1,
-0.1550239, -1.598397, -4.133343, 0, 1, 0.6745098, 1,
-0.1532441, -0.339072, -4.066793, 0, 1, 0.682353, 1,
-0.1520384, 0.3594097, 0.4741957, 0, 1, 0.6862745, 1,
-0.1465309, 0.02250422, -0.6830094, 0, 1, 0.6941177, 1,
-0.1440467, -0.5659315, -1.922265, 0, 1, 0.7019608, 1,
-0.1436955, -1.078922, -2.914135, 0, 1, 0.7058824, 1,
-0.1436182, -0.7084257, -1.245875, 0, 1, 0.7137255, 1,
-0.1426425, -0.3407733, -3.545085, 0, 1, 0.7176471, 1,
-0.140784, 1.063823, 0.2275662, 0, 1, 0.7254902, 1,
-0.1403406, -0.01947937, -2.21018, 0, 1, 0.7294118, 1,
-0.1357027, -0.6082646, -2.445671, 0, 1, 0.7372549, 1,
-0.1356235, -1.552714, -3.282144, 0, 1, 0.7411765, 1,
-0.1354121, -0.04304977, -3.171399, 0, 1, 0.7490196, 1,
-0.1319628, 1.306592, -1.069446, 0, 1, 0.7529412, 1,
-0.1310517, -1.226517, -2.60457, 0, 1, 0.7607843, 1,
-0.1292456, -0.4176386, -1.860629, 0, 1, 0.7647059, 1,
-0.126346, -0.002713225, -2.956292, 0, 1, 0.772549, 1,
-0.1248283, 0.3250944, -0.9697931, 0, 1, 0.7764706, 1,
-0.1238346, 0.3875675, -0.1694606, 0, 1, 0.7843137, 1,
-0.1230654, -0.03061561, -0.8641373, 0, 1, 0.7882353, 1,
-0.1221844, 0.3685398, 0.1584087, 0, 1, 0.7960784, 1,
-0.1204409, 0.7758722, 0.2652286, 0, 1, 0.8039216, 1,
-0.1170931, -1.361016, -3.919576, 0, 1, 0.8078431, 1,
-0.1144356, -0.1539882, -3.063628, 0, 1, 0.8156863, 1,
-0.1099814, -2.119, -3.001033, 0, 1, 0.8196079, 1,
-0.1097471, 0.08427756, -2.527418, 0, 1, 0.827451, 1,
-0.1096143, 0.1459508, -1.09699, 0, 1, 0.8313726, 1,
-0.1037727, -0.5850806, -3.636953, 0, 1, 0.8392157, 1,
-0.1009435, -1.591567, -2.432312, 0, 1, 0.8431373, 1,
-0.0966456, 0.4102303, -0.7376676, 0, 1, 0.8509804, 1,
-0.09371551, -1.297167, -4.124823, 0, 1, 0.854902, 1,
-0.09347537, 1.458239, -1.005258, 0, 1, 0.8627451, 1,
-0.09326158, 0.01544732, -3.75547, 0, 1, 0.8666667, 1,
-0.09191718, 0.3961357, 1.477393, 0, 1, 0.8745098, 1,
-0.09053635, -0.1310415, -2.267831, 0, 1, 0.8784314, 1,
-0.08901989, 0.1803816, -0.8525366, 0, 1, 0.8862745, 1,
-0.08530314, -0.3005091, -0.7346739, 0, 1, 0.8901961, 1,
-0.08460373, 1.839137, -0.01044633, 0, 1, 0.8980392, 1,
-0.08321887, 0.3189311, -0.2960684, 0, 1, 0.9058824, 1,
-0.08058863, -0.5888444, -2.934774, 0, 1, 0.9098039, 1,
-0.08032443, 0.3670668, -0.5886877, 0, 1, 0.9176471, 1,
-0.0785458, -1.866113, -4.651262, 0, 1, 0.9215686, 1,
-0.07744704, -0.7348068, -1.349296, 0, 1, 0.9294118, 1,
-0.07313638, -0.05020958, -2.221245, 0, 1, 0.9333333, 1,
-0.07245775, 0.7659782, 0.5557055, 0, 1, 0.9411765, 1,
-0.06574488, -0.3496943, -1.438637, 0, 1, 0.945098, 1,
-0.06557869, 0.8962488, 0.246609, 0, 1, 0.9529412, 1,
-0.06479164, -1.841177, -2.767121, 0, 1, 0.9568627, 1,
-0.0631241, -0.7922177, -1.263521, 0, 1, 0.9647059, 1,
-0.06221465, -0.1753486, -4.273584, 0, 1, 0.9686275, 1,
-0.06171529, 1.47759, -0.1352925, 0, 1, 0.9764706, 1,
-0.06147218, 0.4654067, -1.457874, 0, 1, 0.9803922, 1,
-0.06102308, 0.09085158, -0.2558496, 0, 1, 0.9882353, 1,
-0.05964684, -1.57978, -3.976796, 0, 1, 0.9921569, 1,
-0.0568103, 0.6859382, -2.651654, 0, 1, 1, 1,
-0.05644643, -0.8296167, -3.043287, 0, 0.9921569, 1, 1,
-0.05558439, -1.040808, -4.528657, 0, 0.9882353, 1, 1,
-0.05152383, 0.2392039, 1.513985, 0, 0.9803922, 1, 1,
-0.05027342, 0.3568071, 1.070338, 0, 0.9764706, 1, 1,
-0.05024297, 1.800386, 1.310181, 0, 0.9686275, 1, 1,
-0.04958588, 0.7909248, -0.07318111, 0, 0.9647059, 1, 1,
-0.04684805, 1.483918, -2.0748, 0, 0.9568627, 1, 1,
-0.04080618, -1.390938, -4.785733, 0, 0.9529412, 1, 1,
-0.04027718, 0.7440634, 0.4228637, 0, 0.945098, 1, 1,
-0.03978711, 0.136184, 0.5064358, 0, 0.9411765, 1, 1,
-0.03925201, 0.4641032, -1.156812, 0, 0.9333333, 1, 1,
-0.03832866, -0.8578894, -3.33289, 0, 0.9294118, 1, 1,
-0.03539999, -1.180743, -1.066331, 0, 0.9215686, 1, 1,
-0.03519278, -1.047384, -4.853132, 0, 0.9176471, 1, 1,
-0.03513598, 0.6040722, -1.19244, 0, 0.9098039, 1, 1,
-0.03403084, -2.406998, -2.453178, 0, 0.9058824, 1, 1,
-0.0328598, -1.32887, -3.543493, 0, 0.8980392, 1, 1,
-0.03005511, -0.7058345, -5.370148, 0, 0.8901961, 1, 1,
-0.02824519, -0.2557847, -1.566331, 0, 0.8862745, 1, 1,
-0.02667311, 0.07953314, 0.7827184, 0, 0.8784314, 1, 1,
-0.0177369, -0.9942484, -3.916276, 0, 0.8745098, 1, 1,
-0.01223921, -1.176298, -5.362005, 0, 0.8666667, 1, 1,
-0.009801944, 0.2349564, 1.895211, 0, 0.8627451, 1, 1,
-0.00919289, 1.130601, 1.133916, 0, 0.854902, 1, 1,
-0.006774248, -0.1875357, -2.13295, 0, 0.8509804, 1, 1,
0.004137626, 0.6051461, -0.225179, 0, 0.8431373, 1, 1,
0.004860307, 0.8228365, -0.8672977, 0, 0.8392157, 1, 1,
0.004945021, -0.405777, 2.964784, 0, 0.8313726, 1, 1,
0.008316958, 0.4428445, 0.4228328, 0, 0.827451, 1, 1,
0.01081238, 0.7076235, -0.08111107, 0, 0.8196079, 1, 1,
0.0120986, 0.2790391, -0.9025785, 0, 0.8156863, 1, 1,
0.01507457, -0.1067939, 4.44869, 0, 0.8078431, 1, 1,
0.01561597, 0.1150289, -0.1783805, 0, 0.8039216, 1, 1,
0.01963775, 0.9802244, 0.06153885, 0, 0.7960784, 1, 1,
0.01965196, -1.292358, 5.611644, 0, 0.7882353, 1, 1,
0.02167955, 1.967021, 1.382044, 0, 0.7843137, 1, 1,
0.02989143, 0.7194995, 0.3073608, 0, 0.7764706, 1, 1,
0.03735128, 0.03799399, 0.3581322, 0, 0.772549, 1, 1,
0.03797395, -0.6090994, 1.331919, 0, 0.7647059, 1, 1,
0.04720967, -3.143675, 4.0653, 0, 0.7607843, 1, 1,
0.04814534, -0.9523292, 0.8774692, 0, 0.7529412, 1, 1,
0.04912497, -2.077325, 1.466881, 0, 0.7490196, 1, 1,
0.04923288, 0.1618272, 0.2143939, 0, 0.7411765, 1, 1,
0.04946442, -1.335169, 2.074379, 0, 0.7372549, 1, 1,
0.05113148, -1.254104, 4.07227, 0, 0.7294118, 1, 1,
0.05489833, -1.09018, 3.344663, 0, 0.7254902, 1, 1,
0.0630354, -0.6852941, 2.794466, 0, 0.7176471, 1, 1,
0.06359335, -0.3393603, 2.146012, 0, 0.7137255, 1, 1,
0.0651112, -1.277895, 3.121257, 0, 0.7058824, 1, 1,
0.06784017, 0.9198624, -0.8078479, 0, 0.6980392, 1, 1,
0.07276416, -0.7420084, 3.889414, 0, 0.6941177, 1, 1,
0.07369151, 0.5718469, 1.607015, 0, 0.6862745, 1, 1,
0.07427435, 0.1154857, -1.008619, 0, 0.682353, 1, 1,
0.07603336, -1.929769, 0.9643728, 0, 0.6745098, 1, 1,
0.07671279, -1.151066, 4.928341, 0, 0.6705883, 1, 1,
0.07810631, -1.44869, 3.722996, 0, 0.6627451, 1, 1,
0.07969932, -0.5563526, 3.75283, 0, 0.6588235, 1, 1,
0.08025128, 0.7043205, -0.9674211, 0, 0.6509804, 1, 1,
0.08157282, 0.2748566, 1.123207, 0, 0.6470588, 1, 1,
0.08284103, -0.06517341, 1.826178, 0, 0.6392157, 1, 1,
0.0830553, 1.126839, -1.25087, 0, 0.6352941, 1, 1,
0.08458742, -0.2009642, 2.235804, 0, 0.627451, 1, 1,
0.08746241, -1.267458, 2.963142, 0, 0.6235294, 1, 1,
0.09212613, 0.08780672, -0.1092359, 0, 0.6156863, 1, 1,
0.09230843, -0.9665855, 0.1658127, 0, 0.6117647, 1, 1,
0.09328517, 0.6396984, 0.4274758, 0, 0.6039216, 1, 1,
0.09584259, -0.8409368, 3.919367, 0, 0.5960785, 1, 1,
0.09961394, -0.6352343, 4.074475, 0, 0.5921569, 1, 1,
0.1039924, 1.342735, -1.186901, 0, 0.5843138, 1, 1,
0.1046353, -1.156657, 1.165961, 0, 0.5803922, 1, 1,
0.1055126, 1.335094, -0.5338177, 0, 0.572549, 1, 1,
0.1055819, 0.1619233, -0.426508, 0, 0.5686275, 1, 1,
0.1092261, -0.7005129, 2.717806, 0, 0.5607843, 1, 1,
0.1139196, -1.302436, 2.081089, 0, 0.5568628, 1, 1,
0.1166036, 0.8041494, 1.647139, 0, 0.5490196, 1, 1,
0.1181891, -2.03807, 3.53688, 0, 0.5450981, 1, 1,
0.1189148, -1.386221, 4.581383, 0, 0.5372549, 1, 1,
0.1251732, 0.1808938, 0.8691119, 0, 0.5333334, 1, 1,
0.1283384, -1.422574, 3.943378, 0, 0.5254902, 1, 1,
0.1320283, 1.528886, 1.365198, 0, 0.5215687, 1, 1,
0.1326426, 0.7202033, 0.3151653, 0, 0.5137255, 1, 1,
0.1362704, -1.022726, 2.311287, 0, 0.509804, 1, 1,
0.1393905, 0.7614071, 0.7306986, 0, 0.5019608, 1, 1,
0.1398955, 0.4039763, -0.5723453, 0, 0.4941176, 1, 1,
0.1409678, -0.4237309, 2.347397, 0, 0.4901961, 1, 1,
0.1421294, -1.893206, 0.9107745, 0, 0.4823529, 1, 1,
0.1439188, 0.05887566, 0.8586728, 0, 0.4784314, 1, 1,
0.1448116, 0.6659512, -0.09676541, 0, 0.4705882, 1, 1,
0.148618, -2.8141, 2.435329, 0, 0.4666667, 1, 1,
0.1500757, 1.21364, -0.8921233, 0, 0.4588235, 1, 1,
0.1532852, 0.2512648, 1.470359, 0, 0.454902, 1, 1,
0.1545554, 1.035123, 1.434967, 0, 0.4470588, 1, 1,
0.1581133, -0.1268717, 2.035178, 0, 0.4431373, 1, 1,
0.1585641, 0.2652611, 0.7496153, 0, 0.4352941, 1, 1,
0.1599792, -0.4673198, 3.885841, 0, 0.4313726, 1, 1,
0.1634399, 1.04469, 1.415926, 0, 0.4235294, 1, 1,
0.1638002, 2.206941, 0.6116478, 0, 0.4196078, 1, 1,
0.1684066, -1.248736, 1.942076, 0, 0.4117647, 1, 1,
0.1711307, -0.2066885, 2.526464, 0, 0.4078431, 1, 1,
0.17515, -0.5095838, 3.933646, 0, 0.4, 1, 1,
0.1754144, -0.4471357, 3.993042, 0, 0.3921569, 1, 1,
0.1773875, 0.05007741, -0.08092324, 0, 0.3882353, 1, 1,
0.1778642, 0.6101361, 0.01920855, 0, 0.3803922, 1, 1,
0.1791724, 0.5004267, 1.036043, 0, 0.3764706, 1, 1,
0.1843487, 0.2119109, 0.1526294, 0, 0.3686275, 1, 1,
0.1891424, -0.5356539, 1.448898, 0, 0.3647059, 1, 1,
0.1996452, -2.27342, 1.763537, 0, 0.3568628, 1, 1,
0.2031722, 2.126776, 0.08112408, 0, 0.3529412, 1, 1,
0.2038495, 1.412576, -0.8923478, 0, 0.345098, 1, 1,
0.2040779, 0.3494746, 0.2923889, 0, 0.3411765, 1, 1,
0.2190954, 0.761893, -1.062644, 0, 0.3333333, 1, 1,
0.2202766, 1.717215, -0.6187256, 0, 0.3294118, 1, 1,
0.222459, -0.1949507, 1.553178, 0, 0.3215686, 1, 1,
0.2240299, -0.2502056, 3.824584, 0, 0.3176471, 1, 1,
0.2256611, -1.223281, 3.746522, 0, 0.3098039, 1, 1,
0.2256663, 0.7219335, 0.4493709, 0, 0.3058824, 1, 1,
0.2260294, 0.8025725, -0.3746685, 0, 0.2980392, 1, 1,
0.2305644, -0.2392403, 1.496111, 0, 0.2901961, 1, 1,
0.2314525, -0.4528229, 1.981405, 0, 0.2862745, 1, 1,
0.2325457, -1.157093, 1.145315, 0, 0.2784314, 1, 1,
0.2392078, -0.3107155, 1.591182, 0, 0.2745098, 1, 1,
0.2433887, 1.554317, 2.09113, 0, 0.2666667, 1, 1,
0.2464994, -0.8768489, 2.922545, 0, 0.2627451, 1, 1,
0.2523852, 1.62755, -0.6067417, 0, 0.254902, 1, 1,
0.2554058, -1.869622, 2.517112, 0, 0.2509804, 1, 1,
0.2557717, 0.1697205, 2.451212, 0, 0.2431373, 1, 1,
0.2635163, 0.3133931, 0.9613134, 0, 0.2392157, 1, 1,
0.2658807, -0.9722404, 4.514719, 0, 0.2313726, 1, 1,
0.2678975, -0.1346194, 0.3621106, 0, 0.227451, 1, 1,
0.2709965, 0.2652183, 0.5024729, 0, 0.2196078, 1, 1,
0.27175, 1.036733, -0.2398484, 0, 0.2156863, 1, 1,
0.2721135, 2.306952, -0.9164782, 0, 0.2078431, 1, 1,
0.2773669, -0.2870754, 2.110477, 0, 0.2039216, 1, 1,
0.2778027, 0.524178, 1.832653, 0, 0.1960784, 1, 1,
0.28035, -1.161528, 2.759643, 0, 0.1882353, 1, 1,
0.2822925, -0.6781012, 2.126721, 0, 0.1843137, 1, 1,
0.2873629, 0.8387352, -0.9063132, 0, 0.1764706, 1, 1,
0.2895404, 1.399154, 1.21986, 0, 0.172549, 1, 1,
0.2935447, -1.208984, 2.270602, 0, 0.1647059, 1, 1,
0.2945501, 0.8753718, 0.571537, 0, 0.1607843, 1, 1,
0.2992773, -0.2176793, 1.485946, 0, 0.1529412, 1, 1,
0.300305, 0.3820684, 1.786278, 0, 0.1490196, 1, 1,
0.3117234, 0.4166217, -1.822515, 0, 0.1411765, 1, 1,
0.3175376, 0.002749966, 3.103219, 0, 0.1372549, 1, 1,
0.3202241, -0.5672329, 2.66869, 0, 0.1294118, 1, 1,
0.3210607, 1.318885, 0.3686896, 0, 0.1254902, 1, 1,
0.321504, -1.19143, 4.940888, 0, 0.1176471, 1, 1,
0.3223838, 1.018041, -0.004848188, 0, 0.1137255, 1, 1,
0.3260173, -0.09064573, 1.616418, 0, 0.1058824, 1, 1,
0.328513, -2.579536, 0.8469313, 0, 0.09803922, 1, 1,
0.3374608, -0.4716116, 1.553142, 0, 0.09411765, 1, 1,
0.3402073, 0.8415945, -1.634693, 0, 0.08627451, 1, 1,
0.3427669, 1.209178, 0.06894789, 0, 0.08235294, 1, 1,
0.3428484, 2.930791, -0.4517406, 0, 0.07450981, 1, 1,
0.3435217, -0.8660352, 3.024888, 0, 0.07058824, 1, 1,
0.3442547, -0.5705731, 3.27491, 0, 0.0627451, 1, 1,
0.3475299, -2.062453, 4.04913, 0, 0.05882353, 1, 1,
0.3508888, -0.2428763, 0.09104209, 0, 0.05098039, 1, 1,
0.352565, 0.4764966, 0.5548849, 0, 0.04705882, 1, 1,
0.3533076, -1.550992, 4.467567, 0, 0.03921569, 1, 1,
0.3623824, -1.311973, 2.851743, 0, 0.03529412, 1, 1,
0.3666788, 0.983515, 0.1879742, 0, 0.02745098, 1, 1,
0.3698974, -0.4250171, 3.342826, 0, 0.02352941, 1, 1,
0.3731548, 0.3099989, 1.692387, 0, 0.01568628, 1, 1,
0.3776299, 0.3737482, 1.341703, 0, 0.01176471, 1, 1,
0.3806021, -0.1520941, 2.215989, 0, 0.003921569, 1, 1,
0.381269, -1.279548, 2.01022, 0.003921569, 0, 1, 1,
0.3814397, -0.7023416, 2.439313, 0.007843138, 0, 1, 1,
0.3837666, -0.03493092, 3.043434, 0.01568628, 0, 1, 1,
0.3858062, -2.599446, 1.227612, 0.01960784, 0, 1, 1,
0.3872309, 0.5482988, 0.5124544, 0.02745098, 0, 1, 1,
0.3882853, 0.3855238, 0.3188534, 0.03137255, 0, 1, 1,
0.4022589, -0.09882309, 2.687505, 0.03921569, 0, 1, 1,
0.4026753, 0.5755478, 0.5602339, 0.04313726, 0, 1, 1,
0.4069735, -0.4491451, 0.8374788, 0.05098039, 0, 1, 1,
0.4115726, 1.128937, 0.4761167, 0.05490196, 0, 1, 1,
0.414169, 1.57088, -1.437475, 0.0627451, 0, 1, 1,
0.4150964, 0.332748, 1.361008, 0.06666667, 0, 1, 1,
0.4160428, -0.1776121, 1.334081, 0.07450981, 0, 1, 1,
0.4166152, -0.8759037, 2.353176, 0.07843138, 0, 1, 1,
0.4166248, -2.226695, 1.623202, 0.08627451, 0, 1, 1,
0.4178441, 0.6890855, -1.041736, 0.09019608, 0, 1, 1,
0.4220766, -0.9633576, 3.083066, 0.09803922, 0, 1, 1,
0.4224058, 0.2335609, 0.4421597, 0.1058824, 0, 1, 1,
0.4282339, 0.5917706, 0.6050322, 0.1098039, 0, 1, 1,
0.4350147, 1.548153, 1.388582, 0.1176471, 0, 1, 1,
0.4371564, 0.4828178, 0.4683848, 0.1215686, 0, 1, 1,
0.4427518, -0.3617404, 1.910463, 0.1294118, 0, 1, 1,
0.4443649, -0.1640266, 1.154176, 0.1333333, 0, 1, 1,
0.4524935, 0.1027802, 1.938409, 0.1411765, 0, 1, 1,
0.4561756, 0.04670532, 0.5267104, 0.145098, 0, 1, 1,
0.458335, -0.3674069, 5.312161, 0.1529412, 0, 1, 1,
0.459249, -1.37231, 3.079083, 0.1568628, 0, 1, 1,
0.4604732, -0.9355122, 3.671723, 0.1647059, 0, 1, 1,
0.4612512, 0.3861466, 1.208659, 0.1686275, 0, 1, 1,
0.4654571, -0.5517353, 1.937729, 0.1764706, 0, 1, 1,
0.4661114, -1.091369, 3.021931, 0.1803922, 0, 1, 1,
0.4662105, -1.028042, 2.276215, 0.1882353, 0, 1, 1,
0.4683081, -0.2791614, 1.177289, 0.1921569, 0, 1, 1,
0.4705932, 0.1740301, 1.284261, 0.2, 0, 1, 1,
0.4831366, 0.2628272, 0.3291723, 0.2078431, 0, 1, 1,
0.4865381, 0.197377, 0.5683815, 0.2117647, 0, 1, 1,
0.4884161, 0.6323933, 0.4953544, 0.2196078, 0, 1, 1,
0.4890504, 1.265756, -0.5461037, 0.2235294, 0, 1, 1,
0.4925786, -0.8043111, 2.625154, 0.2313726, 0, 1, 1,
0.4977784, 0.8574913, 2.217196, 0.2352941, 0, 1, 1,
0.4991417, -1.189529, 4.15648, 0.2431373, 0, 1, 1,
0.5002623, 0.5052662, 2.393668, 0.2470588, 0, 1, 1,
0.500391, 1.186708, 1.501604, 0.254902, 0, 1, 1,
0.5019407, -0.2764233, 3.604566, 0.2588235, 0, 1, 1,
0.5052529, -1.742091, 4.664511, 0.2666667, 0, 1, 1,
0.5074552, -0.8884158, 1.081661, 0.2705882, 0, 1, 1,
0.5129116, 0.3789622, 1.465523, 0.2784314, 0, 1, 1,
0.5147365, 0.6188704, 1.150396, 0.282353, 0, 1, 1,
0.5176454, -0.5809034, 4.522596, 0.2901961, 0, 1, 1,
0.5294329, -0.5413645, 2.510342, 0.2941177, 0, 1, 1,
0.5301448, -0.2369936, 2.25896, 0.3019608, 0, 1, 1,
0.5310404, 0.9820964, 1.509169, 0.3098039, 0, 1, 1,
0.5421957, 1.102967, 0.6060277, 0.3137255, 0, 1, 1,
0.5494581, -0.8649013, 1.17003, 0.3215686, 0, 1, 1,
0.5508848, 0.3545861, 1.482832, 0.3254902, 0, 1, 1,
0.5560527, -0.5077291, 1.422918, 0.3333333, 0, 1, 1,
0.5577848, -0.1152768, 1.74379, 0.3372549, 0, 1, 1,
0.5578905, 0.02842646, 2.316991, 0.345098, 0, 1, 1,
0.5615049, 0.4701543, 1.010602, 0.3490196, 0, 1, 1,
0.5624558, -0.5464391, 3.788188, 0.3568628, 0, 1, 1,
0.5667509, -0.4816832, 2.986271, 0.3607843, 0, 1, 1,
0.5674071, -0.9506052, 6.012967, 0.3686275, 0, 1, 1,
0.5676467, -0.03777748, 1.424874, 0.372549, 0, 1, 1,
0.5710992, 0.6806301, -0.2675964, 0.3803922, 0, 1, 1,
0.5719666, -1.601791, 2.120832, 0.3843137, 0, 1, 1,
0.577915, 0.5674553, 0.4510463, 0.3921569, 0, 1, 1,
0.5831295, 0.02055672, 0.7710496, 0.3960784, 0, 1, 1,
0.5860643, 0.08669233, 0.2159363, 0.4039216, 0, 1, 1,
0.5894472, 0.795982, 0.6828298, 0.4117647, 0, 1, 1,
0.5912146, 0.01488363, -0.08807927, 0.4156863, 0, 1, 1,
0.5940561, 0.882872, 0.9452997, 0.4235294, 0, 1, 1,
0.5992706, 0.1754746, 0.950387, 0.427451, 0, 1, 1,
0.6050469, -0.1898211, 1.677024, 0.4352941, 0, 1, 1,
0.6079946, -1.118173, 2.848028, 0.4392157, 0, 1, 1,
0.6106158, -0.8813053, 2.31195, 0.4470588, 0, 1, 1,
0.6108505, 0.285812, 1.427682, 0.4509804, 0, 1, 1,
0.6114078, -1.698565, 2.940369, 0.4588235, 0, 1, 1,
0.6206356, -2.13094, 2.493403, 0.4627451, 0, 1, 1,
0.6279342, 0.0788577, 0.5260894, 0.4705882, 0, 1, 1,
0.6297235, 0.7734354, 0.7037259, 0.4745098, 0, 1, 1,
0.6339954, 0.1549487, 1.397287, 0.4823529, 0, 1, 1,
0.6356372, -0.2110061, 2.086874, 0.4862745, 0, 1, 1,
0.6386366, -2.259899, 3.43877, 0.4941176, 0, 1, 1,
0.6404367, 1.421795, 0.3016356, 0.5019608, 0, 1, 1,
0.6417874, 0.4617419, 1.142285, 0.5058824, 0, 1, 1,
0.6466126, 0.8398074, 0.6913255, 0.5137255, 0, 1, 1,
0.6479338, -2.869014, 2.320969, 0.5176471, 0, 1, 1,
0.6495328, -1.515528, 2.093932, 0.5254902, 0, 1, 1,
0.6570852, -2.323841, 0.3354293, 0.5294118, 0, 1, 1,
0.6578164, -0.749536, 2.436502, 0.5372549, 0, 1, 1,
0.6617374, -1.547353, 2.376021, 0.5411765, 0, 1, 1,
0.6699296, 1.227622, 0.4399367, 0.5490196, 0, 1, 1,
0.6707591, -0.1465437, 4.257145, 0.5529412, 0, 1, 1,
0.6750236, 0.2268017, 1.821463, 0.5607843, 0, 1, 1,
0.6754346, 0.222814, 0.7063037, 0.5647059, 0, 1, 1,
0.6777958, -0.7379948, 2.892648, 0.572549, 0, 1, 1,
0.6797444, -0.4197972, 2.111982, 0.5764706, 0, 1, 1,
0.6811219, 1.41912, 2.180432, 0.5843138, 0, 1, 1,
0.6855552, 0.7310116, 0.3657604, 0.5882353, 0, 1, 1,
0.6874146, 0.7002805, 0.48896, 0.5960785, 0, 1, 1,
0.6892629, 0.4753208, 1.057512, 0.6039216, 0, 1, 1,
0.6964942, -0.5237237, 1.478874, 0.6078432, 0, 1, 1,
0.6987685, 0.2843913, -0.03078913, 0.6156863, 0, 1, 1,
0.6996347, 0.7753778, -1.376362, 0.6196079, 0, 1, 1,
0.7036003, -0.3405502, 1.83024, 0.627451, 0, 1, 1,
0.7048749, 1.0902, 0.5733435, 0.6313726, 0, 1, 1,
0.7080763, -0.9422124, 2.239264, 0.6392157, 0, 1, 1,
0.7107265, 0.8477314, 1.235244, 0.6431373, 0, 1, 1,
0.7146072, 0.2381074, -0.3909523, 0.6509804, 0, 1, 1,
0.7154239, -1.496265, 0.01259405, 0.654902, 0, 1, 1,
0.7194878, -1.224793, 3.015547, 0.6627451, 0, 1, 1,
0.720701, 0.6915503, 0.4300343, 0.6666667, 0, 1, 1,
0.7241338, -1.639405, 2.978863, 0.6745098, 0, 1, 1,
0.7263625, 0.614997, -0.06271112, 0.6784314, 0, 1, 1,
0.7293517, -0.6279224, 3.034481, 0.6862745, 0, 1, 1,
0.7311578, -0.4176665, 3.061647, 0.6901961, 0, 1, 1,
0.7329485, 0.1786467, 1.541862, 0.6980392, 0, 1, 1,
0.7342699, -1.76751, 3.88404, 0.7058824, 0, 1, 1,
0.7434438, 0.5410713, 1.577785, 0.7098039, 0, 1, 1,
0.7461422, -0.7184505, 2.400015, 0.7176471, 0, 1, 1,
0.7475621, 1.647189, -0.3101836, 0.7215686, 0, 1, 1,
0.7494088, 0.9324092, 0.1522702, 0.7294118, 0, 1, 1,
0.7532032, -0.9261304, 2.148471, 0.7333333, 0, 1, 1,
0.7564263, 0.5995451, 0.2906793, 0.7411765, 0, 1, 1,
0.7573425, 0.5543998, 1.027897, 0.7450981, 0, 1, 1,
0.7608305, -1.668638, 3.102476, 0.7529412, 0, 1, 1,
0.7651844, 0.2935608, 1.850953, 0.7568628, 0, 1, 1,
0.7708809, 0.3890709, -0.3866483, 0.7647059, 0, 1, 1,
0.7762163, -0.8431078, 2.453665, 0.7686275, 0, 1, 1,
0.7763016, -0.0794074, 2.117565, 0.7764706, 0, 1, 1,
0.7765041, -0.3818893, 2.49194, 0.7803922, 0, 1, 1,
0.7802125, -0.5986379, 1.514212, 0.7882353, 0, 1, 1,
0.7899436, -1.261487, 2.385144, 0.7921569, 0, 1, 1,
0.7946087, 0.2009557, 1.797834, 0.8, 0, 1, 1,
0.7976149, 0.1099917, 0.7396289, 0.8078431, 0, 1, 1,
0.8013787, 0.5730901, -0.3855675, 0.8117647, 0, 1, 1,
0.8024604, 0.7639554, 1.090842, 0.8196079, 0, 1, 1,
0.8054703, 0.6978974, 2.108088, 0.8235294, 0, 1, 1,
0.8120219, 1.051637, 1.139026, 0.8313726, 0, 1, 1,
0.8129141, 1.034194, -0.9805347, 0.8352941, 0, 1, 1,
0.8141726, -0.9692355, 2.203534, 0.8431373, 0, 1, 1,
0.819578, 0.1948325, 1.071616, 0.8470588, 0, 1, 1,
0.821376, 1.252777, -0.5766335, 0.854902, 0, 1, 1,
0.8305067, -1.592245, 3.483542, 0.8588235, 0, 1, 1,
0.8324925, -0.8918939, 3.663564, 0.8666667, 0, 1, 1,
0.8341866, -0.1646721, 2.689889, 0.8705882, 0, 1, 1,
0.8342199, 1.382995, 1.905349, 0.8784314, 0, 1, 1,
0.8361138, 1.242485, 1.009558, 0.8823529, 0, 1, 1,
0.8382092, -0.9652482, 2.525209, 0.8901961, 0, 1, 1,
0.8391337, 1.004014, -0.4874497, 0.8941177, 0, 1, 1,
0.8432792, -0.005582409, 0.4656574, 0.9019608, 0, 1, 1,
0.8465568, -0.1603079, 2.217592, 0.9098039, 0, 1, 1,
0.8510711, -1.520146, 1.803289, 0.9137255, 0, 1, 1,
0.8520385, 0.8758782, -1.13607, 0.9215686, 0, 1, 1,
0.8521004, 0.5207029, 1.887524, 0.9254902, 0, 1, 1,
0.8563748, 1.109034, 0.9678754, 0.9333333, 0, 1, 1,
0.8608152, 1.230471, -0.3695608, 0.9372549, 0, 1, 1,
0.8678615, -1.226887, 2.329899, 0.945098, 0, 1, 1,
0.879469, 2.569023, 1.184599, 0.9490196, 0, 1, 1,
0.879802, -1.620791, 2.939244, 0.9568627, 0, 1, 1,
0.8861768, 1.440755, 0.03565213, 0.9607843, 0, 1, 1,
0.8890218, 0.01301165, 1.495372, 0.9686275, 0, 1, 1,
0.8936957, 0.8102981, 0.8104151, 0.972549, 0, 1, 1,
0.9013065, 1.190196, 1.857336, 0.9803922, 0, 1, 1,
0.908066, -1.098086, 2.276025, 0.9843137, 0, 1, 1,
0.9091648, -0.4052706, 2.502737, 0.9921569, 0, 1, 1,
0.9092011, -0.2283446, 1.305091, 0.9960784, 0, 1, 1,
0.9093392, 0.3662261, 1.526783, 1, 0, 0.9960784, 1,
0.9123338, 0.470554, 1.893739, 1, 0, 0.9882353, 1,
0.9126755, -0.5804607, 3.046114, 1, 0, 0.9843137, 1,
0.9163951, -0.4420758, 2.668273, 1, 0, 0.9764706, 1,
0.9219731, 0.7133406, -0.0267756, 1, 0, 0.972549, 1,
0.9227129, 1.54911, 0.8673471, 1, 0, 0.9647059, 1,
0.9269833, 0.1982734, 1.441433, 1, 0, 0.9607843, 1,
0.9278426, -0.2701941, 0.007435543, 1, 0, 0.9529412, 1,
0.9485542, -1.134601, 1.806072, 1, 0, 0.9490196, 1,
0.956082, 0.1677437, 0.4092886, 1, 0, 0.9411765, 1,
0.9593303, 1.775411, 1.107701, 1, 0, 0.9372549, 1,
0.9637048, -1.087413, 2.481285, 1, 0, 0.9294118, 1,
0.9656112, -0.732336, 4.69069, 1, 0, 0.9254902, 1,
0.9664192, -0.6506247, 2.770243, 1, 0, 0.9176471, 1,
0.9665074, -1.407943, 2.239084, 1, 0, 0.9137255, 1,
0.9687264, 1.163031, -0.7047242, 1, 0, 0.9058824, 1,
0.9827647, -1.232946, 1.142735, 1, 0, 0.9019608, 1,
0.9876208, 0.2494528, 2.885811, 1, 0, 0.8941177, 1,
0.99282, 1.019621, 0.3202217, 1, 0, 0.8862745, 1,
0.9944581, -0.5716727, 3.265097, 1, 0, 0.8823529, 1,
1.008123, 1.140053, 0.7851623, 1, 0, 0.8745098, 1,
1.020935, -2.539839, 3.558575, 1, 0, 0.8705882, 1,
1.022737, 0.64557, 0.3366488, 1, 0, 0.8627451, 1,
1.03372, -0.7206694, 3.364374, 1, 0, 0.8588235, 1,
1.038975, 0.7111354, 0.9945073, 1, 0, 0.8509804, 1,
1.054865, 0.2611011, 0.72724, 1, 0, 0.8470588, 1,
1.057304, -0.1334981, 1.547083, 1, 0, 0.8392157, 1,
1.059238, -0.2810747, 1.580839, 1, 0, 0.8352941, 1,
1.069703, 1.419368, 1.527183, 1, 0, 0.827451, 1,
1.07341, 0.5978861, 1.656504, 1, 0, 0.8235294, 1,
1.075137, -1.79892, 1.313146, 1, 0, 0.8156863, 1,
1.080868, 0.3800757, 1.248638, 1, 0, 0.8117647, 1,
1.091141, 1.844383, 1.931916, 1, 0, 0.8039216, 1,
1.100526, 1.406644, 0.9260193, 1, 0, 0.7960784, 1,
1.103155, 1.233845, 1.689972, 1, 0, 0.7921569, 1,
1.10324, 0.842197, 1.183121, 1, 0, 0.7843137, 1,
1.10938, -0.3937811, -0.2898087, 1, 0, 0.7803922, 1,
1.115344, 0.7322288, 1.28345, 1, 0, 0.772549, 1,
1.118762, 2.139469, -0.9893401, 1, 0, 0.7686275, 1,
1.129256, -0.8260224, 1.29821, 1, 0, 0.7607843, 1,
1.136476, -2.058529, 3.889935, 1, 0, 0.7568628, 1,
1.139418, 0.1839972, 0.1691719, 1, 0, 0.7490196, 1,
1.143566, -2.331956, 3.43069, 1, 0, 0.7450981, 1,
1.144038, -0.3777733, 1.751512, 1, 0, 0.7372549, 1,
1.151426, 1.605364, 0.6846665, 1, 0, 0.7333333, 1,
1.159735, 0.574298, 1.035414, 1, 0, 0.7254902, 1,
1.165885, 0.09515315, 1.083079, 1, 0, 0.7215686, 1,
1.168591, 1.002159, 0.4441443, 1, 0, 0.7137255, 1,
1.170832, -0.4377341, 0.02809119, 1, 0, 0.7098039, 1,
1.172899, 3.119805, -0.521291, 1, 0, 0.7019608, 1,
1.178392, -0.08649208, 2.522092, 1, 0, 0.6941177, 1,
1.179548, -0.6541981, 1.110249, 1, 0, 0.6901961, 1,
1.186257, -2.151525, 3.766768, 1, 0, 0.682353, 1,
1.192978, 0.4391181, 0.624309, 1, 0, 0.6784314, 1,
1.195761, 0.1330519, 0.8647119, 1, 0, 0.6705883, 1,
1.198942, 0.2324266, -0.8845047, 1, 0, 0.6666667, 1,
1.19984, -0.3524538, 1.149664, 1, 0, 0.6588235, 1,
1.209429, 1.935633, -0.8504036, 1, 0, 0.654902, 1,
1.214137, -1.033938, 2.746072, 1, 0, 0.6470588, 1,
1.214798, 0.5526992, 0.1877672, 1, 0, 0.6431373, 1,
1.217691, -0.5075649, 1.833493, 1, 0, 0.6352941, 1,
1.224395, 0.1024994, 2.282964, 1, 0, 0.6313726, 1,
1.244516, 0.4803264, 1.180932, 1, 0, 0.6235294, 1,
1.24511, -1.240608, 2.438821, 1, 0, 0.6196079, 1,
1.24754, -0.929899, 4.028445, 1, 0, 0.6117647, 1,
1.258104, -1.363177, 3.565418, 1, 0, 0.6078432, 1,
1.259842, -0.4052581, 2.309041, 1, 0, 0.6, 1,
1.260717, 0.29105, 1.265685, 1, 0, 0.5921569, 1,
1.267639, 1.377074, 2.055738, 1, 0, 0.5882353, 1,
1.271082, 0.5337926, 0.5425653, 1, 0, 0.5803922, 1,
1.274365, 1.898062, 1.249486, 1, 0, 0.5764706, 1,
1.275807, 0.1584909, 0.2877758, 1, 0, 0.5686275, 1,
1.276346, 0.7515913, 1.553222, 1, 0, 0.5647059, 1,
1.284762, 1.466392, 1.145076, 1, 0, 0.5568628, 1,
1.285299, -0.7116902, 0.9420764, 1, 0, 0.5529412, 1,
1.288512, -0.01871219, 2.825168, 1, 0, 0.5450981, 1,
1.292541, -0.899589, 2.096164, 1, 0, 0.5411765, 1,
1.320829, -0.3401062, 2.102811, 1, 0, 0.5333334, 1,
1.343973, -1.640862, 2.232224, 1, 0, 0.5294118, 1,
1.356112, 0.02883666, 0.2108167, 1, 0, 0.5215687, 1,
1.367395, -0.2691255, 1.180747, 1, 0, 0.5176471, 1,
1.371593, 1.016336, 0.1321462, 1, 0, 0.509804, 1,
1.378555, 0.2515079, 0.6529949, 1, 0, 0.5058824, 1,
1.389704, -1.481963, 2.434995, 1, 0, 0.4980392, 1,
1.427876, 0.9938969, -1.968442, 1, 0, 0.4901961, 1,
1.432771, 0.9847027, 1.365729, 1, 0, 0.4862745, 1,
1.435574, 1.27895, -0.1502659, 1, 0, 0.4784314, 1,
1.436873, 0.6082018, 2.267259, 1, 0, 0.4745098, 1,
1.438456, 0.9646584, 2.153892, 1, 0, 0.4666667, 1,
1.441966, -0.1660141, 0.6685405, 1, 0, 0.4627451, 1,
1.447001, 1.046536, 1.638221, 1, 0, 0.454902, 1,
1.450971, -0.4577974, 1.557071, 1, 0, 0.4509804, 1,
1.453238, 0.4820504, 1.803213, 1, 0, 0.4431373, 1,
1.468795, -0.5966886, 2.903817, 1, 0, 0.4392157, 1,
1.477235, -1.084503, 3.47605, 1, 0, 0.4313726, 1,
1.484308, -0.702691, 3.254538, 1, 0, 0.427451, 1,
1.495063, 0.3338786, 1.664574, 1, 0, 0.4196078, 1,
1.497585, 0.6303543, 1.495166, 1, 0, 0.4156863, 1,
1.506446, 1.087893, 0.4394622, 1, 0, 0.4078431, 1,
1.511565, 0.2884607, 1.466556, 1, 0, 0.4039216, 1,
1.521531, -0.9492945, 1.884787, 1, 0, 0.3960784, 1,
1.524757, -0.7427713, 0.7725371, 1, 0, 0.3882353, 1,
1.528556, 0.1428149, 1.892264, 1, 0, 0.3843137, 1,
1.548907, -0.1160935, 2.821449, 1, 0, 0.3764706, 1,
1.553461, -1.308108, 1.67292, 1, 0, 0.372549, 1,
1.56049, -0.7316889, 2.066107, 1, 0, 0.3647059, 1,
1.5624, -0.6938401, -0.5264518, 1, 0, 0.3607843, 1,
1.566782, 0.7076703, 1.273884, 1, 0, 0.3529412, 1,
1.569462, -0.9984174, 0.9855675, 1, 0, 0.3490196, 1,
1.584159, -1.039042, 2.888659, 1, 0, 0.3411765, 1,
1.607995, -0.8409507, 2.076618, 1, 0, 0.3372549, 1,
1.616552, -0.4890308, 0.7870458, 1, 0, 0.3294118, 1,
1.61975, 1.062003, 2.502909, 1, 0, 0.3254902, 1,
1.632425, 0.9334279, 1.597161, 1, 0, 0.3176471, 1,
1.633598, -0.3821667, 1.868293, 1, 0, 0.3137255, 1,
1.64168, 0.4872444, 1.649169, 1, 0, 0.3058824, 1,
1.659768, 2.658074, 1.139727, 1, 0, 0.2980392, 1,
1.668686, 1.454651, 0.7087976, 1, 0, 0.2941177, 1,
1.668927, 1.962952, 0.3377711, 1, 0, 0.2862745, 1,
1.673929, 0.8531682, 0.1908441, 1, 0, 0.282353, 1,
1.675283, 0.05141471, 2.638859, 1, 0, 0.2745098, 1,
1.676003, 0.3728374, 0.1722578, 1, 0, 0.2705882, 1,
1.695064, 0.5290294, 1.770769, 1, 0, 0.2627451, 1,
1.70013, 0.6216156, 0.8442227, 1, 0, 0.2588235, 1,
1.73462, -1.106924, 2.857808, 1, 0, 0.2509804, 1,
1.756131, 1.732576, 2.494145, 1, 0, 0.2470588, 1,
1.770824, -1.116537, 2.752494, 1, 0, 0.2392157, 1,
1.80418, 1.980516, 2.458828, 1, 0, 0.2352941, 1,
1.811456, -0.4681736, 1.438167, 1, 0, 0.227451, 1,
1.813406, -1.404637, 2.025526, 1, 0, 0.2235294, 1,
1.822018, -0.307575, 0.691781, 1, 0, 0.2156863, 1,
1.851787, 0.7753352, 0.4305682, 1, 0, 0.2117647, 1,
1.875944, -0.6183984, 1.501805, 1, 0, 0.2039216, 1,
1.876302, -0.9180481, 3.36636, 1, 0, 0.1960784, 1,
1.878167, 0.4741105, 0.4495896, 1, 0, 0.1921569, 1,
1.883207, 1.092633, 1.382037, 1, 0, 0.1843137, 1,
1.903718, -2.228288, 0.9720297, 1, 0, 0.1803922, 1,
1.909562, 0.2964934, 1.856828, 1, 0, 0.172549, 1,
1.972888, 0.3523835, 2.513194, 1, 0, 0.1686275, 1,
1.978528, 0.5286338, 2.738003, 1, 0, 0.1607843, 1,
1.986691, 0.7127094, 0.6976476, 1, 0, 0.1568628, 1,
2.00654, -1.262543, -0.1559904, 1, 0, 0.1490196, 1,
2.012106, 0.8906805, 1.974839, 1, 0, 0.145098, 1,
2.085914, -1.697983, 1.790347, 1, 0, 0.1372549, 1,
2.0873, 0.4204853, 1.850888, 1, 0, 0.1333333, 1,
2.119322, 0.2270342, 1.569228, 1, 0, 0.1254902, 1,
2.12032, -0.0581446, 1.432734, 1, 0, 0.1215686, 1,
2.131393, 0.6987029, 1.905879, 1, 0, 0.1137255, 1,
2.137053, -1.316483, 3.427549, 1, 0, 0.1098039, 1,
2.142291, 1.861406, -0.921046, 1, 0, 0.1019608, 1,
2.168017, -0.2657636, 3.431613, 1, 0, 0.09411765, 1,
2.178522, -0.01932903, 0.9547532, 1, 0, 0.09019608, 1,
2.225924, -1.66011, 2.592245, 1, 0, 0.08235294, 1,
2.255586, -2.023667, 0.8744222, 1, 0, 0.07843138, 1,
2.279393, 0.7598066, 0.6869101, 1, 0, 0.07058824, 1,
2.301495, 0.3003651, 3.210165, 1, 0, 0.06666667, 1,
2.356804, 0.7438766, -0.2353086, 1, 0, 0.05882353, 1,
2.371297, -1.151584, 0.03312925, 1, 0, 0.05490196, 1,
2.631329, -1.245484, 3.894617, 1, 0, 0.04705882, 1,
2.679452, -0.1109061, 2.174686, 1, 0, 0.04313726, 1,
2.711149, -0.2782574, 1.208191, 1, 0, 0.03529412, 1,
2.729704, 0.0577873, 1.747689, 1, 0, 0.03137255, 1,
3.059493, 0.3135749, 0.9744267, 1, 0, 0.02352941, 1,
3.579079, -1.849887, 1.569925, 1, 0, 0.01960784, 1,
3.681027, 0.2079356, 2.434567, 1, 0, 0.01176471, 1,
3.937207, -0.4306365, 1.41592, 1, 0, 0.007843138, 1
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
0.2530873, -4.210638, -7.299586, 0, -0.5, 0.5, 0.5,
0.2530873, -4.210638, -7.299586, 1, -0.5, 0.5, 0.5,
0.2530873, -4.210638, -7.299586, 1, 1.5, 0.5, 0.5,
0.2530873, -4.210638, -7.299586, 0, 1.5, 0.5, 0.5
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
-4.679949, 0.003708005, -7.299586, 0, -0.5, 0.5, 0.5,
-4.679949, 0.003708005, -7.299586, 1, -0.5, 0.5, 0.5,
-4.679949, 0.003708005, -7.299586, 1, 1.5, 0.5, 0.5,
-4.679949, 0.003708005, -7.299586, 0, 1.5, 0.5, 0.5
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
-4.679949, -4.210638, 0.3214095, 0, -0.5, 0.5, 0.5,
-4.679949, -4.210638, 0.3214095, 1, -0.5, 0.5, 0.5,
-4.679949, -4.210638, 0.3214095, 1, 1.5, 0.5, 0.5,
-4.679949, -4.210638, 0.3214095, 0, 1.5, 0.5, 0.5
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
-2, -3.238097, -5.540895,
2, -3.238097, -5.540895,
-2, -3.238097, -5.540895,
-2, -3.400187, -5.83401,
0, -3.238097, -5.540895,
0, -3.400187, -5.83401,
2, -3.238097, -5.540895,
2, -3.400187, -5.83401
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
-2, -3.724368, -6.42024, 0, -0.5, 0.5, 0.5,
-2, -3.724368, -6.42024, 1, -0.5, 0.5, 0.5,
-2, -3.724368, -6.42024, 1, 1.5, 0.5, 0.5,
-2, -3.724368, -6.42024, 0, 1.5, 0.5, 0.5,
0, -3.724368, -6.42024, 0, -0.5, 0.5, 0.5,
0, -3.724368, -6.42024, 1, -0.5, 0.5, 0.5,
0, -3.724368, -6.42024, 1, 1.5, 0.5, 0.5,
0, -3.724368, -6.42024, 0, 1.5, 0.5, 0.5,
2, -3.724368, -6.42024, 0, -0.5, 0.5, 0.5,
2, -3.724368, -6.42024, 1, -0.5, 0.5, 0.5,
2, -3.724368, -6.42024, 1, 1.5, 0.5, 0.5,
2, -3.724368, -6.42024, 0, 1.5, 0.5, 0.5
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
-3.541556, -3, -5.540895,
-3.541556, 3, -5.540895,
-3.541556, -3, -5.540895,
-3.731288, -3, -5.83401,
-3.541556, -2, -5.540895,
-3.731288, -2, -5.83401,
-3.541556, -1, -5.540895,
-3.731288, -1, -5.83401,
-3.541556, 0, -5.540895,
-3.731288, 0, -5.83401,
-3.541556, 1, -5.540895,
-3.731288, 1, -5.83401,
-3.541556, 2, -5.540895,
-3.731288, 2, -5.83401,
-3.541556, 3, -5.540895,
-3.731288, 3, -5.83401
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
-4.110753, -3, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, -3, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, -3, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, -3, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, -2, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, -2, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, -2, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, -2, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, -1, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, -1, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, -1, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, -1, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, 0, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, 0, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, 0, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, 0, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, 1, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, 1, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, 1, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, 1, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, 2, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, 2, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, 2, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, 2, -6.42024, 0, 1.5, 0.5, 0.5,
-4.110753, 3, -6.42024, 0, -0.5, 0.5, 0.5,
-4.110753, 3, -6.42024, 1, -0.5, 0.5, 0.5,
-4.110753, 3, -6.42024, 1, 1.5, 0.5, 0.5,
-4.110753, 3, -6.42024, 0, 1.5, 0.5, 0.5
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
-3.541556, -3.238097, -4,
-3.541556, -3.238097, 6,
-3.541556, -3.238097, -4,
-3.731288, -3.400187, -4,
-3.541556, -3.238097, -2,
-3.731288, -3.400187, -2,
-3.541556, -3.238097, 0,
-3.731288, -3.400187, 0,
-3.541556, -3.238097, 2,
-3.731288, -3.400187, 2,
-3.541556, -3.238097, 4,
-3.731288, -3.400187, 4,
-3.541556, -3.238097, 6,
-3.731288, -3.400187, 6
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
"4",
"6"
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
-4.110753, -3.724368, -4, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, -4, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, -4, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, -4, 0, 1.5, 0.5, 0.5,
-4.110753, -3.724368, -2, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, -2, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, -2, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, -2, 0, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 0, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 0, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 0, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 0, 0, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 2, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 2, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 2, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 2, 0, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 4, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 4, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 4, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 4, 0, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 6, 0, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 6, 1, -0.5, 0.5, 0.5,
-4.110753, -3.724368, 6, 1, 1.5, 0.5, 0.5,
-4.110753, -3.724368, 6, 0, 1.5, 0.5, 0.5
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
-3.541556, -3.238097, -5.540895,
-3.541556, 3.245513, -5.540895,
-3.541556, -3.238097, 6.183714,
-3.541556, 3.245513, 6.183714,
-3.541556, -3.238097, -5.540895,
-3.541556, -3.238097, 6.183714,
-3.541556, 3.245513, -5.540895,
-3.541556, 3.245513, 6.183714,
-3.541556, -3.238097, -5.540895,
4.047731, -3.238097, -5.540895,
-3.541556, -3.238097, 6.183714,
4.047731, -3.238097, 6.183714,
-3.541556, 3.245513, -5.540895,
4.047731, 3.245513, -5.540895,
-3.541556, 3.245513, 6.183714,
4.047731, 3.245513, 6.183714,
4.047731, -3.238097, -5.540895,
4.047731, 3.245513, -5.540895,
4.047731, -3.238097, 6.183714,
4.047731, 3.245513, 6.183714,
4.047731, -3.238097, -5.540895,
4.047731, -3.238097, 6.183714,
4.047731, 3.245513, -5.540895,
4.047731, 3.245513, 6.183714
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
var radius = 8.222277;
var distance = 36.58184;
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
mvMatrix.translate( -0.2530873, -0.003708005, -0.3214095 );
mvMatrix.scale( 1.171399, 1.371163, 0.7582417 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.58184);
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
vinyl_phosphoric_aci<-read.table("vinyl_phosphoric_aci.xyz")
```

```
## Error in read.table("vinyl_phosphoric_aci.xyz"): no lines available in input
```

```r
x<-vinyl_phosphoric_aci$V2
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
y<-vinyl_phosphoric_aci$V3
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
```

```r
z<-vinyl_phosphoric_aci$V4
```

```
## Error in eval(expr, envir, enclos): object 'vinyl_phosphoric_aci' not found
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
-3.431033, -0.8170315, -2.890244, 0, 0, 1, 1, 1,
-3.130216, 0.08168252, -1.236756, 1, 0, 0, 1, 1,
-3.048726, -0.6177616, -2.030352, 1, 0, 0, 1, 1,
-2.668739, -1.548717, -3.129983, 1, 0, 0, 1, 1,
-2.506347, -0.3093044, -0.9895564, 1, 0, 0, 1, 1,
-2.442154, -0.6981431, -2.029948, 1, 0, 0, 1, 1,
-2.429129, 0.9372159, -0.6335121, 0, 0, 0, 1, 1,
-2.35486, 0.8608588, -0.6506281, 0, 0, 0, 1, 1,
-2.296809, 1.278169, -0.7581736, 0, 0, 0, 1, 1,
-2.286645, 1.186264, -0.1755333, 0, 0, 0, 1, 1,
-2.280597, -0.9571328, -2.513202, 0, 0, 0, 1, 1,
-2.240832, -2.730705, -0.8736401, 0, 0, 0, 1, 1,
-2.232284, -0.1540887, -1.196117, 0, 0, 0, 1, 1,
-2.205713, -1.78538, -2.370668, 1, 1, 1, 1, 1,
-2.203779, -0.03704384, -0.02619242, 1, 1, 1, 1, 1,
-2.187685, -0.8808013, -3.455927, 1, 1, 1, 1, 1,
-2.179579, -0.5079128, -1.062455, 1, 1, 1, 1, 1,
-2.135869, 0.2255593, -1.813934, 1, 1, 1, 1, 1,
-2.127754, -1.488519, -4.478224, 1, 1, 1, 1, 1,
-2.111912, -0.6505955, -2.185975, 1, 1, 1, 1, 1,
-2.098304, -0.009337027, -1.233308, 1, 1, 1, 1, 1,
-2.081214, 1.030621, -0.2379141, 1, 1, 1, 1, 1,
-2.069324, -1.031583, 0.1155123, 1, 1, 1, 1, 1,
-2.038287, -0.03085223, -1.393435, 1, 1, 1, 1, 1,
-2.030833, 1.155769, -1.017247, 1, 1, 1, 1, 1,
-2.019752, -0.4183593, -1.261922, 1, 1, 1, 1, 1,
-2.016615, 0.199205, -2.000618, 1, 1, 1, 1, 1,
-2.004692, 0.1835138, -2.011316, 1, 1, 1, 1, 1,
-2.003122, -0.7416198, 0.7242469, 0, 0, 1, 1, 1,
-1.987616, -2.568426, -4.229793, 1, 0, 0, 1, 1,
-1.986219, -1.160209, -2.738944, 1, 0, 0, 1, 1,
-1.901268, -1.119045, -2.327502, 1, 0, 0, 1, 1,
-1.877355, 1.204259, -1.193177, 1, 0, 0, 1, 1,
-1.87309, -0.01589393, -3.081518, 1, 0, 0, 1, 1,
-1.871313, 0.2378618, -2.519069, 0, 0, 0, 1, 1,
-1.858264, 0.2529816, -0.0008803187, 0, 0, 0, 1, 1,
-1.83944, -1.12805, -0.4847273, 0, 0, 0, 1, 1,
-1.829935, -0.5872188, -2.421063, 0, 0, 0, 1, 1,
-1.827028, -0.1670998, -1.682104, 0, 0, 0, 1, 1,
-1.826431, -1.871994, -3.969803, 0, 0, 0, 1, 1,
-1.763198, 0.5537255, -0.1154679, 0, 0, 0, 1, 1,
-1.738691, 0.05714056, -1.880589, 1, 1, 1, 1, 1,
-1.713284, -0.8670086, -2.345468, 1, 1, 1, 1, 1,
-1.694323, -1.649307, -2.692635, 1, 1, 1, 1, 1,
-1.693178, -1.549884, -4.223531, 1, 1, 1, 1, 1,
-1.692279, 1.195537, 1.452791, 1, 1, 1, 1, 1,
-1.675619, 0.4197736, -0.1206602, 1, 1, 1, 1, 1,
-1.673256, 1.310364, -2.230169, 1, 1, 1, 1, 1,
-1.671305, 0.7104378, -1.443042, 1, 1, 1, 1, 1,
-1.668736, 0.8503012, -0.1565515, 1, 1, 1, 1, 1,
-1.661756, 0.9929405, -0.7504024, 1, 1, 1, 1, 1,
-1.653904, 0.2118432, -1.921292, 1, 1, 1, 1, 1,
-1.650285, -1.267089, -3.738998, 1, 1, 1, 1, 1,
-1.6487, -1.890266, -2.998999, 1, 1, 1, 1, 1,
-1.644026, 0.4829768, -1.32945, 1, 1, 1, 1, 1,
-1.640199, -0.7187969, -0.3319499, 1, 1, 1, 1, 1,
-1.631325, 1.893501, -0.6201953, 0, 0, 1, 1, 1,
-1.617865, -0.6624972, -2.39994, 1, 0, 0, 1, 1,
-1.613161, 1.446362, -1.876668, 1, 0, 0, 1, 1,
-1.601751, 0.5911535, -0.8562787, 1, 0, 0, 1, 1,
-1.600323, -0.02643647, -1.282261, 1, 0, 0, 1, 1,
-1.595232, -0.1479712, -1.841348, 1, 0, 0, 1, 1,
-1.556273, 0.06495524, -1.310312, 0, 0, 0, 1, 1,
-1.553427, -1.296358, -2.123324, 0, 0, 0, 1, 1,
-1.541713, 1.537594, 0.6327876, 0, 0, 0, 1, 1,
-1.530518, -1.514178, -2.026415, 0, 0, 0, 1, 1,
-1.530315, 0.8672959, -0.6482512, 0, 0, 0, 1, 1,
-1.526929, -2.785002, -1.595343, 0, 0, 0, 1, 1,
-1.515116, -0.1925624, -1.706633, 0, 0, 0, 1, 1,
-1.509598, 1.647385, -0.9511166, 1, 1, 1, 1, 1,
-1.49707, -0.4145357, -0.4235688, 1, 1, 1, 1, 1,
-1.487284, 0.6360101, -0.7201675, 1, 1, 1, 1, 1,
-1.475871, 0.1328099, -0.6863371, 1, 1, 1, 1, 1,
-1.472809, -2.349738, -2.125323, 1, 1, 1, 1, 1,
-1.470757, 0.1751966, -1.474462, 1, 1, 1, 1, 1,
-1.46959, -0.3361844, -2.295782, 1, 1, 1, 1, 1,
-1.466804, -0.07866917, -1.891627, 1, 1, 1, 1, 1,
-1.466763, -0.03409228, -0.7066736, 1, 1, 1, 1, 1,
-1.454889, -1.297351, -2.803774, 1, 1, 1, 1, 1,
-1.452835, -0.7175233, -2.27873, 1, 1, 1, 1, 1,
-1.436812, 1.090099, -1.579876, 1, 1, 1, 1, 1,
-1.435342, 1.025958, -0.6709496, 1, 1, 1, 1, 1,
-1.432198, 0.3217084, -0.2469173, 1, 1, 1, 1, 1,
-1.429017, 1.34672, -0.2499065, 1, 1, 1, 1, 1,
-1.426094, 0.9542735, -2.234609, 0, 0, 1, 1, 1,
-1.425673, -0.5810456, -1.76547, 1, 0, 0, 1, 1,
-1.416957, -1.195111, -2.084862, 1, 0, 0, 1, 1,
-1.416587, -0.627578, -1.641256, 1, 0, 0, 1, 1,
-1.413612, 0.6621118, -1.592948, 1, 0, 0, 1, 1,
-1.399318, -0.8444343, -3.365581, 1, 0, 0, 1, 1,
-1.397232, -2.324745, -1.717481, 0, 0, 0, 1, 1,
-1.387667, -1.735176, -2.118014, 0, 0, 0, 1, 1,
-1.387554, -0.6828616, -1.422658, 0, 0, 0, 1, 1,
-1.386521, -0.8756467, -2.561153, 0, 0, 0, 1, 1,
-1.38482, -1.27207, -3.199022, 0, 0, 0, 1, 1,
-1.374104, 1.509758, -1.960369, 0, 0, 0, 1, 1,
-1.363636, -0.4872397, -3.436248, 0, 0, 0, 1, 1,
-1.357472, 1.299251, -0.6977631, 1, 1, 1, 1, 1,
-1.356151, -1.16134, -3.112174, 1, 1, 1, 1, 1,
-1.352064, -1.52188, -3.667296, 1, 1, 1, 1, 1,
-1.347693, -0.0154781, -0.9142879, 1, 1, 1, 1, 1,
-1.346931, 0.05479718, -0.984742, 1, 1, 1, 1, 1,
-1.340499, -1.304111, -0.5576286, 1, 1, 1, 1, 1,
-1.339624, -0.5716455, -2.587095, 1, 1, 1, 1, 1,
-1.335817, -1.337687, -4.029935, 1, 1, 1, 1, 1,
-1.333514, 0.9010102, -0.0308081, 1, 1, 1, 1, 1,
-1.330824, 1.208754, -1.372957, 1, 1, 1, 1, 1,
-1.319274, 1.537649, -1.09146, 1, 1, 1, 1, 1,
-1.312628, 0.3046088, -0.5330902, 1, 1, 1, 1, 1,
-1.309299, 0.540152, -2.687469, 1, 1, 1, 1, 1,
-1.305821, 0.3671707, -0.9864882, 1, 1, 1, 1, 1,
-1.298112, 1.142656, -0.4698021, 1, 1, 1, 1, 1,
-1.296964, -0.6256471, -0.58766, 0, 0, 1, 1, 1,
-1.291553, 0.03148746, -1.664181, 1, 0, 0, 1, 1,
-1.287217, 0.8393959, -1.248843, 1, 0, 0, 1, 1,
-1.283439, 0.8275297, -0.1892373, 1, 0, 0, 1, 1,
-1.276652, -2.607952, -1.492002, 1, 0, 0, 1, 1,
-1.270082, 1.091966, -1.196065, 1, 0, 0, 1, 1,
-1.265041, -0.529655, -1.730545, 0, 0, 0, 1, 1,
-1.261663, -0.6507006, -1.853678, 0, 0, 0, 1, 1,
-1.260951, -0.4800346, -2.970754, 0, 0, 0, 1, 1,
-1.256063, -0.7864724, -2.548511, 0, 0, 0, 1, 1,
-1.25151, -0.04249557, -3.684978, 0, 0, 0, 1, 1,
-1.251083, -0.4736628, -0.2805761, 0, 0, 0, 1, 1,
-1.247688, 1.473746, -2.433511, 0, 0, 0, 1, 1,
-1.246851, -1.395097, -1.947641, 1, 1, 1, 1, 1,
-1.241317, 0.4027318, -0.3295452, 1, 1, 1, 1, 1,
-1.234779, -0.7758812, -2.22352, 1, 1, 1, 1, 1,
-1.231819, 1.17584, -1.107894, 1, 1, 1, 1, 1,
-1.224687, -0.7310454, -2.366437, 1, 1, 1, 1, 1,
-1.212296, 0.3129081, -2.927925, 1, 1, 1, 1, 1,
-1.195421, -0.215881, -0.9464532, 1, 1, 1, 1, 1,
-1.173429, 1.472339, 0.00724103, 1, 1, 1, 1, 1,
-1.171511, -1.679282, -2.699659, 1, 1, 1, 1, 1,
-1.170006, -0.599288, -3.428151, 1, 1, 1, 1, 1,
-1.169047, -0.7285116, -1.34072, 1, 1, 1, 1, 1,
-1.162469, -1.824706, -0.7050973, 1, 1, 1, 1, 1,
-1.162321, -0.7080358, -1.322104, 1, 1, 1, 1, 1,
-1.157649, -1.132781, -2.305765, 1, 1, 1, 1, 1,
-1.157341, 0.2295519, -2.151707, 1, 1, 1, 1, 1,
-1.144413, -0.8495789, -1.560444, 0, 0, 1, 1, 1,
-1.139814, -1.563946, -1.850128, 1, 0, 0, 1, 1,
-1.131938, -0.4756644, -1.015515, 1, 0, 0, 1, 1,
-1.128457, 1.538106, -0.3292879, 1, 0, 0, 1, 1,
-1.12739, -0.4447846, -1.546593, 1, 0, 0, 1, 1,
-1.125575, -0.1064281, -2.336411, 1, 0, 0, 1, 1,
-1.119056, -0.580994, -0.3618372, 0, 0, 0, 1, 1,
-1.104829, 0.6153024, -1.573796, 0, 0, 0, 1, 1,
-1.103684, -1.029587, -2.243017, 0, 0, 0, 1, 1,
-1.101564, 0.818257, 0.772663, 0, 0, 0, 1, 1,
-1.098874, 2.0101, -0.03116434, 0, 0, 0, 1, 1,
-1.095022, 0.1172576, -0.7828377, 0, 0, 0, 1, 1,
-1.091201, 0.253976, -1.6779, 0, 0, 0, 1, 1,
-1.088184, 0.132658, -0.9716969, 1, 1, 1, 1, 1,
-1.085899, -0.6979579, -3.154634, 1, 1, 1, 1, 1,
-1.07883, 0.4337945, -2.602462, 1, 1, 1, 1, 1,
-1.077931, -1.030809, -3.215558, 1, 1, 1, 1, 1,
-1.067944, 0.3553565, 0.6988026, 1, 1, 1, 1, 1,
-1.062972, 0.1003073, -0.2740558, 1, 1, 1, 1, 1,
-1.05806, 1.087187, -0.5887942, 1, 1, 1, 1, 1,
-1.055456, 0.5232857, 0.1644535, 1, 1, 1, 1, 1,
-1.055402, -0.4787637, -1.963396, 1, 1, 1, 1, 1,
-1.053166, 0.2819223, -1.17928, 1, 1, 1, 1, 1,
-1.052935, 1.077218, -0.1710489, 1, 1, 1, 1, 1,
-1.051343, 1.073694, -1.29369, 1, 1, 1, 1, 1,
-1.037595, -1.813812, -4.404762, 1, 1, 1, 1, 1,
-1.033302, -0.5210685, -1.899213, 1, 1, 1, 1, 1,
-1.030152, -1.11752, -3.019024, 1, 1, 1, 1, 1,
-1.025483, 1.196489, -1.968734, 0, 0, 1, 1, 1,
-1.00242, -0.2090888, -1.288671, 1, 0, 0, 1, 1,
-0.9969725, -0.579624, -2.481611, 1, 0, 0, 1, 1,
-0.9964879, 1.467779, -1.843625, 1, 0, 0, 1, 1,
-0.9936869, -2.37669, -3.424836, 1, 0, 0, 1, 1,
-0.985623, 1.28097, 0.6062084, 1, 0, 0, 1, 1,
-0.9845605, -0.4339674, -1.333517, 0, 0, 0, 1, 1,
-0.9751232, -0.0174753, -3.380919, 0, 0, 0, 1, 1,
-0.9748485, -2.871285, -2.470674, 0, 0, 0, 1, 1,
-0.9742362, -0.9044216, -0.3139272, 0, 0, 0, 1, 1,
-0.9590632, -0.1353433, -2.119397, 0, 0, 0, 1, 1,
-0.9506726, 1.241873, 0.01230598, 0, 0, 0, 1, 1,
-0.9460406, -0.1996282, 0.1637376, 0, 0, 0, 1, 1,
-0.9431226, -0.05888988, -1.485239, 1, 1, 1, 1, 1,
-0.9422265, -0.4999592, -2.805283, 1, 1, 1, 1, 1,
-0.9330652, 1.388827, -0.9649519, 1, 1, 1, 1, 1,
-0.9276462, 0.3945882, -0.1721695, 1, 1, 1, 1, 1,
-0.9275265, -0.4138909, -2.287147, 1, 1, 1, 1, 1,
-0.9270123, 0.9741119, -0.9297899, 1, 1, 1, 1, 1,
-0.9243547, 0.2819518, -2.12983, 1, 1, 1, 1, 1,
-0.9240342, -1.546105, -2.289568, 1, 1, 1, 1, 1,
-0.92168, 1.076449, 0.3011039, 1, 1, 1, 1, 1,
-0.9192396, 0.7987287, -0.9987295, 1, 1, 1, 1, 1,
-0.9162975, 1.371745, -0.7481821, 1, 1, 1, 1, 1,
-0.9097899, -1.542224, -1.565126, 1, 1, 1, 1, 1,
-0.9049967, 0.7680909, 0.03716826, 1, 1, 1, 1, 1,
-0.904129, -1.716205, -2.313412, 1, 1, 1, 1, 1,
-0.898985, -0.1556142, -1.442484, 1, 1, 1, 1, 1,
-0.8924855, 0.05050253, -2.451174, 0, 0, 1, 1, 1,
-0.8906, -0.07567474, -0.6510252, 1, 0, 0, 1, 1,
-0.8890366, 1.013262, -1.010327, 1, 0, 0, 1, 1,
-0.8843201, 0.9510055, -0.1827942, 1, 0, 0, 1, 1,
-0.8770355, -0.3405017, -0.3007295, 1, 0, 0, 1, 1,
-0.8757817, 0.6823282, 0.3414158, 1, 0, 0, 1, 1,
-0.8749071, 0.2191366, 0.4210664, 0, 0, 0, 1, 1,
-0.8726768, -0.7385821, -3.426266, 0, 0, 0, 1, 1,
-0.862422, 0.9195281, 2.302487, 0, 0, 0, 1, 1,
-0.858225, 2.232149, 0.2401785, 0, 0, 0, 1, 1,
-0.8569836, 0.02997409, -2.045386, 0, 0, 0, 1, 1,
-0.847873, 0.6034455, -2.004259, 0, 0, 0, 1, 1,
-0.8440681, -0.07317522, -1.108677, 0, 0, 0, 1, 1,
-0.8437147, 0.1280126, -1.847669, 1, 1, 1, 1, 1,
-0.8402079, 1.0169, 0.6433047, 1, 1, 1, 1, 1,
-0.837027, -0.3744645, -2.285781, 1, 1, 1, 1, 1,
-0.8351696, -0.6249273, -1.664822, 1, 1, 1, 1, 1,
-0.8345801, -0.2650298, -0.768022, 1, 1, 1, 1, 1,
-0.8343477, 0.4018084, -2.591528, 1, 1, 1, 1, 1,
-0.834154, -0.8210222, -1.574192, 1, 1, 1, 1, 1,
-0.8335518, -1.430935, -3.152886, 1, 1, 1, 1, 1,
-0.8279554, 1.52708, 0.4605049, 1, 1, 1, 1, 1,
-0.8271307, -0.3743311, -1.641222, 1, 1, 1, 1, 1,
-0.8195912, -0.2364558, -2.239128, 1, 1, 1, 1, 1,
-0.8174239, 0.1318997, -1.644784, 1, 1, 1, 1, 1,
-0.8161626, -1.735021, -2.812337, 1, 1, 1, 1, 1,
-0.8068568, 0.06461454, -1.348184, 1, 1, 1, 1, 1,
-0.8067391, -0.04347638, -3.320653, 1, 1, 1, 1, 1,
-0.8043013, 0.9478254, -0.7382969, 0, 0, 1, 1, 1,
-0.7953885, 1.579373, -1.112118, 1, 0, 0, 1, 1,
-0.7909388, 0.2273578, -1.590156, 1, 0, 0, 1, 1,
-0.7908416, -0.01758141, -2.452085, 1, 0, 0, 1, 1,
-0.788114, -1.041978, -0.8272518, 1, 0, 0, 1, 1,
-0.7813661, -0.4510722, -1.206582, 1, 0, 0, 1, 1,
-0.7724389, -0.07221889, -0.1406268, 0, 0, 0, 1, 1,
-0.7724237, 0.1176326, -2.177719, 0, 0, 0, 1, 1,
-0.7697871, 0.7861344, 0.8579738, 0, 0, 0, 1, 1,
-0.7683586, 0.1449138, -0.940179, 0, 0, 0, 1, 1,
-0.763683, 0.7901964, -1.998359, 0, 0, 0, 1, 1,
-0.7631578, -1.025782, -3.549296, 0, 0, 0, 1, 1,
-0.7620499, -0.1107863, -4.050846, 0, 0, 0, 1, 1,
-0.7611431, 0.3863177, -0.4896477, 1, 1, 1, 1, 1,
-0.7608806, -0.6288069, -1.848929, 1, 1, 1, 1, 1,
-0.7547224, 1.126027, -3.07522e-05, 1, 1, 1, 1, 1,
-0.7531002, -0.3705772, -2.514727, 1, 1, 1, 1, 1,
-0.7377359, -0.4677284, -2.688344, 1, 1, 1, 1, 1,
-0.7367135, 0.6288024, -0.812598, 1, 1, 1, 1, 1,
-0.7357481, -0.7288606, -1.911218, 1, 1, 1, 1, 1,
-0.7345744, -1.091143, -3.733979, 1, 1, 1, 1, 1,
-0.7332522, -0.1921772, -1.797777, 1, 1, 1, 1, 1,
-0.7215042, 1.834831, -0.9559643, 1, 1, 1, 1, 1,
-0.7207003, -0.8284872, -1.649538, 1, 1, 1, 1, 1,
-0.7174333, -0.2234159, -0.7921587, 1, 1, 1, 1, 1,
-0.7162814, -1.06316, -2.547454, 1, 1, 1, 1, 1,
-0.7131963, -1.849888, -2.685637, 1, 1, 1, 1, 1,
-0.7064981, -0.3085553, 0.4109491, 1, 1, 1, 1, 1,
-0.7019877, -1.386434, -0.9703924, 0, 0, 1, 1, 1,
-0.6997761, -1.259844, -2.434954, 1, 0, 0, 1, 1,
-0.6982729, -1.349115, -2.925347, 1, 0, 0, 1, 1,
-0.6930276, 1.328444, 0.6998775, 1, 0, 0, 1, 1,
-0.6855179, 0.7048119, -0.55739, 1, 0, 0, 1, 1,
-0.6854866, 1.264879, -0.07663798, 1, 0, 0, 1, 1,
-0.6844849, 1.073146, -2.640378, 0, 0, 0, 1, 1,
-0.6829286, -0.1720936, -1.364069, 0, 0, 0, 1, 1,
-0.6791448, 0.4196286, -0.299044, 0, 0, 0, 1, 1,
-0.6748853, 0.3058174, -0.2861405, 0, 0, 0, 1, 1,
-0.6718962, 0.08500052, 0.3547767, 0, 0, 0, 1, 1,
-0.668476, 0.3239595, -1.27117, 0, 0, 0, 1, 1,
-0.6645142, -0.4718539, -2.033086, 0, 0, 0, 1, 1,
-0.6551544, 1.1502, -0.342351, 1, 1, 1, 1, 1,
-0.6499615, -0.8927613, -2.404299, 1, 1, 1, 1, 1,
-0.6413254, -0.05405696, -1.707942, 1, 1, 1, 1, 1,
-0.6407596, -1.068258, -3.728927, 1, 1, 1, 1, 1,
-0.6352689, 0.2176453, -1.86035, 1, 1, 1, 1, 1,
-0.6322442, 1.75221, 0.636223, 1, 1, 1, 1, 1,
-0.6291646, -0.9325686, -2.654727, 1, 1, 1, 1, 1,
-0.6279505, -0.8970225, -1.65602, 1, 1, 1, 1, 1,
-0.6243808, -1.133026, -0.6233583, 1, 1, 1, 1, 1,
-0.6237276, -0.0007598718, -1.662534, 1, 1, 1, 1, 1,
-0.6226146, 0.3286374, -1.589066, 1, 1, 1, 1, 1,
-0.6187946, 0.6355363, -0.0497662, 1, 1, 1, 1, 1,
-0.6124316, 0.4105521, -0.1254961, 1, 1, 1, 1, 1,
-0.6095755, -1.276196, -2.992801, 1, 1, 1, 1, 1,
-0.6077728, 0.4247692, -0.9620897, 1, 1, 1, 1, 1,
-0.6009637, 0.6829644, -0.5462527, 0, 0, 1, 1, 1,
-0.5986425, 0.1403198, -3.288063, 1, 0, 0, 1, 1,
-0.5968761, -0.3402958, -4.67325, 1, 0, 0, 1, 1,
-0.5945168, -1.009339, -3.114318, 1, 0, 0, 1, 1,
-0.5923798, -0.9939244, -3.354545, 1, 0, 0, 1, 1,
-0.5896643, -1.156183, -3.205452, 1, 0, 0, 1, 1,
-0.5890785, -0.6711563, -3.025573, 0, 0, 0, 1, 1,
-0.5821619, 1.096065, -1.827805, 0, 0, 0, 1, 1,
-0.5800076, -0.2337596, -1.456378, 0, 0, 0, 1, 1,
-0.5792822, 1.344862, 0.1165791, 0, 0, 0, 1, 1,
-0.5716327, -0.2371354, -2.046492, 0, 0, 0, 1, 1,
-0.5572336, -0.2434993, -2.386759, 0, 0, 0, 1, 1,
-0.5514734, -0.211128, -1.512708, 0, 0, 0, 1, 1,
-0.5492645, 0.521293, -3.267279, 1, 1, 1, 1, 1,
-0.5466475, -0.2733642, -0.3597449, 1, 1, 1, 1, 1,
-0.5444789, 0.2682284, -0.5166717, 1, 1, 1, 1, 1,
-0.5402461, 1.391828, 0.7580041, 1, 1, 1, 1, 1,
-0.5378119, -0.3363618, -3.443727, 1, 1, 1, 1, 1,
-0.5360376, 0.9204985, -0.7839803, 1, 1, 1, 1, 1,
-0.5352046, 0.3808806, -0.8203168, 1, 1, 1, 1, 1,
-0.5350723, -0.9547496, -1.993169, 1, 1, 1, 1, 1,
-0.5283899, -0.07820712, -3.292499, 1, 1, 1, 1, 1,
-0.5269902, -0.08943891, -1.195888, 1, 1, 1, 1, 1,
-0.5254599, -1.687516, -4.787007, 1, 1, 1, 1, 1,
-0.5251941, -0.2343623, -3.588876, 1, 1, 1, 1, 1,
-0.5251091, 0.9328908, -0.8976688, 1, 1, 1, 1, 1,
-0.5229981, -0.450921, -3.546211, 1, 1, 1, 1, 1,
-0.5229765, 0.8629832, -1.226653, 1, 1, 1, 1, 1,
-0.5194495, 0.7061726, 0.2677276, 0, 0, 1, 1, 1,
-0.5167761, 0.1836816, -1.819813, 1, 0, 0, 1, 1,
-0.5166873, -0.3748555, -1.192805, 1, 0, 0, 1, 1,
-0.5166838, -0.5290862, -2.128137, 1, 0, 0, 1, 1,
-0.5127711, -0.3037517, -0.7159863, 1, 0, 0, 1, 1,
-0.5113173, 0.5317371, -0.4863048, 1, 0, 0, 1, 1,
-0.5099869, -0.7994323, -2.972917, 0, 0, 0, 1, 1,
-0.5072996, -1.255425, -4.153687, 0, 0, 0, 1, 1,
-0.5012309, 1.393979, 0.0008406204, 0, 0, 0, 1, 1,
-0.4991543, -0.6956167, -3.092456, 0, 0, 0, 1, 1,
-0.4944313, 1.988959, -0.2859286, 0, 0, 0, 1, 1,
-0.4920028, 0.4976288, 0.1363692, 0, 0, 0, 1, 1,
-0.4904772, 0.3025409, -1.33581, 0, 0, 0, 1, 1,
-0.4903426, -1.438543, -4.761179, 1, 1, 1, 1, 1,
-0.4903142, -0.3386861, -2.158064, 1, 1, 1, 1, 1,
-0.4898961, 0.6149119, -1.221905, 1, 1, 1, 1, 1,
-0.4892562, 1.586378, -1.708486, 1, 1, 1, 1, 1,
-0.4876442, -1.197082, -2.792009, 1, 1, 1, 1, 1,
-0.4870477, 0.4934019, -0.5832954, 1, 1, 1, 1, 1,
-0.4867449, 1.083661, -1.618045, 1, 1, 1, 1, 1,
-0.4862091, 0.2988327, -1.382429, 1, 1, 1, 1, 1,
-0.4856932, -0.5142589, -2.540181, 1, 1, 1, 1, 1,
-0.4832138, -1.416607, -2.741087, 1, 1, 1, 1, 1,
-0.4831141, 0.5011067, -0.5463085, 1, 1, 1, 1, 1,
-0.4815369, 0.74866, 0.8023301, 1, 1, 1, 1, 1,
-0.4801815, -0.390557, -1.808374, 1, 1, 1, 1, 1,
-0.4793322, -0.9435912, -1.179263, 1, 1, 1, 1, 1,
-0.4782704, -0.9910552, -2.918884, 1, 1, 1, 1, 1,
-0.4741175, 0.6863505, -0.3337218, 0, 0, 1, 1, 1,
-0.4734313, -0.5223963, -2.130517, 1, 0, 0, 1, 1,
-0.4724782, 0.5107733, -1.343785, 1, 0, 0, 1, 1,
-0.471735, -0.4281614, -1.425834, 1, 0, 0, 1, 1,
-0.4683982, 1.234269, -1.483567, 1, 0, 0, 1, 1,
-0.4603108, 1.200686, -0.05662218, 1, 0, 0, 1, 1,
-0.4590867, 2.404241, -0.3828864, 0, 0, 0, 1, 1,
-0.4461558, 0.6959583, 0.331101, 0, 0, 0, 1, 1,
-0.4444568, -0.6038966, -2.620964, 0, 0, 0, 1, 1,
-0.442566, -0.9160997, -1.720115, 0, 0, 0, 1, 1,
-0.4415627, -0.1505529, -1.48046, 0, 0, 0, 1, 1,
-0.4390953, 0.2030996, -0.765373, 0, 0, 0, 1, 1,
-0.4369071, -0.08023915, -2.1782, 0, 0, 0, 1, 1,
-0.4347468, -0.89599, -0.2351897, 1, 1, 1, 1, 1,
-0.42932, 1.43341, -0.06328431, 1, 1, 1, 1, 1,
-0.428608, 0.8678584, 0.1259278, 1, 1, 1, 1, 1,
-0.4240889, 0.9555659, -0.8313794, 1, 1, 1, 1, 1,
-0.4221329, 0.3768097, -1.040289, 1, 1, 1, 1, 1,
-0.4181667, 0.3595353, -0.3100913, 1, 1, 1, 1, 1,
-0.4100232, -0.942737, -4.519876, 1, 1, 1, 1, 1,
-0.4069168, 0.06300604, -1.044425, 1, 1, 1, 1, 1,
-0.4066963, -0.5170647, -1.710411, 1, 1, 1, 1, 1,
-0.4015515, 0.9706395, -0.8872129, 1, 1, 1, 1, 1,
-0.4007781, -0.129198, -1.284113, 1, 1, 1, 1, 1,
-0.3999705, 1.007353, 1.619497, 1, 1, 1, 1, 1,
-0.3907419, -0.5762445, -2.15361, 1, 1, 1, 1, 1,
-0.3864775, -1.094195, -2.656623, 1, 1, 1, 1, 1,
-0.38501, -1.580285, -4.199822, 1, 1, 1, 1, 1,
-0.3809076, 1.82593, -0.712375, 0, 0, 1, 1, 1,
-0.3803942, 0.8733924, -1.468552, 1, 0, 0, 1, 1,
-0.3776751, -0.6045036, -0.6210593, 1, 0, 0, 1, 1,
-0.3736697, 0.3275594, -0.6704346, 1, 0, 0, 1, 1,
-0.3698679, 0.1312657, -1.580908, 1, 0, 0, 1, 1,
-0.3670087, -0.8523763, -2.371906, 1, 0, 0, 1, 1,
-0.3665697, -0.5185159, -2.155719, 0, 0, 0, 1, 1,
-0.3658818, 0.1894775, -3.314494, 0, 0, 0, 1, 1,
-0.365687, 0.2660394, -2.962135, 0, 0, 0, 1, 1,
-0.3641933, 0.7493821, 0.1921888, 0, 0, 0, 1, 1,
-0.3635175, -1.41445, -3.234483, 0, 0, 0, 1, 1,
-0.3628891, -1.715496, -2.514747, 0, 0, 0, 1, 1,
-0.3617234, 1.254464, -1.174935, 0, 0, 0, 1, 1,
-0.3616269, -0.001898504, -1.355031, 1, 1, 1, 1, 1,
-0.3614021, 0.09575985, -0.8019359, 1, 1, 1, 1, 1,
-0.3572246, -1.669319, -2.854894, 1, 1, 1, 1, 1,
-0.3505637, -1.578081, -2.836642, 1, 1, 1, 1, 1,
-0.350077, 1.124958, 0.2760336, 1, 1, 1, 1, 1,
-0.3499204, 1.169538, -0.06113015, 1, 1, 1, 1, 1,
-0.3488749, 0.1680993, -1.771436, 1, 1, 1, 1, 1,
-0.3464239, 0.1288944, -1.397863, 1, 1, 1, 1, 1,
-0.3463528, 0.766336, 1.106826, 1, 1, 1, 1, 1,
-0.3452051, 0.1583741, -1.382145, 1, 1, 1, 1, 1,
-0.3448699, 0.1859705, 0.413917, 1, 1, 1, 1, 1,
-0.3432011, 0.1561969, -2.229379, 1, 1, 1, 1, 1,
-0.3424251, -0.3775641, -2.664634, 1, 1, 1, 1, 1,
-0.3418637, 1.358129, 1.226775, 1, 1, 1, 1, 1,
-0.3393106, -0.1830691, -2.482568, 1, 1, 1, 1, 1,
-0.3372209, -1.76145, -2.569065, 0, 0, 1, 1, 1,
-0.3333857, 1.553148, -0.1672753, 1, 0, 0, 1, 1,
-0.3330604, 0.27008, -0.7802289, 1, 0, 0, 1, 1,
-0.3284981, 1.783092, -0.5692146, 1, 0, 0, 1, 1,
-0.3206033, 0.1810094, -1.648401, 1, 0, 0, 1, 1,
-0.309019, -0.1564887, -1.891456, 1, 0, 0, 1, 1,
-0.3074397, -0.7808623, -4.601021, 0, 0, 0, 1, 1,
-0.3049866, 0.4230348, -0.8345196, 0, 0, 0, 1, 1,
-0.3005984, 0.2169897, -0.5341669, 0, 0, 0, 1, 1,
-0.2986662, 1.116132, 0.7172204, 0, 0, 0, 1, 1,
-0.2966482, 0.112416, -2.257425, 0, 0, 0, 1, 1,
-0.2935311, 2.075841, -0.1336667, 0, 0, 0, 1, 1,
-0.2908387, 3.151091, -0.589187, 0, 0, 0, 1, 1,
-0.288547, 1.149331, -0.2381952, 1, 1, 1, 1, 1,
-0.2855625, 2.04241, -0.2498021, 1, 1, 1, 1, 1,
-0.2850425, -1.151474, -1.579031, 1, 1, 1, 1, 1,
-0.2841976, 1.108644, 0.2197029, 1, 1, 1, 1, 1,
-0.2800663, -0.8790841, -4.602716, 1, 1, 1, 1, 1,
-0.2798017, 0.006796779, -2.551431, 1, 1, 1, 1, 1,
-0.2766317, -0.09169007, -1.850224, 1, 1, 1, 1, 1,
-0.2669463, -1.389033, -4.578881, 1, 1, 1, 1, 1,
-0.2553236, -0.6089875, -3.42749, 1, 1, 1, 1, 1,
-0.2542459, 1.233121, -0.5679059, 1, 1, 1, 1, 1,
-0.2483777, -0.304932, -2.501009, 1, 1, 1, 1, 1,
-0.246911, -0.9252158, -4.202016, 1, 1, 1, 1, 1,
-0.2434279, 0.6048254, 1.616801, 1, 1, 1, 1, 1,
-0.2419801, 0.04656269, -2.172094, 1, 1, 1, 1, 1,
-0.2403079, 0.07032013, -3.048931, 1, 1, 1, 1, 1,
-0.2368891, -1.322633, -2.837099, 0, 0, 1, 1, 1,
-0.2367298, 1.458823, -1.360817, 1, 0, 0, 1, 1,
-0.2337952, -1.190292, -3.956843, 1, 0, 0, 1, 1,
-0.2150998, 0.318755, 2.771949, 1, 0, 0, 1, 1,
-0.2137008, 0.3036097, -0.9644451, 1, 0, 0, 1, 1,
-0.206922, -1.23955, -1.790387, 1, 0, 0, 1, 1,
-0.2036873, -0.8379201, -3.743555, 0, 0, 0, 1, 1,
-0.2025367, -1.084538, -3.30927, 0, 0, 0, 1, 1,
-0.2012864, -1.343685, -4.439137, 0, 0, 0, 1, 1,
-0.1993818, -0.4016187, -1.551732, 0, 0, 0, 1, 1,
-0.1982127, -0.2444006, -2.126205, 0, 0, 0, 1, 1,
-0.1978717, -1.346687, -1.982377, 0, 0, 0, 1, 1,
-0.193054, -0.03958154, -2.24509, 0, 0, 0, 1, 1,
-0.1875613, 0.2063311, -0.8072343, 1, 1, 1, 1, 1,
-0.1837787, -0.3306158, 0.114778, 1, 1, 1, 1, 1,
-0.1836924, 1.809053, 0.06487519, 1, 1, 1, 1, 1,
-0.1814569, -1.559253, -1.11622, 1, 1, 1, 1, 1,
-0.1773874, -1.466981, -2.873925, 1, 1, 1, 1, 1,
-0.1760169, 0.1803804, -1.201779, 1, 1, 1, 1, 1,
-0.174662, 0.9417995, -1.151017, 1, 1, 1, 1, 1,
-0.1736659, 1.262663, 0.08260486, 1, 1, 1, 1, 1,
-0.1677349, -0.4870483, -1.755339, 1, 1, 1, 1, 1,
-0.1639919, -0.8666048, -2.031206, 1, 1, 1, 1, 1,
-0.1594461, -0.1587706, -2.212553, 1, 1, 1, 1, 1,
-0.1572906, -0.1978049, -0.6793802, 1, 1, 1, 1, 1,
-0.1563758, -1.54665, -2.037841, 1, 1, 1, 1, 1,
-0.1550239, -1.598397, -4.133343, 1, 1, 1, 1, 1,
-0.1532441, -0.339072, -4.066793, 1, 1, 1, 1, 1,
-0.1520384, 0.3594097, 0.4741957, 0, 0, 1, 1, 1,
-0.1465309, 0.02250422, -0.6830094, 1, 0, 0, 1, 1,
-0.1440467, -0.5659315, -1.922265, 1, 0, 0, 1, 1,
-0.1436955, -1.078922, -2.914135, 1, 0, 0, 1, 1,
-0.1436182, -0.7084257, -1.245875, 1, 0, 0, 1, 1,
-0.1426425, -0.3407733, -3.545085, 1, 0, 0, 1, 1,
-0.140784, 1.063823, 0.2275662, 0, 0, 0, 1, 1,
-0.1403406, -0.01947937, -2.21018, 0, 0, 0, 1, 1,
-0.1357027, -0.6082646, -2.445671, 0, 0, 0, 1, 1,
-0.1356235, -1.552714, -3.282144, 0, 0, 0, 1, 1,
-0.1354121, -0.04304977, -3.171399, 0, 0, 0, 1, 1,
-0.1319628, 1.306592, -1.069446, 0, 0, 0, 1, 1,
-0.1310517, -1.226517, -2.60457, 0, 0, 0, 1, 1,
-0.1292456, -0.4176386, -1.860629, 1, 1, 1, 1, 1,
-0.126346, -0.002713225, -2.956292, 1, 1, 1, 1, 1,
-0.1248283, 0.3250944, -0.9697931, 1, 1, 1, 1, 1,
-0.1238346, 0.3875675, -0.1694606, 1, 1, 1, 1, 1,
-0.1230654, -0.03061561, -0.8641373, 1, 1, 1, 1, 1,
-0.1221844, 0.3685398, 0.1584087, 1, 1, 1, 1, 1,
-0.1204409, 0.7758722, 0.2652286, 1, 1, 1, 1, 1,
-0.1170931, -1.361016, -3.919576, 1, 1, 1, 1, 1,
-0.1144356, -0.1539882, -3.063628, 1, 1, 1, 1, 1,
-0.1099814, -2.119, -3.001033, 1, 1, 1, 1, 1,
-0.1097471, 0.08427756, -2.527418, 1, 1, 1, 1, 1,
-0.1096143, 0.1459508, -1.09699, 1, 1, 1, 1, 1,
-0.1037727, -0.5850806, -3.636953, 1, 1, 1, 1, 1,
-0.1009435, -1.591567, -2.432312, 1, 1, 1, 1, 1,
-0.0966456, 0.4102303, -0.7376676, 1, 1, 1, 1, 1,
-0.09371551, -1.297167, -4.124823, 0, 0, 1, 1, 1,
-0.09347537, 1.458239, -1.005258, 1, 0, 0, 1, 1,
-0.09326158, 0.01544732, -3.75547, 1, 0, 0, 1, 1,
-0.09191718, 0.3961357, 1.477393, 1, 0, 0, 1, 1,
-0.09053635, -0.1310415, -2.267831, 1, 0, 0, 1, 1,
-0.08901989, 0.1803816, -0.8525366, 1, 0, 0, 1, 1,
-0.08530314, -0.3005091, -0.7346739, 0, 0, 0, 1, 1,
-0.08460373, 1.839137, -0.01044633, 0, 0, 0, 1, 1,
-0.08321887, 0.3189311, -0.2960684, 0, 0, 0, 1, 1,
-0.08058863, -0.5888444, -2.934774, 0, 0, 0, 1, 1,
-0.08032443, 0.3670668, -0.5886877, 0, 0, 0, 1, 1,
-0.0785458, -1.866113, -4.651262, 0, 0, 0, 1, 1,
-0.07744704, -0.7348068, -1.349296, 0, 0, 0, 1, 1,
-0.07313638, -0.05020958, -2.221245, 1, 1, 1, 1, 1,
-0.07245775, 0.7659782, 0.5557055, 1, 1, 1, 1, 1,
-0.06574488, -0.3496943, -1.438637, 1, 1, 1, 1, 1,
-0.06557869, 0.8962488, 0.246609, 1, 1, 1, 1, 1,
-0.06479164, -1.841177, -2.767121, 1, 1, 1, 1, 1,
-0.0631241, -0.7922177, -1.263521, 1, 1, 1, 1, 1,
-0.06221465, -0.1753486, -4.273584, 1, 1, 1, 1, 1,
-0.06171529, 1.47759, -0.1352925, 1, 1, 1, 1, 1,
-0.06147218, 0.4654067, -1.457874, 1, 1, 1, 1, 1,
-0.06102308, 0.09085158, -0.2558496, 1, 1, 1, 1, 1,
-0.05964684, -1.57978, -3.976796, 1, 1, 1, 1, 1,
-0.0568103, 0.6859382, -2.651654, 1, 1, 1, 1, 1,
-0.05644643, -0.8296167, -3.043287, 1, 1, 1, 1, 1,
-0.05558439, -1.040808, -4.528657, 1, 1, 1, 1, 1,
-0.05152383, 0.2392039, 1.513985, 1, 1, 1, 1, 1,
-0.05027342, 0.3568071, 1.070338, 0, 0, 1, 1, 1,
-0.05024297, 1.800386, 1.310181, 1, 0, 0, 1, 1,
-0.04958588, 0.7909248, -0.07318111, 1, 0, 0, 1, 1,
-0.04684805, 1.483918, -2.0748, 1, 0, 0, 1, 1,
-0.04080618, -1.390938, -4.785733, 1, 0, 0, 1, 1,
-0.04027718, 0.7440634, 0.4228637, 1, 0, 0, 1, 1,
-0.03978711, 0.136184, 0.5064358, 0, 0, 0, 1, 1,
-0.03925201, 0.4641032, -1.156812, 0, 0, 0, 1, 1,
-0.03832866, -0.8578894, -3.33289, 0, 0, 0, 1, 1,
-0.03539999, -1.180743, -1.066331, 0, 0, 0, 1, 1,
-0.03519278, -1.047384, -4.853132, 0, 0, 0, 1, 1,
-0.03513598, 0.6040722, -1.19244, 0, 0, 0, 1, 1,
-0.03403084, -2.406998, -2.453178, 0, 0, 0, 1, 1,
-0.0328598, -1.32887, -3.543493, 1, 1, 1, 1, 1,
-0.03005511, -0.7058345, -5.370148, 1, 1, 1, 1, 1,
-0.02824519, -0.2557847, -1.566331, 1, 1, 1, 1, 1,
-0.02667311, 0.07953314, 0.7827184, 1, 1, 1, 1, 1,
-0.0177369, -0.9942484, -3.916276, 1, 1, 1, 1, 1,
-0.01223921, -1.176298, -5.362005, 1, 1, 1, 1, 1,
-0.009801944, 0.2349564, 1.895211, 1, 1, 1, 1, 1,
-0.00919289, 1.130601, 1.133916, 1, 1, 1, 1, 1,
-0.006774248, -0.1875357, -2.13295, 1, 1, 1, 1, 1,
0.004137626, 0.6051461, -0.225179, 1, 1, 1, 1, 1,
0.004860307, 0.8228365, -0.8672977, 1, 1, 1, 1, 1,
0.004945021, -0.405777, 2.964784, 1, 1, 1, 1, 1,
0.008316958, 0.4428445, 0.4228328, 1, 1, 1, 1, 1,
0.01081238, 0.7076235, -0.08111107, 1, 1, 1, 1, 1,
0.0120986, 0.2790391, -0.9025785, 1, 1, 1, 1, 1,
0.01507457, -0.1067939, 4.44869, 0, 0, 1, 1, 1,
0.01561597, 0.1150289, -0.1783805, 1, 0, 0, 1, 1,
0.01963775, 0.9802244, 0.06153885, 1, 0, 0, 1, 1,
0.01965196, -1.292358, 5.611644, 1, 0, 0, 1, 1,
0.02167955, 1.967021, 1.382044, 1, 0, 0, 1, 1,
0.02989143, 0.7194995, 0.3073608, 1, 0, 0, 1, 1,
0.03735128, 0.03799399, 0.3581322, 0, 0, 0, 1, 1,
0.03797395, -0.6090994, 1.331919, 0, 0, 0, 1, 1,
0.04720967, -3.143675, 4.0653, 0, 0, 0, 1, 1,
0.04814534, -0.9523292, 0.8774692, 0, 0, 0, 1, 1,
0.04912497, -2.077325, 1.466881, 0, 0, 0, 1, 1,
0.04923288, 0.1618272, 0.2143939, 0, 0, 0, 1, 1,
0.04946442, -1.335169, 2.074379, 0, 0, 0, 1, 1,
0.05113148, -1.254104, 4.07227, 1, 1, 1, 1, 1,
0.05489833, -1.09018, 3.344663, 1, 1, 1, 1, 1,
0.0630354, -0.6852941, 2.794466, 1, 1, 1, 1, 1,
0.06359335, -0.3393603, 2.146012, 1, 1, 1, 1, 1,
0.0651112, -1.277895, 3.121257, 1, 1, 1, 1, 1,
0.06784017, 0.9198624, -0.8078479, 1, 1, 1, 1, 1,
0.07276416, -0.7420084, 3.889414, 1, 1, 1, 1, 1,
0.07369151, 0.5718469, 1.607015, 1, 1, 1, 1, 1,
0.07427435, 0.1154857, -1.008619, 1, 1, 1, 1, 1,
0.07603336, -1.929769, 0.9643728, 1, 1, 1, 1, 1,
0.07671279, -1.151066, 4.928341, 1, 1, 1, 1, 1,
0.07810631, -1.44869, 3.722996, 1, 1, 1, 1, 1,
0.07969932, -0.5563526, 3.75283, 1, 1, 1, 1, 1,
0.08025128, 0.7043205, -0.9674211, 1, 1, 1, 1, 1,
0.08157282, 0.2748566, 1.123207, 1, 1, 1, 1, 1,
0.08284103, -0.06517341, 1.826178, 0, 0, 1, 1, 1,
0.0830553, 1.126839, -1.25087, 1, 0, 0, 1, 1,
0.08458742, -0.2009642, 2.235804, 1, 0, 0, 1, 1,
0.08746241, -1.267458, 2.963142, 1, 0, 0, 1, 1,
0.09212613, 0.08780672, -0.1092359, 1, 0, 0, 1, 1,
0.09230843, -0.9665855, 0.1658127, 1, 0, 0, 1, 1,
0.09328517, 0.6396984, 0.4274758, 0, 0, 0, 1, 1,
0.09584259, -0.8409368, 3.919367, 0, 0, 0, 1, 1,
0.09961394, -0.6352343, 4.074475, 0, 0, 0, 1, 1,
0.1039924, 1.342735, -1.186901, 0, 0, 0, 1, 1,
0.1046353, -1.156657, 1.165961, 0, 0, 0, 1, 1,
0.1055126, 1.335094, -0.5338177, 0, 0, 0, 1, 1,
0.1055819, 0.1619233, -0.426508, 0, 0, 0, 1, 1,
0.1092261, -0.7005129, 2.717806, 1, 1, 1, 1, 1,
0.1139196, -1.302436, 2.081089, 1, 1, 1, 1, 1,
0.1166036, 0.8041494, 1.647139, 1, 1, 1, 1, 1,
0.1181891, -2.03807, 3.53688, 1, 1, 1, 1, 1,
0.1189148, -1.386221, 4.581383, 1, 1, 1, 1, 1,
0.1251732, 0.1808938, 0.8691119, 1, 1, 1, 1, 1,
0.1283384, -1.422574, 3.943378, 1, 1, 1, 1, 1,
0.1320283, 1.528886, 1.365198, 1, 1, 1, 1, 1,
0.1326426, 0.7202033, 0.3151653, 1, 1, 1, 1, 1,
0.1362704, -1.022726, 2.311287, 1, 1, 1, 1, 1,
0.1393905, 0.7614071, 0.7306986, 1, 1, 1, 1, 1,
0.1398955, 0.4039763, -0.5723453, 1, 1, 1, 1, 1,
0.1409678, -0.4237309, 2.347397, 1, 1, 1, 1, 1,
0.1421294, -1.893206, 0.9107745, 1, 1, 1, 1, 1,
0.1439188, 0.05887566, 0.8586728, 1, 1, 1, 1, 1,
0.1448116, 0.6659512, -0.09676541, 0, 0, 1, 1, 1,
0.148618, -2.8141, 2.435329, 1, 0, 0, 1, 1,
0.1500757, 1.21364, -0.8921233, 1, 0, 0, 1, 1,
0.1532852, 0.2512648, 1.470359, 1, 0, 0, 1, 1,
0.1545554, 1.035123, 1.434967, 1, 0, 0, 1, 1,
0.1581133, -0.1268717, 2.035178, 1, 0, 0, 1, 1,
0.1585641, 0.2652611, 0.7496153, 0, 0, 0, 1, 1,
0.1599792, -0.4673198, 3.885841, 0, 0, 0, 1, 1,
0.1634399, 1.04469, 1.415926, 0, 0, 0, 1, 1,
0.1638002, 2.206941, 0.6116478, 0, 0, 0, 1, 1,
0.1684066, -1.248736, 1.942076, 0, 0, 0, 1, 1,
0.1711307, -0.2066885, 2.526464, 0, 0, 0, 1, 1,
0.17515, -0.5095838, 3.933646, 0, 0, 0, 1, 1,
0.1754144, -0.4471357, 3.993042, 1, 1, 1, 1, 1,
0.1773875, 0.05007741, -0.08092324, 1, 1, 1, 1, 1,
0.1778642, 0.6101361, 0.01920855, 1, 1, 1, 1, 1,
0.1791724, 0.5004267, 1.036043, 1, 1, 1, 1, 1,
0.1843487, 0.2119109, 0.1526294, 1, 1, 1, 1, 1,
0.1891424, -0.5356539, 1.448898, 1, 1, 1, 1, 1,
0.1996452, -2.27342, 1.763537, 1, 1, 1, 1, 1,
0.2031722, 2.126776, 0.08112408, 1, 1, 1, 1, 1,
0.2038495, 1.412576, -0.8923478, 1, 1, 1, 1, 1,
0.2040779, 0.3494746, 0.2923889, 1, 1, 1, 1, 1,
0.2190954, 0.761893, -1.062644, 1, 1, 1, 1, 1,
0.2202766, 1.717215, -0.6187256, 1, 1, 1, 1, 1,
0.222459, -0.1949507, 1.553178, 1, 1, 1, 1, 1,
0.2240299, -0.2502056, 3.824584, 1, 1, 1, 1, 1,
0.2256611, -1.223281, 3.746522, 1, 1, 1, 1, 1,
0.2256663, 0.7219335, 0.4493709, 0, 0, 1, 1, 1,
0.2260294, 0.8025725, -0.3746685, 1, 0, 0, 1, 1,
0.2305644, -0.2392403, 1.496111, 1, 0, 0, 1, 1,
0.2314525, -0.4528229, 1.981405, 1, 0, 0, 1, 1,
0.2325457, -1.157093, 1.145315, 1, 0, 0, 1, 1,
0.2392078, -0.3107155, 1.591182, 1, 0, 0, 1, 1,
0.2433887, 1.554317, 2.09113, 0, 0, 0, 1, 1,
0.2464994, -0.8768489, 2.922545, 0, 0, 0, 1, 1,
0.2523852, 1.62755, -0.6067417, 0, 0, 0, 1, 1,
0.2554058, -1.869622, 2.517112, 0, 0, 0, 1, 1,
0.2557717, 0.1697205, 2.451212, 0, 0, 0, 1, 1,
0.2635163, 0.3133931, 0.9613134, 0, 0, 0, 1, 1,
0.2658807, -0.9722404, 4.514719, 0, 0, 0, 1, 1,
0.2678975, -0.1346194, 0.3621106, 1, 1, 1, 1, 1,
0.2709965, 0.2652183, 0.5024729, 1, 1, 1, 1, 1,
0.27175, 1.036733, -0.2398484, 1, 1, 1, 1, 1,
0.2721135, 2.306952, -0.9164782, 1, 1, 1, 1, 1,
0.2773669, -0.2870754, 2.110477, 1, 1, 1, 1, 1,
0.2778027, 0.524178, 1.832653, 1, 1, 1, 1, 1,
0.28035, -1.161528, 2.759643, 1, 1, 1, 1, 1,
0.2822925, -0.6781012, 2.126721, 1, 1, 1, 1, 1,
0.2873629, 0.8387352, -0.9063132, 1, 1, 1, 1, 1,
0.2895404, 1.399154, 1.21986, 1, 1, 1, 1, 1,
0.2935447, -1.208984, 2.270602, 1, 1, 1, 1, 1,
0.2945501, 0.8753718, 0.571537, 1, 1, 1, 1, 1,
0.2992773, -0.2176793, 1.485946, 1, 1, 1, 1, 1,
0.300305, 0.3820684, 1.786278, 1, 1, 1, 1, 1,
0.3117234, 0.4166217, -1.822515, 1, 1, 1, 1, 1,
0.3175376, 0.002749966, 3.103219, 0, 0, 1, 1, 1,
0.3202241, -0.5672329, 2.66869, 1, 0, 0, 1, 1,
0.3210607, 1.318885, 0.3686896, 1, 0, 0, 1, 1,
0.321504, -1.19143, 4.940888, 1, 0, 0, 1, 1,
0.3223838, 1.018041, -0.004848188, 1, 0, 0, 1, 1,
0.3260173, -0.09064573, 1.616418, 1, 0, 0, 1, 1,
0.328513, -2.579536, 0.8469313, 0, 0, 0, 1, 1,
0.3374608, -0.4716116, 1.553142, 0, 0, 0, 1, 1,
0.3402073, 0.8415945, -1.634693, 0, 0, 0, 1, 1,
0.3427669, 1.209178, 0.06894789, 0, 0, 0, 1, 1,
0.3428484, 2.930791, -0.4517406, 0, 0, 0, 1, 1,
0.3435217, -0.8660352, 3.024888, 0, 0, 0, 1, 1,
0.3442547, -0.5705731, 3.27491, 0, 0, 0, 1, 1,
0.3475299, -2.062453, 4.04913, 1, 1, 1, 1, 1,
0.3508888, -0.2428763, 0.09104209, 1, 1, 1, 1, 1,
0.352565, 0.4764966, 0.5548849, 1, 1, 1, 1, 1,
0.3533076, -1.550992, 4.467567, 1, 1, 1, 1, 1,
0.3623824, -1.311973, 2.851743, 1, 1, 1, 1, 1,
0.3666788, 0.983515, 0.1879742, 1, 1, 1, 1, 1,
0.3698974, -0.4250171, 3.342826, 1, 1, 1, 1, 1,
0.3731548, 0.3099989, 1.692387, 1, 1, 1, 1, 1,
0.3776299, 0.3737482, 1.341703, 1, 1, 1, 1, 1,
0.3806021, -0.1520941, 2.215989, 1, 1, 1, 1, 1,
0.381269, -1.279548, 2.01022, 1, 1, 1, 1, 1,
0.3814397, -0.7023416, 2.439313, 1, 1, 1, 1, 1,
0.3837666, -0.03493092, 3.043434, 1, 1, 1, 1, 1,
0.3858062, -2.599446, 1.227612, 1, 1, 1, 1, 1,
0.3872309, 0.5482988, 0.5124544, 1, 1, 1, 1, 1,
0.3882853, 0.3855238, 0.3188534, 0, 0, 1, 1, 1,
0.4022589, -0.09882309, 2.687505, 1, 0, 0, 1, 1,
0.4026753, 0.5755478, 0.5602339, 1, 0, 0, 1, 1,
0.4069735, -0.4491451, 0.8374788, 1, 0, 0, 1, 1,
0.4115726, 1.128937, 0.4761167, 1, 0, 0, 1, 1,
0.414169, 1.57088, -1.437475, 1, 0, 0, 1, 1,
0.4150964, 0.332748, 1.361008, 0, 0, 0, 1, 1,
0.4160428, -0.1776121, 1.334081, 0, 0, 0, 1, 1,
0.4166152, -0.8759037, 2.353176, 0, 0, 0, 1, 1,
0.4166248, -2.226695, 1.623202, 0, 0, 0, 1, 1,
0.4178441, 0.6890855, -1.041736, 0, 0, 0, 1, 1,
0.4220766, -0.9633576, 3.083066, 0, 0, 0, 1, 1,
0.4224058, 0.2335609, 0.4421597, 0, 0, 0, 1, 1,
0.4282339, 0.5917706, 0.6050322, 1, 1, 1, 1, 1,
0.4350147, 1.548153, 1.388582, 1, 1, 1, 1, 1,
0.4371564, 0.4828178, 0.4683848, 1, 1, 1, 1, 1,
0.4427518, -0.3617404, 1.910463, 1, 1, 1, 1, 1,
0.4443649, -0.1640266, 1.154176, 1, 1, 1, 1, 1,
0.4524935, 0.1027802, 1.938409, 1, 1, 1, 1, 1,
0.4561756, 0.04670532, 0.5267104, 1, 1, 1, 1, 1,
0.458335, -0.3674069, 5.312161, 1, 1, 1, 1, 1,
0.459249, -1.37231, 3.079083, 1, 1, 1, 1, 1,
0.4604732, -0.9355122, 3.671723, 1, 1, 1, 1, 1,
0.4612512, 0.3861466, 1.208659, 1, 1, 1, 1, 1,
0.4654571, -0.5517353, 1.937729, 1, 1, 1, 1, 1,
0.4661114, -1.091369, 3.021931, 1, 1, 1, 1, 1,
0.4662105, -1.028042, 2.276215, 1, 1, 1, 1, 1,
0.4683081, -0.2791614, 1.177289, 1, 1, 1, 1, 1,
0.4705932, 0.1740301, 1.284261, 0, 0, 1, 1, 1,
0.4831366, 0.2628272, 0.3291723, 1, 0, 0, 1, 1,
0.4865381, 0.197377, 0.5683815, 1, 0, 0, 1, 1,
0.4884161, 0.6323933, 0.4953544, 1, 0, 0, 1, 1,
0.4890504, 1.265756, -0.5461037, 1, 0, 0, 1, 1,
0.4925786, -0.8043111, 2.625154, 1, 0, 0, 1, 1,
0.4977784, 0.8574913, 2.217196, 0, 0, 0, 1, 1,
0.4991417, -1.189529, 4.15648, 0, 0, 0, 1, 1,
0.5002623, 0.5052662, 2.393668, 0, 0, 0, 1, 1,
0.500391, 1.186708, 1.501604, 0, 0, 0, 1, 1,
0.5019407, -0.2764233, 3.604566, 0, 0, 0, 1, 1,
0.5052529, -1.742091, 4.664511, 0, 0, 0, 1, 1,
0.5074552, -0.8884158, 1.081661, 0, 0, 0, 1, 1,
0.5129116, 0.3789622, 1.465523, 1, 1, 1, 1, 1,
0.5147365, 0.6188704, 1.150396, 1, 1, 1, 1, 1,
0.5176454, -0.5809034, 4.522596, 1, 1, 1, 1, 1,
0.5294329, -0.5413645, 2.510342, 1, 1, 1, 1, 1,
0.5301448, -0.2369936, 2.25896, 1, 1, 1, 1, 1,
0.5310404, 0.9820964, 1.509169, 1, 1, 1, 1, 1,
0.5421957, 1.102967, 0.6060277, 1, 1, 1, 1, 1,
0.5494581, -0.8649013, 1.17003, 1, 1, 1, 1, 1,
0.5508848, 0.3545861, 1.482832, 1, 1, 1, 1, 1,
0.5560527, -0.5077291, 1.422918, 1, 1, 1, 1, 1,
0.5577848, -0.1152768, 1.74379, 1, 1, 1, 1, 1,
0.5578905, 0.02842646, 2.316991, 1, 1, 1, 1, 1,
0.5615049, 0.4701543, 1.010602, 1, 1, 1, 1, 1,
0.5624558, -0.5464391, 3.788188, 1, 1, 1, 1, 1,
0.5667509, -0.4816832, 2.986271, 1, 1, 1, 1, 1,
0.5674071, -0.9506052, 6.012967, 0, 0, 1, 1, 1,
0.5676467, -0.03777748, 1.424874, 1, 0, 0, 1, 1,
0.5710992, 0.6806301, -0.2675964, 1, 0, 0, 1, 1,
0.5719666, -1.601791, 2.120832, 1, 0, 0, 1, 1,
0.577915, 0.5674553, 0.4510463, 1, 0, 0, 1, 1,
0.5831295, 0.02055672, 0.7710496, 1, 0, 0, 1, 1,
0.5860643, 0.08669233, 0.2159363, 0, 0, 0, 1, 1,
0.5894472, 0.795982, 0.6828298, 0, 0, 0, 1, 1,
0.5912146, 0.01488363, -0.08807927, 0, 0, 0, 1, 1,
0.5940561, 0.882872, 0.9452997, 0, 0, 0, 1, 1,
0.5992706, 0.1754746, 0.950387, 0, 0, 0, 1, 1,
0.6050469, -0.1898211, 1.677024, 0, 0, 0, 1, 1,
0.6079946, -1.118173, 2.848028, 0, 0, 0, 1, 1,
0.6106158, -0.8813053, 2.31195, 1, 1, 1, 1, 1,
0.6108505, 0.285812, 1.427682, 1, 1, 1, 1, 1,
0.6114078, -1.698565, 2.940369, 1, 1, 1, 1, 1,
0.6206356, -2.13094, 2.493403, 1, 1, 1, 1, 1,
0.6279342, 0.0788577, 0.5260894, 1, 1, 1, 1, 1,
0.6297235, 0.7734354, 0.7037259, 1, 1, 1, 1, 1,
0.6339954, 0.1549487, 1.397287, 1, 1, 1, 1, 1,
0.6356372, -0.2110061, 2.086874, 1, 1, 1, 1, 1,
0.6386366, -2.259899, 3.43877, 1, 1, 1, 1, 1,
0.6404367, 1.421795, 0.3016356, 1, 1, 1, 1, 1,
0.6417874, 0.4617419, 1.142285, 1, 1, 1, 1, 1,
0.6466126, 0.8398074, 0.6913255, 1, 1, 1, 1, 1,
0.6479338, -2.869014, 2.320969, 1, 1, 1, 1, 1,
0.6495328, -1.515528, 2.093932, 1, 1, 1, 1, 1,
0.6570852, -2.323841, 0.3354293, 1, 1, 1, 1, 1,
0.6578164, -0.749536, 2.436502, 0, 0, 1, 1, 1,
0.6617374, -1.547353, 2.376021, 1, 0, 0, 1, 1,
0.6699296, 1.227622, 0.4399367, 1, 0, 0, 1, 1,
0.6707591, -0.1465437, 4.257145, 1, 0, 0, 1, 1,
0.6750236, 0.2268017, 1.821463, 1, 0, 0, 1, 1,
0.6754346, 0.222814, 0.7063037, 1, 0, 0, 1, 1,
0.6777958, -0.7379948, 2.892648, 0, 0, 0, 1, 1,
0.6797444, -0.4197972, 2.111982, 0, 0, 0, 1, 1,
0.6811219, 1.41912, 2.180432, 0, 0, 0, 1, 1,
0.6855552, 0.7310116, 0.3657604, 0, 0, 0, 1, 1,
0.6874146, 0.7002805, 0.48896, 0, 0, 0, 1, 1,
0.6892629, 0.4753208, 1.057512, 0, 0, 0, 1, 1,
0.6964942, -0.5237237, 1.478874, 0, 0, 0, 1, 1,
0.6987685, 0.2843913, -0.03078913, 1, 1, 1, 1, 1,
0.6996347, 0.7753778, -1.376362, 1, 1, 1, 1, 1,
0.7036003, -0.3405502, 1.83024, 1, 1, 1, 1, 1,
0.7048749, 1.0902, 0.5733435, 1, 1, 1, 1, 1,
0.7080763, -0.9422124, 2.239264, 1, 1, 1, 1, 1,
0.7107265, 0.8477314, 1.235244, 1, 1, 1, 1, 1,
0.7146072, 0.2381074, -0.3909523, 1, 1, 1, 1, 1,
0.7154239, -1.496265, 0.01259405, 1, 1, 1, 1, 1,
0.7194878, -1.224793, 3.015547, 1, 1, 1, 1, 1,
0.720701, 0.6915503, 0.4300343, 1, 1, 1, 1, 1,
0.7241338, -1.639405, 2.978863, 1, 1, 1, 1, 1,
0.7263625, 0.614997, -0.06271112, 1, 1, 1, 1, 1,
0.7293517, -0.6279224, 3.034481, 1, 1, 1, 1, 1,
0.7311578, -0.4176665, 3.061647, 1, 1, 1, 1, 1,
0.7329485, 0.1786467, 1.541862, 1, 1, 1, 1, 1,
0.7342699, -1.76751, 3.88404, 0, 0, 1, 1, 1,
0.7434438, 0.5410713, 1.577785, 1, 0, 0, 1, 1,
0.7461422, -0.7184505, 2.400015, 1, 0, 0, 1, 1,
0.7475621, 1.647189, -0.3101836, 1, 0, 0, 1, 1,
0.7494088, 0.9324092, 0.1522702, 1, 0, 0, 1, 1,
0.7532032, -0.9261304, 2.148471, 1, 0, 0, 1, 1,
0.7564263, 0.5995451, 0.2906793, 0, 0, 0, 1, 1,
0.7573425, 0.5543998, 1.027897, 0, 0, 0, 1, 1,
0.7608305, -1.668638, 3.102476, 0, 0, 0, 1, 1,
0.7651844, 0.2935608, 1.850953, 0, 0, 0, 1, 1,
0.7708809, 0.3890709, -0.3866483, 0, 0, 0, 1, 1,
0.7762163, -0.8431078, 2.453665, 0, 0, 0, 1, 1,
0.7763016, -0.0794074, 2.117565, 0, 0, 0, 1, 1,
0.7765041, -0.3818893, 2.49194, 1, 1, 1, 1, 1,
0.7802125, -0.5986379, 1.514212, 1, 1, 1, 1, 1,
0.7899436, -1.261487, 2.385144, 1, 1, 1, 1, 1,
0.7946087, 0.2009557, 1.797834, 1, 1, 1, 1, 1,
0.7976149, 0.1099917, 0.7396289, 1, 1, 1, 1, 1,
0.8013787, 0.5730901, -0.3855675, 1, 1, 1, 1, 1,
0.8024604, 0.7639554, 1.090842, 1, 1, 1, 1, 1,
0.8054703, 0.6978974, 2.108088, 1, 1, 1, 1, 1,
0.8120219, 1.051637, 1.139026, 1, 1, 1, 1, 1,
0.8129141, 1.034194, -0.9805347, 1, 1, 1, 1, 1,
0.8141726, -0.9692355, 2.203534, 1, 1, 1, 1, 1,
0.819578, 0.1948325, 1.071616, 1, 1, 1, 1, 1,
0.821376, 1.252777, -0.5766335, 1, 1, 1, 1, 1,
0.8305067, -1.592245, 3.483542, 1, 1, 1, 1, 1,
0.8324925, -0.8918939, 3.663564, 1, 1, 1, 1, 1,
0.8341866, -0.1646721, 2.689889, 0, 0, 1, 1, 1,
0.8342199, 1.382995, 1.905349, 1, 0, 0, 1, 1,
0.8361138, 1.242485, 1.009558, 1, 0, 0, 1, 1,
0.8382092, -0.9652482, 2.525209, 1, 0, 0, 1, 1,
0.8391337, 1.004014, -0.4874497, 1, 0, 0, 1, 1,
0.8432792, -0.005582409, 0.4656574, 1, 0, 0, 1, 1,
0.8465568, -0.1603079, 2.217592, 0, 0, 0, 1, 1,
0.8510711, -1.520146, 1.803289, 0, 0, 0, 1, 1,
0.8520385, 0.8758782, -1.13607, 0, 0, 0, 1, 1,
0.8521004, 0.5207029, 1.887524, 0, 0, 0, 1, 1,
0.8563748, 1.109034, 0.9678754, 0, 0, 0, 1, 1,
0.8608152, 1.230471, -0.3695608, 0, 0, 0, 1, 1,
0.8678615, -1.226887, 2.329899, 0, 0, 0, 1, 1,
0.879469, 2.569023, 1.184599, 1, 1, 1, 1, 1,
0.879802, -1.620791, 2.939244, 1, 1, 1, 1, 1,
0.8861768, 1.440755, 0.03565213, 1, 1, 1, 1, 1,
0.8890218, 0.01301165, 1.495372, 1, 1, 1, 1, 1,
0.8936957, 0.8102981, 0.8104151, 1, 1, 1, 1, 1,
0.9013065, 1.190196, 1.857336, 1, 1, 1, 1, 1,
0.908066, -1.098086, 2.276025, 1, 1, 1, 1, 1,
0.9091648, -0.4052706, 2.502737, 1, 1, 1, 1, 1,
0.9092011, -0.2283446, 1.305091, 1, 1, 1, 1, 1,
0.9093392, 0.3662261, 1.526783, 1, 1, 1, 1, 1,
0.9123338, 0.470554, 1.893739, 1, 1, 1, 1, 1,
0.9126755, -0.5804607, 3.046114, 1, 1, 1, 1, 1,
0.9163951, -0.4420758, 2.668273, 1, 1, 1, 1, 1,
0.9219731, 0.7133406, -0.0267756, 1, 1, 1, 1, 1,
0.9227129, 1.54911, 0.8673471, 1, 1, 1, 1, 1,
0.9269833, 0.1982734, 1.441433, 0, 0, 1, 1, 1,
0.9278426, -0.2701941, 0.007435543, 1, 0, 0, 1, 1,
0.9485542, -1.134601, 1.806072, 1, 0, 0, 1, 1,
0.956082, 0.1677437, 0.4092886, 1, 0, 0, 1, 1,
0.9593303, 1.775411, 1.107701, 1, 0, 0, 1, 1,
0.9637048, -1.087413, 2.481285, 1, 0, 0, 1, 1,
0.9656112, -0.732336, 4.69069, 0, 0, 0, 1, 1,
0.9664192, -0.6506247, 2.770243, 0, 0, 0, 1, 1,
0.9665074, -1.407943, 2.239084, 0, 0, 0, 1, 1,
0.9687264, 1.163031, -0.7047242, 0, 0, 0, 1, 1,
0.9827647, -1.232946, 1.142735, 0, 0, 0, 1, 1,
0.9876208, 0.2494528, 2.885811, 0, 0, 0, 1, 1,
0.99282, 1.019621, 0.3202217, 0, 0, 0, 1, 1,
0.9944581, -0.5716727, 3.265097, 1, 1, 1, 1, 1,
1.008123, 1.140053, 0.7851623, 1, 1, 1, 1, 1,
1.020935, -2.539839, 3.558575, 1, 1, 1, 1, 1,
1.022737, 0.64557, 0.3366488, 1, 1, 1, 1, 1,
1.03372, -0.7206694, 3.364374, 1, 1, 1, 1, 1,
1.038975, 0.7111354, 0.9945073, 1, 1, 1, 1, 1,
1.054865, 0.2611011, 0.72724, 1, 1, 1, 1, 1,
1.057304, -0.1334981, 1.547083, 1, 1, 1, 1, 1,
1.059238, -0.2810747, 1.580839, 1, 1, 1, 1, 1,
1.069703, 1.419368, 1.527183, 1, 1, 1, 1, 1,
1.07341, 0.5978861, 1.656504, 1, 1, 1, 1, 1,
1.075137, -1.79892, 1.313146, 1, 1, 1, 1, 1,
1.080868, 0.3800757, 1.248638, 1, 1, 1, 1, 1,
1.091141, 1.844383, 1.931916, 1, 1, 1, 1, 1,
1.100526, 1.406644, 0.9260193, 1, 1, 1, 1, 1,
1.103155, 1.233845, 1.689972, 0, 0, 1, 1, 1,
1.10324, 0.842197, 1.183121, 1, 0, 0, 1, 1,
1.10938, -0.3937811, -0.2898087, 1, 0, 0, 1, 1,
1.115344, 0.7322288, 1.28345, 1, 0, 0, 1, 1,
1.118762, 2.139469, -0.9893401, 1, 0, 0, 1, 1,
1.129256, -0.8260224, 1.29821, 1, 0, 0, 1, 1,
1.136476, -2.058529, 3.889935, 0, 0, 0, 1, 1,
1.139418, 0.1839972, 0.1691719, 0, 0, 0, 1, 1,
1.143566, -2.331956, 3.43069, 0, 0, 0, 1, 1,
1.144038, -0.3777733, 1.751512, 0, 0, 0, 1, 1,
1.151426, 1.605364, 0.6846665, 0, 0, 0, 1, 1,
1.159735, 0.574298, 1.035414, 0, 0, 0, 1, 1,
1.165885, 0.09515315, 1.083079, 0, 0, 0, 1, 1,
1.168591, 1.002159, 0.4441443, 1, 1, 1, 1, 1,
1.170832, -0.4377341, 0.02809119, 1, 1, 1, 1, 1,
1.172899, 3.119805, -0.521291, 1, 1, 1, 1, 1,
1.178392, -0.08649208, 2.522092, 1, 1, 1, 1, 1,
1.179548, -0.6541981, 1.110249, 1, 1, 1, 1, 1,
1.186257, -2.151525, 3.766768, 1, 1, 1, 1, 1,
1.192978, 0.4391181, 0.624309, 1, 1, 1, 1, 1,
1.195761, 0.1330519, 0.8647119, 1, 1, 1, 1, 1,
1.198942, 0.2324266, -0.8845047, 1, 1, 1, 1, 1,
1.19984, -0.3524538, 1.149664, 1, 1, 1, 1, 1,
1.209429, 1.935633, -0.8504036, 1, 1, 1, 1, 1,
1.214137, -1.033938, 2.746072, 1, 1, 1, 1, 1,
1.214798, 0.5526992, 0.1877672, 1, 1, 1, 1, 1,
1.217691, -0.5075649, 1.833493, 1, 1, 1, 1, 1,
1.224395, 0.1024994, 2.282964, 1, 1, 1, 1, 1,
1.244516, 0.4803264, 1.180932, 0, 0, 1, 1, 1,
1.24511, -1.240608, 2.438821, 1, 0, 0, 1, 1,
1.24754, -0.929899, 4.028445, 1, 0, 0, 1, 1,
1.258104, -1.363177, 3.565418, 1, 0, 0, 1, 1,
1.259842, -0.4052581, 2.309041, 1, 0, 0, 1, 1,
1.260717, 0.29105, 1.265685, 1, 0, 0, 1, 1,
1.267639, 1.377074, 2.055738, 0, 0, 0, 1, 1,
1.271082, 0.5337926, 0.5425653, 0, 0, 0, 1, 1,
1.274365, 1.898062, 1.249486, 0, 0, 0, 1, 1,
1.275807, 0.1584909, 0.2877758, 0, 0, 0, 1, 1,
1.276346, 0.7515913, 1.553222, 0, 0, 0, 1, 1,
1.284762, 1.466392, 1.145076, 0, 0, 0, 1, 1,
1.285299, -0.7116902, 0.9420764, 0, 0, 0, 1, 1,
1.288512, -0.01871219, 2.825168, 1, 1, 1, 1, 1,
1.292541, -0.899589, 2.096164, 1, 1, 1, 1, 1,
1.320829, -0.3401062, 2.102811, 1, 1, 1, 1, 1,
1.343973, -1.640862, 2.232224, 1, 1, 1, 1, 1,
1.356112, 0.02883666, 0.2108167, 1, 1, 1, 1, 1,
1.367395, -0.2691255, 1.180747, 1, 1, 1, 1, 1,
1.371593, 1.016336, 0.1321462, 1, 1, 1, 1, 1,
1.378555, 0.2515079, 0.6529949, 1, 1, 1, 1, 1,
1.389704, -1.481963, 2.434995, 1, 1, 1, 1, 1,
1.427876, 0.9938969, -1.968442, 1, 1, 1, 1, 1,
1.432771, 0.9847027, 1.365729, 1, 1, 1, 1, 1,
1.435574, 1.27895, -0.1502659, 1, 1, 1, 1, 1,
1.436873, 0.6082018, 2.267259, 1, 1, 1, 1, 1,
1.438456, 0.9646584, 2.153892, 1, 1, 1, 1, 1,
1.441966, -0.1660141, 0.6685405, 1, 1, 1, 1, 1,
1.447001, 1.046536, 1.638221, 0, 0, 1, 1, 1,
1.450971, -0.4577974, 1.557071, 1, 0, 0, 1, 1,
1.453238, 0.4820504, 1.803213, 1, 0, 0, 1, 1,
1.468795, -0.5966886, 2.903817, 1, 0, 0, 1, 1,
1.477235, -1.084503, 3.47605, 1, 0, 0, 1, 1,
1.484308, -0.702691, 3.254538, 1, 0, 0, 1, 1,
1.495063, 0.3338786, 1.664574, 0, 0, 0, 1, 1,
1.497585, 0.6303543, 1.495166, 0, 0, 0, 1, 1,
1.506446, 1.087893, 0.4394622, 0, 0, 0, 1, 1,
1.511565, 0.2884607, 1.466556, 0, 0, 0, 1, 1,
1.521531, -0.9492945, 1.884787, 0, 0, 0, 1, 1,
1.524757, -0.7427713, 0.7725371, 0, 0, 0, 1, 1,
1.528556, 0.1428149, 1.892264, 0, 0, 0, 1, 1,
1.548907, -0.1160935, 2.821449, 1, 1, 1, 1, 1,
1.553461, -1.308108, 1.67292, 1, 1, 1, 1, 1,
1.56049, -0.7316889, 2.066107, 1, 1, 1, 1, 1,
1.5624, -0.6938401, -0.5264518, 1, 1, 1, 1, 1,
1.566782, 0.7076703, 1.273884, 1, 1, 1, 1, 1,
1.569462, -0.9984174, 0.9855675, 1, 1, 1, 1, 1,
1.584159, -1.039042, 2.888659, 1, 1, 1, 1, 1,
1.607995, -0.8409507, 2.076618, 1, 1, 1, 1, 1,
1.616552, -0.4890308, 0.7870458, 1, 1, 1, 1, 1,
1.61975, 1.062003, 2.502909, 1, 1, 1, 1, 1,
1.632425, 0.9334279, 1.597161, 1, 1, 1, 1, 1,
1.633598, -0.3821667, 1.868293, 1, 1, 1, 1, 1,
1.64168, 0.4872444, 1.649169, 1, 1, 1, 1, 1,
1.659768, 2.658074, 1.139727, 1, 1, 1, 1, 1,
1.668686, 1.454651, 0.7087976, 1, 1, 1, 1, 1,
1.668927, 1.962952, 0.3377711, 0, 0, 1, 1, 1,
1.673929, 0.8531682, 0.1908441, 1, 0, 0, 1, 1,
1.675283, 0.05141471, 2.638859, 1, 0, 0, 1, 1,
1.676003, 0.3728374, 0.1722578, 1, 0, 0, 1, 1,
1.695064, 0.5290294, 1.770769, 1, 0, 0, 1, 1,
1.70013, 0.6216156, 0.8442227, 1, 0, 0, 1, 1,
1.73462, -1.106924, 2.857808, 0, 0, 0, 1, 1,
1.756131, 1.732576, 2.494145, 0, 0, 0, 1, 1,
1.770824, -1.116537, 2.752494, 0, 0, 0, 1, 1,
1.80418, 1.980516, 2.458828, 0, 0, 0, 1, 1,
1.811456, -0.4681736, 1.438167, 0, 0, 0, 1, 1,
1.813406, -1.404637, 2.025526, 0, 0, 0, 1, 1,
1.822018, -0.307575, 0.691781, 0, 0, 0, 1, 1,
1.851787, 0.7753352, 0.4305682, 1, 1, 1, 1, 1,
1.875944, -0.6183984, 1.501805, 1, 1, 1, 1, 1,
1.876302, -0.9180481, 3.36636, 1, 1, 1, 1, 1,
1.878167, 0.4741105, 0.4495896, 1, 1, 1, 1, 1,
1.883207, 1.092633, 1.382037, 1, 1, 1, 1, 1,
1.903718, -2.228288, 0.9720297, 1, 1, 1, 1, 1,
1.909562, 0.2964934, 1.856828, 1, 1, 1, 1, 1,
1.972888, 0.3523835, 2.513194, 1, 1, 1, 1, 1,
1.978528, 0.5286338, 2.738003, 1, 1, 1, 1, 1,
1.986691, 0.7127094, 0.6976476, 1, 1, 1, 1, 1,
2.00654, -1.262543, -0.1559904, 1, 1, 1, 1, 1,
2.012106, 0.8906805, 1.974839, 1, 1, 1, 1, 1,
2.085914, -1.697983, 1.790347, 1, 1, 1, 1, 1,
2.0873, 0.4204853, 1.850888, 1, 1, 1, 1, 1,
2.119322, 0.2270342, 1.569228, 1, 1, 1, 1, 1,
2.12032, -0.0581446, 1.432734, 0, 0, 1, 1, 1,
2.131393, 0.6987029, 1.905879, 1, 0, 0, 1, 1,
2.137053, -1.316483, 3.427549, 1, 0, 0, 1, 1,
2.142291, 1.861406, -0.921046, 1, 0, 0, 1, 1,
2.168017, -0.2657636, 3.431613, 1, 0, 0, 1, 1,
2.178522, -0.01932903, 0.9547532, 1, 0, 0, 1, 1,
2.225924, -1.66011, 2.592245, 0, 0, 0, 1, 1,
2.255586, -2.023667, 0.8744222, 0, 0, 0, 1, 1,
2.279393, 0.7598066, 0.6869101, 0, 0, 0, 1, 1,
2.301495, 0.3003651, 3.210165, 0, 0, 0, 1, 1,
2.356804, 0.7438766, -0.2353086, 0, 0, 0, 1, 1,
2.371297, -1.151584, 0.03312925, 0, 0, 0, 1, 1,
2.631329, -1.245484, 3.894617, 0, 0, 0, 1, 1,
2.679452, -0.1109061, 2.174686, 1, 1, 1, 1, 1,
2.711149, -0.2782574, 1.208191, 1, 1, 1, 1, 1,
2.729704, 0.0577873, 1.747689, 1, 1, 1, 1, 1,
3.059493, 0.3135749, 0.9744267, 1, 1, 1, 1, 1,
3.579079, -1.849887, 1.569925, 1, 1, 1, 1, 1,
3.681027, 0.2079356, 2.434567, 1, 1, 1, 1, 1,
3.937207, -0.4306365, 1.41592, 1, 1, 1, 1, 1
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
var radius = 10.07679;
var distance = 35.39429;
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
mvMatrix.translate( -0.2530873, -0.003708124, -0.3214095 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.39429);
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
